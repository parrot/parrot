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
.sub "_block11"  :anon :subid("10_1279589170.0083")
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
    .const 'Sub' $P1425 = "371_1279589170.0083" 
    .return ($P1425)
.end


.namespace []
.sub "" :load :init :subid("post372") :outer("10_1279589170.0083")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1279589170.0083" 
    .local pmc block
    set block, $P12
    $P1428 = get_root_global ["parrot"], "P6metaclass"
    $P1428."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1279589170.0083") :outer("10_1279589170.0083")
.annotate 'line', 4
    get_hll_global $P1340, ["NQP";"Regex"], "_block1339" 
    capture_lex $P1340
    .const 'Sub' $P1326 = "348_1279589170.0083" 
    capture_lex $P1326
    .const 'Sub' $P1320 = "346_1279589170.0083" 
    capture_lex $P1320
    .const 'Sub' $P1314 = "344_1279589170.0083" 
    capture_lex $P1314
    .const 'Sub' $P1308 = "342_1279589170.0083" 
    capture_lex $P1308
    .const 'Sub' $P1302 = "340_1279589170.0083" 
    capture_lex $P1302
    .const 'Sub' $P1296 = "338_1279589170.0083" 
    capture_lex $P1296
    .const 'Sub' $P1289 = "336_1279589170.0083" 
    capture_lex $P1289
    .const 'Sub' $P1282 = "334_1279589170.0083" 
    capture_lex $P1282
    .const 'Sub' $P1275 = "332_1279589170.0083" 
    capture_lex $P1275
    .const 'Sub' $P1268 = "330_1279589170.0083" 
    capture_lex $P1268
    .const 'Sub' $P1262 = "328_1279589170.0083" 
    capture_lex $P1262
    .const 'Sub' $P1255 = "326_1279589170.0083" 
    capture_lex $P1255
    .const 'Sub' $P1248 = "324_1279589170.0083" 
    capture_lex $P1248
    .const 'Sub' $P1241 = "322_1279589170.0083" 
    capture_lex $P1241
    .const 'Sub' $P1234 = "320_1279589170.0083" 
    capture_lex $P1234
    .const 'Sub' $P1227 = "318_1279589170.0083" 
    capture_lex $P1227
    .const 'Sub' $P1220 = "316_1279589170.0083" 
    capture_lex $P1220
    .const 'Sub' $P1213 = "314_1279589170.0083" 
    capture_lex $P1213
    .const 'Sub' $P1206 = "312_1279589170.0083" 
    capture_lex $P1206
    .const 'Sub' $P1199 = "310_1279589170.0083" 
    capture_lex $P1199
    .const 'Sub' $P1192 = "308_1279589170.0083" 
    capture_lex $P1192
    .const 'Sub' $P1185 = "306_1279589170.0083" 
    capture_lex $P1185
    .const 'Sub' $P1178 = "304_1279589170.0083" 
    capture_lex $P1178
    .const 'Sub' $P1171 = "302_1279589170.0083" 
    capture_lex $P1171
    .const 'Sub' $P1164 = "300_1279589170.0083" 
    capture_lex $P1164
    .const 'Sub' $P1157 = "298_1279589170.0083" 
    capture_lex $P1157
    .const 'Sub' $P1150 = "296_1279589170.0083" 
    capture_lex $P1150
    .const 'Sub' $P1143 = "294_1279589170.0083" 
    capture_lex $P1143
    .const 'Sub' $P1136 = "292_1279589170.0083" 
    capture_lex $P1136
    .const 'Sub' $P1129 = "290_1279589170.0083" 
    capture_lex $P1129
    .const 'Sub' $P1122 = "288_1279589170.0083" 
    capture_lex $P1122
    .const 'Sub' $P1115 = "286_1279589170.0083" 
    capture_lex $P1115
    .const 'Sub' $P1108 = "284_1279589170.0083" 
    capture_lex $P1108
    .const 'Sub' $P1101 = "282_1279589170.0083" 
    capture_lex $P1101
    .const 'Sub' $P1094 = "280_1279589170.0083" 
    capture_lex $P1094
    .const 'Sub' $P1087 = "278_1279589170.0083" 
    capture_lex $P1087
    .const 'Sub' $P1080 = "276_1279589170.0083" 
    capture_lex $P1080
    .const 'Sub' $P1073 = "274_1279589170.0083" 
    capture_lex $P1073
    .const 'Sub' $P1066 = "272_1279589170.0083" 
    capture_lex $P1066
    .const 'Sub' $P1059 = "270_1279589170.0083" 
    capture_lex $P1059
    .const 'Sub' $P1053 = "268_1279589170.0083" 
    capture_lex $P1053
    .const 'Sub' $P1046 = "266_1279589170.0083" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "264_1279589170.0083" 
    capture_lex $P1039
    .const 'Sub' $P1032 = "262_1279589170.0083" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "260_1279589170.0083" 
    capture_lex $P1025
    .const 'Sub' $P1018 = "258_1279589170.0083" 
    capture_lex $P1018
    .const 'Sub' $P1011 = "256_1279589170.0083" 
    capture_lex $P1011
    .const 'Sub' $P1004 = "254_1279589170.0083" 
    capture_lex $P1004
    .const 'Sub' $P998 = "252_1279589170.0083" 
    capture_lex $P998
    .const 'Sub' $P992 = "250_1279589170.0083" 
    capture_lex $P992
    .const 'Sub' $P987 = "248_1279589170.0083" 
    capture_lex $P987
    .const 'Sub' $P981 = "246_1279589170.0083" 
    capture_lex $P981
    .const 'Sub' $P975 = "244_1279589170.0083" 
    capture_lex $P975
    .const 'Sub' $P970 = "242_1279589170.0083" 
    capture_lex $P970
    .const 'Sub' $P965 = "240_1279589170.0083" 
    capture_lex $P965
    .const 'Sub' $P957 = "238_1279589170.0083" 
    capture_lex $P957
    .const 'Sub' $P948 = "236_1279589170.0083" 
    capture_lex $P948
    .const 'Sub' $P943 = "234_1279589170.0083" 
    capture_lex $P943
    .const 'Sub' $P938 = "232_1279589170.0083" 
    capture_lex $P938
    .const 'Sub' $P933 = "230_1279589170.0083" 
    capture_lex $P933
    .const 'Sub' $P925 = "228_1279589170.0083" 
    capture_lex $P925
    .const 'Sub' $P917 = "226_1279589170.0083" 
    capture_lex $P917
    .const 'Sub' $P912 = "224_1279589170.0083" 
    capture_lex $P912
    .const 'Sub' $P907 = "222_1279589170.0083" 
    capture_lex $P907
    .const 'Sub' $P902 = "220_1279589170.0083" 
    capture_lex $P902
    .const 'Sub' $P896 = "218_1279589170.0083" 
    capture_lex $P896
    .const 'Sub' $P890 = "216_1279589170.0083" 
    capture_lex $P890
    .const 'Sub' $P884 = "214_1279589170.0083" 
    capture_lex $P884
    .const 'Sub' $P878 = "212_1279589170.0083" 
    capture_lex $P878
    .const 'Sub' $P872 = "210_1279589170.0083" 
    capture_lex $P872
    .const 'Sub' $P867 = "208_1279589170.0083" 
    capture_lex $P867
    .const 'Sub' $P862 = "206_1279589170.0083" 
    capture_lex $P862
    .const 'Sub' $P850 = "202_1279589170.0083" 
    capture_lex $P850
    .const 'Sub' $P842 = "200_1279589170.0083" 
    capture_lex $P842
    .const 'Sub' $P836 = "198_1279589170.0083" 
    capture_lex $P836
    .const 'Sub' $P829 = "196_1279589170.0083" 
    capture_lex $P829
    .const 'Sub' $P823 = "194_1279589170.0083" 
    capture_lex $P823
    .const 'Sub' $P815 = "192_1279589170.0083" 
    capture_lex $P815
    .const 'Sub' $P807 = "190_1279589170.0083" 
    capture_lex $P807
    .const 'Sub' $P801 = "188_1279589170.0083" 
    capture_lex $P801
    .const 'Sub' $P795 = "186_1279589170.0083" 
    capture_lex $P795
    .const 'Sub' $P781 = "182_1279589170.0083" 
    capture_lex $P781
    .const 'Sub' $P744 = "180_1279589170.0083" 
    capture_lex $P744
    .const 'Sub' $P735 = "178_1279589170.0083" 
    capture_lex $P735
    .const 'Sub' $P729 = "176_1279589170.0083" 
    capture_lex $P729
    .const 'Sub' $P719 = "174_1279589170.0083" 
    capture_lex $P719
    .const 'Sub' $P706 = "172_1279589170.0083" 
    capture_lex $P706
    .const 'Sub' $P699 = "170_1279589170.0083" 
    capture_lex $P699
    .const 'Sub' $P691 = "168_1279589170.0083" 
    capture_lex $P691
    .const 'Sub' $P681 = "166_1279589170.0083" 
    capture_lex $P681
    .const 'Sub' $P657 = "162_1279589170.0083" 
    capture_lex $P657
    .const 'Sub' $P634 = "160_1279589170.0083" 
    capture_lex $P634
    .const 'Sub' $P627 = "158_1279589170.0083" 
    capture_lex $P627
    .const 'Sub' $P620 = "156_1279589170.0083" 
    capture_lex $P620
    .const 'Sub' $P610 = "152_1279589170.0083" 
    capture_lex $P610
    .const 'Sub' $P602 = "150_1279589170.0083" 
    capture_lex $P602
    .const 'Sub' $P596 = "148_1279589170.0083" 
    capture_lex $P596
    .const 'Sub' $P583 = "146_1279589170.0083" 
    capture_lex $P583
    .const 'Sub' $P576 = "144_1279589170.0083" 
    capture_lex $P576
    .const 'Sub' $P569 = "142_1279589170.0083" 
    capture_lex $P569
    .const 'Sub' $P562 = "140_1279589170.0083" 
    capture_lex $P562
    .const 'Sub' $P535 = "136_1279589170.0083" 
    capture_lex $P535
    .const 'Sub' $P526 = "134_1279589170.0083" 
    capture_lex $P526
    .const 'Sub' $P519 = "132_1279589170.0083" 
    capture_lex $P519
    .const 'Sub' $P510 = "128_1279589170.0083" 
    capture_lex $P510
    .const 'Sub' $P505 = "126_1279589170.0083" 
    capture_lex $P505
    .const 'Sub' $P493 = "124_1279589170.0083" 
    capture_lex $P493
    .const 'Sub' $P481 = "122_1279589170.0083" 
    capture_lex $P481
    .const 'Sub' $P474 = "120_1279589170.0083" 
    capture_lex $P474
    .const 'Sub' $P469 = "118_1279589170.0083" 
    capture_lex $P469
    .const 'Sub' $P463 = "116_1279589170.0083" 
    capture_lex $P463
    .const 'Sub' $P457 = "114_1279589170.0083" 
    capture_lex $P457
    .const 'Sub' $P447 = "111_1279589170.0083" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1279589170.0083" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1279589170.0083" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1279589170.0083" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1279589170.0083" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1279589170.0083" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1279589170.0083" 
    capture_lex $P411
    .const 'Sub' $P402 = "97_1279589170.0083" 
    capture_lex $P402
    .const 'Sub' $P393 = "95_1279589170.0083" 
    capture_lex $P393
    .const 'Sub' $P384 = "93_1279589170.0083" 
    capture_lex $P384
    .const 'Sub' $P371 = "89_1279589170.0083" 
    capture_lex $P371
    .const 'Sub' $P362 = "87_1279589170.0083" 
    capture_lex $P362
    .const 'Sub' $P352 = "83_1279589170.0083" 
    capture_lex $P352
    .const 'Sub' $P345 = "81_1279589170.0083" 
    capture_lex $P345
    .const 'Sub' $P338 = "79_1279589170.0083" 
    capture_lex $P338
    .const 'Sub' $P326 = "75_1279589170.0083" 
    capture_lex $P326
    .const 'Sub' $P318 = "73_1279589170.0083" 
    capture_lex $P318
    .const 'Sub' $P310 = "71_1279589170.0083" 
    capture_lex $P310
    .const 'Sub' $P290 = "69_1279589170.0083" 
    capture_lex $P290
    .const 'Sub' $P281 = "67_1279589170.0083" 
    capture_lex $P281
    .const 'Sub' $P263 = "64_1279589170.0083" 
    capture_lex $P263
    .const 'Sub' $P245 = "62_1279589170.0083" 
    capture_lex $P245
    .const 'Sub' $P236 = "58_1279589170.0083" 
    capture_lex $P236
    .const 'Sub' $P231 = "56_1279589170.0083" 
    capture_lex $P231
    .const 'Sub' $P222 = "52_1279589170.0083" 
    capture_lex $P222
    .const 'Sub' $P217 = "50_1279589170.0083" 
    capture_lex $P217
    .const 'Sub' $P212 = "48_1279589170.0083" 
    capture_lex $P212
    .const 'Sub' $P203 = "46_1279589170.0083" 
    capture_lex $P203
    .const 'Sub' $P196 = "44_1279589170.0083" 
    capture_lex $P196
    .const 'Sub' $P190 = "42_1279589170.0083" 
    capture_lex $P190
    .const 'Sub' $P182 = "40_1279589170.0083" 
    capture_lex $P182
    .const 'Sub' $P176 = "38_1279589170.0083" 
    capture_lex $P176
    .const 'Sub' $P170 = "36_1279589170.0083" 
    capture_lex $P170
    .const 'Sub' $P155 = "33_1279589170.0083" 
    capture_lex $P155
    .const 'Sub' $P141 = "31_1279589170.0083" 
    capture_lex $P141
    .const 'Sub' $P134 = "29_1279589170.0083" 
    capture_lex $P134
    .const 'Sub' $P95 = "26_1279589170.0083" 
    capture_lex $P95
    .const 'Sub' $P80 = "23_1279589170.0083" 
    capture_lex $P80
    .const 'Sub' $P69 = "21_1279589170.0083" 
    capture_lex $P69
    .const 'Sub' $P57 = "19_1279589170.0083" 
    capture_lex $P57
    .const 'Sub' $P49 = "17_1279589170.0083" 
    capture_lex $P49
    .const 'Sub' $P42 = "15_1279589170.0083" 
    capture_lex $P42
    .const 'Sub' $P35 = "13_1279589170.0083" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1279589170.0083" 
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
    .const 'Sub' $P1404 = "370_1279589170.0083" 
    .return ($P1404)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post373") :outer("11_1279589170.0083")
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
.sub "TOP"  :subid("12_1279589170.0083") :method :outer("11_1279589170.0083")
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
.sub "identifier"  :subid("13_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx36_tgt
    .local int rx36_pos
    .local int rx36_off
    .local int rx36_eos
    .local int rx36_rep
    .local pmc rx36_cur
    (rx36_cur, rx36_pos, rx36_tgt, $I10) = self."!cursor_start"()
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
    rx36_cur."!cursor_debug"("START ", "identifier")
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
    rx36_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx36_pos)
    .return (rx36_cur)
  rx36_restart:
.annotate 'line', 4
    rx36_cur."!cursor_debug"("NEXT ", "identifier")
  rx36_fail:
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
.sub "!PREFIX__identifier"  :subid("14_1279589170.0083") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx43_tgt
    .local int rx43_pos
    .local int rx43_off
    .local int rx43_eos
    .local int rx43_rep
    .local pmc rx43_cur
    (rx43_cur, rx43_pos, rx43_tgt, $I10) = self."!cursor_start"()
    rx43_cur."!cursor_caparray"("identifier")
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
    rx43_cur."!cursor_debug"("START ", "name")
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
    rx43_cur."!cursor_debug"("PASS  ", "name", " at pos=", rx43_pos)
    .return (rx43_cur)
  rx43_restart:
.annotate 'line', 4
    rx43_cur."!cursor_debug"("NEXT ", "name")
  rx43_fail:
    (rx43_rep, rx43_pos, $I10, $P10) = rx43_cur."!mark_fail"(0)
    lt rx43_pos, -1, rx43_done
    eq rx43_pos, -1, rx43_fail
    jump $I10
  rx43_done:
    rx43_cur."!cursor_fail"()
    rx43_cur."!cursor_debug"("FAIL  ", "name")
    .return (rx43_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1279589170.0083") :method
.annotate 'line', 4
    new $P45, "ResizablePMCArray"
    push $P45, ""
    .return ($P45)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx50_tgt
    .local int rx50_pos
    .local int rx50_off
    .local int rx50_eos
    .local int rx50_rep
    .local pmc rx50_cur
    (rx50_cur, rx50_pos, rx50_tgt, $I10) = self."!cursor_start"()
    rx50_cur."!cursor_caparray"("colonpair")
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
    rx50_cur."!cursor_debug"("START ", "deflongname")
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
    rx50_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx50_pos)
    .return (rx50_cur)
  rx50_restart:
.annotate 'line', 4
    rx50_cur."!cursor_debug"("NEXT ", "deflongname")
  rx50_fail:
    (rx50_rep, rx50_pos, $I10, $P10) = rx50_cur."!mark_fail"(0)
    lt rx50_pos, -1, rx50_done
    eq rx50_pos, -1, rx50_fail
    jump $I10
  rx50_done:
    rx50_cur."!cursor_fail"()
    rx50_cur."!cursor_debug"("FAIL  ", "deflongname")
    .return (rx50_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1279589170.0083") :method
.annotate 'line', 4
    $P52 = self."!PREFIX__!subrule"("identifier", "")
    new $P53, "ResizablePMCArray"
    push $P53, $P52
    .return ($P53)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx58_tgt
    .local int rx58_pos
    .local int rx58_off
    .local int rx58_eos
    .local int rx58_rep
    .local pmc rx58_cur
    (rx58_cur, rx58_pos, rx58_tgt, $I10) = self."!cursor_start"()
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
    rx58_cur."!cursor_debug"("START ", "ENDSTMT")
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
  # rx rxquantr64 ** 0..*
    set_addr $I10, rxquantr64_done
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  rxquantr64_loop:
  # rx enumcharlist negate=0 
    ge rx58_pos, rx58_eos, rx58_fail
    sub $I10, rx58_pos, rx58_off
    substr $S10, rx58_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx58_fail
    inc rx58_pos
    set_addr $I10, rxquantr64_done
    (rx58_rep) = rx58_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr64_done
    rx58_cur."!mark_push"(rx58_rep, rx58_pos, $I10)
    goto rxquantr64_loop
  rxquantr64_done:
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
    rx58_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx58_pos)
    .return (rx58_cur)
  rx58_restart:
.annotate 'line', 4
    rx58_cur."!cursor_debug"("NEXT ", "ENDSTMT")
  rx58_fail:
    (rx58_rep, rx58_pos, $I10, $P10) = rx58_cur."!mark_fail"(0)
    lt rx58_pos, -1, rx58_done
    eq rx58_pos, -1, rx58_fail
    jump $I10
  rx58_done:
    rx58_cur."!cursor_fail"()
    rx58_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx58_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1279589170.0083") :method
.annotate 'line', 4
    new $P60, "ResizablePMCArray"
    push $P60, ""
    .return ($P60)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx70_tgt
    .local int rx70_pos
    .local int rx70_off
    .local int rx70_eos
    .local int rx70_rep
    .local pmc rx70_cur
    (rx70_cur, rx70_pos, rx70_tgt, $I10) = self."!cursor_start"()
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
    rx70_cur."!cursor_debug"("START ", "ws")
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
  # rx rxquantr77 ** 1..*
    set_addr $I10, rxquantr77_done
    rx70_cur."!mark_push"(0, -1, $I10)
  rxquantr77_loop:
  # rx enumcharlist negate=0 
    ge rx70_pos, rx70_eos, rx70_fail
    sub $I10, rx70_pos, rx70_off
    substr $S10, rx70_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rx70_fail
    inc rx70_pos
    set_addr $I10, rxquantr77_done
    (rx70_rep) = rx70_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr77_done
    rx70_cur."!mark_push"(rx70_rep, rx70_pos, $I10)
    goto rxquantr77_loop
  rxquantr77_done:
    goto alt76_end
  alt76_1:
    set_addr $I10, alt76_2
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
.annotate 'line', 36
  # rx literal  "#"
    add $I11, rx70_pos, 1
    gt $I11, rx70_eos, rx70_fail
    sub $I11, rx70_pos, rx70_off
    substr $S10, rx70_tgt, $I11, 1
    ne $S10, "#", rx70_fail
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
  # rx rxquantr79 ** 1..*
    set_addr $I10, rxquantr79_done
    rx70_cur."!mark_push"(0, -1, $I10)
  rxquantr79_loop:
  # rx enumcharlist negate=0 
    ge rx70_pos, rx70_eos, rx70_fail
    sub $I10, rx70_pos, rx70_off
    substr $S10, rx70_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx70_fail
    inc rx70_pos
    set_addr $I10, rxquantr79_done
    (rx70_rep) = rx70_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr79_done
    rx70_cur."!mark_push"(rx70_rep, rx70_pos, $I10)
    goto rxquantr79_loop
  rxquantr79_done:
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
    rx70_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx70_pos)
    .return (rx70_cur)
  rx70_restart:
.annotate 'line', 4
    rx70_cur."!cursor_debug"("NEXT ", "ws")
  rx70_fail:
    (rx70_rep, rx70_pos, $I10, $P10) = rx70_cur."!mark_fail"(0)
    lt rx70_pos, -1, rx70_done
    eq rx70_pos, -1, rx70_fail
    jump $I10
  rx70_done:
    rx70_cur."!cursor_fail"()
    rx70_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx70_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1279589170.0083") :method
.annotate 'line', 4
    new $P72, "ResizablePMCArray"
    push $P72, ""
    push $P72, ""
    .return ($P72)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P88 = "25_1279589170.0083" 
    capture_lex $P88
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
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
    rx81_cur."!cursor_debug"("START ", "unv")
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
    .const 'Sub' $P88 = "25_1279589170.0083" 
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
  # rx rxquantr93 ** 0..*
    set_addr $I10, rxquantr93_done
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
  rxquantr93_loop:
  # rx enumcharlist negate=0 
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx81_fail
    inc rx81_pos
    set_addr $I10, rxquantr93_done
    (rx81_rep) = rx81_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr93_done
    rx81_cur."!mark_push"(rx81_rep, rx81_pos, $I10)
    goto rxquantr93_loop
  rxquantr93_done:
  # rx literal  "#"
    add $I11, rx81_pos, 1
    gt $I11, rx81_eos, rx81_fail
    sub $I11, rx81_pos, rx81_off
    substr $S10, rx81_tgt, $I11, 1
    ne $S10, "#", rx81_fail
    add rx81_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx81_pos, rx81_off
    find_cclass $I11, 4096, rx81_tgt, $I10, rx81_eos
    add rx81_pos, rx81_off, $I11
    goto alt85_end
  alt85_2:
.annotate 'line', 48
  # rx rxquantr94 ** 1..*
    set_addr $I10, rxquantr94_done
    rx81_cur."!mark_push"(0, -1, $I10)
  rxquantr94_loop:
  # rx enumcharlist negate=0 
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx81_fail
    inc rx81_pos
    set_addr $I10, rxquantr94_done
    (rx81_rep) = rx81_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr94_done
    rx81_cur."!mark_push"(rx81_rep, rx81_pos, $I10)
    goto rxquantr94_loop
  rxquantr94_done:
  alt85_end:
.annotate 'line', 43
  # rx pass
    rx81_cur."!cursor_pass"(rx81_pos, "unv")
    rx81_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx81_pos)
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 4
    rx81_cur."!cursor_debug"("NEXT ", "unv")
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    rx81_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx81_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1279589170.0083") :method
.annotate 'line', 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block87"  :anon :subid("25_1279589170.0083") :method :outer("23_1279589170.0083")
.annotate 'line', 46
    .local string rx89_tgt
    .local int rx89_pos
    .local int rx89_off
    .local int rx89_eos
    .local int rx89_rep
    .local pmc rx89_cur
    (rx89_cur, rx89_pos, rx89_tgt, $I10) = self."!cursor_start"()
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
    rx89_cur."!cursor_debug"("START ", "")
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
  # rx rxquantr91 ** 0..*
    set_addr $I10, rxquantr91_done
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  rxquantr91_loop:
  # rx enumcharlist negate=0 
    ge rx89_pos, rx89_eos, rx89_fail
    sub $I10, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx89_fail
    inc rx89_pos
    set_addr $I10, rxquantr91_done
    (rx89_rep) = rx89_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr91_done
    rx89_cur."!mark_push"(rx89_rep, rx89_pos, $I10)
    goto rxquantr91_loop
  rxquantr91_done:
  # rx literal  "="
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 1
    ne $S10, "=", rx89_fail
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
    substr $S10, rx89_tgt, $I11, 1
    ne $S10, "\\", rx89_fail
    add rx89_pos, 1
  alt92_end:
  # rx pass
    rx89_cur."!cursor_pass"(rx89_pos, "")
    rx89_cur."!cursor_debug"("PASS  ", "", " at pos=", rx89_pos)
    .return (rx89_cur)
  rx89_restart:
    rx89_cur."!cursor_debug"("NEXT ", "")
  rx89_fail:
    (rx89_rep, rx89_pos, $I10, $P10) = rx89_cur."!mark_fail"(0)
    lt rx89_pos, -1, rx89_done
    eq rx89_pos, -1, rx89_fail
    jump $I10
  rx89_done:
    rx89_cur."!cursor_fail"()
    rx89_cur."!cursor_debug"("FAIL  ", "")
    .return (rx89_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P127 = "28_1279589170.0083" 
    capture_lex $P127
    .local string rx96_tgt
    .local int rx96_pos
    .local int rx96_off
    .local int rx96_eos
    .local int rx96_rep
    .local pmc rx96_cur
    (rx96_cur, rx96_pos, rx96_tgt, $I10) = self."!cursor_start"()
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
    rx96_cur."!cursor_debug"("START ", "pod_comment")
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
  # rx rxquantr101 ** 0..*
    set_addr $I10, rxquantr101_done
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxquantr101_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr101_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr101_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr101_loop
  rxquantr101_done:
  # rx literal  "="
    add $I11, rx96_pos, 1
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 1
    ne $S10, "=", rx96_fail
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
  # rx rxquantr103 ** 1..*
    set_addr $I10, rxquantr103_done
    rx96_cur."!mark_push"(0, -1, $I10)
  rxquantr103_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr103_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr103_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr103_loop
  rxquantr103_done:
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
  # rx rxquantr107 ** 0..*
    set_addr $I10, rxquantr107_done
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxquantr107_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr107_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr107_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr107_loop
  rxquantr107_done:
  # rx literal  "=end"
    add $I11, rx96_pos, 4
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 4
    ne $S10, "=end", rx96_fail
    add rx96_pos, 4
  # rx rxquantr108 ** 1..*
    set_addr $I10, rxquantr108_done
    rx96_cur."!mark_push"(0, -1, $I10)
  rxquantr108_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr108_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr108_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr108_loop
  rxquantr108_done:
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
  # rx rxquantr109 ** 1..*
    set_addr $I10, rxquantr109_done
    rx96_cur."!mark_push"(0, -1, $I10)
  rxquantr109_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr109_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr109_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr109_loop
  rxquantr109_done:
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
  # rx rxquantr113 ** 0..*
    set_addr $I10, rxquantr113_done
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxquantr113_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr113_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr113_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr113_loop
  rxquantr113_done:
  # rx literal  "=end"
    add $I11, rx96_pos, 4
    gt $I11, rx96_eos, rx96_fail
    sub $I11, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I11, 4
    ne $S10, "=end", rx96_fail
    add rx96_pos, 4
  # rx rxquantr114 ** 1..*
    set_addr $I10, rxquantr114_done
    rx96_cur."!mark_push"(0, -1, $I10)
  rxquantr114_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr114_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr114_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr114_loop
  rxquantr114_done:
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
  # rx rxquantr116 ** 0..*
    set_addr $I10, rxquantr116_done
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxquantr116_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr116_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr116_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr116_loop
  rxquantr116_done:
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
    substr $S10, rx96_tgt, $I11, 1
    ne $S10, "#", rx96_fail
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
  # rx rxquantr122 ** 0..*
    set_addr $I10, rxquantr122_done
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxquantr122_loop:
  # rx enumcharlist negate=0 
    ge rx96_pos, rx96_eos, rx96_fail
    sub $I10, rx96_pos, rx96_off
    substr $S10, rx96_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx96_fail
    inc rx96_pos
    set_addr $I10, rxquantr122_done
    (rx96_rep) = rx96_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr122_done
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I10)
    goto rxquantr122_loop
  rxquantr122_done:
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
    .const 'Sub' $P127 = "28_1279589170.0083" 
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
    rx96_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx96_pos)
    .return (rx96_cur)
  rx96_restart:
.annotate 'line', 4
    rx96_cur."!cursor_debug"("NEXT ", "pod_comment")
  rx96_fail:
    (rx96_rep, rx96_pos, $I10, $P10) = rx96_cur."!mark_fail"(0)
    lt rx96_pos, -1, rx96_done
    eq rx96_pos, -1, rx96_fail
    jump $I10
  rx96_done:
    rx96_cur."!cursor_fail"()
    rx96_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx96_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1279589170.0083") :method
.annotate 'line', 4
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["NQP";"Grammar"]
.sub "_block126"  :anon :subid("28_1279589170.0083") :method :outer("26_1279589170.0083")
.annotate 'line', 69
    .local string rx128_tgt
    .local int rx128_pos
    .local int rx128_off
    .local int rx128_eos
    .local int rx128_rep
    .local pmc rx128_cur
    (rx128_cur, rx128_pos, rx128_tgt, $I10) = self."!cursor_start"()
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
    rx128_cur."!cursor_debug"("START ", "")
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
  # rx rxquantr130 ** 0..*
    set_addr $I10, rxquantr130_done
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
  rxquantr130_loop:
  # rx enumcharlist negate=0 
    ge rx128_pos, rx128_eos, rx128_fail
    sub $I10, rx128_pos, rx128_off
    substr $S10, rx128_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx128_fail
    inc rx128_pos
    set_addr $I10, rxquantr130_done
    (rx128_rep) = rx128_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr130_done
    rx128_cur."!mark_push"(rx128_rep, rx128_pos, $I10)
    goto rxquantr130_loop
  rxquantr130_done:
  alt131_0:
    set_addr $I10, alt131_1
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
.annotate 'line', 70
  # rx literal  "="
    add $I11, rx128_pos, 1
    gt $I11, rx128_eos, rx128_fail
    sub $I11, rx128_pos, rx128_off
    substr $S10, rx128_tgt, $I11, 1
    ne $S10, "=", rx128_fail
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
    rx128_cur."!cursor_debug"("PASS  ", "", " at pos=", rx128_pos)
    .return (rx128_cur)
  rx128_restart:
    rx128_cur."!cursor_debug"("NEXT ", "")
  rx128_fail:
    (rx128_rep, rx128_pos, $I10, $P10) = rx128_cur."!mark_fail"(0)
    lt rx128_pos, -1, rx128_done
    eq rx128_pos, -1, rx128_fail
    jump $I10
  rx128_done:
    rx128_cur."!cursor_fail"()
    rx128_cur."!cursor_debug"("FAIL  ", "")
    .return (rx128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx135_tgt
    .local int rx135_pos
    .local int rx135_off
    .local int rx135_eos
    .local int rx135_rep
    .local pmc rx135_cur
    (rx135_cur, rx135_pos, rx135_tgt, $I10) = self."!cursor_start"()
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
    rx135_cur."!cursor_debug"("START ", "comp_unit")
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
    rx135_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx135_pos)
    .return (rx135_cur)
  rx135_restart:
.annotate 'line', 4
    rx135_cur."!cursor_debug"("NEXT ", "comp_unit")
  rx135_fail:
    (rx135_rep, rx135_pos, $I10, $P10) = rx135_cur."!mark_fail"(0)
    lt rx135_pos, -1, rx135_done
    eq rx135_pos, -1, rx135_fail
    jump $I10
  rx135_done:
    rx135_cur."!cursor_fail"()
    rx135_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1279589170.0083") :method
.annotate 'line', 4
    $P137 = self."!PREFIX__!subrule"("newpad", "")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    (rx142_cur, rx142_pos, rx142_tgt, $I10) = self."!cursor_start"()
    rx142_cur."!cursor_caparray"("statement")
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
    rx142_cur."!cursor_debug"("START ", "statementlist")
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
    rx142_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx142_pos)
    .return (rx142_cur)
  rx142_restart:
.annotate 'line', 4
    rx142_cur."!cursor_debug"("NEXT ", "statementlist")
  rx142_fail:
    (rx142_rep, rx142_pos, $I10, $P10) = rx142_cur."!mark_fail"(0)
    lt rx142_pos, -1, rx142_done
    eq rx142_pos, -1, rx142_fail
    jump $I10
  rx142_done:
    rx142_cur."!cursor_fail"()
    rx142_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1279589170.0083") :method
.annotate 'line', 4
    $P144 = self."!PREFIX__!subrule"("ws", "")
    $P145 = self."!PREFIX__!subrule"("ws", "")
    new $P146, "ResizablePMCArray"
    push $P146, $P144
    push $P146, $P145
    .return ($P146)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P161 = "35_1279589170.0083" 
    capture_lex $P161
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    (rx156_cur, rx156_pos, rx156_tgt, $I10) = self."!cursor_start"()
    rx156_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
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
    rx156_cur."!cursor_debug"("START ", "statement")
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
    .const 'Sub' $P161 = "35_1279589170.0083" 
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
    rx156_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx156_pos)
    .return (rx156_cur)
  rx156_restart:
.annotate 'line', 4
    rx156_cur."!cursor_debug"("NEXT ", "statement")
  rx156_fail:
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    rx156_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1279589170.0083") :method
.annotate 'line', 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "_block160"  :anon :subid("35_1279589170.0083") :method :outer("33_1279589170.0083")
.annotate 'line', 96
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
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
    rx162_cur."!cursor_debug"("START ", "")
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
    rx162_cur."!cursor_debug"("PASS  ", "", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_restart:
    rx162_cur."!cursor_debug"("NEXT ", "")
  rx162_fail:
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "")
    .return (rx162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt, $I10) = self."!cursor_start"()
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
    rx171_cur."!cursor_debug"("START ", "eat_terminator")
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
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, ";", rx171_fail
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
    rx171_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx171_pos)
    .return (rx171_cur)
  rx171_restart:
.annotate 'line', 4
    rx171_cur."!cursor_debug"("NEXT ", "eat_terminator")
  rx171_fail:
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    rx171_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1279589170.0083") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    push $P173, ""
    push $P173, ""
    push $P173, ";"
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt, $I10) = self."!cursor_start"()
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
    rx177_cur."!cursor_debug"("START ", "xblock")
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
    rx177_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_restart:
.annotate 'line', 4
    rx177_cur."!cursor_debug"("NEXT ", "xblock")
  rx177_fail:
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1279589170.0083") :method
.annotate 'line', 4
    $P179 = self."!PREFIX__!subrule"("EXPR", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt, $I10) = self."!cursor_start"()
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
    rx183_cur."!cursor_debug"("START ", "pblock")
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
    rx183_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_restart:
.annotate 'line', 4
    rx183_cur."!cursor_debug"("NEXT ", "pblock")
  rx183_fail:
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    rx183_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1279589170.0083") :method
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
.sub "lambda"  :subid("42_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt, $I10) = self."!cursor_start"()
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
    rx191_cur."!cursor_debug"("START ", "lambda")
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
    rx191_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_restart:
.annotate 'line', 4
    rx191_cur."!cursor_debug"("NEXT ", "lambda")
  rx191_fail:
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1279589170.0083") :method
.annotate 'line', 4
    new $P193, "ResizablePMCArray"
    push $P193, "<->"
    push $P193, "->"
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    (rx197_cur, rx197_pos, rx197_tgt, $I10) = self."!cursor_start"()
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
    rx197_cur."!cursor_debug"("START ", "block")
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
    rx197_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx197_pos)
    .return (rx197_cur)
  rx197_restart:
.annotate 'line', 4
    rx197_cur."!cursor_debug"("NEXT ", "block")
  rx197_fail:
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    rx197_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1279589170.0083") :method
.annotate 'line', 4
    $P199 = self."!PREFIX__!subrule"("panic", "")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    push $P200, "{"
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx204_tgt
    .local int rx204_pos
    .local int rx204_off
    .local int rx204_eos
    .local int rx204_rep
    .local pmc rx204_cur
    (rx204_cur, rx204_pos, rx204_tgt, $I10) = self."!cursor_start"()
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
    rx204_cur."!cursor_debug"("START ", "blockoid")
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
    substr $S10, rx204_tgt, $I11, 1
    ne $S10, "{", rx204_fail
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
    substr $S10, rx204_tgt, $I11, 1
    ne $S10, "}", rx204_fail
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
    rx204_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx204_pos)
    .return (rx204_cur)
  rx204_restart:
