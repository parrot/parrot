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
.sub "_block11"  :anon :subid("10_1275811487.95429")
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
    $P1424 = $P14()
.annotate 'line', 1
    .return ($P1424)
    .const 'Sub' $P1426 = "363_1275811487.95429" 
    .return ($P1426)
.end


.namespace []
.sub "" :load :init :subid("post364") :outer("10_1275811487.95429")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275811487.95429" 
    .local pmc block
    set block, $P12
    $P1429 = get_root_global ["parrot"], "P6metaclass"
    $P1429."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1275811487.95429") :outer("10_1275811487.95429")
.annotate 'line', 4
    get_hll_global $P1340, ["NQP";"Regex"], "_block1339" 
    capture_lex $P1340
    .const 'Sub' $P1326 = "340_1275811487.95429" 
    capture_lex $P1326
    .const 'Sub' $P1320 = "338_1275811487.95429" 
    capture_lex $P1320
    .const 'Sub' $P1314 = "336_1275811487.95429" 
    capture_lex $P1314
    .const 'Sub' $P1308 = "334_1275811487.95429" 
    capture_lex $P1308
    .const 'Sub' $P1302 = "332_1275811487.95429" 
    capture_lex $P1302
    .const 'Sub' $P1296 = "330_1275811487.95429" 
    capture_lex $P1296
    .const 'Sub' $P1289 = "328_1275811487.95429" 
    capture_lex $P1289
    .const 'Sub' $P1282 = "326_1275811487.95429" 
    capture_lex $P1282
    .const 'Sub' $P1275 = "324_1275811487.95429" 
    capture_lex $P1275
    .const 'Sub' $P1268 = "322_1275811487.95429" 
    capture_lex $P1268
    .const 'Sub' $P1262 = "320_1275811487.95429" 
    capture_lex $P1262
    .const 'Sub' $P1255 = "318_1275811487.95429" 
    capture_lex $P1255
    .const 'Sub' $P1248 = "316_1275811487.95429" 
    capture_lex $P1248
    .const 'Sub' $P1241 = "314_1275811487.95429" 
    capture_lex $P1241
    .const 'Sub' $P1234 = "312_1275811487.95429" 
    capture_lex $P1234
    .const 'Sub' $P1227 = "310_1275811487.95429" 
    capture_lex $P1227
    .const 'Sub' $P1220 = "308_1275811487.95429" 
    capture_lex $P1220
    .const 'Sub' $P1213 = "306_1275811487.95429" 
    capture_lex $P1213
    .const 'Sub' $P1206 = "304_1275811487.95429" 
    capture_lex $P1206
    .const 'Sub' $P1199 = "302_1275811487.95429" 
    capture_lex $P1199
    .const 'Sub' $P1192 = "300_1275811487.95429" 
    capture_lex $P1192
    .const 'Sub' $P1185 = "298_1275811487.95429" 
    capture_lex $P1185
    .const 'Sub' $P1178 = "296_1275811487.95429" 
    capture_lex $P1178
    .const 'Sub' $P1171 = "294_1275811487.95429" 
    capture_lex $P1171
    .const 'Sub' $P1164 = "292_1275811487.95429" 
    capture_lex $P1164
    .const 'Sub' $P1157 = "290_1275811487.95429" 
    capture_lex $P1157
    .const 'Sub' $P1150 = "288_1275811487.95429" 
    capture_lex $P1150
    .const 'Sub' $P1143 = "286_1275811487.95429" 
    capture_lex $P1143
    .const 'Sub' $P1136 = "284_1275811487.95429" 
    capture_lex $P1136
    .const 'Sub' $P1129 = "282_1275811487.95429" 
    capture_lex $P1129
    .const 'Sub' $P1122 = "280_1275811487.95429" 
    capture_lex $P1122
    .const 'Sub' $P1115 = "278_1275811487.95429" 
    capture_lex $P1115
    .const 'Sub' $P1108 = "276_1275811487.95429" 
    capture_lex $P1108
    .const 'Sub' $P1101 = "274_1275811487.95429" 
    capture_lex $P1101
    .const 'Sub' $P1094 = "272_1275811487.95429" 
    capture_lex $P1094
    .const 'Sub' $P1087 = "270_1275811487.95429" 
    capture_lex $P1087
    .const 'Sub' $P1080 = "268_1275811487.95429" 
    capture_lex $P1080
    .const 'Sub' $P1074 = "266_1275811487.95429" 
    capture_lex $P1074
    .const 'Sub' $P1067 = "264_1275811487.95429" 
    capture_lex $P1067
    .const 'Sub' $P1060 = "262_1275811487.95429" 
    capture_lex $P1060
    .const 'Sub' $P1053 = "260_1275811487.95429" 
    capture_lex $P1053
    .const 'Sub' $P1046 = "258_1275811487.95429" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "256_1275811487.95429" 
    capture_lex $P1039
    .const 'Sub' $P1032 = "254_1275811487.95429" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "252_1275811487.95429" 
    capture_lex $P1025
    .const 'Sub' $P1019 = "250_1275811487.95429" 
    capture_lex $P1019
    .const 'Sub' $P1013 = "248_1275811487.95429" 
    capture_lex $P1013
    .const 'Sub' $P1008 = "246_1275811487.95429" 
    capture_lex $P1008
    .const 'Sub' $P1002 = "244_1275811487.95429" 
    capture_lex $P1002
    .const 'Sub' $P996 = "242_1275811487.95429" 
    capture_lex $P996
    .const 'Sub' $P991 = "240_1275811487.95429" 
    capture_lex $P991
    .const 'Sub' $P986 = "238_1275811487.95429" 
    capture_lex $P986
    .const 'Sub' $P978 = "236_1275811487.95429" 
    capture_lex $P978
    .const 'Sub' $P970 = "234_1275811487.95429" 
    capture_lex $P970
    .const 'Sub' $P965 = "232_1275811487.95429" 
    capture_lex $P965
    .const 'Sub' $P960 = "230_1275811487.95429" 
    capture_lex $P960
    .const 'Sub' $P955 = "228_1275811487.95429" 
    capture_lex $P955
    .const 'Sub' $P947 = "226_1275811487.95429" 
    capture_lex $P947
    .const 'Sub' $P939 = "224_1275811487.95429" 
    capture_lex $P939
    .const 'Sub' $P934 = "222_1275811487.95429" 
    capture_lex $P934
    .const 'Sub' $P929 = "220_1275811487.95429" 
    capture_lex $P929
    .const 'Sub' $P924 = "218_1275811487.95429" 
    capture_lex $P924
    .const 'Sub' $P918 = "216_1275811487.95429" 
    capture_lex $P918
    .const 'Sub' $P912 = "214_1275811487.95429" 
    capture_lex $P912
    .const 'Sub' $P906 = "212_1275811487.95429" 
    capture_lex $P906
    .const 'Sub' $P900 = "210_1275811487.95429" 
    capture_lex $P900
    .const 'Sub' $P894 = "208_1275811487.95429" 
    capture_lex $P894
    .const 'Sub' $P889 = "206_1275811487.95429" 
    capture_lex $P889
    .const 'Sub' $P884 = "204_1275811487.95429" 
    capture_lex $P884
    .const 'Sub' $P871 = "200_1275811487.95429" 
    capture_lex $P871
    .const 'Sub' $P863 = "198_1275811487.95429" 
    capture_lex $P863
    .const 'Sub' $P857 = "196_1275811487.95429" 
    capture_lex $P857
    .const 'Sub' $P850 = "194_1275811487.95429" 
    capture_lex $P850
    .const 'Sub' $P844 = "192_1275811487.95429" 
    capture_lex $P844
    .const 'Sub' $P836 = "190_1275811487.95429" 
    capture_lex $P836
    .const 'Sub' $P828 = "188_1275811487.95429" 
    capture_lex $P828
    .const 'Sub' $P822 = "186_1275811487.95429" 
    capture_lex $P822
    .const 'Sub' $P816 = "184_1275811487.95429" 
    capture_lex $P816
    .const 'Sub' $P801 = "180_1275811487.95429" 
    capture_lex $P801
    .const 'Sub' $P763 = "178_1275811487.95429" 
    capture_lex $P763
    .const 'Sub' $P754 = "176_1275811487.95429" 
    capture_lex $P754
    .const 'Sub' $P748 = "174_1275811487.95429" 
    capture_lex $P748
    .const 'Sub' $P738 = "172_1275811487.95429" 
    capture_lex $P738
    .const 'Sub' $P724 = "170_1275811487.95429" 
    capture_lex $P724
    .const 'Sub' $P715 = "168_1275811487.95429" 
    capture_lex $P715
    .const 'Sub' $P707 = "166_1275811487.95429" 
    capture_lex $P707
    .const 'Sub' $P697 = "164_1275811487.95429" 
    capture_lex $P697
    .const 'Sub' $P673 = "160_1275811487.95429" 
    capture_lex $P673
    .const 'Sub' $P648 = "158_1275811487.95429" 
    capture_lex $P648
    .const 'Sub' $P641 = "156_1275811487.95429" 
    capture_lex $P641
    .const 'Sub' $P634 = "154_1275811487.95429" 
    capture_lex $P634
    .const 'Sub' $P624 = "150_1275811487.95429" 
    capture_lex $P624
    .const 'Sub' $P616 = "148_1275811487.95429" 
    capture_lex $P616
    .const 'Sub' $P610 = "146_1275811487.95429" 
    capture_lex $P610
    .const 'Sub' $P597 = "144_1275811487.95429" 
    capture_lex $P597
    .const 'Sub' $P590 = "142_1275811487.95429" 
    capture_lex $P590
    .const 'Sub' $P583 = "140_1275811487.95429" 
    capture_lex $P583
    .const 'Sub' $P576 = "138_1275811487.95429" 
    capture_lex $P576
    .const 'Sub' $P548 = "134_1275811487.95429" 
    capture_lex $P548
    .const 'Sub' $P539 = "132_1275811487.95429" 
    capture_lex $P539
    .const 'Sub' $P532 = "130_1275811487.95429" 
    capture_lex $P532
    .const 'Sub' $P523 = "126_1275811487.95429" 
    capture_lex $P523
    .const 'Sub' $P518 = "124_1275811487.95429" 
    capture_lex $P518
    .const 'Sub' $P506 = "122_1275811487.95429" 
    capture_lex $P506
    .const 'Sub' $P494 = "120_1275811487.95429" 
    capture_lex $P494
    .const 'Sub' $P486 = "118_1275811487.95429" 
    capture_lex $P486
    .const 'Sub' $P481 = "116_1275811487.95429" 
    capture_lex $P481
    .const 'Sub' $P475 = "114_1275811487.95429" 
    capture_lex $P475
    .const 'Sub' $P469 = "112_1275811487.95429" 
    capture_lex $P469
    .const 'Sub' $P459 = "109_1275811487.95429" 
    capture_lex $P459
    .const 'Sub' $P453 = "107_1275811487.95429" 
    capture_lex $P453
    .const 'Sub' $P447 = "105_1275811487.95429" 
    capture_lex $P447
    .const 'Sub' $P441 = "103_1275811487.95429" 
    capture_lex $P441
    .const 'Sub' $P435 = "101_1275811487.95429" 
    capture_lex $P435
    .const 'Sub' $P429 = "99_1275811487.95429" 
    capture_lex $P429
    .const 'Sub' $P423 = "97_1275811487.95429" 
    capture_lex $P423
    .const 'Sub' $P414 = "95_1275811487.95429" 
    capture_lex $P414
    .const 'Sub' $P405 = "93_1275811487.95429" 
    capture_lex $P405
    .const 'Sub' $P392 = "89_1275811487.95429" 
    capture_lex $P392
    .const 'Sub' $P383 = "87_1275811487.95429" 
    capture_lex $P383
    .const 'Sub' $P373 = "83_1275811487.95429" 
    capture_lex $P373
    .const 'Sub' $P366 = "81_1275811487.95429" 
    capture_lex $P366
    .const 'Sub' $P359 = "79_1275811487.95429" 
    capture_lex $P359
    .const 'Sub' $P347 = "75_1275811487.95429" 
    capture_lex $P347
    .const 'Sub' $P339 = "73_1275811487.95429" 
    capture_lex $P339
    .const 'Sub' $P331 = "71_1275811487.95429" 
    capture_lex $P331
    .const 'Sub' $P311 = "69_1275811487.95429" 
    capture_lex $P311
    .const 'Sub' $P302 = "67_1275811487.95429" 
    capture_lex $P302
    .const 'Sub' $P284 = "64_1275811487.95429" 
    capture_lex $P284
    .const 'Sub' $P264 = "62_1275811487.95429" 
    capture_lex $P264
    .const 'Sub' $P255 = "58_1275811487.95429" 
    capture_lex $P255
    .const 'Sub' $P250 = "56_1275811487.95429" 
    capture_lex $P250
    .const 'Sub' $P241 = "52_1275811487.95429" 
    capture_lex $P241
    .const 'Sub' $P236 = "50_1275811487.95429" 
    capture_lex $P236
    .const 'Sub' $P231 = "48_1275811487.95429" 
    capture_lex $P231
    .const 'Sub' $P223 = "46_1275811487.95429" 
    capture_lex $P223
    .const 'Sub' $P216 = "44_1275811487.95429" 
    capture_lex $P216
    .const 'Sub' $P210 = "42_1275811487.95429" 
    capture_lex $P210
    .const 'Sub' $P202 = "40_1275811487.95429" 
    capture_lex $P202
    .const 'Sub' $P196 = "38_1275811487.95429" 
    capture_lex $P196
    .const 'Sub' $P190 = "36_1275811487.95429" 
    capture_lex $P190
    .const 'Sub' $P174 = "33_1275811487.95429" 
    capture_lex $P174
    .const 'Sub' $P159 = "31_1275811487.95429" 
    capture_lex $P159
    .const 'Sub' $P152 = "29_1275811487.95429" 
    capture_lex $P152
    .const 'Sub' $P102 = "26_1275811487.95429" 
    capture_lex $P102
    .const 'Sub' $P84 = "23_1275811487.95429" 
    capture_lex $P84
    .const 'Sub' $P70 = "21_1275811487.95429" 
    capture_lex $P70
    .const 'Sub' $P56 = "19_1275811487.95429" 
    capture_lex $P56
    .const 'Sub' $P48 = "17_1275811487.95429" 
    capture_lex $P48
    .const 'Sub' $P41 = "15_1275811487.95429" 
    capture_lex $P41
    .const 'Sub' $P35 = "13_1275811487.95429" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1275811487.95429" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 563
    get_hll_global $P1340, ["NQP";"Regex"], "_block1339" 
    capture_lex $P1340
    $P1403 = $P1340()
.annotate 'line', 4
    .return ($P1403)
    .const 'Sub' $P1405 = "362_1275811487.95429" 
    .return ($P1405)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post365") :outer("11_1275811487.95429")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 447
    get_hll_global $P1408, ["NQP"], "Grammar"
    $P1408."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 448
    get_hll_global $P1409, ["NQP"], "Grammar"
    $P1409."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 449
    get_hll_global $P1410, ["NQP"], "Grammar"
    $P1410."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 450
    get_hll_global $P1411, ["NQP"], "Grammar"
    $P1411."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 451
    get_hll_global $P1412, ["NQP"], "Grammar"
    $P1412."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 452
    get_hll_global $P1413, ["NQP"], "Grammar"
    $P1413."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 453
    get_hll_global $P1414, ["NQP"], "Grammar"
    $P1414."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 454
    get_hll_global $P1415, ["NQP"], "Grammar"
    $P1415."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 455
    get_hll_global $P1416, ["NQP"], "Grammar"
    $P1416."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 456
    get_hll_global $P1417, ["NQP"], "Grammar"
    $P1417."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 457
    get_hll_global $P1418, ["NQP"], "Grammar"
    $P1418."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 458
    get_hll_global $P1419, ["NQP"], "Grammar"
    $P1419."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 459
    get_hll_global $P1420, ["NQP"], "Grammar"
    $P1420."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 460
    get_hll_global $P1421, ["NQP"], "Grammar"
    $P1421."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 461
    get_hll_global $P1422, ["NQP"], "Grammar"
    $P1422."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 446
    $P1423 = get_root_global ["parrot"], "P6metaclass"
    $P1423."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "identifier"  :subid("13_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__identifier"  :subid("14_1275811487.95429") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__name"  :subid("16_1275811487.95429") :method
.annotate 'line', 4
    new $P44, "ResizablePMCArray"
    push $P44, ""
    .return ($P44)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__deflongname"  :subid("18_1275811487.95429") :method
.annotate 'line', 4
    $P51 = self."!PREFIX__!subrule"("identifier", "")
    new $P52, "ResizablePMCArray"
    push $P52, $P51
    .return ($P52)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1275811487.95429") :method
.annotate 'line', 4
    new $P59, "ResizablePMCArray"
    push $P59, ""
    .return ($P59)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__ws"  :subid("22_1275811487.95429") :method
.annotate 'line', 4
    new $P73, "ResizablePMCArray"
    push $P73, ""
    push $P73, ""
    .return ($P73)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P92 = "25_1275811487.95429" 
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
    .const 'Sub' $P92 = "25_1275811487.95429" 
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
.sub "!PREFIX__unv"  :subid("24_1275811487.95429") :method
.annotate 'line', 4
    new $P87, "ResizablePMCArray"
    push $P87, ""
    push $P87, ""
    push $P87, ""
    .return ($P87)
.end


.namespace ["NQP";"Grammar"]
.sub "_block91"  :anon :subid("25_1275811487.95429") :method :outer("23_1275811487.95429")
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
.sub "pod_comment"  :subid("26_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P143 = "28_1275811487.95429" 
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
    .const 'Sub' $P143 = "28_1275811487.95429" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1275811487.95429") :method
.annotate 'line', 4
    new $P105, "ResizablePMCArray"
    push $P105, ""
    .return ($P105)
.end


.namespace ["NQP";"Grammar"]
.sub "_block142"  :anon :subid("28_1275811487.95429") :method :outer("26_1275811487.95429")
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
.sub "comp_unit"  :subid("29_1275811487.95429") :method :outer("11_1275811487.95429")
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
.sub "!PREFIX__comp_unit"  :subid("30_1275811487.95429") :method
.annotate 'line', 4
    $P155 = self."!PREFIX__!subrule"("newpad", "")
    new $P156, "ResizablePMCArray"
    push $P156, $P155
    .return ($P156)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1275811487.95429") :method :outer("11_1275811487.95429")
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
    ne $I10, -1, rxscan165_done
    goto rxscan165_scan
  rxscan165_loop:
    ($P10) = rx160_cur."from"()
    inc $P10
    set rx160_pos, $P10
    ge rx160_pos, rx160_eos, rxscan165_done
  rxscan165_scan:
    set_addr $I10, rxscan165_loop
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
  rxscan165_done:
  alt166_0:
.annotate 'line', 90
    set_addr $I10, alt166_1
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
    goto alt166_end
  alt166_1:
.annotate 'line', 92
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  # rx rxquantr170 ** 0..*
    set_addr $I172, rxquantr170_done
    rx160_cur."!mark_push"(0, rx160_pos, $I172)
  rxquantr170_loop:
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
    (rx160_rep) = rx160_cur."!mark_commit"($I172)
    rx160_cur."!mark_push"(rx160_rep, rx160_pos, $I172)
    goto rxquantr170_loop
  rxquantr170_done:
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
  alt166_end:
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
.sub "!PREFIX__statementlist"  :subid("32_1275811487.95429") :method
.annotate 'line', 4
    $P162 = self."!PREFIX__!subrule"("ws", "")
    $P163 = self."!PREFIX__!subrule"("ws", "")
    new $P164, "ResizablePMCArray"
    push $P164, $P162
    push $P164, $P163
    .return ($P164)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P180 = "35_1275811487.95429" 
    capture_lex $P180
    .local string rx175_tgt
    .local int rx175_pos
    .local int rx175_off
    .local int rx175_eos
    .local int rx175_rep
    .local pmc rx175_cur
    (rx175_cur, rx175_pos, rx175_tgt) = self."!cursor_start"()
    rx175_cur."!cursor_debug"("START ", "statement")
    rx175_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx175_cur
    .local pmc match
    .lex "$/", match
    length rx175_eos, rx175_tgt
    gt rx175_pos, rx175_eos, rx175_done
    set rx175_off, 0
    lt rx175_pos, 2, rx175_start
    sub rx175_off, rx175_pos, 1
    substr rx175_tgt, rx175_tgt, rx175_off
  rx175_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan178_done
    goto rxscan178_scan
  rxscan178_loop:
    ($P10) = rx175_cur."from"()
    inc $P10
    set rx175_pos, $P10
    ge rx175_pos, rx175_eos, rxscan178_done
  rxscan178_scan:
    set_addr $I10, rxscan178_loop
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
  rxscan178_done:
.annotate 'line', 96
  # rx subrule "before" subtype=zerowidth negate=1
    rx175_cur."!cursor_pos"(rx175_pos)
    .const 'Sub' $P180 = "35_1275811487.95429" 
    capture_lex $P180
    $P10 = rx175_cur."before"($P180)
    if $P10, rx175_fail
  alt184_0:
.annotate 'line', 97
    set_addr $I10, alt184_1
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
.annotate 'line', 98
  # rx subrule "statement_control" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."statement_control"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx175_pos = $P10."pos"()
    goto alt184_end
  alt184_1:
.annotate 'line', 99
  # rx subrule "EXPR" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."EXPR"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx175_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."ws"()
    unless $P10, rx175_fail
    rx175_pos = $P10."pos"()
.annotate 'line', 104
  # rx rxquantr185 ** 0..1
    set_addr $I189, rxquantr185_done
    rx175_cur."!mark_push"(0, rx175_pos, $I189)
  rxquantr185_loop:
  alt186_0:
.annotate 'line', 100
    set_addr $I10, alt186_1
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
.annotate 'line', 101
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."MARKED"("endstmt")
    unless $P10, rx175_fail
    goto alt186_end
  alt186_1:
    set_addr $I10, alt186_2
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
.annotate 'line', 102
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."statement_mod_cond"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx175_pos = $P10."pos"()
  # rx rxquantr187 ** 0..1
    set_addr $I188, rxquantr187_done
    rx175_cur."!mark_push"(0, rx175_pos, $I188)
  rxquantr187_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."statement_mod_loop"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx175_pos = $P10."pos"()
    (rx175_rep) = rx175_cur."!mark_commit"($I188)
  rxquantr187_done:
    goto alt186_end
  alt186_2:
.annotate 'line', 103
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."statement_mod_loop"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx175_pos = $P10."pos"()
  alt186_end:
.annotate 'line', 104
    (rx175_rep) = rx175_cur."!mark_commit"($I189)
  rxquantr185_done:
  alt184_end:
.annotate 'line', 95
  # rx pass
    rx175_cur."!cursor_pass"(rx175_pos, "statement")
    rx175_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx175_pos)
    .return (rx175_cur)
  rx175_fail:
.annotate 'line', 4
    (rx175_rep, rx175_pos, $I10, $P10) = rx175_cur."!mark_fail"(0)
    lt rx175_pos, -1, rx175_done
    eq rx175_pos, -1, rx175_fail
    jump $I10
  rx175_done:
    rx175_cur."!cursor_fail"()
    rx175_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx175_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1275811487.95429") :method
.annotate 'line', 4
    new $P177, "ResizablePMCArray"
    push $P177, ""
    .return ($P177)
.end


.namespace ["NQP";"Grammar"]
.sub "_block179"  :anon :subid("35_1275811487.95429") :method :outer("33_1275811487.95429")
.annotate 'line', 96
    .local string rx181_tgt
    .local int rx181_pos
    .local int rx181_off
    .local int rx181_eos
    .local int rx181_rep
    .local pmc rx181_cur
    (rx181_cur, rx181_pos, rx181_tgt) = self."!cursor_start"()
    rx181_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx181_cur
    .local pmc match
    .lex "$/", match
    length rx181_eos, rx181_tgt
    gt rx181_pos, rx181_eos, rx181_done
    set rx181_off, 0
    lt rx181_pos, 2, rx181_start
    sub rx181_off, rx181_pos, 1
    substr rx181_tgt, rx181_tgt, rx181_off
  rx181_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan182_done
    goto rxscan182_scan
  rxscan182_loop:
    ($P10) = rx181_cur."from"()
    inc $P10
    set rx181_pos, $P10
    ge rx181_pos, rx181_eos, rxscan182_done
  rxscan182_scan:
    set_addr $I10, rxscan182_loop
    rx181_cur."!mark_push"(0, rx181_pos, $I10)
  rxscan182_done:
  alt183_0:
    set_addr $I10, alt183_1
    rx181_cur."!mark_push"(0, rx181_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx181_pos, rx181_eos, rx181_fail
    sub $I10, rx181_pos, rx181_off
    substr $S10, rx181_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx181_fail
    inc rx181_pos
    goto alt183_end
  alt183_1:
  # rxanchor eos
    ne rx181_pos, rx181_eos, rx181_fail
  alt183_end:
  # rx pass
    rx181_cur."!cursor_pass"(rx181_pos, "")
    rx181_cur."!cursor_debug"("PASS  ", "", " at pos=", rx181_pos)
    .return (rx181_cur)
  rx181_fail:
    (rx181_rep, rx181_pos, $I10, $P10) = rx181_cur."!mark_fail"(0)
    lt rx181_pos, -1, rx181_done
    eq rx181_pos, -1, rx181_fail
    jump $I10
  rx181_done:
    rx181_cur."!cursor_fail"()
    rx181_cur."!cursor_debug"("FAIL  ", "")
    .return (rx181_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt) = self."!cursor_start"()
    rx191_cur."!cursor_debug"("START ", "eat_terminator")
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
.annotate 'line', 108
    set_addr $I10, alt195_1
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
.annotate 'line', 109
  # rx literal  ";"
    add $I11, rx191_pos, 1
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 1
    ne $S10, ";", rx191_fail
    add rx191_pos, 1
    goto alt195_end
  alt195_1:
    set_addr $I10, alt195_2
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
.annotate 'line', 110
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."MARKED"("endstmt")
    unless $P10, rx191_fail
    goto alt195_end
  alt195_2:
    set_addr $I10, alt195_3
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
.annotate 'line', 111
  # rx subrule "terminator" subtype=zerowidth negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."terminator"()
    unless $P10, rx191_fail
    goto alt195_end
  alt195_3:
.annotate 'line', 112
  # rxanchor eos
    ne rx191_pos, rx191_eos, rx191_fail
  alt195_end:
.annotate 'line', 108
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "eat_terminator")
    rx191_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_fail:
.annotate 'line', 4
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1275811487.95429") :method
.annotate 'line', 4
    new $P193, "ResizablePMCArray"
    push $P193, ""
    push $P193, ""
    push $P193, ""
    push $P193, ";"
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    (rx197_cur, rx197_pos, rx197_tgt) = self."!cursor_start"()
    rx197_cur."!cursor_debug"("START ", "xblock")
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
.annotate 'line', 116
  # rx subrule "EXPR" subtype=capture negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."EXPR"()
    unless $P10, rx197_fail
    rx197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx197_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."ws"()
    unless $P10, rx197_fail
    rx197_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."pblock"()
    unless $P10, rx197_fail
    rx197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx197_pos = $P10."pos"()
.annotate 'line', 115
  # rx pass
    rx197_cur."!cursor_pass"(rx197_pos, "xblock")
    rx197_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx197_pos)
    .return (rx197_cur)
  rx197_fail:
.annotate 'line', 4
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    rx197_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1275811487.95429") :method
.annotate 'line', 4
    $P199 = self."!PREFIX__!subrule"("EXPR", "")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    gt rx203_pos, rx203_eos, rx203_done
    set rx203_off, 0
    lt rx203_pos, 2, rx203_start
    sub rx203_off, rx203_pos, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan208_done
    goto rxscan208_scan
  rxscan208_loop:
    ($P10) = rx203_cur."from"()
    inc $P10
    set rx203_pos, $P10
    ge rx203_pos, rx203_eos, rxscan208_done
  rxscan208_scan:
    set_addr $I10, rxscan208_loop
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  rxscan208_done:
  alt209_0:
.annotate 'line', 119
    set_addr $I10, alt209_1
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
.annotate 'line', 120
  # rx subrule "lambda" subtype=method negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."lambda"()
    unless $P10, rx203_fail
    rx203_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "newpad" subtype=method negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."newpad"()
    unless $P10, rx203_fail
    rx203_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "signature" subtype=capture negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."signature"()
    unless $P10, rx203_fail
    rx203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx203_pos = $P10."pos"()
.annotate 'line', 123
  # rx subrule "blockoid" subtype=capture negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."blockoid"()
    unless $P10, rx203_fail
    rx203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx203_pos = $P10."pos"()
.annotate 'line', 120
    goto alt209_end
  alt209_1:
    set_addr $I10, alt209_2
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
.annotate 'line', 124
  # rx enumcharlist negate=0 zerowidth
    ge rx203_pos, rx203_eos, rx203_fail
    sub $I10, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx203_fail
.annotate 'line', 125
  # rx subrule "newpad" subtype=method negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."newpad"()
    unless $P10, rx203_fail
    rx203_pos = $P10."pos"()
.annotate 'line', 126
  # rx subrule "blockoid" subtype=capture negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."blockoid"()
    unless $P10, rx203_fail
    rx203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx203_pos = $P10."pos"()
.annotate 'line', 124
    goto alt209_end
  alt209_2:
.annotate 'line', 127
  # rx subrule "panic" subtype=method negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."panic"("Missing block")
    unless $P10, rx203_fail
    rx203_pos = $P10."pos"()
  alt209_end:
.annotate 'line', 119
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "pblock")
    rx203_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_fail:
.annotate 'line', 4
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1275811487.95429") :method
.annotate 'line', 4
    $P205 = self."!PREFIX__!subrule"("panic", "")
    $P206 = self."!PREFIX__!subrule"("lambda", "")
    new $P207, "ResizablePMCArray"
    push $P207, $P205
    push $P207, "{"
    push $P207, $P206
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    (rx211_cur, rx211_pos, rx211_tgt) = self."!cursor_start"()
    rx211_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
    gt rx211_pos, rx211_eos, rx211_done
    set rx211_off, 0
    lt rx211_pos, 2, rx211_start
    sub rx211_off, rx211_pos, 1
    substr rx211_tgt, rx211_tgt, rx211_off
  rx211_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan214_done
    goto rxscan214_scan
  rxscan214_loop:
    ($P10) = rx211_cur."from"()
    inc $P10
    set rx211_pos, $P10
    ge rx211_pos, rx211_eos, rxscan214_done
  rxscan214_scan:
    set_addr $I10, rxscan214_loop
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  rxscan214_done:
  alt215_0:
.annotate 'line', 130
    set_addr $I10, alt215_1
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  # rx literal  "->"
    add $I11, rx211_pos, 2
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 2
    ne $S10, "->", rx211_fail
    add rx211_pos, 2
    goto alt215_end
  alt215_1:
  # rx literal  "<->"
    add $I11, rx211_pos, 3
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 3
    ne $S10, "<->", rx211_fail
    add rx211_pos, 3
  alt215_end:
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "lambda")
    rx211_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx211_pos)
    .return (rx211_cur)
  rx211_fail:
.annotate 'line', 4
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    rx211_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx211_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1275811487.95429") :method
.annotate 'line', 4
    new $P213, "ResizablePMCArray"
    push $P213, "<->"
    push $P213, "->"
    .return ($P213)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    gt rx217_pos, rx217_eos, rx217_done
    set rx217_off, 0
    lt rx217_pos, 2, rx217_start
    sub rx217_off, rx217_pos, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan221_done
    goto rxscan221_scan
  rxscan221_loop:
    ($P10) = rx217_cur."from"()
    inc $P10
    set rx217_pos, $P10
    ge rx217_pos, rx217_eos, rxscan221_done
  rxscan221_scan:
    set_addr $I10, rxscan221_loop
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  rxscan221_done:
  alt222_0:
.annotate 'line', 133
    set_addr $I10, alt222_1
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx217_pos, rx217_eos, rx217_fail
    sub $I10, rx217_pos, rx217_off
    substr $S10, rx217_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx217_fail
    goto alt222_end
  alt222_1:
  # rx subrule "panic" subtype=method negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."panic"("Missing block")
    unless $P10, rx217_fail
    rx217_pos = $P10."pos"()
  alt222_end:
.annotate 'line', 134
  # rx subrule "newpad" subtype=method negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."newpad"()
    unless $P10, rx217_fail
    rx217_pos = $P10."pos"()
.annotate 'line', 135
  # rx subrule "blockoid" subtype=capture negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."blockoid"()
    unless $P10, rx217_fail
    rx217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx217_pos = $P10."pos"()
.annotate 'line', 132
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "block")
    rx217_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate 'line', 4
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx217_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1275811487.95429") :method
.annotate 'line', 4
    $P219 = self."!PREFIX__!subrule"("panic", "")
    new $P220, "ResizablePMCArray"
    push $P220, $P219
    push $P220, "{"
    .return ($P220)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    gt rx224_pos, rx224_eos, rx224_done
    set rx224_off, 0
    lt rx224_pos, 2, rx224_start
    sub rx224_off, rx224_pos, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan228_done
    goto rxscan228_scan
  rxscan228_loop:
    ($P10) = rx224_cur."from"()
    inc $P10
    set rx224_pos, $P10
    ge rx224_pos, rx224_eos, rxscan228_done
  rxscan228_scan:
    set_addr $I10, rxscan228_loop
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  rxscan228_done:
.annotate 'line', 139
  # rx subrule "finishpad" subtype=method negate=
    rx224_cur."!cursor_pos"(rx224_pos)
    $P10 = rx224_cur."finishpad"()
    unless $P10, rx224_fail
    rx224_pos = $P10."pos"()
.annotate 'line', 140
  # rx literal  "{"
    add $I11, rx224_pos, 1
    gt $I11, rx224_eos, rx224_fail
    sub $I11, rx224_pos, rx224_off
    substr $S10, rx224_tgt, $I11, 1
    ne $S10, "{", rx224_fail
    add rx224_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx224_cur."!cursor_pos"(rx224_pos)
    $P10 = rx224_cur."statementlist"()
    unless $P10, rx224_fail
    rx224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx224_pos = $P10."pos"()
  alt229_0:
    set_addr $I10, alt229_1
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  # rx literal  "}"
    add $I11, rx224_pos, 1
    gt $I11, rx224_eos, rx224_fail
    sub $I11, rx224_pos, rx224_off
    substr $S10, rx224_tgt, $I11, 1
    ne $S10, "}", rx224_fail
    add rx224_pos, 1
    goto alt229_end
  alt229_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx224_cur."!cursor_pos"(rx224_pos)
    $P10 = rx224_cur."FAILGOAL"("'}'")
    unless $P10, rx224_fail
    rx224_pos = $P10."pos"()
  alt229_end:
.annotate 'line', 141
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx224_cur."!cursor_pos"(rx224_pos)
    $P10 = rx224_cur."ENDSTMT"()
    unless $P10, rx224_fail
.annotate 'line', 138
  # rx pass
    rx224_cur."!cursor_pass"(rx224_pos, "blockoid")
    rx224_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx224_pos)
    .return (rx224_cur)
  rx224_fail:
.annotate 'line', 4
    (rx224_rep, rx224_pos, $I10, $P10) = rx224_cur."!mark_fail"(0)
    lt rx224_pos, -1, rx224_done
    eq rx224_pos, -1, rx224_fail
    jump $I10
  rx224_done:
    rx224_cur."!cursor_fail"()
    rx224_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1275811487.95429") :method
.annotate 'line', 4
    $P226 = self."!PREFIX__!subrule"("finishpad", "")
    new $P227, "ResizablePMCArray"
    push $P227, $P226
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt) = self."!cursor_start"()
    rx232_cur."!cursor_debug"("START ", "newpad")
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
.annotate 'line', 144
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "newpad")
    rx232_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_fail:
.annotate 'line', 4
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1275811487.95429") :method
.annotate 'line', 4
    new $P234, "ResizablePMCArray"
    push $P234, ""
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    (rx237_cur, rx237_pos, rx237_tgt) = self."!cursor_start"()
    rx237_cur."!cursor_debug"("START ", "outerctx")
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
.annotate 'line', 145
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "outerctx")
    rx237_cur."!cursor_debug"("PASS  ", "outerctx", " at pos=", rx237_pos)
    .return (rx237_cur)
  rx237_fail:
.annotate 'line', 4
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    rx237_cur."!cursor_debug"("FAIL  ", "outerctx")
    .return (rx237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1275811487.95429") :method
.annotate 'line', 4
    new $P239, "ResizablePMCArray"
    push $P239, ""
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx242_tgt
    .local int rx242_pos
    .local int rx242_off
    .local int rx242_eos
    .local int rx242_rep
    .local pmc rx242_cur
    (rx242_cur, rx242_pos, rx242_tgt) = self."!cursor_start"()
    rx242_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx242_cur
    .local pmc match
    .lex "$/", match
    length rx242_eos, rx242_tgt
    gt rx242_pos, rx242_eos, rx242_done
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
.annotate 'line', 146
  # rx pass
    rx242_cur."!cursor_pass"(rx242_pos, "finishpad")
    rx242_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx242_pos)
    .return (rx242_cur)
  rx242_fail:
.annotate 'line', 4
    (rx242_rep, rx242_pos, $I10, $P10) = rx242_cur."!mark_fail"(0)
    lt rx242_pos, -1, rx242_done
    eq rx242_pos, -1, rx242_fail
    jump $I10
  rx242_done:
    rx242_cur."!cursor_fail"()
    rx242_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx242_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1275811487.95429") :method
.annotate 'line', 4
    new $P244, "ResizablePMCArray"
    push $P244, ""
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1275811487.95429") :method
.annotate 'line', 148
    $P247 = self."!protoregex"("terminator")
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1275811487.95429") :method
.annotate 'line', 148
    $P249 = self."!PREFIX__!protoregex"("terminator")
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    (rx251_cur, rx251_pos, rx251_tgt) = self."!cursor_start"()
    rx251_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx251_cur
    .local pmc match
    .lex "$/", match
    length rx251_eos, rx251_tgt
    gt rx251_pos, rx251_eos, rx251_done
    set rx251_off, 0
    lt rx251_pos, 2, rx251_start
    sub rx251_off, rx251_pos, 1
    substr rx251_tgt, rx251_tgt, rx251_off
  rx251_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan254_done
    goto rxscan254_scan
  rxscan254_loop:
    ($P10) = rx251_cur."from"()
    inc $P10
    set rx251_pos, $P10
    ge rx251_pos, rx251_eos, rxscan254_done
  rxscan254_scan:
    set_addr $I10, rxscan254_loop
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  rxscan254_done:
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    ge rx251_pos, rx251_eos, rx251_fail
    sub $I10, rx251_pos, rx251_off
    substr $S10, rx251_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx251_fail
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "terminator:sym<;>")
    rx251_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx251_pos)
    .return (rx251_cur)
  rx251_fail:
.annotate 'line', 4
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    rx251_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx251_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1275811487.95429") :method
.annotate 'line', 4
    new $P253, "ResizablePMCArray"
    push $P253, ";"
    .return ($P253)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx256_tgt
    .local int rx256_pos
    .local int rx256_off
    .local int rx256_eos
    .local int rx256_rep
    .local pmc rx256_cur
    (rx256_cur, rx256_pos, rx256_tgt) = self."!cursor_start"()
    rx256_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx256_cur
    .local pmc match
    .lex "$/", match
    length rx256_eos, rx256_tgt
    gt rx256_pos, rx256_eos, rx256_done
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
.annotate 'line', 151
  # rx enumcharlist negate=0 zerowidth
    ge rx256_pos, rx256_eos, rx256_fail
    sub $I10, rx256_pos, rx256_off
    substr $S10, rx256_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx256_fail
  # rx pass
    rx256_cur."!cursor_pass"(rx256_pos, "terminator:sym<}>")
    rx256_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx256_pos)
    .return (rx256_cur)
  rx256_fail:
.annotate 'line', 4
    (rx256_rep, rx256_pos, $I10, $P10) = rx256_cur."!mark_fail"(0)
    lt rx256_pos, -1, rx256_done
    eq rx256_pos, -1, rx256_fail
    jump $I10
  rx256_done:
    rx256_cur."!cursor_fail"()
    rx256_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx256_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1275811487.95429") :method
.annotate 'line', 4
    new $P258, "ResizablePMCArray"
    push $P258, "}"
    .return ($P258)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1275811487.95429") :method
.annotate 'line', 155
    $P261 = self."!protoregex"("statement_control")
    .return ($P261)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1275811487.95429") :method
.annotate 'line', 155
    $P263 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P263)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx265_tgt
    .local int rx265_pos
    .local int rx265_off
    .local int rx265_eos
    .local int rx265_rep
    .local pmc rx265_cur
    (rx265_cur, rx265_pos, rx265_tgt) = self."!cursor_start"()
    rx265_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx265_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx265_cur
    .local pmc match
    .lex "$/", match
    length rx265_eos, rx265_tgt
    gt rx265_pos, rx265_eos, rx265_done
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
.annotate 'line', 158
  # rx subcapture "sym"
    set_addr $I10, rxcap_269_fail
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx literal  "if"
    add $I11, rx265_pos, 2
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 2
    ne $S10, "if", rx265_fail
    add rx265_pos, 2
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
.annotate 'line', 159
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
.annotate 'line', 160
  # rx rxquantr272 ** 0..*
    set_addr $I276, rxquantr272_done
    rx265_cur."!mark_push"(0, rx265_pos, $I276)
  rxquantr272_loop:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx265_pos, 5
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 5
    ne $S10, "elsif", rx265_fail
    add rx265_pos, 5
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
    (rx265_rep) = rx265_cur."!mark_commit"($I276)
    rx265_cur."!mark_push"(rx265_rep, rx265_pos, $I276)
    goto rxquantr272_loop
  rxquantr272_done:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
.annotate 'line', 161
  # rx rxquantr278 ** 0..1
    set_addr $I282, rxquantr278_done
    rx265_cur."!mark_push"(0, rx265_pos, $I282)
  rxquantr278_loop:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx265_pos, 4
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 4
    ne $S10, "else", rx265_fail
    add rx265_pos, 4
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
  # rx subrule "pblock" subtype=capture negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."pblock"()
    unless $P10, rx265_fail
    rx265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx265_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
    (rx265_rep) = rx265_cur."!mark_commit"($I282)
  rxquantr278_done:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
.annotate 'line', 157
  # rx pass
    rx265_cur."!cursor_pass"(rx265_pos, "statement_control:sym<if>")
    rx265_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx265_pos)
    .return (rx265_cur)
  rx265_fail:
.annotate 'line', 4
    (rx265_rep, rx265_pos, $I10, $P10) = rx265_cur."!mark_fail"(0)
    lt rx265_pos, -1, rx265_done
    eq rx265_pos, -1, rx265_fail
    jump $I10
  rx265_done:
    rx265_cur."!cursor_fail"()
    rx265_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx265_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1275811487.95429") :method
.annotate 'line', 4
    new $P267, "ResizablePMCArray"
    push $P267, "if"
    .return ($P267)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P295 = "66_1275811487.95429" 
    capture_lex $P295
    .local string rx285_tgt
    .local int rx285_pos
    .local int rx285_off
    .local int rx285_eos
    .local int rx285_rep
    .local pmc rx285_cur
    (rx285_cur, rx285_pos, rx285_tgt) = self."!cursor_start"()
    rx285_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx285_cur
    .local pmc match
    .lex "$/", match
    length rx285_eos, rx285_tgt
    gt rx285_pos, rx285_eos, rx285_done
    set rx285_off, 0
    lt rx285_pos, 2, rx285_start
    sub rx285_off, rx285_pos, 1
    substr rx285_tgt, rx285_tgt, rx285_off
  rx285_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan288_done
    goto rxscan288_scan
  rxscan288_loop:
    ($P10) = rx285_cur."from"()
    inc $P10
    set rx285_pos, $P10
    ge rx285_pos, rx285_eos, rxscan288_done
  rxscan288_scan:
    set_addr $I10, rxscan288_loop
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  rxscan288_done:
.annotate 'line', 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_289_fail
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  # rx literal  "unless"
    add $I11, rx285_pos, 6
    gt $I11, rx285_eos, rx285_fail
    sub $I11, rx285_pos, rx285_off
    substr $S10, rx285_tgt, $I11, 6
    ne $S10, "unless", rx285_fail
    add rx285_pos, 6
    set_addr $I10, rxcap_289_fail
    ($I12, $I11) = rx285_cur."!mark_peek"($I10)
    rx285_cur."!cursor_pos"($I11)
    ($P10) = rx285_cur."!cursor_start"()
    $P10."!cursor_pass"(rx285_pos, "")
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_289_done
  rxcap_289_fail:
    goto rx285_fail
  rxcap_289_done:
  # rx charclass s
    ge rx285_pos, rx285_eos, rx285_fail
    sub $I10, rx285_pos, rx285_off
    is_cclass $I11, 32, rx285_tgt, $I10
    unless $I11, rx285_fail
    inc rx285_pos
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
.annotate 'line', 166
  # rx subrule "xblock" subtype=capture negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."xblock"()
    unless $P10, rx285_fail
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx285_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  alt292_0:
.annotate 'line', 167
    set_addr $I10, alt292_1
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx285_cur."!cursor_pos"(rx285_pos)
    .const 'Sub' $P295 = "66_1275811487.95429" 
    capture_lex $P295
    $P10 = rx285_cur."before"($P295)
    if $P10, rx285_fail
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
    goto alt292_end
  alt292_1:
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  alt292_end:
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
.annotate 'line', 164
  # rx pass
    rx285_cur."!cursor_pass"(rx285_pos, "statement_control:sym<unless>")
    rx285_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx285_pos)
    .return (rx285_cur)
  rx285_fail:
.annotate 'line', 4
    (rx285_rep, rx285_pos, $I10, $P10) = rx285_cur."!mark_fail"(0)
    lt rx285_pos, -1, rx285_done
    eq rx285_pos, -1, rx285_fail
    jump $I10
  rx285_done:
    rx285_cur."!cursor_fail"()
    rx285_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx285_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1275811487.95429") :method
.annotate 'line', 4
    new $P287, "ResizablePMCArray"
    push $P287, "unless"
    .return ($P287)
.end


.namespace ["NQP";"Grammar"]
.sub "_block294"  :anon :subid("66_1275811487.95429") :method :outer("64_1275811487.95429")
.annotate 'line', 167
    .local string rx296_tgt
    .local int rx296_pos
    .local int rx296_off
    .local int rx296_eos
    .local int rx296_rep
    .local pmc rx296_cur
    (rx296_cur, rx296_pos, rx296_tgt) = self."!cursor_start"()
    rx296_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx296_cur
    .local pmc match
    .lex "$/", match
    length rx296_eos, rx296_tgt
    gt rx296_pos, rx296_eos, rx296_done
    set rx296_off, 0
    lt rx296_pos, 2, rx296_start
    sub rx296_off, rx296_pos, 1
    substr rx296_tgt, rx296_tgt, rx296_off
  rx296_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan297_done
    goto rxscan297_scan
  rxscan297_loop:
    ($P10) = rx296_cur."from"()
    inc $P10
    set rx296_pos, $P10
    ge rx296_pos, rx296_eos, rxscan297_done
  rxscan297_scan:
    set_addr $I10, rxscan297_loop
    rx296_cur."!mark_push"(0, rx296_pos, $I10)
  rxscan297_done:
  # rx literal  "else"
    add $I11, rx296_pos, 4
    gt $I11, rx296_eos, rx296_fail
    sub $I11, rx296_pos, rx296_off
    substr $S10, rx296_tgt, $I11, 4
    ne $S10, "else", rx296_fail
    add rx296_pos, 4
  # rx pass
    rx296_cur."!cursor_pass"(rx296_pos, "")
    rx296_cur."!cursor_debug"("PASS  ", "", " at pos=", rx296_pos)
    .return (rx296_cur)
  rx296_fail:
    (rx296_rep, rx296_pos, $I10, $P10) = rx296_cur."!mark_fail"(0)
    lt rx296_pos, -1, rx296_done
    eq rx296_pos, -1, rx296_fail
    jump $I10
  rx296_done:
    rx296_cur."!cursor_fail"()
    rx296_cur."!cursor_debug"("FAIL  ", "")
    .return (rx296_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx303_tgt
    .local int rx303_pos
    .local int rx303_off
    .local int rx303_eos
    .local int rx303_rep
    .local pmc rx303_cur
    (rx303_cur, rx303_pos, rx303_tgt) = self."!cursor_start"()
    rx303_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx303_cur
    .local pmc match
    .lex "$/", match
    length rx303_eos, rx303_tgt
    gt rx303_pos, rx303_eos, rx303_done
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
.annotate 'line', 171
  # rx subcapture "sym"
    set_addr $I10, rxcap_308_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  alt307_0:
    set_addr $I10, alt307_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "while"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "while", rx303_fail
    add rx303_pos, 5
    goto alt307_end
  alt307_1:
  # rx literal  "until"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "until", rx303_fail
    add rx303_pos, 5
  alt307_end:
    set_addr $I10, rxcap_308_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_308_done
  rxcap_308_fail:
    goto rx303_fail
  rxcap_308_done:
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
.annotate 'line', 172
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
.annotate 'line', 170
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "statement_control:sym<while>")
    rx303_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx303_pos)
    .return (rx303_cur)
  rx303_fail:
.annotate 'line', 4
    (rx303_rep, rx303_pos, $I10, $P10) = rx303_cur."!mark_fail"(0)
    lt rx303_pos, -1, rx303_done
    eq rx303_pos, -1, rx303_fail
    jump $I10
  rx303_done:
    rx303_cur."!cursor_fail"()
    rx303_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1275811487.95429") :method
.annotate 'line', 4
    new $P305, "ResizablePMCArray"
    push $P305, "until"
    push $P305, "while"
    .return ($P305)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx312_tgt
    .local int rx312_pos
    .local int rx312_off
    .local int rx312_eos
    .local int rx312_rep
    .local pmc rx312_cur
    (rx312_cur, rx312_pos, rx312_tgt) = self."!cursor_start"()
    rx312_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx312_cur
    .local pmc match
    .lex "$/", match
    length rx312_eos, rx312_tgt
    gt rx312_pos, rx312_eos, rx312_done
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
.annotate 'line', 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_316_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx312_pos, 6
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 6
    ne $S10, "repeat", rx312_fail
    add rx312_pos, 6
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
  alt318_0:
.annotate 'line', 177
    set_addr $I10, alt318_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_321_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  alt320_0:
    set_addr $I10, alt320_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx literal  "while"
    add $I11, rx312_pos, 5
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 5
    ne $S10, "while", rx312_fail
    add rx312_pos, 5
    goto alt320_end
  alt320_1:
  # rx literal  "until"
    add $I11, rx312_pos, 5
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 5
    ne $S10, "until", rx312_fail
    add rx312_pos, 5
  alt320_end:
    set_addr $I10, rxcap_321_fail
    ($I12, $I11) = rx312_cur."!mark_peek"($I10)
    rx312_cur."!cursor_pos"($I11)
    ($P10) = rx312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx312_pos, "")
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_321_done
  rxcap_321_fail:
    goto rx312_fail
  rxcap_321_done:
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
    goto alt318_end
  alt318_1:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."pblock"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx312_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_327_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  alt326_0:
    set_addr $I10, alt326_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx literal  "while"
    add $I11, rx312_pos, 5
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 5
    ne $S10, "while", rx312_fail
    add rx312_pos, 5
    goto alt326_end
  alt326_1:
  # rx literal  "until"
    add $I11, rx312_pos, 5
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 5
    ne $S10, "until", rx312_fail
    add rx312_pos, 5
  alt326_end:
    set_addr $I10, rxcap_327_fail
    ($I12, $I11) = rx312_cur."!mark_peek"($I10)
    rx312_cur."!cursor_pos"($I11)
    ($P10) = rx312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx312_pos, "")
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_327_done
  rxcap_327_fail:
    goto rx312_fail
  rxcap_327_done:
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
  # rx subrule "EXPR" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."EXPR"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx312_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  alt318_end:
.annotate 'line', 180
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
.annotate 'line', 175
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "statement_control:sym<repeat>")
    rx312_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate 'line', 4
    (rx312_rep, rx312_pos, $I10, $P10) = rx312_cur."!mark_fail"(0)
    lt rx312_pos, -1, rx312_done
    eq rx312_pos, -1, rx312_fail
    jump $I10
  rx312_done:
    rx312_cur."!cursor_fail"()
    rx312_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx312_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1275811487.95429") :method
.annotate 'line', 4
    new $P314, "ResizablePMCArray"
    push $P314, "repeat"
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx332_tgt
    .local int rx332_pos
    .local int rx332_off
    .local int rx332_eos
    .local int rx332_rep
    .local pmc rx332_cur
    (rx332_cur, rx332_pos, rx332_tgt) = self."!cursor_start"()
    rx332_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx332_cur
    .local pmc match
    .lex "$/", match
    length rx332_eos, rx332_tgt
    gt rx332_pos, rx332_eos, rx332_done
    set rx332_off, 0
    lt rx332_pos, 2, rx332_start
    sub rx332_off, rx332_pos, 1
    substr rx332_tgt, rx332_tgt, rx332_off
  rx332_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan335_done
    goto rxscan335_scan
  rxscan335_loop:
    ($P10) = rx332_cur."from"()
    inc $P10
    set rx332_pos, $P10
    ge rx332_pos, rx332_eos, rxscan335_done
  rxscan335_scan:
    set_addr $I10, rxscan335_loop
    rx332_cur."!mark_push"(0, rx332_pos, $I10)
  rxscan335_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_336_fail
    rx332_cur."!mark_push"(0, rx332_pos, $I10)
  # rx literal  "for"
    add $I11, rx332_pos, 3
    gt $I11, rx332_eos, rx332_fail
    sub $I11, rx332_pos, rx332_off
    substr $S10, rx332_tgt, $I11, 3
    ne $S10, "for", rx332_fail
    add rx332_pos, 3
    set_addr $I10, rxcap_336_fail
    ($I12, $I11) = rx332_cur."!mark_peek"($I10)
    rx332_cur."!cursor_pos"($I11)
    ($P10) = rx332_cur."!cursor_start"()
    $P10."!cursor_pass"(rx332_pos, "")
    rx332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_336_done
  rxcap_336_fail:
    goto rx332_fail
  rxcap_336_done:
  # rx charclass s
    ge rx332_pos, rx332_eos, rx332_fail
    sub $I10, rx332_pos, rx332_off
    is_cclass $I11, 32, rx332_tgt, $I10
    unless $I11, rx332_fail
    inc rx332_pos
  # rx subrule "ws" subtype=method negate=
    rx332_cur."!cursor_pos"(rx332_pos)
    $P10 = rx332_cur."ws"()
    unless $P10, rx332_fail
    rx332_pos = $P10."pos"()
.annotate 'line', 185
  # rx subrule "xblock" subtype=capture negate=
    rx332_cur."!cursor_pos"(rx332_pos)
    $P10 = rx332_cur."xblock"()
    unless $P10, rx332_fail
    rx332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx332_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx332_cur."!cursor_pos"(rx332_pos)
    $P10 = rx332_cur."ws"()
    unless $P10, rx332_fail
    rx332_pos = $P10."pos"()
.annotate 'line', 183
  # rx pass
    rx332_cur."!cursor_pass"(rx332_pos, "statement_control:sym<for>")
    rx332_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx332_pos)
    .return (rx332_cur)
  rx332_fail:
.annotate 'line', 4
    (rx332_rep, rx332_pos, $I10, $P10) = rx332_cur."!mark_fail"(0)
    lt rx332_pos, -1, rx332_done
    eq rx332_pos, -1, rx332_fail
    jump $I10
  rx332_done:
    rx332_cur."!cursor_fail"()
    rx332_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx332_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1275811487.95429") :method
.annotate 'line', 4
    new $P334, "ResizablePMCArray"
    push $P334, "for"
    .return ($P334)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    gt rx340_pos, rx340_eos, rx340_done
    set rx340_off, 0
    lt rx340_pos, 2, rx340_start
    sub rx340_off, rx340_pos, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan343_done
    goto rxscan343_scan
  rxscan343_loop:
    ($P10) = rx340_cur."from"()
    inc $P10
    set rx340_pos, $P10
    ge rx340_pos, rx340_eos, rxscan343_done
  rxscan343_scan:
    set_addr $I10, rxscan343_loop
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  rxscan343_done:
.annotate 'line', 189
  # rx subcapture "sym"
    set_addr $I10, rxcap_344_fail
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx340_pos, 5
    gt $I11, rx340_eos, rx340_fail
    sub $I11, rx340_pos, rx340_off
    substr $S10, rx340_tgt, $I11, 5
    ne $S10, "CATCH", rx340_fail
    add rx340_pos, 5
    set_addr $I10, rxcap_344_fail
    ($I12, $I11) = rx340_cur."!mark_peek"($I10)
    rx340_cur."!cursor_pos"($I11)
    ($P10) = rx340_cur."!cursor_start"()
    $P10."!cursor_pass"(rx340_pos, "")
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_344_done
  rxcap_344_fail:
    goto rx340_fail
  rxcap_344_done:
  # rx charclass s
    ge rx340_pos, rx340_eos, rx340_fail
    sub $I10, rx340_pos, rx340_off
    is_cclass $I11, 32, rx340_tgt, $I10
    unless $I11, rx340_fail
    inc rx340_pos
  # rx subrule "ws" subtype=method negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."ws"()
    unless $P10, rx340_fail
    rx340_pos = $P10."pos"()
.annotate 'line', 190
  # rx subrule "block" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."block"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx340_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."ws"()
    unless $P10, rx340_fail
    rx340_pos = $P10."pos"()
.annotate 'line', 188
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "statement_control:sym<CATCH>")
    rx340_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate 'line', 4
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1275811487.95429") :method
.annotate 'line', 4
    new $P342, "ResizablePMCArray"
    push $P342, "CATCH"
    .return ($P342)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx348_tgt
    .local int rx348_pos
    .local int rx348_off
    .local int rx348_eos
    .local int rx348_rep
    .local pmc rx348_cur
    (rx348_cur, rx348_pos, rx348_tgt) = self."!cursor_start"()
    rx348_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx348_cur
    .local pmc match
    .lex "$/", match
    length rx348_eos, rx348_tgt
    gt rx348_pos, rx348_eos, rx348_done
    set rx348_off, 0
    lt rx348_pos, 2, rx348_start
    sub rx348_off, rx348_pos, 1
    substr rx348_tgt, rx348_tgt, rx348_off
  rx348_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan351_done
    goto rxscan351_scan
  rxscan351_loop:
    ($P10) = rx348_cur."from"()
    inc $P10
    set rx348_pos, $P10
    ge rx348_pos, rx348_eos, rxscan351_done
  rxscan351_scan:
    set_addr $I10, rxscan351_loop
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  rxscan351_done:
.annotate 'line', 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx348_pos, 7
    gt $I11, rx348_eos, rx348_fail
    sub $I11, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I11, 7
    ne $S10, "CONTROL", rx348_fail
    add rx348_pos, 7
    set_addr $I10, rxcap_352_fail
    ($I12, $I11) = rx348_cur."!mark_peek"($I10)
    rx348_cur."!cursor_pos"($I11)
    ($P10) = rx348_cur."!cursor_start"()
    $P10."!cursor_pass"(rx348_pos, "")
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_352_done
  rxcap_352_fail:
    goto rx348_fail
  rxcap_352_done:
  # rx charclass s
    ge rx348_pos, rx348_eos, rx348_fail
    sub $I10, rx348_pos, rx348_off
    is_cclass $I11, 32, rx348_tgt, $I10
    unless $I11, rx348_fail
    inc rx348_pos
  # rx subrule "ws" subtype=method negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."ws"()
    unless $P10, rx348_fail
    rx348_pos = $P10."pos"()
.annotate 'line', 195
  # rx subrule "block" subtype=capture negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."block"()
    unless $P10, rx348_fail
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx348_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."ws"()
    unless $P10, rx348_fail
    rx348_pos = $P10."pos"()
.annotate 'line', 193
  # rx pass
    rx348_cur."!cursor_pass"(rx348_pos, "statement_control:sym<CONTROL>")
    rx348_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx348_pos)
    .return (rx348_cur)
  rx348_fail:
.annotate 'line', 4
    (rx348_rep, rx348_pos, $I10, $P10) = rx348_cur."!mark_fail"(0)
    lt rx348_pos, -1, rx348_done
    eq rx348_pos, -1, rx348_fail
    jump $I10
  rx348_done:
    rx348_cur."!cursor_fail"()
    rx348_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx348_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1275811487.95429") :method
.annotate 'line', 4
    new $P350, "ResizablePMCArray"
    push $P350, "CONTROL"
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1275811487.95429") :method
.annotate 'line', 198
    $P356 = self."!protoregex"("statement_prefix")
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1275811487.95429") :method
.annotate 'line', 198
    $P358 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx360_tgt
    .local int rx360_pos
    .local int rx360_off
    .local int rx360_eos
    .local int rx360_rep
    .local pmc rx360_cur
    (rx360_cur, rx360_pos, rx360_tgt) = self."!cursor_start"()
    rx360_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx360_cur
    .local pmc match
    .lex "$/", match
    length rx360_eos, rx360_tgt
    gt rx360_pos, rx360_eos, rx360_done
    set rx360_off, 0
    lt rx360_pos, 2, rx360_start
    sub rx360_off, rx360_pos, 1
    substr rx360_tgt, rx360_tgt, rx360_off
  rx360_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan364_done
    goto rxscan364_scan
  rxscan364_loop:
    ($P10) = rx360_cur."from"()
    inc $P10
    set rx360_pos, $P10
    ge rx360_pos, rx360_eos, rxscan364_done
  rxscan364_scan:
    set_addr $I10, rxscan364_loop
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  rxscan364_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_365_fail
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx360_pos, 4
    gt $I11, rx360_eos, rx360_fail
    sub $I11, rx360_pos, rx360_off
    substr $S10, rx360_tgt, $I11, 4
    ne $S10, "INIT", rx360_fail
    add rx360_pos, 4
    set_addr $I10, rxcap_365_fail
    ($I12, $I11) = rx360_cur."!mark_peek"($I10)
    rx360_cur."!cursor_pos"($I11)
    ($P10) = rx360_cur."!cursor_start"()
    $P10."!cursor_pass"(rx360_pos, "")
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_365_done
  rxcap_365_fail:
    goto rx360_fail
  rxcap_365_done:
  # rx subrule "blorst" subtype=capture negate=
    rx360_cur."!cursor_pos"(rx360_pos)
    $P10 = rx360_cur."blorst"()
    unless $P10, rx360_fail
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx360_pos = $P10."pos"()
  # rx pass
    rx360_cur."!cursor_pass"(rx360_pos, "statement_prefix:sym<INIT>")
    rx360_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx360_pos)
    .return (rx360_cur)
  rx360_fail:
.annotate 'line', 4
    (rx360_rep, rx360_pos, $I10, $P10) = rx360_cur."!mark_fail"(0)
    lt rx360_pos, -1, rx360_done
    eq rx360_pos, -1, rx360_fail
    jump $I10
  rx360_done:
    rx360_cur."!cursor_fail"()
    rx360_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx360_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1275811487.95429") :method
.annotate 'line', 4
    $P362 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P363, "ResizablePMCArray"
    push $P363, $P362
    .return ($P363)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx367_tgt
    .local int rx367_pos
    .local int rx367_off
    .local int rx367_eos
    .local int rx367_rep
    .local pmc rx367_cur
    (rx367_cur, rx367_pos, rx367_tgt) = self."!cursor_start"()
    rx367_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx367_cur
    .local pmc match
    .lex "$/", match
    length rx367_eos, rx367_tgt
    gt rx367_pos, rx367_eos, rx367_done
    set rx367_off, 0
    lt rx367_pos, 2, rx367_start
    sub rx367_off, rx367_pos, 1
    substr rx367_tgt, rx367_tgt, rx367_off
  rx367_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan371_done
    goto rxscan371_scan
  rxscan371_loop:
    ($P10) = rx367_cur."from"()
    inc $P10
    set rx367_pos, $P10
    ge rx367_pos, rx367_eos, rxscan371_done
  rxscan371_scan:
    set_addr $I10, rxscan371_loop
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  rxscan371_done:
.annotate 'line', 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_372_fail
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  # rx literal  "try"
    add $I11, rx367_pos, 3
    gt $I11, rx367_eos, rx367_fail
    sub $I11, rx367_pos, rx367_off
    substr $S10, rx367_tgt, $I11, 3
    ne $S10, "try", rx367_fail
    add rx367_pos, 3
    set_addr $I10, rxcap_372_fail
    ($I12, $I11) = rx367_cur."!mark_peek"($I10)
    rx367_cur."!cursor_pos"($I11)
    ($P10) = rx367_cur."!cursor_start"()
    $P10."!cursor_pass"(rx367_pos, "")
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_372_done
  rxcap_372_fail:
    goto rx367_fail
  rxcap_372_done:
.annotate 'line', 203
  # rx subrule "blorst" subtype=capture negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."blorst"()
    unless $P10, rx367_fail
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx367_pos = $P10."pos"()
.annotate 'line', 201
  # rx pass
    rx367_cur."!cursor_pass"(rx367_pos, "statement_prefix:sym<try>")
    rx367_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx367_pos)
    .return (rx367_cur)
  rx367_fail:
.annotate 'line', 4
    (rx367_rep, rx367_pos, $I10, $P10) = rx367_cur."!mark_fail"(0)
    lt rx367_pos, -1, rx367_done
    eq rx367_pos, -1, rx367_fail
    jump $I10
  rx367_done:
    rx367_cur."!cursor_fail"()
    rx367_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx367_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1275811487.95429") :method
.annotate 'line', 4
    $P369 = self."!PREFIX__!subrule"("blorst", "try")
    new $P370, "ResizablePMCArray"
    push $P370, $P369
    .return ($P370)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx374_tgt
    .local int rx374_pos
    .local int rx374_off
    .local int rx374_eos
    .local int rx374_rep
    .local pmc rx374_cur
    (rx374_cur, rx374_pos, rx374_tgt) = self."!cursor_start"()
    rx374_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx374_cur
    .local pmc match
    .lex "$/", match
    length rx374_eos, rx374_tgt
    gt rx374_pos, rx374_eos, rx374_done
    set rx374_off, 0
    lt rx374_pos, 2, rx374_start
    sub rx374_off, rx374_pos, 1
    substr rx374_tgt, rx374_tgt, rx374_off
  rx374_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan377_done
    goto rxscan377_scan
  rxscan377_loop:
    ($P10) = rx374_cur."from"()
    inc $P10
    set rx374_pos, $P10
    ge rx374_pos, rx374_eos, rxscan377_done
  rxscan377_scan:
    set_addr $I10, rxscan377_loop
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
  rxscan377_done:
.annotate 'line', 207
  # rx charclass s
    ge rx374_pos, rx374_eos, rx374_fail
    sub $I10, rx374_pos, rx374_off
    is_cclass $I11, 32, rx374_tgt, $I10
    unless $I11, rx374_fail
    inc rx374_pos
  # rx subrule "ws" subtype=method negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."ws"()
    unless $P10, rx374_fail
    rx374_pos = $P10."pos"()
  alt378_0:
    set_addr $I10, alt378_1
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx374_pos, rx374_eos, rx374_fail
    sub $I10, rx374_pos, rx374_off
    substr $S10, rx374_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx374_fail
  # rx subrule "block" subtype=capture negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."block"()
    unless $P10, rx374_fail
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx374_pos = $P10."pos"()
    goto alt378_end
  alt378_1:
  # rx subrule "statement" subtype=capture negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."statement"()
    unless $P10, rx374_fail
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx374_pos = $P10."pos"()
  alt378_end:
.annotate 'line', 206
  # rx pass
    rx374_cur."!cursor_pass"(rx374_pos, "blorst")
    rx374_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx374_pos)
    .return (rx374_cur)
  rx374_fail:
.annotate 'line', 4
    (rx374_rep, rx374_pos, $I10, $P10) = rx374_cur."!mark_fail"(0)
    lt rx374_pos, -1, rx374_done
    eq rx374_pos, -1, rx374_fail
    jump $I10
  rx374_done:
    rx374_cur."!cursor_fail"()
    rx374_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx374_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1275811487.95429") :method
.annotate 'line', 4
    new $P376, "ResizablePMCArray"
    push $P376, ""
    .return ($P376)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1275811487.95429") :method
.annotate 'line', 212
    $P380 = self."!protoregex"("statement_mod_cond")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1275811487.95429") :method
.annotate 'line', 212
    $P382 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx384_cur
    .local pmc match
    .lex "$/", match
    length rx384_eos, rx384_tgt
    gt rx384_pos, rx384_eos, rx384_done
    set rx384_off, 0
    lt rx384_pos, 2, rx384_start
    sub rx384_off, rx384_pos, 1
    substr rx384_tgt, rx384_tgt, rx384_off
  rx384_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan388_done
    goto rxscan388_scan
  rxscan388_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan388_done
  rxscan388_scan:
    set_addr $I10, rxscan388_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan388_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_389_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx literal  "if"
    add $I11, rx384_pos, 2
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 2
    ne $S10, "if", rx384_fail
    add rx384_pos, 2
    set_addr $I10, rxcap_389_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_389_done
  rxcap_389_fail:
    goto rx384_fail
  rxcap_389_done:
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
    rx384_cur."!cursor_pass"(rx384_pos, "statement_mod_cond:sym<if>")
    rx384_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate 'line', 4
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1275811487.95429") :method
.annotate 'line', 4
    $P386 = self."!PREFIX__!subrule"("ws", "if")
    new $P387, "ResizablePMCArray"
    push $P387, $P386
    .return ($P387)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx393_tgt
    .local int rx393_pos
    .local int rx393_off
    .local int rx393_eos
    .local int rx393_rep
    .local pmc rx393_cur
    (rx393_cur, rx393_pos, rx393_tgt) = self."!cursor_start"()
    rx393_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx393_cur
    .local pmc match
    .lex "$/", match
    length rx393_eos, rx393_tgt
    gt rx393_pos, rx393_eos, rx393_done
    set rx393_off, 0
    lt rx393_pos, 2, rx393_start
    sub rx393_off, rx393_pos, 1
    substr rx393_tgt, rx393_tgt, rx393_off
  rx393_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan397_done
    goto rxscan397_scan
  rxscan397_loop:
    ($P10) = rx393_cur."from"()
    inc $P10
    set rx393_pos, $P10
    ge rx393_pos, rx393_eos, rxscan397_done
  rxscan397_scan:
    set_addr $I10, rxscan397_loop
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  rxscan397_done:
.annotate 'line', 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_398_fail
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  # rx literal  "unless"
    add $I11, rx393_pos, 6
    gt $I11, rx393_eos, rx393_fail
    sub $I11, rx393_pos, rx393_off
    substr $S10, rx393_tgt, $I11, 6
    ne $S10, "unless", rx393_fail
    add rx393_pos, 6
    set_addr $I10, rxcap_398_fail
    ($I12, $I11) = rx393_cur."!mark_peek"($I10)
    rx393_cur."!cursor_pos"($I11)
    ($P10) = rx393_cur."!cursor_start"()
    $P10."!cursor_pass"(rx393_pos, "")
    rx393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_398_done
  rxcap_398_fail:
    goto rx393_fail
  rxcap_398_done:
  # rx subrule "ws" subtype=method negate=
    rx393_cur."!cursor_pos"(rx393_pos)
    $P10 = rx393_cur."ws"()
    unless $P10, rx393_fail
    rx393_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx393_cur."!cursor_pos"(rx393_pos)
    $P10 = rx393_cur."EXPR"()
    unless $P10, rx393_fail
    rx393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx393_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx393_cur."!cursor_pos"(rx393_pos)
    $P10 = rx393_cur."ws"()
    unless $P10, rx393_fail
    rx393_pos = $P10."pos"()
  # rx pass
    rx393_cur."!cursor_pass"(rx393_pos, "statement_mod_cond:sym<unless>")
    rx393_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx393_pos)
    .return (rx393_cur)
  rx393_fail:
.annotate 'line', 4
    (rx393_rep, rx393_pos, $I10, $P10) = rx393_cur."!mark_fail"(0)
    lt rx393_pos, -1, rx393_done
    eq rx393_pos, -1, rx393_fail
    jump $I10
  rx393_done:
    rx393_cur."!cursor_fail"()
    rx393_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx393_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1275811487.95429") :method
.annotate 'line', 4
    $P395 = self."!PREFIX__!subrule"("ws", "unless")
    new $P396, "ResizablePMCArray"
    push $P396, $P395
    .return ($P396)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1275811487.95429") :method
.annotate 'line', 217
    $P402 = self."!protoregex"("statement_mod_loop")
    .return ($P402)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1275811487.95429") :method
.annotate 'line', 217
    $P404 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P404)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx406_cur
    .local pmc match
    .lex "$/", match
    length rx406_eos, rx406_tgt
    gt rx406_pos, rx406_eos, rx406_done
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
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_411_fail
    rx406_cur."!mark_push"(0, rx406_pos, $I10)
  # rx literal  "while"
    add $I11, rx406_pos, 5
    gt $I11, rx406_eos, rx406_fail
    sub $I11, rx406_pos, rx406_off
    substr $S10, rx406_tgt, $I11, 5
    ne $S10, "while", rx406_fail
    add rx406_pos, 5
    set_addr $I10, rxcap_411_fail
    ($I12, $I11) = rx406_cur."!mark_peek"($I10)
    rx406_cur."!cursor_pos"($I11)
    ($P10) = rx406_cur."!cursor_start"()
    $P10."!cursor_pass"(rx406_pos, "")
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_411_done
  rxcap_411_fail:
    goto rx406_fail
  rxcap_411_done:
  # rx subrule "ws" subtype=method negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."ws"()
    unless $P10, rx406_fail
    rx406_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."EXPR"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx406_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."ws"()
    unless $P10, rx406_fail
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "statement_mod_loop:sym<while>")
    rx406_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate 'line', 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1275811487.95429") :method
.annotate 'line', 4
    $P408 = self."!PREFIX__!subrule"("ws", "while")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx415_tgt
    .local int rx415_pos
    .local int rx415_off
    .local int rx415_eos
    .local int rx415_rep
    .local pmc rx415_cur
    (rx415_cur, rx415_pos, rx415_tgt) = self."!cursor_start"()
    rx415_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx415_cur
    .local pmc match
    .lex "$/", match
    length rx415_eos, rx415_tgt
    gt rx415_pos, rx415_eos, rx415_done
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
.annotate 'line', 220
  # rx subcapture "sym"
    set_addr $I10, rxcap_420_fail
    rx415_cur."!mark_push"(0, rx415_pos, $I10)
  # rx literal  "until"
    add $I11, rx415_pos, 5
    gt $I11, rx415_eos, rx415_fail
    sub $I11, rx415_pos, rx415_off
    substr $S10, rx415_tgt, $I11, 5
    ne $S10, "until", rx415_fail
    add rx415_pos, 5
    set_addr $I10, rxcap_420_fail
    ($I12, $I11) = rx415_cur."!mark_peek"($I10)
    rx415_cur."!cursor_pos"($I11)
    ($P10) = rx415_cur."!cursor_start"()
    $P10."!cursor_pass"(rx415_pos, "")
    rx415_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_420_done
  rxcap_420_fail:
    goto rx415_fail
  rxcap_420_done:
  # rx subrule "ws" subtype=method negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."ws"()
    unless $P10, rx415_fail
    rx415_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."EXPR"()
    unless $P10, rx415_fail
    rx415_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx415_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."ws"()
    unless $P10, rx415_fail
    rx415_pos = $P10."pos"()
  # rx pass
    rx415_cur."!cursor_pass"(rx415_pos, "statement_mod_loop:sym<until>")
    rx415_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx415_pos)
    .return (rx415_cur)
  rx415_fail:
.annotate 'line', 4
    (rx415_rep, rx415_pos, $I10, $P10) = rx415_cur."!mark_fail"(0)
    lt rx415_pos, -1, rx415_done
    eq rx415_pos, -1, rx415_fail
    jump $I10
  rx415_done:
    rx415_cur."!cursor_fail"()
    rx415_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx415_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1275811487.95429") :method
.annotate 'line', 4
    $P417 = self."!PREFIX__!subrule"("ws", "until")
    new $P418, "ResizablePMCArray"
    push $P418, $P417
    .return ($P418)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("97_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
.annotate 'line', 224
  # rx subrule "fatarrow" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."fatarrow"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<fatarrow>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate 'line', 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("98_1275811487.95429") :method
.annotate 'line', 4
    $P426 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("99_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
.annotate 'line', 225
  # rx subrule "colonpair" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."colonpair"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<colonpair>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate 'line', 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("100_1275811487.95429") :method
.annotate 'line', 4
    $P432 = self."!PREFIX__!subrule"("colonpair", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("101_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<variable>")
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
.annotate 'line', 226
  # rx subrule "variable" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."variable"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<variable>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate 'line', 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("102_1275811487.95429") :method
.annotate 'line', 4
    $P438 = self."!PREFIX__!subrule"("variable", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("103_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
.annotate 'line', 227
  # rx subrule "package_declarator" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."package_declarator"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<package_declarator>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate 'line', 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("104_1275811487.95429") :method
.annotate 'line', 4
    $P444 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("105_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    (rx448_cur, rx448_pos, rx448_tgt) = self."!cursor_start"()
    rx448_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
.annotate 'line', 228
  # rx subrule "scope_declarator" subtype=capture negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."scope_declarator"()
    unless $P10, rx448_fail
    rx448_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "term:sym<scope_declarator>")
    rx448_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx448_pos)
    .return (rx448_cur)
  rx448_fail:
.annotate 'line', 4
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    rx448_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("106_1275811487.95429") :method
.annotate 'line', 4
    $P450 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P451, "ResizablePMCArray"
    push $P451, $P450
    .return ($P451)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("107_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt) = self."!cursor_start"()
    rx454_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
    ne $I10, -1, rxscan458_done
    goto rxscan458_scan
  rxscan458_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan458_done
  rxscan458_scan:
    set_addr $I10, rxscan458_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan458_done:
.annotate 'line', 229
  # rx subrule "routine_declarator" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."routine_declarator"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx454_pos = $P10."pos"()
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "term:sym<routine_declarator>")
    rx454_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_fail:
.annotate 'line', 4
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("108_1275811487.95429") :method
.annotate 'line', 4
    $P456 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P457, "ResizablePMCArray"
    push $P457, $P456
    .return ($P457)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("109_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P465 = "111_1275811487.95429" 
    capture_lex $P465
    .local string rx460_tgt
    .local int rx460_pos
    .local int rx460_off
    .local int rx460_eos
    .local int rx460_rep
    .local pmc rx460_cur
    (rx460_cur, rx460_pos, rx460_tgt) = self."!cursor_start"()
    rx460_cur."!cursor_debug"("START ", "term:sym<multi_declarator>")
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
    ne $I10, -1, rxscan463_done
    goto rxscan463_scan
  rxscan463_loop:
    ($P10) = rx460_cur."from"()
    inc $P10
    set rx460_pos, $P10
    ge rx460_pos, rx460_eos, rxscan463_done
  rxscan463_scan:
    set_addr $I10, rxscan463_loop
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  rxscan463_done:
.annotate 'line', 230
  # rx subrule "before" subtype=zerowidth negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    .const 'Sub' $P465 = "111_1275811487.95429" 
    capture_lex $P465
    $P10 = rx460_cur."before"($P465)
    unless $P10, rx460_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    $P10 = rx460_cur."multi_declarator"()
    unless $P10, rx460_fail
    rx460_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx460_pos = $P10."pos"()
  # rx pass
    rx460_cur."!cursor_pass"(rx460_pos, "term:sym<multi_declarator>")
    rx460_cur."!cursor_debug"("PASS  ", "term:sym<multi_declarator>", " at pos=", rx460_pos)
    .return (rx460_cur)
  rx460_fail:
.annotate 'line', 4
    (rx460_rep, rx460_pos, $I10, $P10) = rx460_cur."!mark_fail"(0)
    lt rx460_pos, -1, rx460_done
    eq rx460_pos, -1, rx460_fail
    jump $I10
  rx460_done:
    rx460_cur."!cursor_fail"()
    rx460_cur."!cursor_debug"("FAIL  ", "term:sym<multi_declarator>")
    .return (rx460_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("110_1275811487.95429") :method
.annotate 'line', 4
    new $P462, "ResizablePMCArray"
    push $P462, ""
    .return ($P462)
.end


.namespace ["NQP";"Grammar"]
.sub "_block464"  :anon :subid("111_1275811487.95429") :method :outer("109_1275811487.95429")
.annotate 'line', 230
    .local string rx466_tgt
    .local int rx466_pos
    .local int rx466_off
    .local int rx466_eos
    .local int rx466_rep
    .local pmc rx466_cur
    (rx466_cur, rx466_pos, rx466_tgt) = self."!cursor_start"()
    rx466_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx466_cur
    .local pmc match
    .lex "$/", match
    length rx466_eos, rx466_tgt
    gt rx466_pos, rx466_eos, rx466_done
    set rx466_off, 0
    lt rx466_pos, 2, rx466_start
    sub rx466_off, rx466_pos, 1
    substr rx466_tgt, rx466_tgt, rx466_off
  rx466_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx466_cur."from"()
    inc $P10
    set rx466_pos, $P10
    ge rx466_pos, rx466_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  rxscan467_done:
  alt468_0:
    set_addr $I10, alt468_1
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  # rx literal  "multi"
    add $I11, rx466_pos, 5
    gt $I11, rx466_eos, rx466_fail
    sub $I11, rx466_pos, rx466_off
    substr $S10, rx466_tgt, $I11, 5
    ne $S10, "multi", rx466_fail
    add rx466_pos, 5
    goto alt468_end
  alt468_1:
    set_addr $I10, alt468_2
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  # rx literal  "proto"
    add $I11, rx466_pos, 5
    gt $I11, rx466_eos, rx466_fail
    sub $I11, rx466_pos, rx466_off
    substr $S10, rx466_tgt, $I11, 5
    ne $S10, "proto", rx466_fail
    add rx466_pos, 5
    goto alt468_end
  alt468_2:
  # rx literal  "only"
    add $I11, rx466_pos, 4
    gt $I11, rx466_eos, rx466_fail
    sub $I11, rx466_pos, rx466_off
    substr $S10, rx466_tgt, $I11, 4
    ne $S10, "only", rx466_fail
    add rx466_pos, 4
  alt468_end:
  # rx pass
    rx466_cur."!cursor_pass"(rx466_pos, "")
    rx466_cur."!cursor_debug"("PASS  ", "", " at pos=", rx466_pos)
    .return (rx466_cur)
  rx466_fail:
    (rx466_rep, rx466_pos, $I10, $P10) = rx466_cur."!mark_fail"(0)
    lt rx466_pos, -1, rx466_done
    eq rx466_pos, -1, rx466_fail
    jump $I10
  rx466_done:
    rx466_cur."!cursor_fail"()
    rx466_cur."!cursor_debug"("FAIL  ", "")
    .return (rx466_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("112_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt) = self."!cursor_start"()
    rx470_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
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
.annotate 'line', 231
  # rx subrule "regex_declarator" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."regex_declarator"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx470_pos = $P10."pos"()
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "term:sym<regex_declarator>")
    rx470_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_fail:
.annotate 'line', 4
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("113_1275811487.95429") :method
.annotate 'line', 4
    $P472 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P473, "ResizablePMCArray"
    push $P473, $P472
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("114_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
    ne $I10, -1, rxscan480_done
    goto rxscan480_scan
  rxscan480_loop:
    ($P10) = rx476_cur."from"()
    inc $P10
    set rx476_pos, $P10
    ge rx476_pos, rx476_eos, rxscan480_done
  rxscan480_scan:
    set_addr $I10, rxscan480_loop
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  rxscan480_done:
.annotate 'line', 232
  # rx subrule "statement_prefix" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."statement_prefix"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx476_pos = $P10."pos"()
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "term:sym<statement_prefix>")
    rx476_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate 'line', 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("115_1275811487.95429") :method
.annotate 'line', 4
    $P478 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P479, "ResizablePMCArray"
    push $P479, $P478
    .return ($P479)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("116_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt) = self."!cursor_start"()
    rx482_cur."!cursor_debug"("START ", "term:sym<lambda>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan485_done
    goto rxscan485_scan
  rxscan485_loop:
    ($P10) = rx482_cur."from"()
    inc $P10
    set rx482_pos, $P10
    ge rx482_pos, rx482_eos, rxscan485_done
  rxscan485_scan:
    set_addr $I10, rxscan485_loop
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxscan485_done:
.annotate 'line', 233
  # rx subrule "lambda" subtype=zerowidth negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."lambda"()
    unless $P10, rx482_fail
  # rx subrule "pblock" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."pblock"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx482_pos = $P10."pos"()
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "term:sym<lambda>")
    rx482_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_fail:
.annotate 'line', 4
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("117_1275811487.95429") :method
.annotate 'line', 4
    new $P484, "ResizablePMCArray"
    push $P484, ""
    .return ($P484)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("118_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx487_tgt
    .local int rx487_pos
    .local int rx487_off
    .local int rx487_eos
    .local int rx487_rep
    .local pmc rx487_cur
    (rx487_cur, rx487_pos, rx487_tgt) = self."!cursor_start"()
    rx487_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx487_cur
    .local pmc match
    .lex "$/", match
    length rx487_eos, rx487_tgt
    gt rx487_pos, rx487_eos, rx487_done
    set rx487_off, 0
    lt rx487_pos, 2, rx487_start
    sub rx487_off, rx487_pos, 1
    substr rx487_tgt, rx487_tgt, rx487_off
  rx487_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan491_done
    goto rxscan491_scan
  rxscan491_loop:
    ($P10) = rx487_cur."from"()
    inc $P10
    set rx487_pos, $P10
    ge rx487_pos, rx487_eos, rxscan491_done
  rxscan491_scan:
    set_addr $I10, rxscan491_loop
    rx487_cur."!mark_push"(0, rx487_pos, $I10)
  rxscan491_done:
.annotate 'line', 236
  # rx subrule "identifier" subtype=capture negate=
    rx487_cur."!cursor_pos"(rx487_pos)
    $P10 = rx487_cur."identifier"()
    unless $P10, rx487_fail
    rx487_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx487_pos = $P10."pos"()
  # rx rxquantr492 ** 0..*
    set_addr $I493, rxquantr492_done
    rx487_cur."!mark_push"(0, rx487_pos, $I493)
  rxquantr492_loop:
  # rx enumcharlist negate=0 
    ge rx487_pos, rx487_eos, rx487_fail
    sub $I10, rx487_pos, rx487_off
    substr $S10, rx487_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx487_fail
    inc rx487_pos
    (rx487_rep) = rx487_cur."!mark_commit"($I493)
    rx487_cur."!mark_push"(rx487_rep, rx487_pos, $I493)
    goto rxquantr492_loop
  rxquantr492_done:
  # rx literal  "=>"
    add $I11, rx487_pos, 2
    gt $I11, rx487_eos, rx487_fail
    sub $I11, rx487_pos, rx487_off
    substr $S10, rx487_tgt, $I11, 2
    ne $S10, "=>", rx487_fail
    add rx487_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx487_cur."!cursor_pos"(rx487_pos)
    $P10 = rx487_cur."ws"()
    unless $P10, rx487_fail
    rx487_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx487_cur."!cursor_pos"(rx487_pos)
    $P10 = rx487_cur."EXPR"("i=")
    unless $P10, rx487_fail
    rx487_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx487_pos = $P10."pos"()
.annotate 'line', 235
  # rx pass
    rx487_cur."!cursor_pass"(rx487_pos, "fatarrow")
    rx487_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx487_pos)
    .return (rx487_cur)
  rx487_fail:
.annotate 'line', 4
    (rx487_rep, rx487_pos, $I10, $P10) = rx487_cur."!mark_fail"(0)
    lt rx487_pos, -1, rx487_done
    eq rx487_pos, -1, rx487_fail
    jump $I10
  rx487_done:
    rx487_cur."!cursor_fail"()
    rx487_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx487_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("119_1275811487.95429") :method
.annotate 'line', 4
    $P489 = self."!PREFIX__!subrule"("identifier", "")
    new $P490, "ResizablePMCArray"
    push $P490, $P489
    .return ($P490)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("120_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx495_tgt
    .local int rx495_pos
    .local int rx495_off
    .local int rx495_eos
    .local int rx495_rep
    .local pmc rx495_cur
    (rx495_cur, rx495_pos, rx495_tgt) = self."!cursor_start"()
    rx495_cur."!cursor_debug"("START ", "colonpair")
    rx495_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx495_cur
    .local pmc match
    .lex "$/", match
    length rx495_eos, rx495_tgt
    gt rx495_pos, rx495_eos, rx495_done
    set rx495_off, 0
    lt rx495_pos, 2, rx495_start
    sub rx495_off, rx495_pos, 1
    substr rx495_tgt, rx495_tgt, rx495_off
  rx495_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan501_done
    goto rxscan501_scan
  rxscan501_loop:
    ($P10) = rx495_cur."from"()
    inc $P10
    set rx495_pos, $P10
    ge rx495_pos, rx495_eos, rxscan501_done
  rxscan501_scan:
    set_addr $I10, rxscan501_loop
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxscan501_done:
.annotate 'line', 240
  # rx literal  ":"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, ":", rx495_fail
    add rx495_pos, 1
  alt502_0:
.annotate 'line', 241
    set_addr $I10, alt502_1
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 242
  # rx subcapture "not"
    set_addr $I10, rxcap_503_fail
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  # rx literal  "!"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, "!", rx495_fail
    add rx495_pos, 1
    set_addr $I10, rxcap_503_fail
    ($I12, $I11) = rx495_cur."!mark_peek"($I10)
    rx495_cur."!cursor_pos"($I11)
    ($P10) = rx495_cur."!cursor_start"()
    $P10."!cursor_pass"(rx495_pos, "")
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_503_done
  rxcap_503_fail:
    goto rx495_fail
  rxcap_503_done:
  # rx subrule "identifier" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."identifier"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx495_pos = $P10."pos"()
    goto alt502_end
  alt502_1:
    set_addr $I10, alt502_2
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 243
  # rx subrule "identifier" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."identifier"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx495_pos = $P10."pos"()
  # rx rxquantr504 ** 0..1
    set_addr $I505, rxquantr504_done
    rx495_cur."!mark_push"(0, rx495_pos, $I505)
  rxquantr504_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."circumfix"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx495_pos = $P10."pos"()
    (rx495_rep) = rx495_cur."!mark_commit"($I505)
  rxquantr504_done:
    goto alt502_end
  alt502_2:
.annotate 'line', 244
  # rx subrule "circumfix" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."circumfix"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx495_pos = $P10."pos"()
  alt502_end:
.annotate 'line', 239
  # rx pass
    rx495_cur."!cursor_pass"(rx495_pos, "colonpair")
    rx495_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx495_pos)
    .return (rx495_cur)
  rx495_fail:
.annotate 'line', 4
    (rx495_rep, rx495_pos, $I10, $P10) = rx495_cur."!mark_fail"(0)
    lt rx495_pos, -1, rx495_done
    eq rx495_pos, -1, rx495_fail
    jump $I10
  rx495_done:
    rx495_cur."!cursor_fail"()
    rx495_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx495_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("121_1275811487.95429") :method
.annotate 'line', 4
    $P497 = self."!PREFIX__!subrule"("circumfix", ":")
    $P498 = self."!PREFIX__!subrule"("identifier", ":")
    $P499 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P500, "ResizablePMCArray"
    push $P500, $P497
    push $P500, $P498
    push $P500, $P499
    .return ($P500)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("122_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx507_tgt
    .local int rx507_pos
    .local int rx507_off
    .local int rx507_eos
    .local int rx507_rep
    .local pmc rx507_cur
    (rx507_cur, rx507_pos, rx507_tgt) = self."!cursor_start"()
    rx507_cur."!cursor_debug"("START ", "variable")
    rx507_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx507_cur
    .local pmc match
    .lex "$/", match
    length rx507_eos, rx507_tgt
    gt rx507_pos, rx507_eos, rx507_done
    set rx507_off, 0
    lt rx507_pos, 2, rx507_start
    sub rx507_off, rx507_pos, 1
    substr rx507_tgt, rx507_tgt, rx507_off
  rx507_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan512_done
    goto rxscan512_scan
  rxscan512_loop:
    ($P10) = rx507_cur."from"()
    inc $P10
    set rx507_pos, $P10
    ge rx507_pos, rx507_eos, rxscan512_done
  rxscan512_scan:
    set_addr $I10, rxscan512_loop
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  rxscan512_done:
  alt513_0:
.annotate 'line', 248
    set_addr $I10, alt513_1
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
.annotate 'line', 249
  # rx subrule "sigil" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."sigil"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx507_pos = $P10."pos"()
  # rx rxquantr514 ** 0..1
    set_addr $I515, rxquantr514_done
    rx507_cur."!mark_push"(0, rx507_pos, $I515)
  rxquantr514_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."twigil"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx507_pos = $P10."pos"()
    (rx507_rep) = rx507_cur."!mark_commit"($I515)
  rxquantr514_done:
  # rx subrule "name" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."name"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx507_pos = $P10."pos"()
    goto alt513_end
  alt513_1:
    set_addr $I10, alt513_2
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."sigil"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx507_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx507_pos, rx507_eos, rx507_fail
    sub $I10, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx507_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."postcircumfix"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx507_pos = $P10."pos"()
    goto alt513_end
  alt513_2:
.annotate 'line', 251
  # rx subcapture "sigil"
    set_addr $I10, rxcap_516_fail
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  # rx literal  "$"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "$", rx507_fail
    add rx507_pos, 1
    set_addr $I10, rxcap_516_fail
    ($I12, $I11) = rx507_cur."!mark_peek"($I10)
    rx507_cur."!cursor_pos"($I11)
    ($P10) = rx507_cur."!cursor_start"()
    $P10."!cursor_pass"(rx507_pos, "")
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_516_done
  rxcap_516_fail:
    goto rx507_fail
  rxcap_516_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_517_fail
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx507_pos, rx507_eos, rx507_fail
    sub $I10, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx507_fail
    inc rx507_pos
    set_addr $I10, rxcap_517_fail
    ($I12, $I11) = rx507_cur."!mark_peek"($I10)
    rx507_cur."!cursor_pos"($I11)
    ($P10) = rx507_cur."!cursor_start"()
    $P10."!cursor_pass"(rx507_pos, "")
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_517_done
  rxcap_517_fail:
    goto rx507_fail
  rxcap_517_done:
  alt513_end:
.annotate 'line', 248
  # rx pass
    rx507_cur."!cursor_pass"(rx507_pos, "variable")
    rx507_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx507_pos)
    .return (rx507_cur)
  rx507_fail:
.annotate 'line', 4
    (rx507_rep, rx507_pos, $I10, $P10) = rx507_cur."!mark_fail"(0)
    lt rx507_pos, -1, rx507_done
    eq rx507_pos, -1, rx507_fail
    jump $I10
  rx507_done:
    rx507_cur."!cursor_fail"()
    rx507_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx507_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("123_1275811487.95429") :method
.annotate 'line', 4
    $P509 = self."!PREFIX__!subrule"("sigil", "")
    $P510 = self."!PREFIX__!subrule"("sigil", "")
    new $P511, "ResizablePMCArray"
    push $P511, "$!"
    push $P511, "$_"
    push $P511, "$/"
    push $P511, $P509
    push $P511, $P510
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("124_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx519_tgt
    .local int rx519_pos
    .local int rx519_off
    .local int rx519_eos
    .local int rx519_rep
    .local pmc rx519_cur
    (rx519_cur, rx519_pos, rx519_tgt) = self."!cursor_start"()
    rx519_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx519_cur
    .local pmc match
    .lex "$/", match
    length rx519_eos, rx519_tgt
    gt rx519_pos, rx519_eos, rx519_done
    set rx519_off, 0
    lt rx519_pos, 2, rx519_start
    sub rx519_off, rx519_pos, 1
    substr rx519_tgt, rx519_tgt, rx519_off
  rx519_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx519_cur."from"()
    inc $P10
    set rx519_pos, $P10
    ge rx519_pos, rx519_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  rxscan522_done:
.annotate 'line', 254
  # rx enumcharlist negate=0 
    ge rx519_pos, rx519_eos, rx519_fail
    sub $I10, rx519_pos, rx519_off
    substr $S10, rx519_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx519_fail
    inc rx519_pos
  # rx pass
    rx519_cur."!cursor_pass"(rx519_pos, "sigil")
    rx519_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx519_pos)
    .return (rx519_cur)
  rx519_fail:
.annotate 'line', 4
    (rx519_rep, rx519_pos, $I10, $P10) = rx519_cur."!mark_fail"(0)
    lt rx519_pos, -1, rx519_done
    eq rx519_pos, -1, rx519_fail
    jump $I10
  rx519_done:
    rx519_cur."!cursor_fail"()
    rx519_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx519_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("125_1275811487.95429") :method
.annotate 'line', 4
    new $P521, "ResizablePMCArray"
    push $P521, "&"
    push $P521, "%"
    push $P521, "@"
    push $P521, "$"
    .return ($P521)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("126_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx524_tgt
    .local int rx524_pos
    .local int rx524_off
    .local int rx524_eos
    .local int rx524_rep
    .local pmc rx524_cur
    (rx524_cur, rx524_pos, rx524_tgt) = self."!cursor_start"()
    rx524_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx524_cur
    .local pmc match
    .lex "$/", match
    length rx524_eos, rx524_tgt
    gt rx524_pos, rx524_eos, rx524_done
    set rx524_off, 0
    lt rx524_pos, 2, rx524_start
    sub rx524_off, rx524_pos, 1
    substr rx524_tgt, rx524_tgt, rx524_off
  rx524_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan527_done
    goto rxscan527_scan
  rxscan527_loop:
    ($P10) = rx524_cur."from"()
    inc $P10
    set rx524_pos, $P10
    ge rx524_pos, rx524_eos, rxscan527_done
  rxscan527_scan:
    set_addr $I10, rxscan527_loop
    rx524_cur."!mark_push"(0, rx524_pos, $I10)
  rxscan527_done:
.annotate 'line', 256
  # rx enumcharlist negate=0 
    ge rx524_pos, rx524_eos, rx524_fail
    sub $I10, rx524_pos, rx524_off
    substr $S10, rx524_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx524_fail
    inc rx524_pos
  # rx pass
    rx524_cur."!cursor_pass"(rx524_pos, "twigil")
    rx524_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx524_pos)
    .return (rx524_cur)
  rx524_fail:
.annotate 'line', 4
    (rx524_rep, rx524_pos, $I10, $P10) = rx524_cur."!mark_fail"(0)
    lt rx524_pos, -1, rx524_done
    eq rx524_pos, -1, rx524_fail
    jump $I10
  rx524_done:
    rx524_cur."!cursor_fail"()
    rx524_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx524_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("127_1275811487.95429") :method
.annotate 'line', 4
    new $P526, "ResizablePMCArray"
    push $P526, "?"
    push $P526, "!"
    push $P526, "*"
    .return ($P526)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("128_1275811487.95429") :method
.annotate 'line', 258
    $P529 = self."!protoregex"("package_declarator")
    .return ($P529)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("129_1275811487.95429") :method
.annotate 'line', 258
    $P531 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("130_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx533_tgt
    .local int rx533_pos
    .local int rx533_off
    .local int rx533_eos
    .local int rx533_rep
    .local pmc rx533_cur
    (rx533_cur, rx533_pos, rx533_tgt) = self."!cursor_start"()
    rx533_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx533_cur
    .local pmc match
    .lex "$/", match
    length rx533_eos, rx533_tgt
    gt rx533_pos, rx533_eos, rx533_done
    set rx533_off, 0
    lt rx533_pos, 2, rx533_start
    sub rx533_off, rx533_pos, 1
    substr rx533_tgt, rx533_tgt, rx533_off
  rx533_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan537_done
    goto rxscan537_scan
  rxscan537_loop:
    ($P10) = rx533_cur."from"()
    inc $P10
    set rx533_pos, $P10
    ge rx533_pos, rx533_eos, rxscan537_done
  rxscan537_scan:
    set_addr $I10, rxscan537_loop
    rx533_cur."!mark_push"(0, rx533_pos, $I10)
  rxscan537_done:
.annotate 'line', 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_538_fail
    rx533_cur."!mark_push"(0, rx533_pos, $I10)
  # rx literal  "module"
    add $I11, rx533_pos, 6
    gt $I11, rx533_eos, rx533_fail
    sub $I11, rx533_pos, rx533_off
    substr $S10, rx533_tgt, $I11, 6
    ne $S10, "module", rx533_fail
    add rx533_pos, 6
    set_addr $I10, rxcap_538_fail
    ($I12, $I11) = rx533_cur."!mark_peek"($I10)
    rx533_cur."!cursor_pos"($I11)
    ($P10) = rx533_cur."!cursor_start"()
    $P10."!cursor_pass"(rx533_pos, "")
    rx533_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_538_done
  rxcap_538_fail:
    goto rx533_fail
  rxcap_538_done:
  # rx subrule "package_def" subtype=capture negate=
    rx533_cur."!cursor_pos"(rx533_pos)
    $P10 = rx533_cur."package_def"()
    unless $P10, rx533_fail
    rx533_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx533_pos = $P10."pos"()
  # rx pass
    rx533_cur."!cursor_pass"(rx533_pos, "package_declarator:sym<module>")
    rx533_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx533_pos)
    .return (rx533_cur)
  rx533_fail:
.annotate 'line', 4
    (rx533_rep, rx533_pos, $I10, $P10) = rx533_cur."!mark_fail"(0)
    lt rx533_pos, -1, rx533_done
    eq rx533_pos, -1, rx533_fail
    jump $I10
  rx533_done:
    rx533_cur."!cursor_fail"()
    rx533_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx533_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("131_1275811487.95429") :method
.annotate 'line', 4
    $P535 = self."!PREFIX__!subrule"("package_def", "module")
    new $P536, "ResizablePMCArray"
    push $P536, $P535
    .return ($P536)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("132_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx540_tgt
    .local int rx540_pos
    .local int rx540_off
    .local int rx540_eos
    .local int rx540_rep
    .local pmc rx540_cur
    (rx540_cur, rx540_pos, rx540_tgt) = self."!cursor_start"()
    rx540_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx540_cur
    .local pmc match
    .lex "$/", match
    length rx540_eos, rx540_tgt
    gt rx540_pos, rx540_eos, rx540_done
    set rx540_off, 0
    lt rx540_pos, 2, rx540_start
    sub rx540_off, rx540_pos, 1
    substr rx540_tgt, rx540_tgt, rx540_off
  rx540_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan545_done
    goto rxscan545_scan
  rxscan545_loop:
    ($P10) = rx540_cur."from"()
    inc $P10
    set rx540_pos, $P10
    ge rx540_pos, rx540_eos, rxscan545_done
  rxscan545_scan:
    set_addr $I10, rxscan545_loop
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  rxscan545_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_547_fail
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  alt546_0:
    set_addr $I10, alt546_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx literal  "class"
    add $I11, rx540_pos, 5
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 5
    ne $S10, "class", rx540_fail
    add rx540_pos, 5
    goto alt546_end
  alt546_1:
  # rx literal  "grammar"
    add $I11, rx540_pos, 7
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 7
    ne $S10, "grammar", rx540_fail
    add rx540_pos, 7
  alt546_end:
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx540_cur."!mark_peek"($I10)
    rx540_cur."!cursor_pos"($I11)
    ($P10) = rx540_cur."!cursor_start"()
    $P10."!cursor_pass"(rx540_pos, "")
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx540_fail
  rxcap_547_done:
  # rx subrule "package_def" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."package_def"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx540_pos = $P10."pos"()
  # rx pass
    rx540_cur."!cursor_pass"(rx540_pos, "package_declarator:sym<class>")
    rx540_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx540_pos)
    .return (rx540_cur)
  rx540_fail:
.annotate 'line', 4
    (rx540_rep, rx540_pos, $I10, $P10) = rx540_cur."!mark_fail"(0)
    lt rx540_pos, -1, rx540_done
    eq rx540_pos, -1, rx540_fail
    jump $I10
  rx540_done:
    rx540_cur."!cursor_fail"()
    rx540_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx540_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("133_1275811487.95429") :method
.annotate 'line', 4
    $P542 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P543 = self."!PREFIX__!subrule"("package_def", "class")
    new $P544, "ResizablePMCArray"
    push $P544, $P542
    push $P544, $P543
    .return ($P544)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("134_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx549_tgt
    .local int rx549_pos
    .local int rx549_off
    .local int rx549_eos
    .local int rx549_rep
    .local pmc rx549_cur
    (rx549_cur, rx549_pos, rx549_tgt) = self."!cursor_start"()
    rx549_cur."!cursor_debug"("START ", "package_def")
    rx549_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx549_cur
    .local pmc match
    .lex "$/", match
    length rx549_eos, rx549_tgt
    gt rx549_pos, rx549_eos, rx549_done
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
.annotate 'line', 262
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
.annotate 'line', 263
  # rx subrule "name" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."name"()
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx549_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
.annotate 'line', 264
  # rx rxquantr556 ** 0..1
    set_addr $I560, rxquantr556_done
    rx549_cur."!mark_push"(0, rx549_pos, $I560)
  rxquantr556_loop:
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx549_pos, 2
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 2
    ne $S10, "is", rx549_fail
    add rx549_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."name"()
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx549_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
    (rx549_rep) = rx549_cur."!mark_commit"($I560)
  rxquantr556_done:
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  alt562_0:
.annotate 'line', 265
    set_addr $I10, alt562_1
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
.annotate 'line', 266
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx549_pos, 1
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 1
    ne $S10, ";", rx549_fail
    add rx549_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."comp_unit"()
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx549_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
    goto alt562_end
  alt562_1:
    set_addr $I10, alt562_2
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx549_pos, rx549_eos, rx549_fail
    sub $I10, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx549_fail
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."block"()
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx549_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
    goto alt562_end
  alt562_2:
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."panic"("Malformed package declaration")
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
  alt562_end:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."ws"()
    unless $P10, rx549_fail
    rx549_pos = $P10."pos"()
.annotate 'line', 262
  # rx pass
    rx549_cur."!cursor_pass"(rx549_pos, "package_def")
    rx549_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx549_pos)
    .return (rx549_cur)
  rx549_fail:
.annotate 'line', 4
    (rx549_rep, rx549_pos, $I10, $P10) = rx549_cur."!mark_fail"(0)
    lt rx549_pos, -1, rx549_done
    eq rx549_pos, -1, rx549_fail
    jump $I10
  rx549_done:
    rx549_cur."!cursor_fail"()
    rx549_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx549_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("135_1275811487.95429") :method
.annotate 'line', 4
    $P551 = self."!PREFIX__!subrule"("ws", "")
    new $P552, "ResizablePMCArray"
    push $P552, $P551
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("136_1275811487.95429") :method
.annotate 'line', 272
    $P573 = self."!protoregex"("scope_declarator")
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("137_1275811487.95429") :method
.annotate 'line', 272
    $P575 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P575)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("138_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
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
.annotate 'line', 273
  # rx subcapture "sym"
    set_addr $I10, rxcap_582_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "my"
    add $I11, rx577_pos, 2
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 2
    ne $S10, "my", rx577_fail
    add rx577_pos, 2
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
    $P10 = rx577_cur."scoped"("my")
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "scope_declarator:sym<my>")
    rx577_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate 'line', 4
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("139_1275811487.95429") :method
.annotate 'line', 4
    $P579 = self."!PREFIX__!subrule"("scoped", "my")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("140_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
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
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_589_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx literal  "our"
    add $I11, rx584_pos, 3
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 3
    ne $S10, "our", rx584_fail
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
    $P10 = rx584_cur."scoped"("our")
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx584_pos = $P10."pos"()
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "scope_declarator:sym<our>")
    rx584_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate 'line', 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("141_1275811487.95429") :method
.annotate 'line', 4
    $P586 = self."!PREFIX__!subrule"("scoped", "our")
    new $P587, "ResizablePMCArray"
    push $P587, $P586
    .return ($P587)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("142_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx591_tgt
    .local int rx591_pos
    .local int rx591_off
    .local int rx591_eos
    .local int rx591_rep
    .local pmc rx591_cur
    (rx591_cur, rx591_pos, rx591_tgt) = self."!cursor_start"()
    rx591_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx591_cur
    .local pmc match
    .lex "$/", match
    length rx591_eos, rx591_tgt
    gt rx591_pos, rx591_eos, rx591_done
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
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_596_fail
    rx591_cur."!mark_push"(0, rx591_pos, $I10)
  # rx literal  "has"
    add $I11, rx591_pos, 3
    gt $I11, rx591_eos, rx591_fail
    sub $I11, rx591_pos, rx591_off
    substr $S10, rx591_tgt, $I11, 3
    ne $S10, "has", rx591_fail
    add rx591_pos, 3
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
  # rx subrule "scoped" subtype=capture negate=
    rx591_cur."!cursor_pos"(rx591_pos)
    $P10 = rx591_cur."scoped"("has")
    unless $P10, rx591_fail
    rx591_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx591_pos = $P10."pos"()
  # rx pass
    rx591_cur."!cursor_pass"(rx591_pos, "scope_declarator:sym<has>")
    rx591_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx591_pos)
    .return (rx591_cur)
  rx591_fail:
.annotate 'line', 4
    (rx591_rep, rx591_pos, $I10, $P10) = rx591_cur."!mark_fail"(0)
    lt rx591_pos, -1, rx591_done
    eq rx591_pos, -1, rx591_fail
    jump $I10
  rx591_done:
    rx591_cur."!cursor_fail"()
    rx591_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx591_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("143_1275811487.95429") :method
.annotate 'line', 4
    $P593 = self."!PREFIX__!subrule"("scoped", "has")
    new $P594, "ResizablePMCArray"
    push $P594, $P593
    .return ($P594)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("144_1275811487.95429") :method :outer("11_1275811487.95429")
    .param pmc param_598
.annotate 'line', 277
    .lex "$*SCOPE", param_598
.annotate 'line', 4
    .local string rx599_tgt
    .local int rx599_pos
    .local int rx599_off
    .local int rx599_eos
    .local int rx599_rep
    .local pmc rx599_cur
    (rx599_cur, rx599_pos, rx599_tgt) = self."!cursor_start"()
    rx599_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx599_cur
    .local pmc match
    .lex "$/", match
    length rx599_eos, rx599_tgt
    gt rx599_pos, rx599_eos, rx599_done
    set rx599_off, 0
    lt rx599_pos, 2, rx599_start
    sub rx599_off, rx599_pos, 1
    substr rx599_tgt, rx599_tgt, rx599_off
  rx599_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan604_done
    goto rxscan604_scan
  rxscan604_loop:
    ($P10) = rx599_cur."from"()
    inc $P10
    set rx599_pos, $P10
    ge rx599_pos, rx599_eos, rxscan604_done
  rxscan604_scan:
    set_addr $I10, rxscan604_loop
    rx599_cur."!mark_push"(0, rx599_pos, $I10)
  rxscan604_done:
  alt605_0:
.annotate 'line', 277
    set_addr $I10, alt605_1
    rx599_cur."!mark_push"(0, rx599_pos, $I10)
.annotate 'line', 278
  # rx subrule "ws" subtype=method negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."ws"()
    unless $P10, rx599_fail
    rx599_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."declarator"()
    unless $P10, rx599_fail
    rx599_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx599_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."ws"()
    unless $P10, rx599_fail
    rx599_pos = $P10."pos"()
    goto alt605_end
  alt605_1:
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."ws"()
    unless $P10, rx599_fail
    rx599_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."multi_declarator"()
    unless $P10, rx599_fail
    rx599_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx599_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."ws"()
    unless $P10, rx599_fail
    rx599_pos = $P10."pos"()
  alt605_end:
.annotate 'line', 277
  # rx pass
    rx599_cur."!cursor_pass"(rx599_pos, "scoped")
    rx599_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx599_pos)
    .return (rx599_cur)
  rx599_fail:
.annotate 'line', 4
    (rx599_rep, rx599_pos, $I10, $P10) = rx599_cur."!mark_fail"(0)
    lt rx599_pos, -1, rx599_done
    eq rx599_pos, -1, rx599_fail
    jump $I10
  rx599_done:
    rx599_cur."!cursor_fail"()
    rx599_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx599_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("145_1275811487.95429") :method
.annotate 'line', 4
    $P601 = self."!PREFIX__!subrule"("ws", "")
    $P602 = self."!PREFIX__!subrule"("ws", "")
    new $P603, "ResizablePMCArray"
    push $P603, $P601
    push $P603, $P602
    .return ($P603)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("146_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx611_tgt
    .local int rx611_pos
    .local int rx611_off
    .local int rx611_eos
    .local int rx611_rep
    .local pmc rx611_cur
    (rx611_cur, rx611_pos, rx611_tgt) = self."!cursor_start"()
    rx611_cur."!cursor_debug"("START ", "typename")
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
.annotate 'line', 282
  # rx subrule "name" subtype=capture negate=
    rx611_cur."!cursor_pos"(rx611_pos)
    $P10 = rx611_cur."name"()
    unless $P10, rx611_fail
    rx611_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx611_pos = $P10."pos"()
  # rx pass
    rx611_cur."!cursor_pass"(rx611_pos, "typename")
    rx611_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx611_pos)
    .return (rx611_cur)
  rx611_fail:
.annotate 'line', 4
    (rx611_rep, rx611_pos, $I10, $P10) = rx611_cur."!mark_fail"(0)
    lt rx611_pos, -1, rx611_done
    eq rx611_pos, -1, rx611_fail
    jump $I10
  rx611_done:
    rx611_cur."!cursor_fail"()
    rx611_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx611_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("147_1275811487.95429") :method
.annotate 'line', 4
    $P613 = self."!PREFIX__!subrule"("name", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("148_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx617_tgt
    .local int rx617_pos
    .local int rx617_off
    .local int rx617_eos
    .local int rx617_rep
    .local pmc rx617_cur
    (rx617_cur, rx617_pos, rx617_tgt) = self."!cursor_start"()
    rx617_cur."!cursor_debug"("START ", "declarator")
    .lex unicode:"$\x{a2}", rx617_cur
    .local pmc match
    .lex "$/", match
    length rx617_eos, rx617_tgt
    gt rx617_pos, rx617_eos, rx617_done
    set rx617_off, 0
    lt rx617_pos, 2, rx617_start
    sub rx617_off, rx617_pos, 1
    substr rx617_tgt, rx617_tgt, rx617_off
  rx617_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan622_done
    goto rxscan622_scan
  rxscan622_loop:
    ($P10) = rx617_cur."from"()
    inc $P10
    set rx617_pos, $P10
    ge rx617_pos, rx617_eos, rxscan622_done
  rxscan622_scan:
    set_addr $I10, rxscan622_loop
    rx617_cur."!mark_push"(0, rx617_pos, $I10)
  rxscan622_done:
  alt623_0:
.annotate 'line', 284
    set_addr $I10, alt623_1
    rx617_cur."!mark_push"(0, rx617_pos, $I10)
.annotate 'line', 285
  # rx subrule "variable_declarator" subtype=capture negate=
    rx617_cur."!cursor_pos"(rx617_pos)
    $P10 = rx617_cur."variable_declarator"()
    unless $P10, rx617_fail
    rx617_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx617_pos = $P10."pos"()
    goto alt623_end
  alt623_1:
.annotate 'line', 286
  # rx subrule "routine_declarator" subtype=capture negate=
    rx617_cur."!cursor_pos"(rx617_pos)
    $P10 = rx617_cur."routine_declarator"()
    unless $P10, rx617_fail
    rx617_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx617_pos = $P10."pos"()
  alt623_end:
.annotate 'line', 284
  # rx pass
    rx617_cur."!cursor_pass"(rx617_pos, "declarator")
    rx617_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx617_pos)
    .return (rx617_cur)
  rx617_fail:
.annotate 'line', 4
    (rx617_rep, rx617_pos, $I10, $P10) = rx617_cur."!mark_fail"(0)
    lt rx617_pos, -1, rx617_done
    eq rx617_pos, -1, rx617_fail
    jump $I10
  rx617_done:
    rx617_cur."!cursor_fail"()
    rx617_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx617_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("149_1275811487.95429") :method
.annotate 'line', 4
    $P619 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P620 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P621, "ResizablePMCArray"
    push $P621, $P619
    push $P621, $P620
    .return ($P621)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("150_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx625_tgt
    .local int rx625_pos
    .local int rx625_off
    .local int rx625_eos
    .local int rx625_rep
    .local pmc rx625_cur
    (rx625_cur, rx625_pos, rx625_tgt) = self."!cursor_start"()
    rx625_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx625_cur
    .local pmc match
    .lex "$/", match
    length rx625_eos, rx625_tgt
    gt rx625_pos, rx625_eos, rx625_done
    set rx625_off, 0
    lt rx625_pos, 2, rx625_start
    sub rx625_off, rx625_pos, 1
    substr rx625_tgt, rx625_tgt, rx625_off
  rx625_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan629_done
    goto rxscan629_scan
  rxscan629_loop:
    ($P10) = rx625_cur."from"()
    inc $P10
    set rx625_pos, $P10
    ge rx625_pos, rx625_eos, rxscan629_done
  rxscan629_scan:
    set_addr $I10, rxscan629_loop
    rx625_cur."!mark_push"(0, rx625_pos, $I10)
  rxscan629_done:
.annotate 'line', 289
  # rx subrule "variable" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."variable"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx625_pos = $P10."pos"()
  # rx pass
    rx625_cur."!cursor_pass"(rx625_pos, "variable_declarator")
    rx625_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx625_pos)
    .return (rx625_cur)
  rx625_fail:
.annotate 'line', 4
    (rx625_rep, rx625_pos, $I10, $P10) = rx625_cur."!mark_fail"(0)
    lt rx625_pos, -1, rx625_done
    eq rx625_pos, -1, rx625_fail
    jump $I10
  rx625_done:
    rx625_cur."!cursor_fail"()
    rx625_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx625_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("151_1275811487.95429") :method
.annotate 'line', 4
    $P627 = self."!PREFIX__!subrule"("variable", "")
    new $P628, "ResizablePMCArray"
    push $P628, $P627
    .return ($P628)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("152_1275811487.95429") :method
.annotate 'line', 291
    $P631 = self."!protoregex"("routine_declarator")
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("153_1275811487.95429") :method
.annotate 'line', 291
    $P633 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P633)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("154_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    (rx635_cur, rx635_pos, rx635_tgt) = self."!cursor_start"()
    rx635_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
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
.annotate 'line', 292
  # rx subcapture "sym"
    set_addr $I10, rxcap_640_fail
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  # rx literal  "sub"
    add $I11, rx635_pos, 3
    gt $I11, rx635_eos, rx635_fail
    sub $I11, rx635_pos, rx635_off
    substr $S10, rx635_tgt, $I11, 3
    ne $S10, "sub", rx635_fail
    add rx635_pos, 3
    set_addr $I10, rxcap_640_fail
    ($I12, $I11) = rx635_cur."!mark_peek"($I10)
    rx635_cur."!cursor_pos"($I11)
    ($P10) = rx635_cur."!cursor_start"()
    $P10."!cursor_pass"(rx635_pos, "")
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_640_done
  rxcap_640_fail:
    goto rx635_fail
  rxcap_640_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."routine_def"()
    unless $P10, rx635_fail
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx635_pos = $P10."pos"()
  # rx pass
    rx635_cur."!cursor_pass"(rx635_pos, "routine_declarator:sym<sub>")
    rx635_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx635_pos)
    .return (rx635_cur)
  rx635_fail:
.annotate 'line', 4
    (rx635_rep, rx635_pos, $I10, $P10) = rx635_cur."!mark_fail"(0)
    lt rx635_pos, -1, rx635_done
    eq rx635_pos, -1, rx635_fail
    jump $I10
  rx635_done:
    rx635_cur."!cursor_fail"()
    rx635_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx635_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("155_1275811487.95429") :method
.annotate 'line', 4
    $P637 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P638, "ResizablePMCArray"
    push $P638, $P637
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("156_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx642_tgt
    .local int rx642_pos
    .local int rx642_off
    .local int rx642_eos
    .local int rx642_rep
    .local pmc rx642_cur
    (rx642_cur, rx642_pos, rx642_tgt) = self."!cursor_start"()
    rx642_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx642_cur
    .local pmc match
    .lex "$/", match
    length rx642_eos, rx642_tgt
    gt rx642_pos, rx642_eos, rx642_done
    set rx642_off, 0
    lt rx642_pos, 2, rx642_start
    sub rx642_off, rx642_pos, 1
    substr rx642_tgt, rx642_tgt, rx642_off
  rx642_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan646_done
    goto rxscan646_scan
  rxscan646_loop:
    ($P10) = rx642_cur."from"()
    inc $P10
    set rx642_pos, $P10
    ge rx642_pos, rx642_eos, rxscan646_done
  rxscan646_scan:
    set_addr $I10, rxscan646_loop
    rx642_cur."!mark_push"(0, rx642_pos, $I10)
  rxscan646_done:
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_647_fail
    rx642_cur."!mark_push"(0, rx642_pos, $I10)
  # rx literal  "method"
    add $I11, rx642_pos, 6
    gt $I11, rx642_eos, rx642_fail
    sub $I11, rx642_pos, rx642_off
    substr $S10, rx642_tgt, $I11, 6
    ne $S10, "method", rx642_fail
    add rx642_pos, 6
    set_addr $I10, rxcap_647_fail
    ($I12, $I11) = rx642_cur."!mark_peek"($I10)
    rx642_cur."!cursor_pos"($I11)
    ($P10) = rx642_cur."!cursor_start"()
    $P10."!cursor_pass"(rx642_pos, "")
    rx642_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_647_done
  rxcap_647_fail:
    goto rx642_fail
  rxcap_647_done:
  # rx subrule "method_def" subtype=capture negate=
    rx642_cur."!cursor_pos"(rx642_pos)
    $P10 = rx642_cur."method_def"()
    unless $P10, rx642_fail
    rx642_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx642_pos = $P10."pos"()
  # rx pass
    rx642_cur."!cursor_pass"(rx642_pos, "routine_declarator:sym<method>")
    rx642_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx642_pos)
    .return (rx642_cur)
  rx642_fail:
.annotate 'line', 4
    (rx642_rep, rx642_pos, $I10, $P10) = rx642_cur."!mark_fail"(0)
    lt rx642_pos, -1, rx642_done
    eq rx642_pos, -1, rx642_fail
    jump $I10
  rx642_done:
    rx642_cur."!cursor_fail"()
    rx642_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx642_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("157_1275811487.95429") :method
.annotate 'line', 4
    $P644 = self."!PREFIX__!subrule"("method_def", "method")
    new $P645, "ResizablePMCArray"
    push $P645, $P644
    .return ($P645)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("158_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx649_tgt
    .local int rx649_pos
    .local int rx649_off
    .local int rx649_eos
    .local int rx649_rep
    .local pmc rx649_cur
    (rx649_cur, rx649_pos, rx649_tgt) = self."!cursor_start"()
    rx649_cur."!cursor_debug"("START ", "routine_def")
    rx649_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx649_cur
    .local pmc match
    .lex "$/", match
    length rx649_eos, rx649_tgt
    gt rx649_pos, rx649_eos, rx649_done
    set rx649_off, 0
    lt rx649_pos, 2, rx649_start
    sub rx649_off, rx649_pos, 1
    substr rx649_tgt, rx649_tgt, rx649_off
  rx649_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan653_done
    goto rxscan653_scan
  rxscan653_loop:
    ($P10) = rx649_cur."from"()
    inc $P10
    set rx649_pos, $P10
    ge rx649_pos, rx649_eos, rxscan653_done
  rxscan653_scan:
    set_addr $I10, rxscan653_loop
    rx649_cur."!mark_push"(0, rx649_pos, $I10)
  rxscan653_done:
.annotate 'line', 295
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
.annotate 'line', 296
  # rx rxquantr655 ** 0..1
    set_addr $I661, rxquantr655_done
    rx649_cur."!mark_push"(0, rx649_pos, $I661)
  rxquantr655_loop:
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_659_fail
    rx649_cur."!mark_push"(0, rx649_pos, $I10)
  # rx rxquantr657 ** 0..1
    set_addr $I658, rxquantr657_done
    rx649_cur."!mark_push"(0, rx649_pos, $I658)
  rxquantr657_loop:
  # rx literal  "&"
    add $I11, rx649_pos, 1
    gt $I11, rx649_eos, rx649_fail
    sub $I11, rx649_pos, rx649_off
    substr $S10, rx649_tgt, $I11, 1
    ne $S10, "&", rx649_fail
    add rx649_pos, 1
    (rx649_rep) = rx649_cur."!mark_commit"($I658)
  rxquantr657_done:
    set_addr $I10, rxcap_659_fail
    ($I12, $I11) = rx649_cur."!mark_peek"($I10)
    rx649_cur."!cursor_pos"($I11)
    ($P10) = rx649_cur."!cursor_start"()
    $P10."!cursor_pass"(rx649_pos, "")
    rx649_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_659_done
  rxcap_659_fail:
    goto rx649_fail
  rxcap_659_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."deflongname"()
    unless $P10, rx649_fail
    rx649_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
    (rx649_rep) = rx649_cur."!mark_commit"($I661)
  rxquantr655_done:
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
.annotate 'line', 297
  # rx subrule "newpad" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."newpad"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  alt664_0:
.annotate 'line', 298
    set_addr $I10, alt664_1
    rx649_cur."!mark_push"(0, rx649_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx649_pos, 1
    gt $I11, rx649_eos, rx649_fail
    sub $I11, rx649_pos, rx649_off
    substr $S10, rx649_tgt, $I11, 1
    ne $S10, "(", rx649_fail
    add rx649_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."signature"()
    unless $P10, rx649_fail
    rx649_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx649_pos, 1
    gt $I11, rx649_eos, rx649_fail
    sub $I11, rx649_pos, rx649_off
    substr $S10, rx649_tgt, $I11, 1
    ne $S10, ")", rx649_fail
    add rx649_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
    goto alt664_end
  alt664_1:
.annotate 'line', 299
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  alt664_end:
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
.annotate 'line', 300
  # rx subrule "blockoid" subtype=capture negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."blockoid"()
    unless $P10, rx649_fail
    rx649_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
.annotate 'line', 295
  # rx pass
    rx649_cur."!cursor_pass"(rx649_pos, "routine_def")
    rx649_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx649_pos)
    .return (rx649_cur)
  rx649_fail:
.annotate 'line', 4
    (rx649_rep, rx649_pos, $I10, $P10) = rx649_cur."!mark_fail"(0)
    lt rx649_pos, -1, rx649_done
    eq rx649_pos, -1, rx649_fail
    jump $I10
  rx649_done:
    rx649_cur."!cursor_fail"()
    rx649_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx649_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("159_1275811487.95429") :method
.annotate 'line', 4
    $P651 = self."!PREFIX__!subrule"("ws", "")
    new $P652, "ResizablePMCArray"
    push $P652, $P651
    .return ($P652)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("160_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx674_tgt
    .local int rx674_pos
    .local int rx674_off
    .local int rx674_eos
    .local int rx674_rep
    .local pmc rx674_cur
    (rx674_cur, rx674_pos, rx674_tgt) = self."!cursor_start"()
    rx674_cur."!cursor_debug"("START ", "method_def")
    rx674_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx674_cur
    .local pmc match
    .lex "$/", match
    length rx674_eos, rx674_tgt
    gt rx674_pos, rx674_eos, rx674_done
    set rx674_off, 0
    lt rx674_pos, 2, rx674_start
    sub rx674_off, rx674_pos, 1
    substr rx674_tgt, rx674_tgt, rx674_off
  rx674_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan678_done
    goto rxscan678_scan
  rxscan678_loop:
    ($P10) = rx674_cur."from"()
    inc $P10
    set rx674_pos, $P10
    ge rx674_pos, rx674_eos, rxscan678_done
  rxscan678_scan:
    set_addr $I10, rxscan678_loop
    rx674_cur."!mark_push"(0, rx674_pos, $I10)
  rxscan678_done:
.annotate 'line', 303
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
.annotate 'line', 304
  # rx rxquantr680 ** 0..1
    set_addr $I681, rxquantr680_done
    rx674_cur."!mark_push"(0, rx674_pos, $I681)
  rxquantr680_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."deflongname"()
    unless $P10, rx674_fail
    rx674_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx674_pos = $P10."pos"()
    (rx674_rep) = rx674_cur."!mark_commit"($I681)
  rxquantr680_done:
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
.annotate 'line', 305
  # rx subrule "newpad" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."newpad"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  alt684_0:
.annotate 'line', 306
    set_addr $I10, alt684_1
    rx674_cur."!mark_push"(0, rx674_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx674_pos, 1
    gt $I11, rx674_eos, rx674_fail
    sub $I11, rx674_pos, rx674_off
    substr $S10, rx674_tgt, $I11, 1
    ne $S10, "(", rx674_fail
    add rx674_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."signature"()
    unless $P10, rx674_fail
    rx674_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx674_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx674_pos, 1
    gt $I11, rx674_eos, rx674_fail
    sub $I11, rx674_pos, rx674_off
    substr $S10, rx674_tgt, $I11, 1
    ne $S10, ")", rx674_fail
    add rx674_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
    goto alt684_end
  alt684_1:
.annotate 'line', 307
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  alt684_end:
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
.annotate 'line', 308
  # rx subrule "blockoid" subtype=capture negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."blockoid"()
    unless $P10, rx674_fail
    rx674_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx674_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
.annotate 'line', 303
  # rx pass
    rx674_cur."!cursor_pass"(rx674_pos, "method_def")
    rx674_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx674_pos)
    .return (rx674_cur)
  rx674_fail:
.annotate 'line', 4
    (rx674_rep, rx674_pos, $I10, $P10) = rx674_cur."!mark_fail"(0)
    lt rx674_pos, -1, rx674_done
    eq rx674_pos, -1, rx674_fail
    jump $I10
  rx674_done:
    rx674_cur."!cursor_fail"()
    rx674_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx674_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("161_1275811487.95429") :method
.annotate 'line', 4
    $P676 = self."!PREFIX__!subrule"("ws", "")
    new $P677, "ResizablePMCArray"
    push $P677, $P676
    .return ($P677)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("162_1275811487.95429") :method
.annotate 'line', 311
    $P694 = self."!protoregex"("multi_declarator")
    .return ($P694)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("163_1275811487.95429") :method
.annotate 'line', 311
    $P696 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("164_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 313
    new $P698, "Undef"
    .lex "$*MULTINESS", $P698
.annotate 'line', 4
    .local string rx699_tgt
    .local int rx699_pos
    .local int rx699_off
    .local int rx699_eos
    .local int rx699_rep
    .local pmc rx699_cur
    (rx699_cur, rx699_pos, rx699_tgt) = self."!cursor_start"()
    rx699_cur."!cursor_debug"("START ", "multi_declarator:sym<multi>")
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
.annotate 'line', 313
    rx699_cur."!cursor_pos"(rx699_pos)
    new $P704, "String"
    assign $P704, "multi"
    store_lex "$*MULTINESS", $P704
.annotate 'line', 314
  # rx subcapture "sym"
    set_addr $I10, rxcap_705_fail
    rx699_cur."!mark_push"(0, rx699_pos, $I10)
  # rx literal  "multi"
    add $I11, rx699_pos, 5
    gt $I11, rx699_eos, rx699_fail
    sub $I11, rx699_pos, rx699_off
    substr $S10, rx699_tgt, $I11, 5
    ne $S10, "multi", rx699_fail
    add rx699_pos, 5
    set_addr $I10, rxcap_705_fail
    ($I12, $I11) = rx699_cur."!mark_peek"($I10)
    rx699_cur."!cursor_pos"($I11)
    ($P10) = rx699_cur."!cursor_start"()
    $P10."!cursor_pass"(rx699_pos, "")
    rx699_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_705_done
  rxcap_705_fail:
    goto rx699_fail
  rxcap_705_done:
.annotate 'line', 315
  # rx subrule "ws" subtype=method negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."ws"()
    unless $P10, rx699_fail
    rx699_pos = $P10."pos"()
  alt706_0:
    set_addr $I10, alt706_1
    rx699_cur."!mark_push"(0, rx699_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."declarator"()
    unless $P10, rx699_fail
    rx699_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx699_pos = $P10."pos"()
    goto alt706_end
  alt706_1:
    set_addr $I10, alt706_2
    rx699_cur."!mark_push"(0, rx699_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."routine_def"()
    unless $P10, rx699_fail
    rx699_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx699_pos = $P10."pos"()
    goto alt706_end
  alt706_2:
  # rx subrule "panic" subtype=method negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."panic"("Malformed multi")
    unless $P10, rx699_fail
    rx699_pos = $P10."pos"()
  alt706_end:
.annotate 'line', 312
  # rx pass
    rx699_cur."!cursor_pass"(rx699_pos, "multi_declarator:sym<multi>")
    rx699_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<multi>", " at pos=", rx699_pos)
    .return (rx699_cur)
  rx699_fail:
.annotate 'line', 4
    (rx699_rep, rx699_pos, $I10, $P10) = rx699_cur."!mark_fail"(0)
    lt rx699_pos, -1, rx699_done
    eq rx699_pos, -1, rx699_fail
    jump $I10
  rx699_done:
    rx699_cur."!cursor_fail"()
    rx699_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<multi>")
    .return (rx699_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("165_1275811487.95429") :method
.annotate 'line', 4
    $P701 = self."!PREFIX__!subrule"("ws", "multi")
    new $P702, "ResizablePMCArray"
    push $P702, $P701
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("166_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 318
    new $P708, "Undef"
    .lex "$*MULTINESS", $P708
.annotate 'line', 4
    .local string rx709_tgt
    .local int rx709_pos
    .local int rx709_off
    .local int rx709_eos
    .local int rx709_rep
    .local pmc rx709_cur
    (rx709_cur, rx709_pos, rx709_tgt) = self."!cursor_start"()
    rx709_cur."!cursor_debug"("START ", "multi_declarator:sym<null>")
    .lex unicode:"$\x{a2}", rx709_cur
    .local pmc match
    .lex "$/", match
    length rx709_eos, rx709_tgt
    gt rx709_pos, rx709_eos, rx709_done
    set rx709_off, 0
    lt rx709_pos, 2, rx709_start
    sub rx709_off, rx709_pos, 1
    substr rx709_tgt, rx709_tgt, rx709_off
  rx709_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan713_done
    goto rxscan713_scan
  rxscan713_loop:
    ($P10) = rx709_cur."from"()
    inc $P10
    set rx709_pos, $P10
    ge rx709_pos, rx709_eos, rxscan713_done
  rxscan713_scan:
    set_addr $I10, rxscan713_loop
    rx709_cur."!mark_push"(0, rx709_pos, $I10)
  rxscan713_done:
.annotate 'line', 318
    rx709_cur."!cursor_pos"(rx709_pos)
    new $P714, "String"
    assign $P714, ""
    store_lex "$*MULTINESS", $P714
.annotate 'line', 319
  # rx subrule "declarator" subtype=capture negate=
    rx709_cur."!cursor_pos"(rx709_pos)
    $P10 = rx709_cur."declarator"()
    unless $P10, rx709_fail
    rx709_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx709_pos = $P10."pos"()
.annotate 'line', 317
  # rx pass
    rx709_cur."!cursor_pass"(rx709_pos, "multi_declarator:sym<null>")
    rx709_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<null>", " at pos=", rx709_pos)
    .return (rx709_cur)
  rx709_fail:
.annotate 'line', 4
    (rx709_rep, rx709_pos, $I10, $P10) = rx709_cur."!mark_fail"(0)
    lt rx709_pos, -1, rx709_done
    eq rx709_pos, -1, rx709_fail
    jump $I10
  rx709_done:
    rx709_cur."!cursor_fail"()
    rx709_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<null>")
    .return (rx709_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("167_1275811487.95429") :method
.annotate 'line', 4
    $P711 = self."!PREFIX__!subrule"("declarator", "")
    new $P712, "ResizablePMCArray"
    push $P712, $P711
    .return ($P712)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("168_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx716_tgt
    .local int rx716_pos
    .local int rx716_off
    .local int rx716_eos
    .local int rx716_rep
    .local pmc rx716_cur
    (rx716_cur, rx716_pos, rx716_tgt) = self."!cursor_start"()
    rx716_cur."!cursor_debug"("START ", "signature")
    rx716_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx716_cur
    .local pmc match
    .lex "$/", match
    length rx716_eos, rx716_tgt
    gt rx716_pos, rx716_eos, rx716_done
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
.annotate 'line', 322
  # rx rxquantr720 ** 0..1
    set_addr $I723, rxquantr720_done
    rx716_cur."!mark_push"(0, rx716_pos, $I723)
  rxquantr720_loop:
  # rx rxquantr721 ** 1..*
    set_addr $I722, rxquantr721_done
    rx716_cur."!mark_push"(0, -1, $I722)
  rxquantr721_loop:
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."parameter"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx716_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."ws"()
    unless $P10, rx716_fail
    rx716_pos = $P10."pos"()
    (rx716_rep) = rx716_cur."!mark_commit"($I722)
    rx716_cur."!mark_push"(rx716_rep, rx716_pos, $I722)
  # rx literal  ","
    add $I11, rx716_pos, 1
    gt $I11, rx716_eos, rx716_fail
    sub $I11, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I11, 1
    ne $S10, ",", rx716_fail
    add rx716_pos, 1
    goto rxquantr721_loop
  rxquantr721_done:
    (rx716_rep) = rx716_cur."!mark_commit"($I723)
  rxquantr720_done:
  # rx pass
    rx716_cur."!cursor_pass"(rx716_pos, "signature")
    rx716_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx716_pos)
    .return (rx716_cur)
  rx716_fail:
.annotate 'line', 4
    (rx716_rep, rx716_pos, $I10, $P10) = rx716_cur."!mark_fail"(0)
    lt rx716_pos, -1, rx716_done
    eq rx716_pos, -1, rx716_fail
    jump $I10
  rx716_done:
    rx716_cur."!cursor_fail"()
    rx716_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx716_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("169_1275811487.95429") :method
.annotate 'line', 4
    new $P718, "ResizablePMCArray"
    push $P718, ""
    .return ($P718)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("170_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx725_tgt
    .local int rx725_pos
    .local int rx725_off
    .local int rx725_eos
    .local int rx725_rep
    .local pmc rx725_cur
    (rx725_cur, rx725_pos, rx725_tgt) = self."!cursor_start"()
    rx725_cur."!cursor_debug"("START ", "parameter")
    rx725_cur."!cursor_caparray"("default_value", "typename")
    .lex unicode:"$\x{a2}", rx725_cur
    .local pmc match
    .lex "$/", match
    length rx725_eos, rx725_tgt
    gt rx725_pos, rx725_eos, rx725_done
    set rx725_off, 0
    lt rx725_pos, 2, rx725_start
    sub rx725_off, rx725_pos, 1
    substr rx725_tgt, rx725_tgt, rx725_off
  rx725_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan728_done
    goto rxscan728_scan
  rxscan728_loop:
    ($P10) = rx725_cur."from"()
    inc $P10
    set rx725_pos, $P10
    ge rx725_pos, rx725_eos, rxscan728_done
  rxscan728_scan:
    set_addr $I10, rxscan728_loop
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  rxscan728_done:
.annotate 'line', 325
  # rx rxquantr729 ** 0..*
    set_addr $I730, rxquantr729_done
    rx725_cur."!mark_push"(0, rx725_pos, $I730)
  rxquantr729_loop:
  # rx subrule "typename" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."typename"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx725_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."ws"()
    unless $P10, rx725_fail
    rx725_pos = $P10."pos"()
    (rx725_rep) = rx725_cur."!mark_commit"($I730)
    rx725_cur."!mark_push"(rx725_rep, rx725_pos, $I730)
    goto rxquantr729_loop
  rxquantr729_done:
  alt731_0:
.annotate 'line', 326
    set_addr $I10, alt731_1
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
.annotate 'line', 327
  # rx subcapture "quant"
    set_addr $I10, rxcap_732_fail
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  # rx literal  "*"
    add $I11, rx725_pos, 1
    gt $I11, rx725_eos, rx725_fail
    sub $I11, rx725_pos, rx725_off
    substr $S10, rx725_tgt, $I11, 1
    ne $S10, "*", rx725_fail
    add rx725_pos, 1
    set_addr $I10, rxcap_732_fail
    ($I12, $I11) = rx725_cur."!mark_peek"($I10)
    rx725_cur."!cursor_pos"($I11)
    ($P10) = rx725_cur."!cursor_start"()
    $P10."!cursor_pass"(rx725_pos, "")
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_732_done
  rxcap_732_fail:
    goto rx725_fail
  rxcap_732_done:
  # rx subrule "param_var" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."param_var"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx725_pos = $P10."pos"()
    goto alt731_end
  alt731_1:
  alt733_0:
.annotate 'line', 328
    set_addr $I10, alt733_1
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."param_var"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx725_pos = $P10."pos"()
    goto alt733_end
  alt733_1:
  # rx subrule "named_param" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."named_param"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx725_pos = $P10."pos"()
  alt733_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_735_fail
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  alt734_0:
    set_addr $I10, alt734_1
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  # rx literal  "?"
    add $I11, rx725_pos, 1
    gt $I11, rx725_eos, rx725_fail
    sub $I11, rx725_pos, rx725_off
    substr $S10, rx725_tgt, $I11, 1
    ne $S10, "?", rx725_fail
    add rx725_pos, 1
    goto alt734_end
  alt734_1:
    set_addr $I10, alt734_2
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  # rx literal  "!"
    add $I11, rx725_pos, 1
    gt $I11, rx725_eos, rx725_fail
    sub $I11, rx725_pos, rx725_off
    substr $S10, rx725_tgt, $I11, 1
    ne $S10, "!", rx725_fail
    add rx725_pos, 1
    goto alt734_end
  alt734_2:
  alt734_end:
    set_addr $I10, rxcap_735_fail
    ($I12, $I11) = rx725_cur."!mark_peek"($I10)
    rx725_cur."!cursor_pos"($I11)
    ($P10) = rx725_cur."!cursor_start"()
    $P10."!cursor_pass"(rx725_pos, "")
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_735_done
  rxcap_735_fail:
    goto rx725_fail
  rxcap_735_done:
  alt731_end:
.annotate 'line', 330
  # rx rxquantr736 ** 0..1
    set_addr $I737, rxquantr736_done
    rx725_cur."!mark_push"(0, rx725_pos, $I737)
  rxquantr736_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."default_value"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx725_pos = $P10."pos"()
    (rx725_rep) = rx725_cur."!mark_commit"($I737)
  rxquantr736_done:
.annotate 'line', 324
  # rx pass
    rx725_cur."!cursor_pass"(rx725_pos, "parameter")
    rx725_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx725_pos)
    .return (rx725_cur)
  rx725_fail:
.annotate 'line', 4
    (rx725_rep, rx725_pos, $I10, $P10) = rx725_cur."!mark_fail"(0)
    lt rx725_pos, -1, rx725_done
    eq rx725_pos, -1, rx725_fail
    jump $I10
  rx725_done:
    rx725_cur."!cursor_fail"()
    rx725_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx725_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("171_1275811487.95429") :method
.annotate 'line', 4
    new $P727, "ResizablePMCArray"
    push $P727, ""
    .return ($P727)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("172_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx739_tgt
    .local int rx739_pos
    .local int rx739_off
    .local int rx739_eos
    .local int rx739_rep
    .local pmc rx739_cur
    (rx739_cur, rx739_pos, rx739_tgt) = self."!cursor_start"()
    rx739_cur."!cursor_debug"("START ", "param_var")
    rx739_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx739_cur
    .local pmc match
    .lex "$/", match
    length rx739_eos, rx739_tgt
    gt rx739_pos, rx739_eos, rx739_done
    set rx739_off, 0
    lt rx739_pos, 2, rx739_start
    sub rx739_off, rx739_pos, 1
    substr rx739_tgt, rx739_tgt, rx739_off
  rx739_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan743_done
    goto rxscan743_scan
  rxscan743_loop:
    ($P10) = rx739_cur."from"()
    inc $P10
    set rx739_pos, $P10
    ge rx739_pos, rx739_eos, rxscan743_done
  rxscan743_scan:
    set_addr $I10, rxscan743_loop
    rx739_cur."!mark_push"(0, rx739_pos, $I10)
  rxscan743_done:
.annotate 'line', 334
  # rx subrule "sigil" subtype=capture negate=
    rx739_cur."!cursor_pos"(rx739_pos)
    $P10 = rx739_cur."sigil"()
    unless $P10, rx739_fail
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx739_pos = $P10."pos"()
  # rx rxquantr744 ** 0..1
    set_addr $I745, rxquantr744_done
    rx739_cur."!mark_push"(0, rx739_pos, $I745)
  rxquantr744_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx739_cur."!cursor_pos"(rx739_pos)
    $P10 = rx739_cur."twigil"()
    unless $P10, rx739_fail
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx739_pos = $P10."pos"()
    (rx739_rep) = rx739_cur."!mark_commit"($I745)
  rxquantr744_done:
  alt746_0:
.annotate 'line', 335
    set_addr $I10, alt746_1
    rx739_cur."!mark_push"(0, rx739_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx739_cur."!cursor_pos"(rx739_pos)
    $P10 = rx739_cur."ident"()
    unless $P10, rx739_fail
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx739_pos = $P10."pos"()
    goto alt746_end
  alt746_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_747_fail
    rx739_cur."!mark_push"(0, rx739_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx739_pos, rx739_eos, rx739_fail
    sub $I10, rx739_pos, rx739_off
    substr $S10, rx739_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx739_fail
    inc rx739_pos
    set_addr $I10, rxcap_747_fail
    ($I12, $I11) = rx739_cur."!mark_peek"($I10)
    rx739_cur."!cursor_pos"($I11)
    ($P10) = rx739_cur."!cursor_start"()
    $P10."!cursor_pass"(rx739_pos, "")
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_747_done
  rxcap_747_fail:
    goto rx739_fail
  rxcap_747_done:
  alt746_end:
.annotate 'line', 333
  # rx pass
    rx739_cur."!cursor_pass"(rx739_pos, "param_var")
    rx739_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx739_pos)
    .return (rx739_cur)
  rx739_fail:
.annotate 'line', 4
    (rx739_rep, rx739_pos, $I10, $P10) = rx739_cur."!mark_fail"(0)
    lt rx739_pos, -1, rx739_done
    eq rx739_pos, -1, rx739_fail
    jump $I10
  rx739_done:
    rx739_cur."!cursor_fail"()
    rx739_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx739_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("173_1275811487.95429") :method
.annotate 'line', 4
    $P741 = self."!PREFIX__!subrule"("sigil", "")
    new $P742, "ResizablePMCArray"
    push $P742, $P741
    .return ($P742)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("174_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx749_tgt
    .local int rx749_pos
    .local int rx749_off
    .local int rx749_eos
    .local int rx749_rep
    .local pmc rx749_cur
    (rx749_cur, rx749_pos, rx749_tgt) = self."!cursor_start"()
    rx749_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx749_cur
    .local pmc match
    .lex "$/", match
    length rx749_eos, rx749_tgt
    gt rx749_pos, rx749_eos, rx749_done
    set rx749_off, 0
    lt rx749_pos, 2, rx749_start
    sub rx749_off, rx749_pos, 1
    substr rx749_tgt, rx749_tgt, rx749_off
  rx749_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan753_done
    goto rxscan753_scan
  rxscan753_loop:
    ($P10) = rx749_cur."from"()
    inc $P10
    set rx749_pos, $P10
    ge rx749_pos, rx749_eos, rxscan753_done
  rxscan753_scan:
    set_addr $I10, rxscan753_loop
    rx749_cur."!mark_push"(0, rx749_pos, $I10)
  rxscan753_done:
.annotate 'line', 339
  # rx literal  ":"
    add $I11, rx749_pos, 1
    gt $I11, rx749_eos, rx749_fail
    sub $I11, rx749_pos, rx749_off
    substr $S10, rx749_tgt, $I11, 1
    ne $S10, ":", rx749_fail
    add rx749_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx749_cur."!cursor_pos"(rx749_pos)
    $P10 = rx749_cur."param_var"()
    unless $P10, rx749_fail
    rx749_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx749_pos = $P10."pos"()
.annotate 'line', 338
  # rx pass
    rx749_cur."!cursor_pass"(rx749_pos, "named_param")
    rx749_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx749_pos)
    .return (rx749_cur)
  rx749_fail:
.annotate 'line', 4
    (rx749_rep, rx749_pos, $I10, $P10) = rx749_cur."!mark_fail"(0)
    lt rx749_pos, -1, rx749_done
    eq rx749_pos, -1, rx749_fail
    jump $I10
  rx749_done:
    rx749_cur."!cursor_fail"()
    rx749_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx749_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("175_1275811487.95429") :method
.annotate 'line', 4
    $P751 = self."!PREFIX__!subrule"("param_var", ":")
    new $P752, "ResizablePMCArray"
    push $P752, $P751
    .return ($P752)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("176_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx755_tgt
    .local int rx755_pos
    .local int rx755_off
    .local int rx755_eos
    .local int rx755_rep
    .local pmc rx755_cur
    (rx755_cur, rx755_pos, rx755_tgt) = self."!cursor_start"()
    rx755_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx755_cur
    .local pmc match
    .lex "$/", match
    length rx755_eos, rx755_tgt
    gt rx755_pos, rx755_eos, rx755_done
    set rx755_off, 0
    lt rx755_pos, 2, rx755_start
    sub rx755_off, rx755_pos, 1
    substr rx755_tgt, rx755_tgt, rx755_off
  rx755_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan759_done
    goto rxscan759_scan
  rxscan759_loop:
    ($P10) = rx755_cur."from"()
    inc $P10
    set rx755_pos, $P10
    ge rx755_pos, rx755_eos, rxscan759_done
  rxscan759_scan:
    set_addr $I10, rxscan759_loop
    rx755_cur."!mark_push"(0, rx755_pos, $I10)
  rxscan759_done:
.annotate 'line', 342
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx755_pos, 1
    gt $I11, rx755_eos, rx755_fail
    sub $I11, rx755_pos, rx755_off
    substr $S10, rx755_tgt, $I11, 1
    ne $S10, "=", rx755_fail
    add rx755_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."EXPR"("i=")
    unless $P10, rx755_fail
    rx755_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx755_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx pass
    rx755_cur."!cursor_pass"(rx755_pos, "default_value")
    rx755_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx755_pos)
    .return (rx755_cur)
  rx755_fail:
.annotate 'line', 4
    (rx755_rep, rx755_pos, $I10, $P10) = rx755_cur."!mark_fail"(0)
    lt rx755_pos, -1, rx755_done
    eq rx755_pos, -1, rx755_fail
    jump $I10
  rx755_done:
    rx755_cur."!cursor_fail"()
    rx755_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx755_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("177_1275811487.95429") :method
.annotate 'line', 4
    $P757 = self."!PREFIX__!subrule"("ws", "")
    new $P758, "ResizablePMCArray"
    push $P758, $P757
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("178_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx764_tgt
    .local int rx764_pos
    .local int rx764_off
    .local int rx764_eos
    .local int rx764_rep
    .local pmc rx764_cur
    (rx764_cur, rx764_pos, rx764_tgt) = self."!cursor_start"()
    rx764_cur."!cursor_debug"("START ", "regex_declarator")
    rx764_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx764_cur
    .local pmc match
    .lex "$/", match
    length rx764_eos, rx764_tgt
    gt rx764_pos, rx764_eos, rx764_done
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
.annotate 'line', 344
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  alt770_0:
.annotate 'line', 345
    set_addr $I10, alt770_1
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
.annotate 'line', 346
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_772_fail
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx literal  "proto"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "proto", rx764_fail
    add rx764_pos, 5
    set_addr $I10, rxcap_772_fail
    ($I12, $I11) = rx764_cur."!mark_peek"($I10)
    rx764_cur."!cursor_pos"($I11)
    ($P10) = rx764_cur."!cursor_start"()
    $P10."!cursor_pass"(rx764_pos, "")
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_772_done
  rxcap_772_fail:
    goto rx764_fail
  rxcap_772_done:
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  alt774_0:
    set_addr $I10, alt774_1
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx literal  "regex"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "regex", rx764_fail
    add rx764_pos, 5
    goto alt774_end
  alt774_1:
    set_addr $I10, alt774_2
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx literal  "token"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "token", rx764_fail
    add rx764_pos, 5
    goto alt774_end
  alt774_2:
  # rx literal  "rule"
    add $I11, rx764_pos, 4
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 4
    ne $S10, "rule", rx764_fail
    add rx764_pos, 4
  alt774_end:
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 347
  # rx subrule "deflongname" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."deflongname"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx764_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  alt777_0:
.annotate 'line', 348
    set_addr $I10, alt777_1
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
.annotate 'line', 349
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "{", rx764_fail
    add rx764_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "<...>", rx764_fail
    add rx764_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "}", rx764_fail
    add rx764_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ENDSTMT"()
    unless $P10, rx764_fail
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
    goto alt777_end
  alt777_1:
.annotate 'line', 350
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  alt777_end:
.annotate 'line', 351
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 346
    goto alt770_end
  alt770_1:
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_787_fail
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  alt786_0:
    set_addr $I10, alt786_1
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx literal  "regex"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "regex", rx764_fail
    add rx764_pos, 5
    goto alt786_end
  alt786_1:
    set_addr $I10, alt786_2
    rx764_cur."!mark_push"(0, rx764_pos, $I10)
  # rx literal  "token"
    add $I11, rx764_pos, 5
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 5
    ne $S10, "token", rx764_fail
    add rx764_pos, 5
    goto alt786_end
  alt786_2:
  # rx literal  "rule"
    add $I11, rx764_pos, 4
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 4
    ne $S10, "rule", rx764_fail
    add rx764_pos, 4
  alt786_end:
    set_addr $I10, rxcap_787_fail
    ($I12, $I11) = rx764_cur."!mark_peek"($I10)
    rx764_cur."!cursor_pos"($I11)
    ($P10) = rx764_cur."!cursor_start"()
    $P10."!cursor_pass"(rx764_pos, "")
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_787_done
  rxcap_787_fail:
    goto rx764_fail
  rxcap_787_done:
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 353
  # rx subrule "deflongname" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."deflongname"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx764_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 354
  # rx subrule "newpad" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."newpad"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 355
  # rx rxquantr791 ** 0..1
    set_addr $I796, rxquantr791_done
    rx764_cur."!mark_push"(0, rx764_pos, $I796)
  rxquantr791_loop:
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "(", rx764_fail
    add rx764_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."signature"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx764_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, ")", rx764_fail
    add rx764_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
    (rx764_rep) = rx764_cur."!mark_commit"($I796)
  rxquantr791_done:
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 356
  # rx reduce name="regex_declarator" key="open"
    rx764_cur."!cursor_pos"(rx764_pos)
    rx764_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 357
  # rx literal  "{"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "{", rx764_fail
    add rx764_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."LANG"("Regex", "nibbler")
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx764_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx764_pos, 1
    gt $I11, rx764_eos, rx764_fail
    sub $I11, rx764_pos, rx764_off
    substr $S10, rx764_tgt, $I11, 1
    ne $S10, "}", rx764_fail
    add rx764_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ENDSTMT"()
    unless $P10, rx764_fail
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
  alt770_end:
.annotate 'line', 358
  # rx subrule "ws" subtype=method negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."ws"()
    unless $P10, rx764_fail
    rx764_pos = $P10."pos"()
.annotate 'line', 344
  # rx pass
    rx764_cur."!cursor_pass"(rx764_pos, "regex_declarator")
    rx764_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx764_pos)
    .return (rx764_cur)
  rx764_fail:
.annotate 'line', 4
    (rx764_rep, rx764_pos, $I10, $P10) = rx764_cur."!mark_fail"(0)
    lt rx764_pos, -1, rx764_done
    eq rx764_pos, -1, rx764_fail
    jump $I10
  rx764_done:
    rx764_cur."!cursor_fail"()
    rx764_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx764_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("179_1275811487.95429") :method
.annotate 'line', 4
    $P766 = self."!PREFIX__!subrule"("ws", "")
    new $P767, "ResizablePMCArray"
    push $P767, $P766
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("180_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx802_tgt
    .local int rx802_pos
    .local int rx802_off
    .local int rx802_eos
    .local int rx802_rep
    .local pmc rx802_cur
    (rx802_cur, rx802_pos, rx802_tgt) = self."!cursor_start"()
    rx802_cur."!cursor_debug"("START ", "dotty")
    rx802_cur."!cursor_caparray"("args")
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
.annotate 'line', 362
  # rx literal  "."
    add $I11, rx802_pos, 1
    gt $I11, rx802_eos, rx802_fail
    sub $I11, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I11, 1
    ne $S10, ".", rx802_fail
    add rx802_pos, 1
  alt807_0:
.annotate 'line', 363
    set_addr $I10, alt807_1
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."identifier"()
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx802_pos = $P10."pos"()
    goto alt807_end
  alt807_1:
.annotate 'line', 364
  # rx enumcharlist negate=0 zerowidth
    ge rx802_pos, rx802_eos, rx802_fail
    sub $I10, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx802_fail
  # rx subrule "quote" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."quote"()
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx802_pos = $P10."pos"()
  alt808_0:
.annotate 'line', 365
    set_addr $I10, alt808_1
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx802_pos, rx802_eos, rx802_fail
    sub $I10, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx802_fail
    goto alt808_end
  alt808_1:
  # rx subrule "panic" subtype=method negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx802_fail
    rx802_pos = $P10."pos"()
  alt808_end:
  alt807_end:
.annotate 'line', 371
  # rx rxquantr809 ** 0..1
    set_addr $I811, rxquantr809_done
    rx802_cur."!mark_push"(0, rx802_pos, $I811)
  rxquantr809_loop:
  alt810_0:
.annotate 'line', 368
    set_addr $I10, alt810_1
    rx802_cur."!mark_push"(0, rx802_pos, $I10)
.annotate 'line', 369
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
    goto alt810_end
  alt810_1:
.annotate 'line', 370
  # rx literal  ":"
    add $I11, rx802_pos, 1
    gt $I11, rx802_eos, rx802_fail
    sub $I11, rx802_pos, rx802_off
    substr $S10, rx802_tgt, $I11, 1
    ne $S10, ":", rx802_fail
    add rx802_pos, 1
  # rx charclass s
    ge rx802_pos, rx802_eos, rx802_fail
    sub $I10, rx802_pos, rx802_off
    is_cclass $I11, 32, rx802_tgt, $I10
    unless $I11, rx802_fail
    inc rx802_pos
  # rx subrule "arglist" subtype=capture negate=
    rx802_cur."!cursor_pos"(rx802_pos)
    $P10 = rx802_cur."arglist"()
    unless $P10, rx802_fail
    rx802_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx802_pos = $P10."pos"()
  alt810_end:
.annotate 'line', 371
    (rx802_rep) = rx802_cur."!mark_commit"($I811)
  rxquantr809_done:
.annotate 'line', 361
  # rx pass
    rx802_cur."!cursor_pass"(rx802_pos, "dotty")
    rx802_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx802_pos)
    .return (rx802_cur)
  rx802_fail:
.annotate 'line', 4
    (rx802_rep, rx802_pos, $I10, $P10) = rx802_cur."!mark_fail"(0)
    lt rx802_pos, -1, rx802_done
    eq rx802_pos, -1, rx802_fail
    jump $I10
  rx802_done:
    rx802_cur."!cursor_fail"()
    rx802_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx802_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("181_1275811487.95429") :method
.annotate 'line', 4
    $P804 = self."!PREFIX__!subrule"("identifier", ".")
    new $P805, "ResizablePMCArray"
    push $P805, "'"
    push $P805, "\""
    push $P805, $P804
    .return ($P805)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("182_1275811487.95429") :method
.annotate 'line', 375
    $P813 = self."!protoregex"("term")
    .return ($P813)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("183_1275811487.95429") :method
.annotate 'line', 375
    $P815 = self."!PREFIX__!protoregex"("term")
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("184_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx817_tgt
    .local int rx817_pos
    .local int rx817_off
    .local int rx817_eos
    .local int rx817_rep
    .local pmc rx817_cur
    (rx817_cur, rx817_pos, rx817_tgt) = self."!cursor_start"()
    rx817_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx817_cur
    .local pmc match
    .lex "$/", match
    length rx817_eos, rx817_tgt
    gt rx817_pos, rx817_eos, rx817_done
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
.annotate 'line', 377
  # rx subcapture "sym"
    set_addr $I10, rxcap_821_fail
    rx817_cur."!mark_push"(0, rx817_pos, $I10)
  # rx literal  "self"
    add $I11, rx817_pos, 4
    gt $I11, rx817_eos, rx817_fail
    sub $I11, rx817_pos, rx817_off
    substr $S10, rx817_tgt, $I11, 4
    ne $S10, "self", rx817_fail
    add rx817_pos, 4
    set_addr $I10, rxcap_821_fail
    ($I12, $I11) = rx817_cur."!mark_peek"($I10)
    rx817_cur."!cursor_pos"($I11)
    ($P10) = rx817_cur."!cursor_start"()
    $P10."!cursor_pass"(rx817_pos, "")
    rx817_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_821_done
  rxcap_821_fail:
    goto rx817_fail
  rxcap_821_done:
  # rxanchor rwb
    le rx817_pos, 0, rx817_fail
    sub $I10, rx817_pos, rx817_off
    is_cclass $I11, 8192, rx817_tgt, $I10
    if $I11, rx817_fail
    dec $I10
    is_cclass $I11, 8192, rx817_tgt, $I10
    unless $I11, rx817_fail
  # rx pass
    rx817_cur."!cursor_pass"(rx817_pos, "term:sym<self>")
    rx817_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx817_pos)
    .return (rx817_cur)
  rx817_fail:
.annotate 'line', 4
    (rx817_rep, rx817_pos, $I10, $P10) = rx817_cur."!mark_fail"(0)
    lt rx817_pos, -1, rx817_done
    eq rx817_pos, -1, rx817_fail
    jump $I10
  rx817_done:
    rx817_cur."!cursor_fail"()
    rx817_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx817_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("185_1275811487.95429") :method
.annotate 'line', 4
    new $P819, "ResizablePMCArray"
    push $P819, "self"
    .return ($P819)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("186_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx823_tgt
    .local int rx823_pos
    .local int rx823_off
    .local int rx823_eos
    .local int rx823_rep
    .local pmc rx823_cur
    (rx823_cur, rx823_pos, rx823_tgt) = self."!cursor_start"()
    rx823_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx823_cur
    .local pmc match
    .lex "$/", match
    length rx823_eos, rx823_tgt
    gt rx823_pos, rx823_eos, rx823_done
    set rx823_off, 0
    lt rx823_pos, 2, rx823_start
    sub rx823_off, rx823_pos, 1
    substr rx823_tgt, rx823_tgt, rx823_off
  rx823_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan827_done
    goto rxscan827_scan
  rxscan827_loop:
    ($P10) = rx823_cur."from"()
    inc $P10
    set rx823_pos, $P10
    ge rx823_pos, rx823_eos, rxscan827_done
  rxscan827_scan:
    set_addr $I10, rxscan827_loop
    rx823_cur."!mark_push"(0, rx823_pos, $I10)
  rxscan827_done:
.annotate 'line', 380
  # rx subrule "identifier" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."identifier"()
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx823_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx823_pos, rx823_eos, rx823_fail
    sub $I10, rx823_pos, rx823_off
    substr $S10, rx823_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx823_fail
  # rx subrule "args" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."args"()
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx823_pos = $P10."pos"()
.annotate 'line', 379
  # rx pass
    rx823_cur."!cursor_pass"(rx823_pos, "term:sym<identifier>")
    rx823_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx823_pos)
    .return (rx823_cur)
  rx823_fail:
.annotate 'line', 4
    (rx823_rep, rx823_pos, $I10, $P10) = rx823_cur."!mark_fail"(0)
    lt rx823_pos, -1, rx823_done
    eq rx823_pos, -1, rx823_fail
    jump $I10
  rx823_done:
    rx823_cur."!cursor_fail"()
    rx823_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx823_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("187_1275811487.95429") :method
.annotate 'line', 4
    $P825 = self."!PREFIX__!subrule"("identifier", "")
    new $P826, "ResizablePMCArray"
    push $P826, $P825
    .return ($P826)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("188_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx829_tgt
    .local int rx829_pos
    .local int rx829_off
    .local int rx829_eos
    .local int rx829_rep
    .local pmc rx829_cur
    (rx829_cur, rx829_pos, rx829_tgt) = self."!cursor_start"()
    rx829_cur."!cursor_debug"("START ", "term:sym<name>")
    rx829_cur."!cursor_caparray"("args")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan833_done
    goto rxscan833_scan
  rxscan833_loop:
    ($P10) = rx829_cur."from"()
    inc $P10
    set rx829_pos, $P10
    ge rx829_pos, rx829_eos, rxscan833_done
  rxscan833_scan:
    set_addr $I10, rxscan833_loop
    rx829_cur."!mark_push"(0, rx829_pos, $I10)
  rxscan833_done:
.annotate 'line', 384
  # rx subrule "name" subtype=capture negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."name"()
    unless $P10, rx829_fail
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx829_pos = $P10."pos"()
  # rx rxquantr834 ** 0..1
    set_addr $I835, rxquantr834_done
    rx829_cur."!mark_push"(0, rx829_pos, $I835)
  rxquantr834_loop:
  # rx subrule "args" subtype=capture negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."args"()
    unless $P10, rx829_fail
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx829_pos = $P10."pos"()
    (rx829_rep) = rx829_cur."!mark_commit"($I835)
  rxquantr834_done:
.annotate 'line', 383
  # rx pass
    rx829_cur."!cursor_pass"(rx829_pos, "term:sym<name>")
    rx829_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx829_pos)
    .return (rx829_cur)
  rx829_fail:
.annotate 'line', 4
    (rx829_rep, rx829_pos, $I10, $P10) = rx829_cur."!mark_fail"(0)
    lt rx829_pos, -1, rx829_done
    eq rx829_pos, -1, rx829_fail
    jump $I10
  rx829_done:
    rx829_cur."!cursor_fail"()
    rx829_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx829_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("189_1275811487.95429") :method
.annotate 'line', 4
    $P831 = self."!PREFIX__!subrule"("name", "")
    new $P832, "ResizablePMCArray"
    push $P832, $P831
    .return ($P832)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("190_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    (rx837_cur, rx837_pos, rx837_tgt) = self."!cursor_start"()
    rx837_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx837_cur."!cursor_caparray"("args")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan840_done
    goto rxscan840_scan
  rxscan840_loop:
    ($P10) = rx837_cur."from"()
    inc $P10
    set rx837_pos, $P10
    ge rx837_pos, rx837_eos, rxscan840_done
  rxscan840_scan:
    set_addr $I10, rxscan840_loop
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  rxscan840_done:
.annotate 'line', 388
  # rx literal  "pir::"
    add $I11, rx837_pos, 5
    gt $I11, rx837_eos, rx837_fail
    sub $I11, rx837_pos, rx837_off
    substr $S10, rx837_tgt, $I11, 5
    ne $S10, "pir::", rx837_fail
    add rx837_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_841_fail
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx837_pos, rx837_off
    find_not_cclass $I11, 8192, rx837_tgt, $I10, rx837_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx837_fail
    add rx837_pos, rx837_off, $I11
    set_addr $I10, rxcap_841_fail
    ($I12, $I11) = rx837_cur."!mark_peek"($I10)
    rx837_cur."!cursor_pos"($I11)
    ($P10) = rx837_cur."!cursor_start"()
    $P10."!cursor_pass"(rx837_pos, "")
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_841_done
  rxcap_841_fail:
    goto rx837_fail
  rxcap_841_done:
  # rx rxquantr842 ** 0..1
    set_addr $I843, rxquantr842_done
    rx837_cur."!mark_push"(0, rx837_pos, $I843)
  rxquantr842_loop:
  # rx subrule "args" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."args"()
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx837_pos = $P10."pos"()
    (rx837_rep) = rx837_cur."!mark_commit"($I843)
  rxquantr842_done:
.annotate 'line', 387
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "term:sym<pir::op>")
    rx837_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx837_pos)
    .return (rx837_cur)
  rx837_fail:
.annotate 'line', 4
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    rx837_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("191_1275811487.95429") :method
.annotate 'line', 4
    new $P839, "ResizablePMCArray"
    push $P839, "pir::"
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("192_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    (rx845_cur, rx845_pos, rx845_tgt) = self."!cursor_start"()
    rx845_cur."!cursor_debug"("START ", "args")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan849_done
    goto rxscan849_scan
  rxscan849_loop:
    ($P10) = rx845_cur."from"()
    inc $P10
    set rx845_pos, $P10
    ge rx845_pos, rx845_eos, rxscan849_done
  rxscan849_scan:
    set_addr $I10, rxscan849_loop
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  rxscan849_done:
.annotate 'line', 392
  # rx literal  "("
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, "(", rx845_fail
    add rx845_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."arglist"()
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx845_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, ")", rx845_fail
    add rx845_pos, 1
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "args")
    rx845_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx845_pos)
    .return (rx845_cur)
  rx845_fail:
.annotate 'line', 4
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    rx845_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("193_1275811487.95429") :method
.annotate 'line', 4
    $P847 = self."!PREFIX__!subrule"("arglist", "(")
    new $P848, "ResizablePMCArray"
    push $P848, $P847
    .return ($P848)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("194_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt) = self."!cursor_start"()
    rx851_cur."!cursor_debug"("START ", "arglist")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan855_done
    goto rxscan855_scan
  rxscan855_loop:
    ($P10) = rx851_cur."from"()
    inc $P10
    set rx851_pos, $P10
    ge rx851_pos, rx851_eos, rxscan855_done
  rxscan855_scan:
    set_addr $I10, rxscan855_loop
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  rxscan855_done:
.annotate 'line', 396
  # rx subrule "ws" subtype=method negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."ws"()
    unless $P10, rx851_fail
    rx851_pos = $P10."pos"()
  alt856_0:
.annotate 'line', 397
    set_addr $I10, alt856_1
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
.annotate 'line', 398
  # rx subrule "EXPR" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."EXPR"("f=")
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx851_pos = $P10."pos"()
    goto alt856_end
  alt856_1:
  alt856_end:
.annotate 'line', 395
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "arglist")
    rx851_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_fail:
.annotate 'line', 4
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("195_1275811487.95429") :method
.annotate 'line', 4
    $P853 = self."!PREFIX__!subrule"("ws", "")
    new $P854, "ResizablePMCArray"
    push $P854, $P853
    .return ($P854)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("196_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx858_tgt
    .local int rx858_pos
    .local int rx858_off
    .local int rx858_eos
    .local int rx858_rep
    .local pmc rx858_cur
    (rx858_cur, rx858_pos, rx858_tgt) = self."!cursor_start"()
    rx858_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx858_cur
    .local pmc match
    .lex "$/", match
    length rx858_eos, rx858_tgt
    gt rx858_pos, rx858_eos, rx858_done
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
.annotate 'line', 404
  # rx subrule "value" subtype=capture negate=
    rx858_cur."!cursor_pos"(rx858_pos)
    $P10 = rx858_cur."value"()
    unless $P10, rx858_fail
    rx858_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx858_pos = $P10."pos"()
  # rx pass
    rx858_cur."!cursor_pass"(rx858_pos, "term:sym<value>")
    rx858_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx858_pos)
    .return (rx858_cur)
  rx858_fail:
.annotate 'line', 4
    (rx858_rep, rx858_pos, $I10, $P10) = rx858_cur."!mark_fail"(0)
    lt rx858_pos, -1, rx858_done
    eq rx858_pos, -1, rx858_fail
    jump $I10
  rx858_done:
    rx858_cur."!cursor_fail"()
    rx858_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx858_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("197_1275811487.95429") :method
.annotate 'line', 4
    $P860 = self."!PREFIX__!subrule"("value", "")
    new $P861, "ResizablePMCArray"
    push $P861, $P860
    .return ($P861)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("198_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx864_tgt
    .local int rx864_pos
    .local int rx864_off
    .local int rx864_eos
    .local int rx864_rep
    .local pmc rx864_cur
    (rx864_cur, rx864_pos, rx864_tgt) = self."!cursor_start"()
    rx864_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx864_cur
    .local pmc match
    .lex "$/", match
    length rx864_eos, rx864_tgt
    gt rx864_pos, rx864_eos, rx864_done
    set rx864_off, 0
    lt rx864_pos, 2, rx864_start
    sub rx864_off, rx864_pos, 1
    substr rx864_tgt, rx864_tgt, rx864_off
  rx864_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan869_done
    goto rxscan869_scan
  rxscan869_loop:
    ($P10) = rx864_cur."from"()
    inc $P10
    set rx864_pos, $P10
    ge rx864_pos, rx864_eos, rxscan869_done
  rxscan869_scan:
    set_addr $I10, rxscan869_loop
    rx864_cur."!mark_push"(0, rx864_pos, $I10)
  rxscan869_done:
  alt870_0:
.annotate 'line', 406
    set_addr $I10, alt870_1
    rx864_cur."!mark_push"(0, rx864_pos, $I10)
.annotate 'line', 407
  # rx subrule "quote" subtype=capture negate=
    rx864_cur."!cursor_pos"(rx864_pos)
    $P10 = rx864_cur."quote"()
    unless $P10, rx864_fail
    rx864_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx864_pos = $P10."pos"()
    goto alt870_end
  alt870_1:
.annotate 'line', 408
  # rx subrule "number" subtype=capture negate=
    rx864_cur."!cursor_pos"(rx864_pos)
    $P10 = rx864_cur."number"()
    unless $P10, rx864_fail
    rx864_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx864_pos = $P10."pos"()
  alt870_end:
.annotate 'line', 406
  # rx pass
    rx864_cur."!cursor_pass"(rx864_pos, "value")
    rx864_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx864_pos)
    .return (rx864_cur)
  rx864_fail:
.annotate 'line', 4
    (rx864_rep, rx864_pos, $I10, $P10) = rx864_cur."!mark_fail"(0)
    lt rx864_pos, -1, rx864_done
    eq rx864_pos, -1, rx864_fail
    jump $I10
  rx864_done:
    rx864_cur."!cursor_fail"()
    rx864_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx864_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("199_1275811487.95429") :method
.annotate 'line', 4
    $P866 = self."!PREFIX__!subrule"("number", "")
    $P867 = self."!PREFIX__!subrule"("quote", "")
    new $P868, "ResizablePMCArray"
    push $P868, $P866
    push $P868, $P867
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("200_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx872_tgt
    .local int rx872_pos
    .local int rx872_off
    .local int rx872_eos
    .local int rx872_rep
    .local pmc rx872_cur
    (rx872_cur, rx872_pos, rx872_tgt) = self."!cursor_start"()
    rx872_cur."!cursor_debug"("START ", "number")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan875_done
    goto rxscan875_scan
  rxscan875_loop:
    ($P10) = rx872_cur."from"()
    inc $P10
    set rx872_pos, $P10
    ge rx872_pos, rx872_eos, rxscan875_done
  rxscan875_scan:
    set_addr $I10, rxscan875_loop
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  rxscan875_done:
.annotate 'line', 412
  # rx subcapture "sign"
    set_addr $I10, rxcap_878_fail
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  # rx rxquantr876 ** 0..1
    set_addr $I877, rxquantr876_done
    rx872_cur."!mark_push"(0, rx872_pos, $I877)
  rxquantr876_loop:
  # rx enumcharlist negate=0 
    ge rx872_pos, rx872_eos, rx872_fail
    sub $I10, rx872_pos, rx872_off
    substr $S10, rx872_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx872_fail
    inc rx872_pos
    (rx872_rep) = rx872_cur."!mark_commit"($I877)
  rxquantr876_done:
    set_addr $I10, rxcap_878_fail
    ($I12, $I11) = rx872_cur."!mark_peek"($I10)
    rx872_cur."!cursor_pos"($I11)
    ($P10) = rx872_cur."!cursor_start"()
    $P10."!cursor_pass"(rx872_pos, "")
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_878_done
  rxcap_878_fail:
    goto rx872_fail
  rxcap_878_done:
  alt879_0:
.annotate 'line', 413
    set_addr $I10, alt879_1
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."dec_number"()
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx872_pos = $P10."pos"()
    goto alt879_end
  alt879_1:
  # rx subrule "integer" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."integer"()
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx872_pos = $P10."pos"()
  alt879_end:
.annotate 'line', 411
  # rx pass
    rx872_cur."!cursor_pass"(rx872_pos, "number")
    rx872_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx872_pos)
    .return (rx872_cur)
  rx872_fail:
.annotate 'line', 4
    (rx872_rep, rx872_pos, $I10, $P10) = rx872_cur."!mark_fail"(0)
    lt rx872_pos, -1, rx872_done
    eq rx872_pos, -1, rx872_fail
    jump $I10
  rx872_done:
    rx872_cur."!cursor_fail"()
    rx872_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx872_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("201_1275811487.95429") :method
.annotate 'line', 4
    new $P874, "ResizablePMCArray"
    push $P874, ""
    .return ($P874)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("202_1275811487.95429") :method
.annotate 'line', 416
    $P881 = self."!protoregex"("quote")
    .return ($P881)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("203_1275811487.95429") :method
.annotate 'line', 416
    $P883 = self."!PREFIX__!protoregex"("quote")
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("204_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt) = self."!cursor_start"()
    rx885_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan888_done
    goto rxscan888_scan
  rxscan888_loop:
    ($P10) = rx885_cur."from"()
    inc $P10
    set rx885_pos, $P10
    ge rx885_pos, rx885_eos, rxscan888_done
  rxscan888_scan:
    set_addr $I10, rxscan888_loop
    rx885_cur."!mark_push"(0, rx885_pos, $I10)
  rxscan888_done:
.annotate 'line', 417
  # rx enumcharlist negate=0 zerowidth
    ge rx885_pos, rx885_eos, rx885_fail
    sub $I10, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx885_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."quote_EXPR"(":q")
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx885_pos = $P10."pos"()
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "quote:sym<apos>")
    rx885_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate 'line', 4
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("205_1275811487.95429") :method
.annotate 'line', 4
    new $P887, "ResizablePMCArray"
    push $P887, "'"
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("206_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx890_tgt
    .local int rx890_pos
    .local int rx890_off
    .local int rx890_eos
    .local int rx890_rep
    .local pmc rx890_cur
    (rx890_cur, rx890_pos, rx890_tgt) = self."!cursor_start"()
    rx890_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx890_cur
    .local pmc match
    .lex "$/", match
    length rx890_eos, rx890_tgt
    gt rx890_pos, rx890_eos, rx890_done
    set rx890_off, 0
    lt rx890_pos, 2, rx890_start
    sub rx890_off, rx890_pos, 1
    substr rx890_tgt, rx890_tgt, rx890_off
  rx890_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan893_done
    goto rxscan893_scan
  rxscan893_loop:
    ($P10) = rx890_cur."from"()
    inc $P10
    set rx890_pos, $P10
    ge rx890_pos, rx890_eos, rxscan893_done
  rxscan893_scan:
    set_addr $I10, rxscan893_loop
    rx890_cur."!mark_push"(0, rx890_pos, $I10)
  rxscan893_done:
.annotate 'line', 418
  # rx enumcharlist negate=0 zerowidth
    ge rx890_pos, rx890_eos, rx890_fail
    sub $I10, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx890_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."quote_EXPR"(":qq")
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx890_pos = $P10."pos"()
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "quote:sym<dblq>")
    rx890_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate 'line', 4
    (rx890_rep, rx890_pos, $I10, $P10) = rx890_cur."!mark_fail"(0)
    lt rx890_pos, -1, rx890_done
    eq rx890_pos, -1, rx890_fail
    jump $I10
  rx890_done:
    rx890_cur."!cursor_fail"()
    rx890_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx890_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("207_1275811487.95429") :method
.annotate 'line', 4
    new $P892, "ResizablePMCArray"
    push $P892, "\""
    .return ($P892)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("208_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx895_tgt
    .local int rx895_pos
    .local int rx895_off
    .local int rx895_eos
    .local int rx895_rep
    .local pmc rx895_cur
    (rx895_cur, rx895_pos, rx895_tgt) = self."!cursor_start"()
    rx895_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx895_cur
    .local pmc match
    .lex "$/", match
    length rx895_eos, rx895_tgt
    gt rx895_pos, rx895_eos, rx895_done
    set rx895_off, 0
    lt rx895_pos, 2, rx895_start
    sub rx895_off, rx895_pos, 1
    substr rx895_tgt, rx895_tgt, rx895_off
  rx895_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan899_done
    goto rxscan899_scan
  rxscan899_loop:
    ($P10) = rx895_cur."from"()
    inc $P10
    set rx895_pos, $P10
    ge rx895_pos, rx895_eos, rxscan899_done
  rxscan899_scan:
    set_addr $I10, rxscan899_loop
    rx895_cur."!mark_push"(0, rx895_pos, $I10)
  rxscan899_done:
.annotate 'line', 419
  # rx literal  "q"
    add $I11, rx895_pos, 1
    gt $I11, rx895_eos, rx895_fail
    sub $I11, rx895_pos, rx895_off
    substr $S10, rx895_tgt, $I11, 1
    ne $S10, "q", rx895_fail
    add rx895_pos, 1
  # rxanchor rwb
    le rx895_pos, 0, rx895_fail
    sub $I10, rx895_pos, rx895_off
    is_cclass $I11, 8192, rx895_tgt, $I10
    if $I11, rx895_fail
    dec $I10
    is_cclass $I11, 8192, rx895_tgt, $I10
    unless $I11, rx895_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx895_pos, rx895_eos, rx895_fail
    sub $I10, rx895_pos, rx895_off
    substr $S10, rx895_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx895_fail
  # rx subrule "ws" subtype=method negate=
    rx895_cur."!cursor_pos"(rx895_pos)
    $P10 = rx895_cur."ws"()
    unless $P10, rx895_fail
    rx895_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx895_cur."!cursor_pos"(rx895_pos)
    $P10 = rx895_cur."quote_EXPR"(":q")
    unless $P10, rx895_fail
    rx895_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx895_pos = $P10."pos"()
  # rx pass
    rx895_cur."!cursor_pass"(rx895_pos, "quote:sym<q>")
    rx895_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx895_pos)
    .return (rx895_cur)
  rx895_fail:
.annotate 'line', 4
    (rx895_rep, rx895_pos, $I10, $P10) = rx895_cur."!mark_fail"(0)
    lt rx895_pos, -1, rx895_done
    eq rx895_pos, -1, rx895_fail
    jump $I10
  rx895_done:
    rx895_cur."!cursor_fail"()
    rx895_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx895_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("209_1275811487.95429") :method
.annotate 'line', 4
    $P897 = self."!PREFIX__!subrule"("ws", "q")
    new $P898, "ResizablePMCArray"
    push $P898, $P897
    .return ($P898)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("210_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    (rx901_cur, rx901_pos, rx901_tgt) = self."!cursor_start"()
    rx901_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan905_done
    goto rxscan905_scan
  rxscan905_loop:
    ($P10) = rx901_cur."from"()
    inc $P10
    set rx901_pos, $P10
    ge rx901_pos, rx901_eos, rxscan905_done
  rxscan905_scan:
    set_addr $I10, rxscan905_loop
    rx901_cur."!mark_push"(0, rx901_pos, $I10)
  rxscan905_done:
.annotate 'line', 420
  # rx literal  "qq"
    add $I11, rx901_pos, 2
    gt $I11, rx901_eos, rx901_fail
    sub $I11, rx901_pos, rx901_off
    substr $S10, rx901_tgt, $I11, 2
    ne $S10, "qq", rx901_fail
    add rx901_pos, 2
  # rxanchor rwb
    le rx901_pos, 0, rx901_fail
    sub $I10, rx901_pos, rx901_off
    is_cclass $I11, 8192, rx901_tgt, $I10
    if $I11, rx901_fail
    dec $I10
    is_cclass $I11, 8192, rx901_tgt, $I10
    unless $I11, rx901_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx901_pos, rx901_eos, rx901_fail
    sub $I10, rx901_pos, rx901_off
    substr $S10, rx901_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx901_fail
  # rx subrule "ws" subtype=method negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."ws"()
    unless $P10, rx901_fail
    rx901_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."quote_EXPR"(":qq")
    unless $P10, rx901_fail
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx901_pos = $P10."pos"()
  # rx pass
    rx901_cur."!cursor_pass"(rx901_pos, "quote:sym<qq>")
    rx901_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx901_pos)
    .return (rx901_cur)
  rx901_fail:
.annotate 'line', 4
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    rx901_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("211_1275811487.95429") :method
.annotate 'line', 4
    $P903 = self."!PREFIX__!subrule"("ws", "qq")
    new $P904, "ResizablePMCArray"
    push $P904, $P903
    .return ($P904)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("212_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx907_tgt
    .local int rx907_pos
    .local int rx907_off
    .local int rx907_eos
    .local int rx907_rep
    .local pmc rx907_cur
    (rx907_cur, rx907_pos, rx907_tgt) = self."!cursor_start"()
    rx907_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx907_cur
    .local pmc match
    .lex "$/", match
    length rx907_eos, rx907_tgt
    gt rx907_pos, rx907_eos, rx907_done
    set rx907_off, 0
    lt rx907_pos, 2, rx907_start
    sub rx907_off, rx907_pos, 1
    substr rx907_tgt, rx907_tgt, rx907_off
  rx907_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan911_done
    goto rxscan911_scan
  rxscan911_loop:
    ($P10) = rx907_cur."from"()
    inc $P10
    set rx907_pos, $P10
    ge rx907_pos, rx907_eos, rxscan911_done
  rxscan911_scan:
    set_addr $I10, rxscan911_loop
    rx907_cur."!mark_push"(0, rx907_pos, $I10)
  rxscan911_done:
.annotate 'line', 421
  # rx literal  "Q"
    add $I11, rx907_pos, 1
    gt $I11, rx907_eos, rx907_fail
    sub $I11, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I11, 1
    ne $S10, "Q", rx907_fail
    add rx907_pos, 1
  # rxanchor rwb
    le rx907_pos, 0, rx907_fail
    sub $I10, rx907_pos, rx907_off
    is_cclass $I11, 8192, rx907_tgt, $I10
    if $I11, rx907_fail
    dec $I10
    is_cclass $I11, 8192, rx907_tgt, $I10
    unless $I11, rx907_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx907_pos, rx907_eos, rx907_fail
    sub $I10, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx907_fail
  # rx subrule "ws" subtype=method negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."ws"()
    unless $P10, rx907_fail
    rx907_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."quote_EXPR"()
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx907_pos = $P10."pos"()
  # rx pass
    rx907_cur."!cursor_pass"(rx907_pos, "quote:sym<Q>")
    rx907_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx907_pos)
    .return (rx907_cur)
  rx907_fail:
.annotate 'line', 4
    (rx907_rep, rx907_pos, $I10, $P10) = rx907_cur."!mark_fail"(0)
    lt rx907_pos, -1, rx907_done
    eq rx907_pos, -1, rx907_fail
    jump $I10
  rx907_done:
    rx907_cur."!cursor_fail"()
    rx907_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx907_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("213_1275811487.95429") :method
.annotate 'line', 4
    $P909 = self."!PREFIX__!subrule"("ws", "Q")
    new $P910, "ResizablePMCArray"
    push $P910, $P909
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("214_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
.annotate 'line', 422
  # rx literal  "Q:PIR"
    add $I11, rx913_pos, 5
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 5
    ne $S10, "Q:PIR", rx913_fail
    add rx913_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."ws"()
    unless $P10, rx913_fail
    rx913_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."quote_EXPR"()
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx913_pos = $P10."pos"()
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "quote:sym<Q:PIR>")
    rx913_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate 'line', 4
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("215_1275811487.95429") :method
.annotate 'line', 4
    $P915 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("216_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx919_tgt
    .local int rx919_pos
    .local int rx919_off
    .local int rx919_eos
    .local int rx919_rep
    .local pmc rx919_cur
    (rx919_cur, rx919_pos, rx919_tgt) = self."!cursor_start"()
    rx919_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx919_cur
    .local pmc match
    .lex "$/", match
    length rx919_eos, rx919_tgt
    gt rx919_pos, rx919_eos, rx919_done
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
.annotate 'line', 424
  # rx literal  "/"
    add $I11, rx919_pos, 1
    gt $I11, rx919_eos, rx919_fail
    sub $I11, rx919_pos, rx919_off
    substr $S10, rx919_tgt, $I11, 1
    ne $S10, "/", rx919_fail
    add rx919_pos, 1
.annotate 'line', 425
  # rx subrule "newpad" subtype=method negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."newpad"()
    unless $P10, rx919_fail
    rx919_pos = $P10."pos"()
.annotate 'line', 426
  # rx reduce name="quote:sym</ />" key="open"
    rx919_cur."!cursor_pos"(rx919_pos)
    rx919_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 427
  # rx subrule "LANG" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."LANG"("Regex", "nibbler")
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx919_pos = $P10."pos"()
.annotate 'line', 428
  # rx literal  "/"
    add $I11, rx919_pos, 1
    gt $I11, rx919_eos, rx919_fail
    sub $I11, rx919_pos, rx919_off
    substr $S10, rx919_tgt, $I11, 1
    ne $S10, "/", rx919_fail
    add rx919_pos, 1
.annotate 'line', 423
  # rx pass
    rx919_cur."!cursor_pass"(rx919_pos, "quote:sym</ />")
    rx919_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx919_pos)
    .return (rx919_cur)
  rx919_fail:
.annotate 'line', 4
    (rx919_rep, rx919_pos, $I10, $P10) = rx919_cur."!mark_fail"(0)
    lt rx919_pos, -1, rx919_done
    eq rx919_pos, -1, rx919_fail
    jump $I10
  rx919_done:
    rx919_cur."!cursor_fail"()
    rx919_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx919_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("217_1275811487.95429") :method
.annotate 'line', 4
    $P921 = self."!PREFIX__!subrule"("newpad", "/")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("218_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx925_tgt
    .local int rx925_pos
    .local int rx925_off
    .local int rx925_eos
    .local int rx925_rep
    .local pmc rx925_cur
    (rx925_cur, rx925_pos, rx925_tgt) = self."!cursor_start"()
    rx925_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
    ne $I10, -1, rxscan928_done
    goto rxscan928_scan
  rxscan928_loop:
    ($P10) = rx925_cur."from"()
    inc $P10
    set rx925_pos, $P10
    ge rx925_pos, rx925_eos, rxscan928_done
  rxscan928_scan:
    set_addr $I10, rxscan928_loop
    rx925_cur."!mark_push"(0, rx925_pos, $I10)
  rxscan928_done:
.annotate 'line', 431
  # rx enumcharlist negate=0 zerowidth
    ge rx925_pos, rx925_eos, rx925_fail
    sub $I10, rx925_pos, rx925_off
    substr $S10, rx925_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx925_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."quotemod_check"("s")
    unless $P10, rx925_fail
  # rx subrule "variable" subtype=capture negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."variable"()
    unless $P10, rx925_fail
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx925_pos = $P10."pos"()
  # rx pass
    rx925_cur."!cursor_pass"(rx925_pos, "quote_escape:sym<$>")
    rx925_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx925_pos)
    .return (rx925_cur)
  rx925_fail:
.annotate 'line', 4
    (rx925_rep, rx925_pos, $I10, $P10) = rx925_cur."!mark_fail"(0)
    lt rx925_pos, -1, rx925_done
    eq rx925_pos, -1, rx925_fail
    jump $I10
  rx925_done:
    rx925_cur."!cursor_fail"()
    rx925_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx925_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("219_1275811487.95429") :method
.annotate 'line', 4
    new $P927, "ResizablePMCArray"
    push $P927, "$"
    .return ($P927)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("220_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx930_tgt
    .local int rx930_pos
    .local int rx930_off
    .local int rx930_eos
    .local int rx930_rep
    .local pmc rx930_cur
    (rx930_cur, rx930_pos, rx930_tgt) = self."!cursor_start"()
    rx930_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate 'line', 432
  # rx enumcharlist negate=0 zerowidth
    ge rx930_pos, rx930_eos, rx930_fail
    sub $I10, rx930_pos, rx930_off
    substr $S10, rx930_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx930_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."quotemod_check"("c")
    unless $P10, rx930_fail
  # rx subrule "block" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."block"()
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx930_pos = $P10."pos"()
  # rx pass
    rx930_cur."!cursor_pass"(rx930_pos, "quote_escape:sym<{ }>")
    rx930_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx930_pos)
    .return (rx930_cur)
  rx930_fail:
.annotate 'line', 4
    (rx930_rep, rx930_pos, $I10, $P10) = rx930_cur."!mark_fail"(0)
    lt rx930_pos, -1, rx930_done
    eq rx930_pos, -1, rx930_fail
    jump $I10
  rx930_done:
    rx930_cur."!cursor_fail"()
    rx930_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx930_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("221_1275811487.95429") :method
.annotate 'line', 4
    new $P932, "ResizablePMCArray"
    push $P932, "{"
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("222_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx935_tgt
    .local int rx935_pos
    .local int rx935_off
    .local int rx935_eos
    .local int rx935_rep
    .local pmc rx935_cur
    (rx935_cur, rx935_pos, rx935_tgt) = self."!cursor_start"()
    rx935_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
    .lex unicode:"$\x{a2}", rx935_cur
    .local pmc match
    .lex "$/", match
    length rx935_eos, rx935_tgt
    gt rx935_pos, rx935_eos, rx935_done
    set rx935_off, 0
    lt rx935_pos, 2, rx935_start
    sub rx935_off, rx935_pos, 1
    substr rx935_tgt, rx935_tgt, rx935_off
  rx935_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan938_done
    goto rxscan938_scan
  rxscan938_loop:
    ($P10) = rx935_cur."from"()
    inc $P10
    set rx935_pos, $P10
    ge rx935_pos, rx935_eos, rxscan938_done
  rxscan938_scan:
    set_addr $I10, rxscan938_loop
    rx935_cur."!mark_push"(0, rx935_pos, $I10)
  rxscan938_done:
.annotate 'line', 433
  # rx literal  "\\e"
    add $I11, rx935_pos, 2
    gt $I11, rx935_eos, rx935_fail
    sub $I11, rx935_pos, rx935_off
    substr $S10, rx935_tgt, $I11, 2
    ne $S10, "\\e", rx935_fail
    add rx935_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."quotemod_check"("b")
    unless $P10, rx935_fail
  # rx pass
    rx935_cur."!cursor_pass"(rx935_pos, "quote_escape:sym<esc>")
    rx935_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx935_pos)
    .return (rx935_cur)
  rx935_fail:
.annotate 'line', 4
    (rx935_rep, rx935_pos, $I10, $P10) = rx935_cur."!mark_fail"(0)
    lt rx935_pos, -1, rx935_done
    eq rx935_pos, -1, rx935_fail
    jump $I10
  rx935_done:
    rx935_cur."!cursor_fail"()
    rx935_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx935_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("223_1275811487.95429") :method
.annotate 'line', 4
    new $P937, "ResizablePMCArray"
    push $P937, "\\e"
    .return ($P937)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("224_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx940_tgt
    .local int rx940_pos
    .local int rx940_off
    .local int rx940_eos
    .local int rx940_rep
    .local pmc rx940_cur
    (rx940_cur, rx940_pos, rx940_tgt) = self."!cursor_start"()
    rx940_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx940_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx940_cur
    .local pmc match
    .lex "$/", match
    length rx940_eos, rx940_tgt
    gt rx940_pos, rx940_eos, rx940_done
    set rx940_off, 0
    lt rx940_pos, 2, rx940_start
    sub rx940_off, rx940_pos, 1
    substr rx940_tgt, rx940_tgt, rx940_off
  rx940_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan944_done
    goto rxscan944_scan
  rxscan944_loop:
    ($P10) = rx940_cur."from"()
    inc $P10
    set rx940_pos, $P10
    ge rx940_pos, rx940_eos, rxscan944_done
  rxscan944_scan:
    set_addr $I10, rxscan944_loop
    rx940_cur."!mark_push"(0, rx940_pos, $I10)
  rxscan944_done:
.annotate 'line', 435
  # rx literal  "("
    add $I11, rx940_pos, 1
    gt $I11, rx940_eos, rx940_fail
    sub $I11, rx940_pos, rx940_off
    substr $S10, rx940_tgt, $I11, 1
    ne $S10, "(", rx940_fail
    add rx940_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx940_cur."!cursor_pos"(rx940_pos)
    $P10 = rx940_cur."ws"()
    unless $P10, rx940_fail
    rx940_pos = $P10."pos"()
  # rx rxquantr945 ** 0..1
    set_addr $I946, rxquantr945_done
    rx940_cur."!mark_push"(0, rx940_pos, $I946)
  rxquantr945_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx940_cur."!cursor_pos"(rx940_pos)
    $P10 = rx940_cur."EXPR"()
    unless $P10, rx940_fail
    rx940_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx940_pos = $P10."pos"()
    (rx940_rep) = rx940_cur."!mark_commit"($I946)
  rxquantr945_done:
  # rx literal  ")"
    add $I11, rx940_pos, 1
    gt $I11, rx940_eos, rx940_fail
    sub $I11, rx940_pos, rx940_off
    substr $S10, rx940_tgt, $I11, 1
    ne $S10, ")", rx940_fail
    add rx940_pos, 1
  # rx pass
    rx940_cur."!cursor_pass"(rx940_pos, "circumfix:sym<( )>")
    rx940_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx940_pos)
    .return (rx940_cur)
  rx940_fail:
.annotate 'line', 4
    (rx940_rep, rx940_pos, $I10, $P10) = rx940_cur."!mark_fail"(0)
    lt rx940_pos, -1, rx940_done
    eq rx940_pos, -1, rx940_fail
    jump $I10
  rx940_done:
    rx940_cur."!cursor_fail"()
    rx940_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx940_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("225_1275811487.95429") :method
.annotate 'line', 4
    $P942 = self."!PREFIX__!subrule"("ws", "(")
    new $P943, "ResizablePMCArray"
    push $P943, $P942
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("226_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx948_tgt
    .local int rx948_pos
    .local int rx948_off
    .local int rx948_eos
    .local int rx948_rep
    .local pmc rx948_cur
    (rx948_cur, rx948_pos, rx948_tgt) = self."!cursor_start"()
    rx948_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx948_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx948_cur
    .local pmc match
    .lex "$/", match
    length rx948_eos, rx948_tgt
    gt rx948_pos, rx948_eos, rx948_done
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
.annotate 'line', 436
  # rx literal  "["
    add $I11, rx948_pos, 1
    gt $I11, rx948_eos, rx948_fail
    sub $I11, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I11, 1
    ne $S10, "[", rx948_fail
    add rx948_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."ws"()
    unless $P10, rx948_fail
    rx948_pos = $P10."pos"()
  # rx rxquantr953 ** 0..1
    set_addr $I954, rxquantr953_done
    rx948_cur."!mark_push"(0, rx948_pos, $I954)
  rxquantr953_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."EXPR"()
    unless $P10, rx948_fail
    rx948_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx948_pos = $P10."pos"()
    (rx948_rep) = rx948_cur."!mark_commit"($I954)
  rxquantr953_done:
  # rx literal  "]"
    add $I11, rx948_pos, 1
    gt $I11, rx948_eos, rx948_fail
    sub $I11, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I11, 1
    ne $S10, "]", rx948_fail
    add rx948_pos, 1
  # rx pass
    rx948_cur."!cursor_pass"(rx948_pos, "circumfix:sym<[ ]>")
    rx948_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx948_pos)
    .return (rx948_cur)
  rx948_fail:
.annotate 'line', 4
    (rx948_rep, rx948_pos, $I10, $P10) = rx948_cur."!mark_fail"(0)
    lt rx948_pos, -1, rx948_done
    eq rx948_pos, -1, rx948_fail
    jump $I10
  rx948_done:
    rx948_cur."!cursor_fail"()
    rx948_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx948_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("227_1275811487.95429") :method
.annotate 'line', 4
    $P950 = self."!PREFIX__!subrule"("ws", "[")
    new $P951, "ResizablePMCArray"
    push $P951, $P950
    .return ($P951)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("228_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx956_tgt
    .local int rx956_pos
    .local int rx956_off
    .local int rx956_eos
    .local int rx956_rep
    .local pmc rx956_cur
    (rx956_cur, rx956_pos, rx956_tgt) = self."!cursor_start"()
    rx956_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
    ne $I10, -1, rxscan959_done
    goto rxscan959_scan
  rxscan959_loop:
    ($P10) = rx956_cur."from"()
    inc $P10
    set rx956_pos, $P10
    ge rx956_pos, rx956_eos, rxscan959_done
  rxscan959_scan:
    set_addr $I10, rxscan959_loop
    rx956_cur."!mark_push"(0, rx956_pos, $I10)
  rxscan959_done:
.annotate 'line', 437
  # rx enumcharlist negate=0 zerowidth
    ge rx956_pos, rx956_eos, rx956_fail
    sub $I10, rx956_pos, rx956_off
    substr $S10, rx956_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx956_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx956_cur."!cursor_pos"(rx956_pos)
    $P10 = rx956_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx956_fail
    rx956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx956_pos = $P10."pos"()
  # rx pass
    rx956_cur."!cursor_pass"(rx956_pos, "circumfix:sym<ang>")
    rx956_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx956_pos)
    .return (rx956_cur)
  rx956_fail:
.annotate 'line', 4
    (rx956_rep, rx956_pos, $I10, $P10) = rx956_cur."!mark_fail"(0)
    lt rx956_pos, -1, rx956_done
    eq rx956_pos, -1, rx956_fail
    jump $I10
  rx956_done:
    rx956_cur."!cursor_fail"()
    rx956_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx956_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("229_1275811487.95429") :method
.annotate 'line', 4
    new $P958, "ResizablePMCArray"
    push $P958, "<"
    .return ($P958)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("230_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx961_cur
    .local pmc match
    .lex "$/", match
    length rx961_eos, rx961_tgt
    gt rx961_pos, rx961_eos, rx961_done
    set rx961_off, 0
    lt rx961_pos, 2, rx961_start
    sub rx961_off, rx961_pos, 1
    substr rx961_tgt, rx961_tgt, rx961_off
  rx961_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan964_done
    goto rxscan964_scan
  rxscan964_loop:
    ($P10) = rx961_cur."from"()
    inc $P10
    set rx961_pos, $P10
    ge rx961_pos, rx961_eos, rxscan964_done
  rxscan964_scan:
    set_addr $I10, rxscan964_loop
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  rxscan964_done:
.annotate 'line', 438
  # rx enumcharlist negate=0 zerowidth
    ge rx961_pos, rx961_eos, rx961_fail
    sub $I10, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx961_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx961_cur."!cursor_pos"(rx961_pos)
    $P10 = rx961_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx961_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate 'line', 4
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("231_1275811487.95429") :method
.annotate 'line', 4
    new $P963, "ResizablePMCArray"
    push $P963, unicode:"\x{ab}"
    .return ($P963)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("232_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx966_tgt
    .local int rx966_pos
    .local int rx966_off
    .local int rx966_eos
    .local int rx966_rep
    .local pmc rx966_cur
    (rx966_cur, rx966_pos, rx966_tgt) = self."!cursor_start"()
    rx966_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
.annotate 'line', 439
  # rx enumcharlist negate=0 zerowidth
    ge rx966_pos, rx966_eos, rx966_fail
    sub $I10, rx966_pos, rx966_off
    substr $S10, rx966_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx966_fail
  # rx subrule "pblock" subtype=capture negate=
    rx966_cur."!cursor_pos"(rx966_pos)
    $P10 = rx966_cur."pblock"()
    unless $P10, rx966_fail
    rx966_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx966_pos = $P10."pos"()
  # rx pass
    rx966_cur."!cursor_pass"(rx966_pos, "circumfix:sym<{ }>")
    rx966_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx966_pos)
    .return (rx966_cur)
  rx966_fail:
.annotate 'line', 4
    (rx966_rep, rx966_pos, $I10, $P10) = rx966_cur."!mark_fail"(0)
    lt rx966_pos, -1, rx966_done
    eq rx966_pos, -1, rx966_fail
    jump $I10
  rx966_done:
    rx966_cur."!cursor_fail"()
    rx966_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx966_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("233_1275811487.95429") :method
.annotate 'line', 4
    new $P968, "ResizablePMCArray"
    push $P968, "{"
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("234_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    (rx971_cur, rx971_pos, rx971_tgt) = self."!cursor_start"()
    rx971_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
    ne $I10, -1, rxscan975_done
    goto rxscan975_scan
  rxscan975_loop:
    ($P10) = rx971_cur."from"()
    inc $P10
    set rx971_pos, $P10
    ge rx971_pos, rx971_eos, rxscan975_done
  rxscan975_scan:
    set_addr $I10, rxscan975_loop
    rx971_cur."!mark_push"(0, rx971_pos, $I10)
  rxscan975_done:
.annotate 'line', 440
  # rx subrule "sigil" subtype=capture negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."sigil"()
    unless $P10, rx971_fail
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx971_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx971_pos, 1
    gt $I11, rx971_eos, rx971_fail
    sub $I11, rx971_pos, rx971_off
    substr $S10, rx971_tgt, $I11, 1
    ne $S10, "(", rx971_fail
    add rx971_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."semilist"()
    unless $P10, rx971_fail
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx971_pos = $P10."pos"()
  alt976_0:
    set_addr $I10, alt976_1
    rx971_cur."!mark_push"(0, rx971_pos, $I10)
  # rx literal  ")"
    add $I11, rx971_pos, 1
    gt $I11, rx971_eos, rx971_fail
    sub $I11, rx971_pos, rx971_off
    substr $S10, rx971_tgt, $I11, 1
    ne $S10, ")", rx971_fail
    add rx971_pos, 1
    goto alt976_end
  alt976_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."FAILGOAL"("')'")
    unless $P10, rx971_fail
    rx971_pos = $P10."pos"()
  alt976_end:
  # rx pass
    rx971_cur."!cursor_pass"(rx971_pos, "circumfix:sym<sigil>")
    rx971_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx971_pos)
    .return (rx971_cur)
  rx971_fail:
.annotate 'line', 4
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    rx971_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("235_1275811487.95429") :method
.annotate 'line', 4
    $P973 = self."!PREFIX__!subrule"("sigil", "")
    new $P974, "ResizablePMCArray"
    push $P974, $P973
    .return ($P974)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("236_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 4
    .local string rx979_tgt
    .local int rx979_pos
    .local int rx979_off
    .local int rx979_eos
    .local int rx979_rep
    .local pmc rx979_cur
    (rx979_cur, rx979_pos, rx979_tgt) = self."!cursor_start"()
    rx979_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx979_cur
    .local pmc match
    .lex "$/", match
    length rx979_eos, rx979_tgt
    gt rx979_pos, rx979_eos, rx979_done
    set rx979_off, 0
    lt rx979_pos, 2, rx979_start
    sub rx979_off, rx979_pos, 1
    substr rx979_tgt, rx979_tgt, rx979_off
  rx979_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan983_done
    goto rxscan983_scan
  rxscan983_loop:
    ($P10) = rx979_cur."from"()
    inc $P10
    set rx979_pos, $P10
    ge rx979_pos, rx979_eos, rxscan983_done
  rxscan983_scan:
    set_addr $I10, rxscan983_loop
    rx979_cur."!mark_push"(0, rx979_pos, $I10)
  rxscan983_done:
.annotate 'line', 442
  # rx subrule "ws" subtype=method negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."ws"()
    unless $P10, rx979_fail
    rx979_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."statement"()
    unless $P10, rx979_fail
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx979_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."ws"()
    unless $P10, rx979_fail
    rx979_pos = $P10."pos"()
  # rx pass
    rx979_cur."!cursor_pass"(rx979_pos, "semilist")
    rx979_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx979_pos)
    .return (rx979_cur)
  rx979_fail:
.annotate 'line', 4
    (rx979_rep, rx979_pos, $I10, $P10) = rx979_cur."!mark_fail"(0)
    lt rx979_pos, -1, rx979_done
    eq rx979_pos, -1, rx979_fail
    jump $I10
  rx979_done:
    rx979_cur."!cursor_fail"()
    rx979_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx979_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("237_1275811487.95429") :method
.annotate 'line', 4
    $P981 = self."!PREFIX__!subrule"("ws", "")
    new $P982, "ResizablePMCArray"
    push $P982, $P981
    .return ($P982)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("238_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx987_tgt
    .local int rx987_pos
    .local int rx987_off
    .local int rx987_eos
    .local int rx987_rep
    .local pmc rx987_cur
    (rx987_cur, rx987_pos, rx987_tgt) = self."!cursor_start"()
    rx987_cur."!cursor_debug"("START ", "infixish")
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
    ne $I10, -1, rxscan990_done
    goto rxscan990_scan
  rxscan990_loop:
    ($P10) = rx987_cur."from"()
    inc $P10
    set rx987_pos, $P10
    ge rx987_pos, rx987_eos, rxscan990_done
  rxscan990_scan:
    set_addr $I10, rxscan990_loop
    rx987_cur."!mark_push"(0, rx987_pos, $I10)
  rxscan990_done:
.annotate 'line', 465
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."infixstopper"()
    if $P10, rx987_fail
  # rx subrule "infix" subtype=capture negate=
    rx987_cur."!cursor_pos"(rx987_pos)
    $P10 = rx987_cur."infix"()
    unless $P10, rx987_fail
    rx987_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx987_pos = $P10."pos"()
  # rx pass
    rx987_cur."!cursor_pass"(rx987_pos, "infixish")
    rx987_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx987_pos)
    .return (rx987_cur)
  rx987_fail:
.annotate 'line', 446
    (rx987_rep, rx987_pos, $I10, $P10) = rx987_cur."!mark_fail"(0)
    lt rx987_pos, -1, rx987_done
    eq rx987_pos, -1, rx987_fail
    jump $I10
  rx987_done:
    rx987_cur."!cursor_fail"()
    rx987_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx987_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("239_1275811487.95429") :method
.annotate 'line', 446
    new $P989, "ResizablePMCArray"
    push $P989, ""
    .return ($P989)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("240_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx992_tgt
    .local int rx992_pos
    .local int rx992_off
    .local int rx992_eos
    .local int rx992_rep
    .local pmc rx992_cur
    (rx992_cur, rx992_pos, rx992_tgt) = self."!cursor_start"()
    rx992_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx992_cur
    .local pmc match
    .lex "$/", match
    length rx992_eos, rx992_tgt
    gt rx992_pos, rx992_eos, rx992_done
    set rx992_off, 0
    lt rx992_pos, 2, rx992_start
    sub rx992_off, rx992_pos, 1
    substr rx992_tgt, rx992_tgt, rx992_off
  rx992_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan995_done
    goto rxscan995_scan
  rxscan995_loop:
    ($P10) = rx992_cur."from"()
    inc $P10
    set rx992_pos, $P10
    ge rx992_pos, rx992_eos, rxscan995_done
  rxscan995_scan:
    set_addr $I10, rxscan995_loop
    rx992_cur."!mark_push"(0, rx992_pos, $I10)
  rxscan995_done:
.annotate 'line', 466
  # rx subrule "lambda" subtype=zerowidth negate=
    rx992_cur."!cursor_pos"(rx992_pos)
    $P10 = rx992_cur."lambda"()
    unless $P10, rx992_fail
  # rx pass
    rx992_cur."!cursor_pass"(rx992_pos, "infixstopper")
    rx992_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx992_pos)
    .return (rx992_cur)
  rx992_fail:
.annotate 'line', 446
    (rx992_rep, rx992_pos, $I10, $P10) = rx992_cur."!mark_fail"(0)
    lt rx992_pos, -1, rx992_done
    eq rx992_pos, -1, rx992_fail
    jump $I10
  rx992_done:
    rx992_cur."!cursor_fail"()
    rx992_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx992_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("241_1275811487.95429") :method
.annotate 'line', 446
    new $P994, "ResizablePMCArray"
    push $P994, ""
    .return ($P994)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("242_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx997_tgt
    .local int rx997_pos
    .local int rx997_off
    .local int rx997_eos
    .local int rx997_rep
    .local pmc rx997_cur
    (rx997_cur, rx997_pos, rx997_tgt) = self."!cursor_start"()
    rx997_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx997_cur
    .local pmc match
    .lex "$/", match
    length rx997_eos, rx997_tgt
    gt rx997_pos, rx997_eos, rx997_done
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
.annotate 'line', 469
  # rx literal  "["
    add $I11, rx997_pos, 1
    gt $I11, rx997_eos, rx997_fail
    sub $I11, rx997_pos, rx997_off
    substr $S10, rx997_tgt, $I11, 1
    ne $S10, "[", rx997_fail
    add rx997_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx997_cur."!cursor_pos"(rx997_pos)
    $P10 = rx997_cur."ws"()
    unless $P10, rx997_fail
    rx997_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx997_cur."!cursor_pos"(rx997_pos)
    $P10 = rx997_cur."EXPR"()
    unless $P10, rx997_fail
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx997_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx997_pos, 1
    gt $I11, rx997_eos, rx997_fail
    sub $I11, rx997_pos, rx997_off
    substr $S10, rx997_tgt, $I11, 1
    ne $S10, "]", rx997_fail
    add rx997_pos, 1
.annotate 'line', 470
  # rx subrule "O" subtype=capture negate=
    rx997_cur."!cursor_pos"(rx997_pos)
    $P10 = rx997_cur."O"("%methodop")
    unless $P10, rx997_fail
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx997_pos = $P10."pos"()
.annotate 'line', 468
  # rx pass
    rx997_cur."!cursor_pass"(rx997_pos, "postcircumfix:sym<[ ]>")
    rx997_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx997_pos)
    .return (rx997_cur)
  rx997_fail:
.annotate 'line', 446
    (rx997_rep, rx997_pos, $I10, $P10) = rx997_cur."!mark_fail"(0)
    lt rx997_pos, -1, rx997_done
    eq rx997_pos, -1, rx997_fail
    jump $I10
  rx997_done:
    rx997_cur."!cursor_fail"()
    rx997_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx997_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("243_1275811487.95429") :method
.annotate 'line', 446
    $P999 = self."!PREFIX__!subrule"("ws", "[")
    new $P1000, "ResizablePMCArray"
    push $P1000, $P999
    .return ($P1000)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("244_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1003_tgt
    .local int rx1003_pos
    .local int rx1003_off
    .local int rx1003_eos
    .local int rx1003_rep
    .local pmc rx1003_cur
    (rx1003_cur, rx1003_pos, rx1003_tgt) = self."!cursor_start"()
    rx1003_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1003_cur
    .local pmc match
    .lex "$/", match
    length rx1003_eos, rx1003_tgt
    gt rx1003_pos, rx1003_eos, rx1003_done
    set rx1003_off, 0
    lt rx1003_pos, 2, rx1003_start
    sub rx1003_off, rx1003_pos, 1
    substr rx1003_tgt, rx1003_tgt, rx1003_off
  rx1003_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1007_done
    goto rxscan1007_scan
  rxscan1007_loop:
    ($P10) = rx1003_cur."from"()
    inc $P10
    set rx1003_pos, $P10
    ge rx1003_pos, rx1003_eos, rxscan1007_done
  rxscan1007_scan:
    set_addr $I10, rxscan1007_loop
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  rxscan1007_done:
.annotate 'line', 474
  # rx literal  "{"
    add $I11, rx1003_pos, 1
    gt $I11, rx1003_eos, rx1003_fail
    sub $I11, rx1003_pos, rx1003_off
    substr $S10, rx1003_tgt, $I11, 1
    ne $S10, "{", rx1003_fail
    add rx1003_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."ws"()
    unless $P10, rx1003_fail
    rx1003_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."EXPR"()
    unless $P10, rx1003_fail
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1003_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1003_pos, 1
    gt $I11, rx1003_eos, rx1003_fail
    sub $I11, rx1003_pos, rx1003_off
    substr $S10, rx1003_tgt, $I11, 1
    ne $S10, "}", rx1003_fail
    add rx1003_pos, 1
.annotate 'line', 475
  # rx subrule "O" subtype=capture negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."O"("%methodop")
    unless $P10, rx1003_fail
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1003_pos = $P10."pos"()
.annotate 'line', 473
  # rx pass
    rx1003_cur."!cursor_pass"(rx1003_pos, "postcircumfix:sym<{ }>")
    rx1003_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx1003_pos)
    .return (rx1003_cur)
  rx1003_fail:
.annotate 'line', 446
    (rx1003_rep, rx1003_pos, $I10, $P10) = rx1003_cur."!mark_fail"(0)
    lt rx1003_pos, -1, rx1003_done
    eq rx1003_pos, -1, rx1003_fail
    jump $I10
  rx1003_done:
    rx1003_cur."!cursor_fail"()
    rx1003_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx1003_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("245_1275811487.95429") :method
.annotate 'line', 446
    $P1005 = self."!PREFIX__!subrule"("ws", "{")
    new $P1006, "ResizablePMCArray"
    push $P1006, $P1005
    .return ($P1006)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("246_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    (rx1009_cur, rx1009_pos, rx1009_tgt) = self."!cursor_start"()
    rx1009_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
.annotate 'line', 479
  # rx enumcharlist negate=0 zerowidth
    ge rx1009_pos, rx1009_eos, rx1009_fail
    sub $I10, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1009_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."quote_EXPR"(":q")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1009_pos = $P10."pos"()
.annotate 'line', 480
  # rx subrule "O" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."O"("%methodop")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
.annotate 'line', 478
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "postcircumfix:sym<ang>")
    rx1009_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx1009_pos)
    .return (rx1009_cur)
  rx1009_fail:
.annotate 'line', 446
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    rx1009_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("247_1275811487.95429") :method
.annotate 'line', 446
    new $P1011, "ResizablePMCArray"
    push $P1011, "<"
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("248_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1014_tgt
    .local int rx1014_pos
    .local int rx1014_off
    .local int rx1014_eos
    .local int rx1014_rep
    .local pmc rx1014_cur
    (rx1014_cur, rx1014_pos, rx1014_tgt) = self."!cursor_start"()
    rx1014_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx1014_cur
    .local pmc match
    .lex "$/", match
    length rx1014_eos, rx1014_tgt
    gt rx1014_pos, rx1014_eos, rx1014_done
    set rx1014_off, 0
    lt rx1014_pos, 2, rx1014_start
    sub rx1014_off, rx1014_pos, 1
    substr rx1014_tgt, rx1014_tgt, rx1014_off
  rx1014_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1018_done
    goto rxscan1018_scan
  rxscan1018_loop:
    ($P10) = rx1014_cur."from"()
    inc $P10
    set rx1014_pos, $P10
    ge rx1014_pos, rx1014_eos, rxscan1018_done
  rxscan1018_scan:
    set_addr $I10, rxscan1018_loop
    rx1014_cur."!mark_push"(0, rx1014_pos, $I10)
  rxscan1018_done:
.annotate 'line', 484
  # rx literal  "("
    add $I11, rx1014_pos, 1
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 1
    ne $S10, "(", rx1014_fail
    add rx1014_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."ws"()
    unless $P10, rx1014_fail
    rx1014_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."arglist"()
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1014_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1014_pos, 1
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 1
    ne $S10, ")", rx1014_fail
    add rx1014_pos, 1
.annotate 'line', 485
  # rx subrule "O" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."O"("%methodop")
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1014_pos = $P10."pos"()
.annotate 'line', 483
  # rx pass
    rx1014_cur."!cursor_pass"(rx1014_pos, "postcircumfix:sym<( )>")
    rx1014_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx1014_pos)
    .return (rx1014_cur)
  rx1014_fail:
.annotate 'line', 446
    (rx1014_rep, rx1014_pos, $I10, $P10) = rx1014_cur."!mark_fail"(0)
    lt rx1014_pos, -1, rx1014_done
    eq rx1014_pos, -1, rx1014_fail
    jump $I10
  rx1014_done:
    rx1014_cur."!cursor_fail"()
    rx1014_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx1014_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("249_1275811487.95429") :method
.annotate 'line', 446
    $P1016 = self."!PREFIX__!subrule"("ws", "(")
    new $P1017, "ResizablePMCArray"
    push $P1017, $P1016
    .return ($P1017)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("250_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx1020_cur
    .local pmc match
    .lex "$/", match
    length rx1020_eos, rx1020_tgt
    gt rx1020_pos, rx1020_eos, rx1020_done
    set rx1020_off, 0
    lt rx1020_pos, 2, rx1020_start
    sub rx1020_off, rx1020_pos, 1
    substr rx1020_tgt, rx1020_tgt, rx1020_off
  rx1020_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1024_done
    goto rxscan1024_scan
  rxscan1024_loop:
    ($P10) = rx1020_cur."from"()
    inc $P10
    set rx1020_pos, $P10
    ge rx1020_pos, rx1020_eos, rxscan1024_done
  rxscan1024_scan:
    set_addr $I10, rxscan1024_loop
    rx1020_cur."!mark_push"(0, rx1020_pos, $I10)
  rxscan1024_done:
.annotate 'line', 488
  # rx subrule "dotty" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."dotty"()
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1020_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."O"("%methodop")
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1020_pos = $P10."pos"()
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "postfix:sym<.>")
    rx1020_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
.annotate 'line', 446
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("251_1275811487.95429") :method
.annotate 'line', 446
    $P1022 = self."!PREFIX__!subrule"("dotty", "")
    new $P1023, "ResizablePMCArray"
    push $P1023, $P1022
    .return ($P1023)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("252_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1026_tgt
    .local int rx1026_pos
    .local int rx1026_off
    .local int rx1026_eos
    .local int rx1026_rep
    .local pmc rx1026_cur
    (rx1026_cur, rx1026_pos, rx1026_tgt) = self."!cursor_start"()
    rx1026_cur."!cursor_debug"("START ", "prefix:sym<++>")
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
.annotate 'line', 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1031_fail
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  # rx literal  "++"
    add $I11, rx1026_pos, 2
    gt $I11, rx1026_eos, rx1026_fail
    sub $I11, rx1026_pos, rx1026_off
    substr $S10, rx1026_tgt, $I11, 2
    ne $S10, "++", rx1026_fail
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
    $P10 = rx1026_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1026_fail
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1026_pos = $P10."pos"()
  # rx pass
    rx1026_cur."!cursor_pass"(rx1026_pos, "prefix:sym<++>")
    rx1026_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx1026_pos)
    .return (rx1026_cur)
  rx1026_fail:
.annotate 'line', 446
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    rx1026_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx1026_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("253_1275811487.95429") :method
.annotate 'line', 446
    $P1028 = self."!PREFIX__!subrule"("O", "++")
    new $P1029, "ResizablePMCArray"
    push $P1029, $P1028
    .return ($P1029)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("254_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1033_tgt
    .local int rx1033_pos
    .local int rx1033_off
    .local int rx1033_eos
    .local int rx1033_rep
    .local pmc rx1033_cur
    (rx1033_cur, rx1033_pos, rx1033_tgt) = self."!cursor_start"()
    rx1033_cur."!cursor_debug"("START ", "prefix:sym<-->")
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
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1038_fail
    rx1033_cur."!mark_push"(0, rx1033_pos, $I10)
  # rx literal  "--"
    add $I11, rx1033_pos, 2
    gt $I11, rx1033_eos, rx1033_fail
    sub $I11, rx1033_pos, rx1033_off
    substr $S10, rx1033_tgt, $I11, 2
    ne $S10, "--", rx1033_fail
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
    $P10 = rx1033_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1033_fail
    rx1033_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1033_pos = $P10."pos"()
  # rx pass
    rx1033_cur."!cursor_pass"(rx1033_pos, "prefix:sym<-->")
    rx1033_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx1033_pos)
    .return (rx1033_cur)
  rx1033_fail:
.annotate 'line', 446
    (rx1033_rep, rx1033_pos, $I10, $P10) = rx1033_cur."!mark_fail"(0)
    lt rx1033_pos, -1, rx1033_done
    eq rx1033_pos, -1, rx1033_fail
    jump $I10
  rx1033_done:
    rx1033_cur."!cursor_fail"()
    rx1033_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx1033_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("255_1275811487.95429") :method
.annotate 'line', 446
    $P1035 = self."!PREFIX__!subrule"("O", "--")
    new $P1036, "ResizablePMCArray"
    push $P1036, $P1035
    .return ($P1036)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("256_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1040_tgt
    .local int rx1040_pos
    .local int rx1040_off
    .local int rx1040_eos
    .local int rx1040_rep
    .local pmc rx1040_cur
    (rx1040_cur, rx1040_pos, rx1040_tgt) = self."!cursor_start"()
    rx1040_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
.annotate 'line', 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1045_fail
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  # rx literal  "++"
    add $I11, rx1040_pos, 2
    gt $I11, rx1040_eos, rx1040_fail
    sub $I11, rx1040_pos, rx1040_off
    substr $S10, rx1040_tgt, $I11, 2
    ne $S10, "++", rx1040_fail
    add rx1040_pos, 2
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
    $P10 = rx1040_cur."O"("%autoincrement")
    unless $P10, rx1040_fail
    rx1040_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1040_pos = $P10."pos"()
  # rx pass
    rx1040_cur."!cursor_pass"(rx1040_pos, "postfix:sym<++>")
    rx1040_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx1040_pos)
    .return (rx1040_cur)
  rx1040_fail:
.annotate 'line', 446
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    rx1040_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("257_1275811487.95429") :method
.annotate 'line', 446
    $P1042 = self."!PREFIX__!subrule"("O", "++")
    new $P1043, "ResizablePMCArray"
    push $P1043, $P1042
    .return ($P1043)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("258_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1047_tgt
    .local int rx1047_pos
    .local int rx1047_off
    .local int rx1047_eos
    .local int rx1047_rep
    .local pmc rx1047_cur
    (rx1047_cur, rx1047_pos, rx1047_tgt) = self."!cursor_start"()
    rx1047_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1052_fail
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "--"
    add $I11, rx1047_pos, 2
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    substr $S10, rx1047_tgt, $I11, 2
    ne $S10, "--", rx1047_fail
    add rx1047_pos, 2
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
    $P10 = rx1047_cur."O"("%autoincrement")
    unless $P10, rx1047_fail
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1047_pos = $P10."pos"()
  # rx pass
    rx1047_cur."!cursor_pass"(rx1047_pos, "postfix:sym<-->")
    rx1047_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1047_pos)
    .return (rx1047_cur)
  rx1047_fail:
.annotate 'line', 446
    (rx1047_rep, rx1047_pos, $I10, $P10) = rx1047_cur."!mark_fail"(0)
    lt rx1047_pos, -1, rx1047_done
    eq rx1047_pos, -1, rx1047_fail
    jump $I10
  rx1047_done:
    rx1047_cur."!cursor_fail"()
    rx1047_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1047_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("259_1275811487.95429") :method
.annotate 'line', 446
    $P1049 = self."!PREFIX__!subrule"("O", "--")
    new $P1050, "ResizablePMCArray"
    push $P1050, $P1049
    .return ($P1050)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("260_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1054_tgt
    .local int rx1054_pos
    .local int rx1054_off
    .local int rx1054_eos
    .local int rx1054_rep
    .local pmc rx1054_cur
    (rx1054_cur, rx1054_pos, rx1054_tgt) = self."!cursor_start"()
    rx1054_cur."!cursor_debug"("START ", "infix:sym<**>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1058_done
    goto rxscan1058_scan
  rxscan1058_loop:
    ($P10) = rx1054_cur."from"()
    inc $P10
    set rx1054_pos, $P10
    ge rx1054_pos, rx1054_eos, rxscan1058_done
  rxscan1058_scan:
    set_addr $I10, rxscan1058_loop
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  rxscan1058_done:
.annotate 'line', 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1059_fail
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  # rx literal  "**"
    add $I11, rx1054_pos, 2
    gt $I11, rx1054_eos, rx1054_fail
    sub $I11, rx1054_pos, rx1054_off
    substr $S10, rx1054_tgt, $I11, 2
    ne $S10, "**", rx1054_fail
    add rx1054_pos, 2
    set_addr $I10, rxcap_1059_fail
    ($I12, $I11) = rx1054_cur."!mark_peek"($I10)
    rx1054_cur."!cursor_pos"($I11)
    ($P10) = rx1054_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1054_pos, "")
    rx1054_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1059_done
  rxcap_1059_fail:
    goto rx1054_fail
  rxcap_1059_done:
  # rx subrule "O" subtype=capture negate=
    rx1054_cur."!cursor_pos"(rx1054_pos)
    $P10 = rx1054_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1054_fail
    rx1054_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1054_pos = $P10."pos"()
  # rx pass
    rx1054_cur."!cursor_pass"(rx1054_pos, "infix:sym<**>")
    rx1054_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1054_pos)
    .return (rx1054_cur)
  rx1054_fail:
.annotate 'line', 446
    (rx1054_rep, rx1054_pos, $I10, $P10) = rx1054_cur."!mark_fail"(0)
    lt rx1054_pos, -1, rx1054_done
    eq rx1054_pos, -1, rx1054_fail
    jump $I10
  rx1054_done:
    rx1054_cur."!cursor_fail"()
    rx1054_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1054_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("261_1275811487.95429") :method
.annotate 'line', 446
    $P1056 = self."!PREFIX__!subrule"("O", "**")
    new $P1057, "ResizablePMCArray"
    push $P1057, $P1056
    .return ($P1057)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("262_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1061_tgt
    .local int rx1061_pos
    .local int rx1061_off
    .local int rx1061_eos
    .local int rx1061_rep
    .local pmc rx1061_cur
    (rx1061_cur, rx1061_pos, rx1061_tgt) = self."!cursor_start"()
    rx1061_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx1061_cur
    .local pmc match
    .lex "$/", match
    length rx1061_eos, rx1061_tgt
    gt rx1061_pos, rx1061_eos, rx1061_done
    set rx1061_off, 0
    lt rx1061_pos, 2, rx1061_start
    sub rx1061_off, rx1061_pos, 1
    substr rx1061_tgt, rx1061_tgt, rx1061_off
  rx1061_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1065_done
    goto rxscan1065_scan
  rxscan1065_loop:
    ($P10) = rx1061_cur."from"()
    inc $P10
    set rx1061_pos, $P10
    ge rx1061_pos, rx1061_eos, rxscan1065_done
  rxscan1065_scan:
    set_addr $I10, rxscan1065_loop
    rx1061_cur."!mark_push"(0, rx1061_pos, $I10)
  rxscan1065_done:
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1066_fail
    rx1061_cur."!mark_push"(0, rx1061_pos, $I10)
  # rx literal  "+"
    add $I11, rx1061_pos, 1
    gt $I11, rx1061_eos, rx1061_fail
    sub $I11, rx1061_pos, rx1061_off
    substr $S10, rx1061_tgt, $I11, 1
    ne $S10, "+", rx1061_fail
    add rx1061_pos, 1
    set_addr $I10, rxcap_1066_fail
    ($I12, $I11) = rx1061_cur."!mark_peek"($I10)
    rx1061_cur."!cursor_pos"($I11)
    ($P10) = rx1061_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1061_pos, "")
    rx1061_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1066_done
  rxcap_1066_fail:
    goto rx1061_fail
  rxcap_1066_done:
  # rx subrule "O" subtype=capture negate=
    rx1061_cur."!cursor_pos"(rx1061_pos)
    $P10 = rx1061_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1061_fail
    rx1061_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1061_pos = $P10."pos"()
  # rx pass
    rx1061_cur."!cursor_pass"(rx1061_pos, "prefix:sym<+>")
    rx1061_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1061_pos)
    .return (rx1061_cur)
  rx1061_fail:
.annotate 'line', 446
    (rx1061_rep, rx1061_pos, $I10, $P10) = rx1061_cur."!mark_fail"(0)
    lt rx1061_pos, -1, rx1061_done
    eq rx1061_pos, -1, rx1061_fail
    jump $I10
  rx1061_done:
    rx1061_cur."!cursor_fail"()
    rx1061_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1061_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("263_1275811487.95429") :method
.annotate 'line', 446
    $P1063 = self."!PREFIX__!subrule"("O", "+")
    new $P1064, "ResizablePMCArray"
    push $P1064, $P1063
    .return ($P1064)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("264_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1068_tgt
    .local int rx1068_pos
    .local int rx1068_off
    .local int rx1068_eos
    .local int rx1068_rep
    .local pmc rx1068_cur
    (rx1068_cur, rx1068_pos, rx1068_tgt) = self."!cursor_start"()
    rx1068_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx1068_cur
    .local pmc match
    .lex "$/", match
    length rx1068_eos, rx1068_tgt
    gt rx1068_pos, rx1068_eos, rx1068_done
    set rx1068_off, 0
    lt rx1068_pos, 2, rx1068_start
    sub rx1068_off, rx1068_pos, 1
    substr rx1068_tgt, rx1068_tgt, rx1068_off
  rx1068_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1072_done
    goto rxscan1072_scan
  rxscan1072_loop:
    ($P10) = rx1068_cur."from"()
    inc $P10
    set rx1068_pos, $P10
    ge rx1068_pos, rx1068_eos, rxscan1072_done
  rxscan1072_scan:
    set_addr $I10, rxscan1072_loop
    rx1068_cur."!mark_push"(0, rx1068_pos, $I10)
  rxscan1072_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1073_fail
    rx1068_cur."!mark_push"(0, rx1068_pos, $I10)
  # rx literal  "~"
    add $I11, rx1068_pos, 1
    gt $I11, rx1068_eos, rx1068_fail
    sub $I11, rx1068_pos, rx1068_off
    substr $S10, rx1068_tgt, $I11, 1
    ne $S10, "~", rx1068_fail
    add rx1068_pos, 1
    set_addr $I10, rxcap_1073_fail
    ($I12, $I11) = rx1068_cur."!mark_peek"($I10)
    rx1068_cur."!cursor_pos"($I11)
    ($P10) = rx1068_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1068_pos, "")
    rx1068_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1073_done
  rxcap_1073_fail:
    goto rx1068_fail
  rxcap_1073_done:
  # rx subrule "O" subtype=capture negate=
    rx1068_cur."!cursor_pos"(rx1068_pos)
    $P10 = rx1068_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1068_fail
    rx1068_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1068_pos = $P10."pos"()
  # rx pass
    rx1068_cur."!cursor_pass"(rx1068_pos, "prefix:sym<~>")
    rx1068_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1068_pos)
    .return (rx1068_cur)
  rx1068_fail:
.annotate 'line', 446
    (rx1068_rep, rx1068_pos, $I10, $P10) = rx1068_cur."!mark_fail"(0)
    lt rx1068_pos, -1, rx1068_done
    eq rx1068_pos, -1, rx1068_fail
    jump $I10
  rx1068_done:
    rx1068_cur."!cursor_fail"()
    rx1068_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1068_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("265_1275811487.95429") :method
.annotate 'line', 446
    $P1070 = self."!PREFIX__!subrule"("O", "~")
    new $P1071, "ResizablePMCArray"
    push $P1071, $P1070
    .return ($P1071)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("266_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1075_tgt
    .local int rx1075_pos
    .local int rx1075_off
    .local int rx1075_eos
    .local int rx1075_rep
    .local pmc rx1075_cur
    (rx1075_cur, rx1075_pos, rx1075_tgt) = self."!cursor_start"()
    rx1075_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx1075_cur
    .local pmc match
    .lex "$/", match
    length rx1075_eos, rx1075_tgt
    gt rx1075_pos, rx1075_eos, rx1075_done
    set rx1075_off, 0
    lt rx1075_pos, 2, rx1075_start
    sub rx1075_off, rx1075_pos, 1
    substr rx1075_tgt, rx1075_tgt, rx1075_off
  rx1075_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1078_done
    goto rxscan1078_scan
  rxscan1078_loop:
    ($P10) = rx1075_cur."from"()
    inc $P10
    set rx1075_pos, $P10
    ge rx1075_pos, rx1075_eos, rxscan1078_done
  rxscan1078_scan:
    set_addr $I10, rxscan1078_loop
    rx1075_cur."!mark_push"(0, rx1075_pos, $I10)
  rxscan1078_done:
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1079_fail
    rx1075_cur."!mark_push"(0, rx1075_pos, $I10)
  # rx literal  "-"
    add $I11, rx1075_pos, 1
    gt $I11, rx1075_eos, rx1075_fail
    sub $I11, rx1075_pos, rx1075_off
    substr $S10, rx1075_tgt, $I11, 1
    ne $S10, "-", rx1075_fail
    add rx1075_pos, 1
    set_addr $I10, rxcap_1079_fail
    ($I12, $I11) = rx1075_cur."!mark_peek"($I10)
    rx1075_cur."!cursor_pos"($I11)
    ($P10) = rx1075_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1075_pos, "")
    rx1075_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1079_done
  rxcap_1079_fail:
    goto rx1075_fail
  rxcap_1079_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1075_pos, rx1075_eos, rx1075_fail
    sub $I10, rx1075_pos, rx1075_off
    substr $S10, rx1075_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1075_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1075_cur."!cursor_pos"(rx1075_pos)
    $P10 = rx1075_cur."number"()
    if $P10, rx1075_fail
  # rx subrule "O" subtype=capture negate=
    rx1075_cur."!cursor_pos"(rx1075_pos)
    $P10 = rx1075_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1075_fail
    rx1075_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1075_pos = $P10."pos"()
  # rx pass
    rx1075_cur."!cursor_pass"(rx1075_pos, "prefix:sym<->")
    rx1075_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1075_pos)
    .return (rx1075_cur)
  rx1075_fail:
.annotate 'line', 446
    (rx1075_rep, rx1075_pos, $I10, $P10) = rx1075_cur."!mark_fail"(0)
    lt rx1075_pos, -1, rx1075_done
    eq rx1075_pos, -1, rx1075_fail
    jump $I10
  rx1075_done:
    rx1075_cur."!cursor_fail"()
    rx1075_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1075_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("267_1275811487.95429") :method
.annotate 'line', 446
    new $P1077, "ResizablePMCArray"
    push $P1077, "-"
    .return ($P1077)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("268_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1081_tgt
    .local int rx1081_pos
    .local int rx1081_off
    .local int rx1081_eos
    .local int rx1081_rep
    .local pmc rx1081_cur
    (rx1081_cur, rx1081_pos, rx1081_tgt) = self."!cursor_start"()
    rx1081_cur."!cursor_debug"("START ", "prefix:sym<?>")
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
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1086_fail
    rx1081_cur."!mark_push"(0, rx1081_pos, $I10)
  # rx literal  "?"
    add $I11, rx1081_pos, 1
    gt $I11, rx1081_eos, rx1081_fail
    sub $I11, rx1081_pos, rx1081_off
    substr $S10, rx1081_tgt, $I11, 1
    ne $S10, "?", rx1081_fail
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
    $P10 = rx1081_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1081_fail
    rx1081_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1081_pos = $P10."pos"()
  # rx pass
    rx1081_cur."!cursor_pass"(rx1081_pos, "prefix:sym<?>")
    rx1081_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1081_pos)
    .return (rx1081_cur)
  rx1081_fail:
.annotate 'line', 446
    (rx1081_rep, rx1081_pos, $I10, $P10) = rx1081_cur."!mark_fail"(0)
    lt rx1081_pos, -1, rx1081_done
    eq rx1081_pos, -1, rx1081_fail
    jump $I10
  rx1081_done:
    rx1081_cur."!cursor_fail"()
    rx1081_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1081_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("269_1275811487.95429") :method
.annotate 'line', 446
    $P1083 = self."!PREFIX__!subrule"("O", "?")
    new $P1084, "ResizablePMCArray"
    push $P1084, $P1083
    .return ($P1084)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("270_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1088_tgt
    .local int rx1088_pos
    .local int rx1088_off
    .local int rx1088_eos
    .local int rx1088_rep
    .local pmc rx1088_cur
    (rx1088_cur, rx1088_pos, rx1088_tgt) = self."!cursor_start"()
    rx1088_cur."!cursor_debug"("START ", "prefix:sym<!>")
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1093_fail
    rx1088_cur."!mark_push"(0, rx1088_pos, $I10)
  # rx literal  "!"
    add $I11, rx1088_pos, 1
    gt $I11, rx1088_eos, rx1088_fail
    sub $I11, rx1088_pos, rx1088_off
    substr $S10, rx1088_tgt, $I11, 1
    ne $S10, "!", rx1088_fail
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
    $P10 = rx1088_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1088_fail
    rx1088_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1088_pos = $P10."pos"()
  # rx pass
    rx1088_cur."!cursor_pass"(rx1088_pos, "prefix:sym<!>")
    rx1088_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1088_pos)
    .return (rx1088_cur)
  rx1088_fail:
.annotate 'line', 446
    (rx1088_rep, rx1088_pos, $I10, $P10) = rx1088_cur."!mark_fail"(0)
    lt rx1088_pos, -1, rx1088_done
    eq rx1088_pos, -1, rx1088_fail
    jump $I10
  rx1088_done:
    rx1088_cur."!cursor_fail"()
    rx1088_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1088_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("271_1275811487.95429") :method
.annotate 'line', 446
    $P1090 = self."!PREFIX__!subrule"("O", "!")
    new $P1091, "ResizablePMCArray"
    push $P1091, $P1090
    .return ($P1091)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("272_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1095_tgt
    .local int rx1095_pos
    .local int rx1095_off
    .local int rx1095_eos
    .local int rx1095_rep
    .local pmc rx1095_cur
    (rx1095_cur, rx1095_pos, rx1095_tgt) = self."!cursor_start"()
    rx1095_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1100_fail
    rx1095_cur."!mark_push"(0, rx1095_pos, $I10)
  # rx literal  "|"
    add $I11, rx1095_pos, 1
    gt $I11, rx1095_eos, rx1095_fail
    sub $I11, rx1095_pos, rx1095_off
    substr $S10, rx1095_tgt, $I11, 1
    ne $S10, "|", rx1095_fail
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
    $P10 = rx1095_cur."O"("%symbolic_unary")
    unless $P10, rx1095_fail
    rx1095_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1095_pos = $P10."pos"()
  # rx pass
    rx1095_cur."!cursor_pass"(rx1095_pos, "prefix:sym<|>")
    rx1095_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1095_pos)
    .return (rx1095_cur)
  rx1095_fail:
.annotate 'line', 446
    (rx1095_rep, rx1095_pos, $I10, $P10) = rx1095_cur."!mark_fail"(0)
    lt rx1095_pos, -1, rx1095_done
    eq rx1095_pos, -1, rx1095_fail
    jump $I10
  rx1095_done:
    rx1095_cur."!cursor_fail"()
    rx1095_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1095_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("273_1275811487.95429") :method
.annotate 'line', 446
    $P1097 = self."!PREFIX__!subrule"("O", "|")
    new $P1098, "ResizablePMCArray"
    push $P1098, $P1097
    .return ($P1098)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("274_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1102_tgt
    .local int rx1102_pos
    .local int rx1102_off
    .local int rx1102_eos
    .local int rx1102_rep
    .local pmc rx1102_cur
    (rx1102_cur, rx1102_pos, rx1102_tgt) = self."!cursor_start"()
    rx1102_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1107_fail
    rx1102_cur."!mark_push"(0, rx1102_pos, $I10)
  # rx literal  "*"
    add $I11, rx1102_pos, 1
    gt $I11, rx1102_eos, rx1102_fail
    sub $I11, rx1102_pos, rx1102_off
    substr $S10, rx1102_tgt, $I11, 1
    ne $S10, "*", rx1102_fail
    add rx1102_pos, 1
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
    $P10 = rx1102_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1102_fail
    rx1102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1102_pos = $P10."pos"()
  # rx pass
    rx1102_cur."!cursor_pass"(rx1102_pos, "infix:sym<*>")
    rx1102_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1102_pos)
    .return (rx1102_cur)
  rx1102_fail:
.annotate 'line', 446
    (rx1102_rep, rx1102_pos, $I10, $P10) = rx1102_cur."!mark_fail"(0)
    lt rx1102_pos, -1, rx1102_done
    eq rx1102_pos, -1, rx1102_fail
    jump $I10
  rx1102_done:
    rx1102_cur."!cursor_fail"()
    rx1102_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1102_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("275_1275811487.95429") :method
.annotate 'line', 446
    $P1104 = self."!PREFIX__!subrule"("O", "*")
    new $P1105, "ResizablePMCArray"
    push $P1105, $P1104
    .return ($P1105)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("276_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1109_tgt
    .local int rx1109_pos
    .local int rx1109_off
    .local int rx1109_eos
    .local int rx1109_rep
    .local pmc rx1109_cur
    (rx1109_cur, rx1109_pos, rx1109_tgt) = self."!cursor_start"()
    rx1109_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1114_fail
    rx1109_cur."!mark_push"(0, rx1109_pos, $I10)
  # rx literal  "/"
    add $I11, rx1109_pos, 1
    gt $I11, rx1109_eos, rx1109_fail
    sub $I11, rx1109_pos, rx1109_off
    substr $S10, rx1109_tgt, $I11, 1
    ne $S10, "/", rx1109_fail
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
    $P10 = rx1109_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1109_fail
    rx1109_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1109_pos = $P10."pos"()
  # rx pass
    rx1109_cur."!cursor_pass"(rx1109_pos, "infix:sym</>")
    rx1109_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1109_pos)
    .return (rx1109_cur)
  rx1109_fail:
.annotate 'line', 446
    (rx1109_rep, rx1109_pos, $I10, $P10) = rx1109_cur."!mark_fail"(0)
    lt rx1109_pos, -1, rx1109_done
    eq rx1109_pos, -1, rx1109_fail
    jump $I10
  rx1109_done:
    rx1109_cur."!cursor_fail"()
    rx1109_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1109_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("277_1275811487.95429") :method
.annotate 'line', 446
    $P1111 = self."!PREFIX__!subrule"("O", "/")
    new $P1112, "ResizablePMCArray"
    push $P1112, $P1111
    .return ($P1112)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("278_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1116_tgt
    .local int rx1116_pos
    .local int rx1116_off
    .local int rx1116_eos
    .local int rx1116_rep
    .local pmc rx1116_cur
    (rx1116_cur, rx1116_pos, rx1116_tgt) = self."!cursor_start"()
    rx1116_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1121_fail
    rx1116_cur."!mark_push"(0, rx1116_pos, $I10)
  # rx literal  "%"
    add $I11, rx1116_pos, 1
    gt $I11, rx1116_eos, rx1116_fail
    sub $I11, rx1116_pos, rx1116_off
    substr $S10, rx1116_tgt, $I11, 1
    ne $S10, "%", rx1116_fail
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
    $P10 = rx1116_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1116_fail
    rx1116_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1116_pos = $P10."pos"()
  # rx pass
    rx1116_cur."!cursor_pass"(rx1116_pos, "infix:sym<%>")
    rx1116_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1116_pos)
    .return (rx1116_cur)
  rx1116_fail:
.annotate 'line', 446
    (rx1116_rep, rx1116_pos, $I10, $P10) = rx1116_cur."!mark_fail"(0)
    lt rx1116_pos, -1, rx1116_done
    eq rx1116_pos, -1, rx1116_fail
    jump $I10
  rx1116_done:
    rx1116_cur."!cursor_fail"()
    rx1116_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1116_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("279_1275811487.95429") :method
.annotate 'line', 446
    $P1118 = self."!PREFIX__!subrule"("O", "%")
    new $P1119, "ResizablePMCArray"
    push $P1119, $P1118
    .return ($P1119)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("280_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1123_tgt
    .local int rx1123_pos
    .local int rx1123_off
    .local int rx1123_eos
    .local int rx1123_rep
    .local pmc rx1123_cur
    (rx1123_cur, rx1123_pos, rx1123_tgt) = self."!cursor_start"()
    rx1123_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1128_fail
    rx1123_cur."!mark_push"(0, rx1123_pos, $I10)
  # rx literal  "+"
    add $I11, rx1123_pos, 1
    gt $I11, rx1123_eos, rx1123_fail
    sub $I11, rx1123_pos, rx1123_off
    substr $S10, rx1123_tgt, $I11, 1
    ne $S10, "+", rx1123_fail
    add rx1123_pos, 1
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
    $P10 = rx1123_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1123_fail
    rx1123_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1123_pos = $P10."pos"()
  # rx pass
    rx1123_cur."!cursor_pass"(rx1123_pos, "infix:sym<+>")
    rx1123_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1123_pos)
    .return (rx1123_cur)
  rx1123_fail:
.annotate 'line', 446
    (rx1123_rep, rx1123_pos, $I10, $P10) = rx1123_cur."!mark_fail"(0)
    lt rx1123_pos, -1, rx1123_done
    eq rx1123_pos, -1, rx1123_fail
    jump $I10
  rx1123_done:
    rx1123_cur."!cursor_fail"()
    rx1123_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1123_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("281_1275811487.95429") :method
.annotate 'line', 446
    $P1125 = self."!PREFIX__!subrule"("O", "+")
    new $P1126, "ResizablePMCArray"
    push $P1126, $P1125
    .return ($P1126)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("282_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1130_tgt
    .local int rx1130_pos
    .local int rx1130_off
    .local int rx1130_eos
    .local int rx1130_rep
    .local pmc rx1130_cur
    (rx1130_cur, rx1130_pos, rx1130_tgt) = self."!cursor_start"()
    rx1130_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1135_fail
    rx1130_cur."!mark_push"(0, rx1130_pos, $I10)
  # rx literal  "-"
    add $I11, rx1130_pos, 1
    gt $I11, rx1130_eos, rx1130_fail
    sub $I11, rx1130_pos, rx1130_off
    substr $S10, rx1130_tgt, $I11, 1
    ne $S10, "-", rx1130_fail
    add rx1130_pos, 1
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
    $P10 = rx1130_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1130_fail
    rx1130_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1130_pos = $P10."pos"()
  # rx pass
    rx1130_cur."!cursor_pass"(rx1130_pos, "infix:sym<->")
    rx1130_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1130_pos)
    .return (rx1130_cur)
  rx1130_fail:
.annotate 'line', 446
    (rx1130_rep, rx1130_pos, $I10, $P10) = rx1130_cur."!mark_fail"(0)
    lt rx1130_pos, -1, rx1130_done
    eq rx1130_pos, -1, rx1130_fail
    jump $I10
  rx1130_done:
    rx1130_cur."!cursor_fail"()
    rx1130_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1130_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("283_1275811487.95429") :method
.annotate 'line', 446
    $P1132 = self."!PREFIX__!subrule"("O", "-")
    new $P1133, "ResizablePMCArray"
    push $P1133, $P1132
    .return ($P1133)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("284_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1137_tgt
    .local int rx1137_pos
    .local int rx1137_off
    .local int rx1137_eos
    .local int rx1137_rep
    .local pmc rx1137_cur
    (rx1137_cur, rx1137_pos, rx1137_tgt) = self."!cursor_start"()
    rx1137_cur."!cursor_debug"("START ", "infix:sym<~>")
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
.annotate 'line', 513
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
  rx1137_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<~>"  :subid("285_1275811487.95429") :method
.annotate 'line', 446
    $P1139 = self."!PREFIX__!subrule"("O", "~")
    new $P1140, "ResizablePMCArray"
    push $P1140, $P1139
    .return ($P1140)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("286_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1144_tgt
    .local int rx1144_pos
    .local int rx1144_off
    .local int rx1144_eos
    .local int rx1144_rep
    .local pmc rx1144_cur
    (rx1144_cur, rx1144_pos, rx1144_tgt) = self."!cursor_start"()
    rx1144_cur."!cursor_debug"("START ", "infix:sym<==>")
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
.annotate 'line', 515
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
  rx1144_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<==>"  :subid("287_1275811487.95429") :method
.annotate 'line', 446
    $P1146 = self."!PREFIX__!subrule"("O", "==")
    new $P1147, "ResizablePMCArray"
    push $P1147, $P1146
    .return ($P1147)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("288_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1151_tgt
    .local int rx1151_pos
    .local int rx1151_off
    .local int rx1151_eos
    .local int rx1151_rep
    .local pmc rx1151_cur
    (rx1151_cur, rx1151_pos, rx1151_tgt) = self."!cursor_start"()
    rx1151_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
.annotate 'line', 516
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
  rx1151_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<!=>"  :subid("289_1275811487.95429") :method
.annotate 'line', 446
    $P1153 = self."!PREFIX__!subrule"("O", "!=")
    new $P1154, "ResizablePMCArray"
    push $P1154, $P1153
    .return ($P1154)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("290_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1158_tgt
    .local int rx1158_pos
    .local int rx1158_off
    .local int rx1158_eos
    .local int rx1158_rep
    .local pmc rx1158_cur
    (rx1158_cur, rx1158_pos, rx1158_tgt) = self."!cursor_start"()
    rx1158_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
.annotate 'line', 517
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
  rx1158_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<<=>"  :subid("291_1275811487.95429") :method
.annotate 'line', 446
    $P1160 = self."!PREFIX__!subrule"("O", "<=")
    new $P1161, "ResizablePMCArray"
    push $P1161, $P1160
    .return ($P1161)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("292_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1165_tgt
    .local int rx1165_pos
    .local int rx1165_off
    .local int rx1165_eos
    .local int rx1165_rep
    .local pmc rx1165_cur
    (rx1165_cur, rx1165_pos, rx1165_tgt) = self."!cursor_start"()
    rx1165_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
.annotate 'line', 518
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
  rx1165_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<>=>"  :subid("293_1275811487.95429") :method
.annotate 'line', 446
    $P1167 = self."!PREFIX__!subrule"("O", ">=")
    new $P1168, "ResizablePMCArray"
    push $P1168, $P1167
    .return ($P1168)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("294_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    (rx1172_cur, rx1172_pos, rx1172_tgt) = self."!cursor_start"()
    rx1172_cur."!cursor_debug"("START ", "infix:sym<<>")
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
.annotate 'line', 519
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
  rx1172_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<<>"  :subid("295_1275811487.95429") :method
.annotate 'line', 446
    $P1174 = self."!PREFIX__!subrule"("O", "<")
    new $P1175, "ResizablePMCArray"
    push $P1175, $P1174
    .return ($P1175)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("296_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1179_tgt
    .local int rx1179_pos
    .local int rx1179_off
    .local int rx1179_eos
    .local int rx1179_rep
    .local pmc rx1179_cur
    (rx1179_cur, rx1179_pos, rx1179_tgt) = self."!cursor_start"()
    rx1179_cur."!cursor_debug"("START ", "infix:sym<>>")
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
.annotate 'line', 520
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
  rx1179_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<>>"  :subid("297_1275811487.95429") :method
.annotate 'line', 446
    $P1181 = self."!PREFIX__!subrule"("O", ">")
    new $P1182, "ResizablePMCArray"
    push $P1182, $P1181
    .return ($P1182)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("298_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1186_tgt
    .local int rx1186_pos
    .local int rx1186_off
    .local int rx1186_eos
    .local int rx1186_rep
    .local pmc rx1186_cur
    (rx1186_cur, rx1186_pos, rx1186_tgt) = self."!cursor_start"()
    rx1186_cur."!cursor_debug"("START ", "infix:sym<eq>")
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
.annotate 'line', 521
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
  rx1186_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<eq>"  :subid("299_1275811487.95429") :method
.annotate 'line', 446
    $P1188 = self."!PREFIX__!subrule"("O", "eq")
    new $P1189, "ResizablePMCArray"
    push $P1189, $P1188
    .return ($P1189)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("300_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1193_tgt
    .local int rx1193_pos
    .local int rx1193_off
    .local int rx1193_eos
    .local int rx1193_rep
    .local pmc rx1193_cur
    (rx1193_cur, rx1193_pos, rx1193_tgt) = self."!cursor_start"()
    rx1193_cur."!cursor_debug"("START ", "infix:sym<ne>")
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
.annotate 'line', 522
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
  rx1193_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<ne>"  :subid("301_1275811487.95429") :method
.annotate 'line', 446
    $P1195 = self."!PREFIX__!subrule"("O", "ne")
    new $P1196, "ResizablePMCArray"
    push $P1196, $P1195
    .return ($P1196)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("302_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1200_tgt
    .local int rx1200_pos
    .local int rx1200_off
    .local int rx1200_eos
    .local int rx1200_rep
    .local pmc rx1200_cur
    (rx1200_cur, rx1200_pos, rx1200_tgt) = self."!cursor_start"()
    rx1200_cur."!cursor_debug"("START ", "infix:sym<le>")
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
.annotate 'line', 523
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
  rx1200_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<le>"  :subid("303_1275811487.95429") :method
.annotate 'line', 446
    $P1202 = self."!PREFIX__!subrule"("O", "le")
    new $P1203, "ResizablePMCArray"
    push $P1203, $P1202
    .return ($P1203)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("304_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    (rx1207_cur, rx1207_pos, rx1207_tgt) = self."!cursor_start"()
    rx1207_cur."!cursor_debug"("START ", "infix:sym<ge>")
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
.annotate 'line', 524
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
  rx1207_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<ge>"  :subid("305_1275811487.95429") :method
.annotate 'line', 446
    $P1209 = self."!PREFIX__!subrule"("O", "ge")
    new $P1210, "ResizablePMCArray"
    push $P1210, $P1209
    .return ($P1210)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("306_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1214_tgt
    .local int rx1214_pos
    .local int rx1214_off
    .local int rx1214_eos
    .local int rx1214_rep
    .local pmc rx1214_cur
    (rx1214_cur, rx1214_pos, rx1214_tgt) = self."!cursor_start"()
    rx1214_cur."!cursor_debug"("START ", "infix:sym<lt>")
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
.annotate 'line', 525
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
  rx1214_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<lt>"  :subid("307_1275811487.95429") :method
.annotate 'line', 446
    $P1216 = self."!PREFIX__!subrule"("O", "lt")
    new $P1217, "ResizablePMCArray"
    push $P1217, $P1216
    .return ($P1217)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("308_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1221_tgt
    .local int rx1221_pos
    .local int rx1221_off
    .local int rx1221_eos
    .local int rx1221_rep
    .local pmc rx1221_cur
    (rx1221_cur, rx1221_pos, rx1221_tgt) = self."!cursor_start"()
    rx1221_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
.annotate 'line', 526
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
  rx1221_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<gt>"  :subid("309_1275811487.95429") :method
.annotate 'line', 446
    $P1223 = self."!PREFIX__!subrule"("O", "gt")
    new $P1224, "ResizablePMCArray"
    push $P1224, $P1223
    .return ($P1224)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("310_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1228_tgt
    .local int rx1228_pos
    .local int rx1228_off
    .local int rx1228_eos
    .local int rx1228_rep
    .local pmc rx1228_cur
    (rx1228_cur, rx1228_pos, rx1228_tgt) = self."!cursor_start"()
    rx1228_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
.annotate 'line', 527
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
  rx1228_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<=:=>"  :subid("311_1275811487.95429") :method
.annotate 'line', 446
    $P1230 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1231, "ResizablePMCArray"
    push $P1231, $P1230
    .return ($P1231)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("312_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1235_tgt
    .local int rx1235_pos
    .local int rx1235_off
    .local int rx1235_eos
    .local int rx1235_rep
    .local pmc rx1235_cur
    (rx1235_cur, rx1235_pos, rx1235_tgt) = self."!cursor_start"()
    rx1235_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
.annotate 'line', 528
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
  rx1235_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<~~>"  :subid("313_1275811487.95429") :method
.annotate 'line', 446
    $P1237 = self."!PREFIX__!subrule"("O", "~~")
    new $P1238, "ResizablePMCArray"
    push $P1238, $P1237
    .return ($P1238)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("314_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1242_tgt
    .local int rx1242_pos
    .local int rx1242_off
    .local int rx1242_eos
    .local int rx1242_rep
    .local pmc rx1242_cur
    (rx1242_cur, rx1242_pos, rx1242_tgt) = self."!cursor_start"()
    rx1242_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
.annotate 'line', 530
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
  rx1242_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<&&>"  :subid("315_1275811487.95429") :method
.annotate 'line', 446
    $P1244 = self."!PREFIX__!subrule"("O", "&&")
    new $P1245, "ResizablePMCArray"
    push $P1245, $P1244
    .return ($P1245)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("316_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1249_tgt
    .local int rx1249_pos
    .local int rx1249_off
    .local int rx1249_eos
    .local int rx1249_rep
    .local pmc rx1249_cur
    (rx1249_cur, rx1249_pos, rx1249_tgt) = self."!cursor_start"()
    rx1249_cur."!cursor_debug"("START ", "infix:sym<||>")
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
.annotate 'line', 532
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
  rx1249_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<||>"  :subid("317_1275811487.95429") :method
.annotate 'line', 446
    $P1251 = self."!PREFIX__!subrule"("O", "||")
    new $P1252, "ResizablePMCArray"
    push $P1252, $P1251
    .return ($P1252)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("318_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1256_tgt
    .local int rx1256_pos
    .local int rx1256_off
    .local int rx1256_eos
    .local int rx1256_rep
    .local pmc rx1256_cur
    (rx1256_cur, rx1256_pos, rx1256_tgt) = self."!cursor_start"()
    rx1256_cur."!cursor_debug"("START ", "infix:sym<//>")
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
.annotate 'line', 533
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
  rx1256_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<//>"  :subid("319_1275811487.95429") :method
.annotate 'line', 446
    $P1258 = self."!PREFIX__!subrule"("O", "//")
    new $P1259, "ResizablePMCArray"
    push $P1259, $P1258
    .return ($P1259)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("320_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1263_tgt
    .local int rx1263_pos
    .local int rx1263_off
    .local int rx1263_eos
    .local int rx1263_rep
    .local pmc rx1263_cur
    (rx1263_cur, rx1263_pos, rx1263_tgt) = self."!cursor_start"()
    rx1263_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
.annotate 'line', 536
  # rx literal  "??"
    add $I11, rx1263_pos, 2
    gt $I11, rx1263_eos, rx1263_fail
    sub $I11, rx1263_pos, rx1263_off
    substr $S10, rx1263_tgt, $I11, 2
    ne $S10, "??", rx1263_fail
    add rx1263_pos, 2
.annotate 'line', 537
  # rx subrule "ws" subtype=method negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."ws"()
    unless $P10, rx1263_fail
    rx1263_pos = $P10."pos"()
.annotate 'line', 538
  # rx subrule "EXPR" subtype=capture negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."EXPR"("i=")
    unless $P10, rx1263_fail
    rx1263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1263_pos = $P10."pos"()
.annotate 'line', 539
  # rx literal  "!!"
    add $I11, rx1263_pos, 2
    gt $I11, rx1263_eos, rx1263_fail
    sub $I11, rx1263_pos, rx1263_off
    substr $S10, rx1263_tgt, $I11, 2
    ne $S10, "!!", rx1263_fail
    add rx1263_pos, 2
.annotate 'line', 540
  # rx subrule "O" subtype=capture negate=
    rx1263_cur."!cursor_pos"(rx1263_pos)
    $P10 = rx1263_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1263_fail
    rx1263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1263_pos = $P10."pos"()
.annotate 'line', 535
  # rx pass
    rx1263_cur."!cursor_pass"(rx1263_pos, "infix:sym<?? !!>")
    rx1263_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1263_pos)
    .return (rx1263_cur)
  rx1263_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<?? !!>"  :subid("321_1275811487.95429") :method
.annotate 'line', 446
    $P1265 = self."!PREFIX__!subrule"("ws", "??")
    new $P1266, "ResizablePMCArray"
    push $P1266, $P1265
    .return ($P1266)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("322_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1269_tgt
    .local int rx1269_pos
    .local int rx1269_off
    .local int rx1269_eos
    .local int rx1269_rep
    .local pmc rx1269_cur
    (rx1269_cur, rx1269_pos, rx1269_tgt) = self."!cursor_start"()
    rx1269_cur."!cursor_debug"("START ", "infix:sym<=>")
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
.annotate 'line', 544
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
.annotate 'line', 543
  # rx pass
    rx1269_cur."!cursor_pass"(rx1269_pos, "infix:sym<=>")
    rx1269_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1269_pos)
    .return (rx1269_cur)
  rx1269_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<=>"  :subid("323_1275811487.95429") :method
.annotate 'line', 446
    $P1271 = self."!PREFIX__!subrule"("panic", "=")
    new $P1272, "ResizablePMCArray"
    push $P1272, $P1271
    .return ($P1272)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("324_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1276_tgt
    .local int rx1276_pos
    .local int rx1276_off
    .local int rx1276_eos
    .local int rx1276_rep
    .local pmc rx1276_cur
    (rx1276_cur, rx1276_pos, rx1276_tgt) = self."!cursor_start"()
    rx1276_cur."!cursor_debug"("START ", "infix:sym<:=>")
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
.annotate 'line', 546
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
  rx1276_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<:=>"  :subid("325_1275811487.95429") :method
.annotate 'line', 446
    $P1278 = self."!PREFIX__!subrule"("O", ":=")
    new $P1279, "ResizablePMCArray"
    push $P1279, $P1278
    .return ($P1279)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("326_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1283_tgt
    .local int rx1283_pos
    .local int rx1283_off
    .local int rx1283_eos
    .local int rx1283_rep
    .local pmc rx1283_cur
    (rx1283_cur, rx1283_pos, rx1283_tgt) = self."!cursor_start"()
    rx1283_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
.annotate 'line', 547
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
  rx1283_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<::=>"  :subid("327_1275811487.95429") :method
.annotate 'line', 446
    $P1285 = self."!PREFIX__!subrule"("O", "::=")
    new $P1286, "ResizablePMCArray"
    push $P1286, $P1285
    .return ($P1286)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("328_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1290_tgt
    .local int rx1290_pos
    .local int rx1290_off
    .local int rx1290_eos
    .local int rx1290_rep
    .local pmc rx1290_cur
    (rx1290_cur, rx1290_pos, rx1290_tgt) = self."!cursor_start"()
    rx1290_cur."!cursor_debug"("START ", "infix:sym<,>")
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
.annotate 'line', 549
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
  rx1290_fail:
.annotate 'line', 446
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
.sub "!PREFIX__infix:sym<,>"  :subid("329_1275811487.95429") :method
.annotate 'line', 446
    $P1292 = self."!PREFIX__!subrule"("O", ",")
    new $P1293, "ResizablePMCArray"
    push $P1293, $P1292
    .return ($P1293)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("330_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1297_tgt
    .local int rx1297_pos
    .local int rx1297_off
    .local int rx1297_eos
    .local int rx1297_rep
    .local pmc rx1297_cur
    (rx1297_cur, rx1297_pos, rx1297_tgt) = self."!cursor_start"()
    rx1297_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
.annotate 'line', 551
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
  rx1297_fail:
.annotate 'line', 446
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
.sub "!PREFIX__prefix:sym<return>"  :subid("331_1275811487.95429") :method
.annotate 'line', 446
    new $P1299, "ResizablePMCArray"
    push $P1299, "return"
    .return ($P1299)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("332_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1303_tgt
    .local int rx1303_pos
    .local int rx1303_off
    .local int rx1303_eos
    .local int rx1303_rep
    .local pmc rx1303_cur
    (rx1303_cur, rx1303_pos, rx1303_tgt) = self."!cursor_start"()
    rx1303_cur."!cursor_debug"("START ", "prefix:sym<make>")
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
.annotate 'line', 552
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
  rx1303_fail:
.annotate 'line', 446
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
.sub "!PREFIX__prefix:sym<make>"  :subid("333_1275811487.95429") :method
.annotate 'line', 446
    new $P1305, "ResizablePMCArray"
    push $P1305, "make"
    .return ($P1305)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("334_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1309_tgt
    .local int rx1309_pos
    .local int rx1309_off
    .local int rx1309_eos
    .local int rx1309_rep
    .local pmc rx1309_cur
    (rx1309_cur, rx1309_pos, rx1309_tgt) = self."!cursor_start"()
    rx1309_cur."!cursor_debug"("START ", "term:sym<last>")
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
.annotate 'line', 553
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
  rx1309_fail:
.annotate 'line', 446
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
.sub "!PREFIX__term:sym<last>"  :subid("335_1275811487.95429") :method
.annotate 'line', 446
    new $P1311, "ResizablePMCArray"
    push $P1311, "last"
    .return ($P1311)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("336_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1315_tgt
    .local int rx1315_pos
    .local int rx1315_off
    .local int rx1315_eos
    .local int rx1315_rep
    .local pmc rx1315_cur
    (rx1315_cur, rx1315_pos, rx1315_tgt) = self."!cursor_start"()
    rx1315_cur."!cursor_debug"("START ", "term:sym<next>")
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
.annotate 'line', 554
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
  rx1315_fail:
.annotate 'line', 446
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
.sub "!PREFIX__term:sym<next>"  :subid("337_1275811487.95429") :method
.annotate 'line', 446
    new $P1317, "ResizablePMCArray"
    push $P1317, "next"
    .return ($P1317)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("338_1275811487.95429") :method :outer("11_1275811487.95429")
.annotate 'line', 446
    .local string rx1321_tgt
    .local int rx1321_pos
    .local int rx1321_off
    .local int rx1321_eos
    .local int rx1321_rep
    .local pmc rx1321_cur
    (rx1321_cur, rx1321_pos, rx1321_tgt) = self."!cursor_start"()
    rx1321_cur."!cursor_debug"("START ", "term:sym<redo>")
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
.annotate 'line', 555
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
  rx1321_fail:
.annotate 'line', 446
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
.sub "!PREFIX__term:sym<redo>"  :subid("339_1275811487.95429") :method
.annotate 'line', 446
    new $P1323, "ResizablePMCArray"
    push $P1323, "redo"
    .return ($P1323)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("340_1275811487.95429") :method :outer("11_1275811487.95429")
    .param pmc param_1329
.annotate 'line', 557
    new $P1328, 'ExceptionHandler'
    set_addr $P1328, control_1327
    $P1328."handle_types"(.CONTROL_RETURN)
    push_eh $P1328
    .lex "self", self
    .lex "$/", param_1329
.annotate 'line', 559
    new $P1330, "Undef"
    .lex "$t", $P1330
    find_lex $P1331, "$/"
    unless_null $P1331, vivify_376
    $P1331 = root_new ['parrot';'ResizablePMCArray']
  vivify_376:
    set $P1332, $P1331[0]
    unless_null $P1332, vivify_377
    new $P1332, "Undef"
  vivify_377:
    store_lex "$t", $P1332
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_378
    $P1333 = root_new ['parrot';'ResizablePMCArray']
  vivify_378:
    set $P1334, $P1333[1]
    unless_null $P1334, vivify_379
    new $P1334, "Undef"
  vivify_379:
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_380
    $P1335 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1335
  vivify_380:
    set $P1335[0], $P1334
    find_lex $P1336, "$t"
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_381
    $P1337 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1337
  vivify_381:
    set $P1337[1], $P1336
.annotate 'line', 557
    .return ($P1336)
  control_1327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, "payload"
    .return ($P1338)
.end


.namespace ["NQP";"Regex"]
.sub "_block1339"  :subid("341_1275811487.95429") :outer("11_1275811487.95429")
.annotate 'line', 563
    .const 'Sub' $P1397 = "360_1275811487.95429" 
    capture_lex $P1397
    .const 'Sub' $P1392 = "358_1275811487.95429" 
    capture_lex $P1392
    .const 'Sub' $P1379 = "355_1275811487.95429" 
    capture_lex $P1379
    .const 'Sub' $P1369 = "352_1275811487.95429" 
    capture_lex $P1369
    .const 'Sub' $P1364 = "350_1275811487.95429" 
    capture_lex $P1364
    .const 'Sub' $P1355 = "347_1275811487.95429" 
    capture_lex $P1355
    .const 'Sub' $P1350 = "345_1275811487.95429" 
    capture_lex $P1350
    .const 'Sub' $P1341 = "342_1275811487.95429" 
    capture_lex $P1341
    .const 'Sub' $P1397 = "360_1275811487.95429" 
    capture_lex $P1397
    .return ($P1397)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("342_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .const 'Sub' $P1347 = "344_1275811487.95429" 
    capture_lex $P1347
    .local string rx1342_tgt
    .local int rx1342_pos
    .local int rx1342_off
    .local int rx1342_eos
    .local int rx1342_rep
    .local pmc rx1342_cur
    (rx1342_cur, rx1342_pos, rx1342_tgt) = self."!cursor_start"()
    rx1342_cur."!cursor_debug"("START ", "metachar:sym<:my>")
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
  # rx literal  ":"
    add $I11, rx1342_pos, 1
    gt $I11, rx1342_eos, rx1342_fail
    sub $I11, rx1342_pos, rx1342_off
    substr $S10, rx1342_tgt, $I11, 1
    ne $S10, ":", rx1342_fail
    add rx1342_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1342_cur."!cursor_pos"(rx1342_pos)
    .const 'Sub' $P1347 = "344_1275811487.95429" 
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
.annotate 'line', 564
  # rx pass
    rx1342_cur."!cursor_pass"(rx1342_pos, "metachar:sym<:my>")
    rx1342_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1342_pos)
    .return (rx1342_cur)
  rx1342_fail:
.annotate 'line', 563
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
.sub "!PREFIX__metachar:sym<:my>"  :subid("343_1275811487.95429") :method
.annotate 'line', 563
    new $P1344, "ResizablePMCArray"
    push $P1344, ":"
    .return ($P1344)
.end


.namespace ["NQP";"Regex"]
.sub "_block1346"  :anon :subid("344_1275811487.95429") :method :outer("342_1275811487.95429")
.annotate 'line', 565
    .local string rx1348_tgt
    .local int rx1348_pos
    .local int rx1348_off
    .local int rx1348_eos
    .local int rx1348_rep
    .local pmc rx1348_cur
    (rx1348_cur, rx1348_pos, rx1348_tgt) = self."!cursor_start"()
    rx1348_cur."!cursor_debug"("START ", "")
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
.sub "metachar:sym<{ }>"  :subid("345_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .local string rx1351_tgt
    .local int rx1351_pos
    .local int rx1351_off
    .local int rx1351_eos
    .local int rx1351_rep
    .local pmc rx1351_cur
    (rx1351_cur, rx1351_pos, rx1351_tgt) = self."!cursor_start"()
    rx1351_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
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
.annotate 'line', 569
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
.annotate 'line', 568
  # rx pass
    rx1351_cur."!cursor_pass"(rx1351_pos, "metachar:sym<{ }>")
    rx1351_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1351_pos)
    .return (rx1351_cur)
  rx1351_fail:
.annotate 'line', 563
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
.sub "!PREFIX__metachar:sym<{ }>"  :subid("346_1275811487.95429") :method
.annotate 'line', 563
    new $P1353, "ResizablePMCArray"
    push $P1353, "{"
    .return ($P1353)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("347_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .const 'Sub' $P1361 = "349_1275811487.95429" 
    capture_lex $P1361
    .local string rx1356_tgt
    .local int rx1356_pos
    .local int rx1356_off
    .local int rx1356_eos
    .local int rx1356_rep
    .local pmc rx1356_cur
    (rx1356_cur, rx1356_pos, rx1356_tgt) = self."!cursor_start"()
    rx1356_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
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
.annotate 'line', 573
  # rx enumcharlist negate=0 zerowidth
    ge rx1356_pos, rx1356_eos, rx1356_fail
    sub $I10, rx1356_pos, rx1356_off
    substr $S10, rx1356_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1356_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1356_cur."!cursor_pos"(rx1356_pos)
    .const 'Sub' $P1361 = "349_1275811487.95429" 
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
.annotate 'line', 572
  # rx pass
    rx1356_cur."!cursor_pass"(rx1356_pos, "metachar:sym<nqpvar>")
    rx1356_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1356_pos)
    .return (rx1356_cur)
  rx1356_fail:
.annotate 'line', 563
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
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("348_1275811487.95429") :method
.annotate 'line', 563
    new $P1358, "ResizablePMCArray"
    push $P1358, "$"
    push $P1358, "@"
    .return ($P1358)
.end


.namespace ["NQP";"Regex"]
.sub "_block1360"  :anon :subid("349_1275811487.95429") :method :outer("347_1275811487.95429")
.annotate 'line', 573
    .local string rx1362_tgt
    .local int rx1362_pos
    .local int rx1362_off
    .local int rx1362_eos
    .local int rx1362_rep
    .local pmc rx1362_cur
    (rx1362_cur, rx1362_pos, rx1362_tgt) = self."!cursor_start"()
    rx1362_cur."!cursor_debug"("START ", "")
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
.sub "assertion:sym<{ }>"  :subid("350_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .local string rx1365_tgt
    .local int rx1365_pos
    .local int rx1365_off
    .local int rx1365_eos
    .local int rx1365_rep
    .local pmc rx1365_cur
    (rx1365_cur, rx1365_pos, rx1365_tgt) = self."!cursor_start"()
    rx1365_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
.annotate 'line', 577
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
.annotate 'line', 576
  # rx pass
    rx1365_cur."!cursor_pass"(rx1365_pos, "assertion:sym<{ }>")
    rx1365_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1365_pos)
    .return (rx1365_cur)
  rx1365_fail:
.annotate 'line', 563
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
.sub "!PREFIX__assertion:sym<{ }>"  :subid("351_1275811487.95429") :method
.annotate 'line', 563
    new $P1367, "ResizablePMCArray"
    push $P1367, "{"
    .return ($P1367)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("352_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .const 'Sub' $P1375 = "354_1275811487.95429" 
    capture_lex $P1375
    .local string rx1370_tgt
    .local int rx1370_pos
    .local int rx1370_off
    .local int rx1370_eos
    .local int rx1370_rep
    .local pmc rx1370_cur
    (rx1370_cur, rx1370_pos, rx1370_tgt) = self."!cursor_start"()
    rx1370_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
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
.annotate 'line', 581
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
    .const 'Sub' $P1375 = "354_1275811487.95429" 
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
.annotate 'line', 580
  # rx pass
    rx1370_cur."!cursor_pass"(rx1370_pos, "assertion:sym<?{ }>")
    rx1370_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1370_pos)
    .return (rx1370_cur)
  rx1370_fail:
.annotate 'line', 563
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
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("353_1275811487.95429") :method
.annotate 'line', 563
    new $P1372, "ResizablePMCArray"
    push $P1372, "!"
    push $P1372, "?"
    .return ($P1372)
.end


.namespace ["NQP";"Regex"]
.sub "_block1374"  :anon :subid("354_1275811487.95429") :method :outer("352_1275811487.95429")
.annotate 'line', 581
    .local string rx1376_tgt
    .local int rx1376_pos
    .local int rx1376_off
    .local int rx1376_eos
    .local int rx1376_rep
    .local pmc rx1376_cur
    (rx1376_cur, rx1376_pos, rx1376_tgt) = self."!cursor_start"()
    rx1376_cur."!cursor_debug"("START ", "")
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
.sub "assertion:sym<name>"  :subid("355_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .const 'Sub' $P1388 = "357_1275811487.95429" 
    capture_lex $P1388
    .local string rx1380_tgt
    .local int rx1380_pos
    .local int rx1380_off
    .local int rx1380_eos
    .local int rx1380_rep
    .local pmc rx1380_cur
    (rx1380_cur, rx1380_pos, rx1380_tgt) = self."!cursor_start"()
    rx1380_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1380_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
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
.annotate 'line', 585
  # rx subcapture "longname"
    set_addr $I10, rxcap_1384_fail
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1380_pos, rx1380_off
    find_not_cclass $I11, 8192, rx1380_tgt, $I10, rx1380_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1380_fail
    add rx1380_pos, rx1380_off, $I11
    set_addr $I10, rxcap_1384_fail
    ($I12, $I11) = rx1380_cur."!mark_peek"($I10)
    rx1380_cur."!cursor_pos"($I11)
    ($P10) = rx1380_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1380_pos, "")
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1384_done
  rxcap_1384_fail:
    goto rx1380_fail
  rxcap_1384_done:
.annotate 'line', 592
  # rx rxquantr1385 ** 0..1
    set_addr $I1391, rxquantr1385_done
    rx1380_cur."!mark_push"(0, rx1380_pos, $I1391)
  rxquantr1385_loop:
  alt1386_0:
.annotate 'line', 586
    set_addr $I10, alt1386_1
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 587
  # rx subrule "before" subtype=zerowidth negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    .const 'Sub' $P1388 = "357_1275811487.95429" 
    capture_lex $P1388
    $P10 = rx1380_cur."before"($P1388)
    unless $P10, rx1380_fail
    goto alt1386_end
  alt1386_1:
    set_addr $I10, alt1386_2
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
.annotate 'line', 588
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
.annotate 'line', 589
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
.annotate 'line', 590
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
.annotate 'line', 591
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
.annotate 'line', 592
    (rx1380_rep) = rx1380_cur."!mark_commit"($I1391)
  rxquantr1385_done:
.annotate 'line', 584
  # rx pass
    rx1380_cur."!cursor_pass"(rx1380_pos, "assertion:sym<name>")
    rx1380_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1380_pos)
    .return (rx1380_cur)
  rx1380_fail:
.annotate 'line', 563
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
.sub "!PREFIX__assertion:sym<name>"  :subid("356_1275811487.95429") :method
.annotate 'line', 563
    new $P1382, "ResizablePMCArray"
    push $P1382, ""
    .return ($P1382)
.end


.namespace ["NQP";"Regex"]
.sub "_block1387"  :anon :subid("357_1275811487.95429") :method :outer("355_1275811487.95429")
.annotate 'line', 587
    .local string rx1389_tgt
    .local int rx1389_pos
    .local int rx1389_off
    .local int rx1389_eos
    .local int rx1389_rep
    .local pmc rx1389_cur
    (rx1389_cur, rx1389_pos, rx1389_tgt) = self."!cursor_start"()
    rx1389_cur."!cursor_debug"("START ", "")
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
.sub "assertion:sym<var>"  :subid("358_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .local string rx1393_tgt
    .local int rx1393_pos
    .local int rx1393_off
    .local int rx1393_eos
    .local int rx1393_rep
    .local pmc rx1393_cur
    (rx1393_cur, rx1393_pos, rx1393_tgt) = self."!cursor_start"()
    rx1393_cur."!cursor_debug"("START ", "assertion:sym<var>")
    .lex unicode:"$\x{a2}", rx1393_cur
    .local pmc match
    .lex "$/", match
    length rx1393_eos, rx1393_tgt
    gt rx1393_pos, rx1393_eos, rx1393_done
    set rx1393_off, 0
    lt rx1393_pos, 2, rx1393_start
    sub rx1393_off, rx1393_pos, 1
    substr rx1393_tgt, rx1393_tgt, rx1393_off
  rx1393_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1396_done
    goto rxscan1396_scan
  rxscan1396_loop:
    ($P10) = rx1393_cur."from"()
    inc $P10
    set rx1393_pos, $P10
    ge rx1393_pos, rx1393_eos, rxscan1396_done
  rxscan1396_scan:
    set_addr $I10, rxscan1396_loop
    rx1393_cur."!mark_push"(0, rx1393_pos, $I10)
  rxscan1396_done:
.annotate 'line', 596
  # rx enumcharlist negate=0 zerowidth
    ge rx1393_pos, rx1393_eos, rx1393_fail
    sub $I10, rx1393_pos, rx1393_off
    substr $S10, rx1393_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1393_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1393_cur."!cursor_pos"(rx1393_pos)
    $P10 = rx1393_cur."LANG"("MAIN", "variable")
    unless $P10, rx1393_fail
    rx1393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1393_pos = $P10."pos"()
.annotate 'line', 595
  # rx pass
    rx1393_cur."!cursor_pass"(rx1393_pos, "assertion:sym<var>")
    rx1393_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1393_pos)
    .return (rx1393_cur)
  rx1393_fail:
.annotate 'line', 563
    (rx1393_rep, rx1393_pos, $I10, $P10) = rx1393_cur."!mark_fail"(0)
    lt rx1393_pos, -1, rx1393_done
    eq rx1393_pos, -1, rx1393_fail
    jump $I10
  rx1393_done:
    rx1393_cur."!cursor_fail"()
    rx1393_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1393_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("359_1275811487.95429") :method
.annotate 'line', 563
    new $P1395, "ResizablePMCArray"
    push $P1395, "$"
    push $P1395, "@"
    .return ($P1395)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("360_1275811487.95429") :method :outer("341_1275811487.95429")
.annotate 'line', 563
    .local string rx1398_tgt
    .local int rx1398_pos
    .local int rx1398_off
    .local int rx1398_eos
    .local int rx1398_rep
    .local pmc rx1398_cur
    (rx1398_cur, rx1398_pos, rx1398_tgt) = self."!cursor_start"()
    rx1398_cur."!cursor_debug"("START ", "codeblock")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1402_done
    goto rxscan1402_scan
  rxscan1402_loop:
    ($P10) = rx1398_cur."from"()
    inc $P10
    set rx1398_pos, $P10
    ge rx1398_pos, rx1398_eos, rxscan1402_done
  rxscan1402_scan:
    set_addr $I10, rxscan1402_loop
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxscan1402_done:
.annotate 'line', 600
  # rx subrule "LANG" subtype=capture negate=
    rx1398_cur."!cursor_pos"(rx1398_pos)
    $P10 = rx1398_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1398_fail
    rx1398_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1398_pos = $P10."pos"()
.annotate 'line', 599
  # rx pass
    rx1398_cur."!cursor_pass"(rx1398_pos, "codeblock")
    rx1398_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1398_pos)
    .return (rx1398_cur)
  rx1398_fail:
.annotate 'line', 563
    (rx1398_rep, rx1398_pos, $I10, $P10) = rx1398_cur."!mark_fail"(0)
    lt rx1398_pos, -1, rx1398_done
    eq rx1398_pos, -1, rx1398_fail
    jump $I10
  rx1398_done:
    rx1398_cur."!cursor_fail"()
    rx1398_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1398_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("361_1275811487.95429") :method
.annotate 'line', 563
    $P1400 = self."!PREFIX__!subrule"("LANG", "")
    new $P1401, "ResizablePMCArray"
    push $P1401, $P1400
    .return ($P1401)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1404" :load :anon :subid("362_1275811487.95429")
.annotate 'line', 4
    .const 'Sub' $P1406 = "11_1275811487.95429" 
    $P1407 = $P1406()
    .return ($P1407)
.end


.namespace []
.sub "_block1425" :load :anon :subid("363_1275811487.95429")
.annotate 'line', 1
    .const 'Sub' $P1427 = "10_1275811487.95429" 
    $P1428 = $P1427()
    .return ($P1428)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275811497.55064")
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
    .const 'Sub' $P2426 = "143_1275811497.55064" 
    .return ($P2426)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1275811497.55064")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275811497.55064" 
    .local pmc block
    set block, $P12
    $P2429 = get_root_global ["parrot"], "P6metaclass"
    $P2429."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1275811497.55064") :outer("10_1275811497.55064")
.annotate 'line', 3
    .const 'Sub' $P2420 = "142_1275811497.55064" 
    capture_lex $P2420
    get_hll_global $P2303, ["NQP";"RegexActions"], "_block2302" 
    capture_lex $P2303
    .const 'Sub' $P2292 = "132_1275811497.55064" 
    capture_lex $P2292
    .const 'Sub' $P2285 = "131_1275811497.55064" 
    capture_lex $P2285
    .const 'Sub' $P2278 = "130_1275811497.55064" 
    capture_lex $P2278
    .const 'Sub' $P2271 = "129_1275811497.55064" 
    capture_lex $P2271
    .const 'Sub' $P2258 = "128_1275811497.55064" 
    capture_lex $P2258
    .const 'Sub' $P2248 = "127_1275811497.55064" 
    capture_lex $P2248
    .const 'Sub' $P2238 = "126_1275811497.55064" 
    capture_lex $P2238
    .const 'Sub' $P2228 = "125_1275811497.55064" 
    capture_lex $P2228
    .const 'Sub' $P2221 = "124_1275811497.55064" 
    capture_lex $P2221
    .const 'Sub' $P2207 = "123_1275811497.55064" 
    capture_lex $P2207
    .const 'Sub' $P2197 = "122_1275811497.55064" 
    capture_lex $P2197
    .const 'Sub' $P2160 = "121_1275811497.55064" 
    capture_lex $P2160
    .const 'Sub' $P2146 = "120_1275811497.55064" 
    capture_lex $P2146
    .const 'Sub' $P2136 = "119_1275811497.55064" 
    capture_lex $P2136
    .const 'Sub' $P2126 = "118_1275811497.55064" 
    capture_lex $P2126
    .const 'Sub' $P2116 = "117_1275811497.55064" 
    capture_lex $P2116
    .const 'Sub' $P2106 = "116_1275811497.55064" 
    capture_lex $P2106
    .const 'Sub' $P2096 = "115_1275811497.55064" 
    capture_lex $P2096
    .const 'Sub' $P2068 = "114_1275811497.55064" 
    capture_lex $P2068
    .const 'Sub' $P2051 = "113_1275811497.55064" 
    capture_lex $P2051
    .const 'Sub' $P2041 = "112_1275811497.55064" 
    capture_lex $P2041
    .const 'Sub' $P2028 = "111_1275811497.55064" 
    capture_lex $P2028
    .const 'Sub' $P2015 = "110_1275811497.55064" 
    capture_lex $P2015
    .const 'Sub' $P2002 = "109_1275811497.55064" 
    capture_lex $P2002
    .const 'Sub' $P1992 = "108_1275811497.55064" 
    capture_lex $P1992
    .const 'Sub' $P1963 = "107_1275811497.55064" 
    capture_lex $P1963
    .const 'Sub' $P1939 = "106_1275811497.55064" 
    capture_lex $P1939
    .const 'Sub' $P1929 = "105_1275811497.55064" 
    capture_lex $P1929
    .const 'Sub' $P1919 = "104_1275811497.55064" 
    capture_lex $P1919
    .const 'Sub' $P1892 = "103_1275811497.55064" 
    capture_lex $P1892
    .const 'Sub' $P1874 = "102_1275811497.55064" 
    capture_lex $P1874
    .const 'Sub' $P1864 = "101_1275811497.55064" 
    capture_lex $P1864
    .const 'Sub' $P1760 = "98_1275811497.55064" 
    capture_lex $P1760
    .const 'Sub' $P1750 = "97_1275811497.55064" 
    capture_lex $P1750
    .const 'Sub' $P1721 = "96_1275811497.55064" 
    capture_lex $P1721
    .const 'Sub' $P1679 = "95_1275811497.55064" 
    capture_lex $P1679
    .const 'Sub' $P1663 = "94_1275811497.55064" 
    capture_lex $P1663
    .const 'Sub' $P1654 = "93_1275811497.55064" 
    capture_lex $P1654
    .const 'Sub' $P1622 = "92_1275811497.55064" 
    capture_lex $P1622
    .const 'Sub' $P1523 = "89_1275811497.55064" 
    capture_lex $P1523
    .const 'Sub' $P1506 = "88_1275811497.55064" 
    capture_lex $P1506
    .const 'Sub' $P1486 = "87_1275811497.55064" 
    capture_lex $P1486
    .const 'Sub' $P1374 = "84_1275811497.55064" 
    capture_lex $P1374
    .const 'Sub' $P1317 = "80_1275811497.55064" 
    capture_lex $P1317
    .const 'Sub' $P1277 = "78_1275811497.55064" 
    capture_lex $P1277
    .const 'Sub' $P1227 = "76_1275811497.55064" 
    capture_lex $P1227
    .const 'Sub' $P1217 = "75_1275811497.55064" 
    capture_lex $P1217
    .const 'Sub' $P1207 = "74_1275811497.55064" 
    capture_lex $P1207
    .const 'Sub' $P1136 = "72_1275811497.55064" 
    capture_lex $P1136
    .const 'Sub' $P1126 = "71_1275811497.55064" 
    capture_lex $P1126
    .const 'Sub' $P1109 = "70_1275811497.55064" 
    capture_lex $P1109
    .const 'Sub' $P1092 = "69_1275811497.55064" 
    capture_lex $P1092
    .const 'Sub' $P1075 = "68_1275811497.55064" 
    capture_lex $P1075
    .const 'Sub' $P1065 = "67_1275811497.55064" 
    capture_lex $P1065
    .const 'Sub' $P1055 = "66_1275811497.55064" 
    capture_lex $P1055
    .const 'Sub' $P1045 = "65_1275811497.55064" 
    capture_lex $P1045
    .const 'Sub' $P1021 = "64_1275811497.55064" 
    capture_lex $P1021
    .const 'Sub' $P968 = "63_1275811497.55064" 
    capture_lex $P968
    .const 'Sub' $P958 = "62_1275811497.55064" 
    capture_lex $P958
    .const 'Sub' $P869 = "60_1275811497.55064" 
    capture_lex $P869
    .const 'Sub' $P843 = "59_1275811497.55064" 
    capture_lex $P843
    .const 'Sub' $P827 = "58_1275811497.55064" 
    capture_lex $P827
    .const 'Sub' $P817 = "57_1275811497.55064" 
    capture_lex $P817
    .const 'Sub' $P807 = "56_1275811497.55064" 
    capture_lex $P807
    .const 'Sub' $P797 = "55_1275811497.55064" 
    capture_lex $P797
    .const 'Sub' $P787 = "54_1275811497.55064" 
    capture_lex $P787
    .const 'Sub' $P777 = "53_1275811497.55064" 
    capture_lex $P777
    .const 'Sub' $P767 = "52_1275811497.55064" 
    capture_lex $P767
    .const 'Sub' $P757 = "51_1275811497.55064" 
    capture_lex $P757
    .const 'Sub' $P747 = "50_1275811497.55064" 
    capture_lex $P747
    .const 'Sub' $P737 = "49_1275811497.55064" 
    capture_lex $P737
    .const 'Sub' $P727 = "48_1275811497.55064" 
    capture_lex $P727
    .const 'Sub' $P717 = "47_1275811497.55064" 
    capture_lex $P717
    .const 'Sub' $P707 = "46_1275811497.55064" 
    capture_lex $P707
    .const 'Sub' $P697 = "45_1275811497.55064" 
    capture_lex $P697
    .const 'Sub' $P679 = "44_1275811497.55064" 
    capture_lex $P679
    .const 'Sub' $P644 = "43_1275811497.55064" 
    capture_lex $P644
    .const 'Sub' $P628 = "42_1275811497.55064" 
    capture_lex $P628
    .const 'Sub' $P607 = "41_1275811497.55064" 
    capture_lex $P607
    .const 'Sub' $P587 = "40_1275811497.55064" 
    capture_lex $P587
    .const 'Sub' $P574 = "39_1275811497.55064" 
    capture_lex $P574
    .const 'Sub' $P548 = "38_1275811497.55064" 
    capture_lex $P548
    .const 'Sub' $P512 = "37_1275811497.55064" 
    capture_lex $P512
    .const 'Sub' $P495 = "36_1275811497.55064" 
    capture_lex $P495
    .const 'Sub' $P481 = "35_1275811497.55064" 
    capture_lex $P481
    .const 'Sub' $P428 = "33_1275811497.55064" 
    capture_lex $P428
    .const 'Sub' $P417 = "32_1275811497.55064" 
    capture_lex $P417
    .const 'Sub' $P404 = "31_1275811497.55064" 
    capture_lex $P404
    .const 'Sub' $P384 = "30_1275811497.55064" 
    capture_lex $P384
    .const 'Sub' $P374 = "29_1275811497.55064" 
    capture_lex $P374
    .const 'Sub' $P364 = "28_1275811497.55064" 
    capture_lex $P364
    .const 'Sub' $P348 = "27_1275811497.55064" 
    capture_lex $P348
    .const 'Sub' $P288 = "25_1275811497.55064" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1275811497.55064" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1275811497.55064" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1275811497.55064" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1275811497.55064" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1275811497.55064" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1275811497.55064" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1275811497.55064" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1275811497.55064" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1275811497.55064" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1275811497.55064" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1275811497.55064" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1275811497.55064" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1275811497.55064" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1275811497.55064" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 213
    .const 'Sub' $P100 = "18_1275811497.55064" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 822
    .const 'Sub' $P151 = "19_1275811497.55064" 
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
.annotate 'line', 206
    find_lex $P627, "push_block_handler"
.annotate 'line', 813
    find_lex $P2270, "control"
.annotate 'line', 840
    get_hll_global $P2303, ["NQP";"RegexActions"], "_block2302" 
    capture_lex $P2303
    $P2414 = $P2303()
.annotate 'line', 3
    .return ($P2414)
    .const 'Sub' $P2416 = "141_1275811497.55064" 
    .return ($P2416)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1275811497.55064")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2420 = "142_1275811497.55064" 
    capture_lex $P2420
    $P2420()
    $P2423 = get_root_global ["parrot"], "P6metaclass"
    $P2423."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2419"  :anon :subid("142_1275811497.55064") :outer("11_1275811497.55064")
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
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1275811497.55064") :outer("11_1275811497.55064")
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
.sub "block_immediate"  :subid("13_1275811497.55064") :outer("11_1275811497.55064")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1275811497.55064" 
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
    .const 'Sub' $P40 = "14_1275811497.55064" 
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
.sub "_block39"  :anon :subid("14_1275811497.55064") :outer("13_1275811497.55064")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1275811497.55064" 
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
    .const 'Sub' $P51 = "15_1275811497.55064" 
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
.sub "_block50"  :anon :subid("15_1275811497.55064") :outer("14_1275811497.55064")
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
.sub "vivitype"  :subid("16_1275811497.55064") :outer("11_1275811497.55064")
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
.sub "colonpair_str"  :subid("17_1275811497.55064") :outer("11_1275811497.55064")
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
.sub "push_block_handler"  :subid("18_1275811497.55064") :outer("11_1275811497.55064")
    .param pmc param_103
    .param pmc param_104
.annotate 'line', 213
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "control"  :subid("19_1275811497.55064") :outer("11_1275811497.55064")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 822
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(.CONTROL_RETURN)
    push_eh $P153
    .lex "$/", param_154
    .lex "$type", param_155
.annotate 'line', 823
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 827
    get_hll_global $P159, ["PAST"], "Val"
    find_lex $P160, "$type"
    $P161 = $P159."new"($P160 :named("value"), "!except_types" :named("returns"))
    $P162 = $P157."new"(0, $P161, $P158 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 823
    $P163 = $P156."!make"($P162)
.annotate 'line', 822
    .return ($P163)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1275811497.55064") :method :outer("11_1275811497.55064")
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
.sub "deflongname"  :subid("21_1275811497.55064") :method :outer("11_1275811497.55064")
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
.sub "comp_unit"  :subid("22_1275811497.55064") :method :outer("11_1275811497.55064")
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
.sub "statementlist"  :subid("23_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1275811497.55064" 
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
    .const 'Sub' $P262 = "24_1275811497.55064" 
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
.sub "_block261"  :anon :subid("24_1275811497.55064") :outer("23_1275811497.55064")
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
.sub "statement"  :subid("25_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1275811497.55064" 
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
.annotate 'line', 102
    find_lex $P338, "$/"
    unless_null $P338, vivify_186
    $P338 = root_new ['parrot';'Hash']
  vivify_186:
    set $P339, $P338["statement_control"]
    unless_null $P339, vivify_187
    new $P339, "Undef"
  vivify_187:
    if $P339, if_337
.annotate 'line', 103
    new $P343, "Integer"
    assign $P343, 0
    store_lex "$past", $P343
    goto if_337_end
  if_337:
.annotate 'line', 102
    find_lex $P340, "$/"
    unless_null $P340, vivify_188
    $P340 = root_new ['parrot';'Hash']
  vivify_188:
    set $P341, $P340["statement_control"]
    unless_null $P341, vivify_189
    new $P341, "Undef"
  vivify_189:
    $P342 = $P341."ast"()
    store_lex "$past", $P342
  if_337_end:
    goto if_296_end
  if_296:
.annotate 'line', 91
    .const 'Sub' $P300 = "26_1275811497.55064" 
    capture_lex $P300
    $P300()
  if_296_end:
.annotate 'line', 104
    find_lex $P344, "$/"
    find_lex $P345, "$past"
    $P346 = $P344."!make"($P345)
.annotate 'line', 89
    .return ($P346)
  control_289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
.end


.namespace ["NQP";"Actions"]
.sub "_block299"  :anon :subid("26_1275811497.55064") :outer("25_1275811497.55064")
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
    get_hll_global $P327, ["PAST"], "Op"
    find_lex $P328, "$ml"
    unless_null $P328, vivify_202
    $P328 = root_new ['parrot';'Hash']
  vivify_202:
    set $P329, $P328["cond"]
    unless_null $P329, vivify_203
    new $P329, "Undef"
  vivify_203:
    $P330 = $P329."ast"()
    find_lex $P331, "$past"
    find_lex $P332, "$ml"
    unless_null $P332, vivify_204
    $P332 = root_new ['parrot';'Hash']
  vivify_204:
    set $P333, $P332["sym"]
    unless_null $P333, vivify_205
    new $P333, "Undef"
  vivify_205:
    set $S334, $P333
    find_lex $P335, "$/"
    $P336 = $P327."new"($P330, $P331, $S334 :named("pasttype"), $P335 :named("node"))
    store_lex "$past", $P336
.annotate 'line', 98
    set $P324, $P336
  if_325_end:
.annotate 'line', 91
    .return ($P324)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock"  :subid("27_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_351
.annotate 'line', 107
    new $P350, 'ExceptionHandler'
    set_addr $P350, control_349
    $P350."handle_types"(.CONTROL_RETURN)
    push_eh $P350
    .lex "self", self
    .lex "$/", param_351
.annotate 'line', 108
    find_lex $P352, "$/"
    get_hll_global $P353, ["PAST"], "Op"
    find_lex $P354, "$/"
    unless_null $P354, vivify_206
    $P354 = root_new ['parrot';'Hash']
  vivify_206:
    set $P355, $P354["EXPR"]
    unless_null $P355, vivify_207
    new $P355, "Undef"
  vivify_207:
    $P356 = $P355."ast"()
    find_lex $P357, "$/"
    unless_null $P357, vivify_208
    $P357 = root_new ['parrot';'Hash']
  vivify_208:
    set $P358, $P357["pblock"]
    unless_null $P358, vivify_209
    new $P358, "Undef"
  vivify_209:
    $P359 = $P358."ast"()
    find_lex $P360, "$/"
    $P361 = $P353."new"($P356, $P359, "if" :named("pasttype"), $P360 :named("node"))
    $P362 = $P352."!make"($P361)
.annotate 'line', 107
    .return ($P362)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P363, exception, "payload"
    .return ($P363)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "pblock"  :subid("28_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_367
.annotate 'line', 111
    new $P366, 'ExceptionHandler'
    set_addr $P366, control_365
    $P366."handle_types"(.CONTROL_RETURN)
    push_eh $P366
    .lex "self", self
    .lex "$/", param_367
.annotate 'line', 112
    find_lex $P368, "$/"
    find_lex $P369, "$/"
    unless_null $P369, vivify_210
    $P369 = root_new ['parrot';'Hash']
  vivify_210:
    set $P370, $P369["blockoid"]
    unless_null $P370, vivify_211
    new $P370, "Undef"
  vivify_211:
    $P371 = $P370."ast"()
    $P372 = $P368."!make"($P371)
.annotate 'line', 111
    .return ($P372)
  control_365:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "block"  :subid("29_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_377
.annotate 'line', 115
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(.CONTROL_RETURN)
    push_eh $P376
    .lex "self", self
    .lex "$/", param_377
.annotate 'line', 116
    find_lex $P378, "$/"
    find_lex $P379, "$/"
    unless_null $P379, vivify_212
    $P379 = root_new ['parrot';'Hash']
  vivify_212:
    set $P380, $P379["blockoid"]
    unless_null $P380, vivify_213
    new $P380, "Undef"
  vivify_213:
    $P381 = $P380."ast"()
    $P382 = $P378."!make"($P381)
.annotate 'line', 115
    .return ($P382)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P383, exception, "payload"
    .return ($P383)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blockoid"  :subid("30_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_387
.annotate 'line', 119
    new $P386, 'ExceptionHandler'
    set_addr $P386, control_385
    $P386."handle_types"(.CONTROL_RETURN)
    push_eh $P386
    .lex "self", self
    .lex "$/", param_387
.annotate 'line', 120
    new $P388, "Undef"
    .lex "$past", $P388
.annotate 'line', 121
    new $P389, "Undef"
    .lex "$BLOCK", $P389
.annotate 'line', 120
    find_lex $P390, "$/"
    unless_null $P390, vivify_214
    $P390 = root_new ['parrot';'Hash']
  vivify_214:
    set $P391, $P390["statementlist"]
    unless_null $P391, vivify_215
    new $P391, "Undef"
  vivify_215:
    $P392 = $P391."ast"()
    store_lex "$past", $P392
.annotate 'line', 121
    get_global $P393, "@BLOCK"
    $P394 = $P393."shift"()
    store_lex "$BLOCK", $P394
.annotate 'line', 122
    find_lex $P395, "$BLOCK"
    find_lex $P396, "$past"
    $P395."push"($P396)
.annotate 'line', 123
    find_lex $P397, "$BLOCK"
    find_lex $P398, "$/"
    $P397."node"($P398)
.annotate 'line', 124
    find_lex $P399, "$BLOCK"
    $P399."closure"(1)
.annotate 'line', 125
    find_lex $P400, "$/"
    find_lex $P401, "$BLOCK"
    $P402 = $P400."!make"($P401)
.annotate 'line', 119
    .return ($P402)
  control_385:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P403, exception, "payload"
    .return ($P403)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "newpad"  :subid("31_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_407
.annotate 'line', 128
    new $P406, 'ExceptionHandler'
    set_addr $P406, control_405
    $P406."handle_types"(.CONTROL_RETURN)
    push_eh $P406
    .lex "self", self
    .lex "$/", param_407
.annotate 'line', 129
    get_global $P408, "@BLOCK"
    unless_null $P408, vivify_216
    $P408 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P408
  vivify_216:
.annotate 'line', 128
    get_global $P409, "@BLOCK"
.annotate 'line', 130
    get_global $P410, "@BLOCK"
    get_hll_global $P411, ["PAST"], "Block"
    get_hll_global $P412, ["PAST"], "Stmts"
    $P413 = $P412."new"()
    $P414 = $P411."new"($P413)
    $P415 = $P410."unshift"($P414)
.annotate 'line', 128
    .return ($P415)
  control_405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P416, exception, "payload"
    .return ($P416)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "outerctx"  :subid("32_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_420
.annotate 'line', 133
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(.CONTROL_RETURN)
    push_eh $P419
    .lex "self", self
    .lex "$/", param_420
.annotate 'line', 134
    get_global $P421, "@BLOCK"
    unless_null $P421, vivify_217
    $P421 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P421
  vivify_217:
.annotate 'line', 133
    get_global $P422, "@BLOCK"
.annotate 'line', 135
    find_lex $P423, "self"
    get_global $P424, "@BLOCK"
    unless_null $P424, vivify_218
    $P424 = root_new ['parrot';'ResizablePMCArray']
  vivify_218:
    set $P425, $P424[0]
    unless_null $P425, vivify_219
    new $P425, "Undef"
  vivify_219:
    $P426 = $P423."SET_BLOCK_OUTER_CTX"($P425)
.annotate 'line', 133
    .return ($P426)
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P427, exception, "payload"
    .return ($P427)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<if>"  :subid("33_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_431
.annotate 'line', 140
    .const 'Sub' $P459 = "34_1275811497.55064" 
    capture_lex $P459
    new $P430, 'ExceptionHandler'
    set_addr $P430, control_429
    $P430."handle_types"(.CONTROL_RETURN)
    push_eh $P430
    .lex "self", self
    .lex "$/", param_431
.annotate 'line', 141
    new $P432, "Undef"
    .lex "$count", $P432
.annotate 'line', 142
    new $P433, "Undef"
    .lex "$past", $P433
.annotate 'line', 141
    find_lex $P434, "$/"
    unless_null $P434, vivify_220
    $P434 = root_new ['parrot';'Hash']
  vivify_220:
    set $P435, $P434["xblock"]
    unless_null $P435, vivify_221
    new $P435, "Undef"
  vivify_221:
    set $N436, $P435
    new $P437, 'Float'
    set $P437, $N436
    sub $P438, $P437, 1
    store_lex "$count", $P438
.annotate 'line', 142
    find_lex $P439, "$count"
    set $I440, $P439
    find_lex $P441, "$/"
    unless_null $P441, vivify_222
    $P441 = root_new ['parrot';'Hash']
  vivify_222:
    set $P442, $P441["xblock"]
    unless_null $P442, vivify_223
    $P442 = root_new ['parrot';'ResizablePMCArray']
  vivify_223:
    set $P443, $P442[$I440]
    unless_null $P443, vivify_224
    new $P443, "Undef"
  vivify_224:
    $P444 = $P443."ast"()
    $P445 = "xblock_immediate"($P444)
    store_lex "$past", $P445
.annotate 'line', 143
    find_lex $P447, "$/"
    unless_null $P447, vivify_225
    $P447 = root_new ['parrot';'Hash']
  vivify_225:
    set $P448, $P447["else"]
    unless_null $P448, vivify_226
    new $P448, "Undef"
  vivify_226:
    unless $P448, if_446_end
.annotate 'line', 144
    find_lex $P449, "$past"
    find_lex $P450, "$/"
    unless_null $P450, vivify_227
    $P450 = root_new ['parrot';'Hash']
  vivify_227:
    set $P451, $P450["else"]
    unless_null $P451, vivify_228
    $P451 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P452, $P451[0]
    unless_null $P452, vivify_229
    new $P452, "Undef"
  vivify_229:
    $P453 = $P452."ast"()
    $P454 = "block_immediate"($P453)
    $P449."push"($P454)
  if_446_end:
.annotate 'line', 147
    new $P475, 'ExceptionHandler'
    set_addr $P475, loop474_handler
    $P475."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P475
  loop474_test:
    find_lex $P455, "$count"
    set $N456, $P455
    isgt $I457, $N456, 0.0
    unless $I457, loop474_done
  loop474_redo:
    .const 'Sub' $P459 = "34_1275811497.55064" 
    capture_lex $P459
    $P459()
  loop474_next:
    goto loop474_test
  loop474_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P476, exception, 'type'
    eq $P476, .CONTROL_LOOP_NEXT, loop474_next
    eq $P476, .CONTROL_LOOP_REDO, loop474_redo
  loop474_done:
    pop_eh 
.annotate 'line', 153
    find_lex $P477, "$/"
    find_lex $P478, "$past"
    $P479 = $P477."!make"($P478)
.annotate 'line', 140
    .return ($P479)
  control_429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P480, exception, "payload"
    .return ($P480)
.end


.namespace ["NQP";"Actions"]
.sub "_block458"  :anon :subid("34_1275811497.55064") :outer("33_1275811497.55064")
.annotate 'line', 149
    new $P460, "Undef"
    .lex "$else", $P460
.annotate 'line', 147
    find_lex $P461, "$count"
    clone $P462, $P461
    dec $P461
.annotate 'line', 149
    find_lex $P463, "$past"
    store_lex "$else", $P463
.annotate 'line', 150
    find_lex $P464, "$count"
    set $I465, $P464
    find_lex $P466, "$/"
    unless_null $P466, vivify_230
    $P466 = root_new ['parrot';'Hash']
  vivify_230:
    set $P467, $P466["xblock"]
    unless_null $P467, vivify_231
    $P467 = root_new ['parrot';'ResizablePMCArray']
  vivify_231:
    set $P468, $P467[$I465]
    unless_null $P468, vivify_232
    new $P468, "Undef"
  vivify_232:
    $P469 = $P468."ast"()
    $P470 = "xblock_immediate"($P469)
    store_lex "$past", $P470
.annotate 'line', 151
    find_lex $P471, "$past"
    find_lex $P472, "$else"
    $P473 = $P471."push"($P472)
.annotate 'line', 147
    .return ($P473)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<unless>"  :subid("35_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_484
.annotate 'line', 156
    new $P483, 'ExceptionHandler'
    set_addr $P483, control_482
    $P483."handle_types"(.CONTROL_RETURN)
    push_eh $P483
    .lex "self", self
    .lex "$/", param_484
.annotate 'line', 157
    new $P485, "Undef"
    .lex "$past", $P485
    find_lex $P486, "$/"
    unless_null $P486, vivify_233
    $P486 = root_new ['parrot';'Hash']
  vivify_233:
    set $P487, $P486["xblock"]
    unless_null $P487, vivify_234
    new $P487, "Undef"
  vivify_234:
    $P488 = $P487."ast"()
    $P489 = "xblock_immediate"($P488)
    store_lex "$past", $P489
.annotate 'line', 158
    find_lex $P490, "$past"
    $P490."pasttype"("unless")
.annotate 'line', 159
    find_lex $P491, "$/"
    find_lex $P492, "$past"
    $P493 = $P491."!make"($P492)
.annotate 'line', 156
    .return ($P493)
  control_482:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P494, exception, "payload"
    .return ($P494)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<while>"  :subid("36_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_498
.annotate 'line', 162
    new $P497, 'ExceptionHandler'
    set_addr $P497, control_496
    $P497."handle_types"(.CONTROL_RETURN)
    push_eh $P497
    .lex "self", self
    .lex "$/", param_498
.annotate 'line', 163
    new $P499, "Undef"
    .lex "$past", $P499
    find_lex $P500, "$/"
    unless_null $P500, vivify_235
    $P500 = root_new ['parrot';'Hash']
  vivify_235:
    set $P501, $P500["xblock"]
    unless_null $P501, vivify_236
    new $P501, "Undef"
  vivify_236:
    $P502 = $P501."ast"()
    $P503 = "xblock_immediate"($P502)
    store_lex "$past", $P503
.annotate 'line', 164
    find_lex $P504, "$past"
    find_lex $P505, "$/"
    unless_null $P505, vivify_237
    $P505 = root_new ['parrot';'Hash']
  vivify_237:
    set $P506, $P505["sym"]
    unless_null $P506, vivify_238
    new $P506, "Undef"
  vivify_238:
    set $S507, $P506
    $P504."pasttype"($S507)
.annotate 'line', 165
    find_lex $P508, "$/"
    find_lex $P509, "$past"
    $P510 = $P508."!make"($P509)
.annotate 'line', 162
    .return ($P510)
  control_496:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P511, exception, "payload"
    .return ($P511)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<repeat>"  :subid("37_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_515
.annotate 'line', 168
    new $P514, 'ExceptionHandler'
    set_addr $P514, control_513
    $P514."handle_types"(.CONTROL_RETURN)
    push_eh $P514
    .lex "self", self
    .lex "$/", param_515
.annotate 'line', 169
    new $P516, "Undef"
    .lex "$pasttype", $P516
.annotate 'line', 170
    new $P517, "Undef"
    .lex "$past", $P517
.annotate 'line', 169
    new $P518, "String"
    assign $P518, "repeat_"
    find_lex $P519, "$/"
    unless_null $P519, vivify_239
    $P519 = root_new ['parrot';'Hash']
  vivify_239:
    set $P520, $P519["wu"]
    unless_null $P520, vivify_240
    new $P520, "Undef"
  vivify_240:
    set $S521, $P520
    concat $P522, $P518, $S521
    store_lex "$pasttype", $P522
    find_lex $P523, "$past"
.annotate 'line', 171
    find_lex $P525, "$/"
    unless_null $P525, vivify_241
    $P525 = root_new ['parrot';'Hash']
  vivify_241:
    set $P526, $P525["xblock"]
    unless_null $P526, vivify_242
    new $P526, "Undef"
  vivify_242:
    if $P526, if_524
.annotate 'line', 176
    get_hll_global $P533, ["PAST"], "Op"
    find_lex $P534, "$/"
    unless_null $P534, vivify_243
    $P534 = root_new ['parrot';'Hash']
  vivify_243:
    set $P535, $P534["EXPR"]
    unless_null $P535, vivify_244
    new $P535, "Undef"
  vivify_244:
    $P536 = $P535."ast"()
    find_lex $P537, "$/"
    unless_null $P537, vivify_245
    $P537 = root_new ['parrot';'Hash']
  vivify_245:
    set $P538, $P537["pblock"]
    unless_null $P538, vivify_246
    new $P538, "Undef"
  vivify_246:
    $P539 = $P538."ast"()
    $P540 = "block_immediate"($P539)
    find_lex $P541, "$pasttype"
    find_lex $P542, "$/"
    $P543 = $P533."new"($P536, $P540, $P541 :named("pasttype"), $P542 :named("node"))
    store_lex "$past", $P543
.annotate 'line', 175
    goto if_524_end
  if_524:
.annotate 'line', 172
    find_lex $P527, "$/"
    unless_null $P527, vivify_247
    $P527 = root_new ['parrot';'Hash']
  vivify_247:
    set $P528, $P527["xblock"]
    unless_null $P528, vivify_248
    new $P528, "Undef"
  vivify_248:
    $P529 = $P528."ast"()
    $P530 = "xblock_immediate"($P529)
    store_lex "$past", $P530
.annotate 'line', 173
    find_lex $P531, "$past"
    find_lex $P532, "$pasttype"
    $P531."pasttype"($P532)
  if_524_end:
.annotate 'line', 179
    find_lex $P544, "$/"
    find_lex $P545, "$past"
    $P546 = $P544."!make"($P545)
.annotate 'line', 168
    .return ($P546)
  control_513:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P547, exception, "payload"
    .return ($P547)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<for>"  :subid("38_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_551
.annotate 'line', 182
    new $P550, 'ExceptionHandler'
    set_addr $P550, control_549
    $P550."handle_types"(.CONTROL_RETURN)
    push_eh $P550
    .lex "self", self
    .lex "$/", param_551
.annotate 'line', 183
    new $P552, "Undef"
    .lex "$past", $P552
.annotate 'line', 185
    new $P553, "Undef"
    .lex "$block", $P553
.annotate 'line', 183
    find_lex $P554, "$/"
    unless_null $P554, vivify_249
    $P554 = root_new ['parrot';'Hash']
  vivify_249:
    set $P555, $P554["xblock"]
    unless_null $P555, vivify_250
    new $P555, "Undef"
  vivify_250:
    $P556 = $P555."ast"()
    store_lex "$past", $P556
.annotate 'line', 184
    find_lex $P557, "$past"
    $P557."pasttype"("for")
.annotate 'line', 185
    find_lex $P558, "$past"
    unless_null $P558, vivify_251
    $P558 = root_new ['parrot';'ResizablePMCArray']
  vivify_251:
    set $P559, $P558[1]
    unless_null $P559, vivify_252
    new $P559, "Undef"
  vivify_252:
    store_lex "$block", $P559
.annotate 'line', 186
    find_lex $P561, "$block"
    $P562 = $P561."arity"()
    if $P562, unless_560_end
.annotate 'line', 187
    find_lex $P563, "$block"
    unless_null $P563, vivify_253
    $P563 = root_new ['parrot';'ResizablePMCArray']
  vivify_253:
    set $P564, $P563[0]
    unless_null $P564, vivify_254
    new $P564, "Undef"
  vivify_254:
    get_hll_global $P565, ["PAST"], "Var"
    $P566 = $P565."new"("$_" :named("name"), "parameter" :named("scope"))
    $P564."push"($P566)
.annotate 'line', 188
    find_lex $P567, "$block"
    $P567."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 189
    find_lex $P568, "$block"
    $P568."arity"(1)
  unless_560_end:
.annotate 'line', 191
    find_lex $P569, "$block"
    $P569."blocktype"("immediate")
.annotate 'line', 192
    find_lex $P570, "$/"
    find_lex $P571, "$past"
    $P572 = $P570."!make"($P571)
.annotate 'line', 182
    .return ($P572)
  control_549:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<return>"  :subid("39_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_577
.annotate 'line', 195
    new $P576, 'ExceptionHandler'
    set_addr $P576, control_575
    $P576."handle_types"(.CONTROL_RETURN)
    push_eh $P576
    .lex "self", self
    .lex "$/", param_577
.annotate 'line', 196
    find_lex $P578, "$/"
    get_hll_global $P579, ["PAST"], "Op"
    find_lex $P580, "$/"
    unless_null $P580, vivify_255
    $P580 = root_new ['parrot';'Hash']
  vivify_255:
    set $P581, $P580["EXPR"]
    unless_null $P581, vivify_256
    new $P581, "Undef"
  vivify_256:
    $P582 = $P581."ast"()
    find_lex $P583, "$/"
    $P584 = $P579."new"($P582, "return" :named("pasttype"), $P583 :named("node"))
    $P585 = $P578."!make"($P584)
.annotate 'line', 195
    .return ($P585)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P586, exception, "payload"
    .return ($P586)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CATCH>"  :subid("40_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_590
.annotate 'line', 199
    new $P589, 'ExceptionHandler'
    set_addr $P589, control_588
    $P589."handle_types"(.CONTROL_RETURN)
    push_eh $P589
    .lex "self", self
    .lex "$/", param_590
.annotate 'line', 200
    new $P591, "Undef"
    .lex "$block", $P591
    find_lex $P592, "$/"
    unless_null $P592, vivify_257
    $P592 = root_new ['parrot';'Hash']
  vivify_257:
    set $P593, $P592["block"]
    unless_null $P593, vivify_258
    new $P593, "Undef"
  vivify_258:
    $P594 = $P593."ast"()
    store_lex "$block", $P594
.annotate 'line', 201
    find_lex $P595, "$/"
    find_lex $P596, "$block"
    "push_block_handler"($P595, $P596)
.annotate 'line', 202
    get_global $P597, "@BLOCK"
    unless_null $P597, vivify_259
    $P597 = root_new ['parrot';'ResizablePMCArray']
  vivify_259:
    set $P598, $P597[0]
    unless_null $P598, vivify_260
    new $P598, "Undef"
  vivify_260:
    $P599 = $P598."handlers"()
    set $P600, $P599[0]
    unless_null $P600, vivify_261
    new $P600, "Undef"
  vivify_261:
    $P600."handle_types_except"("CONTROL")
.annotate 'line', 203
    find_lex $P601, "$/"
    get_hll_global $P602, ["PAST"], "Stmts"
    find_lex $P603, "$/"
    $P604 = $P602."new"($P603 :named("node"))
    $P605 = $P601."!make"($P604)
.annotate 'line', 199
    .return ($P605)
  control_588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P606, exception, "payload"
    .return ($P606)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CONTROL>"  :subid("41_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_610
.annotate 'line', 206
    new $P609, 'ExceptionHandler'
    set_addr $P609, control_608
    $P609."handle_types"(.CONTROL_RETURN)
    push_eh $P609
    .lex "self", self
    .lex "$/", param_610
.annotate 'line', 207
    new $P611, "Undef"
    .lex "$block", $P611
    find_lex $P612, "$/"
    unless_null $P612, vivify_262
    $P612 = root_new ['parrot';'Hash']
  vivify_262:
    set $P613, $P612["block"]
    unless_null $P613, vivify_263
    new $P613, "Undef"
  vivify_263:
    $P614 = $P613."ast"()
    store_lex "$block", $P614
.annotate 'line', 208
    find_lex $P615, "$/"
    find_lex $P616, "$block"
    "push_block_handler"($P615, $P616)
.annotate 'line', 209
    get_global $P617, "@BLOCK"
    unless_null $P617, vivify_264
    $P617 = root_new ['parrot';'ResizablePMCArray']
  vivify_264:
    set $P618, $P617[0]
    unless_null $P618, vivify_265
    new $P618, "Undef"
  vivify_265:
    $P619 = $P618."handlers"()
    set $P620, $P619[0]
    unless_null $P620, vivify_266
    new $P620, "Undef"
  vivify_266:
    $P620."handle_types"("CONTROL")
.annotate 'line', 210
    find_lex $P621, "$/"
    get_hll_global $P622, ["PAST"], "Stmts"
    find_lex $P623, "$/"
    $P624 = $P622."new"($P623 :named("node"))
    $P625 = $P621."!make"($P624)
.annotate 'line', 206
    .return ($P625)
  control_608:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P626, exception, "payload"
    .return ($P626)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<INIT>"  :subid("42_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_631
.annotate 'line', 250
    new $P630, 'ExceptionHandler'
    set_addr $P630, control_629
    $P630."handle_types"(.CONTROL_RETURN)
    push_eh $P630
    .lex "self", self
    .lex "$/", param_631
.annotate 'line', 251
    get_global $P632, "@BLOCK"
    unless_null $P632, vivify_267
    $P632 = root_new ['parrot';'ResizablePMCArray']
  vivify_267:
    set $P633, $P632[0]
    unless_null $P633, vivify_268
    new $P633, "Undef"
  vivify_268:
    $P634 = $P633."loadinit"()
    find_lex $P635, "$/"
    unless_null $P635, vivify_269
    $P635 = root_new ['parrot';'Hash']
  vivify_269:
    set $P636, $P635["blorst"]
    unless_null $P636, vivify_270
    new $P636, "Undef"
  vivify_270:
    $P637 = $P636."ast"()
    $P634."push"($P637)
.annotate 'line', 252
    find_lex $P638, "$/"
    get_hll_global $P639, ["PAST"], "Stmts"
    find_lex $P640, "$/"
    $P641 = $P639."new"($P640 :named("node"))
    $P642 = $P638."!make"($P641)
.annotate 'line', 250
    .return ($P642)
  control_629:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P643, exception, "payload"
    .return ($P643)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<try>"  :subid("43_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_647
.annotate 'line', 255
    new $P646, 'ExceptionHandler'
    set_addr $P646, control_645
    $P646."handle_types"(.CONTROL_RETURN)
    push_eh $P646
    .lex "self", self
    .lex "$/", param_647
.annotate 'line', 256
    new $P648, "Undef"
    .lex "$past", $P648
    find_lex $P649, "$/"
    unless_null $P649, vivify_271
    $P649 = root_new ['parrot';'Hash']
  vivify_271:
    set $P650, $P649["blorst"]
    unless_null $P650, vivify_272
    new $P650, "Undef"
  vivify_272:
    $P651 = $P650."ast"()
    store_lex "$past", $P651
.annotate 'line', 257
    find_lex $P653, "$past"
    $S654 = $P653."WHAT"()
    isne $I655, $S654, "PAST::Block()"
    unless $I655, if_652_end
.annotate 'line', 258
    get_hll_global $P656, ["PAST"], "Block"
    find_lex $P657, "$past"
    find_lex $P658, "$/"
    $P659 = $P656."new"($P657, "immediate" :named("blocktype"), $P658 :named("node"))
    store_lex "$past", $P659
  if_652_end:
.annotate 'line', 260
    find_lex $P661, "$past"
    $P662 = $P661."handlers"()
    if $P662, unless_660_end
.annotate 'line', 261
    find_lex $P663, "$past"
    get_hll_global $P664, ["PAST"], "Control"
.annotate 'line', 263
    get_hll_global $P665, ["PAST"], "Stmts"
.annotate 'line', 264
    get_hll_global $P666, ["PAST"], "Op"
.annotate 'line', 265
    get_hll_global $P667, ["PAST"], "Var"
.annotate 'line', 266
    get_hll_global $P668, ["PAST"], "Var"
    $P669 = $P668."new"("register" :named("scope"), "exception" :named("name"))
    $P670 = $P667."new"($P669, "handled", "keyed" :named("scope"))
.annotate 'line', 265
    $P671 = $P666."new"($P670, 1, "bind" :named("pasttype"))
.annotate 'line', 264
    $P672 = $P665."new"($P671)
.annotate 'line', 263
    $P673 = $P664."new"($P672, "CONTROL" :named("handle_types_except"))
.annotate 'line', 261
    new $P674, "ResizablePMCArray"
    push $P674, $P673
    $P663."handlers"($P674)
  unless_660_end:
.annotate 'line', 275
    find_lex $P675, "$/"
    find_lex $P676, "$past"
    $P677 = $P675."!make"($P676)
.annotate 'line', 255
    .return ($P677)
  control_645:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P678, exception, "payload"
    .return ($P678)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blorst"  :subid("44_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_682
.annotate 'line', 278
    new $P681, 'ExceptionHandler'
    set_addr $P681, control_680
    $P681."handle_types"(.CONTROL_RETURN)
    push_eh $P681
    .lex "self", self
    .lex "$/", param_682
.annotate 'line', 279
    find_lex $P683, "$/"
.annotate 'line', 280
    find_lex $P686, "$/"
    unless_null $P686, vivify_273
    $P686 = root_new ['parrot';'Hash']
  vivify_273:
    set $P687, $P686["block"]
    unless_null $P687, vivify_274
    new $P687, "Undef"
  vivify_274:
    if $P687, if_685
.annotate 'line', 281
    find_lex $P692, "$/"
    unless_null $P692, vivify_275
    $P692 = root_new ['parrot';'Hash']
  vivify_275:
    set $P693, $P692["statement"]
    unless_null $P693, vivify_276
    new $P693, "Undef"
  vivify_276:
    $P694 = $P693."ast"()
    set $P684, $P694
.annotate 'line', 280
    goto if_685_end
  if_685:
    find_lex $P688, "$/"
    unless_null $P688, vivify_277
    $P688 = root_new ['parrot';'Hash']
  vivify_277:
    set $P689, $P688["block"]
    unless_null $P689, vivify_278
    new $P689, "Undef"
  vivify_278:
    $P690 = $P689."ast"()
    $P691 = "block_immediate"($P690)
    set $P684, $P691
  if_685_end:
    $P695 = $P683."!make"($P684)
.annotate 'line', 278
    .return ($P695)
  control_680:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P696, exception, "payload"
    .return ($P696)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<if>"  :subid("45_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_700
.annotate 'line', 286
    new $P699, 'ExceptionHandler'
    set_addr $P699, control_698
    $P699."handle_types"(.CONTROL_RETURN)
    push_eh $P699
    .lex "self", self
    .lex "$/", param_700
    find_lex $P701, "$/"
    find_lex $P702, "$/"
    unless_null $P702, vivify_279
    $P702 = root_new ['parrot';'Hash']
  vivify_279:
    set $P703, $P702["cond"]
    unless_null $P703, vivify_280
    new $P703, "Undef"
  vivify_280:
    $P704 = $P703."ast"()
    $P705 = $P701."!make"($P704)
    .return ($P705)
  control_698:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P706, exception, "payload"
    .return ($P706)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<unless>"  :subid("46_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_710
.annotate 'line', 287
    new $P709, 'ExceptionHandler'
    set_addr $P709, control_708
    $P709."handle_types"(.CONTROL_RETURN)
    push_eh $P709
    .lex "self", self
    .lex "$/", param_710
    find_lex $P711, "$/"
    find_lex $P712, "$/"
    unless_null $P712, vivify_281
    $P712 = root_new ['parrot';'Hash']
  vivify_281:
    set $P713, $P712["cond"]
    unless_null $P713, vivify_282
    new $P713, "Undef"
  vivify_282:
    $P714 = $P713."ast"()
    $P715 = $P711."!make"($P714)
    .return ($P715)
  control_708:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P716, exception, "payload"
    .return ($P716)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<while>"  :subid("47_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_720
.annotate 'line', 289
    new $P719, 'ExceptionHandler'
    set_addr $P719, control_718
    $P719."handle_types"(.CONTROL_RETURN)
    push_eh $P719
    .lex "self", self
    .lex "$/", param_720
    find_lex $P721, "$/"
    find_lex $P722, "$/"
    unless_null $P722, vivify_283
    $P722 = root_new ['parrot';'Hash']
  vivify_283:
    set $P723, $P722["cond"]
    unless_null $P723, vivify_284
    new $P723, "Undef"
  vivify_284:
    $P724 = $P723."ast"()
    $P725 = $P721."!make"($P724)
    .return ($P725)
  control_718:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P726, exception, "payload"
    .return ($P726)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<until>"  :subid("48_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_730
.annotate 'line', 290
    new $P729, 'ExceptionHandler'
    set_addr $P729, control_728
    $P729."handle_types"(.CONTROL_RETURN)
    push_eh $P729
    .lex "self", self
    .lex "$/", param_730
    find_lex $P731, "$/"
    find_lex $P732, "$/"
    unless_null $P732, vivify_285
    $P732 = root_new ['parrot';'Hash']
  vivify_285:
    set $P733, $P732["cond"]
    unless_null $P733, vivify_286
    new $P733, "Undef"
  vivify_286:
    $P734 = $P733."ast"()
    $P735 = $P731."!make"($P734)
    .return ($P735)
  control_728:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P736, exception, "payload"
    .return ($P736)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<fatarrow>"  :subid("49_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_740
.annotate 'line', 294
    new $P739, 'ExceptionHandler'
    set_addr $P739, control_738
    $P739."handle_types"(.CONTROL_RETURN)
    push_eh $P739
    .lex "self", self
    .lex "$/", param_740
    find_lex $P741, "$/"
    find_lex $P742, "$/"
    unless_null $P742, vivify_287
    $P742 = root_new ['parrot';'Hash']
  vivify_287:
    set $P743, $P742["fatarrow"]
    unless_null $P743, vivify_288
    new $P743, "Undef"
  vivify_288:
    $P744 = $P743."ast"()
    $P745 = $P741."!make"($P744)
    .return ($P745)
  control_738:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P746, exception, "payload"
    .return ($P746)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<colonpair>"  :subid("50_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_750
.annotate 'line', 295
    new $P749, 'ExceptionHandler'
    set_addr $P749, control_748
    $P749."handle_types"(.CONTROL_RETURN)
    push_eh $P749
    .lex "self", self
    .lex "$/", param_750
    find_lex $P751, "$/"
    find_lex $P752, "$/"
    unless_null $P752, vivify_289
    $P752 = root_new ['parrot';'Hash']
  vivify_289:
    set $P753, $P752["colonpair"]
    unless_null $P753, vivify_290
    new $P753, "Undef"
  vivify_290:
    $P754 = $P753."ast"()
    $P755 = $P751."!make"($P754)
    .return ($P755)
  control_748:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P756, exception, "payload"
    .return ($P756)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<variable>"  :subid("51_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_760
.annotate 'line', 296
    new $P759, 'ExceptionHandler'
    set_addr $P759, control_758
    $P759."handle_types"(.CONTROL_RETURN)
    push_eh $P759
    .lex "self", self
    .lex "$/", param_760
    find_lex $P761, "$/"
    find_lex $P762, "$/"
    unless_null $P762, vivify_291
    $P762 = root_new ['parrot';'Hash']
  vivify_291:
    set $P763, $P762["variable"]
    unless_null $P763, vivify_292
    new $P763, "Undef"
  vivify_292:
    $P764 = $P763."ast"()
    $P765 = $P761."!make"($P764)
    .return ($P765)
  control_758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P766, exception, "payload"
    .return ($P766)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<package_declarator>"  :subid("52_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_770
.annotate 'line', 297
    new $P769, 'ExceptionHandler'
    set_addr $P769, control_768
    $P769."handle_types"(.CONTROL_RETURN)
    push_eh $P769
    .lex "self", self
    .lex "$/", param_770
    find_lex $P771, "$/"
    find_lex $P772, "$/"
    unless_null $P772, vivify_293
    $P772 = root_new ['parrot';'Hash']
  vivify_293:
    set $P773, $P772["package_declarator"]
    unless_null $P773, vivify_294
    new $P773, "Undef"
  vivify_294:
    $P774 = $P773."ast"()
    $P775 = $P771."!make"($P774)
    .return ($P775)
  control_768:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P776, exception, "payload"
    .return ($P776)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<scope_declarator>"  :subid("53_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_780
.annotate 'line', 298
    new $P779, 'ExceptionHandler'
    set_addr $P779, control_778
    $P779."handle_types"(.CONTROL_RETURN)
    push_eh $P779
    .lex "self", self
    .lex "$/", param_780
    find_lex $P781, "$/"
    find_lex $P782, "$/"
    unless_null $P782, vivify_295
    $P782 = root_new ['parrot';'Hash']
  vivify_295:
    set $P783, $P782["scope_declarator"]
    unless_null $P783, vivify_296
    new $P783, "Undef"
  vivify_296:
    $P784 = $P783."ast"()
    $P785 = $P781."!make"($P784)
    .return ($P785)
  control_778:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P786, exception, "payload"
    .return ($P786)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<routine_declarator>"  :subid("54_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_790
.annotate 'line', 299
    new $P789, 'ExceptionHandler'
    set_addr $P789, control_788
    $P789."handle_types"(.CONTROL_RETURN)
    push_eh $P789
    .lex "self", self
    .lex "$/", param_790
    find_lex $P791, "$/"
    find_lex $P792, "$/"
    unless_null $P792, vivify_297
    $P792 = root_new ['parrot';'Hash']
  vivify_297:
    set $P793, $P792["routine_declarator"]
    unless_null $P793, vivify_298
    new $P793, "Undef"
  vivify_298:
    $P794 = $P793."ast"()
    $P795 = $P791."!make"($P794)
    .return ($P795)
  control_788:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P796, exception, "payload"
    .return ($P796)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<regex_declarator>"  :subid("55_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_800
.annotate 'line', 300
    new $P799, 'ExceptionHandler'
    set_addr $P799, control_798
    $P799."handle_types"(.CONTROL_RETURN)
    push_eh $P799
    .lex "self", self
    .lex "$/", param_800
    find_lex $P801, "$/"
    find_lex $P802, "$/"
    unless_null $P802, vivify_299
    $P802 = root_new ['parrot';'Hash']
  vivify_299:
    set $P803, $P802["regex_declarator"]
    unless_null $P803, vivify_300
    new $P803, "Undef"
  vivify_300:
    $P804 = $P803."ast"()
    $P805 = $P801."!make"($P804)
    .return ($P805)
  control_798:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P806, exception, "payload"
    .return ($P806)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<statement_prefix>"  :subid("56_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_810
.annotate 'line', 301
    new $P809, 'ExceptionHandler'
    set_addr $P809, control_808
    $P809."handle_types"(.CONTROL_RETURN)
    push_eh $P809
    .lex "self", self
    .lex "$/", param_810
    find_lex $P811, "$/"
    find_lex $P812, "$/"
    unless_null $P812, vivify_301
    $P812 = root_new ['parrot';'Hash']
  vivify_301:
    set $P813, $P812["statement_prefix"]
    unless_null $P813, vivify_302
    new $P813, "Undef"
  vivify_302:
    $P814 = $P813."ast"()
    $P815 = $P811."!make"($P814)
    .return ($P815)
  control_808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P816, exception, "payload"
    .return ($P816)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<lambda>"  :subid("57_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_820
.annotate 'line', 302
    new $P819, 'ExceptionHandler'
    set_addr $P819, control_818
    $P819."handle_types"(.CONTROL_RETURN)
    push_eh $P819
    .lex "self", self
    .lex "$/", param_820
    find_lex $P821, "$/"
    find_lex $P822, "$/"
    unless_null $P822, vivify_303
    $P822 = root_new ['parrot';'Hash']
  vivify_303:
    set $P823, $P822["pblock"]
    unless_null $P823, vivify_304
    new $P823, "Undef"
  vivify_304:
    $P824 = $P823."ast"()
    $P825 = $P821."!make"($P824)
    .return ($P825)
  control_818:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "fatarrow"  :subid("58_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_830
.annotate 'line', 304
    new $P829, 'ExceptionHandler'
    set_addr $P829, control_828
    $P829."handle_types"(.CONTROL_RETURN)
    push_eh $P829
    .lex "self", self
    .lex "$/", param_830
.annotate 'line', 305
    new $P831, "Undef"
    .lex "$past", $P831
    find_lex $P832, "$/"
    unless_null $P832, vivify_305
    $P832 = root_new ['parrot';'Hash']
  vivify_305:
    set $P833, $P832["val"]
    unless_null $P833, vivify_306
    new $P833, "Undef"
  vivify_306:
    $P834 = $P833."ast"()
    store_lex "$past", $P834
.annotate 'line', 306
    find_lex $P835, "$past"
    find_lex $P836, "$/"
    unless_null $P836, vivify_307
    $P836 = root_new ['parrot';'Hash']
  vivify_307:
    set $P837, $P836["key"]
    unless_null $P837, vivify_308
    new $P837, "Undef"
  vivify_308:
    $P838 = $P837."Str"()
    $P835."named"($P838)
.annotate 'line', 307
    find_lex $P839, "$/"
    find_lex $P840, "$past"
    $P841 = $P839."!make"($P840)
.annotate 'line', 304
    .return ($P841)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "colonpair"  :subid("59_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_846
.annotate 'line', 310
    new $P845, 'ExceptionHandler'
    set_addr $P845, control_844
    $P845."handle_types"(.CONTROL_RETURN)
    push_eh $P845
    .lex "self", self
    .lex "$/", param_846
.annotate 'line', 311
    new $P847, "Undef"
    .lex "$past", $P847
.annotate 'line', 312
    find_lex $P850, "$/"
    unless_null $P850, vivify_309
    $P850 = root_new ['parrot';'Hash']
  vivify_309:
    set $P851, $P850["circumfix"]
    unless_null $P851, vivify_310
    new $P851, "Undef"
  vivify_310:
    if $P851, if_849
.annotate 'line', 313
    get_hll_global $P856, ["PAST"], "Val"
    find_lex $P857, "$/"
    unless_null $P857, vivify_311
    $P857 = root_new ['parrot';'Hash']
  vivify_311:
    set $P858, $P857["not"]
    unless_null $P858, vivify_312
    new $P858, "Undef"
  vivify_312:
    isfalse $I859, $P858
    $P860 = $P856."new"($I859 :named("value"))
    set $P848, $P860
.annotate 'line', 312
    goto if_849_end
  if_849:
    find_lex $P852, "$/"
    unless_null $P852, vivify_313
    $P852 = root_new ['parrot';'Hash']
  vivify_313:
    set $P853, $P852["circumfix"]
    unless_null $P853, vivify_314
    $P853 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P854, $P853[0]
    unless_null $P854, vivify_315
    new $P854, "Undef"
  vivify_315:
    $P855 = $P854."ast"()
    set $P848, $P855
  if_849_end:
    store_lex "$past", $P848
.annotate 'line', 314
    find_lex $P861, "$past"
    find_lex $P862, "$/"
    unless_null $P862, vivify_316
    $P862 = root_new ['parrot';'Hash']
  vivify_316:
    set $P863, $P862["identifier"]
    unless_null $P863, vivify_317
    new $P863, "Undef"
  vivify_317:
    set $S864, $P863
    $P861."named"($S864)
.annotate 'line', 315
    find_lex $P865, "$/"
    find_lex $P866, "$past"
    $P867 = $P865."!make"($P866)
.annotate 'line', 310
    .return ($P867)
  control_844:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P868, exception, "payload"
    .return ($P868)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable"  :subid("60_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_872
.annotate 'line', 318
    .const 'Sub' $P885 = "61_1275811497.55064" 
    capture_lex $P885
    new $P871, 'ExceptionHandler'
    set_addr $P871, control_870
    $P871."handle_types"(.CONTROL_RETURN)
    push_eh $P871
    .lex "self", self
    .lex "$/", param_872
.annotate 'line', 319
    new $P873, "Undef"
    .lex "$past", $P873
.annotate 'line', 318
    find_lex $P874, "$past"
.annotate 'line', 320
    find_lex $P876, "$/"
    unless_null $P876, vivify_318
    $P876 = root_new ['parrot';'Hash']
  vivify_318:
    set $P877, $P876["postcircumfix"]
    unless_null $P877, vivify_319
    new $P877, "Undef"
  vivify_319:
    if $P877, if_875
.annotate 'line', 324
    .const 'Sub' $P885 = "61_1275811497.55064" 
    capture_lex $P885
    $P885()
    goto if_875_end
  if_875:
.annotate 'line', 321
    find_lex $P878, "$/"
    unless_null $P878, vivify_336
    $P878 = root_new ['parrot';'Hash']
  vivify_336:
    set $P879, $P878["postcircumfix"]
    unless_null $P879, vivify_337
    new $P879, "Undef"
  vivify_337:
    $P880 = $P879."ast"()
    store_lex "$past", $P880
.annotate 'line', 322
    find_lex $P881, "$past"
    get_hll_global $P882, ["PAST"], "Var"
    $P883 = $P882."new"("$/" :named("name"))
    $P881."unshift"($P883)
  if_875_end:
.annotate 'line', 353
    find_lex $P954, "$/"
    find_lex $P955, "$past"
    $P956 = $P954."!make"($P955)
.annotate 'line', 318
    .return ($P956)
  control_870:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P957, exception, "payload"
    .return ($P957)
.end


.namespace ["NQP";"Actions"]
.sub "_block884"  :anon :subid("61_1275811497.55064") :outer("60_1275811497.55064")
.annotate 'line', 325
    $P886 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P886
    get_hll_global $P887, ["NQP"], "Compiler"
    find_lex $P888, "$/"
    set $S889, $P888
    $P890 = $P887."parse_name"($S889)
    store_lex "@name", $P890
.annotate 'line', 326
    get_hll_global $P891, ["PAST"], "Var"
    find_lex $P892, "@name"
    $P893 = $P892."pop"()
    set $S894, $P893
    $P895 = $P891."new"($S894 :named("name"))
    store_lex "$past", $P895
.annotate 'line', 327
    find_lex $P897, "@name"
    unless $P897, if_896_end
.annotate 'line', 328
    find_lex $P899, "@name"
    unless_null $P899, vivify_320
    $P899 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P900, $P899[0]
    unless_null $P900, vivify_321
    new $P900, "Undef"
  vivify_321:
    set $S901, $P900
    iseq $I902, $S901, "GLOBAL"
    unless $I902, if_898_end
    find_lex $P903, "@name"
    $P903."shift"()
  if_898_end:
.annotate 'line', 329
    find_lex $P904, "$past"
    find_lex $P905, "@name"
    $P904."namespace"($P905)
.annotate 'line', 330
    find_lex $P906, "$past"
    $P906."scope"("package")
.annotate 'line', 331
    find_lex $P907, "$past"
    find_lex $P908, "$/"
    unless_null $P908, vivify_322
    $P908 = root_new ['parrot';'Hash']
  vivify_322:
    set $P909, $P908["sigil"]
    unless_null $P909, vivify_323
    new $P909, "Undef"
  vivify_323:
    $P910 = "vivitype"($P909)
    $P907."viviself"($P910)
.annotate 'line', 332
    find_lex $P911, "$past"
    $P911."lvalue"(1)
  if_896_end:
.annotate 'line', 334
    find_lex $P914, "$/"
    unless_null $P914, vivify_324
    $P914 = root_new ['parrot';'Hash']
  vivify_324:
    set $P915, $P914["twigil"]
    unless_null $P915, vivify_325
    $P915 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P916, $P915[0]
    unless_null $P916, vivify_326
    new $P916, "Undef"
  vivify_326:
    set $S917, $P916
    iseq $I918, $S917, "*"
    if $I918, if_913
.annotate 'line', 347
    find_lex $P940, "$/"
    unless_null $P940, vivify_327
    $P940 = root_new ['parrot';'Hash']
  vivify_327:
    set $P941, $P940["twigil"]
    unless_null $P941, vivify_328
    $P941 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P942, $P941[0]
    unless_null $P942, vivify_329
    new $P942, "Undef"
  vivify_329:
    set $S943, $P942
    iseq $I944, $S943, "!"
    if $I944, if_939
    new $P938, 'Integer'
    set $P938, $I944
    goto if_939_end
  if_939:
.annotate 'line', 348
    find_lex $P945, "$past"
    get_hll_global $P946, ["PAST"], "Var"
    $P947 = $P946."new"("self" :named("name"))
    $P945."push"($P947)
.annotate 'line', 349
    find_lex $P948, "$past"
    $P948."scope"("attribute")
.annotate 'line', 350
    find_lex $P949, "$past"
    find_lex $P950, "$/"
    unless_null $P950, vivify_330
    $P950 = root_new ['parrot';'Hash']
  vivify_330:
    set $P951, $P950["sigil"]
    unless_null $P951, vivify_331
    new $P951, "Undef"
  vivify_331:
    $P952 = "vivitype"($P951)
    $P953 = $P949."viviself"($P952)
.annotate 'line', 347
    set $P938, $P953
  if_939_end:
    set $P912, $P938
.annotate 'line', 334
    goto if_913_end
  if_913:
.annotate 'line', 335
    find_lex $P919, "$past"
    $P919."scope"("contextual")
.annotate 'line', 336
    find_lex $P920, "$past"
.annotate 'line', 337
    get_hll_global $P921, ["PAST"], "Var"
.annotate 'line', 339
    find_lex $P922, "$/"
    unless_null $P922, vivify_332
    $P922 = root_new ['parrot';'Hash']
  vivify_332:
    set $P923, $P922["sigil"]
    unless_null $P923, vivify_333
    new $P923, "Undef"
  vivify_333:
    set $S924, $P923
    new $P925, 'String'
    set $P925, $S924
    find_lex $P926, "$/"
    unless_null $P926, vivify_334
    $P926 = root_new ['parrot';'Hash']
  vivify_334:
    set $P927, $P926["desigilname"]
    unless_null $P927, vivify_335
    new $P927, "Undef"
  vivify_335:
    concat $P928, $P925, $P927
.annotate 'line', 341
    get_hll_global $P929, ["PAST"], "Op"
    new $P930, "String"
    assign $P930, "Contextual "
    find_lex $P931, "$/"
    set $S932, $P931
    concat $P933, $P930, $S932
    concat $P934, $P933, " not found"
    $P935 = $P929."new"($P934, "die" :named("pirop"))
    $P936 = $P921."new"("package" :named("scope"), "" :named("namespace"), $P928 :named("name"), $P935 :named("viviself"))
.annotate 'line', 337
    $P937 = $P920."viviself"($P936)
.annotate 'line', 334
    set $P912, $P937
  if_913_end:
.annotate 'line', 324
    .return ($P912)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<module>"  :subid("62_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_961
.annotate 'line', 356
    new $P960, 'ExceptionHandler'
    set_addr $P960, control_959
    $P960."handle_types"(.CONTROL_RETURN)
    push_eh $P960
    .lex "self", self
    .lex "$/", param_961
    find_lex $P962, "$/"
    find_lex $P963, "$/"
    unless_null $P963, vivify_338
    $P963 = root_new ['parrot';'Hash']
  vivify_338:
    set $P964, $P963["package_def"]
    unless_null $P964, vivify_339
    new $P964, "Undef"
  vivify_339:
    $P965 = $P964."ast"()
    $P966 = $P962."!make"($P965)
    .return ($P966)
  control_959:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P967, exception, "payload"
    .return ($P967)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<class>"  :subid("63_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_971
.annotate 'line', 357
    new $P970, 'ExceptionHandler'
    set_addr $P970, control_969
    $P970."handle_types"(.CONTROL_RETURN)
    push_eh $P970
    .lex "self", self
    .lex "$/", param_971
.annotate 'line', 358
    new $P972, "Undef"
    .lex "$past", $P972
.annotate 'line', 359
    new $P973, "Undef"
    .lex "$classinit", $P973
.annotate 'line', 368
    new $P974, "Undef"
    .lex "$parent", $P974
.annotate 'line', 358
    find_lex $P975, "$/"
    unless_null $P975, vivify_340
    $P975 = root_new ['parrot';'Hash']
  vivify_340:
    set $P976, $P975["package_def"]
    unless_null $P976, vivify_341
    new $P976, "Undef"
  vivify_341:
    $P977 = $P976."ast"()
    store_lex "$past", $P977
.annotate 'line', 360
    get_hll_global $P978, ["PAST"], "Op"
.annotate 'line', 361
    get_hll_global $P979, ["PAST"], "Op"
    $P980 = $P979."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 364
    find_lex $P981, "$/"
    unless_null $P981, vivify_342
    $P981 = root_new ['parrot';'Hash']
  vivify_342:
    set $P982, $P981["package_def"]
    unless_null $P982, vivify_343
    $P982 = root_new ['parrot';'Hash']
  vivify_343:
    set $P983, $P982["name"]
    unless_null $P983, vivify_344
    new $P983, "Undef"
  vivify_344:
    set $S984, $P983
    $P985 = $P978."new"($P980, $S984, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 360
    store_lex "$classinit", $P985
.annotate 'line', 368
    find_lex $P988, "$/"
    unless_null $P988, vivify_345
    $P988 = root_new ['parrot';'Hash']
  vivify_345:
    set $P989, $P988["package_def"]
    unless_null $P989, vivify_346
    $P989 = root_new ['parrot';'Hash']
  vivify_346:
    set $P990, $P989["parent"]
    unless_null $P990, vivify_347
    $P990 = root_new ['parrot';'ResizablePMCArray']
  vivify_347:
    set $P991, $P990[0]
    unless_null $P991, vivify_348
    new $P991, "Undef"
  vivify_348:
    set $S992, $P991
    unless $S992, unless_987
    new $P986, 'String'
    set $P986, $S992
    goto unless_987_end
  unless_987:
.annotate 'line', 369
    find_lex $P995, "$/"
    unless_null $P995, vivify_349
    $P995 = root_new ['parrot';'Hash']
  vivify_349:
    set $P996, $P995["sym"]
    unless_null $P996, vivify_350
    new $P996, "Undef"
  vivify_350:
    set $S997, $P996
    iseq $I998, $S997, "grammar"
    if $I998, if_994
    new $P1000, "String"
    assign $P1000, ""
    set $P993, $P1000
    goto if_994_end
  if_994:
    new $P999, "String"
    assign $P999, "Regex::Cursor"
    set $P993, $P999
  if_994_end:
    set $P986, $P993
  unless_987_end:
    store_lex "$parent", $P986
.annotate 'line', 370
    find_lex $P1002, "$parent"
    unless $P1002, if_1001_end
.annotate 'line', 371
    find_lex $P1003, "$classinit"
    get_hll_global $P1004, ["PAST"], "Val"
    find_lex $P1005, "$parent"
    $P1006 = $P1004."new"($P1005 :named("value"), "parent" :named("named"))
    $P1003."push"($P1006)
  if_1001_end:
.annotate 'line', 373
    find_lex $P1008, "$past"
    unless_null $P1008, vivify_351
    $P1008 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1009, $P1008["attributes"]
    unless_null $P1009, vivify_352
    new $P1009, "Undef"
  vivify_352:
    unless $P1009, if_1007_end
.annotate 'line', 374
    find_lex $P1010, "$classinit"
    find_lex $P1011, "$past"
    unless_null $P1011, vivify_353
    $P1011 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1012, $P1011["attributes"]
    unless_null $P1012, vivify_354
    new $P1012, "Undef"
  vivify_354:
    $P1010."push"($P1012)
  if_1007_end:
.annotate 'line', 376
    get_global $P1013, "@BLOCK"
    unless_null $P1013, vivify_355
    $P1013 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_356
    new $P1014, "Undef"
  vivify_356:
    $P1015 = $P1014."loadinit"()
    find_lex $P1016, "$classinit"
    $P1015."push"($P1016)
.annotate 'line', 377
    find_lex $P1017, "$/"
    find_lex $P1018, "$past"
    $P1019 = $P1017."!make"($P1018)
.annotate 'line', 357
    .return ($P1019)
  control_969:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1020, exception, "payload"
    .return ($P1020)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_def"  :subid("64_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1024
.annotate 'line', 380
    new $P1023, 'ExceptionHandler'
    set_addr $P1023, control_1022
    $P1023."handle_types"(.CONTROL_RETURN)
    push_eh $P1023
    .lex "self", self
    .lex "$/", param_1024
.annotate 'line', 381
    new $P1025, "Undef"
    .lex "$past", $P1025
    find_lex $P1028, "$/"
    unless_null $P1028, vivify_357
    $P1028 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1029, $P1028["block"]
    unless_null $P1029, vivify_358
    new $P1029, "Undef"
  vivify_358:
    if $P1029, if_1027
    find_lex $P1033, "$/"
    unless_null $P1033, vivify_359
    $P1033 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1034, $P1033["comp_unit"]
    unless_null $P1034, vivify_360
    new $P1034, "Undef"
  vivify_360:
    $P1035 = $P1034."ast"()
    set $P1026, $P1035
    goto if_1027_end
  if_1027:
    find_lex $P1030, "$/"
    unless_null $P1030, vivify_361
    $P1030 = root_new ['parrot';'Hash']
  vivify_361:
    set $P1031, $P1030["block"]
    unless_null $P1031, vivify_362
    new $P1031, "Undef"
  vivify_362:
    $P1032 = $P1031."ast"()
    set $P1026, $P1032
  if_1027_end:
    store_lex "$past", $P1026
.annotate 'line', 382
    find_lex $P1036, "$past"
    find_lex $P1037, "$/"
    unless_null $P1037, vivify_363
    $P1037 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1038, $P1037["name"]
    unless_null $P1038, vivify_364
    $P1038 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1039, $P1038["identifier"]
    unless_null $P1039, vivify_365
    new $P1039, "Undef"
  vivify_365:
    $P1036."namespace"($P1039)
.annotate 'line', 383
    find_lex $P1040, "$past"
    $P1040."blocktype"("immediate")
.annotate 'line', 384
    find_lex $P1041, "$/"
    find_lex $P1042, "$past"
    $P1043 = $P1041."!make"($P1042)
.annotate 'line', 380
    .return ($P1043)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1044, exception, "payload"
    .return ($P1044)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<my>"  :subid("65_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1048
.annotate 'line', 387
    new $P1047, 'ExceptionHandler'
    set_addr $P1047, control_1046
    $P1047."handle_types"(.CONTROL_RETURN)
    push_eh $P1047
    .lex "self", self
    .lex "$/", param_1048
    find_lex $P1049, "$/"
    find_lex $P1050, "$/"
    unless_null $P1050, vivify_366
    $P1050 = root_new ['parrot';'Hash']
  vivify_366:
    set $P1051, $P1050["scoped"]
    unless_null $P1051, vivify_367
    new $P1051, "Undef"
  vivify_367:
    $P1052 = $P1051."ast"()
    $P1053 = $P1049."!make"($P1052)
    .return ($P1053)
  control_1046:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1054, exception, "payload"
    .return ($P1054)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<our>"  :subid("66_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1058
.annotate 'line', 388
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(.CONTROL_RETURN)
    push_eh $P1057
    .lex "self", self
    .lex "$/", param_1058
    find_lex $P1059, "$/"
    find_lex $P1060, "$/"
    unless_null $P1060, vivify_368
    $P1060 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1061, $P1060["scoped"]
    unless_null $P1061, vivify_369
    new $P1061, "Undef"
  vivify_369:
    $P1062 = $P1061."ast"()
    $P1063 = $P1059."!make"($P1062)
    .return ($P1063)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1064, exception, "payload"
    .return ($P1064)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<has>"  :subid("67_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1068
.annotate 'line', 389
    new $P1067, 'ExceptionHandler'
    set_addr $P1067, control_1066
    $P1067."handle_types"(.CONTROL_RETURN)
    push_eh $P1067
    .lex "self", self
    .lex "$/", param_1068
    find_lex $P1069, "$/"
    find_lex $P1070, "$/"
    unless_null $P1070, vivify_370
    $P1070 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1071, $P1070["scoped"]
    unless_null $P1071, vivify_371
    new $P1071, "Undef"
  vivify_371:
    $P1072 = $P1071."ast"()
    $P1073 = $P1069."!make"($P1072)
    .return ($P1073)
  control_1066:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scoped"  :subid("68_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1078
.annotate 'line', 391
    new $P1077, 'ExceptionHandler'
    set_addr $P1077, control_1076
    $P1077."handle_types"(.CONTROL_RETURN)
    push_eh $P1077
    .lex "self", self
    .lex "$/", param_1078
.annotate 'line', 392
    find_lex $P1079, "$/"
.annotate 'line', 393
    find_lex $P1082, "$/"
    unless_null $P1082, vivify_372
    $P1082 = root_new ['parrot';'Hash']
  vivify_372:
    set $P1083, $P1082["declarator"]
    unless_null $P1083, vivify_373
    new $P1083, "Undef"
  vivify_373:
    if $P1083, if_1081
.annotate 'line', 394
    find_lex $P1087, "$/"
    unless_null $P1087, vivify_374
    $P1087 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1088, $P1087["multi_declarator"]
    unless_null $P1088, vivify_375
    new $P1088, "Undef"
  vivify_375:
    $P1089 = $P1088."ast"()
    set $P1080, $P1089
.annotate 'line', 393
    goto if_1081_end
  if_1081:
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_376
    $P1084 = root_new ['parrot';'Hash']
  vivify_376:
    set $P1085, $P1084["declarator"]
    unless_null $P1085, vivify_377
    new $P1085, "Undef"
  vivify_377:
    $P1086 = $P1085."ast"()
    set $P1080, $P1086
  if_1081_end:
    $P1090 = $P1079."!make"($P1080)
.annotate 'line', 391
    .return ($P1090)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1091, exception, "payload"
    .return ($P1091)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "declarator"  :subid("69_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1095
.annotate 'line', 397
    new $P1094, 'ExceptionHandler'
    set_addr $P1094, control_1093
    $P1094."handle_types"(.CONTROL_RETURN)
    push_eh $P1094
    .lex "self", self
    .lex "$/", param_1095
.annotate 'line', 398
    find_lex $P1096, "$/"
.annotate 'line', 399
    find_lex $P1099, "$/"
    unless_null $P1099, vivify_378
    $P1099 = root_new ['parrot';'Hash']
  vivify_378:
    set $P1100, $P1099["routine_declarator"]
    unless_null $P1100, vivify_379
    new $P1100, "Undef"
  vivify_379:
    if $P1100, if_1098
.annotate 'line', 400
    find_lex $P1104, "$/"
    unless_null $P1104, vivify_380
    $P1104 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1105, $P1104["variable_declarator"]
    unless_null $P1105, vivify_381
    new $P1105, "Undef"
  vivify_381:
    $P1106 = $P1105."ast"()
    set $P1097, $P1106
.annotate 'line', 399
    goto if_1098_end
  if_1098:
    find_lex $P1101, "$/"
    unless_null $P1101, vivify_382
    $P1101 = root_new ['parrot';'Hash']
  vivify_382:
    set $P1102, $P1101["routine_declarator"]
    unless_null $P1102, vivify_383
    new $P1102, "Undef"
  vivify_383:
    $P1103 = $P1102."ast"()
    set $P1097, $P1103
  if_1098_end:
    $P1107 = $P1096."!make"($P1097)
.annotate 'line', 397
    .return ($P1107)
  control_1093:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1108, exception, "payload"
    .return ($P1108)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<multi>"  :subid("70_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1112
.annotate 'line', 403
    new $P1111, 'ExceptionHandler'
    set_addr $P1111, control_1110
    $P1111."handle_types"(.CONTROL_RETURN)
    push_eh $P1111
    .lex "self", self
    .lex "$/", param_1112
    find_lex $P1113, "$/"
    find_lex $P1116, "$/"
    unless_null $P1116, vivify_384
    $P1116 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1117, $P1116["declarator"]
    unless_null $P1117, vivify_385
    new $P1117, "Undef"
  vivify_385:
    if $P1117, if_1115
    find_lex $P1121, "$/"
    unless_null $P1121, vivify_386
    $P1121 = root_new ['parrot';'Hash']
  vivify_386:
    set $P1122, $P1121["routine_def"]
    unless_null $P1122, vivify_387
    new $P1122, "Undef"
  vivify_387:
    $P1123 = $P1122."ast"()
    set $P1114, $P1123
    goto if_1115_end
  if_1115:
    find_lex $P1118, "$/"
    unless_null $P1118, vivify_388
    $P1118 = root_new ['parrot';'Hash']
  vivify_388:
    set $P1119, $P1118["declarator"]
    unless_null $P1119, vivify_389
    new $P1119, "Undef"
  vivify_389:
    $P1120 = $P1119."ast"()
    set $P1114, $P1120
  if_1115_end:
    $P1124 = $P1113."!make"($P1114)
    .return ($P1124)
  control_1110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1125, exception, "payload"
    .return ($P1125)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<null>"  :subid("71_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1129
.annotate 'line', 404
    new $P1128, 'ExceptionHandler'
    set_addr $P1128, control_1127
    $P1128."handle_types"(.CONTROL_RETURN)
    push_eh $P1128
    .lex "self", self
    .lex "$/", param_1129
    find_lex $P1130, "$/"
    find_lex $P1131, "$/"
    unless_null $P1131, vivify_390
    $P1131 = root_new ['parrot';'Hash']
  vivify_390:
    set $P1132, $P1131["declarator"]
    unless_null $P1132, vivify_391
    new $P1132, "Undef"
  vivify_391:
    $P1133 = $P1132."ast"()
    $P1134 = $P1130."!make"($P1133)
    .return ($P1134)
  control_1127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1135, exception, "payload"
    .return ($P1135)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable_declarator"  :subid("72_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1139
.annotate 'line', 407
    .const 'Sub' $P1179 = "73_1275811497.55064" 
    capture_lex $P1179
    new $P1138, 'ExceptionHandler'
    set_addr $P1138, control_1137
    $P1138."handle_types"(.CONTROL_RETURN)
    push_eh $P1138
    .lex "self", self
    .lex "$/", param_1139
.annotate 'line', 408
    new $P1140, "Undef"
    .lex "$past", $P1140
.annotate 'line', 409
    new $P1141, "Undef"
    .lex "$sigil", $P1141
.annotate 'line', 410
    new $P1142, "Undef"
    .lex "$name", $P1142
.annotate 'line', 411
    new $P1143, "Undef"
    .lex "$BLOCK", $P1143
.annotate 'line', 408
    find_lex $P1144, "$/"
    unless_null $P1144, vivify_392
    $P1144 = root_new ['parrot';'Hash']
  vivify_392:
    set $P1145, $P1144["variable"]
    unless_null $P1145, vivify_393
    new $P1145, "Undef"
  vivify_393:
    $P1146 = $P1145."ast"()
    store_lex "$past", $P1146
.annotate 'line', 409
    find_lex $P1147, "$/"
    unless_null $P1147, vivify_394
    $P1147 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1148, $P1147["variable"]
    unless_null $P1148, vivify_395
    $P1148 = root_new ['parrot';'Hash']
  vivify_395:
    set $P1149, $P1148["sigil"]
    unless_null $P1149, vivify_396
    new $P1149, "Undef"
  vivify_396:
    store_lex "$sigil", $P1149
.annotate 'line', 410
    find_lex $P1150, "$past"
    $P1151 = $P1150."name"()
    store_lex "$name", $P1151
.annotate 'line', 411
    get_global $P1152, "@BLOCK"
    unless_null $P1152, vivify_397
    $P1152 = root_new ['parrot';'ResizablePMCArray']
  vivify_397:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_398
    new $P1153, "Undef"
  vivify_398:
    store_lex "$BLOCK", $P1153
.annotate 'line', 412
    find_lex $P1155, "$BLOCK"
    find_lex $P1156, "$name"
    $P1157 = $P1155."symbol"($P1156)
    unless $P1157, if_1154_end
.annotate 'line', 413
    find_lex $P1158, "$/"
    $P1159 = $P1158."CURSOR"()
    find_lex $P1160, "$name"
    $P1159."panic"("Redeclaration of symbol ", $P1160)
  if_1154_end:
.annotate 'line', 415
    find_dynamic_lex $P1162, "$*SCOPE"
    unless_null $P1162, vivify_399
    get_hll_global $P1162, "$SCOPE"
    unless_null $P1162, vivify_400
    die "Contextual $*SCOPE not found"
  vivify_400:
  vivify_399:
    set $S1163, $P1162
    iseq $I1164, $S1163, "has"
    if $I1164, if_1161
.annotate 'line', 424
    .const 'Sub' $P1179 = "73_1275811497.55064" 
    capture_lex $P1179
    $P1179()
    goto if_1161_end
  if_1161:
.annotate 'line', 416
    find_lex $P1165, "$BLOCK"
    find_lex $P1166, "$name"
    $P1165."symbol"($P1166, "attribute" :named("scope"))
.annotate 'line', 417
    find_lex $P1168, "$BLOCK"
    unless_null $P1168, vivify_405
    $P1168 = root_new ['parrot';'Hash']
  vivify_405:
    set $P1169, $P1168["attributes"]
    unless_null $P1169, vivify_406
    new $P1169, "Undef"
  vivify_406:
    if $P1169, unless_1167_end
.annotate 'line', 419
    get_hll_global $P1170, ["PAST"], "Op"
    $P1171 = $P1170."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1172, "$BLOCK"
    unless_null $P1172, vivify_407
    $P1172 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1172
  vivify_407:
    set $P1172["attributes"], $P1171
  unless_1167_end:
.annotate 'line', 421
    find_lex $P1173, "$BLOCK"
    unless_null $P1173, vivify_408
    $P1173 = root_new ['parrot';'Hash']
  vivify_408:
    set $P1174, $P1173["attributes"]
    unless_null $P1174, vivify_409
    new $P1174, "Undef"
  vivify_409:
    find_lex $P1175, "$name"
    $P1174."push"($P1175)
.annotate 'line', 422
    get_hll_global $P1176, ["PAST"], "Stmts"
    $P1177 = $P1176."new"()
    store_lex "$past", $P1177
  if_1161_end:
.annotate 'line', 432
    find_lex $P1203, "$/"
    find_lex $P1204, "$past"
    $P1205 = $P1203."!make"($P1204)
.annotate 'line', 407
    .return ($P1205)
  control_1137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1206, exception, "payload"
    .return ($P1206)
.end


.namespace ["NQP";"Actions"]
.sub "_block1178"  :anon :subid("73_1275811497.55064") :outer("72_1275811497.55064")
.annotate 'line', 425
    new $P1180, "Undef"
    .lex "$scope", $P1180
.annotate 'line', 426
    new $P1181, "Undef"
    .lex "$decl", $P1181
.annotate 'line', 425
    find_dynamic_lex $P1184, "$*SCOPE"
    unless_null $P1184, vivify_401
    get_hll_global $P1184, "$SCOPE"
    unless_null $P1184, vivify_402
    die "Contextual $*SCOPE not found"
  vivify_402:
  vivify_401:
    set $S1185, $P1184
    iseq $I1186, $S1185, "our"
    if $I1186, if_1183
    new $P1188, "String"
    assign $P1188, "lexical"
    set $P1182, $P1188
    goto if_1183_end
  if_1183:
    new $P1187, "String"
    assign $P1187, "package"
    set $P1182, $P1187
  if_1183_end:
    store_lex "$scope", $P1182
.annotate 'line', 426
    get_hll_global $P1189, ["PAST"], "Var"
    find_lex $P1190, "$name"
    find_lex $P1191, "$scope"
.annotate 'line', 427
    find_lex $P1192, "$sigil"
    $P1193 = "vivitype"($P1192)
    find_lex $P1194, "$/"
    $P1195 = $P1189."new"($P1190 :named("name"), $P1191 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1193 :named("viviself"), $P1194 :named("node"))
.annotate 'line', 426
    store_lex "$decl", $P1195
.annotate 'line', 429
    find_lex $P1196, "$BLOCK"
    find_lex $P1197, "$name"
    find_lex $P1198, "$scope"
    $P1196."symbol"($P1197, $P1198 :named("scope"))
.annotate 'line', 430
    find_lex $P1199, "$BLOCK"
    unless_null $P1199, vivify_403
    $P1199 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1200, $P1199[0]
    unless_null $P1200, vivify_404
    new $P1200, "Undef"
  vivify_404:
    find_lex $P1201, "$decl"
    $P1202 = $P1200."push"($P1201)
.annotate 'line', 424
    .return ($P1202)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<sub>"  :subid("74_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1210
.annotate 'line', 435
    new $P1209, 'ExceptionHandler'
    set_addr $P1209, control_1208
    $P1209."handle_types"(.CONTROL_RETURN)
    push_eh $P1209
    .lex "self", self
    .lex "$/", param_1210
    find_lex $P1211, "$/"
    find_lex $P1212, "$/"
    unless_null $P1212, vivify_410
    $P1212 = root_new ['parrot';'Hash']
  vivify_410:
    set $P1213, $P1212["routine_def"]
    unless_null $P1213, vivify_411
    new $P1213, "Undef"
  vivify_411:
    $P1214 = $P1213."ast"()
    $P1215 = $P1211."!make"($P1214)
    .return ($P1215)
  control_1208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1216, exception, "payload"
    .return ($P1216)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<method>"  :subid("75_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1220
.annotate 'line', 436
    new $P1219, 'ExceptionHandler'
    set_addr $P1219, control_1218
    $P1219."handle_types"(.CONTROL_RETURN)
    push_eh $P1219
    .lex "self", self
    .lex "$/", param_1220
    find_lex $P1221, "$/"
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_412
    $P1222 = root_new ['parrot';'Hash']
  vivify_412:
    set $P1223, $P1222["method_def"]
    unless_null $P1223, vivify_413
    new $P1223, "Undef"
  vivify_413:
    $P1224 = $P1223."ast"()
    $P1225 = $P1221."!make"($P1224)
    .return ($P1225)
  control_1218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1226, exception, "payload"
    .return ($P1226)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_def"  :subid("76_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1230
.annotate 'line', 438
    .const 'Sub' $P1241 = "77_1275811497.55064" 
    capture_lex $P1241
    new $P1229, 'ExceptionHandler'
    set_addr $P1229, control_1228
    $P1229."handle_types"(.CONTROL_RETURN)
    push_eh $P1229
    .lex "self", self
    .lex "$/", param_1230
.annotate 'line', 439
    new $P1231, "Undef"
    .lex "$past", $P1231
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_414
    $P1232 = root_new ['parrot';'Hash']
  vivify_414:
    set $P1233, $P1232["blockoid"]
    unless_null $P1233, vivify_415
    new $P1233, "Undef"
  vivify_415:
    $P1234 = $P1233."ast"()
    store_lex "$past", $P1234
.annotate 'line', 440
    find_lex $P1235, "$past"
    $P1235."blocktype"("declaration")
.annotate 'line', 441
    find_lex $P1236, "$past"
    $P1236."control"("return_pir")
.annotate 'line', 442
    find_lex $P1238, "$/"
    unless_null $P1238, vivify_416
    $P1238 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1239, $P1238["deflongname"]
    unless_null $P1239, vivify_417
    new $P1239, "Undef"
  vivify_417:
    unless $P1239, if_1237_end
    .const 'Sub' $P1241 = "77_1275811497.55064" 
    capture_lex $P1241
    $P1241()
  if_1237_end:
.annotate 'line', 452
    find_lex $P1273, "$/"
    find_lex $P1274, "$past"
    $P1275 = $P1273."!make"($P1274)
.annotate 'line', 438
    .return ($P1275)
  control_1228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1276, exception, "payload"
    .return ($P1276)
.end


.namespace ["NQP";"Actions"]
.sub "_block1240"  :anon :subid("77_1275811497.55064") :outer("76_1275811497.55064")
.annotate 'line', 443
    new $P1242, "Undef"
    .lex "$name", $P1242
    find_lex $P1243, "$/"
    unless_null $P1243, vivify_418
    $P1243 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1244, $P1243["sigil"]
    unless_null $P1244, vivify_419
    $P1244 = root_new ['parrot';'ResizablePMCArray']
  vivify_419:
    set $P1245, $P1244[0]
    unless_null $P1245, vivify_420
    new $P1245, "Undef"
  vivify_420:
    set $S1246, $P1245
    new $P1247, 'String'
    set $P1247, $S1246
    find_lex $P1248, "$/"
    unless_null $P1248, vivify_421
    $P1248 = root_new ['parrot';'Hash']
  vivify_421:
    set $P1249, $P1248["deflongname"]
    unless_null $P1249, vivify_422
    $P1249 = root_new ['parrot';'ResizablePMCArray']
  vivify_422:
    set $P1250, $P1249[0]
    unless_null $P1250, vivify_423
    new $P1250, "Undef"
  vivify_423:
    $S1251 = $P1250."ast"()
    concat $P1252, $P1247, $S1251
    store_lex "$name", $P1252
.annotate 'line', 444
    find_lex $P1253, "$past"
    find_lex $P1254, "$name"
    $P1253."name"($P1254)
.annotate 'line', 445
    find_dynamic_lex $P1257, "$*SCOPE"
    unless_null $P1257, vivify_424
    get_hll_global $P1257, "$SCOPE"
    unless_null $P1257, vivify_425
    die "Contextual $*SCOPE not found"
  vivify_425:
  vivify_424:
    set $S1258, $P1257
    isne $I1259, $S1258, "our"
    if $I1259, if_1256
    new $P1255, 'Integer'
    set $P1255, $I1259
    goto if_1256_end
  if_1256:
.annotate 'line', 446
    get_global $P1260, "@BLOCK"
    unless_null $P1260, vivify_426
    $P1260 = root_new ['parrot';'ResizablePMCArray']
  vivify_426:
    set $P1261, $P1260[0]
    unless_null $P1261, vivify_427
    $P1261 = root_new ['parrot';'ResizablePMCArray']
  vivify_427:
    set $P1262, $P1261[0]
    unless_null $P1262, vivify_428
    new $P1262, "Undef"
  vivify_428:
    get_hll_global $P1263, ["PAST"], "Var"
    find_lex $P1264, "$name"
    find_lex $P1265, "$past"
    $P1266 = $P1263."new"($P1264 :named("name"), 1 :named("isdecl"), $P1265 :named("viviself"), "lexical" :named("scope"))
    $P1262."push"($P1266)
.annotate 'line', 448
    get_global $P1267, "@BLOCK"
    unless_null $P1267, vivify_429
    $P1267 = root_new ['parrot';'ResizablePMCArray']
  vivify_429:
    set $P1268, $P1267[0]
    unless_null $P1268, vivify_430
    new $P1268, "Undef"
  vivify_430:
    find_lex $P1269, "$name"
    $P1268."symbol"($P1269, "lexical" :named("scope"))
.annotate 'line', 449
    get_hll_global $P1270, ["PAST"], "Var"
    find_lex $P1271, "$name"
    $P1272 = $P1270."new"($P1271 :named("name"))
    store_lex "$past", $P1272
.annotate 'line', 445
    set $P1255, $P1272
  if_1256_end:
.annotate 'line', 442
    .return ($P1255)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "method_def"  :subid("78_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1280
.annotate 'line', 456
    .const 'Sub' $P1296 = "79_1275811497.55064" 
    capture_lex $P1296
    new $P1279, 'ExceptionHandler'
    set_addr $P1279, control_1278
    $P1279."handle_types"(.CONTROL_RETURN)
    push_eh $P1279
    .lex "self", self
    .lex "$/", param_1280
.annotate 'line', 457
    new $P1281, "Undef"
    .lex "$past", $P1281
    find_lex $P1282, "$/"
    unless_null $P1282, vivify_431
    $P1282 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1283, $P1282["blockoid"]
    unless_null $P1283, vivify_432
    new $P1283, "Undef"
  vivify_432:
    $P1284 = $P1283."ast"()
    store_lex "$past", $P1284
.annotate 'line', 458
    find_lex $P1285, "$past"
    $P1285."blocktype"("method")
.annotate 'line', 459
    find_lex $P1286, "$past"
    $P1286."control"("return_pir")
.annotate 'line', 460
    find_lex $P1287, "$past"
    unless_null $P1287, vivify_433
    $P1287 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1288, $P1287[0]
    unless_null $P1288, vivify_434
    new $P1288, "Undef"
  vivify_434:
    get_hll_global $P1289, ["PAST"], "Op"
    $P1290 = $P1289."new"("    .lex \"self\", self" :named("inline"))
    $P1288."unshift"($P1290)
.annotate 'line', 461
    find_lex $P1291, "$past"
    $P1291."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 462
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_435
    $P1293 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1294, $P1293["deflongname"]
    unless_null $P1294, vivify_436
    new $P1294, "Undef"
  vivify_436:
    unless $P1294, if_1292_end
    .const 'Sub' $P1296 = "79_1275811497.55064" 
    capture_lex $P1296
    $P1296()
  if_1292_end:
.annotate 'line', 466
    find_dynamic_lex $P1308, "$*MULTINESS"
    unless_null $P1308, vivify_440
    get_hll_global $P1308, "$MULTINESS"
    unless_null $P1308, vivify_441
    die "Contextual $*MULTINESS not found"
  vivify_441:
  vivify_440:
    set $S1309, $P1308
    iseq $I1310, $S1309, "multi"
    unless $I1310, if_1307_end
    find_lex $P1311, "$past"
    $P1312 = $P1311."multi"()
    $P1312."unshift"("_")
  if_1307_end:
.annotate 'line', 467
    find_lex $P1313, "$/"
    find_lex $P1314, "$past"
    $P1315 = $P1313."!make"($P1314)
.annotate 'line', 456
    .return ($P1315)
  control_1278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1316, exception, "payload"
    .return ($P1316)
.end


.namespace ["NQP";"Actions"]
.sub "_block1295"  :anon :subid("79_1275811497.55064") :outer("78_1275811497.55064")
.annotate 'line', 463
    new $P1297, "Undef"
    .lex "$name", $P1297
    find_lex $P1298, "$/"
    unless_null $P1298, vivify_437
    $P1298 = root_new ['parrot';'Hash']
  vivify_437:
    set $P1299, $P1298["deflongname"]
    unless_null $P1299, vivify_438
    $P1299 = root_new ['parrot';'ResizablePMCArray']
  vivify_438:
    set $P1300, $P1299[0]
    unless_null $P1300, vivify_439
    new $P1300, "Undef"
  vivify_439:
    $P1301 = $P1300."ast"()
    set $S1302, $P1301
    new $P1303, 'String'
    set $P1303, $S1302
    store_lex "$name", $P1303
.annotate 'line', 464
    find_lex $P1304, "$past"
    find_lex $P1305, "$name"
    $P1306 = $P1304."name"($P1305)
.annotate 'line', 462
    .return ($P1306)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("80_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1320
.annotate 'line', 471
    .const 'Sub' $P1346 = "82_1275811497.55064" 
    capture_lex $P1346
    .const 'Sub' $P1331 = "81_1275811497.55064" 
    capture_lex $P1331
    new $P1319, 'ExceptionHandler'
    set_addr $P1319, control_1318
    $P1319."handle_types"(.CONTROL_RETURN)
    push_eh $P1319
    .lex "self", self
    .lex "$/", param_1320
.annotate 'line', 472
    new $P1321, "Undef"
    .lex "$BLOCKINIT", $P1321
    get_global $P1322, "@BLOCK"
    unless_null $P1322, vivify_442
    $P1322 = root_new ['parrot';'ResizablePMCArray']
  vivify_442:
    set $P1323, $P1322[0]
    unless_null $P1323, vivify_443
    $P1323 = root_new ['parrot';'ResizablePMCArray']
  vivify_443:
    set $P1324, $P1323[0]
    unless_null $P1324, vivify_444
    new $P1324, "Undef"
  vivify_444:
    store_lex "$BLOCKINIT", $P1324
.annotate 'line', 474
    find_lex $P1326, "$/"
    unless_null $P1326, vivify_445
    $P1326 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1327, $P1326["parameter"]
    unless_null $P1327, vivify_446
    new $P1327, "Undef"
  vivify_446:
    defined $I1328, $P1327
    unless $I1328, for_undef_447
    iter $P1325, $P1327
    new $P1338, 'ExceptionHandler'
    set_addr $P1338, loop1337_handler
    $P1338."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1338
  loop1337_test:
    unless $P1325, loop1337_done
    shift $P1329, $P1325
  loop1337_redo:
    .const 'Sub' $P1331 = "81_1275811497.55064" 
    capture_lex $P1331
    $P1331($P1329)
  loop1337_next:
    goto loop1337_test
  loop1337_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1339, exception, 'type'
    eq $P1339, .CONTROL_LOOP_NEXT, loop1337_next
    eq $P1339, .CONTROL_LOOP_REDO, loop1337_redo
  loop1337_done:
    pop_eh 
  for_undef_447:
.annotate 'line', 477
    find_dynamic_lex $P1342, "$*MULTINESS"
    unless_null $P1342, vivify_448
    get_hll_global $P1342, "$MULTINESS"
    unless_null $P1342, vivify_449
    die "Contextual $*MULTINESS not found"
  vivify_449:
  vivify_448:
    set $S1343, $P1342
    iseq $I1344, $S1343, "multi"
    if $I1344, if_1341
    new $P1340, 'Integer'
    set $P1340, $I1344
    goto if_1341_end
  if_1341:
    .const 'Sub' $P1346 = "82_1275811497.55064" 
    capture_lex $P1346
    $P1372 = $P1346()
    set $P1340, $P1372
  if_1341_end:
.annotate 'line', 471
    .return ($P1340)
  control_1318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1373, exception, "payload"
    .return ($P1373)
.end


.namespace ["NQP";"Actions"]
.sub "_block1330"  :anon :subid("81_1275811497.55064") :outer("80_1275811497.55064")
    .param pmc param_1332
.annotate 'line', 474
    .lex "$_", param_1332
    find_lex $P1333, "$BLOCKINIT"
    find_lex $P1334, "$_"
    $P1335 = $P1334."ast"()
    $P1336 = $P1333."push"($P1335)
    .return ($P1336)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1345"  :anon :subid("82_1275811497.55064") :outer("80_1275811497.55064")
.annotate 'line', 477
    .const 'Sub' $P1355 = "83_1275811497.55064" 
    capture_lex $P1355
.annotate 'line', 478
    $P1347 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P1347
.annotate 'line', 477
    find_lex $P1348, "@params"
.annotate 'line', 479
    find_lex $P1350, "$BLOCKINIT"
    $P1351 = $P1350."list"()
    defined $I1352, $P1351
    unless $I1352, for_undef_450
    iter $P1349, $P1351
    new $P1366, 'ExceptionHandler'
    set_addr $P1366, loop1365_handler
    $P1366."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1366
  loop1365_test:
    unless $P1349, loop1365_done
    shift $P1353, $P1349
  loop1365_redo:
    .const 'Sub' $P1355 = "83_1275811497.55064" 
    capture_lex $P1355
    $P1355($P1353)
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
  for_undef_450:
.annotate 'line', 482
    get_global $P1368, "@BLOCK"
    unless_null $P1368, vivify_451
    $P1368 = root_new ['parrot';'ResizablePMCArray']
  vivify_451:
    set $P1369, $P1368[0]
    unless_null $P1369, vivify_452
    new $P1369, "Undef"
  vivify_452:
    find_lex $P1370, "@params"
    $P1371 = $P1369."multi"($P1370)
.annotate 'line', 477
    .return ($P1371)
.end


.namespace ["NQP";"Actions"]
.sub "_block1354"  :anon :subid("83_1275811497.55064") :outer("82_1275811497.55064")
    .param pmc param_1356
.annotate 'line', 479
    .lex "$_", param_1356
.annotate 'line', 480
    find_lex $P1357, "@params"
    find_lex $P1359, "$_"
    $P1360 = $P1359."multitype"()
    set $P1358, $P1360
    defined $I1362, $P1358
    if $I1362, default_1361
    new $P1363, "String"
    assign $P1363, "_"
    set $P1358, $P1363
  default_1361:
    $P1364 = $P1357."push"($P1358)
.annotate 'line', 479
    .return ($P1364)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("84_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1377
.annotate 'line', 486
    .const 'Sub' $P1458 = "85_1275811497.55064" 
    capture_lex $P1458
    new $P1376, 'ExceptionHandler'
    set_addr $P1376, control_1375
    $P1376."handle_types"(.CONTROL_RETURN)
    push_eh $P1376
    .lex "self", self
    .lex "$/", param_1377
.annotate 'line', 487
    new $P1378, "Undef"
    .lex "$quant", $P1378
.annotate 'line', 488
    new $P1379, "Undef"
    .lex "$past", $P1379
.annotate 'line', 487
    find_lex $P1380, "$/"
    unless_null $P1380, vivify_453
    $P1380 = root_new ['parrot';'Hash']
  vivify_453:
    set $P1381, $P1380["quant"]
    unless_null $P1381, vivify_454
    new $P1381, "Undef"
  vivify_454:
    store_lex "$quant", $P1381
    find_lex $P1382, "$past"
.annotate 'line', 489
    find_lex $P1384, "$/"
    unless_null $P1384, vivify_455
    $P1384 = root_new ['parrot';'Hash']
  vivify_455:
    set $P1385, $P1384["named_param"]
    unless_null $P1385, vivify_456
    new $P1385, "Undef"
  vivify_456:
    if $P1385, if_1383
.annotate 'line', 496
    find_lex $P1399, "$/"
    unless_null $P1399, vivify_457
    $P1399 = root_new ['parrot';'Hash']
  vivify_457:
    set $P1400, $P1399["param_var"]
    unless_null $P1400, vivify_458
    new $P1400, "Undef"
  vivify_458:
    $P1401 = $P1400."ast"()
    store_lex "$past", $P1401
.annotate 'line', 497
    find_lex $P1403, "$quant"
    set $S1404, $P1403
    iseq $I1405, $S1404, "*"
    if $I1405, if_1402
.annotate 'line', 501
    find_lex $P1414, "$quant"
    set $S1415, $P1414
    iseq $I1416, $S1415, "?"
    unless $I1416, if_1413_end
.annotate 'line', 502
    find_lex $P1417, "$past"
    find_lex $P1418, "$/"
    unless_null $P1418, vivify_459
    $P1418 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1419, $P1418["param_var"]
    unless_null $P1419, vivify_460
    $P1419 = root_new ['parrot';'Hash']
  vivify_460:
    set $P1420, $P1419["sigil"]
    unless_null $P1420, vivify_461
    new $P1420, "Undef"
  vivify_461:
    $P1421 = "vivitype"($P1420)
    $P1417."viviself"($P1421)
  if_1413_end:
.annotate 'line', 501
    goto if_1402_end
  if_1402:
.annotate 'line', 498
    find_lex $P1406, "$past"
    $P1406."slurpy"(1)
.annotate 'line', 499
    find_lex $P1407, "$past"
    find_lex $P1408, "$/"
    unless_null $P1408, vivify_462
    $P1408 = root_new ['parrot';'Hash']
  vivify_462:
    set $P1409, $P1408["param_var"]
    unless_null $P1409, vivify_463
    $P1409 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1410, $P1409["sigil"]
    unless_null $P1410, vivify_464
    new $P1410, "Undef"
  vivify_464:
    set $S1411, $P1410
    iseq $I1412, $S1411, "%"
    $P1407."named"($I1412)
  if_1402_end:
.annotate 'line', 495
    goto if_1383_end
  if_1383:
.annotate 'line', 490
    find_lex $P1386, "$/"
    unless_null $P1386, vivify_465
    $P1386 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1387, $P1386["named_param"]
    unless_null $P1387, vivify_466
    new $P1387, "Undef"
  vivify_466:
    $P1388 = $P1387."ast"()
    store_lex "$past", $P1388
.annotate 'line', 491
    find_lex $P1390, "$quant"
    set $S1391, $P1390
    isne $I1392, $S1391, "!"
    unless $I1392, if_1389_end
.annotate 'line', 492
    find_lex $P1393, "$past"
    find_lex $P1394, "$/"
    unless_null $P1394, vivify_467
    $P1394 = root_new ['parrot';'Hash']
  vivify_467:
    set $P1395, $P1394["named_param"]
    unless_null $P1395, vivify_468
    $P1395 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1396, $P1395["param_var"]
    unless_null $P1396, vivify_469
    $P1396 = root_new ['parrot';'Hash']
  vivify_469:
    set $P1397, $P1396["sigil"]
    unless_null $P1397, vivify_470
    new $P1397, "Undef"
  vivify_470:
    $P1398 = "vivitype"($P1397)
    $P1393."viviself"($P1398)
  if_1389_end:
  if_1383_end:
.annotate 'line', 505
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_471
    $P1423 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1424, $P1423["default_value"]
    unless_null $P1424, vivify_472
    new $P1424, "Undef"
  vivify_472:
    unless $P1424, if_1422_end
.annotate 'line', 506
    find_lex $P1426, "$quant"
    set $S1427, $P1426
    iseq $I1428, $S1427, "*"
    unless $I1428, if_1425_end
.annotate 'line', 507
    find_lex $P1429, "$/"
    $P1430 = $P1429."CURSOR"()
    $P1430."panic"("Can't put default on slurpy parameter")
  if_1425_end:
.annotate 'line', 509
    find_lex $P1432, "$quant"
    set $S1433, $P1432
    iseq $I1434, $S1433, "!"
    unless $I1434, if_1431_end
.annotate 'line', 510
    find_lex $P1435, "$/"
    $P1436 = $P1435."CURSOR"()
    $P1436."panic"("Can't put default on required parameter")
  if_1431_end:
.annotate 'line', 512
    find_lex $P1437, "$past"
    find_lex $P1438, "$/"
    unless_null $P1438, vivify_473
    $P1438 = root_new ['parrot';'Hash']
  vivify_473:
    set $P1439, $P1438["default_value"]
    unless_null $P1439, vivify_474
    $P1439 = root_new ['parrot';'ResizablePMCArray']
  vivify_474:
    set $P1440, $P1439[0]
    unless_null $P1440, vivify_475
    $P1440 = root_new ['parrot';'Hash']
  vivify_475:
    set $P1441, $P1440["EXPR"]
    unless_null $P1441, vivify_476
    new $P1441, "Undef"
  vivify_476:
    $P1442 = $P1441."ast"()
    $P1437."viviself"($P1442)
  if_1422_end:
.annotate 'line', 514
    find_lex $P1444, "$past"
    $P1445 = $P1444."viviself"()
    if $P1445, unless_1443_end
    get_global $P1446, "@BLOCK"
    unless_null $P1446, vivify_477
    $P1446 = root_new ['parrot';'ResizablePMCArray']
  vivify_477:
    set $P1447, $P1446[0]
    unless_null $P1447, vivify_478
    new $P1447, "Undef"
  vivify_478:
    get_global $P1448, "@BLOCK"
    unless_null $P1448, vivify_479
    $P1448 = root_new ['parrot';'ResizablePMCArray']
  vivify_479:
    set $P1449, $P1448[0]
    unless_null $P1449, vivify_480
    new $P1449, "Undef"
  vivify_480:
    $P1450 = $P1449."arity"()
    set $N1451, $P1450
    new $P1452, 'Float'
    set $P1452, $N1451
    add $P1453, $P1452, 1
    $P1447."arity"($P1453)
  unless_1443_end:
.annotate 'line', 517
    find_lex $P1455, "$/"
    unless_null $P1455, vivify_481
    $P1455 = root_new ['parrot';'Hash']
  vivify_481:
    set $P1456, $P1455["typename"]
    unless_null $P1456, vivify_482
    new $P1456, "Undef"
  vivify_482:
    unless $P1456, if_1454_end
    .const 'Sub' $P1458 = "85_1275811497.55064" 
    capture_lex $P1458
    $P1458()
  if_1454_end:
.annotate 'line', 523
    find_lex $P1482, "$/"
    find_lex $P1483, "$past"
    $P1484 = $P1482."!make"($P1483)
.annotate 'line', 486
    .return ($P1484)
  control_1375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1485, exception, "payload"
    .return ($P1485)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1457"  :anon :subid("85_1275811497.55064") :outer("84_1275811497.55064")
.annotate 'line', 517
    .const 'Sub' $P1470 = "86_1275811497.55064" 
    capture_lex $P1470
.annotate 'line', 518
    $P1459 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multitype", $P1459
.annotate 'line', 517
    find_lex $P1460, "@multitype"
.annotate 'line', 519
    find_lex $P1462, "$/"
    unless_null $P1462, vivify_483
    $P1462 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1463, $P1462["typename"]
    unless_null $P1463, vivify_484
    $P1463 = root_new ['parrot';'ResizablePMCArray']
  vivify_484:
    set $P1464, $P1463[0]
    unless_null $P1464, vivify_485
    $P1464 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1465, $P1464["name"]
    unless_null $P1465, vivify_486
    $P1465 = root_new ['parrot';'Hash']
  vivify_486:
    set $P1466, $P1465["identifier"]
    unless_null $P1466, vivify_487
    new $P1466, "Undef"
  vivify_487:
    defined $I1467, $P1466
    unless $I1467, for_undef_488
    iter $P1461, $P1466
    new $P1477, 'ExceptionHandler'
    set_addr $P1477, loop1476_handler
    $P1477."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1477
  loop1476_test:
    unless $P1461, loop1476_done
    shift $P1468, $P1461
  loop1476_redo:
    .const 'Sub' $P1470 = "86_1275811497.55064" 
    capture_lex $P1470
    $P1470($P1468)
  loop1476_next:
    goto loop1476_test
  loop1476_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1478, exception, 'type'
    eq $P1478, .CONTROL_LOOP_NEXT, loop1476_next
    eq $P1478, .CONTROL_LOOP_REDO, loop1476_redo
  loop1476_done:
    pop_eh 
  for_undef_488:
.annotate 'line', 520
    find_lex $P1479, "$past"
    find_lex $P1480, "@multitype"
    $P1481 = $P1479."multitype"($P1480)
.annotate 'line', 517
    .return ($P1481)
.end


.namespace ["NQP";"Actions"]
.sub "_block1469"  :anon :subid("86_1275811497.55064") :outer("85_1275811497.55064")
    .param pmc param_1471
.annotate 'line', 519
    .lex "$_", param_1471
    find_lex $P1472, "@multitype"
    find_lex $P1473, "$_"
    set $S1474, $P1473
    $P1475 = $P1472."push"($S1474)
    .return ($P1475)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("87_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1489
.annotate 'line', 526
    new $P1488, 'ExceptionHandler'
    set_addr $P1488, control_1487
    $P1488."handle_types"(.CONTROL_RETURN)
    push_eh $P1488
    .lex "self", self
    .lex "$/", param_1489
.annotate 'line', 527
    new $P1490, "Undef"
    .lex "$name", $P1490
.annotate 'line', 528
    new $P1491, "Undef"
    .lex "$past", $P1491
.annotate 'line', 527
    find_lex $P1492, "$/"
    set $S1493, $P1492
    new $P1494, 'String'
    set $P1494, $S1493
    store_lex "$name", $P1494
.annotate 'line', 528
    get_hll_global $P1495, ["PAST"], "Var"
    find_lex $P1496, "$name"
    find_lex $P1497, "$/"
    $P1498 = $P1495."new"($P1496 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1497 :named("node"))
    store_lex "$past", $P1498
.annotate 'line', 530
    get_global $P1499, "@BLOCK"
    unless_null $P1499, vivify_489
    $P1499 = root_new ['parrot';'ResizablePMCArray']
  vivify_489:
    set $P1500, $P1499[0]
    unless_null $P1500, vivify_490
    new $P1500, "Undef"
  vivify_490:
    find_lex $P1501, "$name"
    $P1500."symbol"($P1501, "lexical" :named("scope"))
.annotate 'line', 531
    find_lex $P1502, "$/"
    find_lex $P1503, "$past"
    $P1504 = $P1502."!make"($P1503)
.annotate 'line', 526
    .return ($P1504)
  control_1487:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1505, exception, "payload"
    .return ($P1505)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("88_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1509
.annotate 'line', 534
    new $P1508, 'ExceptionHandler'
    set_addr $P1508, control_1507
    $P1508."handle_types"(.CONTROL_RETURN)
    push_eh $P1508
    .lex "self", self
    .lex "$/", param_1509
.annotate 'line', 535
    new $P1510, "Undef"
    .lex "$past", $P1510
    find_lex $P1511, "$/"
    unless_null $P1511, vivify_491
    $P1511 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1512, $P1511["param_var"]
    unless_null $P1512, vivify_492
    new $P1512, "Undef"
  vivify_492:
    $P1513 = $P1512."ast"()
    store_lex "$past", $P1513
.annotate 'line', 536
    find_lex $P1514, "$past"
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_493
    $P1515 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1516, $P1515["param_var"]
    unless_null $P1516, vivify_494
    $P1516 = root_new ['parrot';'Hash']
  vivify_494:
    set $P1517, $P1516["name"]
    unless_null $P1517, vivify_495
    new $P1517, "Undef"
  vivify_495:
    set $S1518, $P1517
    $P1514."named"($S1518)
.annotate 'line', 537
    find_lex $P1519, "$/"
    find_lex $P1520, "$past"
    $P1521 = $P1519."!make"($P1520)
.annotate 'line', 534
    .return ($P1521)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1522, exception, "payload"
    .return ($P1522)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("89_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1526
    .param pmc param_1527 :optional
    .param int has_param_1527 :opt_flag
.annotate 'line', 540
    .const 'Sub' $P1597 = "91_1275811497.55064" 
    capture_lex $P1597
    .const 'Sub' $P1569 = "90_1275811497.55064" 
    capture_lex $P1569
    new $P1525, 'ExceptionHandler'
    set_addr $P1525, control_1524
    $P1525."handle_types"(.CONTROL_RETURN)
    push_eh $P1525
    .lex "self", self
    .lex "$/", param_1526
    if has_param_1527, optparam_496
    new $P1528, "Undef"
    set param_1527, $P1528
  optparam_496:
    .lex "$key", param_1527
.annotate 'line', 541
    $P1529 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1529
.annotate 'line', 544
    new $P1530, "Undef"
    .lex "$name", $P1530
.annotate 'line', 545
    new $P1531, "Undef"
    .lex "$past", $P1531
.annotate 'line', 541

        $P1532 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1532
.annotate 'line', 544
    find_lex $P1533, "$/"
    unless_null $P1533, vivify_497
    $P1533 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1534, $P1533["deflongname"]
    unless_null $P1534, vivify_498
    new $P1534, "Undef"
  vivify_498:
    $P1535 = $P1534."ast"()
    set $S1536, $P1535
    new $P1537, 'String'
    set $P1537, $S1536
    store_lex "$name", $P1537
    find_lex $P1538, "$past"
.annotate 'line', 546
    find_lex $P1540, "$/"
    unless_null $P1540, vivify_499
    $P1540 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1541, $P1540["proto"]
    unless_null $P1541, vivify_500
    new $P1541, "Undef"
  vivify_500:
    if $P1541, if_1539
.annotate 'line', 573
    find_lex $P1565, "$key"
    set $S1566, $P1565
    iseq $I1567, $S1566, "open"
    if $I1567, if_1564
.annotate 'line', 586
    .const 'Sub' $P1597 = "91_1275811497.55064" 
    capture_lex $P1597
    $P1597()
    goto if_1564_end
  if_1564:
.annotate 'line', 573
    .const 'Sub' $P1569 = "90_1275811497.55064" 
    capture_lex $P1569
    $P1569()
  if_1564_end:
    goto if_1539_end
  if_1539:
.annotate 'line', 548
    get_hll_global $P1542, ["PAST"], "Stmts"
.annotate 'line', 549
    get_hll_global $P1543, ["PAST"], "Block"
    find_lex $P1544, "$name"
.annotate 'line', 550
    get_hll_global $P1545, ["PAST"], "Op"
.annotate 'line', 551
    get_hll_global $P1546, ["PAST"], "Var"
    $P1547 = $P1546."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1548, "$name"
    $P1549 = $P1545."new"($P1547, $P1548, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 550
    find_lex $P1550, "$/"
    $P1551 = $P1543."new"($P1549, $P1544 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1550 :named("node"))
.annotate 'line', 560
    get_hll_global $P1552, ["PAST"], "Block"
    new $P1553, "String"
    assign $P1553, "!PREFIX__"
    find_lex $P1554, "$name"
    concat $P1555, $P1553, $P1554
.annotate 'line', 561
    get_hll_global $P1556, ["PAST"], "Op"
.annotate 'line', 562
    get_hll_global $P1557, ["PAST"], "Var"
    $P1558 = $P1557."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1559, "$name"
    $P1560 = $P1556."new"($P1558, $P1559, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 561
    find_lex $P1561, "$/"
    $P1562 = $P1552."new"($P1560, $P1555 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1561 :named("node"))
.annotate 'line', 560
    $P1563 = $P1542."new"($P1551, $P1562)
.annotate 'line', 548
    store_lex "$past", $P1563
  if_1539_end:
.annotate 'line', 600
    find_lex $P1618, "$/"
    find_lex $P1619, "$past"
    $P1620 = $P1618."!make"($P1619)
.annotate 'line', 540
    .return ($P1620)
  control_1524:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1621, exception, "payload"
    .return ($P1621)
.end


.namespace ["NQP";"Actions"]
.sub "_block1596"  :anon :subid("91_1275811497.55064") :outer("89_1275811497.55064")
.annotate 'line', 587
    new $P1598, "Undef"
    .lex "$regex", $P1598
.annotate 'line', 588
    get_hll_global $P1599, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1600, "$/"
    unless_null $P1600, vivify_501
    $P1600 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1601, $P1600["p6regex"]
    unless_null $P1601, vivify_502
    new $P1601, "Undef"
  vivify_502:
    $P1602 = $P1601."ast"()
    get_global $P1603, "@BLOCK"
    $P1604 = $P1603."shift"()
    $P1605 = $P1599($P1602, $P1604)
    store_lex "$regex", $P1605
.annotate 'line', 589
    find_lex $P1606, "$regex"
    find_lex $P1607, "$name"
    $P1606."name"($P1607)
.annotate 'line', 591
    get_hll_global $P1608, ["PAST"], "Op"
.annotate 'line', 593
    get_hll_global $P1609, ["PAST"], "Var"
    new $P1610, "ResizablePMCArray"
    push $P1610, "Regex"
    $P1611 = $P1609."new"("Method" :named("name"), $P1610 :named("namespace"), "package" :named("scope"))
    find_lex $P1612, "$regex"
    $P1613 = $P1608."new"($P1611, $P1612, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 591
    store_lex "$past", $P1613
.annotate 'line', 597
    find_lex $P1614, "$regex"
    find_lex $P1615, "$past"
    unless_null $P1615, vivify_503
    $P1615 = root_new ['parrot';'Hash']
    store_lex "$past", $P1615
  vivify_503:
    set $P1615["sink"], $P1614
.annotate 'line', 598
    find_lex $P1616, "@MODIFIERS"
    $P1617 = $P1616."shift"()
.annotate 'line', 586
    .return ($P1617)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1568"  :anon :subid("90_1275811497.55064") :outer("89_1275811497.55064")
.annotate 'line', 574
    $P1570 = root_new ['parrot';'Hash']
    .lex "%h", $P1570
.annotate 'line', 573
    find_lex $P1571, "%h"
.annotate 'line', 575
    find_lex $P1573, "$/"
    unless_null $P1573, vivify_504
    $P1573 = root_new ['parrot';'Hash']
  vivify_504:
    set $P1574, $P1573["sym"]
    unless_null $P1574, vivify_505
    new $P1574, "Undef"
  vivify_505:
    set $S1575, $P1574
    iseq $I1576, $S1575, "token"
    unless $I1576, if_1572_end
    new $P1577, "Integer"
    assign $P1577, 1
    find_lex $P1578, "%h"
    unless_null $P1578, vivify_506
    $P1578 = root_new ['parrot';'Hash']
    store_lex "%h", $P1578
  vivify_506:
    set $P1578["r"], $P1577
  if_1572_end:
.annotate 'line', 576
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_507
    $P1580 = root_new ['parrot';'Hash']
  vivify_507:
    set $P1581, $P1580["sym"]
    unless_null $P1581, vivify_508
    new $P1581, "Undef"
  vivify_508:
    set $S1582, $P1581
    iseq $I1583, $S1582, "rule"
    unless $I1583, if_1579_end
    new $P1584, "Integer"
    assign $P1584, 1
    find_lex $P1585, "%h"
    unless_null $P1585, vivify_509
    $P1585 = root_new ['parrot';'Hash']
    store_lex "%h", $P1585
  vivify_509:
    set $P1585["r"], $P1584
    new $P1586, "Integer"
    assign $P1586, 1
    find_lex $P1587, "%h"
    unless_null $P1587, vivify_510
    $P1587 = root_new ['parrot';'Hash']
    store_lex "%h", $P1587
  vivify_510:
    set $P1587["s"], $P1586
  if_1579_end:
.annotate 'line', 577
    find_lex $P1588, "@MODIFIERS"
    find_lex $P1589, "%h"
    $P1588."unshift"($P1589)
.annotate 'line', 578

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 582
    get_global $P1590, "@BLOCK"
    unless_null $P1590, vivify_511
    $P1590 = root_new ['parrot';'ResizablePMCArray']
  vivify_511:
    set $P1591, $P1590[0]
    unless_null $P1591, vivify_512
    new $P1591, "Undef"
  vivify_512:
    $P1591."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 583
    get_global $P1592, "@BLOCK"
    unless_null $P1592, vivify_513
    $P1592 = root_new ['parrot';'ResizablePMCArray']
  vivify_513:
    set $P1593, $P1592[0]
    unless_null $P1593, vivify_514
    new $P1593, "Undef"
  vivify_514:
    $P1593."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 584
    new $P1594, "Exception"
    set $P1594['type'], .CONTROL_RETURN
    new $P1595, "Integer"
    assign $P1595, 0
    setattribute $P1594, 'payload', $P1595
    throw $P1594
.annotate 'line', 573
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("92_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1625
.annotate 'line', 604
    new $P1624, 'ExceptionHandler'
    set_addr $P1624, control_1623
    $P1624."handle_types"(.CONTROL_RETURN)
    push_eh $P1624
    .lex "self", self
    .lex "$/", param_1625
.annotate 'line', 605
    new $P1626, "Undef"
    .lex "$past", $P1626
    find_lex $P1629, "$/"
    unless_null $P1629, vivify_515
    $P1629 = root_new ['parrot';'Hash']
  vivify_515:
    set $P1630, $P1629["args"]
    unless_null $P1630, vivify_516
    new $P1630, "Undef"
  vivify_516:
    if $P1630, if_1628
    get_hll_global $P1635, ["PAST"], "Op"
    find_lex $P1636, "$/"
    $P1637 = $P1635."new"($P1636 :named("node"))
    set $P1627, $P1637
    goto if_1628_end
  if_1628:
    find_lex $P1631, "$/"
    unless_null $P1631, vivify_517
    $P1631 = root_new ['parrot';'Hash']
  vivify_517:
    set $P1632, $P1631["args"]
    unless_null $P1632, vivify_518
    $P1632 = root_new ['parrot';'ResizablePMCArray']
  vivify_518:
    set $P1633, $P1632[0]
    unless_null $P1633, vivify_519
    new $P1633, "Undef"
  vivify_519:
    $P1634 = $P1633."ast"()
    set $P1627, $P1634
  if_1628_end:
    store_lex "$past", $P1627
.annotate 'line', 606
    find_lex $P1638, "$past"
    find_lex $P1641, "$/"
    unless_null $P1641, vivify_520
    $P1641 = root_new ['parrot';'Hash']
  vivify_520:
    set $P1642, $P1641["quote"]
    unless_null $P1642, vivify_521
    new $P1642, "Undef"
  vivify_521:
    if $P1642, if_1640
    find_lex $P1646, "$/"
    unless_null $P1646, vivify_522
    $P1646 = root_new ['parrot';'Hash']
  vivify_522:
    set $P1647, $P1646["longname"]
    unless_null $P1647, vivify_523
    new $P1647, "Undef"
  vivify_523:
    set $S1648, $P1647
    new $P1639, 'String'
    set $P1639, $S1648
    goto if_1640_end
  if_1640:
    find_lex $P1643, "$/"
    unless_null $P1643, vivify_524
    $P1643 = root_new ['parrot';'Hash']
  vivify_524:
    set $P1644, $P1643["quote"]
    unless_null $P1644, vivify_525
    new $P1644, "Undef"
  vivify_525:
    $P1645 = $P1644."ast"()
    set $P1639, $P1645
  if_1640_end:
    $P1638."name"($P1639)
.annotate 'line', 607
    find_lex $P1649, "$past"
    $P1649."pasttype"("callmethod")
.annotate 'line', 608
    find_lex $P1650, "$/"
    find_lex $P1651, "$past"
    $P1652 = $P1650."!make"($P1651)
.annotate 'line', 604
    .return ($P1652)
  control_1623:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1653, exception, "payload"
    .return ($P1653)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("93_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1657
.annotate 'line', 613
    new $P1656, 'ExceptionHandler'
    set_addr $P1656, control_1655
    $P1656."handle_types"(.CONTROL_RETURN)
    push_eh $P1656
    .lex "self", self
    .lex "$/", param_1657
.annotate 'line', 614
    find_lex $P1658, "$/"
    get_hll_global $P1659, ["PAST"], "Var"
    $P1660 = $P1659."new"("self" :named("name"))
    $P1661 = $P1658."!make"($P1660)
.annotate 'line', 613
    .return ($P1661)
  control_1655:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1662, exception, "payload"
    .return ($P1662)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("94_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1666
.annotate 'line', 617
    new $P1665, 'ExceptionHandler'
    set_addr $P1665, control_1664
    $P1665."handle_types"(.CONTROL_RETURN)
    push_eh $P1665
    .lex "self", self
    .lex "$/", param_1666
.annotate 'line', 618
    new $P1667, "Undef"
    .lex "$past", $P1667
    find_lex $P1668, "$/"
    unless_null $P1668, vivify_526
    $P1668 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1669, $P1668["args"]
    unless_null $P1669, vivify_527
    new $P1669, "Undef"
  vivify_527:
    $P1670 = $P1669."ast"()
    store_lex "$past", $P1670
.annotate 'line', 619
    find_lex $P1671, "$past"
    find_lex $P1672, "$/"
    unless_null $P1672, vivify_528
    $P1672 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1673, $P1672["identifier"]
    unless_null $P1673, vivify_529
    new $P1673, "Undef"
  vivify_529:
    set $S1674, $P1673
    $P1671."name"($S1674)
.annotate 'line', 620
    find_lex $P1675, "$/"
    find_lex $P1676, "$past"
    $P1677 = $P1675."!make"($P1676)
.annotate 'line', 617
    .return ($P1677)
  control_1664:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1678, exception, "payload"
    .return ($P1678)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("95_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1682
.annotate 'line', 623
    new $P1681, 'ExceptionHandler'
    set_addr $P1681, control_1680
    $P1681."handle_types"(.CONTROL_RETURN)
    push_eh $P1681
    .lex "self", self
    .lex "$/", param_1682
.annotate 'line', 624
    $P1683 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1683
.annotate 'line', 625
    new $P1684, "Undef"
    .lex "$name", $P1684
.annotate 'line', 627
    new $P1685, "Undef"
    .lex "$var", $P1685
.annotate 'line', 629
    new $P1686, "Undef"
    .lex "$past", $P1686
.annotate 'line', 624
    find_lex $P1687, "$/"
    unless_null $P1687, vivify_530
    $P1687 = root_new ['parrot';'Hash']
  vivify_530:
    set $P1688, $P1687["name"]
    unless_null $P1688, vivify_531
    $P1688 = root_new ['parrot';'Hash']
  vivify_531:
    set $P1689, $P1688["identifier"]
    unless_null $P1689, vivify_532
    new $P1689, "Undef"
  vivify_532:
    clone $P1690, $P1689
    store_lex "@ns", $P1690
.annotate 'line', 625
    find_lex $P1691, "@ns"
    $P1692 = $P1691."pop"()
    store_lex "$name", $P1692
.annotate 'line', 626
    find_lex $P1696, "@ns"
    if $P1696, if_1695
    set $P1694, $P1696
    goto if_1695_end
  if_1695:
    find_lex $P1697, "@ns"
    unless_null $P1697, vivify_533
    $P1697 = root_new ['parrot';'ResizablePMCArray']
  vivify_533:
    set $P1698, $P1697[0]
    unless_null $P1698, vivify_534
    new $P1698, "Undef"
  vivify_534:
    set $S1699, $P1698
    iseq $I1700, $S1699, "GLOBAL"
    new $P1694, 'Integer'
    set $P1694, $I1700
  if_1695_end:
    unless $P1694, if_1693_end
    find_lex $P1701, "@ns"
    $P1701."shift"()
  if_1693_end:
.annotate 'line', 628
    get_hll_global $P1702, ["PAST"], "Var"
    find_lex $P1703, "$name"
    set $S1704, $P1703
    find_lex $P1705, "@ns"
    $P1706 = $P1702."new"($S1704 :named("name"), $P1705 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1706
.annotate 'line', 629
    find_lex $P1707, "$var"
    store_lex "$past", $P1707
.annotate 'line', 630
    find_lex $P1709, "$/"
    unless_null $P1709, vivify_535
    $P1709 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1710, $P1709["args"]
    unless_null $P1710, vivify_536
    new $P1710, "Undef"
  vivify_536:
    unless $P1710, if_1708_end
.annotate 'line', 631
    find_lex $P1711, "$/"
    unless_null $P1711, vivify_537
    $P1711 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1712, $P1711["args"]
    unless_null $P1712, vivify_538
    $P1712 = root_new ['parrot';'ResizablePMCArray']
  vivify_538:
    set $P1713, $P1712[0]
    unless_null $P1713, vivify_539
    new $P1713, "Undef"
  vivify_539:
    $P1714 = $P1713."ast"()
    store_lex "$past", $P1714
.annotate 'line', 632
    find_lex $P1715, "$past"
    find_lex $P1716, "$var"
    $P1715."unshift"($P1716)
  if_1708_end:
.annotate 'line', 634
    find_lex $P1717, "$/"
    find_lex $P1718, "$past"
    $P1719 = $P1717."!make"($P1718)
.annotate 'line', 623
    .return ($P1719)
  control_1680:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1720, exception, "payload"
    .return ($P1720)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("96_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1724
.annotate 'line', 637
    new $P1723, 'ExceptionHandler'
    set_addr $P1723, control_1722
    $P1723."handle_types"(.CONTROL_RETURN)
    push_eh $P1723
    .lex "self", self
    .lex "$/", param_1724
.annotate 'line', 638
    new $P1725, "Undef"
    .lex "$past", $P1725
.annotate 'line', 639
    new $P1726, "Undef"
    .lex "$pirop", $P1726
.annotate 'line', 638
    find_lex $P1729, "$/"
    unless_null $P1729, vivify_540
    $P1729 = root_new ['parrot';'Hash']
  vivify_540:
    set $P1730, $P1729["args"]
    unless_null $P1730, vivify_541
    new $P1730, "Undef"
  vivify_541:
    if $P1730, if_1728
    get_hll_global $P1735, ["PAST"], "Op"
    find_lex $P1736, "$/"
    $P1737 = $P1735."new"($P1736 :named("node"))
    set $P1727, $P1737
    goto if_1728_end
  if_1728:
    find_lex $P1731, "$/"
    unless_null $P1731, vivify_542
    $P1731 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1732, $P1731["args"]
    unless_null $P1732, vivify_543
    $P1732 = root_new ['parrot';'ResizablePMCArray']
  vivify_543:
    set $P1733, $P1732[0]
    unless_null $P1733, vivify_544
    new $P1733, "Undef"
  vivify_544:
    $P1734 = $P1733."ast"()
    set $P1727, $P1734
  if_1728_end:
    store_lex "$past", $P1727
.annotate 'line', 639
    find_lex $P1738, "$/"
    unless_null $P1738, vivify_545
    $P1738 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1739, $P1738["op"]
    unless_null $P1739, vivify_546
    new $P1739, "Undef"
  vivify_546:
    set $S1740, $P1739
    new $P1741, 'String'
    set $P1741, $S1740
    store_lex "$pirop", $P1741
.annotate 'line', 640

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1742 = box $S0
    
    store_lex "$pirop", $P1742
.annotate 'line', 647
    find_lex $P1743, "$past"
    find_lex $P1744, "$pirop"
    $P1743."pirop"($P1744)
.annotate 'line', 648
    find_lex $P1745, "$past"
    $P1745."pasttype"("pirop")
.annotate 'line', 649
    find_lex $P1746, "$/"
    find_lex $P1747, "$past"
    $P1748 = $P1746."!make"($P1747)
.annotate 'line', 637
    .return ($P1748)
  control_1722:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1749, exception, "payload"
    .return ($P1749)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("97_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1753
.annotate 'line', 652
    new $P1752, 'ExceptionHandler'
    set_addr $P1752, control_1751
    $P1752."handle_types"(.CONTROL_RETURN)
    push_eh $P1752
    .lex "self", self
    .lex "$/", param_1753
    find_lex $P1754, "$/"
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_547
    $P1755 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1756, $P1755["arglist"]
    unless_null $P1756, vivify_548
    new $P1756, "Undef"
  vivify_548:
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
.include "except_types.pasm"
.sub "arglist"  :subid("98_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1763
.annotate 'line', 654
    .const 'Sub' $P1774 = "99_1275811497.55064" 
    capture_lex $P1774
    new $P1762, 'ExceptionHandler'
    set_addr $P1762, control_1761
    $P1762."handle_types"(.CONTROL_RETURN)
    push_eh $P1762
    .lex "self", self
    .lex "$/", param_1763
.annotate 'line', 655
    new $P1764, "Undef"
    .lex "$past", $P1764
.annotate 'line', 663
    new $P1765, "Undef"
    .lex "$i", $P1765
.annotate 'line', 664
    new $P1766, "Undef"
    .lex "$n", $P1766
.annotate 'line', 655
    get_hll_global $P1767, ["PAST"], "Op"
    find_lex $P1768, "$/"
    $P1769 = $P1767."new"("call" :named("pasttype"), $P1768 :named("node"))
    store_lex "$past", $P1769
.annotate 'line', 656
    find_lex $P1771, "$/"
    unless_null $P1771, vivify_549
    $P1771 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1772, $P1771["EXPR"]
    unless_null $P1772, vivify_550
    new $P1772, "Undef"
  vivify_550:
    unless $P1772, if_1770_end
    .const 'Sub' $P1774 = "99_1275811497.55064" 
    capture_lex $P1774
    $P1774()
  if_1770_end:
.annotate 'line', 663
    new $P1806, "Integer"
    assign $P1806, 0
    store_lex "$i", $P1806
.annotate 'line', 664
    find_lex $P1807, "$past"
    $P1808 = $P1807."list"()
    set $N1809, $P1808
    new $P1810, 'Float'
    set $P1810, $N1809
    store_lex "$n", $P1810
.annotate 'line', 665
    new $P1858, 'ExceptionHandler'
    set_addr $P1858, loop1857_handler
    $P1858."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1858
  loop1857_test:
    find_lex $P1811, "$i"
    set $N1812, $P1811
    find_lex $P1813, "$n"
    set $N1814, $P1813
    islt $I1815, $N1812, $N1814
    unless $I1815, loop1857_done
  loop1857_redo:
.annotate 'line', 666
    find_lex $P1817, "$i"
    set $I1818, $P1817
    find_lex $P1819, "$past"
    unless_null $P1819, vivify_554
    $P1819 = root_new ['parrot';'ResizablePMCArray']
  vivify_554:
    set $P1820, $P1819[$I1818]
    unless_null $P1820, vivify_555
    new $P1820, "Undef"
  vivify_555:
    $S1821 = $P1820."name"()
    iseq $I1822, $S1821, "&prefix:<|>"
    unless $I1822, if_1816_end
.annotate 'line', 667
    find_lex $P1823, "$i"
    set $I1824, $P1823
    find_lex $P1825, "$past"
    unless_null $P1825, vivify_556
    $P1825 = root_new ['parrot';'ResizablePMCArray']
  vivify_556:
    set $P1826, $P1825[$I1824]
    unless_null $P1826, vivify_557
    $P1826 = root_new ['parrot';'ResizablePMCArray']
  vivify_557:
    set $P1827, $P1826[0]
    unless_null $P1827, vivify_558
    new $P1827, "Undef"
  vivify_558:
    find_lex $P1828, "$i"
    set $I1829, $P1828
    find_lex $P1830, "$past"
    unless_null $P1830, vivify_559
    $P1830 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1830
  vivify_559:
    set $P1830[$I1829], $P1827
.annotate 'line', 668
    find_lex $P1831, "$i"
    set $I1832, $P1831
    find_lex $P1833, "$past"
    unless_null $P1833, vivify_560
    $P1833 = root_new ['parrot';'ResizablePMCArray']
  vivify_560:
    set $P1834, $P1833[$I1832]
    unless_null $P1834, vivify_561
    new $P1834, "Undef"
  vivify_561:
    $P1834."flat"(1)
.annotate 'line', 669
    find_lex $P1838, "$i"
    set $I1839, $P1838
    find_lex $P1840, "$past"
    unless_null $P1840, vivify_562
    $P1840 = root_new ['parrot';'ResizablePMCArray']
  vivify_562:
    set $P1841, $P1840[$I1839]
    unless_null $P1841, vivify_563
    new $P1841, "Undef"
  vivify_563:
    get_hll_global $P1842, ["PAST"], "Val"
    $P1843 = $P1841."isa"($P1842)
    if $P1843, if_1837
    set $P1836, $P1843
    goto if_1837_end
  if_1837:
.annotate 'line', 670
    find_lex $P1844, "$i"
    set $I1845, $P1844
    find_lex $P1846, "$past"
    unless_null $P1846, vivify_564
    $P1846 = root_new ['parrot';'ResizablePMCArray']
  vivify_564:
    set $P1847, $P1846[$I1845]
    unless_null $P1847, vivify_565
    new $P1847, "Undef"
  vivify_565:
    $S1848 = $P1847."name"()
    substr $S1849, $S1848, 0, 1
    iseq $I1850, $S1849, "%"
    new $P1836, 'Integer'
    set $P1836, $I1850
  if_1837_end:
    unless $P1836, if_1835_end
.annotate 'line', 671
    find_lex $P1851, "$i"
    set $I1852, $P1851
    find_lex $P1853, "$past"
    unless_null $P1853, vivify_566
    $P1853 = root_new ['parrot';'ResizablePMCArray']
  vivify_566:
    set $P1854, $P1853[$I1852]
    unless_null $P1854, vivify_567
    new $P1854, "Undef"
  vivify_567:
    $P1854."named"(1)
  if_1835_end:
  if_1816_end:
.annotate 'line', 666
    find_lex $P1855, "$i"
    clone $P1856, $P1855
    inc $P1855
  loop1857_next:
.annotate 'line', 665
    goto loop1857_test
  loop1857_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1859, exception, 'type'
    eq $P1859, .CONTROL_LOOP_NEXT, loop1857_next
    eq $P1859, .CONTROL_LOOP_REDO, loop1857_redo
  loop1857_done:
    pop_eh 
.annotate 'line', 676
    find_lex $P1860, "$/"
    find_lex $P1861, "$past"
    $P1862 = $P1860."!make"($P1861)
.annotate 'line', 654
    .return ($P1862)
  control_1761:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1863, exception, "payload"
    .return ($P1863)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1773"  :anon :subid("99_1275811497.55064") :outer("98_1275811497.55064")
.annotate 'line', 656
    .const 'Sub' $P1795 = "100_1275811497.55064" 
    capture_lex $P1795
.annotate 'line', 657
    new $P1775, "Undef"
    .lex "$expr", $P1775
    find_lex $P1776, "$/"
    unless_null $P1776, vivify_551
    $P1776 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1777, $P1776["EXPR"]
    unless_null $P1777, vivify_552
    new $P1777, "Undef"
  vivify_552:
    $P1778 = $P1777."ast"()
    store_lex "$expr", $P1778
.annotate 'line', 658
    find_lex $P1783, "$expr"
    $S1784 = $P1783."name"()
    iseq $I1785, $S1784, "&infix:<,>"
    if $I1785, if_1782
    new $P1781, 'Integer'
    set $P1781, $I1785
    goto if_1782_end
  if_1782:
    find_lex $P1786, "$expr"
    $P1787 = $P1786."named"()
    isfalse $I1788, $P1787
    new $P1781, 'Integer'
    set $P1781, $I1788
  if_1782_end:
    if $P1781, if_1780
.annotate 'line', 661
    find_lex $P1803, "$past"
    find_lex $P1804, "$expr"
    $P1805 = $P1803."push"($P1804)
    set $P1779, $P1805
.annotate 'line', 658
    goto if_1780_end
  if_1780:
.annotate 'line', 659
    find_lex $P1790, "$expr"
    $P1791 = $P1790."list"()
    defined $I1792, $P1791
    unless $I1792, for_undef_553
    iter $P1789, $P1791
    new $P1801, 'ExceptionHandler'
    set_addr $P1801, loop1800_handler
    $P1801."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1801
  loop1800_test:
    unless $P1789, loop1800_done
    shift $P1793, $P1789
  loop1800_redo:
    .const 'Sub' $P1795 = "100_1275811497.55064" 
    capture_lex $P1795
    $P1795($P1793)
  loop1800_next:
    goto loop1800_test
  loop1800_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1802, exception, 'type'
    eq $P1802, .CONTROL_LOOP_NEXT, loop1800_next
    eq $P1802, .CONTROL_LOOP_REDO, loop1800_redo
  loop1800_done:
    pop_eh 
  for_undef_553:
.annotate 'line', 658
    set $P1779, $P1789
  if_1780_end:
.annotate 'line', 656
    .return ($P1779)
.end


.namespace ["NQP";"Actions"]
.sub "_block1794"  :anon :subid("100_1275811497.55064") :outer("99_1275811497.55064")
    .param pmc param_1796
.annotate 'line', 659
    .lex "$_", param_1796
    find_lex $P1797, "$past"
    find_lex $P1798, "$_"
    $P1799 = $P1797."push"($P1798)
    .return ($P1799)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("101_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1867
.annotate 'line', 680
    new $P1866, 'ExceptionHandler'
    set_addr $P1866, control_1865
    $P1866."handle_types"(.CONTROL_RETURN)
    push_eh $P1866
    .lex "self", self
    .lex "$/", param_1867
    find_lex $P1868, "$/"
    find_lex $P1869, "$/"
    unless_null $P1869, vivify_568
    $P1869 = root_new ['parrot';'Hash']
  vivify_568:
    set $P1870, $P1869["value"]
    unless_null $P1870, vivify_569
    new $P1870, "Undef"
  vivify_569:
    $P1871 = $P1870."ast"()
    $P1872 = $P1868."!make"($P1871)
    .return ($P1872)
  control_1865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1873, exception, "payload"
    .return ($P1873)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("102_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1877
.annotate 'line', 682
    new $P1876, 'ExceptionHandler'
    set_addr $P1876, control_1875
    $P1876."handle_types"(.CONTROL_RETURN)
    push_eh $P1876
    .lex "self", self
    .lex "$/", param_1877
.annotate 'line', 683
    find_lex $P1878, "$/"
.annotate 'line', 684
    find_lex $P1881, "$/"
    unless_null $P1881, vivify_570
    $P1881 = root_new ['parrot';'Hash']
  vivify_570:
    set $P1882, $P1881["EXPR"]
    unless_null $P1882, vivify_571
    new $P1882, "Undef"
  vivify_571:
    if $P1882, if_1880
.annotate 'line', 685
    get_hll_global $P1887, ["PAST"], "Op"
    find_lex $P1888, "$/"
    $P1889 = $P1887."new"("list" :named("pasttype"), $P1888 :named("node"))
    set $P1879, $P1889
.annotate 'line', 684
    goto if_1880_end
  if_1880:
    find_lex $P1883, "$/"
    unless_null $P1883, vivify_572
    $P1883 = root_new ['parrot';'Hash']
  vivify_572:
    set $P1884, $P1883["EXPR"]
    unless_null $P1884, vivify_573
    $P1884 = root_new ['parrot';'ResizablePMCArray']
  vivify_573:
    set $P1885, $P1884[0]
    unless_null $P1885, vivify_574
    new $P1885, "Undef"
  vivify_574:
    $P1886 = $P1885."ast"()
    set $P1879, $P1886
  if_1880_end:
    $P1890 = $P1878."!make"($P1879)
.annotate 'line', 682
    .return ($P1890)
  control_1875:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1891, exception, "payload"
    .return ($P1891)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("103_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1895
.annotate 'line', 688
    new $P1894, 'ExceptionHandler'
    set_addr $P1894, control_1893
    $P1894."handle_types"(.CONTROL_RETURN)
    push_eh $P1894
    .lex "self", self
    .lex "$/", param_1895
.annotate 'line', 689
    new $P1896, "Undef"
    .lex "$past", $P1896
.annotate 'line', 688
    find_lex $P1897, "$past"
.annotate 'line', 690
    find_lex $P1899, "$/"
    unless_null $P1899, vivify_575
    $P1899 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1900, $P1899["EXPR"]
    unless_null $P1900, vivify_576
    new $P1900, "Undef"
  vivify_576:
    if $P1900, if_1898
.annotate 'line', 697
    get_hll_global $P1912, ["PAST"], "Op"
    $P1913 = $P1912."new"("list" :named("pasttype"))
    store_lex "$past", $P1913
.annotate 'line', 696
    goto if_1898_end
  if_1898:
.annotate 'line', 691
    find_lex $P1901, "$/"
    unless_null $P1901, vivify_577
    $P1901 = root_new ['parrot';'Hash']
  vivify_577:
    set $P1902, $P1901["EXPR"]
    unless_null $P1902, vivify_578
    $P1902 = root_new ['parrot';'ResizablePMCArray']
  vivify_578:
    set $P1903, $P1902[0]
    unless_null $P1903, vivify_579
    new $P1903, "Undef"
  vivify_579:
    $P1904 = $P1903."ast"()
    store_lex "$past", $P1904
.annotate 'line', 692
    find_lex $P1906, "$past"
    $S1907 = $P1906."name"()
    isne $I1908, $S1907, "&infix:<,>"
    unless $I1908, if_1905_end
.annotate 'line', 693
    get_hll_global $P1909, ["PAST"], "Op"
    find_lex $P1910, "$past"
    $P1911 = $P1909."new"($P1910, "list" :named("pasttype"))
    store_lex "$past", $P1911
  if_1905_end:
  if_1898_end:
.annotate 'line', 699
    find_lex $P1914, "$past"
    $P1914."name"("&circumfix:<[ ]>")
.annotate 'line', 700
    find_lex $P1915, "$/"
    find_lex $P1916, "$past"
    $P1917 = $P1915."!make"($P1916)
.annotate 'line', 688
    .return ($P1917)
  control_1893:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1918, exception, "payload"
    .return ($P1918)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("104_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1922
.annotate 'line', 703
    new $P1921, 'ExceptionHandler'
    set_addr $P1921, control_1920
    $P1921."handle_types"(.CONTROL_RETURN)
    push_eh $P1921
    .lex "self", self
    .lex "$/", param_1922
    find_lex $P1923, "$/"
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_580
    $P1924 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1925, $P1924["quote_EXPR"]
    unless_null $P1925, vivify_581
    new $P1925, "Undef"
  vivify_581:
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
.include "except_types.pasm"
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1932
.annotate 'line', 704
    new $P1931, 'ExceptionHandler'
    set_addr $P1931, control_1930
    $P1931."handle_types"(.CONTROL_RETURN)
    push_eh $P1931
    .lex "self", self
    .lex "$/", param_1932
    find_lex $P1933, "$/"
    find_lex $P1934, "$/"
    unless_null $P1934, vivify_582
    $P1934 = root_new ['parrot';'Hash']
  vivify_582:
    set $P1935, $P1934["quote_EXPR"]
    unless_null $P1935, vivify_583
    new $P1935, "Undef"
  vivify_583:
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
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("106_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1942
.annotate 'line', 706
    new $P1941, 'ExceptionHandler'
    set_addr $P1941, control_1940
    $P1941."handle_types"(.CONTROL_RETURN)
    push_eh $P1941
    .lex "self", self
    .lex "$/", param_1942
.annotate 'line', 707
    new $P1943, "Undef"
    .lex "$past", $P1943
    find_lex $P1946, "$/"
    unless_null $P1946, vivify_584
    $P1946 = root_new ['parrot';'Hash']
  vivify_584:
    set $P1947, $P1946["pblock"]
    unless_null $P1947, vivify_585
    $P1947 = root_new ['parrot';'Hash']
  vivify_585:
    set $P1948, $P1947["blockoid"]
    unless_null $P1948, vivify_586
    $P1948 = root_new ['parrot';'Hash']
  vivify_586:
    set $P1949, $P1948["statementlist"]
    unless_null $P1949, vivify_587
    $P1949 = root_new ['parrot';'Hash']
  vivify_587:
    set $P1950, $P1949["statement"]
    unless_null $P1950, vivify_588
    new $P1950, "Undef"
  vivify_588:
    set $N1951, $P1950
    isgt $I1952, $N1951, 0.0
    if $I1952, if_1945
.annotate 'line', 709
    $P1956 = "vivitype"("%")
    set $P1944, $P1956
.annotate 'line', 707
    goto if_1945_end
  if_1945:
.annotate 'line', 708
    find_lex $P1953, "$/"
    unless_null $P1953, vivify_589
    $P1953 = root_new ['parrot';'Hash']
  vivify_589:
    set $P1954, $P1953["pblock"]
    unless_null $P1954, vivify_590
    new $P1954, "Undef"
  vivify_590:
    $P1955 = $P1954."ast"()
    set $P1944, $P1955
  if_1945_end:
    store_lex "$past", $P1944
.annotate 'line', 710
    new $P1957, "Integer"
    assign $P1957, 1
    find_lex $P1958, "$past"
    unless_null $P1958, vivify_591
    $P1958 = root_new ['parrot';'Hash']
    store_lex "$past", $P1958
  vivify_591:
    set $P1958["bareblock"], $P1957
.annotate 'line', 711
    find_lex $P1959, "$/"
    find_lex $P1960, "$past"
    $P1961 = $P1959."!make"($P1960)
.annotate 'line', 706
    .return ($P1961)
  control_1940:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1962, exception, "payload"
    .return ($P1962)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("107_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1966
.annotate 'line', 714
    new $P1965, 'ExceptionHandler'
    set_addr $P1965, control_1964
    $P1965."handle_types"(.CONTROL_RETURN)
    push_eh $P1965
    .lex "self", self
    .lex "$/", param_1966
.annotate 'line', 715
    new $P1967, "Undef"
    .lex "$name", $P1967
    find_lex $P1970, "$/"
    unless_null $P1970, vivify_592
    $P1970 = root_new ['parrot';'Hash']
  vivify_592:
    set $P1971, $P1970["sigil"]
    unless_null $P1971, vivify_593
    new $P1971, "Undef"
  vivify_593:
    set $S1972, $P1971
    iseq $I1973, $S1972, "@"
    if $I1973, if_1969
.annotate 'line', 716
    find_lex $P1977, "$/"
    unless_null $P1977, vivify_594
    $P1977 = root_new ['parrot';'Hash']
  vivify_594:
    set $P1978, $P1977["sigil"]
    unless_null $P1978, vivify_595
    new $P1978, "Undef"
  vivify_595:
    set $S1979, $P1978
    iseq $I1980, $S1979, "%"
    if $I1980, if_1976
    new $P1982, "String"
    assign $P1982, "item"
    set $P1975, $P1982
    goto if_1976_end
  if_1976:
    new $P1981, "String"
    assign $P1981, "hash"
    set $P1975, $P1981
  if_1976_end:
    set $P1968, $P1975
.annotate 'line', 715
    goto if_1969_end
  if_1969:
    new $P1974, "String"
    assign $P1974, "list"
    set $P1968, $P1974
  if_1969_end:
    store_lex "$name", $P1968
.annotate 'line', 718
    find_lex $P1983, "$/"
    get_hll_global $P1984, ["PAST"], "Op"
    find_lex $P1985, "$name"
    find_lex $P1986, "$/"
    unless_null $P1986, vivify_596
    $P1986 = root_new ['parrot';'Hash']
  vivify_596:
    set $P1987, $P1986["semilist"]
    unless_null $P1987, vivify_597
    new $P1987, "Undef"
  vivify_597:
    $P1988 = $P1987."ast"()
    $P1989 = $P1984."new"($P1988, "callmethod" :named("pasttype"), $P1985 :named("name"))
    $P1990 = $P1983."!make"($P1989)
.annotate 'line', 714
    .return ($P1990)
  control_1964:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1991, exception, "payload"
    .return ($P1991)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("108_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_1995
.annotate 'line', 721
    new $P1994, 'ExceptionHandler'
    set_addr $P1994, control_1993
    $P1994."handle_types"(.CONTROL_RETURN)
    push_eh $P1994
    .lex "self", self
    .lex "$/", param_1995
    find_lex $P1996, "$/"
    find_lex $P1997, "$/"
    unless_null $P1997, vivify_598
    $P1997 = root_new ['parrot';'Hash']
  vivify_598:
    set $P1998, $P1997["statement"]
    unless_null $P1998, vivify_599
    new $P1998, "Undef"
  vivify_599:
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
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("109_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2005
.annotate 'line', 723
    new $P2004, 'ExceptionHandler'
    set_addr $P2004, control_2003
    $P2004."handle_types"(.CONTROL_RETURN)
    push_eh $P2004
    .lex "self", self
    .lex "$/", param_2005
.annotate 'line', 724
    find_lex $P2006, "$/"
    get_hll_global $P2007, ["PAST"], "Var"
    find_lex $P2008, "$/"
    unless_null $P2008, vivify_600
    $P2008 = root_new ['parrot';'Hash']
  vivify_600:
    set $P2009, $P2008["EXPR"]
    unless_null $P2009, vivify_601
    new $P2009, "Undef"
  vivify_601:
    $P2010 = $P2009."ast"()
.annotate 'line', 726
    $P2011 = "vivitype"("@")
    $P2012 = $P2007."new"($P2010, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P2011 :named("vivibase"))
.annotate 'line', 724
    $P2013 = $P2006."!make"($P2012)
.annotate 'line', 723
    .return ($P2013)
  control_2003:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2014, exception, "payload"
    .return ($P2014)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("110_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2018
.annotate 'line', 729
    new $P2017, 'ExceptionHandler'
    set_addr $P2017, control_2016
    $P2017."handle_types"(.CONTROL_RETURN)
    push_eh $P2017
    .lex "self", self
    .lex "$/", param_2018
.annotate 'line', 730
    find_lex $P2019, "$/"
    get_hll_global $P2020, ["PAST"], "Var"
    find_lex $P2021, "$/"
    unless_null $P2021, vivify_602
    $P2021 = root_new ['parrot';'Hash']
  vivify_602:
    set $P2022, $P2021["EXPR"]
    unless_null $P2022, vivify_603
    new $P2022, "Undef"
  vivify_603:
    $P2023 = $P2022."ast"()
.annotate 'line', 732
    $P2024 = "vivitype"("%")
    $P2025 = $P2020."new"($P2023, "keyed" :named("scope"), "Undef" :named("viviself"), $P2024 :named("vivibase"))
.annotate 'line', 730
    $P2026 = $P2019."!make"($P2025)
.annotate 'line', 729
    .return ($P2026)
  control_2016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2027, exception, "payload"
    .return ($P2027)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("111_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2031
.annotate 'line', 735
    new $P2030, 'ExceptionHandler'
    set_addr $P2030, control_2029
    $P2030."handle_types"(.CONTROL_RETURN)
    push_eh $P2030
    .lex "self", self
    .lex "$/", param_2031
.annotate 'line', 736
    find_lex $P2032, "$/"
    get_hll_global $P2033, ["PAST"], "Var"
    find_lex $P2034, "$/"
    unless_null $P2034, vivify_604
    $P2034 = root_new ['parrot';'Hash']
  vivify_604:
    set $P2035, $P2034["quote_EXPR"]
    unless_null $P2035, vivify_605
    new $P2035, "Undef"
  vivify_605:
    $P2036 = $P2035."ast"()
.annotate 'line', 738
    $P2037 = "vivitype"("%")
    $P2038 = $P2033."new"($P2036, "keyed" :named("scope"), "Undef" :named("viviself"), $P2037 :named("vivibase"))
.annotate 'line', 736
    $P2039 = $P2032."!make"($P2038)
.annotate 'line', 735
    .return ($P2039)
  control_2029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2040, exception, "payload"
    .return ($P2040)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("112_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2044
.annotate 'line', 741
    new $P2043, 'ExceptionHandler'
    set_addr $P2043, control_2042
    $P2043."handle_types"(.CONTROL_RETURN)
    push_eh $P2043
    .lex "self", self
    .lex "$/", param_2044
.annotate 'line', 742
    find_lex $P2045, "$/"
    find_lex $P2046, "$/"
    unless_null $P2046, vivify_606
    $P2046 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2047, $P2046["arglist"]
    unless_null $P2047, vivify_607
    new $P2047, "Undef"
  vivify_607:
    $P2048 = $P2047."ast"()
    $P2049 = $P2045."!make"($P2048)
.annotate 'line', 741
    .return ($P2049)
  control_2042:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2050, exception, "payload"
    .return ($P2050)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("113_1275811497.55064") :method :outer("11_1275811497.55064")
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
    find_lex $P2058, "$/"
    unless_null $P2058, vivify_608
    $P2058 = root_new ['parrot';'Hash']
  vivify_608:
    set $P2059, $P2058["quote"]
    unless_null $P2059, vivify_609
    new $P2059, "Undef"
  vivify_609:
    if $P2059, if_2057
    find_lex $P2063, "$/"
    unless_null $P2063, vivify_610
    $P2063 = root_new ['parrot';'Hash']
  vivify_610:
    set $P2064, $P2063["number"]
    unless_null $P2064, vivify_611
    new $P2064, "Undef"
  vivify_611:
    $P2065 = $P2064."ast"()
    set $P2056, $P2065
    goto if_2057_end
  if_2057:
    find_lex $P2060, "$/"
    unless_null $P2060, vivify_612
    $P2060 = root_new ['parrot';'Hash']
  vivify_612:
    set $P2061, $P2060["quote"]
    unless_null $P2061, vivify_613
    new $P2061, "Undef"
  vivify_613:
    $P2062 = $P2061."ast"()
    set $P2056, $P2062
  if_2057_end:
    $P2066 = $P2055."!make"($P2056)
.annotate 'line', 745
    .return ($P2066)
  control_2052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2067, exception, "payload"
    .return ($P2067)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("114_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2071
.annotate 'line', 749
    new $P2070, 'ExceptionHandler'
    set_addr $P2070, control_2069
    $P2070."handle_types"(.CONTROL_RETURN)
    push_eh $P2070
    .lex "self", self
    .lex "$/", param_2071
.annotate 'line', 750
    new $P2072, "Undef"
    .lex "$value", $P2072
    find_lex $P2075, "$/"
    unless_null $P2075, vivify_614
    $P2075 = root_new ['parrot';'Hash']
  vivify_614:
    set $P2076, $P2075["dec_number"]
    unless_null $P2076, vivify_615
    new $P2076, "Undef"
  vivify_615:
    if $P2076, if_2074
    find_lex $P2080, "$/"
    unless_null $P2080, vivify_616
    $P2080 = root_new ['parrot';'Hash']
  vivify_616:
    set $P2081, $P2080["integer"]
    unless_null $P2081, vivify_617
    new $P2081, "Undef"
  vivify_617:
    $P2082 = $P2081."ast"()
    set $P2073, $P2082
    goto if_2074_end
  if_2074:
    find_lex $P2077, "$/"
    unless_null $P2077, vivify_618
    $P2077 = root_new ['parrot';'Hash']
  vivify_618:
    set $P2078, $P2077["dec_number"]
    unless_null $P2078, vivify_619
    new $P2078, "Undef"
  vivify_619:
    $P2079 = $P2078."ast"()
    set $P2073, $P2079
  if_2074_end:
    store_lex "$value", $P2073
.annotate 'line', 751
    find_lex $P2084, "$/"
    unless_null $P2084, vivify_620
    $P2084 = root_new ['parrot';'Hash']
  vivify_620:
    set $P2085, $P2084["sign"]
    unless_null $P2085, vivify_621
    new $P2085, "Undef"
  vivify_621:
    set $S2086, $P2085
    iseq $I2087, $S2086, "-"
    unless $I2087, if_2083_end
    find_lex $P2088, "$value"
    neg $P2089, $P2088
    store_lex "$value", $P2089
  if_2083_end:
.annotate 'line', 752
    find_lex $P2090, "$/"
    get_hll_global $P2091, ["PAST"], "Val"
    find_lex $P2092, "$value"
    $P2093 = $P2091."new"($P2092 :named("value"))
    $P2094 = $P2090."!make"($P2093)
.annotate 'line', 749
    .return ($P2094)
  control_2069:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2095, exception, "payload"
    .return ($P2095)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("115_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2099
.annotate 'line', 755
    new $P2098, 'ExceptionHandler'
    set_addr $P2098, control_2097
    $P2098."handle_types"(.CONTROL_RETURN)
    push_eh $P2098
    .lex "self", self
    .lex "$/", param_2099
    find_lex $P2100, "$/"
    find_lex $P2101, "$/"
    unless_null $P2101, vivify_622
    $P2101 = root_new ['parrot';'Hash']
  vivify_622:
    set $P2102, $P2101["quote_EXPR"]
    unless_null $P2102, vivify_623
    new $P2102, "Undef"
  vivify_623:
    $P2103 = $P2102."ast"()
    $P2104 = $P2100."!make"($P2103)
    .return ($P2104)
  control_2097:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2105, exception, "payload"
    .return ($P2105)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<dblq>"  :subid("116_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2109
.annotate 'line', 756
    new $P2108, 'ExceptionHandler'
    set_addr $P2108, control_2107
    $P2108."handle_types"(.CONTROL_RETURN)
    push_eh $P2108
    .lex "self", self
    .lex "$/", param_2109
    find_lex $P2110, "$/"
    find_lex $P2111, "$/"
    unless_null $P2111, vivify_624
    $P2111 = root_new ['parrot';'Hash']
  vivify_624:
    set $P2112, $P2111["quote_EXPR"]
    unless_null $P2112, vivify_625
    new $P2112, "Undef"
  vivify_625:
    $P2113 = $P2112."ast"()
    $P2114 = $P2110."!make"($P2113)
    .return ($P2114)
  control_2107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2115, exception, "payload"
    .return ($P2115)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<qq>"  :subid("117_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2119
.annotate 'line', 757
    new $P2118, 'ExceptionHandler'
    set_addr $P2118, control_2117
    $P2118."handle_types"(.CONTROL_RETURN)
    push_eh $P2118
    .lex "self", self
    .lex "$/", param_2119
    find_lex $P2120, "$/"
    find_lex $P2121, "$/"
    unless_null $P2121, vivify_626
    $P2121 = root_new ['parrot';'Hash']
  vivify_626:
    set $P2122, $P2121["quote_EXPR"]
    unless_null $P2122, vivify_627
    new $P2122, "Undef"
  vivify_627:
    $P2123 = $P2122."ast"()
    $P2124 = $P2120."!make"($P2123)
    .return ($P2124)
  control_2117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2125, exception, "payload"
    .return ($P2125)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<q>"  :subid("118_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2129
.annotate 'line', 758
    new $P2128, 'ExceptionHandler'
    set_addr $P2128, control_2127
    $P2128."handle_types"(.CONTROL_RETURN)
    push_eh $P2128
    .lex "self", self
    .lex "$/", param_2129
    find_lex $P2130, "$/"
    find_lex $P2131, "$/"
    unless_null $P2131, vivify_628
    $P2131 = root_new ['parrot';'Hash']
  vivify_628:
    set $P2132, $P2131["quote_EXPR"]
    unless_null $P2132, vivify_629
    new $P2132, "Undef"
  vivify_629:
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
.sub "quote:sym<Q>"  :subid("119_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2139
.annotate 'line', 759
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
.sub "quote:sym<Q:PIR>"  :subid("120_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2149
.annotate 'line', 760
    new $P2148, 'ExceptionHandler'
    set_addr $P2148, control_2147
    $P2148."handle_types"(.CONTROL_RETURN)
    push_eh $P2148
    .lex "self", self
    .lex "$/", param_2149
.annotate 'line', 761
    find_lex $P2150, "$/"
    get_hll_global $P2151, ["PAST"], "Op"
    find_lex $P2152, "$/"
    unless_null $P2152, vivify_632
    $P2152 = root_new ['parrot';'Hash']
  vivify_632:
    set $P2153, $P2152["quote_EXPR"]
    unless_null $P2153, vivify_633
    new $P2153, "Undef"
  vivify_633:
    $P2154 = $P2153."ast"()
    $P2155 = $P2154."value"()
    find_lex $P2156, "$/"
    $P2157 = $P2151."new"($P2155 :named("inline"), "inline" :named("pasttype"), $P2156 :named("node"))
    $P2158 = $P2150."!make"($P2157)
.annotate 'line', 760
    .return ($P2158)
  control_2147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2159, exception, "payload"
    .return ($P2159)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("121_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2163
    .param pmc param_2164 :optional
    .param int has_param_2164 :opt_flag
.annotate 'line', 766
    new $P2162, 'ExceptionHandler'
    set_addr $P2162, control_2161
    $P2162."handle_types"(.CONTROL_RETURN)
    push_eh $P2162
    .lex "self", self
    .lex "$/", param_2163
    if has_param_2164, optparam_634
    new $P2165, "Undef"
    set param_2164, $P2165
  optparam_634:
    .lex "$key", param_2164
.annotate 'line', 776
    new $P2166, "Undef"
    .lex "$regex", $P2166
.annotate 'line', 778
    new $P2167, "Undef"
    .lex "$past", $P2167
.annotate 'line', 767
    find_lex $P2169, "$key"
    set $S2170, $P2169
    iseq $I2171, $S2170, "open"
    unless $I2171, if_2168_end
.annotate 'line', 768

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 772
    get_global $P2172, "@BLOCK"
    unless_null $P2172, vivify_635
    $P2172 = root_new ['parrot';'ResizablePMCArray']
  vivify_635:
    set $P2173, $P2172[0]
    unless_null $P2173, vivify_636
    new $P2173, "Undef"
  vivify_636:
    $P2173."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 773
    get_global $P2174, "@BLOCK"
    unless_null $P2174, vivify_637
    $P2174 = root_new ['parrot';'ResizablePMCArray']
  vivify_637:
    set $P2175, $P2174[0]
    unless_null $P2175, vivify_638
    new $P2175, "Undef"
  vivify_638:
    $P2175."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 774
    new $P2176, "Exception"
    set $P2176['type'], .CONTROL_RETURN
    new $P2177, "Integer"
    assign $P2177, 0
    setattribute $P2176, 'payload', $P2177
    throw $P2176
  if_2168_end:
.annotate 'line', 777
    get_hll_global $P2178, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2179, "$/"
    unless_null $P2179, vivify_639
    $P2179 = root_new ['parrot';'Hash']
  vivify_639:
    set $P2180, $P2179["p6regex"]
    unless_null $P2180, vivify_640
    new $P2180, "Undef"
  vivify_640:
    $P2181 = $P2180."ast"()
    get_global $P2182, "@BLOCK"
    $P2183 = $P2182."shift"()
    $P2184 = $P2178($P2181, $P2183)
    store_lex "$regex", $P2184
.annotate 'line', 779
    get_hll_global $P2185, ["PAST"], "Op"
.annotate 'line', 781
    get_hll_global $P2186, ["PAST"], "Var"
    new $P2187, "ResizablePMCArray"
    push $P2187, "Regex"
    $P2188 = $P2186."new"("Regex" :named("name"), $P2187 :named("namespace"), "package" :named("scope"))
    find_lex $P2189, "$regex"
    $P2190 = $P2185."new"($P2188, $P2189, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 779
    store_lex "$past", $P2190
.annotate 'line', 785
    find_lex $P2191, "$regex"
    find_lex $P2192, "$past"
    unless_null $P2192, vivify_641
    $P2192 = root_new ['parrot';'Hash']
    store_lex "$past", $P2192
  vivify_641:
    set $P2192["sink"], $P2191
.annotate 'line', 786
    find_lex $P2193, "$/"
    find_lex $P2194, "$past"
    $P2195 = $P2193."!make"($P2194)
.annotate 'line', 766
    .return ($P2195)
  control_2161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2196, exception, "payload"
    .return ($P2196)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("122_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2200
.annotate 'line', 789
    new $P2199, 'ExceptionHandler'
    set_addr $P2199, control_2198
    $P2199."handle_types"(.CONTROL_RETURN)
    push_eh $P2199
    .lex "self", self
    .lex "$/", param_2200
    find_lex $P2201, "$/"
    find_lex $P2202, "$/"
    unless_null $P2202, vivify_642
    $P2202 = root_new ['parrot';'Hash']
  vivify_642:
    set $P2203, $P2202["variable"]
    unless_null $P2203, vivify_643
    new $P2203, "Undef"
  vivify_643:
    $P2204 = $P2203."ast"()
    $P2205 = $P2201."!make"($P2204)
    .return ($P2205)
  control_2198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2206, exception, "payload"
    .return ($P2206)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("123_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2210
.annotate 'line', 790
    new $P2209, 'ExceptionHandler'
    set_addr $P2209, control_2208
    $P2209."handle_types"(.CONTROL_RETURN)
    push_eh $P2209
    .lex "self", self
    .lex "$/", param_2210
.annotate 'line', 791
    find_lex $P2211, "$/"
    get_hll_global $P2212, ["PAST"], "Op"
.annotate 'line', 792
    find_lex $P2213, "$/"
    unless_null $P2213, vivify_644
    $P2213 = root_new ['parrot';'Hash']
  vivify_644:
    set $P2214, $P2213["block"]
    unless_null $P2214, vivify_645
    new $P2214, "Undef"
  vivify_645:
    $P2215 = $P2214."ast"()
    $P2216 = "block_immediate"($P2215)
    find_lex $P2217, "$/"
    $P2218 = $P2212."new"($P2216, "set S*" :named("pirop"), $P2217 :named("node"))
.annotate 'line', 791
    $P2219 = $P2211."!make"($P2218)
.annotate 'line', 790
    .return ($P2219)
  control_2208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2220, exception, "payload"
    .return ($P2220)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("124_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2224
.annotate 'line', 795
    new $P2223, 'ExceptionHandler'
    set_addr $P2223, control_2222
    $P2223."handle_types"(.CONTROL_RETURN)
    push_eh $P2223
    .lex "self", self
    .lex "$/", param_2224
    find_lex $P2225, "$/"
    $P2226 = $P2225."!make"("\e")
    .return ($P2226)
  control_2222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2227, exception, "payload"
    .return ($P2227)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("125_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2231
.annotate 'line', 799
    new $P2230, 'ExceptionHandler'
    set_addr $P2230, control_2229
    $P2230."handle_types"(.CONTROL_RETURN)
    push_eh $P2230
    .lex "self", self
    .lex "$/", param_2231
    find_lex $P2232, "$/"
    find_lex $P2233, "$/"
    unless_null $P2233, vivify_646
    $P2233 = root_new ['parrot';'Hash']
  vivify_646:
    set $P2234, $P2233["dotty"]
    unless_null $P2234, vivify_647
    new $P2234, "Undef"
  vivify_647:
    $P2235 = $P2234."ast"()
    $P2236 = $P2232."!make"($P2235)
    .return ($P2236)
  control_2229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2237, exception, "payload"
    .return ($P2237)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("126_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2241
.annotate 'line', 801
    new $P2240, 'ExceptionHandler'
    set_addr $P2240, control_2239
    $P2240."handle_types"(.CONTROL_RETURN)
    push_eh $P2240
    .lex "self", self
    .lex "$/", param_2241
.annotate 'line', 802
    find_lex $P2242, "$/"
    get_hll_global $P2243, ["PAST"], "Op"
.annotate 'line', 803
    new $P2244, "ResizablePMCArray"
    push $P2244, "    clone %r, %0"
    push $P2244, "    inc %0"
    $P2245 = $P2243."new"("postfix:<++>" :named("name"), $P2244 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 802
    $P2246 = $P2242."!make"($P2245)
.annotate 'line', 801
    .return ($P2246)
  control_2239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2247, exception, "payload"
    .return ($P2247)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("127_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2251
.annotate 'line', 807
    new $P2250, 'ExceptionHandler'
    set_addr $P2250, control_2249
    $P2250."handle_types"(.CONTROL_RETURN)
    push_eh $P2250
    .lex "self", self
    .lex "$/", param_2251
.annotate 'line', 808
    find_lex $P2252, "$/"
    get_hll_global $P2253, ["PAST"], "Op"
.annotate 'line', 809
    new $P2254, "ResizablePMCArray"
    push $P2254, "    clone %r, %0"
    push $P2254, "    dec %0"
    $P2255 = $P2253."new"("postfix:<-->" :named("name"), $P2254 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 808
    $P2256 = $P2252."!make"($P2255)
.annotate 'line', 807
    .return ($P2256)
  control_2249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2257, exception, "payload"
    .return ($P2257)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("128_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2261
.annotate 'line', 813
    new $P2260, 'ExceptionHandler'
    set_addr $P2260, control_2259
    $P2260."handle_types"(.CONTROL_RETURN)
    push_eh $P2260
    .lex "self", self
    .lex "$/", param_2261
.annotate 'line', 814
    find_lex $P2262, "$/"
    get_hll_global $P2263, ["PAST"], "Op"
.annotate 'line', 815
    get_hll_global $P2264, ["PAST"], "Var"
    $P2265 = $P2264."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2266, "$/"
    $P2267 = $P2263."new"($P2265, "callmethod" :named("pasttype"), "!make" :named("name"), $P2266 :named("node"))
.annotate 'line', 814
    $P2268 = $P2262."!make"($P2267)
.annotate 'line', 813
    .return ($P2268)
  control_2259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2269, exception, "payload"
    .return ($P2269)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("129_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2274
.annotate 'line', 831
    new $P2273, 'ExceptionHandler'
    set_addr $P2273, control_2272
    $P2273."handle_types"(.CONTROL_RETURN)
    push_eh $P2273
    .lex "self", self
    .lex "$/", param_2274
    find_lex $P2275, "$/"
    $P2276 = "control"($P2275, "CONTROL_LOOP_NEXT")
    .return ($P2276)
  control_2272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2277, exception, "payload"
    .return ($P2277)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("130_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2281
.annotate 'line', 832
    new $P2280, 'ExceptionHandler'
    set_addr $P2280, control_2279
    $P2280."handle_types"(.CONTROL_RETURN)
    push_eh $P2280
    .lex "self", self
    .lex "$/", param_2281
    find_lex $P2282, "$/"
    $P2283 = "control"($P2282, "CONTROL_LOOP_LAST")
    .return ($P2283)
  control_2279:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2284, exception, "payload"
    .return ($P2284)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("131_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2288
.annotate 'line', 833
    new $P2287, 'ExceptionHandler'
    set_addr $P2287, control_2286
    $P2287."handle_types"(.CONTROL_RETURN)
    push_eh $P2287
    .lex "self", self
    .lex "$/", param_2288
    find_lex $P2289, "$/"
    $P2290 = "control"($P2289, "CONTROL_LOOP_REDO")
    .return ($P2290)
  control_2286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2291, exception, "payload"
    .return ($P2291)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("132_1275811497.55064") :method :outer("11_1275811497.55064")
    .param pmc param_2295
.annotate 'line', 835
    new $P2294, 'ExceptionHandler'
    set_addr $P2294, control_2293
    $P2294."handle_types"(.CONTROL_RETURN)
    push_eh $P2294
    .lex "self", self
    .lex "$/", param_2295
.annotate 'line', 836
    find_lex $P2296, "$/"
    get_hll_global $P2297, ["PAST"], "Op"
    find_lex $P2298, "$/"
    $P2299 = $P2297."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2298 :named("node"))
    $P2300 = $P2296."!make"($P2299)
.annotate 'line', 835
    .return ($P2300)
  control_2293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2301, exception, "payload"
    .return ($P2301)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2302"  :subid("133_1275811497.55064") :outer("11_1275811497.55064")
.annotate 'line', 840
    .const 'Sub' $P2388 = "140_1275811497.55064" 
    capture_lex $P2388
    .const 'Sub' $P2375 = "139_1275811497.55064" 
    capture_lex $P2375
    .const 'Sub' $P2358 = "138_1275811497.55064" 
    capture_lex $P2358
    .const 'Sub' $P2345 = "137_1275811497.55064" 
    capture_lex $P2345
    .const 'Sub' $P2332 = "136_1275811497.55064" 
    capture_lex $P2332
    .const 'Sub' $P2319 = "135_1275811497.55064" 
    capture_lex $P2319
    .const 'Sub' $P2304 = "134_1275811497.55064" 
    capture_lex $P2304
.annotate 'line', 874
    .const 'Sub' $P2388 = "140_1275811497.55064" 
    newclosure $P2413, $P2388
.annotate 'line', 840
    .return ($P2413)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("134_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2307
.annotate 'line', 842
    new $P2306, 'ExceptionHandler'
    set_addr $P2306, control_2305
    $P2306."handle_types"(.CONTROL_RETURN)
    push_eh $P2306
    .lex "self", self
    .lex "$/", param_2307
.annotate 'line', 843
    new $P2308, "Undef"
    .lex "$past", $P2308
    find_lex $P2309, "$/"
    unless_null $P2309, vivify_648
    $P2309 = root_new ['parrot';'Hash']
  vivify_648:
    set $P2310, $P2309["statement"]
    unless_null $P2310, vivify_649
    new $P2310, "Undef"
  vivify_649:
    $P2311 = $P2310."ast"()
    store_lex "$past", $P2311
.annotate 'line', 844
    find_lex $P2312, "$/"
    get_hll_global $P2313, ["PAST"], "Regex"
    find_lex $P2314, "$past"
    find_lex $P2315, "$/"
    $P2316 = $P2313."new"($P2314, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P2315 :named("node"))
    $P2317 = $P2312."!make"($P2316)
.annotate 'line', 842
    .return ($P2317)
  control_2305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2318, exception, "payload"
    .return ($P2318)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("135_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2322
.annotate 'line', 848
    new $P2321, 'ExceptionHandler'
    set_addr $P2321, control_2320
    $P2321."handle_types"(.CONTROL_RETURN)
    push_eh $P2321
    .lex "self", self
    .lex "$/", param_2322
.annotate 'line', 849
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
.annotate 'line', 848
    .return ($P2330)
  control_2320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2331, exception, "payload"
    .return ($P2331)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("136_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2335
.annotate 'line', 853
    new $P2334, 'ExceptionHandler'
    set_addr $P2334, control_2333
    $P2334."handle_types"(.CONTROL_RETURN)
    push_eh $P2334
    .lex "self", self
    .lex "$/", param_2335
.annotate 'line', 854
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
.annotate 'line', 853
    .return ($P2343)
  control_2333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2344, exception, "payload"
    .return ($P2344)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("137_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2348
.annotate 'line', 858
    new $P2347, 'ExceptionHandler'
    set_addr $P2347, control_2346
    $P2347."handle_types"(.CONTROL_RETURN)
    push_eh $P2347
    .lex "self", self
    .lex "$/", param_2348
.annotate 'line', 859
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
.annotate 'line', 858
    .return ($P2356)
  control_2346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2357, exception, "payload"
    .return ($P2357)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("138_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2361
.annotate 'line', 863
    new $P2360, 'ExceptionHandler'
    set_addr $P2360, control_2359
    $P2360."handle_types"(.CONTROL_RETURN)
    push_eh $P2360
    .lex "self", self
    .lex "$/", param_2361
.annotate 'line', 864
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
.annotate 'line', 865
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
.annotate 'line', 864
    $P2373 = $P2362."!make"($P2372)
.annotate 'line', 863
    .return ($P2373)
  control_2359:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2374, exception, "payload"
    .return ($P2374)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("139_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2378
.annotate 'line', 869
    new $P2377, 'ExceptionHandler'
    set_addr $P2377, control_2376
    $P2377."handle_types"(.CONTROL_RETURN)
    push_eh $P2377
    .lex "self", self
    .lex "$/", param_2378
.annotate 'line', 870
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
.annotate 'line', 869
    .return ($P2386)
  control_2376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2387, exception, "payload"
    .return ($P2387)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("140_1275811497.55064") :method :outer("133_1275811497.55064")
    .param pmc param_2391
.annotate 'line', 874
    new $P2390, 'ExceptionHandler'
    set_addr $P2390, control_2389
    $P2390."handle_types"(.CONTROL_RETURN)
    push_eh $P2390
    .lex "self", self
    .lex "$/", param_2391
.annotate 'line', 875
    new $P2392, "Undef"
    .lex "$block", $P2392
.annotate 'line', 877
    new $P2393, "Undef"
    .lex "$past", $P2393
.annotate 'line', 875
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
.annotate 'line', 876
    find_lex $P2397, "$block"
    $P2397."blocktype"("immediate")
.annotate 'line', 878
    get_hll_global $P2398, ["PAST"], "Stmts"
.annotate 'line', 879
    get_hll_global $P2399, ["PAST"], "Op"
.annotate 'line', 880
    get_hll_global $P2400, ["PAST"], "Var"
    $P2401 = $P2400."new"("$/" :named("name"))
.annotate 'line', 881
    get_hll_global $P2402, ["PAST"], "Op"
.annotate 'line', 882
    get_hll_global $P2403, ["PAST"], "Var"
    $P2404 = $P2403."new"(unicode:"$\x{a2}" :named("name"))
    $P2405 = $P2402."new"($P2404, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 881
    $P2406 = $P2399."new"($P2401, $P2405, "bind" :named("pasttype"))
.annotate 'line', 879
    find_lex $P2407, "$block"
    $P2408 = $P2398."new"($P2406, $P2407)
.annotate 'line', 878
    store_lex "$past", $P2408
.annotate 'line', 890
    find_lex $P2409, "$/"
    find_lex $P2410, "$past"
    $P2411 = $P2409."!make"($P2410)
.annotate 'line', 874
    .return ($P2411)
  control_2389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2412, exception, "payload"
    .return ($P2412)
.end


.namespace ["NQP";"Actions"]
.sub "_block2415" :load :anon :subid("141_1275811497.55064")
.annotate 'line', 3
    .const 'Sub' $P2417 = "11_1275811497.55064" 
    $P2418 = $P2417()
    .return ($P2418)
.end


.namespace []
.sub "_block2425" :load :anon :subid("143_1275811497.55064")
.annotate 'line', 1
    .const 'Sub' $P2427 = "10_1275811497.55064" 
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
