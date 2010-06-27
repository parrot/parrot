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
.sub "_block11"  :anon :subid("10_1277356913.9538")
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
    $P1426 = $P14()
.annotate 'line', 1
    .return ($P1426)
    .const 'Sub' $P1428 = "363_1277356913.9538" 
    .return ($P1428)
.end


.namespace []
.sub "" :load :init :subid("post364") :outer("10_1277356913.9538")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1277356913.9538" 
    .local pmc block
    set block, $P12
    $P1431 = get_root_global ["parrot"], "P6metaclass"
    $P1431."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1277356913.9538") :outer("10_1277356913.9538")
.annotate 'line', 4
    get_hll_global $P1342, ["NQP";"Regex"], "_block1341" 
    capture_lex $P1342
    .const 'Sub' $P1328 = "340_1277356913.9538" 
    capture_lex $P1328
    .const 'Sub' $P1322 = "338_1277356913.9538" 
    capture_lex $P1322
    .const 'Sub' $P1316 = "336_1277356913.9538" 
    capture_lex $P1316
    .const 'Sub' $P1310 = "334_1277356913.9538" 
    capture_lex $P1310
    .const 'Sub' $P1304 = "332_1277356913.9538" 
    capture_lex $P1304
    .const 'Sub' $P1298 = "330_1277356913.9538" 
    capture_lex $P1298
    .const 'Sub' $P1291 = "328_1277356913.9538" 
    capture_lex $P1291
    .const 'Sub' $P1284 = "326_1277356913.9538" 
    capture_lex $P1284
    .const 'Sub' $P1277 = "324_1277356913.9538" 
    capture_lex $P1277
    .const 'Sub' $P1270 = "322_1277356913.9538" 
    capture_lex $P1270
    .const 'Sub' $P1264 = "320_1277356913.9538" 
    capture_lex $P1264
    .const 'Sub' $P1257 = "318_1277356913.9538" 
    capture_lex $P1257
    .const 'Sub' $P1250 = "316_1277356913.9538" 
    capture_lex $P1250
    .const 'Sub' $P1243 = "314_1277356913.9538" 
    capture_lex $P1243
    .const 'Sub' $P1236 = "312_1277356913.9538" 
    capture_lex $P1236
    .const 'Sub' $P1229 = "310_1277356913.9538" 
    capture_lex $P1229
    .const 'Sub' $P1222 = "308_1277356913.9538" 
    capture_lex $P1222
    .const 'Sub' $P1215 = "306_1277356913.9538" 
    capture_lex $P1215
    .const 'Sub' $P1208 = "304_1277356913.9538" 
    capture_lex $P1208
    .const 'Sub' $P1201 = "302_1277356913.9538" 
    capture_lex $P1201
    .const 'Sub' $P1194 = "300_1277356913.9538" 
    capture_lex $P1194
    .const 'Sub' $P1187 = "298_1277356913.9538" 
    capture_lex $P1187
    .const 'Sub' $P1180 = "296_1277356913.9538" 
    capture_lex $P1180
    .const 'Sub' $P1173 = "294_1277356913.9538" 
    capture_lex $P1173
    .const 'Sub' $P1166 = "292_1277356913.9538" 
    capture_lex $P1166
    .const 'Sub' $P1159 = "290_1277356913.9538" 
    capture_lex $P1159
    .const 'Sub' $P1152 = "288_1277356913.9538" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "286_1277356913.9538" 
    capture_lex $P1145
    .const 'Sub' $P1138 = "284_1277356913.9538" 
    capture_lex $P1138
    .const 'Sub' $P1131 = "282_1277356913.9538" 
    capture_lex $P1131
    .const 'Sub' $P1124 = "280_1277356913.9538" 
    capture_lex $P1124
    .const 'Sub' $P1117 = "278_1277356913.9538" 
    capture_lex $P1117
    .const 'Sub' $P1110 = "276_1277356913.9538" 
    capture_lex $P1110
    .const 'Sub' $P1103 = "274_1277356913.9538" 
    capture_lex $P1103
    .const 'Sub' $P1096 = "272_1277356913.9538" 
    capture_lex $P1096
    .const 'Sub' $P1089 = "270_1277356913.9538" 
    capture_lex $P1089
    .const 'Sub' $P1082 = "268_1277356913.9538" 
    capture_lex $P1082
    .const 'Sub' $P1076 = "266_1277356913.9538" 
    capture_lex $P1076
    .const 'Sub' $P1069 = "264_1277356913.9538" 
    capture_lex $P1069
    .const 'Sub' $P1062 = "262_1277356913.9538" 
    capture_lex $P1062
    .const 'Sub' $P1055 = "260_1277356913.9538" 
    capture_lex $P1055
    .const 'Sub' $P1048 = "258_1277356913.9538" 
    capture_lex $P1048
    .const 'Sub' $P1041 = "256_1277356913.9538" 
    capture_lex $P1041
    .const 'Sub' $P1034 = "254_1277356913.9538" 
    capture_lex $P1034
    .const 'Sub' $P1027 = "252_1277356913.9538" 
    capture_lex $P1027
    .const 'Sub' $P1021 = "250_1277356913.9538" 
    capture_lex $P1021
    .const 'Sub' $P1015 = "248_1277356913.9538" 
    capture_lex $P1015
    .const 'Sub' $P1010 = "246_1277356913.9538" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "244_1277356913.9538" 
    capture_lex $P1004
    .const 'Sub' $P998 = "242_1277356913.9538" 
    capture_lex $P998
    .const 'Sub' $P993 = "240_1277356913.9538" 
    capture_lex $P993
    .const 'Sub' $P988 = "238_1277356913.9538" 
    capture_lex $P988
    .const 'Sub' $P980 = "236_1277356913.9538" 
    capture_lex $P980
    .const 'Sub' $P972 = "234_1277356913.9538" 
    capture_lex $P972
    .const 'Sub' $P967 = "232_1277356913.9538" 
    capture_lex $P967
    .const 'Sub' $P962 = "230_1277356913.9538" 
    capture_lex $P962
    .const 'Sub' $P957 = "228_1277356913.9538" 
    capture_lex $P957
    .const 'Sub' $P949 = "226_1277356913.9538" 
    capture_lex $P949
    .const 'Sub' $P941 = "224_1277356913.9538" 
    capture_lex $P941
    .const 'Sub' $P936 = "222_1277356913.9538" 
    capture_lex $P936
    .const 'Sub' $P931 = "220_1277356913.9538" 
    capture_lex $P931
    .const 'Sub' $P926 = "218_1277356913.9538" 
    capture_lex $P926
    .const 'Sub' $P920 = "216_1277356913.9538" 
    capture_lex $P920
    .const 'Sub' $P914 = "214_1277356913.9538" 
    capture_lex $P914
    .const 'Sub' $P908 = "212_1277356913.9538" 
    capture_lex $P908
    .const 'Sub' $P902 = "210_1277356913.9538" 
    capture_lex $P902
    .const 'Sub' $P896 = "208_1277356913.9538" 
    capture_lex $P896
    .const 'Sub' $P891 = "206_1277356913.9538" 
    capture_lex $P891
    .const 'Sub' $P886 = "204_1277356913.9538" 
    capture_lex $P886
    .const 'Sub' $P873 = "200_1277356913.9538" 
    capture_lex $P873
    .const 'Sub' $P865 = "198_1277356913.9538" 
    capture_lex $P865
    .const 'Sub' $P859 = "196_1277356913.9538" 
    capture_lex $P859
    .const 'Sub' $P852 = "194_1277356913.9538" 
    capture_lex $P852
    .const 'Sub' $P846 = "192_1277356913.9538" 
    capture_lex $P846
    .const 'Sub' $P838 = "190_1277356913.9538" 
    capture_lex $P838
    .const 'Sub' $P830 = "188_1277356913.9538" 
    capture_lex $P830
    .const 'Sub' $P824 = "186_1277356913.9538" 
    capture_lex $P824
    .const 'Sub' $P818 = "184_1277356913.9538" 
    capture_lex $P818
    .const 'Sub' $P803 = "180_1277356913.9538" 
    capture_lex $P803
    .const 'Sub' $P765 = "178_1277356913.9538" 
    capture_lex $P765
    .const 'Sub' $P756 = "176_1277356913.9538" 
    capture_lex $P756
    .const 'Sub' $P750 = "174_1277356913.9538" 
    capture_lex $P750
    .const 'Sub' $P740 = "172_1277356913.9538" 
    capture_lex $P740
    .const 'Sub' $P726 = "170_1277356913.9538" 
    capture_lex $P726
    .const 'Sub' $P717 = "168_1277356913.9538" 
    capture_lex $P717
    .const 'Sub' $P709 = "166_1277356913.9538" 
    capture_lex $P709
    .const 'Sub' $P699 = "164_1277356913.9538" 
    capture_lex $P699
    .const 'Sub' $P675 = "160_1277356913.9538" 
    capture_lex $P675
    .const 'Sub' $P650 = "158_1277356913.9538" 
    capture_lex $P650
    .const 'Sub' $P643 = "156_1277356913.9538" 
    capture_lex $P643
    .const 'Sub' $P636 = "154_1277356913.9538" 
    capture_lex $P636
    .const 'Sub' $P626 = "150_1277356913.9538" 
    capture_lex $P626
    .const 'Sub' $P618 = "148_1277356913.9538" 
    capture_lex $P618
    .const 'Sub' $P612 = "146_1277356913.9538" 
    capture_lex $P612
    .const 'Sub' $P599 = "144_1277356913.9538" 
    capture_lex $P599
    .const 'Sub' $P592 = "142_1277356913.9538" 
    capture_lex $P592
    .const 'Sub' $P585 = "140_1277356913.9538" 
    capture_lex $P585
    .const 'Sub' $P578 = "138_1277356913.9538" 
    capture_lex $P578
    .const 'Sub' $P550 = "134_1277356913.9538" 
    capture_lex $P550
    .const 'Sub' $P541 = "132_1277356913.9538" 
    capture_lex $P541
    .const 'Sub' $P534 = "130_1277356913.9538" 
    capture_lex $P534
    .const 'Sub' $P525 = "126_1277356913.9538" 
    capture_lex $P525
    .const 'Sub' $P520 = "124_1277356913.9538" 
    capture_lex $P520
    .const 'Sub' $P508 = "122_1277356913.9538" 
    capture_lex $P508
    .const 'Sub' $P496 = "120_1277356913.9538" 
    capture_lex $P496
    .const 'Sub' $P488 = "118_1277356913.9538" 
    capture_lex $P488
    .const 'Sub' $P483 = "116_1277356913.9538" 
    capture_lex $P483
    .const 'Sub' $P477 = "114_1277356913.9538" 
    capture_lex $P477
    .const 'Sub' $P471 = "112_1277356913.9538" 
    capture_lex $P471
    .const 'Sub' $P461 = "109_1277356913.9538" 
    capture_lex $P461
    .const 'Sub' $P455 = "107_1277356913.9538" 
    capture_lex $P455
    .const 'Sub' $P449 = "105_1277356913.9538" 
    capture_lex $P449
    .const 'Sub' $P443 = "103_1277356913.9538" 
    capture_lex $P443
    .const 'Sub' $P437 = "101_1277356913.9538" 
    capture_lex $P437
    .const 'Sub' $P431 = "99_1277356913.9538" 
    capture_lex $P431
    .const 'Sub' $P425 = "97_1277356913.9538" 
    capture_lex $P425
    .const 'Sub' $P416 = "95_1277356913.9538" 
    capture_lex $P416
    .const 'Sub' $P407 = "93_1277356913.9538" 
    capture_lex $P407
    .const 'Sub' $P394 = "89_1277356913.9538" 
    capture_lex $P394
    .const 'Sub' $P385 = "87_1277356913.9538" 
    capture_lex $P385
    .const 'Sub' $P375 = "83_1277356913.9538" 
    capture_lex $P375
    .const 'Sub' $P368 = "81_1277356913.9538" 
    capture_lex $P368
    .const 'Sub' $P361 = "79_1277356913.9538" 
    capture_lex $P361
    .const 'Sub' $P349 = "75_1277356913.9538" 
    capture_lex $P349
    .const 'Sub' $P341 = "73_1277356913.9538" 
    capture_lex $P341
    .const 'Sub' $P333 = "71_1277356913.9538" 
    capture_lex $P333
    .const 'Sub' $P313 = "69_1277356913.9538" 
    capture_lex $P313
    .const 'Sub' $P304 = "67_1277356913.9538" 
    capture_lex $P304
    .const 'Sub' $P286 = "64_1277356913.9538" 
    capture_lex $P286
    .const 'Sub' $P266 = "62_1277356913.9538" 
    capture_lex $P266
    .const 'Sub' $P257 = "58_1277356913.9538" 
    capture_lex $P257
    .const 'Sub' $P252 = "56_1277356913.9538" 
    capture_lex $P252
    .const 'Sub' $P243 = "52_1277356913.9538" 
    capture_lex $P243
    .const 'Sub' $P238 = "50_1277356913.9538" 
    capture_lex $P238
    .const 'Sub' $P233 = "48_1277356913.9538" 
    capture_lex $P233
    .const 'Sub' $P225 = "46_1277356913.9538" 
    capture_lex $P225
    .const 'Sub' $P218 = "44_1277356913.9538" 
    capture_lex $P218
    .const 'Sub' $P212 = "42_1277356913.9538" 
    capture_lex $P212
    .const 'Sub' $P204 = "40_1277356913.9538" 
    capture_lex $P204
    .const 'Sub' $P198 = "38_1277356913.9538" 
    capture_lex $P198
    .const 'Sub' $P192 = "36_1277356913.9538" 
    capture_lex $P192
    .const 'Sub' $P176 = "33_1277356913.9538" 
    capture_lex $P176
    .const 'Sub' $P161 = "31_1277356913.9538" 
    capture_lex $P161
    .const 'Sub' $P154 = "29_1277356913.9538" 
    capture_lex $P154
    .const 'Sub' $P104 = "26_1277356913.9538" 
    capture_lex $P104
    .const 'Sub' $P86 = "23_1277356913.9538" 
    capture_lex $P86
    .const 'Sub' $P72 = "21_1277356913.9538" 
    capture_lex $P72
    .const 'Sub' $P58 = "19_1277356913.9538" 
    capture_lex $P58
    .const 'Sub' $P50 = "17_1277356913.9538" 
    capture_lex $P50
    .const 'Sub' $P43 = "15_1277356913.9538" 
    capture_lex $P43
    .const 'Sub' $P35 = "13_1277356913.9538" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1277356913.9538" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 563
    get_hll_global $P1342, ["NQP";"Regex"], "_block1341" 
    capture_lex $P1342
    $P1405 = $P1342()
.annotate 'line', 4
    .return ($P1405)
    .const 'Sub' $P1407 = "362_1277356913.9538" 
    .return ($P1407)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post365") :outer("11_1277356913.9538")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 447
    get_hll_global $P1410, ["NQP"], "Grammar"
    $P1410."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 448
    get_hll_global $P1411, ["NQP"], "Grammar"
    $P1411."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 449
    get_hll_global $P1412, ["NQP"], "Grammar"
    $P1412."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 450
    get_hll_global $P1413, ["NQP"], "Grammar"
    $P1413."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 451
    get_hll_global $P1414, ["NQP"], "Grammar"
    $P1414."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 452
    get_hll_global $P1415, ["NQP"], "Grammar"
    $P1415."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 453
    get_hll_global $P1416, ["NQP"], "Grammar"
    $P1416."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 454
    get_hll_global $P1417, ["NQP"], "Grammar"
    $P1417."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 455
    get_hll_global $P1418, ["NQP"], "Grammar"
    $P1418."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 456
    get_hll_global $P1419, ["NQP"], "Grammar"
    $P1419."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 457
    get_hll_global $P1420, ["NQP"], "Grammar"
    $P1420."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 458
    get_hll_global $P1421, ["NQP"], "Grammar"
    $P1421."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 459
    get_hll_global $P1422, ["NQP"], "Grammar"
    $P1422."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 460
    get_hll_global $P1423, ["NQP"], "Grammar"
    $P1423."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 461
    get_hll_global $P1424, ["NQP"], "Grammar"
    $P1424."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 446
    $P1425 = get_root_global ["parrot"], "P6metaclass"
    $P1425."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "identifier"  :subid("13_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__identifier"  :subid("14_1277356913.9538") :method
.annotate 'line', 4
    $P38 = self."!PREFIX__!subrule"("ident", "")
    new $P39, "ResizablePMCArray"
    push $P39, $P38
    .return ($P39)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__name"  :subid("16_1277356913.9538") :method
.annotate 'line', 4
    new $P46, "ResizablePMCArray"
    push $P46, ""
    .return ($P46)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__deflongname"  :subid("18_1277356913.9538") :method
.annotate 'line', 4
    $P53 = self."!PREFIX__!subrule"("identifier", "")
    new $P54, "ResizablePMCArray"
    push $P54, $P53
    .return ($P54)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1277356913.9538") :method
.annotate 'line', 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__ws"  :subid("22_1277356913.9538") :method
.annotate 'line', 4
    new $P75, "ResizablePMCArray"
    push $P75, ""
    push $P75, ""
    .return ($P75)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P94 = "25_1277356913.9538" 
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
    .const 'Sub' $P94 = "25_1277356913.9538" 
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
.sub "!PREFIX__unv"  :subid("24_1277356913.9538") :method
.annotate 'line', 4
    new $P89, "ResizablePMCArray"
    push $P89, ""
    push $P89, ""
    push $P89, ""
    .return ($P89)
.end


.namespace ["NQP";"Grammar"]
.sub "_block93"  :anon :subid("25_1277356913.9538") :method :outer("23_1277356913.9538")
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
.sub "pod_comment"  :subid("26_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P145 = "28_1277356913.9538" 
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
    .const 'Sub' $P145 = "28_1277356913.9538" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1277356913.9538") :method
.annotate 'line', 4
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["NQP";"Grammar"]
.sub "_block144"  :anon :subid("28_1277356913.9538") :method :outer("26_1277356913.9538")
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
.sub "comp_unit"  :subid("29_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__comp_unit"  :subid("30_1277356913.9538") :method
.annotate 'line', 4
    $P157 = self."!PREFIX__!subrule"("newpad", "")
    new $P158, "ResizablePMCArray"
    push $P158, $P157
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statementlist"  :subid("32_1277356913.9538") :method
.annotate 'line', 4
    $P164 = self."!PREFIX__!subrule"("ws", "")
    $P165 = self."!PREFIX__!subrule"("ws", "")
    new $P166, "ResizablePMCArray"
    push $P166, $P164
    push $P166, $P165
    .return ($P166)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P182 = "35_1277356913.9538" 
    capture_lex $P182
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "statement")
    rx177_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
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
    .const 'Sub' $P182 = "35_1277356913.9538" 
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
.sub "!PREFIX__statement"  :subid("34_1277356913.9538") :method
.annotate 'line', 4
    new $P179, "ResizablePMCArray"
    push $P179, ""
    .return ($P179)
.end


.namespace ["NQP";"Grammar"]
.sub "_block181"  :anon :subid("35_1277356913.9538") :method :outer("33_1277356913.9538")
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
.sub "eat_terminator"  :subid("36_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__eat_terminator"  :subid("37_1277356913.9538") :method
.annotate 'line', 4
    new $P195, "ResizablePMCArray"
    push $P195, ""
    push $P195, ""
    push $P195, ""
    push $P195, ";"
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__xblock"  :subid("39_1277356913.9538") :method
.annotate 'line', 4
    $P201 = self."!PREFIX__!subrule"("EXPR", "")
    new $P202, "ResizablePMCArray"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__pblock"  :subid("41_1277356913.9538") :method
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
.sub "lambda"  :subid("42_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__lambda"  :subid("43_1277356913.9538") :method
.annotate 'line', 4
    new $P215, "ResizablePMCArray"
    push $P215, "<->"
    push $P215, "->"
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__block"  :subid("45_1277356913.9538") :method
.annotate 'line', 4
    $P221 = self."!PREFIX__!subrule"("panic", "")
    new $P222, "ResizablePMCArray"
    push $P222, $P221
    push $P222, "{"
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__blockoid"  :subid("47_1277356913.9538") :method
.annotate 'line', 4
    $P228 = self."!PREFIX__!subrule"("finishpad", "")
    new $P229, "ResizablePMCArray"
    push $P229, $P228
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__newpad"  :subid("49_1277356913.9538") :method
.annotate 'line', 4
    new $P236, "ResizablePMCArray"
    push $P236, ""
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__outerctx"  :subid("51_1277356913.9538") :method
.annotate 'line', 4
    new $P241, "ResizablePMCArray"
    push $P241, ""
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__finishpad"  :subid("53_1277356913.9538") :method
.annotate 'line', 4
    new $P246, "ResizablePMCArray"
    push $P246, ""
    .return ($P246)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1277356913.9538") :method
.annotate 'line', 148
    $P249 = self."!protoregex"("terminator")
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1277356913.9538") :method
.annotate 'line', 148
    $P251 = self."!PREFIX__!protoregex"("terminator")
    .return ($P251)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1277356913.9538") :method
.annotate 'line', 4
    new $P255, "ResizablePMCArray"
    push $P255, ";"
    .return ($P255)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1277356913.9538") :method
.annotate 'line', 4
    new $P260, "ResizablePMCArray"
    push $P260, "}"
    .return ($P260)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1277356913.9538") :method
.annotate 'line', 155
    $P263 = self."!protoregex"("statement_control")
    .return ($P263)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1277356913.9538") :method
.annotate 'line', 155
    $P265 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P265)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1277356913.9538") :method
.annotate 'line', 4
    new $P269, "ResizablePMCArray"
    push $P269, "if"
    .return ($P269)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P297 = "66_1277356913.9538" 
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
    .const 'Sub' $P297 = "66_1277356913.9538" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1277356913.9538") :method
.annotate 'line', 4
    new $P289, "ResizablePMCArray"
    push $P289, "unless"
    .return ($P289)
.end


.namespace ["NQP";"Grammar"]
.sub "_block296"  :anon :subid("66_1277356913.9538") :method :outer("64_1277356913.9538")
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
.sub "statement_control:sym<while>"  :subid("67_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1277356913.9538") :method
.annotate 'line', 4
    new $P307, "ResizablePMCArray"
    push $P307, "until"
    push $P307, "while"
    .return ($P307)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1277356913.9538") :method
.annotate 'line', 4
    new $P316, "ResizablePMCArray"
    push $P316, "repeat"
    .return ($P316)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1277356913.9538") :method
.annotate 'line', 4
    new $P336, "ResizablePMCArray"
    push $P336, "for"
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1277356913.9538") :method
.annotate 'line', 4
    new $P344, "ResizablePMCArray"
    push $P344, "CATCH"
    .return ($P344)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1277356913.9538") :method
.annotate 'line', 4
    new $P352, "ResizablePMCArray"
    push $P352, "CONTROL"
    .return ($P352)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1277356913.9538") :method
.annotate 'line', 198
    $P358 = self."!protoregex"("statement_prefix")
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1277356913.9538") :method
.annotate 'line', 198
    $P360 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1277356913.9538") :method
.annotate 'line', 4
    $P364 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P365, "ResizablePMCArray"
    push $P365, $P364
    .return ($P365)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1277356913.9538") :method
.annotate 'line', 4
    $P371 = self."!PREFIX__!subrule"("blorst", "try")
    new $P372, "ResizablePMCArray"
    push $P372, $P371
    .return ($P372)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__blorst"  :subid("84_1277356913.9538") :method
.annotate 'line', 4
    new $P378, "ResizablePMCArray"
    push $P378, ""
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1277356913.9538") :method
.annotate 'line', 212
    $P382 = self."!protoregex"("statement_mod_cond")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1277356913.9538") :method
.annotate 'line', 212
    $P384 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P384)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1277356913.9538") :method
.annotate 'line', 4
    $P388 = self."!PREFIX__!subrule"("ws", "if")
    new $P389, "ResizablePMCArray"
    push $P389, $P388
    .return ($P389)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1277356913.9538") :method
.annotate 'line', 4
    $P397 = self."!PREFIX__!subrule"("ws", "unless")
    new $P398, "ResizablePMCArray"
    push $P398, $P397
    .return ($P398)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1277356913.9538") :method
.annotate 'line', 217
    $P404 = self."!protoregex"("statement_mod_loop")
    .return ($P404)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1277356913.9538") :method
.annotate 'line', 217
    $P406 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1277356913.9538") :method
.annotate 'line', 4
    $P410 = self."!PREFIX__!subrule"("ws", "while")
    new $P411, "ResizablePMCArray"
    push $P411, $P410
    .return ($P411)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1277356913.9538") :method :outer("11_1277356913.9538")
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1277356913.9538") :method
.annotate 'line', 4
    $P419 = self."!PREFIX__!subrule"("ws", "until")
    new $P420, "ResizablePMCArray"
    push $P420, $P419
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("97_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
.annotate 'line', 224
  # rx subrule "fatarrow" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."fatarrow"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx426_pos = $P10."pos"()
  # rx pass
    rx426_cur."!cursor_pass"(rx426_pos, "term:sym<fatarrow>")
    rx426_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx426_pos)
    .return (rx426_cur)
  rx426_fail:
.annotate 'line', 4
    (rx426_rep, rx426_pos, $I10, $P10) = rx426_cur."!mark_fail"(0)
    lt rx426_pos, -1, rx426_done
    eq rx426_pos, -1, rx426_fail
    jump $I10
  rx426_done:
    rx426_cur."!cursor_fail"()
    rx426_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx426_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("98_1277356913.9538") :method
.annotate 'line', 4
    $P428 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("99_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx432_tgt
    .local int rx432_pos
    .local int rx432_off
    .local int rx432_eos
    .local int rx432_rep
    .local pmc rx432_cur
    (rx432_cur, rx432_pos, rx432_tgt) = self."!cursor_start"()
    rx432_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx432_cur
    .local pmc match
    .lex "$/", match
    length rx432_eos, rx432_tgt
    gt rx432_pos, rx432_eos, rx432_done
    set rx432_off, 0
    lt rx432_pos, 2, rx432_start
    sub rx432_off, rx432_pos, 1
    substr rx432_tgt, rx432_tgt, rx432_off
  rx432_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan436_done
    goto rxscan436_scan
  rxscan436_loop:
    ($P10) = rx432_cur."from"()
    inc $P10
    set rx432_pos, $P10
    ge rx432_pos, rx432_eos, rxscan436_done
  rxscan436_scan:
    set_addr $I10, rxscan436_loop
    rx432_cur."!mark_push"(0, rx432_pos, $I10)
  rxscan436_done:
.annotate 'line', 225
  # rx subrule "colonpair" subtype=capture negate=
    rx432_cur."!cursor_pos"(rx432_pos)
    $P10 = rx432_cur."colonpair"()
    unless $P10, rx432_fail
    rx432_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx432_pos = $P10."pos"()
  # rx pass
    rx432_cur."!cursor_pass"(rx432_pos, "term:sym<colonpair>")
    rx432_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx432_pos)
    .return (rx432_cur)
  rx432_fail:
.annotate 'line', 4
    (rx432_rep, rx432_pos, $I10, $P10) = rx432_cur."!mark_fail"(0)
    lt rx432_pos, -1, rx432_done
    eq rx432_pos, -1, rx432_fail
    jump $I10
  rx432_done:
    rx432_cur."!cursor_fail"()
    rx432_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx432_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("100_1277356913.9538") :method
.annotate 'line', 4
    $P434 = self."!PREFIX__!subrule"("colonpair", "")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("101_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx438_tgt
    .local int rx438_pos
    .local int rx438_off
    .local int rx438_eos
    .local int rx438_rep
    .local pmc rx438_cur
    (rx438_cur, rx438_pos, rx438_tgt) = self."!cursor_start"()
    rx438_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx438_cur
    .local pmc match
    .lex "$/", match
    length rx438_eos, rx438_tgt
    gt rx438_pos, rx438_eos, rx438_done
    set rx438_off, 0
    lt rx438_pos, 2, rx438_start
    sub rx438_off, rx438_pos, 1
    substr rx438_tgt, rx438_tgt, rx438_off
  rx438_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan442_done
    goto rxscan442_scan
  rxscan442_loop:
    ($P10) = rx438_cur."from"()
    inc $P10
    set rx438_pos, $P10
    ge rx438_pos, rx438_eos, rxscan442_done
  rxscan442_scan:
    set_addr $I10, rxscan442_loop
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  rxscan442_done:
.annotate 'line', 226
  # rx subrule "variable" subtype=capture negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    $P10 = rx438_cur."variable"()
    unless $P10, rx438_fail
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx438_pos = $P10."pos"()
  # rx pass
    rx438_cur."!cursor_pass"(rx438_pos, "term:sym<variable>")
    rx438_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx438_pos)
    .return (rx438_cur)
  rx438_fail:
.annotate 'line', 4
    (rx438_rep, rx438_pos, $I10, $P10) = rx438_cur."!mark_fail"(0)
    lt rx438_pos, -1, rx438_done
    eq rx438_pos, -1, rx438_fail
    jump $I10
  rx438_done:
    rx438_cur."!cursor_fail"()
    rx438_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx438_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("102_1277356913.9538") :method
.annotate 'line', 4
    $P440 = self."!PREFIX__!subrule"("variable", "")
    new $P441, "ResizablePMCArray"
    push $P441, $P440
    .return ($P441)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("103_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx444_tgt
    .local int rx444_pos
    .local int rx444_off
    .local int rx444_eos
    .local int rx444_rep
    .local pmc rx444_cur
    (rx444_cur, rx444_pos, rx444_tgt) = self."!cursor_start"()
    rx444_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx444_cur
    .local pmc match
    .lex "$/", match
    length rx444_eos, rx444_tgt
    gt rx444_pos, rx444_eos, rx444_done
    set rx444_off, 0
    lt rx444_pos, 2, rx444_start
    sub rx444_off, rx444_pos, 1
    substr rx444_tgt, rx444_tgt, rx444_off
  rx444_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan448_done
    goto rxscan448_scan
  rxscan448_loop:
    ($P10) = rx444_cur."from"()
    inc $P10
    set rx444_pos, $P10
    ge rx444_pos, rx444_eos, rxscan448_done
  rxscan448_scan:
    set_addr $I10, rxscan448_loop
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  rxscan448_done:
.annotate 'line', 227
  # rx subrule "package_declarator" subtype=capture negate=
    rx444_cur."!cursor_pos"(rx444_pos)
    $P10 = rx444_cur."package_declarator"()
    unless $P10, rx444_fail
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx444_pos = $P10."pos"()
  # rx pass
    rx444_cur."!cursor_pass"(rx444_pos, "term:sym<package_declarator>")
    rx444_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx444_pos)
    .return (rx444_cur)
  rx444_fail:
.annotate 'line', 4
    (rx444_rep, rx444_pos, $I10, $P10) = rx444_cur."!mark_fail"(0)
    lt rx444_pos, -1, rx444_done
    eq rx444_pos, -1, rx444_fail
    jump $I10
  rx444_done:
    rx444_cur."!cursor_fail"()
    rx444_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx444_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("104_1277356913.9538") :method
.annotate 'line', 4
    $P446 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P447, "ResizablePMCArray"
    push $P447, $P446
    .return ($P447)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("105_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx450_tgt
    .local int rx450_pos
    .local int rx450_off
    .local int rx450_eos
    .local int rx450_rep
    .local pmc rx450_cur
    (rx450_cur, rx450_pos, rx450_tgt) = self."!cursor_start"()
    rx450_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx450_cur
    .local pmc match
    .lex "$/", match
    length rx450_eos, rx450_tgt
    gt rx450_pos, rx450_eos, rx450_done
    set rx450_off, 0
    lt rx450_pos, 2, rx450_start
    sub rx450_off, rx450_pos, 1
    substr rx450_tgt, rx450_tgt, rx450_off
  rx450_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan454_done
    goto rxscan454_scan
  rxscan454_loop:
    ($P10) = rx450_cur."from"()
    inc $P10
    set rx450_pos, $P10
    ge rx450_pos, rx450_eos, rxscan454_done
  rxscan454_scan:
    set_addr $I10, rxscan454_loop
    rx450_cur."!mark_push"(0, rx450_pos, $I10)
  rxscan454_done:
.annotate 'line', 228
  # rx subrule "scope_declarator" subtype=capture negate=
    rx450_cur."!cursor_pos"(rx450_pos)
    $P10 = rx450_cur."scope_declarator"()
    unless $P10, rx450_fail
    rx450_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx450_pos = $P10."pos"()
  # rx pass
    rx450_cur."!cursor_pass"(rx450_pos, "term:sym<scope_declarator>")
    rx450_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx450_pos)
    .return (rx450_cur)
  rx450_fail:
.annotate 'line', 4
    (rx450_rep, rx450_pos, $I10, $P10) = rx450_cur."!mark_fail"(0)
    lt rx450_pos, -1, rx450_done
    eq rx450_pos, -1, rx450_fail
    jump $I10
  rx450_done:
    rx450_cur."!cursor_fail"()
    rx450_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx450_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("106_1277356913.9538") :method
.annotate 'line', 4
    $P452 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P453, "ResizablePMCArray"
    push $P453, $P452
    .return ($P453)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("107_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx456_tgt
    .local int rx456_pos
    .local int rx456_off
    .local int rx456_eos
    .local int rx456_rep
    .local pmc rx456_cur
    (rx456_cur, rx456_pos, rx456_tgt) = self."!cursor_start"()
    rx456_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx456_cur
    .local pmc match
    .lex "$/", match
    length rx456_eos, rx456_tgt
    gt rx456_pos, rx456_eos, rx456_done
    set rx456_off, 0
    lt rx456_pos, 2, rx456_start
    sub rx456_off, rx456_pos, 1
    substr rx456_tgt, rx456_tgt, rx456_off
  rx456_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan460_done
    goto rxscan460_scan
  rxscan460_loop:
    ($P10) = rx456_cur."from"()
    inc $P10
    set rx456_pos, $P10
    ge rx456_pos, rx456_eos, rxscan460_done
  rxscan460_scan:
    set_addr $I10, rxscan460_loop
    rx456_cur."!mark_push"(0, rx456_pos, $I10)
  rxscan460_done:
.annotate 'line', 229
  # rx subrule "routine_declarator" subtype=capture negate=
    rx456_cur."!cursor_pos"(rx456_pos)
    $P10 = rx456_cur."routine_declarator"()
    unless $P10, rx456_fail
    rx456_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx456_pos = $P10."pos"()
  # rx pass
    rx456_cur."!cursor_pass"(rx456_pos, "term:sym<routine_declarator>")
    rx456_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx456_pos)
    .return (rx456_cur)
  rx456_fail:
.annotate 'line', 4
    (rx456_rep, rx456_pos, $I10, $P10) = rx456_cur."!mark_fail"(0)
    lt rx456_pos, -1, rx456_done
    eq rx456_pos, -1, rx456_fail
    jump $I10
  rx456_done:
    rx456_cur."!cursor_fail"()
    rx456_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx456_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("108_1277356913.9538") :method
.annotate 'line', 4
    $P458 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P459, "ResizablePMCArray"
    push $P459, $P458
    .return ($P459)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("109_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P467 = "111_1277356913.9538" 
    capture_lex $P467
    .local string rx462_tgt
    .local int rx462_pos
    .local int rx462_off
    .local int rx462_eos
    .local int rx462_rep
    .local pmc rx462_cur
    (rx462_cur, rx462_pos, rx462_tgt) = self."!cursor_start"()
    rx462_cur."!cursor_debug"("START ", "term:sym<multi_declarator>")
    .lex unicode:"$\x{a2}", rx462_cur
    .local pmc match
    .lex "$/", match
    length rx462_eos, rx462_tgt
    gt rx462_pos, rx462_eos, rx462_done
    set rx462_off, 0
    lt rx462_pos, 2, rx462_start
    sub rx462_off, rx462_pos, 1
    substr rx462_tgt, rx462_tgt, rx462_off
  rx462_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan465_done
    goto rxscan465_scan
  rxscan465_loop:
    ($P10) = rx462_cur."from"()
    inc $P10
    set rx462_pos, $P10
    ge rx462_pos, rx462_eos, rxscan465_done
  rxscan465_scan:
    set_addr $I10, rxscan465_loop
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  rxscan465_done:
.annotate 'line', 230
  # rx subrule "before" subtype=zerowidth negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    .const 'Sub' $P467 = "111_1277356913.9538" 
    capture_lex $P467
    $P10 = rx462_cur."before"($P467)
    unless $P10, rx462_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    $P10 = rx462_cur."multi_declarator"()
    unless $P10, rx462_fail
    rx462_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx462_pos = $P10."pos"()
  # rx pass
    rx462_cur."!cursor_pass"(rx462_pos, "term:sym<multi_declarator>")
    rx462_cur."!cursor_debug"("PASS  ", "term:sym<multi_declarator>", " at pos=", rx462_pos)
    .return (rx462_cur)
  rx462_fail:
.annotate 'line', 4
    (rx462_rep, rx462_pos, $I10, $P10) = rx462_cur."!mark_fail"(0)
    lt rx462_pos, -1, rx462_done
    eq rx462_pos, -1, rx462_fail
    jump $I10
  rx462_done:
    rx462_cur."!cursor_fail"()
    rx462_cur."!cursor_debug"("FAIL  ", "term:sym<multi_declarator>")
    .return (rx462_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("110_1277356913.9538") :method
.annotate 'line', 4
    new $P464, "ResizablePMCArray"
    push $P464, ""
    .return ($P464)
.end


.namespace ["NQP";"Grammar"]
.sub "_block466"  :anon :subid("111_1277356913.9538") :method :outer("109_1277356913.9538")
.annotate 'line', 230
    .local string rx468_tgt
    .local int rx468_pos
    .local int rx468_off
    .local int rx468_eos
    .local int rx468_rep
    .local pmc rx468_cur
    (rx468_cur, rx468_pos, rx468_tgt) = self."!cursor_start"()
    rx468_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx468_cur
    .local pmc match
    .lex "$/", match
    length rx468_eos, rx468_tgt
    gt rx468_pos, rx468_eos, rx468_done
    set rx468_off, 0
    lt rx468_pos, 2, rx468_start
    sub rx468_off, rx468_pos, 1
    substr rx468_tgt, rx468_tgt, rx468_off
  rx468_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan469_done
    goto rxscan469_scan
  rxscan469_loop:
    ($P10) = rx468_cur."from"()
    inc $P10
    set rx468_pos, $P10
    ge rx468_pos, rx468_eos, rxscan469_done
  rxscan469_scan:
    set_addr $I10, rxscan469_loop
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  rxscan469_done:
  alt470_0:
    set_addr $I10, alt470_1
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  # rx literal  "multi"
    add $I11, rx468_pos, 5
    gt $I11, rx468_eos, rx468_fail
    sub $I11, rx468_pos, rx468_off
    substr $S10, rx468_tgt, $I11, 5
    ne $S10, "multi", rx468_fail
    add rx468_pos, 5
    goto alt470_end
  alt470_1:
    set_addr $I10, alt470_2
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  # rx literal  "proto"
    add $I11, rx468_pos, 5
    gt $I11, rx468_eos, rx468_fail
    sub $I11, rx468_pos, rx468_off
    substr $S10, rx468_tgt, $I11, 5
    ne $S10, "proto", rx468_fail
    add rx468_pos, 5
    goto alt470_end
  alt470_2:
  # rx literal  "only"
    add $I11, rx468_pos, 4
    gt $I11, rx468_eos, rx468_fail
    sub $I11, rx468_pos, rx468_off
    substr $S10, rx468_tgt, $I11, 4
    ne $S10, "only", rx468_fail
    add rx468_pos, 4
  alt470_end:
  # rx pass
    rx468_cur."!cursor_pass"(rx468_pos, "")
    rx468_cur."!cursor_debug"("PASS  ", "", " at pos=", rx468_pos)
    .return (rx468_cur)
  rx468_fail:
    (rx468_rep, rx468_pos, $I10, $P10) = rx468_cur."!mark_fail"(0)
    lt rx468_pos, -1, rx468_done
    eq rx468_pos, -1, rx468_fail
    jump $I10
  rx468_done:
    rx468_cur."!cursor_fail"()
    rx468_cur."!cursor_debug"("FAIL  ", "")
    .return (rx468_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("112_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx472_tgt
    .local int rx472_pos
    .local int rx472_off
    .local int rx472_eos
    .local int rx472_rep
    .local pmc rx472_cur
    (rx472_cur, rx472_pos, rx472_tgt) = self."!cursor_start"()
    rx472_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx472_cur
    .local pmc match
    .lex "$/", match
    length rx472_eos, rx472_tgt
    gt rx472_pos, rx472_eos, rx472_done
    set rx472_off, 0
    lt rx472_pos, 2, rx472_start
    sub rx472_off, rx472_pos, 1
    substr rx472_tgt, rx472_tgt, rx472_off
  rx472_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan476_done
    goto rxscan476_scan
  rxscan476_loop:
    ($P10) = rx472_cur."from"()
    inc $P10
    set rx472_pos, $P10
    ge rx472_pos, rx472_eos, rxscan476_done
  rxscan476_scan:
    set_addr $I10, rxscan476_loop
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  rxscan476_done:
.annotate 'line', 231
  # rx subrule "regex_declarator" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."regex_declarator"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx472_pos = $P10."pos"()
  # rx pass
    rx472_cur."!cursor_pass"(rx472_pos, "term:sym<regex_declarator>")
    rx472_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx472_pos)
    .return (rx472_cur)
  rx472_fail:
.annotate 'line', 4
    (rx472_rep, rx472_pos, $I10, $P10) = rx472_cur."!mark_fail"(0)
    lt rx472_pos, -1, rx472_done
    eq rx472_pos, -1, rx472_fail
    jump $I10
  rx472_done:
    rx472_cur."!cursor_fail"()
    rx472_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx472_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("113_1277356913.9538") :method
.annotate 'line', 4
    $P474 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P475, "ResizablePMCArray"
    push $P475, $P474
    .return ($P475)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("114_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx478_tgt
    .local int rx478_pos
    .local int rx478_off
    .local int rx478_eos
    .local int rx478_rep
    .local pmc rx478_cur
    (rx478_cur, rx478_pos, rx478_tgt) = self."!cursor_start"()
    rx478_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx478_cur
    .local pmc match
    .lex "$/", match
    length rx478_eos, rx478_tgt
    gt rx478_pos, rx478_eos, rx478_done
    set rx478_off, 0
    lt rx478_pos, 2, rx478_start
    sub rx478_off, rx478_pos, 1
    substr rx478_tgt, rx478_tgt, rx478_off
  rx478_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan482_done
    goto rxscan482_scan
  rxscan482_loop:
    ($P10) = rx478_cur."from"()
    inc $P10
    set rx478_pos, $P10
    ge rx478_pos, rx478_eos, rxscan482_done
  rxscan482_scan:
    set_addr $I10, rxscan482_loop
    rx478_cur."!mark_push"(0, rx478_pos, $I10)
  rxscan482_done:
.annotate 'line', 232
  # rx subrule "statement_prefix" subtype=capture negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    $P10 = rx478_cur."statement_prefix"()
    unless $P10, rx478_fail
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx478_pos = $P10."pos"()
  # rx pass
    rx478_cur."!cursor_pass"(rx478_pos, "term:sym<statement_prefix>")
    rx478_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx478_pos)
    .return (rx478_cur)
  rx478_fail:
.annotate 'line', 4
    (rx478_rep, rx478_pos, $I10, $P10) = rx478_cur."!mark_fail"(0)
    lt rx478_pos, -1, rx478_done
    eq rx478_pos, -1, rx478_fail
    jump $I10
  rx478_done:
    rx478_cur."!cursor_fail"()
    rx478_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx478_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("115_1277356913.9538") :method
.annotate 'line', 4
    $P480 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P481, "ResizablePMCArray"
    push $P481, $P480
    .return ($P481)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("116_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    gt rx484_pos, rx484_eos, rx484_done
    set rx484_off, 0
    lt rx484_pos, 2, rx484_start
    sub rx484_off, rx484_pos, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan487_done
    goto rxscan487_scan
  rxscan487_loop:
    ($P10) = rx484_cur."from"()
    inc $P10
    set rx484_pos, $P10
    ge rx484_pos, rx484_eos, rxscan487_done
  rxscan487_scan:
    set_addr $I10, rxscan487_loop
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  rxscan487_done:
.annotate 'line', 233
  # rx subrule "lambda" subtype=zerowidth negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."lambda"()
    unless $P10, rx484_fail
  # rx subrule "pblock" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."pblock"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx484_pos = $P10."pos"()
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "term:sym<lambda>")
    rx484_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
.annotate 'line', 4
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx484_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("117_1277356913.9538") :method
.annotate 'line', 4
    new $P486, "ResizablePMCArray"
    push $P486, ""
    .return ($P486)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("118_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    (rx489_cur, rx489_pos, rx489_tgt) = self."!cursor_start"()
    rx489_cur."!cursor_debug"("START ", "fatarrow")
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
    ne $I10, -1, rxscan493_done
    goto rxscan493_scan
  rxscan493_loop:
    ($P10) = rx489_cur."from"()
    inc $P10
    set rx489_pos, $P10
    ge rx489_pos, rx489_eos, rxscan493_done
  rxscan493_scan:
    set_addr $I10, rxscan493_loop
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  rxscan493_done:
.annotate 'line', 236
  # rx subrule "identifier" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."identifier"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx489_pos = $P10."pos"()
  # rx rxquantr494 ** 0..*
    set_addr $I495, rxquantr494_done
    rx489_cur."!mark_push"(0, rx489_pos, $I495)
  rxquantr494_loop:
  # rx enumcharlist negate=0 
    ge rx489_pos, rx489_eos, rx489_fail
    sub $I10, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx489_fail
    inc rx489_pos
    (rx489_rep) = rx489_cur."!mark_commit"($I495)
    rx489_cur."!mark_push"(rx489_rep, rx489_pos, $I495)
    goto rxquantr494_loop
  rxquantr494_done:
  # rx literal  "=>"
    add $I11, rx489_pos, 2
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 2
    ne $S10, "=>", rx489_fail
    add rx489_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."ws"()
    unless $P10, rx489_fail
    rx489_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."EXPR"("i=")
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx489_pos = $P10."pos"()
.annotate 'line', 235
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "fatarrow")
    rx489_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx489_pos)
    .return (rx489_cur)
  rx489_fail:
.annotate 'line', 4
    (rx489_rep, rx489_pos, $I10, $P10) = rx489_cur."!mark_fail"(0)
    lt rx489_pos, -1, rx489_done
    eq rx489_pos, -1, rx489_fail
    jump $I10
  rx489_done:
    rx489_cur."!cursor_fail"()
    rx489_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx489_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("119_1277356913.9538") :method
.annotate 'line', 4
    $P491 = self."!PREFIX__!subrule"("identifier", "")
    new $P492, "ResizablePMCArray"
    push $P492, $P491
    .return ($P492)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("120_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx497_tgt
    .local int rx497_pos
    .local int rx497_off
    .local int rx497_eos
    .local int rx497_rep
    .local pmc rx497_cur
    (rx497_cur, rx497_pos, rx497_tgt) = self."!cursor_start"()
    rx497_cur."!cursor_debug"("START ", "colonpair")
    rx497_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx497_cur
    .local pmc match
    .lex "$/", match
    length rx497_eos, rx497_tgt
    gt rx497_pos, rx497_eos, rx497_done
    set rx497_off, 0
    lt rx497_pos, 2, rx497_start
    sub rx497_off, rx497_pos, 1
    substr rx497_tgt, rx497_tgt, rx497_off
  rx497_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx497_cur."from"()
    inc $P10
    set rx497_pos, $P10
    ge rx497_pos, rx497_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
  rxscan503_done:
.annotate 'line', 240
  # rx literal  ":"
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    substr $S10, rx497_tgt, $I11, 1
    ne $S10, ":", rx497_fail
    add rx497_pos, 1
  alt504_0:
.annotate 'line', 241
    set_addr $I10, alt504_1
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
.annotate 'line', 242
  # rx subcapture "not"
    set_addr $I10, rxcap_505_fail
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
  # rx literal  "!"
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    substr $S10, rx497_tgt, $I11, 1
    ne $S10, "!", rx497_fail
    add rx497_pos, 1
    set_addr $I10, rxcap_505_fail
    ($I12, $I11) = rx497_cur."!mark_peek"($I10)
    rx497_cur."!cursor_pos"($I11)
    ($P10) = rx497_cur."!cursor_start"()
    $P10."!cursor_pass"(rx497_pos, "")
    rx497_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_505_done
  rxcap_505_fail:
    goto rx497_fail
  rxcap_505_done:
  # rx subrule "identifier" subtype=capture negate=
    rx497_cur."!cursor_pos"(rx497_pos)
    $P10 = rx497_cur."identifier"()
    unless $P10, rx497_fail
    rx497_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx497_pos = $P10."pos"()
    goto alt504_end
  alt504_1:
    set_addr $I10, alt504_2
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
.annotate 'line', 243
  # rx subrule "identifier" subtype=capture negate=
    rx497_cur."!cursor_pos"(rx497_pos)
    $P10 = rx497_cur."identifier"()
    unless $P10, rx497_fail
    rx497_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx497_pos = $P10."pos"()
  # rx rxquantr506 ** 0..1
    set_addr $I507, rxquantr506_done
    rx497_cur."!mark_push"(0, rx497_pos, $I507)
  rxquantr506_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx497_cur."!cursor_pos"(rx497_pos)
    $P10 = rx497_cur."circumfix"()
    unless $P10, rx497_fail
    rx497_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx497_pos = $P10."pos"()
    (rx497_rep) = rx497_cur."!mark_commit"($I507)
  rxquantr506_done:
    goto alt504_end
  alt504_2:
.annotate 'line', 244
  # rx subrule "circumfix" subtype=capture negate=
    rx497_cur."!cursor_pos"(rx497_pos)
    $P10 = rx497_cur."circumfix"()
    unless $P10, rx497_fail
    rx497_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx497_pos = $P10."pos"()
  alt504_end:
.annotate 'line', 239
  # rx pass
    rx497_cur."!cursor_pass"(rx497_pos, "colonpair")
    rx497_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx497_pos)
    .return (rx497_cur)
  rx497_fail:
.annotate 'line', 4
    (rx497_rep, rx497_pos, $I10, $P10) = rx497_cur."!mark_fail"(0)
    lt rx497_pos, -1, rx497_done
    eq rx497_pos, -1, rx497_fail
    jump $I10
  rx497_done:
    rx497_cur."!cursor_fail"()
    rx497_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx497_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("121_1277356913.9538") :method
.annotate 'line', 4
    $P499 = self."!PREFIX__!subrule"("circumfix", ":")
    $P500 = self."!PREFIX__!subrule"("identifier", ":")
    $P501 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P502, "ResizablePMCArray"
    push $P502, $P499
    push $P502, $P500
    push $P502, $P501
    .return ($P502)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("122_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx509_tgt
    .local int rx509_pos
    .local int rx509_off
    .local int rx509_eos
    .local int rx509_rep
    .local pmc rx509_cur
    (rx509_cur, rx509_pos, rx509_tgt) = self."!cursor_start"()
    rx509_cur."!cursor_debug"("START ", "variable")
    rx509_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx509_cur
    .local pmc match
    .lex "$/", match
    length rx509_eos, rx509_tgt
    gt rx509_pos, rx509_eos, rx509_done
    set rx509_off, 0
    lt rx509_pos, 2, rx509_start
    sub rx509_off, rx509_pos, 1
    substr rx509_tgt, rx509_tgt, rx509_off
  rx509_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan514_done
    goto rxscan514_scan
  rxscan514_loop:
    ($P10) = rx509_cur."from"()
    inc $P10
    set rx509_pos, $P10
    ge rx509_pos, rx509_eos, rxscan514_done
  rxscan514_scan:
    set_addr $I10, rxscan514_loop
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  rxscan514_done:
  alt515_0:
.annotate 'line', 248
    set_addr $I10, alt515_1
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
.annotate 'line', 249
  # rx subrule "sigil" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."sigil"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx509_pos = $P10."pos"()
  # rx rxquantr516 ** 0..1
    set_addr $I517, rxquantr516_done
    rx509_cur."!mark_push"(0, rx509_pos, $I517)
  rxquantr516_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."twigil"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx509_pos = $P10."pos"()
    (rx509_rep) = rx509_cur."!mark_commit"($I517)
  rxquantr516_done:
  # rx subrule "name" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."name"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx509_pos = $P10."pos"()
    goto alt515_end
  alt515_1:
    set_addr $I10, alt515_2
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."sigil"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx509_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx509_pos, rx509_eos, rx509_fail
    sub $I10, rx509_pos, rx509_off
    substr $S10, rx509_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx509_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx509_cur."!cursor_pos"(rx509_pos)
    $P10 = rx509_cur."postcircumfix"()
    unless $P10, rx509_fail
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx509_pos = $P10."pos"()
    goto alt515_end
  alt515_2:
.annotate 'line', 251
  # rx subcapture "sigil"
    set_addr $I10, rxcap_518_fail
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  # rx literal  "$"
    add $I11, rx509_pos, 1
    gt $I11, rx509_eos, rx509_fail
    sub $I11, rx509_pos, rx509_off
    substr $S10, rx509_tgt, $I11, 1
    ne $S10, "$", rx509_fail
    add rx509_pos, 1
    set_addr $I10, rxcap_518_fail
    ($I12, $I11) = rx509_cur."!mark_peek"($I10)
    rx509_cur."!cursor_pos"($I11)
    ($P10) = rx509_cur."!cursor_start"()
    $P10."!cursor_pass"(rx509_pos, "")
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_518_done
  rxcap_518_fail:
    goto rx509_fail
  rxcap_518_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_519_fail
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx509_pos, rx509_eos, rx509_fail
    sub $I10, rx509_pos, rx509_off
    substr $S10, rx509_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx509_fail
    inc rx509_pos
    set_addr $I10, rxcap_519_fail
    ($I12, $I11) = rx509_cur."!mark_peek"($I10)
    rx509_cur."!cursor_pos"($I11)
    ($P10) = rx509_cur."!cursor_start"()
    $P10."!cursor_pass"(rx509_pos, "")
    rx509_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_519_done
  rxcap_519_fail:
    goto rx509_fail
  rxcap_519_done:
  alt515_end:
.annotate 'line', 248
  # rx pass
    rx509_cur."!cursor_pass"(rx509_pos, "variable")
    rx509_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx509_pos)
    .return (rx509_cur)
  rx509_fail:
.annotate 'line', 4
    (rx509_rep, rx509_pos, $I10, $P10) = rx509_cur."!mark_fail"(0)
    lt rx509_pos, -1, rx509_done
    eq rx509_pos, -1, rx509_fail
    jump $I10
  rx509_done:
    rx509_cur."!cursor_fail"()
    rx509_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx509_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("123_1277356913.9538") :method
.annotate 'line', 4
    $P511 = self."!PREFIX__!subrule"("sigil", "")
    $P512 = self."!PREFIX__!subrule"("sigil", "")
    new $P513, "ResizablePMCArray"
    push $P513, "$!"
    push $P513, "$_"
    push $P513, "$/"
    push $P513, $P511
    push $P513, $P512
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("124_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx521_tgt
    .local int rx521_pos
    .local int rx521_off
    .local int rx521_eos
    .local int rx521_rep
    .local pmc rx521_cur
    (rx521_cur, rx521_pos, rx521_tgt) = self."!cursor_start"()
    rx521_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx521_cur
    .local pmc match
    .lex "$/", match
    length rx521_eos, rx521_tgt
    gt rx521_pos, rx521_eos, rx521_done
    set rx521_off, 0
    lt rx521_pos, 2, rx521_start
    sub rx521_off, rx521_pos, 1
    substr rx521_tgt, rx521_tgt, rx521_off
  rx521_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan524_done
    goto rxscan524_scan
  rxscan524_loop:
    ($P10) = rx521_cur."from"()
    inc $P10
    set rx521_pos, $P10
    ge rx521_pos, rx521_eos, rxscan524_done
  rxscan524_scan:
    set_addr $I10, rxscan524_loop
    rx521_cur."!mark_push"(0, rx521_pos, $I10)
  rxscan524_done:
.annotate 'line', 254
  # rx enumcharlist negate=0 
    ge rx521_pos, rx521_eos, rx521_fail
    sub $I10, rx521_pos, rx521_off
    substr $S10, rx521_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx521_fail
    inc rx521_pos
  # rx pass
    rx521_cur."!cursor_pass"(rx521_pos, "sigil")
    rx521_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx521_pos)
    .return (rx521_cur)
  rx521_fail:
.annotate 'line', 4
    (rx521_rep, rx521_pos, $I10, $P10) = rx521_cur."!mark_fail"(0)
    lt rx521_pos, -1, rx521_done
    eq rx521_pos, -1, rx521_fail
    jump $I10
  rx521_done:
    rx521_cur."!cursor_fail"()
    rx521_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx521_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("125_1277356913.9538") :method
.annotate 'line', 4
    new $P523, "ResizablePMCArray"
    push $P523, "&"
    push $P523, "%"
    push $P523, "@"
    push $P523, "$"
    .return ($P523)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("126_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx526_tgt
    .local int rx526_pos
    .local int rx526_off
    .local int rx526_eos
    .local int rx526_rep
    .local pmc rx526_cur
    (rx526_cur, rx526_pos, rx526_tgt) = self."!cursor_start"()
    rx526_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx526_cur
    .local pmc match
    .lex "$/", match
    length rx526_eos, rx526_tgt
    gt rx526_pos, rx526_eos, rx526_done
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
.annotate 'line', 256
  # rx enumcharlist negate=0 
    ge rx526_pos, rx526_eos, rx526_fail
    sub $I10, rx526_pos, rx526_off
    substr $S10, rx526_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx526_fail
    inc rx526_pos
  # rx pass
    rx526_cur."!cursor_pass"(rx526_pos, "twigil")
    rx526_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx526_pos)
    .return (rx526_cur)
  rx526_fail:
.annotate 'line', 4
    (rx526_rep, rx526_pos, $I10, $P10) = rx526_cur."!mark_fail"(0)
    lt rx526_pos, -1, rx526_done
    eq rx526_pos, -1, rx526_fail
    jump $I10
  rx526_done:
    rx526_cur."!cursor_fail"()
    rx526_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx526_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("127_1277356913.9538") :method
.annotate 'line', 4
    new $P528, "ResizablePMCArray"
    push $P528, "?"
    push $P528, "!"
    push $P528, "*"
    .return ($P528)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("128_1277356913.9538") :method
.annotate 'line', 258
    $P531 = self."!protoregex"("package_declarator")
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("129_1277356913.9538") :method
.annotate 'line', 258
    $P533 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P533)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("130_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
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
.annotate 'line', 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_540_fail
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  # rx literal  "module"
    add $I11, rx535_pos, 6
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 6
    ne $S10, "module", rx535_fail
    add rx535_pos, 6
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
  # rx subrule "package_def" subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    $P10 = rx535_cur."package_def"()
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx535_pos = $P10."pos"()
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "package_declarator:sym<module>")
    rx535_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate 'line', 4
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx535_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("131_1277356913.9538") :method
.annotate 'line', 4
    $P537 = self."!PREFIX__!subrule"("package_def", "module")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("132_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    (rx542_cur, rx542_pos, rx542_tgt) = self."!cursor_start"()
    rx542_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx542_cur
    .local pmc match
    .lex "$/", match
    length rx542_eos, rx542_tgt
    gt rx542_pos, rx542_eos, rx542_done
    set rx542_off, 0
    lt rx542_pos, 2, rx542_start
    sub rx542_off, rx542_pos, 1
    substr rx542_tgt, rx542_tgt, rx542_off
  rx542_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan547_done
    goto rxscan547_scan
  rxscan547_loop:
    ($P10) = rx542_cur."from"()
    inc $P10
    set rx542_pos, $P10
    ge rx542_pos, rx542_eos, rxscan547_done
  rxscan547_scan:
    set_addr $I10, rxscan547_loop
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxscan547_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_549_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  alt548_0:
    set_addr $I10, alt548_1
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "class"
    add $I11, rx542_pos, 5
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 5
    ne $S10, "class", rx542_fail
    add rx542_pos, 5
    goto alt548_end
  alt548_1:
  # rx literal  "grammar"
    add $I11, rx542_pos, 7
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 7
    ne $S10, "grammar", rx542_fail
    add rx542_pos, 7
  alt548_end:
    set_addr $I10, rxcap_549_fail
    ($I12, $I11) = rx542_cur."!mark_peek"($I10)
    rx542_cur."!cursor_pos"($I11)
    ($P10) = rx542_cur."!cursor_start"()
    $P10."!cursor_pass"(rx542_pos, "")
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_549_done
  rxcap_549_fail:
    goto rx542_fail
  rxcap_549_done:
  # rx subrule "package_def" subtype=capture negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    $P10 = rx542_cur."package_def"()
    unless $P10, rx542_fail
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx542_pos = $P10."pos"()
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "package_declarator:sym<class>")
    rx542_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx542_pos)
    .return (rx542_cur)
  rx542_fail:
.annotate 'line', 4
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    rx542_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx542_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("133_1277356913.9538") :method
.annotate 'line', 4
    $P544 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P545 = self."!PREFIX__!subrule"("package_def", "class")
    new $P546, "ResizablePMCArray"
    push $P546, $P544
    push $P546, $P545
    .return ($P546)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("134_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx551_tgt
    .local int rx551_pos
    .local int rx551_off
    .local int rx551_eos
    .local int rx551_rep
    .local pmc rx551_cur
    (rx551_cur, rx551_pos, rx551_tgt) = self."!cursor_start"()
    rx551_cur."!cursor_debug"("START ", "package_def")
    rx551_cur."!cursor_caparray"("parent")
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
    ne $I10, -1, rxscan555_done
    goto rxscan555_scan
  rxscan555_loop:
    ($P10) = rx551_cur."from"()
    inc $P10
    set rx551_pos, $P10
    ge rx551_pos, rx551_eos, rxscan555_done
  rxscan555_scan:
    set_addr $I10, rxscan555_loop
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  rxscan555_done:
.annotate 'line', 262
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
.annotate 'line', 263
  # rx subrule "name" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."name"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx551_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
.annotate 'line', 264
  # rx rxquantr558 ** 0..1
    set_addr $I562, rxquantr558_done
    rx551_cur."!mark_push"(0, rx551_pos, $I562)
  rxquantr558_loop:
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx551_pos, 2
    gt $I11, rx551_eos, rx551_fail
    sub $I11, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I11, 2
    ne $S10, "is", rx551_fail
    add rx551_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."name"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx551_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
    (rx551_rep) = rx551_cur."!mark_commit"($I562)
  rxquantr558_done:
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  alt564_0:
.annotate 'line', 265
    set_addr $I10, alt564_1
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
.annotate 'line', 266
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx551_pos, 1
    gt $I11, rx551_eos, rx551_fail
    sub $I11, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I11, 1
    ne $S10, ";", rx551_fail
    add rx551_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."comp_unit"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx551_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
    goto alt564_end
  alt564_1:
    set_addr $I10, alt564_2
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx551_pos, rx551_eos, rx551_fail
    sub $I10, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx551_fail
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."block"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx551_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
    goto alt564_end
  alt564_2:
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."panic"("Malformed package declaration")
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
  alt564_end:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ws"()
    unless $P10, rx551_fail
    rx551_pos = $P10."pos"()
.annotate 'line', 262
  # rx pass
    rx551_cur."!cursor_pass"(rx551_pos, "package_def")
    rx551_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx551_pos)
    .return (rx551_cur)
  rx551_fail:
.annotate 'line', 4
    (rx551_rep, rx551_pos, $I10, $P10) = rx551_cur."!mark_fail"(0)
    lt rx551_pos, -1, rx551_done
    eq rx551_pos, -1, rx551_fail
    jump $I10
  rx551_done:
    rx551_cur."!cursor_fail"()
    rx551_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx551_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("135_1277356913.9538") :method
.annotate 'line', 4
    $P553 = self."!PREFIX__!subrule"("ws", "")
    new $P554, "ResizablePMCArray"
    push $P554, $P553
    .return ($P554)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("136_1277356913.9538") :method
.annotate 'line', 272
    $P575 = self."!protoregex"("scope_declarator")
    .return ($P575)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("137_1277356913.9538") :method
.annotate 'line', 272
    $P577 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("138_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx579_tgt
    .local int rx579_pos
    .local int rx579_off
    .local int rx579_eos
    .local int rx579_rep
    .local pmc rx579_cur
    (rx579_cur, rx579_pos, rx579_tgt) = self."!cursor_start"()
    rx579_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx579_cur
    .local pmc match
    .lex "$/", match
    length rx579_eos, rx579_tgt
    gt rx579_pos, rx579_eos, rx579_done
    set rx579_off, 0
    lt rx579_pos, 2, rx579_start
    sub rx579_off, rx579_pos, 1
    substr rx579_tgt, rx579_tgt, rx579_off
  rx579_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan583_done
    goto rxscan583_scan
  rxscan583_loop:
    ($P10) = rx579_cur."from"()
    inc $P10
    set rx579_pos, $P10
    ge rx579_pos, rx579_eos, rxscan583_done
  rxscan583_scan:
    set_addr $I10, rxscan583_loop
    rx579_cur."!mark_push"(0, rx579_pos, $I10)
  rxscan583_done:
.annotate 'line', 273
  # rx subcapture "sym"
    set_addr $I10, rxcap_584_fail
    rx579_cur."!mark_push"(0, rx579_pos, $I10)
  # rx literal  "my"
    add $I11, rx579_pos, 2
    gt $I11, rx579_eos, rx579_fail
    sub $I11, rx579_pos, rx579_off
    substr $S10, rx579_tgt, $I11, 2
    ne $S10, "my", rx579_fail
    add rx579_pos, 2
    set_addr $I10, rxcap_584_fail
    ($I12, $I11) = rx579_cur."!mark_peek"($I10)
    rx579_cur."!cursor_pos"($I11)
    ($P10) = rx579_cur."!cursor_start"()
    $P10."!cursor_pass"(rx579_pos, "")
    rx579_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_584_done
  rxcap_584_fail:
    goto rx579_fail
  rxcap_584_done:
  # rx subrule "scoped" subtype=capture negate=
    rx579_cur."!cursor_pos"(rx579_pos)
    $P10 = rx579_cur."scoped"("my")
    unless $P10, rx579_fail
    rx579_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx579_pos = $P10."pos"()
  # rx pass
    rx579_cur."!cursor_pass"(rx579_pos, "scope_declarator:sym<my>")
    rx579_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx579_pos)
    .return (rx579_cur)
  rx579_fail:
.annotate 'line', 4
    (rx579_rep, rx579_pos, $I10, $P10) = rx579_cur."!mark_fail"(0)
    lt rx579_pos, -1, rx579_done
    eq rx579_pos, -1, rx579_fail
    jump $I10
  rx579_done:
    rx579_cur."!cursor_fail"()
    rx579_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx579_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("139_1277356913.9538") :method
.annotate 'line', 4
    $P581 = self."!PREFIX__!subrule"("scoped", "my")
    new $P582, "ResizablePMCArray"
    push $P582, $P581
    .return ($P582)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("140_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx586_tgt
    .local int rx586_pos
    .local int rx586_off
    .local int rx586_eos
    .local int rx586_rep
    .local pmc rx586_cur
    (rx586_cur, rx586_pos, rx586_tgt) = self."!cursor_start"()
    rx586_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx586_cur
    .local pmc match
    .lex "$/", match
    length rx586_eos, rx586_tgt
    gt rx586_pos, rx586_eos, rx586_done
    set rx586_off, 0
    lt rx586_pos, 2, rx586_start
    sub rx586_off, rx586_pos, 1
    substr rx586_tgt, rx586_tgt, rx586_off
  rx586_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan590_done
    goto rxscan590_scan
  rxscan590_loop:
    ($P10) = rx586_cur."from"()
    inc $P10
    set rx586_pos, $P10
    ge rx586_pos, rx586_eos, rxscan590_done
  rxscan590_scan:
    set_addr $I10, rxscan590_loop
    rx586_cur."!mark_push"(0, rx586_pos, $I10)
  rxscan590_done:
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_591_fail
    rx586_cur."!mark_push"(0, rx586_pos, $I10)
  # rx literal  "our"
    add $I11, rx586_pos, 3
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 3
    ne $S10, "our", rx586_fail
    add rx586_pos, 3
    set_addr $I10, rxcap_591_fail
    ($I12, $I11) = rx586_cur."!mark_peek"($I10)
    rx586_cur."!cursor_pos"($I11)
    ($P10) = rx586_cur."!cursor_start"()
    $P10."!cursor_pass"(rx586_pos, "")
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_591_done
  rxcap_591_fail:
    goto rx586_fail
  rxcap_591_done:
  # rx subrule "scoped" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."scoped"("our")
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx586_pos = $P10."pos"()
  # rx pass
    rx586_cur."!cursor_pass"(rx586_pos, "scope_declarator:sym<our>")
    rx586_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx586_pos)
    .return (rx586_cur)
  rx586_fail:
.annotate 'line', 4
    (rx586_rep, rx586_pos, $I10, $P10) = rx586_cur."!mark_fail"(0)
    lt rx586_pos, -1, rx586_done
    eq rx586_pos, -1, rx586_fail
    jump $I10
  rx586_done:
    rx586_cur."!cursor_fail"()
    rx586_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx586_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("141_1277356913.9538") :method
.annotate 'line', 4
    $P588 = self."!PREFIX__!subrule"("scoped", "our")
    new $P589, "ResizablePMCArray"
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("142_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx593_tgt
    .local int rx593_pos
    .local int rx593_off
    .local int rx593_eos
    .local int rx593_rep
    .local pmc rx593_cur
    (rx593_cur, rx593_pos, rx593_tgt) = self."!cursor_start"()
    rx593_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx593_cur
    .local pmc match
    .lex "$/", match
    length rx593_eos, rx593_tgt
    gt rx593_pos, rx593_eos, rx593_done
    set rx593_off, 0
    lt rx593_pos, 2, rx593_start
    sub rx593_off, rx593_pos, 1
    substr rx593_tgt, rx593_tgt, rx593_off
  rx593_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan597_done
    goto rxscan597_scan
  rxscan597_loop:
    ($P10) = rx593_cur."from"()
    inc $P10
    set rx593_pos, $P10
    ge rx593_pos, rx593_eos, rxscan597_done
  rxscan597_scan:
    set_addr $I10, rxscan597_loop
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  rxscan597_done:
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_598_fail
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "has"
    add $I11, rx593_pos, 3
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 3
    ne $S10, "has", rx593_fail
    add rx593_pos, 3
    set_addr $I10, rxcap_598_fail
    ($I12, $I11) = rx593_cur."!mark_peek"($I10)
    rx593_cur."!cursor_pos"($I11)
    ($P10) = rx593_cur."!cursor_start"()
    $P10."!cursor_pass"(rx593_pos, "")
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_598_done
  rxcap_598_fail:
    goto rx593_fail
  rxcap_598_done:
  # rx subrule "scoped" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."scoped"("has")
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx593_pos = $P10."pos"()
  # rx pass
    rx593_cur."!cursor_pass"(rx593_pos, "scope_declarator:sym<has>")
    rx593_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx593_pos)
    .return (rx593_cur)
  rx593_fail:
.annotate 'line', 4
    (rx593_rep, rx593_pos, $I10, $P10) = rx593_cur."!mark_fail"(0)
    lt rx593_pos, -1, rx593_done
    eq rx593_pos, -1, rx593_fail
    jump $I10
  rx593_done:
    rx593_cur."!cursor_fail"()
    rx593_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx593_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("143_1277356913.9538") :method
.annotate 'line', 4
    $P595 = self."!PREFIX__!subrule"("scoped", "has")
    new $P596, "ResizablePMCArray"
    push $P596, $P595
    .return ($P596)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("144_1277356913.9538") :method :outer("11_1277356913.9538")
    .param pmc param_600
.annotate 'line', 277
    .lex "$*SCOPE", param_600
.annotate 'line', 4
    .local string rx601_tgt
    .local int rx601_pos
    .local int rx601_off
    .local int rx601_eos
    .local int rx601_rep
    .local pmc rx601_cur
    (rx601_cur, rx601_pos, rx601_tgt) = self."!cursor_start"()
    rx601_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx601_cur
    .local pmc match
    .lex "$/", match
    length rx601_eos, rx601_tgt
    gt rx601_pos, rx601_eos, rx601_done
    set rx601_off, 0
    lt rx601_pos, 2, rx601_start
    sub rx601_off, rx601_pos, 1
    substr rx601_tgt, rx601_tgt, rx601_off
  rx601_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan606_done
    goto rxscan606_scan
  rxscan606_loop:
    ($P10) = rx601_cur."from"()
    inc $P10
    set rx601_pos, $P10
    ge rx601_pos, rx601_eos, rxscan606_done
  rxscan606_scan:
    set_addr $I10, rxscan606_loop
    rx601_cur."!mark_push"(0, rx601_pos, $I10)
  rxscan606_done:
  alt607_0:
.annotate 'line', 277
    set_addr $I10, alt607_1
    rx601_cur."!mark_push"(0, rx601_pos, $I10)
.annotate 'line', 278
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."declarator"()
    unless $P10, rx601_fail
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
    goto alt607_end
  alt607_1:
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."multi_declarator"()
    unless $P10, rx601_fail
    rx601_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx601_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx601_cur."!cursor_pos"(rx601_pos)
    $P10 = rx601_cur."ws"()
    unless $P10, rx601_fail
    rx601_pos = $P10."pos"()
  alt607_end:
.annotate 'line', 277
  # rx pass
    rx601_cur."!cursor_pass"(rx601_pos, "scoped")
    rx601_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx601_pos)
    .return (rx601_cur)
  rx601_fail:
.annotate 'line', 4
    (rx601_rep, rx601_pos, $I10, $P10) = rx601_cur."!mark_fail"(0)
    lt rx601_pos, -1, rx601_done
    eq rx601_pos, -1, rx601_fail
    jump $I10
  rx601_done:
    rx601_cur."!cursor_fail"()
    rx601_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx601_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("145_1277356913.9538") :method
.annotate 'line', 4
    $P603 = self."!PREFIX__!subrule"("ws", "")
    $P604 = self."!PREFIX__!subrule"("ws", "")
    new $P605, "ResizablePMCArray"
    push $P605, $P603
    push $P605, $P604
    .return ($P605)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("146_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx613_tgt
    .local int rx613_pos
    .local int rx613_off
    .local int rx613_eos
    .local int rx613_rep
    .local pmc rx613_cur
    (rx613_cur, rx613_pos, rx613_tgt) = self."!cursor_start"()
    rx613_cur."!cursor_debug"("START ", "typename")
    .lex unicode:"$\x{a2}", rx613_cur
    .local pmc match
    .lex "$/", match
    length rx613_eos, rx613_tgt
    gt rx613_pos, rx613_eos, rx613_done
    set rx613_off, 0
    lt rx613_pos, 2, rx613_start
    sub rx613_off, rx613_pos, 1
    substr rx613_tgt, rx613_tgt, rx613_off
  rx613_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan617_done
    goto rxscan617_scan
  rxscan617_loop:
    ($P10) = rx613_cur."from"()
    inc $P10
    set rx613_pos, $P10
    ge rx613_pos, rx613_eos, rxscan617_done
  rxscan617_scan:
    set_addr $I10, rxscan617_loop
    rx613_cur."!mark_push"(0, rx613_pos, $I10)
  rxscan617_done:
.annotate 'line', 282
  # rx subrule "name" subtype=capture negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."name"()
    unless $P10, rx613_fail
    rx613_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx613_pos = $P10."pos"()
  # rx pass
    rx613_cur."!cursor_pass"(rx613_pos, "typename")
    rx613_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx613_pos)
    .return (rx613_cur)
  rx613_fail:
.annotate 'line', 4
    (rx613_rep, rx613_pos, $I10, $P10) = rx613_cur."!mark_fail"(0)
    lt rx613_pos, -1, rx613_done
    eq rx613_pos, -1, rx613_fail
    jump $I10
  rx613_done:
    rx613_cur."!cursor_fail"()
    rx613_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx613_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("147_1277356913.9538") :method
.annotate 'line', 4
    $P615 = self."!PREFIX__!subrule"("name", "")
    new $P616, "ResizablePMCArray"
    push $P616, $P615
    .return ($P616)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("148_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx619_tgt
    .local int rx619_pos
    .local int rx619_off
    .local int rx619_eos
    .local int rx619_rep
    .local pmc rx619_cur
    (rx619_cur, rx619_pos, rx619_tgt) = self."!cursor_start"()
    rx619_cur."!cursor_debug"("START ", "declarator")
    .lex unicode:"$\x{a2}", rx619_cur
    .local pmc match
    .lex "$/", match
    length rx619_eos, rx619_tgt
    gt rx619_pos, rx619_eos, rx619_done
    set rx619_off, 0
    lt rx619_pos, 2, rx619_start
    sub rx619_off, rx619_pos, 1
    substr rx619_tgt, rx619_tgt, rx619_off
  rx619_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan624_done
    goto rxscan624_scan
  rxscan624_loop:
    ($P10) = rx619_cur."from"()
    inc $P10
    set rx619_pos, $P10
    ge rx619_pos, rx619_eos, rxscan624_done
  rxscan624_scan:
    set_addr $I10, rxscan624_loop
    rx619_cur."!mark_push"(0, rx619_pos, $I10)
  rxscan624_done:
  alt625_0:
.annotate 'line', 284
    set_addr $I10, alt625_1
    rx619_cur."!mark_push"(0, rx619_pos, $I10)
.annotate 'line', 285
  # rx subrule "variable_declarator" subtype=capture negate=
    rx619_cur."!cursor_pos"(rx619_pos)
    $P10 = rx619_cur."variable_declarator"()
    unless $P10, rx619_fail
    rx619_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx619_pos = $P10."pos"()
    goto alt625_end
  alt625_1:
.annotate 'line', 286
  # rx subrule "routine_declarator" subtype=capture negate=
    rx619_cur."!cursor_pos"(rx619_pos)
    $P10 = rx619_cur."routine_declarator"()
    unless $P10, rx619_fail
    rx619_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx619_pos = $P10."pos"()
  alt625_end:
.annotate 'line', 284
  # rx pass
    rx619_cur."!cursor_pass"(rx619_pos, "declarator")
    rx619_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx619_pos)
    .return (rx619_cur)
  rx619_fail:
.annotate 'line', 4
    (rx619_rep, rx619_pos, $I10, $P10) = rx619_cur."!mark_fail"(0)
    lt rx619_pos, -1, rx619_done
    eq rx619_pos, -1, rx619_fail
    jump $I10
  rx619_done:
    rx619_cur."!cursor_fail"()
    rx619_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx619_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("149_1277356913.9538") :method
.annotate 'line', 4
    $P621 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P622 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P623, "ResizablePMCArray"
    push $P623, $P621
    push $P623, $P622
    .return ($P623)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("150_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx627_tgt
    .local int rx627_pos
    .local int rx627_off
    .local int rx627_eos
    .local int rx627_rep
    .local pmc rx627_cur
    (rx627_cur, rx627_pos, rx627_tgt) = self."!cursor_start"()
    rx627_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx627_cur
    .local pmc match
    .lex "$/", match
    length rx627_eos, rx627_tgt
    gt rx627_pos, rx627_eos, rx627_done
    set rx627_off, 0
    lt rx627_pos, 2, rx627_start
    sub rx627_off, rx627_pos, 1
    substr rx627_tgt, rx627_tgt, rx627_off
  rx627_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan631_done
    goto rxscan631_scan
  rxscan631_loop:
    ($P10) = rx627_cur."from"()
    inc $P10
    set rx627_pos, $P10
    ge rx627_pos, rx627_eos, rxscan631_done
  rxscan631_scan:
    set_addr $I10, rxscan631_loop
    rx627_cur."!mark_push"(0, rx627_pos, $I10)
  rxscan631_done:
.annotate 'line', 289
  # rx subrule "variable" subtype=capture negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."variable"()
    unless $P10, rx627_fail
    rx627_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx627_pos = $P10."pos"()
  # rx pass
    rx627_cur."!cursor_pass"(rx627_pos, "variable_declarator")
    rx627_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx627_pos)
    .return (rx627_cur)
  rx627_fail:
.annotate 'line', 4
    (rx627_rep, rx627_pos, $I10, $P10) = rx627_cur."!mark_fail"(0)
    lt rx627_pos, -1, rx627_done
    eq rx627_pos, -1, rx627_fail
    jump $I10
  rx627_done:
    rx627_cur."!cursor_fail"()
    rx627_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx627_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("151_1277356913.9538") :method
.annotate 'line', 4
    $P629 = self."!PREFIX__!subrule"("variable", "")
    new $P630, "ResizablePMCArray"
    push $P630, $P629
    .return ($P630)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("152_1277356913.9538") :method
.annotate 'line', 291
    $P633 = self."!protoregex"("routine_declarator")
    .return ($P633)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("153_1277356913.9538") :method
.annotate 'line', 291
    $P635 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P635)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("154_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx637_tgt
    .local int rx637_pos
    .local int rx637_off
    .local int rx637_eos
    .local int rx637_rep
    .local pmc rx637_cur
    (rx637_cur, rx637_pos, rx637_tgt) = self."!cursor_start"()
    rx637_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx637_cur
    .local pmc match
    .lex "$/", match
    length rx637_eos, rx637_tgt
    gt rx637_pos, rx637_eos, rx637_done
    set rx637_off, 0
    lt rx637_pos, 2, rx637_start
    sub rx637_off, rx637_pos, 1
    substr rx637_tgt, rx637_tgt, rx637_off
  rx637_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan641_done
    goto rxscan641_scan
  rxscan641_loop:
    ($P10) = rx637_cur."from"()
    inc $P10
    set rx637_pos, $P10
    ge rx637_pos, rx637_eos, rxscan641_done
  rxscan641_scan:
    set_addr $I10, rxscan641_loop
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  rxscan641_done:
.annotate 'line', 292
  # rx subcapture "sym"
    set_addr $I10, rxcap_642_fail
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  # rx literal  "sub"
    add $I11, rx637_pos, 3
    gt $I11, rx637_eos, rx637_fail
    sub $I11, rx637_pos, rx637_off
    substr $S10, rx637_tgt, $I11, 3
    ne $S10, "sub", rx637_fail
    add rx637_pos, 3
    set_addr $I10, rxcap_642_fail
    ($I12, $I11) = rx637_cur."!mark_peek"($I10)
    rx637_cur."!cursor_pos"($I11)
    ($P10) = rx637_cur."!cursor_start"()
    $P10."!cursor_pass"(rx637_pos, "")
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_642_done
  rxcap_642_fail:
    goto rx637_fail
  rxcap_642_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx637_cur."!cursor_pos"(rx637_pos)
    $P10 = rx637_cur."routine_def"()
    unless $P10, rx637_fail
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx637_pos = $P10."pos"()
  # rx pass
    rx637_cur."!cursor_pass"(rx637_pos, "routine_declarator:sym<sub>")
    rx637_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx637_pos)
    .return (rx637_cur)
  rx637_fail:
.annotate 'line', 4
    (rx637_rep, rx637_pos, $I10, $P10) = rx637_cur."!mark_fail"(0)
    lt rx637_pos, -1, rx637_done
    eq rx637_pos, -1, rx637_fail
    jump $I10
  rx637_done:
    rx637_cur."!cursor_fail"()
    rx637_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx637_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("155_1277356913.9538") :method
.annotate 'line', 4
    $P639 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P640, "ResizablePMCArray"
    push $P640, $P639
    .return ($P640)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("156_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx644_tgt
    .local int rx644_pos
    .local int rx644_off
    .local int rx644_eos
    .local int rx644_rep
    .local pmc rx644_cur
    (rx644_cur, rx644_pos, rx644_tgt) = self."!cursor_start"()
    rx644_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx644_cur
    .local pmc match
    .lex "$/", match
    length rx644_eos, rx644_tgt
    gt rx644_pos, rx644_eos, rx644_done
    set rx644_off, 0
    lt rx644_pos, 2, rx644_start
    sub rx644_off, rx644_pos, 1
    substr rx644_tgt, rx644_tgt, rx644_off
  rx644_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan648_done
    goto rxscan648_scan
  rxscan648_loop:
    ($P10) = rx644_cur."from"()
    inc $P10
    set rx644_pos, $P10
    ge rx644_pos, rx644_eos, rxscan648_done
  rxscan648_scan:
    set_addr $I10, rxscan648_loop
    rx644_cur."!mark_push"(0, rx644_pos, $I10)
  rxscan648_done:
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_649_fail
    rx644_cur."!mark_push"(0, rx644_pos, $I10)
  # rx literal  "method"
    add $I11, rx644_pos, 6
    gt $I11, rx644_eos, rx644_fail
    sub $I11, rx644_pos, rx644_off
    substr $S10, rx644_tgt, $I11, 6
    ne $S10, "method", rx644_fail
    add rx644_pos, 6
    set_addr $I10, rxcap_649_fail
    ($I12, $I11) = rx644_cur."!mark_peek"($I10)
    rx644_cur."!cursor_pos"($I11)
    ($P10) = rx644_cur."!cursor_start"()
    $P10."!cursor_pass"(rx644_pos, "")
    rx644_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_649_done
  rxcap_649_fail:
    goto rx644_fail
  rxcap_649_done:
  # rx subrule "method_def" subtype=capture negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."method_def"()
    unless $P10, rx644_fail
    rx644_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx644_pos = $P10."pos"()
  # rx pass
    rx644_cur."!cursor_pass"(rx644_pos, "routine_declarator:sym<method>")
    rx644_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx644_pos)
    .return (rx644_cur)
  rx644_fail:
.annotate 'line', 4
    (rx644_rep, rx644_pos, $I10, $P10) = rx644_cur."!mark_fail"(0)
    lt rx644_pos, -1, rx644_done
    eq rx644_pos, -1, rx644_fail
    jump $I10
  rx644_done:
    rx644_cur."!cursor_fail"()
    rx644_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx644_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("157_1277356913.9538") :method
.annotate 'line', 4
    $P646 = self."!PREFIX__!subrule"("method_def", "method")
    new $P647, "ResizablePMCArray"
    push $P647, $P646
    .return ($P647)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("158_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx651_tgt
    .local int rx651_pos
    .local int rx651_off
    .local int rx651_eos
    .local int rx651_rep
    .local pmc rx651_cur
    (rx651_cur, rx651_pos, rx651_tgt) = self."!cursor_start"()
    rx651_cur."!cursor_debug"("START ", "routine_def")
    rx651_cur."!cursor_caparray"("sigil", "deflongname")
    .lex unicode:"$\x{a2}", rx651_cur
    .local pmc match
    .lex "$/", match
    length rx651_eos, rx651_tgt
    gt rx651_pos, rx651_eos, rx651_done
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
.annotate 'line', 295
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
.annotate 'line', 296
  # rx rxquantr657 ** 0..1
    set_addr $I663, rxquantr657_done
    rx651_cur."!mark_push"(0, rx651_pos, $I663)
  rxquantr657_loop:
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_661_fail
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx rxquantr659 ** 0..1
    set_addr $I660, rxquantr659_done
    rx651_cur."!mark_push"(0, rx651_pos, $I660)
  rxquantr659_loop:
  # rx literal  "&"
    add $I11, rx651_pos, 1
    gt $I11, rx651_eos, rx651_fail
    sub $I11, rx651_pos, rx651_off
    substr $S10, rx651_tgt, $I11, 1
    ne $S10, "&", rx651_fail
    add rx651_pos, 1
    (rx651_rep) = rx651_cur."!mark_commit"($I660)
  rxquantr659_done:
    set_addr $I10, rxcap_661_fail
    ($I12, $I11) = rx651_cur."!mark_peek"($I10)
    rx651_cur."!cursor_pos"($I11)
    ($P10) = rx651_cur."!cursor_start"()
    $P10."!cursor_pass"(rx651_pos, "")
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_661_done
  rxcap_661_fail:
    goto rx651_fail
  rxcap_661_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."deflongname"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx651_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
    (rx651_rep) = rx651_cur."!mark_commit"($I663)
  rxquantr657_done:
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
.annotate 'line', 297
  # rx subrule "newpad" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."newpad"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  alt666_0:
.annotate 'line', 298
    set_addr $I10, alt666_1
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx651_pos, 1
    gt $I11, rx651_eos, rx651_fail
    sub $I11, rx651_pos, rx651_off
    substr $S10, rx651_tgt, $I11, 1
    ne $S10, "(", rx651_fail
    add rx651_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."signature"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx651_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx651_pos, 1
    gt $I11, rx651_eos, rx651_fail
    sub $I11, rx651_pos, rx651_off
    substr $S10, rx651_tgt, $I11, 1
    ne $S10, ")", rx651_fail
    add rx651_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
    goto alt666_end
  alt666_1:
.annotate 'line', 299
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
  alt666_end:
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
.annotate 'line', 300
  # rx subrule "blockoid" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."blockoid"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx651_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ws"()
    unless $P10, rx651_fail
    rx651_pos = $P10."pos"()
.annotate 'line', 295
  # rx pass
    rx651_cur."!cursor_pass"(rx651_pos, "routine_def")
    rx651_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx651_pos)
    .return (rx651_cur)
  rx651_fail:
.annotate 'line', 4
    (rx651_rep, rx651_pos, $I10, $P10) = rx651_cur."!mark_fail"(0)
    lt rx651_pos, -1, rx651_done
    eq rx651_pos, -1, rx651_fail
    jump $I10
  rx651_done:
    rx651_cur."!cursor_fail"()
    rx651_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx651_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("159_1277356913.9538") :method
.annotate 'line', 4
    $P653 = self."!PREFIX__!subrule"("ws", "")
    new $P654, "ResizablePMCArray"
    push $P654, $P653
    .return ($P654)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("160_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx676_tgt
    .local int rx676_pos
    .local int rx676_off
    .local int rx676_eos
    .local int rx676_rep
    .local pmc rx676_cur
    (rx676_cur, rx676_pos, rx676_tgt) = self."!cursor_start"()
    rx676_cur."!cursor_debug"("START ", "method_def")
    rx676_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx676_cur
    .local pmc match
    .lex "$/", match
    length rx676_eos, rx676_tgt
    gt rx676_pos, rx676_eos, rx676_done
    set rx676_off, 0
    lt rx676_pos, 2, rx676_start
    sub rx676_off, rx676_pos, 1
    substr rx676_tgt, rx676_tgt, rx676_off
  rx676_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan680_done
    goto rxscan680_scan
  rxscan680_loop:
    ($P10) = rx676_cur."from"()
    inc $P10
    set rx676_pos, $P10
    ge rx676_pos, rx676_eos, rxscan680_done
  rxscan680_scan:
    set_addr $I10, rxscan680_loop
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  rxscan680_done:
.annotate 'line', 303
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate 'line', 304
  # rx rxquantr682 ** 0..1
    set_addr $I683, rxquantr682_done
    rx676_cur."!mark_push"(0, rx676_pos, $I683)
  rxquantr682_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."deflongname"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx676_pos = $P10."pos"()
    (rx676_rep) = rx676_cur."!mark_commit"($I683)
  rxquantr682_done:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate 'line', 305
  # rx subrule "newpad" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."newpad"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  alt686_0:
.annotate 'line', 306
    set_addr $I10, alt686_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, "(", rx676_fail
    add rx676_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."signature"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, ")", rx676_fail
    add rx676_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
    goto alt686_end
  alt686_1:
.annotate 'line', 307
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  alt686_end:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate 'line', 308
  # rx subrule "blockoid" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."blockoid"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate 'line', 303
  # rx pass
    rx676_cur."!cursor_pass"(rx676_pos, "method_def")
    rx676_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx676_pos)
    .return (rx676_cur)
  rx676_fail:
.annotate 'line', 4
    (rx676_rep, rx676_pos, $I10, $P10) = rx676_cur."!mark_fail"(0)
    lt rx676_pos, -1, rx676_done
    eq rx676_pos, -1, rx676_fail
    jump $I10
  rx676_done:
    rx676_cur."!cursor_fail"()
    rx676_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx676_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("161_1277356913.9538") :method
.annotate 'line', 4
    $P678 = self."!PREFIX__!subrule"("ws", "")
    new $P679, "ResizablePMCArray"
    push $P679, $P678
    .return ($P679)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("162_1277356913.9538") :method
.annotate 'line', 311
    $P696 = self."!protoregex"("multi_declarator")
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("163_1277356913.9538") :method
.annotate 'line', 311
    $P698 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P698)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("164_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 313
    new $P700, "Undef"
    .lex "$*MULTINESS", $P700
.annotate 'line', 4
    .local string rx701_tgt
    .local int rx701_pos
    .local int rx701_off
    .local int rx701_eos
    .local int rx701_rep
    .local pmc rx701_cur
    (rx701_cur, rx701_pos, rx701_tgt) = self."!cursor_start"()
    rx701_cur."!cursor_debug"("START ", "multi_declarator:sym<multi>")
    .lex unicode:"$\x{a2}", rx701_cur
    .local pmc match
    .lex "$/", match
    length rx701_eos, rx701_tgt
    gt rx701_pos, rx701_eos, rx701_done
    set rx701_off, 0
    lt rx701_pos, 2, rx701_start
    sub rx701_off, rx701_pos, 1
    substr rx701_tgt, rx701_tgt, rx701_off
  rx701_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan705_done
    goto rxscan705_scan
  rxscan705_loop:
    ($P10) = rx701_cur."from"()
    inc $P10
    set rx701_pos, $P10
    ge rx701_pos, rx701_eos, rxscan705_done
  rxscan705_scan:
    set_addr $I10, rxscan705_loop
    rx701_cur."!mark_push"(0, rx701_pos, $I10)
  rxscan705_done:
.annotate 'line', 313
    rx701_cur."!cursor_pos"(rx701_pos)
    new $P706, "String"
    assign $P706, "multi"
    store_lex "$*MULTINESS", $P706
.annotate 'line', 314
  # rx subcapture "sym"
    set_addr $I10, rxcap_707_fail
    rx701_cur."!mark_push"(0, rx701_pos, $I10)
  # rx literal  "multi"
    add $I11, rx701_pos, 5
    gt $I11, rx701_eos, rx701_fail
    sub $I11, rx701_pos, rx701_off
    substr $S10, rx701_tgt, $I11, 5
    ne $S10, "multi", rx701_fail
    add rx701_pos, 5
    set_addr $I10, rxcap_707_fail
    ($I12, $I11) = rx701_cur."!mark_peek"($I10)
    rx701_cur."!cursor_pos"($I11)
    ($P10) = rx701_cur."!cursor_start"()
    $P10."!cursor_pass"(rx701_pos, "")
    rx701_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_707_done
  rxcap_707_fail:
    goto rx701_fail
  rxcap_707_done:
.annotate 'line', 315
  # rx subrule "ws" subtype=method negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."ws"()
    unless $P10, rx701_fail
    rx701_pos = $P10."pos"()
  alt708_0:
    set_addr $I10, alt708_1
    rx701_cur."!mark_push"(0, rx701_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."declarator"()
    unless $P10, rx701_fail
    rx701_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx701_pos = $P10."pos"()
    goto alt708_end
  alt708_1:
    set_addr $I10, alt708_2
    rx701_cur."!mark_push"(0, rx701_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."routine_def"()
    unless $P10, rx701_fail
    rx701_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx701_pos = $P10."pos"()
    goto alt708_end
  alt708_2:
  # rx subrule "panic" subtype=method negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."panic"("Malformed multi")
    unless $P10, rx701_fail
    rx701_pos = $P10."pos"()
  alt708_end:
.annotate 'line', 312
  # rx pass
    rx701_cur."!cursor_pass"(rx701_pos, "multi_declarator:sym<multi>")
    rx701_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<multi>", " at pos=", rx701_pos)
    .return (rx701_cur)
  rx701_fail:
.annotate 'line', 4
    (rx701_rep, rx701_pos, $I10, $P10) = rx701_cur."!mark_fail"(0)
    lt rx701_pos, -1, rx701_done
    eq rx701_pos, -1, rx701_fail
    jump $I10
  rx701_done:
    rx701_cur."!cursor_fail"()
    rx701_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<multi>")
    .return (rx701_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("165_1277356913.9538") :method
.annotate 'line', 4
    $P703 = self."!PREFIX__!subrule"("ws", "multi")
    new $P704, "ResizablePMCArray"
    push $P704, $P703
    .return ($P704)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("166_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 318
    new $P710, "Undef"
    .lex "$*MULTINESS", $P710
.annotate 'line', 4
    .local string rx711_tgt
    .local int rx711_pos
    .local int rx711_off
    .local int rx711_eos
    .local int rx711_rep
    .local pmc rx711_cur
    (rx711_cur, rx711_pos, rx711_tgt) = self."!cursor_start"()
    rx711_cur."!cursor_debug"("START ", "multi_declarator:sym<null>")
    .lex unicode:"$\x{a2}", rx711_cur
    .local pmc match
    .lex "$/", match
    length rx711_eos, rx711_tgt
    gt rx711_pos, rx711_eos, rx711_done
    set rx711_off, 0
    lt rx711_pos, 2, rx711_start
    sub rx711_off, rx711_pos, 1
    substr rx711_tgt, rx711_tgt, rx711_off
  rx711_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan715_done
    goto rxscan715_scan
  rxscan715_loop:
    ($P10) = rx711_cur."from"()
    inc $P10
    set rx711_pos, $P10
    ge rx711_pos, rx711_eos, rxscan715_done
  rxscan715_scan:
    set_addr $I10, rxscan715_loop
    rx711_cur."!mark_push"(0, rx711_pos, $I10)
  rxscan715_done:
.annotate 'line', 318
    rx711_cur."!cursor_pos"(rx711_pos)
    new $P716, "String"
    assign $P716, ""
    store_lex "$*MULTINESS", $P716
.annotate 'line', 319
  # rx subrule "declarator" subtype=capture negate=
    rx711_cur."!cursor_pos"(rx711_pos)
    $P10 = rx711_cur."declarator"()
    unless $P10, rx711_fail
    rx711_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx711_pos = $P10."pos"()
.annotate 'line', 317
  # rx pass
    rx711_cur."!cursor_pass"(rx711_pos, "multi_declarator:sym<null>")
    rx711_cur."!cursor_debug"("PASS  ", "multi_declarator:sym<null>", " at pos=", rx711_pos)
    .return (rx711_cur)
  rx711_fail:
.annotate 'line', 4
    (rx711_rep, rx711_pos, $I10, $P10) = rx711_cur."!mark_fail"(0)
    lt rx711_pos, -1, rx711_done
    eq rx711_pos, -1, rx711_fail
    jump $I10
  rx711_done:
    rx711_cur."!cursor_fail"()
    rx711_cur."!cursor_debug"("FAIL  ", "multi_declarator:sym<null>")
    .return (rx711_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("167_1277356913.9538") :method
.annotate 'line', 4
    $P713 = self."!PREFIX__!subrule"("declarator", "")
    new $P714, "ResizablePMCArray"
    push $P714, $P713
    .return ($P714)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("168_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx718_tgt
    .local int rx718_pos
    .local int rx718_off
    .local int rx718_eos
    .local int rx718_rep
    .local pmc rx718_cur
    (rx718_cur, rx718_pos, rx718_tgt) = self."!cursor_start"()
    rx718_cur."!cursor_debug"("START ", "signature")
    rx718_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx718_cur
    .local pmc match
    .lex "$/", match
    length rx718_eos, rx718_tgt
    gt rx718_pos, rx718_eos, rx718_done
    set rx718_off, 0
    lt rx718_pos, 2, rx718_start
    sub rx718_off, rx718_pos, 1
    substr rx718_tgt, rx718_tgt, rx718_off
  rx718_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan721_done
    goto rxscan721_scan
  rxscan721_loop:
    ($P10) = rx718_cur."from"()
    inc $P10
    set rx718_pos, $P10
    ge rx718_pos, rx718_eos, rxscan721_done
  rxscan721_scan:
    set_addr $I10, rxscan721_loop
    rx718_cur."!mark_push"(0, rx718_pos, $I10)
  rxscan721_done:
.annotate 'line', 322
  # rx rxquantr722 ** 0..1
    set_addr $I725, rxquantr722_done
    rx718_cur."!mark_push"(0, rx718_pos, $I725)
  rxquantr722_loop:
  # rx rxquantr723 ** 1..*
    set_addr $I724, rxquantr723_done
    rx718_cur."!mark_push"(0, -1, $I724)
  rxquantr723_loop:
  # rx subrule "ws" subtype=method negate=
    rx718_cur."!cursor_pos"(rx718_pos)
    $P10 = rx718_cur."ws"()
    unless $P10, rx718_fail
    rx718_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx718_cur."!cursor_pos"(rx718_pos)
    $P10 = rx718_cur."parameter"()
    unless $P10, rx718_fail
    rx718_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx718_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx718_cur."!cursor_pos"(rx718_pos)
    $P10 = rx718_cur."ws"()
    unless $P10, rx718_fail
    rx718_pos = $P10."pos"()
    (rx718_rep) = rx718_cur."!mark_commit"($I724)
    rx718_cur."!mark_push"(rx718_rep, rx718_pos, $I724)
  # rx literal  ","
    add $I11, rx718_pos, 1
    gt $I11, rx718_eos, rx718_fail
    sub $I11, rx718_pos, rx718_off
    substr $S10, rx718_tgt, $I11, 1
    ne $S10, ",", rx718_fail
    add rx718_pos, 1
    goto rxquantr723_loop
  rxquantr723_done:
    (rx718_rep) = rx718_cur."!mark_commit"($I725)
  rxquantr722_done:
  # rx pass
    rx718_cur."!cursor_pass"(rx718_pos, "signature")
    rx718_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx718_pos)
    .return (rx718_cur)
  rx718_fail:
.annotate 'line', 4
    (rx718_rep, rx718_pos, $I10, $P10) = rx718_cur."!mark_fail"(0)
    lt rx718_pos, -1, rx718_done
    eq rx718_pos, -1, rx718_fail
    jump $I10
  rx718_done:
    rx718_cur."!cursor_fail"()
    rx718_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx718_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("169_1277356913.9538") :method
.annotate 'line', 4
    new $P720, "ResizablePMCArray"
    push $P720, ""
    .return ($P720)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("170_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx727_tgt
    .local int rx727_pos
    .local int rx727_off
    .local int rx727_eos
    .local int rx727_rep
    .local pmc rx727_cur
    (rx727_cur, rx727_pos, rx727_tgt) = self."!cursor_start"()
    rx727_cur."!cursor_debug"("START ", "parameter")
    rx727_cur."!cursor_caparray"("default_value", "typename")
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
.annotate 'line', 325
  # rx rxquantr731 ** 0..*
    set_addr $I732, rxquantr731_done
    rx727_cur."!mark_push"(0, rx727_pos, $I732)
  rxquantr731_loop:
  # rx subrule "typename" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."typename"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx727_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."ws"()
    unless $P10, rx727_fail
    rx727_pos = $P10."pos"()
    (rx727_rep) = rx727_cur."!mark_commit"($I732)
    rx727_cur."!mark_push"(rx727_rep, rx727_pos, $I732)
    goto rxquantr731_loop
  rxquantr731_done:
  alt733_0:
.annotate 'line', 326
    set_addr $I10, alt733_1
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
.annotate 'line', 327
  # rx subcapture "quant"
    set_addr $I10, rxcap_734_fail
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx literal  "*"
    add $I11, rx727_pos, 1
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 1
    ne $S10, "*", rx727_fail
    add rx727_pos, 1
    set_addr $I10, rxcap_734_fail
    ($I12, $I11) = rx727_cur."!mark_peek"($I10)
    rx727_cur."!cursor_pos"($I11)
    ($P10) = rx727_cur."!cursor_start"()
    $P10."!cursor_pass"(rx727_pos, "")
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_734_done
  rxcap_734_fail:
    goto rx727_fail
  rxcap_734_done:
  # rx subrule "param_var" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."param_var"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx727_pos = $P10."pos"()
    goto alt733_end
  alt733_1:
  alt735_0:
.annotate 'line', 328
    set_addr $I10, alt735_1
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."param_var"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx727_pos = $P10."pos"()
    goto alt735_end
  alt735_1:
  # rx subrule "named_param" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."named_param"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx727_pos = $P10."pos"()
  alt735_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_737_fail
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  alt736_0:
    set_addr $I10, alt736_1
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx literal  "?"
    add $I11, rx727_pos, 1
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 1
    ne $S10, "?", rx727_fail
    add rx727_pos, 1
    goto alt736_end
  alt736_1:
    set_addr $I10, alt736_2
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx literal  "!"
    add $I11, rx727_pos, 1
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 1
    ne $S10, "!", rx727_fail
    add rx727_pos, 1
    goto alt736_end
  alt736_2:
  alt736_end:
    set_addr $I10, rxcap_737_fail
    ($I12, $I11) = rx727_cur."!mark_peek"($I10)
    rx727_cur."!cursor_pos"($I11)
    ($P10) = rx727_cur."!cursor_start"()
    $P10."!cursor_pass"(rx727_pos, "")
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_737_done
  rxcap_737_fail:
    goto rx727_fail
  rxcap_737_done:
  alt733_end:
.annotate 'line', 330
  # rx rxquantr738 ** 0..1
    set_addr $I739, rxquantr738_done
    rx727_cur."!mark_push"(0, rx727_pos, $I739)
  rxquantr738_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."default_value"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx727_pos = $P10."pos"()
    (rx727_rep) = rx727_cur."!mark_commit"($I739)
  rxquantr738_done:
.annotate 'line', 324
  # rx pass
    rx727_cur."!cursor_pass"(rx727_pos, "parameter")
    rx727_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx727_pos)
    .return (rx727_cur)
  rx727_fail:
.annotate 'line', 4
    (rx727_rep, rx727_pos, $I10, $P10) = rx727_cur."!mark_fail"(0)
    lt rx727_pos, -1, rx727_done
    eq rx727_pos, -1, rx727_fail
    jump $I10
  rx727_done:
    rx727_cur."!cursor_fail"()
    rx727_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx727_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("171_1277356913.9538") :method
.annotate 'line', 4
    new $P729, "ResizablePMCArray"
    push $P729, ""
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("172_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx741_tgt
    .local int rx741_pos
    .local int rx741_off
    .local int rx741_eos
    .local int rx741_rep
    .local pmc rx741_cur
    (rx741_cur, rx741_pos, rx741_tgt) = self."!cursor_start"()
    rx741_cur."!cursor_debug"("START ", "param_var")
    rx741_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx741_cur
    .local pmc match
    .lex "$/", match
    length rx741_eos, rx741_tgt
    gt rx741_pos, rx741_eos, rx741_done
    set rx741_off, 0
    lt rx741_pos, 2, rx741_start
    sub rx741_off, rx741_pos, 1
    substr rx741_tgt, rx741_tgt, rx741_off
  rx741_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan745_done
    goto rxscan745_scan
  rxscan745_loop:
    ($P10) = rx741_cur."from"()
    inc $P10
    set rx741_pos, $P10
    ge rx741_pos, rx741_eos, rxscan745_done
  rxscan745_scan:
    set_addr $I10, rxscan745_loop
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  rxscan745_done:
.annotate 'line', 334
  # rx subrule "sigil" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."sigil"()
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx741_pos = $P10."pos"()
  # rx rxquantr746 ** 0..1
    set_addr $I747, rxquantr746_done
    rx741_cur."!mark_push"(0, rx741_pos, $I747)
  rxquantr746_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."twigil"()
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx741_pos = $P10."pos"()
    (rx741_rep) = rx741_cur."!mark_commit"($I747)
  rxquantr746_done:
  alt748_0:
.annotate 'line', 335
    set_addr $I10, alt748_1
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."ident"()
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx741_pos = $P10."pos"()
    goto alt748_end
  alt748_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_749_fail
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx741_pos, rx741_eos, rx741_fail
    sub $I10, rx741_pos, rx741_off
    substr $S10, rx741_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx741_fail
    inc rx741_pos
    set_addr $I10, rxcap_749_fail
    ($I12, $I11) = rx741_cur."!mark_peek"($I10)
    rx741_cur."!cursor_pos"($I11)
    ($P10) = rx741_cur."!cursor_start"()
    $P10."!cursor_pass"(rx741_pos, "")
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_749_done
  rxcap_749_fail:
    goto rx741_fail
  rxcap_749_done:
  alt748_end:
.annotate 'line', 333
  # rx pass
    rx741_cur."!cursor_pass"(rx741_pos, "param_var")
    rx741_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx741_pos)
    .return (rx741_cur)
  rx741_fail:
.annotate 'line', 4
    (rx741_rep, rx741_pos, $I10, $P10) = rx741_cur."!mark_fail"(0)
    lt rx741_pos, -1, rx741_done
    eq rx741_pos, -1, rx741_fail
    jump $I10
  rx741_done:
    rx741_cur."!cursor_fail"()
    rx741_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx741_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("173_1277356913.9538") :method
.annotate 'line', 4
    $P743 = self."!PREFIX__!subrule"("sigil", "")
    new $P744, "ResizablePMCArray"
    push $P744, $P743
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("174_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx751_tgt
    .local int rx751_pos
    .local int rx751_off
    .local int rx751_eos
    .local int rx751_rep
    .local pmc rx751_cur
    (rx751_cur, rx751_pos, rx751_tgt) = self."!cursor_start"()
    rx751_cur."!cursor_debug"("START ", "named_param")
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
.annotate 'line', 339
  # rx literal  ":"
    add $I11, rx751_pos, 1
    gt $I11, rx751_eos, rx751_fail
    sub $I11, rx751_pos, rx751_off
    substr $S10, rx751_tgt, $I11, 1
    ne $S10, ":", rx751_fail
    add rx751_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."param_var"()
    unless $P10, rx751_fail
    rx751_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx751_pos = $P10."pos"()
.annotate 'line', 338
  # rx pass
    rx751_cur."!cursor_pass"(rx751_pos, "named_param")
    rx751_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx751_pos)
    .return (rx751_cur)
  rx751_fail:
.annotate 'line', 4
    (rx751_rep, rx751_pos, $I10, $P10) = rx751_cur."!mark_fail"(0)
    lt rx751_pos, -1, rx751_done
    eq rx751_pos, -1, rx751_fail
    jump $I10
  rx751_done:
    rx751_cur."!cursor_fail"()
    rx751_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx751_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("175_1277356913.9538") :method
.annotate 'line', 4
    $P753 = self."!PREFIX__!subrule"("param_var", ":")
    new $P754, "ResizablePMCArray"
    push $P754, $P753
    .return ($P754)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("176_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx757_tgt
    .local int rx757_pos
    .local int rx757_off
    .local int rx757_eos
    .local int rx757_rep
    .local pmc rx757_cur
    (rx757_cur, rx757_pos, rx757_tgt) = self."!cursor_start"()
    rx757_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx757_cur
    .local pmc match
    .lex "$/", match
    length rx757_eos, rx757_tgt
    gt rx757_pos, rx757_eos, rx757_done
    set rx757_off, 0
    lt rx757_pos, 2, rx757_start
    sub rx757_off, rx757_pos, 1
    substr rx757_tgt, rx757_tgt, rx757_off
  rx757_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan761_done
    goto rxscan761_scan
  rxscan761_loop:
    ($P10) = rx757_cur."from"()
    inc $P10
    set rx757_pos, $P10
    ge rx757_pos, rx757_eos, rxscan761_done
  rxscan761_scan:
    set_addr $I10, rxscan761_loop
    rx757_cur."!mark_push"(0, rx757_pos, $I10)
  rxscan761_done:
.annotate 'line', 342
  # rx subrule "ws" subtype=method negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."ws"()
    unless $P10, rx757_fail
    rx757_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx757_pos, 1
    gt $I11, rx757_eos, rx757_fail
    sub $I11, rx757_pos, rx757_off
    substr $S10, rx757_tgt, $I11, 1
    ne $S10, "=", rx757_fail
    add rx757_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."ws"()
    unless $P10, rx757_fail
    rx757_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."EXPR"("i=")
    unless $P10, rx757_fail
    rx757_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx757_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."ws"()
    unless $P10, rx757_fail
    rx757_pos = $P10."pos"()
  # rx pass
    rx757_cur."!cursor_pass"(rx757_pos, "default_value")
    rx757_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx757_pos)
    .return (rx757_cur)
  rx757_fail:
.annotate 'line', 4
    (rx757_rep, rx757_pos, $I10, $P10) = rx757_cur."!mark_fail"(0)
    lt rx757_pos, -1, rx757_done
    eq rx757_pos, -1, rx757_fail
    jump $I10
  rx757_done:
    rx757_cur."!cursor_fail"()
    rx757_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx757_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("177_1277356913.9538") :method
.annotate 'line', 4
    $P759 = self."!PREFIX__!subrule"("ws", "")
    new $P760, "ResizablePMCArray"
    push $P760, $P759
    .return ($P760)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("178_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx766_tgt
    .local int rx766_pos
    .local int rx766_off
    .local int rx766_eos
    .local int rx766_rep
    .local pmc rx766_cur
    (rx766_cur, rx766_pos, rx766_tgt) = self."!cursor_start"()
    rx766_cur."!cursor_debug"("START ", "regex_declarator")
    rx766_cur."!cursor_caparray"("signature")
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
.annotate 'line', 344
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  alt772_0:
.annotate 'line', 345
    set_addr $I10, alt772_1
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
.annotate 'line', 346
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_774_fail
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  # rx literal  "proto"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "proto", rx766_fail
    add rx766_pos, 5
    set_addr $I10, rxcap_774_fail
    ($I12, $I11) = rx766_cur."!mark_peek"($I10)
    rx766_cur."!cursor_pos"($I11)
    ($P10) = rx766_cur."!cursor_start"()
    $P10."!cursor_pass"(rx766_pos, "")
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_774_done
  rxcap_774_fail:
    goto rx766_fail
  rxcap_774_done:
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  alt776_0:
    set_addr $I10, alt776_1
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  # rx literal  "regex"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "regex", rx766_fail
    add rx766_pos, 5
    goto alt776_end
  alt776_1:
    set_addr $I10, alt776_2
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  # rx literal  "token"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "token", rx766_fail
    add rx766_pos, 5
    goto alt776_end
  alt776_2:
  # rx literal  "rule"
    add $I11, rx766_pos, 4
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 4
    ne $S10, "rule", rx766_fail
    add rx766_pos, 4
  alt776_end:
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 347
  # rx subrule "deflongname" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."deflongname"()
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  alt779_0:
.annotate 'line', 348
    set_addr $I10, alt779_1
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
.annotate 'line', 349
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "{", rx766_fail
    add rx766_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "<...>", rx766_fail
    add rx766_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "}", rx766_fail
    add rx766_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ENDSTMT"()
    unless $P10, rx766_fail
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
    goto alt779_end
  alt779_1:
.annotate 'line', 350
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  alt779_end:
.annotate 'line', 351
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 346
    goto alt772_end
  alt772_1:
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_789_fail
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  alt788_0:
    set_addr $I10, alt788_1
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  # rx literal  "regex"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "regex", rx766_fail
    add rx766_pos, 5
    goto alt788_end
  alt788_1:
    set_addr $I10, alt788_2
    rx766_cur."!mark_push"(0, rx766_pos, $I10)
  # rx literal  "token"
    add $I11, rx766_pos, 5
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 5
    ne $S10, "token", rx766_fail
    add rx766_pos, 5
    goto alt788_end
  alt788_2:
  # rx literal  "rule"
    add $I11, rx766_pos, 4
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 4
    ne $S10, "rule", rx766_fail
    add rx766_pos, 4
  alt788_end:
    set_addr $I10, rxcap_789_fail
    ($I12, $I11) = rx766_cur."!mark_peek"($I10)
    rx766_cur."!cursor_pos"($I11)
    ($P10) = rx766_cur."!cursor_start"()
    $P10."!cursor_pass"(rx766_pos, "")
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_789_done
  rxcap_789_fail:
    goto rx766_fail
  rxcap_789_done:
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 353
  # rx subrule "deflongname" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."deflongname"()
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 354
  # rx subrule "newpad" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."newpad"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 355
  # rx rxquantr793 ** 0..1
    set_addr $I798, rxquantr793_done
    rx766_cur."!mark_push"(0, rx766_pos, $I798)
  rxquantr793_loop:
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "(", rx766_fail
    add rx766_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."signature"()
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx766_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, ")", rx766_fail
    add rx766_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
    (rx766_rep) = rx766_cur."!mark_commit"($I798)
  rxquantr793_done:
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 356
  # rx reduce name="regex_declarator" key="open"
    rx766_cur."!cursor_pos"(rx766_pos)
    rx766_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 357
  # rx literal  "{"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "{", rx766_fail
    add rx766_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."LANG"("Regex", "nibbler")
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx766_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "}", rx766_fail
    add rx766_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ENDSTMT"()
    unless $P10, rx766_fail
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  alt772_end:
.annotate 'line', 358
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
.annotate 'line', 344
  # rx pass
    rx766_cur."!cursor_pass"(rx766_pos, "regex_declarator")
    rx766_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx766_pos)
    .return (rx766_cur)
  rx766_fail:
.annotate 'line', 4
    (rx766_rep, rx766_pos, $I10, $P10) = rx766_cur."!mark_fail"(0)
    lt rx766_pos, -1, rx766_done
    eq rx766_pos, -1, rx766_fail
    jump $I10
  rx766_done:
    rx766_cur."!cursor_fail"()
    rx766_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx766_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("179_1277356913.9538") :method
.annotate 'line', 4
    $P768 = self."!PREFIX__!subrule"("ws", "")
    new $P769, "ResizablePMCArray"
    push $P769, $P768
    .return ($P769)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("180_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx804_tgt
    .local int rx804_pos
    .local int rx804_off
    .local int rx804_eos
    .local int rx804_rep
    .local pmc rx804_cur
    (rx804_cur, rx804_pos, rx804_tgt) = self."!cursor_start"()
    rx804_cur."!cursor_debug"("START ", "dotty")
    rx804_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx804_cur
    .local pmc match
    .lex "$/", match
    length rx804_eos, rx804_tgt
    gt rx804_pos, rx804_eos, rx804_done
    set rx804_off, 0
    lt rx804_pos, 2, rx804_start
    sub rx804_off, rx804_pos, 1
    substr rx804_tgt, rx804_tgt, rx804_off
  rx804_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan808_done
    goto rxscan808_scan
  rxscan808_loop:
    ($P10) = rx804_cur."from"()
    inc $P10
    set rx804_pos, $P10
    ge rx804_pos, rx804_eos, rxscan808_done
  rxscan808_scan:
    set_addr $I10, rxscan808_loop
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
  rxscan808_done:
.annotate 'line', 362
  # rx literal  "."
    add $I11, rx804_pos, 1
    gt $I11, rx804_eos, rx804_fail
    sub $I11, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I11, 1
    ne $S10, ".", rx804_fail
    add rx804_pos, 1
  alt809_0:
.annotate 'line', 363
    set_addr $I10, alt809_1
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."deflongname"()
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx804_pos = $P10."pos"()
    goto alt809_end
  alt809_1:
.annotate 'line', 364
  # rx enumcharlist negate=0 zerowidth
    ge rx804_pos, rx804_eos, rx804_fail
    sub $I10, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx804_fail
  # rx subrule "quote" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."quote"()
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx804_pos = $P10."pos"()
  alt810_0:
.annotate 'line', 365
    set_addr $I10, alt810_1
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx804_pos, rx804_eos, rx804_fail
    sub $I10, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx804_fail
    goto alt810_end
  alt810_1:
  # rx subrule "panic" subtype=method negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx804_fail
    rx804_pos = $P10."pos"()
  alt810_end:
  alt809_end:
.annotate 'line', 371
  # rx rxquantr811 ** 0..1
    set_addr $I813, rxquantr811_done
    rx804_cur."!mark_push"(0, rx804_pos, $I813)
  rxquantr811_loop:
  alt812_0:
.annotate 'line', 368
    set_addr $I10, alt812_1
    rx804_cur."!mark_push"(0, rx804_pos, $I10)
.annotate 'line', 369
  # rx enumcharlist negate=0 zerowidth
    ge rx804_pos, rx804_eos, rx804_fail
    sub $I10, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx804_fail
  # rx subrule "args" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."args"()
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx804_pos = $P10."pos"()
    goto alt812_end
  alt812_1:
.annotate 'line', 370
  # rx literal  ":"
    add $I11, rx804_pos, 1
    gt $I11, rx804_eos, rx804_fail
    sub $I11, rx804_pos, rx804_off
    substr $S10, rx804_tgt, $I11, 1
    ne $S10, ":", rx804_fail
    add rx804_pos, 1
  # rx charclass s
    ge rx804_pos, rx804_eos, rx804_fail
    sub $I10, rx804_pos, rx804_off
    is_cclass $I11, 32, rx804_tgt, $I10
    unless $I11, rx804_fail
    inc rx804_pos
  # rx subrule "arglist" subtype=capture negate=
    rx804_cur."!cursor_pos"(rx804_pos)
    $P10 = rx804_cur."arglist"()
    unless $P10, rx804_fail
    rx804_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx804_pos = $P10."pos"()
  alt812_end:
.annotate 'line', 371
    (rx804_rep) = rx804_cur."!mark_commit"($I813)
  rxquantr811_done:
.annotate 'line', 361
  # rx pass
    rx804_cur."!cursor_pass"(rx804_pos, "dotty")
    rx804_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx804_pos)
    .return (rx804_cur)
  rx804_fail:
.annotate 'line', 4
    (rx804_rep, rx804_pos, $I10, $P10) = rx804_cur."!mark_fail"(0)
    lt rx804_pos, -1, rx804_done
    eq rx804_pos, -1, rx804_fail
    jump $I10
  rx804_done:
    rx804_cur."!cursor_fail"()
    rx804_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx804_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("181_1277356913.9538") :method
.annotate 'line', 4
    $P806 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P807, "ResizablePMCArray"
    push $P807, "'"
    push $P807, "\""
    push $P807, $P806
    .return ($P807)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("182_1277356913.9538") :method
.annotate 'line', 375
    $P815 = self."!protoregex"("term")
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("183_1277356913.9538") :method
.annotate 'line', 375
    $P817 = self."!PREFIX__!protoregex"("term")
    .return ($P817)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("184_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx819_tgt
    .local int rx819_pos
    .local int rx819_off
    .local int rx819_eos
    .local int rx819_rep
    .local pmc rx819_cur
    (rx819_cur, rx819_pos, rx819_tgt) = self."!cursor_start"()
    rx819_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx819_cur
    .local pmc match
    .lex "$/", match
    length rx819_eos, rx819_tgt
    gt rx819_pos, rx819_eos, rx819_done
    set rx819_off, 0
    lt rx819_pos, 2, rx819_start
    sub rx819_off, rx819_pos, 1
    substr rx819_tgt, rx819_tgt, rx819_off
  rx819_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan822_done
    goto rxscan822_scan
  rxscan822_loop:
    ($P10) = rx819_cur."from"()
    inc $P10
    set rx819_pos, $P10
    ge rx819_pos, rx819_eos, rxscan822_done
  rxscan822_scan:
    set_addr $I10, rxscan822_loop
    rx819_cur."!mark_push"(0, rx819_pos, $I10)
  rxscan822_done:
.annotate 'line', 377
  # rx subcapture "sym"
    set_addr $I10, rxcap_823_fail
    rx819_cur."!mark_push"(0, rx819_pos, $I10)
  # rx literal  "self"
    add $I11, rx819_pos, 4
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 4
    ne $S10, "self", rx819_fail
    add rx819_pos, 4
    set_addr $I10, rxcap_823_fail
    ($I12, $I11) = rx819_cur."!mark_peek"($I10)
    rx819_cur."!cursor_pos"($I11)
    ($P10) = rx819_cur."!cursor_start"()
    $P10."!cursor_pass"(rx819_pos, "")
    rx819_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_823_done
  rxcap_823_fail:
    goto rx819_fail
  rxcap_823_done:
  # rxanchor rwb
    le rx819_pos, 0, rx819_fail
    sub $I10, rx819_pos, rx819_off
    is_cclass $I11, 8192, rx819_tgt, $I10
    if $I11, rx819_fail
    dec $I10
    is_cclass $I11, 8192, rx819_tgt, $I10
    unless $I11, rx819_fail
  # rx pass
    rx819_cur."!cursor_pass"(rx819_pos, "term:sym<self>")
    rx819_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx819_pos)
    .return (rx819_cur)
  rx819_fail:
.annotate 'line', 4
    (rx819_rep, rx819_pos, $I10, $P10) = rx819_cur."!mark_fail"(0)
    lt rx819_pos, -1, rx819_done
    eq rx819_pos, -1, rx819_fail
    jump $I10
  rx819_done:
    rx819_cur."!cursor_fail"()
    rx819_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx819_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("185_1277356913.9538") :method
.annotate 'line', 4
    new $P821, "ResizablePMCArray"
    push $P821, "self"
    .return ($P821)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("186_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "term:sym<identifier>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan829_done
    goto rxscan829_scan
  rxscan829_loop:
    ($P10) = rx825_cur."from"()
    inc $P10
    set rx825_pos, $P10
    ge rx825_pos, rx825_eos, rxscan829_done
  rxscan829_scan:
    set_addr $I10, rxscan829_loop
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  rxscan829_done:
.annotate 'line', 380
  # rx subrule "deflongname" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."deflongname"()
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx825_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx825_pos, rx825_eos, rx825_fail
    sub $I10, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx825_fail
  # rx subrule "args" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."args"()
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx825_pos = $P10."pos"()
.annotate 'line', 379
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "term:sym<identifier>")
    rx825_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate 'line', 4
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("187_1277356913.9538") :method
.annotate 'line', 4
    $P827 = self."!PREFIX__!subrule"("deflongname", "")
    new $P828, "ResizablePMCArray"
    push $P828, $P827
    .return ($P828)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("188_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx831_tgt
    .local int rx831_pos
    .local int rx831_off
    .local int rx831_eos
    .local int rx831_rep
    .local pmc rx831_cur
    (rx831_cur, rx831_pos, rx831_tgt) = self."!cursor_start"()
    rx831_cur."!cursor_debug"("START ", "term:sym<name>")
    rx831_cur."!cursor_caparray"("args")
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
.annotate 'line', 384
  # rx subrule "name" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."name"()
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx831_pos = $P10."pos"()
  # rx rxquantr836 ** 0..1
    set_addr $I837, rxquantr836_done
    rx831_cur."!mark_push"(0, rx831_pos, $I837)
  rxquantr836_loop:
  # rx subrule "args" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."args"()
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx831_pos = $P10."pos"()
    (rx831_rep) = rx831_cur."!mark_commit"($I837)
  rxquantr836_done:
.annotate 'line', 383
  # rx pass
    rx831_cur."!cursor_pass"(rx831_pos, "term:sym<name>")
    rx831_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx831_pos)
    .return (rx831_cur)
  rx831_fail:
.annotate 'line', 4
    (rx831_rep, rx831_pos, $I10, $P10) = rx831_cur."!mark_fail"(0)
    lt rx831_pos, -1, rx831_done
    eq rx831_pos, -1, rx831_fail
    jump $I10
  rx831_done:
    rx831_cur."!cursor_fail"()
    rx831_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx831_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("189_1277356913.9538") :method
.annotate 'line', 4
    $P833 = self."!PREFIX__!subrule"("name", "")
    new $P834, "ResizablePMCArray"
    push $P834, $P833
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("190_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx839_tgt
    .local int rx839_pos
    .local int rx839_off
    .local int rx839_eos
    .local int rx839_rep
    .local pmc rx839_cur
    (rx839_cur, rx839_pos, rx839_tgt) = self."!cursor_start"()
    rx839_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx839_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx839_cur
    .local pmc match
    .lex "$/", match
    length rx839_eos, rx839_tgt
    gt rx839_pos, rx839_eos, rx839_done
    set rx839_off, 0
    lt rx839_pos, 2, rx839_start
    sub rx839_off, rx839_pos, 1
    substr rx839_tgt, rx839_tgt, rx839_off
  rx839_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan842_done
    goto rxscan842_scan
  rxscan842_loop:
    ($P10) = rx839_cur."from"()
    inc $P10
    set rx839_pos, $P10
    ge rx839_pos, rx839_eos, rxscan842_done
  rxscan842_scan:
    set_addr $I10, rxscan842_loop
    rx839_cur."!mark_push"(0, rx839_pos, $I10)
  rxscan842_done:
.annotate 'line', 388
  # rx literal  "pir::"
    add $I11, rx839_pos, 5
    gt $I11, rx839_eos, rx839_fail
    sub $I11, rx839_pos, rx839_off
    substr $S10, rx839_tgt, $I11, 5
    ne $S10, "pir::", rx839_fail
    add rx839_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_843_fail
    rx839_cur."!mark_push"(0, rx839_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx839_pos, rx839_off
    find_not_cclass $I11, 8192, rx839_tgt, $I10, rx839_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx839_fail
    add rx839_pos, rx839_off, $I11
    set_addr $I10, rxcap_843_fail
    ($I12, $I11) = rx839_cur."!mark_peek"($I10)
    rx839_cur."!cursor_pos"($I11)
    ($P10) = rx839_cur."!cursor_start"()
    $P10."!cursor_pass"(rx839_pos, "")
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_843_done
  rxcap_843_fail:
    goto rx839_fail
  rxcap_843_done:
  # rx rxquantr844 ** 0..1
    set_addr $I845, rxquantr844_done
    rx839_cur."!mark_push"(0, rx839_pos, $I845)
  rxquantr844_loop:
  # rx subrule "args" subtype=capture negate=
    rx839_cur."!cursor_pos"(rx839_pos)
    $P10 = rx839_cur."args"()
    unless $P10, rx839_fail
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx839_pos = $P10."pos"()
    (rx839_rep) = rx839_cur."!mark_commit"($I845)
  rxquantr844_done:
.annotate 'line', 387
  # rx pass
    rx839_cur."!cursor_pass"(rx839_pos, "term:sym<pir::op>")
    rx839_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx839_pos)
    .return (rx839_cur)
  rx839_fail:
.annotate 'line', 4
    (rx839_rep, rx839_pos, $I10, $P10) = rx839_cur."!mark_fail"(0)
    lt rx839_pos, -1, rx839_done
    eq rx839_pos, -1, rx839_fail
    jump $I10
  rx839_done:
    rx839_cur."!cursor_fail"()
    rx839_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx839_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("191_1277356913.9538") :method
.annotate 'line', 4
    new $P841, "ResizablePMCArray"
    push $P841, "pir::"
    .return ($P841)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("192_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx847_tgt
    .local int rx847_pos
    .local int rx847_off
    .local int rx847_eos
    .local int rx847_rep
    .local pmc rx847_cur
    (rx847_cur, rx847_pos, rx847_tgt) = self."!cursor_start"()
    rx847_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx847_cur
    .local pmc match
    .lex "$/", match
    length rx847_eos, rx847_tgt
    gt rx847_pos, rx847_eos, rx847_done
    set rx847_off, 0
    lt rx847_pos, 2, rx847_start
    sub rx847_off, rx847_pos, 1
    substr rx847_tgt, rx847_tgt, rx847_off
  rx847_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan851_done
    goto rxscan851_scan
  rxscan851_loop:
    ($P10) = rx847_cur."from"()
    inc $P10
    set rx847_pos, $P10
    ge rx847_pos, rx847_eos, rxscan851_done
  rxscan851_scan:
    set_addr $I10, rxscan851_loop
    rx847_cur."!mark_push"(0, rx847_pos, $I10)
  rxscan851_done:
.annotate 'line', 392
  # rx literal  "("
    add $I11, rx847_pos, 1
    gt $I11, rx847_eos, rx847_fail
    sub $I11, rx847_pos, rx847_off
    substr $S10, rx847_tgt, $I11, 1
    ne $S10, "(", rx847_fail
    add rx847_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx847_cur."!cursor_pos"(rx847_pos)
    $P10 = rx847_cur."arglist"()
    unless $P10, rx847_fail
    rx847_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx847_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx847_pos, 1
    gt $I11, rx847_eos, rx847_fail
    sub $I11, rx847_pos, rx847_off
    substr $S10, rx847_tgt, $I11, 1
    ne $S10, ")", rx847_fail
    add rx847_pos, 1
  # rx pass
    rx847_cur."!cursor_pass"(rx847_pos, "args")
    rx847_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx847_pos)
    .return (rx847_cur)
  rx847_fail:
.annotate 'line', 4
    (rx847_rep, rx847_pos, $I10, $P10) = rx847_cur."!mark_fail"(0)
    lt rx847_pos, -1, rx847_done
    eq rx847_pos, -1, rx847_fail
    jump $I10
  rx847_done:
    rx847_cur."!cursor_fail"()
    rx847_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx847_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("193_1277356913.9538") :method
.annotate 'line', 4
    $P849 = self."!PREFIX__!subrule"("arglist", "(")
    new $P850, "ResizablePMCArray"
    push $P850, $P849
    .return ($P850)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("194_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx853_tgt
    .local int rx853_pos
    .local int rx853_off
    .local int rx853_eos
    .local int rx853_rep
    .local pmc rx853_cur
    (rx853_cur, rx853_pos, rx853_tgt) = self."!cursor_start"()
    rx853_cur."!cursor_debug"("START ", "arglist")
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
.annotate 'line', 396
  # rx subrule "ws" subtype=method negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."ws"()
    unless $P10, rx853_fail
    rx853_pos = $P10."pos"()
  alt858_0:
.annotate 'line', 397
    set_addr $I10, alt858_1
    rx853_cur."!mark_push"(0, rx853_pos, $I10)
.annotate 'line', 398
  # rx subrule "EXPR" subtype=capture negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."EXPR"("f=")
    unless $P10, rx853_fail
    rx853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx853_pos = $P10."pos"()
    goto alt858_end
  alt858_1:
  alt858_end:
.annotate 'line', 395
  # rx pass
    rx853_cur."!cursor_pass"(rx853_pos, "arglist")
    rx853_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx853_pos)
    .return (rx853_cur)
  rx853_fail:
.annotate 'line', 4
    (rx853_rep, rx853_pos, $I10, $P10) = rx853_cur."!mark_fail"(0)
    lt rx853_pos, -1, rx853_done
    eq rx853_pos, -1, rx853_fail
    jump $I10
  rx853_done:
    rx853_cur."!cursor_fail"()
    rx853_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx853_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("195_1277356913.9538") :method
.annotate 'line', 4
    $P855 = self."!PREFIX__!subrule"("ws", "")
    new $P856, "ResizablePMCArray"
    push $P856, $P855
    .return ($P856)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("196_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx860_tgt
    .local int rx860_pos
    .local int rx860_off
    .local int rx860_eos
    .local int rx860_rep
    .local pmc rx860_cur
    (rx860_cur, rx860_pos, rx860_tgt) = self."!cursor_start"()
    rx860_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx860_cur
    .local pmc match
    .lex "$/", match
    length rx860_eos, rx860_tgt
    gt rx860_pos, rx860_eos, rx860_done
    set rx860_off, 0
    lt rx860_pos, 2, rx860_start
    sub rx860_off, rx860_pos, 1
    substr rx860_tgt, rx860_tgt, rx860_off
  rx860_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan864_done
    goto rxscan864_scan
  rxscan864_loop:
    ($P10) = rx860_cur."from"()
    inc $P10
    set rx860_pos, $P10
    ge rx860_pos, rx860_eos, rxscan864_done
  rxscan864_scan:
    set_addr $I10, rxscan864_loop
    rx860_cur."!mark_push"(0, rx860_pos, $I10)
  rxscan864_done:
.annotate 'line', 404
  # rx subrule "value" subtype=capture negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."value"()
    unless $P10, rx860_fail
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx860_pos = $P10."pos"()
  # rx pass
    rx860_cur."!cursor_pass"(rx860_pos, "term:sym<value>")
    rx860_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx860_pos)
    .return (rx860_cur)
  rx860_fail:
.annotate 'line', 4
    (rx860_rep, rx860_pos, $I10, $P10) = rx860_cur."!mark_fail"(0)
    lt rx860_pos, -1, rx860_done
    eq rx860_pos, -1, rx860_fail
    jump $I10
  rx860_done:
    rx860_cur."!cursor_fail"()
    rx860_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx860_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("197_1277356913.9538") :method
.annotate 'line', 4
    $P862 = self."!PREFIX__!subrule"("value", "")
    new $P863, "ResizablePMCArray"
    push $P863, $P862
    .return ($P863)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("198_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx866_tgt
    .local int rx866_pos
    .local int rx866_off
    .local int rx866_eos
    .local int rx866_rep
    .local pmc rx866_cur
    (rx866_cur, rx866_pos, rx866_tgt) = self."!cursor_start"()
    rx866_cur."!cursor_debug"("START ", "value")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan871_done
    goto rxscan871_scan
  rxscan871_loop:
    ($P10) = rx866_cur."from"()
    inc $P10
    set rx866_pos, $P10
    ge rx866_pos, rx866_eos, rxscan871_done
  rxscan871_scan:
    set_addr $I10, rxscan871_loop
    rx866_cur."!mark_push"(0, rx866_pos, $I10)
  rxscan871_done:
  alt872_0:
.annotate 'line', 406
    set_addr $I10, alt872_1
    rx866_cur."!mark_push"(0, rx866_pos, $I10)
.annotate 'line', 407
  # rx subrule "quote" subtype=capture negate=
    rx866_cur."!cursor_pos"(rx866_pos)
    $P10 = rx866_cur."quote"()
    unless $P10, rx866_fail
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx866_pos = $P10."pos"()
    goto alt872_end
  alt872_1:
.annotate 'line', 408
  # rx subrule "number" subtype=capture negate=
    rx866_cur."!cursor_pos"(rx866_pos)
    $P10 = rx866_cur."number"()
    unless $P10, rx866_fail
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx866_pos = $P10."pos"()
  alt872_end:
.annotate 'line', 406
  # rx pass
    rx866_cur."!cursor_pass"(rx866_pos, "value")
    rx866_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx866_pos)
    .return (rx866_cur)
  rx866_fail:
.annotate 'line', 4
    (rx866_rep, rx866_pos, $I10, $P10) = rx866_cur."!mark_fail"(0)
    lt rx866_pos, -1, rx866_done
    eq rx866_pos, -1, rx866_fail
    jump $I10
  rx866_done:
    rx866_cur."!cursor_fail"()
    rx866_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx866_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("199_1277356913.9538") :method
.annotate 'line', 4
    $P868 = self."!PREFIX__!subrule"("number", "")
    $P869 = self."!PREFIX__!subrule"("quote", "")
    new $P870, "ResizablePMCArray"
    push $P870, $P868
    push $P870, $P869
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("200_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx874_tgt
    .local int rx874_pos
    .local int rx874_off
    .local int rx874_eos
    .local int rx874_rep
    .local pmc rx874_cur
    (rx874_cur, rx874_pos, rx874_tgt) = self."!cursor_start"()
    rx874_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx874_cur
    .local pmc match
    .lex "$/", match
    length rx874_eos, rx874_tgt
    gt rx874_pos, rx874_eos, rx874_done
    set rx874_off, 0
    lt rx874_pos, 2, rx874_start
    sub rx874_off, rx874_pos, 1
    substr rx874_tgt, rx874_tgt, rx874_off
  rx874_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan877_done
    goto rxscan877_scan
  rxscan877_loop:
    ($P10) = rx874_cur."from"()
    inc $P10
    set rx874_pos, $P10
    ge rx874_pos, rx874_eos, rxscan877_done
  rxscan877_scan:
    set_addr $I10, rxscan877_loop
    rx874_cur."!mark_push"(0, rx874_pos, $I10)
  rxscan877_done:
.annotate 'line', 412
  # rx subcapture "sign"
    set_addr $I10, rxcap_880_fail
    rx874_cur."!mark_push"(0, rx874_pos, $I10)
  # rx rxquantr878 ** 0..1
    set_addr $I879, rxquantr878_done
    rx874_cur."!mark_push"(0, rx874_pos, $I879)
  rxquantr878_loop:
  # rx enumcharlist negate=0 
    ge rx874_pos, rx874_eos, rx874_fail
    sub $I10, rx874_pos, rx874_off
    substr $S10, rx874_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx874_fail
    inc rx874_pos
    (rx874_rep) = rx874_cur."!mark_commit"($I879)
  rxquantr878_done:
    set_addr $I10, rxcap_880_fail
    ($I12, $I11) = rx874_cur."!mark_peek"($I10)
    rx874_cur."!cursor_pos"($I11)
    ($P10) = rx874_cur."!cursor_start"()
    $P10."!cursor_pass"(rx874_pos, "")
    rx874_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_880_done
  rxcap_880_fail:
    goto rx874_fail
  rxcap_880_done:
  alt881_0:
.annotate 'line', 413
    set_addr $I10, alt881_1
    rx874_cur."!mark_push"(0, rx874_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx874_cur."!cursor_pos"(rx874_pos)
    $P10 = rx874_cur."dec_number"()
    unless $P10, rx874_fail
    rx874_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx874_pos = $P10."pos"()
    goto alt881_end
  alt881_1:
  # rx subrule "integer" subtype=capture negate=
    rx874_cur."!cursor_pos"(rx874_pos)
    $P10 = rx874_cur."integer"()
    unless $P10, rx874_fail
    rx874_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx874_pos = $P10."pos"()
  alt881_end:
.annotate 'line', 411
  # rx pass
    rx874_cur."!cursor_pass"(rx874_pos, "number")
    rx874_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx874_pos)
    .return (rx874_cur)
  rx874_fail:
.annotate 'line', 4
    (rx874_rep, rx874_pos, $I10, $P10) = rx874_cur."!mark_fail"(0)
    lt rx874_pos, -1, rx874_done
    eq rx874_pos, -1, rx874_fail
    jump $I10
  rx874_done:
    rx874_cur."!cursor_fail"()
    rx874_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx874_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("201_1277356913.9538") :method
.annotate 'line', 4
    new $P876, "ResizablePMCArray"
    push $P876, ""
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("202_1277356913.9538") :method
.annotate 'line', 416
    $P883 = self."!protoregex"("quote")
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("203_1277356913.9538") :method
.annotate 'line', 416
    $P885 = self."!PREFIX__!protoregex"("quote")
    .return ($P885)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("204_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx887_tgt
    .local int rx887_pos
    .local int rx887_off
    .local int rx887_eos
    .local int rx887_rep
    .local pmc rx887_cur
    (rx887_cur, rx887_pos, rx887_tgt) = self."!cursor_start"()
    rx887_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx887_cur
    .local pmc match
    .lex "$/", match
    length rx887_eos, rx887_tgt
    gt rx887_pos, rx887_eos, rx887_done
    set rx887_off, 0
    lt rx887_pos, 2, rx887_start
    sub rx887_off, rx887_pos, 1
    substr rx887_tgt, rx887_tgt, rx887_off
  rx887_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan890_done
    goto rxscan890_scan
  rxscan890_loop:
    ($P10) = rx887_cur."from"()
    inc $P10
    set rx887_pos, $P10
    ge rx887_pos, rx887_eos, rxscan890_done
  rxscan890_scan:
    set_addr $I10, rxscan890_loop
    rx887_cur."!mark_push"(0, rx887_pos, $I10)
  rxscan890_done:
.annotate 'line', 417
  # rx enumcharlist negate=0 zerowidth
    ge rx887_pos, rx887_eos, rx887_fail
    sub $I10, rx887_pos, rx887_off
    substr $S10, rx887_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx887_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx887_cur."!cursor_pos"(rx887_pos)
    $P10 = rx887_cur."quote_EXPR"(":q")
    unless $P10, rx887_fail
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx887_pos = $P10."pos"()
  # rx pass
    rx887_cur."!cursor_pass"(rx887_pos, "quote:sym<apos>")
    rx887_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx887_pos)
    .return (rx887_cur)
  rx887_fail:
.annotate 'line', 4
    (rx887_rep, rx887_pos, $I10, $P10) = rx887_cur."!mark_fail"(0)
    lt rx887_pos, -1, rx887_done
    eq rx887_pos, -1, rx887_fail
    jump $I10
  rx887_done:
    rx887_cur."!cursor_fail"()
    rx887_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx887_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("205_1277356913.9538") :method
.annotate 'line', 4
    new $P889, "ResizablePMCArray"
    push $P889, "'"
    .return ($P889)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("206_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx892_tgt
    .local int rx892_pos
    .local int rx892_off
    .local int rx892_eos
    .local int rx892_rep
    .local pmc rx892_cur
    (rx892_cur, rx892_pos, rx892_tgt) = self."!cursor_start"()
    rx892_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
.annotate 'line', 418
  # rx enumcharlist negate=0 zerowidth
    ge rx892_pos, rx892_eos, rx892_fail
    sub $I10, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx892_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."quote_EXPR"(":qq")
    unless $P10, rx892_fail
    rx892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx892_pos = $P10."pos"()
  # rx pass
    rx892_cur."!cursor_pass"(rx892_pos, "quote:sym<dblq>")
    rx892_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx892_pos)
    .return (rx892_cur)
  rx892_fail:
.annotate 'line', 4
    (rx892_rep, rx892_pos, $I10, $P10) = rx892_cur."!mark_fail"(0)
    lt rx892_pos, -1, rx892_done
    eq rx892_pos, -1, rx892_fail
    jump $I10
  rx892_done:
    rx892_cur."!cursor_fail"()
    rx892_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx892_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("207_1277356913.9538") :method
.annotate 'line', 4
    new $P894, "ResizablePMCArray"
    push $P894, "\""
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("208_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx897_tgt
    .local int rx897_pos
    .local int rx897_off
    .local int rx897_eos
    .local int rx897_rep
    .local pmc rx897_cur
    (rx897_cur, rx897_pos, rx897_tgt) = self."!cursor_start"()
    rx897_cur."!cursor_debug"("START ", "quote:sym<q>")
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
.annotate 'line', 419
  # rx literal  "q"
    add $I11, rx897_pos, 1
    gt $I11, rx897_eos, rx897_fail
    sub $I11, rx897_pos, rx897_off
    substr $S10, rx897_tgt, $I11, 1
    ne $S10, "q", rx897_fail
    add rx897_pos, 1
  # rxanchor rwb
    le rx897_pos, 0, rx897_fail
    sub $I10, rx897_pos, rx897_off
    is_cclass $I11, 8192, rx897_tgt, $I10
    if $I11, rx897_fail
    dec $I10
    is_cclass $I11, 8192, rx897_tgt, $I10
    unless $I11, rx897_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx897_pos, rx897_eos, rx897_fail
    sub $I10, rx897_pos, rx897_off
    substr $S10, rx897_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx897_fail
  # rx subrule "ws" subtype=method negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."ws"()
    unless $P10, rx897_fail
    rx897_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."quote_EXPR"(":q")
    unless $P10, rx897_fail
    rx897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx897_pos = $P10."pos"()
  # rx pass
    rx897_cur."!cursor_pass"(rx897_pos, "quote:sym<q>")
    rx897_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx897_pos)
    .return (rx897_cur)
  rx897_fail:
.annotate 'line', 4
    (rx897_rep, rx897_pos, $I10, $P10) = rx897_cur."!mark_fail"(0)
    lt rx897_pos, -1, rx897_done
    eq rx897_pos, -1, rx897_fail
    jump $I10
  rx897_done:
    rx897_cur."!cursor_fail"()
    rx897_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("209_1277356913.9538") :method
.annotate 'line', 4
    $P899 = self."!PREFIX__!subrule"("ws", "q")
    new $P900, "ResizablePMCArray"
    push $P900, $P899
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("210_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    (rx903_cur, rx903_pos, rx903_tgt) = self."!cursor_start"()
    rx903_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan907_done
    goto rxscan907_scan
  rxscan907_loop:
    ($P10) = rx903_cur."from"()
    inc $P10
    set rx903_pos, $P10
    ge rx903_pos, rx903_eos, rxscan907_done
  rxscan907_scan:
    set_addr $I10, rxscan907_loop
    rx903_cur."!mark_push"(0, rx903_pos, $I10)
  rxscan907_done:
.annotate 'line', 420
  # rx literal  "qq"
    add $I11, rx903_pos, 2
    gt $I11, rx903_eos, rx903_fail
    sub $I11, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I11, 2
    ne $S10, "qq", rx903_fail
    add rx903_pos, 2
  # rxanchor rwb
    le rx903_pos, 0, rx903_fail
    sub $I10, rx903_pos, rx903_off
    is_cclass $I11, 8192, rx903_tgt, $I10
    if $I11, rx903_fail
    dec $I10
    is_cclass $I11, 8192, rx903_tgt, $I10
    unless $I11, rx903_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx903_pos, rx903_eos, rx903_fail
    sub $I10, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx903_fail
  # rx subrule "ws" subtype=method negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."ws"()
    unless $P10, rx903_fail
    rx903_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."quote_EXPR"(":qq")
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx903_pos = $P10."pos"()
  # rx pass
    rx903_cur."!cursor_pass"(rx903_pos, "quote:sym<qq>")
    rx903_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx903_pos)
    .return (rx903_cur)
  rx903_fail:
.annotate 'line', 4
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    rx903_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("211_1277356913.9538") :method
.annotate 'line', 4
    $P905 = self."!PREFIX__!subrule"("ws", "qq")
    new $P906, "ResizablePMCArray"
    push $P906, $P905
    .return ($P906)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("212_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx909_tgt
    .local int rx909_pos
    .local int rx909_off
    .local int rx909_eos
    .local int rx909_rep
    .local pmc rx909_cur
    (rx909_cur, rx909_pos, rx909_tgt) = self."!cursor_start"()
    rx909_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx909_cur
    .local pmc match
    .lex "$/", match
    length rx909_eos, rx909_tgt
    gt rx909_pos, rx909_eos, rx909_done
    set rx909_off, 0
    lt rx909_pos, 2, rx909_start
    sub rx909_off, rx909_pos, 1
    substr rx909_tgt, rx909_tgt, rx909_off
  rx909_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan913_done
    goto rxscan913_scan
  rxscan913_loop:
    ($P10) = rx909_cur."from"()
    inc $P10
    set rx909_pos, $P10
    ge rx909_pos, rx909_eos, rxscan913_done
  rxscan913_scan:
    set_addr $I10, rxscan913_loop
    rx909_cur."!mark_push"(0, rx909_pos, $I10)
  rxscan913_done:
.annotate 'line', 421
  # rx literal  "Q"
    add $I11, rx909_pos, 1
    gt $I11, rx909_eos, rx909_fail
    sub $I11, rx909_pos, rx909_off
    substr $S10, rx909_tgt, $I11, 1
    ne $S10, "Q", rx909_fail
    add rx909_pos, 1
  # rxanchor rwb
    le rx909_pos, 0, rx909_fail
    sub $I10, rx909_pos, rx909_off
    is_cclass $I11, 8192, rx909_tgt, $I10
    if $I11, rx909_fail
    dec $I10
    is_cclass $I11, 8192, rx909_tgt, $I10
    unless $I11, rx909_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx909_pos, rx909_eos, rx909_fail
    sub $I10, rx909_pos, rx909_off
    substr $S10, rx909_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx909_fail
  # rx subrule "ws" subtype=method negate=
    rx909_cur."!cursor_pos"(rx909_pos)
    $P10 = rx909_cur."ws"()
    unless $P10, rx909_fail
    rx909_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx909_cur."!cursor_pos"(rx909_pos)
    $P10 = rx909_cur."quote_EXPR"()
    unless $P10, rx909_fail
    rx909_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx909_pos = $P10."pos"()
  # rx pass
    rx909_cur."!cursor_pass"(rx909_pos, "quote:sym<Q>")
    rx909_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx909_pos)
    .return (rx909_cur)
  rx909_fail:
.annotate 'line', 4
    (rx909_rep, rx909_pos, $I10, $P10) = rx909_cur."!mark_fail"(0)
    lt rx909_pos, -1, rx909_done
    eq rx909_pos, -1, rx909_fail
    jump $I10
  rx909_done:
    rx909_cur."!cursor_fail"()
    rx909_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx909_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("213_1277356913.9538") :method
.annotate 'line', 4
    $P911 = self."!PREFIX__!subrule"("ws", "Q")
    new $P912, "ResizablePMCArray"
    push $P912, $P911
    .return ($P912)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("214_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx915_tgt
    .local int rx915_pos
    .local int rx915_off
    .local int rx915_eos
    .local int rx915_rep
    .local pmc rx915_cur
    (rx915_cur, rx915_pos, rx915_tgt) = self."!cursor_start"()
    rx915_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
    ne $I10, -1, rxscan919_done
    goto rxscan919_scan
  rxscan919_loop:
    ($P10) = rx915_cur."from"()
    inc $P10
    set rx915_pos, $P10
    ge rx915_pos, rx915_eos, rxscan919_done
  rxscan919_scan:
    set_addr $I10, rxscan919_loop
    rx915_cur."!mark_push"(0, rx915_pos, $I10)
  rxscan919_done:
.annotate 'line', 422
  # rx literal  "Q:PIR"
    add $I11, rx915_pos, 5
    gt $I11, rx915_eos, rx915_fail
    sub $I11, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I11, 5
    ne $S10, "Q:PIR", rx915_fail
    add rx915_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."ws"()
    unless $P10, rx915_fail
    rx915_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."quote_EXPR"()
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx915_pos = $P10."pos"()
  # rx pass
    rx915_cur."!cursor_pass"(rx915_pos, "quote:sym<Q:PIR>")
    rx915_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx915_pos)
    .return (rx915_cur)
  rx915_fail:
.annotate 'line', 4
    (rx915_rep, rx915_pos, $I10, $P10) = rx915_cur."!mark_fail"(0)
    lt rx915_pos, -1, rx915_done
    eq rx915_pos, -1, rx915_fail
    jump $I10
  rx915_done:
    rx915_cur."!cursor_fail"()
    rx915_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx915_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("215_1277356913.9538") :method
.annotate 'line', 4
    $P917 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P918, "ResizablePMCArray"
    push $P918, $P917
    .return ($P918)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("216_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx921_tgt
    .local int rx921_pos
    .local int rx921_off
    .local int rx921_eos
    .local int rx921_rep
    .local pmc rx921_cur
    (rx921_cur, rx921_pos, rx921_tgt) = self."!cursor_start"()
    rx921_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx921_cur
    .local pmc match
    .lex "$/", match
    length rx921_eos, rx921_tgt
    gt rx921_pos, rx921_eos, rx921_done
    set rx921_off, 0
    lt rx921_pos, 2, rx921_start
    sub rx921_off, rx921_pos, 1
    substr rx921_tgt, rx921_tgt, rx921_off
  rx921_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan925_done
    goto rxscan925_scan
  rxscan925_loop:
    ($P10) = rx921_cur."from"()
    inc $P10
    set rx921_pos, $P10
    ge rx921_pos, rx921_eos, rxscan925_done
  rxscan925_scan:
    set_addr $I10, rxscan925_loop
    rx921_cur."!mark_push"(0, rx921_pos, $I10)
  rxscan925_done:
.annotate 'line', 424
  # rx literal  "/"
    add $I11, rx921_pos, 1
    gt $I11, rx921_eos, rx921_fail
    sub $I11, rx921_pos, rx921_off
    substr $S10, rx921_tgt, $I11, 1
    ne $S10, "/", rx921_fail
    add rx921_pos, 1
.annotate 'line', 425
  # rx subrule "newpad" subtype=method negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."newpad"()
    unless $P10, rx921_fail
    rx921_pos = $P10."pos"()
.annotate 'line', 426
  # rx reduce name="quote:sym</ />" key="open"
    rx921_cur."!cursor_pos"(rx921_pos)
    rx921_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 427
  # rx subrule "LANG" subtype=capture negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."LANG"("Regex", "nibbler")
    unless $P10, rx921_fail
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx921_pos = $P10."pos"()
.annotate 'line', 428
  # rx literal  "/"
    add $I11, rx921_pos, 1
    gt $I11, rx921_eos, rx921_fail
    sub $I11, rx921_pos, rx921_off
    substr $S10, rx921_tgt, $I11, 1
    ne $S10, "/", rx921_fail
    add rx921_pos, 1
.annotate 'line', 423
  # rx pass
    rx921_cur."!cursor_pass"(rx921_pos, "quote:sym</ />")
    rx921_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx921_pos)
    .return (rx921_cur)
  rx921_fail:
.annotate 'line', 4
    (rx921_rep, rx921_pos, $I10, $P10) = rx921_cur."!mark_fail"(0)
    lt rx921_pos, -1, rx921_done
    eq rx921_pos, -1, rx921_fail
    jump $I10
  rx921_done:
    rx921_cur."!cursor_fail"()
    rx921_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx921_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("217_1277356913.9538") :method
.annotate 'line', 4
    $P923 = self."!PREFIX__!subrule"("newpad", "/")
    new $P924, "ResizablePMCArray"
    push $P924, $P923
    .return ($P924)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("218_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx927_cur
    .local pmc match
    .lex "$/", match
    length rx927_eos, rx927_tgt
    gt rx927_pos, rx927_eos, rx927_done
    set rx927_off, 0
    lt rx927_pos, 2, rx927_start
    sub rx927_off, rx927_pos, 1
    substr rx927_tgt, rx927_tgt, rx927_off
  rx927_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan930_done
    goto rxscan930_scan
  rxscan930_loop:
    ($P10) = rx927_cur."from"()
    inc $P10
    set rx927_pos, $P10
    ge rx927_pos, rx927_eos, rxscan930_done
  rxscan930_scan:
    set_addr $I10, rxscan930_loop
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  rxscan930_done:
.annotate 'line', 431
  # rx enumcharlist negate=0 zerowidth
    ge rx927_pos, rx927_eos, rx927_fail
    sub $I10, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx927_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."quotemod_check"("s")
    unless $P10, rx927_fail
  # rx subrule "variable" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."variable"()
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx927_pos = $P10."pos"()
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "quote_escape:sym<$>")
    rx927_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate 'line', 4
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("219_1277356913.9538") :method
.annotate 'line', 4
    new $P929, "ResizablePMCArray"
    push $P929, "$"
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("220_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx932_tgt
    .local int rx932_pos
    .local int rx932_off
    .local int rx932_eos
    .local int rx932_rep
    .local pmc rx932_cur
    (rx932_cur, rx932_pos, rx932_tgt) = self."!cursor_start"()
    rx932_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate 'line', 432
  # rx enumcharlist negate=0 zerowidth
    ge rx932_pos, rx932_eos, rx932_fail
    sub $I10, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx932_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."quotemod_check"("c")
    unless $P10, rx932_fail
  # rx subrule "block" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."block"()
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx932_pos = $P10."pos"()
  # rx pass
    rx932_cur."!cursor_pass"(rx932_pos, "quote_escape:sym<{ }>")
    rx932_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx932_pos)
    .return (rx932_cur)
  rx932_fail:
.annotate 'line', 4
    (rx932_rep, rx932_pos, $I10, $P10) = rx932_cur."!mark_fail"(0)
    lt rx932_pos, -1, rx932_done
    eq rx932_pos, -1, rx932_fail
    jump $I10
  rx932_done:
    rx932_cur."!cursor_fail"()
    rx932_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx932_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("221_1277356913.9538") :method
.annotate 'line', 4
    new $P934, "ResizablePMCArray"
    push $P934, "{"
    .return ($P934)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("222_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx937_tgt
    .local int rx937_pos
    .local int rx937_off
    .local int rx937_eos
    .local int rx937_rep
    .local pmc rx937_cur
    (rx937_cur, rx937_pos, rx937_tgt) = self."!cursor_start"()
    rx937_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
.annotate 'line', 433
  # rx literal  "\\e"
    add $I11, rx937_pos, 2
    gt $I11, rx937_eos, rx937_fail
    sub $I11, rx937_pos, rx937_off
    substr $S10, rx937_tgt, $I11, 2
    ne $S10, "\\e", rx937_fail
    add rx937_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."quotemod_check"("b")
    unless $P10, rx937_fail
  # rx pass
    rx937_cur."!cursor_pass"(rx937_pos, "quote_escape:sym<esc>")
    rx937_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx937_pos)
    .return (rx937_cur)
  rx937_fail:
.annotate 'line', 4
    (rx937_rep, rx937_pos, $I10, $P10) = rx937_cur."!mark_fail"(0)
    lt rx937_pos, -1, rx937_done
    eq rx937_pos, -1, rx937_fail
    jump $I10
  rx937_done:
    rx937_cur."!cursor_fail"()
    rx937_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx937_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("223_1277356913.9538") :method
.annotate 'line', 4
    new $P939, "ResizablePMCArray"
    push $P939, "\\e"
    .return ($P939)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("224_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx942_tgt
    .local int rx942_pos
    .local int rx942_off
    .local int rx942_eos
    .local int rx942_rep
    .local pmc rx942_cur
    (rx942_cur, rx942_pos, rx942_tgt) = self."!cursor_start"()
    rx942_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx942_cur."!cursor_caparray"("EXPR")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan946_done
    goto rxscan946_scan
  rxscan946_loop:
    ($P10) = rx942_cur."from"()
    inc $P10
    set rx942_pos, $P10
    ge rx942_pos, rx942_eos, rxscan946_done
  rxscan946_scan:
    set_addr $I10, rxscan946_loop
    rx942_cur."!mark_push"(0, rx942_pos, $I10)
  rxscan946_done:
.annotate 'line', 435
  # rx literal  "("
    add $I11, rx942_pos, 1
    gt $I11, rx942_eos, rx942_fail
    sub $I11, rx942_pos, rx942_off
    substr $S10, rx942_tgt, $I11, 1
    ne $S10, "(", rx942_fail
    add rx942_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."ws"()
    unless $P10, rx942_fail
    rx942_pos = $P10."pos"()
  # rx rxquantr947 ** 0..1
    set_addr $I948, rxquantr947_done
    rx942_cur."!mark_push"(0, rx942_pos, $I948)
  rxquantr947_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."EXPR"()
    unless $P10, rx942_fail
    rx942_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx942_pos = $P10."pos"()
    (rx942_rep) = rx942_cur."!mark_commit"($I948)
  rxquantr947_done:
  # rx literal  ")"
    add $I11, rx942_pos, 1
    gt $I11, rx942_eos, rx942_fail
    sub $I11, rx942_pos, rx942_off
    substr $S10, rx942_tgt, $I11, 1
    ne $S10, ")", rx942_fail
    add rx942_pos, 1
  # rx pass
    rx942_cur."!cursor_pass"(rx942_pos, "circumfix:sym<( )>")
    rx942_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx942_pos)
    .return (rx942_cur)
  rx942_fail:
.annotate 'line', 4
    (rx942_rep, rx942_pos, $I10, $P10) = rx942_cur."!mark_fail"(0)
    lt rx942_pos, -1, rx942_done
    eq rx942_pos, -1, rx942_fail
    jump $I10
  rx942_done:
    rx942_cur."!cursor_fail"()
    rx942_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx942_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("225_1277356913.9538") :method
.annotate 'line', 4
    $P944 = self."!PREFIX__!subrule"("ws", "(")
    new $P945, "ResizablePMCArray"
    push $P945, $P944
    .return ($P945)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("226_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx950_tgt
    .local int rx950_pos
    .local int rx950_off
    .local int rx950_eos
    .local int rx950_rep
    .local pmc rx950_cur
    (rx950_cur, rx950_pos, rx950_tgt) = self."!cursor_start"()
    rx950_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx950_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx950_cur
    .local pmc match
    .lex "$/", match
    length rx950_eos, rx950_tgt
    gt rx950_pos, rx950_eos, rx950_done
    set rx950_off, 0
    lt rx950_pos, 2, rx950_start
    sub rx950_off, rx950_pos, 1
    substr rx950_tgt, rx950_tgt, rx950_off
  rx950_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan954_done
    goto rxscan954_scan
  rxscan954_loop:
    ($P10) = rx950_cur."from"()
    inc $P10
    set rx950_pos, $P10
    ge rx950_pos, rx950_eos, rxscan954_done
  rxscan954_scan:
    set_addr $I10, rxscan954_loop
    rx950_cur."!mark_push"(0, rx950_pos, $I10)
  rxscan954_done:
.annotate 'line', 436
  # rx literal  "["
    add $I11, rx950_pos, 1
    gt $I11, rx950_eos, rx950_fail
    sub $I11, rx950_pos, rx950_off
    substr $S10, rx950_tgt, $I11, 1
    ne $S10, "[", rx950_fail
    add rx950_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx950_cur."!cursor_pos"(rx950_pos)
    $P10 = rx950_cur."ws"()
    unless $P10, rx950_fail
    rx950_pos = $P10."pos"()
  # rx rxquantr955 ** 0..1
    set_addr $I956, rxquantr955_done
    rx950_cur."!mark_push"(0, rx950_pos, $I956)
  rxquantr955_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx950_cur."!cursor_pos"(rx950_pos)
    $P10 = rx950_cur."EXPR"()
    unless $P10, rx950_fail
    rx950_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx950_pos = $P10."pos"()
    (rx950_rep) = rx950_cur."!mark_commit"($I956)
  rxquantr955_done:
  # rx literal  "]"
    add $I11, rx950_pos, 1
    gt $I11, rx950_eos, rx950_fail
    sub $I11, rx950_pos, rx950_off
    substr $S10, rx950_tgt, $I11, 1
    ne $S10, "]", rx950_fail
    add rx950_pos, 1
  # rx pass
    rx950_cur."!cursor_pass"(rx950_pos, "circumfix:sym<[ ]>")
    rx950_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx950_pos)
    .return (rx950_cur)
  rx950_fail:
.annotate 'line', 4
    (rx950_rep, rx950_pos, $I10, $P10) = rx950_cur."!mark_fail"(0)
    lt rx950_pos, -1, rx950_done
    eq rx950_pos, -1, rx950_fail
    jump $I10
  rx950_done:
    rx950_cur."!cursor_fail"()
    rx950_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx950_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("227_1277356913.9538") :method
.annotate 'line', 4
    $P952 = self."!PREFIX__!subrule"("ws", "[")
    new $P953, "ResizablePMCArray"
    push $P953, $P952
    .return ($P953)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("228_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    (rx958_cur, rx958_pos, rx958_tgt) = self."!cursor_start"()
    rx958_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan961_done
    goto rxscan961_scan
  rxscan961_loop:
    ($P10) = rx958_cur."from"()
    inc $P10
    set rx958_pos, $P10
    ge rx958_pos, rx958_eos, rxscan961_done
  rxscan961_scan:
    set_addr $I10, rxscan961_loop
    rx958_cur."!mark_push"(0, rx958_pos, $I10)
  rxscan961_done:
.annotate 'line', 437
  # rx enumcharlist negate=0 zerowidth
    ge rx958_pos, rx958_eos, rx958_fail
    sub $I10, rx958_pos, rx958_off
    substr $S10, rx958_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx958_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx958_pos = $P10."pos"()
  # rx pass
    rx958_cur."!cursor_pass"(rx958_pos, "circumfix:sym<ang>")
    rx958_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx958_pos)
    .return (rx958_cur)
  rx958_fail:
.annotate 'line', 4
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    rx958_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("229_1277356913.9538") :method
.annotate 'line', 4
    new $P960, "ResizablePMCArray"
    push $P960, "<"
    .return ($P960)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("230_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx963_tgt
    .local int rx963_pos
    .local int rx963_off
    .local int rx963_eos
    .local int rx963_rep
    .local pmc rx963_cur
    (rx963_cur, rx963_pos, rx963_tgt) = self."!cursor_start"()
    rx963_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
.annotate 'line', 438
  # rx enumcharlist negate=0 zerowidth
    ge rx963_pos, rx963_eos, rx963_fail
    sub $I10, rx963_pos, rx963_off
    substr $S10, rx963_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx963_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx963_cur."!cursor_pos"(rx963_pos)
    $P10 = rx963_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx963_fail
    rx963_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx963_pos = $P10."pos"()
  # rx pass
    rx963_cur."!cursor_pass"(rx963_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx963_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx963_pos)
    .return (rx963_cur)
  rx963_fail:
.annotate 'line', 4
    (rx963_rep, rx963_pos, $I10, $P10) = rx963_cur."!mark_fail"(0)
    lt rx963_pos, -1, rx963_done
    eq rx963_pos, -1, rx963_fail
    jump $I10
  rx963_done:
    rx963_cur."!cursor_fail"()
    rx963_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx963_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("231_1277356913.9538") :method
.annotate 'line', 4
    new $P965, "ResizablePMCArray"
    push $P965, unicode:"\x{ab}"
    .return ($P965)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("232_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
.annotate 'line', 439
  # rx enumcharlist negate=0 zerowidth
    ge rx968_pos, rx968_eos, rx968_fail
    sub $I10, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx968_fail
  # rx subrule "pblock" subtype=capture negate=
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."pblock"()
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "circumfix:sym<{ }>")
    rx968_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate 'line', 4
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("233_1277356913.9538") :method
.annotate 'line', 4
    new $P970, "ResizablePMCArray"
    push $P970, "{"
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("234_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx973_tgt
    .local int rx973_pos
    .local int rx973_off
    .local int rx973_eos
    .local int rx973_rep
    .local pmc rx973_cur
    (rx973_cur, rx973_pos, rx973_tgt) = self."!cursor_start"()
    rx973_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan977_done
    goto rxscan977_scan
  rxscan977_loop:
    ($P10) = rx973_cur."from"()
    inc $P10
    set rx973_pos, $P10
    ge rx973_pos, rx973_eos, rxscan977_done
  rxscan977_scan:
    set_addr $I10, rxscan977_loop
    rx973_cur."!mark_push"(0, rx973_pos, $I10)
  rxscan977_done:
.annotate 'line', 440
  # rx subrule "sigil" subtype=capture negate=
    rx973_cur."!cursor_pos"(rx973_pos)
    $P10 = rx973_cur."sigil"()
    unless $P10, rx973_fail
    rx973_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx973_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx973_pos, 1
    gt $I11, rx973_eos, rx973_fail
    sub $I11, rx973_pos, rx973_off
    substr $S10, rx973_tgt, $I11, 1
    ne $S10, "(", rx973_fail
    add rx973_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx973_cur."!cursor_pos"(rx973_pos)
    $P10 = rx973_cur."semilist"()
    unless $P10, rx973_fail
    rx973_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx973_pos = $P10."pos"()
  alt978_0:
    set_addr $I10, alt978_1
    rx973_cur."!mark_push"(0, rx973_pos, $I10)
  # rx literal  ")"
    add $I11, rx973_pos, 1
    gt $I11, rx973_eos, rx973_fail
    sub $I11, rx973_pos, rx973_off
    substr $S10, rx973_tgt, $I11, 1
    ne $S10, ")", rx973_fail
    add rx973_pos, 1
    goto alt978_end
  alt978_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx973_cur."!cursor_pos"(rx973_pos)
    $P10 = rx973_cur."FAILGOAL"("')'")
    unless $P10, rx973_fail
    rx973_pos = $P10."pos"()
  alt978_end:
  # rx pass
    rx973_cur."!cursor_pass"(rx973_pos, "circumfix:sym<sigil>")
    rx973_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx973_pos)
    .return (rx973_cur)
  rx973_fail:
.annotate 'line', 4
    (rx973_rep, rx973_pos, $I10, $P10) = rx973_cur."!mark_fail"(0)
    lt rx973_pos, -1, rx973_done
    eq rx973_pos, -1, rx973_fail
    jump $I10
  rx973_done:
    rx973_cur."!cursor_fail"()
    rx973_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx973_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("235_1277356913.9538") :method
.annotate 'line', 4
    $P975 = self."!PREFIX__!subrule"("sigil", "")
    new $P976, "ResizablePMCArray"
    push $P976, $P975
    .return ($P976)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("236_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 4
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "semilist")
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
.annotate 'line', 442
  # rx subrule "ws" subtype=method negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."ws"()
    unless $P10, rx981_fail
    rx981_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."statement"()
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx981_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."ws"()
    unless $P10, rx981_fail
    rx981_pos = $P10."pos"()
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "semilist")
    rx981_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate 'line', 4
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("237_1277356913.9538") :method
.annotate 'line', 4
    $P983 = self."!PREFIX__!subrule"("ws", "")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("238_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx989_tgt
    .local int rx989_pos
    .local int rx989_off
    .local int rx989_eos
    .local int rx989_rep
    .local pmc rx989_cur
    (rx989_cur, rx989_pos, rx989_tgt) = self."!cursor_start"()
    rx989_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx989_cur
    .local pmc match
    .lex "$/", match
    length rx989_eos, rx989_tgt
    gt rx989_pos, rx989_eos, rx989_done
    set rx989_off, 0
    lt rx989_pos, 2, rx989_start
    sub rx989_off, rx989_pos, 1
    substr rx989_tgt, rx989_tgt, rx989_off
  rx989_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan992_done
    goto rxscan992_scan
  rxscan992_loop:
    ($P10) = rx989_cur."from"()
    inc $P10
    set rx989_pos, $P10
    ge rx989_pos, rx989_eos, rxscan992_done
  rxscan992_scan:
    set_addr $I10, rxscan992_loop
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  rxscan992_done:
.annotate 'line', 465
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."infixstopper"()
    if $P10, rx989_fail
  # rx subrule "infix" subtype=capture negate=
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."infix"()
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx989_pos = $P10."pos"()
  # rx pass
    rx989_cur."!cursor_pass"(rx989_pos, "infixish")
    rx989_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx989_pos)
    .return (rx989_cur)
  rx989_fail:
.annotate 'line', 446
    (rx989_rep, rx989_pos, $I10, $P10) = rx989_cur."!mark_fail"(0)
    lt rx989_pos, -1, rx989_done
    eq rx989_pos, -1, rx989_fail
    jump $I10
  rx989_done:
    rx989_cur."!cursor_fail"()
    rx989_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx989_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("239_1277356913.9538") :method
.annotate 'line', 446
    new $P991, "ResizablePMCArray"
    push $P991, ""
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("240_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx994_tgt
    .local int rx994_pos
    .local int rx994_off
    .local int rx994_eos
    .local int rx994_rep
    .local pmc rx994_cur
    (rx994_cur, rx994_pos, rx994_tgt) = self."!cursor_start"()
    rx994_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx994_cur
    .local pmc match
    .lex "$/", match
    length rx994_eos, rx994_tgt
    gt rx994_pos, rx994_eos, rx994_done
    set rx994_off, 0
    lt rx994_pos, 2, rx994_start
    sub rx994_off, rx994_pos, 1
    substr rx994_tgt, rx994_tgt, rx994_off
  rx994_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan997_done
    goto rxscan997_scan
  rxscan997_loop:
    ($P10) = rx994_cur."from"()
    inc $P10
    set rx994_pos, $P10
    ge rx994_pos, rx994_eos, rxscan997_done
  rxscan997_scan:
    set_addr $I10, rxscan997_loop
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  rxscan997_done:
.annotate 'line', 466
  # rx subrule "lambda" subtype=zerowidth negate=
    rx994_cur."!cursor_pos"(rx994_pos)
    $P10 = rx994_cur."lambda"()
    unless $P10, rx994_fail
  # rx pass
    rx994_cur."!cursor_pass"(rx994_pos, "infixstopper")
    rx994_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx994_pos)
    .return (rx994_cur)
  rx994_fail:
.annotate 'line', 446
    (rx994_rep, rx994_pos, $I10, $P10) = rx994_cur."!mark_fail"(0)
    lt rx994_pos, -1, rx994_done
    eq rx994_pos, -1, rx994_fail
    jump $I10
  rx994_done:
    rx994_cur."!cursor_fail"()
    rx994_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx994_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("241_1277356913.9538") :method
.annotate 'line', 446
    new $P996, "ResizablePMCArray"
    push $P996, ""
    .return ($P996)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("242_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx999_tgt
    .local int rx999_pos
    .local int rx999_off
    .local int rx999_eos
    .local int rx999_rep
    .local pmc rx999_cur
    (rx999_cur, rx999_pos, rx999_tgt) = self."!cursor_start"()
    rx999_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
.annotate 'line', 469
  # rx literal  "["
    add $I11, rx999_pos, 1
    gt $I11, rx999_eos, rx999_fail
    sub $I11, rx999_pos, rx999_off
    substr $S10, rx999_tgt, $I11, 1
    ne $S10, "[", rx999_fail
    add rx999_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."ws"()
    unless $P10, rx999_fail
    rx999_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."EXPR"()
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx999_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx999_pos, 1
    gt $I11, rx999_eos, rx999_fail
    sub $I11, rx999_pos, rx999_off
    substr $S10, rx999_tgt, $I11, 1
    ne $S10, "]", rx999_fail
    add rx999_pos, 1
.annotate 'line', 470
  # rx subrule "O" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."O"("%methodop")
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx999_pos = $P10."pos"()
.annotate 'line', 468
  # rx pass
    rx999_cur."!cursor_pass"(rx999_pos, "postcircumfix:sym<[ ]>")
    rx999_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx999_pos)
    .return (rx999_cur)
  rx999_fail:
.annotate 'line', 446
    (rx999_rep, rx999_pos, $I10, $P10) = rx999_cur."!mark_fail"(0)
    lt rx999_pos, -1, rx999_done
    eq rx999_pos, -1, rx999_fail
    jump $I10
  rx999_done:
    rx999_cur."!cursor_fail"()
    rx999_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx999_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("243_1277356913.9538") :method
.annotate 'line', 446
    $P1001 = self."!PREFIX__!subrule"("ws", "[")
    new $P1002, "ResizablePMCArray"
    push $P1002, $P1001
    .return ($P1002)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("244_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1005_tgt
    .local int rx1005_pos
    .local int rx1005_off
    .local int rx1005_eos
    .local int rx1005_rep
    .local pmc rx1005_cur
    (rx1005_cur, rx1005_pos, rx1005_tgt) = self."!cursor_start"()
    rx1005_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
.annotate 'line', 474
  # rx literal  "{"
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    substr $S10, rx1005_tgt, $I11, 1
    ne $S10, "{", rx1005_fail
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
  # rx literal  "}"
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    substr $S10, rx1005_tgt, $I11, 1
    ne $S10, "}", rx1005_fail
    add rx1005_pos, 1
.annotate 'line', 475
  # rx subrule "O" subtype=capture negate=
    rx1005_cur."!cursor_pos"(rx1005_pos)
    $P10 = rx1005_cur."O"("%methodop")
    unless $P10, rx1005_fail
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1005_pos = $P10."pos"()
.annotate 'line', 473
  # rx pass
    rx1005_cur."!cursor_pass"(rx1005_pos, "postcircumfix:sym<{ }>")
    rx1005_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx1005_pos)
    .return (rx1005_cur)
  rx1005_fail:
.annotate 'line', 446
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    rx1005_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx1005_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("245_1277356913.9538") :method
.annotate 'line', 446
    $P1007 = self."!PREFIX__!subrule"("ws", "{")
    new $P1008, "ResizablePMCArray"
    push $P1008, $P1007
    .return ($P1008)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("246_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1011_tgt
    .local int rx1011_pos
    .local int rx1011_off
    .local int rx1011_eos
    .local int rx1011_rep
    .local pmc rx1011_cur
    (rx1011_cur, rx1011_pos, rx1011_tgt) = self."!cursor_start"()
    rx1011_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1014_done
    goto rxscan1014_scan
  rxscan1014_loop:
    ($P10) = rx1011_cur."from"()
    inc $P10
    set rx1011_pos, $P10
    ge rx1011_pos, rx1011_eos, rxscan1014_done
  rxscan1014_scan:
    set_addr $I10, rxscan1014_loop
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxscan1014_done:
.annotate 'line', 479
  # rx enumcharlist negate=0 zerowidth
    ge rx1011_pos, rx1011_eos, rx1011_fail
    sub $I10, rx1011_pos, rx1011_off
    substr $S10, rx1011_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1011_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."quote_EXPR"(":q")
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1011_pos = $P10."pos"()
.annotate 'line', 480
  # rx subrule "O" subtype=capture negate=
    rx1011_cur."!cursor_pos"(rx1011_pos)
    $P10 = rx1011_cur."O"("%methodop")
    unless $P10, rx1011_fail
    rx1011_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1011_pos = $P10."pos"()
.annotate 'line', 478
  # rx pass
    rx1011_cur."!cursor_pass"(rx1011_pos, "postcircumfix:sym<ang>")
    rx1011_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx1011_pos)
    .return (rx1011_cur)
  rx1011_fail:
.annotate 'line', 446
    (rx1011_rep, rx1011_pos, $I10, $P10) = rx1011_cur."!mark_fail"(0)
    lt rx1011_pos, -1, rx1011_done
    eq rx1011_pos, -1, rx1011_fail
    jump $I10
  rx1011_done:
    rx1011_cur."!cursor_fail"()
    rx1011_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx1011_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("247_1277356913.9538") :method
.annotate 'line', 446
    new $P1013, "ResizablePMCArray"
    push $P1013, "<"
    .return ($P1013)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("248_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx1016_cur
    .local pmc match
    .lex "$/", match
    length rx1016_eos, rx1016_tgt
    gt rx1016_pos, rx1016_eos, rx1016_done
    set rx1016_off, 0
    lt rx1016_pos, 2, rx1016_start
    sub rx1016_off, rx1016_pos, 1
    substr rx1016_tgt, rx1016_tgt, rx1016_off
  rx1016_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1020_done
    goto rxscan1020_scan
  rxscan1020_loop:
    ($P10) = rx1016_cur."from"()
    inc $P10
    set rx1016_pos, $P10
    ge rx1016_pos, rx1016_eos, rxscan1020_done
  rxscan1020_scan:
    set_addr $I10, rxscan1020_loop
    rx1016_cur."!mark_push"(0, rx1016_pos, $I10)
  rxscan1020_done:
.annotate 'line', 484
  # rx literal  "("
    add $I11, rx1016_pos, 1
    gt $I11, rx1016_eos, rx1016_fail
    sub $I11, rx1016_pos, rx1016_off
    substr $S10, rx1016_tgt, $I11, 1
    ne $S10, "(", rx1016_fail
    add rx1016_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."ws"()
    unless $P10, rx1016_fail
    rx1016_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."arglist"()
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1016_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1016_pos, 1
    gt $I11, rx1016_eos, rx1016_fail
    sub $I11, rx1016_pos, rx1016_off
    substr $S10, rx1016_tgt, $I11, 1
    ne $S10, ")", rx1016_fail
    add rx1016_pos, 1
.annotate 'line', 485
  # rx subrule "O" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."O"("%methodop")
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1016_pos = $P10."pos"()
.annotate 'line', 483
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "postcircumfix:sym<( )>")
    rx1016_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate 'line', 446
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("249_1277356913.9538") :method
.annotate 'line', 446
    $P1018 = self."!PREFIX__!subrule"("ws", "(")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("250_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    (rx1022_cur, rx1022_pos, rx1022_tgt) = self."!cursor_start"()
    rx1022_cur."!cursor_debug"("START ", "postfix:sym<.>")
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
.annotate 'line', 488
  # rx subrule "dotty" subtype=capture negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."dotty"()
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1022_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1022_cur."!cursor_pos"(rx1022_pos)
    $P10 = rx1022_cur."O"("%methodop")
    unless $P10, rx1022_fail
    rx1022_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1022_pos = $P10."pos"()
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "postfix:sym<.>")
    rx1022_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx1022_pos)
    .return (rx1022_cur)
  rx1022_fail:
.annotate 'line', 446
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    rx1022_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx1022_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("251_1277356913.9538") :method
.annotate 'line', 446
    $P1024 = self."!PREFIX__!subrule"("dotty", "")
    new $P1025, "ResizablePMCArray"
    push $P1025, $P1024
    .return ($P1025)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("252_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1028_tgt
    .local int rx1028_pos
    .local int rx1028_off
    .local int rx1028_eos
    .local int rx1028_rep
    .local pmc rx1028_cur
    (rx1028_cur, rx1028_pos, rx1028_tgt) = self."!cursor_start"()
    rx1028_cur."!cursor_debug"("START ", "prefix:sym<++>")
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
.annotate 'line', 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1033_fail
    rx1028_cur."!mark_push"(0, rx1028_pos, $I10)
  # rx literal  "++"
    add $I11, rx1028_pos, 2
    gt $I11, rx1028_eos, rx1028_fail
    sub $I11, rx1028_pos, rx1028_off
    substr $S10, rx1028_tgt, $I11, 2
    ne $S10, "++", rx1028_fail
    add rx1028_pos, 2
    set_addr $I10, rxcap_1033_fail
    ($I12, $I11) = rx1028_cur."!mark_peek"($I10)
    rx1028_cur."!cursor_pos"($I11)
    ($P10) = rx1028_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1028_pos, "")
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1033_done
  rxcap_1033_fail:
    goto rx1028_fail
  rxcap_1033_done:
  # rx subrule "O" subtype=capture negate=
    rx1028_cur."!cursor_pos"(rx1028_pos)
    $P10 = rx1028_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1028_fail
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1028_pos = $P10."pos"()
  # rx pass
    rx1028_cur."!cursor_pass"(rx1028_pos, "prefix:sym<++>")
    rx1028_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx1028_pos)
    .return (rx1028_cur)
  rx1028_fail:
.annotate 'line', 446
    (rx1028_rep, rx1028_pos, $I10, $P10) = rx1028_cur."!mark_fail"(0)
    lt rx1028_pos, -1, rx1028_done
    eq rx1028_pos, -1, rx1028_fail
    jump $I10
  rx1028_done:
    rx1028_cur."!cursor_fail"()
    rx1028_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx1028_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("253_1277356913.9538") :method
.annotate 'line', 446
    $P1030 = self."!PREFIX__!subrule"("O", "++")
    new $P1031, "ResizablePMCArray"
    push $P1031, $P1030
    .return ($P1031)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("254_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1035_tgt
    .local int rx1035_pos
    .local int rx1035_off
    .local int rx1035_eos
    .local int rx1035_rep
    .local pmc rx1035_cur
    (rx1035_cur, rx1035_pos, rx1035_tgt) = self."!cursor_start"()
    rx1035_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx1035_cur
    .local pmc match
    .lex "$/", match
    length rx1035_eos, rx1035_tgt
    gt rx1035_pos, rx1035_eos, rx1035_done
    set rx1035_off, 0
    lt rx1035_pos, 2, rx1035_start
    sub rx1035_off, rx1035_pos, 1
    substr rx1035_tgt, rx1035_tgt, rx1035_off
  rx1035_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1039_done
    goto rxscan1039_scan
  rxscan1039_loop:
    ($P10) = rx1035_cur."from"()
    inc $P10
    set rx1035_pos, $P10
    ge rx1035_pos, rx1035_eos, rxscan1039_done
  rxscan1039_scan:
    set_addr $I10, rxscan1039_loop
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  rxscan1039_done:
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1040_fail
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  # rx literal  "--"
    add $I11, rx1035_pos, 2
    gt $I11, rx1035_eos, rx1035_fail
    sub $I11, rx1035_pos, rx1035_off
    substr $S10, rx1035_tgt, $I11, 2
    ne $S10, "--", rx1035_fail
    add rx1035_pos, 2
    set_addr $I10, rxcap_1040_fail
    ($I12, $I11) = rx1035_cur."!mark_peek"($I10)
    rx1035_cur."!cursor_pos"($I11)
    ($P10) = rx1035_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1035_pos, "")
    rx1035_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1040_done
  rxcap_1040_fail:
    goto rx1035_fail
  rxcap_1040_done:
  # rx subrule "O" subtype=capture negate=
    rx1035_cur."!cursor_pos"(rx1035_pos)
    $P10 = rx1035_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1035_fail
    rx1035_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1035_pos = $P10."pos"()
  # rx pass
    rx1035_cur."!cursor_pass"(rx1035_pos, "prefix:sym<-->")
    rx1035_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx1035_pos)
    .return (rx1035_cur)
  rx1035_fail:
.annotate 'line', 446
    (rx1035_rep, rx1035_pos, $I10, $P10) = rx1035_cur."!mark_fail"(0)
    lt rx1035_pos, -1, rx1035_done
    eq rx1035_pos, -1, rx1035_fail
    jump $I10
  rx1035_done:
    rx1035_cur."!cursor_fail"()
    rx1035_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx1035_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("255_1277356913.9538") :method
.annotate 'line', 446
    $P1037 = self."!PREFIX__!subrule"("O", "--")
    new $P1038, "ResizablePMCArray"
    push $P1038, $P1037
    .return ($P1038)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("256_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1042_tgt
    .local int rx1042_pos
    .local int rx1042_off
    .local int rx1042_eos
    .local int rx1042_rep
    .local pmc rx1042_cur
    (rx1042_cur, rx1042_pos, rx1042_tgt) = self."!cursor_start"()
    rx1042_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx1042_cur
    .local pmc match
    .lex "$/", match
    length rx1042_eos, rx1042_tgt
    gt rx1042_pos, rx1042_eos, rx1042_done
    set rx1042_off, 0
    lt rx1042_pos, 2, rx1042_start
    sub rx1042_off, rx1042_pos, 1
    substr rx1042_tgt, rx1042_tgt, rx1042_off
  rx1042_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1046_done
    goto rxscan1046_scan
  rxscan1046_loop:
    ($P10) = rx1042_cur."from"()
    inc $P10
    set rx1042_pos, $P10
    ge rx1042_pos, rx1042_eos, rxscan1046_done
  rxscan1046_scan:
    set_addr $I10, rxscan1046_loop
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  rxscan1046_done:
.annotate 'line', 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1047_fail
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  # rx literal  "++"
    add $I11, rx1042_pos, 2
    gt $I11, rx1042_eos, rx1042_fail
    sub $I11, rx1042_pos, rx1042_off
    substr $S10, rx1042_tgt, $I11, 2
    ne $S10, "++", rx1042_fail
    add rx1042_pos, 2
    set_addr $I10, rxcap_1047_fail
    ($I12, $I11) = rx1042_cur."!mark_peek"($I10)
    rx1042_cur."!cursor_pos"($I11)
    ($P10) = rx1042_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1042_pos, "")
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1047_done
  rxcap_1047_fail:
    goto rx1042_fail
  rxcap_1047_done:
  # rx subrule "O" subtype=capture negate=
    rx1042_cur."!cursor_pos"(rx1042_pos)
    $P10 = rx1042_cur."O"("%autoincrement")
    unless $P10, rx1042_fail
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1042_pos = $P10."pos"()
  # rx pass
    rx1042_cur."!cursor_pass"(rx1042_pos, "postfix:sym<++>")
    rx1042_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx1042_pos)
    .return (rx1042_cur)
  rx1042_fail:
.annotate 'line', 446
    (rx1042_rep, rx1042_pos, $I10, $P10) = rx1042_cur."!mark_fail"(0)
    lt rx1042_pos, -1, rx1042_done
    eq rx1042_pos, -1, rx1042_fail
    jump $I10
  rx1042_done:
    rx1042_cur."!cursor_fail"()
    rx1042_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx1042_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("257_1277356913.9538") :method
.annotate 'line', 446
    $P1044 = self."!PREFIX__!subrule"("O", "++")
    new $P1045, "ResizablePMCArray"
    push $P1045, $P1044
    .return ($P1045)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("258_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1049_tgt
    .local int rx1049_pos
    .local int rx1049_off
    .local int rx1049_eos
    .local int rx1049_rep
    .local pmc rx1049_cur
    (rx1049_cur, rx1049_pos, rx1049_tgt) = self."!cursor_start"()
    rx1049_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx1049_cur
    .local pmc match
    .lex "$/", match
    length rx1049_eos, rx1049_tgt
    gt rx1049_pos, rx1049_eos, rx1049_done
    set rx1049_off, 0
    lt rx1049_pos, 2, rx1049_start
    sub rx1049_off, rx1049_pos, 1
    substr rx1049_tgt, rx1049_tgt, rx1049_off
  rx1049_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1053_done
    goto rxscan1053_scan
  rxscan1053_loop:
    ($P10) = rx1049_cur."from"()
    inc $P10
    set rx1049_pos, $P10
    ge rx1049_pos, rx1049_eos, rxscan1053_done
  rxscan1053_scan:
    set_addr $I10, rxscan1053_loop
    rx1049_cur."!mark_push"(0, rx1049_pos, $I10)
  rxscan1053_done:
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1054_fail
    rx1049_cur."!mark_push"(0, rx1049_pos, $I10)
  # rx literal  "--"
    add $I11, rx1049_pos, 2
    gt $I11, rx1049_eos, rx1049_fail
    sub $I11, rx1049_pos, rx1049_off
    substr $S10, rx1049_tgt, $I11, 2
    ne $S10, "--", rx1049_fail
    add rx1049_pos, 2
    set_addr $I10, rxcap_1054_fail
    ($I12, $I11) = rx1049_cur."!mark_peek"($I10)
    rx1049_cur."!cursor_pos"($I11)
    ($P10) = rx1049_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1049_pos, "")
    rx1049_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1054_done
  rxcap_1054_fail:
    goto rx1049_fail
  rxcap_1054_done:
  # rx subrule "O" subtype=capture negate=
    rx1049_cur."!cursor_pos"(rx1049_pos)
    $P10 = rx1049_cur."O"("%autoincrement")
    unless $P10, rx1049_fail
    rx1049_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1049_pos = $P10."pos"()
  # rx pass
    rx1049_cur."!cursor_pass"(rx1049_pos, "postfix:sym<-->")
    rx1049_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1049_pos)
    .return (rx1049_cur)
  rx1049_fail:
.annotate 'line', 446
    (rx1049_rep, rx1049_pos, $I10, $P10) = rx1049_cur."!mark_fail"(0)
    lt rx1049_pos, -1, rx1049_done
    eq rx1049_pos, -1, rx1049_fail
    jump $I10
  rx1049_done:
    rx1049_cur."!cursor_fail"()
    rx1049_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1049_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("259_1277356913.9538") :method
.annotate 'line', 446
    $P1051 = self."!PREFIX__!subrule"("O", "--")
    new $P1052, "ResizablePMCArray"
    push $P1052, $P1051
    .return ($P1052)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("260_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1056_tgt
    .local int rx1056_pos
    .local int rx1056_off
    .local int rx1056_eos
    .local int rx1056_rep
    .local pmc rx1056_cur
    (rx1056_cur, rx1056_pos, rx1056_tgt) = self."!cursor_start"()
    rx1056_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx1056_cur
    .local pmc match
    .lex "$/", match
    length rx1056_eos, rx1056_tgt
    gt rx1056_pos, rx1056_eos, rx1056_done
    set rx1056_off, 0
    lt rx1056_pos, 2, rx1056_start
    sub rx1056_off, rx1056_pos, 1
    substr rx1056_tgt, rx1056_tgt, rx1056_off
  rx1056_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1060_done
    goto rxscan1060_scan
  rxscan1060_loop:
    ($P10) = rx1056_cur."from"()
    inc $P10
    set rx1056_pos, $P10
    ge rx1056_pos, rx1056_eos, rxscan1060_done
  rxscan1060_scan:
    set_addr $I10, rxscan1060_loop
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  rxscan1060_done:
.annotate 'line', 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1061_fail
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  # rx literal  "**"
    add $I11, rx1056_pos, 2
    gt $I11, rx1056_eos, rx1056_fail
    sub $I11, rx1056_pos, rx1056_off
    substr $S10, rx1056_tgt, $I11, 2
    ne $S10, "**", rx1056_fail
    add rx1056_pos, 2
    set_addr $I10, rxcap_1061_fail
    ($I12, $I11) = rx1056_cur."!mark_peek"($I10)
    rx1056_cur."!cursor_pos"($I11)
    ($P10) = rx1056_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1056_pos, "")
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1061_done
  rxcap_1061_fail:
    goto rx1056_fail
  rxcap_1061_done:
  # rx subrule "O" subtype=capture negate=
    rx1056_cur."!cursor_pos"(rx1056_pos)
    $P10 = rx1056_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1056_fail
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1056_pos = $P10."pos"()
  # rx pass
    rx1056_cur."!cursor_pass"(rx1056_pos, "infix:sym<**>")
    rx1056_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1056_pos)
    .return (rx1056_cur)
  rx1056_fail:
.annotate 'line', 446
    (rx1056_rep, rx1056_pos, $I10, $P10) = rx1056_cur."!mark_fail"(0)
    lt rx1056_pos, -1, rx1056_done
    eq rx1056_pos, -1, rx1056_fail
    jump $I10
  rx1056_done:
    rx1056_cur."!cursor_fail"()
    rx1056_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1056_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("261_1277356913.9538") :method
.annotate 'line', 446
    $P1058 = self."!PREFIX__!subrule"("O", "**")
    new $P1059, "ResizablePMCArray"
    push $P1059, $P1058
    .return ($P1059)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("262_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1063_tgt
    .local int rx1063_pos
    .local int rx1063_off
    .local int rx1063_eos
    .local int rx1063_rep
    .local pmc rx1063_cur
    (rx1063_cur, rx1063_pos, rx1063_tgt) = self."!cursor_start"()
    rx1063_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx1063_cur
    .local pmc match
    .lex "$/", match
    length rx1063_eos, rx1063_tgt
    gt rx1063_pos, rx1063_eos, rx1063_done
    set rx1063_off, 0
    lt rx1063_pos, 2, rx1063_start
    sub rx1063_off, rx1063_pos, 1
    substr rx1063_tgt, rx1063_tgt, rx1063_off
  rx1063_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1067_done
    goto rxscan1067_scan
  rxscan1067_loop:
    ($P10) = rx1063_cur."from"()
    inc $P10
    set rx1063_pos, $P10
    ge rx1063_pos, rx1063_eos, rxscan1067_done
  rxscan1067_scan:
    set_addr $I10, rxscan1067_loop
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10)
  rxscan1067_done:
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1068_fail
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10)
  # rx literal  "+"
    add $I11, rx1063_pos, 1
    gt $I11, rx1063_eos, rx1063_fail
    sub $I11, rx1063_pos, rx1063_off
    substr $S10, rx1063_tgt, $I11, 1
    ne $S10, "+", rx1063_fail
    add rx1063_pos, 1
    set_addr $I10, rxcap_1068_fail
    ($I12, $I11) = rx1063_cur."!mark_peek"($I10)
    rx1063_cur."!cursor_pos"($I11)
    ($P10) = rx1063_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1063_pos, "")
    rx1063_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1068_done
  rxcap_1068_fail:
    goto rx1063_fail
  rxcap_1068_done:
  # rx subrule "O" subtype=capture negate=
    rx1063_cur."!cursor_pos"(rx1063_pos)
    $P10 = rx1063_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1063_fail
    rx1063_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1063_pos = $P10."pos"()
  # rx pass
    rx1063_cur."!cursor_pass"(rx1063_pos, "prefix:sym<+>")
    rx1063_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1063_pos)
    .return (rx1063_cur)
  rx1063_fail:
.annotate 'line', 446
    (rx1063_rep, rx1063_pos, $I10, $P10) = rx1063_cur."!mark_fail"(0)
    lt rx1063_pos, -1, rx1063_done
    eq rx1063_pos, -1, rx1063_fail
    jump $I10
  rx1063_done:
    rx1063_cur."!cursor_fail"()
    rx1063_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1063_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("263_1277356913.9538") :method
.annotate 'line', 446
    $P1065 = self."!PREFIX__!subrule"("O", "+")
    new $P1066, "ResizablePMCArray"
    push $P1066, $P1065
    .return ($P1066)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("264_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1070_tgt
    .local int rx1070_pos
    .local int rx1070_off
    .local int rx1070_eos
    .local int rx1070_rep
    .local pmc rx1070_cur
    (rx1070_cur, rx1070_pos, rx1070_tgt) = self."!cursor_start"()
    rx1070_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx1070_cur
    .local pmc match
    .lex "$/", match
    length rx1070_eos, rx1070_tgt
    gt rx1070_pos, rx1070_eos, rx1070_done
    set rx1070_off, 0
    lt rx1070_pos, 2, rx1070_start
    sub rx1070_off, rx1070_pos, 1
    substr rx1070_tgt, rx1070_tgt, rx1070_off
  rx1070_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1074_done
    goto rxscan1074_scan
  rxscan1074_loop:
    ($P10) = rx1070_cur."from"()
    inc $P10
    set rx1070_pos, $P10
    ge rx1070_pos, rx1070_eos, rxscan1074_done
  rxscan1074_scan:
    set_addr $I10, rxscan1074_loop
    rx1070_cur."!mark_push"(0, rx1070_pos, $I10)
  rxscan1074_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1075_fail
    rx1070_cur."!mark_push"(0, rx1070_pos, $I10)
  # rx literal  "~"
    add $I11, rx1070_pos, 1
    gt $I11, rx1070_eos, rx1070_fail
    sub $I11, rx1070_pos, rx1070_off
    substr $S10, rx1070_tgt, $I11, 1
    ne $S10, "~", rx1070_fail
    add rx1070_pos, 1
    set_addr $I10, rxcap_1075_fail
    ($I12, $I11) = rx1070_cur."!mark_peek"($I10)
    rx1070_cur."!cursor_pos"($I11)
    ($P10) = rx1070_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1070_pos, "")
    rx1070_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1075_done
  rxcap_1075_fail:
    goto rx1070_fail
  rxcap_1075_done:
  # rx subrule "O" subtype=capture negate=
    rx1070_cur."!cursor_pos"(rx1070_pos)
    $P10 = rx1070_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1070_fail
    rx1070_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1070_pos = $P10."pos"()
  # rx pass
    rx1070_cur."!cursor_pass"(rx1070_pos, "prefix:sym<~>")
    rx1070_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1070_pos)
    .return (rx1070_cur)
  rx1070_fail:
.annotate 'line', 446
    (rx1070_rep, rx1070_pos, $I10, $P10) = rx1070_cur."!mark_fail"(0)
    lt rx1070_pos, -1, rx1070_done
    eq rx1070_pos, -1, rx1070_fail
    jump $I10
  rx1070_done:
    rx1070_cur."!cursor_fail"()
    rx1070_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1070_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("265_1277356913.9538") :method
.annotate 'line', 446
    $P1072 = self."!PREFIX__!subrule"("O", "~")
    new $P1073, "ResizablePMCArray"
    push $P1073, $P1072
    .return ($P1073)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("266_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1077_tgt
    .local int rx1077_pos
    .local int rx1077_off
    .local int rx1077_eos
    .local int rx1077_rep
    .local pmc rx1077_cur
    (rx1077_cur, rx1077_pos, rx1077_tgt) = self."!cursor_start"()
    rx1077_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx1077_cur
    .local pmc match
    .lex "$/", match
    length rx1077_eos, rx1077_tgt
    gt rx1077_pos, rx1077_eos, rx1077_done
    set rx1077_off, 0
    lt rx1077_pos, 2, rx1077_start
    sub rx1077_off, rx1077_pos, 1
    substr rx1077_tgt, rx1077_tgt, rx1077_off
  rx1077_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1080_done
    goto rxscan1080_scan
  rxscan1080_loop:
    ($P10) = rx1077_cur."from"()
    inc $P10
    set rx1077_pos, $P10
    ge rx1077_pos, rx1077_eos, rxscan1080_done
  rxscan1080_scan:
    set_addr $I10, rxscan1080_loop
    rx1077_cur."!mark_push"(0, rx1077_pos, $I10)
  rxscan1080_done:
.annotate 'line', 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1081_fail
    rx1077_cur."!mark_push"(0, rx1077_pos, $I10)
  # rx literal  "-"
    add $I11, rx1077_pos, 1
    gt $I11, rx1077_eos, rx1077_fail
    sub $I11, rx1077_pos, rx1077_off
    substr $S10, rx1077_tgt, $I11, 1
    ne $S10, "-", rx1077_fail
    add rx1077_pos, 1
    set_addr $I10, rxcap_1081_fail
    ($I12, $I11) = rx1077_cur."!mark_peek"($I10)
    rx1077_cur."!cursor_pos"($I11)
    ($P10) = rx1077_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1077_pos, "")
    rx1077_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1081_done
  rxcap_1081_fail:
    goto rx1077_fail
  rxcap_1081_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1077_pos, rx1077_eos, rx1077_fail
    sub $I10, rx1077_pos, rx1077_off
    substr $S10, rx1077_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1077_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."number"()
    if $P10, rx1077_fail
  # rx subrule "O" subtype=capture negate=
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1077_fail
    rx1077_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1077_pos = $P10."pos"()
  # rx pass
    rx1077_cur."!cursor_pass"(rx1077_pos, "prefix:sym<->")
    rx1077_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1077_pos)
    .return (rx1077_cur)
  rx1077_fail:
.annotate 'line', 446
    (rx1077_rep, rx1077_pos, $I10, $P10) = rx1077_cur."!mark_fail"(0)
    lt rx1077_pos, -1, rx1077_done
    eq rx1077_pos, -1, rx1077_fail
    jump $I10
  rx1077_done:
    rx1077_cur."!cursor_fail"()
    rx1077_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1077_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("267_1277356913.9538") :method
.annotate 'line', 446
    new $P1079, "ResizablePMCArray"
    push $P1079, "-"
    .return ($P1079)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("268_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1083_tgt
    .local int rx1083_pos
    .local int rx1083_off
    .local int rx1083_eos
    .local int rx1083_rep
    .local pmc rx1083_cur
    (rx1083_cur, rx1083_pos, rx1083_tgt) = self."!cursor_start"()
    rx1083_cur."!cursor_debug"("START ", "prefix:sym<?>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1087_done
    goto rxscan1087_scan
  rxscan1087_loop:
    ($P10) = rx1083_cur."from"()
    inc $P10
    set rx1083_pos, $P10
    ge rx1083_pos, rx1083_eos, rxscan1087_done
  rxscan1087_scan:
    set_addr $I10, rxscan1087_loop
    rx1083_cur."!mark_push"(0, rx1083_pos, $I10)
  rxscan1087_done:
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1088_fail
    rx1083_cur."!mark_push"(0, rx1083_pos, $I10)
  # rx literal  "?"
    add $I11, rx1083_pos, 1
    gt $I11, rx1083_eos, rx1083_fail
    sub $I11, rx1083_pos, rx1083_off
    substr $S10, rx1083_tgt, $I11, 1
    ne $S10, "?", rx1083_fail
    add rx1083_pos, 1
    set_addr $I10, rxcap_1088_fail
    ($I12, $I11) = rx1083_cur."!mark_peek"($I10)
    rx1083_cur."!cursor_pos"($I11)
    ($P10) = rx1083_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1083_pos, "")
    rx1083_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1088_done
  rxcap_1088_fail:
    goto rx1083_fail
  rxcap_1088_done:
  # rx subrule "O" subtype=capture negate=
    rx1083_cur."!cursor_pos"(rx1083_pos)
    $P10 = rx1083_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1083_fail
    rx1083_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1083_pos = $P10."pos"()
  # rx pass
    rx1083_cur."!cursor_pass"(rx1083_pos, "prefix:sym<?>")
    rx1083_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1083_pos)
    .return (rx1083_cur)
  rx1083_fail:
.annotate 'line', 446
    (rx1083_rep, rx1083_pos, $I10, $P10) = rx1083_cur."!mark_fail"(0)
    lt rx1083_pos, -1, rx1083_done
    eq rx1083_pos, -1, rx1083_fail
    jump $I10
  rx1083_done:
    rx1083_cur."!cursor_fail"()
    rx1083_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1083_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("269_1277356913.9538") :method
.annotate 'line', 446
    $P1085 = self."!PREFIX__!subrule"("O", "?")
    new $P1086, "ResizablePMCArray"
    push $P1086, $P1085
    .return ($P1086)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("270_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1090_tgt
    .local int rx1090_pos
    .local int rx1090_off
    .local int rx1090_eos
    .local int rx1090_rep
    .local pmc rx1090_cur
    (rx1090_cur, rx1090_pos, rx1090_tgt) = self."!cursor_start"()
    rx1090_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1090_cur
    .local pmc match
    .lex "$/", match
    length rx1090_eos, rx1090_tgt
    gt rx1090_pos, rx1090_eos, rx1090_done
    set rx1090_off, 0
    lt rx1090_pos, 2, rx1090_start
    sub rx1090_off, rx1090_pos, 1
    substr rx1090_tgt, rx1090_tgt, rx1090_off
  rx1090_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1094_done
    goto rxscan1094_scan
  rxscan1094_loop:
    ($P10) = rx1090_cur."from"()
    inc $P10
    set rx1090_pos, $P10
    ge rx1090_pos, rx1090_eos, rxscan1094_done
  rxscan1094_scan:
    set_addr $I10, rxscan1094_loop
    rx1090_cur."!mark_push"(0, rx1090_pos, $I10)
  rxscan1094_done:
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1095_fail
    rx1090_cur."!mark_push"(0, rx1090_pos, $I10)
  # rx literal  "!"
    add $I11, rx1090_pos, 1
    gt $I11, rx1090_eos, rx1090_fail
    sub $I11, rx1090_pos, rx1090_off
    substr $S10, rx1090_tgt, $I11, 1
    ne $S10, "!", rx1090_fail
    add rx1090_pos, 1
    set_addr $I10, rxcap_1095_fail
    ($I12, $I11) = rx1090_cur."!mark_peek"($I10)
    rx1090_cur."!cursor_pos"($I11)
    ($P10) = rx1090_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1090_pos, "")
    rx1090_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1095_done
  rxcap_1095_fail:
    goto rx1090_fail
  rxcap_1095_done:
  # rx subrule "O" subtype=capture negate=
    rx1090_cur."!cursor_pos"(rx1090_pos)
    $P10 = rx1090_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1090_fail
    rx1090_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1090_pos = $P10."pos"()
  # rx pass
    rx1090_cur."!cursor_pass"(rx1090_pos, "prefix:sym<!>")
    rx1090_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1090_pos)
    .return (rx1090_cur)
  rx1090_fail:
.annotate 'line', 446
    (rx1090_rep, rx1090_pos, $I10, $P10) = rx1090_cur."!mark_fail"(0)
    lt rx1090_pos, -1, rx1090_done
    eq rx1090_pos, -1, rx1090_fail
    jump $I10
  rx1090_done:
    rx1090_cur."!cursor_fail"()
    rx1090_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1090_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("271_1277356913.9538") :method
.annotate 'line', 446
    $P1092 = self."!PREFIX__!subrule"("O", "!")
    new $P1093, "ResizablePMCArray"
    push $P1093, $P1092
    .return ($P1093)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("272_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1097_tgt
    .local int rx1097_pos
    .local int rx1097_off
    .local int rx1097_eos
    .local int rx1097_rep
    .local pmc rx1097_cur
    (rx1097_cur, rx1097_pos, rx1097_tgt) = self."!cursor_start"()
    rx1097_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1097_cur
    .local pmc match
    .lex "$/", match
    length rx1097_eos, rx1097_tgt
    gt rx1097_pos, rx1097_eos, rx1097_done
    set rx1097_off, 0
    lt rx1097_pos, 2, rx1097_start
    sub rx1097_off, rx1097_pos, 1
    substr rx1097_tgt, rx1097_tgt, rx1097_off
  rx1097_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1101_done
    goto rxscan1101_scan
  rxscan1101_loop:
    ($P10) = rx1097_cur."from"()
    inc $P10
    set rx1097_pos, $P10
    ge rx1097_pos, rx1097_eos, rxscan1101_done
  rxscan1101_scan:
    set_addr $I10, rxscan1101_loop
    rx1097_cur."!mark_push"(0, rx1097_pos, $I10)
  rxscan1101_done:
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1102_fail
    rx1097_cur."!mark_push"(0, rx1097_pos, $I10)
  # rx literal  "|"
    add $I11, rx1097_pos, 1
    gt $I11, rx1097_eos, rx1097_fail
    sub $I11, rx1097_pos, rx1097_off
    substr $S10, rx1097_tgt, $I11, 1
    ne $S10, "|", rx1097_fail
    add rx1097_pos, 1
    set_addr $I10, rxcap_1102_fail
    ($I12, $I11) = rx1097_cur."!mark_peek"($I10)
    rx1097_cur."!cursor_pos"($I11)
    ($P10) = rx1097_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1097_pos, "")
    rx1097_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1102_done
  rxcap_1102_fail:
    goto rx1097_fail
  rxcap_1102_done:
  # rx subrule "O" subtype=capture negate=
    rx1097_cur."!cursor_pos"(rx1097_pos)
    $P10 = rx1097_cur."O"("%symbolic_unary")
    unless $P10, rx1097_fail
    rx1097_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1097_pos = $P10."pos"()
  # rx pass
    rx1097_cur."!cursor_pass"(rx1097_pos, "prefix:sym<|>")
    rx1097_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1097_pos)
    .return (rx1097_cur)
  rx1097_fail:
.annotate 'line', 446
    (rx1097_rep, rx1097_pos, $I10, $P10) = rx1097_cur."!mark_fail"(0)
    lt rx1097_pos, -1, rx1097_done
    eq rx1097_pos, -1, rx1097_fail
    jump $I10
  rx1097_done:
    rx1097_cur."!cursor_fail"()
    rx1097_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1097_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("273_1277356913.9538") :method
.annotate 'line', 446
    $P1099 = self."!PREFIX__!subrule"("O", "|")
    new $P1100, "ResizablePMCArray"
    push $P1100, $P1099
    .return ($P1100)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("274_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1104_tgt
    .local int rx1104_pos
    .local int rx1104_off
    .local int rx1104_eos
    .local int rx1104_rep
    .local pmc rx1104_cur
    (rx1104_cur, rx1104_pos, rx1104_tgt) = self."!cursor_start"()
    rx1104_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1104_cur
    .local pmc match
    .lex "$/", match
    length rx1104_eos, rx1104_tgt
    gt rx1104_pos, rx1104_eos, rx1104_done
    set rx1104_off, 0
    lt rx1104_pos, 2, rx1104_start
    sub rx1104_off, rx1104_pos, 1
    substr rx1104_tgt, rx1104_tgt, rx1104_off
  rx1104_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1108_done
    goto rxscan1108_scan
  rxscan1108_loop:
    ($P10) = rx1104_cur."from"()
    inc $P10
    set rx1104_pos, $P10
    ge rx1104_pos, rx1104_eos, rxscan1108_done
  rxscan1108_scan:
    set_addr $I10, rxscan1108_loop
    rx1104_cur."!mark_push"(0, rx1104_pos, $I10)
  rxscan1108_done:
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1109_fail
    rx1104_cur."!mark_push"(0, rx1104_pos, $I10)
  # rx literal  "*"
    add $I11, rx1104_pos, 1
    gt $I11, rx1104_eos, rx1104_fail
    sub $I11, rx1104_pos, rx1104_off
    substr $S10, rx1104_tgt, $I11, 1
    ne $S10, "*", rx1104_fail
    add rx1104_pos, 1
    set_addr $I10, rxcap_1109_fail
    ($I12, $I11) = rx1104_cur."!mark_peek"($I10)
    rx1104_cur."!cursor_pos"($I11)
    ($P10) = rx1104_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1104_pos, "")
    rx1104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1109_done
  rxcap_1109_fail:
    goto rx1104_fail
  rxcap_1109_done:
  # rx subrule "O" subtype=capture negate=
    rx1104_cur."!cursor_pos"(rx1104_pos)
    $P10 = rx1104_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1104_fail
    rx1104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1104_pos = $P10."pos"()
  # rx pass
    rx1104_cur."!cursor_pass"(rx1104_pos, "infix:sym<*>")
    rx1104_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1104_pos)
    .return (rx1104_cur)
  rx1104_fail:
.annotate 'line', 446
    (rx1104_rep, rx1104_pos, $I10, $P10) = rx1104_cur."!mark_fail"(0)
    lt rx1104_pos, -1, rx1104_done
    eq rx1104_pos, -1, rx1104_fail
    jump $I10
  rx1104_done:
    rx1104_cur."!cursor_fail"()
    rx1104_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1104_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("275_1277356913.9538") :method
.annotate 'line', 446
    $P1106 = self."!PREFIX__!subrule"("O", "*")
    new $P1107, "ResizablePMCArray"
    push $P1107, $P1106
    .return ($P1107)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("276_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1111_tgt
    .local int rx1111_pos
    .local int rx1111_off
    .local int rx1111_eos
    .local int rx1111_rep
    .local pmc rx1111_cur
    (rx1111_cur, rx1111_pos, rx1111_tgt) = self."!cursor_start"()
    rx1111_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1111_cur
    .local pmc match
    .lex "$/", match
    length rx1111_eos, rx1111_tgt
    gt rx1111_pos, rx1111_eos, rx1111_done
    set rx1111_off, 0
    lt rx1111_pos, 2, rx1111_start
    sub rx1111_off, rx1111_pos, 1
    substr rx1111_tgt, rx1111_tgt, rx1111_off
  rx1111_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1115_done
    goto rxscan1115_scan
  rxscan1115_loop:
    ($P10) = rx1111_cur."from"()
    inc $P10
    set rx1111_pos, $P10
    ge rx1111_pos, rx1111_eos, rxscan1115_done
  rxscan1115_scan:
    set_addr $I10, rxscan1115_loop
    rx1111_cur."!mark_push"(0, rx1111_pos, $I10)
  rxscan1115_done:
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1116_fail
    rx1111_cur."!mark_push"(0, rx1111_pos, $I10)
  # rx literal  "/"
    add $I11, rx1111_pos, 1
    gt $I11, rx1111_eos, rx1111_fail
    sub $I11, rx1111_pos, rx1111_off
    substr $S10, rx1111_tgt, $I11, 1
    ne $S10, "/", rx1111_fail
    add rx1111_pos, 1
    set_addr $I10, rxcap_1116_fail
    ($I12, $I11) = rx1111_cur."!mark_peek"($I10)
    rx1111_cur."!cursor_pos"($I11)
    ($P10) = rx1111_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1111_pos, "")
    rx1111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1116_done
  rxcap_1116_fail:
    goto rx1111_fail
  rxcap_1116_done:
  # rx subrule "O" subtype=capture negate=
    rx1111_cur."!cursor_pos"(rx1111_pos)
    $P10 = rx1111_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1111_fail
    rx1111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1111_pos = $P10."pos"()
  # rx pass
    rx1111_cur."!cursor_pass"(rx1111_pos, "infix:sym</>")
    rx1111_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1111_pos)
    .return (rx1111_cur)
  rx1111_fail:
.annotate 'line', 446
    (rx1111_rep, rx1111_pos, $I10, $P10) = rx1111_cur."!mark_fail"(0)
    lt rx1111_pos, -1, rx1111_done
    eq rx1111_pos, -1, rx1111_fail
    jump $I10
  rx1111_done:
    rx1111_cur."!cursor_fail"()
    rx1111_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1111_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("277_1277356913.9538") :method
.annotate 'line', 446
    $P1113 = self."!PREFIX__!subrule"("O", "/")
    new $P1114, "ResizablePMCArray"
    push $P1114, $P1113
    .return ($P1114)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("278_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1118_tgt
    .local int rx1118_pos
    .local int rx1118_off
    .local int rx1118_eos
    .local int rx1118_rep
    .local pmc rx1118_cur
    (rx1118_cur, rx1118_pos, rx1118_tgt) = self."!cursor_start"()
    rx1118_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1118_cur
    .local pmc match
    .lex "$/", match
    length rx1118_eos, rx1118_tgt
    gt rx1118_pos, rx1118_eos, rx1118_done
    set rx1118_off, 0
    lt rx1118_pos, 2, rx1118_start
    sub rx1118_off, rx1118_pos, 1
    substr rx1118_tgt, rx1118_tgt, rx1118_off
  rx1118_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1122_done
    goto rxscan1122_scan
  rxscan1122_loop:
    ($P10) = rx1118_cur."from"()
    inc $P10
    set rx1118_pos, $P10
    ge rx1118_pos, rx1118_eos, rxscan1122_done
  rxscan1122_scan:
    set_addr $I10, rxscan1122_loop
    rx1118_cur."!mark_push"(0, rx1118_pos, $I10)
  rxscan1122_done:
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1123_fail
    rx1118_cur."!mark_push"(0, rx1118_pos, $I10)
  # rx literal  "%"
    add $I11, rx1118_pos, 1
    gt $I11, rx1118_eos, rx1118_fail
    sub $I11, rx1118_pos, rx1118_off
    substr $S10, rx1118_tgt, $I11, 1
    ne $S10, "%", rx1118_fail
    add rx1118_pos, 1
    set_addr $I10, rxcap_1123_fail
    ($I12, $I11) = rx1118_cur."!mark_peek"($I10)
    rx1118_cur."!cursor_pos"($I11)
    ($P10) = rx1118_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1118_pos, "")
    rx1118_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1123_done
  rxcap_1123_fail:
    goto rx1118_fail
  rxcap_1123_done:
  # rx subrule "O" subtype=capture negate=
    rx1118_cur."!cursor_pos"(rx1118_pos)
    $P10 = rx1118_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1118_fail
    rx1118_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1118_pos = $P10."pos"()
  # rx pass
    rx1118_cur."!cursor_pass"(rx1118_pos, "infix:sym<%>")
    rx1118_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1118_pos)
    .return (rx1118_cur)
  rx1118_fail:
.annotate 'line', 446
    (rx1118_rep, rx1118_pos, $I10, $P10) = rx1118_cur."!mark_fail"(0)
    lt rx1118_pos, -1, rx1118_done
    eq rx1118_pos, -1, rx1118_fail
    jump $I10
  rx1118_done:
    rx1118_cur."!cursor_fail"()
    rx1118_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1118_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("279_1277356913.9538") :method
.annotate 'line', 446
    $P1120 = self."!PREFIX__!subrule"("O", "%")
    new $P1121, "ResizablePMCArray"
    push $P1121, $P1120
    .return ($P1121)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("280_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1125_tgt
    .local int rx1125_pos
    .local int rx1125_off
    .local int rx1125_eos
    .local int rx1125_rep
    .local pmc rx1125_cur
    (rx1125_cur, rx1125_pos, rx1125_tgt) = self."!cursor_start"()
    rx1125_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1125_cur
    .local pmc match
    .lex "$/", match
    length rx1125_eos, rx1125_tgt
    gt rx1125_pos, rx1125_eos, rx1125_done
    set rx1125_off, 0
    lt rx1125_pos, 2, rx1125_start
    sub rx1125_off, rx1125_pos, 1
    substr rx1125_tgt, rx1125_tgt, rx1125_off
  rx1125_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1129_done
    goto rxscan1129_scan
  rxscan1129_loop:
    ($P10) = rx1125_cur."from"()
    inc $P10
    set rx1125_pos, $P10
    ge rx1125_pos, rx1125_eos, rxscan1129_done
  rxscan1129_scan:
    set_addr $I10, rxscan1129_loop
    rx1125_cur."!mark_push"(0, rx1125_pos, $I10)
  rxscan1129_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1130_fail
    rx1125_cur."!mark_push"(0, rx1125_pos, $I10)
  # rx literal  "+"
    add $I11, rx1125_pos, 1
    gt $I11, rx1125_eos, rx1125_fail
    sub $I11, rx1125_pos, rx1125_off
    substr $S10, rx1125_tgt, $I11, 1
    ne $S10, "+", rx1125_fail
    add rx1125_pos, 1
    set_addr $I10, rxcap_1130_fail
    ($I12, $I11) = rx1125_cur."!mark_peek"($I10)
    rx1125_cur."!cursor_pos"($I11)
    ($P10) = rx1125_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1125_pos, "")
    rx1125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1130_done
  rxcap_1130_fail:
    goto rx1125_fail
  rxcap_1130_done:
  # rx subrule "O" subtype=capture negate=
    rx1125_cur."!cursor_pos"(rx1125_pos)
    $P10 = rx1125_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1125_fail
    rx1125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1125_pos = $P10."pos"()
  # rx pass
    rx1125_cur."!cursor_pass"(rx1125_pos, "infix:sym<+>")
    rx1125_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1125_pos)
    .return (rx1125_cur)
  rx1125_fail:
.annotate 'line', 446
    (rx1125_rep, rx1125_pos, $I10, $P10) = rx1125_cur."!mark_fail"(0)
    lt rx1125_pos, -1, rx1125_done
    eq rx1125_pos, -1, rx1125_fail
    jump $I10
  rx1125_done:
    rx1125_cur."!cursor_fail"()
    rx1125_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1125_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("281_1277356913.9538") :method
.annotate 'line', 446
    $P1127 = self."!PREFIX__!subrule"("O", "+")
    new $P1128, "ResizablePMCArray"
    push $P1128, $P1127
    .return ($P1128)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("282_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1132_tgt
    .local int rx1132_pos
    .local int rx1132_off
    .local int rx1132_eos
    .local int rx1132_rep
    .local pmc rx1132_cur
    (rx1132_cur, rx1132_pos, rx1132_tgt) = self."!cursor_start"()
    rx1132_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1132_cur
    .local pmc match
    .lex "$/", match
    length rx1132_eos, rx1132_tgt
    gt rx1132_pos, rx1132_eos, rx1132_done
    set rx1132_off, 0
    lt rx1132_pos, 2, rx1132_start
    sub rx1132_off, rx1132_pos, 1
    substr rx1132_tgt, rx1132_tgt, rx1132_off
  rx1132_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1136_done
    goto rxscan1136_scan
  rxscan1136_loop:
    ($P10) = rx1132_cur."from"()
    inc $P10
    set rx1132_pos, $P10
    ge rx1132_pos, rx1132_eos, rxscan1136_done
  rxscan1136_scan:
    set_addr $I10, rxscan1136_loop
    rx1132_cur."!mark_push"(0, rx1132_pos, $I10)
  rxscan1136_done:
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1137_fail
    rx1132_cur."!mark_push"(0, rx1132_pos, $I10)
  # rx literal  "-"
    add $I11, rx1132_pos, 1
    gt $I11, rx1132_eos, rx1132_fail
    sub $I11, rx1132_pos, rx1132_off
    substr $S10, rx1132_tgt, $I11, 1
    ne $S10, "-", rx1132_fail
    add rx1132_pos, 1
    set_addr $I10, rxcap_1137_fail
    ($I12, $I11) = rx1132_cur."!mark_peek"($I10)
    rx1132_cur."!cursor_pos"($I11)
    ($P10) = rx1132_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1132_pos, "")
    rx1132_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1137_done
  rxcap_1137_fail:
    goto rx1132_fail
  rxcap_1137_done:
  # rx subrule "O" subtype=capture negate=
    rx1132_cur."!cursor_pos"(rx1132_pos)
    $P10 = rx1132_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1132_fail
    rx1132_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1132_pos = $P10."pos"()
  # rx pass
    rx1132_cur."!cursor_pass"(rx1132_pos, "infix:sym<->")
    rx1132_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1132_pos)
    .return (rx1132_cur)
  rx1132_fail:
.annotate 'line', 446
    (rx1132_rep, rx1132_pos, $I10, $P10) = rx1132_cur."!mark_fail"(0)
    lt rx1132_pos, -1, rx1132_done
    eq rx1132_pos, -1, rx1132_fail
    jump $I10
  rx1132_done:
    rx1132_cur."!cursor_fail"()
    rx1132_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1132_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("283_1277356913.9538") :method
.annotate 'line', 446
    $P1134 = self."!PREFIX__!subrule"("O", "-")
    new $P1135, "ResizablePMCArray"
    push $P1135, $P1134
    .return ($P1135)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("284_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1139_tgt
    .local int rx1139_pos
    .local int rx1139_off
    .local int rx1139_eos
    .local int rx1139_rep
    .local pmc rx1139_cur
    (rx1139_cur, rx1139_pos, rx1139_tgt) = self."!cursor_start"()
    rx1139_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1139_cur
    .local pmc match
    .lex "$/", match
    length rx1139_eos, rx1139_tgt
    gt rx1139_pos, rx1139_eos, rx1139_done
    set rx1139_off, 0
    lt rx1139_pos, 2, rx1139_start
    sub rx1139_off, rx1139_pos, 1
    substr rx1139_tgt, rx1139_tgt, rx1139_off
  rx1139_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1143_done
    goto rxscan1143_scan
  rxscan1143_loop:
    ($P10) = rx1139_cur."from"()
    inc $P10
    set rx1139_pos, $P10
    ge rx1139_pos, rx1139_eos, rxscan1143_done
  rxscan1143_scan:
    set_addr $I10, rxscan1143_loop
    rx1139_cur."!mark_push"(0, rx1139_pos, $I10)
  rxscan1143_done:
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1144_fail
    rx1139_cur."!mark_push"(0, rx1139_pos, $I10)
  # rx literal  "~"
    add $I11, rx1139_pos, 1
    gt $I11, rx1139_eos, rx1139_fail
    sub $I11, rx1139_pos, rx1139_off
    substr $S10, rx1139_tgt, $I11, 1
    ne $S10, "~", rx1139_fail
    add rx1139_pos, 1
    set_addr $I10, rxcap_1144_fail
    ($I12, $I11) = rx1139_cur."!mark_peek"($I10)
    rx1139_cur."!cursor_pos"($I11)
    ($P10) = rx1139_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1139_pos, "")
    rx1139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1144_done
  rxcap_1144_fail:
    goto rx1139_fail
  rxcap_1144_done:
  # rx subrule "O" subtype=capture negate=
    rx1139_cur."!cursor_pos"(rx1139_pos)
    $P10 = rx1139_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1139_fail
    rx1139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1139_pos = $P10."pos"()
  # rx pass
    rx1139_cur."!cursor_pass"(rx1139_pos, "infix:sym<~>")
    rx1139_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1139_pos)
    .return (rx1139_cur)
  rx1139_fail:
.annotate 'line', 446
    (rx1139_rep, rx1139_pos, $I10, $P10) = rx1139_cur."!mark_fail"(0)
    lt rx1139_pos, -1, rx1139_done
    eq rx1139_pos, -1, rx1139_fail
    jump $I10
  rx1139_done:
    rx1139_cur."!cursor_fail"()
    rx1139_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1139_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("285_1277356913.9538") :method
.annotate 'line', 446
    $P1141 = self."!PREFIX__!subrule"("O", "~")
    new $P1142, "ResizablePMCArray"
    push $P1142, $P1141
    .return ($P1142)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("286_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1146_tgt
    .local int rx1146_pos
    .local int rx1146_off
    .local int rx1146_eos
    .local int rx1146_rep
    .local pmc rx1146_cur
    (rx1146_cur, rx1146_pos, rx1146_tgt) = self."!cursor_start"()
    rx1146_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1146_cur
    .local pmc match
    .lex "$/", match
    length rx1146_eos, rx1146_tgt
    gt rx1146_pos, rx1146_eos, rx1146_done
    set rx1146_off, 0
    lt rx1146_pos, 2, rx1146_start
    sub rx1146_off, rx1146_pos, 1
    substr rx1146_tgt, rx1146_tgt, rx1146_off
  rx1146_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1150_done
    goto rxscan1150_scan
  rxscan1150_loop:
    ($P10) = rx1146_cur."from"()
    inc $P10
    set rx1146_pos, $P10
    ge rx1146_pos, rx1146_eos, rxscan1150_done
  rxscan1150_scan:
    set_addr $I10, rxscan1150_loop
    rx1146_cur."!mark_push"(0, rx1146_pos, $I10)
  rxscan1150_done:
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1151_fail
    rx1146_cur."!mark_push"(0, rx1146_pos, $I10)
  # rx literal  "=="
    add $I11, rx1146_pos, 2
    gt $I11, rx1146_eos, rx1146_fail
    sub $I11, rx1146_pos, rx1146_off
    substr $S10, rx1146_tgt, $I11, 2
    ne $S10, "==", rx1146_fail
    add rx1146_pos, 2
    set_addr $I10, rxcap_1151_fail
    ($I12, $I11) = rx1146_cur."!mark_peek"($I10)
    rx1146_cur."!cursor_pos"($I11)
    ($P10) = rx1146_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1146_pos, "")
    rx1146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1151_done
  rxcap_1151_fail:
    goto rx1146_fail
  rxcap_1151_done:
  # rx subrule "O" subtype=capture negate=
    rx1146_cur."!cursor_pos"(rx1146_pos)
    $P10 = rx1146_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1146_fail
    rx1146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1146_pos = $P10."pos"()
  # rx pass
    rx1146_cur."!cursor_pass"(rx1146_pos, "infix:sym<==>")
    rx1146_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1146_pos)
    .return (rx1146_cur)
  rx1146_fail:
.annotate 'line', 446
    (rx1146_rep, rx1146_pos, $I10, $P10) = rx1146_cur."!mark_fail"(0)
    lt rx1146_pos, -1, rx1146_done
    eq rx1146_pos, -1, rx1146_fail
    jump $I10
  rx1146_done:
    rx1146_cur."!cursor_fail"()
    rx1146_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1146_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("287_1277356913.9538") :method
.annotate 'line', 446
    $P1148 = self."!PREFIX__!subrule"("O", "==")
    new $P1149, "ResizablePMCArray"
    push $P1149, $P1148
    .return ($P1149)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("288_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1153_tgt
    .local int rx1153_pos
    .local int rx1153_off
    .local int rx1153_eos
    .local int rx1153_rep
    .local pmc rx1153_cur
    (rx1153_cur, rx1153_pos, rx1153_tgt) = self."!cursor_start"()
    rx1153_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1153_cur
    .local pmc match
    .lex "$/", match
    length rx1153_eos, rx1153_tgt
    gt rx1153_pos, rx1153_eos, rx1153_done
    set rx1153_off, 0
    lt rx1153_pos, 2, rx1153_start
    sub rx1153_off, rx1153_pos, 1
    substr rx1153_tgt, rx1153_tgt, rx1153_off
  rx1153_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1157_done
    goto rxscan1157_scan
  rxscan1157_loop:
    ($P10) = rx1153_cur."from"()
    inc $P10
    set rx1153_pos, $P10
    ge rx1153_pos, rx1153_eos, rxscan1157_done
  rxscan1157_scan:
    set_addr $I10, rxscan1157_loop
    rx1153_cur."!mark_push"(0, rx1153_pos, $I10)
  rxscan1157_done:
.annotate 'line', 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1158_fail
    rx1153_cur."!mark_push"(0, rx1153_pos, $I10)
  # rx literal  "!="
    add $I11, rx1153_pos, 2
    gt $I11, rx1153_eos, rx1153_fail
    sub $I11, rx1153_pos, rx1153_off
    substr $S10, rx1153_tgt, $I11, 2
    ne $S10, "!=", rx1153_fail
    add rx1153_pos, 2
    set_addr $I10, rxcap_1158_fail
    ($I12, $I11) = rx1153_cur."!mark_peek"($I10)
    rx1153_cur."!cursor_pos"($I11)
    ($P10) = rx1153_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1153_pos, "")
    rx1153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1158_done
  rxcap_1158_fail:
    goto rx1153_fail
  rxcap_1158_done:
  # rx subrule "O" subtype=capture negate=
    rx1153_cur."!cursor_pos"(rx1153_pos)
    $P10 = rx1153_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1153_fail
    rx1153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1153_pos = $P10."pos"()
  # rx pass
    rx1153_cur."!cursor_pass"(rx1153_pos, "infix:sym<!=>")
    rx1153_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1153_pos)
    .return (rx1153_cur)
  rx1153_fail:
.annotate 'line', 446
    (rx1153_rep, rx1153_pos, $I10, $P10) = rx1153_cur."!mark_fail"(0)
    lt rx1153_pos, -1, rx1153_done
    eq rx1153_pos, -1, rx1153_fail
    jump $I10
  rx1153_done:
    rx1153_cur."!cursor_fail"()
    rx1153_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1153_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("289_1277356913.9538") :method
.annotate 'line', 446
    $P1155 = self."!PREFIX__!subrule"("O", "!=")
    new $P1156, "ResizablePMCArray"
    push $P1156, $P1155
    .return ($P1156)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("290_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    (rx1160_cur, rx1160_pos, rx1160_tgt) = self."!cursor_start"()
    rx1160_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1160_cur
    .local pmc match
    .lex "$/", match
    length rx1160_eos, rx1160_tgt
    gt rx1160_pos, rx1160_eos, rx1160_done
    set rx1160_off, 0
    lt rx1160_pos, 2, rx1160_start
    sub rx1160_off, rx1160_pos, 1
    substr rx1160_tgt, rx1160_tgt, rx1160_off
  rx1160_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1164_done
    goto rxscan1164_scan
  rxscan1164_loop:
    ($P10) = rx1160_cur."from"()
    inc $P10
    set rx1160_pos, $P10
    ge rx1160_pos, rx1160_eos, rxscan1164_done
  rxscan1164_scan:
    set_addr $I10, rxscan1164_loop
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  rxscan1164_done:
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1165_fail
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  # rx literal  "<="
    add $I11, rx1160_pos, 2
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    substr $S10, rx1160_tgt, $I11, 2
    ne $S10, "<=", rx1160_fail
    add rx1160_pos, 2
    set_addr $I10, rxcap_1165_fail
    ($I12, $I11) = rx1160_cur."!mark_peek"($I10)
    rx1160_cur."!cursor_pos"($I11)
    ($P10) = rx1160_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1160_pos, "")
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1165_done
  rxcap_1165_fail:
    goto rx1160_fail
  rxcap_1165_done:
  # rx subrule "O" subtype=capture negate=
    rx1160_cur."!cursor_pos"(rx1160_pos)
    $P10 = rx1160_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1160_fail
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1160_pos = $P10."pos"()
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "infix:sym<<=>")
    rx1160_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1160_pos)
    .return (rx1160_cur)
  rx1160_fail:
.annotate 'line', 446
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    rx1160_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("291_1277356913.9538") :method
.annotate 'line', 446
    $P1162 = self."!PREFIX__!subrule"("O", "<=")
    new $P1163, "ResizablePMCArray"
    push $P1163, $P1162
    .return ($P1163)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("292_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1167_tgt
    .local int rx1167_pos
    .local int rx1167_off
    .local int rx1167_eos
    .local int rx1167_rep
    .local pmc rx1167_cur
    (rx1167_cur, rx1167_pos, rx1167_tgt) = self."!cursor_start"()
    rx1167_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1167_cur
    .local pmc match
    .lex "$/", match
    length rx1167_eos, rx1167_tgt
    gt rx1167_pos, rx1167_eos, rx1167_done
    set rx1167_off, 0
    lt rx1167_pos, 2, rx1167_start
    sub rx1167_off, rx1167_pos, 1
    substr rx1167_tgt, rx1167_tgt, rx1167_off
  rx1167_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1171_done
    goto rxscan1171_scan
  rxscan1171_loop:
    ($P10) = rx1167_cur."from"()
    inc $P10
    set rx1167_pos, $P10
    ge rx1167_pos, rx1167_eos, rxscan1171_done
  rxscan1171_scan:
    set_addr $I10, rxscan1171_loop
    rx1167_cur."!mark_push"(0, rx1167_pos, $I10)
  rxscan1171_done:
.annotate 'line', 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1172_fail
    rx1167_cur."!mark_push"(0, rx1167_pos, $I10)
  # rx literal  ">="
    add $I11, rx1167_pos, 2
    gt $I11, rx1167_eos, rx1167_fail
    sub $I11, rx1167_pos, rx1167_off
    substr $S10, rx1167_tgt, $I11, 2
    ne $S10, ">=", rx1167_fail
    add rx1167_pos, 2
    set_addr $I10, rxcap_1172_fail
    ($I12, $I11) = rx1167_cur."!mark_peek"($I10)
    rx1167_cur."!cursor_pos"($I11)
    ($P10) = rx1167_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1167_pos, "")
    rx1167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1172_done
  rxcap_1172_fail:
    goto rx1167_fail
  rxcap_1172_done:
  # rx subrule "O" subtype=capture negate=
    rx1167_cur."!cursor_pos"(rx1167_pos)
    $P10 = rx1167_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1167_fail
    rx1167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1167_pos = $P10."pos"()
  # rx pass
    rx1167_cur."!cursor_pass"(rx1167_pos, "infix:sym<>=>")
    rx1167_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1167_pos)
    .return (rx1167_cur)
  rx1167_fail:
.annotate 'line', 446
    (rx1167_rep, rx1167_pos, $I10, $P10) = rx1167_cur."!mark_fail"(0)
    lt rx1167_pos, -1, rx1167_done
    eq rx1167_pos, -1, rx1167_fail
    jump $I10
  rx1167_done:
    rx1167_cur."!cursor_fail"()
    rx1167_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1167_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("293_1277356913.9538") :method
.annotate 'line', 446
    $P1169 = self."!PREFIX__!subrule"("O", ">=")
    new $P1170, "ResizablePMCArray"
    push $P1170, $P1169
    .return ($P1170)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("294_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1174_tgt
    .local int rx1174_pos
    .local int rx1174_off
    .local int rx1174_eos
    .local int rx1174_rep
    .local pmc rx1174_cur
    (rx1174_cur, rx1174_pos, rx1174_tgt) = self."!cursor_start"()
    rx1174_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1174_cur
    .local pmc match
    .lex "$/", match
    length rx1174_eos, rx1174_tgt
    gt rx1174_pos, rx1174_eos, rx1174_done
    set rx1174_off, 0
    lt rx1174_pos, 2, rx1174_start
    sub rx1174_off, rx1174_pos, 1
    substr rx1174_tgt, rx1174_tgt, rx1174_off
  rx1174_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1178_done
    goto rxscan1178_scan
  rxscan1178_loop:
    ($P10) = rx1174_cur."from"()
    inc $P10
    set rx1174_pos, $P10
    ge rx1174_pos, rx1174_eos, rxscan1178_done
  rxscan1178_scan:
    set_addr $I10, rxscan1178_loop
    rx1174_cur."!mark_push"(0, rx1174_pos, $I10)
  rxscan1178_done:
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1179_fail
    rx1174_cur."!mark_push"(0, rx1174_pos, $I10)
  # rx literal  "<"
    add $I11, rx1174_pos, 1
    gt $I11, rx1174_eos, rx1174_fail
    sub $I11, rx1174_pos, rx1174_off
    substr $S10, rx1174_tgt, $I11, 1
    ne $S10, "<", rx1174_fail
    add rx1174_pos, 1
    set_addr $I10, rxcap_1179_fail
    ($I12, $I11) = rx1174_cur."!mark_peek"($I10)
    rx1174_cur."!cursor_pos"($I11)
    ($P10) = rx1174_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1174_pos, "")
    rx1174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1179_done
  rxcap_1179_fail:
    goto rx1174_fail
  rxcap_1179_done:
  # rx subrule "O" subtype=capture negate=
    rx1174_cur."!cursor_pos"(rx1174_pos)
    $P10 = rx1174_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1174_fail
    rx1174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1174_pos = $P10."pos"()
  # rx pass
    rx1174_cur."!cursor_pass"(rx1174_pos, "infix:sym<<>")
    rx1174_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1174_pos)
    .return (rx1174_cur)
  rx1174_fail:
.annotate 'line', 446
    (rx1174_rep, rx1174_pos, $I10, $P10) = rx1174_cur."!mark_fail"(0)
    lt rx1174_pos, -1, rx1174_done
    eq rx1174_pos, -1, rx1174_fail
    jump $I10
  rx1174_done:
    rx1174_cur."!cursor_fail"()
    rx1174_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1174_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("295_1277356913.9538") :method
.annotate 'line', 446
    $P1176 = self."!PREFIX__!subrule"("O", "<")
    new $P1177, "ResizablePMCArray"
    push $P1177, $P1176
    .return ($P1177)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("296_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1181_tgt
    .local int rx1181_pos
    .local int rx1181_off
    .local int rx1181_eos
    .local int rx1181_rep
    .local pmc rx1181_cur
    (rx1181_cur, rx1181_pos, rx1181_tgt) = self."!cursor_start"()
    rx1181_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1181_cur
    .local pmc match
    .lex "$/", match
    length rx1181_eos, rx1181_tgt
    gt rx1181_pos, rx1181_eos, rx1181_done
    set rx1181_off, 0
    lt rx1181_pos, 2, rx1181_start
    sub rx1181_off, rx1181_pos, 1
    substr rx1181_tgt, rx1181_tgt, rx1181_off
  rx1181_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1185_done
    goto rxscan1185_scan
  rxscan1185_loop:
    ($P10) = rx1181_cur."from"()
    inc $P10
    set rx1181_pos, $P10
    ge rx1181_pos, rx1181_eos, rxscan1185_done
  rxscan1185_scan:
    set_addr $I10, rxscan1185_loop
    rx1181_cur."!mark_push"(0, rx1181_pos, $I10)
  rxscan1185_done:
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1186_fail
    rx1181_cur."!mark_push"(0, rx1181_pos, $I10)
  # rx literal  ">"
    add $I11, rx1181_pos, 1
    gt $I11, rx1181_eos, rx1181_fail
    sub $I11, rx1181_pos, rx1181_off
    substr $S10, rx1181_tgt, $I11, 1
    ne $S10, ">", rx1181_fail
    add rx1181_pos, 1
    set_addr $I10, rxcap_1186_fail
    ($I12, $I11) = rx1181_cur."!mark_peek"($I10)
    rx1181_cur."!cursor_pos"($I11)
    ($P10) = rx1181_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1181_pos, "")
    rx1181_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1186_done
  rxcap_1186_fail:
    goto rx1181_fail
  rxcap_1186_done:
  # rx subrule "O" subtype=capture negate=
    rx1181_cur."!cursor_pos"(rx1181_pos)
    $P10 = rx1181_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1181_fail
    rx1181_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1181_pos = $P10."pos"()
  # rx pass
    rx1181_cur."!cursor_pass"(rx1181_pos, "infix:sym<>>")
    rx1181_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1181_pos)
    .return (rx1181_cur)
  rx1181_fail:
.annotate 'line', 446
    (rx1181_rep, rx1181_pos, $I10, $P10) = rx1181_cur."!mark_fail"(0)
    lt rx1181_pos, -1, rx1181_done
    eq rx1181_pos, -1, rx1181_fail
    jump $I10
  rx1181_done:
    rx1181_cur."!cursor_fail"()
    rx1181_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1181_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("297_1277356913.9538") :method
.annotate 'line', 446
    $P1183 = self."!PREFIX__!subrule"("O", ">")
    new $P1184, "ResizablePMCArray"
    push $P1184, $P1183
    .return ($P1184)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("298_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1188_tgt
    .local int rx1188_pos
    .local int rx1188_off
    .local int rx1188_eos
    .local int rx1188_rep
    .local pmc rx1188_cur
    (rx1188_cur, rx1188_pos, rx1188_tgt) = self."!cursor_start"()
    rx1188_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1188_cur
    .local pmc match
    .lex "$/", match
    length rx1188_eos, rx1188_tgt
    gt rx1188_pos, rx1188_eos, rx1188_done
    set rx1188_off, 0
    lt rx1188_pos, 2, rx1188_start
    sub rx1188_off, rx1188_pos, 1
    substr rx1188_tgt, rx1188_tgt, rx1188_off
  rx1188_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1192_done
    goto rxscan1192_scan
  rxscan1192_loop:
    ($P10) = rx1188_cur."from"()
    inc $P10
    set rx1188_pos, $P10
    ge rx1188_pos, rx1188_eos, rxscan1192_done
  rxscan1192_scan:
    set_addr $I10, rxscan1192_loop
    rx1188_cur."!mark_push"(0, rx1188_pos, $I10)
  rxscan1192_done:
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1193_fail
    rx1188_cur."!mark_push"(0, rx1188_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1188_pos, 2
    gt $I11, rx1188_eos, rx1188_fail
    sub $I11, rx1188_pos, rx1188_off
    substr $S10, rx1188_tgt, $I11, 2
    ne $S10, "eq", rx1188_fail
    add rx1188_pos, 2
    set_addr $I10, rxcap_1193_fail
    ($I12, $I11) = rx1188_cur."!mark_peek"($I10)
    rx1188_cur."!cursor_pos"($I11)
    ($P10) = rx1188_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1188_pos, "")
    rx1188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1193_done
  rxcap_1193_fail:
    goto rx1188_fail
  rxcap_1193_done:
  # rx subrule "O" subtype=capture negate=
    rx1188_cur."!cursor_pos"(rx1188_pos)
    $P10 = rx1188_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1188_fail
    rx1188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1188_pos = $P10."pos"()
  # rx pass
    rx1188_cur."!cursor_pass"(rx1188_pos, "infix:sym<eq>")
    rx1188_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1188_pos)
    .return (rx1188_cur)
  rx1188_fail:
.annotate 'line', 446
    (rx1188_rep, rx1188_pos, $I10, $P10) = rx1188_cur."!mark_fail"(0)
    lt rx1188_pos, -1, rx1188_done
    eq rx1188_pos, -1, rx1188_fail
    jump $I10
  rx1188_done:
    rx1188_cur."!cursor_fail"()
    rx1188_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1188_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("299_1277356913.9538") :method
.annotate 'line', 446
    $P1190 = self."!PREFIX__!subrule"("O", "eq")
    new $P1191, "ResizablePMCArray"
    push $P1191, $P1190
    .return ($P1191)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("300_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1195_tgt
    .local int rx1195_pos
    .local int rx1195_off
    .local int rx1195_eos
    .local int rx1195_rep
    .local pmc rx1195_cur
    (rx1195_cur, rx1195_pos, rx1195_tgt) = self."!cursor_start"()
    rx1195_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1195_cur
    .local pmc match
    .lex "$/", match
    length rx1195_eos, rx1195_tgt
    gt rx1195_pos, rx1195_eos, rx1195_done
    set rx1195_off, 0
    lt rx1195_pos, 2, rx1195_start
    sub rx1195_off, rx1195_pos, 1
    substr rx1195_tgt, rx1195_tgt, rx1195_off
  rx1195_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1199_done
    goto rxscan1199_scan
  rxscan1199_loop:
    ($P10) = rx1195_cur."from"()
    inc $P10
    set rx1195_pos, $P10
    ge rx1195_pos, rx1195_eos, rxscan1199_done
  rxscan1199_scan:
    set_addr $I10, rxscan1199_loop
    rx1195_cur."!mark_push"(0, rx1195_pos, $I10)
  rxscan1199_done:
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1200_fail
    rx1195_cur."!mark_push"(0, rx1195_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1195_pos, 2
    gt $I11, rx1195_eos, rx1195_fail
    sub $I11, rx1195_pos, rx1195_off
    substr $S10, rx1195_tgt, $I11, 2
    ne $S10, "ne", rx1195_fail
    add rx1195_pos, 2
    set_addr $I10, rxcap_1200_fail
    ($I12, $I11) = rx1195_cur."!mark_peek"($I10)
    rx1195_cur."!cursor_pos"($I11)
    ($P10) = rx1195_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1195_pos, "")
    rx1195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1200_done
  rxcap_1200_fail:
    goto rx1195_fail
  rxcap_1200_done:
  # rx subrule "O" subtype=capture negate=
    rx1195_cur."!cursor_pos"(rx1195_pos)
    $P10 = rx1195_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1195_fail
    rx1195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1195_pos = $P10."pos"()
  # rx pass
    rx1195_cur."!cursor_pass"(rx1195_pos, "infix:sym<ne>")
    rx1195_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1195_pos)
    .return (rx1195_cur)
  rx1195_fail:
.annotate 'line', 446
    (rx1195_rep, rx1195_pos, $I10, $P10) = rx1195_cur."!mark_fail"(0)
    lt rx1195_pos, -1, rx1195_done
    eq rx1195_pos, -1, rx1195_fail
    jump $I10
  rx1195_done:
    rx1195_cur."!cursor_fail"()
    rx1195_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1195_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("301_1277356913.9538") :method
.annotate 'line', 446
    $P1197 = self."!PREFIX__!subrule"("O", "ne")
    new $P1198, "ResizablePMCArray"
    push $P1198, $P1197
    .return ($P1198)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("302_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1202_tgt
    .local int rx1202_pos
    .local int rx1202_off
    .local int rx1202_eos
    .local int rx1202_rep
    .local pmc rx1202_cur
    (rx1202_cur, rx1202_pos, rx1202_tgt) = self."!cursor_start"()
    rx1202_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1202_cur
    .local pmc match
    .lex "$/", match
    length rx1202_eos, rx1202_tgt
    gt rx1202_pos, rx1202_eos, rx1202_done
    set rx1202_off, 0
    lt rx1202_pos, 2, rx1202_start
    sub rx1202_off, rx1202_pos, 1
    substr rx1202_tgt, rx1202_tgt, rx1202_off
  rx1202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1206_done
    goto rxscan1206_scan
  rxscan1206_loop:
    ($P10) = rx1202_cur."from"()
    inc $P10
    set rx1202_pos, $P10
    ge rx1202_pos, rx1202_eos, rxscan1206_done
  rxscan1206_scan:
    set_addr $I10, rxscan1206_loop
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  rxscan1206_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1207_fail
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  # rx literal  "le"
    add $I11, rx1202_pos, 2
    gt $I11, rx1202_eos, rx1202_fail
    sub $I11, rx1202_pos, rx1202_off
    substr $S10, rx1202_tgt, $I11, 2
    ne $S10, "le", rx1202_fail
    add rx1202_pos, 2
    set_addr $I10, rxcap_1207_fail
    ($I12, $I11) = rx1202_cur."!mark_peek"($I10)
    rx1202_cur."!cursor_pos"($I11)
    ($P10) = rx1202_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1202_pos, "")
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1207_done
  rxcap_1207_fail:
    goto rx1202_fail
  rxcap_1207_done:
  # rx subrule "O" subtype=capture negate=
    rx1202_cur."!cursor_pos"(rx1202_pos)
    $P10 = rx1202_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1202_fail
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1202_pos = $P10."pos"()
  # rx pass
    rx1202_cur."!cursor_pass"(rx1202_pos, "infix:sym<le>")
    rx1202_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1202_pos)
    .return (rx1202_cur)
  rx1202_fail:
.annotate 'line', 446
    (rx1202_rep, rx1202_pos, $I10, $P10) = rx1202_cur."!mark_fail"(0)
    lt rx1202_pos, -1, rx1202_done
    eq rx1202_pos, -1, rx1202_fail
    jump $I10
  rx1202_done:
    rx1202_cur."!cursor_fail"()
    rx1202_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1202_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("303_1277356913.9538") :method
.annotate 'line', 446
    $P1204 = self."!PREFIX__!subrule"("O", "le")
    new $P1205, "ResizablePMCArray"
    push $P1205, $P1204
    .return ($P1205)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("304_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1209_tgt
    .local int rx1209_pos
    .local int rx1209_off
    .local int rx1209_eos
    .local int rx1209_rep
    .local pmc rx1209_cur
    (rx1209_cur, rx1209_pos, rx1209_tgt) = self."!cursor_start"()
    rx1209_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1209_cur
    .local pmc match
    .lex "$/", match
    length rx1209_eos, rx1209_tgt
    gt rx1209_pos, rx1209_eos, rx1209_done
    set rx1209_off, 0
    lt rx1209_pos, 2, rx1209_start
    sub rx1209_off, rx1209_pos, 1
    substr rx1209_tgt, rx1209_tgt, rx1209_off
  rx1209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1213_done
    goto rxscan1213_scan
  rxscan1213_loop:
    ($P10) = rx1209_cur."from"()
    inc $P10
    set rx1209_pos, $P10
    ge rx1209_pos, rx1209_eos, rxscan1213_done
  rxscan1213_scan:
    set_addr $I10, rxscan1213_loop
    rx1209_cur."!mark_push"(0, rx1209_pos, $I10)
  rxscan1213_done:
.annotate 'line', 524
  # rx subcapture "sym"
    set_addr $I10, rxcap_1214_fail
    rx1209_cur."!mark_push"(0, rx1209_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1209_pos, 2
    gt $I11, rx1209_eos, rx1209_fail
    sub $I11, rx1209_pos, rx1209_off
    substr $S10, rx1209_tgt, $I11, 2
    ne $S10, "ge", rx1209_fail
    add rx1209_pos, 2
    set_addr $I10, rxcap_1214_fail
    ($I12, $I11) = rx1209_cur."!mark_peek"($I10)
    rx1209_cur."!cursor_pos"($I11)
    ($P10) = rx1209_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1209_pos, "")
    rx1209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1214_done
  rxcap_1214_fail:
    goto rx1209_fail
  rxcap_1214_done:
  # rx subrule "O" subtype=capture negate=
    rx1209_cur."!cursor_pos"(rx1209_pos)
    $P10 = rx1209_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1209_fail
    rx1209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1209_pos = $P10."pos"()
  # rx pass
    rx1209_cur."!cursor_pass"(rx1209_pos, "infix:sym<ge>")
    rx1209_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1209_pos)
    .return (rx1209_cur)
  rx1209_fail:
.annotate 'line', 446
    (rx1209_rep, rx1209_pos, $I10, $P10) = rx1209_cur."!mark_fail"(0)
    lt rx1209_pos, -1, rx1209_done
    eq rx1209_pos, -1, rx1209_fail
    jump $I10
  rx1209_done:
    rx1209_cur."!cursor_fail"()
    rx1209_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("305_1277356913.9538") :method
.annotate 'line', 446
    $P1211 = self."!PREFIX__!subrule"("O", "ge")
    new $P1212, "ResizablePMCArray"
    push $P1212, $P1211
    .return ($P1212)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("306_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1216_tgt
    .local int rx1216_pos
    .local int rx1216_off
    .local int rx1216_eos
    .local int rx1216_rep
    .local pmc rx1216_cur
    (rx1216_cur, rx1216_pos, rx1216_tgt) = self."!cursor_start"()
    rx1216_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1216_cur
    .local pmc match
    .lex "$/", match
    length rx1216_eos, rx1216_tgt
    gt rx1216_pos, rx1216_eos, rx1216_done
    set rx1216_off, 0
    lt rx1216_pos, 2, rx1216_start
    sub rx1216_off, rx1216_pos, 1
    substr rx1216_tgt, rx1216_tgt, rx1216_off
  rx1216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1220_done
    goto rxscan1220_scan
  rxscan1220_loop:
    ($P10) = rx1216_cur."from"()
    inc $P10
    set rx1216_pos, $P10
    ge rx1216_pos, rx1216_eos, rxscan1220_done
  rxscan1220_scan:
    set_addr $I10, rxscan1220_loop
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  rxscan1220_done:
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1221_fail
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1216_pos, 2
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 2
    ne $S10, "lt", rx1216_fail
    add rx1216_pos, 2
    set_addr $I10, rxcap_1221_fail
    ($I12, $I11) = rx1216_cur."!mark_peek"($I10)
    rx1216_cur."!cursor_pos"($I11)
    ($P10) = rx1216_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1216_pos, "")
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1221_done
  rxcap_1221_fail:
    goto rx1216_fail
  rxcap_1221_done:
  # rx subrule "O" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1216_pos = $P10."pos"()
  # rx pass
    rx1216_cur."!cursor_pass"(rx1216_pos, "infix:sym<lt>")
    rx1216_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1216_pos)
    .return (rx1216_cur)
  rx1216_fail:
.annotate 'line', 446
    (rx1216_rep, rx1216_pos, $I10, $P10) = rx1216_cur."!mark_fail"(0)
    lt rx1216_pos, -1, rx1216_done
    eq rx1216_pos, -1, rx1216_fail
    jump $I10
  rx1216_done:
    rx1216_cur."!cursor_fail"()
    rx1216_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1216_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("307_1277356913.9538") :method
.annotate 'line', 446
    $P1218 = self."!PREFIX__!subrule"("O", "lt")
    new $P1219, "ResizablePMCArray"
    push $P1219, $P1218
    .return ($P1219)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("308_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1223_tgt
    .local int rx1223_pos
    .local int rx1223_off
    .local int rx1223_eos
    .local int rx1223_rep
    .local pmc rx1223_cur
    (rx1223_cur, rx1223_pos, rx1223_tgt) = self."!cursor_start"()
    rx1223_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1223_cur
    .local pmc match
    .lex "$/", match
    length rx1223_eos, rx1223_tgt
    gt rx1223_pos, rx1223_eos, rx1223_done
    set rx1223_off, 0
    lt rx1223_pos, 2, rx1223_start
    sub rx1223_off, rx1223_pos, 1
    substr rx1223_tgt, rx1223_tgt, rx1223_off
  rx1223_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1227_done
    goto rxscan1227_scan
  rxscan1227_loop:
    ($P10) = rx1223_cur."from"()
    inc $P10
    set rx1223_pos, $P10
    ge rx1223_pos, rx1223_eos, rxscan1227_done
  rxscan1227_scan:
    set_addr $I10, rxscan1227_loop
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  rxscan1227_done:
.annotate 'line', 526
  # rx subcapture "sym"
    set_addr $I10, rxcap_1228_fail
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1223_pos, 2
    gt $I11, rx1223_eos, rx1223_fail
    sub $I11, rx1223_pos, rx1223_off
    substr $S10, rx1223_tgt, $I11, 2
    ne $S10, "gt", rx1223_fail
    add rx1223_pos, 2
    set_addr $I10, rxcap_1228_fail
    ($I12, $I11) = rx1223_cur."!mark_peek"($I10)
    rx1223_cur."!cursor_pos"($I11)
    ($P10) = rx1223_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1223_pos, "")
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1228_done
  rxcap_1228_fail:
    goto rx1223_fail
  rxcap_1228_done:
  # rx subrule "O" subtype=capture negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1223_fail
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1223_pos = $P10."pos"()
  # rx pass
    rx1223_cur."!cursor_pass"(rx1223_pos, "infix:sym<gt>")
    rx1223_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1223_pos)
    .return (rx1223_cur)
  rx1223_fail:
.annotate 'line', 446
    (rx1223_rep, rx1223_pos, $I10, $P10) = rx1223_cur."!mark_fail"(0)
    lt rx1223_pos, -1, rx1223_done
    eq rx1223_pos, -1, rx1223_fail
    jump $I10
  rx1223_done:
    rx1223_cur."!cursor_fail"()
    rx1223_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1223_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("309_1277356913.9538") :method
.annotate 'line', 446
    $P1225 = self."!PREFIX__!subrule"("O", "gt")
    new $P1226, "ResizablePMCArray"
    push $P1226, $P1225
    .return ($P1226)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("310_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1230_tgt
    .local int rx1230_pos
    .local int rx1230_off
    .local int rx1230_eos
    .local int rx1230_rep
    .local pmc rx1230_cur
    (rx1230_cur, rx1230_pos, rx1230_tgt) = self."!cursor_start"()
    rx1230_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1230_cur
    .local pmc match
    .lex "$/", match
    length rx1230_eos, rx1230_tgt
    gt rx1230_pos, rx1230_eos, rx1230_done
    set rx1230_off, 0
    lt rx1230_pos, 2, rx1230_start
    sub rx1230_off, rx1230_pos, 1
    substr rx1230_tgt, rx1230_tgt, rx1230_off
  rx1230_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1234_done
    goto rxscan1234_scan
  rxscan1234_loop:
    ($P10) = rx1230_cur."from"()
    inc $P10
    set rx1230_pos, $P10
    ge rx1230_pos, rx1230_eos, rxscan1234_done
  rxscan1234_scan:
    set_addr $I10, rxscan1234_loop
    rx1230_cur."!mark_push"(0, rx1230_pos, $I10)
  rxscan1234_done:
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1235_fail
    rx1230_cur."!mark_push"(0, rx1230_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1230_pos, 3
    gt $I11, rx1230_eos, rx1230_fail
    sub $I11, rx1230_pos, rx1230_off
    substr $S10, rx1230_tgt, $I11, 3
    ne $S10, "=:=", rx1230_fail
    add rx1230_pos, 3
    set_addr $I10, rxcap_1235_fail
    ($I12, $I11) = rx1230_cur."!mark_peek"($I10)
    rx1230_cur."!cursor_pos"($I11)
    ($P10) = rx1230_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1230_pos, "")
    rx1230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1235_done
  rxcap_1235_fail:
    goto rx1230_fail
  rxcap_1235_done:
  # rx subrule "O" subtype=capture negate=
    rx1230_cur."!cursor_pos"(rx1230_pos)
    $P10 = rx1230_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1230_fail
    rx1230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1230_pos = $P10."pos"()
  # rx pass
    rx1230_cur."!cursor_pass"(rx1230_pos, "infix:sym<=:=>")
    rx1230_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1230_pos)
    .return (rx1230_cur)
  rx1230_fail:
.annotate 'line', 446
    (rx1230_rep, rx1230_pos, $I10, $P10) = rx1230_cur."!mark_fail"(0)
    lt rx1230_pos, -1, rx1230_done
    eq rx1230_pos, -1, rx1230_fail
    jump $I10
  rx1230_done:
    rx1230_cur."!cursor_fail"()
    rx1230_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1230_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("311_1277356913.9538") :method
.annotate 'line', 446
    $P1232 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1233, "ResizablePMCArray"
    push $P1233, $P1232
    .return ($P1233)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("312_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1237_tgt
    .local int rx1237_pos
    .local int rx1237_off
    .local int rx1237_eos
    .local int rx1237_rep
    .local pmc rx1237_cur
    (rx1237_cur, rx1237_pos, rx1237_tgt) = self."!cursor_start"()
    rx1237_cur."!cursor_debug"("START ", "infix:sym<~~>")
    .lex unicode:"$\x{a2}", rx1237_cur
    .local pmc match
    .lex "$/", match
    length rx1237_eos, rx1237_tgt
    gt rx1237_pos, rx1237_eos, rx1237_done
    set rx1237_off, 0
    lt rx1237_pos, 2, rx1237_start
    sub rx1237_off, rx1237_pos, 1
    substr rx1237_tgt, rx1237_tgt, rx1237_off
  rx1237_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1241_done
    goto rxscan1241_scan
  rxscan1241_loop:
    ($P10) = rx1237_cur."from"()
    inc $P10
    set rx1237_pos, $P10
    ge rx1237_pos, rx1237_eos, rxscan1241_done
  rxscan1241_scan:
    set_addr $I10, rxscan1241_loop
    rx1237_cur."!mark_push"(0, rx1237_pos, $I10)
  rxscan1241_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1242_fail
    rx1237_cur."!mark_push"(0, rx1237_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1237_pos, 2
    gt $I11, rx1237_eos, rx1237_fail
    sub $I11, rx1237_pos, rx1237_off
    substr $S10, rx1237_tgt, $I11, 2
    ne $S10, "~~", rx1237_fail
    add rx1237_pos, 2
    set_addr $I10, rxcap_1242_fail
    ($I12, $I11) = rx1237_cur."!mark_peek"($I10)
    rx1237_cur."!cursor_pos"($I11)
    ($P10) = rx1237_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1237_pos, "")
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1242_done
  rxcap_1242_fail:
    goto rx1237_fail
  rxcap_1242_done:
  # rx subrule "O" subtype=capture negate=
    rx1237_cur."!cursor_pos"(rx1237_pos)
    $P10 = rx1237_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1237_fail
    rx1237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1237_pos = $P10."pos"()
  # rx pass
    rx1237_cur."!cursor_pass"(rx1237_pos, "infix:sym<~~>")
    rx1237_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1237_pos)
    .return (rx1237_cur)
  rx1237_fail:
.annotate 'line', 446
    (rx1237_rep, rx1237_pos, $I10, $P10) = rx1237_cur."!mark_fail"(0)
    lt rx1237_pos, -1, rx1237_done
    eq rx1237_pos, -1, rx1237_fail
    jump $I10
  rx1237_done:
    rx1237_cur."!cursor_fail"()
    rx1237_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("313_1277356913.9538") :method
.annotate 'line', 446
    $P1239 = self."!PREFIX__!subrule"("O", "~~")
    new $P1240, "ResizablePMCArray"
    push $P1240, $P1239
    .return ($P1240)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("314_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1244_tgt
    .local int rx1244_pos
    .local int rx1244_off
    .local int rx1244_eos
    .local int rx1244_rep
    .local pmc rx1244_cur
    (rx1244_cur, rx1244_pos, rx1244_tgt) = self."!cursor_start"()
    rx1244_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1244_cur
    .local pmc match
    .lex "$/", match
    length rx1244_eos, rx1244_tgt
    gt rx1244_pos, rx1244_eos, rx1244_done
    set rx1244_off, 0
    lt rx1244_pos, 2, rx1244_start
    sub rx1244_off, rx1244_pos, 1
    substr rx1244_tgt, rx1244_tgt, rx1244_off
  rx1244_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1248_done
    goto rxscan1248_scan
  rxscan1248_loop:
    ($P10) = rx1244_cur."from"()
    inc $P10
    set rx1244_pos, $P10
    ge rx1244_pos, rx1244_eos, rxscan1248_done
  rxscan1248_scan:
    set_addr $I10, rxscan1248_loop
    rx1244_cur."!mark_push"(0, rx1244_pos, $I10)
  rxscan1248_done:
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1249_fail
    rx1244_cur."!mark_push"(0, rx1244_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1244_pos, 2
    gt $I11, rx1244_eos, rx1244_fail
    sub $I11, rx1244_pos, rx1244_off
    substr $S10, rx1244_tgt, $I11, 2
    ne $S10, "&&", rx1244_fail
    add rx1244_pos, 2
    set_addr $I10, rxcap_1249_fail
    ($I12, $I11) = rx1244_cur."!mark_peek"($I10)
    rx1244_cur."!cursor_pos"($I11)
    ($P10) = rx1244_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1244_pos, "")
    rx1244_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1249_done
  rxcap_1249_fail:
    goto rx1244_fail
  rxcap_1249_done:
  # rx subrule "O" subtype=capture negate=
    rx1244_cur."!cursor_pos"(rx1244_pos)
    $P10 = rx1244_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1244_fail
    rx1244_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1244_pos = $P10."pos"()
  # rx pass
    rx1244_cur."!cursor_pass"(rx1244_pos, "infix:sym<&&>")
    rx1244_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1244_pos)
    .return (rx1244_cur)
  rx1244_fail:
.annotate 'line', 446
    (rx1244_rep, rx1244_pos, $I10, $P10) = rx1244_cur."!mark_fail"(0)
    lt rx1244_pos, -1, rx1244_done
    eq rx1244_pos, -1, rx1244_fail
    jump $I10
  rx1244_done:
    rx1244_cur."!cursor_fail"()
    rx1244_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1244_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("315_1277356913.9538") :method
.annotate 'line', 446
    $P1246 = self."!PREFIX__!subrule"("O", "&&")
    new $P1247, "ResizablePMCArray"
    push $P1247, $P1246
    .return ($P1247)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("316_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1251_tgt
    .local int rx1251_pos
    .local int rx1251_off
    .local int rx1251_eos
    .local int rx1251_rep
    .local pmc rx1251_cur
    (rx1251_cur, rx1251_pos, rx1251_tgt) = self."!cursor_start"()
    rx1251_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1251_cur
    .local pmc match
    .lex "$/", match
    length rx1251_eos, rx1251_tgt
    gt rx1251_pos, rx1251_eos, rx1251_done
    set rx1251_off, 0
    lt rx1251_pos, 2, rx1251_start
    sub rx1251_off, rx1251_pos, 1
    substr rx1251_tgt, rx1251_tgt, rx1251_off
  rx1251_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1255_done
    goto rxscan1255_scan
  rxscan1255_loop:
    ($P10) = rx1251_cur."from"()
    inc $P10
    set rx1251_pos, $P10
    ge rx1251_pos, rx1251_eos, rxscan1255_done
  rxscan1255_scan:
    set_addr $I10, rxscan1255_loop
    rx1251_cur."!mark_push"(0, rx1251_pos, $I10)
  rxscan1255_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1256_fail
    rx1251_cur."!mark_push"(0, rx1251_pos, $I10)
  # rx literal  "||"
    add $I11, rx1251_pos, 2
    gt $I11, rx1251_eos, rx1251_fail
    sub $I11, rx1251_pos, rx1251_off
    substr $S10, rx1251_tgt, $I11, 2
    ne $S10, "||", rx1251_fail
    add rx1251_pos, 2
    set_addr $I10, rxcap_1256_fail
    ($I12, $I11) = rx1251_cur."!mark_peek"($I10)
    rx1251_cur."!cursor_pos"($I11)
    ($P10) = rx1251_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1251_pos, "")
    rx1251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1256_done
  rxcap_1256_fail:
    goto rx1251_fail
  rxcap_1256_done:
  # rx subrule "O" subtype=capture negate=
    rx1251_cur."!cursor_pos"(rx1251_pos)
    $P10 = rx1251_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1251_fail
    rx1251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1251_pos = $P10."pos"()
  # rx pass
    rx1251_cur."!cursor_pass"(rx1251_pos, "infix:sym<||>")
    rx1251_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1251_pos)
    .return (rx1251_cur)
  rx1251_fail:
.annotate 'line', 446
    (rx1251_rep, rx1251_pos, $I10, $P10) = rx1251_cur."!mark_fail"(0)
    lt rx1251_pos, -1, rx1251_done
    eq rx1251_pos, -1, rx1251_fail
    jump $I10
  rx1251_done:
    rx1251_cur."!cursor_fail"()
    rx1251_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1251_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("317_1277356913.9538") :method
.annotate 'line', 446
    $P1253 = self."!PREFIX__!subrule"("O", "||")
    new $P1254, "ResizablePMCArray"
    push $P1254, $P1253
    .return ($P1254)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("318_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1258_tgt
    .local int rx1258_pos
    .local int rx1258_off
    .local int rx1258_eos
    .local int rx1258_rep
    .local pmc rx1258_cur
    (rx1258_cur, rx1258_pos, rx1258_tgt) = self."!cursor_start"()
    rx1258_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1258_cur
    .local pmc match
    .lex "$/", match
    length rx1258_eos, rx1258_tgt
    gt rx1258_pos, rx1258_eos, rx1258_done
    set rx1258_off, 0
    lt rx1258_pos, 2, rx1258_start
    sub rx1258_off, rx1258_pos, 1
    substr rx1258_tgt, rx1258_tgt, rx1258_off
  rx1258_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1262_done
    goto rxscan1262_scan
  rxscan1262_loop:
    ($P10) = rx1258_cur."from"()
    inc $P10
    set rx1258_pos, $P10
    ge rx1258_pos, rx1258_eos, rxscan1262_done
  rxscan1262_scan:
    set_addr $I10, rxscan1262_loop
    rx1258_cur."!mark_push"(0, rx1258_pos, $I10)
  rxscan1262_done:
.annotate 'line', 533
  # rx subcapture "sym"
    set_addr $I10, rxcap_1263_fail
    rx1258_cur."!mark_push"(0, rx1258_pos, $I10)
  # rx literal  "//"
    add $I11, rx1258_pos, 2
    gt $I11, rx1258_eos, rx1258_fail
    sub $I11, rx1258_pos, rx1258_off
    substr $S10, rx1258_tgt, $I11, 2
    ne $S10, "//", rx1258_fail
    add rx1258_pos, 2
    set_addr $I10, rxcap_1263_fail
    ($I12, $I11) = rx1258_cur."!mark_peek"($I10)
    rx1258_cur."!cursor_pos"($I11)
    ($P10) = rx1258_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1258_pos, "")
    rx1258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1263_done
  rxcap_1263_fail:
    goto rx1258_fail
  rxcap_1263_done:
  # rx subrule "O" subtype=capture negate=
    rx1258_cur."!cursor_pos"(rx1258_pos)
    $P10 = rx1258_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1258_fail
    rx1258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1258_pos = $P10."pos"()
  # rx pass
    rx1258_cur."!cursor_pass"(rx1258_pos, "infix:sym<//>")
    rx1258_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1258_pos)
    .return (rx1258_cur)
  rx1258_fail:
.annotate 'line', 446
    (rx1258_rep, rx1258_pos, $I10, $P10) = rx1258_cur."!mark_fail"(0)
    lt rx1258_pos, -1, rx1258_done
    eq rx1258_pos, -1, rx1258_fail
    jump $I10
  rx1258_done:
    rx1258_cur."!cursor_fail"()
    rx1258_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1258_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("319_1277356913.9538") :method
.annotate 'line', 446
    $P1260 = self."!PREFIX__!subrule"("O", "//")
    new $P1261, "ResizablePMCArray"
    push $P1261, $P1260
    .return ($P1261)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("320_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1265_tgt
    .local int rx1265_pos
    .local int rx1265_off
    .local int rx1265_eos
    .local int rx1265_rep
    .local pmc rx1265_cur
    (rx1265_cur, rx1265_pos, rx1265_tgt) = self."!cursor_start"()
    rx1265_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1265_cur
    .local pmc match
    .lex "$/", match
    length rx1265_eos, rx1265_tgt
    gt rx1265_pos, rx1265_eos, rx1265_done
    set rx1265_off, 0
    lt rx1265_pos, 2, rx1265_start
    sub rx1265_off, rx1265_pos, 1
    substr rx1265_tgt, rx1265_tgt, rx1265_off
  rx1265_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1269_done
    goto rxscan1269_scan
  rxscan1269_loop:
    ($P10) = rx1265_cur."from"()
    inc $P10
    set rx1265_pos, $P10
    ge rx1265_pos, rx1265_eos, rxscan1269_done
  rxscan1269_scan:
    set_addr $I10, rxscan1269_loop
    rx1265_cur."!mark_push"(0, rx1265_pos, $I10)
  rxscan1269_done:
.annotate 'line', 536
  # rx literal  "??"
    add $I11, rx1265_pos, 2
    gt $I11, rx1265_eos, rx1265_fail
    sub $I11, rx1265_pos, rx1265_off
    substr $S10, rx1265_tgt, $I11, 2
    ne $S10, "??", rx1265_fail
    add rx1265_pos, 2
.annotate 'line', 537
  # rx subrule "ws" subtype=method negate=
    rx1265_cur."!cursor_pos"(rx1265_pos)
    $P10 = rx1265_cur."ws"()
    unless $P10, rx1265_fail
    rx1265_pos = $P10."pos"()
.annotate 'line', 538
  # rx subrule "EXPR" subtype=capture negate=
    rx1265_cur."!cursor_pos"(rx1265_pos)
    $P10 = rx1265_cur."EXPR"("i=")
    unless $P10, rx1265_fail
    rx1265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1265_pos = $P10."pos"()
.annotate 'line', 539
  # rx literal  "!!"
    add $I11, rx1265_pos, 2
    gt $I11, rx1265_eos, rx1265_fail
    sub $I11, rx1265_pos, rx1265_off
    substr $S10, rx1265_tgt, $I11, 2
    ne $S10, "!!", rx1265_fail
    add rx1265_pos, 2
.annotate 'line', 540
  # rx subrule "O" subtype=capture negate=
    rx1265_cur."!cursor_pos"(rx1265_pos)
    $P10 = rx1265_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1265_fail
    rx1265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1265_pos = $P10."pos"()
.annotate 'line', 535
  # rx pass
    rx1265_cur."!cursor_pass"(rx1265_pos, "infix:sym<?? !!>")
    rx1265_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1265_pos)
    .return (rx1265_cur)
  rx1265_fail:
.annotate 'line', 446
    (rx1265_rep, rx1265_pos, $I10, $P10) = rx1265_cur."!mark_fail"(0)
    lt rx1265_pos, -1, rx1265_done
    eq rx1265_pos, -1, rx1265_fail
    jump $I10
  rx1265_done:
    rx1265_cur."!cursor_fail"()
    rx1265_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1265_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("321_1277356913.9538") :method
.annotate 'line', 446
    $P1267 = self."!PREFIX__!subrule"("ws", "??")
    new $P1268, "ResizablePMCArray"
    push $P1268, $P1267
    .return ($P1268)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("322_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1271_tgt
    .local int rx1271_pos
    .local int rx1271_off
    .local int rx1271_eos
    .local int rx1271_rep
    .local pmc rx1271_cur
    (rx1271_cur, rx1271_pos, rx1271_tgt) = self."!cursor_start"()
    rx1271_cur."!cursor_debug"("START ", "infix:sym<=>")
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
.annotate 'line', 544
  # rx subcapture "sym"
    set_addr $I10, rxcap_1276_fail
    rx1271_cur."!mark_push"(0, rx1271_pos, $I10)
  # rx literal  "="
    add $I11, rx1271_pos, 1
    gt $I11, rx1271_eos, rx1271_fail
    sub $I11, rx1271_pos, rx1271_off
    substr $S10, rx1271_tgt, $I11, 1
    ne $S10, "=", rx1271_fail
    add rx1271_pos, 1
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
  # rx subrule "panic" subtype=method negate=
    rx1271_cur."!cursor_pos"(rx1271_pos)
    $P10 = rx1271_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1271_fail
    rx1271_pos = $P10."pos"()
.annotate 'line', 543
  # rx pass
    rx1271_cur."!cursor_pass"(rx1271_pos, "infix:sym<=>")
    rx1271_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1271_pos)
    .return (rx1271_cur)
  rx1271_fail:
.annotate 'line', 446
    (rx1271_rep, rx1271_pos, $I10, $P10) = rx1271_cur."!mark_fail"(0)
    lt rx1271_pos, -1, rx1271_done
    eq rx1271_pos, -1, rx1271_fail
    jump $I10
  rx1271_done:
    rx1271_cur."!cursor_fail"()
    rx1271_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1271_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("323_1277356913.9538") :method
.annotate 'line', 446
    $P1273 = self."!PREFIX__!subrule"("panic", "=")
    new $P1274, "ResizablePMCArray"
    push $P1274, $P1273
    .return ($P1274)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("324_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1278_tgt
    .local int rx1278_pos
    .local int rx1278_off
    .local int rx1278_eos
    .local int rx1278_rep
    .local pmc rx1278_cur
    (rx1278_cur, rx1278_pos, rx1278_tgt) = self."!cursor_start"()
    rx1278_cur."!cursor_debug"("START ", "infix:sym<:=>")
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
.annotate 'line', 546
  # rx subcapture "sym"
    set_addr $I10, rxcap_1283_fail
    rx1278_cur."!mark_push"(0, rx1278_pos, $I10)
  # rx literal  ":="
    add $I11, rx1278_pos, 2
    gt $I11, rx1278_eos, rx1278_fail
    sub $I11, rx1278_pos, rx1278_off
    substr $S10, rx1278_tgt, $I11, 2
    ne $S10, ":=", rx1278_fail
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
    $P10 = rx1278_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1278_fail
    rx1278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1278_pos = $P10."pos"()
  # rx pass
    rx1278_cur."!cursor_pass"(rx1278_pos, "infix:sym<:=>")
    rx1278_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1278_pos)
    .return (rx1278_cur)
  rx1278_fail:
.annotate 'line', 446
    (rx1278_rep, rx1278_pos, $I10, $P10) = rx1278_cur."!mark_fail"(0)
    lt rx1278_pos, -1, rx1278_done
    eq rx1278_pos, -1, rx1278_fail
    jump $I10
  rx1278_done:
    rx1278_cur."!cursor_fail"()
    rx1278_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1278_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("325_1277356913.9538") :method
.annotate 'line', 446
    $P1280 = self."!PREFIX__!subrule"("O", ":=")
    new $P1281, "ResizablePMCArray"
    push $P1281, $P1280
    .return ($P1281)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("326_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1285_tgt
    .local int rx1285_pos
    .local int rx1285_off
    .local int rx1285_eos
    .local int rx1285_rep
    .local pmc rx1285_cur
    (rx1285_cur, rx1285_pos, rx1285_tgt) = self."!cursor_start"()
    rx1285_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
.annotate 'line', 547
  # rx subcapture "sym"
    set_addr $I10, rxcap_1290_fail
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  # rx literal  "::="
    add $I11, rx1285_pos, 3
    gt $I11, rx1285_eos, rx1285_fail
    sub $I11, rx1285_pos, rx1285_off
    substr $S10, rx1285_tgt, $I11, 3
    ne $S10, "::=", rx1285_fail
    add rx1285_pos, 3
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
    $P10 = rx1285_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1285_fail
    rx1285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1285_pos = $P10."pos"()
  # rx pass
    rx1285_cur."!cursor_pass"(rx1285_pos, "infix:sym<::=>")
    rx1285_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1285_pos)
    .return (rx1285_cur)
  rx1285_fail:
.annotate 'line', 446
    (rx1285_rep, rx1285_pos, $I10, $P10) = rx1285_cur."!mark_fail"(0)
    lt rx1285_pos, -1, rx1285_done
    eq rx1285_pos, -1, rx1285_fail
    jump $I10
  rx1285_done:
    rx1285_cur."!cursor_fail"()
    rx1285_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1285_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("327_1277356913.9538") :method
.annotate 'line', 446
    $P1287 = self."!PREFIX__!subrule"("O", "::=")
    new $P1288, "ResizablePMCArray"
    push $P1288, $P1287
    .return ($P1288)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("328_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1292_tgt
    .local int rx1292_pos
    .local int rx1292_off
    .local int rx1292_eos
    .local int rx1292_rep
    .local pmc rx1292_cur
    (rx1292_cur, rx1292_pos, rx1292_tgt) = self."!cursor_start"()
    rx1292_cur."!cursor_debug"("START ", "infix:sym<,>")
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
.annotate 'line', 549
  # rx subcapture "sym"
    set_addr $I10, rxcap_1297_fail
    rx1292_cur."!mark_push"(0, rx1292_pos, $I10)
  # rx literal  ","
    add $I11, rx1292_pos, 1
    gt $I11, rx1292_eos, rx1292_fail
    sub $I11, rx1292_pos, rx1292_off
    substr $S10, rx1292_tgt, $I11, 1
    ne $S10, ",", rx1292_fail
    add rx1292_pos, 1
    set_addr $I10, rxcap_1297_fail
    ($I12, $I11) = rx1292_cur."!mark_peek"($I10)
    rx1292_cur."!cursor_pos"($I11)
    ($P10) = rx1292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1292_pos, "")
    rx1292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1297_done
  rxcap_1297_fail:
    goto rx1292_fail
  rxcap_1297_done:
  # rx subrule "O" subtype=capture negate=
    rx1292_cur."!cursor_pos"(rx1292_pos)
    $P10 = rx1292_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1292_fail
    rx1292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1292_pos = $P10."pos"()
  # rx pass
    rx1292_cur."!cursor_pass"(rx1292_pos, "infix:sym<,>")
    rx1292_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1292_pos)
    .return (rx1292_cur)
  rx1292_fail:
.annotate 'line', 446
    (rx1292_rep, rx1292_pos, $I10, $P10) = rx1292_cur."!mark_fail"(0)
    lt rx1292_pos, -1, rx1292_done
    eq rx1292_pos, -1, rx1292_fail
    jump $I10
  rx1292_done:
    rx1292_cur."!cursor_fail"()
    rx1292_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1292_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("329_1277356913.9538") :method
.annotate 'line', 446
    $P1294 = self."!PREFIX__!subrule"("O", ",")
    new $P1295, "ResizablePMCArray"
    push $P1295, $P1294
    .return ($P1295)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("330_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1299_tgt
    .local int rx1299_pos
    .local int rx1299_off
    .local int rx1299_eos
    .local int rx1299_rep
    .local pmc rx1299_cur
    (rx1299_cur, rx1299_pos, rx1299_tgt) = self."!cursor_start"()
    rx1299_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
.annotate 'line', 551
  # rx subcapture "sym"
    set_addr $I10, rxcap_1303_fail
    rx1299_cur."!mark_push"(0, rx1299_pos, $I10)
  # rx literal  "return"
    add $I11, rx1299_pos, 6
    gt $I11, rx1299_eos, rx1299_fail
    sub $I11, rx1299_pos, rx1299_off
    substr $S10, rx1299_tgt, $I11, 6
    ne $S10, "return", rx1299_fail
    add rx1299_pos, 6
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
  # rx charclass s
    ge rx1299_pos, rx1299_eos, rx1299_fail
    sub $I10, rx1299_pos, rx1299_off
    is_cclass $I11, 32, rx1299_tgt, $I10
    unless $I11, rx1299_fail
    inc rx1299_pos
  # rx subrule "O" subtype=capture negate=
    rx1299_cur."!cursor_pos"(rx1299_pos)
    $P10 = rx1299_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1299_fail
    rx1299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1299_pos = $P10."pos"()
  # rx pass
    rx1299_cur."!cursor_pass"(rx1299_pos, "prefix:sym<return>")
    rx1299_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1299_pos)
    .return (rx1299_cur)
  rx1299_fail:
.annotate 'line', 446
    (rx1299_rep, rx1299_pos, $I10, $P10) = rx1299_cur."!mark_fail"(0)
    lt rx1299_pos, -1, rx1299_done
    eq rx1299_pos, -1, rx1299_fail
    jump $I10
  rx1299_done:
    rx1299_cur."!cursor_fail"()
    rx1299_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1299_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("331_1277356913.9538") :method
.annotate 'line', 446
    new $P1301, "ResizablePMCArray"
    push $P1301, "return"
    .return ($P1301)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("332_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1305_tgt
    .local int rx1305_pos
    .local int rx1305_off
    .local int rx1305_eos
    .local int rx1305_rep
    .local pmc rx1305_cur
    (rx1305_cur, rx1305_pos, rx1305_tgt) = self."!cursor_start"()
    rx1305_cur."!cursor_debug"("START ", "prefix:sym<make>")
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
.annotate 'line', 552
  # rx subcapture "sym"
    set_addr $I10, rxcap_1309_fail
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  # rx literal  "make"
    add $I11, rx1305_pos, 4
    gt $I11, rx1305_eos, rx1305_fail
    sub $I11, rx1305_pos, rx1305_off
    substr $S10, rx1305_tgt, $I11, 4
    ne $S10, "make", rx1305_fail
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
  # rx charclass s
    ge rx1305_pos, rx1305_eos, rx1305_fail
    sub $I10, rx1305_pos, rx1305_off
    is_cclass $I11, 32, rx1305_tgt, $I10
    unless $I11, rx1305_fail
    inc rx1305_pos
  # rx subrule "O" subtype=capture negate=
    rx1305_cur."!cursor_pos"(rx1305_pos)
    $P10 = rx1305_cur."O"("%list_prefix")
    unless $P10, rx1305_fail
    rx1305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1305_pos = $P10."pos"()
  # rx pass
    rx1305_cur."!cursor_pass"(rx1305_pos, "prefix:sym<make>")
    rx1305_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1305_pos)
    .return (rx1305_cur)
  rx1305_fail:
.annotate 'line', 446
    (rx1305_rep, rx1305_pos, $I10, $P10) = rx1305_cur."!mark_fail"(0)
    lt rx1305_pos, -1, rx1305_done
    eq rx1305_pos, -1, rx1305_fail
    jump $I10
  rx1305_done:
    rx1305_cur."!cursor_fail"()
    rx1305_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1305_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("333_1277356913.9538") :method
.annotate 'line', 446
    new $P1307, "ResizablePMCArray"
    push $P1307, "make"
    .return ($P1307)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("334_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1311_tgt
    .local int rx1311_pos
    .local int rx1311_off
    .local int rx1311_eos
    .local int rx1311_rep
    .local pmc rx1311_cur
    (rx1311_cur, rx1311_pos, rx1311_tgt) = self."!cursor_start"()
    rx1311_cur."!cursor_debug"("START ", "term:sym<last>")
    .lex unicode:"$\x{a2}", rx1311_cur
    .local pmc match
    .lex "$/", match
    length rx1311_eos, rx1311_tgt
    gt rx1311_pos, rx1311_eos, rx1311_done
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
.annotate 'line', 553
  # rx subcapture "sym"
    set_addr $I10, rxcap_1315_fail
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
  # rx literal  "last"
    add $I11, rx1311_pos, 4
    gt $I11, rx1311_eos, rx1311_fail
    sub $I11, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I11, 4
    ne $S10, "last", rx1311_fail
    add rx1311_pos, 4
    set_addr $I10, rxcap_1315_fail
    ($I12, $I11) = rx1311_cur."!mark_peek"($I10)
    rx1311_cur."!cursor_pos"($I11)
    ($P10) = rx1311_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1311_pos, "")
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1315_done
  rxcap_1315_fail:
    goto rx1311_fail
  rxcap_1315_done:
  # rx pass
    rx1311_cur."!cursor_pass"(rx1311_pos, "term:sym<last>")
    rx1311_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1311_pos)
    .return (rx1311_cur)
  rx1311_fail:
.annotate 'line', 446
    (rx1311_rep, rx1311_pos, $I10, $P10) = rx1311_cur."!mark_fail"(0)
    lt rx1311_pos, -1, rx1311_done
    eq rx1311_pos, -1, rx1311_fail
    jump $I10
  rx1311_done:
    rx1311_cur."!cursor_fail"()
    rx1311_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1311_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("335_1277356913.9538") :method
.annotate 'line', 446
    new $P1313, "ResizablePMCArray"
    push $P1313, "last"
    .return ($P1313)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("336_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1317_tgt
    .local int rx1317_pos
    .local int rx1317_off
    .local int rx1317_eos
    .local int rx1317_rep
    .local pmc rx1317_cur
    (rx1317_cur, rx1317_pos, rx1317_tgt) = self."!cursor_start"()
    rx1317_cur."!cursor_debug"("START ", "term:sym<next>")
    .lex unicode:"$\x{a2}", rx1317_cur
    .local pmc match
    .lex "$/", match
    length rx1317_eos, rx1317_tgt
    gt rx1317_pos, rx1317_eos, rx1317_done
    set rx1317_off, 0
    lt rx1317_pos, 2, rx1317_start
    sub rx1317_off, rx1317_pos, 1
    substr rx1317_tgt, rx1317_tgt, rx1317_off
  rx1317_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1320_done
    goto rxscan1320_scan
  rxscan1320_loop:
    ($P10) = rx1317_cur."from"()
    inc $P10
    set rx1317_pos, $P10
    ge rx1317_pos, rx1317_eos, rxscan1320_done
  rxscan1320_scan:
    set_addr $I10, rxscan1320_loop
    rx1317_cur."!mark_push"(0, rx1317_pos, $I10)
  rxscan1320_done:
.annotate 'line', 554
  # rx subcapture "sym"
    set_addr $I10, rxcap_1321_fail
    rx1317_cur."!mark_push"(0, rx1317_pos, $I10)
  # rx literal  "next"
    add $I11, rx1317_pos, 4
    gt $I11, rx1317_eos, rx1317_fail
    sub $I11, rx1317_pos, rx1317_off
    substr $S10, rx1317_tgt, $I11, 4
    ne $S10, "next", rx1317_fail
    add rx1317_pos, 4
    set_addr $I10, rxcap_1321_fail
    ($I12, $I11) = rx1317_cur."!mark_peek"($I10)
    rx1317_cur."!cursor_pos"($I11)
    ($P10) = rx1317_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1317_pos, "")
    rx1317_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1321_done
  rxcap_1321_fail:
    goto rx1317_fail
  rxcap_1321_done:
  # rx pass
    rx1317_cur."!cursor_pass"(rx1317_pos, "term:sym<next>")
    rx1317_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1317_pos)
    .return (rx1317_cur)
  rx1317_fail:
.annotate 'line', 446
    (rx1317_rep, rx1317_pos, $I10, $P10) = rx1317_cur."!mark_fail"(0)
    lt rx1317_pos, -1, rx1317_done
    eq rx1317_pos, -1, rx1317_fail
    jump $I10
  rx1317_done:
    rx1317_cur."!cursor_fail"()
    rx1317_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1317_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("337_1277356913.9538") :method
.annotate 'line', 446
    new $P1319, "ResizablePMCArray"
    push $P1319, "next"
    .return ($P1319)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("338_1277356913.9538") :method :outer("11_1277356913.9538")
.annotate 'line', 446
    .local string rx1323_tgt
    .local int rx1323_pos
    .local int rx1323_off
    .local int rx1323_eos
    .local int rx1323_rep
    .local pmc rx1323_cur
    (rx1323_cur, rx1323_pos, rx1323_tgt) = self."!cursor_start"()
    rx1323_cur."!cursor_debug"("START ", "term:sym<redo>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1326_done
    goto rxscan1326_scan
  rxscan1326_loop:
    ($P10) = rx1323_cur."from"()
    inc $P10
    set rx1323_pos, $P10
    ge rx1323_pos, rx1323_eos, rxscan1326_done
  rxscan1326_scan:
    set_addr $I10, rxscan1326_loop
    rx1323_cur."!mark_push"(0, rx1323_pos, $I10)
  rxscan1326_done:
.annotate 'line', 555
  # rx subcapture "sym"
    set_addr $I10, rxcap_1327_fail
    rx1323_cur."!mark_push"(0, rx1323_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1323_pos, 4
    gt $I11, rx1323_eos, rx1323_fail
    sub $I11, rx1323_pos, rx1323_off
    substr $S10, rx1323_tgt, $I11, 4
    ne $S10, "redo", rx1323_fail
    add rx1323_pos, 4
    set_addr $I10, rxcap_1327_fail
    ($I12, $I11) = rx1323_cur."!mark_peek"($I10)
    rx1323_cur."!cursor_pos"($I11)
    ($P10) = rx1323_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1323_pos, "")
    rx1323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1327_done
  rxcap_1327_fail:
    goto rx1323_fail
  rxcap_1327_done:
  # rx pass
    rx1323_cur."!cursor_pass"(rx1323_pos, "term:sym<redo>")
    rx1323_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1323_pos)
    .return (rx1323_cur)
  rx1323_fail:
.annotate 'line', 446
    (rx1323_rep, rx1323_pos, $I10, $P10) = rx1323_cur."!mark_fail"(0)
    lt rx1323_pos, -1, rx1323_done
    eq rx1323_pos, -1, rx1323_fail
    jump $I10
  rx1323_done:
    rx1323_cur."!cursor_fail"()
    rx1323_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1323_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("339_1277356913.9538") :method
.annotate 'line', 446
    new $P1325, "ResizablePMCArray"
    push $P1325, "redo"
    .return ($P1325)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("340_1277356913.9538") :method :outer("11_1277356913.9538")
    .param pmc param_1331
.annotate 'line', 557
    new $P1330, 'ExceptionHandler'
    set_addr $P1330, control_1329
    $P1330."handle_types"(.CONTROL_RETURN)
    push_eh $P1330
    .lex "self", self
    .lex "$/", param_1331
.annotate 'line', 559
    new $P1332, "Undef"
    .lex "$t", $P1332
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_376
    $P1333 = root_new ['parrot';'ResizablePMCArray']
  vivify_376:
    set $P1334, $P1333[0]
    unless_null $P1334, vivify_377
    new $P1334, "Undef"
  vivify_377:
    store_lex "$t", $P1334
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_378
    $P1335 = root_new ['parrot';'ResizablePMCArray']
  vivify_378:
    set $P1336, $P1335[1]
    unless_null $P1336, vivify_379
    new $P1336, "Undef"
  vivify_379:
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_380
    $P1337 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1337
  vivify_380:
    set $P1337[0], $P1336
    find_lex $P1338, "$t"
    find_lex $P1339, "$/"
    unless_null $P1339, vivify_381
    $P1339 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1339
  vivify_381:
    set $P1339[1], $P1338
.annotate 'line', 557
    .return ($P1338)
  control_1329:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1340, exception, "payload"
    .return ($P1340)
.end


.namespace ["NQP";"Regex"]
.sub "_block1341"  :subid("341_1277356913.9538") :outer("11_1277356913.9538")
.annotate 'line', 563
    .const 'Sub' $P1399 = "360_1277356913.9538" 
    capture_lex $P1399
    .const 'Sub' $P1394 = "358_1277356913.9538" 
    capture_lex $P1394
    .const 'Sub' $P1381 = "355_1277356913.9538" 
    capture_lex $P1381
    .const 'Sub' $P1371 = "352_1277356913.9538" 
    capture_lex $P1371
    .const 'Sub' $P1366 = "350_1277356913.9538" 
    capture_lex $P1366
    .const 'Sub' $P1357 = "347_1277356913.9538" 
    capture_lex $P1357
    .const 'Sub' $P1352 = "345_1277356913.9538" 
    capture_lex $P1352
    .const 'Sub' $P1343 = "342_1277356913.9538" 
    capture_lex $P1343
    .const 'Sub' $P1399 = "360_1277356913.9538" 
    capture_lex $P1399
    .return ($P1399)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("342_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .const 'Sub' $P1349 = "344_1277356913.9538" 
    capture_lex $P1349
    .local string rx1344_tgt
    .local int rx1344_pos
    .local int rx1344_off
    .local int rx1344_eos
    .local int rx1344_rep
    .local pmc rx1344_cur
    (rx1344_cur, rx1344_pos, rx1344_tgt) = self."!cursor_start"()
    rx1344_cur."!cursor_debug"("START ", "metachar:sym<:my>")
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
  # rx literal  ":"
    add $I11, rx1344_pos, 1
    gt $I11, rx1344_eos, rx1344_fail
    sub $I11, rx1344_pos, rx1344_off
    substr $S10, rx1344_tgt, $I11, 1
    ne $S10, ":", rx1344_fail
    add rx1344_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1344_cur."!cursor_pos"(rx1344_pos)
    .const 'Sub' $P1349 = "344_1277356913.9538" 
    capture_lex $P1349
    $P10 = rx1344_cur."before"($P1349)
    unless $P10, rx1344_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1344_cur."!cursor_pos"(rx1344_pos)
    $P10 = rx1344_cur."LANG"("MAIN", "statement")
    unless $P10, rx1344_fail
    rx1344_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1344_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1344_cur."!cursor_pos"(rx1344_pos)
    $P10 = rx1344_cur."ws"()
    unless $P10, rx1344_fail
    rx1344_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1344_pos, 1
    gt $I11, rx1344_eos, rx1344_fail
    sub $I11, rx1344_pos, rx1344_off
    substr $S10, rx1344_tgt, $I11, 1
    ne $S10, ";", rx1344_fail
    add rx1344_pos, 1
.annotate 'line', 564
  # rx pass
    rx1344_cur."!cursor_pass"(rx1344_pos, "metachar:sym<:my>")
    rx1344_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1344_pos)
    .return (rx1344_cur)
  rx1344_fail:
.annotate 'line', 563
    (rx1344_rep, rx1344_pos, $I10, $P10) = rx1344_cur."!mark_fail"(0)
    lt rx1344_pos, -1, rx1344_done
    eq rx1344_pos, -1, rx1344_fail
    jump $I10
  rx1344_done:
    rx1344_cur."!cursor_fail"()
    rx1344_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1344_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("343_1277356913.9538") :method
.annotate 'line', 563
    new $P1346, "ResizablePMCArray"
    push $P1346, ":"
    .return ($P1346)
.end


.namespace ["NQP";"Regex"]
.sub "_block1348"  :anon :subid("344_1277356913.9538") :method :outer("342_1277356913.9538")
.annotate 'line', 565
    .local string rx1350_tgt
    .local int rx1350_pos
    .local int rx1350_off
    .local int rx1350_eos
    .local int rx1350_rep
    .local pmc rx1350_cur
    (rx1350_cur, rx1350_pos, rx1350_tgt) = self."!cursor_start"()
    rx1350_cur."!cursor_debug"("START ", "")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1351_done
    goto rxscan1351_scan
  rxscan1351_loop:
    ($P10) = rx1350_cur."from"()
    inc $P10
    set rx1350_pos, $P10
    ge rx1350_pos, rx1350_eos, rxscan1351_done
  rxscan1351_scan:
    set_addr $I10, rxscan1351_loop
    rx1350_cur."!mark_push"(0, rx1350_pos, $I10)
  rxscan1351_done:
  # rx literal  "my"
    add $I11, rx1350_pos, 2
    gt $I11, rx1350_eos, rx1350_fail
    sub $I11, rx1350_pos, rx1350_off
    substr $S10, rx1350_tgt, $I11, 2
    ne $S10, "my", rx1350_fail
    add rx1350_pos, 2
  # rx pass
    rx1350_cur."!cursor_pass"(rx1350_pos, "")
    rx1350_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1350_pos)
    .return (rx1350_cur)
  rx1350_fail:
    (rx1350_rep, rx1350_pos, $I10, $P10) = rx1350_cur."!mark_fail"(0)
    lt rx1350_pos, -1, rx1350_done
    eq rx1350_pos, -1, rx1350_fail
    jump $I10
  rx1350_done:
    rx1350_cur."!cursor_fail"()
    rx1350_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1350_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("345_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .local string rx1353_tgt
    .local int rx1353_pos
    .local int rx1353_off
    .local int rx1353_eos
    .local int rx1353_rep
    .local pmc rx1353_cur
    (rx1353_cur, rx1353_pos, rx1353_tgt) = self."!cursor_start"()
    rx1353_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
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
.annotate 'line', 569
  # rx enumcharlist negate=0 zerowidth
    ge rx1353_pos, rx1353_eos, rx1353_fail
    sub $I10, rx1353_pos, rx1353_off
    substr $S10, rx1353_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1353_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1353_cur."!cursor_pos"(rx1353_pos)
    $P10 = rx1353_cur."codeblock"()
    unless $P10, rx1353_fail
    rx1353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1353_pos = $P10."pos"()
.annotate 'line', 568
  # rx pass
    rx1353_cur."!cursor_pass"(rx1353_pos, "metachar:sym<{ }>")
    rx1353_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1353_pos)
    .return (rx1353_cur)
  rx1353_fail:
.annotate 'line', 563
    (rx1353_rep, rx1353_pos, $I10, $P10) = rx1353_cur."!mark_fail"(0)
    lt rx1353_pos, -1, rx1353_done
    eq rx1353_pos, -1, rx1353_fail
    jump $I10
  rx1353_done:
    rx1353_cur."!cursor_fail"()
    rx1353_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1353_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("346_1277356913.9538") :method
.annotate 'line', 563
    new $P1355, "ResizablePMCArray"
    push $P1355, "{"
    .return ($P1355)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("347_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .const 'Sub' $P1363 = "349_1277356913.9538" 
    capture_lex $P1363
    .local string rx1358_tgt
    .local int rx1358_pos
    .local int rx1358_off
    .local int rx1358_eos
    .local int rx1358_rep
    .local pmc rx1358_cur
    (rx1358_cur, rx1358_pos, rx1358_tgt) = self."!cursor_start"()
    rx1358_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
    .lex unicode:"$\x{a2}", rx1358_cur
    .local pmc match
    .lex "$/", match
    length rx1358_eos, rx1358_tgt
    gt rx1358_pos, rx1358_eos, rx1358_done
    set rx1358_off, 0
    lt rx1358_pos, 2, rx1358_start
    sub rx1358_off, rx1358_pos, 1
    substr rx1358_tgt, rx1358_tgt, rx1358_off
  rx1358_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1361_done
    goto rxscan1361_scan
  rxscan1361_loop:
    ($P10) = rx1358_cur."from"()
    inc $P10
    set rx1358_pos, $P10
    ge rx1358_pos, rx1358_eos, rxscan1361_done
  rxscan1361_scan:
    set_addr $I10, rxscan1361_loop
    rx1358_cur."!mark_push"(0, rx1358_pos, $I10)
  rxscan1361_done:
.annotate 'line', 573
  # rx enumcharlist negate=0 zerowidth
    ge rx1358_pos, rx1358_eos, rx1358_fail
    sub $I10, rx1358_pos, rx1358_off
    substr $S10, rx1358_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1358_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1358_cur."!cursor_pos"(rx1358_pos)
    .const 'Sub' $P1363 = "349_1277356913.9538" 
    capture_lex $P1363
    $P10 = rx1358_cur."before"($P1363)
    unless $P10, rx1358_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1358_cur."!cursor_pos"(rx1358_pos)
    $P10 = rx1358_cur."LANG"("MAIN", "variable")
    unless $P10, rx1358_fail
    rx1358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1358_pos = $P10."pos"()
.annotate 'line', 572
  # rx pass
    rx1358_cur."!cursor_pass"(rx1358_pos, "metachar:sym<nqpvar>")
    rx1358_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1358_pos)
    .return (rx1358_cur)
  rx1358_fail:
.annotate 'line', 563
    (rx1358_rep, rx1358_pos, $I10, $P10) = rx1358_cur."!mark_fail"(0)
    lt rx1358_pos, -1, rx1358_done
    eq rx1358_pos, -1, rx1358_fail
    jump $I10
  rx1358_done:
    rx1358_cur."!cursor_fail"()
    rx1358_cur."!cursor_debug"("FAIL  ", "metachar:sym<nqpvar>")
    .return (rx1358_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("348_1277356913.9538") :method
.annotate 'line', 563
    new $P1360, "ResizablePMCArray"
    push $P1360, "$"
    push $P1360, "@"
    .return ($P1360)
.end


.namespace ["NQP";"Regex"]
.sub "_block1362"  :anon :subid("349_1277356913.9538") :method :outer("347_1277356913.9538")
.annotate 'line', 573
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
    gt rx1364_pos, rx1364_eos, rx1364_done
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
  # rx charclass .
    ge rx1364_pos, rx1364_eos, rx1364_fail
    inc rx1364_pos
  # rx charclass w
    ge rx1364_pos, rx1364_eos, rx1364_fail
    sub $I10, rx1364_pos, rx1364_off
    is_cclass $I11, 8192, rx1364_tgt, $I10
    unless $I11, rx1364_fail
    inc rx1364_pos
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
.sub "assertion:sym<{ }>"  :subid("350_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .local string rx1367_tgt
    .local int rx1367_pos
    .local int rx1367_off
    .local int rx1367_eos
    .local int rx1367_rep
    .local pmc rx1367_cur
    (rx1367_cur, rx1367_pos, rx1367_tgt) = self."!cursor_start"()
    rx1367_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1367_cur
    .local pmc match
    .lex "$/", match
    length rx1367_eos, rx1367_tgt
    gt rx1367_pos, rx1367_eos, rx1367_done
    set rx1367_off, 0
    lt rx1367_pos, 2, rx1367_start
    sub rx1367_off, rx1367_pos, 1
    substr rx1367_tgt, rx1367_tgt, rx1367_off
  rx1367_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1370_done
    goto rxscan1370_scan
  rxscan1370_loop:
    ($P10) = rx1367_cur."from"()
    inc $P10
    set rx1367_pos, $P10
    ge rx1367_pos, rx1367_eos, rxscan1370_done
  rxscan1370_scan:
    set_addr $I10, rxscan1370_loop
    rx1367_cur."!mark_push"(0, rx1367_pos, $I10)
  rxscan1370_done:
.annotate 'line', 577
  # rx enumcharlist negate=0 zerowidth
    ge rx1367_pos, rx1367_eos, rx1367_fail
    sub $I10, rx1367_pos, rx1367_off
    substr $S10, rx1367_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1367_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1367_cur."!cursor_pos"(rx1367_pos)
    $P10 = rx1367_cur."codeblock"()
    unless $P10, rx1367_fail
    rx1367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1367_pos = $P10."pos"()
.annotate 'line', 576
  # rx pass
    rx1367_cur."!cursor_pass"(rx1367_pos, "assertion:sym<{ }>")
    rx1367_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1367_pos)
    .return (rx1367_cur)
  rx1367_fail:
.annotate 'line', 563
    (rx1367_rep, rx1367_pos, $I10, $P10) = rx1367_cur."!mark_fail"(0)
    lt rx1367_pos, -1, rx1367_done
    eq rx1367_pos, -1, rx1367_fail
    jump $I10
  rx1367_done:
    rx1367_cur."!cursor_fail"()
    rx1367_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1367_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("351_1277356913.9538") :method
.annotate 'line', 563
    new $P1369, "ResizablePMCArray"
    push $P1369, "{"
    .return ($P1369)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("352_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .const 'Sub' $P1377 = "354_1277356913.9538" 
    capture_lex $P1377
    .local string rx1372_tgt
    .local int rx1372_pos
    .local int rx1372_off
    .local int rx1372_eos
    .local int rx1372_rep
    .local pmc rx1372_cur
    (rx1372_cur, rx1372_pos, rx1372_tgt) = self."!cursor_start"()
    rx1372_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
    .lex unicode:"$\x{a2}", rx1372_cur
    .local pmc match
    .lex "$/", match
    length rx1372_eos, rx1372_tgt
    gt rx1372_pos, rx1372_eos, rx1372_done
    set rx1372_off, 0
    lt rx1372_pos, 2, rx1372_start
    sub rx1372_off, rx1372_pos, 1
    substr rx1372_tgt, rx1372_tgt, rx1372_off
  rx1372_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1375_done
    goto rxscan1375_scan
  rxscan1375_loop:
    ($P10) = rx1372_cur."from"()
    inc $P10
    set rx1372_pos, $P10
    ge rx1372_pos, rx1372_eos, rxscan1375_done
  rxscan1375_scan:
    set_addr $I10, rxscan1375_loop
    rx1372_cur."!mark_push"(0, rx1372_pos, $I10)
  rxscan1375_done:
.annotate 'line', 581
  # rx subcapture "zw"
    set_addr $I10, rxcap_1380_fail
    rx1372_cur."!mark_push"(0, rx1372_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1372_pos, rx1372_eos, rx1372_fail
    sub $I10, rx1372_pos, rx1372_off
    substr $S10, rx1372_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1372_fail
    inc rx1372_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1372_cur."!cursor_pos"(rx1372_pos)
    .const 'Sub' $P1377 = "354_1277356913.9538" 
    capture_lex $P1377
    $P10 = rx1372_cur."before"($P1377)
    unless $P10, rx1372_fail
    set_addr $I10, rxcap_1380_fail
    ($I12, $I11) = rx1372_cur."!mark_peek"($I10)
    rx1372_cur."!cursor_pos"($I11)
    ($P10) = rx1372_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1372_pos, "")
    rx1372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1380_done
  rxcap_1380_fail:
    goto rx1372_fail
  rxcap_1380_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1372_cur."!cursor_pos"(rx1372_pos)
    $P10 = rx1372_cur."codeblock"()
    unless $P10, rx1372_fail
    rx1372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1372_pos = $P10."pos"()
.annotate 'line', 580
  # rx pass
    rx1372_cur."!cursor_pass"(rx1372_pos, "assertion:sym<?{ }>")
    rx1372_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1372_pos)
    .return (rx1372_cur)
  rx1372_fail:
.annotate 'line', 563
    (rx1372_rep, rx1372_pos, $I10, $P10) = rx1372_cur."!mark_fail"(0)
    lt rx1372_pos, -1, rx1372_done
    eq rx1372_pos, -1, rx1372_fail
    jump $I10
  rx1372_done:
    rx1372_cur."!cursor_fail"()
    rx1372_cur."!cursor_debug"("FAIL  ", "assertion:sym<?{ }>")
    .return (rx1372_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("353_1277356913.9538") :method
.annotate 'line', 563
    new $P1374, "ResizablePMCArray"
    push $P1374, "!"
    push $P1374, "?"
    .return ($P1374)
.end


.namespace ["NQP";"Regex"]
.sub "_block1376"  :anon :subid("354_1277356913.9538") :method :outer("352_1277356913.9538")
.annotate 'line', 581
    .local string rx1378_tgt
    .local int rx1378_pos
    .local int rx1378_off
    .local int rx1378_eos
    .local int rx1378_rep
    .local pmc rx1378_cur
    (rx1378_cur, rx1378_pos, rx1378_tgt) = self."!cursor_start"()
    rx1378_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1378_cur
    .local pmc match
    .lex "$/", match
    length rx1378_eos, rx1378_tgt
    gt rx1378_pos, rx1378_eos, rx1378_done
    set rx1378_off, 0
    lt rx1378_pos, 2, rx1378_start
    sub rx1378_off, rx1378_pos, 1
    substr rx1378_tgt, rx1378_tgt, rx1378_off
  rx1378_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1379_done
    goto rxscan1379_scan
  rxscan1379_loop:
    ($P10) = rx1378_cur."from"()
    inc $P10
    set rx1378_pos, $P10
    ge rx1378_pos, rx1378_eos, rxscan1379_done
  rxscan1379_scan:
    set_addr $I10, rxscan1379_loop
    rx1378_cur."!mark_push"(0, rx1378_pos, $I10)
  rxscan1379_done:
  # rx literal  "{"
    add $I11, rx1378_pos, 1
    gt $I11, rx1378_eos, rx1378_fail
    sub $I11, rx1378_pos, rx1378_off
    substr $S10, rx1378_tgt, $I11, 1
    ne $S10, "{", rx1378_fail
    add rx1378_pos, 1
  # rx pass
    rx1378_cur."!cursor_pass"(rx1378_pos, "")
    rx1378_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1378_pos)
    .return (rx1378_cur)
  rx1378_fail:
    (rx1378_rep, rx1378_pos, $I10, $P10) = rx1378_cur."!mark_fail"(0)
    lt rx1378_pos, -1, rx1378_done
    eq rx1378_pos, -1, rx1378_fail
    jump $I10
  rx1378_done:
    rx1378_cur."!cursor_fail"()
    rx1378_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1378_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("355_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .const 'Sub' $P1390 = "357_1277356913.9538" 
    capture_lex $P1390
    .local string rx1382_tgt
    .local int rx1382_pos
    .local int rx1382_off
    .local int rx1382_eos
    .local int rx1382_rep
    .local pmc rx1382_cur
    (rx1382_cur, rx1382_pos, rx1382_tgt) = self."!cursor_start"()
    rx1382_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1382_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
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
.annotate 'line', 585
  # rx subrule "identifier" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."identifier"()
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1382_pos = $P10."pos"()
.annotate 'line', 592
  # rx rxquantr1387 ** 0..1
    set_addr $I1393, rxquantr1387_done
    rx1382_cur."!mark_push"(0, rx1382_pos, $I1393)
  rxquantr1387_loop:
  alt1388_0:
.annotate 'line', 586
    set_addr $I10, alt1388_1
    rx1382_cur."!mark_push"(0, rx1382_pos, $I10)
.annotate 'line', 587
  # rx subrule "before" subtype=zerowidth negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    .const 'Sub' $P1390 = "357_1277356913.9538" 
    capture_lex $P1390
    $P10 = rx1382_cur."before"($P1390)
    unless $P10, rx1382_fail
    goto alt1388_end
  alt1388_1:
    set_addr $I10, alt1388_2
    rx1382_cur."!mark_push"(0, rx1382_pos, $I10)
.annotate 'line', 588
  # rx literal  "="
    add $I11, rx1382_pos, 1
    gt $I11, rx1382_eos, rx1382_fail
    sub $I11, rx1382_pos, rx1382_off
    substr $S10, rx1382_tgt, $I11, 1
    ne $S10, "=", rx1382_fail
    add rx1382_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."assertion"()
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1382_pos = $P10."pos"()
    goto alt1388_end
  alt1388_2:
    set_addr $I10, alt1388_3
    rx1382_cur."!mark_push"(0, rx1382_pos, $I10)
.annotate 'line', 589
  # rx literal  ":"
    add $I11, rx1382_pos, 1
    gt $I11, rx1382_eos, rx1382_fail
    sub $I11, rx1382_pos, rx1382_off
    substr $S10, rx1382_tgt, $I11, 1
    ne $S10, ":", rx1382_fail
    add rx1382_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."arglist"()
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1382_pos = $P10."pos"()
    goto alt1388_end
  alt1388_3:
    set_addr $I10, alt1388_4
    rx1382_cur."!mark_push"(0, rx1382_pos, $I10)
.annotate 'line', 590
  # rx literal  "("
    add $I11, rx1382_pos, 1
    gt $I11, rx1382_eos, rx1382_fail
    sub $I11, rx1382_pos, rx1382_off
    substr $S10, rx1382_tgt, $I11, 1
    ne $S10, "(", rx1382_fail
    add rx1382_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1382_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1382_pos, 1
    gt $I11, rx1382_eos, rx1382_fail
    sub $I11, rx1382_pos, rx1382_off
    substr $S10, rx1382_tgt, $I11, 1
    ne $S10, ")", rx1382_fail
    add rx1382_pos, 1
    goto alt1388_end
  alt1388_4:
.annotate 'line', 591
  # rx subrule "normspace" subtype=method negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."normspace"()
    unless $P10, rx1382_fail
    rx1382_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1382_cur."!cursor_pos"(rx1382_pos)
    $P10 = rx1382_cur."nibbler"()
    unless $P10, rx1382_fail
    rx1382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1382_pos = $P10."pos"()
  alt1388_end:
.annotate 'line', 592
    (rx1382_rep) = rx1382_cur."!mark_commit"($I1393)
  rxquantr1387_done:
.annotate 'line', 584
  # rx pass
    rx1382_cur."!cursor_pass"(rx1382_pos, "assertion:sym<name>")
    rx1382_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1382_pos)
    .return (rx1382_cur)
  rx1382_fail:
.annotate 'line', 563
    (rx1382_rep, rx1382_pos, $I10, $P10) = rx1382_cur."!mark_fail"(0)
    lt rx1382_pos, -1, rx1382_done
    eq rx1382_pos, -1, rx1382_fail
    jump $I10
  rx1382_done:
    rx1382_cur."!cursor_fail"()
    rx1382_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1382_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("356_1277356913.9538") :method
.annotate 'line', 563
    $P1384 = self."!PREFIX__!subrule"("identifier", "")
    new $P1385, "ResizablePMCArray"
    push $P1385, $P1384
    .return ($P1385)
.end


.namespace ["NQP";"Regex"]
.sub "_block1389"  :anon :subid("357_1277356913.9538") :method :outer("355_1277356913.9538")
.annotate 'line', 587
    .local string rx1391_tgt
    .local int rx1391_pos
    .local int rx1391_off
    .local int rx1391_eos
    .local int rx1391_rep
    .local pmc rx1391_cur
    (rx1391_cur, rx1391_pos, rx1391_tgt) = self."!cursor_start"()
    rx1391_cur."!cursor_debug"("START ", "")
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
  # rx literal  ">"
    add $I11, rx1391_pos, 1
    gt $I11, rx1391_eos, rx1391_fail
    sub $I11, rx1391_pos, rx1391_off
    substr $S10, rx1391_tgt, $I11, 1
    ne $S10, ">", rx1391_fail
    add rx1391_pos, 1
  # rx pass
    rx1391_cur."!cursor_pass"(rx1391_pos, "")
    rx1391_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1391_pos)
    .return (rx1391_cur)
  rx1391_fail:
    (rx1391_rep, rx1391_pos, $I10, $P10) = rx1391_cur."!mark_fail"(0)
    lt rx1391_pos, -1, rx1391_done
    eq rx1391_pos, -1, rx1391_fail
    jump $I10
  rx1391_done:
    rx1391_cur."!cursor_fail"()
    rx1391_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1391_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("358_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .local string rx1395_tgt
    .local int rx1395_pos
    .local int rx1395_off
    .local int rx1395_eos
    .local int rx1395_rep
    .local pmc rx1395_cur
    (rx1395_cur, rx1395_pos, rx1395_tgt) = self."!cursor_start"()
    rx1395_cur."!cursor_debug"("START ", "assertion:sym<var>")
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
    $I10 = self.'from'()
    ne $I10, -1, rxscan1398_done
    goto rxscan1398_scan
  rxscan1398_loop:
    ($P10) = rx1395_cur."from"()
    inc $P10
    set rx1395_pos, $P10
    ge rx1395_pos, rx1395_eos, rxscan1398_done
  rxscan1398_scan:
    set_addr $I10, rxscan1398_loop
    rx1395_cur."!mark_push"(0, rx1395_pos, $I10)
  rxscan1398_done:
.annotate 'line', 596
  # rx enumcharlist negate=0 zerowidth
    ge rx1395_pos, rx1395_eos, rx1395_fail
    sub $I10, rx1395_pos, rx1395_off
    substr $S10, rx1395_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1395_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1395_cur."!cursor_pos"(rx1395_pos)
    $P10 = rx1395_cur."LANG"("MAIN", "variable")
    unless $P10, rx1395_fail
    rx1395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1395_pos = $P10."pos"()
.annotate 'line', 595
  # rx pass
    rx1395_cur."!cursor_pass"(rx1395_pos, "assertion:sym<var>")
    rx1395_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1395_pos)
    .return (rx1395_cur)
  rx1395_fail:
.annotate 'line', 563
    (rx1395_rep, rx1395_pos, $I10, $P10) = rx1395_cur."!mark_fail"(0)
    lt rx1395_pos, -1, rx1395_done
    eq rx1395_pos, -1, rx1395_fail
    jump $I10
  rx1395_done:
    rx1395_cur."!cursor_fail"()
    rx1395_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1395_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("359_1277356913.9538") :method
.annotate 'line', 563
    new $P1397, "ResizablePMCArray"
    push $P1397, "$"
    push $P1397, "@"
    .return ($P1397)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("360_1277356913.9538") :method :outer("341_1277356913.9538")
.annotate 'line', 563
    .local string rx1400_tgt
    .local int rx1400_pos
    .local int rx1400_off
    .local int rx1400_eos
    .local int rx1400_rep
    .local pmc rx1400_cur
    (rx1400_cur, rx1400_pos, rx1400_tgt) = self."!cursor_start"()
    rx1400_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1400_cur
    .local pmc match
    .lex "$/", match
    length rx1400_eos, rx1400_tgt
    gt rx1400_pos, rx1400_eos, rx1400_done
    set rx1400_off, 0
    lt rx1400_pos, 2, rx1400_start
    sub rx1400_off, rx1400_pos, 1
    substr rx1400_tgt, rx1400_tgt, rx1400_off
  rx1400_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1404_done
    goto rxscan1404_scan
  rxscan1404_loop:
    ($P10) = rx1400_cur."from"()
    inc $P10
    set rx1400_pos, $P10
    ge rx1400_pos, rx1400_eos, rxscan1404_done
  rxscan1404_scan:
    set_addr $I10, rxscan1404_loop
    rx1400_cur."!mark_push"(0, rx1400_pos, $I10)
  rxscan1404_done:
.annotate 'line', 600
  # rx subrule "LANG" subtype=capture negate=
    rx1400_cur."!cursor_pos"(rx1400_pos)
    $P10 = rx1400_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1400_fail
    rx1400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1400_pos = $P10."pos"()
.annotate 'line', 599
  # rx pass
    rx1400_cur."!cursor_pass"(rx1400_pos, "codeblock")
    rx1400_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1400_pos)
    .return (rx1400_cur)
  rx1400_fail:
.annotate 'line', 563
    (rx1400_rep, rx1400_pos, $I10, $P10) = rx1400_cur."!mark_fail"(0)
    lt rx1400_pos, -1, rx1400_done
    eq rx1400_pos, -1, rx1400_fail
    jump $I10
  rx1400_done:
    rx1400_cur."!cursor_fail"()
    rx1400_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1400_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("361_1277356913.9538") :method
.annotate 'line', 563
    $P1402 = self."!PREFIX__!subrule"("LANG", "")
    new $P1403, "ResizablePMCArray"
    push $P1403, $P1402
    .return ($P1403)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1406" :load :anon :subid("362_1277356913.9538")
.annotate 'line', 4
    .const 'Sub' $P1408 = "11_1277356913.9538" 
    $P1409 = $P1408()
    .return ($P1409)
.end


.namespace []
.sub "_block1427" :load :anon :subid("363_1277356913.9538")
.annotate 'line', 1
    .const 'Sub' $P1429 = "10_1277356913.9538" 
    $P1430 = $P1429()
    .return ($P1430)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1277356919.52295")
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
    .const 'Sub' $P2426 = "143_1277356919.52295" 
    .return ($P2426)
.end


.namespace []
.sub "" :load :init :subid("post144") :outer("10_1277356919.52295")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1277356919.52295" 
    .local pmc block
    set block, $P12
    $P2429 = get_root_global ["parrot"], "P6metaclass"
    $P2429."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1277356919.52295") :outer("10_1277356919.52295")
.annotate 'line', 3
    .const 'Sub' $P2420 = "142_1277356919.52295" 
    capture_lex $P2420
    get_hll_global $P2303, ["NQP";"RegexActions"], "_block2302" 
    capture_lex $P2303
    .const 'Sub' $P2292 = "132_1277356919.52295" 
    capture_lex $P2292
    .const 'Sub' $P2285 = "131_1277356919.52295" 
    capture_lex $P2285
    .const 'Sub' $P2278 = "130_1277356919.52295" 
    capture_lex $P2278
    .const 'Sub' $P2271 = "129_1277356919.52295" 
    capture_lex $P2271
    .const 'Sub' $P2258 = "128_1277356919.52295" 
    capture_lex $P2258
    .const 'Sub' $P2248 = "127_1277356919.52295" 
    capture_lex $P2248
    .const 'Sub' $P2238 = "126_1277356919.52295" 
    capture_lex $P2238
    .const 'Sub' $P2228 = "125_1277356919.52295" 
    capture_lex $P2228
    .const 'Sub' $P2221 = "124_1277356919.52295" 
    capture_lex $P2221
    .const 'Sub' $P2207 = "123_1277356919.52295" 
    capture_lex $P2207
    .const 'Sub' $P2197 = "122_1277356919.52295" 
    capture_lex $P2197
    .const 'Sub' $P2160 = "121_1277356919.52295" 
    capture_lex $P2160
    .const 'Sub' $P2146 = "120_1277356919.52295" 
    capture_lex $P2146
    .const 'Sub' $P2136 = "119_1277356919.52295" 
    capture_lex $P2136
    .const 'Sub' $P2126 = "118_1277356919.52295" 
    capture_lex $P2126
    .const 'Sub' $P2116 = "117_1277356919.52295" 
    capture_lex $P2116
    .const 'Sub' $P2106 = "116_1277356919.52295" 
    capture_lex $P2106
    .const 'Sub' $P2096 = "115_1277356919.52295" 
    capture_lex $P2096
    .const 'Sub' $P2068 = "114_1277356919.52295" 
    capture_lex $P2068
    .const 'Sub' $P2051 = "113_1277356919.52295" 
    capture_lex $P2051
    .const 'Sub' $P2041 = "112_1277356919.52295" 
    capture_lex $P2041
    .const 'Sub' $P2028 = "111_1277356919.52295" 
    capture_lex $P2028
    .const 'Sub' $P2015 = "110_1277356919.52295" 
    capture_lex $P2015
    .const 'Sub' $P2002 = "109_1277356919.52295" 
    capture_lex $P2002
    .const 'Sub' $P1992 = "108_1277356919.52295" 
    capture_lex $P1992
    .const 'Sub' $P1963 = "107_1277356919.52295" 
    capture_lex $P1963
    .const 'Sub' $P1939 = "106_1277356919.52295" 
    capture_lex $P1939
    .const 'Sub' $P1929 = "105_1277356919.52295" 
    capture_lex $P1929
    .const 'Sub' $P1919 = "104_1277356919.52295" 
    capture_lex $P1919
    .const 'Sub' $P1892 = "103_1277356919.52295" 
    capture_lex $P1892
    .const 'Sub' $P1874 = "102_1277356919.52295" 
    capture_lex $P1874
    .const 'Sub' $P1864 = "101_1277356919.52295" 
    capture_lex $P1864
    .const 'Sub' $P1760 = "98_1277356919.52295" 
    capture_lex $P1760
    .const 'Sub' $P1750 = "97_1277356919.52295" 
    capture_lex $P1750
    .const 'Sub' $P1721 = "96_1277356919.52295" 
    capture_lex $P1721
    .const 'Sub' $P1679 = "95_1277356919.52295" 
    capture_lex $P1679
    .const 'Sub' $P1663 = "94_1277356919.52295" 
    capture_lex $P1663
    .const 'Sub' $P1654 = "93_1277356919.52295" 
    capture_lex $P1654
    .const 'Sub' $P1622 = "92_1277356919.52295" 
    capture_lex $P1622
    .const 'Sub' $P1523 = "89_1277356919.52295" 
    capture_lex $P1523
    .const 'Sub' $P1506 = "88_1277356919.52295" 
    capture_lex $P1506
    .const 'Sub' $P1486 = "87_1277356919.52295" 
    capture_lex $P1486
    .const 'Sub' $P1374 = "84_1277356919.52295" 
    capture_lex $P1374
    .const 'Sub' $P1317 = "80_1277356919.52295" 
    capture_lex $P1317
    .const 'Sub' $P1277 = "78_1277356919.52295" 
    capture_lex $P1277
    .const 'Sub' $P1227 = "76_1277356919.52295" 
    capture_lex $P1227
    .const 'Sub' $P1217 = "75_1277356919.52295" 
    capture_lex $P1217
    .const 'Sub' $P1207 = "74_1277356919.52295" 
    capture_lex $P1207
    .const 'Sub' $P1136 = "72_1277356919.52295" 
    capture_lex $P1136
    .const 'Sub' $P1126 = "71_1277356919.52295" 
    capture_lex $P1126
    .const 'Sub' $P1109 = "70_1277356919.52295" 
    capture_lex $P1109
    .const 'Sub' $P1092 = "69_1277356919.52295" 
    capture_lex $P1092
    .const 'Sub' $P1075 = "68_1277356919.52295" 
    capture_lex $P1075
    .const 'Sub' $P1065 = "67_1277356919.52295" 
    capture_lex $P1065
    .const 'Sub' $P1055 = "66_1277356919.52295" 
    capture_lex $P1055
    .const 'Sub' $P1045 = "65_1277356919.52295" 
    capture_lex $P1045
    .const 'Sub' $P1021 = "64_1277356919.52295" 
    capture_lex $P1021
    .const 'Sub' $P968 = "63_1277356919.52295" 
    capture_lex $P968
    .const 'Sub' $P958 = "62_1277356919.52295" 
    capture_lex $P958
    .const 'Sub' $P869 = "60_1277356919.52295" 
    capture_lex $P869
    .const 'Sub' $P843 = "59_1277356919.52295" 
    capture_lex $P843
    .const 'Sub' $P827 = "58_1277356919.52295" 
    capture_lex $P827
    .const 'Sub' $P817 = "57_1277356919.52295" 
    capture_lex $P817
    .const 'Sub' $P807 = "56_1277356919.52295" 
    capture_lex $P807
    .const 'Sub' $P797 = "55_1277356919.52295" 
    capture_lex $P797
    .const 'Sub' $P787 = "54_1277356919.52295" 
    capture_lex $P787
    .const 'Sub' $P777 = "53_1277356919.52295" 
    capture_lex $P777
    .const 'Sub' $P767 = "52_1277356919.52295" 
    capture_lex $P767
    .const 'Sub' $P757 = "51_1277356919.52295" 
    capture_lex $P757
    .const 'Sub' $P747 = "50_1277356919.52295" 
    capture_lex $P747
    .const 'Sub' $P737 = "49_1277356919.52295" 
    capture_lex $P737
    .const 'Sub' $P727 = "48_1277356919.52295" 
    capture_lex $P727
    .const 'Sub' $P717 = "47_1277356919.52295" 
    capture_lex $P717
    .const 'Sub' $P707 = "46_1277356919.52295" 
    capture_lex $P707
    .const 'Sub' $P697 = "45_1277356919.52295" 
    capture_lex $P697
    .const 'Sub' $P679 = "44_1277356919.52295" 
    capture_lex $P679
    .const 'Sub' $P644 = "43_1277356919.52295" 
    capture_lex $P644
    .const 'Sub' $P628 = "42_1277356919.52295" 
    capture_lex $P628
    .const 'Sub' $P607 = "41_1277356919.52295" 
    capture_lex $P607
    .const 'Sub' $P587 = "40_1277356919.52295" 
    capture_lex $P587
    .const 'Sub' $P574 = "39_1277356919.52295" 
    capture_lex $P574
    .const 'Sub' $P548 = "38_1277356919.52295" 
    capture_lex $P548
    .const 'Sub' $P512 = "37_1277356919.52295" 
    capture_lex $P512
    .const 'Sub' $P495 = "36_1277356919.52295" 
    capture_lex $P495
    .const 'Sub' $P481 = "35_1277356919.52295" 
    capture_lex $P481
    .const 'Sub' $P428 = "33_1277356919.52295" 
    capture_lex $P428
    .const 'Sub' $P417 = "32_1277356919.52295" 
    capture_lex $P417
    .const 'Sub' $P404 = "31_1277356919.52295" 
    capture_lex $P404
    .const 'Sub' $P384 = "30_1277356919.52295" 
    capture_lex $P384
    .const 'Sub' $P374 = "29_1277356919.52295" 
    capture_lex $P374
    .const 'Sub' $P364 = "28_1277356919.52295" 
    capture_lex $P364
    .const 'Sub' $P348 = "27_1277356919.52295" 
    capture_lex $P348
    .const 'Sub' $P288 = "25_1277356919.52295" 
    capture_lex $P288
    .const 'Sub' $P245 = "23_1277356919.52295" 
    capture_lex $P245
    .const 'Sub' $P213 = "22_1277356919.52295" 
    capture_lex $P213
    .const 'Sub' $P180 = "21_1277356919.52295" 
    capture_lex $P180
    .const 'Sub' $P170 = "20_1277356919.52295" 
    capture_lex $P170
    .const 'Sub' $P151 = "19_1277356919.52295" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1277356919.52295" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1277356919.52295" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1277356919.52295" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1277356919.52295" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1277356919.52295" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_147
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_147:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1277356919.52295" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1277356919.52295" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1277356919.52295" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1277356919.52295" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 213
    .const 'Sub' $P100 = "18_1277356919.52295" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 822
    .const 'Sub' $P151 = "19_1277356919.52295" 
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
    .const 'Sub' $P2416 = "141_1277356919.52295" 
    .return ($P2416)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post145") :outer("11_1277356919.52295")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2420 = "142_1277356919.52295" 
    capture_lex $P2420
    $P2420()
    $P2423 = get_root_global ["parrot"], "P6metaclass"
    $P2423."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2419"  :anon :subid("142_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "xblock_immediate"  :subid("12_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "block_immediate"  :subid("13_1277356919.52295") :outer("11_1277356919.52295")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1277356919.52295" 
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
    .const 'Sub' $P40 = "14_1277356919.52295" 
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
.sub "_block39"  :anon :subid("14_1277356919.52295") :outer("13_1277356919.52295")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1277356919.52295" 
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
    .const 'Sub' $P51 = "15_1277356919.52295" 
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
.sub "_block50"  :anon :subid("15_1277356919.52295") :outer("14_1277356919.52295")
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
.sub "vivitype"  :subid("16_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "colonpair_str"  :subid("17_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "push_block_handler"  :subid("18_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "control"  :subid("19_1277356919.52295") :outer("11_1277356919.52295")
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
.sub "TOP"  :subid("20_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "deflongname"  :subid("21_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "comp_unit"  :subid("22_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statementlist"  :subid("23_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_248
.annotate 'line', 76
    .const 'Sub' $P262 = "24_1277356919.52295" 
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
    .const 'Sub' $P262 = "24_1277356919.52295" 
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
.sub "_block261"  :anon :subid("24_1277356919.52295") :outer("23_1277356919.52295")
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
.sub "statement"  :subid("25_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_291
    .param pmc param_292 :optional
    .param int has_param_292 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P300 = "26_1277356919.52295" 
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
    .const 'Sub' $P300 = "26_1277356919.52295" 
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
.sub "_block299"  :anon :subid("26_1277356919.52295") :outer("25_1277356919.52295")
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
.sub "xblock"  :subid("27_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "pblock"  :subid("28_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "block"  :subid("29_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "blockoid"  :subid("30_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "newpad"  :subid("31_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "outerctx"  :subid("32_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<if>"  :subid("33_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_431
.annotate 'line', 140
    .const 'Sub' $P459 = "34_1277356919.52295" 
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
    .const 'Sub' $P459 = "34_1277356919.52295" 
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
.sub "_block458"  :anon :subid("34_1277356919.52295") :outer("33_1277356919.52295")
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
.sub "statement_control:sym<unless>"  :subid("35_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<while>"  :subid("36_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<repeat>"  :subid("37_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<for>"  :subid("38_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<return>"  :subid("39_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<CATCH>"  :subid("40_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_prefix:sym<try>"  :subid("43_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "blorst"  :subid("44_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<fatarrow>"  :subid("49_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<colonpair>"  :subid("50_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<variable>"  :subid("51_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<package_declarator>"  :subid("52_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<scope_declarator>"  :subid("53_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<routine_declarator>"  :subid("54_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<regex_declarator>"  :subid("55_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<statement_prefix>"  :subid("56_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<lambda>"  :subid("57_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "fatarrow"  :subid("58_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "colonpair"  :subid("59_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "variable"  :subid("60_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_872
.annotate 'line', 318
    .const 'Sub' $P885 = "61_1277356919.52295" 
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
    .const 'Sub' $P885 = "61_1277356919.52295" 
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
.sub "_block884"  :anon :subid("61_1277356919.52295") :outer("60_1277356919.52295")
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
.sub "package_declarator:sym<module>"  :subid("62_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "package_declarator:sym<class>"  :subid("63_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "package_def"  :subid("64_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "scope_declarator:sym<my>"  :subid("65_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "scope_declarator:sym<our>"  :subid("66_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "scope_declarator:sym<has>"  :subid("67_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "scoped"  :subid("68_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "declarator"  :subid("69_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "multi_declarator:sym<multi>"  :subid("70_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "multi_declarator:sym<null>"  :subid("71_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "variable_declarator"  :subid("72_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1139
.annotate 'line', 407
    .const 'Sub' $P1179 = "73_1277356919.52295" 
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
    .const 'Sub' $P1179 = "73_1277356919.52295" 
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
.sub "_block1178"  :anon :subid("73_1277356919.52295") :outer("72_1277356919.52295")
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
.sub "routine_declarator:sym<sub>"  :subid("74_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "routine_declarator:sym<method>"  :subid("75_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "routine_def"  :subid("76_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1230
.annotate 'line', 438
    .const 'Sub' $P1241 = "77_1277356919.52295" 
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
    .const 'Sub' $P1241 = "77_1277356919.52295" 
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
.sub "_block1240"  :anon :subid("77_1277356919.52295") :outer("76_1277356919.52295")
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
.sub "method_def"  :subid("78_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1280
.annotate 'line', 456
    .const 'Sub' $P1296 = "79_1277356919.52295" 
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
    .const 'Sub' $P1296 = "79_1277356919.52295" 
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
.sub "_block1295"  :anon :subid("79_1277356919.52295") :outer("78_1277356919.52295")
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
.sub "signature"  :subid("80_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1320
.annotate 'line', 471
    .const 'Sub' $P1346 = "82_1277356919.52295" 
    capture_lex $P1346
    .const 'Sub' $P1331 = "81_1277356919.52295" 
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
    .const 'Sub' $P1331 = "81_1277356919.52295" 
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
    .const 'Sub' $P1346 = "82_1277356919.52295" 
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
.sub "_block1330"  :anon :subid("81_1277356919.52295") :outer("80_1277356919.52295")
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
.sub "_block1345"  :anon :subid("82_1277356919.52295") :outer("80_1277356919.52295")
.annotate 'line', 477
    .const 'Sub' $P1355 = "83_1277356919.52295" 
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
    .const 'Sub' $P1355 = "83_1277356919.52295" 
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
.sub "_block1354"  :anon :subid("83_1277356919.52295") :outer("82_1277356919.52295")
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
.sub "parameter"  :subid("84_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1377
.annotate 'line', 486
    .const 'Sub' $P1458 = "85_1277356919.52295" 
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
    .const 'Sub' $P1458 = "85_1277356919.52295" 
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
.sub "_block1457"  :anon :subid("85_1277356919.52295") :outer("84_1277356919.52295")
.annotate 'line', 517
    .const 'Sub' $P1470 = "86_1277356919.52295" 
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
    .const 'Sub' $P1470 = "86_1277356919.52295" 
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
.sub "_block1469"  :anon :subid("86_1277356919.52295") :outer("85_1277356919.52295")
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
.sub "param_var"  :subid("87_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "named_param"  :subid("88_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "regex_declarator"  :subid("89_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1526
    .param pmc param_1527 :optional
    .param int has_param_1527 :opt_flag
.annotate 'line', 540
    .const 'Sub' $P1597 = "91_1277356919.52295" 
    capture_lex $P1597
    .const 'Sub' $P1569 = "90_1277356919.52295" 
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
    .const 'Sub' $P1597 = "91_1277356919.52295" 
    capture_lex $P1597
    $P1597()
    goto if_1564_end
  if_1564:
.annotate 'line', 573
    .const 'Sub' $P1569 = "90_1277356919.52295" 
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
.sub "_block1596"  :anon :subid("91_1277356919.52295") :outer("89_1277356919.52295")
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
.sub "_block1568"  :anon :subid("90_1277356919.52295") :outer("89_1277356919.52295")
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
.sub "dotty"  :subid("92_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<self>"  :subid("93_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<identifier>"  :subid("94_1277356919.52295") :method :outer("11_1277356919.52295")
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
    set $P1673, $P1672["deflongname"]
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
.sub "term:sym<name>"  :subid("95_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<pir::op>"  :subid("96_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "args"  :subid("97_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "arglist"  :subid("98_1277356919.52295") :method :outer("11_1277356919.52295")
    .param pmc param_1763
.annotate 'line', 654
    .const 'Sub' $P1774 = "99_1277356919.52295" 
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
    .const 'Sub' $P1774 = "99_1277356919.52295" 
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
.sub "_block1773"  :anon :subid("99_1277356919.52295") :outer("98_1277356919.52295")
.annotate 'line', 656
    .const 'Sub' $P1795 = "100_1277356919.52295" 
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
    .const 'Sub' $P1795 = "100_1277356919.52295" 
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
.sub "_block1794"  :anon :subid("100_1277356919.52295") :outer("99_1277356919.52295")
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
.sub "term:sym<value>"  :subid("101_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "circumfix:sym<( )>"  :subid("102_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "circumfix:sym<[ ]>"  :subid("103_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "circumfix:sym<ang>"  :subid("104_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("105_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "circumfix:sym<{ }>"  :subid("106_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "circumfix:sym<sigil>"  :subid("107_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "semilist"  :subid("108_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postcircumfix:sym<[ ]>"  :subid("109_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postcircumfix:sym<{ }>"  :subid("110_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postcircumfix:sym<ang>"  :subid("111_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postcircumfix:sym<( )>"  :subid("112_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "value"  :subid("113_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "number"  :subid("114_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<apos>"  :subid("115_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<dblq>"  :subid("116_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<qq>"  :subid("117_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<q>"  :subid("118_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<Q>"  :subid("119_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym<Q:PIR>"  :subid("120_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote:sym</ />"  :subid("121_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote_escape:sym<$>"  :subid("122_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote_escape:sym<{ }>"  :subid("123_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "quote_escape:sym<esc>"  :subid("124_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postfix:sym<.>"  :subid("125_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postfix:sym<++>"  :subid("126_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "postfix:sym<-->"  :subid("127_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "prefix:sym<make>"  :subid("128_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<next>"  :subid("129_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<last>"  :subid("130_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "term:sym<redo>"  :subid("131_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "infix:sym<~~>"  :subid("132_1277356919.52295") :method :outer("11_1277356919.52295")
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
.sub "_block2302"  :subid("133_1277356919.52295") :outer("11_1277356919.52295")
.annotate 'line', 840
    .const 'Sub' $P2388 = "140_1277356919.52295" 
    capture_lex $P2388
    .const 'Sub' $P2375 = "139_1277356919.52295" 
    capture_lex $P2375
    .const 'Sub' $P2358 = "138_1277356919.52295" 
    capture_lex $P2358
    .const 'Sub' $P2345 = "137_1277356919.52295" 
    capture_lex $P2345
    .const 'Sub' $P2332 = "136_1277356919.52295" 
    capture_lex $P2332
    .const 'Sub' $P2319 = "135_1277356919.52295" 
    capture_lex $P2319
    .const 'Sub' $P2304 = "134_1277356919.52295" 
    capture_lex $P2304
.annotate 'line', 874
    .const 'Sub' $P2388 = "140_1277356919.52295" 
    newclosure $P2413, $P2388
.annotate 'line', 840
    .return ($P2413)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("134_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "metachar:sym<{ }>"  :subid("135_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "metachar:sym<nqpvar>"  :subid("136_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "assertion:sym<{ }>"  :subid("137_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "assertion:sym<?{ }>"  :subid("138_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "assertion:sym<var>"  :subid("139_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "codeblock"  :subid("140_1277356919.52295") :method :outer("133_1277356919.52295")
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
.sub "_block2415" :load :anon :subid("141_1277356919.52295")
.annotate 'line', 3
    .const 'Sub' $P2417 = "11_1277356919.52295" 
    $P2418 = $P2417()
    .return ($P2418)
.end


.namespace []
.sub "_block2425" :load :anon :subid("143_1277356919.52295")
.annotate 'line', 1
    .const 'Sub' $P2427 = "10_1277356919.52295" 
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