.annotate 'line', 4
    rx204_cur."!cursor_debug"("NEXT ", "blockoid")
  rx204_fail:
    (rx204_rep, rx204_pos, $I10, $P10) = rx204_cur."!mark_fail"(0)
    lt rx204_pos, -1, rx204_done
    eq rx204_pos, -1, rx204_fail
    jump $I10
  rx204_done:
    rx204_cur."!cursor_fail"()
    rx204_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1279589170.0083") :method
.annotate 'line', 4
    $P206 = self."!PREFIX__!subrule"("finishpad", "")
    new $P207, "ResizablePMCArray"
    push $P207, $P206
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx213_tgt
    .local int rx213_pos
    .local int rx213_off
    .local int rx213_eos
    .local int rx213_rep
    .local pmc rx213_cur
    (rx213_cur, rx213_pos, rx213_tgt, $I10) = self."!cursor_start"()
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
    rx213_cur."!cursor_debug"("START ", "newpad")
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
    rx213_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx213_pos)
    .return (rx213_cur)
  rx213_restart:
.annotate 'line', 4
    rx213_cur."!cursor_debug"("NEXT ", "newpad")
  rx213_fail:
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    rx213_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1279589170.0083") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, ""
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx218_tgt
    .local int rx218_pos
    .local int rx218_off
    .local int rx218_eos
    .local int rx218_rep
    .local pmc rx218_cur
    (rx218_cur, rx218_pos, rx218_tgt, $I10) = self."!cursor_start"()
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
    rx218_cur."!cursor_debug"("START ", "outerctx")
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
    rx218_cur."!cursor_debug"("PASS  ", "outerctx", " at pos=", rx218_pos)
    .return (rx218_cur)
  rx218_restart:
.annotate 'line', 4
    rx218_cur."!cursor_debug"("NEXT ", "outerctx")
  rx218_fail:
    (rx218_rep, rx218_pos, $I10, $P10) = rx218_cur."!mark_fail"(0)
    lt rx218_pos, -1, rx218_done
    eq rx218_pos, -1, rx218_fail
    jump $I10
  rx218_done:
    rx218_cur."!cursor_fail"()
    rx218_cur."!cursor_debug"("FAIL  ", "outerctx")
    .return (rx218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1279589170.0083") :method
.annotate 'line', 4
    new $P220, "ResizablePMCArray"
    push $P220, ""
    .return ($P220)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    (rx223_cur, rx223_pos, rx223_tgt, $I10) = self."!cursor_start"()
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
    rx223_cur."!cursor_debug"("START ", "finishpad")
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
    rx223_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx223_pos)
    .return (rx223_cur)
  rx223_restart:
.annotate 'line', 4
    rx223_cur."!cursor_debug"("NEXT ", "finishpad")
  rx223_fail:
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    rx223_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx223_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1279589170.0083") :method
.annotate 'line', 4
    new $P225, "ResizablePMCArray"
    push $P225, ""
    .return ($P225)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1279589170.0083") :method
.annotate 'line', 148
    $P228 = self."!protoregex"("terminator")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1279589170.0083") :method
.annotate 'line', 148
    $P230 = self."!PREFIX__!protoregex"("terminator")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt, $I10) = self."!cursor_start"()
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
    rx232_cur."!cursor_debug"("START ", "terminator:sym<;>")
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
    rx232_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_restart:
.annotate 'line', 4
    rx232_cur."!cursor_debug"("NEXT ", "terminator:sym<;>")
  rx232_fail:
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1279589170.0083") :method
.annotate 'line', 4
    new $P234, "ResizablePMCArray"
    push $P234, ";"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    (rx237_cur, rx237_pos, rx237_tgt, $I10) = self."!cursor_start"()
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
    rx237_cur."!cursor_debug"("START ", "terminator:sym<}>")
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
    rx237_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx237_pos)
    .return (rx237_cur)
  rx237_restart:
.annotate 'line', 4
    rx237_cur."!cursor_debug"("NEXT ", "terminator:sym<}>")
  rx237_fail:
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    rx237_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1279589170.0083") :method
.annotate 'line', 4
    new $P239, "ResizablePMCArray"
    push $P239, "}"
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1279589170.0083") :method
.annotate 'line', 155
    $P242 = self."!protoregex"("statement_control")
    .return ($P242)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1279589170.0083") :method
.annotate 'line', 155
    $P244 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_caparray"("else", "xblock")
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
    rx246_cur."!cursor_debug"("START ", "statement_control:sym<if>")
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
    rx246_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 4
    rx246_cur."!cursor_debug"("NEXT ", "statement_control:sym<if>")
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1279589170.0083") :method
.annotate 'line', 4
    new $P248, "ResizablePMCArray"
    push $P248, "if"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P274 = "66_1279589170.0083" 
    capture_lex $P274
    .local string rx264_tgt
    .local int rx264_pos
    .local int rx264_off
    .local int rx264_eos
    .local int rx264_rep
    .local pmc rx264_cur
    (rx264_cur, rx264_pos, rx264_tgt, $I10) = self."!cursor_start"()
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
    rx264_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
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
    .const 'Sub' $P274 = "66_1279589170.0083" 
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
    rx264_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx264_pos)
    .return (rx264_cur)
  rx264_restart:
.annotate 'line', 4
    rx264_cur."!cursor_debug"("NEXT ", "statement_control:sym<unless>")
  rx264_fail:
    (rx264_rep, rx264_pos, $I10, $P10) = rx264_cur."!mark_fail"(0)
    lt rx264_pos, -1, rx264_done
    eq rx264_pos, -1, rx264_fail
    jump $I10
  rx264_done:
    rx264_cur."!cursor_fail"()
    rx264_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1279589170.0083") :method
.annotate 'line', 4
    new $P266, "ResizablePMCArray"
    push $P266, "unless"
    .return ($P266)
.end


.namespace ["NQP";"Grammar"]
.sub "_block273"  :anon :subid("66_1279589170.0083") :method :outer("64_1279589170.0083")
.annotate 'line', 167
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    (rx275_cur, rx275_pos, rx275_tgt, $I10) = self."!cursor_start"()
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
    rx275_cur."!cursor_debug"("START ", "")
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
    rx275_cur."!cursor_debug"("PASS  ", "", " at pos=", rx275_pos)
    .return (rx275_cur)
  rx275_restart:
    rx275_cur."!cursor_debug"("NEXT ", "")
  rx275_fail:
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    rx275_cur."!cursor_debug"("FAIL  ", "")
    .return (rx275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx282_tgt
    .local int rx282_pos
    .local int rx282_off
    .local int rx282_eos
    .local int rx282_rep
    .local pmc rx282_cur
    (rx282_cur, rx282_pos, rx282_tgt, $I10) = self."!cursor_start"()
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
    rx282_cur."!cursor_debug"("START ", "statement_control:sym<while>")
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
    rx282_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx282_pos)
    .return (rx282_cur)
  rx282_restart:
.annotate 'line', 4
    rx282_cur."!cursor_debug"("NEXT ", "statement_control:sym<while>")
  rx282_fail:
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    rx282_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx282_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1279589170.0083") :method
.annotate 'line', 4
    new $P284, "ResizablePMCArray"
    push $P284, "until"
    push $P284, "while"
    .return ($P284)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx291_tgt
    .local int rx291_pos
    .local int rx291_off
    .local int rx291_eos
    .local int rx291_rep
    .local pmc rx291_cur
    (rx291_cur, rx291_pos, rx291_tgt, $I10) = self."!cursor_start"()
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
    rx291_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
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
    rx291_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx291_pos)
    .return (rx291_cur)
  rx291_restart:
.annotate 'line', 4
    rx291_cur."!cursor_debug"("NEXT ", "statement_control:sym<repeat>")
  rx291_fail:
    (rx291_rep, rx291_pos, $I10, $P10) = rx291_cur."!mark_fail"(0)
    lt rx291_pos, -1, rx291_done
    eq rx291_pos, -1, rx291_fail
    jump $I10
  rx291_done:
    rx291_cur."!cursor_fail"()
    rx291_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx291_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1279589170.0083") :method
.annotate 'line', 4
    new $P293, "ResizablePMCArray"
    push $P293, "repeat"
    .return ($P293)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
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
    rx311_cur."!cursor_debug"("START ", "statement_control:sym<for>")
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
    rx311_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx311_pos)
    .return (rx311_cur)
  rx311_restart:
.annotate 'line', 4
    rx311_cur."!cursor_debug"("NEXT ", "statement_control:sym<for>")
  rx311_fail:
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    rx311_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx311_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1279589170.0083") :method
.annotate 'line', 4
    new $P313, "ResizablePMCArray"
    push $P313, "for"
    .return ($P313)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    (rx319_cur, rx319_pos, rx319_tgt, $I10) = self."!cursor_start"()
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
    rx319_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
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
    rx319_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx319_pos)
    .return (rx319_cur)
  rx319_restart:
.annotate 'line', 4
    rx319_cur."!cursor_debug"("NEXT ", "statement_control:sym<CATCH>")
  rx319_fail:
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    rx319_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1279589170.0083") :method
.annotate 'line', 4
    new $P321, "ResizablePMCArray"
    push $P321, "CATCH"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx327_tgt
    .local int rx327_pos
    .local int rx327_off
    .local int rx327_eos
    .local int rx327_rep
    .local pmc rx327_cur
    (rx327_cur, rx327_pos, rx327_tgt, $I10) = self."!cursor_start"()
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
    rx327_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
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
    rx327_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx327_pos)
    .return (rx327_cur)
  rx327_restart:
.annotate 'line', 4
    rx327_cur."!cursor_debug"("NEXT ", "statement_control:sym<CONTROL>")
  rx327_fail:
    (rx327_rep, rx327_pos, $I10, $P10) = rx327_cur."!mark_fail"(0)
    lt rx327_pos, -1, rx327_done
    eq rx327_pos, -1, rx327_fail
    jump $I10
  rx327_done:
    rx327_cur."!cursor_fail"()
    rx327_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx327_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1279589170.0083") :method
.annotate 'line', 4
    new $P329, "ResizablePMCArray"
    push $P329, "CONTROL"
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1279589170.0083") :method
.annotate 'line', 198
    $P335 = self."!protoregex"("statement_prefix")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1279589170.0083") :method
.annotate 'line', 198
    $P337 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx339_tgt
    .local int rx339_pos
    .local int rx339_off
    .local int rx339_eos
    .local int rx339_rep
    .local pmc rx339_cur
    (rx339_cur, rx339_pos, rx339_tgt, $I10) = self."!cursor_start"()
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
    rx339_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
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
    rx339_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx339_pos)
    .return (rx339_cur)
  rx339_restart:
.annotate 'line', 4
    rx339_cur."!cursor_debug"("NEXT ", "statement_prefix:sym<INIT>")
  rx339_fail:
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    rx339_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1279589170.0083") :method
.annotate 'line', 4
    $P341 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P342, "ResizablePMCArray"
    push $P342, $P341
    .return ($P342)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    (rx346_cur, rx346_pos, rx346_tgt, $I10) = self."!cursor_start"()
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
    rx346_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
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
    rx346_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx346_pos)
    .return (rx346_cur)
  rx346_restart:
.annotate 'line', 4
    rx346_cur."!cursor_debug"("NEXT ", "statement_prefix:sym<try>")
  rx346_fail:
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    rx346_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx346_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1279589170.0083") :method
.annotate 'line', 4
    $P348 = self."!PREFIX__!subrule"("blorst", "try")
    new $P349, "ResizablePMCArray"
    push $P349, $P348
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx353_tgt
    .local int rx353_pos
    .local int rx353_off
    .local int rx353_eos
    .local int rx353_rep
    .local pmc rx353_cur
    (rx353_cur, rx353_pos, rx353_tgt, $I10) = self."!cursor_start"()
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
    rx353_cur."!cursor_debug"("START ", "blorst")
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
    rx353_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx353_pos)
    .return (rx353_cur)
  rx353_restart:
.annotate 'line', 4
    rx353_cur."!cursor_debug"("NEXT ", "blorst")
  rx353_fail:
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    rx353_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx353_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1279589170.0083") :method
.annotate 'line', 4
    new $P355, "ResizablePMCArray"
    push $P355, ""
    .return ($P355)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1279589170.0083") :method
.annotate 'line', 212
    $P359 = self."!protoregex"("statement_mod_cond")
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1279589170.0083") :method
.annotate 'line', 212
    $P361 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    (rx363_cur, rx363_pos, rx363_tgt, $I10) = self."!cursor_start"()
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
    rx363_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
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
    rx363_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx363_pos)
    .return (rx363_cur)
  rx363_restart:
.annotate 'line', 4
    rx363_cur."!cursor_debug"("NEXT ", "statement_mod_cond:sym<if>")
  rx363_fail:
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    rx363_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1279589170.0083") :method
.annotate 'line', 4
    $P365 = self."!PREFIX__!subrule"("ws", "if")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt, $I10) = self."!cursor_start"()
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
    rx372_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
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
    rx372_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx372_pos)
    .return (rx372_cur)
  rx372_restart:
.annotate 'line', 4
    rx372_cur."!cursor_debug"("NEXT ", "statement_mod_cond:sym<unless>")
  rx372_fail:
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1279589170.0083") :method
.annotate 'line', 4
    $P374 = self."!PREFIX__!subrule"("ws", "unless")
    new $P375, "ResizablePMCArray"
    push $P375, $P374
    .return ($P375)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1279589170.0083") :method
.annotate 'line', 217
    $P381 = self."!protoregex"("statement_mod_loop")
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1279589170.0083") :method
.annotate 'line', 217
    $P383 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx385_tgt
    .local int rx385_pos
    .local int rx385_off
    .local int rx385_eos
    .local int rx385_rep
    .local pmc rx385_cur
    (rx385_cur, rx385_pos, rx385_tgt, $I10) = self."!cursor_start"()
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
    rx385_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
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
    rx385_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx385_pos)
    .return (rx385_cur)
  rx385_restart:
.annotate 'line', 4
    rx385_cur."!cursor_debug"("NEXT ", "statement_mod_loop:sym<while>")
  rx385_fail:
    (rx385_rep, rx385_pos, $I10, $P10) = rx385_cur."!mark_fail"(0)
    lt rx385_pos, -1, rx385_done
    eq rx385_pos, -1, rx385_fail
    jump $I10
  rx385_done:
    rx385_cur."!cursor_fail"()
    rx385_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx385_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1279589170.0083") :method
.annotate 'line', 4
    $P387 = self."!PREFIX__!subrule"("ws", "while")
    new $P388, "ResizablePMCArray"
    push $P388, $P387
    .return ($P388)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx394_tgt
    .local int rx394_pos
    .local int rx394_off
    .local int rx394_eos
    .local int rx394_rep
    .local pmc rx394_cur
    (rx394_cur, rx394_pos, rx394_tgt, $I10) = self."!cursor_start"()
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
    rx394_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
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
    rx394_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx394_pos)
    .return (rx394_cur)
  rx394_restart:
.annotate 'line', 4
    rx394_cur."!cursor_debug"("NEXT ", "statement_mod_loop:sym<until>")
  rx394_fail:
    (rx394_rep, rx394_pos, $I10, $P10) = rx394_cur."!mark_fail"(0)
    lt rx394_pos, -1, rx394_done
    eq rx394_pos, -1, rx394_fail
    jump $I10
  rx394_done:
    rx394_cur."!cursor_fail"()
    rx394_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx394_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1279589170.0083") :method
.annotate 'line', 4
    $P396 = self."!PREFIX__!subrule"("ws", "until")
    new $P397, "ResizablePMCArray"
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt, $I10) = self."!cursor_start"()
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
    rx403_cur."!cursor_debug"("START ", "statement_mod_loop:sym<for>")
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
    rx403_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<for>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_restart:
.annotate 'line', 4
    rx403_cur."!cursor_debug"("NEXT ", "statement_mod_loop:sym<for>")
  rx403_fail:
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<for>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1279589170.0083") :method
.annotate 'line', 4
    $P405 = self."!PREFIX__!subrule"("ws", "for")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt, $I10) = self."!cursor_start"()
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
    rx412_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_restart:
.annotate 'line', 4
    rx412_cur."!cursor_debug"("NEXT ", "term:sym<fatarrow>")
  rx412_fail:
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1279589170.0083") :method
.annotate 'line', 4
    $P414 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt, $I10) = self."!cursor_start"()
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
    rx418_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_restart:
.annotate 'line', 4
    rx418_cur."!cursor_debug"("NEXT ", "term:sym<colonpair>")
  rx418_fail:
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1279589170.0083") :method
.annotate 'line', 4
    $P420 = self."!PREFIX__!subrule"("colonpair", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt, $I10) = self."!cursor_start"()
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
    rx424_cur."!cursor_debug"("START ", "term:sym<variable>")
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
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_restart:
.annotate 'line', 4
    rx424_cur."!cursor_debug"("NEXT ", "term:sym<variable>")
  rx424_fail:
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("104_1279589170.0083") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("variable", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt, $I10) = self."!cursor_start"()
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
    rx430_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_restart:
.annotate 'line', 4
    rx430_cur."!cursor_debug"("NEXT ", "term:sym<package_declarator>")
  rx430_fail:
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1279589170.0083") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt, $I10) = self."!cursor_start"()
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
    rx436_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_restart:
.annotate 'line', 4
    rx436_cur."!cursor_debug"("NEXT ", "term:sym<scope_declarator>")
  rx436_fail:
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1279589170.0083") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt, $I10) = self."!cursor_start"()
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
    rx442_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 4
    rx442_cur."!cursor_debug"("NEXT ", "term:sym<routine_declarator>")
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1279589170.0083") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P453 = "113_1279589170.0083" 
    capture_lex $P453
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    (rx448_cur, rx448_pos, rx448_tgt, $I10) = self."!cursor_start"()
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
    rx448_cur."!cursor_debug"("START ", "term:sym<multi_declarator>")
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
    .const 'Sub' $P453 = "113_1279589170.0083" 
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
    rx448_cur."!cursor_debug"("PASS  ", "term:sym<multi_declarator>", " at pos=", rx448_pos)
    .return (rx448_cur)
  rx448_restart:
.annotate 'line', 4
    rx448_cur."!cursor_debug"("NEXT ", "term:sym<multi_declarator>")
  rx448_fail:
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    rx448_cur."!cursor_debug"("FAIL  ", "term:sym<multi_declarator>")
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1279589170.0083") :method
.annotate 'line', 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "_block452"  :anon :subid("113_1279589170.0083") :method :outer("111_1279589170.0083")
.annotate 'line', 231
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt, $I10) = self."!cursor_start"()
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
    rx454_cur."!cursor_debug"("START ", "")
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
    rx454_cur."!cursor_debug"("PASS  ", "", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_restart:
    rx454_cur."!cursor_debug"("NEXT ", "")
  rx454_fail:
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "")
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("114_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    (rx458_cur, rx458_pos, rx458_tgt, $I10) = self."!cursor_start"()
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
    rx458_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
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
    rx458_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx458_pos)
    .return (rx458_cur)
  rx458_restart:
.annotate 'line', 4
    rx458_cur."!cursor_debug"("NEXT ", "term:sym<regex_declarator>")
  rx458_fail:
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    rx458_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1279589170.0083") :method
.annotate 'line', 4
    $P460 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt, $I10) = self."!cursor_start"()
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
    rx464_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
    rx464_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_restart:
.annotate 'line', 4
    rx464_cur."!cursor_debug"("NEXT ", "term:sym<statement_prefix>")
  rx464_fail:
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1279589170.0083") :method
.annotate 'line', 4
    $P466 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
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
    rx470_cur."!cursor_debug"("START ", "term:sym<lambda>")
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
    rx470_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_restart:
.annotate 'line', 4
    rx470_cur."!cursor_debug"("NEXT ", "term:sym<lambda>")
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1279589170.0083") :method
.annotate 'line', 4
    new $P472, "ResizablePMCArray"
    push $P472, ""
    .return ($P472)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
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
    rx475_cur."!cursor_debug"("START ", "fatarrow")
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
  # rx rxquantr480 ** 0..*
    set_addr $I10, rxquantr480_done
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxquantr480_loop:
  # rx enumcharlist negate=0 
    ge rx475_pos, rx475_eos, rx475_fail
    sub $I10, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx475_fail
    inc rx475_pos
    set_addr $I10, rxquantr480_done
    (rx475_rep) = rx475_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr480_done
    rx475_cur."!mark_push"(rx475_rep, rx475_pos, $I10)
    goto rxquantr480_loop
  rxquantr480_done:
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
    rx475_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_restart:
.annotate 'line', 4
    rx475_cur."!cursor_debug"("NEXT ", "fatarrow")
  rx475_fail:
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("121_1279589170.0083") :method
.annotate 'line', 4
    $P477 = self."!PREFIX__!subrule"("identifier", "")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt, $I10) = self."!cursor_start"()
    rx482_cur."!cursor_caparray"("circumfix")
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
    rx482_cur."!cursor_debug"("START ", "colonpair")
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
    substr $S10, rx482_tgt, $I11, 1
    ne $S10, ":", rx482_fail
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
    substr $S10, rx482_tgt, $I11, 1
    ne $S10, "!", rx482_fail
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
    rx482_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_restart:
.annotate 'line', 4
    rx482_cur."!cursor_debug"("NEXT ", "colonpair")
  rx482_fail:
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("123_1279589170.0083") :method
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
.sub "variable"  :subid("124_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx494_tgt
    .local int rx494_pos
    .local int rx494_off
    .local int rx494_eos
    .local int rx494_rep
    .local pmc rx494_cur
    (rx494_cur, rx494_pos, rx494_tgt, $I10) = self."!cursor_start"()
    rx494_cur."!cursor_caparray"("twigil")
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
    rx494_cur."!cursor_debug"("START ", "variable")
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
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "$", rx494_fail
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
    rx494_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx494_pos)
    .return (rx494_cur)
  rx494_restart:
.annotate 'line', 4
    rx494_cur."!cursor_debug"("NEXT ", "variable")
  rx494_fail:
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    rx494_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx494_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("125_1279589170.0083") :method
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
.sub "sigil"  :subid("126_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt, $I10) = self."!cursor_start"()
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
    rx506_cur."!cursor_debug"("START ", "sigil")
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
    rx506_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_restart:
.annotate 'line', 4
    rx506_cur."!cursor_debug"("NEXT ", "sigil")
  rx506_fail:
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("127_1279589170.0083") :method
.annotate 'line', 4
    new $P508, "ResizablePMCArray"
    push $P508, "&"
    push $P508, "%"
    push $P508, "@"
    push $P508, "$"
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx511_tgt
    .local int rx511_pos
    .local int rx511_off
    .local int rx511_eos
    .local int rx511_rep
    .local pmc rx511_cur
    (rx511_cur, rx511_pos, rx511_tgt, $I10) = self."!cursor_start"()
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
    rx511_cur."!cursor_debug"("START ", "twigil")
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
    rx511_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx511_pos)
    .return (rx511_cur)
  rx511_restart:
.annotate 'line', 4
    rx511_cur."!cursor_debug"("NEXT ", "twigil")
  rx511_fail:
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    rx511_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("129_1279589170.0083") :method
.annotate 'line', 4
    new $P513, "ResizablePMCArray"
    push $P513, "?"
    push $P513, "!"
    push $P513, "*"
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1279589170.0083") :method
.annotate 'line', 259
    $P516 = self."!protoregex"("package_declarator")
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1279589170.0083") :method
.annotate 'line', 259
    $P518 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx520_tgt
    .local int rx520_pos
    .local int rx520_off
    .local int rx520_eos
    .local int rx520_rep
    .local pmc rx520_cur
    (rx520_cur, rx520_pos, rx520_tgt, $I10) = self."!cursor_start"()
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
    rx520_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
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
    rx520_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx520_pos)
    .return (rx520_cur)
  rx520_restart:
.annotate 'line', 4
    rx520_cur."!cursor_debug"("NEXT ", "package_declarator:sym<module>")
  rx520_fail:
    (rx520_rep, rx520_pos, $I10, $P10) = rx520_cur."!mark_fail"(0)
    lt rx520_pos, -1, rx520_done
    eq rx520_pos, -1, rx520_fail
    jump $I10
  rx520_done:
    rx520_cur."!cursor_fail"()
    rx520_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx520_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1279589170.0083") :method
.annotate 'line', 4
    $P522 = self."!PREFIX__!subrule"("package_def", "module")
    new $P523, "ResizablePMCArray"
    push $P523, $P522
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx527_tgt
    .local int rx527_pos
    .local int rx527_off
    .local int rx527_eos
    .local int rx527_rep
    .local pmc rx527_cur
    (rx527_cur, rx527_pos, rx527_tgt, $I10) = self."!cursor_start"()
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
    rx527_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
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
    rx527_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx527_pos)
    .return (rx527_cur)
  rx527_restart:
.annotate 'line', 4
    rx527_cur."!cursor_debug"("NEXT ", "package_declarator:sym<class>")
  rx527_fail:
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    rx527_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx527_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1279589170.0083") :method
.annotate 'line', 4
    $P529 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P530 = self."!PREFIX__!subrule"("package_def", "class")
    new $P531, "ResizablePMCArray"
    push $P531, $P529
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx536_tgt
    .local int rx536_pos
    .local int rx536_off
    .local int rx536_eos
    .local int rx536_rep
    .local pmc rx536_cur
    (rx536_cur, rx536_pos, rx536_tgt, $I10) = self."!cursor_start"()
    rx536_cur."!cursor_caparray"("parent")
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
    rx536_cur."!cursor_debug"("START ", "package_def")
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
    substr $S10, rx536_tgt, $I11, 1
    ne $S10, ";", rx536_fail
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
    rx536_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx536_pos)
    .return (rx536_cur)
  rx536_restart:
.annotate 'line', 4
    rx536_cur."!cursor_debug"("NEXT ", "package_def")
  rx536_fail:
    (rx536_rep, rx536_pos, $I10, $P10) = rx536_cur."!mark_fail"(0)
    lt rx536_pos, -1, rx536_done
    eq rx536_pos, -1, rx536_fail
    jump $I10
  rx536_done:
    rx536_cur."!cursor_fail"()
    rx536_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx536_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("137_1279589170.0083") :method
.annotate 'line', 4
    $P538 = self."!PREFIX__!subrule"("ws", "")
    new $P539, "ResizablePMCArray"
    push $P539, $P538
    .return ($P539)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1279589170.0083") :method
.annotate 'line', 273
    $P559 = self."!protoregex"("scope_declarator")
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1279589170.0083") :method
.annotate 'line', 273
    $P561 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P561)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx563_tgt
    .local int rx563_pos
    .local int rx563_off
    .local int rx563_eos
    .local int rx563_rep
    .local pmc rx563_cur
    (rx563_cur, rx563_pos, rx563_tgt, $I10) = self."!cursor_start"()
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
    rx563_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
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
    rx563_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx563_pos)
    .return (rx563_cur)
  rx563_restart:
.annotate 'line', 4
    rx563_cur."!cursor_debug"("NEXT ", "scope_declarator:sym<my>")
  rx563_fail:
    (rx563_rep, rx563_pos, $I10, $P10) = rx563_cur."!mark_fail"(0)
    lt rx563_pos, -1, rx563_done
    eq rx563_pos, -1, rx563_fail
    jump $I10
  rx563_done:
    rx563_cur."!cursor_fail"()
    rx563_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx563_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1279589170.0083") :method
.annotate 'line', 4
    $P565 = self."!PREFIX__!subrule"("scoped", "my")
    new $P566, "ResizablePMCArray"
    push $P566, $P565
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    (rx570_cur, rx570_pos, rx570_tgt, $I10) = self."!cursor_start"()
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
    rx570_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
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
    rx570_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx570_pos)
    .return (rx570_cur)
  rx570_restart:
.annotate 'line', 4
    rx570_cur."!cursor_debug"("NEXT ", "scope_declarator:sym<our>")
  rx570_fail:
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    rx570_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1279589170.0083") :method
.annotate 'line', 4
    $P572 = self."!PREFIX__!subrule"("scoped", "our")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt, $I10) = self."!cursor_start"()
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
    rx577_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
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
    rx577_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_restart:
.annotate 'line', 4
    rx577_cur."!cursor_debug"("NEXT ", "scope_declarator:sym<has>")
  rx577_fail:
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1279589170.0083") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "has")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1279589170.0083") :method :outer("11_1279589170.0083")
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
    (rx585_cur, rx585_pos, rx585_tgt, $I10) = self."!cursor_start"()
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
    rx585_cur."!cursor_debug"("START ", "scoped")
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
    rx585_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx585_pos)
    .return (rx585_cur)
  rx585_restart:
.annotate 'line', 4
    rx585_cur."!cursor_debug"("NEXT ", "scoped")
  rx585_fail:
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    rx585_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx585_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("147_1279589170.0083") :method
.annotate 'line', 4
    $P587 = self."!PREFIX__!subrule"("ws", "")
    $P588 = self."!PREFIX__!subrule"("ws", "")
    new $P589, "ResizablePMCArray"
    push $P589, $P587
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx597_tgt
    .local int rx597_pos
    .local int rx597_off
    .local int rx597_eos
    .local int rx597_rep
    .local pmc rx597_cur
    (rx597_cur, rx597_pos, rx597_tgt, $I10) = self."!cursor_start"()
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
    rx597_cur."!cursor_debug"("START ", "typename")
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
    rx597_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx597_pos)
    .return (rx597_cur)
  rx597_restart:
.annotate 'line', 4
    rx597_cur."!cursor_debug"("NEXT ", "typename")
  rx597_fail:
    (rx597_rep, rx597_pos, $I10, $P10) = rx597_cur."!mark_fail"(0)
    lt rx597_pos, -1, rx597_done
    eq rx597_pos, -1, rx597_fail
    jump $I10
  rx597_done:
    rx597_cur."!cursor_fail"()
    rx597_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx597_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("149_1279589170.0083") :method
.annotate 'line', 4
    $P599 = self."!PREFIX__!subrule"("name", "")
    new $P600, "ResizablePMCArray"
    push $P600, $P599
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx603_tgt
    .local int rx603_pos
    .local int rx603_off
    .local int rx603_eos
    .local int rx603_rep
    .local pmc rx603_cur
    (rx603_cur, rx603_pos, rx603_tgt, $I10) = self."!cursor_start"()
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
    rx603_cur."!cursor_debug"("START ", "declarator")
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
    rx603_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx603_pos)
    .return (rx603_cur)
  rx603_restart:
.annotate 'line', 4
    rx603_cur."!cursor_debug"("NEXT ", "declarator")
  rx603_fail:
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    rx603_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx603_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("151_1279589170.0083") :method
.annotate 'line', 4
    $P605 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P606 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P607, "ResizablePMCArray"
    push $P607, $P605
    push $P607, $P606
    .return ($P607)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx611_tgt
    .local int rx611_pos
    .local int rx611_off
    .local int rx611_eos
    .local int rx611_rep
    .local pmc rx611_cur
    (rx611_cur, rx611_pos, rx611_tgt, $I10) = self."!cursor_start"()
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
    rx611_cur."!cursor_debug"("START ", "variable_declarator")
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
    rx611_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx611_pos)
    .return (rx611_cur)
  rx611_restart:
.annotate 'line', 4
    rx611_cur."!cursor_debug"("NEXT ", "variable_declarator")
  rx611_fail:
    (rx611_rep, rx611_pos, $I10, $P10) = rx611_cur."!mark_fail"(0)
    lt rx611_pos, -1, rx611_done
    eq rx611_pos, -1, rx611_fail
    jump $I10
  rx611_done:
    rx611_cur."!cursor_fail"()
    rx611_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx611_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("153_1279589170.0083") :method
.annotate 'line', 4
    $P613 = self."!PREFIX__!subrule"("variable", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1279589170.0083") :method
.annotate 'line', 292
    $P617 = self."!protoregex"("routine_declarator")
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1279589170.0083") :method
.annotate 'line', 292
    $P619 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P619)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx621_tgt
    .local int rx621_pos
    .local int rx621_off
    .local int rx621_eos
    .local int rx621_rep
    .local pmc rx621_cur
    (rx621_cur, rx621_pos, rx621_tgt, $I10) = self."!cursor_start"()
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
    rx621_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
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
    rx621_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx621_pos)
    .return (rx621_cur)
  rx621_restart:
.annotate 'line', 4
    rx621_cur."!cursor_debug"("NEXT ", "routine_declarator:sym<sub>")
  rx621_fail:
    (rx621_rep, rx621_pos, $I10, $P10) = rx621_cur."!mark_fail"(0)
    lt rx621_pos, -1, rx621_done
    eq rx621_pos, -1, rx621_fail
    jump $I10
  rx621_done:
    rx621_cur."!cursor_fail"()
    rx621_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx621_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1279589170.0083") :method
.annotate 'line', 4
    $P623 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P624, "ResizablePMCArray"
    push $P624, $P623
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx628_tgt
    .local int rx628_pos
    .local int rx628_off
    .local int rx628_eos
    .local int rx628_rep
    .local pmc rx628_cur
    (rx628_cur, rx628_pos, rx628_tgt, $I10) = self."!cursor_start"()
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
    rx628_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
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
    rx628_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx628_pos)
    .return (rx628_cur)
  rx628_restart:
.annotate 'line', 4
    rx628_cur."!cursor_debug"("NEXT ", "routine_declarator:sym<method>")
  rx628_fail:
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    rx628_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1279589170.0083") :method
.annotate 'line', 4
    $P630 = self."!PREFIX__!subrule"("method_def", "method")
    new $P631, "ResizablePMCArray"
    push $P631, $P630
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    (rx635_cur, rx635_pos, rx635_tgt, $I10) = self."!cursor_start"()
    rx635_cur."!cursor_caparray"("sigil", "deflongname")
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
    rx635_cur."!cursor_debug"("START ", "routine_def")
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
    substr $S10, rx635_tgt, $I11, 1
    ne $S10, "&", rx635_fail
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
    substr $S10, rx635_tgt, $I11, 1
    ne $S10, "(", rx635_fail
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
    substr $S10, rx635_tgt, $I11, 1
    ne $S10, ")", rx635_fail
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
    rx635_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx635_pos)
    .return (rx635_cur)
  rx635_restart:
.annotate 'line', 4
    rx635_cur."!cursor_debug"("NEXT ", "routine_def")
  rx635_fail:
    (rx635_rep, rx635_pos, $I10, $P10) = rx635_cur."!mark_fail"(0)
    lt rx635_pos, -1, rx635_done
    eq rx635_pos, -1, rx635_fail
    jump $I10
  rx635_done:
    rx635_cur."!cursor_fail"()
    rx635_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx635_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("161_1279589170.0083") :method
.annotate 'line', 4
    $P637 = self."!PREFIX__!subrule"("ws", "")
    new $P638, "ResizablePMCArray"
    push $P638, $P637
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx658_tgt
    .local int rx658_pos
    .local int rx658_off
    .local int rx658_eos
    .local int rx658_rep
    .local pmc rx658_cur
    (rx658_cur, rx658_pos, rx658_tgt, $I10) = self."!cursor_start"()
    rx658_cur."!cursor_caparray"("deflongname")
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
    rx658_cur."!cursor_debug"("START ", "method_def")
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
    substr $S10, rx658_tgt, $I11, 1
    ne $S10, "(", rx658_fail
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
    substr $S10, rx658_tgt, $I11, 1
    ne $S10, ")", rx658_fail
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
    rx658_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx658_pos)
    .return (rx658_cur)
  rx658_restart:
.annotate 'line', 4
    rx658_cur."!cursor_debug"("NEXT ", "method_def")
  rx658_fail:
    (rx658_rep, rx658_pos, $I10, $P10) = rx658_cur."!mark_fail"(0)
    lt rx658_pos, -1, rx658_done
    eq rx658_pos, -1, rx658_fail
    jump $I10
  rx658_done:
    rx658_cur."!cursor_fail"()
    rx658_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx658_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("163_1279589170.0083") :method
.annotate 'line', 4
    $P660 = self."!PREFIX__!subrule"("ws", "")
    new $P661, "ResizablePMCArray"
    push $P661, $P660
    .return ($P661)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1279589170.0083") :method
.annotate 'line', 312
    $P678 = self."!protoregex"("multi_declarator")
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1279589170.0083") :method
.annotate 'line', 312
    $P680 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P680)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1279589170.0083") :method :outer("11_1279589170.0083")
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
    (rx683_cur, rx683_pos, rx683_tgt, $I10) = self."!cursor_start"()
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
    rx683_cur."!cursor_debug"("START ", "multi_declarator:sym<multi>")
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
    rx683_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<multi>", " at pos=", rx683_pos)
    .return (rx683_cur)
  rx683_restart:
