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
.sub "_block11"  :anon :subid("10_1278500537.15927")
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
    .const 'Sub' $P1458 = "371_1278500537.15927" 
    .return ($P1458)
.end


.namespace []
.sub "" :load :init :subid("post372") :outer("10_1278500537.15927")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1278500537.15927" 
    .local pmc block
    set block, $P12
    $P1461 = get_root_global ["parrot"], "P6metaclass"
    $P1461."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1278500537.15927") :outer("10_1278500537.15927")
.annotate 'line', 4
    get_hll_global $P1372, ["NQP";"Regex"], "_block1371" 
    capture_lex $P1372
    .const 'Sub' $P1358 = "348_1278500537.15927" 
    capture_lex $P1358
    .const 'Sub' $P1352 = "346_1278500537.15927" 
    capture_lex $P1352
    .const 'Sub' $P1346 = "344_1278500537.15927" 
    capture_lex $P1346
    .const 'Sub' $P1340 = "342_1278500537.15927" 
    capture_lex $P1340
    .const 'Sub' $P1334 = "340_1278500537.15927" 
    capture_lex $P1334
    .const 'Sub' $P1328 = "338_1278500537.15927" 
    capture_lex $P1328
    .const 'Sub' $P1321 = "336_1278500537.15927" 
    capture_lex $P1321
    .const 'Sub' $P1314 = "334_1278500537.15927" 
    capture_lex $P1314
    .const 'Sub' $P1307 = "332_1278500537.15927" 
    capture_lex $P1307
    .const 'Sub' $P1300 = "330_1278500537.15927" 
    capture_lex $P1300
    .const 'Sub' $P1294 = "328_1278500537.15927" 
    capture_lex $P1294
    .const 'Sub' $P1287 = "326_1278500537.15927" 
    capture_lex $P1287
    .const 'Sub' $P1280 = "324_1278500537.15927" 
    capture_lex $P1280
    .const 'Sub' $P1273 = "322_1278500537.15927" 
    capture_lex $P1273
    .const 'Sub' $P1266 = "320_1278500537.15927" 
    capture_lex $P1266
    .const 'Sub' $P1259 = "318_1278500537.15927" 
    capture_lex $P1259
    .const 'Sub' $P1252 = "316_1278500537.15927" 
    capture_lex $P1252
    .const 'Sub' $P1245 = "314_1278500537.15927" 
    capture_lex $P1245
    .const 'Sub' $P1238 = "312_1278500537.15927" 
    capture_lex $P1238
    .const 'Sub' $P1231 = "310_1278500537.15927" 
    capture_lex $P1231
    .const 'Sub' $P1224 = "308_1278500537.15927" 
    capture_lex $P1224
    .const 'Sub' $P1217 = "306_1278500537.15927" 
    capture_lex $P1217
    .const 'Sub' $P1210 = "304_1278500537.15927" 
    capture_lex $P1210
    .const 'Sub' $P1203 = "302_1278500537.15927" 
    capture_lex $P1203
    .const 'Sub' $P1196 = "300_1278500537.15927" 
    capture_lex $P1196
    .const 'Sub' $P1189 = "298_1278500537.15927" 
    capture_lex $P1189
    .const 'Sub' $P1182 = "296_1278500537.15927" 
    capture_lex $P1182
    .const 'Sub' $P1175 = "294_1278500537.15927" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "292_1278500537.15927" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "290_1278500537.15927" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "288_1278500537.15927" 
    capture_lex $P1154
    .const 'Sub' $P1147 = "286_1278500537.15927" 
    capture_lex $P1147
    .const 'Sub' $P1140 = "284_1278500537.15927" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "282_1278500537.15927" 
    capture_lex $P1133
    .const 'Sub' $P1126 = "280_1278500537.15927" 
    capture_lex $P1126
    .const 'Sub' $P1119 = "278_1278500537.15927" 
    capture_lex $P1119
    .const 'Sub' $P1112 = "276_1278500537.15927" 
    capture_lex $P1112
    .const 'Sub' $P1105 = "274_1278500537.15927" 
    capture_lex $P1105
    .const 'Sub' $P1098 = "272_1278500537.15927" 
    capture_lex $P1098
    .const 'Sub' $P1091 = "270_1278500537.15927" 
    capture_lex $P1091
    .const 'Sub' $P1085 = "268_1278500537.15927" 
    capture_lex $P1085
    .const 'Sub' $P1078 = "266_1278500537.15927" 
    capture_lex $P1078
    .const 'Sub' $P1071 = "264_1278500537.15927" 
    capture_lex $P1071
    .const 'Sub' $P1064 = "262_1278500537.15927" 
    capture_lex $P1064
    .const 'Sub' $P1057 = "260_1278500537.15927" 
    capture_lex $P1057
    .const 'Sub' $P1050 = "258_1278500537.15927" 
    capture_lex $P1050
    .const 'Sub' $P1043 = "256_1278500537.15927" 
    capture_lex $P1043
    .const 'Sub' $P1036 = "254_1278500537.15927" 
    capture_lex $P1036
    .const 'Sub' $P1030 = "252_1278500537.15927" 
    capture_lex $P1030
    .const 'Sub' $P1024 = "250_1278500537.15927" 
    capture_lex $P1024
    .const 'Sub' $P1019 = "248_1278500537.15927" 
    capture_lex $P1019
    .const 'Sub' $P1013 = "246_1278500537.15927" 
    capture_lex $P1013
    .const 'Sub' $P1007 = "244_1278500537.15927" 
    capture_lex $P1007
    .const 'Sub' $P1002 = "242_1278500537.15927" 
    capture_lex $P1002
    .const 'Sub' $P997 = "240_1278500537.15927" 
    capture_lex $P997
    .const 'Sub' $P989 = "238_1278500537.15927" 
    capture_lex $P989
    .const 'Sub' $P981 = "236_1278500537.15927" 
    capture_lex $P981
    .const 'Sub' $P976 = "234_1278500537.15927" 
    capture_lex $P976
    .const 'Sub' $P971 = "232_1278500537.15927" 
    capture_lex $P971
    .const 'Sub' $P966 = "230_1278500537.15927" 
    capture_lex $P966
    .const 'Sub' $P958 = "228_1278500537.15927" 
    capture_lex $P958
    .const 'Sub' $P950 = "226_1278500537.15927" 
    capture_lex $P950
    .const 'Sub' $P945 = "224_1278500537.15927" 
    capture_lex $P945
    .const 'Sub' $P940 = "222_1278500537.15927" 
    capture_lex $P940
    .const 'Sub' $P935 = "220_1278500537.15927" 
    capture_lex $P935
    .const 'Sub' $P929 = "218_1278500537.15927" 
    capture_lex $P929
    .const 'Sub' $P923 = "216_1278500537.15927" 
    capture_lex $P923
    .const 'Sub' $P917 = "214_1278500537.15927" 
    capture_lex $P917
    .const 'Sub' $P911 = "212_1278500537.15927" 
    capture_lex $P911
    .const 'Sub' $P905 = "210_1278500537.15927" 
    capture_lex $P905
    .const 'Sub' $P900 = "208_1278500537.15927" 
    capture_lex $P900
    .const 'Sub' $P895 = "206_1278500537.15927" 
    capture_lex $P895
    .const 'Sub' $P882 = "202_1278500537.15927" 
    capture_lex $P882
    .const 'Sub' $P874 = "200_1278500537.15927" 
    capture_lex $P874
    .const 'Sub' $P868 = "198_1278500537.15927" 
    capture_lex $P868
    .const 'Sub' $P861 = "196_1278500537.15927" 
    capture_lex $P861
    .const 'Sub' $P855 = "194_1278500537.15927" 
    capture_lex $P855
    .const 'Sub' $P847 = "192_1278500537.15927" 
    capture_lex $P847
    .const 'Sub' $P839 = "190_1278500537.15927" 
    capture_lex $P839
    .const 'Sub' $P833 = "188_1278500537.15927" 
    capture_lex $P833
    .const 'Sub' $P827 = "186_1278500537.15927" 
    capture_lex $P827
    .const 'Sub' $P812 = "182_1278500537.15927" 
    capture_lex $P812
    .const 'Sub' $P774 = "180_1278500537.15927" 
    capture_lex $P774
    .const 'Sub' $P765 = "178_1278500537.15927" 
    capture_lex $P765
    .const 'Sub' $P759 = "176_1278500537.15927" 
    capture_lex $P759
    .const 'Sub' $P749 = "174_1278500537.15927" 
    capture_lex $P749
    .const 'Sub' $P735 = "172_1278500537.15927" 
    capture_lex $P735
    .const 'Sub' $P726 = "170_1278500537.15927" 
    capture_lex $P726
    .const 'Sub' $P718 = "168_1278500537.15927" 
    capture_lex $P718
    .const 'Sub' $P708 = "166_1278500537.15927" 
    capture_lex $P708
    .const 'Sub' $P684 = "162_1278500537.15927" 
    capture_lex $P684
    .const 'Sub' $P659 = "160_1278500537.15927" 
    capture_lex $P659
    .const 'Sub' $P652 = "158_1278500537.15927" 
    capture_lex $P652
    .const 'Sub' $P645 = "156_1278500537.15927" 
    capture_lex $P645
    .const 'Sub' $P635 = "152_1278500537.15927" 
    capture_lex $P635
    .const 'Sub' $P627 = "150_1278500537.15927" 
    capture_lex $P627
    .const 'Sub' $P621 = "148_1278500537.15927" 
    capture_lex $P621
    .const 'Sub' $P608 = "146_1278500537.15927" 
    capture_lex $P608
    .const 'Sub' $P601 = "144_1278500537.15927" 
    capture_lex $P601
    .const 'Sub' $P594 = "142_1278500537.15927" 
    capture_lex $P594
    .const 'Sub' $P587 = "140_1278500537.15927" 
    capture_lex $P587
    .const 'Sub' $P559 = "136_1278500537.15927" 
    capture_lex $P559
    .const 'Sub' $P550 = "134_1278500537.15927" 
    capture_lex $P550
    .const 'Sub' $P543 = "132_1278500537.15927" 
    capture_lex $P543
    .const 'Sub' $P534 = "128_1278500537.15927" 
    capture_lex $P534
    .const 'Sub' $P529 = "126_1278500537.15927" 
    capture_lex $P529
    .const 'Sub' $P517 = "124_1278500537.15927" 
    capture_lex $P517
    .const 'Sub' $P505 = "122_1278500537.15927" 
    capture_lex $P505
    .const 'Sub' $P497 = "120_1278500537.15927" 
    capture_lex $P497
    .const 'Sub' $P492 = "118_1278500537.15927" 
    capture_lex $P492
    .const 'Sub' $P486 = "116_1278500537.15927" 
    capture_lex $P486
    .const 'Sub' $P480 = "114_1278500537.15927" 
    capture_lex $P480
    .const 'Sub' $P470 = "111_1278500537.15927" 
    capture_lex $P470
    .const 'Sub' $P464 = "109_1278500537.15927" 
    capture_lex $P464
    .const 'Sub' $P458 = "107_1278500537.15927" 
    capture_lex $P458
    .const 'Sub' $P452 = "105_1278500537.15927" 
    capture_lex $P452
    .const 'Sub' $P446 = "103_1278500537.15927" 
    capture_lex $P446
    .const 'Sub' $P440 = "101_1278500537.15927" 
    capture_lex $P440
    .const 'Sub' $P434 = "99_1278500537.15927" 
    capture_lex $P434
    .const 'Sub' $P425 = "97_1278500537.15927" 
    capture_lex $P425
    .const 'Sub' $P416 = "95_1278500537.15927" 
    capture_lex $P416
    .const 'Sub' $P407 = "93_1278500537.15927" 
    capture_lex $P407
    .const 'Sub' $P394 = "89_1278500537.15927" 
    capture_lex $P394
    .const 'Sub' $P385 = "87_1278500537.15927" 
    capture_lex $P385
    .const 'Sub' $P375 = "83_1278500537.15927" 
    capture_lex $P375
    .const 'Sub' $P368 = "81_1278500537.15927" 
    capture_lex $P368
    .const 'Sub' $P361 = "79_1278500537.15927" 
    capture_lex $P361
    .const 'Sub' $P349 = "75_1278500537.15927" 
    capture_lex $P349
    .const 'Sub' $P341 = "73_1278500537.15927" 
    capture_lex $P341
    .const 'Sub' $P333 = "71_1278500537.15927" 
    capture_lex $P333
    .const 'Sub' $P313 = "69_1278500537.15927" 
    capture_lex $P313
    .const 'Sub' $P304 = "67_1278500537.15927" 
    capture_lex $P304
    .const 'Sub' $P286 = "64_1278500537.15927" 
    capture_lex $P286
    .const 'Sub' $P266 = "62_1278500537.15927" 
    capture_lex $P266
    .const 'Sub' $P257 = "58_1278500537.15927" 
    capture_lex $P257
    .const 'Sub' $P252 = "56_1278500537.15927" 
    capture_lex $P252
    .const 'Sub' $P243 = "52_1278500537.15927" 
    capture_lex $P243
    .const 'Sub' $P238 = "50_1278500537.15927" 
    capture_lex $P238
    .const 'Sub' $P233 = "48_1278500537.15927" 
    capture_lex $P233
    .const 'Sub' $P225 = "46_1278500537.15927" 
    capture_lex $P225
    .const 'Sub' $P218 = "44_1278500537.15927" 
    capture_lex $P218
    .const 'Sub' $P212 = "42_1278500537.15927" 
    capture_lex $P212
    .const 'Sub' $P204 = "40_1278500537.15927" 
    capture_lex $P204
    .const 'Sub' $P198 = "38_1278500537.15927" 
    capture_lex $P198
    .const 'Sub' $P192 = "36_1278500537.15927" 
    capture_lex $P192
    .const 'Sub' $P176 = "33_1278500537.15927" 
    capture_lex $P176
    .const 'Sub' $P161 = "31_1278500537.15927" 
    capture_lex $P161
    .const 'Sub' $P154 = "29_1278500537.15927" 
    capture_lex $P154
    .const 'Sub' $P104 = "26_1278500537.15927" 
    capture_lex $P104
    .const 'Sub' $P86 = "23_1278500537.15927" 
    capture_lex $P86
    .const 'Sub' $P72 = "21_1278500537.15927" 
    capture_lex $P72
    .const 'Sub' $P58 = "19_1278500537.15927" 
    capture_lex $P58
    .const 'Sub' $P50 = "17_1278500537.15927" 
    capture_lex $P50
    .const 'Sub' $P43 = "15_1278500537.15927" 
    capture_lex $P43
    .const 'Sub' $P35 = "13_1278500537.15927" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1278500537.15927" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 567
    get_hll_global $P1372, ["NQP";"Regex"], "_block1371" 
    capture_lex $P1372
    $P1435 = $P1372()
.annotate 'line', 4
    .return ($P1435)
    .const 'Sub' $P1437 = "370_1278500537.15927" 
    .return ($P1437)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post373") :outer("11_1278500537.15927")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 448
    get_hll_global $P1440, ["NQP"], "Grammar"
    $P1440."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 449
    get_hll_global $P1441, ["NQP"], "Grammar"
    $P1441."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 450
    get_hll_global $P1442, ["NQP"], "Grammar"
    $P1442."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 451
    get_hll_global $P1443, ["NQP"], "Grammar"
    $P1443."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 452
    get_hll_global $P1444, ["NQP"], "Grammar"
    $P1444."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 453
    get_hll_global $P1445, ["NQP"], "Grammar"
    $P1445."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 454
    get_hll_global $P1446, ["NQP"], "Grammar"
    $P1446."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 455
    get_hll_global $P1447, ["NQP"], "Grammar"
    $P1447."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 456
    get_hll_global $P1448, ["NQP"], "Grammar"
    $P1448."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 457
    get_hll_global $P1449, ["NQP"], "Grammar"
    $P1449."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 458
    get_hll_global $P1450, ["NQP"], "Grammar"
    $P1450."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 459
    get_hll_global $P1451, ["NQP"], "Grammar"
    $P1451."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 460
    get_hll_global $P1452, ["NQP"], "Grammar"
    $P1452."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 461
    get_hll_global $P1453, ["NQP"], "Grammar"
    $P1453."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 462
    get_hll_global $P1454, ["NQP"], "Grammar"
    $P1454."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 447
    $P1455 = get_root_global ["parrot"], "P6metaclass"
    $P1455."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1278500537.15927") :method :outer("11_1278500537.15927")
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
.sub "identifier"  :subid("13_1278500537.15927") :method :outer("11_1278500537.15927")
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
  # rx subrule "ident" subtype=method negate=
    rx36_cur."!cursor_pos"(rx36_pos)
    $P10 = rx36_cur."ident"()
    unless $P10, rx36_fail
    rx36_pos = $P10."pos"()
  # rx rxquantr41 ** 0..*
    set_addr $I42, rxquantr41_done
    rx36_cur."!mark_push"(0, rx36_pos, $I42)
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
    (rx36_rep) = rx36_cur."!mark_commit"($I42)
    rx36_cur."!mark_push"(rx36_rep, rx36_pos, $I42)
    goto rxquantr41_loop
  rxquantr41_done:
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
.sub "!PREFIX__identifier"  :subid("14_1278500537.15927") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx44_tgt
    .local int rx44_pos
    .local int rx44_off
    .local int rx44_eos
    .local int rx44_rep
    .local pmc rx44_cur
    (rx44_cur, rx44_pos, rx44_tgt) = self."!cursor_start"()
    rx44_cur."!cursor_debug"("START ", "name")
    rx44_cur."!cursor_caparray"("identifier")
    .lex unicode:"$\x{a2}", rx44_cur
    .local pmc match
    .lex "$/", match
    length rx44_eos, rx44_tgt
    gt rx44_pos, rx44_eos, rx44_done
    set rx44_off, 0
    lt rx44_pos, 2, rx44_start
    sub rx44_off, rx44_pos, 1
    substr rx44_tgt, rx44_tgt, rx44_off
  rx44_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan47_done
    goto rxscan47_scan
  rxscan47_loop:
    ($P10) = rx44_cur."from"()
    inc $P10
    set rx44_pos, $P10
    ge rx44_pos, rx44_eos, rxscan47_done
  rxscan47_scan:
    set_addr $I10, rxscan47_loop
    rx44_cur."!mark_push"(0, rx44_pos, $I10)
  rxscan47_done:
.annotate 'line', 19
  # rx rxquantr48 ** 1..*
    set_addr $I49, rxquantr48_done
    rx44_cur."!mark_push"(0, -1, $I49)
  rxquantr48_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx44_cur."!cursor_pos"(rx44_pos)
    $P10 = rx44_cur."identifier"()
    unless $P10, rx44_fail
    rx44_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx44_pos = $P10."pos"()
    (rx44_rep) = rx44_cur."!mark_commit"($I49)
    rx44_cur."!mark_push"(rx44_rep, rx44_pos, $I49)
  # rx literal  "::"
    add $I11, rx44_pos, 2
    gt $I11, rx44_eos, rx44_fail
    sub $I11, rx44_pos, rx44_off
    substr $S10, rx44_tgt, $I11, 2
    ne $S10, "::", rx44_fail
    add rx44_pos, 2
    goto rxquantr48_loop
  rxquantr48_done:
  # rx pass
    rx44_cur."!cursor_pass"(rx44_pos, "name")
    rx44_cur."!cursor_debug"("PASS  ", "name", " at pos=", rx44_pos)
    .return (rx44_cur)
  rx44_fail:
.annotate 'line', 4
    (rx44_rep, rx44_pos, $I10, $P10) = rx44_cur."!mark_fail"(0)
    lt rx44_pos, -1, rx44_done
    eq rx44_pos, -1, rx44_fail
    jump $I10
  rx44_done:
    rx44_cur."!cursor_fail"()
    rx44_cur."!cursor_debug"("FAIL  ", "name")
    .return (rx44_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1278500537.15927") :method
.annotate 'line', 4
    new $P46, "ResizablePMCArray"
    push $P46, ""
    .return ($P46)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx51_tgt
    .local int rx51_pos
    .local int rx51_off
    .local int rx51_eos
    .local int rx51_rep
    .local pmc rx51_cur
    (rx51_cur, rx51_pos, rx51_tgt) = self."!cursor_start"()
    rx51_cur."!cursor_debug"("START ", "deflongname")
    rx51_cur."!cursor_caparray"("colonpair")
    .lex unicode:"$\x{a2}", rx51_cur
    .local pmc match
    .lex "$/", match
    length rx51_eos, rx51_tgt
    gt rx51_pos, rx51_eos, rx51_done
    set rx51_off, 0
    lt rx51_pos, 2, rx51_start
    sub rx51_off, rx51_pos, 1
    substr rx51_tgt, rx51_tgt, rx51_off
  rx51_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan55_done
    goto rxscan55_scan
  rxscan55_loop:
    ($P10) = rx51_cur."from"()
    inc $P10
    set rx51_pos, $P10
    ge rx51_pos, rx51_eos, rxscan55_done
  rxscan55_scan:
    set_addr $I10, rxscan55_loop
    rx51_cur."!mark_push"(0, rx51_pos, $I10)
  rxscan55_done:
.annotate 'line', 22
  # rx subrule "identifier" subtype=capture negate=
    rx51_cur."!cursor_pos"(rx51_pos)
    $P10 = rx51_cur."identifier"()
    unless $P10, rx51_fail
    rx51_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx51_pos = $P10."pos"()
  # rx rxquantr56 ** 0..1
    set_addr $I57, rxquantr56_done
    rx51_cur."!mark_push"(0, rx51_pos, $I57)
  rxquantr56_loop:
  # rx subrule "colonpair" subtype=capture negate=
    rx51_cur."!cursor_pos"(rx51_pos)
    $P10 = rx51_cur."colonpair"()
    unless $P10, rx51_fail
    rx51_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx51_pos = $P10."pos"()
    (rx51_rep) = rx51_cur."!mark_commit"($I57)
  rxquantr56_done:
.annotate 'line', 21
  # rx pass
    rx51_cur."!cursor_pass"(rx51_pos, "deflongname")
    rx51_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx51_pos)
    .return (rx51_cur)
  rx51_fail:
.annotate 'line', 4
    (rx51_rep, rx51_pos, $I10, $P10) = rx51_cur."!mark_fail"(0)
    lt rx51_pos, -1, rx51_done
    eq rx51_pos, -1, rx51_fail
    jump $I10
  rx51_done:
    rx51_cur."!cursor_fail"()
    rx51_cur."!cursor_debug"("FAIL  ", "deflongname")
    .return (rx51_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1278500537.15927") :method
.annotate 'line', 4
    $P53 = self."!PREFIX__!subrule"("identifier", "")
    new $P54, "ResizablePMCArray"
    push $P54, $P53
    .return ($P54)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx59_tgt
    .local int rx59_pos
    .local int rx59_off
    .local int rx59_eos
    .local int rx59_rep
    .local pmc rx59_cur
    (rx59_cur, rx59_pos, rx59_tgt) = self."!cursor_start"()
    rx59_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx59_cur
    .local pmc match
    .lex "$/", match
    length rx59_eos, rx59_tgt
    gt rx59_pos, rx59_eos, rx59_done
    set rx59_off, 0
    lt rx59_pos, 2, rx59_start
    sub rx59_off, rx59_pos, 1
    substr rx59_tgt, rx59_tgt, rx59_off
  rx59_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan62_done
    goto rxscan62_scan
  rxscan62_loop:
    ($P10) = rx59_cur."from"()
    inc $P10
    set rx59_pos, $P10
    ge rx59_pos, rx59_eos, rxscan62_done
  rxscan62_scan:
    set_addr $I10, rxscan62_loop
    rx59_cur."!mark_push"(0, rx59_pos, $I10)
  rxscan62_done:
.annotate 'line', 29
  # rx rxquantr63 ** 0..1
    set_addr $I71, rxquantr63_done
    rx59_cur."!mark_push"(0, rx59_pos, $I71)
  rxquantr63_loop:
  alt64_0:
.annotate 'line', 26
    set_addr $I10, alt64_1
    rx59_cur."!mark_push"(0, rx59_pos, $I10)
.annotate 'line', 27
  # rx rxquantr65 ** 0..*
    set_addr $I66, rxquantr65_done
    rx59_cur."!mark_push"(0, rx59_pos, $I66)
  rxquantr65_loop:
  # rx enumcharlist negate=0 
    ge rx59_pos, rx59_eos, rx59_fail
    sub $I10, rx59_pos, rx59_off
    substr $S10, rx59_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx59_fail
    inc rx59_pos
    (rx59_rep) = rx59_cur."!mark_commit"($I66)
    rx59_cur."!mark_push"(rx59_rep, rx59_pos, $I66)
    goto rxquantr65_loop
  rxquantr65_done:
  # rxanchor eol
    sub $I10, rx59_pos, rx59_off
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rxanchor67_done
    ne rx59_pos, rx59_eos, rx59_fail
    eq rx59_pos, 0, rxanchor67_done
    dec $I10
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rx59_fail
  rxanchor67_done:
  # rx subrule "ws" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."ws"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."MARKER"("endstmt")
    unless $P10, rx59_fail
    goto alt64_end
  alt64_1:
.annotate 'line', 28
  # rx rxquantr68 ** 0..1
    set_addr $I69, rxquantr68_done
    rx59_cur."!mark_push"(0, rx59_pos, $I69)
  rxquantr68_loop:
  # rx subrule "unv" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."unv"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
    (rx59_rep) = rx59_cur."!mark_commit"($I69)
  rxquantr68_done:
  # rxanchor eol
    sub $I10, rx59_pos, rx59_off
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rxanchor70_done
    ne rx59_pos, rx59_eos, rx59_fail
    eq rx59_pos, 0, rxanchor70_done
    dec $I10
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rx59_fail
  rxanchor70_done:
  # rx subrule "ws" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."ws"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."MARKER"("endstmt")
    unless $P10, rx59_fail
  alt64_end:
.annotate 'line', 29
    (rx59_rep) = rx59_cur."!mark_commit"($I71)
  rxquantr63_done:
.annotate 'line', 25
  # rx pass
    rx59_cur."!cursor_pass"(rx59_pos, "ENDSTMT")
    rx59_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx59_pos)
    .return (rx59_cur)
  rx59_fail:
.annotate 'line', 4
    (rx59_rep, rx59_pos, $I10, $P10) = rx59_cur."!mark_fail"(0)
    lt rx59_pos, -1, rx59_done
    eq rx59_pos, -1, rx59_fail
    jump $I10
  rx59_done:
    rx59_cur."!cursor_fail"()
    rx59_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx59_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1278500537.15927") :method
.annotate 'line', 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx73_tgt
    .local int rx73_pos
    .local int rx73_off
    .local int rx73_eos
    .local int rx73_rep
    .local pmc rx73_cur
    (rx73_cur, rx73_pos, rx73_tgt) = self."!cursor_start"()
    rx73_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx73_cur
    .local pmc match
    .lex "$/", match
    length rx73_eos, rx73_tgt
    gt rx73_pos, rx73_eos, rx73_done
    set rx73_off, 0
    lt rx73_pos, 2, rx73_start
    sub rx73_off, rx73_pos, 1
    substr rx73_tgt, rx73_tgt, rx73_off
  rx73_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan76_done
    goto rxscan76_scan
  rxscan76_loop:
    ($P10) = rx73_cur."from"()
    inc $P10
    set rx73_pos, $P10
    ge rx73_pos, rx73_eos, rxscan76_done
  rxscan76_scan:
    set_addr $I10, rxscan76_loop
    rx73_cur."!mark_push"(0, rx73_pos, $I10)
  rxscan76_done:
  alt77_0:
.annotate 'line', 32
    set_addr $I10, alt77_1
    rx73_cur."!mark_push"(0, rx73_pos, $I10)
.annotate 'line', 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx73_cur."!cursor_pos"(rx73_pos)
    $P10 = rx73_cur."MARKED"("ws")
    unless $P10, rx73_fail
    goto alt77_end
  alt77_1:
.annotate 'line', 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx73_cur."!cursor_pos"(rx73_pos)
    $P10 = rx73_cur."ww"()
    if $P10, rx73_fail
.annotate 'line', 39
  # rx rxquantr78 ** 0..*
    set_addr $I85, rxquantr78_done
    rx73_cur."!mark_push"(0, rx73_pos, $I85)
  rxquantr78_loop:
  alt79_0:
.annotate 'line', 35
    set_addr $I10, alt79_1
    rx73_cur."!mark_push"(0, rx73_pos, $I10)
  # rx rxquantr80 ** 1..*
    set_addr $I81, rxquantr80_done
    rx73_cur."!mark_push"(0, -1, $I81)
  rxquantr80_loop:
  # rx enumcharlist negate=0 
    ge rx73_pos, rx73_eos, rx73_fail
    sub $I10, rx73_pos, rx73_off
    substr $S10, rx73_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rx73_fail
    inc rx73_pos
    (rx73_rep) = rx73_cur."!mark_commit"($I81)
    rx73_cur."!mark_push"(rx73_rep, rx73_pos, $I81)
    goto rxquantr80_loop
  rxquantr80_done:
    goto alt79_end
  alt79_1:
    set_addr $I10, alt79_2
    rx73_cur."!mark_push"(0, rx73_pos, $I10)
.annotate 'line', 36
  # rx literal  "#"
    add $I11, rx73_pos, 1
    gt $I11, rx73_eos, rx73_fail
    sub $I11, rx73_pos, rx73_off
    substr $S10, rx73_tgt, $I11, 1
    ne $S10, "#", rx73_fail
    add rx73_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx73_pos, rx73_off
    find_cclass $I11, 4096, rx73_tgt, $I10, rx73_eos
    add rx73_pos, rx73_off, $I11
    goto alt79_end
  alt79_2:
    set_addr $I10, alt79_3
    rx73_cur."!mark_push"(0, rx73_pos, $I10)
.annotate 'line', 37
  # rxanchor bol
    eq rx73_pos, 0, rxanchor82_done
    ge rx73_pos, rx73_eos, rx73_fail
    sub $I10, rx73_pos, rx73_off
    dec $I10
    is_cclass $I11, 4096, rx73_tgt, $I10
    unless $I11, rx73_fail
  rxanchor82_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx73_cur."!cursor_pos"(rx73_pos)
    $P10 = rx73_cur."pod_comment"()
    unless $P10, rx73_fail
    rx73_pos = $P10."pos"()
    goto alt79_end
  alt79_3:
.annotate 'line', 38
  # rx rxquantr83 ** 1..*
    set_addr $I84, rxquantr83_done
    rx73_cur."!mark_push"(0, -1, $I84)
  rxquantr83_loop:
  # rx enumcharlist negate=0 
    ge rx73_pos, rx73_eos, rx73_fail
    sub $I10, rx73_pos, rx73_off
    substr $S10, rx73_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx73_fail
    inc rx73_pos
    (rx73_rep) = rx73_cur."!mark_commit"($I84)
    rx73_cur."!mark_push"(rx73_rep, rx73_pos, $I84)
    goto rxquantr83_loop
  rxquantr83_done:
  alt79_end:
.annotate 'line', 39
    (rx73_rep) = rx73_cur."!mark_commit"($I85)
    rx73_cur."!mark_push"(rx73_rep, rx73_pos, $I85)
    goto rxquantr78_loop
  rxquantr78_done:
.annotate 'line', 40
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx73_cur."!cursor_pos"(rx73_pos)
    $P10 = rx73_cur."MARKER"("ws")
    unless $P10, rx73_fail
  alt77_end:
.annotate 'line', 32
  # rx pass
    rx73_cur."!cursor_pass"(rx73_pos, "ws")
    rx73_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx73_pos)
    .return (rx73_cur)
  rx73_fail:
.annotate 'line', 4
    (rx73_rep, rx73_pos, $I10, $P10) = rx73_cur."!mark_fail"(0)
    lt rx73_pos, -1, rx73_done
    eq rx73_pos, -1, rx73_fail
    jump $I10
  rx73_done:
    rx73_cur."!cursor_fail"()
    rx73_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx73_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1278500537.15927") :method
.annotate 'line', 4
    new $P75, "ResizablePMCArray"
    push $P75, ""
    push $P75, ""
    .return ($P75)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P94 = "25_1278500537.15927" 
    capture_lex $P94
    .local string rx87_tgt
    .local int rx87_pos
    .local int rx87_off
    .local int rx87_eos
    .local int rx87_rep
    .local pmc rx87_cur
    (rx87_cur, rx87_pos, rx87_tgt) = self."!cursor_start"()
    rx87_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx87_cur
    .local pmc match
    .lex "$/", match
    length rx87_eos, rx87_tgt
    gt rx87_pos, rx87_eos, rx87_done
    set rx87_off, 0
    lt rx87_pos, 2, rx87_start
    sub rx87_off, rx87_pos, 1
    substr rx87_tgt, rx87_tgt, rx87_off
  rx87_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan90_done
    goto rxscan90_scan
  rxscan90_loop:
    ($P10) = rx87_cur."from"()
    inc $P10
    set rx87_pos, $P10
    ge rx87_pos, rx87_eos, rxscan90_done
  rxscan90_scan:
    set_addr $I10, rxscan90_loop
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  rxscan90_done:
  alt91_0:
.annotate 'line', 45
    set_addr $I10, alt91_1
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
.annotate 'line', 46
  # rxanchor bol
    eq rx87_pos, 0, rxanchor92_done
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    dec $I10
    is_cclass $I11, 4096, rx87_tgt, $I10
    unless $I11, rx87_fail
  rxanchor92_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx87_cur."!cursor_pos"(rx87_pos)
    .const 'Sub' $P94 = "25_1278500537.15927" 
    capture_lex $P94
    $P10 = rx87_cur."before"($P94)
    unless $P10, rx87_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx87_cur."!cursor_pos"(rx87_pos)
    $P10 = rx87_cur."pod_comment"()
    unless $P10, rx87_fail
    rx87_pos = $P10."pos"()
    goto alt91_end
  alt91_1:
    set_addr $I10, alt91_2
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
.annotate 'line', 47
  # rx rxquantr100 ** 0..*
    set_addr $I101, rxquantr100_done
    rx87_cur."!mark_push"(0, rx87_pos, $I101)
  rxquantr100_loop:
  # rx enumcharlist negate=0 
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx87_fail
    inc rx87_pos
    (rx87_rep) = rx87_cur."!mark_commit"($I101)
    rx87_cur."!mark_push"(rx87_rep, rx87_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
  # rx literal  "#"
    add $I11, rx87_pos, 1
    gt $I11, rx87_eos, rx87_fail
    sub $I11, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I11, 1
    ne $S10, "#", rx87_fail
    add rx87_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx87_pos, rx87_off
    find_cclass $I11, 4096, rx87_tgt, $I10, rx87_eos
    add rx87_pos, rx87_off, $I11
    goto alt91_end
  alt91_2:
.annotate 'line', 48
  # rx rxquantr102 ** 1..*
    set_addr $I103, rxquantr102_done
    rx87_cur."!mark_push"(0, -1, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx87_fail
    inc rx87_pos
    (rx87_rep) = rx87_cur."!mark_commit"($I103)
    rx87_cur."!mark_push"(rx87_rep, rx87_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
  alt91_end:
.annotate 'line', 43
  # rx pass
    rx87_cur."!cursor_pass"(rx87_pos, "unv")
    rx87_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx87_pos)
    .return (rx87_cur)
  rx87_fail:
.annotate 'line', 4
    (rx87_rep, rx87_pos, $I10, $P10) = rx87_cur."!mark_fail"(0)
    lt rx87_pos, -1, rx87_done
    eq rx87_pos, -1, rx87_fail
    jump $I10
  rx87_done:
    rx87_cur."!cursor_fail"()
    rx87_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx87_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1278500537.15927") :method
.annotate 'line', 4
    new $P89, "ResizablePMCArray"
    push $P89, ""
    push $P89, ""
    push $P89, ""
    .return ($P89)
.end


.namespace ["NQP";"Grammar"]
.sub "_block93"  :anon :subid("25_1278500537.15927") :method :outer("23_1278500537.15927")
.annotate 'line', 46
    .local string rx95_tgt
    .local int rx95_pos
    .local int rx95_off
    .local int rx95_eos
    .local int rx95_rep
    .local pmc rx95_cur
    (rx95_cur, rx95_pos, rx95_tgt) = self."!cursor_start"()
    rx95_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx95_cur
    .local pmc match
    .lex "$/", match
    length rx95_eos, rx95_tgt
    gt rx95_pos, rx95_eos, rx95_done
    set rx95_off, 0
    lt rx95_pos, 2, rx95_start
    sub rx95_off, rx95_pos, 1
    substr rx95_tgt, rx95_tgt, rx95_off
  rx95_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan96_done
    goto rxscan96_scan
  rxscan96_loop:
    ($P10) = rx95_cur."from"()
    inc $P10
    set rx95_pos, $P10
    ge rx95_pos, rx95_eos, rxscan96_done
  rxscan96_scan:
    set_addr $I10, rxscan96_loop
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  rxscan96_done:
  # rx rxquantr97 ** 0..*
    set_addr $I98, rxquantr97_done
    rx95_cur."!mark_push"(0, rx95_pos, $I98)
  rxquantr97_loop:
  # rx enumcharlist negate=0 
    ge rx95_pos, rx95_eos, rx95_fail
    sub $I10, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx95_fail
    inc rx95_pos
    (rx95_rep) = rx95_cur."!mark_commit"($I98)
    rx95_cur."!mark_push"(rx95_rep, rx95_pos, $I98)
    goto rxquantr97_loop
  rxquantr97_done:
  # rx literal  "="
    add $I11, rx95_pos, 1
    gt $I11, rx95_eos, rx95_fail
    sub $I11, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I11, 1
    ne $S10, "=", rx95_fail
    add rx95_pos, 1
  alt99_0:
    set_addr $I10, alt99_1
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  # rx charclass w
    ge rx95_pos, rx95_eos, rx95_fail
    sub $I10, rx95_pos, rx95_off
    is_cclass $I11, 8192, rx95_tgt, $I10
    unless $I11, rx95_fail
    inc rx95_pos
    goto alt99_end
  alt99_1:
  # rx literal  "\\"
    add $I11, rx95_pos, 1
    gt $I11, rx95_eos, rx95_fail
    sub $I11, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I11, 1
    ne $S10, "\\", rx95_fail
    add rx95_pos, 1
  alt99_end:
  # rx pass
    rx95_cur."!cursor_pass"(rx95_pos, "")
    rx95_cur."!cursor_debug"("PASS  ", "", " at pos=", rx95_pos)
    .return (rx95_cur)
  rx95_fail:
    (rx95_rep, rx95_pos, $I10, $P10) = rx95_cur."!mark_fail"(0)
    lt rx95_pos, -1, rx95_done
    eq rx95_pos, -1, rx95_fail
    jump $I10
  rx95_done:
    rx95_cur."!cursor_fail"()
    rx95_cur."!cursor_debug"("FAIL  ", "")
    .return (rx95_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P145 = "28_1278500537.15927" 
    capture_lex $P145
    .local string rx105_tgt
    .local int rx105_pos
    .local int rx105_off
    .local int rx105_eos
    .local int rx105_rep
    .local pmc rx105_cur
    (rx105_cur, rx105_pos, rx105_tgt) = self."!cursor_start"()
    rx105_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx105_cur
    .local pmc match
    .lex "$/", match
    length rx105_eos, rx105_tgt
    gt rx105_pos, rx105_eos, rx105_done
    set rx105_off, 0
    lt rx105_pos, 2, rx105_start
    sub rx105_off, rx105_pos, 1
    substr rx105_tgt, rx105_tgt, rx105_off
  rx105_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan108_done
    goto rxscan108_scan
  rxscan108_loop:
    ($P10) = rx105_cur."from"()
    inc $P10
    set rx105_pos, $P10
    ge rx105_pos, rx105_eos, rxscan108_done
  rxscan108_scan:
    set_addr $I10, rxscan108_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  rxscan108_done:
.annotate 'line', 53
  # rxanchor bol
    eq rx105_pos, 0, rxanchor109_done
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
  rxanchor109_done:
  # rx rxquantr110 ** 0..*
    set_addr $I111, rxquantr110_done
    rx105_cur."!mark_push"(0, rx105_pos, $I111)
  rxquantr110_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I111)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I111)
    goto rxquantr110_loop
  rxquantr110_done:
  # rx literal  "="
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "=", rx105_fail
    add rx105_pos, 1
  alt112_0:
.annotate 'line', 54
    set_addr $I10, alt112_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 55
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rx rxquantr113 ** 1..*
    set_addr $I114, rxquantr113_done
    rx105_cur."!mark_push"(0, -1, $I114)
  rxquantr113_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I114)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I114)
    goto rxquantr113_loop
  rxquantr113_done:
  # rx literal  "END"
    add $I11, rx105_pos, 3
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 3
    ne $S10, "END", rx105_fail
    add rx105_pos, 3
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  alt115_0:
.annotate 'line', 56
    set_addr $I10, alt115_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx rxquantf116 ** 0..*
    set_addr $I10, rxquantf116_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf116_done
  rxquantf116_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf116_loop
    rx105_cur."!mark_push"($I117, rx105_pos, $I10)
  rxquantf116_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx rxquantr118 ** 0..*
    set_addr $I119, rxquantr118_done
    rx105_cur."!mark_push"(0, rx105_pos, $I119)
  rxquantr118_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I119)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I119)
    goto rxquantr118_loop
  rxquantr118_done:
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr120 ** 1..*
    set_addr $I121, rxquantr120_done
    rx105_cur."!mark_push"(0, -1, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I121)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  # rx literal  "END"
    add $I11, rx105_pos, 3
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 3
    ne $S10, "END", rx105_fail
    add rx105_pos, 3
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt115_end
  alt115_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_not_cclass $I11, 65535, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
  alt115_end:
.annotate 'line', 55
    goto alt112_end
  alt112_1:
    set_addr $I10, alt112_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 57
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rx rxquantr122 ** 1..*
    set_addr $I123, rxquantr122_done
    rx105_cur."!mark_push"(0, -1, $I123)
  rxquantr122_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I123)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I123)
    goto rxquantr122_loop
  rxquantr122_done:
  # rx subrule "identifier" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."identifier"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx105_pos = $P10."pos"()
  alt124_0:
.annotate 'line', 58
    set_addr $I10, alt124_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 59
  # rx rxquantf125 ** 0..*
    set_addr $I10, rxquantf125_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf125_done
  rxquantf125_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf125_loop
    rx105_cur."!mark_push"($I126, rx105_pos, $I10)
  rxquantf125_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx105_cur."!mark_push"(0, rx105_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I128)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr129 ** 1..*
    set_addr $I130, rxquantr129_done
    rx105_cur."!mark_push"(0, -1, $I130)
  rxquantr129_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I130)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I130)
    goto rxquantr129_loop
  rxquantr129_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."!BACKREF"("identifier")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt124_end
  alt124_1:
.annotate 'line', 60
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt124_end:
.annotate 'line', 57
    goto alt112_end
  alt112_2:
    set_addr $I10, alt112_3
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 62
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx rxquantr132 ** 0..*
    set_addr $I133, rxquantr132_done
    rx105_cur."!mark_push"(0, rx105_pos, $I133)
  rxquantr132_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I133)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I133)
    goto rxquantr132_loop
  rxquantr132_done:
  alt134_0:
.annotate 'line', 63
    set_addr $I10, alt134_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rxanchor eol
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rxanchor135_done
    ne rx105_pos, rx105_eos, rx105_fail
    eq rx105_pos, 0, rxanchor135_done
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rx105_fail
  rxanchor135_done:
    goto alt134_end
  alt134_1:
    set_addr $I10, alt134_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx literal  "#"
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "#", rx105_fail
    add rx105_pos, 1
    goto alt134_end
  alt134_2:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt134_end:
  alt136_0:
.annotate 'line', 64
    set_addr $I10, alt136_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 65
  # rx rxquantf137 ** 0..*
    set_addr $I10, rxquantf137_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf137_done
  rxquantf137_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf137_loop
    rx105_cur."!mark_push"($I138, rx105_pos, $I10)
  rxquantf137_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx rxquantr139 ** 0..*
    set_addr $I140, rxquantr139_done
    rx105_cur."!mark_push"(0, rx105_pos, $I140)
  rxquantr139_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I140)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I140)
    goto rxquantr139_loop
  rxquantr139_done:
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt136_end
  alt136_1:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt136_end:
.annotate 'line', 62
    goto alt112_end
  alt112_3:
    set_addr $I10, alt112_4
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate 'line', 68
  # rx subrule "identifier" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."identifier"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx105_pos = $P10."pos"()
.annotate 'line', 69
  # rx rxquantf141 ** 0..*
    set_addr $I10, rxquantf141_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf141_done
  rxquantf141_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf141_loop
    rx105_cur."!mark_push"($I142, rx105_pos, $I10)
  rxquantf141_done:
  # rxanchor bol
    eq rx105_pos, 0, rxanchor143_done
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
  rxanchor143_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    .const 'Sub' $P145 = "28_1278500537.15927" 
    capture_lex $P145
    $P10 = rx105_cur."before"($P145)
    unless $P10, rx105_fail
.annotate 'line', 68
    goto alt112_end
  alt112_4:
  alt153_0:
.annotate 'line', 75
    set_addr $I10, alt153_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx charclass s
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 32, rx105_tgt, $I10
    unless $I11, rx105_fail
    inc rx105_pos
    goto alt153_end
  alt153_1:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Illegal pod directive")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt153_end:
.annotate 'line', 76
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
  alt112_end:
.annotate 'line', 52
  # rx pass
    rx105_cur."!cursor_pass"(rx105_pos, "pod_comment")
    rx105_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx105_pos)
    .return (rx105_cur)
  rx105_fail:
.annotate 'line', 4
    (rx105_rep, rx105_pos, $I10, $P10) = rx105_cur."!mark_fail"(0)
    lt rx105_pos, -1, rx105_done
    eq rx105_pos, -1, rx105_fail
    jump $I10
  rx105_done:
    rx105_cur."!cursor_fail"()
    rx105_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx105_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1278500537.15927") :method
.annotate 'line', 4
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["NQP";"Grammar"]
.sub "_block144"  :anon :subid("28_1278500537.15927") :method :outer("26_1278500537.15927")
.annotate 'line', 69
    .local string rx146_tgt
    .local int rx146_pos
    .local int rx146_off
    .local int rx146_eos
    .local int rx146_rep
    .local pmc rx146_cur
    (rx146_cur, rx146_pos, rx146_tgt) = self."!cursor_start"()
    rx146_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx146_cur
    .local pmc match
    .lex "$/", match
    length rx146_eos, rx146_tgt
    gt rx146_pos, rx146_eos, rx146_done
    set rx146_off, 0
    lt rx146_pos, 2, rx146_start
    sub rx146_off, rx146_pos, 1
    substr rx146_tgt, rx146_tgt, rx146_off
  rx146_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan147_done
    goto rxscan147_scan
  rxscan147_loop:
    ($P10) = rx146_cur."from"()
    inc $P10
    set rx146_pos, $P10
    ge rx146_pos, rx146_eos, rxscan147_done
  rxscan147_scan:
    set_addr $I10, rxscan147_loop
    rx146_cur."!mark_push"(0, rx146_pos, $I10)
  rxscan147_done:
  # rx rxquantr148 ** 0..*
    set_addr $I149, rxquantr148_done
    rx146_cur."!mark_push"(0, rx146_pos, $I149)
  rxquantr148_loop:
  # rx enumcharlist negate=0 
    ge rx146_pos, rx146_eos, rx146_fail
    sub $I10, rx146_pos, rx146_off
    substr $S10, rx146_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx146_fail
    inc rx146_pos
    (rx146_rep) = rx146_cur."!mark_commit"($I149)
    rx146_cur."!mark_push"(rx146_rep, rx146_pos, $I149)
    goto rxquantr148_loop
  rxquantr148_done:
  alt150_0:
    set_addr $I10, alt150_1
    rx146_cur."!mark_push"(0, rx146_pos, $I10)
.annotate 'line', 70
  # rx literal  "="
    add $I11, rx146_pos, 1
    gt $I11, rx146_eos, rx146_fail
    sub $I11, rx146_pos, rx146_off
    substr $S10, rx146_tgt, $I11, 1
    ne $S10, "=", rx146_fail
    add rx146_pos, 1
.annotate 'line', 72
  # rx rxquantr151 ** 0..1
    set_addr $I152, rxquantr151_done
    rx146_cur."!mark_push"(0, rx146_pos, $I152)
  rxquantr151_loop:
.annotate 'line', 71
  # rx literal  "cut"
    add $I11, rx146_pos, 3
    gt $I11, rx146_eos, rx146_fail
    sub $I11, rx146_pos, rx146_off
    substr $S10, rx146_tgt, $I11, 3
    ne $S10, "cut", rx146_fail
    add rx146_pos, 3
  # rxanchor rwb
    le rx146_pos, 0, rx146_fail
    sub $I10, rx146_pos, rx146_off
    is_cclass $I11, 8192, rx146_tgt, $I10
    if $I11, rx146_fail
    dec $I10
    is_cclass $I11, 8192, rx146_tgt, $I10
    unless $I11, rx146_fail
.annotate 'line', 72
  # rx subrule "panic" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
    (rx146_rep) = rx146_cur."!mark_commit"($I152)
  rxquantr151_done:
.annotate 'line', 69
    goto alt150_end
  alt150_1:
.annotate 'line', 73
  # rx charclass nl
    ge rx146_pos, rx146_eos, rx146_fail
    sub $I10, rx146_pos, rx146_off
    is_cclass $I11, 4096, rx146_tgt, $I10
    unless $I11, rx146_fail
    substr $S10, rx146_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx146_pos, $I11
    inc rx146_pos
  alt150_end:
.annotate 'line', 69
  # rx pass
    rx146_cur."!cursor_pass"(rx146_pos, "")
    rx146_cur."!cursor_debug"("PASS  ", "", " at pos=", rx146_pos)
    .return (rx146_cur)
  rx146_fail:
    (rx146_rep, rx146_pos, $I10, $P10) = rx146_cur."!mark_fail"(0)
    lt rx146_pos, -1, rx146_done
    eq rx146_pos, -1, rx146_fail
    jump $I10
  rx146_done:
    rx146_cur."!cursor_fail"()
    rx146_cur."!cursor_debug"("FAIL  ", "")
    .return (rx146_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx155_tgt
    .local int rx155_pos
    .local int rx155_off
    .local int rx155_eos
    .local int rx155_rep
    .local pmc rx155_cur
    (rx155_cur, rx155_pos, rx155_tgt) = self."!cursor_start"()
    rx155_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx155_cur
    .local pmc match
    .lex "$/", match
    length rx155_eos, rx155_tgt
    gt rx155_pos, rx155_eos, rx155_done
    set rx155_off, 0
    lt rx155_pos, 2, rx155_start
    sub rx155_off, rx155_pos, 1
    substr rx155_tgt, rx155_tgt, rx155_off
  rx155_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan159_done
    goto rxscan159_scan
  rxscan159_loop:
    ($P10) = rx155_cur."from"()
    inc $P10
    set rx155_pos, $P10
    ge rx155_pos, rx155_eos, rxscan159_done
  rxscan159_scan:
    set_addr $I10, rxscan159_loop
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  rxscan159_done:
.annotate 'line', 84
  # rx subrule "newpad" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."newpad"()
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
.annotate 'line', 85
  # rx subrule "outerctx" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."outerctx"()
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
.annotate 'line', 86
  # rx subrule "statementlist" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."statementlist"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx155_pos = $P10."pos"()
  alt160_0:
.annotate 'line', 87
    set_addr $I10, alt160_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rxanchor eos
    ne rx155_pos, rx155_eos, rx155_fail
    goto alt160_end
  alt160_1:
  # rx subrule "panic" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."panic"("Confused")
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
  alt160_end:
.annotate 'line', 83
  # rx pass
    rx155_cur."!cursor_pass"(rx155_pos, "comp_unit")
    rx155_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx155_pos)
    .return (rx155_cur)
  rx155_fail:
.annotate 'line', 4
    (rx155_rep, rx155_pos, $I10, $P10) = rx155_cur."!mark_fail"(0)
    lt rx155_pos, -1, rx155_done
    eq rx155_pos, -1, rx155_fail
    jump $I10
  rx155_done:
    rx155_cur."!cursor_fail"()
    rx155_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1278500537.15927") :method
.annotate 'line', 4
    $P157 = self."!PREFIX__!subrule"("newpad", "")
    new $P158, "ResizablePMCArray"
    push $P158, $P157
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt) = self."!cursor_start"()
    rx162_cur."!cursor_debug"("START ", "statementlist")
    rx162_cur."!cursor_caparray"("statement")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan167_done
    goto rxscan167_scan
  rxscan167_loop:
    ($P10) = rx162_cur."from"()
    inc $P10
    set rx162_pos, $P10
    ge rx162_pos, rx162_eos, rxscan167_done
  rxscan167_scan:
    set_addr $I10, rxscan167_loop
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  rxscan167_done:
  alt168_0:
.annotate 'line', 90
    set_addr $I10, alt168_1
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
.annotate 'line', 91
  # rx subrule "ws" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."ws"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
  # rxanchor eos
    ne rx162_pos, rx162_eos, rx162_fail
  # rx subrule "ws" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."ws"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
    goto alt168_end
  alt168_1:
.annotate 'line', 92
  # rx subrule "ws" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."ws"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
  # rx rxquantr172 ** 0..*
    set_addr $I174, rxquantr172_done
    rx162_cur."!mark_push"(0, rx162_pos, $I174)
  rxquantr172_loop:
  # rx subrule "statement" subtype=capture negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."statement"()
    unless $P10, rx162_fail
    rx162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx162_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."eat_terminator"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."ws"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
    (rx162_rep) = rx162_cur."!mark_commit"($I174)
    rx162_cur."!mark_push"(rx162_rep, rx162_pos, $I174)
    goto rxquantr172_loop
  rxquantr172_done:
  # rx subrule "ws" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."ws"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
  alt168_end:
.annotate 'line', 90
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "statementlist")
    rx162_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_fail:
.annotate 'line', 4
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1278500537.15927") :method
.annotate 'line', 4
    $P164 = self."!PREFIX__!subrule"("ws", "")
    $P165 = self."!PREFIX__!subrule"("ws", "")
    new $P166, "ResizablePMCArray"
    push $P166, $P164
    push $P166, $P165
    .return ($P166)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P182 = "35_1278500537.15927" 
    capture_lex $P182
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "statement")
    rx177_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan180_done
    goto rxscan180_scan
  rxscan180_loop:
    ($P10) = rx177_cur."from"()
    inc $P10
    set rx177_pos, $P10
    ge rx177_pos, rx177_eos, rxscan180_done
  rxscan180_scan:
    set_addr $I10, rxscan180_loop
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  rxscan180_done:
.annotate 'line', 96
  # rx subrule "before" subtype=zerowidth negate=1
    rx177_cur."!cursor_pos"(rx177_pos)
    .const 'Sub' $P182 = "35_1278500537.15927" 
    capture_lex $P182
    $P10 = rx177_cur."before"($P182)
    if $P10, rx177_fail
  alt186_0:
.annotate 'line', 97
    set_addr $I10, alt186_1
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
.annotate 'line', 98
  # rx subrule "statement_control" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."statement_control"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx177_pos = $P10."pos"()
    goto alt186_end
  alt186_1:
.annotate 'line', 99
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
.annotate 'line', 104
  # rx rxquantr187 ** 0..1
    set_addr $I191, rxquantr187_done
    rx177_cur."!mark_push"(0, rx177_pos, $I191)
  rxquantr187_loop:
  alt188_0:
.annotate 'line', 100
    set_addr $I10, alt188_1
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
.annotate 'line', 101
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."MARKED"("endstmt")
    unless $P10, rx177_fail
    goto alt188_end
  alt188_1:
    set_addr $I10, alt188_2
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
.annotate 'line', 102
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."statement_mod_cond"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx177_pos = $P10."pos"()
  # rx rxquantr189 ** 0..1
    set_addr $I190, rxquantr189_done
    rx177_cur."!mark_push"(0, rx177_pos, $I190)
  rxquantr189_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."statement_mod_loop"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx177_pos = $P10."pos"()
    (rx177_rep) = rx177_cur."!mark_commit"($I190)
  rxquantr189_done:
    goto alt188_end
  alt188_2:
.annotate 'line', 103
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."statement_mod_loop"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx177_pos = $P10."pos"()
  alt188_end:
.annotate 'line', 104
    (rx177_rep) = rx177_cur."!mark_commit"($I191)
  rxquantr187_done:
  alt186_end:
.annotate 'line', 95
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "statement")
    rx177_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
.annotate 'line', 4
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1278500537.15927") :method
.annotate 'line', 4
    new $P179, "ResizablePMCArray"
    push $P179, ""
    .return ($P179)
.end


.namespace ["NQP";"Grammar"]
.sub "_block181"  :anon :subid("35_1278500537.15927") :method :outer("33_1278500537.15927")
.annotate 'line', 96
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan184_done
    goto rxscan184_scan
  rxscan184_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan184_done
  rxscan184_scan:
    set_addr $I10, rxscan184_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan184_done:
  alt185_0:
    set_addr $I10, alt185_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx183_pos, rx183_eos, rx183_fail
    sub $I10, rx183_pos, rx183_off
    substr $S10, rx183_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx183_fail
    inc rx183_pos
    goto alt185_end
  alt185_1:
  # rxanchor eos
    ne rx183_pos, rx183_eos, rx183_fail
  alt185_end:
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "")
    rx183_cur."!cursor_debug"("PASS  ", "", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_fail:
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    rx183_cur."!cursor_debug"("FAIL  ", "")
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx193_tgt
    .local int rx193_pos
    .local int rx193_off
    .local int rx193_eos
    .local int rx193_rep
    .local pmc rx193_cur
    (rx193_cur, rx193_pos, rx193_tgt) = self."!cursor_start"()
    rx193_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx193_cur
    .local pmc match
    .lex "$/", match
    length rx193_eos, rx193_tgt
    gt rx193_pos, rx193_eos, rx193_done
    set rx193_off, 0
    lt rx193_pos, 2, rx193_start
    sub rx193_off, rx193_pos, 1
    substr rx193_tgt, rx193_tgt, rx193_off
  rx193_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan196_done
    goto rxscan196_scan
  rxscan196_loop:
    ($P10) = rx193_cur."from"()
    inc $P10
    set rx193_pos, $P10
    ge rx193_pos, rx193_eos, rxscan196_done
  rxscan196_scan:
    set_addr $I10, rxscan196_loop
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
  rxscan196_done:
  alt197_0:
.annotate 'line', 108
    set_addr $I10, alt197_1
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
.annotate 'line', 109
  # rx literal  ";"
    add $I11, rx193_pos, 1
    gt $I11, rx193_eos, rx193_fail
    sub $I11, rx193_pos, rx193_off
    substr $S10, rx193_tgt, $I11, 1
    ne $S10, ";", rx193_fail
    add rx193_pos, 1
    goto alt197_end
  alt197_1:
    set_addr $I10, alt197_2
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
.annotate 'line', 110
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."MARKED"("endstmt")
    unless $P10, rx193_fail
    goto alt197_end
  alt197_2:
    set_addr $I10, alt197_3
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
.annotate 'line', 111
  # rx subrule "terminator" subtype=zerowidth negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."terminator"()
    unless $P10, rx193_fail
    goto alt197_end
  alt197_3:
.annotate 'line', 112
  # rxanchor eos
    ne rx193_pos, rx193_eos, rx193_fail
  alt197_end:
.annotate 'line', 108
  # rx pass
    rx193_cur."!cursor_pass"(rx193_pos, "eat_terminator")
    rx193_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx193_pos)
    .return (rx193_cur)
  rx193_fail:
.annotate 'line', 4
    (rx193_rep, rx193_pos, $I10, $P10) = rx193_cur."!mark_fail"(0)
    lt rx193_pos, -1, rx193_done
    eq rx193_pos, -1, rx193_fail
    jump $I10
  rx193_done:
    rx193_cur."!cursor_fail"()
    rx193_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx193_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1278500537.15927") :method
.annotate 'line', 4
    new $P195, "ResizablePMCArray"
    push $P195, ""
    push $P195, ""
    push $P195, ""
    push $P195, ";"
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx199_cur
    .local pmc match
    .lex "$/", match
    length rx199_eos, rx199_tgt
    gt rx199_pos, rx199_eos, rx199_done
    set rx199_off, 0
    lt rx199_pos, 2, rx199_start
    sub rx199_off, rx199_pos, 1
    substr rx199_tgt, rx199_tgt, rx199_off
  rx199_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan203_done
    goto rxscan203_scan
  rxscan203_loop:
    ($P10) = rx199_cur."from"()
    inc $P10
    set rx199_pos, $P10
    ge rx199_pos, rx199_eos, rxscan203_done
  rxscan203_scan:
    set_addr $I10, rxscan203_loop
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
  rxscan203_done:
.annotate 'line', 116
  # rx subrule "EXPR" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."EXPR"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx199_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."ws"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."pblock"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx199_pos = $P10."pos"()
.annotate 'line', 115
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "xblock")
    rx199_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate 'line', 4
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx199_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1278500537.15927") :method
.annotate 'line', 4
    $P201 = self."!PREFIX__!subrule"("EXPR", "")
    new $P202, "ResizablePMCArray"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx205_tgt
    .local int rx205_pos
    .local int rx205_off
    .local int rx205_eos
    .local int rx205_rep
    .local pmc rx205_cur
    (rx205_cur, rx205_pos, rx205_tgt) = self."!cursor_start"()
    rx205_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx205_cur
    .local pmc match
    .lex "$/", match
    length rx205_eos, rx205_tgt
    gt rx205_pos, rx205_eos, rx205_done
    set rx205_off, 0
    lt rx205_pos, 2, rx205_start
    sub rx205_off, rx205_pos, 1
    substr rx205_tgt, rx205_tgt, rx205_off
  rx205_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan210_done
    goto rxscan210_scan
  rxscan210_loop:
    ($P10) = rx205_cur."from"()
    inc $P10
    set rx205_pos, $P10
    ge rx205_pos, rx205_eos, rxscan210_done
  rxscan210_scan:
    set_addr $I10, rxscan210_loop
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
  rxscan210_done:
  alt211_0:
.annotate 'line', 119
    set_addr $I10, alt211_1
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
.annotate 'line', 120
  # rx subrule "lambda" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."lambda"()
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "newpad" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."newpad"()
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "signature" subtype=capture negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."signature"()
    unless $P10, rx205_fail
    rx205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx205_pos = $P10."pos"()
.annotate 'line', 123
  # rx subrule "blockoid" subtype=capture negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."blockoid"()
    unless $P10, rx205_fail
    rx205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx205_pos = $P10."pos"()
.annotate 'line', 120
    goto alt211_end
  alt211_1:
    set_addr $I10, alt211_2
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
.annotate 'line', 124
  # rx enumcharlist negate=0 zerowidth
    ge rx205_pos, rx205_eos, rx205_fail
    sub $I10, rx205_pos, rx205_off
    substr $S10, rx205_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx205_fail
.annotate 'line', 125
  # rx subrule "newpad" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."newpad"()
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
.annotate 'line', 126
  # rx subrule "blockoid" subtype=capture negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."blockoid"()
    unless $P10, rx205_fail
    rx205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx205_pos = $P10."pos"()
.annotate 'line', 124
    goto alt211_end
  alt211_2:
.annotate 'line', 127
  # rx subrule "panic" subtype=method negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."panic"("Missing block")
    unless $P10, rx205_fail
    rx205_pos = $P10."pos"()
  alt211_end:
.annotate 'line', 119
  # rx pass
    rx205_cur."!cursor_pass"(rx205_pos, "pblock")
    rx205_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx205_pos)
    .return (rx205_cur)
  rx205_fail:
.annotate 'line', 4
    (rx205_rep, rx205_pos, $I10, $P10) = rx205_cur."!mark_fail"(0)
    lt rx205_pos, -1, rx205_done
    eq rx205_pos, -1, rx205_fail
    jump $I10
  rx205_done:
    rx205_cur."!cursor_fail"()
    rx205_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx205_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1278500537.15927") :method
.annotate 'line', 4
    $P207 = self."!PREFIX__!subrule"("panic", "")
    $P208 = self."!PREFIX__!subrule"("lambda", "")
    new $P209, "ResizablePMCArray"
    push $P209, $P207
    push $P209, "{"
    push $P209, $P208
    .return ($P209)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx213_tgt
    .local int rx213_pos
    .local int rx213_off
    .local int rx213_eos
    .local int rx213_rep
    .local pmc rx213_cur
    (rx213_cur, rx213_pos, rx213_tgt) = self."!cursor_start"()
    rx213_cur."!cursor_debug"("START ", "lambda")
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
  alt217_0:
.annotate 'line', 130
    set_addr $I10, alt217_1
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  # rx literal  "->"
    add $I11, rx213_pos, 2
    gt $I11, rx213_eos, rx213_fail
    sub $I11, rx213_pos, rx213_off
    substr $S10, rx213_tgt, $I11, 2
    ne $S10, "->", rx213_fail
    add rx213_pos, 2
    goto alt217_end
  alt217_1:
  # rx literal  "<->"
    add $I11, rx213_pos, 3
    gt $I11, rx213_eos, rx213_fail
    sub $I11, rx213_pos, rx213_off
    substr $S10, rx213_tgt, $I11, 3
    ne $S10, "<->", rx213_fail
    add rx213_pos, 3
  alt217_end:
  # rx pass
    rx213_cur."!cursor_pass"(rx213_pos, "lambda")
    rx213_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx213_pos)
    .return (rx213_cur)
  rx213_fail:
.annotate 'line', 4
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    rx213_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1278500537.15927") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, "<->"
    push $P215, "->"
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt) = self."!cursor_start"()
    rx219_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx219_cur
    .local pmc match
    .lex "$/", match
    length rx219_eos, rx219_tgt
    gt rx219_pos, rx219_eos, rx219_done
    set rx219_off, 0
    lt rx219_pos, 2, rx219_start
    sub rx219_off, rx219_pos, 1
    substr rx219_tgt, rx219_tgt, rx219_off
  rx219_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan223_done
    goto rxscan223_scan
  rxscan223_loop:
    ($P10) = rx219_cur."from"()
    inc $P10
    set rx219_pos, $P10
    ge rx219_pos, rx219_eos, rxscan223_done
  rxscan223_scan:
    set_addr $I10, rxscan223_loop
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  rxscan223_done:
  alt224_0:
.annotate 'line', 133
    set_addr $I10, alt224_1
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx219_pos, rx219_eos, rx219_fail
    sub $I10, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx219_fail
    goto alt224_end
  alt224_1:
  # rx subrule "panic" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."panic"("Missing block")
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
  alt224_end:
.annotate 'line', 134
  # rx subrule "newpad" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."newpad"()
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
.annotate 'line', 135
  # rx subrule "blockoid" subtype=capture negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."blockoid"()
    unless $P10, rx219_fail
    rx219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx219_pos = $P10."pos"()
.annotate 'line', 132
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "block")
    rx219_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_fail:
.annotate 'line', 4
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1278500537.15927") :method
.annotate 'line', 4
    $P221 = self."!PREFIX__!subrule"("panic", "")
    new $P222, "ResizablePMCArray"
    push $P222, $P221
    push $P222, "{"
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx226_tgt
    .local int rx226_pos
    .local int rx226_off
    .local int rx226_eos
    .local int rx226_rep
    .local pmc rx226_cur
    (rx226_cur, rx226_pos, rx226_tgt) = self."!cursor_start"()
    rx226_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx226_cur
    .local pmc match
    .lex "$/", match
    length rx226_eos, rx226_tgt
    gt rx226_pos, rx226_eos, rx226_done
    set rx226_off, 0
    lt rx226_pos, 2, rx226_start
    sub rx226_off, rx226_pos, 1
    substr rx226_tgt, rx226_tgt, rx226_off
  rx226_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan230_done
    goto rxscan230_scan
  rxscan230_loop:
    ($P10) = rx226_cur."from"()
    inc $P10
    set rx226_pos, $P10
    ge rx226_pos, rx226_eos, rxscan230_done
  rxscan230_scan:
    set_addr $I10, rxscan230_loop
    rx226_cur."!mark_push"(0, rx226_pos, $I10)
  rxscan230_done:
.annotate 'line', 139
  # rx subrule "finishpad" subtype=method negate=
    rx226_cur."!cursor_pos"(rx226_pos)
    $P10 = rx226_cur."finishpad"()
    unless $P10, rx226_fail
    rx226_pos = $P10."pos"()
.annotate 'line', 140
  # rx literal  "{"
    add $I11, rx226_pos, 1
    gt $I11, rx226_eos, rx226_fail
    sub $I11, rx226_pos, rx226_off
    substr $S10, rx226_tgt, $I11, 1
    ne $S10, "{", rx226_fail
    add rx226_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx226_cur."!cursor_pos"(rx226_pos)
    $P10 = rx226_cur."statementlist"()
    unless $P10, rx226_fail
    rx226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx226_pos = $P10."pos"()
  alt231_0:
    set_addr $I10, alt231_1
    rx226_cur."!mark_push"(0, rx226_pos, $I10)
  # rx literal  "}"
    add $I11, rx226_pos, 1
    gt $I11, rx226_eos, rx226_fail
    sub $I11, rx226_pos, rx226_off
    substr $S10, rx226_tgt, $I11, 1
    ne $S10, "}", rx226_fail
    add rx226_pos, 1
    goto alt231_end
  alt231_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx226_cur."!cursor_pos"(rx226_pos)
    $P10 = rx226_cur."FAILGOAL"("'}'")
    unless $P10, rx226_fail
    rx226_pos = $P10."pos"()
  alt231_end:
.annotate 'line', 141
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx226_cur."!cursor_pos"(rx226_pos)
    $P10 = rx226_cur."ENDSTMT"()
    unless $P10, rx226_fail
.annotate 'line', 138
  # rx pass
    rx226_cur."!cursor_pass"(rx226_pos, "blockoid")
    rx226_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx226_pos)
    .return (rx226_cur)
  rx226_fail:
.annotate 'line', 4
    (rx226_rep, rx226_pos, $I10, $P10) = rx226_cur."!mark_fail"(0)
    lt rx226_pos, -1, rx226_done
    eq rx226_pos, -1, rx226_fail
    jump $I10
  rx226_done:
    rx226_cur."!cursor_fail"()
    rx226_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx226_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1278500537.15927") :method
.annotate 'line', 4
    $P228 = self."!PREFIX__!subrule"("finishpad", "")
    new $P229, "ResizablePMCArray"
    push $P229, $P228
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx234_tgt
    .local int rx234_pos
    .local int rx234_off
    .local int rx234_eos
    .local int rx234_rep
    .local pmc rx234_cur
    (rx234_cur, rx234_pos, rx234_tgt) = self."!cursor_start"()
    rx234_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx234_cur
    .local pmc match
    .lex "$/", match
    length rx234_eos, rx234_tgt
    gt rx234_pos, rx234_eos, rx234_done
    set rx234_off, 0
    lt rx234_pos, 2, rx234_start
    sub rx234_off, rx234_pos, 1
    substr rx234_tgt, rx234_tgt, rx234_off
  rx234_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan237_done
    goto rxscan237_scan
  rxscan237_loop:
    ($P10) = rx234_cur."from"()
    inc $P10
    set rx234_pos, $P10
    ge rx234_pos, rx234_eos, rxscan237_done
  rxscan237_scan:
    set_addr $I10, rxscan237_loop
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  rxscan237_done:
.annotate 'line', 144
  # rx pass
    rx234_cur."!cursor_pass"(rx234_pos, "newpad")
    rx234_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx234_pos)
    .return (rx234_cur)
  rx234_fail:
.annotate 'line', 4
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    rx234_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx234_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1278500537.15927") :method
.annotate 'line', 4
    new $P236, "ResizablePMCArray"
    push $P236, ""
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx239_tgt
    .local int rx239_pos
    .local int rx239_off
    .local int rx239_eos
    .local int rx239_rep
    .local pmc rx239_cur
    (rx239_cur, rx239_pos, rx239_tgt) = self."!cursor_start"()
    rx239_cur."!cursor_debug"("START ", "outerctx")
    .lex unicode:"$\x{a2}", rx239_cur
    .local pmc match
    .lex "$/", match
    length rx239_eos, rx239_tgt
    gt rx239_pos, rx239_eos, rx239_done
    set rx239_off, 0
    lt rx239_pos, 2, rx239_start
    sub rx239_off, rx239_pos, 1
    substr rx239_tgt, rx239_tgt, rx239_off
  rx239_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan242_done
    goto rxscan242_scan
  rxscan242_loop:
    ($P10) = rx239_cur."from"()
    inc $P10
    set rx239_pos, $P10
    ge rx239_pos, rx239_eos, rxscan242_done
  rxscan242_scan:
    set_addr $I10, rxscan242_loop
    rx239_cur."!mark_push"(0, rx239_pos, $I10)
  rxscan242_done:
.annotate 'line', 145
  # rx pass
    rx239_cur."!cursor_pass"(rx239_pos, "outerctx")
    rx239_cur."!cursor_debug"("PASS  ", "outerctx", " at pos=", rx239_pos)
    .return (rx239_cur)
  rx239_fail:
.annotate 'line', 4
    (rx239_rep, rx239_pos, $I10, $P10) = rx239_cur."!mark_fail"(0)
    lt rx239_pos, -1, rx239_done
    eq rx239_pos, -1, rx239_fail
    jump $I10
  rx239_done:
    rx239_cur."!cursor_fail"()
    rx239_cur."!cursor_debug"("FAIL  ", "outerctx")
    .return (rx239_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1278500537.15927") :method
.annotate 'line', 4
    new $P241, "ResizablePMCArray"
    push $P241, ""
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx244_tgt
    .local int rx244_pos
    .local int rx244_off
    .local int rx244_eos
    .local int rx244_rep
    .local pmc rx244_cur
    (rx244_cur, rx244_pos, rx244_tgt) = self."!cursor_start"()
    rx244_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx244_cur
    .local pmc match
    .lex "$/", match
    length rx244_eos, rx244_tgt
    gt rx244_pos, rx244_eos, rx244_done
    set rx244_off, 0
    lt rx244_pos, 2, rx244_start
    sub rx244_off, rx244_pos, 1
    substr rx244_tgt, rx244_tgt, rx244_off
  rx244_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan247_done
    goto rxscan247_scan
  rxscan247_loop:
    ($P10) = rx244_cur."from"()
    inc $P10
    set rx244_pos, $P10
    ge rx244_pos, rx244_eos, rxscan247_done
  rxscan247_scan:
    set_addr $I10, rxscan247_loop
    rx244_cur."!mark_push"(0, rx244_pos, $I10)
  rxscan247_done:
.annotate 'line', 146
  # rx pass
    rx244_cur."!cursor_pass"(rx244_pos, "finishpad")
    rx244_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx244_pos)
    .return (rx244_cur)
  rx244_fail:
.annotate 'line', 4
    (rx244_rep, rx244_pos, $I10, $P10) = rx244_cur."!mark_fail"(0)
    lt rx244_pos, -1, rx244_done
    eq rx244_pos, -1, rx244_fail
    jump $I10
  rx244_done:
    rx244_cur."!cursor_fail"()
    rx244_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx244_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1278500537.15927") :method
.annotate 'line', 4
    new $P246, "ResizablePMCArray"
    push $P246, ""
    .return ($P246)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1278500537.15927") :method
.annotate 'line', 148
    $P249 = self."!protoregex"("terminator")
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1278500537.15927") :method
.annotate 'line', 148
    $P251 = self."!PREFIX__!protoregex"("terminator")
    .return ($P251)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx253_tgt
    .local int rx253_pos
    .local int rx253_off
    .local int rx253_eos
    .local int rx253_rep
    .local pmc rx253_cur
    (rx253_cur, rx253_pos, rx253_tgt) = self."!cursor_start"()
    rx253_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx253_cur
    .local pmc match
    .lex "$/", match
    length rx253_eos, rx253_tgt
    gt rx253_pos, rx253_eos, rx253_done
    set rx253_off, 0
    lt rx253_pos, 2, rx253_start
    sub rx253_off, rx253_pos, 1
    substr rx253_tgt, rx253_tgt, rx253_off
  rx253_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan256_done
    goto rxscan256_scan
  rxscan256_loop:
    ($P10) = rx253_cur."from"()
    inc $P10
    set rx253_pos, $P10
    ge rx253_pos, rx253_eos, rxscan256_done
  rxscan256_scan:
    set_addr $I10, rxscan256_loop
    rx253_cur."!mark_push"(0, rx253_pos, $I10)
  rxscan256_done:
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    ge rx253_pos, rx253_eos, rx253_fail
    sub $I10, rx253_pos, rx253_off
    substr $S10, rx253_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx253_fail
  # rx pass
    rx253_cur."!cursor_pass"(rx253_pos, "terminator:sym<;>")
    rx253_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx253_pos)
    .return (rx253_cur)
  rx253_fail:
.annotate 'line', 4
    (rx253_rep, rx253_pos, $I10, $P10) = rx253_cur."!mark_fail"(0)
    lt rx253_pos, -1, rx253_done
    eq rx253_pos, -1, rx253_fail
    jump $I10
  rx253_done:
    rx253_cur."!cursor_fail"()
    rx253_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx253_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1278500537.15927") :method
.annotate 'line', 4
    new $P255, "ResizablePMCArray"
    push $P255, ";"
    .return ($P255)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx258_tgt
    .local int rx258_pos
    .local int rx258_off
    .local int rx258_eos
    .local int rx258_rep
    .local pmc rx258_cur
    (rx258_cur, rx258_pos, rx258_tgt) = self."!cursor_start"()
    rx258_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx258_cur
    .local pmc match
    .lex "$/", match
    length rx258_eos, rx258_tgt
    gt rx258_pos, rx258_eos, rx258_done
    set rx258_off, 0
    lt rx258_pos, 2, rx258_start
    sub rx258_off, rx258_pos, 1
    substr rx258_tgt, rx258_tgt, rx258_off
  rx258_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan261_done
    goto rxscan261_scan
  rxscan261_loop:
    ($P10) = rx258_cur."from"()
    inc $P10
    set rx258_pos, $P10
    ge rx258_pos, rx258_eos, rxscan261_done
  rxscan261_scan:
    set_addr $I10, rxscan261_loop
    rx258_cur."!mark_push"(0, rx258_pos, $I10)
  rxscan261_done:
.annotate 'line', 151
  # rx enumcharlist negate=0 zerowidth
    ge rx258_pos, rx258_eos, rx258_fail
    sub $I10, rx258_pos, rx258_off
    substr $S10, rx258_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx258_fail
  # rx pass
    rx258_cur."!cursor_pass"(rx258_pos, "terminator:sym<}>")
    rx258_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx258_pos)
    .return (rx258_cur)
  rx258_fail:
.annotate 'line', 4
    (rx258_rep, rx258_pos, $I10, $P10) = rx258_cur."!mark_fail"(0)
    lt rx258_pos, -1, rx258_done
    eq rx258_pos, -1, rx258_fail
    jump $I10
  rx258_done:
    rx258_cur."!cursor_fail"()
    rx258_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx258_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1278500537.15927") :method
.annotate 'line', 4
    new $P260, "ResizablePMCArray"
    push $P260, "}"
    .return ($P260)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1278500537.15927") :method
.annotate 'line', 155
    $P263 = self."!protoregex"("statement_control")
    .return ($P263)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1278500537.15927") :method
.annotate 'line', 155
    $P265 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P265)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx267_tgt
    .local int rx267_pos
    .local int rx267_off
    .local int rx267_eos
    .local int rx267_rep
    .local pmc rx267_cur
    (rx267_cur, rx267_pos, rx267_tgt) = self."!cursor_start"()
    rx267_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx267_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx267_cur
    .local pmc match
    .lex "$/", match
    length rx267_eos, rx267_tgt
    gt rx267_pos, rx267_eos, rx267_done
    set rx267_off, 0
    lt rx267_pos, 2, rx267_start
    sub rx267_off, rx267_pos, 1
    substr rx267_tgt, rx267_tgt, rx267_off
  rx267_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan270_done
    goto rxscan270_scan
  rxscan270_loop:
    ($P10) = rx267_cur."from"()
    inc $P10
    set rx267_pos, $P10
    ge rx267_pos, rx267_eos, rxscan270_done
  rxscan270_scan:
    set_addr $I10, rxscan270_loop
    rx267_cur."!mark_push"(0, rx267_pos, $I10)
  rxscan270_done:
.annotate 'line', 158
  # rx subcapture "sym"
    set_addr $I10, rxcap_271_fail
    rx267_cur."!mark_push"(0, rx267_pos, $I10)
  # rx literal  "if"
    add $I11, rx267_pos, 2
    gt $I11, rx267_eos, rx267_fail
    sub $I11, rx267_pos, rx267_off
    substr $S10, rx267_tgt, $I11, 2
    ne $S10, "if", rx267_fail
    add rx267_pos, 2
    set_addr $I10, rxcap_271_fail
    ($I12, $I11) = rx267_cur."!mark_peek"($I10)
    rx267_cur."!cursor_pos"($I11)
    ($P10) = rx267_cur."!cursor_start"()
    $P10."!cursor_pass"(rx267_pos, "")
    rx267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_271_done
  rxcap_271_fail:
    goto rx267_fail
  rxcap_271_done:
  # rx charclass s
    ge rx267_pos, rx267_eos, rx267_fail
    sub $I10, rx267_pos, rx267_off
    is_cclass $I11, 32, rx267_tgt, $I10
    unless $I11, rx267_fail
    inc rx267_pos
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
.annotate 'line', 159
  # rx subrule "xblock" subtype=capture negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."xblock"()
    unless $P10, rx267_fail
    rx267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx267_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
.annotate 'line', 160
  # rx rxquantr274 ** 0..*
    set_addr $I278, rxquantr274_done
    rx267_cur."!mark_push"(0, rx267_pos, $I278)
  rxquantr274_loop:
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx267_pos, 5
    gt $I11, rx267_eos, rx267_fail
    sub $I11, rx267_pos, rx267_off
    substr $S10, rx267_tgt, $I11, 5
    ne $S10, "elsif", rx267_fail
    add rx267_pos, 5
  # rx charclass s
    ge rx267_pos, rx267_eos, rx267_fail
    sub $I10, rx267_pos, rx267_off
    is_cclass $I11, 32, rx267_tgt, $I10
    unless $I11, rx267_fail
    inc rx267_pos
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."xblock"()
    unless $P10, rx267_fail
    rx267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx267_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
    (rx267_rep) = rx267_cur."!mark_commit"($I278)
    rx267_cur."!mark_push"(rx267_rep, rx267_pos, $I278)
    goto rxquantr274_loop
  rxquantr274_done:
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
.annotate 'line', 161
  # rx rxquantr280 ** 0..1
    set_addr $I284, rxquantr280_done
    rx267_cur."!mark_push"(0, rx267_pos, $I284)
  rxquantr280_loop:
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx267_pos, 4
    gt $I11, rx267_eos, rx267_fail
    sub $I11, rx267_pos, rx267_off
    substr $S10, rx267_tgt, $I11, 4
    ne $S10, "else", rx267_fail
    add rx267_pos, 4
  # rx charclass s
    ge rx267_pos, rx267_eos, rx267_fail
    sub $I10, rx267_pos, rx267_off
    is_cclass $I11, 32, rx267_tgt, $I10
    unless $I11, rx267_fail
    inc rx267_pos
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."pblock"()
    unless $P10, rx267_fail
    rx267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx267_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
    (rx267_rep) = rx267_cur."!mark_commit"($I284)
  rxquantr280_done:
  # rx subrule "ws" subtype=method negate=
    rx267_cur."!cursor_pos"(rx267_pos)
    $P10 = rx267_cur."ws"()
    unless $P10, rx267_fail
    rx267_pos = $P10."pos"()
.annotate 'line', 157
  # rx pass
    rx267_cur."!cursor_pass"(rx267_pos, "statement_control:sym<if>")
    rx267_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx267_pos)
    .return (rx267_cur)
  rx267_fail:
.annotate 'line', 4
    (rx267_rep, rx267_pos, $I10, $P10) = rx267_cur."!mark_fail"(0)
    lt rx267_pos, -1, rx267_done
    eq rx267_pos, -1, rx267_fail
    jump $I10
  rx267_done:
    rx267_cur."!cursor_fail"()
    rx267_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx267_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1278500537.15927") :method
.annotate 'line', 4
    new $P269, "ResizablePMCArray"
    push $P269, "if"
    .return ($P269)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P297 = "66_1278500537.15927" 
    capture_lex $P297
    .local string rx287_tgt
    .local int rx287_pos
    .local int rx287_off
    .local int rx287_eos
    .local int rx287_rep
    .local pmc rx287_cur
    (rx287_cur, rx287_pos, rx287_tgt) = self."!cursor_start"()
    rx287_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx287_cur
    .local pmc match
    .lex "$/", match
    length rx287_eos, rx287_tgt
    gt rx287_pos, rx287_eos, rx287_done
    set rx287_off, 0
    lt rx287_pos, 2, rx287_start
    sub rx287_off, rx287_pos, 1
    substr rx287_tgt, rx287_tgt, rx287_off
  rx287_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan290_done
    goto rxscan290_scan
  rxscan290_loop:
    ($P10) = rx287_cur."from"()
    inc $P10
    set rx287_pos, $P10
    ge rx287_pos, rx287_eos, rxscan290_done
  rxscan290_scan:
    set_addr $I10, rxscan290_loop
    rx287_cur."!mark_push"(0, rx287_pos, $I10)
  rxscan290_done:
.annotate 'line', 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_291_fail
    rx287_cur."!mark_push"(0, rx287_pos, $I10)
  # rx literal  "unless"
    add $I11, rx287_pos, 6
    gt $I11, rx287_eos, rx287_fail
    sub $I11, rx287_pos, rx287_off
    substr $S10, rx287_tgt, $I11, 6
    ne $S10, "unless", rx287_fail
    add rx287_pos, 6
    set_addr $I10, rxcap_291_fail
    ($I12, $I11) = rx287_cur."!mark_peek"($I10)
    rx287_cur."!cursor_pos"($I11)
    ($P10) = rx287_cur."!cursor_start"()
    $P10."!cursor_pass"(rx287_pos, "")
    rx287_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_291_done
  rxcap_291_fail:
    goto rx287_fail
  rxcap_291_done:
  # rx charclass s
    ge rx287_pos, rx287_eos, rx287_fail
    sub $I10, rx287_pos, rx287_off
    is_cclass $I11, 32, rx287_tgt, $I10
    unless $I11, rx287_fail
    inc rx287_pos
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
.annotate 'line', 166
  # rx subrule "xblock" subtype=capture negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."xblock"()
    unless $P10, rx287_fail
    rx287_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx287_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
  alt294_0:
.annotate 'line', 167
    set_addr $I10, alt294_1
    rx287_cur."!mark_push"(0, rx287_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx287_cur."!cursor_pos"(rx287_pos)
    .const 'Sub' $P297 = "66_1278500537.15927" 
    capture_lex $P297
    $P10 = rx287_cur."before"($P297)
    if $P10, rx287_fail
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
    goto alt294_end
  alt294_1:
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
  alt294_end:
  # rx subrule "ws" subtype=method negate=
    rx287_cur."!cursor_pos"(rx287_pos)
    $P10 = rx287_cur."ws"()
    unless $P10, rx287_fail
    rx287_pos = $P10."pos"()
.annotate 'line', 164
  # rx pass
    rx287_cur."!cursor_pass"(rx287_pos, "statement_control:sym<unless>")
    rx287_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx287_pos)
    .return (rx287_cur)
  rx287_fail:
.annotate 'line', 4
    (rx287_rep, rx287_pos, $I10, $P10) = rx287_cur."!mark_fail"(0)
    lt rx287_pos, -1, rx287_done
    eq rx287_pos, -1, rx287_fail
    jump $I10
  rx287_done:
    rx287_cur."!cursor_fail"()
    rx287_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx287_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1278500537.15927") :method
.annotate 'line', 4
    new $P289, "ResizablePMCArray"
    push $P289, "unless"
    .return ($P289)
.end


.namespace ["NQP";"Grammar"]
.sub "_block296"  :anon :subid("66_1278500537.15927") :method :outer("64_1278500537.15927")
.annotate 'line', 167
    .local string rx298_tgt
    .local int rx298_pos
    .local int rx298_off
    .local int rx298_eos
    .local int rx298_rep
    .local pmc rx298_cur
    (rx298_cur, rx298_pos, rx298_tgt) = self."!cursor_start"()
    rx298_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx298_cur
    .local pmc match
    .lex "$/", match
    length rx298_eos, rx298_tgt
    gt rx298_pos, rx298_eos, rx298_done
    set rx298_off, 0
    lt rx298_pos, 2, rx298_start
    sub rx298_off, rx298_pos, 1
    substr rx298_tgt, rx298_tgt, rx298_off
  rx298_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan299_done
    goto rxscan299_scan
  rxscan299_loop:
    ($P10) = rx298_cur."from"()
    inc $P10
    set rx298_pos, $P10
    ge rx298_pos, rx298_eos, rxscan299_done
  rxscan299_scan:
    set_addr $I10, rxscan299_loop
    rx298_cur."!mark_push"(0, rx298_pos, $I10)
  rxscan299_done:
  # rx literal  "else"
    add $I11, rx298_pos, 4
    gt $I11, rx298_eos, rx298_fail
    sub $I11, rx298_pos, rx298_off
    substr $S10, rx298_tgt, $I11, 4
    ne $S10, "else", rx298_fail
    add rx298_pos, 4
  # rx pass
    rx298_cur."!cursor_pass"(rx298_pos, "")
    rx298_cur."!cursor_debug"("PASS  ", "", " at pos=", rx298_pos)
    .return (rx298_cur)
  rx298_fail:
    (rx298_rep, rx298_pos, $I10, $P10) = rx298_cur."!mark_fail"(0)
    lt rx298_pos, -1, rx298_done
    eq rx298_pos, -1, rx298_fail
    jump $I10
  rx298_done:
    rx298_cur."!cursor_fail"()
    rx298_cur."!cursor_debug"("FAIL  ", "")
    .return (rx298_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx305_tgt
    .local int rx305_pos
    .local int rx305_off
    .local int rx305_eos
    .local int rx305_rep
    .local pmc rx305_cur
    (rx305_cur, rx305_pos, rx305_tgt) = self."!cursor_start"()
    rx305_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx305_cur
    .local pmc match
    .lex "$/", match
    length rx305_eos, rx305_tgt
    gt rx305_pos, rx305_eos, rx305_done
    set rx305_off, 0
    lt rx305_pos, 2, rx305_start
    sub rx305_off, rx305_pos, 1
    substr rx305_tgt, rx305_tgt, rx305_off
  rx305_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan308_done
    goto rxscan308_scan
  rxscan308_loop:
    ($P10) = rx305_cur."from"()
    inc $P10
    set rx305_pos, $P10
    ge rx305_pos, rx305_eos, rxscan308_done
  rxscan308_scan:
    set_addr $I10, rxscan308_loop
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  rxscan308_done:
.annotate 'line', 171
  # rx subcapture "sym"
    set_addr $I10, rxcap_310_fail
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  alt309_0:
    set_addr $I10, alt309_1
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  # rx literal  "while"
    add $I11, rx305_pos, 5
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 5
    ne $S10, "while", rx305_fail
    add rx305_pos, 5
    goto alt309_end
  alt309_1:
  # rx literal  "until"
    add $I11, rx305_pos, 5
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 5
    ne $S10, "until", rx305_fail
    add rx305_pos, 5
  alt309_end:
    set_addr $I10, rxcap_310_fail
    ($I12, $I11) = rx305_cur."!mark_peek"($I10)
    rx305_cur."!cursor_pos"($I11)
    ($P10) = rx305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx305_pos, "")
    rx305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_310_done
  rxcap_310_fail:
    goto rx305_fail
  rxcap_310_done:
  # rx charclass s
    ge rx305_pos, rx305_eos, rx305_fail
    sub $I10, rx305_pos, rx305_off
    is_cclass $I11, 32, rx305_tgt, $I10
    unless $I11, rx305_fail
    inc rx305_pos
  # rx subrule "ws" subtype=method negate=
    rx305_cur."!cursor_pos"(rx305_pos)
    $P10 = rx305_cur."ws"()
    unless $P10, rx305_fail
    rx305_pos = $P10."pos"()
.annotate 'line', 172
  # rx subrule "xblock" subtype=capture negate=
    rx305_cur."!cursor_pos"(rx305_pos)
    $P10 = rx305_cur."xblock"()
    unless $P10, rx305_fail
    rx305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx305_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx305_cur."!cursor_pos"(rx305_pos)
    $P10 = rx305_cur."ws"()
    unless $P10, rx305_fail
    rx305_pos = $P10."pos"()
.annotate 'line', 170
  # rx pass
    rx305_cur."!cursor_pass"(rx305_pos, "statement_control:sym<while>")
    rx305_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx305_pos)
    .return (rx305_cur)
  rx305_fail:
.annotate 'line', 4
    (rx305_rep, rx305_pos, $I10, $P10) = rx305_cur."!mark_fail"(0)
    lt rx305_pos, -1, rx305_done
    eq rx305_pos, -1, rx305_fail
    jump $I10
  rx305_done:
    rx305_cur."!cursor_fail"()
    rx305_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx305_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1278500537.15927") :method
.annotate 'line', 4
    new $P307, "ResizablePMCArray"
    push $P307, "until"
    push $P307, "while"
    .return ($P307)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx314_tgt
    .local int rx314_pos
    .local int rx314_off
    .local int rx314_eos
    .local int rx314_rep
    .local pmc rx314_cur
    (rx314_cur, rx314_pos, rx314_tgt) = self."!cursor_start"()
    rx314_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx314_cur
    .local pmc match
    .lex "$/", match
    length rx314_eos, rx314_tgt
    gt rx314_pos, rx314_eos, rx314_done
    set rx314_off, 0
    lt rx314_pos, 2, rx314_start
    sub rx314_off, rx314_pos, 1
    substr rx314_tgt, rx314_tgt, rx314_off
  rx314_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan317_done
    goto rxscan317_scan
  rxscan317_loop:
    ($P10) = rx314_cur."from"()
    inc $P10
    set rx314_pos, $P10
    ge rx314_pos, rx314_eos, rxscan317_done
  rxscan317_scan:
    set_addr $I10, rxscan317_loop
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  rxscan317_done:
.annotate 'line', 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_318_fail
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx314_pos, 6
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    substr $S10, rx314_tgt, $I11, 6
    ne $S10, "repeat", rx314_fail
    add rx314_pos, 6
    set_addr $I10, rxcap_318_fail
    ($I12, $I11) = rx314_cur."!mark_peek"($I10)
    rx314_cur."!cursor_pos"($I11)
    ($P10) = rx314_cur."!cursor_start"()
    $P10."!cursor_pass"(rx314_pos, "")
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_318_done
  rxcap_318_fail:
    goto rx314_fail
  rxcap_318_done:
  # rx charclass s
    ge rx314_pos, rx314_eos, rx314_fail
    sub $I10, rx314_pos, rx314_off
    is_cclass $I11, 32, rx314_tgt, $I10
    unless $I11, rx314_fail
    inc rx314_pos
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  alt320_0:
.annotate 'line', 177
    set_addr $I10, alt320_1
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_323_fail
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  alt322_0:
    set_addr $I10, alt322_1
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  # rx literal  "while"
    add $I11, rx314_pos, 5
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    substr $S10, rx314_tgt, $I11, 5
    ne $S10, "while", rx314_fail
    add rx314_pos, 5
    goto alt322_end
  alt322_1:
  # rx literal  "until"
    add $I11, rx314_pos, 5
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    substr $S10, rx314_tgt, $I11, 5
    ne $S10, "until", rx314_fail
    add rx314_pos, 5
  alt322_end:
    set_addr $I10, rxcap_323_fail
    ($I12, $I11) = rx314_cur."!mark_peek"($I10)
    rx314_cur."!cursor_pos"($I11)
    ($P10) = rx314_cur."!cursor_start"()
    $P10."!cursor_pass"(rx314_pos, "")
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_323_done
  rxcap_323_fail:
    goto rx314_fail
  rxcap_323_done:
  # rx charclass s
    ge rx314_pos, rx314_eos, rx314_fail
    sub $I10, rx314_pos, rx314_off
    is_cclass $I11, 32, rx314_tgt, $I10
    unless $I11, rx314_fail
    inc rx314_pos
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."xblock"()
    unless $P10, rx314_fail
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx314_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
    goto alt320_end
  alt320_1:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."pblock"()
    unless $P10, rx314_fail
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx314_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_329_fail
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  alt328_0:
    set_addr $I10, alt328_1
    rx314_cur."!mark_push"(0, rx314_pos, $I10)
  # rx literal  "while"
    add $I11, rx314_pos, 5
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    substr $S10, rx314_tgt, $I11, 5
    ne $S10, "while", rx314_fail
    add rx314_pos, 5
    goto alt328_end
  alt328_1:
  # rx literal  "until"
    add $I11, rx314_pos, 5
    gt $I11, rx314_eos, rx314_fail
    sub $I11, rx314_pos, rx314_off
    substr $S10, rx314_tgt, $I11, 5
    ne $S10, "until", rx314_fail
    add rx314_pos, 5
  alt328_end:
    set_addr $I10, rxcap_329_fail
    ($I12, $I11) = rx314_cur."!mark_peek"($I10)
    rx314_cur."!cursor_pos"($I11)
    ($P10) = rx314_cur."!cursor_start"()
    $P10."!cursor_pass"(rx314_pos, "")
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_329_done
  rxcap_329_fail:
    goto rx314_fail
  rxcap_329_done:
  # rx charclass s
    ge rx314_pos, rx314_eos, rx314_fail
    sub $I10, rx314_pos, rx314_off
    is_cclass $I11, 32, rx314_tgt, $I10
    unless $I11, rx314_fail
    inc rx314_pos
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."EXPR"()
    unless $P10, rx314_fail
    rx314_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx314_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
  alt320_end:
.annotate 'line', 180
  # rx subrule "ws" subtype=method negate=
    rx314_cur."!cursor_pos"(rx314_pos)
    $P10 = rx314_cur."ws"()
    unless $P10, rx314_fail
    rx314_pos = $P10."pos"()
.annotate 'line', 175
  # rx pass
    rx314_cur."!cursor_pass"(rx314_pos, "statement_control:sym<repeat>")
    rx314_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx314_pos)
    .return (rx314_cur)
  rx314_fail:
.annotate 'line', 4
    (rx314_rep, rx314_pos, $I10, $P10) = rx314_cur."!mark_fail"(0)
    lt rx314_pos, -1, rx314_done
    eq rx314_pos, -1, rx314_fail
    jump $I10
  rx314_done:
    rx314_cur."!cursor_fail"()
    rx314_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx314_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1278500537.15927") :method
.annotate 'line', 4
    new $P316, "ResizablePMCArray"
    push $P316, "repeat"
    .return ($P316)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx334_tgt
    .local int rx334_pos
    .local int rx334_off
    .local int rx334_eos
    .local int rx334_rep
    .local pmc rx334_cur
    (rx334_cur, rx334_pos, rx334_tgt) = self."!cursor_start"()
    rx334_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx334_cur
    .local pmc match
    .lex "$/", match
    length rx334_eos, rx334_tgt
    gt rx334_pos, rx334_eos, rx334_done
    set rx334_off, 0
    lt rx334_pos, 2, rx334_start
    sub rx334_off, rx334_pos, 1
    substr rx334_tgt, rx334_tgt, rx334_off
  rx334_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan337_done
    goto rxscan337_scan
  rxscan337_loop:
    ($P10) = rx334_cur."from"()
    inc $P10
    set rx334_pos, $P10
    ge rx334_pos, rx334_eos, rxscan337_done
  rxscan337_scan:
    set_addr $I10, rxscan337_loop
    rx334_cur."!mark_push"(0, rx334_pos, $I10)
  rxscan337_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_338_fail
    rx334_cur."!mark_push"(0, rx334_pos, $I10)
  # rx literal  "for"
    add $I11, rx334_pos, 3
    gt $I11, rx334_eos, rx334_fail
    sub $I11, rx334_pos, rx334_off
    substr $S10, rx334_tgt, $I11, 3
    ne $S10, "for", rx334_fail
    add rx334_pos, 3
    set_addr $I10, rxcap_338_fail
    ($I12, $I11) = rx334_cur."!mark_peek"($I10)
    rx334_cur."!cursor_pos"($I11)
    ($P10) = rx334_cur."!cursor_start"()
    $P10."!cursor_pass"(rx334_pos, "")
    rx334_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_338_done
  rxcap_338_fail:
    goto rx334_fail
  rxcap_338_done:
  # rx charclass s
    ge rx334_pos, rx334_eos, rx334_fail
    sub $I10, rx334_pos, rx334_off
    is_cclass $I11, 32, rx334_tgt, $I10
    unless $I11, rx334_fail
    inc rx334_pos
  # rx subrule "ws" subtype=method negate=
    rx334_cur."!cursor_pos"(rx334_pos)
    $P10 = rx334_cur."ws"()
    unless $P10, rx334_fail
    rx334_pos = $P10."pos"()
.annotate 'line', 185
  # rx subrule "xblock" subtype=capture negate=
    rx334_cur."!cursor_pos"(rx334_pos)
    $P10 = rx334_cur."xblock"()
    unless $P10, rx334_fail
    rx334_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx334_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx334_cur."!cursor_pos"(rx334_pos)
    $P10 = rx334_cur."ws"()
    unless $P10, rx334_fail
    rx334_pos = $P10."pos"()
.annotate 'line', 183
  # rx pass
    rx334_cur."!cursor_pass"(rx334_pos, "statement_control:sym<for>")
    rx334_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx334_pos)
    .return (rx334_cur)
  rx334_fail:
.annotate 'line', 4
    (rx334_rep, rx334_pos, $I10, $P10) = rx334_cur."!mark_fail"(0)
    lt rx334_pos, -1, rx334_done
    eq rx334_pos, -1, rx334_fail
    jump $I10
  rx334_done:
    rx334_cur."!cursor_fail"()
    rx334_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx334_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1278500537.15927") :method
.annotate 'line', 4
    new $P336, "ResizablePMCArray"
    push $P336, "for"
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx342_tgt
    .local int rx342_pos
    .local int rx342_off
    .local int rx342_eos
    .local int rx342_rep
    .local pmc rx342_cur
    (rx342_cur, rx342_pos, rx342_tgt) = self."!cursor_start"()
    rx342_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx342_cur
    .local pmc match
    .lex "$/", match
    length rx342_eos, rx342_tgt
    gt rx342_pos, rx342_eos, rx342_done
    set rx342_off, 0
    lt rx342_pos, 2, rx342_start
    sub rx342_off, rx342_pos, 1
    substr rx342_tgt, rx342_tgt, rx342_off
  rx342_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan345_done
    goto rxscan345_scan
  rxscan345_loop:
    ($P10) = rx342_cur."from"()
    inc $P10
    set rx342_pos, $P10
    ge rx342_pos, rx342_eos, rxscan345_done
  rxscan345_scan:
    set_addr $I10, rxscan345_loop
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  rxscan345_done:
.annotate 'line', 189
  # rx subcapture "sym"
    set_addr $I10, rxcap_346_fail
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx342_pos, 5
    gt $I11, rx342_eos, rx342_fail
    sub $I11, rx342_pos, rx342_off
    substr $S10, rx342_tgt, $I11, 5
    ne $S10, "CATCH", rx342_fail
    add rx342_pos, 5
    set_addr $I10, rxcap_346_fail
    ($I12, $I11) = rx342_cur."!mark_peek"($I10)
    rx342_cur."!cursor_pos"($I11)
    ($P10) = rx342_cur."!cursor_start"()
    $P10."!cursor_pass"(rx342_pos, "")
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_346_done
  rxcap_346_fail:
    goto rx342_fail
  rxcap_346_done:
  # rx charclass s
    ge rx342_pos, rx342_eos, rx342_fail
    sub $I10, rx342_pos, rx342_off
    is_cclass $I11, 32, rx342_tgt, $I10
    unless $I11, rx342_fail
    inc rx342_pos
  # rx subrule "ws" subtype=method negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."ws"()
    unless $P10, rx342_fail
    rx342_pos = $P10."pos"()
.annotate 'line', 190
  # rx subrule "block" subtype=capture negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."block"()
    unless $P10, rx342_fail
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx342_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."ws"()
    unless $P10, rx342_fail
    rx342_pos = $P10."pos"()
.annotate 'line', 188
  # rx pass
    rx342_cur."!cursor_pass"(rx342_pos, "statement_control:sym<CATCH>")
    rx342_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx342_pos)
    .return (rx342_cur)
  rx342_fail:
.annotate 'line', 4
    (rx342_rep, rx342_pos, $I10, $P10) = rx342_cur."!mark_fail"(0)
    lt rx342_pos, -1, rx342_done
    eq rx342_pos, -1, rx342_fail
    jump $I10
  rx342_done:
    rx342_cur."!cursor_fail"()
    rx342_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx342_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1278500537.15927") :method
.annotate 'line', 4
    new $P344, "ResizablePMCArray"
    push $P344, "CATCH"
    .return ($P344)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx350_tgt
    .local int rx350_pos
    .local int rx350_off
    .local int rx350_eos
    .local int rx350_rep
    .local pmc rx350_cur
    (rx350_cur, rx350_pos, rx350_tgt) = self."!cursor_start"()
    rx350_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx350_cur
    .local pmc match
    .lex "$/", match
    length rx350_eos, rx350_tgt
    gt rx350_pos, rx350_eos, rx350_done
    set rx350_off, 0
    lt rx350_pos, 2, rx350_start
    sub rx350_off, rx350_pos, 1
    substr rx350_tgt, rx350_tgt, rx350_off
  rx350_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan353_done
    goto rxscan353_scan
  rxscan353_loop:
    ($P10) = rx350_cur."from"()
    inc $P10
    set rx350_pos, $P10
    ge rx350_pos, rx350_eos, rxscan353_done
  rxscan353_scan:
    set_addr $I10, rxscan353_loop
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  rxscan353_done:
.annotate 'line', 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_354_fail
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx350_pos, 7
    gt $I11, rx350_eos, rx350_fail
    sub $I11, rx350_pos, rx350_off
    substr $S10, rx350_tgt, $I11, 7
    ne $S10, "CONTROL", rx350_fail
    add rx350_pos, 7
    set_addr $I10, rxcap_354_fail
    ($I12, $I11) = rx350_cur."!mark_peek"($I10)
    rx350_cur."!cursor_pos"($I11)
    ($P10) = rx350_cur."!cursor_start"()
    $P10."!cursor_pass"(rx350_pos, "")
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_354_done
  rxcap_354_fail:
    goto rx350_fail
  rxcap_354_done:
  # rx charclass s
    ge rx350_pos, rx350_eos, rx350_fail
    sub $I10, rx350_pos, rx350_off
    is_cclass $I11, 32, rx350_tgt, $I10
    unless $I11, rx350_fail
    inc rx350_pos
  # rx subrule "ws" subtype=method negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."ws"()
    unless $P10, rx350_fail
    rx350_pos = $P10."pos"()
.annotate 'line', 195
  # rx subrule "block" subtype=capture negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."block"()
    unless $P10, rx350_fail
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx350_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."ws"()
    unless $P10, rx350_fail
    rx350_pos = $P10."pos"()
.annotate 'line', 193
  # rx pass
    rx350_cur."!cursor_pass"(rx350_pos, "statement_control:sym<CONTROL>")
    rx350_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx350_pos)
    .return (rx350_cur)
  rx350_fail:
.annotate 'line', 4
    (rx350_rep, rx350_pos, $I10, $P10) = rx350_cur."!mark_fail"(0)
    lt rx350_pos, -1, rx350_done
    eq rx350_pos, -1, rx350_fail
    jump $I10
  rx350_done:
    rx350_cur."!cursor_fail"()
    rx350_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx350_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1278500537.15927") :method
.annotate 'line', 4
    new $P352, "ResizablePMCArray"
    push $P352, "CONTROL"
    .return ($P352)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1278500537.15927") :method
.annotate 'line', 198
    $P358 = self."!protoregex"("statement_prefix")
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1278500537.15927") :method
.annotate 'line', 198
    $P360 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx362_tgt
    .local int rx362_pos
    .local int rx362_off
    .local int rx362_eos
    .local int rx362_rep
    .local pmc rx362_cur
    (rx362_cur, rx362_pos, rx362_tgt) = self."!cursor_start"()
    rx362_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx362_cur
    .local pmc match
    .lex "$/", match
    length rx362_eos, rx362_tgt
    gt rx362_pos, rx362_eos, rx362_done
    set rx362_off, 0
    lt rx362_pos, 2, rx362_start
    sub rx362_off, rx362_pos, 1
    substr rx362_tgt, rx362_tgt, rx362_off
  rx362_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan366_done
    goto rxscan366_scan
  rxscan366_loop:
    ($P10) = rx362_cur."from"()
    inc $P10
    set rx362_pos, $P10
    ge rx362_pos, rx362_eos, rxscan366_done
  rxscan366_scan:
    set_addr $I10, rxscan366_loop
    rx362_cur."!mark_push"(0, rx362_pos, $I10)
  rxscan366_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_367_fail
    rx362_cur."!mark_push"(0, rx362_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx362_pos, 4
    gt $I11, rx362_eos, rx362_fail
    sub $I11, rx362_pos, rx362_off
    substr $S10, rx362_tgt, $I11, 4
    ne $S10, "INIT", rx362_fail
    add rx362_pos, 4
    set_addr $I10, rxcap_367_fail
    ($I12, $I11) = rx362_cur."!mark_peek"($I10)
    rx362_cur."!cursor_pos"($I11)
    ($P10) = rx362_cur."!cursor_start"()
    $P10."!cursor_pass"(rx362_pos, "")
    rx362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_367_done
  rxcap_367_fail:
    goto rx362_fail
  rxcap_367_done:
  # rx subrule "blorst" subtype=capture negate=
    rx362_cur."!cursor_pos"(rx362_pos)
    $P10 = rx362_cur."blorst"()
    unless $P10, rx362_fail
    rx362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx362_pos = $P10."pos"()
  # rx pass
    rx362_cur."!cursor_pass"(rx362_pos, "statement_prefix:sym<INIT>")
    rx362_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx362_pos)
    .return (rx362_cur)
  rx362_fail:
.annotate 'line', 4
    (rx362_rep, rx362_pos, $I10, $P10) = rx362_cur."!mark_fail"(0)
    lt rx362_pos, -1, rx362_done
    eq rx362_pos, -1, rx362_fail
    jump $I10
  rx362_done:
    rx362_cur."!cursor_fail"()
    rx362_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx362_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1278500537.15927") :method
.annotate 'line', 4
    $P364 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P365, "ResizablePMCArray"
    push $P365, $P364
    .return ($P365)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx369_tgt
    .local int rx369_pos
    .local int rx369_off
    .local int rx369_eos
    .local int rx369_rep
    .local pmc rx369_cur
    (rx369_cur, rx369_pos, rx369_tgt) = self."!cursor_start"()
    rx369_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx369_cur
    .local pmc match
    .lex "$/", match
    length rx369_eos, rx369_tgt
    gt rx369_pos, rx369_eos, rx369_done
    set rx369_off, 0
    lt rx369_pos, 2, rx369_start
    sub rx369_off, rx369_pos, 1
    substr rx369_tgt, rx369_tgt, rx369_off
  rx369_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan373_done
    goto rxscan373_scan
  rxscan373_loop:
    ($P10) = rx369_cur."from"()
    inc $P10
    set rx369_pos, $P10
    ge rx369_pos, rx369_eos, rxscan373_done
  rxscan373_scan:
    set_addr $I10, rxscan373_loop
    rx369_cur."!mark_push"(0, rx369_pos, $I10)
  rxscan373_done:
.annotate 'line', 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_374_fail
    rx369_cur."!mark_push"(0, rx369_pos, $I10)
  # rx literal  "try"
    add $I11, rx369_pos, 3
    gt $I11, rx369_eos, rx369_fail
    sub $I11, rx369_pos, rx369_off
    substr $S10, rx369_tgt, $I11, 3
    ne $S10, "try", rx369_fail
    add rx369_pos, 3
    set_addr $I10, rxcap_374_fail
    ($I12, $I11) = rx369_cur."!mark_peek"($I10)
    rx369_cur."!cursor_pos"($I11)
    ($P10) = rx369_cur."!cursor_start"()
    $P10."!cursor_pass"(rx369_pos, "")
    rx369_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_374_done
  rxcap_374_fail:
    goto rx369_fail
  rxcap_374_done:
.annotate 'line', 203
  # rx subrule "blorst" subtype=capture negate=
    rx369_cur."!cursor_pos"(rx369_pos)
    $P10 = rx369_cur."blorst"()
    unless $P10, rx369_fail
    rx369_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx369_pos = $P10."pos"()
.annotate 'line', 201
  # rx pass
    rx369_cur."!cursor_pass"(rx369_pos, "statement_prefix:sym<try>")
    rx369_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx369_pos)
    .return (rx369_cur)
  rx369_fail:
.annotate 'line', 4
    (rx369_rep, rx369_pos, $I10, $P10) = rx369_cur."!mark_fail"(0)
    lt rx369_pos, -1, rx369_done
    eq rx369_pos, -1, rx369_fail
    jump $I10
  rx369_done:
    rx369_cur."!cursor_fail"()
    rx369_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx369_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1278500537.15927") :method
.annotate 'line', 4
    $P371 = self."!PREFIX__!subrule"("blorst", "try")
    new $P372, "ResizablePMCArray"
    push $P372, $P371
    .return ($P372)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx376_tgt
    .local int rx376_pos
    .local int rx376_off
    .local int rx376_eos
    .local int rx376_rep
    .local pmc rx376_cur
    (rx376_cur, rx376_pos, rx376_tgt) = self."!cursor_start"()
    rx376_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx376_cur
    .local pmc match
    .lex "$/", match
    length rx376_eos, rx376_tgt
    gt rx376_pos, rx376_eos, rx376_done
    set rx376_off, 0
    lt rx376_pos, 2, rx376_start
    sub rx376_off, rx376_pos, 1
    substr rx376_tgt, rx376_tgt, rx376_off
  rx376_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan379_done
    goto rxscan379_scan
  rxscan379_loop:
    ($P10) = rx376_cur."from"()
    inc $P10
    set rx376_pos, $P10
    ge rx376_pos, rx376_eos, rxscan379_done
  rxscan379_scan:
    set_addr $I10, rxscan379_loop
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  rxscan379_done:
.annotate 'line', 207
  # rx charclass s
    ge rx376_pos, rx376_eos, rx376_fail
    sub $I10, rx376_pos, rx376_off
    is_cclass $I11, 32, rx376_tgt, $I10
    unless $I11, rx376_fail
    inc rx376_pos
  # rx subrule "ws" subtype=method negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."ws"()
    unless $P10, rx376_fail
    rx376_pos = $P10."pos"()
  alt380_0:
    set_addr $I10, alt380_1
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx376_pos, rx376_eos, rx376_fail
    sub $I10, rx376_pos, rx376_off
    substr $S10, rx376_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx376_fail
  # rx subrule "block" subtype=capture negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."block"()
    unless $P10, rx376_fail
    rx376_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx376_pos = $P10."pos"()
    goto alt380_end
  alt380_1:
  # rx subrule "statement" subtype=capture negate=
    rx376_cur."!cursor_pos"(rx376_pos)
    $P10 = rx376_cur."statement"()
    unless $P10, rx376_fail
    rx376_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx376_pos = $P10."pos"()
  alt380_end:
.annotate 'line', 206
  # rx pass
    rx376_cur."!cursor_pass"(rx376_pos, "blorst")
    rx376_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx376_pos)
    .return (rx376_cur)
  rx376_fail:
.annotate 'line', 4
    (rx376_rep, rx376_pos, $I10, $P10) = rx376_cur."!mark_fail"(0)
    lt rx376_pos, -1, rx376_done
    eq rx376_pos, -1, rx376_fail
    jump $I10
  rx376_done:
    rx376_cur."!cursor_fail"()
    rx376_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx376_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1278500537.15927") :method
.annotate 'line', 4
    new $P378, "ResizablePMCArray"
    push $P378, ""
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1278500537.15927") :method
.annotate 'line', 212
    $P382 = self."!protoregex"("statement_mod_cond")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1278500537.15927") :method
.annotate 'line', 212
    $P384 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P384)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx386_tgt
    .local int rx386_pos
    .local int rx386_off
    .local int rx386_eos
    .local int rx386_rep
    .local pmc rx386_cur
    (rx386_cur, rx386_pos, rx386_tgt) = self."!cursor_start"()
    rx386_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx386_cur
    .local pmc match
    .lex "$/", match
    length rx386_eos, rx386_tgt
    gt rx386_pos, rx386_eos, rx386_done
    set rx386_off, 0
    lt rx386_pos, 2, rx386_start
    sub rx386_off, rx386_pos, 1
    substr rx386_tgt, rx386_tgt, rx386_off
  rx386_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan390_done
    goto rxscan390_scan
  rxscan390_loop:
    ($P10) = rx386_cur."from"()
    inc $P10
    set rx386_pos, $P10
    ge rx386_pos, rx386_eos, rxscan390_done
  rxscan390_scan:
    set_addr $I10, rxscan390_loop
    rx386_cur."!mark_push"(0, rx386_pos, $I10)
  rxscan390_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_391_fail
    rx386_cur."!mark_push"(0, rx386_pos, $I10)
  # rx literal  "if"
    add $I11, rx386_pos, 2
    gt $I11, rx386_eos, rx386_fail
    sub $I11, rx386_pos, rx386_off
    substr $S10, rx386_tgt, $I11, 2
    ne $S10, "if", rx386_fail
    add rx386_pos, 2
    set_addr $I10, rxcap_391_fail
    ($I12, $I11) = rx386_cur."!mark_peek"($I10)
    rx386_cur."!cursor_pos"($I11)
    ($P10) = rx386_cur."!cursor_start"()
    $P10."!cursor_pass"(rx386_pos, "")
    rx386_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_391_done
  rxcap_391_fail:
    goto rx386_fail
  rxcap_391_done:
  # rx subrule "ws" subtype=method negate=
    rx386_cur."!cursor_pos"(rx386_pos)
    $P10 = rx386_cur."ws"()
    unless $P10, rx386_fail
    rx386_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx386_cur."!cursor_pos"(rx386_pos)
    $P10 = rx386_cur."EXPR"()
    unless $P10, rx386_fail
    rx386_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx386_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx386_cur."!cursor_pos"(rx386_pos)
    $P10 = rx386_cur."ws"()
    unless $P10, rx386_fail
    rx386_pos = $P10."pos"()
  # rx pass
    rx386_cur."!cursor_pass"(rx386_pos, "statement_mod_cond:sym<if>")
    rx386_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx386_pos)
    .return (rx386_cur)
  rx386_fail:
.annotate 'line', 4
    (rx386_rep, rx386_pos, $I10, $P10) = rx386_cur."!mark_fail"(0)
    lt rx386_pos, -1, rx386_done
    eq rx386_pos, -1, rx386_fail
    jump $I10
  rx386_done:
    rx386_cur."!cursor_fail"()
    rx386_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx386_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1278500537.15927") :method
.annotate 'line', 4
    $P388 = self."!PREFIX__!subrule"("ws", "if")
    new $P389, "ResizablePMCArray"
    push $P389, $P388
    .return ($P389)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx395_cur
    .local pmc match
    .lex "$/", match
    length rx395_eos, rx395_tgt
    gt rx395_pos, rx395_eos, rx395_done
    set rx395_off, 0
    lt rx395_pos, 2, rx395_start
    sub rx395_off, rx395_pos, 1
    substr rx395_tgt, rx395_tgt, rx395_off
  rx395_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan399_done
    goto rxscan399_scan
  rxscan399_loop:
    ($P10) = rx395_cur."from"()
    inc $P10
    set rx395_pos, $P10
    ge rx395_pos, rx395_eos, rxscan399_done
  rxscan399_scan:
    set_addr $I10, rxscan399_loop
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  rxscan399_done:
.annotate 'line', 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_400_fail
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx literal  "unless"
    add $I11, rx395_pos, 6
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 6
    ne $S10, "unless", rx395_fail
    add rx395_pos, 6
    set_addr $I10, rxcap_400_fail
    ($I12, $I11) = rx395_cur."!mark_peek"($I10)
    rx395_cur."!cursor_pos"($I11)
    ($P10) = rx395_cur."!cursor_start"()
    $P10."!cursor_pass"(rx395_pos, "")
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_400_done
  rxcap_400_fail:
    goto rx395_fail
  rxcap_400_done:
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
    rx395_cur."!cursor_pass"(rx395_pos, "statement_mod_cond:sym<unless>")
    rx395_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate 'line', 4
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1278500537.15927") :method
.annotate 'line', 4
    $P397 = self."!PREFIX__!subrule"("ws", "unless")
    new $P398, "ResizablePMCArray"
    push $P398, $P397
    .return ($P398)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1278500537.15927") :method
.annotate 'line', 217
    $P404 = self."!protoregex"("statement_mod_loop")
    .return ($P404)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1278500537.15927") :method
.annotate 'line', 217
    $P406 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx408_tgt
    .local int rx408_pos
    .local int rx408_off
    .local int rx408_eos
    .local int rx408_rep
    .local pmc rx408_cur
    (rx408_cur, rx408_pos, rx408_tgt) = self."!cursor_start"()
    rx408_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx408_cur
    .local pmc match
    .lex "$/", match
    length rx408_eos, rx408_tgt
    gt rx408_pos, rx408_eos, rx408_done
    set rx408_off, 0
    lt rx408_pos, 2, rx408_start
    sub rx408_off, rx408_pos, 1
    substr rx408_tgt, rx408_tgt, rx408_off
  rx408_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan412_done
    goto rxscan412_scan
  rxscan412_loop:
    ($P10) = rx408_cur."from"()
    inc $P10
    set rx408_pos, $P10
    ge rx408_pos, rx408_eos, rxscan412_done
  rxscan412_scan:
    set_addr $I10, rxscan412_loop
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  rxscan412_done:
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_413_fail
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  # rx literal  "while"
    add $I11, rx408_pos, 5
    gt $I11, rx408_eos, rx408_fail
    sub $I11, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I11, 5
    ne $S10, "while", rx408_fail
    add rx408_pos, 5
    set_addr $I10, rxcap_413_fail
    ($I12, $I11) = rx408_cur."!mark_peek"($I10)
    rx408_cur."!cursor_pos"($I11)
    ($P10) = rx408_cur."!cursor_start"()
    $P10."!cursor_pass"(rx408_pos, "")
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_413_done
  rxcap_413_fail:
    goto rx408_fail
  rxcap_413_done:
  # rx subrule "ws" subtype=method negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."ws"()
    unless $P10, rx408_fail
    rx408_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."EXPR"()
    unless $P10, rx408_fail
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx408_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."ws"()
    unless $P10, rx408_fail
    rx408_pos = $P10."pos"()
  # rx pass
    rx408_cur."!cursor_pass"(rx408_pos, "statement_mod_loop:sym<while>")
    rx408_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx408_pos)
    .return (rx408_cur)
  rx408_fail:
.annotate 'line', 4
    (rx408_rep, rx408_pos, $I10, $P10) = rx408_cur."!mark_fail"(0)
    lt rx408_pos, -1, rx408_done
    eq rx408_pos, -1, rx408_fail
    jump $I10
  rx408_done:
    rx408_cur."!cursor_fail"()
    rx408_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx408_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1278500537.15927") :method
.annotate 'line', 4
    $P410 = self."!PREFIX__!subrule"("ws", "while")
    new $P411, "ResizablePMCArray"
    push $P411, $P410
    .return ($P411)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx417_tgt
    .local int rx417_pos
    .local int rx417_off
    .local int rx417_eos
    .local int rx417_rep
    .local pmc rx417_cur
    (rx417_cur, rx417_pos, rx417_tgt) = self."!cursor_start"()
    rx417_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx417_cur
    .local pmc match
    .lex "$/", match
    length rx417_eos, rx417_tgt
    gt rx417_pos, rx417_eos, rx417_done
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
.annotate 'line', 220
  # rx subcapture "sym"
    set_addr $I10, rxcap_422_fail
    rx417_cur."!mark_push"(0, rx417_pos, $I10)
  # rx literal  "until"
    add $I11, rx417_pos, 5
    gt $I11, rx417_eos, rx417_fail
    sub $I11, rx417_pos, rx417_off
    substr $S10, rx417_tgt, $I11, 5
    ne $S10, "until", rx417_fail
    add rx417_pos, 5
    set_addr $I10, rxcap_422_fail
    ($I12, $I11) = rx417_cur."!mark_peek"($I10)
    rx417_cur."!cursor_pos"($I11)
    ($P10) = rx417_cur."!cursor_start"()
    $P10."!cursor_pass"(rx417_pos, "")
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_422_done
  rxcap_422_fail:
    goto rx417_fail
  rxcap_422_done:
  # rx subrule "ws" subtype=method negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."ws"()
    unless $P10, rx417_fail
    rx417_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."EXPR"()
    unless $P10, rx417_fail
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx417_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."ws"()
    unless $P10, rx417_fail
    rx417_pos = $P10."pos"()
  # rx pass
    rx417_cur."!cursor_pass"(rx417_pos, "statement_mod_loop:sym<until>")
    rx417_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx417_pos)
    .return (rx417_cur)
  rx417_fail:
.annotate 'line', 4
    (rx417_rep, rx417_pos, $I10, $P10) = rx417_cur."!mark_fail"(0)
    lt rx417_pos, -1, rx417_done
    eq rx417_pos, -1, rx417_fail
    jump $I10
  rx417_done:
    rx417_cur."!cursor_fail"()
    rx417_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx417_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1278500537.15927") :method
.annotate 'line', 4
    $P419 = self."!PREFIX__!subrule"("ws", "until")
    new $P420, "ResizablePMCArray"
    push $P420, $P419
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "statement_mod_loop:sym<for>")
    .lex unicode:"$\x{a2}", rx426_cur
    .local pmc match
    .lex "$/", match
    length rx426_eos, rx426_tgt
    gt rx426_pos, rx426_eos, rx426_done
    set rx426_off, 0
    lt rx426_pos, 2, rx426_start
    sub rx426_off, rx426_pos, 1
    substr rx426_tgt, rx426_tgt, rx426_off
  rx426_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan430_done
    goto rxscan430_scan
  rxscan430_loop:
    ($P10) = rx426_cur."from"()
    inc $P10
    set rx426_pos, $P10
    ge rx426_pos, rx426_eos, rxscan430_done
  rxscan430_scan:
    set_addr $I10, rxscan430_loop
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
  rxscan430_done:
.annotate 'line', 221
  # rx subcapture "sym"
    set_addr $I10, rxcap_431_fail
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
  # rx literal  "for"
    add $I11, rx426_pos, 3
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 3
    ne $S10, "for", rx426_fail
    add rx426_pos, 3
    set_addr $I10, rxcap_431_fail
    ($I12, $I11) = rx426_cur."!mark_peek"($I10)
    rx426_cur."!cursor_pos"($I11)
    ($P10) = rx426_cur."!cursor_start"()
    $P10."!cursor_pass"(rx426_pos, "")
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_431_done
  rxcap_431_fail:
    goto rx426_fail
  rxcap_431_done:
  # rx subrule "ws" subtype=method negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."ws"()
    unless $P10, rx426_fail
    rx426_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."EXPR"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx426_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."ws"()
    unless $P10, rx426_fail
    rx426_pos = $P10."pos"()
  # rx pass
    rx426_cur."!cursor_pass"(rx426_pos, "statement_mod_loop:sym<for>")
    rx426_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<for>", " at pos=", rx426_pos)
    .return (rx426_cur)
  rx426_fail:
.annotate 'line', 4
    (rx426_rep, rx426_pos, $I10, $P10) = rx426_cur."!mark_fail"(0)
    lt rx426_pos, -1, rx426_done
    eq rx426_pos, -1, rx426_fail
    jump $I10
  rx426_done:
    rx426_cur."!cursor_fail"()
    rx426_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<for>")
    .return (rx426_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1278500537.15927") :method
.annotate 'line', 4
    $P428 = self."!PREFIX__!subrule"("ws", "for")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx435_tgt
    .local int rx435_pos
    .local int rx435_off
    .local int rx435_eos
    .local int rx435_rep
    .local pmc rx435_cur
    (rx435_cur, rx435_pos, rx435_tgt) = self."!cursor_start"()
    rx435_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
    .lex unicode:"$\x{a2}", rx435_cur
    .local pmc match
    .lex "$/", match
    length rx435_eos, rx435_tgt
    gt rx435_pos, rx435_eos, rx435_done
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
  # rx subrule "fatarrow" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."fatarrow"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx435_pos = $P10."pos"()
  # rx pass
    rx435_cur."!cursor_pass"(rx435_pos, "term:sym<fatarrow>")
    rx435_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx435_pos)
    .return (rx435_cur)
  rx435_fail:
.annotate 'line', 4
    (rx435_rep, rx435_pos, $I10, $P10) = rx435_cur."!mark_fail"(0)
    lt rx435_pos, -1, rx435_done
    eq rx435_pos, -1, rx435_fail
    jump $I10
  rx435_done:
    rx435_cur."!cursor_fail"()
    rx435_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx435_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1278500537.15927") :method
.annotate 'line', 4
    $P437 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P438, "ResizablePMCArray"
    push $P438, $P437
    .return ($P438)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx441_tgt
    .local int rx441_pos
    .local int rx441_off
    .local int rx441_eos
    .local int rx441_rep
    .local pmc rx441_cur
    (rx441_cur, rx441_pos, rx441_tgt) = self."!cursor_start"()
    rx441_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx441_cur
    .local pmc match
    .lex "$/", match
    length rx441_eos, rx441_tgt
    gt rx441_pos, rx441_eos, rx441_done
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
  # rx subrule "colonpair" subtype=capture negate=
    rx441_cur."!cursor_pos"(rx441_pos)
    $P10 = rx441_cur."colonpair"()
    unless $P10, rx441_fail
    rx441_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx441_pos = $P10."pos"()
  # rx pass
    rx441_cur."!cursor_pass"(rx441_pos, "term:sym<colonpair>")
    rx441_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx441_pos)
    .return (rx441_cur)
  rx441_fail:
.annotate 'line', 4
    (rx441_rep, rx441_pos, $I10, $P10) = rx441_cur."!mark_fail"(0)
    lt rx441_pos, -1, rx441_done
    eq rx441_pos, -1, rx441_fail
    jump $I10
  rx441_done:
    rx441_cur."!cursor_fail"()
    rx441_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx441_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1278500537.15927") :method
.annotate 'line', 4
    $P443 = self."!PREFIX__!subrule"("colonpair", "")
    new $P444, "ResizablePMCArray"
    push $P444, $P443
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx447_cur
    .local pmc match
    .lex "$/", match
    length rx447_eos, rx447_tgt
    gt rx447_pos, rx447_eos, rx447_done
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
  # rx subrule "variable" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."variable"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx447_pos = $P10."pos"()
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "term:sym<variable>")
    rx447_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate 'line', 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("104_1278500537.15927") :method
.annotate 'line', 4
    $P449 = self."!PREFIX__!subrule"("variable", "")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx453_cur
    .local pmc match
    .lex "$/", match
    length rx453_eos, rx453_tgt
    gt rx453_pos, rx453_eos, rx453_done
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
  # rx subrule "package_declarator" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."package_declarator"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx453_pos = $P10."pos"()
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "term:sym<package_declarator>")
    rx453_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate 'line', 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1278500537.15927") :method
.annotate 'line', 4
    $P455 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    gt rx459_pos, rx459_eos, rx459_done
    set rx459_off, 0
    lt rx459_pos, 2, rx459_start
    sub rx459_off, rx459_pos, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan463_done
    goto rxscan463_scan
  rxscan463_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan463_done
  rxscan463_scan:
    set_addr $I10, rxscan463_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan463_done:
.annotate 'line', 229
  # rx subrule "scope_declarator" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."scope_declarator"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx459_pos = $P10."pos"()
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "term:sym<scope_declarator>")
    rx459_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate 'line', 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1278500537.15927") :method
.annotate 'line', 4
    $P461 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P462, "ResizablePMCArray"
    push $P462, $P461
    .return ($P462)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    (rx465_cur, rx465_pos, rx465_tgt) = self."!cursor_start"()
    rx465_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx465_cur
    .local pmc match
    .lex "$/", match
    length rx465_eos, rx465_tgt
    gt rx465_pos, rx465_eos, rx465_done
    set rx465_off, 0
    lt rx465_pos, 2, rx465_start
    sub rx465_off, rx465_pos, 1
    substr rx465_tgt, rx465_tgt, rx465_off
  rx465_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan469_done
    goto rxscan469_scan
  rxscan469_loop:
    ($P10) = rx465_cur."from"()
    inc $P10
    set rx465_pos, $P10
    ge rx465_pos, rx465_eos, rxscan469_done
  rxscan469_scan:
    set_addr $I10, rxscan469_loop
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  rxscan469_done:
.annotate 'line', 230
  # rx subrule "routine_declarator" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."routine_declarator"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx465_pos = $P10."pos"()
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "term:sym<routine_declarator>")
    rx465_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx465_pos)
    .return (rx465_cur)
  rx465_fail:
.annotate 'line', 4
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    rx465_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx465_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1278500537.15927") :method
.annotate 'line', 4
    $P467 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P468, "ResizablePMCArray"
    push $P468, $P467
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P476 = "113_1278500537.15927" 
    capture_lex $P476
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "term:sym<multi_declarator>")
    .lex unicode:"$\x{a2}", rx471_cur
    .local pmc match
    .lex "$/", match
    length rx471_eos, rx471_tgt
    gt rx471_pos, rx471_eos, rx471_done
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
.annotate 'line', 231
  # rx subrule "before" subtype=zerowidth negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    .const 'Sub' $P476 = "113_1278500537.15927" 
    capture_lex $P476
    $P10 = rx471_cur."before"($P476)
    unless $P10, rx471_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."multi_declarator"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx471_pos = $P10."pos"()
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "term:sym<multi_declarator>")
    rx471_cur."!cursor_debug"("PASS  ", "term:sym<multi_declarator>", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
.annotate 'line', 4
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "term:sym<multi_declarator>")
    .return (rx471_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1278500537.15927") :method
.annotate 'line', 4
    new $P473, "ResizablePMCArray"
    push $P473, ""
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "_block475"  :anon :subid("113_1278500537.15927") :method :outer("111_1278500537.15927")
.annotate 'line', 231
    .local string rx477_tgt
    .local int rx477_pos
    .local int rx477_off
    .local int rx477_eos
    .local int rx477_rep
    .local pmc rx477_cur
    (rx477_cur, rx477_pos, rx477_tgt) = self."!cursor_start"()
    rx477_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx477_cur
    .local pmc match
    .lex "$/", match
    length rx477_eos, rx477_tgt
    gt rx477_pos, rx477_eos, rx477_done
    set rx477_off, 0
    lt rx477_pos, 2, rx477_start
    sub rx477_off, rx477_pos, 1
    substr rx477_tgt, rx477_tgt, rx477_off
  rx477_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx477_cur."from"()
    inc $P10
    set rx477_pos, $P10
    ge rx477_pos, rx477_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  rxscan478_done:
  alt479_0:
    set_addr $I10, alt479_1
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  # rx literal  "multi"
    add $I11, rx477_pos, 5
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 5
    ne $S10, "multi", rx477_fail
    add rx477_pos, 5
    goto alt479_end
  alt479_1:
    set_addr $I10, alt479_2
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  # rx literal  "proto"
    add $I11, rx477_pos, 5
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 5
    ne $S10, "proto", rx477_fail
    add rx477_pos, 5
    goto alt479_end
  alt479_2:
  # rx literal  "only"
    add $I11, rx477_pos, 4
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 4
    ne $S10, "only", rx477_fail
    add rx477_pos, 4
  alt479_end:
  # rx pass
    rx477_cur."!cursor_pass"(rx477_pos, "")
    rx477_cur."!cursor_debug"("PASS  ", "", " at pos=", rx477_pos)
    .return (rx477_cur)
  rx477_fail:
    (rx477_rep, rx477_pos, $I10, $P10) = rx477_cur."!mark_fail"(0)
    lt rx477_pos, -1, rx477_done
    eq rx477_pos, -1, rx477_fail
    jump $I10
  rx477_done:
    rx477_cur."!cursor_fail"()
    rx477_cur."!cursor_debug"("FAIL  ", "")
    .return (rx477_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("114_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    (rx481_cur, rx481_pos, rx481_tgt) = self."!cursor_start"()
    rx481_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
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
.annotate 'line', 232
  # rx subrule "regex_declarator" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."regex_declarator"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx481_pos = $P10."pos"()
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "term:sym<regex_declarator>")
    rx481_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx481_pos)
    .return (rx481_cur)
  rx481_fail:
.annotate 'line', 4
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    rx481_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx481_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1278500537.15927") :method
.annotate 'line', 4
    $P483 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P484, "ResizablePMCArray"
    push $P484, $P483
    .return ($P484)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx487_tgt
    .local int rx487_pos
    .local int rx487_off
    .local int rx487_eos
    .local int rx487_rep
    .local pmc rx487_cur
    (rx487_cur, rx487_pos, rx487_tgt) = self."!cursor_start"()
    rx487_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
.annotate 'line', 233
  # rx subrule "statement_prefix" subtype=capture negate=
    rx487_cur."!cursor_pos"(rx487_pos)
    $P10 = rx487_cur."statement_prefix"()
    unless $P10, rx487_fail
    rx487_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx487_pos = $P10."pos"()
  # rx pass
    rx487_cur."!cursor_pass"(rx487_pos, "term:sym<statement_prefix>")
    rx487_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx487_pos)
    .return (rx487_cur)
  rx487_fail:
.annotate 'line', 4
    (rx487_rep, rx487_pos, $I10, $P10) = rx487_cur."!mark_fail"(0)
    lt rx487_pos, -1, rx487_done
    eq rx487_pos, -1, rx487_fail
    jump $I10
  rx487_done:
    rx487_cur."!cursor_fail"()
    rx487_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx487_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1278500537.15927") :method
.annotate 'line', 4
    $P489 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P490, "ResizablePMCArray"
    push $P490, $P489
    .return ($P490)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx493_tgt
    .local int rx493_pos
    .local int rx493_off
    .local int rx493_eos
    .local int rx493_rep
    .local pmc rx493_cur
    (rx493_cur, rx493_pos, rx493_tgt) = self."!cursor_start"()
    rx493_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx493_cur
    .local pmc match
    .lex "$/", match
    length rx493_eos, rx493_tgt
    gt rx493_pos, rx493_eos, rx493_done
    set rx493_off, 0
    lt rx493_pos, 2, rx493_start
    sub rx493_off, rx493_pos, 1
    substr rx493_tgt, rx493_tgt, rx493_off
  rx493_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan496_done
    goto rxscan496_scan
  rxscan496_loop:
    ($P10) = rx493_cur."from"()
    inc $P10
    set rx493_pos, $P10
    ge rx493_pos, rx493_eos, rxscan496_done
  rxscan496_scan:
    set_addr $I10, rxscan496_loop
    rx493_cur."!mark_push"(0, rx493_pos, $I10)
  rxscan496_done:
.annotate 'line', 234
  # rx subrule "lambda" subtype=zerowidth negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."lambda"()
    unless $P10, rx493_fail
  # rx subrule "pblock" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."pblock"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx493_pos = $P10."pos"()
  # rx pass
    rx493_cur."!cursor_pass"(rx493_pos, "term:sym<lambda>")
    rx493_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx493_pos)
    .return (rx493_cur)
  rx493_fail:
.annotate 'line', 4
    (rx493_rep, rx493_pos, $I10, $P10) = rx493_cur."!mark_fail"(0)
    lt rx493_pos, -1, rx493_done
    eq rx493_pos, -1, rx493_fail
    jump $I10
  rx493_done:
    rx493_cur."!cursor_fail"()
    rx493_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx493_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1278500537.15927") :method
.annotate 'line', 4
    new $P495, "ResizablePMCArray"
    push $P495, ""
    .return ($P495)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx498_tgt
    .local int rx498_pos
    .local int rx498_off
    .local int rx498_eos
    .local int rx498_rep
    .local pmc rx498_cur
    (rx498_cur, rx498_pos, rx498_tgt) = self."!cursor_start"()
    rx498_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx498_cur
    .local pmc match
    .lex "$/", match
    length rx498_eos, rx498_tgt
    gt rx498_pos, rx498_eos, rx498_done
    set rx498_off, 0
    lt rx498_pos, 2, rx498_start
    sub rx498_off, rx498_pos, 1
    substr rx498_tgt, rx498_tgt, rx498_off
  rx498_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan502_done
    goto rxscan502_scan
  rxscan502_loop:
    ($P10) = rx498_cur."from"()
    inc $P10
    set rx498_pos, $P10
    ge rx498_pos, rx498_eos, rxscan502_done
  rxscan502_scan:
    set_addr $I10, rxscan502_loop
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  rxscan502_done:
.annotate 'line', 237
  # rx subrule "identifier" subtype=capture negate=
    rx498_cur."!cursor_pos"(rx498_pos)
    $P10 = rx498_cur."identifier"()
    unless $P10, rx498_fail
    rx498_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx498_pos = $P10."pos"()
  # rx rxquantr503 ** 0..*
    set_addr $I504, rxquantr503_done
    rx498_cur."!mark_push"(0, rx498_pos, $I504)
  rxquantr503_loop:
  # rx enumcharlist negate=0 
    ge rx498_pos, rx498_eos, rx498_fail
    sub $I10, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx498_fail
    inc rx498_pos
    (rx498_rep) = rx498_cur."!mark_commit"($I504)
    rx498_cur."!mark_push"(rx498_rep, rx498_pos, $I504)
    goto rxquantr503_loop
  rxquantr503_done:
  # rx literal  "=>"
    add $I11, rx498_pos, 2
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 2
    ne $S10, "=>", rx498_fail
    add rx498_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx498_cur."!cursor_pos"(rx498_pos)
    $P10 = rx498_cur."ws"()
    unless $P10, rx498_fail
    rx498_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx498_cur."!cursor_pos"(rx498_pos)
    $P10 = rx498_cur."EXPR"("i=")
    unless $P10, rx498_fail
    rx498_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx498_pos = $P10."pos"()
.annotate 'line', 236
  # rx pass
    rx498_cur."!cursor_pass"(rx498_pos, "fatarrow")
    rx498_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx498_pos)
    .return (rx498_cur)
  rx498_fail:
.annotate 'line', 4
    (rx498_rep, rx498_pos, $I10, $P10) = rx498_cur."!mark_fail"(0)
    lt rx498_pos, -1, rx498_done
    eq rx498_pos, -1, rx498_fail
    jump $I10
  rx498_done:
    rx498_cur."!cursor_fail"()
    rx498_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx498_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("121_1278500537.15927") :method
.annotate 'line', 4
    $P500 = self."!PREFIX__!subrule"("identifier", "")
    new $P501, "ResizablePMCArray"
    push $P501, $P500
    .return ($P501)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt) = self."!cursor_start"()
    rx506_cur."!cursor_debug"("START ", "colonpair")
    rx506_cur."!cursor_caparray"("circumfix")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan512_done
    goto rxscan512_scan
  rxscan512_loop:
    ($P10) = rx506_cur."from"()
    inc $P10
    set rx506_pos, $P10
    ge rx506_pos, rx506_eos, rxscan512_done
  rxscan512_scan:
    set_addr $I10, rxscan512_loop
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxscan512_done:
.annotate 'line', 241
  # rx literal  ":"
    add $I11, rx506_pos, 1
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 1
    ne $S10, ":", rx506_fail
    add rx506_pos, 1
  alt513_0:
.annotate 'line', 242
    set_addr $I10, alt513_1
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
.annotate 'line', 243
  # rx subcapture "not"
    set_addr $I10, rxcap_514_fail
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  # rx literal  "!"
    add $I11, rx506_pos, 1
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 1
    ne $S10, "!", rx506_fail
    add rx506_pos, 1
    set_addr $I10, rxcap_514_fail
    ($I12, $I11) = rx506_cur."!mark_peek"($I10)
    rx506_cur."!cursor_pos"($I11)
    ($P10) = rx506_cur."!cursor_start"()
    $P10."!cursor_pass"(rx506_pos, "")
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_514_done
  rxcap_514_fail:
    goto rx506_fail
  rxcap_514_done:
  # rx subrule "identifier" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."identifier"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx506_pos = $P10."pos"()
    goto alt513_end
  alt513_1:
    set_addr $I10, alt513_2
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
.annotate 'line', 244
  # rx subrule "identifier" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."identifier"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx506_pos = $P10."pos"()
  # rx rxquantr515 ** 0..1
    set_addr $I516, rxquantr515_done
    rx506_cur."!mark_push"(0, rx506_pos, $I516)
  rxquantr515_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."circumfix"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx506_pos = $P10."pos"()
    (rx506_rep) = rx506_cur."!mark_commit"($I516)
  rxquantr515_done:
    goto alt513_end
  alt513_2:
.annotate 'line', 245
  # rx subrule "circumfix" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."circumfix"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx506_pos = $P10."pos"()
  alt513_end:
.annotate 'line', 240
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "colonpair")
    rx506_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_fail:
.annotate 'line', 4
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("123_1278500537.15927") :method
.annotate 'line', 4
    $P508 = self."!PREFIX__!subrule"("circumfix", ":")
    $P509 = self."!PREFIX__!subrule"("identifier", ":")
    $P510 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P511, "ResizablePMCArray"
    push $P511, $P508
    push $P511, $P509
    push $P511, $P510
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("124_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "variable")
    rx518_cur."!cursor_caparray"("twigil")
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
    ne $I10, -1, rxscan523_done
    goto rxscan523_scan
  rxscan523_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan523_done
  rxscan523_scan:
    set_addr $I10, rxscan523_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan523_done:
  alt524_0:
.annotate 'line', 249
    set_addr $I10, alt524_1
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."sigil"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx518_pos = $P10."pos"()
  # rx rxquantr525 ** 0..1
    set_addr $I526, rxquantr525_done
    rx518_cur."!mark_push"(0, rx518_pos, $I526)
  rxquantr525_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."twigil"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx518_pos = $P10."pos"()
    (rx518_rep) = rx518_cur."!mark_commit"($I526)
  rxquantr525_done:
  # rx subrule "name" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."name"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx518_pos = $P10."pos"()
    goto alt524_end
  alt524_1:
    set_addr $I10, alt524_2
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 251
  # rx subrule "sigil" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."sigil"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx518_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx518_pos, rx518_eos, rx518_fail
    sub $I10, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx518_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."postcircumfix"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx518_pos = $P10."pos"()
    goto alt524_end
  alt524_2:
.annotate 'line', 252
  # rx subcapture "sigil"
    set_addr $I10, rxcap_527_fail
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  # rx literal  "$"
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I11, 1
    ne $S10, "$", rx518_fail
    add rx518_pos, 1
    set_addr $I10, rxcap_527_fail
    ($I12, $I11) = rx518_cur."!mark_peek"($I10)
    rx518_cur."!cursor_pos"($I11)
    ($P10) = rx518_cur."!cursor_start"()
    $P10."!cursor_pass"(rx518_pos, "")
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_527_done
  rxcap_527_fail:
    goto rx518_fail
  rxcap_527_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_528_fail
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx518_pos, rx518_eos, rx518_fail
    sub $I10, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx518_fail
    inc rx518_pos
    set_addr $I10, rxcap_528_fail
    ($I12, $I11) = rx518_cur."!mark_peek"($I10)
    rx518_cur."!cursor_pos"($I11)
    ($P10) = rx518_cur."!cursor_start"()
    $P10."!cursor_pass"(rx518_pos, "")
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_528_done
  rxcap_528_fail:
    goto rx518_fail
  rxcap_528_done:
  alt524_end:
.annotate 'line', 249
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "variable")
    rx518_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
.annotate 'line', 4
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx518_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("125_1278500537.15927") :method
.annotate 'line', 4
    $P520 = self."!PREFIX__!subrule"("sigil", "")
    $P521 = self."!PREFIX__!subrule"("sigil", "")
    new $P522, "ResizablePMCArray"
    push $P522, "$!"
    push $P522, "$_"
    push $P522, "$/"
    push $P522, $P520
    push $P522, $P521
    .return ($P522)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("126_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx530_tgt
    .local int rx530_pos
    .local int rx530_off
    .local int rx530_eos
    .local int rx530_rep
    .local pmc rx530_cur
    (rx530_cur, rx530_pos, rx530_tgt) = self."!cursor_start"()
    rx530_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx530_cur
    .local pmc match
    .lex "$/", match
    length rx530_eos, rx530_tgt
    gt rx530_pos, rx530_eos, rx530_done
    set rx530_off, 0
    lt rx530_pos, 2, rx530_start
    sub rx530_off, rx530_pos, 1
    substr rx530_tgt, rx530_tgt, rx530_off
  rx530_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan533_done
    goto rxscan533_scan
  rxscan533_loop:
    ($P10) = rx530_cur."from"()
    inc $P10
    set rx530_pos, $P10
    ge rx530_pos, rx530_eos, rxscan533_done
  rxscan533_scan:
    set_addr $I10, rxscan533_loop
    rx530_cur."!mark_push"(0, rx530_pos, $I10)
  rxscan533_done:
.annotate 'line', 255
  # rx enumcharlist negate=0 
    ge rx530_pos, rx530_eos, rx530_fail
    sub $I10, rx530_pos, rx530_off
    substr $S10, rx530_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx530_fail
    inc rx530_pos
  # rx pass
    rx530_cur."!cursor_pass"(rx530_pos, "sigil")
    rx530_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx530_pos)
    .return (rx530_cur)
  rx530_fail:
.annotate 'line', 4
    (rx530_rep, rx530_pos, $I10, $P10) = rx530_cur."!mark_fail"(0)
    lt rx530_pos, -1, rx530_done
    eq rx530_pos, -1, rx530_fail
    jump $I10
  rx530_done:
    rx530_cur."!cursor_fail"()
    rx530_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx530_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("127_1278500537.15927") :method
.annotate 'line', 4
    new $P532, "ResizablePMCArray"
    push $P532, "&"
    push $P532, "%"
    push $P532, "@"
    push $P532, "$"
    .return ($P532)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx535_cur
    .local pmc match
    .lex "$/", match
    length rx535_eos, rx535_tgt
    gt rx535_pos, rx535_eos, rx535_done
    set rx535_off, 0
    lt rx535_pos, 2, rx535_start
    sub rx535_off, rx535_pos, 1
    substr rx535_tgt, rx535_tgt, rx535_off
  rx535_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan538_done
    goto rxscan538_scan
  rxscan538_loop:
    ($P10) = rx535_cur."from"()
    inc $P10
    set rx535_pos, $P10
    ge rx535_pos, rx535_eos, rxscan538_done
  rxscan538_scan:
    set_addr $I10, rxscan538_loop
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  rxscan538_done:
.annotate 'line', 257
  # rx enumcharlist negate=0 
    ge rx535_pos, rx535_eos, rx535_fail
    sub $I10, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx535_fail
    inc rx535_pos
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "twigil")
    rx535_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate 'line', 4
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx535_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("129_1278500537.15927") :method
.annotate 'line', 4
    new $P537, "ResizablePMCArray"
    push $P537, "?"
    push $P537, "!"
    push $P537, "*"
    .return ($P537)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1278500537.15927") :method
.annotate 'line', 259
    $P540 = self."!protoregex"("package_declarator")
    .return ($P540)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1278500537.15927") :method
.annotate 'line', 259
    $P542 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P542)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx544_tgt
    .local int rx544_pos
    .local int rx544_off
    .local int rx544_eos
    .local int rx544_rep
    .local pmc rx544_cur
    (rx544_cur, rx544_pos, rx544_tgt) = self."!cursor_start"()
    rx544_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx544_cur
    .local pmc match
    .lex "$/", match
    length rx544_eos, rx544_tgt
    gt rx544_pos, rx544_eos, rx544_done
    set rx544_off, 0
    lt rx544_pos, 2, rx544_start
    sub rx544_off, rx544_pos, 1
    substr rx544_tgt, rx544_tgt, rx544_off
  rx544_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan548_done
    goto rxscan548_scan
  rxscan548_loop:
    ($P10) = rx544_cur."from"()
    inc $P10
    set rx544_pos, $P10
    ge rx544_pos, rx544_eos, rxscan548_done
  rxscan548_scan:
    set_addr $I10, rxscan548_loop
    rx544_cur."!mark_push"(0, rx544_pos, $I10)
  rxscan548_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_549_fail
    rx544_cur."!mark_push"(0, rx544_pos, $I10)
  # rx literal  "module"
    add $I11, rx544_pos, 6
    gt $I11, rx544_eos, rx544_fail
    sub $I11, rx544_pos, rx544_off
    substr $S10, rx544_tgt, $I11, 6
    ne $S10, "module", rx544_fail
    add rx544_pos, 6
    set_addr $I10, rxcap_549_fail
    ($I12, $I11) = rx544_cur."!mark_peek"($I10)
    rx544_cur."!cursor_pos"($I11)
    ($P10) = rx544_cur."!cursor_start"()
    $P10."!cursor_pass"(rx544_pos, "")
    rx544_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_549_done
  rxcap_549_fail:
    goto rx544_fail
  rxcap_549_done:
  # rx subrule "package_def" subtype=capture negate=
    rx544_cur."!cursor_pos"(rx544_pos)
    $P10 = rx544_cur."package_def"()
    unless $P10, rx544_fail
    rx544_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx544_pos = $P10."pos"()
  # rx pass
    rx544_cur."!cursor_pass"(rx544_pos, "package_declarator:sym<module>")
    rx544_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx544_pos)
    .return (rx544_cur)
  rx544_fail:
.annotate 'line', 4
    (rx544_rep, rx544_pos, $I10, $P10) = rx544_cur."!mark_fail"(0)
    lt rx544_pos, -1, rx544_done
    eq rx544_pos, -1, rx544_fail
    jump $I10
  rx544_done:
    rx544_cur."!cursor_fail"()
    rx544_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx544_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1278500537.15927") :method
.annotate 'line', 4
    $P546 = self."!PREFIX__!subrule"("package_def", "module")
    new $P547, "ResizablePMCArray"
    push $P547, $P546
    .return ($P547)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx551_tgt
    .local int rx551_pos
    .local int rx551_off
    .local int rx551_eos
    .local int rx551_rep
    .local pmc rx551_cur
    (rx551_cur, rx551_pos, rx551_tgt) = self."!cursor_start"()
    rx551_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx551_cur
    .local pmc match
    .lex "$/", match
    length rx551_eos, rx551_tgt
    gt rx551_pos, rx551_eos, rx551_done
    set rx551_off, 0
    lt rx551_pos, 2, rx551_start
    sub rx551_off, rx551_pos, 1
    substr rx551_tgt, rx551_tgt, rx551_off
  rx551_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan556_done
    goto rxscan556_scan
  rxscan556_loop:
    ($P10) = rx551_cur."from"()
    inc $P10
    set rx551_pos, $P10
    ge rx551_pos, rx551_eos, rxscan556_done
  rxscan556_scan:
    set_addr $I10, rxscan556_loop
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  rxscan556_done:
.annotate 'line', 261
  # rx subcapture "sym"
    set_addr $I10, rxcap_558_fail
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  alt557_0:
    set_addr $I10, alt557_1
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  # rx literal  "class"
    add $I11, rx551_pos, 5
    gt $I11, rx551_eos, rx551_fail
    sub $I11, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I11, 5
    ne $S10, "class", rx551_fail
    add rx551_pos, 5
    goto alt557_end
  alt557_1:
  # rx literal  "grammar"
    add $I11, rx551_pos, 7
    gt $I11, rx551_eos, rx551_fail
    sub $I11, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I11, 7
    ne $S10, "grammar", rx551_fail
    add rx551_pos, 7
  alt557_end:
    set_addr $I10, rxcap_558_fail
    ($I12, $I11) = rx551_cur."!mark_peek"($I10)
    rx551_cur."!cursor_pos"($I11)
    ($P10) = rx551_cur."!cursor_start"()
    $P10."!cursor_pass"(rx551_pos, "")
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_558_done
  rxcap_558_fail:
    goto rx551_fail
  rxcap_558_done:
  # rx subrule "package_def" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."package_def"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx551_pos = $P10."pos"()
  # rx pass
    rx551_cur."!cursor_pass"(rx551_pos, "package_declarator:sym<class>")
    rx551_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx551_pos)
    .return (rx551_cur)
  rx551_fail:
.annotate 'line', 4
    (rx551_rep, rx551_pos, $I10, $P10) = rx551_cur."!mark_fail"(0)
    lt rx551_pos, -1, rx551_done
    eq rx551_pos, -1, rx551_fail
    jump $I10
  rx551_done:
    rx551_cur."!cursor_fail"()
    rx551_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx551_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1278500537.15927") :method
.annotate 'line', 4
    $P553 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P554 = self."!PREFIX__!subrule"("package_def", "class")
    new $P555, "ResizablePMCArray"
    push $P555, $P553
    push $P555, $P554
    .return ($P555)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "package_def")
    rx560_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    gt rx560_pos, rx560_eos, rx560_done
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
.annotate 'line', 263
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
.annotate 'line', 264
  # rx subrule "name" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."name"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
.annotate 'line', 265
  # rx rxquantr567 ** 0..1
    set_addr $I571, rxquantr567_done
    rx560_cur."!mark_push"(0, rx560_pos, $I571)
  rxquantr567_loop:
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx560_pos, 2
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 2
    ne $S10, "is", rx560_fail
    add rx560_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."name"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
    (rx560_rep) = rx560_cur."!mark_commit"($I571)
  rxquantr567_done:
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  alt573_0:
.annotate 'line', 266
    set_addr $I10, alt573_1
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx560_pos, 1
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 1
    ne $S10, ";", rx560_fail
    add rx560_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."comp_unit"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
    goto alt573_end
  alt573_1:
    set_addr $I10, alt573_2
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx560_pos, rx560_eos, rx560_fail
    sub $I10, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx560_fail
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."block"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
    goto alt573_end
  alt573_2:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."panic"("Malformed package declaration")
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  alt573_end:
.annotate 'line', 270
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
.annotate 'line', 263
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "package_def")
    rx560_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate 'line', 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("137_1278500537.15927") :method
.annotate 'line', 4
    $P562 = self."!PREFIX__!subrule"("ws", "")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1278500537.15927") :method
.annotate 'line', 273
    $P584 = self."!protoregex"("scope_declarator")
    .return ($P584)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1278500537.15927") :method
.annotate 'line', 273
    $P586 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P586)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx588_tgt
    .local int rx588_pos
    .local int rx588_off
    .local int rx588_eos
    .local int rx588_rep
    .local pmc rx588_cur
    (rx588_cur, rx588_pos, rx588_tgt) = self."!cursor_start"()
    rx588_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx588_cur
    .local pmc match
    .lex "$/", match
    length rx588_eos, rx588_tgt
    gt rx588_pos, rx588_eos, rx588_done
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
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_593_fail
    rx588_cur."!mark_push"(0, rx588_pos, $I10)
  # rx literal  "my"
    add $I11, rx588_pos, 2
    gt $I11, rx588_eos, rx588_fail
    sub $I11, rx588_pos, rx588_off
    substr $S10, rx588_tgt, $I11, 2
    ne $S10, "my", rx588_fail
    add rx588_pos, 2
    set_addr $I10, rxcap_593_fail
    ($I12, $I11) = rx588_cur."!mark_peek"($I10)
    rx588_cur."!cursor_pos"($I11)
    ($P10) = rx588_cur."!cursor_start"()
    $P10."!cursor_pass"(rx588_pos, "")
    rx588_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_593_done
  rxcap_593_fail:
    goto rx588_fail
  rxcap_593_done:
  # rx subrule "scoped" subtype=capture negate=
    rx588_cur."!cursor_pos"(rx588_pos)
    $P10 = rx588_cur."scoped"("my")
    unless $P10, rx588_fail
    rx588_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx588_pos = $P10."pos"()
  # rx pass
    rx588_cur."!cursor_pass"(rx588_pos, "scope_declarator:sym<my>")
    rx588_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx588_pos)
    .return (rx588_cur)
  rx588_fail:
.annotate 'line', 4
    (rx588_rep, rx588_pos, $I10, $P10) = rx588_cur."!mark_fail"(0)
    lt rx588_pos, -1, rx588_done
    eq rx588_pos, -1, rx588_fail
    jump $I10
  rx588_done:
    rx588_cur."!cursor_fail"()
    rx588_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx588_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1278500537.15927") :method
.annotate 'line', 4
    $P590 = self."!PREFIX__!subrule"("scoped", "my")
    new $P591, "ResizablePMCArray"
    push $P591, $P590
    .return ($P591)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx595_tgt
    .local int rx595_pos
    .local int rx595_off
    .local int rx595_eos
    .local int rx595_rep
    .local pmc rx595_cur
    (rx595_cur, rx595_pos, rx595_tgt) = self."!cursor_start"()
    rx595_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx595_cur
    .local pmc match
    .lex "$/", match
    length rx595_eos, rx595_tgt
    gt rx595_pos, rx595_eos, rx595_done
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
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_600_fail
    rx595_cur."!mark_push"(0, rx595_pos, $I10)
  # rx literal  "our"
    add $I11, rx595_pos, 3
    gt $I11, rx595_eos, rx595_fail
    sub $I11, rx595_pos, rx595_off
    substr $S10, rx595_tgt, $I11, 3
    ne $S10, "our", rx595_fail
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
  # rx subrule "scoped" subtype=capture negate=
    rx595_cur."!cursor_pos"(rx595_pos)
    $P10 = rx595_cur."scoped"("our")
    unless $P10, rx595_fail
    rx595_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx595_pos = $P10."pos"()
  # rx pass
    rx595_cur."!cursor_pass"(rx595_pos, "scope_declarator:sym<our>")
    rx595_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx595_pos)
    .return (rx595_cur)
  rx595_fail:
.annotate 'line', 4
    (rx595_rep, rx595_pos, $I10, $P10) = rx595_cur."!mark_fail"(0)
    lt rx595_pos, -1, rx595_done
    eq rx595_pos, -1, rx595_fail
    jump $I10
  rx595_done:
    rx595_cur."!cursor_fail"()
    rx595_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx595_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1278500537.15927") :method
.annotate 'line', 4
    $P597 = self."!PREFIX__!subrule"("scoped", "our")
    new $P598, "ResizablePMCArray"
    push $P598, $P597
    .return ($P598)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx602_tgt
    .local int rx602_pos
    .local int rx602_off
    .local int rx602_eos
    .local int rx602_rep
    .local pmc rx602_cur
    (rx602_cur, rx602_pos, rx602_tgt) = self."!cursor_start"()
    rx602_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
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
.annotate 'line', 276
  # rx subcapture "sym"
    set_addr $I10, rxcap_607_fail
    rx602_cur."!mark_push"(0, rx602_pos, $I10)
  # rx literal  "has"
    add $I11, rx602_pos, 3
    gt $I11, rx602_eos, rx602_fail
    sub $I11, rx602_pos, rx602_off
    substr $S10, rx602_tgt, $I11, 3
    ne $S10, "has", rx602_fail
    add rx602_pos, 3
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
  # rx subrule "scoped" subtype=capture negate=
    rx602_cur."!cursor_pos"(rx602_pos)
    $P10 = rx602_cur."scoped"("has")
    unless $P10, rx602_fail
    rx602_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx602_pos = $P10."pos"()
  # rx pass
    rx602_cur."!cursor_pass"(rx602_pos, "scope_declarator:sym<has>")
    rx602_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx602_pos)
    .return (rx602_cur)
  rx602_fail:
.annotate 'line', 4
    (rx602_rep, rx602_pos, $I10, $P10) = rx602_cur."!mark_fail"(0)
    lt rx602_pos, -1, rx602_done
    eq rx602_pos, -1, rx602_fail
    jump $I10
  rx602_done:
    rx602_cur."!cursor_fail"()
    rx602_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx602_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1278500537.15927") :method
.annotate 'line', 4
    $P604 = self."!PREFIX__!subrule"("scoped", "has")
    new $P605, "ResizablePMCArray"
    push $P605, $P604
    .return ($P605)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1278500537.15927") :method :outer("11_1278500537.15927")
    .param pmc param_609
.annotate 'line', 278
    .lex "$*SCOPE", param_609
.annotate 'line', 4
    .local string rx610_tgt
    .local int rx610_pos
    .local int rx610_off
    .local int rx610_eos
    .local int rx610_rep
    .local pmc rx610_cur
    (rx610_cur, rx610_pos, rx610_tgt) = self."!cursor_start"()
    rx610_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx610_cur
    .local pmc match
    .lex "$/", match
    length rx610_eos, rx610_tgt
    gt rx610_pos, rx610_eos, rx610_done
    set rx610_off, 0
    lt rx610_pos, 2, rx610_start
    sub rx610_off, rx610_pos, 1
    substr rx610_tgt, rx610_tgt, rx610_off
  rx610_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan615_done
    goto rxscan615_scan
  rxscan615_loop:
    ($P10) = rx610_cur."from"()
    inc $P10
    set rx610_pos, $P10
    ge rx610_pos, rx610_eos, rxscan615_done
  rxscan615_scan:
    set_addr $I10, rxscan615_loop
    rx610_cur."!mark_push"(0, rx610_pos, $I10)
  rxscan615_done:
  alt616_0:
.annotate 'line', 278
    set_addr $I10, alt616_1
    rx610_cur."!mark_push"(0, rx610_pos, $I10)
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."ws"()
    unless $P10, rx610_fail
    rx610_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."declarator"()
    unless $P10, rx610_fail
    rx610_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx610_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."ws"()
    unless $P10, rx610_fail
    rx610_pos = $P10."pos"()
    goto alt616_end
  alt616_1:
.annotate 'line', 280
  # rx subrule "ws" subtype=method negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."ws"()
    unless $P10, rx610_fail
    rx610_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."multi_declarator"()
    unless $P10, rx610_fail
    rx610_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx610_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx610_cur."!cursor_pos"(rx610_pos)
    $P10 = rx610_cur."ws"()
    unless $P10, rx610_fail
    rx610_pos = $P10."pos"()
  alt616_end:
.annotate 'line', 278
  # rx pass
    rx610_cur."!cursor_pass"(rx610_pos, "scoped")
    rx610_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx610_pos)
    .return (rx610_cur)
  rx610_fail:
.annotate 'line', 4
    (rx610_rep, rx610_pos, $I10, $P10) = rx610_cur."!mark_fail"(0)
    lt rx610_pos, -1, rx610_done
    eq rx610_pos, -1, rx610_fail
    jump $I10
  rx610_done:
    rx610_cur."!cursor_fail"()
    rx610_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx610_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("147_1278500537.15927") :method
.annotate 'line', 4
    $P612 = self."!PREFIX__!subrule"("ws", "")
    $P613 = self."!PREFIX__!subrule"("ws", "")
    new $P614, "ResizablePMCArray"
    push $P614, $P612
    push $P614, $P613
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx622_tgt
    .local int rx622_pos
    .local int rx622_off
    .local int rx622_eos
    .local int rx622_rep
    .local pmc rx622_cur
    (rx622_cur, rx622_pos, rx622_tgt) = self."!cursor_start"()
    rx622_cur."!cursor_debug"("START ", "typename")
    .lex unicode:"$\x{a2}", rx622_cur
    .local pmc match
    .lex "$/", match
    length rx622_eos, rx622_tgt
    gt rx622_pos, rx622_eos, rx622_done
    set rx622_off, 0
    lt rx622_pos, 2, rx622_start
    sub rx622_off, rx622_pos, 1
    substr rx622_tgt, rx622_tgt, rx622_off
  rx622_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan626_done
    goto rxscan626_scan
  rxscan626_loop:
    ($P10) = rx622_cur."from"()
    inc $P10
    set rx622_pos, $P10
    ge rx622_pos, rx622_eos, rxscan626_done
  rxscan626_scan:
    set_addr $I10, rxscan626_loop
    rx622_cur."!mark_push"(0, rx622_pos, $I10)
  rxscan626_done:
.annotate 'line', 283
  # rx subrule "name" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."name"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx622_pos = $P10."pos"()
  # rx pass
    rx622_cur."!cursor_pass"(rx622_pos, "typename")
    rx622_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx622_pos)
    .return (rx622_cur)
  rx622_fail:
.annotate 'line', 4
    (rx622_rep, rx622_pos, $I10, $P10) = rx622_cur."!mark_fail"(0)
    lt rx622_pos, -1, rx622_done
    eq rx622_pos, -1, rx622_fail
    jump $I10
  rx622_done:
    rx622_cur."!cursor_fail"()
    rx622_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx622_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("149_1278500537.15927") :method
.annotate 'line', 4
    $P624 = self."!PREFIX__!subrule"("name", "")
    new $P625, "ResizablePMCArray"
    push $P625, $P624
    .return ($P625)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx628_tgt
    .local int rx628_pos
    .local int rx628_off
    .local int rx628_eos
    .local int rx628_rep
    .local pmc rx628_cur
    (rx628_cur, rx628_pos, rx628_tgt) = self."!cursor_start"()
    rx628_cur."!cursor_debug"("START ", "declarator")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan633_done
    goto rxscan633_scan
  rxscan633_loop:
    ($P10) = rx628_cur."from"()
    inc $P10
    set rx628_pos, $P10
    ge rx628_pos, rx628_eos, rxscan633_done
  rxscan633_scan:
    set_addr $I10, rxscan633_loop
    rx628_cur."!mark_push"(0, rx628_pos, $I10)
  rxscan633_done:
  alt634_0:
.annotate 'line', 285
    set_addr $I10, alt634_1
    rx628_cur."!mark_push"(0, rx628_pos, $I10)
.annotate 'line', 286
  # rx subrule "variable_declarator" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."variable_declarator"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx628_pos = $P10."pos"()
    goto alt634_end
  alt634_1:
.annotate 'line', 287
  # rx subrule "routine_declarator" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."routine_declarator"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx628_pos = $P10."pos"()
  alt634_end:
.annotate 'line', 285
  # rx pass
    rx628_cur."!cursor_pass"(rx628_pos, "declarator")
    rx628_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx628_pos)
    .return (rx628_cur)
  rx628_fail:
.annotate 'line', 4
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    rx628_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("151_1278500537.15927") :method
.annotate 'line', 4
    $P630 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P631 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P632, "ResizablePMCArray"
    push $P632, $P630
    push $P632, $P631
    .return ($P632)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx636_tgt
    .local int rx636_pos
    .local int rx636_off
    .local int rx636_eos
    .local int rx636_rep
    .local pmc rx636_cur
    (rx636_cur, rx636_pos, rx636_tgt) = self."!cursor_start"()
    rx636_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx636_cur
    .local pmc match
    .lex "$/", match
    length rx636_eos, rx636_tgt
    gt rx636_pos, rx636_eos, rx636_done
    set rx636_off, 0
    lt rx636_pos, 2, rx636_start
    sub rx636_off, rx636_pos, 1
    substr rx636_tgt, rx636_tgt, rx636_off
  rx636_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan640_done
    goto rxscan640_scan
  rxscan640_loop:
    ($P10) = rx636_cur."from"()
    inc $P10
    set rx636_pos, $P10
    ge rx636_pos, rx636_eos, rxscan640_done
  rxscan640_scan:
    set_addr $I10, rxscan640_loop
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  rxscan640_done:
.annotate 'line', 290
  # rx subrule "variable" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."variable"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx636_pos = $P10."pos"()
  # rx pass
    rx636_cur."!cursor_pass"(rx636_pos, "variable_declarator")
    rx636_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx636_pos)
    .return (rx636_cur)
  rx636_fail:
.annotate 'line', 4
    (rx636_rep, rx636_pos, $I10, $P10) = rx636_cur."!mark_fail"(0)
    lt rx636_pos, -1, rx636_done
    eq rx636_pos, -1, rx636_fail
    jump $I10
  rx636_done:
    rx636_cur."!cursor_fail"()
    rx636_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("153_1278500537.15927") :method
.annotate 'line', 4
    $P638 = self."!PREFIX__!subrule"("variable", "")
    new $P639, "ResizablePMCArray"
    push $P639, $P638
    .return ($P639)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1278500537.15927") :method
.annotate 'line', 292
    $P642 = self."!protoregex"("routine_declarator")
    .return ($P642)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1278500537.15927") :method
.annotate 'line', 292
    $P644 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P644)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx646_tgt
    .local int rx646_pos
    .local int rx646_off
    .local int rx646_eos
    .local int rx646_rep
    .local pmc rx646_cur
    (rx646_cur, rx646_pos, rx646_tgt) = self."!cursor_start"()
    rx646_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx646_cur
    .local pmc match
    .lex "$/", match
    length rx646_eos, rx646_tgt
    gt rx646_pos, rx646_eos, rx646_done
    set rx646_off, 0
    lt rx646_pos, 2, rx646_start
    sub rx646_off, rx646_pos, 1
    substr rx646_tgt, rx646_tgt, rx646_off
  rx646_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan650_done
    goto rxscan650_scan
  rxscan650_loop:
    ($P10) = rx646_cur."from"()
    inc $P10
    set rx646_pos, $P10
    ge rx646_pos, rx646_eos, rxscan650_done
  rxscan650_scan:
    set_addr $I10, rxscan650_loop
    rx646_cur."!mark_push"(0, rx646_pos, $I10)
  rxscan650_done:
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_651_fail
    rx646_cur."!mark_push"(0, rx646_pos, $I10)
  # rx literal  "sub"
    add $I11, rx646_pos, 3
    gt $I11, rx646_eos, rx646_fail
    sub $I11, rx646_pos, rx646_off
    substr $S10, rx646_tgt, $I11, 3
    ne $S10, "sub", rx646_fail
    add rx646_pos, 3
    set_addr $I10, rxcap_651_fail
    ($I12, $I11) = rx646_cur."!mark_peek"($I10)
    rx646_cur."!cursor_pos"($I11)
    ($P10) = rx646_cur."!cursor_start"()
    $P10."!cursor_pass"(rx646_pos, "")
    rx646_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_651_done
  rxcap_651_fail:
    goto rx646_fail
  rxcap_651_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx646_cur."!cursor_pos"(rx646_pos)
    $P10 = rx646_cur."routine_def"()
    unless $P10, rx646_fail
    rx646_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx646_pos = $P10."pos"()
  # rx pass
    rx646_cur."!cursor_pass"(rx646_pos, "routine_declarator:sym<sub>")
    rx646_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx646_pos)
    .return (rx646_cur)
  rx646_fail:
.annotate 'line', 4
    (rx646_rep, rx646_pos, $I10, $P10) = rx646_cur."!mark_fail"(0)
    lt rx646_pos, -1, rx646_done
    eq rx646_pos, -1, rx646_fail
    jump $I10
  rx646_done:
    rx646_cur."!cursor_fail"()
    rx646_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx646_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1278500537.15927") :method
.annotate 'line', 4
    $P648 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P649, "ResizablePMCArray"
    push $P649, $P648
    .return ($P649)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx653_tgt
    .local int rx653_pos
    .local int rx653_off
    .local int rx653_eos
    .local int rx653_rep
    .local pmc rx653_cur
    (rx653_cur, rx653_pos, rx653_tgt) = self."!cursor_start"()
    rx653_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx653_cur
    .local pmc match
    .lex "$/", match
    length rx653_eos, rx653_tgt
    gt rx653_pos, rx653_eos, rx653_done
    set rx653_off, 0
    lt rx653_pos, 2, rx653_start
    sub rx653_off, rx653_pos, 1
    substr rx653_tgt, rx653_tgt, rx653_off
  rx653_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan657_done
    goto rxscan657_scan
  rxscan657_loop:
    ($P10) = rx653_cur."from"()
    inc $P10
    set rx653_pos, $P10
    ge rx653_pos, rx653_eos, rxscan657_done
  rxscan657_scan:
    set_addr $I10, rxscan657_loop
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  rxscan657_done:
.annotate 'line', 294
  # rx subcapture "sym"
    set_addr $I10, rxcap_658_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx literal  "method"
    add $I11, rx653_pos, 6
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 6
    ne $S10, "method", rx653_fail
    add rx653_pos, 6
    set_addr $I10, rxcap_658_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_658_done
  rxcap_658_fail:
    goto rx653_fail
  rxcap_658_done:
  # rx subrule "method_def" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."method_def"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx653_pos = $P10."pos"()
  # rx pass
    rx653_cur."!cursor_pass"(rx653_pos, "routine_declarator:sym<method>")
    rx653_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx653_pos)
    .return (rx653_cur)
  rx653_fail:
.annotate 'line', 4
    (rx653_rep, rx653_pos, $I10, $P10) = rx653_cur."!mark_fail"(0)
    lt rx653_pos, -1, rx653_done
    eq rx653_pos, -1, rx653_fail
    jump $I10
  rx653_done:
    rx653_cur."!cursor_fail"()
    rx653_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx653_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1278500537.15927") :method
.annotate 'line', 4
    $P655 = self."!PREFIX__!subrule"("method_def", "method")
    new $P656, "ResizablePMCArray"
    push $P656, $P655
    .return ($P656)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx660_tgt
    .local int rx660_pos
    .local int rx660_off
    .local int rx660_eos
    .local int rx660_rep
    .local pmc rx660_cur
    (rx660_cur, rx660_pos, rx660_tgt) = self."!cursor_start"()
    rx660_cur."!cursor_debug"("START ", "routine_def")
    rx660_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx660_cur
    .local pmc match
    .lex "$/", match
    length rx660_eos, rx660_tgt
    gt rx660_pos, rx660_eos, rx660_done
    set rx660_off, 0
    lt rx660_pos, 2, rx660_start
    sub rx660_off, rx660_pos, 1
    substr rx660_tgt, rx660_tgt, rx660_off
  rx660_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan664_done
    goto rxscan664_scan
  rxscan664_loop:
    ($P10) = rx660_cur."from"()
    inc $P10
    set rx660_pos, $P10
    ge rx660_pos, rx660_eos, rxscan664_done
  rxscan664_scan:
    set_addr $I10, rxscan664_loop
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  rxscan664_done:
.annotate 'line', 296
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate 'line', 297
  # rx rxquantr666 ** 0..1
    set_addr $I672, rxquantr666_done
    rx660_cur."!mark_push"(0, rx660_pos, $I672)
  rxquantr666_loop:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_670_fail
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx rxquantr668 ** 0..1
    set_addr $I669, rxquantr668_done
    rx660_cur."!mark_push"(0, rx660_pos, $I669)
  rxquantr668_loop:
  # rx literal  "&"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "&", rx660_fail
    add rx660_pos, 1
    (rx660_rep) = rx660_cur."!mark_commit"($I669)
  rxquantr668_done:
    set_addr $I10, rxcap_670_fail
    ($I12, $I11) = rx660_cur."!mark_peek"($I10)
    rx660_cur."!cursor_pos"($I11)
    ($P10) = rx660_cur."!cursor_start"()
    $P10."!cursor_pass"(rx660_pos, "")
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_670_done
  rxcap_670_fail:
    goto rx660_fail
  rxcap_670_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."deflongname"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
    (rx660_rep) = rx660_cur."!mark_commit"($I672)
  rxquantr666_done:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate 'line', 298
  # rx subrule "newpad" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."newpad"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  alt675_0:
.annotate 'line', 299
    set_addr $I10, alt675_1
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "(", rx660_fail
    add rx660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."signature"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, ")", rx660_fail
    add rx660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
    goto alt675_end
  alt675_1:
.annotate 'line', 300
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  alt675_end:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate 'line', 301
  # rx subrule "blockoid" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."blockoid"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate 'line', 296
  # rx pass
    rx660_cur."!cursor_pass"(rx660_pos, "routine_def")
    rx660_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx660_pos)
    .return (rx660_cur)
  rx660_fail:
.annotate 'line', 4
    (rx660_rep, rx660_pos, $I10, $P10) = rx660_cur."!mark_fail"(0)
    lt rx660_pos, -1, rx660_done
    eq rx660_pos, -1, rx660_fail
    jump $I10
  rx660_done:
    rx660_cur."!cursor_fail"()
    rx660_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx660_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("161_1278500537.15927") :method
.annotate 'line', 4
    $P662 = self."!PREFIX__!subrule"("ws", "")
    new $P663, "ResizablePMCArray"
    push $P663, $P662
    .return ($P663)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx685_tgt
    .local int rx685_pos
    .local int rx685_off
    .local int rx685_eos
    .local int rx685_rep
    .local pmc rx685_cur
    (rx685_cur, rx685_pos, rx685_tgt) = self."!cursor_start"()
    rx685_cur."!cursor_debug"("START ", "method_def")
    rx685_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx685_cur
    .local pmc match
    .lex "$/", match
    length rx685_eos, rx685_tgt
    gt rx685_pos, rx685_eos, rx685_done
    set rx685_off, 0
    lt rx685_pos, 2, rx685_start
    sub rx685_off, rx685_pos, 1
    substr rx685_tgt, rx685_tgt, rx685_off
  rx685_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan689_done
    goto rxscan689_scan
  rxscan689_loop:
    ($P10) = rx685_cur."from"()
    inc $P10
    set rx685_pos, $P10
    ge rx685_pos, rx685_eos, rxscan689_done
  rxscan689_scan:
    set_addr $I10, rxscan689_loop
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
  rxscan689_done:
.annotate 'line', 304
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
.annotate 'line', 305
  # rx rxquantr691 ** 0..1
    set_addr $I692, rxquantr691_done
    rx685_cur."!mark_push"(0, rx685_pos, $I692)
  rxquantr691_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."deflongname"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx685_pos = $P10."pos"()
    (rx685_rep) = rx685_cur."!mark_commit"($I692)
  rxquantr691_done:
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
.annotate 'line', 306
  # rx subrule "newpad" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."newpad"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  alt695_0:
.annotate 'line', 307
    set_addr $I10, alt695_1
    rx685_cur."!mark_push"(0, rx685_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx685_pos, 1
    gt $I11, rx685_eos, rx685_fail
    sub $I11, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I11, 1
    ne $S10, "(", rx685_fail
    add rx685_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."signature"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx685_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx685_pos, 1
    gt $I11, rx685_eos, rx685_fail
    sub $I11, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I11, 1
    ne $S10, ")", rx685_fail
    add rx685_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
    goto alt695_end
  alt695_1:
.annotate 'line', 308
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  alt695_end:
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
.annotate 'line', 309
  # rx subrule "blockoid" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."blockoid"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx685_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
.annotate 'line', 304
  # rx pass
    rx685_cur."!cursor_pass"(rx685_pos, "method_def")
    rx685_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx685_pos)
    .return (rx685_cur)
  rx685_fail:
.annotate 'line', 4
    (rx685_rep, rx685_pos, $I10, $P10) = rx685_cur."!mark_fail"(0)
    lt rx685_pos, -1, rx685_done
    eq rx685_pos, -1, rx685_fail
    jump $I10
  rx685_done:
    rx685_cur."!cursor_fail"()
    rx685_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx685_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("163_1278500537.15927") :method
.annotate 'line', 4
    $P687 = self."!PREFIX__!subrule"("ws", "")
    new $P688, "ResizablePMCArray"
    push $P688, $P687
    .return ($P688)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1278500537.15927") :method
.annotate 'line', 312
    $P705 = self."!protoregex"("multi_declarator")
    .return ($P705)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1278500537.15927") :method
.annotate 'line', 312
    $P707 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P707)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 314
    new $P709, "Undef"
    .lex "$*MULTINESS", $P709
.annotate 'line', 4
    .local string rx710_tgt
    .local int rx710_pos
    .local int rx710_off
    .local int rx710_eos
    .local int rx710_rep
    .local pmc rx710_cur
    (rx710_cur, rx710_pos, rx710_tgt) = self."!cursor_start"()
    rx710_cur."!cursor_debug"("START ", "multi_declarator:sym<multi>")
    .lex unicode:"$\x{a2}", rx710_cur
    .local pmc match
    .lex "$/", match
    length rx710_eos, rx710_tgt
    gt rx710_pos, rx710_eos, rx710_done
    set rx710_off, 0
    lt rx710_pos, 2, rx710_start
    sub rx710_off, rx710_pos, 1
    substr rx710_tgt, rx710_tgt, rx710_off
  rx710_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan714_done
    goto rxscan714_scan
  rxscan714_loop:
    ($P10) = rx710_cur."from"()
    inc $P10
    set rx710_pos, $P10
    ge rx710_pos, rx710_eos, rxscan714_done
  rxscan714_scan:
    set_addr $I10, rxscan714_loop
    rx710_cur."!mark_push"(0, rx710_pos, $I10)
  rxscan714_done:
.annotate 'line', 314
    rx710_cur."!cursor_pos"(rx710_pos)
    new $P715, "String"
    assign $P715, "multi"
    store_lex "$*MULTINESS", $P715
.annotate 'line', 315
  # rx subcapture "sym"
    set_addr $I10, rxcap_716_fail
    rx710_cur."!mark_push"(0, rx710_pos, $I10)
  # rx literal  "multi"
    add $I11, rx710_pos, 5
    gt $I11, rx710_eos, rx710_fail
    sub $I11, rx710_pos, rx710_off
    substr $S10, rx710_tgt, $I11, 5
    ne $S10, "multi", rx710_fail
    add rx710_pos, 5
    set_addr $I10, rxcap_716_fail
    ($I12, $I11) = rx710_cur."!mark_peek"($I10)
    rx710_cur."!cursor_pos"($I11)
    ($P10) = rx710_cur."!cursor_start"()
    $P10."!cursor_pass"(rx710_pos, "")
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_716_done
  rxcap_716_fail:
    goto rx710_fail
  rxcap_716_done:
.annotate 'line', 316
  # rx subrule "ws" subtype=method negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."ws"()
    unless $P10, rx710_fail
    rx710_pos = $P10."pos"()
  alt717_0:
    set_addr $I10, alt717_1
    rx710_cur."!mark_push"(0, rx710_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."declarator"()
    unless $P10, rx710_fail
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx710_pos = $P10."pos"()
    goto alt717_end
  alt717_1:
    set_addr $I10, alt717_2
    rx710_cur."!mark_push"(0, rx710_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."routine_def"()
    unless $P10, rx710_fail
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx710_pos = $P10."pos"()
    goto alt717_end
  alt717_2:
  # rx subrule "panic" subtype=method negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."panic"("Malformed multi")
    unless $P10, rx710_fail
    rx710_pos = $P10."pos"()
  alt717_end:
.annotate 'line', 313
  # rx pass
    rx710_cur."!cursor_pass"(rx710_pos, "multi_declarator:sym<multi>")
    rx710_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<multi>", " at pos=", rx710_pos)
    .return (rx710_cur)
  rx710_fail:
.annotate 'line', 4
    (rx710_rep, rx710_pos, $I10, $P10) = rx710_cur."!mark_fail"(0)
    lt rx710_pos, -1, rx710_done
    eq rx710_pos, -1, rx710_fail
    jump $I10
  rx710_done:
    rx710_cur."!cursor_fail"()
    rx710_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<multi>")
    .return (rx710_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1278500537.15927") :method
.annotate 'line', 4
    $P712 = self."!PREFIX__!subrule"("ws", "multi")
    new $P713, "ResizablePMCArray"
    push $P713, $P712
    .return ($P713)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 319
    new $P719, "Undef"
    .lex "$*MULTINESS", $P719
.annotate 'line', 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    (rx720_cur, rx720_pos, rx720_tgt) = self."!cursor_start"()
    rx720_cur."!cursor_debug"("START ", "multi_declarator:sym<null>")
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
.annotate 'line', 319
    rx720_cur."!cursor_pos"(rx720_pos)
    new $P725, "String"
    assign $P725, ""
    store_lex "$*MULTINESS", $P725
.annotate 'line', 320
  # rx subrule "declarator" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."declarator"()
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx720_pos = $P10."pos"()
.annotate 'line', 318
  # rx pass
    rx720_cur."!cursor_pass"(rx720_pos, "multi_declarator:sym<null>")
    rx720_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<null>", " at pos=", rx720_pos)
    .return (rx720_cur)
  rx720_fail:
.annotate 'line', 4
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    rx720_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<null>")
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1278500537.15927") :method
.annotate 'line', 4
    $P722 = self."!PREFIX__!subrule"("declarator", "")
    new $P723, "ResizablePMCArray"
    push $P723, $P722
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx727_tgt
    .local int rx727_pos
    .local int rx727_off
    .local int rx727_eos
    .local int rx727_rep
    .local pmc rx727_cur
    (rx727_cur, rx727_pos, rx727_tgt) = self."!cursor_start"()
    rx727_cur."!cursor_debug"("START ", "signature")
    rx727_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx727_cur
    .local pmc match
    .lex "$/", match
    length rx727_eos, rx727_tgt
    gt rx727_pos, rx727_eos, rx727_done
    set rx727_off, 0
    lt rx727_pos, 2, rx727_start
    sub rx727_off, rx727_pos, 1
    substr rx727_tgt, rx727_tgt, rx727_off
  rx727_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan730_done
    goto rxscan730_scan
  rxscan730_loop:
    ($P10) = rx727_cur."from"()
    inc $P10
    set rx727_pos, $P10
    ge rx727_pos, rx727_eos, rxscan730_done
  rxscan730_scan:
    set_addr $I10, rxscan730_loop
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  rxscan730_done:
.annotate 'line', 323
  # rx rxquantr731 ** 0..1
    set_addr $I734, rxquantr731_done
    rx727_cur."!mark_push"(0, rx727_pos, $I734)
  rxquantr731_loop:
  # rx rxquantr732 ** 1..*
    set_addr $I733, rxquantr732_done
    rx727_cur."!mark_push"(0, -1, $I733)
  rxquantr732_loop:
  # rx subrule "ws" subtype=method negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."ws"()
    unless $P10, rx727_fail
    rx727_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."parameter"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx727_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."ws"()
    unless $P10, rx727_fail
    rx727_pos = $P10."pos"()
    (rx727_rep) = rx727_cur."!mark_commit"($I733)
    rx727_cur."!mark_push"(rx727_rep, rx727_pos, $I733)
  # rx literal  ","
    add $I11, rx727_pos, 1
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 1
    ne $S10, ",", rx727_fail
    add rx727_pos, 1
    goto rxquantr732_loop
  rxquantr732_done:
    (rx727_rep) = rx727_cur."!mark_commit"($I734)
  rxquantr731_done:
  # rx pass
    rx727_cur."!cursor_pass"(rx727_pos, "signature")
    rx727_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx727_pos)
    .return (rx727_cur)
  rx727_fail:
.annotate 'line', 4
    (rx727_rep, rx727_pos, $I10, $P10) = rx727_cur."!mark_fail"(0)
    lt rx727_pos, -1, rx727_done
    eq rx727_pos, -1, rx727_fail
    jump $I10
  rx727_done:
    rx727_cur."!cursor_fail"()
    rx727_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx727_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("171_1278500537.15927") :method
.annotate 'line', 4
    new $P729, "ResizablePMCArray"
    push $P729, ""
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx736_tgt
    .local int rx736_pos
    .local int rx736_off
    .local int rx736_eos
    .local int rx736_rep
    .local pmc rx736_cur
    (rx736_cur, rx736_pos, rx736_tgt) = self."!cursor_start"()
    rx736_cur."!cursor_debug"("START ", "parameter")
    rx736_cur."!cursor_caparray"("default_value", "typename")
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
.annotate 'line', 326
  # rx rxquantr740 ** 0..*
    set_addr $I741, rxquantr740_done
    rx736_cur."!mark_push"(0, rx736_pos, $I741)
  rxquantr740_loop:
  # rx subrule "typename" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."typename"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx736_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."ws"()
    unless $P10, rx736_fail
    rx736_pos = $P10."pos"()
    (rx736_rep) = rx736_cur."!mark_commit"($I741)
    rx736_cur."!mark_push"(rx736_rep, rx736_pos, $I741)
    goto rxquantr740_loop
  rxquantr740_done:
  alt742_0:
.annotate 'line', 327
    set_addr $I10, alt742_1
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
.annotate 'line', 328
  # rx subcapture "quant"
    set_addr $I10, rxcap_743_fail
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  # rx literal  "*"
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    substr $S10, rx736_tgt, $I11, 1
    ne $S10, "*", rx736_fail
    add rx736_pos, 1
    set_addr $I10, rxcap_743_fail
    ($I12, $I11) = rx736_cur."!mark_peek"($I10)
    rx736_cur."!cursor_pos"($I11)
    ($P10) = rx736_cur."!cursor_start"()
    $P10."!cursor_pass"(rx736_pos, "")
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_743_done
  rxcap_743_fail:
    goto rx736_fail
  rxcap_743_done:
  # rx subrule "param_var" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."param_var"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx736_pos = $P10."pos"()
    goto alt742_end
  alt742_1:
  alt744_0:
.annotate 'line', 329
    set_addr $I10, alt744_1
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."param_var"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx736_pos = $P10."pos"()
    goto alt744_end
  alt744_1:
  # rx subrule "named_param" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."named_param"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx736_pos = $P10."pos"()
  alt744_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_746_fail
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  alt745_0:
    set_addr $I10, alt745_1
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  # rx literal  "?"
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    substr $S10, rx736_tgt, $I11, 1
    ne $S10, "?", rx736_fail
    add rx736_pos, 1
    goto alt745_end
  alt745_1:
    set_addr $I10, alt745_2
    rx736_cur."!mark_push"(0, rx736_pos, $I10)
  # rx literal  "!"
    add $I11, rx736_pos, 1
    gt $I11, rx736_eos, rx736_fail
    sub $I11, rx736_pos, rx736_off
    substr $S10, rx736_tgt, $I11, 1
    ne $S10, "!", rx736_fail
    add rx736_pos, 1
    goto alt745_end
  alt745_2:
  alt745_end:
    set_addr $I10, rxcap_746_fail
    ($I12, $I11) = rx736_cur."!mark_peek"($I10)
    rx736_cur."!cursor_pos"($I11)
    ($P10) = rx736_cur."!cursor_start"()
    $P10."!cursor_pass"(rx736_pos, "")
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_746_done
  rxcap_746_fail:
    goto rx736_fail
  rxcap_746_done:
  alt742_end:
.annotate 'line', 331
  # rx rxquantr747 ** 0..1
    set_addr $I748, rxquantr747_done
    rx736_cur."!mark_push"(0, rx736_pos, $I748)
  rxquantr747_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx736_cur."!cursor_pos"(rx736_pos)
    $P10 = rx736_cur."default_value"()
    unless $P10, rx736_fail
    rx736_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx736_pos = $P10."pos"()
    (rx736_rep) = rx736_cur."!mark_commit"($I748)
  rxquantr747_done:
.annotate 'line', 325
  # rx pass
    rx736_cur."!cursor_pass"(rx736_pos, "parameter")
    rx736_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx736_pos)
    .return (rx736_cur)
  rx736_fail:
.annotate 'line', 4
    (rx736_rep, rx736_pos, $I10, $P10) = rx736_cur."!mark_fail"(0)
    lt rx736_pos, -1, rx736_done
    eq rx736_pos, -1, rx736_fail
    jump $I10
  rx736_done:
    rx736_cur."!cursor_fail"()
    rx736_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx736_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("173_1278500537.15927") :method
.annotate 'line', 4
    new $P738, "ResizablePMCArray"
    push $P738, ""
    .return ($P738)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx750_tgt
    .local int rx750_pos
    .local int rx750_off
    .local int rx750_eos
    .local int rx750_rep
    .local pmc rx750_cur
    (rx750_cur, rx750_pos, rx750_tgt) = self."!cursor_start"()
    rx750_cur."!cursor_debug"("START ", "param_var")
    rx750_cur."!cursor_caparray"("twigil")
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
.annotate 'line', 335
  # rx subrule "sigil" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."sigil"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx750_pos = $P10."pos"()
  # rx rxquantr755 ** 0..1
    set_addr $I756, rxquantr755_done
    rx750_cur."!mark_push"(0, rx750_pos, $I756)
  rxquantr755_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."twigil"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx750_pos = $P10."pos"()
    (rx750_rep) = rx750_cur."!mark_commit"($I756)
  rxquantr755_done:
  alt757_0:
.annotate 'line', 336
    set_addr $I10, alt757_1
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."ident"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx750_pos = $P10."pos"()
    goto alt757_end
  alt757_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_758_fail
    rx750_cur."!mark_push"(0, rx750_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx750_pos, rx750_eos, rx750_fail
    sub $I10, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx750_fail
    inc rx750_pos
    set_addr $I10, rxcap_758_fail
    ($I12, $I11) = rx750_cur."!mark_peek"($I10)
    rx750_cur."!cursor_pos"($I11)
    ($P10) = rx750_cur."!cursor_start"()
    $P10."!cursor_pass"(rx750_pos, "")
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_758_done
  rxcap_758_fail:
    goto rx750_fail
  rxcap_758_done:
  alt757_end:
.annotate 'line', 334
  # rx pass
    rx750_cur."!cursor_pass"(rx750_pos, "param_var")
    rx750_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx750_pos)
    .return (rx750_cur)
  rx750_fail:
.annotate 'line', 4
    (rx750_rep, rx750_pos, $I10, $P10) = rx750_cur."!mark_fail"(0)
    lt rx750_pos, -1, rx750_done
    eq rx750_pos, -1, rx750_fail
    jump $I10
  rx750_done:
    rx750_cur."!cursor_fail"()
    rx750_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx750_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("175_1278500537.15927") :method
.annotate 'line', 4
    $P752 = self."!PREFIX__!subrule"("sigil", "")
    new $P753, "ResizablePMCArray"
    push $P753, $P752
    .return ($P753)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx760_tgt
    .local int rx760_pos
    .local int rx760_off
    .local int rx760_eos
    .local int rx760_rep
    .local pmc rx760_cur
    (rx760_cur, rx760_pos, rx760_tgt) = self."!cursor_start"()
    rx760_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx760_cur
    .local pmc match
    .lex "$/", match
    length rx760_eos, rx760_tgt
    gt rx760_pos, rx760_eos, rx760_done
    set rx760_off, 0
    lt rx760_pos, 2, rx760_start
    sub rx760_off, rx760_pos, 1
    substr rx760_tgt, rx760_tgt, rx760_off
  rx760_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan764_done
    goto rxscan764_scan
  rxscan764_loop:
    ($P10) = rx760_cur."from"()
    inc $P10
    set rx760_pos, $P10
    ge rx760_pos, rx760_eos, rxscan764_done
  rxscan764_scan:
    set_addr $I10, rxscan764_loop
    rx760_cur."!mark_push"(0, rx760_pos, $I10)
  rxscan764_done:
.annotate 'line', 340
  # rx literal  ":"
    add $I11, rx760_pos, 1
    gt $I11, rx760_eos, rx760_fail
    sub $I11, rx760_pos, rx760_off
    substr $S10, rx760_tgt, $I11, 1
    ne $S10, ":", rx760_fail
    add rx760_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx760_cur."!cursor_pos"(rx760_pos)
    $P10 = rx760_cur."param_var"()
    unless $P10, rx760_fail
    rx760_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx760_pos = $P10."pos"()
.annotate 'line', 339
  # rx pass
    rx760_cur."!cursor_pass"(rx760_pos, "named_param")
    rx760_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx760_pos)
    .return (rx760_cur)
  rx760_fail:
.annotate 'line', 4
    (rx760_rep, rx760_pos, $I10, $P10) = rx760_cur."!mark_fail"(0)
    lt rx760_pos, -1, rx760_done
    eq rx760_pos, -1, rx760_fail
    jump $I10
  rx760_done:
    rx760_cur."!cursor_fail"()
    rx760_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx760_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("177_1278500537.15927") :method
.annotate 'line', 4
    $P762 = self."!PREFIX__!subrule"("param_var", ":")
    new $P763, "ResizablePMCArray"
    push $P763, $P762
    .return ($P763)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx766_tgt
    .local int rx766_pos
    .local int rx766_off
    .local int rx766_eos
    .local int rx766_rep
    .local pmc rx766_cur
    (rx766_cur, rx766_pos, rx766_tgt) = self."!cursor_start"()
    rx766_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx766_cur
    .local pmc match
    .lex "$/", match
    length rx766_eos, rx766_tgt
    gt rx766_pos, rx766_eos, rx766_done
    set rx766_off, 0
    lt rx766_pos, 2, rx766_start
    sub rx766_off, rx766_pos, 1
    substr rx766_tgt, rx766_tgt, rx766_off
  rx766_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan770_done
    goto rxscan770_scan
  rxscan770_loop:
    ($P10) = rx766_cur."from"()
    inc $P10
    set rx766_pos, $P10
    ge rx766_pos, rx766_eos, rxscan770_done
  rxscan770_scan:
    set_addr $I10, rxscan770_loop
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  rxscan770_done:
.annotate 'line', 343
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "=", rx766_fail
    add rx766_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."EXPR"("i=")
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx pass
    rx766_cur."!cursor_pass"(rx766_pos, "default_value")
    rx766_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx766_pos)
    .return (rx766_cur)
  rx766_fail:
.annotate 'line', 4
    (rx766_rep, rx766_pos, $I10, $P10) = rx766_cur."!mark_fail"(0)
    lt rx766_pos, -1, rx766_done
    eq rx766_pos, -1, rx766_fail
    jump $I10
  rx766_done:
    rx766_cur."!cursor_fail"()
    rx766_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx766_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("179_1278500537.15927") :method
.annotate 'line', 4
    $P768 = self."!PREFIX__!subrule"("ws", "")
    new $P769, "ResizablePMCArray"
    push $P769, $P768
    .return ($P769)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("180_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx775_tgt
    .local int rx775_pos
    .local int rx775_off
    .local int rx775_eos
    .local int rx775_rep
    .local pmc rx775_cur
    (rx775_cur, rx775_pos, rx775_tgt) = self."!cursor_start"()
    rx775_cur."!cursor_debug"("START ", "regex_declarator")
    rx775_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx775_cur
    .local pmc match
    .lex "$/", match
    length rx775_eos, rx775_tgt
    gt rx775_pos, rx775_eos, rx775_done
    set rx775_off, 0
    lt rx775_pos, 2, rx775_start
    sub rx775_off, rx775_pos, 1
    substr rx775_tgt, rx775_tgt, rx775_off
  rx775_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan779_done
    goto rxscan779_scan
  rxscan779_loop:
    ($P10) = rx775_cur."from"()
    inc $P10
    set rx775_pos, $P10
    ge rx775_pos, rx775_eos, rxscan779_done
  rxscan779_scan:
    set_addr $I10, rxscan779_loop
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  rxscan779_done:
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt781_0:
.annotate 'line', 346
    set_addr $I10, alt781_1
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
.annotate 'line', 347
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_783_fail
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  # rx literal  "proto"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "proto", rx775_fail
    add rx775_pos, 5
    set_addr $I10, rxcap_783_fail
    ($I12, $I11) = rx775_cur."!mark_peek"($I10)
    rx775_cur."!cursor_pos"($I11)
    ($P10) = rx775_cur."!cursor_start"()
    $P10."!cursor_pass"(rx775_pos, "")
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_783_done
  rxcap_783_fail:
    goto rx775_fail
  rxcap_783_done:
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt785_0:
    set_addr $I10, alt785_1
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  # rx literal  "regex"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "regex", rx775_fail
    add rx775_pos, 5
    goto alt785_end
  alt785_1:
    set_addr $I10, alt785_2
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  # rx literal  "token"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "token", rx775_fail
    add rx775_pos, 5
    goto alt785_end
  alt785_2:
  # rx literal  "rule"
    add $I11, rx775_pos, 4
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 4
    ne $S10, "rule", rx775_fail
    add rx775_pos, 4
  alt785_end:
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 348
  # rx subrule "deflongname" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."deflongname"()
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx775_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt788_0:
.annotate 'line', 349
    set_addr $I10, alt788_1
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
.annotate 'line', 350
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, "{", rx775_fail
    add rx775_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "<...>", rx775_fail
    add rx775_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, "}", rx775_fail
    add rx775_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ENDSTMT"()
    unless $P10, rx775_fail
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
    goto alt788_end
  alt788_1:
.annotate 'line', 351
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt788_end:
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 347
    goto alt781_end
  alt781_1:
.annotate 'line', 353
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_798_fail
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  alt797_0:
    set_addr $I10, alt797_1
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  # rx literal  "regex"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "regex", rx775_fail
    add rx775_pos, 5
    goto alt797_end
  alt797_1:
    set_addr $I10, alt797_2
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  # rx literal  "token"
    add $I11, rx775_pos, 5
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 5
    ne $S10, "token", rx775_fail
    add rx775_pos, 5
    goto alt797_end
  alt797_2:
  # rx literal  "rule"
    add $I11, rx775_pos, 4
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 4
    ne $S10, "rule", rx775_fail
    add rx775_pos, 4
  alt797_end:
    set_addr $I10, rxcap_798_fail
    ($I12, $I11) = rx775_cur."!mark_peek"($I10)
    rx775_cur."!cursor_pos"($I11)
    ($P10) = rx775_cur."!cursor_start"()
    $P10."!cursor_pass"(rx775_pos, "")
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_798_done
  rxcap_798_fail:
    goto rx775_fail
  rxcap_798_done:
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 354
  # rx subrule "deflongname" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."deflongname"()
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx775_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 355
  # rx subrule "newpad" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."newpad"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 356
  # rx rxquantr802 ** 0..1
    set_addr $I807, rxquantr802_done
    rx775_cur."!mark_push"(0, rx775_pos, $I807)
  rxquantr802_loop:
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, "(", rx775_fail
    add rx775_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."signature"()
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx775_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, ")", rx775_fail
    add rx775_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
    (rx775_rep) = rx775_cur."!mark_commit"($I807)
  rxquantr802_done:
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 357
  # rx reduce name="regex_declarator" key="open"
    rx775_cur."!cursor_pos"(rx775_pos)
    rx775_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 358
  # rx literal  "{"
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, "{", rx775_fail
    add rx775_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."LANG"("Regex", "nibbler")
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx775_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx775_pos, 1
    gt $I11, rx775_eos, rx775_fail
    sub $I11, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I11, 1
    ne $S10, "}", rx775_fail
    add rx775_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ENDSTMT"()
    unless $P10, rx775_fail
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt781_end:
.annotate 'line', 359
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
.annotate 'line', 345
  # rx pass
    rx775_cur."!cursor_pass"(rx775_pos, "regex_declarator")
    rx775_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx775_pos)
    .return (rx775_cur)
  rx775_fail:
.annotate 'line', 4
    (rx775_rep, rx775_pos, $I10, $P10) = rx775_cur."!mark_fail"(0)
    lt rx775_pos, -1, rx775_done
    eq rx775_pos, -1, rx775_fail
    jump $I10
  rx775_done:
    rx775_cur."!cursor_fail"()
    rx775_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx775_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("181_1278500537.15927") :method
.annotate 'line', 4
    $P777 = self."!PREFIX__!subrule"("ws", "")
    new $P778, "ResizablePMCArray"
    push $P778, $P777
    .return ($P778)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("182_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx813_tgt
    .local int rx813_pos
    .local int rx813_off
    .local int rx813_eos
    .local int rx813_rep
    .local pmc rx813_cur
    (rx813_cur, rx813_pos, rx813_tgt) = self."!cursor_start"()
    rx813_cur."!cursor_debug"("START ", "dotty")
    rx813_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx813_cur
    .local pmc match
    .lex "$/", match
    length rx813_eos, rx813_tgt
    gt rx813_pos, rx813_eos, rx813_done
    set rx813_off, 0
    lt rx813_pos, 2, rx813_start
    sub rx813_off, rx813_pos, 1
    substr rx813_tgt, rx813_tgt, rx813_off
  rx813_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan817_done
    goto rxscan817_scan
  rxscan817_loop:
    ($P10) = rx813_cur."from"()
    inc $P10
    set rx813_pos, $P10
    ge rx813_pos, rx813_eos, rxscan817_done
  rxscan817_scan:
    set_addr $I10, rxscan817_loop
    rx813_cur."!mark_push"(0, rx813_pos, $I10)
  rxscan817_done:
.annotate 'line', 363
  # rx literal  "."
    add $I11, rx813_pos, 1
    gt $I11, rx813_eos, rx813_fail
    sub $I11, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I11, 1
    ne $S10, ".", rx813_fail
    add rx813_pos, 1
  alt818_0:
.annotate 'line', 364
    set_addr $I10, alt818_1
    rx813_cur."!mark_push"(0, rx813_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."deflongname"()
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx813_pos = $P10."pos"()
    goto alt818_end
  alt818_1:
.annotate 'line', 365
  # rx enumcharlist negate=0 zerowidth
    ge rx813_pos, rx813_eos, rx813_fail
    sub $I10, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx813_fail
  # rx subrule "quote" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."quote"()
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx813_pos = $P10."pos"()
  alt819_0:
.annotate 'line', 366
    set_addr $I10, alt819_1
    rx813_cur."!mark_push"(0, rx813_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx813_pos, rx813_eos, rx813_fail
    sub $I10, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx813_fail
    goto alt819_end
  alt819_1:
  # rx subrule "panic" subtype=method negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx813_fail
    rx813_pos = $P10."pos"()
  alt819_end:
  alt818_end:
.annotate 'line', 372
  # rx rxquantr820 ** 0..1
    set_addr $I822, rxquantr820_done
    rx813_cur."!mark_push"(0, rx813_pos, $I822)
  rxquantr820_loop:
  alt821_0:
.annotate 'line', 369
    set_addr $I10, alt821_1
    rx813_cur."!mark_push"(0, rx813_pos, $I10)
.annotate 'line', 370
  # rx enumcharlist negate=0 zerowidth
    ge rx813_pos, rx813_eos, rx813_fail
    sub $I10, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx813_fail
  # rx subrule "args" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."args"()
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx813_pos = $P10."pos"()
    goto alt821_end
  alt821_1:
.annotate 'line', 371
  # rx literal  ":"
    add $I11, rx813_pos, 1
    gt $I11, rx813_eos, rx813_fail
    sub $I11, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I11, 1
    ne $S10, ":", rx813_fail
    add rx813_pos, 1
  # rx charclass s
    ge rx813_pos, rx813_eos, rx813_fail
    sub $I10, rx813_pos, rx813_off
    is_cclass $I11, 32, rx813_tgt, $I10
    unless $I11, rx813_fail
    inc rx813_pos
  # rx subrule "arglist" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."arglist"()
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx813_pos = $P10."pos"()
  alt821_end:
.annotate 'line', 372
    (rx813_rep) = rx813_cur."!mark_commit"($I822)
  rxquantr820_done:
.annotate 'line', 362
  # rx pass
    rx813_cur."!cursor_pass"(rx813_pos, "dotty")
    rx813_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx813_pos)
    .return (rx813_cur)
  rx813_fail:
.annotate 'line', 4
    (rx813_rep, rx813_pos, $I10, $P10) = rx813_cur."!mark_fail"(0)
    lt rx813_pos, -1, rx813_done
    eq rx813_pos, -1, rx813_fail
    jump $I10
  rx813_done:
    rx813_cur."!cursor_fail"()
    rx813_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx813_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("183_1278500537.15927") :method
.annotate 'line', 4
    $P815 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P816, "ResizablePMCArray"
    push $P816, "'"
    push $P816, "\""
    push $P816, $P815
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("184_1278500537.15927") :method
.annotate 'line', 376
    $P824 = self."!protoregex"("term")
    .return ($P824)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("185_1278500537.15927") :method
.annotate 'line', 376
    $P826 = self."!PREFIX__!protoregex"("term")
    .return ($P826)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("186_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx828_tgt
    .local int rx828_pos
    .local int rx828_off
    .local int rx828_eos
    .local int rx828_rep
    .local pmc rx828_cur
    (rx828_cur, rx828_pos, rx828_tgt) = self."!cursor_start"()
    rx828_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx828_cur
    .local pmc match
    .lex "$/", match
    length rx828_eos, rx828_tgt
    gt rx828_pos, rx828_eos, rx828_done
    set rx828_off, 0
    lt rx828_pos, 2, rx828_start
    sub rx828_off, rx828_pos, 1
    substr rx828_tgt, rx828_tgt, rx828_off
  rx828_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan831_done
    goto rxscan831_scan
  rxscan831_loop:
    ($P10) = rx828_cur."from"()
    inc $P10
    set rx828_pos, $P10
    ge rx828_pos, rx828_eos, rxscan831_done
  rxscan831_scan:
    set_addr $I10, rxscan831_loop
    rx828_cur."!mark_push"(0, rx828_pos, $I10)
  rxscan831_done:
.annotate 'line', 378
  # rx subcapture "sym"
    set_addr $I10, rxcap_832_fail
    rx828_cur."!mark_push"(0, rx828_pos, $I10)
  # rx literal  "self"
    add $I11, rx828_pos, 4
    gt $I11, rx828_eos, rx828_fail
    sub $I11, rx828_pos, rx828_off
    substr $S10, rx828_tgt, $I11, 4
    ne $S10, "self", rx828_fail
    add rx828_pos, 4
    set_addr $I10, rxcap_832_fail
    ($I12, $I11) = rx828_cur."!mark_peek"($I10)
    rx828_cur."!cursor_pos"($I11)
    ($P10) = rx828_cur."!cursor_start"()
    $P10."!cursor_pass"(rx828_pos, "")
    rx828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_832_done
  rxcap_832_fail:
    goto rx828_fail
  rxcap_832_done:
  # rxanchor rwb
    le rx828_pos, 0, rx828_fail
    sub $I10, rx828_pos, rx828_off
    is_cclass $I11, 8192, rx828_tgt, $I10
    if $I11, rx828_fail
    dec $I10
    is_cclass $I11, 8192, rx828_tgt, $I10
    unless $I11, rx828_fail
  # rx pass
    rx828_cur."!cursor_pass"(rx828_pos, "term:sym<self>")
    rx828_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx828_pos)
    .return (rx828_cur)
  rx828_fail:
.annotate 'line', 4
    (rx828_rep, rx828_pos, $I10, $P10) = rx828_cur."!mark_fail"(0)
    lt rx828_pos, -1, rx828_done
    eq rx828_pos, -1, rx828_fail
    jump $I10
  rx828_done:
    rx828_cur."!cursor_fail"()
    rx828_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx828_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("187_1278500537.15927") :method
.annotate 'line', 4
    new $P830, "ResizablePMCArray"
    push $P830, "self"
    .return ($P830)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("188_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx834_tgt
    .local int rx834_pos
    .local int rx834_off
    .local int rx834_eos
    .local int rx834_rep
    .local pmc rx834_cur
    (rx834_cur, rx834_pos, rx834_tgt) = self."!cursor_start"()
    rx834_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx834_cur
    .local pmc match
    .lex "$/", match
    length rx834_eos, rx834_tgt
    gt rx834_pos, rx834_eos, rx834_done
    set rx834_off, 0
    lt rx834_pos, 2, rx834_start
    sub rx834_off, rx834_pos, 1
    substr rx834_tgt, rx834_tgt, rx834_off
  rx834_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan838_done
    goto rxscan838_scan
  rxscan838_loop:
    ($P10) = rx834_cur."from"()
    inc $P10
    set rx834_pos, $P10
    ge rx834_pos, rx834_eos, rxscan838_done
  rxscan838_scan:
    set_addr $I10, rxscan838_loop
    rx834_cur."!mark_push"(0, rx834_pos, $I10)
  rxscan838_done:
.annotate 'line', 381
  # rx subrule "deflongname" subtype=capture negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."deflongname"()
    unless $P10, rx834_fail
    rx834_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx834_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx834_pos, rx834_eos, rx834_fail
    sub $I10, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx834_fail
  # rx subrule "args" subtype=capture negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."args"()
    unless $P10, rx834_fail
    rx834_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx834_pos = $P10."pos"()
.annotate 'line', 380
  # rx pass
    rx834_cur."!cursor_pass"(rx834_pos, "term:sym<identifier>")
    rx834_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx834_pos)
    .return (rx834_cur)
  rx834_fail:
.annotate 'line', 4
    (rx834_rep, rx834_pos, $I10, $P10) = rx834_cur."!mark_fail"(0)
    lt rx834_pos, -1, rx834_done
    eq rx834_pos, -1, rx834_fail
    jump $I10
  rx834_done:
    rx834_cur."!cursor_fail"()
    rx834_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx834_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("189_1278500537.15927") :method
.annotate 'line', 4
    $P836 = self."!PREFIX__!subrule"("deflongname", "")
    new $P837, "ResizablePMCArray"
    push $P837, $P836
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("190_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx840_tgt
    .local int rx840_pos
    .local int rx840_off
    .local int rx840_eos
    .local int rx840_rep
    .local pmc rx840_cur
    (rx840_cur, rx840_pos, rx840_tgt) = self."!cursor_start"()
    rx840_cur."!cursor_debug"("START ", "term:sym<name>")
    rx840_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx840_cur
    .local pmc match
    .lex "$/", match
    length rx840_eos, rx840_tgt
    gt rx840_pos, rx840_eos, rx840_done
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
.annotate 'line', 385
  # rx subrule "name" subtype=capture negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."name"()
    unless $P10, rx840_fail
    rx840_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx840_pos = $P10."pos"()
  # rx rxquantr845 ** 0..1
    set_addr $I846, rxquantr845_done
    rx840_cur."!mark_push"(0, rx840_pos, $I846)
  rxquantr845_loop:
  # rx subrule "args" subtype=capture negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."args"()
    unless $P10, rx840_fail
    rx840_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx840_pos = $P10."pos"()
    (rx840_rep) = rx840_cur."!mark_commit"($I846)
  rxquantr845_done:
.annotate 'line', 384
  # rx pass
    rx840_cur."!cursor_pass"(rx840_pos, "term:sym<name>")
    rx840_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx840_pos)
    .return (rx840_cur)
  rx840_fail:
.annotate 'line', 4
    (rx840_rep, rx840_pos, $I10, $P10) = rx840_cur."!mark_fail"(0)
    lt rx840_pos, -1, rx840_done
    eq rx840_pos, -1, rx840_fail
    jump $I10
  rx840_done:
    rx840_cur."!cursor_fail"()
    rx840_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx840_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("191_1278500537.15927") :method
.annotate 'line', 4
    $P842 = self."!PREFIX__!subrule"("name", "")
    new $P843, "ResizablePMCArray"
    push $P843, $P842
    .return ($P843)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("192_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx848_tgt
    .local int rx848_pos
    .local int rx848_off
    .local int rx848_eos
    .local int rx848_rep
    .local pmc rx848_cur
    (rx848_cur, rx848_pos, rx848_tgt) = self."!cursor_start"()
    rx848_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx848_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx848_cur
    .local pmc match
    .lex "$/", match
    length rx848_eos, rx848_tgt
    gt rx848_pos, rx848_eos, rx848_done
    set rx848_off, 0
    lt rx848_pos, 2, rx848_start
    sub rx848_off, rx848_pos, 1
    substr rx848_tgt, rx848_tgt, rx848_off
  rx848_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan851_done
    goto rxscan851_scan
  rxscan851_loop:
    ($P10) = rx848_cur."from"()
    inc $P10
    set rx848_pos, $P10
    ge rx848_pos, rx848_eos, rxscan851_done
  rxscan851_scan:
    set_addr $I10, rxscan851_loop
    rx848_cur."!mark_push"(0, rx848_pos, $I10)
  rxscan851_done:
.annotate 'line', 389
  # rx literal  "pir::"
    add $I11, rx848_pos, 5
    gt $I11, rx848_eos, rx848_fail
    sub $I11, rx848_pos, rx848_off
    substr $S10, rx848_tgt, $I11, 5
    ne $S10, "pir::", rx848_fail
    add rx848_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_852_fail
    rx848_cur."!mark_push"(0, rx848_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx848_pos, rx848_off
    find_not_cclass $I11, 8192, rx848_tgt, $I10, rx848_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx848_fail
    add rx848_pos, rx848_off, $I11
    set_addr $I10, rxcap_852_fail
    ($I12, $I11) = rx848_cur."!mark_peek"($I10)
    rx848_cur."!cursor_pos"($I11)
    ($P10) = rx848_cur."!cursor_start"()
    $P10."!cursor_pass"(rx848_pos, "")
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_852_done
  rxcap_852_fail:
    goto rx848_fail
  rxcap_852_done:
  # rx rxquantr853 ** 0..1
    set_addr $I854, rxquantr853_done
    rx848_cur."!mark_push"(0, rx848_pos, $I854)
  rxquantr853_loop:
  # rx subrule "args" subtype=capture negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."args"()
    unless $P10, rx848_fail
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx848_pos = $P10."pos"()
    (rx848_rep) = rx848_cur."!mark_commit"($I854)
  rxquantr853_done:
.annotate 'line', 388
  # rx pass
    rx848_cur."!cursor_pass"(rx848_pos, "term:sym<pir::op>")
    rx848_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx848_pos)
    .return (rx848_cur)
  rx848_fail:
.annotate 'line', 4
    (rx848_rep, rx848_pos, $I10, $P10) = rx848_cur."!mark_fail"(0)
    lt rx848_pos, -1, rx848_done
    eq rx848_pos, -1, rx848_fail
    jump $I10
  rx848_done:
    rx848_cur."!cursor_fail"()
    rx848_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx848_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("193_1278500537.15927") :method
.annotate 'line', 4
    new $P850, "ResizablePMCArray"
    push $P850, "pir::"
    .return ($P850)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("194_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx856_tgt
    .local int rx856_pos
    .local int rx856_off
    .local int rx856_eos
    .local int rx856_rep
    .local pmc rx856_cur
    (rx856_cur, rx856_pos, rx856_tgt) = self."!cursor_start"()
    rx856_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx856_cur
    .local pmc match
    .lex "$/", match
    length rx856_eos, rx856_tgt
    gt rx856_pos, rx856_eos, rx856_done
    set rx856_off, 0
    lt rx856_pos, 2, rx856_start
    sub rx856_off, rx856_pos, 1
    substr rx856_tgt, rx856_tgt, rx856_off
  rx856_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan860_done
    goto rxscan860_scan
  rxscan860_loop:
    ($P10) = rx856_cur."from"()
    inc $P10
    set rx856_pos, $P10
    ge rx856_pos, rx856_eos, rxscan860_done
  rxscan860_scan:
    set_addr $I10, rxscan860_loop
    rx856_cur."!mark_push"(0, rx856_pos, $I10)
  rxscan860_done:
.annotate 'line', 393
  # rx literal  "("
    add $I11, rx856_pos, 1
    gt $I11, rx856_eos, rx856_fail
    sub $I11, rx856_pos, rx856_off
    substr $S10, rx856_tgt, $I11, 1
    ne $S10, "(", rx856_fail
    add rx856_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx856_cur."!cursor_pos"(rx856_pos)
    $P10 = rx856_cur."arglist"()
    unless $P10, rx856_fail
    rx856_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx856_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx856_pos, 1
    gt $I11, rx856_eos, rx856_fail
    sub $I11, rx856_pos, rx856_off
    substr $S10, rx856_tgt, $I11, 1
    ne $S10, ")", rx856_fail
    add rx856_pos, 1
  # rx pass
    rx856_cur."!cursor_pass"(rx856_pos, "args")
    rx856_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx856_pos)
    .return (rx856_cur)
  rx856_fail:
.annotate 'line', 4
    (rx856_rep, rx856_pos, $I10, $P10) = rx856_cur."!mark_fail"(0)
    lt rx856_pos, -1, rx856_done
    eq rx856_pos, -1, rx856_fail
    jump $I10
  rx856_done:
    rx856_cur."!cursor_fail"()
    rx856_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx856_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("195_1278500537.15927") :method
.annotate 'line', 4
    $P858 = self."!PREFIX__!subrule"("arglist", "(")
    new $P859, "ResizablePMCArray"
    push $P859, $P858
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("196_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx862_tgt
    .local int rx862_pos
    .local int rx862_off
    .local int rx862_eos
    .local int rx862_rep
    .local pmc rx862_cur
    (rx862_cur, rx862_pos, rx862_tgt) = self."!cursor_start"()
    rx862_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx862_cur
    .local pmc match
    .lex "$/", match
    length rx862_eos, rx862_tgt
    gt rx862_pos, rx862_eos, rx862_done
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
.annotate 'line', 397
  # rx subrule "ws" subtype=method negate=
    rx862_cur."!cursor_pos"(rx862_pos)
    $P10 = rx862_cur."ws"()
    unless $P10, rx862_fail
    rx862_pos = $P10."pos"()
  alt867_0:
.annotate 'line', 398
    set_addr $I10, alt867_1
    rx862_cur."!mark_push"(0, rx862_pos, $I10)
.annotate 'line', 399
  # rx subrule "EXPR" subtype=capture negate=
    rx862_cur."!cursor_pos"(rx862_pos)
    $P10 = rx862_cur."EXPR"("f=")
    unless $P10, rx862_fail
    rx862_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx862_pos = $P10."pos"()
    goto alt867_end
  alt867_1:
  alt867_end:
.annotate 'line', 396
  # rx pass
    rx862_cur."!cursor_pass"(rx862_pos, "arglist")
    rx862_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx862_pos)
    .return (rx862_cur)
  rx862_fail:
.annotate 'line', 4
    (rx862_rep, rx862_pos, $I10, $P10) = rx862_cur."!mark_fail"(0)
    lt rx862_pos, -1, rx862_done
    eq rx862_pos, -1, rx862_fail
    jump $I10
  rx862_done:
    rx862_cur."!cursor_fail"()
    rx862_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx862_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("197_1278500537.15927") :method
.annotate 'line', 4
    $P864 = self."!PREFIX__!subrule"("ws", "")
    new $P865, "ResizablePMCArray"
    push $P865, $P864
    .return ($P865)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("198_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx869_tgt
    .local int rx869_pos
    .local int rx869_off
    .local int rx869_eos
    .local int rx869_rep
    .local pmc rx869_cur
    (rx869_cur, rx869_pos, rx869_tgt) = self."!cursor_start"()
    rx869_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx869_cur
    .local pmc match
    .lex "$/", match
    length rx869_eos, rx869_tgt
    gt rx869_pos, rx869_eos, rx869_done
    set rx869_off, 0
    lt rx869_pos, 2, rx869_start
    sub rx869_off, rx869_pos, 1
    substr rx869_tgt, rx869_tgt, rx869_off
  rx869_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan873_done
    goto rxscan873_scan
  rxscan873_loop:
    ($P10) = rx869_cur."from"()
    inc $P10
    set rx869_pos, $P10
    ge rx869_pos, rx869_eos, rxscan873_done
  rxscan873_scan:
    set_addr $I10, rxscan873_loop
    rx869_cur."!mark_push"(0, rx869_pos, $I10)
  rxscan873_done:
.annotate 'line', 405
  # rx subrule "value" subtype=capture negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."value"()
    unless $P10, rx869_fail
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx869_pos = $P10."pos"()
  # rx pass
    rx869_cur."!cursor_pass"(rx869_pos, "term:sym<value>")
    rx869_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx869_pos)
    .return (rx869_cur)
  rx869_fail:
.annotate 'line', 4
    (rx869_rep, rx869_pos, $I10, $P10) = rx869_cur."!mark_fail"(0)
    lt rx869_pos, -1, rx869_done
    eq rx869_pos, -1, rx869_fail
    jump $I10
  rx869_done:
    rx869_cur."!cursor_fail"()
    rx869_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx869_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("199_1278500537.15927") :method
.annotate 'line', 4
    $P871 = self."!PREFIX__!subrule"("value", "")
    new $P872, "ResizablePMCArray"
    push $P872, $P871
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("200_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "value")
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
    ne $I10, -1, rxscan880_done
    goto rxscan880_scan
  rxscan880_loop:
    ($P10) = rx875_cur."from"()
    inc $P10
    set rx875_pos, $P10
    ge rx875_pos, rx875_eos, rxscan880_done
  rxscan880_scan:
    set_addr $I10, rxscan880_loop
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  rxscan880_done:
  alt881_0:
.annotate 'line', 407
    set_addr $I10, alt881_1
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
.annotate 'line', 408
  # rx subrule "quote" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."quote"()
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx875_pos = $P10."pos"()
    goto alt881_end
  alt881_1:
.annotate 'line', 409
  # rx subrule "number" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."number"()
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx875_pos = $P10."pos"()
  alt881_end:
.annotate 'line', 407
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "value")
    rx875_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate 'line', 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("201_1278500537.15927") :method
.annotate 'line', 4
    $P877 = self."!PREFIX__!subrule"("number", "")
    $P878 = self."!PREFIX__!subrule"("quote", "")
    new $P879, "ResizablePMCArray"
    push $P879, $P877
    push $P879, $P878
    .return ($P879)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("202_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx883_tgt
    .local int rx883_pos
    .local int rx883_off
    .local int rx883_eos
    .local int rx883_rep
    .local pmc rx883_cur
    (rx883_cur, rx883_pos, rx883_tgt) = self."!cursor_start"()
    rx883_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx883_cur
    .local pmc match
    .lex "$/", match
    length rx883_eos, rx883_tgt
    gt rx883_pos, rx883_eos, rx883_done
    set rx883_off, 0
    lt rx883_pos, 2, rx883_start
    sub rx883_off, rx883_pos, 1
    substr rx883_tgt, rx883_tgt, rx883_off
  rx883_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan886_done
    goto rxscan886_scan
  rxscan886_loop:
    ($P10) = rx883_cur."from"()
    inc $P10
    set rx883_pos, $P10
    ge rx883_pos, rx883_eos, rxscan886_done
  rxscan886_scan:
    set_addr $I10, rxscan886_loop
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  rxscan886_done:
.annotate 'line', 413
  # rx subcapture "sign"
    set_addr $I10, rxcap_889_fail
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  # rx rxquantr887 ** 0..1
    set_addr $I888, rxquantr887_done
    rx883_cur."!mark_push"(0, rx883_pos, $I888)
  rxquantr887_loop:
  # rx enumcharlist negate=0 
    ge rx883_pos, rx883_eos, rx883_fail
    sub $I10, rx883_pos, rx883_off
    substr $S10, rx883_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx883_fail
    inc rx883_pos
    (rx883_rep) = rx883_cur."!mark_commit"($I888)
  rxquantr887_done:
    set_addr $I10, rxcap_889_fail
    ($I12, $I11) = rx883_cur."!mark_peek"($I10)
    rx883_cur."!cursor_pos"($I11)
    ($P10) = rx883_cur."!cursor_start"()
    $P10."!cursor_pass"(rx883_pos, "")
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_889_done
  rxcap_889_fail:
    goto rx883_fail
  rxcap_889_done:
  alt890_0:
.annotate 'line', 414
    set_addr $I10, alt890_1
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."dec_number"()
    unless $P10, rx883_fail
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx883_pos = $P10."pos"()
    goto alt890_end
  alt890_1:
  # rx subrule "integer" subtype=capture negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."integer"()
    unless $P10, rx883_fail
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx883_pos = $P10."pos"()
  alt890_end:
.annotate 'line', 412
  # rx pass
    rx883_cur."!cursor_pass"(rx883_pos, "number")
    rx883_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx883_pos)
    .return (rx883_cur)
  rx883_fail:
.annotate 'line', 4
    (rx883_rep, rx883_pos, $I10, $P10) = rx883_cur."!mark_fail"(0)
    lt rx883_pos, -1, rx883_done
    eq rx883_pos, -1, rx883_fail
    jump $I10
  rx883_done:
    rx883_cur."!cursor_fail"()
    rx883_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx883_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("203_1278500537.15927") :method
.annotate 'line', 4
    new $P885, "ResizablePMCArray"
    push $P885, ""
    .return ($P885)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("204_1278500537.15927") :method
.annotate 'line', 417
    $P892 = self."!protoregex"("quote")
    .return ($P892)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("205_1278500537.15927") :method
.annotate 'line', 417
    $P894 = self."!PREFIX__!protoregex"("quote")
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("206_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
.annotate 'line', 418
  # rx enumcharlist negate=0 zerowidth
    ge rx896_pos, rx896_eos, rx896_fail
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
    rx896_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate 'line', 4
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("207_1278500537.15927") :method
.annotate 'line', 4
    new $P898, "ResizablePMCArray"
    push $P898, "'"
    .return ($P898)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("208_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    (rx901_cur, rx901_pos, rx901_tgt) = self."!cursor_start"()
    rx901_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
.annotate 'line', 419
  # rx enumcharlist negate=0 zerowidth
    ge rx901_pos, rx901_eos, rx901_fail
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
    rx901_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx901_pos)
    .return (rx901_cur)
  rx901_fail:
.annotate 'line', 4
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    rx901_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("209_1278500537.15927") :method
.annotate 'line', 4
    new $P903, "ResizablePMCArray"
    push $P903, "\""
    .return ($P903)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("210_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx906_tgt
    .local int rx906_pos
    .local int rx906_off
    .local int rx906_eos
    .local int rx906_rep
    .local pmc rx906_cur
    (rx906_cur, rx906_pos, rx906_tgt) = self."!cursor_start"()
    rx906_cur."!cursor_debug"("START ", "quote:sym<q>")
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
.annotate 'line', 420
  # rx literal  "q"
    add $I11, rx906_pos, 1
    gt $I11, rx906_eos, rx906_fail
    sub $I11, rx906_pos, rx906_off
    substr $S10, rx906_tgt, $I11, 1
    ne $S10, "q", rx906_fail
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
    ge rx906_pos, rx906_eos, rx906_fail
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
    rx906_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx906_pos)
    .return (rx906_cur)
  rx906_fail:
.annotate 'line', 4
    (rx906_rep, rx906_pos, $I10, $P10) = rx906_cur."!mark_fail"(0)
    lt rx906_pos, -1, rx906_done
    eq rx906_pos, -1, rx906_fail
    jump $I10
  rx906_done:
    rx906_cur."!cursor_fail"()
    rx906_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx906_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("211_1278500537.15927") :method
.annotate 'line', 4
    $P908 = self."!PREFIX__!subrule"("ws", "q")
    new $P909, "ResizablePMCArray"
    push $P909, $P908
    .return ($P909)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("212_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx912_tgt
    .local int rx912_pos
    .local int rx912_off
    .local int rx912_eos
    .local int rx912_rep
    .local pmc rx912_cur
    (rx912_cur, rx912_pos, rx912_tgt) = self."!cursor_start"()
    rx912_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
.annotate 'line', 421
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
    ge rx912_pos, rx912_eos, rx912_fail
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
    rx912_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx912_pos)
    .return (rx912_cur)
  rx912_fail:
.annotate 'line', 4
    (rx912_rep, rx912_pos, $I10, $P10) = rx912_cur."!mark_fail"(0)
    lt rx912_pos, -1, rx912_done
    eq rx912_pos, -1, rx912_fail
    jump $I10
  rx912_done:
    rx912_cur."!cursor_fail"()
    rx912_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx912_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("213_1278500537.15927") :method
.annotate 'line', 4
    $P914 = self."!PREFIX__!subrule"("ws", "qq")
    new $P915, "ResizablePMCArray"
    push $P915, $P914
    .return ($P915)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("214_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx918_tgt
    .local int rx918_pos
    .local int rx918_off
    .local int rx918_eos
    .local int rx918_rep
    .local pmc rx918_cur
    (rx918_cur, rx918_pos, rx918_tgt) = self."!cursor_start"()
    rx918_cur."!cursor_debug"("START ", "quote:sym<Q>")
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
.annotate 'line', 422
  # rx literal  "Q"
    add $I11, rx918_pos, 1
    gt $I11, rx918_eos, rx918_fail
    sub $I11, rx918_pos, rx918_off
    substr $S10, rx918_tgt, $I11, 1
    ne $S10, "Q", rx918_fail
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
    ge rx918_pos, rx918_eos, rx918_fail
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
    rx918_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx918_pos)
    .return (rx918_cur)
  rx918_fail:
.annotate 'line', 4
    (rx918_rep, rx918_pos, $I10, $P10) = rx918_cur."!mark_fail"(0)
    lt rx918_pos, -1, rx918_done
    eq rx918_pos, -1, rx918_fail
    jump $I10
  rx918_done:
    rx918_cur."!cursor_fail"()
    rx918_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx918_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("215_1278500537.15927") :method
.annotate 'line', 4
    $P920 = self."!PREFIX__!subrule"("ws", "Q")
    new $P921, "ResizablePMCArray"
    push $P921, $P920
    .return ($P921)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("216_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx924_tgt
    .local int rx924_pos
    .local int rx924_off
    .local int rx924_eos
    .local int rx924_rep
    .local pmc rx924_cur
    (rx924_cur, rx924_pos, rx924_tgt) = self."!cursor_start"()
    rx924_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
.annotate 'line', 423
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
    rx924_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx924_pos)
    .return (rx924_cur)
  rx924_fail:
.annotate 'line', 4
    (rx924_rep, rx924_pos, $I10, $P10) = rx924_cur."!mark_fail"(0)
    lt rx924_pos, -1, rx924_done
    eq rx924_pos, -1, rx924_fail
    jump $I10
  rx924_done:
    rx924_cur."!cursor_fail"()
    rx924_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx924_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("217_1278500537.15927") :method
.annotate 'line', 4
    $P926 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P927, "ResizablePMCArray"
    push $P927, $P926
    .return ($P927)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("218_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx930_tgt
    .local int rx930_pos
    .local int rx930_off
    .local int rx930_eos
    .local int rx930_rep
    .local pmc rx930_cur
    (rx930_cur, rx930_pos, rx930_tgt) = self."!cursor_start"()
    rx930_cur."!cursor_debug"("START ", "quote:sym</ />")
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
.annotate 'line', 425
  # rx literal  "/"
    add $I11, rx930_pos, 1
    gt $I11, rx930_eos, rx930_fail
    sub $I11, rx930_pos, rx930_off
    substr $S10, rx930_tgt, $I11, 1
    ne $S10, "/", rx930_fail
    add rx930_pos, 1
.annotate 'line', 426
  # rx subrule "newpad" subtype=method negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."newpad"()
    unless $P10, rx930_fail
    rx930_pos = $P10."pos"()
.annotate 'line', 427
  # rx reduce name="quote:sym</ />" key="open"
    rx930_cur."!cursor_pos"(rx930_pos)
    rx930_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 428
  # rx subrule "LANG" subtype=capture negate=
    rx930_cur."!cursor_pos"(rx930_pos)
    $P10 = rx930_cur."LANG"("Regex", "nibbler")
    unless $P10, rx930_fail
    rx930_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx930_pos = $P10."pos"()
.annotate 'line', 429
  # rx literal  "/"
    add $I11, rx930_pos, 1
    gt $I11, rx930_eos, rx930_fail
    sub $I11, rx930_pos, rx930_off
    substr $S10, rx930_tgt, $I11, 1
    ne $S10, "/", rx930_fail
    add rx930_pos, 1
.annotate 'line', 424
  # rx pass
    rx930_cur."!cursor_pass"(rx930_pos, "quote:sym</ />")
    rx930_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx930_pos)
    .return (rx930_cur)
  rx930_fail:
.annotate 'line', 4
    (rx930_rep, rx930_pos, $I10, $P10) = rx930_cur."!mark_fail"(0)
    lt rx930_pos, -1, rx930_done
    eq rx930_pos, -1, rx930_fail
    jump $I10
  rx930_done:
    rx930_cur."!cursor_fail"()
    rx930_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx930_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("219_1278500537.15927") :method
.annotate 'line', 4
    $P932 = self."!PREFIX__!subrule"("newpad", "/")
    new $P933, "ResizablePMCArray"
    push $P933, $P932
    .return ($P933)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("220_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx936_tgt
    .local int rx936_pos
    .local int rx936_off
    .local int rx936_eos
    .local int rx936_rep
    .local pmc rx936_cur
    (rx936_cur, rx936_pos, rx936_tgt) = self."!cursor_start"()
    rx936_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
.annotate 'line', 432
  # rx enumcharlist negate=0 zerowidth
    ge rx936_pos, rx936_eos, rx936_fail
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
    rx936_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx936_pos)
    .return (rx936_cur)
  rx936_fail:
.annotate 'line', 4
    (rx936_rep, rx936_pos, $I10, $P10) = rx936_cur."!mark_fail"(0)
    lt rx936_pos, -1, rx936_done
    eq rx936_pos, -1, rx936_fail
    jump $I10
  rx936_done:
    rx936_cur."!cursor_fail"()
    rx936_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx936_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("221_1278500537.15927") :method
.annotate 'line', 4
    new $P938, "ResizablePMCArray"
    push $P938, "$"
    .return ($P938)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("222_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate 'line', 433
  # rx enumcharlist negate=0 zerowidth
    ge rx941_pos, rx941_eos, rx941_fail
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
    rx941_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate 'line', 4
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("223_1278500537.15927") :method
.annotate 'line', 4
    new $P943, "ResizablePMCArray"
    push $P943, "{"
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("224_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx946_tgt
    .local int rx946_pos
    .local int rx946_off
    .local int rx946_eos
    .local int rx946_rep
    .local pmc rx946_cur
    (rx946_cur, rx946_pos, rx946_tgt) = self."!cursor_start"()
    rx946_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
.annotate 'line', 434
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
    rx946_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx946_pos)
    .return (rx946_cur)
  rx946_fail:
.annotate 'line', 4
    (rx946_rep, rx946_pos, $I10, $P10) = rx946_cur."!mark_fail"(0)
    lt rx946_pos, -1, rx946_done
    eq rx946_pos, -1, rx946_fail
    jump $I10
  rx946_done:
    rx946_cur."!cursor_fail"()
    rx946_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx946_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("225_1278500537.15927") :method
.annotate 'line', 4
    new $P948, "ResizablePMCArray"
    push $P948, "\\e"
    .return ($P948)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("226_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    (rx951_cur, rx951_pos, rx951_tgt) = self."!cursor_start"()
    rx951_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx951_cur."!cursor_caparray"("EXPR")
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
.annotate 'line', 436
  # rx literal  "("
    add $I11, rx951_pos, 1
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I11, 1
    ne $S10, "(", rx951_fail
    add rx951_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."ws"()
    unless $P10, rx951_fail
    rx951_pos = $P10."pos"()
  # rx rxquantr956 ** 0..1
    set_addr $I957, rxquantr956_done
    rx951_cur."!mark_push"(0, rx951_pos, $I957)
  rxquantr956_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."EXPR"()
    unless $P10, rx951_fail
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx951_pos = $P10."pos"()
    (rx951_rep) = rx951_cur."!mark_commit"($I957)
  rxquantr956_done:
  # rx literal  ")"
    add $I11, rx951_pos, 1
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I11, 1
    ne $S10, ")", rx951_fail
    add rx951_pos, 1
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "circumfix:sym<( )>")
    rx951_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx951_pos)
    .return (rx951_cur)
  rx951_fail:
.annotate 'line', 4
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    rx951_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("227_1278500537.15927") :method
.annotate 'line', 4
    $P953 = self."!PREFIX__!subrule"("ws", "(")
    new $P954, "ResizablePMCArray"
    push $P954, $P953
    .return ($P954)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("228_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx959_tgt
    .local int rx959_pos
    .local int rx959_off
    .local int rx959_eos
    .local int rx959_rep
    .local pmc rx959_cur
    (rx959_cur, rx959_pos, rx959_tgt) = self."!cursor_start"()
    rx959_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx959_cur."!cursor_caparray"("EXPR")
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
.annotate 'line', 437
  # rx literal  "["
    add $I11, rx959_pos, 1
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    substr $S10, rx959_tgt, $I11, 1
    ne $S10, "[", rx959_fail
    add rx959_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."ws"()
    unless $P10, rx959_fail
    rx959_pos = $P10."pos"()
  # rx rxquantr964 ** 0..1
    set_addr $I965, rxquantr964_done
    rx959_cur."!mark_push"(0, rx959_pos, $I965)
  rxquantr964_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."EXPR"()
    unless $P10, rx959_fail
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx959_pos = $P10."pos"()
    (rx959_rep) = rx959_cur."!mark_commit"($I965)
  rxquantr964_done:
  # rx literal  "]"
    add $I11, rx959_pos, 1
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    substr $S10, rx959_tgt, $I11, 1
    ne $S10, "]", rx959_fail
    add rx959_pos, 1
  # rx pass
    rx959_cur."!cursor_pass"(rx959_pos, "circumfix:sym<[ ]>")
    rx959_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx959_pos)
    .return (rx959_cur)
  rx959_fail:
.annotate 'line', 4
    (rx959_rep, rx959_pos, $I10, $P10) = rx959_cur."!mark_fail"(0)
    lt rx959_pos, -1, rx959_done
    eq rx959_pos, -1, rx959_fail
    jump $I10
  rx959_done:
    rx959_cur."!cursor_fail"()
    rx959_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx959_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("229_1278500537.15927") :method
.annotate 'line', 4
    $P961 = self."!PREFIX__!subrule"("ws", "[")
    new $P962, "ResizablePMCArray"
    push $P962, $P961
    .return ($P962)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("230_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    (rx967_cur, rx967_pos, rx967_tgt) = self."!cursor_start"()
    rx967_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
.annotate 'line', 438
  # rx enumcharlist negate=0 zerowidth
    ge rx967_pos, rx967_eos, rx967_fail
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
    rx967_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx967_pos)
    .return (rx967_cur)
  rx967_fail:
.annotate 'line', 4
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    rx967_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("231_1278500537.15927") :method
.annotate 'line', 4
    new $P969, "ResizablePMCArray"
    push $P969, "<"
    .return ($P969)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("232_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx972_tgt
    .local int rx972_pos
    .local int rx972_off
    .local int rx972_eos
    .local int rx972_rep
    .local pmc rx972_cur
    (rx972_cur, rx972_pos, rx972_tgt) = self."!cursor_start"()
    rx972_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
.annotate 'line', 439
  # rx enumcharlist negate=0 zerowidth
    ge rx972_pos, rx972_eos, rx972_fail
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
    rx972_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx972_pos)
    .return (rx972_cur)
  rx972_fail:
.annotate 'line', 4
    (rx972_rep, rx972_pos, $I10, $P10) = rx972_cur."!mark_fail"(0)
    lt rx972_pos, -1, rx972_done
    eq rx972_pos, -1, rx972_fail
    jump $I10
  rx972_done:
    rx972_cur."!cursor_fail"()
    rx972_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx972_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("233_1278500537.15927") :method
.annotate 'line', 4
    new $P974, "ResizablePMCArray"
    push $P974, unicode:"\x{ab}"
    .return ($P974)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("234_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx977_tgt
    .local int rx977_pos
    .local int rx977_off
    .local int rx977_eos
    .local int rx977_rep
    .local pmc rx977_cur
    (rx977_cur, rx977_pos, rx977_tgt) = self."!cursor_start"()
    rx977_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
.annotate 'line', 440
  # rx enumcharlist negate=0 zerowidth
    ge rx977_pos, rx977_eos, rx977_fail
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
    rx977_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx977_pos)
    .return (rx977_cur)
  rx977_fail:
.annotate 'line', 4
    (rx977_rep, rx977_pos, $I10, $P10) = rx977_cur."!mark_fail"(0)
    lt rx977_pos, -1, rx977_done
    eq rx977_pos, -1, rx977_fail
    jump $I10
  rx977_done:
    rx977_cur."!cursor_fail"()
    rx977_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx977_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("235_1278500537.15927") :method
.annotate 'line', 4
    new $P979, "ResizablePMCArray"
    push $P979, "{"
    .return ($P979)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("236_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt) = self."!cursor_start"()
    rx982_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
.annotate 'line', 441
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
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "(", rx982_fail
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
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, ")", rx982_fail
    add rx982_pos, 1
    goto alt987_end
  alt987_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."FAILGOAL"("')'")
    unless $P10, rx982_fail
    rx982_pos = $P10."pos"()
  alt987_end:
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "circumfix:sym<sigil>")
    rx982_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_fail:
.annotate 'line', 4
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("237_1278500537.15927") :method
.annotate 'line', 4
    $P984 = self."!PREFIX__!subrule"("sigil", "")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("238_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 4
    .local string rx990_tgt
    .local int rx990_pos
    .local int rx990_off
    .local int rx990_eos
    .local int rx990_rep
    .local pmc rx990_cur
    (rx990_cur, rx990_pos, rx990_tgt) = self."!cursor_start"()
    rx990_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx990_cur
    .local pmc match
    .lex "$/", match
    length rx990_eos, rx990_tgt
    gt rx990_pos, rx990_eos, rx990_done
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
.annotate 'line', 443
  # rx subrule "ws" subtype=method negate=
    rx990_cur."!cursor_pos"(rx990_pos)
    $P10 = rx990_cur."ws"()
    unless $P10, rx990_fail
    rx990_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx990_cur."!cursor_pos"(rx990_pos)
    $P10 = rx990_cur."statement"()
    unless $P10, rx990_fail
    rx990_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx990_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx990_cur."!cursor_pos"(rx990_pos)
    $P10 = rx990_cur."ws"()
    unless $P10, rx990_fail
    rx990_pos = $P10."pos"()
  # rx pass
    rx990_cur."!cursor_pass"(rx990_pos, "semilist")
    rx990_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx990_pos)
    .return (rx990_cur)
  rx990_fail:
.annotate 'line', 4
    (rx990_rep, rx990_pos, $I10, $P10) = rx990_cur."!mark_fail"(0)
    lt rx990_pos, -1, rx990_done
    eq rx990_pos, -1, rx990_fail
    jump $I10
  rx990_done:
    rx990_cur."!cursor_fail"()
    rx990_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx990_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("239_1278500537.15927") :method
.annotate 'line', 4
    $P992 = self."!PREFIX__!subrule"("ws", "")
    new $P993, "ResizablePMCArray"
    push $P993, $P992
    .return ($P993)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("240_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx998_tgt
    .local int rx998_pos
    .local int rx998_off
    .local int rx998_eos
    .local int rx998_rep
    .local pmc rx998_cur
    (rx998_cur, rx998_pos, rx998_tgt) = self."!cursor_start"()
    rx998_cur."!cursor_debug"("START ", "infixish")
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
    ne $I10, -1, rxscan1001_done
    goto rxscan1001_scan
  rxscan1001_loop:
    ($P10) = rx998_cur."from"()
    inc $P10
    set rx998_pos, $P10
    ge rx998_pos, rx998_eos, rxscan1001_done
  rxscan1001_scan:
    set_addr $I10, rxscan1001_loop
    rx998_cur."!mark_push"(0, rx998_pos, $I10)
  rxscan1001_done:
.annotate 'line', 466
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."infixstopper"()
    if $P10, rx998_fail
  # rx subrule "infix" subtype=capture negate=
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."infix"()
    unless $P10, rx998_fail
    rx998_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx998_pos = $P10."pos"()
  # rx pass
    rx998_cur."!cursor_pass"(rx998_pos, "infixish")
    rx998_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx998_pos)
    .return (rx998_cur)
  rx998_fail:
.annotate 'line', 447
    (rx998_rep, rx998_pos, $I10, $P10) = rx998_cur."!mark_fail"(0)
    lt rx998_pos, -1, rx998_done
    eq rx998_pos, -1, rx998_fail
    jump $I10
  rx998_done:
    rx998_cur."!cursor_fail"()
    rx998_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx998_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("241_1278500537.15927") :method
.annotate 'line', 447
    new $P1000, "ResizablePMCArray"
    push $P1000, ""
    .return ($P1000)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("242_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1003_tgt
    .local int rx1003_pos
    .local int rx1003_off
    .local int rx1003_eos
    .local int rx1003_rep
    .local pmc rx1003_cur
    (rx1003_cur, rx1003_pos, rx1003_tgt) = self."!cursor_start"()
    rx1003_cur."!cursor_debug"("START ", "infixstopper")
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
    ne $I10, -1, rxscan1006_done
    goto rxscan1006_scan
  rxscan1006_loop:
    ($P10) = rx1003_cur."from"()
    inc $P10
    set rx1003_pos, $P10
    ge rx1003_pos, rx1003_eos, rxscan1006_done
  rxscan1006_scan:
    set_addr $I10, rxscan1006_loop
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  rxscan1006_done:
.annotate 'line', 467
  # rx subrule "lambda" subtype=zerowidth negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."lambda"()
    unless $P10, rx1003_fail
  # rx pass
    rx1003_cur."!cursor_pass"(rx1003_pos, "infixstopper")
    rx1003_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx1003_pos)
    .return (rx1003_cur)
  rx1003_fail:
.annotate 'line', 447
    (rx1003_rep, rx1003_pos, $I10, $P10) = rx1003_cur."!mark_fail"(0)
    lt rx1003_pos, -1, rx1003_done
    eq rx1003_pos, -1, rx1003_fail
    jump $I10
  rx1003_done:
    rx1003_cur."!cursor_fail"()
    rx1003_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx1003_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("243_1278500537.15927") :method
.annotate 'line', 447
    new $P1005, "ResizablePMCArray"
    push $P1005, ""
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("244_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx1008_cur
    .local pmc match
    .lex "$/", match
    length rx1008_eos, rx1008_tgt
    gt rx1008_pos, rx1008_eos, rx1008_done
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
.annotate 'line', 470
  # rx literal  "["
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, "[", rx1008_fail
    add rx1008_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."ws"()
    unless $P10, rx1008_fail
    rx1008_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."EXPR"()
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1008_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, "]", rx1008_fail
    add rx1008_pos, 1
.annotate 'line', 471
  # rx subrule "O" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."O"("%methodop")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1008_pos = $P10."pos"()
.annotate 'line', 469
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "postcircumfix:sym<[ ]>")
    rx1008_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate 'line', 447
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("245_1278500537.15927") :method
.annotate 'line', 447
    $P1010 = self."!PREFIX__!subrule"("ws", "[")
    new $P1011, "ResizablePMCArray"
    push $P1011, $P1010
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("246_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1014_tgt
    .local int rx1014_pos
    .local int rx1014_off
    .local int rx1014_eos
    .local int rx1014_rep
    .local pmc rx1014_cur
    (rx1014_cur, rx1014_pos, rx1014_tgt) = self."!cursor_start"()
    rx1014_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
.annotate 'line', 475
  # rx literal  "{"
    add $I11, rx1014_pos, 1
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 1
    ne $S10, "{", rx1014_fail
    add rx1014_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."ws"()
    unless $P10, rx1014_fail
    rx1014_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."EXPR"()
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1014_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1014_pos, 1
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 1
    ne $S10, "}", rx1014_fail
    add rx1014_pos, 1
.annotate 'line', 476
  # rx subrule "O" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."O"("%methodop")
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1014_pos = $P10."pos"()
.annotate 'line', 474
  # rx pass
    rx1014_cur."!cursor_pass"(rx1014_pos, "postcircumfix:sym<{ }>")
    rx1014_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx1014_pos)
    .return (rx1014_cur)
  rx1014_fail:
.annotate 'line', 447
    (rx1014_rep, rx1014_pos, $I10, $P10) = rx1014_cur."!mark_fail"(0)
    lt rx1014_pos, -1, rx1014_done
    eq rx1014_pos, -1, rx1014_fail
    jump $I10
  rx1014_done:
    rx1014_cur."!cursor_fail"()
    rx1014_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx1014_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("247_1278500537.15927") :method
.annotate 'line', 447
    $P1016 = self."!PREFIX__!subrule"("ws", "{")
    new $P1017, "ResizablePMCArray"
    push $P1017, $P1016
    .return ($P1017)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("248_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
    ne $I10, -1, rxscan1023_done
    goto rxscan1023_scan
  rxscan1023_loop:
    ($P10) = rx1020_cur."from"()
    inc $P10
    set rx1020_pos, $P10
    ge rx1020_pos, rx1020_eos, rxscan1023_done
  rxscan1023_scan:
    set_addr $I10, rxscan1023_loop
    rx1020_cur."!mark_push"(0, rx1020_pos, $I10)
  rxscan1023_done:
.annotate 'line', 480
  # rx enumcharlist negate=0 zerowidth
    ge rx1020_pos, rx1020_eos, rx1020_fail
    sub $I10, rx1020_pos, rx1020_off
    substr $S10, rx1020_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1020_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."quote_EXPR"(":q")
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1020_pos = $P10."pos"()
.annotate 'line', 481
  # rx subrule "O" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."O"("%methodop")
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1020_pos = $P10."pos"()
.annotate 'line', 479
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "postcircumfix:sym<ang>")
    rx1020_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
.annotate 'line', 447
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("249_1278500537.15927") :method
.annotate 'line', 447
    new $P1022, "ResizablePMCArray"
    push $P1022, "<"
    .return ($P1022)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("250_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1025_tgt
    .local int rx1025_pos
    .local int rx1025_off
    .local int rx1025_eos
    .local int rx1025_rep
    .local pmc rx1025_cur
    (rx1025_cur, rx1025_pos, rx1025_tgt) = self."!cursor_start"()
    rx1025_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx1025_cur
    .local pmc match
    .lex "$/", match
    length rx1025_eos, rx1025_tgt
    gt rx1025_pos, rx1025_eos, rx1025_done
    set rx1025_off, 0
    lt rx1025_pos, 2, rx1025_start
    sub rx1025_off, rx1025_pos, 1
    substr rx1025_tgt, rx1025_tgt, rx1025_off
  rx1025_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1029_done
    goto rxscan1029_scan
  rxscan1029_loop:
    ($P10) = rx1025_cur."from"()
    inc $P10
    set rx1025_pos, $P10
    ge rx1025_pos, rx1025_eos, rxscan1029_done
  rxscan1029_scan:
    set_addr $I10, rxscan1029_loop
    rx1025_cur."!mark_push"(0, rx1025_pos, $I10)
  rxscan1029_done:
.annotate 'line', 485
  # rx literal  "("
    add $I11, rx1025_pos, 1
    gt $I11, rx1025_eos, rx1025_fail
    sub $I11, rx1025_pos, rx1025_off
    substr $S10, rx1025_tgt, $I11, 1
    ne $S10, "(", rx1025_fail
    add rx1025_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."ws"()
    unless $P10, rx1025_fail
    rx1025_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."arglist"()
    unless $P10, rx1025_fail
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1025_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1025_pos, 1
    gt $I11, rx1025_eos, rx1025_fail
    sub $I11, rx1025_pos, rx1025_off
    substr $S10, rx1025_tgt, $I11, 1
    ne $S10, ")", rx1025_fail
    add rx1025_pos, 1
.annotate 'line', 486
  # rx subrule "O" subtype=capture negate=
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."O"("%methodop")
    unless $P10, rx1025_fail
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1025_pos = $P10."pos"()
.annotate 'line', 484
  # rx pass
    rx1025_cur."!cursor_pass"(rx1025_pos, "postcircumfix:sym<( )>")
    rx1025_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx1025_pos)
    .return (rx1025_cur)
  rx1025_fail:
.annotate 'line', 447
    (rx1025_rep, rx1025_pos, $I10, $P10) = rx1025_cur."!mark_fail"(0)
    lt rx1025_pos, -1, rx1025_done
    eq rx1025_pos, -1, rx1025_fail
    jump $I10
  rx1025_done:
    rx1025_cur."!cursor_fail"()
    rx1025_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx1025_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("251_1278500537.15927") :method
.annotate 'line', 447
    $P1027 = self."!PREFIX__!subrule"("ws", "(")
    new $P1028, "ResizablePMCArray"
    push $P1028, $P1027
    .return ($P1028)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("252_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "postfix:sym<.>")
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
.annotate 'line', 489
  # rx subrule "dotty" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."dotty"()
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1031_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."O"("%methodop")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "postfix:sym<.>")
    rx1031_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate 'line', 447
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("253_1278500537.15927") :method
.annotate 'line', 447
    $P1033 = self."!PREFIX__!subrule"("dotty", "")
    new $P1034, "ResizablePMCArray"
    push $P1034, $P1033
    .return ($P1034)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("254_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1037_tgt
    .local int rx1037_pos
    .local int rx1037_off
    .local int rx1037_eos
    .local int rx1037_rep
    .local pmc rx1037_cur
    (rx1037_cur, rx1037_pos, rx1037_tgt) = self."!cursor_start"()
    rx1037_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx1037_cur
    .local pmc match
    .lex "$/", match
    length rx1037_eos, rx1037_tgt
    gt rx1037_pos, rx1037_eos, rx1037_done
    set rx1037_off, 0
    lt rx1037_pos, 2, rx1037_start
    sub rx1037_off, rx1037_pos, 1
    substr rx1037_tgt, rx1037_tgt, rx1037_off
  rx1037_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1041_done
    goto rxscan1041_scan
  rxscan1041_loop:
    ($P10) = rx1037_cur."from"()
    inc $P10
    set rx1037_pos, $P10
    ge rx1037_pos, rx1037_eos, rxscan1041_done
  rxscan1041_scan:
    set_addr $I10, rxscan1041_loop
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  rxscan1041_done:
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1042_fail
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  # rx literal  "++"
    add $I11, rx1037_pos, 2
    gt $I11, rx1037_eos, rx1037_fail
    sub $I11, rx1037_pos, rx1037_off
    substr $S10, rx1037_tgt, $I11, 2
    ne $S10, "++", rx1037_fail
    add rx1037_pos, 2
    set_addr $I10, rxcap_1042_fail
    ($I12, $I11) = rx1037_cur."!mark_peek"($I10)
    rx1037_cur."!cursor_pos"($I11)
    ($P10) = rx1037_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1037_pos, "")
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1042_done
  rxcap_1042_fail:
    goto rx1037_fail
  rxcap_1042_done:
  # rx subrule "O" subtype=capture negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1037_fail
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1037_pos = $P10."pos"()
  # rx pass
    rx1037_cur."!cursor_pass"(rx1037_pos, "prefix:sym<++>")
    rx1037_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx1037_pos)
    .return (rx1037_cur)
  rx1037_fail:
.annotate 'line', 447
    (rx1037_rep, rx1037_pos, $I10, $P10) = rx1037_cur."!mark_fail"(0)
    lt rx1037_pos, -1, rx1037_done
    eq rx1037_pos, -1, rx1037_fail
    jump $I10
  rx1037_done:
    rx1037_cur."!cursor_fail"()
    rx1037_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx1037_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("255_1278500537.15927") :method
.annotate 'line', 447
    $P1039 = self."!PREFIX__!subrule"("O", "++")
    new $P1040, "ResizablePMCArray"
    push $P1040, $P1039
    .return ($P1040)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("256_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1044_tgt
    .local int rx1044_pos
    .local int rx1044_off
    .local int rx1044_eos
    .local int rx1044_rep
    .local pmc rx1044_cur
    (rx1044_cur, rx1044_pos, rx1044_tgt) = self."!cursor_start"()
    rx1044_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx1044_cur
    .local pmc match
    .lex "$/", match
    length rx1044_eos, rx1044_tgt
    gt rx1044_pos, rx1044_eos, rx1044_done
    set rx1044_off, 0
    lt rx1044_pos, 2, rx1044_start
    sub rx1044_off, rx1044_pos, 1
    substr rx1044_tgt, rx1044_tgt, rx1044_off
  rx1044_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1048_done
    goto rxscan1048_scan
  rxscan1048_loop:
    ($P10) = rx1044_cur."from"()
    inc $P10
    set rx1044_pos, $P10
    ge rx1044_pos, rx1044_eos, rxscan1048_done
  rxscan1048_scan:
    set_addr $I10, rxscan1048_loop
    rx1044_cur."!mark_push"(0, rx1044_pos, $I10)
  rxscan1048_done:
.annotate 'line', 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1049_fail
    rx1044_cur."!mark_push"(0, rx1044_pos, $I10)
  # rx literal  "--"
    add $I11, rx1044_pos, 2
    gt $I11, rx1044_eos, rx1044_fail
    sub $I11, rx1044_pos, rx1044_off
    substr $S10, rx1044_tgt, $I11, 2
    ne $S10, "--", rx1044_fail
    add rx1044_pos, 2
    set_addr $I10, rxcap_1049_fail
    ($I12, $I11) = rx1044_cur."!mark_peek"($I10)
    rx1044_cur."!cursor_pos"($I11)
    ($P10) = rx1044_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1044_pos, "")
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1049_done
  rxcap_1049_fail:
    goto rx1044_fail
  rxcap_1049_done:
  # rx subrule "O" subtype=capture negate=
    rx1044_cur."!cursor_pos"(rx1044_pos)
    $P10 = rx1044_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1044_fail
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1044_pos = $P10."pos"()
  # rx pass
    rx1044_cur."!cursor_pass"(rx1044_pos, "prefix:sym<-->")
    rx1044_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx1044_pos)
    .return (rx1044_cur)
  rx1044_fail:
.annotate 'line', 447
    (rx1044_rep, rx1044_pos, $I10, $P10) = rx1044_cur."!mark_fail"(0)
    lt rx1044_pos, -1, rx1044_done
    eq rx1044_pos, -1, rx1044_fail
    jump $I10
  rx1044_done:
    rx1044_cur."!cursor_fail"()
    rx1044_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx1044_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("257_1278500537.15927") :method
.annotate 'line', 447
    $P1046 = self."!PREFIX__!subrule"("O", "--")
    new $P1047, "ResizablePMCArray"
    push $P1047, $P1046
    .return ($P1047)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("258_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1051_tgt
    .local int rx1051_pos
    .local int rx1051_off
    .local int rx1051_eos
    .local int rx1051_rep
    .local pmc rx1051_cur
    (rx1051_cur, rx1051_pos, rx1051_tgt) = self."!cursor_start"()
    rx1051_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx1051_cur
    .local pmc match
    .lex "$/", match
    length rx1051_eos, rx1051_tgt
    gt rx1051_pos, rx1051_eos, rx1051_done
    set rx1051_off, 0
    lt rx1051_pos, 2, rx1051_start
    sub rx1051_off, rx1051_pos, 1
    substr rx1051_tgt, rx1051_tgt, rx1051_off
  rx1051_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1055_done
    goto rxscan1055_scan
  rxscan1055_loop:
    ($P10) = rx1051_cur."from"()
    inc $P10
    set rx1051_pos, $P10
    ge rx1051_pos, rx1051_eos, rxscan1055_done
  rxscan1055_scan:
    set_addr $I10, rxscan1055_loop
    rx1051_cur."!mark_push"(0, rx1051_pos, $I10)
  rxscan1055_done:
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1056_fail
    rx1051_cur."!mark_push"(0, rx1051_pos, $I10)
  # rx literal  "++"
    add $I11, rx1051_pos, 2
    gt $I11, rx1051_eos, rx1051_fail
    sub $I11, rx1051_pos, rx1051_off
    substr $S10, rx1051_tgt, $I11, 2
    ne $S10, "++", rx1051_fail
    add rx1051_pos, 2
    set_addr $I10, rxcap_1056_fail
    ($I12, $I11) = rx1051_cur."!mark_peek"($I10)
    rx1051_cur."!cursor_pos"($I11)
    ($P10) = rx1051_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1051_pos, "")
    rx1051_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1056_done
  rxcap_1056_fail:
    goto rx1051_fail
  rxcap_1056_done:
  # rx subrule "O" subtype=capture negate=
    rx1051_cur."!cursor_pos"(rx1051_pos)
    $P10 = rx1051_cur."O"("%autoincrement")
    unless $P10, rx1051_fail
    rx1051_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1051_pos = $P10."pos"()
  # rx pass
    rx1051_cur."!cursor_pass"(rx1051_pos, "postfix:sym<++>")
    rx1051_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx1051_pos)
    .return (rx1051_cur)
  rx1051_fail:
.annotate 'line', 447
    (rx1051_rep, rx1051_pos, $I10, $P10) = rx1051_cur."!mark_fail"(0)
    lt rx1051_pos, -1, rx1051_done
    eq rx1051_pos, -1, rx1051_fail
    jump $I10
  rx1051_done:
    rx1051_cur."!cursor_fail"()
    rx1051_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx1051_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("259_1278500537.15927") :method
.annotate 'line', 447
    $P1053 = self."!PREFIX__!subrule"("O", "++")
    new $P1054, "ResizablePMCArray"
    push $P1054, $P1053
    .return ($P1054)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("260_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1058_tgt
    .local int rx1058_pos
    .local int rx1058_off
    .local int rx1058_eos
    .local int rx1058_rep
    .local pmc rx1058_cur
    (rx1058_cur, rx1058_pos, rx1058_tgt) = self."!cursor_start"()
    rx1058_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx1058_cur
    .local pmc match
    .lex "$/", match
    length rx1058_eos, rx1058_tgt
    gt rx1058_pos, rx1058_eos, rx1058_done
    set rx1058_off, 0
    lt rx1058_pos, 2, rx1058_start
    sub rx1058_off, rx1058_pos, 1
    substr rx1058_tgt, rx1058_tgt, rx1058_off
  rx1058_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1062_done
    goto rxscan1062_scan
  rxscan1062_loop:
    ($P10) = rx1058_cur."from"()
    inc $P10
    set rx1058_pos, $P10
    ge rx1058_pos, rx1058_eos, rxscan1062_done
  rxscan1062_scan:
    set_addr $I10, rxscan1062_loop
    rx1058_cur."!mark_push"(0, rx1058_pos, $I10)
  rxscan1062_done:
.annotate 'line', 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1063_fail
    rx1058_cur."!mark_push"(0, rx1058_pos, $I10)
  # rx literal  "--"
    add $I11, rx1058_pos, 2
    gt $I11, rx1058_eos, rx1058_fail
    sub $I11, rx1058_pos, rx1058_off
    substr $S10, rx1058_tgt, $I11, 2
    ne $S10, "--", rx1058_fail
    add rx1058_pos, 2
    set_addr $I10, rxcap_1063_fail
    ($I12, $I11) = rx1058_cur."!mark_peek"($I10)
    rx1058_cur."!cursor_pos"($I11)
    ($P10) = rx1058_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1058_pos, "")
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1063_done
  rxcap_1063_fail:
    goto rx1058_fail
  rxcap_1063_done:
  # rx subrule "O" subtype=capture negate=
    rx1058_cur."!cursor_pos"(rx1058_pos)
    $P10 = rx1058_cur."O"("%autoincrement")
    unless $P10, rx1058_fail
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1058_pos = $P10."pos"()
  # rx pass
    rx1058_cur."!cursor_pass"(rx1058_pos, "postfix:sym<-->")
    rx1058_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1058_pos)
    .return (rx1058_cur)
  rx1058_fail:
.annotate 'line', 447
    (rx1058_rep, rx1058_pos, $I10, $P10) = rx1058_cur."!mark_fail"(0)
    lt rx1058_pos, -1, rx1058_done
    eq rx1058_pos, -1, rx1058_fail
    jump $I10
  rx1058_done:
    rx1058_cur."!cursor_fail"()
    rx1058_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1058_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("261_1278500537.15927") :method
.annotate 'line', 447
    $P1060 = self."!PREFIX__!subrule"("O", "--")
    new $P1061, "ResizablePMCArray"
    push $P1061, $P1060
    .return ($P1061)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("262_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1065_tgt
    .local int rx1065_pos
    .local int rx1065_off
    .local int rx1065_eos
    .local int rx1065_rep
    .local pmc rx1065_cur
    (rx1065_cur, rx1065_pos, rx1065_tgt) = self."!cursor_start"()
    rx1065_cur."!cursor_debug"("START ", "infix:sym<**>")
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
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1070_fail
    rx1065_cur."!mark_push"(0, rx1065_pos, $I10)
  # rx literal  "**"
    add $I11, rx1065_pos, 2
    gt $I11, rx1065_eos, rx1065_fail
    sub $I11, rx1065_pos, rx1065_off
    substr $S10, rx1065_tgt, $I11, 2
    ne $S10, "**", rx1065_fail
    add rx1065_pos, 2
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
    $P10 = rx1065_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1065_fail
    rx1065_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1065_pos = $P10."pos"()
  # rx pass
    rx1065_cur."!cursor_pass"(rx1065_pos, "infix:sym<**>")
    rx1065_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1065_pos)
    .return (rx1065_cur)
  rx1065_fail:
.annotate 'line', 447
    (rx1065_rep, rx1065_pos, $I10, $P10) = rx1065_cur."!mark_fail"(0)
    lt rx1065_pos, -1, rx1065_done
    eq rx1065_pos, -1, rx1065_fail
    jump $I10
  rx1065_done:
    rx1065_cur."!cursor_fail"()
    rx1065_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1065_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("263_1278500537.15927") :method
.annotate 'line', 447
    $P1067 = self."!PREFIX__!subrule"("O", "**")
    new $P1068, "ResizablePMCArray"
    push $P1068, $P1067
    .return ($P1068)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("264_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1072_tgt
    .local int rx1072_pos
    .local int rx1072_off
    .local int rx1072_eos
    .local int rx1072_rep
    .local pmc rx1072_cur
    (rx1072_cur, rx1072_pos, rx1072_tgt) = self."!cursor_start"()
    rx1072_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1077_fail
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  # rx literal  "+"
    add $I11, rx1072_pos, 1
    gt $I11, rx1072_eos, rx1072_fail
    sub $I11, rx1072_pos, rx1072_off
    substr $S10, rx1072_tgt, $I11, 1
    ne $S10, "+", rx1072_fail
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
    $P10 = rx1072_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1072_fail
    rx1072_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1072_pos = $P10."pos"()
  # rx pass
    rx1072_cur."!cursor_pass"(rx1072_pos, "prefix:sym<+>")
    rx1072_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1072_pos)
    .return (rx1072_cur)
  rx1072_fail:
.annotate 'line', 447
    (rx1072_rep, rx1072_pos, $I10, $P10) = rx1072_cur."!mark_fail"(0)
    lt rx1072_pos, -1, rx1072_done
    eq rx1072_pos, -1, rx1072_fail
    jump $I10
  rx1072_done:
    rx1072_cur."!cursor_fail"()
    rx1072_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1072_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("265_1278500537.15927") :method
.annotate 'line', 447
    $P1074 = self."!PREFIX__!subrule"("O", "+")
    new $P1075, "ResizablePMCArray"
    push $P1075, $P1074
    .return ($P1075)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("266_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1079_tgt
    .local int rx1079_pos
    .local int rx1079_off
    .local int rx1079_eos
    .local int rx1079_rep
    .local pmc rx1079_cur
    (rx1079_cur, rx1079_pos, rx1079_tgt) = self."!cursor_start"()
    rx1079_cur."!cursor_debug"("START ", "prefix:sym<~>")
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
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1084_fail
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  # rx literal  "~"
    add $I11, rx1079_pos, 1
    gt $I11, rx1079_eos, rx1079_fail
    sub $I11, rx1079_pos, rx1079_off
    substr $S10, rx1079_tgt, $I11, 1
    ne $S10, "~", rx1079_fail
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
    $P10 = rx1079_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1079_fail
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1079_pos = $P10."pos"()
  # rx pass
    rx1079_cur."!cursor_pass"(rx1079_pos, "prefix:sym<~>")
    rx1079_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1079_pos)
    .return (rx1079_cur)
  rx1079_fail:
.annotate 'line', 447
    (rx1079_rep, rx1079_pos, $I10, $P10) = rx1079_cur."!mark_fail"(0)
    lt rx1079_pos, -1, rx1079_done
    eq rx1079_pos, -1, rx1079_fail
    jump $I10
  rx1079_done:
    rx1079_cur."!cursor_fail"()
    rx1079_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1079_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("267_1278500537.15927") :method
.annotate 'line', 447
    $P1081 = self."!PREFIX__!subrule"("O", "~")
    new $P1082, "ResizablePMCArray"
    push $P1082, $P1081
    .return ($P1082)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("268_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1086_tgt
    .local int rx1086_pos
    .local int rx1086_off
    .local int rx1086_eos
    .local int rx1086_rep
    .local pmc rx1086_cur
    (rx1086_cur, rx1086_pos, rx1086_tgt) = self."!cursor_start"()
    rx1086_cur."!cursor_debug"("START ", "prefix:sym<->")
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
    ne $I10, -1, rxscan1089_done
    goto rxscan1089_scan
  rxscan1089_loop:
    ($P10) = rx1086_cur."from"()
    inc $P10
    set rx1086_pos, $P10
    ge rx1086_pos, rx1086_eos, rxscan1089_done
  rxscan1089_scan:
    set_addr $I10, rxscan1089_loop
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  rxscan1089_done:
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1090_fail
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  # rx literal  "-"
    add $I11, rx1086_pos, 1
    gt $I11, rx1086_eos, rx1086_fail
    sub $I11, rx1086_pos, rx1086_off
    substr $S10, rx1086_tgt, $I11, 1
    ne $S10, "-", rx1086_fail
    add rx1086_pos, 1
    set_addr $I10, rxcap_1090_fail
    ($I12, $I11) = rx1086_cur."!mark_peek"($I10)
    rx1086_cur."!cursor_pos"($I11)
    ($P10) = rx1086_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1086_pos, "")
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1090_done
  rxcap_1090_fail:
    goto rx1086_fail
  rxcap_1090_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1086_pos, rx1086_eos, rx1086_fail
    sub $I10, rx1086_pos, rx1086_off
    substr $S10, rx1086_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1086_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1086_cur."!cursor_pos"(rx1086_pos)
    $P10 = rx1086_cur."number"()
    if $P10, rx1086_fail
  # rx subrule "O" subtype=capture negate=
    rx1086_cur."!cursor_pos"(rx1086_pos)
    $P10 = rx1086_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1086_fail
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1086_pos = $P10."pos"()
  # rx pass
    rx1086_cur."!cursor_pass"(rx1086_pos, "prefix:sym<->")
    rx1086_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1086_pos)
    .return (rx1086_cur)
  rx1086_fail:
.annotate 'line', 447
    (rx1086_rep, rx1086_pos, $I10, $P10) = rx1086_cur."!mark_fail"(0)
    lt rx1086_pos, -1, rx1086_done
    eq rx1086_pos, -1, rx1086_fail
    jump $I10
  rx1086_done:
    rx1086_cur."!cursor_fail"()
    rx1086_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1086_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("269_1278500537.15927") :method
.annotate 'line', 447
    new $P1088, "ResizablePMCArray"
    push $P1088, "-"
    .return ($P1088)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("270_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    (rx1092_cur, rx1092_pos, rx1092_tgt) = self."!cursor_start"()
    rx1092_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx1092_cur
    .local pmc match
    .lex "$/", match
    length rx1092_eos, rx1092_tgt
    gt rx1092_pos, rx1092_eos, rx1092_done
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1097_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  "?"
    add $I11, rx1092_pos, 1
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    substr $S10, rx1092_tgt, $I11, 1
    ne $S10, "?", rx1092_fail
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
    $P10 = rx1092_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "prefix:sym<?>")
    rx1092_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1092_pos)
    .return (rx1092_cur)
  rx1092_fail:
.annotate 'line', 447
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    rx1092_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1092_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("271_1278500537.15927") :method
.annotate 'line', 447
    $P1094 = self."!PREFIX__!subrule"("O", "?")
    new $P1095, "ResizablePMCArray"
    push $P1095, $P1094
    .return ($P1095)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("272_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    (rx1099_cur, rx1099_pos, rx1099_tgt) = self."!cursor_start"()
    rx1099_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1099_cur
    .local pmc match
    .lex "$/", match
    length rx1099_eos, rx1099_tgt
    gt rx1099_pos, rx1099_eos, rx1099_done
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
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1104_fail
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  # rx literal  "!"
    add $I11, rx1099_pos, 1
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    substr $S10, rx1099_tgt, $I11, 1
    ne $S10, "!", rx1099_fail
    add rx1099_pos, 1
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
    $P10 = rx1099_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1099_pos = $P10."pos"()
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "prefix:sym<!>")
    rx1099_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1099_pos)
    .return (rx1099_cur)
  rx1099_fail:
.annotate 'line', 447
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    rx1099_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1099_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("273_1278500537.15927") :method
.annotate 'line', 447
    $P1101 = self."!PREFIX__!subrule"("O", "!")
    new $P1102, "ResizablePMCArray"
    push $P1102, $P1101
    .return ($P1102)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("274_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    (rx1106_cur, rx1106_pos, rx1106_tgt) = self."!cursor_start"()
    rx1106_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1106_cur
    .local pmc match
    .lex "$/", match
    length rx1106_eos, rx1106_tgt
    gt rx1106_pos, rx1106_eos, rx1106_done
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
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1111_fail
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  # rx literal  "|"
    add $I11, rx1106_pos, 1
    gt $I11, rx1106_eos, rx1106_fail
    sub $I11, rx1106_pos, rx1106_off
    substr $S10, rx1106_tgt, $I11, 1
    ne $S10, "|", rx1106_fail
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
    $P10 = rx1106_cur."O"("%symbolic_unary")
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1106_pos = $P10."pos"()
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "prefix:sym<|>")
    rx1106_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1106_pos)
    .return (rx1106_cur)
  rx1106_fail:
.annotate 'line', 447
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    rx1106_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("275_1278500537.15927") :method
.annotate 'line', 447
    $P1108 = self."!PREFIX__!subrule"("O", "|")
    new $P1109, "ResizablePMCArray"
    push $P1109, $P1108
    .return ($P1109)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("276_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1113_tgt
    .local int rx1113_pos
    .local int rx1113_off
    .local int rx1113_eos
    .local int rx1113_rep
    .local pmc rx1113_cur
    (rx1113_cur, rx1113_pos, rx1113_tgt) = self."!cursor_start"()
    rx1113_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1113_cur
    .local pmc match
    .lex "$/", match
    length rx1113_eos, rx1113_tgt
    gt rx1113_pos, rx1113_eos, rx1113_done
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
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1118_fail
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  # rx literal  "*"
    add $I11, rx1113_pos, 1
    gt $I11, rx1113_eos, rx1113_fail
    sub $I11, rx1113_pos, rx1113_off
    substr $S10, rx1113_tgt, $I11, 1
    ne $S10, "*", rx1113_fail
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
    $P10 = rx1113_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1113_fail
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1113_pos = $P10."pos"()
  # rx pass
    rx1113_cur."!cursor_pass"(rx1113_pos, "infix:sym<*>")
    rx1113_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1113_pos)
    .return (rx1113_cur)
  rx1113_fail:
.annotate 'line', 447
    (rx1113_rep, rx1113_pos, $I10, $P10) = rx1113_cur."!mark_fail"(0)
    lt rx1113_pos, -1, rx1113_done
    eq rx1113_pos, -1, rx1113_fail
    jump $I10
  rx1113_done:
    rx1113_cur."!cursor_fail"()
    rx1113_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1113_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("277_1278500537.15927") :method
.annotate 'line', 447
    $P1115 = self."!PREFIX__!subrule"("O", "*")
    new $P1116, "ResizablePMCArray"
    push $P1116, $P1115
    .return ($P1116)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("278_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1120_tgt
    .local int rx1120_pos
    .local int rx1120_off
    .local int rx1120_eos
    .local int rx1120_rep
    .local pmc rx1120_cur
    (rx1120_cur, rx1120_pos, rx1120_tgt) = self."!cursor_start"()
    rx1120_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1120_cur
    .local pmc match
    .lex "$/", match
    length rx1120_eos, rx1120_tgt
    gt rx1120_pos, rx1120_eos, rx1120_done
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
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1125_fail
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  # rx literal  "/"
    add $I11, rx1120_pos, 1
    gt $I11, rx1120_eos, rx1120_fail
    sub $I11, rx1120_pos, rx1120_off
    substr $S10, rx1120_tgt, $I11, 1
    ne $S10, "/", rx1120_fail
    add rx1120_pos, 1
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
    $P10 = rx1120_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1120_fail
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1120_pos = $P10."pos"()
  # rx pass
    rx1120_cur."!cursor_pass"(rx1120_pos, "infix:sym</>")
    rx1120_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1120_pos)
    .return (rx1120_cur)
  rx1120_fail:
.annotate 'line', 447
    (rx1120_rep, rx1120_pos, $I10, $P10) = rx1120_cur."!mark_fail"(0)
    lt rx1120_pos, -1, rx1120_done
    eq rx1120_pos, -1, rx1120_fail
    jump $I10
  rx1120_done:
    rx1120_cur."!cursor_fail"()
    rx1120_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1120_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("279_1278500537.15927") :method
.annotate 'line', 447
    $P1122 = self."!PREFIX__!subrule"("O", "/")
    new $P1123, "ResizablePMCArray"
    push $P1123, $P1122
    .return ($P1123)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("280_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1127_tgt
    .local int rx1127_pos
    .local int rx1127_off
    .local int rx1127_eos
    .local int rx1127_rep
    .local pmc rx1127_cur
    (rx1127_cur, rx1127_pos, rx1127_tgt) = self."!cursor_start"()
    rx1127_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1127_cur
    .local pmc match
    .lex "$/", match
    length rx1127_eos, rx1127_tgt
    gt rx1127_pos, rx1127_eos, rx1127_done
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
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1132_fail
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  # rx literal  "%"
    add $I11, rx1127_pos, 1
    gt $I11, rx1127_eos, rx1127_fail
    sub $I11, rx1127_pos, rx1127_off
    substr $S10, rx1127_tgt, $I11, 1
    ne $S10, "%", rx1127_fail
    add rx1127_pos, 1
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
    $P10 = rx1127_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1127_fail
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1127_pos = $P10."pos"()
  # rx pass
    rx1127_cur."!cursor_pass"(rx1127_pos, "infix:sym<%>")
    rx1127_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1127_pos)
    .return (rx1127_cur)
  rx1127_fail:
.annotate 'line', 447
    (rx1127_rep, rx1127_pos, $I10, $P10) = rx1127_cur."!mark_fail"(0)
    lt rx1127_pos, -1, rx1127_done
    eq rx1127_pos, -1, rx1127_fail
    jump $I10
  rx1127_done:
    rx1127_cur."!cursor_fail"()
    rx1127_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1127_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("281_1278500537.15927") :method
.annotate 'line', 447
    $P1129 = self."!PREFIX__!subrule"("O", "%")
    new $P1130, "ResizablePMCArray"
    push $P1130, $P1129
    .return ($P1130)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("282_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1134_tgt
    .local int rx1134_pos
    .local int rx1134_off
    .local int rx1134_eos
    .local int rx1134_rep
    .local pmc rx1134_cur
    (rx1134_cur, rx1134_pos, rx1134_tgt) = self."!cursor_start"()
    rx1134_cur."!cursor_debug"("START ", "infix:sym<+&>")
    .lex unicode:"$\x{a2}", rx1134_cur
    .local pmc match
    .lex "$/", match
    length rx1134_eos, rx1134_tgt
    gt rx1134_pos, rx1134_eos, rx1134_done
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
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1139_fail
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  # rx literal  "+&"
    add $I11, rx1134_pos, 2
    gt $I11, rx1134_eos, rx1134_fail
    sub $I11, rx1134_pos, rx1134_off
    substr $S10, rx1134_tgt, $I11, 2
    ne $S10, "+&", rx1134_fail
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
    $P10 = rx1134_cur."O"("%multiplicative, :pirop<band III>")
    unless $P10, rx1134_fail
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1134_pos = $P10."pos"()
  # rx pass
    rx1134_cur."!cursor_pass"(rx1134_pos, "infix:sym<+&>")
    rx1134_cur."!cursor_debug"("PASS  ", "infix:sym<+&>", " at pos=", rx1134_pos)
    .return (rx1134_cur)
  rx1134_fail:
.annotate 'line', 447
    (rx1134_rep, rx1134_pos, $I10, $P10) = rx1134_cur."!mark_fail"(0)
    lt rx1134_pos, -1, rx1134_done
    eq rx1134_pos, -1, rx1134_fail
    jump $I10
  rx1134_done:
    rx1134_cur."!cursor_fail"()
    rx1134_cur."!cursor_debug"("FAIL  ", "infix:sym<+&>")
    .return (rx1134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("283_1278500537.15927") :method
.annotate 'line', 447
    $P1136 = self."!PREFIX__!subrule"("O", "+&")
    new $P1137, "ResizablePMCArray"
    push $P1137, $P1136
    .return ($P1137)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("284_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1141_tgt
    .local int rx1141_pos
    .local int rx1141_off
    .local int rx1141_eos
    .local int rx1141_rep
    .local pmc rx1141_cur
    (rx1141_cur, rx1141_pos, rx1141_tgt) = self."!cursor_start"()
    rx1141_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1141_cur
    .local pmc match
    .lex "$/", match
    length rx1141_eos, rx1141_tgt
    gt rx1141_pos, rx1141_eos, rx1141_done
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
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1146_fail
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  # rx literal  "+"
    add $I11, rx1141_pos, 1
    gt $I11, rx1141_eos, rx1141_fail
    sub $I11, rx1141_pos, rx1141_off
    substr $S10, rx1141_tgt, $I11, 1
    ne $S10, "+", rx1141_fail
    add rx1141_pos, 1
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
    $P10 = rx1141_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1141_fail
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1141_pos = $P10."pos"()
  # rx pass
    rx1141_cur."!cursor_pass"(rx1141_pos, "infix:sym<+>")
    rx1141_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1141_pos)
    .return (rx1141_cur)
  rx1141_fail:
.annotate 'line', 447
    (rx1141_rep, rx1141_pos, $I10, $P10) = rx1141_cur."!mark_fail"(0)
    lt rx1141_pos, -1, rx1141_done
    eq rx1141_pos, -1, rx1141_fail
    jump $I10
  rx1141_done:
    rx1141_cur."!cursor_fail"()
    rx1141_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("285_1278500537.15927") :method
.annotate 'line', 447
    $P1143 = self."!PREFIX__!subrule"("O", "+")
    new $P1144, "ResizablePMCArray"
    push $P1144, $P1143
    .return ($P1144)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("286_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    (rx1148_cur, rx1148_pos, rx1148_tgt) = self."!cursor_start"()
    rx1148_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1148_cur
    .local pmc match
    .lex "$/", match
    length rx1148_eos, rx1148_tgt
    gt rx1148_pos, rx1148_eos, rx1148_done
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
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  # rx literal  "-"
    add $I11, rx1148_pos, 1
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 1
    ne $S10, "-", rx1148_fail
    add rx1148_pos, 1
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
    $P10 = rx1148_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1148_fail
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1148_pos = $P10."pos"()
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "infix:sym<->")
    rx1148_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1148_pos)
    .return (rx1148_cur)
  rx1148_fail:
.annotate 'line', 447
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    rx1148_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1148_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("287_1278500537.15927") :method
.annotate 'line', 447
    $P1150 = self."!PREFIX__!subrule"("O", "-")
    new $P1151, "ResizablePMCArray"
    push $P1151, $P1150
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("288_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<+|>")
    .lex unicode:"$\x{a2}", rx1155_cur
    .local pmc match
    .lex "$/", match
    length rx1155_eos, rx1155_tgt
    gt rx1155_pos, rx1155_eos, rx1155_done
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
.annotate 'line', 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "+|"
    add $I11, rx1155_pos, 2
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 2
    ne $S10, "+|", rx1155_fail
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
    $P10 = rx1155_cur."O"("%additive, :pirop<bor III>")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<+|>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<+|>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate 'line', 447
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<+|>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("289_1278500537.15927") :method
.annotate 'line', 447
    $P1157 = self."!PREFIX__!subrule"("O", "+|")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("290_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<+^>")
    .lex unicode:"$\x{a2}", rx1162_cur
    .local pmc match
    .lex "$/", match
    length rx1162_eos, rx1162_tgt
    gt rx1162_pos, rx1162_eos, rx1162_done
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
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  # rx literal  "+^"
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, "+^", rx1162_fail
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
    $P10 = rx1162_cur."O"("%additive, :pirop<bxor III>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<+^>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<+^>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate 'line', 447
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<+^>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("291_1278500537.15927") :method
.annotate 'line', 447
    $P1164 = self."!PREFIX__!subrule"("O", "+^")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("292_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1169_cur
    .local pmc match
    .lex "$/", match
    length rx1169_eos, rx1169_tgt
    gt rx1169_pos, rx1169_eos, rx1169_done
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
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1174_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "~"
    add $I11, rx1169_pos, 1
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 1
    ne $S10, "~", rx1169_fail
    add rx1169_pos, 1
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
    $P10 = rx1169_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "infix:sym<~>")
    rx1169_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate 'line', 447
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("293_1278500537.15927") :method
.annotate 'line', 447
    $P1171 = self."!PREFIX__!subrule"("O", "~")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("294_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1176_tgt
    .local int rx1176_pos
    .local int rx1176_off
    .local int rx1176_eos
    .local int rx1176_rep
    .local pmc rx1176_cur
    (rx1176_cur, rx1176_pos, rx1176_tgt) = self."!cursor_start"()
    rx1176_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1176_cur
    .local pmc match
    .lex "$/", match
    length rx1176_eos, rx1176_tgt
    gt rx1176_pos, rx1176_eos, rx1176_done
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
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1181_fail
    rx1176_cur."!mark_push"(0, rx1176_pos, $I10)
  # rx literal  "=="
    add $I11, rx1176_pos, 2
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 2
    ne $S10, "==", rx1176_fail
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
    $P10 = rx1176_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1176_pos = $P10."pos"()
  # rx pass
    rx1176_cur."!cursor_pass"(rx1176_pos, "infix:sym<==>")
    rx1176_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1176_pos)
    .return (rx1176_cur)
  rx1176_fail:
.annotate 'line', 447
    (rx1176_rep, rx1176_pos, $I10, $P10) = rx1176_cur."!mark_fail"(0)
    lt rx1176_pos, -1, rx1176_done
    eq rx1176_pos, -1, rx1176_fail
    jump $I10
  rx1176_done:
    rx1176_cur."!cursor_fail"()
    rx1176_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("295_1278500537.15927") :method
.annotate 'line', 447
    $P1178 = self."!PREFIX__!subrule"("O", "==")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("296_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1183_tgt
    .local int rx1183_pos
    .local int rx1183_off
    .local int rx1183_eos
    .local int rx1183_rep
    .local pmc rx1183_cur
    (rx1183_cur, rx1183_pos, rx1183_tgt) = self."!cursor_start"()
    rx1183_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1183_cur
    .local pmc match
    .lex "$/", match
    length rx1183_eos, rx1183_tgt
    gt rx1183_pos, rx1183_eos, rx1183_done
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
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1188_fail
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  # rx literal  "!="
    add $I11, rx1183_pos, 2
    gt $I11, rx1183_eos, rx1183_fail
    sub $I11, rx1183_pos, rx1183_off
    substr $S10, rx1183_tgt, $I11, 2
    ne $S10, "!=", rx1183_fail
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
    $P10 = rx1183_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1183_fail
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1183_pos = $P10."pos"()
  # rx pass
    rx1183_cur."!cursor_pass"(rx1183_pos, "infix:sym<!=>")
    rx1183_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1183_pos)
    .return (rx1183_cur)
  rx1183_fail:
.annotate 'line', 447
    (rx1183_rep, rx1183_pos, $I10, $P10) = rx1183_cur."!mark_fail"(0)
    lt rx1183_pos, -1, rx1183_done
    eq rx1183_pos, -1, rx1183_fail
    jump $I10
  rx1183_done:
    rx1183_cur."!cursor_fail"()
    rx1183_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("297_1278500537.15927") :method
.annotate 'line', 447
    $P1185 = self."!PREFIX__!subrule"("O", "!=")
    new $P1186, "ResizablePMCArray"
    push $P1186, $P1185
    .return ($P1186)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("298_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1190_tgt
    .local int rx1190_pos
    .local int rx1190_off
    .local int rx1190_eos
    .local int rx1190_rep
    .local pmc rx1190_cur
    (rx1190_cur, rx1190_pos, rx1190_tgt) = self."!cursor_start"()
    rx1190_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1190_cur
    .local pmc match
    .lex "$/", match
    length rx1190_eos, rx1190_tgt
    gt rx1190_pos, rx1190_eos, rx1190_done
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
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1195_fail
    rx1190_cur."!mark_push"(0, rx1190_pos, $I10)
  # rx literal  "<="
    add $I11, rx1190_pos, 2
    gt $I11, rx1190_eos, rx1190_fail
    sub $I11, rx1190_pos, rx1190_off
    substr $S10, rx1190_tgt, $I11, 2
    ne $S10, "<=", rx1190_fail
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
    $P10 = rx1190_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1190_fail
    rx1190_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1190_pos = $P10."pos"()
  # rx pass
    rx1190_cur."!cursor_pass"(rx1190_pos, "infix:sym<<=>")
    rx1190_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1190_pos)
    .return (rx1190_cur)
  rx1190_fail:
.annotate 'line', 447
    (rx1190_rep, rx1190_pos, $I10, $P10) = rx1190_cur."!mark_fail"(0)
    lt rx1190_pos, -1, rx1190_done
    eq rx1190_pos, -1, rx1190_fail
    jump $I10
  rx1190_done:
    rx1190_cur."!cursor_fail"()
    rx1190_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1190_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("299_1278500537.15927") :method
.annotate 'line', 447
    $P1192 = self."!PREFIX__!subrule"("O", "<=")
    new $P1193, "ResizablePMCArray"
    push $P1193, $P1192
    .return ($P1193)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("300_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    (rx1197_cur, rx1197_pos, rx1197_tgt) = self."!cursor_start"()
    rx1197_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1197_cur
    .local pmc match
    .lex "$/", match
    length rx1197_eos, rx1197_tgt
    gt rx1197_pos, rx1197_eos, rx1197_done
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
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1202_fail
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  # rx literal  ">="
    add $I11, rx1197_pos, 2
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 2
    ne $S10, ">=", rx1197_fail
    add rx1197_pos, 2
    set_addr $I10, rxcap_1202_fail
    ($I12, $I11) = rx1197_cur."!mark_peek"($I10)
    rx1197_cur."!cursor_pos"($I11)
    ($P10) = rx1197_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1197_pos, "")
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1202_done
  rxcap_1202_fail:
    goto rx1197_fail
  rxcap_1202_done:
  # rx subrule "O" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1197_pos = $P10."pos"()
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "infix:sym<>=>")
    rx1197_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate 'line', 447
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    rx1197_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("301_1278500537.15927") :method
.annotate 'line', 447
    $P1199 = self."!PREFIX__!subrule"("O", ">=")
    new $P1200, "ResizablePMCArray"
    push $P1200, $P1199
    .return ($P1200)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("302_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1204_tgt
    .local int rx1204_pos
    .local int rx1204_off
    .local int rx1204_eos
    .local int rx1204_rep
    .local pmc rx1204_cur
    (rx1204_cur, rx1204_pos, rx1204_tgt) = self."!cursor_start"()
    rx1204_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1204_cur
    .local pmc match
    .lex "$/", match
    length rx1204_eos, rx1204_tgt
    gt rx1204_pos, rx1204_eos, rx1204_done
    set rx1204_off, 0
    lt rx1204_pos, 2, rx1204_start
    sub rx1204_off, rx1204_pos, 1
    substr rx1204_tgt, rx1204_tgt, rx1204_off
  rx1204_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1208_done
    goto rxscan1208_scan
  rxscan1208_loop:
    ($P10) = rx1204_cur."from"()
    inc $P10
    set rx1204_pos, $P10
    ge rx1204_pos, rx1204_eos, rxscan1208_done
  rxscan1208_scan:
    set_addr $I10, rxscan1208_loop
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  rxscan1208_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1209_fail
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  # rx literal  "<"
    add $I11, rx1204_pos, 1
    gt $I11, rx1204_eos, rx1204_fail
    sub $I11, rx1204_pos, rx1204_off
    substr $S10, rx1204_tgt, $I11, 1
    ne $S10, "<", rx1204_fail
    add rx1204_pos, 1
    set_addr $I10, rxcap_1209_fail
    ($I12, $I11) = rx1204_cur."!mark_peek"($I10)
    rx1204_cur."!cursor_pos"($I11)
    ($P10) = rx1204_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1204_pos, "")
    rx1204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1209_done
  rxcap_1209_fail:
    goto rx1204_fail
  rxcap_1209_done:
  # rx subrule "O" subtype=capture negate=
    rx1204_cur."!cursor_pos"(rx1204_pos)
    $P10 = rx1204_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1204_fail
    rx1204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1204_pos = $P10."pos"()
  # rx pass
    rx1204_cur."!cursor_pass"(rx1204_pos, "infix:sym<<>")
    rx1204_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1204_pos)
    .return (rx1204_cur)
  rx1204_fail:
.annotate 'line', 447
    (rx1204_rep, rx1204_pos, $I10, $P10) = rx1204_cur."!mark_fail"(0)
    lt rx1204_pos, -1, rx1204_done
    eq rx1204_pos, -1, rx1204_fail
    jump $I10
  rx1204_done:
    rx1204_cur."!cursor_fail"()
    rx1204_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("303_1278500537.15927") :method
.annotate 'line', 447
    $P1206 = self."!PREFIX__!subrule"("O", "<")
    new $P1207, "ResizablePMCArray"
    push $P1207, $P1206
    .return ($P1207)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("304_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1211_tgt
    .local int rx1211_pos
    .local int rx1211_off
    .local int rx1211_eos
    .local int rx1211_rep
    .local pmc rx1211_cur
    (rx1211_cur, rx1211_pos, rx1211_tgt) = self."!cursor_start"()
    rx1211_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1211_cur
    .local pmc match
    .lex "$/", match
    length rx1211_eos, rx1211_tgt
    gt rx1211_pos, rx1211_eos, rx1211_done
    set rx1211_off, 0
    lt rx1211_pos, 2, rx1211_start
    sub rx1211_off, rx1211_pos, 1
    substr rx1211_tgt, rx1211_tgt, rx1211_off
  rx1211_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1215_done
    goto rxscan1215_scan
  rxscan1215_loop:
    ($P10) = rx1211_cur."from"()
    inc $P10
    set rx1211_pos, $P10
    ge rx1211_pos, rx1211_eos, rxscan1215_done
  rxscan1215_scan:
    set_addr $I10, rxscan1215_loop
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  rxscan1215_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1216_fail
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  # rx literal  ">"
    add $I11, rx1211_pos, 1
    gt $I11, rx1211_eos, rx1211_fail
    sub $I11, rx1211_pos, rx1211_off
    substr $S10, rx1211_tgt, $I11, 1
    ne $S10, ">", rx1211_fail
    add rx1211_pos, 1
    set_addr $I10, rxcap_1216_fail
    ($I12, $I11) = rx1211_cur."!mark_peek"($I10)
    rx1211_cur."!cursor_pos"($I11)
    ($P10) = rx1211_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1211_pos, "")
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1216_done
  rxcap_1216_fail:
    goto rx1211_fail
  rxcap_1216_done:
  # rx subrule "O" subtype=capture negate=
    rx1211_cur."!cursor_pos"(rx1211_pos)
    $P10 = rx1211_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1211_fail
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1211_pos = $P10."pos"()
  # rx pass
    rx1211_cur."!cursor_pass"(rx1211_pos, "infix:sym<>>")
    rx1211_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1211_pos)
    .return (rx1211_cur)
  rx1211_fail:
.annotate 'line', 447
    (rx1211_rep, rx1211_pos, $I10, $P10) = rx1211_cur."!mark_fail"(0)
    lt rx1211_pos, -1, rx1211_done
    eq rx1211_pos, -1, rx1211_fail
    jump $I10
  rx1211_done:
    rx1211_cur."!cursor_fail"()
    rx1211_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1211_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("305_1278500537.15927") :method
.annotate 'line', 447
    $P1213 = self."!PREFIX__!subrule"("O", ">")
    new $P1214, "ResizablePMCArray"
    push $P1214, $P1213
    .return ($P1214)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("306_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1218_tgt
    .local int rx1218_pos
    .local int rx1218_off
    .local int rx1218_eos
    .local int rx1218_rep
    .local pmc rx1218_cur
    (rx1218_cur, rx1218_pos, rx1218_tgt) = self."!cursor_start"()
    rx1218_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1218_cur
    .local pmc match
    .lex "$/", match
    length rx1218_eos, rx1218_tgt
    gt rx1218_pos, rx1218_eos, rx1218_done
    set rx1218_off, 0
    lt rx1218_pos, 2, rx1218_start
    sub rx1218_off, rx1218_pos, 1
    substr rx1218_tgt, rx1218_tgt, rx1218_off
  rx1218_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1222_done
    goto rxscan1222_scan
  rxscan1222_loop:
    ($P10) = rx1218_cur."from"()
    inc $P10
    set rx1218_pos, $P10
    ge rx1218_pos, rx1218_eos, rxscan1222_done
  rxscan1222_scan:
    set_addr $I10, rxscan1222_loop
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  rxscan1222_done:
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1223_fail
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1218_pos, 2
    gt $I11, rx1218_eos, rx1218_fail
    sub $I11, rx1218_pos, rx1218_off
    substr $S10, rx1218_tgt, $I11, 2
    ne $S10, "eq", rx1218_fail
    add rx1218_pos, 2
    set_addr $I10, rxcap_1223_fail
    ($I12, $I11) = rx1218_cur."!mark_peek"($I10)
    rx1218_cur."!cursor_pos"($I11)
    ($P10) = rx1218_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1218_pos, "")
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1223_done
  rxcap_1223_fail:
    goto rx1218_fail
  rxcap_1223_done:
  # rx subrule "O" subtype=capture negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1218_fail
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1218_pos = $P10."pos"()
  # rx pass
    rx1218_cur."!cursor_pass"(rx1218_pos, "infix:sym<eq>")
    rx1218_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1218_pos)
    .return (rx1218_cur)
  rx1218_fail:
.annotate 'line', 447
    (rx1218_rep, rx1218_pos, $I10, $P10) = rx1218_cur."!mark_fail"(0)
    lt rx1218_pos, -1, rx1218_done
    eq rx1218_pos, -1, rx1218_fail
    jump $I10
  rx1218_done:
    rx1218_cur."!cursor_fail"()
    rx1218_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("307_1278500537.15927") :method
.annotate 'line', 447
    $P1220 = self."!PREFIX__!subrule"("O", "eq")
    new $P1221, "ResizablePMCArray"
    push $P1221, $P1220
    .return ($P1221)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("308_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1225_tgt
    .local int rx1225_pos
    .local int rx1225_off
    .local int rx1225_eos
    .local int rx1225_rep
    .local pmc rx1225_cur
    (rx1225_cur, rx1225_pos, rx1225_tgt) = self."!cursor_start"()
    rx1225_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1225_cur
    .local pmc match
    .lex "$/", match
    length rx1225_eos, rx1225_tgt
    gt rx1225_pos, rx1225_eos, rx1225_done
    set rx1225_off, 0
    lt rx1225_pos, 2, rx1225_start
    sub rx1225_off, rx1225_pos, 1
    substr rx1225_tgt, rx1225_tgt, rx1225_off
  rx1225_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1229_done
    goto rxscan1229_scan
  rxscan1229_loop:
    ($P10) = rx1225_cur."from"()
    inc $P10
    set rx1225_pos, $P10
    ge rx1225_pos, rx1225_eos, rxscan1229_done
  rxscan1229_scan:
    set_addr $I10, rxscan1229_loop
    rx1225_cur."!mark_push"(0, rx1225_pos, $I10)
  rxscan1229_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1230_fail
    rx1225_cur."!mark_push"(0, rx1225_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1225_pos, 2
    gt $I11, rx1225_eos, rx1225_fail
    sub $I11, rx1225_pos, rx1225_off
    substr $S10, rx1225_tgt, $I11, 2
    ne $S10, "ne", rx1225_fail
    add rx1225_pos, 2
    set_addr $I10, rxcap_1230_fail
    ($I12, $I11) = rx1225_cur."!mark_peek"($I10)
    rx1225_cur."!cursor_pos"($I11)
    ($P10) = rx1225_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1225_pos, "")
    rx1225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1230_done
  rxcap_1230_fail:
    goto rx1225_fail
  rxcap_1230_done:
  # rx subrule "O" subtype=capture negate=
    rx1225_cur."!cursor_pos"(rx1225_pos)
    $P10 = rx1225_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1225_fail
    rx1225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1225_pos = $P10."pos"()
  # rx pass
    rx1225_cur."!cursor_pass"(rx1225_pos, "infix:sym<ne>")
    rx1225_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1225_pos)
    .return (rx1225_cur)
  rx1225_fail:
.annotate 'line', 447
    (rx1225_rep, rx1225_pos, $I10, $P10) = rx1225_cur."!mark_fail"(0)
    lt rx1225_pos, -1, rx1225_done
    eq rx1225_pos, -1, rx1225_fail
    jump $I10
  rx1225_done:
    rx1225_cur."!cursor_fail"()
    rx1225_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1225_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("309_1278500537.15927") :method
.annotate 'line', 447
    $P1227 = self."!PREFIX__!subrule"("O", "ne")
    new $P1228, "ResizablePMCArray"
    push $P1228, $P1227
    .return ($P1228)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("310_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1232_tgt
    .local int rx1232_pos
    .local int rx1232_off
    .local int rx1232_eos
    .local int rx1232_rep
    .local pmc rx1232_cur
    (rx1232_cur, rx1232_pos, rx1232_tgt) = self."!cursor_start"()
    rx1232_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1232_cur
    .local pmc match
    .lex "$/", match
    length rx1232_eos, rx1232_tgt
    gt rx1232_pos, rx1232_eos, rx1232_done
    set rx1232_off, 0
    lt rx1232_pos, 2, rx1232_start
    sub rx1232_off, rx1232_pos, 1
    substr rx1232_tgt, rx1232_tgt, rx1232_off
  rx1232_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1236_done
    goto rxscan1236_scan
  rxscan1236_loop:
    ($P10) = rx1232_cur."from"()
    inc $P10
    set rx1232_pos, $P10
    ge rx1232_pos, rx1232_eos, rxscan1236_done
  rxscan1236_scan:
    set_addr $I10, rxscan1236_loop
    rx1232_cur."!mark_push"(0, rx1232_pos, $I10)
  rxscan1236_done:
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1237_fail
    rx1232_cur."!mark_push"(0, rx1232_pos, $I10)
  # rx literal  "le"
    add $I11, rx1232_pos, 2
    gt $I11, rx1232_eos, rx1232_fail
    sub $I11, rx1232_pos, rx1232_off
    substr $S10, rx1232_tgt, $I11, 2
    ne $S10, "le", rx1232_fail
    add rx1232_pos, 2
    set_addr $I10, rxcap_1237_fail
    ($I12, $I11) = rx1232_cur."!mark_peek"($I10)
    rx1232_cur."!cursor_pos"($I11)
    ($P10) = rx1232_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1232_pos, "")
    rx1232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1237_done
  rxcap_1237_fail:
    goto rx1232_fail
  rxcap_1237_done:
  # rx subrule "O" subtype=capture negate=
    rx1232_cur."!cursor_pos"(rx1232_pos)
    $P10 = rx1232_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1232_fail
    rx1232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1232_pos = $P10."pos"()
  # rx pass
    rx1232_cur."!cursor_pass"(rx1232_pos, "infix:sym<le>")
    rx1232_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1232_pos)
    .return (rx1232_cur)
  rx1232_fail:
.annotate 'line', 447
    (rx1232_rep, rx1232_pos, $I10, $P10) = rx1232_cur."!mark_fail"(0)
    lt rx1232_pos, -1, rx1232_done
    eq rx1232_pos, -1, rx1232_fail
    jump $I10
  rx1232_done:
    rx1232_cur."!cursor_fail"()
    rx1232_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("311_1278500537.15927") :method
.annotate 'line', 447
    $P1234 = self."!PREFIX__!subrule"("O", "le")
    new $P1235, "ResizablePMCArray"
    push $P1235, $P1234
    .return ($P1235)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("312_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1239_tgt
    .local int rx1239_pos
    .local int rx1239_off
    .local int rx1239_eos
    .local int rx1239_rep
    .local pmc rx1239_cur
    (rx1239_cur, rx1239_pos, rx1239_tgt) = self."!cursor_start"()
    rx1239_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1239_cur
    .local pmc match
    .lex "$/", match
    length rx1239_eos, rx1239_tgt
    gt rx1239_pos, rx1239_eos, rx1239_done
    set rx1239_off, 0
    lt rx1239_pos, 2, rx1239_start
    sub rx1239_off, rx1239_pos, 1
    substr rx1239_tgt, rx1239_tgt, rx1239_off
  rx1239_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1243_done
    goto rxscan1243_scan
  rxscan1243_loop:
    ($P10) = rx1239_cur."from"()
    inc $P10
    set rx1239_pos, $P10
    ge rx1239_pos, rx1239_eos, rxscan1243_done
  rxscan1243_scan:
    set_addr $I10, rxscan1243_loop
    rx1239_cur."!mark_push"(0, rx1239_pos, $I10)
  rxscan1243_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1244_fail
    rx1239_cur."!mark_push"(0, rx1239_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1239_pos, 2
    gt $I11, rx1239_eos, rx1239_fail
    sub $I11, rx1239_pos, rx1239_off
    substr $S10, rx1239_tgt, $I11, 2
    ne $S10, "ge", rx1239_fail
    add rx1239_pos, 2
    set_addr $I10, rxcap_1244_fail
    ($I12, $I11) = rx1239_cur."!mark_peek"($I10)
    rx1239_cur."!cursor_pos"($I11)
    ($P10) = rx1239_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1239_pos, "")
    rx1239_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1244_done
  rxcap_1244_fail:
    goto rx1239_fail
  rxcap_1244_done:
  # rx subrule "O" subtype=capture negate=
    rx1239_cur."!cursor_pos"(rx1239_pos)
    $P10 = rx1239_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1239_fail
    rx1239_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1239_pos = $P10."pos"()
  # rx pass
    rx1239_cur."!cursor_pass"(rx1239_pos, "infix:sym<ge>")
    rx1239_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1239_pos)
    .return (rx1239_cur)
  rx1239_fail:
.annotate 'line', 447
    (rx1239_rep, rx1239_pos, $I10, $P10) = rx1239_cur."!mark_fail"(0)
    lt rx1239_pos, -1, rx1239_done
    eq rx1239_pos, -1, rx1239_fail
    jump $I10
  rx1239_done:
    rx1239_cur."!cursor_fail"()
    rx1239_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1239_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("313_1278500537.15927") :method
.annotate 'line', 447
    $P1241 = self."!PREFIX__!subrule"("O", "ge")
    new $P1242, "ResizablePMCArray"
    push $P1242, $P1241
    .return ($P1242)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("314_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1246_tgt
    .local int rx1246_pos
    .local int rx1246_off
    .local int rx1246_eos
    .local int rx1246_rep
    .local pmc rx1246_cur
    (rx1246_cur, rx1246_pos, rx1246_tgt) = self."!cursor_start"()
    rx1246_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1246_cur
    .local pmc match
    .lex "$/", match
    length rx1246_eos, rx1246_tgt
    gt rx1246_pos, rx1246_eos, rx1246_done
    set rx1246_off, 0
    lt rx1246_pos, 2, rx1246_start
    sub rx1246_off, rx1246_pos, 1
    substr rx1246_tgt, rx1246_tgt, rx1246_off
  rx1246_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1250_done
    goto rxscan1250_scan
  rxscan1250_loop:
    ($P10) = rx1246_cur."from"()
    inc $P10
    set rx1246_pos, $P10
    ge rx1246_pos, rx1246_eos, rxscan1250_done
  rxscan1250_scan:
    set_addr $I10, rxscan1250_loop
    rx1246_cur."!mark_push"(0, rx1246_pos, $I10)
  rxscan1250_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1251_fail
    rx1246_cur."!mark_push"(0, rx1246_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1246_pos, 2
    gt $I11, rx1246_eos, rx1246_fail
    sub $I11, rx1246_pos, rx1246_off
    substr $S10, rx1246_tgt, $I11, 2
    ne $S10, "lt", rx1246_fail
    add rx1246_pos, 2
    set_addr $I10, rxcap_1251_fail
    ($I12, $I11) = rx1246_cur."!mark_peek"($I10)
    rx1246_cur."!cursor_pos"($I11)
    ($P10) = rx1246_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1246_pos, "")
    rx1246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1251_done
  rxcap_1251_fail:
    goto rx1246_fail
  rxcap_1251_done:
  # rx subrule "O" subtype=capture negate=
    rx1246_cur."!cursor_pos"(rx1246_pos)
    $P10 = rx1246_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1246_fail
    rx1246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1246_pos = $P10."pos"()
  # rx pass
    rx1246_cur."!cursor_pass"(rx1246_pos, "infix:sym<lt>")
    rx1246_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1246_pos)
    .return (rx1246_cur)
  rx1246_fail:
.annotate 'line', 447
    (rx1246_rep, rx1246_pos, $I10, $P10) = rx1246_cur."!mark_fail"(0)
    lt rx1246_pos, -1, rx1246_done
    eq rx1246_pos, -1, rx1246_fail
    jump $I10
  rx1246_done:
    rx1246_cur."!cursor_fail"()
    rx1246_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("315_1278500537.15927") :method
.annotate 'line', 447
    $P1248 = self."!PREFIX__!subrule"("O", "lt")
    new $P1249, "ResizablePMCArray"
    push $P1249, $P1248
    .return ($P1249)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("316_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1253_tgt
    .local int rx1253_pos
    .local int rx1253_off
    .local int rx1253_eos
    .local int rx1253_rep
    .local pmc rx1253_cur
    (rx1253_cur, rx1253_pos, rx1253_tgt) = self."!cursor_start"()
    rx1253_cur."!cursor_debug"("START ", "infix:sym<gt>")
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
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1258_fail
    rx1253_cur."!mark_push"(0, rx1253_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1253_pos, 2
    gt $I11, rx1253_eos, rx1253_fail
    sub $I11, rx1253_pos, rx1253_off
    substr $S10, rx1253_tgt, $I11, 2
    ne $S10, "gt", rx1253_fail
    add rx1253_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx1253_cur."!cursor_pos"(rx1253_pos)
    $P10 = rx1253_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1253_fail
    rx1253_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1253_pos = $P10."pos"()
  # rx pass
    rx1253_cur."!cursor_pass"(rx1253_pos, "infix:sym<gt>")
    rx1253_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1253_pos)
    .return (rx1253_cur)
  rx1253_fail:
.annotate 'line', 447
    (rx1253_rep, rx1253_pos, $I10, $P10) = rx1253_cur."!mark_fail"(0)
    lt rx1253_pos, -1, rx1253_done
    eq rx1253_pos, -1, rx1253_fail
    jump $I10
  rx1253_done:
    rx1253_cur."!cursor_fail"()
    rx1253_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1253_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("317_1278500537.15927") :method
.annotate 'line', 447
    $P1255 = self."!PREFIX__!subrule"("O", "gt")
    new $P1256, "ResizablePMCArray"
    push $P1256, $P1255
    .return ($P1256)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("318_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1260_tgt
    .local int rx1260_pos
    .local int rx1260_off
    .local int rx1260_eos
    .local int rx1260_rep
    .local pmc rx1260_cur
    (rx1260_cur, rx1260_pos, rx1260_tgt) = self."!cursor_start"()
    rx1260_cur."!cursor_debug"("START ", "infix:sym<=:=>")
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
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1265_fail
    rx1260_cur."!mark_push"(0, rx1260_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1260_pos, 3
    gt $I11, rx1260_eos, rx1260_fail
    sub $I11, rx1260_pos, rx1260_off
    substr $S10, rx1260_tgt, $I11, 3
    ne $S10, "=:=", rx1260_fail
    add rx1260_pos, 3
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
    $P10 = rx1260_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1260_fail
    rx1260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1260_pos = $P10."pos"()
  # rx pass
    rx1260_cur."!cursor_pass"(rx1260_pos, "infix:sym<=:=>")
    rx1260_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1260_pos)
    .return (rx1260_cur)
  rx1260_fail:
.annotate 'line', 447
    (rx1260_rep, rx1260_pos, $I10, $P10) = rx1260_cur."!mark_fail"(0)
    lt rx1260_pos, -1, rx1260_done
    eq rx1260_pos, -1, rx1260_fail
    jump $I10
  rx1260_done:
    rx1260_cur."!cursor_fail"()
    rx1260_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1260_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("319_1278500537.15927") :method
.annotate 'line', 447
    $P1262 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1263, "ResizablePMCArray"
    push $P1263, $P1262
    .return ($P1263)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("320_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1267_tgt
    .local int rx1267_pos
    .local int rx1267_off
    .local int rx1267_eos
    .local int rx1267_rep
    .local pmc rx1267_cur
    (rx1267_cur, rx1267_pos, rx1267_tgt) = self."!cursor_start"()
    rx1267_cur."!cursor_debug"("START ", "infix:sym<~~>")
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
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1272_fail
    rx1267_cur."!mark_push"(0, rx1267_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1267_pos, 2
    gt $I11, rx1267_eos, rx1267_fail
    sub $I11, rx1267_pos, rx1267_off
    substr $S10, rx1267_tgt, $I11, 2
    ne $S10, "~~", rx1267_fail
    add rx1267_pos, 2
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
    $P10 = rx1267_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1267_fail
    rx1267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1267_pos = $P10."pos"()
  # rx pass
    rx1267_cur."!cursor_pass"(rx1267_pos, "infix:sym<~~>")
    rx1267_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1267_pos)
    .return (rx1267_cur)
  rx1267_fail:
.annotate 'line', 447
    (rx1267_rep, rx1267_pos, $I10, $P10) = rx1267_cur."!mark_fail"(0)
    lt rx1267_pos, -1, rx1267_done
    eq rx1267_pos, -1, rx1267_fail
    jump $I10
  rx1267_done:
    rx1267_cur."!cursor_fail"()
    rx1267_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1267_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("321_1278500537.15927") :method
.annotate 'line', 447
    $P1269 = self."!PREFIX__!subrule"("O", "~~")
    new $P1270, "ResizablePMCArray"
    push $P1270, $P1269
    .return ($P1270)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("322_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1274_tgt
    .local int rx1274_pos
    .local int rx1274_off
    .local int rx1274_eos
    .local int rx1274_rep
    .local pmc rx1274_cur
    (rx1274_cur, rx1274_pos, rx1274_tgt) = self."!cursor_start"()
    rx1274_cur."!cursor_debug"("START ", "infix:sym<&&>")
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
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1279_fail
    rx1274_cur."!mark_push"(0, rx1274_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1274_pos, 2
    gt $I11, rx1274_eos, rx1274_fail
    sub $I11, rx1274_pos, rx1274_off
    substr $S10, rx1274_tgt, $I11, 2
    ne $S10, "&&", rx1274_fail
    add rx1274_pos, 2
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
    $P10 = rx1274_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1274_fail
    rx1274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1274_pos = $P10."pos"()
  # rx pass
    rx1274_cur."!cursor_pass"(rx1274_pos, "infix:sym<&&>")
    rx1274_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1274_pos)
    .return (rx1274_cur)
  rx1274_fail:
.annotate 'line', 447
    (rx1274_rep, rx1274_pos, $I10, $P10) = rx1274_cur."!mark_fail"(0)
    lt rx1274_pos, -1, rx1274_done
    eq rx1274_pos, -1, rx1274_fail
    jump $I10
  rx1274_done:
    rx1274_cur."!cursor_fail"()
    rx1274_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1274_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("323_1278500537.15927") :method
.annotate 'line', 447
    $P1276 = self."!PREFIX__!subrule"("O", "&&")
    new $P1277, "ResizablePMCArray"
    push $P1277, $P1276
    .return ($P1277)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("324_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1281_tgt
    .local int rx1281_pos
    .local int rx1281_off
    .local int rx1281_eos
    .local int rx1281_rep
    .local pmc rx1281_cur
    (rx1281_cur, rx1281_pos, rx1281_tgt) = self."!cursor_start"()
    rx1281_cur."!cursor_debug"("START ", "infix:sym<||>")
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
    ne $I10, -1, rxscan1285_done
    goto rxscan1285_scan
  rxscan1285_loop:
    ($P10) = rx1281_cur."from"()
    inc $P10
    set rx1281_pos, $P10
    ge rx1281_pos, rx1281_eos, rxscan1285_done
  rxscan1285_scan:
    set_addr $I10, rxscan1285_loop
    rx1281_cur."!mark_push"(0, rx1281_pos, $I10)
  rxscan1285_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1286_fail
    rx1281_cur."!mark_push"(0, rx1281_pos, $I10)
  # rx literal  "||"
    add $I11, rx1281_pos, 2
    gt $I11, rx1281_eos, rx1281_fail
    sub $I11, rx1281_pos, rx1281_off
    substr $S10, rx1281_tgt, $I11, 2
    ne $S10, "||", rx1281_fail
    add rx1281_pos, 2
    set_addr $I10, rxcap_1286_fail
    ($I12, $I11) = rx1281_cur."!mark_peek"($I10)
    rx1281_cur."!cursor_pos"($I11)
    ($P10) = rx1281_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1281_pos, "")
    rx1281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1286_done
  rxcap_1286_fail:
    goto rx1281_fail
  rxcap_1286_done:
  # rx subrule "O" subtype=capture negate=
    rx1281_cur."!cursor_pos"(rx1281_pos)
    $P10 = rx1281_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1281_fail
    rx1281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1281_pos = $P10."pos"()
  # rx pass
    rx1281_cur."!cursor_pass"(rx1281_pos, "infix:sym<||>")
    rx1281_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1281_pos)
    .return (rx1281_cur)
  rx1281_fail:
.annotate 'line', 447
    (rx1281_rep, rx1281_pos, $I10, $P10) = rx1281_cur."!mark_fail"(0)
    lt rx1281_pos, -1, rx1281_done
    eq rx1281_pos, -1, rx1281_fail
    jump $I10
  rx1281_done:
    rx1281_cur."!cursor_fail"()
    rx1281_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1281_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("325_1278500537.15927") :method
.annotate 'line', 447
    $P1283 = self."!PREFIX__!subrule"("O", "||")
    new $P1284, "ResizablePMCArray"
    push $P1284, $P1283
    .return ($P1284)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("326_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1288_tgt
    .local int rx1288_pos
    .local int rx1288_off
    .local int rx1288_eos
    .local int rx1288_rep
    .local pmc rx1288_cur
    (rx1288_cur, rx1288_pos, rx1288_tgt) = self."!cursor_start"()
    rx1288_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1288_cur
    .local pmc match
    .lex "$/", match
    length rx1288_eos, rx1288_tgt
    gt rx1288_pos, rx1288_eos, rx1288_done
    set rx1288_off, 0
    lt rx1288_pos, 2, rx1288_start
    sub rx1288_off, rx1288_pos, 1
    substr rx1288_tgt, rx1288_tgt, rx1288_off
  rx1288_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1292_done
    goto rxscan1292_scan
  rxscan1292_loop:
    ($P10) = rx1288_cur."from"()
    inc $P10
    set rx1288_pos, $P10
    ge rx1288_pos, rx1288_eos, rxscan1292_done
  rxscan1292_scan:
    set_addr $I10, rxscan1292_loop
    rx1288_cur."!mark_push"(0, rx1288_pos, $I10)
  rxscan1292_done:
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1293_fail
    rx1288_cur."!mark_push"(0, rx1288_pos, $I10)
  # rx literal  "//"
    add $I11, rx1288_pos, 2
    gt $I11, rx1288_eos, rx1288_fail
    sub $I11, rx1288_pos, rx1288_off
    substr $S10, rx1288_tgt, $I11, 2
    ne $S10, "//", rx1288_fail
    add rx1288_pos, 2
    set_addr $I10, rxcap_1293_fail
    ($I12, $I11) = rx1288_cur."!mark_peek"($I10)
    rx1288_cur."!cursor_pos"($I11)
    ($P10) = rx1288_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1288_pos, "")
    rx1288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1293_done
  rxcap_1293_fail:
    goto rx1288_fail
  rxcap_1293_done:
  # rx subrule "O" subtype=capture negate=
    rx1288_cur."!cursor_pos"(rx1288_pos)
    $P10 = rx1288_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1288_fail
    rx1288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1288_pos = $P10."pos"()
  # rx pass
    rx1288_cur."!cursor_pass"(rx1288_pos, "infix:sym<//>")
    rx1288_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1288_pos)
    .return (rx1288_cur)
  rx1288_fail:
.annotate 'line', 447
    (rx1288_rep, rx1288_pos, $I10, $P10) = rx1288_cur."!mark_fail"(0)
    lt rx1288_pos, -1, rx1288_done
    eq rx1288_pos, -1, rx1288_fail
    jump $I10
  rx1288_done:
    rx1288_cur."!cursor_fail"()
    rx1288_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1288_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("327_1278500537.15927") :method
.annotate 'line', 447
    $P1290 = self."!PREFIX__!subrule"("O", "//")
    new $P1291, "ResizablePMCArray"
    push $P1291, $P1290
    .return ($P1291)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("328_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1295_tgt
    .local int rx1295_pos
    .local int rx1295_off
    .local int rx1295_eos
    .local int rx1295_rep
    .local pmc rx1295_cur
    (rx1295_cur, rx1295_pos, rx1295_tgt) = self."!cursor_start"()
    rx1295_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1295_cur
    .local pmc match
    .lex "$/", match
    length rx1295_eos, rx1295_tgt
    gt rx1295_pos, rx1295_eos, rx1295_done
    set rx1295_off, 0
    lt rx1295_pos, 2, rx1295_start
    sub rx1295_off, rx1295_pos, 1
    substr rx1295_tgt, rx1295_tgt, rx1295_off
  rx1295_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1299_done
    goto rxscan1299_scan
  rxscan1299_loop:
    ($P10) = rx1295_cur."from"()
    inc $P10
    set rx1295_pos, $P10
    ge rx1295_pos, rx1295_eos, rxscan1299_done
  rxscan1299_scan:
    set_addr $I10, rxscan1299_loop
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
  rxscan1299_done:
.annotate 'line', 540
  # rx literal  "??"
    add $I11, rx1295_pos, 2
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 2
    ne $S10, "??", rx1295_fail
    add rx1295_pos, 2
.annotate 'line', 541
  # rx subrule "ws" subtype=method negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."ws"()
    unless $P10, rx1295_fail
    rx1295_pos = $P10."pos"()
.annotate 'line', 542
  # rx subrule "EXPR" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."EXPR"("i=")
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1295_pos = $P10."pos"()
.annotate 'line', 543
  # rx literal  "!!"
    add $I11, rx1295_pos, 2
    gt $I11, rx1295_eos, rx1295_fail
    sub $I11, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I11, 2
    ne $S10, "!!", rx1295_fail
    add rx1295_pos, 2
.annotate 'line', 544
  # rx subrule "O" subtype=capture negate=
    rx1295_cur."!cursor_pos"(rx1295_pos)
    $P10 = rx1295_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1295_fail
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1295_pos = $P10."pos"()
.annotate 'line', 539
  # rx pass
    rx1295_cur."!cursor_pass"(rx1295_pos, "infix:sym<?? !!>")
    rx1295_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1295_pos)
    .return (rx1295_cur)
  rx1295_fail:
.annotate 'line', 447
    (rx1295_rep, rx1295_pos, $I10, $P10) = rx1295_cur."!mark_fail"(0)
    lt rx1295_pos, -1, rx1295_done
    eq rx1295_pos, -1, rx1295_fail
    jump $I10
  rx1295_done:
    rx1295_cur."!cursor_fail"()
    rx1295_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1295_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("329_1278500537.15927") :method
.annotate 'line', 447
    $P1297 = self."!PREFIX__!subrule"("ws", "??")
    new $P1298, "ResizablePMCArray"
    push $P1298, $P1297
    .return ($P1298)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("330_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1301_tgt
    .local int rx1301_pos
    .local int rx1301_off
    .local int rx1301_eos
    .local int rx1301_rep
    .local pmc rx1301_cur
    (rx1301_cur, rx1301_pos, rx1301_tgt) = self."!cursor_start"()
    rx1301_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1301_cur
    .local pmc match
    .lex "$/", match
    length rx1301_eos, rx1301_tgt
    gt rx1301_pos, rx1301_eos, rx1301_done
    set rx1301_off, 0
    lt rx1301_pos, 2, rx1301_start
    sub rx1301_off, rx1301_pos, 1
    substr rx1301_tgt, rx1301_tgt, rx1301_off
  rx1301_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1305_done
    goto rxscan1305_scan
  rxscan1305_loop:
    ($P10) = rx1301_cur."from"()
    inc $P10
    set rx1301_pos, $P10
    ge rx1301_pos, rx1301_eos, rxscan1305_done
  rxscan1305_scan:
    set_addr $I10, rxscan1305_loop
    rx1301_cur."!mark_push"(0, rx1301_pos, $I10)
  rxscan1305_done:
.annotate 'line', 548
  # rx subcapture "sym"
    set_addr $I10, rxcap_1306_fail
    rx1301_cur."!mark_push"(0, rx1301_pos, $I10)
  # rx literal  "="
    add $I11, rx1301_pos, 1
    gt $I11, rx1301_eos, rx1301_fail
    sub $I11, rx1301_pos, rx1301_off
    substr $S10, rx1301_tgt, $I11, 1
    ne $S10, "=", rx1301_fail
    add rx1301_pos, 1
    set_addr $I10, rxcap_1306_fail
    ($I12, $I11) = rx1301_cur."!mark_peek"($I10)
    rx1301_cur."!cursor_pos"($I11)
    ($P10) = rx1301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1301_pos, "")
    rx1301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1306_done
  rxcap_1306_fail:
    goto rx1301_fail
  rxcap_1306_done:
  # rx subrule "panic" subtype=method negate=
    rx1301_cur."!cursor_pos"(rx1301_pos)
    $P10 = rx1301_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1301_fail
    rx1301_pos = $P10."pos"()
.annotate 'line', 547
  # rx pass
    rx1301_cur."!cursor_pass"(rx1301_pos, "infix:sym<=>")
    rx1301_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1301_pos)
    .return (rx1301_cur)
  rx1301_fail:
.annotate 'line', 447
    (rx1301_rep, rx1301_pos, $I10, $P10) = rx1301_cur."!mark_fail"(0)
    lt rx1301_pos, -1, rx1301_done
    eq rx1301_pos, -1, rx1301_fail
    jump $I10
  rx1301_done:
    rx1301_cur."!cursor_fail"()
    rx1301_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1301_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("331_1278500537.15927") :method
.annotate 'line', 447
    $P1303 = self."!PREFIX__!subrule"("panic", "=")
    new $P1304, "ResizablePMCArray"
    push $P1304, $P1303
    .return ($P1304)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("332_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1308_tgt
    .local int rx1308_pos
    .local int rx1308_off
    .local int rx1308_eos
    .local int rx1308_rep
    .local pmc rx1308_cur
    (rx1308_cur, rx1308_pos, rx1308_tgt) = self."!cursor_start"()
    rx1308_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1308_cur
    .local pmc match
    .lex "$/", match
    length rx1308_eos, rx1308_tgt
    gt rx1308_pos, rx1308_eos, rx1308_done
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
.annotate 'line', 550
  # rx subcapture "sym"
    set_addr $I10, rxcap_1313_fail
    rx1308_cur."!mark_push"(0, rx1308_pos, $I10)
  # rx literal  ":="
    add $I11, rx1308_pos, 2
    gt $I11, rx1308_eos, rx1308_fail
    sub $I11, rx1308_pos, rx1308_off
    substr $S10, rx1308_tgt, $I11, 2
    ne $S10, ":=", rx1308_fail
    add rx1308_pos, 2
    set_addr $I10, rxcap_1313_fail
    ($I12, $I11) = rx1308_cur."!mark_peek"($I10)
    rx1308_cur."!cursor_pos"($I11)
    ($P10) = rx1308_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1308_pos, "")
    rx1308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1313_done
  rxcap_1313_fail:
    goto rx1308_fail
  rxcap_1313_done:
  # rx subrule "O" subtype=capture negate=
    rx1308_cur."!cursor_pos"(rx1308_pos)
    $P10 = rx1308_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1308_fail
    rx1308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1308_pos = $P10."pos"()
  # rx pass
    rx1308_cur."!cursor_pass"(rx1308_pos, "infix:sym<:=>")
    rx1308_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1308_pos)
    .return (rx1308_cur)
  rx1308_fail:
.annotate 'line', 447
    (rx1308_rep, rx1308_pos, $I10, $P10) = rx1308_cur."!mark_fail"(0)
    lt rx1308_pos, -1, rx1308_done
    eq rx1308_pos, -1, rx1308_fail
    jump $I10
  rx1308_done:
    rx1308_cur."!cursor_fail"()
    rx1308_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1308_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("333_1278500537.15927") :method
.annotate 'line', 447
    $P1310 = self."!PREFIX__!subrule"("O", ":=")
    new $P1311, "ResizablePMCArray"
    push $P1311, $P1310
    .return ($P1311)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("334_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1315_tgt
    .local int rx1315_pos
    .local int rx1315_off
    .local int rx1315_eos
    .local int rx1315_rep
    .local pmc rx1315_cur
    (rx1315_cur, rx1315_pos, rx1315_tgt) = self."!cursor_start"()
    rx1315_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
    ne $I10, -1, rxscan1319_done
    goto rxscan1319_scan
  rxscan1319_loop:
    ($P10) = rx1315_cur."from"()
    inc $P10
    set rx1315_pos, $P10
    ge rx1315_pos, rx1315_eos, rxscan1319_done
  rxscan1319_scan:
    set_addr $I10, rxscan1319_loop
    rx1315_cur."!mark_push"(0, rx1315_pos, $I10)
  rxscan1319_done:
.annotate 'line', 551
  # rx subcapture "sym"
    set_addr $I10, rxcap_1320_fail
    rx1315_cur."!mark_push"(0, rx1315_pos, $I10)
  # rx literal  "::="
    add $I11, rx1315_pos, 3
    gt $I11, rx1315_eos, rx1315_fail
    sub $I11, rx1315_pos, rx1315_off
    substr $S10, rx1315_tgt, $I11, 3
    ne $S10, "::=", rx1315_fail
    add rx1315_pos, 3
    set_addr $I10, rxcap_1320_fail
    ($I12, $I11) = rx1315_cur."!mark_peek"($I10)
    rx1315_cur."!cursor_pos"($I11)
    ($P10) = rx1315_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1315_pos, "")
    rx1315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1320_done
  rxcap_1320_fail:
    goto rx1315_fail
  rxcap_1320_done:
  # rx subrule "O" subtype=capture negate=
    rx1315_cur."!cursor_pos"(rx1315_pos)
    $P10 = rx1315_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1315_fail
    rx1315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1315_pos = $P10."pos"()
  # rx pass
    rx1315_cur."!cursor_pass"(rx1315_pos, "infix:sym<::=>")
    rx1315_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1315_pos)
    .return (rx1315_cur)
  rx1315_fail:
.annotate 'line', 447
    (rx1315_rep, rx1315_pos, $I10, $P10) = rx1315_cur."!mark_fail"(0)
    lt rx1315_pos, -1, rx1315_done
    eq rx1315_pos, -1, rx1315_fail
    jump $I10
  rx1315_done:
    rx1315_cur."!cursor_fail"()
    rx1315_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("335_1278500537.15927") :method
.annotate 'line', 447
    $P1317 = self."!PREFIX__!subrule"("O", "::=")
    new $P1318, "ResizablePMCArray"
    push $P1318, $P1317
    .return ($P1318)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("336_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1322_tgt
    .local int rx1322_pos
    .local int rx1322_off
    .local int rx1322_eos
    .local int rx1322_rep
    .local pmc rx1322_cur
    (rx1322_cur, rx1322_pos, rx1322_tgt) = self."!cursor_start"()
    rx1322_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1322_cur
    .local pmc match
    .lex "$/", match
    length rx1322_eos, rx1322_tgt
    gt rx1322_pos, rx1322_eos, rx1322_done
    set rx1322_off, 0
    lt rx1322_pos, 2, rx1322_start
    sub rx1322_off, rx1322_pos, 1
    substr rx1322_tgt, rx1322_tgt, rx1322_off
  rx1322_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1326_done
    goto rxscan1326_scan
  rxscan1326_loop:
    ($P10) = rx1322_cur."from"()
    inc $P10
    set rx1322_pos, $P10
    ge rx1322_pos, rx1322_eos, rxscan1326_done
  rxscan1326_scan:
    set_addr $I10, rxscan1326_loop
    rx1322_cur."!mark_push"(0, rx1322_pos, $I10)
  rxscan1326_done:
.annotate 'line', 553
  # rx subcapture "sym"
    set_addr $I10, rxcap_1327_fail
    rx1322_cur."!mark_push"(0, rx1322_pos, $I10)
  # rx literal  ","
    add $I11, rx1322_pos, 1
    gt $I11, rx1322_eos, rx1322_fail
    sub $I11, rx1322_pos, rx1322_off
    substr $S10, rx1322_tgt, $I11, 1
    ne $S10, ",", rx1322_fail
    add rx1322_pos, 1
    set_addr $I10, rxcap_1327_fail
    ($I12, $I11) = rx1322_cur."!mark_peek"($I10)
    rx1322_cur."!cursor_pos"($I11)
    ($P10) = rx1322_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1322_pos, "")
    rx1322_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1327_done
  rxcap_1327_fail:
    goto rx1322_fail
  rxcap_1327_done:
  # rx subrule "O" subtype=capture negate=
    rx1322_cur."!cursor_pos"(rx1322_pos)
    $P10 = rx1322_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1322_fail
    rx1322_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1322_pos = $P10."pos"()
  # rx pass
    rx1322_cur."!cursor_pass"(rx1322_pos, "infix:sym<,>")
    rx1322_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1322_pos)
    .return (rx1322_cur)
  rx1322_fail:
.annotate 'line', 447
    (rx1322_rep, rx1322_pos, $I10, $P10) = rx1322_cur."!mark_fail"(0)
    lt rx1322_pos, -1, rx1322_done
    eq rx1322_pos, -1, rx1322_fail
    jump $I10
  rx1322_done:
    rx1322_cur."!cursor_fail"()
    rx1322_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1322_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("337_1278500537.15927") :method
.annotate 'line', 447
    $P1324 = self."!PREFIX__!subrule"("O", ",")
    new $P1325, "ResizablePMCArray"
    push $P1325, $P1324
    .return ($P1325)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("338_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1329_tgt
    .local int rx1329_pos
    .local int rx1329_off
    .local int rx1329_eos
    .local int rx1329_rep
    .local pmc rx1329_cur
    (rx1329_cur, rx1329_pos, rx1329_tgt) = self."!cursor_start"()
    rx1329_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1329_cur
    .local pmc match
    .lex "$/", match
    length rx1329_eos, rx1329_tgt
    gt rx1329_pos, rx1329_eos, rx1329_done
    set rx1329_off, 0
    lt rx1329_pos, 2, rx1329_start
    sub rx1329_off, rx1329_pos, 1
    substr rx1329_tgt, rx1329_tgt, rx1329_off
  rx1329_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1332_done
    goto rxscan1332_scan
  rxscan1332_loop:
    ($P10) = rx1329_cur."from"()
    inc $P10
    set rx1329_pos, $P10
    ge rx1329_pos, rx1329_eos, rxscan1332_done
  rxscan1332_scan:
    set_addr $I10, rxscan1332_loop
    rx1329_cur."!mark_push"(0, rx1329_pos, $I10)
  rxscan1332_done:
.annotate 'line', 555
  # rx subcapture "sym"
    set_addr $I10, rxcap_1333_fail
    rx1329_cur."!mark_push"(0, rx1329_pos, $I10)
  # rx literal  "return"
    add $I11, rx1329_pos, 6
    gt $I11, rx1329_eos, rx1329_fail
    sub $I11, rx1329_pos, rx1329_off
    substr $S10, rx1329_tgt, $I11, 6
    ne $S10, "return", rx1329_fail
    add rx1329_pos, 6
    set_addr $I10, rxcap_1333_fail
    ($I12, $I11) = rx1329_cur."!mark_peek"($I10)
    rx1329_cur."!cursor_pos"($I11)
    ($P10) = rx1329_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1329_pos, "")
    rx1329_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1333_done
  rxcap_1333_fail:
    goto rx1329_fail
  rxcap_1333_done:
  # rx charclass s
    ge rx1329_pos, rx1329_eos, rx1329_fail
    sub $I10, rx1329_pos, rx1329_off
    is_cclass $I11, 32, rx1329_tgt, $I10
    unless $I11, rx1329_fail
    inc rx1329_pos
  # rx subrule "O" subtype=capture negate=
    rx1329_cur."!cursor_pos"(rx1329_pos)
    $P10 = rx1329_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1329_fail
    rx1329_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1329_pos = $P10."pos"()
  # rx pass
    rx1329_cur."!cursor_pass"(rx1329_pos, "prefix:sym<return>")
    rx1329_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1329_pos)
    .return (rx1329_cur)
  rx1329_fail:
.annotate 'line', 447
    (rx1329_rep, rx1329_pos, $I10, $P10) = rx1329_cur."!mark_fail"(0)
    lt rx1329_pos, -1, rx1329_done
    eq rx1329_pos, -1, rx1329_fail
    jump $I10
  rx1329_done:
    rx1329_cur."!cursor_fail"()
    rx1329_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1329_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("339_1278500537.15927") :method
.annotate 'line', 447
    new $P1331, "ResizablePMCArray"
    push $P1331, "return"
    .return ($P1331)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("340_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1335_tgt
    .local int rx1335_pos
    .local int rx1335_off
    .local int rx1335_eos
    .local int rx1335_rep
    .local pmc rx1335_cur
    (rx1335_cur, rx1335_pos, rx1335_tgt) = self."!cursor_start"()
    rx1335_cur."!cursor_debug"("START ", "prefix:sym<make>")
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
.annotate 'line', 556
  # rx subcapture "sym"
    set_addr $I10, rxcap_1339_fail
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
  # rx literal  "make"
    add $I11, rx1335_pos, 4
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I11, 4
    ne $S10, "make", rx1335_fail
    add rx1335_pos, 4
    set_addr $I10, rxcap_1339_fail
    ($I12, $I11) = rx1335_cur."!mark_peek"($I10)
    rx1335_cur."!cursor_pos"($I11)
    ($P10) = rx1335_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1335_pos, "")
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1339_done
  rxcap_1339_fail:
    goto rx1335_fail
  rxcap_1339_done:
  # rx charclass s
    ge rx1335_pos, rx1335_eos, rx1335_fail
    sub $I10, rx1335_pos, rx1335_off
    is_cclass $I11, 32, rx1335_tgt, $I10
    unless $I11, rx1335_fail
    inc rx1335_pos
  # rx subrule "O" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."O"("%list_prefix")
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1335_pos = $P10."pos"()
  # rx pass
    rx1335_cur."!cursor_pass"(rx1335_pos, "prefix:sym<make>")
    rx1335_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1335_pos)
    .return (rx1335_cur)
  rx1335_fail:
.annotate 'line', 447
    (rx1335_rep, rx1335_pos, $I10, $P10) = rx1335_cur."!mark_fail"(0)
    lt rx1335_pos, -1, rx1335_done
    eq rx1335_pos, -1, rx1335_fail
    jump $I10
  rx1335_done:
    rx1335_cur."!cursor_fail"()
    rx1335_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1335_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("341_1278500537.15927") :method
.annotate 'line', 447
    new $P1337, "ResizablePMCArray"
    push $P1337, "make"
    .return ($P1337)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("342_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1341_tgt
    .local int rx1341_pos
    .local int rx1341_off
    .local int rx1341_eos
    .local int rx1341_rep
    .local pmc rx1341_cur
    (rx1341_cur, rx1341_pos, rx1341_tgt) = self."!cursor_start"()
    rx1341_cur."!cursor_debug"("START ", "term:sym<last>")
    .lex unicode:"$\x{a2}", rx1341_cur
    .local pmc match
    .lex "$/", match
    length rx1341_eos, rx1341_tgt
    gt rx1341_pos, rx1341_eos, rx1341_done
    set rx1341_off, 0
    lt rx1341_pos, 2, rx1341_start
    sub rx1341_off, rx1341_pos, 1
    substr rx1341_tgt, rx1341_tgt, rx1341_off
  rx1341_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1344_done
    goto rxscan1344_scan
  rxscan1344_loop:
    ($P10) = rx1341_cur."from"()
    inc $P10
    set rx1341_pos, $P10
    ge rx1341_pos, rx1341_eos, rxscan1344_done
  rxscan1344_scan:
    set_addr $I10, rxscan1344_loop
    rx1341_cur."!mark_push"(0, rx1341_pos, $I10)
  rxscan1344_done:
.annotate 'line', 557
  # rx subcapture "sym"
    set_addr $I10, rxcap_1345_fail
    rx1341_cur."!mark_push"(0, rx1341_pos, $I10)
  # rx literal  "last"
    add $I11, rx1341_pos, 4
    gt $I11, rx1341_eos, rx1341_fail
    sub $I11, rx1341_pos, rx1341_off
    substr $S10, rx1341_tgt, $I11, 4
    ne $S10, "last", rx1341_fail
    add rx1341_pos, 4
    set_addr $I10, rxcap_1345_fail
    ($I12, $I11) = rx1341_cur."!mark_peek"($I10)
    rx1341_cur."!cursor_pos"($I11)
    ($P10) = rx1341_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1341_pos, "")
    rx1341_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1345_done
  rxcap_1345_fail:
    goto rx1341_fail
  rxcap_1345_done:
  # rx pass
    rx1341_cur."!cursor_pass"(rx1341_pos, "term:sym<last>")
    rx1341_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1341_pos)
    .return (rx1341_cur)
  rx1341_fail:
.annotate 'line', 447
    (rx1341_rep, rx1341_pos, $I10, $P10) = rx1341_cur."!mark_fail"(0)
    lt rx1341_pos, -1, rx1341_done
    eq rx1341_pos, -1, rx1341_fail
    jump $I10
  rx1341_done:
    rx1341_cur."!cursor_fail"()
    rx1341_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1341_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("343_1278500537.15927") :method
.annotate 'line', 447
    new $P1343, "ResizablePMCArray"
    push $P1343, "last"
    .return ($P1343)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("344_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1347_tgt
    .local int rx1347_pos
    .local int rx1347_off
    .local int rx1347_eos
    .local int rx1347_rep
    .local pmc rx1347_cur
    (rx1347_cur, rx1347_pos, rx1347_tgt) = self."!cursor_start"()
    rx1347_cur."!cursor_debug"("START ", "term:sym<next>")
    .lex unicode:"$\x{a2}", rx1347_cur
    .local pmc match
    .lex "$/", match
    length rx1347_eos, rx1347_tgt
    gt rx1347_pos, rx1347_eos, rx1347_done
    set rx1347_off, 0
    lt rx1347_pos, 2, rx1347_start
    sub rx1347_off, rx1347_pos, 1
    substr rx1347_tgt, rx1347_tgt, rx1347_off
  rx1347_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1350_done
    goto rxscan1350_scan
  rxscan1350_loop:
    ($P10) = rx1347_cur."from"()
    inc $P10
    set rx1347_pos, $P10
    ge rx1347_pos, rx1347_eos, rxscan1350_done
  rxscan1350_scan:
    set_addr $I10, rxscan1350_loop
    rx1347_cur."!mark_push"(0, rx1347_pos, $I10)
  rxscan1350_done:
.annotate 'line', 558
  # rx subcapture "sym"
    set_addr $I10, rxcap_1351_fail
    rx1347_cur."!mark_push"(0, rx1347_pos, $I10)
  # rx literal  "next"
    add $I11, rx1347_pos, 4
    gt $I11, rx1347_eos, rx1347_fail
    sub $I11, rx1347_pos, rx1347_off
    substr $S10, rx1347_tgt, $I11, 4
    ne $S10, "next", rx1347_fail
    add rx1347_pos, 4
    set_addr $I10, rxcap_1351_fail
    ($I12, $I11) = rx1347_cur."!mark_peek"($I10)
    rx1347_cur."!cursor_pos"($I11)
    ($P10) = rx1347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1347_pos, "")
    rx1347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1351_done
  rxcap_1351_fail:
    goto rx1347_fail
  rxcap_1351_done:
  # rx pass
    rx1347_cur."!cursor_pass"(rx1347_pos, "term:sym<next>")
    rx1347_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1347_pos)
    .return (rx1347_cur)
  rx1347_fail:
.annotate 'line', 447
    (rx1347_rep, rx1347_pos, $I10, $P10) = rx1347_cur."!mark_fail"(0)
    lt rx1347_pos, -1, rx1347_done
    eq rx1347_pos, -1, rx1347_fail
    jump $I10
  rx1347_done:
    rx1347_cur."!cursor_fail"()
    rx1347_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1347_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("345_1278500537.15927") :method
.annotate 'line', 447
    new $P1349, "ResizablePMCArray"
    push $P1349, "next"
    .return ($P1349)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("346_1278500537.15927") :method :outer("11_1278500537.15927")
.annotate 'line', 447
    .local string rx1353_tgt
    .local int rx1353_pos
    .local int rx1353_off
    .local int rx1353_eos
    .local int rx1353_rep
    .local pmc rx1353_cur
    (rx1353_cur, rx1353_pos, rx1353_tgt) = self."!cursor_start"()
    rx1353_cur."!cursor_debug"("START ", "term:sym<redo>")
    .lex unicode:"$\x{a2}", rx1353_cur
    .local pmc match
    .lex "$/", match
    length rx1353_eos, rx1353_tgt
    gt rx1353_pos, rx1353_eos, rx1353_done
    set rx1353_off, 0
    lt rx1353_pos, 2, rx1353_start
    sub rx1353_off, rx1353_pos, 1
    substr rx1353_tgt, rx1353_tgt, rx1353_off
  rx1353_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1356_done
    goto rxscan1356_scan
  rxscan1356_loop:
    ($P10) = rx1353_cur."from"()
    inc $P10
    set rx1353_pos, $P10
    ge rx1353_pos, rx1353_eos, rxscan1356_done
  rxscan1356_scan:
    set_addr $I10, rxscan1356_loop
    rx1353_cur."!mark_push"(0, rx1353_pos, $I10)
  rxscan1356_done:
.annotate 'line', 559
  # rx subcapture "sym"
    set_addr $I10, rxcap_1357_fail
    rx1353_cur."!mark_push"(0, rx1353_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1353_pos, 4
    gt $I11, rx1353_eos, rx1353_fail
    sub $I11, rx1353_pos, rx1353_off
    substr $S10, rx1353_tgt, $I11, 4
    ne $S10, "redo", rx1353_fail
    add rx1353_pos, 4
    set_addr $I10, rxcap_1357_fail
    ($I12, $I11) = rx1353_cur."!mark_peek"($I10)
    rx1353_cur."!cursor_pos"($I11)
    ($P10) = rx1353_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1353_pos, "")
    rx1353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1357_done
  rxcap_1357_fail:
    goto rx1353_fail
  rxcap_1357_done:
  # rx pass
    rx1353_cur."!cursor_pass"(rx1353_pos, "term:sym<redo>")
    rx1353_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1353_pos)
    .return (rx1353_cur)
  rx1353_fail:
.annotate 'line', 447
    (rx1353_rep, rx1353_pos, $I10, $P10) = rx1353_cur."!mark_fail"(0)
    lt rx1353_pos, -1, rx1353_done
    eq rx1353_pos, -1, rx1353_fail
    jump $I10
  rx1353_done:
    rx1353_cur."!cursor_fail"()
    rx1353_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1353_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("347_1278500537.15927") :method
.annotate 'line', 447
    new $P1355, "ResizablePMCArray"
    push $P1355, "redo"
    .return ($P1355)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("348_1278500537.15927") :method :outer("11_1278500537.15927")
    .param pmc param_1361
.annotate 'line', 561
    new $P1360, 'ExceptionHandler'
    set_addr $P1360, control_1359
    $P1360."handle_types"(.CONTROL_RETURN)
    push_eh $P1360
    .lex "self", self
    .lex "$/", param_1361
.annotate 'line', 563
    new $P1362, "Undef"
    .lex "$t", $P1362
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_384
    $P1363 = root_new ['parrot';'ResizablePMCArray']
  vivify_384:
    set $P1364, $P1363[0]
    unless_null $P1364, vivify_385
    new $P1364, "Undef"
  vivify_385:
    store_lex "$t", $P1364
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_386
    $P1365 = root_new ['parrot';'ResizablePMCArray']
  vivify_386:
    set $P1366, $P1365[1]
    unless_null $P1366, vivify_387
    new $P1366, "Undef"
  vivify_387:
    find_lex $P1367, "$/"
    unless_null $P1367, vivify_388
    $P1367 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1367
  vivify_388:
    set $P1367[0], $P1366
    find_lex $P1368, "$t"
    find_lex $P1369, "$/"
    unless_null $P1369, vivify_389
    $P1369 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1369
  vivify_389:
    set $P1369[1], $P1368
.annotate 'line', 561
    .return ($P1368)
  control_1359:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1370, exception, "payload"
    .return ($P1370)
.end


.namespace ["NQP";"Regex"]
.sub "_block1371"  :subid("349_1278500537.15927") :outer("11_1278500537.15927")
.annotate 'line', 567
    .const 'Sub' $P1429 = "368_1278500537.15927" 
    capture_lex $P1429
    .const 'Sub' $P1424 = "366_1278500537.15927" 
    capture_lex $P1424
    .const 'Sub' $P1411 = "363_1278500537.15927" 
    capture_lex $P1411
    .const 'Sub' $P1401 = "360_1278500537.15927" 
    capture_lex $P1401
    .const 'Sub' $P1396 = "358_1278500537.15927" 
    capture_lex $P1396
    .const 'Sub' $P1387 = "355_1278500537.15927" 
    capture_lex $P1387
    .const 'Sub' $P1382 = "353_1278500537.15927" 
    capture_lex $P1382
    .const 'Sub' $P1373 = "350_1278500537.15927" 
    capture_lex $P1373
    .const 'Sub' $P1429 = "368_1278500537.15927" 
    capture_lex $P1429
    .return ($P1429)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("350_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .const 'Sub' $P1379 = "352_1278500537.15927" 
    capture_lex $P1379
    .local string rx1374_tgt
    .local int rx1374_pos
    .local int rx1374_off
    .local int rx1374_eos
    .local int rx1374_rep
    .local pmc rx1374_cur
    (rx1374_cur, rx1374_pos, rx1374_tgt) = self."!cursor_start"()
    rx1374_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1374_cur
    .local pmc match
    .lex "$/", match
    length rx1374_eos, rx1374_tgt
    gt rx1374_pos, rx1374_eos, rx1374_done
    set rx1374_off, 0
    lt rx1374_pos, 2, rx1374_start
    sub rx1374_off, rx1374_pos, 1
    substr rx1374_tgt, rx1374_tgt, rx1374_off
  rx1374_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1377_done
    goto rxscan1377_scan
  rxscan1377_loop:
    ($P10) = rx1374_cur."from"()
    inc $P10
    set rx1374_pos, $P10
    ge rx1374_pos, rx1374_eos, rxscan1377_done
  rxscan1377_scan:
    set_addr $I10, rxscan1377_loop
    rx1374_cur."!mark_push"(0, rx1374_pos, $I10)
  rxscan1377_done:
.annotate 'line', 569
  # rx literal  ":"
    add $I11, rx1374_pos, 1
    gt $I11, rx1374_eos, rx1374_fail
    sub $I11, rx1374_pos, rx1374_off
    substr $S10, rx1374_tgt, $I11, 1
    ne $S10, ":", rx1374_fail
    add rx1374_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1374_cur."!cursor_pos"(rx1374_pos)
    .const 'Sub' $P1379 = "352_1278500537.15927" 
    capture_lex $P1379
    $P10 = rx1374_cur."before"($P1379)
    unless $P10, rx1374_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1374_cur."!cursor_pos"(rx1374_pos)
    $P10 = rx1374_cur."LANG"("MAIN", "statement")
    unless $P10, rx1374_fail
    rx1374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1374_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1374_cur."!cursor_pos"(rx1374_pos)
    $P10 = rx1374_cur."ws"()
    unless $P10, rx1374_fail
    rx1374_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1374_pos, 1
    gt $I11, rx1374_eos, rx1374_fail
    sub $I11, rx1374_pos, rx1374_off
    substr $S10, rx1374_tgt, $I11, 1
    ne $S10, ";", rx1374_fail
    add rx1374_pos, 1
.annotate 'line', 568
  # rx pass
    rx1374_cur."!cursor_pass"(rx1374_pos, "metachar:sym<:my>")
    rx1374_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1374_pos)
    .return (rx1374_cur)
  rx1374_fail:
.annotate 'line', 567
    (rx1374_rep, rx1374_pos, $I10, $P10) = rx1374_cur."!mark_fail"(0)
    lt rx1374_pos, -1, rx1374_done
    eq rx1374_pos, -1, rx1374_fail
    jump $I10
  rx1374_done:
    rx1374_cur."!cursor_fail"()
    rx1374_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1374_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("351_1278500537.15927") :method
.annotate 'line', 567
    new $P1376, "ResizablePMCArray"
    push $P1376, ":"
    .return ($P1376)
.end


.namespace ["NQP";"Regex"]
.sub "_block1378"  :anon :subid("352_1278500537.15927") :method :outer("350_1278500537.15927")
.annotate 'line', 569
    .local string rx1380_tgt
    .local int rx1380_pos
    .local int rx1380_off
    .local int rx1380_eos
    .local int rx1380_rep
    .local pmc rx1380_cur
    (rx1380_cur, rx1380_pos, rx1380_tgt) = self."!cursor_start"()
    rx1380_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1381_done
    goto rxscan1381_scan
  rxscan1381_loop:
    ($P10) = rx1380_cur."from"()
    inc $P10
    set rx1380_pos, $P10
    ge rx1380_pos, rx1380_eos, rxscan1381_done
  rxscan1381_scan:
    set_addr $I10, rxscan1381_loop
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  rxscan1381_done:
  # rx literal  "my"
    add $I11, rx1380_pos, 2
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    substr $S10, rx1380_tgt, $I11, 2
    ne $S10, "my", rx1380_fail
    add rx1380_pos, 2
  # rx pass
    rx1380_cur."!cursor_pass"(rx1380_pos, "")
    rx1380_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1380_pos)
    .return (rx1380_cur)
  rx1380_fail:
    (rx1380_rep, rx1380_pos, $I10, $P10) = rx1380_cur."!mark_fail"(0)
    lt rx1380_pos, -1, rx1380_done
    eq rx1380_pos, -1, rx1380_fail
    jump $I10
  rx1380_done:
    rx1380_cur."!cursor_fail"()
    rx1380_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1380_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("353_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .local string rx1383_tgt
    .local int rx1383_pos
    .local int rx1383_off
    .local int rx1383_eos
    .local int rx1383_rep
    .local pmc rx1383_cur
    (rx1383_cur, rx1383_pos, rx1383_tgt) = self."!cursor_start"()
    rx1383_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1383_cur
    .local pmc match
    .lex "$/", match
    length rx1383_eos, rx1383_tgt
    gt rx1383_pos, rx1383_eos, rx1383_done
    set rx1383_off, 0
    lt rx1383_pos, 2, rx1383_start
    sub rx1383_off, rx1383_pos, 1
    substr rx1383_tgt, rx1383_tgt, rx1383_off
  rx1383_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1386_done
    goto rxscan1386_scan
  rxscan1386_loop:
    ($P10) = rx1383_cur."from"()
    inc $P10
    set rx1383_pos, $P10
    ge rx1383_pos, rx1383_eos, rxscan1386_done
  rxscan1386_scan:
    set_addr $I10, rxscan1386_loop
    rx1383_cur."!mark_push"(0, rx1383_pos, $I10)
  rxscan1386_done:
.annotate 'line', 573
  # rx enumcharlist negate=0 zerowidth
    ge rx1383_pos, rx1383_eos, rx1383_fail
    sub $I10, rx1383_pos, rx1383_off
    substr $S10, rx1383_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1383_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1383_cur."!cursor_pos"(rx1383_pos)
    $P10 = rx1383_cur."codeblock"()
    unless $P10, rx1383_fail
    rx1383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1383_pos = $P10."pos"()
.annotate 'line', 572
  # rx pass
    rx1383_cur."!cursor_pass"(rx1383_pos, "metachar:sym<{ }>")
    rx1383_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1383_pos)
    .return (rx1383_cur)
  rx1383_fail:
.annotate 'line', 567
    (rx1383_rep, rx1383_pos, $I10, $P10) = rx1383_cur."!mark_fail"(0)
    lt rx1383_pos, -1, rx1383_done
    eq rx1383_pos, -1, rx1383_fail
    jump $I10
  rx1383_done:
    rx1383_cur."!cursor_fail"()
    rx1383_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1383_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("354_1278500537.15927") :method
.annotate 'line', 567
    new $P1385, "ResizablePMCArray"
    push $P1385, "{"
    .return ($P1385)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("355_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .const 'Sub' $P1393 = "357_1278500537.15927" 
    capture_lex $P1393
    .local string rx1388_tgt
    .local int rx1388_pos
    .local int rx1388_off
    .local int rx1388_eos
    .local int rx1388_rep
    .local pmc rx1388_cur
    (rx1388_cur, rx1388_pos, rx1388_tgt) = self."!cursor_start"()
    rx1388_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
    .lex unicode:"$\x{a2}", rx1388_cur
    .local pmc match
    .lex "$/", match
    length rx1388_eos, rx1388_tgt
    gt rx1388_pos, rx1388_eos, rx1388_done
    set rx1388_off, 0
    lt rx1388_pos, 2, rx1388_start
    sub rx1388_off, rx1388_pos, 1
    substr rx1388_tgt, rx1388_tgt, rx1388_off
  rx1388_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1391_done
    goto rxscan1391_scan
  rxscan1391_loop:
    ($P10) = rx1388_cur."from"()
    inc $P10
    set rx1388_pos, $P10
    ge rx1388_pos, rx1388_eos, rxscan1391_done
  rxscan1391_scan:
    set_addr $I10, rxscan1391_loop
    rx1388_cur."!mark_push"(0, rx1388_pos, $I10)
  rxscan1391_done:
.annotate 'line', 577
  # rx enumcharlist negate=0 zerowidth
    ge rx1388_pos, rx1388_eos, rx1388_fail
    sub $I10, rx1388_pos, rx1388_off
    substr $S10, rx1388_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1388_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1388_cur."!cursor_pos"(rx1388_pos)
    .const 'Sub' $P1393 = "357_1278500537.15927" 
    capture_lex $P1393
    $P10 = rx1388_cur."before"($P1393)
    unless $P10, rx1388_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1388_cur."!cursor_pos"(rx1388_pos)
    $P10 = rx1388_cur."LANG"("MAIN", "variable")
    unless $P10, rx1388_fail
    rx1388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1388_pos = $P10."pos"()
.annotate 'line', 576
  # rx pass
    rx1388_cur."!cursor_pass"(rx1388_pos, "metachar:sym<nqpvar>")
    rx1388_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1388_pos)
    .return (rx1388_cur)
  rx1388_fail:
.annotate 'line', 567
    (rx1388_rep, rx1388_pos, $I10, $P10) = rx1388_cur."!mark_fail"(0)
    lt rx1388_pos, -1, rx1388_done
    eq rx1388_pos, -1, rx1388_fail
    jump $I10
  rx1388_done:
    rx1388_cur."!cursor_fail"()
    rx1388_cur."!cursor_debug"("FAIL  ", "metachar:sym<nqpvar>")
    .return (rx1388_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("356_1278500537.15927") :method
.annotate 'line', 567
    new $P1390, "ResizablePMCArray"
    push $P1390, "$"
    push $P1390, "@"
    .return ($P1390)
.end


.namespace ["NQP";"Regex"]
.sub "_block1392"  :anon :subid("357_1278500537.15927") :method :outer("355_1278500537.15927")
.annotate 'line', 577
    .local string rx1394_tgt
    .local int rx1394_pos
    .local int rx1394_off
    .local int rx1394_eos
    .local int rx1394_rep
    .local pmc rx1394_cur
    (rx1394_cur, rx1394_pos, rx1394_tgt) = self."!cursor_start"()
    rx1394_cur."!cursor_debug"("START ", "")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1395_done
    goto rxscan1395_scan
  rxscan1395_loop:
    ($P10) = rx1394_cur."from"()
    inc $P10
    set rx1394_pos, $P10
    ge rx1394_pos, rx1394_eos, rxscan1395_done
  rxscan1395_scan:
    set_addr $I10, rxscan1395_loop
    rx1394_cur."!mark_push"(0, rx1394_pos, $I10)
  rxscan1395_done:
  # rx charclass .
    ge rx1394_pos, rx1394_eos, rx1394_fail
    inc rx1394_pos
  # rx charclass w
    ge rx1394_pos, rx1394_eos, rx1394_fail
    sub $I10, rx1394_pos, rx1394_off
    is_cclass $I11, 8192, rx1394_tgt, $I10
    unless $I11, rx1394_fail
    inc rx1394_pos
  # rx pass
    rx1394_cur."!cursor_pass"(rx1394_pos, "")
    rx1394_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1394_pos)
    .return (rx1394_cur)
  rx1394_fail:
    (rx1394_rep, rx1394_pos, $I10, $P10) = rx1394_cur."!mark_fail"(0)
    lt rx1394_pos, -1, rx1394_done
    eq rx1394_pos, -1, rx1394_fail
    jump $I10
  rx1394_done:
    rx1394_cur."!cursor_fail"()
    rx1394_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1394_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("358_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .local string rx1397_tgt
    .local int rx1397_pos
    .local int rx1397_off
    .local int rx1397_eos
    .local int rx1397_rep
    .local pmc rx1397_cur
    (rx1397_cur, rx1397_pos, rx1397_tgt) = self."!cursor_start"()
    rx1397_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1400_done
    goto rxscan1400_scan
  rxscan1400_loop:
    ($P10) = rx1397_cur."from"()
    inc $P10
    set rx1397_pos, $P10
    ge rx1397_pos, rx1397_eos, rxscan1400_done
  rxscan1400_scan:
    set_addr $I10, rxscan1400_loop
    rx1397_cur."!mark_push"(0, rx1397_pos, $I10)
  rxscan1400_done:
.annotate 'line', 581
  # rx enumcharlist negate=0 zerowidth
    ge rx1397_pos, rx1397_eos, rx1397_fail
    sub $I10, rx1397_pos, rx1397_off
    substr $S10, rx1397_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1397_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1397_cur."!cursor_pos"(rx1397_pos)
    $P10 = rx1397_cur."codeblock"()
    unless $P10, rx1397_fail
    rx1397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1397_pos = $P10."pos"()
.annotate 'line', 580
  # rx pass
    rx1397_cur."!cursor_pass"(rx1397_pos, "assertion:sym<{ }>")
    rx1397_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1397_pos)
    .return (rx1397_cur)
  rx1397_fail:
.annotate 'line', 567
    (rx1397_rep, rx1397_pos, $I10, $P10) = rx1397_cur."!mark_fail"(0)
    lt rx1397_pos, -1, rx1397_done
    eq rx1397_pos, -1, rx1397_fail
    jump $I10
  rx1397_done:
    rx1397_cur."!cursor_fail"()
    rx1397_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1397_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("359_1278500537.15927") :method
.annotate 'line', 567
    new $P1399, "ResizablePMCArray"
    push $P1399, "{"
    .return ($P1399)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("360_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .const 'Sub' $P1407 = "362_1278500537.15927" 
    capture_lex $P1407
    .local string rx1402_tgt
    .local int rx1402_pos
    .local int rx1402_off
    .local int rx1402_eos
    .local int rx1402_rep
    .local pmc rx1402_cur
    (rx1402_cur, rx1402_pos, rx1402_tgt) = self."!cursor_start"()
    rx1402_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
    .lex unicode:"$\x{a2}", rx1402_cur
    .local pmc match
    .lex "$/", match
    length rx1402_eos, rx1402_tgt
    gt rx1402_pos, rx1402_eos, rx1402_done
    set rx1402_off, 0
    lt rx1402_pos, 2, rx1402_start
    sub rx1402_off, rx1402_pos, 1
    substr rx1402_tgt, rx1402_tgt, rx1402_off
  rx1402_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1405_done
    goto rxscan1405_scan
  rxscan1405_loop:
    ($P10) = rx1402_cur."from"()
    inc $P10
    set rx1402_pos, $P10
    ge rx1402_pos, rx1402_eos, rxscan1405_done
  rxscan1405_scan:
    set_addr $I10, rxscan1405_loop
    rx1402_cur."!mark_push"(0, rx1402_pos, $I10)
  rxscan1405_done:
.annotate 'line', 585
  # rx subcapture "zw"
    set_addr $I10, rxcap_1410_fail
    rx1402_cur."!mark_push"(0, rx1402_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1402_pos, rx1402_eos, rx1402_fail
    sub $I10, rx1402_pos, rx1402_off
    substr $S10, rx1402_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1402_fail
    inc rx1402_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1402_cur."!cursor_pos"(rx1402_pos)
    .const 'Sub' $P1407 = "362_1278500537.15927" 
    capture_lex $P1407
    $P10 = rx1402_cur."before"($P1407)
    unless $P10, rx1402_fail
    set_addr $I10, rxcap_1410_fail
    ($I12, $I11) = rx1402_cur."!mark_peek"($I10)
    rx1402_cur."!cursor_pos"($I11)
    ($P10) = rx1402_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1402_pos, "")
    rx1402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1410_done
  rxcap_1410_fail:
    goto rx1402_fail
  rxcap_1410_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1402_cur."!cursor_pos"(rx1402_pos)
    $P10 = rx1402_cur."codeblock"()
    unless $P10, rx1402_fail
    rx1402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1402_pos = $P10."pos"()
.annotate 'line', 584
  # rx pass
    rx1402_cur."!cursor_pass"(rx1402_pos, "assertion:sym<?{ }>")
    rx1402_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1402_pos)
    .return (rx1402_cur)
  rx1402_fail:
.annotate 'line', 567
    (rx1402_rep, rx1402_pos, $I10, $P10) = rx1402_cur."!mark_fail"(0)
    lt rx1402_pos, -1, rx1402_done
    eq rx1402_pos, -1, rx1402_fail
    jump $I10
  rx1402_done:
    rx1402_cur."!cursor_fail"()
    rx1402_cur."!cursor_debug"("FAIL  ", "assertion:sym<?{ }>")
    .return (rx1402_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("361_1278500537.15927") :method
.annotate 'line', 567
    new $P1404, "ResizablePMCArray"
    push $P1404, "!"
    push $P1404, "?"
    .return ($P1404)
.end


.namespace ["NQP";"Regex"]
.sub "_block1406"  :anon :subid("362_1278500537.15927") :method :outer("360_1278500537.15927")
.annotate 'line', 585
    .local string rx1408_tgt
    .local int rx1408_pos
    .local int rx1408_off
    .local int rx1408_eos
    .local int rx1408_rep
    .local pmc rx1408_cur
    (rx1408_cur, rx1408_pos, rx1408_tgt) = self."!cursor_start"()
    rx1408_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1408_cur
    .local pmc match
    .lex "$/", match
    length rx1408_eos, rx1408_tgt
    gt rx1408_pos, rx1408_eos, rx1408_done
    set rx1408_off, 0
    lt rx1408_pos, 2, rx1408_start
    sub rx1408_off, rx1408_pos, 1
    substr rx1408_tgt, rx1408_tgt, rx1408_off
  rx1408_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1409_done
    goto rxscan1409_scan
  rxscan1409_loop:
    ($P10) = rx1408_cur."from"()
    inc $P10
    set rx1408_pos, $P10
    ge rx1408_pos, rx1408_eos, rxscan1409_done
  rxscan1409_scan:
    set_addr $I10, rxscan1409_loop
    rx1408_cur."!mark_push"(0, rx1408_pos, $I10)
  rxscan1409_done:
  # rx literal  "{"
    add $I11, rx1408_pos, 1
    gt $I11, rx1408_eos, rx1408_fail
    sub $I11, rx1408_pos, rx1408_off
    substr $S10, rx1408_tgt, $I11, 1
    ne $S10, "{", rx1408_fail
    add rx1408_pos, 1
  # rx pass
    rx1408_cur."!cursor_pass"(rx1408_pos, "")
    rx1408_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1408_pos)
    .return (rx1408_cur)
  rx1408_fail:
    (rx1408_rep, rx1408_pos, $I10, $P10) = rx1408_cur."!mark_fail"(0)
    lt rx1408_pos, -1, rx1408_done
    eq rx1408_pos, -1, rx1408_fail
    jump $I10
  rx1408_done:
    rx1408_cur."!cursor_fail"()
    rx1408_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1408_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("363_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .const 'Sub' $P1420 = "365_1278500537.15927" 
    capture_lex $P1420
    .local string rx1412_tgt
    .local int rx1412_pos
    .local int rx1412_off
    .local int rx1412_eos
    .local int rx1412_rep
    .local pmc rx1412_cur
    (rx1412_cur, rx1412_pos, rx1412_tgt) = self."!cursor_start"()
    rx1412_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1412_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1412_cur
    .local pmc match
    .lex "$/", match
    length rx1412_eos, rx1412_tgt
    gt rx1412_pos, rx1412_eos, rx1412_done
    set rx1412_off, 0
    lt rx1412_pos, 2, rx1412_start
    sub rx1412_off, rx1412_pos, 1
    substr rx1412_tgt, rx1412_tgt, rx1412_off
  rx1412_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1416_done
    goto rxscan1416_scan
  rxscan1416_loop:
    ($P10) = rx1412_cur."from"()
    inc $P10
    set rx1412_pos, $P10
    ge rx1412_pos, rx1412_eos, rxscan1416_done
  rxscan1416_scan:
    set_addr $I10, rxscan1416_loop
    rx1412_cur."!mark_push"(0, rx1412_pos, $I10)
  rxscan1416_done:
.annotate 'line', 589
  # rx subrule "identifier" subtype=capture negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."identifier"()
    unless $P10, rx1412_fail
    rx1412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1412_pos = $P10."pos"()
.annotate 'line', 596
  # rx rxquantr1417 ** 0..1
    set_addr $I1423, rxquantr1417_done
    rx1412_cur."!mark_push"(0, rx1412_pos, $I1423)
  rxquantr1417_loop:
  alt1418_0:
.annotate 'line', 590
    set_addr $I10, alt1418_1
    rx1412_cur."!mark_push"(0, rx1412_pos, $I10)
.annotate 'line', 591
  # rx subrule "before" subtype=zerowidth negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    .const 'Sub' $P1420 = "365_1278500537.15927" 
    capture_lex $P1420
    $P10 = rx1412_cur."before"($P1420)
    unless $P10, rx1412_fail
    goto alt1418_end
  alt1418_1:
    set_addr $I10, alt1418_2
    rx1412_cur."!mark_push"(0, rx1412_pos, $I10)
.annotate 'line', 592
  # rx literal  "="
    add $I11, rx1412_pos, 1
    gt $I11, rx1412_eos, rx1412_fail
    sub $I11, rx1412_pos, rx1412_off
    substr $S10, rx1412_tgt, $I11, 1
    ne $S10, "=", rx1412_fail
    add rx1412_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."assertion"()
    unless $P10, rx1412_fail
    rx1412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1412_pos = $P10."pos"()
    goto alt1418_end
  alt1418_2:
    set_addr $I10, alt1418_3
    rx1412_cur."!mark_push"(0, rx1412_pos, $I10)
.annotate 'line', 593
  # rx literal  ":"
    add $I11, rx1412_pos, 1
    gt $I11, rx1412_eos, rx1412_fail
    sub $I11, rx1412_pos, rx1412_off
    substr $S10, rx1412_tgt, $I11, 1
    ne $S10, ":", rx1412_fail
    add rx1412_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."arglist"()
    unless $P10, rx1412_fail
    rx1412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1412_pos = $P10."pos"()
    goto alt1418_end
  alt1418_3:
    set_addr $I10, alt1418_4
    rx1412_cur."!mark_push"(0, rx1412_pos, $I10)
.annotate 'line', 594
  # rx literal  "("
    add $I11, rx1412_pos, 1
    gt $I11, rx1412_eos, rx1412_fail
    sub $I11, rx1412_pos, rx1412_off
    substr $S10, rx1412_tgt, $I11, 1
    ne $S10, "(", rx1412_fail
    add rx1412_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1412_fail
    rx1412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1412_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1412_pos, 1
    gt $I11, rx1412_eos, rx1412_fail
    sub $I11, rx1412_pos, rx1412_off
    substr $S10, rx1412_tgt, $I11, 1
    ne $S10, ")", rx1412_fail
    add rx1412_pos, 1
    goto alt1418_end
  alt1418_4:
.annotate 'line', 595
  # rx subrule "normspace" subtype=method negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."normspace"()
    unless $P10, rx1412_fail
    rx1412_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1412_cur."!cursor_pos"(rx1412_pos)
    $P10 = rx1412_cur."nibbler"()
    unless $P10, rx1412_fail
    rx1412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1412_pos = $P10."pos"()
  alt1418_end:
.annotate 'line', 596
    (rx1412_rep) = rx1412_cur."!mark_commit"($I1423)
  rxquantr1417_done:
.annotate 'line', 588
  # rx pass
    rx1412_cur."!cursor_pass"(rx1412_pos, "assertion:sym<name>")
    rx1412_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1412_pos)
    .return (rx1412_cur)
  rx1412_fail:
.annotate 'line', 567
    (rx1412_rep, rx1412_pos, $I10, $P10) = rx1412_cur."!mark_fail"(0)
    lt rx1412_pos, -1, rx1412_done
    eq rx1412_pos, -1, rx1412_fail
    jump $I10
  rx1412_done:
    rx1412_cur."!cursor_fail"()
    rx1412_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1412_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("364_1278500537.15927") :method
.annotate 'line', 567
    $P1414 = self."!PREFIX__!subrule"("identifier", "")
    new $P1415, "ResizablePMCArray"
    push $P1415, $P1414
    .return ($P1415)
.end


.namespace ["NQP";"Regex"]
.sub "_block1419"  :anon :subid("365_1278500537.15927") :method :outer("363_1278500537.15927")
.annotate 'line', 591
    .local string rx1421_tgt
    .local int rx1421_pos
    .local int rx1421_off
    .local int rx1421_eos
    .local int rx1421_rep
    .local pmc rx1421_cur
    (rx1421_cur, rx1421_pos, rx1421_tgt) = self."!cursor_start"()
    rx1421_cur."!cursor_debug"("START ", "")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1422_done
    goto rxscan1422_scan
  rxscan1422_loop:
    ($P10) = rx1421_cur."from"()
    inc $P10
    set rx1421_pos, $P10
    ge rx1421_pos, rx1421_eos, rxscan1422_done
  rxscan1422_scan:
    set_addr $I10, rxscan1422_loop
    rx1421_cur."!mark_push"(0, rx1421_pos, $I10)
  rxscan1422_done:
  # rx literal  ">"
    add $I11, rx1421_pos, 1
    gt $I11, rx1421_eos, rx1421_fail
    sub $I11, rx1421_pos, rx1421_off
    substr $S10, rx1421_tgt, $I11, 1
    ne $S10, ">", rx1421_fail
    add rx1421_pos, 1
  # rx pass
    rx1421_cur."!cursor_pass"(rx1421_pos, "")
    rx1421_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1421_pos)
    .return (rx1421_cur)
  rx1421_fail:
    (rx1421_rep, rx1421_pos, $I10, $P10) = rx1421_cur."!mark_fail"(0)
    lt rx1421_pos, -1, rx1421_done
    eq rx1421_pos, -1, rx1421_fail
    jump $I10
  rx1421_done:
    rx1421_cur."!cursor_fail"()
    rx1421_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1421_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("366_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .local string rx1425_tgt
    .local int rx1425_pos
    .local int rx1425_off
    .local int rx1425_eos
    .local int rx1425_rep
    .local pmc rx1425_cur
    (rx1425_cur, rx1425_pos, rx1425_tgt) = self."!cursor_start"()
    rx1425_cur."!cursor_debug"("START ", "assertion:sym<var>")
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
.annotate 'line', 600
  # rx enumcharlist negate=0 zerowidth
    ge rx1425_pos, rx1425_eos, rx1425_fail
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
.annotate 'line', 599
  # rx pass
    rx1425_cur."!cursor_pass"(rx1425_pos, "assertion:sym<var>")
    rx1425_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1425_pos)
    .return (rx1425_cur)
  rx1425_fail:
.annotate 'line', 567
    (rx1425_rep, rx1425_pos, $I10, $P10) = rx1425_cur."!mark_fail"(0)
    lt rx1425_pos, -1, rx1425_done
    eq rx1425_pos, -1, rx1425_fail
    jump $I10
  rx1425_done:
    rx1425_cur."!cursor_fail"()
    rx1425_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1425_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("367_1278500537.15927") :method
.annotate 'line', 567
    new $P1427, "ResizablePMCArray"
    push $P1427, "$"
    push $P1427, "@"
    .return ($P1427)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("368_1278500537.15927") :method :outer("349_1278500537.15927")
.annotate 'line', 567
    .local string rx1430_tgt
    .local int rx1430_pos
    .local int rx1430_off
    .local int rx1430_eos
    .local int rx1430_rep
    .local pmc rx1430_cur
    (rx1430_cur, rx1430_pos, rx1430_tgt) = self."!cursor_start"()
    rx1430_cur."!cursor_debug"("START ", "codeblock")
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
.annotate 'line', 604
  # rx subrule "LANG" subtype=capture negate=
    rx1430_cur."!cursor_pos"(rx1430_pos)
    $P10 = rx1430_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1430_fail
    rx1430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1430_pos = $P10."pos"()
.annotate 'line', 603
  # rx pass
    rx1430_cur."!cursor_pass"(rx1430_pos, "codeblock")
    rx1430_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1430_pos)
    .return (rx1430_cur)
  rx1430_fail:
.annotate 'line', 567
    (rx1430_rep, rx1430_pos, $I10, $P10) = rx1430_cur."!mark_fail"(0)
    lt rx1430_pos, -1, rx1430_done
    eq rx1430_pos, -1, rx1430_fail
    jump $I10
  rx1430_done:
    rx1430_cur."!cursor_fail"()
    rx1430_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1430_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("369_1278500537.15927") :method
.annotate 'line', 567
    $P1432 = self."!PREFIX__!subrule"("LANG", "")
    new $P1433, "ResizablePMCArray"
    push $P1433, $P1432
    .return ($P1433)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1436" :load :anon :subid("370_1278500537.15927")
.annotate 'line', 4
    .const 'Sub' $P1438 = "11_1278500537.15927" 
    $P1439 = $P1438()
    .return ($P1439)
.end


.namespace []
.sub "_block1457" :load :anon :subid("371_1278500537.15927")
.annotate 'line', 1
    .const 'Sub' $P1459 = "10_1278500537.15927" 
    $P1460 = $P1459()
    .return ($P1460)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1278500542.82783")
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
    .const 'Sub' $P2449 = "143_1278500542.82783" 
    .return ($P2449)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1278500542.82783")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1278500542.82783" 
    .local pmc block
    set block, $P12
    $P2452 = get_root_global ["parrot"], "P6metaclass"
    $P2452."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1278500542.82783") :outer("10_1278500542.82783")
.annotate 'line', 3
    .const 'Sub' $P2443 = "142_1278500542.82783" 
    capture_lex $P2443
    get_hll_global $P2326, ["NQP";"RegexActions"], "_block2325" 
    capture_lex $P2326
    .const 'Sub' $P2315 = "132_1278500542.82783" 
    capture_lex $P2315
    .const 'Sub' $P2308 = "131_1278500542.82783" 
    capture_lex $P2308
    .const 'Sub' $P2301 = "130_1278500542.82783" 
    capture_lex $P2301
    .const 'Sub' $P2294 = "129_1278500542.82783" 
    capture_lex $P2294
    .const 'Sub' $P2281 = "128_1278500542.82783" 
    capture_lex $P2281
    .const 'Sub' $P2271 = "127_1278500542.82783" 
    capture_lex $P2271
    .const 'Sub' $P2261 = "126_1278500542.82783" 
    capture_lex $P2261
    .const 'Sub' $P2251 = "125_1278500542.82783" 
    capture_lex $P2251
    .const 'Sub' $P2244 = "124_1278500542.82783" 
    capture_lex $P2244
    .const 'Sub' $P2230 = "123_1278500542.82783" 
    capture_lex $P2230
    .const 'Sub' $P2220 = "122_1278500542.82783" 
    capture_lex $P2220
    .const 'Sub' $P2183 = "121_1278500542.82783" 
    capture_lex $P2183
    .const 'Sub' $P2169 = "120_1278500542.82783" 
    capture_lex $P2169
    .const 'Sub' $P2159 = "119_1278500542.82783" 
    capture_lex $P2159
    .const 'Sub' $P2149 = "118_1278500542.82783" 
    capture_lex $P2149
    .const 'Sub' $P2139 = "117_1278500542.82783" 
    capture_lex $P2139
    .const 'Sub' $P2129 = "116_1278500542.82783" 
    capture_lex $P2129
    .const 'Sub' $P2119 = "115_1278500542.82783" 
    capture_lex $P2119
    .const 'Sub' $P2091 = "114_1278500542.82783" 
    capture_lex $P2091
    .const 'Sub' $P2074 = "113_1278500542.82783" 
    capture_lex $P2074
    .const 'Sub' $P2064 = "112_1278500542.82783" 
    capture_lex $P2064
    .const 'Sub' $P2051 = "111_1278500542.82783" 
    capture_lex $P2051
    .const 'Sub' $P2038 = "110_1278500542.82783" 
    capture_lex $P2038
    .const 'Sub' $P2025 = "109_1278500542.82783" 
    capture_lex $P2025
    .const 'Sub' $P2015 = "108_1278500542.82783" 
    capture_lex $P2015
    .const 'Sub' $P1986 = "107_1278500542.82783" 
    capture_lex $P1986
    .const 'Sub' $P1962 = "106_1278500542.82783" 
    capture_lex $P1962
    .const 'Sub' $P1952 = "105_1278500542.82783" 
    capture_lex $P1952
    .const 'Sub' $P1942 = "104_1278500542.82783" 
    capture_lex $P1942
    .const 'Sub' $P1915 = "103_1278500542.82783" 
    capture_lex $P1915
    .const 'Sub' $P1897 = "102_1278500542.82783" 
    capture_lex $P1897
    .const 'Sub' $P1887 = "101_1278500542.82783" 
    capture_lex $P1887
    .const 'Sub' $P1783 = "98_1278500542.82783" 
    capture_lex $P1783
    .const 'Sub' $P1773 = "97_1278500542.82783" 
    capture_lex $P1773
    .const 'Sub' $P1744 = "96_1278500542.82783" 
    capture_lex $P1744
    .const 'Sub' $P1702 = "95_1278500542.82783" 
    capture_lex $P1702
    .const 'Sub' $P1686 = "94_1278500542.82783" 
    capture_lex $P1686
    .const 'Sub' $P1677 = "93_1278500542.82783" 
    capture_lex $P1677
    .const 'Sub' $P1645 = "92_1278500542.82783" 
    capture_lex $P1645
    .const 'Sub' $P1546 = "89_1278500542.82783" 
    capture_lex $P1546
    .const 'Sub' $P1529 = "88_1278500542.82783" 
    capture_lex $P1529
    .const 'Sub' $P1509 = "87_1278500542.82783" 
    capture_lex $P1509
    .const 'Sub' $P1397 = "84_1278500542.82783" 
    capture_lex $P1397
    .const 'Sub' $P1340 = "80_1278500542.82783" 
    capture_lex $P1340
    .const 'Sub' $P1300 = "78_1278500542.82783" 
    capture_lex $P1300
    .const 'Sub' $P1250 = "76_1278500542.82783" 
    capture_lex $P1250
    .const 'Sub' $P1240 = "75_1278500542.82783" 
    capture_lex $P1240
    .const 'Sub' $P1230 = "74_1278500542.82783" 
    capture_lex $P1230
    .const 'Sub' $P1159 = "72_1278500542.82783" 
    capture_lex $P1159
    .const 'Sub' $P1149 = "71_1278500542.82783" 
    capture_lex $P1149
    .const 'Sub' $P1132 = "70_1278500542.82783" 
    capture_lex $P1132
    .const 'Sub' $P1115 = "69_1278500542.82783" 
    capture_lex $P1115
    .const 'Sub' $P1098 = "68_1278500542.82783" 
    capture_lex $P1098
    .const 'Sub' $P1088 = "67_1278500542.82783" 
    capture_lex $P1088
    .const 'Sub' $P1078 = "66_1278500542.82783" 
    capture_lex $P1078
    .const 'Sub' $P1068 = "65_1278500542.82783" 
    capture_lex $P1068
    .const 'Sub' $P1044 = "64_1278500542.82783" 
    capture_lex $P1044
    .const 'Sub' $P991 = "63_1278500542.82783" 
    capture_lex $P991
    .const 'Sub' $P981 = "62_1278500542.82783" 
    capture_lex $P981
    .const 'Sub' $P892 = "60_1278500542.82783" 
    capture_lex $P892
    .const 'Sub' $P866 = "59_1278500542.82783" 
    capture_lex $P866
    .const 'Sub' $P850 = "58_1278500542.82783" 
    capture_lex $P850
    .const 'Sub' $P840 = "57_1278500542.82783" 
    capture_lex $P840
    .const 'Sub' $P830 = "56_1278500542.82783" 
    capture_lex $P830
    .const 'Sub' $P820 = "55_1278500542.82783" 
    capture_lex $P820
    .const 'Sub' $P810 = "54_1278500542.82783" 
    capture_lex $P810
    .const 'Sub' $P800 = "53_1278500542.82783" 
    capture_lex $P800
    .const 'Sub' $P790 = "52_1278500542.82783" 
    capture_lex $P790
    .const 'Sub' $P780 = "51_1278500542.82783" 
    capture_lex $P780
    .const 'Sub' $P770 = "50_1278500542.82783" 
    capture_lex $P770
    .const 'Sub' $P760 = "49_1278500542.82783" 
    capture_lex $P760
    .const 'Sub' $P750 = "48_1278500542.82783" 
    capture_lex $P750
    .const 'Sub' $P740 = "47_1278500542.82783" 
    capture_lex $P740
    .const 'Sub' $P730 = "46_1278500542.82783" 
    capture_lex $P730
    .const 'Sub' $P720 = "45_1278500542.82783" 
    capture_lex $P720
    .const 'Sub' $P702 = "44_1278500542.82783" 
    capture_lex $P702
    .const 'Sub' $P667 = "43_1278500542.82783" 
    capture_lex $P667
    .const 'Sub' $P651 = "42_1278500542.82783" 
    capture_lex $P651
    .const 'Sub' $P630 = "41_1278500542.82783" 
    capture_lex $P630
    .const 'Sub' $P610 = "40_1278500542.82783" 
    capture_lex $P610
    .const 'Sub' $P597 = "39_1278500542.82783" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1278500542.82783" 
    capture_lex $P571
    .const 'Sub' $P535 = "37_1278500542.82783" 
    capture_lex $P535
    .const 'Sub' $P518 = "36_1278500542.82783" 
    capture_lex $P518
    .const 'Sub' $P504 = "35_1278500542.82783" 
    capture_lex $P504
    .const 'Sub' $P451 = "33_1278500542.82783" 
    capture_lex $P451
    .const 'Sub' $P440 = "32_1278500542.82783" 
    capture_lex $P440
    .const 'Sub' $P427 = "31_1278500542.82783" 
    capture_lex $P427
    .const 'Sub' $P407 = "30_1278500542.82783" 
    capture_lex $P407
    .const 'Sub' $P397 = "29_1278500542.82783" 
    capture_lex $P397
    .const 'Sub' $P387 = "28_1278500542.82783" 
    capture_lex $P387
    .const 'Sub' $P371 = "27_1278500542.82783" 
    capture_lex $P371
    .const 'Sub' $P288 = "25_1278500542.82783" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1278500542.82783" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1278500542.82783" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1278500542.82783" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1278500542.82783" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1278500542.82783" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1278500542.82783" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1278500542.82783" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1278500542.82783" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1278500542.82783" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1278500542.82783" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1278500542.82783" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1278500542.82783" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1278500542.82783" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1278500542.82783" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 223
    .const 'Sub' $P100 = "18_1278500542.82783" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 832
    .const 'Sub' $P151 = "19_1278500542.82783" 
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
    .const 'Sub' $P2439 = "141_1278500542.82783" 
    .return ($P2439)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1278500542.82783")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2443 = "142_1278500542.82783" 
    capture_lex $P2443
    $P2443()
    $P2446 = get_root_global ["parrot"], "P6metaclass"
    $P2446."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2442"  :anon :subid("142_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "xblock_immediate"  :subid("12_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "block_immediate"  :subid("13_1278500542.82783") :outer("11_1278500542.82783")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1278500542.82783" 
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
    .const 'Sub' $P40 = "14_1278500542.82783" 
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
.sub "_block39"  :anon :subid("14_1278500542.82783") :outer("13_1278500542.82783")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1278500542.82783" 
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
    .const 'Sub' $P51 = "15_1278500542.82783" 
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
.sub "_block50"  :anon :subid("15_1278500542.82783") :outer("14_1278500542.82783")
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
.sub "vivitype"  :subid("16_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "colonpair_str"  :subid("17_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "push_block_handler"  :subid("18_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "control"  :subid("19_1278500542.82783") :outer("11_1278500542.82783")
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
.sub "TOP"  :subid("20_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "deflongname"  :subid("21_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "comp_unit"  :subid("22_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statementlist"  :subid("23_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1278500542.82783" 
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
    .const 'Sub' $P262 = "24_1278500542.82783" 
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
.sub "_block261"  :anon :subid("24_1278500542.82783") :outer("23_1278500542.82783")
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
.sub "statement"  :subid("25_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1278500542.82783" 
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
    .const 'Sub' $P300 = "26_1278500542.82783" 
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
.sub "_block299"  :anon :subid("26_1278500542.82783") :outer("25_1278500542.82783")
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
.sub "xblock"  :subid("27_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "pblock"  :subid("28_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "block"  :subid("29_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "blockoid"  :subid("30_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "newpad"  :subid("31_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "outerctx"  :subid("32_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<if>"  :subid("33_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_454
.annotate 'line', 150
    .const 'Sub' $P482 = "34_1278500542.82783" 
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
    .const 'Sub' $P482 = "34_1278500542.82783" 
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
.sub "_block481"  :anon :subid("34_1278500542.82783") :outer("33_1278500542.82783")
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
.sub "statement_control:sym<unless>"  :subid("35_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<while>"  :subid("36_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<repeat>"  :subid("37_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<for>"  :subid("38_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<return>"  :subid("39_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<CATCH>"  :subid("40_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_prefix:sym<try>"  :subid("43_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "blorst"  :subid("44_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<fatarrow>"  :subid("49_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<colonpair>"  :subid("50_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<variable>"  :subid("51_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<package_declarator>"  :subid("52_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<scope_declarator>"  :subid("53_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<routine_declarator>"  :subid("54_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<regex_declarator>"  :subid("55_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<statement_prefix>"  :subid("56_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<lambda>"  :subid("57_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "fatarrow"  :subid("58_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "colonpair"  :subid("59_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "variable"  :subid("60_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_895
.annotate 'line', 328
    .const 'Sub' $P908 = "61_1278500542.82783" 
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
    .const 'Sub' $P908 = "61_1278500542.82783" 
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
.sub "_block907"  :anon :subid("61_1278500542.82783") :outer("60_1278500542.82783")
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
.sub "package_declarator:sym<module>"  :subid("62_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "package_declarator:sym<class>"  :subid("63_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "package_def"  :subid("64_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "scope_declarator:sym<my>"  :subid("65_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "scope_declarator:sym<our>"  :subid("66_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "scope_declarator:sym<has>"  :subid("67_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "scoped"  :subid("68_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "declarator"  :subid("69_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "multi_declarator:sym<multi>"  :subid("70_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "multi_declarator:sym<null>"  :subid("71_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "variable_declarator"  :subid("72_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1162
.annotate 'line', 417
    .const 'Sub' $P1202 = "73_1278500542.82783" 
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
    .const 'Sub' $P1202 = "73_1278500542.82783" 
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
.sub "_block1201"  :anon :subid("73_1278500542.82783") :outer("72_1278500542.82783")
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
.sub "routine_declarator:sym<sub>"  :subid("74_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "routine_declarator:sym<method>"  :subid("75_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "routine_def"  :subid("76_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1253
.annotate 'line', 448
    .const 'Sub' $P1264 = "77_1278500542.82783" 
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
    .const 'Sub' $P1264 = "77_1278500542.82783" 
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
.sub "_block1263"  :anon :subid("77_1278500542.82783") :outer("76_1278500542.82783")
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
.sub "method_def"  :subid("78_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1303
.annotate 'line', 466
    .const 'Sub' $P1319 = "79_1278500542.82783" 
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
    .const 'Sub' $P1319 = "79_1278500542.82783" 
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
.sub "_block1318"  :anon :subid("79_1278500542.82783") :outer("78_1278500542.82783")
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
.sub "signature"  :subid("80_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1343
.annotate 'line', 481
    .const 'Sub' $P1369 = "82_1278500542.82783" 
    capture_lex $P1369
    .const 'Sub' $P1354 = "81_1278500542.82783" 
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
    .const 'Sub' $P1354 = "81_1278500542.82783" 
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
    .const 'Sub' $P1369 = "82_1278500542.82783" 
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
.sub "_block1353"  :anon :subid("81_1278500542.82783") :outer("80_1278500542.82783")
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
.sub "_block1368"  :anon :subid("82_1278500542.82783") :outer("80_1278500542.82783")
.annotate 'line', 487
    .const 'Sub' $P1378 = "83_1278500542.82783" 
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
    .const 'Sub' $P1378 = "83_1278500542.82783" 
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
.sub "_block1377"  :anon :subid("83_1278500542.82783") :outer("82_1278500542.82783")
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
.sub "parameter"  :subid("84_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1400
.annotate 'line', 496
    .const 'Sub' $P1481 = "85_1278500542.82783" 
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
    .const 'Sub' $P1481 = "85_1278500542.82783" 
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
.sub "_block1480"  :anon :subid("85_1278500542.82783") :outer("84_1278500542.82783")
.annotate 'line', 527
    .const 'Sub' $P1493 = "86_1278500542.82783" 
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
    .const 'Sub' $P1493 = "86_1278500542.82783" 
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
.sub "_block1492"  :anon :subid("86_1278500542.82783") :outer("85_1278500542.82783")
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
.sub "param_var"  :subid("87_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "named_param"  :subid("88_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "regex_declarator"  :subid("89_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1549
    .param pmc param_1550 :optional
    .param int has_param_1550 :opt_flag
.annotate 'line', 550
    .const 'Sub' $P1620 = "91_1278500542.82783" 
    capture_lex $P1620
    .const 'Sub' $P1592 = "90_1278500542.82783" 
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
    .const 'Sub' $P1620 = "91_1278500542.82783" 
    capture_lex $P1620
    $P1620()
    goto if_1587_end
  if_1587:
.annotate 'line', 583
    .const 'Sub' $P1592 = "90_1278500542.82783" 
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
.sub "_block1619"  :anon :subid("91_1278500542.82783") :outer("89_1278500542.82783")
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
.sub "_block1591"  :anon :subid("90_1278500542.82783") :outer("89_1278500542.82783")
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
.sub "dotty"  :subid("92_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<self>"  :subid("93_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<identifier>"  :subid("94_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<name>"  :subid("95_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<pir::op>"  :subid("96_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "args"  :subid("97_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "arglist"  :subid("98_1278500542.82783") :method :outer("11_1278500542.82783")
    .param pmc param_1786
.annotate 'line', 664
    .const 'Sub' $P1797 = "99_1278500542.82783" 
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
    .const 'Sub' $P1797 = "99_1278500542.82783" 
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
.sub "_block1796"  :anon :subid("99_1278500542.82783") :outer("98_1278500542.82783")
.annotate 'line', 666
    .const 'Sub' $P1818 = "100_1278500542.82783" 
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
    .const 'Sub' $P1818 = "100_1278500542.82783" 
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
.sub "_block1817"  :anon :subid("100_1278500542.82783") :outer("99_1278500542.82783")
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
.sub "term:sym<value>"  :subid("101_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "circumfix:sym<( )>"  :subid("102_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "circumfix:sym<[ ]>"  :subid("103_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "circumfix:sym<ang>"  :subid("104_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "circumfix:sym<{ }>"  :subid("106_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "circumfix:sym<sigil>"  :subid("107_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "semilist"  :subid("108_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postcircumfix:sym<[ ]>"  :subid("109_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postcircumfix:sym<{ }>"  :subid("110_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postcircumfix:sym<ang>"  :subid("111_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postcircumfix:sym<( )>"  :subid("112_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "value"  :subid("113_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "number"  :subid("114_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<apos>"  :subid("115_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<dblq>"  :subid("116_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<qq>"  :subid("117_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<q>"  :subid("118_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<Q>"  :subid("119_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym<Q:PIR>"  :subid("120_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote:sym</ />"  :subid("121_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote_escape:sym<$>"  :subid("122_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote_escape:sym<{ }>"  :subid("123_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "quote_escape:sym<esc>"  :subid("124_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postfix:sym<.>"  :subid("125_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postfix:sym<++>"  :subid("126_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "postfix:sym<-->"  :subid("127_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "prefix:sym<make>"  :subid("128_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<next>"  :subid("129_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<last>"  :subid("130_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "term:sym<redo>"  :subid("131_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "infix:sym<~~>"  :subid("132_1278500542.82783") :method :outer("11_1278500542.82783")
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
.sub "_block2325"  :subid("133_1278500542.82783") :outer("11_1278500542.82783")
.annotate 'line', 850
    .const 'Sub' $P2411 = "140_1278500542.82783" 
    capture_lex $P2411
    .const 'Sub' $P2398 = "139_1278500542.82783" 
    capture_lex $P2398
    .const 'Sub' $P2381 = "138_1278500542.82783" 
    capture_lex $P2381
    .const 'Sub' $P2368 = "137_1278500542.82783" 
    capture_lex $P2368
    .const 'Sub' $P2355 = "136_1278500542.82783" 
    capture_lex $P2355
    .const 'Sub' $P2342 = "135_1278500542.82783" 
    capture_lex $P2342
    .const 'Sub' $P2327 = "134_1278500542.82783" 
    capture_lex $P2327
.annotate 'line', 884
    .const 'Sub' $P2411 = "140_1278500542.82783" 
    newclosure $P2436, $P2411
.annotate 'line', 850
    .return ($P2436)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("134_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "metachar:sym<{ }>"  :subid("135_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "metachar:sym<nqpvar>"  :subid("136_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "assertion:sym<{ }>"  :subid("137_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "assertion:sym<?{ }>"  :subid("138_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "assertion:sym<var>"  :subid("139_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "codeblock"  :subid("140_1278500542.82783") :method :outer("133_1278500542.82783")
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
.sub "_block2438" :load :anon :subid("141_1278500542.82783")
.annotate 'line', 3
    .const 'Sub' $P2440 = "11_1278500542.82783" 
    $P2441 = $P2440()
    .return ($P2441)
.end


.namespace []
.sub "_block2448" :load :anon :subid("143_1278500542.82783")
.annotate 'line', 1
    .const 'Sub' $P2450 = "10_1278500542.82783" 
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
