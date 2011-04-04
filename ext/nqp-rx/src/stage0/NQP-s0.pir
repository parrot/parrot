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
.sub "_block11"  :anon :subid("10_1297880739.64186")
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
    $P1456 = $P14()
.annotate 'line', 1
    .return ($P1456)
    .const 'Sub' $P1458 = "377_1297880739.64186" 
    .return ($P1458)
.end


.namespace []
.sub "" :load :init :subid("post378") :outer("10_1297880739.64186")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880739.64186" 
    .local pmc block
    set block, $P12
    $P1461 = get_root_global ["parrot"], "P6metaclass"
    $P1461."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1297880739.64186") :outer("10_1297880739.64186")
.annotate 'line', 4
    get_hll_global $P1373, ["NQP";"Regex"], "_block1372" 
    capture_lex $P1373
    .const 'Sub' $P1359 = "354_1297880739.64186" 
    capture_lex $P1359
    .const 'Sub' $P1353 = "352_1297880739.64186" 
    capture_lex $P1353
    .const 'Sub' $P1347 = "350_1297880739.64186" 
    capture_lex $P1347
    .const 'Sub' $P1341 = "348_1297880739.64186" 
    capture_lex $P1341
    .const 'Sub' $P1335 = "346_1297880739.64186" 
    capture_lex $P1335
    .const 'Sub' $P1329 = "344_1297880739.64186" 
    capture_lex $P1329
    .const 'Sub' $P1322 = "342_1297880739.64186" 
    capture_lex $P1322
    .const 'Sub' $P1315 = "340_1297880739.64186" 
    capture_lex $P1315
    .const 'Sub' $P1308 = "338_1297880739.64186" 
    capture_lex $P1308
    .const 'Sub' $P1301 = "336_1297880739.64186" 
    capture_lex $P1301
    .const 'Sub' $P1295 = "334_1297880739.64186" 
    capture_lex $P1295
    .const 'Sub' $P1288 = "332_1297880739.64186" 
    capture_lex $P1288
    .const 'Sub' $P1281 = "330_1297880739.64186" 
    capture_lex $P1281
    .const 'Sub' $P1274 = "328_1297880739.64186" 
    capture_lex $P1274
    .const 'Sub' $P1267 = "326_1297880739.64186" 
    capture_lex $P1267
    .const 'Sub' $P1260 = "324_1297880739.64186" 
    capture_lex $P1260
    .const 'Sub' $P1253 = "322_1297880739.64186" 
    capture_lex $P1253
    .const 'Sub' $P1246 = "320_1297880739.64186" 
    capture_lex $P1246
    .const 'Sub' $P1239 = "318_1297880739.64186" 
    capture_lex $P1239
    .const 'Sub' $P1232 = "316_1297880739.64186" 
    capture_lex $P1232
    .const 'Sub' $P1225 = "314_1297880739.64186" 
    capture_lex $P1225
    .const 'Sub' $P1218 = "312_1297880739.64186" 
    capture_lex $P1218
    .const 'Sub' $P1211 = "310_1297880739.64186" 
    capture_lex $P1211
    .const 'Sub' $P1204 = "308_1297880739.64186" 
    capture_lex $P1204
    .const 'Sub' $P1197 = "306_1297880739.64186" 
    capture_lex $P1197
    .const 'Sub' $P1190 = "304_1297880739.64186" 
    capture_lex $P1190
    .const 'Sub' $P1183 = "302_1297880739.64186" 
    capture_lex $P1183
    .const 'Sub' $P1176 = "300_1297880739.64186" 
    capture_lex $P1176
    .const 'Sub' $P1169 = "298_1297880739.64186" 
    capture_lex $P1169
    .const 'Sub' $P1162 = "296_1297880739.64186" 
    capture_lex $P1162
    .const 'Sub' $P1155 = "294_1297880739.64186" 
    capture_lex $P1155
    .const 'Sub' $P1148 = "292_1297880739.64186" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "290_1297880739.64186" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "288_1297880739.64186" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "286_1297880739.64186" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "284_1297880739.64186" 
    capture_lex $P1120
    .const 'Sub' $P1113 = "282_1297880739.64186" 
    capture_lex $P1113
    .const 'Sub' $P1106 = "280_1297880739.64186" 
    capture_lex $P1106
    .const 'Sub' $P1099 = "278_1297880739.64186" 
    capture_lex $P1099
    .const 'Sub' $P1092 = "276_1297880739.64186" 
    capture_lex $P1092
    .const 'Sub' $P1086 = "274_1297880739.64186" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "272_1297880739.64186" 
    capture_lex $P1079
    .const 'Sub' $P1072 = "270_1297880739.64186" 
    capture_lex $P1072
    .const 'Sub' $P1065 = "268_1297880739.64186" 
    capture_lex $P1065
    .const 'Sub' $P1058 = "266_1297880739.64186" 
    capture_lex $P1058
    .const 'Sub' $P1051 = "264_1297880739.64186" 
    capture_lex $P1051
    .const 'Sub' $P1044 = "262_1297880739.64186" 
    capture_lex $P1044
    .const 'Sub' $P1037 = "260_1297880739.64186" 
    capture_lex $P1037
    .const 'Sub' $P1031 = "258_1297880739.64186" 
    capture_lex $P1031
    .const 'Sub' $P1025 = "256_1297880739.64186" 
    capture_lex $P1025
    .const 'Sub' $P1020 = "254_1297880739.64186" 
    capture_lex $P1020
    .const 'Sub' $P1014 = "252_1297880739.64186" 
    capture_lex $P1014
    .const 'Sub' $P1008 = "250_1297880739.64186" 
    capture_lex $P1008
    .const 'Sub' $P1003 = "248_1297880739.64186" 
    capture_lex $P1003
    .const 'Sub' $P998 = "246_1297880739.64186" 
    capture_lex $P998
    .const 'Sub' $P990 = "244_1297880739.64186" 
    capture_lex $P990
    .const 'Sub' $P981 = "242_1297880739.64186" 
    capture_lex $P981
    .const 'Sub' $P976 = "240_1297880739.64186" 
    capture_lex $P976
    .const 'Sub' $P971 = "238_1297880739.64186" 
    capture_lex $P971
    .const 'Sub' $P966 = "236_1297880739.64186" 
    capture_lex $P966
    .const 'Sub' $P958 = "234_1297880739.64186" 
    capture_lex $P958
    .const 'Sub' $P950 = "232_1297880739.64186" 
    capture_lex $P950
    .const 'Sub' $P945 = "230_1297880739.64186" 
    capture_lex $P945
    .const 'Sub' $P940 = "228_1297880739.64186" 
    capture_lex $P940
    .const 'Sub' $P935 = "226_1297880739.64186" 
    capture_lex $P935
    .const 'Sub' $P929 = "224_1297880739.64186" 
    capture_lex $P929
    .const 'Sub' $P923 = "222_1297880739.64186" 
    capture_lex $P923
    .const 'Sub' $P917 = "220_1297880739.64186" 
    capture_lex $P917
    .const 'Sub' $P911 = "218_1297880739.64186" 
    capture_lex $P911
    .const 'Sub' $P905 = "216_1297880739.64186" 
    capture_lex $P905
    .const 'Sub' $P900 = "214_1297880739.64186" 
    capture_lex $P900
    .const 'Sub' $P895 = "212_1297880739.64186" 
    capture_lex $P895
    .const 'Sub' $P883 = "208_1297880739.64186" 
    capture_lex $P883
    .const 'Sub' $P875 = "206_1297880739.64186" 
    capture_lex $P875
    .const 'Sub' $P869 = "204_1297880739.64186" 
    capture_lex $P869
    .const 'Sub' $P862 = "202_1297880739.64186" 
    capture_lex $P862
    .const 'Sub' $P856 = "200_1297880739.64186" 
    capture_lex $P856
    .const 'Sub' $P848 = "198_1297880739.64186" 
    capture_lex $P848
    .const 'Sub' $P840 = "196_1297880739.64186" 
    capture_lex $P840
    .const 'Sub' $P834 = "194_1297880739.64186" 
    capture_lex $P834
    .const 'Sub' $P828 = "192_1297880739.64186" 
    capture_lex $P828
    .const 'Sub' $P814 = "188_1297880739.64186" 
    capture_lex $P814
    .const 'Sub' $P773 = "186_1297880739.64186" 
    capture_lex $P773
    .const 'Sub' $P762 = "184_1297880739.64186" 
    capture_lex $P762
    .const 'Sub' $P750 = "180_1297880739.64186" 
    capture_lex $P750
    .const 'Sub' $P741 = "178_1297880739.64186" 
    capture_lex $P741
    .const 'Sub' $P735 = "176_1297880739.64186" 
    capture_lex $P735
    .const 'Sub' $P725 = "174_1297880739.64186" 
    capture_lex $P725
    .const 'Sub' $P712 = "172_1297880739.64186" 
    capture_lex $P712
    .const 'Sub' $P705 = "170_1297880739.64186" 
    capture_lex $P705
    .const 'Sub' $P697 = "168_1297880739.64186" 
    capture_lex $P697
    .const 'Sub' $P687 = "166_1297880739.64186" 
    capture_lex $P687
    .const 'Sub' $P660 = "162_1297880739.64186" 
    capture_lex $P660
    .const 'Sub' $P634 = "160_1297880739.64186" 
    capture_lex $P634
    .const 'Sub' $P627 = "158_1297880739.64186" 
    capture_lex $P627
    .const 'Sub' $P620 = "156_1297880739.64186" 
    capture_lex $P620
    .const 'Sub' $P610 = "152_1297880739.64186" 
    capture_lex $P610
    .const 'Sub' $P602 = "150_1297880739.64186" 
    capture_lex $P602
    .const 'Sub' $P596 = "148_1297880739.64186" 
    capture_lex $P596
    .const 'Sub' $P583 = "146_1297880739.64186" 
    capture_lex $P583
    .const 'Sub' $P576 = "144_1297880739.64186" 
    capture_lex $P576
    .const 'Sub' $P569 = "142_1297880739.64186" 
    capture_lex $P569
    .const 'Sub' $P562 = "140_1297880739.64186" 
    capture_lex $P562
    .const 'Sub' $P535 = "136_1297880739.64186" 
    capture_lex $P535
    .const 'Sub' $P526 = "134_1297880739.64186" 
    capture_lex $P526
    .const 'Sub' $P519 = "132_1297880739.64186" 
    capture_lex $P519
    .const 'Sub' $P510 = "128_1297880739.64186" 
    capture_lex $P510
    .const 'Sub' $P505 = "126_1297880739.64186" 
    capture_lex $P505
    .const 'Sub' $P493 = "124_1297880739.64186" 
    capture_lex $P493
    .const 'Sub' $P481 = "122_1297880739.64186" 
    capture_lex $P481
    .const 'Sub' $P474 = "120_1297880739.64186" 
    capture_lex $P474
    .const 'Sub' $P469 = "118_1297880739.64186" 
    capture_lex $P469
    .const 'Sub' $P463 = "116_1297880739.64186" 
    capture_lex $P463
    .const 'Sub' $P457 = "114_1297880739.64186" 
    capture_lex $P457
    .const 'Sub' $P447 = "111_1297880739.64186" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1297880739.64186" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1297880739.64186" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1297880739.64186" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1297880739.64186" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1297880739.64186" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1297880739.64186" 
    capture_lex $P411
    .const 'Sub' $P402 = "97_1297880739.64186" 
    capture_lex $P402
    .const 'Sub' $P393 = "95_1297880739.64186" 
    capture_lex $P393
    .const 'Sub' $P384 = "93_1297880739.64186" 
    capture_lex $P384
    .const 'Sub' $P371 = "89_1297880739.64186" 
    capture_lex $P371
    .const 'Sub' $P362 = "87_1297880739.64186" 
    capture_lex $P362
    .const 'Sub' $P352 = "83_1297880739.64186" 
    capture_lex $P352
    .const 'Sub' $P345 = "81_1297880739.64186" 
    capture_lex $P345
    .const 'Sub' $P338 = "79_1297880739.64186" 
    capture_lex $P338
    .const 'Sub' $P326 = "75_1297880739.64186" 
    capture_lex $P326
    .const 'Sub' $P318 = "73_1297880739.64186" 
    capture_lex $P318
    .const 'Sub' $P310 = "71_1297880739.64186" 
    capture_lex $P310
    .const 'Sub' $P290 = "69_1297880739.64186" 
    capture_lex $P290
    .const 'Sub' $P281 = "67_1297880739.64186" 
    capture_lex $P281
    .const 'Sub' $P263 = "64_1297880739.64186" 
    capture_lex $P263
    .const 'Sub' $P245 = "62_1297880739.64186" 
    capture_lex $P245
    .const 'Sub' $P236 = "58_1297880739.64186" 
    capture_lex $P236
    .const 'Sub' $P231 = "56_1297880739.64186" 
    capture_lex $P231
    .const 'Sub' $P222 = "52_1297880739.64186" 
    capture_lex $P222
    .const 'Sub' $P217 = "50_1297880739.64186" 
    capture_lex $P217
    .const 'Sub' $P212 = "48_1297880739.64186" 
    capture_lex $P212
    .const 'Sub' $P203 = "46_1297880739.64186" 
    capture_lex $P203
    .const 'Sub' $P196 = "44_1297880739.64186" 
    capture_lex $P196
    .const 'Sub' $P190 = "42_1297880739.64186" 
    capture_lex $P190
    .const 'Sub' $P182 = "40_1297880739.64186" 
    capture_lex $P182
    .const 'Sub' $P176 = "38_1297880739.64186" 
    capture_lex $P176
    .const 'Sub' $P170 = "36_1297880739.64186" 
    capture_lex $P170
    .const 'Sub' $P155 = "33_1297880739.64186" 
    capture_lex $P155
    .const 'Sub' $P141 = "31_1297880739.64186" 
    capture_lex $P141
    .const 'Sub' $P134 = "29_1297880739.64186" 
    capture_lex $P134
    .const 'Sub' $P95 = "26_1297880739.64186" 
    capture_lex $P95
    .const 'Sub' $P80 = "23_1297880739.64186" 
    capture_lex $P80
    .const 'Sub' $P69 = "21_1297880739.64186" 
    capture_lex $P69
    .const 'Sub' $P57 = "19_1297880739.64186" 
    capture_lex $P57
    .const 'Sub' $P49 = "17_1297880739.64186" 
    capture_lex $P49
    .const 'Sub' $P42 = "15_1297880739.64186" 
    capture_lex $P42
    .const 'Sub' $P35 = "13_1297880739.64186" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1297880739.64186" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 575
    get_hll_global $P1373, ["NQP";"Regex"], "_block1372" 
    capture_lex $P1373
    $P1435 = $P1373()
.annotate 'line', 4
    .return ($P1435)
    .const 'Sub' $P1437 = "376_1297880739.64186" 
    .return ($P1437)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post379") :outer("11_1297880739.64186")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 456
    get_hll_global $P1440, ["NQP"], "Grammar"
    $P1440."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 457
    get_hll_global $P1441, ["NQP"], "Grammar"
    $P1441."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 458
    get_hll_global $P1442, ["NQP"], "Grammar"
    $P1442."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 459
    get_hll_global $P1443, ["NQP"], "Grammar"
    $P1443."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 460
    get_hll_global $P1444, ["NQP"], "Grammar"
    $P1444."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 461
    get_hll_global $P1445, ["NQP"], "Grammar"
    $P1445."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 462
    get_hll_global $P1446, ["NQP"], "Grammar"
    $P1446."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 463
    get_hll_global $P1447, ["NQP"], "Grammar"
    $P1447."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 464
    get_hll_global $P1448, ["NQP"], "Grammar"
    $P1448."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 465
    get_hll_global $P1449, ["NQP"], "Grammar"
    $P1449."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 466
    get_hll_global $P1450, ["NQP"], "Grammar"
    $P1450."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 467
    get_hll_global $P1451, ["NQP"], "Grammar"
    $P1451."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 468
    get_hll_global $P1452, ["NQP"], "Grammar"
    $P1452."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 469
    get_hll_global $P1453, ["NQP"], "Grammar"
    $P1453."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 470
    get_hll_global $P1454, ["NQP"], "Grammar"
    $P1454."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 455
    $P1455 = get_root_global ["parrot"], "P6metaclass"
    $P1455."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
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
.sub "identifier"  :subid("13_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__identifier"  :subid("14_1297880739.64186") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__name"  :subid("16_1297880739.64186") :method
.annotate 'line', 4
    new $P45, "ResizablePMCArray"
    push $P45, ""
    .return ($P45)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__deflongname"  :subid("18_1297880739.64186") :method
.annotate 'line', 4
    $P52 = self."!PREFIX__!subrule"("identifier", "")
    new $P53, "ResizablePMCArray"
    push $P53, $P52
    .return ($P53)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1297880739.64186") :method
.annotate 'line', 4
    new $P60, "ResizablePMCArray"
    push $P60, ""
    .return ($P60)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__ws"  :subid("22_1297880739.64186") :method
.annotate 'line', 4
    new $P72, "ResizablePMCArray"
    push $P72, ""
    push $P72, ""
    .return ($P72)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P88 = "25_1297880739.64186" 
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
    .const 'Sub' $P88 = "25_1297880739.64186" 
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
.sub "!PREFIX__unv"  :subid("24_1297880739.64186") :method
.annotate 'line', 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block87"  :anon :subid("25_1297880739.64186") :method :outer("23_1297880739.64186")
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
.sub "pod_comment"  :subid("26_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P127 = "28_1297880739.64186" 
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
    .const 'Sub' $P127 = "28_1297880739.64186" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1297880739.64186") :method
.annotate 'line', 4
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["NQP";"Grammar"]
.sub "_block126"  :anon :subid("28_1297880739.64186") :method :outer("26_1297880739.64186")
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
.sub "comp_unit"  :subid("29_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__comp_unit"  :subid("30_1297880739.64186") :method
.annotate 'line', 4
    $P137 = self."!PREFIX__!subrule"("newpad", "")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statementlist"  :subid("32_1297880739.64186") :method
.annotate 'line', 4
    $P144 = self."!PREFIX__!subrule"("ws", "")
    $P145 = self."!PREFIX__!subrule"("ws", "")
    new $P146, "ResizablePMCArray"
    push $P146, $P144
    push $P146, $P145
    .return ($P146)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P161 = "35_1297880739.64186" 
    capture_lex $P161
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    .local pmc rx156_debug
    (rx156_cur, rx156_pos, rx156_tgt, $I10) = self."!cursor_start"()
    rx156_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
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
    .const 'Sub' $P161 = "35_1297880739.64186" 
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
.sub "!PREFIX__statement"  :subid("34_1297880739.64186") :method
.annotate 'line', 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "_block160"  :anon :subid("35_1297880739.64186") :method :outer("33_1297880739.64186")
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
.sub "eat_terminator"  :subid("36_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__eat_terminator"  :subid("37_1297880739.64186") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    push $P173, ""
    push $P173, ""
    push $P173, ";"
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__xblock"  :subid("39_1297880739.64186") :method
.annotate 'line', 4
    $P179 = self."!PREFIX__!subrule"("EXPR", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__pblock"  :subid("41_1297880739.64186") :method
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
.sub "lambda"  :subid("42_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__lambda"  :subid("43_1297880739.64186") :method
.annotate 'line', 4
    new $P193, "ResizablePMCArray"
    push $P193, "<->"
    push $P193, "->"
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__block"  :subid("45_1297880739.64186") :method
.annotate 'line', 4
    $P199 = self."!PREFIX__!subrule"("panic", "")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    push $P200, "{"
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__blockoid"  :subid("47_1297880739.64186") :method
.annotate 'line', 4
    $P206 = self."!PREFIX__!subrule"("finishpad", "")
    new $P207, "ResizablePMCArray"
    push $P207, $P206
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__newpad"  :subid("49_1297880739.64186") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, ""
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__outerctx"  :subid("51_1297880739.64186") :method
.annotate 'line', 4
    new $P220, "ResizablePMCArray"
    push $P220, ""
    .return ($P220)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__finishpad"  :subid("53_1297880739.64186") :method
.annotate 'line', 4
    new $P225, "ResizablePMCArray"
    push $P225, ""
    .return ($P225)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1297880739.64186") :method
.annotate 'line', 148
    $P228 = self."!protoregex"("terminator")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1297880739.64186") :method
.annotate 'line', 148
    $P230 = self."!PREFIX__!protoregex"("terminator")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1297880739.64186") :method
.annotate 'line', 4
    new $P234, "ResizablePMCArray"
    push $P234, ";"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1297880739.64186") :method
.annotate 'line', 4
    new $P239, "ResizablePMCArray"
    push $P239, "}"
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1297880739.64186") :method
.annotate 'line', 155
    $P242 = self."!protoregex"("statement_control")
    .return ($P242)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1297880739.64186") :method
.annotate 'line', 155
    $P244 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    .local pmc rx246_debug
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_caparray"("xblock", "else")
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1297880739.64186") :method
.annotate 'line', 4
    new $P248, "ResizablePMCArray"
    push $P248, "if"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P274 = "66_1297880739.64186" 
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
    .const 'Sub' $P274 = "66_1297880739.64186" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1297880739.64186") :method
.annotate 'line', 4
    new $P266, "ResizablePMCArray"
    push $P266, "unless"
    .return ($P266)
.end


.namespace ["NQP";"Grammar"]
.sub "_block273"  :anon :subid("66_1297880739.64186") :method :outer("64_1297880739.64186")
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
.sub "statement_control:sym<while>"  :subid("67_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1297880739.64186") :method
.annotate 'line', 4
    new $P284, "ResizablePMCArray"
    push $P284, "until"
    push $P284, "while"
    .return ($P284)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1297880739.64186") :method
.annotate 'line', 4
    new $P293, "ResizablePMCArray"
    push $P293, "repeat"
    .return ($P293)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1297880739.64186") :method
.annotate 'line', 4
    new $P313, "ResizablePMCArray"
    push $P313, "for"
    .return ($P313)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1297880739.64186") :method
.annotate 'line', 4
    new $P321, "ResizablePMCArray"
    push $P321, "CATCH"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1297880739.64186") :method
.annotate 'line', 4
    new $P329, "ResizablePMCArray"
    push $P329, "CONTROL"
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1297880739.64186") :method
.annotate 'line', 198
    $P335 = self."!protoregex"("statement_prefix")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1297880739.64186") :method
.annotate 'line', 198
    $P337 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1297880739.64186") :method
.annotate 'line', 4
    $P341 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P342, "ResizablePMCArray"
    push $P342, $P341
    .return ($P342)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1297880739.64186") :method
.annotate 'line', 4
    $P348 = self."!PREFIX__!subrule"("blorst", "try")
    new $P349, "ResizablePMCArray"
    push $P349, $P348
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__blorst"  :subid("84_1297880739.64186") :method
.annotate 'line', 4
    new $P355, "ResizablePMCArray"
    push $P355, ""
    .return ($P355)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1297880739.64186") :method
.annotate 'line', 212
    $P359 = self."!protoregex"("statement_mod_cond")
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1297880739.64186") :method
.annotate 'line', 212
    $P361 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1297880739.64186") :method
.annotate 'line', 4
    $P365 = self."!PREFIX__!subrule"("ws", "if")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1297880739.64186") :method
.annotate 'line', 4
    $P374 = self."!PREFIX__!subrule"("ws", "unless")
    new $P375, "ResizablePMCArray"
    push $P375, $P374
    .return ($P375)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1297880739.64186") :method
.annotate 'line', 217
    $P381 = self."!protoregex"("statement_mod_loop")
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1297880739.64186") :method
.annotate 'line', 217
    $P383 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1297880739.64186") :method
.annotate 'line', 4
    $P387 = self."!PREFIX__!subrule"("ws", "while")
    new $P388, "ResizablePMCArray"
    push $P388, $P387
    .return ($P388)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1297880739.64186") :method
.annotate 'line', 4
    $P396 = self."!PREFIX__!subrule"("ws", "until")
    new $P397, "ResizablePMCArray"
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1297880739.64186") :method
.annotate 'line', 4
    $P405 = self."!PREFIX__!subrule"("ws", "for")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1297880739.64186") :method
.annotate 'line', 4
    $P414 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1297880739.64186") :method
.annotate 'line', 4
    $P420 = self."!PREFIX__!subrule"("colonpair", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<variable>"  :subid("104_1297880739.64186") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("variable", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1297880739.64186") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1297880739.64186") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1297880739.64186") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P453 = "113_1297880739.64186" 
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
    .const 'Sub' $P453 = "113_1297880739.64186" 
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
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1297880739.64186") :method
.annotate 'line', 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "_block452"  :anon :subid("113_1297880739.64186") :method :outer("111_1297880739.64186")
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
.sub "term:sym<regex_declarator>"  :subid("114_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1297880739.64186") :method
.annotate 'line', 4
    $P460 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1297880739.64186") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1297880739.64186") :method
.annotate 'line', 4
    new $P472, "ResizablePMCArray"
    push $P472, ""
    .return ($P472)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__fatarrow"  :subid("121_1297880739.64186") :method
.annotate 'line', 4
    $P477 = self."!PREFIX__!subrule"("identifier", "")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__colonpair"  :subid("123_1297880739.64186") :method
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
.sub "variable"  :subid("124_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__variable"  :subid("125_1297880739.64186") :method
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
.sub "sigil"  :subid("126_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__sigil"  :subid("127_1297880739.64186") :method
.annotate 'line', 4
    new $P508, "ResizablePMCArray"
    push $P508, "&"
    push $P508, "%"
    push $P508, "@"
    push $P508, "$"
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__twigil"  :subid("129_1297880739.64186") :method
.annotate 'line', 4
    new $P513, "ResizablePMCArray"
    push $P513, "?"
    push $P513, "!"
    push $P513, "*"
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1297880739.64186") :method
.annotate 'line', 259
    $P516 = self."!protoregex"("package_declarator")
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1297880739.64186") :method
.annotate 'line', 259
    $P518 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1297880739.64186") :method
.annotate 'line', 4
    $P522 = self."!PREFIX__!subrule"("package_def", "module")
    new $P523, "ResizablePMCArray"
    push $P523, $P522
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1297880739.64186") :method
.annotate 'line', 4
    $P529 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P530 = self."!PREFIX__!subrule"("package_def", "class")
    new $P531, "ResizablePMCArray"
    push $P531, $P529
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__package_def"  :subid("137_1297880739.64186") :method
.annotate 'line', 4
    $P538 = self."!PREFIX__!subrule"("ws", "")
    new $P539, "ResizablePMCArray"
    push $P539, $P538
    .return ($P539)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1297880739.64186") :method
.annotate 'line', 273
    $P559 = self."!protoregex"("scope_declarator")
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1297880739.64186") :method
.annotate 'line', 273
    $P561 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P561)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1297880739.64186") :method
.annotate 'line', 4
    $P565 = self."!PREFIX__!subrule"("scoped", "my")
    new $P566, "ResizablePMCArray"
    push $P566, $P565
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1297880739.64186") :method
.annotate 'line', 4
    $P572 = self."!PREFIX__!subrule"("scoped", "our")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1297880739.64186") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "has")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__scoped"  :subid("147_1297880739.64186") :method
.annotate 'line', 4
    $P587 = self."!PREFIX__!subrule"("ws", "")
    $P588 = self."!PREFIX__!subrule"("ws", "")
    new $P589, "ResizablePMCArray"
    push $P589, $P587
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__typename"  :subid("149_1297880739.64186") :method
.annotate 'line', 4
    $P599 = self."!PREFIX__!subrule"("name", "")
    new $P600, "ResizablePMCArray"
    push $P600, $P599
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__declarator"  :subid("151_1297880739.64186") :method
.annotate 'line', 4
    $P605 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P606 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P607, "ResizablePMCArray"
    push $P607, $P605
    push $P607, $P606
    .return ($P607)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__variable_declarator"  :subid("153_1297880739.64186") :method
.annotate 'line', 4
    $P613 = self."!PREFIX__!subrule"("variable", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1297880739.64186") :method
.annotate 'line', 292
    $P617 = self."!protoregex"("routine_declarator")
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1297880739.64186") :method
.annotate 'line', 292
    $P619 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1297880739.64186") :method
.annotate 'line', 4
    $P623 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P624, "ResizablePMCArray"
    push $P624, $P623
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1297880739.64186") :method
.annotate 'line', 4
    $P630 = self."!PREFIX__!subrule"("method_def", "method")
    new $P631, "ResizablePMCArray"
    push $P631, $P630
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    .local pmc rx635_debug
    (rx635_cur, rx635_pos, rx635_tgt, $I10) = self."!cursor_start"()
    rx635_cur."!cursor_caparray"("sigil", "deflongname", "trait")
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
.sub "!PREFIX__routine_def"  :subid("161_1297880739.64186") :method
.annotate 'line', 4
    $P637 = self."!PREFIX__!subrule"("ws", "")
    new $P638, "ResizablePMCArray"
    push $P638, $P637
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__method_def"  :subid("163_1297880739.64186") :method
.annotate 'line', 4
    $P663 = self."!PREFIX__!subrule"("ws", "")
    new $P664, "ResizablePMCArray"
    push $P664, $P663
    .return ($P664)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1297880739.64186") :method
.annotate 'line', 314
    $P684 = self."!protoregex"("multi_declarator")
    .return ($P684)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1297880739.64186") :method
.annotate 'line', 314
    $P686 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1297880739.64186") :method
.annotate 'line', 4
    $P691 = self."!PREFIX__!subrule"("ws", "multi")
    new $P692, "ResizablePMCArray"
    push $P692, $P691
    .return ($P692)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1297880739.64186") :method
.annotate 'line', 4
    $P701 = self."!PREFIX__!subrule"("declarator", "")
    new $P702, "ResizablePMCArray"
    push $P702, $P701
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__signature"  :subid("171_1297880739.64186") :method
.annotate 'line', 4
    new $P708, "ResizablePMCArray"
    push $P708, ""
    .return ($P708)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    .local pmc rx713_debug
    (rx713_cur, rx713_pos, rx713_tgt, $I10) = self."!cursor_start"()
    rx713_cur."!cursor_caparray"("typename", "default_value")
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
.sub "!PREFIX__parameter"  :subid("173_1297880739.64186") :method
.annotate 'line', 4
    new $P715, "ResizablePMCArray"
    push $P715, ""
    .return ($P715)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__param_var"  :subid("175_1297880739.64186") :method
.annotate 'line', 4
    $P728 = self."!PREFIX__!subrule"("sigil", "")
    new $P729, "ResizablePMCArray"
    push $P729, $P728
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__named_param"  :subid("177_1297880739.64186") :method
.annotate 'line', 4
    $P738 = self."!PREFIX__!subrule"("param_var", ":")
    new $P739, "ResizablePMCArray"
    push $P739, $P738
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__default_value"  :subid("179_1297880739.64186") :method
.annotate 'line', 4
    $P744 = self."!PREFIX__!subrule"("ws", "")
    new $P745, "ResizablePMCArray"
    push $P745, $P744
    .return ($P745)
.end


.namespace ["NQP";"Grammar"]
.sub "trait"  :subid("180_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__trait"  :subid("181_1297880739.64186") :method
.annotate 'line', 4
    $P753 = self."!PREFIX__!subrule"("ws", "")
    new $P754, "ResizablePMCArray"
    push $P754, $P753
    .return ($P754)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod"  :subid("182_1297880739.64186") :method
.annotate 'line', 349
    $P759 = self."!protoregex"("trait_mod")
    .return ($P759)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait_mod"  :subid("183_1297880739.64186") :method
.annotate 'line', 349
    $P761 = self."!PREFIX__!protoregex"("trait_mod")
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod:sym<is>"  :subid("184_1297880739.64186") :method :outer("11_1297880739.64186")
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
.sub "!PREFIX__trait_mod:sym<is>"  :subid("185_1297880739.64186") :method
.annotate 'line', 4
    $P765 = self."!PREFIX__!subrule"("ws", "is")
    new $P766, "ResizablePMCArray"
    push $P766, $P765
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("186_1297880739.64186") :method :outer("11_1297880739.64186")
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
    set_addr $I10, alt787_2
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
.annotate 'line', 358
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
  # rx literal  "<*>"
    add $I11, rx774_pos, 3
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 3
    ne $S10, "<*>", rx774_fail
    add rx774_pos, 3
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
  alt787_2:
.annotate 'line', 359
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."panic"("Proto regex body must be <*> (or <...>, which is deprecated)")
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  alt787_end:
.annotate 'line', 360
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 354
    goto alt780_end
  alt780_1:
.annotate 'line', 361
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_801_fail
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  alt800_0:
    set_addr $I10, alt800_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "regex"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "regex", rx774_fail
    add rx774_pos, 5
    goto alt800_end
  alt800_1:
    set_addr $I10, alt800_2
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  # rx literal  "token"
    add $I11, rx774_pos, 5
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 5
    ne $S10, "token", rx774_fail
    add rx774_pos, 5
    goto alt800_end
  alt800_2:
  # rx literal  "rule"
    add $I11, rx774_pos, 4
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 4
    ne $S10, "rule", rx774_fail
    add rx774_pos, 4
  alt800_end:
    set_addr $I10, rxcap_801_fail
    ($I12, $I11) = rx774_cur."!mark_peek"($I10)
    rx774_cur."!cursor_pos"($I11)
    ($P10) = rx774_cur."!cursor_start"()
    $P10."!cursor_pass"(rx774_pos, "")
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_801_done
  rxcap_801_fail:
    goto rx774_fail
  rxcap_801_done:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 362
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
.annotate 'line', 363
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
.annotate 'line', 364
  # rx rxquantr805 ** 0..1
    set_addr $I10, rxquantr805_done
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  rxquantr805_loop:
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
    set_addr $I10, rxquantr805_done
    (rx774_rep) = rx774_cur."!mark_commit"($I10)
  rxquantr805_done:
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 365
  # rx reduce name="regex_declarator" key="open"
    rx774_cur."!cursor_pos"(rx774_pos)
    rx774_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
.annotate 'line', 366
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
.annotate 'line', 367
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
.sub "!PREFIX__regex_declarator"  :subid("187_1297880739.64186") :method
.annotate 'line', 4
    $P776 = self."!PREFIX__!subrule"("ws", "")
    new $P777, "ResizablePMCArray"
    push $P777, $P776
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("188_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx815_tgt
    .local int rx815_pos
    .local int rx815_off
    .local int rx815_eos
    .local int rx815_rep
    .local pmc rx815_cur
    .local pmc rx815_debug
    (rx815_cur, rx815_pos, rx815_tgt, $I10) = self."!cursor_start"()
    rx815_cur."!cursor_caparray"("args")
    getattribute rx815_debug, rx815_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx815_cur
    .local pmc match
    .lex "$/", match
    length rx815_eos, rx815_tgt
    gt rx815_pos, rx815_eos, rx815_done
    set rx815_off, 0
    lt rx815_pos, 2, rx815_start
    sub rx815_off, rx815_pos, 1
    substr rx815_tgt, rx815_tgt, rx815_off
  rx815_start:
    eq $I10, 1, rx815_restart
    if_null rx815_debug, debug_710
    rx815_cur."!cursor_debug"("START", "dotty")
  debug_710:
    $I10 = self.'from'()
    ne $I10, -1, rxscan819_done
    goto rxscan819_scan
  rxscan819_loop:
    ($P10) = rx815_cur."from"()
    inc $P10
    set rx815_pos, $P10
    ge rx815_pos, rx815_eos, rxscan819_done
  rxscan819_scan:
    set_addr $I10, rxscan819_loop
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  rxscan819_done:
.annotate 'line', 371
  # rx literal  "."
    add $I11, rx815_pos, 1
    gt $I11, rx815_eos, rx815_fail
    sub $I11, rx815_pos, rx815_off
    ord $I11, rx815_tgt, $I11
    ne $I11, 46, rx815_fail
    add rx815_pos, 1
  alt820_0:
.annotate 'line', 372
    set_addr $I10, alt820_1
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."deflongname"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx815_pos = $P10."pos"()
    goto alt820_end
  alt820_1:
.annotate 'line', 373
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx815_pos, rx815_off
    substr $S10, rx815_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx815_fail
  # rx subrule "quote" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."quote"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx815_pos = $P10."pos"()
  alt821_0:
.annotate 'line', 374
    set_addr $I10, alt821_1
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx815_pos, rx815_off
    substr $S10, rx815_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx815_fail
    goto alt821_end
  alt821_1:
  # rx subrule "panic" subtype=method negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx815_fail
    rx815_pos = $P10."pos"()
  alt821_end:
  alt820_end:
.annotate 'line', 380
  # rx rxquantr822 ** 0..1
    set_addr $I10, rxquantr822_done
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  rxquantr822_loop:
  alt823_0:
.annotate 'line', 377
    set_addr $I10, alt823_1
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
.annotate 'line', 378
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx815_pos, rx815_off
    substr $S10, rx815_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx815_fail
  # rx subrule "args" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."args"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx815_pos = $P10."pos"()
    goto alt823_end
  alt823_1:
.annotate 'line', 379
  # rx literal  ":"
    add $I11, rx815_pos, 1
    gt $I11, rx815_eos, rx815_fail
    sub $I11, rx815_pos, rx815_off
    ord $I11, rx815_tgt, $I11
    ne $I11, 58, rx815_fail
    add rx815_pos, 1
  # rx charclass s
    ge rx815_pos, rx815_eos, rx815_fail
    sub $I10, rx815_pos, rx815_off
    is_cclass $I11, 32, rx815_tgt, $I10
    unless $I11, rx815_fail
    inc rx815_pos
  # rx subrule "arglist" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."arglist"()
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx815_pos = $P10."pos"()
  alt823_end:
.annotate 'line', 380
    set_addr $I10, rxquantr822_done
    (rx815_rep) = rx815_cur."!mark_commit"($I10)
  rxquantr822_done:
.annotate 'line', 370
  # rx pass
    rx815_cur."!cursor_pass"(rx815_pos, "dotty")
    if_null rx815_debug, debug_711
    rx815_cur."!cursor_debug"("PASS", "dotty", " at pos=", rx815_pos)
  debug_711:
    .return (rx815_cur)
  rx815_restart:
.annotate 'line', 4
    if_null rx815_debug, debug_712
    rx815_cur."!cursor_debug"("NEXT", "dotty")
  debug_712:
  rx815_fail:
    (rx815_rep, rx815_pos, $I10, $P10) = rx815_cur."!mark_fail"(0)
    lt rx815_pos, -1, rx815_done
    eq rx815_pos, -1, rx815_fail
    jump $I10
  rx815_done:
    rx815_cur."!cursor_fail"()
    if_null rx815_debug, debug_713
    rx815_cur."!cursor_debug"("FAIL", "dotty")
  debug_713:
    .return (rx815_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("189_1297880739.64186") :method
.annotate 'line', 4
    $P817 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P818, "ResizablePMCArray"
    push $P818, "'"
    push $P818, "\""
    push $P818, $P817
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("190_1297880739.64186") :method
.annotate 'line', 384
    $P825 = self."!protoregex"("term")
    .return ($P825)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("191_1297880739.64186") :method
.annotate 'line', 384
    $P827 = self."!PREFIX__!protoregex"("term")
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("192_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx829_tgt
    .local int rx829_pos
    .local int rx829_off
    .local int rx829_eos
    .local int rx829_rep
    .local pmc rx829_cur
    .local pmc rx829_debug
    (rx829_cur, rx829_pos, rx829_tgt, $I10) = self."!cursor_start"()
    getattribute rx829_debug, rx829_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx829_cur
    .local pmc match
    .lex "$/", match
    length rx829_eos, rx829_tgt
    gt rx829_pos, rx829_eos, rx829_done
    set rx829_off, 0
    lt rx829_pos, 2, rx829_start
    sub rx829_off, rx829_pos, 1
    substr rx829_tgt, rx829_tgt, rx829_off
  rx829_start:
    eq $I10, 1, rx829_restart
    if_null rx829_debug, debug_714
    rx829_cur."!cursor_debug"("START", "term:sym<self>")
  debug_714:
    $I10 = self.'from'()
    ne $I10, -1, rxscan832_done
    goto rxscan832_scan
  rxscan832_loop:
    ($P10) = rx829_cur."from"()
    inc $P10
    set rx829_pos, $P10
    ge rx829_pos, rx829_eos, rxscan832_done
  rxscan832_scan:
    set_addr $I10, rxscan832_loop
    rx829_cur."!mark_push"(0, rx829_pos, $I10)
  rxscan832_done:
.annotate 'line', 386
  # rx subcapture "sym"
    set_addr $I10, rxcap_833_fail
    rx829_cur."!mark_push"(0, rx829_pos, $I10)
  # rx literal  "self"
    add $I11, rx829_pos, 4
    gt $I11, rx829_eos, rx829_fail
    sub $I11, rx829_pos, rx829_off
    substr $S10, rx829_tgt, $I11, 4
    ne $S10, "self", rx829_fail
    add rx829_pos, 4
    set_addr $I10, rxcap_833_fail
    ($I12, $I11) = rx829_cur."!mark_peek"($I10)
    rx829_cur."!cursor_pos"($I11)
    ($P10) = rx829_cur."!cursor_start"()
    $P10."!cursor_pass"(rx829_pos, "")
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_833_done
  rxcap_833_fail:
    goto rx829_fail
  rxcap_833_done:
  # rxanchor rwb
    le rx829_pos, 0, rx829_fail
    sub $I10, rx829_pos, rx829_off
    is_cclass $I11, 8192, rx829_tgt, $I10
    if $I11, rx829_fail
    dec $I10
    is_cclass $I11, 8192, rx829_tgt, $I10
    unless $I11, rx829_fail
  # rx pass
    rx829_cur."!cursor_pass"(rx829_pos, "term:sym<self>")
    if_null rx829_debug, debug_715
    rx829_cur."!cursor_debug"("PASS", "term:sym<self>", " at pos=", rx829_pos)
  debug_715:
    .return (rx829_cur)
  rx829_restart:
.annotate 'line', 4
    if_null rx829_debug, debug_716
    rx829_cur."!cursor_debug"("NEXT", "term:sym<self>")
  debug_716:
  rx829_fail:
    (rx829_rep, rx829_pos, $I10, $P10) = rx829_cur."!mark_fail"(0)
    lt rx829_pos, -1, rx829_done
    eq rx829_pos, -1, rx829_fail
    jump $I10
  rx829_done:
    rx829_cur."!cursor_fail"()
    if_null rx829_debug, debug_717
    rx829_cur."!cursor_debug"("FAIL", "term:sym<self>")
  debug_717:
    .return (rx829_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("193_1297880739.64186") :method
.annotate 'line', 4
    new $P831, "ResizablePMCArray"
    push $P831, "self"
    .return ($P831)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("194_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx835_tgt
    .local int rx835_pos
    .local int rx835_off
    .local int rx835_eos
    .local int rx835_rep
    .local pmc rx835_cur
    .local pmc rx835_debug
    (rx835_cur, rx835_pos, rx835_tgt, $I10) = self."!cursor_start"()
    getattribute rx835_debug, rx835_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx835_cur
    .local pmc match
    .lex "$/", match
    length rx835_eos, rx835_tgt
    gt rx835_pos, rx835_eos, rx835_done
    set rx835_off, 0
    lt rx835_pos, 2, rx835_start
    sub rx835_off, rx835_pos, 1
    substr rx835_tgt, rx835_tgt, rx835_off
  rx835_start:
    eq $I10, 1, rx835_restart
    if_null rx835_debug, debug_718
    rx835_cur."!cursor_debug"("START", "term:sym<identifier>")
  debug_718:
    $I10 = self.'from'()
    ne $I10, -1, rxscan839_done
    goto rxscan839_scan
  rxscan839_loop:
    ($P10) = rx835_cur."from"()
    inc $P10
    set rx835_pos, $P10
    ge rx835_pos, rx835_eos, rxscan839_done
  rxscan839_scan:
    set_addr $I10, rxscan839_loop
    rx835_cur."!mark_push"(0, rx835_pos, $I10)
  rxscan839_done:
.annotate 'line', 389
  # rx subrule "deflongname" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."deflongname"()
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx835_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx835_fail
  # rx subrule "args" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."args"()
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx835_pos = $P10."pos"()
.annotate 'line', 388
  # rx pass
    rx835_cur."!cursor_pass"(rx835_pos, "term:sym<identifier>")
    if_null rx835_debug, debug_719
    rx835_cur."!cursor_debug"("PASS", "term:sym<identifier>", " at pos=", rx835_pos)
  debug_719:
    .return (rx835_cur)
  rx835_restart:
.annotate 'line', 4
    if_null rx835_debug, debug_720
    rx835_cur."!cursor_debug"("NEXT", "term:sym<identifier>")
  debug_720:
  rx835_fail:
    (rx835_rep, rx835_pos, $I10, $P10) = rx835_cur."!mark_fail"(0)
    lt rx835_pos, -1, rx835_done
    eq rx835_pos, -1, rx835_fail
    jump $I10
  rx835_done:
    rx835_cur."!cursor_fail"()
    if_null rx835_debug, debug_721
    rx835_cur."!cursor_debug"("FAIL", "term:sym<identifier>")
  debug_721:
    .return (rx835_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("195_1297880739.64186") :method
.annotate 'line', 4
    $P837 = self."!PREFIX__!subrule"("deflongname", "")
    new $P838, "ResizablePMCArray"
    push $P838, $P837
    .return ($P838)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("196_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx841_tgt
    .local int rx841_pos
    .local int rx841_off
    .local int rx841_eos
    .local int rx841_rep
    .local pmc rx841_cur
    .local pmc rx841_debug
    (rx841_cur, rx841_pos, rx841_tgt, $I10) = self."!cursor_start"()
    rx841_cur."!cursor_caparray"("args")
    getattribute rx841_debug, rx841_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx841_cur
    .local pmc match
    .lex "$/", match
    length rx841_eos, rx841_tgt
    gt rx841_pos, rx841_eos, rx841_done
    set rx841_off, 0
    lt rx841_pos, 2, rx841_start
    sub rx841_off, rx841_pos, 1
    substr rx841_tgt, rx841_tgt, rx841_off
  rx841_start:
    eq $I10, 1, rx841_restart
    if_null rx841_debug, debug_722
    rx841_cur."!cursor_debug"("START", "term:sym<name>")
  debug_722:
    $I10 = self.'from'()
    ne $I10, -1, rxscan845_done
    goto rxscan845_scan
  rxscan845_loop:
    ($P10) = rx841_cur."from"()
    inc $P10
    set rx841_pos, $P10
    ge rx841_pos, rx841_eos, rxscan845_done
  rxscan845_scan:
    set_addr $I10, rxscan845_loop
    rx841_cur."!mark_push"(0, rx841_pos, $I10)
  rxscan845_done:
.annotate 'line', 393
  # rx subrule "name" subtype=capture negate=
    rx841_cur."!cursor_pos"(rx841_pos)
    $P10 = rx841_cur."name"()
    unless $P10, rx841_fail
    rx841_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx841_pos = $P10."pos"()
  # rx rxquantr846 ** 0..1
    set_addr $I10, rxquantr846_done
    rx841_cur."!mark_push"(0, rx841_pos, $I10)
  rxquantr846_loop:
  # rx subrule "args" subtype=capture negate=
    rx841_cur."!cursor_pos"(rx841_pos)
    $P10 = rx841_cur."args"()
    unless $P10, rx841_fail
    goto rxsubrule847_pass
  rxsubrule847_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx841_fail
  rxsubrule847_pass:
    set_addr $I10, rxsubrule847_back
    rx841_cur."!mark_push"(0, rx841_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx841_pos = $P10."pos"()
    set_addr $I10, rxquantr846_done
    (rx841_rep) = rx841_cur."!mark_commit"($I10)
  rxquantr846_done:
.annotate 'line', 392
  # rx pass
    rx841_cur."!cursor_pass"(rx841_pos, "term:sym<name>")
    if_null rx841_debug, debug_723
    rx841_cur."!cursor_debug"("PASS", "term:sym<name>", " at pos=", rx841_pos)
  debug_723:
    .return (rx841_cur)
  rx841_restart:
.annotate 'line', 4
    if_null rx841_debug, debug_724
    rx841_cur."!cursor_debug"("NEXT", "term:sym<name>")
  debug_724:
  rx841_fail:
    (rx841_rep, rx841_pos, $I10, $P10) = rx841_cur."!mark_fail"(0)
    lt rx841_pos, -1, rx841_done
    eq rx841_pos, -1, rx841_fail
    jump $I10
  rx841_done:
    rx841_cur."!cursor_fail"()
    if_null rx841_debug, debug_725
    rx841_cur."!cursor_debug"("FAIL", "term:sym<name>")
  debug_725:
    .return (rx841_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("197_1297880739.64186") :method
.annotate 'line', 4
    $P843 = self."!PREFIX__!subrule"("name", "")
    new $P844, "ResizablePMCArray"
    push $P844, $P843
    .return ($P844)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("198_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx849_tgt
    .local int rx849_pos
    .local int rx849_off
    .local int rx849_eos
    .local int rx849_rep
    .local pmc rx849_cur
    .local pmc rx849_debug
    (rx849_cur, rx849_pos, rx849_tgt, $I10) = self."!cursor_start"()
    rx849_cur."!cursor_caparray"("args")
    getattribute rx849_debug, rx849_cur, "$!debug"
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
    eq $I10, 1, rx849_restart
    if_null rx849_debug, debug_726
    rx849_cur."!cursor_debug"("START", "term:sym<pir::op>")
  debug_726:
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
.annotate 'line', 397
  # rx literal  "pir::"
    add $I11, rx849_pos, 5
    gt $I11, rx849_eos, rx849_fail
    sub $I11, rx849_pos, rx849_off
    substr $S10, rx849_tgt, $I11, 5
    ne $S10, "pir::", rx849_fail
    add rx849_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_853_fail
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx849_pos, rx849_off
    find_not_cclass $I11, 8192, rx849_tgt, $I10, rx849_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx849_fail
    add rx849_pos, rx849_off, $I11
    set_addr $I10, rxcap_853_fail
    ($I12, $I11) = rx849_cur."!mark_peek"($I10)
    rx849_cur."!cursor_pos"($I11)
    ($P10) = rx849_cur."!cursor_start"()
    $P10."!cursor_pass"(rx849_pos, "")
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_853_done
  rxcap_853_fail:
    goto rx849_fail
  rxcap_853_done:
  # rx rxquantr854 ** 0..1
    set_addr $I10, rxquantr854_done
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
  rxquantr854_loop:
  # rx subrule "args" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."args"()
    unless $P10, rx849_fail
    goto rxsubrule855_pass
  rxsubrule855_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx849_fail
  rxsubrule855_pass:
    set_addr $I10, rxsubrule855_back
    rx849_cur."!mark_push"(0, rx849_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx849_pos = $P10."pos"()
    set_addr $I10, rxquantr854_done
    (rx849_rep) = rx849_cur."!mark_commit"($I10)
  rxquantr854_done:
.annotate 'line', 396
  # rx pass
    rx849_cur."!cursor_pass"(rx849_pos, "term:sym<pir::op>")
    if_null rx849_debug, debug_727
    rx849_cur."!cursor_debug"("PASS", "term:sym<pir::op>", " at pos=", rx849_pos)
  debug_727:
    .return (rx849_cur)
  rx849_restart:
.annotate 'line', 4
    if_null rx849_debug, debug_728
    rx849_cur."!cursor_debug"("NEXT", "term:sym<pir::op>")
  debug_728:
  rx849_fail:
    (rx849_rep, rx849_pos, $I10, $P10) = rx849_cur."!mark_fail"(0)
    lt rx849_pos, -1, rx849_done
    eq rx849_pos, -1, rx849_fail
    jump $I10
  rx849_done:
    rx849_cur."!cursor_fail"()
    if_null rx849_debug, debug_729
    rx849_cur."!cursor_debug"("FAIL", "term:sym<pir::op>")
  debug_729:
    .return (rx849_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("199_1297880739.64186") :method
.annotate 'line', 4
    new $P851, "ResizablePMCArray"
    push $P851, "pir::"
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("200_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    .local pmc rx857_debug
    (rx857_cur, rx857_pos, rx857_tgt, $I10) = self."!cursor_start"()
    getattribute rx857_debug, rx857_cur, "$!debug"
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
    eq $I10, 1, rx857_restart
    if_null rx857_debug, debug_730
    rx857_cur."!cursor_debug"("START", "args")
  debug_730:
    $I10 = self.'from'()
    ne $I10, -1, rxscan861_done
    goto rxscan861_scan
  rxscan861_loop:
    ($P10) = rx857_cur."from"()
    inc $P10
    set rx857_pos, $P10
    ge rx857_pos, rx857_eos, rxscan861_done
  rxscan861_scan:
    set_addr $I10, rxscan861_loop
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  rxscan861_done:
.annotate 'line', 401
  # rx literal  "("
    add $I11, rx857_pos, 1
    gt $I11, rx857_eos, rx857_fail
    sub $I11, rx857_pos, rx857_off
    ord $I11, rx857_tgt, $I11
    ne $I11, 40, rx857_fail
    add rx857_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."arglist"()
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx857_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx857_pos, 1
    gt $I11, rx857_eos, rx857_fail
    sub $I11, rx857_pos, rx857_off
    ord $I11, rx857_tgt, $I11
    ne $I11, 41, rx857_fail
    add rx857_pos, 1
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "args")
    if_null rx857_debug, debug_731
    rx857_cur."!cursor_debug"("PASS", "args", " at pos=", rx857_pos)
  debug_731:
    .return (rx857_cur)
  rx857_restart:
.annotate 'line', 4
    if_null rx857_debug, debug_732
    rx857_cur."!cursor_debug"("NEXT", "args")
  debug_732:
  rx857_fail:
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    if_null rx857_debug, debug_733
    rx857_cur."!cursor_debug"("FAIL", "args")
  debug_733:
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("201_1297880739.64186") :method
.annotate 'line', 4
    $P859 = self."!PREFIX__!subrule"("arglist", "(")
    new $P860, "ResizablePMCArray"
    push $P860, $P859
    .return ($P860)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("202_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx863_tgt
    .local int rx863_pos
    .local int rx863_off
    .local int rx863_eos
    .local int rx863_rep
    .local pmc rx863_cur
    .local pmc rx863_debug
    (rx863_cur, rx863_pos, rx863_tgt, $I10) = self."!cursor_start"()
    getattribute rx863_debug, rx863_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx863_cur
    .local pmc match
    .lex "$/", match
    length rx863_eos, rx863_tgt
    gt rx863_pos, rx863_eos, rx863_done
    set rx863_off, 0
    lt rx863_pos, 2, rx863_start
    sub rx863_off, rx863_pos, 1
    substr rx863_tgt, rx863_tgt, rx863_off
  rx863_start:
    eq $I10, 1, rx863_restart
    if_null rx863_debug, debug_734
    rx863_cur."!cursor_debug"("START", "arglist")
  debug_734:
    $I10 = self.'from'()
    ne $I10, -1, rxscan867_done
    goto rxscan867_scan
  rxscan867_loop:
    ($P10) = rx863_cur."from"()
    inc $P10
    set rx863_pos, $P10
    ge rx863_pos, rx863_eos, rxscan867_done
  rxscan867_scan:
    set_addr $I10, rxscan867_loop
    rx863_cur."!mark_push"(0, rx863_pos, $I10)
  rxscan867_done:
.annotate 'line', 405
  # rx subrule "ws" subtype=method negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."ws"()
    unless $P10, rx863_fail
    rx863_pos = $P10."pos"()
  alt868_0:
.annotate 'line', 406
    set_addr $I10, alt868_1
    rx863_cur."!mark_push"(0, rx863_pos, $I10)
.annotate 'line', 407
  # rx subrule "EXPR" subtype=capture negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."EXPR"("f=")
    unless $P10, rx863_fail
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx863_pos = $P10."pos"()
    goto alt868_end
  alt868_1:
  alt868_end:
.annotate 'line', 404
  # rx pass
    rx863_cur."!cursor_pass"(rx863_pos, "arglist")
    if_null rx863_debug, debug_735
    rx863_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx863_pos)
  debug_735:
    .return (rx863_cur)
  rx863_restart:
.annotate 'line', 4
    if_null rx863_debug, debug_736
    rx863_cur."!cursor_debug"("NEXT", "arglist")
  debug_736:
  rx863_fail:
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    if_null rx863_debug, debug_737
    rx863_cur."!cursor_debug"("FAIL", "arglist")
  debug_737:
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("203_1297880739.64186") :method
.annotate 'line', 4
    $P865 = self."!PREFIX__!subrule"("ws", "")
    new $P866, "ResizablePMCArray"
    push $P866, $P865
    .return ($P866)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("204_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    .local pmc rx870_debug
    (rx870_cur, rx870_pos, rx870_tgt, $I10) = self."!cursor_start"()
    getattribute rx870_debug, rx870_cur, "$!debug"
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
    eq $I10, 1, rx870_restart
    if_null rx870_debug, debug_738
    rx870_cur."!cursor_debug"("START", "term:sym<value>")
  debug_738:
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
.annotate 'line', 413
  # rx subrule "value" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."value"()
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx870_pos = $P10."pos"()
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "term:sym<value>")
    if_null rx870_debug, debug_739
    rx870_cur."!cursor_debug"("PASS", "term:sym<value>", " at pos=", rx870_pos)
  debug_739:
    .return (rx870_cur)
  rx870_restart:
.annotate 'line', 4
    if_null rx870_debug, debug_740
    rx870_cur."!cursor_debug"("NEXT", "term:sym<value>")
  debug_740:
  rx870_fail:
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    if_null rx870_debug, debug_741
    rx870_cur."!cursor_debug"("FAIL", "term:sym<value>")
  debug_741:
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("205_1297880739.64186") :method
.annotate 'line', 4
    $P872 = self."!PREFIX__!subrule"("value", "")
    new $P873, "ResizablePMCArray"
    push $P873, $P872
    .return ($P873)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("206_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx876_tgt
    .local int rx876_pos
    .local int rx876_off
    .local int rx876_eos
    .local int rx876_rep
    .local pmc rx876_cur
    .local pmc rx876_debug
    (rx876_cur, rx876_pos, rx876_tgt, $I10) = self."!cursor_start"()
    getattribute rx876_debug, rx876_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx876_cur
    .local pmc match
    .lex "$/", match
    length rx876_eos, rx876_tgt
    gt rx876_pos, rx876_eos, rx876_done
    set rx876_off, 0
    lt rx876_pos, 2, rx876_start
    sub rx876_off, rx876_pos, 1
    substr rx876_tgt, rx876_tgt, rx876_off
  rx876_start:
    eq $I10, 1, rx876_restart
    if_null rx876_debug, debug_742
    rx876_cur."!cursor_debug"("START", "value")
  debug_742:
    $I10 = self.'from'()
    ne $I10, -1, rxscan881_done
    goto rxscan881_scan
  rxscan881_loop:
    ($P10) = rx876_cur."from"()
    inc $P10
    set rx876_pos, $P10
    ge rx876_pos, rx876_eos, rxscan881_done
  rxscan881_scan:
    set_addr $I10, rxscan881_loop
    rx876_cur."!mark_push"(0, rx876_pos, $I10)
  rxscan881_done:
  alt882_0:
.annotate 'line', 415
    set_addr $I10, alt882_1
    rx876_cur."!mark_push"(0, rx876_pos, $I10)
.annotate 'line', 416
  # rx subrule "quote" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."quote"()
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx876_pos = $P10."pos"()
    goto alt882_end
  alt882_1:
.annotate 'line', 417
  # rx subrule "number" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."number"()
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx876_pos = $P10."pos"()
  alt882_end:
.annotate 'line', 415
  # rx pass
    rx876_cur."!cursor_pass"(rx876_pos, "value")
    if_null rx876_debug, debug_743
    rx876_cur."!cursor_debug"("PASS", "value", " at pos=", rx876_pos)
  debug_743:
    .return (rx876_cur)
  rx876_restart:
.annotate 'line', 4
    if_null rx876_debug, debug_744
    rx876_cur."!cursor_debug"("NEXT", "value")
  debug_744:
  rx876_fail:
    (rx876_rep, rx876_pos, $I10, $P10) = rx876_cur."!mark_fail"(0)
    lt rx876_pos, -1, rx876_done
    eq rx876_pos, -1, rx876_fail
    jump $I10
  rx876_done:
    rx876_cur."!cursor_fail"()
    if_null rx876_debug, debug_745
    rx876_cur."!cursor_debug"("FAIL", "value")
  debug_745:
    .return (rx876_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("207_1297880739.64186") :method
.annotate 'line', 4
    $P878 = self."!PREFIX__!subrule"("number", "")
    $P879 = self."!PREFIX__!subrule"("quote", "")
    new $P880, "ResizablePMCArray"
    push $P880, $P878
    push $P880, $P879
    .return ($P880)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("208_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx884_tgt
    .local int rx884_pos
    .local int rx884_off
    .local int rx884_eos
    .local int rx884_rep
    .local pmc rx884_cur
    .local pmc rx884_debug
    (rx884_cur, rx884_pos, rx884_tgt, $I10) = self."!cursor_start"()
    getattribute rx884_debug, rx884_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx884_cur
    .local pmc match
    .lex "$/", match
    length rx884_eos, rx884_tgt
    gt rx884_pos, rx884_eos, rx884_done
    set rx884_off, 0
    lt rx884_pos, 2, rx884_start
    sub rx884_off, rx884_pos, 1
    substr rx884_tgt, rx884_tgt, rx884_off
  rx884_start:
    eq $I10, 1, rx884_restart
    if_null rx884_debug, debug_746
    rx884_cur."!cursor_debug"("START", "number")
  debug_746:
    $I10 = self.'from'()
    ne $I10, -1, rxscan887_done
    goto rxscan887_scan
  rxscan887_loop:
    ($P10) = rx884_cur."from"()
    inc $P10
    set rx884_pos, $P10
    ge rx884_pos, rx884_eos, rxscan887_done
  rxscan887_scan:
    set_addr $I10, rxscan887_loop
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  rxscan887_done:
.annotate 'line', 421
  # rx subcapture "sign"
    set_addr $I10, rxcap_889_fail
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx884_pos, rx884_off
    set rx884_rep, 0
    sub $I12, rx884_eos, rx884_pos
    le $I12, 1, rxenumcharlistq888_loop
    set $I12, 1
  rxenumcharlistq888_loop:
    le $I12, 0, rxenumcharlistq888_done
    substr $S10, rx884_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq888_done
    inc rx884_rep
  rxenumcharlistq888_done:
    add rx884_pos, rx884_pos, rx884_rep
    set_addr $I10, rxcap_889_fail
    ($I12, $I11) = rx884_cur."!mark_peek"($I10)
    rx884_cur."!cursor_pos"($I11)
    ($P10) = rx884_cur."!cursor_start"()
    $P10."!cursor_pass"(rx884_pos, "")
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_889_done
  rxcap_889_fail:
    goto rx884_fail
  rxcap_889_done:
  alt890_0:
.annotate 'line', 422
    set_addr $I10, alt890_1
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."dec_number"()
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx884_pos = $P10."pos"()
    goto alt890_end
  alt890_1:
  # rx subrule "integer" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."integer"()
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx884_pos = $P10."pos"()
  alt890_end:
.annotate 'line', 420
  # rx pass
    rx884_cur."!cursor_pass"(rx884_pos, "number")
    if_null rx884_debug, debug_747
    rx884_cur."!cursor_debug"("PASS", "number", " at pos=", rx884_pos)
  debug_747:
    .return (rx884_cur)
  rx884_restart:
.annotate 'line', 4
    if_null rx884_debug, debug_748
    rx884_cur."!cursor_debug"("NEXT", "number")
  debug_748:
  rx884_fail:
    (rx884_rep, rx884_pos, $I10, $P10) = rx884_cur."!mark_fail"(0)
    lt rx884_pos, -1, rx884_done
    eq rx884_pos, -1, rx884_fail
    jump $I10
  rx884_done:
    rx884_cur."!cursor_fail"()
    if_null rx884_debug, debug_749
    rx884_cur."!cursor_debug"("FAIL", "number")
  debug_749:
    .return (rx884_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("209_1297880739.64186") :method
.annotate 'line', 4
    new $P886, "ResizablePMCArray"
    push $P886, ""
    .return ($P886)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("210_1297880739.64186") :method
.annotate 'line', 425
    $P892 = self."!protoregex"("quote")
    .return ($P892)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("211_1297880739.64186") :method
.annotate 'line', 425
    $P894 = self."!PREFIX__!protoregex"("quote")
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("212_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    .local pmc rx896_debug
    (rx896_cur, rx896_pos, rx896_tgt, $I10) = self."!cursor_start"()
    getattribute rx896_debug, rx896_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx896_cur
    .local pmc match
    .lex "$/", match
    length rx896_eos, rx896_tgt
    gt rx896_pos, rx896_eos, rx896_done
    set rx896_off, 0
    lt rx896_pos, 2, rx896_start
    sub rx896_off, rx896_pos, 1
    substr rx896_tgt, rx896_tgt, rx896_off
  rx896_start:
    eq $I10, 1, rx896_restart
    if_null rx896_debug, debug_750
    rx896_cur."!cursor_debug"("START", "quote:sym<apos>")
  debug_750:
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
.annotate 'line', 426
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx896_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."quote_EXPR"(":q")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx896_pos = $P10."pos"()
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "quote:sym<apos>")
    if_null rx896_debug, debug_751
    rx896_cur."!cursor_debug"("PASS", "quote:sym<apos>", " at pos=", rx896_pos)
  debug_751:
    .return (rx896_cur)
  rx896_restart:
.annotate 'line', 4
    if_null rx896_debug, debug_752
    rx896_cur."!cursor_debug"("NEXT", "quote:sym<apos>")
  debug_752:
  rx896_fail:
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    if_null rx896_debug, debug_753
    rx896_cur."!cursor_debug"("FAIL", "quote:sym<apos>")
  debug_753:
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("213_1297880739.64186") :method
.annotate 'line', 4
    new $P898, "ResizablePMCArray"
    push $P898, "'"
    .return ($P898)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("214_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    .local pmc rx901_debug
    (rx901_cur, rx901_pos, rx901_tgt, $I10) = self."!cursor_start"()
    getattribute rx901_debug, rx901_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx901_cur
    .local pmc match
    .lex "$/", match
    length rx901_eos, rx901_tgt
    gt rx901_pos, rx901_eos, rx901_done
    set rx901_off, 0
    lt rx901_pos, 2, rx901_start
    sub rx901_off, rx901_pos, 1
    substr rx901_tgt, rx901_tgt, rx901_off
  rx901_start:
    eq $I10, 1, rx901_restart
    if_null rx901_debug, debug_754
    rx901_cur."!cursor_debug"("START", "quote:sym<dblq>")
  debug_754:
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
.annotate 'line', 427
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx901_pos, rx901_off
    substr $S10, rx901_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx901_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."quote_EXPR"(":qq")
    unless $P10, rx901_fail
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx901_pos = $P10."pos"()
  # rx pass
    rx901_cur."!cursor_pass"(rx901_pos, "quote:sym<dblq>")
    if_null rx901_debug, debug_755
    rx901_cur."!cursor_debug"("PASS", "quote:sym<dblq>", " at pos=", rx901_pos)
  debug_755:
    .return (rx901_cur)
  rx901_restart:
.annotate 'line', 4
    if_null rx901_debug, debug_756
    rx901_cur."!cursor_debug"("NEXT", "quote:sym<dblq>")
  debug_756:
  rx901_fail:
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    if_null rx901_debug, debug_757
    rx901_cur."!cursor_debug"("FAIL", "quote:sym<dblq>")
  debug_757:
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("215_1297880739.64186") :method
.annotate 'line', 4
    new $P903, "ResizablePMCArray"
    push $P903, "\""
    .return ($P903)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("216_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx906_tgt
    .local int rx906_pos
    .local int rx906_off
    .local int rx906_eos
    .local int rx906_rep
    .local pmc rx906_cur
    .local pmc rx906_debug
    (rx906_cur, rx906_pos, rx906_tgt, $I10) = self."!cursor_start"()
    getattribute rx906_debug, rx906_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx906_cur
    .local pmc match
    .lex "$/", match
    length rx906_eos, rx906_tgt
    gt rx906_pos, rx906_eos, rx906_done
    set rx906_off, 0
    lt rx906_pos, 2, rx906_start
    sub rx906_off, rx906_pos, 1
    substr rx906_tgt, rx906_tgt, rx906_off
  rx906_start:
    eq $I10, 1, rx906_restart
    if_null rx906_debug, debug_758
    rx906_cur."!cursor_debug"("START", "quote:sym<q>")
  debug_758:
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
.annotate 'line', 428
  # rx literal  "q"
    add $I11, rx906_pos, 1
    gt $I11, rx906_eos, rx906_fail
    sub $I11, rx906_pos, rx906_off
    ord $I11, rx906_tgt, $I11
    ne $I11, 113, rx906_fail
    add rx906_pos, 1
  # rxanchor rwb
    le rx906_pos, 0, rx906_fail
    sub $I10, rx906_pos, rx906_off
    is_cclass $I11, 8192, rx906_tgt, $I10
    if $I11, rx906_fail
    dec $I10
    is_cclass $I11, 8192, rx906_tgt, $I10
    unless $I11, rx906_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx906_pos, rx906_off
    substr $S10, rx906_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx906_fail
  # rx subrule "ws" subtype=method negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."ws"()
    unless $P10, rx906_fail
    rx906_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."quote_EXPR"(":q")
    unless $P10, rx906_fail
    rx906_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx906_pos = $P10."pos"()
  # rx pass
    rx906_cur."!cursor_pass"(rx906_pos, "quote:sym<q>")
    if_null rx906_debug, debug_759
    rx906_cur."!cursor_debug"("PASS", "quote:sym<q>", " at pos=", rx906_pos)
  debug_759:
    .return (rx906_cur)
  rx906_restart:
.annotate 'line', 4
    if_null rx906_debug, debug_760
    rx906_cur."!cursor_debug"("NEXT", "quote:sym<q>")
  debug_760:
  rx906_fail:
    (rx906_rep, rx906_pos, $I10, $P10) = rx906_cur."!mark_fail"(0)
    lt rx906_pos, -1, rx906_done
    eq rx906_pos, -1, rx906_fail
    jump $I10
  rx906_done:
    rx906_cur."!cursor_fail"()
    if_null rx906_debug, debug_761
    rx906_cur."!cursor_debug"("FAIL", "quote:sym<q>")
  debug_761:
    .return (rx906_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("217_1297880739.64186") :method
.annotate 'line', 4
    $P908 = self."!PREFIX__!subrule"("ws", "q")
    new $P909, "ResizablePMCArray"
    push $P909, $P908
    .return ($P909)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("218_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx912_tgt
    .local int rx912_pos
    .local int rx912_off
    .local int rx912_eos
    .local int rx912_rep
    .local pmc rx912_cur
    .local pmc rx912_debug
    (rx912_cur, rx912_pos, rx912_tgt, $I10) = self."!cursor_start"()
    getattribute rx912_debug, rx912_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx912_cur
    .local pmc match
    .lex "$/", match
    length rx912_eos, rx912_tgt
    gt rx912_pos, rx912_eos, rx912_done
    set rx912_off, 0
    lt rx912_pos, 2, rx912_start
    sub rx912_off, rx912_pos, 1
    substr rx912_tgt, rx912_tgt, rx912_off
  rx912_start:
    eq $I10, 1, rx912_restart
    if_null rx912_debug, debug_762
    rx912_cur."!cursor_debug"("START", "quote:sym<qq>")
  debug_762:
    $I10 = self.'from'()
    ne $I10, -1, rxscan916_done
    goto rxscan916_scan
  rxscan916_loop:
    ($P10) = rx912_cur."from"()
    inc $P10
    set rx912_pos, $P10
    ge rx912_pos, rx912_eos, rxscan916_done
  rxscan916_scan:
    set_addr $I10, rxscan916_loop
    rx912_cur."!mark_push"(0, rx912_pos, $I10)
  rxscan916_done:
.annotate 'line', 429
  # rx literal  "qq"
    add $I11, rx912_pos, 2
    gt $I11, rx912_eos, rx912_fail
    sub $I11, rx912_pos, rx912_off
    substr $S10, rx912_tgt, $I11, 2
    ne $S10, "qq", rx912_fail
    add rx912_pos, 2
  # rxanchor rwb
    le rx912_pos, 0, rx912_fail
    sub $I10, rx912_pos, rx912_off
    is_cclass $I11, 8192, rx912_tgt, $I10
    if $I11, rx912_fail
    dec $I10
    is_cclass $I11, 8192, rx912_tgt, $I10
    unless $I11, rx912_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx912_pos, rx912_off
    substr $S10, rx912_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx912_fail
  # rx subrule "ws" subtype=method negate=
    rx912_cur."!cursor_pos"(rx912_pos)
    $P10 = rx912_cur."ws"()
    unless $P10, rx912_fail
    rx912_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx912_cur."!cursor_pos"(rx912_pos)
    $P10 = rx912_cur."quote_EXPR"(":qq")
    unless $P10, rx912_fail
    rx912_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx912_pos = $P10."pos"()
  # rx pass
    rx912_cur."!cursor_pass"(rx912_pos, "quote:sym<qq>")
    if_null rx912_debug, debug_763
    rx912_cur."!cursor_debug"("PASS", "quote:sym<qq>", " at pos=", rx912_pos)
  debug_763:
    .return (rx912_cur)
  rx912_restart:
.annotate 'line', 4
    if_null rx912_debug, debug_764
    rx912_cur."!cursor_debug"("NEXT", "quote:sym<qq>")
  debug_764:
  rx912_fail:
    (rx912_rep, rx912_pos, $I10, $P10) = rx912_cur."!mark_fail"(0)
    lt rx912_pos, -1, rx912_done
    eq rx912_pos, -1, rx912_fail
    jump $I10
  rx912_done:
    rx912_cur."!cursor_fail"()
    if_null rx912_debug, debug_765
    rx912_cur."!cursor_debug"("FAIL", "quote:sym<qq>")
  debug_765:
    .return (rx912_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("219_1297880739.64186") :method
.annotate 'line', 4
    $P914 = self."!PREFIX__!subrule"("ws", "qq")
    new $P915, "ResizablePMCArray"
    push $P915, $P914
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("220_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx918_tgt
    .local int rx918_pos
    .local int rx918_off
    .local int rx918_eos
    .local int rx918_rep
    .local pmc rx918_cur
    .local pmc rx918_debug
    (rx918_cur, rx918_pos, rx918_tgt, $I10) = self."!cursor_start"()
    getattribute rx918_debug, rx918_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx918_cur
    .local pmc match
    .lex "$/", match
    length rx918_eos, rx918_tgt
    gt rx918_pos, rx918_eos, rx918_done
    set rx918_off, 0
    lt rx918_pos, 2, rx918_start
    sub rx918_off, rx918_pos, 1
    substr rx918_tgt, rx918_tgt, rx918_off
  rx918_start:
    eq $I10, 1, rx918_restart
    if_null rx918_debug, debug_766
    rx918_cur."!cursor_debug"("START", "quote:sym<Q>")
  debug_766:
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
.annotate 'line', 430
  # rx literal  "Q"
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    ord $I11, rx918_tgt, $I11
    ne $I11, 81, rx918_fail
    add rx918_pos, 1
  # rxanchor rwb
    le rx918_pos, 0, rx918_fail
    sub $I10, rx918_pos, rx918_off
    is_cclass $I11, 8192, rx918_tgt, $I10
    if $I11, rx918_fail
    dec $I10
    is_cclass $I11, 8192, rx918_tgt, $I10
    unless $I11, rx918_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx918_pos, rx918_off
    substr $S10, rx918_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx918_fail
  # rx subrule "ws" subtype=method negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."ws"()
    unless $P10, rx918_fail
    rx918_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."quote_EXPR"()
    unless $P10, rx918_fail
    rx918_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx918_pos = $P10."pos"()
  # rx pass
    rx918_cur."!cursor_pass"(rx918_pos, "quote:sym<Q>")
    if_null rx918_debug, debug_767
    rx918_cur."!cursor_debug"("PASS", "quote:sym<Q>", " at pos=", rx918_pos)
  debug_767:
    .return (rx918_cur)
  rx918_restart:
.annotate 'line', 4
    if_null rx918_debug, debug_768
    rx918_cur."!cursor_debug"("NEXT", "quote:sym<Q>")
  debug_768:
  rx918_fail:
    (rx918_rep, rx918_pos, $I10, $P10) = rx918_cur."!mark_fail"(0)
    lt rx918_pos, -1, rx918_done
    eq rx918_pos, -1, rx918_fail
    jump $I10
  rx918_done:
    rx918_cur."!cursor_fail"()
    if_null rx918_debug, debug_769
    rx918_cur."!cursor_debug"("FAIL", "quote:sym<Q>")
  debug_769:
    .return (rx918_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("221_1297880739.64186") :method
.annotate 'line', 4
    $P920 = self."!PREFIX__!subrule"("ws", "Q")
    new $P921, "ResizablePMCArray"
    push $P921, $P920
    .return ($P921)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("222_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx924_tgt
    .local int rx924_pos
    .local int rx924_off
    .local int rx924_eos
    .local int rx924_rep
    .local pmc rx924_cur
    .local pmc rx924_debug
    (rx924_cur, rx924_pos, rx924_tgt, $I10) = self."!cursor_start"()
    getattribute rx924_debug, rx924_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx924_cur
    .local pmc match
    .lex "$/", match
    length rx924_eos, rx924_tgt
    gt rx924_pos, rx924_eos, rx924_done
    set rx924_off, 0
    lt rx924_pos, 2, rx924_start
    sub rx924_off, rx924_pos, 1
    substr rx924_tgt, rx924_tgt, rx924_off
  rx924_start:
    eq $I10, 1, rx924_restart
    if_null rx924_debug, debug_770
    rx924_cur."!cursor_debug"("START", "quote:sym<Q:PIR>")
  debug_770:
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
.annotate 'line', 431
  # rx literal  "Q:PIR"
    add $I11, rx924_pos, 5
    gt $I11, rx924_eos, rx924_fail
    sub $I11, rx924_pos, rx924_off
    substr $S10, rx924_tgt, $I11, 5
    ne $S10, "Q:PIR", rx924_fail
    add rx924_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."ws"()
    unless $P10, rx924_fail
    rx924_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."quote_EXPR"()
    unless $P10, rx924_fail
    rx924_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx924_pos = $P10."pos"()
  # rx pass
    rx924_cur."!cursor_pass"(rx924_pos, "quote:sym<Q:PIR>")
    if_null rx924_debug, debug_771
    rx924_cur."!cursor_debug"("PASS", "quote:sym<Q:PIR>", " at pos=", rx924_pos)
  debug_771:
    .return (rx924_cur)
  rx924_restart:
.annotate 'line', 4
    if_null rx924_debug, debug_772
    rx924_cur."!cursor_debug"("NEXT", "quote:sym<Q:PIR>")
  debug_772:
  rx924_fail:
    (rx924_rep, rx924_pos, $I10, $P10) = rx924_cur."!mark_fail"(0)
    lt rx924_pos, -1, rx924_done
    eq rx924_pos, -1, rx924_fail
    jump $I10
  rx924_done:
    rx924_cur."!cursor_fail"()
    if_null rx924_debug, debug_773
    rx924_cur."!cursor_debug"("FAIL", "quote:sym<Q:PIR>")
  debug_773:
    .return (rx924_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("223_1297880739.64186") :method
.annotate 'line', 4
    $P926 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P927, "ResizablePMCArray"
    push $P927, $P926
    .return ($P927)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("224_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx930_tgt
    .local int rx930_pos
    .local int rx930_off
    .local int rx930_eos
    .local int rx930_rep
    .local pmc rx930_cur
    .local pmc rx930_debug
    (rx930_cur, rx930_pos, rx930_tgt, $I10) = self."!cursor_start"()
    getattribute rx930_debug, rx930_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx930_cur
    .local pmc match
    .lex "$/", match
    length rx930_eos, rx930_tgt
    gt rx930_pos, rx930_eos, rx930_done
    set rx930_off, 0
    lt rx930_pos, 2, rx930_start
    sub rx930_off, rx930_pos, 1
    substr rx930_tgt, rx930_tgt, rx930_off
  rx930_start:
    eq $I10, 1, rx930_restart
    if_null rx930_debug, debug_774
    rx930_cur."!cursor_debug"("START", "quote:sym</ />")
  debug_774:
    $I10 = self.'from'()
    ne $I10, -1, rxscan934_done
    goto rxscan934_scan
  rxscan934_loop:
    ($P10) = rx930_cur."from"()
    inc $P10
    set rx930_pos, $P10
    ge rx930_pos, rx930_eos, rxscan934_done
  rxscan934_scan:
    set_addr $I10, rxscan934_loop
    rx930_cur."!mark_push"(0, rx930_pos, $I10)
  rxscan934_done:
.annotate 'line', 433
  # rx literal  "/"
    add $I11, rx930_pos, 1
    gt $I11, rx930_eos, rx930_fail
    sub $I11, rx930_pos, rx930_off
    ord $I11, rx930_tgt, $I11
    ne $I11, 47, rx930_fail
    add rx930_pos, 1
.annotate 'line', 434
  # rx subrule "newpad" subtype=method negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."newpad"()
    unless $P10, rx930_fail
    rx930_pos = $P10."pos"()
.annotate 'line', 435
  # rx reduce name="quote:sym</ />" key="open"
    rx930_cur."!cursor_pos"(rx930_pos)
    rx930_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 436
  # rx subrule "LANG" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."LANG"("Regex", "nibbler")
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx930_pos = $P10."pos"()
.annotate 'line', 437
  # rx literal  "/"
    add $I11, rx930_pos, 1
    gt $I11, rx930_eos, rx930_fail
    sub $I11, rx930_pos, rx930_off
    ord $I11, rx930_tgt, $I11
    ne $I11, 47, rx930_fail
    add rx930_pos, 1
.annotate 'line', 432
  # rx pass
    rx930_cur."!cursor_pass"(rx930_pos, "quote:sym</ />")
    if_null rx930_debug, debug_775
    rx930_cur."!cursor_debug"("PASS", "quote:sym</ />", " at pos=", rx930_pos)
  debug_775:
    .return (rx930_cur)
  rx930_restart:
.annotate 'line', 4
    if_null rx930_debug, debug_776
    rx930_cur."!cursor_debug"("NEXT", "quote:sym</ />")
  debug_776:
  rx930_fail:
    (rx930_rep, rx930_pos, $I10, $P10) = rx930_cur."!mark_fail"(0)
    lt rx930_pos, -1, rx930_done
    eq rx930_pos, -1, rx930_fail
    jump $I10
  rx930_done:
    rx930_cur."!cursor_fail"()
    if_null rx930_debug, debug_777
    rx930_cur."!cursor_debug"("FAIL", "quote:sym</ />")
  debug_777:
    .return (rx930_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("225_1297880739.64186") :method
.annotate 'line', 4
    $P932 = self."!PREFIX__!subrule"("newpad", "/")
    new $P933, "ResizablePMCArray"
    push $P933, $P932
    .return ($P933)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("226_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx936_tgt
    .local int rx936_pos
    .local int rx936_off
    .local int rx936_eos
    .local int rx936_rep
    .local pmc rx936_cur
    .local pmc rx936_debug
    (rx936_cur, rx936_pos, rx936_tgt, $I10) = self."!cursor_start"()
    getattribute rx936_debug, rx936_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx936_cur
    .local pmc match
    .lex "$/", match
    length rx936_eos, rx936_tgt
    gt rx936_pos, rx936_eos, rx936_done
    set rx936_off, 0
    lt rx936_pos, 2, rx936_start
    sub rx936_off, rx936_pos, 1
    substr rx936_tgt, rx936_tgt, rx936_off
  rx936_start:
    eq $I10, 1, rx936_restart
    if_null rx936_debug, debug_778
    rx936_cur."!cursor_debug"("START", "quote_escape:sym<$>")
  debug_778:
    $I10 = self.'from'()
    ne $I10, -1, rxscan939_done
    goto rxscan939_scan
  rxscan939_loop:
    ($P10) = rx936_cur."from"()
    inc $P10
    set rx936_pos, $P10
    ge rx936_pos, rx936_eos, rxscan939_done
  rxscan939_scan:
    set_addr $I10, rxscan939_loop
    rx936_cur."!mark_push"(0, rx936_pos, $I10)
  rxscan939_done:
.annotate 'line', 440
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx936_pos, rx936_off
    substr $S10, rx936_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx936_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx936_cur."!cursor_pos"(rx936_pos)
    $P10 = rx936_cur."quotemod_check"("s")
    unless $P10, rx936_fail
  # rx subrule "variable" subtype=capture negate=
    rx936_cur."!cursor_pos"(rx936_pos)
    $P10 = rx936_cur."variable"()
    unless $P10, rx936_fail
    rx936_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx936_pos = $P10."pos"()
  # rx pass
    rx936_cur."!cursor_pass"(rx936_pos, "quote_escape:sym<$>")
    if_null rx936_debug, debug_779
    rx936_cur."!cursor_debug"("PASS", "quote_escape:sym<$>", " at pos=", rx936_pos)
  debug_779:
    .return (rx936_cur)
  rx936_restart:
.annotate 'line', 4
    if_null rx936_debug, debug_780
    rx936_cur."!cursor_debug"("NEXT", "quote_escape:sym<$>")
  debug_780:
  rx936_fail:
    (rx936_rep, rx936_pos, $I10, $P10) = rx936_cur."!mark_fail"(0)
    lt rx936_pos, -1, rx936_done
    eq rx936_pos, -1, rx936_fail
    jump $I10
  rx936_done:
    rx936_cur."!cursor_fail"()
    if_null rx936_debug, debug_781
    rx936_cur."!cursor_debug"("FAIL", "quote_escape:sym<$>")
  debug_781:
    .return (rx936_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("227_1297880739.64186") :method
.annotate 'line', 4
    new $P938, "ResizablePMCArray"
    push $P938, "$"
    .return ($P938)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("228_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    .local pmc rx941_debug
    (rx941_cur, rx941_pos, rx941_tgt, $I10) = self."!cursor_start"()
    getattribute rx941_debug, rx941_cur, "$!debug"
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
    eq $I10, 1, rx941_restart
    if_null rx941_debug, debug_782
    rx941_cur."!cursor_debug"("START", "quote_escape:sym<{ }>")
  debug_782:
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
.annotate 'line', 441
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx941_pos, rx941_off
    substr $S10, rx941_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx941_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."quotemod_check"("c")
    unless $P10, rx941_fail
  # rx subrule "block" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."block"()
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "quote_escape:sym<{ }>")
    if_null rx941_debug, debug_783
    rx941_cur."!cursor_debug"("PASS", "quote_escape:sym<{ }>", " at pos=", rx941_pos)
  debug_783:
    .return (rx941_cur)
  rx941_restart:
.annotate 'line', 4
    if_null rx941_debug, debug_784
    rx941_cur."!cursor_debug"("NEXT", "quote_escape:sym<{ }>")
  debug_784:
  rx941_fail:
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    if_null rx941_debug, debug_785
    rx941_cur."!cursor_debug"("FAIL", "quote_escape:sym<{ }>")
  debug_785:
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("229_1297880739.64186") :method
.annotate 'line', 4
    new $P943, "ResizablePMCArray"
    push $P943, "{"
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("230_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx946_tgt
    .local int rx946_pos
    .local int rx946_off
    .local int rx946_eos
    .local int rx946_rep
    .local pmc rx946_cur
    .local pmc rx946_debug
    (rx946_cur, rx946_pos, rx946_tgt, $I10) = self."!cursor_start"()
    getattribute rx946_debug, rx946_cur, "$!debug"
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
    eq $I10, 1, rx946_restart
    if_null rx946_debug, debug_786
    rx946_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_786:
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
.annotate 'line', 442
  # rx literal  "\\e"
    add $I11, rx946_pos, 2
    gt $I11, rx946_eos, rx946_fail
    sub $I11, rx946_pos, rx946_off
    substr $S10, rx946_tgt, $I11, 2
    ne $S10, "\\e", rx946_fail
    add rx946_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx946_cur."!cursor_pos"(rx946_pos)
    $P10 = rx946_cur."quotemod_check"("b")
    unless $P10, rx946_fail
  # rx pass
    rx946_cur."!cursor_pass"(rx946_pos, "quote_escape:sym<esc>")
    if_null rx946_debug, debug_787
    rx946_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx946_pos)
  debug_787:
    .return (rx946_cur)
  rx946_restart:
.annotate 'line', 4
    if_null rx946_debug, debug_788
    rx946_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_788:
  rx946_fail:
    (rx946_rep, rx946_pos, $I10, $P10) = rx946_cur."!mark_fail"(0)
    lt rx946_pos, -1, rx946_done
    eq rx946_pos, -1, rx946_fail
    jump $I10
  rx946_done:
    rx946_cur."!cursor_fail"()
    if_null rx946_debug, debug_789
    rx946_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_789:
    .return (rx946_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("231_1297880739.64186") :method
.annotate 'line', 4
    new $P948, "ResizablePMCArray"
    push $P948, "\\e"
    .return ($P948)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("232_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    .local pmc rx951_debug
    (rx951_cur, rx951_pos, rx951_tgt, $I10) = self."!cursor_start"()
    rx951_cur."!cursor_caparray"("EXPR")
    getattribute rx951_debug, rx951_cur, "$!debug"
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
    eq $I10, 1, rx951_restart
    if_null rx951_debug, debug_790
    rx951_cur."!cursor_debug"("START", "circumfix:sym<( )>")
  debug_790:
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
.annotate 'line', 444
  # rx literal  "("
    add $I11, rx951_pos, 1
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    ord $I11, rx951_tgt, $I11
    ne $I11, 40, rx951_fail
    add rx951_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."ws"()
    unless $P10, rx951_fail
    rx951_pos = $P10."pos"()
  # rx rxquantr956 ** 0..1
    set_addr $I10, rxquantr956_done
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  rxquantr956_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."EXPR"()
    unless $P10, rx951_fail
    goto rxsubrule957_pass
  rxsubrule957_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx951_fail
  rxsubrule957_pass:
    set_addr $I10, rxsubrule957_back
    rx951_cur."!mark_push"(0, rx951_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx951_pos = $P10."pos"()
    set_addr $I10, rxquantr956_done
    (rx951_rep) = rx951_cur."!mark_commit"($I10)
  rxquantr956_done:
  # rx literal  ")"
    add $I11, rx951_pos, 1
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    ord $I11, rx951_tgt, $I11
    ne $I11, 41, rx951_fail
    add rx951_pos, 1
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "circumfix:sym<( )>")
    if_null rx951_debug, debug_791
    rx951_cur."!cursor_debug"("PASS", "circumfix:sym<( )>", " at pos=", rx951_pos)
  debug_791:
    .return (rx951_cur)
  rx951_restart:
.annotate 'line', 4
    if_null rx951_debug, debug_792
    rx951_cur."!cursor_debug"("NEXT", "circumfix:sym<( )>")
  debug_792:
  rx951_fail:
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    if_null rx951_debug, debug_793
    rx951_cur."!cursor_debug"("FAIL", "circumfix:sym<( )>")
  debug_793:
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("233_1297880739.64186") :method
.annotate 'line', 4
    $P953 = self."!PREFIX__!subrule"("ws", "(")
    new $P954, "ResizablePMCArray"
    push $P954, $P953
    .return ($P954)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("234_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx959_tgt
    .local int rx959_pos
    .local int rx959_off
    .local int rx959_eos
    .local int rx959_rep
    .local pmc rx959_cur
    .local pmc rx959_debug
    (rx959_cur, rx959_pos, rx959_tgt, $I10) = self."!cursor_start"()
    rx959_cur."!cursor_caparray"("EXPR")
    getattribute rx959_debug, rx959_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx959_cur
    .local pmc match
    .lex "$/", match
    length rx959_eos, rx959_tgt
    gt rx959_pos, rx959_eos, rx959_done
    set rx959_off, 0
    lt rx959_pos, 2, rx959_start
    sub rx959_off, rx959_pos, 1
    substr rx959_tgt, rx959_tgt, rx959_off
  rx959_start:
    eq $I10, 1, rx959_restart
    if_null rx959_debug, debug_794
    rx959_cur."!cursor_debug"("START", "circumfix:sym<[ ]>")
  debug_794:
    $I10 = self.'from'()
    ne $I10, -1, rxscan963_done
    goto rxscan963_scan
  rxscan963_loop:
    ($P10) = rx959_cur."from"()
    inc $P10
    set rx959_pos, $P10
    ge rx959_pos, rx959_eos, rxscan963_done
  rxscan963_scan:
    set_addr $I10, rxscan963_loop
    rx959_cur."!mark_push"(0, rx959_pos, $I10)
  rxscan963_done:
.annotate 'line', 445
  # rx literal  "["
    add $I11, rx959_pos, 1
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    ord $I11, rx959_tgt, $I11
    ne $I11, 91, rx959_fail
    add rx959_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."ws"()
    unless $P10, rx959_fail
    rx959_pos = $P10."pos"()
  # rx rxquantr964 ** 0..1
    set_addr $I10, rxquantr964_done
    rx959_cur."!mark_push"(0, rx959_pos, $I10)
  rxquantr964_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."EXPR"()
    unless $P10, rx959_fail
    goto rxsubrule965_pass
  rxsubrule965_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx959_fail
  rxsubrule965_pass:
    set_addr $I10, rxsubrule965_back
    rx959_cur."!mark_push"(0, rx959_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx959_pos = $P10."pos"()
    set_addr $I10, rxquantr964_done
    (rx959_rep) = rx959_cur."!mark_commit"($I10)
  rxquantr964_done:
  # rx literal  "]"
    add $I11, rx959_pos, 1
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    ord $I11, rx959_tgt, $I11
    ne $I11, 93, rx959_fail
    add rx959_pos, 1
  # rx pass
    rx959_cur."!cursor_pass"(rx959_pos, "circumfix:sym<[ ]>")
    if_null rx959_debug, debug_795
    rx959_cur."!cursor_debug"("PASS", "circumfix:sym<[ ]>", " at pos=", rx959_pos)
  debug_795:
    .return (rx959_cur)
  rx959_restart:
.annotate 'line', 4
    if_null rx959_debug, debug_796
    rx959_cur."!cursor_debug"("NEXT", "circumfix:sym<[ ]>")
  debug_796:
  rx959_fail:
    (rx959_rep, rx959_pos, $I10, $P10) = rx959_cur."!mark_fail"(0)
    lt rx959_pos, -1, rx959_done
    eq rx959_pos, -1, rx959_fail
    jump $I10
  rx959_done:
    rx959_cur."!cursor_fail"()
    if_null rx959_debug, debug_797
    rx959_cur."!cursor_debug"("FAIL", "circumfix:sym<[ ]>")
  debug_797:
    .return (rx959_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("235_1297880739.64186") :method
.annotate 'line', 4
    $P961 = self."!PREFIX__!subrule"("ws", "[")
    new $P962, "ResizablePMCArray"
    push $P962, $P961
    .return ($P962)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("236_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    .local pmc rx967_debug
    (rx967_cur, rx967_pos, rx967_tgt, $I10) = self."!cursor_start"()
    getattribute rx967_debug, rx967_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx967_cur
    .local pmc match
    .lex "$/", match
    length rx967_eos, rx967_tgt
    gt rx967_pos, rx967_eos, rx967_done
    set rx967_off, 0
    lt rx967_pos, 2, rx967_start
    sub rx967_off, rx967_pos, 1
    substr rx967_tgt, rx967_tgt, rx967_off
  rx967_start:
    eq $I10, 1, rx967_restart
    if_null rx967_debug, debug_798
    rx967_cur."!cursor_debug"("START", "circumfix:sym<ang>")
  debug_798:
    $I10 = self.'from'()
    ne $I10, -1, rxscan970_done
    goto rxscan970_scan
  rxscan970_loop:
    ($P10) = rx967_cur."from"()
    inc $P10
    set rx967_pos, $P10
    ge rx967_pos, rx967_eos, rxscan970_done
  rxscan970_scan:
    set_addr $I10, rxscan970_loop
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  rxscan970_done:
.annotate 'line', 446
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx967_pos, rx967_off
    substr $S10, rx967_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx967_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx967_cur."!cursor_pos"(rx967_pos)
    $P10 = rx967_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx967_fail
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx967_pos = $P10."pos"()
  # rx pass
    rx967_cur."!cursor_pass"(rx967_pos, "circumfix:sym<ang>")
    if_null rx967_debug, debug_799
    rx967_cur."!cursor_debug"("PASS", "circumfix:sym<ang>", " at pos=", rx967_pos)
  debug_799:
    .return (rx967_cur)
  rx967_restart:
.annotate 'line', 4
    if_null rx967_debug, debug_800
    rx967_cur."!cursor_debug"("NEXT", "circumfix:sym<ang>")
  debug_800:
  rx967_fail:
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    if_null rx967_debug, debug_801
    rx967_cur."!cursor_debug"("FAIL", "circumfix:sym<ang>")
  debug_801:
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("237_1297880739.64186") :method
.annotate 'line', 4
    new $P969, "ResizablePMCArray"
    push $P969, "<"
    .return ($P969)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("238_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx972_tgt
    .local int rx972_pos
    .local int rx972_off
    .local int rx972_eos
    .local int rx972_rep
    .local pmc rx972_cur
    .local pmc rx972_debug
    (rx972_cur, rx972_pos, rx972_tgt, $I10) = self."!cursor_start"()
    getattribute rx972_debug, rx972_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx972_cur
    .local pmc match
    .lex "$/", match
    length rx972_eos, rx972_tgt
    gt rx972_pos, rx972_eos, rx972_done
    set rx972_off, 0
    lt rx972_pos, 2, rx972_start
    sub rx972_off, rx972_pos, 1
    substr rx972_tgt, rx972_tgt, rx972_off
  rx972_start:
    eq $I10, 1, rx972_restart
    if_null rx972_debug, debug_802
    rx972_cur."!cursor_debug"("START", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_802:
    $I10 = self.'from'()
    ne $I10, -1, rxscan975_done
    goto rxscan975_scan
  rxscan975_loop:
    ($P10) = rx972_cur."from"()
    inc $P10
    set rx972_pos, $P10
    ge rx972_pos, rx972_eos, rxscan975_done
  rxscan975_scan:
    set_addr $I10, rxscan975_loop
    rx972_cur."!mark_push"(0, rx972_pos, $I10)
  rxscan975_done:
.annotate 'line', 447
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx972_pos, rx972_off
    substr $S10, rx972_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx972_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx972_cur."!cursor_pos"(rx972_pos)
    $P10 = rx972_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx972_fail
    rx972_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx972_pos = $P10."pos"()
  # rx pass
    rx972_cur."!cursor_pass"(rx972_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    if_null rx972_debug, debug_803
    rx972_cur."!cursor_debug"("PASS", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx972_pos)
  debug_803:
    .return (rx972_cur)
  rx972_restart:
.annotate 'line', 4
    if_null rx972_debug, debug_804
    rx972_cur."!cursor_debug"("NEXT", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_804:
  rx972_fail:
    (rx972_rep, rx972_pos, $I10, $P10) = rx972_cur."!mark_fail"(0)
    lt rx972_pos, -1, rx972_done
    eq rx972_pos, -1, rx972_fail
    jump $I10
  rx972_done:
    rx972_cur."!cursor_fail"()
    if_null rx972_debug, debug_805
    rx972_cur."!cursor_debug"("FAIL", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_805:
    .return (rx972_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("239_1297880739.64186") :method
.annotate 'line', 4
    new $P974, "ResizablePMCArray"
    push $P974, unicode:"\x{ab}"
    .return ($P974)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("240_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx977_tgt
    .local int rx977_pos
    .local int rx977_off
    .local int rx977_eos
    .local int rx977_rep
    .local pmc rx977_cur
    .local pmc rx977_debug
    (rx977_cur, rx977_pos, rx977_tgt, $I10) = self."!cursor_start"()
    getattribute rx977_debug, rx977_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx977_cur
    .local pmc match
    .lex "$/", match
    length rx977_eos, rx977_tgt
    gt rx977_pos, rx977_eos, rx977_done
    set rx977_off, 0
    lt rx977_pos, 2, rx977_start
    sub rx977_off, rx977_pos, 1
    substr rx977_tgt, rx977_tgt, rx977_off
  rx977_start:
    eq $I10, 1, rx977_restart
    if_null rx977_debug, debug_806
    rx977_cur."!cursor_debug"("START", "circumfix:sym<{ }>")
  debug_806:
    $I10 = self.'from'()
    ne $I10, -1, rxscan980_done
    goto rxscan980_scan
  rxscan980_loop:
    ($P10) = rx977_cur."from"()
    inc $P10
    set rx977_pos, $P10
    ge rx977_pos, rx977_eos, rxscan980_done
  rxscan980_scan:
    set_addr $I10, rxscan980_loop
    rx977_cur."!mark_push"(0, rx977_pos, $I10)
  rxscan980_done:
.annotate 'line', 448
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx977_pos, rx977_off
    substr $S10, rx977_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx977_fail
  # rx subrule "pblock" subtype=capture negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."pblock"()
    unless $P10, rx977_fail
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx977_pos = $P10."pos"()
  # rx pass
    rx977_cur."!cursor_pass"(rx977_pos, "circumfix:sym<{ }>")
    if_null rx977_debug, debug_807
    rx977_cur."!cursor_debug"("PASS", "circumfix:sym<{ }>", " at pos=", rx977_pos)
  debug_807:
    .return (rx977_cur)
  rx977_restart:
.annotate 'line', 4
    if_null rx977_debug, debug_808
    rx977_cur."!cursor_debug"("NEXT", "circumfix:sym<{ }>")
  debug_808:
  rx977_fail:
    (rx977_rep, rx977_pos, $I10, $P10) = rx977_cur."!mark_fail"(0)
    lt rx977_pos, -1, rx977_done
    eq rx977_pos, -1, rx977_fail
    jump $I10
  rx977_done:
    rx977_cur."!cursor_fail"()
    if_null rx977_debug, debug_809
    rx977_cur."!cursor_debug"("FAIL", "circumfix:sym<{ }>")
  debug_809:
    .return (rx977_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("241_1297880739.64186") :method
.annotate 'line', 4
    new $P979, "ResizablePMCArray"
    push $P979, "{"
    .return ($P979)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("242_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    .local pmc rx982_debug
    (rx982_cur, rx982_pos, rx982_tgt, $I10) = self."!cursor_start"()
    getattribute rx982_debug, rx982_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx982_cur
    .local pmc match
    .lex "$/", match
    length rx982_eos, rx982_tgt
    gt rx982_pos, rx982_eos, rx982_done
    set rx982_off, 0
    lt rx982_pos, 2, rx982_start
    sub rx982_off, rx982_pos, 1
    substr rx982_tgt, rx982_tgt, rx982_off
  rx982_start:
    eq $I10, 1, rx982_restart
    if_null rx982_debug, debug_810
    rx982_cur."!cursor_debug"("START", "circumfix:sym<sigil>")
  debug_810:
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
.annotate 'line', 449
  # rx subrule "sigil" subtype=capture negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."sigil"()
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx982_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    ord $I11, rx982_tgt, $I11
    ne $I11, 40, rx982_fail
    add rx982_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."semilist"()
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx982_pos = $P10."pos"()
  alt987_0:
    set_addr $I10, alt987_1
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  # rx literal  ")"
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    ord $I11, rx982_tgt, $I11
    ne $I11, 41, rx982_fail
    add rx982_pos, 1
    goto alt987_end
  alt987_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."FAILGOAL"("')'")
    unless $P10, rx982_fail
    goto rxsubrule989_pass
  rxsubrule989_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx982_fail
  rxsubrule989_pass:
    set_addr $I10, rxsubrule989_back
    rx982_cur."!mark_push"(0, rx982_pos, $I10, $P10)
    rx982_pos = $P10."pos"()
  alt987_end:
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "circumfix:sym<sigil>")
    if_null rx982_debug, debug_811
    rx982_cur."!cursor_debug"("PASS", "circumfix:sym<sigil>", " at pos=", rx982_pos)
  debug_811:
    .return (rx982_cur)
  rx982_restart:
.annotate 'line', 4
    if_null rx982_debug, debug_812
    rx982_cur."!cursor_debug"("NEXT", "circumfix:sym<sigil>")
  debug_812:
  rx982_fail:
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    if_null rx982_debug, debug_813
    rx982_cur."!cursor_debug"("FAIL", "circumfix:sym<sigil>")
  debug_813:
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("243_1297880739.64186") :method
.annotate 'line', 4
    $P984 = self."!PREFIX__!subrule"("sigil", "")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("244_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 4
    .local string rx991_tgt
    .local int rx991_pos
    .local int rx991_off
    .local int rx991_eos
    .local int rx991_rep
    .local pmc rx991_cur
    .local pmc rx991_debug
    (rx991_cur, rx991_pos, rx991_tgt, $I10) = self."!cursor_start"()
    getattribute rx991_debug, rx991_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx991_cur
    .local pmc match
    .lex "$/", match
    length rx991_eos, rx991_tgt
    gt rx991_pos, rx991_eos, rx991_done
    set rx991_off, 0
    lt rx991_pos, 2, rx991_start
    sub rx991_off, rx991_pos, 1
    substr rx991_tgt, rx991_tgt, rx991_off
  rx991_start:
    eq $I10, 1, rx991_restart
    if_null rx991_debug, debug_814
    rx991_cur."!cursor_debug"("START", "semilist")
  debug_814:
    $I10 = self.'from'()
    ne $I10, -1, rxscan995_done
    goto rxscan995_scan
  rxscan995_loop:
    ($P10) = rx991_cur."from"()
    inc $P10
    set rx991_pos, $P10
    ge rx991_pos, rx991_eos, rxscan995_done
  rxscan995_scan:
    set_addr $I10, rxscan995_loop
    rx991_cur."!mark_push"(0, rx991_pos, $I10)
  rxscan995_done:
.annotate 'line', 451
  # rx subrule "ws" subtype=method negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."ws"()
    unless $P10, rx991_fail
    rx991_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."statement"()
    unless $P10, rx991_fail
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx991_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."ws"()
    unless $P10, rx991_fail
    rx991_pos = $P10."pos"()
  # rx pass
    rx991_cur."!cursor_pass"(rx991_pos, "semilist")
    if_null rx991_debug, debug_815
    rx991_cur."!cursor_debug"("PASS", "semilist", " at pos=", rx991_pos)
  debug_815:
    .return (rx991_cur)
  rx991_restart:
.annotate 'line', 4
    if_null rx991_debug, debug_816
    rx991_cur."!cursor_debug"("NEXT", "semilist")
  debug_816:
  rx991_fail:
    (rx991_rep, rx991_pos, $I10, $P10) = rx991_cur."!mark_fail"(0)
    lt rx991_pos, -1, rx991_done
    eq rx991_pos, -1, rx991_fail
    jump $I10
  rx991_done:
    rx991_cur."!cursor_fail"()
    if_null rx991_debug, debug_817
    rx991_cur."!cursor_debug"("FAIL", "semilist")
  debug_817:
    .return (rx991_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("245_1297880739.64186") :method
.annotate 'line', 4
    $P993 = self."!PREFIX__!subrule"("ws", "")
    new $P994, "ResizablePMCArray"
    push $P994, $P993
    .return ($P994)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("246_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx999_tgt
    .local int rx999_pos
    .local int rx999_off
    .local int rx999_eos
    .local int rx999_rep
    .local pmc rx999_cur
    .local pmc rx999_debug
    (rx999_cur, rx999_pos, rx999_tgt, $I10) = self."!cursor_start"()
    getattribute rx999_debug, rx999_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx999_cur
    .local pmc match
    .lex "$/", match
    length rx999_eos, rx999_tgt
    gt rx999_pos, rx999_eos, rx999_done
    set rx999_off, 0
    lt rx999_pos, 2, rx999_start
    sub rx999_off, rx999_pos, 1
    substr rx999_tgt, rx999_tgt, rx999_off
  rx999_start:
    eq $I10, 1, rx999_restart
    if_null rx999_debug, debug_818
    rx999_cur."!cursor_debug"("START", "infixish")
  debug_818:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1002_done
    goto rxscan1002_scan
  rxscan1002_loop:
    ($P10) = rx999_cur."from"()
    inc $P10
    set rx999_pos, $P10
    ge rx999_pos, rx999_eos, rxscan1002_done
  rxscan1002_scan:
    set_addr $I10, rxscan1002_loop
    rx999_cur."!mark_push"(0, rx999_pos, $I10)
  rxscan1002_done:
.annotate 'line', 474
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."infixstopper"()
    if $P10, rx999_fail
  # rx subrule "infix" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."infix"()
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx999_pos = $P10."pos"()
  # rx pass
    rx999_cur."!cursor_pass"(rx999_pos, "infixish")
    if_null rx999_debug, debug_819
    rx999_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx999_pos)
  debug_819:
    .return (rx999_cur)
  rx999_restart:
.annotate 'line', 455
    if_null rx999_debug, debug_820
    rx999_cur."!cursor_debug"("NEXT", "infixish")
  debug_820:
  rx999_fail:
    (rx999_rep, rx999_pos, $I10, $P10) = rx999_cur."!mark_fail"(0)
    lt rx999_pos, -1, rx999_done
    eq rx999_pos, -1, rx999_fail
    jump $I10
  rx999_done:
    rx999_cur."!cursor_fail"()
    if_null rx999_debug, debug_821
    rx999_cur."!cursor_debug"("FAIL", "infixish")
  debug_821:
    .return (rx999_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("247_1297880739.64186") :method
.annotate 'line', 455
    new $P1001, "ResizablePMCArray"
    push $P1001, ""
    .return ($P1001)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("248_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1004_tgt
    .local int rx1004_pos
    .local int rx1004_off
    .local int rx1004_eos
    .local int rx1004_rep
    .local pmc rx1004_cur
    .local pmc rx1004_debug
    (rx1004_cur, rx1004_pos, rx1004_tgt, $I10) = self."!cursor_start"()
    getattribute rx1004_debug, rx1004_cur, "$!debug"
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
    eq $I10, 1, rx1004_restart
    if_null rx1004_debug, debug_822
    rx1004_cur."!cursor_debug"("START", "infixstopper")
  debug_822:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1007_done
    goto rxscan1007_scan
  rxscan1007_loop:
    ($P10) = rx1004_cur."from"()
    inc $P10
    set rx1004_pos, $P10
    ge rx1004_pos, rx1004_eos, rxscan1007_done
  rxscan1007_scan:
    set_addr $I10, rxscan1007_loop
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
  rxscan1007_done:
.annotate 'line', 475
  # rx subrule "lambda" subtype=zerowidth negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."lambda"()
    unless $P10, rx1004_fail
  # rx pass
    rx1004_cur."!cursor_pass"(rx1004_pos, "infixstopper")
    if_null rx1004_debug, debug_823
    rx1004_cur."!cursor_debug"("PASS", "infixstopper", " at pos=", rx1004_pos)
  debug_823:
    .return (rx1004_cur)
  rx1004_restart:
.annotate 'line', 455
    if_null rx1004_debug, debug_824
    rx1004_cur."!cursor_debug"("NEXT", "infixstopper")
  debug_824:
  rx1004_fail:
    (rx1004_rep, rx1004_pos, $I10, $P10) = rx1004_cur."!mark_fail"(0)
    lt rx1004_pos, -1, rx1004_done
    eq rx1004_pos, -1, rx1004_fail
    jump $I10
  rx1004_done:
    rx1004_cur."!cursor_fail"()
    if_null rx1004_debug, debug_825
    rx1004_cur."!cursor_debug"("FAIL", "infixstopper")
  debug_825:
    .return (rx1004_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("249_1297880739.64186") :method
.annotate 'line', 455
    new $P1006, "ResizablePMCArray"
    push $P1006, ""
    .return ($P1006)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("250_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    .local pmc rx1009_debug
    (rx1009_cur, rx1009_pos, rx1009_tgt, $I10) = self."!cursor_start"()
    getattribute rx1009_debug, rx1009_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1009_cur
    .local pmc match
    .lex "$/", match
    length rx1009_eos, rx1009_tgt
    gt rx1009_pos, rx1009_eos, rx1009_done
    set rx1009_off, 0
    lt rx1009_pos, 2, rx1009_start
    sub rx1009_off, rx1009_pos, 1
    substr rx1009_tgt, rx1009_tgt, rx1009_off
  rx1009_start:
    eq $I10, 1, rx1009_restart
    if_null rx1009_debug, debug_826
    rx1009_cur."!cursor_debug"("START", "postcircumfix:sym<[ ]>")
  debug_826:
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
.annotate 'line', 478
  # rx literal  "["
    add $I11, rx1009_pos, 1
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    ord $I11, rx1009_tgt, $I11
    ne $I11, 91, rx1009_fail
    add rx1009_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."ws"()
    unless $P10, rx1009_fail
    rx1009_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."EXPR"()
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1009_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1009_pos, 1
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    ord $I11, rx1009_tgt, $I11
    ne $I11, 93, rx1009_fail
    add rx1009_pos, 1
.annotate 'line', 479
  # rx subrule "O" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."O"("%methodop")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
.annotate 'line', 477
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "postcircumfix:sym<[ ]>")
    if_null rx1009_debug, debug_827
    rx1009_cur."!cursor_debug"("PASS", "postcircumfix:sym<[ ]>", " at pos=", rx1009_pos)
  debug_827:
    .return (rx1009_cur)
  rx1009_restart:
.annotate 'line', 455
    if_null rx1009_debug, debug_828
    rx1009_cur."!cursor_debug"("NEXT", "postcircumfix:sym<[ ]>")
  debug_828:
  rx1009_fail:
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    if_null rx1009_debug, debug_829
    rx1009_cur."!cursor_debug"("FAIL", "postcircumfix:sym<[ ]>")
  debug_829:
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("251_1297880739.64186") :method
.annotate 'line', 455
    $P1011 = self."!PREFIX__!subrule"("ws", "[")
    new $P1012, "ResizablePMCArray"
    push $P1012, $P1011
    .return ($P1012)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("252_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1015_tgt
    .local int rx1015_pos
    .local int rx1015_off
    .local int rx1015_eos
    .local int rx1015_rep
    .local pmc rx1015_cur
    .local pmc rx1015_debug
    (rx1015_cur, rx1015_pos, rx1015_tgt, $I10) = self."!cursor_start"()
    getattribute rx1015_debug, rx1015_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1015_cur
    .local pmc match
    .lex "$/", match
    length rx1015_eos, rx1015_tgt
    gt rx1015_pos, rx1015_eos, rx1015_done
    set rx1015_off, 0
    lt rx1015_pos, 2, rx1015_start
    sub rx1015_off, rx1015_pos, 1
    substr rx1015_tgt, rx1015_tgt, rx1015_off
  rx1015_start:
    eq $I10, 1, rx1015_restart
    if_null rx1015_debug, debug_830
    rx1015_cur."!cursor_debug"("START", "postcircumfix:sym<{ }>")
  debug_830:
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
.annotate 'line', 483
  # rx literal  "{"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    ord $I11, rx1015_tgt, $I11
    ne $I11, 123, rx1015_fail
    add rx1015_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."ws"()
    unless $P10, rx1015_fail
    rx1015_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."EXPR"()
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1015_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    ord $I11, rx1015_tgt, $I11
    ne $I11, 125, rx1015_fail
    add rx1015_pos, 1
.annotate 'line', 484
  # rx subrule "O" subtype=capture negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."O"("%methodop")
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1015_pos = $P10."pos"()
.annotate 'line', 482
  # rx pass
    rx1015_cur."!cursor_pass"(rx1015_pos, "postcircumfix:sym<{ }>")
    if_null rx1015_debug, debug_831
    rx1015_cur."!cursor_debug"("PASS", "postcircumfix:sym<{ }>", " at pos=", rx1015_pos)
  debug_831:
    .return (rx1015_cur)
  rx1015_restart:
.annotate 'line', 455
    if_null rx1015_debug, debug_832
    rx1015_cur."!cursor_debug"("NEXT", "postcircumfix:sym<{ }>")
  debug_832:
  rx1015_fail:
    (rx1015_rep, rx1015_pos, $I10, $P10) = rx1015_cur."!mark_fail"(0)
    lt rx1015_pos, -1, rx1015_done
    eq rx1015_pos, -1, rx1015_fail
    jump $I10
  rx1015_done:
    rx1015_cur."!cursor_fail"()
    if_null rx1015_debug, debug_833
    rx1015_cur."!cursor_debug"("FAIL", "postcircumfix:sym<{ }>")
  debug_833:
    .return (rx1015_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("253_1297880739.64186") :method
.annotate 'line', 455
    $P1017 = self."!PREFIX__!subrule"("ws", "{")
    new $P1018, "ResizablePMCArray"
    push $P1018, $P1017
    .return ($P1018)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("254_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1021_tgt
    .local int rx1021_pos
    .local int rx1021_off
    .local int rx1021_eos
    .local int rx1021_rep
    .local pmc rx1021_cur
    .local pmc rx1021_debug
    (rx1021_cur, rx1021_pos, rx1021_tgt, $I10) = self."!cursor_start"()
    getattribute rx1021_debug, rx1021_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1021_cur
    .local pmc match
    .lex "$/", match
    length rx1021_eos, rx1021_tgt
    gt rx1021_pos, rx1021_eos, rx1021_done
    set rx1021_off, 0
    lt rx1021_pos, 2, rx1021_start
    sub rx1021_off, rx1021_pos, 1
    substr rx1021_tgt, rx1021_tgt, rx1021_off
  rx1021_start:
    eq $I10, 1, rx1021_restart
    if_null rx1021_debug, debug_834
    rx1021_cur."!cursor_debug"("START", "postcircumfix:sym<ang>")
  debug_834:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1024_done
    goto rxscan1024_scan
  rxscan1024_loop:
    ($P10) = rx1021_cur."from"()
    inc $P10
    set rx1021_pos, $P10
    ge rx1021_pos, rx1021_eos, rxscan1024_done
  rxscan1024_scan:
    set_addr $I10, rxscan1024_loop
    rx1021_cur."!mark_push"(0, rx1021_pos, $I10)
  rxscan1024_done:
.annotate 'line', 488
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1021_pos, rx1021_off
    substr $S10, rx1021_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1021_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1021_cur."!cursor_pos"(rx1021_pos)
    $P10 = rx1021_cur."quote_EXPR"(":q")
    unless $P10, rx1021_fail
    rx1021_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1021_pos = $P10."pos"()
.annotate 'line', 489
  # rx subrule "O" subtype=capture negate=
    rx1021_cur."!cursor_pos"(rx1021_pos)
    $P10 = rx1021_cur."O"("%methodop")
    unless $P10, rx1021_fail
    rx1021_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1021_pos = $P10."pos"()
.annotate 'line', 487
  # rx pass
    rx1021_cur."!cursor_pass"(rx1021_pos, "postcircumfix:sym<ang>")
    if_null rx1021_debug, debug_835
    rx1021_cur."!cursor_debug"("PASS", "postcircumfix:sym<ang>", " at pos=", rx1021_pos)
  debug_835:
    .return (rx1021_cur)
  rx1021_restart:
.annotate 'line', 455
    if_null rx1021_debug, debug_836
    rx1021_cur."!cursor_debug"("NEXT", "postcircumfix:sym<ang>")
  debug_836:
  rx1021_fail:
    (rx1021_rep, rx1021_pos, $I10, $P10) = rx1021_cur."!mark_fail"(0)
    lt rx1021_pos, -1, rx1021_done
    eq rx1021_pos, -1, rx1021_fail
    jump $I10
  rx1021_done:
    rx1021_cur."!cursor_fail"()
    if_null rx1021_debug, debug_837
    rx1021_cur."!cursor_debug"("FAIL", "postcircumfix:sym<ang>")
  debug_837:
    .return (rx1021_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("255_1297880739.64186") :method
.annotate 'line', 455
    new $P1023, "ResizablePMCArray"
    push $P1023, "<"
    .return ($P1023)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("256_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1026_tgt
    .local int rx1026_pos
    .local int rx1026_off
    .local int rx1026_eos
    .local int rx1026_rep
    .local pmc rx1026_cur
    .local pmc rx1026_debug
    (rx1026_cur, rx1026_pos, rx1026_tgt, $I10) = self."!cursor_start"()
    getattribute rx1026_debug, rx1026_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1026_cur
    .local pmc match
    .lex "$/", match
    length rx1026_eos, rx1026_tgt
    gt rx1026_pos, rx1026_eos, rx1026_done
    set rx1026_off, 0
    lt rx1026_pos, 2, rx1026_start
    sub rx1026_off, rx1026_pos, 1
    substr rx1026_tgt, rx1026_tgt, rx1026_off
  rx1026_start:
    eq $I10, 1, rx1026_restart
    if_null rx1026_debug, debug_838
    rx1026_cur."!cursor_debug"("START", "postcircumfix:sym<( )>")
  debug_838:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1030_done
    goto rxscan1030_scan
  rxscan1030_loop:
    ($P10) = rx1026_cur."from"()
    inc $P10
    set rx1026_pos, $P10
    ge rx1026_pos, rx1026_eos, rxscan1030_done
  rxscan1030_scan:
    set_addr $I10, rxscan1030_loop
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  rxscan1030_done:
.annotate 'line', 493
  # rx literal  "("
    add $I11, rx1026_pos, 1
    gt $I11, rx1026_eos, rx1026_fail
    sub $I11, rx1026_pos, rx1026_off
    ord $I11, rx1026_tgt, $I11
    ne $I11, 40, rx1026_fail
    add rx1026_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."ws"()
    unless $P10, rx1026_fail
    rx1026_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."arglist"()
    unless $P10, rx1026_fail
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1026_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1026_pos, 1
    gt $I11, rx1026_eos, rx1026_fail
    sub $I11, rx1026_pos, rx1026_off
    ord $I11, rx1026_tgt, $I11
    ne $I11, 41, rx1026_fail
    add rx1026_pos, 1
.annotate 'line', 494
  # rx subrule "O" subtype=capture negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."O"("%methodop")
    unless $P10, rx1026_fail
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1026_pos = $P10."pos"()
.annotate 'line', 492
  # rx pass
    rx1026_cur."!cursor_pass"(rx1026_pos, "postcircumfix:sym<( )>")
    if_null rx1026_debug, debug_839
    rx1026_cur."!cursor_debug"("PASS", "postcircumfix:sym<( )>", " at pos=", rx1026_pos)
  debug_839:
    .return (rx1026_cur)
  rx1026_restart:
.annotate 'line', 455
    if_null rx1026_debug, debug_840
    rx1026_cur."!cursor_debug"("NEXT", "postcircumfix:sym<( )>")
  debug_840:
  rx1026_fail:
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    if_null rx1026_debug, debug_841
    rx1026_cur."!cursor_debug"("FAIL", "postcircumfix:sym<( )>")
  debug_841:
    .return (rx1026_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("257_1297880739.64186") :method
.annotate 'line', 455
    $P1028 = self."!PREFIX__!subrule"("ws", "(")
    new $P1029, "ResizablePMCArray"
    push $P1029, $P1028
    .return ($P1029)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("258_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1032_tgt
    .local int rx1032_pos
    .local int rx1032_off
    .local int rx1032_eos
    .local int rx1032_rep
    .local pmc rx1032_cur
    .local pmc rx1032_debug
    (rx1032_cur, rx1032_pos, rx1032_tgt, $I10) = self."!cursor_start"()
    getattribute rx1032_debug, rx1032_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1032_cur
    .local pmc match
    .lex "$/", match
    length rx1032_eos, rx1032_tgt
    gt rx1032_pos, rx1032_eos, rx1032_done
    set rx1032_off, 0
    lt rx1032_pos, 2, rx1032_start
    sub rx1032_off, rx1032_pos, 1
    substr rx1032_tgt, rx1032_tgt, rx1032_off
  rx1032_start:
    eq $I10, 1, rx1032_restart
    if_null rx1032_debug, debug_842
    rx1032_cur."!cursor_debug"("START", "postfix:sym<.>")
  debug_842:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1036_done
    goto rxscan1036_scan
  rxscan1036_loop:
    ($P10) = rx1032_cur."from"()
    inc $P10
    set rx1032_pos, $P10
    ge rx1032_pos, rx1032_eos, rxscan1036_done
  rxscan1036_scan:
    set_addr $I10, rxscan1036_loop
    rx1032_cur."!mark_push"(0, rx1032_pos, $I10)
  rxscan1036_done:
.annotate 'line', 497
  # rx subrule "dotty" subtype=capture negate=
    rx1032_cur."!cursor_pos"(rx1032_pos)
    $P10 = rx1032_cur."dotty"()
    unless $P10, rx1032_fail
    rx1032_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1032_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1032_cur."!cursor_pos"(rx1032_pos)
    $P10 = rx1032_cur."O"("%methodop")
    unless $P10, rx1032_fail
    rx1032_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1032_pos = $P10."pos"()
  # rx pass
    rx1032_cur."!cursor_pass"(rx1032_pos, "postfix:sym<.>")
    if_null rx1032_debug, debug_843
    rx1032_cur."!cursor_debug"("PASS", "postfix:sym<.>", " at pos=", rx1032_pos)
  debug_843:
    .return (rx1032_cur)
  rx1032_restart:
.annotate 'line', 455
    if_null rx1032_debug, debug_844
    rx1032_cur."!cursor_debug"("NEXT", "postfix:sym<.>")
  debug_844:
  rx1032_fail:
    (rx1032_rep, rx1032_pos, $I10, $P10) = rx1032_cur."!mark_fail"(0)
    lt rx1032_pos, -1, rx1032_done
    eq rx1032_pos, -1, rx1032_fail
    jump $I10
  rx1032_done:
    rx1032_cur."!cursor_fail"()
    if_null rx1032_debug, debug_845
    rx1032_cur."!cursor_debug"("FAIL", "postfix:sym<.>")
  debug_845:
    .return (rx1032_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("259_1297880739.64186") :method
.annotate 'line', 455
    $P1034 = self."!PREFIX__!subrule"("dotty", "")
    new $P1035, "ResizablePMCArray"
    push $P1035, $P1034
    .return ($P1035)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("260_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    .local pmc rx1038_debug
    (rx1038_cur, rx1038_pos, rx1038_tgt, $I10) = self."!cursor_start"()
    getattribute rx1038_debug, rx1038_cur, "$!debug"
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
    eq $I10, 1, rx1038_restart
    if_null rx1038_debug, debug_846
    rx1038_cur."!cursor_debug"("START", "prefix:sym<++>")
  debug_846:
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
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1043_fail
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  # rx literal  "++"
    add $I11, rx1038_pos, 2
    gt $I11, rx1038_eos, rx1038_fail
    sub $I11, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I11, 2
    ne $S10, "++", rx1038_fail
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
    $P10 = rx1038_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1038_pos = $P10."pos"()
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "prefix:sym<++>")
    if_null rx1038_debug, debug_847
    rx1038_cur."!cursor_debug"("PASS", "prefix:sym<++>", " at pos=", rx1038_pos)
  debug_847:
    .return (rx1038_cur)
  rx1038_restart:
.annotate 'line', 455
    if_null rx1038_debug, debug_848
    rx1038_cur."!cursor_debug"("NEXT", "prefix:sym<++>")
  debug_848:
  rx1038_fail:
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    if_null rx1038_debug, debug_849
    rx1038_cur."!cursor_debug"("FAIL", "prefix:sym<++>")
  debug_849:
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("261_1297880739.64186") :method
.annotate 'line', 455
    $P1040 = self."!PREFIX__!subrule"("O", "++")
    new $P1041, "ResizablePMCArray"
    push $P1041, $P1040
    .return ($P1041)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("262_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1045_tgt
    .local int rx1045_pos
    .local int rx1045_off
    .local int rx1045_eos
    .local int rx1045_rep
    .local pmc rx1045_cur
    .local pmc rx1045_debug
    (rx1045_cur, rx1045_pos, rx1045_tgt, $I10) = self."!cursor_start"()
    getattribute rx1045_debug, rx1045_cur, "$!debug"
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
    eq $I10, 1, rx1045_restart
    if_null rx1045_debug, debug_850
    rx1045_cur."!cursor_debug"("START", "prefix:sym<-->")
  debug_850:
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
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1050_fail
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  # rx literal  "--"
    add $I11, rx1045_pos, 2
    gt $I11, rx1045_eos, rx1045_fail
    sub $I11, rx1045_pos, rx1045_off
    substr $S10, rx1045_tgt, $I11, 2
    ne $S10, "--", rx1045_fail
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
    $P10 = rx1045_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1045_fail
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1045_pos = $P10."pos"()
  # rx pass
    rx1045_cur."!cursor_pass"(rx1045_pos, "prefix:sym<-->")
    if_null rx1045_debug, debug_851
    rx1045_cur."!cursor_debug"("PASS", "prefix:sym<-->", " at pos=", rx1045_pos)
  debug_851:
    .return (rx1045_cur)
  rx1045_restart:
.annotate 'line', 455
    if_null rx1045_debug, debug_852
    rx1045_cur."!cursor_debug"("NEXT", "prefix:sym<-->")
  debug_852:
  rx1045_fail:
    (rx1045_rep, rx1045_pos, $I10, $P10) = rx1045_cur."!mark_fail"(0)
    lt rx1045_pos, -1, rx1045_done
    eq rx1045_pos, -1, rx1045_fail
    jump $I10
  rx1045_done:
    rx1045_cur."!cursor_fail"()
    if_null rx1045_debug, debug_853
    rx1045_cur."!cursor_debug"("FAIL", "prefix:sym<-->")
  debug_853:
    .return (rx1045_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("263_1297880739.64186") :method
.annotate 'line', 455
    $P1047 = self."!PREFIX__!subrule"("O", "--")
    new $P1048, "ResizablePMCArray"
    push $P1048, $P1047
    .return ($P1048)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("264_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    .local pmc rx1052_debug
    (rx1052_cur, rx1052_pos, rx1052_tgt, $I10) = self."!cursor_start"()
    getattribute rx1052_debug, rx1052_cur, "$!debug"
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
    eq $I10, 1, rx1052_restart
    if_null rx1052_debug, debug_854
    rx1052_cur."!cursor_debug"("START", "postfix:sym<++>")
  debug_854:
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1057_fail
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  # rx literal  "++"
    add $I11, rx1052_pos, 2
    gt $I11, rx1052_eos, rx1052_fail
    sub $I11, rx1052_pos, rx1052_off
    substr $S10, rx1052_tgt, $I11, 2
    ne $S10, "++", rx1052_fail
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
    $P10 = rx1052_cur."O"("%autoincrement")
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "postfix:sym<++>")
    if_null rx1052_debug, debug_855
    rx1052_cur."!cursor_debug"("PASS", "postfix:sym<++>", " at pos=", rx1052_pos)
  debug_855:
    .return (rx1052_cur)
  rx1052_restart:
.annotate 'line', 455
    if_null rx1052_debug, debug_856
    rx1052_cur."!cursor_debug"("NEXT", "postfix:sym<++>")
  debug_856:
  rx1052_fail:
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    if_null rx1052_debug, debug_857
    rx1052_cur."!cursor_debug"("FAIL", "postfix:sym<++>")
  debug_857:
    .return (rx1052_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("265_1297880739.64186") :method
.annotate 'line', 455
    $P1054 = self."!PREFIX__!subrule"("O", "++")
    new $P1055, "ResizablePMCArray"
    push $P1055, $P1054
    .return ($P1055)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("266_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1059_tgt
    .local int rx1059_pos
    .local int rx1059_off
    .local int rx1059_eos
    .local int rx1059_rep
    .local pmc rx1059_cur
    .local pmc rx1059_debug
    (rx1059_cur, rx1059_pos, rx1059_tgt, $I10) = self."!cursor_start"()
    getattribute rx1059_debug, rx1059_cur, "$!debug"
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
    eq $I10, 1, rx1059_restart
    if_null rx1059_debug, debug_858
    rx1059_cur."!cursor_debug"("START", "postfix:sym<-->")
  debug_858:
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
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1064_fail
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  # rx literal  "--"
    add $I11, rx1059_pos, 2
    gt $I11, rx1059_eos, rx1059_fail
    sub $I11, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I11, 2
    ne $S10, "--", rx1059_fail
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
    $P10 = rx1059_cur."O"("%autoincrement")
    unless $P10, rx1059_fail
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1059_pos = $P10."pos"()
  # rx pass
    rx1059_cur."!cursor_pass"(rx1059_pos, "postfix:sym<-->")
    if_null rx1059_debug, debug_859
    rx1059_cur."!cursor_debug"("PASS", "postfix:sym<-->", " at pos=", rx1059_pos)
  debug_859:
    .return (rx1059_cur)
  rx1059_restart:
.annotate 'line', 455
    if_null rx1059_debug, debug_860
    rx1059_cur."!cursor_debug"("NEXT", "postfix:sym<-->")
  debug_860:
  rx1059_fail:
    (rx1059_rep, rx1059_pos, $I10, $P10) = rx1059_cur."!mark_fail"(0)
    lt rx1059_pos, -1, rx1059_done
    eq rx1059_pos, -1, rx1059_fail
    jump $I10
  rx1059_done:
    rx1059_cur."!cursor_fail"()
    if_null rx1059_debug, debug_861
    rx1059_cur."!cursor_debug"("FAIL", "postfix:sym<-->")
  debug_861:
    .return (rx1059_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("267_1297880739.64186") :method
.annotate 'line', 455
    $P1061 = self."!PREFIX__!subrule"("O", "--")
    new $P1062, "ResizablePMCArray"
    push $P1062, $P1061
    .return ($P1062)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("268_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1066_tgt
    .local int rx1066_pos
    .local int rx1066_off
    .local int rx1066_eos
    .local int rx1066_rep
    .local pmc rx1066_cur
    .local pmc rx1066_debug
    (rx1066_cur, rx1066_pos, rx1066_tgt, $I10) = self."!cursor_start"()
    getattribute rx1066_debug, rx1066_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1066_cur
    .local pmc match
    .lex "$/", match
    length rx1066_eos, rx1066_tgt
    gt rx1066_pos, rx1066_eos, rx1066_done
    set rx1066_off, 0
    lt rx1066_pos, 2, rx1066_start
    sub rx1066_off, rx1066_pos, 1
    substr rx1066_tgt, rx1066_tgt, rx1066_off
  rx1066_start:
    eq $I10, 1, rx1066_restart
    if_null rx1066_debug, debug_862
    rx1066_cur."!cursor_debug"("START", "infix:sym<**>")
  debug_862:
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
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1071_fail
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  # rx literal  "**"
    add $I11, rx1066_pos, 2
    gt $I11, rx1066_eos, rx1066_fail
    sub $I11, rx1066_pos, rx1066_off
    substr $S10, rx1066_tgt, $I11, 2
    ne $S10, "**", rx1066_fail
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
    $P10 = rx1066_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1066_fail
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1066_pos = $P10."pos"()
  # rx pass
    rx1066_cur."!cursor_pass"(rx1066_pos, "infix:sym<**>")
    if_null rx1066_debug, debug_863
    rx1066_cur."!cursor_debug"("PASS", "infix:sym<**>", " at pos=", rx1066_pos)
  debug_863:
    .return (rx1066_cur)
  rx1066_restart:
.annotate 'line', 455
    if_null rx1066_debug, debug_864
    rx1066_cur."!cursor_debug"("NEXT", "infix:sym<**>")
  debug_864:
  rx1066_fail:
    (rx1066_rep, rx1066_pos, $I10, $P10) = rx1066_cur."!mark_fail"(0)
    lt rx1066_pos, -1, rx1066_done
    eq rx1066_pos, -1, rx1066_fail
    jump $I10
  rx1066_done:
    rx1066_cur."!cursor_fail"()
    if_null rx1066_debug, debug_865
    rx1066_cur."!cursor_debug"("FAIL", "infix:sym<**>")
  debug_865:
    .return (rx1066_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("269_1297880739.64186") :method
.annotate 'line', 455
    $P1068 = self."!PREFIX__!subrule"("O", "**")
    new $P1069, "ResizablePMCArray"
    push $P1069, $P1068
    .return ($P1069)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("270_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1073_tgt
    .local int rx1073_pos
    .local int rx1073_off
    .local int rx1073_eos
    .local int rx1073_rep
    .local pmc rx1073_cur
    .local pmc rx1073_debug
    (rx1073_cur, rx1073_pos, rx1073_tgt, $I10) = self."!cursor_start"()
    getattribute rx1073_debug, rx1073_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1073_cur
    .local pmc match
    .lex "$/", match
    length rx1073_eos, rx1073_tgt
    gt rx1073_pos, rx1073_eos, rx1073_done
    set rx1073_off, 0
    lt rx1073_pos, 2, rx1073_start
    sub rx1073_off, rx1073_pos, 1
    substr rx1073_tgt, rx1073_tgt, rx1073_off
  rx1073_start:
    eq $I10, 1, rx1073_restart
    if_null rx1073_debug, debug_866
    rx1073_cur."!cursor_debug"("START", "prefix:sym<+>")
  debug_866:
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
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1078_fail
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  # rx literal  "+"
    add $I11, rx1073_pos, 1
    gt $I11, rx1073_eos, rx1073_fail
    sub $I11, rx1073_pos, rx1073_off
    ord $I11, rx1073_tgt, $I11
    ne $I11, 43, rx1073_fail
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
    $P10 = rx1073_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1073_fail
    rx1073_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1073_pos = $P10."pos"()
  # rx pass
    rx1073_cur."!cursor_pass"(rx1073_pos, "prefix:sym<+>")
    if_null rx1073_debug, debug_867
    rx1073_cur."!cursor_debug"("PASS", "prefix:sym<+>", " at pos=", rx1073_pos)
  debug_867:
    .return (rx1073_cur)
  rx1073_restart:
.annotate 'line', 455
    if_null rx1073_debug, debug_868
    rx1073_cur."!cursor_debug"("NEXT", "prefix:sym<+>")
  debug_868:
  rx1073_fail:
    (rx1073_rep, rx1073_pos, $I10, $P10) = rx1073_cur."!mark_fail"(0)
    lt rx1073_pos, -1, rx1073_done
    eq rx1073_pos, -1, rx1073_fail
    jump $I10
  rx1073_done:
    rx1073_cur."!cursor_fail"()
    if_null rx1073_debug, debug_869
    rx1073_cur."!cursor_debug"("FAIL", "prefix:sym<+>")
  debug_869:
    .return (rx1073_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("271_1297880739.64186") :method
.annotate 'line', 455
    $P1075 = self."!PREFIX__!subrule"("O", "+")
    new $P1076, "ResizablePMCArray"
    push $P1076, $P1075
    .return ($P1076)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("272_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1080_tgt
    .local int rx1080_pos
    .local int rx1080_off
    .local int rx1080_eos
    .local int rx1080_rep
    .local pmc rx1080_cur
    .local pmc rx1080_debug
    (rx1080_cur, rx1080_pos, rx1080_tgt, $I10) = self."!cursor_start"()
    getattribute rx1080_debug, rx1080_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1080_cur
    .local pmc match
    .lex "$/", match
    length rx1080_eos, rx1080_tgt
    gt rx1080_pos, rx1080_eos, rx1080_done
    set rx1080_off, 0
    lt rx1080_pos, 2, rx1080_start
    sub rx1080_off, rx1080_pos, 1
    substr rx1080_tgt, rx1080_tgt, rx1080_off
  rx1080_start:
    eq $I10, 1, rx1080_restart
    if_null rx1080_debug, debug_870
    rx1080_cur."!cursor_debug"("START", "prefix:sym<~>")
  debug_870:
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
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1085_fail
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  # rx literal  "~"
    add $I11, rx1080_pos, 1
    gt $I11, rx1080_eos, rx1080_fail
    sub $I11, rx1080_pos, rx1080_off
    ord $I11, rx1080_tgt, $I11
    ne $I11, 126, rx1080_fail
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
    $P10 = rx1080_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1080_fail
    rx1080_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1080_pos = $P10."pos"()
  # rx pass
    rx1080_cur."!cursor_pass"(rx1080_pos, "prefix:sym<~>")
    if_null rx1080_debug, debug_871
    rx1080_cur."!cursor_debug"("PASS", "prefix:sym<~>", " at pos=", rx1080_pos)
  debug_871:
    .return (rx1080_cur)
  rx1080_restart:
.annotate 'line', 455
    if_null rx1080_debug, debug_872
    rx1080_cur."!cursor_debug"("NEXT", "prefix:sym<~>")
  debug_872:
  rx1080_fail:
    (rx1080_rep, rx1080_pos, $I10, $P10) = rx1080_cur."!mark_fail"(0)
    lt rx1080_pos, -1, rx1080_done
    eq rx1080_pos, -1, rx1080_fail
    jump $I10
  rx1080_done:
    rx1080_cur."!cursor_fail"()
    if_null rx1080_debug, debug_873
    rx1080_cur."!cursor_debug"("FAIL", "prefix:sym<~>")
  debug_873:
    .return (rx1080_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("273_1297880739.64186") :method
.annotate 'line', 455
    $P1082 = self."!PREFIX__!subrule"("O", "~")
    new $P1083, "ResizablePMCArray"
    push $P1083, $P1082
    .return ($P1083)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("274_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1087_tgt
    .local int rx1087_pos
    .local int rx1087_off
    .local int rx1087_eos
    .local int rx1087_rep
    .local pmc rx1087_cur
    .local pmc rx1087_debug
    (rx1087_cur, rx1087_pos, rx1087_tgt, $I10) = self."!cursor_start"()
    getattribute rx1087_debug, rx1087_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1087_cur
    .local pmc match
    .lex "$/", match
    length rx1087_eos, rx1087_tgt
    gt rx1087_pos, rx1087_eos, rx1087_done
    set rx1087_off, 0
    lt rx1087_pos, 2, rx1087_start
    sub rx1087_off, rx1087_pos, 1
    substr rx1087_tgt, rx1087_tgt, rx1087_off
  rx1087_start:
    eq $I10, 1, rx1087_restart
    if_null rx1087_debug, debug_874
    rx1087_cur."!cursor_debug"("START", "prefix:sym<->")
  debug_874:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1090_done
    goto rxscan1090_scan
  rxscan1090_loop:
    ($P10) = rx1087_cur."from"()
    inc $P10
    set rx1087_pos, $P10
    ge rx1087_pos, rx1087_eos, rxscan1090_done
  rxscan1090_scan:
    set_addr $I10, rxscan1090_loop
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  rxscan1090_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1091_fail
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  # rx literal  "-"
    add $I11, rx1087_pos, 1
    gt $I11, rx1087_eos, rx1087_fail
    sub $I11, rx1087_pos, rx1087_off
    ord $I11, rx1087_tgt, $I11
    ne $I11, 45, rx1087_fail
    add rx1087_pos, 1
    set_addr $I10, rxcap_1091_fail
    ($I12, $I11) = rx1087_cur."!mark_peek"($I10)
    rx1087_cur."!cursor_pos"($I11)
    ($P10) = rx1087_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1087_pos, "")
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1091_done
  rxcap_1091_fail:
    goto rx1087_fail
  rxcap_1091_done:
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1087_pos, rx1087_off
    substr $S10, rx1087_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1087_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1087_cur."!cursor_pos"(rx1087_pos)
    $P10 = rx1087_cur."number"()
    if $P10, rx1087_fail
  # rx subrule "O" subtype=capture negate=
    rx1087_cur."!cursor_pos"(rx1087_pos)
    $P10 = rx1087_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1087_fail
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1087_pos = $P10."pos"()
  # rx pass
    rx1087_cur."!cursor_pass"(rx1087_pos, "prefix:sym<->")
    if_null rx1087_debug, debug_875
    rx1087_cur."!cursor_debug"("PASS", "prefix:sym<->", " at pos=", rx1087_pos)
  debug_875:
    .return (rx1087_cur)
  rx1087_restart:
.annotate 'line', 455
    if_null rx1087_debug, debug_876
    rx1087_cur."!cursor_debug"("NEXT", "prefix:sym<->")
  debug_876:
  rx1087_fail:
    (rx1087_rep, rx1087_pos, $I10, $P10) = rx1087_cur."!mark_fail"(0)
    lt rx1087_pos, -1, rx1087_done
    eq rx1087_pos, -1, rx1087_fail
    jump $I10
  rx1087_done:
    rx1087_cur."!cursor_fail"()
    if_null rx1087_debug, debug_877
    rx1087_cur."!cursor_debug"("FAIL", "prefix:sym<->")
  debug_877:
    .return (rx1087_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("275_1297880739.64186") :method
.annotate 'line', 455
    new $P1089, "ResizablePMCArray"
    push $P1089, "-"
    .return ($P1089)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("276_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1093_tgt
    .local int rx1093_pos
    .local int rx1093_off
    .local int rx1093_eos
    .local int rx1093_rep
    .local pmc rx1093_cur
    .local pmc rx1093_debug
    (rx1093_cur, rx1093_pos, rx1093_tgt, $I10) = self."!cursor_start"()
    getattribute rx1093_debug, rx1093_cur, "$!debug"
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
    eq $I10, 1, rx1093_restart
    if_null rx1093_debug, debug_878
    rx1093_cur."!cursor_debug"("START", "prefix:sym<?>")
  debug_878:
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
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1098_fail
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  # rx literal  "?"
    add $I11, rx1093_pos, 1
    gt $I11, rx1093_eos, rx1093_fail
    sub $I11, rx1093_pos, rx1093_off
    ord $I11, rx1093_tgt, $I11
    ne $I11, 63, rx1093_fail
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
    $P10 = rx1093_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1093_fail
    rx1093_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1093_pos = $P10."pos"()
  # rx pass
    rx1093_cur."!cursor_pass"(rx1093_pos, "prefix:sym<?>")
    if_null rx1093_debug, debug_879
    rx1093_cur."!cursor_debug"("PASS", "prefix:sym<?>", " at pos=", rx1093_pos)
  debug_879:
    .return (rx1093_cur)
  rx1093_restart:
.annotate 'line', 455
    if_null rx1093_debug, debug_880
    rx1093_cur."!cursor_debug"("NEXT", "prefix:sym<?>")
  debug_880:
  rx1093_fail:
    (rx1093_rep, rx1093_pos, $I10, $P10) = rx1093_cur."!mark_fail"(0)
    lt rx1093_pos, -1, rx1093_done
    eq rx1093_pos, -1, rx1093_fail
    jump $I10
  rx1093_done:
    rx1093_cur."!cursor_fail"()
    if_null rx1093_debug, debug_881
    rx1093_cur."!cursor_debug"("FAIL", "prefix:sym<?>")
  debug_881:
    .return (rx1093_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("277_1297880739.64186") :method
.annotate 'line', 455
    $P1095 = self."!PREFIX__!subrule"("O", "?")
    new $P1096, "ResizablePMCArray"
    push $P1096, $P1095
    .return ($P1096)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("278_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1100_tgt
    .local int rx1100_pos
    .local int rx1100_off
    .local int rx1100_eos
    .local int rx1100_rep
    .local pmc rx1100_cur
    .local pmc rx1100_debug
    (rx1100_cur, rx1100_pos, rx1100_tgt, $I10) = self."!cursor_start"()
    getattribute rx1100_debug, rx1100_cur, "$!debug"
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
    eq $I10, 1, rx1100_restart
    if_null rx1100_debug, debug_882
    rx1100_cur."!cursor_debug"("START", "prefix:sym<!>")
  debug_882:
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
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1105_fail
    rx1100_cur."!mark_push"(0, rx1100_pos, $I10)
  # rx literal  "!"
    add $I11, rx1100_pos, 1
    gt $I11, rx1100_eos, rx1100_fail
    sub $I11, rx1100_pos, rx1100_off
    ord $I11, rx1100_tgt, $I11
    ne $I11, 33, rx1100_fail
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
    $P10 = rx1100_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1100_fail
    rx1100_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1100_pos = $P10."pos"()
  # rx pass
    rx1100_cur."!cursor_pass"(rx1100_pos, "prefix:sym<!>")
    if_null rx1100_debug, debug_883
    rx1100_cur."!cursor_debug"("PASS", "prefix:sym<!>", " at pos=", rx1100_pos)
  debug_883:
    .return (rx1100_cur)
  rx1100_restart:
.annotate 'line', 455
    if_null rx1100_debug, debug_884
    rx1100_cur."!cursor_debug"("NEXT", "prefix:sym<!>")
  debug_884:
  rx1100_fail:
    (rx1100_rep, rx1100_pos, $I10, $P10) = rx1100_cur."!mark_fail"(0)
    lt rx1100_pos, -1, rx1100_done
    eq rx1100_pos, -1, rx1100_fail
    jump $I10
  rx1100_done:
    rx1100_cur."!cursor_fail"()
    if_null rx1100_debug, debug_885
    rx1100_cur."!cursor_debug"("FAIL", "prefix:sym<!>")
  debug_885:
    .return (rx1100_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("279_1297880739.64186") :method
.annotate 'line', 455
    $P1102 = self."!PREFIX__!subrule"("O", "!")
    new $P1103, "ResizablePMCArray"
    push $P1103, $P1102
    .return ($P1103)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("280_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1107_tgt
    .local int rx1107_pos
    .local int rx1107_off
    .local int rx1107_eos
    .local int rx1107_rep
    .local pmc rx1107_cur
    .local pmc rx1107_debug
    (rx1107_cur, rx1107_pos, rx1107_tgt, $I10) = self."!cursor_start"()
    getattribute rx1107_debug, rx1107_cur, "$!debug"
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
    eq $I10, 1, rx1107_restart
    if_null rx1107_debug, debug_886
    rx1107_cur."!cursor_debug"("START", "prefix:sym<|>")
  debug_886:
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
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1112_fail
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  # rx literal  "|"
    add $I11, rx1107_pos, 1
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    ord $I11, rx1107_tgt, $I11
    ne $I11, 124, rx1107_fail
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
    $P10 = rx1107_cur."O"("%symbolic_unary")
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1107_pos = $P10."pos"()
  # rx pass
    rx1107_cur."!cursor_pass"(rx1107_pos, "prefix:sym<|>")
    if_null rx1107_debug, debug_887
    rx1107_cur."!cursor_debug"("PASS", "prefix:sym<|>", " at pos=", rx1107_pos)
  debug_887:
    .return (rx1107_cur)
  rx1107_restart:
.annotate 'line', 455
    if_null rx1107_debug, debug_888
    rx1107_cur."!cursor_debug"("NEXT", "prefix:sym<|>")
  debug_888:
  rx1107_fail:
    (rx1107_rep, rx1107_pos, $I10, $P10) = rx1107_cur."!mark_fail"(0)
    lt rx1107_pos, -1, rx1107_done
    eq rx1107_pos, -1, rx1107_fail
    jump $I10
  rx1107_done:
    rx1107_cur."!cursor_fail"()
    if_null rx1107_debug, debug_889
    rx1107_cur."!cursor_debug"("FAIL", "prefix:sym<|>")
  debug_889:
    .return (rx1107_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("281_1297880739.64186") :method
.annotate 'line', 455
    $P1109 = self."!PREFIX__!subrule"("O", "|")
    new $P1110, "ResizablePMCArray"
    push $P1110, $P1109
    .return ($P1110)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("282_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1114_tgt
    .local int rx1114_pos
    .local int rx1114_off
    .local int rx1114_eos
    .local int rx1114_rep
    .local pmc rx1114_cur
    .local pmc rx1114_debug
    (rx1114_cur, rx1114_pos, rx1114_tgt, $I10) = self."!cursor_start"()
    getattribute rx1114_debug, rx1114_cur, "$!debug"
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
    eq $I10, 1, rx1114_restart
    if_null rx1114_debug, debug_890
    rx1114_cur."!cursor_debug"("START", "infix:sym<*>")
  debug_890:
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
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1119_fail
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  # rx literal  "*"
    add $I11, rx1114_pos, 1
    gt $I11, rx1114_eos, rx1114_fail
    sub $I11, rx1114_pos, rx1114_off
    ord $I11, rx1114_tgt, $I11
    ne $I11, 42, rx1114_fail
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
    $P10 = rx1114_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1114_fail
    rx1114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1114_pos = $P10."pos"()
  # rx pass
    rx1114_cur."!cursor_pass"(rx1114_pos, "infix:sym<*>")
    if_null rx1114_debug, debug_891
    rx1114_cur."!cursor_debug"("PASS", "infix:sym<*>", " at pos=", rx1114_pos)
  debug_891:
    .return (rx1114_cur)
  rx1114_restart:
.annotate 'line', 455
    if_null rx1114_debug, debug_892
    rx1114_cur."!cursor_debug"("NEXT", "infix:sym<*>")
  debug_892:
  rx1114_fail:
    (rx1114_rep, rx1114_pos, $I10, $P10) = rx1114_cur."!mark_fail"(0)
    lt rx1114_pos, -1, rx1114_done
    eq rx1114_pos, -1, rx1114_fail
    jump $I10
  rx1114_done:
    rx1114_cur."!cursor_fail"()
    if_null rx1114_debug, debug_893
    rx1114_cur."!cursor_debug"("FAIL", "infix:sym<*>")
  debug_893:
    .return (rx1114_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("283_1297880739.64186") :method
.annotate 'line', 455
    $P1116 = self."!PREFIX__!subrule"("O", "*")
    new $P1117, "ResizablePMCArray"
    push $P1117, $P1116
    .return ($P1117)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("284_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    .local pmc rx1121_debug
    (rx1121_cur, rx1121_pos, rx1121_tgt, $I10) = self."!cursor_start"()
    getattribute rx1121_debug, rx1121_cur, "$!debug"
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
    eq $I10, 1, rx1121_restart
    if_null rx1121_debug, debug_894
    rx1121_cur."!cursor_debug"("START", "infix:sym</>")
  debug_894:
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
.annotate 'line', 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1126_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "/"
    add $I11, rx1121_pos, 1
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    ord $I11, rx1121_tgt, $I11
    ne $I11, 47, rx1121_fail
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
    $P10 = rx1121_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1121_fail
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1121_pos = $P10."pos"()
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "infix:sym</>")
    if_null rx1121_debug, debug_895
    rx1121_cur."!cursor_debug"("PASS", "infix:sym</>", " at pos=", rx1121_pos)
  debug_895:
    .return (rx1121_cur)
  rx1121_restart:
.annotate 'line', 455
    if_null rx1121_debug, debug_896
    rx1121_cur."!cursor_debug"("NEXT", "infix:sym</>")
  debug_896:
  rx1121_fail:
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    if_null rx1121_debug, debug_897
    rx1121_cur."!cursor_debug"("FAIL", "infix:sym</>")
  debug_897:
    .return (rx1121_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("285_1297880739.64186") :method
.annotate 'line', 455
    $P1123 = self."!PREFIX__!subrule"("O", "/")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("286_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1128_tgt
    .local int rx1128_pos
    .local int rx1128_off
    .local int rx1128_eos
    .local int rx1128_rep
    .local pmc rx1128_cur
    .local pmc rx1128_debug
    (rx1128_cur, rx1128_pos, rx1128_tgt, $I10) = self."!cursor_start"()
    getattribute rx1128_debug, rx1128_cur, "$!debug"
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
    eq $I10, 1, rx1128_restart
    if_null rx1128_debug, debug_898
    rx1128_cur."!cursor_debug"("START", "infix:sym<%>")
  debug_898:
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
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1133_fail
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  # rx literal  "%"
    add $I11, rx1128_pos, 1
    gt $I11, rx1128_eos, rx1128_fail
    sub $I11, rx1128_pos, rx1128_off
    ord $I11, rx1128_tgt, $I11
    ne $I11, 37, rx1128_fail
    add rx1128_pos, 1
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
    $P10 = rx1128_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1128_fail
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1128_pos = $P10."pos"()
  # rx pass
    rx1128_cur."!cursor_pass"(rx1128_pos, "infix:sym<%>")
    if_null rx1128_debug, debug_899
    rx1128_cur."!cursor_debug"("PASS", "infix:sym<%>", " at pos=", rx1128_pos)
  debug_899:
    .return (rx1128_cur)
  rx1128_restart:
.annotate 'line', 455
    if_null rx1128_debug, debug_900
    rx1128_cur."!cursor_debug"("NEXT", "infix:sym<%>")
  debug_900:
  rx1128_fail:
    (rx1128_rep, rx1128_pos, $I10, $P10) = rx1128_cur."!mark_fail"(0)
    lt rx1128_pos, -1, rx1128_done
    eq rx1128_pos, -1, rx1128_fail
    jump $I10
  rx1128_done:
    rx1128_cur."!cursor_fail"()
    if_null rx1128_debug, debug_901
    rx1128_cur."!cursor_debug"("FAIL", "infix:sym<%>")
  debug_901:
    .return (rx1128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("287_1297880739.64186") :method
.annotate 'line', 455
    $P1130 = self."!PREFIX__!subrule"("O", "%")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("288_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    .local pmc rx1135_debug
    (rx1135_cur, rx1135_pos, rx1135_tgt, $I10) = self."!cursor_start"()
    getattribute rx1135_debug, rx1135_cur, "$!debug"
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
    eq $I10, 1, rx1135_restart
    if_null rx1135_debug, debug_902
    rx1135_cur."!cursor_debug"("START", "infix:sym<+&>")
  debug_902:
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
.annotate 'line', 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "+&"
    add $I11, rx1135_pos, 2
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 2
    ne $S10, "+&", rx1135_fail
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
    $P10 = rx1135_cur."O"("%multiplicative, :pirop<band III>")
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1135_pos = $P10."pos"()
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<+&>")
    if_null rx1135_debug, debug_903
    rx1135_cur."!cursor_debug"("PASS", "infix:sym<+&>", " at pos=", rx1135_pos)
  debug_903:
    .return (rx1135_cur)
  rx1135_restart:
.annotate 'line', 455
    if_null rx1135_debug, debug_904
    rx1135_cur."!cursor_debug"("NEXT", "infix:sym<+&>")
  debug_904:
  rx1135_fail:
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    if_null rx1135_debug, debug_905
    rx1135_cur."!cursor_debug"("FAIL", "infix:sym<+&>")
  debug_905:
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("289_1297880739.64186") :method
.annotate 'line', 455
    $P1137 = self."!PREFIX__!subrule"("O", "+&")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("290_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    .local pmc rx1142_debug
    (rx1142_cur, rx1142_pos, rx1142_tgt, $I10) = self."!cursor_start"()
    getattribute rx1142_debug, rx1142_cur, "$!debug"
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
    eq $I10, 1, rx1142_restart
    if_null rx1142_debug, debug_906
    rx1142_cur."!cursor_debug"("START", "infix:sym<+>")
  debug_906:
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
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  "+"
    add $I11, rx1142_pos, 1
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    ord $I11, rx1142_tgt, $I11
    ne $I11, 43, rx1142_fail
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
    $P10 = rx1142_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<+>")
    if_null rx1142_debug, debug_907
    rx1142_cur."!cursor_debug"("PASS", "infix:sym<+>", " at pos=", rx1142_pos)
  debug_907:
    .return (rx1142_cur)
  rx1142_restart:
.annotate 'line', 455
    if_null rx1142_debug, debug_908
    rx1142_cur."!cursor_debug"("NEXT", "infix:sym<+>")
  debug_908:
  rx1142_fail:
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    if_null rx1142_debug, debug_909
    rx1142_cur."!cursor_debug"("FAIL", "infix:sym<+>")
  debug_909:
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("291_1297880739.64186") :method
.annotate 'line', 455
    $P1144 = self."!PREFIX__!subrule"("O", "+")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("292_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    .local pmc rx1149_debug
    (rx1149_cur, rx1149_pos, rx1149_tgt, $I10) = self."!cursor_start"()
    getattribute rx1149_debug, rx1149_cur, "$!debug"
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
    eq $I10, 1, rx1149_restart
    if_null rx1149_debug, debug_910
    rx1149_cur."!cursor_debug"("START", "infix:sym<->")
  debug_910:
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
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1154_fail
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  # rx literal  "-"
    add $I11, rx1149_pos, 1
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    ord $I11, rx1149_tgt, $I11
    ne $I11, 45, rx1149_fail
    add rx1149_pos, 1
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
    $P10 = rx1149_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<->")
    if_null rx1149_debug, debug_911
    rx1149_cur."!cursor_debug"("PASS", "infix:sym<->", " at pos=", rx1149_pos)
  debug_911:
    .return (rx1149_cur)
  rx1149_restart:
.annotate 'line', 455
    if_null rx1149_debug, debug_912
    rx1149_cur."!cursor_debug"("NEXT", "infix:sym<->")
  debug_912:
  rx1149_fail:
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    if_null rx1149_debug, debug_913
    rx1149_cur."!cursor_debug"("FAIL", "infix:sym<->")
  debug_913:
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("293_1297880739.64186") :method
.annotate 'line', 455
    $P1151 = self."!PREFIX__!subrule"("O", "-")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("294_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    .local pmc rx1156_debug
    (rx1156_cur, rx1156_pos, rx1156_tgt, $I10) = self."!cursor_start"()
    getattribute rx1156_debug, rx1156_cur, "$!debug"
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
    eq $I10, 1, rx1156_restart
    if_null rx1156_debug, debug_914
    rx1156_cur."!cursor_debug"("START", "infix:sym<+|>")
  debug_914:
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
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1161_fail
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  # rx literal  "+|"
    add $I11, rx1156_pos, 2
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    substr $S10, rx1156_tgt, $I11, 2
    ne $S10, "+|", rx1156_fail
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
    $P10 = rx1156_cur."O"("%additive, :pirop<bor III>")
    unless $P10, rx1156_fail
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1156_pos = $P10."pos"()
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "infix:sym<+|>")
    if_null rx1156_debug, debug_915
    rx1156_cur."!cursor_debug"("PASS", "infix:sym<+|>", " at pos=", rx1156_pos)
  debug_915:
    .return (rx1156_cur)
  rx1156_restart:
.annotate 'line', 455
    if_null rx1156_debug, debug_916
    rx1156_cur."!cursor_debug"("NEXT", "infix:sym<+|>")
  debug_916:
  rx1156_fail:
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    if_null rx1156_debug, debug_917
    rx1156_cur."!cursor_debug"("FAIL", "infix:sym<+|>")
  debug_917:
    .return (rx1156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("295_1297880739.64186") :method
.annotate 'line', 455
    $P1158 = self."!PREFIX__!subrule"("O", "+|")
    new $P1159, "ResizablePMCArray"
    push $P1159, $P1158
    .return ($P1159)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("296_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1163_tgt
    .local int rx1163_pos
    .local int rx1163_off
    .local int rx1163_eos
    .local int rx1163_rep
    .local pmc rx1163_cur
    .local pmc rx1163_debug
    (rx1163_cur, rx1163_pos, rx1163_tgt, $I10) = self."!cursor_start"()
    getattribute rx1163_debug, rx1163_cur, "$!debug"
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
    eq $I10, 1, rx1163_restart
    if_null rx1163_debug, debug_918
    rx1163_cur."!cursor_debug"("START", "infix:sym<+^>")
  debug_918:
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
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1168_fail
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  # rx literal  "+^"
    add $I11, rx1163_pos, 2
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 2
    ne $S10, "+^", rx1163_fail
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
    $P10 = rx1163_cur."O"("%additive, :pirop<bxor III>")
    unless $P10, rx1163_fail
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1163_pos = $P10."pos"()
  # rx pass
    rx1163_cur."!cursor_pass"(rx1163_pos, "infix:sym<+^>")
    if_null rx1163_debug, debug_919
    rx1163_cur."!cursor_debug"("PASS", "infix:sym<+^>", " at pos=", rx1163_pos)
  debug_919:
    .return (rx1163_cur)
  rx1163_restart:
.annotate 'line', 455
    if_null rx1163_debug, debug_920
    rx1163_cur."!cursor_debug"("NEXT", "infix:sym<+^>")
  debug_920:
  rx1163_fail:
    (rx1163_rep, rx1163_pos, $I10, $P10) = rx1163_cur."!mark_fail"(0)
    lt rx1163_pos, -1, rx1163_done
    eq rx1163_pos, -1, rx1163_fail
    jump $I10
  rx1163_done:
    rx1163_cur."!cursor_fail"()
    if_null rx1163_debug, debug_921
    rx1163_cur."!cursor_debug"("FAIL", "infix:sym<+^>")
  debug_921:
    .return (rx1163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("297_1297880739.64186") :method
.annotate 'line', 455
    $P1165 = self."!PREFIX__!subrule"("O", "+^")
    new $P1166, "ResizablePMCArray"
    push $P1166, $P1165
    .return ($P1166)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("298_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1170_tgt
    .local int rx1170_pos
    .local int rx1170_off
    .local int rx1170_eos
    .local int rx1170_rep
    .local pmc rx1170_cur
    .local pmc rx1170_debug
    (rx1170_cur, rx1170_pos, rx1170_tgt, $I10) = self."!cursor_start"()
    getattribute rx1170_debug, rx1170_cur, "$!debug"
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
    eq $I10, 1, rx1170_restart
    if_null rx1170_debug, debug_922
    rx1170_cur."!cursor_debug"("START", "infix:sym<~>")
  debug_922:
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
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1175_fail
    rx1170_cur."!mark_push"(0, rx1170_pos, $I10)
  # rx literal  "~"
    add $I11, rx1170_pos, 1
    gt $I11, rx1170_eos, rx1170_fail
    sub $I11, rx1170_pos, rx1170_off
    ord $I11, rx1170_tgt, $I11
    ne $I11, 126, rx1170_fail
    add rx1170_pos, 1
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
    $P10 = rx1170_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1170_fail
    rx1170_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1170_pos = $P10."pos"()
  # rx pass
    rx1170_cur."!cursor_pass"(rx1170_pos, "infix:sym<~>")
    if_null rx1170_debug, debug_923
    rx1170_cur."!cursor_debug"("PASS", "infix:sym<~>", " at pos=", rx1170_pos)
  debug_923:
    .return (rx1170_cur)
  rx1170_restart:
.annotate 'line', 455
    if_null rx1170_debug, debug_924
    rx1170_cur."!cursor_debug"("NEXT", "infix:sym<~>")
  debug_924:
  rx1170_fail:
    (rx1170_rep, rx1170_pos, $I10, $P10) = rx1170_cur."!mark_fail"(0)
    lt rx1170_pos, -1, rx1170_done
    eq rx1170_pos, -1, rx1170_fail
    jump $I10
  rx1170_done:
    rx1170_cur."!cursor_fail"()
    if_null rx1170_debug, debug_925
    rx1170_cur."!cursor_debug"("FAIL", "infix:sym<~>")
  debug_925:
    .return (rx1170_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("299_1297880739.64186") :method
.annotate 'line', 455
    $P1172 = self."!PREFIX__!subrule"("O", "~")
    new $P1173, "ResizablePMCArray"
    push $P1173, $P1172
    .return ($P1173)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("300_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    .local pmc rx1177_debug
    (rx1177_cur, rx1177_pos, rx1177_tgt, $I10) = self."!cursor_start"()
    getattribute rx1177_debug, rx1177_cur, "$!debug"
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
    eq $I10, 1, rx1177_restart
    if_null rx1177_debug, debug_926
    rx1177_cur."!cursor_debug"("START", "infix:sym<==>")
  debug_926:
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
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1182_fail
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  # rx literal  "=="
    add $I11, rx1177_pos, 2
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 2
    ne $S10, "==", rx1177_fail
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
    $P10 = rx1177_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1177_pos = $P10."pos"()
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "infix:sym<==>")
    if_null rx1177_debug, debug_927
    rx1177_cur."!cursor_debug"("PASS", "infix:sym<==>", " at pos=", rx1177_pos)
  debug_927:
    .return (rx1177_cur)
  rx1177_restart:
.annotate 'line', 455
    if_null rx1177_debug, debug_928
    rx1177_cur."!cursor_debug"("NEXT", "infix:sym<==>")
  debug_928:
  rx1177_fail:
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    if_null rx1177_debug, debug_929
    rx1177_cur."!cursor_debug"("FAIL", "infix:sym<==>")
  debug_929:
    .return (rx1177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("301_1297880739.64186") :method
.annotate 'line', 455
    $P1179 = self."!PREFIX__!subrule"("O", "==")
    new $P1180, "ResizablePMCArray"
    push $P1180, $P1179
    .return ($P1180)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("302_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1184_tgt
    .local int rx1184_pos
    .local int rx1184_off
    .local int rx1184_eos
    .local int rx1184_rep
    .local pmc rx1184_cur
    .local pmc rx1184_debug
    (rx1184_cur, rx1184_pos, rx1184_tgt, $I10) = self."!cursor_start"()
    getattribute rx1184_debug, rx1184_cur, "$!debug"
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
    eq $I10, 1, rx1184_restart
    if_null rx1184_debug, debug_930
    rx1184_cur."!cursor_debug"("START", "infix:sym<!=>")
  debug_930:
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
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1189_fail
    rx1184_cur."!mark_push"(0, rx1184_pos, $I10)
  # rx literal  "!="
    add $I11, rx1184_pos, 2
    gt $I11, rx1184_eos, rx1184_fail
    sub $I11, rx1184_pos, rx1184_off
    substr $S10, rx1184_tgt, $I11, 2
    ne $S10, "!=", rx1184_fail
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
    $P10 = rx1184_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1184_fail
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1184_pos = $P10."pos"()
  # rx pass
    rx1184_cur."!cursor_pass"(rx1184_pos, "infix:sym<!=>")
    if_null rx1184_debug, debug_931
    rx1184_cur."!cursor_debug"("PASS", "infix:sym<!=>", " at pos=", rx1184_pos)
  debug_931:
    .return (rx1184_cur)
  rx1184_restart:
.annotate 'line', 455
    if_null rx1184_debug, debug_932
    rx1184_cur."!cursor_debug"("NEXT", "infix:sym<!=>")
  debug_932:
  rx1184_fail:
    (rx1184_rep, rx1184_pos, $I10, $P10) = rx1184_cur."!mark_fail"(0)
    lt rx1184_pos, -1, rx1184_done
    eq rx1184_pos, -1, rx1184_fail
    jump $I10
  rx1184_done:
    rx1184_cur."!cursor_fail"()
    if_null rx1184_debug, debug_933
    rx1184_cur."!cursor_debug"("FAIL", "infix:sym<!=>")
  debug_933:
    .return (rx1184_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("303_1297880739.64186") :method
.annotate 'line', 455
    $P1186 = self."!PREFIX__!subrule"("O", "!=")
    new $P1187, "ResizablePMCArray"
    push $P1187, $P1186
    .return ($P1187)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("304_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1191_tgt
    .local int rx1191_pos
    .local int rx1191_off
    .local int rx1191_eos
    .local int rx1191_rep
    .local pmc rx1191_cur
    .local pmc rx1191_debug
    (rx1191_cur, rx1191_pos, rx1191_tgt, $I10) = self."!cursor_start"()
    getattribute rx1191_debug, rx1191_cur, "$!debug"
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
    eq $I10, 1, rx1191_restart
    if_null rx1191_debug, debug_934
    rx1191_cur."!cursor_debug"("START", "infix:sym<<=>")
  debug_934:
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
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1196_fail
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  # rx literal  "<="
    add $I11, rx1191_pos, 2
    gt $I11, rx1191_eos, rx1191_fail
    sub $I11, rx1191_pos, rx1191_off
    substr $S10, rx1191_tgt, $I11, 2
    ne $S10, "<=", rx1191_fail
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
    $P10 = rx1191_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1191_fail
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1191_pos = $P10."pos"()
  # rx pass
    rx1191_cur."!cursor_pass"(rx1191_pos, "infix:sym<<=>")
    if_null rx1191_debug, debug_935
    rx1191_cur."!cursor_debug"("PASS", "infix:sym<<=>", " at pos=", rx1191_pos)
  debug_935:
    .return (rx1191_cur)
  rx1191_restart:
.annotate 'line', 455
    if_null rx1191_debug, debug_936
    rx1191_cur."!cursor_debug"("NEXT", "infix:sym<<=>")
  debug_936:
  rx1191_fail:
    (rx1191_rep, rx1191_pos, $I10, $P10) = rx1191_cur."!mark_fail"(0)
    lt rx1191_pos, -1, rx1191_done
    eq rx1191_pos, -1, rx1191_fail
    jump $I10
  rx1191_done:
    rx1191_cur."!cursor_fail"()
    if_null rx1191_debug, debug_937
    rx1191_cur."!cursor_debug"("FAIL", "infix:sym<<=>")
  debug_937:
    .return (rx1191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("305_1297880739.64186") :method
.annotate 'line', 455
    $P1193 = self."!PREFIX__!subrule"("O", "<=")
    new $P1194, "ResizablePMCArray"
    push $P1194, $P1193
    .return ($P1194)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("306_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1198_tgt
    .local int rx1198_pos
    .local int rx1198_off
    .local int rx1198_eos
    .local int rx1198_rep
    .local pmc rx1198_cur
    .local pmc rx1198_debug
    (rx1198_cur, rx1198_pos, rx1198_tgt, $I10) = self."!cursor_start"()
    getattribute rx1198_debug, rx1198_cur, "$!debug"
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
    eq $I10, 1, rx1198_restart
    if_null rx1198_debug, debug_938
    rx1198_cur."!cursor_debug"("START", "infix:sym<>=>")
  debug_938:
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
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1203_fail
    rx1198_cur."!mark_push"(0, rx1198_pos, $I10)
  # rx literal  ">="
    add $I11, rx1198_pos, 2
    gt $I11, rx1198_eos, rx1198_fail
    sub $I11, rx1198_pos, rx1198_off
    substr $S10, rx1198_tgt, $I11, 2
    ne $S10, ">=", rx1198_fail
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
    $P10 = rx1198_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1198_fail
    rx1198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1198_pos = $P10."pos"()
  # rx pass
    rx1198_cur."!cursor_pass"(rx1198_pos, "infix:sym<>=>")
    if_null rx1198_debug, debug_939
    rx1198_cur."!cursor_debug"("PASS", "infix:sym<>=>", " at pos=", rx1198_pos)
  debug_939:
    .return (rx1198_cur)
  rx1198_restart:
.annotate 'line', 455
    if_null rx1198_debug, debug_940
    rx1198_cur."!cursor_debug"("NEXT", "infix:sym<>=>")
  debug_940:
  rx1198_fail:
    (rx1198_rep, rx1198_pos, $I10, $P10) = rx1198_cur."!mark_fail"(0)
    lt rx1198_pos, -1, rx1198_done
    eq rx1198_pos, -1, rx1198_fail
    jump $I10
  rx1198_done:
    rx1198_cur."!cursor_fail"()
    if_null rx1198_debug, debug_941
    rx1198_cur."!cursor_debug"("FAIL", "infix:sym<>=>")
  debug_941:
    .return (rx1198_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("307_1297880739.64186") :method
.annotate 'line', 455
    $P1200 = self."!PREFIX__!subrule"("O", ">=")
    new $P1201, "ResizablePMCArray"
    push $P1201, $P1200
    .return ($P1201)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("308_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1205_tgt
    .local int rx1205_pos
    .local int rx1205_off
    .local int rx1205_eos
    .local int rx1205_rep
    .local pmc rx1205_cur
    .local pmc rx1205_debug
    (rx1205_cur, rx1205_pos, rx1205_tgt, $I10) = self."!cursor_start"()
    getattribute rx1205_debug, rx1205_cur, "$!debug"
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
    eq $I10, 1, rx1205_restart
    if_null rx1205_debug, debug_942
    rx1205_cur."!cursor_debug"("START", "infix:sym<<>")
  debug_942:
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
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1210_fail
    rx1205_cur."!mark_push"(0, rx1205_pos, $I10)
  # rx literal  "<"
    add $I11, rx1205_pos, 1
    gt $I11, rx1205_eos, rx1205_fail
    sub $I11, rx1205_pos, rx1205_off
    ord $I11, rx1205_tgt, $I11
    ne $I11, 60, rx1205_fail
    add rx1205_pos, 1
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
    $P10 = rx1205_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1205_fail
    rx1205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1205_pos = $P10."pos"()
  # rx pass
    rx1205_cur."!cursor_pass"(rx1205_pos, "infix:sym<<>")
    if_null rx1205_debug, debug_943
    rx1205_cur."!cursor_debug"("PASS", "infix:sym<<>", " at pos=", rx1205_pos)
  debug_943:
    .return (rx1205_cur)
  rx1205_restart:
.annotate 'line', 455
    if_null rx1205_debug, debug_944
    rx1205_cur."!cursor_debug"("NEXT", "infix:sym<<>")
  debug_944:
  rx1205_fail:
    (rx1205_rep, rx1205_pos, $I10, $P10) = rx1205_cur."!mark_fail"(0)
    lt rx1205_pos, -1, rx1205_done
    eq rx1205_pos, -1, rx1205_fail
    jump $I10
  rx1205_done:
    rx1205_cur."!cursor_fail"()
    if_null rx1205_debug, debug_945
    rx1205_cur."!cursor_debug"("FAIL", "infix:sym<<>")
  debug_945:
    .return (rx1205_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("309_1297880739.64186") :method
.annotate 'line', 455
    $P1207 = self."!PREFIX__!subrule"("O", "<")
    new $P1208, "ResizablePMCArray"
    push $P1208, $P1207
    .return ($P1208)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("310_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1212_tgt
    .local int rx1212_pos
    .local int rx1212_off
    .local int rx1212_eos
    .local int rx1212_rep
    .local pmc rx1212_cur
    .local pmc rx1212_debug
    (rx1212_cur, rx1212_pos, rx1212_tgt, $I10) = self."!cursor_start"()
    getattribute rx1212_debug, rx1212_cur, "$!debug"
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
    eq $I10, 1, rx1212_restart
    if_null rx1212_debug, debug_946
    rx1212_cur."!cursor_debug"("START", "infix:sym<>>")
  debug_946:
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
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1217_fail
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
  # rx literal  ">"
    add $I11, rx1212_pos, 1
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    ord $I11, rx1212_tgt, $I11
    ne $I11, 62, rx1212_fail
    add rx1212_pos, 1
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
    $P10 = rx1212_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1212_pos = $P10."pos"()
  # rx pass
    rx1212_cur."!cursor_pass"(rx1212_pos, "infix:sym<>>")
    if_null rx1212_debug, debug_947
    rx1212_cur."!cursor_debug"("PASS", "infix:sym<>>", " at pos=", rx1212_pos)
  debug_947:
    .return (rx1212_cur)
  rx1212_restart:
.annotate 'line', 455
    if_null rx1212_debug, debug_948
    rx1212_cur."!cursor_debug"("NEXT", "infix:sym<>>")
  debug_948:
  rx1212_fail:
    (rx1212_rep, rx1212_pos, $I10, $P10) = rx1212_cur."!mark_fail"(0)
    lt rx1212_pos, -1, rx1212_done
    eq rx1212_pos, -1, rx1212_fail
    jump $I10
  rx1212_done:
    rx1212_cur."!cursor_fail"()
    if_null rx1212_debug, debug_949
    rx1212_cur."!cursor_debug"("FAIL", "infix:sym<>>")
  debug_949:
    .return (rx1212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("311_1297880739.64186") :method
.annotate 'line', 455
    $P1214 = self."!PREFIX__!subrule"("O", ">")
    new $P1215, "ResizablePMCArray"
    push $P1215, $P1214
    .return ($P1215)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("312_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1219_tgt
    .local int rx1219_pos
    .local int rx1219_off
    .local int rx1219_eos
    .local int rx1219_rep
    .local pmc rx1219_cur
    .local pmc rx1219_debug
    (rx1219_cur, rx1219_pos, rx1219_tgt, $I10) = self."!cursor_start"()
    getattribute rx1219_debug, rx1219_cur, "$!debug"
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
    eq $I10, 1, rx1219_restart
    if_null rx1219_debug, debug_950
    rx1219_cur."!cursor_debug"("START", "infix:sym<eq>")
  debug_950:
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
.annotate 'line', 533
  # rx subcapture "sym"
    set_addr $I10, rxcap_1224_fail
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1219_pos, 2
    gt $I11, rx1219_eos, rx1219_fail
    sub $I11, rx1219_pos, rx1219_off
    substr $S10, rx1219_tgt, $I11, 2
    ne $S10, "eq", rx1219_fail
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
    $P10 = rx1219_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1219_fail
    rx1219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1219_pos = $P10."pos"()
  # rx pass
    rx1219_cur."!cursor_pass"(rx1219_pos, "infix:sym<eq>")
    if_null rx1219_debug, debug_951
    rx1219_cur."!cursor_debug"("PASS", "infix:sym<eq>", " at pos=", rx1219_pos)
  debug_951:
    .return (rx1219_cur)
  rx1219_restart:
.annotate 'line', 455
    if_null rx1219_debug, debug_952
    rx1219_cur."!cursor_debug"("NEXT", "infix:sym<eq>")
  debug_952:
  rx1219_fail:
    (rx1219_rep, rx1219_pos, $I10, $P10) = rx1219_cur."!mark_fail"(0)
    lt rx1219_pos, -1, rx1219_done
    eq rx1219_pos, -1, rx1219_fail
    jump $I10
  rx1219_done:
    rx1219_cur."!cursor_fail"()
    if_null rx1219_debug, debug_953
    rx1219_cur."!cursor_debug"("FAIL", "infix:sym<eq>")
  debug_953:
    .return (rx1219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("313_1297880739.64186") :method
.annotate 'line', 455
    $P1221 = self."!PREFIX__!subrule"("O", "eq")
    new $P1222, "ResizablePMCArray"
    push $P1222, $P1221
    .return ($P1222)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("314_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1226_tgt
    .local int rx1226_pos
    .local int rx1226_off
    .local int rx1226_eos
    .local int rx1226_rep
    .local pmc rx1226_cur
    .local pmc rx1226_debug
    (rx1226_cur, rx1226_pos, rx1226_tgt, $I10) = self."!cursor_start"()
    getattribute rx1226_debug, rx1226_cur, "$!debug"
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
    eq $I10, 1, rx1226_restart
    if_null rx1226_debug, debug_954
    rx1226_cur."!cursor_debug"("START", "infix:sym<ne>")
  debug_954:
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
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1231_fail
    rx1226_cur."!mark_push"(0, rx1226_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1226_pos, 2
    gt $I11, rx1226_eos, rx1226_fail
    sub $I11, rx1226_pos, rx1226_off
    substr $S10, rx1226_tgt, $I11, 2
    ne $S10, "ne", rx1226_fail
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
    $P10 = rx1226_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1226_fail
    rx1226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1226_pos = $P10."pos"()
  # rx pass
    rx1226_cur."!cursor_pass"(rx1226_pos, "infix:sym<ne>")
    if_null rx1226_debug, debug_955
    rx1226_cur."!cursor_debug"("PASS", "infix:sym<ne>", " at pos=", rx1226_pos)
  debug_955:
    .return (rx1226_cur)
  rx1226_restart:
.annotate 'line', 455
    if_null rx1226_debug, debug_956
    rx1226_cur."!cursor_debug"("NEXT", "infix:sym<ne>")
  debug_956:
  rx1226_fail:
    (rx1226_rep, rx1226_pos, $I10, $P10) = rx1226_cur."!mark_fail"(0)
    lt rx1226_pos, -1, rx1226_done
    eq rx1226_pos, -1, rx1226_fail
    jump $I10
  rx1226_done:
    rx1226_cur."!cursor_fail"()
    if_null rx1226_debug, debug_957
    rx1226_cur."!cursor_debug"("FAIL", "infix:sym<ne>")
  debug_957:
    .return (rx1226_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("315_1297880739.64186") :method
.annotate 'line', 455
    $P1228 = self."!PREFIX__!subrule"("O", "ne")
    new $P1229, "ResizablePMCArray"
    push $P1229, $P1228
    .return ($P1229)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("316_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1233_tgt
    .local int rx1233_pos
    .local int rx1233_off
    .local int rx1233_eos
    .local int rx1233_rep
    .local pmc rx1233_cur
    .local pmc rx1233_debug
    (rx1233_cur, rx1233_pos, rx1233_tgt, $I10) = self."!cursor_start"()
    getattribute rx1233_debug, rx1233_cur, "$!debug"
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
    eq $I10, 1, rx1233_restart
    if_null rx1233_debug, debug_958
    rx1233_cur."!cursor_debug"("START", "infix:sym<le>")
  debug_958:
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
.annotate 'line', 535
  # rx subcapture "sym"
    set_addr $I10, rxcap_1238_fail
    rx1233_cur."!mark_push"(0, rx1233_pos, $I10)
  # rx literal  "le"
    add $I11, rx1233_pos, 2
    gt $I11, rx1233_eos, rx1233_fail
    sub $I11, rx1233_pos, rx1233_off
    substr $S10, rx1233_tgt, $I11, 2
    ne $S10, "le", rx1233_fail
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
    $P10 = rx1233_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1233_fail
    rx1233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1233_pos = $P10."pos"()
  # rx pass
    rx1233_cur."!cursor_pass"(rx1233_pos, "infix:sym<le>")
    if_null rx1233_debug, debug_959
    rx1233_cur."!cursor_debug"("PASS", "infix:sym<le>", " at pos=", rx1233_pos)
  debug_959:
    .return (rx1233_cur)
  rx1233_restart:
.annotate 'line', 455
    if_null rx1233_debug, debug_960
    rx1233_cur."!cursor_debug"("NEXT", "infix:sym<le>")
  debug_960:
  rx1233_fail:
    (rx1233_rep, rx1233_pos, $I10, $P10) = rx1233_cur."!mark_fail"(0)
    lt rx1233_pos, -1, rx1233_done
    eq rx1233_pos, -1, rx1233_fail
    jump $I10
  rx1233_done:
    rx1233_cur."!cursor_fail"()
    if_null rx1233_debug, debug_961
    rx1233_cur."!cursor_debug"("FAIL", "infix:sym<le>")
  debug_961:
    .return (rx1233_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("317_1297880739.64186") :method
.annotate 'line', 455
    $P1235 = self."!PREFIX__!subrule"("O", "le")
    new $P1236, "ResizablePMCArray"
    push $P1236, $P1235
    .return ($P1236)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("318_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1240_tgt
    .local int rx1240_pos
    .local int rx1240_off
    .local int rx1240_eos
    .local int rx1240_rep
    .local pmc rx1240_cur
    .local pmc rx1240_debug
    (rx1240_cur, rx1240_pos, rx1240_tgt, $I10) = self."!cursor_start"()
    getattribute rx1240_debug, rx1240_cur, "$!debug"
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
    eq $I10, 1, rx1240_restart
    if_null rx1240_debug, debug_962
    rx1240_cur."!cursor_debug"("START", "infix:sym<ge>")
  debug_962:
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
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1245_fail
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1240_pos, 2
    gt $I11, rx1240_eos, rx1240_fail
    sub $I11, rx1240_pos, rx1240_off
    substr $S10, rx1240_tgt, $I11, 2
    ne $S10, "ge", rx1240_fail
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
    $P10 = rx1240_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1240_fail
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1240_pos = $P10."pos"()
  # rx pass
    rx1240_cur."!cursor_pass"(rx1240_pos, "infix:sym<ge>")
    if_null rx1240_debug, debug_963
    rx1240_cur."!cursor_debug"("PASS", "infix:sym<ge>", " at pos=", rx1240_pos)
  debug_963:
    .return (rx1240_cur)
  rx1240_restart:
.annotate 'line', 455
    if_null rx1240_debug, debug_964
    rx1240_cur."!cursor_debug"("NEXT", "infix:sym<ge>")
  debug_964:
  rx1240_fail:
    (rx1240_rep, rx1240_pos, $I10, $P10) = rx1240_cur."!mark_fail"(0)
    lt rx1240_pos, -1, rx1240_done
    eq rx1240_pos, -1, rx1240_fail
    jump $I10
  rx1240_done:
    rx1240_cur."!cursor_fail"()
    if_null rx1240_debug, debug_965
    rx1240_cur."!cursor_debug"("FAIL", "infix:sym<ge>")
  debug_965:
    .return (rx1240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("319_1297880739.64186") :method
.annotate 'line', 455
    $P1242 = self."!PREFIX__!subrule"("O", "ge")
    new $P1243, "ResizablePMCArray"
    push $P1243, $P1242
    .return ($P1243)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("320_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1247_tgt
    .local int rx1247_pos
    .local int rx1247_off
    .local int rx1247_eos
    .local int rx1247_rep
    .local pmc rx1247_cur
    .local pmc rx1247_debug
    (rx1247_cur, rx1247_pos, rx1247_tgt, $I10) = self."!cursor_start"()
    getattribute rx1247_debug, rx1247_cur, "$!debug"
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
    eq $I10, 1, rx1247_restart
    if_null rx1247_debug, debug_966
    rx1247_cur."!cursor_debug"("START", "infix:sym<lt>")
  debug_966:
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
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1252_fail
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1247_pos, 2
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    substr $S10, rx1247_tgt, $I11, 2
    ne $S10, "lt", rx1247_fail
    add rx1247_pos, 2
    set_addr $I10, rxcap_1252_fail
    ($I12, $I11) = rx1247_cur."!mark_peek"($I10)
    rx1247_cur."!cursor_pos"($I11)
    ($P10) = rx1247_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1247_pos, "")
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1252_done
  rxcap_1252_fail:
    goto rx1247_fail
  rxcap_1252_done:
  # rx subrule "O" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1247_pos = $P10."pos"()
  # rx pass
    rx1247_cur."!cursor_pass"(rx1247_pos, "infix:sym<lt>")
    if_null rx1247_debug, debug_967
    rx1247_cur."!cursor_debug"("PASS", "infix:sym<lt>", " at pos=", rx1247_pos)
  debug_967:
    .return (rx1247_cur)
  rx1247_restart:
.annotate 'line', 455
    if_null rx1247_debug, debug_968
    rx1247_cur."!cursor_debug"("NEXT", "infix:sym<lt>")
  debug_968:
  rx1247_fail:
    (rx1247_rep, rx1247_pos, $I10, $P10) = rx1247_cur."!mark_fail"(0)
    lt rx1247_pos, -1, rx1247_done
    eq rx1247_pos, -1, rx1247_fail
    jump $I10
  rx1247_done:
    rx1247_cur."!cursor_fail"()
    if_null rx1247_debug, debug_969
    rx1247_cur."!cursor_debug"("FAIL", "infix:sym<lt>")
  debug_969:
    .return (rx1247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("321_1297880739.64186") :method
.annotate 'line', 455
    $P1249 = self."!PREFIX__!subrule"("O", "lt")
    new $P1250, "ResizablePMCArray"
    push $P1250, $P1249
    .return ($P1250)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("322_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1254_tgt
    .local int rx1254_pos
    .local int rx1254_off
    .local int rx1254_eos
    .local int rx1254_rep
    .local pmc rx1254_cur
    .local pmc rx1254_debug
    (rx1254_cur, rx1254_pos, rx1254_tgt, $I10) = self."!cursor_start"()
    getattribute rx1254_debug, rx1254_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1254_cur
    .local pmc match
    .lex "$/", match
    length rx1254_eos, rx1254_tgt
    gt rx1254_pos, rx1254_eos, rx1254_done
    set rx1254_off, 0
    lt rx1254_pos, 2, rx1254_start
    sub rx1254_off, rx1254_pos, 1
    substr rx1254_tgt, rx1254_tgt, rx1254_off
  rx1254_start:
    eq $I10, 1, rx1254_restart
    if_null rx1254_debug, debug_970
    rx1254_cur."!cursor_debug"("START", "infix:sym<gt>")
  debug_970:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1258_done
    goto rxscan1258_scan
  rxscan1258_loop:
    ($P10) = rx1254_cur."from"()
    inc $P10
    set rx1254_pos, $P10
    ge rx1254_pos, rx1254_eos, rxscan1258_done
  rxscan1258_scan:
    set_addr $I10, rxscan1258_loop
    rx1254_cur."!mark_push"(0, rx1254_pos, $I10)
  rxscan1258_done:
.annotate 'line', 538
  # rx subcapture "sym"
    set_addr $I10, rxcap_1259_fail
    rx1254_cur."!mark_push"(0, rx1254_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1254_pos, 2
    gt $I11, rx1254_eos, rx1254_fail
    sub $I11, rx1254_pos, rx1254_off
    substr $S10, rx1254_tgt, $I11, 2
    ne $S10, "gt", rx1254_fail
    add rx1254_pos, 2
    set_addr $I10, rxcap_1259_fail
    ($I12, $I11) = rx1254_cur."!mark_peek"($I10)
    rx1254_cur."!cursor_pos"($I11)
    ($P10) = rx1254_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1254_pos, "")
    rx1254_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1259_done
  rxcap_1259_fail:
    goto rx1254_fail
  rxcap_1259_done:
  # rx subrule "O" subtype=capture negate=
    rx1254_cur."!cursor_pos"(rx1254_pos)
    $P10 = rx1254_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1254_fail
    rx1254_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1254_pos = $P10."pos"()
  # rx pass
    rx1254_cur."!cursor_pass"(rx1254_pos, "infix:sym<gt>")
    if_null rx1254_debug, debug_971
    rx1254_cur."!cursor_debug"("PASS", "infix:sym<gt>", " at pos=", rx1254_pos)
  debug_971:
    .return (rx1254_cur)
  rx1254_restart:
.annotate 'line', 455
    if_null rx1254_debug, debug_972
    rx1254_cur."!cursor_debug"("NEXT", "infix:sym<gt>")
  debug_972:
  rx1254_fail:
    (rx1254_rep, rx1254_pos, $I10, $P10) = rx1254_cur."!mark_fail"(0)
    lt rx1254_pos, -1, rx1254_done
    eq rx1254_pos, -1, rx1254_fail
    jump $I10
  rx1254_done:
    rx1254_cur."!cursor_fail"()
    if_null rx1254_debug, debug_973
    rx1254_cur."!cursor_debug"("FAIL", "infix:sym<gt>")
  debug_973:
    .return (rx1254_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("323_1297880739.64186") :method
.annotate 'line', 455
    $P1256 = self."!PREFIX__!subrule"("O", "gt")
    new $P1257, "ResizablePMCArray"
    push $P1257, $P1256
    .return ($P1257)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("324_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1261_tgt
    .local int rx1261_pos
    .local int rx1261_off
    .local int rx1261_eos
    .local int rx1261_rep
    .local pmc rx1261_cur
    .local pmc rx1261_debug
    (rx1261_cur, rx1261_pos, rx1261_tgt, $I10) = self."!cursor_start"()
    getattribute rx1261_debug, rx1261_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1261_cur
    .local pmc match
    .lex "$/", match
    length rx1261_eos, rx1261_tgt
    gt rx1261_pos, rx1261_eos, rx1261_done
    set rx1261_off, 0
    lt rx1261_pos, 2, rx1261_start
    sub rx1261_off, rx1261_pos, 1
    substr rx1261_tgt, rx1261_tgt, rx1261_off
  rx1261_start:
    eq $I10, 1, rx1261_restart
    if_null rx1261_debug, debug_974
    rx1261_cur."!cursor_debug"("START", "infix:sym<=:=>")
  debug_974:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1265_done
    goto rxscan1265_scan
  rxscan1265_loop:
    ($P10) = rx1261_cur."from"()
    inc $P10
    set rx1261_pos, $P10
    ge rx1261_pos, rx1261_eos, rxscan1265_done
  rxscan1265_scan:
    set_addr $I10, rxscan1265_loop
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  rxscan1265_done:
.annotate 'line', 539
  # rx subcapture "sym"
    set_addr $I10, rxcap_1266_fail
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1261_pos, 3
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 3
    ne $S10, "=:=", rx1261_fail
    add rx1261_pos, 3
    set_addr $I10, rxcap_1266_fail
    ($I12, $I11) = rx1261_cur."!mark_peek"($I10)
    rx1261_cur."!cursor_pos"($I11)
    ($P10) = rx1261_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1261_pos, "")
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1266_done
  rxcap_1266_fail:
    goto rx1261_fail
  rxcap_1266_done:
  # rx subrule "O" subtype=capture negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1261_fail
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1261_pos = $P10."pos"()
  # rx pass
    rx1261_cur."!cursor_pass"(rx1261_pos, "infix:sym<=:=>")
    if_null rx1261_debug, debug_975
    rx1261_cur."!cursor_debug"("PASS", "infix:sym<=:=>", " at pos=", rx1261_pos)
  debug_975:
    .return (rx1261_cur)
  rx1261_restart:
.annotate 'line', 455
    if_null rx1261_debug, debug_976
    rx1261_cur."!cursor_debug"("NEXT", "infix:sym<=:=>")
  debug_976:
  rx1261_fail:
    (rx1261_rep, rx1261_pos, $I10, $P10) = rx1261_cur."!mark_fail"(0)
    lt rx1261_pos, -1, rx1261_done
    eq rx1261_pos, -1, rx1261_fail
    jump $I10
  rx1261_done:
    rx1261_cur."!cursor_fail"()
    if_null rx1261_debug, debug_977
    rx1261_cur."!cursor_debug"("FAIL", "infix:sym<=:=>")
  debug_977:
    .return (rx1261_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("325_1297880739.64186") :method
.annotate 'line', 455
    $P1263 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1264, "ResizablePMCArray"
    push $P1264, $P1263
    .return ($P1264)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("326_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1268_tgt
    .local int rx1268_pos
    .local int rx1268_off
    .local int rx1268_eos
    .local int rx1268_rep
    .local pmc rx1268_cur
    .local pmc rx1268_debug
    (rx1268_cur, rx1268_pos, rx1268_tgt, $I10) = self."!cursor_start"()
    getattribute rx1268_debug, rx1268_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1268_cur
    .local pmc match
    .lex "$/", match
    length rx1268_eos, rx1268_tgt
    gt rx1268_pos, rx1268_eos, rx1268_done
    set rx1268_off, 0
    lt rx1268_pos, 2, rx1268_start
    sub rx1268_off, rx1268_pos, 1
    substr rx1268_tgt, rx1268_tgt, rx1268_off
  rx1268_start:
    eq $I10, 1, rx1268_restart
    if_null rx1268_debug, debug_978
    rx1268_cur."!cursor_debug"("START", "infix:sym<~~>")
  debug_978:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1272_done
    goto rxscan1272_scan
  rxscan1272_loop:
    ($P10) = rx1268_cur."from"()
    inc $P10
    set rx1268_pos, $P10
    ge rx1268_pos, rx1268_eos, rxscan1272_done
  rxscan1272_scan:
    set_addr $I10, rxscan1272_loop
    rx1268_cur."!mark_push"(0, rx1268_pos, $I10)
  rxscan1272_done:
.annotate 'line', 540
  # rx subcapture "sym"
    set_addr $I10, rxcap_1273_fail
    rx1268_cur."!mark_push"(0, rx1268_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1268_pos, 2
    gt $I11, rx1268_eos, rx1268_fail
    sub $I11, rx1268_pos, rx1268_off
    substr $S10, rx1268_tgt, $I11, 2
    ne $S10, "~~", rx1268_fail
    add rx1268_pos, 2
    set_addr $I10, rxcap_1273_fail
    ($I12, $I11) = rx1268_cur."!mark_peek"($I10)
    rx1268_cur."!cursor_pos"($I11)
    ($P10) = rx1268_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1268_pos, "")
    rx1268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1273_done
  rxcap_1273_fail:
    goto rx1268_fail
  rxcap_1273_done:
  # rx subrule "O" subtype=capture negate=
    rx1268_cur."!cursor_pos"(rx1268_pos)
    $P10 = rx1268_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1268_fail
    rx1268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1268_pos = $P10."pos"()
  # rx pass
    rx1268_cur."!cursor_pass"(rx1268_pos, "infix:sym<~~>")
    if_null rx1268_debug, debug_979
    rx1268_cur."!cursor_debug"("PASS", "infix:sym<~~>", " at pos=", rx1268_pos)
  debug_979:
    .return (rx1268_cur)
  rx1268_restart:
.annotate 'line', 455
    if_null rx1268_debug, debug_980
    rx1268_cur."!cursor_debug"("NEXT", "infix:sym<~~>")
  debug_980:
  rx1268_fail:
    (rx1268_rep, rx1268_pos, $I10, $P10) = rx1268_cur."!mark_fail"(0)
    lt rx1268_pos, -1, rx1268_done
    eq rx1268_pos, -1, rx1268_fail
    jump $I10
  rx1268_done:
    rx1268_cur."!cursor_fail"()
    if_null rx1268_debug, debug_981
    rx1268_cur."!cursor_debug"("FAIL", "infix:sym<~~>")
  debug_981:
    .return (rx1268_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("327_1297880739.64186") :method
.annotate 'line', 455
    $P1270 = self."!PREFIX__!subrule"("O", "~~")
    new $P1271, "ResizablePMCArray"
    push $P1271, $P1270
    .return ($P1271)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("328_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1275_tgt
    .local int rx1275_pos
    .local int rx1275_off
    .local int rx1275_eos
    .local int rx1275_rep
    .local pmc rx1275_cur
    .local pmc rx1275_debug
    (rx1275_cur, rx1275_pos, rx1275_tgt, $I10) = self."!cursor_start"()
    getattribute rx1275_debug, rx1275_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1275_cur
    .local pmc match
    .lex "$/", match
    length rx1275_eos, rx1275_tgt
    gt rx1275_pos, rx1275_eos, rx1275_done
    set rx1275_off, 0
    lt rx1275_pos, 2, rx1275_start
    sub rx1275_off, rx1275_pos, 1
    substr rx1275_tgt, rx1275_tgt, rx1275_off
  rx1275_start:
    eq $I10, 1, rx1275_restart
    if_null rx1275_debug, debug_982
    rx1275_cur."!cursor_debug"("START", "infix:sym<&&>")
  debug_982:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1279_done
    goto rxscan1279_scan
  rxscan1279_loop:
    ($P10) = rx1275_cur."from"()
    inc $P10
    set rx1275_pos, $P10
    ge rx1275_pos, rx1275_eos, rxscan1279_done
  rxscan1279_scan:
    set_addr $I10, rxscan1279_loop
    rx1275_cur."!mark_push"(0, rx1275_pos, $I10)
  rxscan1279_done:
.annotate 'line', 542
  # rx subcapture "sym"
    set_addr $I10, rxcap_1280_fail
    rx1275_cur."!mark_push"(0, rx1275_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1275_pos, 2
    gt $I11, rx1275_eos, rx1275_fail
    sub $I11, rx1275_pos, rx1275_off
    substr $S10, rx1275_tgt, $I11, 2
    ne $S10, "&&", rx1275_fail
    add rx1275_pos, 2
    set_addr $I10, rxcap_1280_fail
    ($I12, $I11) = rx1275_cur."!mark_peek"($I10)
    rx1275_cur."!cursor_pos"($I11)
    ($P10) = rx1275_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1275_pos, "")
    rx1275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1280_done
  rxcap_1280_fail:
    goto rx1275_fail
  rxcap_1280_done:
  # rx subrule "O" subtype=capture negate=
    rx1275_cur."!cursor_pos"(rx1275_pos)
    $P10 = rx1275_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1275_fail
    rx1275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1275_pos = $P10."pos"()
  # rx pass
    rx1275_cur."!cursor_pass"(rx1275_pos, "infix:sym<&&>")
    if_null rx1275_debug, debug_983
    rx1275_cur."!cursor_debug"("PASS", "infix:sym<&&>", " at pos=", rx1275_pos)
  debug_983:
    .return (rx1275_cur)
  rx1275_restart:
.annotate 'line', 455
    if_null rx1275_debug, debug_984
    rx1275_cur."!cursor_debug"("NEXT", "infix:sym<&&>")
  debug_984:
  rx1275_fail:
    (rx1275_rep, rx1275_pos, $I10, $P10) = rx1275_cur."!mark_fail"(0)
    lt rx1275_pos, -1, rx1275_done
    eq rx1275_pos, -1, rx1275_fail
    jump $I10
  rx1275_done:
    rx1275_cur."!cursor_fail"()
    if_null rx1275_debug, debug_985
    rx1275_cur."!cursor_debug"("FAIL", "infix:sym<&&>")
  debug_985:
    .return (rx1275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("329_1297880739.64186") :method
.annotate 'line', 455
    $P1277 = self."!PREFIX__!subrule"("O", "&&")
    new $P1278, "ResizablePMCArray"
    push $P1278, $P1277
    .return ($P1278)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("330_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1282_tgt
    .local int rx1282_pos
    .local int rx1282_off
    .local int rx1282_eos
    .local int rx1282_rep
    .local pmc rx1282_cur
    .local pmc rx1282_debug
    (rx1282_cur, rx1282_pos, rx1282_tgt, $I10) = self."!cursor_start"()
    getattribute rx1282_debug, rx1282_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1282_cur
    .local pmc match
    .lex "$/", match
    length rx1282_eos, rx1282_tgt
    gt rx1282_pos, rx1282_eos, rx1282_done
    set rx1282_off, 0
    lt rx1282_pos, 2, rx1282_start
    sub rx1282_off, rx1282_pos, 1
    substr rx1282_tgt, rx1282_tgt, rx1282_off
  rx1282_start:
    eq $I10, 1, rx1282_restart
    if_null rx1282_debug, debug_986
    rx1282_cur."!cursor_debug"("START", "infix:sym<||>")
  debug_986:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1286_done
    goto rxscan1286_scan
  rxscan1286_loop:
    ($P10) = rx1282_cur."from"()
    inc $P10
    set rx1282_pos, $P10
    ge rx1282_pos, rx1282_eos, rxscan1286_done
  rxscan1286_scan:
    set_addr $I10, rxscan1286_loop
    rx1282_cur."!mark_push"(0, rx1282_pos, $I10)
  rxscan1286_done:
.annotate 'line', 544
  # rx subcapture "sym"
    set_addr $I10, rxcap_1287_fail
    rx1282_cur."!mark_push"(0, rx1282_pos, $I10)
  # rx literal  "||"
    add $I11, rx1282_pos, 2
    gt $I11, rx1282_eos, rx1282_fail
    sub $I11, rx1282_pos, rx1282_off
    substr $S10, rx1282_tgt, $I11, 2
    ne $S10, "||", rx1282_fail
    add rx1282_pos, 2
    set_addr $I10, rxcap_1287_fail
    ($I12, $I11) = rx1282_cur."!mark_peek"($I10)
    rx1282_cur."!cursor_pos"($I11)
    ($P10) = rx1282_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1282_pos, "")
    rx1282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1287_done
  rxcap_1287_fail:
    goto rx1282_fail
  rxcap_1287_done:
  # rx subrule "O" subtype=capture negate=
    rx1282_cur."!cursor_pos"(rx1282_pos)
    $P10 = rx1282_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1282_fail
    rx1282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1282_pos = $P10."pos"()
  # rx pass
    rx1282_cur."!cursor_pass"(rx1282_pos, "infix:sym<||>")
    if_null rx1282_debug, debug_987
    rx1282_cur."!cursor_debug"("PASS", "infix:sym<||>", " at pos=", rx1282_pos)
  debug_987:
    .return (rx1282_cur)
  rx1282_restart:
.annotate 'line', 455
    if_null rx1282_debug, debug_988
    rx1282_cur."!cursor_debug"("NEXT", "infix:sym<||>")
  debug_988:
  rx1282_fail:
    (rx1282_rep, rx1282_pos, $I10, $P10) = rx1282_cur."!mark_fail"(0)
    lt rx1282_pos, -1, rx1282_done
    eq rx1282_pos, -1, rx1282_fail
    jump $I10
  rx1282_done:
    rx1282_cur."!cursor_fail"()
    if_null rx1282_debug, debug_989
    rx1282_cur."!cursor_debug"("FAIL", "infix:sym<||>")
  debug_989:
    .return (rx1282_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("331_1297880739.64186") :method
.annotate 'line', 455
    $P1284 = self."!PREFIX__!subrule"("O", "||")
    new $P1285, "ResizablePMCArray"
    push $P1285, $P1284
    .return ($P1285)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("332_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1289_tgt
    .local int rx1289_pos
    .local int rx1289_off
    .local int rx1289_eos
    .local int rx1289_rep
    .local pmc rx1289_cur
    .local pmc rx1289_debug
    (rx1289_cur, rx1289_pos, rx1289_tgt, $I10) = self."!cursor_start"()
    getattribute rx1289_debug, rx1289_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1289_cur
    .local pmc match
    .lex "$/", match
    length rx1289_eos, rx1289_tgt
    gt rx1289_pos, rx1289_eos, rx1289_done
    set rx1289_off, 0
    lt rx1289_pos, 2, rx1289_start
    sub rx1289_off, rx1289_pos, 1
    substr rx1289_tgt, rx1289_tgt, rx1289_off
  rx1289_start:
    eq $I10, 1, rx1289_restart
    if_null rx1289_debug, debug_990
    rx1289_cur."!cursor_debug"("START", "infix:sym<//>")
  debug_990:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1293_done
    goto rxscan1293_scan
  rxscan1293_loop:
    ($P10) = rx1289_cur."from"()
    inc $P10
    set rx1289_pos, $P10
    ge rx1289_pos, rx1289_eos, rxscan1293_done
  rxscan1293_scan:
    set_addr $I10, rxscan1293_loop
    rx1289_cur."!mark_push"(0, rx1289_pos, $I10)
  rxscan1293_done:
.annotate 'line', 545
  # rx subcapture "sym"
    set_addr $I10, rxcap_1294_fail
    rx1289_cur."!mark_push"(0, rx1289_pos, $I10)
  # rx literal  "//"
    add $I11, rx1289_pos, 2
    gt $I11, rx1289_eos, rx1289_fail
    sub $I11, rx1289_pos, rx1289_off
    substr $S10, rx1289_tgt, $I11, 2
    ne $S10, "//", rx1289_fail
    add rx1289_pos, 2
    set_addr $I10, rxcap_1294_fail
    ($I12, $I11) = rx1289_cur."!mark_peek"($I10)
    rx1289_cur."!cursor_pos"($I11)
    ($P10) = rx1289_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1289_pos, "")
    rx1289_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1294_done
  rxcap_1294_fail:
    goto rx1289_fail
  rxcap_1294_done:
  # rx subrule "O" subtype=capture negate=
    rx1289_cur."!cursor_pos"(rx1289_pos)
    $P10 = rx1289_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1289_fail
    rx1289_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1289_pos = $P10."pos"()
  # rx pass
    rx1289_cur."!cursor_pass"(rx1289_pos, "infix:sym<//>")
    if_null rx1289_debug, debug_991
    rx1289_cur."!cursor_debug"("PASS", "infix:sym<//>", " at pos=", rx1289_pos)
  debug_991:
    .return (rx1289_cur)
  rx1289_restart:
.annotate 'line', 455
    if_null rx1289_debug, debug_992
    rx1289_cur."!cursor_debug"("NEXT", "infix:sym<//>")
  debug_992:
  rx1289_fail:
    (rx1289_rep, rx1289_pos, $I10, $P10) = rx1289_cur."!mark_fail"(0)
    lt rx1289_pos, -1, rx1289_done
    eq rx1289_pos, -1, rx1289_fail
    jump $I10
  rx1289_done:
    rx1289_cur."!cursor_fail"()
    if_null rx1289_debug, debug_993
    rx1289_cur."!cursor_debug"("FAIL", "infix:sym<//>")
  debug_993:
    .return (rx1289_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("333_1297880739.64186") :method
.annotate 'line', 455
    $P1291 = self."!PREFIX__!subrule"("O", "//")
    new $P1292, "ResizablePMCArray"
    push $P1292, $P1291
    .return ($P1292)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("334_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1296_tgt
    .local int rx1296_pos
    .local int rx1296_off
    .local int rx1296_eos
    .local int rx1296_rep
    .local pmc rx1296_cur
    .local pmc rx1296_debug
    (rx1296_cur, rx1296_pos, rx1296_tgt, $I10) = self."!cursor_start"()
    getattribute rx1296_debug, rx1296_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1296_cur
    .local pmc match
    .lex "$/", match
    length rx1296_eos, rx1296_tgt
    gt rx1296_pos, rx1296_eos, rx1296_done
    set rx1296_off, 0
    lt rx1296_pos, 2, rx1296_start
    sub rx1296_off, rx1296_pos, 1
    substr rx1296_tgt, rx1296_tgt, rx1296_off
  rx1296_start:
    eq $I10, 1, rx1296_restart
    if_null rx1296_debug, debug_994
    rx1296_cur."!cursor_debug"("START", "infix:sym<?? !!>")
  debug_994:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1300_done
    goto rxscan1300_scan
  rxscan1300_loop:
    ($P10) = rx1296_cur."from"()
    inc $P10
    set rx1296_pos, $P10
    ge rx1296_pos, rx1296_eos, rxscan1300_done
  rxscan1300_scan:
    set_addr $I10, rxscan1300_loop
    rx1296_cur."!mark_push"(0, rx1296_pos, $I10)
  rxscan1300_done:
.annotate 'line', 548
  # rx literal  "??"
    add $I11, rx1296_pos, 2
    gt $I11, rx1296_eos, rx1296_fail
    sub $I11, rx1296_pos, rx1296_off
    substr $S10, rx1296_tgt, $I11, 2
    ne $S10, "??", rx1296_fail
    add rx1296_pos, 2
.annotate 'line', 549
  # rx subrule "ws" subtype=method negate=
    rx1296_cur."!cursor_pos"(rx1296_pos)
    $P10 = rx1296_cur."ws"()
    unless $P10, rx1296_fail
    rx1296_pos = $P10."pos"()
.annotate 'line', 550
  # rx subrule "EXPR" subtype=capture negate=
    rx1296_cur."!cursor_pos"(rx1296_pos)
    $P10 = rx1296_cur."EXPR"("i=")
    unless $P10, rx1296_fail
    rx1296_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1296_pos = $P10."pos"()
.annotate 'line', 551
  # rx literal  "!!"
    add $I11, rx1296_pos, 2
    gt $I11, rx1296_eos, rx1296_fail
    sub $I11, rx1296_pos, rx1296_off
    substr $S10, rx1296_tgt, $I11, 2
    ne $S10, "!!", rx1296_fail
    add rx1296_pos, 2
.annotate 'line', 552
  # rx subrule "O" subtype=capture negate=
    rx1296_cur."!cursor_pos"(rx1296_pos)
    $P10 = rx1296_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1296_fail
    rx1296_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1296_pos = $P10."pos"()
.annotate 'line', 547
  # rx pass
    rx1296_cur."!cursor_pass"(rx1296_pos, "infix:sym<?? !!>")
    if_null rx1296_debug, debug_995
    rx1296_cur."!cursor_debug"("PASS", "infix:sym<?? !!>", " at pos=", rx1296_pos)
  debug_995:
    .return (rx1296_cur)
  rx1296_restart:
.annotate 'line', 455
    if_null rx1296_debug, debug_996
    rx1296_cur."!cursor_debug"("NEXT", "infix:sym<?? !!>")
  debug_996:
  rx1296_fail:
    (rx1296_rep, rx1296_pos, $I10, $P10) = rx1296_cur."!mark_fail"(0)
    lt rx1296_pos, -1, rx1296_done
    eq rx1296_pos, -1, rx1296_fail
    jump $I10
  rx1296_done:
    rx1296_cur."!cursor_fail"()
    if_null rx1296_debug, debug_997
    rx1296_cur."!cursor_debug"("FAIL", "infix:sym<?? !!>")
  debug_997:
    .return (rx1296_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("335_1297880739.64186") :method
.annotate 'line', 455
    $P1298 = self."!PREFIX__!subrule"("ws", "??")
    new $P1299, "ResizablePMCArray"
    push $P1299, $P1298
    .return ($P1299)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("336_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1302_tgt
    .local int rx1302_pos
    .local int rx1302_off
    .local int rx1302_eos
    .local int rx1302_rep
    .local pmc rx1302_cur
    .local pmc rx1302_debug
    (rx1302_cur, rx1302_pos, rx1302_tgt, $I10) = self."!cursor_start"()
    getattribute rx1302_debug, rx1302_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1302_cur
    .local pmc match
    .lex "$/", match
    length rx1302_eos, rx1302_tgt
    gt rx1302_pos, rx1302_eos, rx1302_done
    set rx1302_off, 0
    lt rx1302_pos, 2, rx1302_start
    sub rx1302_off, rx1302_pos, 1
    substr rx1302_tgt, rx1302_tgt, rx1302_off
  rx1302_start:
    eq $I10, 1, rx1302_restart
    if_null rx1302_debug, debug_998
    rx1302_cur."!cursor_debug"("START", "infix:sym<=>")
  debug_998:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1306_done
    goto rxscan1306_scan
  rxscan1306_loop:
    ($P10) = rx1302_cur."from"()
    inc $P10
    set rx1302_pos, $P10
    ge rx1302_pos, rx1302_eos, rxscan1306_done
  rxscan1306_scan:
    set_addr $I10, rxscan1306_loop
    rx1302_cur."!mark_push"(0, rx1302_pos, $I10)
  rxscan1306_done:
.annotate 'line', 556
  # rx subcapture "sym"
    set_addr $I10, rxcap_1307_fail
    rx1302_cur."!mark_push"(0, rx1302_pos, $I10)
  # rx literal  "="
    add $I11, rx1302_pos, 1
    gt $I11, rx1302_eos, rx1302_fail
    sub $I11, rx1302_pos, rx1302_off
    ord $I11, rx1302_tgt, $I11
    ne $I11, 61, rx1302_fail
    add rx1302_pos, 1
    set_addr $I10, rxcap_1307_fail
    ($I12, $I11) = rx1302_cur."!mark_peek"($I10)
    rx1302_cur."!cursor_pos"($I11)
    ($P10) = rx1302_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1302_pos, "")
    rx1302_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1307_done
  rxcap_1307_fail:
    goto rx1302_fail
  rxcap_1307_done:
  # rx subrule "panic" subtype=method negate=
    rx1302_cur."!cursor_pos"(rx1302_pos)
    $P10 = rx1302_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1302_fail
    rx1302_pos = $P10."pos"()
.annotate 'line', 555
  # rx pass
    rx1302_cur."!cursor_pass"(rx1302_pos, "infix:sym<=>")
    if_null rx1302_debug, debug_999
    rx1302_cur."!cursor_debug"("PASS", "infix:sym<=>", " at pos=", rx1302_pos)
  debug_999:
    .return (rx1302_cur)
  rx1302_restart:
.annotate 'line', 455
    if_null rx1302_debug, debug_1000
    rx1302_cur."!cursor_debug"("NEXT", "infix:sym<=>")
  debug_1000:
  rx1302_fail:
    (rx1302_rep, rx1302_pos, $I10, $P10) = rx1302_cur."!mark_fail"(0)
    lt rx1302_pos, -1, rx1302_done
    eq rx1302_pos, -1, rx1302_fail
    jump $I10
  rx1302_done:
    rx1302_cur."!cursor_fail"()
    if_null rx1302_debug, debug_1001
    rx1302_cur."!cursor_debug"("FAIL", "infix:sym<=>")
  debug_1001:
    .return (rx1302_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("337_1297880739.64186") :method
.annotate 'line', 455
    $P1304 = self."!PREFIX__!subrule"("panic", "=")
    new $P1305, "ResizablePMCArray"
    push $P1305, $P1304
    .return ($P1305)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("338_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1309_tgt
    .local int rx1309_pos
    .local int rx1309_off
    .local int rx1309_eos
    .local int rx1309_rep
    .local pmc rx1309_cur
    .local pmc rx1309_debug
    (rx1309_cur, rx1309_pos, rx1309_tgt, $I10) = self."!cursor_start"()
    getattribute rx1309_debug, rx1309_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1309_cur
    .local pmc match
    .lex "$/", match
    length rx1309_eos, rx1309_tgt
    gt rx1309_pos, rx1309_eos, rx1309_done
    set rx1309_off, 0
    lt rx1309_pos, 2, rx1309_start
    sub rx1309_off, rx1309_pos, 1
    substr rx1309_tgt, rx1309_tgt, rx1309_off
  rx1309_start:
    eq $I10, 1, rx1309_restart
    if_null rx1309_debug, debug_1002
    rx1309_cur."!cursor_debug"("START", "infix:sym<:=>")
  debug_1002:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1313_done
    goto rxscan1313_scan
  rxscan1313_loop:
    ($P10) = rx1309_cur."from"()
    inc $P10
    set rx1309_pos, $P10
    ge rx1309_pos, rx1309_eos, rxscan1313_done
  rxscan1313_scan:
    set_addr $I10, rxscan1313_loop
    rx1309_cur."!mark_push"(0, rx1309_pos, $I10)
  rxscan1313_done:
.annotate 'line', 558
  # rx subcapture "sym"
    set_addr $I10, rxcap_1314_fail
    rx1309_cur."!mark_push"(0, rx1309_pos, $I10)
  # rx literal  ":="
    add $I11, rx1309_pos, 2
    gt $I11, rx1309_eos, rx1309_fail
    sub $I11, rx1309_pos, rx1309_off
    substr $S10, rx1309_tgt, $I11, 2
    ne $S10, ":=", rx1309_fail
    add rx1309_pos, 2
    set_addr $I10, rxcap_1314_fail
    ($I12, $I11) = rx1309_cur."!mark_peek"($I10)
    rx1309_cur."!cursor_pos"($I11)
    ($P10) = rx1309_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1309_pos, "")
    rx1309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1314_done
  rxcap_1314_fail:
    goto rx1309_fail
  rxcap_1314_done:
  # rx subrule "O" subtype=capture negate=
    rx1309_cur."!cursor_pos"(rx1309_pos)
    $P10 = rx1309_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1309_fail
    rx1309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1309_pos = $P10."pos"()
  # rx pass
    rx1309_cur."!cursor_pass"(rx1309_pos, "infix:sym<:=>")
    if_null rx1309_debug, debug_1003
    rx1309_cur."!cursor_debug"("PASS", "infix:sym<:=>", " at pos=", rx1309_pos)
  debug_1003:
    .return (rx1309_cur)
  rx1309_restart:
.annotate 'line', 455
    if_null rx1309_debug, debug_1004
    rx1309_cur."!cursor_debug"("NEXT", "infix:sym<:=>")
  debug_1004:
  rx1309_fail:
    (rx1309_rep, rx1309_pos, $I10, $P10) = rx1309_cur."!mark_fail"(0)
    lt rx1309_pos, -1, rx1309_done
    eq rx1309_pos, -1, rx1309_fail
    jump $I10
  rx1309_done:
    rx1309_cur."!cursor_fail"()
    if_null rx1309_debug, debug_1005
    rx1309_cur."!cursor_debug"("FAIL", "infix:sym<:=>")
  debug_1005:
    .return (rx1309_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("339_1297880739.64186") :method
.annotate 'line', 455
    $P1311 = self."!PREFIX__!subrule"("O", ":=")
    new $P1312, "ResizablePMCArray"
    push $P1312, $P1311
    .return ($P1312)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("340_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1316_tgt
    .local int rx1316_pos
    .local int rx1316_off
    .local int rx1316_eos
    .local int rx1316_rep
    .local pmc rx1316_cur
    .local pmc rx1316_debug
    (rx1316_cur, rx1316_pos, rx1316_tgt, $I10) = self."!cursor_start"()
    getattribute rx1316_debug, rx1316_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1316_cur
    .local pmc match
    .lex "$/", match
    length rx1316_eos, rx1316_tgt
    gt rx1316_pos, rx1316_eos, rx1316_done
    set rx1316_off, 0
    lt rx1316_pos, 2, rx1316_start
    sub rx1316_off, rx1316_pos, 1
    substr rx1316_tgt, rx1316_tgt, rx1316_off
  rx1316_start:
    eq $I10, 1, rx1316_restart
    if_null rx1316_debug, debug_1006
    rx1316_cur."!cursor_debug"("START", "infix:sym<::=>")
  debug_1006:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1320_done
    goto rxscan1320_scan
  rxscan1320_loop:
    ($P10) = rx1316_cur."from"()
    inc $P10
    set rx1316_pos, $P10
    ge rx1316_pos, rx1316_eos, rxscan1320_done
  rxscan1320_scan:
    set_addr $I10, rxscan1320_loop
    rx1316_cur."!mark_push"(0, rx1316_pos, $I10)
  rxscan1320_done:
.annotate 'line', 559
  # rx subcapture "sym"
    set_addr $I10, rxcap_1321_fail
    rx1316_cur."!mark_push"(0, rx1316_pos, $I10)
  # rx literal  "::="
    add $I11, rx1316_pos, 3
    gt $I11, rx1316_eos, rx1316_fail
    sub $I11, rx1316_pos, rx1316_off
    substr $S10, rx1316_tgt, $I11, 3
    ne $S10, "::=", rx1316_fail
    add rx1316_pos, 3
    set_addr $I10, rxcap_1321_fail
    ($I12, $I11) = rx1316_cur."!mark_peek"($I10)
    rx1316_cur."!cursor_pos"($I11)
    ($P10) = rx1316_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1316_pos, "")
    rx1316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1321_done
  rxcap_1321_fail:
    goto rx1316_fail
  rxcap_1321_done:
  # rx subrule "O" subtype=capture negate=
    rx1316_cur."!cursor_pos"(rx1316_pos)
    $P10 = rx1316_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1316_fail
    rx1316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1316_pos = $P10."pos"()
  # rx pass
    rx1316_cur."!cursor_pass"(rx1316_pos, "infix:sym<::=>")
    if_null rx1316_debug, debug_1007
    rx1316_cur."!cursor_debug"("PASS", "infix:sym<::=>", " at pos=", rx1316_pos)
  debug_1007:
    .return (rx1316_cur)
  rx1316_restart:
.annotate 'line', 455
    if_null rx1316_debug, debug_1008
    rx1316_cur."!cursor_debug"("NEXT", "infix:sym<::=>")
  debug_1008:
  rx1316_fail:
    (rx1316_rep, rx1316_pos, $I10, $P10) = rx1316_cur."!mark_fail"(0)
    lt rx1316_pos, -1, rx1316_done
    eq rx1316_pos, -1, rx1316_fail
    jump $I10
  rx1316_done:
    rx1316_cur."!cursor_fail"()
    if_null rx1316_debug, debug_1009
    rx1316_cur."!cursor_debug"("FAIL", "infix:sym<::=>")
  debug_1009:
    .return (rx1316_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("341_1297880739.64186") :method
.annotate 'line', 455
    $P1318 = self."!PREFIX__!subrule"("O", "::=")
    new $P1319, "ResizablePMCArray"
    push $P1319, $P1318
    .return ($P1319)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("342_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1323_tgt
    .local int rx1323_pos
    .local int rx1323_off
    .local int rx1323_eos
    .local int rx1323_rep
    .local pmc rx1323_cur
    .local pmc rx1323_debug
    (rx1323_cur, rx1323_pos, rx1323_tgt, $I10) = self."!cursor_start"()
    getattribute rx1323_debug, rx1323_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1323_cur
    .local pmc match
    .lex "$/", match
    length rx1323_eos, rx1323_tgt
    gt rx1323_pos, rx1323_eos, rx1323_done
    set rx1323_off, 0
    lt rx1323_pos, 2, rx1323_start
    sub rx1323_off, rx1323_pos, 1
    substr rx1323_tgt, rx1323_tgt, rx1323_off
  rx1323_start:
    eq $I10, 1, rx1323_restart
    if_null rx1323_debug, debug_1010
    rx1323_cur."!cursor_debug"("START", "infix:sym<,>")
  debug_1010:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1327_done
    goto rxscan1327_scan
  rxscan1327_loop:
    ($P10) = rx1323_cur."from"()
    inc $P10
    set rx1323_pos, $P10
    ge rx1323_pos, rx1323_eos, rxscan1327_done
  rxscan1327_scan:
    set_addr $I10, rxscan1327_loop
    rx1323_cur."!mark_push"(0, rx1323_pos, $I10)
  rxscan1327_done:
.annotate 'line', 561
  # rx subcapture "sym"
    set_addr $I10, rxcap_1328_fail
    rx1323_cur."!mark_push"(0, rx1323_pos, $I10)
  # rx literal  ","
    add $I11, rx1323_pos, 1
    gt $I11, rx1323_eos, rx1323_fail
    sub $I11, rx1323_pos, rx1323_off
    ord $I11, rx1323_tgt, $I11
    ne $I11, 44, rx1323_fail
    add rx1323_pos, 1
    set_addr $I10, rxcap_1328_fail
    ($I12, $I11) = rx1323_cur."!mark_peek"($I10)
    rx1323_cur."!cursor_pos"($I11)
    ($P10) = rx1323_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1323_pos, "")
    rx1323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1328_done
  rxcap_1328_fail:
    goto rx1323_fail
  rxcap_1328_done:
  # rx subrule "O" subtype=capture negate=
    rx1323_cur."!cursor_pos"(rx1323_pos)
    $P10 = rx1323_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1323_fail
    rx1323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1323_pos = $P10."pos"()
  # rx pass
    rx1323_cur."!cursor_pass"(rx1323_pos, "infix:sym<,>")
    if_null rx1323_debug, debug_1011
    rx1323_cur."!cursor_debug"("PASS", "infix:sym<,>", " at pos=", rx1323_pos)
  debug_1011:
    .return (rx1323_cur)
  rx1323_restart:
.annotate 'line', 455
    if_null rx1323_debug, debug_1012
    rx1323_cur."!cursor_debug"("NEXT", "infix:sym<,>")
  debug_1012:
  rx1323_fail:
    (rx1323_rep, rx1323_pos, $I10, $P10) = rx1323_cur."!mark_fail"(0)
    lt rx1323_pos, -1, rx1323_done
    eq rx1323_pos, -1, rx1323_fail
    jump $I10
  rx1323_done:
    rx1323_cur."!cursor_fail"()
    if_null rx1323_debug, debug_1013
    rx1323_cur."!cursor_debug"("FAIL", "infix:sym<,>")
  debug_1013:
    .return (rx1323_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("343_1297880739.64186") :method
.annotate 'line', 455
    $P1325 = self."!PREFIX__!subrule"("O", ",")
    new $P1326, "ResizablePMCArray"
    push $P1326, $P1325
    .return ($P1326)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("344_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1330_tgt
    .local int rx1330_pos
    .local int rx1330_off
    .local int rx1330_eos
    .local int rx1330_rep
    .local pmc rx1330_cur
    .local pmc rx1330_debug
    (rx1330_cur, rx1330_pos, rx1330_tgt, $I10) = self."!cursor_start"()
    getattribute rx1330_debug, rx1330_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1330_cur
    .local pmc match
    .lex "$/", match
    length rx1330_eos, rx1330_tgt
    gt rx1330_pos, rx1330_eos, rx1330_done
    set rx1330_off, 0
    lt rx1330_pos, 2, rx1330_start
    sub rx1330_off, rx1330_pos, 1
    substr rx1330_tgt, rx1330_tgt, rx1330_off
  rx1330_start:
    eq $I10, 1, rx1330_restart
    if_null rx1330_debug, debug_1014
    rx1330_cur."!cursor_debug"("START", "prefix:sym<return>")
  debug_1014:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1333_done
    goto rxscan1333_scan
  rxscan1333_loop:
    ($P10) = rx1330_cur."from"()
    inc $P10
    set rx1330_pos, $P10
    ge rx1330_pos, rx1330_eos, rxscan1333_done
  rxscan1333_scan:
    set_addr $I10, rxscan1333_loop
    rx1330_cur."!mark_push"(0, rx1330_pos, $I10)
  rxscan1333_done:
.annotate 'line', 563
  # rx subcapture "sym"
    set_addr $I10, rxcap_1334_fail
    rx1330_cur."!mark_push"(0, rx1330_pos, $I10)
  # rx literal  "return"
    add $I11, rx1330_pos, 6
    gt $I11, rx1330_eos, rx1330_fail
    sub $I11, rx1330_pos, rx1330_off
    substr $S10, rx1330_tgt, $I11, 6
    ne $S10, "return", rx1330_fail
    add rx1330_pos, 6
    set_addr $I10, rxcap_1334_fail
    ($I12, $I11) = rx1330_cur."!mark_peek"($I10)
    rx1330_cur."!cursor_pos"($I11)
    ($P10) = rx1330_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1330_pos, "")
    rx1330_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1334_done
  rxcap_1334_fail:
    goto rx1330_fail
  rxcap_1334_done:
  # rx charclass s
    ge rx1330_pos, rx1330_eos, rx1330_fail
    sub $I10, rx1330_pos, rx1330_off
    is_cclass $I11, 32, rx1330_tgt, $I10
    unless $I11, rx1330_fail
    inc rx1330_pos
  # rx subrule "O" subtype=capture negate=
    rx1330_cur."!cursor_pos"(rx1330_pos)
    $P10 = rx1330_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1330_fail
    rx1330_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1330_pos = $P10."pos"()
  # rx pass
    rx1330_cur."!cursor_pass"(rx1330_pos, "prefix:sym<return>")
    if_null rx1330_debug, debug_1015
    rx1330_cur."!cursor_debug"("PASS", "prefix:sym<return>", " at pos=", rx1330_pos)
  debug_1015:
    .return (rx1330_cur)
  rx1330_restart:
.annotate 'line', 455
    if_null rx1330_debug, debug_1016
    rx1330_cur."!cursor_debug"("NEXT", "prefix:sym<return>")
  debug_1016:
  rx1330_fail:
    (rx1330_rep, rx1330_pos, $I10, $P10) = rx1330_cur."!mark_fail"(0)
    lt rx1330_pos, -1, rx1330_done
    eq rx1330_pos, -1, rx1330_fail
    jump $I10
  rx1330_done:
    rx1330_cur."!cursor_fail"()
    if_null rx1330_debug, debug_1017
    rx1330_cur."!cursor_debug"("FAIL", "prefix:sym<return>")
  debug_1017:
    .return (rx1330_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("345_1297880739.64186") :method
.annotate 'line', 455
    new $P1332, "ResizablePMCArray"
    push $P1332, "return"
    .return ($P1332)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("346_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1336_tgt
    .local int rx1336_pos
    .local int rx1336_off
    .local int rx1336_eos
    .local int rx1336_rep
    .local pmc rx1336_cur
    .local pmc rx1336_debug
    (rx1336_cur, rx1336_pos, rx1336_tgt, $I10) = self."!cursor_start"()
    getattribute rx1336_debug, rx1336_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1336_cur
    .local pmc match
    .lex "$/", match
    length rx1336_eos, rx1336_tgt
    gt rx1336_pos, rx1336_eos, rx1336_done
    set rx1336_off, 0
    lt rx1336_pos, 2, rx1336_start
    sub rx1336_off, rx1336_pos, 1
    substr rx1336_tgt, rx1336_tgt, rx1336_off
  rx1336_start:
    eq $I10, 1, rx1336_restart
    if_null rx1336_debug, debug_1018
    rx1336_cur."!cursor_debug"("START", "prefix:sym<make>")
  debug_1018:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1339_done
    goto rxscan1339_scan
  rxscan1339_loop:
    ($P10) = rx1336_cur."from"()
    inc $P10
    set rx1336_pos, $P10
    ge rx1336_pos, rx1336_eos, rxscan1339_done
  rxscan1339_scan:
    set_addr $I10, rxscan1339_loop
    rx1336_cur."!mark_push"(0, rx1336_pos, $I10)
  rxscan1339_done:
.annotate 'line', 564
  # rx subcapture "sym"
    set_addr $I10, rxcap_1340_fail
    rx1336_cur."!mark_push"(0, rx1336_pos, $I10)
  # rx literal  "make"
    add $I11, rx1336_pos, 4
    gt $I11, rx1336_eos, rx1336_fail
    sub $I11, rx1336_pos, rx1336_off
    substr $S10, rx1336_tgt, $I11, 4
    ne $S10, "make", rx1336_fail
    add rx1336_pos, 4
    set_addr $I10, rxcap_1340_fail
    ($I12, $I11) = rx1336_cur."!mark_peek"($I10)
    rx1336_cur."!cursor_pos"($I11)
    ($P10) = rx1336_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1336_pos, "")
    rx1336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1340_done
  rxcap_1340_fail:
    goto rx1336_fail
  rxcap_1340_done:
  # rx charclass s
    ge rx1336_pos, rx1336_eos, rx1336_fail
    sub $I10, rx1336_pos, rx1336_off
    is_cclass $I11, 32, rx1336_tgt, $I10
    unless $I11, rx1336_fail
    inc rx1336_pos
  # rx subrule "O" subtype=capture negate=
    rx1336_cur."!cursor_pos"(rx1336_pos)
    $P10 = rx1336_cur."O"("%list_prefix")
    unless $P10, rx1336_fail
    rx1336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1336_pos = $P10."pos"()
  # rx pass
    rx1336_cur."!cursor_pass"(rx1336_pos, "prefix:sym<make>")
    if_null rx1336_debug, debug_1019
    rx1336_cur."!cursor_debug"("PASS", "prefix:sym<make>", " at pos=", rx1336_pos)
  debug_1019:
    .return (rx1336_cur)
  rx1336_restart:
.annotate 'line', 455
    if_null rx1336_debug, debug_1020
    rx1336_cur."!cursor_debug"("NEXT", "prefix:sym<make>")
  debug_1020:
  rx1336_fail:
    (rx1336_rep, rx1336_pos, $I10, $P10) = rx1336_cur."!mark_fail"(0)
    lt rx1336_pos, -1, rx1336_done
    eq rx1336_pos, -1, rx1336_fail
    jump $I10
  rx1336_done:
    rx1336_cur."!cursor_fail"()
    if_null rx1336_debug, debug_1021
    rx1336_cur."!cursor_debug"("FAIL", "prefix:sym<make>")
  debug_1021:
    .return (rx1336_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("347_1297880739.64186") :method
.annotate 'line', 455
    new $P1338, "ResizablePMCArray"
    push $P1338, "make"
    .return ($P1338)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("348_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1342_tgt
    .local int rx1342_pos
    .local int rx1342_off
    .local int rx1342_eos
    .local int rx1342_rep
    .local pmc rx1342_cur
    .local pmc rx1342_debug
    (rx1342_cur, rx1342_pos, rx1342_tgt, $I10) = self."!cursor_start"()
    getattribute rx1342_debug, rx1342_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1342_cur
    .local pmc match
    .lex "$/", match
    length rx1342_eos, rx1342_tgt
    gt rx1342_pos, rx1342_eos, rx1342_done
    set rx1342_off, 0
    lt rx1342_pos, 2, rx1342_start
    sub rx1342_off, rx1342_pos, 1
    substr rx1342_tgt, rx1342_tgt, rx1342_off
  rx1342_start:
    eq $I10, 1, rx1342_restart
    if_null rx1342_debug, debug_1022
    rx1342_cur."!cursor_debug"("START", "term:sym<last>")
  debug_1022:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1345_done
    goto rxscan1345_scan
  rxscan1345_loop:
    ($P10) = rx1342_cur."from"()
    inc $P10
    set rx1342_pos, $P10
    ge rx1342_pos, rx1342_eos, rxscan1345_done
  rxscan1345_scan:
    set_addr $I10, rxscan1345_loop
    rx1342_cur."!mark_push"(0, rx1342_pos, $I10)
  rxscan1345_done:
.annotate 'line', 565
  # rx subcapture "sym"
    set_addr $I10, rxcap_1346_fail
    rx1342_cur."!mark_push"(0, rx1342_pos, $I10)
  # rx literal  "last"
    add $I11, rx1342_pos, 4
    gt $I11, rx1342_eos, rx1342_fail
    sub $I11, rx1342_pos, rx1342_off
    substr $S10, rx1342_tgt, $I11, 4
    ne $S10, "last", rx1342_fail
    add rx1342_pos, 4
    set_addr $I10, rxcap_1346_fail
    ($I12, $I11) = rx1342_cur."!mark_peek"($I10)
    rx1342_cur."!cursor_pos"($I11)
    ($P10) = rx1342_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1342_pos, "")
    rx1342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1346_done
  rxcap_1346_fail:
    goto rx1342_fail
  rxcap_1346_done:
  # rx pass
    rx1342_cur."!cursor_pass"(rx1342_pos, "term:sym<last>")
    if_null rx1342_debug, debug_1023
    rx1342_cur."!cursor_debug"("PASS", "term:sym<last>", " at pos=", rx1342_pos)
  debug_1023:
    .return (rx1342_cur)
  rx1342_restart:
.annotate 'line', 455
    if_null rx1342_debug, debug_1024
    rx1342_cur."!cursor_debug"("NEXT", "term:sym<last>")
  debug_1024:
  rx1342_fail:
    (rx1342_rep, rx1342_pos, $I10, $P10) = rx1342_cur."!mark_fail"(0)
    lt rx1342_pos, -1, rx1342_done
    eq rx1342_pos, -1, rx1342_fail
    jump $I10
  rx1342_done:
    rx1342_cur."!cursor_fail"()
    if_null rx1342_debug, debug_1025
    rx1342_cur."!cursor_debug"("FAIL", "term:sym<last>")
  debug_1025:
    .return (rx1342_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("349_1297880739.64186") :method
.annotate 'line', 455
    new $P1344, "ResizablePMCArray"
    push $P1344, "last"
    .return ($P1344)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("350_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1348_tgt
    .local int rx1348_pos
    .local int rx1348_off
    .local int rx1348_eos
    .local int rx1348_rep
    .local pmc rx1348_cur
    .local pmc rx1348_debug
    (rx1348_cur, rx1348_pos, rx1348_tgt, $I10) = self."!cursor_start"()
    getattribute rx1348_debug, rx1348_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1348_cur
    .local pmc match
    .lex "$/", match
    length rx1348_eos, rx1348_tgt
    gt rx1348_pos, rx1348_eos, rx1348_done
    set rx1348_off, 0
    lt rx1348_pos, 2, rx1348_start
    sub rx1348_off, rx1348_pos, 1
    substr rx1348_tgt, rx1348_tgt, rx1348_off
  rx1348_start:
    eq $I10, 1, rx1348_restart
    if_null rx1348_debug, debug_1026
    rx1348_cur."!cursor_debug"("START", "term:sym<next>")
  debug_1026:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1351_done
    goto rxscan1351_scan
  rxscan1351_loop:
    ($P10) = rx1348_cur."from"()
    inc $P10
    set rx1348_pos, $P10
    ge rx1348_pos, rx1348_eos, rxscan1351_done
  rxscan1351_scan:
    set_addr $I10, rxscan1351_loop
    rx1348_cur."!mark_push"(0, rx1348_pos, $I10)
  rxscan1351_done:
.annotate 'line', 566
  # rx subcapture "sym"
    set_addr $I10, rxcap_1352_fail
    rx1348_cur."!mark_push"(0, rx1348_pos, $I10)
  # rx literal  "next"
    add $I11, rx1348_pos, 4
    gt $I11, rx1348_eos, rx1348_fail
    sub $I11, rx1348_pos, rx1348_off
    substr $S10, rx1348_tgt, $I11, 4
    ne $S10, "next", rx1348_fail
    add rx1348_pos, 4
    set_addr $I10, rxcap_1352_fail
    ($I12, $I11) = rx1348_cur."!mark_peek"($I10)
    rx1348_cur."!cursor_pos"($I11)
    ($P10) = rx1348_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1348_pos, "")
    rx1348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1352_done
  rxcap_1352_fail:
    goto rx1348_fail
  rxcap_1352_done:
  # rx pass
    rx1348_cur."!cursor_pass"(rx1348_pos, "term:sym<next>")
    if_null rx1348_debug, debug_1027
    rx1348_cur."!cursor_debug"("PASS", "term:sym<next>", " at pos=", rx1348_pos)
  debug_1027:
    .return (rx1348_cur)
  rx1348_restart:
.annotate 'line', 455
    if_null rx1348_debug, debug_1028
    rx1348_cur."!cursor_debug"("NEXT", "term:sym<next>")
  debug_1028:
  rx1348_fail:
    (rx1348_rep, rx1348_pos, $I10, $P10) = rx1348_cur."!mark_fail"(0)
    lt rx1348_pos, -1, rx1348_done
    eq rx1348_pos, -1, rx1348_fail
    jump $I10
  rx1348_done:
    rx1348_cur."!cursor_fail"()
    if_null rx1348_debug, debug_1029
    rx1348_cur."!cursor_debug"("FAIL", "term:sym<next>")
  debug_1029:
    .return (rx1348_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("351_1297880739.64186") :method
.annotate 'line', 455
    new $P1350, "ResizablePMCArray"
    push $P1350, "next"
    .return ($P1350)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("352_1297880739.64186") :method :outer("11_1297880739.64186")
.annotate 'line', 455
    .local string rx1354_tgt
    .local int rx1354_pos
    .local int rx1354_off
    .local int rx1354_eos
    .local int rx1354_rep
    .local pmc rx1354_cur
    .local pmc rx1354_debug
    (rx1354_cur, rx1354_pos, rx1354_tgt, $I10) = self."!cursor_start"()
    getattribute rx1354_debug, rx1354_cur, "$!debug"
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
    eq $I10, 1, rx1354_restart
    if_null rx1354_debug, debug_1030
    rx1354_cur."!cursor_debug"("START", "term:sym<redo>")
  debug_1030:
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
.annotate 'line', 567
  # rx subcapture "sym"
    set_addr $I10, rxcap_1358_fail
    rx1354_cur."!mark_push"(0, rx1354_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1354_pos, 4
    gt $I11, rx1354_eos, rx1354_fail
    sub $I11, rx1354_pos, rx1354_off
    substr $S10, rx1354_tgt, $I11, 4
    ne $S10, "redo", rx1354_fail
    add rx1354_pos, 4
    set_addr $I10, rxcap_1358_fail
    ($I12, $I11) = rx1354_cur."!mark_peek"($I10)
    rx1354_cur."!cursor_pos"($I11)
    ($P10) = rx1354_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1354_pos, "")
    rx1354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1358_done
  rxcap_1358_fail:
    goto rx1354_fail
  rxcap_1358_done:
  # rx pass
    rx1354_cur."!cursor_pass"(rx1354_pos, "term:sym<redo>")
    if_null rx1354_debug, debug_1031
    rx1354_cur."!cursor_debug"("PASS", "term:sym<redo>", " at pos=", rx1354_pos)
  debug_1031:
    .return (rx1354_cur)
  rx1354_restart:
.annotate 'line', 455
    if_null rx1354_debug, debug_1032
    rx1354_cur."!cursor_debug"("NEXT", "term:sym<redo>")
  debug_1032:
  rx1354_fail:
    (rx1354_rep, rx1354_pos, $I10, $P10) = rx1354_cur."!mark_fail"(0)
    lt rx1354_pos, -1, rx1354_done
    eq rx1354_pos, -1, rx1354_fail
    jump $I10
  rx1354_done:
    rx1354_cur."!cursor_fail"()
    if_null rx1354_debug, debug_1033
    rx1354_cur."!cursor_debug"("FAIL", "term:sym<redo>")
  debug_1033:
    .return (rx1354_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("353_1297880739.64186") :method
.annotate 'line', 455
    new $P1356, "ResizablePMCArray"
    push $P1356, "redo"
    .return ($P1356)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("354_1297880739.64186") :method :outer("11_1297880739.64186")
    .param pmc param_1362
.annotate 'line', 569
    new $P1361, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1361, control_1360
    push_eh $P1361
    .lex "self", self
    .lex "$/", param_1362
.annotate 'line', 571
    new $P1363, "Undef"
    .lex "$t", $P1363
    find_lex $P1364, "$/"
    unless_null $P1364, vivify_1034
    $P1364 = root_new ['parrot';'ResizablePMCArray']
  vivify_1034:
    set $P1365, $P1364[0]
    unless_null $P1365, vivify_1035
    new $P1365, "Undef"
  vivify_1035:
    store_lex "$t", $P1365
    find_lex $P1366, "$/"
    unless_null $P1366, vivify_1036
    $P1366 = root_new ['parrot';'ResizablePMCArray']
  vivify_1036:
    set $P1367, $P1366[1]
    unless_null $P1367, vivify_1037
    new $P1367, "Undef"
  vivify_1037:
    find_lex $P1368, "$/"
    unless_null $P1368, vivify_1038
    $P1368 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1368
  vivify_1038:
    set $P1368[0], $P1367
    find_lex $P1369, "$t"
    find_lex $P1370, "$/"
    unless_null $P1370, vivify_1039
    $P1370 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1370
  vivify_1039:
    set $P1370[1], $P1369
.annotate 'line', 569
    .return ($P1369)
  control_1360:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1371, exception, "payload"
    .return ($P1371)
.end


.namespace ["NQP";"Regex"]
.sub "_block1372"  :subid("355_1297880739.64186") :outer("11_1297880739.64186")
.annotate 'line', 575
    .const 'Sub' $P1429 = "374_1297880739.64186" 
    capture_lex $P1429
    .const 'Sub' $P1424 = "372_1297880739.64186" 
    capture_lex $P1424
    .const 'Sub' $P1412 = "369_1297880739.64186" 
    capture_lex $P1412
    .const 'Sub' $P1402 = "366_1297880739.64186" 
    capture_lex $P1402
    .const 'Sub' $P1397 = "364_1297880739.64186" 
    capture_lex $P1397
    .const 'Sub' $P1388 = "361_1297880739.64186" 
    capture_lex $P1388
    .const 'Sub' $P1383 = "359_1297880739.64186" 
    capture_lex $P1383
    .const 'Sub' $P1374 = "356_1297880739.64186" 
    capture_lex $P1374
    .const 'Sub' $P1429 = "374_1297880739.64186" 
    capture_lex $P1429
    .return ($P1429)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("356_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .const 'Sub' $P1380 = "358_1297880739.64186" 
    capture_lex $P1380
    .local string rx1375_tgt
    .local int rx1375_pos
    .local int rx1375_off
    .local int rx1375_eos
    .local int rx1375_rep
    .local pmc rx1375_cur
    .local pmc rx1375_debug
    (rx1375_cur, rx1375_pos, rx1375_tgt, $I10) = self."!cursor_start"()
    getattribute rx1375_debug, rx1375_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1375_cur
    .local pmc match
    .lex "$/", match
    length rx1375_eos, rx1375_tgt
    gt rx1375_pos, rx1375_eos, rx1375_done
    set rx1375_off, 0
    lt rx1375_pos, 2, rx1375_start
    sub rx1375_off, rx1375_pos, 1
    substr rx1375_tgt, rx1375_tgt, rx1375_off
  rx1375_start:
    eq $I10, 1, rx1375_restart
    if_null rx1375_debug, debug_1040
    rx1375_cur."!cursor_debug"("START", "metachar:sym<:my>")
  debug_1040:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1378_done
    goto rxscan1378_scan
  rxscan1378_loop:
    ($P10) = rx1375_cur."from"()
    inc $P10
    set rx1375_pos, $P10
    ge rx1375_pos, rx1375_eos, rxscan1378_done
  rxscan1378_scan:
    set_addr $I10, rxscan1378_loop
    rx1375_cur."!mark_push"(0, rx1375_pos, $I10)
  rxscan1378_done:
.annotate 'line', 577
  # rx literal  ":"
    add $I11, rx1375_pos, 1
    gt $I11, rx1375_eos, rx1375_fail
    sub $I11, rx1375_pos, rx1375_off
    ord $I11, rx1375_tgt, $I11
    ne $I11, 58, rx1375_fail
    add rx1375_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1375_cur."!cursor_pos"(rx1375_pos)
    .const 'Sub' $P1380 = "358_1297880739.64186" 
    capture_lex $P1380
    $P10 = rx1375_cur."before"($P1380)
    unless $P10, rx1375_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1375_cur."!cursor_pos"(rx1375_pos)
    $P10 = rx1375_cur."LANG"("MAIN", "statement")
    unless $P10, rx1375_fail
    rx1375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1375_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1375_cur."!cursor_pos"(rx1375_pos)
    $P10 = rx1375_cur."ws"()
    unless $P10, rx1375_fail
    rx1375_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1375_pos, 1
    gt $I11, rx1375_eos, rx1375_fail
    sub $I11, rx1375_pos, rx1375_off
    ord $I11, rx1375_tgt, $I11
    ne $I11, 59, rx1375_fail
    add rx1375_pos, 1
.annotate 'line', 576
  # rx pass
    rx1375_cur."!cursor_pass"(rx1375_pos, "metachar:sym<:my>")
    if_null rx1375_debug, debug_1045
    rx1375_cur."!cursor_debug"("PASS", "metachar:sym<:my>", " at pos=", rx1375_pos)
  debug_1045:
    .return (rx1375_cur)
  rx1375_restart:
.annotate 'line', 575
    if_null rx1375_debug, debug_1046
    rx1375_cur."!cursor_debug"("NEXT", "metachar:sym<:my>")
  debug_1046:
  rx1375_fail:
    (rx1375_rep, rx1375_pos, $I10, $P10) = rx1375_cur."!mark_fail"(0)
    lt rx1375_pos, -1, rx1375_done
    eq rx1375_pos, -1, rx1375_fail
    jump $I10
  rx1375_done:
    rx1375_cur."!cursor_fail"()
    if_null rx1375_debug, debug_1047
    rx1375_cur."!cursor_debug"("FAIL", "metachar:sym<:my>")
  debug_1047:
    .return (rx1375_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("357_1297880739.64186") :method
.annotate 'line', 575
    new $P1377, "ResizablePMCArray"
    push $P1377, ":"
    .return ($P1377)
.end


.namespace ["NQP";"Regex"]
.sub "_block1379"  :anon :subid("358_1297880739.64186") :method :outer("356_1297880739.64186")
.annotate 'line', 577
    .local string rx1381_tgt
    .local int rx1381_pos
    .local int rx1381_off
    .local int rx1381_eos
    .local int rx1381_rep
    .local pmc rx1381_cur
    .local pmc rx1381_debug
    (rx1381_cur, rx1381_pos, rx1381_tgt, $I10) = self."!cursor_start"()
    getattribute rx1381_debug, rx1381_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1381_cur
    .local pmc match
    .lex "$/", match
    length rx1381_eos, rx1381_tgt
    gt rx1381_pos, rx1381_eos, rx1381_done
    set rx1381_off, 0
    lt rx1381_pos, 2, rx1381_start
    sub rx1381_off, rx1381_pos, 1
    substr rx1381_tgt, rx1381_tgt, rx1381_off
  rx1381_start:
    eq $I10, 1, rx1381_restart
    if_null rx1381_debug, debug_1041
    rx1381_cur."!cursor_debug"("START", "")
  debug_1041:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1382_done
    goto rxscan1382_scan
  rxscan1382_loop:
    ($P10) = rx1381_cur."from"()
    inc $P10
    set rx1381_pos, $P10
    ge rx1381_pos, rx1381_eos, rxscan1382_done
  rxscan1382_scan:
    set_addr $I10, rxscan1382_loop
    rx1381_cur."!mark_push"(0, rx1381_pos, $I10)
  rxscan1382_done:
  # rx literal  "my"
    add $I11, rx1381_pos, 2
    gt $I11, rx1381_eos, rx1381_fail
    sub $I11, rx1381_pos, rx1381_off
    substr $S10, rx1381_tgt, $I11, 2
    ne $S10, "my", rx1381_fail
    add rx1381_pos, 2
  # rx pass
    rx1381_cur."!cursor_pass"(rx1381_pos, "")
    if_null rx1381_debug, debug_1042
    rx1381_cur."!cursor_debug"("PASS", "", " at pos=", rx1381_pos)
  debug_1042:
    .return (rx1381_cur)
  rx1381_restart:
    if_null rx1381_debug, debug_1043
    rx1381_cur."!cursor_debug"("NEXT", "")
  debug_1043:
  rx1381_fail:
    (rx1381_rep, rx1381_pos, $I10, $P10) = rx1381_cur."!mark_fail"(0)
    lt rx1381_pos, -1, rx1381_done
    eq rx1381_pos, -1, rx1381_fail
    jump $I10
  rx1381_done:
    rx1381_cur."!cursor_fail"()
    if_null rx1381_debug, debug_1044
    rx1381_cur."!cursor_debug"("FAIL", "")
  debug_1044:
    .return (rx1381_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("359_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .local string rx1384_tgt
    .local int rx1384_pos
    .local int rx1384_off
    .local int rx1384_eos
    .local int rx1384_rep
    .local pmc rx1384_cur
    .local pmc rx1384_debug
    (rx1384_cur, rx1384_pos, rx1384_tgt, $I10) = self."!cursor_start"()
    getattribute rx1384_debug, rx1384_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1384_cur
    .local pmc match
    .lex "$/", match
    length rx1384_eos, rx1384_tgt
    gt rx1384_pos, rx1384_eos, rx1384_done
    set rx1384_off, 0
    lt rx1384_pos, 2, rx1384_start
    sub rx1384_off, rx1384_pos, 1
    substr rx1384_tgt, rx1384_tgt, rx1384_off
  rx1384_start:
    eq $I10, 1, rx1384_restart
    if_null rx1384_debug, debug_1048
    rx1384_cur."!cursor_debug"("START", "metachar:sym<{ }>")
  debug_1048:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1387_done
    goto rxscan1387_scan
  rxscan1387_loop:
    ($P10) = rx1384_cur."from"()
    inc $P10
    set rx1384_pos, $P10
    ge rx1384_pos, rx1384_eos, rxscan1387_done
  rxscan1387_scan:
    set_addr $I10, rxscan1387_loop
    rx1384_cur."!mark_push"(0, rx1384_pos, $I10)
  rxscan1387_done:
.annotate 'line', 581
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1384_pos, rx1384_off
    substr $S10, rx1384_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1384_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1384_cur."!cursor_pos"(rx1384_pos)
    $P10 = rx1384_cur."codeblock"()
    unless $P10, rx1384_fail
    rx1384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1384_pos = $P10."pos"()
.annotate 'line', 580
  # rx pass
    rx1384_cur."!cursor_pass"(rx1384_pos, "metachar:sym<{ }>")
    if_null rx1384_debug, debug_1049
    rx1384_cur."!cursor_debug"("PASS", "metachar:sym<{ }>", " at pos=", rx1384_pos)
  debug_1049:
    .return (rx1384_cur)
  rx1384_restart:
.annotate 'line', 575
    if_null rx1384_debug, debug_1050
    rx1384_cur."!cursor_debug"("NEXT", "metachar:sym<{ }>")
  debug_1050:
  rx1384_fail:
    (rx1384_rep, rx1384_pos, $I10, $P10) = rx1384_cur."!mark_fail"(0)
    lt rx1384_pos, -1, rx1384_done
    eq rx1384_pos, -1, rx1384_fail
    jump $I10
  rx1384_done:
    rx1384_cur."!cursor_fail"()
    if_null rx1384_debug, debug_1051
    rx1384_cur."!cursor_debug"("FAIL", "metachar:sym<{ }>")
  debug_1051:
    .return (rx1384_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("360_1297880739.64186") :method
.annotate 'line', 575
    new $P1386, "ResizablePMCArray"
    push $P1386, "{"
    .return ($P1386)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("361_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .const 'Sub' $P1394 = "363_1297880739.64186" 
    capture_lex $P1394
    .local string rx1389_tgt
    .local int rx1389_pos
    .local int rx1389_off
    .local int rx1389_eos
    .local int rx1389_rep
    .local pmc rx1389_cur
    .local pmc rx1389_debug
    (rx1389_cur, rx1389_pos, rx1389_tgt, $I10) = self."!cursor_start"()
    getattribute rx1389_debug, rx1389_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1389_cur
    .local pmc match
    .lex "$/", match
    length rx1389_eos, rx1389_tgt
    gt rx1389_pos, rx1389_eos, rx1389_done
    set rx1389_off, 0
    lt rx1389_pos, 2, rx1389_start
    sub rx1389_off, rx1389_pos, 1
    substr rx1389_tgt, rx1389_tgt, rx1389_off
  rx1389_start:
    eq $I10, 1, rx1389_restart
    if_null rx1389_debug, debug_1052
    rx1389_cur."!cursor_debug"("START", "metachar:sym<nqpvar>")
  debug_1052:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1392_done
    goto rxscan1392_scan
  rxscan1392_loop:
    ($P10) = rx1389_cur."from"()
    inc $P10
    set rx1389_pos, $P10
    ge rx1389_pos, rx1389_eos, rxscan1392_done
  rxscan1392_scan:
    set_addr $I10, rxscan1392_loop
    rx1389_cur."!mark_push"(0, rx1389_pos, $I10)
  rxscan1392_done:
.annotate 'line', 585
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1389_pos, rx1389_off
    substr $S10, rx1389_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1389_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1389_cur."!cursor_pos"(rx1389_pos)
    .const 'Sub' $P1394 = "363_1297880739.64186" 
    capture_lex $P1394
    $P10 = rx1389_cur."before"($P1394)
    unless $P10, rx1389_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1389_cur."!cursor_pos"(rx1389_pos)
    $P10 = rx1389_cur."LANG"("MAIN", "variable")
    unless $P10, rx1389_fail
    rx1389_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1389_pos = $P10."pos"()
.annotate 'line', 584
  # rx pass
    rx1389_cur."!cursor_pass"(rx1389_pos, "metachar:sym<nqpvar>")
    if_null rx1389_debug, debug_1057
    rx1389_cur."!cursor_debug"("PASS", "metachar:sym<nqpvar>", " at pos=", rx1389_pos)
  debug_1057:
    .return (rx1389_cur)
  rx1389_restart:
.annotate 'line', 575
    if_null rx1389_debug, debug_1058
    rx1389_cur."!cursor_debug"("NEXT", "metachar:sym<nqpvar>")
  debug_1058:
  rx1389_fail:
    (rx1389_rep, rx1389_pos, $I10, $P10) = rx1389_cur."!mark_fail"(0)
    lt rx1389_pos, -1, rx1389_done
    eq rx1389_pos, -1, rx1389_fail
    jump $I10
  rx1389_done:
    rx1389_cur."!cursor_fail"()
    if_null rx1389_debug, debug_1059
    rx1389_cur."!cursor_debug"("FAIL", "metachar:sym<nqpvar>")
  debug_1059:
    .return (rx1389_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("362_1297880739.64186") :method
.annotate 'line', 575
    new $P1391, "ResizablePMCArray"
    push $P1391, "$"
    push $P1391, "@"
    .return ($P1391)
.end


.namespace ["NQP";"Regex"]
.sub "_block1393"  :anon :subid("363_1297880739.64186") :method :outer("361_1297880739.64186")
.annotate 'line', 585
    .local string rx1395_tgt
    .local int rx1395_pos
    .local int rx1395_off
    .local int rx1395_eos
    .local int rx1395_rep
    .local pmc rx1395_cur
    .local pmc rx1395_debug
    (rx1395_cur, rx1395_pos, rx1395_tgt, $I10) = self."!cursor_start"()
    getattribute rx1395_debug, rx1395_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1395_cur
    .local pmc match
    .lex "$/", match
    length rx1395_eos, rx1395_tgt
    gt rx1395_pos, rx1395_eos, rx1395_done
    set rx1395_off, 0
    lt rx1395_pos, 2, rx1395_start
    sub rx1395_off, rx1395_pos, 1
    substr rx1395_tgt, rx1395_tgt, rx1395_off
  rx1395_start:
    eq $I10, 1, rx1395_restart
    if_null rx1395_debug, debug_1053
    rx1395_cur."!cursor_debug"("START", "")
  debug_1053:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1396_done
    goto rxscan1396_scan
  rxscan1396_loop:
    ($P10) = rx1395_cur."from"()
    inc $P10
    set rx1395_pos, $P10
    ge rx1395_pos, rx1395_eos, rxscan1396_done
  rxscan1396_scan:
    set_addr $I10, rxscan1396_loop
    rx1395_cur."!mark_push"(0, rx1395_pos, $I10)
  rxscan1396_done:
  # rx charclass .
    ge rx1395_pos, rx1395_eos, rx1395_fail
    inc rx1395_pos
  # rx charclass w
    ge rx1395_pos, rx1395_eos, rx1395_fail
    sub $I10, rx1395_pos, rx1395_off
    is_cclass $I11, 8192, rx1395_tgt, $I10
    unless $I11, rx1395_fail
    inc rx1395_pos
  # rx pass
    rx1395_cur."!cursor_pass"(rx1395_pos, "")
    if_null rx1395_debug, debug_1054
    rx1395_cur."!cursor_debug"("PASS", "", " at pos=", rx1395_pos)
  debug_1054:
    .return (rx1395_cur)
  rx1395_restart:
    if_null rx1395_debug, debug_1055
    rx1395_cur."!cursor_debug"("NEXT", "")
  debug_1055:
  rx1395_fail:
    (rx1395_rep, rx1395_pos, $I10, $P10) = rx1395_cur."!mark_fail"(0)
    lt rx1395_pos, -1, rx1395_done
    eq rx1395_pos, -1, rx1395_fail
    jump $I10
  rx1395_done:
    rx1395_cur."!cursor_fail"()
    if_null rx1395_debug, debug_1056
    rx1395_cur."!cursor_debug"("FAIL", "")
  debug_1056:
    .return (rx1395_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("364_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .local string rx1398_tgt
    .local int rx1398_pos
    .local int rx1398_off
    .local int rx1398_eos
    .local int rx1398_rep
    .local pmc rx1398_cur
    .local pmc rx1398_debug
    (rx1398_cur, rx1398_pos, rx1398_tgt, $I10) = self."!cursor_start"()
    getattribute rx1398_debug, rx1398_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1398_cur
    .local pmc match
    .lex "$/", match
    length rx1398_eos, rx1398_tgt
    gt rx1398_pos, rx1398_eos, rx1398_done
    set rx1398_off, 0
    lt rx1398_pos, 2, rx1398_start
    sub rx1398_off, rx1398_pos, 1
    substr rx1398_tgt, rx1398_tgt, rx1398_off
  rx1398_start:
    eq $I10, 1, rx1398_restart
    if_null rx1398_debug, debug_1060
    rx1398_cur."!cursor_debug"("START", "assertion:sym<{ }>")
  debug_1060:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1401_done
    goto rxscan1401_scan
  rxscan1401_loop:
    ($P10) = rx1398_cur."from"()
    inc $P10
    set rx1398_pos, $P10
    ge rx1398_pos, rx1398_eos, rxscan1401_done
  rxscan1401_scan:
    set_addr $I10, rxscan1401_loop
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxscan1401_done:
.annotate 'line', 589
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1398_pos, rx1398_off
    substr $S10, rx1398_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1398_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1398_cur."!cursor_pos"(rx1398_pos)
    $P10 = rx1398_cur."codeblock"()
    unless $P10, rx1398_fail
    rx1398_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1398_pos = $P10."pos"()
.annotate 'line', 588
  # rx pass
    rx1398_cur."!cursor_pass"(rx1398_pos, "assertion:sym<{ }>")
    if_null rx1398_debug, debug_1061
    rx1398_cur."!cursor_debug"("PASS", "assertion:sym<{ }>", " at pos=", rx1398_pos)
  debug_1061:
    .return (rx1398_cur)
  rx1398_restart:
.annotate 'line', 575
    if_null rx1398_debug, debug_1062
    rx1398_cur."!cursor_debug"("NEXT", "assertion:sym<{ }>")
  debug_1062:
  rx1398_fail:
    (rx1398_rep, rx1398_pos, $I10, $P10) = rx1398_cur."!mark_fail"(0)
    lt rx1398_pos, -1, rx1398_done
    eq rx1398_pos, -1, rx1398_fail
    jump $I10
  rx1398_done:
    rx1398_cur."!cursor_fail"()
    if_null rx1398_debug, debug_1063
    rx1398_cur."!cursor_debug"("FAIL", "assertion:sym<{ }>")
  debug_1063:
    .return (rx1398_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("365_1297880739.64186") :method
.annotate 'line', 575
    new $P1400, "ResizablePMCArray"
    push $P1400, "{"
    .return ($P1400)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("366_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .const 'Sub' $P1408 = "368_1297880739.64186" 
    capture_lex $P1408
    .local string rx1403_tgt
    .local int rx1403_pos
    .local int rx1403_off
    .local int rx1403_eos
    .local int rx1403_rep
    .local pmc rx1403_cur
    .local pmc rx1403_debug
    (rx1403_cur, rx1403_pos, rx1403_tgt, $I10) = self."!cursor_start"()
    getattribute rx1403_debug, rx1403_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1403_cur
    .local pmc match
    .lex "$/", match
    length rx1403_eos, rx1403_tgt
    gt rx1403_pos, rx1403_eos, rx1403_done
    set rx1403_off, 0
    lt rx1403_pos, 2, rx1403_start
    sub rx1403_off, rx1403_pos, 1
    substr rx1403_tgt, rx1403_tgt, rx1403_off
  rx1403_start:
    eq $I10, 1, rx1403_restart
    if_null rx1403_debug, debug_1064
    rx1403_cur."!cursor_debug"("START", "assertion:sym<?{ }>")
  debug_1064:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1406_done
    goto rxscan1406_scan
  rxscan1406_loop:
    ($P10) = rx1403_cur."from"()
    inc $P10
    set rx1403_pos, $P10
    ge rx1403_pos, rx1403_eos, rxscan1406_done
  rxscan1406_scan:
    set_addr $I10, rxscan1406_loop
    rx1403_cur."!mark_push"(0, rx1403_pos, $I10)
  rxscan1406_done:
.annotate 'line', 593
  # rx subcapture "zw"
    set_addr $I10, rxcap_1411_fail
    rx1403_cur."!mark_push"(0, rx1403_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1403_pos, rx1403_eos, rx1403_fail
    sub $I10, rx1403_pos, rx1403_off
    substr $S10, rx1403_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1403_fail
    inc rx1403_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1403_cur."!cursor_pos"(rx1403_pos)
    .const 'Sub' $P1408 = "368_1297880739.64186" 
    capture_lex $P1408
    $P10 = rx1403_cur."before"($P1408)
    unless $P10, rx1403_fail
    set_addr $I10, rxcap_1411_fail
    ($I12, $I11) = rx1403_cur."!mark_peek"($I10)
    rx1403_cur."!cursor_pos"($I11)
    ($P10) = rx1403_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1403_pos, "")
    rx1403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1411_done
  rxcap_1411_fail:
    goto rx1403_fail
  rxcap_1411_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1403_cur."!cursor_pos"(rx1403_pos)
    $P10 = rx1403_cur."codeblock"()
    unless $P10, rx1403_fail
    rx1403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1403_pos = $P10."pos"()
.annotate 'line', 592
  # rx pass
    rx1403_cur."!cursor_pass"(rx1403_pos, "assertion:sym<?{ }>")
    if_null rx1403_debug, debug_1069
    rx1403_cur."!cursor_debug"("PASS", "assertion:sym<?{ }>", " at pos=", rx1403_pos)
  debug_1069:
    .return (rx1403_cur)
  rx1403_restart:
.annotate 'line', 575
    if_null rx1403_debug, debug_1070
    rx1403_cur."!cursor_debug"("NEXT", "assertion:sym<?{ }>")
  debug_1070:
  rx1403_fail:
    (rx1403_rep, rx1403_pos, $I10, $P10) = rx1403_cur."!mark_fail"(0)
    lt rx1403_pos, -1, rx1403_done
    eq rx1403_pos, -1, rx1403_fail
    jump $I10
  rx1403_done:
    rx1403_cur."!cursor_fail"()
    if_null rx1403_debug, debug_1071
    rx1403_cur."!cursor_debug"("FAIL", "assertion:sym<?{ }>")
  debug_1071:
    .return (rx1403_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("367_1297880739.64186") :method
.annotate 'line', 575
    new $P1405, "ResizablePMCArray"
    push $P1405, "!"
    push $P1405, "?"
    .return ($P1405)
.end


.namespace ["NQP";"Regex"]
.sub "_block1407"  :anon :subid("368_1297880739.64186") :method :outer("366_1297880739.64186")
.annotate 'line', 593
    .local string rx1409_tgt
    .local int rx1409_pos
    .local int rx1409_off
    .local int rx1409_eos
    .local int rx1409_rep
    .local pmc rx1409_cur
    .local pmc rx1409_debug
    (rx1409_cur, rx1409_pos, rx1409_tgt, $I10) = self."!cursor_start"()
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
    if_null rx1409_debug, debug_1065
    rx1409_cur."!cursor_debug"("START", "")
  debug_1065:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1410_done
    goto rxscan1410_scan
  rxscan1410_loop:
    ($P10) = rx1409_cur."from"()
    inc $P10
    set rx1409_pos, $P10
    ge rx1409_pos, rx1409_eos, rxscan1410_done
  rxscan1410_scan:
    set_addr $I10, rxscan1410_loop
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  rxscan1410_done:
  # rx literal  "{"
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 123, rx1409_fail
    add rx1409_pos, 1
  # rx pass
    rx1409_cur."!cursor_pass"(rx1409_pos, "")
    if_null rx1409_debug, debug_1066
    rx1409_cur."!cursor_debug"("PASS", "", " at pos=", rx1409_pos)
  debug_1066:
    .return (rx1409_cur)
  rx1409_restart:
    if_null rx1409_debug, debug_1067
    rx1409_cur."!cursor_debug"("NEXT", "")
  debug_1067:
  rx1409_fail:
    (rx1409_rep, rx1409_pos, $I10, $P10) = rx1409_cur."!mark_fail"(0)
    lt rx1409_pos, -1, rx1409_done
    eq rx1409_pos, -1, rx1409_fail
    jump $I10
  rx1409_done:
    rx1409_cur."!cursor_fail"()
    if_null rx1409_debug, debug_1068
    rx1409_cur."!cursor_debug"("FAIL", "")
  debug_1068:
    .return (rx1409_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("369_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .const 'Sub' $P1421 = "371_1297880739.64186" 
    capture_lex $P1421
    .local string rx1413_tgt
    .local int rx1413_pos
    .local int rx1413_off
    .local int rx1413_eos
    .local int rx1413_rep
    .local pmc rx1413_cur
    .local pmc rx1413_debug
    (rx1413_cur, rx1413_pos, rx1413_tgt, $I10) = self."!cursor_start"()
    rx1413_cur."!cursor_caparray"("assertion", "arglist", "nibbler")
    getattribute rx1413_debug, rx1413_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1413_cur
    .local pmc match
    .lex "$/", match
    length rx1413_eos, rx1413_tgt
    gt rx1413_pos, rx1413_eos, rx1413_done
    set rx1413_off, 0
    lt rx1413_pos, 2, rx1413_start
    sub rx1413_off, rx1413_pos, 1
    substr rx1413_tgt, rx1413_tgt, rx1413_off
  rx1413_start:
    eq $I10, 1, rx1413_restart
    if_null rx1413_debug, debug_1072
    rx1413_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_1072:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1417_done
    goto rxscan1417_scan
  rxscan1417_loop:
    ($P10) = rx1413_cur."from"()
    inc $P10
    set rx1413_pos, $P10
    ge rx1413_pos, rx1413_eos, rxscan1417_done
  rxscan1417_scan:
    set_addr $I10, rxscan1417_loop
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
  rxscan1417_done:
.annotate 'line', 597
  # rx subrule "identifier" subtype=capture negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."identifier"()
    unless $P10, rx1413_fail
    rx1413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1413_pos = $P10."pos"()
.annotate 'line', 604
  # rx rxquantr1418 ** 0..1
    set_addr $I10, rxquantr1418_done
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
  rxquantr1418_loop:
  alt1419_0:
.annotate 'line', 598
    set_addr $I10, alt1419_1
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
.annotate 'line', 599
  # rx subrule "before" subtype=zerowidth negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    .const 'Sub' $P1421 = "371_1297880739.64186" 
    capture_lex $P1421
    $P10 = rx1413_cur."before"($P1421)
    unless $P10, rx1413_fail
    goto alt1419_end
  alt1419_1:
    set_addr $I10, alt1419_2
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
.annotate 'line', 600
  # rx literal  "="
    add $I11, rx1413_pos, 1
    gt $I11, rx1413_eos, rx1413_fail
    sub $I11, rx1413_pos, rx1413_off
    ord $I11, rx1413_tgt, $I11
    ne $I11, 61, rx1413_fail
    add rx1413_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."assertion"()
    unless $P10, rx1413_fail
    rx1413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1413_pos = $P10."pos"()
    goto alt1419_end
  alt1419_2:
    set_addr $I10, alt1419_3
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
.annotate 'line', 601
  # rx literal  ":"
    add $I11, rx1413_pos, 1
    gt $I11, rx1413_eos, rx1413_fail
    sub $I11, rx1413_pos, rx1413_off
    ord $I11, rx1413_tgt, $I11
    ne $I11, 58, rx1413_fail
    add rx1413_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."arglist"()
    unless $P10, rx1413_fail
    rx1413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1413_pos = $P10."pos"()
    goto alt1419_end
  alt1419_3:
    set_addr $I10, alt1419_4
    rx1413_cur."!mark_push"(0, rx1413_pos, $I10)
.annotate 'line', 602
  # rx literal  "("
    add $I11, rx1413_pos, 1
    gt $I11, rx1413_eos, rx1413_fail
    sub $I11, rx1413_pos, rx1413_off
    ord $I11, rx1413_tgt, $I11
    ne $I11, 40, rx1413_fail
    add rx1413_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1413_fail
    rx1413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1413_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1413_pos, 1
    gt $I11, rx1413_eos, rx1413_fail
    sub $I11, rx1413_pos, rx1413_off
    ord $I11, rx1413_tgt, $I11
    ne $I11, 41, rx1413_fail
    add rx1413_pos, 1
    goto alt1419_end
  alt1419_4:
.annotate 'line', 603
  # rx subrule "normspace" subtype=method negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."normspace"()
    unless $P10, rx1413_fail
    rx1413_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1413_cur."!cursor_pos"(rx1413_pos)
    $P10 = rx1413_cur."nibbler"()
    unless $P10, rx1413_fail
    rx1413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1413_pos = $P10."pos"()
  alt1419_end:
.annotate 'line', 604
    set_addr $I10, rxquantr1418_done
    (rx1413_rep) = rx1413_cur."!mark_commit"($I10)
  rxquantr1418_done:
.annotate 'line', 596
  # rx pass
    rx1413_cur."!cursor_pass"(rx1413_pos, "assertion:sym<name>")
    if_null rx1413_debug, debug_1077
    rx1413_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx1413_pos)
  debug_1077:
    .return (rx1413_cur)
  rx1413_restart:
.annotate 'line', 575
    if_null rx1413_debug, debug_1078
    rx1413_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_1078:
  rx1413_fail:
    (rx1413_rep, rx1413_pos, $I10, $P10) = rx1413_cur."!mark_fail"(0)
    lt rx1413_pos, -1, rx1413_done
    eq rx1413_pos, -1, rx1413_fail
    jump $I10
  rx1413_done:
    rx1413_cur."!cursor_fail"()
    if_null rx1413_debug, debug_1079
    rx1413_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_1079:
    .return (rx1413_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("370_1297880739.64186") :method
.annotate 'line', 575
    $P1415 = self."!PREFIX__!subrule"("identifier", "")
    new $P1416, "ResizablePMCArray"
    push $P1416, $P1415
    .return ($P1416)
.end


.namespace ["NQP";"Regex"]
.sub "_block1420"  :anon :subid("371_1297880739.64186") :method :outer("369_1297880739.64186")
.annotate 'line', 599
    .local string rx1422_tgt
    .local int rx1422_pos
    .local int rx1422_off
    .local int rx1422_eos
    .local int rx1422_rep
    .local pmc rx1422_cur
    .local pmc rx1422_debug
    (rx1422_cur, rx1422_pos, rx1422_tgt, $I10) = self."!cursor_start"()
    getattribute rx1422_debug, rx1422_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1422_cur
    .local pmc match
    .lex "$/", match
    length rx1422_eos, rx1422_tgt
    gt rx1422_pos, rx1422_eos, rx1422_done
    set rx1422_off, 0
    lt rx1422_pos, 2, rx1422_start
    sub rx1422_off, rx1422_pos, 1
    substr rx1422_tgt, rx1422_tgt, rx1422_off
  rx1422_start:
    eq $I10, 1, rx1422_restart
    if_null rx1422_debug, debug_1073
    rx1422_cur."!cursor_debug"("START", "")
  debug_1073:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1423_done
    goto rxscan1423_scan
  rxscan1423_loop:
    ($P10) = rx1422_cur."from"()
    inc $P10
    set rx1422_pos, $P10
    ge rx1422_pos, rx1422_eos, rxscan1423_done
  rxscan1423_scan:
    set_addr $I10, rxscan1423_loop
    rx1422_cur."!mark_push"(0, rx1422_pos, $I10)
  rxscan1423_done:
  # rx literal  ">"
    add $I11, rx1422_pos, 1
    gt $I11, rx1422_eos, rx1422_fail
    sub $I11, rx1422_pos, rx1422_off
    ord $I11, rx1422_tgt, $I11
    ne $I11, 62, rx1422_fail
    add rx1422_pos, 1
  # rx pass
    rx1422_cur."!cursor_pass"(rx1422_pos, "")
    if_null rx1422_debug, debug_1074
    rx1422_cur."!cursor_debug"("PASS", "", " at pos=", rx1422_pos)
  debug_1074:
    .return (rx1422_cur)
  rx1422_restart:
    if_null rx1422_debug, debug_1075
    rx1422_cur."!cursor_debug"("NEXT", "")
  debug_1075:
  rx1422_fail:
    (rx1422_rep, rx1422_pos, $I10, $P10) = rx1422_cur."!mark_fail"(0)
    lt rx1422_pos, -1, rx1422_done
    eq rx1422_pos, -1, rx1422_fail
    jump $I10
  rx1422_done:
    rx1422_cur."!cursor_fail"()
    if_null rx1422_debug, debug_1076
    rx1422_cur."!cursor_debug"("FAIL", "")
  debug_1076:
    .return (rx1422_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("372_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .local string rx1425_tgt
    .local int rx1425_pos
    .local int rx1425_off
    .local int rx1425_eos
    .local int rx1425_rep
    .local pmc rx1425_cur
    .local pmc rx1425_debug
    (rx1425_cur, rx1425_pos, rx1425_tgt, $I10) = self."!cursor_start"()
    getattribute rx1425_debug, rx1425_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1425_cur
    .local pmc match
    .lex "$/", match
    length rx1425_eos, rx1425_tgt
    gt rx1425_pos, rx1425_eos, rx1425_done
    set rx1425_off, 0
    lt rx1425_pos, 2, rx1425_start
    sub rx1425_off, rx1425_pos, 1
    substr rx1425_tgt, rx1425_tgt, rx1425_off
  rx1425_start:
    eq $I10, 1, rx1425_restart
    if_null rx1425_debug, debug_1080
    rx1425_cur."!cursor_debug"("START", "assertion:sym<var>")
  debug_1080:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1428_done
    goto rxscan1428_scan
  rxscan1428_loop:
    ($P10) = rx1425_cur."from"()
    inc $P10
    set rx1425_pos, $P10
    ge rx1425_pos, rx1425_eos, rxscan1428_done
  rxscan1428_scan:
    set_addr $I10, rxscan1428_loop
    rx1425_cur."!mark_push"(0, rx1425_pos, $I10)
  rxscan1428_done:
.annotate 'line', 608
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1425_pos, rx1425_off
    substr $S10, rx1425_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1425_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1425_cur."!cursor_pos"(rx1425_pos)
    $P10 = rx1425_cur."LANG"("MAIN", "variable")
    unless $P10, rx1425_fail
    rx1425_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1425_pos = $P10."pos"()
.annotate 'line', 607
  # rx pass
    rx1425_cur."!cursor_pass"(rx1425_pos, "assertion:sym<var>")
    if_null rx1425_debug, debug_1081
    rx1425_cur."!cursor_debug"("PASS", "assertion:sym<var>", " at pos=", rx1425_pos)
  debug_1081:
    .return (rx1425_cur)
  rx1425_restart:
.annotate 'line', 575
    if_null rx1425_debug, debug_1082
    rx1425_cur."!cursor_debug"("NEXT", "assertion:sym<var>")
  debug_1082:
  rx1425_fail:
    (rx1425_rep, rx1425_pos, $I10, $P10) = rx1425_cur."!mark_fail"(0)
    lt rx1425_pos, -1, rx1425_done
    eq rx1425_pos, -1, rx1425_fail
    jump $I10
  rx1425_done:
    rx1425_cur."!cursor_fail"()
    if_null rx1425_debug, debug_1083
    rx1425_cur."!cursor_debug"("FAIL", "assertion:sym<var>")
  debug_1083:
    .return (rx1425_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("373_1297880739.64186") :method
.annotate 'line', 575
    new $P1427, "ResizablePMCArray"
    push $P1427, "$"
    push $P1427, "@"
    .return ($P1427)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("374_1297880739.64186") :method :outer("355_1297880739.64186")
.annotate 'line', 575
    .local string rx1430_tgt
    .local int rx1430_pos
    .local int rx1430_off
    .local int rx1430_eos
    .local int rx1430_rep
    .local pmc rx1430_cur
    .local pmc rx1430_debug
    (rx1430_cur, rx1430_pos, rx1430_tgt, $I10) = self."!cursor_start"()
    getattribute rx1430_debug, rx1430_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1430_cur
    .local pmc match
    .lex "$/", match
    length rx1430_eos, rx1430_tgt
    gt rx1430_pos, rx1430_eos, rx1430_done
    set rx1430_off, 0
    lt rx1430_pos, 2, rx1430_start
    sub rx1430_off, rx1430_pos, 1
    substr rx1430_tgt, rx1430_tgt, rx1430_off
  rx1430_start:
    eq $I10, 1, rx1430_restart
    if_null rx1430_debug, debug_1084
    rx1430_cur."!cursor_debug"("START", "codeblock")
  debug_1084:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1434_done
    goto rxscan1434_scan
  rxscan1434_loop:
    ($P10) = rx1430_cur."from"()
    inc $P10
    set rx1430_pos, $P10
    ge rx1430_pos, rx1430_eos, rxscan1434_done
  rxscan1434_scan:
    set_addr $I10, rxscan1434_loop
    rx1430_cur."!mark_push"(0, rx1430_pos, $I10)
  rxscan1434_done:
.annotate 'line', 612
  # rx subrule "LANG" subtype=capture negate=
    rx1430_cur."!cursor_pos"(rx1430_pos)
    $P10 = rx1430_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1430_fail
    rx1430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1430_pos = $P10."pos"()
.annotate 'line', 611
  # rx pass
    rx1430_cur."!cursor_pass"(rx1430_pos, "codeblock")
    if_null rx1430_debug, debug_1085
    rx1430_cur."!cursor_debug"("PASS", "codeblock", " at pos=", rx1430_pos)
  debug_1085:
    .return (rx1430_cur)
  rx1430_restart:
.annotate 'line', 575
    if_null rx1430_debug, debug_1086
    rx1430_cur."!cursor_debug"("NEXT", "codeblock")
  debug_1086:
  rx1430_fail:
    (rx1430_rep, rx1430_pos, $I10, $P10) = rx1430_cur."!mark_fail"(0)
    lt rx1430_pos, -1, rx1430_done
    eq rx1430_pos, -1, rx1430_fail
    jump $I10
  rx1430_done:
    rx1430_cur."!cursor_fail"()
    if_null rx1430_debug, debug_1087
    rx1430_cur."!cursor_debug"("FAIL", "codeblock")
  debug_1087:
    .return (rx1430_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("375_1297880739.64186") :method
.annotate 'line', 575
    $P1432 = self."!PREFIX__!subrule"("LANG", "")
    new $P1433, "ResizablePMCArray"
    push $P1433, $P1432
    .return ($P1433)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1436" :load :anon :subid("376_1297880739.64186")
.annotate 'line', 4
    .const 'Sub' $P1438 = "11_1297880739.64186" 
    $P1439 = $P1438()
    .return ($P1439)
.end


.namespace []
.sub "_block1457" :load :anon :subid("377_1297880739.64186")
.annotate 'line', 1
    .const 'Sub' $P1459 = "10_1297880739.64186" 
    $P1460 = $P1459()
    .return ($P1460)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1297880748.74619")
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
    $P2568 = $P14()
.annotate 'line', 1
    .return ($P2568)
    .const 'Sub' $P2570 = "149_1297880748.74619" 
    .return ($P2570)
.end


.namespace []
.sub "" :load :init :subid("post150") :outer("10_1297880748.74619")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880748.74619" 
    .local pmc block
    set block, $P12
    $P2573 = get_root_global ["parrot"], "P6metaclass"
    $P2573."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1297880748.74619") :outer("10_1297880748.74619")
.annotate 'line', 3
    .const 'Sub' $P2564 = "148_1297880748.74619" 
    capture_lex $P2564
    get_hll_global $P2447, ["NQP";"RegexActions"], "_block2446" 
    capture_lex $P2447
    .const 'Sub' $P2436 = "138_1297880748.74619" 
    capture_lex $P2436
    .const 'Sub' $P2429 = "137_1297880748.74619" 
    capture_lex $P2429
    .const 'Sub' $P2422 = "136_1297880748.74619" 
    capture_lex $P2422
    .const 'Sub' $P2415 = "135_1297880748.74619" 
    capture_lex $P2415
    .const 'Sub' $P2402 = "134_1297880748.74619" 
    capture_lex $P2402
    .const 'Sub' $P2392 = "133_1297880748.74619" 
    capture_lex $P2392
    .const 'Sub' $P2382 = "132_1297880748.74619" 
    capture_lex $P2382
    .const 'Sub' $P2372 = "131_1297880748.74619" 
    capture_lex $P2372
    .const 'Sub' $P2365 = "130_1297880748.74619" 
    capture_lex $P2365
    .const 'Sub' $P2351 = "129_1297880748.74619" 
    capture_lex $P2351
    .const 'Sub' $P2341 = "128_1297880748.74619" 
    capture_lex $P2341
    .const 'Sub' $P2304 = "127_1297880748.74619" 
    capture_lex $P2304
    .const 'Sub' $P2290 = "126_1297880748.74619" 
    capture_lex $P2290
    .const 'Sub' $P2280 = "125_1297880748.74619" 
    capture_lex $P2280
    .const 'Sub' $P2270 = "124_1297880748.74619" 
    capture_lex $P2270
    .const 'Sub' $P2260 = "123_1297880748.74619" 
    capture_lex $P2260
    .const 'Sub' $P2250 = "122_1297880748.74619" 
    capture_lex $P2250
    .const 'Sub' $P2240 = "121_1297880748.74619" 
    capture_lex $P2240
    .const 'Sub' $P2212 = "120_1297880748.74619" 
    capture_lex $P2212
    .const 'Sub' $P2195 = "119_1297880748.74619" 
    capture_lex $P2195
    .const 'Sub' $P2185 = "118_1297880748.74619" 
    capture_lex $P2185
    .const 'Sub' $P2172 = "117_1297880748.74619" 
    capture_lex $P2172
    .const 'Sub' $P2159 = "116_1297880748.74619" 
    capture_lex $P2159
    .const 'Sub' $P2146 = "115_1297880748.74619" 
    capture_lex $P2146
    .const 'Sub' $P2136 = "114_1297880748.74619" 
    capture_lex $P2136
    .const 'Sub' $P2107 = "113_1297880748.74619" 
    capture_lex $P2107
    .const 'Sub' $P2083 = "112_1297880748.74619" 
    capture_lex $P2083
    .const 'Sub' $P2073 = "111_1297880748.74619" 
    capture_lex $P2073
    .const 'Sub' $P2063 = "110_1297880748.74619" 
    capture_lex $P2063
    .const 'Sub' $P2036 = "109_1297880748.74619" 
    capture_lex $P2036
    .const 'Sub' $P2018 = "108_1297880748.74619" 
    capture_lex $P2018
    .const 'Sub' $P2008 = "107_1297880748.74619" 
    capture_lex $P2008
    .const 'Sub' $P1904 = "104_1297880748.74619" 
    capture_lex $P1904
    .const 'Sub' $P1894 = "103_1297880748.74619" 
    capture_lex $P1894
    .const 'Sub' $P1865 = "102_1297880748.74619" 
    capture_lex $P1865
    .const 'Sub' $P1823 = "101_1297880748.74619" 
    capture_lex $P1823
    .const 'Sub' $P1807 = "100_1297880748.74619" 
    capture_lex $P1807
    .const 'Sub' $P1798 = "99_1297880748.74619" 
    capture_lex $P1798
    .const 'Sub' $P1766 = "98_1297880748.74619" 
    capture_lex $P1766
    .const 'Sub' $P1667 = "95_1297880748.74619" 
    capture_lex $P1667
    .const 'Sub' $P1625 = "93_1297880748.74619" 
    capture_lex $P1625
    .const 'Sub' $P1615 = "92_1297880748.74619" 
    capture_lex $P1615
    .const 'Sub' $P1598 = "91_1297880748.74619" 
    capture_lex $P1598
    .const 'Sub' $P1578 = "90_1297880748.74619" 
    capture_lex $P1578
    .const 'Sub' $P1466 = "87_1297880748.74619" 
    capture_lex $P1466
    .const 'Sub' $P1397 = "83_1297880748.74619" 
    capture_lex $P1397
    .const 'Sub' $P1332 = "80_1297880748.74619" 
    capture_lex $P1332
    .const 'Sub' $P1260 = "77_1297880748.74619" 
    capture_lex $P1260
    .const 'Sub' $P1250 = "76_1297880748.74619" 
    capture_lex $P1250
    .const 'Sub' $P1240 = "75_1297880748.74619" 
    capture_lex $P1240
    .const 'Sub' $P1169 = "73_1297880748.74619" 
    capture_lex $P1169
    .const 'Sub' $P1159 = "72_1297880748.74619" 
    capture_lex $P1159
    .const 'Sub' $P1142 = "71_1297880748.74619" 
    capture_lex $P1142
    .const 'Sub' $P1125 = "70_1297880748.74619" 
    capture_lex $P1125
    .const 'Sub' $P1108 = "69_1297880748.74619" 
    capture_lex $P1108
    .const 'Sub' $P1098 = "68_1297880748.74619" 
    capture_lex $P1098
    .const 'Sub' $P1088 = "67_1297880748.74619" 
    capture_lex $P1088
    .const 'Sub' $P1078 = "66_1297880748.74619" 
    capture_lex $P1078
    .const 'Sub' $P1054 = "65_1297880748.74619" 
    capture_lex $P1054
    .const 'Sub' $P1001 = "64_1297880748.74619" 
    capture_lex $P1001
    .const 'Sub' $P991 = "63_1297880748.74619" 
    capture_lex $P991
    .const 'Sub' $P902 = "61_1297880748.74619" 
    capture_lex $P902
    .const 'Sub' $P876 = "60_1297880748.74619" 
    capture_lex $P876
    .const 'Sub' $P860 = "59_1297880748.74619" 
    capture_lex $P860
    .const 'Sub' $P850 = "58_1297880748.74619" 
    capture_lex $P850
    .const 'Sub' $P840 = "57_1297880748.74619" 
    capture_lex $P840
    .const 'Sub' $P830 = "56_1297880748.74619" 
    capture_lex $P830
    .const 'Sub' $P820 = "55_1297880748.74619" 
    capture_lex $P820
    .const 'Sub' $P810 = "54_1297880748.74619" 
    capture_lex $P810
    .const 'Sub' $P800 = "53_1297880748.74619" 
    capture_lex $P800
    .const 'Sub' $P790 = "52_1297880748.74619" 
    capture_lex $P790
    .const 'Sub' $P780 = "51_1297880748.74619" 
    capture_lex $P780
    .const 'Sub' $P770 = "50_1297880748.74619" 
    capture_lex $P770
    .const 'Sub' $P760 = "49_1297880748.74619" 
    capture_lex $P760
    .const 'Sub' $P750 = "48_1297880748.74619" 
    capture_lex $P750
    .const 'Sub' $P740 = "47_1297880748.74619" 
    capture_lex $P740
    .const 'Sub' $P730 = "46_1297880748.74619" 
    capture_lex $P730
    .const 'Sub' $P720 = "45_1297880748.74619" 
    capture_lex $P720
    .const 'Sub' $P702 = "44_1297880748.74619" 
    capture_lex $P702
    .const 'Sub' $P667 = "43_1297880748.74619" 
    capture_lex $P667
    .const 'Sub' $P651 = "42_1297880748.74619" 
    capture_lex $P651
    .const 'Sub' $P630 = "41_1297880748.74619" 
    capture_lex $P630
    .const 'Sub' $P610 = "40_1297880748.74619" 
    capture_lex $P610
    .const 'Sub' $P597 = "39_1297880748.74619" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1297880748.74619" 
    capture_lex $P571
    .const 'Sub' $P535 = "37_1297880748.74619" 
    capture_lex $P535
    .const 'Sub' $P518 = "36_1297880748.74619" 
    capture_lex $P518
    .const 'Sub' $P504 = "35_1297880748.74619" 
    capture_lex $P504
    .const 'Sub' $P451 = "33_1297880748.74619" 
    capture_lex $P451
    .const 'Sub' $P440 = "32_1297880748.74619" 
    capture_lex $P440
    .const 'Sub' $P427 = "31_1297880748.74619" 
    capture_lex $P427
    .const 'Sub' $P407 = "30_1297880748.74619" 
    capture_lex $P407
    .const 'Sub' $P397 = "29_1297880748.74619" 
    capture_lex $P397
    .const 'Sub' $P387 = "28_1297880748.74619" 
    capture_lex $P387
    .const 'Sub' $P371 = "27_1297880748.74619" 
    capture_lex $P371
    .const 'Sub' $P288 = "25_1297880748.74619" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1297880748.74619" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1297880748.74619" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1297880748.74619" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1297880748.74619" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1297880748.74619" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1297880748.74619" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1297880748.74619" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1297880748.74619" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1297880748.74619" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1297880748.74619" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_153
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_153:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1297880748.74619" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1297880748.74619" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1297880748.74619" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1297880748.74619" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 223
    .const 'Sub' $P100 = "18_1297880748.74619" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 862
    .const 'Sub' $P151 = "19_1297880748.74619" 
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
.annotate 'line', 853
    find_lex $P2414, "control"
.annotate 'line', 880
    get_hll_global $P2447, ["NQP";"RegexActions"], "_block2446" 
    capture_lex $P2447
    $P2558 = $P2447()
.annotate 'line', 3
    .return ($P2558)
    .const 'Sub' $P2560 = "147_1297880748.74619" 
    .return ($P2560)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post151") :outer("11_1297880748.74619")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2564 = "148_1297880748.74619" 
    capture_lex $P2564
    $P2564()
    $P2567 = get_root_global ["parrot"], "P6metaclass"
    $P2567."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2563"  :anon :subid("148_1297880748.74619") :outer("11_1297880748.74619")
.annotate 'line', 6
    get_global $P2565, "@BLOCK"
    unless_null $P2565, vivify_152
    $P2565 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2565
  vivify_152:
 $P2566 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2566
.annotate 'line', 5
    .return ($P2566)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_19
.annotate 'line', 9
    new $P18, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P18, control_17
    push_eh $P18
    .lex "$xblock", param_19
.annotate 'line', 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_154
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_154:
    set $P21, $P20[1]
    unless_null $P21, vivify_155
    new $P21, "Undef"
  vivify_155:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_156
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_156:
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
.sub "block_immediate"  :subid("13_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1297880748.74619" 
    capture_lex $P40
    new $P29, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P29, control_28
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
    .const 'Sub' $P40 = "14_1297880748.74619" 
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
.sub "_block39"  :anon :subid("14_1297880748.74619") :outer("13_1297880748.74619")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1297880748.74619" 
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
    unless $I48, for_undef_157
    iter $P45, $P47
    new $P57, 'ExceptionHandler'
    set_addr $P57, loop56_handler
    $P57."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1297880748.74619" 
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
  for_undef_157:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1297880748.74619") :outer("14_1297880748.74619")
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
.sub "vivitype"  :subid("16_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_66
.annotate 'line', 24
    new $P65, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P65, control_64
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
.sub "colonpair_str"  :subid("17_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_87
.annotate 'line', 43
    new $P86, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P86, control_85
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
.sub "push_block_handler"  :subid("18_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 223
    new $P102, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P102, control_101
    push_eh $P102
    .lex "$/", param_103
    .lex "$block", param_104
.annotate 'line', 224
    get_global $P106, "@BLOCK"
    unless_null $P106, vivify_158
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_158:
    set $P107, $P106[0]
    unless_null $P107, vivify_159
    new $P107, "Undef"
  vivify_159:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 225
    get_global $P109, "@BLOCK"
    unless_null $P109, vivify_160
    $P109 = root_new ['parrot';'ResizablePMCArray']
  vivify_160:
    set $P110, $P109[0]
    unless_null $P110, vivify_161
    new $P110, "Undef"
  vivify_161:
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
    unless_null $P129, vivify_162
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P130, $P129[0]
    unless_null $P130, vivify_163
    new $P130, "Undef"
  vivify_163:
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
.sub "control"  :subid("19_1297880748.74619") :outer("11_1297880748.74619")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 862
    new $P153, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P153, control_152
    push_eh $P153
    .lex "$/", param_154
    .lex "$type", param_155
.annotate 'line', 863
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 867
    get_hll_global $P159, ["PAST"], "Val"
    find_lex $P160, "$type"
    $P161 = $P159."new"($P160 :named("value"), "!except_types" :named("returns"))
    $P162 = $P157."new"(0, $P161, $P158 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 863
    $P163 = $P156."!make"($P162)
.annotate 'line', 862
    .return ($P163)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_173
.annotate 'line', 33
    new $P172, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P172, control_171
    push_eh $P172
    .lex "self", self
    .lex "$/", param_173
    find_lex $P174, "$/"
    find_lex $P175, "$/"
    unless_null $P175, vivify_164
    $P175 = root_new ['parrot';'Hash']
  vivify_164:
    set $P176, $P175["comp_unit"]
    unless_null $P176, vivify_165
    new $P176, "Undef"
  vivify_165:
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
.sub "deflongname"  :subid("21_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_183
.annotate 'line', 35
    new $P182, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P182, control_181
    push_eh $P182
    .lex "self", self
    .lex "$/", param_183
.annotate 'line', 36
    find_lex $P184, "$/"
.annotate 'line', 37
    find_lex $P187, "$/"
    unless_null $P187, vivify_166
    $P187 = root_new ['parrot';'Hash']
  vivify_166:
    set $P188, $P187["colonpair"]
    unless_null $P188, vivify_167
    new $P188, "Undef"
  vivify_167:
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
    unless_null $P189, vivify_168
    $P189 = root_new ['parrot';'Hash']
  vivify_168:
    set $P190, $P189["identifier"]
    unless_null $P190, vivify_169
    new $P190, "Undef"
  vivify_169:
    set $S191, $P190
    new $P192, 'String'
    set $P192, $S191
    concat $P193, $P192, ":"
    find_lex $P194, "$/"
    unless_null $P194, vivify_170
    $P194 = root_new ['parrot';'Hash']
  vivify_170:
    set $P195, $P194["colonpair"]
    unless_null $P195, vivify_171
    $P195 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P196, $P195[0]
    unless_null $P196, vivify_172
    new $P196, "Undef"
  vivify_172:
    $P197 = $P196."ast"()
    $S198 = $P197."named"()
    concat $P199, $P193, $S198
    concat $P200, $P199, "<"
.annotate 'line', 38
    find_lex $P201, "$/"
    unless_null $P201, vivify_173
    $P201 = root_new ['parrot';'Hash']
  vivify_173:
    set $P202, $P201["colonpair"]
    unless_null $P202, vivify_174
    $P202 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P203, $P202[0]
    unless_null $P203, vivify_175
    new $P203, "Undef"
  vivify_175:
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
.sub "comp_unit"  :subid("22_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_216
.annotate 'line', 49
    new $P215, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P215, control_214
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
    unless_null $P219, vivify_176
    $P219 = root_new ['parrot';'Hash']
  vivify_176:
    set $P220, $P219["statementlist"]
    unless_null $P220, vivify_177
    new $P220, "Undef"
  vivify_177:
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
.sub "statementlist"  :subid("23_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1297880748.74619" 
    capture_lex $P262
    new $P247, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P247, control_246
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
    unless_null $P254, vivify_178
    $P254 = root_new ['parrot';'Hash']
  vivify_178:
    set $P255, $P254["statement"]
    unless_null $P255, vivify_179
    new $P255, "Undef"
  vivify_179:
    unless $P255, if_253_end
.annotate 'line', 79
    find_lex $P257, "$/"
    unless_null $P257, vivify_180
    $P257 = root_new ['parrot';'Hash']
  vivify_180:
    set $P258, $P257["statement"]
    unless_null $P258, vivify_181
    new $P258, "Undef"
  vivify_181:
    defined $I259, $P258
    unless $I259, for_undef_182
    iter $P256, $P258
    new $P282, 'ExceptionHandler'
    set_addr $P282, loop281_handler
    $P282."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P282
  loop281_test:
    unless $P256, loop281_done
    shift $P260, $P256
  loop281_redo:
    .const 'Sub' $P262 = "24_1297880748.74619" 
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
  for_undef_182:
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
.sub "_block261"  :anon :subid("24_1297880748.74619") :outer("23_1297880748.74619")
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
    unless_null $P268, vivify_183
    $P268 = root_new ['parrot';'Hash']
  vivify_183:
    set $P269, $P268["sink"]
    unless_null $P269, vivify_184
    new $P269, "Undef"
  vivify_184:
    defined $I270, $P269
    unless $I270, if_267_end
    find_lex $P271, "$ast"
    unless_null $P271, vivify_185
    $P271 = root_new ['parrot';'Hash']
  vivify_185:
    set $P272, $P271["sink"]
    unless_null $P272, vivify_186
    new $P272, "Undef"
  vivify_186:
    store_lex "$ast", $P272
  if_267_end:
.annotate 'line', 82
    find_lex $P274, "$ast"
    unless_null $P274, vivify_187
    $P274 = root_new ['parrot';'Hash']
  vivify_187:
    set $P275, $P274["bareblock"]
    unless_null $P275, vivify_188
    new $P275, "Undef"
  vivify_188:
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
.sub "statement"  :subid("25_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1297880748.74619" 
    capture_lex $P300
    new $P290, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P290, control_289
    push_eh $P290
    .lex "self", self
    .lex "$/", param_291
    if has_param_292, optparam_189
    new $P293, "Undef"
    set param_292, $P293
  optparam_189:
    .lex "$key", param_292
.annotate 'line', 90
    new $P294, "Undef"
    .lex "$past", $P294
.annotate 'line', 89
    find_lex $P295, "$past"
.annotate 'line', 91
    find_lex $P297, "$/"
    unless_null $P297, vivify_190
    $P297 = root_new ['parrot';'Hash']
  vivify_190:
    set $P298, $P297["EXPR"]
    unless_null $P298, vivify_191
    new $P298, "Undef"
  vivify_191:
    if $P298, if_296
.annotate 'line', 112
    find_lex $P361, "$/"
    unless_null $P361, vivify_192
    $P361 = root_new ['parrot';'Hash']
  vivify_192:
    set $P362, $P361["statement_control"]
    unless_null $P362, vivify_193
    new $P362, "Undef"
  vivify_193:
    if $P362, if_360
.annotate 'line', 113
    new $P366, "Integer"
    assign $P366, 0
    store_lex "$past", $P366
    goto if_360_end
  if_360:
.annotate 'line', 112
    find_lex $P363, "$/"
    unless_null $P363, vivify_194
    $P363 = root_new ['parrot';'Hash']
  vivify_194:
    set $P364, $P363["statement_control"]
    unless_null $P364, vivify_195
    new $P364, "Undef"
  vivify_195:
    $P365 = $P364."ast"()
    store_lex "$past", $P365
  if_360_end:
    goto if_296_end
  if_296:
.annotate 'line', 91
    .const 'Sub' $P300 = "26_1297880748.74619" 
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
.sub "_block299"  :anon :subid("26_1297880748.74619") :outer("25_1297880748.74619")
.annotate 'line', 92
    new $P301, "Undef"
    .lex "$mc", $P301
.annotate 'line', 93
    new $P302, "Undef"
    .lex "$ml", $P302
.annotate 'line', 92
    find_lex $P303, "$/"
    unless_null $P303, vivify_196
    $P303 = root_new ['parrot';'Hash']
  vivify_196:
    set $P304, $P303["statement_mod_cond"]
    unless_null $P304, vivify_197
    $P304 = root_new ['parrot';'ResizablePMCArray']
  vivify_197:
    set $P305, $P304[0]
    unless_null $P305, vivify_198
    new $P305, "Undef"
  vivify_198:
    store_lex "$mc", $P305
.annotate 'line', 93
    find_lex $P306, "$/"
    unless_null $P306, vivify_199
    $P306 = root_new ['parrot';'Hash']
  vivify_199:
    set $P307, $P306["statement_mod_loop"]
    unless_null $P307, vivify_200
    $P307 = root_new ['parrot';'ResizablePMCArray']
  vivify_200:
    set $P308, $P307[0]
    unless_null $P308, vivify_201
    new $P308, "Undef"
  vivify_201:
    store_lex "$ml", $P308
.annotate 'line', 94
    find_lex $P309, "$/"
    unless_null $P309, vivify_202
    $P309 = root_new ['parrot';'Hash']
  vivify_202:
    set $P310, $P309["EXPR"]
    unless_null $P310, vivify_203
    new $P310, "Undef"
  vivify_203:
    $P311 = $P310."ast"()
    store_lex "$past", $P311
.annotate 'line', 95
    find_lex $P313, "$mc"
    unless $P313, if_312_end
.annotate 'line', 96
    get_hll_global $P314, ["PAST"], "Op"
    find_lex $P315, "$mc"
    unless_null $P315, vivify_204
    $P315 = root_new ['parrot';'Hash']
  vivify_204:
    set $P316, $P315["cond"]
    unless_null $P316, vivify_205
    new $P316, "Undef"
  vivify_205:
    $P317 = $P316."ast"()
    find_lex $P318, "$past"
    find_lex $P319, "$mc"
    unless_null $P319, vivify_206
    $P319 = root_new ['parrot';'Hash']
  vivify_206:
    set $P320, $P319["sym"]
    unless_null $P320, vivify_207
    new $P320, "Undef"
  vivify_207:
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
    unless_null $P329, vivify_208
    $P329 = root_new ['parrot';'Hash']
  vivify_208:
    set $P330, $P329["sym"]
    unless_null $P330, vivify_209
    new $P330, "Undef"
  vivify_209:
    set $S331, $P330
    iseq $I332, $S331, "for"
    if $I332, if_328
.annotate 'line', 108
    get_hll_global $P350, ["PAST"], "Op"
    find_lex $P351, "$ml"
    unless_null $P351, vivify_210
    $P351 = root_new ['parrot';'Hash']
  vivify_210:
    set $P352, $P351["cond"]
    unless_null $P352, vivify_211
    new $P352, "Undef"
  vivify_211:
    $P353 = $P352."ast"()
    find_lex $P354, "$past"
    find_lex $P355, "$ml"
    unless_null $P355, vivify_212
    $P355 = root_new ['parrot';'Hash']
  vivify_212:
    set $P356, $P355["sym"]
    unless_null $P356, vivify_213
    new $P356, "Undef"
  vivify_213:
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
    unless_null $P341, vivify_214
    $P341 = root_new ['parrot';'Hash']
  vivify_214:
    set $P342, $P341["cond"]
    unless_null $P342, vivify_215
    new $P342, "Undef"
  vivify_215:
    $P343 = $P342."ast"()
    find_lex $P344, "$past"
    find_lex $P345, "$ml"
    unless_null $P345, vivify_216
    $P345 = root_new ['parrot';'Hash']
  vivify_216:
    set $P346, $P345["sym"]
    unless_null $P346, vivify_217
    new $P346, "Undef"
  vivify_217:
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
.sub "xblock"  :subid("27_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_374
.annotate 'line', 117
    new $P373, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P373, control_372
    push_eh $P373
    .lex "self", self
    .lex "$/", param_374
.annotate 'line', 118
    find_lex $P375, "$/"
    get_hll_global $P376, ["PAST"], "Op"
    find_lex $P377, "$/"
    unless_null $P377, vivify_218
    $P377 = root_new ['parrot';'Hash']
  vivify_218:
    set $P378, $P377["EXPR"]
    unless_null $P378, vivify_219
    new $P378, "Undef"
  vivify_219:
    $P379 = $P378."ast"()
    find_lex $P380, "$/"
    unless_null $P380, vivify_220
    $P380 = root_new ['parrot';'Hash']
  vivify_220:
    set $P381, $P380["pblock"]
    unless_null $P381, vivify_221
    new $P381, "Undef"
  vivify_221:
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
.sub "pblock"  :subid("28_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_390
.annotate 'line', 121
    new $P389, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P389, control_388
    push_eh $P389
    .lex "self", self
    .lex "$/", param_390
.annotate 'line', 122
    find_lex $P391, "$/"
    find_lex $P392, "$/"
    unless_null $P392, vivify_222
    $P392 = root_new ['parrot';'Hash']
  vivify_222:
    set $P393, $P392["blockoid"]
    unless_null $P393, vivify_223
    new $P393, "Undef"
  vivify_223:
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
.sub "block"  :subid("29_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_400
.annotate 'line', 125
    new $P399, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P399, control_398
    push_eh $P399
    .lex "self", self
    .lex "$/", param_400
.annotate 'line', 126
    find_lex $P401, "$/"
    find_lex $P402, "$/"
    unless_null $P402, vivify_224
    $P402 = root_new ['parrot';'Hash']
  vivify_224:
    set $P403, $P402["blockoid"]
    unless_null $P403, vivify_225
    new $P403, "Undef"
  vivify_225:
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
.sub "blockoid"  :subid("30_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_410
.annotate 'line', 129
    new $P409, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P409, control_408
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
    unless_null $P413, vivify_226
    $P413 = root_new ['parrot';'Hash']
  vivify_226:
    set $P414, $P413["statementlist"]
    unless_null $P414, vivify_227
    new $P414, "Undef"
  vivify_227:
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
.sub "newpad"  :subid("31_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_430
.annotate 'line', 138
    new $P429, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P429, control_428
    push_eh $P429
    .lex "self", self
    .lex "$/", param_430
.annotate 'line', 139
    get_global $P431, "@BLOCK"
    unless_null $P431, vivify_228
    $P431 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P431
  vivify_228:
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
.sub "outerctx"  :subid("32_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_443
.annotate 'line', 143
    new $P442, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P442, control_441
    push_eh $P442
    .lex "self", self
    .lex "$/", param_443
.annotate 'line', 144
    get_global $P444, "@BLOCK"
    unless_null $P444, vivify_229
    $P444 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P444
  vivify_229:
.annotate 'line', 143
    get_global $P445, "@BLOCK"
.annotate 'line', 145
    find_lex $P446, "self"
    get_global $P447, "@BLOCK"
    unless_null $P447, vivify_230
    $P447 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P448, $P447[0]
    unless_null $P448, vivify_231
    new $P448, "Undef"
  vivify_231:
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
.sub "statement_control:sym<if>"  :subid("33_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_454
.annotate 'line', 150
    .const 'Sub' $P482 = "34_1297880748.74619" 
    capture_lex $P482
    new $P453, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P453, control_452
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
    unless_null $P457, vivify_232
    $P457 = root_new ['parrot';'Hash']
  vivify_232:
    set $P458, $P457["xblock"]
    unless_null $P458, vivify_233
    new $P458, "Undef"
  vivify_233:
    set $N459, $P458
    new $P460, 'Float'
    set $P460, $N459
    sub $P461, $P460, 1
    store_lex "$count", $P461
.annotate 'line', 152
    find_lex $P462, "$count"
    set $I463, $P462
    find_lex $P464, "$/"
    unless_null $P464, vivify_234
    $P464 = root_new ['parrot';'Hash']
  vivify_234:
    set $P465, $P464["xblock"]
    unless_null $P465, vivify_235
    $P465 = root_new ['parrot';'ResizablePMCArray']
  vivify_235:
    set $P466, $P465[$I463]
    unless_null $P466, vivify_236
    new $P466, "Undef"
  vivify_236:
    $P467 = $P466."ast"()
    $P468 = "xblock_immediate"($P467)
    store_lex "$past", $P468
.annotate 'line', 153
    find_lex $P470, "$/"
    unless_null $P470, vivify_237
    $P470 = root_new ['parrot';'Hash']
  vivify_237:
    set $P471, $P470["else"]
    unless_null $P471, vivify_238
    new $P471, "Undef"
  vivify_238:
    unless $P471, if_469_end
.annotate 'line', 154
    find_lex $P472, "$past"
    find_lex $P473, "$/"
    unless_null $P473, vivify_239
    $P473 = root_new ['parrot';'Hash']
  vivify_239:
    set $P474, $P473["else"]
    unless_null $P474, vivify_240
    $P474 = root_new ['parrot';'ResizablePMCArray']
  vivify_240:
    set $P475, $P474[0]
    unless_null $P475, vivify_241
    new $P475, "Undef"
  vivify_241:
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
    .const 'Sub' $P482 = "34_1297880748.74619" 
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
.sub "_block481"  :anon :subid("34_1297880748.74619") :outer("33_1297880748.74619")
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
    unless_null $P489, vivify_242
    $P489 = root_new ['parrot';'Hash']
  vivify_242:
    set $P490, $P489["xblock"]
    unless_null $P490, vivify_243
    $P490 = root_new ['parrot';'ResizablePMCArray']
  vivify_243:
    set $P491, $P490[$I488]
    unless_null $P491, vivify_244
    new $P491, "Undef"
  vivify_244:
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
.sub "statement_control:sym<unless>"  :subid("35_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_507
.annotate 'line', 166
    new $P506, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P506, control_505
    push_eh $P506
    .lex "self", self
    .lex "$/", param_507
.annotate 'line', 167
    new $P508, "Undef"
    .lex "$past", $P508
    find_lex $P509, "$/"
    unless_null $P509, vivify_245
    $P509 = root_new ['parrot';'Hash']
  vivify_245:
    set $P510, $P509["xblock"]
    unless_null $P510, vivify_246
    new $P510, "Undef"
  vivify_246:
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
.sub "statement_control:sym<while>"  :subid("36_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_521
.annotate 'line', 172
    new $P520, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P520, control_519
    push_eh $P520
    .lex "self", self
    .lex "$/", param_521
.annotate 'line', 173
    new $P522, "Undef"
    .lex "$past", $P522
    find_lex $P523, "$/"
    unless_null $P523, vivify_247
    $P523 = root_new ['parrot';'Hash']
  vivify_247:
    set $P524, $P523["xblock"]
    unless_null $P524, vivify_248
    new $P524, "Undef"
  vivify_248:
    $P525 = $P524."ast"()
    $P526 = "xblock_immediate"($P525)
    store_lex "$past", $P526
.annotate 'line', 174
    find_lex $P527, "$past"
    find_lex $P528, "$/"
    unless_null $P528, vivify_249
    $P528 = root_new ['parrot';'Hash']
  vivify_249:
    set $P529, $P528["sym"]
    unless_null $P529, vivify_250
    new $P529, "Undef"
  vivify_250:
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
.sub "statement_control:sym<repeat>"  :subid("37_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_538
.annotate 'line', 178
    new $P537, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P537, control_536
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
    unless_null $P542, vivify_251
    $P542 = root_new ['parrot';'Hash']
  vivify_251:
    set $P543, $P542["wu"]
    unless_null $P543, vivify_252
    new $P543, "Undef"
  vivify_252:
    set $S544, $P543
    concat $P545, $P541, $S544
    store_lex "$pasttype", $P545
    find_lex $P546, "$past"
.annotate 'line', 181
    find_lex $P548, "$/"
    unless_null $P548, vivify_253
    $P548 = root_new ['parrot';'Hash']
  vivify_253:
    set $P549, $P548["xblock"]
    unless_null $P549, vivify_254
    new $P549, "Undef"
  vivify_254:
    if $P549, if_547
.annotate 'line', 186
    get_hll_global $P556, ["PAST"], "Op"
    find_lex $P557, "$/"
    unless_null $P557, vivify_255
    $P557 = root_new ['parrot';'Hash']
  vivify_255:
    set $P558, $P557["EXPR"]
    unless_null $P558, vivify_256
    new $P558, "Undef"
  vivify_256:
    $P559 = $P558."ast"()
    find_lex $P560, "$/"
    unless_null $P560, vivify_257
    $P560 = root_new ['parrot';'Hash']
  vivify_257:
    set $P561, $P560["pblock"]
    unless_null $P561, vivify_258
    new $P561, "Undef"
  vivify_258:
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
    unless_null $P550, vivify_259
    $P550 = root_new ['parrot';'Hash']
  vivify_259:
    set $P551, $P550["xblock"]
    unless_null $P551, vivify_260
    new $P551, "Undef"
  vivify_260:
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
.sub "statement_control:sym<for>"  :subid("38_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_574
.annotate 'line', 192
    new $P573, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P573, control_572
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
    unless_null $P577, vivify_261
    $P577 = root_new ['parrot';'Hash']
  vivify_261:
    set $P578, $P577["xblock"]
    unless_null $P578, vivify_262
    new $P578, "Undef"
  vivify_262:
    $P579 = $P578."ast"()
    store_lex "$past", $P579
.annotate 'line', 194
    find_lex $P580, "$past"
    $P580."pasttype"("for")
.annotate 'line', 195
    find_lex $P581, "$past"
    unless_null $P581, vivify_263
    $P581 = root_new ['parrot';'ResizablePMCArray']
  vivify_263:
    set $P582, $P581[1]
    unless_null $P582, vivify_264
    new $P582, "Undef"
  vivify_264:
    store_lex "$block", $P582
.annotate 'line', 196
    find_lex $P584, "$block"
    $P585 = $P584."arity"()
    if $P585, unless_583_end
.annotate 'line', 197
    find_lex $P586, "$block"
    unless_null $P586, vivify_265
    $P586 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P587, $P586[0]
    unless_null $P587, vivify_266
    new $P587, "Undef"
  vivify_266:
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
.sub "statement_control:sym<return>"  :subid("39_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_600
.annotate 'line', 205
    new $P599, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P599, control_598
    push_eh $P599
    .lex "self", self
    .lex "$/", param_600
.annotate 'line', 206
    find_lex $P601, "$/"
    get_hll_global $P602, ["PAST"], "Op"
    find_lex $P603, "$/"
    unless_null $P603, vivify_267
    $P603 = root_new ['parrot';'Hash']
  vivify_267:
    set $P604, $P603["EXPR"]
    unless_null $P604, vivify_268
    new $P604, "Undef"
  vivify_268:
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
.sub "statement_control:sym<CATCH>"  :subid("40_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_613
.annotate 'line', 209
    new $P612, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P612, control_611
    push_eh $P612
    .lex "self", self
    .lex "$/", param_613
.annotate 'line', 210
    new $P614, "Undef"
    .lex "$block", $P614
    find_lex $P615, "$/"
    unless_null $P615, vivify_269
    $P615 = root_new ['parrot';'Hash']
  vivify_269:
    set $P616, $P615["block"]
    unless_null $P616, vivify_270
    new $P616, "Undef"
  vivify_270:
    $P617 = $P616."ast"()
    store_lex "$block", $P617
.annotate 'line', 211
    find_lex $P618, "$/"
    find_lex $P619, "$block"
    "push_block_handler"($P618, $P619)
.annotate 'line', 212
    get_global $P620, "@BLOCK"
    unless_null $P620, vivify_271
    $P620 = root_new ['parrot';'ResizablePMCArray']
  vivify_271:
    set $P621, $P620[0]
    unless_null $P621, vivify_272
    new $P621, "Undef"
  vivify_272:
    $P622 = $P621."handlers"()
    set $P623, $P622[0]
    unless_null $P623, vivify_273
    new $P623, "Undef"
  vivify_273:
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_633
.annotate 'line', 216
    new $P632, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P632, control_631
    push_eh $P632
    .lex "self", self
    .lex "$/", param_633
.annotate 'line', 217
    new $P634, "Undef"
    .lex "$block", $P634
    find_lex $P635, "$/"
    unless_null $P635, vivify_274
    $P635 = root_new ['parrot';'Hash']
  vivify_274:
    set $P636, $P635["block"]
    unless_null $P636, vivify_275
    new $P636, "Undef"
  vivify_275:
    $P637 = $P636."ast"()
    store_lex "$block", $P637
.annotate 'line', 218
    find_lex $P638, "$/"
    find_lex $P639, "$block"
    "push_block_handler"($P638, $P639)
.annotate 'line', 219
    get_global $P640, "@BLOCK"
    unless_null $P640, vivify_276
    $P640 = root_new ['parrot';'ResizablePMCArray']
  vivify_276:
    set $P641, $P640[0]
    unless_null $P641, vivify_277
    new $P641, "Undef"
  vivify_277:
    $P642 = $P641."handlers"()
    set $P643, $P642[0]
    unless_null $P643, vivify_278
    new $P643, "Undef"
  vivify_278:
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_654
.annotate 'line', 260
    new $P653, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P653, control_652
    push_eh $P653
    .lex "self", self
    .lex "$/", param_654
.annotate 'line', 261
    get_global $P655, "@BLOCK"
    unless_null $P655, vivify_279
    $P655 = root_new ['parrot';'ResizablePMCArray']
  vivify_279:
    set $P656, $P655[0]
    unless_null $P656, vivify_280
    new $P656, "Undef"
  vivify_280:
    $P657 = $P656."loadinit"()
    find_lex $P658, "$/"
    unless_null $P658, vivify_281
    $P658 = root_new ['parrot';'Hash']
  vivify_281:
    set $P659, $P658["blorst"]
    unless_null $P659, vivify_282
    new $P659, "Undef"
  vivify_282:
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
.sub "statement_prefix:sym<try>"  :subid("43_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_670
.annotate 'line', 265
    new $P669, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P669, control_668
    push_eh $P669
    .lex "self", self
    .lex "$/", param_670
.annotate 'line', 266
    new $P671, "Undef"
    .lex "$past", $P671
    find_lex $P672, "$/"
    unless_null $P672, vivify_283
    $P672 = root_new ['parrot';'Hash']
  vivify_283:
    set $P673, $P672["blorst"]
    unless_null $P673, vivify_284
    new $P673, "Undef"
  vivify_284:
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
.sub "blorst"  :subid("44_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_705
.annotate 'line', 288
    new $P704, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P704, control_703
    push_eh $P704
    .lex "self", self
    .lex "$/", param_705
.annotate 'line', 289
    find_lex $P706, "$/"
.annotate 'line', 290
    find_lex $P709, "$/"
    unless_null $P709, vivify_285
    $P709 = root_new ['parrot';'Hash']
  vivify_285:
    set $P710, $P709["block"]
    unless_null $P710, vivify_286
    new $P710, "Undef"
  vivify_286:
    if $P710, if_708
.annotate 'line', 291
    find_lex $P715, "$/"
    unless_null $P715, vivify_287
    $P715 = root_new ['parrot';'Hash']
  vivify_287:
    set $P716, $P715["statement"]
    unless_null $P716, vivify_288
    new $P716, "Undef"
  vivify_288:
    $P717 = $P716."ast"()
    set $P707, $P717
.annotate 'line', 290
    goto if_708_end
  if_708:
    find_lex $P711, "$/"
    unless_null $P711, vivify_289
    $P711 = root_new ['parrot';'Hash']
  vivify_289:
    set $P712, $P711["block"]
    unless_null $P712, vivify_290
    new $P712, "Undef"
  vivify_290:
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_723
.annotate 'line', 296
    new $P722, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P722, control_721
    push_eh $P722
    .lex "self", self
    .lex "$/", param_723
    find_lex $P724, "$/"
    find_lex $P725, "$/"
    unless_null $P725, vivify_291
    $P725 = root_new ['parrot';'Hash']
  vivify_291:
    set $P726, $P725["cond"]
    unless_null $P726, vivify_292
    new $P726, "Undef"
  vivify_292:
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_733
.annotate 'line', 297
    new $P732, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P732, control_731
    push_eh $P732
    .lex "self", self
    .lex "$/", param_733
    find_lex $P734, "$/"
    find_lex $P735, "$/"
    unless_null $P735, vivify_293
    $P735 = root_new ['parrot';'Hash']
  vivify_293:
    set $P736, $P735["cond"]
    unless_null $P736, vivify_294
    new $P736, "Undef"
  vivify_294:
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_743
.annotate 'line', 299
    new $P742, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P742, control_741
    push_eh $P742
    .lex "self", self
    .lex "$/", param_743
    find_lex $P744, "$/"
    find_lex $P745, "$/"
    unless_null $P745, vivify_295
    $P745 = root_new ['parrot';'Hash']
  vivify_295:
    set $P746, $P745["cond"]
    unless_null $P746, vivify_296
    new $P746, "Undef"
  vivify_296:
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_753
.annotate 'line', 300
    new $P752, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P752, control_751
    push_eh $P752
    .lex "self", self
    .lex "$/", param_753
    find_lex $P754, "$/"
    find_lex $P755, "$/"
    unless_null $P755, vivify_297
    $P755 = root_new ['parrot';'Hash']
  vivify_297:
    set $P756, $P755["cond"]
    unless_null $P756, vivify_298
    new $P756, "Undef"
  vivify_298:
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
.sub "term:sym<fatarrow>"  :subid("49_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_763
.annotate 'line', 304
    new $P762, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P762, control_761
    push_eh $P762
    .lex "self", self
    .lex "$/", param_763
    find_lex $P764, "$/"
    find_lex $P765, "$/"
    unless_null $P765, vivify_299
    $P765 = root_new ['parrot';'Hash']
  vivify_299:
    set $P766, $P765["fatarrow"]
    unless_null $P766, vivify_300
    new $P766, "Undef"
  vivify_300:
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
.sub "term:sym<colonpair>"  :subid("50_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_773
.annotate 'line', 305
    new $P772, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P772, control_771
    push_eh $P772
    .lex "self", self
    .lex "$/", param_773
    find_lex $P774, "$/"
    find_lex $P775, "$/"
    unless_null $P775, vivify_301
    $P775 = root_new ['parrot';'Hash']
  vivify_301:
    set $P776, $P775["colonpair"]
    unless_null $P776, vivify_302
    new $P776, "Undef"
  vivify_302:
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
.sub "term:sym<variable>"  :subid("51_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_783
.annotate 'line', 306
    new $P782, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P782, control_781
    push_eh $P782
    .lex "self", self
    .lex "$/", param_783
    find_lex $P784, "$/"
    find_lex $P785, "$/"
    unless_null $P785, vivify_303
    $P785 = root_new ['parrot';'Hash']
  vivify_303:
    set $P786, $P785["variable"]
    unless_null $P786, vivify_304
    new $P786, "Undef"
  vivify_304:
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
.sub "term:sym<package_declarator>"  :subid("52_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_793
.annotate 'line', 307
    new $P792, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P792, control_791
    push_eh $P792
    .lex "self", self
    .lex "$/", param_793
    find_lex $P794, "$/"
    find_lex $P795, "$/"
    unless_null $P795, vivify_305
    $P795 = root_new ['parrot';'Hash']
  vivify_305:
    set $P796, $P795["package_declarator"]
    unless_null $P796, vivify_306
    new $P796, "Undef"
  vivify_306:
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
.sub "term:sym<scope_declarator>"  :subid("53_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_803
.annotate 'line', 308
    new $P802, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P802, control_801
    push_eh $P802
    .lex "self", self
    .lex "$/", param_803
    find_lex $P804, "$/"
    find_lex $P805, "$/"
    unless_null $P805, vivify_307
    $P805 = root_new ['parrot';'Hash']
  vivify_307:
    set $P806, $P805["scope_declarator"]
    unless_null $P806, vivify_308
    new $P806, "Undef"
  vivify_308:
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
.sub "term:sym<routine_declarator>"  :subid("54_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_813
.annotate 'line', 309
    new $P812, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P812, control_811
    push_eh $P812
    .lex "self", self
    .lex "$/", param_813
    find_lex $P814, "$/"
    find_lex $P815, "$/"
    unless_null $P815, vivify_309
    $P815 = root_new ['parrot';'Hash']
  vivify_309:
    set $P816, $P815["routine_declarator"]
    unless_null $P816, vivify_310
    new $P816, "Undef"
  vivify_310:
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
.sub "term:sym<multi_declarator>"  :subid("55_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_823
.annotate 'line', 310
    new $P822, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P822, control_821
    push_eh $P822
    .lex "self", self
    .lex "$/", param_823
    find_lex $P824, "$/"
    find_lex $P825, "$/"
    unless_null $P825, vivify_311
    $P825 = root_new ['parrot';'Hash']
  vivify_311:
    set $P826, $P825["multi_declarator"]
    unless_null $P826, vivify_312
    new $P826, "Undef"
  vivify_312:
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
.sub "term:sym<regex_declarator>"  :subid("56_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_833
.annotate 'line', 311
    new $P832, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P832, control_831
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
    find_lex $P834, "$/"
    find_lex $P835, "$/"
    unless_null $P835, vivify_313
    $P835 = root_new ['parrot';'Hash']
  vivify_313:
    set $P836, $P835["regex_declarator"]
    unless_null $P836, vivify_314
    new $P836, "Undef"
  vivify_314:
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
.sub "term:sym<statement_prefix>"  :subid("57_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_843
.annotate 'line', 312
    new $P842, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P842, control_841
    push_eh $P842
    .lex "self", self
    .lex "$/", param_843
    find_lex $P844, "$/"
    find_lex $P845, "$/"
    unless_null $P845, vivify_315
    $P845 = root_new ['parrot';'Hash']
  vivify_315:
    set $P846, $P845["statement_prefix"]
    unless_null $P846, vivify_316
    new $P846, "Undef"
  vivify_316:
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
.sub "term:sym<lambda>"  :subid("58_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_853
.annotate 'line', 313
    new $P852, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P852, control_851
    push_eh $P852
    .lex "self", self
    .lex "$/", param_853
    find_lex $P854, "$/"
    find_lex $P855, "$/"
    unless_null $P855, vivify_317
    $P855 = root_new ['parrot';'Hash']
  vivify_317:
    set $P856, $P855["pblock"]
    unless_null $P856, vivify_318
    new $P856, "Undef"
  vivify_318:
    $P857 = $P856."ast"()
    $P858 = $P854."!make"($P857)
    .return ($P858)
  control_851:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P859, exception, "payload"
    .return ($P859)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "fatarrow"  :subid("59_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_863
.annotate 'line', 315
    new $P862, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P862, control_861
    push_eh $P862
    .lex "self", self
    .lex "$/", param_863
.annotate 'line', 316
    new $P864, "Undef"
    .lex "$past", $P864
    find_lex $P865, "$/"
    unless_null $P865, vivify_319
    $P865 = root_new ['parrot';'Hash']
  vivify_319:
    set $P866, $P865["val"]
    unless_null $P866, vivify_320
    new $P866, "Undef"
  vivify_320:
    $P867 = $P866."ast"()
    store_lex "$past", $P867
.annotate 'line', 317
    find_lex $P868, "$past"
    find_lex $P869, "$/"
    unless_null $P869, vivify_321
    $P869 = root_new ['parrot';'Hash']
  vivify_321:
    set $P870, $P869["key"]
    unless_null $P870, vivify_322
    new $P870, "Undef"
  vivify_322:
    $P871 = $P870."Str"()
    $P868."named"($P871)
.annotate 'line', 318
    find_lex $P872, "$/"
    find_lex $P873, "$past"
    $P874 = $P872."!make"($P873)
.annotate 'line', 315
    .return ($P874)
  control_861:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P875, exception, "payload"
    .return ($P875)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "colonpair"  :subid("60_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_879
.annotate 'line', 321
    new $P878, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P878, control_877
    push_eh $P878
    .lex "self", self
    .lex "$/", param_879
.annotate 'line', 322
    new $P880, "Undef"
    .lex "$past", $P880
.annotate 'line', 323
    find_lex $P883, "$/"
    unless_null $P883, vivify_323
    $P883 = root_new ['parrot';'Hash']
  vivify_323:
    set $P884, $P883["circumfix"]
    unless_null $P884, vivify_324
    new $P884, "Undef"
  vivify_324:
    if $P884, if_882
.annotate 'line', 324
    get_hll_global $P889, ["PAST"], "Val"
    find_lex $P890, "$/"
    unless_null $P890, vivify_325
    $P890 = root_new ['parrot';'Hash']
  vivify_325:
    set $P891, $P890["not"]
    unless_null $P891, vivify_326
    new $P891, "Undef"
  vivify_326:
    isfalse $I892, $P891
    $P893 = $P889."new"($I892 :named("value"))
    set $P881, $P893
.annotate 'line', 323
    goto if_882_end
  if_882:
    find_lex $P885, "$/"
    unless_null $P885, vivify_327
    $P885 = root_new ['parrot';'Hash']
  vivify_327:
    set $P886, $P885["circumfix"]
    unless_null $P886, vivify_328
    $P886 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P887, $P886[0]
    unless_null $P887, vivify_329
    new $P887, "Undef"
  vivify_329:
    $P888 = $P887."ast"()
    set $P881, $P888
  if_882_end:
    store_lex "$past", $P881
.annotate 'line', 325
    find_lex $P894, "$past"
    find_lex $P895, "$/"
    unless_null $P895, vivify_330
    $P895 = root_new ['parrot';'Hash']
  vivify_330:
    set $P896, $P895["identifier"]
    unless_null $P896, vivify_331
    new $P896, "Undef"
  vivify_331:
    set $S897, $P896
    $P894."named"($S897)
.annotate 'line', 326
    find_lex $P898, "$/"
    find_lex $P899, "$past"
    $P900 = $P898."!make"($P899)
.annotate 'line', 321
    .return ($P900)
  control_877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P901, exception, "payload"
    .return ($P901)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable"  :subid("61_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_905
.annotate 'line', 329
    .const 'Sub' $P918 = "62_1297880748.74619" 
    capture_lex $P918
    new $P904, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P904, control_903
    push_eh $P904
    .lex "self", self
    .lex "$/", param_905
.annotate 'line', 330
    new $P906, "Undef"
    .lex "$past", $P906
.annotate 'line', 329
    find_lex $P907, "$past"
.annotate 'line', 331
    find_lex $P909, "$/"
    unless_null $P909, vivify_332
    $P909 = root_new ['parrot';'Hash']
  vivify_332:
    set $P910, $P909["postcircumfix"]
    unless_null $P910, vivify_333
    new $P910, "Undef"
  vivify_333:
    if $P910, if_908
.annotate 'line', 335
    .const 'Sub' $P918 = "62_1297880748.74619" 
    capture_lex $P918
    $P918()
    goto if_908_end
  if_908:
.annotate 'line', 332
    find_lex $P911, "$/"
    unless_null $P911, vivify_350
    $P911 = root_new ['parrot';'Hash']
  vivify_350:
    set $P912, $P911["postcircumfix"]
    unless_null $P912, vivify_351
    new $P912, "Undef"
  vivify_351:
    $P913 = $P912."ast"()
    store_lex "$past", $P913
.annotate 'line', 333
    find_lex $P914, "$past"
    get_hll_global $P915, ["PAST"], "Var"
    $P916 = $P915."new"("$/" :named("name"))
    $P914."unshift"($P916)
  if_908_end:
.annotate 'line', 364
    find_lex $P987, "$/"
    find_lex $P988, "$past"
    $P989 = $P987."!make"($P988)
.annotate 'line', 329
    .return ($P989)
  control_903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P990, exception, "payload"
    .return ($P990)
.end


.namespace ["NQP";"Actions"]
.sub "_block917"  :anon :subid("62_1297880748.74619") :outer("61_1297880748.74619")
.annotate 'line', 336
    $P919 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P919
    get_hll_global $P920, ["NQP"], "Compiler"
    find_lex $P921, "$/"
    set $S922, $P921
    $P923 = $P920."parse_name"($S922)
    store_lex "@name", $P923
.annotate 'line', 337
    get_hll_global $P924, ["PAST"], "Var"
    find_lex $P925, "@name"
    $P926 = $P925."pop"()
    set $S927, $P926
    $P928 = $P924."new"($S927 :named("name"))
    store_lex "$past", $P928
.annotate 'line', 338
    find_lex $P930, "@name"
    unless $P930, if_929_end
.annotate 'line', 339
    find_lex $P932, "@name"
    unless_null $P932, vivify_334
    $P932 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P933, $P932[0]
    unless_null $P933, vivify_335
    new $P933, "Undef"
  vivify_335:
    set $S934, $P933
    iseq $I935, $S934, "GLOBAL"
    unless $I935, if_931_end
    find_lex $P936, "@name"
    $P936."shift"()
  if_931_end:
.annotate 'line', 340
    find_lex $P937, "$past"
    find_lex $P938, "@name"
    $P937."namespace"($P938)
.annotate 'line', 341
    find_lex $P939, "$past"
    $P939."scope"("package")
.annotate 'line', 342
    find_lex $P940, "$past"
    find_lex $P941, "$/"
    unless_null $P941, vivify_336
    $P941 = root_new ['parrot';'Hash']
  vivify_336:
    set $P942, $P941["sigil"]
    unless_null $P942, vivify_337
    new $P942, "Undef"
  vivify_337:
    $P943 = "vivitype"($P942)
    $P940."viviself"($P943)
.annotate 'line', 343
    find_lex $P944, "$past"
    $P944."lvalue"(1)
  if_929_end:
.annotate 'line', 345
    find_lex $P947, "$/"
    unless_null $P947, vivify_338
    $P947 = root_new ['parrot';'Hash']
  vivify_338:
    set $P948, $P947["twigil"]
    unless_null $P948, vivify_339
    $P948 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P949, $P948[0]
    unless_null $P949, vivify_340
    new $P949, "Undef"
  vivify_340:
    set $S950, $P949
    iseq $I951, $S950, "*"
    if $I951, if_946
.annotate 'line', 358
    find_lex $P973, "$/"
    unless_null $P973, vivify_341
    $P973 = root_new ['parrot';'Hash']
  vivify_341:
    set $P974, $P973["twigil"]
    unless_null $P974, vivify_342
    $P974 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P975, $P974[0]
    unless_null $P975, vivify_343
    new $P975, "Undef"
  vivify_343:
    set $S976, $P975
    iseq $I977, $S976, "!"
    if $I977, if_972
    new $P971, 'Integer'
    set $P971, $I977
    goto if_972_end
  if_972:
.annotate 'line', 359
    find_lex $P978, "$past"
    get_hll_global $P979, ["PAST"], "Var"
    $P980 = $P979."new"("self" :named("name"))
    $P978."push"($P980)
.annotate 'line', 360
    find_lex $P981, "$past"
    $P981."scope"("attribute")
.annotate 'line', 361
    find_lex $P982, "$past"
    find_lex $P983, "$/"
    unless_null $P983, vivify_344
    $P983 = root_new ['parrot';'Hash']
  vivify_344:
    set $P984, $P983["sigil"]
    unless_null $P984, vivify_345
    new $P984, "Undef"
  vivify_345:
    $P985 = "vivitype"($P984)
    $P986 = $P982."viviself"($P985)
.annotate 'line', 358
    set $P971, $P986
  if_972_end:
    set $P945, $P971
.annotate 'line', 345
    goto if_946_end
  if_946:
.annotate 'line', 346
    find_lex $P952, "$past"
    $P952."scope"("contextual")
.annotate 'line', 347
    find_lex $P953, "$past"
.annotate 'line', 348
    get_hll_global $P954, ["PAST"], "Var"
.annotate 'line', 350
    find_lex $P955, "$/"
    unless_null $P955, vivify_346
    $P955 = root_new ['parrot';'Hash']
  vivify_346:
    set $P956, $P955["sigil"]
    unless_null $P956, vivify_347
    new $P956, "Undef"
  vivify_347:
    set $S957, $P956
    new $P958, 'String'
    set $P958, $S957
    find_lex $P959, "$/"
    unless_null $P959, vivify_348
    $P959 = root_new ['parrot';'Hash']
  vivify_348:
    set $P960, $P959["desigilname"]
    unless_null $P960, vivify_349
    new $P960, "Undef"
  vivify_349:
    concat $P961, $P958, $P960
.annotate 'line', 352
    get_hll_global $P962, ["PAST"], "Op"
    new $P963, "String"
    assign $P963, "Contextual "
    find_lex $P964, "$/"
    set $S965, $P964
    concat $P966, $P963, $S965
    concat $P967, $P966, " not found"
    $P968 = $P962."new"($P967, "die" :named("pirop"))
    $P969 = $P954."new"("package" :named("scope"), "" :named("namespace"), $P961 :named("name"), $P968 :named("viviself"))
.annotate 'line', 348
    $P970 = $P953."viviself"($P969)
.annotate 'line', 345
    set $P945, $P970
  if_946_end:
.annotate 'line', 335
    .return ($P945)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<module>"  :subid("63_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_994
.annotate 'line', 367
    new $P993, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P993, control_992
    push_eh $P993
    .lex "self", self
    .lex "$/", param_994
    find_lex $P995, "$/"
    find_lex $P996, "$/"
    unless_null $P996, vivify_352
    $P996 = root_new ['parrot';'Hash']
  vivify_352:
    set $P997, $P996["package_def"]
    unless_null $P997, vivify_353
    new $P997, "Undef"
  vivify_353:
    $P998 = $P997."ast"()
    $P999 = $P995."!make"($P998)
    .return ($P999)
  control_992:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1000, exception, "payload"
    .return ($P1000)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<class>"  :subid("64_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1004
.annotate 'line', 368
    new $P1003, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1003, control_1002
    push_eh $P1003
    .lex "self", self
    .lex "$/", param_1004
.annotate 'line', 369
    new $P1005, "Undef"
    .lex "$past", $P1005
.annotate 'line', 370
    new $P1006, "Undef"
    .lex "$classinit", $P1006
.annotate 'line', 379
    new $P1007, "Undef"
    .lex "$parent", $P1007
.annotate 'line', 369
    find_lex $P1008, "$/"
    unless_null $P1008, vivify_354
    $P1008 = root_new ['parrot';'Hash']
  vivify_354:
    set $P1009, $P1008["package_def"]
    unless_null $P1009, vivify_355
    new $P1009, "Undef"
  vivify_355:
    $P1010 = $P1009."ast"()
    store_lex "$past", $P1010
.annotate 'line', 371
    get_hll_global $P1011, ["PAST"], "Op"
.annotate 'line', 372
    get_hll_global $P1012, ["PAST"], "Op"
    $P1013 = $P1012."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 375
    find_lex $P1014, "$/"
    unless_null $P1014, vivify_356
    $P1014 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1015, $P1014["package_def"]
    unless_null $P1015, vivify_357
    $P1015 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1016, $P1015["name"]
    unless_null $P1016, vivify_358
    new $P1016, "Undef"
  vivify_358:
    set $S1017, $P1016
    $P1018 = $P1011."new"($P1013, $S1017, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 371
    store_lex "$classinit", $P1018
.annotate 'line', 379
    find_lex $P1021, "$/"
    unless_null $P1021, vivify_359
    $P1021 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1022, $P1021["package_def"]
    unless_null $P1022, vivify_360
    $P1022 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1023, $P1022["parent"]
    unless_null $P1023, vivify_361
    $P1023 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P1024, $P1023[0]
    unless_null $P1024, vivify_362
    new $P1024, "Undef"
  vivify_362:
    set $S1025, $P1024
    unless $S1025, unless_1020
    new $P1019, 'String'
    set $P1019, $S1025
    goto unless_1020_end
  unless_1020:
.annotate 'line', 380
    find_lex $P1028, "$/"
    unless_null $P1028, vivify_363
    $P1028 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1029, $P1028["sym"]
    unless_null $P1029, vivify_364
    new $P1029, "Undef"
  vivify_364:
    set $S1030, $P1029
    iseq $I1031, $S1030, "grammar"
    if $I1031, if_1027
    new $P1033, "String"
    assign $P1033, ""
    set $P1026, $P1033
    goto if_1027_end
  if_1027:
    new $P1032, "String"
    assign $P1032, "Regex::Cursor"
    set $P1026, $P1032
  if_1027_end:
    set $P1019, $P1026
  unless_1020_end:
    store_lex "$parent", $P1019
.annotate 'line', 381
    find_lex $P1035, "$parent"
    unless $P1035, if_1034_end
.annotate 'line', 382
    find_lex $P1036, "$classinit"
    get_hll_global $P1037, ["PAST"], "Val"
    find_lex $P1038, "$parent"
    $P1039 = $P1037."new"($P1038 :named("value"), "parent" :named("named"))
    $P1036."push"($P1039)
  if_1034_end:
.annotate 'line', 384
    find_lex $P1041, "$past"
    unless_null $P1041, vivify_365
    $P1041 = root_new ['parrot';'Hash']
  vivify_365:
    set $P1042, $P1041["attributes"]
    unless_null $P1042, vivify_366
    new $P1042, "Undef"
  vivify_366:
    unless $P1042, if_1040_end
.annotate 'line', 385
    find_lex $P1043, "$classinit"
    find_lex $P1044, "$past"
    unless_null $P1044, vivify_367
    $P1044 = root_new ['parrot';'Hash']
  vivify_367:
    set $P1045, $P1044["attributes"]
    unless_null $P1045, vivify_368
    new $P1045, "Undef"
  vivify_368:
    $P1043."push"($P1045)
  if_1040_end:
.annotate 'line', 387
    get_global $P1046, "@BLOCK"
    unless_null $P1046, vivify_369
    $P1046 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P1047, $P1046[0]
    unless_null $P1047, vivify_370
    new $P1047, "Undef"
  vivify_370:
    $P1048 = $P1047."loadinit"()
    find_lex $P1049, "$classinit"
    $P1048."push"($P1049)
.annotate 'line', 388
    find_lex $P1050, "$/"
    find_lex $P1051, "$past"
    $P1052 = $P1050."!make"($P1051)
.annotate 'line', 368
    .return ($P1052)
  control_1002:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1053, exception, "payload"
    .return ($P1053)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_def"  :subid("65_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1057
.annotate 'line', 391
    new $P1056, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1056, control_1055
    push_eh $P1056
    .lex "self", self
    .lex "$/", param_1057
.annotate 'line', 392
    new $P1058, "Undef"
    .lex "$past", $P1058
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_371
    $P1061 = root_new ['parrot';'Hash']
  vivify_371:
    set $P1062, $P1061["block"]
    unless_null $P1062, vivify_372
    new $P1062, "Undef"
  vivify_372:
    if $P1062, if_1060
    find_lex $P1066, "$/"
    unless_null $P1066, vivify_373
    $P1066 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1067, $P1066["comp_unit"]
    unless_null $P1067, vivify_374
    new $P1067, "Undef"
  vivify_374:
    $P1068 = $P1067."ast"()
    set $P1059, $P1068
    goto if_1060_end
  if_1060:
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_375
    $P1063 = root_new ['parrot';'Hash']
  vivify_375:
    set $P1064, $P1063["block"]
    unless_null $P1064, vivify_376
    new $P1064, "Undef"
  vivify_376:
    $P1065 = $P1064."ast"()
    set $P1059, $P1065
  if_1060_end:
    store_lex "$past", $P1059
.annotate 'line', 393
    find_lex $P1069, "$past"
    find_lex $P1070, "$/"
    unless_null $P1070, vivify_377
    $P1070 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1071, $P1070["name"]
    unless_null $P1071, vivify_378
    $P1071 = root_new ['parrot';'Hash']
  vivify_378:
    set $P1072, $P1071["identifier"]
    unless_null $P1072, vivify_379
    new $P1072, "Undef"
  vivify_379:
    $P1069."namespace"($P1072)
.annotate 'line', 394
    find_lex $P1073, "$past"
    $P1073."blocktype"("immediate")
.annotate 'line', 395
    find_lex $P1074, "$/"
    find_lex $P1075, "$past"
    $P1076 = $P1074."!make"($P1075)
.annotate 'line', 391
    .return ($P1076)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<my>"  :subid("66_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1081
.annotate 'line', 398
    new $P1080, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1080, control_1079
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
    find_lex $P1082, "$/"
    find_lex $P1083, "$/"
    unless_null $P1083, vivify_380
    $P1083 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1084, $P1083["scoped"]
    unless_null $P1084, vivify_381
    new $P1084, "Undef"
  vivify_381:
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
.sub "scope_declarator:sym<our>"  :subid("67_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1091
.annotate 'line', 399
    new $P1090, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1090, control_1089
    push_eh $P1090
    .lex "self", self
    .lex "$/", param_1091
    find_lex $P1092, "$/"
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_382
    $P1093 = root_new ['parrot';'Hash']
  vivify_382:
    set $P1094, $P1093["scoped"]
    unless_null $P1094, vivify_383
    new $P1094, "Undef"
  vivify_383:
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
.sub "scope_declarator:sym<has>"  :subid("68_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1101
.annotate 'line', 400
    new $P1100, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1100, control_1099
    push_eh $P1100
    .lex "self", self
    .lex "$/", param_1101
    find_lex $P1102, "$/"
    find_lex $P1103, "$/"
    unless_null $P1103, vivify_384
    $P1103 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1104, $P1103["scoped"]
    unless_null $P1104, vivify_385
    new $P1104, "Undef"
  vivify_385:
    $P1105 = $P1104."ast"()
    $P1106 = $P1102."!make"($P1105)
    .return ($P1106)
  control_1099:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1107, exception, "payload"
    .return ($P1107)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scoped"  :subid("69_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1111
.annotate 'line', 402
    new $P1110, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1110, control_1109
    push_eh $P1110
    .lex "self", self
    .lex "$/", param_1111
.annotate 'line', 403
    find_lex $P1112, "$/"
.annotate 'line', 404
    find_lex $P1115, "$/"
    unless_null $P1115, vivify_386
    $P1115 = root_new ['parrot';'Hash']
  vivify_386:
    set $P1116, $P1115["declarator"]
    unless_null $P1116, vivify_387
    new $P1116, "Undef"
  vivify_387:
    if $P1116, if_1114
.annotate 'line', 405
    find_lex $P1120, "$/"
    unless_null $P1120, vivify_388
    $P1120 = root_new ['parrot';'Hash']
  vivify_388:
    set $P1121, $P1120["multi_declarator"]
    unless_null $P1121, vivify_389
    new $P1121, "Undef"
  vivify_389:
    $P1122 = $P1121."ast"()
    set $P1113, $P1122
.annotate 'line', 404
    goto if_1114_end
  if_1114:
    find_lex $P1117, "$/"
    unless_null $P1117, vivify_390
    $P1117 = root_new ['parrot';'Hash']
  vivify_390:
    set $P1118, $P1117["declarator"]
    unless_null $P1118, vivify_391
    new $P1118, "Undef"
  vivify_391:
    $P1119 = $P1118."ast"()
    set $P1113, $P1119
  if_1114_end:
    $P1123 = $P1112."!make"($P1113)
.annotate 'line', 402
    .return ($P1123)
  control_1109:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1124, exception, "payload"
    .return ($P1124)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "declarator"  :subid("70_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1128
.annotate 'line', 408
    new $P1127, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1127, control_1126
    push_eh $P1127
    .lex "self", self
    .lex "$/", param_1128
.annotate 'line', 409
    find_lex $P1129, "$/"
.annotate 'line', 410
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_392
    $P1132 = root_new ['parrot';'Hash']
  vivify_392:
    set $P1133, $P1132["routine_declarator"]
    unless_null $P1133, vivify_393
    new $P1133, "Undef"
  vivify_393:
    if $P1133, if_1131
.annotate 'line', 411
    find_lex $P1137, "$/"
    unless_null $P1137, vivify_394
    $P1137 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1138, $P1137["variable_declarator"]
    unless_null $P1138, vivify_395
    new $P1138, "Undef"
  vivify_395:
    $P1139 = $P1138."ast"()
    set $P1130, $P1139
.annotate 'line', 410
    goto if_1131_end
  if_1131:
    find_lex $P1134, "$/"
    unless_null $P1134, vivify_396
    $P1134 = root_new ['parrot';'Hash']
  vivify_396:
    set $P1135, $P1134["routine_declarator"]
    unless_null $P1135, vivify_397
    new $P1135, "Undef"
  vivify_397:
    $P1136 = $P1135."ast"()
    set $P1130, $P1136
  if_1131_end:
    $P1140 = $P1129."!make"($P1130)
.annotate 'line', 408
    .return ($P1140)
  control_1126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1141, exception, "payload"
    .return ($P1141)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<multi>"  :subid("71_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1145
.annotate 'line', 414
    new $P1144, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1144, control_1143
    push_eh $P1144
    .lex "self", self
    .lex "$/", param_1145
    find_lex $P1146, "$/"
    find_lex $P1149, "$/"
    unless_null $P1149, vivify_398
    $P1149 = root_new ['parrot';'Hash']
  vivify_398:
    set $P1150, $P1149["declarator"]
    unless_null $P1150, vivify_399
    new $P1150, "Undef"
  vivify_399:
    if $P1150, if_1148
    find_lex $P1154, "$/"
    unless_null $P1154, vivify_400
    $P1154 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1155, $P1154["routine_def"]
    unless_null $P1155, vivify_401
    new $P1155, "Undef"
  vivify_401:
    $P1156 = $P1155."ast"()
    set $P1147, $P1156
    goto if_1148_end
  if_1148:
    find_lex $P1151, "$/"
    unless_null $P1151, vivify_402
    $P1151 = root_new ['parrot';'Hash']
  vivify_402:
    set $P1152, $P1151["declarator"]
    unless_null $P1152, vivify_403
    new $P1152, "Undef"
  vivify_403:
    $P1153 = $P1152."ast"()
    set $P1147, $P1153
  if_1148_end:
    $P1157 = $P1146."!make"($P1147)
    .return ($P1157)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1158, exception, "payload"
    .return ($P1158)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<null>"  :subid("72_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1162
.annotate 'line', 415
    new $P1161, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1161, control_1160
    push_eh $P1161
    .lex "self", self
    .lex "$/", param_1162
    find_lex $P1163, "$/"
    find_lex $P1164, "$/"
    unless_null $P1164, vivify_404
    $P1164 = root_new ['parrot';'Hash']
  vivify_404:
    set $P1165, $P1164["declarator"]
    unless_null $P1165, vivify_405
    new $P1165, "Undef"
  vivify_405:
    $P1166 = $P1165."ast"()
    $P1167 = $P1163."!make"($P1166)
    .return ($P1167)
  control_1160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1168, exception, "payload"
    .return ($P1168)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable_declarator"  :subid("73_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1172
.annotate 'line', 418
    .const 'Sub' $P1212 = "74_1297880748.74619" 
    capture_lex $P1212
    new $P1171, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1171, control_1170
    push_eh $P1171
    .lex "self", self
    .lex "$/", param_1172
.annotate 'line', 419
    new $P1173, "Undef"
    .lex "$past", $P1173
.annotate 'line', 420
    new $P1174, "Undef"
    .lex "$sigil", $P1174
.annotate 'line', 421
    new $P1175, "Undef"
    .lex "$name", $P1175
.annotate 'line', 422
    new $P1176, "Undef"
    .lex "$BLOCK", $P1176
.annotate 'line', 419
    find_lex $P1177, "$/"
    unless_null $P1177, vivify_406
    $P1177 = root_new ['parrot';'Hash']
  vivify_406:
    set $P1178, $P1177["variable"]
    unless_null $P1178, vivify_407
    new $P1178, "Undef"
  vivify_407:
    $P1179 = $P1178."ast"()
    store_lex "$past", $P1179
.annotate 'line', 420
    find_lex $P1180, "$/"
    unless_null $P1180, vivify_408
    $P1180 = root_new ['parrot';'Hash']
  vivify_408:
    set $P1181, $P1180["variable"]
    unless_null $P1181, vivify_409
    $P1181 = root_new ['parrot';'Hash']
  vivify_409:
    set $P1182, $P1181["sigil"]
    unless_null $P1182, vivify_410
    new $P1182, "Undef"
  vivify_410:
    store_lex "$sigil", $P1182
.annotate 'line', 421
    find_lex $P1183, "$past"
    $P1184 = $P1183."name"()
    store_lex "$name", $P1184
.annotate 'line', 422
    get_global $P1185, "@BLOCK"
    unless_null $P1185, vivify_411
    $P1185 = root_new ['parrot';'ResizablePMCArray']
  vivify_411:
    set $P1186, $P1185[0]
    unless_null $P1186, vivify_412
    new $P1186, "Undef"
  vivify_412:
    store_lex "$BLOCK", $P1186
.annotate 'line', 423
    find_lex $P1188, "$BLOCK"
    find_lex $P1189, "$name"
    $P1190 = $P1188."symbol"($P1189)
    unless $P1190, if_1187_end
.annotate 'line', 424
    find_lex $P1191, "$/"
    $P1192 = $P1191."CURSOR"()
    find_lex $P1193, "$name"
    $P1192."panic"("Redeclaration of symbol ", $P1193)
  if_1187_end:
.annotate 'line', 426
    find_dynamic_lex $P1195, "$*SCOPE"
    unless_null $P1195, vivify_413
    get_hll_global $P1195, "$SCOPE"
    unless_null $P1195, vivify_414
    die "Contextual $*SCOPE not found"
  vivify_414:
  vivify_413:
    set $S1196, $P1195
    iseq $I1197, $S1196, "has"
    if $I1197, if_1194
.annotate 'line', 435
    .const 'Sub' $P1212 = "74_1297880748.74619" 
    capture_lex $P1212
    $P1212()
    goto if_1194_end
  if_1194:
.annotate 'line', 427
    find_lex $P1198, "$BLOCK"
    find_lex $P1199, "$name"
    $P1198."symbol"($P1199, "attribute" :named("scope"))
.annotate 'line', 428
    find_lex $P1201, "$BLOCK"
    unless_null $P1201, vivify_419
    $P1201 = root_new ['parrot';'Hash']
  vivify_419:
    set $P1202, $P1201["attributes"]
    unless_null $P1202, vivify_420
    new $P1202, "Undef"
  vivify_420:
    if $P1202, unless_1200_end
.annotate 'line', 430
    get_hll_global $P1203, ["PAST"], "Op"
    $P1204 = $P1203."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1205, "$BLOCK"
    unless_null $P1205, vivify_421
    $P1205 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1205
  vivify_421:
    set $P1205["attributes"], $P1204
  unless_1200_end:
.annotate 'line', 432
    find_lex $P1206, "$BLOCK"
    unless_null $P1206, vivify_422
    $P1206 = root_new ['parrot';'Hash']
  vivify_422:
    set $P1207, $P1206["attributes"]
    unless_null $P1207, vivify_423
    new $P1207, "Undef"
  vivify_423:
    find_lex $P1208, "$name"
    $P1207."push"($P1208)
.annotate 'line', 433
    get_hll_global $P1209, ["PAST"], "Stmts"
    $P1210 = $P1209."new"()
    store_lex "$past", $P1210
  if_1194_end:
.annotate 'line', 443
    find_lex $P1236, "$/"
    find_lex $P1237, "$past"
    $P1238 = $P1236."!make"($P1237)
.annotate 'line', 418
    .return ($P1238)
  control_1170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1239, exception, "payload"
    .return ($P1239)
.end


.namespace ["NQP";"Actions"]
.sub "_block1211"  :anon :subid("74_1297880748.74619") :outer("73_1297880748.74619")
.annotate 'line', 436
    new $P1213, "Undef"
    .lex "$scope", $P1213
.annotate 'line', 437
    new $P1214, "Undef"
    .lex "$decl", $P1214
.annotate 'line', 436
    find_dynamic_lex $P1217, "$*SCOPE"
    unless_null $P1217, vivify_415
    get_hll_global $P1217, "$SCOPE"
    unless_null $P1217, vivify_416
    die "Contextual $*SCOPE not found"
  vivify_416:
  vivify_415:
    set $S1218, $P1217
    iseq $I1219, $S1218, "our"
    if $I1219, if_1216
    new $P1221, "String"
    assign $P1221, "lexical"
    set $P1215, $P1221
    goto if_1216_end
  if_1216:
    new $P1220, "String"
    assign $P1220, "package"
    set $P1215, $P1220
  if_1216_end:
    store_lex "$scope", $P1215
.annotate 'line', 437
    get_hll_global $P1222, ["PAST"], "Var"
    find_lex $P1223, "$name"
    find_lex $P1224, "$scope"
.annotate 'line', 438
    find_lex $P1225, "$sigil"
    $P1226 = "vivitype"($P1225)
    find_lex $P1227, "$/"
    $P1228 = $P1222."new"($P1223 :named("name"), $P1224 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1226 :named("viviself"), $P1227 :named("node"))
.annotate 'line', 437
    store_lex "$decl", $P1228
.annotate 'line', 440
    find_lex $P1229, "$BLOCK"
    find_lex $P1230, "$name"
    find_lex $P1231, "$scope"
    $P1229."symbol"($P1230, $P1231 :named("scope"))
.annotate 'line', 441
    find_lex $P1232, "$BLOCK"
    unless_null $P1232, vivify_417
    $P1232 = root_new ['parrot';'ResizablePMCArray']
  vivify_417:
    set $P1233, $P1232[0]
    unless_null $P1233, vivify_418
    new $P1233, "Undef"
  vivify_418:
    find_lex $P1234, "$decl"
    $P1235 = $P1233."push"($P1234)
.annotate 'line', 435
    .return ($P1235)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<sub>"  :subid("75_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1243
.annotate 'line', 446
    new $P1242, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1242, control_1241
    push_eh $P1242
    .lex "self", self
    .lex "$/", param_1243
    find_lex $P1244, "$/"
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_424
    $P1245 = root_new ['parrot';'Hash']
  vivify_424:
    set $P1246, $P1245["routine_def"]
    unless_null $P1246, vivify_425
    new $P1246, "Undef"
  vivify_425:
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
.sub "routine_declarator:sym<method>"  :subid("76_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1253
.annotate 'line', 447
    new $P1252, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1252, control_1251
    push_eh $P1252
    .lex "self", self
    .lex "$/", param_1253
    find_lex $P1254, "$/"
    find_lex $P1255, "$/"
    unless_null $P1255, vivify_426
    $P1255 = root_new ['parrot';'Hash']
  vivify_426:
    set $P1256, $P1255["method_def"]
    unless_null $P1256, vivify_427
    new $P1256, "Undef"
  vivify_427:
    $P1257 = $P1256."ast"()
    $P1258 = $P1254."!make"($P1257)
    .return ($P1258)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1259, exception, "payload"
    .return ($P1259)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_def"  :subid("77_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1263
.annotate 'line', 449
    .const 'Sub' $P1322 = "79_1297880748.74619" 
    capture_lex $P1322
    .const 'Sub' $P1276 = "78_1297880748.74619" 
    capture_lex $P1276
    new $P1262, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1262, control_1261
    push_eh $P1262
    .lex "self", self
    .lex "$/", param_1263
.annotate 'line', 450
    new $P1264, "Undef"
    .lex "$block", $P1264
.annotate 'line', 453
    new $P1265, "Undef"
    .lex "$past", $P1265
.annotate 'line', 450
    find_lex $P1266, "$/"
    unless_null $P1266, vivify_428
    $P1266 = root_new ['parrot';'Hash']
  vivify_428:
    set $P1267, $P1266["blockoid"]
    unless_null $P1267, vivify_429
    new $P1267, "Undef"
  vivify_429:
    $P1268 = $P1267."ast"()
    store_lex "$block", $P1268
.annotate 'line', 451
    find_lex $P1269, "$block"
    $P1269."blocktype"("declaration")
.annotate 'line', 452
    find_lex $P1270, "$block"
    $P1270."control"("return_pir")
.annotate 'line', 453
    find_lex $P1271, "$block"
    store_lex "$past", $P1271
.annotate 'line', 454
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_430
    $P1273 = root_new ['parrot';'Hash']
  vivify_430:
    set $P1274, $P1273["deflongname"]
    unless_null $P1274, vivify_431
    new $P1274, "Undef"
  vivify_431:
    unless $P1274, if_1272_end
    .const 'Sub' $P1276 = "78_1297880748.74619" 
    capture_lex $P1276
    $P1276()
  if_1272_end:
.annotate 'line', 464
    find_lex $P1308, "$block"
    find_lex $P1309, "$past"
    unless_null $P1309, vivify_445
    $P1309 = root_new ['parrot';'Hash']
    store_lex "$past", $P1309
  vivify_445:
    set $P1309["block_past"], $P1308
.annotate 'line', 465
    find_lex $P1310, "$/"
    find_lex $P1311, "$past"
    $P1310."!make"($P1311)
.annotate 'line', 466
    find_lex $P1314, "$/"
    unless_null $P1314, vivify_446
    $P1314 = root_new ['parrot';'Hash']
  vivify_446:
    set $P1315, $P1314["trait"]
    unless_null $P1315, vivify_447
    new $P1315, "Undef"
  vivify_447:
    if $P1315, if_1313
    set $P1312, $P1315
    goto if_1313_end
  if_1313:
.annotate 'line', 467
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_448
    $P1317 = root_new ['parrot';'Hash']
  vivify_448:
    set $P1318, $P1317["trait"]
    unless_null $P1318, vivify_449
    new $P1318, "Undef"
  vivify_449:
    defined $I1319, $P1318
    unless $I1319, for_undef_450
    iter $P1316, $P1318
    new $P1329, 'ExceptionHandler'
    set_addr $P1329, loop1328_handler
    $P1329."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1329
  loop1328_test:
    unless $P1316, loop1328_done
    shift $P1320, $P1316
  loop1328_redo:
    .const 'Sub' $P1322 = "79_1297880748.74619" 
    capture_lex $P1322
    $P1322($P1320)
  loop1328_next:
    goto loop1328_test
  loop1328_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1330, exception, 'type'
    eq $P1330, .CONTROL_LOOP_NEXT, loop1328_next
    eq $P1330, .CONTROL_LOOP_REDO, loop1328_redo
  loop1328_done:
    pop_eh 
  for_undef_450:
.annotate 'line', 466
    set $P1312, $P1316
  if_1313_end:
.annotate 'line', 449
    .return ($P1312)
  control_1261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1331, exception, "payload"
    .return ($P1331)
.end


.namespace ["NQP";"Actions"]
.sub "_block1275"  :anon :subid("78_1297880748.74619") :outer("77_1297880748.74619")
.annotate 'line', 455
    new $P1277, "Undef"
    .lex "$name", $P1277
    find_lex $P1278, "$/"
    unless_null $P1278, vivify_432
    $P1278 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1279, $P1278["sigil"]
    unless_null $P1279, vivify_433
    $P1279 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1280, $P1279[0]
    unless_null $P1280, vivify_434
    new $P1280, "Undef"
  vivify_434:
    set $S1281, $P1280
    new $P1282, 'String'
    set $P1282, $S1281
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_435
    $P1283 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1284, $P1283["deflongname"]
    unless_null $P1284, vivify_436
    $P1284 = root_new ['parrot';'ResizablePMCArray']
  vivify_436:
    set $P1285, $P1284[0]
    unless_null $P1285, vivify_437
    new $P1285, "Undef"
  vivify_437:
    $S1286 = $P1285."ast"()
    concat $P1287, $P1282, $S1286
    store_lex "$name", $P1287
.annotate 'line', 456
    find_lex $P1288, "$past"
    find_lex $P1289, "$name"
    $P1288."name"($P1289)
.annotate 'line', 457
    find_dynamic_lex $P1292, "$*SCOPE"
    unless_null $P1292, vivify_438
    get_hll_global $P1292, "$SCOPE"
    unless_null $P1292, vivify_439
    die "Contextual $*SCOPE not found"
  vivify_439:
  vivify_438:
    set $S1293, $P1292
    isne $I1294, $S1293, "our"
    if $I1294, if_1291
    new $P1290, 'Integer'
    set $P1290, $I1294
    goto if_1291_end
  if_1291:
.annotate 'line', 458
    get_global $P1295, "@BLOCK"
    unless_null $P1295, vivify_440
    $P1295 = root_new ['parrot';'ResizablePMCArray']
  vivify_440:
    set $P1296, $P1295[0]
    unless_null $P1296, vivify_441
    $P1296 = root_new ['parrot';'ResizablePMCArray']
  vivify_441:
    set $P1297, $P1296[0]
    unless_null $P1297, vivify_442
    new $P1297, "Undef"
  vivify_442:
    get_hll_global $P1298, ["PAST"], "Var"
    find_lex $P1299, "$name"
    find_lex $P1300, "$past"
    $P1301 = $P1298."new"($P1299 :named("name"), 1 :named("isdecl"), $P1300 :named("viviself"), "lexical" :named("scope"))
    $P1297."push"($P1301)
.annotate 'line', 460
    get_global $P1302, "@BLOCK"
    unless_null $P1302, vivify_443
    $P1302 = root_new ['parrot';'ResizablePMCArray']
  vivify_443:
    set $P1303, $P1302[0]
    unless_null $P1303, vivify_444
    new $P1303, "Undef"
  vivify_444:
    find_lex $P1304, "$name"
    $P1303."symbol"($P1304, "lexical" :named("scope"))
.annotate 'line', 461
    get_hll_global $P1305, ["PAST"], "Var"
    find_lex $P1306, "$name"
    $P1307 = $P1305."new"($P1306 :named("name"))
    store_lex "$past", $P1307
.annotate 'line', 457
    set $P1290, $P1307
  if_1291_end:
.annotate 'line', 454
    .return ($P1290)
.end


.namespace ["NQP";"Actions"]
.sub "_block1321"  :anon :subid("79_1297880748.74619") :outer("77_1297880748.74619")
    .param pmc param_1323
.annotate 'line', 467
    .lex "$_", param_1323
    find_lex $P1324, "$_"
    $P1325 = $P1324."ast"()
    find_lex $P1326, "$/"
    $P1327 = $P1325($P1326)
    .return ($P1327)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "method_def"  :subid("80_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1335
.annotate 'line', 472
    .const 'Sub' $P1387 = "82_1297880748.74619" 
    capture_lex $P1387
    .const 'Sub' $P1356 = "81_1297880748.74619" 
    capture_lex $P1356
    new $P1334, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1334, control_1333
    push_eh $P1334
    .lex "self", self
    .lex "$/", param_1335
.annotate 'line', 473
    new $P1336, "Undef"
    .lex "$past", $P1336
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_451
    $P1337 = root_new ['parrot';'Hash']
  vivify_451:
    set $P1338, $P1337["blockoid"]
    unless_null $P1338, vivify_452
    new $P1338, "Undef"
  vivify_452:
    $P1339 = $P1338."ast"()
    store_lex "$past", $P1339
.annotate 'line', 474
    find_lex $P1340, "$past"
    $P1340."blocktype"("method")
.annotate 'line', 475
    find_dynamic_lex $P1342, "$*SCOPE"
    unless_null $P1342, vivify_453
    get_hll_global $P1342, "$SCOPE"
    unless_null $P1342, vivify_454
    die "Contextual $*SCOPE not found"
  vivify_454:
  vivify_453:
    set $S1343, $P1342
    iseq $I1344, $S1343, "our"
    unless $I1344, if_1341_end
.annotate 'line', 476
    find_lex $P1345, "$past"
    $P1345."pirflags"(":nsentry")
  if_1341_end:
.annotate 'line', 478
    find_lex $P1346, "$past"
    $P1346."control"("return_pir")
.annotate 'line', 479
    find_lex $P1347, "$past"
    unless_null $P1347, vivify_455
    $P1347 = root_new ['parrot';'ResizablePMCArray']
  vivify_455:
    set $P1348, $P1347[0]
    unless_null $P1348, vivify_456
    new $P1348, "Undef"
  vivify_456:
    get_hll_global $P1349, ["PAST"], "Op"
    $P1350 = $P1349."new"("    .lex \"self\", self" :named("inline"))
    $P1348."unshift"($P1350)
.annotate 'line', 480
    find_lex $P1351, "$past"
    $P1351."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 481
    find_lex $P1353, "$/"
    unless_null $P1353, vivify_457
    $P1353 = root_new ['parrot';'Hash']
  vivify_457:
    set $P1354, $P1353["deflongname"]
    unless_null $P1354, vivify_458
    new $P1354, "Undef"
  vivify_458:
    unless $P1354, if_1352_end
    .const 'Sub' $P1356 = "81_1297880748.74619" 
    capture_lex $P1356
    $P1356()
  if_1352_end:
.annotate 'line', 485
    find_dynamic_lex $P1368, "$*MULTINESS"
    unless_null $P1368, vivify_462
    get_hll_global $P1368, "$MULTINESS"
    unless_null $P1368, vivify_463
    die "Contextual $*MULTINESS not found"
  vivify_463:
  vivify_462:
    set $S1369, $P1368
    iseq $I1370, $S1369, "multi"
    unless $I1370, if_1367_end
    find_lex $P1371, "$past"
    $P1372 = $P1371."multi"()
    $P1372."unshift"("_")
  if_1367_end:
.annotate 'line', 486
    find_lex $P1373, "$past"
    find_lex $P1374, "$past"
    unless_null $P1374, vivify_464
    $P1374 = root_new ['parrot';'Hash']
    store_lex "$past", $P1374
  vivify_464:
    set $P1374["block_past"], $P1373
.annotate 'line', 487
    find_lex $P1375, "$/"
    find_lex $P1376, "$past"
    $P1375."!make"($P1376)
.annotate 'line', 488
    find_lex $P1379, "$/"
    unless_null $P1379, vivify_465
    $P1379 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1380, $P1379["trait"]
    unless_null $P1380, vivify_466
    new $P1380, "Undef"
  vivify_466:
    if $P1380, if_1378
    set $P1377, $P1380
    goto if_1378_end
  if_1378:
.annotate 'line', 489
    find_lex $P1382, "$/"
    unless_null $P1382, vivify_467
    $P1382 = root_new ['parrot';'Hash']
  vivify_467:
    set $P1383, $P1382["trait"]
    unless_null $P1383, vivify_468
    new $P1383, "Undef"
  vivify_468:
    defined $I1384, $P1383
    unless $I1384, for_undef_469
    iter $P1381, $P1383
    new $P1394, 'ExceptionHandler'
    set_addr $P1394, loop1393_handler
    $P1394."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1394
  loop1393_test:
    unless $P1381, loop1393_done
    shift $P1385, $P1381
  loop1393_redo:
    .const 'Sub' $P1387 = "82_1297880748.74619" 
    capture_lex $P1387
    $P1387($P1385)
  loop1393_next:
    goto loop1393_test
  loop1393_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1395, exception, 'type'
    eq $P1395, .CONTROL_LOOP_NEXT, loop1393_next
    eq $P1395, .CONTROL_LOOP_REDO, loop1393_redo
  loop1393_done:
    pop_eh 
  for_undef_469:
.annotate 'line', 488
    set $P1377, $P1381
  if_1378_end:
.annotate 'line', 472
    .return ($P1377)
  control_1333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1396, exception, "payload"
    .return ($P1396)
.end


.namespace ["NQP";"Actions"]
.sub "_block1355"  :anon :subid("81_1297880748.74619") :outer("80_1297880748.74619")
.annotate 'line', 482
    new $P1357, "Undef"
    .lex "$name", $P1357
    find_lex $P1358, "$/"
    unless_null $P1358, vivify_459
    $P1358 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1359, $P1358["deflongname"]
    unless_null $P1359, vivify_460
    $P1359 = root_new ['parrot';'ResizablePMCArray']
  vivify_460:
    set $P1360, $P1359[0]
    unless_null $P1360, vivify_461
    new $P1360, "Undef"
  vivify_461:
    $P1361 = $P1360."ast"()
    set $S1362, $P1361
    new $P1363, 'String'
    set $P1363, $S1362
    store_lex "$name", $P1363
.annotate 'line', 483
    find_lex $P1364, "$past"
    find_lex $P1365, "$name"
    $P1366 = $P1364."name"($P1365)
.annotate 'line', 481
    .return ($P1366)
.end


.namespace ["NQP";"Actions"]
.sub "_block1386"  :anon :subid("82_1297880748.74619") :outer("80_1297880748.74619")
    .param pmc param_1388
.annotate 'line', 489
    .lex "$_", param_1388
    find_lex $P1389, "$_"
    $P1390 = $P1389."ast"()
    find_lex $P1391, "$/"
    $P1392 = $P1390($P1391)
    .return ($P1392)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("83_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1400
.annotate 'line', 494
    .const 'Sub' $P1426 = "85_1297880748.74619" 
    capture_lex $P1426
    .const 'Sub' $P1411 = "84_1297880748.74619" 
    capture_lex $P1411
    new $P1399, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1399, control_1398
    push_eh $P1399
    .lex "self", self
    .lex "$/", param_1400
.annotate 'line', 495
    new $P1401, "Undef"
    .lex "$BLOCKINIT", $P1401
    get_global $P1402, "@BLOCK"
    unless_null $P1402, vivify_470
    $P1402 = root_new ['parrot';'ResizablePMCArray']
  vivify_470:
    set $P1403, $P1402[0]
    unless_null $P1403, vivify_471
    $P1403 = root_new ['parrot';'ResizablePMCArray']
  vivify_471:
    set $P1404, $P1403[0]
    unless_null $P1404, vivify_472
    new $P1404, "Undef"
  vivify_472:
    store_lex "$BLOCKINIT", $P1404
.annotate 'line', 497
    find_lex $P1406, "$/"
    unless_null $P1406, vivify_473
    $P1406 = root_new ['parrot';'Hash']
  vivify_473:
    set $P1407, $P1406["parameter"]
    unless_null $P1407, vivify_474
    new $P1407, "Undef"
  vivify_474:
    defined $I1408, $P1407
    unless $I1408, for_undef_475
    iter $P1405, $P1407
    new $P1418, 'ExceptionHandler'
    set_addr $P1418, loop1417_handler
    $P1418."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1418
  loop1417_test:
    unless $P1405, loop1417_done
    shift $P1409, $P1405
  loop1417_redo:
    .const 'Sub' $P1411 = "84_1297880748.74619" 
    capture_lex $P1411
    $P1411($P1409)
  loop1417_next:
    goto loop1417_test
  loop1417_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1419, exception, 'type'
    eq $P1419, .CONTROL_LOOP_NEXT, loop1417_next
    eq $P1419, .CONTROL_LOOP_REDO, loop1417_redo
  loop1417_done:
    pop_eh 
  for_undef_475:
.annotate 'line', 500
    find_dynamic_lex $P1422, "$*MULTINESS"
    unless_null $P1422, vivify_476
    get_hll_global $P1422, "$MULTINESS"
    unless_null $P1422, vivify_477
    die "Contextual $*MULTINESS not found"
  vivify_477:
  vivify_476:
    set $S1423, $P1422
    iseq $I1424, $S1423, "multi"
    if $I1424, if_1421
    new $P1420, 'Integer'
    set $P1420, $I1424
    goto if_1421_end
  if_1421:
    .const 'Sub' $P1426 = "85_1297880748.74619" 
    capture_lex $P1426
    $P1464 = $P1426()
    set $P1420, $P1464
  if_1421_end:
.annotate 'line', 494
    .return ($P1420)
  control_1398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1465, exception, "payload"
    .return ($P1465)
.end


.namespace ["NQP";"Actions"]
.sub "_block1410"  :anon :subid("84_1297880748.74619") :outer("83_1297880748.74619")
    .param pmc param_1412
.annotate 'line', 497
    .lex "$_", param_1412
    find_lex $P1413, "$BLOCKINIT"
    find_lex $P1414, "$_"
    $P1415 = $P1414."ast"()
    $P1416 = $P1413."push"($P1415)
    .return ($P1416)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1425"  :anon :subid("85_1297880748.74619") :outer("83_1297880748.74619")
.annotate 'line', 500
    .const 'Sub' $P1435 = "86_1297880748.74619" 
    capture_lex $P1435
.annotate 'line', 501
    $P1427 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1427
.annotate 'line', 500
    find_lex $P1428, "@params"
.annotate 'line', 502
    find_lex $P1430, "$BLOCKINIT"
    $P1431 = $P1430."list"()
    defined $I1432, $P1431
    unless $I1432, for_undef_478
    iter $P1429, $P1431
    new $P1458, 'ExceptionHandler'
    set_addr $P1458, loop1457_handler
    $P1458."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1458
  loop1457_test:
    unless $P1429, loop1457_done
    shift $P1433, $P1429
  loop1457_redo:
    .const 'Sub' $P1435 = "86_1297880748.74619" 
    capture_lex $P1435
    $P1435($P1433)
  loop1457_next:
    goto loop1457_test
  loop1457_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1459, exception, 'type'
    eq $P1459, .CONTROL_LOOP_NEXT, loop1457_next
    eq $P1459, .CONTROL_LOOP_REDO, loop1457_redo
  loop1457_done:
    pop_eh 
  for_undef_478:
.annotate 'line', 506
    get_global $P1460, "@BLOCK"
    unless_null $P1460, vivify_479
    $P1460 = root_new ['parrot';'ResizablePMCArray']
  vivify_479:
    set $P1461, $P1460[0]
    unless_null $P1461, vivify_480
    new $P1461, "Undef"
  vivify_480:
    find_lex $P1462, "@params"
    $P1463 = $P1461."multi"($P1462)
.annotate 'line', 500
    .return ($P1463)
.end


.namespace ["NQP";"Actions"]
.sub "_block1434"  :anon :subid("86_1297880748.74619") :outer("85_1297880748.74619")
    .param pmc param_1436
.annotate 'line', 502
    .lex "$_", param_1436
.annotate 'line', 504
    find_lex $P1443, "$_"
    $P1444 = $P1443."slurpy"()
    unless $P1444, unless_1442
    set $P1441, $P1444
    goto unless_1442_end
  unless_1442:
    find_lex $P1445, "$_"
    $P1446 = $P1445."named"()
    set $P1441, $P1446
  unless_1442_end:
    unless $P1441, unless_1440
    set $P1439, $P1441
    goto unless_1440_end
  unless_1440:
    find_lex $P1447, "$_"
    $P1448 = $P1447."viviself"()
    set $P1439, $P1448
  unless_1440_end:
    unless $P1439, unless_1438
    set $P1437, $P1439
    goto unless_1438_end
  unless_1438:
.annotate 'line', 503
    find_lex $P1449, "@params"
    find_lex $P1451, "$_"
    $P1452 = $P1451."multitype"()
    set $P1450, $P1452
    defined $I1454, $P1450
    if $I1454, default_1453
    new $P1455, "String"
    assign $P1455, "_"
    set $P1450, $P1455
  default_1453:
    $P1456 = $P1449."push"($P1450)
    set $P1437, $P1456
  unless_1438_end:
.annotate 'line', 502
    .return ($P1437)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("87_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1469
.annotate 'line', 510
    .const 'Sub' $P1550 = "88_1297880748.74619" 
    capture_lex $P1550
    new $P1468, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1468, control_1467
    push_eh $P1468
    .lex "self", self
    .lex "$/", param_1469
.annotate 'line', 511
    new $P1470, "Undef"
    .lex "$quant", $P1470
.annotate 'line', 512
    new $P1471, "Undef"
    .lex "$past", $P1471
.annotate 'line', 511
    find_lex $P1472, "$/"
    unless_null $P1472, vivify_481
    $P1472 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1473, $P1472["quant"]
    unless_null $P1473, vivify_482
    new $P1473, "Undef"
  vivify_482:
    store_lex "$quant", $P1473
    find_lex $P1474, "$past"
.annotate 'line', 513
    find_lex $P1476, "$/"
    unless_null $P1476, vivify_483
    $P1476 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1477, $P1476["named_param"]
    unless_null $P1477, vivify_484
    new $P1477, "Undef"
  vivify_484:
    if $P1477, if_1475
.annotate 'line', 520
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_485
    $P1491 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1492, $P1491["param_var"]
    unless_null $P1492, vivify_486
    new $P1492, "Undef"
  vivify_486:
    $P1493 = $P1492."ast"()
    store_lex "$past", $P1493
.annotate 'line', 521
    find_lex $P1495, "$quant"
    set $S1496, $P1495
    iseq $I1497, $S1496, "*"
    if $I1497, if_1494
.annotate 'line', 525
    find_lex $P1506, "$quant"
    set $S1507, $P1506
    iseq $I1508, $S1507, "?"
    unless $I1508, if_1505_end
.annotate 'line', 526
    find_lex $P1509, "$past"
    find_lex $P1510, "$/"
    unless_null $P1510, vivify_487
    $P1510 = root_new ['parrot';'Hash']
  vivify_487:
    set $P1511, $P1510["param_var"]
    unless_null $P1511, vivify_488
    $P1511 = root_new ['parrot';'Hash']
  vivify_488:
    set $P1512, $P1511["sigil"]
    unless_null $P1512, vivify_489
    new $P1512, "Undef"
  vivify_489:
    $P1513 = "vivitype"($P1512)
    $P1509."viviself"($P1513)
  if_1505_end:
.annotate 'line', 525
    goto if_1494_end
  if_1494:
.annotate 'line', 522
    find_lex $P1498, "$past"
    $P1498."slurpy"(1)
.annotate 'line', 523
    find_lex $P1499, "$past"
    find_lex $P1500, "$/"
    unless_null $P1500, vivify_490
    $P1500 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1501, $P1500["param_var"]
    unless_null $P1501, vivify_491
    $P1501 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1502, $P1501["sigil"]
    unless_null $P1502, vivify_492
    new $P1502, "Undef"
  vivify_492:
    set $S1503, $P1502
    iseq $I1504, $S1503, "%"
    $P1499."named"($I1504)
  if_1494_end:
.annotate 'line', 519
    goto if_1475_end
  if_1475:
.annotate 'line', 514
    find_lex $P1478, "$/"
    unless_null $P1478, vivify_493
    $P1478 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1479, $P1478["named_param"]
    unless_null $P1479, vivify_494
    new $P1479, "Undef"
  vivify_494:
    $P1480 = $P1479."ast"()
    store_lex "$past", $P1480
.annotate 'line', 515
    find_lex $P1482, "$quant"
    set $S1483, $P1482
    isne $I1484, $S1483, "!"
    unless $I1484, if_1481_end
.annotate 'line', 516
    find_lex $P1485, "$past"
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_495
    $P1486 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1487, $P1486["named_param"]
    unless_null $P1487, vivify_496
    $P1487 = root_new ['parrot';'Hash']
  vivify_496:
    set $P1488, $P1487["param_var"]
    unless_null $P1488, vivify_497
    $P1488 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1489, $P1488["sigil"]
    unless_null $P1489, vivify_498
    new $P1489, "Undef"
  vivify_498:
    $P1490 = "vivitype"($P1489)
    $P1485."viviself"($P1490)
  if_1481_end:
  if_1475_end:
.annotate 'line', 529
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_499
    $P1515 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1516, $P1515["default_value"]
    unless_null $P1516, vivify_500
    new $P1516, "Undef"
  vivify_500:
    unless $P1516, if_1514_end
.annotate 'line', 530
    find_lex $P1518, "$quant"
    set $S1519, $P1518
    iseq $I1520, $S1519, "*"
    unless $I1520, if_1517_end
.annotate 'line', 531
    find_lex $P1521, "$/"
    $P1522 = $P1521."CURSOR"()
    $P1522."panic"("Can't put default on slurpy parameter")
  if_1517_end:
.annotate 'line', 533
    find_lex $P1524, "$quant"
    set $S1525, $P1524
    iseq $I1526, $S1525, "!"
    unless $I1526, if_1523_end
.annotate 'line', 534
    find_lex $P1527, "$/"
    $P1528 = $P1527."CURSOR"()
    $P1528."panic"("Can't put default on required parameter")
  if_1523_end:
.annotate 'line', 536
    find_lex $P1529, "$past"
    find_lex $P1530, "$/"
    unless_null $P1530, vivify_501
    $P1530 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1531, $P1530["default_value"]
    unless_null $P1531, vivify_502
    $P1531 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1532, $P1531[0]
    unless_null $P1532, vivify_503
    $P1532 = root_new ['parrot';'Hash']
  vivify_503:
    set $P1533, $P1532["EXPR"]
    unless_null $P1533, vivify_504
    new $P1533, "Undef"
  vivify_504:
    $P1534 = $P1533."ast"()
    $P1529."viviself"($P1534)
  if_1514_end:
.annotate 'line', 538
    find_lex $P1536, "$past"
    $P1537 = $P1536."viviself"()
    if $P1537, unless_1535_end
    get_global $P1538, "@BLOCK"
    unless_null $P1538, vivify_505
    $P1538 = root_new ['parrot';'ResizablePMCArray']
  vivify_505:
    set $P1539, $P1538[0]
    unless_null $P1539, vivify_506
    new $P1539, "Undef"
  vivify_506:
    get_global $P1540, "@BLOCK"
    unless_null $P1540, vivify_507
    $P1540 = root_new ['parrot';'ResizablePMCArray']
  vivify_507:
    set $P1541, $P1540[0]
    unless_null $P1541, vivify_508
    new $P1541, "Undef"
  vivify_508:
    $P1542 = $P1541."arity"()
    set $N1543, $P1542
    new $P1544, 'Float'
    set $P1544, $N1543
    add $P1545, $P1544, 1
    $P1539."arity"($P1545)
  unless_1535_end:
.annotate 'line', 541
    find_lex $P1547, "$/"
    unless_null $P1547, vivify_509
    $P1547 = root_new ['parrot';'Hash']
  vivify_509:
    set $P1548, $P1547["typename"]
    unless_null $P1548, vivify_510
    new $P1548, "Undef"
  vivify_510:
    unless $P1548, if_1546_end
    .const 'Sub' $P1550 = "88_1297880748.74619" 
    capture_lex $P1550
    $P1550()
  if_1546_end:
.annotate 'line', 547
    find_lex $P1574, "$/"
    find_lex $P1575, "$past"
    $P1576 = $P1574."!make"($P1575)
.annotate 'line', 510
    .return ($P1576)
  control_1467:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1577, exception, "payload"
    .return ($P1577)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1549"  :anon :subid("88_1297880748.74619") :outer("87_1297880748.74619")
.annotate 'line', 541
    .const 'Sub' $P1562 = "89_1297880748.74619" 
    capture_lex $P1562
.annotate 'line', 542
    $P1551 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1551
.annotate 'line', 541
    find_lex $P1552, "@multitype"
.annotate 'line', 543
    find_lex $P1554, "$/"
    unless_null $P1554, vivify_511
    $P1554 = root_new ['parrot';'Hash']
  vivify_511:
    set $P1555, $P1554["typename"]
    unless_null $P1555, vivify_512
    $P1555 = root_new ['parrot';'ResizablePMCArray']
  vivify_512:
    set $P1556, $P1555[0]
    unless_null $P1556, vivify_513
    $P1556 = root_new ['parrot';'Hash']
  vivify_513:
    set $P1557, $P1556["name"]
    unless_null $P1557, vivify_514
    $P1557 = root_new ['parrot';'Hash']
  vivify_514:
    set $P1558, $P1557["identifier"]
    unless_null $P1558, vivify_515
    new $P1558, "Undef"
  vivify_515:
    defined $I1559, $P1558
    unless $I1559, for_undef_516
    iter $P1553, $P1558
    new $P1569, 'ExceptionHandler'
    set_addr $P1569, loop1568_handler
    $P1569."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1569
  loop1568_test:
    unless $P1553, loop1568_done
    shift $P1560, $P1553
  loop1568_redo:
    .const 'Sub' $P1562 = "89_1297880748.74619" 
    capture_lex $P1562
    $P1562($P1560)
  loop1568_next:
    goto loop1568_test
  loop1568_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, 'type'
    eq $P1570, .CONTROL_LOOP_NEXT, loop1568_next
    eq $P1570, .CONTROL_LOOP_REDO, loop1568_redo
  loop1568_done:
    pop_eh 
  for_undef_516:
.annotate 'line', 544
    find_lex $P1571, "$past"
    find_lex $P1572, "@multitype"
    $P1573 = $P1571."multitype"($P1572)
.annotate 'line', 541
    .return ($P1573)
.end


.namespace ["NQP";"Actions"]
.sub "_block1561"  :anon :subid("89_1297880748.74619") :outer("88_1297880748.74619")
    .param pmc param_1563
.annotate 'line', 543
    .lex "$_", param_1563
    find_lex $P1564, "@multitype"
    find_lex $P1565, "$_"
    set $S1566, $P1565
    $P1567 = $P1564."push"($S1566)
    .return ($P1567)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("90_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1581
.annotate 'line', 550
    new $P1580, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1580, control_1579
    push_eh $P1580
    .lex "self", self
    .lex "$/", param_1581
.annotate 'line', 551
    new $P1582, "Undef"
    .lex "$name", $P1582
.annotate 'line', 552
    new $P1583, "Undef"
    .lex "$past", $P1583
.annotate 'line', 551
    find_lex $P1584, "$/"
    set $S1585, $P1584
    new $P1586, 'String'
    set $P1586, $S1585
    store_lex "$name", $P1586
.annotate 'line', 552
    get_hll_global $P1587, ["PAST"], "Var"
    find_lex $P1588, "$name"
    find_lex $P1589, "$/"
    $P1590 = $P1587."new"($P1588 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1589 :named("node"))
    store_lex "$past", $P1590
.annotate 'line', 554
    get_global $P1591, "@BLOCK"
    unless_null $P1591, vivify_517
    $P1591 = root_new ['parrot';'ResizablePMCArray']
  vivify_517:
    set $P1592, $P1591[0]
    unless_null $P1592, vivify_518
    new $P1592, "Undef"
  vivify_518:
    find_lex $P1593, "$name"
    $P1592."symbol"($P1593, "lexical" :named("scope"))
.annotate 'line', 555
    find_lex $P1594, "$/"
    find_lex $P1595, "$past"
    $P1596 = $P1594."!make"($P1595)
.annotate 'line', 550
    .return ($P1596)
  control_1579:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1597, exception, "payload"
    .return ($P1597)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("91_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1601
.annotate 'line', 558
    new $P1600, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1600, control_1599
    push_eh $P1600
    .lex "self", self
    .lex "$/", param_1601
.annotate 'line', 559
    new $P1602, "Undef"
    .lex "$past", $P1602
    find_lex $P1603, "$/"
    unless_null $P1603, vivify_519
    $P1603 = root_new ['parrot';'Hash']
  vivify_519:
    set $P1604, $P1603["param_var"]
    unless_null $P1604, vivify_520
    new $P1604, "Undef"
  vivify_520:
    $P1605 = $P1604."ast"()
    store_lex "$past", $P1605
.annotate 'line', 560
    find_lex $P1606, "$past"
    find_lex $P1607, "$/"
    unless_null $P1607, vivify_521
    $P1607 = root_new ['parrot';'Hash']
  vivify_521:
    set $P1608, $P1607["param_var"]
    unless_null $P1608, vivify_522
    $P1608 = root_new ['parrot';'Hash']
  vivify_522:
    set $P1609, $P1608["name"]
    unless_null $P1609, vivify_523
    new $P1609, "Undef"
  vivify_523:
    set $S1610, $P1609
    $P1606."named"($S1610)
.annotate 'line', 561
    find_lex $P1611, "$/"
    find_lex $P1612, "$past"
    $P1613 = $P1611."!make"($P1612)
.annotate 'line', 558
    .return ($P1613)
  control_1599:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1614, exception, "payload"
    .return ($P1614)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait"  :subid("92_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1618
.annotate 'line', 564
    new $P1617, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1617, control_1616
    push_eh $P1617
    .lex "self", self
    .lex "$/", param_1618
.annotate 'line', 565
    find_lex $P1619, "$/"
    find_lex $P1620, "$/"
    unless_null $P1620, vivify_524
    $P1620 = root_new ['parrot';'Hash']
  vivify_524:
    set $P1621, $P1620["trait_mod"]
    unless_null $P1621, vivify_525
    new $P1621, "Undef"
  vivify_525:
    $P1622 = $P1621."ast"()
    $P1623 = $P1619."!make"($P1622)
.annotate 'line', 564
    .return ($P1623)
  control_1616:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1624, exception, "payload"
    .return ($P1624)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait_mod:sym<is>"  :subid("93_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1628
.annotate 'line', 568
    .const 'Sub' $P1648 = "94_1297880748.74619" 
    capture_lex $P1648
    new $P1627, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1627, control_1626
    push_eh $P1627
    .lex "self", self
    .lex "$/", param_1628
.annotate 'line', 569
    new $P1629, "Undef"
    .lex "$cpast", $P1629
    find_lex $P1630, "$/"
    unless_null $P1630, vivify_526
    $P1630 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1631, $P1630["circumfix"]
    unless_null $P1631, vivify_527
    $P1631 = root_new ['parrot';'ResizablePMCArray']
  vivify_527:
    set $P1632, $P1631[0]
    unless_null $P1632, vivify_528
    new $P1632, "Undef"
  vivify_528:
    $P1633 = $P1632."ast"()
    store_lex "$cpast", $P1633
.annotate 'line', 570
    find_lex $P1636, "$/"
    unless_null $P1636, vivify_529
    $P1636 = root_new ['parrot';'Hash']
  vivify_529:
    set $P1637, $P1636["longname"]
    unless_null $P1637, vivify_530
    new $P1637, "Undef"
  vivify_530:
    set $S1638, $P1637
    iseq $I1639, $S1638, "pirflags"
    if $I1639, if_1635
.annotate 'line', 576
    find_lex $P1658, "$/"
    $P1659 = $P1658."CURSOR"()
    new $P1660, 'String'
    set $P1660, "Trait '"
    find_lex $P1661, "$/"
    unless_null $P1661, vivify_531
    $P1661 = root_new ['parrot';'Hash']
  vivify_531:
    set $P1662, $P1661["longname"]
    unless_null $P1662, vivify_532
    new $P1662, "Undef"
  vivify_532:
    concat $P1663, $P1660, $P1662
    concat $P1664, $P1663, "' not implemented"
    $P1665 = $P1659."panic"($P1664)
.annotate 'line', 575
    set $P1634, $P1665
.annotate 'line', 570
    goto if_1635_end
  if_1635:
.annotate 'line', 572
    get_hll_global $P1641, ["PAST"], "Val"
    find_lex $P1642, "$cpast"
    $P1643 = $P1641."ACCEPTS"($P1642)
    if $P1643, unless_1640_end
.annotate 'line', 571
    find_lex $P1644, "$/"
    $P1645 = $P1644."CURSOR"()
    $P1645."panic"("Trait 'pirflags' requires constant scalar argument")
  unless_1640_end:
.annotate 'line', 573
    find_lex $P1646, "$/"
    .const 'Sub' $P1648 = "94_1297880748.74619" 
    newclosure $P1656, $P1648
    $P1657 = $P1646."!make"($P1656)
.annotate 'line', 570
    set $P1634, $P1657
  if_1635_end:
.annotate 'line', 568
    .return ($P1634)
  control_1626:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1666, exception, "payload"
    .return ($P1666)
.end


.namespace ["NQP";"Actions"]
.sub "_block1647"  :anon :subid("94_1297880748.74619") :outer("93_1297880748.74619")
    .param pmc param_1649
.annotate 'line', 573
    .lex "$match", param_1649
    find_lex $P1650, "$match"
    $P1651 = $P1650."ast"()
    set $P1652, $P1651["block_past"]
    unless_null $P1652, vivify_533
    new $P1652, "Undef"
  vivify_533:
    find_lex $P1653, "$cpast"
    $P1654 = $P1653."value"()
    $P1655 = $P1652."pirflags"($P1654)
    .return ($P1655)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("95_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1670
    .param pmc param_1671 :optional
    .param int has_param_1671 :opt_flag
.annotate 'line', 580
    .const 'Sub' $P1741 = "97_1297880748.74619" 
    capture_lex $P1741
    .const 'Sub' $P1713 = "96_1297880748.74619" 
    capture_lex $P1713
    new $P1669, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1669, control_1668
    push_eh $P1669
    .lex "self", self
    .lex "$/", param_1670
    if has_param_1671, optparam_534
    new $P1672, "Undef"
    set param_1671, $P1672
  optparam_534:
    .lex "$key", param_1671
.annotate 'line', 581
    $P1673 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1673
.annotate 'line', 584
    new $P1674, "Undef"
    .lex "$name", $P1674
.annotate 'line', 585
    new $P1675, "Undef"
    .lex "$past", $P1675
.annotate 'line', 581

        $P1676 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1676
.annotate 'line', 584
    find_lex $P1677, "$/"
    unless_null $P1677, vivify_535
    $P1677 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1678, $P1677["deflongname"]
    unless_null $P1678, vivify_536
    new $P1678, "Undef"
  vivify_536:
    $P1679 = $P1678."ast"()
    set $S1680, $P1679
    new $P1681, 'String'
    set $P1681, $S1680
    store_lex "$name", $P1681
    find_lex $P1682, "$past"
.annotate 'line', 586
    find_lex $P1684, "$/"
    unless_null $P1684, vivify_537
    $P1684 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1685, $P1684["proto"]
    unless_null $P1685, vivify_538
    new $P1685, "Undef"
  vivify_538:
    if $P1685, if_1683
.annotate 'line', 613
    find_lex $P1709, "$key"
    set $S1710, $P1709
    iseq $I1711, $S1710, "open"
    if $I1711, if_1708
.annotate 'line', 626
    .const 'Sub' $P1741 = "97_1297880748.74619" 
    capture_lex $P1741
    $P1741()
    goto if_1708_end
  if_1708:
.annotate 'line', 613
    .const 'Sub' $P1713 = "96_1297880748.74619" 
    capture_lex $P1713
    $P1713()
  if_1708_end:
    goto if_1683_end
  if_1683:
.annotate 'line', 588
    get_hll_global $P1686, ["PAST"], "Stmts"
.annotate 'line', 589
    get_hll_global $P1687, ["PAST"], "Block"
    find_lex $P1688, "$name"
.annotate 'line', 590
    get_hll_global $P1689, ["PAST"], "Op"
.annotate 'line', 591
    get_hll_global $P1690, ["PAST"], "Var"
    $P1691 = $P1690."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1692, "$name"
    $P1693 = $P1689."new"($P1691, $P1692, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 590
    find_lex $P1694, "$/"
    $P1695 = $P1687."new"($P1693, $P1688 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1694 :named("node"))
.annotate 'line', 600
    get_hll_global $P1696, ["PAST"], "Block"
    new $P1697, "String"
    assign $P1697, "!PREFIX__"
    find_lex $P1698, "$name"
    concat $P1699, $P1697, $P1698
.annotate 'line', 601
    get_hll_global $P1700, ["PAST"], "Op"
.annotate 'line', 602
    get_hll_global $P1701, ["PAST"], "Var"
    $P1702 = $P1701."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1703, "$name"
    $P1704 = $P1700."new"($P1702, $P1703, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 601
    find_lex $P1705, "$/"
    $P1706 = $P1696."new"($P1704, $P1699 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1705 :named("node"))
.annotate 'line', 600
    $P1707 = $P1686."new"($P1695, $P1706)
.annotate 'line', 588
    store_lex "$past", $P1707
  if_1683_end:
.annotate 'line', 640
    find_lex $P1762, "$/"
    find_lex $P1763, "$past"
    $P1764 = $P1762."!make"($P1763)
.annotate 'line', 580
    .return ($P1764)
  control_1668:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1765, exception, "payload"
    .return ($P1765)
.end


.namespace ["NQP";"Actions"]
.sub "_block1740"  :anon :subid("97_1297880748.74619") :outer("95_1297880748.74619")
.annotate 'line', 627
    new $P1742, "Undef"
    .lex "$regex", $P1742
.annotate 'line', 628
    get_hll_global $P1743, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1744, "$/"
    unless_null $P1744, vivify_539
    $P1744 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1745, $P1744["p6regex"]
    unless_null $P1745, vivify_540
    new $P1745, "Undef"
  vivify_540:
    $P1746 = $P1745."ast"()
    get_global $P1747, "@BLOCK"
    $P1748 = $P1747."shift"()
    $P1749 = $P1743($P1746, $P1748)
    store_lex "$regex", $P1749
.annotate 'line', 629
    find_lex $P1750, "$regex"
    find_lex $P1751, "$name"
    $P1750."name"($P1751)
.annotate 'line', 631
    get_hll_global $P1752, ["PAST"], "Op"
.annotate 'line', 633
    get_hll_global $P1753, ["PAST"], "Var"
    new $P1754, "ResizablePMCArray"
    push $P1754, "Regex"
    $P1755 = $P1753."new"("Method" :named("name"), $P1754 :named("namespace"), "package" :named("scope"))
    find_lex $P1756, "$regex"
    $P1757 = $P1752."new"($P1755, $P1756, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 631
    store_lex "$past", $P1757
.annotate 'line', 637
    find_lex $P1758, "$regex"
    find_lex $P1759, "$past"
    unless_null $P1759, vivify_541
    $P1759 = root_new ['parrot';'Hash']
    store_lex "$past", $P1759
  vivify_541:
    set $P1759["sink"], $P1758
.annotate 'line', 638
    find_lex $P1760, "@MODIFIERS"
    $P1761 = $P1760."shift"()
.annotate 'line', 626
    .return ($P1761)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1712"  :anon :subid("96_1297880748.74619") :outer("95_1297880748.74619")
.annotate 'line', 614
    $P1714 = root_new ['parrot';'Hash']
    .lex "%h", $P1714
.annotate 'line', 613
    find_lex $P1715, "%h"
.annotate 'line', 615
    find_lex $P1717, "$/"
    unless_null $P1717, vivify_542
    $P1717 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1718, $P1717["sym"]
    unless_null $P1718, vivify_543
    new $P1718, "Undef"
  vivify_543:
    set $S1719, $P1718
    iseq $I1720, $S1719, "token"
    unless $I1720, if_1716_end
    new $P1721, "Integer"
    assign $P1721, 1
    find_lex $P1722, "%h"
    unless_null $P1722, vivify_544
    $P1722 = root_new ['parrot';'Hash']
    store_lex "%h", $P1722
  vivify_544:
    set $P1722["r"], $P1721
  if_1716_end:
.annotate 'line', 616
    find_lex $P1724, "$/"
    unless_null $P1724, vivify_545
    $P1724 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1725, $P1724["sym"]
    unless_null $P1725, vivify_546
    new $P1725, "Undef"
  vivify_546:
    set $S1726, $P1725
    iseq $I1727, $S1726, "rule"
    unless $I1727, if_1723_end
    new $P1728, "Integer"
    assign $P1728, 1
    find_lex $P1729, "%h"
    unless_null $P1729, vivify_547
    $P1729 = root_new ['parrot';'Hash']
    store_lex "%h", $P1729
  vivify_547:
    set $P1729["r"], $P1728
    new $P1730, "Integer"
    assign $P1730, 1
    find_lex $P1731, "%h"
    unless_null $P1731, vivify_548
    $P1731 = root_new ['parrot';'Hash']
    store_lex "%h", $P1731
  vivify_548:
    set $P1731["s"], $P1730
  if_1723_end:
.annotate 'line', 617
    find_lex $P1732, "@MODIFIERS"
    find_lex $P1733, "%h"
    $P1732."unshift"($P1733)
.annotate 'line', 618

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 622
    get_global $P1734, "@BLOCK"
    unless_null $P1734, vivify_549
    $P1734 = root_new ['parrot';'ResizablePMCArray']
  vivify_549:
    set $P1735, $P1734[0]
    unless_null $P1735, vivify_550
    new $P1735, "Undef"
  vivify_550:
    $P1735."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 623
    get_global $P1736, "@BLOCK"
    unless_null $P1736, vivify_551
    $P1736 = root_new ['parrot';'ResizablePMCArray']
  vivify_551:
    set $P1737, $P1736[0]
    unless_null $P1737, vivify_552
    new $P1737, "Undef"
  vivify_552:
    $P1737."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 624
    new $P1738, "Exception"
    set $P1738['type'], .CONTROL_RETURN
    new $P1739, "Integer"
    assign $P1739, 0
    setattribute $P1738, 'payload', $P1739
    throw $P1738
.annotate 'line', 613
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("98_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1769
.annotate 'line', 644
    new $P1768, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1768, control_1767
    push_eh $P1768
    .lex "self", self
    .lex "$/", param_1769
.annotate 'line', 645
    new $P1770, "Undef"
    .lex "$past", $P1770
    find_lex $P1773, "$/"
    unless_null $P1773, vivify_553
    $P1773 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1774, $P1773["args"]
    unless_null $P1774, vivify_554
    new $P1774, "Undef"
  vivify_554:
    if $P1774, if_1772
    get_hll_global $P1779, ["PAST"], "Op"
    find_lex $P1780, "$/"
    $P1781 = $P1779."new"($P1780 :named("node"))
    set $P1771, $P1781
    goto if_1772_end
  if_1772:
    find_lex $P1775, "$/"
    unless_null $P1775, vivify_555
    $P1775 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1776, $P1775["args"]
    unless_null $P1776, vivify_556
    $P1776 = root_new ['parrot';'ResizablePMCArray']
  vivify_556:
    set $P1777, $P1776[0]
    unless_null $P1777, vivify_557
    new $P1777, "Undef"
  vivify_557:
    $P1778 = $P1777."ast"()
    set $P1771, $P1778
  if_1772_end:
    store_lex "$past", $P1771
.annotate 'line', 646
    find_lex $P1782, "$past"
    find_lex $P1785, "$/"
    unless_null $P1785, vivify_558
    $P1785 = root_new ['parrot';'Hash']
  vivify_558:
    set $P1786, $P1785["quote"]
    unless_null $P1786, vivify_559
    new $P1786, "Undef"
  vivify_559:
    if $P1786, if_1784
    find_lex $P1790, "$/"
    unless_null $P1790, vivify_560
    $P1790 = root_new ['parrot';'Hash']
  vivify_560:
    set $P1791, $P1790["longname"]
    unless_null $P1791, vivify_561
    new $P1791, "Undef"
  vivify_561:
    set $S1792, $P1791
    new $P1783, 'String'
    set $P1783, $S1792
    goto if_1784_end
  if_1784:
    find_lex $P1787, "$/"
    unless_null $P1787, vivify_562
    $P1787 = root_new ['parrot';'Hash']
  vivify_562:
    set $P1788, $P1787["quote"]
    unless_null $P1788, vivify_563
    new $P1788, "Undef"
  vivify_563:
    $P1789 = $P1788."ast"()
    set $P1783, $P1789
  if_1784_end:
    $P1782."name"($P1783)
.annotate 'line', 647
    find_lex $P1793, "$past"
    $P1793."pasttype"("callmethod")
.annotate 'line', 648
    find_lex $P1794, "$/"
    find_lex $P1795, "$past"
    $P1796 = $P1794."!make"($P1795)
.annotate 'line', 644
    .return ($P1796)
  control_1767:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1797, exception, "payload"
    .return ($P1797)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("99_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1801
.annotate 'line', 653
    new $P1800, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1800, control_1799
    push_eh $P1800
    .lex "self", self
    .lex "$/", param_1801
.annotate 'line', 654
    find_lex $P1802, "$/"
    get_hll_global $P1803, ["PAST"], "Var"
    $P1804 = $P1803."new"("self" :named("name"))
    $P1805 = $P1802."!make"($P1804)
.annotate 'line', 653
    .return ($P1805)
  control_1799:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1806, exception, "payload"
    .return ($P1806)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("100_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1810
.annotate 'line', 657
    new $P1809, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1809, control_1808
    push_eh $P1809
    .lex "self", self
    .lex "$/", param_1810
.annotate 'line', 658
    new $P1811, "Undef"
    .lex "$past", $P1811
    find_lex $P1812, "$/"
    unless_null $P1812, vivify_564
    $P1812 = root_new ['parrot';'Hash']
  vivify_564:
    set $P1813, $P1812["args"]
    unless_null $P1813, vivify_565
    new $P1813, "Undef"
  vivify_565:
    $P1814 = $P1813."ast"()
    store_lex "$past", $P1814
.annotate 'line', 659
    find_lex $P1815, "$past"
    find_lex $P1816, "$/"
    unless_null $P1816, vivify_566
    $P1816 = root_new ['parrot';'Hash']
  vivify_566:
    set $P1817, $P1816["deflongname"]
    unless_null $P1817, vivify_567
    new $P1817, "Undef"
  vivify_567:
    set $S1818, $P1817
    $P1815."name"($S1818)
.annotate 'line', 660
    find_lex $P1819, "$/"
    find_lex $P1820, "$past"
    $P1821 = $P1819."!make"($P1820)
.annotate 'line', 657
    .return ($P1821)
  control_1808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1822, exception, "payload"
    .return ($P1822)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("101_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1826
.annotate 'line', 663
    new $P1825, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1825, control_1824
    push_eh $P1825
    .lex "self", self
    .lex "$/", param_1826
.annotate 'line', 664
    $P1827 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1827
.annotate 'line', 665
    new $P1828, "Undef"
    .lex "$name", $P1828
.annotate 'line', 667
    new $P1829, "Undef"
    .lex "$var", $P1829
.annotate 'line', 669
    new $P1830, "Undef"
    .lex "$past", $P1830
.annotate 'line', 664
    find_lex $P1831, "$/"
    unless_null $P1831, vivify_568
    $P1831 = root_new ['parrot';'Hash']
  vivify_568:
    set $P1832, $P1831["name"]
    unless_null $P1832, vivify_569
    $P1832 = root_new ['parrot';'Hash']
  vivify_569:
    set $P1833, $P1832["identifier"]
    unless_null $P1833, vivify_570
    new $P1833, "Undef"
  vivify_570:
    clone $P1834, $P1833
    store_lex "@ns", $P1834
.annotate 'line', 665
    find_lex $P1835, "@ns"
    $P1836 = $P1835."pop"()
    store_lex "$name", $P1836
.annotate 'line', 666
    find_lex $P1840, "@ns"
    if $P1840, if_1839
    set $P1838, $P1840
    goto if_1839_end
  if_1839:
    find_lex $P1841, "@ns"
    unless_null $P1841, vivify_571
    $P1841 = root_new ['parrot';'ResizablePMCArray']
  vivify_571:
    set $P1842, $P1841[0]
    unless_null $P1842, vivify_572
    new $P1842, "Undef"
  vivify_572:
    set $S1843, $P1842
    iseq $I1844, $S1843, "GLOBAL"
    new $P1838, 'Integer'
    set $P1838, $I1844
  if_1839_end:
    unless $P1838, if_1837_end
    find_lex $P1845, "@ns"
    $P1845."shift"()
  if_1837_end:
.annotate 'line', 668
    get_hll_global $P1846, ["PAST"], "Var"
    find_lex $P1847, "$name"
    set $S1848, $P1847
    find_lex $P1849, "@ns"
    $P1850 = $P1846."new"($S1848 :named("name"), $P1849 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1850
.annotate 'line', 669
    find_lex $P1851, "$var"
    store_lex "$past", $P1851
.annotate 'line', 670
    find_lex $P1853, "$/"
    unless_null $P1853, vivify_573
    $P1853 = root_new ['parrot';'Hash']
  vivify_573:
    set $P1854, $P1853["args"]
    unless_null $P1854, vivify_574
    new $P1854, "Undef"
  vivify_574:
    unless $P1854, if_1852_end
.annotate 'line', 671
    find_lex $P1855, "$/"
    unless_null $P1855, vivify_575
    $P1855 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1856, $P1855["args"]
    unless_null $P1856, vivify_576
    $P1856 = root_new ['parrot';'ResizablePMCArray']
  vivify_576:
    set $P1857, $P1856[0]
    unless_null $P1857, vivify_577
    new $P1857, "Undef"
  vivify_577:
    $P1858 = $P1857."ast"()
    store_lex "$past", $P1858
.annotate 'line', 672
    find_lex $P1859, "$past"
    find_lex $P1860, "$var"
    $P1859."unshift"($P1860)
  if_1852_end:
.annotate 'line', 674
    find_lex $P1861, "$/"
    find_lex $P1862, "$past"
    $P1863 = $P1861."!make"($P1862)
.annotate 'line', 663
    .return ($P1863)
  control_1824:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1864, exception, "payload"
    .return ($P1864)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("102_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1868
.annotate 'line', 677
    new $P1867, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1867, control_1866
    push_eh $P1867
    .lex "self", self
    .lex "$/", param_1868
.annotate 'line', 678
    new $P1869, "Undef"
    .lex "$past", $P1869
.annotate 'line', 679
    new $P1870, "Undef"
    .lex "$pirop", $P1870
.annotate 'line', 678
    find_lex $P1873, "$/"
    unless_null $P1873, vivify_578
    $P1873 = root_new ['parrot';'Hash']
  vivify_578:
    set $P1874, $P1873["args"]
    unless_null $P1874, vivify_579
    new $P1874, "Undef"
  vivify_579:
    if $P1874, if_1872
    get_hll_global $P1879, ["PAST"], "Op"
    find_lex $P1880, "$/"
    $P1881 = $P1879."new"($P1880 :named("node"))
    set $P1871, $P1881
    goto if_1872_end
  if_1872:
    find_lex $P1875, "$/"
    unless_null $P1875, vivify_580
    $P1875 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1876, $P1875["args"]
    unless_null $P1876, vivify_581
    $P1876 = root_new ['parrot';'ResizablePMCArray']
  vivify_581:
    set $P1877, $P1876[0]
    unless_null $P1877, vivify_582
    new $P1877, "Undef"
  vivify_582:
    $P1878 = $P1877."ast"()
    set $P1871, $P1878
  if_1872_end:
    store_lex "$past", $P1871
.annotate 'line', 679
    find_lex $P1882, "$/"
    unless_null $P1882, vivify_583
    $P1882 = root_new ['parrot';'Hash']
  vivify_583:
    set $P1883, $P1882["op"]
    unless_null $P1883, vivify_584
    new $P1883, "Undef"
  vivify_584:
    set $S1884, $P1883
    new $P1885, 'String'
    set $P1885, $S1884
    store_lex "$pirop", $P1885
.annotate 'line', 680

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1886 = box $S0
    
    store_lex "$pirop", $P1886
.annotate 'line', 687
    find_lex $P1887, "$past"
    find_lex $P1888, "$pirop"
    $P1887."pirop"($P1888)
.annotate 'line', 688
    find_lex $P1889, "$past"
    $P1889."pasttype"("pirop")
.annotate 'line', 689
    find_lex $P1890, "$/"
    find_lex $P1891, "$past"
    $P1892 = $P1890."!make"($P1891)
.annotate 'line', 677
    .return ($P1892)
  control_1866:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1893, exception, "payload"
    .return ($P1893)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("103_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1897
.annotate 'line', 692
    new $P1896, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1896, control_1895
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
    find_lex $P1898, "$/"
    find_lex $P1899, "$/"
    unless_null $P1899, vivify_585
    $P1899 = root_new ['parrot';'Hash']
  vivify_585:
    set $P1900, $P1899["arglist"]
    unless_null $P1900, vivify_586
    new $P1900, "Undef"
  vivify_586:
    $P1901 = $P1900."ast"()
    $P1902 = $P1898."!make"($P1901)
    .return ($P1902)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1903, exception, "payload"
    .return ($P1903)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("104_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_1907
.annotate 'line', 694
    .const 'Sub' $P1918 = "105_1297880748.74619" 
    capture_lex $P1918
    new $P1906, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1906, control_1905
    push_eh $P1906
    .lex "self", self
    .lex "$/", param_1907
.annotate 'line', 695
    new $P1908, "Undef"
    .lex "$past", $P1908
.annotate 'line', 703
    new $P1909, "Undef"
    .lex "$i", $P1909
.annotate 'line', 704
    new $P1910, "Undef"
    .lex "$n", $P1910
.annotate 'line', 695
    get_hll_global $P1911, ["PAST"], "Op"
    find_lex $P1912, "$/"
    $P1913 = $P1911."new"("call" :named("pasttype"), $P1912 :named("node"))
    store_lex "$past", $P1913
.annotate 'line', 696
    find_lex $P1915, "$/"
    unless_null $P1915, vivify_587
    $P1915 = root_new ['parrot';'Hash']
  vivify_587:
    set $P1916, $P1915["EXPR"]
    unless_null $P1916, vivify_588
    new $P1916, "Undef"
  vivify_588:
    unless $P1916, if_1914_end
    .const 'Sub' $P1918 = "105_1297880748.74619" 
    capture_lex $P1918
    $P1918()
  if_1914_end:
.annotate 'line', 703
    new $P1950, "Integer"
    assign $P1950, 0
    store_lex "$i", $P1950
.annotate 'line', 704
    find_lex $P1951, "$past"
    $P1952 = $P1951."list"()
    set $N1953, $P1952
    new $P1954, 'Float'
    set $P1954, $N1953
    store_lex "$n", $P1954
.annotate 'line', 705
    new $P2002, 'ExceptionHandler'
    set_addr $P2002, loop2001_handler
    $P2002."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2002
  loop2001_test:
    find_lex $P1955, "$i"
    set $N1956, $P1955
    find_lex $P1957, "$n"
    set $N1958, $P1957
    islt $I1959, $N1956, $N1958
    unless $I1959, loop2001_done
  loop2001_redo:
.annotate 'line', 706
    find_lex $P1961, "$i"
    set $I1962, $P1961
    find_lex $P1963, "$past"
    unless_null $P1963, vivify_592
    $P1963 = root_new ['parrot';'ResizablePMCArray']
  vivify_592:
    set $P1964, $P1963[$I1962]
    unless_null $P1964, vivify_593
    new $P1964, "Undef"
  vivify_593:
    $S1965 = $P1964."name"()
    iseq $I1966, $S1965, "&prefix:<|>"
    unless $I1966, if_1960_end
.annotate 'line', 707
    find_lex $P1967, "$i"
    set $I1968, $P1967
    find_lex $P1969, "$past"
    unless_null $P1969, vivify_594
    $P1969 = root_new ['parrot';'ResizablePMCArray']
  vivify_594:
    set $P1970, $P1969[$I1968]
    unless_null $P1970, vivify_595
    $P1970 = root_new ['parrot';'ResizablePMCArray']
  vivify_595:
    set $P1971, $P1970[0]
    unless_null $P1971, vivify_596
    new $P1971, "Undef"
  vivify_596:
    find_lex $P1972, "$i"
    set $I1973, $P1972
    find_lex $P1974, "$past"
    unless_null $P1974, vivify_597
    $P1974 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1974
  vivify_597:
    set $P1974[$I1973], $P1971
.annotate 'line', 708
    find_lex $P1975, "$i"
    set $I1976, $P1975
    find_lex $P1977, "$past"
    unless_null $P1977, vivify_598
    $P1977 = root_new ['parrot';'ResizablePMCArray']
  vivify_598:
    set $P1978, $P1977[$I1976]
    unless_null $P1978, vivify_599
    new $P1978, "Undef"
  vivify_599:
    $P1978."flat"(1)
.annotate 'line', 709
    find_lex $P1982, "$i"
    set $I1983, $P1982
    find_lex $P1984, "$past"
    unless_null $P1984, vivify_600
    $P1984 = root_new ['parrot';'ResizablePMCArray']
  vivify_600:
    set $P1985, $P1984[$I1983]
    unless_null $P1985, vivify_601
    new $P1985, "Undef"
  vivify_601:
    get_hll_global $P1986, ["PAST"], "Val"
    $P1987 = $P1985."isa"($P1986)
    if $P1987, if_1981
    set $P1980, $P1987
    goto if_1981_end
  if_1981:
.annotate 'line', 710
    find_lex $P1988, "$i"
    set $I1989, $P1988
    find_lex $P1990, "$past"
    unless_null $P1990, vivify_602
    $P1990 = root_new ['parrot';'ResizablePMCArray']
  vivify_602:
    set $P1991, $P1990[$I1989]
    unless_null $P1991, vivify_603
    new $P1991, "Undef"
  vivify_603:
    $S1992 = $P1991."name"()
    substr $S1993, $S1992, 0, 1
    iseq $I1994, $S1993, "%"
    new $P1980, 'Integer'
    set $P1980, $I1994
  if_1981_end:
    unless $P1980, if_1979_end
.annotate 'line', 711
    find_lex $P1995, "$i"
    set $I1996, $P1995
    find_lex $P1997, "$past"
    unless_null $P1997, vivify_604
    $P1997 = root_new ['parrot';'ResizablePMCArray']
  vivify_604:
    set $P1998, $P1997[$I1996]
    unless_null $P1998, vivify_605
    new $P1998, "Undef"
  vivify_605:
    $P1998."named"(1)
  if_1979_end:
  if_1960_end:
.annotate 'line', 706
    find_lex $P1999, "$i"
    clone $P2000, $P1999
    inc $P1999
  loop2001_next:
.annotate 'line', 705
    goto loop2001_test
  loop2001_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2003, exception, 'type'
    eq $P2003, .CONTROL_LOOP_NEXT, loop2001_next
    eq $P2003, .CONTROL_LOOP_REDO, loop2001_redo
  loop2001_done:
    pop_eh 
.annotate 'line', 716
    find_lex $P2004, "$/"
    find_lex $P2005, "$past"
    $P2006 = $P2004."!make"($P2005)
.annotate 'line', 694
    .return ($P2006)
  control_1905:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2007, exception, "payload"
    .return ($P2007)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1917"  :anon :subid("105_1297880748.74619") :outer("104_1297880748.74619")
.annotate 'line', 696
    .const 'Sub' $P1939 = "106_1297880748.74619" 
    capture_lex $P1939
.annotate 'line', 697
    new $P1919, "Undef"
    .lex "$expr", $P1919
    find_lex $P1920, "$/"
    unless_null $P1920, vivify_589
    $P1920 = root_new ['parrot';'Hash']
  vivify_589:
    set $P1921, $P1920["EXPR"]
    unless_null $P1921, vivify_590
    new $P1921, "Undef"
  vivify_590:
    $P1922 = $P1921."ast"()
    store_lex "$expr", $P1922
.annotate 'line', 698
    find_lex $P1927, "$expr"
    $S1928 = $P1927."name"()
    iseq $I1929, $S1928, "&infix:<,>"
    if $I1929, if_1926
    new $P1925, 'Integer'
    set $P1925, $I1929
    goto if_1926_end
  if_1926:
    find_lex $P1930, "$expr"
    $P1931 = $P1930."named"()
    isfalse $I1932, $P1931
    new $P1925, 'Integer'
    set $P1925, $I1932
  if_1926_end:
    if $P1925, if_1924
.annotate 'line', 701
    find_lex $P1947, "$past"
    find_lex $P1948, "$expr"
    $P1949 = $P1947."push"($P1948)
    set $P1923, $P1949
.annotate 'line', 698
    goto if_1924_end
  if_1924:
.annotate 'line', 699
    find_lex $P1934, "$expr"
    $P1935 = $P1934."list"()
    defined $I1936, $P1935
    unless $I1936, for_undef_591
    iter $P1933, $P1935
    new $P1945, 'ExceptionHandler'
    set_addr $P1945, loop1944_handler
    $P1945."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1945
  loop1944_test:
    unless $P1933, loop1944_done
    shift $P1937, $P1933
  loop1944_redo:
    .const 'Sub' $P1939 = "106_1297880748.74619" 
    capture_lex $P1939
    $P1939($P1937)
  loop1944_next:
    goto loop1944_test
  loop1944_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1946, exception, 'type'
    eq $P1946, .CONTROL_LOOP_NEXT, loop1944_next
    eq $P1946, .CONTROL_LOOP_REDO, loop1944_redo
  loop1944_done:
    pop_eh 
  for_undef_591:
.annotate 'line', 698
    set $P1923, $P1933
  if_1924_end:
.annotate 'line', 696
    .return ($P1923)
.end


.namespace ["NQP";"Actions"]
.sub "_block1938"  :anon :subid("106_1297880748.74619") :outer("105_1297880748.74619")
    .param pmc param_1940
.annotate 'line', 699
    .lex "$_", param_1940
    find_lex $P1941, "$past"
    find_lex $P1942, "$_"
    $P1943 = $P1941."push"($P1942)
    .return ($P1943)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("107_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2011
.annotate 'line', 720
    new $P2010, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2010, control_2009
    push_eh $P2010
    .lex "self", self
    .lex "$/", param_2011
    find_lex $P2012, "$/"
    find_lex $P2013, "$/"
    unless_null $P2013, vivify_606
    $P2013 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2014, $P2013["value"]
    unless_null $P2014, vivify_607
    new $P2014, "Undef"
  vivify_607:
    $P2015 = $P2014."ast"()
    $P2016 = $P2012."!make"($P2015)
    .return ($P2016)
  control_2009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2017, exception, "payload"
    .return ($P2017)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("108_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2021
.annotate 'line', 722
    new $P2020, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2020, control_2019
    push_eh $P2020
    .lex "self", self
    .lex "$/", param_2021
.annotate 'line', 723
    find_lex $P2022, "$/"
.annotate 'line', 724
    find_lex $P2025, "$/"
    unless_null $P2025, vivify_608
    $P2025 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2026, $P2025["EXPR"]
    unless_null $P2026, vivify_609
    new $P2026, "Undef"
  vivify_609:
    if $P2026, if_2024
.annotate 'line', 725
    get_hll_global $P2031, ["PAST"], "Op"
    find_lex $P2032, "$/"
    $P2033 = $P2031."new"("list" :named("pasttype"), $P2032 :named("node"))
    set $P2023, $P2033
.annotate 'line', 724
    goto if_2024_end
  if_2024:
    find_lex $P2027, "$/"
    unless_null $P2027, vivify_610
    $P2027 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2028, $P2027["EXPR"]
    unless_null $P2028, vivify_611
    $P2028 = root_new ['parrot';'ResizablePMCArray']
  vivify_611:
    set $P2029, $P2028[0]
    unless_null $P2029, vivify_612
    new $P2029, "Undef"
  vivify_612:
    $P2030 = $P2029."ast"()
    set $P2023, $P2030
  if_2024_end:
    $P2034 = $P2022."!make"($P2023)
.annotate 'line', 722
    .return ($P2034)
  control_2019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2035, exception, "payload"
    .return ($P2035)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("109_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2039
.annotate 'line', 728
    new $P2038, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2038, control_2037
    push_eh $P2038
    .lex "self", self
    .lex "$/", param_2039
.annotate 'line', 729
    new $P2040, "Undef"
    .lex "$past", $P2040
.annotate 'line', 728
    find_lex $P2041, "$past"
.annotate 'line', 730
    find_lex $P2043, "$/"
    unless_null $P2043, vivify_613
    $P2043 = root_new ['parrot';'Hash']
  vivify_613:
    set $P2044, $P2043["EXPR"]
    unless_null $P2044, vivify_614
    new $P2044, "Undef"
  vivify_614:
    if $P2044, if_2042
.annotate 'line', 737
    get_hll_global $P2056, ["PAST"], "Op"
    $P2057 = $P2056."new"("list" :named("pasttype"))
    store_lex "$past", $P2057
.annotate 'line', 736
    goto if_2042_end
  if_2042:
.annotate 'line', 731
    find_lex $P2045, "$/"
    unless_null $P2045, vivify_615
    $P2045 = root_new ['parrot';'Hash']
  vivify_615:
    set $P2046, $P2045["EXPR"]
    unless_null $P2046, vivify_616
    $P2046 = root_new ['parrot';'ResizablePMCArray']
  vivify_616:
    set $P2047, $P2046[0]
    unless_null $P2047, vivify_617
    new $P2047, "Undef"
  vivify_617:
    $P2048 = $P2047."ast"()
    store_lex "$past", $P2048
.annotate 'line', 732
    find_lex $P2050, "$past"
    $S2051 = $P2050."name"()
    isne $I2052, $S2051, "&infix:<,>"
    unless $I2052, if_2049_end
.annotate 'line', 733
    get_hll_global $P2053, ["PAST"], "Op"
    find_lex $P2054, "$past"
    $P2055 = $P2053."new"($P2054, "list" :named("pasttype"))
    store_lex "$past", $P2055
  if_2049_end:
  if_2042_end:
.annotate 'line', 739
    find_lex $P2058, "$past"
    $P2058."name"("&circumfix:<[ ]>")
.annotate 'line', 740
    find_lex $P2059, "$/"
    find_lex $P2060, "$past"
    $P2061 = $P2059."!make"($P2060)
.annotate 'line', 728
    .return ($P2061)
  control_2037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2062, exception, "payload"
    .return ($P2062)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("110_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2066
.annotate 'line', 743
    new $P2065, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2065, control_2064
    push_eh $P2065
    .lex "self", self
    .lex "$/", param_2066
    find_lex $P2067, "$/"
    find_lex $P2068, "$/"
    unless_null $P2068, vivify_618
    $P2068 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2069, $P2068["quote_EXPR"]
    unless_null $P2069, vivify_619
    new $P2069, "Undef"
  vivify_619:
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
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("111_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2076
.annotate 'line', 744
    new $P2075, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2075, control_2074
    push_eh $P2075
    .lex "self", self
    .lex "$/", param_2076
    find_lex $P2077, "$/"
    find_lex $P2078, "$/"
    unless_null $P2078, vivify_620
    $P2078 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2079, $P2078["quote_EXPR"]
    unless_null $P2079, vivify_621
    new $P2079, "Undef"
  vivify_621:
    $P2080 = $P2079."ast"()
    $P2081 = $P2077."!make"($P2080)
    .return ($P2081)
  control_2074:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2082, exception, "payload"
    .return ($P2082)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("112_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2086
.annotate 'line', 746
    new $P2085, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2085, control_2084
    push_eh $P2085
    .lex "self", self
    .lex "$/", param_2086
.annotate 'line', 747
    new $P2087, "Undef"
    .lex "$past", $P2087
    find_lex $P2090, "$/"
    unless_null $P2090, vivify_622
    $P2090 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2091, $P2090["pblock"]
    unless_null $P2091, vivify_623
    $P2091 = root_new ['parrot';'Hash']
  vivify_623:
    set $P2092, $P2091["blockoid"]
    unless_null $P2092, vivify_624
    $P2092 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2093, $P2092["statementlist"]
    unless_null $P2093, vivify_625
    $P2093 = root_new ['parrot';'Hash']
  vivify_625:
    set $P2094, $P2093["statement"]
    unless_null $P2094, vivify_626
    new $P2094, "Undef"
  vivify_626:
    set $N2095, $P2094
    isgt $I2096, $N2095, 0.0
    if $I2096, if_2089
.annotate 'line', 749
    $P2100 = "vivitype"("%")
    set $P2088, $P2100
.annotate 'line', 747
    goto if_2089_end
  if_2089:
.annotate 'line', 748
    find_lex $P2097, "$/"
    unless_null $P2097, vivify_627
    $P2097 = root_new ['parrot';'Hash']
  vivify_627:
    set $P2098, $P2097["pblock"]
    unless_null $P2098, vivify_628
    new $P2098, "Undef"
  vivify_628:
    $P2099 = $P2098."ast"()
    set $P2088, $P2099
  if_2089_end:
    store_lex "$past", $P2088
.annotate 'line', 750
    new $P2101, "Integer"
    assign $P2101, 1
    find_lex $P2102, "$past"
    unless_null $P2102, vivify_629
    $P2102 = root_new ['parrot';'Hash']
    store_lex "$past", $P2102
  vivify_629:
    set $P2102["bareblock"], $P2101
.annotate 'line', 751
    find_lex $P2103, "$/"
    find_lex $P2104, "$past"
    $P2105 = $P2103."!make"($P2104)
.annotate 'line', 746
    .return ($P2105)
  control_2084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2106, exception, "payload"
    .return ($P2106)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("113_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2110
.annotate 'line', 754
    new $P2109, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2109, control_2108
    push_eh $P2109
    .lex "self", self
    .lex "$/", param_2110
.annotate 'line', 755
    new $P2111, "Undef"
    .lex "$name", $P2111
    find_lex $P2114, "$/"
    unless_null $P2114, vivify_630
    $P2114 = root_new ['parrot';'Hash']
  vivify_630:
    set $P2115, $P2114["sigil"]
    unless_null $P2115, vivify_631
    new $P2115, "Undef"
  vivify_631:
    set $S2116, $P2115
    iseq $I2117, $S2116, "@"
    if $I2117, if_2113
.annotate 'line', 756
    find_lex $P2121, "$/"
    unless_null $P2121, vivify_632
    $P2121 = root_new ['parrot';'Hash']
  vivify_632:
    set $P2122, $P2121["sigil"]
    unless_null $P2122, vivify_633
    new $P2122, "Undef"
  vivify_633:
    set $S2123, $P2122
    iseq $I2124, $S2123, "%"
    if $I2124, if_2120
    new $P2126, "String"
    assign $P2126, "item"
    set $P2119, $P2126
    goto if_2120_end
  if_2120:
    new $P2125, "String"
    assign $P2125, "hash"
    set $P2119, $P2125
  if_2120_end:
    set $P2112, $P2119
.annotate 'line', 755
    goto if_2113_end
  if_2113:
    new $P2118, "String"
    assign $P2118, "list"
    set $P2112, $P2118
  if_2113_end:
    store_lex "$name", $P2112
.annotate 'line', 758
    find_lex $P2127, "$/"
    get_hll_global $P2128, ["PAST"], "Op"
    find_lex $P2129, "$name"
    find_lex $P2130, "$/"
    unless_null $P2130, vivify_634
    $P2130 = root_new ['parrot';'Hash']
  vivify_634:
    set $P2131, $P2130["semilist"]
    unless_null $P2131, vivify_635
    new $P2131, "Undef"
  vivify_635:
    $P2132 = $P2131."ast"()
    $P2133 = $P2128."new"($P2132, "callmethod" :named("pasttype"), $P2129 :named("name"))
    $P2134 = $P2127."!make"($P2133)
.annotate 'line', 754
    .return ($P2134)
  control_2108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2135, exception, "payload"
    .return ($P2135)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("114_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2139
.annotate 'line', 761
    new $P2138, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2138, control_2137
    push_eh $P2138
    .lex "self", self
    .lex "$/", param_2139
    find_lex $P2140, "$/"
    find_lex $P2141, "$/"
    unless_null $P2141, vivify_636
    $P2141 = root_new ['parrot';'Hash']
  vivify_636:
    set $P2142, $P2141["statement"]
    unless_null $P2142, vivify_637
    new $P2142, "Undef"
  vivify_637:
    $P2143 = $P2142."ast"()
    $P2144 = $P2140."!make"($P2143)
    .return ($P2144)
  control_2137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2145, exception, "payload"
    .return ($P2145)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("115_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2149
.annotate 'line', 763
    new $P2148, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2148, control_2147
    push_eh $P2148
    .lex "self", self
    .lex "$/", param_2149
.annotate 'line', 764
    find_lex $P2150, "$/"
    get_hll_global $P2151, ["PAST"], "Var"
    find_lex $P2152, "$/"
    unless_null $P2152, vivify_638
    $P2152 = root_new ['parrot';'Hash']
  vivify_638:
    set $P2153, $P2152["EXPR"]
    unless_null $P2153, vivify_639
    new $P2153, "Undef"
  vivify_639:
    $P2154 = $P2153."ast"()
.annotate 'line', 766
    $P2155 = "vivitype"("@")
    $P2156 = $P2151."new"($P2154, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2155 :named("vivibase"))
.annotate 'line', 764
    $P2157 = $P2150."!make"($P2156)
.annotate 'line', 763
    .return ($P2157)
  control_2147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2158, exception, "payload"
    .return ($P2158)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("116_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2162
.annotate 'line', 769
    new $P2161, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2161, control_2160
    push_eh $P2161
    .lex "self", self
    .lex "$/", param_2162
.annotate 'line', 770
    find_lex $P2163, "$/"
    get_hll_global $P2164, ["PAST"], "Var"
    find_lex $P2165, "$/"
    unless_null $P2165, vivify_640
    $P2165 = root_new ['parrot';'Hash']
  vivify_640:
    set $P2166, $P2165["EXPR"]
    unless_null $P2166, vivify_641
    new $P2166, "Undef"
  vivify_641:
    $P2167 = $P2166."ast"()
.annotate 'line', 772
    $P2168 = "vivitype"("%")
    $P2169 = $P2164."new"($P2167, "keyed" :named("scope"), "Undef" :named("viviself"), $P2168 :named("vivibase"))
.annotate 'line', 770
    $P2170 = $P2163."!make"($P2169)
.annotate 'line', 769
    .return ($P2170)
  control_2160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2171, exception, "payload"
    .return ($P2171)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("117_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2175
.annotate 'line', 775
    new $P2174, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2174, control_2173
    push_eh $P2174
    .lex "self", self
    .lex "$/", param_2175
.annotate 'line', 776
    find_lex $P2176, "$/"
    get_hll_global $P2177, ["PAST"], "Var"
    find_lex $P2178, "$/"
    unless_null $P2178, vivify_642
    $P2178 = root_new ['parrot';'Hash']
  vivify_642:
    set $P2179, $P2178["quote_EXPR"]
    unless_null $P2179, vivify_643
    new $P2179, "Undef"
  vivify_643:
    $P2180 = $P2179."ast"()
.annotate 'line', 778
    $P2181 = "vivitype"("%")
    $P2182 = $P2177."new"($P2180, "keyed" :named("scope"), "Undef" :named("viviself"), $P2181 :named("vivibase"))
.annotate 'line', 776
    $P2183 = $P2176."!make"($P2182)
.annotate 'line', 775
    .return ($P2183)
  control_2173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2184, exception, "payload"
    .return ($P2184)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("118_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2188
.annotate 'line', 781
    new $P2187, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2187, control_2186
    push_eh $P2187
    .lex "self", self
    .lex "$/", param_2188
.annotate 'line', 782
    find_lex $P2189, "$/"
    find_lex $P2190, "$/"
    unless_null $P2190, vivify_644
    $P2190 = root_new ['parrot';'Hash']
  vivify_644:
    set $P2191, $P2190["arglist"]
    unless_null $P2191, vivify_645
    new $P2191, "Undef"
  vivify_645:
    $P2192 = $P2191."ast"()
    $P2193 = $P2189."!make"($P2192)
.annotate 'line', 781
    .return ($P2193)
  control_2186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2194, exception, "payload"
    .return ($P2194)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("119_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2198
.annotate 'line', 785
    new $P2197, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2197, control_2196
    push_eh $P2197
    .lex "self", self
    .lex "$/", param_2198
.annotate 'line', 786
    find_lex $P2199, "$/"
    find_lex $P2202, "$/"
    unless_null $P2202, vivify_646
    $P2202 = root_new ['parrot';'Hash']
  vivify_646:
    set $P2203, $P2202["quote"]
    unless_null $P2203, vivify_647
    new $P2203, "Undef"
  vivify_647:
    if $P2203, if_2201
    find_lex $P2207, "$/"
    unless_null $P2207, vivify_648
    $P2207 = root_new ['parrot';'Hash']
  vivify_648:
    set $P2208, $P2207["number"]
    unless_null $P2208, vivify_649
    new $P2208, "Undef"
  vivify_649:
    $P2209 = $P2208."ast"()
    set $P2200, $P2209
    goto if_2201_end
  if_2201:
    find_lex $P2204, "$/"
    unless_null $P2204, vivify_650
    $P2204 = root_new ['parrot';'Hash']
  vivify_650:
    set $P2205, $P2204["quote"]
    unless_null $P2205, vivify_651
    new $P2205, "Undef"
  vivify_651:
    $P2206 = $P2205."ast"()
    set $P2200, $P2206
  if_2201_end:
    $P2210 = $P2199."!make"($P2200)
.annotate 'line', 785
    .return ($P2210)
  control_2196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2211, exception, "payload"
    .return ($P2211)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("120_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2215
.annotate 'line', 789
    new $P2214, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2214, control_2213
    push_eh $P2214
    .lex "self", self
    .lex "$/", param_2215
.annotate 'line', 790
    new $P2216, "Undef"
    .lex "$value", $P2216
    find_lex $P2219, "$/"
    unless_null $P2219, vivify_652
    $P2219 = root_new ['parrot';'Hash']
  vivify_652:
    set $P2220, $P2219["dec_number"]
    unless_null $P2220, vivify_653
    new $P2220, "Undef"
  vivify_653:
    if $P2220, if_2218
    find_lex $P2224, "$/"
    unless_null $P2224, vivify_654
    $P2224 = root_new ['parrot';'Hash']
  vivify_654:
    set $P2225, $P2224["integer"]
    unless_null $P2225, vivify_655
    new $P2225, "Undef"
  vivify_655:
    $P2226 = $P2225."ast"()
    set $P2217, $P2226
    goto if_2218_end
  if_2218:
    find_lex $P2221, "$/"
    unless_null $P2221, vivify_656
    $P2221 = root_new ['parrot';'Hash']
  vivify_656:
    set $P2222, $P2221["dec_number"]
    unless_null $P2222, vivify_657
    new $P2222, "Undef"
  vivify_657:
    $P2223 = $P2222."ast"()
    set $P2217, $P2223
  if_2218_end:
    store_lex "$value", $P2217
.annotate 'line', 791
    find_lex $P2228, "$/"
    unless_null $P2228, vivify_658
    $P2228 = root_new ['parrot';'Hash']
  vivify_658:
    set $P2229, $P2228["sign"]
    unless_null $P2229, vivify_659
    new $P2229, "Undef"
  vivify_659:
    set $S2230, $P2229
    iseq $I2231, $S2230, "-"
    unless $I2231, if_2227_end
    find_lex $P2232, "$value"
    neg $P2233, $P2232
    store_lex "$value", $P2233
  if_2227_end:
.annotate 'line', 792
    find_lex $P2234, "$/"
    get_hll_global $P2235, ["PAST"], "Val"
    find_lex $P2236, "$value"
    $P2237 = $P2235."new"($P2236 :named("value"))
    $P2238 = $P2234."!make"($P2237)
.annotate 'line', 789
    .return ($P2238)
  control_2213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2239, exception, "payload"
    .return ($P2239)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("121_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2243
.annotate 'line', 795
    new $P2242, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2242, control_2241
    push_eh $P2242
    .lex "self", self
    .lex "$/", param_2243
    find_lex $P2244, "$/"
    find_lex $P2245, "$/"
    unless_null $P2245, vivify_660
    $P2245 = root_new ['parrot';'Hash']
  vivify_660:
    set $P2246, $P2245["quote_EXPR"]
    unless_null $P2246, vivify_661
    new $P2246, "Undef"
  vivify_661:
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
.sub "quote:sym<dblq>"  :subid("122_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2253
.annotate 'line', 796
    new $P2252, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2252, control_2251
    push_eh $P2252
    .lex "self", self
    .lex "$/", param_2253
    find_lex $P2254, "$/"
    find_lex $P2255, "$/"
    unless_null $P2255, vivify_662
    $P2255 = root_new ['parrot';'Hash']
  vivify_662:
    set $P2256, $P2255["quote_EXPR"]
    unless_null $P2256, vivify_663
    new $P2256, "Undef"
  vivify_663:
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
.sub "quote:sym<qq>"  :subid("123_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2263
.annotate 'line', 797
    new $P2262, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2262, control_2261
    push_eh $P2262
    .lex "self", self
    .lex "$/", param_2263
    find_lex $P2264, "$/"
    find_lex $P2265, "$/"
    unless_null $P2265, vivify_664
    $P2265 = root_new ['parrot';'Hash']
  vivify_664:
    set $P2266, $P2265["quote_EXPR"]
    unless_null $P2266, vivify_665
    new $P2266, "Undef"
  vivify_665:
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
.sub "quote:sym<q>"  :subid("124_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2273
.annotate 'line', 798
    new $P2272, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2272, control_2271
    push_eh $P2272
    .lex "self", self
    .lex "$/", param_2273
    find_lex $P2274, "$/"
    find_lex $P2275, "$/"
    unless_null $P2275, vivify_666
    $P2275 = root_new ['parrot';'Hash']
  vivify_666:
    set $P2276, $P2275["quote_EXPR"]
    unless_null $P2276, vivify_667
    new $P2276, "Undef"
  vivify_667:
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
.sub "quote:sym<Q>"  :subid("125_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2283
.annotate 'line', 799
    new $P2282, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2282, control_2281
    push_eh $P2282
    .lex "self", self
    .lex "$/", param_2283
    find_lex $P2284, "$/"
    find_lex $P2285, "$/"
    unless_null $P2285, vivify_668
    $P2285 = root_new ['parrot';'Hash']
  vivify_668:
    set $P2286, $P2285["quote_EXPR"]
    unless_null $P2286, vivify_669
    new $P2286, "Undef"
  vivify_669:
    $P2287 = $P2286."ast"()
    $P2288 = $P2284."!make"($P2287)
    .return ($P2288)
  control_2281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2289, exception, "payload"
    .return ($P2289)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q:PIR>"  :subid("126_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2293
.annotate 'line', 800
    new $P2292, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2292, control_2291
    push_eh $P2292
    .lex "self", self
    .lex "$/", param_2293
.annotate 'line', 801
    find_lex $P2294, "$/"
    get_hll_global $P2295, ["PAST"], "Op"
    find_lex $P2296, "$/"
    unless_null $P2296, vivify_670
    $P2296 = root_new ['parrot';'Hash']
  vivify_670:
    set $P2297, $P2296["quote_EXPR"]
    unless_null $P2297, vivify_671
    new $P2297, "Undef"
  vivify_671:
    $P2298 = $P2297."ast"()
    $P2299 = $P2298."value"()
    find_lex $P2300, "$/"
    $P2301 = $P2295."new"($P2299 :named("inline"), "inline" :named("pasttype"), $P2300 :named("node"))
    $P2302 = $P2294."!make"($P2301)
.annotate 'line', 800
    .return ($P2302)
  control_2291:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2303, exception, "payload"
    .return ($P2303)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("127_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2307
    .param pmc param_2308 :optional
    .param int has_param_2308 :opt_flag
.annotate 'line', 806
    new $P2306, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2306, control_2305
    push_eh $P2306
    .lex "self", self
    .lex "$/", param_2307
    if has_param_2308, optparam_672
    new $P2309, "Undef"
    set param_2308, $P2309
  optparam_672:
    .lex "$key", param_2308
.annotate 'line', 816
    new $P2310, "Undef"
    .lex "$regex", $P2310
.annotate 'line', 818
    new $P2311, "Undef"
    .lex "$past", $P2311
.annotate 'line', 807
    find_lex $P2313, "$key"
    set $S2314, $P2313
    iseq $I2315, $S2314, "open"
    unless $I2315, if_2312_end
.annotate 'line', 808

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 812
    get_global $P2316, "@BLOCK"
    unless_null $P2316, vivify_673
    $P2316 = root_new ['parrot';'ResizablePMCArray']
  vivify_673:
    set $P2317, $P2316[0]
    unless_null $P2317, vivify_674
    new $P2317, "Undef"
  vivify_674:
    $P2317."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 813
    get_global $P2318, "@BLOCK"
    unless_null $P2318, vivify_675
    $P2318 = root_new ['parrot';'ResizablePMCArray']
  vivify_675:
    set $P2319, $P2318[0]
    unless_null $P2319, vivify_676
    new $P2319, "Undef"
  vivify_676:
    $P2319."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 814
    new $P2320, "Exception"
    set $P2320['type'], .CONTROL_RETURN
    new $P2321, "Integer"
    assign $P2321, 0
    setattribute $P2320, 'payload', $P2321
    throw $P2320
  if_2312_end:
.annotate 'line', 817
    get_hll_global $P2322, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2323, "$/"
    unless_null $P2323, vivify_677
    $P2323 = root_new ['parrot';'Hash']
  vivify_677:
    set $P2324, $P2323["p6regex"]
    unless_null $P2324, vivify_678
    new $P2324, "Undef"
  vivify_678:
    $P2325 = $P2324."ast"()
    get_global $P2326, "@BLOCK"
    $P2327 = $P2326."shift"()
    $P2328 = $P2322($P2325, $P2327)
    store_lex "$regex", $P2328
.annotate 'line', 819
    get_hll_global $P2329, ["PAST"], "Op"
.annotate 'line', 821
    get_hll_global $P2330, ["PAST"], "Var"
    new $P2331, "ResizablePMCArray"
    push $P2331, "Regex"
    $P2332 = $P2330."new"("Regex" :named("name"), $P2331 :named("namespace"), "package" :named("scope"))
    find_lex $P2333, "$regex"
    $P2334 = $P2329."new"($P2332, $P2333, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 819
    store_lex "$past", $P2334
.annotate 'line', 825
    find_lex $P2335, "$regex"
    find_lex $P2336, "$past"
    unless_null $P2336, vivify_679
    $P2336 = root_new ['parrot';'Hash']
    store_lex "$past", $P2336
  vivify_679:
    set $P2336["sink"], $P2335
.annotate 'line', 826
    find_lex $P2337, "$/"
    find_lex $P2338, "$past"
    $P2339 = $P2337."!make"($P2338)
.annotate 'line', 806
    .return ($P2339)
  control_2305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2340, exception, "payload"
    .return ($P2340)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("128_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2344
.annotate 'line', 829
    new $P2343, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2343, control_2342
    push_eh $P2343
    .lex "self", self
    .lex "$/", param_2344
    find_lex $P2345, "$/"
    find_lex $P2346, "$/"
    unless_null $P2346, vivify_680
    $P2346 = root_new ['parrot';'Hash']
  vivify_680:
    set $P2347, $P2346["variable"]
    unless_null $P2347, vivify_681
    new $P2347, "Undef"
  vivify_681:
    $P2348 = $P2347."ast"()
    $P2349 = $P2345."!make"($P2348)
    .return ($P2349)
  control_2342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2350, exception, "payload"
    .return ($P2350)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("129_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2354
.annotate 'line', 830
    new $P2353, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2353, control_2352
    push_eh $P2353
    .lex "self", self
    .lex "$/", param_2354
.annotate 'line', 831
    find_lex $P2355, "$/"
    get_hll_global $P2356, ["PAST"], "Op"
.annotate 'line', 832
    find_lex $P2357, "$/"
    unless_null $P2357, vivify_682
    $P2357 = root_new ['parrot';'Hash']
  vivify_682:
    set $P2358, $P2357["block"]
    unless_null $P2358, vivify_683
    new $P2358, "Undef"
  vivify_683:
    $P2359 = $P2358."ast"()
    $P2360 = "block_immediate"($P2359)
    find_lex $P2361, "$/"
    $P2362 = $P2356."new"($P2360, "set S*" :named("pirop"), $P2361 :named("node"))
.annotate 'line', 831
    $P2363 = $P2355."!make"($P2362)
.annotate 'line', 830
    .return ($P2363)
  control_2352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2364, exception, "payload"
    .return ($P2364)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("130_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2368
.annotate 'line', 835
    new $P2367, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2367, control_2366
    push_eh $P2367
    .lex "self", self
    .lex "$/", param_2368
    find_lex $P2369, "$/"
    $P2370 = $P2369."!make"("\e")
    .return ($P2370)
  control_2366:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2371, exception, "payload"
    .return ($P2371)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("131_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2375
.annotate 'line', 839
    new $P2374, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2374, control_2373
    push_eh $P2374
    .lex "self", self
    .lex "$/", param_2375
    find_lex $P2376, "$/"
    find_lex $P2377, "$/"
    unless_null $P2377, vivify_684
    $P2377 = root_new ['parrot';'Hash']
  vivify_684:
    set $P2378, $P2377["dotty"]
    unless_null $P2378, vivify_685
    new $P2378, "Undef"
  vivify_685:
    $P2379 = $P2378."ast"()
    $P2380 = $P2376."!make"($P2379)
    .return ($P2380)
  control_2373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2381, exception, "payload"
    .return ($P2381)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("132_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2385
.annotate 'line', 841
    new $P2384, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2384, control_2383
    push_eh $P2384
    .lex "self", self
    .lex "$/", param_2385
.annotate 'line', 842
    find_lex $P2386, "$/"
    get_hll_global $P2387, ["PAST"], "Op"
.annotate 'line', 843
    new $P2388, "ResizablePMCArray"
    push $P2388, "    clone %r, %0"
    push $P2388, "    inc %0"
    $P2389 = $P2387."new"("postfix:<++>" :named("name"), $P2388 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 842
    $P2390 = $P2386."!make"($P2389)
.annotate 'line', 841
    .return ($P2390)
  control_2383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2391, exception, "payload"
    .return ($P2391)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("133_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2395
.annotate 'line', 847
    new $P2394, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2394, control_2393
    push_eh $P2394
    .lex "self", self
    .lex "$/", param_2395
.annotate 'line', 848
    find_lex $P2396, "$/"
    get_hll_global $P2397, ["PAST"], "Op"
.annotate 'line', 849
    new $P2398, "ResizablePMCArray"
    push $P2398, "    clone %r, %0"
    push $P2398, "    dec %0"
    $P2399 = $P2397."new"("postfix:<-->" :named("name"), $P2398 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 848
    $P2400 = $P2396."!make"($P2399)
.annotate 'line', 847
    .return ($P2400)
  control_2393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2401, exception, "payload"
    .return ($P2401)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("134_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2405
.annotate 'line', 853
    new $P2404, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2404, control_2403
    push_eh $P2404
    .lex "self", self
    .lex "$/", param_2405
.annotate 'line', 854
    find_lex $P2406, "$/"
    get_hll_global $P2407, ["PAST"], "Op"
.annotate 'line', 855
    get_hll_global $P2408, ["PAST"], "Var"
    $P2409 = $P2408."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2410, "$/"
    $P2411 = $P2407."new"($P2409, "callmethod" :named("pasttype"), "!make" :named("name"), $P2410 :named("node"))
.annotate 'line', 854
    $P2412 = $P2406."!make"($P2411)
.annotate 'line', 853
    .return ($P2412)
  control_2403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2413, exception, "payload"
    .return ($P2413)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("135_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2418
.annotate 'line', 871
    new $P2417, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2417, control_2416
    push_eh $P2417
    .lex "self", self
    .lex "$/", param_2418
    find_lex $P2419, "$/"
    $P2420 = "control"($P2419, "CONTROL_LOOP_NEXT")
    .return ($P2420)
  control_2416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2421, exception, "payload"
    .return ($P2421)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("136_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2425
.annotate 'line', 872
    new $P2424, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2424, control_2423
    push_eh $P2424
    .lex "self", self
    .lex "$/", param_2425
    find_lex $P2426, "$/"
    $P2427 = "control"($P2426, "CONTROL_LOOP_LAST")
    .return ($P2427)
  control_2423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2428, exception, "payload"
    .return ($P2428)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("137_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2432
.annotate 'line', 873
    new $P2431, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2431, control_2430
    push_eh $P2431
    .lex "self", self
    .lex "$/", param_2432
    find_lex $P2433, "$/"
    $P2434 = "control"($P2433, "CONTROL_LOOP_REDO")
    .return ($P2434)
  control_2430:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2435, exception, "payload"
    .return ($P2435)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("138_1297880748.74619") :method :outer("11_1297880748.74619")
    .param pmc param_2439
.annotate 'line', 875
    new $P2438, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2438, control_2437
    push_eh $P2438
    .lex "self", self
    .lex "$/", param_2439
.annotate 'line', 876
    find_lex $P2440, "$/"
    get_hll_global $P2441, ["PAST"], "Op"
    find_lex $P2442, "$/"
    $P2443 = $P2441."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2442 :named("node"))
    $P2444 = $P2440."!make"($P2443)
.annotate 'line', 875
    .return ($P2444)
  control_2437:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2445, exception, "payload"
    .return ($P2445)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2446"  :subid("139_1297880748.74619") :outer("11_1297880748.74619")
.annotate 'line', 880
    .const 'Sub' $P2532 = "146_1297880748.74619" 
    capture_lex $P2532
    .const 'Sub' $P2519 = "145_1297880748.74619" 
    capture_lex $P2519
    .const 'Sub' $P2502 = "144_1297880748.74619" 
    capture_lex $P2502
    .const 'Sub' $P2489 = "143_1297880748.74619" 
    capture_lex $P2489
    .const 'Sub' $P2476 = "142_1297880748.74619" 
    capture_lex $P2476
    .const 'Sub' $P2463 = "141_1297880748.74619" 
    capture_lex $P2463
    .const 'Sub' $P2448 = "140_1297880748.74619" 
    capture_lex $P2448
.annotate 'line', 914
    .const 'Sub' $P2532 = "146_1297880748.74619" 
    newclosure $P2557, $P2532
.annotate 'line', 880
    .return ($P2557)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("140_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2451
.annotate 'line', 882
    new $P2450, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2450, control_2449
    push_eh $P2450
    .lex "self", self
    .lex "$/", param_2451
.annotate 'line', 883
    new $P2452, "Undef"
    .lex "$past", $P2452
    find_lex $P2453, "$/"
    unless_null $P2453, vivify_686
    $P2453 = root_new ['parrot';'Hash']
  vivify_686:
    set $P2454, $P2453["statement"]
    unless_null $P2454, vivify_687
    new $P2454, "Undef"
  vivify_687:
    $P2455 = $P2454."ast"()
    store_lex "$past", $P2455
.annotate 'line', 884
    find_lex $P2456, "$/"
    get_hll_global $P2457, ["PAST"], "Regex"
    find_lex $P2458, "$past"
    find_lex $P2459, "$/"
    $P2460 = $P2457."new"($P2458, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P2459 :named("node"))
    $P2461 = $P2456."!make"($P2460)
.annotate 'line', 882
    .return ($P2461)
  control_2449:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2462, exception, "payload"
    .return ($P2462)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("141_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2466
.annotate 'line', 888
    new $P2465, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2465, control_2464
    push_eh $P2465
    .lex "self", self
    .lex "$/", param_2466
.annotate 'line', 889
    find_lex $P2467, "$/"
    get_hll_global $P2468, ["PAST"], "Regex"
    find_lex $P2469, "$/"
    unless_null $P2469, vivify_688
    $P2469 = root_new ['parrot';'Hash']
  vivify_688:
    set $P2470, $P2469["codeblock"]
    unless_null $P2470, vivify_689
    new $P2470, "Undef"
  vivify_689:
    $P2471 = $P2470."ast"()
    find_lex $P2472, "$/"
    $P2473 = $P2468."new"($P2471, "pastnode" :named("pasttype"), $P2472 :named("node"))
    $P2474 = $P2467."!make"($P2473)
.annotate 'line', 888
    .return ($P2474)
  control_2464:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2475, exception, "payload"
    .return ($P2475)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("142_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2479
.annotate 'line', 893
    new $P2478, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2478, control_2477
    push_eh $P2478
    .lex "self", self
    .lex "$/", param_2479
.annotate 'line', 894
    find_lex $P2480, "$/"
    get_hll_global $P2481, ["PAST"], "Regex"
    find_lex $P2482, "$/"
    unless_null $P2482, vivify_690
    $P2482 = root_new ['parrot';'Hash']
  vivify_690:
    set $P2483, $P2482["var"]
    unless_null $P2483, vivify_691
    new $P2483, "Undef"
  vivify_691:
    $P2484 = $P2483."ast"()
    find_lex $P2485, "$/"
    $P2486 = $P2481."new"("!INTERPOLATE", $P2484, "subrule" :named("pasttype"), "method" :named("subtype"), $P2485 :named("node"))
    $P2487 = $P2480."!make"($P2486)
.annotate 'line', 893
    .return ($P2487)
  control_2477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2488, exception, "payload"
    .return ($P2488)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("143_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2492
.annotate 'line', 898
    new $P2491, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2491, control_2490
    push_eh $P2491
    .lex "self", self
    .lex "$/", param_2492
.annotate 'line', 899
    find_lex $P2493, "$/"
    get_hll_global $P2494, ["PAST"], "Regex"
    find_lex $P2495, "$/"
    unless_null $P2495, vivify_692
    $P2495 = root_new ['parrot';'Hash']
  vivify_692:
    set $P2496, $P2495["codeblock"]
    unless_null $P2496, vivify_693
    new $P2496, "Undef"
  vivify_693:
    $P2497 = $P2496."ast"()
    find_lex $P2498, "$/"
    $P2499 = $P2494."new"("!INTERPOLATE_REGEX", $P2497, "subrule" :named("pasttype"), "method" :named("subtype"), $P2498 :named("node"))
    $P2500 = $P2493."!make"($P2499)
.annotate 'line', 898
    .return ($P2500)
  control_2490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2501, exception, "payload"
    .return ($P2501)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("144_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2505
.annotate 'line', 903
    new $P2504, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2504, control_2503
    push_eh $P2504
    .lex "self", self
    .lex "$/", param_2505
.annotate 'line', 904
    find_lex $P2506, "$/"
    get_hll_global $P2507, ["PAST"], "Regex"
    find_lex $P2508, "$/"
    unless_null $P2508, vivify_694
    $P2508 = root_new ['parrot';'Hash']
  vivify_694:
    set $P2509, $P2508["codeblock"]
    unless_null $P2509, vivify_695
    new $P2509, "Undef"
  vivify_695:
    $P2510 = $P2509."ast"()
.annotate 'line', 905
    find_lex $P2511, "$/"
    unless_null $P2511, vivify_696
    $P2511 = root_new ['parrot';'Hash']
  vivify_696:
    set $P2512, $P2511["zw"]
    unless_null $P2512, vivify_697
    new $P2512, "Undef"
  vivify_697:
    set $S2513, $P2512
    iseq $I2514, $S2513, "!"
    find_lex $P2515, "$/"
    $P2516 = $P2507."new"($P2510, "zerowidth" :named("subtype"), $I2514 :named("negate"), "pastnode" :named("pasttype"), $P2515 :named("node"))
.annotate 'line', 904
    $P2517 = $P2506."!make"($P2516)
.annotate 'line', 903
    .return ($P2517)
  control_2503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2518, exception, "payload"
    .return ($P2518)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("145_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2522
.annotate 'line', 909
    new $P2521, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2521, control_2520
    push_eh $P2521
    .lex "self", self
    .lex "$/", param_2522
.annotate 'line', 910
    find_lex $P2523, "$/"
    get_hll_global $P2524, ["PAST"], "Regex"
    find_lex $P2525, "$/"
    unless_null $P2525, vivify_698
    $P2525 = root_new ['parrot';'Hash']
  vivify_698:
    set $P2526, $P2525["var"]
    unless_null $P2526, vivify_699
    new $P2526, "Undef"
  vivify_699:
    $P2527 = $P2526."ast"()
    find_lex $P2528, "$/"
    $P2529 = $P2524."new"("!INTERPOLATE_REGEX", $P2527, "subrule" :named("pasttype"), "method" :named("subtype"), $P2528 :named("node"))
    $P2530 = $P2523."!make"($P2529)
.annotate 'line', 909
    .return ($P2530)
  control_2520:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2531, exception, "payload"
    .return ($P2531)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("146_1297880748.74619") :method :outer("139_1297880748.74619")
    .param pmc param_2535
.annotate 'line', 914
    new $P2534, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P2534, control_2533
    push_eh $P2534
    .lex "self", self
    .lex "$/", param_2535
.annotate 'line', 915
    new $P2536, "Undef"
    .lex "$block", $P2536
.annotate 'line', 917
    new $P2537, "Undef"
    .lex "$past", $P2537
.annotate 'line', 915
    find_lex $P2538, "$/"
    unless_null $P2538, vivify_700
    $P2538 = root_new ['parrot';'Hash']
  vivify_700:
    set $P2539, $P2538["block"]
    unless_null $P2539, vivify_701
    new $P2539, "Undef"
  vivify_701:
    $P2540 = $P2539."ast"()
    store_lex "$block", $P2540
.annotate 'line', 916
    find_lex $P2541, "$block"
    $P2541."blocktype"("immediate")
.annotate 'line', 918
    get_hll_global $P2542, ["PAST"], "Stmts"
.annotate 'line', 919
    get_hll_global $P2543, ["PAST"], "Op"
.annotate 'line', 920
    get_hll_global $P2544, ["PAST"], "Var"
    $P2545 = $P2544."new"("$/" :named("name"))
.annotate 'line', 921
    get_hll_global $P2546, ["PAST"], "Op"
.annotate 'line', 922
    get_hll_global $P2547, ["PAST"], "Var"
    $P2548 = $P2547."new"(unicode:"$\x{a2}" :named("name"))
    $P2549 = $P2546."new"($P2548, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 921
    $P2550 = $P2543."new"($P2545, $P2549, "bind" :named("pasttype"))
.annotate 'line', 919
    find_lex $P2551, "$block"
    $P2552 = $P2542."new"($P2550, $P2551)
.annotate 'line', 918
    store_lex "$past", $P2552
.annotate 'line', 930
    find_lex $P2553, "$/"
    find_lex $P2554, "$past"
    $P2555 = $P2553."!make"($P2554)
.annotate 'line', 914
    .return ($P2555)
  control_2533:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2556, exception, "payload"
    .return ($P2556)
.end


.namespace ["NQP";"Actions"]
.sub "_block2559" :load :anon :subid("147_1297880748.74619")
.annotate 'line', 3
    .const 'Sub' $P2561 = "11_1297880748.74619" 
    $P2562 = $P2561()
    .return ($P2562)
.end


.namespace []
.sub "_block2569" :load :anon :subid("149_1297880748.74619")
.annotate 'line', 1
    .const 'Sub' $P2571 = "10_1297880748.74619" 
    $P2572 = $P2571()
    .return ($P2572)
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