.annotate 'line', 4
    rx683_cur."!cursor_debug"("NEXT ", "multi_declarator:sym<multi>")
  rx683_fail:
    (rx683_rep, rx683_pos, $I10, $P10) = rx683_cur."!mark_fail"(0)
    lt rx683_pos, -1, rx683_done
    eq rx683_pos, -1, rx683_fail
    jump $I10
  rx683_done:
    rx683_cur."!cursor_fail"()
    rx683_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<multi>")
    .return (rx683_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1279589170.0083") :method
.annotate 'line', 4
    $P685 = self."!PREFIX__!subrule"("ws", "multi")
    new $P686, "ResizablePMCArray"
    push $P686, $P685
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1279589170.0083") :method :outer("11_1279589170.0083")
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
    (rx693_cur, rx693_pos, rx693_tgt, $I10) = self."!cursor_start"()
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
    rx693_cur."!cursor_debug"("START ", "multi_declarator:sym<null>")
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
    rx693_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<null>", " at pos=", rx693_pos)
    .return (rx693_cur)
  rx693_restart:
.annotate 'line', 4
    rx693_cur."!cursor_debug"("NEXT ", "multi_declarator:sym<null>")
  rx693_fail:
    (rx693_rep, rx693_pos, $I10, $P10) = rx693_cur."!mark_fail"(0)
    lt rx693_pos, -1, rx693_done
    eq rx693_pos, -1, rx693_fail
    jump $I10
  rx693_done:
    rx693_cur."!cursor_fail"()
    rx693_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<null>")
    .return (rx693_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1279589170.0083") :method
.annotate 'line', 4
    $P695 = self."!PREFIX__!subrule"("declarator", "")
    new $P696, "ResizablePMCArray"
    push $P696, $P695
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx700_tgt
    .local int rx700_pos
    .local int rx700_off
    .local int rx700_eos
    .local int rx700_rep
    .local pmc rx700_cur
    (rx700_cur, rx700_pos, rx700_tgt, $I10) = self."!cursor_start"()
    rx700_cur."!cursor_caparray"("parameter")
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
    rx700_cur."!cursor_debug"("START ", "signature")
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
    substr $S10, rx700_tgt, $I11, 1
    ne $S10, ",", rx700_fail
    add rx700_pos, 1
    goto rxquantr705_loop
  rxquantr705_done:
    set_addr $I10, rxquantr704_done
    (rx700_rep) = rx700_cur."!mark_commit"($I10)
  rxquantr704_done:
  # rx pass
    rx700_cur."!cursor_pass"(rx700_pos, "signature")
    rx700_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx700_pos)
    .return (rx700_cur)
  rx700_restart:
.annotate 'line', 4
    rx700_cur."!cursor_debug"("NEXT ", "signature")
  rx700_fail:
    (rx700_rep, rx700_pos, $I10, $P10) = rx700_cur."!mark_fail"(0)
    lt rx700_pos, -1, rx700_done
    eq rx700_pos, -1, rx700_fail
    jump $I10
  rx700_done:
    rx700_cur."!cursor_fail"()
    rx700_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx700_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("171_1279589170.0083") :method
.annotate 'line', 4
    new $P702, "ResizablePMCArray"
    push $P702, ""
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    (rx707_cur, rx707_pos, rx707_tgt, $I10) = self."!cursor_start"()
    rx707_cur."!cursor_caparray"("default_value", "typename")
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
    rx707_cur."!cursor_debug"("START ", "parameter")
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
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, "*", rx707_fail
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
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, "?", rx707_fail
    add rx707_pos, 1
    goto alt715_end
  alt715_1:
    set_addr $I10, alt715_2
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx literal  "!"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, "!", rx707_fail
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
    rx707_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx707_pos)
    .return (rx707_cur)
  rx707_restart:
.annotate 'line', 4
    rx707_cur."!cursor_debug"("NEXT ", "parameter")
  rx707_fail:
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    rx707_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("173_1279589170.0083") :method
.annotate 'line', 4
    new $P709, "ResizablePMCArray"
    push $P709, ""
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    (rx720_cur, rx720_pos, rx720_tgt, $I10) = self."!cursor_start"()
    rx720_cur."!cursor_caparray"("twigil")
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
    rx720_cur."!cursor_debug"("START ", "param_var")
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
    rx720_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx720_pos)
    .return (rx720_cur)
  rx720_restart:
.annotate 'line', 4
    rx720_cur."!cursor_debug"("NEXT ", "param_var")
  rx720_fail:
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    rx720_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("175_1279589170.0083") :method
.annotate 'line', 4
    $P722 = self."!PREFIX__!subrule"("sigil", "")
    new $P723, "ResizablePMCArray"
    push $P723, $P722
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx730_tgt
    .local int rx730_pos
    .local int rx730_off
    .local int rx730_eos
    .local int rx730_rep
    .local pmc rx730_cur
    (rx730_cur, rx730_pos, rx730_tgt, $I10) = self."!cursor_start"()
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
    rx730_cur."!cursor_debug"("START ", "named_param")
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
    substr $S10, rx730_tgt, $I11, 1
    ne $S10, ":", rx730_fail
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
    rx730_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx730_pos)
    .return (rx730_cur)
  rx730_restart:
.annotate 'line', 4
    rx730_cur."!cursor_debug"("NEXT ", "named_param")
  rx730_fail:
    (rx730_rep, rx730_pos, $I10, $P10) = rx730_cur."!mark_fail"(0)
    lt rx730_pos, -1, rx730_done
    eq rx730_pos, -1, rx730_fail
    jump $I10
  rx730_done:
    rx730_cur."!cursor_fail"()
    rx730_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx730_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("177_1279589170.0083") :method
.annotate 'line', 4
    $P732 = self."!PREFIX__!subrule"("param_var", ":")
    new $P733, "ResizablePMCArray"
    push $P733, $P732
    .return ($P733)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx736_tgt
    .local int rx736_pos
    .local int rx736_off
    .local int rx736_eos
    .local int rx736_rep
    .local pmc rx736_cur
    (rx736_cur, rx736_pos, rx736_tgt, $I10) = self."!cursor_start"()
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
    rx736_cur."!cursor_debug"("START ", "default_value")
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
    substr $S10, rx736_tgt, $I11, 1
    ne $S10, "=", rx736_fail
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
    rx736_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx736_pos)
    .return (rx736_cur)
  rx736_restart:
.annotate 'line', 4
    rx736_cur."!cursor_debug"("NEXT ", "default_value")
  rx736_fail:
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    rx736_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("179_1279589170.0083") :method
.annotate 'line', 4
    $P738 = self."!PREFIX__!subrule"("ws", "")
    new $P739, "ResizablePMCArray"
    push $P739, $P738
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("180_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx745_tgt
    .local int rx745_pos
    .local int rx745_off
    .local int rx745_eos
    .local int rx745_rep
    .local pmc rx745_cur
    (rx745_cur, rx745_pos, rx745_tgt, $I10) = self."!cursor_start"()
    rx745_cur."!cursor_caparray"("signature")
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
    rx745_cur."!cursor_debug"("START ", "regex_declarator")
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, "{", rx745_fail
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, "}", rx745_fail
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, "(", rx745_fail
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, ")", rx745_fail
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, "{", rx745_fail
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
    substr $S10, rx745_tgt, $I11, 1
    ne $S10, "}", rx745_fail
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
    rx745_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx745_pos)
    .return (rx745_cur)
  rx745_restart:
.annotate 'line', 4
    rx745_cur."!cursor_debug"("NEXT ", "regex_declarator")
  rx745_fail:
    (rx745_rep, rx745_pos, $I10, $P10) = rx745_cur."!mark_fail"(0)
    lt rx745_pos, -1, rx745_done
    eq rx745_pos, -1, rx745_fail
    jump $I10
  rx745_done:
    rx745_cur."!cursor_fail"()
    rx745_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx745_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("181_1279589170.0083") :method
.annotate 'line', 4
    $P747 = self."!PREFIX__!subrule"("ws", "")
    new $P748, "ResizablePMCArray"
    push $P748, $P747
    .return ($P748)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("182_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt, $I10) = self."!cursor_start"()
    rx782_cur."!cursor_caparray"("args")
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
    rx782_cur."!cursor_debug"("START ", "dotty")
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
    substr $S10, rx782_tgt, $I11, 1
    ne $S10, ".", rx782_fail
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
    substr $S10, rx782_tgt, $I11, 1
    ne $S10, ":", rx782_fail
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
    rx782_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_restart:
.annotate 'line', 4
    rx782_cur."!cursor_debug"("NEXT ", "dotty")
  rx782_fail:
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("183_1279589170.0083") :method
.annotate 'line', 4
    $P784 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P785, "ResizablePMCArray"
    push $P785, "'"
    push $P785, "\""
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("184_1279589170.0083") :method
.annotate 'line', 376
    $P792 = self."!protoregex"("term")
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("185_1279589170.0083") :method
.annotate 'line', 376
    $P794 = self."!PREFIX__!protoregex"("term")
    .return ($P794)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("186_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx796_tgt
    .local int rx796_pos
    .local int rx796_off
    .local int rx796_eos
    .local int rx796_rep
    .local pmc rx796_cur
    (rx796_cur, rx796_pos, rx796_tgt, $I10) = self."!cursor_start"()
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
    rx796_cur."!cursor_debug"("START ", "term:sym<self>")
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
    rx796_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx796_pos)
    .return (rx796_cur)
  rx796_restart:
.annotate 'line', 4
    rx796_cur."!cursor_debug"("NEXT ", "term:sym<self>")
  rx796_fail:
    (rx796_rep, rx796_pos, $I10, $P10) = rx796_cur."!mark_fail"(0)
    lt rx796_pos, -1, rx796_done
    eq rx796_pos, -1, rx796_fail
    jump $I10
  rx796_done:
    rx796_cur."!cursor_fail"()
    rx796_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx796_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("187_1279589170.0083") :method
.annotate 'line', 4
    new $P798, "ResizablePMCArray"
    push $P798, "self"
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("188_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx802_tgt
    .local int rx802_pos
    .local int rx802_off
    .local int rx802_eos
    .local int rx802_rep
    .local pmc rx802_cur
    (rx802_cur, rx802_pos, rx802_tgt, $I10) = self."!cursor_start"()
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
    rx802_cur."!cursor_debug"("START ", "term:sym<identifier>")
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
    rx802_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx802_pos)
    .return (rx802_cur)
  rx802_restart:
.annotate 'line', 4
    rx802_cur."!cursor_debug"("NEXT ", "term:sym<identifier>")
  rx802_fail:
    (rx802_rep, rx802_pos, $I10, $P10) = rx802_cur."!mark_fail"(0)
    lt rx802_pos, -1, rx802_done
    eq rx802_pos, -1, rx802_fail
    jump $I10
  rx802_done:
    rx802_cur."!cursor_fail"()
    rx802_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx802_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("189_1279589170.0083") :method
.annotate 'line', 4
    $P804 = self."!PREFIX__!subrule"("deflongname", "")
    new $P805, "ResizablePMCArray"
    push $P805, $P804
    .return ($P805)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("190_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx808_tgt
    .local int rx808_pos
    .local int rx808_off
    .local int rx808_eos
    .local int rx808_rep
    .local pmc rx808_cur
    (rx808_cur, rx808_pos, rx808_tgt, $I10) = self."!cursor_start"()
    rx808_cur."!cursor_caparray"("args")
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
    rx808_cur."!cursor_debug"("START ", "term:sym<name>")
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
    rx808_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx808_pos)
    .return (rx808_cur)
  rx808_restart:
.annotate 'line', 4
    rx808_cur."!cursor_debug"("NEXT ", "term:sym<name>")
  rx808_fail:
    (rx808_rep, rx808_pos, $I10, $P10) = rx808_cur."!mark_fail"(0)
    lt rx808_pos, -1, rx808_done
    eq rx808_pos, -1, rx808_fail
    jump $I10
  rx808_done:
    rx808_cur."!cursor_fail"()
    rx808_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx808_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("191_1279589170.0083") :method
.annotate 'line', 4
    $P810 = self."!PREFIX__!subrule"("name", "")
    new $P811, "ResizablePMCArray"
    push $P811, $P810
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("192_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx816_tgt
    .local int rx816_pos
    .local int rx816_off
    .local int rx816_eos
    .local int rx816_rep
    .local pmc rx816_cur
    (rx816_cur, rx816_pos, rx816_tgt, $I10) = self."!cursor_start"()
    rx816_cur."!cursor_caparray"("args")
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
    rx816_cur."!cursor_debug"("START ", "term:sym<pir::op>")
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
    rx816_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx816_pos)
    .return (rx816_cur)
  rx816_restart:
.annotate 'line', 4
    rx816_cur."!cursor_debug"("NEXT ", "term:sym<pir::op>")
  rx816_fail:
    (rx816_rep, rx816_pos, $I10, $P10) = rx816_cur."!mark_fail"(0)
    lt rx816_pos, -1, rx816_done
    eq rx816_pos, -1, rx816_fail
    jump $I10
  rx816_done:
    rx816_cur."!cursor_fail"()
    rx816_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx816_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("193_1279589170.0083") :method
.annotate 'line', 4
    new $P818, "ResizablePMCArray"
    push $P818, "pir::"
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("194_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    (rx824_cur, rx824_pos, rx824_tgt, $I10) = self."!cursor_start"()
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
    rx824_cur."!cursor_debug"("START ", "args")
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
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "(", rx824_fail
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
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, ")", rx824_fail
    add rx824_pos, 1
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "args")
    rx824_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx824_pos)
    .return (rx824_cur)
  rx824_restart:
