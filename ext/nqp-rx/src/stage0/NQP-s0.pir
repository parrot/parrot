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
.sub "_block11"  :anon :subid("10_1283874336.57842")
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
    $P1423 = $P14()
.annotate 'line', 1
    .return ($P1423)
    .const 'Sub' $P1425 = "371_1283874336.57842" 
    .return ($P1425)
.end


.namespace []
.sub "" :load :init :subid("post372") :outer("10_1283874336.57842")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283874336.57842" 
    .local pmc block
    set block, $P12
    $P1428 = get_root_global ["parrot"], "P6metaclass"
    $P1428."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1283874336.57842") :outer("10_1283874336.57842")
.annotate 'line', 4
    get_hll_global $P1340, ["NQP";"Regex"], "_block1339" 
    capture_lex $P1340
    .const 'Sub' $P1326 = "348_1283874336.57842" 
    capture_lex $P1326
    .const 'Sub' $P1320 = "346_1283874336.57842" 
    capture_lex $P1320
    .const 'Sub' $P1314 = "344_1283874336.57842" 
    capture_lex $P1314
    .const 'Sub' $P1308 = "342_1283874336.57842" 
    capture_lex $P1308
    .const 'Sub' $P1302 = "340_1283874336.57842" 
    capture_lex $P1302
    .const 'Sub' $P1296 = "338_1283874336.57842" 
    capture_lex $P1296
    .const 'Sub' $P1289 = "336_1283874336.57842" 
    capture_lex $P1289
    .const 'Sub' $P1282 = "334_1283874336.57842" 
    capture_lex $P1282
    .const 'Sub' $P1275 = "332_1283874336.57842" 
    capture_lex $P1275
    .const 'Sub' $P1268 = "330_1283874336.57842" 
    capture_lex $P1268
    .const 'Sub' $P1262 = "328_1283874336.57842" 
    capture_lex $P1262
    .const 'Sub' $P1255 = "326_1283874336.57842" 
    capture_lex $P1255
    .const 'Sub' $P1248 = "324_1283874336.57842" 
    capture_lex $P1248
    .const 'Sub' $P1241 = "322_1283874336.57842" 
    capture_lex $P1241
    .const 'Sub' $P1234 = "320_1283874336.57842" 
    capture_lex $P1234
    .const 'Sub' $P1227 = "318_1283874336.57842" 
    capture_lex $P1227
    .const 'Sub' $P1220 = "316_1283874336.57842" 
    capture_lex $P1220
    .const 'Sub' $P1213 = "314_1283874336.57842" 
    capture_lex $P1213
    .const 'Sub' $P1206 = "312_1283874336.57842" 
    capture_lex $P1206
    .const 'Sub' $P1199 = "310_1283874336.57842" 
    capture_lex $P1199
    .const 'Sub' $P1192 = "308_1283874336.57842" 
    capture_lex $P1192
    .const 'Sub' $P1185 = "306_1283874336.57842" 
    capture_lex $P1185
    .const 'Sub' $P1178 = "304_1283874336.57842" 
    capture_lex $P1178
    .const 'Sub' $P1171 = "302_1283874336.57842" 
    capture_lex $P1171
    .const 'Sub' $P1164 = "300_1283874336.57842" 
    capture_lex $P1164
    .const 'Sub' $P1157 = "298_1283874336.57842" 
    capture_lex $P1157
    .const 'Sub' $P1150 = "296_1283874336.57842" 
    capture_lex $P1150
    .const 'Sub' $P1143 = "294_1283874336.57842" 
    capture_lex $P1143
    .const 'Sub' $P1136 = "292_1283874336.57842" 
    capture_lex $P1136
    .const 'Sub' $P1129 = "290_1283874336.57842" 
    capture_lex $P1129
    .const 'Sub' $P1122 = "288_1283874336.57842" 
    capture_lex $P1122
    .const 'Sub' $P1115 = "286_1283874336.57842" 
    capture_lex $P1115
    .const 'Sub' $P1108 = "284_1283874336.57842" 
    capture_lex $P1108
    .const 'Sub' $P1101 = "282_1283874336.57842" 
    capture_lex $P1101
    .const 'Sub' $P1094 = "280_1283874336.57842" 
    capture_lex $P1094
    .const 'Sub' $P1087 = "278_1283874336.57842" 
    capture_lex $P1087
    .const 'Sub' $P1080 = "276_1283874336.57842" 
    capture_lex $P1080
    .const 'Sub' $P1073 = "274_1283874336.57842" 
    capture_lex $P1073
    .const 'Sub' $P1066 = "272_1283874336.57842" 
    capture_lex $P1066
    .const 'Sub' $P1059 = "270_1283874336.57842" 
    capture_lex $P1059
    .const 'Sub' $P1053 = "268_1283874336.57842" 
    capture_lex $P1053
    .const 'Sub' $P1046 = "266_1283874336.57842" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "264_1283874336.57842" 
    capture_lex $P1039
    .const 'Sub' $P1032 = "262_1283874336.57842" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "260_1283874336.57842" 
    capture_lex $P1025
    .const 'Sub' $P1018 = "258_1283874336.57842" 
    capture_lex $P1018
    .const 'Sub' $P1011 = "256_1283874336.57842" 
    capture_lex $P1011
    .const 'Sub' $P1004 = "254_1283874336.57842" 
    capture_lex $P1004
    .const 'Sub' $P998 = "252_1283874336.57842" 
    capture_lex $P998
    .const 'Sub' $P992 = "250_1283874336.57842" 
    capture_lex $P992
    .const 'Sub' $P987 = "248_1283874336.57842" 
    capture_lex $P987
    .const 'Sub' $P981 = "246_1283874336.57842" 
    capture_lex $P981
    .const 'Sub' $P975 = "244_1283874336.57842" 
    capture_lex $P975
    .const 'Sub' $P970 = "242_1283874336.57842" 
    capture_lex $P970
    .const 'Sub' $P965 = "240_1283874336.57842" 
    capture_lex $P965
    .const 'Sub' $P957 = "238_1283874336.57842" 
    capture_lex $P957
    .const 'Sub' $P948 = "236_1283874336.57842" 
    capture_lex $P948
    .const 'Sub' $P943 = "234_1283874336.57842" 
    capture_lex $P943
    .const 'Sub' $P938 = "232_1283874336.57842" 
    capture_lex $P938
    .const 'Sub' $P933 = "230_1283874336.57842" 
    capture_lex $P933
    .const 'Sub' $P925 = "228_1283874336.57842" 
    capture_lex $P925
    .const 'Sub' $P917 = "226_1283874336.57842" 
    capture_lex $P917
    .const 'Sub' $P912 = "224_1283874336.57842" 
    capture_lex $P912
    .const 'Sub' $P907 = "222_1283874336.57842" 
    capture_lex $P907
    .const 'Sub' $P902 = "220_1283874336.57842" 
    capture_lex $P902
    .const 'Sub' $P896 = "218_1283874336.57842" 
    capture_lex $P896
    .const 'Sub' $P890 = "216_1283874336.57842" 
    capture_lex $P890
    .const 'Sub' $P884 = "214_1283874336.57842" 
    capture_lex $P884
    .const 'Sub' $P878 = "212_1283874336.57842" 
    capture_lex $P878
    .const 'Sub' $P872 = "210_1283874336.57842" 
    capture_lex $P872
    .const 'Sub' $P867 = "208_1283874336.57842" 
    capture_lex $P867
    .const 'Sub' $P862 = "206_1283874336.57842" 
    capture_lex $P862
    .const 'Sub' $P850 = "202_1283874336.57842" 
    capture_lex $P850
    .const 'Sub' $P842 = "200_1283874336.57842" 
    capture_lex $P842
    .const 'Sub' $P836 = "198_1283874336.57842" 
    capture_lex $P836
    .const 'Sub' $P829 = "196_1283874336.57842" 
    capture_lex $P829
    .const 'Sub' $P823 = "194_1283874336.57842" 
    capture_lex $P823
    .const 'Sub' $P815 = "192_1283874336.57842" 
    capture_lex $P815
    .const 'Sub' $P807 = "190_1283874336.57842" 
    capture_lex $P807
    .const 'Sub' $P801 = "188_1283874336.57842" 
    capture_lex $P801
    .const 'Sub' $P795 = "186_1283874336.57842" 
    capture_lex $P795
    .const 'Sub' $P781 = "182_1283874336.57842" 
    capture_lex $P781
    .const 'Sub' $P744 = "180_1283874336.57842" 
    capture_lex $P744
    .const 'Sub' $P735 = "178_1283874336.57842" 
    capture_lex $P735
    .const 'Sub' $P729 = "176_1283874336.57842" 
    capture_lex $P729
    .const 'Sub' $P719 = "174_1283874336.57842" 
    capture_lex $P719
    .const 'Sub' $P706 = "172_1283874336.57842" 
    capture_lex $P706
    .const 'Sub' $P699 = "170_1283874336.57842" 
    capture_lex $P699
    .const 'Sub' $P691 = "168_1283874336.57842" 
    capture_lex $P691
    .const 'Sub' $P681 = "166_1283874336.57842" 
    capture_lex $P681
    .const 'Sub' $P657 = "162_1283874336.57842" 
    capture_lex $P657
    .const 'Sub' $P634 = "160_1283874336.57842" 
    capture_lex $P634
    .const 'Sub' $P627 = "158_1283874336.57842" 
    capture_lex $P627
    .const 'Sub' $P620 = "156_1283874336.57842" 
    capture_lex $P620
    .const 'Sub' $P610 = "152_1283874336.57842" 
    capture_lex $P610
    .const 'Sub' $P602 = "150_1283874336.57842" 
    capture_lex $P602
    .const 'Sub' $P596 = "148_1283874336.57842" 
    capture_lex $P596
    .const 'Sub' $P583 = "146_1283874336.57842" 
    capture_lex $P583
    .const 'Sub' $P576 = "144_1283874336.57842" 
    capture_lex $P576
    .const 'Sub' $P569 = "142_1283874336.57842" 
    capture_lex $P569
    .const 'Sub' $P562 = "140_1283874336.57842" 
    capture_lex $P562
    .const 'Sub' $P535 = "136_1283874336.57842" 
    capture_lex $P535
    .const 'Sub' $P526 = "134_1283874336.57842" 
    capture_lex $P526
    .const 'Sub' $P519 = "132_1283874336.57842" 
    capture_lex $P519
    .const 'Sub' $P510 = "128_1283874336.57842" 
    capture_lex $P510
    .const 'Sub' $P505 = "126_1283874336.57842" 
    capture_lex $P505
    .const 'Sub' $P493 = "124_1283874336.57842" 
    capture_lex $P493
    .const 'Sub' $P481 = "122_1283874336.57842" 
    capture_lex $P481
    .const 'Sub' $P474 = "120_1283874336.57842" 
    capture_lex $P474
    .const 'Sub' $P469 = "118_1283874336.57842" 
    capture_lex $P469
    .const 'Sub' $P463 = "116_1283874336.57842" 
    capture_lex $P463
    .const 'Sub' $P457 = "114_1283874336.57842" 
    capture_lex $P457
    .const 'Sub' $P447 = "111_1283874336.57842" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1283874336.57842" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1283874336.57842" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1283874336.57842" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1283874336.57842" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1283874336.57842" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1283874336.57842" 
    capture_lex $P411
    .const 'Sub' $P402 = "97_1283874336.57842" 
    capture_lex $P402
    .const 'Sub' $P393 = "95_1283874336.57842" 
    capture_lex $P393
    .const 'Sub' $P384 = "93_1283874336.57842" 
    capture_lex $P384
    .const 'Sub' $P371 = "89_1283874336.57842" 
    capture_lex $P371
    .const 'Sub' $P362 = "87_1283874336.57842" 
    capture_lex $P362
    .const 'Sub' $P352 = "83_1283874336.57842" 
    capture_lex $P352
    .const 'Sub' $P345 = "81_1283874336.57842" 
    capture_lex $P345
    .const 'Sub' $P338 = "79_1283874336.57842" 
    capture_lex $P338
    .const 'Sub' $P326 = "75_1283874336.57842" 
    capture_lex $P326
    .const 'Sub' $P318 = "73_1283874336.57842" 
    capture_lex $P318
    .const 'Sub' $P310 = "71_1283874336.57842" 
    capture_lex $P310
    .const 'Sub' $P290 = "69_1283874336.57842" 
    capture_lex $P290
    .const 'Sub' $P281 = "67_1283874336.57842" 
    capture_lex $P281
    .const 'Sub' $P263 = "64_1283874336.57842" 
    capture_lex $P263
    .const 'Sub' $P245 = "62_1283874336.57842" 
    capture_lex $P245
    .const 'Sub' $P236 = "58_1283874336.57842" 
    capture_lex $P236
    .const 'Sub' $P231 = "56_1283874336.57842" 
    capture_lex $P231
    .const 'Sub' $P222 = "52_1283874336.57842" 
    capture_lex $P222
    .const 'Sub' $P217 = "50_1283874336.57842" 
    capture_lex $P217
    .const 'Sub' $P212 = "48_1283874336.57842" 
    capture_lex $P212
    .const 'Sub' $P203 = "46_1283874336.57842" 
    capture_lex $P203
    .const 'Sub' $P196 = "44_1283874336.57842" 
    capture_lex $P196
    .const 'Sub' $P190 = "42_1283874336.57842" 
    capture_lex $P190
    .const 'Sub' $P182 = "40_1283874336.57842" 
    capture_lex $P182
    .const 'Sub' $P176 = "38_1283874336.57842" 
    capture_lex $P176
    .const 'Sub' $P170 = "36_1283874336.57842" 
    capture_lex $P170
    .const 'Sub' $P155 = "33_1283874336.57842" 
    capture_lex $P155
    .const 'Sub' $P141 = "31_1283874336.57842" 
    capture_lex $P141
    .const 'Sub' $P134 = "29_1283874336.57842" 
    capture_lex $P134
    .const 'Sub' $P95 = "26_1283874336.57842" 
    capture_lex $P95
    .const 'Sub' $P80 = "23_1283874336.57842" 
    capture_lex $P80
    .const 'Sub' $P69 = "21_1283874336.57842" 
    capture_lex $P69
    .const 'Sub' $P57 = "19_1283874336.57842" 
    capture_lex $P57
    .const 'Sub' $P49 = "17_1283874336.57842" 
    capture_lex $P49
    .const 'Sub' $P42 = "15_1283874336.57842" 
    capture_lex $P42
    .const 'Sub' $P35 = "13_1283874336.57842" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1283874336.57842" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 567
    get_hll_global $P1340, ["NQP";"Regex"], "_block1339" 
    capture_lex $P1340
    $P1402 = $P1340()
.annotate 'line', 4
    .return ($P1402)
    .const 'Sub' $P1404 = "370_1283874336.57842" 
    .return ($P1404)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post373") :outer("11_1283874336.57842")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 448
    get_hll_global $P1407, ["NQP"], "Grammar"
    $P1407."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 449
    get_hll_global $P1408, ["NQP"], "Grammar"
    $P1408."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 450
    get_hll_global $P1409, ["NQP"], "Grammar"
    $P1409."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 451
    get_hll_global $P1410, ["NQP"], "Grammar"
    $P1410."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 452
    get_hll_global $P1411, ["NQP"], "Grammar"
    $P1411."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 453
    get_hll_global $P1412, ["NQP"], "Grammar"
    $P1412."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 454
    get_hll_global $P1413, ["NQP"], "Grammar"
    $P1413."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 455
    get_hll_global $P1414, ["NQP"], "Grammar"
    $P1414."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 456
    get_hll_global $P1415, ["NQP"], "Grammar"
    $P1415."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 457
    get_hll_global $P1416, ["NQP"], "Grammar"
    $P1416."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 458
    get_hll_global $P1417, ["NQP"], "Grammar"
    $P1417."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 459
    get_hll_global $P1418, ["NQP"], "Grammar"
    $P1418."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 460
    get_hll_global $P1419, ["NQP"], "Grammar"
    $P1419."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 461
    get_hll_global $P1420, ["NQP"], "Grammar"
    $P1420."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 462
    get_hll_global $P1421, ["NQP"], "Grammar"
    $P1421."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 447
    $P1422 = get_root_global ["parrot"], "P6metaclass"
    $P1422."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1283874336.57842") :method :outer("11_1283874336.57842")
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
    unless_null $P21, vivify_374
    get_hll_global $P21, "%LANG"
    unless_null $P21, vivify_375
    die "Contextual %*LANG not found"
  vivify_375:
  vivify_374:
.annotate 'line', 6
    get_hll_global $P22, ["NQP"], "Regex"
    find_lex $P23, "%*LANG"
    unless_null $P23, vivify_376
    get_hll_global $P23, "%LANG"
    unless_null $P23, vivify_377
    die "Contextual %*LANG not found"
  vivify_377:
    store_lex "%*LANG", $P23
  vivify_376:
    set $P23["Regex"], $P22
.annotate 'line', 7
    get_hll_global $P24, ["NQP"], "RegexActions"
    find_lex $P25, "%*LANG"
    unless_null $P25, vivify_378
    get_hll_global $P25, "%LANG"
    unless_null $P25, vivify_379
    die "Contextual %*LANG not found"
  vivify_379:
    store_lex "%*LANG", $P25
  vivify_378:
    set $P25["Regex-actions"], $P24
.annotate 'line', 8
    get_hll_global $P26, ["NQP"], "Grammar"
    find_lex $P27, "%*LANG"
    unless_null $P27, vivify_380
    get_hll_global $P27, "%LANG"
    unless_null $P27, vivify_381
    die "Contextual %*LANG not found"
  vivify_381:
    store_lex "%*LANG", $P27
  vivify_380:
    set $P27["MAIN"], $P26
.annotate 'line', 9
    get_hll_global $P28, ["NQP"], "Actions"
    find_lex $P29, "%*LANG"
    unless_null $P29, vivify_382
    get_hll_global $P29, "%LANG"
    unless_null $P29, vivify_383
    die "Contextual %*LANG not found"
  vivify_383:
    store_lex "%*LANG", $P29
  vivify_382:
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
.sub "identifier"  :subid("13_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx36_debug, debug_384
    rx36_cur."!cursor_debug"("START", "identifier")
  debug_384:
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
    if_null rx36_debug, debug_385
    rx36_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx36_pos)
  debug_385:
    .return (rx36_cur)
  rx36_restart:
.annotate 'line', 4
    if_null rx36_debug, debug_386
    rx36_cur."!cursor_debug"("NEXT", "identifier")
  debug_386:
  rx36_fail:
    (rx36_rep, rx36_pos, $I10, $P10) = rx36_cur."!mark_fail"(0)
    lt rx36_pos, -1, rx36_done
    eq rx36_pos, -1, rx36_fail
    jump $I10
  rx36_done:
    rx36_cur."!cursor_fail"()
    if_null rx36_debug, debug_387
    rx36_cur."!cursor_debug"("FAIL", "identifier")
  debug_387:
    .return (rx36_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__identifier"  :subid("14_1283874336.57842") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx43_debug, debug_388
    rx43_cur."!cursor_debug"("START", "name")
  debug_388:
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
    if_null rx43_debug, debug_389
    rx43_cur."!cursor_debug"("PASS", "name", " at pos=", rx43_pos)
  debug_389:
    .return (rx43_cur)
  rx43_restart:
.annotate 'line', 4
    if_null rx43_debug, debug_390
    rx43_cur."!cursor_debug"("NEXT", "name")
  debug_390:
  rx43_fail:
    (rx43_rep, rx43_pos, $I10, $P10) = rx43_cur."!mark_fail"(0)
    lt rx43_pos, -1, rx43_done
    eq rx43_pos, -1, rx43_fail
    jump $I10
  rx43_done:
    rx43_cur."!cursor_fail"()
    if_null rx43_debug, debug_391
    rx43_cur."!cursor_debug"("FAIL", "name")
  debug_391:
    .return (rx43_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1283874336.57842") :method
.annotate 'line', 4
    new $P45, "ResizablePMCArray"
    push $P45, ""
    .return ($P45)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx50_debug, debug_392
    rx50_cur."!cursor_debug"("START", "deflongname")
  debug_392:
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
    if_null rx50_debug, debug_393
    rx50_cur."!cursor_debug"("PASS", "deflongname", " at pos=", rx50_pos)
  debug_393:
    .return (rx50_cur)
  rx50_restart:
.annotate 'line', 4
    if_null rx50_debug, debug_394
    rx50_cur."!cursor_debug"("NEXT", "deflongname")
  debug_394:
  rx50_fail:
    (rx50_rep, rx50_pos, $I10, $P10) = rx50_cur."!mark_fail"(0)
    lt rx50_pos, -1, rx50_done
    eq rx50_pos, -1, rx50_fail
    jump $I10
  rx50_done:
    rx50_cur."!cursor_fail"()
    if_null rx50_debug, debug_395
    rx50_cur."!cursor_debug"("FAIL", "deflongname")
  debug_395:
    .return (rx50_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1283874336.57842") :method
.annotate 'line', 4
    $P52 = self."!PREFIX__!subrule"("identifier", "")
    new $P53, "ResizablePMCArray"
    push $P53, $P52
    .return ($P53)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx58_debug, debug_396
    rx58_cur."!cursor_debug"("START", "ENDSTMT")
  debug_396:
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
    if_null rx58_debug, debug_397
    rx58_cur."!cursor_debug"("PASS", "ENDSTMT", " at pos=", rx58_pos)
  debug_397:
    .return (rx58_cur)
  rx58_restart:
.annotate 'line', 4
    if_null rx58_debug, debug_398
    rx58_cur."!cursor_debug"("NEXT", "ENDSTMT")
  debug_398:
  rx58_fail:
    (rx58_rep, rx58_pos, $I10, $P10) = rx58_cur."!mark_fail"(0)
    lt rx58_pos, -1, rx58_done
    eq rx58_pos, -1, rx58_fail
    jump $I10
  rx58_done:
    rx58_cur."!cursor_fail"()
    if_null rx58_debug, debug_399
    rx58_cur."!cursor_debug"("FAIL", "ENDSTMT")
  debug_399:
    .return (rx58_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1283874336.57842") :method
.annotate 'line', 4
    new $P60, "ResizablePMCArray"
    push $P60, ""
    .return ($P60)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx70_debug, debug_400
    rx70_cur."!cursor_debug"("START", "ws")
  debug_400:
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
    if_null rx70_debug, debug_401
    rx70_cur."!cursor_debug"("PASS", "ws", " at pos=", rx70_pos)
  debug_401:
    .return (rx70_cur)
  rx70_restart:
.annotate 'line', 4
    if_null rx70_debug, debug_402
    rx70_cur."!cursor_debug"("NEXT", "ws")
  debug_402:
  rx70_fail:
    (rx70_rep, rx70_pos, $I10, $P10) = rx70_cur."!mark_fail"(0)
    lt rx70_pos, -1, rx70_done
    eq rx70_pos, -1, rx70_fail
    jump $I10
  rx70_done:
    rx70_cur."!cursor_fail"()
    if_null rx70_debug, debug_403
    rx70_cur."!cursor_debug"("FAIL", "ws")
  debug_403:
    .return (rx70_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1283874336.57842") :method
.annotate 'line', 4
    new $P72, "ResizablePMCArray"
    push $P72, ""
    push $P72, ""
    .return ($P72)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P88 = "25_1283874336.57842" 
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
    if_null rx81_debug, debug_404
    rx81_cur."!cursor_debug"("START", "unv")
  debug_404:
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
    .const 'Sub' $P88 = "25_1283874336.57842" 
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
    if_null rx81_debug, debug_409
    rx81_cur."!cursor_debug"("PASS", "unv", " at pos=", rx81_pos)
  debug_409:
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 4
    if_null rx81_debug, debug_410
    rx81_cur."!cursor_debug"("NEXT", "unv")
  debug_410:
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    if_null rx81_debug, debug_411
    rx81_cur."!cursor_debug"("FAIL", "unv")
  debug_411:
    .return (rx81_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1283874336.57842") :method
.annotate 'line', 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block87"  :anon :subid("25_1283874336.57842") :method :outer("23_1283874336.57842")
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
    if_null rx89_debug, debug_405
    rx89_cur."!cursor_debug"("START", "")
  debug_405:
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
    if_null rx89_debug, debug_406
    rx89_cur."!cursor_debug"("PASS", "", " at pos=", rx89_pos)
  debug_406:
    .return (rx89_cur)
  rx89_restart:
    if_null rx89_debug, debug_407
    rx89_cur."!cursor_debug"("NEXT", "")
  debug_407:
  rx89_fail:
    (rx89_rep, rx89_pos, $I10, $P10) = rx89_cur."!mark_fail"(0)
    lt rx89_pos, -1, rx89_done
    eq rx89_pos, -1, rx89_fail
    jump $I10
  rx89_done:
    rx89_cur."!cursor_fail"()
    if_null rx89_debug, debug_408
    rx89_cur."!cursor_debug"("FAIL", "")
  debug_408:
    .return (rx89_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P127 = "28_1283874336.57842" 
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
    if_null rx96_debug, debug_412
    rx96_cur."!cursor_debug"("START", "pod_comment")
  debug_412:
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
    .const 'Sub' $P127 = "28_1283874336.57842" 
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
    if_null rx96_debug, debug_417
    rx96_cur."!cursor_debug"("PASS", "pod_comment", " at pos=", rx96_pos)
  debug_417:
    .return (rx96_cur)
  rx96_restart:
.annotate 'line', 4
    if_null rx96_debug, debug_418
    rx96_cur."!cursor_debug"("NEXT", "pod_comment")
  debug_418:
  rx96_fail:
    (rx96_rep, rx96_pos, $I10, $P10) = rx96_cur."!mark_fail"(0)
    lt rx96_pos, -1, rx96_done
    eq rx96_pos, -1, rx96_fail
    jump $I10
  rx96_done:
    rx96_cur."!cursor_fail"()
    if_null rx96_debug, debug_419
    rx96_cur."!cursor_debug"("FAIL", "pod_comment")
  debug_419:
    .return (rx96_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1283874336.57842") :method
.annotate 'line', 4
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["NQP";"Grammar"]
.sub "_block126"  :anon :subid("28_1283874336.57842") :method :outer("26_1283874336.57842")
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
    if_null rx128_debug, debug_413
    rx128_cur."!cursor_debug"("START", "")
  debug_413:
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
    if_null rx128_debug, debug_414
    rx128_cur."!cursor_debug"("PASS", "", " at pos=", rx128_pos)
  debug_414:
    .return (rx128_cur)
  rx128_restart:
    if_null rx128_debug, debug_415
    rx128_cur."!cursor_debug"("NEXT", "")
  debug_415:
  rx128_fail:
    (rx128_rep, rx128_pos, $I10, $P10) = rx128_cur."!mark_fail"(0)
    lt rx128_pos, -1, rx128_done
    eq rx128_pos, -1, rx128_fail
    jump $I10
  rx128_done:
    rx128_cur."!cursor_fail"()
    if_null rx128_debug, debug_416
    rx128_cur."!cursor_debug"("FAIL", "")
  debug_416:
    .return (rx128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx135_debug, debug_420
    rx135_cur."!cursor_debug"("START", "comp_unit")
  debug_420:
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
    if_null rx135_debug, debug_421
    rx135_cur."!cursor_debug"("PASS", "comp_unit", " at pos=", rx135_pos)
  debug_421:
    .return (rx135_cur)
  rx135_restart:
.annotate 'line', 4
    if_null rx135_debug, debug_422
    rx135_cur."!cursor_debug"("NEXT", "comp_unit")
  debug_422:
  rx135_fail:
    (rx135_rep, rx135_pos, $I10, $P10) = rx135_cur."!mark_fail"(0)
    lt rx135_pos, -1, rx135_done
    eq rx135_pos, -1, rx135_fail
    jump $I10
  rx135_done:
    rx135_cur."!cursor_fail"()
    if_null rx135_debug, debug_423
    rx135_cur."!cursor_debug"("FAIL", "comp_unit")
  debug_423:
    .return (rx135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1283874336.57842") :method
.annotate 'line', 4
    $P137 = self."!PREFIX__!subrule"("newpad", "")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx142_debug, debug_424
    rx142_cur."!cursor_debug"("START", "statementlist")
  debug_424:
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
    if_null rx142_debug, debug_425
    rx142_cur."!cursor_debug"("PASS", "statementlist", " at pos=", rx142_pos)
  debug_425:
    .return (rx142_cur)
  rx142_restart:
.annotate 'line', 4
    if_null rx142_debug, debug_426
    rx142_cur."!cursor_debug"("NEXT", "statementlist")
  debug_426:
  rx142_fail:
    (rx142_rep, rx142_pos, $I10, $P10) = rx142_cur."!mark_fail"(0)
    lt rx142_pos, -1, rx142_done
    eq rx142_pos, -1, rx142_fail
    jump $I10
  rx142_done:
    rx142_cur."!cursor_fail"()
    if_null rx142_debug, debug_427
    rx142_cur."!cursor_debug"("FAIL", "statementlist")
  debug_427:
    .return (rx142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1283874336.57842") :method
.annotate 'line', 4
    $P144 = self."!PREFIX__!subrule"("ws", "")
    $P145 = self."!PREFIX__!subrule"("ws", "")
    new $P146, "ResizablePMCArray"
    push $P146, $P144
    push $P146, $P145
    .return ($P146)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P161 = "35_1283874336.57842" 
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
    if_null rx156_debug, debug_428
    rx156_cur."!cursor_debug"("START", "statement")
  debug_428:
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
    .const 'Sub' $P161 = "35_1283874336.57842" 
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
    if_null rx156_debug, debug_433
    rx156_cur."!cursor_debug"("PASS", "statement", " at pos=", rx156_pos)
  debug_433:
    .return (rx156_cur)
  rx156_restart:
.annotate 'line', 4
    if_null rx156_debug, debug_434
    rx156_cur."!cursor_debug"("NEXT", "statement")
  debug_434:
  rx156_fail:
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    if_null rx156_debug, debug_435
    rx156_cur."!cursor_debug"("FAIL", "statement")
  debug_435:
    .return (rx156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1283874336.57842") :method
.annotate 'line', 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "_block160"  :anon :subid("35_1283874336.57842") :method :outer("33_1283874336.57842")
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
    if_null rx162_debug, debug_429
    rx162_cur."!cursor_debug"("START", "")
  debug_429:
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
    if_null rx162_debug, debug_430
    rx162_cur."!cursor_debug"("PASS", "", " at pos=", rx162_pos)
  debug_430:
    .return (rx162_cur)
  rx162_restart:
    if_null rx162_debug, debug_431
    rx162_cur."!cursor_debug"("NEXT", "")
  debug_431:
  rx162_fail:
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    if_null rx162_debug, debug_432
    rx162_cur."!cursor_debug"("FAIL", "")
  debug_432:
    .return (rx162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx171_debug, debug_436
    rx171_cur."!cursor_debug"("START", "eat_terminator")
  debug_436:
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
    if_null rx171_debug, debug_437
    rx171_cur."!cursor_debug"("PASS", "eat_terminator", " at pos=", rx171_pos)
  debug_437:
    .return (rx171_cur)
  rx171_restart:
.annotate 'line', 4
    if_null rx171_debug, debug_438
    rx171_cur."!cursor_debug"("NEXT", "eat_terminator")
  debug_438:
  rx171_fail:
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    if_null rx171_debug, debug_439
    rx171_cur."!cursor_debug"("FAIL", "eat_terminator")
  debug_439:
    .return (rx171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1283874336.57842") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    push $P173, ""
    push $P173, ""
    push $P173, ";"
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx177_debug, debug_440
    rx177_cur."!cursor_debug"("START", "xblock")
  debug_440:
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
    if_null rx177_debug, debug_441
    rx177_cur."!cursor_debug"("PASS", "xblock", " at pos=", rx177_pos)
  debug_441:
    .return (rx177_cur)
  rx177_restart:
.annotate 'line', 4
    if_null rx177_debug, debug_442
    rx177_cur."!cursor_debug"("NEXT", "xblock")
  debug_442:
  rx177_fail:
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    if_null rx177_debug, debug_443
    rx177_cur."!cursor_debug"("FAIL", "xblock")
  debug_443:
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1283874336.57842") :method
.annotate 'line', 4
    $P179 = self."!PREFIX__!subrule"("EXPR", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx183_debug, debug_444
    rx183_cur."!cursor_debug"("START", "pblock")
  debug_444:
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
    ge rx183_pos, rx183_eos, rx183_fail
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
    if_null rx183_debug, debug_445
    rx183_cur."!cursor_debug"("PASS", "pblock", " at pos=", rx183_pos)
  debug_445:
    .return (rx183_cur)
  rx183_restart:
.annotate 'line', 4
    if_null rx183_debug, debug_446
    rx183_cur."!cursor_debug"("NEXT", "pblock")
  debug_446:
  rx183_fail:
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    if_null rx183_debug, debug_447
    rx183_cur."!cursor_debug"("FAIL", "pblock")
  debug_447:
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1283874336.57842") :method
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
.sub "lambda"  :subid("42_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx191_debug, debug_448
    rx191_cur."!cursor_debug"("START", "lambda")
  debug_448:
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
    if_null rx191_debug, debug_449
    rx191_cur."!cursor_debug"("PASS", "lambda", " at pos=", rx191_pos)
  debug_449:
    .return (rx191_cur)
  rx191_restart:
.annotate 'line', 4
    if_null rx191_debug, debug_450
    rx191_cur."!cursor_debug"("NEXT", "lambda")
  debug_450:
  rx191_fail:
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    if_null rx191_debug, debug_451
    rx191_cur."!cursor_debug"("FAIL", "lambda")
  debug_451:
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1283874336.57842") :method
.annotate 'line', 4
    new $P193, "ResizablePMCArray"
    push $P193, "<->"
    push $P193, "->"
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx197_debug, debug_452
    rx197_cur."!cursor_debug"("START", "block")
  debug_452:
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
    ge rx197_pos, rx197_eos, rx197_fail
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
    if_null rx197_debug, debug_453
    rx197_cur."!cursor_debug"("PASS", "block", " at pos=", rx197_pos)
  debug_453:
    .return (rx197_cur)
  rx197_restart:
.annotate 'line', 4
    if_null rx197_debug, debug_454
    rx197_cur."!cursor_debug"("NEXT", "block")
  debug_454:
  rx197_fail:
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    if_null rx197_debug, debug_455
    rx197_cur."!cursor_debug"("FAIL", "block")
  debug_455:
    .return (rx197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1283874336.57842") :method
.annotate 'line', 4
    $P199 = self."!PREFIX__!subrule"("panic", "")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    push $P200, "{"
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx204_debug, debug_456
    rx204_cur."!cursor_debug"("START", "blockoid")
  debug_456:
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
    if_null rx204_debug, debug_457
    rx204_cur."!cursor_debug"("PASS", "blockoid", " at pos=", rx204_pos)
  debug_457:
    .return (rx204_cur)
  rx204_restart:
.annotate 'line', 4
    if_null rx204_debug, debug_458
    rx204_cur."!cursor_debug"("NEXT", "blockoid")
  debug_458:
  rx204_fail:
    (rx204_rep, rx204_pos, $I10, $P10) = rx204_cur."!mark_fail"(0)
    lt rx204_pos, -1, rx204_done
    eq rx204_pos, -1, rx204_fail
    jump $I10
  rx204_done:
    rx204_cur."!cursor_fail"()
    if_null rx204_debug, debug_459
    rx204_cur."!cursor_debug"("FAIL", "blockoid")
  debug_459:
    .return (rx204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1283874336.57842") :method
.annotate 'line', 4
    $P206 = self."!PREFIX__!subrule"("finishpad", "")
    new $P207, "ResizablePMCArray"
    push $P207, $P206
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx213_debug, debug_460
    rx213_cur."!cursor_debug"("START", "newpad")
  debug_460:
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
    if_null rx213_debug, debug_461
    rx213_cur."!cursor_debug"("PASS", "newpad", " at pos=", rx213_pos)
  debug_461:
    .return (rx213_cur)
  rx213_restart:
.annotate 'line', 4
    if_null rx213_debug, debug_462
    rx213_cur."!cursor_debug"("NEXT", "newpad")
  debug_462:
  rx213_fail:
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    if_null rx213_debug, debug_463
    rx213_cur."!cursor_debug"("FAIL", "newpad")
  debug_463:
    .return (rx213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1283874336.57842") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, ""
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx218_debug, debug_464
    rx218_cur."!cursor_debug"("START", "outerctx")
  debug_464:
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
    if_null rx218_debug, debug_465
    rx218_cur."!cursor_debug"("PASS", "outerctx", " at pos=", rx218_pos)
  debug_465:
    .return (rx218_cur)
  rx218_restart:
.annotate 'line', 4
    if_null rx218_debug, debug_466
    rx218_cur."!cursor_debug"("NEXT", "outerctx")
  debug_466:
  rx218_fail:
    (rx218_rep, rx218_pos, $I10, $P10) = rx218_cur."!mark_fail"(0)
    lt rx218_pos, -1, rx218_done
    eq rx218_pos, -1, rx218_fail
    jump $I10
  rx218_done:
    rx218_cur."!cursor_fail"()
    if_null rx218_debug, debug_467
    rx218_cur."!cursor_debug"("FAIL", "outerctx")
  debug_467:
    .return (rx218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1283874336.57842") :method
.annotate 'line', 4
    new $P220, "ResizablePMCArray"
    push $P220, ""
    .return ($P220)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx223_debug, debug_468
    rx223_cur."!cursor_debug"("START", "finishpad")
  debug_468:
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
    if_null rx223_debug, debug_469
    rx223_cur."!cursor_debug"("PASS", "finishpad", " at pos=", rx223_pos)
  debug_469:
    .return (rx223_cur)
  rx223_restart:
.annotate 'line', 4
    if_null rx223_debug, debug_470
    rx223_cur."!cursor_debug"("NEXT", "finishpad")
  debug_470:
  rx223_fail:
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    if_null rx223_debug, debug_471
    rx223_cur."!cursor_debug"("FAIL", "finishpad")
  debug_471:
    .return (rx223_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1283874336.57842") :method
.annotate 'line', 4
    new $P225, "ResizablePMCArray"
    push $P225, ""
    .return ($P225)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1283874336.57842") :method
.annotate 'line', 148
    $P228 = self."!protoregex"("terminator")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1283874336.57842") :method
.annotate 'line', 148
    $P230 = self."!PREFIX__!protoregex"("terminator")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx232_debug, debug_472
    rx232_cur."!cursor_debug"("START", "terminator:sym<;>")
  debug_472:
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
    ge rx232_pos, rx232_eos, rx232_fail
    sub $I10, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx232_fail
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "terminator:sym<;>")
    if_null rx232_debug, debug_473
    rx232_cur."!cursor_debug"("PASS", "terminator:sym<;>", " at pos=", rx232_pos)
  debug_473:
    .return (rx232_cur)
  rx232_restart:
.annotate 'line', 4
    if_null rx232_debug, debug_474
    rx232_cur."!cursor_debug"("NEXT", "terminator:sym<;>")
  debug_474:
  rx232_fail:
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    if_null rx232_debug, debug_475
    rx232_cur."!cursor_debug"("FAIL", "terminator:sym<;>")
  debug_475:
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1283874336.57842") :method
.annotate 'line', 4
    new $P234, "ResizablePMCArray"
    push $P234, ";"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx237_debug, debug_476
    rx237_cur."!cursor_debug"("START", "terminator:sym<}>")
  debug_476:
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
    ge rx237_pos, rx237_eos, rx237_fail
    sub $I10, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx237_fail
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "terminator:sym<}>")
    if_null rx237_debug, debug_477
    rx237_cur."!cursor_debug"("PASS", "terminator:sym<}>", " at pos=", rx237_pos)
  debug_477:
    .return (rx237_cur)
  rx237_restart:
.annotate 'line', 4
    if_null rx237_debug, debug_478
    rx237_cur."!cursor_debug"("NEXT", "terminator:sym<}>")
  debug_478:
  rx237_fail:
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    if_null rx237_debug, debug_479
    rx237_cur."!cursor_debug"("FAIL", "terminator:sym<}>")
  debug_479:
    .return (rx237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1283874336.57842") :method
.annotate 'line', 4
    new $P239, "ResizablePMCArray"
    push $P239, "}"
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1283874336.57842") :method
.annotate 'line', 155
    $P242 = self."!protoregex"("statement_control")
    .return ($P242)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1283874336.57842") :method
.annotate 'line', 155
    $P244 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx246_debug, debug_480
    rx246_cur."!cursor_debug"("START", "statement_control:sym<if>")
  debug_480:
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
    if_null rx246_debug, debug_481
    rx246_cur."!cursor_debug"("PASS", "statement_control:sym<if>", " at pos=", rx246_pos)
  debug_481:
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 4
    if_null rx246_debug, debug_482
    rx246_cur."!cursor_debug"("NEXT", "statement_control:sym<if>")
  debug_482:
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    if_null rx246_debug, debug_483
    rx246_cur."!cursor_debug"("FAIL", "statement_control:sym<if>")
  debug_483:
    .return (rx246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1283874336.57842") :method
.annotate 'line', 4
    new $P248, "ResizablePMCArray"
    push $P248, "if"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P274 = "66_1283874336.57842" 
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
    if_null rx264_debug, debug_484
    rx264_cur."!cursor_debug"("START", "statement_control:sym<unless>")
  debug_484:
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
    .const 'Sub' $P274 = "66_1283874336.57842" 
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
    if_null rx264_debug, debug_489
    rx264_cur."!cursor_debug"("PASS", "statement_control:sym<unless>", " at pos=", rx264_pos)
  debug_489:
    .return (rx264_cur)
  rx264_restart:
.annotate 'line', 4
    if_null rx264_debug, debug_490
    rx264_cur."!cursor_debug"("NEXT", "statement_control:sym<unless>")
  debug_490:
  rx264_fail:
    (rx264_rep, rx264_pos, $I10, $P10) = rx264_cur."!mark_fail"(0)
    lt rx264_pos, -1, rx264_done
    eq rx264_pos, -1, rx264_fail
    jump $I10
  rx264_done:
    rx264_cur."!cursor_fail"()
    if_null rx264_debug, debug_491
    rx264_cur."!cursor_debug"("FAIL", "statement_control:sym<unless>")
  debug_491:
    .return (rx264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1283874336.57842") :method
.annotate 'line', 4
    new $P266, "ResizablePMCArray"
    push $P266, "unless"
    .return ($P266)
.end


.namespace ["NQP";"Grammar"]
.sub "_block273"  :anon :subid("66_1283874336.57842") :method :outer("64_1283874336.57842")
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
    if_null rx275_debug, debug_485
    rx275_cur."!cursor_debug"("START", "")
  debug_485:
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
    if_null rx275_debug, debug_486
    rx275_cur."!cursor_debug"("PASS", "", " at pos=", rx275_pos)
  debug_486:
    .return (rx275_cur)
  rx275_restart:
    if_null rx275_debug, debug_487
    rx275_cur."!cursor_debug"("NEXT", "")
  debug_487:
  rx275_fail:
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    if_null rx275_debug, debug_488
    rx275_cur."!cursor_debug"("FAIL", "")
  debug_488:
    .return (rx275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx282_debug, debug_492
    rx282_cur."!cursor_debug"("START", "statement_control:sym<while>")
  debug_492:
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
    if_null rx282_debug, debug_493
    rx282_cur."!cursor_debug"("PASS", "statement_control:sym<while>", " at pos=", rx282_pos)
  debug_493:
    .return (rx282_cur)
  rx282_restart:
.annotate 'line', 4
    if_null rx282_debug, debug_494
    rx282_cur."!cursor_debug"("NEXT", "statement_control:sym<while>")
  debug_494:
  rx282_fail:
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    if_null rx282_debug, debug_495
    rx282_cur."!cursor_debug"("FAIL", "statement_control:sym<while>")
  debug_495:
    .return (rx282_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1283874336.57842") :method
.annotate 'line', 4
    new $P284, "ResizablePMCArray"
    push $P284, "until"
    push $P284, "while"
    .return ($P284)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx291_debug, debug_496
    rx291_cur."!cursor_debug"("START", "statement_control:sym<repeat>")
  debug_496:
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
    if_null rx291_debug, debug_497
    rx291_cur."!cursor_debug"("PASS", "statement_control:sym<repeat>", " at pos=", rx291_pos)
  debug_497:
    .return (rx291_cur)
  rx291_restart:
.annotate 'line', 4
    if_null rx291_debug, debug_498
    rx291_cur."!cursor_debug"("NEXT", "statement_control:sym<repeat>")
  debug_498:
  rx291_fail:
    (rx291_rep, rx291_pos, $I10, $P10) = rx291_cur."!mark_fail"(0)
    lt rx291_pos, -1, rx291_done
    eq rx291_pos, -1, rx291_fail
    jump $I10
  rx291_done:
    rx291_cur."!cursor_fail"()
    if_null rx291_debug, debug_499
    rx291_cur."!cursor_debug"("FAIL", "statement_control:sym<repeat>")
  debug_499:
    .return (rx291_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1283874336.57842") :method
.annotate 'line', 4
    new $P293, "ResizablePMCArray"
    push $P293, "repeat"
    .return ($P293)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx311_debug, debug_500
    rx311_cur."!cursor_debug"("START", "statement_control:sym<for>")
  debug_500:
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
    if_null rx311_debug, debug_501
    rx311_cur."!cursor_debug"("PASS", "statement_control:sym<for>", " at pos=", rx311_pos)
  debug_501:
    .return (rx311_cur)
  rx311_restart:
.annotate 'line', 4
    if_null rx311_debug, debug_502
    rx311_cur."!cursor_debug"("NEXT", "statement_control:sym<for>")
  debug_502:
  rx311_fail:
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    if_null rx311_debug, debug_503
    rx311_cur."!cursor_debug"("FAIL", "statement_control:sym<for>")
  debug_503:
    .return (rx311_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1283874336.57842") :method
.annotate 'line', 4
    new $P313, "ResizablePMCArray"
    push $P313, "for"
    .return ($P313)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx319_debug, debug_504
    rx319_cur."!cursor_debug"("START", "statement_control:sym<CATCH>")
  debug_504:
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
    if_null rx319_debug, debug_505
    rx319_cur."!cursor_debug"("PASS", "statement_control:sym<CATCH>", " at pos=", rx319_pos)
  debug_505:
    .return (rx319_cur)
  rx319_restart:
.annotate 'line', 4
    if_null rx319_debug, debug_506
    rx319_cur."!cursor_debug"("NEXT", "statement_control:sym<CATCH>")
  debug_506:
  rx319_fail:
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    if_null rx319_debug, debug_507
    rx319_cur."!cursor_debug"("FAIL", "statement_control:sym<CATCH>")
  debug_507:
    .return (rx319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1283874336.57842") :method
.annotate 'line', 4
    new $P321, "ResizablePMCArray"
    push $P321, "CATCH"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx327_debug, debug_508
    rx327_cur."!cursor_debug"("START", "statement_control:sym<CONTROL>")
  debug_508:
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
    if_null rx327_debug, debug_509
    rx327_cur."!cursor_debug"("PASS", "statement_control:sym<CONTROL>", " at pos=", rx327_pos)
  debug_509:
    .return (rx327_cur)
  rx327_restart:
.annotate 'line', 4
    if_null rx327_debug, debug_510
    rx327_cur."!cursor_debug"("NEXT", "statement_control:sym<CONTROL>")
  debug_510:
  rx327_fail:
    (rx327_rep, rx327_pos, $I10, $P10) = rx327_cur."!mark_fail"(0)
    lt rx327_pos, -1, rx327_done
    eq rx327_pos, -1, rx327_fail
    jump $I10
  rx327_done:
    rx327_cur."!cursor_fail"()
    if_null rx327_debug, debug_511
    rx327_cur."!cursor_debug"("FAIL", "statement_control:sym<CONTROL>")
  debug_511:
    .return (rx327_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1283874336.57842") :method
.annotate 'line', 4
    new $P329, "ResizablePMCArray"
    push $P329, "CONTROL"
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1283874336.57842") :method
.annotate 'line', 198
    $P335 = self."!protoregex"("statement_prefix")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1283874336.57842") :method
.annotate 'line', 198
    $P337 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx339_debug, debug_512
    rx339_cur."!cursor_debug"("START", "statement_prefix:sym<INIT>")
  debug_512:
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
    if_null rx339_debug, debug_513
    rx339_cur."!cursor_debug"("PASS", "statement_prefix:sym<INIT>", " at pos=", rx339_pos)
  debug_513:
    .return (rx339_cur)
  rx339_restart:
.annotate 'line', 4
    if_null rx339_debug, debug_514
    rx339_cur."!cursor_debug"("NEXT", "statement_prefix:sym<INIT>")
  debug_514:
  rx339_fail:
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    if_null rx339_debug, debug_515
    rx339_cur."!cursor_debug"("FAIL", "statement_prefix:sym<INIT>")
  debug_515:
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1283874336.57842") :method
.annotate 'line', 4
    $P341 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P342, "ResizablePMCArray"
    push $P342, $P341
    .return ($P342)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx346_debug, debug_516
    rx346_cur."!cursor_debug"("START", "statement_prefix:sym<try>")
  debug_516:
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
    if_null rx346_debug, debug_517
    rx346_cur."!cursor_debug"("PASS", "statement_prefix:sym<try>", " at pos=", rx346_pos)
  debug_517:
    .return (rx346_cur)
  rx346_restart:
.annotate 'line', 4
    if_null rx346_debug, debug_518
    rx346_cur."!cursor_debug"("NEXT", "statement_prefix:sym<try>")
  debug_518:
  rx346_fail:
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    if_null rx346_debug, debug_519
    rx346_cur."!cursor_debug"("FAIL", "statement_prefix:sym<try>")
  debug_519:
    .return (rx346_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1283874336.57842") :method
.annotate 'line', 4
    $P348 = self."!PREFIX__!subrule"("blorst", "try")
    new $P349, "ResizablePMCArray"
    push $P349, $P348
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx353_debug, debug_520
    rx353_cur."!cursor_debug"("START", "blorst")
  debug_520:
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
    ge rx353_pos, rx353_eos, rx353_fail
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
    if_null rx353_debug, debug_521
    rx353_cur."!cursor_debug"("PASS", "blorst", " at pos=", rx353_pos)
  debug_521:
    .return (rx353_cur)
  rx353_restart:
.annotate 'line', 4
    if_null rx353_debug, debug_522
    rx353_cur."!cursor_debug"("NEXT", "blorst")
  debug_522:
  rx353_fail:
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    if_null rx353_debug, debug_523
    rx353_cur."!cursor_debug"("FAIL", "blorst")
  debug_523:
    .return (rx353_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1283874336.57842") :method
.annotate 'line', 4
    new $P355, "ResizablePMCArray"
    push $P355, ""
    .return ($P355)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1283874336.57842") :method
.annotate 'line', 212
    $P359 = self."!protoregex"("statement_mod_cond")
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1283874336.57842") :method
.annotate 'line', 212
    $P361 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx363_debug, debug_524
    rx363_cur."!cursor_debug"("START", "statement_mod_cond:sym<if>")
  debug_524:
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
    if_null rx363_debug, debug_525
    rx363_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<if>", " at pos=", rx363_pos)
  debug_525:
    .return (rx363_cur)
  rx363_restart:
.annotate 'line', 4
    if_null rx363_debug, debug_526
    rx363_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<if>")
  debug_526:
  rx363_fail:
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    if_null rx363_debug, debug_527
    rx363_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<if>")
  debug_527:
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1283874336.57842") :method
.annotate 'line', 4
    $P365 = self."!PREFIX__!subrule"("ws", "if")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx372_debug, debug_528
    rx372_cur."!cursor_debug"("START", "statement_mod_cond:sym<unless>")
  debug_528:
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
    if_null rx372_debug, debug_529
    rx372_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<unless>", " at pos=", rx372_pos)
  debug_529:
    .return (rx372_cur)
  rx372_restart:
.annotate 'line', 4
    if_null rx372_debug, debug_530
    rx372_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<unless>")
  debug_530:
  rx372_fail:
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    if_null rx372_debug, debug_531
    rx372_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<unless>")
  debug_531:
    .return (rx372_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1283874336.57842") :method
.annotate 'line', 4
    $P374 = self."!PREFIX__!subrule"("ws", "unless")
    new $P375, "ResizablePMCArray"
    push $P375, $P374
    .return ($P375)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1283874336.57842") :method
.annotate 'line', 217
    $P381 = self."!protoregex"("statement_mod_loop")
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1283874336.57842") :method
.annotate 'line', 217
    $P383 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx385_debug, debug_532
    rx385_cur."!cursor_debug"("START", "statement_mod_loop:sym<while>")
  debug_532:
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
    if_null rx385_debug, debug_533
    rx385_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<while>", " at pos=", rx385_pos)
  debug_533:
    .return (rx385_cur)
  rx385_restart:
.annotate 'line', 4
    if_null rx385_debug, debug_534
    rx385_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<while>")
  debug_534:
  rx385_fail:
    (rx385_rep, rx385_pos, $I10, $P10) = rx385_cur."!mark_fail"(0)
    lt rx385_pos, -1, rx385_done
    eq rx385_pos, -1, rx385_fail
    jump $I10
  rx385_done:
    rx385_cur."!cursor_fail"()
    if_null rx385_debug, debug_535
    rx385_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<while>")
  debug_535:
    .return (rx385_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1283874336.57842") :method
.annotate 'line', 4
    $P387 = self."!PREFIX__!subrule"("ws", "while")
    new $P388, "ResizablePMCArray"
    push $P388, $P387
    .return ($P388)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx394_debug, debug_536
    rx394_cur."!cursor_debug"("START", "statement_mod_loop:sym<until>")
  debug_536:
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
    if_null rx394_debug, debug_537
    rx394_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<until>", " at pos=", rx394_pos)
  debug_537:
    .return (rx394_cur)
  rx394_restart:
.annotate 'line', 4
    if_null rx394_debug, debug_538
    rx394_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<until>")
  debug_538:
  rx394_fail:
    (rx394_rep, rx394_pos, $I10, $P10) = rx394_cur."!mark_fail"(0)
    lt rx394_pos, -1, rx394_done
    eq rx394_pos, -1, rx394_fail
    jump $I10
  rx394_done:
    rx394_cur."!cursor_fail"()
    if_null rx394_debug, debug_539
    rx394_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<until>")
  debug_539:
    .return (rx394_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1283874336.57842") :method
.annotate 'line', 4
    $P396 = self."!PREFIX__!subrule"("ws", "until")
    new $P397, "ResizablePMCArray"
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx403_debug, debug_540
    rx403_cur."!cursor_debug"("START", "statement_mod_loop:sym<for>")
  debug_540:
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
    if_null rx403_debug, debug_541
    rx403_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<for>", " at pos=", rx403_pos)
  debug_541:
    .return (rx403_cur)
  rx403_restart:
.annotate 'line', 4
    if_null rx403_debug, debug_542
    rx403_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<for>")
  debug_542:
  rx403_fail:
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    if_null rx403_debug, debug_543
    rx403_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<for>")
  debug_543:
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1283874336.57842") :method
.annotate 'line', 4
    $P405 = self."!PREFIX__!subrule"("ws", "for")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx412_debug, debug_544
    rx412_cur."!cursor_debug"("START", "term:sym<fatarrow>")
  debug_544:
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
    if_null rx412_debug, debug_545
    rx412_cur."!cursor_debug"("PASS", "term:sym<fatarrow>", " at pos=", rx412_pos)
  debug_545:
    .return (rx412_cur)
  rx412_restart:
.annotate 'line', 4
    if_null rx412_debug, debug_546
    rx412_cur."!cursor_debug"("NEXT", "term:sym<fatarrow>")
  debug_546:
  rx412_fail:
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    if_null rx412_debug, debug_547
    rx412_cur."!cursor_debug"("FAIL", "term:sym<fatarrow>")
  debug_547:
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1283874336.57842") :method
.annotate 'line', 4
    $P414 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx418_debug, debug_548
    rx418_cur."!cursor_debug"("START", "term:sym<colonpair>")
  debug_548:
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
    if_null rx418_debug, debug_549
    rx418_cur."!cursor_debug"("PASS", "term:sym<colonpair>", " at pos=", rx418_pos)
  debug_549:
    .return (rx418_cur)
  rx418_restart:
.annotate 'line', 4
    if_null rx418_debug, debug_550
    rx418_cur."!cursor_debug"("NEXT", "term:sym<colonpair>")
  debug_550:
  rx418_fail:
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    if_null rx418_debug, debug_551
    rx418_cur."!cursor_debug"("FAIL", "term:sym<colonpair>")
  debug_551:
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1283874336.57842") :method
.annotate 'line', 4
    $P420 = self."!PREFIX__!subrule"("colonpair", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx424_debug, debug_552
    rx424_cur."!cursor_debug"("START", "term:sym<variable>")
  debug_552:
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
    if_null rx424_debug, debug_553
    rx424_cur."!cursor_debug"("PASS", "term:sym<variable>", " at pos=", rx424_pos)
  debug_553:
    .return (rx424_cur)
  rx424_restart:
.annotate 'line', 4
    if_null rx424_debug, debug_554
    rx424_cur."!cursor_debug"("NEXT", "term:sym<variable>")
  debug_554:
  rx424_fail:
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    if_null rx424_debug, debug_555
    rx424_cur."!cursor_debug"("FAIL", "term:sym<variable>")
  debug_555:
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("104_1283874336.57842") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("variable", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx430_debug, debug_556
    rx430_cur."!cursor_debug"("START", "term:sym<package_declarator>")
  debug_556:
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
    if_null rx430_debug, debug_557
    rx430_cur."!cursor_debug"("PASS", "term:sym<package_declarator>", " at pos=", rx430_pos)
  debug_557:
    .return (rx430_cur)
  rx430_restart:
.annotate 'line', 4
    if_null rx430_debug, debug_558
    rx430_cur."!cursor_debug"("NEXT", "term:sym<package_declarator>")
  debug_558:
  rx430_fail:
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    if_null rx430_debug, debug_559
    rx430_cur."!cursor_debug"("FAIL", "term:sym<package_declarator>")
  debug_559:
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1283874336.57842") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx436_debug, debug_560
    rx436_cur."!cursor_debug"("START", "term:sym<scope_declarator>")
  debug_560:
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
    if_null rx436_debug, debug_561
    rx436_cur."!cursor_debug"("PASS", "term:sym<scope_declarator>", " at pos=", rx436_pos)
  debug_561:
    .return (rx436_cur)
  rx436_restart:
.annotate 'line', 4
    if_null rx436_debug, debug_562
    rx436_cur."!cursor_debug"("NEXT", "term:sym<scope_declarator>")
  debug_562:
  rx436_fail:
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    if_null rx436_debug, debug_563
    rx436_cur."!cursor_debug"("FAIL", "term:sym<scope_declarator>")
  debug_563:
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1283874336.57842") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx442_debug, debug_564
    rx442_cur."!cursor_debug"("START", "term:sym<routine_declarator>")
  debug_564:
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
    if_null rx442_debug, debug_565
    rx442_cur."!cursor_debug"("PASS", "term:sym<routine_declarator>", " at pos=", rx442_pos)
  debug_565:
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 4
    if_null rx442_debug, debug_566
    rx442_cur."!cursor_debug"("NEXT", "term:sym<routine_declarator>")
  debug_566:
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    if_null rx442_debug, debug_567
    rx442_cur."!cursor_debug"("FAIL", "term:sym<routine_declarator>")
  debug_567:
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1283874336.57842") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P453 = "113_1283874336.57842" 
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
    if_null rx448_debug, debug_568
    rx448_cur."!cursor_debug"("START", "term:sym<multi_declarator>")
  debug_568:
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
    .const 'Sub' $P453 = "113_1283874336.57842" 
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
    if_null rx448_debug, debug_573
    rx448_cur."!cursor_debug"("PASS", "term:sym<multi_declarator>", " at pos=", rx448_pos)
  debug_573:
    .return (rx448_cur)
  rx448_restart:
.annotate 'line', 4
    if_null rx448_debug, debug_574
    rx448_cur."!cursor_debug"("NEXT", "term:sym<multi_declarator>")
  debug_574:
  rx448_fail:
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    if_null rx448_debug, debug_575
    rx448_cur."!cursor_debug"("FAIL", "term:sym<multi_declarator>")
  debug_575:
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1283874336.57842") :method
.annotate 'line', 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "_block452"  :anon :subid("113_1283874336.57842") :method :outer("111_1283874336.57842")
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
    if_null rx454_debug, debug_569
    rx454_cur."!cursor_debug"("START", "")
  debug_569:
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
    if_null rx454_debug, debug_570
    rx454_cur."!cursor_debug"("PASS", "", " at pos=", rx454_pos)
  debug_570:
    .return (rx454_cur)
  rx454_restart:
    if_null rx454_debug, debug_571
    rx454_cur."!cursor_debug"("NEXT", "")
  debug_571:
  rx454_fail:
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    if_null rx454_debug, debug_572
    rx454_cur."!cursor_debug"("FAIL", "")
  debug_572:
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("114_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx458_debug, debug_576
    rx458_cur."!cursor_debug"("START", "term:sym<regex_declarator>")
  debug_576:
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
    if_null rx458_debug, debug_577
    rx458_cur."!cursor_debug"("PASS", "term:sym<regex_declarator>", " at pos=", rx458_pos)
  debug_577:
    .return (rx458_cur)
  rx458_restart:
.annotate 'line', 4
    if_null rx458_debug, debug_578
    rx458_cur."!cursor_debug"("NEXT", "term:sym<regex_declarator>")
  debug_578:
  rx458_fail:
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    if_null rx458_debug, debug_579
    rx458_cur."!cursor_debug"("FAIL", "term:sym<regex_declarator>")
  debug_579:
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1283874336.57842") :method
.annotate 'line', 4
    $P460 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx464_debug, debug_580
    rx464_cur."!cursor_debug"("START", "term:sym<statement_prefix>")
  debug_580:
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
    if_null rx464_debug, debug_581
    rx464_cur."!cursor_debug"("PASS", "term:sym<statement_prefix>", " at pos=", rx464_pos)
  debug_581:
    .return (rx464_cur)
  rx464_restart:
.annotate 'line', 4
    if_null rx464_debug, debug_582
    rx464_cur."!cursor_debug"("NEXT", "term:sym<statement_prefix>")
  debug_582:
  rx464_fail:
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    if_null rx464_debug, debug_583
    rx464_cur."!cursor_debug"("FAIL", "term:sym<statement_prefix>")
  debug_583:
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1283874336.57842") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx470_debug, debug_584
    rx470_cur."!cursor_debug"("START", "term:sym<lambda>")
  debug_584:
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
    if_null rx470_debug, debug_585
    rx470_cur."!cursor_debug"("PASS", "term:sym<lambda>", " at pos=", rx470_pos)
  debug_585:
    .return (rx470_cur)
  rx470_restart:
.annotate 'line', 4
    if_null rx470_debug, debug_586
    rx470_cur."!cursor_debug"("NEXT", "term:sym<lambda>")
  debug_586:
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    if_null rx470_debug, debug_587
    rx470_cur."!cursor_debug"("FAIL", "term:sym<lambda>")
  debug_587:
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1283874336.57842") :method
.annotate 'line', 4
    new $P472, "ResizablePMCArray"
    push $P472, ""
    .return ($P472)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx475_debug, debug_588
    rx475_cur."!cursor_debug"("START", "fatarrow")
  debug_588:
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
    if_null rx475_debug, debug_589
    rx475_cur."!cursor_debug"("PASS", "fatarrow", " at pos=", rx475_pos)
  debug_589:
    .return (rx475_cur)
  rx475_restart:
.annotate 'line', 4
    if_null rx475_debug, debug_590
    rx475_cur."!cursor_debug"("NEXT", "fatarrow")
  debug_590:
  rx475_fail:
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    if_null rx475_debug, debug_591
    rx475_cur."!cursor_debug"("FAIL", "fatarrow")
  debug_591:
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("121_1283874336.57842") :method
.annotate 'line', 4
    $P477 = self."!PREFIX__!subrule"("identifier", "")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx482_debug, debug_592
    rx482_cur."!cursor_debug"("START", "colonpair")
  debug_592:
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
    if_null rx482_debug, debug_593
    rx482_cur."!cursor_debug"("PASS", "colonpair", " at pos=", rx482_pos)
  debug_593:
    .return (rx482_cur)
  rx482_restart:
.annotate 'line', 4
    if_null rx482_debug, debug_594
    rx482_cur."!cursor_debug"("NEXT", "colonpair")
  debug_594:
  rx482_fail:
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    if_null rx482_debug, debug_595
    rx482_cur."!cursor_debug"("FAIL", "colonpair")
  debug_595:
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("123_1283874336.57842") :method
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
.sub "variable"  :subid("124_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx494_debug, debug_596
    rx494_cur."!cursor_debug"("START", "variable")
  debug_596:
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
    ge rx494_pos, rx494_eos, rx494_fail
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
    if_null rx494_debug, debug_597
    rx494_cur."!cursor_debug"("PASS", "variable", " at pos=", rx494_pos)
  debug_597:
    .return (rx494_cur)
  rx494_restart:
.annotate 'line', 4
    if_null rx494_debug, debug_598
    rx494_cur."!cursor_debug"("NEXT", "variable")
  debug_598:
  rx494_fail:
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    if_null rx494_debug, debug_599
    rx494_cur."!cursor_debug"("FAIL", "variable")
  debug_599:
    .return (rx494_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("125_1283874336.57842") :method
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
.sub "sigil"  :subid("126_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx506_debug, debug_600
    rx506_cur."!cursor_debug"("START", "sigil")
  debug_600:
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
    if_null rx506_debug, debug_601
    rx506_cur."!cursor_debug"("PASS", "sigil", " at pos=", rx506_pos)
  debug_601:
    .return (rx506_cur)
  rx506_restart:
.annotate 'line', 4
    if_null rx506_debug, debug_602
    rx506_cur."!cursor_debug"("NEXT", "sigil")
  debug_602:
  rx506_fail:
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    if_null rx506_debug, debug_603
    rx506_cur."!cursor_debug"("FAIL", "sigil")
  debug_603:
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("127_1283874336.57842") :method
.annotate 'line', 4
    new $P508, "ResizablePMCArray"
    push $P508, "&"
    push $P508, "%"
    push $P508, "@"
    push $P508, "$"
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx511_debug, debug_604
    rx511_cur."!cursor_debug"("START", "twigil")
  debug_604:
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
    if_null rx511_debug, debug_605
    rx511_cur."!cursor_debug"("PASS", "twigil", " at pos=", rx511_pos)
  debug_605:
    .return (rx511_cur)
  rx511_restart:
.annotate 'line', 4
    if_null rx511_debug, debug_606
    rx511_cur."!cursor_debug"("NEXT", "twigil")
  debug_606:
  rx511_fail:
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    if_null rx511_debug, debug_607
    rx511_cur."!cursor_debug"("FAIL", "twigil")
  debug_607:
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("129_1283874336.57842") :method
.annotate 'line', 4
    new $P513, "ResizablePMCArray"
    push $P513, "?"
    push $P513, "!"
    push $P513, "*"
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1283874336.57842") :method
.annotate 'line', 259
    $P516 = self."!protoregex"("package_declarator")
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1283874336.57842") :method
.annotate 'line', 259
    $P518 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx520_debug, debug_608
    rx520_cur."!cursor_debug"("START", "package_declarator:sym<module>")
  debug_608:
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
    if_null rx520_debug, debug_609
    rx520_cur."!cursor_debug"("PASS", "package_declarator:sym<module>", " at pos=", rx520_pos)
  debug_609:
    .return (rx520_cur)
  rx520_restart:
.annotate 'line', 4
    if_null rx520_debug, debug_610
    rx520_cur."!cursor_debug"("NEXT", "package_declarator:sym<module>")
  debug_610:
  rx520_fail:
    (rx520_rep, rx520_pos, $I10, $P10) = rx520_cur."!mark_fail"(0)
    lt rx520_pos, -1, rx520_done
    eq rx520_pos, -1, rx520_fail
    jump $I10
  rx520_done:
    rx520_cur."!cursor_fail"()
    if_null rx520_debug, debug_611
    rx520_cur."!cursor_debug"("FAIL", "package_declarator:sym<module>")
  debug_611:
    .return (rx520_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1283874336.57842") :method
.annotate 'line', 4
    $P522 = self."!PREFIX__!subrule"("package_def", "module")
    new $P523, "ResizablePMCArray"
    push $P523, $P522
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx527_debug, debug_612
    rx527_cur."!cursor_debug"("START", "package_declarator:sym<class>")
  debug_612:
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
    if_null rx527_debug, debug_613
    rx527_cur."!cursor_debug"("PASS", "package_declarator:sym<class>", " at pos=", rx527_pos)
  debug_613:
    .return (rx527_cur)
  rx527_restart:
.annotate 'line', 4
    if_null rx527_debug, debug_614
    rx527_cur."!cursor_debug"("NEXT", "package_declarator:sym<class>")
  debug_614:
  rx527_fail:
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    if_null rx527_debug, debug_615
    rx527_cur."!cursor_debug"("FAIL", "package_declarator:sym<class>")
  debug_615:
    .return (rx527_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1283874336.57842") :method
.annotate 'line', 4
    $P529 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P530 = self."!PREFIX__!subrule"("package_def", "class")
    new $P531, "ResizablePMCArray"
    push $P531, $P529
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx536_debug, debug_616
    rx536_cur."!cursor_debug"("START", "package_def")
  debug_616:
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
    ge rx536_pos, rx536_eos, rx536_fail
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
    if_null rx536_debug, debug_617
    rx536_cur."!cursor_debug"("PASS", "package_def", " at pos=", rx536_pos)
  debug_617:
    .return (rx536_cur)
  rx536_restart:
.annotate 'line', 4
    if_null rx536_debug, debug_618
    rx536_cur."!cursor_debug"("NEXT", "package_def")
  debug_618:
  rx536_fail:
    (rx536_rep, rx536_pos, $I10, $P10) = rx536_cur."!mark_fail"(0)
    lt rx536_pos, -1, rx536_done
    eq rx536_pos, -1, rx536_fail
    jump $I10
  rx536_done:
    rx536_cur."!cursor_fail"()
    if_null rx536_debug, debug_619
    rx536_cur."!cursor_debug"("FAIL", "package_def")
  debug_619:
    .return (rx536_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("137_1283874336.57842") :method
.annotate 'line', 4
    $P538 = self."!PREFIX__!subrule"("ws", "")
    new $P539, "ResizablePMCArray"
    push $P539, $P538
    .return ($P539)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1283874336.57842") :method
.annotate 'line', 273
    $P559 = self."!protoregex"("scope_declarator")
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1283874336.57842") :method
.annotate 'line', 273
    $P561 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P561)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx563_debug, debug_620
    rx563_cur."!cursor_debug"("START", "scope_declarator:sym<my>")
  debug_620:
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
    if_null rx563_debug, debug_621
    rx563_cur."!cursor_debug"("PASS", "scope_declarator:sym<my>", " at pos=", rx563_pos)
  debug_621:
    .return (rx563_cur)
  rx563_restart:
.annotate 'line', 4
    if_null rx563_debug, debug_622
    rx563_cur."!cursor_debug"("NEXT", "scope_declarator:sym<my>")
  debug_622:
  rx563_fail:
    (rx563_rep, rx563_pos, $I10, $P10) = rx563_cur."!mark_fail"(0)
    lt rx563_pos, -1, rx563_done
    eq rx563_pos, -1, rx563_fail
    jump $I10
  rx563_done:
    rx563_cur."!cursor_fail"()
    if_null rx563_debug, debug_623
    rx563_cur."!cursor_debug"("FAIL", "scope_declarator:sym<my>")
  debug_623:
    .return (rx563_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1283874336.57842") :method
.annotate 'line', 4
    $P565 = self."!PREFIX__!subrule"("scoped", "my")
    new $P566, "ResizablePMCArray"
    push $P566, $P565
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx570_debug, debug_624
    rx570_cur."!cursor_debug"("START", "scope_declarator:sym<our>")
  debug_624:
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
    if_null rx570_debug, debug_625
    rx570_cur."!cursor_debug"("PASS", "scope_declarator:sym<our>", " at pos=", rx570_pos)
  debug_625:
    .return (rx570_cur)
  rx570_restart:
.annotate 'line', 4
    if_null rx570_debug, debug_626
    rx570_cur."!cursor_debug"("NEXT", "scope_declarator:sym<our>")
  debug_626:
  rx570_fail:
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    if_null rx570_debug, debug_627
    rx570_cur."!cursor_debug"("FAIL", "scope_declarator:sym<our>")
  debug_627:
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1283874336.57842") :method
.annotate 'line', 4
    $P572 = self."!PREFIX__!subrule"("scoped", "our")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx577_debug, debug_628
    rx577_cur."!cursor_debug"("START", "scope_declarator:sym<has>")
  debug_628:
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
    if_null rx577_debug, debug_629
    rx577_cur."!cursor_debug"("PASS", "scope_declarator:sym<has>", " at pos=", rx577_pos)
  debug_629:
    .return (rx577_cur)
  rx577_restart:
.annotate 'line', 4
    if_null rx577_debug, debug_630
    rx577_cur."!cursor_debug"("NEXT", "scope_declarator:sym<has>")
  debug_630:
  rx577_fail:
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    if_null rx577_debug, debug_631
    rx577_cur."!cursor_debug"("FAIL", "scope_declarator:sym<has>")
  debug_631:
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1283874336.57842") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "has")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx585_debug, debug_632
    rx585_cur."!cursor_debug"("START", "scoped")
  debug_632:
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
    if_null rx585_debug, debug_633
    rx585_cur."!cursor_debug"("PASS", "scoped", " at pos=", rx585_pos)
  debug_633:
    .return (rx585_cur)
  rx585_restart:
.annotate 'line', 4
    if_null rx585_debug, debug_634
    rx585_cur."!cursor_debug"("NEXT", "scoped")
  debug_634:
  rx585_fail:
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    if_null rx585_debug, debug_635
    rx585_cur."!cursor_debug"("FAIL", "scoped")
  debug_635:
    .return (rx585_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("147_1283874336.57842") :method
.annotate 'line', 4
    $P587 = self."!PREFIX__!subrule"("ws", "")
    $P588 = self."!PREFIX__!subrule"("ws", "")
    new $P589, "ResizablePMCArray"
    push $P589, $P587
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx597_debug, debug_636
    rx597_cur."!cursor_debug"("START", "typename")
  debug_636:
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
    if_null rx597_debug, debug_637
    rx597_cur."!cursor_debug"("PASS", "typename", " at pos=", rx597_pos)
  debug_637:
    .return (rx597_cur)
  rx597_restart:
.annotate 'line', 4
    if_null rx597_debug, debug_638
    rx597_cur."!cursor_debug"("NEXT", "typename")
  debug_638:
  rx597_fail:
    (rx597_rep, rx597_pos, $I10, $P10) = rx597_cur."!mark_fail"(0)
    lt rx597_pos, -1, rx597_done
    eq rx597_pos, -1, rx597_fail
    jump $I10
  rx597_done:
    rx597_cur."!cursor_fail"()
    if_null rx597_debug, debug_639
    rx597_cur."!cursor_debug"("FAIL", "typename")
  debug_639:
    .return (rx597_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("149_1283874336.57842") :method
.annotate 'line', 4
    $P599 = self."!PREFIX__!subrule"("name", "")
    new $P600, "ResizablePMCArray"
    push $P600, $P599
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx603_debug, debug_640
    rx603_cur."!cursor_debug"("START", "declarator")
  debug_640:
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
    if_null rx603_debug, debug_641
    rx603_cur."!cursor_debug"("PASS", "declarator", " at pos=", rx603_pos)
  debug_641:
    .return (rx603_cur)
  rx603_restart:
.annotate 'line', 4
    if_null rx603_debug, debug_642
    rx603_cur."!cursor_debug"("NEXT", "declarator")
  debug_642:
  rx603_fail:
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    if_null rx603_debug, debug_643
    rx603_cur."!cursor_debug"("FAIL", "declarator")
  debug_643:
    .return (rx603_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("151_1283874336.57842") :method
.annotate 'line', 4
    $P605 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P606 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P607, "ResizablePMCArray"
    push $P607, $P605
    push $P607, $P606
    .return ($P607)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx611_debug, debug_644
    rx611_cur."!cursor_debug"("START", "variable_declarator")
  debug_644:
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
    if_null rx611_debug, debug_645
    rx611_cur."!cursor_debug"("PASS", "variable_declarator", " at pos=", rx611_pos)
  debug_645:
    .return (rx611_cur)
  rx611_restart:
.annotate 'line', 4
    if_null rx611_debug, debug_646
    rx611_cur."!cursor_debug"("NEXT", "variable_declarator")
  debug_646:
  rx611_fail:
    (rx611_rep, rx611_pos, $I10, $P10) = rx611_cur."!mark_fail"(0)
    lt rx611_pos, -1, rx611_done
    eq rx611_pos, -1, rx611_fail
    jump $I10
  rx611_done:
    rx611_cur."!cursor_fail"()
    if_null rx611_debug, debug_647
    rx611_cur."!cursor_debug"("FAIL", "variable_declarator")
  debug_647:
    .return (rx611_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("153_1283874336.57842") :method
.annotate 'line', 4
    $P613 = self."!PREFIX__!subrule"("variable", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1283874336.57842") :method
.annotate 'line', 292
    $P617 = self."!protoregex"("routine_declarator")
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1283874336.57842") :method
.annotate 'line', 292
    $P619 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx621_debug, debug_648
    rx621_cur."!cursor_debug"("START", "routine_declarator:sym<sub>")
  debug_648:
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
    if_null rx621_debug, debug_649
    rx621_cur."!cursor_debug"("PASS", "routine_declarator:sym<sub>", " at pos=", rx621_pos)
  debug_649:
    .return (rx621_cur)
  rx621_restart:
.annotate 'line', 4
    if_null rx621_debug, debug_650
    rx621_cur."!cursor_debug"("NEXT", "routine_declarator:sym<sub>")
  debug_650:
  rx621_fail:
    (rx621_rep, rx621_pos, $I10, $P10) = rx621_cur."!mark_fail"(0)
    lt rx621_pos, -1, rx621_done
    eq rx621_pos, -1, rx621_fail
    jump $I10
  rx621_done:
    rx621_cur."!cursor_fail"()
    if_null rx621_debug, debug_651
    rx621_cur."!cursor_debug"("FAIL", "routine_declarator:sym<sub>")
  debug_651:
    .return (rx621_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1283874336.57842") :method
.annotate 'line', 4
    $P623 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P624, "ResizablePMCArray"
    push $P624, $P623
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx628_debug, debug_652
    rx628_cur."!cursor_debug"("START", "routine_declarator:sym<method>")
  debug_652:
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
    if_null rx628_debug, debug_653
    rx628_cur."!cursor_debug"("PASS", "routine_declarator:sym<method>", " at pos=", rx628_pos)
  debug_653:
    .return (rx628_cur)
  rx628_restart:
.annotate 'line', 4
    if_null rx628_debug, debug_654
    rx628_cur."!cursor_debug"("NEXT", "routine_declarator:sym<method>")
  debug_654:
  rx628_fail:
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    if_null rx628_debug, debug_655
    rx628_cur."!cursor_debug"("FAIL", "routine_declarator:sym<method>")
  debug_655:
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1283874336.57842") :method
.annotate 'line', 4
    $P630 = self."!PREFIX__!subrule"("method_def", "method")
    new $P631, "ResizablePMCArray"
    push $P631, $P630
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    .local pmc rx635_debug
    (rx635_cur, rx635_pos, rx635_tgt, $I10) = self."!cursor_start"()
    rx635_cur."!cursor_caparray"("deflongname", "sigil")
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
    if_null rx635_debug, debug_656
    rx635_cur."!cursor_debug"("START", "routine_def")
  debug_656:
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
    if_null rx635_debug, debug_657
    rx635_cur."!cursor_debug"("PASS", "routine_def", " at pos=", rx635_pos)
  debug_657:
    .return (rx635_cur)
  rx635_restart:
.annotate 'line', 4
    if_null rx635_debug, debug_658
    rx635_cur."!cursor_debug"("NEXT", "routine_def")
  debug_658:
  rx635_fail:
    (rx635_rep, rx635_pos, $I10, $P10) = rx635_cur."!mark_fail"(0)
    lt rx635_pos, -1, rx635_done
    eq rx635_pos, -1, rx635_fail
    jump $I10
  rx635_done:
    rx635_cur."!cursor_fail"()
    if_null rx635_debug, debug_659
    rx635_cur."!cursor_debug"("FAIL", "routine_def")
  debug_659:
    .return (rx635_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("161_1283874336.57842") :method
.annotate 'line', 4
    $P637 = self."!PREFIX__!subrule"("ws", "")
    new $P638, "ResizablePMCArray"
    push $P638, $P637
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx658_tgt
    .local int rx658_pos
    .local int rx658_off
    .local int rx658_eos
    .local int rx658_rep
    .local pmc rx658_cur
    .local pmc rx658_debug
    (rx658_cur, rx658_pos, rx658_tgt, $I10) = self."!cursor_start"()
    rx658_cur."!cursor_caparray"("deflongname")
    getattribute rx658_debug, rx658_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx658_cur
    .local pmc match
    .lex "$/", match
    length rx658_eos, rx658_tgt
    gt rx658_pos, rx658_eos, rx658_done
    set rx658_off, 0
    lt rx658_pos, 2, rx658_start
    sub rx658_off, rx658_pos, 1
    substr rx658_tgt, rx658_tgt, rx658_off
  rx658_start:
    eq $I10, 1, rx658_restart
    if_null rx658_debug, debug_660
    rx658_cur."!cursor_debug"("START", "method_def")
  debug_660:
    $I10 = self.'from'()
    ne $I10, -1, rxscan662_done
    goto rxscan662_scan
  rxscan662_loop:
    ($P10) = rx658_cur."from"()
    inc $P10
    set rx658_pos, $P10
    ge rx658_pos, rx658_eos, rxscan662_done
  rxscan662_scan:
    set_addr $I10, rxscan662_loop
    rx658_cur."!mark_push"(0, rx658_pos, $I10)
  rxscan662_done:
.annotate 'line', 304
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
.annotate 'line', 305
  # rx rxquantr664 ** 0..1
    set_addr $I10, rxquantr664_done
    rx658_cur."!mark_push"(0, rx658_pos, $I10)
  rxquantr664_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."deflongname"()
    unless $P10, rx658_fail
    goto rxsubrule665_pass
  rxsubrule665_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx658_fail
  rxsubrule665_pass:
    set_addr $I10, rxsubrule665_back
    rx658_cur."!mark_push"(0, rx658_pos, $I10, $P10)
    $P10."!cursor_names"("deflongname")
    rx658_pos = $P10."pos"()
    set_addr $I10, rxquantr664_done
    (rx658_rep) = rx658_cur."!mark_commit"($I10)
  rxquantr664_done:
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
.annotate 'line', 306
  # rx subrule "newpad" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."newpad"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  alt668_0:
.annotate 'line', 307
    set_addr $I10, alt668_1
    rx658_cur."!mark_push"(0, rx658_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx658_pos, 1
    gt $I11, rx658_eos, rx658_fail
    sub $I11, rx658_pos, rx658_off
    ord $I11, rx658_tgt, $I11
    ne $I11, 40, rx658_fail
    add rx658_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."signature"()
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx658_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx658_pos, 1
    gt $I11, rx658_eos, rx658_fail
    sub $I11, rx658_pos, rx658_off
    ord $I11, rx658_tgt, $I11
    ne $I11, 41, rx658_fail
    add rx658_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
    goto alt668_end
  alt668_1:
.annotate 'line', 308
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  alt668_end:
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
.annotate 'line', 309
  # rx subrule "blockoid" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."blockoid"()
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx658_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
.annotate 'line', 304
  # rx pass
    rx658_cur."!cursor_pass"(rx658_pos, "method_def")
    if_null rx658_debug, debug_661
    rx658_cur."!cursor_debug"("PASS", "method_def", " at pos=", rx658_pos)
  debug_661:
    .return (rx658_cur)
  rx658_restart:
.annotate 'line', 4
    if_null rx658_debug, debug_662
    rx658_cur."!cursor_debug"("NEXT", "method_def")
  debug_662:
  rx658_fail:
    (rx658_rep, rx658_pos, $I10, $P10) = rx658_cur."!mark_fail"(0)
    lt rx658_pos, -1, rx658_done
    eq rx658_pos, -1, rx658_fail
    jump $I10
  rx658_done:
    rx658_cur."!cursor_fail"()
    if_null rx658_debug, debug_663
    rx658_cur."!cursor_debug"("FAIL", "method_def")
  debug_663:
    .return (rx658_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("163_1283874336.57842") :method
.annotate 'line', 4
    $P660 = self."!PREFIX__!subrule"("ws", "")
    new $P661, "ResizablePMCArray"
    push $P661, $P660
    .return ($P661)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1283874336.57842") :method
.annotate 'line', 312
    $P678 = self."!protoregex"("multi_declarator")
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1283874336.57842") :method
.annotate 'line', 312
    $P680 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P680)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 314
    new $P682, "Undef"
    .lex "$*MULTINESS", $P682
.annotate 'line', 4
    .local string rx683_tgt
    .local int rx683_pos
    .local int rx683_off
    .local int rx683_eos
    .local int rx683_rep
    .local pmc rx683_cur
    .local pmc rx683_debug
    (rx683_cur, rx683_pos, rx683_tgt, $I10) = self."!cursor_start"()
    getattribute rx683_debug, rx683_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx683_cur
    .local pmc match
    .lex "$/", match
    length rx683_eos, rx683_tgt
    gt rx683_pos, rx683_eos, rx683_done
    set rx683_off, 0
    lt rx683_pos, 2, rx683_start
    sub rx683_off, rx683_pos, 1
    substr rx683_tgt, rx683_tgt, rx683_off
  rx683_start:
    eq $I10, 1, rx683_restart
    if_null rx683_debug, debug_664
    rx683_cur."!cursor_debug"("START", "multi_declarator:sym<multi>")
  debug_664:
    $I10 = self.'from'()
    ne $I10, -1, rxscan687_done
    goto rxscan687_scan
  rxscan687_loop:
    ($P10) = rx683_cur."from"()
    inc $P10
    set rx683_pos, $P10
    ge rx683_pos, rx683_eos, rxscan687_done
  rxscan687_scan:
    set_addr $I10, rxscan687_loop
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  rxscan687_done:
.annotate 'line', 314
    rx683_cur."!cursor_pos"(rx683_pos)
    new $P688, "String"
    assign $P688, "multi"
    store_lex "$*MULTINESS", $P688
.annotate 'line', 315
  # rx subcapture "sym"
    set_addr $I10, rxcap_689_fail
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx literal  "multi"
    add $I11, rx683_pos, 5
    gt $I11, rx683_eos, rx683_fail
    sub $I11, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I11, 5
    ne $S10, "multi", rx683_fail
    add rx683_pos, 5
    set_addr $I10, rxcap_689_fail
    ($I12, $I11) = rx683_cur."!mark_peek"($I10)
    rx683_cur."!cursor_pos"($I11)
    ($P10) = rx683_cur."!cursor_start"()
    $P10."!cursor_pass"(rx683_pos, "")
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_689_done
  rxcap_689_fail:
    goto rx683_fail
  rxcap_689_done:
.annotate 'line', 316
  # rx subrule "ws" subtype=method negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."ws"()
    unless $P10, rx683_fail
    rx683_pos = $P10."pos"()
  alt690_0:
    set_addr $I10, alt690_1
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."declarator"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx683_pos = $P10."pos"()
    goto alt690_end
  alt690_1:
    set_addr $I10, alt690_2
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."routine_def"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx683_pos = $P10."pos"()
    goto alt690_end
  alt690_2:
  # rx subrule "panic" subtype=method negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."panic"("Malformed multi")
    unless $P10, rx683_fail
    rx683_pos = $P10."pos"()
  alt690_end:
.annotate 'line', 313
  # rx pass
    rx683_cur."!cursor_pass"(rx683_pos, "multi_declarator:sym<multi>")
    if_null rx683_debug, debug_665
    rx683_cur."!cursor_debug"("PASS", "multi_declarator:sym<multi>", " at pos=", rx683_pos)
  debug_665:
    .return (rx683_cur)
  rx683_restart:
.annotate 'line', 4
    if_null rx683_debug, debug_666
    rx683_cur."!cursor_debug"("NEXT", "multi_declarator:sym<multi>")
  debug_666:
  rx683_fail:
    (rx683_rep, rx683_pos, $I10, $P10) = rx683_cur."!mark_fail"(0)
    lt rx683_pos, -1, rx683_done
    eq rx683_pos, -1, rx683_fail
    jump $I10
  rx683_done:
    rx683_cur."!cursor_fail"()
    if_null rx683_debug, debug_667
    rx683_cur."!cursor_debug"("FAIL", "multi_declarator:sym<multi>")
  debug_667:
    .return (rx683_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1283874336.57842") :method
.annotate 'line', 4
    $P685 = self."!PREFIX__!subrule"("ws", "multi")
    new $P686, "ResizablePMCArray"
    push $P686, $P685
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 319
    new $P692, "Undef"
    .lex "$*MULTINESS", $P692
.annotate 'line', 4
    .local string rx693_tgt
    .local int rx693_pos
    .local int rx693_off
    .local int rx693_eos
    .local int rx693_rep
    .local pmc rx693_cur
    .local pmc rx693_debug
    (rx693_cur, rx693_pos, rx693_tgt, $I10) = self."!cursor_start"()
    getattribute rx693_debug, rx693_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx693_cur
    .local pmc match
    .lex "$/", match
    length rx693_eos, rx693_tgt
    gt rx693_pos, rx693_eos, rx693_done
    set rx693_off, 0
    lt rx693_pos, 2, rx693_start
    sub rx693_off, rx693_pos, 1
    substr rx693_tgt, rx693_tgt, rx693_off
  rx693_start:
    eq $I10, 1, rx693_restart
    if_null rx693_debug, debug_668
    rx693_cur."!cursor_debug"("START", "multi_declarator:sym<null>")
  debug_668:
    $I10 = self.'from'()
    ne $I10, -1, rxscan697_done
    goto rxscan697_scan
  rxscan697_loop:
    ($P10) = rx693_cur."from"()
    inc $P10
    set rx693_pos, $P10
    ge rx693_pos, rx693_eos, rxscan697_done
  rxscan697_scan:
    set_addr $I10, rxscan697_loop
    rx693_cur."!mark_push"(0, rx693_pos, $I10)
  rxscan697_done:
.annotate 'line', 319
    rx693_cur."!cursor_pos"(rx693_pos)
    new $P698, "String"
    assign $P698, ""
    store_lex "$*MULTINESS", $P698
.annotate 'line', 320
  # rx subrule "declarator" subtype=capture negate=
    rx693_cur."!cursor_pos"(rx693_pos)
    $P10 = rx693_cur."declarator"()
    unless $P10, rx693_fail
    rx693_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx693_pos = $P10."pos"()
.annotate 'line', 318
  # rx pass
    rx693_cur."!cursor_pass"(rx693_pos, "multi_declarator:sym<null>")
    if_null rx693_debug, debug_669
    rx693_cur."!cursor_debug"("PASS", "multi_declarator:sym<null>", " at pos=", rx693_pos)
  debug_669:
    .return (rx693_cur)
  rx693_restart:
.annotate 'line', 4
    if_null rx693_debug, debug_670
    rx693_cur."!cursor_debug"("NEXT", "multi_declarator:sym<null>")
  debug_670:
  rx693_fail:
    (rx693_rep, rx693_pos, $I10, $P10) = rx693_cur."!mark_fail"(0)
    lt rx693_pos, -1, rx693_done
    eq rx693_pos, -1, rx693_fail
    jump $I10
  rx693_done:
    rx693_cur."!cursor_fail"()
    if_null rx693_debug, debug_671
    rx693_cur."!cursor_debug"("FAIL", "multi_declarator:sym<null>")
  debug_671:
    .return (rx693_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1283874336.57842") :method
.annotate 'line', 4
    $P695 = self."!PREFIX__!subrule"("declarator", "")
    new $P696, "ResizablePMCArray"
    push $P696, $P695
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx700_tgt
    .local int rx700_pos
    .local int rx700_off
    .local int rx700_eos
    .local int rx700_rep
    .local pmc rx700_cur
    .local pmc rx700_debug
    (rx700_cur, rx700_pos, rx700_tgt, $I10) = self."!cursor_start"()
    rx700_cur."!cursor_caparray"("parameter")
    getattribute rx700_debug, rx700_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx700_cur
    .local pmc match
    .lex "$/", match
    length rx700_eos, rx700_tgt
    gt rx700_pos, rx700_eos, rx700_done
    set rx700_off, 0
    lt rx700_pos, 2, rx700_start
    sub rx700_off, rx700_pos, 1
    substr rx700_tgt, rx700_tgt, rx700_off
  rx700_start:
    eq $I10, 1, rx700_restart
    if_null rx700_debug, debug_672
    rx700_cur."!cursor_debug"("START", "signature")
  debug_672:
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
.annotate 'line', 323
  # rx rxquantr704 ** 0..1
    set_addr $I10, rxquantr704_done
    rx700_cur."!mark_push"(0, rx700_pos, $I10)
  rxquantr704_loop:
  # rx rxquantr705 ** 1..*
    set_addr $I10, rxquantr705_done
    rx700_cur."!mark_push"(0, -1, $I10)
  rxquantr705_loop:
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."parameter"()
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx700_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."ws"()
    unless $P10, rx700_fail
    rx700_pos = $P10."pos"()
    set_addr $I10, rxquantr705_done
    (rx700_rep) = rx700_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr705_done
    rx700_cur."!mark_push"(rx700_rep, rx700_pos, $I10)
  # rx literal  ","
    add $I11, rx700_pos, 1
    gt $I11, rx700_eos, rx700_fail
    sub $I11, rx700_pos, rx700_off
    ord $I11, rx700_tgt, $I11
    ne $I11, 44, rx700_fail
    add rx700_pos, 1
    goto rxquantr705_loop
  rxquantr705_done:
    set_addr $I10, rxquantr704_done
    (rx700_rep) = rx700_cur."!mark_commit"($I10)
  rxquantr704_done:
  # rx pass
    rx700_cur."!cursor_pass"(rx700_pos, "signature")
    if_null rx700_debug, debug_673
    rx700_cur."!cursor_debug"("PASS", "signature", " at pos=", rx700_pos)
  debug_673:
    .return (rx700_cur)
  rx700_restart:
.annotate 'line', 4
    if_null rx700_debug, debug_674
    rx700_cur."!cursor_debug"("NEXT", "signature")
  debug_674:
  rx700_fail:
    (rx700_rep, rx700_pos, $I10, $P10) = rx700_cur."!mark_fail"(0)
    lt rx700_pos, -1, rx700_done
    eq rx700_pos, -1, rx700_fail
    jump $I10
  rx700_done:
    rx700_cur."!cursor_fail"()
    if_null rx700_debug, debug_675
    rx700_cur."!cursor_debug"("FAIL", "signature")
  debug_675:
    .return (rx700_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("171_1283874336.57842") :method
.annotate 'line', 4
    new $P702, "ResizablePMCArray"
    push $P702, ""
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    .local pmc rx707_debug
    (rx707_cur, rx707_pos, rx707_tgt, $I10) = self."!cursor_start"()
    rx707_cur."!cursor_caparray"("default_value", "typename")
    getattribute rx707_debug, rx707_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx707_cur
    .local pmc match
    .lex "$/", match
    length rx707_eos, rx707_tgt
    gt rx707_pos, rx707_eos, rx707_done
    set rx707_off, 0
    lt rx707_pos, 2, rx707_start
    sub rx707_off, rx707_pos, 1
    substr rx707_tgt, rx707_tgt, rx707_off
  rx707_start:
    eq $I10, 1, rx707_restart
    if_null rx707_debug, debug_676
    rx707_cur."!cursor_debug"("START", "parameter")
  debug_676:
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
.annotate 'line', 326
  # rx rxquantr711 ** 0..*
    set_addr $I10, rxquantr711_done
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  rxquantr711_loop:
  # rx subrule "typename" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."typename"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx707_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."ws"()
    unless $P10, rx707_fail
    rx707_pos = $P10."pos"()
    set_addr $I10, rxquantr711_done
    (rx707_rep) = rx707_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr711_done
    rx707_cur."!mark_push"(rx707_rep, rx707_pos, $I10)
    goto rxquantr711_loop
  rxquantr711_done:
  alt712_0:
.annotate 'line', 327
    set_addr $I10, alt712_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
.annotate 'line', 328
  # rx subcapture "quant"
    set_addr $I10, rxcap_713_fail
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx literal  "*"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    ord $I11, rx707_tgt, $I11
    ne $I11, 42, rx707_fail
    add rx707_pos, 1
    set_addr $I10, rxcap_713_fail
    ($I12, $I11) = rx707_cur."!mark_peek"($I10)
    rx707_cur."!cursor_pos"($I11)
    ($P10) = rx707_cur."!cursor_start"()
    $P10."!cursor_pass"(rx707_pos, "")
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_713_done
  rxcap_713_fail:
    goto rx707_fail
  rxcap_713_done:
  # rx subrule "param_var" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."param_var"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx707_pos = $P10."pos"()
    goto alt712_end
  alt712_1:
  alt714_0:
.annotate 'line', 329
    set_addr $I10, alt714_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."param_var"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx707_pos = $P10."pos"()
    goto alt714_end
  alt714_1:
  # rx subrule "named_param" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."named_param"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx707_pos = $P10."pos"()
  alt714_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_716_fail
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  alt715_0:
    set_addr $I10, alt715_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx literal  "?"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    ord $I11, rx707_tgt, $I11
    ne $I11, 63, rx707_fail
    add rx707_pos, 1
    goto alt715_end
  alt715_1:
    set_addr $I10, alt715_2
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx literal  "!"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    ord $I11, rx707_tgt, $I11
    ne $I11, 33, rx707_fail
    add rx707_pos, 1
    goto alt715_end
  alt715_2:
  alt715_end:
    set_addr $I10, rxcap_716_fail
    ($I12, $I11) = rx707_cur."!mark_peek"($I10)
    rx707_cur."!cursor_pos"($I11)
    ($P10) = rx707_cur."!cursor_start"()
    $P10."!cursor_pass"(rx707_pos, "")
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_716_done
  rxcap_716_fail:
    goto rx707_fail
  rxcap_716_done:
  alt712_end:
.annotate 'line', 331
  # rx rxquantr717 ** 0..1
    set_addr $I10, rxquantr717_done
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  rxquantr717_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."default_value"()
    unless $P10, rx707_fail
    goto rxsubrule718_pass
  rxsubrule718_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx707_fail
  rxsubrule718_pass:
    set_addr $I10, rxsubrule718_back
    rx707_cur."!mark_push"(0, rx707_pos, $I10, $P10)
    $P10."!cursor_names"("default_value")
    rx707_pos = $P10."pos"()
    set_addr $I10, rxquantr717_done
    (rx707_rep) = rx707_cur."!mark_commit"($I10)
  rxquantr717_done:
.annotate 'line', 325
  # rx pass
    rx707_cur."!cursor_pass"(rx707_pos, "parameter")
    if_null rx707_debug, debug_677
    rx707_cur."!cursor_debug"("PASS", "parameter", " at pos=", rx707_pos)
  debug_677:
    .return (rx707_cur)
  rx707_restart:
.annotate 'line', 4
    if_null rx707_debug, debug_678
    rx707_cur."!cursor_debug"("NEXT", "parameter")
  debug_678:
  rx707_fail:
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    if_null rx707_debug, debug_679
    rx707_cur."!cursor_debug"("FAIL", "parameter")
  debug_679:
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("173_1283874336.57842") :method
.annotate 'line', 4
    new $P709, "ResizablePMCArray"
    push $P709, ""
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    .local pmc rx720_debug
    (rx720_cur, rx720_pos, rx720_tgt, $I10) = self."!cursor_start"()
    rx720_cur."!cursor_caparray"("twigil")
    getattribute rx720_debug, rx720_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx720_cur
    .local pmc match
    .lex "$/", match
    length rx720_eos, rx720_tgt
    gt rx720_pos, rx720_eos, rx720_done
    set rx720_off, 0
    lt rx720_pos, 2, rx720_start
    sub rx720_off, rx720_pos, 1
    substr rx720_tgt, rx720_tgt, rx720_off
  rx720_start:
    eq $I10, 1, rx720_restart
    if_null rx720_debug, debug_680
    rx720_cur."!cursor_debug"("START", "param_var")
  debug_680:
    $I10 = self.'from'()
    ne $I10, -1, rxscan724_done
    goto rxscan724_scan
  rxscan724_loop:
    ($P10) = rx720_cur."from"()
    inc $P10
    set rx720_pos, $P10
    ge rx720_pos, rx720_eos, rxscan724_done
  rxscan724_scan:
    set_addr $I10, rxscan724_loop
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  rxscan724_done:
.annotate 'line', 335
  # rx subrule "sigil" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."sigil"()
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx720_pos = $P10."pos"()
  # rx rxquantr725 ** 0..1
    set_addr $I10, rxquantr725_done
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  rxquantr725_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."twigil"()
    unless $P10, rx720_fail
    goto rxsubrule726_pass
  rxsubrule726_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx720_fail
  rxsubrule726_pass:
    set_addr $I10, rxsubrule726_back
    rx720_cur."!mark_push"(0, rx720_pos, $I10, $P10)
    $P10."!cursor_names"("twigil")
    rx720_pos = $P10."pos"()
    set_addr $I10, rxquantr725_done
    (rx720_rep) = rx720_cur."!mark_commit"($I10)
  rxquantr725_done:
  alt727_0:
.annotate 'line', 336
    set_addr $I10, alt727_1
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."ident"()
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx720_pos = $P10."pos"()
    goto alt727_end
  alt727_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_728_fail
    rx720_cur."!mark_push"(0, rx720_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx720_pos, rx720_eos, rx720_fail
    sub $I10, rx720_pos, rx720_off
    substr $S10, rx720_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx720_fail
    inc rx720_pos
    set_addr $I10, rxcap_728_fail
    ($I12, $I11) = rx720_cur."!mark_peek"($I10)
    rx720_cur."!cursor_pos"($I11)
    ($P10) = rx720_cur."!cursor_start"()
    $P10."!cursor_pass"(rx720_pos, "")
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_728_done
  rxcap_728_fail:
    goto rx720_fail
  rxcap_728_done:
  alt727_end:
.annotate 'line', 334
  # rx pass
    rx720_cur."!cursor_pass"(rx720_pos, "param_var")
    if_null rx720_debug, debug_681
    rx720_cur."!cursor_debug"("PASS", "param_var", " at pos=", rx720_pos)
  debug_681:
    .return (rx720_cur)
  rx720_restart:
.annotate 'line', 4
    if_null rx720_debug, debug_682
    rx720_cur."!cursor_debug"("NEXT", "param_var")
  debug_682:
  rx720_fail:
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    if_null rx720_debug, debug_683
    rx720_cur."!cursor_debug"("FAIL", "param_var")
  debug_683:
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("175_1283874336.57842") :method
.annotate 'line', 4
    $P722 = self."!PREFIX__!subrule"("sigil", "")
    new $P723, "ResizablePMCArray"
    push $P723, $P722
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx730_tgt
    .local int rx730_pos
    .local int rx730_off
    .local int rx730_eos
    .local int rx730_rep
    .local pmc rx730_cur
    .local pmc rx730_debug
    (rx730_cur, rx730_pos, rx730_tgt, $I10) = self."!cursor_start"()
    getattribute rx730_debug, rx730_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx730_cur
    .local pmc match
    .lex "$/", match
    length rx730_eos, rx730_tgt
    gt rx730_pos, rx730_eos, rx730_done
    set rx730_off, 0
    lt rx730_pos, 2, rx730_start
    sub rx730_off, rx730_pos, 1
    substr rx730_tgt, rx730_tgt, rx730_off
  rx730_start:
    eq $I10, 1, rx730_restart
    if_null rx730_debug, debug_684
    rx730_cur."!cursor_debug"("START", "named_param")
  debug_684:
    $I10 = self.'from'()
    ne $I10, -1, rxscan734_done
    goto rxscan734_scan
  rxscan734_loop:
    ($P10) = rx730_cur."from"()
    inc $P10
    set rx730_pos, $P10
    ge rx730_pos, rx730_eos, rxscan734_done
  rxscan734_scan:
    set_addr $I10, rxscan734_loop
    rx730_cur."!mark_push"(0, rx730_pos, $I10)
  rxscan734_done:
.annotate 'line', 340
  # rx literal  ":"
    add $I11, rx730_pos, 1
    gt $I11, rx730_eos, rx730_fail
    sub $I11, rx730_pos, rx730_off
    ord $I11, rx730_tgt, $I11
    ne $I11, 58, rx730_fail
    add rx730_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx730_cur."!cursor_pos"(rx730_pos)
    $P10 = rx730_cur."param_var"()
    unless $P10, rx730_fail
    rx730_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx730_pos = $P10."pos"()
.annotate 'line', 339
  # rx pass
    rx730_cur."!cursor_pass"(rx730_pos, "named_param")
    if_null rx730_debug, debug_685
    rx730_cur."!cursor_debug"("PASS", "named_param", " at pos=", rx730_pos)
  debug_685:
    .return (rx730_cur)
  rx730_restart:
.annotate 'line', 4
    if_null rx730_debug, debug_686
    rx730_cur."!cursor_debug"("NEXT", "named_param")
  debug_686:
  rx730_fail:
    (rx730_rep, rx730_pos, $I10, $P10) = rx730_cur."!mark_fail"(0)
    lt rx730_pos, -1, rx730_done
    eq rx730_pos, -1, rx730_fail
    jump $I10
  rx730_done:
    rx730_cur."!cursor_fail"()
    if_null rx730_debug, debug_687
    rx730_cur."!cursor_debug"("FAIL", "named_param")
  debug_687:
    .return (rx730_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("177_1283874336.57842") :method
.annotate 'line', 4
    $P732 = self."!PREFIX__!subrule"("param_var", ":")
    new $P733, "ResizablePMCArray"
    push $P733, $P732
    .return ($P733)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx736_debug, debug_688
    rx736_cur."!cursor_debug"("START", "default_value")
  debug_688:
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
.annotate 'line', 343
  # rx subrule "ws" subtype=method negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."ws"()
    unless $P10, rx736_fail
    rx736_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    ord $I11, rx736_tgt, $I11
    ne $I11, 61, rx736_fail
    add rx736_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."ws"()
    unless $P10, rx736_fail
    rx736_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."EXPR"("i=")
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx736_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."ws"()
    unless $P10, rx736_fail
    rx736_pos = $P10."pos"()
  # rx pass
    rx736_cur."!cursor_pass"(rx736_pos, "default_value")
    if_null rx736_debug, debug_689
    rx736_cur."!cursor_debug"("PASS", "default_value", " at pos=", rx736_pos)
  debug_689:
    .return (rx736_cur)
  rx736_restart:
.annotate 'line', 4
    if_null rx736_debug, debug_690
    rx736_cur."!cursor_debug"("NEXT", "default_value")
  debug_690:
  rx736_fail:
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    if_null rx736_debug, debug_691
    rx736_cur."!cursor_debug"("FAIL", "default_value")
  debug_691:
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("179_1283874336.57842") :method
.annotate 'line', 4
    $P738 = self."!PREFIX__!subrule"("ws", "")
    new $P739, "ResizablePMCArray"
    push $P739, $P738
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("180_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx745_tgt
    .local int rx745_pos
    .local int rx745_off
    .local int rx745_eos
    .local int rx745_rep
    .local pmc rx745_cur
    .local pmc rx745_debug
    (rx745_cur, rx745_pos, rx745_tgt, $I10) = self."!cursor_start"()
    rx745_cur."!cursor_caparray"("signature")
    getattribute rx745_debug, rx745_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx745_cur
    .local pmc match
    .lex "$/", match
    length rx745_eos, rx745_tgt
    gt rx745_pos, rx745_eos, rx745_done
    set rx745_off, 0
    lt rx745_pos, 2, rx745_start
    sub rx745_off, rx745_pos, 1
    substr rx745_tgt, rx745_tgt, rx745_off
  rx745_start:
    eq $I10, 1, rx745_restart
    if_null rx745_debug, debug_692
    rx745_cur."!cursor_debug"("START", "regex_declarator")
  debug_692:
    $I10 = self.'from'()
    ne $I10, -1, rxscan749_done
    goto rxscan749_scan
  rxscan749_loop:
    ($P10) = rx745_cur."from"()
    inc $P10
    set rx745_pos, $P10
    ge rx745_pos, rx745_eos, rxscan749_done
  rxscan749_scan:
    set_addr $I10, rxscan749_loop
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  rxscan749_done:
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  alt751_0:
.annotate 'line', 346
    set_addr $I10, alt751_1
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
.annotate 'line', 347
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_753_fail
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  # rx literal  "proto"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "proto", rx745_fail
    add rx745_pos, 5
    set_addr $I10, rxcap_753_fail
    ($I12, $I11) = rx745_cur."!mark_peek"($I10)
    rx745_cur."!cursor_pos"($I11)
    ($P10) = rx745_cur."!cursor_start"()
    $P10."!cursor_pass"(rx745_pos, "")
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_753_done
  rxcap_753_fail:
    goto rx745_fail
  rxcap_753_done:
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  alt755_0:
    set_addr $I10, alt755_1
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  # rx literal  "regex"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "regex", rx745_fail
    add rx745_pos, 5
    goto alt755_end
  alt755_1:
    set_addr $I10, alt755_2
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  # rx literal  "token"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "token", rx745_fail
    add rx745_pos, 5
    goto alt755_end
  alt755_2:
  # rx literal  "rule"
    add $I11, rx745_pos, 4
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 4
    ne $S10, "rule", rx745_fail
    add rx745_pos, 4
  alt755_end:
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 348
  # rx subrule "deflongname" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."deflongname"()
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx745_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  alt758_0:
.annotate 'line', 349
    set_addr $I10, alt758_1
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
.annotate 'line', 350
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 123, rx745_fail
    add rx745_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "<...>", rx745_fail
    add rx745_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 125, rx745_fail
    add rx745_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ENDSTMT"()
    unless $P10, rx745_fail
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
    goto alt758_end
  alt758_1:
.annotate 'line', 351
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  alt758_end:
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 347
    goto alt751_end
  alt751_1:
.annotate 'line', 353
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_768_fail
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  alt767_0:
    set_addr $I10, alt767_1
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  # rx literal  "regex"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "regex", rx745_fail
    add rx745_pos, 5
    goto alt767_end
  alt767_1:
    set_addr $I10, alt767_2
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  # rx literal  "token"
    add $I11, rx745_pos, 5
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 5
    ne $S10, "token", rx745_fail
    add rx745_pos, 5
    goto alt767_end
  alt767_2:
  # rx literal  "rule"
    add $I11, rx745_pos, 4
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I11, 4
    ne $S10, "rule", rx745_fail
    add rx745_pos, 4
  alt767_end:
    set_addr $I10, rxcap_768_fail
    ($I12, $I11) = rx745_cur."!mark_peek"($I10)
    rx745_cur."!cursor_pos"($I11)
    ($P10) = rx745_cur."!cursor_start"()
    $P10."!cursor_pass"(rx745_pos, "")
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_768_done
  rxcap_768_fail:
    goto rx745_fail
  rxcap_768_done:
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 354
  # rx subrule "deflongname" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."deflongname"()
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx745_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 355
  # rx subrule "newpad" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."newpad"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 356
  # rx rxquantr772 ** 0..1
    set_addr $I10, rxquantr772_done
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  rxquantr772_loop:
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 40, rx745_fail
    add rx745_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."signature"()
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx745_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 41, rx745_fail
    add rx745_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
    set_addr $I10, rxquantr772_done
    (rx745_rep) = rx745_cur."!mark_commit"($I10)
  rxquantr772_done:
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 357
  # rx reduce name="regex_declarator" key="open"
    rx745_cur."!cursor_pos"(rx745_pos)
    rx745_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 358
  # rx literal  "{"
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 123, rx745_fail
    add rx745_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."LANG"("Regex", "nibbler")
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx745_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx745_pos, 1
    gt $I11, rx745_eos, rx745_fail
    sub $I11, rx745_pos, rx745_off
    ord $I11, rx745_tgt, $I11
    ne $I11, 125, rx745_fail
    add rx745_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ENDSTMT"()
    unless $P10, rx745_fail
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
  alt751_end:
.annotate 'line', 359
  # rx subrule "ws" subtype=method negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."ws"()
    unless $P10, rx745_fail
    rx745_pos = $P10."pos"()
.annotate 'line', 345
  # rx pass
    rx745_cur."!cursor_pass"(rx745_pos, "regex_declarator")
    if_null rx745_debug, debug_693
    rx745_cur."!cursor_debug"("PASS", "regex_declarator", " at pos=", rx745_pos)
  debug_693:
    .return (rx745_cur)
  rx745_restart:
.annotate 'line', 4
    if_null rx745_debug, debug_694
    rx745_cur."!cursor_debug"("NEXT", "regex_declarator")
  debug_694:
  rx745_fail:
    (rx745_rep, rx745_pos, $I10, $P10) = rx745_cur."!mark_fail"(0)
    lt rx745_pos, -1, rx745_done
    eq rx745_pos, -1, rx745_fail
    jump $I10
  rx745_done:
    rx745_cur."!cursor_fail"()
    if_null rx745_debug, debug_695
    rx745_cur."!cursor_debug"("FAIL", "regex_declarator")
  debug_695:
    .return (rx745_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("181_1283874336.57842") :method
.annotate 'line', 4
    $P747 = self."!PREFIX__!subrule"("ws", "")
    new $P748, "ResizablePMCArray"
    push $P748, $P747
    .return ($P748)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("182_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    .local pmc rx782_debug
    (rx782_cur, rx782_pos, rx782_tgt, $I10) = self."!cursor_start"()
    rx782_cur."!cursor_caparray"("args")
    getattribute rx782_debug, rx782_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx782_cur
    .local pmc match
    .lex "$/", match
    length rx782_eos, rx782_tgt
    gt rx782_pos, rx782_eos, rx782_done
    set rx782_off, 0
    lt rx782_pos, 2, rx782_start
    sub rx782_off, rx782_pos, 1
    substr rx782_tgt, rx782_tgt, rx782_off
  rx782_start:
    eq $I10, 1, rx782_restart
    if_null rx782_debug, debug_696
    rx782_cur."!cursor_debug"("START", "dotty")
  debug_696:
    $I10 = self.'from'()
    ne $I10, -1, rxscan786_done
    goto rxscan786_scan
  rxscan786_loop:
    ($P10) = rx782_cur."from"()
    inc $P10
    set rx782_pos, $P10
    ge rx782_pos, rx782_eos, rxscan786_done
  rxscan786_scan:
    set_addr $I10, rxscan786_loop
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  rxscan786_done:
.annotate 'line', 363
  # rx literal  "."
    add $I11, rx782_pos, 1
    gt $I11, rx782_eos, rx782_fail
    sub $I11, rx782_pos, rx782_off
    ord $I11, rx782_tgt, $I11
    ne $I11, 46, rx782_fail
    add rx782_pos, 1
  alt787_0:
.annotate 'line', 364
    set_addr $I10, alt787_1
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."deflongname"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx782_pos = $P10."pos"()
    goto alt787_end
  alt787_1:
.annotate 'line', 365
  # rx enumcharlist negate=0 zerowidth
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx782_fail
  # rx subrule "quote" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."quote"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx782_pos = $P10."pos"()
  alt788_0:
.annotate 'line', 366
    set_addr $I10, alt788_1
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx782_fail
    goto alt788_end
  alt788_1:
  # rx subrule "panic" subtype=method negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx782_fail
    rx782_pos = $P10."pos"()
  alt788_end:
  alt787_end:
.annotate 'line', 372
  # rx rxquantr789 ** 0..1
    set_addr $I10, rxquantr789_done
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  rxquantr789_loop:
  alt790_0:
.annotate 'line', 369
    set_addr $I10, alt790_1
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
.annotate 'line', 370
  # rx enumcharlist negate=0 zerowidth
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx782_fail
  # rx subrule "args" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."args"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx782_pos = $P10."pos"()
    goto alt790_end
  alt790_1:
.annotate 'line', 371
  # rx literal  ":"
    add $I11, rx782_pos, 1
    gt $I11, rx782_eos, rx782_fail
    sub $I11, rx782_pos, rx782_off
    ord $I11, rx782_tgt, $I11
    ne $I11, 58, rx782_fail
    add rx782_pos, 1
  # rx charclass s
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    is_cclass $I11, 32, rx782_tgt, $I10
    unless $I11, rx782_fail
    inc rx782_pos
  # rx subrule "arglist" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."arglist"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx782_pos = $P10."pos"()
  alt790_end:
.annotate 'line', 372
    set_addr $I10, rxquantr789_done
    (rx782_rep) = rx782_cur."!mark_commit"($I10)
  rxquantr789_done:
.annotate 'line', 362
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "dotty")
    if_null rx782_debug, debug_697
    rx782_cur."!cursor_debug"("PASS", "dotty", " at pos=", rx782_pos)
  debug_697:
    .return (rx782_cur)
  rx782_restart:
.annotate 'line', 4
    if_null rx782_debug, debug_698
    rx782_cur."!cursor_debug"("NEXT", "dotty")
  debug_698:
  rx782_fail:
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    if_null rx782_debug, debug_699
    rx782_cur."!cursor_debug"("FAIL", "dotty")
  debug_699:
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("183_1283874336.57842") :method
.annotate 'line', 4
    $P784 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P785, "ResizablePMCArray"
    push $P785, "'"
    push $P785, "\""
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("184_1283874336.57842") :method
.annotate 'line', 376
    $P792 = self."!protoregex"("term")
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("185_1283874336.57842") :method
.annotate 'line', 376
    $P794 = self."!PREFIX__!protoregex"("term")
    .return ($P794)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("186_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx796_tgt
    .local int rx796_pos
    .local int rx796_off
    .local int rx796_eos
    .local int rx796_rep
    .local pmc rx796_cur
    .local pmc rx796_debug
    (rx796_cur, rx796_pos, rx796_tgt, $I10) = self."!cursor_start"()
    getattribute rx796_debug, rx796_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx796_cur
    .local pmc match
    .lex "$/", match
    length rx796_eos, rx796_tgt
    gt rx796_pos, rx796_eos, rx796_done
    set rx796_off, 0
    lt rx796_pos, 2, rx796_start
    sub rx796_off, rx796_pos, 1
    substr rx796_tgt, rx796_tgt, rx796_off
  rx796_start:
    eq $I10, 1, rx796_restart
    if_null rx796_debug, debug_700
    rx796_cur."!cursor_debug"("START", "term:sym<self>")
  debug_700:
    $I10 = self.'from'()
    ne $I10, -1, rxscan799_done
    goto rxscan799_scan
  rxscan799_loop:
    ($P10) = rx796_cur."from"()
    inc $P10
    set rx796_pos, $P10
    ge rx796_pos, rx796_eos, rxscan799_done
  rxscan799_scan:
    set_addr $I10, rxscan799_loop
    rx796_cur."!mark_push"(0, rx796_pos, $I10)
  rxscan799_done:
.annotate 'line', 378
  # rx subcapture "sym"
    set_addr $I10, rxcap_800_fail
    rx796_cur."!mark_push"(0, rx796_pos, $I10)
  # rx literal  "self"
    add $I11, rx796_pos, 4
    gt $I11, rx796_eos, rx796_fail
    sub $I11, rx796_pos, rx796_off
    substr $S10, rx796_tgt, $I11, 4
    ne $S10, "self", rx796_fail
    add rx796_pos, 4
    set_addr $I10, rxcap_800_fail
    ($I12, $I11) = rx796_cur."!mark_peek"($I10)
    rx796_cur."!cursor_pos"($I11)
    ($P10) = rx796_cur."!cursor_start"()
    $P10."!cursor_pass"(rx796_pos, "")
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_800_done
  rxcap_800_fail:
    goto rx796_fail
  rxcap_800_done:
  # rxanchor rwb
    le rx796_pos, 0, rx796_fail
    sub $I10, rx796_pos, rx796_off
    is_cclass $I11, 8192, rx796_tgt, $I10
    if $I11, rx796_fail
    dec $I10
    is_cclass $I11, 8192, rx796_tgt, $I10
    unless $I11, rx796_fail
  # rx pass
    rx796_cur."!cursor_pass"(rx796_pos, "term:sym<self>")
    if_null rx796_debug, debug_701
    rx796_cur."!cursor_debug"("PASS", "term:sym<self>", " at pos=", rx796_pos)
  debug_701:
    .return (rx796_cur)
  rx796_restart:
.annotate 'line', 4
    if_null rx796_debug, debug_702
    rx796_cur."!cursor_debug"("NEXT", "term:sym<self>")
  debug_702:
  rx796_fail:
    (rx796_rep, rx796_pos, $I10, $P10) = rx796_cur."!mark_fail"(0)
    lt rx796_pos, -1, rx796_done
    eq rx796_pos, -1, rx796_fail
    jump $I10
  rx796_done:
    rx796_cur."!cursor_fail"()
    if_null rx796_debug, debug_703
    rx796_cur."!cursor_debug"("FAIL", "term:sym<self>")
  debug_703:
    .return (rx796_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("187_1283874336.57842") :method
.annotate 'line', 4
    new $P798, "ResizablePMCArray"
    push $P798, "self"
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("188_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx802_tgt
    .local int rx802_pos
    .local int rx802_off
    .local int rx802_eos
    .local int rx802_rep
    .local pmc rx802_cur
    .local pmc rx802_debug
    (rx802_cur, rx802_pos, rx802_tgt, $I10) = self."!cursor_start"()
    getattribute rx802_debug, rx802_cur, "$!debug"
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
    eq $I10, 1, rx802_restart
    if_null rx802_debug, debug_704
    rx802_cur."!cursor_debug"("START", "term:sym<identifier>")
  debug_704:
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
  # rx subrule "deflongname" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."deflongname"()
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx802_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx802_pos, rx802_eos, rx802_fail
    sub $I10, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx802_fail
  # rx subrule "args" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."args"()
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx802_pos = $P10."pos"()
.annotate 'line', 380
  # rx pass
    rx802_cur."!cursor_pass"(rx802_pos, "term:sym<identifier>")
    if_null rx802_debug, debug_705
    rx802_cur."!cursor_debug"("PASS", "term:sym<identifier>", " at pos=", rx802_pos)
  debug_705:
    .return (rx802_cur)
  rx802_restart:
.annotate 'line', 4
    if_null rx802_debug, debug_706
    rx802_cur."!cursor_debug"("NEXT", "term:sym<identifier>")
  debug_706:
  rx802_fail:
    (rx802_rep, rx802_pos, $I10, $P10) = rx802_cur."!mark_fail"(0)
    lt rx802_pos, -1, rx802_done
    eq rx802_pos, -1, rx802_fail
    jump $I10
  rx802_done:
    rx802_cur."!cursor_fail"()
    if_null rx802_debug, debug_707
    rx802_cur."!cursor_debug"("FAIL", "term:sym<identifier>")
  debug_707:
    .return (rx802_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("189_1283874336.57842") :method
.annotate 'line', 4
    $P804 = self."!PREFIX__!subrule"("deflongname", "")
    new $P805, "ResizablePMCArray"
    push $P805, $P804
    .return ($P805)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("190_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx808_tgt
    .local int rx808_pos
    .local int rx808_off
    .local int rx808_eos
    .local int rx808_rep
    .local pmc rx808_cur
    .local pmc rx808_debug
    (rx808_cur, rx808_pos, rx808_tgt, $I10) = self."!cursor_start"()
    rx808_cur."!cursor_caparray"("args")
    getattribute rx808_debug, rx808_cur, "$!debug"
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
    eq $I10, 1, rx808_restart
    if_null rx808_debug, debug_708
    rx808_cur."!cursor_debug"("START", "term:sym<name>")
  debug_708:
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
.annotate 'line', 385
  # rx subrule "name" subtype=capture negate=
    rx808_cur."!cursor_pos"(rx808_pos)
    $P10 = rx808_cur."name"()
    unless $P10, rx808_fail
    rx808_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx808_pos = $P10."pos"()
  # rx rxquantr813 ** 0..1
    set_addr $I10, rxquantr813_done
    rx808_cur."!mark_push"(0, rx808_pos, $I10)
  rxquantr813_loop:
  # rx subrule "args" subtype=capture negate=
    rx808_cur."!cursor_pos"(rx808_pos)
    $P10 = rx808_cur."args"()
    unless $P10, rx808_fail
    goto rxsubrule814_pass
  rxsubrule814_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx808_fail
  rxsubrule814_pass:
    set_addr $I10, rxsubrule814_back
    rx808_cur."!mark_push"(0, rx808_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx808_pos = $P10."pos"()
    set_addr $I10, rxquantr813_done
    (rx808_rep) = rx808_cur."!mark_commit"($I10)
  rxquantr813_done:
.annotate 'line', 384
  # rx pass
    rx808_cur."!cursor_pass"(rx808_pos, "term:sym<name>")
    if_null rx808_debug, debug_709
    rx808_cur."!cursor_debug"("PASS", "term:sym<name>", " at pos=", rx808_pos)
  debug_709:
    .return (rx808_cur)
  rx808_restart:
.annotate 'line', 4
    if_null rx808_debug, debug_710
    rx808_cur."!cursor_debug"("NEXT", "term:sym<name>")
  debug_710:
  rx808_fail:
    (rx808_rep, rx808_pos, $I10, $P10) = rx808_cur."!mark_fail"(0)
    lt rx808_pos, -1, rx808_done
    eq rx808_pos, -1, rx808_fail
    jump $I10
  rx808_done:
    rx808_cur."!cursor_fail"()
    if_null rx808_debug, debug_711
    rx808_cur."!cursor_debug"("FAIL", "term:sym<name>")
  debug_711:
    .return (rx808_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("191_1283874336.57842") :method
.annotate 'line', 4
    $P810 = self."!PREFIX__!subrule"("name", "")
    new $P811, "ResizablePMCArray"
    push $P811, $P810
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("192_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx816_tgt
    .local int rx816_pos
    .local int rx816_off
    .local int rx816_eos
    .local int rx816_rep
    .local pmc rx816_cur
    .local pmc rx816_debug
    (rx816_cur, rx816_pos, rx816_tgt, $I10) = self."!cursor_start"()
    rx816_cur."!cursor_caparray"("args")
    getattribute rx816_debug, rx816_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx816_cur
    .local pmc match
    .lex "$/", match
    length rx816_eos, rx816_tgt
    gt rx816_pos, rx816_eos, rx816_done
    set rx816_off, 0
    lt rx816_pos, 2, rx816_start
    sub rx816_off, rx816_pos, 1
    substr rx816_tgt, rx816_tgt, rx816_off
  rx816_start:
    eq $I10, 1, rx816_restart
    if_null rx816_debug, debug_712
    rx816_cur."!cursor_debug"("START", "term:sym<pir::op>")
  debug_712:
    $I10 = self.'from'()
    ne $I10, -1, rxscan819_done
    goto rxscan819_scan
  rxscan819_loop:
    ($P10) = rx816_cur."from"()
    inc $P10
    set rx816_pos, $P10
    ge rx816_pos, rx816_eos, rxscan819_done
  rxscan819_scan:
    set_addr $I10, rxscan819_loop
    rx816_cur."!mark_push"(0, rx816_pos, $I10)
  rxscan819_done:
.annotate 'line', 389
  # rx literal  "pir::"
    add $I11, rx816_pos, 5
    gt $I11, rx816_eos, rx816_fail
    sub $I11, rx816_pos, rx816_off
    substr $S10, rx816_tgt, $I11, 5
    ne $S10, "pir::", rx816_fail
    add rx816_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_820_fail
    rx816_cur."!mark_push"(0, rx816_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx816_pos, rx816_off
    find_not_cclass $I11, 8192, rx816_tgt, $I10, rx816_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx816_fail
    add rx816_pos, rx816_off, $I11
    set_addr $I10, rxcap_820_fail
    ($I12, $I11) = rx816_cur."!mark_peek"($I10)
    rx816_cur."!cursor_pos"($I11)
    ($P10) = rx816_cur."!cursor_start"()
    $P10."!cursor_pass"(rx816_pos, "")
    rx816_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_820_done
  rxcap_820_fail:
    goto rx816_fail
  rxcap_820_done:
  # rx rxquantr821 ** 0..1
    set_addr $I10, rxquantr821_done
    rx816_cur."!mark_push"(0, rx816_pos, $I10)
  rxquantr821_loop:
  # rx subrule "args" subtype=capture negate=
    rx816_cur."!cursor_pos"(rx816_pos)
    $P10 = rx816_cur."args"()
    unless $P10, rx816_fail
    goto rxsubrule822_pass
  rxsubrule822_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx816_fail
  rxsubrule822_pass:
    set_addr $I10, rxsubrule822_back
    rx816_cur."!mark_push"(0, rx816_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx816_pos = $P10."pos"()
    set_addr $I10, rxquantr821_done
    (rx816_rep) = rx816_cur."!mark_commit"($I10)
  rxquantr821_done:
.annotate 'line', 388
  # rx pass
    rx816_cur."!cursor_pass"(rx816_pos, "term:sym<pir::op>")
    if_null rx816_debug, debug_713
    rx816_cur."!cursor_debug"("PASS", "term:sym<pir::op>", " at pos=", rx816_pos)
  debug_713:
    .return (rx816_cur)
  rx816_restart:
.annotate 'line', 4
    if_null rx816_debug, debug_714
    rx816_cur."!cursor_debug"("NEXT", "term:sym<pir::op>")
  debug_714:
  rx816_fail:
    (rx816_rep, rx816_pos, $I10, $P10) = rx816_cur."!mark_fail"(0)
    lt rx816_pos, -1, rx816_done
    eq rx816_pos, -1, rx816_fail
    jump $I10
  rx816_done:
    rx816_cur."!cursor_fail"()
    if_null rx816_debug, debug_715
    rx816_cur."!cursor_debug"("FAIL", "term:sym<pir::op>")
  debug_715:
    .return (rx816_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("193_1283874336.57842") :method
.annotate 'line', 4
    new $P818, "ResizablePMCArray"
    push $P818, "pir::"
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("194_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    .local pmc rx824_debug
    (rx824_cur, rx824_pos, rx824_tgt, $I10) = self."!cursor_start"()
    getattribute rx824_debug, rx824_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx824_cur
    .local pmc match
    .lex "$/", match
    length rx824_eos, rx824_tgt
    gt rx824_pos, rx824_eos, rx824_done
    set rx824_off, 0
    lt rx824_pos, 2, rx824_start
    sub rx824_off, rx824_pos, 1
    substr rx824_tgt, rx824_tgt, rx824_off
  rx824_start:
    eq $I10, 1, rx824_restart
    if_null rx824_debug, debug_716
    rx824_cur."!cursor_debug"("START", "args")
  debug_716:
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
.annotate 'line', 393
  # rx literal  "("
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    ord $I11, rx824_tgt, $I11
    ne $I11, 40, rx824_fail
    add rx824_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."arglist"()
    unless $P10, rx824_fail
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx824_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    ord $I11, rx824_tgt, $I11
    ne $I11, 41, rx824_fail
    add rx824_pos, 1
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "args")
    if_null rx824_debug, debug_717
    rx824_cur."!cursor_debug"("PASS", "args", " at pos=", rx824_pos)
  debug_717:
    .return (rx824_cur)
  rx824_restart:
.annotate 'line', 4
    if_null rx824_debug, debug_718
    rx824_cur."!cursor_debug"("NEXT", "args")
  debug_718:
  rx824_fail:
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    if_null rx824_debug, debug_719
    rx824_cur."!cursor_debug"("FAIL", "args")
  debug_719:
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("195_1283874336.57842") :method
.annotate 'line', 4
    $P826 = self."!PREFIX__!subrule"("arglist", "(")
    new $P827, "ResizablePMCArray"
    push $P827, $P826
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("196_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    .local pmc rx830_debug
    (rx830_cur, rx830_pos, rx830_tgt, $I10) = self."!cursor_start"()
    getattribute rx830_debug, rx830_cur, "$!debug"
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
    eq $I10, 1, rx830_restart
    if_null rx830_debug, debug_720
    rx830_cur."!cursor_debug"("START", "arglist")
  debug_720:
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
.annotate 'line', 397
  # rx subrule "ws" subtype=method negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."ws"()
    unless $P10, rx830_fail
    rx830_pos = $P10."pos"()
  alt835_0:
.annotate 'line', 398
    set_addr $I10, alt835_1
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
.annotate 'line', 399
  # rx subrule "EXPR" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."EXPR"("f=")
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx830_pos = $P10."pos"()
    goto alt835_end
  alt835_1:
  alt835_end:
.annotate 'line', 396
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "arglist")
    if_null rx830_debug, debug_721
    rx830_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx830_pos)
  debug_721:
    .return (rx830_cur)
  rx830_restart:
.annotate 'line', 4
    if_null rx830_debug, debug_722
    rx830_cur."!cursor_debug"("NEXT", "arglist")
  debug_722:
  rx830_fail:
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    if_null rx830_debug, debug_723
    rx830_cur."!cursor_debug"("FAIL", "arglist")
  debug_723:
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("197_1283874336.57842") :method
.annotate 'line', 4
    $P832 = self."!PREFIX__!subrule"("ws", "")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("198_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    .local pmc rx837_debug
    (rx837_cur, rx837_pos, rx837_tgt, $I10) = self."!cursor_start"()
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
    if_null rx837_debug, debug_724
    rx837_cur."!cursor_debug"("START", "term:sym<value>")
  debug_724:
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
.annotate 'line', 405
  # rx subrule "value" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."value"()
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx837_pos = $P10."pos"()
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "term:sym<value>")
    if_null rx837_debug, debug_725
    rx837_cur."!cursor_debug"("PASS", "term:sym<value>", " at pos=", rx837_pos)
  debug_725:
    .return (rx837_cur)
  rx837_restart:
.annotate 'line', 4
    if_null rx837_debug, debug_726
    rx837_cur."!cursor_debug"("NEXT", "term:sym<value>")
  debug_726:
  rx837_fail:
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    if_null rx837_debug, debug_727
    rx837_cur."!cursor_debug"("FAIL", "term:sym<value>")
  debug_727:
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("199_1283874336.57842") :method
.annotate 'line', 4
    $P839 = self."!PREFIX__!subrule"("value", "")
    new $P840, "ResizablePMCArray"
    push $P840, $P839
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("200_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    .local pmc rx843_debug
    (rx843_cur, rx843_pos, rx843_tgt, $I10) = self."!cursor_start"()
    getattribute rx843_debug, rx843_cur, "$!debug"
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
    eq $I10, 1, rx843_restart
    if_null rx843_debug, debug_728
    rx843_cur."!cursor_debug"("START", "value")
  debug_728:
    $I10 = self.'from'()
    ne $I10, -1, rxscan848_done
    goto rxscan848_scan
  rxscan848_loop:
    ($P10) = rx843_cur."from"()
    inc $P10
    set rx843_pos, $P10
    ge rx843_pos, rx843_eos, rxscan848_done
  rxscan848_scan:
    set_addr $I10, rxscan848_loop
    rx843_cur."!mark_push"(0, rx843_pos, $I10)
  rxscan848_done:
  alt849_0:
.annotate 'line', 407
    set_addr $I10, alt849_1
    rx843_cur."!mark_push"(0, rx843_pos, $I10)
.annotate 'line', 408
  # rx subrule "quote" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."quote"()
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx843_pos = $P10."pos"()
    goto alt849_end
  alt849_1:
.annotate 'line', 409
  # rx subrule "number" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."number"()
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx843_pos = $P10."pos"()
  alt849_end:
.annotate 'line', 407
  # rx pass
    rx843_cur."!cursor_pass"(rx843_pos, "value")
    if_null rx843_debug, debug_729
    rx843_cur."!cursor_debug"("PASS", "value", " at pos=", rx843_pos)
  debug_729:
    .return (rx843_cur)
  rx843_restart:
.annotate 'line', 4
    if_null rx843_debug, debug_730
    rx843_cur."!cursor_debug"("NEXT", "value")
  debug_730:
  rx843_fail:
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    if_null rx843_debug, debug_731
    rx843_cur."!cursor_debug"("FAIL", "value")
  debug_731:
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("201_1283874336.57842") :method
.annotate 'line', 4
    $P845 = self."!PREFIX__!subrule"("number", "")
    $P846 = self."!PREFIX__!subrule"("quote", "")
    new $P847, "ResizablePMCArray"
    push $P847, $P845
    push $P847, $P846
    .return ($P847)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("202_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    .local pmc rx851_debug
    (rx851_cur, rx851_pos, rx851_tgt, $I10) = self."!cursor_start"()
    getattribute rx851_debug, rx851_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx851_cur
    .local pmc match
    .lex "$/", match
    length rx851_eos, rx851_tgt
    gt rx851_pos, rx851_eos, rx851_done
    set rx851_off, 0
    lt rx851_pos, 2, rx851_start
    sub rx851_off, rx851_pos, 1
    substr rx851_tgt, rx851_tgt, rx851_off
  rx851_start:
    eq $I10, 1, rx851_restart
    if_null rx851_debug, debug_732
    rx851_cur."!cursor_debug"("START", "number")
  debug_732:
    $I10 = self.'from'()
    ne $I10, -1, rxscan854_done
    goto rxscan854_scan
  rxscan854_loop:
    ($P10) = rx851_cur."from"()
    inc $P10
    set rx851_pos, $P10
    ge rx851_pos, rx851_eos, rxscan854_done
  rxscan854_scan:
    set_addr $I10, rxscan854_loop
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  rxscan854_done:
.annotate 'line', 413
  # rx subcapture "sign"
    set_addr $I10, rxcap_856_fail
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx851_pos, rx851_off
    set rx851_rep, 0
    sub $I12, rx851_eos, rx851_pos
    le $I12, 1, rxenumcharlistq855_loop
    set $I12, 1
  rxenumcharlistq855_loop:
    le $I12, 0, rxenumcharlistq855_done
    substr $S10, rx851_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq855_done
    inc rx851_rep
  rxenumcharlistq855_done:
    add rx851_pos, rx851_pos, rx851_rep
    set_addr $I10, rxcap_856_fail
    ($I12, $I11) = rx851_cur."!mark_peek"($I10)
    rx851_cur."!cursor_pos"($I11)
    ($P10) = rx851_cur."!cursor_start"()
    $P10."!cursor_pass"(rx851_pos, "")
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_856_done
  rxcap_856_fail:
    goto rx851_fail
  rxcap_856_done:
  alt857_0:
.annotate 'line', 414
    set_addr $I10, alt857_1
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."dec_number"()
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx851_pos = $P10."pos"()
    goto alt857_end
  alt857_1:
  # rx subrule "integer" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."integer"()
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx851_pos = $P10."pos"()
  alt857_end:
.annotate 'line', 412
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "number")
    if_null rx851_debug, debug_733
    rx851_cur."!cursor_debug"("PASS", "number", " at pos=", rx851_pos)
  debug_733:
    .return (rx851_cur)
  rx851_restart:
.annotate 'line', 4
    if_null rx851_debug, debug_734
    rx851_cur."!cursor_debug"("NEXT", "number")
  debug_734:
  rx851_fail:
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    if_null rx851_debug, debug_735
    rx851_cur."!cursor_debug"("FAIL", "number")
  debug_735:
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("203_1283874336.57842") :method
.annotate 'line', 4
    new $P853, "ResizablePMCArray"
    push $P853, ""
    .return ($P853)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("204_1283874336.57842") :method
.annotate 'line', 417
    $P859 = self."!protoregex"("quote")
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("205_1283874336.57842") :method
.annotate 'line', 417
    $P861 = self."!PREFIX__!protoregex"("quote")
    .return ($P861)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("206_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx863_debug, debug_736
    rx863_cur."!cursor_debug"("START", "quote:sym<apos>")
  debug_736:
    $I10 = self.'from'()
    ne $I10, -1, rxscan866_done
    goto rxscan866_scan
  rxscan866_loop:
    ($P10) = rx863_cur."from"()
    inc $P10
    set rx863_pos, $P10
    ge rx863_pos, rx863_eos, rxscan866_done
  rxscan866_scan:
    set_addr $I10, rxscan866_loop
    rx863_cur."!mark_push"(0, rx863_pos, $I10)
  rxscan866_done:
.annotate 'line', 418
  # rx enumcharlist negate=0 zerowidth
    ge rx863_pos, rx863_eos, rx863_fail
    sub $I10, rx863_pos, rx863_off
    substr $S10, rx863_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx863_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."quote_EXPR"(":q")
    unless $P10, rx863_fail
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx863_pos = $P10."pos"()
  # rx pass
    rx863_cur."!cursor_pass"(rx863_pos, "quote:sym<apos>")
    if_null rx863_debug, debug_737
    rx863_cur."!cursor_debug"("PASS", "quote:sym<apos>", " at pos=", rx863_pos)
  debug_737:
    .return (rx863_cur)
  rx863_restart:
.annotate 'line', 4
    if_null rx863_debug, debug_738
    rx863_cur."!cursor_debug"("NEXT", "quote:sym<apos>")
  debug_738:
  rx863_fail:
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    if_null rx863_debug, debug_739
    rx863_cur."!cursor_debug"("FAIL", "quote:sym<apos>")
  debug_739:
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("207_1283874336.57842") :method
.annotate 'line', 4
    new $P865, "ResizablePMCArray"
    push $P865, "'"
    .return ($P865)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("208_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx868_tgt
    .local int rx868_pos
    .local int rx868_off
    .local int rx868_eos
    .local int rx868_rep
    .local pmc rx868_cur
    .local pmc rx868_debug
    (rx868_cur, rx868_pos, rx868_tgt, $I10) = self."!cursor_start"()
    getattribute rx868_debug, rx868_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx868_cur
    .local pmc match
    .lex "$/", match
    length rx868_eos, rx868_tgt
    gt rx868_pos, rx868_eos, rx868_done
    set rx868_off, 0
    lt rx868_pos, 2, rx868_start
    sub rx868_off, rx868_pos, 1
    substr rx868_tgt, rx868_tgt, rx868_off
  rx868_start:
    eq $I10, 1, rx868_restart
    if_null rx868_debug, debug_740
    rx868_cur."!cursor_debug"("START", "quote:sym<dblq>")
  debug_740:
    $I10 = self.'from'()
    ne $I10, -1, rxscan871_done
    goto rxscan871_scan
  rxscan871_loop:
    ($P10) = rx868_cur."from"()
    inc $P10
    set rx868_pos, $P10
    ge rx868_pos, rx868_eos, rxscan871_done
  rxscan871_scan:
    set_addr $I10, rxscan871_loop
    rx868_cur."!mark_push"(0, rx868_pos, $I10)
  rxscan871_done:
.annotate 'line', 419
  # rx enumcharlist negate=0 zerowidth
    ge rx868_pos, rx868_eos, rx868_fail
    sub $I10, rx868_pos, rx868_off
    substr $S10, rx868_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx868_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx868_cur."!cursor_pos"(rx868_pos)
    $P10 = rx868_cur."quote_EXPR"(":qq")
    unless $P10, rx868_fail
    rx868_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx868_pos = $P10."pos"()
  # rx pass
    rx868_cur."!cursor_pass"(rx868_pos, "quote:sym<dblq>")
    if_null rx868_debug, debug_741
    rx868_cur."!cursor_debug"("PASS", "quote:sym<dblq>", " at pos=", rx868_pos)
  debug_741:
    .return (rx868_cur)
  rx868_restart:
.annotate 'line', 4
    if_null rx868_debug, debug_742
    rx868_cur."!cursor_debug"("NEXT", "quote:sym<dblq>")
  debug_742:
  rx868_fail:
    (rx868_rep, rx868_pos, $I10, $P10) = rx868_cur."!mark_fail"(0)
    lt rx868_pos, -1, rx868_done
    eq rx868_pos, -1, rx868_fail
    jump $I10
  rx868_done:
    rx868_cur."!cursor_fail"()
    if_null rx868_debug, debug_743
    rx868_cur."!cursor_debug"("FAIL", "quote:sym<dblq>")
  debug_743:
    .return (rx868_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("209_1283874336.57842") :method
.annotate 'line', 4
    new $P870, "ResizablePMCArray"
    push $P870, "\""
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("210_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx873_tgt
    .local int rx873_pos
    .local int rx873_off
    .local int rx873_eos
    .local int rx873_rep
    .local pmc rx873_cur
    .local pmc rx873_debug
    (rx873_cur, rx873_pos, rx873_tgt, $I10) = self."!cursor_start"()
    getattribute rx873_debug, rx873_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx873_cur
    .local pmc match
    .lex "$/", match
    length rx873_eos, rx873_tgt
    gt rx873_pos, rx873_eos, rx873_done
    set rx873_off, 0
    lt rx873_pos, 2, rx873_start
    sub rx873_off, rx873_pos, 1
    substr rx873_tgt, rx873_tgt, rx873_off
  rx873_start:
    eq $I10, 1, rx873_restart
    if_null rx873_debug, debug_744
    rx873_cur."!cursor_debug"("START", "quote:sym<q>")
  debug_744:
    $I10 = self.'from'()
    ne $I10, -1, rxscan877_done
    goto rxscan877_scan
  rxscan877_loop:
    ($P10) = rx873_cur."from"()
    inc $P10
    set rx873_pos, $P10
    ge rx873_pos, rx873_eos, rxscan877_done
  rxscan877_scan:
    set_addr $I10, rxscan877_loop
    rx873_cur."!mark_push"(0, rx873_pos, $I10)
  rxscan877_done:
.annotate 'line', 420
  # rx literal  "q"
    add $I11, rx873_pos, 1
    gt $I11, rx873_eos, rx873_fail
    sub $I11, rx873_pos, rx873_off
    ord $I11, rx873_tgt, $I11
    ne $I11, 113, rx873_fail
    add rx873_pos, 1
  # rxanchor rwb
    le rx873_pos, 0, rx873_fail
    sub $I10, rx873_pos, rx873_off
    is_cclass $I11, 8192, rx873_tgt, $I10
    if $I11, rx873_fail
    dec $I10
    is_cclass $I11, 8192, rx873_tgt, $I10
    unless $I11, rx873_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx873_pos, rx873_eos, rx873_fail
    sub $I10, rx873_pos, rx873_off
    substr $S10, rx873_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx873_fail
  # rx subrule "ws" subtype=method negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."ws"()
    unless $P10, rx873_fail
    rx873_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."quote_EXPR"(":q")
    unless $P10, rx873_fail
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx873_pos = $P10."pos"()
  # rx pass
    rx873_cur."!cursor_pass"(rx873_pos, "quote:sym<q>")
    if_null rx873_debug, debug_745
    rx873_cur."!cursor_debug"("PASS", "quote:sym<q>", " at pos=", rx873_pos)
  debug_745:
    .return (rx873_cur)
  rx873_restart:
.annotate 'line', 4
    if_null rx873_debug, debug_746
    rx873_cur."!cursor_debug"("NEXT", "quote:sym<q>")
  debug_746:
  rx873_fail:
    (rx873_rep, rx873_pos, $I10, $P10) = rx873_cur."!mark_fail"(0)
    lt rx873_pos, -1, rx873_done
    eq rx873_pos, -1, rx873_fail
    jump $I10
  rx873_done:
    rx873_cur."!cursor_fail"()
    if_null rx873_debug, debug_747
    rx873_cur."!cursor_debug"("FAIL", "quote:sym<q>")
  debug_747:
    .return (rx873_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("211_1283874336.57842") :method
.annotate 'line', 4
    $P875 = self."!PREFIX__!subrule"("ws", "q")
    new $P876, "ResizablePMCArray"
    push $P876, $P875
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("212_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx879_tgt
    .local int rx879_pos
    .local int rx879_off
    .local int rx879_eos
    .local int rx879_rep
    .local pmc rx879_cur
    .local pmc rx879_debug
    (rx879_cur, rx879_pos, rx879_tgt, $I10) = self."!cursor_start"()
    getattribute rx879_debug, rx879_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx879_cur
    .local pmc match
    .lex "$/", match
    length rx879_eos, rx879_tgt
    gt rx879_pos, rx879_eos, rx879_done
    set rx879_off, 0
    lt rx879_pos, 2, rx879_start
    sub rx879_off, rx879_pos, 1
    substr rx879_tgt, rx879_tgt, rx879_off
  rx879_start:
    eq $I10, 1, rx879_restart
    if_null rx879_debug, debug_748
    rx879_cur."!cursor_debug"("START", "quote:sym<qq>")
  debug_748:
    $I10 = self.'from'()
    ne $I10, -1, rxscan883_done
    goto rxscan883_scan
  rxscan883_loop:
    ($P10) = rx879_cur."from"()
    inc $P10
    set rx879_pos, $P10
    ge rx879_pos, rx879_eos, rxscan883_done
  rxscan883_scan:
    set_addr $I10, rxscan883_loop
    rx879_cur."!mark_push"(0, rx879_pos, $I10)
  rxscan883_done:
.annotate 'line', 421
  # rx literal  "qq"
    add $I11, rx879_pos, 2
    gt $I11, rx879_eos, rx879_fail
    sub $I11, rx879_pos, rx879_off
    substr $S10, rx879_tgt, $I11, 2
    ne $S10, "qq", rx879_fail
    add rx879_pos, 2
  # rxanchor rwb
    le rx879_pos, 0, rx879_fail
    sub $I10, rx879_pos, rx879_off
    is_cclass $I11, 8192, rx879_tgt, $I10
    if $I11, rx879_fail
    dec $I10
    is_cclass $I11, 8192, rx879_tgt, $I10
    unless $I11, rx879_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx879_pos, rx879_eos, rx879_fail
    sub $I10, rx879_pos, rx879_off
    substr $S10, rx879_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx879_fail
  # rx subrule "ws" subtype=method negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."ws"()
    unless $P10, rx879_fail
    rx879_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."quote_EXPR"(":qq")
    unless $P10, rx879_fail
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx879_pos = $P10."pos"()
  # rx pass
    rx879_cur."!cursor_pass"(rx879_pos, "quote:sym<qq>")
    if_null rx879_debug, debug_749
    rx879_cur."!cursor_debug"("PASS", "quote:sym<qq>", " at pos=", rx879_pos)
  debug_749:
    .return (rx879_cur)
  rx879_restart:
.annotate 'line', 4
    if_null rx879_debug, debug_750
    rx879_cur."!cursor_debug"("NEXT", "quote:sym<qq>")
  debug_750:
  rx879_fail:
    (rx879_rep, rx879_pos, $I10, $P10) = rx879_cur."!mark_fail"(0)
    lt rx879_pos, -1, rx879_done
    eq rx879_pos, -1, rx879_fail
    jump $I10
  rx879_done:
    rx879_cur."!cursor_fail"()
    if_null rx879_debug, debug_751
    rx879_cur."!cursor_debug"("FAIL", "quote:sym<qq>")
  debug_751:
    .return (rx879_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("213_1283874336.57842") :method
.annotate 'line', 4
    $P881 = self."!PREFIX__!subrule"("ws", "qq")
    new $P882, "ResizablePMCArray"
    push $P882, $P881
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("214_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    .local pmc rx885_debug
    (rx885_cur, rx885_pos, rx885_tgt, $I10) = self."!cursor_start"()
    getattribute rx885_debug, rx885_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx885_cur
    .local pmc match
    .lex "$/", match
    length rx885_eos, rx885_tgt
    gt rx885_pos, rx885_eos, rx885_done
    set rx885_off, 0
    lt rx885_pos, 2, rx885_start
    sub rx885_off, rx885_pos, 1
    substr rx885_tgt, rx885_tgt, rx885_off
  rx885_start:
    eq $I10, 1, rx885_restart
    if_null rx885_debug, debug_752
    rx885_cur."!cursor_debug"("START", "quote:sym<Q>")
  debug_752:
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
.annotate 'line', 422
  # rx literal  "Q"
    add $I11, rx885_pos, 1
    gt $I11, rx885_eos, rx885_fail
    sub $I11, rx885_pos, rx885_off
    ord $I11, rx885_tgt, $I11
    ne $I11, 81, rx885_fail
    add rx885_pos, 1
  # rxanchor rwb
    le rx885_pos, 0, rx885_fail
    sub $I10, rx885_pos, rx885_off
    is_cclass $I11, 8192, rx885_tgt, $I10
    if $I11, rx885_fail
    dec $I10
    is_cclass $I11, 8192, rx885_tgt, $I10
    unless $I11, rx885_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx885_pos, rx885_eos, rx885_fail
    sub $I10, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx885_fail
  # rx subrule "ws" subtype=method negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."ws"()
    unless $P10, rx885_fail
    rx885_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."quote_EXPR"()
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx885_pos = $P10."pos"()
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "quote:sym<Q>")
    if_null rx885_debug, debug_753
    rx885_cur."!cursor_debug"("PASS", "quote:sym<Q>", " at pos=", rx885_pos)
  debug_753:
    .return (rx885_cur)
  rx885_restart:
.annotate 'line', 4
    if_null rx885_debug, debug_754
    rx885_cur."!cursor_debug"("NEXT", "quote:sym<Q>")
  debug_754:
  rx885_fail:
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    if_null rx885_debug, debug_755
    rx885_cur."!cursor_debug"("FAIL", "quote:sym<Q>")
  debug_755:
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("215_1283874336.57842") :method
.annotate 'line', 4
    $P887 = self."!PREFIX__!subrule"("ws", "Q")
    new $P888, "ResizablePMCArray"
    push $P888, $P887
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("216_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    .local pmc rx891_debug
    (rx891_cur, rx891_pos, rx891_tgt, $I10) = self."!cursor_start"()
    getattribute rx891_debug, rx891_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx891_cur
    .local pmc match
    .lex "$/", match
    length rx891_eos, rx891_tgt
    gt rx891_pos, rx891_eos, rx891_done
    set rx891_off, 0
    lt rx891_pos, 2, rx891_start
    sub rx891_off, rx891_pos, 1
    substr rx891_tgt, rx891_tgt, rx891_off
  rx891_start:
    eq $I10, 1, rx891_restart
    if_null rx891_debug, debug_756
    rx891_cur."!cursor_debug"("START", "quote:sym<Q:PIR>")
  debug_756:
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
.annotate 'line', 423
  # rx literal  "Q:PIR"
    add $I11, rx891_pos, 5
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 5
    ne $S10, "Q:PIR", rx891_fail
    add rx891_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."ws"()
    unless $P10, rx891_fail
    rx891_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."quote_EXPR"()
    unless $P10, rx891_fail
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx891_pos = $P10."pos"()
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "quote:sym<Q:PIR>")
    if_null rx891_debug, debug_757
    rx891_cur."!cursor_debug"("PASS", "quote:sym<Q:PIR>", " at pos=", rx891_pos)
  debug_757:
    .return (rx891_cur)
  rx891_restart:
.annotate 'line', 4
    if_null rx891_debug, debug_758
    rx891_cur."!cursor_debug"("NEXT", "quote:sym<Q:PIR>")
  debug_758:
  rx891_fail:
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    if_null rx891_debug, debug_759
    rx891_cur."!cursor_debug"("FAIL", "quote:sym<Q:PIR>")
  debug_759:
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("217_1283874336.57842") :method
.annotate 'line', 4
    $P893 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P894, "ResizablePMCArray"
    push $P894, $P893
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("218_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx897_debug, debug_760
    rx897_cur."!cursor_debug"("START", "quote:sym</ />")
  debug_760:
    $I10 = self.'from'()
    ne $I10, -1, rxscan901_done
    goto rxscan901_scan
  rxscan901_loop:
    ($P10) = rx897_cur."from"()
    inc $P10
    set rx897_pos, $P10
    ge rx897_pos, rx897_eos, rxscan901_done
  rxscan901_scan:
    set_addr $I10, rxscan901_loop
    rx897_cur."!mark_push"(0, rx897_pos, $I10)
  rxscan901_done:
.annotate 'line', 425
  # rx literal  "/"
    add $I11, rx897_pos, 1
    gt $I11, rx897_eos, rx897_fail
    sub $I11, rx897_pos, rx897_off
    ord $I11, rx897_tgt, $I11
    ne $I11, 47, rx897_fail
    add rx897_pos, 1
.annotate 'line', 426
  # rx subrule "newpad" subtype=method negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."newpad"()
    unless $P10, rx897_fail
    rx897_pos = $P10."pos"()
.annotate 'line', 427
  # rx reduce name="quote:sym</ />" key="open"
    rx897_cur."!cursor_pos"(rx897_pos)
    rx897_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 428
  # rx subrule "LANG" subtype=capture negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."LANG"("Regex", "nibbler")
    unless $P10, rx897_fail
    rx897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx897_pos = $P10."pos"()
.annotate 'line', 429
  # rx literal  "/"
    add $I11, rx897_pos, 1
    gt $I11, rx897_eos, rx897_fail
    sub $I11, rx897_pos, rx897_off
    ord $I11, rx897_tgt, $I11
    ne $I11, 47, rx897_fail
    add rx897_pos, 1
.annotate 'line', 424
  # rx pass
    rx897_cur."!cursor_pass"(rx897_pos, "quote:sym</ />")
    if_null rx897_debug, debug_761
    rx897_cur."!cursor_debug"("PASS", "quote:sym</ />", " at pos=", rx897_pos)
  debug_761:
    .return (rx897_cur)
  rx897_restart:
.annotate 'line', 4
    if_null rx897_debug, debug_762
    rx897_cur."!cursor_debug"("NEXT", "quote:sym</ />")
  debug_762:
  rx897_fail:
    (rx897_rep, rx897_pos, $I10, $P10) = rx897_cur."!mark_fail"(0)
    lt rx897_pos, -1, rx897_done
    eq rx897_pos, -1, rx897_fail
    jump $I10
  rx897_done:
    rx897_cur."!cursor_fail"()
    if_null rx897_debug, debug_763
    rx897_cur."!cursor_debug"("FAIL", "quote:sym</ />")
  debug_763:
    .return (rx897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("219_1283874336.57842") :method
.annotate 'line', 4
    $P899 = self."!PREFIX__!subrule"("newpad", "/")
    new $P900, "ResizablePMCArray"
    push $P900, $P899
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("220_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    .local pmc rx903_debug
    (rx903_cur, rx903_pos, rx903_tgt, $I10) = self."!cursor_start"()
    getattribute rx903_debug, rx903_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx903_cur
    .local pmc match
    .lex "$/", match
    length rx903_eos, rx903_tgt
    gt rx903_pos, rx903_eos, rx903_done
    set rx903_off, 0
    lt rx903_pos, 2, rx903_start
    sub rx903_off, rx903_pos, 1
    substr rx903_tgt, rx903_tgt, rx903_off
  rx903_start:
    eq $I10, 1, rx903_restart
    if_null rx903_debug, debug_764
    rx903_cur."!cursor_debug"("START", "quote_escape:sym<$>")
  debug_764:
    $I10 = self.'from'()
    ne $I10, -1, rxscan906_done
    goto rxscan906_scan
  rxscan906_loop:
    ($P10) = rx903_cur."from"()
    inc $P10
    set rx903_pos, $P10
    ge rx903_pos, rx903_eos, rxscan906_done
  rxscan906_scan:
    set_addr $I10, rxscan906_loop
    rx903_cur."!mark_push"(0, rx903_pos, $I10)
  rxscan906_done:
.annotate 'line', 432
  # rx enumcharlist negate=0 zerowidth
    ge rx903_pos, rx903_eos, rx903_fail
    sub $I10, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx903_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."quotemod_check"("s")
    unless $P10, rx903_fail
  # rx subrule "variable" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."variable"()
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx903_pos = $P10."pos"()
  # rx pass
    rx903_cur."!cursor_pass"(rx903_pos, "quote_escape:sym<$>")
    if_null rx903_debug, debug_765
    rx903_cur."!cursor_debug"("PASS", "quote_escape:sym<$>", " at pos=", rx903_pos)
  debug_765:
    .return (rx903_cur)
  rx903_restart:
.annotate 'line', 4
    if_null rx903_debug, debug_766
    rx903_cur."!cursor_debug"("NEXT", "quote_escape:sym<$>")
  debug_766:
  rx903_fail:
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    if_null rx903_debug, debug_767
    rx903_cur."!cursor_debug"("FAIL", "quote_escape:sym<$>")
  debug_767:
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("221_1283874336.57842") :method
.annotate 'line', 4
    new $P905, "ResizablePMCArray"
    push $P905, "$"
    .return ($P905)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("222_1283874336.57842") :method :outer("11_1283874336.57842")
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
    if_null rx908_debug, debug_768
    rx908_cur."!cursor_debug"("START", "quote_escape:sym<{ }>")
  debug_768:
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
.annotate 'line', 433
  # rx enumcharlist negate=0 zerowidth
    ge rx908_pos, rx908_eos, rx908_fail
    sub $I10, rx908_pos, rx908_off
    substr $S10, rx908_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx908_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."quotemod_check"("c")
    unless $P10, rx908_fail
  # rx subrule "block" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."block"()
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx908_pos = $P10."pos"()
  # rx pass
    rx908_cur."!cursor_pass"(rx908_pos, "quote_escape:sym<{ }>")
    if_null rx908_debug, debug_769
    rx908_cur."!cursor_debug"("PASS", "quote_escape:sym<{ }>", " at pos=", rx908_pos)
  debug_769:
    .return (rx908_cur)
  rx908_restart:
.annotate 'line', 4
    if_null rx908_debug, debug_770
    rx908_cur."!cursor_debug"("NEXT", "quote_escape:sym<{ }>")
  debug_770:
  rx908_fail:
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    if_null rx908_debug, debug_771
    rx908_cur."!cursor_debug"("FAIL", "quote_escape:sym<{ }>")
  debug_771:
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("223_1283874336.57842") :method
.annotate 'line', 4
    new $P910, "ResizablePMCArray"
    push $P910, "{"
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("224_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    .local pmc rx913_debug
    (rx913_cur, rx913_pos, rx913_tgt, $I10) = self."!cursor_start"()
    getattribute rx913_debug, rx913_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx913_cur
    .local pmc match
    .lex "$/", match
    length rx913_eos, rx913_tgt
    gt rx913_pos, rx913_eos, rx913_done
    set rx913_off, 0
    lt rx913_pos, 2, rx913_start
    sub rx913_off, rx913_pos, 1
    substr rx913_tgt, rx913_tgt, rx913_off
  rx913_start:
    eq $I10, 1, rx913_restart
    if_null rx913_debug, debug_772
    rx913_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_772:
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
.annotate 'line', 434
  # rx literal  "\\e"
    add $I11, rx913_pos, 2
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 2
    ne $S10, "\\e", rx913_fail
    add rx913_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."quotemod_check"("b")
    unless $P10, rx913_fail
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "quote_escape:sym<esc>")
    if_null rx913_debug, debug_773
    rx913_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx913_pos)
  debug_773:
    .return (rx913_cur)
  rx913_restart:
.annotate 'line', 4
    if_null rx913_debug, debug_774
    rx913_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_774:
  rx913_fail:
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    if_null rx913_debug, debug_775
    rx913_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_775:
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("225_1283874336.57842") :method
.annotate 'line', 4
    new $P915, "ResizablePMCArray"
    push $P915, "\\e"
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("226_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx918_tgt
    .local int rx918_pos
    .local int rx918_off
    .local int rx918_eos
    .local int rx918_rep
    .local pmc rx918_cur
    .local pmc rx918_debug
    (rx918_cur, rx918_pos, rx918_tgt, $I10) = self."!cursor_start"()
    rx918_cur."!cursor_caparray"("EXPR")
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
    if_null rx918_debug, debug_776
    rx918_cur."!cursor_debug"("START", "circumfix:sym<( )>")
  debug_776:
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
.annotate 'line', 436
  # rx literal  "("
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    ord $I11, rx918_tgt, $I11
    ne $I11, 40, rx918_fail
    add rx918_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."ws"()
    unless $P10, rx918_fail
    rx918_pos = $P10."pos"()
  # rx rxquantr923 ** 0..1
    set_addr $I10, rxquantr923_done
    rx918_cur."!mark_push"(0, rx918_pos, $I10)
  rxquantr923_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx918_cur."!cursor_pos"(rx918_pos)
    $P10 = rx918_cur."EXPR"()
    unless $P10, rx918_fail
    goto rxsubrule924_pass
  rxsubrule924_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx918_fail
  rxsubrule924_pass:
    set_addr $I10, rxsubrule924_back
    rx918_cur."!mark_push"(0, rx918_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx918_pos = $P10."pos"()
    set_addr $I10, rxquantr923_done
    (rx918_rep) = rx918_cur."!mark_commit"($I10)
  rxquantr923_done:
  # rx literal  ")"
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    ord $I11, rx918_tgt, $I11
    ne $I11, 41, rx918_fail
    add rx918_pos, 1
  # rx pass
    rx918_cur."!cursor_pass"(rx918_pos, "circumfix:sym<( )>")
    if_null rx918_debug, debug_777
    rx918_cur."!cursor_debug"("PASS", "circumfix:sym<( )>", " at pos=", rx918_pos)
  debug_777:
    .return (rx918_cur)
  rx918_restart:
.annotate 'line', 4
    if_null rx918_debug, debug_778
    rx918_cur."!cursor_debug"("NEXT", "circumfix:sym<( )>")
  debug_778:
  rx918_fail:
    (rx918_rep, rx918_pos, $I10, $P10) = rx918_cur."!mark_fail"(0)
    lt rx918_pos, -1, rx918_done
    eq rx918_pos, -1, rx918_fail
    jump $I10
  rx918_done:
    rx918_cur."!cursor_fail"()
    if_null rx918_debug, debug_779
    rx918_cur."!cursor_debug"("FAIL", "circumfix:sym<( )>")
  debug_779:
    .return (rx918_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("227_1283874336.57842") :method
.annotate 'line', 4
    $P920 = self."!PREFIX__!subrule"("ws", "(")
    new $P921, "ResizablePMCArray"
    push $P921, $P920
    .return ($P921)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("228_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    .local pmc rx926_debug
    (rx926_cur, rx926_pos, rx926_tgt, $I10) = self."!cursor_start"()
    rx926_cur."!cursor_caparray"("EXPR")
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
    if_null rx926_debug, debug_780
    rx926_cur."!cursor_debug"("START", "circumfix:sym<[ ]>")
  debug_780:
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
.annotate 'line', 437
  # rx literal  "["
    add $I11, rx926_pos, 1
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    ord $I11, rx926_tgt, $I11
    ne $I11, 91, rx926_fail
    add rx926_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."ws"()
    unless $P10, rx926_fail
    rx926_pos = $P10."pos"()
  # rx rxquantr931 ** 0..1
    set_addr $I10, rxquantr931_done
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  rxquantr931_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."EXPR"()
    unless $P10, rx926_fail
    goto rxsubrule932_pass
  rxsubrule932_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx926_fail
  rxsubrule932_pass:
    set_addr $I10, rxsubrule932_back
    rx926_cur."!mark_push"(0, rx926_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx926_pos = $P10."pos"()
    set_addr $I10, rxquantr931_done
    (rx926_rep) = rx926_cur."!mark_commit"($I10)
  rxquantr931_done:
  # rx literal  "]"
    add $I11, rx926_pos, 1
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    ord $I11, rx926_tgt, $I11
    ne $I11, 93, rx926_fail
    add rx926_pos, 1
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "circumfix:sym<[ ]>")
    if_null rx926_debug, debug_781
    rx926_cur."!cursor_debug"("PASS", "circumfix:sym<[ ]>", " at pos=", rx926_pos)
  debug_781:
    .return (rx926_cur)
  rx926_restart:
.annotate 'line', 4
    if_null rx926_debug, debug_782
    rx926_cur."!cursor_debug"("NEXT", "circumfix:sym<[ ]>")
  debug_782:
  rx926_fail:
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    if_null rx926_debug, debug_783
    rx926_cur."!cursor_debug"("FAIL", "circumfix:sym<[ ]>")
  debug_783:
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("229_1283874336.57842") :method
.annotate 'line', 4
    $P928 = self."!PREFIX__!subrule"("ws", "[")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("230_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx934_tgt
    .local int rx934_pos
    .local int rx934_off
    .local int rx934_eos
    .local int rx934_rep
    .local pmc rx934_cur
    .local pmc rx934_debug
    (rx934_cur, rx934_pos, rx934_tgt, $I10) = self."!cursor_start"()
    getattribute rx934_debug, rx934_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx934_cur
    .local pmc match
    .lex "$/", match
    length rx934_eos, rx934_tgt
    gt rx934_pos, rx934_eos, rx934_done
    set rx934_off, 0
    lt rx934_pos, 2, rx934_start
    sub rx934_off, rx934_pos, 1
    substr rx934_tgt, rx934_tgt, rx934_off
  rx934_start:
    eq $I10, 1, rx934_restart
    if_null rx934_debug, debug_784
    rx934_cur."!cursor_debug"("START", "circumfix:sym<ang>")
  debug_784:
    $I10 = self.'from'()
    ne $I10, -1, rxscan937_done
    goto rxscan937_scan
  rxscan937_loop:
    ($P10) = rx934_cur."from"()
    inc $P10
    set rx934_pos, $P10
    ge rx934_pos, rx934_eos, rxscan937_done
  rxscan937_scan:
    set_addr $I10, rxscan937_loop
    rx934_cur."!mark_push"(0, rx934_pos, $I10)
  rxscan937_done:
.annotate 'line', 438
  # rx enumcharlist negate=0 zerowidth
    ge rx934_pos, rx934_eos, rx934_fail
    sub $I10, rx934_pos, rx934_off
    substr $S10, rx934_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx934_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx934_cur."!cursor_pos"(rx934_pos)
    $P10 = rx934_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx934_fail
    rx934_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx934_pos = $P10."pos"()
  # rx pass
    rx934_cur."!cursor_pass"(rx934_pos, "circumfix:sym<ang>")
    if_null rx934_debug, debug_785
    rx934_cur."!cursor_debug"("PASS", "circumfix:sym<ang>", " at pos=", rx934_pos)
  debug_785:
    .return (rx934_cur)
  rx934_restart:
.annotate 'line', 4
    if_null rx934_debug, debug_786
    rx934_cur."!cursor_debug"("NEXT", "circumfix:sym<ang>")
  debug_786:
  rx934_fail:
    (rx934_rep, rx934_pos, $I10, $P10) = rx934_cur."!mark_fail"(0)
    lt rx934_pos, -1, rx934_done
    eq rx934_pos, -1, rx934_fail
    jump $I10
  rx934_done:
    rx934_cur."!cursor_fail"()
    if_null rx934_debug, debug_787
    rx934_cur."!cursor_debug"("FAIL", "circumfix:sym<ang>")
  debug_787:
    .return (rx934_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("231_1283874336.57842") :method
.annotate 'line', 4
    new $P936, "ResizablePMCArray"
    push $P936, "<"
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("232_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx939_tgt
    .local int rx939_pos
    .local int rx939_off
    .local int rx939_eos
    .local int rx939_rep
    .local pmc rx939_cur
    .local pmc rx939_debug
    (rx939_cur, rx939_pos, rx939_tgt, $I10) = self."!cursor_start"()
    getattribute rx939_debug, rx939_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx939_cur
    .local pmc match
    .lex "$/", match
    length rx939_eos, rx939_tgt
    gt rx939_pos, rx939_eos, rx939_done
    set rx939_off, 0
    lt rx939_pos, 2, rx939_start
    sub rx939_off, rx939_pos, 1
    substr rx939_tgt, rx939_tgt, rx939_off
  rx939_start:
    eq $I10, 1, rx939_restart
    if_null rx939_debug, debug_788
    rx939_cur."!cursor_debug"("START", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_788:
    $I10 = self.'from'()
    ne $I10, -1, rxscan942_done
    goto rxscan942_scan
  rxscan942_loop:
    ($P10) = rx939_cur."from"()
    inc $P10
    set rx939_pos, $P10
    ge rx939_pos, rx939_eos, rxscan942_done
  rxscan942_scan:
    set_addr $I10, rxscan942_loop
    rx939_cur."!mark_push"(0, rx939_pos, $I10)
  rxscan942_done:
.annotate 'line', 439
  # rx enumcharlist negate=0 zerowidth
    ge rx939_pos, rx939_eos, rx939_fail
    sub $I10, rx939_pos, rx939_off
    substr $S10, rx939_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx939_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx939_cur."!cursor_pos"(rx939_pos)
    $P10 = rx939_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx939_fail
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx939_pos = $P10."pos"()
  # rx pass
    rx939_cur."!cursor_pass"(rx939_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    if_null rx939_debug, debug_789
    rx939_cur."!cursor_debug"("PASS", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx939_pos)
  debug_789:
    .return (rx939_cur)
  rx939_restart:
.annotate 'line', 4
    if_null rx939_debug, debug_790
    rx939_cur."!cursor_debug"("NEXT", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_790:
  rx939_fail:
    (rx939_rep, rx939_pos, $I10, $P10) = rx939_cur."!mark_fail"(0)
    lt rx939_pos, -1, rx939_done
    eq rx939_pos, -1, rx939_fail
    jump $I10
  rx939_done:
    rx939_cur."!cursor_fail"()
    if_null rx939_debug, debug_791
    rx939_cur."!cursor_debug"("FAIL", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_791:
    .return (rx939_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("233_1283874336.57842") :method
.annotate 'line', 4
    new $P941, "ResizablePMCArray"
    push $P941, unicode:"\x{ab}"
    .return ($P941)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("234_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx944_tgt
    .local int rx944_pos
    .local int rx944_off
    .local int rx944_eos
    .local int rx944_rep
    .local pmc rx944_cur
    .local pmc rx944_debug
    (rx944_cur, rx944_pos, rx944_tgt, $I10) = self."!cursor_start"()
    getattribute rx944_debug, rx944_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx944_cur
    .local pmc match
    .lex "$/", match
    length rx944_eos, rx944_tgt
    gt rx944_pos, rx944_eos, rx944_done
    set rx944_off, 0
    lt rx944_pos, 2, rx944_start
    sub rx944_off, rx944_pos, 1
    substr rx944_tgt, rx944_tgt, rx944_off
  rx944_start:
    eq $I10, 1, rx944_restart
    if_null rx944_debug, debug_792
    rx944_cur."!cursor_debug"("START", "circumfix:sym<{ }>")
  debug_792:
    $I10 = self.'from'()
    ne $I10, -1, rxscan947_done
    goto rxscan947_scan
  rxscan947_loop:
    ($P10) = rx944_cur."from"()
    inc $P10
    set rx944_pos, $P10
    ge rx944_pos, rx944_eos, rxscan947_done
  rxscan947_scan:
    set_addr $I10, rxscan947_loop
    rx944_cur."!mark_push"(0, rx944_pos, $I10)
  rxscan947_done:
.annotate 'line', 440
  # rx enumcharlist negate=0 zerowidth
    ge rx944_pos, rx944_eos, rx944_fail
    sub $I10, rx944_pos, rx944_off
    substr $S10, rx944_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx944_fail
  # rx subrule "pblock" subtype=capture negate=
    rx944_cur."!cursor_pos"(rx944_pos)
    $P10 = rx944_cur."pblock"()
    unless $P10, rx944_fail
    rx944_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx944_pos = $P10."pos"()
  # rx pass
    rx944_cur."!cursor_pass"(rx944_pos, "circumfix:sym<{ }>")
    if_null rx944_debug, debug_793
    rx944_cur."!cursor_debug"("PASS", "circumfix:sym<{ }>", " at pos=", rx944_pos)
  debug_793:
    .return (rx944_cur)
  rx944_restart:
.annotate 'line', 4
    if_null rx944_debug, debug_794
    rx944_cur."!cursor_debug"("NEXT", "circumfix:sym<{ }>")
  debug_794:
  rx944_fail:
    (rx944_rep, rx944_pos, $I10, $P10) = rx944_cur."!mark_fail"(0)
    lt rx944_pos, -1, rx944_done
    eq rx944_pos, -1, rx944_fail
    jump $I10
  rx944_done:
    rx944_cur."!cursor_fail"()
    if_null rx944_debug, debug_795
    rx944_cur."!cursor_debug"("FAIL", "circumfix:sym<{ }>")
  debug_795:
    .return (rx944_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("235_1283874336.57842") :method
.annotate 'line', 4
    new $P946, "ResizablePMCArray"
    push $P946, "{"
    .return ($P946)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("236_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx949_tgt
    .local int rx949_pos
    .local int rx949_off
    .local int rx949_eos
    .local int rx949_rep
    .local pmc rx949_cur
    .local pmc rx949_debug
    (rx949_cur, rx949_pos, rx949_tgt, $I10) = self."!cursor_start"()
    getattribute rx949_debug, rx949_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx949_cur
    .local pmc match
    .lex "$/", match
    length rx949_eos, rx949_tgt
    gt rx949_pos, rx949_eos, rx949_done
    set rx949_off, 0
    lt rx949_pos, 2, rx949_start
    sub rx949_off, rx949_pos, 1
    substr rx949_tgt, rx949_tgt, rx949_off
  rx949_start:
    eq $I10, 1, rx949_restart
    if_null rx949_debug, debug_796
    rx949_cur."!cursor_debug"("START", "circumfix:sym<sigil>")
  debug_796:
    $I10 = self.'from'()
    ne $I10, -1, rxscan953_done
    goto rxscan953_scan
  rxscan953_loop:
    ($P10) = rx949_cur."from"()
    inc $P10
    set rx949_pos, $P10
    ge rx949_pos, rx949_eos, rxscan953_done
  rxscan953_scan:
    set_addr $I10, rxscan953_loop
    rx949_cur."!mark_push"(0, rx949_pos, $I10)
  rxscan953_done:
.annotate 'line', 441
  # rx subrule "sigil" subtype=capture negate=
    rx949_cur."!cursor_pos"(rx949_pos)
    $P10 = rx949_cur."sigil"()
    unless $P10, rx949_fail
    rx949_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx949_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx949_pos, 1
    gt $I11, rx949_eos, rx949_fail
    sub $I11, rx949_pos, rx949_off
    ord $I11, rx949_tgt, $I11
    ne $I11, 40, rx949_fail
    add rx949_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx949_cur."!cursor_pos"(rx949_pos)
    $P10 = rx949_cur."semilist"()
    unless $P10, rx949_fail
    rx949_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx949_pos = $P10."pos"()
  alt954_0:
    set_addr $I10, alt954_1
    rx949_cur."!mark_push"(0, rx949_pos, $I10)
  # rx literal  ")"
    add $I11, rx949_pos, 1
    gt $I11, rx949_eos, rx949_fail
    sub $I11, rx949_pos, rx949_off
    ord $I11, rx949_tgt, $I11
    ne $I11, 41, rx949_fail
    add rx949_pos, 1
    goto alt954_end
  alt954_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx949_cur."!cursor_pos"(rx949_pos)
    $P10 = rx949_cur."FAILGOAL"("')'")
    unless $P10, rx949_fail
    goto rxsubrule956_pass
  rxsubrule956_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx949_fail
  rxsubrule956_pass:
    set_addr $I10, rxsubrule956_back
    rx949_cur."!mark_push"(0, rx949_pos, $I10, $P10)
    rx949_pos = $P10."pos"()
  alt954_end:
  # rx pass
    rx949_cur."!cursor_pass"(rx949_pos, "circumfix:sym<sigil>")
    if_null rx949_debug, debug_797
    rx949_cur."!cursor_debug"("PASS", "circumfix:sym<sigil>", " at pos=", rx949_pos)
  debug_797:
    .return (rx949_cur)
  rx949_restart:
.annotate 'line', 4
    if_null rx949_debug, debug_798
    rx949_cur."!cursor_debug"("NEXT", "circumfix:sym<sigil>")
  debug_798:
  rx949_fail:
    (rx949_rep, rx949_pos, $I10, $P10) = rx949_cur."!mark_fail"(0)
    lt rx949_pos, -1, rx949_done
    eq rx949_pos, -1, rx949_fail
    jump $I10
  rx949_done:
    rx949_cur."!cursor_fail"()
    if_null rx949_debug, debug_799
    rx949_cur."!cursor_debug"("FAIL", "circumfix:sym<sigil>")
  debug_799:
    .return (rx949_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("237_1283874336.57842") :method
.annotate 'line', 4
    $P951 = self."!PREFIX__!subrule"("sigil", "")
    new $P952, "ResizablePMCArray"
    push $P952, $P951
    .return ($P952)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("238_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 4
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    .local pmc rx958_debug
    (rx958_cur, rx958_pos, rx958_tgt, $I10) = self."!cursor_start"()
    getattribute rx958_debug, rx958_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx958_cur
    .local pmc match
    .lex "$/", match
    length rx958_eos, rx958_tgt
    gt rx958_pos, rx958_eos, rx958_done
    set rx958_off, 0
    lt rx958_pos, 2, rx958_start
    sub rx958_off, rx958_pos, 1
    substr rx958_tgt, rx958_tgt, rx958_off
  rx958_start:
    eq $I10, 1, rx958_restart
    if_null rx958_debug, debug_800
    rx958_cur."!cursor_debug"("START", "semilist")
  debug_800:
    $I10 = self.'from'()
    ne $I10, -1, rxscan962_done
    goto rxscan962_scan
  rxscan962_loop:
    ($P10) = rx958_cur."from"()
    inc $P10
    set rx958_pos, $P10
    ge rx958_pos, rx958_eos, rxscan962_done
  rxscan962_scan:
    set_addr $I10, rxscan962_loop
    rx958_cur."!mark_push"(0, rx958_pos, $I10)
  rxscan962_done:
.annotate 'line', 443
  # rx subrule "ws" subtype=method negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."ws"()
    unless $P10, rx958_fail
    rx958_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."statement"()
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx958_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."ws"()
    unless $P10, rx958_fail
    rx958_pos = $P10."pos"()
  # rx pass
    rx958_cur."!cursor_pass"(rx958_pos, "semilist")
    if_null rx958_debug, debug_801
    rx958_cur."!cursor_debug"("PASS", "semilist", " at pos=", rx958_pos)
  debug_801:
    .return (rx958_cur)
  rx958_restart:
.annotate 'line', 4
    if_null rx958_debug, debug_802
    rx958_cur."!cursor_debug"("NEXT", "semilist")
  debug_802:
  rx958_fail:
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    if_null rx958_debug, debug_803
    rx958_cur."!cursor_debug"("FAIL", "semilist")
  debug_803:
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("239_1283874336.57842") :method
.annotate 'line', 4
    $P960 = self."!PREFIX__!subrule"("ws", "")
    new $P961, "ResizablePMCArray"
    push $P961, $P960
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("240_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx966_tgt
    .local int rx966_pos
    .local int rx966_off
    .local int rx966_eos
    .local int rx966_rep
    .local pmc rx966_cur
    .local pmc rx966_debug
    (rx966_cur, rx966_pos, rx966_tgt, $I10) = self."!cursor_start"()
    getattribute rx966_debug, rx966_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx966_cur
    .local pmc match
    .lex "$/", match
    length rx966_eos, rx966_tgt
    gt rx966_pos, rx966_eos, rx966_done
    set rx966_off, 0
    lt rx966_pos, 2, rx966_start
    sub rx966_off, rx966_pos, 1
    substr rx966_tgt, rx966_tgt, rx966_off
  rx966_start:
    eq $I10, 1, rx966_restart
    if_null rx966_debug, debug_804
    rx966_cur."!cursor_debug"("START", "infixish")
  debug_804:
    $I10 = self.'from'()
    ne $I10, -1, rxscan969_done
    goto rxscan969_scan
  rxscan969_loop:
    ($P10) = rx966_cur."from"()
    inc $P10
    set rx966_pos, $P10
    ge rx966_pos, rx966_eos, rxscan969_done
  rxscan969_scan:
    set_addr $I10, rxscan969_loop
    rx966_cur."!mark_push"(0, rx966_pos, $I10)
  rxscan969_done:
.annotate 'line', 466
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx966_cur."!cursor_pos"(rx966_pos)
    $P10 = rx966_cur."infixstopper"()
    if $P10, rx966_fail
  # rx subrule "infix" subtype=capture negate=
    rx966_cur."!cursor_pos"(rx966_pos)
    $P10 = rx966_cur."infix"()
    unless $P10, rx966_fail
    rx966_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx966_pos = $P10."pos"()
  # rx pass
    rx966_cur."!cursor_pass"(rx966_pos, "infixish")
    if_null rx966_debug, debug_805
    rx966_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx966_pos)
  debug_805:
    .return (rx966_cur)
  rx966_restart:
.annotate 'line', 447
    if_null rx966_debug, debug_806
    rx966_cur."!cursor_debug"("NEXT", "infixish")
  debug_806:
  rx966_fail:
    (rx966_rep, rx966_pos, $I10, $P10) = rx966_cur."!mark_fail"(0)
    lt rx966_pos, -1, rx966_done
    eq rx966_pos, -1, rx966_fail
    jump $I10
  rx966_done:
    rx966_cur."!cursor_fail"()
    if_null rx966_debug, debug_807
    rx966_cur."!cursor_debug"("FAIL", "infixish")
  debug_807:
    .return (rx966_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("241_1283874336.57842") :method
.annotate 'line', 447
    new $P968, "ResizablePMCArray"
    push $P968, ""
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("242_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    .local pmc rx971_debug
    (rx971_cur, rx971_pos, rx971_tgt, $I10) = self."!cursor_start"()
    getattribute rx971_debug, rx971_cur, "$!debug"
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
    eq $I10, 1, rx971_restart
    if_null rx971_debug, debug_808
    rx971_cur."!cursor_debug"("START", "infixstopper")
  debug_808:
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
.annotate 'line', 467
  # rx subrule "lambda" subtype=zerowidth negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."lambda"()
    unless $P10, rx971_fail
  # rx pass
    rx971_cur."!cursor_pass"(rx971_pos, "infixstopper")
    if_null rx971_debug, debug_809
    rx971_cur."!cursor_debug"("PASS", "infixstopper", " at pos=", rx971_pos)
  debug_809:
    .return (rx971_cur)
  rx971_restart:
.annotate 'line', 447
    if_null rx971_debug, debug_810
    rx971_cur."!cursor_debug"("NEXT", "infixstopper")
  debug_810:
  rx971_fail:
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    if_null rx971_debug, debug_811
    rx971_cur."!cursor_debug"("FAIL", "infixstopper")
  debug_811:
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("243_1283874336.57842") :method
.annotate 'line', 447
    new $P973, "ResizablePMCArray"
    push $P973, ""
    .return ($P973)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("244_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx976_tgt
    .local int rx976_pos
    .local int rx976_off
    .local int rx976_eos
    .local int rx976_rep
    .local pmc rx976_cur
    .local pmc rx976_debug
    (rx976_cur, rx976_pos, rx976_tgt, $I10) = self."!cursor_start"()
    getattribute rx976_debug, rx976_cur, "$!debug"
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
    eq $I10, 1, rx976_restart
    if_null rx976_debug, debug_812
    rx976_cur."!cursor_debug"("START", "postcircumfix:sym<[ ]>")
  debug_812:
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
.annotate 'line', 470
  # rx literal  "["
    add $I11, rx976_pos, 1
    gt $I11, rx976_eos, rx976_fail
    sub $I11, rx976_pos, rx976_off
    ord $I11, rx976_tgt, $I11
    ne $I11, 91, rx976_fail
    add rx976_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx976_cur."!cursor_pos"(rx976_pos)
    $P10 = rx976_cur."ws"()
    unless $P10, rx976_fail
    rx976_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx976_cur."!cursor_pos"(rx976_pos)
    $P10 = rx976_cur."EXPR"()
    unless $P10, rx976_fail
    rx976_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx976_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx976_pos, 1
    gt $I11, rx976_eos, rx976_fail
    sub $I11, rx976_pos, rx976_off
    ord $I11, rx976_tgt, $I11
    ne $I11, 93, rx976_fail
    add rx976_pos, 1
.annotate 'line', 471
  # rx subrule "O" subtype=capture negate=
    rx976_cur."!cursor_pos"(rx976_pos)
    $P10 = rx976_cur."O"("%methodop")
    unless $P10, rx976_fail
    rx976_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx976_pos = $P10."pos"()
.annotate 'line', 469
  # rx pass
    rx976_cur."!cursor_pass"(rx976_pos, "postcircumfix:sym<[ ]>")
    if_null rx976_debug, debug_813
    rx976_cur."!cursor_debug"("PASS", "postcircumfix:sym<[ ]>", " at pos=", rx976_pos)
  debug_813:
    .return (rx976_cur)
  rx976_restart:
.annotate 'line', 447
    if_null rx976_debug, debug_814
    rx976_cur."!cursor_debug"("NEXT", "postcircumfix:sym<[ ]>")
  debug_814:
  rx976_fail:
    (rx976_rep, rx976_pos, $I10, $P10) = rx976_cur."!mark_fail"(0)
    lt rx976_pos, -1, rx976_done
    eq rx976_pos, -1, rx976_fail
    jump $I10
  rx976_done:
    rx976_cur."!cursor_fail"()
    if_null rx976_debug, debug_815
    rx976_cur."!cursor_debug"("FAIL", "postcircumfix:sym<[ ]>")
  debug_815:
    .return (rx976_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("245_1283874336.57842") :method
.annotate 'line', 447
    $P978 = self."!PREFIX__!subrule"("ws", "[")
    new $P979, "ResizablePMCArray"
    push $P979, $P978
    .return ($P979)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("246_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
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
    if_null rx982_debug, debug_816
    rx982_cur."!cursor_debug"("START", "postcircumfix:sym<{ }>")
  debug_816:
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
.annotate 'line', 475
  # rx literal  "{"
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    ord $I11, rx982_tgt, $I11
    ne $I11, 123, rx982_fail
    add rx982_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."ws"()
    unless $P10, rx982_fail
    rx982_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."EXPR"()
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx982_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    ord $I11, rx982_tgt, $I11
    ne $I11, 125, rx982_fail
    add rx982_pos, 1
.annotate 'line', 476
  # rx subrule "O" subtype=capture negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."O"("%methodop")
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx982_pos = $P10."pos"()
.annotate 'line', 474
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "postcircumfix:sym<{ }>")
    if_null rx982_debug, debug_817
    rx982_cur."!cursor_debug"("PASS", "postcircumfix:sym<{ }>", " at pos=", rx982_pos)
  debug_817:
    .return (rx982_cur)
  rx982_restart:
.annotate 'line', 447
    if_null rx982_debug, debug_818
    rx982_cur."!cursor_debug"("NEXT", "postcircumfix:sym<{ }>")
  debug_818:
  rx982_fail:
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    if_null rx982_debug, debug_819
    rx982_cur."!cursor_debug"("FAIL", "postcircumfix:sym<{ }>")
  debug_819:
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("247_1283874336.57842") :method
.annotate 'line', 447
    $P984 = self."!PREFIX__!subrule"("ws", "{")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("248_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    .local pmc rx988_debug
    (rx988_cur, rx988_pos, rx988_tgt, $I10) = self."!cursor_start"()
    getattribute rx988_debug, rx988_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx988_cur
    .local pmc match
    .lex "$/", match
    length rx988_eos, rx988_tgt
    gt rx988_pos, rx988_eos, rx988_done
    set rx988_off, 0
    lt rx988_pos, 2, rx988_start
    sub rx988_off, rx988_pos, 1
    substr rx988_tgt, rx988_tgt, rx988_off
  rx988_start:
    eq $I10, 1, rx988_restart
    if_null rx988_debug, debug_820
    rx988_cur."!cursor_debug"("START", "postcircumfix:sym<ang>")
  debug_820:
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
.annotate 'line', 480
  # rx enumcharlist negate=0 zerowidth
    ge rx988_pos, rx988_eos, rx988_fail
    sub $I10, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx988_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."quote_EXPR"(":q")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx988_pos = $P10."pos"()
.annotate 'line', 481
  # rx subrule "O" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."O"("%methodop")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
.annotate 'line', 479
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "postcircumfix:sym<ang>")
    if_null rx988_debug, debug_821
    rx988_cur."!cursor_debug"("PASS", "postcircumfix:sym<ang>", " at pos=", rx988_pos)
  debug_821:
    .return (rx988_cur)
  rx988_restart:
.annotate 'line', 447
    if_null rx988_debug, debug_822
    rx988_cur."!cursor_debug"("NEXT", "postcircumfix:sym<ang>")
  debug_822:
  rx988_fail:
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    if_null rx988_debug, debug_823
    rx988_cur."!cursor_debug"("FAIL", "postcircumfix:sym<ang>")
  debug_823:
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("249_1283874336.57842") :method
.annotate 'line', 447
    new $P990, "ResizablePMCArray"
    push $P990, "<"
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("250_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    .local pmc rx993_debug
    (rx993_cur, rx993_pos, rx993_tgt, $I10) = self."!cursor_start"()
    getattribute rx993_debug, rx993_cur, "$!debug"
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
    eq $I10, 1, rx993_restart
    if_null rx993_debug, debug_824
    rx993_cur."!cursor_debug"("START", "postcircumfix:sym<( )>")
  debug_824:
    $I10 = self.'from'()
    ne $I10, -1, rxscan997_done
    goto rxscan997_scan
  rxscan997_loop:
    ($P10) = rx993_cur."from"()
    inc $P10
    set rx993_pos, $P10
    ge rx993_pos, rx993_eos, rxscan997_done
  rxscan997_scan:
    set_addr $I10, rxscan997_loop
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  rxscan997_done:
.annotate 'line', 485
  # rx literal  "("
    add $I11, rx993_pos, 1
    gt $I11, rx993_eos, rx993_fail
    sub $I11, rx993_pos, rx993_off
    ord $I11, rx993_tgt, $I11
    ne $I11, 40, rx993_fail
    add rx993_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."ws"()
    unless $P10, rx993_fail
    rx993_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."arglist"()
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx993_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx993_pos, 1
    gt $I11, rx993_eos, rx993_fail
    sub $I11, rx993_pos, rx993_off
    ord $I11, rx993_tgt, $I11
    ne $I11, 41, rx993_fail
    add rx993_pos, 1
.annotate 'line', 486
  # rx subrule "O" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."O"("%methodop")
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx993_pos = $P10."pos"()
.annotate 'line', 484
  # rx pass
    rx993_cur."!cursor_pass"(rx993_pos, "postcircumfix:sym<( )>")
    if_null rx993_debug, debug_825
    rx993_cur."!cursor_debug"("PASS", "postcircumfix:sym<( )>", " at pos=", rx993_pos)
  debug_825:
    .return (rx993_cur)
  rx993_restart:
.annotate 'line', 447
    if_null rx993_debug, debug_826
    rx993_cur."!cursor_debug"("NEXT", "postcircumfix:sym<( )>")
  debug_826:
  rx993_fail:
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    if_null rx993_debug, debug_827
    rx993_cur."!cursor_debug"("FAIL", "postcircumfix:sym<( )>")
  debug_827:
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("251_1283874336.57842") :method
.annotate 'line', 447
    $P995 = self."!PREFIX__!subrule"("ws", "(")
    new $P996, "ResizablePMCArray"
    push $P996, $P995
    .return ($P996)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("252_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
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
    if_null rx999_debug, debug_828
    rx999_cur."!cursor_debug"("START", "postfix:sym<.>")
  debug_828:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1003_done
    goto rxscan1003_scan
  rxscan1003_loop:
    ($P10) = rx999_cur."from"()
    inc $P10
    set rx999_pos, $P10
    ge rx999_pos, rx999_eos, rxscan1003_done
  rxscan1003_scan:
    set_addr $I10, rxscan1003_loop
    rx999_cur."!mark_push"(0, rx999_pos, $I10)
  rxscan1003_done:
.annotate 'line', 489
  # rx subrule "dotty" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."dotty"()
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx999_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."O"("%methodop")
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx999_pos = $P10."pos"()
  # rx pass
    rx999_cur."!cursor_pass"(rx999_pos, "postfix:sym<.>")
    if_null rx999_debug, debug_829
    rx999_cur."!cursor_debug"("PASS", "postfix:sym<.>", " at pos=", rx999_pos)
  debug_829:
    .return (rx999_cur)
  rx999_restart:
.annotate 'line', 447
    if_null rx999_debug, debug_830
    rx999_cur."!cursor_debug"("NEXT", "postfix:sym<.>")
  debug_830:
  rx999_fail:
    (rx999_rep, rx999_pos, $I10, $P10) = rx999_cur."!mark_fail"(0)
    lt rx999_pos, -1, rx999_done
    eq rx999_pos, -1, rx999_fail
    jump $I10
  rx999_done:
    rx999_cur."!cursor_fail"()
    if_null rx999_debug, debug_831
    rx999_cur."!cursor_debug"("FAIL", "postfix:sym<.>")
  debug_831:
    .return (rx999_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("253_1283874336.57842") :method
.annotate 'line', 447
    $P1001 = self."!PREFIX__!subrule"("dotty", "")
    new $P1002, "ResizablePMCArray"
    push $P1002, $P1001
    .return ($P1002)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("254_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
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
    if_null rx1005_debug, debug_832
    rx1005_cur."!cursor_debug"("START", "prefix:sym<++>")
  debug_832:
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
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1010_fail
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  # rx literal  "++"
    add $I11, rx1005_pos, 2
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    substr $S10, rx1005_tgt, $I11, 2
    ne $S10, "++", rx1005_fail
    add rx1005_pos, 2
    set_addr $I10, rxcap_1010_fail
    ($I12, $I11) = rx1005_cur."!mark_peek"($I10)
    rx1005_cur."!cursor_pos"($I11)
    ($P10) = rx1005_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1005_pos, "")
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1010_done
  rxcap_1010_fail:
    goto rx1005_fail
  rxcap_1010_done:
  # rx subrule "O" subtype=capture negate=
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1005_fail
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1005_pos = $P10."pos"()
  # rx pass
    rx1005_cur."!cursor_pass"(rx1005_pos, "prefix:sym<++>")
    if_null rx1005_debug, debug_833
    rx1005_cur."!cursor_debug"("PASS", "prefix:sym<++>", " at pos=", rx1005_pos)
  debug_833:
    .return (rx1005_cur)
  rx1005_restart:
.annotate 'line', 447
    if_null rx1005_debug, debug_834
    rx1005_cur."!cursor_debug"("NEXT", "prefix:sym<++>")
  debug_834:
  rx1005_fail:
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    if_null rx1005_debug, debug_835
    rx1005_cur."!cursor_debug"("FAIL", "prefix:sym<++>")
  debug_835:
    .return (rx1005_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("255_1283874336.57842") :method
.annotate 'line', 447
    $P1007 = self."!PREFIX__!subrule"("O", "++")
    new $P1008, "ResizablePMCArray"
    push $P1008, $P1007
    .return ($P1008)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("256_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1012_tgt
    .local int rx1012_pos
    .local int rx1012_off
    .local int rx1012_eos
    .local int rx1012_rep
    .local pmc rx1012_cur
    .local pmc rx1012_debug
    (rx1012_cur, rx1012_pos, rx1012_tgt, $I10) = self."!cursor_start"()
    getattribute rx1012_debug, rx1012_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1012_cur
    .local pmc match
    .lex "$/", match
    length rx1012_eos, rx1012_tgt
    gt rx1012_pos, rx1012_eos, rx1012_done
    set rx1012_off, 0
    lt rx1012_pos, 2, rx1012_start
    sub rx1012_off, rx1012_pos, 1
    substr rx1012_tgt, rx1012_tgt, rx1012_off
  rx1012_start:
    eq $I10, 1, rx1012_restart
    if_null rx1012_debug, debug_836
    rx1012_cur."!cursor_debug"("START", "prefix:sym<-->")
  debug_836:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1016_done
    goto rxscan1016_scan
  rxscan1016_loop:
    ($P10) = rx1012_cur."from"()
    inc $P10
    set rx1012_pos, $P10
    ge rx1012_pos, rx1012_eos, rxscan1016_done
  rxscan1016_scan:
    set_addr $I10, rxscan1016_loop
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  rxscan1016_done:
.annotate 'line', 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1017_fail
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  # rx literal  "--"
    add $I11, rx1012_pos, 2
    gt $I11, rx1012_eos, rx1012_fail
    sub $I11, rx1012_pos, rx1012_off
    substr $S10, rx1012_tgt, $I11, 2
    ne $S10, "--", rx1012_fail
    add rx1012_pos, 2
    set_addr $I10, rxcap_1017_fail
    ($I12, $I11) = rx1012_cur."!mark_peek"($I10)
    rx1012_cur."!cursor_pos"($I11)
    ($P10) = rx1012_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1012_pos, "")
    rx1012_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1017_done
  rxcap_1017_fail:
    goto rx1012_fail
  rxcap_1017_done:
  # rx subrule "O" subtype=capture negate=
    rx1012_cur."!cursor_pos"(rx1012_pos)
    $P10 = rx1012_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1012_fail
    rx1012_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1012_pos = $P10."pos"()
  # rx pass
    rx1012_cur."!cursor_pass"(rx1012_pos, "prefix:sym<-->")
    if_null rx1012_debug, debug_837
    rx1012_cur."!cursor_debug"("PASS", "prefix:sym<-->", " at pos=", rx1012_pos)
  debug_837:
    .return (rx1012_cur)
  rx1012_restart:
.annotate 'line', 447
    if_null rx1012_debug, debug_838
    rx1012_cur."!cursor_debug"("NEXT", "prefix:sym<-->")
  debug_838:
  rx1012_fail:
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    if_null rx1012_debug, debug_839
    rx1012_cur."!cursor_debug"("FAIL", "prefix:sym<-->")
  debug_839:
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("257_1283874336.57842") :method
.annotate 'line', 447
    $P1014 = self."!PREFIX__!subrule"("O", "--")
    new $P1015, "ResizablePMCArray"
    push $P1015, $P1014
    .return ($P1015)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("258_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1019_tgt
    .local int rx1019_pos
    .local int rx1019_off
    .local int rx1019_eos
    .local int rx1019_rep
    .local pmc rx1019_cur
    .local pmc rx1019_debug
    (rx1019_cur, rx1019_pos, rx1019_tgt, $I10) = self."!cursor_start"()
    getattribute rx1019_debug, rx1019_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1019_cur
    .local pmc match
    .lex "$/", match
    length rx1019_eos, rx1019_tgt
    gt rx1019_pos, rx1019_eos, rx1019_done
    set rx1019_off, 0
    lt rx1019_pos, 2, rx1019_start
    sub rx1019_off, rx1019_pos, 1
    substr rx1019_tgt, rx1019_tgt, rx1019_off
  rx1019_start:
    eq $I10, 1, rx1019_restart
    if_null rx1019_debug, debug_840
    rx1019_cur."!cursor_debug"("START", "postfix:sym<++>")
  debug_840:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1023_done
    goto rxscan1023_scan
  rxscan1023_loop:
    ($P10) = rx1019_cur."from"()
    inc $P10
    set rx1019_pos, $P10
    ge rx1019_pos, rx1019_eos, rxscan1023_done
  rxscan1023_scan:
    set_addr $I10, rxscan1023_loop
    rx1019_cur."!mark_push"(0, rx1019_pos, $I10)
  rxscan1023_done:
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1024_fail
    rx1019_cur."!mark_push"(0, rx1019_pos, $I10)
  # rx literal  "++"
    add $I11, rx1019_pos, 2
    gt $I11, rx1019_eos, rx1019_fail
    sub $I11, rx1019_pos, rx1019_off
    substr $S10, rx1019_tgt, $I11, 2
    ne $S10, "++", rx1019_fail
    add rx1019_pos, 2
    set_addr $I10, rxcap_1024_fail
    ($I12, $I11) = rx1019_cur."!mark_peek"($I10)
    rx1019_cur."!cursor_pos"($I11)
    ($P10) = rx1019_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1019_pos, "")
    rx1019_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1024_done
  rxcap_1024_fail:
    goto rx1019_fail
  rxcap_1024_done:
  # rx subrule "O" subtype=capture negate=
    rx1019_cur."!cursor_pos"(rx1019_pos)
    $P10 = rx1019_cur."O"("%autoincrement")
    unless $P10, rx1019_fail
    rx1019_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1019_pos = $P10."pos"()
  # rx pass
    rx1019_cur."!cursor_pass"(rx1019_pos, "postfix:sym<++>")
    if_null rx1019_debug, debug_841
    rx1019_cur."!cursor_debug"("PASS", "postfix:sym<++>", " at pos=", rx1019_pos)
  debug_841:
    .return (rx1019_cur)
  rx1019_restart:
.annotate 'line', 447
    if_null rx1019_debug, debug_842
    rx1019_cur."!cursor_debug"("NEXT", "postfix:sym<++>")
  debug_842:
  rx1019_fail:
    (rx1019_rep, rx1019_pos, $I10, $P10) = rx1019_cur."!mark_fail"(0)
    lt rx1019_pos, -1, rx1019_done
    eq rx1019_pos, -1, rx1019_fail
    jump $I10
  rx1019_done:
    rx1019_cur."!cursor_fail"()
    if_null rx1019_debug, debug_843
    rx1019_cur."!cursor_debug"("FAIL", "postfix:sym<++>")
  debug_843:
    .return (rx1019_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("259_1283874336.57842") :method
.annotate 'line', 447
    $P1021 = self."!PREFIX__!subrule"("O", "++")
    new $P1022, "ResizablePMCArray"
    push $P1022, $P1021
    .return ($P1022)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("260_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
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
    if_null rx1026_debug, debug_844
    rx1026_cur."!cursor_debug"("START", "postfix:sym<-->")
  debug_844:
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
.annotate 'line', 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1031_fail
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  # rx literal  "--"
    add $I11, rx1026_pos, 2
    gt $I11, rx1026_eos, rx1026_fail
    sub $I11, rx1026_pos, rx1026_off
    substr $S10, rx1026_tgt, $I11, 2
    ne $S10, "--", rx1026_fail
    add rx1026_pos, 2
    set_addr $I10, rxcap_1031_fail
    ($I12, $I11) = rx1026_cur."!mark_peek"($I10)
    rx1026_cur."!cursor_pos"($I11)
    ($P10) = rx1026_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1026_pos, "")
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1031_done
  rxcap_1031_fail:
    goto rx1026_fail
  rxcap_1031_done:
  # rx subrule "O" subtype=capture negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."O"("%autoincrement")
    unless $P10, rx1026_fail
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1026_pos = $P10."pos"()
  # rx pass
    rx1026_cur."!cursor_pass"(rx1026_pos, "postfix:sym<-->")
    if_null rx1026_debug, debug_845
    rx1026_cur."!cursor_debug"("PASS", "postfix:sym<-->", " at pos=", rx1026_pos)
  debug_845:
    .return (rx1026_cur)
  rx1026_restart:
.annotate 'line', 447
    if_null rx1026_debug, debug_846
    rx1026_cur."!cursor_debug"("NEXT", "postfix:sym<-->")
  debug_846:
  rx1026_fail:
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    if_null rx1026_debug, debug_847
    rx1026_cur."!cursor_debug"("FAIL", "postfix:sym<-->")
  debug_847:
    .return (rx1026_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("261_1283874336.57842") :method
.annotate 'line', 447
    $P1028 = self."!PREFIX__!subrule"("O", "--")
    new $P1029, "ResizablePMCArray"
    push $P1029, $P1028
    .return ($P1029)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("262_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1033_tgt
    .local int rx1033_pos
    .local int rx1033_off
    .local int rx1033_eos
    .local int rx1033_rep
    .local pmc rx1033_cur
    .local pmc rx1033_debug
    (rx1033_cur, rx1033_pos, rx1033_tgt, $I10) = self."!cursor_start"()
    getattribute rx1033_debug, rx1033_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1033_cur
    .local pmc match
    .lex "$/", match
    length rx1033_eos, rx1033_tgt
    gt rx1033_pos, rx1033_eos, rx1033_done
    set rx1033_off, 0
    lt rx1033_pos, 2, rx1033_start
    sub rx1033_off, rx1033_pos, 1
    substr rx1033_tgt, rx1033_tgt, rx1033_off
  rx1033_start:
    eq $I10, 1, rx1033_restart
    if_null rx1033_debug, debug_848
    rx1033_cur."!cursor_debug"("START", "infix:sym<**>")
  debug_848:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1037_done
    goto rxscan1037_scan
  rxscan1037_loop:
    ($P10) = rx1033_cur."from"()
    inc $P10
    set rx1033_pos, $P10
    ge rx1033_pos, rx1033_eos, rxscan1037_done
  rxscan1037_scan:
    set_addr $I10, rxscan1037_loop
    rx1033_cur."!mark_push"(0, rx1033_pos, $I10)
  rxscan1037_done:
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1038_fail
    rx1033_cur."!mark_push"(0, rx1033_pos, $I10)
  # rx literal  "**"
    add $I11, rx1033_pos, 2
    gt $I11, rx1033_eos, rx1033_fail
    sub $I11, rx1033_pos, rx1033_off
    substr $S10, rx1033_tgt, $I11, 2
    ne $S10, "**", rx1033_fail
    add rx1033_pos, 2
    set_addr $I10, rxcap_1038_fail
    ($I12, $I11) = rx1033_cur."!mark_peek"($I10)
    rx1033_cur."!cursor_pos"($I11)
    ($P10) = rx1033_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1033_pos, "")
    rx1033_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1038_done
  rxcap_1038_fail:
    goto rx1033_fail
  rxcap_1038_done:
  # rx subrule "O" subtype=capture negate=
    rx1033_cur."!cursor_pos"(rx1033_pos)
    $P10 = rx1033_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1033_fail
    rx1033_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1033_pos = $P10."pos"()
  # rx pass
    rx1033_cur."!cursor_pass"(rx1033_pos, "infix:sym<**>")
    if_null rx1033_debug, debug_849
    rx1033_cur."!cursor_debug"("PASS", "infix:sym<**>", " at pos=", rx1033_pos)
  debug_849:
    .return (rx1033_cur)
  rx1033_restart:
.annotate 'line', 447
    if_null rx1033_debug, debug_850
    rx1033_cur."!cursor_debug"("NEXT", "infix:sym<**>")
  debug_850:
  rx1033_fail:
    (rx1033_rep, rx1033_pos, $I10, $P10) = rx1033_cur."!mark_fail"(0)
    lt rx1033_pos, -1, rx1033_done
    eq rx1033_pos, -1, rx1033_fail
    jump $I10
  rx1033_done:
    rx1033_cur."!cursor_fail"()
    if_null rx1033_debug, debug_851
    rx1033_cur."!cursor_debug"("FAIL", "infix:sym<**>")
  debug_851:
    .return (rx1033_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("263_1283874336.57842") :method
.annotate 'line', 447
    $P1035 = self."!PREFIX__!subrule"("O", "**")
    new $P1036, "ResizablePMCArray"
    push $P1036, $P1035
    .return ($P1036)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("264_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1040_tgt
    .local int rx1040_pos
    .local int rx1040_off
    .local int rx1040_eos
    .local int rx1040_rep
    .local pmc rx1040_cur
    .local pmc rx1040_debug
    (rx1040_cur, rx1040_pos, rx1040_tgt, $I10) = self."!cursor_start"()
    getattribute rx1040_debug, rx1040_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1040_cur
    .local pmc match
    .lex "$/", match
    length rx1040_eos, rx1040_tgt
    gt rx1040_pos, rx1040_eos, rx1040_done
    set rx1040_off, 0
    lt rx1040_pos, 2, rx1040_start
    sub rx1040_off, rx1040_pos, 1
    substr rx1040_tgt, rx1040_tgt, rx1040_off
  rx1040_start:
    eq $I10, 1, rx1040_restart
    if_null rx1040_debug, debug_852
    rx1040_cur."!cursor_debug"("START", "prefix:sym<+>")
  debug_852:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1044_done
    goto rxscan1044_scan
  rxscan1044_loop:
    ($P10) = rx1040_cur."from"()
    inc $P10
    set rx1040_pos, $P10
    ge rx1040_pos, rx1040_eos, rxscan1044_done
  rxscan1044_scan:
    set_addr $I10, rxscan1044_loop
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  rxscan1044_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1045_fail
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  # rx literal  "+"
    add $I11, rx1040_pos, 1
    gt $I11, rx1040_eos, rx1040_fail
    sub $I11, rx1040_pos, rx1040_off
    ord $I11, rx1040_tgt, $I11
    ne $I11, 43, rx1040_fail
    add rx1040_pos, 1
    set_addr $I10, rxcap_1045_fail
    ($I12, $I11) = rx1040_cur."!mark_peek"($I10)
    rx1040_cur."!cursor_pos"($I11)
    ($P10) = rx1040_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1040_pos, "")
    rx1040_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1045_done
  rxcap_1045_fail:
    goto rx1040_fail
  rxcap_1045_done:
  # rx subrule "O" subtype=capture negate=
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1040_fail
    rx1040_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1040_pos = $P10."pos"()
  # rx pass
    rx1040_cur."!cursor_pass"(rx1040_pos, "prefix:sym<+>")
    if_null rx1040_debug, debug_853
    rx1040_cur."!cursor_debug"("PASS", "prefix:sym<+>", " at pos=", rx1040_pos)
  debug_853:
    .return (rx1040_cur)
  rx1040_restart:
.annotate 'line', 447
    if_null rx1040_debug, debug_854
    rx1040_cur."!cursor_debug"("NEXT", "prefix:sym<+>")
  debug_854:
  rx1040_fail:
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    if_null rx1040_debug, debug_855
    rx1040_cur."!cursor_debug"("FAIL", "prefix:sym<+>")
  debug_855:
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("265_1283874336.57842") :method
.annotate 'line', 447
    $P1042 = self."!PREFIX__!subrule"("O", "+")
    new $P1043, "ResizablePMCArray"
    push $P1043, $P1042
    .return ($P1043)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("266_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1047_tgt
    .local int rx1047_pos
    .local int rx1047_off
    .local int rx1047_eos
    .local int rx1047_rep
    .local pmc rx1047_cur
    .local pmc rx1047_debug
    (rx1047_cur, rx1047_pos, rx1047_tgt, $I10) = self."!cursor_start"()
    getattribute rx1047_debug, rx1047_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1047_cur
    .local pmc match
    .lex "$/", match
    length rx1047_eos, rx1047_tgt
    gt rx1047_pos, rx1047_eos, rx1047_done
    set rx1047_off, 0
    lt rx1047_pos, 2, rx1047_start
    sub rx1047_off, rx1047_pos, 1
    substr rx1047_tgt, rx1047_tgt, rx1047_off
  rx1047_start:
    eq $I10, 1, rx1047_restart
    if_null rx1047_debug, debug_856
    rx1047_cur."!cursor_debug"("START", "prefix:sym<~>")
  debug_856:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1051_done
    goto rxscan1051_scan
  rxscan1051_loop:
    ($P10) = rx1047_cur."from"()
    inc $P10
    set rx1047_pos, $P10
    ge rx1047_pos, rx1047_eos, rxscan1051_done
  rxscan1051_scan:
    set_addr $I10, rxscan1051_loop
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  rxscan1051_done:
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1052_fail
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "~"
    add $I11, rx1047_pos, 1
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    ord $I11, rx1047_tgt, $I11
    ne $I11, 126, rx1047_fail
    add rx1047_pos, 1
    set_addr $I10, rxcap_1052_fail
    ($I12, $I11) = rx1047_cur."!mark_peek"($I10)
    rx1047_cur."!cursor_pos"($I11)
    ($P10) = rx1047_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1047_pos, "")
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1052_done
  rxcap_1052_fail:
    goto rx1047_fail
  rxcap_1052_done:
  # rx subrule "O" subtype=capture negate=
    rx1047_cur."!cursor_pos"(rx1047_pos)
    $P10 = rx1047_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1047_fail
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1047_pos = $P10."pos"()
  # rx pass
    rx1047_cur."!cursor_pass"(rx1047_pos, "prefix:sym<~>")
    if_null rx1047_debug, debug_857
    rx1047_cur."!cursor_debug"("PASS", "prefix:sym<~>", " at pos=", rx1047_pos)
  debug_857:
    .return (rx1047_cur)
  rx1047_restart:
.annotate 'line', 447
    if_null rx1047_debug, debug_858
    rx1047_cur."!cursor_debug"("NEXT", "prefix:sym<~>")
  debug_858:
  rx1047_fail:
    (rx1047_rep, rx1047_pos, $I10, $P10) = rx1047_cur."!mark_fail"(0)
    lt rx1047_pos, -1, rx1047_done
    eq rx1047_pos, -1, rx1047_fail
    jump $I10
  rx1047_done:
    rx1047_cur."!cursor_fail"()
    if_null rx1047_debug, debug_859
    rx1047_cur."!cursor_debug"("FAIL", "prefix:sym<~>")
  debug_859:
    .return (rx1047_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("267_1283874336.57842") :method
.annotate 'line', 447
    $P1049 = self."!PREFIX__!subrule"("O", "~")
    new $P1050, "ResizablePMCArray"
    push $P1050, $P1049
    .return ($P1050)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("268_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1054_tgt
    .local int rx1054_pos
    .local int rx1054_off
    .local int rx1054_eos
    .local int rx1054_rep
    .local pmc rx1054_cur
    .local pmc rx1054_debug
    (rx1054_cur, rx1054_pos, rx1054_tgt, $I10) = self."!cursor_start"()
    getattribute rx1054_debug, rx1054_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1054_cur
    .local pmc match
    .lex "$/", match
    length rx1054_eos, rx1054_tgt
    gt rx1054_pos, rx1054_eos, rx1054_done
    set rx1054_off, 0
    lt rx1054_pos, 2, rx1054_start
    sub rx1054_off, rx1054_pos, 1
    substr rx1054_tgt, rx1054_tgt, rx1054_off
  rx1054_start:
    eq $I10, 1, rx1054_restart
    if_null rx1054_debug, debug_860
    rx1054_cur."!cursor_debug"("START", "prefix:sym<->")
  debug_860:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1057_done
    goto rxscan1057_scan
  rxscan1057_loop:
    ($P10) = rx1054_cur."from"()
    inc $P10
    set rx1054_pos, $P10
    ge rx1054_pos, rx1054_eos, rxscan1057_done
  rxscan1057_scan:
    set_addr $I10, rxscan1057_loop
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  rxscan1057_done:
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1058_fail
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  # rx literal  "-"
    add $I11, rx1054_pos, 1
    gt $I11, rx1054_eos, rx1054_fail
    sub $I11, rx1054_pos, rx1054_off
    ord $I11, rx1054_tgt, $I11
    ne $I11, 45, rx1054_fail
    add rx1054_pos, 1
    set_addr $I10, rxcap_1058_fail
    ($I12, $I11) = rx1054_cur."!mark_peek"($I10)
    rx1054_cur."!cursor_pos"($I11)
    ($P10) = rx1054_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1054_pos, "")
    rx1054_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1058_done
  rxcap_1058_fail:
    goto rx1054_fail
  rxcap_1058_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1054_pos, rx1054_eos, rx1054_fail
    sub $I10, rx1054_pos, rx1054_off
    substr $S10, rx1054_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1054_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1054_cur."!cursor_pos"(rx1054_pos)
    $P10 = rx1054_cur."number"()
    if $P10, rx1054_fail
  # rx subrule "O" subtype=capture negate=
    rx1054_cur."!cursor_pos"(rx1054_pos)
    $P10 = rx1054_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1054_fail
    rx1054_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1054_pos = $P10."pos"()
  # rx pass
    rx1054_cur."!cursor_pass"(rx1054_pos, "prefix:sym<->")
    if_null rx1054_debug, debug_861
    rx1054_cur."!cursor_debug"("PASS", "prefix:sym<->", " at pos=", rx1054_pos)
  debug_861:
    .return (rx1054_cur)
  rx1054_restart:
.annotate 'line', 447
    if_null rx1054_debug, debug_862
    rx1054_cur."!cursor_debug"("NEXT", "prefix:sym<->")
  debug_862:
  rx1054_fail:
    (rx1054_rep, rx1054_pos, $I10, $P10) = rx1054_cur."!mark_fail"(0)
    lt rx1054_pos, -1, rx1054_done
    eq rx1054_pos, -1, rx1054_fail
    jump $I10
  rx1054_done:
    rx1054_cur."!cursor_fail"()
    if_null rx1054_debug, debug_863
    rx1054_cur."!cursor_debug"("FAIL", "prefix:sym<->")
  debug_863:
    .return (rx1054_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("269_1283874336.57842") :method
.annotate 'line', 447
    new $P1056, "ResizablePMCArray"
    push $P1056, "-"
    .return ($P1056)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("270_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1060_tgt
    .local int rx1060_pos
    .local int rx1060_off
    .local int rx1060_eos
    .local int rx1060_rep
    .local pmc rx1060_cur
    .local pmc rx1060_debug
    (rx1060_cur, rx1060_pos, rx1060_tgt, $I10) = self."!cursor_start"()
    getattribute rx1060_debug, rx1060_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1060_cur
    .local pmc match
    .lex "$/", match
    length rx1060_eos, rx1060_tgt
    gt rx1060_pos, rx1060_eos, rx1060_done
    set rx1060_off, 0
    lt rx1060_pos, 2, rx1060_start
    sub rx1060_off, rx1060_pos, 1
    substr rx1060_tgt, rx1060_tgt, rx1060_off
  rx1060_start:
    eq $I10, 1, rx1060_restart
    if_null rx1060_debug, debug_864
    rx1060_cur."!cursor_debug"("START", "prefix:sym<?>")
  debug_864:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1064_done
    goto rxscan1064_scan
  rxscan1064_loop:
    ($P10) = rx1060_cur."from"()
    inc $P10
    set rx1060_pos, $P10
    ge rx1060_pos, rx1060_eos, rxscan1064_done
  rxscan1064_scan:
    set_addr $I10, rxscan1064_loop
    rx1060_cur."!mark_push"(0, rx1060_pos, $I10)
  rxscan1064_done:
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1065_fail
    rx1060_cur."!mark_push"(0, rx1060_pos, $I10)
  # rx literal  "?"
    add $I11, rx1060_pos, 1
    gt $I11, rx1060_eos, rx1060_fail
    sub $I11, rx1060_pos, rx1060_off
    ord $I11, rx1060_tgt, $I11
    ne $I11, 63, rx1060_fail
    add rx1060_pos, 1
    set_addr $I10, rxcap_1065_fail
    ($I12, $I11) = rx1060_cur."!mark_peek"($I10)
    rx1060_cur."!cursor_pos"($I11)
    ($P10) = rx1060_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1060_pos, "")
    rx1060_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1065_done
  rxcap_1065_fail:
    goto rx1060_fail
  rxcap_1065_done:
  # rx subrule "O" subtype=capture negate=
    rx1060_cur."!cursor_pos"(rx1060_pos)
    $P10 = rx1060_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1060_fail
    rx1060_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1060_pos = $P10."pos"()
  # rx pass
    rx1060_cur."!cursor_pass"(rx1060_pos, "prefix:sym<?>")
    if_null rx1060_debug, debug_865
    rx1060_cur."!cursor_debug"("PASS", "prefix:sym<?>", " at pos=", rx1060_pos)
  debug_865:
    .return (rx1060_cur)
  rx1060_restart:
.annotate 'line', 447
    if_null rx1060_debug, debug_866
    rx1060_cur."!cursor_debug"("NEXT", "prefix:sym<?>")
  debug_866:
  rx1060_fail:
    (rx1060_rep, rx1060_pos, $I10, $P10) = rx1060_cur."!mark_fail"(0)
    lt rx1060_pos, -1, rx1060_done
    eq rx1060_pos, -1, rx1060_fail
    jump $I10
  rx1060_done:
    rx1060_cur."!cursor_fail"()
    if_null rx1060_debug, debug_867
    rx1060_cur."!cursor_debug"("FAIL", "prefix:sym<?>")
  debug_867:
    .return (rx1060_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("271_1283874336.57842") :method
.annotate 'line', 447
    $P1062 = self."!PREFIX__!subrule"("O", "?")
    new $P1063, "ResizablePMCArray"
    push $P1063, $P1062
    .return ($P1063)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("272_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1067_tgt
    .local int rx1067_pos
    .local int rx1067_off
    .local int rx1067_eos
    .local int rx1067_rep
    .local pmc rx1067_cur
    .local pmc rx1067_debug
    (rx1067_cur, rx1067_pos, rx1067_tgt, $I10) = self."!cursor_start"()
    getattribute rx1067_debug, rx1067_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1067_cur
    .local pmc match
    .lex "$/", match
    length rx1067_eos, rx1067_tgt
    gt rx1067_pos, rx1067_eos, rx1067_done
    set rx1067_off, 0
    lt rx1067_pos, 2, rx1067_start
    sub rx1067_off, rx1067_pos, 1
    substr rx1067_tgt, rx1067_tgt, rx1067_off
  rx1067_start:
    eq $I10, 1, rx1067_restart
    if_null rx1067_debug, debug_868
    rx1067_cur."!cursor_debug"("START", "prefix:sym<!>")
  debug_868:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1071_done
    goto rxscan1071_scan
  rxscan1071_loop:
    ($P10) = rx1067_cur."from"()
    inc $P10
    set rx1067_pos, $P10
    ge rx1067_pos, rx1067_eos, rxscan1071_done
  rxscan1071_scan:
    set_addr $I10, rxscan1071_loop
    rx1067_cur."!mark_push"(0, rx1067_pos, $I10)
  rxscan1071_done:
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1072_fail
    rx1067_cur."!mark_push"(0, rx1067_pos, $I10)
  # rx literal  "!"
    add $I11, rx1067_pos, 1
    gt $I11, rx1067_eos, rx1067_fail
    sub $I11, rx1067_pos, rx1067_off
    ord $I11, rx1067_tgt, $I11
    ne $I11, 33, rx1067_fail
    add rx1067_pos, 1
    set_addr $I10, rxcap_1072_fail
    ($I12, $I11) = rx1067_cur."!mark_peek"($I10)
    rx1067_cur."!cursor_pos"($I11)
    ($P10) = rx1067_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1067_pos, "")
    rx1067_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1072_done
  rxcap_1072_fail:
    goto rx1067_fail
  rxcap_1072_done:
  # rx subrule "O" subtype=capture negate=
    rx1067_cur."!cursor_pos"(rx1067_pos)
    $P10 = rx1067_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1067_fail
    rx1067_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1067_pos = $P10."pos"()
  # rx pass
    rx1067_cur."!cursor_pass"(rx1067_pos, "prefix:sym<!>")
    if_null rx1067_debug, debug_869
    rx1067_cur."!cursor_debug"("PASS", "prefix:sym<!>", " at pos=", rx1067_pos)
  debug_869:
    .return (rx1067_cur)
  rx1067_restart:
.annotate 'line', 447
    if_null rx1067_debug, debug_870
    rx1067_cur."!cursor_debug"("NEXT", "prefix:sym<!>")
  debug_870:
  rx1067_fail:
    (rx1067_rep, rx1067_pos, $I10, $P10) = rx1067_cur."!mark_fail"(0)
    lt rx1067_pos, -1, rx1067_done
    eq rx1067_pos, -1, rx1067_fail
    jump $I10
  rx1067_done:
    rx1067_cur."!cursor_fail"()
    if_null rx1067_debug, debug_871
    rx1067_cur."!cursor_debug"("FAIL", "prefix:sym<!>")
  debug_871:
    .return (rx1067_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("273_1283874336.57842") :method
.annotate 'line', 447
    $P1069 = self."!PREFIX__!subrule"("O", "!")
    new $P1070, "ResizablePMCArray"
    push $P1070, $P1069
    .return ($P1070)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("274_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1074_tgt
    .local int rx1074_pos
    .local int rx1074_off
    .local int rx1074_eos
    .local int rx1074_rep
    .local pmc rx1074_cur
    .local pmc rx1074_debug
    (rx1074_cur, rx1074_pos, rx1074_tgt, $I10) = self."!cursor_start"()
    getattribute rx1074_debug, rx1074_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1074_cur
    .local pmc match
    .lex "$/", match
    length rx1074_eos, rx1074_tgt
    gt rx1074_pos, rx1074_eos, rx1074_done
    set rx1074_off, 0
    lt rx1074_pos, 2, rx1074_start
    sub rx1074_off, rx1074_pos, 1
    substr rx1074_tgt, rx1074_tgt, rx1074_off
  rx1074_start:
    eq $I10, 1, rx1074_restart
    if_null rx1074_debug, debug_872
    rx1074_cur."!cursor_debug"("START", "prefix:sym<|>")
  debug_872:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1078_done
    goto rxscan1078_scan
  rxscan1078_loop:
    ($P10) = rx1074_cur."from"()
    inc $P10
    set rx1074_pos, $P10
    ge rx1074_pos, rx1074_eos, rxscan1078_done
  rxscan1078_scan:
    set_addr $I10, rxscan1078_loop
    rx1074_cur."!mark_push"(0, rx1074_pos, $I10)
  rxscan1078_done:
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1079_fail
    rx1074_cur."!mark_push"(0, rx1074_pos, $I10)
  # rx literal  "|"
    add $I11, rx1074_pos, 1
    gt $I11, rx1074_eos, rx1074_fail
    sub $I11, rx1074_pos, rx1074_off
    ord $I11, rx1074_tgt, $I11
    ne $I11, 124, rx1074_fail
    add rx1074_pos, 1
    set_addr $I10, rxcap_1079_fail
    ($I12, $I11) = rx1074_cur."!mark_peek"($I10)
    rx1074_cur."!cursor_pos"($I11)
    ($P10) = rx1074_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1074_pos, "")
    rx1074_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1079_done
  rxcap_1079_fail:
    goto rx1074_fail
  rxcap_1079_done:
  # rx subrule "O" subtype=capture negate=
    rx1074_cur."!cursor_pos"(rx1074_pos)
    $P10 = rx1074_cur."O"("%symbolic_unary")
    unless $P10, rx1074_fail
    rx1074_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1074_pos = $P10."pos"()
  # rx pass
    rx1074_cur."!cursor_pass"(rx1074_pos, "prefix:sym<|>")
    if_null rx1074_debug, debug_873
    rx1074_cur."!cursor_debug"("PASS", "prefix:sym<|>", " at pos=", rx1074_pos)
  debug_873:
    .return (rx1074_cur)
  rx1074_restart:
.annotate 'line', 447
    if_null rx1074_debug, debug_874
    rx1074_cur."!cursor_debug"("NEXT", "prefix:sym<|>")
  debug_874:
  rx1074_fail:
    (rx1074_rep, rx1074_pos, $I10, $P10) = rx1074_cur."!mark_fail"(0)
    lt rx1074_pos, -1, rx1074_done
    eq rx1074_pos, -1, rx1074_fail
    jump $I10
  rx1074_done:
    rx1074_cur."!cursor_fail"()
    if_null rx1074_debug, debug_875
    rx1074_cur."!cursor_debug"("FAIL", "prefix:sym<|>")
  debug_875:
    .return (rx1074_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("275_1283874336.57842") :method
.annotate 'line', 447
    $P1076 = self."!PREFIX__!subrule"("O", "|")
    new $P1077, "ResizablePMCArray"
    push $P1077, $P1076
    .return ($P1077)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("276_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1081_tgt
    .local int rx1081_pos
    .local int rx1081_off
    .local int rx1081_eos
    .local int rx1081_rep
    .local pmc rx1081_cur
    .local pmc rx1081_debug
    (rx1081_cur, rx1081_pos, rx1081_tgt, $I10) = self."!cursor_start"()
    getattribute rx1081_debug, rx1081_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1081_cur
    .local pmc match
    .lex "$/", match
    length rx1081_eos, rx1081_tgt
    gt rx1081_pos, rx1081_eos, rx1081_done
    set rx1081_off, 0
    lt rx1081_pos, 2, rx1081_start
    sub rx1081_off, rx1081_pos, 1
    substr rx1081_tgt, rx1081_tgt, rx1081_off
  rx1081_start:
    eq $I10, 1, rx1081_restart
    if_null rx1081_debug, debug_876
    rx1081_cur."!cursor_debug"("START", "infix:sym<*>")
  debug_876:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1085_done
    goto rxscan1085_scan
  rxscan1085_loop:
    ($P10) = rx1081_cur."from"()
    inc $P10
    set rx1081_pos, $P10
    ge rx1081_pos, rx1081_eos, rxscan1085_done
  rxscan1085_scan:
    set_addr $I10, rxscan1085_loop
    rx1081_cur."!mark_push"(0, rx1081_pos, $I10)
  rxscan1085_done:
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1086_fail
    rx1081_cur."!mark_push"(0, rx1081_pos, $I10)
  # rx literal  "*"
    add $I11, rx1081_pos, 1
    gt $I11, rx1081_eos, rx1081_fail
    sub $I11, rx1081_pos, rx1081_off
    ord $I11, rx1081_tgt, $I11
    ne $I11, 42, rx1081_fail
    add rx1081_pos, 1
    set_addr $I10, rxcap_1086_fail
    ($I12, $I11) = rx1081_cur."!mark_peek"($I10)
    rx1081_cur."!cursor_pos"($I11)
    ($P10) = rx1081_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1081_pos, "")
    rx1081_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1086_done
  rxcap_1086_fail:
    goto rx1081_fail
  rxcap_1086_done:
  # rx subrule "O" subtype=capture negate=
    rx1081_cur."!cursor_pos"(rx1081_pos)
    $P10 = rx1081_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1081_fail
    rx1081_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1081_pos = $P10."pos"()
  # rx pass
    rx1081_cur."!cursor_pass"(rx1081_pos, "infix:sym<*>")
    if_null rx1081_debug, debug_877
    rx1081_cur."!cursor_debug"("PASS", "infix:sym<*>", " at pos=", rx1081_pos)
  debug_877:
    .return (rx1081_cur)
  rx1081_restart:
.annotate 'line', 447
    if_null rx1081_debug, debug_878
    rx1081_cur."!cursor_debug"("NEXT", "infix:sym<*>")
  debug_878:
  rx1081_fail:
    (rx1081_rep, rx1081_pos, $I10, $P10) = rx1081_cur."!mark_fail"(0)
    lt rx1081_pos, -1, rx1081_done
    eq rx1081_pos, -1, rx1081_fail
    jump $I10
  rx1081_done:
    rx1081_cur."!cursor_fail"()
    if_null rx1081_debug, debug_879
    rx1081_cur."!cursor_debug"("FAIL", "infix:sym<*>")
  debug_879:
    .return (rx1081_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("277_1283874336.57842") :method
.annotate 'line', 447
    $P1083 = self."!PREFIX__!subrule"("O", "*")
    new $P1084, "ResizablePMCArray"
    push $P1084, $P1083
    .return ($P1084)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("278_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1088_tgt
    .local int rx1088_pos
    .local int rx1088_off
    .local int rx1088_eos
    .local int rx1088_rep
    .local pmc rx1088_cur
    .local pmc rx1088_debug
    (rx1088_cur, rx1088_pos, rx1088_tgt, $I10) = self."!cursor_start"()
    getattribute rx1088_debug, rx1088_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1088_cur
    .local pmc match
    .lex "$/", match
    length rx1088_eos, rx1088_tgt
    gt rx1088_pos, rx1088_eos, rx1088_done
    set rx1088_off, 0
    lt rx1088_pos, 2, rx1088_start
    sub rx1088_off, rx1088_pos, 1
    substr rx1088_tgt, rx1088_tgt, rx1088_off
  rx1088_start:
    eq $I10, 1, rx1088_restart
    if_null rx1088_debug, debug_880
    rx1088_cur."!cursor_debug"("START", "infix:sym</>")
  debug_880:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1092_done
    goto rxscan1092_scan
  rxscan1092_loop:
    ($P10) = rx1088_cur."from"()
    inc $P10
    set rx1088_pos, $P10
    ge rx1088_pos, rx1088_eos, rxscan1092_done
  rxscan1092_scan:
    set_addr $I10, rxscan1092_loop
    rx1088_cur."!mark_push"(0, rx1088_pos, $I10)
  rxscan1092_done:
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1093_fail
    rx1088_cur."!mark_push"(0, rx1088_pos, $I10)
  # rx literal  "/"
    add $I11, rx1088_pos, 1
    gt $I11, rx1088_eos, rx1088_fail
    sub $I11, rx1088_pos, rx1088_off
    ord $I11, rx1088_tgt, $I11
    ne $I11, 47, rx1088_fail
    add rx1088_pos, 1
    set_addr $I10, rxcap_1093_fail
    ($I12, $I11) = rx1088_cur."!mark_peek"($I10)
    rx1088_cur."!cursor_pos"($I11)
    ($P10) = rx1088_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1088_pos, "")
    rx1088_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1093_done
  rxcap_1093_fail:
    goto rx1088_fail
  rxcap_1093_done:
  # rx subrule "O" subtype=capture negate=
    rx1088_cur."!cursor_pos"(rx1088_pos)
    $P10 = rx1088_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1088_fail
    rx1088_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1088_pos = $P10."pos"()
  # rx pass
    rx1088_cur."!cursor_pass"(rx1088_pos, "infix:sym</>")
    if_null rx1088_debug, debug_881
    rx1088_cur."!cursor_debug"("PASS", "infix:sym</>", " at pos=", rx1088_pos)
  debug_881:
    .return (rx1088_cur)
  rx1088_restart:
.annotate 'line', 447
    if_null rx1088_debug, debug_882
    rx1088_cur."!cursor_debug"("NEXT", "infix:sym</>")
  debug_882:
  rx1088_fail:
    (rx1088_rep, rx1088_pos, $I10, $P10) = rx1088_cur."!mark_fail"(0)
    lt rx1088_pos, -1, rx1088_done
    eq rx1088_pos, -1, rx1088_fail
    jump $I10
  rx1088_done:
    rx1088_cur."!cursor_fail"()
    if_null rx1088_debug, debug_883
    rx1088_cur."!cursor_debug"("FAIL", "infix:sym</>")
  debug_883:
    .return (rx1088_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("279_1283874336.57842") :method
.annotate 'line', 447
    $P1090 = self."!PREFIX__!subrule"("O", "/")
    new $P1091, "ResizablePMCArray"
    push $P1091, $P1090
    .return ($P1091)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("280_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1095_tgt
    .local int rx1095_pos
    .local int rx1095_off
    .local int rx1095_eos
    .local int rx1095_rep
    .local pmc rx1095_cur
    .local pmc rx1095_debug
    (rx1095_cur, rx1095_pos, rx1095_tgt, $I10) = self."!cursor_start"()
    getattribute rx1095_debug, rx1095_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1095_cur
    .local pmc match
    .lex "$/", match
    length rx1095_eos, rx1095_tgt
    gt rx1095_pos, rx1095_eos, rx1095_done
    set rx1095_off, 0
    lt rx1095_pos, 2, rx1095_start
    sub rx1095_off, rx1095_pos, 1
    substr rx1095_tgt, rx1095_tgt, rx1095_off
  rx1095_start:
    eq $I10, 1, rx1095_restart
    if_null rx1095_debug, debug_884
    rx1095_cur."!cursor_debug"("START", "infix:sym<%>")
  debug_884:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1099_done
    goto rxscan1099_scan
  rxscan1099_loop:
    ($P10) = rx1095_cur."from"()
    inc $P10
    set rx1095_pos, $P10
    ge rx1095_pos, rx1095_eos, rxscan1099_done
  rxscan1099_scan:
    set_addr $I10, rxscan1099_loop
    rx1095_cur."!mark_push"(0, rx1095_pos, $I10)
  rxscan1099_done:
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1100_fail
    rx1095_cur."!mark_push"(0, rx1095_pos, $I10)
  # rx literal  "%"
    add $I11, rx1095_pos, 1
    gt $I11, rx1095_eos, rx1095_fail
    sub $I11, rx1095_pos, rx1095_off
    ord $I11, rx1095_tgt, $I11
    ne $I11, 37, rx1095_fail
    add rx1095_pos, 1
    set_addr $I10, rxcap_1100_fail
    ($I12, $I11) = rx1095_cur."!mark_peek"($I10)
    rx1095_cur."!cursor_pos"($I11)
    ($P10) = rx1095_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1095_pos, "")
    rx1095_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1100_done
  rxcap_1100_fail:
    goto rx1095_fail
  rxcap_1100_done:
  # rx subrule "O" subtype=capture negate=
    rx1095_cur."!cursor_pos"(rx1095_pos)
    $P10 = rx1095_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1095_fail
    rx1095_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1095_pos = $P10."pos"()
  # rx pass
    rx1095_cur."!cursor_pass"(rx1095_pos, "infix:sym<%>")
    if_null rx1095_debug, debug_885
    rx1095_cur."!cursor_debug"("PASS", "infix:sym<%>", " at pos=", rx1095_pos)
  debug_885:
    .return (rx1095_cur)
  rx1095_restart:
.annotate 'line', 447
    if_null rx1095_debug, debug_886
    rx1095_cur."!cursor_debug"("NEXT", "infix:sym<%>")
  debug_886:
  rx1095_fail:
    (rx1095_rep, rx1095_pos, $I10, $P10) = rx1095_cur."!mark_fail"(0)
    lt rx1095_pos, -1, rx1095_done
    eq rx1095_pos, -1, rx1095_fail
    jump $I10
  rx1095_done:
    rx1095_cur."!cursor_fail"()
    if_null rx1095_debug, debug_887
    rx1095_cur."!cursor_debug"("FAIL", "infix:sym<%>")
  debug_887:
    .return (rx1095_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("281_1283874336.57842") :method
.annotate 'line', 447
    $P1097 = self."!PREFIX__!subrule"("O", "%")
    new $P1098, "ResizablePMCArray"
    push $P1098, $P1097
    .return ($P1098)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("282_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1102_tgt
    .local int rx1102_pos
    .local int rx1102_off
    .local int rx1102_eos
    .local int rx1102_rep
    .local pmc rx1102_cur
    .local pmc rx1102_debug
    (rx1102_cur, rx1102_pos, rx1102_tgt, $I10) = self."!cursor_start"()
    getattribute rx1102_debug, rx1102_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1102_cur
    .local pmc match
    .lex "$/", match
    length rx1102_eos, rx1102_tgt
    gt rx1102_pos, rx1102_eos, rx1102_done
    set rx1102_off, 0
    lt rx1102_pos, 2, rx1102_start
    sub rx1102_off, rx1102_pos, 1
    substr rx1102_tgt, rx1102_tgt, rx1102_off
  rx1102_start:
    eq $I10, 1, rx1102_restart
    if_null rx1102_debug, debug_888
    rx1102_cur."!cursor_debug"("START", "infix:sym<+&>")
  debug_888:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1106_done
    goto rxscan1106_scan
  rxscan1106_loop:
    ($P10) = rx1102_cur."from"()
    inc $P10
    set rx1102_pos, $P10
    ge rx1102_pos, rx1102_eos, rxscan1106_done
  rxscan1106_scan:
    set_addr $I10, rxscan1106_loop
    rx1102_cur."!mark_push"(0, rx1102_pos, $I10)
  rxscan1106_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1107_fail
    rx1102_cur."!mark_push"(0, rx1102_pos, $I10)
  # rx literal  "+&"
    add $I11, rx1102_pos, 2
    gt $I11, rx1102_eos, rx1102_fail
    sub $I11, rx1102_pos, rx1102_off
    substr $S10, rx1102_tgt, $I11, 2
    ne $S10, "+&", rx1102_fail
    add rx1102_pos, 2
    set_addr $I10, rxcap_1107_fail
    ($I12, $I11) = rx1102_cur."!mark_peek"($I10)
    rx1102_cur."!cursor_pos"($I11)
    ($P10) = rx1102_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1102_pos, "")
    rx1102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1107_done
  rxcap_1107_fail:
    goto rx1102_fail
  rxcap_1107_done:
  # rx subrule "O" subtype=capture negate=
    rx1102_cur."!cursor_pos"(rx1102_pos)
    $P10 = rx1102_cur."O"("%multiplicative, :pirop<band III>")
    unless $P10, rx1102_fail
    rx1102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1102_pos = $P10."pos"()
  # rx pass
    rx1102_cur."!cursor_pass"(rx1102_pos, "infix:sym<+&>")
    if_null rx1102_debug, debug_889
    rx1102_cur."!cursor_debug"("PASS", "infix:sym<+&>", " at pos=", rx1102_pos)
  debug_889:
    .return (rx1102_cur)
  rx1102_restart:
.annotate 'line', 447
    if_null rx1102_debug, debug_890
    rx1102_cur."!cursor_debug"("NEXT", "infix:sym<+&>")
  debug_890:
  rx1102_fail:
    (rx1102_rep, rx1102_pos, $I10, $P10) = rx1102_cur."!mark_fail"(0)
    lt rx1102_pos, -1, rx1102_done
    eq rx1102_pos, -1, rx1102_fail
    jump $I10
  rx1102_done:
    rx1102_cur."!cursor_fail"()
    if_null rx1102_debug, debug_891
    rx1102_cur."!cursor_debug"("FAIL", "infix:sym<+&>")
  debug_891:
    .return (rx1102_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("283_1283874336.57842") :method
.annotate 'line', 447
    $P1104 = self."!PREFIX__!subrule"("O", "+&")
    new $P1105, "ResizablePMCArray"
    push $P1105, $P1104
    .return ($P1105)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("284_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1109_tgt
    .local int rx1109_pos
    .local int rx1109_off
    .local int rx1109_eos
    .local int rx1109_rep
    .local pmc rx1109_cur
    .local pmc rx1109_debug
    (rx1109_cur, rx1109_pos, rx1109_tgt, $I10) = self."!cursor_start"()
    getattribute rx1109_debug, rx1109_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1109_cur
    .local pmc match
    .lex "$/", match
    length rx1109_eos, rx1109_tgt
    gt rx1109_pos, rx1109_eos, rx1109_done
    set rx1109_off, 0
    lt rx1109_pos, 2, rx1109_start
    sub rx1109_off, rx1109_pos, 1
    substr rx1109_tgt, rx1109_tgt, rx1109_off
  rx1109_start:
    eq $I10, 1, rx1109_restart
    if_null rx1109_debug, debug_892
    rx1109_cur."!cursor_debug"("START", "infix:sym<+>")
  debug_892:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1113_done
    goto rxscan1113_scan
  rxscan1113_loop:
    ($P10) = rx1109_cur."from"()
    inc $P10
    set rx1109_pos, $P10
    ge rx1109_pos, rx1109_eos, rxscan1113_done
  rxscan1113_scan:
    set_addr $I10, rxscan1113_loop
    rx1109_cur."!mark_push"(0, rx1109_pos, $I10)
  rxscan1113_done:
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1114_fail
    rx1109_cur."!mark_push"(0, rx1109_pos, $I10)
  # rx literal  "+"
    add $I11, rx1109_pos, 1
    gt $I11, rx1109_eos, rx1109_fail
    sub $I11, rx1109_pos, rx1109_off
    ord $I11, rx1109_tgt, $I11
    ne $I11, 43, rx1109_fail
    add rx1109_pos, 1
    set_addr $I10, rxcap_1114_fail
    ($I12, $I11) = rx1109_cur."!mark_peek"($I10)
    rx1109_cur."!cursor_pos"($I11)
    ($P10) = rx1109_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1109_pos, "")
    rx1109_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1114_done
  rxcap_1114_fail:
    goto rx1109_fail
  rxcap_1114_done:
  # rx subrule "O" subtype=capture negate=
    rx1109_cur."!cursor_pos"(rx1109_pos)
    $P10 = rx1109_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1109_fail
    rx1109_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1109_pos = $P10."pos"()
  # rx pass
    rx1109_cur."!cursor_pass"(rx1109_pos, "infix:sym<+>")
    if_null rx1109_debug, debug_893
    rx1109_cur."!cursor_debug"("PASS", "infix:sym<+>", " at pos=", rx1109_pos)
  debug_893:
    .return (rx1109_cur)
  rx1109_restart:
.annotate 'line', 447
    if_null rx1109_debug, debug_894
    rx1109_cur."!cursor_debug"("NEXT", "infix:sym<+>")
  debug_894:
  rx1109_fail:
    (rx1109_rep, rx1109_pos, $I10, $P10) = rx1109_cur."!mark_fail"(0)
    lt rx1109_pos, -1, rx1109_done
    eq rx1109_pos, -1, rx1109_fail
    jump $I10
  rx1109_done:
    rx1109_cur."!cursor_fail"()
    if_null rx1109_debug, debug_895
    rx1109_cur."!cursor_debug"("FAIL", "infix:sym<+>")
  debug_895:
    .return (rx1109_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("285_1283874336.57842") :method
.annotate 'line', 447
    $P1111 = self."!PREFIX__!subrule"("O", "+")
    new $P1112, "ResizablePMCArray"
    push $P1112, $P1111
    .return ($P1112)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("286_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1116_tgt
    .local int rx1116_pos
    .local int rx1116_off
    .local int rx1116_eos
    .local int rx1116_rep
    .local pmc rx1116_cur
    .local pmc rx1116_debug
    (rx1116_cur, rx1116_pos, rx1116_tgt, $I10) = self."!cursor_start"()
    getattribute rx1116_debug, rx1116_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1116_cur
    .local pmc match
    .lex "$/", match
    length rx1116_eos, rx1116_tgt
    gt rx1116_pos, rx1116_eos, rx1116_done
    set rx1116_off, 0
    lt rx1116_pos, 2, rx1116_start
    sub rx1116_off, rx1116_pos, 1
    substr rx1116_tgt, rx1116_tgt, rx1116_off
  rx1116_start:
    eq $I10, 1, rx1116_restart
    if_null rx1116_debug, debug_896
    rx1116_cur."!cursor_debug"("START", "infix:sym<->")
  debug_896:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1120_done
    goto rxscan1120_scan
  rxscan1120_loop:
    ($P10) = rx1116_cur."from"()
    inc $P10
    set rx1116_pos, $P10
    ge rx1116_pos, rx1116_eos, rxscan1120_done
  rxscan1120_scan:
    set_addr $I10, rxscan1120_loop
    rx1116_cur."!mark_push"(0, rx1116_pos, $I10)
  rxscan1120_done:
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1121_fail
    rx1116_cur."!mark_push"(0, rx1116_pos, $I10)
  # rx literal  "-"
    add $I11, rx1116_pos, 1
    gt $I11, rx1116_eos, rx1116_fail
    sub $I11, rx1116_pos, rx1116_off
    ord $I11, rx1116_tgt, $I11
    ne $I11, 45, rx1116_fail
    add rx1116_pos, 1
    set_addr $I10, rxcap_1121_fail
    ($I12, $I11) = rx1116_cur."!mark_peek"($I10)
    rx1116_cur."!cursor_pos"($I11)
    ($P10) = rx1116_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1116_pos, "")
    rx1116_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1121_done
  rxcap_1121_fail:
    goto rx1116_fail
  rxcap_1121_done:
  # rx subrule "O" subtype=capture negate=
    rx1116_cur."!cursor_pos"(rx1116_pos)
    $P10 = rx1116_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1116_fail
    rx1116_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1116_pos = $P10."pos"()
  # rx pass
    rx1116_cur."!cursor_pass"(rx1116_pos, "infix:sym<->")
    if_null rx1116_debug, debug_897
    rx1116_cur."!cursor_debug"("PASS", "infix:sym<->", " at pos=", rx1116_pos)
  debug_897:
    .return (rx1116_cur)
  rx1116_restart:
.annotate 'line', 447
    if_null rx1116_debug, debug_898
    rx1116_cur."!cursor_debug"("NEXT", "infix:sym<->")
  debug_898:
  rx1116_fail:
    (rx1116_rep, rx1116_pos, $I10, $P10) = rx1116_cur."!mark_fail"(0)
    lt rx1116_pos, -1, rx1116_done
    eq rx1116_pos, -1, rx1116_fail
    jump $I10
  rx1116_done:
    rx1116_cur."!cursor_fail"()
    if_null rx1116_debug, debug_899
    rx1116_cur."!cursor_debug"("FAIL", "infix:sym<->")
  debug_899:
    .return (rx1116_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("287_1283874336.57842") :method
.annotate 'line', 447
    $P1118 = self."!PREFIX__!subrule"("O", "-")
    new $P1119, "ResizablePMCArray"
    push $P1119, $P1118
    .return ($P1119)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("288_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1123_tgt
    .local int rx1123_pos
    .local int rx1123_off
    .local int rx1123_eos
    .local int rx1123_rep
    .local pmc rx1123_cur
    .local pmc rx1123_debug
    (rx1123_cur, rx1123_pos, rx1123_tgt, $I10) = self."!cursor_start"()
    getattribute rx1123_debug, rx1123_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1123_cur
    .local pmc match
    .lex "$/", match
    length rx1123_eos, rx1123_tgt
    gt rx1123_pos, rx1123_eos, rx1123_done
    set rx1123_off, 0
    lt rx1123_pos, 2, rx1123_start
    sub rx1123_off, rx1123_pos, 1
    substr rx1123_tgt, rx1123_tgt, rx1123_off
  rx1123_start:
    eq $I10, 1, rx1123_restart
    if_null rx1123_debug, debug_900
    rx1123_cur."!cursor_debug"("START", "infix:sym<+|>")
  debug_900:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1127_done
    goto rxscan1127_scan
  rxscan1127_loop:
    ($P10) = rx1123_cur."from"()
    inc $P10
    set rx1123_pos, $P10
    ge rx1123_pos, rx1123_eos, rxscan1127_done
  rxscan1127_scan:
    set_addr $I10, rxscan1127_loop
    rx1123_cur."!mark_push"(0, rx1123_pos, $I10)
  rxscan1127_done:
.annotate 'line', 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1128_fail
    rx1123_cur."!mark_push"(0, rx1123_pos, $I10)
  # rx literal  "+|"
    add $I11, rx1123_pos, 2
    gt $I11, rx1123_eos, rx1123_fail
    sub $I11, rx1123_pos, rx1123_off
    substr $S10, rx1123_tgt, $I11, 2
    ne $S10, "+|", rx1123_fail
    add rx1123_pos, 2
    set_addr $I10, rxcap_1128_fail
    ($I12, $I11) = rx1123_cur."!mark_peek"($I10)
    rx1123_cur."!cursor_pos"($I11)
    ($P10) = rx1123_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1123_pos, "")
    rx1123_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1128_done
  rxcap_1128_fail:
    goto rx1123_fail
  rxcap_1128_done:
  # rx subrule "O" subtype=capture negate=
    rx1123_cur."!cursor_pos"(rx1123_pos)
    $P10 = rx1123_cur."O"("%additive, :pirop<bor III>")
    unless $P10, rx1123_fail
    rx1123_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1123_pos = $P10."pos"()
  # rx pass
    rx1123_cur."!cursor_pass"(rx1123_pos, "infix:sym<+|>")
    if_null rx1123_debug, debug_901
    rx1123_cur."!cursor_debug"("PASS", "infix:sym<+|>", " at pos=", rx1123_pos)
  debug_901:
    .return (rx1123_cur)
  rx1123_restart:
.annotate 'line', 447
    if_null rx1123_debug, debug_902
    rx1123_cur."!cursor_debug"("NEXT", "infix:sym<+|>")
  debug_902:
  rx1123_fail:
    (rx1123_rep, rx1123_pos, $I10, $P10) = rx1123_cur."!mark_fail"(0)
    lt rx1123_pos, -1, rx1123_done
    eq rx1123_pos, -1, rx1123_fail
    jump $I10
  rx1123_done:
    rx1123_cur."!cursor_fail"()
    if_null rx1123_debug, debug_903
    rx1123_cur."!cursor_debug"("FAIL", "infix:sym<+|>")
  debug_903:
    .return (rx1123_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("289_1283874336.57842") :method
.annotate 'line', 447
    $P1125 = self."!PREFIX__!subrule"("O", "+|")
    new $P1126, "ResizablePMCArray"
    push $P1126, $P1125
    .return ($P1126)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("290_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1130_tgt
    .local int rx1130_pos
    .local int rx1130_off
    .local int rx1130_eos
    .local int rx1130_rep
    .local pmc rx1130_cur
    .local pmc rx1130_debug
    (rx1130_cur, rx1130_pos, rx1130_tgt, $I10) = self."!cursor_start"()
    getattribute rx1130_debug, rx1130_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1130_cur
    .local pmc match
    .lex "$/", match
    length rx1130_eos, rx1130_tgt
    gt rx1130_pos, rx1130_eos, rx1130_done
    set rx1130_off, 0
    lt rx1130_pos, 2, rx1130_start
    sub rx1130_off, rx1130_pos, 1
    substr rx1130_tgt, rx1130_tgt, rx1130_off
  rx1130_start:
    eq $I10, 1, rx1130_restart
    if_null rx1130_debug, debug_904
    rx1130_cur."!cursor_debug"("START", "infix:sym<+^>")
  debug_904:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1134_done
    goto rxscan1134_scan
  rxscan1134_loop:
    ($P10) = rx1130_cur."from"()
    inc $P10
    set rx1130_pos, $P10
    ge rx1130_pos, rx1130_eos, rxscan1134_done
  rxscan1134_scan:
    set_addr $I10, rxscan1134_loop
    rx1130_cur."!mark_push"(0, rx1130_pos, $I10)
  rxscan1134_done:
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1135_fail
    rx1130_cur."!mark_push"(0, rx1130_pos, $I10)
  # rx literal  "+^"
    add $I11, rx1130_pos, 2
    gt $I11, rx1130_eos, rx1130_fail
    sub $I11, rx1130_pos, rx1130_off
    substr $S10, rx1130_tgt, $I11, 2
    ne $S10, "+^", rx1130_fail
    add rx1130_pos, 2
    set_addr $I10, rxcap_1135_fail
    ($I12, $I11) = rx1130_cur."!mark_peek"($I10)
    rx1130_cur."!cursor_pos"($I11)
    ($P10) = rx1130_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1130_pos, "")
    rx1130_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1135_done
  rxcap_1135_fail:
    goto rx1130_fail
  rxcap_1135_done:
  # rx subrule "O" subtype=capture negate=
    rx1130_cur."!cursor_pos"(rx1130_pos)
    $P10 = rx1130_cur."O"("%additive, :pirop<bxor III>")
    unless $P10, rx1130_fail
    rx1130_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1130_pos = $P10."pos"()
  # rx pass
    rx1130_cur."!cursor_pass"(rx1130_pos, "infix:sym<+^>")
    if_null rx1130_debug, debug_905
    rx1130_cur."!cursor_debug"("PASS", "infix:sym<+^>", " at pos=", rx1130_pos)
  debug_905:
    .return (rx1130_cur)
  rx1130_restart:
.annotate 'line', 447
    if_null rx1130_debug, debug_906
    rx1130_cur."!cursor_debug"("NEXT", "infix:sym<+^>")
  debug_906:
  rx1130_fail:
    (rx1130_rep, rx1130_pos, $I10, $P10) = rx1130_cur."!mark_fail"(0)
    lt rx1130_pos, -1, rx1130_done
    eq rx1130_pos, -1, rx1130_fail
    jump $I10
  rx1130_done:
    rx1130_cur."!cursor_fail"()
    if_null rx1130_debug, debug_907
    rx1130_cur."!cursor_debug"("FAIL", "infix:sym<+^>")
  debug_907:
    .return (rx1130_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("291_1283874336.57842") :method
.annotate 'line', 447
    $P1132 = self."!PREFIX__!subrule"("O", "+^")
    new $P1133, "ResizablePMCArray"
    push $P1133, $P1132
    .return ($P1133)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("292_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1137_tgt
    .local int rx1137_pos
    .local int rx1137_off
    .local int rx1137_eos
    .local int rx1137_rep
    .local pmc rx1137_cur
    .local pmc rx1137_debug
    (rx1137_cur, rx1137_pos, rx1137_tgt, $I10) = self."!cursor_start"()
    getattribute rx1137_debug, rx1137_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1137_cur
    .local pmc match
    .lex "$/", match
    length rx1137_eos, rx1137_tgt
    gt rx1137_pos, rx1137_eos, rx1137_done
    set rx1137_off, 0
    lt rx1137_pos, 2, rx1137_start
    sub rx1137_off, rx1137_pos, 1
    substr rx1137_tgt, rx1137_tgt, rx1137_off
  rx1137_start:
    eq $I10, 1, rx1137_restart
    if_null rx1137_debug, debug_908
    rx1137_cur."!cursor_debug"("START", "infix:sym<~>")
  debug_908:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1141_done
    goto rxscan1141_scan
  rxscan1141_loop:
    ($P10) = rx1137_cur."from"()
    inc $P10
    set rx1137_pos, $P10
    ge rx1137_pos, rx1137_eos, rxscan1141_done
  rxscan1141_scan:
    set_addr $I10, rxscan1141_loop
    rx1137_cur."!mark_push"(0, rx1137_pos, $I10)
  rxscan1141_done:
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1142_fail
    rx1137_cur."!mark_push"(0, rx1137_pos, $I10)
  # rx literal  "~"
    add $I11, rx1137_pos, 1
    gt $I11, rx1137_eos, rx1137_fail
    sub $I11, rx1137_pos, rx1137_off
    ord $I11, rx1137_tgt, $I11
    ne $I11, 126, rx1137_fail
    add rx1137_pos, 1
    set_addr $I10, rxcap_1142_fail
    ($I12, $I11) = rx1137_cur."!mark_peek"($I10)
    rx1137_cur."!cursor_pos"($I11)
    ($P10) = rx1137_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1137_pos, "")
    rx1137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1142_done
  rxcap_1142_fail:
    goto rx1137_fail
  rxcap_1142_done:
  # rx subrule "O" subtype=capture negate=
    rx1137_cur."!cursor_pos"(rx1137_pos)
    $P10 = rx1137_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1137_fail
    rx1137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1137_pos = $P10."pos"()
  # rx pass
    rx1137_cur."!cursor_pass"(rx1137_pos, "infix:sym<~>")
    if_null rx1137_debug, debug_909
    rx1137_cur."!cursor_debug"("PASS", "infix:sym<~>", " at pos=", rx1137_pos)
  debug_909:
    .return (rx1137_cur)
  rx1137_restart:
.annotate 'line', 447
    if_null rx1137_debug, debug_910
    rx1137_cur."!cursor_debug"("NEXT", "infix:sym<~>")
  debug_910:
  rx1137_fail:
    (rx1137_rep, rx1137_pos, $I10, $P10) = rx1137_cur."!mark_fail"(0)
    lt rx1137_pos, -1, rx1137_done
    eq rx1137_pos, -1, rx1137_fail
    jump $I10
  rx1137_done:
    rx1137_cur."!cursor_fail"()
    if_null rx1137_debug, debug_911
    rx1137_cur."!cursor_debug"("FAIL", "infix:sym<~>")
  debug_911:
    .return (rx1137_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("293_1283874336.57842") :method
.annotate 'line', 447
    $P1139 = self."!PREFIX__!subrule"("O", "~")
    new $P1140, "ResizablePMCArray"
    push $P1140, $P1139
    .return ($P1140)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("294_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1144_tgt
    .local int rx1144_pos
    .local int rx1144_off
    .local int rx1144_eos
    .local int rx1144_rep
    .local pmc rx1144_cur
    .local pmc rx1144_debug
    (rx1144_cur, rx1144_pos, rx1144_tgt, $I10) = self."!cursor_start"()
    getattribute rx1144_debug, rx1144_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1144_cur
    .local pmc match
    .lex "$/", match
    length rx1144_eos, rx1144_tgt
    gt rx1144_pos, rx1144_eos, rx1144_done
    set rx1144_off, 0
    lt rx1144_pos, 2, rx1144_start
    sub rx1144_off, rx1144_pos, 1
    substr rx1144_tgt, rx1144_tgt, rx1144_off
  rx1144_start:
    eq $I10, 1, rx1144_restart
    if_null rx1144_debug, debug_912
    rx1144_cur."!cursor_debug"("START", "infix:sym<==>")
  debug_912:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1148_done
    goto rxscan1148_scan
  rxscan1148_loop:
    ($P10) = rx1144_cur."from"()
    inc $P10
    set rx1144_pos, $P10
    ge rx1144_pos, rx1144_eos, rxscan1148_done
  rxscan1148_scan:
    set_addr $I10, rxscan1148_loop
    rx1144_cur."!mark_push"(0, rx1144_pos, $I10)
  rxscan1148_done:
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1149_fail
    rx1144_cur."!mark_push"(0, rx1144_pos, $I10)
  # rx literal  "=="
    add $I11, rx1144_pos, 2
    gt $I11, rx1144_eos, rx1144_fail
    sub $I11, rx1144_pos, rx1144_off
    substr $S10, rx1144_tgt, $I11, 2
    ne $S10, "==", rx1144_fail
    add rx1144_pos, 2
    set_addr $I10, rxcap_1149_fail
    ($I12, $I11) = rx1144_cur."!mark_peek"($I10)
    rx1144_cur."!cursor_pos"($I11)
    ($P10) = rx1144_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1144_pos, "")
    rx1144_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1149_done
  rxcap_1149_fail:
    goto rx1144_fail
  rxcap_1149_done:
  # rx subrule "O" subtype=capture negate=
    rx1144_cur."!cursor_pos"(rx1144_pos)
    $P10 = rx1144_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1144_fail
    rx1144_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1144_pos = $P10."pos"()
  # rx pass
    rx1144_cur."!cursor_pass"(rx1144_pos, "infix:sym<==>")
    if_null rx1144_debug, debug_913
    rx1144_cur."!cursor_debug"("PASS", "infix:sym<==>", " at pos=", rx1144_pos)
  debug_913:
    .return (rx1144_cur)
  rx1144_restart:
.annotate 'line', 447
    if_null rx1144_debug, debug_914
    rx1144_cur."!cursor_debug"("NEXT", "infix:sym<==>")
  debug_914:
  rx1144_fail:
    (rx1144_rep, rx1144_pos, $I10, $P10) = rx1144_cur."!mark_fail"(0)
    lt rx1144_pos, -1, rx1144_done
    eq rx1144_pos, -1, rx1144_fail
    jump $I10
  rx1144_done:
    rx1144_cur."!cursor_fail"()
    if_null rx1144_debug, debug_915
    rx1144_cur."!cursor_debug"("FAIL", "infix:sym<==>")
  debug_915:
    .return (rx1144_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("295_1283874336.57842") :method
.annotate 'line', 447
    $P1146 = self."!PREFIX__!subrule"("O", "==")
    new $P1147, "ResizablePMCArray"
    push $P1147, $P1146
    .return ($P1147)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("296_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1151_tgt
    .local int rx1151_pos
    .local int rx1151_off
    .local int rx1151_eos
    .local int rx1151_rep
    .local pmc rx1151_cur
    .local pmc rx1151_debug
    (rx1151_cur, rx1151_pos, rx1151_tgt, $I10) = self."!cursor_start"()
    getattribute rx1151_debug, rx1151_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1151_cur
    .local pmc match
    .lex "$/", match
    length rx1151_eos, rx1151_tgt
    gt rx1151_pos, rx1151_eos, rx1151_done
    set rx1151_off, 0
    lt rx1151_pos, 2, rx1151_start
    sub rx1151_off, rx1151_pos, 1
    substr rx1151_tgt, rx1151_tgt, rx1151_off
  rx1151_start:
    eq $I10, 1, rx1151_restart
    if_null rx1151_debug, debug_916
    rx1151_cur."!cursor_debug"("START", "infix:sym<!=>")
  debug_916:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1155_done
    goto rxscan1155_scan
  rxscan1155_loop:
    ($P10) = rx1151_cur."from"()
    inc $P10
    set rx1151_pos, $P10
    ge rx1151_pos, rx1151_eos, rxscan1155_done
  rxscan1155_scan:
    set_addr $I10, rxscan1155_loop
    rx1151_cur."!mark_push"(0, rx1151_pos, $I10)
  rxscan1155_done:
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1156_fail
    rx1151_cur."!mark_push"(0, rx1151_pos, $I10)
  # rx literal  "!="
    add $I11, rx1151_pos, 2
    gt $I11, rx1151_eos, rx1151_fail
    sub $I11, rx1151_pos, rx1151_off
    substr $S10, rx1151_tgt, $I11, 2
    ne $S10, "!=", rx1151_fail
    add rx1151_pos, 2
    set_addr $I10, rxcap_1156_fail
    ($I12, $I11) = rx1151_cur."!mark_peek"($I10)
    rx1151_cur."!cursor_pos"($I11)
    ($P10) = rx1151_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1151_pos, "")
    rx1151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1156_done
  rxcap_1156_fail:
    goto rx1151_fail
  rxcap_1156_done:
  # rx subrule "O" subtype=capture negate=
    rx1151_cur."!cursor_pos"(rx1151_pos)
    $P10 = rx1151_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1151_fail
    rx1151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1151_pos = $P10."pos"()
  # rx pass
    rx1151_cur."!cursor_pass"(rx1151_pos, "infix:sym<!=>")
    if_null rx1151_debug, debug_917
    rx1151_cur."!cursor_debug"("PASS", "infix:sym<!=>", " at pos=", rx1151_pos)
  debug_917:
    .return (rx1151_cur)
  rx1151_restart:
.annotate 'line', 447
    if_null rx1151_debug, debug_918
    rx1151_cur."!cursor_debug"("NEXT", "infix:sym<!=>")
  debug_918:
  rx1151_fail:
    (rx1151_rep, rx1151_pos, $I10, $P10) = rx1151_cur."!mark_fail"(0)
    lt rx1151_pos, -1, rx1151_done
    eq rx1151_pos, -1, rx1151_fail
    jump $I10
  rx1151_done:
    rx1151_cur."!cursor_fail"()
    if_null rx1151_debug, debug_919
    rx1151_cur."!cursor_debug"("FAIL", "infix:sym<!=>")
  debug_919:
    .return (rx1151_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("297_1283874336.57842") :method
.annotate 'line', 447
    $P1153 = self."!PREFIX__!subrule"("O", "!=")
    new $P1154, "ResizablePMCArray"
    push $P1154, $P1153
    .return ($P1154)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("298_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1158_tgt
    .local int rx1158_pos
    .local int rx1158_off
    .local int rx1158_eos
    .local int rx1158_rep
    .local pmc rx1158_cur
    .local pmc rx1158_debug
    (rx1158_cur, rx1158_pos, rx1158_tgt, $I10) = self."!cursor_start"()
    getattribute rx1158_debug, rx1158_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1158_cur
    .local pmc match
    .lex "$/", match
    length rx1158_eos, rx1158_tgt
    gt rx1158_pos, rx1158_eos, rx1158_done
    set rx1158_off, 0
    lt rx1158_pos, 2, rx1158_start
    sub rx1158_off, rx1158_pos, 1
    substr rx1158_tgt, rx1158_tgt, rx1158_off
  rx1158_start:
    eq $I10, 1, rx1158_restart
    if_null rx1158_debug, debug_920
    rx1158_cur."!cursor_debug"("START", "infix:sym<<=>")
  debug_920:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1162_done
    goto rxscan1162_scan
  rxscan1162_loop:
    ($P10) = rx1158_cur."from"()
    inc $P10
    set rx1158_pos, $P10
    ge rx1158_pos, rx1158_eos, rxscan1162_done
  rxscan1162_scan:
    set_addr $I10, rxscan1162_loop
    rx1158_cur."!mark_push"(0, rx1158_pos, $I10)
  rxscan1162_done:
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1163_fail
    rx1158_cur."!mark_push"(0, rx1158_pos, $I10)
  # rx literal  "<="
    add $I11, rx1158_pos, 2
    gt $I11, rx1158_eos, rx1158_fail
    sub $I11, rx1158_pos, rx1158_off
    substr $S10, rx1158_tgt, $I11, 2
    ne $S10, "<=", rx1158_fail
    add rx1158_pos, 2
    set_addr $I10, rxcap_1163_fail
    ($I12, $I11) = rx1158_cur."!mark_peek"($I10)
    rx1158_cur."!cursor_pos"($I11)
    ($P10) = rx1158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1158_pos, "")
    rx1158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1163_done
  rxcap_1163_fail:
    goto rx1158_fail
  rxcap_1163_done:
  # rx subrule "O" subtype=capture negate=
    rx1158_cur."!cursor_pos"(rx1158_pos)
    $P10 = rx1158_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1158_fail
    rx1158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1158_pos = $P10."pos"()
  # rx pass
    rx1158_cur."!cursor_pass"(rx1158_pos, "infix:sym<<=>")
    if_null rx1158_debug, debug_921
    rx1158_cur."!cursor_debug"("PASS", "infix:sym<<=>", " at pos=", rx1158_pos)
  debug_921:
    .return (rx1158_cur)
  rx1158_restart:
.annotate 'line', 447
    if_null rx1158_debug, debug_922
    rx1158_cur."!cursor_debug"("NEXT", "infix:sym<<=>")
  debug_922:
  rx1158_fail:
    (rx1158_rep, rx1158_pos, $I10, $P10) = rx1158_cur."!mark_fail"(0)
    lt rx1158_pos, -1, rx1158_done
    eq rx1158_pos, -1, rx1158_fail
    jump $I10
  rx1158_done:
    rx1158_cur."!cursor_fail"()
    if_null rx1158_debug, debug_923
    rx1158_cur."!cursor_debug"("FAIL", "infix:sym<<=>")
  debug_923:
    .return (rx1158_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("299_1283874336.57842") :method
.annotate 'line', 447
    $P1160 = self."!PREFIX__!subrule"("O", "<=")
    new $P1161, "ResizablePMCArray"
    push $P1161, $P1160
    .return ($P1161)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("300_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1165_tgt
    .local int rx1165_pos
    .local int rx1165_off
    .local int rx1165_eos
    .local int rx1165_rep
    .local pmc rx1165_cur
    .local pmc rx1165_debug
    (rx1165_cur, rx1165_pos, rx1165_tgt, $I10) = self."!cursor_start"()
    getattribute rx1165_debug, rx1165_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1165_cur
    .local pmc match
    .lex "$/", match
    length rx1165_eos, rx1165_tgt
    gt rx1165_pos, rx1165_eos, rx1165_done
    set rx1165_off, 0
    lt rx1165_pos, 2, rx1165_start
    sub rx1165_off, rx1165_pos, 1
    substr rx1165_tgt, rx1165_tgt, rx1165_off
  rx1165_start:
    eq $I10, 1, rx1165_restart
    if_null rx1165_debug, debug_924
    rx1165_cur."!cursor_debug"("START", "infix:sym<>=>")
  debug_924:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1169_done
    goto rxscan1169_scan
  rxscan1169_loop:
    ($P10) = rx1165_cur."from"()
    inc $P10
    set rx1165_pos, $P10
    ge rx1165_pos, rx1165_eos, rxscan1169_done
  rxscan1169_scan:
    set_addr $I10, rxscan1169_loop
    rx1165_cur."!mark_push"(0, rx1165_pos, $I10)
  rxscan1169_done:
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1170_fail
    rx1165_cur."!mark_push"(0, rx1165_pos, $I10)
  # rx literal  ">="
    add $I11, rx1165_pos, 2
    gt $I11, rx1165_eos, rx1165_fail
    sub $I11, rx1165_pos, rx1165_off
    substr $S10, rx1165_tgt, $I11, 2
    ne $S10, ">=", rx1165_fail
    add rx1165_pos, 2
    set_addr $I10, rxcap_1170_fail
    ($I12, $I11) = rx1165_cur."!mark_peek"($I10)
    rx1165_cur."!cursor_pos"($I11)
    ($P10) = rx1165_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1165_pos, "")
    rx1165_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1170_done
  rxcap_1170_fail:
    goto rx1165_fail
  rxcap_1170_done:
  # rx subrule "O" subtype=capture negate=
    rx1165_cur."!cursor_pos"(rx1165_pos)
    $P10 = rx1165_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1165_fail
    rx1165_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1165_pos = $P10."pos"()
  # rx pass
    rx1165_cur."!cursor_pass"(rx1165_pos, "infix:sym<>=>")
    if_null rx1165_debug, debug_925
    rx1165_cur."!cursor_debug"("PASS", "infix:sym<>=>", " at pos=", rx1165_pos)
  debug_925:
    .return (rx1165_cur)
  rx1165_restart:
.annotate 'line', 447
    if_null rx1165_debug, debug_926
    rx1165_cur."!cursor_debug"("NEXT", "infix:sym<>=>")
  debug_926:
  rx1165_fail:
    (rx1165_rep, rx1165_pos, $I10, $P10) = rx1165_cur."!mark_fail"(0)
    lt rx1165_pos, -1, rx1165_done
    eq rx1165_pos, -1, rx1165_fail
    jump $I10
  rx1165_done:
    rx1165_cur."!cursor_fail"()
    if_null rx1165_debug, debug_927
    rx1165_cur."!cursor_debug"("FAIL", "infix:sym<>=>")
  debug_927:
    .return (rx1165_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("301_1283874336.57842") :method
.annotate 'line', 447
    $P1167 = self."!PREFIX__!subrule"("O", ">=")
    new $P1168, "ResizablePMCArray"
    push $P1168, $P1167
    .return ($P1168)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("302_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    .local pmc rx1172_debug
    (rx1172_cur, rx1172_pos, rx1172_tgt, $I10) = self."!cursor_start"()
    getattribute rx1172_debug, rx1172_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1172_cur
    .local pmc match
    .lex "$/", match
    length rx1172_eos, rx1172_tgt
    gt rx1172_pos, rx1172_eos, rx1172_done
    set rx1172_off, 0
    lt rx1172_pos, 2, rx1172_start
    sub rx1172_off, rx1172_pos, 1
    substr rx1172_tgt, rx1172_tgt, rx1172_off
  rx1172_start:
    eq $I10, 1, rx1172_restart
    if_null rx1172_debug, debug_928
    rx1172_cur."!cursor_debug"("START", "infix:sym<<>")
  debug_928:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1176_done
    goto rxscan1176_scan
  rxscan1176_loop:
    ($P10) = rx1172_cur."from"()
    inc $P10
    set rx1172_pos, $P10
    ge rx1172_pos, rx1172_eos, rxscan1176_done
  rxscan1176_scan:
    set_addr $I10, rxscan1176_loop
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  rxscan1176_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1177_fail
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  # rx literal  "<"
    add $I11, rx1172_pos, 1
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    ord $I11, rx1172_tgt, $I11
    ne $I11, 60, rx1172_fail
    add rx1172_pos, 1
    set_addr $I10, rxcap_1177_fail
    ($I12, $I11) = rx1172_cur."!mark_peek"($I10)
    rx1172_cur."!cursor_pos"($I11)
    ($P10) = rx1172_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1172_pos, "")
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1177_done
  rxcap_1177_fail:
    goto rx1172_fail
  rxcap_1177_done:
  # rx subrule "O" subtype=capture negate=
    rx1172_cur."!cursor_pos"(rx1172_pos)
    $P10 = rx1172_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1172_fail
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1172_pos = $P10."pos"()
  # rx pass
    rx1172_cur."!cursor_pass"(rx1172_pos, "infix:sym<<>")
    if_null rx1172_debug, debug_929
    rx1172_cur."!cursor_debug"("PASS", "infix:sym<<>", " at pos=", rx1172_pos)
  debug_929:
    .return (rx1172_cur)
  rx1172_restart:
.annotate 'line', 447
    if_null rx1172_debug, debug_930
    rx1172_cur."!cursor_debug"("NEXT", "infix:sym<<>")
  debug_930:
  rx1172_fail:
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    if_null rx1172_debug, debug_931
    rx1172_cur."!cursor_debug"("FAIL", "infix:sym<<>")
  debug_931:
    .return (rx1172_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("303_1283874336.57842") :method
.annotate 'line', 447
    $P1174 = self."!PREFIX__!subrule"("O", "<")
    new $P1175, "ResizablePMCArray"
    push $P1175, $P1174
    .return ($P1175)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("304_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1179_tgt
    .local int rx1179_pos
    .local int rx1179_off
    .local int rx1179_eos
    .local int rx1179_rep
    .local pmc rx1179_cur
    .local pmc rx1179_debug
    (rx1179_cur, rx1179_pos, rx1179_tgt, $I10) = self."!cursor_start"()
    getattribute rx1179_debug, rx1179_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1179_cur
    .local pmc match
    .lex "$/", match
    length rx1179_eos, rx1179_tgt
    gt rx1179_pos, rx1179_eos, rx1179_done
    set rx1179_off, 0
    lt rx1179_pos, 2, rx1179_start
    sub rx1179_off, rx1179_pos, 1
    substr rx1179_tgt, rx1179_tgt, rx1179_off
  rx1179_start:
    eq $I10, 1, rx1179_restart
    if_null rx1179_debug, debug_932
    rx1179_cur."!cursor_debug"("START", "infix:sym<>>")
  debug_932:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1183_done
    goto rxscan1183_scan
  rxscan1183_loop:
    ($P10) = rx1179_cur."from"()
    inc $P10
    set rx1179_pos, $P10
    ge rx1179_pos, rx1179_eos, rxscan1183_done
  rxscan1183_scan:
    set_addr $I10, rxscan1183_loop
    rx1179_cur."!mark_push"(0, rx1179_pos, $I10)
  rxscan1183_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1184_fail
    rx1179_cur."!mark_push"(0, rx1179_pos, $I10)
  # rx literal  ">"
    add $I11, rx1179_pos, 1
    gt $I11, rx1179_eos, rx1179_fail
    sub $I11, rx1179_pos, rx1179_off
    ord $I11, rx1179_tgt, $I11
    ne $I11, 62, rx1179_fail
    add rx1179_pos, 1
    set_addr $I10, rxcap_1184_fail
    ($I12, $I11) = rx1179_cur."!mark_peek"($I10)
    rx1179_cur."!cursor_pos"($I11)
    ($P10) = rx1179_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1179_pos, "")
    rx1179_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1184_done
  rxcap_1184_fail:
    goto rx1179_fail
  rxcap_1184_done:
  # rx subrule "O" subtype=capture negate=
    rx1179_cur."!cursor_pos"(rx1179_pos)
    $P10 = rx1179_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1179_fail
    rx1179_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1179_pos = $P10."pos"()
  # rx pass
    rx1179_cur."!cursor_pass"(rx1179_pos, "infix:sym<>>")
    if_null rx1179_debug, debug_933
    rx1179_cur."!cursor_debug"("PASS", "infix:sym<>>", " at pos=", rx1179_pos)
  debug_933:
    .return (rx1179_cur)
  rx1179_restart:
.annotate 'line', 447
    if_null rx1179_debug, debug_934
    rx1179_cur."!cursor_debug"("NEXT", "infix:sym<>>")
  debug_934:
  rx1179_fail:
    (rx1179_rep, rx1179_pos, $I10, $P10) = rx1179_cur."!mark_fail"(0)
    lt rx1179_pos, -1, rx1179_done
    eq rx1179_pos, -1, rx1179_fail
    jump $I10
  rx1179_done:
    rx1179_cur."!cursor_fail"()
    if_null rx1179_debug, debug_935
    rx1179_cur."!cursor_debug"("FAIL", "infix:sym<>>")
  debug_935:
    .return (rx1179_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("305_1283874336.57842") :method
.annotate 'line', 447
    $P1181 = self."!PREFIX__!subrule"("O", ">")
    new $P1182, "ResizablePMCArray"
    push $P1182, $P1181
    .return ($P1182)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("306_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1186_tgt
    .local int rx1186_pos
    .local int rx1186_off
    .local int rx1186_eos
    .local int rx1186_rep
    .local pmc rx1186_cur
    .local pmc rx1186_debug
    (rx1186_cur, rx1186_pos, rx1186_tgt, $I10) = self."!cursor_start"()
    getattribute rx1186_debug, rx1186_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1186_cur
    .local pmc match
    .lex "$/", match
    length rx1186_eos, rx1186_tgt
    gt rx1186_pos, rx1186_eos, rx1186_done
    set rx1186_off, 0
    lt rx1186_pos, 2, rx1186_start
    sub rx1186_off, rx1186_pos, 1
    substr rx1186_tgt, rx1186_tgt, rx1186_off
  rx1186_start:
    eq $I10, 1, rx1186_restart
    if_null rx1186_debug, debug_936
    rx1186_cur."!cursor_debug"("START", "infix:sym<eq>")
  debug_936:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1190_done
    goto rxscan1190_scan
  rxscan1190_loop:
    ($P10) = rx1186_cur."from"()
    inc $P10
    set rx1186_pos, $P10
    ge rx1186_pos, rx1186_eos, rxscan1190_done
  rxscan1190_scan:
    set_addr $I10, rxscan1190_loop
    rx1186_cur."!mark_push"(0, rx1186_pos, $I10)
  rxscan1190_done:
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1191_fail
    rx1186_cur."!mark_push"(0, rx1186_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1186_pos, 2
    gt $I11, rx1186_eos, rx1186_fail
    sub $I11, rx1186_pos, rx1186_off
    substr $S10, rx1186_tgt, $I11, 2
    ne $S10, "eq", rx1186_fail
    add rx1186_pos, 2
    set_addr $I10, rxcap_1191_fail
    ($I12, $I11) = rx1186_cur."!mark_peek"($I10)
    rx1186_cur."!cursor_pos"($I11)
    ($P10) = rx1186_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1186_pos, "")
    rx1186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1191_done
  rxcap_1191_fail:
    goto rx1186_fail
  rxcap_1191_done:
  # rx subrule "O" subtype=capture negate=
    rx1186_cur."!cursor_pos"(rx1186_pos)
    $P10 = rx1186_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1186_fail
    rx1186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1186_pos = $P10."pos"()
  # rx pass
    rx1186_cur."!cursor_pass"(rx1186_pos, "infix:sym<eq>")
    if_null rx1186_debug, debug_937
    rx1186_cur."!cursor_debug"("PASS", "infix:sym<eq>", " at pos=", rx1186_pos)
  debug_937:
    .return (rx1186_cur)
  rx1186_restart:
.annotate 'line', 447
    if_null rx1186_debug, debug_938
    rx1186_cur."!cursor_debug"("NEXT", "infix:sym<eq>")
  debug_938:
  rx1186_fail:
    (rx1186_rep, rx1186_pos, $I10, $P10) = rx1186_cur."!mark_fail"(0)
    lt rx1186_pos, -1, rx1186_done
    eq rx1186_pos, -1, rx1186_fail
    jump $I10
  rx1186_done:
    rx1186_cur."!cursor_fail"()
    if_null rx1186_debug, debug_939
    rx1186_cur."!cursor_debug"("FAIL", "infix:sym<eq>")
  debug_939:
    .return (rx1186_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("307_1283874336.57842") :method
.annotate 'line', 447
    $P1188 = self."!PREFIX__!subrule"("O", "eq")
    new $P1189, "ResizablePMCArray"
    push $P1189, $P1188
    .return ($P1189)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("308_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1193_tgt
    .local int rx1193_pos
    .local int rx1193_off
    .local int rx1193_eos
    .local int rx1193_rep
    .local pmc rx1193_cur
    .local pmc rx1193_debug
    (rx1193_cur, rx1193_pos, rx1193_tgt, $I10) = self."!cursor_start"()
    getattribute rx1193_debug, rx1193_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1193_cur
    .local pmc match
    .lex "$/", match
    length rx1193_eos, rx1193_tgt
    gt rx1193_pos, rx1193_eos, rx1193_done
    set rx1193_off, 0
    lt rx1193_pos, 2, rx1193_start
    sub rx1193_off, rx1193_pos, 1
    substr rx1193_tgt, rx1193_tgt, rx1193_off
  rx1193_start:
    eq $I10, 1, rx1193_restart
    if_null rx1193_debug, debug_940
    rx1193_cur."!cursor_debug"("START", "infix:sym<ne>")
  debug_940:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1197_done
    goto rxscan1197_scan
  rxscan1197_loop:
    ($P10) = rx1193_cur."from"()
    inc $P10
    set rx1193_pos, $P10
    ge rx1193_pos, rx1193_eos, rxscan1197_done
  rxscan1197_scan:
    set_addr $I10, rxscan1197_loop
    rx1193_cur."!mark_push"(0, rx1193_pos, $I10)
  rxscan1197_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1198_fail
    rx1193_cur."!mark_push"(0, rx1193_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1193_pos, 2
    gt $I11, rx1193_eos, rx1193_fail
    sub $I11, rx1193_pos, rx1193_off
    substr $S10, rx1193_tgt, $I11, 2
    ne $S10, "ne", rx1193_fail
    add rx1193_pos, 2
    set_addr $I10, rxcap_1198_fail
    ($I12, $I11) = rx1193_cur."!mark_peek"($I10)
    rx1193_cur."!cursor_pos"($I11)
    ($P10) = rx1193_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1193_pos, "")
    rx1193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1198_done
  rxcap_1198_fail:
    goto rx1193_fail
  rxcap_1198_done:
  # rx subrule "O" subtype=capture negate=
    rx1193_cur."!cursor_pos"(rx1193_pos)
    $P10 = rx1193_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1193_fail
    rx1193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1193_pos = $P10."pos"()
  # rx pass
    rx1193_cur."!cursor_pass"(rx1193_pos, "infix:sym<ne>")
    if_null rx1193_debug, debug_941
    rx1193_cur."!cursor_debug"("PASS", "infix:sym<ne>", " at pos=", rx1193_pos)
  debug_941:
    .return (rx1193_cur)
  rx1193_restart:
.annotate 'line', 447
    if_null rx1193_debug, debug_942
    rx1193_cur."!cursor_debug"("NEXT", "infix:sym<ne>")
  debug_942:
  rx1193_fail:
    (rx1193_rep, rx1193_pos, $I10, $P10) = rx1193_cur."!mark_fail"(0)
    lt rx1193_pos, -1, rx1193_done
    eq rx1193_pos, -1, rx1193_fail
    jump $I10
  rx1193_done:
    rx1193_cur."!cursor_fail"()
    if_null rx1193_debug, debug_943
    rx1193_cur."!cursor_debug"("FAIL", "infix:sym<ne>")
  debug_943:
    .return (rx1193_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("309_1283874336.57842") :method
.annotate 'line', 447
    $P1195 = self."!PREFIX__!subrule"("O", "ne")
    new $P1196, "ResizablePMCArray"
    push $P1196, $P1195
    .return ($P1196)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("310_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1200_tgt
    .local int rx1200_pos
    .local int rx1200_off
    .local int rx1200_eos
    .local int rx1200_rep
    .local pmc rx1200_cur
    .local pmc rx1200_debug
    (rx1200_cur, rx1200_pos, rx1200_tgt, $I10) = self."!cursor_start"()
    getattribute rx1200_debug, rx1200_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1200_cur
    .local pmc match
    .lex "$/", match
    length rx1200_eos, rx1200_tgt
    gt rx1200_pos, rx1200_eos, rx1200_done
    set rx1200_off, 0
    lt rx1200_pos, 2, rx1200_start
    sub rx1200_off, rx1200_pos, 1
    substr rx1200_tgt, rx1200_tgt, rx1200_off
  rx1200_start:
    eq $I10, 1, rx1200_restart
    if_null rx1200_debug, debug_944
    rx1200_cur."!cursor_debug"("START", "infix:sym<le>")
  debug_944:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1204_done
    goto rxscan1204_scan
  rxscan1204_loop:
    ($P10) = rx1200_cur."from"()
    inc $P10
    set rx1200_pos, $P10
    ge rx1200_pos, rx1200_eos, rxscan1204_done
  rxscan1204_scan:
    set_addr $I10, rxscan1204_loop
    rx1200_cur."!mark_push"(0, rx1200_pos, $I10)
  rxscan1204_done:
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1205_fail
    rx1200_cur."!mark_push"(0, rx1200_pos, $I10)
  # rx literal  "le"
    add $I11, rx1200_pos, 2
    gt $I11, rx1200_eos, rx1200_fail
    sub $I11, rx1200_pos, rx1200_off
    substr $S10, rx1200_tgt, $I11, 2
    ne $S10, "le", rx1200_fail
    add rx1200_pos, 2
    set_addr $I10, rxcap_1205_fail
    ($I12, $I11) = rx1200_cur."!mark_peek"($I10)
    rx1200_cur."!cursor_pos"($I11)
    ($P10) = rx1200_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1200_pos, "")
    rx1200_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1205_done
  rxcap_1205_fail:
    goto rx1200_fail
  rxcap_1205_done:
  # rx subrule "O" subtype=capture negate=
    rx1200_cur."!cursor_pos"(rx1200_pos)
    $P10 = rx1200_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1200_fail
    rx1200_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1200_pos = $P10."pos"()
  # rx pass
    rx1200_cur."!cursor_pass"(rx1200_pos, "infix:sym<le>")
    if_null rx1200_debug, debug_945
    rx1200_cur."!cursor_debug"("PASS", "infix:sym<le>", " at pos=", rx1200_pos)
  debug_945:
    .return (rx1200_cur)
  rx1200_restart:
.annotate 'line', 447
    if_null rx1200_debug, debug_946
    rx1200_cur."!cursor_debug"("NEXT", "infix:sym<le>")
  debug_946:
  rx1200_fail:
    (rx1200_rep, rx1200_pos, $I10, $P10) = rx1200_cur."!mark_fail"(0)
    lt rx1200_pos, -1, rx1200_done
    eq rx1200_pos, -1, rx1200_fail
    jump $I10
  rx1200_done:
    rx1200_cur."!cursor_fail"()
    if_null rx1200_debug, debug_947
    rx1200_cur."!cursor_debug"("FAIL", "infix:sym<le>")
  debug_947:
    .return (rx1200_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("311_1283874336.57842") :method
.annotate 'line', 447
    $P1202 = self."!PREFIX__!subrule"("O", "le")
    new $P1203, "ResizablePMCArray"
    push $P1203, $P1202
    .return ($P1203)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("312_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    .local pmc rx1207_debug
    (rx1207_cur, rx1207_pos, rx1207_tgt, $I10) = self."!cursor_start"()
    getattribute rx1207_debug, rx1207_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1207_cur
    .local pmc match
    .lex "$/", match
    length rx1207_eos, rx1207_tgt
    gt rx1207_pos, rx1207_eos, rx1207_done
    set rx1207_off, 0
    lt rx1207_pos, 2, rx1207_start
    sub rx1207_off, rx1207_pos, 1
    substr rx1207_tgt, rx1207_tgt, rx1207_off
  rx1207_start:
    eq $I10, 1, rx1207_restart
    if_null rx1207_debug, debug_948
    rx1207_cur."!cursor_debug"("START", "infix:sym<ge>")
  debug_948:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1211_done
    goto rxscan1211_scan
  rxscan1211_loop:
    ($P10) = rx1207_cur."from"()
    inc $P10
    set rx1207_pos, $P10
    ge rx1207_pos, rx1207_eos, rxscan1211_done
  rxscan1211_scan:
    set_addr $I10, rxscan1211_loop
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  rxscan1211_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1212_fail
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1207_pos, 2
    gt $I11, rx1207_eos, rx1207_fail
    sub $I11, rx1207_pos, rx1207_off
    substr $S10, rx1207_tgt, $I11, 2
    ne $S10, "ge", rx1207_fail
    add rx1207_pos, 2
    set_addr $I10, rxcap_1212_fail
    ($I12, $I11) = rx1207_cur."!mark_peek"($I10)
    rx1207_cur."!cursor_pos"($I11)
    ($P10) = rx1207_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1207_pos, "")
    rx1207_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1212_done
  rxcap_1212_fail:
    goto rx1207_fail
  rxcap_1212_done:
  # rx subrule "O" subtype=capture negate=
    rx1207_cur."!cursor_pos"(rx1207_pos)
    $P10 = rx1207_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1207_fail
    rx1207_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1207_pos = $P10."pos"()
  # rx pass
    rx1207_cur."!cursor_pass"(rx1207_pos, "infix:sym<ge>")
    if_null rx1207_debug, debug_949
    rx1207_cur."!cursor_debug"("PASS", "infix:sym<ge>", " at pos=", rx1207_pos)
  debug_949:
    .return (rx1207_cur)
  rx1207_restart:
.annotate 'line', 447
    if_null rx1207_debug, debug_950
    rx1207_cur."!cursor_debug"("NEXT", "infix:sym<ge>")
  debug_950:
  rx1207_fail:
    (rx1207_rep, rx1207_pos, $I10, $P10) = rx1207_cur."!mark_fail"(0)
    lt rx1207_pos, -1, rx1207_done
    eq rx1207_pos, -1, rx1207_fail
    jump $I10
  rx1207_done:
    rx1207_cur."!cursor_fail"()
    if_null rx1207_debug, debug_951
    rx1207_cur."!cursor_debug"("FAIL", "infix:sym<ge>")
  debug_951:
    .return (rx1207_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("313_1283874336.57842") :method
.annotate 'line', 447
    $P1209 = self."!PREFIX__!subrule"("O", "ge")
    new $P1210, "ResizablePMCArray"
    push $P1210, $P1209
    .return ($P1210)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("314_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1214_tgt
    .local int rx1214_pos
    .local int rx1214_off
    .local int rx1214_eos
    .local int rx1214_rep
    .local pmc rx1214_cur
    .local pmc rx1214_debug
    (rx1214_cur, rx1214_pos, rx1214_tgt, $I10) = self."!cursor_start"()
    getattribute rx1214_debug, rx1214_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1214_cur
    .local pmc match
    .lex "$/", match
    length rx1214_eos, rx1214_tgt
    gt rx1214_pos, rx1214_eos, rx1214_done
    set rx1214_off, 0
    lt rx1214_pos, 2, rx1214_start
    sub rx1214_off, rx1214_pos, 1
    substr rx1214_tgt, rx1214_tgt, rx1214_off
  rx1214_start:
    eq $I10, 1, rx1214_restart
    if_null rx1214_debug, debug_952
    rx1214_cur."!cursor_debug"("START", "infix:sym<lt>")
  debug_952:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1218_done
    goto rxscan1218_scan
  rxscan1218_loop:
    ($P10) = rx1214_cur."from"()
    inc $P10
    set rx1214_pos, $P10
    ge rx1214_pos, rx1214_eos, rxscan1218_done
  rxscan1218_scan:
    set_addr $I10, rxscan1218_loop
    rx1214_cur."!mark_push"(0, rx1214_pos, $I10)
  rxscan1218_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1219_fail
    rx1214_cur."!mark_push"(0, rx1214_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1214_pos, 2
    gt $I11, rx1214_eos, rx1214_fail
    sub $I11, rx1214_pos, rx1214_off
    substr $S10, rx1214_tgt, $I11, 2
    ne $S10, "lt", rx1214_fail
    add rx1214_pos, 2
    set_addr $I10, rxcap_1219_fail
    ($I12, $I11) = rx1214_cur."!mark_peek"($I10)
    rx1214_cur."!cursor_pos"($I11)
    ($P10) = rx1214_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1214_pos, "")
    rx1214_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1219_done
  rxcap_1219_fail:
    goto rx1214_fail
  rxcap_1219_done:
  # rx subrule "O" subtype=capture negate=
    rx1214_cur."!cursor_pos"(rx1214_pos)
    $P10 = rx1214_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1214_fail
    rx1214_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1214_pos = $P10."pos"()
  # rx pass
    rx1214_cur."!cursor_pass"(rx1214_pos, "infix:sym<lt>")
    if_null rx1214_debug, debug_953
    rx1214_cur."!cursor_debug"("PASS", "infix:sym<lt>", " at pos=", rx1214_pos)
  debug_953:
    .return (rx1214_cur)
  rx1214_restart:
.annotate 'line', 447
    if_null rx1214_debug, debug_954
    rx1214_cur."!cursor_debug"("NEXT", "infix:sym<lt>")
  debug_954:
  rx1214_fail:
    (rx1214_rep, rx1214_pos, $I10, $P10) = rx1214_cur."!mark_fail"(0)
    lt rx1214_pos, -1, rx1214_done
    eq rx1214_pos, -1, rx1214_fail
    jump $I10
  rx1214_done:
    rx1214_cur."!cursor_fail"()
    if_null rx1214_debug, debug_955
    rx1214_cur."!cursor_debug"("FAIL", "infix:sym<lt>")
  debug_955:
    .return (rx1214_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("315_1283874336.57842") :method
.annotate 'line', 447
    $P1216 = self."!PREFIX__!subrule"("O", "lt")
    new $P1217, "ResizablePMCArray"
    push $P1217, $P1216
    .return ($P1217)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("316_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1221_tgt
    .local int rx1221_pos
    .local int rx1221_off
    .local int rx1221_eos
    .local int rx1221_rep
    .local pmc rx1221_cur
    .local pmc rx1221_debug
    (rx1221_cur, rx1221_pos, rx1221_tgt, $I10) = self."!cursor_start"()
    getattribute rx1221_debug, rx1221_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1221_cur
    .local pmc match
    .lex "$/", match
    length rx1221_eos, rx1221_tgt
    gt rx1221_pos, rx1221_eos, rx1221_done
    set rx1221_off, 0
    lt rx1221_pos, 2, rx1221_start
    sub rx1221_off, rx1221_pos, 1
    substr rx1221_tgt, rx1221_tgt, rx1221_off
  rx1221_start:
    eq $I10, 1, rx1221_restart
    if_null rx1221_debug, debug_956
    rx1221_cur."!cursor_debug"("START", "infix:sym<gt>")
  debug_956:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1225_done
    goto rxscan1225_scan
  rxscan1225_loop:
    ($P10) = rx1221_cur."from"()
    inc $P10
    set rx1221_pos, $P10
    ge rx1221_pos, rx1221_eos, rxscan1225_done
  rxscan1225_scan:
    set_addr $I10, rxscan1225_loop
    rx1221_cur."!mark_push"(0, rx1221_pos, $I10)
  rxscan1225_done:
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1226_fail
    rx1221_cur."!mark_push"(0, rx1221_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1221_pos, 2
    gt $I11, rx1221_eos, rx1221_fail
    sub $I11, rx1221_pos, rx1221_off
    substr $S10, rx1221_tgt, $I11, 2
    ne $S10, "gt", rx1221_fail
    add rx1221_pos, 2
    set_addr $I10, rxcap_1226_fail
    ($I12, $I11) = rx1221_cur."!mark_peek"($I10)
    rx1221_cur."!cursor_pos"($I11)
    ($P10) = rx1221_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1221_pos, "")
    rx1221_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1226_done
  rxcap_1226_fail:
    goto rx1221_fail
  rxcap_1226_done:
  # rx subrule "O" subtype=capture negate=
    rx1221_cur."!cursor_pos"(rx1221_pos)
    $P10 = rx1221_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1221_fail
    rx1221_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1221_pos = $P10."pos"()
  # rx pass
    rx1221_cur."!cursor_pass"(rx1221_pos, "infix:sym<gt>")
    if_null rx1221_debug, debug_957
    rx1221_cur."!cursor_debug"("PASS", "infix:sym<gt>", " at pos=", rx1221_pos)
  debug_957:
    .return (rx1221_cur)
  rx1221_restart:
.annotate 'line', 447
    if_null rx1221_debug, debug_958
    rx1221_cur."!cursor_debug"("NEXT", "infix:sym<gt>")
  debug_958:
  rx1221_fail:
    (rx1221_rep, rx1221_pos, $I10, $P10) = rx1221_cur."!mark_fail"(0)
    lt rx1221_pos, -1, rx1221_done
    eq rx1221_pos, -1, rx1221_fail
    jump $I10
  rx1221_done:
    rx1221_cur."!cursor_fail"()
    if_null rx1221_debug, debug_959
    rx1221_cur."!cursor_debug"("FAIL", "infix:sym<gt>")
  debug_959:
    .return (rx1221_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("317_1283874336.57842") :method
.annotate 'line', 447
    $P1223 = self."!PREFIX__!subrule"("O", "gt")
    new $P1224, "ResizablePMCArray"
    push $P1224, $P1223
    .return ($P1224)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("318_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1228_tgt
    .local int rx1228_pos
    .local int rx1228_off
    .local int rx1228_eos
    .local int rx1228_rep
    .local pmc rx1228_cur
    .local pmc rx1228_debug
    (rx1228_cur, rx1228_pos, rx1228_tgt, $I10) = self."!cursor_start"()
    getattribute rx1228_debug, rx1228_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1228_cur
    .local pmc match
    .lex "$/", match
    length rx1228_eos, rx1228_tgt
    gt rx1228_pos, rx1228_eos, rx1228_done
    set rx1228_off, 0
    lt rx1228_pos, 2, rx1228_start
    sub rx1228_off, rx1228_pos, 1
    substr rx1228_tgt, rx1228_tgt, rx1228_off
  rx1228_start:
    eq $I10, 1, rx1228_restart
    if_null rx1228_debug, debug_960
    rx1228_cur."!cursor_debug"("START", "infix:sym<=:=>")
  debug_960:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1232_done
    goto rxscan1232_scan
  rxscan1232_loop:
    ($P10) = rx1228_cur."from"()
    inc $P10
    set rx1228_pos, $P10
    ge rx1228_pos, rx1228_eos, rxscan1232_done
  rxscan1232_scan:
    set_addr $I10, rxscan1232_loop
    rx1228_cur."!mark_push"(0, rx1228_pos, $I10)
  rxscan1232_done:
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1233_fail
    rx1228_cur."!mark_push"(0, rx1228_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1228_pos, 3
    gt $I11, rx1228_eos, rx1228_fail
    sub $I11, rx1228_pos, rx1228_off
    substr $S10, rx1228_tgt, $I11, 3
    ne $S10, "=:=", rx1228_fail
    add rx1228_pos, 3
    set_addr $I10, rxcap_1233_fail
    ($I12, $I11) = rx1228_cur."!mark_peek"($I10)
    rx1228_cur."!cursor_pos"($I11)
    ($P10) = rx1228_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1228_pos, "")
    rx1228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1233_done
  rxcap_1233_fail:
    goto rx1228_fail
  rxcap_1233_done:
  # rx subrule "O" subtype=capture negate=
    rx1228_cur."!cursor_pos"(rx1228_pos)
    $P10 = rx1228_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1228_fail
    rx1228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1228_pos = $P10."pos"()
  # rx pass
    rx1228_cur."!cursor_pass"(rx1228_pos, "infix:sym<=:=>")
    if_null rx1228_debug, debug_961
    rx1228_cur."!cursor_debug"("PASS", "infix:sym<=:=>", " at pos=", rx1228_pos)
  debug_961:
    .return (rx1228_cur)
  rx1228_restart:
.annotate 'line', 447
    if_null rx1228_debug, debug_962
    rx1228_cur."!cursor_debug"("NEXT", "infix:sym<=:=>")
  debug_962:
  rx1228_fail:
    (rx1228_rep, rx1228_pos, $I10, $P10) = rx1228_cur."!mark_fail"(0)
    lt rx1228_pos, -1, rx1228_done
    eq rx1228_pos, -1, rx1228_fail
    jump $I10
  rx1228_done:
    rx1228_cur."!cursor_fail"()
    if_null rx1228_debug, debug_963
    rx1228_cur."!cursor_debug"("FAIL", "infix:sym<=:=>")
  debug_963:
    .return (rx1228_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("319_1283874336.57842") :method
.annotate 'line', 447
    $P1230 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1231, "ResizablePMCArray"
    push $P1231, $P1230
    .return ($P1231)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("320_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1235_tgt
    .local int rx1235_pos
    .local int rx1235_off
    .local int rx1235_eos
    .local int rx1235_rep
    .local pmc rx1235_cur
    .local pmc rx1235_debug
    (rx1235_cur, rx1235_pos, rx1235_tgt, $I10) = self."!cursor_start"()
    getattribute rx1235_debug, rx1235_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1235_cur
    .local pmc match
    .lex "$/", match
    length rx1235_eos, rx1235_tgt
    gt rx1235_pos, rx1235_eos, rx1235_done
    set rx1235_off, 0
    lt rx1235_pos, 2, rx1235_start
    sub rx1235_off, rx1235_pos, 1
    substr rx1235_tgt, rx1235_tgt, rx1235_off
  rx1235_start:
    eq $I10, 1, rx1235_restart
    if_null rx1235_debug, debug_964
    rx1235_cur."!cursor_debug"("START", "infix:sym<~~>")
  debug_964:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1239_done
    goto rxscan1239_scan
  rxscan1239_loop:
    ($P10) = rx1235_cur."from"()
    inc $P10
    set rx1235_pos, $P10
    ge rx1235_pos, rx1235_eos, rxscan1239_done
  rxscan1239_scan:
    set_addr $I10, rxscan1239_loop
    rx1235_cur."!mark_push"(0, rx1235_pos, $I10)
  rxscan1239_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1240_fail
    rx1235_cur."!mark_push"(0, rx1235_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1235_pos, 2
    gt $I11, rx1235_eos, rx1235_fail
    sub $I11, rx1235_pos, rx1235_off
    substr $S10, rx1235_tgt, $I11, 2
    ne $S10, "~~", rx1235_fail
    add rx1235_pos, 2
    set_addr $I10, rxcap_1240_fail
    ($I12, $I11) = rx1235_cur."!mark_peek"($I10)
    rx1235_cur."!cursor_pos"($I11)
    ($P10) = rx1235_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1235_pos, "")
    rx1235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1240_done
  rxcap_1240_fail:
    goto rx1235_fail
  rxcap_1240_done:
  # rx subrule "O" subtype=capture negate=
    rx1235_cur."!cursor_pos"(rx1235_pos)
    $P10 = rx1235_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1235_fail
    rx1235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1235_pos = $P10."pos"()
  # rx pass
    rx1235_cur."!cursor_pass"(rx1235_pos, "infix:sym<~~>")
    if_null rx1235_debug, debug_965
    rx1235_cur."!cursor_debug"("PASS", "infix:sym<~~>", " at pos=", rx1235_pos)
  debug_965:
    .return (rx1235_cur)
  rx1235_restart:
.annotate 'line', 447
    if_null rx1235_debug, debug_966
    rx1235_cur."!cursor_debug"("NEXT", "infix:sym<~~>")
  debug_966:
  rx1235_fail:
    (rx1235_rep, rx1235_pos, $I10, $P10) = rx1235_cur."!mark_fail"(0)
    lt rx1235_pos, -1, rx1235_done
    eq rx1235_pos, -1, rx1235_fail
    jump $I10
  rx1235_done:
    rx1235_cur."!cursor_fail"()
    if_null rx1235_debug, debug_967
    rx1235_cur."!cursor_debug"("FAIL", "infix:sym<~~>")
  debug_967:
    .return (rx1235_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("321_1283874336.57842") :method
.annotate 'line', 447
    $P1237 = self."!PREFIX__!subrule"("O", "~~")
    new $P1238, "ResizablePMCArray"
    push $P1238, $P1237
    .return ($P1238)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("322_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1242_tgt
    .local int rx1242_pos
    .local int rx1242_off
    .local int rx1242_eos
    .local int rx1242_rep
    .local pmc rx1242_cur
    .local pmc rx1242_debug
    (rx1242_cur, rx1242_pos, rx1242_tgt, $I10) = self."!cursor_start"()
    getattribute rx1242_debug, rx1242_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1242_cur
    .local pmc match
    .lex "$/", match
    length rx1242_eos, rx1242_tgt
    gt rx1242_pos, rx1242_eos, rx1242_done
    set rx1242_off, 0
    lt rx1242_pos, 2, rx1242_start
    sub rx1242_off, rx1242_pos, 1
    substr rx1242_tgt, rx1242_tgt, rx1242_off
  rx1242_start:
    eq $I10, 1, rx1242_restart
    if_null rx1242_debug, debug_968
    rx1242_cur."!cursor_debug"("START", "infix:sym<&&>")
  debug_968:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1246_done
    goto rxscan1246_scan
  rxscan1246_loop:
    ($P10) = rx1242_cur."from"()
    inc $P10
    set rx1242_pos, $P10
    ge rx1242_pos, rx1242_eos, rxscan1246_done
  rxscan1246_scan:
    set_addr $I10, rxscan1246_loop
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
  rxscan1246_done:
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1247_fail
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1242_pos, 2
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 2
    ne $S10, "&&", rx1242_fail
    add rx1242_pos, 2
    set_addr $I10, rxcap_1247_fail
    ($I12, $I11) = rx1242_cur."!mark_peek"($I10)
    rx1242_cur."!cursor_pos"($I11)
    ($P10) = rx1242_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1242_pos, "")
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1247_done
  rxcap_1247_fail:
    goto rx1242_fail
  rxcap_1247_done:
  # rx subrule "O" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1242_pos = $P10."pos"()
  # rx pass
    rx1242_cur."!cursor_pass"(rx1242_pos, "infix:sym<&&>")
    if_null rx1242_debug, debug_969
    rx1242_cur."!cursor_debug"("PASS", "infix:sym<&&>", " at pos=", rx1242_pos)
  debug_969:
    .return (rx1242_cur)
  rx1242_restart:
.annotate 'line', 447
    if_null rx1242_debug, debug_970
    rx1242_cur."!cursor_debug"("NEXT", "infix:sym<&&>")
  debug_970:
  rx1242_fail:
    (rx1242_rep, rx1242_pos, $I10, $P10) = rx1242_cur."!mark_fail"(0)
    lt rx1242_pos, -1, rx1242_done
    eq rx1242_pos, -1, rx1242_fail
    jump $I10
  rx1242_done:
    rx1242_cur."!cursor_fail"()
    if_null rx1242_debug, debug_971
    rx1242_cur."!cursor_debug"("FAIL", "infix:sym<&&>")
  debug_971:
    .return (rx1242_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("323_1283874336.57842") :method
.annotate 'line', 447
    $P1244 = self."!PREFIX__!subrule"("O", "&&")
    new $P1245, "ResizablePMCArray"
    push $P1245, $P1244
    .return ($P1245)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("324_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1249_tgt
    .local int rx1249_pos
    .local int rx1249_off
    .local int rx1249_eos
    .local int rx1249_rep
    .local pmc rx1249_cur
    .local pmc rx1249_debug
    (rx1249_cur, rx1249_pos, rx1249_tgt, $I10) = self."!cursor_start"()
    getattribute rx1249_debug, rx1249_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1249_cur
    .local pmc match
    .lex "$/", match
    length rx1249_eos, rx1249_tgt
    gt rx1249_pos, rx1249_eos, rx1249_done
    set rx1249_off, 0
    lt rx1249_pos, 2, rx1249_start
    sub rx1249_off, rx1249_pos, 1
    substr rx1249_tgt, rx1249_tgt, rx1249_off
  rx1249_start:
    eq $I10, 1, rx1249_restart
    if_null rx1249_debug, debug_972
    rx1249_cur."!cursor_debug"("START", "infix:sym<||>")
  debug_972:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1253_done
    goto rxscan1253_scan
  rxscan1253_loop:
    ($P10) = rx1249_cur."from"()
    inc $P10
    set rx1249_pos, $P10
    ge rx1249_pos, rx1249_eos, rxscan1253_done
  rxscan1253_scan:
    set_addr $I10, rxscan1253_loop
    rx1249_cur."!mark_push"(0, rx1249_pos, $I10)
  rxscan1253_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1254_fail
    rx1249_cur."!mark_push"(0, rx1249_pos, $I10)
  # rx literal  "||"
    add $I11, rx1249_pos, 2
    gt $I11, rx1249_eos, rx1249_fail
    sub $I11, rx1249_pos, rx1249_off
    substr $S10, rx1249_tgt, $I11, 2
    ne $S10, "||", rx1249_fail
    add rx1249_pos, 2
    set_addr $I10, rxcap_1254_fail
    ($I12, $I11) = rx1249_cur."!mark_peek"($I10)
    rx1249_cur."!cursor_pos"($I11)
    ($P10) = rx1249_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1249_pos, "")
    rx1249_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1254_done
  rxcap_1254_fail:
    goto rx1249_fail
  rxcap_1254_done:
  # rx subrule "O" subtype=capture negate=
    rx1249_cur."!cursor_pos"(rx1249_pos)
    $P10 = rx1249_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1249_fail
    rx1249_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1249_pos = $P10."pos"()
  # rx pass
    rx1249_cur."!cursor_pass"(rx1249_pos, "infix:sym<||>")
    if_null rx1249_debug, debug_973
    rx1249_cur."!cursor_debug"("PASS", "infix:sym<||>", " at pos=", rx1249_pos)
  debug_973:
    .return (rx1249_cur)
  rx1249_restart:
.annotate 'line', 447
    if_null rx1249_debug, debug_974
    rx1249_cur."!cursor_debug"("NEXT", "infix:sym<||>")
  debug_974:
  rx1249_fail:
    (rx1249_rep, rx1249_pos, $I10, $P10) = rx1249_cur."!mark_fail"(0)
    lt rx1249_pos, -1, rx1249_done
    eq rx1249_pos, -1, rx1249_fail
    jump $I10
  rx1249_done:
    rx1249_cur."!cursor_fail"()
    if_null rx1249_debug, debug_975
    rx1249_cur."!cursor_debug"("FAIL", "infix:sym<||>")
  debug_975:
    .return (rx1249_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("325_1283874336.57842") :method
.annotate 'line', 447
    $P1251 = self."!PREFIX__!subrule"("O", "||")
    new $P1252, "ResizablePMCArray"
    push $P1252, $P1251
    .return ($P1252)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("326_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1256_tgt
    .local int rx1256_pos
    .local int rx1256_off
    .local int rx1256_eos
    .local int rx1256_rep
    .local pmc rx1256_cur
    .local pmc rx1256_debug
    (rx1256_cur, rx1256_pos, rx1256_tgt, $I10) = self."!cursor_start"()
    getattribute rx1256_debug, rx1256_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1256_cur
    .local pmc match
    .lex "$/", match
    length rx1256_eos, rx1256_tgt
    gt rx1256_pos, rx1256_eos, rx1256_done
    set rx1256_off, 0
    lt rx1256_pos, 2, rx1256_start
    sub rx1256_off, rx1256_pos, 1
    substr rx1256_tgt, rx1256_tgt, rx1256_off
  rx1256_start:
    eq $I10, 1, rx1256_restart
    if_null rx1256_debug, debug_976
    rx1256_cur."!cursor_debug"("START", "infix:sym<//>")
  debug_976:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1260_done
    goto rxscan1260_scan
  rxscan1260_loop:
    ($P10) = rx1256_cur."from"()
    inc $P10
    set rx1256_pos, $P10
    ge rx1256_pos, rx1256_eos, rxscan1260_done
  rxscan1260_scan:
    set_addr $I10, rxscan1260_loop
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
  rxscan1260_done:
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1261_fail
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
  # rx literal  "//"
    add $I11, rx1256_pos, 2
    gt $I11, rx1256_eos, rx1256_fail
    sub $I11, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I11, 2
    ne $S10, "//", rx1256_fail
    add rx1256_pos, 2
    set_addr $I10, rxcap_1261_fail
    ($I12, $I11) = rx1256_cur."!mark_peek"($I10)
    rx1256_cur."!cursor_pos"($I11)
    ($P10) = rx1256_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1256_pos, "")
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1261_done
  rxcap_1261_fail:
    goto rx1256_fail
  rxcap_1261_done:
  # rx subrule "O" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1256_pos = $P10."pos"()
  # rx pass
    rx1256_cur."!cursor_pass"(rx1256_pos, "infix:sym<//>")
    if_null rx1256_debug, debug_977
    rx1256_cur."!cursor_debug"("PASS", "infix:sym<//>", " at pos=", rx1256_pos)
  debug_977:
    .return (rx1256_cur)
  rx1256_restart:
.annotate 'line', 447
    if_null rx1256_debug, debug_978
    rx1256_cur."!cursor_debug"("NEXT", "infix:sym<//>")
  debug_978:
  rx1256_fail:
    (rx1256_rep, rx1256_pos, $I10, $P10) = rx1256_cur."!mark_fail"(0)
    lt rx1256_pos, -1, rx1256_done
    eq rx1256_pos, -1, rx1256_fail
    jump $I10
  rx1256_done:
    rx1256_cur."!cursor_fail"()
    if_null rx1256_debug, debug_979
    rx1256_cur."!cursor_debug"("FAIL", "infix:sym<//>")
  debug_979:
    .return (rx1256_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("327_1283874336.57842") :method
.annotate 'line', 447
    $P1258 = self."!PREFIX__!subrule"("O", "//")
    new $P1259, "ResizablePMCArray"
    push $P1259, $P1258
    .return ($P1259)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("328_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1263_tgt
    .local int rx1263_pos
    .local int rx1263_off
    .local int rx1263_eos
    .local int rx1263_rep
    .local pmc rx1263_cur
    .local pmc rx1263_debug
    (rx1263_cur, rx1263_pos, rx1263_tgt, $I10) = self."!cursor_start"()
    getattribute rx1263_debug, rx1263_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1263_cur
    .local pmc match
    .lex "$/", match
    length rx1263_eos, rx1263_tgt
    gt rx1263_pos, rx1263_eos, rx1263_done
    set rx1263_off, 0
    lt rx1263_pos, 2, rx1263_start
    sub rx1263_off, rx1263_pos, 1
    substr rx1263_tgt, rx1263_tgt, rx1263_off
  rx1263_start:
    eq $I10, 1, rx1263_restart
    if_null rx1263_debug, debug_980
    rx1263_cur."!cursor_debug"("START", "infix:sym<?? !!>")
  debug_980:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1267_done
    goto rxscan1267_scan
  rxscan1267_loop:
    ($P10) = rx1263_cur."from"()
    inc $P10
    set rx1263_pos, $P10
    ge rx1263_pos, rx1263_eos, rxscan1267_done
  rxscan1267_scan:
    set_addr $I10, rxscan1267_loop
    rx1263_cur."!mark_push"(0, rx1263_pos, $I10)
  rxscan1267_done:
.annotate 'line', 540
  # rx literal  "??"
    add $I11, rx1263_pos, 2
    gt $I11, rx1263_eos, rx1263_fail
    sub $I11, rx1263_pos, rx1263_off
    substr $S10, rx1263_tgt, $I11, 2
    ne $S10, "??", rx1263_fail
    add rx1263_pos, 2
.annotate 'line', 541
  # rx subrule "ws" subtype=method negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."ws"()
    unless $P10, rx1263_fail
    rx1263_pos = $P10."pos"()
.annotate 'line', 542
  # rx subrule "EXPR" subtype=capture negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."EXPR"("i=")
    unless $P10, rx1263_fail
    rx1263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1263_pos = $P10."pos"()
.annotate 'line', 543
  # rx literal  "!!"
    add $I11, rx1263_pos, 2
    gt $I11, rx1263_eos, rx1263_fail
    sub $I11, rx1263_pos, rx1263_off
    substr $S10, rx1263_tgt, $I11, 2
    ne $S10, "!!", rx1263_fail
    add rx1263_pos, 2
.annotate 'line', 544
  # rx subrule "O" subtype=capture negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1263_fail
    rx1263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1263_pos = $P10."pos"()
.annotate 'line', 539
  # rx pass
    rx1263_cur."!cursor_pass"(rx1263_pos, "infix:sym<?? !!>")
    if_null rx1263_debug, debug_981
    rx1263_cur."!cursor_debug"("PASS", "infix:sym<?? !!>", " at pos=", rx1263_pos)
  debug_981:
    .return (rx1263_cur)
  rx1263_restart:
.annotate 'line', 447
    if_null rx1263_debug, debug_982
    rx1263_cur."!cursor_debug"("NEXT", "infix:sym<?? !!>")
  debug_982:
  rx1263_fail:
    (rx1263_rep, rx1263_pos, $I10, $P10) = rx1263_cur."!mark_fail"(0)
    lt rx1263_pos, -1, rx1263_done
    eq rx1263_pos, -1, rx1263_fail
    jump $I10
  rx1263_done:
    rx1263_cur."!cursor_fail"()
    if_null rx1263_debug, debug_983
    rx1263_cur."!cursor_debug"("FAIL", "infix:sym<?? !!>")
  debug_983:
    .return (rx1263_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("329_1283874336.57842") :method
.annotate 'line', 447
    $P1265 = self."!PREFIX__!subrule"("ws", "??")
    new $P1266, "ResizablePMCArray"
    push $P1266, $P1265
    .return ($P1266)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("330_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1269_tgt
    .local int rx1269_pos
    .local int rx1269_off
    .local int rx1269_eos
    .local int rx1269_rep
    .local pmc rx1269_cur
    .local pmc rx1269_debug
    (rx1269_cur, rx1269_pos, rx1269_tgt, $I10) = self."!cursor_start"()
    getattribute rx1269_debug, rx1269_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1269_cur
    .local pmc match
    .lex "$/", match
    length rx1269_eos, rx1269_tgt
    gt rx1269_pos, rx1269_eos, rx1269_done
    set rx1269_off, 0
    lt rx1269_pos, 2, rx1269_start
    sub rx1269_off, rx1269_pos, 1
    substr rx1269_tgt, rx1269_tgt, rx1269_off
  rx1269_start:
    eq $I10, 1, rx1269_restart
    if_null rx1269_debug, debug_984
    rx1269_cur."!cursor_debug"("START", "infix:sym<=>")
  debug_984:
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
.annotate 'line', 548
  # rx subcapture "sym"
    set_addr $I10, rxcap_1274_fail
    rx1269_cur."!mark_push"(0, rx1269_pos, $I10)
  # rx literal  "="
    add $I11, rx1269_pos, 1
    gt $I11, rx1269_eos, rx1269_fail
    sub $I11, rx1269_pos, rx1269_off
    ord $I11, rx1269_tgt, $I11
    ne $I11, 61, rx1269_fail
    add rx1269_pos, 1
    set_addr $I10, rxcap_1274_fail
    ($I12, $I11) = rx1269_cur."!mark_peek"($I10)
    rx1269_cur."!cursor_pos"($I11)
    ($P10) = rx1269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1269_pos, "")
    rx1269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1274_done
  rxcap_1274_fail:
    goto rx1269_fail
  rxcap_1274_done:
  # rx subrule "panic" subtype=method negate=
    rx1269_cur."!cursor_pos"(rx1269_pos)
    $P10 = rx1269_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1269_fail
    rx1269_pos = $P10."pos"()
.annotate 'line', 547
  # rx pass
    rx1269_cur."!cursor_pass"(rx1269_pos, "infix:sym<=>")
    if_null rx1269_debug, debug_985
    rx1269_cur."!cursor_debug"("PASS", "infix:sym<=>", " at pos=", rx1269_pos)
  debug_985:
    .return (rx1269_cur)
  rx1269_restart:
.annotate 'line', 447
    if_null rx1269_debug, debug_986
    rx1269_cur."!cursor_debug"("NEXT", "infix:sym<=>")
  debug_986:
  rx1269_fail:
    (rx1269_rep, rx1269_pos, $I10, $P10) = rx1269_cur."!mark_fail"(0)
    lt rx1269_pos, -1, rx1269_done
    eq rx1269_pos, -1, rx1269_fail
    jump $I10
  rx1269_done:
    rx1269_cur."!cursor_fail"()
    if_null rx1269_debug, debug_987
    rx1269_cur."!cursor_debug"("FAIL", "infix:sym<=>")
  debug_987:
    .return (rx1269_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("331_1283874336.57842") :method
.annotate 'line', 447
    $P1271 = self."!PREFIX__!subrule"("panic", "=")
    new $P1272, "ResizablePMCArray"
    push $P1272, $P1271
    .return ($P1272)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("332_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1276_tgt
    .local int rx1276_pos
    .local int rx1276_off
    .local int rx1276_eos
    .local int rx1276_rep
    .local pmc rx1276_cur
    .local pmc rx1276_debug
    (rx1276_cur, rx1276_pos, rx1276_tgt, $I10) = self."!cursor_start"()
    getattribute rx1276_debug, rx1276_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1276_cur
    .local pmc match
    .lex "$/", match
    length rx1276_eos, rx1276_tgt
    gt rx1276_pos, rx1276_eos, rx1276_done
    set rx1276_off, 0
    lt rx1276_pos, 2, rx1276_start
    sub rx1276_off, rx1276_pos, 1
    substr rx1276_tgt, rx1276_tgt, rx1276_off
  rx1276_start:
    eq $I10, 1, rx1276_restart
    if_null rx1276_debug, debug_988
    rx1276_cur."!cursor_debug"("START", "infix:sym<:=>")
  debug_988:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1280_done
    goto rxscan1280_scan
  rxscan1280_loop:
    ($P10) = rx1276_cur."from"()
    inc $P10
    set rx1276_pos, $P10
    ge rx1276_pos, rx1276_eos, rxscan1280_done
  rxscan1280_scan:
    set_addr $I10, rxscan1280_loop
    rx1276_cur."!mark_push"(0, rx1276_pos, $I10)
  rxscan1280_done:
.annotate 'line', 550
  # rx subcapture "sym"
    set_addr $I10, rxcap_1281_fail
    rx1276_cur."!mark_push"(0, rx1276_pos, $I10)
  # rx literal  ":="
    add $I11, rx1276_pos, 2
    gt $I11, rx1276_eos, rx1276_fail
    sub $I11, rx1276_pos, rx1276_off
    substr $S10, rx1276_tgt, $I11, 2
    ne $S10, ":=", rx1276_fail
    add rx1276_pos, 2
    set_addr $I10, rxcap_1281_fail
    ($I12, $I11) = rx1276_cur."!mark_peek"($I10)
    rx1276_cur."!cursor_pos"($I11)
    ($P10) = rx1276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1276_pos, "")
    rx1276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1281_done
  rxcap_1281_fail:
    goto rx1276_fail
  rxcap_1281_done:
  # rx subrule "O" subtype=capture negate=
    rx1276_cur."!cursor_pos"(rx1276_pos)
    $P10 = rx1276_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1276_fail
    rx1276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1276_pos = $P10."pos"()
  # rx pass
    rx1276_cur."!cursor_pass"(rx1276_pos, "infix:sym<:=>")
    if_null rx1276_debug, debug_989
    rx1276_cur."!cursor_debug"("PASS", "infix:sym<:=>", " at pos=", rx1276_pos)
  debug_989:
    .return (rx1276_cur)
  rx1276_restart:
.annotate 'line', 447
    if_null rx1276_debug, debug_990
    rx1276_cur."!cursor_debug"("NEXT", "infix:sym<:=>")
  debug_990:
  rx1276_fail:
    (rx1276_rep, rx1276_pos, $I10, $P10) = rx1276_cur."!mark_fail"(0)
    lt rx1276_pos, -1, rx1276_done
    eq rx1276_pos, -1, rx1276_fail
    jump $I10
  rx1276_done:
    rx1276_cur."!cursor_fail"()
    if_null rx1276_debug, debug_991
    rx1276_cur."!cursor_debug"("FAIL", "infix:sym<:=>")
  debug_991:
    .return (rx1276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("333_1283874336.57842") :method
.annotate 'line', 447
    $P1278 = self."!PREFIX__!subrule"("O", ":=")
    new $P1279, "ResizablePMCArray"
    push $P1279, $P1278
    .return ($P1279)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("334_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1283_tgt
    .local int rx1283_pos
    .local int rx1283_off
    .local int rx1283_eos
    .local int rx1283_rep
    .local pmc rx1283_cur
    .local pmc rx1283_debug
    (rx1283_cur, rx1283_pos, rx1283_tgt, $I10) = self."!cursor_start"()
    getattribute rx1283_debug, rx1283_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1283_cur
    .local pmc match
    .lex "$/", match
    length rx1283_eos, rx1283_tgt
    gt rx1283_pos, rx1283_eos, rx1283_done
    set rx1283_off, 0
    lt rx1283_pos, 2, rx1283_start
    sub rx1283_off, rx1283_pos, 1
    substr rx1283_tgt, rx1283_tgt, rx1283_off
  rx1283_start:
    eq $I10, 1, rx1283_restart
    if_null rx1283_debug, debug_992
    rx1283_cur."!cursor_debug"("START", "infix:sym<::=>")
  debug_992:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1287_done
    goto rxscan1287_scan
  rxscan1287_loop:
    ($P10) = rx1283_cur."from"()
    inc $P10
    set rx1283_pos, $P10
    ge rx1283_pos, rx1283_eos, rxscan1287_done
  rxscan1287_scan:
    set_addr $I10, rxscan1287_loop
    rx1283_cur."!mark_push"(0, rx1283_pos, $I10)
  rxscan1287_done:
.annotate 'line', 551
  # rx subcapture "sym"
    set_addr $I10, rxcap_1288_fail
    rx1283_cur."!mark_push"(0, rx1283_pos, $I10)
  # rx literal  "::="
    add $I11, rx1283_pos, 3
    gt $I11, rx1283_eos, rx1283_fail
    sub $I11, rx1283_pos, rx1283_off
    substr $S10, rx1283_tgt, $I11, 3
    ne $S10, "::=", rx1283_fail
    add rx1283_pos, 3
    set_addr $I10, rxcap_1288_fail
    ($I12, $I11) = rx1283_cur."!mark_peek"($I10)
    rx1283_cur."!cursor_pos"($I11)
    ($P10) = rx1283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1283_pos, "")
    rx1283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1288_done
  rxcap_1288_fail:
    goto rx1283_fail
  rxcap_1288_done:
  # rx subrule "O" subtype=capture negate=
    rx1283_cur."!cursor_pos"(rx1283_pos)
    $P10 = rx1283_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1283_fail
    rx1283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1283_pos = $P10."pos"()
  # rx pass
    rx1283_cur."!cursor_pass"(rx1283_pos, "infix:sym<::=>")
    if_null rx1283_debug, debug_993
    rx1283_cur."!cursor_debug"("PASS", "infix:sym<::=>", " at pos=", rx1283_pos)
  debug_993:
    .return (rx1283_cur)
  rx1283_restart:
.annotate 'line', 447
    if_null rx1283_debug, debug_994
    rx1283_cur."!cursor_debug"("NEXT", "infix:sym<::=>")
  debug_994:
  rx1283_fail:
    (rx1283_rep, rx1283_pos, $I10, $P10) = rx1283_cur."!mark_fail"(0)
    lt rx1283_pos, -1, rx1283_done
    eq rx1283_pos, -1, rx1283_fail
    jump $I10
  rx1283_done:
    rx1283_cur."!cursor_fail"()
    if_null rx1283_debug, debug_995
    rx1283_cur."!cursor_debug"("FAIL", "infix:sym<::=>")
  debug_995:
    .return (rx1283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("335_1283874336.57842") :method
.annotate 'line', 447
    $P1285 = self."!PREFIX__!subrule"("O", "::=")
    new $P1286, "ResizablePMCArray"
    push $P1286, $P1285
    .return ($P1286)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("336_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1290_tgt
    .local int rx1290_pos
    .local int rx1290_off
    .local int rx1290_eos
    .local int rx1290_rep
    .local pmc rx1290_cur
    .local pmc rx1290_debug
    (rx1290_cur, rx1290_pos, rx1290_tgt, $I10) = self."!cursor_start"()
    getattribute rx1290_debug, rx1290_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1290_cur
    .local pmc match
    .lex "$/", match
    length rx1290_eos, rx1290_tgt
    gt rx1290_pos, rx1290_eos, rx1290_done
    set rx1290_off, 0
    lt rx1290_pos, 2, rx1290_start
    sub rx1290_off, rx1290_pos, 1
    substr rx1290_tgt, rx1290_tgt, rx1290_off
  rx1290_start:
    eq $I10, 1, rx1290_restart
    if_null rx1290_debug, debug_996
    rx1290_cur."!cursor_debug"("START", "infix:sym<,>")
  debug_996:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1294_done
    goto rxscan1294_scan
  rxscan1294_loop:
    ($P10) = rx1290_cur."from"()
    inc $P10
    set rx1290_pos, $P10
    ge rx1290_pos, rx1290_eos, rxscan1294_done
  rxscan1294_scan:
    set_addr $I10, rxscan1294_loop
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  rxscan1294_done:
.annotate 'line', 553
  # rx subcapture "sym"
    set_addr $I10, rxcap_1295_fail
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  # rx literal  ","
    add $I11, rx1290_pos, 1
    gt $I11, rx1290_eos, rx1290_fail
    sub $I11, rx1290_pos, rx1290_off
    ord $I11, rx1290_tgt, $I11
    ne $I11, 44, rx1290_fail
    add rx1290_pos, 1
    set_addr $I10, rxcap_1295_fail
    ($I12, $I11) = rx1290_cur."!mark_peek"($I10)
    rx1290_cur."!cursor_pos"($I11)
    ($P10) = rx1290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1290_pos, "")
    rx1290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1295_done
  rxcap_1295_fail:
    goto rx1290_fail
  rxcap_1295_done:
  # rx subrule "O" subtype=capture negate=
    rx1290_cur."!cursor_pos"(rx1290_pos)
    $P10 = rx1290_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1290_fail
    rx1290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1290_pos = $P10."pos"()
  # rx pass
    rx1290_cur."!cursor_pass"(rx1290_pos, "infix:sym<,>")
    if_null rx1290_debug, debug_997
    rx1290_cur."!cursor_debug"("PASS", "infix:sym<,>", " at pos=", rx1290_pos)
  debug_997:
    .return (rx1290_cur)
  rx1290_restart:
.annotate 'line', 447
    if_null rx1290_debug, debug_998
    rx1290_cur."!cursor_debug"("NEXT", "infix:sym<,>")
  debug_998:
  rx1290_fail:
    (rx1290_rep, rx1290_pos, $I10, $P10) = rx1290_cur."!mark_fail"(0)
    lt rx1290_pos, -1, rx1290_done
    eq rx1290_pos, -1, rx1290_fail
    jump $I10
  rx1290_done:
    rx1290_cur."!cursor_fail"()
    if_null rx1290_debug, debug_999
    rx1290_cur."!cursor_debug"("FAIL", "infix:sym<,>")
  debug_999:
    .return (rx1290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("337_1283874336.57842") :method
.annotate 'line', 447
    $P1292 = self."!PREFIX__!subrule"("O", ",")
    new $P1293, "ResizablePMCArray"
    push $P1293, $P1292
    .return ($P1293)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("338_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1297_tgt
    .local int rx1297_pos
    .local int rx1297_off
    .local int rx1297_eos
    .local int rx1297_rep
    .local pmc rx1297_cur
    .local pmc rx1297_debug
    (rx1297_cur, rx1297_pos, rx1297_tgt, $I10) = self."!cursor_start"()
    getattribute rx1297_debug, rx1297_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1297_cur
    .local pmc match
    .lex "$/", match
    length rx1297_eos, rx1297_tgt
    gt rx1297_pos, rx1297_eos, rx1297_done
    set rx1297_off, 0
    lt rx1297_pos, 2, rx1297_start
    sub rx1297_off, rx1297_pos, 1
    substr rx1297_tgt, rx1297_tgt, rx1297_off
  rx1297_start:
    eq $I10, 1, rx1297_restart
    if_null rx1297_debug, debug_1000
    rx1297_cur."!cursor_debug"("START", "prefix:sym<return>")
  debug_1000:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1300_done
    goto rxscan1300_scan
  rxscan1300_loop:
    ($P10) = rx1297_cur."from"()
    inc $P10
    set rx1297_pos, $P10
    ge rx1297_pos, rx1297_eos, rxscan1300_done
  rxscan1300_scan:
    set_addr $I10, rxscan1300_loop
    rx1297_cur."!mark_push"(0, rx1297_pos, $I10)
  rxscan1300_done:
.annotate 'line', 555
  # rx subcapture "sym"
    set_addr $I10, rxcap_1301_fail
    rx1297_cur."!mark_push"(0, rx1297_pos, $I10)
  # rx literal  "return"
    add $I11, rx1297_pos, 6
    gt $I11, rx1297_eos, rx1297_fail
    sub $I11, rx1297_pos, rx1297_off
    substr $S10, rx1297_tgt, $I11, 6
    ne $S10, "return", rx1297_fail
    add rx1297_pos, 6
    set_addr $I10, rxcap_1301_fail
    ($I12, $I11) = rx1297_cur."!mark_peek"($I10)
    rx1297_cur."!cursor_pos"($I11)
    ($P10) = rx1297_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1297_pos, "")
    rx1297_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1301_done
  rxcap_1301_fail:
    goto rx1297_fail
  rxcap_1301_done:
  # rx charclass s
    ge rx1297_pos, rx1297_eos, rx1297_fail
    sub $I10, rx1297_pos, rx1297_off
    is_cclass $I11, 32, rx1297_tgt, $I10
    unless $I11, rx1297_fail
    inc rx1297_pos
  # rx subrule "O" subtype=capture negate=
    rx1297_cur."!cursor_pos"(rx1297_pos)
    $P10 = rx1297_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1297_fail
    rx1297_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1297_pos = $P10."pos"()
  # rx pass
    rx1297_cur."!cursor_pass"(rx1297_pos, "prefix:sym<return>")
    if_null rx1297_debug, debug_1001
    rx1297_cur."!cursor_debug"("PASS", "prefix:sym<return>", " at pos=", rx1297_pos)
  debug_1001:
    .return (rx1297_cur)
  rx1297_restart:
.annotate 'line', 447
    if_null rx1297_debug, debug_1002
    rx1297_cur."!cursor_debug"("NEXT", "prefix:sym<return>")
  debug_1002:
  rx1297_fail:
    (rx1297_rep, rx1297_pos, $I10, $P10) = rx1297_cur."!mark_fail"(0)
    lt rx1297_pos, -1, rx1297_done
    eq rx1297_pos, -1, rx1297_fail
    jump $I10
  rx1297_done:
    rx1297_cur."!cursor_fail"()
    if_null rx1297_debug, debug_1003
    rx1297_cur."!cursor_debug"("FAIL", "prefix:sym<return>")
  debug_1003:
    .return (rx1297_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("339_1283874336.57842") :method
.annotate 'line', 447
    new $P1299, "ResizablePMCArray"
    push $P1299, "return"
    .return ($P1299)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("340_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1303_tgt
    .local int rx1303_pos
    .local int rx1303_off
    .local int rx1303_eos
    .local int rx1303_rep
    .local pmc rx1303_cur
    .local pmc rx1303_debug
    (rx1303_cur, rx1303_pos, rx1303_tgt, $I10) = self."!cursor_start"()
    getattribute rx1303_debug, rx1303_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1303_cur
    .local pmc match
    .lex "$/", match
    length rx1303_eos, rx1303_tgt
    gt rx1303_pos, rx1303_eos, rx1303_done
    set rx1303_off, 0
    lt rx1303_pos, 2, rx1303_start
    sub rx1303_off, rx1303_pos, 1
    substr rx1303_tgt, rx1303_tgt, rx1303_off
  rx1303_start:
    eq $I10, 1, rx1303_restart
    if_null rx1303_debug, debug_1004
    rx1303_cur."!cursor_debug"("START", "prefix:sym<make>")
  debug_1004:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1306_done
    goto rxscan1306_scan
  rxscan1306_loop:
    ($P10) = rx1303_cur."from"()
    inc $P10
    set rx1303_pos, $P10
    ge rx1303_pos, rx1303_eos, rxscan1306_done
  rxscan1306_scan:
    set_addr $I10, rxscan1306_loop
    rx1303_cur."!mark_push"(0, rx1303_pos, $I10)
  rxscan1306_done:
.annotate 'line', 556
  # rx subcapture "sym"
    set_addr $I10, rxcap_1307_fail
    rx1303_cur."!mark_push"(0, rx1303_pos, $I10)
  # rx literal  "make"
    add $I11, rx1303_pos, 4
    gt $I11, rx1303_eos, rx1303_fail
    sub $I11, rx1303_pos, rx1303_off
    substr $S10, rx1303_tgt, $I11, 4
    ne $S10, "make", rx1303_fail
    add rx1303_pos, 4
    set_addr $I10, rxcap_1307_fail
    ($I12, $I11) = rx1303_cur."!mark_peek"($I10)
    rx1303_cur."!cursor_pos"($I11)
    ($P10) = rx1303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1303_pos, "")
    rx1303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1307_done
  rxcap_1307_fail:
    goto rx1303_fail
  rxcap_1307_done:
  # rx charclass s
    ge rx1303_pos, rx1303_eos, rx1303_fail
    sub $I10, rx1303_pos, rx1303_off
    is_cclass $I11, 32, rx1303_tgt, $I10
    unless $I11, rx1303_fail
    inc rx1303_pos
  # rx subrule "O" subtype=capture negate=
    rx1303_cur."!cursor_pos"(rx1303_pos)
    $P10 = rx1303_cur."O"("%list_prefix")
    unless $P10, rx1303_fail
    rx1303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1303_pos = $P10."pos"()
  # rx pass
    rx1303_cur."!cursor_pass"(rx1303_pos, "prefix:sym<make>")
    if_null rx1303_debug, debug_1005
    rx1303_cur."!cursor_debug"("PASS", "prefix:sym<make>", " at pos=", rx1303_pos)
  debug_1005:
    .return (rx1303_cur)
  rx1303_restart:
.annotate 'line', 447
    if_null rx1303_debug, debug_1006
    rx1303_cur."!cursor_debug"("NEXT", "prefix:sym<make>")
  debug_1006:
  rx1303_fail:
    (rx1303_rep, rx1303_pos, $I10, $P10) = rx1303_cur."!mark_fail"(0)
    lt rx1303_pos, -1, rx1303_done
    eq rx1303_pos, -1, rx1303_fail
    jump $I10
  rx1303_done:
    rx1303_cur."!cursor_fail"()
    if_null rx1303_debug, debug_1007
    rx1303_cur."!cursor_debug"("FAIL", "prefix:sym<make>")
  debug_1007:
    .return (rx1303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("341_1283874336.57842") :method
.annotate 'line', 447
    new $P1305, "ResizablePMCArray"
    push $P1305, "make"
    .return ($P1305)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("342_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
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
    if_null rx1309_debug, debug_1008
    rx1309_cur."!cursor_debug"("START", "term:sym<last>")
  debug_1008:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1312_done
    goto rxscan1312_scan
  rxscan1312_loop:
    ($P10) = rx1309_cur."from"()
    inc $P10
    set rx1309_pos, $P10
    ge rx1309_pos, rx1309_eos, rxscan1312_done
  rxscan1312_scan:
    set_addr $I10, rxscan1312_loop
    rx1309_cur."!mark_push"(0, rx1309_pos, $I10)
  rxscan1312_done:
.annotate 'line', 557
  # rx subcapture "sym"
    set_addr $I10, rxcap_1313_fail
    rx1309_cur."!mark_push"(0, rx1309_pos, $I10)
  # rx literal  "last"
    add $I11, rx1309_pos, 4
    gt $I11, rx1309_eos, rx1309_fail
    sub $I11, rx1309_pos, rx1309_off
    substr $S10, rx1309_tgt, $I11, 4
    ne $S10, "last", rx1309_fail
    add rx1309_pos, 4
    set_addr $I10, rxcap_1313_fail
    ($I12, $I11) = rx1309_cur."!mark_peek"($I10)
    rx1309_cur."!cursor_pos"($I11)
    ($P10) = rx1309_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1309_pos, "")
    rx1309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1313_done
  rxcap_1313_fail:
    goto rx1309_fail
  rxcap_1313_done:
  # rx pass
    rx1309_cur."!cursor_pass"(rx1309_pos, "term:sym<last>")
    if_null rx1309_debug, debug_1009
    rx1309_cur."!cursor_debug"("PASS", "term:sym<last>", " at pos=", rx1309_pos)
  debug_1009:
    .return (rx1309_cur)
  rx1309_restart:
.annotate 'line', 447
    if_null rx1309_debug, debug_1010
    rx1309_cur."!cursor_debug"("NEXT", "term:sym<last>")
  debug_1010:
  rx1309_fail:
    (rx1309_rep, rx1309_pos, $I10, $P10) = rx1309_cur."!mark_fail"(0)
    lt rx1309_pos, -1, rx1309_done
    eq rx1309_pos, -1, rx1309_fail
    jump $I10
  rx1309_done:
    rx1309_cur."!cursor_fail"()
    if_null rx1309_debug, debug_1011
    rx1309_cur."!cursor_debug"("FAIL", "term:sym<last>")
  debug_1011:
    .return (rx1309_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("343_1283874336.57842") :method
.annotate 'line', 447
    new $P1311, "ResizablePMCArray"
    push $P1311, "last"
    .return ($P1311)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("344_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1315_tgt
    .local int rx1315_pos
    .local int rx1315_off
    .local int rx1315_eos
    .local int rx1315_rep
    .local pmc rx1315_cur
    .local pmc rx1315_debug
    (rx1315_cur, rx1315_pos, rx1315_tgt, $I10) = self."!cursor_start"()
    getattribute rx1315_debug, rx1315_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1315_cur
    .local pmc match
    .lex "$/", match
    length rx1315_eos, rx1315_tgt
    gt rx1315_pos, rx1315_eos, rx1315_done
    set rx1315_off, 0
    lt rx1315_pos, 2, rx1315_start
    sub rx1315_off, rx1315_pos, 1
    substr rx1315_tgt, rx1315_tgt, rx1315_off
  rx1315_start:
    eq $I10, 1, rx1315_restart
    if_null rx1315_debug, debug_1012
    rx1315_cur."!cursor_debug"("START", "term:sym<next>")
  debug_1012:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1318_done
    goto rxscan1318_scan
  rxscan1318_loop:
    ($P10) = rx1315_cur."from"()
    inc $P10
    set rx1315_pos, $P10
    ge rx1315_pos, rx1315_eos, rxscan1318_done
  rxscan1318_scan:
    set_addr $I10, rxscan1318_loop
    rx1315_cur."!mark_push"(0, rx1315_pos, $I10)
  rxscan1318_done:
.annotate 'line', 558
  # rx subcapture "sym"
    set_addr $I10, rxcap_1319_fail
    rx1315_cur."!mark_push"(0, rx1315_pos, $I10)
  # rx literal  "next"
    add $I11, rx1315_pos, 4
    gt $I11, rx1315_eos, rx1315_fail
    sub $I11, rx1315_pos, rx1315_off
    substr $S10, rx1315_tgt, $I11, 4
    ne $S10, "next", rx1315_fail
    add rx1315_pos, 4
    set_addr $I10, rxcap_1319_fail
    ($I12, $I11) = rx1315_cur."!mark_peek"($I10)
    rx1315_cur."!cursor_pos"($I11)
    ($P10) = rx1315_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1315_pos, "")
    rx1315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1319_done
  rxcap_1319_fail:
    goto rx1315_fail
  rxcap_1319_done:
  # rx pass
    rx1315_cur."!cursor_pass"(rx1315_pos, "term:sym<next>")
    if_null rx1315_debug, debug_1013
    rx1315_cur."!cursor_debug"("PASS", "term:sym<next>", " at pos=", rx1315_pos)
  debug_1013:
    .return (rx1315_cur)
  rx1315_restart:
.annotate 'line', 447
    if_null rx1315_debug, debug_1014
    rx1315_cur."!cursor_debug"("NEXT", "term:sym<next>")
  debug_1014:
  rx1315_fail:
    (rx1315_rep, rx1315_pos, $I10, $P10) = rx1315_cur."!mark_fail"(0)
    lt rx1315_pos, -1, rx1315_done
    eq rx1315_pos, -1, rx1315_fail
    jump $I10
  rx1315_done:
    rx1315_cur."!cursor_fail"()
    if_null rx1315_debug, debug_1015
    rx1315_cur."!cursor_debug"("FAIL", "term:sym<next>")
  debug_1015:
    .return (rx1315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("345_1283874336.57842") :method
.annotate 'line', 447
    new $P1317, "ResizablePMCArray"
    push $P1317, "next"
    .return ($P1317)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("346_1283874336.57842") :method :outer("11_1283874336.57842")
.annotate 'line', 447
    .local string rx1321_tgt
    .local int rx1321_pos
    .local int rx1321_off
    .local int rx1321_eos
    .local int rx1321_rep
    .local pmc rx1321_cur
    .local pmc rx1321_debug
    (rx1321_cur, rx1321_pos, rx1321_tgt, $I10) = self."!cursor_start"()
    getattribute rx1321_debug, rx1321_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1321_cur
    .local pmc match
    .lex "$/", match
    length rx1321_eos, rx1321_tgt
    gt rx1321_pos, rx1321_eos, rx1321_done
    set rx1321_off, 0
    lt rx1321_pos, 2, rx1321_start
    sub rx1321_off, rx1321_pos, 1
    substr rx1321_tgt, rx1321_tgt, rx1321_off
  rx1321_start:
    eq $I10, 1, rx1321_restart
    if_null rx1321_debug, debug_1016
    rx1321_cur."!cursor_debug"("START", "term:sym<redo>")
  debug_1016:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1324_done
    goto rxscan1324_scan
  rxscan1324_loop:
    ($P10) = rx1321_cur."from"()
    inc $P10
    set rx1321_pos, $P10
    ge rx1321_pos, rx1321_eos, rxscan1324_done
  rxscan1324_scan:
    set_addr $I10, rxscan1324_loop
    rx1321_cur."!mark_push"(0, rx1321_pos, $I10)
  rxscan1324_done:
.annotate 'line', 559
  # rx subcapture "sym"
    set_addr $I10, rxcap_1325_fail
    rx1321_cur."!mark_push"(0, rx1321_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1321_pos, 4
    gt $I11, rx1321_eos, rx1321_fail
    sub $I11, rx1321_pos, rx1321_off
    substr $S10, rx1321_tgt, $I11, 4
    ne $S10, "redo", rx1321_fail
    add rx1321_pos, 4
    set_addr $I10, rxcap_1325_fail
    ($I12, $I11) = rx1321_cur."!mark_peek"($I10)
    rx1321_cur."!cursor_pos"($I11)
    ($P10) = rx1321_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1321_pos, "")
    rx1321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1325_done
  rxcap_1325_fail:
    goto rx1321_fail
  rxcap_1325_done:
  # rx pass
    rx1321_cur."!cursor_pass"(rx1321_pos, "term:sym<redo>")
    if_null rx1321_debug, debug_1017
    rx1321_cur."!cursor_debug"("PASS", "term:sym<redo>", " at pos=", rx1321_pos)
  debug_1017:
    .return (rx1321_cur)
  rx1321_restart:
.annotate 'line', 447
    if_null rx1321_debug, debug_1018
    rx1321_cur."!cursor_debug"("NEXT", "term:sym<redo>")
  debug_1018:
  rx1321_fail:
    (rx1321_rep, rx1321_pos, $I10, $P10) = rx1321_cur."!mark_fail"(0)
    lt rx1321_pos, -1, rx1321_done
    eq rx1321_pos, -1, rx1321_fail
    jump $I10
  rx1321_done:
    rx1321_cur."!cursor_fail"()
    if_null rx1321_debug, debug_1019
    rx1321_cur."!cursor_debug"("FAIL", "term:sym<redo>")
  debug_1019:
    .return (rx1321_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("347_1283874336.57842") :method
.annotate 'line', 447
    new $P1323, "ResizablePMCArray"
    push $P1323, "redo"
    .return ($P1323)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("348_1283874336.57842") :method :outer("11_1283874336.57842")
    .param pmc param_1329
.annotate 'line', 561
    new $P1328, 'ExceptionHandler'
    set_addr $P1328, control_1327
    $P1328."handle_types"(.CONTROL_RETURN)
    push_eh $P1328
    .lex "self", self
    .lex "$/", param_1329
.annotate 'line', 563
    new $P1330, "Undef"
    .lex "$t", $P1330
    find_lex $P1331, "$/"
    unless_null $P1331, vivify_1020
    $P1331 = root_new ['parrot';'ResizablePMCArray']
  vivify_1020:
    set $P1332, $P1331[0]
    unless_null $P1332, vivify_1021
    new $P1332, "Undef"
  vivify_1021:
    store_lex "$t", $P1332
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_1022
    $P1333 = root_new ['parrot';'ResizablePMCArray']
  vivify_1022:
    set $P1334, $P1333[1]
    unless_null $P1334, vivify_1023
    new $P1334, "Undef"
  vivify_1023:
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_1024
    $P1335 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1335
  vivify_1024:
    set $P1335[0], $P1334
    find_lex $P1336, "$t"
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_1025
    $P1337 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1337
  vivify_1025:
    set $P1337[1], $P1336
.annotate 'line', 561
    .return ($P1336)
  control_1327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, "payload"
    .return ($P1338)
.end


.namespace ["NQP";"Regex"]
.sub "_block1339"  :subid("349_1283874336.57842") :outer("11_1283874336.57842")
.annotate 'line', 567
    .const 'Sub' $P1396 = "368_1283874336.57842" 
    capture_lex $P1396
    .const 'Sub' $P1391 = "366_1283874336.57842" 
    capture_lex $P1391
    .const 'Sub' $P1379 = "363_1283874336.57842" 
    capture_lex $P1379
    .const 'Sub' $P1369 = "360_1283874336.57842" 
    capture_lex $P1369
    .const 'Sub' $P1364 = "358_1283874336.57842" 
    capture_lex $P1364
    .const 'Sub' $P1355 = "355_1283874336.57842" 
    capture_lex $P1355
    .const 'Sub' $P1350 = "353_1283874336.57842" 
    capture_lex $P1350
    .const 'Sub' $P1341 = "350_1283874336.57842" 
    capture_lex $P1341
    .const 'Sub' $P1396 = "368_1283874336.57842" 
    capture_lex $P1396
    .return ($P1396)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("350_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .const 'Sub' $P1347 = "352_1283874336.57842" 
    capture_lex $P1347
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
    if_null rx1342_debug, debug_1026
    rx1342_cur."!cursor_debug"("START", "metachar:sym<:my>")
  debug_1026:
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
.annotate 'line', 569
  # rx literal  ":"
    add $I11, rx1342_pos, 1
    gt $I11, rx1342_eos, rx1342_fail
    sub $I11, rx1342_pos, rx1342_off
    ord $I11, rx1342_tgt, $I11
    ne $I11, 58, rx1342_fail
    add rx1342_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1342_cur."!cursor_pos"(rx1342_pos)
    .const 'Sub' $P1347 = "352_1283874336.57842" 
    capture_lex $P1347
    $P10 = rx1342_cur."before"($P1347)
    unless $P10, rx1342_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1342_cur."!cursor_pos"(rx1342_pos)
    $P10 = rx1342_cur."LANG"("MAIN", "statement")
    unless $P10, rx1342_fail
    rx1342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1342_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1342_cur."!cursor_pos"(rx1342_pos)
    $P10 = rx1342_cur."ws"()
    unless $P10, rx1342_fail
    rx1342_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1342_pos, 1
    gt $I11, rx1342_eos, rx1342_fail
    sub $I11, rx1342_pos, rx1342_off
    ord $I11, rx1342_tgt, $I11
    ne $I11, 59, rx1342_fail
    add rx1342_pos, 1
.annotate 'line', 568
  # rx pass
    rx1342_cur."!cursor_pass"(rx1342_pos, "metachar:sym<:my>")
    if_null rx1342_debug, debug_1031
    rx1342_cur."!cursor_debug"("PASS", "metachar:sym<:my>", " at pos=", rx1342_pos)
  debug_1031:
    .return (rx1342_cur)
  rx1342_restart:
.annotate 'line', 567
    if_null rx1342_debug, debug_1032
    rx1342_cur."!cursor_debug"("NEXT", "metachar:sym<:my>")
  debug_1032:
  rx1342_fail:
    (rx1342_rep, rx1342_pos, $I10, $P10) = rx1342_cur."!mark_fail"(0)
    lt rx1342_pos, -1, rx1342_done
    eq rx1342_pos, -1, rx1342_fail
    jump $I10
  rx1342_done:
    rx1342_cur."!cursor_fail"()
    if_null rx1342_debug, debug_1033
    rx1342_cur."!cursor_debug"("FAIL", "metachar:sym<:my>")
  debug_1033:
    .return (rx1342_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("351_1283874336.57842") :method
.annotate 'line', 567
    new $P1344, "ResizablePMCArray"
    push $P1344, ":"
    .return ($P1344)
.end


.namespace ["NQP";"Regex"]
.sub "_block1346"  :anon :subid("352_1283874336.57842") :method :outer("350_1283874336.57842")
.annotate 'line', 569
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
    if_null rx1348_debug, debug_1027
    rx1348_cur."!cursor_debug"("START", "")
  debug_1027:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1349_done
    goto rxscan1349_scan
  rxscan1349_loop:
    ($P10) = rx1348_cur."from"()
    inc $P10
    set rx1348_pos, $P10
    ge rx1348_pos, rx1348_eos, rxscan1349_done
  rxscan1349_scan:
    set_addr $I10, rxscan1349_loop
    rx1348_cur."!mark_push"(0, rx1348_pos, $I10)
  rxscan1349_done:
  # rx literal  "my"
    add $I11, rx1348_pos, 2
    gt $I11, rx1348_eos, rx1348_fail
    sub $I11, rx1348_pos, rx1348_off
    substr $S10, rx1348_tgt, $I11, 2
    ne $S10, "my", rx1348_fail
    add rx1348_pos, 2
  # rx pass
    rx1348_cur."!cursor_pass"(rx1348_pos, "")
    if_null rx1348_debug, debug_1028
    rx1348_cur."!cursor_debug"("PASS", "", " at pos=", rx1348_pos)
  debug_1028:
    .return (rx1348_cur)
  rx1348_restart:
    if_null rx1348_debug, debug_1029
    rx1348_cur."!cursor_debug"("NEXT", "")
  debug_1029:
  rx1348_fail:
    (rx1348_rep, rx1348_pos, $I10, $P10) = rx1348_cur."!mark_fail"(0)
    lt rx1348_pos, -1, rx1348_done
    eq rx1348_pos, -1, rx1348_fail
    jump $I10
  rx1348_done:
    rx1348_cur."!cursor_fail"()
    if_null rx1348_debug, debug_1030
    rx1348_cur."!cursor_debug"("FAIL", "")
  debug_1030:
    .return (rx1348_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("353_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .local string rx1351_tgt
    .local int rx1351_pos
    .local int rx1351_off
    .local int rx1351_eos
    .local int rx1351_rep
    .local pmc rx1351_cur
    .local pmc rx1351_debug
    (rx1351_cur, rx1351_pos, rx1351_tgt, $I10) = self."!cursor_start"()
    getattribute rx1351_debug, rx1351_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1351_cur
    .local pmc match
    .lex "$/", match
    length rx1351_eos, rx1351_tgt
    gt rx1351_pos, rx1351_eos, rx1351_done
    set rx1351_off, 0
    lt rx1351_pos, 2, rx1351_start
    sub rx1351_off, rx1351_pos, 1
    substr rx1351_tgt, rx1351_tgt, rx1351_off
  rx1351_start:
    eq $I10, 1, rx1351_restart
    if_null rx1351_debug, debug_1034
    rx1351_cur."!cursor_debug"("START", "metachar:sym<{ }>")
  debug_1034:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1354_done
    goto rxscan1354_scan
  rxscan1354_loop:
    ($P10) = rx1351_cur."from"()
    inc $P10
    set rx1351_pos, $P10
    ge rx1351_pos, rx1351_eos, rxscan1354_done
  rxscan1354_scan:
    set_addr $I10, rxscan1354_loop
    rx1351_cur."!mark_push"(0, rx1351_pos, $I10)
  rxscan1354_done:
.annotate 'line', 573
  # rx enumcharlist negate=0 zerowidth
    ge rx1351_pos, rx1351_eos, rx1351_fail
    sub $I10, rx1351_pos, rx1351_off
    substr $S10, rx1351_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1351_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1351_cur."!cursor_pos"(rx1351_pos)
    $P10 = rx1351_cur."codeblock"()
    unless $P10, rx1351_fail
    rx1351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1351_pos = $P10."pos"()
.annotate 'line', 572
  # rx pass
    rx1351_cur."!cursor_pass"(rx1351_pos, "metachar:sym<{ }>")
    if_null rx1351_debug, debug_1035
    rx1351_cur."!cursor_debug"("PASS", "metachar:sym<{ }>", " at pos=", rx1351_pos)
  debug_1035:
    .return (rx1351_cur)
  rx1351_restart:
.annotate 'line', 567
    if_null rx1351_debug, debug_1036
    rx1351_cur."!cursor_debug"("NEXT", "metachar:sym<{ }>")
  debug_1036:
  rx1351_fail:
    (rx1351_rep, rx1351_pos, $I10, $P10) = rx1351_cur."!mark_fail"(0)
    lt rx1351_pos, -1, rx1351_done
    eq rx1351_pos, -1, rx1351_fail
    jump $I10
  rx1351_done:
    rx1351_cur."!cursor_fail"()
    if_null rx1351_debug, debug_1037
    rx1351_cur."!cursor_debug"("FAIL", "metachar:sym<{ }>")
  debug_1037:
    .return (rx1351_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("354_1283874336.57842") :method
.annotate 'line', 567
    new $P1353, "ResizablePMCArray"
    push $P1353, "{"
    .return ($P1353)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("355_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .const 'Sub' $P1361 = "357_1283874336.57842" 
    capture_lex $P1361
    .local string rx1356_tgt
    .local int rx1356_pos
    .local int rx1356_off
    .local int rx1356_eos
    .local int rx1356_rep
    .local pmc rx1356_cur
    .local pmc rx1356_debug
    (rx1356_cur, rx1356_pos, rx1356_tgt, $I10) = self."!cursor_start"()
    getattribute rx1356_debug, rx1356_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1356_cur
    .local pmc match
    .lex "$/", match
    length rx1356_eos, rx1356_tgt
    gt rx1356_pos, rx1356_eos, rx1356_done
    set rx1356_off, 0
    lt rx1356_pos, 2, rx1356_start
    sub rx1356_off, rx1356_pos, 1
    substr rx1356_tgt, rx1356_tgt, rx1356_off
  rx1356_start:
    eq $I10, 1, rx1356_restart
    if_null rx1356_debug, debug_1038
    rx1356_cur."!cursor_debug"("START", "metachar:sym<nqpvar>")
  debug_1038:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1359_done
    goto rxscan1359_scan
  rxscan1359_loop:
    ($P10) = rx1356_cur."from"()
    inc $P10
    set rx1356_pos, $P10
    ge rx1356_pos, rx1356_eos, rxscan1359_done
  rxscan1359_scan:
    set_addr $I10, rxscan1359_loop
    rx1356_cur."!mark_push"(0, rx1356_pos, $I10)
  rxscan1359_done:
.annotate 'line', 577
  # rx enumcharlist negate=0 zerowidth
    ge rx1356_pos, rx1356_eos, rx1356_fail
    sub $I10, rx1356_pos, rx1356_off
    substr $S10, rx1356_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1356_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1356_cur."!cursor_pos"(rx1356_pos)
    .const 'Sub' $P1361 = "357_1283874336.57842" 
    capture_lex $P1361
    $P10 = rx1356_cur."before"($P1361)
    unless $P10, rx1356_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1356_cur."!cursor_pos"(rx1356_pos)
    $P10 = rx1356_cur."LANG"("MAIN", "variable")
    unless $P10, rx1356_fail
    rx1356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1356_pos = $P10."pos"()
.annotate 'line', 576
  # rx pass
    rx1356_cur."!cursor_pass"(rx1356_pos, "metachar:sym<nqpvar>")
    if_null rx1356_debug, debug_1043
    rx1356_cur."!cursor_debug"("PASS", "metachar:sym<nqpvar>", " at pos=", rx1356_pos)
  debug_1043:
    .return (rx1356_cur)
  rx1356_restart:
.annotate 'line', 567
    if_null rx1356_debug, debug_1044
    rx1356_cur."!cursor_debug"("NEXT", "metachar:sym<nqpvar>")
  debug_1044:
  rx1356_fail:
    (rx1356_rep, rx1356_pos, $I10, $P10) = rx1356_cur."!mark_fail"(0)
    lt rx1356_pos, -1, rx1356_done
    eq rx1356_pos, -1, rx1356_fail
    jump $I10
  rx1356_done:
    rx1356_cur."!cursor_fail"()
    if_null rx1356_debug, debug_1045
    rx1356_cur."!cursor_debug"("FAIL", "metachar:sym<nqpvar>")
  debug_1045:
    .return (rx1356_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("356_1283874336.57842") :method
.annotate 'line', 567
    new $P1358, "ResizablePMCArray"
    push $P1358, "$"
    push $P1358, "@"
    .return ($P1358)
.end


.namespace ["NQP";"Regex"]
.sub "_block1360"  :anon :subid("357_1283874336.57842") :method :outer("355_1283874336.57842")
.annotate 'line', 577
    .local string rx1362_tgt
    .local int rx1362_pos
    .local int rx1362_off
    .local int rx1362_eos
    .local int rx1362_rep
    .local pmc rx1362_cur
    .local pmc rx1362_debug
    (rx1362_cur, rx1362_pos, rx1362_tgt, $I10) = self."!cursor_start"()
    getattribute rx1362_debug, rx1362_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1362_cur
    .local pmc match
    .lex "$/", match
    length rx1362_eos, rx1362_tgt
    gt rx1362_pos, rx1362_eos, rx1362_done
    set rx1362_off, 0
    lt rx1362_pos, 2, rx1362_start
    sub rx1362_off, rx1362_pos, 1
    substr rx1362_tgt, rx1362_tgt, rx1362_off
  rx1362_start:
    eq $I10, 1, rx1362_restart
    if_null rx1362_debug, debug_1039
    rx1362_cur."!cursor_debug"("START", "")
  debug_1039:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1363_done
    goto rxscan1363_scan
  rxscan1363_loop:
    ($P10) = rx1362_cur."from"()
    inc $P10
    set rx1362_pos, $P10
    ge rx1362_pos, rx1362_eos, rxscan1363_done
  rxscan1363_scan:
    set_addr $I10, rxscan1363_loop
    rx1362_cur."!mark_push"(0, rx1362_pos, $I10)
  rxscan1363_done:
  # rx charclass .
    ge rx1362_pos, rx1362_eos, rx1362_fail
    inc rx1362_pos
  # rx charclass w
    ge rx1362_pos, rx1362_eos, rx1362_fail
    sub $I10, rx1362_pos, rx1362_off
    is_cclass $I11, 8192, rx1362_tgt, $I10
    unless $I11, rx1362_fail
    inc rx1362_pos
  # rx pass
    rx1362_cur."!cursor_pass"(rx1362_pos, "")
    if_null rx1362_debug, debug_1040
    rx1362_cur."!cursor_debug"("PASS", "", " at pos=", rx1362_pos)
  debug_1040:
    .return (rx1362_cur)
  rx1362_restart:
    if_null rx1362_debug, debug_1041
    rx1362_cur."!cursor_debug"("NEXT", "")
  debug_1041:
  rx1362_fail:
    (rx1362_rep, rx1362_pos, $I10, $P10) = rx1362_cur."!mark_fail"(0)
    lt rx1362_pos, -1, rx1362_done
    eq rx1362_pos, -1, rx1362_fail
    jump $I10
  rx1362_done:
    rx1362_cur."!cursor_fail"()
    if_null rx1362_debug, debug_1042
    rx1362_cur."!cursor_debug"("FAIL", "")
  debug_1042:
    .return (rx1362_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("358_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .local string rx1365_tgt
    .local int rx1365_pos
    .local int rx1365_off
    .local int rx1365_eos
    .local int rx1365_rep
    .local pmc rx1365_cur
    .local pmc rx1365_debug
    (rx1365_cur, rx1365_pos, rx1365_tgt, $I10) = self."!cursor_start"()
    getattribute rx1365_debug, rx1365_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1365_cur
    .local pmc match
    .lex "$/", match
    length rx1365_eos, rx1365_tgt
    gt rx1365_pos, rx1365_eos, rx1365_done
    set rx1365_off, 0
    lt rx1365_pos, 2, rx1365_start
    sub rx1365_off, rx1365_pos, 1
    substr rx1365_tgt, rx1365_tgt, rx1365_off
  rx1365_start:
    eq $I10, 1, rx1365_restart
    if_null rx1365_debug, debug_1046
    rx1365_cur."!cursor_debug"("START", "assertion:sym<{ }>")
  debug_1046:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1368_done
    goto rxscan1368_scan
  rxscan1368_loop:
    ($P10) = rx1365_cur."from"()
    inc $P10
    set rx1365_pos, $P10
    ge rx1365_pos, rx1365_eos, rxscan1368_done
  rxscan1368_scan:
    set_addr $I10, rxscan1368_loop
    rx1365_cur."!mark_push"(0, rx1365_pos, $I10)
  rxscan1368_done:
.annotate 'line', 581
  # rx enumcharlist negate=0 zerowidth
    ge rx1365_pos, rx1365_eos, rx1365_fail
    sub $I10, rx1365_pos, rx1365_off
    substr $S10, rx1365_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1365_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1365_cur."!cursor_pos"(rx1365_pos)
    $P10 = rx1365_cur."codeblock"()
    unless $P10, rx1365_fail
    rx1365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1365_pos = $P10."pos"()
.annotate 'line', 580
  # rx pass
    rx1365_cur."!cursor_pass"(rx1365_pos, "assertion:sym<{ }>")
    if_null rx1365_debug, debug_1047
    rx1365_cur."!cursor_debug"("PASS", "assertion:sym<{ }>", " at pos=", rx1365_pos)
  debug_1047:
    .return (rx1365_cur)
  rx1365_restart:
.annotate 'line', 567
    if_null rx1365_debug, debug_1048
    rx1365_cur."!cursor_debug"("NEXT", "assertion:sym<{ }>")
  debug_1048:
  rx1365_fail:
    (rx1365_rep, rx1365_pos, $I10, $P10) = rx1365_cur."!mark_fail"(0)
    lt rx1365_pos, -1, rx1365_done
    eq rx1365_pos, -1, rx1365_fail
    jump $I10
  rx1365_done:
    rx1365_cur."!cursor_fail"()
    if_null rx1365_debug, debug_1049
    rx1365_cur."!cursor_debug"("FAIL", "assertion:sym<{ }>")
  debug_1049:
    .return (rx1365_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("359_1283874336.57842") :method
.annotate 'line', 567
    new $P1367, "ResizablePMCArray"
    push $P1367, "{"
    .return ($P1367)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("360_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .const 'Sub' $P1375 = "362_1283874336.57842" 
    capture_lex $P1375
    .local string rx1370_tgt
    .local int rx1370_pos
    .local int rx1370_off
    .local int rx1370_eos
    .local int rx1370_rep
    .local pmc rx1370_cur
    .local pmc rx1370_debug
    (rx1370_cur, rx1370_pos, rx1370_tgt, $I10) = self."!cursor_start"()
    getattribute rx1370_debug, rx1370_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1370_cur
    .local pmc match
    .lex "$/", match
    length rx1370_eos, rx1370_tgt
    gt rx1370_pos, rx1370_eos, rx1370_done
    set rx1370_off, 0
    lt rx1370_pos, 2, rx1370_start
    sub rx1370_off, rx1370_pos, 1
    substr rx1370_tgt, rx1370_tgt, rx1370_off
  rx1370_start:
    eq $I10, 1, rx1370_restart
    if_null rx1370_debug, debug_1050
    rx1370_cur."!cursor_debug"("START", "assertion:sym<?{ }>")
  debug_1050:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1373_done
    goto rxscan1373_scan
  rxscan1373_loop:
    ($P10) = rx1370_cur."from"()
    inc $P10
    set rx1370_pos, $P10
    ge rx1370_pos, rx1370_eos, rxscan1373_done
  rxscan1373_scan:
    set_addr $I10, rxscan1373_loop
    rx1370_cur."!mark_push"(0, rx1370_pos, $I10)
  rxscan1373_done:
.annotate 'line', 585
  # rx subcapture "zw"
    set_addr $I10, rxcap_1378_fail
    rx1370_cur."!mark_push"(0, rx1370_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1370_pos, rx1370_eos, rx1370_fail
    sub $I10, rx1370_pos, rx1370_off
    substr $S10, rx1370_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1370_fail
    inc rx1370_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1370_cur."!cursor_pos"(rx1370_pos)
    .const 'Sub' $P1375 = "362_1283874336.57842" 
    capture_lex $P1375
    $P10 = rx1370_cur."before"($P1375)
    unless $P10, rx1370_fail
    set_addr $I10, rxcap_1378_fail
    ($I12, $I11) = rx1370_cur."!mark_peek"($I10)
    rx1370_cur."!cursor_pos"($I11)
    ($P10) = rx1370_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1370_pos, "")
    rx1370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1378_done
  rxcap_1378_fail:
    goto rx1370_fail
  rxcap_1378_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1370_cur."!cursor_pos"(rx1370_pos)
    $P10 = rx1370_cur."codeblock"()
    unless $P10, rx1370_fail
    rx1370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1370_pos = $P10."pos"()
.annotate 'line', 584
  # rx pass
    rx1370_cur."!cursor_pass"(rx1370_pos, "assertion:sym<?{ }>")
    if_null rx1370_debug, debug_1055
    rx1370_cur."!cursor_debug"("PASS", "assertion:sym<?{ }>", " at pos=", rx1370_pos)
  debug_1055:
    .return (rx1370_cur)
  rx1370_restart:
.annotate 'line', 567
    if_null rx1370_debug, debug_1056
    rx1370_cur."!cursor_debug"("NEXT", "assertion:sym<?{ }>")
  debug_1056:
  rx1370_fail:
    (rx1370_rep, rx1370_pos, $I10, $P10) = rx1370_cur."!mark_fail"(0)
    lt rx1370_pos, -1, rx1370_done
    eq rx1370_pos, -1, rx1370_fail
    jump $I10
  rx1370_done:
    rx1370_cur."!cursor_fail"()
    if_null rx1370_debug, debug_1057
    rx1370_cur."!cursor_debug"("FAIL", "assertion:sym<?{ }>")
  debug_1057:
    .return (rx1370_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("361_1283874336.57842") :method
.annotate 'line', 567
    new $P1372, "ResizablePMCArray"
    push $P1372, "!"
    push $P1372, "?"
    .return ($P1372)
.end


.namespace ["NQP";"Regex"]
.sub "_block1374"  :anon :subid("362_1283874336.57842") :method :outer("360_1283874336.57842")
.annotate 'line', 585
    .local string rx1376_tgt
    .local int rx1376_pos
    .local int rx1376_off
    .local int rx1376_eos
    .local int rx1376_rep
    .local pmc rx1376_cur
    .local pmc rx1376_debug
    (rx1376_cur, rx1376_pos, rx1376_tgt, $I10) = self."!cursor_start"()
    getattribute rx1376_debug, rx1376_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1376_cur
    .local pmc match
    .lex "$/", match
    length rx1376_eos, rx1376_tgt
    gt rx1376_pos, rx1376_eos, rx1376_done
    set rx1376_off, 0
    lt rx1376_pos, 2, rx1376_start
    sub rx1376_off, rx1376_pos, 1
    substr rx1376_tgt, rx1376_tgt, rx1376_off
  rx1376_start:
    eq $I10, 1, rx1376_restart
    if_null rx1376_debug, debug_1051
    rx1376_cur."!cursor_debug"("START", "")
  debug_1051:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1377_done
    goto rxscan1377_scan
  rxscan1377_loop:
    ($P10) = rx1376_cur."from"()
    inc $P10
    set rx1376_pos, $P10
    ge rx1376_pos, rx1376_eos, rxscan1377_done
  rxscan1377_scan:
    set_addr $I10, rxscan1377_loop
    rx1376_cur."!mark_push"(0, rx1376_pos, $I10)
  rxscan1377_done:
  # rx literal  "{"
    add $I11, rx1376_pos, 1
    gt $I11, rx1376_eos, rx1376_fail
    sub $I11, rx1376_pos, rx1376_off
    ord $I11, rx1376_tgt, $I11
    ne $I11, 123, rx1376_fail
    add rx1376_pos, 1
  # rx pass
    rx1376_cur."!cursor_pass"(rx1376_pos, "")
    if_null rx1376_debug, debug_1052
    rx1376_cur."!cursor_debug"("PASS", "", " at pos=", rx1376_pos)
  debug_1052:
    .return (rx1376_cur)
  rx1376_restart:
    if_null rx1376_debug, debug_1053
    rx1376_cur."!cursor_debug"("NEXT", "")
  debug_1053:
  rx1376_fail:
    (rx1376_rep, rx1376_pos, $I10, $P10) = rx1376_cur."!mark_fail"(0)
    lt rx1376_pos, -1, rx1376_done
    eq rx1376_pos, -1, rx1376_fail
    jump $I10
  rx1376_done:
    rx1376_cur."!cursor_fail"()
    if_null rx1376_debug, debug_1054
    rx1376_cur."!cursor_debug"("FAIL", "")
  debug_1054:
    .return (rx1376_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("363_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .const 'Sub' $P1388 = "365_1283874336.57842" 
    capture_lex $P1388
    .local string rx1380_tgt
    .local int rx1380_pos
    .local int rx1380_off
    .local int rx1380_eos
    .local int rx1380_rep
    .local pmc rx1380_cur
    .local pmc rx1380_debug
    (rx1380_cur, rx1380_pos, rx1380_tgt, $I10) = self."!cursor_start"()
    rx1380_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
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
    if_null rx1380_debug, debug_1058
    rx1380_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_1058:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1384_done
    goto rxscan1384_scan
  rxscan1384_loop:
    ($P10) = rx1380_cur."from"()
    inc $P10
    set rx1380_pos, $P10
    ge rx1380_pos, rx1380_eos, rxscan1384_done
  rxscan1384_scan:
    set_addr $I10, rxscan1384_loop
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  rxscan1384_done:
.annotate 'line', 589
  # rx subrule "identifier" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."identifier"()
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1380_pos = $P10."pos"()
.annotate 'line', 596
  # rx rxquantr1385 ** 0..1
    set_addr $I10, rxquantr1385_done
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  rxquantr1385_loop:
  alt1386_0:
.annotate 'line', 590
    set_addr $I10, alt1386_1
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 591
  # rx subrule "before" subtype=zerowidth negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    .const 'Sub' $P1388 = "365_1283874336.57842" 
    capture_lex $P1388
    $P10 = rx1380_cur."before"($P1388)
    unless $P10, rx1380_fail
    goto alt1386_end
  alt1386_1:
    set_addr $I10, alt1386_2
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 592
  # rx literal  "="
    add $I11, rx1380_pos, 1
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    ord $I11, rx1380_tgt, $I11
    ne $I11, 61, rx1380_fail
    add rx1380_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."assertion"()
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1380_pos = $P10."pos"()
    goto alt1386_end
  alt1386_2:
    set_addr $I10, alt1386_3
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 593
  # rx literal  ":"
    add $I11, rx1380_pos, 1
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    ord $I11, rx1380_tgt, $I11
    ne $I11, 58, rx1380_fail
    add rx1380_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."arglist"()
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1380_pos = $P10."pos"()
    goto alt1386_end
  alt1386_3:
    set_addr $I10, alt1386_4
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 594
  # rx literal  "("
    add $I11, rx1380_pos, 1
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    ord $I11, rx1380_tgt, $I11
    ne $I11, 40, rx1380_fail
    add rx1380_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1380_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1380_pos, 1
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    ord $I11, rx1380_tgt, $I11
    ne $I11, 41, rx1380_fail
    add rx1380_pos, 1
    goto alt1386_end
  alt1386_4:
.annotate 'line', 595
  # rx subrule "normspace" subtype=method negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."normspace"()
    unless $P10, rx1380_fail
    rx1380_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."nibbler"()
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1380_pos = $P10."pos"()
  alt1386_end:
.annotate 'line', 596
    set_addr $I10, rxquantr1385_done
    (rx1380_rep) = rx1380_cur."!mark_commit"($I10)
  rxquantr1385_done:
.annotate 'line', 588
  # rx pass
    rx1380_cur."!cursor_pass"(rx1380_pos, "assertion:sym<name>")
    if_null rx1380_debug, debug_1063
    rx1380_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx1380_pos)
  debug_1063:
    .return (rx1380_cur)
  rx1380_restart:
.annotate 'line', 567
    if_null rx1380_debug, debug_1064
    rx1380_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_1064:
  rx1380_fail:
    (rx1380_rep, rx1380_pos, $I10, $P10) = rx1380_cur."!mark_fail"(0)
    lt rx1380_pos, -1, rx1380_done
    eq rx1380_pos, -1, rx1380_fail
    jump $I10
  rx1380_done:
    rx1380_cur."!cursor_fail"()
    if_null rx1380_debug, debug_1065
    rx1380_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_1065:
    .return (rx1380_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("364_1283874336.57842") :method
.annotate 'line', 567
    $P1382 = self."!PREFIX__!subrule"("identifier", "")
    new $P1383, "ResizablePMCArray"
    push $P1383, $P1382
    .return ($P1383)
.end


.namespace ["NQP";"Regex"]
.sub "_block1387"  :anon :subid("365_1283874336.57842") :method :outer("363_1283874336.57842")
.annotate 'line', 591
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
    if_null rx1389_debug, debug_1059
    rx1389_cur."!cursor_debug"("START", "")
  debug_1059:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1390_done
    goto rxscan1390_scan
  rxscan1390_loop:
    ($P10) = rx1389_cur."from"()
    inc $P10
    set rx1389_pos, $P10
    ge rx1389_pos, rx1389_eos, rxscan1390_done
  rxscan1390_scan:
    set_addr $I10, rxscan1390_loop
    rx1389_cur."!mark_push"(0, rx1389_pos, $I10)
  rxscan1390_done:
  # rx literal  ">"
    add $I11, rx1389_pos, 1
    gt $I11, rx1389_eos, rx1389_fail
    sub $I11, rx1389_pos, rx1389_off
    ord $I11, rx1389_tgt, $I11
    ne $I11, 62, rx1389_fail
    add rx1389_pos, 1
  # rx pass
    rx1389_cur."!cursor_pass"(rx1389_pos, "")
    if_null rx1389_debug, debug_1060
    rx1389_cur."!cursor_debug"("PASS", "", " at pos=", rx1389_pos)
  debug_1060:
    .return (rx1389_cur)
  rx1389_restart:
    if_null rx1389_debug, debug_1061
    rx1389_cur."!cursor_debug"("NEXT", "")
  debug_1061:
  rx1389_fail:
    (rx1389_rep, rx1389_pos, $I10, $P10) = rx1389_cur."!mark_fail"(0)
    lt rx1389_pos, -1, rx1389_done
    eq rx1389_pos, -1, rx1389_fail
    jump $I10
  rx1389_done:
    rx1389_cur."!cursor_fail"()
    if_null rx1389_debug, debug_1062
    rx1389_cur."!cursor_debug"("FAIL", "")
  debug_1062:
    .return (rx1389_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("366_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .local string rx1392_tgt
    .local int rx1392_pos
    .local int rx1392_off
    .local int rx1392_eos
    .local int rx1392_rep
    .local pmc rx1392_cur
    .local pmc rx1392_debug
    (rx1392_cur, rx1392_pos, rx1392_tgt, $I10) = self."!cursor_start"()
    getattribute rx1392_debug, rx1392_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1392_cur
    .local pmc match
    .lex "$/", match
    length rx1392_eos, rx1392_tgt
    gt rx1392_pos, rx1392_eos, rx1392_done
    set rx1392_off, 0
    lt rx1392_pos, 2, rx1392_start
    sub rx1392_off, rx1392_pos, 1
    substr rx1392_tgt, rx1392_tgt, rx1392_off
  rx1392_start:
    eq $I10, 1, rx1392_restart
    if_null rx1392_debug, debug_1066
    rx1392_cur."!cursor_debug"("START", "assertion:sym<var>")
  debug_1066:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1395_done
    goto rxscan1395_scan
  rxscan1395_loop:
    ($P10) = rx1392_cur."from"()
    inc $P10
    set rx1392_pos, $P10
    ge rx1392_pos, rx1392_eos, rxscan1395_done
  rxscan1395_scan:
    set_addr $I10, rxscan1395_loop
    rx1392_cur."!mark_push"(0, rx1392_pos, $I10)
  rxscan1395_done:
.annotate 'line', 600
  # rx enumcharlist negate=0 zerowidth
    ge rx1392_pos, rx1392_eos, rx1392_fail
    sub $I10, rx1392_pos, rx1392_off
    substr $S10, rx1392_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1392_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1392_cur."!cursor_pos"(rx1392_pos)
    $P10 = rx1392_cur."LANG"("MAIN", "variable")
    unless $P10, rx1392_fail
    rx1392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1392_pos = $P10."pos"()
.annotate 'line', 599
  # rx pass
    rx1392_cur."!cursor_pass"(rx1392_pos, "assertion:sym<var>")
    if_null rx1392_debug, debug_1067
    rx1392_cur."!cursor_debug"("PASS", "assertion:sym<var>", " at pos=", rx1392_pos)
  debug_1067:
    .return (rx1392_cur)
  rx1392_restart:
.annotate 'line', 567
    if_null rx1392_debug, debug_1068
    rx1392_cur."!cursor_debug"("NEXT", "assertion:sym<var>")
  debug_1068:
  rx1392_fail:
    (rx1392_rep, rx1392_pos, $I10, $P10) = rx1392_cur."!mark_fail"(0)
    lt rx1392_pos, -1, rx1392_done
    eq rx1392_pos, -1, rx1392_fail
    jump $I10
  rx1392_done:
    rx1392_cur."!cursor_fail"()
    if_null rx1392_debug, debug_1069
    rx1392_cur."!cursor_debug"("FAIL", "assertion:sym<var>")
  debug_1069:
    .return (rx1392_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("367_1283874336.57842") :method
.annotate 'line', 567
    new $P1394, "ResizablePMCArray"
    push $P1394, "$"
    push $P1394, "@"
    .return ($P1394)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("368_1283874336.57842") :method :outer("349_1283874336.57842")
.annotate 'line', 567
    .local string rx1397_tgt
    .local int rx1397_pos
    .local int rx1397_off
    .local int rx1397_eos
    .local int rx1397_rep
    .local pmc rx1397_cur
    .local pmc rx1397_debug
    (rx1397_cur, rx1397_pos, rx1397_tgt, $I10) = self."!cursor_start"()
    getattribute rx1397_debug, rx1397_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1397_cur
    .local pmc match
    .lex "$/", match
    length rx1397_eos, rx1397_tgt
    gt rx1397_pos, rx1397_eos, rx1397_done
    set rx1397_off, 0
    lt rx1397_pos, 2, rx1397_start
    sub rx1397_off, rx1397_pos, 1
    substr rx1397_tgt, rx1397_tgt, rx1397_off
  rx1397_start:
    eq $I10, 1, rx1397_restart
    if_null rx1397_debug, debug_1070
    rx1397_cur."!cursor_debug"("START", "codeblock")
  debug_1070:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1401_done
    goto rxscan1401_scan
  rxscan1401_loop:
    ($P10) = rx1397_cur."from"()
    inc $P10
    set rx1397_pos, $P10
    ge rx1397_pos, rx1397_eos, rxscan1401_done
  rxscan1401_scan:
    set_addr $I10, rxscan1401_loop
    rx1397_cur."!mark_push"(0, rx1397_pos, $I10)
  rxscan1401_done:
.annotate 'line', 604
  # rx subrule "LANG" subtype=capture negate=
    rx1397_cur."!cursor_pos"(rx1397_pos)
    $P10 = rx1397_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1397_fail
    rx1397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1397_pos = $P10."pos"()
.annotate 'line', 603
  # rx pass
    rx1397_cur."!cursor_pass"(rx1397_pos, "codeblock")
    if_null rx1397_debug, debug_1071
    rx1397_cur."!cursor_debug"("PASS", "codeblock", " at pos=", rx1397_pos)
  debug_1071:
    .return (rx1397_cur)
  rx1397_restart:
.annotate 'line', 567
    if_null rx1397_debug, debug_1072
    rx1397_cur."!cursor_debug"("NEXT", "codeblock")
  debug_1072:
  rx1397_fail:
    (rx1397_rep, rx1397_pos, $I10, $P10) = rx1397_cur."!mark_fail"(0)
    lt rx1397_pos, -1, rx1397_done
    eq rx1397_pos, -1, rx1397_fail
    jump $I10
  rx1397_done:
    rx1397_cur."!cursor_fail"()
    if_null rx1397_debug, debug_1073
    rx1397_cur."!cursor_debug"("FAIL", "codeblock")
  debug_1073:
    .return (rx1397_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("369_1283874336.57842") :method
.annotate 'line', 567
    $P1399 = self."!PREFIX__!subrule"("LANG", "")
    new $P1400, "ResizablePMCArray"
    push $P1400, $P1399
    .return ($P1400)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1403" :load :anon :subid("370_1283874336.57842")
.annotate 'line', 4
    .const 'Sub' $P1405 = "11_1283874336.57842" 
    $P1406 = $P1405()
    .return ($P1406)
.end


.namespace []
.sub "_block1424" :load :anon :subid("371_1283874336.57842")
.annotate 'line', 1
    .const 'Sub' $P1426 = "10_1283874336.57842" 
    $P1427 = $P1426()
    .return ($P1427)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1283874343.0915")
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
    $P2464 = $P14()
.annotate 'line', 1
    .return ($P2464)
    .const 'Sub' $P2466 = "143_1283874343.0915" 
    .return ($P2466)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1283874343.0915")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283874343.0915" 
    .local pmc block
    set block, $P12
    $P2469 = get_root_global ["parrot"], "P6metaclass"
    $P2469."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1283874343.0915") :outer("10_1283874343.0915")
.annotate 'line', 3
    .const 'Sub' $P2460 = "142_1283874343.0915" 
    capture_lex $P2460
    get_hll_global $P2343, ["NQP";"RegexActions"], "_block2342" 
    capture_lex $P2343
    .const 'Sub' $P2332 = "132_1283874343.0915" 
    capture_lex $P2332
    .const 'Sub' $P2325 = "131_1283874343.0915" 
    capture_lex $P2325
    .const 'Sub' $P2318 = "130_1283874343.0915" 
    capture_lex $P2318
    .const 'Sub' $P2311 = "129_1283874343.0915" 
    capture_lex $P2311
    .const 'Sub' $P2298 = "128_1283874343.0915" 
    capture_lex $P2298
    .const 'Sub' $P2288 = "127_1283874343.0915" 
    capture_lex $P2288
    .const 'Sub' $P2278 = "126_1283874343.0915" 
    capture_lex $P2278
    .const 'Sub' $P2268 = "125_1283874343.0915" 
    capture_lex $P2268
    .const 'Sub' $P2261 = "124_1283874343.0915" 
    capture_lex $P2261
    .const 'Sub' $P2247 = "123_1283874343.0915" 
    capture_lex $P2247
    .const 'Sub' $P2237 = "122_1283874343.0915" 
    capture_lex $P2237
    .const 'Sub' $P2200 = "121_1283874343.0915" 
    capture_lex $P2200
    .const 'Sub' $P2186 = "120_1283874343.0915" 
    capture_lex $P2186
    .const 'Sub' $P2176 = "119_1283874343.0915" 
    capture_lex $P2176
    .const 'Sub' $P2166 = "118_1283874343.0915" 
    capture_lex $P2166
    .const 'Sub' $P2156 = "117_1283874343.0915" 
    capture_lex $P2156
    .const 'Sub' $P2146 = "116_1283874343.0915" 
    capture_lex $P2146
    .const 'Sub' $P2136 = "115_1283874343.0915" 
    capture_lex $P2136
    .const 'Sub' $P2108 = "114_1283874343.0915" 
    capture_lex $P2108
    .const 'Sub' $P2091 = "113_1283874343.0915" 
    capture_lex $P2091
    .const 'Sub' $P2081 = "112_1283874343.0915" 
    capture_lex $P2081
    .const 'Sub' $P2068 = "111_1283874343.0915" 
    capture_lex $P2068
    .const 'Sub' $P2055 = "110_1283874343.0915" 
    capture_lex $P2055
    .const 'Sub' $P2042 = "109_1283874343.0915" 
    capture_lex $P2042
    .const 'Sub' $P2032 = "108_1283874343.0915" 
    capture_lex $P2032
    .const 'Sub' $P2003 = "107_1283874343.0915" 
    capture_lex $P2003
    .const 'Sub' $P1979 = "106_1283874343.0915" 
    capture_lex $P1979
    .const 'Sub' $P1969 = "105_1283874343.0915" 
    capture_lex $P1969
    .const 'Sub' $P1959 = "104_1283874343.0915" 
    capture_lex $P1959
    .const 'Sub' $P1932 = "103_1283874343.0915" 
    capture_lex $P1932
    .const 'Sub' $P1914 = "102_1283874343.0915" 
    capture_lex $P1914
    .const 'Sub' $P1904 = "101_1283874343.0915" 
    capture_lex $P1904
    .const 'Sub' $P1800 = "98_1283874343.0915" 
    capture_lex $P1800
    .const 'Sub' $P1790 = "97_1283874343.0915" 
    capture_lex $P1790
    .const 'Sub' $P1761 = "96_1283874343.0915" 
    capture_lex $P1761
    .const 'Sub' $P1719 = "95_1283874343.0915" 
    capture_lex $P1719
    .const 'Sub' $P1703 = "94_1283874343.0915" 
    capture_lex $P1703
    .const 'Sub' $P1694 = "93_1283874343.0915" 
    capture_lex $P1694
    .const 'Sub' $P1662 = "92_1283874343.0915" 
    capture_lex $P1662
    .const 'Sub' $P1563 = "89_1283874343.0915" 
    capture_lex $P1563
    .const 'Sub' $P1546 = "88_1283874343.0915" 
    capture_lex $P1546
    .const 'Sub' $P1526 = "87_1283874343.0915" 
    capture_lex $P1526
    .const 'Sub' $P1414 = "84_1283874343.0915" 
    capture_lex $P1414
    .const 'Sub' $P1345 = "80_1283874343.0915" 
    capture_lex $P1345
    .const 'Sub' $P1300 = "78_1283874343.0915" 
    capture_lex $P1300
    .const 'Sub' $P1250 = "76_1283874343.0915" 
    capture_lex $P1250
    .const 'Sub' $P1240 = "75_1283874343.0915" 
    capture_lex $P1240
    .const 'Sub' $P1230 = "74_1283874343.0915" 
    capture_lex $P1230
    .const 'Sub' $P1159 = "72_1283874343.0915" 
    capture_lex $P1159
    .const 'Sub' $P1149 = "71_1283874343.0915" 
    capture_lex $P1149
    .const 'Sub' $P1132 = "70_1283874343.0915" 
    capture_lex $P1132
    .const 'Sub' $P1115 = "69_1283874343.0915" 
    capture_lex $P1115
    .const 'Sub' $P1098 = "68_1283874343.0915" 
    capture_lex $P1098
    .const 'Sub' $P1088 = "67_1283874343.0915" 
    capture_lex $P1088
    .const 'Sub' $P1078 = "66_1283874343.0915" 
    capture_lex $P1078
    .const 'Sub' $P1068 = "65_1283874343.0915" 
    capture_lex $P1068
    .const 'Sub' $P1044 = "64_1283874343.0915" 
    capture_lex $P1044
    .const 'Sub' $P991 = "63_1283874343.0915" 
    capture_lex $P991
    .const 'Sub' $P981 = "62_1283874343.0915" 
    capture_lex $P981
    .const 'Sub' $P892 = "60_1283874343.0915" 
    capture_lex $P892
    .const 'Sub' $P866 = "59_1283874343.0915" 
    capture_lex $P866
    .const 'Sub' $P850 = "58_1283874343.0915" 
    capture_lex $P850
    .const 'Sub' $P840 = "57_1283874343.0915" 
    capture_lex $P840
    .const 'Sub' $P830 = "56_1283874343.0915" 
    capture_lex $P830
    .const 'Sub' $P820 = "55_1283874343.0915" 
    capture_lex $P820
    .const 'Sub' $P810 = "54_1283874343.0915" 
    capture_lex $P810
    .const 'Sub' $P800 = "53_1283874343.0915" 
    capture_lex $P800
    .const 'Sub' $P790 = "52_1283874343.0915" 
    capture_lex $P790
    .const 'Sub' $P780 = "51_1283874343.0915" 
    capture_lex $P780
    .const 'Sub' $P770 = "50_1283874343.0915" 
    capture_lex $P770
    .const 'Sub' $P760 = "49_1283874343.0915" 
    capture_lex $P760
    .const 'Sub' $P750 = "48_1283874343.0915" 
    capture_lex $P750
    .const 'Sub' $P740 = "47_1283874343.0915" 
    capture_lex $P740
    .const 'Sub' $P730 = "46_1283874343.0915" 
    capture_lex $P730
    .const 'Sub' $P720 = "45_1283874343.0915" 
    capture_lex $P720
    .const 'Sub' $P702 = "44_1283874343.0915" 
    capture_lex $P702
    .const 'Sub' $P667 = "43_1283874343.0915" 
    capture_lex $P667
    .const 'Sub' $P651 = "42_1283874343.0915" 
    capture_lex $P651
    .const 'Sub' $P630 = "41_1283874343.0915" 
    capture_lex $P630
    .const 'Sub' $P610 = "40_1283874343.0915" 
    capture_lex $P610
    .const 'Sub' $P597 = "39_1283874343.0915" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1283874343.0915" 
    capture_lex $P571
    .const 'Sub' $P535 = "37_1283874343.0915" 
    capture_lex $P535
    .const 'Sub' $P518 = "36_1283874343.0915" 
    capture_lex $P518
    .const 'Sub' $P504 = "35_1283874343.0915" 
    capture_lex $P504
    .const 'Sub' $P451 = "33_1283874343.0915" 
    capture_lex $P451
    .const 'Sub' $P440 = "32_1283874343.0915" 
    capture_lex $P440
    .const 'Sub' $P427 = "31_1283874343.0915" 
    capture_lex $P427
    .const 'Sub' $P407 = "30_1283874343.0915" 
    capture_lex $P407
    .const 'Sub' $P397 = "29_1283874343.0915" 
    capture_lex $P397
    .const 'Sub' $P387 = "28_1283874343.0915" 
    capture_lex $P387
    .const 'Sub' $P371 = "27_1283874343.0915" 
    capture_lex $P371
    .const 'Sub' $P288 = "25_1283874343.0915" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1283874343.0915" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1283874343.0915" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1283874343.0915" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1283874343.0915" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1283874343.0915" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1283874343.0915" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1283874343.0915" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1283874343.0915" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1283874343.0915" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1283874343.0915" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1283874343.0915" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1283874343.0915" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1283874343.0915" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1283874343.0915" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 223
    .const 'Sub' $P100 = "18_1283874343.0915" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 836
    .const 'Sub' $P151 = "19_1283874343.0915" 
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
.annotate 'line', 827
    find_lex $P2310, "control"
.annotate 'line', 854
    get_hll_global $P2343, ["NQP";"RegexActions"], "_block2342" 
    capture_lex $P2343
    $P2454 = $P2343()
.annotate 'line', 3
    .return ($P2454)
    .const 'Sub' $P2456 = "141_1283874343.0915" 
    .return ($P2456)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1283874343.0915")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2460 = "142_1283874343.0915" 
    capture_lex $P2460
    $P2460()
    $P2463 = get_root_global ["parrot"], "P6metaclass"
    $P2463."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2459"  :anon :subid("142_1283874343.0915") :outer("11_1283874343.0915")
.annotate 'line', 6
    get_global $P2461, "@BLOCK"
    unless_null $P2461, vivify_146
    $P2461 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2461
  vivify_146:
 $P2462 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2462
.annotate 'line', 5
    .return ($P2462)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1283874343.0915") :outer("11_1283874343.0915")
    .param pmc param_19
.annotate 'line', 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "block_immediate"  :subid("13_1283874343.0915") :outer("11_1283874343.0915")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1283874343.0915" 
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
    .const 'Sub' $P40 = "14_1283874343.0915" 
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
.sub "_block39"  :anon :subid("14_1283874343.0915") :outer("13_1283874343.0915")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1283874343.0915" 
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
    $P57."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P57
  loop56_test:
    unless $P45, loop56_done
    shift $P49, $P45
  loop56_redo:
    .const 'Sub' $P51 = "15_1283874343.0915" 
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
  for_undef_151:
.annotate 'line', 19
    find_lex $P59, "$stmts"
    store_lex "$block", $P59
.annotate 'line', 16
    .return ($P59)
.end


.namespace ["NQP";"Actions"]
.sub "_block50"  :anon :subid("15_1283874343.0915") :outer("14_1283874343.0915")
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
.sub "vivitype"  :subid("16_1283874343.0915") :outer("11_1283874343.0915")
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
.sub "colonpair_str"  :subid("17_1283874343.0915") :outer("11_1283874343.0915")
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
.sub "push_block_handler"  :subid("18_1283874343.0915") :outer("11_1283874343.0915")
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
    unless_null $P106, vivify_152
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_152:
    set $P107, $P106[0]
    unless_null $P107, vivify_153
    new $P107, "Undef"
  vivify_153:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 225
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
    unless_null $P129, vivify_156
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_156:
    set $P130, $P129[0]
    unless_null $P130, vivify_157
    new $P130, "Undef"
  vivify_157:
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
.sub "control"  :subid("19_1283874343.0915") :outer("11_1283874343.0915")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 836
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(.CONTROL_RETURN)
    push_eh $P153
    .lex "$/", param_154
    .lex "$type", param_155
.annotate 'line', 837
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 841
    get_hll_global $P159, ["PAST"], "Val"
    find_lex $P160, "$type"
    $P161 = $P159."new"($P160 :named("value"), "!except_types" :named("returns"))
    $P162 = $P157."new"(0, $P161, $P158 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 837
    $P163 = $P156."!make"($P162)
.annotate 'line', 836
    .return ($P163)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P175, vivify_158
    $P175 = root_new ['parrot';'Hash']
  vivify_158:
    set $P176, $P175["comp_unit"]
    unless_null $P176, vivify_159
    new $P176, "Undef"
  vivify_159:
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
.sub "deflongname"  :subid("21_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P187, vivify_160
    $P187 = root_new ['parrot';'Hash']
  vivify_160:
    set $P188, $P187["colonpair"]
    unless_null $P188, vivify_161
    new $P188, "Undef"
  vivify_161:
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
    unless_null $P189, vivify_162
    $P189 = root_new ['parrot';'Hash']
  vivify_162:
    set $P190, $P189["identifier"]
    unless_null $P190, vivify_163
    new $P190, "Undef"
  vivify_163:
    set $S191, $P190
    new $P192, 'String'
    set $P192, $S191
    concat $P193, $P192, ":"
    find_lex $P194, "$/"
    unless_null $P194, vivify_164
    $P194 = root_new ['parrot';'Hash']
  vivify_164:
    set $P195, $P194["colonpair"]
    unless_null $P195, vivify_165
    $P195 = root_new ['parrot';'ResizablePMCArray']
  vivify_165:
    set $P196, $P195[0]
    unless_null $P196, vivify_166
    new $P196, "Undef"
  vivify_166:
    $P197 = $P196."ast"()
    $S198 = $P197."named"()
    concat $P199, $P193, $S198
    concat $P200, $P199, "<"
.annotate 'line', 38
    find_lex $P201, "$/"
    unless_null $P201, vivify_167
    $P201 = root_new ['parrot';'Hash']
  vivify_167:
    set $P202, $P201["colonpair"]
    unless_null $P202, vivify_168
    $P202 = root_new ['parrot';'ResizablePMCArray']
  vivify_168:
    set $P203, $P202[0]
    unless_null $P203, vivify_169
    new $P203, "Undef"
  vivify_169:
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
.sub "comp_unit"  :subid("22_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P219, vivify_170
    $P219 = root_new ['parrot';'Hash']
  vivify_170:
    set $P220, $P219["statementlist"]
    unless_null $P220, vivify_171
    new $P220, "Undef"
  vivify_171:
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
.sub "statementlist"  :subid("23_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1283874343.0915" 
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
    unless_null $P254, vivify_172
    $P254 = root_new ['parrot';'Hash']
  vivify_172:
    set $P255, $P254["statement"]
    unless_null $P255, vivify_173
    new $P255, "Undef"
  vivify_173:
    unless $P255, if_253_end
.annotate 'line', 79
    find_lex $P257, "$/"
    unless_null $P257, vivify_174
    $P257 = root_new ['parrot';'Hash']
  vivify_174:
    set $P258, $P257["statement"]
    unless_null $P258, vivify_175
    new $P258, "Undef"
  vivify_175:
    defined $I259, $P258
    unless $I259, for_undef_176
    iter $P256, $P258
    new $P282, 'ExceptionHandler'
    set_addr $P282, loop281_handler
    $P282."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P282
  loop281_test:
    unless $P256, loop281_done
    shift $P260, $P256
  loop281_redo:
    .const 'Sub' $P262 = "24_1283874343.0915" 
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
  for_undef_176:
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
.sub "_block261"  :anon :subid("24_1283874343.0915") :outer("23_1283874343.0915")
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
    unless_null $P268, vivify_177
    $P268 = root_new ['parrot';'Hash']
  vivify_177:
    set $P269, $P268["sink"]
    unless_null $P269, vivify_178
    new $P269, "Undef"
  vivify_178:
    defined $I270, $P269
    unless $I270, if_267_end
    find_lex $P271, "$ast"
    unless_null $P271, vivify_179
    $P271 = root_new ['parrot';'Hash']
  vivify_179:
    set $P272, $P271["sink"]
    unless_null $P272, vivify_180
    new $P272, "Undef"
  vivify_180:
    store_lex "$ast", $P272
  if_267_end:
.annotate 'line', 82
    find_lex $P274, "$ast"
    unless_null $P274, vivify_181
    $P274 = root_new ['parrot';'Hash']
  vivify_181:
    set $P275, $P274["bareblock"]
    unless_null $P275, vivify_182
    new $P275, "Undef"
  vivify_182:
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
.sub "statement"  :subid("25_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1283874343.0915" 
    capture_lex $P300
    new $P290, 'ExceptionHandler'
    set_addr $P290, control_289
    $P290."handle_types"(.CONTROL_RETURN)
    push_eh $P290
    .lex "self", self
    .lex "$/", param_291
    if has_param_292, optparam_183
    new $P293, "Undef"
    set param_292, $P293
  optparam_183:
    .lex "$key", param_292
.annotate 'line', 90
    new $P294, "Undef"
    .lex "$past", $P294
.annotate 'line', 89
    find_lex $P295, "$past"
.annotate 'line', 91
    find_lex $P297, "$/"
    unless_null $P297, vivify_184
    $P297 = root_new ['parrot';'Hash']
  vivify_184:
    set $P298, $P297["EXPR"]
    unless_null $P298, vivify_185
    new $P298, "Undef"
  vivify_185:
    if $P298, if_296
.annotate 'line', 112
    find_lex $P361, "$/"
    unless_null $P361, vivify_186
    $P361 = root_new ['parrot';'Hash']
  vivify_186:
    set $P362, $P361["statement_control"]
    unless_null $P362, vivify_187
    new $P362, "Undef"
  vivify_187:
    if $P362, if_360
.annotate 'line', 113
    new $P366, "Integer"
    assign $P366, 0
    store_lex "$past", $P366
    goto if_360_end
  if_360:
.annotate 'line', 112
    find_lex $P363, "$/"
    unless_null $P363, vivify_188
    $P363 = root_new ['parrot';'Hash']
  vivify_188:
    set $P364, $P363["statement_control"]
    unless_null $P364, vivify_189
    new $P364, "Undef"
  vivify_189:
    $P365 = $P364."ast"()
    store_lex "$past", $P365
  if_360_end:
    goto if_296_end
  if_296:
.annotate 'line', 91
    .const 'Sub' $P300 = "26_1283874343.0915" 
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
.sub "_block299"  :anon :subid("26_1283874343.0915") :outer("25_1283874343.0915")
.annotate 'line', 92
    new $P301, "Undef"
    .lex "$mc", $P301
.annotate 'line', 93
    new $P302, "Undef"
    .lex "$ml", $P302
.annotate 'line', 92
    find_lex $P303, "$/"
    unless_null $P303, vivify_190
    $P303 = root_new ['parrot';'Hash']
  vivify_190:
    set $P304, $P303["statement_mod_cond"]
    unless_null $P304, vivify_191
    $P304 = root_new ['parrot';'ResizablePMCArray']
  vivify_191:
    set $P305, $P304[0]
    unless_null $P305, vivify_192
    new $P305, "Undef"
  vivify_192:
    store_lex "$mc", $P305
.annotate 'line', 93
    find_lex $P306, "$/"
    unless_null $P306, vivify_193
    $P306 = root_new ['parrot';'Hash']
  vivify_193:
    set $P307, $P306["statement_mod_loop"]
    unless_null $P307, vivify_194
    $P307 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P308, $P307[0]
    unless_null $P308, vivify_195
    new $P308, "Undef"
  vivify_195:
    store_lex "$ml", $P308
.annotate 'line', 94
    find_lex $P309, "$/"
    unless_null $P309, vivify_196
    $P309 = root_new ['parrot';'Hash']
  vivify_196:
    set $P310, $P309["EXPR"]
    unless_null $P310, vivify_197
    new $P310, "Undef"
  vivify_197:
    $P311 = $P310."ast"()
    store_lex "$past", $P311
.annotate 'line', 95
    find_lex $P313, "$mc"
    unless $P313, if_312_end
.annotate 'line', 96
    get_hll_global $P314, ["PAST"], "Op"
    find_lex $P315, "$mc"
    unless_null $P315, vivify_198
    $P315 = root_new ['parrot';'Hash']
  vivify_198:
    set $P316, $P315["cond"]
    unless_null $P316, vivify_199
    new $P316, "Undef"
  vivify_199:
    $P317 = $P316."ast"()
    find_lex $P318, "$past"
    find_lex $P319, "$mc"
    unless_null $P319, vivify_200
    $P319 = root_new ['parrot';'Hash']
  vivify_200:
    set $P320, $P319["sym"]
    unless_null $P320, vivify_201
    new $P320, "Undef"
  vivify_201:
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
    unless_null $P329, vivify_202
    $P329 = root_new ['parrot';'Hash']
  vivify_202:
    set $P330, $P329["sym"]
    unless_null $P330, vivify_203
    new $P330, "Undef"
  vivify_203:
    set $S331, $P330
    iseq $I332, $S331, "for"
    if $I332, if_328
.annotate 'line', 108
    get_hll_global $P350, ["PAST"], "Op"
    find_lex $P351, "$ml"
    unless_null $P351, vivify_204
    $P351 = root_new ['parrot';'Hash']
  vivify_204:
    set $P352, $P351["cond"]
    unless_null $P352, vivify_205
    new $P352, "Undef"
  vivify_205:
    $P353 = $P352."ast"()
    find_lex $P354, "$past"
    find_lex $P355, "$ml"
    unless_null $P355, vivify_206
    $P355 = root_new ['parrot';'Hash']
  vivify_206:
    set $P356, $P355["sym"]
    unless_null $P356, vivify_207
    new $P356, "Undef"
  vivify_207:
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
    unless_null $P341, vivify_208
    $P341 = root_new ['parrot';'Hash']
  vivify_208:
    set $P342, $P341["cond"]
    unless_null $P342, vivify_209
    new $P342, "Undef"
  vivify_209:
    $P343 = $P342."ast"()
    find_lex $P344, "$past"
    find_lex $P345, "$ml"
    unless_null $P345, vivify_210
    $P345 = root_new ['parrot';'Hash']
  vivify_210:
    set $P346, $P345["sym"]
    unless_null $P346, vivify_211
    new $P346, "Undef"
  vivify_211:
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
.sub "xblock"  :subid("27_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P377, vivify_212
    $P377 = root_new ['parrot';'Hash']
  vivify_212:
    set $P378, $P377["EXPR"]
    unless_null $P378, vivify_213
    new $P378, "Undef"
  vivify_213:
    $P379 = $P378."ast"()
    find_lex $P380, "$/"
    unless_null $P380, vivify_214
    $P380 = root_new ['parrot';'Hash']
  vivify_214:
    set $P381, $P380["pblock"]
    unless_null $P381, vivify_215
    new $P381, "Undef"
  vivify_215:
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
.sub "pblock"  :subid("28_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P392, vivify_216
    $P392 = root_new ['parrot';'Hash']
  vivify_216:
    set $P393, $P392["blockoid"]
    unless_null $P393, vivify_217
    new $P393, "Undef"
  vivify_217:
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
.sub "block"  :subid("29_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P402, vivify_218
    $P402 = root_new ['parrot';'Hash']
  vivify_218:
    set $P403, $P402["blockoid"]
    unless_null $P403, vivify_219
    new $P403, "Undef"
  vivify_219:
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
.sub "blockoid"  :subid("30_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P413, vivify_220
    $P413 = root_new ['parrot';'Hash']
  vivify_220:
    set $P414, $P413["statementlist"]
    unless_null $P414, vivify_221
    new $P414, "Undef"
  vivify_221:
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
.sub "newpad"  :subid("31_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P431, vivify_222
    $P431 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P431
  vivify_222:
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
.sub "outerctx"  :subid("32_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P444, vivify_223
    $P444 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P444
  vivify_223:
.annotate 'line', 143
    get_global $P445, "@BLOCK"
.annotate 'line', 145
    find_lex $P446, "self"
    get_global $P447, "@BLOCK"
    unless_null $P447, vivify_224
    $P447 = root_new ['parrot';'ResizablePMCArray']
  vivify_224:
    set $P448, $P447[0]
    unless_null $P448, vivify_225
    new $P448, "Undef"
  vivify_225:
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
.sub "statement_control:sym<if>"  :subid("33_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_454
.annotate 'line', 150
    .const 'Sub' $P482 = "34_1283874343.0915" 
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
    unless_null $P457, vivify_226
    $P457 = root_new ['parrot';'Hash']
  vivify_226:
    set $P458, $P457["xblock"]
    unless_null $P458, vivify_227
    new $P458, "Undef"
  vivify_227:
    set $N459, $P458
    new $P460, 'Float'
    set $P460, $N459
    sub $P461, $P460, 1
    store_lex "$count", $P461
.annotate 'line', 152
    find_lex $P462, "$count"
    set $I463, $P462
    find_lex $P464, "$/"
    unless_null $P464, vivify_228
    $P464 = root_new ['parrot';'Hash']
  vivify_228:
    set $P465, $P464["xblock"]
    unless_null $P465, vivify_229
    $P465 = root_new ['parrot';'ResizablePMCArray']
  vivify_229:
    set $P466, $P465[$I463]
    unless_null $P466, vivify_230
    new $P466, "Undef"
  vivify_230:
    $P467 = $P466."ast"()
    $P468 = "xblock_immediate"($P467)
    store_lex "$past", $P468
.annotate 'line', 153
    find_lex $P470, "$/"
    unless_null $P470, vivify_231
    $P470 = root_new ['parrot';'Hash']
  vivify_231:
    set $P471, $P470["else"]
    unless_null $P471, vivify_232
    new $P471, "Undef"
  vivify_232:
    unless $P471, if_469_end
.annotate 'line', 154
    find_lex $P472, "$past"
    find_lex $P473, "$/"
    unless_null $P473, vivify_233
    $P473 = root_new ['parrot';'Hash']
  vivify_233:
    set $P474, $P473["else"]
    unless_null $P474, vivify_234
    $P474 = root_new ['parrot';'ResizablePMCArray']
  vivify_234:
    set $P475, $P474[0]
    unless_null $P475, vivify_235
    new $P475, "Undef"
  vivify_235:
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
    .const 'Sub' $P482 = "34_1283874343.0915" 
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
.sub "_block481"  :anon :subid("34_1283874343.0915") :outer("33_1283874343.0915")
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
    unless_null $P489, vivify_236
    $P489 = root_new ['parrot';'Hash']
  vivify_236:
    set $P490, $P489["xblock"]
    unless_null $P490, vivify_237
    $P490 = root_new ['parrot';'ResizablePMCArray']
  vivify_237:
    set $P491, $P490[$I488]
    unless_null $P491, vivify_238
    new $P491, "Undef"
  vivify_238:
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
.sub "statement_control:sym<unless>"  :subid("35_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P509, vivify_239
    $P509 = root_new ['parrot';'Hash']
  vivify_239:
    set $P510, $P509["xblock"]
    unless_null $P510, vivify_240
    new $P510, "Undef"
  vivify_240:
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
.sub "statement_control:sym<while>"  :subid("36_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P523, vivify_241
    $P523 = root_new ['parrot';'Hash']
  vivify_241:
    set $P524, $P523["xblock"]
    unless_null $P524, vivify_242
    new $P524, "Undef"
  vivify_242:
    $P525 = $P524."ast"()
    $P526 = "xblock_immediate"($P525)
    store_lex "$past", $P526
.annotate 'line', 174
    find_lex $P527, "$past"
    find_lex $P528, "$/"
    unless_null $P528, vivify_243
    $P528 = root_new ['parrot';'Hash']
  vivify_243:
    set $P529, $P528["sym"]
    unless_null $P529, vivify_244
    new $P529, "Undef"
  vivify_244:
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
.sub "statement_control:sym<repeat>"  :subid("37_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P542, vivify_245
    $P542 = root_new ['parrot';'Hash']
  vivify_245:
    set $P543, $P542["wu"]
    unless_null $P543, vivify_246
    new $P543, "Undef"
  vivify_246:
    set $S544, $P543
    concat $P545, $P541, $S544
    store_lex "$pasttype", $P545
    find_lex $P546, "$past"
.annotate 'line', 181
    find_lex $P548, "$/"
    unless_null $P548, vivify_247
    $P548 = root_new ['parrot';'Hash']
  vivify_247:
    set $P549, $P548["xblock"]
    unless_null $P549, vivify_248
    new $P549, "Undef"
  vivify_248:
    if $P549, if_547
.annotate 'line', 186
    get_hll_global $P556, ["PAST"], "Op"
    find_lex $P557, "$/"
    unless_null $P557, vivify_249
    $P557 = root_new ['parrot';'Hash']
  vivify_249:
    set $P558, $P557["EXPR"]
    unless_null $P558, vivify_250
    new $P558, "Undef"
  vivify_250:
    $P559 = $P558."ast"()
    find_lex $P560, "$/"
    unless_null $P560, vivify_251
    $P560 = root_new ['parrot';'Hash']
  vivify_251:
    set $P561, $P560["pblock"]
    unless_null $P561, vivify_252
    new $P561, "Undef"
  vivify_252:
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
    unless_null $P550, vivify_253
    $P550 = root_new ['parrot';'Hash']
  vivify_253:
    set $P551, $P550["xblock"]
    unless_null $P551, vivify_254
    new $P551, "Undef"
  vivify_254:
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
.sub "statement_control:sym<for>"  :subid("38_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P577, vivify_255
    $P577 = root_new ['parrot';'Hash']
  vivify_255:
    set $P578, $P577["xblock"]
    unless_null $P578, vivify_256
    new $P578, "Undef"
  vivify_256:
    $P579 = $P578."ast"()
    store_lex "$past", $P579
.annotate 'line', 194
    find_lex $P580, "$past"
    $P580."pasttype"("for")
.annotate 'line', 195
    find_lex $P581, "$past"
    unless_null $P581, vivify_257
    $P581 = root_new ['parrot';'ResizablePMCArray']
  vivify_257:
    set $P582, $P581[1]
    unless_null $P582, vivify_258
    new $P582, "Undef"
  vivify_258:
    store_lex "$block", $P582
.annotate 'line', 196
    find_lex $P584, "$block"
    $P585 = $P584."arity"()
    if $P585, unless_583_end
.annotate 'line', 197
    find_lex $P586, "$block"
    unless_null $P586, vivify_259
    $P586 = root_new ['parrot';'ResizablePMCArray']
  vivify_259:
    set $P587, $P586[0]
    unless_null $P587, vivify_260
    new $P587, "Undef"
  vivify_260:
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
.sub "statement_control:sym<return>"  :subid("39_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P603, vivify_261
    $P603 = root_new ['parrot';'Hash']
  vivify_261:
    set $P604, $P603["EXPR"]
    unless_null $P604, vivify_262
    new $P604, "Undef"
  vivify_262:
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
.sub "statement_control:sym<CATCH>"  :subid("40_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P615, vivify_263
    $P615 = root_new ['parrot';'Hash']
  vivify_263:
    set $P616, $P615["block"]
    unless_null $P616, vivify_264
    new $P616, "Undef"
  vivify_264:
    $P617 = $P616."ast"()
    store_lex "$block", $P617
.annotate 'line', 211
    find_lex $P618, "$/"
    find_lex $P619, "$block"
    "push_block_handler"($P618, $P619)
.annotate 'line', 212
    get_global $P620, "@BLOCK"
    unless_null $P620, vivify_265
    $P620 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P621, $P620[0]
    unless_null $P621, vivify_266
    new $P621, "Undef"
  vivify_266:
    $P622 = $P621."handlers"()
    set $P623, $P622[0]
    unless_null $P623, vivify_267
    new $P623, "Undef"
  vivify_267:
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P635, vivify_268
    $P635 = root_new ['parrot';'Hash']
  vivify_268:
    set $P636, $P635["block"]
    unless_null $P636, vivify_269
    new $P636, "Undef"
  vivify_269:
    $P637 = $P636."ast"()
    store_lex "$block", $P637
.annotate 'line', 218
    find_lex $P638, "$/"
    find_lex $P639, "$block"
    "push_block_handler"($P638, $P639)
.annotate 'line', 219
    get_global $P640, "@BLOCK"
    unless_null $P640, vivify_270
    $P640 = root_new ['parrot';'ResizablePMCArray']
  vivify_270:
    set $P641, $P640[0]
    unless_null $P641, vivify_271
    new $P641, "Undef"
  vivify_271:
    $P642 = $P641."handlers"()
    set $P643, $P642[0]
    unless_null $P643, vivify_272
    new $P643, "Undef"
  vivify_272:
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P655, vivify_273
    $P655 = root_new ['parrot';'ResizablePMCArray']
  vivify_273:
    set $P656, $P655[0]
    unless_null $P656, vivify_274
    new $P656, "Undef"
  vivify_274:
    $P657 = $P656."loadinit"()
    find_lex $P658, "$/"
    unless_null $P658, vivify_275
    $P658 = root_new ['parrot';'Hash']
  vivify_275:
    set $P659, $P658["blorst"]
    unless_null $P659, vivify_276
    new $P659, "Undef"
  vivify_276:
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
.sub "statement_prefix:sym<try>"  :subid("43_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P672, vivify_277
    $P672 = root_new ['parrot';'Hash']
  vivify_277:
    set $P673, $P672["blorst"]
    unless_null $P673, vivify_278
    new $P673, "Undef"
  vivify_278:
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
.sub "blorst"  :subid("44_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P709, vivify_279
    $P709 = root_new ['parrot';'Hash']
  vivify_279:
    set $P710, $P709["block"]
    unless_null $P710, vivify_280
    new $P710, "Undef"
  vivify_280:
    if $P710, if_708
.annotate 'line', 291
    find_lex $P715, "$/"
    unless_null $P715, vivify_281
    $P715 = root_new ['parrot';'Hash']
  vivify_281:
    set $P716, $P715["statement"]
    unless_null $P716, vivify_282
    new $P716, "Undef"
  vivify_282:
    $P717 = $P716."ast"()
    set $P707, $P717
.annotate 'line', 290
    goto if_708_end
  if_708:
    find_lex $P711, "$/"
    unless_null $P711, vivify_283
    $P711 = root_new ['parrot';'Hash']
  vivify_283:
    set $P712, $P711["block"]
    unless_null $P712, vivify_284
    new $P712, "Undef"
  vivify_284:
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P725, vivify_285
    $P725 = root_new ['parrot';'Hash']
  vivify_285:
    set $P726, $P725["cond"]
    unless_null $P726, vivify_286
    new $P726, "Undef"
  vivify_286:
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P735, vivify_287
    $P735 = root_new ['parrot';'Hash']
  vivify_287:
    set $P736, $P735["cond"]
    unless_null $P736, vivify_288
    new $P736, "Undef"
  vivify_288:
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P745, vivify_289
    $P745 = root_new ['parrot';'Hash']
  vivify_289:
    set $P746, $P745["cond"]
    unless_null $P746, vivify_290
    new $P746, "Undef"
  vivify_290:
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P755, vivify_291
    $P755 = root_new ['parrot';'Hash']
  vivify_291:
    set $P756, $P755["cond"]
    unless_null $P756, vivify_292
    new $P756, "Undef"
  vivify_292:
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
.sub "term:sym<fatarrow>"  :subid("49_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P765, vivify_293
    $P765 = root_new ['parrot';'Hash']
  vivify_293:
    set $P766, $P765["fatarrow"]
    unless_null $P766, vivify_294
    new $P766, "Undef"
  vivify_294:
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
.sub "term:sym<colonpair>"  :subid("50_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P775, vivify_295
    $P775 = root_new ['parrot';'Hash']
  vivify_295:
    set $P776, $P775["colonpair"]
    unless_null $P776, vivify_296
    new $P776, "Undef"
  vivify_296:
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
.sub "term:sym<variable>"  :subid("51_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P785, vivify_297
    $P785 = root_new ['parrot';'Hash']
  vivify_297:
    set $P786, $P785["variable"]
    unless_null $P786, vivify_298
    new $P786, "Undef"
  vivify_298:
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
.sub "term:sym<package_declarator>"  :subid("52_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P795, vivify_299
    $P795 = root_new ['parrot';'Hash']
  vivify_299:
    set $P796, $P795["package_declarator"]
    unless_null $P796, vivify_300
    new $P796, "Undef"
  vivify_300:
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
.sub "term:sym<scope_declarator>"  :subid("53_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P805, vivify_301
    $P805 = root_new ['parrot';'Hash']
  vivify_301:
    set $P806, $P805["scope_declarator"]
    unless_null $P806, vivify_302
    new $P806, "Undef"
  vivify_302:
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
.sub "term:sym<routine_declarator>"  :subid("54_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P815, vivify_303
    $P815 = root_new ['parrot';'Hash']
  vivify_303:
    set $P816, $P815["routine_declarator"]
    unless_null $P816, vivify_304
    new $P816, "Undef"
  vivify_304:
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
.sub "term:sym<regex_declarator>"  :subid("55_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P825, vivify_305
    $P825 = root_new ['parrot';'Hash']
  vivify_305:
    set $P826, $P825["regex_declarator"]
    unless_null $P826, vivify_306
    new $P826, "Undef"
  vivify_306:
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
.sub "term:sym<statement_prefix>"  :subid("56_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P835, vivify_307
    $P835 = root_new ['parrot';'Hash']
  vivify_307:
    set $P836, $P835["statement_prefix"]
    unless_null $P836, vivify_308
    new $P836, "Undef"
  vivify_308:
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
.sub "term:sym<lambda>"  :subid("57_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P845, vivify_309
    $P845 = root_new ['parrot';'Hash']
  vivify_309:
    set $P846, $P845["pblock"]
    unless_null $P846, vivify_310
    new $P846, "Undef"
  vivify_310:
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
.sub "fatarrow"  :subid("58_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P855, vivify_311
    $P855 = root_new ['parrot';'Hash']
  vivify_311:
    set $P856, $P855["val"]
    unless_null $P856, vivify_312
    new $P856, "Undef"
  vivify_312:
    $P857 = $P856."ast"()
    store_lex "$past", $P857
.annotate 'line', 316
    find_lex $P858, "$past"
    find_lex $P859, "$/"
    unless_null $P859, vivify_313
    $P859 = root_new ['parrot';'Hash']
  vivify_313:
    set $P860, $P859["key"]
    unless_null $P860, vivify_314
    new $P860, "Undef"
  vivify_314:
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
.sub "colonpair"  :subid("59_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P873, vivify_315
    $P873 = root_new ['parrot';'Hash']
  vivify_315:
    set $P874, $P873["circumfix"]
    unless_null $P874, vivify_316
    new $P874, "Undef"
  vivify_316:
    if $P874, if_872
.annotate 'line', 323
    get_hll_global $P879, ["PAST"], "Val"
    find_lex $P880, "$/"
    unless_null $P880, vivify_317
    $P880 = root_new ['parrot';'Hash']
  vivify_317:
    set $P881, $P880["not"]
    unless_null $P881, vivify_318
    new $P881, "Undef"
  vivify_318:
    isfalse $I882, $P881
    $P883 = $P879."new"($I882 :named("value"))
    set $P871, $P883
.annotate 'line', 322
    goto if_872_end
  if_872:
    find_lex $P875, "$/"
    unless_null $P875, vivify_319
    $P875 = root_new ['parrot';'Hash']
  vivify_319:
    set $P876, $P875["circumfix"]
    unless_null $P876, vivify_320
    $P876 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P877, $P876[0]
    unless_null $P877, vivify_321
    new $P877, "Undef"
  vivify_321:
    $P878 = $P877."ast"()
    set $P871, $P878
  if_872_end:
    store_lex "$past", $P871
.annotate 'line', 324
    find_lex $P884, "$past"
    find_lex $P885, "$/"
    unless_null $P885, vivify_322
    $P885 = root_new ['parrot';'Hash']
  vivify_322:
    set $P886, $P885["identifier"]
    unless_null $P886, vivify_323
    new $P886, "Undef"
  vivify_323:
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
.sub "variable"  :subid("60_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_895
.annotate 'line', 328
    .const 'Sub' $P908 = "61_1283874343.0915" 
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
    unless_null $P899, vivify_324
    $P899 = root_new ['parrot';'Hash']
  vivify_324:
    set $P900, $P899["postcircumfix"]
    unless_null $P900, vivify_325
    new $P900, "Undef"
  vivify_325:
    if $P900, if_898
.annotate 'line', 334
    .const 'Sub' $P908 = "61_1283874343.0915" 
    capture_lex $P908
    $P908()
    goto if_898_end
  if_898:
.annotate 'line', 331
    find_lex $P901, "$/"
    unless_null $P901, vivify_342
    $P901 = root_new ['parrot';'Hash']
  vivify_342:
    set $P902, $P901["postcircumfix"]
    unless_null $P902, vivify_343
    new $P902, "Undef"
  vivify_343:
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
.sub "_block907"  :anon :subid("61_1283874343.0915") :outer("60_1283874343.0915")
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
    unless_null $P922, vivify_326
    $P922 = root_new ['parrot';'ResizablePMCArray']
  vivify_326:
    set $P923, $P922[0]
    unless_null $P923, vivify_327
    new $P923, "Undef"
  vivify_327:
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
    unless_null $P931, vivify_328
    $P931 = root_new ['parrot';'Hash']
  vivify_328:
    set $P932, $P931["sigil"]
    unless_null $P932, vivify_329
    new $P932, "Undef"
  vivify_329:
    $P933 = "vivitype"($P932)
    $P930."viviself"($P933)
.annotate 'line', 342
    find_lex $P934, "$past"
    $P934."lvalue"(1)
  if_919_end:
.annotate 'line', 344
    find_lex $P937, "$/"
    unless_null $P937, vivify_330
    $P937 = root_new ['parrot';'Hash']
  vivify_330:
    set $P938, $P937["twigil"]
    unless_null $P938, vivify_331
    $P938 = root_new ['parrot';'ResizablePMCArray']
  vivify_331:
    set $P939, $P938[0]
    unless_null $P939, vivify_332
    new $P939, "Undef"
  vivify_332:
    set $S940, $P939
    iseq $I941, $S940, "*"
    if $I941, if_936
.annotate 'line', 357
    find_lex $P963, "$/"
    unless_null $P963, vivify_333
    $P963 = root_new ['parrot';'Hash']
  vivify_333:
    set $P964, $P963["twigil"]
    unless_null $P964, vivify_334
    $P964 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P965, $P964[0]
    unless_null $P965, vivify_335
    new $P965, "Undef"
  vivify_335:
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
    unless_null $P973, vivify_336
    $P973 = root_new ['parrot';'Hash']
  vivify_336:
    set $P974, $P973["sigil"]
    unless_null $P974, vivify_337
    new $P974, "Undef"
  vivify_337:
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
    unless_null $P945, vivify_338
    $P945 = root_new ['parrot';'Hash']
  vivify_338:
    set $P946, $P945["sigil"]
    unless_null $P946, vivify_339
    new $P946, "Undef"
  vivify_339:
    set $S947, $P946
    new $P948, 'String'
    set $P948, $S947
    find_lex $P949, "$/"
    unless_null $P949, vivify_340
    $P949 = root_new ['parrot';'Hash']
  vivify_340:
    set $P950, $P949["desigilname"]
    unless_null $P950, vivify_341
    new $P950, "Undef"
  vivify_341:
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
.sub "package_declarator:sym<module>"  :subid("62_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P986, vivify_344
    $P986 = root_new ['parrot';'Hash']
  vivify_344:
    set $P987, $P986["package_def"]
    unless_null $P987, vivify_345
    new $P987, "Undef"
  vivify_345:
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
.sub "package_declarator:sym<class>"  :subid("63_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P998, vivify_346
    $P998 = root_new ['parrot';'Hash']
  vivify_346:
    set $P999, $P998["package_def"]
    unless_null $P999, vivify_347
    new $P999, "Undef"
  vivify_347:
    $P1000 = $P999."ast"()
    store_lex "$past", $P1000
.annotate 'line', 370
    get_hll_global $P1001, ["PAST"], "Op"
.annotate 'line', 371
    get_hll_global $P1002, ["PAST"], "Op"
    $P1003 = $P1002."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 374
    find_lex $P1004, "$/"
    unless_null $P1004, vivify_348
    $P1004 = root_new ['parrot';'Hash']
  vivify_348:
    set $P1005, $P1004["package_def"]
    unless_null $P1005, vivify_349
    $P1005 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1006, $P1005["name"]
    unless_null $P1006, vivify_350
    new $P1006, "Undef"
  vivify_350:
    set $S1007, $P1006
    $P1008 = $P1001."new"($P1003, $S1007, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 370
    store_lex "$classinit", $P1008
.annotate 'line', 378
    find_lex $P1011, "$/"
    unless_null $P1011, vivify_351
    $P1011 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1012, $P1011["package_def"]
    unless_null $P1012, vivify_352
    $P1012 = root_new ['parrot';'Hash']
  vivify_352:
    set $P1013, $P1012["parent"]
    unless_null $P1013, vivify_353
    $P1013 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_354
    new $P1014, "Undef"
  vivify_354:
    set $S1015, $P1014
    unless $S1015, unless_1010
    new $P1009, 'String'
    set $P1009, $S1015
    goto unless_1010_end
  unless_1010:
.annotate 'line', 379
    find_lex $P1018, "$/"
    unless_null $P1018, vivify_355
    $P1018 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1019, $P1018["sym"]
    unless_null $P1019, vivify_356
    new $P1019, "Undef"
  vivify_356:
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
    unless_null $P1031, vivify_357
    $P1031 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1032, $P1031["attributes"]
    unless_null $P1032, vivify_358
    new $P1032, "Undef"
  vivify_358:
    unless $P1032, if_1030_end
.annotate 'line', 384
    find_lex $P1033, "$classinit"
    find_lex $P1034, "$past"
    unless_null $P1034, vivify_359
    $P1034 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1035, $P1034["attributes"]
    unless_null $P1035, vivify_360
    new $P1035, "Undef"
  vivify_360:
    $P1033."push"($P1035)
  if_1030_end:
.annotate 'line', 386
    get_global $P1036, "@BLOCK"
    unless_null $P1036, vivify_361
    $P1036 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P1037, $P1036[0]
    unless_null $P1037, vivify_362
    new $P1037, "Undef"
  vivify_362:
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
.sub "package_def"  :subid("64_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1051, vivify_363
    $P1051 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1052, $P1051["block"]
    unless_null $P1052, vivify_364
    new $P1052, "Undef"
  vivify_364:
    if $P1052, if_1050
    find_lex $P1056, "$/"
    unless_null $P1056, vivify_365
    $P1056 = root_new ['parrot';'Hash']
  vivify_365:
    set $P1057, $P1056["comp_unit"]
    unless_null $P1057, vivify_366
    new $P1057, "Undef"
  vivify_366:
    $P1058 = $P1057."ast"()
    set $P1049, $P1058
    goto if_1050_end
  if_1050:
    find_lex $P1053, "$/"
    unless_null $P1053, vivify_367
    $P1053 = root_new ['parrot';'Hash']
  vivify_367:
    set $P1054, $P1053["block"]
    unless_null $P1054, vivify_368
    new $P1054, "Undef"
  vivify_368:
    $P1055 = $P1054."ast"()
    set $P1049, $P1055
  if_1050_end:
    store_lex "$past", $P1049
.annotate 'line', 392
    find_lex $P1059, "$past"
    find_lex $P1060, "$/"
    unless_null $P1060, vivify_369
    $P1060 = root_new ['parrot';'Hash']
  vivify_369:
    set $P1061, $P1060["name"]
    unless_null $P1061, vivify_370
    $P1061 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1062, $P1061["identifier"]
    unless_null $P1062, vivify_371
    new $P1062, "Undef"
  vivify_371:
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
.sub "scope_declarator:sym<my>"  :subid("65_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1073, vivify_372
    $P1073 = root_new ['parrot';'Hash']
  vivify_372:
    set $P1074, $P1073["scoped"]
    unless_null $P1074, vivify_373
    new $P1074, "Undef"
  vivify_373:
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
.sub "scope_declarator:sym<our>"  :subid("66_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1083, vivify_374
    $P1083 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1084, $P1083["scoped"]
    unless_null $P1084, vivify_375
    new $P1084, "Undef"
  vivify_375:
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
.sub "scope_declarator:sym<has>"  :subid("67_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1093, vivify_376
    $P1093 = root_new ['parrot';'Hash']
  vivify_376:
    set $P1094, $P1093["scoped"]
    unless_null $P1094, vivify_377
    new $P1094, "Undef"
  vivify_377:
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
.sub "scoped"  :subid("68_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1105, vivify_378
    $P1105 = root_new ['parrot';'Hash']
  vivify_378:
    set $P1106, $P1105["declarator"]
    unless_null $P1106, vivify_379
    new $P1106, "Undef"
  vivify_379:
    if $P1106, if_1104
.annotate 'line', 404
    find_lex $P1110, "$/"
    unless_null $P1110, vivify_380
    $P1110 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1111, $P1110["multi_declarator"]
    unless_null $P1111, vivify_381
    new $P1111, "Undef"
  vivify_381:
    $P1112 = $P1111."ast"()
    set $P1103, $P1112
.annotate 'line', 403
    goto if_1104_end
  if_1104:
    find_lex $P1107, "$/"
    unless_null $P1107, vivify_382
    $P1107 = root_new ['parrot';'Hash']
  vivify_382:
    set $P1108, $P1107["declarator"]
    unless_null $P1108, vivify_383
    new $P1108, "Undef"
  vivify_383:
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
.sub "declarator"  :subid("69_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1122, vivify_384
    $P1122 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1123, $P1122["routine_declarator"]
    unless_null $P1123, vivify_385
    new $P1123, "Undef"
  vivify_385:
    if $P1123, if_1121
.annotate 'line', 410
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_386
    $P1127 = root_new ['parrot';'Hash']
  vivify_386:
    set $P1128, $P1127["variable_declarator"]
    unless_null $P1128, vivify_387
    new $P1128, "Undef"
  vivify_387:
    $P1129 = $P1128."ast"()
    set $P1120, $P1129
.annotate 'line', 409
    goto if_1121_end
  if_1121:
    find_lex $P1124, "$/"
    unless_null $P1124, vivify_388
    $P1124 = root_new ['parrot';'Hash']
  vivify_388:
    set $P1125, $P1124["routine_declarator"]
    unless_null $P1125, vivify_389
    new $P1125, "Undef"
  vivify_389:
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
.sub "multi_declarator:sym<multi>"  :subid("70_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1139, vivify_390
    $P1139 = root_new ['parrot';'Hash']
  vivify_390:
    set $P1140, $P1139["declarator"]
    unless_null $P1140, vivify_391
    new $P1140, "Undef"
  vivify_391:
    if $P1140, if_1138
    find_lex $P1144, "$/"
    unless_null $P1144, vivify_392
    $P1144 = root_new ['parrot';'Hash']
  vivify_392:
    set $P1145, $P1144["routine_def"]
    unless_null $P1145, vivify_393
    new $P1145, "Undef"
  vivify_393:
    $P1146 = $P1145."ast"()
    set $P1137, $P1146
    goto if_1138_end
  if_1138:
    find_lex $P1141, "$/"
    unless_null $P1141, vivify_394
    $P1141 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1142, $P1141["declarator"]
    unless_null $P1142, vivify_395
    new $P1142, "Undef"
  vivify_395:
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
.sub "multi_declarator:sym<null>"  :subid("71_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1154, vivify_396
    $P1154 = root_new ['parrot';'Hash']
  vivify_396:
    set $P1155, $P1154["declarator"]
    unless_null $P1155, vivify_397
    new $P1155, "Undef"
  vivify_397:
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
.sub "variable_declarator"  :subid("72_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1162
.annotate 'line', 417
    .const 'Sub' $P1202 = "73_1283874343.0915" 
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
    unless_null $P1167, vivify_398
    $P1167 = root_new ['parrot';'Hash']
  vivify_398:
    set $P1168, $P1167["variable"]
    unless_null $P1168, vivify_399
    new $P1168, "Undef"
  vivify_399:
    $P1169 = $P1168."ast"()
    store_lex "$past", $P1169
.annotate 'line', 419
    find_lex $P1170, "$/"
    unless_null $P1170, vivify_400
    $P1170 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1171, $P1170["variable"]
    unless_null $P1171, vivify_401
    $P1171 = root_new ['parrot';'Hash']
  vivify_401:
    set $P1172, $P1171["sigil"]
    unless_null $P1172, vivify_402
    new $P1172, "Undef"
  vivify_402:
    store_lex "$sigil", $P1172
.annotate 'line', 420
    find_lex $P1173, "$past"
    $P1174 = $P1173."name"()
    store_lex "$name", $P1174
.annotate 'line', 421
    get_global $P1175, "@BLOCK"
    unless_null $P1175, vivify_403
    $P1175 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_404
    new $P1176, "Undef"
  vivify_404:
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
    unless_null $P1185, vivify_405
    get_hll_global $P1185, "$SCOPE"
    unless_null $P1185, vivify_406
    die "Contextual $*SCOPE not found"
  vivify_406:
  vivify_405:
    set $S1186, $P1185
    iseq $I1187, $S1186, "has"
    if $I1187, if_1184
.annotate 'line', 434
    .const 'Sub' $P1202 = "73_1283874343.0915" 
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
    unless_null $P1191, vivify_411
    $P1191 = root_new ['parrot';'Hash']
  vivify_411:
    set $P1192, $P1191["attributes"]
    unless_null $P1192, vivify_412
    new $P1192, "Undef"
  vivify_412:
    if $P1192, unless_1190_end
.annotate 'line', 429
    get_hll_global $P1193, ["PAST"], "Op"
    $P1194 = $P1193."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1195, "$BLOCK"
    unless_null $P1195, vivify_413
    $P1195 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1195
  vivify_413:
    set $P1195["attributes"], $P1194
  unless_1190_end:
.annotate 'line', 431
    find_lex $P1196, "$BLOCK"
    unless_null $P1196, vivify_414
    $P1196 = root_new ['parrot';'Hash']
  vivify_414:
    set $P1197, $P1196["attributes"]
    unless_null $P1197, vivify_415
    new $P1197, "Undef"
  vivify_415:
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
.sub "_block1201"  :anon :subid("73_1283874343.0915") :outer("72_1283874343.0915")
.annotate 'line', 435
    new $P1203, "Undef"
    .lex "$scope", $P1203
.annotate 'line', 436
    new $P1204, "Undef"
    .lex "$decl", $P1204
.annotate 'line', 435
    find_dynamic_lex $P1207, "$*SCOPE"
    unless_null $P1207, vivify_407
    get_hll_global $P1207, "$SCOPE"
    unless_null $P1207, vivify_408
    die "Contextual $*SCOPE not found"
  vivify_408:
  vivify_407:
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
    unless_null $P1222, vivify_409
    $P1222 = root_new ['parrot';'ResizablePMCArray']
  vivify_409:
    set $P1223, $P1222[0]
    unless_null $P1223, vivify_410
    new $P1223, "Undef"
  vivify_410:
    find_lex $P1224, "$decl"
    $P1225 = $P1223."push"($P1224)
.annotate 'line', 434
    .return ($P1225)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<sub>"  :subid("74_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1235, vivify_416
    $P1235 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1236, $P1235["routine_def"]
    unless_null $P1236, vivify_417
    new $P1236, "Undef"
  vivify_417:
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
.sub "routine_declarator:sym<method>"  :subid("75_1283874343.0915") :method :outer("11_1283874343.0915")
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
    unless_null $P1245, vivify_418
    $P1245 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1246, $P1245["method_def"]
    unless_null $P1246, vivify_419
    new $P1246, "Undef"
  vivify_419:
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
.sub "routine_def"  :subid("76_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1253
.annotate 'line', 448
    .const 'Sub' $P1264 = "77_1283874343.0915" 
    capture_lex $P1264
    new $P1252, 'ExceptionHandler'
    set_addr $P1252, control_1251
    $P1252."handle_types"(.CONTROL_RETURN)
    push_eh $P1252
    .lex "self", self
    .lex "$/", param_1253
.annotate 'line', 449
    new $P1254, "Undef"
    .lex "$past", $P1254
    find_lex $P1255, "$/"
    unless_null $P1255, vivify_420
    $P1255 = root_new ['parrot';'Hash']
  vivify_420:
    set $P1256, $P1255["blockoid"]
    unless_null $P1256, vivify_421
    new $P1256, "Undef"
  vivify_421:
    $P1257 = $P1256."ast"()
    store_lex "$past", $P1257
.annotate 'line', 450
    find_lex $P1258, "$past"
    $P1258."blocktype"("declaration")
.annotate 'line', 451
    find_lex $P1259, "$past"
    $P1259."control"("return_pir")
.annotate 'line', 452
    find_lex $P1261, "$/"
    unless_null $P1261, vivify_422
    $P1261 = root_new ['parrot';'Hash']
  vivify_422:
    set $P1262, $P1261["deflongname"]
    unless_null $P1262, vivify_423
    new $P1262, "Undef"
  vivify_423:
    unless $P1262, if_1260_end
    .const 'Sub' $P1264 = "77_1283874343.0915" 
    capture_lex $P1264
    $P1264()
  if_1260_end:
.annotate 'line', 462
    find_lex $P1296, "$/"
    find_lex $P1297, "$past"
    $P1298 = $P1296."!make"($P1297)
.annotate 'line', 448
    .return ($P1298)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1299, exception, "payload"
    .return ($P1299)
.end


.namespace ["NQP";"Actions"]
.sub "_block1263"  :anon :subid("77_1283874343.0915") :outer("76_1283874343.0915")
.annotate 'line', 453
    new $P1265, "Undef"
    .lex "$name", $P1265
    find_lex $P1266, "$/"
    unless_null $P1266, vivify_424
    $P1266 = root_new ['parrot';'Hash']
  vivify_424:
    set $P1267, $P1266["sigil"]
    unless_null $P1267, vivify_425
    $P1267 = root_new ['parrot';'ResizablePMCArray']
  vivify_425:
    set $P1268, $P1267[0]
    unless_null $P1268, vivify_426
    new $P1268, "Undef"
  vivify_426:
    set $S1269, $P1268
    new $P1270, 'String'
    set $P1270, $S1269
    find_lex $P1271, "$/"
    unless_null $P1271, vivify_427
    $P1271 = root_new ['parrot';'Hash']
  vivify_427:
    set $P1272, $P1271["deflongname"]
    unless_null $P1272, vivify_428
    $P1272 = root_new ['parrot';'ResizablePMCArray']
  vivify_428:
    set $P1273, $P1272[0]
    unless_null $P1273, vivify_429
    new $P1273, "Undef"
  vivify_429:
    $S1274 = $P1273."ast"()
    concat $P1275, $P1270, $S1274
    store_lex "$name", $P1275
.annotate 'line', 454
    find_lex $P1276, "$past"
    find_lex $P1277, "$name"
    $P1276."name"($P1277)
.annotate 'line', 455
    find_dynamic_lex $P1280, "$*SCOPE"
    unless_null $P1280, vivify_430
    get_hll_global $P1280, "$SCOPE"
    unless_null $P1280, vivify_431
    die "Contextual $*SCOPE not found"
  vivify_431:
  vivify_430:
    set $S1281, $P1280
    isne $I1282, $S1281, "our"
    if $I1282, if_1279
    new $P1278, 'Integer'
    set $P1278, $I1282
    goto if_1279_end
  if_1279:
.annotate 'line', 456
    get_global $P1283, "@BLOCK"
    unless_null $P1283, vivify_432
    $P1283 = root_new ['parrot';'ResizablePMCArray']
  vivify_432:
    set $P1284, $P1283[0]
    unless_null $P1284, vivify_433
    $P1284 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1285, $P1284[0]
    unless_null $P1285, vivify_434
    new $P1285, "Undef"
  vivify_434:
    get_hll_global $P1286, ["PAST"], "Var"
    find_lex $P1287, "$name"
    find_lex $P1288, "$past"
    $P1289 = $P1286."new"($P1287 :named("name"), 1 :named("isdecl"), $P1288 :named("viviself"), "lexical" :named("scope"))
    $P1285."push"($P1289)
.annotate 'line', 458
    get_global $P1290, "@BLOCK"
    unless_null $P1290, vivify_435
    $P1290 = root_new ['parrot';'ResizablePMCArray']
  vivify_435:
    set $P1291, $P1290[0]
    unless_null $P1291, vivify_436
    new $P1291, "Undef"
  vivify_436:
    find_lex $P1292, "$name"
    $P1291."symbol"($P1292, "lexical" :named("scope"))
.annotate 'line', 459
    get_hll_global $P1293, ["PAST"], "Var"
    find_lex $P1294, "$name"
    $P1295 = $P1293."new"($P1294 :named("name"))
    store_lex "$past", $P1295
.annotate 'line', 455
    set $P1278, $P1295
  if_1279_end:
.annotate 'line', 452
    .return ($P1278)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "method_def"  :subid("78_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1303
.annotate 'line', 466
    .const 'Sub' $P1324 = "79_1283874343.0915" 
    capture_lex $P1324
    new $P1302, 'ExceptionHandler'
    set_addr $P1302, control_1301
    $P1302."handle_types"(.CONTROL_RETURN)
    push_eh $P1302
    .lex "self", self
    .lex "$/", param_1303
.annotate 'line', 467
    new $P1304, "Undef"
    .lex "$past", $P1304
    find_lex $P1305, "$/"
    unless_null $P1305, vivify_437
    $P1305 = root_new ['parrot';'Hash']
  vivify_437:
    set $P1306, $P1305["blockoid"]
    unless_null $P1306, vivify_438
    new $P1306, "Undef"
  vivify_438:
    $P1307 = $P1306."ast"()
    store_lex "$past", $P1307
.annotate 'line', 468
    find_lex $P1308, "$past"
    $P1308."blocktype"("method")
.annotate 'line', 469
    find_dynamic_lex $P1310, "$*SCOPE"
    unless_null $P1310, vivify_439
    get_hll_global $P1310, "$SCOPE"
    unless_null $P1310, vivify_440
    die "Contextual $*SCOPE not found"
  vivify_440:
  vivify_439:
    set $S1311, $P1310
    iseq $I1312, $S1311, "our"
    unless $I1312, if_1309_end
.annotate 'line', 470
    find_lex $P1313, "$past"
    $P1313."pirflags"(":nsentry")
  if_1309_end:
.annotate 'line', 472
    find_lex $P1314, "$past"
    $P1314."control"("return_pir")
.annotate 'line', 473
    find_lex $P1315, "$past"
    unless_null $P1315, vivify_441
    $P1315 = root_new ['parrot';'ResizablePMCArray']
  vivify_441:
    set $P1316, $P1315[0]
    unless_null $P1316, vivify_442
    new $P1316, "Undef"
  vivify_442:
    get_hll_global $P1317, ["PAST"], "Op"
    $P1318 = $P1317."new"("    .lex \"self\", self" :named("inline"))
    $P1316."unshift"($P1318)
.annotate 'line', 474
    find_lex $P1319, "$past"
    $P1319."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 475
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_443
    $P1321 = root_new ['parrot';'Hash']
  vivify_443:
    set $P1322, $P1321["deflongname"]
    unless_null $P1322, vivify_444
    new $P1322, "Undef"
  vivify_444:
    unless $P1322, if_1320_end
    .const 'Sub' $P1324 = "79_1283874343.0915" 
    capture_lex $P1324
    $P1324()
  if_1320_end:
.annotate 'line', 479
    find_dynamic_lex $P1336, "$*MULTINESS"
    unless_null $P1336, vivify_448
    get_hll_global $P1336, "$MULTINESS"
    unless_null $P1336, vivify_449
    die "Contextual $*MULTINESS not found"
  vivify_449:
  vivify_448:
    set $S1337, $P1336
    iseq $I1338, $S1337, "multi"
    unless $I1338, if_1335_end
    find_lex $P1339, "$past"
    $P1340 = $P1339."multi"()
    $P1340."unshift"("_")
  if_1335_end:
.annotate 'line', 480
    find_lex $P1341, "$/"
    find_lex $P1342, "$past"
    $P1343 = $P1341."!make"($P1342)
.annotate 'line', 466
    .return ($P1343)
  control_1301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1344, exception, "payload"
    .return ($P1344)
.end


.namespace ["NQP";"Actions"]
.sub "_block1323"  :anon :subid("79_1283874343.0915") :outer("78_1283874343.0915")
.annotate 'line', 476
    new $P1325, "Undef"
    .lex "$name", $P1325
    find_lex $P1326, "$/"
    unless_null $P1326, vivify_445
    $P1326 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1327, $P1326["deflongname"]
    unless_null $P1327, vivify_446
    $P1327 = root_new ['parrot';'ResizablePMCArray']
  vivify_446:
    set $P1328, $P1327[0]
    unless_null $P1328, vivify_447
    new $P1328, "Undef"
  vivify_447:
    $P1329 = $P1328."ast"()
    set $S1330, $P1329
    new $P1331, 'String'
    set $P1331, $S1330
    store_lex "$name", $P1331
.annotate 'line', 477
    find_lex $P1332, "$past"
    find_lex $P1333, "$name"
    $P1334 = $P1332."name"($P1333)
.annotate 'line', 475
    .return ($P1334)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("80_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1348
.annotate 'line', 484
    .const 'Sub' $P1374 = "82_1283874343.0915" 
    capture_lex $P1374
    .const 'Sub' $P1359 = "81_1283874343.0915" 
    capture_lex $P1359
    new $P1347, 'ExceptionHandler'
    set_addr $P1347, control_1346
    $P1347."handle_types"(.CONTROL_RETURN)
    push_eh $P1347
    .lex "self", self
    .lex "$/", param_1348
.annotate 'line', 485
    new $P1349, "Undef"
    .lex "$BLOCKINIT", $P1349
    get_global $P1350, "@BLOCK"
    unless_null $P1350, vivify_450
    $P1350 = root_new ['parrot';'ResizablePMCArray']
  vivify_450:
    set $P1351, $P1350[0]
    unless_null $P1351, vivify_451
    $P1351 = root_new ['parrot';'ResizablePMCArray']
  vivify_451:
    set $P1352, $P1351[0]
    unless_null $P1352, vivify_452
    new $P1352, "Undef"
  vivify_452:
    store_lex "$BLOCKINIT", $P1352
.annotate 'line', 487
    find_lex $P1354, "$/"
    unless_null $P1354, vivify_453
    $P1354 = root_new ['parrot';'Hash']
  vivify_453:
    set $P1355, $P1354["parameter"]
    unless_null $P1355, vivify_454
    new $P1355, "Undef"
  vivify_454:
    defined $I1356, $P1355
    unless $I1356, for_undef_455
    iter $P1353, $P1355
    new $P1366, 'ExceptionHandler'
    set_addr $P1366, loop1365_handler
    $P1366."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1366
  loop1365_test:
    unless $P1353, loop1365_done
    shift $P1357, $P1353
  loop1365_redo:
    .const 'Sub' $P1359 = "81_1283874343.0915" 
    capture_lex $P1359
    $P1359($P1357)
  loop1365_next:
    goto loop1365_test
  loop1365_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1367, exception, 'type'
    eq $P1367, .CONTROL_LOOP_NEXT, loop1365_next
    eq $P1367, .CONTROL_LOOP_REDO, loop1365_redo
  loop1365_done:
    pop_eh 
  for_undef_455:
.annotate 'line', 490
    find_dynamic_lex $P1370, "$*MULTINESS"
    unless_null $P1370, vivify_456
    get_hll_global $P1370, "$MULTINESS"
    unless_null $P1370, vivify_457
    die "Contextual $*MULTINESS not found"
  vivify_457:
  vivify_456:
    set $S1371, $P1370
    iseq $I1372, $S1371, "multi"
    if $I1372, if_1369
    new $P1368, 'Integer'
    set $P1368, $I1372
    goto if_1369_end
  if_1369:
    .const 'Sub' $P1374 = "82_1283874343.0915" 
    capture_lex $P1374
    $P1412 = $P1374()
    set $P1368, $P1412
  if_1369_end:
.annotate 'line', 484
    .return ($P1368)
  control_1346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1413, exception, "payload"
    .return ($P1413)
.end


.namespace ["NQP";"Actions"]
.sub "_block1358"  :anon :subid("81_1283874343.0915") :outer("80_1283874343.0915")
    .param pmc param_1360
.annotate 'line', 487
    .lex "$_", param_1360
    find_lex $P1361, "$BLOCKINIT"
    find_lex $P1362, "$_"
    $P1363 = $P1362."ast"()
    $P1364 = $P1361."push"($P1363)
    .return ($P1364)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1373"  :anon :subid("82_1283874343.0915") :outer("80_1283874343.0915")
.annotate 'line', 490
    .const 'Sub' $P1383 = "83_1283874343.0915" 
    capture_lex $P1383
.annotate 'line', 491
    $P1375 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1375
.annotate 'line', 490
    find_lex $P1376, "@params"
.annotate 'line', 492
    find_lex $P1378, "$BLOCKINIT"
    $P1379 = $P1378."list"()
    defined $I1380, $P1379
    unless $I1380, for_undef_458
    iter $P1377, $P1379
    new $P1406, 'ExceptionHandler'
    set_addr $P1406, loop1405_handler
    $P1406."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1406
  loop1405_test:
    unless $P1377, loop1405_done
    shift $P1381, $P1377
  loop1405_redo:
    .const 'Sub' $P1383 = "83_1283874343.0915" 
    capture_lex $P1383
    $P1383($P1381)
  loop1405_next:
    goto loop1405_test
  loop1405_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1407, exception, 'type'
    eq $P1407, .CONTROL_LOOP_NEXT, loop1405_next
    eq $P1407, .CONTROL_LOOP_REDO, loop1405_redo
  loop1405_done:
    pop_eh 
  for_undef_458:
.annotate 'line', 496
    get_global $P1408, "@BLOCK"
    unless_null $P1408, vivify_459
    $P1408 = root_new ['parrot';'ResizablePMCArray']
  vivify_459:
    set $P1409, $P1408[0]
    unless_null $P1409, vivify_460
    new $P1409, "Undef"
  vivify_460:
    find_lex $P1410, "@params"
    $P1411 = $P1409."multi"($P1410)
.annotate 'line', 490
    .return ($P1411)
.end


.namespace ["NQP";"Actions"]
.sub "_block1382"  :anon :subid("83_1283874343.0915") :outer("82_1283874343.0915")
    .param pmc param_1384
.annotate 'line', 492
    .lex "$_", param_1384
.annotate 'line', 494
    find_lex $P1391, "$_"
    $P1392 = $P1391."slurpy"()
    unless $P1392, unless_1390
    set $P1389, $P1392
    goto unless_1390_end
  unless_1390:
    find_lex $P1393, "$_"
    $P1394 = $P1393."named"()
    set $P1389, $P1394
  unless_1390_end:
    unless $P1389, unless_1388
    set $P1387, $P1389
    goto unless_1388_end
  unless_1388:
    find_lex $P1395, "$_"
    $P1396 = $P1395."viviself"()
    set $P1387, $P1396
  unless_1388_end:
    unless $P1387, unless_1386
    set $P1385, $P1387
    goto unless_1386_end
  unless_1386:
.annotate 'line', 493
    find_lex $P1397, "@params"
    find_lex $P1399, "$_"
    $P1400 = $P1399."multitype"()
    set $P1398, $P1400
    defined $I1402, $P1398
    if $I1402, default_1401
    new $P1403, "String"
    assign $P1403, "_"
    set $P1398, $P1403
  default_1401:
    $P1404 = $P1397."push"($P1398)
    set $P1385, $P1404
  unless_1386_end:
.annotate 'line', 492
    .return ($P1385)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("84_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1417
.annotate 'line', 500
    .const 'Sub' $P1498 = "85_1283874343.0915" 
    capture_lex $P1498
    new $P1416, 'ExceptionHandler'
    set_addr $P1416, control_1415
    $P1416."handle_types"(.CONTROL_RETURN)
    push_eh $P1416
    .lex "self", self
    .lex "$/", param_1417
.annotate 'line', 501
    new $P1418, "Undef"
    .lex "$quant", $P1418
.annotate 'line', 502
    new $P1419, "Undef"
    .lex "$past", $P1419
.annotate 'line', 501
    find_lex $P1420, "$/"
    unless_null $P1420, vivify_461
    $P1420 = root_new ['parrot';'Hash']
  vivify_461:
    set $P1421, $P1420["quant"]
    unless_null $P1421, vivify_462
    new $P1421, "Undef"
  vivify_462:
    store_lex "$quant", $P1421
    find_lex $P1422, "$past"
.annotate 'line', 503
    find_lex $P1424, "$/"
    unless_null $P1424, vivify_463
    $P1424 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1425, $P1424["named_param"]
    unless_null $P1425, vivify_464
    new $P1425, "Undef"
  vivify_464:
    if $P1425, if_1423
.annotate 'line', 510
    find_lex $P1439, "$/"
    unless_null $P1439, vivify_465
    $P1439 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1440, $P1439["param_var"]
    unless_null $P1440, vivify_466
    new $P1440, "Undef"
  vivify_466:
    $P1441 = $P1440."ast"()
    store_lex "$past", $P1441
.annotate 'line', 511
    find_lex $P1443, "$quant"
    set $S1444, $P1443
    iseq $I1445, $S1444, "*"
    if $I1445, if_1442
.annotate 'line', 515
    find_lex $P1454, "$quant"
    set $S1455, $P1454
    iseq $I1456, $S1455, "?"
    unless $I1456, if_1453_end
.annotate 'line', 516
    find_lex $P1457, "$past"
    find_lex $P1458, "$/"
    unless_null $P1458, vivify_467
    $P1458 = root_new ['parrot';'Hash']
  vivify_467:
    set $P1459, $P1458["param_var"]
    unless_null $P1459, vivify_468
    $P1459 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1460, $P1459["sigil"]
    unless_null $P1460, vivify_469
    new $P1460, "Undef"
  vivify_469:
    $P1461 = "vivitype"($P1460)
    $P1457."viviself"($P1461)
  if_1453_end:
.annotate 'line', 515
    goto if_1442_end
  if_1442:
.annotate 'line', 512
    find_lex $P1446, "$past"
    $P1446."slurpy"(1)
.annotate 'line', 513
    find_lex $P1447, "$past"
    find_lex $P1448, "$/"
    unless_null $P1448, vivify_470
    $P1448 = root_new ['parrot';'Hash']
  vivify_470:
    set $P1449, $P1448["param_var"]
    unless_null $P1449, vivify_471
    $P1449 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1450, $P1449["sigil"]
    unless_null $P1450, vivify_472
    new $P1450, "Undef"
  vivify_472:
    set $S1451, $P1450
    iseq $I1452, $S1451, "%"
    $P1447."named"($I1452)
  if_1442_end:
.annotate 'line', 509
    goto if_1423_end
  if_1423:
.annotate 'line', 504
    find_lex $P1426, "$/"
    unless_null $P1426, vivify_473
    $P1426 = root_new ['parrot';'Hash']
  vivify_473:
    set $P1427, $P1426["named_param"]
    unless_null $P1427, vivify_474
    new $P1427, "Undef"
  vivify_474:
    $P1428 = $P1427."ast"()
    store_lex "$past", $P1428
.annotate 'line', 505
    find_lex $P1430, "$quant"
    set $S1431, $P1430
    isne $I1432, $S1431, "!"
    unless $I1432, if_1429_end
.annotate 'line', 506
    find_lex $P1433, "$past"
    find_lex $P1434, "$/"
    unless_null $P1434, vivify_475
    $P1434 = root_new ['parrot';'Hash']
  vivify_475:
    set $P1435, $P1434["named_param"]
    unless_null $P1435, vivify_476
    $P1435 = root_new ['parrot';'Hash']
  vivify_476:
    set $P1436, $P1435["param_var"]
    unless_null $P1436, vivify_477
    $P1436 = root_new ['parrot';'Hash']
  vivify_477:
    set $P1437, $P1436["sigil"]
    unless_null $P1437, vivify_478
    new $P1437, "Undef"
  vivify_478:
    $P1438 = "vivitype"($P1437)
    $P1433."viviself"($P1438)
  if_1429_end:
  if_1423_end:
.annotate 'line', 519
    find_lex $P1463, "$/"
    unless_null $P1463, vivify_479
    $P1463 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1464, $P1463["default_value"]
    unless_null $P1464, vivify_480
    new $P1464, "Undef"
  vivify_480:
    unless $P1464, if_1462_end
.annotate 'line', 520
    find_lex $P1466, "$quant"
    set $S1467, $P1466
    iseq $I1468, $S1467, "*"
    unless $I1468, if_1465_end
.annotate 'line', 521
    find_lex $P1469, "$/"
    $P1470 = $P1469."CURSOR"()
    $P1470."panic"("Can't put default on slurpy parameter")
  if_1465_end:
.annotate 'line', 523
    find_lex $P1472, "$quant"
    set $S1473, $P1472
    iseq $I1474, $S1473, "!"
    unless $I1474, if_1471_end
.annotate 'line', 524
    find_lex $P1475, "$/"
    $P1476 = $P1475."CURSOR"()
    $P1476."panic"("Can't put default on required parameter")
  if_1471_end:
.annotate 'line', 526
    find_lex $P1477, "$past"
    find_lex $P1478, "$/"
    unless_null $P1478, vivify_481
    $P1478 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1479, $P1478["default_value"]
    unless_null $P1479, vivify_482
    $P1479 = root_new ['parrot';'ResizablePMCArray']
  vivify_482:
    set $P1480, $P1479[0]
    unless_null $P1480, vivify_483
    $P1480 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1481, $P1480["EXPR"]
    unless_null $P1481, vivify_484
    new $P1481, "Undef"
  vivify_484:
    $P1482 = $P1481."ast"()
    $P1477."viviself"($P1482)
  if_1462_end:
.annotate 'line', 528
    find_lex $P1484, "$past"
    $P1485 = $P1484."viviself"()
    if $P1485, unless_1483_end
    get_global $P1486, "@BLOCK"
    unless_null $P1486, vivify_485
    $P1486 = root_new ['parrot';'ResizablePMCArray']
  vivify_485:
    set $P1487, $P1486[0]
    unless_null $P1487, vivify_486
    new $P1487, "Undef"
  vivify_486:
    get_global $P1488, "@BLOCK"
    unless_null $P1488, vivify_487
    $P1488 = root_new ['parrot';'ResizablePMCArray']
  vivify_487:
    set $P1489, $P1488[0]
    unless_null $P1489, vivify_488
    new $P1489, "Undef"
  vivify_488:
    $P1490 = $P1489."arity"()
    set $N1491, $P1490
    new $P1492, 'Float'
    set $P1492, $N1491
    add $P1493, $P1492, 1
    $P1487."arity"($P1493)
  unless_1483_end:
.annotate 'line', 531
    find_lex $P1495, "$/"
    unless_null $P1495, vivify_489
    $P1495 = root_new ['parrot';'Hash']
  vivify_489:
    set $P1496, $P1495["typename"]
    unless_null $P1496, vivify_490
    new $P1496, "Undef"
  vivify_490:
    unless $P1496, if_1494_end
    .const 'Sub' $P1498 = "85_1283874343.0915" 
    capture_lex $P1498
    $P1498()
  if_1494_end:
.annotate 'line', 537
    find_lex $P1522, "$/"
    find_lex $P1523, "$past"
    $P1524 = $P1522."!make"($P1523)
.annotate 'line', 500
    .return ($P1524)
  control_1415:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1525, exception, "payload"
    .return ($P1525)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1497"  :anon :subid("85_1283874343.0915") :outer("84_1283874343.0915")
.annotate 'line', 531
    .const 'Sub' $P1510 = "86_1283874343.0915" 
    capture_lex $P1510
.annotate 'line', 532
    $P1499 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1499
.annotate 'line', 531
    find_lex $P1500, "@multitype"
.annotate 'line', 533
    find_lex $P1502, "$/"
    unless_null $P1502, vivify_491
    $P1502 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1503, $P1502["typename"]
    unless_null $P1503, vivify_492
    $P1503 = root_new ['parrot';'ResizablePMCArray']
  vivify_492:
    set $P1504, $P1503[0]
    unless_null $P1504, vivify_493
    $P1504 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1505, $P1504["name"]
    unless_null $P1505, vivify_494
    $P1505 = root_new ['parrot';'Hash']
  vivify_494:
    set $P1506, $P1505["identifier"]
    unless_null $P1506, vivify_495
    new $P1506, "Undef"
  vivify_495:
    defined $I1507, $P1506
    unless $I1507, for_undef_496
    iter $P1501, $P1506
    new $P1517, 'ExceptionHandler'
    set_addr $P1517, loop1516_handler
    $P1517."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1517
  loop1516_test:
    unless $P1501, loop1516_done
    shift $P1508, $P1501
  loop1516_redo:
    .const 'Sub' $P1510 = "86_1283874343.0915" 
    capture_lex $P1510
    $P1510($P1508)
  loop1516_next:
    goto loop1516_test
  loop1516_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1518, exception, 'type'
    eq $P1518, .CONTROL_LOOP_NEXT, loop1516_next
    eq $P1518, .CONTROL_LOOP_REDO, loop1516_redo
  loop1516_done:
    pop_eh 
  for_undef_496:
.annotate 'line', 534
    find_lex $P1519, "$past"
    find_lex $P1520, "@multitype"
    $P1521 = $P1519."multitype"($P1520)
.annotate 'line', 531
    .return ($P1521)
.end


.namespace ["NQP";"Actions"]
.sub "_block1509"  :anon :subid("86_1283874343.0915") :outer("85_1283874343.0915")
    .param pmc param_1511
.annotate 'line', 533
    .lex "$_", param_1511
    find_lex $P1512, "@multitype"
    find_lex $P1513, "$_"
    set $S1514, $P1513
    $P1515 = $P1512."push"($S1514)
    .return ($P1515)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("87_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1529
.annotate 'line', 540
    new $P1528, 'ExceptionHandler'
    set_addr $P1528, control_1527
    $P1528."handle_types"(.CONTROL_RETURN)
    push_eh $P1528
    .lex "self", self
    .lex "$/", param_1529
.annotate 'line', 541
    new $P1530, "Undef"
    .lex "$name", $P1530
.annotate 'line', 542
    new $P1531, "Undef"
    .lex "$past", $P1531
.annotate 'line', 541
    find_lex $P1532, "$/"
    set $S1533, $P1532
    new $P1534, 'String'
    set $P1534, $S1533
    store_lex "$name", $P1534
.annotate 'line', 542
    get_hll_global $P1535, ["PAST"], "Var"
    find_lex $P1536, "$name"
    find_lex $P1537, "$/"
    $P1538 = $P1535."new"($P1536 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1537 :named("node"))
    store_lex "$past", $P1538
.annotate 'line', 544
    get_global $P1539, "@BLOCK"
    unless_null $P1539, vivify_497
    $P1539 = root_new ['parrot';'ResizablePMCArray']
  vivify_497:
    set $P1540, $P1539[0]
    unless_null $P1540, vivify_498
    new $P1540, "Undef"
  vivify_498:
    find_lex $P1541, "$name"
    $P1540."symbol"($P1541, "lexical" :named("scope"))
.annotate 'line', 545
    find_lex $P1542, "$/"
    find_lex $P1543, "$past"
    $P1544 = $P1542."!make"($P1543)
.annotate 'line', 540
    .return ($P1544)
  control_1527:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1545, exception, "payload"
    .return ($P1545)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("88_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1549
.annotate 'line', 548
    new $P1548, 'ExceptionHandler'
    set_addr $P1548, control_1547
    $P1548."handle_types"(.CONTROL_RETURN)
    push_eh $P1548
    .lex "self", self
    .lex "$/", param_1549
.annotate 'line', 549
    new $P1550, "Undef"
    .lex "$past", $P1550
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_499
    $P1551 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1552, $P1551["param_var"]
    unless_null $P1552, vivify_500
    new $P1552, "Undef"
  vivify_500:
    $P1553 = $P1552."ast"()
    store_lex "$past", $P1553
.annotate 'line', 550
    find_lex $P1554, "$past"
    find_lex $P1555, "$/"
    unless_null $P1555, vivify_501
    $P1555 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1556, $P1555["param_var"]
    unless_null $P1556, vivify_502
    $P1556 = root_new ['parrot';'Hash']
  vivify_502:
    set $P1557, $P1556["name"]
    unless_null $P1557, vivify_503
    new $P1557, "Undef"
  vivify_503:
    set $S1558, $P1557
    $P1554."named"($S1558)
.annotate 'line', 551
    find_lex $P1559, "$/"
    find_lex $P1560, "$past"
    $P1561 = $P1559."!make"($P1560)
.annotate 'line', 548
    .return ($P1561)
  control_1547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1562, exception, "payload"
    .return ($P1562)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("89_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1566
    .param pmc param_1567 :optional
    .param int has_param_1567 :opt_flag
.annotate 'line', 554
    .const 'Sub' $P1637 = "91_1283874343.0915" 
    capture_lex $P1637
    .const 'Sub' $P1609 = "90_1283874343.0915" 
    capture_lex $P1609
    new $P1565, 'ExceptionHandler'
    set_addr $P1565, control_1564
    $P1565."handle_types"(.CONTROL_RETURN)
    push_eh $P1565
    .lex "self", self
    .lex "$/", param_1566
    if has_param_1567, optparam_504
    new $P1568, "Undef"
    set param_1567, $P1568
  optparam_504:
    .lex "$key", param_1567
.annotate 'line', 555
    $P1569 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1569
.annotate 'line', 558
    new $P1570, "Undef"
    .lex "$name", $P1570
.annotate 'line', 559
    new $P1571, "Undef"
    .lex "$past", $P1571
.annotate 'line', 555

        $P1572 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1572
.annotate 'line', 558
    find_lex $P1573, "$/"
    unless_null $P1573, vivify_505
    $P1573 = root_new ['parrot';'Hash']
  vivify_505:
    set $P1574, $P1573["deflongname"]
    unless_null $P1574, vivify_506
    new $P1574, "Undef"
  vivify_506:
    $P1575 = $P1574."ast"()
    set $S1576, $P1575
    new $P1577, 'String'
    set $P1577, $S1576
    store_lex "$name", $P1577
    find_lex $P1578, "$past"
.annotate 'line', 560
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_507
    $P1580 = root_new ['parrot';'Hash']
  vivify_507:
    set $P1581, $P1580["proto"]
    unless_null $P1581, vivify_508
    new $P1581, "Undef"
  vivify_508:
    if $P1581, if_1579
.annotate 'line', 587
    find_lex $P1605, "$key"
    set $S1606, $P1605
    iseq $I1607, $S1606, "open"
    if $I1607, if_1604
.annotate 'line', 600
    .const 'Sub' $P1637 = "91_1283874343.0915" 
    capture_lex $P1637
    $P1637()
    goto if_1604_end
  if_1604:
.annotate 'line', 587
    .const 'Sub' $P1609 = "90_1283874343.0915" 
    capture_lex $P1609
    $P1609()
  if_1604_end:
    goto if_1579_end
  if_1579:
.annotate 'line', 562
    get_hll_global $P1582, ["PAST"], "Stmts"
.annotate 'line', 563
    get_hll_global $P1583, ["PAST"], "Block"
    find_lex $P1584, "$name"
.annotate 'line', 564
    get_hll_global $P1585, ["PAST"], "Op"
.annotate 'line', 565
    get_hll_global $P1586, ["PAST"], "Var"
    $P1587 = $P1586."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1588, "$name"
    $P1589 = $P1585."new"($P1587, $P1588, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 564
    find_lex $P1590, "$/"
    $P1591 = $P1583."new"($P1589, $P1584 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1590 :named("node"))
.annotate 'line', 574
    get_hll_global $P1592, ["PAST"], "Block"
    new $P1593, "String"
    assign $P1593, "!PREFIX__"
    find_lex $P1594, "$name"
    concat $P1595, $P1593, $P1594
.annotate 'line', 575
    get_hll_global $P1596, ["PAST"], "Op"
.annotate 'line', 576
    get_hll_global $P1597, ["PAST"], "Var"
    $P1598 = $P1597."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1599, "$name"
    $P1600 = $P1596."new"($P1598, $P1599, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 575
    find_lex $P1601, "$/"
    $P1602 = $P1592."new"($P1600, $P1595 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1601 :named("node"))
.annotate 'line', 574
    $P1603 = $P1582."new"($P1591, $P1602)
.annotate 'line', 562
    store_lex "$past", $P1603
  if_1579_end:
.annotate 'line', 614
    find_lex $P1658, "$/"
    find_lex $P1659, "$past"
    $P1660 = $P1658."!make"($P1659)
.annotate 'line', 554
    .return ($P1660)
  control_1564:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1661, exception, "payload"
    .return ($P1661)
.end


.namespace ["NQP";"Actions"]
.sub "_block1636"  :anon :subid("91_1283874343.0915") :outer("89_1283874343.0915")
.annotate 'line', 601
    new $P1638, "Undef"
    .lex "$regex", $P1638
.annotate 'line', 602
    get_hll_global $P1639, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1640, "$/"
    unless_null $P1640, vivify_509
    $P1640 = root_new ['parrot';'Hash']
  vivify_509:
    set $P1641, $P1640["p6regex"]
    unless_null $P1641, vivify_510
    new $P1641, "Undef"
  vivify_510:
    $P1642 = $P1641."ast"()
    get_global $P1643, "@BLOCK"
    $P1644 = $P1643."shift"()
    $P1645 = $P1639($P1642, $P1644)
    store_lex "$regex", $P1645
.annotate 'line', 603
    find_lex $P1646, "$regex"
    find_lex $P1647, "$name"
    $P1646."name"($P1647)
.annotate 'line', 605
    get_hll_global $P1648, ["PAST"], "Op"
.annotate 'line', 607
    get_hll_global $P1649, ["PAST"], "Var"
    new $P1650, "ResizablePMCArray"
    push $P1650, "Regex"
    $P1651 = $P1649."new"("Method" :named("name"), $P1650 :named("namespace"), "package" :named("scope"))
    find_lex $P1652, "$regex"
    $P1653 = $P1648."new"($P1651, $P1652, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 605
    store_lex "$past", $P1653
.annotate 'line', 611
    find_lex $P1654, "$regex"
    find_lex $P1655, "$past"
    unless_null $P1655, vivify_511
    $P1655 = root_new ['parrot';'Hash']
    store_lex "$past", $P1655
  vivify_511:
    set $P1655["sink"], $P1654
.annotate 'line', 612
    find_lex $P1656, "@MODIFIERS"
    $P1657 = $P1656."shift"()
.annotate 'line', 600
    .return ($P1657)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1608"  :anon :subid("90_1283874343.0915") :outer("89_1283874343.0915")
.annotate 'line', 588
    $P1610 = root_new ['parrot';'Hash']
    .lex "%h", $P1610
.annotate 'line', 587
    find_lex $P1611, "%h"
.annotate 'line', 589
    find_lex $P1613, "$/"
    unless_null $P1613, vivify_512
    $P1613 = root_new ['parrot';'Hash']
  vivify_512:
    set $P1614, $P1613["sym"]
    unless_null $P1614, vivify_513
    new $P1614, "Undef"
  vivify_513:
    set $S1615, $P1614
    iseq $I1616, $S1615, "token"
    unless $I1616, if_1612_end
    new $P1617, "Integer"
    assign $P1617, 1
    find_lex $P1618, "%h"
    unless_null $P1618, vivify_514
    $P1618 = root_new ['parrot';'Hash']
    store_lex "%h", $P1618
  vivify_514:
    set $P1618["r"], $P1617
  if_1612_end:
.annotate 'line', 590
    find_lex $P1620, "$/"
    unless_null $P1620, vivify_515
    $P1620 = root_new ['parrot';'Hash']
  vivify_515:
    set $P1621, $P1620["sym"]
    unless_null $P1621, vivify_516
    new $P1621, "Undef"
  vivify_516:
    set $S1622, $P1621
    iseq $I1623, $S1622, "rule"
    unless $I1623, if_1619_end
    new $P1624, "Integer"
    assign $P1624, 1
    find_lex $P1625, "%h"
    unless_null $P1625, vivify_517
    $P1625 = root_new ['parrot';'Hash']
    store_lex "%h", $P1625
  vivify_517:
    set $P1625["r"], $P1624
    new $P1626, "Integer"
    assign $P1626, 1
    find_lex $P1627, "%h"
    unless_null $P1627, vivify_518
    $P1627 = root_new ['parrot';'Hash']
    store_lex "%h", $P1627
  vivify_518:
    set $P1627["s"], $P1626
  if_1619_end:
.annotate 'line', 591
    find_lex $P1628, "@MODIFIERS"
    find_lex $P1629, "%h"
    $P1628."unshift"($P1629)
.annotate 'line', 592

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 596
    get_global $P1630, "@BLOCK"
    unless_null $P1630, vivify_519
    $P1630 = root_new ['parrot';'ResizablePMCArray']
  vivify_519:
    set $P1631, $P1630[0]
    unless_null $P1631, vivify_520
    new $P1631, "Undef"
  vivify_520:
    $P1631."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 597
    get_global $P1632, "@BLOCK"
    unless_null $P1632, vivify_521
    $P1632 = root_new ['parrot';'ResizablePMCArray']
  vivify_521:
    set $P1633, $P1632[0]
    unless_null $P1633, vivify_522
    new $P1633, "Undef"
  vivify_522:
    $P1633."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 598
    new $P1634, "Exception"
    set $P1634['type'], .CONTROL_RETURN
    new $P1635, "Integer"
    assign $P1635, 0
    setattribute $P1634, 'payload', $P1635
    throw $P1634
.annotate 'line', 587
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("92_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1665
.annotate 'line', 618
    new $P1664, 'ExceptionHandler'
    set_addr $P1664, control_1663
    $P1664."handle_types"(.CONTROL_RETURN)
    push_eh $P1664
    .lex "self", self
    .lex "$/", param_1665
.annotate 'line', 619
    new $P1666, "Undef"
    .lex "$past", $P1666
    find_lex $P1669, "$/"
    unless_null $P1669, vivify_523
    $P1669 = root_new ['parrot';'Hash']
  vivify_523:
    set $P1670, $P1669["args"]
    unless_null $P1670, vivify_524
    new $P1670, "Undef"
  vivify_524:
    if $P1670, if_1668
    get_hll_global $P1675, ["PAST"], "Op"
    find_lex $P1676, "$/"
    $P1677 = $P1675."new"($P1676 :named("node"))
    set $P1667, $P1677
    goto if_1668_end
  if_1668:
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_525
    $P1671 = root_new ['parrot';'Hash']
  vivify_525:
    set $P1672, $P1671["args"]
    unless_null $P1672, vivify_526
    $P1672 = root_new ['parrot';'ResizablePMCArray']
  vivify_526:
    set $P1673, $P1672[0]
    unless_null $P1673, vivify_527
    new $P1673, "Undef"
  vivify_527:
    $P1674 = $P1673."ast"()
    set $P1667, $P1674
  if_1668_end:
    store_lex "$past", $P1667
.annotate 'line', 620
    find_lex $P1678, "$past"
    find_lex $P1681, "$/"
    unless_null $P1681, vivify_528
    $P1681 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1682, $P1681["quote"]
    unless_null $P1682, vivify_529
    new $P1682, "Undef"
  vivify_529:
    if $P1682, if_1680
    find_lex $P1686, "$/"
    unless_null $P1686, vivify_530
    $P1686 = root_new ['parrot';'Hash']
  vivify_530:
    set $P1687, $P1686["longname"]
    unless_null $P1687, vivify_531
    new $P1687, "Undef"
  vivify_531:
    set $S1688, $P1687
    new $P1679, 'String'
    set $P1679, $S1688
    goto if_1680_end
  if_1680:
    find_lex $P1683, "$/"
    unless_null $P1683, vivify_532
    $P1683 = root_new ['parrot';'Hash']
  vivify_532:
    set $P1684, $P1683["quote"]
    unless_null $P1684, vivify_533
    new $P1684, "Undef"
  vivify_533:
    $P1685 = $P1684."ast"()
    set $P1679, $P1685
  if_1680_end:
    $P1678."name"($P1679)
.annotate 'line', 621
    find_lex $P1689, "$past"
    $P1689."pasttype"("callmethod")
.annotate 'line', 622
    find_lex $P1690, "$/"
    find_lex $P1691, "$past"
    $P1692 = $P1690."!make"($P1691)
.annotate 'line', 618
    .return ($P1692)
  control_1663:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1693, exception, "payload"
    .return ($P1693)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("93_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1697
.annotate 'line', 627
    new $P1696, 'ExceptionHandler'
    set_addr $P1696, control_1695
    $P1696."handle_types"(.CONTROL_RETURN)
    push_eh $P1696
    .lex "self", self
    .lex "$/", param_1697
.annotate 'line', 628
    find_lex $P1698, "$/"
    get_hll_global $P1699, ["PAST"], "Var"
    $P1700 = $P1699."new"("self" :named("name"))
    $P1701 = $P1698."!make"($P1700)
.annotate 'line', 627
    .return ($P1701)
  control_1695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1702, exception, "payload"
    .return ($P1702)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("94_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1706
.annotate 'line', 631
    new $P1705, 'ExceptionHandler'
    set_addr $P1705, control_1704
    $P1705."handle_types"(.CONTROL_RETURN)
    push_eh $P1705
    .lex "self", self
    .lex "$/", param_1706
.annotate 'line', 632
    new $P1707, "Undef"
    .lex "$past", $P1707
    find_lex $P1708, "$/"
    unless_null $P1708, vivify_534
    $P1708 = root_new ['parrot';'Hash']
  vivify_534:
    set $P1709, $P1708["args"]
    unless_null $P1709, vivify_535
    new $P1709, "Undef"
  vivify_535:
    $P1710 = $P1709."ast"()
    store_lex "$past", $P1710
.annotate 'line', 633
    find_lex $P1711, "$past"
    find_lex $P1712, "$/"
    unless_null $P1712, vivify_536
    $P1712 = root_new ['parrot';'Hash']
  vivify_536:
    set $P1713, $P1712["deflongname"]
    unless_null $P1713, vivify_537
    new $P1713, "Undef"
  vivify_537:
    set $S1714, $P1713
    $P1711."name"($S1714)
.annotate 'line', 634
    find_lex $P1715, "$/"
    find_lex $P1716, "$past"
    $P1717 = $P1715."!make"($P1716)
.annotate 'line', 631
    .return ($P1717)
  control_1704:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1718, exception, "payload"
    .return ($P1718)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("95_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1722
.annotate 'line', 637
    new $P1721, 'ExceptionHandler'
    set_addr $P1721, control_1720
    $P1721."handle_types"(.CONTROL_RETURN)
    push_eh $P1721
    .lex "self", self
    .lex "$/", param_1722
.annotate 'line', 638
    $P1723 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1723
.annotate 'line', 639
    new $P1724, "Undef"
    .lex "$name", $P1724
.annotate 'line', 641
    new $P1725, "Undef"
    .lex "$var", $P1725
.annotate 'line', 643
    new $P1726, "Undef"
    .lex "$past", $P1726
.annotate 'line', 638
    find_lex $P1727, "$/"
    unless_null $P1727, vivify_538
    $P1727 = root_new ['parrot';'Hash']
  vivify_538:
    set $P1728, $P1727["name"]
    unless_null $P1728, vivify_539
    $P1728 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1729, $P1728["identifier"]
    unless_null $P1729, vivify_540
    new $P1729, "Undef"
  vivify_540:
    clone $P1730, $P1729
    store_lex "@ns", $P1730
.annotate 'line', 639
    find_lex $P1731, "@ns"
    $P1732 = $P1731."pop"()
    store_lex "$name", $P1732
.annotate 'line', 640
    find_lex $P1736, "@ns"
    if $P1736, if_1735
    set $P1734, $P1736
    goto if_1735_end
  if_1735:
    find_lex $P1737, "@ns"
    unless_null $P1737, vivify_541
    $P1737 = root_new ['parrot';'ResizablePMCArray']
  vivify_541:
    set $P1738, $P1737[0]
    unless_null $P1738, vivify_542
    new $P1738, "Undef"
  vivify_542:
    set $S1739, $P1738
    iseq $I1740, $S1739, "GLOBAL"
    new $P1734, 'Integer'
    set $P1734, $I1740
  if_1735_end:
    unless $P1734, if_1733_end
    find_lex $P1741, "@ns"
    $P1741."shift"()
  if_1733_end:
.annotate 'line', 642
    get_hll_global $P1742, ["PAST"], "Var"
    find_lex $P1743, "$name"
    set $S1744, $P1743
    find_lex $P1745, "@ns"
    $P1746 = $P1742."new"($S1744 :named("name"), $P1745 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1746
.annotate 'line', 643
    find_lex $P1747, "$var"
    store_lex "$past", $P1747
.annotate 'line', 644
    find_lex $P1749, "$/"
    unless_null $P1749, vivify_543
    $P1749 = root_new ['parrot';'Hash']
  vivify_543:
    set $P1750, $P1749["args"]
    unless_null $P1750, vivify_544
    new $P1750, "Undef"
  vivify_544:
    unless $P1750, if_1748_end
.annotate 'line', 645
    find_lex $P1751, "$/"
    unless_null $P1751, vivify_545
    $P1751 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1752, $P1751["args"]
    unless_null $P1752, vivify_546
    $P1752 = root_new ['parrot';'ResizablePMCArray']
  vivify_546:
    set $P1753, $P1752[0]
    unless_null $P1753, vivify_547
    new $P1753, "Undef"
  vivify_547:
    $P1754 = $P1753."ast"()
    store_lex "$past", $P1754
.annotate 'line', 646
    find_lex $P1755, "$past"
    find_lex $P1756, "$var"
    $P1755."unshift"($P1756)
  if_1748_end:
.annotate 'line', 648
    find_lex $P1757, "$/"
    find_lex $P1758, "$past"
    $P1759 = $P1757."!make"($P1758)
.annotate 'line', 637
    .return ($P1759)
  control_1720:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1760, exception, "payload"
    .return ($P1760)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("96_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1764
.annotate 'line', 651
    new $P1763, 'ExceptionHandler'
    set_addr $P1763, control_1762
    $P1763."handle_types"(.CONTROL_RETURN)
    push_eh $P1763
    .lex "self", self
    .lex "$/", param_1764
.annotate 'line', 652
    new $P1765, "Undef"
    .lex "$past", $P1765
.annotate 'line', 653
    new $P1766, "Undef"
    .lex "$pirop", $P1766
.annotate 'line', 652
    find_lex $P1769, "$/"
    unless_null $P1769, vivify_548
    $P1769 = root_new ['parrot';'Hash']
  vivify_548:
    set $P1770, $P1769["args"]
    unless_null $P1770, vivify_549
    new $P1770, "Undef"
  vivify_549:
    if $P1770, if_1768
    get_hll_global $P1775, ["PAST"], "Op"
    find_lex $P1776, "$/"
    $P1777 = $P1775."new"($P1776 :named("node"))
    set $P1767, $P1777
    goto if_1768_end
  if_1768:
    find_lex $P1771, "$/"
    unless_null $P1771, vivify_550
    $P1771 = root_new ['parrot';'Hash']
  vivify_550:
    set $P1772, $P1771["args"]
    unless_null $P1772, vivify_551
    $P1772 = root_new ['parrot';'ResizablePMCArray']
  vivify_551:
    set $P1773, $P1772[0]
    unless_null $P1773, vivify_552
    new $P1773, "Undef"
  vivify_552:
    $P1774 = $P1773."ast"()
    set $P1767, $P1774
  if_1768_end:
    store_lex "$past", $P1767
.annotate 'line', 653
    find_lex $P1778, "$/"
    unless_null $P1778, vivify_553
    $P1778 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1779, $P1778["op"]
    unless_null $P1779, vivify_554
    new $P1779, "Undef"
  vivify_554:
    set $S1780, $P1779
    new $P1781, 'String'
    set $P1781, $S1780
    store_lex "$pirop", $P1781
.annotate 'line', 654

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1782 = box $S0
    
    store_lex "$pirop", $P1782
.annotate 'line', 661
    find_lex $P1783, "$past"
    find_lex $P1784, "$pirop"
    $P1783."pirop"($P1784)
.annotate 'line', 662
    find_lex $P1785, "$past"
    $P1785."pasttype"("pirop")
.annotate 'line', 663
    find_lex $P1786, "$/"
    find_lex $P1787, "$past"
    $P1788 = $P1786."!make"($P1787)
.annotate 'line', 651
    .return ($P1788)
  control_1762:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1789, exception, "payload"
    .return ($P1789)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("97_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1793
.annotate 'line', 666
    new $P1792, 'ExceptionHandler'
    set_addr $P1792, control_1791
    $P1792."handle_types"(.CONTROL_RETURN)
    push_eh $P1792
    .lex "self", self
    .lex "$/", param_1793
    find_lex $P1794, "$/"
    find_lex $P1795, "$/"
    unless_null $P1795, vivify_555
    $P1795 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1796, $P1795["arglist"]
    unless_null $P1796, vivify_556
    new $P1796, "Undef"
  vivify_556:
    $P1797 = $P1796."ast"()
    $P1798 = $P1794."!make"($P1797)
    .return ($P1798)
  control_1791:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1799, exception, "payload"
    .return ($P1799)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("98_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1803
.annotate 'line', 668
    .const 'Sub' $P1814 = "99_1283874343.0915" 
    capture_lex $P1814
    new $P1802, 'ExceptionHandler'
    set_addr $P1802, control_1801
    $P1802."handle_types"(.CONTROL_RETURN)
    push_eh $P1802
    .lex "self", self
    .lex "$/", param_1803
.annotate 'line', 669
    new $P1804, "Undef"
    .lex "$past", $P1804
.annotate 'line', 677
    new $P1805, "Undef"
    .lex "$i", $P1805
.annotate 'line', 678
    new $P1806, "Undef"
    .lex "$n", $P1806
.annotate 'line', 669
    get_hll_global $P1807, ["PAST"], "Op"
    find_lex $P1808, "$/"
    $P1809 = $P1807."new"("call" :named("pasttype"), $P1808 :named("node"))
    store_lex "$past", $P1809
.annotate 'line', 670
    find_lex $P1811, "$/"
    unless_null $P1811, vivify_557
    $P1811 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1812, $P1811["EXPR"]
    unless_null $P1812, vivify_558
    new $P1812, "Undef"
  vivify_558:
    unless $P1812, if_1810_end
    .const 'Sub' $P1814 = "99_1283874343.0915" 
    capture_lex $P1814
    $P1814()
  if_1810_end:
.annotate 'line', 677
    new $P1846, "Integer"
    assign $P1846, 0
    store_lex "$i", $P1846
.annotate 'line', 678
    find_lex $P1847, "$past"
    $P1848 = $P1847."list"()
    set $N1849, $P1848
    new $P1850, 'Float'
    set $P1850, $N1849
    store_lex "$n", $P1850
.annotate 'line', 679
    new $P1898, 'ExceptionHandler'
    set_addr $P1898, loop1897_handler
    $P1898."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1898
  loop1897_test:
    find_lex $P1851, "$i"
    set $N1852, $P1851
    find_lex $P1853, "$n"
    set $N1854, $P1853
    islt $I1855, $N1852, $N1854
    unless $I1855, loop1897_done
  loop1897_redo:
.annotate 'line', 680
    find_lex $P1857, "$i"
    set $I1858, $P1857
    find_lex $P1859, "$past"
    unless_null $P1859, vivify_562
    $P1859 = root_new ['parrot';'ResizablePMCArray']
  vivify_562:
    set $P1860, $P1859[$I1858]
    unless_null $P1860, vivify_563
    new $P1860, "Undef"
  vivify_563:
    $S1861 = $P1860."name"()
    iseq $I1862, $S1861, "&prefix:<|>"
    unless $I1862, if_1856_end
.annotate 'line', 681
    find_lex $P1863, "$i"
    set $I1864, $P1863
    find_lex $P1865, "$past"
    unless_null $P1865, vivify_564
    $P1865 = root_new ['parrot';'ResizablePMCArray']
  vivify_564:
    set $P1866, $P1865[$I1864]
    unless_null $P1866, vivify_565
    $P1866 = root_new ['parrot';'ResizablePMCArray']
  vivify_565:
    set $P1867, $P1866[0]
    unless_null $P1867, vivify_566
    new $P1867, "Undef"
  vivify_566:
    find_lex $P1868, "$i"
    set $I1869, $P1868
    find_lex $P1870, "$past"
    unless_null $P1870, vivify_567
    $P1870 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1870
  vivify_567:
    set $P1870[$I1869], $P1867
.annotate 'line', 682
    find_lex $P1871, "$i"
    set $I1872, $P1871
    find_lex $P1873, "$past"
    unless_null $P1873, vivify_568
    $P1873 = root_new ['parrot';'ResizablePMCArray']
  vivify_568:
    set $P1874, $P1873[$I1872]
    unless_null $P1874, vivify_569
    new $P1874, "Undef"
  vivify_569:
    $P1874."flat"(1)
.annotate 'line', 683
    find_lex $P1878, "$i"
    set $I1879, $P1878
    find_lex $P1880, "$past"
    unless_null $P1880, vivify_570
    $P1880 = root_new ['parrot';'ResizablePMCArray']
  vivify_570:
    set $P1881, $P1880[$I1879]
    unless_null $P1881, vivify_571
    new $P1881, "Undef"
  vivify_571:
    get_hll_global $P1882, ["PAST"], "Val"
    $P1883 = $P1881."isa"($P1882)
    if $P1883, if_1877
    set $P1876, $P1883
    goto if_1877_end
  if_1877:
.annotate 'line', 684
    find_lex $P1884, "$i"
    set $I1885, $P1884
    find_lex $P1886, "$past"
    unless_null $P1886, vivify_572
    $P1886 = root_new ['parrot';'ResizablePMCArray']
  vivify_572:
    set $P1887, $P1886[$I1885]
    unless_null $P1887, vivify_573
    new $P1887, "Undef"
  vivify_573:
    $S1888 = $P1887."name"()
    substr $S1889, $S1888, 0, 1
    iseq $I1890, $S1889, "%"
    new $P1876, 'Integer'
    set $P1876, $I1890
  if_1877_end:
    unless $P1876, if_1875_end
.annotate 'line', 685
    find_lex $P1891, "$i"
    set $I1892, $P1891
    find_lex $P1893, "$past"
    unless_null $P1893, vivify_574
    $P1893 = root_new ['parrot';'ResizablePMCArray']
  vivify_574:
    set $P1894, $P1893[$I1892]
    unless_null $P1894, vivify_575
    new $P1894, "Undef"
  vivify_575:
    $P1894."named"(1)
  if_1875_end:
  if_1856_end:
.annotate 'line', 680
    find_lex $P1895, "$i"
    clone $P1896, $P1895
    inc $P1895
  loop1897_next:
.annotate 'line', 679
    goto loop1897_test
  loop1897_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1899, exception, 'type'
    eq $P1899, .CONTROL_LOOP_NEXT, loop1897_next
    eq $P1899, .CONTROL_LOOP_REDO, loop1897_redo
  loop1897_done:
    pop_eh 
.annotate 'line', 690
    find_lex $P1900, "$/"
    find_lex $P1901, "$past"
    $P1902 = $P1900."!make"($P1901)
.annotate 'line', 668
    .return ($P1902)
  control_1801:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1903, exception, "payload"
    .return ($P1903)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1813"  :anon :subid("99_1283874343.0915") :outer("98_1283874343.0915")
.annotate 'line', 670
    .const 'Sub' $P1835 = "100_1283874343.0915" 
    capture_lex $P1835
.annotate 'line', 671
    new $P1815, "Undef"
    .lex "$expr", $P1815
    find_lex $P1816, "$/"
    unless_null $P1816, vivify_559
    $P1816 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1817, $P1816["EXPR"]
    unless_null $P1817, vivify_560
    new $P1817, "Undef"
  vivify_560:
    $P1818 = $P1817."ast"()
    store_lex "$expr", $P1818
.annotate 'line', 672
    find_lex $P1823, "$expr"
    $S1824 = $P1823."name"()
    iseq $I1825, $S1824, "&infix:<,>"
    if $I1825, if_1822
    new $P1821, 'Integer'
    set $P1821, $I1825
    goto if_1822_end
  if_1822:
    find_lex $P1826, "$expr"
    $P1827 = $P1826."named"()
    isfalse $I1828, $P1827
    new $P1821, 'Integer'
    set $P1821, $I1828
  if_1822_end:
    if $P1821, if_1820
.annotate 'line', 675
    find_lex $P1843, "$past"
    find_lex $P1844, "$expr"
    $P1845 = $P1843."push"($P1844)
    set $P1819, $P1845
.annotate 'line', 672
    goto if_1820_end
  if_1820:
.annotate 'line', 673
    find_lex $P1830, "$expr"
    $P1831 = $P1830."list"()
    defined $I1832, $P1831
    unless $I1832, for_undef_561
    iter $P1829, $P1831
    new $P1841, 'ExceptionHandler'
    set_addr $P1841, loop1840_handler
    $P1841."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1841
  loop1840_test:
    unless $P1829, loop1840_done
    shift $P1833, $P1829
  loop1840_redo:
    .const 'Sub' $P1835 = "100_1283874343.0915" 
    capture_lex $P1835
    $P1835($P1833)
  loop1840_next:
    goto loop1840_test
  loop1840_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1842, exception, 'type'
    eq $P1842, .CONTROL_LOOP_NEXT, loop1840_next
    eq $P1842, .CONTROL_LOOP_REDO, loop1840_redo
  loop1840_done:
    pop_eh 
  for_undef_561:
.annotate 'line', 672
    set $P1819, $P1829
  if_1820_end:
.annotate 'line', 670
    .return ($P1819)
.end


.namespace ["NQP";"Actions"]
.sub "_block1834"  :anon :subid("100_1283874343.0915") :outer("99_1283874343.0915")
    .param pmc param_1836
.annotate 'line', 673
    .lex "$_", param_1836
    find_lex $P1837, "$past"
    find_lex $P1838, "$_"
    $P1839 = $P1837."push"($P1838)
    .return ($P1839)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("101_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1907
.annotate 'line', 694
    new $P1906, 'ExceptionHandler'
    set_addr $P1906, control_1905
    $P1906."handle_types"(.CONTROL_RETURN)
    push_eh $P1906
    .lex "self", self
    .lex "$/", param_1907
    find_lex $P1908, "$/"
    find_lex $P1909, "$/"
    unless_null $P1909, vivify_576
    $P1909 = root_new ['parrot';'Hash']
  vivify_576:
    set $P1910, $P1909["value"]
    unless_null $P1910, vivify_577
    new $P1910, "Undef"
  vivify_577:
    $P1911 = $P1910."ast"()
    $P1912 = $P1908."!make"($P1911)
    .return ($P1912)
  control_1905:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1913, exception, "payload"
    .return ($P1913)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("102_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1917
.annotate 'line', 696
    new $P1916, 'ExceptionHandler'
    set_addr $P1916, control_1915
    $P1916."handle_types"(.CONTROL_RETURN)
    push_eh $P1916
    .lex "self", self
    .lex "$/", param_1917
.annotate 'line', 697
    find_lex $P1918, "$/"
.annotate 'line', 698
    find_lex $P1921, "$/"
    unless_null $P1921, vivify_578
    $P1921 = root_new ['parrot';'Hash']
  vivify_578:
    set $P1922, $P1921["EXPR"]
    unless_null $P1922, vivify_579
    new $P1922, "Undef"
  vivify_579:
    if $P1922, if_1920
.annotate 'line', 699
    get_hll_global $P1927, ["PAST"], "Op"
    find_lex $P1928, "$/"
    $P1929 = $P1927."new"("list" :named("pasttype"), $P1928 :named("node"))
    set $P1919, $P1929
.annotate 'line', 698
    goto if_1920_end
  if_1920:
    find_lex $P1923, "$/"
    unless_null $P1923, vivify_580
    $P1923 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1924, $P1923["EXPR"]
    unless_null $P1924, vivify_581
    $P1924 = root_new ['parrot';'ResizablePMCArray']
  vivify_581:
    set $P1925, $P1924[0]
    unless_null $P1925, vivify_582
    new $P1925, "Undef"
  vivify_582:
    $P1926 = $P1925."ast"()
    set $P1919, $P1926
  if_1920_end:
    $P1930 = $P1918."!make"($P1919)
.annotate 'line', 696
    .return ($P1930)
  control_1915:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1931, exception, "payload"
    .return ($P1931)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("103_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1935
.annotate 'line', 702
    new $P1934, 'ExceptionHandler'
    set_addr $P1934, control_1933
    $P1934."handle_types"(.CONTROL_RETURN)
    push_eh $P1934
    .lex "self", self
    .lex "$/", param_1935
.annotate 'line', 703
    new $P1936, "Undef"
    .lex "$past", $P1936
.annotate 'line', 702
    find_lex $P1937, "$past"
.annotate 'line', 704
    find_lex $P1939, "$/"
    unless_null $P1939, vivify_583
    $P1939 = root_new ['parrot';'Hash']
  vivify_583:
    set $P1940, $P1939["EXPR"]
    unless_null $P1940, vivify_584
    new $P1940, "Undef"
  vivify_584:
    if $P1940, if_1938
.annotate 'line', 711
    get_hll_global $P1952, ["PAST"], "Op"
    $P1953 = $P1952."new"("list" :named("pasttype"))
    store_lex "$past", $P1953
.annotate 'line', 710
    goto if_1938_end
  if_1938:
.annotate 'line', 705
    find_lex $P1941, "$/"
    unless_null $P1941, vivify_585
    $P1941 = root_new ['parrot';'Hash']
  vivify_585:
    set $P1942, $P1941["EXPR"]
    unless_null $P1942, vivify_586
    $P1942 = root_new ['parrot';'ResizablePMCArray']
  vivify_586:
    set $P1943, $P1942[0]
    unless_null $P1943, vivify_587
    new $P1943, "Undef"
  vivify_587:
    $P1944 = $P1943."ast"()
    store_lex "$past", $P1944
.annotate 'line', 706
    find_lex $P1946, "$past"
    $S1947 = $P1946."name"()
    isne $I1948, $S1947, "&infix:<,>"
    unless $I1948, if_1945_end
.annotate 'line', 707
    get_hll_global $P1949, ["PAST"], "Op"
    find_lex $P1950, "$past"
    $P1951 = $P1949."new"($P1950, "list" :named("pasttype"))
    store_lex "$past", $P1951
  if_1945_end:
  if_1938_end:
.annotate 'line', 713
    find_lex $P1954, "$past"
    $P1954."name"("&circumfix:<[ ]>")
.annotate 'line', 714
    find_lex $P1955, "$/"
    find_lex $P1956, "$past"
    $P1957 = $P1955."!make"($P1956)
.annotate 'line', 702
    .return ($P1957)
  control_1933:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1958, exception, "payload"
    .return ($P1958)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("104_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1962
.annotate 'line', 717
    new $P1961, 'ExceptionHandler'
    set_addr $P1961, control_1960
    $P1961."handle_types"(.CONTROL_RETURN)
    push_eh $P1961
    .lex "self", self
    .lex "$/", param_1962
    find_lex $P1963, "$/"
    find_lex $P1964, "$/"
    unless_null $P1964, vivify_588
    $P1964 = root_new ['parrot';'Hash']
  vivify_588:
    set $P1965, $P1964["quote_EXPR"]
    unless_null $P1965, vivify_589
    new $P1965, "Undef"
  vivify_589:
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
.include "except_types.pasm"
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1972
.annotate 'line', 718
    new $P1971, 'ExceptionHandler'
    set_addr $P1971, control_1970
    $P1971."handle_types"(.CONTROL_RETURN)
    push_eh $P1971
    .lex "self", self
    .lex "$/", param_1972
    find_lex $P1973, "$/"
    find_lex $P1974, "$/"
    unless_null $P1974, vivify_590
    $P1974 = root_new ['parrot';'Hash']
  vivify_590:
    set $P1975, $P1974["quote_EXPR"]
    unless_null $P1975, vivify_591
    new $P1975, "Undef"
  vivify_591:
    $P1976 = $P1975."ast"()
    $P1977 = $P1973."!make"($P1976)
    .return ($P1977)
  control_1970:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1978, exception, "payload"
    .return ($P1978)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("106_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_1982
.annotate 'line', 720
    new $P1981, 'ExceptionHandler'
    set_addr $P1981, control_1980
    $P1981."handle_types"(.CONTROL_RETURN)
    push_eh $P1981
    .lex "self", self
    .lex "$/", param_1982
.annotate 'line', 721
    new $P1983, "Undef"
    .lex "$past", $P1983
    find_lex $P1986, "$/"
    unless_null $P1986, vivify_592
    $P1986 = root_new ['parrot';'Hash']
  vivify_592:
    set $P1987, $P1986["pblock"]
    unless_null $P1987, vivify_593
    $P1987 = root_new ['parrot';'Hash']
  vivify_593:
    set $P1988, $P1987["blockoid"]
    unless_null $P1988, vivify_594
    $P1988 = root_new ['parrot';'Hash']
  vivify_594:
    set $P1989, $P1988["statementlist"]
    unless_null $P1989, vivify_595
    $P1989 = root_new ['parrot';'Hash']
  vivify_595:
    set $P1990, $P1989["statement"]
    unless_null $P1990, vivify_596
    new $P1990, "Undef"
  vivify_596:
    set $N1991, $P1990
    isgt $I1992, $N1991, 0.0
    if $I1992, if_1985
.annotate 'line', 723
    $P1996 = "vivitype"("%")
    set $P1984, $P1996
.annotate 'line', 721
    goto if_1985_end
  if_1985:
.annotate 'line', 722
    find_lex $P1993, "$/"
    unless_null $P1993, vivify_597
    $P1993 = root_new ['parrot';'Hash']
  vivify_597:
    set $P1994, $P1993["pblock"]
    unless_null $P1994, vivify_598
    new $P1994, "Undef"
  vivify_598:
    $P1995 = $P1994."ast"()
    set $P1984, $P1995
  if_1985_end:
    store_lex "$past", $P1984
.annotate 'line', 724
    new $P1997, "Integer"
    assign $P1997, 1
    find_lex $P1998, "$past"
    unless_null $P1998, vivify_599
    $P1998 = root_new ['parrot';'Hash']
    store_lex "$past", $P1998
  vivify_599:
    set $P1998["bareblock"], $P1997
.annotate 'line', 725
    find_lex $P1999, "$/"
    find_lex $P2000, "$past"
    $P2001 = $P1999."!make"($P2000)
.annotate 'line', 720
    .return ($P2001)
  control_1980:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2002, exception, "payload"
    .return ($P2002)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("107_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2006
.annotate 'line', 728
    new $P2005, 'ExceptionHandler'
    set_addr $P2005, control_2004
    $P2005."handle_types"(.CONTROL_RETURN)
    push_eh $P2005
    .lex "self", self
    .lex "$/", param_2006
.annotate 'line', 729
    new $P2007, "Undef"
    .lex "$name", $P2007
    find_lex $P2010, "$/"
    unless_null $P2010, vivify_600
    $P2010 = root_new ['parrot';'Hash']
  vivify_600:
    set $P2011, $P2010["sigil"]
    unless_null $P2011, vivify_601
    new $P2011, "Undef"
  vivify_601:
    set $S2012, $P2011
    iseq $I2013, $S2012, "@"
    if $I2013, if_2009
.annotate 'line', 730
    find_lex $P2017, "$/"
    unless_null $P2017, vivify_602
    $P2017 = root_new ['parrot';'Hash']
  vivify_602:
    set $P2018, $P2017["sigil"]
    unless_null $P2018, vivify_603
    new $P2018, "Undef"
  vivify_603:
    set $S2019, $P2018
    iseq $I2020, $S2019, "%"
    if $I2020, if_2016
    new $P2022, "String"
    assign $P2022, "item"
    set $P2015, $P2022
    goto if_2016_end
  if_2016:
    new $P2021, "String"
    assign $P2021, "hash"
    set $P2015, $P2021
  if_2016_end:
    set $P2008, $P2015
.annotate 'line', 729
    goto if_2009_end
  if_2009:
    new $P2014, "String"
    assign $P2014, "list"
    set $P2008, $P2014
  if_2009_end:
    store_lex "$name", $P2008
.annotate 'line', 732
    find_lex $P2023, "$/"
    get_hll_global $P2024, ["PAST"], "Op"
    find_lex $P2025, "$name"
    find_lex $P2026, "$/"
    unless_null $P2026, vivify_604
    $P2026 = root_new ['parrot';'Hash']
  vivify_604:
    set $P2027, $P2026["semilist"]
    unless_null $P2027, vivify_605
    new $P2027, "Undef"
  vivify_605:
    $P2028 = $P2027."ast"()
    $P2029 = $P2024."new"($P2028, "callmethod" :named("pasttype"), $P2025 :named("name"))
    $P2030 = $P2023."!make"($P2029)
.annotate 'line', 728
    .return ($P2030)
  control_2004:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2031, exception, "payload"
    .return ($P2031)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("108_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2035
.annotate 'line', 735
    new $P2034, 'ExceptionHandler'
    set_addr $P2034, control_2033
    $P2034."handle_types"(.CONTROL_RETURN)
    push_eh $P2034
    .lex "self", self
    .lex "$/", param_2035
    find_lex $P2036, "$/"
    find_lex $P2037, "$/"
    unless_null $P2037, vivify_606
    $P2037 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2038, $P2037["statement"]
    unless_null $P2038, vivify_607
    new $P2038, "Undef"
  vivify_607:
    $P2039 = $P2038."ast"()
    $P2040 = $P2036."!make"($P2039)
    .return ($P2040)
  control_2033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2041, exception, "payload"
    .return ($P2041)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("109_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2045
.annotate 'line', 737
    new $P2044, 'ExceptionHandler'
    set_addr $P2044, control_2043
    $P2044."handle_types"(.CONTROL_RETURN)
    push_eh $P2044
    .lex "self", self
    .lex "$/", param_2045
.annotate 'line', 738
    find_lex $P2046, "$/"
    get_hll_global $P2047, ["PAST"], "Var"
    find_lex $P2048, "$/"
    unless_null $P2048, vivify_608
    $P2048 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2049, $P2048["EXPR"]
    unless_null $P2049, vivify_609
    new $P2049, "Undef"
  vivify_609:
    $P2050 = $P2049."ast"()
.annotate 'line', 740
    $P2051 = "vivitype"("@")
    $P2052 = $P2047."new"($P2050, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2051 :named("vivibase"))
.annotate 'line', 738
    $P2053 = $P2046."!make"($P2052)
.annotate 'line', 737
    .return ($P2053)
  control_2043:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2054, exception, "payload"
    .return ($P2054)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("110_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2058
.annotate 'line', 743
    new $P2057, 'ExceptionHandler'
    set_addr $P2057, control_2056
    $P2057."handle_types"(.CONTROL_RETURN)
    push_eh $P2057
    .lex "self", self
    .lex "$/", param_2058
.annotate 'line', 744
    find_lex $P2059, "$/"
    get_hll_global $P2060, ["PAST"], "Var"
    find_lex $P2061, "$/"
    unless_null $P2061, vivify_610
    $P2061 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2062, $P2061["EXPR"]
    unless_null $P2062, vivify_611
    new $P2062, "Undef"
  vivify_611:
    $P2063 = $P2062."ast"()
.annotate 'line', 746
    $P2064 = "vivitype"("%")
    $P2065 = $P2060."new"($P2063, "keyed" :named("scope"), "Undef" :named("viviself"), $P2064 :named("vivibase"))
.annotate 'line', 744
    $P2066 = $P2059."!make"($P2065)
.annotate 'line', 743
    .return ($P2066)
  control_2056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2067, exception, "payload"
    .return ($P2067)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("111_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2071
.annotate 'line', 749
    new $P2070, 'ExceptionHandler'
    set_addr $P2070, control_2069
    $P2070."handle_types"(.CONTROL_RETURN)
    push_eh $P2070
    .lex "self", self
    .lex "$/", param_2071
.annotate 'line', 750
    find_lex $P2072, "$/"
    get_hll_global $P2073, ["PAST"], "Var"
    find_lex $P2074, "$/"
    unless_null $P2074, vivify_612
    $P2074 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2075, $P2074["quote_EXPR"]
    unless_null $P2075, vivify_613
    new $P2075, "Undef"
  vivify_613:
    $P2076 = $P2075."ast"()
.annotate 'line', 752
    $P2077 = "vivitype"("%")
    $P2078 = $P2073."new"($P2076, "keyed" :named("scope"), "Undef" :named("viviself"), $P2077 :named("vivibase"))
.annotate 'line', 750
    $P2079 = $P2072."!make"($P2078)
.annotate 'line', 749
    .return ($P2079)
  control_2069:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2080, exception, "payload"
    .return ($P2080)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("112_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2084
.annotate 'line', 755
    new $P2083, 'ExceptionHandler'
    set_addr $P2083, control_2082
    $P2083."handle_types"(.CONTROL_RETURN)
    push_eh $P2083
    .lex "self", self
    .lex "$/", param_2084
.annotate 'line', 756
    find_lex $P2085, "$/"
    find_lex $P2086, "$/"
    unless_null $P2086, vivify_614
    $P2086 = root_new ['parrot';'Hash']
  vivify_614:
    set $P2087, $P2086["arglist"]
    unless_null $P2087, vivify_615
    new $P2087, "Undef"
  vivify_615:
    $P2088 = $P2087."ast"()
    $P2089 = $P2085."!make"($P2088)
.annotate 'line', 755
    .return ($P2089)
  control_2082:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2090, exception, "payload"
    .return ($P2090)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("113_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2094
.annotate 'line', 759
    new $P2093, 'ExceptionHandler'
    set_addr $P2093, control_2092
    $P2093."handle_types"(.CONTROL_RETURN)
    push_eh $P2093
    .lex "self", self
    .lex "$/", param_2094
.annotate 'line', 760
    find_lex $P2095, "$/"
    find_lex $P2098, "$/"
    unless_null $P2098, vivify_616
    $P2098 = root_new ['parrot';'Hash']
  vivify_616:
    set $P2099, $P2098["quote"]
    unless_null $P2099, vivify_617
    new $P2099, "Undef"
  vivify_617:
    if $P2099, if_2097
    find_lex $P2103, "$/"
    unless_null $P2103, vivify_618
    $P2103 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2104, $P2103["number"]
    unless_null $P2104, vivify_619
    new $P2104, "Undef"
  vivify_619:
    $P2105 = $P2104."ast"()
    set $P2096, $P2105
    goto if_2097_end
  if_2097:
    find_lex $P2100, "$/"
    unless_null $P2100, vivify_620
    $P2100 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2101, $P2100["quote"]
    unless_null $P2101, vivify_621
    new $P2101, "Undef"
  vivify_621:
    $P2102 = $P2101."ast"()
    set $P2096, $P2102
  if_2097_end:
    $P2106 = $P2095."!make"($P2096)
.annotate 'line', 759
    .return ($P2106)
  control_2092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2107, exception, "payload"
    .return ($P2107)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("114_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2111
.annotate 'line', 763
    new $P2110, 'ExceptionHandler'
    set_addr $P2110, control_2109
    $P2110."handle_types"(.CONTROL_RETURN)
    push_eh $P2110
    .lex "self", self
    .lex "$/", param_2111
.annotate 'line', 764
    new $P2112, "Undef"
    .lex "$value", $P2112
    find_lex $P2115, "$/"
    unless_null $P2115, vivify_622
    $P2115 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2116, $P2115["dec_number"]
    unless_null $P2116, vivify_623
    new $P2116, "Undef"
  vivify_623:
    if $P2116, if_2114
    find_lex $P2120, "$/"
    unless_null $P2120, vivify_624
    $P2120 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2121, $P2120["integer"]
    unless_null $P2121, vivify_625
    new $P2121, "Undef"
  vivify_625:
    $P2122 = $P2121."ast"()
    set $P2113, $P2122
    goto if_2114_end
  if_2114:
    find_lex $P2117, "$/"
    unless_null $P2117, vivify_626
    $P2117 = root_new ['parrot';'Hash']
  vivify_626:
    set $P2118, $P2117["dec_number"]
    unless_null $P2118, vivify_627
    new $P2118, "Undef"
  vivify_627:
    $P2119 = $P2118."ast"()
    set $P2113, $P2119
  if_2114_end:
    store_lex "$value", $P2113
.annotate 'line', 765
    find_lex $P2124, "$/"
    unless_null $P2124, vivify_628
    $P2124 = root_new ['parrot';'Hash']
  vivify_628:
    set $P2125, $P2124["sign"]
    unless_null $P2125, vivify_629
    new $P2125, "Undef"
  vivify_629:
    set $S2126, $P2125
    iseq $I2127, $S2126, "-"
    unless $I2127, if_2123_end
    find_lex $P2128, "$value"
    neg $P2129, $P2128
    store_lex "$value", $P2129
  if_2123_end:
.annotate 'line', 766
    find_lex $P2130, "$/"
    get_hll_global $P2131, ["PAST"], "Val"
    find_lex $P2132, "$value"
    $P2133 = $P2131."new"($P2132 :named("value"))
    $P2134 = $P2130."!make"($P2133)
.annotate 'line', 763
    .return ($P2134)
  control_2109:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2135, exception, "payload"
    .return ($P2135)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("115_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2139
.annotate 'line', 769
    new $P2138, 'ExceptionHandler'
    set_addr $P2138, control_2137
    $P2138."handle_types"(.CONTROL_RETURN)
    push_eh $P2138
    .lex "self", self
    .lex "$/", param_2139
    find_lex $P2140, "$/"
    find_lex $P2141, "$/"
    unless_null $P2141, vivify_630
    $P2141 = root_new ['parrot';'Hash']
  vivify_630:
    set $P2142, $P2141["quote_EXPR"]
    unless_null $P2142, vivify_631
    new $P2142, "Undef"
  vivify_631:
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
.sub "quote:sym<dblq>"  :subid("116_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2149
.annotate 'line', 770
    new $P2148, 'ExceptionHandler'
    set_addr $P2148, control_2147
    $P2148."handle_types"(.CONTROL_RETURN)
    push_eh $P2148
    .lex "self", self
    .lex "$/", param_2149
    find_lex $P2150, "$/"
    find_lex $P2151, "$/"
    unless_null $P2151, vivify_632
    $P2151 = root_new ['parrot';'Hash']
  vivify_632:
    set $P2152, $P2151["quote_EXPR"]
    unless_null $P2152, vivify_633
    new $P2152, "Undef"
  vivify_633:
    $P2153 = $P2152."ast"()
    $P2154 = $P2150."!make"($P2153)
    .return ($P2154)
  control_2147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2155, exception, "payload"
    .return ($P2155)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<qq>"  :subid("117_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2159
.annotate 'line', 771
    new $P2158, 'ExceptionHandler'
    set_addr $P2158, control_2157
    $P2158."handle_types"(.CONTROL_RETURN)
    push_eh $P2158
    .lex "self", self
    .lex "$/", param_2159
    find_lex $P2160, "$/"
    find_lex $P2161, "$/"
    unless_null $P2161, vivify_634
    $P2161 = root_new ['parrot';'Hash']
  vivify_634:
    set $P2162, $P2161["quote_EXPR"]
    unless_null $P2162, vivify_635
    new $P2162, "Undef"
  vivify_635:
    $P2163 = $P2162."ast"()
    $P2164 = $P2160."!make"($P2163)
    .return ($P2164)
  control_2157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2165, exception, "payload"
    .return ($P2165)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<q>"  :subid("118_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2169
.annotate 'line', 772
    new $P2168, 'ExceptionHandler'
    set_addr $P2168, control_2167
    $P2168."handle_types"(.CONTROL_RETURN)
    push_eh $P2168
    .lex "self", self
    .lex "$/", param_2169
    find_lex $P2170, "$/"
    find_lex $P2171, "$/"
    unless_null $P2171, vivify_636
    $P2171 = root_new ['parrot';'Hash']
  vivify_636:
    set $P2172, $P2171["quote_EXPR"]
    unless_null $P2172, vivify_637
    new $P2172, "Undef"
  vivify_637:
    $P2173 = $P2172."ast"()
    $P2174 = $P2170."!make"($P2173)
    .return ($P2174)
  control_2167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2175, exception, "payload"
    .return ($P2175)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q>"  :subid("119_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2179
.annotate 'line', 773
    new $P2178, 'ExceptionHandler'
    set_addr $P2178, control_2177
    $P2178."handle_types"(.CONTROL_RETURN)
    push_eh $P2178
    .lex "self", self
    .lex "$/", param_2179
    find_lex $P2180, "$/"
    find_lex $P2181, "$/"
    unless_null $P2181, vivify_638
    $P2181 = root_new ['parrot';'Hash']
  vivify_638:
    set $P2182, $P2181["quote_EXPR"]
    unless_null $P2182, vivify_639
    new $P2182, "Undef"
  vivify_639:
    $P2183 = $P2182."ast"()
    $P2184 = $P2180."!make"($P2183)
    .return ($P2184)
  control_2177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2185, exception, "payload"
    .return ($P2185)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q:PIR>"  :subid("120_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2189
.annotate 'line', 774
    new $P2188, 'ExceptionHandler'
    set_addr $P2188, control_2187
    $P2188."handle_types"(.CONTROL_RETURN)
    push_eh $P2188
    .lex "self", self
    .lex "$/", param_2189
.annotate 'line', 775
    find_lex $P2190, "$/"
    get_hll_global $P2191, ["PAST"], "Op"
    find_lex $P2192, "$/"
    unless_null $P2192, vivify_640
    $P2192 = root_new ['parrot';'Hash']
  vivify_640:
    set $P2193, $P2192["quote_EXPR"]
    unless_null $P2193, vivify_641
    new $P2193, "Undef"
  vivify_641:
    $P2194 = $P2193."ast"()
    $P2195 = $P2194."value"()
    find_lex $P2196, "$/"
    $P2197 = $P2191."new"($P2195 :named("inline"), "inline" :named("pasttype"), $P2196 :named("node"))
    $P2198 = $P2190."!make"($P2197)
.annotate 'line', 774
    .return ($P2198)
  control_2187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2199, exception, "payload"
    .return ($P2199)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("121_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2203
    .param pmc param_2204 :optional
    .param int has_param_2204 :opt_flag
.annotate 'line', 780
    new $P2202, 'ExceptionHandler'
    set_addr $P2202, control_2201
    $P2202."handle_types"(.CONTROL_RETURN)
    push_eh $P2202
    .lex "self", self
    .lex "$/", param_2203
    if has_param_2204, optparam_642
    new $P2205, "Undef"
    set param_2204, $P2205
  optparam_642:
    .lex "$key", param_2204
.annotate 'line', 790
    new $P2206, "Undef"
    .lex "$regex", $P2206
.annotate 'line', 792
    new $P2207, "Undef"
    .lex "$past", $P2207
.annotate 'line', 781
    find_lex $P2209, "$key"
    set $S2210, $P2209
    iseq $I2211, $S2210, "open"
    unless $I2211, if_2208_end
.annotate 'line', 782

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 786
    get_global $P2212, "@BLOCK"
    unless_null $P2212, vivify_643
    $P2212 = root_new ['parrot';'ResizablePMCArray']
  vivify_643:
    set $P2213, $P2212[0]
    unless_null $P2213, vivify_644
    new $P2213, "Undef"
  vivify_644:
    $P2213."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 787
    get_global $P2214, "@BLOCK"
    unless_null $P2214, vivify_645
    $P2214 = root_new ['parrot';'ResizablePMCArray']
  vivify_645:
    set $P2215, $P2214[0]
    unless_null $P2215, vivify_646
    new $P2215, "Undef"
  vivify_646:
    $P2215."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 788
    new $P2216, "Exception"
    set $P2216['type'], .CONTROL_RETURN
    new $P2217, "Integer"
    assign $P2217, 0
    setattribute $P2216, 'payload', $P2217
    throw $P2216
  if_2208_end:
.annotate 'line', 791
    get_hll_global $P2218, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2219, "$/"
    unless_null $P2219, vivify_647
    $P2219 = root_new ['parrot';'Hash']
  vivify_647:
    set $P2220, $P2219["p6regex"]
    unless_null $P2220, vivify_648
    new $P2220, "Undef"
  vivify_648:
    $P2221 = $P2220."ast"()
    get_global $P2222, "@BLOCK"
    $P2223 = $P2222."shift"()
    $P2224 = $P2218($P2221, $P2223)
    store_lex "$regex", $P2224
.annotate 'line', 793
    get_hll_global $P2225, ["PAST"], "Op"
.annotate 'line', 795
    get_hll_global $P2226, ["PAST"], "Var"
    new $P2227, "ResizablePMCArray"
    push $P2227, "Regex"
    $P2228 = $P2226."new"("Regex" :named("name"), $P2227 :named("namespace"), "package" :named("scope"))
    find_lex $P2229, "$regex"
    $P2230 = $P2225."new"($P2228, $P2229, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 793
    store_lex "$past", $P2230
.annotate 'line', 799
    find_lex $P2231, "$regex"
    find_lex $P2232, "$past"
    unless_null $P2232, vivify_649
    $P2232 = root_new ['parrot';'Hash']
    store_lex "$past", $P2232
  vivify_649:
    set $P2232["sink"], $P2231
.annotate 'line', 800
    find_lex $P2233, "$/"
    find_lex $P2234, "$past"
    $P2235 = $P2233."!make"($P2234)
.annotate 'line', 780
    .return ($P2235)
  control_2201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2236, exception, "payload"
    .return ($P2236)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("122_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2240
.annotate 'line', 803
    new $P2239, 'ExceptionHandler'
    set_addr $P2239, control_2238
    $P2239."handle_types"(.CONTROL_RETURN)
    push_eh $P2239
    .lex "self", self
    .lex "$/", param_2240
    find_lex $P2241, "$/"
    find_lex $P2242, "$/"
    unless_null $P2242, vivify_650
    $P2242 = root_new ['parrot';'Hash']
  vivify_650:
    set $P2243, $P2242["variable"]
    unless_null $P2243, vivify_651
    new $P2243, "Undef"
  vivify_651:
    $P2244 = $P2243."ast"()
    $P2245 = $P2241."!make"($P2244)
    .return ($P2245)
  control_2238:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2246, exception, "payload"
    .return ($P2246)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("123_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2250
.annotate 'line', 804
    new $P2249, 'ExceptionHandler'
    set_addr $P2249, control_2248
    $P2249."handle_types"(.CONTROL_RETURN)
    push_eh $P2249
    .lex "self", self
    .lex "$/", param_2250
.annotate 'line', 805
    find_lex $P2251, "$/"
    get_hll_global $P2252, ["PAST"], "Op"
.annotate 'line', 806
    find_lex $P2253, "$/"
    unless_null $P2253, vivify_652
    $P2253 = root_new ['parrot';'Hash']
  vivify_652:
    set $P2254, $P2253["block"]
    unless_null $P2254, vivify_653
    new $P2254, "Undef"
  vivify_653:
    $P2255 = $P2254."ast"()
    $P2256 = "block_immediate"($P2255)
    find_lex $P2257, "$/"
    $P2258 = $P2252."new"($P2256, "set S*" :named("pirop"), $P2257 :named("node"))
.annotate 'line', 805
    $P2259 = $P2251."!make"($P2258)
.annotate 'line', 804
    .return ($P2259)
  control_2248:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2260, exception, "payload"
    .return ($P2260)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("124_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2264
.annotate 'line', 809
    new $P2263, 'ExceptionHandler'
    set_addr $P2263, control_2262
    $P2263."handle_types"(.CONTROL_RETURN)
    push_eh $P2263
    .lex "self", self
    .lex "$/", param_2264
    find_lex $P2265, "$/"
    $P2266 = $P2265."!make"("\e")
    .return ($P2266)
  control_2262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2267, exception, "payload"
    .return ($P2267)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("125_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2271
.annotate 'line', 813
    new $P2270, 'ExceptionHandler'
    set_addr $P2270, control_2269
    $P2270."handle_types"(.CONTROL_RETURN)
    push_eh $P2270
    .lex "self", self
    .lex "$/", param_2271
    find_lex $P2272, "$/"
    find_lex $P2273, "$/"
    unless_null $P2273, vivify_654
    $P2273 = root_new ['parrot';'Hash']
  vivify_654:
    set $P2274, $P2273["dotty"]
    unless_null $P2274, vivify_655
    new $P2274, "Undef"
  vivify_655:
    $P2275 = $P2274."ast"()
    $P2276 = $P2272."!make"($P2275)
    .return ($P2276)
  control_2269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2277, exception, "payload"
    .return ($P2277)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("126_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2281
.annotate 'line', 815
    new $P2280, 'ExceptionHandler'
    set_addr $P2280, control_2279
    $P2280."handle_types"(.CONTROL_RETURN)
    push_eh $P2280
    .lex "self", self
    .lex "$/", param_2281
.annotate 'line', 816
    find_lex $P2282, "$/"
    get_hll_global $P2283, ["PAST"], "Op"
.annotate 'line', 817
    new $P2284, "ResizablePMCArray"
    push $P2284, "    clone %r, %0"
    push $P2284, "    inc %0"
    $P2285 = $P2283."new"("postfix:<++>" :named("name"), $P2284 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 816
    $P2286 = $P2282."!make"($P2285)
.annotate 'line', 815
    .return ($P2286)
  control_2279:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2287, exception, "payload"
    .return ($P2287)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("127_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2291
.annotate 'line', 821
    new $P2290, 'ExceptionHandler'
    set_addr $P2290, control_2289
    $P2290."handle_types"(.CONTROL_RETURN)
    push_eh $P2290
    .lex "self", self
    .lex "$/", param_2291
.annotate 'line', 822
    find_lex $P2292, "$/"
    get_hll_global $P2293, ["PAST"], "Op"
.annotate 'line', 823
    new $P2294, "ResizablePMCArray"
    push $P2294, "    clone %r, %0"
    push $P2294, "    dec %0"
    $P2295 = $P2293."new"("postfix:<-->" :named("name"), $P2294 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 822
    $P2296 = $P2292."!make"($P2295)
.annotate 'line', 821
    .return ($P2296)
  control_2289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2297, exception, "payload"
    .return ($P2297)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("128_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2301
.annotate 'line', 827
    new $P2300, 'ExceptionHandler'
    set_addr $P2300, control_2299
    $P2300."handle_types"(.CONTROL_RETURN)
    push_eh $P2300
    .lex "self", self
    .lex "$/", param_2301
.annotate 'line', 828
    find_lex $P2302, "$/"
    get_hll_global $P2303, ["PAST"], "Op"
.annotate 'line', 829
    get_hll_global $P2304, ["PAST"], "Var"
    $P2305 = $P2304."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2306, "$/"
    $P2307 = $P2303."new"($P2305, "callmethod" :named("pasttype"), "!make" :named("name"), $P2306 :named("node"))
.annotate 'line', 828
    $P2308 = $P2302."!make"($P2307)
.annotate 'line', 827
    .return ($P2308)
  control_2299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2309, exception, "payload"
    .return ($P2309)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("129_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2314
.annotate 'line', 845
    new $P2313, 'ExceptionHandler'
    set_addr $P2313, control_2312
    $P2313."handle_types"(.CONTROL_RETURN)
    push_eh $P2313
    .lex "self", self
    .lex "$/", param_2314
    find_lex $P2315, "$/"
    $P2316 = "control"($P2315, "CONTROL_LOOP_NEXT")
    .return ($P2316)
  control_2312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2317, exception, "payload"
    .return ($P2317)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("130_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2321
.annotate 'line', 846
    new $P2320, 'ExceptionHandler'
    set_addr $P2320, control_2319
    $P2320."handle_types"(.CONTROL_RETURN)
    push_eh $P2320
    .lex "self", self
    .lex "$/", param_2321
    find_lex $P2322, "$/"
    $P2323 = "control"($P2322, "CONTROL_LOOP_LAST")
    .return ($P2323)
  control_2319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2324, exception, "payload"
    .return ($P2324)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("131_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2328
.annotate 'line', 847
    new $P2327, 'ExceptionHandler'
    set_addr $P2327, control_2326
    $P2327."handle_types"(.CONTROL_RETURN)
    push_eh $P2327
    .lex "self", self
    .lex "$/", param_2328
    find_lex $P2329, "$/"
    $P2330 = "control"($P2329, "CONTROL_LOOP_REDO")
    .return ($P2330)
  control_2326:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2331, exception, "payload"
    .return ($P2331)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("132_1283874343.0915") :method :outer("11_1283874343.0915")
    .param pmc param_2335
.annotate 'line', 849
    new $P2334, 'ExceptionHandler'
    set_addr $P2334, control_2333
    $P2334."handle_types"(.CONTROL_RETURN)
    push_eh $P2334
    .lex "self", self
    .lex "$/", param_2335
.annotate 'line', 850
    find_lex $P2336, "$/"
    get_hll_global $P2337, ["PAST"], "Op"
    find_lex $P2338, "$/"
    $P2339 = $P2337."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2338 :named("node"))
    $P2340 = $P2336."!make"($P2339)
.annotate 'line', 849
    .return ($P2340)
  control_2333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2341, exception, "payload"
    .return ($P2341)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2342"  :subid("133_1283874343.0915") :outer("11_1283874343.0915")
.annotate 'line', 854
    .const 'Sub' $P2428 = "140_1283874343.0915" 
    capture_lex $P2428
    .const 'Sub' $P2415 = "139_1283874343.0915" 
    capture_lex $P2415
    .const 'Sub' $P2398 = "138_1283874343.0915" 
    capture_lex $P2398
    .const 'Sub' $P2385 = "137_1283874343.0915" 
    capture_lex $P2385
    .const 'Sub' $P2372 = "136_1283874343.0915" 
    capture_lex $P2372
    .const 'Sub' $P2359 = "135_1283874343.0915" 
    capture_lex $P2359
    .const 'Sub' $P2344 = "134_1283874343.0915" 
    capture_lex $P2344
.annotate 'line', 888
    .const 'Sub' $P2428 = "140_1283874343.0915" 
    newclosure $P2453, $P2428
.annotate 'line', 854
    .return ($P2453)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("134_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2347
.annotate 'line', 856
    new $P2346, 'ExceptionHandler'
    set_addr $P2346, control_2345
    $P2346."handle_types"(.CONTROL_RETURN)
    push_eh $P2346
    .lex "self", self
    .lex "$/", param_2347
.annotate 'line', 857
    new $P2348, "Undef"
    .lex "$past", $P2348
    find_lex $P2349, "$/"
    unless_null $P2349, vivify_656
    $P2349 = root_new ['parrot';'Hash']
  vivify_656:
    set $P2350, $P2349["statement"]
    unless_null $P2350, vivify_657
    new $P2350, "Undef"
  vivify_657:
    $P2351 = $P2350."ast"()
    store_lex "$past", $P2351
.annotate 'line', 858
    find_lex $P2352, "$/"
    get_hll_global $P2353, ["PAST"], "Regex"
    find_lex $P2354, "$past"
    find_lex $P2355, "$/"
    $P2356 = $P2353."new"($P2354, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P2355 :named("node"))
    $P2357 = $P2352."!make"($P2356)
.annotate 'line', 856
    .return ($P2357)
  control_2345:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2358, exception, "payload"
    .return ($P2358)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("135_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2362
.annotate 'line', 862
    new $P2361, 'ExceptionHandler'
    set_addr $P2361, control_2360
    $P2361."handle_types"(.CONTROL_RETURN)
    push_eh $P2361
    .lex "self", self
    .lex "$/", param_2362
.annotate 'line', 863
    find_lex $P2363, "$/"
    get_hll_global $P2364, ["PAST"], "Regex"
    find_lex $P2365, "$/"
    unless_null $P2365, vivify_658
    $P2365 = root_new ['parrot';'Hash']
  vivify_658:
    set $P2366, $P2365["codeblock"]
    unless_null $P2366, vivify_659
    new $P2366, "Undef"
  vivify_659:
    $P2367 = $P2366."ast"()
    find_lex $P2368, "$/"
    $P2369 = $P2364."new"($P2367, "pastnode" :named("pasttype"), $P2368 :named("node"))
    $P2370 = $P2363."!make"($P2369)
.annotate 'line', 862
    .return ($P2370)
  control_2360:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2371, exception, "payload"
    .return ($P2371)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("136_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2375
.annotate 'line', 867
    new $P2374, 'ExceptionHandler'
    set_addr $P2374, control_2373
    $P2374."handle_types"(.CONTROL_RETURN)
    push_eh $P2374
    .lex "self", self
    .lex "$/", param_2375
.annotate 'line', 868
    find_lex $P2376, "$/"
    get_hll_global $P2377, ["PAST"], "Regex"
    find_lex $P2378, "$/"
    unless_null $P2378, vivify_660
    $P2378 = root_new ['parrot';'Hash']
  vivify_660:
    set $P2379, $P2378["var"]
    unless_null $P2379, vivify_661
    new $P2379, "Undef"
  vivify_661:
    $P2380 = $P2379."ast"()
    find_lex $P2381, "$/"
    $P2382 = $P2377."new"("!INTERPOLATE", $P2380, "subrule" :named("pasttype"), "method" :named("subtype"), $P2381 :named("node"))
    $P2383 = $P2376."!make"($P2382)
.annotate 'line', 867
    .return ($P2383)
  control_2373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2384, exception, "payload"
    .return ($P2384)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("137_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2388
.annotate 'line', 872
    new $P2387, 'ExceptionHandler'
    set_addr $P2387, control_2386
    $P2387."handle_types"(.CONTROL_RETURN)
    push_eh $P2387
    .lex "self", self
    .lex "$/", param_2388
.annotate 'line', 873
    find_lex $P2389, "$/"
    get_hll_global $P2390, ["PAST"], "Regex"
    find_lex $P2391, "$/"
    unless_null $P2391, vivify_662
    $P2391 = root_new ['parrot';'Hash']
  vivify_662:
    set $P2392, $P2391["codeblock"]
    unless_null $P2392, vivify_663
    new $P2392, "Undef"
  vivify_663:
    $P2393 = $P2392."ast"()
    find_lex $P2394, "$/"
    $P2395 = $P2390."new"("!INTERPOLATE_REGEX", $P2393, "subrule" :named("pasttype"), "method" :named("subtype"), $P2394 :named("node"))
    $P2396 = $P2389."!make"($P2395)
.annotate 'line', 872
    .return ($P2396)
  control_2386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2397, exception, "payload"
    .return ($P2397)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("138_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2401
.annotate 'line', 877
    new $P2400, 'ExceptionHandler'
    set_addr $P2400, control_2399
    $P2400."handle_types"(.CONTROL_RETURN)
    push_eh $P2400
    .lex "self", self
    .lex "$/", param_2401
.annotate 'line', 878
    find_lex $P2402, "$/"
    get_hll_global $P2403, ["PAST"], "Regex"
    find_lex $P2404, "$/"
    unless_null $P2404, vivify_664
    $P2404 = root_new ['parrot';'Hash']
  vivify_664:
    set $P2405, $P2404["codeblock"]
    unless_null $P2405, vivify_665
    new $P2405, "Undef"
  vivify_665:
    $P2406 = $P2405."ast"()
.annotate 'line', 879
    find_lex $P2407, "$/"
    unless_null $P2407, vivify_666
    $P2407 = root_new ['parrot';'Hash']
  vivify_666:
    set $P2408, $P2407["zw"]
    unless_null $P2408, vivify_667
    new $P2408, "Undef"
  vivify_667:
    set $S2409, $P2408
    iseq $I2410, $S2409, "!"
    find_lex $P2411, "$/"
    $P2412 = $P2403."new"($P2406, "zerowidth" :named("subtype"), $I2410 :named("negate"), "pastnode" :named("pasttype"), $P2411 :named("node"))
.annotate 'line', 878
    $P2413 = $P2402."!make"($P2412)
.annotate 'line', 877
    .return ($P2413)
  control_2399:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2414, exception, "payload"
    .return ($P2414)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("139_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2418
.annotate 'line', 883
    new $P2417, 'ExceptionHandler'
    set_addr $P2417, control_2416
    $P2417."handle_types"(.CONTROL_RETURN)
    push_eh $P2417
    .lex "self", self
    .lex "$/", param_2418
.annotate 'line', 884
    find_lex $P2419, "$/"
    get_hll_global $P2420, ["PAST"], "Regex"
    find_lex $P2421, "$/"
    unless_null $P2421, vivify_668
    $P2421 = root_new ['parrot';'Hash']
  vivify_668:
    set $P2422, $P2421["var"]
    unless_null $P2422, vivify_669
    new $P2422, "Undef"
  vivify_669:
    $P2423 = $P2422."ast"()
    find_lex $P2424, "$/"
    $P2425 = $P2420."new"("!INTERPOLATE_REGEX", $P2423, "subrule" :named("pasttype"), "method" :named("subtype"), $P2424 :named("node"))
    $P2426 = $P2419."!make"($P2425)
.annotate 'line', 883
    .return ($P2426)
  control_2416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2427, exception, "payload"
    .return ($P2427)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("140_1283874343.0915") :method :outer("133_1283874343.0915")
    .param pmc param_2431
.annotate 'line', 888
    new $P2430, 'ExceptionHandler'
    set_addr $P2430, control_2429
    $P2430."handle_types"(.CONTROL_RETURN)
    push_eh $P2430
    .lex "self", self
    .lex "$/", param_2431
.annotate 'line', 889
    new $P2432, "Undef"
    .lex "$block", $P2432
.annotate 'line', 891
    new $P2433, "Undef"
    .lex "$past", $P2433
.annotate 'line', 889
    find_lex $P2434, "$/"
    unless_null $P2434, vivify_670
    $P2434 = root_new ['parrot';'Hash']
  vivify_670:
    set $P2435, $P2434["block"]
    unless_null $P2435, vivify_671
    new $P2435, "Undef"
  vivify_671:
    $P2436 = $P2435."ast"()
    store_lex "$block", $P2436
.annotate 'line', 890
    find_lex $P2437, "$block"
    $P2437."blocktype"("immediate")
.annotate 'line', 892
    get_hll_global $P2438, ["PAST"], "Stmts"
.annotate 'line', 893
    get_hll_global $P2439, ["PAST"], "Op"
.annotate 'line', 894
    get_hll_global $P2440, ["PAST"], "Var"
    $P2441 = $P2440."new"("$/" :named("name"))
.annotate 'line', 895
    get_hll_global $P2442, ["PAST"], "Op"
.annotate 'line', 896
    get_hll_global $P2443, ["PAST"], "Var"
    $P2444 = $P2443."new"(unicode:"$\x{a2}" :named("name"))
    $P2445 = $P2442."new"($P2444, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 895
    $P2446 = $P2439."new"($P2441, $P2445, "bind" :named("pasttype"))
.annotate 'line', 893
    find_lex $P2447, "$block"
    $P2448 = $P2438."new"($P2446, $P2447)
.annotate 'line', 892
    store_lex "$past", $P2448
.annotate 'line', 904
    find_lex $P2449, "$/"
    find_lex $P2450, "$past"
    $P2451 = $P2449."!make"($P2450)
.annotate 'line', 888
    .return ($P2451)
  control_2429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2452, exception, "payload"
    .return ($P2452)
.end


.namespace ["NQP";"Actions"]
.sub "_block2455" :load :anon :subid("141_1283874343.0915")
.annotate 'line', 3
    .const 'Sub' $P2457 = "11_1283874343.0915" 
    $P2458 = $P2457()
    .return ($P2458)
.end


.namespace []
.sub "_block2465" :load :anon :subid("143_1283874343.0915")
.annotate 'line', 1
    .const 'Sub' $P2467 = "10_1283874343.0915" 
    $P2468 = $P2467()
    .return ($P2468)
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