.annotate 'line', 4
    rx824_cur."!cursor_debug"("NEXT ", "args")
  rx824_fail:
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    rx824_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("195_1279589170.0083") :method
.annotate 'line', 4
    $P826 = self."!PREFIX__!subrule"("arglist", "(")
    new $P827, "ResizablePMCArray"
    push $P827, $P826
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("196_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt, $I10) = self."!cursor_start"()
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
    rx830_cur."!cursor_debug"("START ", "arglist")
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
    rx830_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_restart:
.annotate 'line', 4
    rx830_cur."!cursor_debug"("NEXT ", "arglist")
  rx830_fail:
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("197_1279589170.0083") :method
.annotate 'line', 4
    $P832 = self."!PREFIX__!subrule"("ws", "")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("198_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    (rx837_cur, rx837_pos, rx837_tgt, $I10) = self."!cursor_start"()
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
    rx837_cur."!cursor_debug"("START ", "term:sym<value>")
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
    rx837_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx837_pos)
    .return (rx837_cur)
  rx837_restart:
.annotate 'line', 4
    rx837_cur."!cursor_debug"("NEXT ", "term:sym<value>")
  rx837_fail:
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    rx837_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("199_1279589170.0083") :method
.annotate 'line', 4
    $P839 = self."!PREFIX__!subrule"("value", "")
    new $P840, "ResizablePMCArray"
    push $P840, $P839
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("200_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    (rx843_cur, rx843_pos, rx843_tgt, $I10) = self."!cursor_start"()
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
    rx843_cur."!cursor_debug"("START ", "value")
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
    rx843_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx843_pos)
    .return (rx843_cur)
  rx843_restart:
.annotate 'line', 4
    rx843_cur."!cursor_debug"("NEXT ", "value")
  rx843_fail:
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    rx843_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("201_1279589170.0083") :method
.annotate 'line', 4
    $P845 = self."!PREFIX__!subrule"("number", "")
    $P846 = self."!PREFIX__!subrule"("quote", "")
    new $P847, "ResizablePMCArray"
    push $P847, $P845
    push $P847, $P846
    .return ($P847)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("202_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt, $I10) = self."!cursor_start"()
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
    rx851_cur."!cursor_debug"("START ", "number")
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
  # rx rxquantr855 ** 0..1
    set_addr $I10, rxquantr855_done
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  rxquantr855_loop:
  # rx enumcharlist negate=0 
    ge rx851_pos, rx851_eos, rx851_fail
    sub $I10, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx851_fail
    inc rx851_pos
    set_addr $I10, rxquantr855_done
    (rx851_rep) = rx851_cur."!mark_commit"($I10)
  rxquantr855_done:
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
    rx851_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_restart:
.annotate 'line', 4
    rx851_cur."!cursor_debug"("NEXT ", "number")
  rx851_fail:
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("203_1279589170.0083") :method
.annotate 'line', 4
    new $P853, "ResizablePMCArray"
    push $P853, ""
    .return ($P853)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("204_1279589170.0083") :method
.annotate 'line', 417
    $P859 = self."!protoregex"("quote")
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("205_1279589170.0083") :method
.annotate 'line', 417
    $P861 = self."!PREFIX__!protoregex"("quote")
    .return ($P861)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("206_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx863_tgt
    .local int rx863_pos
    .local int rx863_off
    .local int rx863_eos
    .local int rx863_rep
    .local pmc rx863_cur
    (rx863_cur, rx863_pos, rx863_tgt, $I10) = self."!cursor_start"()
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
    rx863_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
    rx863_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx863_pos)
    .return (rx863_cur)
  rx863_restart:
.annotate 'line', 4
    rx863_cur."!cursor_debug"("NEXT ", "quote:sym<apos>")
  rx863_fail:
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    rx863_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("207_1279589170.0083") :method
.annotate 'line', 4
    new $P865, "ResizablePMCArray"
    push $P865, "'"
    .return ($P865)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("208_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx868_tgt
    .local int rx868_pos
    .local int rx868_off
    .local int rx868_eos
    .local int rx868_rep
    .local pmc rx868_cur
    (rx868_cur, rx868_pos, rx868_tgt, $I10) = self."!cursor_start"()
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
    rx868_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
    rx868_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx868_pos)
    .return (rx868_cur)
  rx868_restart:
.annotate 'line', 4
    rx868_cur."!cursor_debug"("NEXT ", "quote:sym<dblq>")
  rx868_fail:
    (rx868_rep, rx868_pos, $I10, $P10) = rx868_cur."!mark_fail"(0)
    lt rx868_pos, -1, rx868_done
    eq rx868_pos, -1, rx868_fail
    jump $I10
  rx868_done:
    rx868_cur."!cursor_fail"()
    rx868_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx868_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("209_1279589170.0083") :method
.annotate 'line', 4
    new $P870, "ResizablePMCArray"
    push $P870, "\""
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("210_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx873_tgt
    .local int rx873_pos
    .local int rx873_off
    .local int rx873_eos
    .local int rx873_rep
    .local pmc rx873_cur
    (rx873_cur, rx873_pos, rx873_tgt, $I10) = self."!cursor_start"()
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
    rx873_cur."!cursor_debug"("START ", "quote:sym<q>")
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
    substr $S10, rx873_tgt, $I11, 1
    ne $S10, "q", rx873_fail
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
    rx873_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx873_pos)
    .return (rx873_cur)
  rx873_restart:
.annotate 'line', 4
    rx873_cur."!cursor_debug"("NEXT ", "quote:sym<q>")
  rx873_fail:
    (rx873_rep, rx873_pos, $I10, $P10) = rx873_cur."!mark_fail"(0)
    lt rx873_pos, -1, rx873_done
    eq rx873_pos, -1, rx873_fail
    jump $I10
  rx873_done:
    rx873_cur."!cursor_fail"()
    rx873_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx873_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("211_1279589170.0083") :method
.annotate 'line', 4
    $P875 = self."!PREFIX__!subrule"("ws", "q")
    new $P876, "ResizablePMCArray"
    push $P876, $P875
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("212_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx879_tgt
    .local int rx879_pos
    .local int rx879_off
    .local int rx879_eos
    .local int rx879_rep
    .local pmc rx879_cur
    (rx879_cur, rx879_pos, rx879_tgt, $I10) = self."!cursor_start"()
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
    rx879_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    rx879_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx879_pos)
    .return (rx879_cur)
  rx879_restart:
.annotate 'line', 4
    rx879_cur."!cursor_debug"("NEXT ", "quote:sym<qq>")
  rx879_fail:
    (rx879_rep, rx879_pos, $I10, $P10) = rx879_cur."!mark_fail"(0)
    lt rx879_pos, -1, rx879_done
    eq rx879_pos, -1, rx879_fail
    jump $I10
  rx879_done:
    rx879_cur."!cursor_fail"()
    rx879_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx879_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("213_1279589170.0083") :method
.annotate 'line', 4
    $P881 = self."!PREFIX__!subrule"("ws", "qq")
    new $P882, "ResizablePMCArray"
    push $P882, $P881
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("214_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt, $I10) = self."!cursor_start"()
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
    rx885_cur."!cursor_debug"("START ", "quote:sym<Q>")
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
    substr $S10, rx885_tgt, $I11, 1
    ne $S10, "Q", rx885_fail
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
    rx885_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_restart:
.annotate 'line', 4
    rx885_cur."!cursor_debug"("NEXT ", "quote:sym<Q>")
  rx885_fail:
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("215_1279589170.0083") :method
.annotate 'line', 4
    $P887 = self."!PREFIX__!subrule"("ws", "Q")
    new $P888, "ResizablePMCArray"
    push $P888, $P887
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("216_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt, $I10) = self."!cursor_start"()
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
    rx891_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
    rx891_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_restart:
.annotate 'line', 4
    rx891_cur."!cursor_debug"("NEXT ", "quote:sym<Q:PIR>")
  rx891_fail:
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("217_1279589170.0083") :method
.annotate 'line', 4
    $P893 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P894, "ResizablePMCArray"
    push $P894, $P893
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("218_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx897_tgt
    .local int rx897_pos
    .local int rx897_off
    .local int rx897_eos
    .local int rx897_rep
    .local pmc rx897_cur
    (rx897_cur, rx897_pos, rx897_tgt, $I10) = self."!cursor_start"()
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
    rx897_cur."!cursor_debug"("START ", "quote:sym</ />")
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
    substr $S10, rx897_tgt, $I11, 1
    ne $S10, "/", rx897_fail
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
    substr $S10, rx897_tgt, $I11, 1
    ne $S10, "/", rx897_fail
    add rx897_pos, 1
.annotate 'line', 424
  # rx pass
    rx897_cur."!cursor_pass"(rx897_pos, "quote:sym</ />")
    rx897_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx897_pos)
    .return (rx897_cur)
  rx897_restart:
.annotate 'line', 4
    rx897_cur."!cursor_debug"("NEXT ", "quote:sym</ />")
  rx897_fail:
    (rx897_rep, rx897_pos, $I10, $P10) = rx897_cur."!mark_fail"(0)
    lt rx897_pos, -1, rx897_done
    eq rx897_pos, -1, rx897_fail
    jump $I10
  rx897_done:
    rx897_cur."!cursor_fail"()
    rx897_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("219_1279589170.0083") :method
.annotate 'line', 4
    $P899 = self."!PREFIX__!subrule"("newpad", "/")
    new $P900, "ResizablePMCArray"
    push $P900, $P899
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("220_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    (rx903_cur, rx903_pos, rx903_tgt, $I10) = self."!cursor_start"()
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
    rx903_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
    rx903_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx903_pos)
    .return (rx903_cur)
  rx903_restart:
.annotate 'line', 4
    rx903_cur."!cursor_debug"("NEXT ", "quote_escape:sym<$>")
  rx903_fail:
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    rx903_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("221_1279589170.0083") :method
.annotate 'line', 4
    new $P905, "ResizablePMCArray"
    push $P905, "$"
    .return ($P905)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("222_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx908_tgt
    .local int rx908_pos
    .local int rx908_off
    .local int rx908_eos
    .local int rx908_rep
    .local pmc rx908_cur
    (rx908_cur, rx908_pos, rx908_tgt, $I10) = self."!cursor_start"()
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
    rx908_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
    rx908_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx908_pos)
    .return (rx908_cur)
  rx908_restart:
.annotate 'line', 4
    rx908_cur."!cursor_debug"("NEXT ", "quote_escape:sym<{ }>")
  rx908_fail:
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    rx908_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("223_1279589170.0083") :method
.annotate 'line', 4
    new $P910, "ResizablePMCArray"
    push $P910, "{"
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("224_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt, $I10) = self."!cursor_start"()
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
    rx913_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
    rx913_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_restart:
.annotate 'line', 4
    rx913_cur."!cursor_debug"("NEXT ", "quote_escape:sym<esc>")
  rx913_fail:
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("225_1279589170.0083") :method
.annotate 'line', 4
    new $P915, "ResizablePMCArray"
    push $P915, "\\e"
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("226_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx918_tgt
    .local int rx918_pos
    .local int rx918_off
    .local int rx918_eos
    .local int rx918_rep
    .local pmc rx918_cur
    (rx918_cur, rx918_pos, rx918_tgt, $I10) = self."!cursor_start"()
    rx918_cur."!cursor_caparray"("EXPR")
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
    rx918_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
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
    substr $S10, rx918_tgt, $I11, 1
    ne $S10, "(", rx918_fail
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
    substr $S10, rx918_tgt, $I11, 1
    ne $S10, ")", rx918_fail
    add rx918_pos, 1
  # rx pass
    rx918_cur."!cursor_pass"(rx918_pos, "circumfix:sym<( )>")
    rx918_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx918_pos)
    .return (rx918_cur)
  rx918_restart:
.annotate 'line', 4
    rx918_cur."!cursor_debug"("NEXT ", "circumfix:sym<( )>")
  rx918_fail:
    (rx918_rep, rx918_pos, $I10, $P10) = rx918_cur."!mark_fail"(0)
    lt rx918_pos, -1, rx918_done
    eq rx918_pos, -1, rx918_fail
    jump $I10
  rx918_done:
    rx918_cur."!cursor_fail"()
    rx918_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx918_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("227_1279589170.0083") :method
.annotate 'line', 4
    $P920 = self."!PREFIX__!subrule"("ws", "(")
    new $P921, "ResizablePMCArray"
    push $P921, $P920
    .return ($P921)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("228_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    (rx926_cur, rx926_pos, rx926_tgt, $I10) = self."!cursor_start"()
    rx926_cur."!cursor_caparray"("EXPR")
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
    rx926_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
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
    substr $S10, rx926_tgt, $I11, 1
    ne $S10, "[", rx926_fail
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
    substr $S10, rx926_tgt, $I11, 1
    ne $S10, "]", rx926_fail
    add rx926_pos, 1
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "circumfix:sym<[ ]>")
    rx926_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx926_pos)
    .return (rx926_cur)
  rx926_restart:
.annotate 'line', 4
    rx926_cur."!cursor_debug"("NEXT ", "circumfix:sym<[ ]>")
  rx926_fail:
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    rx926_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("229_1279589170.0083") :method
.annotate 'line', 4
    $P928 = self."!PREFIX__!subrule"("ws", "[")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("230_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx934_tgt
    .local int rx934_pos
    .local int rx934_off
    .local int rx934_eos
    .local int rx934_rep
    .local pmc rx934_cur
    (rx934_cur, rx934_pos, rx934_tgt, $I10) = self."!cursor_start"()
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
    rx934_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
    rx934_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx934_pos)
    .return (rx934_cur)
  rx934_restart:
.annotate 'line', 4
    rx934_cur."!cursor_debug"("NEXT ", "circumfix:sym<ang>")
  rx934_fail:
    (rx934_rep, rx934_pos, $I10, $P10) = rx934_cur."!mark_fail"(0)
    lt rx934_pos, -1, rx934_done
    eq rx934_pos, -1, rx934_fail
    jump $I10
  rx934_done:
    rx934_cur."!cursor_fail"()
    rx934_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx934_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("231_1279589170.0083") :method
.annotate 'line', 4
    new $P936, "ResizablePMCArray"
    push $P936, "<"
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("232_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx939_tgt
    .local int rx939_pos
    .local int rx939_off
    .local int rx939_eos
    .local int rx939_rep
    .local pmc rx939_cur
    (rx939_cur, rx939_pos, rx939_tgt, $I10) = self."!cursor_start"()
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
    rx939_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
    rx939_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx939_pos)
    .return (rx939_cur)
  rx939_restart:
.annotate 'line', 4
    rx939_cur."!cursor_debug"("NEXT ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  rx939_fail:
    (rx939_rep, rx939_pos, $I10, $P10) = rx939_cur."!mark_fail"(0)
    lt rx939_pos, -1, rx939_done
    eq rx939_pos, -1, rx939_fail
    jump $I10
  rx939_done:
    rx939_cur."!cursor_fail"()
    rx939_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx939_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("233_1279589170.0083") :method
.annotate 'line', 4
    new $P941, "ResizablePMCArray"
    push $P941, unicode:"\x{ab}"
    .return ($P941)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("234_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx944_tgt
    .local int rx944_pos
    .local int rx944_off
    .local int rx944_eos
    .local int rx944_rep
    .local pmc rx944_cur
    (rx944_cur, rx944_pos, rx944_tgt, $I10) = self."!cursor_start"()
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
    rx944_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
    rx944_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx944_pos)
    .return (rx944_cur)
  rx944_restart:
.annotate 'line', 4
    rx944_cur."!cursor_debug"("NEXT ", "circumfix:sym<{ }>")
  rx944_fail:
    (rx944_rep, rx944_pos, $I10, $P10) = rx944_cur."!mark_fail"(0)
    lt rx944_pos, -1, rx944_done
    eq rx944_pos, -1, rx944_fail
    jump $I10
  rx944_done:
    rx944_cur."!cursor_fail"()
    rx944_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx944_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("235_1279589170.0083") :method
.annotate 'line', 4
    new $P946, "ResizablePMCArray"
    push $P946, "{"
    .return ($P946)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("236_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx949_tgt
    .local int rx949_pos
    .local int rx949_off
    .local int rx949_eos
    .local int rx949_rep
    .local pmc rx949_cur
    (rx949_cur, rx949_pos, rx949_tgt, $I10) = self."!cursor_start"()
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
    rx949_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
    substr $S10, rx949_tgt, $I11, 1
    ne $S10, "(", rx949_fail
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
    substr $S10, rx949_tgt, $I11, 1
    ne $S10, ")", rx949_fail
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
    rx949_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx949_pos)
    .return (rx949_cur)
  rx949_restart:
.annotate 'line', 4
    rx949_cur."!cursor_debug"("NEXT ", "circumfix:sym<sigil>")
  rx949_fail:
    (rx949_rep, rx949_pos, $I10, $P10) = rx949_cur."!mark_fail"(0)
    lt rx949_pos, -1, rx949_done
    eq rx949_pos, -1, rx949_fail
    jump $I10
  rx949_done:
    rx949_cur."!cursor_fail"()
    rx949_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx949_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("237_1279589170.0083") :method
.annotate 'line', 4
    $P951 = self."!PREFIX__!subrule"("sigil", "")
    new $P952, "ResizablePMCArray"
    push $P952, $P951
    .return ($P952)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("238_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 4
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    (rx958_cur, rx958_pos, rx958_tgt, $I10) = self."!cursor_start"()
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
    rx958_cur."!cursor_debug"("START ", "semilist")
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
    rx958_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx958_pos)
    .return (rx958_cur)
  rx958_restart:
.annotate 'line', 4
    rx958_cur."!cursor_debug"("NEXT ", "semilist")
  rx958_fail:
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    rx958_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("239_1279589170.0083") :method
.annotate 'line', 4
    $P960 = self."!PREFIX__!subrule"("ws", "")
    new $P961, "ResizablePMCArray"
    push $P961, $P960
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("240_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx966_tgt
    .local int rx966_pos
    .local int rx966_off
    .local int rx966_eos
    .local int rx966_rep
    .local pmc rx966_cur
    (rx966_cur, rx966_pos, rx966_tgt, $I10) = self."!cursor_start"()
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
    rx966_cur."!cursor_debug"("START ", "infixish")
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
    rx966_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx966_pos)
    .return (rx966_cur)
  rx966_restart:
.annotate 'line', 447
    rx966_cur."!cursor_debug"("NEXT ", "infixish")
  rx966_fail:
    (rx966_rep, rx966_pos, $I10, $P10) = rx966_cur."!mark_fail"(0)
    lt rx966_pos, -1, rx966_done
    eq rx966_pos, -1, rx966_fail
    jump $I10
  rx966_done:
    rx966_cur."!cursor_fail"()
    rx966_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx966_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("241_1279589170.0083") :method
.annotate 'line', 447
    new $P968, "ResizablePMCArray"
    push $P968, ""
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("242_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    (rx971_cur, rx971_pos, rx971_tgt, $I10) = self."!cursor_start"()
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
    rx971_cur."!cursor_debug"("START ", "infixstopper")
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
    rx971_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx971_pos)
    .return (rx971_cur)
  rx971_restart:
.annotate 'line', 447
    rx971_cur."!cursor_debug"("NEXT ", "infixstopper")
  rx971_fail:
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    rx971_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("243_1279589170.0083") :method
.annotate 'line', 447
    new $P973, "ResizablePMCArray"
    push $P973, ""
    .return ($P973)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("244_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx976_tgt
    .local int rx976_pos
    .local int rx976_off
    .local int rx976_eos
    .local int rx976_rep
    .local pmc rx976_cur
    (rx976_cur, rx976_pos, rx976_tgt, $I10) = self."!cursor_start"()
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
    rx976_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
    substr $S10, rx976_tgt, $I11, 1
    ne $S10, "[", rx976_fail
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
    substr $S10, rx976_tgt, $I11, 1
    ne $S10, "]", rx976_fail
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
    rx976_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx976_pos)
    .return (rx976_cur)
  rx976_restart:
.annotate 'line', 447
    rx976_cur."!cursor_debug"("NEXT ", "postcircumfix:sym<[ ]>")
  rx976_fail:
    (rx976_rep, rx976_pos, $I10, $P10) = rx976_cur."!mark_fail"(0)
    lt rx976_pos, -1, rx976_done
    eq rx976_pos, -1, rx976_fail
    jump $I10
  rx976_done:
    rx976_cur."!cursor_fail"()
    rx976_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx976_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("245_1279589170.0083") :method
.annotate 'line', 447
    $P978 = self."!PREFIX__!subrule"("ws", "[")
    new $P979, "ResizablePMCArray"
    push $P979, $P978
    .return ($P979)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("246_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt, $I10) = self."!cursor_start"()
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
    rx982_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "{", rx982_fail
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
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "}", rx982_fail
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
    rx982_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_restart:
.annotate 'line', 447
    rx982_cur."!cursor_debug"("NEXT ", "postcircumfix:sym<{ }>")
  rx982_fail:
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("247_1279589170.0083") :method
.annotate 'line', 447
    $P984 = self."!PREFIX__!subrule"("ws", "{")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("248_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt, $I10) = self."!cursor_start"()
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
    rx988_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
    rx988_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_restart:
.annotate 'line', 447
    rx988_cur."!cursor_debug"("NEXT ", "postcircumfix:sym<ang>")
  rx988_fail:
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("249_1279589170.0083") :method
.annotate 'line', 447
    new $P990, "ResizablePMCArray"
    push $P990, "<"
    .return ($P990)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("250_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    (rx993_cur, rx993_pos, rx993_tgt, $I10) = self."!cursor_start"()
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
    rx993_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
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
    substr $S10, rx993_tgt, $I11, 1
    ne $S10, "(", rx993_fail
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
    substr $S10, rx993_tgt, $I11, 1
    ne $S10, ")", rx993_fail
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
    rx993_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx993_pos)
    .return (rx993_cur)
  rx993_restart:
.annotate 'line', 447
    rx993_cur."!cursor_debug"("NEXT ", "postcircumfix:sym<( )>")
  rx993_fail:
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    rx993_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("251_1279589170.0083") :method
.annotate 'line', 447
    $P995 = self."!PREFIX__!subrule"("ws", "(")
    new $P996, "ResizablePMCArray"
    push $P996, $P995
    .return ($P996)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("252_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx999_tgt
    .local int rx999_pos
    .local int rx999_off
    .local int rx999_eos
    .local int rx999_rep
    .local pmc rx999_cur
    (rx999_cur, rx999_pos, rx999_tgt, $I10) = self."!cursor_start"()
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
    rx999_cur."!cursor_debug"("START ", "postfix:sym<.>")
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
    rx999_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx999_pos)
    .return (rx999_cur)
  rx999_restart:
.annotate 'line', 447
    rx999_cur."!cursor_debug"("NEXT ", "postfix:sym<.>")
  rx999_fail:
    (rx999_rep, rx999_pos, $I10, $P10) = rx999_cur."!mark_fail"(0)
    lt rx999_pos, -1, rx999_done
    eq rx999_pos, -1, rx999_fail
    jump $I10
  rx999_done:
    rx999_cur."!cursor_fail"()
    rx999_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx999_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("253_1279589170.0083") :method
.annotate 'line', 447
    $P1001 = self."!PREFIX__!subrule"("dotty", "")
    new $P1002, "ResizablePMCArray"
    push $P1002, $P1001
    .return ($P1002)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("254_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1005_tgt
    .local int rx1005_pos
    .local int rx1005_off
    .local int rx1005_eos
    .local int rx1005_rep
    .local pmc rx1005_cur
    (rx1005_cur, rx1005_pos, rx1005_tgt, $I10) = self."!cursor_start"()
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
    rx1005_cur."!cursor_debug"("START ", "prefix:sym<++>")
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
    rx1005_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx1005_pos)
    .return (rx1005_cur)
  rx1005_restart:
.annotate 'line', 447
    rx1005_cur."!cursor_debug"("NEXT ", "prefix:sym<++>")
  rx1005_fail:
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    rx1005_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx1005_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("255_1279589170.0083") :method
.annotate 'line', 447
    $P1007 = self."!PREFIX__!subrule"("O", "++")
    new $P1008, "ResizablePMCArray"
    push $P1008, $P1007
    .return ($P1008)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("256_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1012_tgt
    .local int rx1012_pos
    .local int rx1012_off
    .local int rx1012_eos
    .local int rx1012_rep
    .local pmc rx1012_cur
    (rx1012_cur, rx1012_pos, rx1012_tgt, $I10) = self."!cursor_start"()
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
    rx1012_cur."!cursor_debug"("START ", "prefix:sym<-->")
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
    rx1012_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx1012_pos)
    .return (rx1012_cur)
  rx1012_restart:
.annotate 'line', 447
    rx1012_cur."!cursor_debug"("NEXT ", "prefix:sym<-->")
  rx1012_fail:
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    rx1012_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("257_1279589170.0083") :method
.annotate 'line', 447
    $P1014 = self."!PREFIX__!subrule"("O", "--")
    new $P1015, "ResizablePMCArray"
    push $P1015, $P1014
    .return ($P1015)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("258_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1019_tgt
    .local int rx1019_pos
    .local int rx1019_off
    .local int rx1019_eos
    .local int rx1019_rep
    .local pmc rx1019_cur
    (rx1019_cur, rx1019_pos, rx1019_tgt, $I10) = self."!cursor_start"()
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
    rx1019_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
    rx1019_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx1019_pos)
    .return (rx1019_cur)
  rx1019_restart:
.annotate 'line', 447
    rx1019_cur."!cursor_debug"("NEXT ", "postfix:sym<++>")
  rx1019_fail:
    (rx1019_rep, rx1019_pos, $I10, $P10) = rx1019_cur."!mark_fail"(0)
    lt rx1019_pos, -1, rx1019_done
    eq rx1019_pos, -1, rx1019_fail
    jump $I10
  rx1019_done:
    rx1019_cur."!cursor_fail"()
    rx1019_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx1019_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("259_1279589170.0083") :method
.annotate 'line', 447
    $P1021 = self."!PREFIX__!subrule"("O", "++")
    new $P1022, "ResizablePMCArray"
    push $P1022, $P1021
    .return ($P1022)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("260_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1026_tgt
    .local int rx1026_pos
    .local int rx1026_off
    .local int rx1026_eos
    .local int rx1026_rep
    .local pmc rx1026_cur
    (rx1026_cur, rx1026_pos, rx1026_tgt, $I10) = self."!cursor_start"()
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
    rx1026_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
    rx1026_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1026_pos)
    .return (rx1026_cur)
  rx1026_restart:
.annotate 'line', 447
    rx1026_cur."!cursor_debug"("NEXT ", "postfix:sym<-->")
  rx1026_fail:
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    rx1026_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1026_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("261_1279589170.0083") :method
.annotate 'line', 447
    $P1028 = self."!PREFIX__!subrule"("O", "--")
    new $P1029, "ResizablePMCArray"
    push $P1029, $P1028
    .return ($P1029)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("262_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1033_tgt
    .local int rx1033_pos
    .local int rx1033_off
    .local int rx1033_eos
    .local int rx1033_rep
    .local pmc rx1033_cur
    (rx1033_cur, rx1033_pos, rx1033_tgt, $I10) = self."!cursor_start"()
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
    rx1033_cur."!cursor_debug"("START ", "infix:sym<**>")
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
    rx1033_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1033_pos)
    .return (rx1033_cur)
  rx1033_restart:
.annotate 'line', 447
    rx1033_cur."!cursor_debug"("NEXT ", "infix:sym<**>")
  rx1033_fail:
    (rx1033_rep, rx1033_pos, $I10, $P10) = rx1033_cur."!mark_fail"(0)
    lt rx1033_pos, -1, rx1033_done
    eq rx1033_pos, -1, rx1033_fail
    jump $I10
  rx1033_done:
    rx1033_cur."!cursor_fail"()
    rx1033_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1033_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("263_1279589170.0083") :method
.annotate 'line', 447
    $P1035 = self."!PREFIX__!subrule"("O", "**")
    new $P1036, "ResizablePMCArray"
    push $P1036, $P1035
    .return ($P1036)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("264_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1040_tgt
    .local int rx1040_pos
    .local int rx1040_off
    .local int rx1040_eos
    .local int rx1040_rep
    .local pmc rx1040_cur
    (rx1040_cur, rx1040_pos, rx1040_tgt, $I10) = self."!cursor_start"()
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
    rx1040_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
    substr $S10, rx1040_tgt, $I11, 1
    ne $S10, "+", rx1040_fail
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
    rx1040_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1040_pos)
    .return (rx1040_cur)
  rx1040_restart:
.annotate 'line', 447
    rx1040_cur."!cursor_debug"("NEXT ", "prefix:sym<+>")
  rx1040_fail:
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    rx1040_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("265_1279589170.0083") :method
.annotate 'line', 447
    $P1042 = self."!PREFIX__!subrule"("O", "+")
    new $P1043, "ResizablePMCArray"
    push $P1043, $P1042
    .return ($P1043)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("266_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1047_tgt
    .local int rx1047_pos
    .local int rx1047_off
    .local int rx1047_eos
    .local int rx1047_rep
    .local pmc rx1047_cur
    (rx1047_cur, rx1047_pos, rx1047_tgt, $I10) = self."!cursor_start"()
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
    rx1047_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
    substr $S10, rx1047_tgt, $I11, 1
    ne $S10, "~", rx1047_fail
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
    rx1047_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1047_pos)
    .return (rx1047_cur)
  rx1047_restart:
.annotate 'line', 447
    rx1047_cur."!cursor_debug"("NEXT ", "prefix:sym<~>")
  rx1047_fail:
    (rx1047_rep, rx1047_pos, $I10, $P10) = rx1047_cur."!mark_fail"(0)
    lt rx1047_pos, -1, rx1047_done
    eq rx1047_pos, -1, rx1047_fail
    jump $I10
  rx1047_done:
    rx1047_cur."!cursor_fail"()
    rx1047_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1047_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("267_1279589170.0083") :method
.annotate 'line', 447
    $P1049 = self."!PREFIX__!subrule"("O", "~")
    new $P1050, "ResizablePMCArray"
    push $P1050, $P1049
    .return ($P1050)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("268_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1054_tgt
    .local int rx1054_pos
    .local int rx1054_off
    .local int rx1054_eos
    .local int rx1054_rep
    .local pmc rx1054_cur
    (rx1054_cur, rx1054_pos, rx1054_tgt, $I10) = self."!cursor_start"()
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
    rx1054_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    substr $S10, rx1054_tgt, $I11, 1
    ne $S10, "-", rx1054_fail
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
    rx1054_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1054_pos)
    .return (rx1054_cur)
  rx1054_restart:
.annotate 'line', 447
    rx1054_cur."!cursor_debug"("NEXT ", "prefix:sym<->")
  rx1054_fail:
    (rx1054_rep, rx1054_pos, $I10, $P10) = rx1054_cur."!mark_fail"(0)
    lt rx1054_pos, -1, rx1054_done
    eq rx1054_pos, -1, rx1054_fail
    jump $I10
  rx1054_done:
    rx1054_cur."!cursor_fail"()
    rx1054_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1054_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("269_1279589170.0083") :method
.annotate 'line', 447
    new $P1056, "ResizablePMCArray"
    push $P1056, "-"
    .return ($P1056)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("270_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1060_tgt
    .local int rx1060_pos
    .local int rx1060_off
    .local int rx1060_eos
    .local int rx1060_rep
    .local pmc rx1060_cur
    (rx1060_cur, rx1060_pos, rx1060_tgt, $I10) = self."!cursor_start"()
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
    rx1060_cur."!cursor_debug"("START ", "prefix:sym<?>")
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
    substr $S10, rx1060_tgt, $I11, 1
    ne $S10, "?", rx1060_fail
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
    rx1060_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1060_pos)
    .return (rx1060_cur)
  rx1060_restart:
.annotate 'line', 447
    rx1060_cur."!cursor_debug"("NEXT ", "prefix:sym<?>")
  rx1060_fail:
    (rx1060_rep, rx1060_pos, $I10, $P10) = rx1060_cur."!mark_fail"(0)
    lt rx1060_pos, -1, rx1060_done
    eq rx1060_pos, -1, rx1060_fail
    jump $I10
  rx1060_done:
    rx1060_cur."!cursor_fail"()
    rx1060_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1060_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("271_1279589170.0083") :method
.annotate 'line', 447
    $P1062 = self."!PREFIX__!subrule"("O", "?")
    new $P1063, "ResizablePMCArray"
    push $P1063, $P1062
    .return ($P1063)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("272_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1067_tgt
    .local int rx1067_pos
    .local int rx1067_off
    .local int rx1067_eos
    .local int rx1067_rep
    .local pmc rx1067_cur
    (rx1067_cur, rx1067_pos, rx1067_tgt, $I10) = self."!cursor_start"()
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
    rx1067_cur."!cursor_debug"("START ", "prefix:sym<!>")
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
    substr $S10, rx1067_tgt, $I11, 1
    ne $S10, "!", rx1067_fail
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
    rx1067_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1067_pos)
    .return (rx1067_cur)
  rx1067_restart:
.annotate 'line', 447
    rx1067_cur."!cursor_debug"("NEXT ", "prefix:sym<!>")
  rx1067_fail:
    (rx1067_rep, rx1067_pos, $I10, $P10) = rx1067_cur."!mark_fail"(0)
    lt rx1067_pos, -1, rx1067_done
    eq rx1067_pos, -1, rx1067_fail
    jump $I10
  rx1067_done:
    rx1067_cur."!cursor_fail"()
    rx1067_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1067_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("273_1279589170.0083") :method
.annotate 'line', 447
    $P1069 = self."!PREFIX__!subrule"("O", "!")
    new $P1070, "ResizablePMCArray"
    push $P1070, $P1069
    .return ($P1070)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("274_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1074_tgt
    .local int rx1074_pos
    .local int rx1074_off
    .local int rx1074_eos
    .local int rx1074_rep
    .local pmc rx1074_cur
    (rx1074_cur, rx1074_pos, rx1074_tgt, $I10) = self."!cursor_start"()
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
    rx1074_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
    substr $S10, rx1074_tgt, $I11, 1
    ne $S10, "|", rx1074_fail
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
    rx1074_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1074_pos)
    .return (rx1074_cur)
  rx1074_restart:
.annotate 'line', 447
    rx1074_cur."!cursor_debug"("NEXT ", "prefix:sym<|>")
  rx1074_fail:
    (rx1074_rep, rx1074_pos, $I10, $P10) = rx1074_cur."!mark_fail"(0)
    lt rx1074_pos, -1, rx1074_done
    eq rx1074_pos, -1, rx1074_fail
    jump $I10
  rx1074_done:
    rx1074_cur."!cursor_fail"()
    rx1074_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1074_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("275_1279589170.0083") :method
.annotate 'line', 447
    $P1076 = self."!PREFIX__!subrule"("O", "|")
    new $P1077, "ResizablePMCArray"
    push $P1077, $P1076
    .return ($P1077)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("276_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1081_tgt
    .local int rx1081_pos
    .local int rx1081_off
    .local int rx1081_eos
    .local int rx1081_rep
    .local pmc rx1081_cur
    (rx1081_cur, rx1081_pos, rx1081_tgt, $I10) = self."!cursor_start"()
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
    rx1081_cur."!cursor_debug"("START ", "infix:sym<*>")
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
    substr $S10, rx1081_tgt, $I11, 1
    ne $S10, "*", rx1081_fail
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
    rx1081_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1081_pos)
    .return (rx1081_cur)
  rx1081_restart:
.annotate 'line', 447
    rx1081_cur."!cursor_debug"("NEXT ", "infix:sym<*>")
  rx1081_fail:
    (rx1081_rep, rx1081_pos, $I10, $P10) = rx1081_cur."!mark_fail"(0)
    lt rx1081_pos, -1, rx1081_done
    eq rx1081_pos, -1, rx1081_fail
    jump $I10
  rx1081_done:
    rx1081_cur."!cursor_fail"()
    rx1081_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1081_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("277_1279589170.0083") :method
.annotate 'line', 447
    $P1083 = self."!PREFIX__!subrule"("O", "*")
    new $P1084, "ResizablePMCArray"
    push $P1084, $P1083
    .return ($P1084)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("278_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1088_tgt
    .local int rx1088_pos
    .local int rx1088_off
    .local int rx1088_eos
    .local int rx1088_rep
    .local pmc rx1088_cur
    (rx1088_cur, rx1088_pos, rx1088_tgt, $I10) = self."!cursor_start"()
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
    rx1088_cur."!cursor_debug"("START ", "infix:sym</>")
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
    substr $S10, rx1088_tgt, $I11, 1
    ne $S10, "/", rx1088_fail
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
    rx1088_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1088_pos)
    .return (rx1088_cur)
  rx1088_restart:
.annotate 'line', 447
    rx1088_cur."!cursor_debug"("NEXT ", "infix:sym</>")
  rx1088_fail:
    (rx1088_rep, rx1088_pos, $I10, $P10) = rx1088_cur."!mark_fail"(0)
    lt rx1088_pos, -1, rx1088_done
    eq rx1088_pos, -1, rx1088_fail
    jump $I10
  rx1088_done:
    rx1088_cur."!cursor_fail"()
    rx1088_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1088_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("279_1279589170.0083") :method
.annotate 'line', 447
    $P1090 = self."!PREFIX__!subrule"("O", "/")
    new $P1091, "ResizablePMCArray"
    push $P1091, $P1090
    .return ($P1091)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("280_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1095_tgt
    .local int rx1095_pos
    .local int rx1095_off
    .local int rx1095_eos
    .local int rx1095_rep
    .local pmc rx1095_cur
    (rx1095_cur, rx1095_pos, rx1095_tgt, $I10) = self."!cursor_start"()
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
    rx1095_cur."!cursor_debug"("START ", "infix:sym<%>")
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
    substr $S10, rx1095_tgt, $I11, 1
    ne $S10, "%", rx1095_fail
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
    rx1095_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1095_pos)
    .return (rx1095_cur)
  rx1095_restart:
.annotate 'line', 447
    rx1095_cur."!cursor_debug"("NEXT ", "infix:sym<%>")
  rx1095_fail:
    (rx1095_rep, rx1095_pos, $I10, $P10) = rx1095_cur."!mark_fail"(0)
    lt rx1095_pos, -1, rx1095_done
    eq rx1095_pos, -1, rx1095_fail
    jump $I10
  rx1095_done:
    rx1095_cur."!cursor_fail"()
    rx1095_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1095_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("281_1279589170.0083") :method
.annotate 'line', 447
    $P1097 = self."!PREFIX__!subrule"("O", "%")
    new $P1098, "ResizablePMCArray"
    push $P1098, $P1097
    .return ($P1098)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("282_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1102_tgt
    .local int rx1102_pos
    .local int rx1102_off
    .local int rx1102_eos
    .local int rx1102_rep
    .local pmc rx1102_cur
    (rx1102_cur, rx1102_pos, rx1102_tgt, $I10) = self."!cursor_start"()
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
    rx1102_cur."!cursor_debug"("START ", "infix:sym<+&>")
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
    rx1102_cur."!cursor_debug"("PASS  ", "infix:sym<+&>", " at pos=", rx1102_pos)
    .return (rx1102_cur)
  rx1102_restart:
.annotate 'line', 447
    rx1102_cur."!cursor_debug"("NEXT ", "infix:sym<+&>")
  rx1102_fail:
    (rx1102_rep, rx1102_pos, $I10, $P10) = rx1102_cur."!mark_fail"(0)
    lt rx1102_pos, -1, rx1102_done
    eq rx1102_pos, -1, rx1102_fail
    jump $I10
  rx1102_done:
    rx1102_cur."!cursor_fail"()
    rx1102_cur."!cursor_debug"("FAIL  ", "infix:sym<+&>")
    .return (rx1102_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("283_1279589170.0083") :method
.annotate 'line', 447
    $P1104 = self."!PREFIX__!subrule"("O", "+&")
    new $P1105, "ResizablePMCArray"
    push $P1105, $P1104
    .return ($P1105)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("284_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1109_tgt
    .local int rx1109_pos
    .local int rx1109_off
    .local int rx1109_eos
    .local int rx1109_rep
    .local pmc rx1109_cur
    (rx1109_cur, rx1109_pos, rx1109_tgt, $I10) = self."!cursor_start"()
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
    rx1109_cur."!cursor_debug"("START ", "infix:sym<+>")
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
    substr $S10, rx1109_tgt, $I11, 1
    ne $S10, "+", rx1109_fail
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
    rx1109_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1109_pos)
    .return (rx1109_cur)
  rx1109_restart:
.annotate 'line', 447
    rx1109_cur."!cursor_debug"("NEXT ", "infix:sym<+>")
  rx1109_fail:
    (rx1109_rep, rx1109_pos, $I10, $P10) = rx1109_cur."!mark_fail"(0)
    lt rx1109_pos, -1, rx1109_done
    eq rx1109_pos, -1, rx1109_fail
    jump $I10
  rx1109_done:
    rx1109_cur."!cursor_fail"()
    rx1109_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1109_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("285_1279589170.0083") :method
.annotate 'line', 447
    $P1111 = self."!PREFIX__!subrule"("O", "+")
    new $P1112, "ResizablePMCArray"
    push $P1112, $P1111
    .return ($P1112)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("286_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1116_tgt
    .local int rx1116_pos
    .local int rx1116_off
    .local int rx1116_eos
    .local int rx1116_rep
    .local pmc rx1116_cur
    (rx1116_cur, rx1116_pos, rx1116_tgt, $I10) = self."!cursor_start"()
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
    rx1116_cur."!cursor_debug"("START ", "infix:sym<->")
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
    substr $S10, rx1116_tgt, $I11, 1
    ne $S10, "-", rx1116_fail
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
    rx1116_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1116_pos)
    .return (rx1116_cur)
  rx1116_restart:
.annotate 'line', 447
    rx1116_cur."!cursor_debug"("NEXT ", "infix:sym<->")
  rx1116_fail:
    (rx1116_rep, rx1116_pos, $I10, $P10) = rx1116_cur."!mark_fail"(0)
    lt rx1116_pos, -1, rx1116_done
    eq rx1116_pos, -1, rx1116_fail
    jump $I10
  rx1116_done:
    rx1116_cur."!cursor_fail"()
    rx1116_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1116_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("287_1279589170.0083") :method
.annotate 'line', 447
    $P1118 = self."!PREFIX__!subrule"("O", "-")
    new $P1119, "ResizablePMCArray"
    push $P1119, $P1118
    .return ($P1119)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("288_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1123_tgt
    .local int rx1123_pos
    .local int rx1123_off
    .local int rx1123_eos
    .local int rx1123_rep
    .local pmc rx1123_cur
    (rx1123_cur, rx1123_pos, rx1123_tgt, $I10) = self."!cursor_start"()
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
    rx1123_cur."!cursor_debug"("START ", "infix:sym<+|>")
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
    rx1123_cur."!cursor_debug"("PASS  ", "infix:sym<+|>", " at pos=", rx1123_pos)
    .return (rx1123_cur)
  rx1123_restart:
.annotate 'line', 447
    rx1123_cur."!cursor_debug"("NEXT ", "infix:sym<+|>")
  rx1123_fail:
    (rx1123_rep, rx1123_pos, $I10, $P10) = rx1123_cur."!mark_fail"(0)
    lt rx1123_pos, -1, rx1123_done
    eq rx1123_pos, -1, rx1123_fail
    jump $I10
  rx1123_done:
    rx1123_cur."!cursor_fail"()
    rx1123_cur."!cursor_debug"("FAIL  ", "infix:sym<+|>")
    .return (rx1123_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("289_1279589170.0083") :method
.annotate 'line', 447
    $P1125 = self."!PREFIX__!subrule"("O", "+|")
    new $P1126, "ResizablePMCArray"
    push $P1126, $P1125
    .return ($P1126)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("290_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1130_tgt
    .local int rx1130_pos
    .local int rx1130_off
    .local int rx1130_eos
    .local int rx1130_rep
    .local pmc rx1130_cur
    (rx1130_cur, rx1130_pos, rx1130_tgt, $I10) = self."!cursor_start"()
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
    rx1130_cur."!cursor_debug"("START ", "infix:sym<+^>")
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
    rx1130_cur."!cursor_debug"("PASS  ", "infix:sym<+^>", " at pos=", rx1130_pos)
    .return (rx1130_cur)
  rx1130_restart:
.annotate 'line', 447
    rx1130_cur."!cursor_debug"("NEXT ", "infix:sym<+^>")
  rx1130_fail:
    (rx1130_rep, rx1130_pos, $I10, $P10) = rx1130_cur."!mark_fail"(0)
    lt rx1130_pos, -1, rx1130_done
    eq rx1130_pos, -1, rx1130_fail
    jump $I10
  rx1130_done:
    rx1130_cur."!cursor_fail"()
    rx1130_cur."!cursor_debug"("FAIL  ", "infix:sym<+^>")
    .return (rx1130_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("291_1279589170.0083") :method
.annotate 'line', 447
    $P1132 = self."!PREFIX__!subrule"("O", "+^")
    new $P1133, "ResizablePMCArray"
    push $P1133, $P1132
    .return ($P1133)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("292_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1137_tgt
    .local int rx1137_pos
    .local int rx1137_off
    .local int rx1137_eos
    .local int rx1137_rep
    .local pmc rx1137_cur
    (rx1137_cur, rx1137_pos, rx1137_tgt, $I10) = self."!cursor_start"()
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
    rx1137_cur."!cursor_debug"("START ", "infix:sym<~>")
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
    substr $S10, rx1137_tgt, $I11, 1
    ne $S10, "~", rx1137_fail
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
    rx1137_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1137_pos)
    .return (rx1137_cur)
  rx1137_restart:
.annotate 'line', 447
    rx1137_cur."!cursor_debug"("NEXT ", "infix:sym<~>")
  rx1137_fail:
    (rx1137_rep, rx1137_pos, $I10, $P10) = rx1137_cur."!mark_fail"(0)
    lt rx1137_pos, -1, rx1137_done
    eq rx1137_pos, -1, rx1137_fail
    jump $I10
  rx1137_done:
    rx1137_cur."!cursor_fail"()
    rx1137_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1137_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("293_1279589170.0083") :method
.annotate 'line', 447
    $P1139 = self."!PREFIX__!subrule"("O", "~")
    new $P1140, "ResizablePMCArray"
    push $P1140, $P1139
    .return ($P1140)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("294_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1144_tgt
    .local int rx1144_pos
    .local int rx1144_off
    .local int rx1144_eos
    .local int rx1144_rep
    .local pmc rx1144_cur
    (rx1144_cur, rx1144_pos, rx1144_tgt, $I10) = self."!cursor_start"()
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
    rx1144_cur."!cursor_debug"("START ", "infix:sym<==>")
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
    rx1144_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1144_pos)
    .return (rx1144_cur)
  rx1144_restart:
.annotate 'line', 447
    rx1144_cur."!cursor_debug"("NEXT ", "infix:sym<==>")
  rx1144_fail:
    (rx1144_rep, rx1144_pos, $I10, $P10) = rx1144_cur."!mark_fail"(0)
    lt rx1144_pos, -1, rx1144_done
    eq rx1144_pos, -1, rx1144_fail
    jump $I10
  rx1144_done:
    rx1144_cur."!cursor_fail"()
    rx1144_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1144_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("295_1279589170.0083") :method
.annotate 'line', 447
    $P1146 = self."!PREFIX__!subrule"("O", "==")
    new $P1147, "ResizablePMCArray"
    push $P1147, $P1146
    .return ($P1147)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("296_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1151_tgt
    .local int rx1151_pos
    .local int rx1151_off
    .local int rx1151_eos
    .local int rx1151_rep
    .local pmc rx1151_cur
    (rx1151_cur, rx1151_pos, rx1151_tgt, $I10) = self."!cursor_start"()
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
    rx1151_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
    rx1151_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1151_pos)
    .return (rx1151_cur)
  rx1151_restart:
.annotate 'line', 447
    rx1151_cur."!cursor_debug"("NEXT ", "infix:sym<!=>")
  rx1151_fail:
    (rx1151_rep, rx1151_pos, $I10, $P10) = rx1151_cur."!mark_fail"(0)
    lt rx1151_pos, -1, rx1151_done
    eq rx1151_pos, -1, rx1151_fail
    jump $I10
  rx1151_done:
    rx1151_cur."!cursor_fail"()
    rx1151_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1151_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("297_1279589170.0083") :method
.annotate 'line', 447
    $P1153 = self."!PREFIX__!subrule"("O", "!=")
    new $P1154, "ResizablePMCArray"
    push $P1154, $P1153
    .return ($P1154)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("298_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1158_tgt
    .local int rx1158_pos
    .local int rx1158_off
    .local int rx1158_eos
    .local int rx1158_rep
    .local pmc rx1158_cur
    (rx1158_cur, rx1158_pos, rx1158_tgt, $I10) = self."!cursor_start"()
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
    rx1158_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
    rx1158_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1158_pos)
    .return (rx1158_cur)
  rx1158_restart:
.annotate 'line', 447
    rx1158_cur."!cursor_debug"("NEXT ", "infix:sym<<=>")
  rx1158_fail:
    (rx1158_rep, rx1158_pos, $I10, $P10) = rx1158_cur."!mark_fail"(0)
    lt rx1158_pos, -1, rx1158_done
    eq rx1158_pos, -1, rx1158_fail
    jump $I10
  rx1158_done:
    rx1158_cur."!cursor_fail"()
    rx1158_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1158_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("299_1279589170.0083") :method
.annotate 'line', 447
    $P1160 = self."!PREFIX__!subrule"("O", "<=")
    new $P1161, "ResizablePMCArray"
    push $P1161, $P1160
    .return ($P1161)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("300_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1165_tgt
    .local int rx1165_pos
    .local int rx1165_off
    .local int rx1165_eos
    .local int rx1165_rep
    .local pmc rx1165_cur
    (rx1165_cur, rx1165_pos, rx1165_tgt, $I10) = self."!cursor_start"()
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
    rx1165_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
    rx1165_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1165_pos)
    .return (rx1165_cur)
  rx1165_restart:
.annotate 'line', 447
    rx1165_cur."!cursor_debug"("NEXT ", "infix:sym<>=>")
  rx1165_fail:
    (rx1165_rep, rx1165_pos, $I10, $P10) = rx1165_cur."!mark_fail"(0)
    lt rx1165_pos, -1, rx1165_done
    eq rx1165_pos, -1, rx1165_fail
    jump $I10
  rx1165_done:
    rx1165_cur."!cursor_fail"()
    rx1165_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1165_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("301_1279589170.0083") :method
.annotate 'line', 447
    $P1167 = self."!PREFIX__!subrule"("O", ">=")
    new $P1168, "ResizablePMCArray"
    push $P1168, $P1167
    .return ($P1168)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("302_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    (rx1172_cur, rx1172_pos, rx1172_tgt, $I10) = self."!cursor_start"()
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
    rx1172_cur."!cursor_debug"("START ", "infix:sym<<>")
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
    substr $S10, rx1172_tgt, $I11, 1
    ne $S10, "<", rx1172_fail
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
    rx1172_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1172_pos)
    .return (rx1172_cur)
  rx1172_restart:
.annotate 'line', 447
    rx1172_cur."!cursor_debug"("NEXT ", "infix:sym<<>")
  rx1172_fail:
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    rx1172_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1172_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("303_1279589170.0083") :method
.annotate 'line', 447
    $P1174 = self."!PREFIX__!subrule"("O", "<")
    new $P1175, "ResizablePMCArray"
    push $P1175, $P1174
    .return ($P1175)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("304_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1179_tgt
    .local int rx1179_pos
    .local int rx1179_off
    .local int rx1179_eos
    .local int rx1179_rep
    .local pmc rx1179_cur
    (rx1179_cur, rx1179_pos, rx1179_tgt, $I10) = self."!cursor_start"()
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
    rx1179_cur."!cursor_debug"("START ", "infix:sym<>>")
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
    substr $S10, rx1179_tgt, $I11, 1
    ne $S10, ">", rx1179_fail
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
    rx1179_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1179_pos)
    .return (rx1179_cur)
  rx1179_restart:
.annotate 'line', 447
    rx1179_cur."!cursor_debug"("NEXT ", "infix:sym<>>")
  rx1179_fail:
    (rx1179_rep, rx1179_pos, $I10, $P10) = rx1179_cur."!mark_fail"(0)
    lt rx1179_pos, -1, rx1179_done
    eq rx1179_pos, -1, rx1179_fail
    jump $I10
  rx1179_done:
    rx1179_cur."!cursor_fail"()
    rx1179_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1179_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("305_1279589170.0083") :method
.annotate 'line', 447
    $P1181 = self."!PREFIX__!subrule"("O", ">")
    new $P1182, "ResizablePMCArray"
    push $P1182, $P1181
    .return ($P1182)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("306_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1186_tgt
    .local int rx1186_pos
    .local int rx1186_off
    .local int rx1186_eos
    .local int rx1186_rep
    .local pmc rx1186_cur
    (rx1186_cur, rx1186_pos, rx1186_tgt, $I10) = self."!cursor_start"()
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
    rx1186_cur."!cursor_debug"("START ", "infix:sym<eq>")
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
    rx1186_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1186_pos)
    .return (rx1186_cur)
  rx1186_restart:
.annotate 'line', 447
    rx1186_cur."!cursor_debug"("NEXT ", "infix:sym<eq>")
  rx1186_fail:
    (rx1186_rep, rx1186_pos, $I10, $P10) = rx1186_cur."!mark_fail"(0)
    lt rx1186_pos, -1, rx1186_done
    eq rx1186_pos, -1, rx1186_fail
    jump $I10
  rx1186_done:
    rx1186_cur."!cursor_fail"()
    rx1186_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1186_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("307_1279589170.0083") :method
.annotate 'line', 447
    $P1188 = self."!PREFIX__!subrule"("O", "eq")
    new $P1189, "ResizablePMCArray"
    push $P1189, $P1188
    .return ($P1189)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("308_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1193_tgt
    .local int rx1193_pos
    .local int rx1193_off
    .local int rx1193_eos
    .local int rx1193_rep
    .local pmc rx1193_cur
    (rx1193_cur, rx1193_pos, rx1193_tgt, $I10) = self."!cursor_start"()
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
    rx1193_cur."!cursor_debug"("START ", "infix:sym<ne>")
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
    rx1193_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1193_pos)
    .return (rx1193_cur)
  rx1193_restart:
.annotate 'line', 447
    rx1193_cur."!cursor_debug"("NEXT ", "infix:sym<ne>")
  rx1193_fail:
    (rx1193_rep, rx1193_pos, $I10, $P10) = rx1193_cur."!mark_fail"(0)
    lt rx1193_pos, -1, rx1193_done
    eq rx1193_pos, -1, rx1193_fail
    jump $I10
  rx1193_done:
    rx1193_cur."!cursor_fail"()
    rx1193_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1193_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("309_1279589170.0083") :method
.annotate 'line', 447
    $P1195 = self."!PREFIX__!subrule"("O", "ne")
    new $P1196, "ResizablePMCArray"
    push $P1196, $P1195
    .return ($P1196)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("310_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1200_tgt
    .local int rx1200_pos
    .local int rx1200_off
    .local int rx1200_eos
    .local int rx1200_rep
    .local pmc rx1200_cur
    (rx1200_cur, rx1200_pos, rx1200_tgt, $I10) = self."!cursor_start"()
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
    rx1200_cur."!cursor_debug"("START ", "infix:sym<le>")
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
    rx1200_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1200_pos)
    .return (rx1200_cur)
  rx1200_restart:
.annotate 'line', 447
    rx1200_cur."!cursor_debug"("NEXT ", "infix:sym<le>")
  rx1200_fail:
    (rx1200_rep, rx1200_pos, $I10, $P10) = rx1200_cur."!mark_fail"(0)
    lt rx1200_pos, -1, rx1200_done
    eq rx1200_pos, -1, rx1200_fail
    jump $I10
  rx1200_done:
    rx1200_cur."!cursor_fail"()
    rx1200_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1200_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("311_1279589170.0083") :method
.annotate 'line', 447
    $P1202 = self."!PREFIX__!subrule"("O", "le")
    new $P1203, "ResizablePMCArray"
    push $P1203, $P1202
    .return ($P1203)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("312_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    (rx1207_cur, rx1207_pos, rx1207_tgt, $I10) = self."!cursor_start"()
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
    rx1207_cur."!cursor_debug"("START ", "infix:sym<ge>")
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
    rx1207_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1207_pos)
    .return (rx1207_cur)
  rx1207_restart:
.annotate 'line', 447
    rx1207_cur."!cursor_debug"("NEXT ", "infix:sym<ge>")
  rx1207_fail:
    (rx1207_rep, rx1207_pos, $I10, $P10) = rx1207_cur."!mark_fail"(0)
    lt rx1207_pos, -1, rx1207_done
    eq rx1207_pos, -1, rx1207_fail
    jump $I10
  rx1207_done:
    rx1207_cur."!cursor_fail"()
    rx1207_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1207_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("313_1279589170.0083") :method
.annotate 'line', 447
    $P1209 = self."!PREFIX__!subrule"("O", "ge")
    new $P1210, "ResizablePMCArray"
    push $P1210, $P1209
    .return ($P1210)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("314_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1214_tgt
    .local int rx1214_pos
    .local int rx1214_off
    .local int rx1214_eos
    .local int rx1214_rep
    .local pmc rx1214_cur
    (rx1214_cur, rx1214_pos, rx1214_tgt, $I10) = self."!cursor_start"()
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
    rx1214_cur."!cursor_debug"("START ", "infix:sym<lt>")
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
    rx1214_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1214_pos)
    .return (rx1214_cur)
  rx1214_restart:
.annotate 'line', 447
    rx1214_cur."!cursor_debug"("NEXT ", "infix:sym<lt>")
  rx1214_fail:
    (rx1214_rep, rx1214_pos, $I10, $P10) = rx1214_cur."!mark_fail"(0)
    lt rx1214_pos, -1, rx1214_done
    eq rx1214_pos, -1, rx1214_fail
    jump $I10
  rx1214_done:
    rx1214_cur."!cursor_fail"()
    rx1214_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1214_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("315_1279589170.0083") :method
.annotate 'line', 447
    $P1216 = self."!PREFIX__!subrule"("O", "lt")
    new $P1217, "ResizablePMCArray"
    push $P1217, $P1216
    .return ($P1217)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("316_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1221_tgt
    .local int rx1221_pos
    .local int rx1221_off
    .local int rx1221_eos
    .local int rx1221_rep
    .local pmc rx1221_cur
    (rx1221_cur, rx1221_pos, rx1221_tgt, $I10) = self."!cursor_start"()
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
    rx1221_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
    rx1221_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1221_pos)
    .return (rx1221_cur)
  rx1221_restart:
.annotate 'line', 447
    rx1221_cur."!cursor_debug"("NEXT ", "infix:sym<gt>")
  rx1221_fail:
    (rx1221_rep, rx1221_pos, $I10, $P10) = rx1221_cur."!mark_fail"(0)
    lt rx1221_pos, -1, rx1221_done
    eq rx1221_pos, -1, rx1221_fail
    jump $I10
  rx1221_done:
    rx1221_cur."!cursor_fail"()
    rx1221_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1221_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("317_1279589170.0083") :method
.annotate 'line', 447
    $P1223 = self."!PREFIX__!subrule"("O", "gt")
    new $P1224, "ResizablePMCArray"
    push $P1224, $P1223
    .return ($P1224)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("318_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1228_tgt
    .local int rx1228_pos
    .local int rx1228_off
    .local int rx1228_eos
    .local int rx1228_rep
    .local pmc rx1228_cur
    (rx1228_cur, rx1228_pos, rx1228_tgt, $I10) = self."!cursor_start"()
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
    rx1228_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
    rx1228_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1228_pos)
    .return (rx1228_cur)
  rx1228_restart:
.annotate 'line', 447
    rx1228_cur."!cursor_debug"("NEXT ", "infix:sym<=:=>")
  rx1228_fail:
    (rx1228_rep, rx1228_pos, $I10, $P10) = rx1228_cur."!mark_fail"(0)
    lt rx1228_pos, -1, rx1228_done
    eq rx1228_pos, -1, rx1228_fail
    jump $I10
  rx1228_done:
    rx1228_cur."!cursor_fail"()
    rx1228_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1228_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("319_1279589170.0083") :method
.annotate 'line', 447
    $P1230 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1231, "ResizablePMCArray"
    push $P1231, $P1230
    .return ($P1231)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("320_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1235_tgt
    .local int rx1235_pos
    .local int rx1235_off
    .local int rx1235_eos
    .local int rx1235_rep
    .local pmc rx1235_cur
    (rx1235_cur, rx1235_pos, rx1235_tgt, $I10) = self."!cursor_start"()
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
    rx1235_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
    rx1235_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1235_pos)
    .return (rx1235_cur)
  rx1235_restart:
.annotate 'line', 447
    rx1235_cur."!cursor_debug"("NEXT ", "infix:sym<~~>")
  rx1235_fail:
    (rx1235_rep, rx1235_pos, $I10, $P10) = rx1235_cur."!mark_fail"(0)
    lt rx1235_pos, -1, rx1235_done
    eq rx1235_pos, -1, rx1235_fail
    jump $I10
  rx1235_done:
    rx1235_cur."!cursor_fail"()
    rx1235_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1235_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("321_1279589170.0083") :method
.annotate 'line', 447
    $P1237 = self."!PREFIX__!subrule"("O", "~~")
    new $P1238, "ResizablePMCArray"
    push $P1238, $P1237
    .return ($P1238)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("322_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1242_tgt
    .local int rx1242_pos
    .local int rx1242_off
    .local int rx1242_eos
    .local int rx1242_rep
    .local pmc rx1242_cur
    (rx1242_cur, rx1242_pos, rx1242_tgt, $I10) = self."!cursor_start"()
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
    rx1242_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
    rx1242_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1242_pos)
    .return (rx1242_cur)
  rx1242_restart:
.annotate 'line', 447
    rx1242_cur."!cursor_debug"("NEXT ", "infix:sym<&&>")
  rx1242_fail:
    (rx1242_rep, rx1242_pos, $I10, $P10) = rx1242_cur."!mark_fail"(0)
    lt rx1242_pos, -1, rx1242_done
    eq rx1242_pos, -1, rx1242_fail
    jump $I10
  rx1242_done:
    rx1242_cur."!cursor_fail"()
    rx1242_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1242_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("323_1279589170.0083") :method
.annotate 'line', 447
    $P1244 = self."!PREFIX__!subrule"("O", "&&")
    new $P1245, "ResizablePMCArray"
    push $P1245, $P1244
    .return ($P1245)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("324_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1249_tgt
    .local int rx1249_pos
    .local int rx1249_off
    .local int rx1249_eos
    .local int rx1249_rep
    .local pmc rx1249_cur
    (rx1249_cur, rx1249_pos, rx1249_tgt, $I10) = self."!cursor_start"()
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
    rx1249_cur."!cursor_debug"("START ", "infix:sym<||>")
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
    rx1249_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1249_pos)
    .return (rx1249_cur)
  rx1249_restart:
.annotate 'line', 447
    rx1249_cur."!cursor_debug"("NEXT ", "infix:sym<||>")
  rx1249_fail:
    (rx1249_rep, rx1249_pos, $I10, $P10) = rx1249_cur."!mark_fail"(0)
    lt rx1249_pos, -1, rx1249_done
    eq rx1249_pos, -1, rx1249_fail
    jump $I10
  rx1249_done:
    rx1249_cur."!cursor_fail"()
    rx1249_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1249_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("325_1279589170.0083") :method
.annotate 'line', 447
    $P1251 = self."!PREFIX__!subrule"("O", "||")
    new $P1252, "ResizablePMCArray"
    push $P1252, $P1251
    .return ($P1252)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("326_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1256_tgt
    .local int rx1256_pos
    .local int rx1256_off
    .local int rx1256_eos
    .local int rx1256_rep
    .local pmc rx1256_cur
    (rx1256_cur, rx1256_pos, rx1256_tgt, $I10) = self."!cursor_start"()
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
    rx1256_cur."!cursor_debug"("START ", "infix:sym<//>")
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
    rx1256_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1256_pos)
    .return (rx1256_cur)
  rx1256_restart:
.annotate 'line', 447
    rx1256_cur."!cursor_debug"("NEXT ", "infix:sym<//>")
  rx1256_fail:
    (rx1256_rep, rx1256_pos, $I10, $P10) = rx1256_cur."!mark_fail"(0)
    lt rx1256_pos, -1, rx1256_done
    eq rx1256_pos, -1, rx1256_fail
    jump $I10
  rx1256_done:
    rx1256_cur."!cursor_fail"()
    rx1256_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1256_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("327_1279589170.0083") :method
.annotate 'line', 447
    $P1258 = self."!PREFIX__!subrule"("O", "//")
    new $P1259, "ResizablePMCArray"
    push $P1259, $P1258
    .return ($P1259)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("328_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1263_tgt
    .local int rx1263_pos
    .local int rx1263_off
    .local int rx1263_eos
    .local int rx1263_rep
    .local pmc rx1263_cur
    (rx1263_cur, rx1263_pos, rx1263_tgt, $I10) = self."!cursor_start"()
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
    rx1263_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
    rx1263_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1263_pos)
    .return (rx1263_cur)
  rx1263_restart:
.annotate 'line', 447
    rx1263_cur."!cursor_debug"("NEXT ", "infix:sym<?? !!>")
  rx1263_fail:
    (rx1263_rep, rx1263_pos, $I10, $P10) = rx1263_cur."!mark_fail"(0)
    lt rx1263_pos, -1, rx1263_done
    eq rx1263_pos, -1, rx1263_fail
    jump $I10
  rx1263_done:
    rx1263_cur."!cursor_fail"()
    rx1263_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1263_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("329_1279589170.0083") :method
.annotate 'line', 447
    $P1265 = self."!PREFIX__!subrule"("ws", "??")
    new $P1266, "ResizablePMCArray"
    push $P1266, $P1265
    .return ($P1266)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("330_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1269_tgt
    .local int rx1269_pos
    .local int rx1269_off
    .local int rx1269_eos
    .local int rx1269_rep
    .local pmc rx1269_cur
    (rx1269_cur, rx1269_pos, rx1269_tgt, $I10) = self."!cursor_start"()
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
    rx1269_cur."!cursor_debug"("START ", "infix:sym<=>")
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
    substr $S10, rx1269_tgt, $I11, 1
    ne $S10, "=", rx1269_fail
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
    rx1269_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1269_pos)
    .return (rx1269_cur)
  rx1269_restart:
.annotate 'line', 447
    rx1269_cur."!cursor_debug"("NEXT ", "infix:sym<=>")
  rx1269_fail:
    (rx1269_rep, rx1269_pos, $I10, $P10) = rx1269_cur."!mark_fail"(0)
    lt rx1269_pos, -1, rx1269_done
    eq rx1269_pos, -1, rx1269_fail
    jump $I10
  rx1269_done:
    rx1269_cur."!cursor_fail"()
    rx1269_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1269_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("331_1279589170.0083") :method
.annotate 'line', 447
    $P1271 = self."!PREFIX__!subrule"("panic", "=")
    new $P1272, "ResizablePMCArray"
    push $P1272, $P1271
    .return ($P1272)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("332_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1276_tgt
    .local int rx1276_pos
    .local int rx1276_off
    .local int rx1276_eos
    .local int rx1276_rep
    .local pmc rx1276_cur
    (rx1276_cur, rx1276_pos, rx1276_tgt, $I10) = self."!cursor_start"()
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
    rx1276_cur."!cursor_debug"("START ", "infix:sym<:=>")
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
    rx1276_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1276_pos)
    .return (rx1276_cur)
  rx1276_restart:
.annotate 'line', 447
    rx1276_cur."!cursor_debug"("NEXT ", "infix:sym<:=>")
  rx1276_fail:
    (rx1276_rep, rx1276_pos, $I10, $P10) = rx1276_cur."!mark_fail"(0)
    lt rx1276_pos, -1, rx1276_done
    eq rx1276_pos, -1, rx1276_fail
    jump $I10
  rx1276_done:
    rx1276_cur."!cursor_fail"()
    rx1276_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("333_1279589170.0083") :method
.annotate 'line', 447
    $P1278 = self."!PREFIX__!subrule"("O", ":=")
    new $P1279, "ResizablePMCArray"
    push $P1279, $P1278
    .return ($P1279)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("334_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1283_tgt
    .local int rx1283_pos
    .local int rx1283_off
    .local int rx1283_eos
    .local int rx1283_rep
    .local pmc rx1283_cur
    (rx1283_cur, rx1283_pos, rx1283_tgt, $I10) = self."!cursor_start"()
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
    rx1283_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
    rx1283_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1283_pos)
    .return (rx1283_cur)
  rx1283_restart:
.annotate 'line', 447
    rx1283_cur."!cursor_debug"("NEXT ", "infix:sym<::=>")
  rx1283_fail:
    (rx1283_rep, rx1283_pos, $I10, $P10) = rx1283_cur."!mark_fail"(0)
    lt rx1283_pos, -1, rx1283_done
    eq rx1283_pos, -1, rx1283_fail
    jump $I10
  rx1283_done:
    rx1283_cur."!cursor_fail"()
    rx1283_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("335_1279589170.0083") :method
.annotate 'line', 447
    $P1285 = self."!PREFIX__!subrule"("O", "::=")
    new $P1286, "ResizablePMCArray"
    push $P1286, $P1285
    .return ($P1286)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("336_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1290_tgt
    .local int rx1290_pos
    .local int rx1290_off
    .local int rx1290_eos
    .local int rx1290_rep
    .local pmc rx1290_cur
    (rx1290_cur, rx1290_pos, rx1290_tgt, $I10) = self."!cursor_start"()
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
    rx1290_cur."!cursor_debug"("START ", "infix:sym<,>")
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
    substr $S10, rx1290_tgt, $I11, 1
    ne $S10, ",", rx1290_fail
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
    rx1290_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1290_pos)
    .return (rx1290_cur)
  rx1290_restart:
.annotate 'line', 447
    rx1290_cur."!cursor_debug"("NEXT ", "infix:sym<,>")
  rx1290_fail:
    (rx1290_rep, rx1290_pos, $I10, $P10) = rx1290_cur."!mark_fail"(0)
    lt rx1290_pos, -1, rx1290_done
    eq rx1290_pos, -1, rx1290_fail
    jump $I10
  rx1290_done:
    rx1290_cur."!cursor_fail"()
    rx1290_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("337_1279589170.0083") :method
.annotate 'line', 447
    $P1292 = self."!PREFIX__!subrule"("O", ",")
    new $P1293, "ResizablePMCArray"
    push $P1293, $P1292
    .return ($P1293)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("338_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1297_tgt
    .local int rx1297_pos
    .local int rx1297_off
    .local int rx1297_eos
    .local int rx1297_rep
    .local pmc rx1297_cur
    (rx1297_cur, rx1297_pos, rx1297_tgt, $I10) = self."!cursor_start"()
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
    rx1297_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
    rx1297_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1297_pos)
    .return (rx1297_cur)
  rx1297_restart:
.annotate 'line', 447
    rx1297_cur."!cursor_debug"("NEXT ", "prefix:sym<return>")
  rx1297_fail:
    (rx1297_rep, rx1297_pos, $I10, $P10) = rx1297_cur."!mark_fail"(0)
    lt rx1297_pos, -1, rx1297_done
    eq rx1297_pos, -1, rx1297_fail
    jump $I10
  rx1297_done:
    rx1297_cur."!cursor_fail"()
    rx1297_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1297_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("339_1279589170.0083") :method
.annotate 'line', 447
    new $P1299, "ResizablePMCArray"
    push $P1299, "return"
    .return ($P1299)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("340_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1303_tgt
    .local int rx1303_pos
    .local int rx1303_off
    .local int rx1303_eos
    .local int rx1303_rep
    .local pmc rx1303_cur
    (rx1303_cur, rx1303_pos, rx1303_tgt, $I10) = self."!cursor_start"()
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
    rx1303_cur."!cursor_debug"("START ", "prefix:sym<make>")
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
    rx1303_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1303_pos)
    .return (rx1303_cur)
  rx1303_restart:
.annotate 'line', 447
    rx1303_cur."!cursor_debug"("NEXT ", "prefix:sym<make>")
  rx1303_fail:
    (rx1303_rep, rx1303_pos, $I10, $P10) = rx1303_cur."!mark_fail"(0)
    lt rx1303_pos, -1, rx1303_done
    eq rx1303_pos, -1, rx1303_fail
    jump $I10
  rx1303_done:
    rx1303_cur."!cursor_fail"()
    rx1303_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("341_1279589170.0083") :method
.annotate 'line', 447
    new $P1305, "ResizablePMCArray"
    push $P1305, "make"
    .return ($P1305)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("342_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1309_tgt
    .local int rx1309_pos
    .local int rx1309_off
    .local int rx1309_eos
    .local int rx1309_rep
    .local pmc rx1309_cur
    (rx1309_cur, rx1309_pos, rx1309_tgt, $I10) = self."!cursor_start"()
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
    rx1309_cur."!cursor_debug"("START ", "term:sym<last>")
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
    rx1309_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1309_pos)
    .return (rx1309_cur)
  rx1309_restart:
.annotate 'line', 447
    rx1309_cur."!cursor_debug"("NEXT ", "term:sym<last>")
  rx1309_fail:
    (rx1309_rep, rx1309_pos, $I10, $P10) = rx1309_cur."!mark_fail"(0)
    lt rx1309_pos, -1, rx1309_done
    eq rx1309_pos, -1, rx1309_fail
    jump $I10
  rx1309_done:
    rx1309_cur."!cursor_fail"()
    rx1309_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1309_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("343_1279589170.0083") :method
.annotate 'line', 447
    new $P1311, "ResizablePMCArray"
    push $P1311, "last"
    .return ($P1311)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("344_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1315_tgt
    .local int rx1315_pos
    .local int rx1315_off
    .local int rx1315_eos
    .local int rx1315_rep
    .local pmc rx1315_cur
    (rx1315_cur, rx1315_pos, rx1315_tgt, $I10) = self."!cursor_start"()
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
    rx1315_cur."!cursor_debug"("START ", "term:sym<next>")
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
    rx1315_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1315_pos)
    .return (rx1315_cur)
  rx1315_restart:
.annotate 'line', 447
    rx1315_cur."!cursor_debug"("NEXT ", "term:sym<next>")
  rx1315_fail:
    (rx1315_rep, rx1315_pos, $I10, $P10) = rx1315_cur."!mark_fail"(0)
    lt rx1315_pos, -1, rx1315_done
    eq rx1315_pos, -1, rx1315_fail
    jump $I10
  rx1315_done:
    rx1315_cur."!cursor_fail"()
    rx1315_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("345_1279589170.0083") :method
.annotate 'line', 447
    new $P1317, "ResizablePMCArray"
    push $P1317, "next"
    .return ($P1317)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("346_1279589170.0083") :method :outer("11_1279589170.0083")
.annotate 'line', 447
    .local string rx1321_tgt
    .local int rx1321_pos
    .local int rx1321_off
    .local int rx1321_eos
    .local int rx1321_rep
    .local pmc rx1321_cur
    (rx1321_cur, rx1321_pos, rx1321_tgt, $I10) = self."!cursor_start"()
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
    rx1321_cur."!cursor_debug"("START ", "term:sym<redo>")
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
    rx1321_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1321_pos)
    .return (rx1321_cur)
  rx1321_restart:
.annotate 'line', 447
    rx1321_cur."!cursor_debug"("NEXT ", "term:sym<redo>")
  rx1321_fail:
    (rx1321_rep, rx1321_pos, $I10, $P10) = rx1321_cur."!mark_fail"(0)
    lt rx1321_pos, -1, rx1321_done
    eq rx1321_pos, -1, rx1321_fail
    jump $I10
  rx1321_done:
    rx1321_cur."!cursor_fail"()
    rx1321_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1321_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("347_1279589170.0083") :method
.annotate 'line', 447
    new $P1323, "ResizablePMCArray"
    push $P1323, "redo"
    .return ($P1323)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("348_1279589170.0083") :method :outer("11_1279589170.0083")
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
    unless_null $P1331, vivify_384
    $P1331 = root_new ['parrot';'ResizablePMCArray']
  vivify_384:
    set $P1332, $P1331[0]
    unless_null $P1332, vivify_385
    new $P1332, "Undef"
  vivify_385:
    store_lex "$t", $P1332
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_386
    $P1333 = root_new ['parrot';'ResizablePMCArray']
  vivify_386:
    set $P1334, $P1333[1]
    unless_null $P1334, vivify_387
    new $P1334, "Undef"
  vivify_387:
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_388
    $P1335 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1335
  vivify_388:
    set $P1335[0], $P1334
    find_lex $P1336, "$t"
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_389
    $P1337 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1337
  vivify_389:
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
.sub "_block1339"  :subid("349_1279589170.0083") :outer("11_1279589170.0083")
.annotate 'line', 567
    .const 'Sub' $P1396 = "368_1279589170.0083" 
    capture_lex $P1396
    .const 'Sub' $P1391 = "366_1279589170.0083" 
    capture_lex $P1391
    .const 'Sub' $P1379 = "363_1279589170.0083" 
    capture_lex $P1379
    .const 'Sub' $P1369 = "360_1279589170.0083" 
    capture_lex $P1369
    .const 'Sub' $P1364 = "358_1279589170.0083" 
    capture_lex $P1364
    .const 'Sub' $P1355 = "355_1279589170.0083" 
    capture_lex $P1355
    .const 'Sub' $P1350 = "353_1279589170.0083" 
    capture_lex $P1350
    .const 'Sub' $P1341 = "350_1279589170.0083" 
    capture_lex $P1341
    .const 'Sub' $P1396 = "368_1279589170.0083" 
    capture_lex $P1396
    .return ($P1396)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("350_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .const 'Sub' $P1347 = "352_1279589170.0083" 
    capture_lex $P1347
    .local string rx1342_tgt
    .local int rx1342_pos
    .local int rx1342_off
    .local int rx1342_eos
    .local int rx1342_rep
    .local pmc rx1342_cur
    (rx1342_cur, rx1342_pos, rx1342_tgt, $I10) = self."!cursor_start"()
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
    rx1342_cur."!cursor_debug"("START ", "metachar:sym<:my>")
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
    substr $S10, rx1342_tgt, $I11, 1
    ne $S10, ":", rx1342_fail
    add rx1342_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1342_cur."!cursor_pos"(rx1342_pos)
    .const 'Sub' $P1347 = "352_1279589170.0083" 
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
    substr $S10, rx1342_tgt, $I11, 1
    ne $S10, ";", rx1342_fail
    add rx1342_pos, 1
.annotate 'line', 568
  # rx pass
    rx1342_cur."!cursor_pass"(rx1342_pos, "metachar:sym<:my>")
    rx1342_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1342_pos)
    .return (rx1342_cur)
  rx1342_restart:
.annotate 'line', 567
    rx1342_cur."!cursor_debug"("NEXT ", "metachar:sym<:my>")
  rx1342_fail:
    (rx1342_rep, rx1342_pos, $I10, $P10) = rx1342_cur."!mark_fail"(0)
    lt rx1342_pos, -1, rx1342_done
    eq rx1342_pos, -1, rx1342_fail
    jump $I10
  rx1342_done:
    rx1342_cur."!cursor_fail"()
    rx1342_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1342_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("351_1279589170.0083") :method
.annotate 'line', 567
    new $P1344, "ResizablePMCArray"
    push $P1344, ":"
    .return ($P1344)
.end


.namespace ["NQP";"Regex"]
.sub "_block1346"  :anon :subid("352_1279589170.0083") :method :outer("350_1279589170.0083")
.annotate 'line', 569
    .local string rx1348_tgt
    .local int rx1348_pos
    .local int rx1348_off
    .local int rx1348_eos
    .local int rx1348_rep
    .local pmc rx1348_cur
    (rx1348_cur, rx1348_pos, rx1348_tgt, $I10) = self."!cursor_start"()
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
    rx1348_cur."!cursor_debug"("START ", "")
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
    rx1348_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1348_pos)
    .return (rx1348_cur)
  rx1348_restart:
    rx1348_cur."!cursor_debug"("NEXT ", "")
  rx1348_fail:
    (rx1348_rep, rx1348_pos, $I10, $P10) = rx1348_cur."!mark_fail"(0)
    lt rx1348_pos, -1, rx1348_done
    eq rx1348_pos, -1, rx1348_fail
    jump $I10
  rx1348_done:
    rx1348_cur."!cursor_fail"()
    rx1348_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1348_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("353_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .local string rx1351_tgt
    .local int rx1351_pos
    .local int rx1351_off
    .local int rx1351_eos
    .local int rx1351_rep
    .local pmc rx1351_cur
    (rx1351_cur, rx1351_pos, rx1351_tgt, $I10) = self."!cursor_start"()
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
    rx1351_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
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
    rx1351_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1351_pos)
    .return (rx1351_cur)
  rx1351_restart:
.annotate 'line', 567
    rx1351_cur."!cursor_debug"("NEXT ", "metachar:sym<{ }>")
  rx1351_fail:
    (rx1351_rep, rx1351_pos, $I10, $P10) = rx1351_cur."!mark_fail"(0)
    lt rx1351_pos, -1, rx1351_done
    eq rx1351_pos, -1, rx1351_fail
    jump $I10
  rx1351_done:
    rx1351_cur."!cursor_fail"()
    rx1351_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1351_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("354_1279589170.0083") :method
.annotate 'line', 567
    new $P1353, "ResizablePMCArray"
    push $P1353, "{"
    .return ($P1353)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("355_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .const 'Sub' $P1361 = "357_1279589170.0083" 
    capture_lex $P1361
    .local string rx1356_tgt
    .local int rx1356_pos
    .local int rx1356_off
    .local int rx1356_eos
    .local int rx1356_rep
    .local pmc rx1356_cur
    (rx1356_cur, rx1356_pos, rx1356_tgt, $I10) = self."!cursor_start"()
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
    rx1356_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
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
    .const 'Sub' $P1361 = "357_1279589170.0083" 
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
    rx1356_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1356_pos)
    .return (rx1356_cur)
  rx1356_restart:
.annotate 'line', 567
    rx1356_cur."!cursor_debug"("NEXT ", "metachar:sym<nqpvar>")
  rx1356_fail:
    (rx1356_rep, rx1356_pos, $I10, $P10) = rx1356_cur."!mark_fail"(0)
    lt rx1356_pos, -1, rx1356_done
    eq rx1356_pos, -1, rx1356_fail
    jump $I10
  rx1356_done:
    rx1356_cur."!cursor_fail"()
    rx1356_cur."!cursor_debug"("FAIL  ", "metachar:sym<nqpvar>")
    .return (rx1356_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("356_1279589170.0083") :method
.annotate 'line', 567
    new $P1358, "ResizablePMCArray"
    push $P1358, "$"
    push $P1358, "@"
    .return ($P1358)
.end


.namespace ["NQP";"Regex"]
.sub "_block1360"  :anon :subid("357_1279589170.0083") :method :outer("355_1279589170.0083")
.annotate 'line', 577
    .local string rx1362_tgt
    .local int rx1362_pos
    .local int rx1362_off
    .local int rx1362_eos
    .local int rx1362_rep
    .local pmc rx1362_cur
    (rx1362_cur, rx1362_pos, rx1362_tgt, $I10) = self."!cursor_start"()
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
    rx1362_cur."!cursor_debug"("START ", "")
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
    rx1362_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1362_pos)
    .return (rx1362_cur)
  rx1362_restart:
    rx1362_cur."!cursor_debug"("NEXT ", "")
  rx1362_fail:
    (rx1362_rep, rx1362_pos, $I10, $P10) = rx1362_cur."!mark_fail"(0)
    lt rx1362_pos, -1, rx1362_done
    eq rx1362_pos, -1, rx1362_fail
    jump $I10
  rx1362_done:
    rx1362_cur."!cursor_fail"()
    rx1362_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1362_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("358_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .local string rx1365_tgt
    .local int rx1365_pos
    .local int rx1365_off
    .local int rx1365_eos
    .local int rx1365_rep
    .local pmc rx1365_cur
    (rx1365_cur, rx1365_pos, rx1365_tgt, $I10) = self."!cursor_start"()
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
    rx1365_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
    rx1365_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1365_pos)
    .return (rx1365_cur)
  rx1365_restart:
.annotate 'line', 567
    rx1365_cur."!cursor_debug"("NEXT ", "assertion:sym<{ }>")
  rx1365_fail:
    (rx1365_rep, rx1365_pos, $I10, $P10) = rx1365_cur."!mark_fail"(0)
    lt rx1365_pos, -1, rx1365_done
    eq rx1365_pos, -1, rx1365_fail
    jump $I10
  rx1365_done:
    rx1365_cur."!cursor_fail"()
    rx1365_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1365_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("359_1279589170.0083") :method
.annotate 'line', 567
    new $P1367, "ResizablePMCArray"
    push $P1367, "{"
    .return ($P1367)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("360_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .const 'Sub' $P1375 = "362_1279589170.0083" 
    capture_lex $P1375
    .local string rx1370_tgt
    .local int rx1370_pos
    .local int rx1370_off
    .local int rx1370_eos
    .local int rx1370_rep
    .local pmc rx1370_cur
    (rx1370_cur, rx1370_pos, rx1370_tgt, $I10) = self."!cursor_start"()
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
    rx1370_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
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
    .const 'Sub' $P1375 = "362_1279589170.0083" 
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
    rx1370_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1370_pos)
    .return (rx1370_cur)
  rx1370_restart:
.annotate 'line', 567
    rx1370_cur."!cursor_debug"("NEXT ", "assertion:sym<?{ }>")
  rx1370_fail:
    (rx1370_rep, rx1370_pos, $I10, $P10) = rx1370_cur."!mark_fail"(0)
    lt rx1370_pos, -1, rx1370_done
    eq rx1370_pos, -1, rx1370_fail
    jump $I10
  rx1370_done:
    rx1370_cur."!cursor_fail"()
    rx1370_cur."!cursor_debug"("FAIL  ", "assertion:sym<?{ }>")
    .return (rx1370_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("361_1279589170.0083") :method
.annotate 'line', 567
    new $P1372, "ResizablePMCArray"
    push $P1372, "!"
    push $P1372, "?"
    .return ($P1372)
.end


.namespace ["NQP";"Regex"]
.sub "_block1374"  :anon :subid("362_1279589170.0083") :method :outer("360_1279589170.0083")
.annotate 'line', 585
    .local string rx1376_tgt
    .local int rx1376_pos
    .local int rx1376_off
    .local int rx1376_eos
    .local int rx1376_rep
    .local pmc rx1376_cur
    (rx1376_cur, rx1376_pos, rx1376_tgt, $I10) = self."!cursor_start"()
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
    rx1376_cur."!cursor_debug"("START ", "")
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
    substr $S10, rx1376_tgt, $I11, 1
    ne $S10, "{", rx1376_fail
    add rx1376_pos, 1
  # rx pass
    rx1376_cur."!cursor_pass"(rx1376_pos, "")
    rx1376_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1376_pos)
    .return (rx1376_cur)
  rx1376_restart:
    rx1376_cur."!cursor_debug"("NEXT ", "")
  rx1376_fail:
    (rx1376_rep, rx1376_pos, $I10, $P10) = rx1376_cur."!mark_fail"(0)
    lt rx1376_pos, -1, rx1376_done
    eq rx1376_pos, -1, rx1376_fail
    jump $I10
  rx1376_done:
    rx1376_cur."!cursor_fail"()
    rx1376_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1376_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("363_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .const 'Sub' $P1388 = "365_1279589170.0083" 
    capture_lex $P1388
    .local string rx1380_tgt
    .local int rx1380_pos
    .local int rx1380_off
    .local int rx1380_eos
    .local int rx1380_rep
    .local pmc rx1380_cur
    (rx1380_cur, rx1380_pos, rx1380_tgt, $I10) = self."!cursor_start"()
    rx1380_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
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
    rx1380_cur."!cursor_debug"("START ", "assertion:sym<name>")
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
    .const 'Sub' $P1388 = "365_1279589170.0083" 
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
    substr $S10, rx1380_tgt, $I11, 1
    ne $S10, "=", rx1380_fail
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
    substr $S10, rx1380_tgt, $I11, 1
    ne $S10, ":", rx1380_fail
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
    substr $S10, rx1380_tgt, $I11, 1
    ne $S10, "(", rx1380_fail
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
    substr $S10, rx1380_tgt, $I11, 1
    ne $S10, ")", rx1380_fail
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
    rx1380_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1380_pos)
    .return (rx1380_cur)
  rx1380_restart:
.annotate 'line', 567
    rx1380_cur."!cursor_debug"("NEXT ", "assertion:sym<name>")
  rx1380_fail:
    (rx1380_rep, rx1380_pos, $I10, $P10) = rx1380_cur."!mark_fail"(0)
    lt rx1380_pos, -1, rx1380_done
    eq rx1380_pos, -1, rx1380_fail
    jump $I10
  rx1380_done:
    rx1380_cur."!cursor_fail"()
    rx1380_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1380_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("364_1279589170.0083") :method
.annotate 'line', 567
    $P1382 = self."!PREFIX__!subrule"("identifier", "")
    new $P1383, "ResizablePMCArray"
    push $P1383, $P1382
    .return ($P1383)
.end


.namespace ["NQP";"Regex"]
.sub "_block1387"  :anon :subid("365_1279589170.0083") :method :outer("363_1279589170.0083")
.annotate 'line', 591
    .local string rx1389_tgt
    .local int rx1389_pos
    .local int rx1389_off
    .local int rx1389_eos
    .local int rx1389_rep
    .local pmc rx1389_cur
    (rx1389_cur, rx1389_pos, rx1389_tgt, $I10) = self."!cursor_start"()
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
    rx1389_cur."!cursor_debug"("START ", "")
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
    substr $S10, rx1389_tgt, $I11, 1
    ne $S10, ">", rx1389_fail
    add rx1389_pos, 1
  # rx pass
    rx1389_cur."!cursor_pass"(rx1389_pos, "")
    rx1389_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1389_pos)
    .return (rx1389_cur)
  rx1389_restart:
    rx1389_cur."!cursor_debug"("NEXT ", "")
  rx1389_fail:
    (rx1389_rep, rx1389_pos, $I10, $P10) = rx1389_cur."!mark_fail"(0)
    lt rx1389_pos, -1, rx1389_done
    eq rx1389_pos, -1, rx1389_fail
    jump $I10
  rx1389_done:
    rx1389_cur."!cursor_fail"()
    rx1389_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1389_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("366_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .local string rx1392_tgt
    .local int rx1392_pos
    .local int rx1392_off
    .local int rx1392_eos
    .local int rx1392_rep
    .local pmc rx1392_cur
    (rx1392_cur, rx1392_pos, rx1392_tgt, $I10) = self."!cursor_start"()
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
    rx1392_cur."!cursor_debug"("START ", "assertion:sym<var>")
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
    rx1392_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1392_pos)
    .return (rx1392_cur)
  rx1392_restart:
.annotate 'line', 567
    rx1392_cur."!cursor_debug"("NEXT ", "assertion:sym<var>")
  rx1392_fail:
    (rx1392_rep, rx1392_pos, $I10, $P10) = rx1392_cur."!mark_fail"(0)
    lt rx1392_pos, -1, rx1392_done
    eq rx1392_pos, -1, rx1392_fail
    jump $I10
  rx1392_done:
    rx1392_cur."!cursor_fail"()
    rx1392_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1392_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("367_1279589170.0083") :method
.annotate 'line', 567
    new $P1394, "ResizablePMCArray"
    push $P1394, "$"
    push $P1394, "@"
    .return ($P1394)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("368_1279589170.0083") :method :outer("349_1279589170.0083")
.annotate 'line', 567
    .local string rx1397_tgt
    .local int rx1397_pos
    .local int rx1397_off
    .local int rx1397_eos
    .local int rx1397_rep
    .local pmc rx1397_cur
    (rx1397_cur, rx1397_pos, rx1397_tgt, $I10) = self."!cursor_start"()
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
    rx1397_cur."!cursor_debug"("START ", "codeblock")
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
    rx1397_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1397_pos)
    .return (rx1397_cur)
  rx1397_restart:
.annotate 'line', 567
    rx1397_cur."!cursor_debug"("NEXT ", "codeblock")
  rx1397_fail:
    (rx1397_rep, rx1397_pos, $I10, $P10) = rx1397_cur."!mark_fail"(0)
    lt rx1397_pos, -1, rx1397_done
    eq rx1397_pos, -1, rx1397_fail
    jump $I10
  rx1397_done:
    rx1397_cur."!cursor_fail"()
    rx1397_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1397_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("369_1279589170.0083") :method
.annotate 'line', 567
    $P1399 = self."!PREFIX__!subrule"("LANG", "")
    new $P1400, "ResizablePMCArray"
    push $P1400, $P1399
    .return ($P1400)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1403" :load :anon :subid("370_1279589170.0083")
.annotate 'line', 4
    .const 'Sub' $P1405 = "11_1279589170.0083" 
    $P1406 = $P1405()
    .return ($P1406)
.end


.namespace []
.sub "_block1424" :load :anon :subid("371_1279589170.0083")
.annotate 'line', 1
    .const 'Sub' $P1426 = "10_1279589170.0083" 
    $P1427 = $P1426()
    .return ($P1427)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1279589176.27948")
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
    $P2447 = $P14()
.annotate 'line', 1
    .return ($P2447)
    .const 'Sub' $P2449 = "143_1279589176.27948" 
    .return ($P2449)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1279589176.27948")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1279589176.27948" 
    .local pmc block
    set block, $P12
    $P2452 = get_root_global ["parrot"], "P6metaclass"
    $P2452."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1279589176.27948") :outer("10_1279589176.27948")
.annotate 'line', 3
    .const 'Sub' $P2443 = "142_1279589176.27948" 
    capture_lex $P2443
    get_hll_global $P2326, ["NQP";"RegexActions"], "_block2325" 
    capture_lex $P2326
    .const 'Sub' $P2315 = "132_1279589176.27948" 
    capture_lex $P2315
    .const 'Sub' $P2308 = "131_1279589176.27948" 
    capture_lex $P2308
    .const 'Sub' $P2301 = "130_1279589176.27948" 
    capture_lex $P2301
    .const 'Sub' $P2294 = "129_1279589176.27948" 
    capture_lex $P2294
    .const 'Sub' $P2281 = "128_1279589176.27948" 
    capture_lex $P2281
    .const 'Sub' $P2271 = "127_1279589176.27948" 
    capture_lex $P2271
    .const 'Sub' $P2261 = "126_1279589176.27948" 
    capture_lex $P2261
    .const 'Sub' $P2251 = "125_1279589176.27948" 
    capture_lex $P2251
    .const 'Sub' $P2244 = "124_1279589176.27948" 
    capture_lex $P2244
    .const 'Sub' $P2230 = "123_1279589176.27948" 
    capture_lex $P2230
    .const 'Sub' $P2220 = "122_1279589176.27948" 
    capture_lex $P2220
    .const 'Sub' $P2183 = "121_1279589176.27948" 
    capture_lex $P2183
    .const 'Sub' $P2169 = "120_1279589176.27948" 
    capture_lex $P2169
    .const 'Sub' $P2159 = "119_1279589176.27948" 
    capture_lex $P2159
    .const 'Sub' $P2149 = "118_1279589176.27948" 
    capture_lex $P2149
    .const 'Sub' $P2139 = "117_1279589176.27948" 
    capture_lex $P2139
    .const 'Sub' $P2129 = "116_1279589176.27948" 
    capture_lex $P2129
    .const 'Sub' $P2119 = "115_1279589176.27948" 
    capture_lex $P2119
    .const 'Sub' $P2091 = "114_1279589176.27948" 
    capture_lex $P2091
    .const 'Sub' $P2074 = "113_1279589176.27948" 
    capture_lex $P2074
    .const 'Sub' $P2064 = "112_1279589176.27948" 
    capture_lex $P2064
    .const 'Sub' $P2051 = "111_1279589176.27948" 
    capture_lex $P2051
    .const 'Sub' $P2038 = "110_1279589176.27948" 
    capture_lex $P2038
    .const 'Sub' $P2025 = "109_1279589176.27948" 
    capture_lex $P2025
    .const 'Sub' $P2015 = "108_1279589176.27948" 
    capture_lex $P2015
    .const 'Sub' $P1986 = "107_1279589176.27948" 
    capture_lex $P1986
    .const 'Sub' $P1962 = "106_1279589176.27948" 
    capture_lex $P1962
    .const 'Sub' $P1952 = "105_1279589176.27948" 
    capture_lex $P1952
    .const 'Sub' $P1942 = "104_1279589176.27948" 
    capture_lex $P1942
    .const 'Sub' $P1915 = "103_1279589176.27948" 
    capture_lex $P1915
    .const 'Sub' $P1897 = "102_1279589176.27948" 
    capture_lex $P1897
    .const 'Sub' $P1887 = "101_1279589176.27948" 
    capture_lex $P1887
    .const 'Sub' $P1783 = "98_1279589176.27948" 
    capture_lex $P1783
    .const 'Sub' $P1773 = "97_1279589176.27948" 
    capture_lex $P1773
    .const 'Sub' $P1744 = "96_1279589176.27948" 
    capture_lex $P1744
    .const 'Sub' $P1702 = "95_1279589176.27948" 
    capture_lex $P1702
    .const 'Sub' $P1686 = "94_1279589176.27948" 
    capture_lex $P1686
    .const 'Sub' $P1677 = "93_1279589176.27948" 
    capture_lex $P1677
    .const 'Sub' $P1645 = "92_1279589176.27948" 
    capture_lex $P1645
    .const 'Sub' $P1546 = "89_1279589176.27948" 
    capture_lex $P1546
    .const 'Sub' $P1529 = "88_1279589176.27948" 
    capture_lex $P1529
    .const 'Sub' $P1509 = "87_1279589176.27948" 
    capture_lex $P1509
    .const 'Sub' $P1397 = "84_1279589176.27948" 
    capture_lex $P1397
    .const 'Sub' $P1340 = "80_1279589176.27948" 
    capture_lex $P1340
    .const 'Sub' $P1300 = "78_1279589176.27948" 
    capture_lex $P1300
    .const 'Sub' $P1250 = "76_1279589176.27948" 
    capture_lex $P1250
    .const 'Sub' $P1240 = "75_1279589176.27948" 
    capture_lex $P1240
    .const 'Sub' $P1230 = "74_1279589176.27948" 
    capture_lex $P1230
    .const 'Sub' $P1159 = "72_1279589176.27948" 
    capture_lex $P1159
    .const 'Sub' $P1149 = "71_1279589176.27948" 
    capture_lex $P1149
    .const 'Sub' $P1132 = "70_1279589176.27948" 
    capture_lex $P1132
    .const 'Sub' $P1115 = "69_1279589176.27948" 
    capture_lex $P1115
    .const 'Sub' $P1098 = "68_1279589176.27948" 
    capture_lex $P1098
    .const 'Sub' $P1088 = "67_1279589176.27948" 
    capture_lex $P1088
    .const 'Sub' $P1078 = "66_1279589176.27948" 
    capture_lex $P1078
    .const 'Sub' $P1068 = "65_1279589176.27948" 
    capture_lex $P1068
    .const 'Sub' $P1044 = "64_1279589176.27948" 
    capture_lex $P1044
    .const 'Sub' $P991 = "63_1279589176.27948" 
    capture_lex $P991
    .const 'Sub' $P981 = "62_1279589176.27948" 
    capture_lex $P981
    .const 'Sub' $P892 = "60_1279589176.27948" 
    capture_lex $P892
    .const 'Sub' $P866 = "59_1279589176.27948" 
    capture_lex $P866
    .const 'Sub' $P850 = "58_1279589176.27948" 
    capture_lex $P850
    .const 'Sub' $P840 = "57_1279589176.27948" 
    capture_lex $P840
    .const 'Sub' $P830 = "56_1279589176.27948" 
    capture_lex $P830
    .const 'Sub' $P820 = "55_1279589176.27948" 
    capture_lex $P820
    .const 'Sub' $P810 = "54_1279589176.27948" 
    capture_lex $P810
    .const 'Sub' $P800 = "53_1279589176.27948" 
    capture_lex $P800
    .const 'Sub' $P790 = "52_1279589176.27948" 
    capture_lex $P790
    .const 'Sub' $P780 = "51_1279589176.27948" 
    capture_lex $P780
    .const 'Sub' $P770 = "50_1279589176.27948" 
    capture_lex $P770
    .const 'Sub' $P760 = "49_1279589176.27948" 
    capture_lex $P760
    .const 'Sub' $P750 = "48_1279589176.27948" 
    capture_lex $P750
    .const 'Sub' $P740 = "47_1279589176.27948" 
    capture_lex $P740
    .const 'Sub' $P730 = "46_1279589176.27948" 
    capture_lex $P730
    .const 'Sub' $P720 = "45_1279589176.27948" 
    capture_lex $P720
    .const 'Sub' $P702 = "44_1279589176.27948" 
    capture_lex $P702
    .const 'Sub' $P667 = "43_1279589176.27948" 
    capture_lex $P667
    .const 'Sub' $P651 = "42_1279589176.27948" 
    capture_lex $P651
    .const 'Sub' $P630 = "41_1279589176.27948" 
    capture_lex $P630
    .const 'Sub' $P610 = "40_1279589176.27948" 
    capture_lex $P610
    .const 'Sub' $P597 = "39_1279589176.27948" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1279589176.27948" 
    capture_lex $P571
    .const 'Sub' $P535 = "37_1279589176.27948" 
    capture_lex $P535
    .const 'Sub' $P518 = "36_1279589176.27948" 
    capture_lex $P518
    .const 'Sub' $P504 = "35_1279589176.27948" 
    capture_lex $P504
    .const 'Sub' $P451 = "33_1279589176.27948" 
    capture_lex $P451
    .const 'Sub' $P440 = "32_1279589176.27948" 
    capture_lex $P440
    .const 'Sub' $P427 = "31_1279589176.27948" 
    capture_lex $P427
    .const 'Sub' $P407 = "30_1279589176.27948" 
    capture_lex $P407
    .const 'Sub' $P397 = "29_1279589176.27948" 
    capture_lex $P397
    .const 'Sub' $P387 = "28_1279589176.27948" 
    capture_lex $P387
    .const 'Sub' $P371 = "27_1279589176.27948" 
    capture_lex $P371
    .const 'Sub' $P288 = "25_1279589176.27948" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1279589176.27948" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1279589176.27948" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1279589176.27948" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1279589176.27948" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1279589176.27948" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1279589176.27948" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1279589176.27948" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1279589176.27948" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1279589176.27948" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1279589176.27948" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1279589176.27948" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1279589176.27948" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1279589176.27948" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1279589176.27948" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 223
    .const 'Sub' $P100 = "18_1279589176.27948" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 832
    .const 'Sub' $P151 = "19_1279589176.27948" 
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
.annotate 'line', 823
    find_lex $P2293, "control"
.annotate 'line', 850
    get_hll_global $P2326, ["NQP";"RegexActions"], "_block2325" 
    capture_lex $P2326
    $P2437 = $P2326()
.annotate 'line', 3
    .return ($P2437)
    .const 'Sub' $P2439 = "141_1279589176.27948" 
    .return ($P2439)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1279589176.27948")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2443 = "142_1279589176.27948" 
    capture_lex $P2443
    $P2443()
    $P2446 = get_root_global ["parrot"], "P6metaclass"
    $P2446."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2442"  :anon :subid("142_1279589176.27948") :outer("11_1279589176.27948")
.annotate 'line', 6
    get_global $P2444, "@BLOCK"
    unless_null $P2444, vivify_146
    $P2444 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2444
  vivify_146:
 $P2445 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2445
.annotate 'line', 5
    .return ($P2445)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1279589176.27948") :outer("11_1279589176.27948")
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
.sub "block_immediate"  :subid("13_1279589176.27948") :outer("11_1279589176.27948")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1279589176.27948" 
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
    .const 'Sub' $P40 = "14_1279589176.27948" 
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
.sub "_block39"  :anon :subid("14_1279589176.27948") :outer("13_1279589176.27948")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1279589176.27948" 
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
    .const 'Sub' $P51 = "15_1279589176.27948" 
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
.sub "_block50"  :anon :subid("15_1279589176.27948") :outer("14_1279589176.27948")
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
.sub "vivitype"  :subid("16_1279589176.27948") :outer("11_1279589176.27948")
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
.sub "colonpair_str"  :subid("17_1279589176.27948") :outer("11_1279589176.27948")
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
.sub "push_block_handler"  :subid("18_1279589176.27948") :outer("11_1279589176.27948")
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
.sub "control"  :subid("19_1279589176.27948") :outer("11_1279589176.27948")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 832
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(.CONTROL_RETURN)
    push_eh $P153
    .lex "$/", param_154
    .lex "$type", param_155
.annotate 'line', 833
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 837
    get_hll_global $P159, ["PAST"], "Val"
    find_lex $P160, "$type"
    $P161 = $P159."new"($P160 :named("value"), "!except_types" :named("returns"))
    $P162 = $P157."new"(0, $P161, $P158 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 833
    $P163 = $P156."!make"($P162)
.annotate 'line', 832
    .return ($P163)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "deflongname"  :subid("21_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "comp_unit"  :subid("22_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statementlist"  :subid("23_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1279589176.27948" 
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
    .const 'Sub' $P262 = "24_1279589176.27948" 
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
.sub "_block261"  :anon :subid("24_1279589176.27948") :outer("23_1279589176.27948")
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
.sub "statement"  :subid("25_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1279589176.27948" 
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
    .const 'Sub' $P300 = "26_1279589176.27948" 
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
.sub "_block299"  :anon :subid("26_1279589176.27948") :outer("25_1279589176.27948")
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
.sub "xblock"  :subid("27_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "pblock"  :subid("28_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "block"  :subid("29_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "blockoid"  :subid("30_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "newpad"  :subid("31_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "outerctx"  :subid("32_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<if>"  :subid("33_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_454
.annotate 'line', 150
    .const 'Sub' $P482 = "34_1279589176.27948" 
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
    .const 'Sub' $P482 = "34_1279589176.27948" 
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
.sub "_block481"  :anon :subid("34_1279589176.27948") :outer("33_1279589176.27948")
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
.sub "statement_control:sym<unless>"  :subid("35_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<while>"  :subid("36_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<repeat>"  :subid("37_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<for>"  :subid("38_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<return>"  :subid("39_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<CATCH>"  :subid("40_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_prefix:sym<try>"  :subid("43_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "blorst"  :subid("44_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<fatarrow>"  :subid("49_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<colonpair>"  :subid("50_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<variable>"  :subid("51_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<package_declarator>"  :subid("52_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<scope_declarator>"  :subid("53_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<routine_declarator>"  :subid("54_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<regex_declarator>"  :subid("55_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<statement_prefix>"  :subid("56_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "term:sym<lambda>"  :subid("57_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "fatarrow"  :subid("58_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "colonpair"  :subid("59_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "variable"  :subid("60_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_895
.annotate 'line', 328
    .const 'Sub' $P908 = "61_1279589176.27948" 
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
    .const 'Sub' $P908 = "61_1279589176.27948" 
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
.sub "_block907"  :anon :subid("61_1279589176.27948") :outer("60_1279589176.27948")
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
.sub "package_declarator:sym<module>"  :subid("62_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "package_declarator:sym<class>"  :subid("63_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "package_def"  :subid("64_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "scope_declarator:sym<my>"  :subid("65_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "scope_declarator:sym<our>"  :subid("66_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "scope_declarator:sym<has>"  :subid("67_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "scoped"  :subid("68_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "declarator"  :subid("69_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "multi_declarator:sym<multi>"  :subid("70_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "multi_declarator:sym<null>"  :subid("71_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "variable_declarator"  :subid("72_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1162
.annotate 'line', 417
    .const 'Sub' $P1202 = "73_1279589176.27948" 
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
    .const 'Sub' $P1202 = "73_1279589176.27948" 
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
.sub "_block1201"  :anon :subid("73_1279589176.27948") :outer("72_1279589176.27948")
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
.sub "routine_declarator:sym<sub>"  :subid("74_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "routine_declarator:sym<method>"  :subid("75_1279589176.27948") :method :outer("11_1279589176.27948")
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
.sub "routine_def"  :subid("76_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1253
.annotate 'line', 448
    .const 'Sub' $P1264 = "77_1279589176.27948" 
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
    .const 'Sub' $P1264 = "77_1279589176.27948" 
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
.sub "_block1263"  :anon :subid("77_1279589176.27948") :outer("76_1279589176.27948")
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
.sub "method_def"  :subid("78_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1303
.annotate 'line', 466
    .const 'Sub' $P1319 = "79_1279589176.27948" 
    capture_lex $P1319
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
    find_lex $P1309, "$past"
    $P1309."control"("return_pir")
.annotate 'line', 470
    find_lex $P1310, "$past"
    unless_null $P1310, vivify_439
    $P1310 = root_new ['parrot';'ResizablePMCArray']
  vivify_439:
    set $P1311, $P1310[0]
    unless_null $P1311, vivify_440
    new $P1311, "Undef"
  vivify_440:
    get_hll_global $P1312, ["PAST"], "Op"
    $P1313 = $P1312."new"("    .lex \"self\", self" :named("inline"))
    $P1311."unshift"($P1313)
.annotate 'line', 471
    find_lex $P1314, "$past"
    $P1314."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 472
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_441
    $P1316 = root_new ['parrot';'Hash']
  vivify_441:
    set $P1317, $P1316["deflongname"]
    unless_null $P1317, vivify_442
    new $P1317, "Undef"
  vivify_442:
    unless $P1317, if_1315_end
    .const 'Sub' $P1319 = "79_1279589176.27948" 
    capture_lex $P1319
    $P1319()
  if_1315_end:
.annotate 'line', 476
    find_dynamic_lex $P1331, "$*MULTINESS"
    unless_null $P1331, vivify_446
    get_hll_global $P1331, "$MULTINESS"
    unless_null $P1331, vivify_447
    die "Contextual $*MULTINESS not found"
  vivify_447:
  vivify_446:
    set $S1332, $P1331
    iseq $I1333, $S1332, "multi"
    unless $I1333, if_1330_end
    find_lex $P1334, "$past"
    $P1335 = $P1334."multi"()
    $P1335."unshift"("_")
  if_1330_end:
.annotate 'line', 477
    find_lex $P1336, "$/"
    find_lex $P1337, "$past"
    $P1338 = $P1336."!make"($P1337)
.annotate 'line', 466
    .return ($P1338)
  control_1301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1339, exception, "payload"
    .return ($P1339)
.end


.namespace ["NQP";"Actions"]
.sub "_block1318"  :anon :subid("79_1279589176.27948") :outer("78_1279589176.27948")
.annotate 'line', 473
    new $P1320, "Undef"
    .lex "$name", $P1320
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_443
    $P1321 = root_new ['parrot';'Hash']
  vivify_443:
    set $P1322, $P1321["deflongname"]
    unless_null $P1322, vivify_444
    $P1322 = root_new ['parrot';'ResizablePMCArray']
  vivify_444:
    set $P1323, $P1322[0]
    unless_null $P1323, vivify_445
    new $P1323, "Undef"
  vivify_445:
    $P1324 = $P1323."ast"()
    set $S1325, $P1324
    new $P1326, 'String'
    set $P1326, $S1325
    store_lex "$name", $P1326
.annotate 'line', 474
    find_lex $P1327, "$past"
    find_lex $P1328, "$name"
    $P1329 = $P1327."name"($P1328)
.annotate 'line', 472
    .return ($P1329)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("80_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1343
.annotate 'line', 481
    .const 'Sub' $P1369 = "82_1279589176.27948" 
    capture_lex $P1369
    .const 'Sub' $P1354 = "81_1279589176.27948" 
    capture_lex $P1354
    new $P1342, 'ExceptionHandler'
    set_addr $P1342, control_1341
    $P1342."handle_types"(.CONTROL_RETURN)
    push_eh $P1342
    .lex "self", self
    .lex "$/", param_1343
.annotate 'line', 482
    new $P1344, "Undef"
    .lex "$BLOCKINIT", $P1344
    get_global $P1345, "@BLOCK"
    unless_null $P1345, vivify_448
    $P1345 = root_new ['parrot';'ResizablePMCArray']
  vivify_448:
    set $P1346, $P1345[0]
    unless_null $P1346, vivify_449
    $P1346 = root_new ['parrot';'ResizablePMCArray']
  vivify_449:
    set $P1347, $P1346[0]
    unless_null $P1347, vivify_450
    new $P1347, "Undef"
  vivify_450:
    store_lex "$BLOCKINIT", $P1347
.annotate 'line', 484
    find_lex $P1349, "$/"
    unless_null $P1349, vivify_451
    $P1349 = root_new ['parrot';'Hash']
  vivify_451:
    set $P1350, $P1349["parameter"]
    unless_null $P1350, vivify_452
    new $P1350, "Undef"
  vivify_452:
    defined $I1351, $P1350
    unless $I1351, for_undef_453
    iter $P1348, $P1350
    new $P1361, 'ExceptionHandler'
    set_addr $P1361, loop1360_handler
    $P1361."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1361
  loop1360_test:
    unless $P1348, loop1360_done
    shift $P1352, $P1348
  loop1360_redo:
    .const 'Sub' $P1354 = "81_1279589176.27948" 
    capture_lex $P1354
    $P1354($P1352)
  loop1360_next:
    goto loop1360_test
  loop1360_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1362, exception, 'type'
    eq $P1362, .CONTROL_LOOP_NEXT, loop1360_next
    eq $P1362, .CONTROL_LOOP_REDO, loop1360_redo
  loop1360_done:
    pop_eh 
  for_undef_453:
.annotate 'line', 487
    find_dynamic_lex $P1365, "$*MULTINESS"
    unless_null $P1365, vivify_454
    get_hll_global $P1365, "$MULTINESS"
    unless_null $P1365, vivify_455
    die "Contextual $*MULTINESS not found"
  vivify_455:
  vivify_454:
    set $S1366, $P1365
    iseq $I1367, $S1366, "multi"
    if $I1367, if_1364
    new $P1363, 'Integer'
    set $P1363, $I1367
    goto if_1364_end
  if_1364:
    .const 'Sub' $P1369 = "82_1279589176.27948" 
    capture_lex $P1369
    $P1395 = $P1369()
    set $P1363, $P1395
  if_1364_end:
.annotate 'line', 481
    .return ($P1363)
  control_1341:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1396, exception, "payload"
    .return ($P1396)
.end


.namespace ["NQP";"Actions"]
.sub "_block1353"  :anon :subid("81_1279589176.27948") :outer("80_1279589176.27948")
    .param pmc param_1355
.annotate 'line', 484
    .lex "$_", param_1355
    find_lex $P1356, "$BLOCKINIT"
    find_lex $P1357, "$_"
    $P1358 = $P1357."ast"()
    $P1359 = $P1356."push"($P1358)
    .return ($P1359)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1368"  :anon :subid("82_1279589176.27948") :outer("80_1279589176.27948")
.annotate 'line', 487
    .const 'Sub' $P1378 = "83_1279589176.27948" 
    capture_lex $P1378
.annotate 'line', 488
    $P1370 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1370
.annotate 'line', 487
    find_lex $P1371, "@params"
.annotate 'line', 489
    find_lex $P1373, "$BLOCKINIT"
    $P1374 = $P1373."list"()
    defined $I1375, $P1374
    unless $I1375, for_undef_456
    iter $P1372, $P1374
    new $P1389, 'ExceptionHandler'
    set_addr $P1389, loop1388_handler
    $P1389."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1389
  loop1388_test:
    unless $P1372, loop1388_done
    shift $P1376, $P1372
  loop1388_redo:
    .const 'Sub' $P1378 = "83_1279589176.27948" 
    capture_lex $P1378
    $P1378($P1376)
  loop1388_next:
    goto loop1388_test
  loop1388_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1390, exception, 'type'
    eq $P1390, .CONTROL_LOOP_NEXT, loop1388_next
    eq $P1390, .CONTROL_LOOP_REDO, loop1388_redo
  loop1388_done:
    pop_eh 
  for_undef_456:
.annotate 'line', 492
    get_global $P1391, "@BLOCK"
    unless_null $P1391, vivify_457
    $P1391 = root_new ['parrot';'ResizablePMCArray']
  vivify_457:
    set $P1392, $P1391[0]
    unless_null $P1392, vivify_458
    new $P1392, "Undef"
  vivify_458:
    find_lex $P1393, "@params"
    $P1394 = $P1392."multi"($P1393)
.annotate 'line', 487
    .return ($P1394)
.end


.namespace ["NQP";"Actions"]
.sub "_block1377"  :anon :subid("83_1279589176.27948") :outer("82_1279589176.27948")
    .param pmc param_1379
.annotate 'line', 489
    .lex "$_", param_1379
.annotate 'line', 490
    find_lex $P1380, "@params"
    find_lex $P1382, "$_"
    $P1383 = $P1382."multitype"()
    set $P1381, $P1383
    defined $I1385, $P1381
    if $I1385, default_1384
    new $P1386, "String"
    assign $P1386, "_"
    set $P1381, $P1386
  default_1384:
    $P1387 = $P1380."push"($P1381)
.annotate 'line', 489
    .return ($P1387)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("84_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1400
.annotate 'line', 496
    .const 'Sub' $P1481 = "85_1279589176.27948" 
    capture_lex $P1481
    new $P1399, 'ExceptionHandler'
    set_addr $P1399, control_1398
    $P1399."handle_types"(.CONTROL_RETURN)
    push_eh $P1399
    .lex "self", self
    .lex "$/", param_1400
.annotate 'line', 497
    new $P1401, "Undef"
    .lex "$quant", $P1401
.annotate 'line', 498
    new $P1402, "Undef"
    .lex "$past", $P1402
.annotate 'line', 497
    find_lex $P1403, "$/"
    unless_null $P1403, vivify_459
    $P1403 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1404, $P1403["quant"]
    unless_null $P1404, vivify_460
    new $P1404, "Undef"
  vivify_460:
    store_lex "$quant", $P1404
    find_lex $P1405, "$past"
.annotate 'line', 499
    find_lex $P1407, "$/"
    unless_null $P1407, vivify_461
    $P1407 = root_new ['parrot';'Hash']
  vivify_461:
    set $P1408, $P1407["named_param"]
    unless_null $P1408, vivify_462
    new $P1408, "Undef"
  vivify_462:
    if $P1408, if_1406
.annotate 'line', 506
    find_lex $P1422, "$/"
    unless_null $P1422, vivify_463
    $P1422 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1423, $P1422["param_var"]
    unless_null $P1423, vivify_464
    new $P1423, "Undef"
  vivify_464:
    $P1424 = $P1423."ast"()
    store_lex "$past", $P1424
.annotate 'line', 507
    find_lex $P1426, "$quant"
    set $S1427, $P1426
    iseq $I1428, $S1427, "*"
    if $I1428, if_1425
.annotate 'line', 511
    find_lex $P1437, "$quant"
    set $S1438, $P1437
    iseq $I1439, $S1438, "?"
    unless $I1439, if_1436_end
.annotate 'line', 512
    find_lex $P1440, "$past"
    find_lex $P1441, "$/"
    unless_null $P1441, vivify_465
    $P1441 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1442, $P1441["param_var"]
    unless_null $P1442, vivify_466
    $P1442 = root_new ['parrot';'Hash']
  vivify_466:
    set $P1443, $P1442["sigil"]
    unless_null $P1443, vivify_467
    new $P1443, "Undef"
  vivify_467:
    $P1444 = "vivitype"($P1443)
    $P1440."viviself"($P1444)
  if_1436_end:
.annotate 'line', 511
    goto if_1425_end
  if_1425:
.annotate 'line', 508
    find_lex $P1429, "$past"
    $P1429."slurpy"(1)
.annotate 'line', 509
    find_lex $P1430, "$past"
    find_lex $P1431, "$/"
    unless_null $P1431, vivify_468
    $P1431 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1432, $P1431["param_var"]
    unless_null $P1432, vivify_469
    $P1432 = root_new ['parrot';'Hash']
  vivify_469:
    set $P1433, $P1432["sigil"]
    unless_null $P1433, vivify_470
    new $P1433, "Undef"
  vivify_470:
    set $S1434, $P1433
    iseq $I1435, $S1434, "%"
    $P1430."named"($I1435)
  if_1425_end:
.annotate 'line', 505
    goto if_1406_end
  if_1406:
.annotate 'line', 500
    find_lex $P1409, "$/"
    unless_null $P1409, vivify_471
    $P1409 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1410, $P1409["named_param"]
    unless_null $P1410, vivify_472
    new $P1410, "Undef"
  vivify_472:
    $P1411 = $P1410."ast"()
    store_lex "$past", $P1411
.annotate 'line', 501
    find_lex $P1413, "$quant"
    set $S1414, $P1413
    isne $I1415, $S1414, "!"
    unless $I1415, if_1412_end
.annotate 'line', 502
    find_lex $P1416, "$past"
    find_lex $P1417, "$/"
    unless_null $P1417, vivify_473
    $P1417 = root_new ['parrot';'Hash']
  vivify_473:
    set $P1418, $P1417["named_param"]
    unless_null $P1418, vivify_474
    $P1418 = root_new ['parrot';'Hash']
  vivify_474:
    set $P1419, $P1418["param_var"]
    unless_null $P1419, vivify_475
    $P1419 = root_new ['parrot';'Hash']
  vivify_475:
    set $P1420, $P1419["sigil"]
    unless_null $P1420, vivify_476
    new $P1420, "Undef"
  vivify_476:
    $P1421 = "vivitype"($P1420)
    $P1416."viviself"($P1421)
  if_1412_end:
  if_1406_end:
.annotate 'line', 515
    find_lex $P1446, "$/"
    unless_null $P1446, vivify_477
    $P1446 = root_new ['parrot';'Hash']
  vivify_477:
    set $P1447, $P1446["default_value"]
    unless_null $P1447, vivify_478
    new $P1447, "Undef"
  vivify_478:
    unless $P1447, if_1445_end
.annotate 'line', 516
    find_lex $P1449, "$quant"
    set $S1450, $P1449
    iseq $I1451, $S1450, "*"
    unless $I1451, if_1448_end
.annotate 'line', 517
    find_lex $P1452, "$/"
    $P1453 = $P1452."CURSOR"()
    $P1453."panic"("Can't put default on slurpy parameter")
  if_1448_end:
.annotate 'line', 519
    find_lex $P1455, "$quant"
    set $S1456, $P1455
    iseq $I1457, $S1456, "!"
    unless $I1457, if_1454_end
.annotate 'line', 520
    find_lex $P1458, "$/"
    $P1459 = $P1458."CURSOR"()
    $P1459."panic"("Can't put default on required parameter")
  if_1454_end:
.annotate 'line', 522
    find_lex $P1460, "$past"
    find_lex $P1461, "$/"
    unless_null $P1461, vivify_479
    $P1461 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1462, $P1461["default_value"]
    unless_null $P1462, vivify_480
    $P1462 = root_new ['parrot';'ResizablePMCArray']
  vivify_480:
    set $P1463, $P1462[0]
    unless_null $P1463, vivify_481
    $P1463 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1464, $P1463["EXPR"]
    unless_null $P1464, vivify_482
    new $P1464, "Undef"
  vivify_482:
    $P1465 = $P1464."ast"()
    $P1460."viviself"($P1465)
  if_1445_end:
.annotate 'line', 524
    find_lex $P1467, "$past"
    $P1468 = $P1467."viviself"()
    if $P1468, unless_1466_end
    get_global $P1469, "@BLOCK"
    unless_null $P1469, vivify_483
    $P1469 = root_new ['parrot';'ResizablePMCArray']
  vivify_483:
    set $P1470, $P1469[0]
    unless_null $P1470, vivify_484
    new $P1470, "Undef"
  vivify_484:
    get_global $P1471, "@BLOCK"
    unless_null $P1471, vivify_485
    $P1471 = root_new ['parrot';'ResizablePMCArray']
  vivify_485:
    set $P1472, $P1471[0]
    unless_null $P1472, vivify_486
    new $P1472, "Undef"
  vivify_486:
    $P1473 = $P1472."arity"()
    set $N1474, $P1473
    new $P1475, 'Float'
    set $P1475, $N1474
    add $P1476, $P1475, 1
    $P1470."arity"($P1476)
  unless_1466_end:
.annotate 'line', 527
    find_lex $P1478, "$/"
    unless_null $P1478, vivify_487
    $P1478 = root_new ['parrot';'Hash']
  vivify_487:
    set $P1479, $P1478["typename"]
    unless_null $P1479, vivify_488
    new $P1479, "Undef"
  vivify_488:
    unless $P1479, if_1477_end
    .const 'Sub' $P1481 = "85_1279589176.27948" 
    capture_lex $P1481
    $P1481()
  if_1477_end:
.annotate 'line', 533
    find_lex $P1505, "$/"
    find_lex $P1506, "$past"
    $P1507 = $P1505."!make"($P1506)
.annotate 'line', 496
    .return ($P1507)
  control_1398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1508, exception, "payload"
    .return ($P1508)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1480"  :anon :subid("85_1279589176.27948") :outer("84_1279589176.27948")
.annotate 'line', 527
    .const 'Sub' $P1493 = "86_1279589176.27948" 
    capture_lex $P1493
.annotate 'line', 528
    $P1482 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1482
.annotate 'line', 527
    find_lex $P1483, "@multitype"
.annotate 'line', 529
    find_lex $P1485, "$/"
    unless_null $P1485, vivify_489
    $P1485 = root_new ['parrot';'Hash']
  vivify_489:
    set $P1486, $P1485["typename"]
    unless_null $P1486, vivify_490
    $P1486 = root_new ['parrot';'ResizablePMCArray']
  vivify_490:
    set $P1487, $P1486[0]
    unless_null $P1487, vivify_491
    $P1487 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1488, $P1487["name"]
    unless_null $P1488, vivify_492
    $P1488 = root_new ['parrot';'Hash']
  vivify_492:
    set $P1489, $P1488["identifier"]
    unless_null $P1489, vivify_493
    new $P1489, "Undef"
  vivify_493:
    defined $I1490, $P1489
    unless $I1490, for_undef_494
    iter $P1484, $P1489
    new $P1500, 'ExceptionHandler'
    set_addr $P1500, loop1499_handler
    $P1500."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1500
  loop1499_test:
    unless $P1484, loop1499_done
    shift $P1491, $P1484
  loop1499_redo:
    .const 'Sub' $P1493 = "86_1279589176.27948" 
    capture_lex $P1493
    $P1493($P1491)
  loop1499_next:
    goto loop1499_test
  loop1499_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1501, exception, 'type'
    eq $P1501, .CONTROL_LOOP_NEXT, loop1499_next
    eq $P1501, .CONTROL_LOOP_REDO, loop1499_redo
  loop1499_done:
    pop_eh 
  for_undef_494:
.annotate 'line', 530
    find_lex $P1502, "$past"
    find_lex $P1503, "@multitype"
    $P1504 = $P1502."multitype"($P1503)
.annotate 'line', 527
    .return ($P1504)
.end


.namespace ["NQP";"Actions"]
.sub "_block1492"  :anon :subid("86_1279589176.27948") :outer("85_1279589176.27948")
    .param pmc param_1494
.annotate 'line', 529
    .lex "$_", param_1494
    find_lex $P1495, "@multitype"
    find_lex $P1496, "$_"
    set $S1497, $P1496
    $P1498 = $P1495."push"($S1497)
    .return ($P1498)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("87_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1512
.annotate 'line', 536
    new $P1511, 'ExceptionHandler'
    set_addr $P1511, control_1510
    $P1511."handle_types"(.CONTROL_RETURN)
    push_eh $P1511
    .lex "self", self
    .lex "$/", param_1512
.annotate 'line', 537
    new $P1513, "Undef"
    .lex "$name", $P1513
.annotate 'line', 538
    new $P1514, "Undef"
    .lex "$past", $P1514
.annotate 'line', 537
    find_lex $P1515, "$/"
    set $S1516, $P1515
    new $P1517, 'String'
    set $P1517, $S1516
    store_lex "$name", $P1517
.annotate 'line', 538
    get_hll_global $P1518, ["PAST"], "Var"
    find_lex $P1519, "$name"
    find_lex $P1520, "$/"
    $P1521 = $P1518."new"($P1519 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1520 :named("node"))
    store_lex "$past", $P1521
.annotate 'line', 540
    get_global $P1522, "@BLOCK"
    unless_null $P1522, vivify_495
    $P1522 = root_new ['parrot';'ResizablePMCArray']
  vivify_495:
    set $P1523, $P1522[0]
    unless_null $P1523, vivify_496
    new $P1523, "Undef"
  vivify_496:
    find_lex $P1524, "$name"
    $P1523."symbol"($P1524, "lexical" :named("scope"))
.annotate 'line', 541
    find_lex $P1525, "$/"
    find_lex $P1526, "$past"
    $P1527 = $P1525."!make"($P1526)
.annotate 'line', 536
    .return ($P1527)
  control_1510:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, "payload"
    .return ($P1528)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("88_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1532
.annotate 'line', 544
    new $P1531, 'ExceptionHandler'
    set_addr $P1531, control_1530
    $P1531."handle_types"(.CONTROL_RETURN)
    push_eh $P1531
    .lex "self", self
    .lex "$/", param_1532
.annotate 'line', 545
    new $P1533, "Undef"
    .lex "$past", $P1533
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_497
    $P1534 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1535, $P1534["param_var"]
    unless_null $P1535, vivify_498
    new $P1535, "Undef"
  vivify_498:
    $P1536 = $P1535."ast"()
    store_lex "$past", $P1536
.annotate 'line', 546
    find_lex $P1537, "$past"
    find_lex $P1538, "$/"
    unless_null $P1538, vivify_499
    $P1538 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1539, $P1538["param_var"]
    unless_null $P1539, vivify_500
    $P1539 = root_new ['parrot';'Hash']
  vivify_500:
    set $P1540, $P1539["name"]
    unless_null $P1540, vivify_501
    new $P1540, "Undef"
  vivify_501:
    set $S1541, $P1540
    $P1537."named"($S1541)
.annotate 'line', 547
    find_lex $P1542, "$/"
    find_lex $P1543, "$past"
    $P1544 = $P1542."!make"($P1543)
.annotate 'line', 544
    .return ($P1544)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1545, exception, "payload"
    .return ($P1545)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("89_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1549
    .param pmc param_1550 :optional
    .param int has_param_1550 :opt_flag
.annotate 'line', 550
    .const 'Sub' $P1620 = "91_1279589176.27948" 
    capture_lex $P1620
    .const 'Sub' $P1592 = "90_1279589176.27948" 
    capture_lex $P1592
    new $P1548, 'ExceptionHandler'
    set_addr $P1548, control_1547
    $P1548."handle_types"(.CONTROL_RETURN)
    push_eh $P1548
    .lex "self", self
    .lex "$/", param_1549
    if has_param_1550, optparam_502
    new $P1551, "Undef"
    set param_1550, $P1551
  optparam_502:
    .lex "$key", param_1550
.annotate 'line', 551
    $P1552 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1552
.annotate 'line', 554
    new $P1553, "Undef"
    .lex "$name", $P1553
.annotate 'line', 555
    new $P1554, "Undef"
    .lex "$past", $P1554
.annotate 'line', 551

        $P1555 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1555
.annotate 'line', 554
    find_lex $P1556, "$/"
    unless_null $P1556, vivify_503
    $P1556 = root_new ['parrot';'Hash']
  vivify_503:
    set $P1557, $P1556["deflongname"]
    unless_null $P1557, vivify_504
    new $P1557, "Undef"
  vivify_504:
    $P1558 = $P1557."ast"()
    set $S1559, $P1558
    new $P1560, 'String'
    set $P1560, $S1559
    store_lex "$name", $P1560
    find_lex $P1561, "$past"
.annotate 'line', 556
    find_lex $P1563, "$/"
    unless_null $P1563, vivify_505
    $P1563 = root_new ['parrot';'Hash']
  vivify_505:
    set $P1564, $P1563["proto"]
    unless_null $P1564, vivify_506
    new $P1564, "Undef"
  vivify_506:
    if $P1564, if_1562
.annotate 'line', 583
    find_lex $P1588, "$key"
    set $S1589, $P1588
    iseq $I1590, $S1589, "open"
    if $I1590, if_1587
.annotate 'line', 596
    .const 'Sub' $P1620 = "91_1279589176.27948" 
    capture_lex $P1620
    $P1620()
    goto if_1587_end
  if_1587:
.annotate 'line', 583
    .const 'Sub' $P1592 = "90_1279589176.27948" 
    capture_lex $P1592
    $P1592()
  if_1587_end:
    goto if_1562_end
  if_1562:
.annotate 'line', 558
    get_hll_global $P1565, ["PAST"], "Stmts"
.annotate 'line', 559
    get_hll_global $P1566, ["PAST"], "Block"
    find_lex $P1567, "$name"
.annotate 'line', 560
    get_hll_global $P1568, ["PAST"], "Op"
.annotate 'line', 561
    get_hll_global $P1569, ["PAST"], "Var"
    $P1570 = $P1569."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1571, "$name"
    $P1572 = $P1568."new"($P1570, $P1571, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 560
    find_lex $P1573, "$/"
    $P1574 = $P1566."new"($P1572, $P1567 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1573 :named("node"))
.annotate 'line', 570
    get_hll_global $P1575, ["PAST"], "Block"
    new $P1576, "String"
    assign $P1576, "!PREFIX__"
    find_lex $P1577, "$name"
    concat $P1578, $P1576, $P1577
.annotate 'line', 571
    get_hll_global $P1579, ["PAST"], "Op"
.annotate 'line', 572
    get_hll_global $P1580, ["PAST"], "Var"
    $P1581 = $P1580."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1582, "$name"
    $P1583 = $P1579."new"($P1581, $P1582, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 571
    find_lex $P1584, "$/"
    $P1585 = $P1575."new"($P1583, $P1578 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1584 :named("node"))
.annotate 'line', 570
    $P1586 = $P1565."new"($P1574, $P1585)
.annotate 'line', 558
    store_lex "$past", $P1586
  if_1562_end:
.annotate 'line', 610
    find_lex $P1641, "$/"
    find_lex $P1642, "$past"
    $P1643 = $P1641."!make"($P1642)
.annotate 'line', 550
    .return ($P1643)
  control_1547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1644, exception, "payload"
    .return ($P1644)
.end


.namespace ["NQP";"Actions"]
.sub "_block1619"  :anon :subid("91_1279589176.27948") :outer("89_1279589176.27948")
.annotate 'line', 597
    new $P1621, "Undef"
    .lex "$regex", $P1621
.annotate 'line', 598
    get_hll_global $P1622, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1623, "$/"
    unless_null $P1623, vivify_507
    $P1623 = root_new ['parrot';'Hash']
  vivify_507:
    set $P1624, $P1623["p6regex"]
    unless_null $P1624, vivify_508
    new $P1624, "Undef"
  vivify_508:
    $P1625 = $P1624."ast"()
    get_global $P1626, "@BLOCK"
    $P1627 = $P1626."shift"()
    $P1628 = $P1622($P1625, $P1627)
    store_lex "$regex", $P1628
.annotate 'line', 599
    find_lex $P1629, "$regex"
    find_lex $P1630, "$name"
    $P1629."name"($P1630)
.annotate 'line', 601
    get_hll_global $P1631, ["PAST"], "Op"
.annotate 'line', 603
    get_hll_global $P1632, ["PAST"], "Var"
    new $P1633, "ResizablePMCArray"
    push $P1633, "Regex"
    $P1634 = $P1632."new"("Method" :named("name"), $P1633 :named("namespace"), "package" :named("scope"))
    find_lex $P1635, "$regex"
    $P1636 = $P1631."new"($P1634, $P1635, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 601
    store_lex "$past", $P1636
.annotate 'line', 607
    find_lex $P1637, "$regex"
    find_lex $P1638, "$past"
    unless_null $P1638, vivify_509
    $P1638 = root_new ['parrot';'Hash']
    store_lex "$past", $P1638
  vivify_509:
    set $P1638["sink"], $P1637
.annotate 'line', 608
    find_lex $P1639, "@MODIFIERS"
    $P1640 = $P1639."shift"()
.annotate 'line', 596
    .return ($P1640)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1591"  :anon :subid("90_1279589176.27948") :outer("89_1279589176.27948")
.annotate 'line', 584
    $P1593 = root_new ['parrot';'Hash']
    .lex "%h", $P1593
.annotate 'line', 583
    find_lex $P1594, "%h"
.annotate 'line', 585
    find_lex $P1596, "$/"
    unless_null $P1596, vivify_510
    $P1596 = root_new ['parrot';'Hash']
  vivify_510:
    set $P1597, $P1596["sym"]
    unless_null $P1597, vivify_511
    new $P1597, "Undef"
  vivify_511:
    set $S1598, $P1597
    iseq $I1599, $S1598, "token"
    unless $I1599, if_1595_end
    new $P1600, "Integer"
    assign $P1600, 1
    find_lex $P1601, "%h"
    unless_null $P1601, vivify_512
    $P1601 = root_new ['parrot';'Hash']
    store_lex "%h", $P1601
  vivify_512:
    set $P1601["r"], $P1600
  if_1595_end:
.annotate 'line', 586
    find_lex $P1603, "$/"
    unless_null $P1603, vivify_513
    $P1603 = root_new ['parrot';'Hash']
  vivify_513:
    set $P1604, $P1603["sym"]
    unless_null $P1604, vivify_514
    new $P1604, "Undef"
  vivify_514:
    set $S1605, $P1604
    iseq $I1606, $S1605, "rule"
    unless $I1606, if_1602_end
    new $P1607, "Integer"
    assign $P1607, 1
    find_lex $P1608, "%h"
    unless_null $P1608, vivify_515
    $P1608 = root_new ['parrot';'Hash']
    store_lex "%h", $P1608
  vivify_515:
    set $P1608["r"], $P1607
    new $P1609, "Integer"
    assign $P1609, 1
    find_lex $P1610, "%h"
    unless_null $P1610, vivify_516
    $P1610 = root_new ['parrot';'Hash']
    store_lex "%h", $P1610
  vivify_516:
    set $P1610["s"], $P1609
  if_1602_end:
.annotate 'line', 587
    find_lex $P1611, "@MODIFIERS"
    find_lex $P1612, "%h"
    $P1611."unshift"($P1612)
.annotate 'line', 588

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 592
    get_global $P1613, "@BLOCK"
    unless_null $P1613, vivify_517
    $P1613 = root_new ['parrot';'ResizablePMCArray']
  vivify_517:
    set $P1614, $P1613[0]
    unless_null $P1614, vivify_518
    new $P1614, "Undef"
  vivify_518:
    $P1614."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 593
    get_global $P1615, "@BLOCK"
    unless_null $P1615, vivify_519
    $P1615 = root_new ['parrot';'ResizablePMCArray']
  vivify_519:
    set $P1616, $P1615[0]
    unless_null $P1616, vivify_520
    new $P1616, "Undef"
  vivify_520:
    $P1616."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 594
    new $P1617, "Exception"
    set $P1617['type'], .CONTROL_RETURN
    new $P1618, "Integer"
    assign $P1618, 0
    setattribute $P1617, 'payload', $P1618
    throw $P1617
.annotate 'line', 583
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("92_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1648
.annotate 'line', 614
    new $P1647, 'ExceptionHandler'
    set_addr $P1647, control_1646
    $P1647."handle_types"(.CONTROL_RETURN)
    push_eh $P1647
    .lex "self", self
    .lex "$/", param_1648
.annotate 'line', 615
    new $P1649, "Undef"
    .lex "$past", $P1649
    find_lex $P1652, "$/"
    unless_null $P1652, vivify_521
    $P1652 = root_new ['parrot';'Hash']
  vivify_521:
    set $P1653, $P1652["args"]
    unless_null $P1653, vivify_522
    new $P1653, "Undef"
  vivify_522:
    if $P1653, if_1651
    get_hll_global $P1658, ["PAST"], "Op"
    find_lex $P1659, "$/"
    $P1660 = $P1658."new"($P1659 :named("node"))
    set $P1650, $P1660
    goto if_1651_end
  if_1651:
    find_lex $P1654, "$/"
    unless_null $P1654, vivify_523
    $P1654 = root_new ['parrot';'Hash']
  vivify_523:
    set $P1655, $P1654["args"]
    unless_null $P1655, vivify_524
    $P1655 = root_new ['parrot';'ResizablePMCArray']
  vivify_524:
    set $P1656, $P1655[0]
    unless_null $P1656, vivify_525
    new $P1656, "Undef"
  vivify_525:
    $P1657 = $P1656."ast"()
    set $P1650, $P1657
  if_1651_end:
    store_lex "$past", $P1650
.annotate 'line', 616
    find_lex $P1661, "$past"
    find_lex $P1664, "$/"
    unless_null $P1664, vivify_526
    $P1664 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1665, $P1664["quote"]
    unless_null $P1665, vivify_527
    new $P1665, "Undef"
  vivify_527:
    if $P1665, if_1663
    find_lex $P1669, "$/"
    unless_null $P1669, vivify_528
    $P1669 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1670, $P1669["longname"]
    unless_null $P1670, vivify_529
    new $P1670, "Undef"
  vivify_529:
    set $S1671, $P1670
    new $P1662, 'String'
    set $P1662, $S1671
    goto if_1663_end
  if_1663:
    find_lex $P1666, "$/"
    unless_null $P1666, vivify_530
    $P1666 = root_new ['parrot';'Hash']
  vivify_530:
    set $P1667, $P1666["quote"]
    unless_null $P1667, vivify_531
    new $P1667, "Undef"
  vivify_531:
    $P1668 = $P1667."ast"()
    set $P1662, $P1668
  if_1663_end:
    $P1661."name"($P1662)
.annotate 'line', 617
    find_lex $P1672, "$past"
    $P1672."pasttype"("callmethod")
.annotate 'line', 618
    find_lex $P1673, "$/"
    find_lex $P1674, "$past"
    $P1675 = $P1673."!make"($P1674)
.annotate 'line', 614
    .return ($P1675)
  control_1646:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1676, exception, "payload"
    .return ($P1676)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("93_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1680
.annotate 'line', 623
    new $P1679, 'ExceptionHandler'
    set_addr $P1679, control_1678
    $P1679."handle_types"(.CONTROL_RETURN)
    push_eh $P1679
    .lex "self", self
    .lex "$/", param_1680
.annotate 'line', 624
    find_lex $P1681, "$/"
    get_hll_global $P1682, ["PAST"], "Var"
    $P1683 = $P1682."new"("self" :named("name"))
    $P1684 = $P1681."!make"($P1683)
.annotate 'line', 623
    .return ($P1684)
  control_1678:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1685, exception, "payload"
    .return ($P1685)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("94_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1689
.annotate 'line', 627
    new $P1688, 'ExceptionHandler'
    set_addr $P1688, control_1687
    $P1688."handle_types"(.CONTROL_RETURN)
    push_eh $P1688
    .lex "self", self
    .lex "$/", param_1689
.annotate 'line', 628
    new $P1690, "Undef"
    .lex "$past", $P1690
    find_lex $P1691, "$/"
    unless_null $P1691, vivify_532
    $P1691 = root_new ['parrot';'Hash']
  vivify_532:
    set $P1692, $P1691["args"]
    unless_null $P1692, vivify_533
    new $P1692, "Undef"
  vivify_533:
    $P1693 = $P1692."ast"()
    store_lex "$past", $P1693
.annotate 'line', 629
    find_lex $P1694, "$past"
    find_lex $P1695, "$/"
    unless_null $P1695, vivify_534
    $P1695 = root_new ['parrot';'Hash']
  vivify_534:
    set $P1696, $P1695["deflongname"]
    unless_null $P1696, vivify_535
    new $P1696, "Undef"
  vivify_535:
    set $S1697, $P1696
    $P1694."name"($S1697)
.annotate 'line', 630
    find_lex $P1698, "$/"
    find_lex $P1699, "$past"
    $P1700 = $P1698."!make"($P1699)
.annotate 'line', 627
    .return ($P1700)
  control_1687:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1701, exception, "payload"
    .return ($P1701)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("95_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1705
.annotate 'line', 633
    new $P1704, 'ExceptionHandler'
    set_addr $P1704, control_1703
    $P1704."handle_types"(.CONTROL_RETURN)
    push_eh $P1704
    .lex "self", self
    .lex "$/", param_1705
.annotate 'line', 634
    $P1706 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1706
.annotate 'line', 635
    new $P1707, "Undef"
    .lex "$name", $P1707
.annotate 'line', 637
    new $P1708, "Undef"
    .lex "$var", $P1708
.annotate 'line', 639
    new $P1709, "Undef"
    .lex "$past", $P1709
.annotate 'line', 634
    find_lex $P1710, "$/"
    unless_null $P1710, vivify_536
    $P1710 = root_new ['parrot';'Hash']
  vivify_536:
    set $P1711, $P1710["name"]
    unless_null $P1711, vivify_537
    $P1711 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1712, $P1711["identifier"]
    unless_null $P1712, vivify_538
    new $P1712, "Undef"
  vivify_538:
    clone $P1713, $P1712
    store_lex "@ns", $P1713
.annotate 'line', 635
    find_lex $P1714, "@ns"
    $P1715 = $P1714."pop"()
    store_lex "$name", $P1715
.annotate 'line', 636
    find_lex $P1719, "@ns"
    if $P1719, if_1718
    set $P1717, $P1719
    goto if_1718_end
  if_1718:
    find_lex $P1720, "@ns"
    unless_null $P1720, vivify_539
    $P1720 = root_new ['parrot';'ResizablePMCArray']
  vivify_539:
    set $P1721, $P1720[0]
    unless_null $P1721, vivify_540
    new $P1721, "Undef"
  vivify_540:
    set $S1722, $P1721
    iseq $I1723, $S1722, "GLOBAL"
    new $P1717, 'Integer'
    set $P1717, $I1723
  if_1718_end:
    unless $P1717, if_1716_end
    find_lex $P1724, "@ns"
    $P1724."shift"()
  if_1716_end:
.annotate 'line', 638
    get_hll_global $P1725, ["PAST"], "Var"
    find_lex $P1726, "$name"
    set $S1727, $P1726
    find_lex $P1728, "@ns"
    $P1729 = $P1725."new"($S1727 :named("name"), $P1728 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1729
.annotate 'line', 639
    find_lex $P1730, "$var"
    store_lex "$past", $P1730
.annotate 'line', 640
    find_lex $P1732, "$/"
    unless_null $P1732, vivify_541
    $P1732 = root_new ['parrot';'Hash']
  vivify_541:
    set $P1733, $P1732["args"]
    unless_null $P1733, vivify_542
    new $P1733, "Undef"
  vivify_542:
    unless $P1733, if_1731_end
.annotate 'line', 641
    find_lex $P1734, "$/"
    unless_null $P1734, vivify_543
    $P1734 = root_new ['parrot';'Hash']
  vivify_543:
    set $P1735, $P1734["args"]
    unless_null $P1735, vivify_544
    $P1735 = root_new ['parrot';'ResizablePMCArray']
  vivify_544:
    set $P1736, $P1735[0]
    unless_null $P1736, vivify_545
    new $P1736, "Undef"
  vivify_545:
    $P1737 = $P1736."ast"()
    store_lex "$past", $P1737
.annotate 'line', 642
    find_lex $P1738, "$past"
    find_lex $P1739, "$var"
    $P1738."unshift"($P1739)
  if_1731_end:
.annotate 'line', 644
    find_lex $P1740, "$/"
    find_lex $P1741, "$past"
    $P1742 = $P1740."!make"($P1741)
.annotate 'line', 633
    .return ($P1742)
  control_1703:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1743, exception, "payload"
    .return ($P1743)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("96_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1747
.annotate 'line', 647
    new $P1746, 'ExceptionHandler'
    set_addr $P1746, control_1745
    $P1746."handle_types"(.CONTROL_RETURN)
    push_eh $P1746
    .lex "self", self
    .lex "$/", param_1747
.annotate 'line', 648
    new $P1748, "Undef"
    .lex "$past", $P1748
.annotate 'line', 649
    new $P1749, "Undef"
    .lex "$pirop", $P1749
.annotate 'line', 648
    find_lex $P1752, "$/"
    unless_null $P1752, vivify_546
    $P1752 = root_new ['parrot';'Hash']
  vivify_546:
    set $P1753, $P1752["args"]
    unless_null $P1753, vivify_547
    new $P1753, "Undef"
  vivify_547:
    if $P1753, if_1751
    get_hll_global $P1758, ["PAST"], "Op"
    find_lex $P1759, "$/"
    $P1760 = $P1758."new"($P1759 :named("node"))
    set $P1750, $P1760
    goto if_1751_end
  if_1751:
    find_lex $P1754, "$/"
    unless_null $P1754, vivify_548
    $P1754 = root_new ['parrot';'Hash']
  vivify_548:
    set $P1755, $P1754["args"]
    unless_null $P1755, vivify_549
    $P1755 = root_new ['parrot';'ResizablePMCArray']
  vivify_549:
    set $P1756, $P1755[0]
    unless_null $P1756, vivify_550
    new $P1756, "Undef"
  vivify_550:
    $P1757 = $P1756."ast"()
    set $P1750, $P1757
  if_1751_end:
    store_lex "$past", $P1750
.annotate 'line', 649
    find_lex $P1761, "$/"
    unless_null $P1761, vivify_551
    $P1761 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1762, $P1761["op"]
    unless_null $P1762, vivify_552
    new $P1762, "Undef"
  vivify_552:
    set $S1763, $P1762
    new $P1764, 'String'
    set $P1764, $S1763
    store_lex "$pirop", $P1764
.annotate 'line', 650

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1765 = box $S0
    
    store_lex "$pirop", $P1765
.annotate 'line', 657
    find_lex $P1766, "$past"
    find_lex $P1767, "$pirop"
    $P1766."pirop"($P1767)
.annotate 'line', 658
    find_lex $P1768, "$past"
    $P1768."pasttype"("pirop")
.annotate 'line', 659
    find_lex $P1769, "$/"
    find_lex $P1770, "$past"
    $P1771 = $P1769."!make"($P1770)
.annotate 'line', 647
    .return ($P1771)
  control_1745:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1772, exception, "payload"
    .return ($P1772)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("97_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1776
.annotate 'line', 662
    new $P1775, 'ExceptionHandler'
    set_addr $P1775, control_1774
    $P1775."handle_types"(.CONTROL_RETURN)
    push_eh $P1775
    .lex "self", self
    .lex "$/", param_1776
    find_lex $P1777, "$/"
    find_lex $P1778, "$/"
    unless_null $P1778, vivify_553
    $P1778 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1779, $P1778["arglist"]
    unless_null $P1779, vivify_554
    new $P1779, "Undef"
  vivify_554:
    $P1780 = $P1779."ast"()
    $P1781 = $P1777."!make"($P1780)
    .return ($P1781)
  control_1774:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1782, exception, "payload"
    .return ($P1782)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("98_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1786
.annotate 'line', 664
    .const 'Sub' $P1797 = "99_1279589176.27948" 
    capture_lex $P1797
    new $P1785, 'ExceptionHandler'
    set_addr $P1785, control_1784
    $P1785."handle_types"(.CONTROL_RETURN)
    push_eh $P1785
    .lex "self", self
    .lex "$/", param_1786
.annotate 'line', 665
    new $P1787, "Undef"
    .lex "$past", $P1787
.annotate 'line', 673
    new $P1788, "Undef"
    .lex "$i", $P1788
.annotate 'line', 674
    new $P1789, "Undef"
    .lex "$n", $P1789
.annotate 'line', 665
    get_hll_global $P1790, ["PAST"], "Op"
    find_lex $P1791, "$/"
    $P1792 = $P1790."new"("call" :named("pasttype"), $P1791 :named("node"))
    store_lex "$past", $P1792
.annotate 'line', 666
    find_lex $P1794, "$/"
    unless_null $P1794, vivify_555
    $P1794 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1795, $P1794["EXPR"]
    unless_null $P1795, vivify_556
    new $P1795, "Undef"
  vivify_556:
    unless $P1795, if_1793_end
    .const 'Sub' $P1797 = "99_1279589176.27948" 
    capture_lex $P1797
    $P1797()
  if_1793_end:
.annotate 'line', 673
    new $P1829, "Integer"
    assign $P1829, 0
    store_lex "$i", $P1829
.annotate 'line', 674
    find_lex $P1830, "$past"
    $P1831 = $P1830."list"()
    set $N1832, $P1831
    new $P1833, 'Float'
    set $P1833, $N1832
    store_lex "$n", $P1833
.annotate 'line', 675
    new $P1881, 'ExceptionHandler'
    set_addr $P1881, loop1880_handler
    $P1881."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1881
  loop1880_test:
    find_lex $P1834, "$i"
    set $N1835, $P1834
    find_lex $P1836, "$n"
    set $N1837, $P1836
    islt $I1838, $N1835, $N1837
    unless $I1838, loop1880_done
  loop1880_redo:
.annotate 'line', 676
    find_lex $P1840, "$i"
    set $I1841, $P1840
    find_lex $P1842, "$past"
    unless_null $P1842, vivify_560
    $P1842 = root_new ['parrot';'ResizablePMCArray']
  vivify_560:
    set $P1843, $P1842[$I1841]
    unless_null $P1843, vivify_561
    new $P1843, "Undef"
  vivify_561:
    $S1844 = $P1843."name"()
    iseq $I1845, $S1844, "&prefix:<|>"
    unless $I1845, if_1839_end
.annotate 'line', 677
    find_lex $P1846, "$i"
    set $I1847, $P1846
    find_lex $P1848, "$past"
    unless_null $P1848, vivify_562
    $P1848 = root_new ['parrot';'ResizablePMCArray']
  vivify_562:
    set $P1849, $P1848[$I1847]
    unless_null $P1849, vivify_563
    $P1849 = root_new ['parrot';'ResizablePMCArray']
  vivify_563:
    set $P1850, $P1849[0]
    unless_null $P1850, vivify_564
    new $P1850, "Undef"
  vivify_564:
    find_lex $P1851, "$i"
    set $I1852, $P1851
    find_lex $P1853, "$past"
    unless_null $P1853, vivify_565
    $P1853 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1853
  vivify_565:
    set $P1853[$I1852], $P1850
.annotate 'line', 678
    find_lex $P1854, "$i"
    set $I1855, $P1854
    find_lex $P1856, "$past"
    unless_null $P1856, vivify_566
    $P1856 = root_new ['parrot';'ResizablePMCArray']
  vivify_566:
    set $P1857, $P1856[$I1855]
    unless_null $P1857, vivify_567
    new $P1857, "Undef"
  vivify_567:
    $P1857."flat"(1)
.annotate 'line', 679
    find_lex $P1861, "$i"
    set $I1862, $P1861
    find_lex $P1863, "$past"
    unless_null $P1863, vivify_568
    $P1863 = root_new ['parrot';'ResizablePMCArray']
  vivify_568:
    set $P1864, $P1863[$I1862]
    unless_null $P1864, vivify_569
    new $P1864, "Undef"
  vivify_569:
    get_hll_global $P1865, ["PAST"], "Val"
    $P1866 = $P1864."isa"($P1865)
    if $P1866, if_1860
    set $P1859, $P1866
    goto if_1860_end
  if_1860:
.annotate 'line', 680
    find_lex $P1867, "$i"
    set $I1868, $P1867
    find_lex $P1869, "$past"
    unless_null $P1869, vivify_570
    $P1869 = root_new ['parrot';'ResizablePMCArray']
  vivify_570:
    set $P1870, $P1869[$I1868]
    unless_null $P1870, vivify_571
    new $P1870, "Undef"
  vivify_571:
    $S1871 = $P1870."name"()
    substr $S1872, $S1871, 0, 1
    iseq $I1873, $S1872, "%"
    new $P1859, 'Integer'
    set $P1859, $I1873
  if_1860_end:
    unless $P1859, if_1858_end
.annotate 'line', 681
    find_lex $P1874, "$i"
    set $I1875, $P1874
    find_lex $P1876, "$past"
    unless_null $P1876, vivify_572
    $P1876 = root_new ['parrot';'ResizablePMCArray']
  vivify_572:
    set $P1877, $P1876[$I1875]
    unless_null $P1877, vivify_573
    new $P1877, "Undef"
  vivify_573:
    $P1877."named"(1)
  if_1858_end:
  if_1839_end:
.annotate 'line', 676
    find_lex $P1878, "$i"
    clone $P1879, $P1878
    inc $P1878
  loop1880_next:
.annotate 'line', 675
    goto loop1880_test
  loop1880_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1882, exception, 'type'
    eq $P1882, .CONTROL_LOOP_NEXT, loop1880_next
    eq $P1882, .CONTROL_LOOP_REDO, loop1880_redo
  loop1880_done:
    pop_eh 
.annotate 'line', 686
    find_lex $P1883, "$/"
    find_lex $P1884, "$past"
    $P1885 = $P1883."!make"($P1884)
.annotate 'line', 664
    .return ($P1885)
  control_1784:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1886, exception, "payload"
    .return ($P1886)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1796"  :anon :subid("99_1279589176.27948") :outer("98_1279589176.27948")
.annotate 'line', 666
    .const 'Sub' $P1818 = "100_1279589176.27948" 
    capture_lex $P1818
.annotate 'line', 667
    new $P1798, "Undef"
    .lex "$expr", $P1798
    find_lex $P1799, "$/"
    unless_null $P1799, vivify_557
    $P1799 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1800, $P1799["EXPR"]
    unless_null $P1800, vivify_558
    new $P1800, "Undef"
  vivify_558:
    $P1801 = $P1800."ast"()
    store_lex "$expr", $P1801
.annotate 'line', 668
    find_lex $P1806, "$expr"
    $S1807 = $P1806."name"()
    iseq $I1808, $S1807, "&infix:<,>"
    if $I1808, if_1805
    new $P1804, 'Integer'
    set $P1804, $I1808
    goto if_1805_end
  if_1805:
    find_lex $P1809, "$expr"
    $P1810 = $P1809."named"()
    isfalse $I1811, $P1810
    new $P1804, 'Integer'
    set $P1804, $I1811
  if_1805_end:
    if $P1804, if_1803
.annotate 'line', 671
    find_lex $P1826, "$past"
    find_lex $P1827, "$expr"
    $P1828 = $P1826."push"($P1827)
    set $P1802, $P1828
.annotate 'line', 668
    goto if_1803_end
  if_1803:
.annotate 'line', 669
    find_lex $P1813, "$expr"
    $P1814 = $P1813."list"()
    defined $I1815, $P1814
    unless $I1815, for_undef_559
    iter $P1812, $P1814
    new $P1824, 'ExceptionHandler'
    set_addr $P1824, loop1823_handler
    $P1824."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1824
  loop1823_test:
    unless $P1812, loop1823_done
    shift $P1816, $P1812
  loop1823_redo:
    .const 'Sub' $P1818 = "100_1279589176.27948" 
    capture_lex $P1818
    $P1818($P1816)
  loop1823_next:
    goto loop1823_test
  loop1823_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1825, exception, 'type'
    eq $P1825, .CONTROL_LOOP_NEXT, loop1823_next
    eq $P1825, .CONTROL_LOOP_REDO, loop1823_redo
  loop1823_done:
    pop_eh 
  for_undef_559:
.annotate 'line', 668
    set $P1802, $P1812
  if_1803_end:
.annotate 'line', 666
    .return ($P1802)
.end


.namespace ["NQP";"Actions"]
.sub "_block1817"  :anon :subid("100_1279589176.27948") :outer("99_1279589176.27948")
    .param pmc param_1819
.annotate 'line', 669
    .lex "$_", param_1819
    find_lex $P1820, "$past"
    find_lex $P1821, "$_"
    $P1822 = $P1820."push"($P1821)
    .return ($P1822)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("101_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1890
.annotate 'line', 690
    new $P1889, 'ExceptionHandler'
    set_addr $P1889, control_1888
    $P1889."handle_types"(.CONTROL_RETURN)
    push_eh $P1889
    .lex "self", self
    .lex "$/", param_1890
    find_lex $P1891, "$/"
    find_lex $P1892, "$/"
    unless_null $P1892, vivify_574
    $P1892 = root_new ['parrot';'Hash']
  vivify_574:
    set $P1893, $P1892["value"]
    unless_null $P1893, vivify_575
    new $P1893, "Undef"
  vivify_575:
    $P1894 = $P1893."ast"()
    $P1895 = $P1891."!make"($P1894)
    .return ($P1895)
  control_1888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1896, exception, "payload"
    .return ($P1896)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("102_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1900
.annotate 'line', 692
    new $P1899, 'ExceptionHandler'
    set_addr $P1899, control_1898
    $P1899."handle_types"(.CONTROL_RETURN)
    push_eh $P1899
    .lex "self", self
    .lex "$/", param_1900
.annotate 'line', 693
    find_lex $P1901, "$/"
.annotate 'line', 694
    find_lex $P1904, "$/"
    unless_null $P1904, vivify_576
    $P1904 = root_new ['parrot';'Hash']
  vivify_576:
    set $P1905, $P1904["EXPR"]
    unless_null $P1905, vivify_577
    new $P1905, "Undef"
  vivify_577:
    if $P1905, if_1903
.annotate 'line', 695
    get_hll_global $P1910, ["PAST"], "Op"
    find_lex $P1911, "$/"
    $P1912 = $P1910."new"("list" :named("pasttype"), $P1911 :named("node"))
    set $P1902, $P1912
.annotate 'line', 694
    goto if_1903_end
  if_1903:
    find_lex $P1906, "$/"
    unless_null $P1906, vivify_578
    $P1906 = root_new ['parrot';'Hash']
  vivify_578:
    set $P1907, $P1906["EXPR"]
    unless_null $P1907, vivify_579
    $P1907 = root_new ['parrot';'ResizablePMCArray']
  vivify_579:
    set $P1908, $P1907[0]
    unless_null $P1908, vivify_580
    new $P1908, "Undef"
  vivify_580:
    $P1909 = $P1908."ast"()
    set $P1902, $P1909
  if_1903_end:
    $P1913 = $P1901."!make"($P1902)
.annotate 'line', 692
    .return ($P1913)
  control_1898:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1914, exception, "payload"
    .return ($P1914)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("103_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1918
.annotate 'line', 698
    new $P1917, 'ExceptionHandler'
    set_addr $P1917, control_1916
    $P1917."handle_types"(.CONTROL_RETURN)
    push_eh $P1917
    .lex "self", self
    .lex "$/", param_1918
.annotate 'line', 699
    new $P1919, "Undef"
    .lex "$past", $P1919
.annotate 'line', 698
    find_lex $P1920, "$past"
.annotate 'line', 700
    find_lex $P1922, "$/"
    unless_null $P1922, vivify_581
    $P1922 = root_new ['parrot';'Hash']
  vivify_581:
    set $P1923, $P1922["EXPR"]
    unless_null $P1923, vivify_582
    new $P1923, "Undef"
  vivify_582:
    if $P1923, if_1921
.annotate 'line', 707
    get_hll_global $P1935, ["PAST"], "Op"
    $P1936 = $P1935."new"("list" :named("pasttype"))
    store_lex "$past", $P1936
.annotate 'line', 706
    goto if_1921_end
  if_1921:
.annotate 'line', 701
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_583
    $P1924 = root_new ['parrot';'Hash']
  vivify_583:
    set $P1925, $P1924["EXPR"]
    unless_null $P1925, vivify_584
    $P1925 = root_new ['parrot';'ResizablePMCArray']
  vivify_584:
    set $P1926, $P1925[0]
    unless_null $P1926, vivify_585
    new $P1926, "Undef"
  vivify_585:
    $P1927 = $P1926."ast"()
    store_lex "$past", $P1927
.annotate 'line', 702
    find_lex $P1929, "$past"
    $S1930 = $P1929."name"()
    isne $I1931, $S1930, "&infix:<,>"
    unless $I1931, if_1928_end
.annotate 'line', 703
    get_hll_global $P1932, ["PAST"], "Op"
    find_lex $P1933, "$past"
    $P1934 = $P1932."new"($P1933, "list" :named("pasttype"))
    store_lex "$past", $P1934
  if_1928_end:
  if_1921_end:
.annotate 'line', 709
    find_lex $P1937, "$past"
    $P1937."name"("&circumfix:<[ ]>")
.annotate 'line', 710
    find_lex $P1938, "$/"
    find_lex $P1939, "$past"
    $P1940 = $P1938."!make"($P1939)
.annotate 'line', 698
    .return ($P1940)
  control_1916:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1941, exception, "payload"
    .return ($P1941)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("104_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1945
.annotate 'line', 713
    new $P1944, 'ExceptionHandler'
    set_addr $P1944, control_1943
    $P1944."handle_types"(.CONTROL_RETURN)
    push_eh $P1944
    .lex "self", self
    .lex "$/", param_1945
    find_lex $P1946, "$/"
    find_lex $P1947, "$/"
    unless_null $P1947, vivify_586
    $P1947 = root_new ['parrot';'Hash']
  vivify_586:
    set $P1948, $P1947["quote_EXPR"]
    unless_null $P1948, vivify_587
    new $P1948, "Undef"
  vivify_587:
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
.include "except_types.pasm"
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1955
.annotate 'line', 714
    new $P1954, 'ExceptionHandler'
    set_addr $P1954, control_1953
    $P1954."handle_types"(.CONTROL_RETURN)
    push_eh $P1954
    .lex "self", self
    .lex "$/", param_1955
    find_lex $P1956, "$/"
    find_lex $P1957, "$/"
    unless_null $P1957, vivify_588
    $P1957 = root_new ['parrot';'Hash']
  vivify_588:
    set $P1958, $P1957["quote_EXPR"]
    unless_null $P1958, vivify_589
    new $P1958, "Undef"
  vivify_589:
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
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("106_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1965
.annotate 'line', 716
    new $P1964, 'ExceptionHandler'
    set_addr $P1964, control_1963
    $P1964."handle_types"(.CONTROL_RETURN)
    push_eh $P1964
    .lex "self", self
    .lex "$/", param_1965
.annotate 'line', 717
    new $P1966, "Undef"
    .lex "$past", $P1966
    find_lex $P1969, "$/"
    unless_null $P1969, vivify_590
    $P1969 = root_new ['parrot';'Hash']
  vivify_590:
    set $P1970, $P1969["pblock"]
    unless_null $P1970, vivify_591
    $P1970 = root_new ['parrot';'Hash']
  vivify_591:
    set $P1971, $P1970["blockoid"]
    unless_null $P1971, vivify_592
    $P1971 = root_new ['parrot';'Hash']
  vivify_592:
    set $P1972, $P1971["statementlist"]
    unless_null $P1972, vivify_593
    $P1972 = root_new ['parrot';'Hash']
  vivify_593:
    set $P1973, $P1972["statement"]
    unless_null $P1973, vivify_594
    new $P1973, "Undef"
  vivify_594:
    set $N1974, $P1973
    isgt $I1975, $N1974, 0.0
    if $I1975, if_1968
.annotate 'line', 719
    $P1979 = "vivitype"("%")
    set $P1967, $P1979
.annotate 'line', 717
    goto if_1968_end
  if_1968:
.annotate 'line', 718
    find_lex $P1976, "$/"
    unless_null $P1976, vivify_595
    $P1976 = root_new ['parrot';'Hash']
  vivify_595:
    set $P1977, $P1976["pblock"]
    unless_null $P1977, vivify_596
    new $P1977, "Undef"
  vivify_596:
    $P1978 = $P1977."ast"()
    set $P1967, $P1978
  if_1968_end:
    store_lex "$past", $P1967
.annotate 'line', 720
    new $P1980, "Integer"
    assign $P1980, 1
    find_lex $P1981, "$past"
    unless_null $P1981, vivify_597
    $P1981 = root_new ['parrot';'Hash']
    store_lex "$past", $P1981
  vivify_597:
    set $P1981["bareblock"], $P1980
.annotate 'line', 721
    find_lex $P1982, "$/"
    find_lex $P1983, "$past"
    $P1984 = $P1982."!make"($P1983)
.annotate 'line', 716
    .return ($P1984)
  control_1963:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1985, exception, "payload"
    .return ($P1985)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("107_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_1989
.annotate 'line', 724
    new $P1988, 'ExceptionHandler'
    set_addr $P1988, control_1987
    $P1988."handle_types"(.CONTROL_RETURN)
    push_eh $P1988
    .lex "self", self
    .lex "$/", param_1989
.annotate 'line', 725
    new $P1990, "Undef"
    .lex "$name", $P1990
    find_lex $P1993, "$/"
    unless_null $P1993, vivify_598
    $P1993 = root_new ['parrot';'Hash']
  vivify_598:
    set $P1994, $P1993["sigil"]
    unless_null $P1994, vivify_599
    new $P1994, "Undef"
  vivify_599:
    set $S1995, $P1994
    iseq $I1996, $S1995, "@"
    if $I1996, if_1992
.annotate 'line', 726
    find_lex $P2000, "$/"
    unless_null $P2000, vivify_600
    $P2000 = root_new ['parrot';'Hash']
  vivify_600:
    set $P2001, $P2000["sigil"]
    unless_null $P2001, vivify_601
    new $P2001, "Undef"
  vivify_601:
    set $S2002, $P2001
    iseq $I2003, $S2002, "%"
    if $I2003, if_1999
    new $P2005, "String"
    assign $P2005, "item"
    set $P1998, $P2005
    goto if_1999_end
  if_1999:
    new $P2004, "String"
    assign $P2004, "hash"
    set $P1998, $P2004
  if_1999_end:
    set $P1991, $P1998
.annotate 'line', 725
    goto if_1992_end
  if_1992:
    new $P1997, "String"
    assign $P1997, "list"
    set $P1991, $P1997
  if_1992_end:
    store_lex "$name", $P1991
.annotate 'line', 728
    find_lex $P2006, "$/"
    get_hll_global $P2007, ["PAST"], "Op"
    find_lex $P2008, "$name"
    find_lex $P2009, "$/"
    unless_null $P2009, vivify_602
    $P2009 = root_new ['parrot';'Hash']
  vivify_602:
    set $P2010, $P2009["semilist"]
    unless_null $P2010, vivify_603
    new $P2010, "Undef"
  vivify_603:
    $P2011 = $P2010."ast"()
    $P2012 = $P2007."new"($P2011, "callmethod" :named("pasttype"), $P2008 :named("name"))
    $P2013 = $P2006."!make"($P2012)
.annotate 'line', 724
    .return ($P2013)
  control_1987:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2014, exception, "payload"
    .return ($P2014)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("108_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2018
.annotate 'line', 731
    new $P2017, 'ExceptionHandler'
    set_addr $P2017, control_2016
    $P2017."handle_types"(.CONTROL_RETURN)
    push_eh $P2017
    .lex "self", self
    .lex "$/", param_2018
    find_lex $P2019, "$/"
    find_lex $P2020, "$/"
    unless_null $P2020, vivify_604
    $P2020 = root_new ['parrot';'Hash']
  vivify_604:
    set $P2021, $P2020["statement"]
    unless_null $P2021, vivify_605
    new $P2021, "Undef"
  vivify_605:
    $P2022 = $P2021."ast"()
    $P2023 = $P2019."!make"($P2022)
    .return ($P2023)
  control_2016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2024, exception, "payload"
    .return ($P2024)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("109_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2028
.annotate 'line', 733
    new $P2027, 'ExceptionHandler'
    set_addr $P2027, control_2026
    $P2027."handle_types"(.CONTROL_RETURN)
    push_eh $P2027
    .lex "self", self
    .lex "$/", param_2028
.annotate 'line', 734
    find_lex $P2029, "$/"
    get_hll_global $P2030, ["PAST"], "Var"
    find_lex $P2031, "$/"
    unless_null $P2031, vivify_606
    $P2031 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2032, $P2031["EXPR"]
    unless_null $P2032, vivify_607
    new $P2032, "Undef"
  vivify_607:
    $P2033 = $P2032."ast"()
.annotate 'line', 736
    $P2034 = "vivitype"("@")
    $P2035 = $P2030."new"($P2033, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2034 :named("vivibase"))
.annotate 'line', 734
    $P2036 = $P2029."!make"($P2035)
.annotate 'line', 733
    .return ($P2036)
  control_2026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2037, exception, "payload"
    .return ($P2037)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("110_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2041
.annotate 'line', 739
    new $P2040, 'ExceptionHandler'
    set_addr $P2040, control_2039
    $P2040."handle_types"(.CONTROL_RETURN)
    push_eh $P2040
    .lex "self", self
    .lex "$/", param_2041
.annotate 'line', 740
    find_lex $P2042, "$/"
    get_hll_global $P2043, ["PAST"], "Var"
    find_lex $P2044, "$/"
    unless_null $P2044, vivify_608
    $P2044 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2045, $P2044["EXPR"]
    unless_null $P2045, vivify_609
    new $P2045, "Undef"
  vivify_609:
    $P2046 = $P2045."ast"()
.annotate 'line', 742
    $P2047 = "vivitype"("%")
    $P2048 = $P2043."new"($P2046, "keyed" :named("scope"), "Undef" :named("viviself"), $P2047 :named("vivibase"))
.annotate 'line', 740
    $P2049 = $P2042."!make"($P2048)
.annotate 'line', 739
    .return ($P2049)
  control_2039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2050, exception, "payload"
    .return ($P2050)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("111_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2054
.annotate 'line', 745
    new $P2053, 'ExceptionHandler'
    set_addr $P2053, control_2052
    $P2053."handle_types"(.CONTROL_RETURN)
    push_eh $P2053
    .lex "self", self
    .lex "$/", param_2054
.annotate 'line', 746
    find_lex $P2055, "$/"
    get_hll_global $P2056, ["PAST"], "Var"
    find_lex $P2057, "$/"
    unless_null $P2057, vivify_610
    $P2057 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2058, $P2057["quote_EXPR"]
    unless_null $P2058, vivify_611
    new $P2058, "Undef"
  vivify_611:
    $P2059 = $P2058."ast"()
.annotate 'line', 748
    $P2060 = "vivitype"("%")
    $P2061 = $P2056."new"($P2059, "keyed" :named("scope"), "Undef" :named("viviself"), $P2060 :named("vivibase"))
.annotate 'line', 746
    $P2062 = $P2055."!make"($P2061)
.annotate 'line', 745
    .return ($P2062)
  control_2052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2063, exception, "payload"
    .return ($P2063)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("112_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2067
.annotate 'line', 751
    new $P2066, 'ExceptionHandler'
    set_addr $P2066, control_2065
    $P2066."handle_types"(.CONTROL_RETURN)
    push_eh $P2066
    .lex "self", self
    .lex "$/", param_2067
.annotate 'line', 752
    find_lex $P2068, "$/"
    find_lex $P2069, "$/"
    unless_null $P2069, vivify_612
    $P2069 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2070, $P2069["arglist"]
    unless_null $P2070, vivify_613
    new $P2070, "Undef"
  vivify_613:
    $P2071 = $P2070."ast"()
    $P2072 = $P2068."!make"($P2071)
.annotate 'line', 751
    .return ($P2072)
  control_2065:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2073, exception, "payload"
    .return ($P2073)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("113_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2077
.annotate 'line', 755
    new $P2076, 'ExceptionHandler'
    set_addr $P2076, control_2075
    $P2076."handle_types"(.CONTROL_RETURN)
    push_eh $P2076
    .lex "self", self
    .lex "$/", param_2077
.annotate 'line', 756
    find_lex $P2078, "$/"
    find_lex $P2081, "$/"
    unless_null $P2081, vivify_614
    $P2081 = root_new ['parrot';'Hash']
  vivify_614:
    set $P2082, $P2081["quote"]
    unless_null $P2082, vivify_615
    new $P2082, "Undef"
  vivify_615:
    if $P2082, if_2080
    find_lex $P2086, "$/"
    unless_null $P2086, vivify_616
    $P2086 = root_new ['parrot';'Hash']
  vivify_616:
    set $P2087, $P2086["number"]
    unless_null $P2087, vivify_617
    new $P2087, "Undef"
  vivify_617:
    $P2088 = $P2087."ast"()
    set $P2079, $P2088
    goto if_2080_end
  if_2080:
    find_lex $P2083, "$/"
    unless_null $P2083, vivify_618
    $P2083 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2084, $P2083["quote"]
    unless_null $P2084, vivify_619
    new $P2084, "Undef"
  vivify_619:
    $P2085 = $P2084."ast"()
    set $P2079, $P2085
  if_2080_end:
    $P2089 = $P2078."!make"($P2079)
.annotate 'line', 755
    .return ($P2089)
  control_2075:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2090, exception, "payload"
    .return ($P2090)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("114_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2094
.annotate 'line', 759
    new $P2093, 'ExceptionHandler'
    set_addr $P2093, control_2092
    $P2093."handle_types"(.CONTROL_RETURN)
    push_eh $P2093
    .lex "self", self
    .lex "$/", param_2094
.annotate 'line', 760
    new $P2095, "Undef"
    .lex "$value", $P2095
    find_lex $P2098, "$/"
    unless_null $P2098, vivify_620
    $P2098 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2099, $P2098["dec_number"]
    unless_null $P2099, vivify_621
    new $P2099, "Undef"
  vivify_621:
    if $P2099, if_2097
    find_lex $P2103, "$/"
    unless_null $P2103, vivify_622
    $P2103 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2104, $P2103["integer"]
    unless_null $P2104, vivify_623
    new $P2104, "Undef"
  vivify_623:
    $P2105 = $P2104."ast"()
    set $P2096, $P2105
    goto if_2097_end
  if_2097:
    find_lex $P2100, "$/"
    unless_null $P2100, vivify_624
    $P2100 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2101, $P2100["dec_number"]
    unless_null $P2101, vivify_625
    new $P2101, "Undef"
  vivify_625:
    $P2102 = $P2101."ast"()
    set $P2096, $P2102
  if_2097_end:
    store_lex "$value", $P2096
.annotate 'line', 761
    find_lex $P2107, "$/"
    unless_null $P2107, vivify_626
    $P2107 = root_new ['parrot';'Hash']
  vivify_626:
    set $P2108, $P2107["sign"]
    unless_null $P2108, vivify_627
    new $P2108, "Undef"
  vivify_627:
    set $S2109, $P2108
    iseq $I2110, $S2109, "-"
    unless $I2110, if_2106_end
    find_lex $P2111, "$value"
    neg $P2112, $P2111
    store_lex "$value", $P2112
  if_2106_end:
.annotate 'line', 762
    find_lex $P2113, "$/"
    get_hll_global $P2114, ["PAST"], "Val"
    find_lex $P2115, "$value"
    $P2116 = $P2114."new"($P2115 :named("value"))
    $P2117 = $P2113."!make"($P2116)
.annotate 'line', 759
    .return ($P2117)
  control_2092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2118, exception, "payload"
    .return ($P2118)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("115_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2122
.annotate 'line', 765
    new $P2121, 'ExceptionHandler'
    set_addr $P2121, control_2120
    $P2121."handle_types"(.CONTROL_RETURN)
    push_eh $P2121
    .lex "self", self
    .lex "$/", param_2122
    find_lex $P2123, "$/"
    find_lex $P2124, "$/"
    unless_null $P2124, vivify_628
    $P2124 = root_new ['parrot';'Hash']
  vivify_628:
    set $P2125, $P2124["quote_EXPR"]
    unless_null $P2125, vivify_629
    new $P2125, "Undef"
  vivify_629:
    $P2126 = $P2125."ast"()
    $P2127 = $P2123."!make"($P2126)
    .return ($P2127)
  control_2120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2128, exception, "payload"
    .return ($P2128)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<dblq>"  :subid("116_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2132
.annotate 'line', 766
    new $P2131, 'ExceptionHandler'
    set_addr $P2131, control_2130
    $P2131."handle_types"(.CONTROL_RETURN)
    push_eh $P2131
    .lex "self", self
    .lex "$/", param_2132
    find_lex $P2133, "$/"
    find_lex $P2134, "$/"
    unless_null $P2134, vivify_630
    $P2134 = root_new ['parrot';'Hash']
  vivify_630:
    set $P2135, $P2134["quote_EXPR"]
    unless_null $P2135, vivify_631
    new $P2135, "Undef"
  vivify_631:
    $P2136 = $P2135."ast"()
    $P2137 = $P2133."!make"($P2136)
    .return ($P2137)
  control_2130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2138, exception, "payload"
    .return ($P2138)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<qq>"  :subid("117_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2142
.annotate 'line', 767
    new $P2141, 'ExceptionHandler'
    set_addr $P2141, control_2140
    $P2141."handle_types"(.CONTROL_RETURN)
    push_eh $P2141
    .lex "self", self
    .lex "$/", param_2142
    find_lex $P2143, "$/"
    find_lex $P2144, "$/"
    unless_null $P2144, vivify_632
    $P2144 = root_new ['parrot';'Hash']
  vivify_632:
    set $P2145, $P2144["quote_EXPR"]
    unless_null $P2145, vivify_633
    new $P2145, "Undef"
  vivify_633:
    $P2146 = $P2145."ast"()
    $P2147 = $P2143."!make"($P2146)
    .return ($P2147)
  control_2140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2148, exception, "payload"
    .return ($P2148)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<q>"  :subid("118_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2152
.annotate 'line', 768
    new $P2151, 'ExceptionHandler'
    set_addr $P2151, control_2150
    $P2151."handle_types"(.CONTROL_RETURN)
    push_eh $P2151
    .lex "self", self
    .lex "$/", param_2152
    find_lex $P2153, "$/"
    find_lex $P2154, "$/"
    unless_null $P2154, vivify_634
    $P2154 = root_new ['parrot';'Hash']
  vivify_634:
    set $P2155, $P2154["quote_EXPR"]
    unless_null $P2155, vivify_635
    new $P2155, "Undef"
  vivify_635:
    $P2156 = $P2155."ast"()
    $P2157 = $P2153."!make"($P2156)
    .return ($P2157)
  control_2150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2158, exception, "payload"
    .return ($P2158)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q>"  :subid("119_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2162
.annotate 'line', 769
    new $P2161, 'ExceptionHandler'
    set_addr $P2161, control_2160
    $P2161."handle_types"(.CONTROL_RETURN)
    push_eh $P2161
    .lex "self", self
    .lex "$/", param_2162
    find_lex $P2163, "$/"
    find_lex $P2164, "$/"
    unless_null $P2164, vivify_636
    $P2164 = root_new ['parrot';'Hash']
  vivify_636:
    set $P2165, $P2164["quote_EXPR"]
    unless_null $P2165, vivify_637
    new $P2165, "Undef"
  vivify_637:
    $P2166 = $P2165."ast"()
    $P2167 = $P2163."!make"($P2166)
    .return ($P2167)
  control_2160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2168, exception, "payload"
    .return ($P2168)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q:PIR>"  :subid("120_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2172
.annotate 'line', 770
    new $P2171, 'ExceptionHandler'
    set_addr $P2171, control_2170
    $P2171."handle_types"(.CONTROL_RETURN)
    push_eh $P2171
    .lex "self", self
    .lex "$/", param_2172
.annotate 'line', 771
    find_lex $P2173, "$/"
    get_hll_global $P2174, ["PAST"], "Op"
    find_lex $P2175, "$/"
    unless_null $P2175, vivify_638
    $P2175 = root_new ['parrot';'Hash']
  vivify_638:
    set $P2176, $P2175["quote_EXPR"]
    unless_null $P2176, vivify_639
    new $P2176, "Undef"
  vivify_639:
    $P2177 = $P2176."ast"()
    $P2178 = $P2177."value"()
    find_lex $P2179, "$/"
    $P2180 = $P2174."new"($P2178 :named("inline"), "inline" :named("pasttype"), $P2179 :named("node"))
    $P2181 = $P2173."!make"($P2180)
.annotate 'line', 770
    .return ($P2181)
  control_2170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2182, exception, "payload"
    .return ($P2182)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("121_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2186
    .param pmc param_2187 :optional
    .param int has_param_2187 :opt_flag
.annotate 'line', 776
    new $P2185, 'ExceptionHandler'
    set_addr $P2185, control_2184
    $P2185."handle_types"(.CONTROL_RETURN)
    push_eh $P2185
    .lex "self", self
    .lex "$/", param_2186
    if has_param_2187, optparam_640
    new $P2188, "Undef"
    set param_2187, $P2188
  optparam_640:
    .lex "$key", param_2187
.annotate 'line', 786
    new $P2189, "Undef"
    .lex "$regex", $P2189
.annotate 'line', 788
    new $P2190, "Undef"
    .lex "$past", $P2190
.annotate 'line', 777
    find_lex $P2192, "$key"
    set $S2193, $P2192
    iseq $I2194, $S2193, "open"
    unless $I2194, if_2191_end
.annotate 'line', 778

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 782
    get_global $P2195, "@BLOCK"
    unless_null $P2195, vivify_641
    $P2195 = root_new ['parrot';'ResizablePMCArray']
  vivify_641:
    set $P2196, $P2195[0]
    unless_null $P2196, vivify_642
    new $P2196, "Undef"
  vivify_642:
    $P2196."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 783
    get_global $P2197, "@BLOCK"
    unless_null $P2197, vivify_643
    $P2197 = root_new ['parrot';'ResizablePMCArray']
  vivify_643:
    set $P2198, $P2197[0]
    unless_null $P2198, vivify_644
    new $P2198, "Undef"
  vivify_644:
    $P2198."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 784
    new $P2199, "Exception"
    set $P2199['type'], .CONTROL_RETURN
    new $P2200, "Integer"
    assign $P2200, 0
    setattribute $P2199, 'payload', $P2200
    throw $P2199
  if_2191_end:
.annotate 'line', 787
    get_hll_global $P2201, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2202, "$/"
    unless_null $P2202, vivify_645
    $P2202 = root_new ['parrot';'Hash']
  vivify_645:
    set $P2203, $P2202["p6regex"]
    unless_null $P2203, vivify_646
    new $P2203, "Undef"
  vivify_646:
    $P2204 = $P2203."ast"()
    get_global $P2205, "@BLOCK"
    $P2206 = $P2205."shift"()
    $P2207 = $P2201($P2204, $P2206)
    store_lex "$regex", $P2207
.annotate 'line', 789
    get_hll_global $P2208, ["PAST"], "Op"
.annotate 'line', 791
    get_hll_global $P2209, ["PAST"], "Var"
    new $P2210, "ResizablePMCArray"
    push $P2210, "Regex"
    $P2211 = $P2209."new"("Regex" :named("name"), $P2210 :named("namespace"), "package" :named("scope"))
    find_lex $P2212, "$regex"
    $P2213 = $P2208."new"($P2211, $P2212, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 789
    store_lex "$past", $P2213
.annotate 'line', 795
    find_lex $P2214, "$regex"
    find_lex $P2215, "$past"
    unless_null $P2215, vivify_647
    $P2215 = root_new ['parrot';'Hash']
    store_lex "$past", $P2215
  vivify_647:
    set $P2215["sink"], $P2214
.annotate 'line', 796
    find_lex $P2216, "$/"
    find_lex $P2217, "$past"
    $P2218 = $P2216."!make"($P2217)
.annotate 'line', 776
    .return ($P2218)
  control_2184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2219, exception, "payload"
    .return ($P2219)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("122_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2223
.annotate 'line', 799
    new $P2222, 'ExceptionHandler'
    set_addr $P2222, control_2221
    $P2222."handle_types"(.CONTROL_RETURN)
    push_eh $P2222
    .lex "self", self
    .lex "$/", param_2223
    find_lex $P2224, "$/"
    find_lex $P2225, "$/"
    unless_null $P2225, vivify_648
    $P2225 = root_new ['parrot';'Hash']
  vivify_648:
    set $P2226, $P2225["variable"]
    unless_null $P2226, vivify_649
    new $P2226, "Undef"
  vivify_649:
    $P2227 = $P2226."ast"()
    $P2228 = $P2224."!make"($P2227)
    .return ($P2228)
  control_2221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2229, exception, "payload"
    .return ($P2229)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("123_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2233
.annotate 'line', 800
    new $P2232, 'ExceptionHandler'
    set_addr $P2232, control_2231
    $P2232."handle_types"(.CONTROL_RETURN)
    push_eh $P2232
    .lex "self", self
    .lex "$/", param_2233
.annotate 'line', 801
    find_lex $P2234, "$/"
    get_hll_global $P2235, ["PAST"], "Op"
.annotate 'line', 802
    find_lex $P2236, "$/"
    unless_null $P2236, vivify_650
    $P2236 = root_new ['parrot';'Hash']
  vivify_650:
    set $P2237, $P2236["block"]
    unless_null $P2237, vivify_651
    new $P2237, "Undef"
  vivify_651:
    $P2238 = $P2237."ast"()
    $P2239 = "block_immediate"($P2238)
    find_lex $P2240, "$/"
    $P2241 = $P2235."new"($P2239, "set S*" :named("pirop"), $P2240 :named("node"))
.annotate 'line', 801
    $P2242 = $P2234."!make"($P2241)
.annotate 'line', 800
    .return ($P2242)
  control_2231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2243, exception, "payload"
    .return ($P2243)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("124_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2247
.annotate 'line', 805
    new $P2246, 'ExceptionHandler'
    set_addr $P2246, control_2245
    $P2246."handle_types"(.CONTROL_RETURN)
    push_eh $P2246
    .lex "self", self
    .lex "$/", param_2247
    find_lex $P2248, "$/"
    $P2249 = $P2248."!make"("\e")
    .return ($P2249)
  control_2245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2250, exception, "payload"
    .return ($P2250)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("125_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2254
.annotate 'line', 809
    new $P2253, 'ExceptionHandler'
    set_addr $P2253, control_2252
    $P2253."handle_types"(.CONTROL_RETURN)
    push_eh $P2253
    .lex "self", self
    .lex "$/", param_2254
    find_lex $P2255, "$/"
    find_lex $P2256, "$/"
    unless_null $P2256, vivify_652
    $P2256 = root_new ['parrot';'Hash']
  vivify_652:
    set $P2257, $P2256["dotty"]
    unless_null $P2257, vivify_653
    new $P2257, "Undef"
  vivify_653:
    $P2258 = $P2257."ast"()
    $P2259 = $P2255."!make"($P2258)
    .return ($P2259)
  control_2252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2260, exception, "payload"
    .return ($P2260)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("126_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2264
.annotate 'line', 811
    new $P2263, 'ExceptionHandler'
    set_addr $P2263, control_2262
    $P2263."handle_types"(.CONTROL_RETURN)
    push_eh $P2263
    .lex "self", self
    .lex "$/", param_2264
.annotate 'line', 812
    find_lex $P2265, "$/"
    get_hll_global $P2266, ["PAST"], "Op"
.annotate 'line', 813
    new $P2267, "ResizablePMCArray"
    push $P2267, "    clone %r, %0"
    push $P2267, "    inc %0"
    $P2268 = $P2266."new"("postfix:<++>" :named("name"), $P2267 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 812
    $P2269 = $P2265."!make"($P2268)
.annotate 'line', 811
    .return ($P2269)
  control_2262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2270, exception, "payload"
    .return ($P2270)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("127_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2274
.annotate 'line', 817
    new $P2273, 'ExceptionHandler'
    set_addr $P2273, control_2272
    $P2273."handle_types"(.CONTROL_RETURN)
    push_eh $P2273
    .lex "self", self
    .lex "$/", param_2274
.annotate 'line', 818
    find_lex $P2275, "$/"
    get_hll_global $P2276, ["PAST"], "Op"
.annotate 'line', 819
    new $P2277, "ResizablePMCArray"
    push $P2277, "    clone %r, %0"
    push $P2277, "    dec %0"
    $P2278 = $P2276."new"("postfix:<-->" :named("name"), $P2277 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 818
    $P2279 = $P2275."!make"($P2278)
.annotate 'line', 817
    .return ($P2279)
  control_2272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2280, exception, "payload"
    .return ($P2280)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("128_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2284
.annotate 'line', 823
    new $P2283, 'ExceptionHandler'
    set_addr $P2283, control_2282
    $P2283."handle_types"(.CONTROL_RETURN)
    push_eh $P2283
    .lex "self", self
    .lex "$/", param_2284
.annotate 'line', 824
    find_lex $P2285, "$/"
    get_hll_global $P2286, ["PAST"], "Op"
.annotate 'line', 825
    get_hll_global $P2287, ["PAST"], "Var"
    $P2288 = $P2287."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2289, "$/"
    $P2290 = $P2286."new"($P2288, "callmethod" :named("pasttype"), "!make" :named("name"), $P2289 :named("node"))
.annotate 'line', 824
    $P2291 = $P2285."!make"($P2290)
.annotate 'line', 823
    .return ($P2291)
  control_2282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2292, exception, "payload"
    .return ($P2292)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("129_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2297
.annotate 'line', 841
    new $P2296, 'ExceptionHandler'
    set_addr $P2296, control_2295
    $P2296."handle_types"(.CONTROL_RETURN)
    push_eh $P2296
    .lex "self", self
    .lex "$/", param_2297
    find_lex $P2298, "$/"
    $P2299 = "control"($P2298, "CONTROL_LOOP_NEXT")
    .return ($P2299)
  control_2295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2300, exception, "payload"
    .return ($P2300)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("130_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2304
.annotate 'line', 842
    new $P2303, 'ExceptionHandler'
    set_addr $P2303, control_2302
    $P2303."handle_types"(.CONTROL_RETURN)
    push_eh $P2303
    .lex "self", self
    .lex "$/", param_2304
    find_lex $P2305, "$/"
    $P2306 = "control"($P2305, "CONTROL_LOOP_LAST")
    .return ($P2306)
  control_2302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2307, exception, "payload"
    .return ($P2307)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("131_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2311
.annotate 'line', 843
    new $P2310, 'ExceptionHandler'
    set_addr $P2310, control_2309
    $P2310."handle_types"(.CONTROL_RETURN)
    push_eh $P2310
    .lex "self", self
    .lex "$/", param_2311
    find_lex $P2312, "$/"
    $P2313 = "control"($P2312, "CONTROL_LOOP_REDO")
    .return ($P2313)
  control_2309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2314, exception, "payload"
    .return ($P2314)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("132_1279589176.27948") :method :outer("11_1279589176.27948")
    .param pmc param_2318
.annotate 'line', 845
    new $P2317, 'ExceptionHandler'
    set_addr $P2317, control_2316
    $P2317."handle_types"(.CONTROL_RETURN)
    push_eh $P2317
    .lex "self", self
    .lex "$/", param_2318
.annotate 'line', 846
    find_lex $P2319, "$/"
    get_hll_global $P2320, ["PAST"], "Op"
    find_lex $P2321, "$/"
    $P2322 = $P2320."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2321 :named("node"))
    $P2323 = $P2319."!make"($P2322)
.annotate 'line', 845
    .return ($P2323)
  control_2316:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2324, exception, "payload"
    .return ($P2324)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2325"  :subid("133_1279589176.27948") :outer("11_1279589176.27948")
.annotate 'line', 850
    .const 'Sub' $P2411 = "140_1279589176.27948" 
    capture_lex $P2411
    .const 'Sub' $P2398 = "139_1279589176.27948" 
    capture_lex $P2398
    .const 'Sub' $P2381 = "138_1279589176.27948" 
    capture_lex $P2381
    .const 'Sub' $P2368 = "137_1279589176.27948" 
    capture_lex $P2368
    .const 'Sub' $P2355 = "136_1279589176.27948" 
    capture_lex $P2355
    .const 'Sub' $P2342 = "135_1279589176.27948" 
    capture_lex $P2342
    .const 'Sub' $P2327 = "134_1279589176.27948" 
    capture_lex $P2327
.annotate 'line', 884
    .const 'Sub' $P2411 = "140_1279589176.27948" 
    newclosure $P2436, $P2411
.annotate 'line', 850
    .return ($P2436)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("134_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2330
.annotate 'line', 852
    new $P2329, 'ExceptionHandler'
    set_addr $P2329, control_2328
    $P2329."handle_types"(.CONTROL_RETURN)
    push_eh $P2329
    .lex "self", self
    .lex "$/", param_2330
.annotate 'line', 853
    new $P2331, "Undef"
    .lex "$past", $P2331
    find_lex $P2332, "$/"
    unless_null $P2332, vivify_654
    $P2332 = root_new ['parrot';'Hash']
  vivify_654:
    set $P2333, $P2332["statement"]
    unless_null $P2333, vivify_655
    new $P2333, "Undef"
  vivify_655:
    $P2334 = $P2333."ast"()
    store_lex "$past", $P2334
.annotate 'line', 854
    find_lex $P2335, "$/"
    get_hll_global $P2336, ["PAST"], "Regex"
    find_lex $P2337, "$past"
    find_lex $P2338, "$/"
    $P2339 = $P2336."new"($P2337, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P2338 :named("node"))
    $P2340 = $P2335."!make"($P2339)
.annotate 'line', 852
    .return ($P2340)
  control_2328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2341, exception, "payload"
    .return ($P2341)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("135_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2345
.annotate 'line', 858
    new $P2344, 'ExceptionHandler'
    set_addr $P2344, control_2343
    $P2344."handle_types"(.CONTROL_RETURN)
    push_eh $P2344
    .lex "self", self
    .lex "$/", param_2345
.annotate 'line', 859
    find_lex $P2346, "$/"
    get_hll_global $P2347, ["PAST"], "Regex"
    find_lex $P2348, "$/"
    unless_null $P2348, vivify_656
    $P2348 = root_new ['parrot';'Hash']
  vivify_656:
    set $P2349, $P2348["codeblock"]
    unless_null $P2349, vivify_657
    new $P2349, "Undef"
  vivify_657:
    $P2350 = $P2349."ast"()
    find_lex $P2351, "$/"
    $P2352 = $P2347."new"($P2350, "pastnode" :named("pasttype"), $P2351 :named("node"))
    $P2353 = $P2346."!make"($P2352)
.annotate 'line', 858
    .return ($P2353)
  control_2343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2354, exception, "payload"
    .return ($P2354)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("136_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2358
.annotate 'line', 863
    new $P2357, 'ExceptionHandler'
    set_addr $P2357, control_2356
    $P2357."handle_types"(.CONTROL_RETURN)
    push_eh $P2357
    .lex "self", self
    .lex "$/", param_2358
.annotate 'line', 864
    find_lex $P2359, "$/"
    get_hll_global $P2360, ["PAST"], "Regex"
    find_lex $P2361, "$/"
    unless_null $P2361, vivify_658
    $P2361 = root_new ['parrot';'Hash']
  vivify_658:
    set $P2362, $P2361["var"]
    unless_null $P2362, vivify_659
    new $P2362, "Undef"
  vivify_659:
    $P2363 = $P2362."ast"()
    find_lex $P2364, "$/"
    $P2365 = $P2360."new"("!INTERPOLATE", $P2363, "subrule" :named("pasttype"), "method" :named("subtype"), $P2364 :named("node"))
    $P2366 = $P2359."!make"($P2365)
.annotate 'line', 863
    .return ($P2366)
  control_2356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2367, exception, "payload"
    .return ($P2367)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("137_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2371
.annotate 'line', 868
    new $P2370, 'ExceptionHandler'
    set_addr $P2370, control_2369
    $P2370."handle_types"(.CONTROL_RETURN)
    push_eh $P2370
    .lex "self", self
    .lex "$/", param_2371
.annotate 'line', 869
    find_lex $P2372, "$/"
    get_hll_global $P2373, ["PAST"], "Regex"
    find_lex $P2374, "$/"
    unless_null $P2374, vivify_660
    $P2374 = root_new ['parrot';'Hash']
  vivify_660:
    set $P2375, $P2374["codeblock"]
    unless_null $P2375, vivify_661
    new $P2375, "Undef"
  vivify_661:
    $P2376 = $P2375."ast"()
    find_lex $P2377, "$/"
    $P2378 = $P2373."new"("!INTERPOLATE_REGEX", $P2376, "subrule" :named("pasttype"), "method" :named("subtype"), $P2377 :named("node"))
    $P2379 = $P2372."!make"($P2378)
.annotate 'line', 868
    .return ($P2379)
  control_2369:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2380, exception, "payload"
    .return ($P2380)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("138_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2384
.annotate 'line', 873
    new $P2383, 'ExceptionHandler'
    set_addr $P2383, control_2382
    $P2383."handle_types"(.CONTROL_RETURN)
    push_eh $P2383
    .lex "self", self
    .lex "$/", param_2384
.annotate 'line', 874
    find_lex $P2385, "$/"
    get_hll_global $P2386, ["PAST"], "Regex"
    find_lex $P2387, "$/"
    unless_null $P2387, vivify_662
    $P2387 = root_new ['parrot';'Hash']
  vivify_662:
    set $P2388, $P2387["codeblock"]
    unless_null $P2388, vivify_663
    new $P2388, "Undef"
  vivify_663:
    $P2389 = $P2388."ast"()
.annotate 'line', 875
    find_lex $P2390, "$/"
    unless_null $P2390, vivify_664
    $P2390 = root_new ['parrot';'Hash']
  vivify_664:
    set $P2391, $P2390["zw"]
    unless_null $P2391, vivify_665
    new $P2391, "Undef"
  vivify_665:
    set $S2392, $P2391
    iseq $I2393, $S2392, "!"
    find_lex $P2394, "$/"
    $P2395 = $P2386."new"($P2389, "zerowidth" :named("subtype"), $I2393 :named("negate"), "pastnode" :named("pasttype"), $P2394 :named("node"))
.annotate 'line', 874
    $P2396 = $P2385."!make"($P2395)
.annotate 'line', 873
    .return ($P2396)
  control_2382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2397, exception, "payload"
    .return ($P2397)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("139_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2401
.annotate 'line', 879
    new $P2400, 'ExceptionHandler'
    set_addr $P2400, control_2399
    $P2400."handle_types"(.CONTROL_RETURN)
    push_eh $P2400
    .lex "self", self
    .lex "$/", param_2401
.annotate 'line', 880
    find_lex $P2402, "$/"
    get_hll_global $P2403, ["PAST"], "Regex"
    find_lex $P2404, "$/"
    unless_null $P2404, vivify_666
    $P2404 = root_new ['parrot';'Hash']
  vivify_666:
    set $P2405, $P2404["var"]
    unless_null $P2405, vivify_667
    new $P2405, "Undef"
  vivify_667:
    $P2406 = $P2405."ast"()
    find_lex $P2407, "$/"
    $P2408 = $P2403."new"("!INTERPOLATE_REGEX", $P2406, "subrule" :named("pasttype"), "method" :named("subtype"), $P2407 :named("node"))
    $P2409 = $P2402."!make"($P2408)
.annotate 'line', 879
    .return ($P2409)
  control_2399:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2410, exception, "payload"
    .return ($P2410)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("140_1279589176.27948") :method :outer("133_1279589176.27948")
    .param pmc param_2414
.annotate 'line', 884
    new $P2413, 'ExceptionHandler'
    set_addr $P2413, control_2412
    $P2413."handle_types"(.CONTROL_RETURN)
    push_eh $P2413
    .lex "self", self
    .lex "$/", param_2414
.annotate 'line', 885
    new $P2415, "Undef"
    .lex "$block", $P2415
.annotate 'line', 887
    new $P2416, "Undef"
    .lex "$past", $P2416
.annotate 'line', 885
    find_lex $P2417, "$/"
    unless_null $P2417, vivify_668
    $P2417 = root_new ['parrot';'Hash']
  vivify_668:
    set $P2418, $P2417["block"]
    unless_null $P2418, vivify_669
    new $P2418, "Undef"
  vivify_669:
    $P2419 = $P2418."ast"()
    store_lex "$block", $P2419
.annotate 'line', 886
    find_lex $P2420, "$block"
    $P2420."blocktype"("immediate")
.annotate 'line', 888
    get_hll_global $P2421, ["PAST"], "Stmts"
.annotate 'line', 889
    get_hll_global $P2422, ["PAST"], "Op"
.annotate 'line', 890
    get_hll_global $P2423, ["PAST"], "Var"
    $P2424 = $P2423."new"("$/" :named("name"))
.annotate 'line', 891
    get_hll_global $P2425, ["PAST"], "Op"
.annotate 'line', 892
    get_hll_global $P2426, ["PAST"], "Var"
    $P2427 = $P2426."new"(unicode:"$\x{a2}" :named("name"))
    $P2428 = $P2425."new"($P2427, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 891
    $P2429 = $P2422."new"($P2424, $P2428, "bind" :named("pasttype"))
.annotate 'line', 889
    find_lex $P2430, "$block"
    $P2431 = $P2421."new"($P2429, $P2430)
.annotate 'line', 888
    store_lex "$past", $P2431
.annotate 'line', 900
    find_lex $P2432, "$/"
    find_lex $P2433, "$past"
    $P2434 = $P2432."!make"($P2433)
.annotate 'line', 884
    .return ($P2434)
  control_2412:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2435, exception, "payload"
    .return ($P2435)
.end


.namespace ["NQP";"Actions"]
.sub "_block2438" :load :anon :subid("141_1279589176.27948")
.annotate 'line', 3
    .const 'Sub' $P2440 = "11_1279589176.27948" 
    $P2441 = $P2440()
    .return ($P2441)
.end


.namespace []
.sub "_block2448" :load :anon :subid("143_1279589176.27948")
.annotate 'line', 1
    .const 'Sub' $P2450 = "10_1279589176.27948" 
    $P2451 = $P2450()
    .return ($P2451)
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
