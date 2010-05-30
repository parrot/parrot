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
.sub "_block11"  :anon :subid("10_1275160381.56318")
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
    $P1379 = $P14()
.annotate 'line', 1
    .return ($P1379)
    .const 'Sub' $P1381 = "354_1275160381.56318" 
    .return ($P1381)
.end


.namespace []
.sub "" :load :init :subid("post355") :outer("10_1275160381.56318")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275160381.56318" 
    .local pmc block
    set block, $P12
    $P1384 = get_root_global ["parrot"], "P6metaclass"
    $P1384."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1275160381.56318") :outer("10_1275160381.56318")
.annotate 'line', 4
    get_hll_global $P1295, ["NQP";"Regex"], "_block1294" 
    capture_lex $P1295
    .const 'Sub' $P1281 = "331_1275160381.56318" 
    capture_lex $P1281
    .const 'Sub' $P1275 = "329_1275160381.56318" 
    capture_lex $P1275
    .const 'Sub' $P1269 = "327_1275160381.56318" 
    capture_lex $P1269
    .const 'Sub' $P1263 = "325_1275160381.56318" 
    capture_lex $P1263
    .const 'Sub' $P1257 = "323_1275160381.56318" 
    capture_lex $P1257
    .const 'Sub' $P1251 = "321_1275160381.56318" 
    capture_lex $P1251
    .const 'Sub' $P1244 = "319_1275160381.56318" 
    capture_lex $P1244
    .const 'Sub' $P1237 = "317_1275160381.56318" 
    capture_lex $P1237
    .const 'Sub' $P1230 = "315_1275160381.56318" 
    capture_lex $P1230
    .const 'Sub' $P1223 = "313_1275160381.56318" 
    capture_lex $P1223
    .const 'Sub' $P1217 = "311_1275160381.56318" 
    capture_lex $P1217
    .const 'Sub' $P1210 = "309_1275160381.56318" 
    capture_lex $P1210
    .const 'Sub' $P1203 = "307_1275160381.56318" 
    capture_lex $P1203
    .const 'Sub' $P1196 = "305_1275160381.56318" 
    capture_lex $P1196
    .const 'Sub' $P1189 = "303_1275160381.56318" 
    capture_lex $P1189
    .const 'Sub' $P1182 = "301_1275160381.56318" 
    capture_lex $P1182
    .const 'Sub' $P1175 = "299_1275160381.56318" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "297_1275160381.56318" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "295_1275160381.56318" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "293_1275160381.56318" 
    capture_lex $P1154
    .const 'Sub' $P1147 = "291_1275160381.56318" 
    capture_lex $P1147
    .const 'Sub' $P1140 = "289_1275160381.56318" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "287_1275160381.56318" 
    capture_lex $P1133
    .const 'Sub' $P1126 = "285_1275160381.56318" 
    capture_lex $P1126
    .const 'Sub' $P1119 = "283_1275160381.56318" 
    capture_lex $P1119
    .const 'Sub' $P1112 = "281_1275160381.56318" 
    capture_lex $P1112
    .const 'Sub' $P1105 = "279_1275160381.56318" 
    capture_lex $P1105
    .const 'Sub' $P1098 = "277_1275160381.56318" 
    capture_lex $P1098
    .const 'Sub' $P1091 = "275_1275160381.56318" 
    capture_lex $P1091
    .const 'Sub' $P1084 = "273_1275160381.56318" 
    capture_lex $P1084
    .const 'Sub' $P1077 = "271_1275160381.56318" 
    capture_lex $P1077
    .const 'Sub' $P1070 = "269_1275160381.56318" 
    capture_lex $P1070
    .const 'Sub' $P1063 = "267_1275160381.56318" 
    capture_lex $P1063
    .const 'Sub' $P1056 = "265_1275160381.56318" 
    capture_lex $P1056
    .const 'Sub' $P1049 = "263_1275160381.56318" 
    capture_lex $P1049
    .const 'Sub' $P1042 = "261_1275160381.56318" 
    capture_lex $P1042
    .const 'Sub' $P1035 = "259_1275160381.56318" 
    capture_lex $P1035
    .const 'Sub' $P1029 = "257_1275160381.56318" 
    capture_lex $P1029
    .const 'Sub' $P1022 = "255_1275160381.56318" 
    capture_lex $P1022
    .const 'Sub' $P1015 = "253_1275160381.56318" 
    capture_lex $P1015
    .const 'Sub' $P1008 = "251_1275160381.56318" 
    capture_lex $P1008
    .const 'Sub' $P1001 = "249_1275160381.56318" 
    capture_lex $P1001
    .const 'Sub' $P994 = "247_1275160381.56318" 
    capture_lex $P994
    .const 'Sub' $P987 = "245_1275160381.56318" 
    capture_lex $P987
    .const 'Sub' $P980 = "243_1275160381.56318" 
    capture_lex $P980
    .const 'Sub' $P974 = "241_1275160381.56318" 
    capture_lex $P974
    .const 'Sub' $P968 = "239_1275160381.56318" 
    capture_lex $P968
    .const 'Sub' $P963 = "237_1275160381.56318" 
    capture_lex $P963
    .const 'Sub' $P957 = "235_1275160381.56318" 
    capture_lex $P957
    .const 'Sub' $P951 = "233_1275160381.56318" 
    capture_lex $P951
    .const 'Sub' $P946 = "231_1275160381.56318" 
    capture_lex $P946
    .const 'Sub' $P941 = "229_1275160381.56318" 
    capture_lex $P941
    .const 'Sub' $P934 = "227_1275160381.56318" 
    capture_lex $P934
    .const 'Sub' $P926 = "225_1275160381.56318" 
    capture_lex $P926
    .const 'Sub' $P921 = "223_1275160381.56318" 
    capture_lex $P921
    .const 'Sub' $P916 = "221_1275160381.56318" 
    capture_lex $P916
    .const 'Sub' $P911 = "219_1275160381.56318" 
    capture_lex $P911
    .const 'Sub' $P903 = "217_1275160381.56318" 
    capture_lex $P903
    .const 'Sub' $P895 = "215_1275160381.56318" 
    capture_lex $P895
    .const 'Sub' $P890 = "213_1275160381.56318" 
    capture_lex $P890
    .const 'Sub' $P885 = "211_1275160381.56318" 
    capture_lex $P885
    .const 'Sub' $P880 = "209_1275160381.56318" 
    capture_lex $P880
    .const 'Sub' $P874 = "207_1275160381.56318" 
    capture_lex $P874
    .const 'Sub' $P868 = "205_1275160381.56318" 
    capture_lex $P868
    .const 'Sub' $P862 = "203_1275160381.56318" 
    capture_lex $P862
    .const 'Sub' $P856 = "201_1275160381.56318" 
    capture_lex $P856
    .const 'Sub' $P850 = "199_1275160381.56318" 
    capture_lex $P850
    .const 'Sub' $P845 = "197_1275160381.56318" 
    capture_lex $P845
    .const 'Sub' $P840 = "195_1275160381.56318" 
    capture_lex $P840
    .const 'Sub' $P827 = "191_1275160381.56318" 
    capture_lex $P827
    .const 'Sub' $P819 = "189_1275160381.56318" 
    capture_lex $P819
    .const 'Sub' $P813 = "187_1275160381.56318" 
    capture_lex $P813
    .const 'Sub' $P806 = "185_1275160381.56318" 
    capture_lex $P806
    .const 'Sub' $P800 = "183_1275160381.56318" 
    capture_lex $P800
    .const 'Sub' $P792 = "181_1275160381.56318" 
    capture_lex $P792
    .const 'Sub' $P784 = "179_1275160381.56318" 
    capture_lex $P784
    .const 'Sub' $P778 = "177_1275160381.56318" 
    capture_lex $P778
    .const 'Sub' $P772 = "175_1275160381.56318" 
    capture_lex $P772
    .const 'Sub' $P757 = "171_1275160381.56318" 
    capture_lex $P757
    .const 'Sub' $P720 = "169_1275160381.56318" 
    capture_lex $P720
    .const 'Sub' $P712 = "167_1275160381.56318" 
    capture_lex $P712
    .const 'Sub' $P706 = "165_1275160381.56318" 
    capture_lex $P706
    .const 'Sub' $P696 = "163_1275160381.56318" 
    capture_lex $P696
    .const 'Sub' $P682 = "161_1275160381.56318" 
    capture_lex $P682
    .const 'Sub' $P673 = "159_1275160381.56318" 
    capture_lex $P673
    .const 'Sub' $P654 = "157_1275160381.56318" 
    capture_lex $P654
    .const 'Sub' $P630 = "155_1275160381.56318" 
    capture_lex $P630
    .const 'Sub' $P623 = "153_1275160381.56318" 
    capture_lex $P623
    .const 'Sub' $P616 = "151_1275160381.56318" 
    capture_lex $P616
    .const 'Sub' $P606 = "147_1275160381.56318" 
    capture_lex $P606
    .const 'Sub' $P598 = "145_1275160381.56318" 
    capture_lex $P598
    .const 'Sub' $P592 = "143_1275160381.56318" 
    capture_lex $P592
    .const 'Sub' $P578 = "141_1275160381.56318" 
    capture_lex $P578
    .const 'Sub' $P571 = "139_1275160381.56318" 
    capture_lex $P571
    .const 'Sub' $P564 = "137_1275160381.56318" 
    capture_lex $P564
    .const 'Sub' $P557 = "135_1275160381.56318" 
    capture_lex $P557
    .const 'Sub' $P530 = "131_1275160381.56318" 
    capture_lex $P530
    .const 'Sub' $P521 = "129_1275160381.56318" 
    capture_lex $P521
    .const 'Sub' $P514 = "127_1275160381.56318" 
    capture_lex $P514
    .const 'Sub' $P505 = "123_1275160381.56318" 
    capture_lex $P505
    .const 'Sub' $P500 = "121_1275160381.56318" 
    capture_lex $P500
    .const 'Sub' $P488 = "119_1275160381.56318" 
    capture_lex $P488
    .const 'Sub' $P476 = "117_1275160381.56318" 
    capture_lex $P476
    .const 'Sub' $P468 = "115_1275160381.56318" 
    capture_lex $P468
    .const 'Sub' $P463 = "113_1275160381.56318" 
    capture_lex $P463
    .const 'Sub' $P457 = "111_1275160381.56318" 
    capture_lex $P457
    .const 'Sub' $P451 = "109_1275160381.56318" 
    capture_lex $P451
    .const 'Sub' $P445 = "107_1275160381.56318" 
    capture_lex $P445
    .const 'Sub' $P439 = "105_1275160381.56318" 
    capture_lex $P439
    .const 'Sub' $P433 = "103_1275160381.56318" 
    capture_lex $P433
    .const 'Sub' $P427 = "101_1275160381.56318" 
    capture_lex $P427
    .const 'Sub' $P421 = "99_1275160381.56318" 
    capture_lex $P421
    .const 'Sub' $P415 = "97_1275160381.56318" 
    capture_lex $P415
    .const 'Sub' $P407 = "95_1275160381.56318" 
    capture_lex $P407
    .const 'Sub' $P399 = "93_1275160381.56318" 
    capture_lex $P399
    .const 'Sub' $P387 = "89_1275160381.56318" 
    capture_lex $P387
    .const 'Sub' $P379 = "87_1275160381.56318" 
    capture_lex $P379
    .const 'Sub' $P369 = "83_1275160381.56318" 
    capture_lex $P369
    .const 'Sub' $P362 = "81_1275160381.56318" 
    capture_lex $P362
    .const 'Sub' $P355 = "79_1275160381.56318" 
    capture_lex $P355
    .const 'Sub' $P343 = "75_1275160381.56318" 
    capture_lex $P343
    .const 'Sub' $P335 = "73_1275160381.56318" 
    capture_lex $P335
    .const 'Sub' $P327 = "71_1275160381.56318" 
    capture_lex $P327
    .const 'Sub' $P307 = "69_1275160381.56318" 
    capture_lex $P307
    .const 'Sub' $P298 = "67_1275160381.56318" 
    capture_lex $P298
    .const 'Sub' $P280 = "64_1275160381.56318" 
    capture_lex $P280
    .const 'Sub' $P260 = "62_1275160381.56318" 
    capture_lex $P260
    .const 'Sub' $P251 = "58_1275160381.56318" 
    capture_lex $P251
    .const 'Sub' $P246 = "56_1275160381.56318" 
    capture_lex $P246
    .const 'Sub' $P237 = "52_1275160381.56318" 
    capture_lex $P237
    .const 'Sub' $P232 = "50_1275160381.56318" 
    capture_lex $P232
    .const 'Sub' $P227 = "48_1275160381.56318" 
    capture_lex $P227
    .const 'Sub' $P219 = "46_1275160381.56318" 
    capture_lex $P219
    .const 'Sub' $P212 = "44_1275160381.56318" 
    capture_lex $P212
    .const 'Sub' $P206 = "42_1275160381.56318" 
    capture_lex $P206
    .const 'Sub' $P198 = "40_1275160381.56318" 
    capture_lex $P198
    .const 'Sub' $P192 = "38_1275160381.56318" 
    capture_lex $P192
    .const 'Sub' $P186 = "36_1275160381.56318" 
    capture_lex $P186
    .const 'Sub' $P170 = "33_1275160381.56318" 
    capture_lex $P170
    .const 'Sub' $P157 = "31_1275160381.56318" 
    capture_lex $P157
    .const 'Sub' $P150 = "29_1275160381.56318" 
    capture_lex $P150
    .const 'Sub' $P100 = "26_1275160381.56318" 
    capture_lex $P100
    .const 'Sub' $P82 = "23_1275160381.56318" 
    capture_lex $P82
    .const 'Sub' $P68 = "21_1275160381.56318" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1275160381.56318" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1275160381.56318" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1275160381.56318" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1275160381.56318" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1275160381.56318" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 550
    get_hll_global $P1295, ["NQP";"Regex"], "_block1294" 
    capture_lex $P1295
    $P1358 = $P1295()
.annotate 'line', 4
    .return ($P1358)
    .const 'Sub' $P1360 = "353_1275160381.56318" 
    .return ($P1360)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post356") :outer("11_1275160381.56318")
.annotate 'line', 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 434
    get_hll_global $P1363, ["NQP"], "Grammar"
    $P1363."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 435
    get_hll_global $P1364, ["NQP"], "Grammar"
    $P1364."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 436
    get_hll_global $P1365, ["NQP"], "Grammar"
    $P1365."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 437
    get_hll_global $P1366, ["NQP"], "Grammar"
    $P1366."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 438
    get_hll_global $P1367, ["NQP"], "Grammar"
    $P1367."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 439
    get_hll_global $P1368, ["NQP"], "Grammar"
    $P1368."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 440
    get_hll_global $P1369, ["NQP"], "Grammar"
    $P1369."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 441
    get_hll_global $P1370, ["NQP"], "Grammar"
    $P1370."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 442
    get_hll_global $P1371, ["NQP"], "Grammar"
    $P1371."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 443
    get_hll_global $P1372, ["NQP"], "Grammar"
    $P1372."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 444
    get_hll_global $P1373, ["NQP"], "Grammar"
    $P1373."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 445
    get_hll_global $P1374, ["NQP"], "Grammar"
    $P1374."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 446
    get_hll_global $P1375, ["NQP"], "Grammar"
    $P1375."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 447
    get_hll_global $P1376, ["NQP"], "Grammar"
    $P1376."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 448
    get_hll_global $P1377, ["NQP"], "Grammar"
    $P1377."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 433
    $P1378 = get_root_global ["parrot"], "P6metaclass"
    $P1378."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1275160381.56318") :method :outer("11_1275160381.56318")
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
    unless_null $P20, vivify_357
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_358
    die "Contextual %*LANG not found"
  vivify_358:
  vivify_357:
.annotate 'line', 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_359
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_360
    die "Contextual %*LANG not found"
  vivify_360:
    store_lex "%*LANG", $P22
  vivify_359:
    set $P22["Regex"], $P21
.annotate 'line', 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_361
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_362
    die "Contextual %*LANG not found"
  vivify_362:
    store_lex "%*LANG", $P24
  vivify_361:
    set $P24["Regex-actions"], $P23
.annotate 'line', 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_363
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_364
    die "Contextual %*LANG not found"
  vivify_364:
    store_lex "%*LANG", $P26
  vivify_363:
    set $P26["MAIN"], $P25
.annotate 'line', 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_365
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_366
    die "Contextual %*LANG not found"
  vivify_366:
    store_lex "%*LANG", $P28
  vivify_365:
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
.sub "identifier"  :subid("13_1275160381.56318") :method :outer("11_1275160381.56318")
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
.sub "!PREFIX__identifier"  :subid("14_1275160381.56318") :method
.annotate 'line', 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1275160381.56318") :method :outer("11_1275160381.56318")
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
.sub "!PREFIX__name"  :subid("16_1275160381.56318") :method
.annotate 'line', 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1275160381.56318") :method :outer("11_1275160381.56318")
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
.sub "!PREFIX__deflongname"  :subid("18_1275160381.56318") :method
.annotate 'line', 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1275160381.56318") :method :outer("11_1275160381.56318")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1275160381.56318") :method
.annotate 'line', 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1275160381.56318") :method :outer("11_1275160381.56318")
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
.sub "!PREFIX__ws"  :subid("22_1275160381.56318") :method
.annotate 'line', 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .const 'Sub' $P90 = "25_1275160381.56318" 
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
    .const 'Sub' $P90 = "25_1275160381.56318" 
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
.sub "!PREFIX__unv"  :subid("24_1275160381.56318") :method
.annotate 'line', 4
    new $P85, "ResizablePMCArray"
    push $P85, ""
    push $P85, ""
    push $P85, ""
    .return ($P85)
.end


.namespace ["NQP";"Grammar"]
.sub "_block89"  :anon :subid("25_1275160381.56318") :method :outer("23_1275160381.56318")
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
.sub "pod_comment"  :subid("26_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .const 'Sub' $P141 = "28_1275160381.56318" 
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
    .const 'Sub' $P141 = "28_1275160381.56318" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1275160381.56318") :method
.annotate 'line', 4
    new $P103, "ResizablePMCArray"
    push $P103, ""
    .return ($P103)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("28_1275160381.56318") :method :outer("26_1275160381.56318")
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
.sub "comp_unit"  :subid("29_1275160381.56318") :method :outer("11_1275160381.56318")
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
  # rx subrule "outerctx" subtype=method negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."outerctx"()
    unless $P10, rx151_fail
    rx151_pos = $P10."pos"()
.annotate 'line', 85
  # rx subrule "statementlist" subtype=capture negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."statementlist"()
    unless $P10, rx151_fail
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx151_pos = $P10."pos"()
  alt156_0:
.annotate 'line', 86
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
.sub "!PREFIX__comp_unit"  :subid("30_1275160381.56318") :method
.annotate 'line', 4
    $P153 = self."!PREFIX__!subrule"("", "")
    new $P154, "ResizablePMCArray"
    push $P154, $P153
    .return ($P154)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 89
    set_addr $I10, alt162_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate 'line', 90
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
.annotate 'line', 91
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
.annotate 'line', 89
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
.sub "!PREFIX__statementlist"  :subid("32_1275160381.56318") :method
.annotate 'line', 4
    new $P160, "ResizablePMCArray"
    push $P160, ""
    push $P160, ""
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .const 'Sub' $P176 = "35_1275160381.56318" 
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
.annotate 'line', 95
  # rx subrule "before" subtype=zerowidth negate=1
    rx171_cur."!cursor_pos"(rx171_pos)
    .const 'Sub' $P176 = "35_1275160381.56318" 
    capture_lex $P176
    $P10 = rx171_cur."before"($P176)
    if $P10, rx171_fail
  alt180_0:
.annotate 'line', 96
    set_addr $I10, alt180_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 97
  # rx subrule "statement_control" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_control"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx171_pos = $P10."pos"()
    goto alt180_end
  alt180_1:
.annotate 'line', 98
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
.annotate 'line', 103
  # rx rxquantr181 ** 0..1
    set_addr $I185, rxquantr181_done
    rx171_cur."!mark_push"(0, rx171_pos, $I185)
  rxquantr181_loop:
  alt182_0:
.annotate 'line', 99
    set_addr $I10, alt182_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 100
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."MARKED"("endstmt")
    unless $P10, rx171_fail
    goto alt182_end
  alt182_1:
    set_addr $I10, alt182_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
.annotate 'line', 101
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
.annotate 'line', 102
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."statement_mod_loop"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx171_pos = $P10."pos"()
  alt182_end:
.annotate 'line', 103
    (rx171_rep) = rx171_cur."!mark_commit"($I185)
  rxquantr181_done:
  alt180_end:
.annotate 'line', 94
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
.sub "!PREFIX__statement"  :subid("34_1275160381.56318") :method
.annotate 'line', 4
    new $P173, "ResizablePMCArray"
    push $P173, ""
    .return ($P173)
.end


.namespace ["NQP";"Grammar"]
.sub "_block175"  :anon :subid("35_1275160381.56318") :method :outer("33_1275160381.56318")
.annotate 'line', 95
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
.sub "eat_terminator"  :subid("36_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 107
    set_addr $I10, alt191_1
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 108
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
.annotate 'line', 109
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."MARKED"("endstmt")
    unless $P10, rx187_fail
    goto alt191_end
  alt191_2:
    set_addr $I10, alt191_3
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 110
  # rx subrule "terminator" subtype=zerowidth negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."terminator"()
    unless $P10, rx187_fail
    goto alt191_end
  alt191_3:
.annotate 'line', 111
  # rxanchor eos
    ne rx187_pos, rx187_eos, rx187_fail
  alt191_end:
.annotate 'line', 107
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
.sub "!PREFIX__eat_terminator"  :subid("37_1275160381.56318") :method
.annotate 'line', 4
    new $P189, "ResizablePMCArray"
    push $P189, ""
    push $P189, ""
    push $P189, ""
    push $P189, ";"
    .return ($P189)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 115
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
.annotate 'line', 114
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
.sub "!PREFIX__xblock"  :subid("39_1275160381.56318") :method
.annotate 'line', 4
    $P195 = self."!PREFIX__!subrule"("EXPR", "")
    new $P196, "ResizablePMCArray"
    push $P196, $P195
    .return ($P196)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 118
    set_addr $I10, alt205_1
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
.annotate 'line', 119
  # rx subrule "lambda" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."lambda"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 120
  # rx subrule "newpad" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."newpad"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "signature" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."signature"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx199_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "blockoid" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."blockoid"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx199_pos = $P10."pos"()
.annotate 'line', 119
    goto alt205_end
  alt205_1:
    set_addr $I10, alt205_2
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
.annotate 'line', 123
  # rx enumcharlist negate=0 zerowidth
    ge rx199_pos, rx199_eos, rx199_fail
    sub $I10, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx199_fail
.annotate 'line', 124
  # rx subrule "newpad" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."newpad"()
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
.annotate 'line', 125
  # rx subrule "blockoid" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."blockoid"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx199_pos = $P10."pos"()
.annotate 'line', 123
    goto alt205_end
  alt205_2:
.annotate 'line', 126
  # rx subrule "panic" subtype=method negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."panic"("Missing block")
    unless $P10, rx199_fail
    rx199_pos = $P10."pos"()
  alt205_end:
.annotate 'line', 118
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
.sub "!PREFIX__pblock"  :subid("41_1275160381.56318") :method
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
.sub "lambda"  :subid("42_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 129
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
.sub "!PREFIX__lambda"  :subid("43_1275160381.56318") :method
.annotate 'line', 4
    new $P209, "ResizablePMCArray"
    push $P209, "<->"
    push $P209, "->"
    .return ($P209)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 132
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
.annotate 'line', 133
  # rx subrule "newpad" subtype=method negate=
    rx213_cur."!cursor_pos"(rx213_pos)
    $P10 = rx213_cur."newpad"()
    unless $P10, rx213_fail
    rx213_pos = $P10."pos"()
.annotate 'line', 134
  # rx subrule "blockoid" subtype=capture negate=
    rx213_cur."!cursor_pos"(rx213_pos)
    $P10 = rx213_cur."blockoid"()
    unless $P10, rx213_fail
    rx213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx213_pos = $P10."pos"()
.annotate 'line', 131
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
.sub "!PREFIX__block"  :subid("45_1275160381.56318") :method
.annotate 'line', 4
    $P215 = self."!PREFIX__!subrule"("", "")
    new $P216, "ResizablePMCArray"
    push $P216, $P215
    push $P216, "{"
    .return ($P216)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 138
  # rx subrule "finishpad" subtype=method negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."finishpad"()
    unless $P10, rx220_fail
    rx220_pos = $P10."pos"()
.annotate 'line', 139
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
.annotate 'line', 140
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx220_cur."!cursor_pos"(rx220_pos)
    $P10 = rx220_cur."ENDSTMT"()
    unless $P10, rx220_fail
.annotate 'line', 137
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
.sub "!PREFIX__blockoid"  :subid("47_1275160381.56318") :method
.annotate 'line', 4
    $P222 = self."!PREFIX__!subrule"("", "")
    new $P223, "ResizablePMCArray"
    push $P223, $P222
    .return ($P223)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1275160381.56318") :method :outer("11_1275160381.56318")
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
.annotate 'line', 143
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
.sub "!PREFIX__newpad"  :subid("49_1275160381.56318") :method
.annotate 'line', 4
    new $P230, "ResizablePMCArray"
    push $P230, ""
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx233_tgt
    .local int rx233_pos
    .local int rx233_off
    .local int rx233_eos
    .local int rx233_rep
    .local pmc rx233_cur
    (rx233_cur, rx233_pos, rx233_tgt) = self."!cursor_start"()
    rx233_cur."!cursor_debug"("START ", "outerctx")
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
.annotate 'line', 144
  # rx pass
    rx233_cur."!cursor_pass"(rx233_pos, "outerctx")
    rx233_cur."!cursor_debug"("PASS  ", "outerctx", " at pos=", rx233_pos)
    .return (rx233_cur)
  rx233_fail:
.annotate 'line', 4
    (rx233_rep, rx233_pos, $I10, $P10) = rx233_cur."!mark_fail"(0)
    lt rx233_pos, -1, rx233_done
    eq rx233_pos, -1, rx233_fail
    jump $I10
  rx233_done:
    rx233_cur."!cursor_fail"()
    rx233_cur."!cursor_debug"("FAIL  ", "outerctx")
    .return (rx233_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1275160381.56318") :method
.annotate 'line', 4
    new $P235, "ResizablePMCArray"
    push $P235, ""
    .return ($P235)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx238_tgt
    .local int rx238_pos
    .local int rx238_off
    .local int rx238_eos
    .local int rx238_rep
    .local pmc rx238_cur
    (rx238_cur, rx238_pos, rx238_tgt) = self."!cursor_start"()
    rx238_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx238_cur
    .local pmc match
    .lex "$/", match
    length rx238_eos, rx238_tgt
    set rx238_off, 0
    lt rx238_pos, 2, rx238_start
    sub rx238_off, rx238_pos, 1
    substr rx238_tgt, rx238_tgt, rx238_off
  rx238_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan241_done
    goto rxscan241_scan
  rxscan241_loop:
    ($P10) = rx238_cur."from"()
    inc $P10
    set rx238_pos, $P10
    ge rx238_pos, rx238_eos, rxscan241_done
  rxscan241_scan:
    set_addr $I10, rxscan241_loop
    rx238_cur."!mark_push"(0, rx238_pos, $I10)
  rxscan241_done:
.annotate 'line', 145
  # rx pass
    rx238_cur."!cursor_pass"(rx238_pos, "finishpad")
    rx238_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx238_pos)
    .return (rx238_cur)
  rx238_fail:
.annotate 'line', 4
    (rx238_rep, rx238_pos, $I10, $P10) = rx238_cur."!mark_fail"(0)
    lt rx238_pos, -1, rx238_done
    eq rx238_pos, -1, rx238_fail
    jump $I10
  rx238_done:
    rx238_cur."!cursor_fail"()
    rx238_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx238_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1275160381.56318") :method
.annotate 'line', 4
    new $P240, "ResizablePMCArray"
    push $P240, ""
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1275160381.56318") :method
.annotate 'line', 147
    $P243 = self."!protoregex"("terminator")
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1275160381.56318") :method
.annotate 'line', 147
    $P245 = self."!PREFIX__!protoregex"("terminator")
    .return ($P245)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx247_tgt
    .local int rx247_pos
    .local int rx247_off
    .local int rx247_eos
    .local int rx247_rep
    .local pmc rx247_cur
    (rx247_cur, rx247_pos, rx247_tgt) = self."!cursor_start"()
    rx247_cur."!cursor_debug"("START ", "terminator:sym<;>")
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
.annotate 'line', 149
  # rx enumcharlist negate=0 zerowidth
    ge rx247_pos, rx247_eos, rx247_fail
    sub $I10, rx247_pos, rx247_off
    substr $S10, rx247_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx247_fail
  # rx pass
    rx247_cur."!cursor_pass"(rx247_pos, "terminator:sym<;>")
    rx247_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx247_pos)
    .return (rx247_cur)
  rx247_fail:
.annotate 'line', 4
    (rx247_rep, rx247_pos, $I10, $P10) = rx247_cur."!mark_fail"(0)
    lt rx247_pos, -1, rx247_done
    eq rx247_pos, -1, rx247_fail
    jump $I10
  rx247_done:
    rx247_cur."!cursor_fail"()
    rx247_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1275160381.56318") :method
.annotate 'line', 4
    new $P249, "ResizablePMCArray"
    push $P249, ";"
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    set rx252_off, 0
    lt rx252_pos, 2, rx252_start
    sub rx252_off, rx252_pos, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan255_done
    goto rxscan255_scan
  rxscan255_loop:
    ($P10) = rx252_cur."from"()
    inc $P10
    set rx252_pos, $P10
    ge rx252_pos, rx252_eos, rxscan255_done
  rxscan255_scan:
    set_addr $I10, rxscan255_loop
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  rxscan255_done:
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx252_fail
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "terminator:sym<}>")
    rx252_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx252_pos)
    .return (rx252_cur)
  rx252_fail:
.annotate 'line', 4
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    rx252_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1275160381.56318") :method
.annotate 'line', 4
    new $P254, "ResizablePMCArray"
    push $P254, "}"
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1275160381.56318") :method
.annotate 'line', 154
    $P257 = self."!protoregex"("statement_control")
    .return ($P257)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1275160381.56318") :method
.annotate 'line', 154
    $P259 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P259)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx261_tgt
    .local int rx261_pos
    .local int rx261_off
    .local int rx261_eos
    .local int rx261_rep
    .local pmc rx261_cur
    (rx261_cur, rx261_pos, rx261_tgt) = self."!cursor_start"()
    rx261_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx261_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx261_cur
    .local pmc match
    .lex "$/", match
    length rx261_eos, rx261_tgt
    set rx261_off, 0
    lt rx261_pos, 2, rx261_start
    sub rx261_off, rx261_pos, 1
    substr rx261_tgt, rx261_tgt, rx261_off
  rx261_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan264_done
    goto rxscan264_scan
  rxscan264_loop:
    ($P10) = rx261_cur."from"()
    inc $P10
    set rx261_pos, $P10
    ge rx261_pos, rx261_eos, rxscan264_done
  rxscan264_scan:
    set_addr $I10, rxscan264_loop
    rx261_cur."!mark_push"(0, rx261_pos, $I10)
  rxscan264_done:
.annotate 'line', 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_265_fail
    rx261_cur."!mark_push"(0, rx261_pos, $I10)
  # rx literal  "if"
    add $I11, rx261_pos, 2
    gt $I11, rx261_eos, rx261_fail
    sub $I11, rx261_pos, rx261_off
    substr $S10, rx261_tgt, $I11, 2
    ne $S10, "if", rx261_fail
    add rx261_pos, 2
    set_addr $I10, rxcap_265_fail
    ($I12, $I11) = rx261_cur."!mark_peek"($I10)
    rx261_cur."!cursor_pos"($I11)
    ($P10) = rx261_cur."!cursor_start"()
    $P10."!cursor_pass"(rx261_pos, "")
    rx261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_265_done
  rxcap_265_fail:
    goto rx261_fail
  rxcap_265_done:
  # rx charclass s
    ge rx261_pos, rx261_eos, rx261_fail
    sub $I10, rx261_pos, rx261_off
    is_cclass $I11, 32, rx261_tgt, $I10
    unless $I11, rx261_fail
    inc rx261_pos
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
.annotate 'line', 158
  # rx subrule "xblock" subtype=capture negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."xblock"()
    unless $P10, rx261_fail
    rx261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx261_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
.annotate 'line', 159
  # rx rxquantr268 ** 0..*
    set_addr $I272, rxquantr268_done
    rx261_cur."!mark_push"(0, rx261_pos, $I272)
  rxquantr268_loop:
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx261_pos, 5
    gt $I11, rx261_eos, rx261_fail
    sub $I11, rx261_pos, rx261_off
    substr $S10, rx261_tgt, $I11, 5
    ne $S10, "elsif", rx261_fail
    add rx261_pos, 5
  # rx charclass s
    ge rx261_pos, rx261_eos, rx261_fail
    sub $I10, rx261_pos, rx261_off
    is_cclass $I11, 32, rx261_tgt, $I10
    unless $I11, rx261_fail
    inc rx261_pos
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."xblock"()
    unless $P10, rx261_fail
    rx261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx261_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
    (rx261_rep) = rx261_cur."!mark_commit"($I272)
    rx261_cur."!mark_push"(rx261_rep, rx261_pos, $I272)
    goto rxquantr268_loop
  rxquantr268_done:
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
.annotate 'line', 160
  # rx rxquantr274 ** 0..1
    set_addr $I278, rxquantr274_done
    rx261_cur."!mark_push"(0, rx261_pos, $I278)
  rxquantr274_loop:
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx261_pos, 4
    gt $I11, rx261_eos, rx261_fail
    sub $I11, rx261_pos, rx261_off
    substr $S10, rx261_tgt, $I11, 4
    ne $S10, "else", rx261_fail
    add rx261_pos, 4
  # rx charclass s
    ge rx261_pos, rx261_eos, rx261_fail
    sub $I10, rx261_pos, rx261_off
    is_cclass $I11, 32, rx261_tgt, $I10
    unless $I11, rx261_fail
    inc rx261_pos
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."pblock"()
    unless $P10, rx261_fail
    rx261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx261_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
    (rx261_rep) = rx261_cur."!mark_commit"($I278)
  rxquantr274_done:
  # rx subrule "ws" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."ws"()
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
.annotate 'line', 156
  # rx pass
    rx261_cur."!cursor_pass"(rx261_pos, "statement_control:sym<if>")
    rx261_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx261_pos)
    .return (rx261_cur)
  rx261_fail:
.annotate 'line', 4
    (rx261_rep, rx261_pos, $I10, $P10) = rx261_cur."!mark_fail"(0)
    lt rx261_pos, -1, rx261_done
    eq rx261_pos, -1, rx261_fail
    jump $I10
  rx261_done:
    rx261_cur."!cursor_fail"()
    rx261_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx261_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1275160381.56318") :method
.annotate 'line', 4
    new $P263, "ResizablePMCArray"
    push $P263, "if"
    .return ($P263)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .const 'Sub' $P291 = "66_1275160381.56318" 
    capture_lex $P291
    .local string rx281_tgt
    .local int rx281_pos
    .local int rx281_off
    .local int rx281_eos
    .local int rx281_rep
    .local pmc rx281_cur
    (rx281_cur, rx281_pos, rx281_tgt) = self."!cursor_start"()
    rx281_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx281_cur
    .local pmc match
    .lex "$/", match
    length rx281_eos, rx281_tgt
    set rx281_off, 0
    lt rx281_pos, 2, rx281_start
    sub rx281_off, rx281_pos, 1
    substr rx281_tgt, rx281_tgt, rx281_off
  rx281_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan284_done
    goto rxscan284_scan
  rxscan284_loop:
    ($P10) = rx281_cur."from"()
    inc $P10
    set rx281_pos, $P10
    ge rx281_pos, rx281_eos, rxscan284_done
  rxscan284_scan:
    set_addr $I10, rxscan284_loop
    rx281_cur."!mark_push"(0, rx281_pos, $I10)
  rxscan284_done:
.annotate 'line', 164
  # rx subcapture "sym"
    set_addr $I10, rxcap_285_fail
    rx281_cur."!mark_push"(0, rx281_pos, $I10)
  # rx literal  "unless"
    add $I11, rx281_pos, 6
    gt $I11, rx281_eos, rx281_fail
    sub $I11, rx281_pos, rx281_off
    substr $S10, rx281_tgt, $I11, 6
    ne $S10, "unless", rx281_fail
    add rx281_pos, 6
    set_addr $I10, rxcap_285_fail
    ($I12, $I11) = rx281_cur."!mark_peek"($I10)
    rx281_cur."!cursor_pos"($I11)
    ($P10) = rx281_cur."!cursor_start"()
    $P10."!cursor_pass"(rx281_pos, "")
    rx281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_285_done
  rxcap_285_fail:
    goto rx281_fail
  rxcap_285_done:
  # rx charclass s
    ge rx281_pos, rx281_eos, rx281_fail
    sub $I10, rx281_pos, rx281_off
    is_cclass $I11, 32, rx281_tgt, $I10
    unless $I11, rx281_fail
    inc rx281_pos
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
.annotate 'line', 165
  # rx subrule "xblock" subtype=capture negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."xblock"()
    unless $P10, rx281_fail
    rx281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx281_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  alt288_0:
.annotate 'line', 166
    set_addr $I10, alt288_1
    rx281_cur."!mark_push"(0, rx281_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx281_cur."!cursor_pos"(rx281_pos)
    .const 'Sub' $P291 = "66_1275160381.56318" 
    capture_lex $P291
    $P10 = rx281_cur."before"($P291)
    if $P10, rx281_fail
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
    goto alt288_end
  alt288_1:
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  alt288_end:
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
.annotate 'line', 163
  # rx pass
    rx281_cur."!cursor_pass"(rx281_pos, "statement_control:sym<unless>")
    rx281_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx281_pos)
    .return (rx281_cur)
  rx281_fail:
.annotate 'line', 4
    (rx281_rep, rx281_pos, $I10, $P10) = rx281_cur."!mark_fail"(0)
    lt rx281_pos, -1, rx281_done
    eq rx281_pos, -1, rx281_fail
    jump $I10
  rx281_done:
    rx281_cur."!cursor_fail"()
    rx281_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx281_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1275160381.56318") :method
.annotate 'line', 4
    new $P283, "ResizablePMCArray"
    push $P283, "unless"
    .return ($P283)
.end


.namespace ["NQP";"Grammar"]
.sub "_block290"  :anon :subid("66_1275160381.56318") :method :outer("64_1275160381.56318")
.annotate 'line', 166
    .local string rx292_tgt
    .local int rx292_pos
    .local int rx292_off
    .local int rx292_eos
    .local int rx292_rep
    .local pmc rx292_cur
    (rx292_cur, rx292_pos, rx292_tgt) = self."!cursor_start"()
    rx292_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan293_done
    goto rxscan293_scan
  rxscan293_loop:
    ($P10) = rx292_cur."from"()
    inc $P10
    set rx292_pos, $P10
    ge rx292_pos, rx292_eos, rxscan293_done
  rxscan293_scan:
    set_addr $I10, rxscan293_loop
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  rxscan293_done:
  # rx literal  "else"
    add $I11, rx292_pos, 4
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 4
    ne $S10, "else", rx292_fail
    add rx292_pos, 4
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "")
    rx292_cur."!cursor_debug"("PASS  ", "", " at pos=", rx292_pos)
    .return (rx292_cur)
  rx292_fail:
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    rx292_cur."!cursor_debug"("FAIL  ", "")
    .return (rx292_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx299_tgt
    .local int rx299_pos
    .local int rx299_off
    .local int rx299_eos
    .local int rx299_rep
    .local pmc rx299_cur
    (rx299_cur, rx299_pos, rx299_tgt) = self."!cursor_start"()
    rx299_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx299_cur
    .local pmc match
    .lex "$/", match
    length rx299_eos, rx299_tgt
    set rx299_off, 0
    lt rx299_pos, 2, rx299_start
    sub rx299_off, rx299_pos, 1
    substr rx299_tgt, rx299_tgt, rx299_off
  rx299_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan302_done
    goto rxscan302_scan
  rxscan302_loop:
    ($P10) = rx299_cur."from"()
    inc $P10
    set rx299_pos, $P10
    ge rx299_pos, rx299_eos, rxscan302_done
  rxscan302_scan:
    set_addr $I10, rxscan302_loop
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  rxscan302_done:
.annotate 'line', 170
  # rx subcapture "sym"
    set_addr $I10, rxcap_304_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  alt303_0:
    set_addr $I10, alt303_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "while"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "while", rx299_fail
    add rx299_pos, 5
    goto alt303_end
  alt303_1:
  # rx literal  "until"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "until", rx299_fail
    add rx299_pos, 5
  alt303_end:
    set_addr $I10, rxcap_304_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_304_done
  rxcap_304_fail:
    goto rx299_fail
  rxcap_304_done:
  # rx charclass s
    ge rx299_pos, rx299_eos, rx299_fail
    sub $I10, rx299_pos, rx299_off
    is_cclass $I11, 32, rx299_tgt, $I10
    unless $I11, rx299_fail
    inc rx299_pos
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
.annotate 'line', 171
  # rx subrule "xblock" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."xblock"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
.annotate 'line', 169
  # rx pass
    rx299_cur."!cursor_pass"(rx299_pos, "statement_control:sym<while>")
    rx299_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx299_pos)
    .return (rx299_cur)
  rx299_fail:
.annotate 'line', 4
    (rx299_rep, rx299_pos, $I10, $P10) = rx299_cur."!mark_fail"(0)
    lt rx299_pos, -1, rx299_done
    eq rx299_pos, -1, rx299_fail
    jump $I10
  rx299_done:
    rx299_cur."!cursor_fail"()
    rx299_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx299_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1275160381.56318") :method
.annotate 'line', 4
    new $P301, "ResizablePMCArray"
    push $P301, "until"
    push $P301, "while"
    .return ($P301)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx308_tgt
    .local int rx308_pos
    .local int rx308_off
    .local int rx308_eos
    .local int rx308_rep
    .local pmc rx308_cur
    (rx308_cur, rx308_pos, rx308_tgt) = self."!cursor_start"()
    rx308_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx308_cur
    .local pmc match
    .lex "$/", match
    length rx308_eos, rx308_tgt
    set rx308_off, 0
    lt rx308_pos, 2, rx308_start
    sub rx308_off, rx308_pos, 1
    substr rx308_tgt, rx308_tgt, rx308_off
  rx308_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan311_done
    goto rxscan311_scan
  rxscan311_loop:
    ($P10) = rx308_cur."from"()
    inc $P10
    set rx308_pos, $P10
    ge rx308_pos, rx308_eos, rxscan311_done
  rxscan311_scan:
    set_addr $I10, rxscan311_loop
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  rxscan311_done:
.annotate 'line', 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_312_fail
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx308_pos, 6
    gt $I11, rx308_eos, rx308_fail
    sub $I11, rx308_pos, rx308_off
    substr $S10, rx308_tgt, $I11, 6
    ne $S10, "repeat", rx308_fail
    add rx308_pos, 6
    set_addr $I10, rxcap_312_fail
    ($I12, $I11) = rx308_cur."!mark_peek"($I10)
    rx308_cur."!cursor_pos"($I11)
    ($P10) = rx308_cur."!cursor_start"()
    $P10."!cursor_pass"(rx308_pos, "")
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_312_done
  rxcap_312_fail:
    goto rx308_fail
  rxcap_312_done:
  # rx charclass s
    ge rx308_pos, rx308_eos, rx308_fail
    sub $I10, rx308_pos, rx308_off
    is_cclass $I11, 32, rx308_tgt, $I10
    unless $I11, rx308_fail
    inc rx308_pos
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  alt314_0:
.annotate 'line', 176
    set_addr $I10, alt314_1
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
.annotate 'line', 177
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_317_fail
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  alt316_0:
    set_addr $I10, alt316_1
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  # rx literal  "while"
    add $I11, rx308_pos, 5
    gt $I11, rx308_eos, rx308_fail
    sub $I11, rx308_pos, rx308_off
    substr $S10, rx308_tgt, $I11, 5
    ne $S10, "while", rx308_fail
    add rx308_pos, 5
    goto alt316_end
  alt316_1:
  # rx literal  "until"
    add $I11, rx308_pos, 5
    gt $I11, rx308_eos, rx308_fail
    sub $I11, rx308_pos, rx308_off
    substr $S10, rx308_tgt, $I11, 5
    ne $S10, "until", rx308_fail
    add rx308_pos, 5
  alt316_end:
    set_addr $I10, rxcap_317_fail
    ($I12, $I11) = rx308_cur."!mark_peek"($I10)
    rx308_cur."!cursor_pos"($I11)
    ($P10) = rx308_cur."!cursor_start"()
    $P10."!cursor_pass"(rx308_pos, "")
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_317_done
  rxcap_317_fail:
    goto rx308_fail
  rxcap_317_done:
  # rx charclass s
    ge rx308_pos, rx308_eos, rx308_fail
    sub $I10, rx308_pos, rx308_off
    is_cclass $I11, 32, rx308_tgt, $I10
    unless $I11, rx308_fail
    inc rx308_pos
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."xblock"()
    unless $P10, rx308_fail
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx308_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
    goto alt314_end
  alt314_1:
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."pblock"()
    unless $P10, rx308_fail
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx308_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_323_fail
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  alt322_0:
    set_addr $I10, alt322_1
    rx308_cur."!mark_push"(0, rx308_pos, $I10)
  # rx literal  "while"
    add $I11, rx308_pos, 5
    gt $I11, rx308_eos, rx308_fail
    sub $I11, rx308_pos, rx308_off
    substr $S10, rx308_tgt, $I11, 5
    ne $S10, "while", rx308_fail
    add rx308_pos, 5
    goto alt322_end
  alt322_1:
  # rx literal  "until"
    add $I11, rx308_pos, 5
    gt $I11, rx308_eos, rx308_fail
    sub $I11, rx308_pos, rx308_off
    substr $S10, rx308_tgt, $I11, 5
    ne $S10, "until", rx308_fail
    add rx308_pos, 5
  alt322_end:
    set_addr $I10, rxcap_323_fail
    ($I12, $I11) = rx308_cur."!mark_peek"($I10)
    rx308_cur."!cursor_pos"($I11)
    ($P10) = rx308_cur."!cursor_start"()
    $P10."!cursor_pass"(rx308_pos, "")
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_323_done
  rxcap_323_fail:
    goto rx308_fail
  rxcap_323_done:
  # rx charclass s
    ge rx308_pos, rx308_eos, rx308_fail
    sub $I10, rx308_pos, rx308_off
    is_cclass $I11, 32, rx308_tgt, $I10
    unless $I11, rx308_fail
    inc rx308_pos
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."EXPR"()
    unless $P10, rx308_fail
    rx308_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx308_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
  alt314_end:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx308_cur."!cursor_pos"(rx308_pos)
    $P10 = rx308_cur."ws"()
    unless $P10, rx308_fail
    rx308_pos = $P10."pos"()
.annotate 'line', 174
  # rx pass
    rx308_cur."!cursor_pass"(rx308_pos, "statement_control:sym<repeat>")
    rx308_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx308_pos)
    .return (rx308_cur)
  rx308_fail:
.annotate 'line', 4
    (rx308_rep, rx308_pos, $I10, $P10) = rx308_cur."!mark_fail"(0)
    lt rx308_pos, -1, rx308_done
    eq rx308_pos, -1, rx308_fail
    jump $I10
  rx308_done:
    rx308_cur."!cursor_fail"()
    rx308_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx308_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1275160381.56318") :method
.annotate 'line', 4
    new $P310, "ResizablePMCArray"
    push $P310, "repeat"
    .return ($P310)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "statement_control:sym<for>")
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
.annotate 'line', 183
  # rx subcapture "sym"
    set_addr $I10, rxcap_332_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx literal  "for"
    add $I11, rx328_pos, 3
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 3
    ne $S10, "for", rx328_fail
    add rx328_pos, 3
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
.annotate 'line', 184
  # rx subrule "xblock" subtype=capture negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."xblock"()
    unless $P10, rx328_fail
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx328_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
.annotate 'line', 182
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "statement_control:sym<for>")
    rx328_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate 'line', 4
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx328_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1275160381.56318") :method
.annotate 'line', 4
    new $P330, "ResizablePMCArray"
    push $P330, "for"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx336_tgt
    .local int rx336_pos
    .local int rx336_off
    .local int rx336_eos
    .local int rx336_rep
    .local pmc rx336_cur
    (rx336_cur, rx336_pos, rx336_tgt) = self."!cursor_start"()
    rx336_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx336_cur
    .local pmc match
    .lex "$/", match
    length rx336_eos, rx336_tgt
    set rx336_off, 0
    lt rx336_pos, 2, rx336_start
    sub rx336_off, rx336_pos, 1
    substr rx336_tgt, rx336_tgt, rx336_off
  rx336_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan339_done
    goto rxscan339_scan
  rxscan339_loop:
    ($P10) = rx336_cur."from"()
    inc $P10
    set rx336_pos, $P10
    ge rx336_pos, rx336_eos, rxscan339_done
  rxscan339_scan:
    set_addr $I10, rxscan339_loop
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  rxscan339_done:
.annotate 'line', 188
  # rx subcapture "sym"
    set_addr $I10, rxcap_340_fail
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx336_pos, 5
    gt $I11, rx336_eos, rx336_fail
    sub $I11, rx336_pos, rx336_off
    substr $S10, rx336_tgt, $I11, 5
    ne $S10, "CATCH", rx336_fail
    add rx336_pos, 5
    set_addr $I10, rxcap_340_fail
    ($I12, $I11) = rx336_cur."!mark_peek"($I10)
    rx336_cur."!cursor_pos"($I11)
    ($P10) = rx336_cur."!cursor_start"()
    $P10."!cursor_pass"(rx336_pos, "")
    rx336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_340_done
  rxcap_340_fail:
    goto rx336_fail
  rxcap_340_done:
  # rx charclass s
    ge rx336_pos, rx336_eos, rx336_fail
    sub $I10, rx336_pos, rx336_off
    is_cclass $I11, 32, rx336_tgt, $I10
    unless $I11, rx336_fail
    inc rx336_pos
  # rx subrule "ws" subtype=method negate=
    rx336_cur."!cursor_pos"(rx336_pos)
    $P10 = rx336_cur."ws"()
    unless $P10, rx336_fail
    rx336_pos = $P10."pos"()
.annotate 'line', 189
  # rx subrule "block" subtype=capture negate=
    rx336_cur."!cursor_pos"(rx336_pos)
    $P10 = rx336_cur."block"()
    unless $P10, rx336_fail
    rx336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx336_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx336_cur."!cursor_pos"(rx336_pos)
    $P10 = rx336_cur."ws"()
    unless $P10, rx336_fail
    rx336_pos = $P10."pos"()
.annotate 'line', 187
  # rx pass
    rx336_cur."!cursor_pass"(rx336_pos, "statement_control:sym<CATCH>")
    rx336_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx336_pos)
    .return (rx336_cur)
  rx336_fail:
.annotate 'line', 4
    (rx336_rep, rx336_pos, $I10, $P10) = rx336_cur."!mark_fail"(0)
    lt rx336_pos, -1, rx336_done
    eq rx336_pos, -1, rx336_fail
    jump $I10
  rx336_done:
    rx336_cur."!cursor_fail"()
    rx336_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx336_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1275160381.56318") :method
.annotate 'line', 4
    new $P338, "ResizablePMCArray"
    push $P338, "CATCH"
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx344_tgt
    .local int rx344_pos
    .local int rx344_off
    .local int rx344_eos
    .local int rx344_rep
    .local pmc rx344_cur
    (rx344_cur, rx344_pos, rx344_tgt) = self."!cursor_start"()
    rx344_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx344_cur
    .local pmc match
    .lex "$/", match
    length rx344_eos, rx344_tgt
    set rx344_off, 0
    lt rx344_pos, 2, rx344_start
    sub rx344_off, rx344_pos, 1
    substr rx344_tgt, rx344_tgt, rx344_off
  rx344_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan347_done
    goto rxscan347_scan
  rxscan347_loop:
    ($P10) = rx344_cur."from"()
    inc $P10
    set rx344_pos, $P10
    ge rx344_pos, rx344_eos, rxscan347_done
  rxscan347_scan:
    set_addr $I10, rxscan347_loop
    rx344_cur."!mark_push"(0, rx344_pos, $I10)
  rxscan347_done:
.annotate 'line', 193
  # rx subcapture "sym"
    set_addr $I10, rxcap_348_fail
    rx344_cur."!mark_push"(0, rx344_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx344_pos, 7
    gt $I11, rx344_eos, rx344_fail
    sub $I11, rx344_pos, rx344_off
    substr $S10, rx344_tgt, $I11, 7
    ne $S10, "CONTROL", rx344_fail
    add rx344_pos, 7
    set_addr $I10, rxcap_348_fail
    ($I12, $I11) = rx344_cur."!mark_peek"($I10)
    rx344_cur."!cursor_pos"($I11)
    ($P10) = rx344_cur."!cursor_start"()
    $P10."!cursor_pass"(rx344_pos, "")
    rx344_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_348_done
  rxcap_348_fail:
    goto rx344_fail
  rxcap_348_done:
  # rx charclass s
    ge rx344_pos, rx344_eos, rx344_fail
    sub $I10, rx344_pos, rx344_off
    is_cclass $I11, 32, rx344_tgt, $I10
    unless $I11, rx344_fail
    inc rx344_pos
  # rx subrule "ws" subtype=method negate=
    rx344_cur."!cursor_pos"(rx344_pos)
    $P10 = rx344_cur."ws"()
    unless $P10, rx344_fail
    rx344_pos = $P10."pos"()
.annotate 'line', 194
  # rx subrule "block" subtype=capture negate=
    rx344_cur."!cursor_pos"(rx344_pos)
    $P10 = rx344_cur."block"()
    unless $P10, rx344_fail
    rx344_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx344_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx344_cur."!cursor_pos"(rx344_pos)
    $P10 = rx344_cur."ws"()
    unless $P10, rx344_fail
    rx344_pos = $P10."pos"()
.annotate 'line', 192
  # rx pass
    rx344_cur."!cursor_pass"(rx344_pos, "statement_control:sym<CONTROL>")
    rx344_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx344_pos)
    .return (rx344_cur)
  rx344_fail:
.annotate 'line', 4
    (rx344_rep, rx344_pos, $I10, $P10) = rx344_cur."!mark_fail"(0)
    lt rx344_pos, -1, rx344_done
    eq rx344_pos, -1, rx344_fail
    jump $I10
  rx344_done:
    rx344_cur."!cursor_fail"()
    rx344_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx344_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1275160381.56318") :method
.annotate 'line', 4
    new $P346, "ResizablePMCArray"
    push $P346, "CONTROL"
    .return ($P346)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1275160381.56318") :method
.annotate 'line', 197
    $P352 = self."!protoregex"("statement_prefix")
    .return ($P352)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1275160381.56318") :method
.annotate 'line', 197
    $P354 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx356_tgt
    .local int rx356_pos
    .local int rx356_off
    .local int rx356_eos
    .local int rx356_rep
    .local pmc rx356_cur
    (rx356_cur, rx356_pos, rx356_tgt) = self."!cursor_start"()
    rx356_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx356_cur
    .local pmc match
    .lex "$/", match
    length rx356_eos, rx356_tgt
    set rx356_off, 0
    lt rx356_pos, 2, rx356_start
    sub rx356_off, rx356_pos, 1
    substr rx356_tgt, rx356_tgt, rx356_off
  rx356_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan360_done
    goto rxscan360_scan
  rxscan360_loop:
    ($P10) = rx356_cur."from"()
    inc $P10
    set rx356_pos, $P10
    ge rx356_pos, rx356_eos, rxscan360_done
  rxscan360_scan:
    set_addr $I10, rxscan360_loop
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  rxscan360_done:
.annotate 'line', 198
  # rx subcapture "sym"
    set_addr $I10, rxcap_361_fail
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx356_pos, 4
    gt $I11, rx356_eos, rx356_fail
    sub $I11, rx356_pos, rx356_off
    substr $S10, rx356_tgt, $I11, 4
    ne $S10, "INIT", rx356_fail
    add rx356_pos, 4
    set_addr $I10, rxcap_361_fail
    ($I12, $I11) = rx356_cur."!mark_peek"($I10)
    rx356_cur."!cursor_pos"($I11)
    ($P10) = rx356_cur."!cursor_start"()
    $P10."!cursor_pass"(rx356_pos, "")
    rx356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_361_done
  rxcap_361_fail:
    goto rx356_fail
  rxcap_361_done:
  # rx subrule "blorst" subtype=capture negate=
    rx356_cur."!cursor_pos"(rx356_pos)
    $P10 = rx356_cur."blorst"()
    unless $P10, rx356_fail
    rx356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx356_pos = $P10."pos"()
  # rx pass
    rx356_cur."!cursor_pass"(rx356_pos, "statement_prefix:sym<INIT>")
    rx356_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx356_pos)
    .return (rx356_cur)
  rx356_fail:
.annotate 'line', 4
    (rx356_rep, rx356_pos, $I10, $P10) = rx356_cur."!mark_fail"(0)
    lt rx356_pos, -1, rx356_done
    eq rx356_pos, -1, rx356_fail
    jump $I10
  rx356_done:
    rx356_cur."!cursor_fail"()
    rx356_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx356_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1275160381.56318") :method
.annotate 'line', 4
    $P358 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P359, "ResizablePMCArray"
    push $P359, $P358
    .return ($P359)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    (rx363_cur, rx363_pos, rx363_tgt) = self."!cursor_start"()
    rx363_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx363_cur
    .local pmc match
    .lex "$/", match
    length rx363_eos, rx363_tgt
    set rx363_off, 0
    lt rx363_pos, 2, rx363_start
    sub rx363_off, rx363_pos, 1
    substr rx363_tgt, rx363_tgt, rx363_off
  rx363_start:
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
.annotate 'line', 201
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  # rx literal  "try"
    add $I11, rx363_pos, 3
    gt $I11, rx363_eos, rx363_fail
    sub $I11, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I11, 3
    ne $S10, "try", rx363_fail
    add rx363_pos, 3
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
.annotate 'line', 202
  # rx subrule "blorst" subtype=capture negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."blorst"()
    unless $P10, rx363_fail
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx363_pos = $P10."pos"()
.annotate 'line', 200
  # rx pass
    rx363_cur."!cursor_pass"(rx363_pos, "statement_prefix:sym<try>")
    rx363_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx363_pos)
    .return (rx363_cur)
  rx363_fail:
.annotate 'line', 4
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    rx363_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1275160381.56318") :method
.annotate 'line', 4
    $P365 = self."!PREFIX__!subrule"("blorst", "try")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx370_tgt
    .local int rx370_pos
    .local int rx370_off
    .local int rx370_eos
    .local int rx370_rep
    .local pmc rx370_cur
    (rx370_cur, rx370_pos, rx370_tgt) = self."!cursor_start"()
    rx370_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx370_cur
    .local pmc match
    .lex "$/", match
    length rx370_eos, rx370_tgt
    set rx370_off, 0
    lt rx370_pos, 2, rx370_start
    sub rx370_off, rx370_pos, 1
    substr rx370_tgt, rx370_tgt, rx370_off
  rx370_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan373_done
    goto rxscan373_scan
  rxscan373_loop:
    ($P10) = rx370_cur."from"()
    inc $P10
    set rx370_pos, $P10
    ge rx370_pos, rx370_eos, rxscan373_done
  rxscan373_scan:
    set_addr $I10, rxscan373_loop
    rx370_cur."!mark_push"(0, rx370_pos, $I10)
  rxscan373_done:
.annotate 'line', 206
  # rx charclass s
    ge rx370_pos, rx370_eos, rx370_fail
    sub $I10, rx370_pos, rx370_off
    is_cclass $I11, 32, rx370_tgt, $I10
    unless $I11, rx370_fail
    inc rx370_pos
  # rx subrule "ws" subtype=method negate=
    rx370_cur."!cursor_pos"(rx370_pos)
    $P10 = rx370_cur."ws"()
    unless $P10, rx370_fail
    rx370_pos = $P10."pos"()
  alt374_0:
    set_addr $I10, alt374_1
    rx370_cur."!mark_push"(0, rx370_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx370_pos, rx370_eos, rx370_fail
    sub $I10, rx370_pos, rx370_off
    substr $S10, rx370_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx370_fail
  # rx subrule "block" subtype=capture negate=
    rx370_cur."!cursor_pos"(rx370_pos)
    $P10 = rx370_cur."block"()
    unless $P10, rx370_fail
    rx370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx370_pos = $P10."pos"()
    goto alt374_end
  alt374_1:
  # rx subrule "statement" subtype=capture negate=
    rx370_cur."!cursor_pos"(rx370_pos)
    $P10 = rx370_cur."statement"()
    unless $P10, rx370_fail
    rx370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx370_pos = $P10."pos"()
  alt374_end:
.annotate 'line', 205
  # rx pass
    rx370_cur."!cursor_pass"(rx370_pos, "blorst")
    rx370_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx370_pos)
    .return (rx370_cur)
  rx370_fail:
.annotate 'line', 4
    (rx370_rep, rx370_pos, $I10, $P10) = rx370_cur."!mark_fail"(0)
    lt rx370_pos, -1, rx370_done
    eq rx370_pos, -1, rx370_fail
    jump $I10
  rx370_done:
    rx370_cur."!cursor_fail"()
    rx370_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx370_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1275160381.56318") :method
.annotate 'line', 4
    new $P372, "ResizablePMCArray"
    push $P372, ""
    .return ($P372)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1275160381.56318") :method
.annotate 'line', 211
    $P376 = self."!protoregex"("statement_mod_cond")
    .return ($P376)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1275160381.56318") :method
.annotate 'line', 211
    $P378 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx380_tgt
    .local int rx380_pos
    .local int rx380_off
    .local int rx380_eos
    .local int rx380_rep
    .local pmc rx380_cur
    (rx380_cur, rx380_pos, rx380_tgt) = self."!cursor_start"()
    rx380_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx380_cur
    .local pmc match
    .lex "$/", match
    length rx380_eos, rx380_tgt
    set rx380_off, 0
    lt rx380_pos, 2, rx380_start
    sub rx380_off, rx380_pos, 1
    substr rx380_tgt, rx380_tgt, rx380_off
  rx380_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan383_done
    goto rxscan383_scan
  rxscan383_loop:
    ($P10) = rx380_cur."from"()
    inc $P10
    set rx380_pos, $P10
    ge rx380_pos, rx380_eos, rxscan383_done
  rxscan383_scan:
    set_addr $I10, rxscan383_loop
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  rxscan383_done:
.annotate 'line', 213
  # rx subcapture "sym"
    set_addr $I10, rxcap_384_fail
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  # rx literal  "if"
    add $I11, rx380_pos, 2
    gt $I11, rx380_eos, rx380_fail
    sub $I11, rx380_pos, rx380_off
    substr $S10, rx380_tgt, $I11, 2
    ne $S10, "if", rx380_fail
    add rx380_pos, 2
    set_addr $I10, rxcap_384_fail
    ($I12, $I11) = rx380_cur."!mark_peek"($I10)
    rx380_cur."!cursor_pos"($I11)
    ($P10) = rx380_cur."!cursor_start"()
    $P10."!cursor_pass"(rx380_pos, "")
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_384_done
  rxcap_384_fail:
    goto rx380_fail
  rxcap_384_done:
  # rx subrule "ws" subtype=method negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."ws"()
    unless $P10, rx380_fail
    rx380_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."EXPR"()
    unless $P10, rx380_fail
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx380_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."ws"()
    unless $P10, rx380_fail
    rx380_pos = $P10."pos"()
  # rx pass
    rx380_cur."!cursor_pass"(rx380_pos, "statement_mod_cond:sym<if>")
    rx380_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx380_pos)
    .return (rx380_cur)
  rx380_fail:
.annotate 'line', 4
    (rx380_rep, rx380_pos, $I10, $P10) = rx380_cur."!mark_fail"(0)
    lt rx380_pos, -1, rx380_done
    eq rx380_pos, -1, rx380_fail
    jump $I10
  rx380_done:
    rx380_cur."!cursor_fail"()
    rx380_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx380_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1275160381.56318") :method
.annotate 'line', 4
    new $P382, "ResizablePMCArray"
    push $P382, "if"
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt rx388_pos, 2, rx388_start
    sub rx388_off, rx388_pos, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan391_done
    goto rxscan391_scan
  rxscan391_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan391_done
  rxscan391_scan:
    set_addr $I10, rxscan391_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan391_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_392_fail
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx literal  "unless"
    add $I11, rx388_pos, 6
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I11, 6
    ne $S10, "unless", rx388_fail
    add rx388_pos, 6
    set_addr $I10, rxcap_392_fail
    ($I12, $I11) = rx388_cur."!mark_peek"($I10)
    rx388_cur."!cursor_pos"($I11)
    ($P10) = rx388_cur."!cursor_start"()
    $P10."!cursor_pass"(rx388_pos, "")
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_392_done
  rxcap_392_fail:
    goto rx388_fail
  rxcap_392_done:
  # rx subrule "ws" subtype=method negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."ws"()
    unless $P10, rx388_fail
    rx388_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."EXPR"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx388_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."ws"()
    unless $P10, rx388_fail
    rx388_pos = $P10."pos"()
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "statement_mod_cond:sym<unless>")
    rx388_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate 'line', 4
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1275160381.56318") :method
.annotate 'line', 4
    new $P390, "ResizablePMCArray"
    push $P390, "unless"
    .return ($P390)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1275160381.56318") :method
.annotate 'line', 216
    $P396 = self."!protoregex"("statement_mod_loop")
    .return ($P396)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1275160381.56318") :method
.annotate 'line', 216
    $P398 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P398)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
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
    ne $I10, -1, rxscan403_done
    goto rxscan403_scan
  rxscan403_loop:
    ($P10) = rx400_cur."from"()
    inc $P10
    set rx400_pos, $P10
    ge rx400_pos, rx400_eos, rxscan403_done
  rxscan403_scan:
    set_addr $I10, rxscan403_loop
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  rxscan403_done:
.annotate 'line', 218
  # rx subcapture "sym"
    set_addr $I10, rxcap_404_fail
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  # rx literal  "while"
    add $I11, rx400_pos, 5
    gt $I11, rx400_eos, rx400_fail
    sub $I11, rx400_pos, rx400_off
    substr $S10, rx400_tgt, $I11, 5
    ne $S10, "while", rx400_fail
    add rx400_pos, 5
    set_addr $I10, rxcap_404_fail
    ($I12, $I11) = rx400_cur."!mark_peek"($I10)
    rx400_cur."!cursor_pos"($I11)
    ($P10) = rx400_cur."!cursor_start"()
    $P10."!cursor_pass"(rx400_pos, "")
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_404_done
  rxcap_404_fail:
    goto rx400_fail
  rxcap_404_done:
  # rx subrule "ws" subtype=method negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."ws"()
    unless $P10, rx400_fail
    rx400_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."EXPR"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx400_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."ws"()
    unless $P10, rx400_fail
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "statement_mod_loop:sym<while>")
    rx400_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate 'line', 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1275160381.56318") :method
.annotate 'line', 4
    new $P402, "ResizablePMCArray"
    push $P402, "while"
    .return ($P402)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx408_tgt
    .local int rx408_pos
    .local int rx408_off
    .local int rx408_eos
    .local int rx408_rep
    .local pmc rx408_cur
    (rx408_cur, rx408_pos, rx408_tgt) = self."!cursor_start"()
    rx408_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx408_cur
    .local pmc match
    .lex "$/", match
    length rx408_eos, rx408_tgt
    set rx408_off, 0
    lt rx408_pos, 2, rx408_start
    sub rx408_off, rx408_pos, 1
    substr rx408_tgt, rx408_tgt, rx408_off
  rx408_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan411_done
    goto rxscan411_scan
  rxscan411_loop:
    ($P10) = rx408_cur."from"()
    inc $P10
    set rx408_pos, $P10
    ge rx408_pos, rx408_eos, rxscan411_done
  rxscan411_scan:
    set_addr $I10, rxscan411_loop
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  rxscan411_done:
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_412_fail
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  # rx literal  "until"
    add $I11, rx408_pos, 5
    gt $I11, rx408_eos, rx408_fail
    sub $I11, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I11, 5
    ne $S10, "until", rx408_fail
    add rx408_pos, 5
    set_addr $I10, rxcap_412_fail
    ($I12, $I11) = rx408_cur."!mark_peek"($I10)
    rx408_cur."!cursor_pos"($I11)
    ($P10) = rx408_cur."!cursor_start"()
    $P10."!cursor_pass"(rx408_pos, "")
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_412_done
  rxcap_412_fail:
    goto rx408_fail
  rxcap_412_done:
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
    rx408_cur."!cursor_pass"(rx408_pos, "statement_mod_loop:sym<until>")
    rx408_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx408_pos)
    .return (rx408_cur)
  rx408_fail:
.annotate 'line', 4
    (rx408_rep, rx408_pos, $I10, $P10) = rx408_cur."!mark_fail"(0)
    lt rx408_pos, -1, rx408_done
    eq rx408_pos, -1, rx408_fail
    jump $I10
  rx408_done:
    rx408_cur."!cursor_fail"()
    rx408_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx408_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1275160381.56318") :method
.annotate 'line', 4
    new $P410, "ResizablePMCArray"
    push $P410, "until"
    .return ($P410)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("97_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx416_tgt
    .local int rx416_pos
    .local int rx416_off
    .local int rx416_eos
    .local int rx416_rep
    .local pmc rx416_cur
    (rx416_cur, rx416_pos, rx416_tgt) = self."!cursor_start"()
    rx416_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
    .lex unicode:"$\x{a2}", rx416_cur
    .local pmc match
    .lex "$/", match
    length rx416_eos, rx416_tgt
    set rx416_off, 0
    lt rx416_pos, 2, rx416_start
    sub rx416_off, rx416_pos, 1
    substr rx416_tgt, rx416_tgt, rx416_off
  rx416_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan420_done
    goto rxscan420_scan
  rxscan420_loop:
    ($P10) = rx416_cur."from"()
    inc $P10
    set rx416_pos, $P10
    ge rx416_pos, rx416_eos, rxscan420_done
  rxscan420_scan:
    set_addr $I10, rxscan420_loop
    rx416_cur."!mark_push"(0, rx416_pos, $I10)
  rxscan420_done:
.annotate 'line', 223
  # rx subrule "fatarrow" subtype=capture negate=
    rx416_cur."!cursor_pos"(rx416_pos)
    $P10 = rx416_cur."fatarrow"()
    unless $P10, rx416_fail
    rx416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx416_pos = $P10."pos"()
  # rx pass
    rx416_cur."!cursor_pass"(rx416_pos, "term:sym<fatarrow>")
    rx416_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx416_pos)
    .return (rx416_cur)
  rx416_fail:
.annotate 'line', 4
    (rx416_rep, rx416_pos, $I10, $P10) = rx416_cur."!mark_fail"(0)
    lt rx416_pos, -1, rx416_done
    eq rx416_pos, -1, rx416_fail
    jump $I10
  rx416_done:
    rx416_cur."!cursor_fail"()
    rx416_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx416_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("98_1275160381.56318") :method
.annotate 'line', 4
    $P418 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P419, "ResizablePMCArray"
    push $P419, $P418
    .return ($P419)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("99_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx422_tgt
    .local int rx422_pos
    .local int rx422_off
    .local int rx422_eos
    .local int rx422_rep
    .local pmc rx422_cur
    (rx422_cur, rx422_pos, rx422_tgt) = self."!cursor_start"()
    rx422_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx422_cur
    .local pmc match
    .lex "$/", match
    length rx422_eos, rx422_tgt
    set rx422_off, 0
    lt rx422_pos, 2, rx422_start
    sub rx422_off, rx422_pos, 1
    substr rx422_tgt, rx422_tgt, rx422_off
  rx422_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan426_done
    goto rxscan426_scan
  rxscan426_loop:
    ($P10) = rx422_cur."from"()
    inc $P10
    set rx422_pos, $P10
    ge rx422_pos, rx422_eos, rxscan426_done
  rxscan426_scan:
    set_addr $I10, rxscan426_loop
    rx422_cur."!mark_push"(0, rx422_pos, $I10)
  rxscan426_done:
.annotate 'line', 224
  # rx subrule "colonpair" subtype=capture negate=
    rx422_cur."!cursor_pos"(rx422_pos)
    $P10 = rx422_cur."colonpair"()
    unless $P10, rx422_fail
    rx422_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx422_pos = $P10."pos"()
  # rx pass
    rx422_cur."!cursor_pass"(rx422_pos, "term:sym<colonpair>")
    rx422_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx422_pos)
    .return (rx422_cur)
  rx422_fail:
.annotate 'line', 4
    (rx422_rep, rx422_pos, $I10, $P10) = rx422_cur."!mark_fail"(0)
    lt rx422_pos, -1, rx422_done
    eq rx422_pos, -1, rx422_fail
    jump $I10
  rx422_done:
    rx422_cur."!cursor_fail"()
    rx422_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx422_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("100_1275160381.56318") :method
.annotate 'line', 4
    $P424 = self."!PREFIX__!subrule"("colonpair", "")
    new $P425, "ResizablePMCArray"
    push $P425, $P424
    .return ($P425)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("101_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx428_tgt
    .local int rx428_pos
    .local int rx428_off
    .local int rx428_eos
    .local int rx428_rep
    .local pmc rx428_cur
    (rx428_cur, rx428_pos, rx428_tgt) = self."!cursor_start"()
    rx428_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx428_cur
    .local pmc match
    .lex "$/", match
    length rx428_eos, rx428_tgt
    set rx428_off, 0
    lt rx428_pos, 2, rx428_start
    sub rx428_off, rx428_pos, 1
    substr rx428_tgt, rx428_tgt, rx428_off
  rx428_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan432_done
    goto rxscan432_scan
  rxscan432_loop:
    ($P10) = rx428_cur."from"()
    inc $P10
    set rx428_pos, $P10
    ge rx428_pos, rx428_eos, rxscan432_done
  rxscan432_scan:
    set_addr $I10, rxscan432_loop
    rx428_cur."!mark_push"(0, rx428_pos, $I10)
  rxscan432_done:
.annotate 'line', 225
  # rx subrule "variable" subtype=capture negate=
    rx428_cur."!cursor_pos"(rx428_pos)
    $P10 = rx428_cur."variable"()
    unless $P10, rx428_fail
    rx428_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx428_pos = $P10."pos"()
  # rx pass
    rx428_cur."!cursor_pass"(rx428_pos, "term:sym<variable>")
    rx428_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx428_pos)
    .return (rx428_cur)
  rx428_fail:
.annotate 'line', 4
    (rx428_rep, rx428_pos, $I10, $P10) = rx428_cur."!mark_fail"(0)
    lt rx428_pos, -1, rx428_done
    eq rx428_pos, -1, rx428_fail
    jump $I10
  rx428_done:
    rx428_cur."!cursor_fail"()
    rx428_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx428_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("102_1275160381.56318") :method
.annotate 'line', 4
    $P430 = self."!PREFIX__!subrule"("variable", "")
    new $P431, "ResizablePMCArray"
    push $P431, $P430
    .return ($P431)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("103_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx434_tgt
    .local int rx434_pos
    .local int rx434_off
    .local int rx434_eos
    .local int rx434_rep
    .local pmc rx434_cur
    (rx434_cur, rx434_pos, rx434_tgt) = self."!cursor_start"()
    rx434_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx434_cur
    .local pmc match
    .lex "$/", match
    length rx434_eos, rx434_tgt
    set rx434_off, 0
    lt rx434_pos, 2, rx434_start
    sub rx434_off, rx434_pos, 1
    substr rx434_tgt, rx434_tgt, rx434_off
  rx434_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan438_done
    goto rxscan438_scan
  rxscan438_loop:
    ($P10) = rx434_cur."from"()
    inc $P10
    set rx434_pos, $P10
    ge rx434_pos, rx434_eos, rxscan438_done
  rxscan438_scan:
    set_addr $I10, rxscan438_loop
    rx434_cur."!mark_push"(0, rx434_pos, $I10)
  rxscan438_done:
.annotate 'line', 226
  # rx subrule "package_declarator" subtype=capture negate=
    rx434_cur."!cursor_pos"(rx434_pos)
    $P10 = rx434_cur."package_declarator"()
    unless $P10, rx434_fail
    rx434_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx434_pos = $P10."pos"()
  # rx pass
    rx434_cur."!cursor_pass"(rx434_pos, "term:sym<package_declarator>")
    rx434_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx434_pos)
    .return (rx434_cur)
  rx434_fail:
.annotate 'line', 4
    (rx434_rep, rx434_pos, $I10, $P10) = rx434_cur."!mark_fail"(0)
    lt rx434_pos, -1, rx434_done
    eq rx434_pos, -1, rx434_fail
    jump $I10
  rx434_done:
    rx434_cur."!cursor_fail"()
    rx434_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx434_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("104_1275160381.56318") :method
.annotate 'line', 4
    $P436 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P437, "ResizablePMCArray"
    push $P437, $P436
    .return ($P437)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("105_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx440_tgt
    .local int rx440_pos
    .local int rx440_off
    .local int rx440_eos
    .local int rx440_rep
    .local pmc rx440_cur
    (rx440_cur, rx440_pos, rx440_tgt) = self."!cursor_start"()
    rx440_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx440_cur
    .local pmc match
    .lex "$/", match
    length rx440_eos, rx440_tgt
    set rx440_off, 0
    lt rx440_pos, 2, rx440_start
    sub rx440_off, rx440_pos, 1
    substr rx440_tgt, rx440_tgt, rx440_off
  rx440_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan444_done
    goto rxscan444_scan
  rxscan444_loop:
    ($P10) = rx440_cur."from"()
    inc $P10
    set rx440_pos, $P10
    ge rx440_pos, rx440_eos, rxscan444_done
  rxscan444_scan:
    set_addr $I10, rxscan444_loop
    rx440_cur."!mark_push"(0, rx440_pos, $I10)
  rxscan444_done:
.annotate 'line', 227
  # rx subrule "scope_declarator" subtype=capture negate=
    rx440_cur."!cursor_pos"(rx440_pos)
    $P10 = rx440_cur."scope_declarator"()
    unless $P10, rx440_fail
    rx440_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx440_pos = $P10."pos"()
  # rx pass
    rx440_cur."!cursor_pass"(rx440_pos, "term:sym<scope_declarator>")
    rx440_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx440_pos)
    .return (rx440_cur)
  rx440_fail:
.annotate 'line', 4
    (rx440_rep, rx440_pos, $I10, $P10) = rx440_cur."!mark_fail"(0)
    lt rx440_pos, -1, rx440_done
    eq rx440_pos, -1, rx440_fail
    jump $I10
  rx440_done:
    rx440_cur."!cursor_fail"()
    rx440_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx440_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("106_1275160381.56318") :method
.annotate 'line', 4
    $P442 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P443, "ResizablePMCArray"
    push $P443, $P442
    .return ($P443)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("107_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx446_tgt
    .local int rx446_pos
    .local int rx446_off
    .local int rx446_eos
    .local int rx446_rep
    .local pmc rx446_cur
    (rx446_cur, rx446_pos, rx446_tgt) = self."!cursor_start"()
    rx446_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx446_cur
    .local pmc match
    .lex "$/", match
    length rx446_eos, rx446_tgt
    set rx446_off, 0
    lt rx446_pos, 2, rx446_start
    sub rx446_off, rx446_pos, 1
    substr rx446_tgt, rx446_tgt, rx446_off
  rx446_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan450_done
    goto rxscan450_scan
  rxscan450_loop:
    ($P10) = rx446_cur."from"()
    inc $P10
    set rx446_pos, $P10
    ge rx446_pos, rx446_eos, rxscan450_done
  rxscan450_scan:
    set_addr $I10, rxscan450_loop
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
  rxscan450_done:
.annotate 'line', 228
  # rx subrule "routine_declarator" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."routine_declarator"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx446_pos = $P10."pos"()
  # rx pass
    rx446_cur."!cursor_pass"(rx446_pos, "term:sym<routine_declarator>")
    rx446_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx446_pos)
    .return (rx446_cur)
  rx446_fail:
.annotate 'line', 4
    (rx446_rep, rx446_pos, $I10, $P10) = rx446_cur."!mark_fail"(0)
    lt rx446_pos, -1, rx446_done
    eq rx446_pos, -1, rx446_fail
    jump $I10
  rx446_done:
    rx446_cur."!cursor_fail"()
    rx446_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx446_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("108_1275160381.56318") :method
.annotate 'line', 4
    $P448 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P449, "ResizablePMCArray"
    push $P449, $P448
    .return ($P449)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("109_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx452_tgt
    .local int rx452_pos
    .local int rx452_off
    .local int rx452_eos
    .local int rx452_rep
    .local pmc rx452_cur
    (rx452_cur, rx452_pos, rx452_tgt) = self."!cursor_start"()
    rx452_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx452_cur
    .local pmc match
    .lex "$/", match
    length rx452_eos, rx452_tgt
    set rx452_off, 0
    lt rx452_pos, 2, rx452_start
    sub rx452_off, rx452_pos, 1
    substr rx452_tgt, rx452_tgt, rx452_off
  rx452_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan456_done
    goto rxscan456_scan
  rxscan456_loop:
    ($P10) = rx452_cur."from"()
    inc $P10
    set rx452_pos, $P10
    ge rx452_pos, rx452_eos, rxscan456_done
  rxscan456_scan:
    set_addr $I10, rxscan456_loop
    rx452_cur."!mark_push"(0, rx452_pos, $I10)
  rxscan456_done:
.annotate 'line', 229
  # rx subrule "regex_declarator" subtype=capture negate=
    rx452_cur."!cursor_pos"(rx452_pos)
    $P10 = rx452_cur."regex_declarator"()
    unless $P10, rx452_fail
    rx452_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx452_pos = $P10."pos"()
  # rx pass
    rx452_cur."!cursor_pass"(rx452_pos, "term:sym<regex_declarator>")
    rx452_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx452_pos)
    .return (rx452_cur)
  rx452_fail:
.annotate 'line', 4
    (rx452_rep, rx452_pos, $I10, $P10) = rx452_cur."!mark_fail"(0)
    lt rx452_pos, -1, rx452_done
    eq rx452_pos, -1, rx452_fail
    jump $I10
  rx452_done:
    rx452_cur."!cursor_fail"()
    rx452_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx452_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("110_1275160381.56318") :method
.annotate 'line', 4
    $P454 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P455, "ResizablePMCArray"
    push $P455, $P454
    .return ($P455)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("111_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    (rx458_cur, rx458_pos, rx458_tgt) = self."!cursor_start"()
    rx458_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx458_cur
    .local pmc match
    .lex "$/", match
    length rx458_eos, rx458_tgt
    set rx458_off, 0
    lt rx458_pos, 2, rx458_start
    sub rx458_off, rx458_pos, 1
    substr rx458_tgt, rx458_tgt, rx458_off
  rx458_start:
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
.annotate 'line', 230
  # rx subrule "statement_prefix" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."statement_prefix"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx458_pos = $P10."pos"()
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "term:sym<statement_prefix>")
    rx458_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx458_pos)
    .return (rx458_cur)
  rx458_fail:
.annotate 'line', 4
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    rx458_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("112_1275160381.56318") :method
.annotate 'line', 4
    $P460 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("113_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt) = self."!cursor_start"()
    rx464_cur."!cursor_debug"("START ", "term:sym<lambda>")
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
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx464_cur."from"()
    inc $P10
    set rx464_pos, $P10
    ge rx464_pos, rx464_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  rxscan467_done:
.annotate 'line', 231
  # rx subrule "lambda" subtype=zerowidth negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."lambda"()
    unless $P10, rx464_fail
  # rx subrule "pblock" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."pblock"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx464_pos = $P10."pos"()
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "term:sym<lambda>")
    rx464_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_fail:
.annotate 'line', 4
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("114_1275160381.56318") :method
.annotate 'line', 4
    new $P466, "ResizablePMCArray"
    push $P466, ""
    .return ($P466)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("115_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx469_tgt
    .local int rx469_pos
    .local int rx469_off
    .local int rx469_eos
    .local int rx469_rep
    .local pmc rx469_cur
    (rx469_cur, rx469_pos, rx469_tgt) = self."!cursor_start"()
    rx469_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx469_cur
    .local pmc match
    .lex "$/", match
    length rx469_eos, rx469_tgt
    set rx469_off, 0
    lt rx469_pos, 2, rx469_start
    sub rx469_off, rx469_pos, 1
    substr rx469_tgt, rx469_tgt, rx469_off
  rx469_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan473_done
    goto rxscan473_scan
  rxscan473_loop:
    ($P10) = rx469_cur."from"()
    inc $P10
    set rx469_pos, $P10
    ge rx469_pos, rx469_eos, rxscan473_done
  rxscan473_scan:
    set_addr $I10, rxscan473_loop
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
  rxscan473_done:
.annotate 'line', 234
  # rx subrule "identifier" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."identifier"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx469_pos = $P10."pos"()
  # rx rxquantr474 ** 0..*
    set_addr $I475, rxquantr474_done
    rx469_cur."!mark_push"(0, rx469_pos, $I475)
  rxquantr474_loop:
  # rx enumcharlist negate=0 
    ge rx469_pos, rx469_eos, rx469_fail
    sub $I10, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx469_fail
    inc rx469_pos
    (rx469_rep) = rx469_cur."!mark_commit"($I475)
    rx469_cur."!mark_push"(rx469_rep, rx469_pos, $I475)
    goto rxquantr474_loop
  rxquantr474_done:
  # rx literal  "=>"
    add $I11, rx469_pos, 2
    gt $I11, rx469_eos, rx469_fail
    sub $I11, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I11, 2
    ne $S10, "=>", rx469_fail
    add rx469_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."ws"()
    unless $P10, rx469_fail
    rx469_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."EXPR"("i=")
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx469_pos = $P10."pos"()
.annotate 'line', 233
  # rx pass
    rx469_cur."!cursor_pass"(rx469_pos, "fatarrow")
    rx469_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx469_pos)
    .return (rx469_cur)
  rx469_fail:
.annotate 'line', 4
    (rx469_rep, rx469_pos, $I10, $P10) = rx469_cur."!mark_fail"(0)
    lt rx469_pos, -1, rx469_done
    eq rx469_pos, -1, rx469_fail
    jump $I10
  rx469_done:
    rx469_cur."!cursor_fail"()
    rx469_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx469_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("116_1275160381.56318") :method
.annotate 'line', 4
    $P471 = self."!PREFIX__!subrule"("key", "")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("117_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx477_tgt
    .local int rx477_pos
    .local int rx477_off
    .local int rx477_eos
    .local int rx477_rep
    .local pmc rx477_cur
    (rx477_cur, rx477_pos, rx477_tgt) = self."!cursor_start"()
    rx477_cur."!cursor_debug"("START ", "colonpair")
    rx477_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx477_cur
    .local pmc match
    .lex "$/", match
    length rx477_eos, rx477_tgt
    set rx477_off, 0
    lt rx477_pos, 2, rx477_start
    sub rx477_off, rx477_pos, 1
    substr rx477_tgt, rx477_tgt, rx477_off
  rx477_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan483_done
    goto rxscan483_scan
  rxscan483_loop:
    ($P10) = rx477_cur."from"()
    inc $P10
    set rx477_pos, $P10
    ge rx477_pos, rx477_eos, rxscan483_done
  rxscan483_scan:
    set_addr $I10, rxscan483_loop
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  rxscan483_done:
.annotate 'line', 238
  # rx literal  ":"
    add $I11, rx477_pos, 1
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 1
    ne $S10, ":", rx477_fail
    add rx477_pos, 1
  alt484_0:
.annotate 'line', 239
    set_addr $I10, alt484_1
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
.annotate 'line', 240
  # rx subcapture "not"
    set_addr $I10, rxcap_485_fail
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  # rx literal  "!"
    add $I11, rx477_pos, 1
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 1
    ne $S10, "!", rx477_fail
    add rx477_pos, 1
    set_addr $I10, rxcap_485_fail
    ($I12, $I11) = rx477_cur."!mark_peek"($I10)
    rx477_cur."!cursor_pos"($I11)
    ($P10) = rx477_cur."!cursor_start"()
    $P10."!cursor_pass"(rx477_pos, "")
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_485_done
  rxcap_485_fail:
    goto rx477_fail
  rxcap_485_done:
  # rx subrule "identifier" subtype=capture negate=
    rx477_cur."!cursor_pos"(rx477_pos)
    $P10 = rx477_cur."identifier"()
    unless $P10, rx477_fail
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx477_pos = $P10."pos"()
    goto alt484_end
  alt484_1:
    set_addr $I10, alt484_2
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
.annotate 'line', 241
  # rx subrule "identifier" subtype=capture negate=
    rx477_cur."!cursor_pos"(rx477_pos)
    $P10 = rx477_cur."identifier"()
    unless $P10, rx477_fail
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx477_pos = $P10."pos"()
  # rx rxquantr486 ** 0..1
    set_addr $I487, rxquantr486_done
    rx477_cur."!mark_push"(0, rx477_pos, $I487)
  rxquantr486_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx477_cur."!cursor_pos"(rx477_pos)
    $P10 = rx477_cur."circumfix"()
    unless $P10, rx477_fail
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx477_pos = $P10."pos"()
    (rx477_rep) = rx477_cur."!mark_commit"($I487)
  rxquantr486_done:
    goto alt484_end
  alt484_2:
.annotate 'line', 242
  # rx subrule "circumfix" subtype=capture negate=
    rx477_cur."!cursor_pos"(rx477_pos)
    $P10 = rx477_cur."circumfix"()
    unless $P10, rx477_fail
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx477_pos = $P10."pos"()
  alt484_end:
.annotate 'line', 237
  # rx pass
    rx477_cur."!cursor_pass"(rx477_pos, "colonpair")
    rx477_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx477_pos)
    .return (rx477_cur)
  rx477_fail:
.annotate 'line', 4
    (rx477_rep, rx477_pos, $I10, $P10) = rx477_cur."!mark_fail"(0)
    lt rx477_pos, -1, rx477_done
    eq rx477_pos, -1, rx477_fail
    jump $I10
  rx477_done:
    rx477_cur."!cursor_fail"()
    rx477_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx477_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("118_1275160381.56318") :method
.annotate 'line', 4
    $P479 = self."!PREFIX__!subrule"("circumfix", ":")
    $P480 = self."!PREFIX__!subrule"("identifier", ":")
    $P481 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P482, "ResizablePMCArray"
    push $P482, $P479
    push $P482, $P480
    push $P482, $P481
    .return ($P482)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("119_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    (rx489_cur, rx489_pos, rx489_tgt) = self."!cursor_start"()
    rx489_cur."!cursor_debug"("START ", "variable")
    rx489_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx489_cur
    .local pmc match
    .lex "$/", match
    length rx489_eos, rx489_tgt
    set rx489_off, 0
    lt rx489_pos, 2, rx489_start
    sub rx489_off, rx489_pos, 1
    substr rx489_tgt, rx489_tgt, rx489_off
  rx489_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan494_done
    goto rxscan494_scan
  rxscan494_loop:
    ($P10) = rx489_cur."from"()
    inc $P10
    set rx489_pos, $P10
    ge rx489_pos, rx489_eos, rxscan494_done
  rxscan494_scan:
    set_addr $I10, rxscan494_loop
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  rxscan494_done:
  alt495_0:
.annotate 'line', 246
    set_addr $I10, alt495_1
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
.annotate 'line', 247
  # rx subrule "sigil" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."sigil"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx489_pos = $P10."pos"()
  # rx rxquantr496 ** 0..1
    set_addr $I497, rxquantr496_done
    rx489_cur."!mark_push"(0, rx489_pos, $I497)
  rxquantr496_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."twigil"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx489_pos = $P10."pos"()
    (rx489_rep) = rx489_cur."!mark_commit"($I497)
  rxquantr496_done:
  # rx subrule "name" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."name"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx489_pos = $P10."pos"()
    goto alt495_end
  alt495_1:
    set_addr $I10, alt495_2
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
.annotate 'line', 248
  # rx subrule "sigil" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."sigil"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx489_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx489_pos, rx489_eos, rx489_fail
    sub $I10, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx489_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."postcircumfix"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx489_pos = $P10."pos"()
    goto alt495_end
  alt495_2:
.annotate 'line', 249
  # rx subcapture "sigil"
    set_addr $I10, rxcap_498_fail
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  # rx literal  "$"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, "$", rx489_fail
    add rx489_pos, 1
    set_addr $I10, rxcap_498_fail
    ($I12, $I11) = rx489_cur."!mark_peek"($I10)
    rx489_cur."!cursor_pos"($I11)
    ($P10) = rx489_cur."!cursor_start"()
    $P10."!cursor_pass"(rx489_pos, "")
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_498_done
  rxcap_498_fail:
    goto rx489_fail
  rxcap_498_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_499_fail
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx489_pos, rx489_eos, rx489_fail
    sub $I10, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx489_fail
    inc rx489_pos
    set_addr $I10, rxcap_499_fail
    ($I12, $I11) = rx489_cur."!mark_peek"($I10)
    rx489_cur."!cursor_pos"($I11)
    ($P10) = rx489_cur."!cursor_start"()
    $P10."!cursor_pass"(rx489_pos, "")
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_499_done
  rxcap_499_fail:
    goto rx489_fail
  rxcap_499_done:
  alt495_end:
.annotate 'line', 246
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "variable")
    rx489_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx489_pos)
    .return (rx489_cur)
  rx489_fail:
.annotate 'line', 4
    (rx489_rep, rx489_pos, $I10, $P10) = rx489_cur."!mark_fail"(0)
    lt rx489_pos, -1, rx489_done
    eq rx489_pos, -1, rx489_fail
    jump $I10
  rx489_done:
    rx489_cur."!cursor_fail"()
    rx489_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx489_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("120_1275160381.56318") :method
.annotate 'line', 4
    $P491 = self."!PREFIX__!subrule"("sigil", "")
    $P492 = self."!PREFIX__!subrule"("sigil", "")
    new $P493, "ResizablePMCArray"
    push $P493, "$!"
    push $P493, "$_"
    push $P493, "$/"
    push $P493, $P491
    push $P493, $P492
    .return ($P493)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("121_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "sigil")
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
    index $I11, "$@%&", $S10
    lt $I11, 0, rx501_fail
    inc rx501_pos
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "sigil")
    rx501_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate 'line', 4
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx501_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("122_1275160381.56318") :method
.annotate 'line', 4
    new $P503, "ResizablePMCArray"
    push $P503, "&"
    push $P503, "%"
    push $P503, "@"
    push $P503, "$"
    .return ($P503)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("123_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt) = self."!cursor_start"()
    rx506_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx506_cur
    .local pmc match
    .lex "$/", match
    length rx506_eos, rx506_tgt
    set rx506_off, 0
    lt rx506_pos, 2, rx506_start
    sub rx506_off, rx506_pos, 1
    substr rx506_tgt, rx506_tgt, rx506_off
  rx506_start:
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
.annotate 'line', 254
  # rx enumcharlist negate=0 
    ge rx506_pos, rx506_eos, rx506_fail
    sub $I10, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx506_fail
    inc rx506_pos
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "twigil")
    rx506_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_fail:
.annotate 'line', 4
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("124_1275160381.56318") :method
.annotate 'line', 4
    new $P508, "ResizablePMCArray"
    push $P508, "?"
    push $P508, "!"
    push $P508, "*"
    .return ($P508)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("125_1275160381.56318") :method
.annotate 'line', 256
    $P511 = self."!protoregex"("package_declarator")
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("126_1275160381.56318") :method
.annotate 'line', 256
    $P513 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("127_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx515_tgt
    .local int rx515_pos
    .local int rx515_off
    .local int rx515_eos
    .local int rx515_rep
    .local pmc rx515_cur
    (rx515_cur, rx515_pos, rx515_tgt) = self."!cursor_start"()
    rx515_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx515_cur
    .local pmc match
    .lex "$/", match
    length rx515_eos, rx515_tgt
    set rx515_off, 0
    lt rx515_pos, 2, rx515_start
    sub rx515_off, rx515_pos, 1
    substr rx515_tgt, rx515_tgt, rx515_off
  rx515_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan519_done
    goto rxscan519_scan
  rxscan519_loop:
    ($P10) = rx515_cur."from"()
    inc $P10
    set rx515_pos, $P10
    ge rx515_pos, rx515_eos, rxscan519_done
  rxscan519_scan:
    set_addr $I10, rxscan519_loop
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxscan519_done:
.annotate 'line', 257
  # rx subcapture "sym"
    set_addr $I10, rxcap_520_fail
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  # rx literal  "module"
    add $I11, rx515_pos, 6
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 6
    ne $S10, "module", rx515_fail
    add rx515_pos, 6
    set_addr $I10, rxcap_520_fail
    ($I12, $I11) = rx515_cur."!mark_peek"($I10)
    rx515_cur."!cursor_pos"($I11)
    ($P10) = rx515_cur."!cursor_start"()
    $P10."!cursor_pass"(rx515_pos, "")
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_520_done
  rxcap_520_fail:
    goto rx515_fail
  rxcap_520_done:
  # rx subrule "package_def" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."package_def"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx515_pos = $P10."pos"()
  # rx pass
    rx515_cur."!cursor_pass"(rx515_pos, "package_declarator:sym<module>")
    rx515_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx515_pos)
    .return (rx515_cur)
  rx515_fail:
.annotate 'line', 4
    (rx515_rep, rx515_pos, $I10, $P10) = rx515_cur."!mark_fail"(0)
    lt rx515_pos, -1, rx515_done
    eq rx515_pos, -1, rx515_fail
    jump $I10
  rx515_done:
    rx515_cur."!cursor_fail"()
    rx515_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx515_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("128_1275160381.56318") :method
.annotate 'line', 4
    $P517 = self."!PREFIX__!subrule"("package_def", "module")
    new $P518, "ResizablePMCArray"
    push $P518, $P517
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("129_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx522_tgt
    .local int rx522_pos
    .local int rx522_off
    .local int rx522_eos
    .local int rx522_rep
    .local pmc rx522_cur
    (rx522_cur, rx522_pos, rx522_tgt) = self."!cursor_start"()
    rx522_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx522_cur
    .local pmc match
    .lex "$/", match
    length rx522_eos, rx522_tgt
    set rx522_off, 0
    lt rx522_pos, 2, rx522_start
    sub rx522_off, rx522_pos, 1
    substr rx522_tgt, rx522_tgt, rx522_off
  rx522_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan527_done
    goto rxscan527_scan
  rxscan527_loop:
    ($P10) = rx522_cur."from"()
    inc $P10
    set rx522_pos, $P10
    ge rx522_pos, rx522_eos, rxscan527_done
  rxscan527_scan:
    set_addr $I10, rxscan527_loop
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  rxscan527_done:
.annotate 'line', 258
  # rx subcapture "sym"
    set_addr $I10, rxcap_529_fail
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  alt528_0:
    set_addr $I10, alt528_1
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  # rx literal  "class"
    add $I11, rx522_pos, 5
    gt $I11, rx522_eos, rx522_fail
    sub $I11, rx522_pos, rx522_off
    substr $S10, rx522_tgt, $I11, 5
    ne $S10, "class", rx522_fail
    add rx522_pos, 5
    goto alt528_end
  alt528_1:
  # rx literal  "grammar"
    add $I11, rx522_pos, 7
    gt $I11, rx522_eos, rx522_fail
    sub $I11, rx522_pos, rx522_off
    substr $S10, rx522_tgt, $I11, 7
    ne $S10, "grammar", rx522_fail
    add rx522_pos, 7
  alt528_end:
    set_addr $I10, rxcap_529_fail
    ($I12, $I11) = rx522_cur."!mark_peek"($I10)
    rx522_cur."!cursor_pos"($I11)
    ($P10) = rx522_cur."!cursor_start"()
    $P10."!cursor_pass"(rx522_pos, "")
    rx522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_529_done
  rxcap_529_fail:
    goto rx522_fail
  rxcap_529_done:
  # rx subrule "package_def" subtype=capture negate=
    rx522_cur."!cursor_pos"(rx522_pos)
    $P10 = rx522_cur."package_def"()
    unless $P10, rx522_fail
    rx522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx522_pos = $P10."pos"()
  # rx pass
    rx522_cur."!cursor_pass"(rx522_pos, "package_declarator:sym<class>")
    rx522_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx522_pos)
    .return (rx522_cur)
  rx522_fail:
.annotate 'line', 4
    (rx522_rep, rx522_pos, $I10, $P10) = rx522_cur."!mark_fail"(0)
    lt rx522_pos, -1, rx522_done
    eq rx522_pos, -1, rx522_fail
    jump $I10
  rx522_done:
    rx522_cur."!cursor_fail"()
    rx522_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx522_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("130_1275160381.56318") :method
.annotate 'line', 4
    $P524 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P525 = self."!PREFIX__!subrule"("package_def", "class")
    new $P526, "ResizablePMCArray"
    push $P526, $P524
    push $P526, $P525
    .return ($P526)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("131_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx531_tgt
    .local int rx531_pos
    .local int rx531_off
    .local int rx531_eos
    .local int rx531_rep
    .local pmc rx531_cur
    (rx531_cur, rx531_pos, rx531_tgt) = self."!cursor_start"()
    rx531_cur."!cursor_debug"("START ", "package_def")
    rx531_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx531_cur
    .local pmc match
    .lex "$/", match
    length rx531_eos, rx531_tgt
    set rx531_off, 0
    lt rx531_pos, 2, rx531_start
    sub rx531_off, rx531_pos, 1
    substr rx531_tgt, rx531_tgt, rx531_off
  rx531_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan534_done
    goto rxscan534_scan
  rxscan534_loop:
    ($P10) = rx531_cur."from"()
    inc $P10
    set rx531_pos, $P10
    ge rx531_pos, rx531_eos, rxscan534_done
  rxscan534_scan:
    set_addr $I10, rxscan534_loop
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
  rxscan534_done:
.annotate 'line', 260
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
.annotate 'line', 261
  # rx subrule "name" subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."name"()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx531_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
.annotate 'line', 262
  # rx rxquantr537 ** 0..1
    set_addr $I541, rxquantr537_done
    rx531_cur."!mark_push"(0, rx531_pos, $I541)
  rxquantr537_loop:
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx531_pos, 2
    gt $I11, rx531_eos, rx531_fail
    sub $I11, rx531_pos, rx531_off
    substr $S10, rx531_tgt, $I11, 2
    ne $S10, "is", rx531_fail
    add rx531_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."name"()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx531_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
    (rx531_rep) = rx531_cur."!mark_commit"($I541)
  rxquantr537_done:
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  alt543_0:
.annotate 'line', 263
    set_addr $I10, alt543_1
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
.annotate 'line', 264
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx531_pos, 1
    gt $I11, rx531_eos, rx531_fail
    sub $I11, rx531_pos, rx531_off
    substr $S10, rx531_tgt, $I11, 1
    ne $S10, ";", rx531_fail
    add rx531_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."comp_unit"()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx531_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
    goto alt543_end
  alt543_1:
    set_addr $I10, alt543_2
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
.annotate 'line', 265
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx531_pos, rx531_eos, rx531_fail
    sub $I10, rx531_pos, rx531_off
    substr $S10, rx531_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx531_fail
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."block"()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx531_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
    goto alt543_end
  alt543_2:
.annotate 'line', 266
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."panic"("Malformed package declaration")
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
  alt543_end:
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."ws"()
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
.annotate 'line', 260
  # rx pass
    rx531_cur."!cursor_pass"(rx531_pos, "package_def")
    rx531_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx531_pos)
    .return (rx531_cur)
  rx531_fail:
.annotate 'line', 4
    (rx531_rep, rx531_pos, $I10, $P10) = rx531_cur."!mark_fail"(0)
    lt rx531_pos, -1, rx531_done
    eq rx531_pos, -1, rx531_fail
    jump $I10
  rx531_done:
    rx531_cur."!cursor_fail"()
    rx531_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx531_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("132_1275160381.56318") :method
.annotate 'line', 4
    new $P533, "ResizablePMCArray"
    push $P533, ""
    .return ($P533)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("133_1275160381.56318") :method
.annotate 'line', 270
    $P554 = self."!protoregex"("scope_declarator")
    .return ($P554)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("134_1275160381.56318") :method
.annotate 'line', 270
    $P556 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P556)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("135_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx558_tgt
    .local int rx558_pos
    .local int rx558_off
    .local int rx558_eos
    .local int rx558_rep
    .local pmc rx558_cur
    (rx558_cur, rx558_pos, rx558_tgt) = self."!cursor_start"()
    rx558_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx558_cur
    .local pmc match
    .lex "$/", match
    length rx558_eos, rx558_tgt
    set rx558_off, 0
    lt rx558_pos, 2, rx558_start
    sub rx558_off, rx558_pos, 1
    substr rx558_tgt, rx558_tgt, rx558_off
  rx558_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan562_done
    goto rxscan562_scan
  rxscan562_loop:
    ($P10) = rx558_cur."from"()
    inc $P10
    set rx558_pos, $P10
    ge rx558_pos, rx558_eos, rxscan562_done
  rxscan562_scan:
    set_addr $I10, rxscan562_loop
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  rxscan562_done:
.annotate 'line', 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_563_fail
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  # rx literal  "my"
    add $I11, rx558_pos, 2
    gt $I11, rx558_eos, rx558_fail
    sub $I11, rx558_pos, rx558_off
    substr $S10, rx558_tgt, $I11, 2
    ne $S10, "my", rx558_fail
    add rx558_pos, 2
    set_addr $I10, rxcap_563_fail
    ($I12, $I11) = rx558_cur."!mark_peek"($I10)
    rx558_cur."!cursor_pos"($I11)
    ($P10) = rx558_cur."!cursor_start"()
    $P10."!cursor_pass"(rx558_pos, "")
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_563_done
  rxcap_563_fail:
    goto rx558_fail
  rxcap_563_done:
  # rx subrule "scoped" subtype=capture negate=
    rx558_cur."!cursor_pos"(rx558_pos)
    $P10 = rx558_cur."scoped"("my")
    unless $P10, rx558_fail
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx558_pos = $P10."pos"()
  # rx pass
    rx558_cur."!cursor_pass"(rx558_pos, "scope_declarator:sym<my>")
    rx558_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx558_pos)
    .return (rx558_cur)
  rx558_fail:
.annotate 'line', 4
    (rx558_rep, rx558_pos, $I10, $P10) = rx558_cur."!mark_fail"(0)
    lt rx558_pos, -1, rx558_done
    eq rx558_pos, -1, rx558_fail
    jump $I10
  rx558_done:
    rx558_cur."!cursor_fail"()
    rx558_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx558_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("136_1275160381.56318") :method
.annotate 'line', 4
    $P560 = self."!PREFIX__!subrule"("scoped", "my")
    new $P561, "ResizablePMCArray"
    push $P561, $P560
    .return ($P561)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("137_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx565_tgt
    .local int rx565_pos
    .local int rx565_off
    .local int rx565_eos
    .local int rx565_rep
    .local pmc rx565_cur
    (rx565_cur, rx565_pos, rx565_tgt) = self."!cursor_start"()
    rx565_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx565_cur
    .local pmc match
    .lex "$/", match
    length rx565_eos, rx565_tgt
    set rx565_off, 0
    lt rx565_pos, 2, rx565_start
    sub rx565_off, rx565_pos, 1
    substr rx565_tgt, rx565_tgt, rx565_off
  rx565_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan569_done
    goto rxscan569_scan
  rxscan569_loop:
    ($P10) = rx565_cur."from"()
    inc $P10
    set rx565_pos, $P10
    ge rx565_pos, rx565_eos, rxscan569_done
  rxscan569_scan:
    set_addr $I10, rxscan569_loop
    rx565_cur."!mark_push"(0, rx565_pos, $I10)
  rxscan569_done:
.annotate 'line', 272
  # rx subcapture "sym"
    set_addr $I10, rxcap_570_fail
    rx565_cur."!mark_push"(0, rx565_pos, $I10)
  # rx literal  "our"
    add $I11, rx565_pos, 3
    gt $I11, rx565_eos, rx565_fail
    sub $I11, rx565_pos, rx565_off
    substr $S10, rx565_tgt, $I11, 3
    ne $S10, "our", rx565_fail
    add rx565_pos, 3
    set_addr $I10, rxcap_570_fail
    ($I12, $I11) = rx565_cur."!mark_peek"($I10)
    rx565_cur."!cursor_pos"($I11)
    ($P10) = rx565_cur."!cursor_start"()
    $P10."!cursor_pass"(rx565_pos, "")
    rx565_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_570_done
  rxcap_570_fail:
    goto rx565_fail
  rxcap_570_done:
  # rx subrule "scoped" subtype=capture negate=
    rx565_cur."!cursor_pos"(rx565_pos)
    $P10 = rx565_cur."scoped"("our")
    unless $P10, rx565_fail
    rx565_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx565_pos = $P10."pos"()
  # rx pass
    rx565_cur."!cursor_pass"(rx565_pos, "scope_declarator:sym<our>")
    rx565_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx565_pos)
    .return (rx565_cur)
  rx565_fail:
.annotate 'line', 4
    (rx565_rep, rx565_pos, $I10, $P10) = rx565_cur."!mark_fail"(0)
    lt rx565_pos, -1, rx565_done
    eq rx565_pos, -1, rx565_fail
    jump $I10
  rx565_done:
    rx565_cur."!cursor_fail"()
    rx565_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx565_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("138_1275160381.56318") :method
.annotate 'line', 4
    $P567 = self."!PREFIX__!subrule"("scoped", "our")
    new $P568, "ResizablePMCArray"
    push $P568, $P567
    .return ($P568)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("139_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx572_tgt
    .local int rx572_pos
    .local int rx572_off
    .local int rx572_eos
    .local int rx572_rep
    .local pmc rx572_cur
    (rx572_cur, rx572_pos, rx572_tgt) = self."!cursor_start"()
    rx572_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx572_cur
    .local pmc match
    .lex "$/", match
    length rx572_eos, rx572_tgt
    set rx572_off, 0
    lt rx572_pos, 2, rx572_start
    sub rx572_off, rx572_pos, 1
    substr rx572_tgt, rx572_tgt, rx572_off
  rx572_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan576_done
    goto rxscan576_scan
  rxscan576_loop:
    ($P10) = rx572_cur."from"()
    inc $P10
    set rx572_pos, $P10
    ge rx572_pos, rx572_eos, rxscan576_done
  rxscan576_scan:
    set_addr $I10, rxscan576_loop
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  rxscan576_done:
.annotate 'line', 273
  # rx subcapture "sym"
    set_addr $I10, rxcap_577_fail
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "has"
    add $I11, rx572_pos, 3
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 3
    ne $S10, "has", rx572_fail
    add rx572_pos, 3
    set_addr $I10, rxcap_577_fail
    ($I12, $I11) = rx572_cur."!mark_peek"($I10)
    rx572_cur."!cursor_pos"($I11)
    ($P10) = rx572_cur."!cursor_start"()
    $P10."!cursor_pass"(rx572_pos, "")
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_577_done
  rxcap_577_fail:
    goto rx572_fail
  rxcap_577_done:
  # rx subrule "scoped" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."scoped"("has")
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx572_pos = $P10."pos"()
  # rx pass
    rx572_cur."!cursor_pass"(rx572_pos, "scope_declarator:sym<has>")
    rx572_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx572_pos)
    .return (rx572_cur)
  rx572_fail:
.annotate 'line', 4
    (rx572_rep, rx572_pos, $I10, $P10) = rx572_cur."!mark_fail"(0)
    lt rx572_pos, -1, rx572_done
    eq rx572_pos, -1, rx572_fail
    jump $I10
  rx572_done:
    rx572_cur."!cursor_fail"()
    rx572_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx572_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("140_1275160381.56318") :method
.annotate 'line', 4
    $P574 = self."!PREFIX__!subrule"("scoped", "has")
    new $P575, "ResizablePMCArray"
    push $P575, $P574
    .return ($P575)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("141_1275160381.56318") :method :outer("11_1275160381.56318")
    .param pmc param_579
.annotate 'line', 275
    .lex "$*SCOPE", param_579
.annotate 'line', 4
    .local string rx580_tgt
    .local int rx580_pos
    .local int rx580_off
    .local int rx580_eos
    .local int rx580_rep
    .local pmc rx580_cur
    (rx580_cur, rx580_pos, rx580_tgt) = self."!cursor_start"()
    rx580_cur."!cursor_debug"("START ", "scoped")
    rx580_cur."!cursor_caparray"("typename")
    .lex unicode:"$\x{a2}", rx580_cur
    .local pmc match
    .lex "$/", match
    length rx580_eos, rx580_tgt
    set rx580_off, 0
    lt rx580_pos, 2, rx580_start
    sub rx580_off, rx580_pos, 1
    substr rx580_tgt, rx580_tgt, rx580_off
  rx580_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan583_done
    goto rxscan583_scan
  rxscan583_loop:
    ($P10) = rx580_cur."from"()
    inc $P10
    set rx580_pos, $P10
    ge rx580_pos, rx580_eos, rxscan583_done
  rxscan583_scan:
    set_addr $I10, rxscan583_loop
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  rxscan583_done:
  alt584_0:
.annotate 'line', 275
    set_addr $I10, alt584_1
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
.annotate 'line', 276
  # rx subrule "ws" subtype=method negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."ws"()
    unless $P10, rx580_fail
    rx580_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."declarator"()
    unless $P10, rx580_fail
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx580_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."ws"()
    unless $P10, rx580_fail
    rx580_pos = $P10."pos"()
    goto alt584_end
  alt584_1:
.annotate 'line', 277
  # rx subrule "ws" subtype=method negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."ws"()
    unless $P10, rx580_fail
    rx580_pos = $P10."pos"()
  # rx rxquantr588 ** 1..*
    set_addr $I589, rxquantr588_done
    rx580_cur."!mark_push"(0, -1, $I589)
  rxquantr588_loop:
  # rx subrule "typename" subtype=capture negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."typename"()
    unless $P10, rx580_fail
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx580_pos = $P10."pos"()
    (rx580_rep) = rx580_cur."!mark_commit"($I589)
    rx580_cur."!mark_push"(rx580_rep, rx580_pos, $I589)
    goto rxquantr588_loop
  rxquantr588_done:
  # rx subrule "ws" subtype=method negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."ws"()
    unless $P10, rx580_fail
    rx580_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."declarator"()
    unless $P10, rx580_fail
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx580_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."ws"()
    unless $P10, rx580_fail
    rx580_pos = $P10."pos"()
  alt584_end:
.annotate 'line', 275
  # rx pass
    rx580_cur."!cursor_pass"(rx580_pos, "scoped")
    rx580_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx580_pos)
    .return (rx580_cur)
  rx580_fail:
.annotate 'line', 4
    (rx580_rep, rx580_pos, $I10, $P10) = rx580_cur."!mark_fail"(0)
    lt rx580_pos, -1, rx580_done
    eq rx580_pos, -1, rx580_fail
    jump $I10
  rx580_done:
    rx580_cur."!cursor_fail"()
    rx580_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx580_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("142_1275160381.56318") :method
.annotate 'line', 4
    new $P582, "ResizablePMCArray"
    push $P582, ""
    push $P582, ""
    .return ($P582)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("143_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx593_tgt
    .local int rx593_pos
    .local int rx593_off
    .local int rx593_eos
    .local int rx593_rep
    .local pmc rx593_cur
    (rx593_cur, rx593_pos, rx593_tgt) = self."!cursor_start"()
    rx593_cur."!cursor_debug"("START ", "typename")
    .lex unicode:"$\x{a2}", rx593_cur
    .local pmc match
    .lex "$/", match
    length rx593_eos, rx593_tgt
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
.annotate 'line', 280
  # rx subrule "name" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."name"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx593_pos = $P10."pos"()
  # rx pass
    rx593_cur."!cursor_pass"(rx593_pos, "typename")
    rx593_cur."!cursor_debug"("PASS  ", "typename", " at pos=", rx593_pos)
    .return (rx593_cur)
  rx593_fail:
.annotate 'line', 4
    (rx593_rep, rx593_pos, $I10, $P10) = rx593_cur."!mark_fail"(0)
    lt rx593_pos, -1, rx593_done
    eq rx593_pos, -1, rx593_fail
    jump $I10
  rx593_done:
    rx593_cur."!cursor_fail"()
    rx593_cur."!cursor_debug"("FAIL  ", "typename")
    .return (rx593_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("144_1275160381.56318") :method
.annotate 'line', 4
    $P595 = self."!PREFIX__!subrule"("name", "")
    new $P596, "ResizablePMCArray"
    push $P596, $P595
    .return ($P596)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("145_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx599_tgt
    .local int rx599_pos
    .local int rx599_off
    .local int rx599_eos
    .local int rx599_rep
    .local pmc rx599_cur
    (rx599_cur, rx599_pos, rx599_tgt) = self."!cursor_start"()
    rx599_cur."!cursor_debug"("START ", "declarator")
    .lex unicode:"$\x{a2}", rx599_cur
    .local pmc match
    .lex "$/", match
    length rx599_eos, rx599_tgt
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
.annotate 'line', 282
    set_addr $I10, alt605_1
    rx599_cur."!mark_push"(0, rx599_pos, $I10)
.annotate 'line', 283
  # rx subrule "variable_declarator" subtype=capture negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."variable_declarator"()
    unless $P10, rx599_fail
    rx599_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx599_pos = $P10."pos"()
    goto alt605_end
  alt605_1:
.annotate 'line', 284
  # rx subrule "routine_declarator" subtype=capture negate=
    rx599_cur."!cursor_pos"(rx599_pos)
    $P10 = rx599_cur."routine_declarator"()
    unless $P10, rx599_fail
    rx599_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx599_pos = $P10."pos"()
  alt605_end:
.annotate 'line', 282
  # rx pass
    rx599_cur."!cursor_pass"(rx599_pos, "declarator")
    rx599_cur."!cursor_debug"("PASS  ", "declarator", " at pos=", rx599_pos)
    .return (rx599_cur)
  rx599_fail:
.annotate 'line', 4
    (rx599_rep, rx599_pos, $I10, $P10) = rx599_cur."!mark_fail"(0)
    lt rx599_pos, -1, rx599_done
    eq rx599_pos, -1, rx599_fail
    jump $I10
  rx599_done:
    rx599_cur."!cursor_fail"()
    rx599_cur."!cursor_debug"("FAIL  ", "declarator")
    .return (rx599_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("146_1275160381.56318") :method
.annotate 'line', 4
    $P601 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P602 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P603, "ResizablePMCArray"
    push $P603, $P601
    push $P603, $P602
    .return ($P603)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("147_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx607_tgt
    .local int rx607_pos
    .local int rx607_off
    .local int rx607_eos
    .local int rx607_rep
    .local pmc rx607_cur
    (rx607_cur, rx607_pos, rx607_tgt) = self."!cursor_start"()
    rx607_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx607_cur
    .local pmc match
    .lex "$/", match
    length rx607_eos, rx607_tgt
    set rx607_off, 0
    lt rx607_pos, 2, rx607_start
    sub rx607_off, rx607_pos, 1
    substr rx607_tgt, rx607_tgt, rx607_off
  rx607_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan611_done
    goto rxscan611_scan
  rxscan611_loop:
    ($P10) = rx607_cur."from"()
    inc $P10
    set rx607_pos, $P10
    ge rx607_pos, rx607_eos, rxscan611_done
  rxscan611_scan:
    set_addr $I10, rxscan611_loop
    rx607_cur."!mark_push"(0, rx607_pos, $I10)
  rxscan611_done:
.annotate 'line', 287
  # rx subrule "variable" subtype=capture negate=
    rx607_cur."!cursor_pos"(rx607_pos)
    $P10 = rx607_cur."variable"()
    unless $P10, rx607_fail
    rx607_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx607_pos = $P10."pos"()
  # rx pass
    rx607_cur."!cursor_pass"(rx607_pos, "variable_declarator")
    rx607_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx607_pos)
    .return (rx607_cur)
  rx607_fail:
.annotate 'line', 4
    (rx607_rep, rx607_pos, $I10, $P10) = rx607_cur."!mark_fail"(0)
    lt rx607_pos, -1, rx607_done
    eq rx607_pos, -1, rx607_fail
    jump $I10
  rx607_done:
    rx607_cur."!cursor_fail"()
    rx607_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx607_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("148_1275160381.56318") :method
.annotate 'line', 4
    $P609 = self."!PREFIX__!subrule"("variable", "")
    new $P610, "ResizablePMCArray"
    push $P610, $P609
    .return ($P610)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("149_1275160381.56318") :method
.annotate 'line', 289
    $P613 = self."!protoregex"("routine_declarator")
    .return ($P613)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("150_1275160381.56318") :method
.annotate 'line', 289
    $P615 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P615)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("151_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx617_tgt
    .local int rx617_pos
    .local int rx617_off
    .local int rx617_eos
    .local int rx617_rep
    .local pmc rx617_cur
    (rx617_cur, rx617_pos, rx617_tgt) = self."!cursor_start"()
    rx617_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx617_cur
    .local pmc match
    .lex "$/", match
    length rx617_eos, rx617_tgt
    set rx617_off, 0
    lt rx617_pos, 2, rx617_start
    sub rx617_off, rx617_pos, 1
    substr rx617_tgt, rx617_tgt, rx617_off
  rx617_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan621_done
    goto rxscan621_scan
  rxscan621_loop:
    ($P10) = rx617_cur."from"()
    inc $P10
    set rx617_pos, $P10
    ge rx617_pos, rx617_eos, rxscan621_done
  rxscan621_scan:
    set_addr $I10, rxscan621_loop
    rx617_cur."!mark_push"(0, rx617_pos, $I10)
  rxscan621_done:
.annotate 'line', 290
  # rx subcapture "sym"
    set_addr $I10, rxcap_622_fail
    rx617_cur."!mark_push"(0, rx617_pos, $I10)
  # rx literal  "sub"
    add $I11, rx617_pos, 3
    gt $I11, rx617_eos, rx617_fail
    sub $I11, rx617_pos, rx617_off
    substr $S10, rx617_tgt, $I11, 3
    ne $S10, "sub", rx617_fail
    add rx617_pos, 3
    set_addr $I10, rxcap_622_fail
    ($I12, $I11) = rx617_cur."!mark_peek"($I10)
    rx617_cur."!cursor_pos"($I11)
    ($P10) = rx617_cur."!cursor_start"()
    $P10."!cursor_pass"(rx617_pos, "")
    rx617_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_622_done
  rxcap_622_fail:
    goto rx617_fail
  rxcap_622_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx617_cur."!cursor_pos"(rx617_pos)
    $P10 = rx617_cur."routine_def"()
    unless $P10, rx617_fail
    rx617_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx617_pos = $P10."pos"()
  # rx pass
    rx617_cur."!cursor_pass"(rx617_pos, "routine_declarator:sym<sub>")
    rx617_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx617_pos)
    .return (rx617_cur)
  rx617_fail:
.annotate 'line', 4
    (rx617_rep, rx617_pos, $I10, $P10) = rx617_cur."!mark_fail"(0)
    lt rx617_pos, -1, rx617_done
    eq rx617_pos, -1, rx617_fail
    jump $I10
  rx617_done:
    rx617_cur."!cursor_fail"()
    rx617_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx617_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("152_1275160381.56318") :method
.annotate 'line', 4
    $P619 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P620, "ResizablePMCArray"
    push $P620, $P619
    .return ($P620)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("153_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx624_tgt
    .local int rx624_pos
    .local int rx624_off
    .local int rx624_eos
    .local int rx624_rep
    .local pmc rx624_cur
    (rx624_cur, rx624_pos, rx624_tgt) = self."!cursor_start"()
    rx624_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx624_cur
    .local pmc match
    .lex "$/", match
    length rx624_eos, rx624_tgt
    set rx624_off, 0
    lt rx624_pos, 2, rx624_start
    sub rx624_off, rx624_pos, 1
    substr rx624_tgt, rx624_tgt, rx624_off
  rx624_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan628_done
    goto rxscan628_scan
  rxscan628_loop:
    ($P10) = rx624_cur."from"()
    inc $P10
    set rx624_pos, $P10
    ge rx624_pos, rx624_eos, rxscan628_done
  rxscan628_scan:
    set_addr $I10, rxscan628_loop
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
  rxscan628_done:
.annotate 'line', 291
  # rx subcapture "sym"
    set_addr $I10, rxcap_629_fail
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
  # rx literal  "method"
    add $I11, rx624_pos, 6
    gt $I11, rx624_eos, rx624_fail
    sub $I11, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I11, 6
    ne $S10, "method", rx624_fail
    add rx624_pos, 6
    set_addr $I10, rxcap_629_fail
    ($I12, $I11) = rx624_cur."!mark_peek"($I10)
    rx624_cur."!cursor_pos"($I11)
    ($P10) = rx624_cur."!cursor_start"()
    $P10."!cursor_pass"(rx624_pos, "")
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_629_done
  rxcap_629_fail:
    goto rx624_fail
  rxcap_629_done:
  # rx subrule "method_def" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."method_def"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx624_pos = $P10."pos"()
  # rx pass
    rx624_cur."!cursor_pass"(rx624_pos, "routine_declarator:sym<method>")
    rx624_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx624_pos)
    .return (rx624_cur)
  rx624_fail:
.annotate 'line', 4
    (rx624_rep, rx624_pos, $I10, $P10) = rx624_cur."!mark_fail"(0)
    lt rx624_pos, -1, rx624_done
    eq rx624_pos, -1, rx624_fail
    jump $I10
  rx624_done:
    rx624_cur."!cursor_fail"()
    rx624_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx624_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("154_1275160381.56318") :method
.annotate 'line', 4
    $P626 = self."!PREFIX__!subrule"("method_def", "method")
    new $P627, "ResizablePMCArray"
    push $P627, $P626
    .return ($P627)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("155_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx631_tgt
    .local int rx631_pos
    .local int rx631_off
    .local int rx631_eos
    .local int rx631_rep
    .local pmc rx631_cur
    (rx631_cur, rx631_pos, rx631_tgt) = self."!cursor_start"()
    rx631_cur."!cursor_debug"("START ", "routine_def")
    rx631_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx631_cur
    .local pmc match
    .lex "$/", match
    length rx631_eos, rx631_tgt
    set rx631_off, 0
    lt rx631_pos, 2, rx631_start
    sub rx631_off, rx631_pos, 1
    substr rx631_tgt, rx631_tgt, rx631_off
  rx631_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan634_done
    goto rxscan634_scan
  rxscan634_loop:
    ($P10) = rx631_cur."from"()
    inc $P10
    set rx631_pos, $P10
    ge rx631_pos, rx631_eos, rxscan634_done
  rxscan634_scan:
    set_addr $I10, rxscan634_loop
    rx631_cur."!mark_push"(0, rx631_pos, $I10)
  rxscan634_done:
.annotate 'line', 293
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
.annotate 'line', 294
  # rx rxquantr636 ** 0..1
    set_addr $I642, rxquantr636_done
    rx631_cur."!mark_push"(0, rx631_pos, $I642)
  rxquantr636_loop:
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_640_fail
    rx631_cur."!mark_push"(0, rx631_pos, $I10)
  # rx rxquantr638 ** 0..1
    set_addr $I639, rxquantr638_done
    rx631_cur."!mark_push"(0, rx631_pos, $I639)
  rxquantr638_loop:
  # rx literal  "&"
    add $I11, rx631_pos, 1
    gt $I11, rx631_eos, rx631_fail
    sub $I11, rx631_pos, rx631_off
    substr $S10, rx631_tgt, $I11, 1
    ne $S10, "&", rx631_fail
    add rx631_pos, 1
    (rx631_rep) = rx631_cur."!mark_commit"($I639)
  rxquantr638_done:
    set_addr $I10, rxcap_640_fail
    ($I12, $I11) = rx631_cur."!mark_peek"($I10)
    rx631_cur."!cursor_pos"($I11)
    ($P10) = rx631_cur."!cursor_start"()
    $P10."!cursor_pass"(rx631_pos, "")
    rx631_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_640_done
  rxcap_640_fail:
    goto rx631_fail
  rxcap_640_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."deflongname"()
    unless $P10, rx631_fail
    rx631_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx631_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
    (rx631_rep) = rx631_cur."!mark_commit"($I642)
  rxquantr636_done:
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
.annotate 'line', 295
  # rx subrule "newpad" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."newpad"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  alt645_0:
.annotate 'line', 296
    set_addr $I10, alt645_1
    rx631_cur."!mark_push"(0, rx631_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx631_pos, 1
    gt $I11, rx631_eos, rx631_fail
    sub $I11, rx631_pos, rx631_off
    substr $S10, rx631_tgt, $I11, 1
    ne $S10, "(", rx631_fail
    add rx631_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."signature"()
    unless $P10, rx631_fail
    rx631_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx631_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx631_pos, 1
    gt $I11, rx631_eos, rx631_fail
    sub $I11, rx631_pos, rx631_off
    substr $S10, rx631_tgt, $I11, 1
    ne $S10, ")", rx631_fail
    add rx631_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
    goto alt645_end
  alt645_1:
.annotate 'line', 297
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
  alt645_end:
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
.annotate 'line', 298
  # rx subrule "blockoid" subtype=capture negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."blockoid"()
    unless $P10, rx631_fail
    rx631_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx631_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx631_cur."!cursor_pos"(rx631_pos)
    $P10 = rx631_cur."ws"()
    unless $P10, rx631_fail
    rx631_pos = $P10."pos"()
.annotate 'line', 293
  # rx pass
    rx631_cur."!cursor_pass"(rx631_pos, "routine_def")
    rx631_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx631_pos)
    .return (rx631_cur)
  rx631_fail:
.annotate 'line', 4
    (rx631_rep, rx631_pos, $I10, $P10) = rx631_cur."!mark_fail"(0)
    lt rx631_pos, -1, rx631_done
    eq rx631_pos, -1, rx631_fail
    jump $I10
  rx631_done:
    rx631_cur."!cursor_fail"()
    rx631_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx631_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("156_1275160381.56318") :method
.annotate 'line', 4
    new $P633, "ResizablePMCArray"
    push $P633, ""
    .return ($P633)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("157_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx655_tgt
    .local int rx655_pos
    .local int rx655_off
    .local int rx655_eos
    .local int rx655_rep
    .local pmc rx655_cur
    (rx655_cur, rx655_pos, rx655_tgt) = self."!cursor_start"()
    rx655_cur."!cursor_debug"("START ", "method_def")
    rx655_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx655_cur
    .local pmc match
    .lex "$/", match
    length rx655_eos, rx655_tgt
    set rx655_off, 0
    lt rx655_pos, 2, rx655_start
    sub rx655_off, rx655_pos, 1
    substr rx655_tgt, rx655_tgt, rx655_off
  rx655_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan658_done
    goto rxscan658_scan
  rxscan658_loop:
    ($P10) = rx655_cur."from"()
    inc $P10
    set rx655_pos, $P10
    ge rx655_pos, rx655_eos, rxscan658_done
  rxscan658_scan:
    set_addr $I10, rxscan658_loop
    rx655_cur."!mark_push"(0, rx655_pos, $I10)
  rxscan658_done:
.annotate 'line', 301
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
.annotate 'line', 302
  # rx rxquantr660 ** 0..1
    set_addr $I661, rxquantr660_done
    rx655_cur."!mark_push"(0, rx655_pos, $I661)
  rxquantr660_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."deflongname"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx655_pos = $P10."pos"()
    (rx655_rep) = rx655_cur."!mark_commit"($I661)
  rxquantr660_done:
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
.annotate 'line', 303
  # rx subrule "newpad" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."newpad"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  alt664_0:
.annotate 'line', 304
    set_addr $I10, alt664_1
    rx655_cur."!mark_push"(0, rx655_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx655_pos, 1
    gt $I11, rx655_eos, rx655_fail
    sub $I11, rx655_pos, rx655_off
    substr $S10, rx655_tgt, $I11, 1
    ne $S10, "(", rx655_fail
    add rx655_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."signature"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx655_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx655_pos, 1
    gt $I11, rx655_eos, rx655_fail
    sub $I11, rx655_pos, rx655_off
    substr $S10, rx655_tgt, $I11, 1
    ne $S10, ")", rx655_fail
    add rx655_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
    goto alt664_end
  alt664_1:
.annotate 'line', 305
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
  alt664_end:
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
.annotate 'line', 306
  # rx subrule "blockoid" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."blockoid"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx655_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."ws"()
    unless $P10, rx655_fail
    rx655_pos = $P10."pos"()
.annotate 'line', 301
  # rx pass
    rx655_cur."!cursor_pass"(rx655_pos, "method_def")
    rx655_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx655_pos)
    .return (rx655_cur)
  rx655_fail:
.annotate 'line', 4
    (rx655_rep, rx655_pos, $I10, $P10) = rx655_cur."!mark_fail"(0)
    lt rx655_pos, -1, rx655_done
    eq rx655_pos, -1, rx655_fail
    jump $I10
  rx655_done:
    rx655_cur."!cursor_fail"()
    rx655_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx655_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("158_1275160381.56318") :method
.annotate 'line', 4
    new $P657, "ResizablePMCArray"
    push $P657, ""
    .return ($P657)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("159_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx674_tgt
    .local int rx674_pos
    .local int rx674_off
    .local int rx674_eos
    .local int rx674_rep
    .local pmc rx674_cur
    (rx674_cur, rx674_pos, rx674_tgt) = self."!cursor_start"()
    rx674_cur."!cursor_debug"("START ", "signature")
    rx674_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx674_cur
    .local pmc match
    .lex "$/", match
    length rx674_eos, rx674_tgt
    set rx674_off, 0
    lt rx674_pos, 2, rx674_start
    sub rx674_off, rx674_pos, 1
    substr rx674_tgt, rx674_tgt, rx674_off
  rx674_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan677_done
    goto rxscan677_scan
  rxscan677_loop:
    ($P10) = rx674_cur."from"()
    inc $P10
    set rx674_pos, $P10
    ge rx674_pos, rx674_eos, rxscan677_done
  rxscan677_scan:
    set_addr $I10, rxscan677_loop
    rx674_cur."!mark_push"(0, rx674_pos, $I10)
  rxscan677_done:
.annotate 'line', 309
  # rx rxquantr678 ** 0..1
    set_addr $I681, rxquantr678_done
    rx674_cur."!mark_push"(0, rx674_pos, $I681)
  rxquantr678_loop:
  # rx rxquantr679 ** 1..*
    set_addr $I680, rxquantr679_done
    rx674_cur."!mark_push"(0, -1, $I680)
  rxquantr679_loop:
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."parameter"()
    unless $P10, rx674_fail
    rx674_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx674_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."ws"()
    unless $P10, rx674_fail
    rx674_pos = $P10."pos"()
    (rx674_rep) = rx674_cur."!mark_commit"($I680)
    rx674_cur."!mark_push"(rx674_rep, rx674_pos, $I680)
  # rx literal  ","
    add $I11, rx674_pos, 1
    gt $I11, rx674_eos, rx674_fail
    sub $I11, rx674_pos, rx674_off
    substr $S10, rx674_tgt, $I11, 1
    ne $S10, ",", rx674_fail
    add rx674_pos, 1
    goto rxquantr679_loop
  rxquantr679_done:
    (rx674_rep) = rx674_cur."!mark_commit"($I681)
  rxquantr678_done:
  # rx pass
    rx674_cur."!cursor_pass"(rx674_pos, "signature")
    rx674_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx674_pos)
    .return (rx674_cur)
  rx674_fail:
.annotate 'line', 4
    (rx674_rep, rx674_pos, $I10, $P10) = rx674_cur."!mark_fail"(0)
    lt rx674_pos, -1, rx674_done
    eq rx674_pos, -1, rx674_fail
    jump $I10
  rx674_done:
    rx674_cur."!cursor_fail"()
    rx674_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx674_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("160_1275160381.56318") :method
.annotate 'line', 4
    new $P676, "ResizablePMCArray"
    push $P676, ""
    .return ($P676)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("161_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx683_tgt
    .local int rx683_pos
    .local int rx683_off
    .local int rx683_eos
    .local int rx683_rep
    .local pmc rx683_cur
    (rx683_cur, rx683_pos, rx683_tgt) = self."!cursor_start"()
    rx683_cur."!cursor_debug"("START ", "parameter")
    rx683_cur."!cursor_caparray"("default_value", "typename")
    .lex unicode:"$\x{a2}", rx683_cur
    .local pmc match
    .lex "$/", match
    length rx683_eos, rx683_tgt
    set rx683_off, 0
    lt rx683_pos, 2, rx683_start
    sub rx683_off, rx683_pos, 1
    substr rx683_tgt, rx683_tgt, rx683_off
  rx683_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan686_done
    goto rxscan686_scan
  rxscan686_loop:
    ($P10) = rx683_cur."from"()
    inc $P10
    set rx683_pos, $P10
    ge rx683_pos, rx683_eos, rxscan686_done
  rxscan686_scan:
    set_addr $I10, rxscan686_loop
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  rxscan686_done:
.annotate 'line', 312
  # rx rxquantr687 ** 0..*
    set_addr $I688, rxquantr687_done
    rx683_cur."!mark_push"(0, rx683_pos, $I688)
  rxquantr687_loop:
  # rx subrule "typename" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."typename"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx683_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."ws"()
    unless $P10, rx683_fail
    rx683_pos = $P10."pos"()
    (rx683_rep) = rx683_cur."!mark_commit"($I688)
    rx683_cur."!mark_push"(rx683_rep, rx683_pos, $I688)
    goto rxquantr687_loop
  rxquantr687_done:
  alt689_0:
.annotate 'line', 313
    set_addr $I10, alt689_1
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
.annotate 'line', 314
  # rx subcapture "quant"
    set_addr $I10, rxcap_690_fail
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx literal  "*"
    add $I11, rx683_pos, 1
    gt $I11, rx683_eos, rx683_fail
    sub $I11, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I11, 1
    ne $S10, "*", rx683_fail
    add rx683_pos, 1
    set_addr $I10, rxcap_690_fail
    ($I12, $I11) = rx683_cur."!mark_peek"($I10)
    rx683_cur."!cursor_pos"($I11)
    ($P10) = rx683_cur."!cursor_start"()
    $P10."!cursor_pass"(rx683_pos, "")
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_690_done
  rxcap_690_fail:
    goto rx683_fail
  rxcap_690_done:
  # rx subrule "param_var" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."param_var"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx683_pos = $P10."pos"()
    goto alt689_end
  alt689_1:
  alt691_0:
.annotate 'line', 315
    set_addr $I10, alt691_1
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."param_var"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx683_pos = $P10."pos"()
    goto alt691_end
  alt691_1:
  # rx subrule "named_param" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."named_param"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx683_pos = $P10."pos"()
  alt691_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_693_fail
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  alt692_0:
    set_addr $I10, alt692_1
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx literal  "?"
    add $I11, rx683_pos, 1
    gt $I11, rx683_eos, rx683_fail
    sub $I11, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I11, 1
    ne $S10, "?", rx683_fail
    add rx683_pos, 1
    goto alt692_end
  alt692_1:
    set_addr $I10, alt692_2
    rx683_cur."!mark_push"(0, rx683_pos, $I10)
  # rx literal  "!"
    add $I11, rx683_pos, 1
    gt $I11, rx683_eos, rx683_fail
    sub $I11, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I11, 1
    ne $S10, "!", rx683_fail
    add rx683_pos, 1
    goto alt692_end
  alt692_2:
  alt692_end:
    set_addr $I10, rxcap_693_fail
    ($I12, $I11) = rx683_cur."!mark_peek"($I10)
    rx683_cur."!cursor_pos"($I11)
    ($P10) = rx683_cur."!cursor_start"()
    $P10."!cursor_pass"(rx683_pos, "")
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_693_done
  rxcap_693_fail:
    goto rx683_fail
  rxcap_693_done:
  alt689_end:
.annotate 'line', 317
  # rx rxquantr694 ** 0..1
    set_addr $I695, rxquantr694_done
    rx683_cur."!mark_push"(0, rx683_pos, $I695)
  rxquantr694_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."default_value"()
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx683_pos = $P10."pos"()
    (rx683_rep) = rx683_cur."!mark_commit"($I695)
  rxquantr694_done:
.annotate 'line', 311
  # rx pass
    rx683_cur."!cursor_pass"(rx683_pos, "parameter")
    rx683_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx683_pos)
    .return (rx683_cur)
  rx683_fail:
.annotate 'line', 4
    (rx683_rep, rx683_pos, $I10, $P10) = rx683_cur."!mark_fail"(0)
    lt rx683_pos, -1, rx683_done
    eq rx683_pos, -1, rx683_fail
    jump $I10
  rx683_done:
    rx683_cur."!cursor_fail"()
    rx683_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx683_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("162_1275160381.56318") :method
.annotate 'line', 4
    new $P685, "ResizablePMCArray"
    push $P685, ""
    .return ($P685)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("163_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx697_tgt
    .local int rx697_pos
    .local int rx697_off
    .local int rx697_eos
    .local int rx697_rep
    .local pmc rx697_cur
    (rx697_cur, rx697_pos, rx697_tgt) = self."!cursor_start"()
    rx697_cur."!cursor_debug"("START ", "param_var")
    rx697_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx697_cur
    .local pmc match
    .lex "$/", match
    length rx697_eos, rx697_tgt
    set rx697_off, 0
    lt rx697_pos, 2, rx697_start
    sub rx697_off, rx697_pos, 1
    substr rx697_tgt, rx697_tgt, rx697_off
  rx697_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan701_done
    goto rxscan701_scan
  rxscan701_loop:
    ($P10) = rx697_cur."from"()
    inc $P10
    set rx697_pos, $P10
    ge rx697_pos, rx697_eos, rxscan701_done
  rxscan701_scan:
    set_addr $I10, rxscan701_loop
    rx697_cur."!mark_push"(0, rx697_pos, $I10)
  rxscan701_done:
.annotate 'line', 321
  # rx subrule "sigil" subtype=capture negate=
    rx697_cur."!cursor_pos"(rx697_pos)
    $P10 = rx697_cur."sigil"()
    unless $P10, rx697_fail
    rx697_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx697_pos = $P10."pos"()
  # rx rxquantr702 ** 0..1
    set_addr $I703, rxquantr702_done
    rx697_cur."!mark_push"(0, rx697_pos, $I703)
  rxquantr702_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx697_cur."!cursor_pos"(rx697_pos)
    $P10 = rx697_cur."twigil"()
    unless $P10, rx697_fail
    rx697_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx697_pos = $P10."pos"()
    (rx697_rep) = rx697_cur."!mark_commit"($I703)
  rxquantr702_done:
  alt704_0:
.annotate 'line', 322
    set_addr $I10, alt704_1
    rx697_cur."!mark_push"(0, rx697_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx697_cur."!cursor_pos"(rx697_pos)
    $P10 = rx697_cur."ident"()
    unless $P10, rx697_fail
    rx697_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx697_pos = $P10."pos"()
    goto alt704_end
  alt704_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_705_fail
    rx697_cur."!mark_push"(0, rx697_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx697_pos, rx697_eos, rx697_fail
    sub $I10, rx697_pos, rx697_off
    substr $S10, rx697_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx697_fail
    inc rx697_pos
    set_addr $I10, rxcap_705_fail
    ($I12, $I11) = rx697_cur."!mark_peek"($I10)
    rx697_cur."!cursor_pos"($I11)
    ($P10) = rx697_cur."!cursor_start"()
    $P10."!cursor_pass"(rx697_pos, "")
    rx697_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_705_done
  rxcap_705_fail:
    goto rx697_fail
  rxcap_705_done:
  alt704_end:
.annotate 'line', 320
  # rx pass
    rx697_cur."!cursor_pass"(rx697_pos, "param_var")
    rx697_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx697_pos)
    .return (rx697_cur)
  rx697_fail:
.annotate 'line', 4
    (rx697_rep, rx697_pos, $I10, $P10) = rx697_cur."!mark_fail"(0)
    lt rx697_pos, -1, rx697_done
    eq rx697_pos, -1, rx697_fail
    jump $I10
  rx697_done:
    rx697_cur."!cursor_fail"()
    rx697_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx697_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("164_1275160381.56318") :method
.annotate 'line', 4
    $P699 = self."!PREFIX__!subrule"("sigil", "")
    new $P700, "ResizablePMCArray"
    push $P700, $P699
    .return ($P700)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("165_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    (rx707_cur, rx707_pos, rx707_tgt) = self."!cursor_start"()
    rx707_cur."!cursor_debug"("START ", "named_param")
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
.annotate 'line', 326
  # rx literal  ":"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, ":", rx707_fail
    add rx707_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."param_var"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx707_pos = $P10."pos"()
.annotate 'line', 325
  # rx pass
    rx707_cur."!cursor_pass"(rx707_pos, "named_param")
    rx707_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx707_pos)
    .return (rx707_cur)
  rx707_fail:
.annotate 'line', 4
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    rx707_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("166_1275160381.56318") :method
.annotate 'line', 4
    $P709 = self."!PREFIX__!subrule"("param_var", ":")
    new $P710, "ResizablePMCArray"
    push $P710, $P709
    .return ($P710)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("167_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    (rx713_cur, rx713_pos, rx713_tgt) = self."!cursor_start"()
    rx713_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx713_cur
    .local pmc match
    .lex "$/", match
    length rx713_eos, rx713_tgt
    set rx713_off, 0
    lt rx713_pos, 2, rx713_start
    sub rx713_off, rx713_pos, 1
    substr rx713_tgt, rx713_tgt, rx713_off
  rx713_start:
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
.annotate 'line', 329
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    substr $S10, rx713_tgt, $I11, 1
    ne $S10, "=", rx713_fail
    add rx713_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."EXPR"("i=")
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx713_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
  # rx pass
    rx713_cur."!cursor_pass"(rx713_pos, "default_value")
    rx713_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx713_pos)
    .return (rx713_cur)
  rx713_fail:
.annotate 'line', 4
    (rx713_rep, rx713_pos, $I10, $P10) = rx713_cur."!mark_fail"(0)
    lt rx713_pos, -1, rx713_done
    eq rx713_pos, -1, rx713_fail
    jump $I10
  rx713_done:
    rx713_cur."!cursor_fail"()
    rx713_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("168_1275160381.56318") :method
.annotate 'line', 4
    new $P715, "ResizablePMCArray"
    push $P715, ""
    .return ($P715)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("169_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx721_tgt
    .local int rx721_pos
    .local int rx721_off
    .local int rx721_eos
    .local int rx721_rep
    .local pmc rx721_cur
    (rx721_cur, rx721_pos, rx721_tgt) = self."!cursor_start"()
    rx721_cur."!cursor_debug"("START ", "regex_declarator")
    rx721_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx721_cur
    .local pmc match
    .lex "$/", match
    length rx721_eos, rx721_tgt
    set rx721_off, 0
    lt rx721_pos, 2, rx721_start
    sub rx721_off, rx721_pos, 1
    substr rx721_tgt, rx721_tgt, rx721_off
  rx721_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan724_done
    goto rxscan724_scan
  rxscan724_loop:
    ($P10) = rx721_cur."from"()
    inc $P10
    set rx721_pos, $P10
    ge rx721_pos, rx721_eos, rxscan724_done
  rxscan724_scan:
    set_addr $I10, rxscan724_loop
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  rxscan724_done:
.annotate 'line', 331
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt726_0:
.annotate 'line', 332
    set_addr $I10, alt726_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
.annotate 'line', 333
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_728_fail
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx literal  "proto"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "proto", rx721_fail
    add rx721_pos, 5
    set_addr $I10, rxcap_728_fail
    ($I12, $I11) = rx721_cur."!mark_peek"($I10)
    rx721_cur."!cursor_pos"($I11)
    ($P10) = rx721_cur."!cursor_start"()
    $P10."!cursor_pass"(rx721_pos, "")
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_728_done
  rxcap_728_fail:
    goto rx721_fail
  rxcap_728_done:
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt730_0:
    set_addr $I10, alt730_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx literal  "regex"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "regex", rx721_fail
    add rx721_pos, 5
    goto alt730_end
  alt730_1:
    set_addr $I10, alt730_2
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx literal  "token"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "token", rx721_fail
    add rx721_pos, 5
    goto alt730_end
  alt730_2:
  # rx literal  "rule"
    add $I11, rx721_pos, 4
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 4
    ne $S10, "rule", rx721_fail
    add rx721_pos, 4
  alt730_end:
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 334
  # rx subrule "deflongname" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."deflongname"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx721_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt733_0:
.annotate 'line', 335
    set_addr $I10, alt733_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
.annotate 'line', 336
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, "{", rx721_fail
    add rx721_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "<...>", rx721_fail
    add rx721_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, "}", rx721_fail
    add rx721_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ENDSTMT"()
    unless $P10, rx721_fail
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
    goto alt733_end
  alt733_1:
.annotate 'line', 337
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt733_end:
.annotate 'line', 338
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 333
    goto alt726_end
  alt726_1:
.annotate 'line', 339
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_743_fail
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  alt742_0:
    set_addr $I10, alt742_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx literal  "regex"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "regex", rx721_fail
    add rx721_pos, 5
    goto alt742_end
  alt742_1:
    set_addr $I10, alt742_2
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
  # rx literal  "token"
    add $I11, rx721_pos, 5
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 5
    ne $S10, "token", rx721_fail
    add rx721_pos, 5
    goto alt742_end
  alt742_2:
  # rx literal  "rule"
    add $I11, rx721_pos, 4
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 4
    ne $S10, "rule", rx721_fail
    add rx721_pos, 4
  alt742_end:
    set_addr $I10, rxcap_743_fail
    ($I12, $I11) = rx721_cur."!mark_peek"($I10)
    rx721_cur."!cursor_pos"($I11)
    ($P10) = rx721_cur."!cursor_start"()
    $P10."!cursor_pass"(rx721_pos, "")
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_743_done
  rxcap_743_fail:
    goto rx721_fail
  rxcap_743_done:
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 340
  # rx subrule "deflongname" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."deflongname"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx721_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 341
  # rx subrule "newpad" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."newpad"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 342
  # rx rxquantr747 ** 0..1
    set_addr $I752, rxquantr747_done
    rx721_cur."!mark_push"(0, rx721_pos, $I752)
  rxquantr747_loop:
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, "(", rx721_fail
    add rx721_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."signature"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx721_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, ")", rx721_fail
    add rx721_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
    (rx721_rep) = rx721_cur."!mark_commit"($I752)
  rxquantr747_done:
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 343
  # rx reduce name="regex_declarator" key="open"
    rx721_cur."!cursor_pos"(rx721_pos)
    rx721_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 344
  # rx literal  "{"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, "{", rx721_fail
    add rx721_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."LANG"("Regex", "nibbler")
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx721_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx721_pos, 1
    gt $I11, rx721_eos, rx721_fail
    sub $I11, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I11, 1
    ne $S10, "}", rx721_fail
    add rx721_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ENDSTMT"()
    unless $P10, rx721_fail
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
  alt726_end:
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."ws"()
    unless $P10, rx721_fail
    rx721_pos = $P10."pos"()
.annotate 'line', 331
  # rx pass
    rx721_cur."!cursor_pass"(rx721_pos, "regex_declarator")
    rx721_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx721_pos)
    .return (rx721_cur)
  rx721_fail:
.annotate 'line', 4
    (rx721_rep, rx721_pos, $I10, $P10) = rx721_cur."!mark_fail"(0)
    lt rx721_pos, -1, rx721_done
    eq rx721_pos, -1, rx721_fail
    jump $I10
  rx721_done:
    rx721_cur."!cursor_fail"()
    rx721_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx721_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("170_1275160381.56318") :method
.annotate 'line', 4
    new $P723, "ResizablePMCArray"
    push $P723, ""
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("171_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx758_tgt
    .local int rx758_pos
    .local int rx758_off
    .local int rx758_eos
    .local int rx758_rep
    .local pmc rx758_cur
    (rx758_cur, rx758_pos, rx758_tgt) = self."!cursor_start"()
    rx758_cur."!cursor_debug"("START ", "dotty")
    rx758_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx758_cur
    .local pmc match
    .lex "$/", match
    length rx758_eos, rx758_tgt
    set rx758_off, 0
    lt rx758_pos, 2, rx758_start
    sub rx758_off, rx758_pos, 1
    substr rx758_tgt, rx758_tgt, rx758_off
  rx758_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan762_done
    goto rxscan762_scan
  rxscan762_loop:
    ($P10) = rx758_cur."from"()
    inc $P10
    set rx758_pos, $P10
    ge rx758_pos, rx758_eos, rxscan762_done
  rxscan762_scan:
    set_addr $I10, rxscan762_loop
    rx758_cur."!mark_push"(0, rx758_pos, $I10)
  rxscan762_done:
.annotate 'line', 349
  # rx literal  "."
    add $I11, rx758_pos, 1
    gt $I11, rx758_eos, rx758_fail
    sub $I11, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I11, 1
    ne $S10, ".", rx758_fail
    add rx758_pos, 1
  alt763_0:
.annotate 'line', 350
    set_addr $I10, alt763_1
    rx758_cur."!mark_push"(0, rx758_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."identifier"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx758_pos = $P10."pos"()
    goto alt763_end
  alt763_1:
.annotate 'line', 351
  # rx enumcharlist negate=0 zerowidth
    ge rx758_pos, rx758_eos, rx758_fail
    sub $I10, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx758_fail
  # rx subrule "quote" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."quote"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx758_pos = $P10."pos"()
  alt764_0:
.annotate 'line', 352
    set_addr $I10, alt764_1
    rx758_cur."!mark_push"(0, rx758_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx758_pos, rx758_eos, rx758_fail
    sub $I10, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx758_fail
    goto alt764_end
  alt764_1:
  # rx subrule "panic" subtype=method negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx758_fail
    rx758_pos = $P10."pos"()
  alt764_end:
  alt763_end:
.annotate 'line', 358
  # rx rxquantr765 ** 0..1
    set_addr $I767, rxquantr765_done
    rx758_cur."!mark_push"(0, rx758_pos, $I767)
  rxquantr765_loop:
  alt766_0:
.annotate 'line', 355
    set_addr $I10, alt766_1
    rx758_cur."!mark_push"(0, rx758_pos, $I10)
.annotate 'line', 356
  # rx enumcharlist negate=0 zerowidth
    ge rx758_pos, rx758_eos, rx758_fail
    sub $I10, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx758_fail
  # rx subrule "args" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."args"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx758_pos = $P10."pos"()
    goto alt766_end
  alt766_1:
.annotate 'line', 357
  # rx literal  ":"
    add $I11, rx758_pos, 1
    gt $I11, rx758_eos, rx758_fail
    sub $I11, rx758_pos, rx758_off
    substr $S10, rx758_tgt, $I11, 1
    ne $S10, ":", rx758_fail
    add rx758_pos, 1
  # rx charclass s
    ge rx758_pos, rx758_eos, rx758_fail
    sub $I10, rx758_pos, rx758_off
    is_cclass $I11, 32, rx758_tgt, $I10
    unless $I11, rx758_fail
    inc rx758_pos
  # rx subrule "arglist" subtype=capture negate=
    rx758_cur."!cursor_pos"(rx758_pos)
    $P10 = rx758_cur."arglist"()
    unless $P10, rx758_fail
    rx758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx758_pos = $P10."pos"()
  alt766_end:
.annotate 'line', 358
    (rx758_rep) = rx758_cur."!mark_commit"($I767)
  rxquantr765_done:
.annotate 'line', 348
  # rx pass
    rx758_cur."!cursor_pass"(rx758_pos, "dotty")
    rx758_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx758_pos)
    .return (rx758_cur)
  rx758_fail:
.annotate 'line', 4
    (rx758_rep, rx758_pos, $I10, $P10) = rx758_cur."!mark_fail"(0)
    lt rx758_pos, -1, rx758_done
    eq rx758_pos, -1, rx758_fail
    jump $I10
  rx758_done:
    rx758_cur."!cursor_fail"()
    rx758_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx758_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("172_1275160381.56318") :method
.annotate 'line', 4
    $P760 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P761, "ResizablePMCArray"
    push $P761, "'"
    push $P761, "\""
    push $P761, $P760
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("173_1275160381.56318") :method
.annotate 'line', 362
    $P769 = self."!protoregex"("term")
    .return ($P769)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("174_1275160381.56318") :method
.annotate 'line', 362
    $P771 = self."!PREFIX__!protoregex"("term")
    .return ($P771)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("175_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx773_tgt
    .local int rx773_pos
    .local int rx773_off
    .local int rx773_eos
    .local int rx773_rep
    .local pmc rx773_cur
    (rx773_cur, rx773_pos, rx773_tgt) = self."!cursor_start"()
    rx773_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx773_cur
    .local pmc match
    .lex "$/", match
    length rx773_eos, rx773_tgt
    set rx773_off, 0
    lt rx773_pos, 2, rx773_start
    sub rx773_off, rx773_pos, 1
    substr rx773_tgt, rx773_tgt, rx773_off
  rx773_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan776_done
    goto rxscan776_scan
  rxscan776_loop:
    ($P10) = rx773_cur."from"()
    inc $P10
    set rx773_pos, $P10
    ge rx773_pos, rx773_eos, rxscan776_done
  rxscan776_scan:
    set_addr $I10, rxscan776_loop
    rx773_cur."!mark_push"(0, rx773_pos, $I10)
  rxscan776_done:
.annotate 'line', 364
  # rx subcapture "sym"
    set_addr $I10, rxcap_777_fail
    rx773_cur."!mark_push"(0, rx773_pos, $I10)
  # rx literal  "self"
    add $I11, rx773_pos, 4
    gt $I11, rx773_eos, rx773_fail
    sub $I11, rx773_pos, rx773_off
    substr $S10, rx773_tgt, $I11, 4
    ne $S10, "self", rx773_fail
    add rx773_pos, 4
    set_addr $I10, rxcap_777_fail
    ($I12, $I11) = rx773_cur."!mark_peek"($I10)
    rx773_cur."!cursor_pos"($I11)
    ($P10) = rx773_cur."!cursor_start"()
    $P10."!cursor_pass"(rx773_pos, "")
    rx773_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_777_done
  rxcap_777_fail:
    goto rx773_fail
  rxcap_777_done:
  # rxanchor rwb
    le rx773_pos, 0, rx773_fail
    sub $I10, rx773_pos, rx773_off
    is_cclass $I11, 8192, rx773_tgt, $I10
    if $I11, rx773_fail
    dec $I10
    is_cclass $I11, 8192, rx773_tgt, $I10
    unless $I11, rx773_fail
  # rx pass
    rx773_cur."!cursor_pass"(rx773_pos, "term:sym<self>")
    rx773_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx773_pos)
    .return (rx773_cur)
  rx773_fail:
.annotate 'line', 4
    (rx773_rep, rx773_pos, $I10, $P10) = rx773_cur."!mark_fail"(0)
    lt rx773_pos, -1, rx773_done
    eq rx773_pos, -1, rx773_fail
    jump $I10
  rx773_done:
    rx773_cur."!cursor_fail"()
    rx773_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx773_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("176_1275160381.56318") :method
.annotate 'line', 4
    new $P775, "ResizablePMCArray"
    push $P775, "self"
    .return ($P775)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("177_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx779_tgt
    .local int rx779_pos
    .local int rx779_off
    .local int rx779_eos
    .local int rx779_rep
    .local pmc rx779_cur
    (rx779_cur, rx779_pos, rx779_tgt) = self."!cursor_start"()
    rx779_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx779_cur
    .local pmc match
    .lex "$/", match
    length rx779_eos, rx779_tgt
    set rx779_off, 0
    lt rx779_pos, 2, rx779_start
    sub rx779_off, rx779_pos, 1
    substr rx779_tgt, rx779_tgt, rx779_off
  rx779_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan783_done
    goto rxscan783_scan
  rxscan783_loop:
    ($P10) = rx779_cur."from"()
    inc $P10
    set rx779_pos, $P10
    ge rx779_pos, rx779_eos, rxscan783_done
  rxscan783_scan:
    set_addr $I10, rxscan783_loop
    rx779_cur."!mark_push"(0, rx779_pos, $I10)
  rxscan783_done:
.annotate 'line', 367
  # rx subrule "identifier" subtype=capture negate=
    rx779_cur."!cursor_pos"(rx779_pos)
    $P10 = rx779_cur."identifier"()
    unless $P10, rx779_fail
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx779_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx779_pos, rx779_eos, rx779_fail
    sub $I10, rx779_pos, rx779_off
    substr $S10, rx779_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx779_fail
  # rx subrule "args" subtype=capture negate=
    rx779_cur."!cursor_pos"(rx779_pos)
    $P10 = rx779_cur."args"()
    unless $P10, rx779_fail
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx779_pos = $P10."pos"()
.annotate 'line', 366
  # rx pass
    rx779_cur."!cursor_pass"(rx779_pos, "term:sym<identifier>")
    rx779_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx779_pos)
    .return (rx779_cur)
  rx779_fail:
.annotate 'line', 4
    (rx779_rep, rx779_pos, $I10, $P10) = rx779_cur."!mark_fail"(0)
    lt rx779_pos, -1, rx779_done
    eq rx779_pos, -1, rx779_fail
    jump $I10
  rx779_done:
    rx779_cur."!cursor_fail"()
    rx779_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx779_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("178_1275160381.56318") :method
.annotate 'line', 4
    $P781 = self."!PREFIX__!subrule"("identifier", "")
    new $P782, "ResizablePMCArray"
    push $P782, $P781
    .return ($P782)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("179_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx785_tgt
    .local int rx785_pos
    .local int rx785_off
    .local int rx785_eos
    .local int rx785_rep
    .local pmc rx785_cur
    (rx785_cur, rx785_pos, rx785_tgt) = self."!cursor_start"()
    rx785_cur."!cursor_debug"("START ", "term:sym<name>")
    rx785_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx785_cur
    .local pmc match
    .lex "$/", match
    length rx785_eos, rx785_tgt
    set rx785_off, 0
    lt rx785_pos, 2, rx785_start
    sub rx785_off, rx785_pos, 1
    substr rx785_tgt, rx785_tgt, rx785_off
  rx785_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan789_done
    goto rxscan789_scan
  rxscan789_loop:
    ($P10) = rx785_cur."from"()
    inc $P10
    set rx785_pos, $P10
    ge rx785_pos, rx785_eos, rxscan789_done
  rxscan789_scan:
    set_addr $I10, rxscan789_loop
    rx785_cur."!mark_push"(0, rx785_pos, $I10)
  rxscan789_done:
.annotate 'line', 371
  # rx subrule "name" subtype=capture negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."name"()
    unless $P10, rx785_fail
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx785_pos = $P10."pos"()
  # rx rxquantr790 ** 0..1
    set_addr $I791, rxquantr790_done
    rx785_cur."!mark_push"(0, rx785_pos, $I791)
  rxquantr790_loop:
  # rx subrule "args" subtype=capture negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."args"()
    unless $P10, rx785_fail
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx785_pos = $P10."pos"()
    (rx785_rep) = rx785_cur."!mark_commit"($I791)
  rxquantr790_done:
.annotate 'line', 370
  # rx pass
    rx785_cur."!cursor_pass"(rx785_pos, "term:sym<name>")
    rx785_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx785_pos)
    .return (rx785_cur)
  rx785_fail:
.annotate 'line', 4
    (rx785_rep, rx785_pos, $I10, $P10) = rx785_cur."!mark_fail"(0)
    lt rx785_pos, -1, rx785_done
    eq rx785_pos, -1, rx785_fail
    jump $I10
  rx785_done:
    rx785_cur."!cursor_fail"()
    rx785_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx785_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("180_1275160381.56318") :method
.annotate 'line', 4
    $P787 = self."!PREFIX__!subrule"("name", "")
    new $P788, "ResizablePMCArray"
    push $P788, $P787
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("181_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx793_tgt
    .local int rx793_pos
    .local int rx793_off
    .local int rx793_eos
    .local int rx793_rep
    .local pmc rx793_cur
    (rx793_cur, rx793_pos, rx793_tgt) = self."!cursor_start"()
    rx793_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx793_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx793_cur
    .local pmc match
    .lex "$/", match
    length rx793_eos, rx793_tgt
    set rx793_off, 0
    lt rx793_pos, 2, rx793_start
    sub rx793_off, rx793_pos, 1
    substr rx793_tgt, rx793_tgt, rx793_off
  rx793_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan796_done
    goto rxscan796_scan
  rxscan796_loop:
    ($P10) = rx793_cur."from"()
    inc $P10
    set rx793_pos, $P10
    ge rx793_pos, rx793_eos, rxscan796_done
  rxscan796_scan:
    set_addr $I10, rxscan796_loop
    rx793_cur."!mark_push"(0, rx793_pos, $I10)
  rxscan796_done:
.annotate 'line', 375
  # rx literal  "pir::"
    add $I11, rx793_pos, 5
    gt $I11, rx793_eos, rx793_fail
    sub $I11, rx793_pos, rx793_off
    substr $S10, rx793_tgt, $I11, 5
    ne $S10, "pir::", rx793_fail
    add rx793_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_797_fail
    rx793_cur."!mark_push"(0, rx793_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx793_pos, rx793_off
    find_not_cclass $I11, 8192, rx793_tgt, $I10, rx793_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx793_fail
    add rx793_pos, rx793_off, $I11
    set_addr $I10, rxcap_797_fail
    ($I12, $I11) = rx793_cur."!mark_peek"($I10)
    rx793_cur."!cursor_pos"($I11)
    ($P10) = rx793_cur."!cursor_start"()
    $P10."!cursor_pass"(rx793_pos, "")
    rx793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_797_done
  rxcap_797_fail:
    goto rx793_fail
  rxcap_797_done:
  # rx rxquantr798 ** 0..1
    set_addr $I799, rxquantr798_done
    rx793_cur."!mark_push"(0, rx793_pos, $I799)
  rxquantr798_loop:
  # rx subrule "args" subtype=capture negate=
    rx793_cur."!cursor_pos"(rx793_pos)
    $P10 = rx793_cur."args"()
    unless $P10, rx793_fail
    rx793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx793_pos = $P10."pos"()
    (rx793_rep) = rx793_cur."!mark_commit"($I799)
  rxquantr798_done:
.annotate 'line', 374
  # rx pass
    rx793_cur."!cursor_pass"(rx793_pos, "term:sym<pir::op>")
    rx793_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx793_pos)
    .return (rx793_cur)
  rx793_fail:
.annotate 'line', 4
    (rx793_rep, rx793_pos, $I10, $P10) = rx793_cur."!mark_fail"(0)
    lt rx793_pos, -1, rx793_done
    eq rx793_pos, -1, rx793_fail
    jump $I10
  rx793_done:
    rx793_cur."!cursor_fail"()
    rx793_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx793_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("182_1275160381.56318") :method
.annotate 'line', 4
    new $P795, "ResizablePMCArray"
    push $P795, "pir::"
    .return ($P795)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("183_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx801_tgt
    .local int rx801_pos
    .local int rx801_off
    .local int rx801_eos
    .local int rx801_rep
    .local pmc rx801_cur
    (rx801_cur, rx801_pos, rx801_tgt) = self."!cursor_start"()
    rx801_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx801_cur
    .local pmc match
    .lex "$/", match
    length rx801_eos, rx801_tgt
    set rx801_off, 0
    lt rx801_pos, 2, rx801_start
    sub rx801_off, rx801_pos, 1
    substr rx801_tgt, rx801_tgt, rx801_off
  rx801_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan805_done
    goto rxscan805_scan
  rxscan805_loop:
    ($P10) = rx801_cur."from"()
    inc $P10
    set rx801_pos, $P10
    ge rx801_pos, rx801_eos, rxscan805_done
  rxscan805_scan:
    set_addr $I10, rxscan805_loop
    rx801_cur."!mark_push"(0, rx801_pos, $I10)
  rxscan805_done:
.annotate 'line', 379
  # rx literal  "("
    add $I11, rx801_pos, 1
    gt $I11, rx801_eos, rx801_fail
    sub $I11, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I11, 1
    ne $S10, "(", rx801_fail
    add rx801_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx801_cur."!cursor_pos"(rx801_pos)
    $P10 = rx801_cur."arglist"()
    unless $P10, rx801_fail
    rx801_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx801_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx801_pos, 1
    gt $I11, rx801_eos, rx801_fail
    sub $I11, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I11, 1
    ne $S10, ")", rx801_fail
    add rx801_pos, 1
  # rx pass
    rx801_cur."!cursor_pass"(rx801_pos, "args")
    rx801_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx801_pos)
    .return (rx801_cur)
  rx801_fail:
.annotate 'line', 4
    (rx801_rep, rx801_pos, $I10, $P10) = rx801_cur."!mark_fail"(0)
    lt rx801_pos, -1, rx801_done
    eq rx801_pos, -1, rx801_fail
    jump $I10
  rx801_done:
    rx801_cur."!cursor_fail"()
    rx801_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx801_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("184_1275160381.56318") :method
.annotate 'line', 4
    $P803 = self."!PREFIX__!subrule"("arglist", "(")
    new $P804, "ResizablePMCArray"
    push $P804, $P803
    .return ($P804)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("185_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx807_tgt
    .local int rx807_pos
    .local int rx807_off
    .local int rx807_eos
    .local int rx807_rep
    .local pmc rx807_cur
    (rx807_cur, rx807_pos, rx807_tgt) = self."!cursor_start"()
    rx807_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx807_cur
    .local pmc match
    .lex "$/", match
    length rx807_eos, rx807_tgt
    set rx807_off, 0
    lt rx807_pos, 2, rx807_start
    sub rx807_off, rx807_pos, 1
    substr rx807_tgt, rx807_tgt, rx807_off
  rx807_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan811_done
    goto rxscan811_scan
  rxscan811_loop:
    ($P10) = rx807_cur."from"()
    inc $P10
    set rx807_pos, $P10
    ge rx807_pos, rx807_eos, rxscan811_done
  rxscan811_scan:
    set_addr $I10, rxscan811_loop
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
  rxscan811_done:
.annotate 'line', 383
  # rx subrule "ws" subtype=method negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."ws"()
    unless $P10, rx807_fail
    rx807_pos = $P10."pos"()
  alt812_0:
.annotate 'line', 384
    set_addr $I10, alt812_1
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
.annotate 'line', 385
  # rx subrule "EXPR" subtype=capture negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."EXPR"("f=")
    unless $P10, rx807_fail
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx807_pos = $P10."pos"()
    goto alt812_end
  alt812_1:
  alt812_end:
.annotate 'line', 382
  # rx pass
    rx807_cur."!cursor_pass"(rx807_pos, "arglist")
    rx807_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx807_pos)
    .return (rx807_cur)
  rx807_fail:
.annotate 'line', 4
    (rx807_rep, rx807_pos, $I10, $P10) = rx807_cur."!mark_fail"(0)
    lt rx807_pos, -1, rx807_done
    eq rx807_pos, -1, rx807_fail
    jump $I10
  rx807_done:
    rx807_cur."!cursor_fail"()
    rx807_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx807_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("186_1275160381.56318") :method
.annotate 'line', 4
    $P809 = self."!PREFIX__!subrule"("", "")
    new $P810, "ResizablePMCArray"
    push $P810, $P809
    .return ($P810)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("187_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx814_tgt
    .local int rx814_pos
    .local int rx814_off
    .local int rx814_eos
    .local int rx814_rep
    .local pmc rx814_cur
    (rx814_cur, rx814_pos, rx814_tgt) = self."!cursor_start"()
    rx814_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx814_cur
    .local pmc match
    .lex "$/", match
    length rx814_eos, rx814_tgt
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
.annotate 'line', 391
  # rx subrule "value" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."value"()
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx814_pos = $P10."pos"()
  # rx pass
    rx814_cur."!cursor_pass"(rx814_pos, "term:sym<value>")
    rx814_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx814_pos)
    .return (rx814_cur)
  rx814_fail:
.annotate 'line', 4
    (rx814_rep, rx814_pos, $I10, $P10) = rx814_cur."!mark_fail"(0)
    lt rx814_pos, -1, rx814_done
    eq rx814_pos, -1, rx814_fail
    jump $I10
  rx814_done:
    rx814_cur."!cursor_fail"()
    rx814_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx814_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("188_1275160381.56318") :method
.annotate 'line', 4
    $P816 = self."!PREFIX__!subrule"("value", "")
    new $P817, "ResizablePMCArray"
    push $P817, $P816
    .return ($P817)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("189_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx820_tgt
    .local int rx820_pos
    .local int rx820_off
    .local int rx820_eos
    .local int rx820_rep
    .local pmc rx820_cur
    (rx820_cur, rx820_pos, rx820_tgt) = self."!cursor_start"()
    rx820_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx820_cur
    .local pmc match
    .lex "$/", match
    length rx820_eos, rx820_tgt
    set rx820_off, 0
    lt rx820_pos, 2, rx820_start
    sub rx820_off, rx820_pos, 1
    substr rx820_tgt, rx820_tgt, rx820_off
  rx820_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan825_done
    goto rxscan825_scan
  rxscan825_loop:
    ($P10) = rx820_cur."from"()
    inc $P10
    set rx820_pos, $P10
    ge rx820_pos, rx820_eos, rxscan825_done
  rxscan825_scan:
    set_addr $I10, rxscan825_loop
    rx820_cur."!mark_push"(0, rx820_pos, $I10)
  rxscan825_done:
  alt826_0:
.annotate 'line', 393
    set_addr $I10, alt826_1
    rx820_cur."!mark_push"(0, rx820_pos, $I10)
.annotate 'line', 394
  # rx subrule "quote" subtype=capture negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."quote"()
    unless $P10, rx820_fail
    rx820_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx820_pos = $P10."pos"()
    goto alt826_end
  alt826_1:
.annotate 'line', 395
  # rx subrule "number" subtype=capture negate=
    rx820_cur."!cursor_pos"(rx820_pos)
    $P10 = rx820_cur."number"()
    unless $P10, rx820_fail
    rx820_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx820_pos = $P10."pos"()
  alt826_end:
.annotate 'line', 393
  # rx pass
    rx820_cur."!cursor_pass"(rx820_pos, "value")
    rx820_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx820_pos)
    .return (rx820_cur)
  rx820_fail:
.annotate 'line', 4
    (rx820_rep, rx820_pos, $I10, $P10) = rx820_cur."!mark_fail"(0)
    lt rx820_pos, -1, rx820_done
    eq rx820_pos, -1, rx820_fail
    jump $I10
  rx820_done:
    rx820_cur."!cursor_fail"()
    rx820_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx820_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("190_1275160381.56318") :method
.annotate 'line', 4
    $P822 = self."!PREFIX__!subrule"("number", "")
    $P823 = self."!PREFIX__!subrule"("quote", "")
    new $P824, "ResizablePMCArray"
    push $P824, $P822
    push $P824, $P823
    .return ($P824)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("191_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx828_tgt
    .local int rx828_pos
    .local int rx828_off
    .local int rx828_eos
    .local int rx828_rep
    .local pmc rx828_cur
    (rx828_cur, rx828_pos, rx828_tgt) = self."!cursor_start"()
    rx828_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx828_cur
    .local pmc match
    .lex "$/", match
    length rx828_eos, rx828_tgt
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
.annotate 'line', 399
  # rx subcapture "sign"
    set_addr $I10, rxcap_834_fail
    rx828_cur."!mark_push"(0, rx828_pos, $I10)
  # rx rxquantr832 ** 0..1
    set_addr $I833, rxquantr832_done
    rx828_cur."!mark_push"(0, rx828_pos, $I833)
  rxquantr832_loop:
  # rx enumcharlist negate=0 
    ge rx828_pos, rx828_eos, rx828_fail
    sub $I10, rx828_pos, rx828_off
    substr $S10, rx828_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx828_fail
    inc rx828_pos
    (rx828_rep) = rx828_cur."!mark_commit"($I833)
  rxquantr832_done:
    set_addr $I10, rxcap_834_fail
    ($I12, $I11) = rx828_cur."!mark_peek"($I10)
    rx828_cur."!cursor_pos"($I11)
    ($P10) = rx828_cur."!cursor_start"()
    $P10."!cursor_pass"(rx828_pos, "")
    rx828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_834_done
  rxcap_834_fail:
    goto rx828_fail
  rxcap_834_done:
  alt835_0:
.annotate 'line', 400
    set_addr $I10, alt835_1
    rx828_cur."!mark_push"(0, rx828_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx828_cur."!cursor_pos"(rx828_pos)
    $P10 = rx828_cur."dec_number"()
    unless $P10, rx828_fail
    rx828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx828_pos = $P10."pos"()
    goto alt835_end
  alt835_1:
  # rx subrule "integer" subtype=capture negate=
    rx828_cur."!cursor_pos"(rx828_pos)
    $P10 = rx828_cur."integer"()
    unless $P10, rx828_fail
    rx828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx828_pos = $P10."pos"()
  alt835_end:
.annotate 'line', 398
  # rx pass
    rx828_cur."!cursor_pass"(rx828_pos, "number")
    rx828_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx828_pos)
    .return (rx828_cur)
  rx828_fail:
.annotate 'line', 4
    (rx828_rep, rx828_pos, $I10, $P10) = rx828_cur."!mark_fail"(0)
    lt rx828_pos, -1, rx828_done
    eq rx828_pos, -1, rx828_fail
    jump $I10
  rx828_done:
    rx828_cur."!cursor_fail"()
    rx828_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx828_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("192_1275160381.56318") :method
.annotate 'line', 4
    new $P830, "ResizablePMCArray"
    push $P830, ""
    .return ($P830)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("193_1275160381.56318") :method
.annotate 'line', 403
    $P837 = self."!protoregex"("quote")
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("194_1275160381.56318") :method
.annotate 'line', 403
    $P839 = self."!PREFIX__!protoregex"("quote")
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("195_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx841_tgt
    .local int rx841_pos
    .local int rx841_off
    .local int rx841_eos
    .local int rx841_rep
    .local pmc rx841_cur
    (rx841_cur, rx841_pos, rx841_tgt) = self."!cursor_start"()
    rx841_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
.annotate 'line', 404
  # rx enumcharlist negate=0 zerowidth
    ge rx841_pos, rx841_eos, rx841_fail
    sub $I10, rx841_pos, rx841_off
    substr $S10, rx841_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx841_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx841_cur."!cursor_pos"(rx841_pos)
    $P10 = rx841_cur."quote_EXPR"(":q")
    unless $P10, rx841_fail
    rx841_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx841_pos = $P10."pos"()
  # rx pass
    rx841_cur."!cursor_pass"(rx841_pos, "quote:sym<apos>")
    rx841_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx841_pos)
    .return (rx841_cur)
  rx841_fail:
.annotate 'line', 4
    (rx841_rep, rx841_pos, $I10, $P10) = rx841_cur."!mark_fail"(0)
    lt rx841_pos, -1, rx841_done
    eq rx841_pos, -1, rx841_fail
    jump $I10
  rx841_done:
    rx841_cur."!cursor_fail"()
    rx841_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx841_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("196_1275160381.56318") :method
.annotate 'line', 4
    new $P843, "ResizablePMCArray"
    push $P843, "'"
    .return ($P843)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("197_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx846_tgt
    .local int rx846_pos
    .local int rx846_off
    .local int rx846_eos
    .local int rx846_rep
    .local pmc rx846_cur
    (rx846_cur, rx846_pos, rx846_tgt) = self."!cursor_start"()
    rx846_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
    ne $I10, -1, rxscan849_done
    goto rxscan849_scan
  rxscan849_loop:
    ($P10) = rx846_cur."from"()
    inc $P10
    set rx846_pos, $P10
    ge rx846_pos, rx846_eos, rxscan849_done
  rxscan849_scan:
    set_addr $I10, rxscan849_loop
    rx846_cur."!mark_push"(0, rx846_pos, $I10)
  rxscan849_done:
.annotate 'line', 405
  # rx enumcharlist negate=0 zerowidth
    ge rx846_pos, rx846_eos, rx846_fail
    sub $I10, rx846_pos, rx846_off
    substr $S10, rx846_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx846_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx846_cur."!cursor_pos"(rx846_pos)
    $P10 = rx846_cur."quote_EXPR"(":qq")
    unless $P10, rx846_fail
    rx846_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx846_pos = $P10."pos"()
  # rx pass
    rx846_cur."!cursor_pass"(rx846_pos, "quote:sym<dblq>")
    rx846_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx846_pos)
    .return (rx846_cur)
  rx846_fail:
.annotate 'line', 4
    (rx846_rep, rx846_pos, $I10, $P10) = rx846_cur."!mark_fail"(0)
    lt rx846_pos, -1, rx846_done
    eq rx846_pos, -1, rx846_fail
    jump $I10
  rx846_done:
    rx846_cur."!cursor_fail"()
    rx846_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx846_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("198_1275160381.56318") :method
.annotate 'line', 4
    new $P848, "ResizablePMCArray"
    push $P848, "\""
    .return ($P848)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("199_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt) = self."!cursor_start"()
    rx851_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx851_cur
    .local pmc match
    .lex "$/", match
    length rx851_eos, rx851_tgt
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
.annotate 'line', 406
  # rx literal  "q"
    add $I11, rx851_pos, 1
    gt $I11, rx851_eos, rx851_fail
    sub $I11, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I11, 1
    ne $S10, "q", rx851_fail
    add rx851_pos, 1
  # rxanchor rwb
    le rx851_pos, 0, rx851_fail
    sub $I10, rx851_pos, rx851_off
    is_cclass $I11, 8192, rx851_tgt, $I10
    if $I11, rx851_fail
    dec $I10
    is_cclass $I11, 8192, rx851_tgt, $I10
    unless $I11, rx851_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx851_pos, rx851_eos, rx851_fail
    sub $I10, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx851_fail
  # rx subrule "ws" subtype=method negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."ws"()
    unless $P10, rx851_fail
    rx851_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."quote_EXPR"(":q")
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx851_pos = $P10."pos"()
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "quote:sym<q>")
    rx851_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_fail:
.annotate 'line', 4
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("200_1275160381.56318") :method
.annotate 'line', 4
    $P853 = self."!PREFIX__!subrule"("", "q")
    new $P854, "ResizablePMCArray"
    push $P854, $P853
    .return ($P854)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("201_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx857_cur
    .local pmc match
    .lex "$/", match
    length rx857_eos, rx857_tgt
    set rx857_off, 0
    lt rx857_pos, 2, rx857_start
    sub rx857_off, rx857_pos, 1
    substr rx857_tgt, rx857_tgt, rx857_off
  rx857_start:
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
.annotate 'line', 407
  # rx literal  "qq"
    add $I11, rx857_pos, 2
    gt $I11, rx857_eos, rx857_fail
    sub $I11, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I11, 2
    ne $S10, "qq", rx857_fail
    add rx857_pos, 2
  # rxanchor rwb
    le rx857_pos, 0, rx857_fail
    sub $I10, rx857_pos, rx857_off
    is_cclass $I11, 8192, rx857_tgt, $I10
    if $I11, rx857_fail
    dec $I10
    is_cclass $I11, 8192, rx857_tgt, $I10
    unless $I11, rx857_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx857_pos, rx857_eos, rx857_fail
    sub $I10, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx857_fail
  # rx subrule "ws" subtype=method negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."ws"()
    unless $P10, rx857_fail
    rx857_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."quote_EXPR"(":qq")
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx857_pos = $P10."pos"()
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "quote:sym<qq>")
    rx857_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate 'line', 4
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("202_1275160381.56318") :method
.annotate 'line', 4
    $P859 = self."!PREFIX__!subrule"("", "qq")
    new $P860, "ResizablePMCArray"
    push $P860, $P859
    .return ($P860)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("203_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx863_tgt
    .local int rx863_pos
    .local int rx863_off
    .local int rx863_eos
    .local int rx863_rep
    .local pmc rx863_cur
    (rx863_cur, rx863_pos, rx863_tgt) = self."!cursor_start"()
    rx863_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx863_cur
    .local pmc match
    .lex "$/", match
    length rx863_eos, rx863_tgt
    set rx863_off, 0
    lt rx863_pos, 2, rx863_start
    sub rx863_off, rx863_pos, 1
    substr rx863_tgt, rx863_tgt, rx863_off
  rx863_start:
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
.annotate 'line', 408
  # rx literal  "Q"
    add $I11, rx863_pos, 1
    gt $I11, rx863_eos, rx863_fail
    sub $I11, rx863_pos, rx863_off
    substr $S10, rx863_tgt, $I11, 1
    ne $S10, "Q", rx863_fail
    add rx863_pos, 1
  # rxanchor rwb
    le rx863_pos, 0, rx863_fail
    sub $I10, rx863_pos, rx863_off
    is_cclass $I11, 8192, rx863_tgt, $I10
    if $I11, rx863_fail
    dec $I10
    is_cclass $I11, 8192, rx863_tgt, $I10
    unless $I11, rx863_fail
  # rx enumcharlist negate=1 zerowidth
    ge rx863_pos, rx863_eos, rx863_fail
    sub $I10, rx863_pos, rx863_off
    substr $S10, rx863_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx863_fail
  # rx subrule "ws" subtype=method negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."ws"()
    unless $P10, rx863_fail
    rx863_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."quote_EXPR"()
    unless $P10, rx863_fail
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx863_pos = $P10."pos"()
  # rx pass
    rx863_cur."!cursor_pass"(rx863_pos, "quote:sym<Q>")
    rx863_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx863_pos)
    .return (rx863_cur)
  rx863_fail:
.annotate 'line', 4
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    rx863_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("204_1275160381.56318") :method
.annotate 'line', 4
    $P865 = self."!PREFIX__!subrule"("", "Q")
    new $P866, "ResizablePMCArray"
    push $P866, $P865
    .return ($P866)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("205_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx869_tgt
    .local int rx869_pos
    .local int rx869_off
    .local int rx869_eos
    .local int rx869_rep
    .local pmc rx869_cur
    (rx869_cur, rx869_pos, rx869_tgt) = self."!cursor_start"()
    rx869_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx869_cur
    .local pmc match
    .lex "$/", match
    length rx869_eos, rx869_tgt
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
.annotate 'line', 409
  # rx literal  "Q:PIR"
    add $I11, rx869_pos, 5
    gt $I11, rx869_eos, rx869_fail
    sub $I11, rx869_pos, rx869_off
    substr $S10, rx869_tgt, $I11, 5
    ne $S10, "Q:PIR", rx869_fail
    add rx869_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."ws"()
    unless $P10, rx869_fail
    rx869_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."quote_EXPR"()
    unless $P10, rx869_fail
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx869_pos = $P10."pos"()
  # rx pass
    rx869_cur."!cursor_pass"(rx869_pos, "quote:sym<Q:PIR>")
    rx869_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx869_pos)
    .return (rx869_cur)
  rx869_fail:
.annotate 'line', 4
    (rx869_rep, rx869_pos, $I10, $P10) = rx869_cur."!mark_fail"(0)
    lt rx869_pos, -1, rx869_done
    eq rx869_pos, -1, rx869_fail
    jump $I10
  rx869_done:
    rx869_cur."!cursor_fail"()
    rx869_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx869_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("206_1275160381.56318") :method
.annotate 'line', 4
    $P871 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P872, "ResizablePMCArray"
    push $P872, $P871
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("207_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx875_cur
    .local pmc match
    .lex "$/", match
    length rx875_eos, rx875_tgt
    set rx875_off, 0
    lt rx875_pos, 2, rx875_start
    sub rx875_off, rx875_pos, 1
    substr rx875_tgt, rx875_tgt, rx875_off
  rx875_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan879_done
    goto rxscan879_scan
  rxscan879_loop:
    ($P10) = rx875_cur."from"()
    inc $P10
    set rx875_pos, $P10
    ge rx875_pos, rx875_eos, rxscan879_done
  rxscan879_scan:
    set_addr $I10, rxscan879_loop
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  rxscan879_done:
.annotate 'line', 411
  # rx literal  "/"
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, "/", rx875_fail
    add rx875_pos, 1
.annotate 'line', 412
  # rx subrule "newpad" subtype=method negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."newpad"()
    unless $P10, rx875_fail
    rx875_pos = $P10."pos"()
.annotate 'line', 413
  # rx reduce name="quote:sym</ />" key="open"
    rx875_cur."!cursor_pos"(rx875_pos)
    rx875_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 414
  # rx subrule "LANG" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."LANG"("Regex", "nibbler")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx875_pos = $P10."pos"()
.annotate 'line', 415
  # rx literal  "/"
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, "/", rx875_fail
    add rx875_pos, 1
.annotate 'line', 410
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "quote:sym</ />")
    rx875_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate 'line', 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("208_1275160381.56318") :method
.annotate 'line', 4
    $P877 = self."!PREFIX__!subrule"("", "/")
    new $P878, "ResizablePMCArray"
    push $P878, $P877
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("209_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx881_tgt
    .local int rx881_pos
    .local int rx881_off
    .local int rx881_eos
    .local int rx881_rep
    .local pmc rx881_cur
    (rx881_cur, rx881_pos, rx881_tgt) = self."!cursor_start"()
    rx881_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
.annotate 'line', 418
  # rx enumcharlist negate=0 zerowidth
    ge rx881_pos, rx881_eos, rx881_fail
    sub $I10, rx881_pos, rx881_off
    substr $S10, rx881_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx881_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."quotemod_check"("s")
    unless $P10, rx881_fail
  # rx subrule "variable" subtype=capture negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."variable"()
    unless $P10, rx881_fail
    rx881_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx881_pos = $P10."pos"()
  # rx pass
    rx881_cur."!cursor_pass"(rx881_pos, "quote_escape:sym<$>")
    rx881_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx881_pos)
    .return (rx881_cur)
  rx881_fail:
.annotate 'line', 4
    (rx881_rep, rx881_pos, $I10, $P10) = rx881_cur."!mark_fail"(0)
    lt rx881_pos, -1, rx881_done
    eq rx881_pos, -1, rx881_fail
    jump $I10
  rx881_done:
    rx881_cur."!cursor_fail"()
    rx881_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx881_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("210_1275160381.56318") :method
.annotate 'line', 4
    new $P883, "ResizablePMCArray"
    push $P883, "$"
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("211_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx886_tgt
    .local int rx886_pos
    .local int rx886_off
    .local int rx886_eos
    .local int rx886_rep
    .local pmc rx886_cur
    (rx886_cur, rx886_pos, rx886_tgt) = self."!cursor_start"()
    rx886_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
.annotate 'line', 419
  # rx enumcharlist negate=0 zerowidth
    ge rx886_pos, rx886_eos, rx886_fail
    sub $I10, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx886_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."quotemod_check"("c")
    unless $P10, rx886_fail
  # rx subrule "block" subtype=capture negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."block"()
    unless $P10, rx886_fail
    rx886_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx886_pos = $P10."pos"()
  # rx pass
    rx886_cur."!cursor_pass"(rx886_pos, "quote_escape:sym<{ }>")
    rx886_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx886_pos)
    .return (rx886_cur)
  rx886_fail:
.annotate 'line', 4
    (rx886_rep, rx886_pos, $I10, $P10) = rx886_cur."!mark_fail"(0)
    lt rx886_pos, -1, rx886_done
    eq rx886_pos, -1, rx886_fail
    jump $I10
  rx886_done:
    rx886_cur."!cursor_fail"()
    rx886_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx886_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("212_1275160381.56318") :method
.annotate 'line', 4
    new $P888, "ResizablePMCArray"
    push $P888, "{"
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("213_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "quote_escape:sym<esc>")
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
.annotate 'line', 420
  # rx literal  "\\e"
    add $I11, rx891_pos, 2
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 2
    ne $S10, "\\e", rx891_fail
    add rx891_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."quotemod_check"("b")
    unless $P10, rx891_fail
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "quote_escape:sym<esc>")
    rx891_cur."!cursor_debug"("PASS  ", "quote_escape:sym<esc>", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate 'line', 4
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<esc>")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("214_1275160381.56318") :method
.annotate 'line', 4
    new $P893, "ResizablePMCArray"
    push $P893, "\\e"
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("215_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx896_cur."!cursor_caparray"("EXPR")
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
.annotate 'line', 422
  # rx literal  "("
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, "(", rx896_fail
    add rx896_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."ws"()
    unless $P10, rx896_fail
    rx896_pos = $P10."pos"()
  # rx rxquantr901 ** 0..1
    set_addr $I902, rxquantr901_done
    rx896_cur."!mark_push"(0, rx896_pos, $I902)
  rxquantr901_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."EXPR"()
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx896_pos = $P10."pos"()
    (rx896_rep) = rx896_cur."!mark_commit"($I902)
  rxquantr901_done:
  # rx literal  ")"
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, ")", rx896_fail
    add rx896_pos, 1
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "circumfix:sym<( )>")
    rx896_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate 'line', 4
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("216_1275160381.56318") :method
.annotate 'line', 4
    $P898 = self."!PREFIX__!subrule"("", "(")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("217_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx904_tgt
    .local int rx904_pos
    .local int rx904_off
    .local int rx904_eos
    .local int rx904_rep
    .local pmc rx904_cur
    (rx904_cur, rx904_pos, rx904_tgt) = self."!cursor_start"()
    rx904_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx904_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx904_cur
    .local pmc match
    .lex "$/", match
    length rx904_eos, rx904_tgt
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
  # rx literal  "["
    add $I11, rx904_pos, 1
    gt $I11, rx904_eos, rx904_fail
    sub $I11, rx904_pos, rx904_off
    substr $S10, rx904_tgt, $I11, 1
    ne $S10, "[", rx904_fail
    add rx904_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx904_cur."!cursor_pos"(rx904_pos)
    $P10 = rx904_cur."ws"()
    unless $P10, rx904_fail
    rx904_pos = $P10."pos"()
  # rx rxquantr909 ** 0..1
    set_addr $I910, rxquantr909_done
    rx904_cur."!mark_push"(0, rx904_pos, $I910)
  rxquantr909_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx904_cur."!cursor_pos"(rx904_pos)
    $P10 = rx904_cur."EXPR"()
    unless $P10, rx904_fail
    rx904_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx904_pos = $P10."pos"()
    (rx904_rep) = rx904_cur."!mark_commit"($I910)
  rxquantr909_done:
  # rx literal  "]"
    add $I11, rx904_pos, 1
    gt $I11, rx904_eos, rx904_fail
    sub $I11, rx904_pos, rx904_off
    substr $S10, rx904_tgt, $I11, 1
    ne $S10, "]", rx904_fail
    add rx904_pos, 1
  # rx pass
    rx904_cur."!cursor_pass"(rx904_pos, "circumfix:sym<[ ]>")
    rx904_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx904_pos)
    .return (rx904_cur)
  rx904_fail:
.annotate 'line', 4
    (rx904_rep, rx904_pos, $I10, $P10) = rx904_cur."!mark_fail"(0)
    lt rx904_pos, -1, rx904_done
    eq rx904_pos, -1, rx904_fail
    jump $I10
  rx904_done:
    rx904_cur."!cursor_fail"()
    rx904_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx904_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("218_1275160381.56318") :method
.annotate 'line', 4
    $P906 = self."!PREFIX__!subrule"("", "[")
    new $P907, "ResizablePMCArray"
    push $P907, $P906
    .return ($P907)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("219_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx912_tgt
    .local int rx912_pos
    .local int rx912_off
    .local int rx912_eos
    .local int rx912_rep
    .local pmc rx912_cur
    (rx912_cur, rx912_pos, rx912_tgt) = self."!cursor_start"()
    rx912_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
.annotate 'line', 424
  # rx enumcharlist negate=0 zerowidth
    ge rx912_pos, rx912_eos, rx912_fail
    sub $I10, rx912_pos, rx912_off
    substr $S10, rx912_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx912_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx912_cur."!cursor_pos"(rx912_pos)
    $P10 = rx912_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx912_fail
    rx912_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx912_pos = $P10."pos"()
  # rx pass
    rx912_cur."!cursor_pass"(rx912_pos, "circumfix:sym<ang>")
    rx912_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx912_pos)
    .return (rx912_cur)
  rx912_fail:
.annotate 'line', 4
    (rx912_rep, rx912_pos, $I10, $P10) = rx912_cur."!mark_fail"(0)
    lt rx912_pos, -1, rx912_done
    eq rx912_pos, -1, rx912_fail
    jump $I10
  rx912_done:
    rx912_cur."!cursor_fail"()
    rx912_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx912_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("220_1275160381.56318") :method
.annotate 'line', 4
    new $P914, "ResizablePMCArray"
    push $P914, "<"
    .return ($P914)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("221_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx917_tgt
    .local int rx917_pos
    .local int rx917_off
    .local int rx917_eos
    .local int rx917_rep
    .local pmc rx917_cur
    (rx917_cur, rx917_pos, rx917_tgt) = self."!cursor_start"()
    rx917_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
.annotate 'line', 425
  # rx enumcharlist negate=0 zerowidth
    ge rx917_pos, rx917_eos, rx917_fail
    sub $I10, rx917_pos, rx917_off
    substr $S10, rx917_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx917_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx917_cur."!cursor_pos"(rx917_pos)
    $P10 = rx917_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx917_fail
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx917_pos = $P10."pos"()
  # rx pass
    rx917_cur."!cursor_pass"(rx917_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx917_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx917_pos)
    .return (rx917_cur)
  rx917_fail:
.annotate 'line', 4
    (rx917_rep, rx917_pos, $I10, $P10) = rx917_cur."!mark_fail"(0)
    lt rx917_pos, -1, rx917_done
    eq rx917_pos, -1, rx917_fail
    jump $I10
  rx917_done:
    rx917_cur."!cursor_fail"()
    rx917_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx917_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("222_1275160381.56318") :method
.annotate 'line', 4
    new $P919, "ResizablePMCArray"
    push $P919, unicode:"\x{ab}"
    .return ($P919)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("223_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx922_tgt
    .local int rx922_pos
    .local int rx922_off
    .local int rx922_eos
    .local int rx922_rep
    .local pmc rx922_cur
    (rx922_cur, rx922_pos, rx922_tgt) = self."!cursor_start"()
    rx922_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
    ne $I10, -1, rxscan925_done
    goto rxscan925_scan
  rxscan925_loop:
    ($P10) = rx922_cur."from"()
    inc $P10
    set rx922_pos, $P10
    ge rx922_pos, rx922_eos, rxscan925_done
  rxscan925_scan:
    set_addr $I10, rxscan925_loop
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  rxscan925_done:
.annotate 'line', 426
  # rx enumcharlist negate=0 zerowidth
    ge rx922_pos, rx922_eos, rx922_fail
    sub $I10, rx922_pos, rx922_off
    substr $S10, rx922_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx922_fail
  # rx subrule "pblock" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."pblock"()
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx922_pos = $P10."pos"()
  # rx pass
    rx922_cur."!cursor_pass"(rx922_pos, "circumfix:sym<{ }>")
    rx922_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx922_pos)
    .return (rx922_cur)
  rx922_fail:
.annotate 'line', 4
    (rx922_rep, rx922_pos, $I10, $P10) = rx922_cur."!mark_fail"(0)
    lt rx922_pos, -1, rx922_done
    eq rx922_pos, -1, rx922_fail
    jump $I10
  rx922_done:
    rx922_cur."!cursor_fail"()
    rx922_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx922_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("224_1275160381.56318") :method
.annotate 'line', 4
    new $P924, "ResizablePMCArray"
    push $P924, "{"
    .return ($P924)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("225_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx927_cur
    .local pmc match
    .lex "$/", match
    length rx927_eos, rx927_tgt
    set rx927_off, 0
    lt rx927_pos, 2, rx927_start
    sub rx927_off, rx927_pos, 1
    substr rx927_tgt, rx927_tgt, rx927_off
  rx927_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan931_done
    goto rxscan931_scan
  rxscan931_loop:
    ($P10) = rx927_cur."from"()
    inc $P10
    set rx927_pos, $P10
    ge rx927_pos, rx927_eos, rxscan931_done
  rxscan931_scan:
    set_addr $I10, rxscan931_loop
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  rxscan931_done:
.annotate 'line', 427
  # rx subrule "sigil" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."sigil"()
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx927_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx927_pos, 1
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 1
    ne $S10, "(", rx927_fail
    add rx927_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."semilist"()
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx927_pos = $P10."pos"()
  alt932_0:
    set_addr $I10, alt932_1
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  # rx literal  ")"
    add $I11, rx927_pos, 1
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 1
    ne $S10, ")", rx927_fail
    add rx927_pos, 1
    goto alt932_end
  alt932_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."FAILGOAL"("')'")
    unless $P10, rx927_fail
    rx927_pos = $P10."pos"()
  alt932_end:
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "circumfix:sym<sigil>")
    rx927_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate 'line', 4
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("226_1275160381.56318") :method
.annotate 'line', 4
    $P929 = self."!PREFIX__!subrule"("sigil", "")
    new $P930, "ResizablePMCArray"
    push $P930, $P929
    .return ($P930)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("227_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 4
    .local string rx935_tgt
    .local int rx935_pos
    .local int rx935_off
    .local int rx935_eos
    .local int rx935_rep
    .local pmc rx935_cur
    (rx935_cur, rx935_pos, rx935_tgt) = self."!cursor_start"()
    rx935_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx935_cur
    .local pmc match
    .lex "$/", match
    length rx935_eos, rx935_tgt
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
.annotate 'line', 429
  # rx subrule "ws" subtype=method negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."ws"()
    unless $P10, rx935_fail
    rx935_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."statement"()
    unless $P10, rx935_fail
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx935_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."ws"()
    unless $P10, rx935_fail
    rx935_pos = $P10."pos"()
  # rx pass
    rx935_cur."!cursor_pass"(rx935_pos, "semilist")
    rx935_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx935_pos)
    .return (rx935_cur)
  rx935_fail:
.annotate 'line', 4
    (rx935_rep, rx935_pos, $I10, $P10) = rx935_cur."!mark_fail"(0)
    lt rx935_pos, -1, rx935_done
    eq rx935_pos, -1, rx935_fail
    jump $I10
  rx935_done:
    rx935_cur."!cursor_fail"()
    rx935_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx935_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("228_1275160381.56318") :method
.annotate 'line', 4
    new $P937, "ResizablePMCArray"
    push $P937, ""
    .return ($P937)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("229_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx942_tgt
    .local int rx942_pos
    .local int rx942_off
    .local int rx942_eos
    .local int rx942_rep
    .local pmc rx942_cur
    (rx942_cur, rx942_pos, rx942_tgt) = self."!cursor_start"()
    rx942_cur."!cursor_debug"("START ", "infixish")
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
.annotate 'line', 452
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."infixstopper"()
    if $P10, rx942_fail
  # rx subrule "infix" subtype=capture negate=
    rx942_cur."!cursor_pos"(rx942_pos)
    $P10 = rx942_cur."infix"()
    unless $P10, rx942_fail
    rx942_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx942_pos = $P10."pos"()
  # rx pass
    rx942_cur."!cursor_pass"(rx942_pos, "infixish")
    rx942_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx942_pos)
    .return (rx942_cur)
  rx942_fail:
.annotate 'line', 433
    (rx942_rep, rx942_pos, $I10, $P10) = rx942_cur."!mark_fail"(0)
    lt rx942_pos, -1, rx942_done
    eq rx942_pos, -1, rx942_fail
    jump $I10
  rx942_done:
    rx942_cur."!cursor_fail"()
    rx942_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx942_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("230_1275160381.56318") :method
.annotate 'line', 433
    new $P944, "ResizablePMCArray"
    push $P944, ""
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("231_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "infixstopper")
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
    ne $I10, -1, rxscan950_done
    goto rxscan950_scan
  rxscan950_loop:
    ($P10) = rx947_cur."from"()
    inc $P10
    set rx947_pos, $P10
    ge rx947_pos, rx947_eos, rxscan950_done
  rxscan950_scan:
    set_addr $I10, rxscan950_loop
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  rxscan950_done:
.annotate 'line', 453
  # rx subrule "lambda" subtype=zerowidth negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."lambda"()
    unless $P10, rx947_fail
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "infixstopper")
    rx947_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate 'line', 433
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("232_1275160381.56318") :method
.annotate 'line', 433
    new $P949, "ResizablePMCArray"
    push $P949, ""
    .return ($P949)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("233_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx952_tgt
    .local int rx952_pos
    .local int rx952_off
    .local int rx952_eos
    .local int rx952_rep
    .local pmc rx952_cur
    (rx952_cur, rx952_pos, rx952_tgt) = self."!cursor_start"()
    rx952_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx952_cur
    .local pmc match
    .lex "$/", match
    length rx952_eos, rx952_tgt
    set rx952_off, 0
    lt rx952_pos, 2, rx952_start
    sub rx952_off, rx952_pos, 1
    substr rx952_tgt, rx952_tgt, rx952_off
  rx952_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan956_done
    goto rxscan956_scan
  rxscan956_loop:
    ($P10) = rx952_cur."from"()
    inc $P10
    set rx952_pos, $P10
    ge rx952_pos, rx952_eos, rxscan956_done
  rxscan956_scan:
    set_addr $I10, rxscan956_loop
    rx952_cur."!mark_push"(0, rx952_pos, $I10)
  rxscan956_done:
.annotate 'line', 456
  # rx literal  "["
    add $I11, rx952_pos, 1
    gt $I11, rx952_eos, rx952_fail
    sub $I11, rx952_pos, rx952_off
    substr $S10, rx952_tgt, $I11, 1
    ne $S10, "[", rx952_fail
    add rx952_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx952_cur."!cursor_pos"(rx952_pos)
    $P10 = rx952_cur."ws"()
    unless $P10, rx952_fail
    rx952_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx952_cur."!cursor_pos"(rx952_pos)
    $P10 = rx952_cur."EXPR"()
    unless $P10, rx952_fail
    rx952_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx952_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx952_pos, 1
    gt $I11, rx952_eos, rx952_fail
    sub $I11, rx952_pos, rx952_off
    substr $S10, rx952_tgt, $I11, 1
    ne $S10, "]", rx952_fail
    add rx952_pos, 1
.annotate 'line', 457
  # rx subrule "O" subtype=capture negate=
    rx952_cur."!cursor_pos"(rx952_pos)
    $P10 = rx952_cur."O"("%methodop")
    unless $P10, rx952_fail
    rx952_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx952_pos = $P10."pos"()
.annotate 'line', 455
  # rx pass
    rx952_cur."!cursor_pass"(rx952_pos, "postcircumfix:sym<[ ]>")
    rx952_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx952_pos)
    .return (rx952_cur)
  rx952_fail:
.annotate 'line', 433
    (rx952_rep, rx952_pos, $I10, $P10) = rx952_cur."!mark_fail"(0)
    lt rx952_pos, -1, rx952_done
    eq rx952_pos, -1, rx952_fail
    jump $I10
  rx952_done:
    rx952_cur."!cursor_fail"()
    rx952_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx952_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("234_1275160381.56318") :method
.annotate 'line', 433
    $P954 = self."!PREFIX__!subrule"("", "[")
    new $P955, "ResizablePMCArray"
    push $P955, $P954
    .return ($P955)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("235_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    (rx958_cur, rx958_pos, rx958_tgt) = self."!cursor_start"()
    rx958_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx958_cur
    .local pmc match
    .lex "$/", match
    length rx958_eos, rx958_tgt
    set rx958_off, 0
    lt rx958_pos, 2, rx958_start
    sub rx958_off, rx958_pos, 1
    substr rx958_tgt, rx958_tgt, rx958_off
  rx958_start:
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
.annotate 'line', 461
  # rx literal  "{"
    add $I11, rx958_pos, 1
    gt $I11, rx958_eos, rx958_fail
    sub $I11, rx958_pos, rx958_off
    substr $S10, rx958_tgt, $I11, 1
    ne $S10, "{", rx958_fail
    add rx958_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."ws"()
    unless $P10, rx958_fail
    rx958_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."EXPR"()
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx958_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx958_pos, 1
    gt $I11, rx958_eos, rx958_fail
    sub $I11, rx958_pos, rx958_off
    substr $S10, rx958_tgt, $I11, 1
    ne $S10, "}", rx958_fail
    add rx958_pos, 1
.annotate 'line', 462
  # rx subrule "O" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."O"("%methodop")
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx958_pos = $P10."pos"()
.annotate 'line', 460
  # rx pass
    rx958_cur."!cursor_pass"(rx958_pos, "postcircumfix:sym<{ }>")
    rx958_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx958_pos)
    .return (rx958_cur)
  rx958_fail:
.annotate 'line', 433
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    rx958_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("236_1275160381.56318") :method
.annotate 'line', 433
    $P960 = self."!PREFIX__!subrule"("", "{")
    new $P961, "ResizablePMCArray"
    push $P961, $P960
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("237_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx964_tgt
    .local int rx964_pos
    .local int rx964_off
    .local int rx964_eos
    .local int rx964_rep
    .local pmc rx964_cur
    (rx964_cur, rx964_pos, rx964_tgt) = self."!cursor_start"()
    rx964_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
.annotate 'line', 466
  # rx enumcharlist negate=0 zerowidth
    ge rx964_pos, rx964_eos, rx964_fail
    sub $I10, rx964_pos, rx964_off
    substr $S10, rx964_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx964_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."quote_EXPR"(":q")
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx964_pos = $P10."pos"()
.annotate 'line', 467
  # rx subrule "O" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."O"("%methodop")
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx964_pos = $P10."pos"()
.annotate 'line', 465
  # rx pass
    rx964_cur."!cursor_pass"(rx964_pos, "postcircumfix:sym<ang>")
    rx964_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx964_pos)
    .return (rx964_cur)
  rx964_fail:
.annotate 'line', 433
    (rx964_rep, rx964_pos, $I10, $P10) = rx964_cur."!mark_fail"(0)
    lt rx964_pos, -1, rx964_done
    eq rx964_pos, -1, rx964_fail
    jump $I10
  rx964_done:
    rx964_cur."!cursor_fail"()
    rx964_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx964_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("238_1275160381.56318") :method
.annotate 'line', 433
    new $P966, "ResizablePMCArray"
    push $P966, "<"
    .return ($P966)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("239_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx969_tgt
    .local int rx969_pos
    .local int rx969_off
    .local int rx969_eos
    .local int rx969_rep
    .local pmc rx969_cur
    (rx969_cur, rx969_pos, rx969_tgt) = self."!cursor_start"()
    rx969_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx969_cur
    .local pmc match
    .lex "$/", match
    length rx969_eos, rx969_tgt
    set rx969_off, 0
    lt rx969_pos, 2, rx969_start
    sub rx969_off, rx969_pos, 1
    substr rx969_tgt, rx969_tgt, rx969_off
  rx969_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan973_done
    goto rxscan973_scan
  rxscan973_loop:
    ($P10) = rx969_cur."from"()
    inc $P10
    set rx969_pos, $P10
    ge rx969_pos, rx969_eos, rxscan973_done
  rxscan973_scan:
    set_addr $I10, rxscan973_loop
    rx969_cur."!mark_push"(0, rx969_pos, $I10)
  rxscan973_done:
.annotate 'line', 471
  # rx literal  "("
    add $I11, rx969_pos, 1
    gt $I11, rx969_eos, rx969_fail
    sub $I11, rx969_pos, rx969_off
    substr $S10, rx969_tgt, $I11, 1
    ne $S10, "(", rx969_fail
    add rx969_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx969_cur."!cursor_pos"(rx969_pos)
    $P10 = rx969_cur."ws"()
    unless $P10, rx969_fail
    rx969_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx969_cur."!cursor_pos"(rx969_pos)
    $P10 = rx969_cur."arglist"()
    unless $P10, rx969_fail
    rx969_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx969_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx969_pos, 1
    gt $I11, rx969_eos, rx969_fail
    sub $I11, rx969_pos, rx969_off
    substr $S10, rx969_tgt, $I11, 1
    ne $S10, ")", rx969_fail
    add rx969_pos, 1
.annotate 'line', 472
  # rx subrule "O" subtype=capture negate=
    rx969_cur."!cursor_pos"(rx969_pos)
    $P10 = rx969_cur."O"("%methodop")
    unless $P10, rx969_fail
    rx969_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx969_pos = $P10."pos"()
.annotate 'line', 470
  # rx pass
    rx969_cur."!cursor_pass"(rx969_pos, "postcircumfix:sym<( )>")
    rx969_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx969_pos)
    .return (rx969_cur)
  rx969_fail:
.annotate 'line', 433
    (rx969_rep, rx969_pos, $I10, $P10) = rx969_cur."!mark_fail"(0)
    lt rx969_pos, -1, rx969_done
    eq rx969_pos, -1, rx969_fail
    jump $I10
  rx969_done:
    rx969_cur."!cursor_fail"()
    rx969_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx969_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("240_1275160381.56318") :method
.annotate 'line', 433
    $P971 = self."!PREFIX__!subrule"("", "(")
    new $P972, "ResizablePMCArray"
    push $P972, $P971
    .return ($P972)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("241_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx975_tgt
    .local int rx975_pos
    .local int rx975_off
    .local int rx975_eos
    .local int rx975_rep
    .local pmc rx975_cur
    (rx975_cur, rx975_pos, rx975_tgt) = self."!cursor_start"()
    rx975_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx975_cur
    .local pmc match
    .lex "$/", match
    length rx975_eos, rx975_tgt
    set rx975_off, 0
    lt rx975_pos, 2, rx975_start
    sub rx975_off, rx975_pos, 1
    substr rx975_tgt, rx975_tgt, rx975_off
  rx975_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan979_done
    goto rxscan979_scan
  rxscan979_loop:
    ($P10) = rx975_cur."from"()
    inc $P10
    set rx975_pos, $P10
    ge rx975_pos, rx975_eos, rxscan979_done
  rxscan979_scan:
    set_addr $I10, rxscan979_loop
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  rxscan979_done:
.annotate 'line', 475
  # rx subrule "dotty" subtype=capture negate=
    rx975_cur."!cursor_pos"(rx975_pos)
    $P10 = rx975_cur."dotty"()
    unless $P10, rx975_fail
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx975_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx975_cur."!cursor_pos"(rx975_pos)
    $P10 = rx975_cur."O"("%methodop")
    unless $P10, rx975_fail
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx975_pos = $P10."pos"()
  # rx pass
    rx975_cur."!cursor_pass"(rx975_pos, "postfix:sym<.>")
    rx975_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx975_pos)
    .return (rx975_cur)
  rx975_fail:
.annotate 'line', 433
    (rx975_rep, rx975_pos, $I10, $P10) = rx975_cur."!mark_fail"(0)
    lt rx975_pos, -1, rx975_done
    eq rx975_pos, -1, rx975_fail
    jump $I10
  rx975_done:
    rx975_cur."!cursor_fail"()
    rx975_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx975_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("242_1275160381.56318") :method
.annotate 'line', 433
    $P977 = self."!PREFIX__!subrule"("dotty", "")
    new $P978, "ResizablePMCArray"
    push $P978, $P977
    .return ($P978)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("243_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx981_cur
    .local pmc match
    .lex "$/", match
    length rx981_eos, rx981_tgt
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
.annotate 'line', 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_986_fail
    rx981_cur."!mark_push"(0, rx981_pos, $I10)
  # rx literal  "++"
    add $I11, rx981_pos, 2
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 2
    ne $S10, "++", rx981_fail
    add rx981_pos, 2
    set_addr $I10, rxcap_986_fail
    ($I12, $I11) = rx981_cur."!mark_peek"($I10)
    rx981_cur."!cursor_pos"($I11)
    ($P10) = rx981_cur."!cursor_start"()
    $P10."!cursor_pass"(rx981_pos, "")
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_986_done
  rxcap_986_fail:
    goto rx981_fail
  rxcap_986_done:
  # rx subrule "O" subtype=capture negate=
    rx981_cur."!cursor_pos"(rx981_pos)
    $P10 = rx981_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx981_pos = $P10."pos"()
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "prefix:sym<++>")
    rx981_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate 'line', 433
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("244_1275160381.56318") :method
.annotate 'line', 433
    $P983 = self."!PREFIX__!subrule"("O", "++")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("245_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx988_cur
    .local pmc match
    .lex "$/", match
    length rx988_eos, rx988_tgt
    set rx988_off, 0
    lt rx988_pos, 2, rx988_start
    sub rx988_off, rx988_pos, 1
    substr rx988_tgt, rx988_tgt, rx988_off
  rx988_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan992_done
    goto rxscan992_scan
  rxscan992_loop:
    ($P10) = rx988_cur."from"()
    inc $P10
    set rx988_pos, $P10
    ge rx988_pos, rx988_eos, rxscan992_done
  rxscan992_scan:
    set_addr $I10, rxscan992_loop
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  rxscan992_done:
.annotate 'line', 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_993_fail
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  # rx literal  "--"
    add $I11, rx988_pos, 2
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 2
    ne $S10, "--", rx988_fail
    add rx988_pos, 2
    set_addr $I10, rxcap_993_fail
    ($I12, $I11) = rx988_cur."!mark_peek"($I10)
    rx988_cur."!cursor_pos"($I11)
    ($P10) = rx988_cur."!cursor_start"()
    $P10."!cursor_pass"(rx988_pos, "")
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_993_done
  rxcap_993_fail:
    goto rx988_fail
  rxcap_993_done:
  # rx subrule "O" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "prefix:sym<-->")
    rx988_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate 'line', 433
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("246_1275160381.56318") :method
.annotate 'line', 433
    $P990 = self."!PREFIX__!subrule"("O", "--")
    new $P991, "ResizablePMCArray"
    push $P991, $P990
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("247_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx995_tgt
    .local int rx995_pos
    .local int rx995_off
    .local int rx995_eos
    .local int rx995_rep
    .local pmc rx995_cur
    (rx995_cur, rx995_pos, rx995_tgt) = self."!cursor_start"()
    rx995_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx995_cur
    .local pmc match
    .lex "$/", match
    length rx995_eos, rx995_tgt
    set rx995_off, 0
    lt rx995_pos, 2, rx995_start
    sub rx995_off, rx995_pos, 1
    substr rx995_tgt, rx995_tgt, rx995_off
  rx995_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan999_done
    goto rxscan999_scan
  rxscan999_loop:
    ($P10) = rx995_cur."from"()
    inc $P10
    set rx995_pos, $P10
    ge rx995_pos, rx995_eos, rxscan999_done
  rxscan999_scan:
    set_addr $I10, rxscan999_loop
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  rxscan999_done:
.annotate 'line', 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1000_fail
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  # rx literal  "++"
    add $I11, rx995_pos, 2
    gt $I11, rx995_eos, rx995_fail
    sub $I11, rx995_pos, rx995_off
    substr $S10, rx995_tgt, $I11, 2
    ne $S10, "++", rx995_fail
    add rx995_pos, 2
    set_addr $I10, rxcap_1000_fail
    ($I12, $I11) = rx995_cur."!mark_peek"($I10)
    rx995_cur."!cursor_pos"($I11)
    ($P10) = rx995_cur."!cursor_start"()
    $P10."!cursor_pass"(rx995_pos, "")
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1000_done
  rxcap_1000_fail:
    goto rx995_fail
  rxcap_1000_done:
  # rx subrule "O" subtype=capture negate=
    rx995_cur."!cursor_pos"(rx995_pos)
    $P10 = rx995_cur."O"("%autoincrement")
    unless $P10, rx995_fail
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx995_pos = $P10."pos"()
  # rx pass
    rx995_cur."!cursor_pass"(rx995_pos, "postfix:sym<++>")
    rx995_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx995_pos)
    .return (rx995_cur)
  rx995_fail:
.annotate 'line', 433
    (rx995_rep, rx995_pos, $I10, $P10) = rx995_cur."!mark_fail"(0)
    lt rx995_pos, -1, rx995_done
    eq rx995_pos, -1, rx995_fail
    jump $I10
  rx995_done:
    rx995_cur."!cursor_fail"()
    rx995_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx995_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("248_1275160381.56318") :method
.annotate 'line', 433
    $P997 = self."!PREFIX__!subrule"("O", "++")
    new $P998, "ResizablePMCArray"
    push $P998, $P997
    .return ($P998)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("249_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1002_tgt
    .local int rx1002_pos
    .local int rx1002_off
    .local int rx1002_eos
    .local int rx1002_rep
    .local pmc rx1002_cur
    (rx1002_cur, rx1002_pos, rx1002_tgt) = self."!cursor_start"()
    rx1002_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx1002_cur
    .local pmc match
    .lex "$/", match
    length rx1002_eos, rx1002_tgt
    set rx1002_off, 0
    lt rx1002_pos, 2, rx1002_start
    sub rx1002_off, rx1002_pos, 1
    substr rx1002_tgt, rx1002_tgt, rx1002_off
  rx1002_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1006_done
    goto rxscan1006_scan
  rxscan1006_loop:
    ($P10) = rx1002_cur."from"()
    inc $P10
    set rx1002_pos, $P10
    ge rx1002_pos, rx1002_eos, rxscan1006_done
  rxscan1006_scan:
    set_addr $I10, rxscan1006_loop
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  rxscan1006_done:
.annotate 'line', 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1007_fail
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  # rx literal  "--"
    add $I11, rx1002_pos, 2
    gt $I11, rx1002_eos, rx1002_fail
    sub $I11, rx1002_pos, rx1002_off
    substr $S10, rx1002_tgt, $I11, 2
    ne $S10, "--", rx1002_fail
    add rx1002_pos, 2
    set_addr $I10, rxcap_1007_fail
    ($I12, $I11) = rx1002_cur."!mark_peek"($I10)
    rx1002_cur."!cursor_pos"($I11)
    ($P10) = rx1002_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1002_pos, "")
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1007_done
  rxcap_1007_fail:
    goto rx1002_fail
  rxcap_1007_done:
  # rx subrule "O" subtype=capture negate=
    rx1002_cur."!cursor_pos"(rx1002_pos)
    $P10 = rx1002_cur."O"("%autoincrement")
    unless $P10, rx1002_fail
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1002_pos = $P10."pos"()
  # rx pass
    rx1002_cur."!cursor_pass"(rx1002_pos, "postfix:sym<-->")
    rx1002_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx1002_pos)
    .return (rx1002_cur)
  rx1002_fail:
.annotate 'line', 433
    (rx1002_rep, rx1002_pos, $I10, $P10) = rx1002_cur."!mark_fail"(0)
    lt rx1002_pos, -1, rx1002_done
    eq rx1002_pos, -1, rx1002_fail
    jump $I10
  rx1002_done:
    rx1002_cur."!cursor_fail"()
    rx1002_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx1002_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("250_1275160381.56318") :method
.annotate 'line', 433
    $P1004 = self."!PREFIX__!subrule"("O", "--")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("251_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    (rx1009_cur, rx1009_pos, rx1009_tgt) = self."!cursor_start"()
    rx1009_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx1009_cur
    .local pmc match
    .lex "$/", match
    length rx1009_eos, rx1009_tgt
    set rx1009_off, 0
    lt rx1009_pos, 2, rx1009_start
    sub rx1009_off, rx1009_pos, 1
    substr rx1009_tgt, rx1009_tgt, rx1009_off
  rx1009_start:
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
.annotate 'line', 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1014_fail
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  # rx literal  "**"
    add $I11, rx1009_pos, 2
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I11, 2
    ne $S10, "**", rx1009_fail
    add rx1009_pos, 2
    set_addr $I10, rxcap_1014_fail
    ($I12, $I11) = rx1009_cur."!mark_peek"($I10)
    rx1009_cur."!cursor_pos"($I11)
    ($P10) = rx1009_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1009_pos, "")
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1014_done
  rxcap_1014_fail:
    goto rx1009_fail
  rxcap_1014_done:
  # rx subrule "O" subtype=capture negate=
    rx1009_cur."!cursor_pos"(rx1009_pos)
    $P10 = rx1009_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "infix:sym<**>")
    rx1009_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx1009_pos)
    .return (rx1009_cur)
  rx1009_fail:
.annotate 'line', 433
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    rx1009_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("252_1275160381.56318") :method
.annotate 'line', 433
    $P1011 = self."!PREFIX__!subrule"("O", "**")
    new $P1012, "ResizablePMCArray"
    push $P1012, $P1011
    .return ($P1012)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("253_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx1016_cur
    .local pmc match
    .lex "$/", match
    length rx1016_eos, rx1016_tgt
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
.annotate 'line', 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1021_fail
    rx1016_cur."!mark_push"(0, rx1016_pos, $I10)
  # rx literal  "+"
    add $I11, rx1016_pos, 1
    gt $I11, rx1016_eos, rx1016_fail
    sub $I11, rx1016_pos, rx1016_off
    substr $S10, rx1016_tgt, $I11, 1
    ne $S10, "+", rx1016_fail
    add rx1016_pos, 1
    set_addr $I10, rxcap_1021_fail
    ($I12, $I11) = rx1016_cur."!mark_peek"($I10)
    rx1016_cur."!cursor_pos"($I11)
    ($P10) = rx1016_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1016_pos, "")
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1021_done
  rxcap_1021_fail:
    goto rx1016_fail
  rxcap_1021_done:
  # rx subrule "O" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1016_pos = $P10."pos"()
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "prefix:sym<+>")
    rx1016_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate 'line', 433
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("254_1275160381.56318") :method
.annotate 'line', 433
    $P1018 = self."!PREFIX__!subrule"("O", "+")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("255_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    (rx1023_cur, rx1023_pos, rx1023_tgt) = self."!cursor_start"()
    rx1023_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx1023_cur
    .local pmc match
    .lex "$/", match
    length rx1023_eos, rx1023_tgt
    set rx1023_off, 0
    lt rx1023_pos, 2, rx1023_start
    sub rx1023_off, rx1023_pos, 1
    substr rx1023_tgt, rx1023_tgt, rx1023_off
  rx1023_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1027_done
    goto rxscan1027_scan
  rxscan1027_loop:
    ($P10) = rx1023_cur."from"()
    inc $P10
    set rx1023_pos, $P10
    ge rx1023_pos, rx1023_eos, rxscan1027_done
  rxscan1027_scan:
    set_addr $I10, rxscan1027_loop
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  rxscan1027_done:
.annotate 'line', 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1028_fail
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  # rx literal  "~"
    add $I11, rx1023_pos, 1
    gt $I11, rx1023_eos, rx1023_fail
    sub $I11, rx1023_pos, rx1023_off
    substr $S10, rx1023_tgt, $I11, 1
    ne $S10, "~", rx1023_fail
    add rx1023_pos, 1
    set_addr $I10, rxcap_1028_fail
    ($I12, $I11) = rx1023_cur."!mark_peek"($I10)
    rx1023_cur."!cursor_pos"($I11)
    ($P10) = rx1023_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1023_pos, "")
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1028_done
  rxcap_1028_fail:
    goto rx1023_fail
  rxcap_1028_done:
  # rx subrule "O" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1023_pos = $P10."pos"()
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "prefix:sym<~>")
    rx1023_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx1023_pos)
    .return (rx1023_cur)
  rx1023_fail:
.annotate 'line', 433
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    rx1023_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("256_1275160381.56318") :method
.annotate 'line', 433
    $P1025 = self."!PREFIX__!subrule"("O", "~")
    new $P1026, "ResizablePMCArray"
    push $P1026, $P1025
    .return ($P1026)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("257_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1030_tgt
    .local int rx1030_pos
    .local int rx1030_off
    .local int rx1030_eos
    .local int rx1030_rep
    .local pmc rx1030_cur
    (rx1030_cur, rx1030_pos, rx1030_tgt) = self."!cursor_start"()
    rx1030_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx1030_cur
    .local pmc match
    .lex "$/", match
    length rx1030_eos, rx1030_tgt
    set rx1030_off, 0
    lt rx1030_pos, 2, rx1030_start
    sub rx1030_off, rx1030_pos, 1
    substr rx1030_tgt, rx1030_tgt, rx1030_off
  rx1030_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1033_done
    goto rxscan1033_scan
  rxscan1033_loop:
    ($P10) = rx1030_cur."from"()
    inc $P10
    set rx1030_pos, $P10
    ge rx1030_pos, rx1030_eos, rxscan1033_done
  rxscan1033_scan:
    set_addr $I10, rxscan1033_loop
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  rxscan1033_done:
.annotate 'line', 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1034_fail
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  # rx literal  "-"
    add $I11, rx1030_pos, 1
    gt $I11, rx1030_eos, rx1030_fail
    sub $I11, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I11, 1
    ne $S10, "-", rx1030_fail
    add rx1030_pos, 1
    set_addr $I10, rxcap_1034_fail
    ($I12, $I11) = rx1030_cur."!mark_peek"($I10)
    rx1030_cur."!cursor_pos"($I11)
    ($P10) = rx1030_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1030_pos, "")
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1034_done
  rxcap_1034_fail:
    goto rx1030_fail
  rxcap_1034_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx1030_pos, rx1030_eos, rx1030_fail
    sub $I10, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1030_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."number"()
    if $P10, rx1030_fail
  # rx subrule "O" subtype=capture negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1030_fail
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1030_pos = $P10."pos"()
  # rx pass
    rx1030_cur."!cursor_pass"(rx1030_pos, "prefix:sym<->")
    rx1030_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx1030_pos)
    .return (rx1030_cur)
  rx1030_fail:
.annotate 'line', 433
    (rx1030_rep, rx1030_pos, $I10, $P10) = rx1030_cur."!mark_fail"(0)
    lt rx1030_pos, -1, rx1030_done
    eq rx1030_pos, -1, rx1030_fail
    jump $I10
  rx1030_done:
    rx1030_cur."!cursor_fail"()
    rx1030_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx1030_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("258_1275160381.56318") :method
.annotate 'line', 433
    new $P1032, "ResizablePMCArray"
    push $P1032, "-"
    .return ($P1032)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("259_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1036_tgt
    .local int rx1036_pos
    .local int rx1036_off
    .local int rx1036_eos
    .local int rx1036_rep
    .local pmc rx1036_cur
    (rx1036_cur, rx1036_pos, rx1036_tgt) = self."!cursor_start"()
    rx1036_cur."!cursor_debug"("START ", "prefix:sym<?>")
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
.annotate 'line', 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1041_fail
    rx1036_cur."!mark_push"(0, rx1036_pos, $I10)
  # rx literal  "?"
    add $I11, rx1036_pos, 1
    gt $I11, rx1036_eos, rx1036_fail
    sub $I11, rx1036_pos, rx1036_off
    substr $S10, rx1036_tgt, $I11, 1
    ne $S10, "?", rx1036_fail
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
    $P10 = rx1036_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1036_fail
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1036_pos = $P10."pos"()
  # rx pass
    rx1036_cur."!cursor_pass"(rx1036_pos, "prefix:sym<?>")
    rx1036_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx1036_pos)
    .return (rx1036_cur)
  rx1036_fail:
.annotate 'line', 433
    (rx1036_rep, rx1036_pos, $I10, $P10) = rx1036_cur."!mark_fail"(0)
    lt rx1036_pos, -1, rx1036_done
    eq rx1036_pos, -1, rx1036_fail
    jump $I10
  rx1036_done:
    rx1036_cur."!cursor_fail"()
    rx1036_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx1036_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("260_1275160381.56318") :method
.annotate 'line', 433
    $P1038 = self."!PREFIX__!subrule"("O", "?")
    new $P1039, "ResizablePMCArray"
    push $P1039, $P1038
    .return ($P1039)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("261_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    (rx1043_cur, rx1043_pos, rx1043_tgt) = self."!cursor_start"()
    rx1043_cur."!cursor_debug"("START ", "prefix:sym<!>")
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
.annotate 'line', 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1048_fail
    rx1043_cur."!mark_push"(0, rx1043_pos, $I10)
  # rx literal  "!"
    add $I11, rx1043_pos, 1
    gt $I11, rx1043_eos, rx1043_fail
    sub $I11, rx1043_pos, rx1043_off
    substr $S10, rx1043_tgt, $I11, 1
    ne $S10, "!", rx1043_fail
    add rx1043_pos, 1
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
    $P10 = rx1043_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1043_pos = $P10."pos"()
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "prefix:sym<!>")
    rx1043_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1043_pos)
    .return (rx1043_cur)
  rx1043_fail:
.annotate 'line', 433
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    rx1043_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1043_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("262_1275160381.56318") :method
.annotate 'line', 433
    $P1045 = self."!PREFIX__!subrule"("O", "!")
    new $P1046, "ResizablePMCArray"
    push $P1046, $P1045
    .return ($P1046)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("263_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1050_tgt
    .local int rx1050_pos
    .local int rx1050_off
    .local int rx1050_eos
    .local int rx1050_rep
    .local pmc rx1050_cur
    (rx1050_cur, rx1050_pos, rx1050_tgt) = self."!cursor_start"()
    rx1050_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
.annotate 'line', 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1055_fail
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  # rx literal  "|"
    add $I11, rx1050_pos, 1
    gt $I11, rx1050_eos, rx1050_fail
    sub $I11, rx1050_pos, rx1050_off
    substr $S10, rx1050_tgt, $I11, 1
    ne $S10, "|", rx1050_fail
    add rx1050_pos, 1
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
    $P10 = rx1050_cur."O"("%symbolic_unary")
    unless $P10, rx1050_fail
    rx1050_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1050_pos = $P10."pos"()
  # rx pass
    rx1050_cur."!cursor_pass"(rx1050_pos, "prefix:sym<|>")
    rx1050_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1050_pos)
    .return (rx1050_cur)
  rx1050_fail:
.annotate 'line', 433
    (rx1050_rep, rx1050_pos, $I10, $P10) = rx1050_cur."!mark_fail"(0)
    lt rx1050_pos, -1, rx1050_done
    eq rx1050_pos, -1, rx1050_fail
    jump $I10
  rx1050_done:
    rx1050_cur."!cursor_fail"()
    rx1050_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1050_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("264_1275160381.56318") :method
.annotate 'line', 433
    $P1052 = self."!PREFIX__!subrule"("O", "|")
    new $P1053, "ResizablePMCArray"
    push $P1053, $P1052
    .return ($P1053)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("265_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1057_tgt
    .local int rx1057_pos
    .local int rx1057_off
    .local int rx1057_eos
    .local int rx1057_rep
    .local pmc rx1057_cur
    (rx1057_cur, rx1057_pos, rx1057_tgt) = self."!cursor_start"()
    rx1057_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate 'line', 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1062_fail
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  # rx literal  "*"
    add $I11, rx1057_pos, 1
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    substr $S10, rx1057_tgt, $I11, 1
    ne $S10, "*", rx1057_fail
    add rx1057_pos, 1
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
    $P10 = rx1057_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1057_fail
    rx1057_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1057_pos = $P10."pos"()
  # rx pass
    rx1057_cur."!cursor_pass"(rx1057_pos, "infix:sym<*>")
    rx1057_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1057_pos)
    .return (rx1057_cur)
  rx1057_fail:
.annotate 'line', 433
    (rx1057_rep, rx1057_pos, $I10, $P10) = rx1057_cur."!mark_fail"(0)
    lt rx1057_pos, -1, rx1057_done
    eq rx1057_pos, -1, rx1057_fail
    jump $I10
  rx1057_done:
    rx1057_cur."!cursor_fail"()
    rx1057_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1057_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("266_1275160381.56318") :method
.annotate 'line', 433
    $P1059 = self."!PREFIX__!subrule"("O", "*")
    new $P1060, "ResizablePMCArray"
    push $P1060, $P1059
    .return ($P1060)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("267_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1064_tgt
    .local int rx1064_pos
    .local int rx1064_off
    .local int rx1064_eos
    .local int rx1064_rep
    .local pmc rx1064_cur
    (rx1064_cur, rx1064_pos, rx1064_tgt) = self."!cursor_start"()
    rx1064_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate 'line', 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1069_fail
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx literal  "/"
    add $I11, rx1064_pos, 1
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 1
    ne $S10, "/", rx1064_fail
    add rx1064_pos, 1
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
    $P10 = rx1064_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1064_pos = $P10."pos"()
  # rx pass
    rx1064_cur."!cursor_pass"(rx1064_pos, "infix:sym</>")
    rx1064_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1064_pos)
    .return (rx1064_cur)
  rx1064_fail:
.annotate 'line', 433
    (rx1064_rep, rx1064_pos, $I10, $P10) = rx1064_cur."!mark_fail"(0)
    lt rx1064_pos, -1, rx1064_done
    eq rx1064_pos, -1, rx1064_fail
    jump $I10
  rx1064_done:
    rx1064_cur."!cursor_fail"()
    rx1064_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1064_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("268_1275160381.56318") :method
.annotate 'line', 433
    $P1066 = self."!PREFIX__!subrule"("O", "/")
    new $P1067, "ResizablePMCArray"
    push $P1067, $P1066
    .return ($P1067)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("269_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1071_tgt
    .local int rx1071_pos
    .local int rx1071_off
    .local int rx1071_eos
    .local int rx1071_rep
    .local pmc rx1071_cur
    (rx1071_cur, rx1071_pos, rx1071_tgt) = self."!cursor_start"()
    rx1071_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate 'line', 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1076_fail
    rx1071_cur."!mark_push"(0, rx1071_pos, $I10)
  # rx literal  "%"
    add $I11, rx1071_pos, 1
    gt $I11, rx1071_eos, rx1071_fail
    sub $I11, rx1071_pos, rx1071_off
    substr $S10, rx1071_tgt, $I11, 1
    ne $S10, "%", rx1071_fail
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
    $P10 = rx1071_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1071_fail
    rx1071_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1071_pos = $P10."pos"()
  # rx pass
    rx1071_cur."!cursor_pass"(rx1071_pos, "infix:sym<%>")
    rx1071_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1071_pos)
    .return (rx1071_cur)
  rx1071_fail:
.annotate 'line', 433
    (rx1071_rep, rx1071_pos, $I10, $P10) = rx1071_cur."!mark_fail"(0)
    lt rx1071_pos, -1, rx1071_done
    eq rx1071_pos, -1, rx1071_fail
    jump $I10
  rx1071_done:
    rx1071_cur."!cursor_fail"()
    rx1071_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1071_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("270_1275160381.56318") :method
.annotate 'line', 433
    $P1073 = self."!PREFIX__!subrule"("O", "%")
    new $P1074, "ResizablePMCArray"
    push $P1074, $P1073
    .return ($P1074)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("271_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1078_tgt
    .local int rx1078_pos
    .local int rx1078_off
    .local int rx1078_eos
    .local int rx1078_rep
    .local pmc rx1078_cur
    (rx1078_cur, rx1078_pos, rx1078_tgt) = self."!cursor_start"()
    rx1078_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate 'line', 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1083_fail
    rx1078_cur."!mark_push"(0, rx1078_pos, $I10)
  # rx literal  "+"
    add $I11, rx1078_pos, 1
    gt $I11, rx1078_eos, rx1078_fail
    sub $I11, rx1078_pos, rx1078_off
    substr $S10, rx1078_tgt, $I11, 1
    ne $S10, "+", rx1078_fail
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
    $P10 = rx1078_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1078_fail
    rx1078_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1078_pos = $P10."pos"()
  # rx pass
    rx1078_cur."!cursor_pass"(rx1078_pos, "infix:sym<+>")
    rx1078_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1078_pos)
    .return (rx1078_cur)
  rx1078_fail:
.annotate 'line', 433
    (rx1078_rep, rx1078_pos, $I10, $P10) = rx1078_cur."!mark_fail"(0)
    lt rx1078_pos, -1, rx1078_done
    eq rx1078_pos, -1, rx1078_fail
    jump $I10
  rx1078_done:
    rx1078_cur."!cursor_fail"()
    rx1078_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1078_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("272_1275160381.56318") :method
.annotate 'line', 433
    $P1080 = self."!PREFIX__!subrule"("O", "+")
    new $P1081, "ResizablePMCArray"
    push $P1081, $P1080
    .return ($P1081)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("273_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1085_tgt
    .local int rx1085_pos
    .local int rx1085_off
    .local int rx1085_eos
    .local int rx1085_rep
    .local pmc rx1085_cur
    (rx1085_cur, rx1085_pos, rx1085_tgt) = self."!cursor_start"()
    rx1085_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate 'line', 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1090_fail
    rx1085_cur."!mark_push"(0, rx1085_pos, $I10)
  # rx literal  "-"
    add $I11, rx1085_pos, 1
    gt $I11, rx1085_eos, rx1085_fail
    sub $I11, rx1085_pos, rx1085_off
    substr $S10, rx1085_tgt, $I11, 1
    ne $S10, "-", rx1085_fail
    add rx1085_pos, 1
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
    $P10 = rx1085_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1085_fail
    rx1085_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1085_pos = $P10."pos"()
  # rx pass
    rx1085_cur."!cursor_pass"(rx1085_pos, "infix:sym<->")
    rx1085_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1085_pos)
    .return (rx1085_cur)
  rx1085_fail:
.annotate 'line', 433
    (rx1085_rep, rx1085_pos, $I10, $P10) = rx1085_cur."!mark_fail"(0)
    lt rx1085_pos, -1, rx1085_done
    eq rx1085_pos, -1, rx1085_fail
    jump $I10
  rx1085_done:
    rx1085_cur."!cursor_fail"()
    rx1085_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1085_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("274_1275160381.56318") :method
.annotate 'line', 433
    $P1087 = self."!PREFIX__!subrule"("O", "-")
    new $P1088, "ResizablePMCArray"
    push $P1088, $P1087
    .return ($P1088)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("275_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    (rx1092_cur, rx1092_pos, rx1092_tgt) = self."!cursor_start"()
    rx1092_cur."!cursor_debug"("START ", "infix:sym<~>")
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
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1097_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  "~"
    add $I11, rx1092_pos, 1
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    substr $S10, rx1092_tgt, $I11, 1
    ne $S10, "~", rx1092_fail
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
    $P10 = rx1092_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "infix:sym<~>")
    rx1092_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1092_pos)
    .return (rx1092_cur)
  rx1092_fail:
.annotate 'line', 433
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    rx1092_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1092_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("276_1275160381.56318") :method
.annotate 'line', 433
    $P1094 = self."!PREFIX__!subrule"("O", "~")
    new $P1095, "ResizablePMCArray"
    push $P1095, $P1094
    .return ($P1095)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("277_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1099_tgt
    .local int rx1099_pos
    .local int rx1099_off
    .local int rx1099_eos
    .local int rx1099_rep
    .local pmc rx1099_cur
    (rx1099_cur, rx1099_pos, rx1099_tgt) = self."!cursor_start"()
    rx1099_cur."!cursor_debug"("START ", "infix:sym<==>")
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
.annotate 'line', 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1104_fail
    rx1099_cur."!mark_push"(0, rx1099_pos, $I10)
  # rx literal  "=="
    add $I11, rx1099_pos, 2
    gt $I11, rx1099_eos, rx1099_fail
    sub $I11, rx1099_pos, rx1099_off
    substr $S10, rx1099_tgt, $I11, 2
    ne $S10, "==", rx1099_fail
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
    $P10 = rx1099_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1099_fail
    rx1099_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1099_pos = $P10."pos"()
  # rx pass
    rx1099_cur."!cursor_pass"(rx1099_pos, "infix:sym<==>")
    rx1099_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1099_pos)
    .return (rx1099_cur)
  rx1099_fail:
.annotate 'line', 433
    (rx1099_rep, rx1099_pos, $I10, $P10) = rx1099_cur."!mark_fail"(0)
    lt rx1099_pos, -1, rx1099_done
    eq rx1099_pos, -1, rx1099_fail
    jump $I10
  rx1099_done:
    rx1099_cur."!cursor_fail"()
    rx1099_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1099_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("278_1275160381.56318") :method
.annotate 'line', 433
    $P1101 = self."!PREFIX__!subrule"("O", "==")
    new $P1102, "ResizablePMCArray"
    push $P1102, $P1101
    .return ($P1102)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("279_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    (rx1106_cur, rx1106_pos, rx1106_tgt) = self."!cursor_start"()
    rx1106_cur."!cursor_debug"("START ", "infix:sym<!=>")
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
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1111_fail
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  # rx literal  "!="
    add $I11, rx1106_pos, 2
    gt $I11, rx1106_eos, rx1106_fail
    sub $I11, rx1106_pos, rx1106_off
    substr $S10, rx1106_tgt, $I11, 2
    ne $S10, "!=", rx1106_fail
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
    $P10 = rx1106_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1106_pos = $P10."pos"()
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "infix:sym<!=>")
    rx1106_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1106_pos)
    .return (rx1106_cur)
  rx1106_fail:
.annotate 'line', 433
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    rx1106_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("280_1275160381.56318") :method
.annotate 'line', 433
    $P1108 = self."!PREFIX__!subrule"("O", "!=")
    new $P1109, "ResizablePMCArray"
    push $P1109, $P1108
    .return ($P1109)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("281_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1113_tgt
    .local int rx1113_pos
    .local int rx1113_off
    .local int rx1113_eos
    .local int rx1113_rep
    .local pmc rx1113_cur
    (rx1113_cur, rx1113_pos, rx1113_tgt) = self."!cursor_start"()
    rx1113_cur."!cursor_debug"("START ", "infix:sym<<=>")
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
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1118_fail
    rx1113_cur."!mark_push"(0, rx1113_pos, $I10)
  # rx literal  "<="
    add $I11, rx1113_pos, 2
    gt $I11, rx1113_eos, rx1113_fail
    sub $I11, rx1113_pos, rx1113_off
    substr $S10, rx1113_tgt, $I11, 2
    ne $S10, "<=", rx1113_fail
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
    $P10 = rx1113_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1113_fail
    rx1113_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1113_pos = $P10."pos"()
  # rx pass
    rx1113_cur."!cursor_pass"(rx1113_pos, "infix:sym<<=>")
    rx1113_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1113_pos)
    .return (rx1113_cur)
  rx1113_fail:
.annotate 'line', 433
    (rx1113_rep, rx1113_pos, $I10, $P10) = rx1113_cur."!mark_fail"(0)
    lt rx1113_pos, -1, rx1113_done
    eq rx1113_pos, -1, rx1113_fail
    jump $I10
  rx1113_done:
    rx1113_cur."!cursor_fail"()
    rx1113_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1113_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("282_1275160381.56318") :method
.annotate 'line', 433
    $P1115 = self."!PREFIX__!subrule"("O", "<=")
    new $P1116, "ResizablePMCArray"
    push $P1116, $P1115
    .return ($P1116)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("283_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1120_tgt
    .local int rx1120_pos
    .local int rx1120_off
    .local int rx1120_eos
    .local int rx1120_rep
    .local pmc rx1120_cur
    (rx1120_cur, rx1120_pos, rx1120_tgt) = self."!cursor_start"()
    rx1120_cur."!cursor_debug"("START ", "infix:sym<>=>")
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
.annotate 'line', 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1125_fail
    rx1120_cur."!mark_push"(0, rx1120_pos, $I10)
  # rx literal  ">="
    add $I11, rx1120_pos, 2
    gt $I11, rx1120_eos, rx1120_fail
    sub $I11, rx1120_pos, rx1120_off
    substr $S10, rx1120_tgt, $I11, 2
    ne $S10, ">=", rx1120_fail
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
    $P10 = rx1120_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1120_fail
    rx1120_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1120_pos = $P10."pos"()
  # rx pass
    rx1120_cur."!cursor_pass"(rx1120_pos, "infix:sym<>=>")
    rx1120_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1120_pos)
    .return (rx1120_cur)
  rx1120_fail:
.annotate 'line', 433
    (rx1120_rep, rx1120_pos, $I10, $P10) = rx1120_cur."!mark_fail"(0)
    lt rx1120_pos, -1, rx1120_done
    eq rx1120_pos, -1, rx1120_fail
    jump $I10
  rx1120_done:
    rx1120_cur."!cursor_fail"()
    rx1120_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1120_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("284_1275160381.56318") :method
.annotate 'line', 433
    $P1122 = self."!PREFIX__!subrule"("O", ">=")
    new $P1123, "ResizablePMCArray"
    push $P1123, $P1122
    .return ($P1123)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("285_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1127_tgt
    .local int rx1127_pos
    .local int rx1127_off
    .local int rx1127_eos
    .local int rx1127_rep
    .local pmc rx1127_cur
    (rx1127_cur, rx1127_pos, rx1127_tgt) = self."!cursor_start"()
    rx1127_cur."!cursor_debug"("START ", "infix:sym<<>")
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
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1132_fail
    rx1127_cur."!mark_push"(0, rx1127_pos, $I10)
  # rx literal  "<"
    add $I11, rx1127_pos, 1
    gt $I11, rx1127_eos, rx1127_fail
    sub $I11, rx1127_pos, rx1127_off
    substr $S10, rx1127_tgt, $I11, 1
    ne $S10, "<", rx1127_fail
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
    $P10 = rx1127_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1127_fail
    rx1127_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1127_pos = $P10."pos"()
  # rx pass
    rx1127_cur."!cursor_pass"(rx1127_pos, "infix:sym<<>")
    rx1127_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1127_pos)
    .return (rx1127_cur)
  rx1127_fail:
.annotate 'line', 433
    (rx1127_rep, rx1127_pos, $I10, $P10) = rx1127_cur."!mark_fail"(0)
    lt rx1127_pos, -1, rx1127_done
    eq rx1127_pos, -1, rx1127_fail
    jump $I10
  rx1127_done:
    rx1127_cur."!cursor_fail"()
    rx1127_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1127_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("286_1275160381.56318") :method
.annotate 'line', 433
    $P1129 = self."!PREFIX__!subrule"("O", "<")
    new $P1130, "ResizablePMCArray"
    push $P1130, $P1129
    .return ($P1130)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("287_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1134_tgt
    .local int rx1134_pos
    .local int rx1134_off
    .local int rx1134_eos
    .local int rx1134_rep
    .local pmc rx1134_cur
    (rx1134_cur, rx1134_pos, rx1134_tgt) = self."!cursor_start"()
    rx1134_cur."!cursor_debug"("START ", "infix:sym<>>")
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
.annotate 'line', 507
  # rx subcapture "sym"
    set_addr $I10, rxcap_1139_fail
    rx1134_cur."!mark_push"(0, rx1134_pos, $I10)
  # rx literal  ">"
    add $I11, rx1134_pos, 1
    gt $I11, rx1134_eos, rx1134_fail
    sub $I11, rx1134_pos, rx1134_off
    substr $S10, rx1134_tgt, $I11, 1
    ne $S10, ">", rx1134_fail
    add rx1134_pos, 1
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
    $P10 = rx1134_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1134_fail
    rx1134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1134_pos = $P10."pos"()
  # rx pass
    rx1134_cur."!cursor_pass"(rx1134_pos, "infix:sym<>>")
    rx1134_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1134_pos)
    .return (rx1134_cur)
  rx1134_fail:
.annotate 'line', 433
    (rx1134_rep, rx1134_pos, $I10, $P10) = rx1134_cur."!mark_fail"(0)
    lt rx1134_pos, -1, rx1134_done
    eq rx1134_pos, -1, rx1134_fail
    jump $I10
  rx1134_done:
    rx1134_cur."!cursor_fail"()
    rx1134_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1134_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("288_1275160381.56318") :method
.annotate 'line', 433
    $P1136 = self."!PREFIX__!subrule"("O", ">")
    new $P1137, "ResizablePMCArray"
    push $P1137, $P1136
    .return ($P1137)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("289_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1141_tgt
    .local int rx1141_pos
    .local int rx1141_off
    .local int rx1141_eos
    .local int rx1141_rep
    .local pmc rx1141_cur
    (rx1141_cur, rx1141_pos, rx1141_tgt) = self."!cursor_start"()
    rx1141_cur."!cursor_debug"("START ", "infix:sym<eq>")
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
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1146_fail
    rx1141_cur."!mark_push"(0, rx1141_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1141_pos, 2
    gt $I11, rx1141_eos, rx1141_fail
    sub $I11, rx1141_pos, rx1141_off
    substr $S10, rx1141_tgt, $I11, 2
    ne $S10, "eq", rx1141_fail
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
    $P10 = rx1141_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1141_fail
    rx1141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1141_pos = $P10."pos"()
  # rx pass
    rx1141_cur."!cursor_pass"(rx1141_pos, "infix:sym<eq>")
    rx1141_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1141_pos)
    .return (rx1141_cur)
  rx1141_fail:
.annotate 'line', 433
    (rx1141_rep, rx1141_pos, $I10, $P10) = rx1141_cur."!mark_fail"(0)
    lt rx1141_pos, -1, rx1141_done
    eq rx1141_pos, -1, rx1141_fail
    jump $I10
  rx1141_done:
    rx1141_cur."!cursor_fail"()
    rx1141_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("290_1275160381.56318") :method
.annotate 'line', 433
    $P1143 = self."!PREFIX__!subrule"("O", "eq")
    new $P1144, "ResizablePMCArray"
    push $P1144, $P1143
    .return ($P1144)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("291_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1148_tgt
    .local int rx1148_pos
    .local int rx1148_off
    .local int rx1148_eos
    .local int rx1148_rep
    .local pmc rx1148_cur
    (rx1148_cur, rx1148_pos, rx1148_tgt) = self."!cursor_start"()
    rx1148_cur."!cursor_debug"("START ", "infix:sym<ne>")
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
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1153_fail
    rx1148_cur."!mark_push"(0, rx1148_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1148_pos, 2
    gt $I11, rx1148_eos, rx1148_fail
    sub $I11, rx1148_pos, rx1148_off
    substr $S10, rx1148_tgt, $I11, 2
    ne $S10, "ne", rx1148_fail
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
    $P10 = rx1148_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1148_fail
    rx1148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1148_pos = $P10."pos"()
  # rx pass
    rx1148_cur."!cursor_pass"(rx1148_pos, "infix:sym<ne>")
    rx1148_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1148_pos)
    .return (rx1148_cur)
  rx1148_fail:
.annotate 'line', 433
    (rx1148_rep, rx1148_pos, $I10, $P10) = rx1148_cur."!mark_fail"(0)
    lt rx1148_pos, -1, rx1148_done
    eq rx1148_pos, -1, rx1148_fail
    jump $I10
  rx1148_done:
    rx1148_cur."!cursor_fail"()
    rx1148_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1148_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("292_1275160381.56318") :method
.annotate 'line', 433
    $P1150 = self."!PREFIX__!subrule"("O", "ne")
    new $P1151, "ResizablePMCArray"
    push $P1151, $P1150
    .return ($P1151)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("293_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<le>")
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
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "le"
    add $I11, rx1155_pos, 2
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 2
    ne $S10, "le", rx1155_fail
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
    $P10 = rx1155_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1155_fail
    rx1155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1155_pos = $P10."pos"()
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<le>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate 'line', 433
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("294_1275160381.56318") :method
.annotate 'line', 433
    $P1157 = self."!PREFIX__!subrule"("O", "le")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("295_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<ge>")
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
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, "ge", rx1162_fail
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
    $P10 = rx1162_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<ge>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate 'line', 433
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("296_1275160381.56318") :method
.annotate 'line', 433
    $P1164 = self."!PREFIX__!subrule"("O", "ge")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("297_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1169_cur
    .local pmc match
    .lex "$/", match
    length rx1169_eos, rx1169_tgt
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
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1174_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1169_pos, 2
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 2
    ne $S10, "lt", rx1169_fail
    add rx1169_pos, 2
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
    $P10 = rx1169_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "infix:sym<lt>")
    rx1169_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate 'line', 433
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("298_1275160381.56318") :method
.annotate 'line', 433
    $P1171 = self."!PREFIX__!subrule"("O", "lt")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("299_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1176_tgt
    .local int rx1176_pos
    .local int rx1176_off
    .local int rx1176_eos
    .local int rx1176_rep
    .local pmc rx1176_cur
    (rx1176_cur, rx1176_pos, rx1176_tgt) = self."!cursor_start"()
    rx1176_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1176_cur
    .local pmc match
    .lex "$/", match
    length rx1176_eos, rx1176_tgt
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
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1181_fail
    rx1176_cur."!mark_push"(0, rx1176_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1176_pos, 2
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 2
    ne $S10, "gt", rx1176_fail
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
    $P10 = rx1176_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1176_pos = $P10."pos"()
  # rx pass
    rx1176_cur."!cursor_pass"(rx1176_pos, "infix:sym<gt>")
    rx1176_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1176_pos)
    .return (rx1176_cur)
  rx1176_fail:
.annotate 'line', 433
    (rx1176_rep, rx1176_pos, $I10, $P10) = rx1176_cur."!mark_fail"(0)
    lt rx1176_pos, -1, rx1176_done
    eq rx1176_pos, -1, rx1176_fail
    jump $I10
  rx1176_done:
    rx1176_cur."!cursor_fail"()
    rx1176_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("300_1275160381.56318") :method
.annotate 'line', 433
    $P1178 = self."!PREFIX__!subrule"("O", "gt")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("301_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1183_tgt
    .local int rx1183_pos
    .local int rx1183_off
    .local int rx1183_eos
    .local int rx1183_rep
    .local pmc rx1183_cur
    (rx1183_cur, rx1183_pos, rx1183_tgt) = self."!cursor_start"()
    rx1183_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1183_cur
    .local pmc match
    .lex "$/", match
    length rx1183_eos, rx1183_tgt
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
.annotate 'line', 514
  # rx subcapture "sym"
    set_addr $I10, rxcap_1188_fail
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1183_pos, 3
    gt $I11, rx1183_eos, rx1183_fail
    sub $I11, rx1183_pos, rx1183_off
    substr $S10, rx1183_tgt, $I11, 3
    ne $S10, "=:=", rx1183_fail
    add rx1183_pos, 3
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
    $P10 = rx1183_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1183_fail
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1183_pos = $P10."pos"()
  # rx pass
    rx1183_cur."!cursor_pass"(rx1183_pos, "infix:sym<=:=>")
    rx1183_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1183_pos)
    .return (rx1183_cur)
  rx1183_fail:
.annotate 'line', 433
    (rx1183_rep, rx1183_pos, $I10, $P10) = rx1183_cur."!mark_fail"(0)
    lt rx1183_pos, -1, rx1183_done
    eq rx1183_pos, -1, rx1183_fail
    jump $I10
  rx1183_done:
    rx1183_cur."!cursor_fail"()
    rx1183_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("302_1275160381.56318") :method
.annotate 'line', 433
    $P1185 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1186, "ResizablePMCArray"
    push $P1186, $P1185
    .return ($P1186)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("303_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1190_tgt
    .local int rx1190_pos
    .local int rx1190_off
    .local int rx1190_eos
    .local int rx1190_rep
    .local pmc rx1190_cur
    (rx1190_cur, rx1190_pos, rx1190_tgt) = self."!cursor_start"()
    rx1190_cur."!cursor_debug"("START ", "infix:sym<~~>")
    .lex unicode:"$\x{a2}", rx1190_cur
    .local pmc match
    .lex "$/", match
    length rx1190_eos, rx1190_tgt
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
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1195_fail
    rx1190_cur."!mark_push"(0, rx1190_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1190_pos, 2
    gt $I11, rx1190_eos, rx1190_fail
    sub $I11, rx1190_pos, rx1190_off
    substr $S10, rx1190_tgt, $I11, 2
    ne $S10, "~~", rx1190_fail
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
    $P10 = rx1190_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1190_fail
    rx1190_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1190_pos = $P10."pos"()
  # rx pass
    rx1190_cur."!cursor_pass"(rx1190_pos, "infix:sym<~~>")
    rx1190_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1190_pos)
    .return (rx1190_cur)
  rx1190_fail:
.annotate 'line', 433
    (rx1190_rep, rx1190_pos, $I10, $P10) = rx1190_cur."!mark_fail"(0)
    lt rx1190_pos, -1, rx1190_done
    eq rx1190_pos, -1, rx1190_fail
    jump $I10
  rx1190_done:
    rx1190_cur."!cursor_fail"()
    rx1190_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1190_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("304_1275160381.56318") :method
.annotate 'line', 433
    $P1192 = self."!PREFIX__!subrule"("O", "~~")
    new $P1193, "ResizablePMCArray"
    push $P1193, $P1192
    .return ($P1193)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("305_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    (rx1197_cur, rx1197_pos, rx1197_tgt) = self."!cursor_start"()
    rx1197_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1197_cur
    .local pmc match
    .lex "$/", match
    length rx1197_eos, rx1197_tgt
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
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1202_fail
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1197_pos, 2
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 2
    ne $S10, "&&", rx1197_fail
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
    $P10 = rx1197_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1197_pos = $P10."pos"()
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "infix:sym<&&>")
    rx1197_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate 'line', 433
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    rx1197_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("306_1275160381.56318") :method
.annotate 'line', 433
    $P1199 = self."!PREFIX__!subrule"("O", "&&")
    new $P1200, "ResizablePMCArray"
    push $P1200, $P1199
    .return ($P1200)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("307_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1204_tgt
    .local int rx1204_pos
    .local int rx1204_off
    .local int rx1204_eos
    .local int rx1204_rep
    .local pmc rx1204_cur
    (rx1204_cur, rx1204_pos, rx1204_tgt) = self."!cursor_start"()
    rx1204_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1204_cur
    .local pmc match
    .lex "$/", match
    length rx1204_eos, rx1204_tgt
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
.annotate 'line', 519
  # rx subcapture "sym"
    set_addr $I10, rxcap_1209_fail
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  # rx literal  "||"
    add $I11, rx1204_pos, 2
    gt $I11, rx1204_eos, rx1204_fail
    sub $I11, rx1204_pos, rx1204_off
    substr $S10, rx1204_tgt, $I11, 2
    ne $S10, "||", rx1204_fail
    add rx1204_pos, 2
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
    $P10 = rx1204_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1204_fail
    rx1204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1204_pos = $P10."pos"()
  # rx pass
    rx1204_cur."!cursor_pass"(rx1204_pos, "infix:sym<||>")
    rx1204_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1204_pos)
    .return (rx1204_cur)
  rx1204_fail:
.annotate 'line', 433
    (rx1204_rep, rx1204_pos, $I10, $P10) = rx1204_cur."!mark_fail"(0)
    lt rx1204_pos, -1, rx1204_done
    eq rx1204_pos, -1, rx1204_fail
    jump $I10
  rx1204_done:
    rx1204_cur."!cursor_fail"()
    rx1204_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1204_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("308_1275160381.56318") :method
.annotate 'line', 433
    $P1206 = self."!PREFIX__!subrule"("O", "||")
    new $P1207, "ResizablePMCArray"
    push $P1207, $P1206
    .return ($P1207)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("309_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1211_tgt
    .local int rx1211_pos
    .local int rx1211_off
    .local int rx1211_eos
    .local int rx1211_rep
    .local pmc rx1211_cur
    (rx1211_cur, rx1211_pos, rx1211_tgt) = self."!cursor_start"()
    rx1211_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1211_cur
    .local pmc match
    .lex "$/", match
    length rx1211_eos, rx1211_tgt
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
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1216_fail
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  # rx literal  "//"
    add $I11, rx1211_pos, 2
    gt $I11, rx1211_eos, rx1211_fail
    sub $I11, rx1211_pos, rx1211_off
    substr $S10, rx1211_tgt, $I11, 2
    ne $S10, "//", rx1211_fail
    add rx1211_pos, 2
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
    $P10 = rx1211_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1211_fail
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1211_pos = $P10."pos"()
  # rx pass
    rx1211_cur."!cursor_pass"(rx1211_pos, "infix:sym<//>")
    rx1211_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1211_pos)
    .return (rx1211_cur)
  rx1211_fail:
.annotate 'line', 433
    (rx1211_rep, rx1211_pos, $I10, $P10) = rx1211_cur."!mark_fail"(0)
    lt rx1211_pos, -1, rx1211_done
    eq rx1211_pos, -1, rx1211_fail
    jump $I10
  rx1211_done:
    rx1211_cur."!cursor_fail"()
    rx1211_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1211_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("310_1275160381.56318") :method
.annotate 'line', 433
    $P1213 = self."!PREFIX__!subrule"("O", "//")
    new $P1214, "ResizablePMCArray"
    push $P1214, $P1213
    .return ($P1214)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("311_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1218_tgt
    .local int rx1218_pos
    .local int rx1218_off
    .local int rx1218_eos
    .local int rx1218_rep
    .local pmc rx1218_cur
    (rx1218_cur, rx1218_pos, rx1218_tgt) = self."!cursor_start"()
    rx1218_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1218_cur
    .local pmc match
    .lex "$/", match
    length rx1218_eos, rx1218_tgt
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
.annotate 'line', 523
  # rx literal  "??"
    add $I11, rx1218_pos, 2
    gt $I11, rx1218_eos, rx1218_fail
    sub $I11, rx1218_pos, rx1218_off
    substr $S10, rx1218_tgt, $I11, 2
    ne $S10, "??", rx1218_fail
    add rx1218_pos, 2
.annotate 'line', 524
  # rx subrule "ws" subtype=method negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."ws"()
    unless $P10, rx1218_fail
    rx1218_pos = $P10."pos"()
.annotate 'line', 525
  # rx subrule "EXPR" subtype=capture negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."EXPR"("i=")
    unless $P10, rx1218_fail
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1218_pos = $P10."pos"()
.annotate 'line', 526
  # rx literal  "!!"
    add $I11, rx1218_pos, 2
    gt $I11, rx1218_eos, rx1218_fail
    sub $I11, rx1218_pos, rx1218_off
    substr $S10, rx1218_tgt, $I11, 2
    ne $S10, "!!", rx1218_fail
    add rx1218_pos, 2
.annotate 'line', 527
  # rx subrule "O" subtype=capture negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1218_fail
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1218_pos = $P10."pos"()
.annotate 'line', 522
  # rx pass
    rx1218_cur."!cursor_pass"(rx1218_pos, "infix:sym<?? !!>")
    rx1218_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1218_pos)
    .return (rx1218_cur)
  rx1218_fail:
.annotate 'line', 433
    (rx1218_rep, rx1218_pos, $I10, $P10) = rx1218_cur."!mark_fail"(0)
    lt rx1218_pos, -1, rx1218_done
    eq rx1218_pos, -1, rx1218_fail
    jump $I10
  rx1218_done:
    rx1218_cur."!cursor_fail"()
    rx1218_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("312_1275160381.56318") :method
.annotate 'line', 433
    $P1220 = self."!PREFIX__!subrule"("", "??")
    new $P1221, "ResizablePMCArray"
    push $P1221, $P1220
    .return ($P1221)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("313_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1224_tgt
    .local int rx1224_pos
    .local int rx1224_off
    .local int rx1224_eos
    .local int rx1224_rep
    .local pmc rx1224_cur
    (rx1224_cur, rx1224_pos, rx1224_tgt) = self."!cursor_start"()
    rx1224_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1224_cur
    .local pmc match
    .lex "$/", match
    length rx1224_eos, rx1224_tgt
    set rx1224_off, 0
    lt rx1224_pos, 2, rx1224_start
    sub rx1224_off, rx1224_pos, 1
    substr rx1224_tgt, rx1224_tgt, rx1224_off
  rx1224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1228_done
    goto rxscan1228_scan
  rxscan1228_loop:
    ($P10) = rx1224_cur."from"()
    inc $P10
    set rx1224_pos, $P10
    ge rx1224_pos, rx1224_eos, rxscan1228_done
  rxscan1228_scan:
    set_addr $I10, rxscan1228_loop
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  rxscan1228_done:
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1229_fail
    rx1224_cur."!mark_push"(0, rx1224_pos, $I10)
  # rx literal  "="
    add $I11, rx1224_pos, 1
    gt $I11, rx1224_eos, rx1224_fail
    sub $I11, rx1224_pos, rx1224_off
    substr $S10, rx1224_tgt, $I11, 1
    ne $S10, "=", rx1224_fail
    add rx1224_pos, 1
    set_addr $I10, rxcap_1229_fail
    ($I12, $I11) = rx1224_cur."!mark_peek"($I10)
    rx1224_cur."!cursor_pos"($I11)
    ($P10) = rx1224_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1224_pos, "")
    rx1224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1229_done
  rxcap_1229_fail:
    goto rx1224_fail
  rxcap_1229_done:
  # rx subrule "panic" subtype=method negate=
    rx1224_cur."!cursor_pos"(rx1224_pos)
    $P10 = rx1224_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1224_fail
    rx1224_pos = $P10."pos"()
.annotate 'line', 530
  # rx pass
    rx1224_cur."!cursor_pass"(rx1224_pos, "infix:sym<=>")
    rx1224_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1224_pos)
    .return (rx1224_cur)
  rx1224_fail:
.annotate 'line', 433
    (rx1224_rep, rx1224_pos, $I10, $P10) = rx1224_cur."!mark_fail"(0)
    lt rx1224_pos, -1, rx1224_done
    eq rx1224_pos, -1, rx1224_fail
    jump $I10
  rx1224_done:
    rx1224_cur."!cursor_fail"()
    rx1224_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("314_1275160381.56318") :method
.annotate 'line', 433
    $P1226 = self."!PREFIX__!subrule"("", "=")
    new $P1227, "ResizablePMCArray"
    push $P1227, $P1226
    .return ($P1227)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("315_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1231_tgt
    .local int rx1231_pos
    .local int rx1231_off
    .local int rx1231_eos
    .local int rx1231_rep
    .local pmc rx1231_cur
    (rx1231_cur, rx1231_pos, rx1231_tgt) = self."!cursor_start"()
    rx1231_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1231_cur
    .local pmc match
    .lex "$/", match
    length rx1231_eos, rx1231_tgt
    set rx1231_off, 0
    lt rx1231_pos, 2, rx1231_start
    sub rx1231_off, rx1231_pos, 1
    substr rx1231_tgt, rx1231_tgt, rx1231_off
  rx1231_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1235_done
    goto rxscan1235_scan
  rxscan1235_loop:
    ($P10) = rx1231_cur."from"()
    inc $P10
    set rx1231_pos, $P10
    ge rx1231_pos, rx1231_eos, rxscan1235_done
  rxscan1235_scan:
    set_addr $I10, rxscan1235_loop
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  rxscan1235_done:
.annotate 'line', 533
  # rx subcapture "sym"
    set_addr $I10, rxcap_1236_fail
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  # rx literal  ":="
    add $I11, rx1231_pos, 2
    gt $I11, rx1231_eos, rx1231_fail
    sub $I11, rx1231_pos, rx1231_off
    substr $S10, rx1231_tgt, $I11, 2
    ne $S10, ":=", rx1231_fail
    add rx1231_pos, 2
    set_addr $I10, rxcap_1236_fail
    ($I12, $I11) = rx1231_cur."!mark_peek"($I10)
    rx1231_cur."!cursor_pos"($I11)
    ($P10) = rx1231_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1231_pos, "")
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1236_done
  rxcap_1236_fail:
    goto rx1231_fail
  rxcap_1236_done:
  # rx subrule "O" subtype=capture negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1231_fail
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1231_pos = $P10."pos"()
  # rx pass
    rx1231_cur."!cursor_pass"(rx1231_pos, "infix:sym<:=>")
    rx1231_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1231_pos)
    .return (rx1231_cur)
  rx1231_fail:
.annotate 'line', 433
    (rx1231_rep, rx1231_pos, $I10, $P10) = rx1231_cur."!mark_fail"(0)
    lt rx1231_pos, -1, rx1231_done
    eq rx1231_pos, -1, rx1231_fail
    jump $I10
  rx1231_done:
    rx1231_cur."!cursor_fail"()
    rx1231_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1231_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("316_1275160381.56318") :method
.annotate 'line', 433
    $P1233 = self."!PREFIX__!subrule"("O", ":=")
    new $P1234, "ResizablePMCArray"
    push $P1234, $P1233
    .return ($P1234)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("317_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1238_tgt
    .local int rx1238_pos
    .local int rx1238_off
    .local int rx1238_eos
    .local int rx1238_rep
    .local pmc rx1238_cur
    (rx1238_cur, rx1238_pos, rx1238_tgt) = self."!cursor_start"()
    rx1238_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1238_cur
    .local pmc match
    .lex "$/", match
    length rx1238_eos, rx1238_tgt
    set rx1238_off, 0
    lt rx1238_pos, 2, rx1238_start
    sub rx1238_off, rx1238_pos, 1
    substr rx1238_tgt, rx1238_tgt, rx1238_off
  rx1238_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1242_done
    goto rxscan1242_scan
  rxscan1242_loop:
    ($P10) = rx1238_cur."from"()
    inc $P10
    set rx1238_pos, $P10
    ge rx1238_pos, rx1238_eos, rxscan1242_done
  rxscan1242_scan:
    set_addr $I10, rxscan1242_loop
    rx1238_cur."!mark_push"(0, rx1238_pos, $I10)
  rxscan1242_done:
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1243_fail
    rx1238_cur."!mark_push"(0, rx1238_pos, $I10)
  # rx literal  "::="
    add $I11, rx1238_pos, 3
    gt $I11, rx1238_eos, rx1238_fail
    sub $I11, rx1238_pos, rx1238_off
    substr $S10, rx1238_tgt, $I11, 3
    ne $S10, "::=", rx1238_fail
    add rx1238_pos, 3
    set_addr $I10, rxcap_1243_fail
    ($I12, $I11) = rx1238_cur."!mark_peek"($I10)
    rx1238_cur."!cursor_pos"($I11)
    ($P10) = rx1238_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1238_pos, "")
    rx1238_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1243_done
  rxcap_1243_fail:
    goto rx1238_fail
  rxcap_1243_done:
  # rx subrule "O" subtype=capture negate=
    rx1238_cur."!cursor_pos"(rx1238_pos)
    $P10 = rx1238_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1238_fail
    rx1238_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1238_pos = $P10."pos"()
  # rx pass
    rx1238_cur."!cursor_pass"(rx1238_pos, "infix:sym<::=>")
    rx1238_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1238_pos)
    .return (rx1238_cur)
  rx1238_fail:
.annotate 'line', 433
    (rx1238_rep, rx1238_pos, $I10, $P10) = rx1238_cur."!mark_fail"(0)
    lt rx1238_pos, -1, rx1238_done
    eq rx1238_pos, -1, rx1238_fail
    jump $I10
  rx1238_done:
    rx1238_cur."!cursor_fail"()
    rx1238_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1238_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("318_1275160381.56318") :method
.annotate 'line', 433
    $P1240 = self."!PREFIX__!subrule"("O", "::=")
    new $P1241, "ResizablePMCArray"
    push $P1241, $P1240
    .return ($P1241)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("319_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1245_tgt
    .local int rx1245_pos
    .local int rx1245_off
    .local int rx1245_eos
    .local int rx1245_rep
    .local pmc rx1245_cur
    (rx1245_cur, rx1245_pos, rx1245_tgt) = self."!cursor_start"()
    rx1245_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1245_cur
    .local pmc match
    .lex "$/", match
    length rx1245_eos, rx1245_tgt
    set rx1245_off, 0
    lt rx1245_pos, 2, rx1245_start
    sub rx1245_off, rx1245_pos, 1
    substr rx1245_tgt, rx1245_tgt, rx1245_off
  rx1245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1249_done
    goto rxscan1249_scan
  rxscan1249_loop:
    ($P10) = rx1245_cur."from"()
    inc $P10
    set rx1245_pos, $P10
    ge rx1245_pos, rx1245_eos, rxscan1249_done
  rxscan1249_scan:
    set_addr $I10, rxscan1249_loop
    rx1245_cur."!mark_push"(0, rx1245_pos, $I10)
  rxscan1249_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1250_fail
    rx1245_cur."!mark_push"(0, rx1245_pos, $I10)
  # rx literal  ","
    add $I11, rx1245_pos, 1
    gt $I11, rx1245_eos, rx1245_fail
    sub $I11, rx1245_pos, rx1245_off
    substr $S10, rx1245_tgt, $I11, 1
    ne $S10, ",", rx1245_fail
    add rx1245_pos, 1
    set_addr $I10, rxcap_1250_fail
    ($I12, $I11) = rx1245_cur."!mark_peek"($I10)
    rx1245_cur."!cursor_pos"($I11)
    ($P10) = rx1245_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1245_pos, "")
    rx1245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1250_done
  rxcap_1250_fail:
    goto rx1245_fail
  rxcap_1250_done:
  # rx subrule "O" subtype=capture negate=
    rx1245_cur."!cursor_pos"(rx1245_pos)
    $P10 = rx1245_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1245_fail
    rx1245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1245_pos = $P10."pos"()
  # rx pass
    rx1245_cur."!cursor_pass"(rx1245_pos, "infix:sym<,>")
    rx1245_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1245_pos)
    .return (rx1245_cur)
  rx1245_fail:
.annotate 'line', 433
    (rx1245_rep, rx1245_pos, $I10, $P10) = rx1245_cur."!mark_fail"(0)
    lt rx1245_pos, -1, rx1245_done
    eq rx1245_pos, -1, rx1245_fail
    jump $I10
  rx1245_done:
    rx1245_cur."!cursor_fail"()
    rx1245_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1245_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("320_1275160381.56318") :method
.annotate 'line', 433
    $P1247 = self."!PREFIX__!subrule"("O", ",")
    new $P1248, "ResizablePMCArray"
    push $P1248, $P1247
    .return ($P1248)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("321_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1252_tgt
    .local int rx1252_pos
    .local int rx1252_off
    .local int rx1252_eos
    .local int rx1252_rep
    .local pmc rx1252_cur
    (rx1252_cur, rx1252_pos, rx1252_tgt) = self."!cursor_start"()
    rx1252_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1252_cur
    .local pmc match
    .lex "$/", match
    length rx1252_eos, rx1252_tgt
    set rx1252_off, 0
    lt rx1252_pos, 2, rx1252_start
    sub rx1252_off, rx1252_pos, 1
    substr rx1252_tgt, rx1252_tgt, rx1252_off
  rx1252_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1255_done
    goto rxscan1255_scan
  rxscan1255_loop:
    ($P10) = rx1252_cur."from"()
    inc $P10
    set rx1252_pos, $P10
    ge rx1252_pos, rx1252_eos, rxscan1255_done
  rxscan1255_scan:
    set_addr $I10, rxscan1255_loop
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  rxscan1255_done:
.annotate 'line', 538
  # rx subcapture "sym"
    set_addr $I10, rxcap_1256_fail
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  # rx literal  "return"
    add $I11, rx1252_pos, 6
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    substr $S10, rx1252_tgt, $I11, 6
    ne $S10, "return", rx1252_fail
    add rx1252_pos, 6
    set_addr $I10, rxcap_1256_fail
    ($I12, $I11) = rx1252_cur."!mark_peek"($I10)
    rx1252_cur."!cursor_pos"($I11)
    ($P10) = rx1252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1252_pos, "")
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1256_done
  rxcap_1256_fail:
    goto rx1252_fail
  rxcap_1256_done:
  # rx charclass s
    ge rx1252_pos, rx1252_eos, rx1252_fail
    sub $I10, rx1252_pos, rx1252_off
    is_cclass $I11, 32, rx1252_tgt, $I10
    unless $I11, rx1252_fail
    inc rx1252_pos
  # rx subrule "O" subtype=capture negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1252_fail
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1252_pos = $P10."pos"()
  # rx pass
    rx1252_cur."!cursor_pass"(rx1252_pos, "prefix:sym<return>")
    rx1252_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1252_pos)
    .return (rx1252_cur)
  rx1252_fail:
.annotate 'line', 433
    (rx1252_rep, rx1252_pos, $I10, $P10) = rx1252_cur."!mark_fail"(0)
    lt rx1252_pos, -1, rx1252_done
    eq rx1252_pos, -1, rx1252_fail
    jump $I10
  rx1252_done:
    rx1252_cur."!cursor_fail"()
    rx1252_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("322_1275160381.56318") :method
.annotate 'line', 433
    new $P1254, "ResizablePMCArray"
    push $P1254, "return"
    .return ($P1254)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("323_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1258_tgt
    .local int rx1258_pos
    .local int rx1258_off
    .local int rx1258_eos
    .local int rx1258_rep
    .local pmc rx1258_cur
    (rx1258_cur, rx1258_pos, rx1258_tgt) = self."!cursor_start"()
    rx1258_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1258_cur
    .local pmc match
    .lex "$/", match
    length rx1258_eos, rx1258_tgt
    set rx1258_off, 0
    lt rx1258_pos, 2, rx1258_start
    sub rx1258_off, rx1258_pos, 1
    substr rx1258_tgt, rx1258_tgt, rx1258_off
  rx1258_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1261_done
    goto rxscan1261_scan
  rxscan1261_loop:
    ($P10) = rx1258_cur."from"()
    inc $P10
    set rx1258_pos, $P10
    ge rx1258_pos, rx1258_eos, rxscan1261_done
  rxscan1261_scan:
    set_addr $I10, rxscan1261_loop
    rx1258_cur."!mark_push"(0, rx1258_pos, $I10)
  rxscan1261_done:
.annotate 'line', 539
  # rx subcapture "sym"
    set_addr $I10, rxcap_1262_fail
    rx1258_cur."!mark_push"(0, rx1258_pos, $I10)
  # rx literal  "make"
    add $I11, rx1258_pos, 4
    gt $I11, rx1258_eos, rx1258_fail
    sub $I11, rx1258_pos, rx1258_off
    substr $S10, rx1258_tgt, $I11, 4
    ne $S10, "make", rx1258_fail
    add rx1258_pos, 4
    set_addr $I10, rxcap_1262_fail
    ($I12, $I11) = rx1258_cur."!mark_peek"($I10)
    rx1258_cur."!cursor_pos"($I11)
    ($P10) = rx1258_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1258_pos, "")
    rx1258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1262_done
  rxcap_1262_fail:
    goto rx1258_fail
  rxcap_1262_done:
  # rx charclass s
    ge rx1258_pos, rx1258_eos, rx1258_fail
    sub $I10, rx1258_pos, rx1258_off
    is_cclass $I11, 32, rx1258_tgt, $I10
    unless $I11, rx1258_fail
    inc rx1258_pos
  # rx subrule "O" subtype=capture negate=
    rx1258_cur."!cursor_pos"(rx1258_pos)
    $P10 = rx1258_cur."O"("%list_prefix")
    unless $P10, rx1258_fail
    rx1258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1258_pos = $P10."pos"()
  # rx pass
    rx1258_cur."!cursor_pass"(rx1258_pos, "prefix:sym<make>")
    rx1258_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1258_pos)
    .return (rx1258_cur)
  rx1258_fail:
.annotate 'line', 433
    (rx1258_rep, rx1258_pos, $I10, $P10) = rx1258_cur."!mark_fail"(0)
    lt rx1258_pos, -1, rx1258_done
    eq rx1258_pos, -1, rx1258_fail
    jump $I10
  rx1258_done:
    rx1258_cur."!cursor_fail"()
    rx1258_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1258_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("324_1275160381.56318") :method
.annotate 'line', 433
    new $P1260, "ResizablePMCArray"
    push $P1260, "make"
    .return ($P1260)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("325_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1264_tgt
    .local int rx1264_pos
    .local int rx1264_off
    .local int rx1264_eos
    .local int rx1264_rep
    .local pmc rx1264_cur
    (rx1264_cur, rx1264_pos, rx1264_tgt) = self."!cursor_start"()
    rx1264_cur."!cursor_debug"("START ", "term:sym<last>")
    .lex unicode:"$\x{a2}", rx1264_cur
    .local pmc match
    .lex "$/", match
    length rx1264_eos, rx1264_tgt
    set rx1264_off, 0
    lt rx1264_pos, 2, rx1264_start
    sub rx1264_off, rx1264_pos, 1
    substr rx1264_tgt, rx1264_tgt, rx1264_off
  rx1264_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1267_done
    goto rxscan1267_scan
  rxscan1267_loop:
    ($P10) = rx1264_cur."from"()
    inc $P10
    set rx1264_pos, $P10
    ge rx1264_pos, rx1264_eos, rxscan1267_done
  rxscan1267_scan:
    set_addr $I10, rxscan1267_loop
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  rxscan1267_done:
.annotate 'line', 540
  # rx subcapture "sym"
    set_addr $I10, rxcap_1268_fail
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  # rx literal  "last"
    add $I11, rx1264_pos, 4
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 4
    ne $S10, "last", rx1264_fail
    add rx1264_pos, 4
    set_addr $I10, rxcap_1268_fail
    ($I12, $I11) = rx1264_cur."!mark_peek"($I10)
    rx1264_cur."!cursor_pos"($I11)
    ($P10) = rx1264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1264_pos, "")
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1268_done
  rxcap_1268_fail:
    goto rx1264_fail
  rxcap_1268_done:
  # rx pass
    rx1264_cur."!cursor_pass"(rx1264_pos, "term:sym<last>")
    rx1264_cur."!cursor_debug"("PASS  ", "term:sym<last>", " at pos=", rx1264_pos)
    .return (rx1264_cur)
  rx1264_fail:
.annotate 'line', 433
    (rx1264_rep, rx1264_pos, $I10, $P10) = rx1264_cur."!mark_fail"(0)
    lt rx1264_pos, -1, rx1264_done
    eq rx1264_pos, -1, rx1264_fail
    jump $I10
  rx1264_done:
    rx1264_cur."!cursor_fail"()
    rx1264_cur."!cursor_debug"("FAIL  ", "term:sym<last>")
    .return (rx1264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("326_1275160381.56318") :method
.annotate 'line', 433
    new $P1266, "ResizablePMCArray"
    push $P1266, "last"
    .return ($P1266)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("327_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1270_tgt
    .local int rx1270_pos
    .local int rx1270_off
    .local int rx1270_eos
    .local int rx1270_rep
    .local pmc rx1270_cur
    (rx1270_cur, rx1270_pos, rx1270_tgt) = self."!cursor_start"()
    rx1270_cur."!cursor_debug"("START ", "term:sym<next>")
    .lex unicode:"$\x{a2}", rx1270_cur
    .local pmc match
    .lex "$/", match
    length rx1270_eos, rx1270_tgt
    set rx1270_off, 0
    lt rx1270_pos, 2, rx1270_start
    sub rx1270_off, rx1270_pos, 1
    substr rx1270_tgt, rx1270_tgt, rx1270_off
  rx1270_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1273_done
    goto rxscan1273_scan
  rxscan1273_loop:
    ($P10) = rx1270_cur."from"()
    inc $P10
    set rx1270_pos, $P10
    ge rx1270_pos, rx1270_eos, rxscan1273_done
  rxscan1273_scan:
    set_addr $I10, rxscan1273_loop
    rx1270_cur."!mark_push"(0, rx1270_pos, $I10)
  rxscan1273_done:
.annotate 'line', 541
  # rx subcapture "sym"
    set_addr $I10, rxcap_1274_fail
    rx1270_cur."!mark_push"(0, rx1270_pos, $I10)
  # rx literal  "next"
    add $I11, rx1270_pos, 4
    gt $I11, rx1270_eos, rx1270_fail
    sub $I11, rx1270_pos, rx1270_off
    substr $S10, rx1270_tgt, $I11, 4
    ne $S10, "next", rx1270_fail
    add rx1270_pos, 4
    set_addr $I10, rxcap_1274_fail
    ($I12, $I11) = rx1270_cur."!mark_peek"($I10)
    rx1270_cur."!cursor_pos"($I11)
    ($P10) = rx1270_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1270_pos, "")
    rx1270_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1274_done
  rxcap_1274_fail:
    goto rx1270_fail
  rxcap_1274_done:
  # rx pass
    rx1270_cur."!cursor_pass"(rx1270_pos, "term:sym<next>")
    rx1270_cur."!cursor_debug"("PASS  ", "term:sym<next>", " at pos=", rx1270_pos)
    .return (rx1270_cur)
  rx1270_fail:
.annotate 'line', 433
    (rx1270_rep, rx1270_pos, $I10, $P10) = rx1270_cur."!mark_fail"(0)
    lt rx1270_pos, -1, rx1270_done
    eq rx1270_pos, -1, rx1270_fail
    jump $I10
  rx1270_done:
    rx1270_cur."!cursor_fail"()
    rx1270_cur."!cursor_debug"("FAIL  ", "term:sym<next>")
    .return (rx1270_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("328_1275160381.56318") :method
.annotate 'line', 433
    new $P1272, "ResizablePMCArray"
    push $P1272, "next"
    .return ($P1272)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("329_1275160381.56318") :method :outer("11_1275160381.56318")
.annotate 'line', 433
    .local string rx1276_tgt
    .local int rx1276_pos
    .local int rx1276_off
    .local int rx1276_eos
    .local int rx1276_rep
    .local pmc rx1276_cur
    (rx1276_cur, rx1276_pos, rx1276_tgt) = self."!cursor_start"()
    rx1276_cur."!cursor_debug"("START ", "term:sym<redo>")
    .lex unicode:"$\x{a2}", rx1276_cur
    .local pmc match
    .lex "$/", match
    length rx1276_eos, rx1276_tgt
    set rx1276_off, 0
    lt rx1276_pos, 2, rx1276_start
    sub rx1276_off, rx1276_pos, 1
    substr rx1276_tgt, rx1276_tgt, rx1276_off
  rx1276_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1279_done
    goto rxscan1279_scan
  rxscan1279_loop:
    ($P10) = rx1276_cur."from"()
    inc $P10
    set rx1276_pos, $P10
    ge rx1276_pos, rx1276_eos, rxscan1279_done
  rxscan1279_scan:
    set_addr $I10, rxscan1279_loop
    rx1276_cur."!mark_push"(0, rx1276_pos, $I10)
  rxscan1279_done:
.annotate 'line', 542
  # rx subcapture "sym"
    set_addr $I10, rxcap_1280_fail
    rx1276_cur."!mark_push"(0, rx1276_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1276_pos, 4
    gt $I11, rx1276_eos, rx1276_fail
    sub $I11, rx1276_pos, rx1276_off
    substr $S10, rx1276_tgt, $I11, 4
    ne $S10, "redo", rx1276_fail
    add rx1276_pos, 4
    set_addr $I10, rxcap_1280_fail
    ($I12, $I11) = rx1276_cur."!mark_peek"($I10)
    rx1276_cur."!cursor_pos"($I11)
    ($P10) = rx1276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1276_pos, "")
    rx1276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1280_done
  rxcap_1280_fail:
    goto rx1276_fail
  rxcap_1280_done:
  # rx pass
    rx1276_cur."!cursor_pass"(rx1276_pos, "term:sym<redo>")
    rx1276_cur."!cursor_debug"("PASS  ", "term:sym<redo>", " at pos=", rx1276_pos)
    .return (rx1276_cur)
  rx1276_fail:
.annotate 'line', 433
    (rx1276_rep, rx1276_pos, $I10, $P10) = rx1276_cur."!mark_fail"(0)
    lt rx1276_pos, -1, rx1276_done
    eq rx1276_pos, -1, rx1276_fail
    jump $I10
  rx1276_done:
    rx1276_cur."!cursor_fail"()
    rx1276_cur."!cursor_debug"("FAIL  ", "term:sym<redo>")
    .return (rx1276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("330_1275160381.56318") :method
.annotate 'line', 433
    new $P1278, "ResizablePMCArray"
    push $P1278, "redo"
    .return ($P1278)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("331_1275160381.56318") :method :outer("11_1275160381.56318")
    .param pmc param_1284
.annotate 'line', 544
    new $P1283, 'ExceptionHandler'
    set_addr $P1283, control_1282
    $P1283."handle_types"(57)
    push_eh $P1283
    .lex "self", self
    .lex "$/", param_1284
.annotate 'line', 546
    new $P1285, "Undef"
    .lex "$t", $P1285
    find_lex $P1286, "$/"
    unless_null $P1286, vivify_367
    $P1286 = root_new ['parrot';'ResizablePMCArray']
  vivify_367:
    set $P1287, $P1286[0]
    unless_null $P1287, vivify_368
    new $P1287, "Undef"
  vivify_368:
    store_lex "$t", $P1287
    find_lex $P1288, "$/"
    unless_null $P1288, vivify_369
    $P1288 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P1289, $P1288[1]
    unless_null $P1289, vivify_370
    new $P1289, "Undef"
  vivify_370:
    find_lex $P1290, "$/"
    unless_null $P1290, vivify_371
    $P1290 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1290
  vivify_371:
    set $P1290[0], $P1289
    find_lex $P1291, "$t"
    find_lex $P1292, "$/"
    unless_null $P1292, vivify_372
    $P1292 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1292
  vivify_372:
    set $P1292[1], $P1291
.annotate 'line', 544
    .return ($P1291)
  control_1282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1293, exception, "payload"
    .return ($P1293)
.end


.namespace ["NQP";"Regex"]
.sub "_block1294"  :subid("332_1275160381.56318") :outer("11_1275160381.56318")
.annotate 'line', 550
    .const 'Sub' $P1352 = "351_1275160381.56318" 
    capture_lex $P1352
    .const 'Sub' $P1347 = "349_1275160381.56318" 
    capture_lex $P1347
    .const 'Sub' $P1334 = "346_1275160381.56318" 
    capture_lex $P1334
    .const 'Sub' $P1324 = "343_1275160381.56318" 
    capture_lex $P1324
    .const 'Sub' $P1319 = "341_1275160381.56318" 
    capture_lex $P1319
    .const 'Sub' $P1310 = "338_1275160381.56318" 
    capture_lex $P1310
    .const 'Sub' $P1305 = "336_1275160381.56318" 
    capture_lex $P1305
    .const 'Sub' $P1296 = "333_1275160381.56318" 
    capture_lex $P1296
    .const 'Sub' $P1352 = "351_1275160381.56318" 
    capture_lex $P1352
    .return ($P1352)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("333_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .const 'Sub' $P1302 = "335_1275160381.56318" 
    capture_lex $P1302
    .local string rx1297_tgt
    .local int rx1297_pos
    .local int rx1297_off
    .local int rx1297_eos
    .local int rx1297_rep
    .local pmc rx1297_cur
    (rx1297_cur, rx1297_pos, rx1297_tgt) = self."!cursor_start"()
    rx1297_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1297_cur
    .local pmc match
    .lex "$/", match
    length rx1297_eos, rx1297_tgt
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
.annotate 'line', 552
  # rx literal  ":"
    add $I11, rx1297_pos, 1
    gt $I11, rx1297_eos, rx1297_fail
    sub $I11, rx1297_pos, rx1297_off
    substr $S10, rx1297_tgt, $I11, 1
    ne $S10, ":", rx1297_fail
    add rx1297_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1297_cur."!cursor_pos"(rx1297_pos)
    .const 'Sub' $P1302 = "335_1275160381.56318" 
    capture_lex $P1302
    $P10 = rx1297_cur."before"($P1302)
    unless $P10, rx1297_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1297_cur."!cursor_pos"(rx1297_pos)
    $P10 = rx1297_cur."LANG"("MAIN", "statement")
    unless $P10, rx1297_fail
    rx1297_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1297_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1297_cur."!cursor_pos"(rx1297_pos)
    $P10 = rx1297_cur."ws"()
    unless $P10, rx1297_fail
    rx1297_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1297_pos, 1
    gt $I11, rx1297_eos, rx1297_fail
    sub $I11, rx1297_pos, rx1297_off
    substr $S10, rx1297_tgt, $I11, 1
    ne $S10, ";", rx1297_fail
    add rx1297_pos, 1
.annotate 'line', 551
  # rx pass
    rx1297_cur."!cursor_pass"(rx1297_pos, "metachar:sym<:my>")
    rx1297_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1297_pos)
    .return (rx1297_cur)
  rx1297_fail:
.annotate 'line', 550
    (rx1297_rep, rx1297_pos, $I10, $P10) = rx1297_cur."!mark_fail"(0)
    lt rx1297_pos, -1, rx1297_done
    eq rx1297_pos, -1, rx1297_fail
    jump $I10
  rx1297_done:
    rx1297_cur."!cursor_fail"()
    rx1297_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1297_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("334_1275160381.56318") :method
.annotate 'line', 550
    new $P1299, "ResizablePMCArray"
    push $P1299, ":"
    .return ($P1299)
.end


.namespace ["NQP";"Regex"]
.sub "_block1301"  :anon :subid("335_1275160381.56318") :method :outer("333_1275160381.56318")
.annotate 'line', 552
    .local string rx1303_tgt
    .local int rx1303_pos
    .local int rx1303_off
    .local int rx1303_eos
    .local int rx1303_rep
    .local pmc rx1303_cur
    (rx1303_cur, rx1303_pos, rx1303_tgt) = self."!cursor_start"()
    rx1303_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1303_cur
    .local pmc match
    .lex "$/", match
    length rx1303_eos, rx1303_tgt
    set rx1303_off, 0
    lt rx1303_pos, 2, rx1303_start
    sub rx1303_off, rx1303_pos, 1
    substr rx1303_tgt, rx1303_tgt, rx1303_off
  rx1303_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1304_done
    goto rxscan1304_scan
  rxscan1304_loop:
    ($P10) = rx1303_cur."from"()
    inc $P10
    set rx1303_pos, $P10
    ge rx1303_pos, rx1303_eos, rxscan1304_done
  rxscan1304_scan:
    set_addr $I10, rxscan1304_loop
    rx1303_cur."!mark_push"(0, rx1303_pos, $I10)
  rxscan1304_done:
  # rx literal  "my"
    add $I11, rx1303_pos, 2
    gt $I11, rx1303_eos, rx1303_fail
    sub $I11, rx1303_pos, rx1303_off
    substr $S10, rx1303_tgt, $I11, 2
    ne $S10, "my", rx1303_fail
    add rx1303_pos, 2
  # rx pass
    rx1303_cur."!cursor_pass"(rx1303_pos, "")
    rx1303_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1303_pos)
    .return (rx1303_cur)
  rx1303_fail:
    (rx1303_rep, rx1303_pos, $I10, $P10) = rx1303_cur."!mark_fail"(0)
    lt rx1303_pos, -1, rx1303_done
    eq rx1303_pos, -1, rx1303_fail
    jump $I10
  rx1303_done:
    rx1303_cur."!cursor_fail"()
    rx1303_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1303_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("336_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .local string rx1306_tgt
    .local int rx1306_pos
    .local int rx1306_off
    .local int rx1306_eos
    .local int rx1306_rep
    .local pmc rx1306_cur
    (rx1306_cur, rx1306_pos, rx1306_tgt) = self."!cursor_start"()
    rx1306_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1306_cur
    .local pmc match
    .lex "$/", match
    length rx1306_eos, rx1306_tgt
    set rx1306_off, 0
    lt rx1306_pos, 2, rx1306_start
    sub rx1306_off, rx1306_pos, 1
    substr rx1306_tgt, rx1306_tgt, rx1306_off
  rx1306_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1309_done
    goto rxscan1309_scan
  rxscan1309_loop:
    ($P10) = rx1306_cur."from"()
    inc $P10
    set rx1306_pos, $P10
    ge rx1306_pos, rx1306_eos, rxscan1309_done
  rxscan1309_scan:
    set_addr $I10, rxscan1309_loop
    rx1306_cur."!mark_push"(0, rx1306_pos, $I10)
  rxscan1309_done:
.annotate 'line', 556
  # rx enumcharlist negate=0 zerowidth
    ge rx1306_pos, rx1306_eos, rx1306_fail
    sub $I10, rx1306_pos, rx1306_off
    substr $S10, rx1306_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1306_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1306_cur."!cursor_pos"(rx1306_pos)
    $P10 = rx1306_cur."codeblock"()
    unless $P10, rx1306_fail
    rx1306_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1306_pos = $P10."pos"()
.annotate 'line', 555
  # rx pass
    rx1306_cur."!cursor_pass"(rx1306_pos, "metachar:sym<{ }>")
    rx1306_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1306_pos)
    .return (rx1306_cur)
  rx1306_fail:
.annotate 'line', 550
    (rx1306_rep, rx1306_pos, $I10, $P10) = rx1306_cur."!mark_fail"(0)
    lt rx1306_pos, -1, rx1306_done
    eq rx1306_pos, -1, rx1306_fail
    jump $I10
  rx1306_done:
    rx1306_cur."!cursor_fail"()
    rx1306_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1306_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("337_1275160381.56318") :method
.annotate 'line', 550
    new $P1308, "ResizablePMCArray"
    push $P1308, "{"
    .return ($P1308)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("338_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .const 'Sub' $P1316 = "340_1275160381.56318" 
    capture_lex $P1316
    .local string rx1311_tgt
    .local int rx1311_pos
    .local int rx1311_off
    .local int rx1311_eos
    .local int rx1311_rep
    .local pmc rx1311_cur
    (rx1311_cur, rx1311_pos, rx1311_tgt) = self."!cursor_start"()
    rx1311_cur."!cursor_debug"("START ", "metachar:sym<nqpvar>")
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
.annotate 'line', 560
  # rx enumcharlist negate=0 zerowidth
    ge rx1311_pos, rx1311_eos, rx1311_fail
    sub $I10, rx1311_pos, rx1311_off
    substr $S10, rx1311_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1311_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    .const 'Sub' $P1316 = "340_1275160381.56318" 
    capture_lex $P1316
    $P10 = rx1311_cur."before"($P1316)
    unless $P10, rx1311_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."LANG"("MAIN", "variable")
    unless $P10, rx1311_fail
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1311_pos = $P10."pos"()
.annotate 'line', 559
  # rx pass
    rx1311_cur."!cursor_pass"(rx1311_pos, "metachar:sym<nqpvar>")
    rx1311_cur."!cursor_debug"("PASS  ", "metachar:sym<nqpvar>", " at pos=", rx1311_pos)
    .return (rx1311_cur)
  rx1311_fail:
.annotate 'line', 550
    (rx1311_rep, rx1311_pos, $I10, $P10) = rx1311_cur."!mark_fail"(0)
    lt rx1311_pos, -1, rx1311_done
    eq rx1311_pos, -1, rx1311_fail
    jump $I10
  rx1311_done:
    rx1311_cur."!cursor_fail"()
    rx1311_cur."!cursor_debug"("FAIL  ", "metachar:sym<nqpvar>")
    .return (rx1311_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("339_1275160381.56318") :method
.annotate 'line', 550
    new $P1313, "ResizablePMCArray"
    push $P1313, "$"
    push $P1313, "@"
    .return ($P1313)
.end


.namespace ["NQP";"Regex"]
.sub "_block1315"  :anon :subid("340_1275160381.56318") :method :outer("338_1275160381.56318")
.annotate 'line', 560
    .local string rx1317_tgt
    .local int rx1317_pos
    .local int rx1317_off
    .local int rx1317_eos
    .local int rx1317_rep
    .local pmc rx1317_cur
    (rx1317_cur, rx1317_pos, rx1317_tgt) = self."!cursor_start"()
    rx1317_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1317_cur
    .local pmc match
    .lex "$/", match
    length rx1317_eos, rx1317_tgt
    set rx1317_off, 0
    lt rx1317_pos, 2, rx1317_start
    sub rx1317_off, rx1317_pos, 1
    substr rx1317_tgt, rx1317_tgt, rx1317_off
  rx1317_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1318_done
    goto rxscan1318_scan
  rxscan1318_loop:
    ($P10) = rx1317_cur."from"()
    inc $P10
    set rx1317_pos, $P10
    ge rx1317_pos, rx1317_eos, rxscan1318_done
  rxscan1318_scan:
    set_addr $I10, rxscan1318_loop
    rx1317_cur."!mark_push"(0, rx1317_pos, $I10)
  rxscan1318_done:
  # rx charclass .
    ge rx1317_pos, rx1317_eos, rx1317_fail
    inc rx1317_pos
  # rx charclass w
    ge rx1317_pos, rx1317_eos, rx1317_fail
    sub $I10, rx1317_pos, rx1317_off
    is_cclass $I11, 8192, rx1317_tgt, $I10
    unless $I11, rx1317_fail
    inc rx1317_pos
  # rx pass
    rx1317_cur."!cursor_pass"(rx1317_pos, "")
    rx1317_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1317_pos)
    .return (rx1317_cur)
  rx1317_fail:
    (rx1317_rep, rx1317_pos, $I10, $P10) = rx1317_cur."!mark_fail"(0)
    lt rx1317_pos, -1, rx1317_done
    eq rx1317_pos, -1, rx1317_fail
    jump $I10
  rx1317_done:
    rx1317_cur."!cursor_fail"()
    rx1317_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1317_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("341_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .local string rx1320_tgt
    .local int rx1320_pos
    .local int rx1320_off
    .local int rx1320_eos
    .local int rx1320_rep
    .local pmc rx1320_cur
    (rx1320_cur, rx1320_pos, rx1320_tgt) = self."!cursor_start"()
    rx1320_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1320_cur
    .local pmc match
    .lex "$/", match
    length rx1320_eos, rx1320_tgt
    set rx1320_off, 0
    lt rx1320_pos, 2, rx1320_start
    sub rx1320_off, rx1320_pos, 1
    substr rx1320_tgt, rx1320_tgt, rx1320_off
  rx1320_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1323_done
    goto rxscan1323_scan
  rxscan1323_loop:
    ($P10) = rx1320_cur."from"()
    inc $P10
    set rx1320_pos, $P10
    ge rx1320_pos, rx1320_eos, rxscan1323_done
  rxscan1323_scan:
    set_addr $I10, rxscan1323_loop
    rx1320_cur."!mark_push"(0, rx1320_pos, $I10)
  rxscan1323_done:
.annotate 'line', 564
  # rx enumcharlist negate=0 zerowidth
    ge rx1320_pos, rx1320_eos, rx1320_fail
    sub $I10, rx1320_pos, rx1320_off
    substr $S10, rx1320_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1320_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1320_cur."!cursor_pos"(rx1320_pos)
    $P10 = rx1320_cur."codeblock"()
    unless $P10, rx1320_fail
    rx1320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1320_pos = $P10."pos"()
.annotate 'line', 563
  # rx pass
    rx1320_cur."!cursor_pass"(rx1320_pos, "assertion:sym<{ }>")
    rx1320_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1320_pos)
    .return (rx1320_cur)
  rx1320_fail:
.annotate 'line', 550
    (rx1320_rep, rx1320_pos, $I10, $P10) = rx1320_cur."!mark_fail"(0)
    lt rx1320_pos, -1, rx1320_done
    eq rx1320_pos, -1, rx1320_fail
    jump $I10
  rx1320_done:
    rx1320_cur."!cursor_fail"()
    rx1320_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1320_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("342_1275160381.56318") :method
.annotate 'line', 550
    new $P1322, "ResizablePMCArray"
    push $P1322, "{"
    .return ($P1322)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("343_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .const 'Sub' $P1330 = "345_1275160381.56318" 
    capture_lex $P1330
    .local string rx1325_tgt
    .local int rx1325_pos
    .local int rx1325_off
    .local int rx1325_eos
    .local int rx1325_rep
    .local pmc rx1325_cur
    (rx1325_cur, rx1325_pos, rx1325_tgt) = self."!cursor_start"()
    rx1325_cur."!cursor_debug"("START ", "assertion:sym<?{ }>")
    .lex unicode:"$\x{a2}", rx1325_cur
    .local pmc match
    .lex "$/", match
    length rx1325_eos, rx1325_tgt
    set rx1325_off, 0
    lt rx1325_pos, 2, rx1325_start
    sub rx1325_off, rx1325_pos, 1
    substr rx1325_tgt, rx1325_tgt, rx1325_off
  rx1325_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1328_done
    goto rxscan1328_scan
  rxscan1328_loop:
    ($P10) = rx1325_cur."from"()
    inc $P10
    set rx1325_pos, $P10
    ge rx1325_pos, rx1325_eos, rxscan1328_done
  rxscan1328_scan:
    set_addr $I10, rxscan1328_loop
    rx1325_cur."!mark_push"(0, rx1325_pos, $I10)
  rxscan1328_done:
.annotate 'line', 568
  # rx subcapture "zw"
    set_addr $I10, rxcap_1333_fail
    rx1325_cur."!mark_push"(0, rx1325_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1325_pos, rx1325_eos, rx1325_fail
    sub $I10, rx1325_pos, rx1325_off
    substr $S10, rx1325_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1325_fail
    inc rx1325_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1325_cur."!cursor_pos"(rx1325_pos)
    .const 'Sub' $P1330 = "345_1275160381.56318" 
    capture_lex $P1330
    $P10 = rx1325_cur."before"($P1330)
    unless $P10, rx1325_fail
    set_addr $I10, rxcap_1333_fail
    ($I12, $I11) = rx1325_cur."!mark_peek"($I10)
    rx1325_cur."!cursor_pos"($I11)
    ($P10) = rx1325_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1325_pos, "")
    rx1325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1333_done
  rxcap_1333_fail:
    goto rx1325_fail
  rxcap_1333_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1325_cur."!cursor_pos"(rx1325_pos)
    $P10 = rx1325_cur."codeblock"()
    unless $P10, rx1325_fail
    rx1325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1325_pos = $P10."pos"()
.annotate 'line', 567
  # rx pass
    rx1325_cur."!cursor_pass"(rx1325_pos, "assertion:sym<?{ }>")
    rx1325_cur."!cursor_debug"("PASS  ", "assertion:sym<?{ }>", " at pos=", rx1325_pos)
    .return (rx1325_cur)
  rx1325_fail:
.annotate 'line', 550
    (rx1325_rep, rx1325_pos, $I10, $P10) = rx1325_cur."!mark_fail"(0)
    lt rx1325_pos, -1, rx1325_done
    eq rx1325_pos, -1, rx1325_fail
    jump $I10
  rx1325_done:
    rx1325_cur."!cursor_fail"()
    rx1325_cur."!cursor_debug"("FAIL  ", "assertion:sym<?{ }>")
    .return (rx1325_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("344_1275160381.56318") :method
.annotate 'line', 550
    new $P1327, "ResizablePMCArray"
    push $P1327, "!"
    push $P1327, "?"
    .return ($P1327)
.end


.namespace ["NQP";"Regex"]
.sub "_block1329"  :anon :subid("345_1275160381.56318") :method :outer("343_1275160381.56318")
.annotate 'line', 568
    .local string rx1331_tgt
    .local int rx1331_pos
    .local int rx1331_off
    .local int rx1331_eos
    .local int rx1331_rep
    .local pmc rx1331_cur
    (rx1331_cur, rx1331_pos, rx1331_tgt) = self."!cursor_start"()
    rx1331_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1332_done
    goto rxscan1332_scan
  rxscan1332_loop:
    ($P10) = rx1331_cur."from"()
    inc $P10
    set rx1331_pos, $P10
    ge rx1331_pos, rx1331_eos, rxscan1332_done
  rxscan1332_scan:
    set_addr $I10, rxscan1332_loop
    rx1331_cur."!mark_push"(0, rx1331_pos, $I10)
  rxscan1332_done:
  # rx literal  "{"
    add $I11, rx1331_pos, 1
    gt $I11, rx1331_eos, rx1331_fail
    sub $I11, rx1331_pos, rx1331_off
    substr $S10, rx1331_tgt, $I11, 1
    ne $S10, "{", rx1331_fail
    add rx1331_pos, 1
  # rx pass
    rx1331_cur."!cursor_pass"(rx1331_pos, "")
    rx1331_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1331_pos)
    .return (rx1331_cur)
  rx1331_fail:
    (rx1331_rep, rx1331_pos, $I10, $P10) = rx1331_cur."!mark_fail"(0)
    lt rx1331_pos, -1, rx1331_done
    eq rx1331_pos, -1, rx1331_fail
    jump $I10
  rx1331_done:
    rx1331_cur."!cursor_fail"()
    rx1331_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1331_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("346_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .const 'Sub' $P1343 = "348_1275160381.56318" 
    capture_lex $P1343
    .local string rx1335_tgt
    .local int rx1335_pos
    .local int rx1335_off
    .local int rx1335_eos
    .local int rx1335_rep
    .local pmc rx1335_cur
    (rx1335_cur, rx1335_pos, rx1335_tgt) = self."!cursor_start"()
    rx1335_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1335_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1335_cur
    .local pmc match
    .lex "$/", match
    length rx1335_eos, rx1335_tgt
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
.annotate 'line', 572
  # rx subcapture "longname"
    set_addr $I10, rxcap_1339_fail
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1335_pos, rx1335_off
    find_not_cclass $I11, 8192, rx1335_tgt, $I10, rx1335_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1335_fail
    add rx1335_pos, rx1335_off, $I11
    set_addr $I10, rxcap_1339_fail
    ($I12, $I11) = rx1335_cur."!mark_peek"($I10)
    rx1335_cur."!cursor_pos"($I11)
    ($P10) = rx1335_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1335_pos, "")
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1339_done
  rxcap_1339_fail:
    goto rx1335_fail
  rxcap_1339_done:
.annotate 'line', 579
  # rx rxquantr1340 ** 0..1
    set_addr $I1346, rxquantr1340_done
    rx1335_cur."!mark_push"(0, rx1335_pos, $I1346)
  rxquantr1340_loop:
  alt1341_0:
.annotate 'line', 573
    set_addr $I10, alt1341_1
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
.annotate 'line', 574
  # rx subrule "before" subtype=zerowidth negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    .const 'Sub' $P1343 = "348_1275160381.56318" 
    capture_lex $P1343
    $P10 = rx1335_cur."before"($P1343)
    unless $P10, rx1335_fail
    goto alt1341_end
  alt1341_1:
    set_addr $I10, alt1341_2
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
.annotate 'line', 575
  # rx literal  "="
    add $I11, rx1335_pos, 1
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I11, 1
    ne $S10, "=", rx1335_fail
    add rx1335_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."assertion"()
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1335_pos = $P10."pos"()
    goto alt1341_end
  alt1341_2:
    set_addr $I10, alt1341_3
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
.annotate 'line', 576
  # rx literal  ":"
    add $I11, rx1335_pos, 1
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I11, 1
    ne $S10, ":", rx1335_fail
    add rx1335_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."arglist"()
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1335_pos = $P10."pos"()
    goto alt1341_end
  alt1341_3:
    set_addr $I10, alt1341_4
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
.annotate 'line', 577
  # rx literal  "("
    add $I11, rx1335_pos, 1
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I11, 1
    ne $S10, "(", rx1335_fail
    add rx1335_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1335_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1335_pos, 1
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    substr $S10, rx1335_tgt, $I11, 1
    ne $S10, ")", rx1335_fail
    add rx1335_pos, 1
    goto alt1341_end
  alt1341_4:
.annotate 'line', 578
  # rx subrule "normspace" subtype=method negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."normspace"()
    unless $P10, rx1335_fail
    rx1335_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."nibbler"()
    unless $P10, rx1335_fail
    rx1335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1335_pos = $P10."pos"()
  alt1341_end:
.annotate 'line', 579
    (rx1335_rep) = rx1335_cur."!mark_commit"($I1346)
  rxquantr1340_done:
.annotate 'line', 571
  # rx pass
    rx1335_cur."!cursor_pass"(rx1335_pos, "assertion:sym<name>")
    rx1335_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1335_pos)
    .return (rx1335_cur)
  rx1335_fail:
.annotate 'line', 550
    (rx1335_rep, rx1335_pos, $I10, $P10) = rx1335_cur."!mark_fail"(0)
    lt rx1335_pos, -1, rx1335_done
    eq rx1335_pos, -1, rx1335_fail
    jump $I10
  rx1335_done:
    rx1335_cur."!cursor_fail"()
    rx1335_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1335_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("347_1275160381.56318") :method
.annotate 'line', 550
    new $P1337, "ResizablePMCArray"
    push $P1337, ""
    .return ($P1337)
.end


.namespace ["NQP";"Regex"]
.sub "_block1342"  :anon :subid("348_1275160381.56318") :method :outer("346_1275160381.56318")
.annotate 'line', 574
    .local string rx1344_tgt
    .local int rx1344_pos
    .local int rx1344_off
    .local int rx1344_eos
    .local int rx1344_rep
    .local pmc rx1344_cur
    (rx1344_cur, rx1344_pos, rx1344_tgt) = self."!cursor_start"()
    rx1344_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1344_cur
    .local pmc match
    .lex "$/", match
    length rx1344_eos, rx1344_tgt
    set rx1344_off, 0
    lt rx1344_pos, 2, rx1344_start
    sub rx1344_off, rx1344_pos, 1
    substr rx1344_tgt, rx1344_tgt, rx1344_off
  rx1344_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1345_done
    goto rxscan1345_scan
  rxscan1345_loop:
    ($P10) = rx1344_cur."from"()
    inc $P10
    set rx1344_pos, $P10
    ge rx1344_pos, rx1344_eos, rxscan1345_done
  rxscan1345_scan:
    set_addr $I10, rxscan1345_loop
    rx1344_cur."!mark_push"(0, rx1344_pos, $I10)
  rxscan1345_done:
  # rx literal  ">"
    add $I11, rx1344_pos, 1
    gt $I11, rx1344_eos, rx1344_fail
    sub $I11, rx1344_pos, rx1344_off
    substr $S10, rx1344_tgt, $I11, 1
    ne $S10, ">", rx1344_fail
    add rx1344_pos, 1
  # rx pass
    rx1344_cur."!cursor_pass"(rx1344_pos, "")
    rx1344_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1344_pos)
    .return (rx1344_cur)
  rx1344_fail:
    (rx1344_rep, rx1344_pos, $I10, $P10) = rx1344_cur."!mark_fail"(0)
    lt rx1344_pos, -1, rx1344_done
    eq rx1344_pos, -1, rx1344_fail
    jump $I10
  rx1344_done:
    rx1344_cur."!cursor_fail"()
    rx1344_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1344_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("349_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .local string rx1348_tgt
    .local int rx1348_pos
    .local int rx1348_off
    .local int rx1348_eos
    .local int rx1348_rep
    .local pmc rx1348_cur
    (rx1348_cur, rx1348_pos, rx1348_tgt) = self."!cursor_start"()
    rx1348_cur."!cursor_debug"("START ", "assertion:sym<var>")
    .lex unicode:"$\x{a2}", rx1348_cur
    .local pmc match
    .lex "$/", match
    length rx1348_eos, rx1348_tgt
    set rx1348_off, 0
    lt rx1348_pos, 2, rx1348_start
    sub rx1348_off, rx1348_pos, 1
    substr rx1348_tgt, rx1348_tgt, rx1348_off
  rx1348_start:
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
.annotate 'line', 583
  # rx enumcharlist negate=0 zerowidth
    ge rx1348_pos, rx1348_eos, rx1348_fail
    sub $I10, rx1348_pos, rx1348_off
    substr $S10, rx1348_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1348_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1348_cur."!cursor_pos"(rx1348_pos)
    $P10 = rx1348_cur."LANG"("MAIN", "variable")
    unless $P10, rx1348_fail
    rx1348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1348_pos = $P10."pos"()
.annotate 'line', 582
  # rx pass
    rx1348_cur."!cursor_pass"(rx1348_pos, "assertion:sym<var>")
    rx1348_cur."!cursor_debug"("PASS  ", "assertion:sym<var>", " at pos=", rx1348_pos)
    .return (rx1348_cur)
  rx1348_fail:
.annotate 'line', 550
    (rx1348_rep, rx1348_pos, $I10, $P10) = rx1348_cur."!mark_fail"(0)
    lt rx1348_pos, -1, rx1348_done
    eq rx1348_pos, -1, rx1348_fail
    jump $I10
  rx1348_done:
    rx1348_cur."!cursor_fail"()
    rx1348_cur."!cursor_debug"("FAIL  ", "assertion:sym<var>")
    .return (rx1348_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("350_1275160381.56318") :method
.annotate 'line', 550
    new $P1350, "ResizablePMCArray"
    push $P1350, "$"
    push $P1350, "@"
    .return ($P1350)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("351_1275160381.56318") :method :outer("332_1275160381.56318")
.annotate 'line', 550
    .local string rx1353_tgt
    .local int rx1353_pos
    .local int rx1353_off
    .local int rx1353_eos
    .local int rx1353_rep
    .local pmc rx1353_cur
    (rx1353_cur, rx1353_pos, rx1353_tgt) = self."!cursor_start"()
    rx1353_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1353_cur
    .local pmc match
    .lex "$/", match
    length rx1353_eos, rx1353_tgt
    set rx1353_off, 0
    lt rx1353_pos, 2, rx1353_start
    sub rx1353_off, rx1353_pos, 1
    substr rx1353_tgt, rx1353_tgt, rx1353_off
  rx1353_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1357_done
    goto rxscan1357_scan
  rxscan1357_loop:
    ($P10) = rx1353_cur."from"()
    inc $P10
    set rx1353_pos, $P10
    ge rx1353_pos, rx1353_eos, rxscan1357_done
  rxscan1357_scan:
    set_addr $I10, rxscan1357_loop
    rx1353_cur."!mark_push"(0, rx1353_pos, $I10)
  rxscan1357_done:
.annotate 'line', 587
  # rx subrule "LANG" subtype=capture negate=
    rx1353_cur."!cursor_pos"(rx1353_pos)
    $P10 = rx1353_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1353_fail
    rx1353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1353_pos = $P10."pos"()
.annotate 'line', 586
  # rx pass
    rx1353_cur."!cursor_pass"(rx1353_pos, "codeblock")
    rx1353_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1353_pos)
    .return (rx1353_cur)
  rx1353_fail:
.annotate 'line', 550
    (rx1353_rep, rx1353_pos, $I10, $P10) = rx1353_cur."!mark_fail"(0)
    lt rx1353_pos, -1, rx1353_done
    eq rx1353_pos, -1, rx1353_fail
    jump $I10
  rx1353_done:
    rx1353_cur."!cursor_fail"()
    rx1353_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1353_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("352_1275160381.56318") :method
.annotate 'line', 550
    $P1355 = self."!PREFIX__!subrule"("block", "")
    new $P1356, "ResizablePMCArray"
    push $P1356, $P1355
    .return ($P1356)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1359" :load :anon :subid("353_1275160381.56318")
.annotate 'line', 4
    .const 'Sub' $P1361 = "11_1275160381.56318" 
    $P1362 = $P1361()
    .return ($P1362)
.end


.namespace []
.sub "_block1380" :load :anon :subid("354_1275160381.56318")
.annotate 'line', 1
    .const 'Sub' $P1382 = "10_1275160381.56318" 
    $P1383 = $P1382()
    .return ($P1383)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275160395.4197")
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
    $P2323 = $P14()
.annotate 'line', 1
    .return ($P2323)
    .const 'Sub' $P2325 = "137_1275160395.4197" 
    .return ($P2325)
.end


.namespace []
.sub "" :load :init :subid("post138") :outer("10_1275160395.4197")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275160395.4197" 
    .local pmc block
    set block, $P12
    $P2328 = get_root_global ["parrot"], "P6metaclass"
    $P2328."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1275160395.4197") :outer("10_1275160395.4197")
.annotate 'line', 3
    .const 'Sub' $P2319 = "136_1275160395.4197" 
    capture_lex $P2319
    get_hll_global $P2203, ["NQP";"RegexActions"], "_block2202" 
    capture_lex $P2203
    .const 'Sub' $P2192 = "126_1275160395.4197" 
    capture_lex $P2192
    .const 'Sub' $P2185 = "125_1275160395.4197" 
    capture_lex $P2185
    .const 'Sub' $P2178 = "124_1275160395.4197" 
    capture_lex $P2178
    .const 'Sub' $P2171 = "123_1275160395.4197" 
    capture_lex $P2171
    .const 'Sub' $P2158 = "122_1275160395.4197" 
    capture_lex $P2158
    .const 'Sub' $P2148 = "121_1275160395.4197" 
    capture_lex $P2148
    .const 'Sub' $P2138 = "120_1275160395.4197" 
    capture_lex $P2138
    .const 'Sub' $P2128 = "119_1275160395.4197" 
    capture_lex $P2128
    .const 'Sub' $P2121 = "118_1275160395.4197" 
    capture_lex $P2121
    .const 'Sub' $P2107 = "117_1275160395.4197" 
    capture_lex $P2107
    .const 'Sub' $P2097 = "116_1275160395.4197" 
    capture_lex $P2097
    .const 'Sub' $P2060 = "115_1275160395.4197" 
    capture_lex $P2060
    .const 'Sub' $P2046 = "114_1275160395.4197" 
    capture_lex $P2046
    .const 'Sub' $P2036 = "113_1275160395.4197" 
    capture_lex $P2036
    .const 'Sub' $P2026 = "112_1275160395.4197" 
    capture_lex $P2026
    .const 'Sub' $P2016 = "111_1275160395.4197" 
    capture_lex $P2016
    .const 'Sub' $P2006 = "110_1275160395.4197" 
    capture_lex $P2006
    .const 'Sub' $P1996 = "109_1275160395.4197" 
    capture_lex $P1996
    .const 'Sub' $P1968 = "108_1275160395.4197" 
    capture_lex $P1968
    .const 'Sub' $P1951 = "107_1275160395.4197" 
    capture_lex $P1951
    .const 'Sub' $P1941 = "106_1275160395.4197" 
    capture_lex $P1941
    .const 'Sub' $P1928 = "105_1275160395.4197" 
    capture_lex $P1928
    .const 'Sub' $P1915 = "104_1275160395.4197" 
    capture_lex $P1915
    .const 'Sub' $P1902 = "103_1275160395.4197" 
    capture_lex $P1902
    .const 'Sub' $P1892 = "102_1275160395.4197" 
    capture_lex $P1892
    .const 'Sub' $P1863 = "101_1275160395.4197" 
    capture_lex $P1863
    .const 'Sub' $P1839 = "100_1275160395.4197" 
    capture_lex $P1839
    .const 'Sub' $P1829 = "99_1275160395.4197" 
    capture_lex $P1829
    .const 'Sub' $P1819 = "98_1275160395.4197" 
    capture_lex $P1819
    .const 'Sub' $P1792 = "97_1275160395.4197" 
    capture_lex $P1792
    .const 'Sub' $P1774 = "96_1275160395.4197" 
    capture_lex $P1774
    .const 'Sub' $P1764 = "95_1275160395.4197" 
    capture_lex $P1764
    .const 'Sub' $P1660 = "92_1275160395.4197" 
    capture_lex $P1660
    .const 'Sub' $P1650 = "91_1275160395.4197" 
    capture_lex $P1650
    .const 'Sub' $P1621 = "90_1275160395.4197" 
    capture_lex $P1621
    .const 'Sub' $P1579 = "89_1275160395.4197" 
    capture_lex $P1579
    .const 'Sub' $P1563 = "88_1275160395.4197" 
    capture_lex $P1563
    .const 'Sub' $P1554 = "87_1275160395.4197" 
    capture_lex $P1554
    .const 'Sub' $P1522 = "86_1275160395.4197" 
    capture_lex $P1522
    .const 'Sub' $P1423 = "83_1275160395.4197" 
    capture_lex $P1423
    .const 'Sub' $P1406 = "82_1275160395.4197" 
    capture_lex $P1406
    .const 'Sub' $P1386 = "81_1275160395.4197" 
    capture_lex $P1386
    .const 'Sub' $P1302 = "80_1275160395.4197" 
    capture_lex $P1302
    .const 'Sub' $P1278 = "78_1275160395.4197" 
    capture_lex $P1278
    .const 'Sub' $P1244 = "76_1275160395.4197" 
    capture_lex $P1244
    .const 'Sub' $P1194 = "74_1275160395.4197" 
    capture_lex $P1194
    .const 'Sub' $P1184 = "73_1275160395.4197" 
    capture_lex $P1184
    .const 'Sub' $P1174 = "72_1275160395.4197" 
    capture_lex $P1174
    .const 'Sub' $P1103 = "70_1275160395.4197" 
    capture_lex $P1103
    .const 'Sub' $P1086 = "69_1275160395.4197" 
    capture_lex $P1086
    .const 'Sub' $P1076 = "68_1275160395.4197" 
    capture_lex $P1076
    .const 'Sub' $P1066 = "67_1275160395.4197" 
    capture_lex $P1066
    .const 'Sub' $P1056 = "66_1275160395.4197" 
    capture_lex $P1056
    .const 'Sub' $P1046 = "65_1275160395.4197" 
    capture_lex $P1046
    .const 'Sub' $P1022 = "64_1275160395.4197" 
    capture_lex $P1022
    .const 'Sub' $P969 = "63_1275160395.4197" 
    capture_lex $P969
    .const 'Sub' $P959 = "62_1275160395.4197" 
    capture_lex $P959
    .const 'Sub' $P870 = "60_1275160395.4197" 
    capture_lex $P870
    .const 'Sub' $P844 = "59_1275160395.4197" 
    capture_lex $P844
    .const 'Sub' $P828 = "58_1275160395.4197" 
    capture_lex $P828
    .const 'Sub' $P818 = "57_1275160395.4197" 
    capture_lex $P818
    .const 'Sub' $P808 = "56_1275160395.4197" 
    capture_lex $P808
    .const 'Sub' $P798 = "55_1275160395.4197" 
    capture_lex $P798
    .const 'Sub' $P788 = "54_1275160395.4197" 
    capture_lex $P788
    .const 'Sub' $P778 = "53_1275160395.4197" 
    capture_lex $P778
    .const 'Sub' $P768 = "52_1275160395.4197" 
    capture_lex $P768
    .const 'Sub' $P758 = "51_1275160395.4197" 
    capture_lex $P758
    .const 'Sub' $P748 = "50_1275160395.4197" 
    capture_lex $P748
    .const 'Sub' $P738 = "49_1275160395.4197" 
    capture_lex $P738
    .const 'Sub' $P728 = "48_1275160395.4197" 
    capture_lex $P728
    .const 'Sub' $P718 = "47_1275160395.4197" 
    capture_lex $P718
    .const 'Sub' $P708 = "46_1275160395.4197" 
    capture_lex $P708
    .const 'Sub' $P698 = "45_1275160395.4197" 
    capture_lex $P698
    .const 'Sub' $P680 = "44_1275160395.4197" 
    capture_lex $P680
    .const 'Sub' $P645 = "43_1275160395.4197" 
    capture_lex $P645
    .const 'Sub' $P629 = "42_1275160395.4197" 
    capture_lex $P629
    .const 'Sub' $P608 = "41_1275160395.4197" 
    capture_lex $P608
    .const 'Sub' $P588 = "40_1275160395.4197" 
    capture_lex $P588
    .const 'Sub' $P575 = "39_1275160395.4197" 
    capture_lex $P575
    .const 'Sub' $P549 = "38_1275160395.4197" 
    capture_lex $P549
    .const 'Sub' $P513 = "37_1275160395.4197" 
    capture_lex $P513
    .const 'Sub' $P496 = "36_1275160395.4197" 
    capture_lex $P496
    .const 'Sub' $P482 = "35_1275160395.4197" 
    capture_lex $P482
    .const 'Sub' $P429 = "33_1275160395.4197" 
    capture_lex $P429
    .const 'Sub' $P418 = "32_1275160395.4197" 
    capture_lex $P418
    .const 'Sub' $P405 = "31_1275160395.4197" 
    capture_lex $P405
    .const 'Sub' $P385 = "30_1275160395.4197" 
    capture_lex $P385
    .const 'Sub' $P375 = "29_1275160395.4197" 
    capture_lex $P375
    .const 'Sub' $P365 = "28_1275160395.4197" 
    capture_lex $P365
    .const 'Sub' $P349 = "27_1275160395.4197" 
    capture_lex $P349
    .const 'Sub' $P289 = "25_1275160395.4197" 
    capture_lex $P289
    .const 'Sub' $P246 = "23_1275160395.4197" 
    capture_lex $P246
    .const 'Sub' $P214 = "22_1275160395.4197" 
    capture_lex $P214
    .const 'Sub' $P181 = "21_1275160395.4197" 
    capture_lex $P181
    .const 'Sub' $P171 = "20_1275160395.4197" 
    capture_lex $P171
    .const 'Sub' $P151 = "19_1275160395.4197" 
    capture_lex $P151
    .const 'Sub' $P100 = "18_1275160395.4197" 
    capture_lex $P100
    .const 'Sub' $P84 = "17_1275160395.4197" 
    capture_lex $P84
    .const 'Sub' $P63 = "16_1275160395.4197" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1275160395.4197" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1275160395.4197" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_141
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_141:
.annotate 'line', 9
    .const 'Sub' $P16 = "12_1275160395.4197" 
    newclosure $P26, $P16
    .lex "xblock_immediate", $P26
.annotate 'line', 14
    .const 'Sub' $P27 = "13_1275160395.4197" 
    newclosure $P62, $P27
    .lex "block_immediate", $P62
.annotate 'line', 24
    .const 'Sub' $P63 = "16_1275160395.4197" 
    newclosure $P83, $P63
    .lex "vivitype", $P83
.annotate 'line', 43
    .const 'Sub' $P84 = "17_1275160395.4197" 
    newclosure $P99, $P84
    .lex "colonpair_str", $P99
.annotate 'line', 213
    .const 'Sub' $P100 = "18_1275160395.4197" 
    newclosure $P150, $P100
    .lex "push_block_handler", $P150
.annotate 'line', 797
    .const 'Sub' $P151 = "19_1275160395.4197" 
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
.annotate 'line', 788
    find_lex $P2170, "control"
.annotate 'line', 819
    get_hll_global $P2203, ["NQP";"RegexActions"], "_block2202" 
    capture_lex $P2203
    $P2313 = $P2203()
.annotate 'line', 3
    .return ($P2313)
    .const 'Sub' $P2315 = "135_1275160395.4197" 
    .return ($P2315)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post139") :outer("11_1275160395.4197")
.annotate 'line', 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    .const 'Sub' $P2319 = "136_1275160395.4197" 
    capture_lex $P2319
    $P2319()
    $P2322 = get_root_global ["parrot"], "P6metaclass"
    $P2322."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2318"  :anon :subid("136_1275160395.4197") :outer("11_1275160395.4197")
.annotate 'line', 6
    get_global $P2320, "@BLOCK"
    unless_null $P2320, vivify_140
    $P2320 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2320
  vivify_140:
 $P2321 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2321
.annotate 'line', 5
    .return ($P2321)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1275160395.4197") :outer("11_1275160395.4197")
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
.sub "block_immediate"  :subid("13_1275160395.4197") :outer("11_1275160395.4197")
    .param pmc param_30
.annotate 'line', 14
    .const 'Sub' $P40 = "14_1275160395.4197" 
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
    .const 'Sub' $P40 = "14_1275160395.4197" 
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
.sub "_block39"  :anon :subid("14_1275160395.4197") :outer("13_1275160395.4197")
.annotate 'line', 16
    .const 'Sub' $P51 = "15_1275160395.4197" 
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
    .const 'Sub' $P51 = "15_1275160395.4197" 
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
.sub "_block50"  :anon :subid("15_1275160395.4197") :outer("14_1275160395.4197")
    .param pmc param_52
.annotate 'line', 18
    .lex "$_", param_52
    find_lex $P53, "$stmts"
    find_lex $P54, "$_"
    $P55 = $P53."push"($P54)
    .return ($P55)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1275160395.4197") :outer("11_1275160395.4197")
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
.sub "colonpair_str"  :subid("17_1275160395.4197") :outer("11_1275160395.4197")
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
.sub "push_block_handler"  :subid("18_1275160395.4197") :outer("11_1275160395.4197")
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
    unless_null $P106, vivify_146
    $P106 = root_new ['parrot';'ResizablePMCArray']
  vivify_146:
    set $P107, $P106[0]
    unless_null $P107, vivify_147
    new $P107, "Undef"
  vivify_147:
    $P108 = $P107."handlers"()
    if $P108, unless_105_end
.annotate 'line', 215
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
    unless_null $P129, vivify_150
    $P129 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P130, $P129[0]
    unless_null $P130, vivify_151
    new $P130, "Undef"
  vivify_151:
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
.sub "control"  :subid("19_1275160395.4197") :outer("11_1275160395.4197")
    .param pmc param_154
    .param pmc param_155
.annotate 'line', 797
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(57)
    push_eh $P153
    .lex "$/", param_154
    .lex "$id", param_155
.annotate 'line', 798
    find_lex $P156, "$/"
    get_hll_global $P157, ["PAST"], "Op"
    find_lex $P158, "$/"
.annotate 'line', 804
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
.annotate 'line', 798
    $P164 = $P156."!make"($P163)
.annotate 'line', 797
    .return ($P164)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("20_1275160395.4197") :method :outer("11_1275160395.4197")
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
.sub "deflongname"  :subid("21_1275160395.4197") :method :outer("11_1275160395.4197")
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
.sub "comp_unit"  :subid("22_1275160395.4197") :method :outer("11_1275160395.4197")
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
.sub "statementlist"  :subid("23_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_249
.annotate 'line', 76
    .const 'Sub' $P263 = "24_1275160395.4197" 
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
    unless_null $P255, vivify_166
    $P255 = root_new ['parrot';'Hash']
  vivify_166:
    set $P256, $P255["statement"]
    unless_null $P256, vivify_167
    new $P256, "Undef"
  vivify_167:
    unless $P256, if_254_end
.annotate 'line', 79
    find_lex $P258, "$/"
    unless_null $P258, vivify_168
    $P258 = root_new ['parrot';'Hash']
  vivify_168:
    set $P259, $P258["statement"]
    unless_null $P259, vivify_169
    new $P259, "Undef"
  vivify_169:
    defined $I260, $P259
    unless $I260, for_undef_170
    iter $P257, $P259
    new $P283, 'ExceptionHandler'
    set_addr $P283, loop282_handler
    $P283."handle_types"(64, 66, 65)
    push_eh $P283
  loop282_test:
    unless $P257, loop282_done
    shift $P261, $P257
  loop282_redo:
    .const 'Sub' $P263 = "24_1275160395.4197" 
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
  for_undef_170:
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
.sub "_block262"  :anon :subid("24_1275160395.4197") :outer("23_1275160395.4197")
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
    unless_null $P269, vivify_171
    $P269 = root_new ['parrot';'Hash']
  vivify_171:
    set $P270, $P269["sink"]
    unless_null $P270, vivify_172
    new $P270, "Undef"
  vivify_172:
    defined $I271, $P270
    unless $I271, if_268_end
    find_lex $P272, "$ast"
    unless_null $P272, vivify_173
    $P272 = root_new ['parrot';'Hash']
  vivify_173:
    set $P273, $P272["sink"]
    unless_null $P273, vivify_174
    new $P273, "Undef"
  vivify_174:
    store_lex "$ast", $P273
  if_268_end:
.annotate 'line', 82
    find_lex $P275, "$ast"
    unless_null $P275, vivify_175
    $P275 = root_new ['parrot';'Hash']
  vivify_175:
    set $P276, $P275["bareblock"]
    unless_null $P276, vivify_176
    new $P276, "Undef"
  vivify_176:
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
.sub "statement"  :subid("25_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_292
    .param pmc param_293 :optional
    .param int has_param_293 :opt_flag
.annotate 'line', 89
    .const 'Sub' $P301 = "26_1275160395.4197" 
    capture_lex $P301
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(57)
    push_eh $P291
    .lex "self", self
    .lex "$/", param_292
    if has_param_293, optparam_177
    new $P294, "Undef"
    set param_293, $P294
  optparam_177:
    .lex "$key", param_293
.annotate 'line', 90
    new $P295, "Undef"
    .lex "$past", $P295
.annotate 'line', 89
    find_lex $P296, "$past"
.annotate 'line', 91
    find_lex $P298, "$/"
    unless_null $P298, vivify_178
    $P298 = root_new ['parrot';'Hash']
  vivify_178:
    set $P299, $P298["EXPR"]
    unless_null $P299, vivify_179
    new $P299, "Undef"
  vivify_179:
    if $P299, if_297
.annotate 'line', 102
    find_lex $P339, "$/"
    unless_null $P339, vivify_180
    $P339 = root_new ['parrot';'Hash']
  vivify_180:
    set $P340, $P339["statement_control"]
    unless_null $P340, vivify_181
    new $P340, "Undef"
  vivify_181:
    if $P340, if_338
.annotate 'line', 103
    new $P344, "Integer"
    assign $P344, 0
    store_lex "$past", $P344
    goto if_338_end
  if_338:
.annotate 'line', 102
    find_lex $P341, "$/"
    unless_null $P341, vivify_182
    $P341 = root_new ['parrot';'Hash']
  vivify_182:
    set $P342, $P341["statement_control"]
    unless_null $P342, vivify_183
    new $P342, "Undef"
  vivify_183:
    $P343 = $P342."ast"()
    store_lex "$past", $P343
  if_338_end:
    goto if_297_end
  if_297:
.annotate 'line', 91
    .const 'Sub' $P301 = "26_1275160395.4197" 
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
.sub "_block300"  :anon :subid("26_1275160395.4197") :outer("25_1275160395.4197")
.annotate 'line', 92
    new $P302, "Undef"
    .lex "$mc", $P302
.annotate 'line', 93
    new $P303, "Undef"
    .lex "$ml", $P303
.annotate 'line', 92
    find_lex $P304, "$/"
    unless_null $P304, vivify_184
    $P304 = root_new ['parrot';'Hash']
  vivify_184:
    set $P305, $P304["statement_mod_cond"]
    unless_null $P305, vivify_185
    $P305 = root_new ['parrot';'ResizablePMCArray']
  vivify_185:
    set $P306, $P305[0]
    unless_null $P306, vivify_186
    new $P306, "Undef"
  vivify_186:
    store_lex "$mc", $P306
.annotate 'line', 93
    find_lex $P307, "$/"
    unless_null $P307, vivify_187
    $P307 = root_new ['parrot';'Hash']
  vivify_187:
    set $P308, $P307["statement_mod_loop"]
    unless_null $P308, vivify_188
    $P308 = root_new ['parrot';'ResizablePMCArray']
  vivify_188:
    set $P309, $P308[0]
    unless_null $P309, vivify_189
    new $P309, "Undef"
  vivify_189:
    store_lex "$ml", $P309
.annotate 'line', 94
    find_lex $P310, "$/"
    unless_null $P310, vivify_190
    $P310 = root_new ['parrot';'Hash']
  vivify_190:
    set $P311, $P310["EXPR"]
    unless_null $P311, vivify_191
    new $P311, "Undef"
  vivify_191:
    $P312 = $P311."ast"()
    store_lex "$past", $P312
.annotate 'line', 95
    find_lex $P314, "$mc"
    unless $P314, if_313_end
.annotate 'line', 96
    get_hll_global $P315, ["PAST"], "Op"
    find_lex $P316, "$mc"
    unless_null $P316, vivify_192
    $P316 = root_new ['parrot';'Hash']
  vivify_192:
    set $P317, $P316["cond"]
    unless_null $P317, vivify_193
    new $P317, "Undef"
  vivify_193:
    $P318 = $P317."ast"()
    find_lex $P319, "$past"
    find_lex $P320, "$mc"
    unless_null $P320, vivify_194
    $P320 = root_new ['parrot';'Hash']
  vivify_194:
    set $P321, $P320["sym"]
    unless_null $P321, vivify_195
    new $P321, "Undef"
  vivify_195:
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
    unless_null $P329, vivify_196
    $P329 = root_new ['parrot';'Hash']
  vivify_196:
    set $P330, $P329["cond"]
    unless_null $P330, vivify_197
    new $P330, "Undef"
  vivify_197:
    $P331 = $P330."ast"()
    find_lex $P332, "$past"
    find_lex $P333, "$ml"
    unless_null $P333, vivify_198
    $P333 = root_new ['parrot';'Hash']
  vivify_198:
    set $P334, $P333["sym"]
    unless_null $P334, vivify_199
    new $P334, "Undef"
  vivify_199:
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
.sub "xblock"  :subid("27_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P355, vivify_200
    $P355 = root_new ['parrot';'Hash']
  vivify_200:
    set $P356, $P355["EXPR"]
    unless_null $P356, vivify_201
    new $P356, "Undef"
  vivify_201:
    $P357 = $P356."ast"()
    find_lex $P358, "$/"
    unless_null $P358, vivify_202
    $P358 = root_new ['parrot';'Hash']
  vivify_202:
    set $P359, $P358["pblock"]
    unless_null $P359, vivify_203
    new $P359, "Undef"
  vivify_203:
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
.sub "pblock"  :subid("28_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P370, vivify_204
    $P370 = root_new ['parrot';'Hash']
  vivify_204:
    set $P371, $P370["blockoid"]
    unless_null $P371, vivify_205
    new $P371, "Undef"
  vivify_205:
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
.sub "block"  :subid("29_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P380, vivify_206
    $P380 = root_new ['parrot';'Hash']
  vivify_206:
    set $P381, $P380["blockoid"]
    unless_null $P381, vivify_207
    new $P381, "Undef"
  vivify_207:
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
.sub "blockoid"  :subid("30_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P391, vivify_208
    $P391 = root_new ['parrot';'Hash']
  vivify_208:
    set $P392, $P391["statementlist"]
    unless_null $P392, vivify_209
    new $P392, "Undef"
  vivify_209:
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
.sub "newpad"  :subid("31_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P409, vivify_210
    $P409 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P409
  vivify_210:
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
.sub "outerctx"  :subid("32_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P422, vivify_211
    $P422 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P422
  vivify_211:
.annotate 'line', 133
    get_global $P423, "@BLOCK"
.annotate 'line', 135
    find_lex $P424, "self"
    get_global $P425, "@BLOCK"
    unless_null $P425, vivify_212
    $P425 = root_new ['parrot';'ResizablePMCArray']
  vivify_212:
    set $P426, $P425[0]
    unless_null $P426, vivify_213
    new $P426, "Undef"
  vivify_213:
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
.sub "statement_control:sym<if>"  :subid("33_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_432
.annotate 'line', 140
    .const 'Sub' $P460 = "34_1275160395.4197" 
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
    unless_null $P435, vivify_214
    $P435 = root_new ['parrot';'Hash']
  vivify_214:
    set $P436, $P435["xblock"]
    unless_null $P436, vivify_215
    new $P436, "Undef"
  vivify_215:
    set $N437, $P436
    new $P438, 'Float'
    set $P438, $N437
    sub $P439, $P438, 1
    store_lex "$count", $P439
.annotate 'line', 142
    find_lex $P440, "$count"
    set $I441, $P440
    find_lex $P442, "$/"
    unless_null $P442, vivify_216
    $P442 = root_new ['parrot';'Hash']
  vivify_216:
    set $P443, $P442["xblock"]
    unless_null $P443, vivify_217
    $P443 = root_new ['parrot';'ResizablePMCArray']
  vivify_217:
    set $P444, $P443[$I441]
    unless_null $P444, vivify_218
    new $P444, "Undef"
  vivify_218:
    $P445 = $P444."ast"()
    $P446 = "xblock_immediate"($P445)
    store_lex "$past", $P446
.annotate 'line', 143
    find_lex $P448, "$/"
    unless_null $P448, vivify_219
    $P448 = root_new ['parrot';'Hash']
  vivify_219:
    set $P449, $P448["else"]
    unless_null $P449, vivify_220
    new $P449, "Undef"
  vivify_220:
    unless $P449, if_447_end
.annotate 'line', 144
    find_lex $P450, "$past"
    find_lex $P451, "$/"
    unless_null $P451, vivify_221
    $P451 = root_new ['parrot';'Hash']
  vivify_221:
    set $P452, $P451["else"]
    unless_null $P452, vivify_222
    $P452 = root_new ['parrot';'ResizablePMCArray']
  vivify_222:
    set $P453, $P452[0]
    unless_null $P453, vivify_223
    new $P453, "Undef"
  vivify_223:
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
    .const 'Sub' $P460 = "34_1275160395.4197" 
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
.sub "_block459"  :anon :subid("34_1275160395.4197") :outer("33_1275160395.4197")
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
    unless_null $P467, vivify_224
    $P467 = root_new ['parrot';'Hash']
  vivify_224:
    set $P468, $P467["xblock"]
    unless_null $P468, vivify_225
    $P468 = root_new ['parrot';'ResizablePMCArray']
  vivify_225:
    set $P469, $P468[$I466]
    unless_null $P469, vivify_226
    new $P469, "Undef"
  vivify_226:
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
.sub "statement_control:sym<unless>"  :subid("35_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P487, vivify_227
    $P487 = root_new ['parrot';'Hash']
  vivify_227:
    set $P488, $P487["xblock"]
    unless_null $P488, vivify_228
    new $P488, "Undef"
  vivify_228:
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
.sub "statement_control:sym<while>"  :subid("36_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P501, vivify_229
    $P501 = root_new ['parrot';'Hash']
  vivify_229:
    set $P502, $P501["xblock"]
    unless_null $P502, vivify_230
    new $P502, "Undef"
  vivify_230:
    $P503 = $P502."ast"()
    $P504 = "xblock_immediate"($P503)
    store_lex "$past", $P504
.annotate 'line', 164
    find_lex $P505, "$past"
    find_lex $P506, "$/"
    unless_null $P506, vivify_231
    $P506 = root_new ['parrot';'Hash']
  vivify_231:
    set $P507, $P506["sym"]
    unless_null $P507, vivify_232
    new $P507, "Undef"
  vivify_232:
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
.sub "statement_control:sym<repeat>"  :subid("37_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P520, vivify_233
    $P520 = root_new ['parrot';'Hash']
  vivify_233:
    set $P521, $P520["wu"]
    unless_null $P521, vivify_234
    new $P521, "Undef"
  vivify_234:
    set $S522, $P521
    concat $P523, $P519, $S522
    store_lex "$pasttype", $P523
    find_lex $P524, "$past"
.annotate 'line', 171
    find_lex $P526, "$/"
    unless_null $P526, vivify_235
    $P526 = root_new ['parrot';'Hash']
  vivify_235:
    set $P527, $P526["xblock"]
    unless_null $P527, vivify_236
    new $P527, "Undef"
  vivify_236:
    if $P527, if_525
.annotate 'line', 176
    get_hll_global $P534, ["PAST"], "Op"
    find_lex $P535, "$/"
    unless_null $P535, vivify_237
    $P535 = root_new ['parrot';'Hash']
  vivify_237:
    set $P536, $P535["EXPR"]
    unless_null $P536, vivify_238
    new $P536, "Undef"
  vivify_238:
    $P537 = $P536."ast"()
    find_lex $P538, "$/"
    unless_null $P538, vivify_239
    $P538 = root_new ['parrot';'Hash']
  vivify_239:
    set $P539, $P538["pblock"]
    unless_null $P539, vivify_240
    new $P539, "Undef"
  vivify_240:
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
    unless_null $P528, vivify_241
    $P528 = root_new ['parrot';'Hash']
  vivify_241:
    set $P529, $P528["xblock"]
    unless_null $P529, vivify_242
    new $P529, "Undef"
  vivify_242:
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
.sub "statement_control:sym<for>"  :subid("38_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P555, vivify_243
    $P555 = root_new ['parrot';'Hash']
  vivify_243:
    set $P556, $P555["xblock"]
    unless_null $P556, vivify_244
    new $P556, "Undef"
  vivify_244:
    $P557 = $P556."ast"()
    store_lex "$past", $P557
.annotate 'line', 184
    find_lex $P558, "$past"
    $P558."pasttype"("for")
.annotate 'line', 185
    find_lex $P559, "$past"
    unless_null $P559, vivify_245
    $P559 = root_new ['parrot';'ResizablePMCArray']
  vivify_245:
    set $P560, $P559[1]
    unless_null $P560, vivify_246
    new $P560, "Undef"
  vivify_246:
    store_lex "$block", $P560
.annotate 'line', 186
    find_lex $P562, "$block"
    $P563 = $P562."arity"()
    if $P563, unless_561_end
.annotate 'line', 187
    find_lex $P564, "$block"
    unless_null $P564, vivify_247
    $P564 = root_new ['parrot';'ResizablePMCArray']
  vivify_247:
    set $P565, $P564[0]
    unless_null $P565, vivify_248
    new $P565, "Undef"
  vivify_248:
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
.sub "statement_control:sym<return>"  :subid("39_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P581, vivify_249
    $P581 = root_new ['parrot';'Hash']
  vivify_249:
    set $P582, $P581["EXPR"]
    unless_null $P582, vivify_250
    new $P582, "Undef"
  vivify_250:
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
.sub "statement_control:sym<CATCH>"  :subid("40_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P593, vivify_251
    $P593 = root_new ['parrot';'Hash']
  vivify_251:
    set $P594, $P593["block"]
    unless_null $P594, vivify_252
    new $P594, "Undef"
  vivify_252:
    $P595 = $P594."ast"()
    store_lex "$block", $P595
.annotate 'line', 201
    find_lex $P596, "$/"
    find_lex $P597, "$block"
    "push_block_handler"($P596, $P597)
.annotate 'line', 202
    get_global $P598, "@BLOCK"
    unless_null $P598, vivify_253
    $P598 = root_new ['parrot';'ResizablePMCArray']
  vivify_253:
    set $P599, $P598[0]
    unless_null $P599, vivify_254
    new $P599, "Undef"
  vivify_254:
    $P600 = $P599."handlers"()
    set $P601, $P600[0]
    unless_null $P601, vivify_255
    new $P601, "Undef"
  vivify_255:
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
.sub "statement_control:sym<CONTROL>"  :subid("41_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P613, vivify_256
    $P613 = root_new ['parrot';'Hash']
  vivify_256:
    set $P614, $P613["block"]
    unless_null $P614, vivify_257
    new $P614, "Undef"
  vivify_257:
    $P615 = $P614."ast"()
    store_lex "$block", $P615
.annotate 'line', 208
    find_lex $P616, "$/"
    find_lex $P617, "$block"
    "push_block_handler"($P616, $P617)
.annotate 'line', 209
    get_global $P618, "@BLOCK"
    unless_null $P618, vivify_258
    $P618 = root_new ['parrot';'ResizablePMCArray']
  vivify_258:
    set $P619, $P618[0]
    unless_null $P619, vivify_259
    new $P619, "Undef"
  vivify_259:
    $P620 = $P619."handlers"()
    set $P621, $P620[0]
    unless_null $P621, vivify_260
    new $P621, "Undef"
  vivify_260:
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
.sub "statement_prefix:sym<INIT>"  :subid("42_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P633, vivify_261
    $P633 = root_new ['parrot';'ResizablePMCArray']
  vivify_261:
    set $P634, $P633[0]
    unless_null $P634, vivify_262
    new $P634, "Undef"
  vivify_262:
    $P635 = $P634."loadinit"()
    find_lex $P636, "$/"
    unless_null $P636, vivify_263
    $P636 = root_new ['parrot';'Hash']
  vivify_263:
    set $P637, $P636["blorst"]
    unless_null $P637, vivify_264
    new $P637, "Undef"
  vivify_264:
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
.sub "statement_prefix:sym<try>"  :subid("43_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P650, vivify_265
    $P650 = root_new ['parrot';'Hash']
  vivify_265:
    set $P651, $P650["blorst"]
    unless_null $P651, vivify_266
    new $P651, "Undef"
  vivify_266:
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
.sub "blorst"  :subid("44_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P687, vivify_267
    $P687 = root_new ['parrot';'Hash']
  vivify_267:
    set $P688, $P687["block"]
    unless_null $P688, vivify_268
    new $P688, "Undef"
  vivify_268:
    if $P688, if_686
.annotate 'line', 281
    find_lex $P693, "$/"
    unless_null $P693, vivify_269
    $P693 = root_new ['parrot';'Hash']
  vivify_269:
    set $P694, $P693["statement"]
    unless_null $P694, vivify_270
    new $P694, "Undef"
  vivify_270:
    $P695 = $P694."ast"()
    set $P685, $P695
.annotate 'line', 280
    goto if_686_end
  if_686:
    find_lex $P689, "$/"
    unless_null $P689, vivify_271
    $P689 = root_new ['parrot';'Hash']
  vivify_271:
    set $P690, $P689["block"]
    unless_null $P690, vivify_272
    new $P690, "Undef"
  vivify_272:
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
.sub "statement_mod_cond:sym<if>"  :subid("45_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P703, vivify_273
    $P703 = root_new ['parrot';'Hash']
  vivify_273:
    set $P704, $P703["cond"]
    unless_null $P704, vivify_274
    new $P704, "Undef"
  vivify_274:
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
.sub "statement_mod_cond:sym<unless>"  :subid("46_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P713, vivify_275
    $P713 = root_new ['parrot';'Hash']
  vivify_275:
    set $P714, $P713["cond"]
    unless_null $P714, vivify_276
    new $P714, "Undef"
  vivify_276:
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
.sub "statement_mod_loop:sym<while>"  :subid("47_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P723, vivify_277
    $P723 = root_new ['parrot';'Hash']
  vivify_277:
    set $P724, $P723["cond"]
    unless_null $P724, vivify_278
    new $P724, "Undef"
  vivify_278:
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
.sub "statement_mod_loop:sym<until>"  :subid("48_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P733, vivify_279
    $P733 = root_new ['parrot';'Hash']
  vivify_279:
    set $P734, $P733["cond"]
    unless_null $P734, vivify_280
    new $P734, "Undef"
  vivify_280:
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
.sub "term:sym<fatarrow>"  :subid("49_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P743, vivify_281
    $P743 = root_new ['parrot';'Hash']
  vivify_281:
    set $P744, $P743["fatarrow"]
    unless_null $P744, vivify_282
    new $P744, "Undef"
  vivify_282:
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
.sub "term:sym<colonpair>"  :subid("50_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P753, vivify_283
    $P753 = root_new ['parrot';'Hash']
  vivify_283:
    set $P754, $P753["colonpair"]
    unless_null $P754, vivify_284
    new $P754, "Undef"
  vivify_284:
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
.sub "term:sym<variable>"  :subid("51_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P763, vivify_285
    $P763 = root_new ['parrot';'Hash']
  vivify_285:
    set $P764, $P763["variable"]
    unless_null $P764, vivify_286
    new $P764, "Undef"
  vivify_286:
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
.sub "term:sym<package_declarator>"  :subid("52_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P773, vivify_287
    $P773 = root_new ['parrot';'Hash']
  vivify_287:
    set $P774, $P773["package_declarator"]
    unless_null $P774, vivify_288
    new $P774, "Undef"
  vivify_288:
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
.sub "term:sym<scope_declarator>"  :subid("53_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P783, vivify_289
    $P783 = root_new ['parrot';'Hash']
  vivify_289:
    set $P784, $P783["scope_declarator"]
    unless_null $P784, vivify_290
    new $P784, "Undef"
  vivify_290:
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
.sub "term:sym<routine_declarator>"  :subid("54_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P793, vivify_291
    $P793 = root_new ['parrot';'Hash']
  vivify_291:
    set $P794, $P793["routine_declarator"]
    unless_null $P794, vivify_292
    new $P794, "Undef"
  vivify_292:
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
.sub "term:sym<regex_declarator>"  :subid("55_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P803, vivify_293
    $P803 = root_new ['parrot';'Hash']
  vivify_293:
    set $P804, $P803["regex_declarator"]
    unless_null $P804, vivify_294
    new $P804, "Undef"
  vivify_294:
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
.sub "term:sym<statement_prefix>"  :subid("56_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P813, vivify_295
    $P813 = root_new ['parrot';'Hash']
  vivify_295:
    set $P814, $P813["statement_prefix"]
    unless_null $P814, vivify_296
    new $P814, "Undef"
  vivify_296:
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
.sub "term:sym<lambda>"  :subid("57_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P823, vivify_297
    $P823 = root_new ['parrot';'Hash']
  vivify_297:
    set $P824, $P823["pblock"]
    unless_null $P824, vivify_298
    new $P824, "Undef"
  vivify_298:
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
.sub "fatarrow"  :subid("58_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P833, vivify_299
    $P833 = root_new ['parrot';'Hash']
  vivify_299:
    set $P834, $P833["val"]
    unless_null $P834, vivify_300
    new $P834, "Undef"
  vivify_300:
    $P835 = $P834."ast"()
    store_lex "$past", $P835
.annotate 'line', 306
    find_lex $P836, "$past"
    find_lex $P837, "$/"
    unless_null $P837, vivify_301
    $P837 = root_new ['parrot';'Hash']
  vivify_301:
    set $P838, $P837["key"]
    unless_null $P838, vivify_302
    new $P838, "Undef"
  vivify_302:
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
.sub "colonpair"  :subid("59_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P851, vivify_303
    $P851 = root_new ['parrot';'Hash']
  vivify_303:
    set $P852, $P851["circumfix"]
    unless_null $P852, vivify_304
    new $P852, "Undef"
  vivify_304:
    if $P852, if_850
.annotate 'line', 313
    get_hll_global $P857, ["PAST"], "Val"
    find_lex $P858, "$/"
    unless_null $P858, vivify_305
    $P858 = root_new ['parrot';'Hash']
  vivify_305:
    set $P859, $P858["not"]
    unless_null $P859, vivify_306
    new $P859, "Undef"
  vivify_306:
    isfalse $I860, $P859
    $P861 = $P857."new"($I860 :named("value"))
    set $P849, $P861
.annotate 'line', 312
    goto if_850_end
  if_850:
    find_lex $P853, "$/"
    unless_null $P853, vivify_307
    $P853 = root_new ['parrot';'Hash']
  vivify_307:
    set $P854, $P853["circumfix"]
    unless_null $P854, vivify_308
    $P854 = root_new ['parrot';'ResizablePMCArray']
  vivify_308:
    set $P855, $P854[0]
    unless_null $P855, vivify_309
    new $P855, "Undef"
  vivify_309:
    $P856 = $P855."ast"()
    set $P849, $P856
  if_850_end:
    store_lex "$past", $P849
.annotate 'line', 314
    find_lex $P862, "$past"
    find_lex $P863, "$/"
    unless_null $P863, vivify_310
    $P863 = root_new ['parrot';'Hash']
  vivify_310:
    set $P864, $P863["identifier"]
    unless_null $P864, vivify_311
    new $P864, "Undef"
  vivify_311:
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
.sub "variable"  :subid("60_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_873
.annotate 'line', 318
    .const 'Sub' $P886 = "61_1275160395.4197" 
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
    unless_null $P877, vivify_312
    $P877 = root_new ['parrot';'Hash']
  vivify_312:
    set $P878, $P877["postcircumfix"]
    unless_null $P878, vivify_313
    new $P878, "Undef"
  vivify_313:
    if $P878, if_876
.annotate 'line', 324
    .const 'Sub' $P886 = "61_1275160395.4197" 
    capture_lex $P886
    $P886()
    goto if_876_end
  if_876:
.annotate 'line', 321
    find_lex $P879, "$/"
    unless_null $P879, vivify_330
    $P879 = root_new ['parrot';'Hash']
  vivify_330:
    set $P880, $P879["postcircumfix"]
    unless_null $P880, vivify_331
    new $P880, "Undef"
  vivify_331:
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
.sub "_block885"  :anon :subid("61_1275160395.4197") :outer("60_1275160395.4197")
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
    unless_null $P900, vivify_314
    $P900 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P901, $P900[0]
    unless_null $P901, vivify_315
    new $P901, "Undef"
  vivify_315:
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
    unless_null $P909, vivify_316
    $P909 = root_new ['parrot';'Hash']
  vivify_316:
    set $P910, $P909["sigil"]
    unless_null $P910, vivify_317
    new $P910, "Undef"
  vivify_317:
    $P911 = "vivitype"($P910)
    $P908."viviself"($P911)
.annotate 'line', 332
    find_lex $P912, "$past"
    $P912."lvalue"(1)
  if_897_end:
.annotate 'line', 334
    find_lex $P915, "$/"
    unless_null $P915, vivify_318
    $P915 = root_new ['parrot';'Hash']
  vivify_318:
    set $P916, $P915["twigil"]
    unless_null $P916, vivify_319
    $P916 = root_new ['parrot';'ResizablePMCArray']
  vivify_319:
    set $P917, $P916[0]
    unless_null $P917, vivify_320
    new $P917, "Undef"
  vivify_320:
    set $S918, $P917
    iseq $I919, $S918, "*"
    if $I919, if_914
.annotate 'line', 347
    find_lex $P941, "$/"
    unless_null $P941, vivify_321
    $P941 = root_new ['parrot';'Hash']
  vivify_321:
    set $P942, $P941["twigil"]
    unless_null $P942, vivify_322
    $P942 = root_new ['parrot';'ResizablePMCArray']
  vivify_322:
    set $P943, $P942[0]
    unless_null $P943, vivify_323
    new $P943, "Undef"
  vivify_323:
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
    unless_null $P951, vivify_324
    $P951 = root_new ['parrot';'Hash']
  vivify_324:
    set $P952, $P951["sigil"]
    unless_null $P952, vivify_325
    new $P952, "Undef"
  vivify_325:
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
    unless_null $P923, vivify_326
    $P923 = root_new ['parrot';'Hash']
  vivify_326:
    set $P924, $P923["sigil"]
    unless_null $P924, vivify_327
    new $P924, "Undef"
  vivify_327:
    set $S925, $P924
    new $P926, 'String'
    set $P926, $S925
    find_lex $P927, "$/"
    unless_null $P927, vivify_328
    $P927 = root_new ['parrot';'Hash']
  vivify_328:
    set $P928, $P927["desigilname"]
    unless_null $P928, vivify_329
    new $P928, "Undef"
  vivify_329:
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
.sub "package_declarator:sym<module>"  :subid("62_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P964, vivify_332
    $P964 = root_new ['parrot';'Hash']
  vivify_332:
    set $P965, $P964["package_def"]
    unless_null $P965, vivify_333
    new $P965, "Undef"
  vivify_333:
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
.sub "package_declarator:sym<class>"  :subid("63_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P976, vivify_334
    $P976 = root_new ['parrot';'Hash']
  vivify_334:
    set $P977, $P976["package_def"]
    unless_null $P977, vivify_335
    new $P977, "Undef"
  vivify_335:
    $P978 = $P977."ast"()
    store_lex "$past", $P978
.annotate 'line', 360
    get_hll_global $P979, ["PAST"], "Op"
.annotate 'line', 361
    get_hll_global $P980, ["PAST"], "Op"
    $P981 = $P980."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 364
    find_lex $P982, "$/"
    unless_null $P982, vivify_336
    $P982 = root_new ['parrot';'Hash']
  vivify_336:
    set $P983, $P982["package_def"]
    unless_null $P983, vivify_337
    $P983 = root_new ['parrot';'Hash']
  vivify_337:
    set $P984, $P983["name"]
    unless_null $P984, vivify_338
    new $P984, "Undef"
  vivify_338:
    set $S985, $P984
    $P986 = $P979."new"($P981, $S985, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 360
    store_lex "$classinit", $P986
.annotate 'line', 368
    find_lex $P989, "$/"
    unless_null $P989, vivify_339
    $P989 = root_new ['parrot';'Hash']
  vivify_339:
    set $P990, $P989["package_def"]
    unless_null $P990, vivify_340
    $P990 = root_new ['parrot';'Hash']
  vivify_340:
    set $P991, $P990["parent"]
    unless_null $P991, vivify_341
    $P991 = root_new ['parrot';'ResizablePMCArray']
  vivify_341:
    set $P992, $P991[0]
    unless_null $P992, vivify_342
    new $P992, "Undef"
  vivify_342:
    set $S993, $P992
    unless $S993, unless_988
    new $P987, 'String'
    set $P987, $S993
    goto unless_988_end
  unless_988:
.annotate 'line', 369
    find_lex $P996, "$/"
    unless_null $P996, vivify_343
    $P996 = root_new ['parrot';'Hash']
  vivify_343:
    set $P997, $P996["sym"]
    unless_null $P997, vivify_344
    new $P997, "Undef"
  vivify_344:
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
    unless_null $P1009, vivify_345
    $P1009 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1010, $P1009["attributes"]
    unless_null $P1010, vivify_346
    new $P1010, "Undef"
  vivify_346:
    unless $P1010, if_1008_end
.annotate 'line', 374
    find_lex $P1011, "$classinit"
    find_lex $P1012, "$past"
    unless_null $P1012, vivify_347
    $P1012 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1013, $P1012["attributes"]
    unless_null $P1013, vivify_348
    new $P1013, "Undef"
  vivify_348:
    $P1011."push"($P1013)
  if_1008_end:
.annotate 'line', 376
    get_global $P1014, "@BLOCK"
    unless_null $P1014, vivify_349
    $P1014 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P1015, $P1014[0]
    unless_null $P1015, vivify_350
    new $P1015, "Undef"
  vivify_350:
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
.sub "package_def"  :subid("64_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P1029, vivify_351
    $P1029 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1030, $P1029["block"]
    unless_null $P1030, vivify_352
    new $P1030, "Undef"
  vivify_352:
    if $P1030, if_1028
    find_lex $P1034, "$/"
    unless_null $P1034, vivify_353
    $P1034 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1035, $P1034["comp_unit"]
    unless_null $P1035, vivify_354
    new $P1035, "Undef"
  vivify_354:
    $P1036 = $P1035."ast"()
    set $P1027, $P1036
    goto if_1028_end
  if_1028:
    find_lex $P1031, "$/"
    unless_null $P1031, vivify_355
    $P1031 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1032, $P1031["block"]
    unless_null $P1032, vivify_356
    new $P1032, "Undef"
  vivify_356:
    $P1033 = $P1032."ast"()
    set $P1027, $P1033
  if_1028_end:
    store_lex "$past", $P1027
.annotate 'line', 382
    find_lex $P1037, "$past"
    find_lex $P1038, "$/"
    unless_null $P1038, vivify_357
    $P1038 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1039, $P1038["name"]
    unless_null $P1039, vivify_358
    $P1039 = root_new ['parrot';'Hash']
  vivify_358:
    set $P1040, $P1039["identifier"]
    unless_null $P1040, vivify_359
    new $P1040, "Undef"
  vivify_359:
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
.sub "scope_declarator:sym<my>"  :subid("65_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P1051, vivify_360
    $P1051 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1052, $P1051["scoped"]
    unless_null $P1052, vivify_361
    new $P1052, "Undef"
  vivify_361:
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
.sub "scope_declarator:sym<our>"  :subid("66_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P1061, vivify_362
    $P1061 = root_new ['parrot';'Hash']
  vivify_362:
    set $P1062, $P1061["scoped"]
    unless_null $P1062, vivify_363
    new $P1062, "Undef"
  vivify_363:
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
.sub "scope_declarator:sym<has>"  :subid("67_1275160395.4197") :method :outer("11_1275160395.4197")
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
    unless_null $P1071, vivify_364
    $P1071 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1072, $P1071["scoped"]
    unless_null $P1072, vivify_365
    new $P1072, "Undef"
  vivify_365:
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
.sub "scoped"  :subid("68_1275160395.4197") :method :outer("11_1275160395.4197")
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
    find_lex $P1081, "$/"
    unless_null $P1081, vivify_366
    $P1081 = root_new ['parrot';'Hash']
  vivify_366:
    set $P1082, $P1081["declarator"]
    unless_null $P1082, vivify_367
    new $P1082, "Undef"
  vivify_367:
    $P1083 = $P1082."ast"()
    $P1084 = $P1080."!make"($P1083)
.annotate 'line', 391
    .return ($P1084)
  control_1077:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1085, exception, "payload"
    .return ($P1085)
.end


.namespace ["NQP";"Actions"]
.sub "declarator"  :subid("69_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1089
.annotate 'line', 395
    new $P1088, 'ExceptionHandler'
    set_addr $P1088, control_1087
    $P1088."handle_types"(57)
    push_eh $P1088
    .lex "self", self
    .lex "$/", param_1089
.annotate 'line', 396
    find_lex $P1090, "$/"
.annotate 'line', 397
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_368
    $P1093 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1094, $P1093["routine_declarator"]
    unless_null $P1094, vivify_369
    new $P1094, "Undef"
  vivify_369:
    if $P1094, if_1092
.annotate 'line', 398
    find_lex $P1098, "$/"
    unless_null $P1098, vivify_370
    $P1098 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1099, $P1098["variable_declarator"]
    unless_null $P1099, vivify_371
    new $P1099, "Undef"
  vivify_371:
    $P1100 = $P1099."ast"()
    set $P1091, $P1100
.annotate 'line', 397
    goto if_1092_end
  if_1092:
    find_lex $P1095, "$/"
    unless_null $P1095, vivify_372
    $P1095 = root_new ['parrot';'Hash']
  vivify_372:
    set $P1096, $P1095["routine_declarator"]
    unless_null $P1096, vivify_373
    new $P1096, "Undef"
  vivify_373:
    $P1097 = $P1096."ast"()
    set $P1091, $P1097
  if_1092_end:
    $P1101 = $P1090."!make"($P1091)
.annotate 'line', 395
    .return ($P1101)
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1102, exception, "payload"
    .return ($P1102)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("70_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1106
.annotate 'line', 401
    .const 'Sub' $P1146 = "71_1275160395.4197" 
    capture_lex $P1146
    new $P1105, 'ExceptionHandler'
    set_addr $P1105, control_1104
    $P1105."handle_types"(57)
    push_eh $P1105
    .lex "self", self
    .lex "$/", param_1106
.annotate 'line', 402
    new $P1107, "Undef"
    .lex "$past", $P1107
.annotate 'line', 403
    new $P1108, "Undef"
    .lex "$sigil", $P1108
.annotate 'line', 404
    new $P1109, "Undef"
    .lex "$name", $P1109
.annotate 'line', 405
    new $P1110, "Undef"
    .lex "$BLOCK", $P1110
.annotate 'line', 402
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_374
    $P1111 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1112, $P1111["variable"]
    unless_null $P1112, vivify_375
    new $P1112, "Undef"
  vivify_375:
    $P1113 = $P1112."ast"()
    store_lex "$past", $P1113
.annotate 'line', 403
    find_lex $P1114, "$/"
    unless_null $P1114, vivify_376
    $P1114 = root_new ['parrot';'Hash']
  vivify_376:
    set $P1115, $P1114["variable"]
    unless_null $P1115, vivify_377
    $P1115 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1116, $P1115["sigil"]
    unless_null $P1116, vivify_378
    new $P1116, "Undef"
  vivify_378:
    store_lex "$sigil", $P1116
.annotate 'line', 404
    find_lex $P1117, "$past"
    $P1118 = $P1117."name"()
    store_lex "$name", $P1118
.annotate 'line', 405
    get_global $P1119, "@BLOCK"
    unless_null $P1119, vivify_379
    $P1119 = root_new ['parrot';'ResizablePMCArray']
  vivify_379:
    set $P1120, $P1119[0]
    unless_null $P1120, vivify_380
    new $P1120, "Undef"
  vivify_380:
    store_lex "$BLOCK", $P1120
.annotate 'line', 406
    find_lex $P1122, "$BLOCK"
    find_lex $P1123, "$name"
    $P1124 = $P1122."symbol"($P1123)
    unless $P1124, if_1121_end
.annotate 'line', 407
    find_lex $P1125, "$/"
    $P1126 = $P1125."CURSOR"()
    find_lex $P1127, "$name"
    $P1126."panic"("Redeclaration of symbol ", $P1127)
  if_1121_end:
.annotate 'line', 409
    find_dynamic_lex $P1129, "$*SCOPE"
    unless_null $P1129, vivify_381
    get_hll_global $P1129, "$SCOPE"
    unless_null $P1129, vivify_382
    die "Contextual $*SCOPE not found"
  vivify_382:
  vivify_381:
    set $S1130, $P1129
    iseq $I1131, $S1130, "has"
    if $I1131, if_1128
.annotate 'line', 418
    .const 'Sub' $P1146 = "71_1275160395.4197" 
    capture_lex $P1146
    $P1146()
    goto if_1128_end
  if_1128:
.annotate 'line', 410
    find_lex $P1132, "$BLOCK"
    find_lex $P1133, "$name"
    $P1132."symbol"($P1133, "attribute" :named("scope"))
.annotate 'line', 411
    find_lex $P1135, "$BLOCK"
    unless_null $P1135, vivify_387
    $P1135 = root_new ['parrot';'Hash']
  vivify_387:
    set $P1136, $P1135["attributes"]
    unless_null $P1136, vivify_388
    new $P1136, "Undef"
  vivify_388:
    if $P1136, unless_1134_end
.annotate 'line', 413
    get_hll_global $P1137, ["PAST"], "Op"
    $P1138 = $P1137."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1139, "$BLOCK"
    unless_null $P1139, vivify_389
    $P1139 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1139
  vivify_389:
    set $P1139["attributes"], $P1138
  unless_1134_end:
.annotate 'line', 415
    find_lex $P1140, "$BLOCK"
    unless_null $P1140, vivify_390
    $P1140 = root_new ['parrot';'Hash']
  vivify_390:
    set $P1141, $P1140["attributes"]
    unless_null $P1141, vivify_391
    new $P1141, "Undef"
  vivify_391:
    find_lex $P1142, "$name"
    $P1141."push"($P1142)
.annotate 'line', 416
    get_hll_global $P1143, ["PAST"], "Stmts"
    $P1144 = $P1143."new"()
    store_lex "$past", $P1144
  if_1128_end:
.annotate 'line', 426
    find_lex $P1170, "$/"
    find_lex $P1171, "$past"
    $P1172 = $P1170."!make"($P1171)
.annotate 'line', 401
    .return ($P1172)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1173, exception, "payload"
    .return ($P1173)
.end


.namespace ["NQP";"Actions"]
.sub "_block1145"  :anon :subid("71_1275160395.4197") :outer("70_1275160395.4197")
.annotate 'line', 419
    new $P1147, "Undef"
    .lex "$scope", $P1147
.annotate 'line', 420
    new $P1148, "Undef"
    .lex "$decl", $P1148
.annotate 'line', 419
    find_dynamic_lex $P1151, "$*SCOPE"
    unless_null $P1151, vivify_383
    get_hll_global $P1151, "$SCOPE"
    unless_null $P1151, vivify_384
    die "Contextual $*SCOPE not found"
  vivify_384:
  vivify_383:
    set $S1152, $P1151
    iseq $I1153, $S1152, "our"
    if $I1153, if_1150
    new $P1155, "String"
    assign $P1155, "lexical"
    set $P1149, $P1155
    goto if_1150_end
  if_1150:
    new $P1154, "String"
    assign $P1154, "package"
    set $P1149, $P1154
  if_1150_end:
    store_lex "$scope", $P1149
.annotate 'line', 420
    get_hll_global $P1156, ["PAST"], "Var"
    find_lex $P1157, "$name"
    find_lex $P1158, "$scope"
.annotate 'line', 421
    find_lex $P1159, "$sigil"
    $P1160 = "vivitype"($P1159)
    find_lex $P1161, "$/"
    $P1162 = $P1156."new"($P1157 :named("name"), $P1158 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1160 :named("viviself"), $P1161 :named("node"))
.annotate 'line', 420
    store_lex "$decl", $P1162
.annotate 'line', 423
    find_lex $P1163, "$BLOCK"
    find_lex $P1164, "$name"
    find_lex $P1165, "$scope"
    $P1163."symbol"($P1164, $P1165 :named("scope"))
.annotate 'line', 424
    find_lex $P1166, "$BLOCK"
    unless_null $P1166, vivify_385
    $P1166 = root_new ['parrot';'ResizablePMCArray']
  vivify_385:
    set $P1167, $P1166[0]
    unless_null $P1167, vivify_386
    new $P1167, "Undef"
  vivify_386:
    find_lex $P1168, "$decl"
    $P1169 = $P1167."push"($P1168)
.annotate 'line', 418
    .return ($P1169)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("72_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1177
.annotate 'line', 429
    new $P1176, 'ExceptionHandler'
    set_addr $P1176, control_1175
    $P1176."handle_types"(57)
    push_eh $P1176
    .lex "self", self
    .lex "$/", param_1177
    find_lex $P1178, "$/"
    find_lex $P1179, "$/"
    unless_null $P1179, vivify_392
    $P1179 = root_new ['parrot';'Hash']
  vivify_392:
    set $P1180, $P1179["routine_def"]
    unless_null $P1180, vivify_393
    new $P1180, "Undef"
  vivify_393:
    $P1181 = $P1180."ast"()
    $P1182 = $P1178."!make"($P1181)
    .return ($P1182)
  control_1175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1183, exception, "payload"
    .return ($P1183)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("73_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1187
.annotate 'line', 430
    new $P1186, 'ExceptionHandler'
    set_addr $P1186, control_1185
    $P1186."handle_types"(57)
    push_eh $P1186
    .lex "self", self
    .lex "$/", param_1187
    find_lex $P1188, "$/"
    find_lex $P1189, "$/"
    unless_null $P1189, vivify_394
    $P1189 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1190, $P1189["method_def"]
    unless_null $P1190, vivify_395
    new $P1190, "Undef"
  vivify_395:
    $P1191 = $P1190."ast"()
    $P1192 = $P1188."!make"($P1191)
    .return ($P1192)
  control_1185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1193, exception, "payload"
    .return ($P1193)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("74_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1197
.annotate 'line', 432
    .const 'Sub' $P1208 = "75_1275160395.4197" 
    capture_lex $P1208
    new $P1196, 'ExceptionHandler'
    set_addr $P1196, control_1195
    $P1196."handle_types"(57)
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate 'line', 433
    new $P1198, "Undef"
    .lex "$past", $P1198
    find_lex $P1199, "$/"
    unless_null $P1199, vivify_396
    $P1199 = root_new ['parrot';'Hash']
  vivify_396:
    set $P1200, $P1199["blockoid"]
    unless_null $P1200, vivify_397
    new $P1200, "Undef"
  vivify_397:
    $P1201 = $P1200."ast"()
    store_lex "$past", $P1201
.annotate 'line', 434
    find_lex $P1202, "$past"
    $P1202."blocktype"("declaration")
.annotate 'line', 435
    find_lex $P1203, "$past"
    $P1203."control"("return_pir")
.annotate 'line', 436
    find_lex $P1205, "$/"
    unless_null $P1205, vivify_398
    $P1205 = root_new ['parrot';'Hash']
  vivify_398:
    set $P1206, $P1205["deflongname"]
    unless_null $P1206, vivify_399
    new $P1206, "Undef"
  vivify_399:
    unless $P1206, if_1204_end
    .const 'Sub' $P1208 = "75_1275160395.4197" 
    capture_lex $P1208
    $P1208()
  if_1204_end:
.annotate 'line', 446
    find_lex $P1240, "$/"
    find_lex $P1241, "$past"
    $P1242 = $P1240."!make"($P1241)
.annotate 'line', 432
    .return ($P1242)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1243, exception, "payload"
    .return ($P1243)
.end


.namespace ["NQP";"Actions"]
.sub "_block1207"  :anon :subid("75_1275160395.4197") :outer("74_1275160395.4197")
.annotate 'line', 437
    new $P1209, "Undef"
    .lex "$name", $P1209
    find_lex $P1210, "$/"
    unless_null $P1210, vivify_400
    $P1210 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1211, $P1210["sigil"]
    unless_null $P1211, vivify_401
    $P1211 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P1212, $P1211[0]
    unless_null $P1212, vivify_402
    new $P1212, "Undef"
  vivify_402:
    set $S1213, $P1212
    new $P1214, 'String'
    set $P1214, $S1213
    find_lex $P1215, "$/"
    unless_null $P1215, vivify_403
    $P1215 = root_new ['parrot';'Hash']
  vivify_403:
    set $P1216, $P1215["deflongname"]
    unless_null $P1216, vivify_404
    $P1216 = root_new ['parrot';'ResizablePMCArray']
  vivify_404:
    set $P1217, $P1216[0]
    unless_null $P1217, vivify_405
    new $P1217, "Undef"
  vivify_405:
    $S1218 = $P1217."ast"()
    concat $P1219, $P1214, $S1218
    store_lex "$name", $P1219
.annotate 'line', 438
    find_lex $P1220, "$past"
    find_lex $P1221, "$name"
    $P1220."name"($P1221)
.annotate 'line', 439
    find_dynamic_lex $P1224, "$*SCOPE"
    unless_null $P1224, vivify_406
    get_hll_global $P1224, "$SCOPE"
    unless_null $P1224, vivify_407
    die "Contextual $*SCOPE not found"
  vivify_407:
  vivify_406:
    set $S1225, $P1224
    isne $I1226, $S1225, "our"
    if $I1226, if_1223
    new $P1222, 'Integer'
    set $P1222, $I1226
    goto if_1223_end
  if_1223:
.annotate 'line', 440
    get_global $P1227, "@BLOCK"
    unless_null $P1227, vivify_408
    $P1227 = root_new ['parrot';'ResizablePMCArray']
  vivify_408:
    set $P1228, $P1227[0]
    unless_null $P1228, vivify_409
    $P1228 = root_new ['parrot';'ResizablePMCArray']
  vivify_409:
    set $P1229, $P1228[0]
    unless_null $P1229, vivify_410
    new $P1229, "Undef"
  vivify_410:
    get_hll_global $P1230, ["PAST"], "Var"
    find_lex $P1231, "$name"
    find_lex $P1232, "$past"
    $P1233 = $P1230."new"($P1231 :named("name"), 1 :named("isdecl"), $P1232 :named("viviself"), "lexical" :named("scope"))
    $P1229."push"($P1233)
.annotate 'line', 442
    get_global $P1234, "@BLOCK"
    unless_null $P1234, vivify_411
    $P1234 = root_new ['parrot';'ResizablePMCArray']
  vivify_411:
    set $P1235, $P1234[0]
    unless_null $P1235, vivify_412
    new $P1235, "Undef"
  vivify_412:
    find_lex $P1236, "$name"
    $P1235."symbol"($P1236, "lexical" :named("scope"))
.annotate 'line', 443
    get_hll_global $P1237, ["PAST"], "Var"
    find_lex $P1238, "$name"
    $P1239 = $P1237."new"($P1238 :named("name"))
    store_lex "$past", $P1239
.annotate 'line', 439
    set $P1222, $P1239
  if_1223_end:
.annotate 'line', 436
    .return ($P1222)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("76_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1247
.annotate 'line', 450
    .const 'Sub' $P1263 = "77_1275160395.4197" 
    capture_lex $P1263
    new $P1246, 'ExceptionHandler'
    set_addr $P1246, control_1245
    $P1246."handle_types"(57)
    push_eh $P1246
    .lex "self", self
    .lex "$/", param_1247
.annotate 'line', 451
    new $P1248, "Undef"
    .lex "$past", $P1248
    find_lex $P1249, "$/"
    unless_null $P1249, vivify_413
    $P1249 = root_new ['parrot';'Hash']
  vivify_413:
    set $P1250, $P1249["blockoid"]
    unless_null $P1250, vivify_414
    new $P1250, "Undef"
  vivify_414:
    $P1251 = $P1250."ast"()
    store_lex "$past", $P1251
.annotate 'line', 452
    find_lex $P1252, "$past"
    $P1252."blocktype"("method")
.annotate 'line', 453
    find_lex $P1253, "$past"
    $P1253."control"("return_pir")
.annotate 'line', 454
    find_lex $P1254, "$past"
    unless_null $P1254, vivify_415
    $P1254 = root_new ['parrot';'ResizablePMCArray']
  vivify_415:
    set $P1255, $P1254[0]
    unless_null $P1255, vivify_416
    new $P1255, "Undef"
  vivify_416:
    get_hll_global $P1256, ["PAST"], "Op"
    $P1257 = $P1256."new"("    .lex \"self\", self" :named("inline"))
    $P1255."unshift"($P1257)
.annotate 'line', 455
    find_lex $P1258, "$past"
    $P1258."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 456
    find_lex $P1260, "$/"
    unless_null $P1260, vivify_417
    $P1260 = root_new ['parrot';'Hash']
  vivify_417:
    set $P1261, $P1260["deflongname"]
    unless_null $P1261, vivify_418
    new $P1261, "Undef"
  vivify_418:
    unless $P1261, if_1259_end
    .const 'Sub' $P1263 = "77_1275160395.4197" 
    capture_lex $P1263
    $P1263()
  if_1259_end:
.annotate 'line', 460
    find_lex $P1274, "$/"
    find_lex $P1275, "$past"
    $P1276 = $P1274."!make"($P1275)
.annotate 'line', 450
    .return ($P1276)
  control_1245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1277, exception, "payload"
    .return ($P1277)
.end


.namespace ["NQP";"Actions"]
.sub "_block1262"  :anon :subid("77_1275160395.4197") :outer("76_1275160395.4197")
.annotate 'line', 457
    new $P1264, "Undef"
    .lex "$name", $P1264
    find_lex $P1265, "$/"
    unless_null $P1265, vivify_419
    $P1265 = root_new ['parrot';'Hash']
  vivify_419:
    set $P1266, $P1265["deflongname"]
    unless_null $P1266, vivify_420
    $P1266 = root_new ['parrot';'ResizablePMCArray']
  vivify_420:
    set $P1267, $P1266[0]
    unless_null $P1267, vivify_421
    new $P1267, "Undef"
  vivify_421:
    $P1268 = $P1267."ast"()
    set $S1269, $P1268
    new $P1270, 'String'
    set $P1270, $S1269
    store_lex "$name", $P1270
.annotate 'line', 458
    find_lex $P1271, "$past"
    find_lex $P1272, "$name"
    $P1273 = $P1271."name"($P1272)
.annotate 'line', 456
    .return ($P1273)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("78_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1281
.annotate 'line', 464
    .const 'Sub' $P1292 = "79_1275160395.4197" 
    capture_lex $P1292
    new $P1280, 'ExceptionHandler'
    set_addr $P1280, control_1279
    $P1280."handle_types"(57)
    push_eh $P1280
    .lex "self", self
    .lex "$/", param_1281
.annotate 'line', 465
    new $P1282, "Undef"
    .lex "$BLOCKINIT", $P1282
    get_global $P1283, "@BLOCK"
    unless_null $P1283, vivify_422
    $P1283 = root_new ['parrot';'ResizablePMCArray']
  vivify_422:
    set $P1284, $P1283[0]
    unless_null $P1284, vivify_423
    $P1284 = root_new ['parrot';'ResizablePMCArray']
  vivify_423:
    set $P1285, $P1284[0]
    unless_null $P1285, vivify_424
    new $P1285, "Undef"
  vivify_424:
    store_lex "$BLOCKINIT", $P1285
.annotate 'line', 466
    find_lex $P1287, "$/"
    unless_null $P1287, vivify_425
    $P1287 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1288, $P1287["parameter"]
    unless_null $P1288, vivify_426
    new $P1288, "Undef"
  vivify_426:
    defined $I1289, $P1288
    unless $I1289, for_undef_427
    iter $P1286, $P1288
    new $P1299, 'ExceptionHandler'
    set_addr $P1299, loop1298_handler
    $P1299."handle_types"(64, 66, 65)
    push_eh $P1299
  loop1298_test:
    unless $P1286, loop1298_done
    shift $P1290, $P1286
  loop1298_redo:
    .const 'Sub' $P1292 = "79_1275160395.4197" 
    capture_lex $P1292
    $P1292($P1290)
  loop1298_next:
    goto loop1298_test
  loop1298_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1300, exception, 'type'
    eq $P1300, 64, loop1298_next
    eq $P1300, 66, loop1298_redo
  loop1298_done:
    pop_eh 
  for_undef_427:
.annotate 'line', 464
    .return ($P1286)
  control_1279:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1301, exception, "payload"
    .return ($P1301)
.end


.namespace ["NQP";"Actions"]
.sub "_block1291"  :anon :subid("79_1275160395.4197") :outer("78_1275160395.4197")
    .param pmc param_1293
.annotate 'line', 466
    .lex "$_", param_1293
    find_lex $P1294, "$BLOCKINIT"
    find_lex $P1295, "$_"
    $P1296 = $P1295."ast"()
    $P1297 = $P1294."push"($P1296)
    .return ($P1297)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("80_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1305
.annotate 'line', 469
    new $P1304, 'ExceptionHandler'
    set_addr $P1304, control_1303
    $P1304."handle_types"(57)
    push_eh $P1304
    .lex "self", self
    .lex "$/", param_1305
.annotate 'line', 470
    new $P1306, "Undef"
    .lex "$quant", $P1306
.annotate 'line', 471
    new $P1307, "Undef"
    .lex "$past", $P1307
.annotate 'line', 470
    find_lex $P1308, "$/"
    unless_null $P1308, vivify_428
    $P1308 = root_new ['parrot';'Hash']
  vivify_428:
    set $P1309, $P1308["quant"]
    unless_null $P1309, vivify_429
    new $P1309, "Undef"
  vivify_429:
    store_lex "$quant", $P1309
    find_lex $P1310, "$past"
.annotate 'line', 472
    find_lex $P1312, "$/"
    unless_null $P1312, vivify_430
    $P1312 = root_new ['parrot';'Hash']
  vivify_430:
    set $P1313, $P1312["named_param"]
    unless_null $P1313, vivify_431
    new $P1313, "Undef"
  vivify_431:
    if $P1313, if_1311
.annotate 'line', 479
    find_lex $P1327, "$/"
    unless_null $P1327, vivify_432
    $P1327 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1328, $P1327["param_var"]
    unless_null $P1328, vivify_433
    new $P1328, "Undef"
  vivify_433:
    $P1329 = $P1328."ast"()
    store_lex "$past", $P1329
.annotate 'line', 480
    find_lex $P1331, "$quant"
    set $S1332, $P1331
    iseq $I1333, $S1332, "*"
    if $I1333, if_1330
.annotate 'line', 484
    find_lex $P1342, "$quant"
    set $S1343, $P1342
    iseq $I1344, $S1343, "?"
    unless $I1344, if_1341_end
.annotate 'line', 485
    find_lex $P1345, "$past"
    find_lex $P1346, "$/"
    unless_null $P1346, vivify_434
    $P1346 = root_new ['parrot';'Hash']
  vivify_434:
    set $P1347, $P1346["param_var"]
    unless_null $P1347, vivify_435
    $P1347 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1348, $P1347["sigil"]
    unless_null $P1348, vivify_436
    new $P1348, "Undef"
  vivify_436:
    $P1349 = "vivitype"($P1348)
    $P1345."viviself"($P1349)
  if_1341_end:
.annotate 'line', 484
    goto if_1330_end
  if_1330:
.annotate 'line', 481
    find_lex $P1334, "$past"
    $P1334."slurpy"(1)
.annotate 'line', 482
    find_lex $P1335, "$past"
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_437
    $P1336 = root_new ['parrot';'Hash']
  vivify_437:
    set $P1337, $P1336["param_var"]
    unless_null $P1337, vivify_438
    $P1337 = root_new ['parrot';'Hash']
  vivify_438:
    set $P1338, $P1337["sigil"]
    unless_null $P1338, vivify_439
    new $P1338, "Undef"
  vivify_439:
    set $S1339, $P1338
    iseq $I1340, $S1339, "%"
    $P1335."named"($I1340)
  if_1330_end:
.annotate 'line', 478
    goto if_1311_end
  if_1311:
.annotate 'line', 473
    find_lex $P1314, "$/"
    unless_null $P1314, vivify_440
    $P1314 = root_new ['parrot';'Hash']
  vivify_440:
    set $P1315, $P1314["named_param"]
    unless_null $P1315, vivify_441
    new $P1315, "Undef"
  vivify_441:
    $P1316 = $P1315."ast"()
    store_lex "$past", $P1316
.annotate 'line', 474
    find_lex $P1318, "$quant"
    set $S1319, $P1318
    isne $I1320, $S1319, "!"
    unless $I1320, if_1317_end
.annotate 'line', 475
    find_lex $P1321, "$past"
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_442
    $P1322 = root_new ['parrot';'Hash']
  vivify_442:
    set $P1323, $P1322["named_param"]
    unless_null $P1323, vivify_443
    $P1323 = root_new ['parrot';'Hash']
  vivify_443:
    set $P1324, $P1323["param_var"]
    unless_null $P1324, vivify_444
    $P1324 = root_new ['parrot';'Hash']
  vivify_444:
    set $P1325, $P1324["sigil"]
    unless_null $P1325, vivify_445
    new $P1325, "Undef"
  vivify_445:
    $P1326 = "vivitype"($P1325)
    $P1321."viviself"($P1326)
  if_1317_end:
  if_1311_end:
.annotate 'line', 488
    find_lex $P1351, "$/"
    unless_null $P1351, vivify_446
    $P1351 = root_new ['parrot';'Hash']
  vivify_446:
    set $P1352, $P1351["default_value"]
    unless_null $P1352, vivify_447
    new $P1352, "Undef"
  vivify_447:
    unless $P1352, if_1350_end
.annotate 'line', 489
    find_lex $P1354, "$quant"
    set $S1355, $P1354
    iseq $I1356, $S1355, "*"
    unless $I1356, if_1353_end
.annotate 'line', 490
    find_lex $P1357, "$/"
    $P1358 = $P1357."CURSOR"()
    $P1358."panic"("Can't put default on slurpy parameter")
  if_1353_end:
.annotate 'line', 492
    find_lex $P1360, "$quant"
    set $S1361, $P1360
    iseq $I1362, $S1361, "!"
    unless $I1362, if_1359_end
.annotate 'line', 493
    find_lex $P1363, "$/"
    $P1364 = $P1363."CURSOR"()
    $P1364."panic"("Can't put default on required parameter")
  if_1359_end:
.annotate 'line', 495
    find_lex $P1365, "$past"
    find_lex $P1366, "$/"
    unless_null $P1366, vivify_448
    $P1366 = root_new ['parrot';'Hash']
  vivify_448:
    set $P1367, $P1366["default_value"]
    unless_null $P1367, vivify_449
    $P1367 = root_new ['parrot';'ResizablePMCArray']
  vivify_449:
    set $P1368, $P1367[0]
    unless_null $P1368, vivify_450
    $P1368 = root_new ['parrot';'Hash']
  vivify_450:
    set $P1369, $P1368["EXPR"]
    unless_null $P1369, vivify_451
    new $P1369, "Undef"
  vivify_451:
    $P1370 = $P1369."ast"()
    $P1365."viviself"($P1370)
  if_1350_end:
.annotate 'line', 497
    find_lex $P1372, "$past"
    $P1373 = $P1372."viviself"()
    if $P1373, unless_1371_end
    get_global $P1374, "@BLOCK"
    unless_null $P1374, vivify_452
    $P1374 = root_new ['parrot';'ResizablePMCArray']
  vivify_452:
    set $P1375, $P1374[0]
    unless_null $P1375, vivify_453
    new $P1375, "Undef"
  vivify_453:
    get_global $P1376, "@BLOCK"
    unless_null $P1376, vivify_454
    $P1376 = root_new ['parrot';'ResizablePMCArray']
  vivify_454:
    set $P1377, $P1376[0]
    unless_null $P1377, vivify_455
    new $P1377, "Undef"
  vivify_455:
    $P1378 = $P1377."arity"()
    set $N1379, $P1378
    new $P1380, 'Float'
    set $P1380, $N1379
    add $P1381, $P1380, 1
    $P1375."arity"($P1381)
  unless_1371_end:
.annotate 'line', 498
    find_lex $P1382, "$/"
    find_lex $P1383, "$past"
    $P1384 = $P1382."!make"($P1383)
.annotate 'line', 469
    .return ($P1384)
  control_1303:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1385, exception, "payload"
    .return ($P1385)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("81_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1389
.annotate 'line', 501
    new $P1388, 'ExceptionHandler'
    set_addr $P1388, control_1387
    $P1388."handle_types"(57)
    push_eh $P1388
    .lex "self", self
    .lex "$/", param_1389
.annotate 'line', 502
    new $P1390, "Undef"
    .lex "$name", $P1390
.annotate 'line', 503
    new $P1391, "Undef"
    .lex "$past", $P1391
.annotate 'line', 502
    find_lex $P1392, "$/"
    set $S1393, $P1392
    new $P1394, 'String'
    set $P1394, $S1393
    store_lex "$name", $P1394
.annotate 'line', 503
    get_hll_global $P1395, ["PAST"], "Var"
    find_lex $P1396, "$name"
    find_lex $P1397, "$/"
    $P1398 = $P1395."new"($P1396 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1397 :named("node"))
    store_lex "$past", $P1398
.annotate 'line', 505
    get_global $P1399, "@BLOCK"
    unless_null $P1399, vivify_456
    $P1399 = root_new ['parrot';'ResizablePMCArray']
  vivify_456:
    set $P1400, $P1399[0]
    unless_null $P1400, vivify_457
    new $P1400, "Undef"
  vivify_457:
    find_lex $P1401, "$name"
    $P1400."symbol"($P1401, "lexical" :named("scope"))
.annotate 'line', 506
    find_lex $P1402, "$/"
    find_lex $P1403, "$past"
    $P1404 = $P1402."!make"($P1403)
.annotate 'line', 501
    .return ($P1404)
  control_1387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1405, exception, "payload"
    .return ($P1405)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("82_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1409
.annotate 'line', 509
    new $P1408, 'ExceptionHandler'
    set_addr $P1408, control_1407
    $P1408."handle_types"(57)
    push_eh $P1408
    .lex "self", self
    .lex "$/", param_1409
.annotate 'line', 510
    new $P1410, "Undef"
    .lex "$past", $P1410
    find_lex $P1411, "$/"
    unless_null $P1411, vivify_458
    $P1411 = root_new ['parrot';'Hash']
  vivify_458:
    set $P1412, $P1411["param_var"]
    unless_null $P1412, vivify_459
    new $P1412, "Undef"
  vivify_459:
    $P1413 = $P1412."ast"()
    store_lex "$past", $P1413
.annotate 'line', 511
    find_lex $P1414, "$past"
    find_lex $P1415, "$/"
    unless_null $P1415, vivify_460
    $P1415 = root_new ['parrot';'Hash']
  vivify_460:
    set $P1416, $P1415["param_var"]
    unless_null $P1416, vivify_461
    $P1416 = root_new ['parrot';'Hash']
  vivify_461:
    set $P1417, $P1416["name"]
    unless_null $P1417, vivify_462
    new $P1417, "Undef"
  vivify_462:
    set $S1418, $P1417
    $P1414."named"($S1418)
.annotate 'line', 512
    find_lex $P1419, "$/"
    find_lex $P1420, "$past"
    $P1421 = $P1419."!make"($P1420)
.annotate 'line', 509
    .return ($P1421)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1422, exception, "payload"
    .return ($P1422)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("83_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1426
    .param pmc param_1427 :optional
    .param int has_param_1427 :opt_flag
.annotate 'line', 515
    .const 'Sub' $P1497 = "85_1275160395.4197" 
    capture_lex $P1497
    .const 'Sub' $P1469 = "84_1275160395.4197" 
    capture_lex $P1469
    new $P1425, 'ExceptionHandler'
    set_addr $P1425, control_1424
    $P1425."handle_types"(57)
    push_eh $P1425
    .lex "self", self
    .lex "$/", param_1426
    if has_param_1427, optparam_463
    new $P1428, "Undef"
    set param_1427, $P1428
  optparam_463:
    .lex "$key", param_1427
.annotate 'line', 516
    $P1429 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1429
.annotate 'line', 519
    new $P1430, "Undef"
    .lex "$name", $P1430
.annotate 'line', 520
    new $P1431, "Undef"
    .lex "$past", $P1431
.annotate 'line', 516

        $P1432 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1432
.annotate 'line', 519
    find_lex $P1433, "$/"
    unless_null $P1433, vivify_464
    $P1433 = root_new ['parrot';'Hash']
  vivify_464:
    set $P1434, $P1433["deflongname"]
    unless_null $P1434, vivify_465
    new $P1434, "Undef"
  vivify_465:
    $P1435 = $P1434."ast"()
    set $S1436, $P1435
    new $P1437, 'String'
    set $P1437, $S1436
    store_lex "$name", $P1437
    find_lex $P1438, "$past"
.annotate 'line', 521
    find_lex $P1440, "$/"
    unless_null $P1440, vivify_466
    $P1440 = root_new ['parrot';'Hash']
  vivify_466:
    set $P1441, $P1440["proto"]
    unless_null $P1441, vivify_467
    new $P1441, "Undef"
  vivify_467:
    if $P1441, if_1439
.annotate 'line', 548
    find_lex $P1465, "$key"
    set $S1466, $P1465
    iseq $I1467, $S1466, "open"
    if $I1467, if_1464
.annotate 'line', 561
    .const 'Sub' $P1497 = "85_1275160395.4197" 
    capture_lex $P1497
    $P1497()
    goto if_1464_end
  if_1464:
.annotate 'line', 548
    .const 'Sub' $P1469 = "84_1275160395.4197" 
    capture_lex $P1469
    $P1469()
  if_1464_end:
    goto if_1439_end
  if_1439:
.annotate 'line', 523
    get_hll_global $P1442, ["PAST"], "Stmts"
.annotate 'line', 524
    get_hll_global $P1443, ["PAST"], "Block"
    find_lex $P1444, "$name"
.annotate 'line', 525
    get_hll_global $P1445, ["PAST"], "Op"
.annotate 'line', 526
    get_hll_global $P1446, ["PAST"], "Var"
    $P1447 = $P1446."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1448, "$name"
    $P1449 = $P1445."new"($P1447, $P1448, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 525
    find_lex $P1450, "$/"
    $P1451 = $P1443."new"($P1449, $P1444 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1450 :named("node"))
.annotate 'line', 535
    get_hll_global $P1452, ["PAST"], "Block"
    new $P1453, "String"
    assign $P1453, "!PREFIX__"
    find_lex $P1454, "$name"
    concat $P1455, $P1453, $P1454
.annotate 'line', 536
    get_hll_global $P1456, ["PAST"], "Op"
.annotate 'line', 537
    get_hll_global $P1457, ["PAST"], "Var"
    $P1458 = $P1457."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1459, "$name"
    $P1460 = $P1456."new"($P1458, $P1459, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 536
    find_lex $P1461, "$/"
    $P1462 = $P1452."new"($P1460, $P1455 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1461 :named("node"))
.annotate 'line', 535
    $P1463 = $P1442."new"($P1451, $P1462)
.annotate 'line', 523
    store_lex "$past", $P1463
  if_1439_end:
.annotate 'line', 575
    find_lex $P1518, "$/"
    find_lex $P1519, "$past"
    $P1520 = $P1518."!make"($P1519)
.annotate 'line', 515
    .return ($P1520)
  control_1424:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1521, exception, "payload"
    .return ($P1521)
.end


.namespace ["NQP";"Actions"]
.sub "_block1496"  :anon :subid("85_1275160395.4197") :outer("83_1275160395.4197")
.annotate 'line', 562
    new $P1498, "Undef"
    .lex "$regex", $P1498
.annotate 'line', 563
    get_hll_global $P1499, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1500, "$/"
    unless_null $P1500, vivify_468
    $P1500 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1501, $P1500["p6regex"]
    unless_null $P1501, vivify_469
    new $P1501, "Undef"
  vivify_469:
    $P1502 = $P1501."ast"()
    get_global $P1503, "@BLOCK"
    $P1504 = $P1503."shift"()
    $P1505 = $P1499($P1502, $P1504)
    store_lex "$regex", $P1505
.annotate 'line', 564
    find_lex $P1506, "$regex"
    find_lex $P1507, "$name"
    $P1506."name"($P1507)
.annotate 'line', 566
    get_hll_global $P1508, ["PAST"], "Op"
.annotate 'line', 568
    get_hll_global $P1509, ["PAST"], "Var"
    new $P1510, "ResizablePMCArray"
    push $P1510, "Regex"
    $P1511 = $P1509."new"("Method" :named("name"), $P1510 :named("namespace"), "package" :named("scope"))
    find_lex $P1512, "$regex"
    $P1513 = $P1508."new"($P1511, $P1512, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 566
    store_lex "$past", $P1513
.annotate 'line', 572
    find_lex $P1514, "$regex"
    find_lex $P1515, "$past"
    unless_null $P1515, vivify_470
    $P1515 = root_new ['parrot';'Hash']
    store_lex "$past", $P1515
  vivify_470:
    set $P1515["sink"], $P1514
.annotate 'line', 573
    find_lex $P1516, "@MODIFIERS"
    $P1517 = $P1516."shift"()
.annotate 'line', 561
    .return ($P1517)
.end


.namespace ["NQP";"Actions"]
.sub "_block1468"  :anon :subid("84_1275160395.4197") :outer("83_1275160395.4197")
.annotate 'line', 549
    $P1470 = root_new ['parrot';'Hash']
    .lex "%h", $P1470
.annotate 'line', 548
    find_lex $P1471, "%h"
.annotate 'line', 550
    find_lex $P1473, "$/"
    unless_null $P1473, vivify_471
    $P1473 = root_new ['parrot';'Hash']
  vivify_471:
    set $P1474, $P1473["sym"]
    unless_null $P1474, vivify_472
    new $P1474, "Undef"
  vivify_472:
    set $S1475, $P1474
    iseq $I1476, $S1475, "token"
    unless $I1476, if_1472_end
    new $P1477, "Integer"
    assign $P1477, 1
    find_lex $P1478, "%h"
    unless_null $P1478, vivify_473
    $P1478 = root_new ['parrot';'Hash']
    store_lex "%h", $P1478
  vivify_473:
    set $P1478["r"], $P1477
  if_1472_end:
.annotate 'line', 551
    find_lex $P1480, "$/"
    unless_null $P1480, vivify_474
    $P1480 = root_new ['parrot';'Hash']
  vivify_474:
    set $P1481, $P1480["sym"]
    unless_null $P1481, vivify_475
    new $P1481, "Undef"
  vivify_475:
    set $S1482, $P1481
    iseq $I1483, $S1482, "rule"
    unless $I1483, if_1479_end
    new $P1484, "Integer"
    assign $P1484, 1
    find_lex $P1485, "%h"
    unless_null $P1485, vivify_476
    $P1485 = root_new ['parrot';'Hash']
    store_lex "%h", $P1485
  vivify_476:
    set $P1485["r"], $P1484
    new $P1486, "Integer"
    assign $P1486, 1
    find_lex $P1487, "%h"
    unless_null $P1487, vivify_477
    $P1487 = root_new ['parrot';'Hash']
    store_lex "%h", $P1487
  vivify_477:
    set $P1487["s"], $P1486
  if_1479_end:
.annotate 'line', 552
    find_lex $P1488, "@MODIFIERS"
    find_lex $P1489, "%h"
    $P1488."unshift"($P1489)
.annotate 'line', 553

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 557
    get_global $P1490, "@BLOCK"
    unless_null $P1490, vivify_478
    $P1490 = root_new ['parrot';'ResizablePMCArray']
  vivify_478:
    set $P1491, $P1490[0]
    unless_null $P1491, vivify_479
    new $P1491, "Undef"
  vivify_479:
    $P1491."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 558
    get_global $P1492, "@BLOCK"
    unless_null $P1492, vivify_480
    $P1492 = root_new ['parrot';'ResizablePMCArray']
  vivify_480:
    set $P1493, $P1492[0]
    unless_null $P1493, vivify_481
    new $P1493, "Undef"
  vivify_481:
    $P1493."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 559
    new $P1494, "Exception"
    set $P1494['type'], 57
    new $P1495, "Integer"
    assign $P1495, 0
    setattribute $P1494, 'payload', $P1495
    throw $P1494
.annotate 'line', 548
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("86_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1525
.annotate 'line', 579
    new $P1524, 'ExceptionHandler'
    set_addr $P1524, control_1523
    $P1524."handle_types"(57)
    push_eh $P1524
    .lex "self", self
    .lex "$/", param_1525
.annotate 'line', 580
    new $P1526, "Undef"
    .lex "$past", $P1526
    find_lex $P1529, "$/"
    unless_null $P1529, vivify_482
    $P1529 = root_new ['parrot';'Hash']
  vivify_482:
    set $P1530, $P1529["args"]
    unless_null $P1530, vivify_483
    new $P1530, "Undef"
  vivify_483:
    if $P1530, if_1528
    get_hll_global $P1535, ["PAST"], "Op"
    find_lex $P1536, "$/"
    $P1537 = $P1535."new"($P1536 :named("node"))
    set $P1527, $P1537
    goto if_1528_end
  if_1528:
    find_lex $P1531, "$/"
    unless_null $P1531, vivify_484
    $P1531 = root_new ['parrot';'Hash']
  vivify_484:
    set $P1532, $P1531["args"]
    unless_null $P1532, vivify_485
    $P1532 = root_new ['parrot';'ResizablePMCArray']
  vivify_485:
    set $P1533, $P1532[0]
    unless_null $P1533, vivify_486
    new $P1533, "Undef"
  vivify_486:
    $P1534 = $P1533."ast"()
    set $P1527, $P1534
  if_1528_end:
    store_lex "$past", $P1527
.annotate 'line', 581
    find_lex $P1538, "$past"
    find_lex $P1541, "$/"
    unless_null $P1541, vivify_487
    $P1541 = root_new ['parrot';'Hash']
  vivify_487:
    set $P1542, $P1541["quote"]
    unless_null $P1542, vivify_488
    new $P1542, "Undef"
  vivify_488:
    if $P1542, if_1540
    find_lex $P1546, "$/"
    unless_null $P1546, vivify_489
    $P1546 = root_new ['parrot';'Hash']
  vivify_489:
    set $P1547, $P1546["longname"]
    unless_null $P1547, vivify_490
    new $P1547, "Undef"
  vivify_490:
    set $S1548, $P1547
    new $P1539, 'String'
    set $P1539, $S1548
    goto if_1540_end
  if_1540:
    find_lex $P1543, "$/"
    unless_null $P1543, vivify_491
    $P1543 = root_new ['parrot';'Hash']
  vivify_491:
    set $P1544, $P1543["quote"]
    unless_null $P1544, vivify_492
    new $P1544, "Undef"
  vivify_492:
    $P1545 = $P1544."ast"()
    set $P1539, $P1545
  if_1540_end:
    $P1538."name"($P1539)
.annotate 'line', 582
    find_lex $P1549, "$past"
    $P1549."pasttype"("callmethod")
.annotate 'line', 583
    find_lex $P1550, "$/"
    find_lex $P1551, "$past"
    $P1552 = $P1550."!make"($P1551)
.annotate 'line', 579
    .return ($P1552)
  control_1523:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1553, exception, "payload"
    .return ($P1553)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("87_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1557
.annotate 'line', 588
    new $P1556, 'ExceptionHandler'
    set_addr $P1556, control_1555
    $P1556."handle_types"(57)
    push_eh $P1556
    .lex "self", self
    .lex "$/", param_1557
.annotate 'line', 589
    find_lex $P1558, "$/"
    get_hll_global $P1559, ["PAST"], "Var"
    $P1560 = $P1559."new"("self" :named("name"))
    $P1561 = $P1558."!make"($P1560)
.annotate 'line', 588
    .return ($P1561)
  control_1555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1562, exception, "payload"
    .return ($P1562)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("88_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1566
.annotate 'line', 592
    new $P1565, 'ExceptionHandler'
    set_addr $P1565, control_1564
    $P1565."handle_types"(57)
    push_eh $P1565
    .lex "self", self
    .lex "$/", param_1566
.annotate 'line', 593
    new $P1567, "Undef"
    .lex "$past", $P1567
    find_lex $P1568, "$/"
    unless_null $P1568, vivify_493
    $P1568 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1569, $P1568["args"]
    unless_null $P1569, vivify_494
    new $P1569, "Undef"
  vivify_494:
    $P1570 = $P1569."ast"()
    store_lex "$past", $P1570
.annotate 'line', 594
    find_lex $P1571, "$past"
    find_lex $P1572, "$/"
    unless_null $P1572, vivify_495
    $P1572 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1573, $P1572["identifier"]
    unless_null $P1573, vivify_496
    new $P1573, "Undef"
  vivify_496:
    set $S1574, $P1573
    $P1571."name"($S1574)
.annotate 'line', 595
    find_lex $P1575, "$/"
    find_lex $P1576, "$past"
    $P1577 = $P1575."!make"($P1576)
.annotate 'line', 592
    .return ($P1577)
  control_1564:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1578, exception, "payload"
    .return ($P1578)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("89_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1582
.annotate 'line', 598
    new $P1581, 'ExceptionHandler'
    set_addr $P1581, control_1580
    $P1581."handle_types"(57)
    push_eh $P1581
    .lex "self", self
    .lex "$/", param_1582
.annotate 'line', 599
    $P1583 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1583
.annotate 'line', 600
    new $P1584, "Undef"
    .lex "$name", $P1584
.annotate 'line', 602
    new $P1585, "Undef"
    .lex "$var", $P1585
.annotate 'line', 604
    new $P1586, "Undef"
    .lex "$past", $P1586
.annotate 'line', 599
    find_lex $P1587, "$/"
    unless_null $P1587, vivify_497
    $P1587 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1588, $P1587["name"]
    unless_null $P1588, vivify_498
    $P1588 = root_new ['parrot';'Hash']
  vivify_498:
    set $P1589, $P1588["identifier"]
    unless_null $P1589, vivify_499
    new $P1589, "Undef"
  vivify_499:
    clone $P1590, $P1589
    store_lex "@ns", $P1590
.annotate 'line', 600
    find_lex $P1591, "@ns"
    $P1592 = $P1591."pop"()
    store_lex "$name", $P1592
.annotate 'line', 601
    find_lex $P1596, "@ns"
    if $P1596, if_1595
    set $P1594, $P1596
    goto if_1595_end
  if_1595:
    find_lex $P1597, "@ns"
    unless_null $P1597, vivify_500
    $P1597 = root_new ['parrot';'ResizablePMCArray']
  vivify_500:
    set $P1598, $P1597[0]
    unless_null $P1598, vivify_501
    new $P1598, "Undef"
  vivify_501:
    set $S1599, $P1598
    iseq $I1600, $S1599, "GLOBAL"
    new $P1594, 'Integer'
    set $P1594, $I1600
  if_1595_end:
    unless $P1594, if_1593_end
    find_lex $P1601, "@ns"
    $P1601."shift"()
  if_1593_end:
.annotate 'line', 603
    get_hll_global $P1602, ["PAST"], "Var"
    find_lex $P1603, "$name"
    set $S1604, $P1603
    find_lex $P1605, "@ns"
    $P1606 = $P1602."new"($S1604 :named("name"), $P1605 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1606
.annotate 'line', 604
    find_lex $P1607, "$var"
    store_lex "$past", $P1607
.annotate 'line', 605
    find_lex $P1609, "$/"
    unless_null $P1609, vivify_502
    $P1609 = root_new ['parrot';'Hash']
  vivify_502:
    set $P1610, $P1609["args"]
    unless_null $P1610, vivify_503
    new $P1610, "Undef"
  vivify_503:
    unless $P1610, if_1608_end
.annotate 'line', 606
    find_lex $P1611, "$/"
    unless_null $P1611, vivify_504
    $P1611 = root_new ['parrot';'Hash']
  vivify_504:
    set $P1612, $P1611["args"]
    unless_null $P1612, vivify_505
    $P1612 = root_new ['parrot';'ResizablePMCArray']
  vivify_505:
    set $P1613, $P1612[0]
    unless_null $P1613, vivify_506
    new $P1613, "Undef"
  vivify_506:
    $P1614 = $P1613."ast"()
    store_lex "$past", $P1614
.annotate 'line', 607
    find_lex $P1615, "$past"
    find_lex $P1616, "$var"
    $P1615."unshift"($P1616)
  if_1608_end:
.annotate 'line', 609
    find_lex $P1617, "$/"
    find_lex $P1618, "$past"
    $P1619 = $P1617."!make"($P1618)
.annotate 'line', 598
    .return ($P1619)
  control_1580:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1620, exception, "payload"
    .return ($P1620)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("90_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1624
.annotate 'line', 612
    new $P1623, 'ExceptionHandler'
    set_addr $P1623, control_1622
    $P1623."handle_types"(57)
    push_eh $P1623
    .lex "self", self
    .lex "$/", param_1624
.annotate 'line', 613
    new $P1625, "Undef"
    .lex "$past", $P1625
.annotate 'line', 614
    new $P1626, "Undef"
    .lex "$pirop", $P1626
.annotate 'line', 613
    find_lex $P1629, "$/"
    unless_null $P1629, vivify_507
    $P1629 = root_new ['parrot';'Hash']
  vivify_507:
    set $P1630, $P1629["args"]
    unless_null $P1630, vivify_508
    new $P1630, "Undef"
  vivify_508:
    if $P1630, if_1628
    get_hll_global $P1635, ["PAST"], "Op"
    find_lex $P1636, "$/"
    $P1637 = $P1635."new"($P1636 :named("node"))
    set $P1627, $P1637
    goto if_1628_end
  if_1628:
    find_lex $P1631, "$/"
    unless_null $P1631, vivify_509
    $P1631 = root_new ['parrot';'Hash']
  vivify_509:
    set $P1632, $P1631["args"]
    unless_null $P1632, vivify_510
    $P1632 = root_new ['parrot';'ResizablePMCArray']
  vivify_510:
    set $P1633, $P1632[0]
    unless_null $P1633, vivify_511
    new $P1633, "Undef"
  vivify_511:
    $P1634 = $P1633."ast"()
    set $P1627, $P1634
  if_1628_end:
    store_lex "$past", $P1627
.annotate 'line', 614
    find_lex $P1638, "$/"
    unless_null $P1638, vivify_512
    $P1638 = root_new ['parrot';'Hash']
  vivify_512:
    set $P1639, $P1638["op"]
    unless_null $P1639, vivify_513
    new $P1639, "Undef"
  vivify_513:
    set $S1640, $P1639
    new $P1641, 'String'
    set $P1641, $S1640
    store_lex "$pirop", $P1641
.annotate 'line', 615

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1642 = box $S0
    
    store_lex "$pirop", $P1642
.annotate 'line', 622
    find_lex $P1643, "$past"
    find_lex $P1644, "$pirop"
    $P1643."pirop"($P1644)
.annotate 'line', 623
    find_lex $P1645, "$past"
    $P1645."pasttype"("pirop")
.annotate 'line', 624
    find_lex $P1646, "$/"
    find_lex $P1647, "$past"
    $P1648 = $P1646."!make"($P1647)
.annotate 'line', 612
    .return ($P1648)
  control_1622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1649, exception, "payload"
    .return ($P1649)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("91_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1653
.annotate 'line', 627
    new $P1652, 'ExceptionHandler'
    set_addr $P1652, control_1651
    $P1652."handle_types"(57)
    push_eh $P1652
    .lex "self", self
    .lex "$/", param_1653
    find_lex $P1654, "$/"
    find_lex $P1655, "$/"
    unless_null $P1655, vivify_514
    $P1655 = root_new ['parrot';'Hash']
  vivify_514:
    set $P1656, $P1655["arglist"]
    unless_null $P1656, vivify_515
    new $P1656, "Undef"
  vivify_515:
    $P1657 = $P1656."ast"()
    $P1658 = $P1654."!make"($P1657)
    .return ($P1658)
  control_1651:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1659, exception, "payload"
    .return ($P1659)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("92_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1663
.annotate 'line', 629
    .const 'Sub' $P1674 = "93_1275160395.4197" 
    capture_lex $P1674
    new $P1662, 'ExceptionHandler'
    set_addr $P1662, control_1661
    $P1662."handle_types"(57)
    push_eh $P1662
    .lex "self", self
    .lex "$/", param_1663
.annotate 'line', 630
    new $P1664, "Undef"
    .lex "$past", $P1664
.annotate 'line', 638
    new $P1665, "Undef"
    .lex "$i", $P1665
.annotate 'line', 639
    new $P1666, "Undef"
    .lex "$n", $P1666
.annotate 'line', 630
    get_hll_global $P1667, ["PAST"], "Op"
    find_lex $P1668, "$/"
    $P1669 = $P1667."new"("call" :named("pasttype"), $P1668 :named("node"))
    store_lex "$past", $P1669
.annotate 'line', 631
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_516
    $P1671 = root_new ['parrot';'Hash']
  vivify_516:
    set $P1672, $P1671["EXPR"]
    unless_null $P1672, vivify_517
    new $P1672, "Undef"
  vivify_517:
    unless $P1672, if_1670_end
    .const 'Sub' $P1674 = "93_1275160395.4197" 
    capture_lex $P1674
    $P1674()
  if_1670_end:
.annotate 'line', 638
    new $P1706, "Integer"
    assign $P1706, 0
    store_lex "$i", $P1706
.annotate 'line', 639
    find_lex $P1707, "$past"
    $P1708 = $P1707."list"()
    set $N1709, $P1708
    new $P1710, 'Float'
    set $P1710, $N1709
    store_lex "$n", $P1710
.annotate 'line', 640
    new $P1758, 'ExceptionHandler'
    set_addr $P1758, loop1757_handler
    $P1758."handle_types"(64, 66, 65)
    push_eh $P1758
  loop1757_test:
    find_lex $P1711, "$i"
    set $N1712, $P1711
    find_lex $P1713, "$n"
    set $N1714, $P1713
    islt $I1715, $N1712, $N1714
    unless $I1715, loop1757_done
  loop1757_redo:
.annotate 'line', 641
    find_lex $P1717, "$i"
    set $I1718, $P1717
    find_lex $P1719, "$past"
    unless_null $P1719, vivify_521
    $P1719 = root_new ['parrot';'ResizablePMCArray']
  vivify_521:
    set $P1720, $P1719[$I1718]
    unless_null $P1720, vivify_522
    new $P1720, "Undef"
  vivify_522:
    $S1721 = $P1720."name"()
    iseq $I1722, $S1721, "&prefix:<|>"
    unless $I1722, if_1716_end
.annotate 'line', 642
    find_lex $P1723, "$i"
    set $I1724, $P1723
    find_lex $P1725, "$past"
    unless_null $P1725, vivify_523
    $P1725 = root_new ['parrot';'ResizablePMCArray']
  vivify_523:
    set $P1726, $P1725[$I1724]
    unless_null $P1726, vivify_524
    $P1726 = root_new ['parrot';'ResizablePMCArray']
  vivify_524:
    set $P1727, $P1726[0]
    unless_null $P1727, vivify_525
    new $P1727, "Undef"
  vivify_525:
    find_lex $P1728, "$i"
    set $I1729, $P1728
    find_lex $P1730, "$past"
    unless_null $P1730, vivify_526
    $P1730 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1730
  vivify_526:
    set $P1730[$I1729], $P1727
.annotate 'line', 643
    find_lex $P1731, "$i"
    set $I1732, $P1731
    find_lex $P1733, "$past"
    unless_null $P1733, vivify_527
    $P1733 = root_new ['parrot';'ResizablePMCArray']
  vivify_527:
    set $P1734, $P1733[$I1732]
    unless_null $P1734, vivify_528
    new $P1734, "Undef"
  vivify_528:
    $P1734."flat"(1)
.annotate 'line', 644
    find_lex $P1738, "$i"
    set $I1739, $P1738
    find_lex $P1740, "$past"
    unless_null $P1740, vivify_529
    $P1740 = root_new ['parrot';'ResizablePMCArray']
  vivify_529:
    set $P1741, $P1740[$I1739]
    unless_null $P1741, vivify_530
    new $P1741, "Undef"
  vivify_530:
    get_hll_global $P1742, ["PAST"], "Val"
    $P1743 = $P1741."isa"($P1742)
    if $P1743, if_1737
    set $P1736, $P1743
    goto if_1737_end
  if_1737:
.annotate 'line', 645
    find_lex $P1744, "$i"
    set $I1745, $P1744
    find_lex $P1746, "$past"
    unless_null $P1746, vivify_531
    $P1746 = root_new ['parrot';'ResizablePMCArray']
  vivify_531:
    set $P1747, $P1746[$I1745]
    unless_null $P1747, vivify_532
    new $P1747, "Undef"
  vivify_532:
    $S1748 = $P1747."name"()
    substr $S1749, $S1748, 0, 1
    iseq $I1750, $S1749, "%"
    new $P1736, 'Integer'
    set $P1736, $I1750
  if_1737_end:
    unless $P1736, if_1735_end
.annotate 'line', 646
    find_lex $P1751, "$i"
    set $I1752, $P1751
    find_lex $P1753, "$past"
    unless_null $P1753, vivify_533
    $P1753 = root_new ['parrot';'ResizablePMCArray']
  vivify_533:
    set $P1754, $P1753[$I1752]
    unless_null $P1754, vivify_534
    new $P1754, "Undef"
  vivify_534:
    $P1754."named"(1)
  if_1735_end:
  if_1716_end:
.annotate 'line', 641
    find_lex $P1755, "$i"
    clone $P1756, $P1755
    inc $P1755
  loop1757_next:
.annotate 'line', 640
    goto loop1757_test
  loop1757_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1759, exception, 'type'
    eq $P1759, 64, loop1757_next
    eq $P1759, 66, loop1757_redo
  loop1757_done:
    pop_eh 
.annotate 'line', 651
    find_lex $P1760, "$/"
    find_lex $P1761, "$past"
    $P1762 = $P1760."!make"($P1761)
.annotate 'line', 629
    .return ($P1762)
  control_1661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1763, exception, "payload"
    .return ($P1763)
.end


.namespace ["NQP";"Actions"]
.sub "_block1673"  :anon :subid("93_1275160395.4197") :outer("92_1275160395.4197")
.annotate 'line', 631
    .const 'Sub' $P1695 = "94_1275160395.4197" 
    capture_lex $P1695
.annotate 'line', 632
    new $P1675, "Undef"
    .lex "$expr", $P1675
    find_lex $P1676, "$/"
    unless_null $P1676, vivify_518
    $P1676 = root_new ['parrot';'Hash']
  vivify_518:
    set $P1677, $P1676["EXPR"]
    unless_null $P1677, vivify_519
    new $P1677, "Undef"
  vivify_519:
    $P1678 = $P1677."ast"()
    store_lex "$expr", $P1678
.annotate 'line', 633
    find_lex $P1683, "$expr"
    $S1684 = $P1683."name"()
    iseq $I1685, $S1684, "&infix:<,>"
    if $I1685, if_1682
    new $P1681, 'Integer'
    set $P1681, $I1685
    goto if_1682_end
  if_1682:
    find_lex $P1686, "$expr"
    $P1687 = $P1686."named"()
    isfalse $I1688, $P1687
    new $P1681, 'Integer'
    set $P1681, $I1688
  if_1682_end:
    if $P1681, if_1680
.annotate 'line', 636
    find_lex $P1703, "$past"
    find_lex $P1704, "$expr"
    $P1705 = $P1703."push"($P1704)
    set $P1679, $P1705
.annotate 'line', 633
    goto if_1680_end
  if_1680:
.annotate 'line', 634
    find_lex $P1690, "$expr"
    $P1691 = $P1690."list"()
    defined $I1692, $P1691
    unless $I1692, for_undef_520
    iter $P1689, $P1691
    new $P1701, 'ExceptionHandler'
    set_addr $P1701, loop1700_handler
    $P1701."handle_types"(64, 66, 65)
    push_eh $P1701
  loop1700_test:
    unless $P1689, loop1700_done
    shift $P1693, $P1689
  loop1700_redo:
    .const 'Sub' $P1695 = "94_1275160395.4197" 
    capture_lex $P1695
    $P1695($P1693)
  loop1700_next:
    goto loop1700_test
  loop1700_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1702, exception, 'type'
    eq $P1702, 64, loop1700_next
    eq $P1702, 66, loop1700_redo
  loop1700_done:
    pop_eh 
  for_undef_520:
.annotate 'line', 633
    set $P1679, $P1689
  if_1680_end:
.annotate 'line', 631
    .return ($P1679)
.end


.namespace ["NQP";"Actions"]
.sub "_block1694"  :anon :subid("94_1275160395.4197") :outer("93_1275160395.4197")
    .param pmc param_1696
.annotate 'line', 634
    .lex "$_", param_1696
    find_lex $P1697, "$past"
    find_lex $P1698, "$_"
    $P1699 = $P1697."push"($P1698)
    .return ($P1699)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("95_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1767
.annotate 'line', 655
    new $P1766, 'ExceptionHandler'
    set_addr $P1766, control_1765
    $P1766."handle_types"(57)
    push_eh $P1766
    .lex "self", self
    .lex "$/", param_1767
    find_lex $P1768, "$/"
    find_lex $P1769, "$/"
    unless_null $P1769, vivify_535
    $P1769 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1770, $P1769["value"]
    unless_null $P1770, vivify_536
    new $P1770, "Undef"
  vivify_536:
    $P1771 = $P1770."ast"()
    $P1772 = $P1768."!make"($P1771)
    .return ($P1772)
  control_1765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1773, exception, "payload"
    .return ($P1773)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("96_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1777
.annotate 'line', 657
    new $P1776, 'ExceptionHandler'
    set_addr $P1776, control_1775
    $P1776."handle_types"(57)
    push_eh $P1776
    .lex "self", self
    .lex "$/", param_1777
.annotate 'line', 658
    find_lex $P1778, "$/"
.annotate 'line', 659
    find_lex $P1781, "$/"
    unless_null $P1781, vivify_537
    $P1781 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1782, $P1781["EXPR"]
    unless_null $P1782, vivify_538
    new $P1782, "Undef"
  vivify_538:
    if $P1782, if_1780
.annotate 'line', 660
    get_hll_global $P1787, ["PAST"], "Op"
    find_lex $P1788, "$/"
    $P1789 = $P1787."new"("list" :named("pasttype"), $P1788 :named("node"))
    set $P1779, $P1789
.annotate 'line', 659
    goto if_1780_end
  if_1780:
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_539
    $P1783 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1784, $P1783["EXPR"]
    unless_null $P1784, vivify_540
    $P1784 = root_new ['parrot';'ResizablePMCArray']
  vivify_540:
    set $P1785, $P1784[0]
    unless_null $P1785, vivify_541
    new $P1785, "Undef"
  vivify_541:
    $P1786 = $P1785."ast"()
    set $P1779, $P1786
  if_1780_end:
    $P1790 = $P1778."!make"($P1779)
.annotate 'line', 657
    .return ($P1790)
  control_1775:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1791, exception, "payload"
    .return ($P1791)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("97_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1795
.annotate 'line', 663
    new $P1794, 'ExceptionHandler'
    set_addr $P1794, control_1793
    $P1794."handle_types"(57)
    push_eh $P1794
    .lex "self", self
    .lex "$/", param_1795
.annotate 'line', 664
    new $P1796, "Undef"
    .lex "$past", $P1796
.annotate 'line', 663
    find_lex $P1797, "$past"
.annotate 'line', 665
    find_lex $P1799, "$/"
    unless_null $P1799, vivify_542
    $P1799 = root_new ['parrot';'Hash']
  vivify_542:
    set $P1800, $P1799["EXPR"]
    unless_null $P1800, vivify_543
    new $P1800, "Undef"
  vivify_543:
    if $P1800, if_1798
.annotate 'line', 672
    get_hll_global $P1812, ["PAST"], "Op"
    $P1813 = $P1812."new"("list" :named("pasttype"))
    store_lex "$past", $P1813
.annotate 'line', 671
    goto if_1798_end
  if_1798:
.annotate 'line', 666
    find_lex $P1801, "$/"
    unless_null $P1801, vivify_544
    $P1801 = root_new ['parrot';'Hash']
  vivify_544:
    set $P1802, $P1801["EXPR"]
    unless_null $P1802, vivify_545
    $P1802 = root_new ['parrot';'ResizablePMCArray']
  vivify_545:
    set $P1803, $P1802[0]
    unless_null $P1803, vivify_546
    new $P1803, "Undef"
  vivify_546:
    $P1804 = $P1803."ast"()
    store_lex "$past", $P1804
.annotate 'line', 667
    find_lex $P1806, "$past"
    $S1807 = $P1806."name"()
    isne $I1808, $S1807, "&infix:<,>"
    unless $I1808, if_1805_end
.annotate 'line', 668
    get_hll_global $P1809, ["PAST"], "Op"
    find_lex $P1810, "$past"
    $P1811 = $P1809."new"($P1810, "list" :named("pasttype"))
    store_lex "$past", $P1811
  if_1805_end:
  if_1798_end:
.annotate 'line', 674
    find_lex $P1814, "$past"
    $P1814."name"("&circumfix:<[ ]>")
.annotate 'line', 675
    find_lex $P1815, "$/"
    find_lex $P1816, "$past"
    $P1817 = $P1815."!make"($P1816)
.annotate 'line', 663
    .return ($P1817)
  control_1793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1818, exception, "payload"
    .return ($P1818)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("98_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1822
.annotate 'line', 678
    new $P1821, 'ExceptionHandler'
    set_addr $P1821, control_1820
    $P1821."handle_types"(57)
    push_eh $P1821
    .lex "self", self
    .lex "$/", param_1822
    find_lex $P1823, "$/"
    find_lex $P1824, "$/"
    unless_null $P1824, vivify_547
    $P1824 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1825, $P1824["quote_EXPR"]
    unless_null $P1825, vivify_548
    new $P1825, "Undef"
  vivify_548:
    $P1826 = $P1825."ast"()
    $P1827 = $P1823."!make"($P1826)
    .return ($P1827)
  control_1820:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1828, exception, "payload"
    .return ($P1828)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("99_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1832
.annotate 'line', 679
    new $P1831, 'ExceptionHandler'
    set_addr $P1831, control_1830
    $P1831."handle_types"(57)
    push_eh $P1831
    .lex "self", self
    .lex "$/", param_1832
    find_lex $P1833, "$/"
    find_lex $P1834, "$/"
    unless_null $P1834, vivify_549
    $P1834 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1835, $P1834["quote_EXPR"]
    unless_null $P1835, vivify_550
    new $P1835, "Undef"
  vivify_550:
    $P1836 = $P1835."ast"()
    $P1837 = $P1833."!make"($P1836)
    .return ($P1837)
  control_1830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1838, exception, "payload"
    .return ($P1838)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("100_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1842
.annotate 'line', 681
    new $P1841, 'ExceptionHandler'
    set_addr $P1841, control_1840
    $P1841."handle_types"(57)
    push_eh $P1841
    .lex "self", self
    .lex "$/", param_1842
.annotate 'line', 682
    new $P1843, "Undef"
    .lex "$past", $P1843
    find_lex $P1846, "$/"
    unless_null $P1846, vivify_551
    $P1846 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1847, $P1846["pblock"]
    unless_null $P1847, vivify_552
    $P1847 = root_new ['parrot';'Hash']
  vivify_552:
    set $P1848, $P1847["blockoid"]
    unless_null $P1848, vivify_553
    $P1848 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1849, $P1848["statementlist"]
    unless_null $P1849, vivify_554
    $P1849 = root_new ['parrot';'Hash']
  vivify_554:
    set $P1850, $P1849["statement"]
    unless_null $P1850, vivify_555
    new $P1850, "Undef"
  vivify_555:
    set $N1851, $P1850
    isgt $I1852, $N1851, 0.0
    if $I1852, if_1845
.annotate 'line', 684
    $P1856 = "vivitype"("%")
    set $P1844, $P1856
.annotate 'line', 682
    goto if_1845_end
  if_1845:
.annotate 'line', 683
    find_lex $P1853, "$/"
    unless_null $P1853, vivify_556
    $P1853 = root_new ['parrot';'Hash']
  vivify_556:
    set $P1854, $P1853["pblock"]
    unless_null $P1854, vivify_557
    new $P1854, "Undef"
  vivify_557:
    $P1855 = $P1854."ast"()
    set $P1844, $P1855
  if_1845_end:
    store_lex "$past", $P1844
.annotate 'line', 685
    new $P1857, "Integer"
    assign $P1857, 1
    find_lex $P1858, "$past"
    unless_null $P1858, vivify_558
    $P1858 = root_new ['parrot';'Hash']
    store_lex "$past", $P1858
  vivify_558:
    set $P1858["bareblock"], $P1857
.annotate 'line', 686
    find_lex $P1859, "$/"
    find_lex $P1860, "$past"
    $P1861 = $P1859."!make"($P1860)
.annotate 'line', 681
    .return ($P1861)
  control_1840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1862, exception, "payload"
    .return ($P1862)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("101_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1866
.annotate 'line', 689
    new $P1865, 'ExceptionHandler'
    set_addr $P1865, control_1864
    $P1865."handle_types"(57)
    push_eh $P1865
    .lex "self", self
    .lex "$/", param_1866
.annotate 'line', 690
    new $P1867, "Undef"
    .lex "$name", $P1867
    find_lex $P1870, "$/"
    unless_null $P1870, vivify_559
    $P1870 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1871, $P1870["sigil"]
    unless_null $P1871, vivify_560
    new $P1871, "Undef"
  vivify_560:
    set $S1872, $P1871
    iseq $I1873, $S1872, "@"
    if $I1873, if_1869
.annotate 'line', 691
    find_lex $P1877, "$/"
    unless_null $P1877, vivify_561
    $P1877 = root_new ['parrot';'Hash']
  vivify_561:
    set $P1878, $P1877["sigil"]
    unless_null $P1878, vivify_562
    new $P1878, "Undef"
  vivify_562:
    set $S1879, $P1878
    iseq $I1880, $S1879, "%"
    if $I1880, if_1876
    new $P1882, "String"
    assign $P1882, "item"
    set $P1875, $P1882
    goto if_1876_end
  if_1876:
    new $P1881, "String"
    assign $P1881, "hash"
    set $P1875, $P1881
  if_1876_end:
    set $P1868, $P1875
.annotate 'line', 690
    goto if_1869_end
  if_1869:
    new $P1874, "String"
    assign $P1874, "list"
    set $P1868, $P1874
  if_1869_end:
    store_lex "$name", $P1868
.annotate 'line', 693
    find_lex $P1883, "$/"
    get_hll_global $P1884, ["PAST"], "Op"
    find_lex $P1885, "$name"
    find_lex $P1886, "$/"
    unless_null $P1886, vivify_563
    $P1886 = root_new ['parrot';'Hash']
  vivify_563:
    set $P1887, $P1886["semilist"]
    unless_null $P1887, vivify_564
    new $P1887, "Undef"
  vivify_564:
    $P1888 = $P1887."ast"()
    $P1889 = $P1884."new"($P1888, "callmethod" :named("pasttype"), $P1885 :named("name"))
    $P1890 = $P1883."!make"($P1889)
.annotate 'line', 689
    .return ($P1890)
  control_1864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1891, exception, "payload"
    .return ($P1891)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("102_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1895
.annotate 'line', 696
    new $P1894, 'ExceptionHandler'
    set_addr $P1894, control_1893
    $P1894."handle_types"(57)
    push_eh $P1894
    .lex "self", self
    .lex "$/", param_1895
    find_lex $P1896, "$/"
    find_lex $P1897, "$/"
    unless_null $P1897, vivify_565
    $P1897 = root_new ['parrot';'Hash']
  vivify_565:
    set $P1898, $P1897["statement"]
    unless_null $P1898, vivify_566
    new $P1898, "Undef"
  vivify_566:
    $P1899 = $P1898."ast"()
    $P1900 = $P1896."!make"($P1899)
    .return ($P1900)
  control_1893:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1901, exception, "payload"
    .return ($P1901)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("103_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1905
.annotate 'line', 698
    new $P1904, 'ExceptionHandler'
    set_addr $P1904, control_1903
    $P1904."handle_types"(57)
    push_eh $P1904
    .lex "self", self
    .lex "$/", param_1905
.annotate 'line', 699
    find_lex $P1906, "$/"
    get_hll_global $P1907, ["PAST"], "Var"
    find_lex $P1908, "$/"
    unless_null $P1908, vivify_567
    $P1908 = root_new ['parrot';'Hash']
  vivify_567:
    set $P1909, $P1908["EXPR"]
    unless_null $P1909, vivify_568
    new $P1909, "Undef"
  vivify_568:
    $P1910 = $P1909."ast"()
.annotate 'line', 701
    $P1911 = "vivitype"("@")
    $P1912 = $P1907."new"($P1910, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P1911 :named("vivibase"))
.annotate 'line', 699
    $P1913 = $P1906."!make"($P1912)
.annotate 'line', 698
    .return ($P1913)
  control_1903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1914, exception, "payload"
    .return ($P1914)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("104_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1918
.annotate 'line', 704
    new $P1917, 'ExceptionHandler'
    set_addr $P1917, control_1916
    $P1917."handle_types"(57)
    push_eh $P1917
    .lex "self", self
    .lex "$/", param_1918
.annotate 'line', 705
    find_lex $P1919, "$/"
    get_hll_global $P1920, ["PAST"], "Var"
    find_lex $P1921, "$/"
    unless_null $P1921, vivify_569
    $P1921 = root_new ['parrot';'Hash']
  vivify_569:
    set $P1922, $P1921["EXPR"]
    unless_null $P1922, vivify_570
    new $P1922, "Undef"
  vivify_570:
    $P1923 = $P1922."ast"()
.annotate 'line', 707
    $P1924 = "vivitype"("%")
    $P1925 = $P1920."new"($P1923, "keyed" :named("scope"), "Undef" :named("viviself"), $P1924 :named("vivibase"))
.annotate 'line', 705
    $P1926 = $P1919."!make"($P1925)
.annotate 'line', 704
    .return ($P1926)
  control_1916:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1927, exception, "payload"
    .return ($P1927)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("105_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1931
.annotate 'line', 710
    new $P1930, 'ExceptionHandler'
    set_addr $P1930, control_1929
    $P1930."handle_types"(57)
    push_eh $P1930
    .lex "self", self
    .lex "$/", param_1931
.annotate 'line', 711
    find_lex $P1932, "$/"
    get_hll_global $P1933, ["PAST"], "Var"
    find_lex $P1934, "$/"
    unless_null $P1934, vivify_571
    $P1934 = root_new ['parrot';'Hash']
  vivify_571:
    set $P1935, $P1934["quote_EXPR"]
    unless_null $P1935, vivify_572
    new $P1935, "Undef"
  vivify_572:
    $P1936 = $P1935."ast"()
.annotate 'line', 713
    $P1937 = "vivitype"("%")
    $P1938 = $P1933."new"($P1936, "keyed" :named("scope"), "Undef" :named("viviself"), $P1937 :named("vivibase"))
.annotate 'line', 711
    $P1939 = $P1932."!make"($P1938)
.annotate 'line', 710
    .return ($P1939)
  control_1929:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1940, exception, "payload"
    .return ($P1940)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("106_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1944
.annotate 'line', 716
    new $P1943, 'ExceptionHandler'
    set_addr $P1943, control_1942
    $P1943."handle_types"(57)
    push_eh $P1943
    .lex "self", self
    .lex "$/", param_1944
.annotate 'line', 717
    find_lex $P1945, "$/"
    find_lex $P1946, "$/"
    unless_null $P1946, vivify_573
    $P1946 = root_new ['parrot';'Hash']
  vivify_573:
    set $P1947, $P1946["arglist"]
    unless_null $P1947, vivify_574
    new $P1947, "Undef"
  vivify_574:
    $P1948 = $P1947."ast"()
    $P1949 = $P1945."!make"($P1948)
.annotate 'line', 716
    .return ($P1949)
  control_1942:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1950, exception, "payload"
    .return ($P1950)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("107_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1954
.annotate 'line', 720
    new $P1953, 'ExceptionHandler'
    set_addr $P1953, control_1952
    $P1953."handle_types"(57)
    push_eh $P1953
    .lex "self", self
    .lex "$/", param_1954
.annotate 'line', 721
    find_lex $P1955, "$/"
    find_lex $P1958, "$/"
    unless_null $P1958, vivify_575
    $P1958 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1959, $P1958["quote"]
    unless_null $P1959, vivify_576
    new $P1959, "Undef"
  vivify_576:
    if $P1959, if_1957
    find_lex $P1963, "$/"
    unless_null $P1963, vivify_577
    $P1963 = root_new ['parrot';'Hash']
  vivify_577:
    set $P1964, $P1963["number"]
    unless_null $P1964, vivify_578
    new $P1964, "Undef"
  vivify_578:
    $P1965 = $P1964."ast"()
    set $P1956, $P1965
    goto if_1957_end
  if_1957:
    find_lex $P1960, "$/"
    unless_null $P1960, vivify_579
    $P1960 = root_new ['parrot';'Hash']
  vivify_579:
    set $P1961, $P1960["quote"]
    unless_null $P1961, vivify_580
    new $P1961, "Undef"
  vivify_580:
    $P1962 = $P1961."ast"()
    set $P1956, $P1962
  if_1957_end:
    $P1966 = $P1955."!make"($P1956)
.annotate 'line', 720
    .return ($P1966)
  control_1952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1967, exception, "payload"
    .return ($P1967)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("108_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1971
.annotate 'line', 724
    new $P1970, 'ExceptionHandler'
    set_addr $P1970, control_1969
    $P1970."handle_types"(57)
    push_eh $P1970
    .lex "self", self
    .lex "$/", param_1971
.annotate 'line', 725
    new $P1972, "Undef"
    .lex "$value", $P1972
    find_lex $P1975, "$/"
    unless_null $P1975, vivify_581
    $P1975 = root_new ['parrot';'Hash']
  vivify_581:
    set $P1976, $P1975["dec_number"]
    unless_null $P1976, vivify_582
    new $P1976, "Undef"
  vivify_582:
    if $P1976, if_1974
    find_lex $P1980, "$/"
    unless_null $P1980, vivify_583
    $P1980 = root_new ['parrot';'Hash']
  vivify_583:
    set $P1981, $P1980["integer"]
    unless_null $P1981, vivify_584
    new $P1981, "Undef"
  vivify_584:
    $P1982 = $P1981."ast"()
    set $P1973, $P1982
    goto if_1974_end
  if_1974:
    find_lex $P1977, "$/"
    unless_null $P1977, vivify_585
    $P1977 = root_new ['parrot';'Hash']
  vivify_585:
    set $P1978, $P1977["dec_number"]
    unless_null $P1978, vivify_586
    new $P1978, "Undef"
  vivify_586:
    $P1979 = $P1978."ast"()
    set $P1973, $P1979
  if_1974_end:
    store_lex "$value", $P1973
.annotate 'line', 726
    find_lex $P1984, "$/"
    unless_null $P1984, vivify_587
    $P1984 = root_new ['parrot';'Hash']
  vivify_587:
    set $P1985, $P1984["sign"]
    unless_null $P1985, vivify_588
    new $P1985, "Undef"
  vivify_588:
    set $S1986, $P1985
    iseq $I1987, $S1986, "-"
    unless $I1987, if_1983_end
    find_lex $P1988, "$value"
    neg $P1989, $P1988
    store_lex "$value", $P1989
  if_1983_end:
.annotate 'line', 727
    find_lex $P1990, "$/"
    get_hll_global $P1991, ["PAST"], "Val"
    find_lex $P1992, "$value"
    $P1993 = $P1991."new"($P1992 :named("value"))
    $P1994 = $P1990."!make"($P1993)
.annotate 'line', 724
    .return ($P1994)
  control_1969:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1995, exception, "payload"
    .return ($P1995)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("109_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_1999
.annotate 'line', 730
    new $P1998, 'ExceptionHandler'
    set_addr $P1998, control_1997
    $P1998."handle_types"(57)
    push_eh $P1998
    .lex "self", self
    .lex "$/", param_1999
    find_lex $P2000, "$/"
    find_lex $P2001, "$/"
    unless_null $P2001, vivify_589
    $P2001 = root_new ['parrot';'Hash']
  vivify_589:
    set $P2002, $P2001["quote_EXPR"]
    unless_null $P2002, vivify_590
    new $P2002, "Undef"
  vivify_590:
    $P2003 = $P2002."ast"()
    $P2004 = $P2000."!make"($P2003)
    .return ($P2004)
  control_1997:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2005, exception, "payload"
    .return ($P2005)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("110_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2009
.annotate 'line', 731
    new $P2008, 'ExceptionHandler'
    set_addr $P2008, control_2007
    $P2008."handle_types"(57)
    push_eh $P2008
    .lex "self", self
    .lex "$/", param_2009
    find_lex $P2010, "$/"
    find_lex $P2011, "$/"
    unless_null $P2011, vivify_591
    $P2011 = root_new ['parrot';'Hash']
  vivify_591:
    set $P2012, $P2011["quote_EXPR"]
    unless_null $P2012, vivify_592
    new $P2012, "Undef"
  vivify_592:
    $P2013 = $P2012."ast"()
    $P2014 = $P2010."!make"($P2013)
    .return ($P2014)
  control_2007:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2015, exception, "payload"
    .return ($P2015)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("111_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2019
.annotate 'line', 732
    new $P2018, 'ExceptionHandler'
    set_addr $P2018, control_2017
    $P2018."handle_types"(57)
    push_eh $P2018
    .lex "self", self
    .lex "$/", param_2019
    find_lex $P2020, "$/"
    find_lex $P2021, "$/"
    unless_null $P2021, vivify_593
    $P2021 = root_new ['parrot';'Hash']
  vivify_593:
    set $P2022, $P2021["quote_EXPR"]
    unless_null $P2022, vivify_594
    new $P2022, "Undef"
  vivify_594:
    $P2023 = $P2022."ast"()
    $P2024 = $P2020."!make"($P2023)
    .return ($P2024)
  control_2017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2025, exception, "payload"
    .return ($P2025)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("112_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2029
.annotate 'line', 733
    new $P2028, 'ExceptionHandler'
    set_addr $P2028, control_2027
    $P2028."handle_types"(57)
    push_eh $P2028
    .lex "self", self
    .lex "$/", param_2029
    find_lex $P2030, "$/"
    find_lex $P2031, "$/"
    unless_null $P2031, vivify_595
    $P2031 = root_new ['parrot';'Hash']
  vivify_595:
    set $P2032, $P2031["quote_EXPR"]
    unless_null $P2032, vivify_596
    new $P2032, "Undef"
  vivify_596:
    $P2033 = $P2032."ast"()
    $P2034 = $P2030."!make"($P2033)
    .return ($P2034)
  control_2027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2035, exception, "payload"
    .return ($P2035)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("113_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2039
.annotate 'line', 734
    new $P2038, 'ExceptionHandler'
    set_addr $P2038, control_2037
    $P2038."handle_types"(57)
    push_eh $P2038
    .lex "self", self
    .lex "$/", param_2039
    find_lex $P2040, "$/"
    find_lex $P2041, "$/"
    unless_null $P2041, vivify_597
    $P2041 = root_new ['parrot';'Hash']
  vivify_597:
    set $P2042, $P2041["quote_EXPR"]
    unless_null $P2042, vivify_598
    new $P2042, "Undef"
  vivify_598:
    $P2043 = $P2042."ast"()
    $P2044 = $P2040."!make"($P2043)
    .return ($P2044)
  control_2037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2045, exception, "payload"
    .return ($P2045)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("114_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2049
.annotate 'line', 735
    new $P2048, 'ExceptionHandler'
    set_addr $P2048, control_2047
    $P2048."handle_types"(57)
    push_eh $P2048
    .lex "self", self
    .lex "$/", param_2049
.annotate 'line', 736
    find_lex $P2050, "$/"
    get_hll_global $P2051, ["PAST"], "Op"
    find_lex $P2052, "$/"
    unless_null $P2052, vivify_599
    $P2052 = root_new ['parrot';'Hash']
  vivify_599:
    set $P2053, $P2052["quote_EXPR"]
    unless_null $P2053, vivify_600
    new $P2053, "Undef"
  vivify_600:
    $P2054 = $P2053."ast"()
    $P2055 = $P2054."value"()
    find_lex $P2056, "$/"
    $P2057 = $P2051."new"($P2055 :named("inline"), "inline" :named("pasttype"), $P2056 :named("node"))
    $P2058 = $P2050."!make"($P2057)
.annotate 'line', 735
    .return ($P2058)
  control_2047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2059, exception, "payload"
    .return ($P2059)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("115_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2063
    .param pmc param_2064 :optional
    .param int has_param_2064 :opt_flag
.annotate 'line', 741
    new $P2062, 'ExceptionHandler'
    set_addr $P2062, control_2061
    $P2062."handle_types"(57)
    push_eh $P2062
    .lex "self", self
    .lex "$/", param_2063
    if has_param_2064, optparam_601
    new $P2065, "Undef"
    set param_2064, $P2065
  optparam_601:
    .lex "$key", param_2064
.annotate 'line', 751
    new $P2066, "Undef"
    .lex "$regex", $P2066
.annotate 'line', 753
    new $P2067, "Undef"
    .lex "$past", $P2067
.annotate 'line', 742
    find_lex $P2069, "$key"
    set $S2070, $P2069
    iseq $I2071, $S2070, "open"
    unless $I2071, if_2068_end
.annotate 'line', 743

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate 'line', 747
    get_global $P2072, "@BLOCK"
    unless_null $P2072, vivify_602
    $P2072 = root_new ['parrot';'ResizablePMCArray']
  vivify_602:
    set $P2073, $P2072[0]
    unless_null $P2073, vivify_603
    new $P2073, "Undef"
  vivify_603:
    $P2073."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 748
    get_global $P2074, "@BLOCK"
    unless_null $P2074, vivify_604
    $P2074 = root_new ['parrot';'ResizablePMCArray']
  vivify_604:
    set $P2075, $P2074[0]
    unless_null $P2075, vivify_605
    new $P2075, "Undef"
  vivify_605:
    $P2075."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 749
    new $P2076, "Exception"
    set $P2076['type'], 57
    new $P2077, "Integer"
    assign $P2077, 0
    setattribute $P2076, 'payload', $P2077
    throw $P2076
  if_2068_end:
.annotate 'line', 752
    get_hll_global $P2078, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2079, "$/"
    unless_null $P2079, vivify_606
    $P2079 = root_new ['parrot';'Hash']
  vivify_606:
    set $P2080, $P2079["p6regex"]
    unless_null $P2080, vivify_607
    new $P2080, "Undef"
  vivify_607:
    $P2081 = $P2080."ast"()
    get_global $P2082, "@BLOCK"
    $P2083 = $P2082."shift"()
    $P2084 = $P2078($P2081, $P2083)
    store_lex "$regex", $P2084
.annotate 'line', 754
    get_hll_global $P2085, ["PAST"], "Op"
.annotate 'line', 756
    get_hll_global $P2086, ["PAST"], "Var"
    new $P2087, "ResizablePMCArray"
    push $P2087, "Regex"
    $P2088 = $P2086."new"("Regex" :named("name"), $P2087 :named("namespace"), "package" :named("scope"))
    find_lex $P2089, "$regex"
    $P2090 = $P2085."new"($P2088, $P2089, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 754
    store_lex "$past", $P2090
.annotate 'line', 760
    find_lex $P2091, "$regex"
    find_lex $P2092, "$past"
    unless_null $P2092, vivify_608
    $P2092 = root_new ['parrot';'Hash']
    store_lex "$past", $P2092
  vivify_608:
    set $P2092["sink"], $P2091
.annotate 'line', 761
    find_lex $P2093, "$/"
    find_lex $P2094, "$past"
    $P2095 = $P2093."!make"($P2094)
.annotate 'line', 741
    .return ($P2095)
  control_2061:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2096, exception, "payload"
    .return ($P2096)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("116_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2100
.annotate 'line', 764
    new $P2099, 'ExceptionHandler'
    set_addr $P2099, control_2098
    $P2099."handle_types"(57)
    push_eh $P2099
    .lex "self", self
    .lex "$/", param_2100
    find_lex $P2101, "$/"
    find_lex $P2102, "$/"
    unless_null $P2102, vivify_609
    $P2102 = root_new ['parrot';'Hash']
  vivify_609:
    set $P2103, $P2102["variable"]
    unless_null $P2103, vivify_610
    new $P2103, "Undef"
  vivify_610:
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
.sub "quote_escape:sym<{ }>"  :subid("117_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2110
.annotate 'line', 765
    new $P2109, 'ExceptionHandler'
    set_addr $P2109, control_2108
    $P2109."handle_types"(57)
    push_eh $P2109
    .lex "self", self
    .lex "$/", param_2110
.annotate 'line', 766
    find_lex $P2111, "$/"
    get_hll_global $P2112, ["PAST"], "Op"
.annotate 'line', 767
    find_lex $P2113, "$/"
    unless_null $P2113, vivify_611
    $P2113 = root_new ['parrot';'Hash']
  vivify_611:
    set $P2114, $P2113["block"]
    unless_null $P2114, vivify_612
    new $P2114, "Undef"
  vivify_612:
    $P2115 = $P2114."ast"()
    $P2116 = "block_immediate"($P2115)
    find_lex $P2117, "$/"
    $P2118 = $P2112."new"($P2116, "set S*" :named("pirop"), $P2117 :named("node"))
.annotate 'line', 766
    $P2119 = $P2111."!make"($P2118)
.annotate 'line', 765
    .return ($P2119)
  control_2108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2120, exception, "payload"
    .return ($P2120)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<esc>"  :subid("118_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2124
.annotate 'line', 770
    new $P2123, 'ExceptionHandler'
    set_addr $P2123, control_2122
    $P2123."handle_types"(57)
    push_eh $P2123
    .lex "self", self
    .lex "$/", param_2124
    find_lex $P2125, "$/"
    $P2126 = $P2125."!make"("\e")
    .return ($P2126)
  control_2122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2127, exception, "payload"
    .return ($P2127)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("119_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2131
.annotate 'line', 774
    new $P2130, 'ExceptionHandler'
    set_addr $P2130, control_2129
    $P2130."handle_types"(57)
    push_eh $P2130
    .lex "self", self
    .lex "$/", param_2131
    find_lex $P2132, "$/"
    find_lex $P2133, "$/"
    unless_null $P2133, vivify_613
    $P2133 = root_new ['parrot';'Hash']
  vivify_613:
    set $P2134, $P2133["dotty"]
    unless_null $P2134, vivify_614
    new $P2134, "Undef"
  vivify_614:
    $P2135 = $P2134."ast"()
    $P2136 = $P2132."!make"($P2135)
    .return ($P2136)
  control_2129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2137, exception, "payload"
    .return ($P2137)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("120_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2141
.annotate 'line', 776
    new $P2140, 'ExceptionHandler'
    set_addr $P2140, control_2139
    $P2140."handle_types"(57)
    push_eh $P2140
    .lex "self", self
    .lex "$/", param_2141
.annotate 'line', 777
    find_lex $P2142, "$/"
    get_hll_global $P2143, ["PAST"], "Op"
.annotate 'line', 778
    new $P2144, "ResizablePMCArray"
    push $P2144, "    clone %r, %0"
    push $P2144, "    inc %0"
    $P2145 = $P2143."new"("postfix:<++>" :named("name"), $P2144 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 777
    $P2146 = $P2142."!make"($P2145)
.annotate 'line', 776
    .return ($P2146)
  control_2139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2147, exception, "payload"
    .return ($P2147)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("121_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2151
.annotate 'line', 782
    new $P2150, 'ExceptionHandler'
    set_addr $P2150, control_2149
    $P2150."handle_types"(57)
    push_eh $P2150
    .lex "self", self
    .lex "$/", param_2151
.annotate 'line', 783
    find_lex $P2152, "$/"
    get_hll_global $P2153, ["PAST"], "Op"
.annotate 'line', 784
    new $P2154, "ResizablePMCArray"
    push $P2154, "    clone %r, %0"
    push $P2154, "    dec %0"
    $P2155 = $P2153."new"("postfix:<-->" :named("name"), $P2154 :named("inline"), "inline" :named("pasttype"))
.annotate 'line', 783
    $P2156 = $P2152."!make"($P2155)
.annotate 'line', 782
    .return ($P2156)
  control_2149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2157, exception, "payload"
    .return ($P2157)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("122_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2161
.annotate 'line', 788
    new $P2160, 'ExceptionHandler'
    set_addr $P2160, control_2159
    $P2160."handle_types"(57)
    push_eh $P2160
    .lex "self", self
    .lex "$/", param_2161
.annotate 'line', 789
    find_lex $P2162, "$/"
    get_hll_global $P2163, ["PAST"], "Op"
.annotate 'line', 790
    get_hll_global $P2164, ["PAST"], "Var"
    $P2165 = $P2164."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2166, "$/"
    $P2167 = $P2163."new"($P2165, "callmethod" :named("pasttype"), "!make" :named("name"), $P2166 :named("node"))
.annotate 'line', 789
    $P2168 = $P2162."!make"($P2167)
.annotate 'line', 788
    .return ($P2168)
  control_2159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2169, exception, "payload"
    .return ($P2169)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<next>"  :subid("123_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2174
.annotate 'line', 810
    new $P2173, 'ExceptionHandler'
    set_addr $P2173, control_2172
    $P2173."handle_types"(57)
    push_eh $P2173
    .lex "self", self
    .lex "$/", param_2174
    find_lex $P2175, "$/"
    $P2176 = "control"($P2175, ".CONTROL_LOOP_NEXT")
    .return ($P2176)
  control_2172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2177, exception, "payload"
    .return ($P2177)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<last>"  :subid("124_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2181
.annotate 'line', 811
    new $P2180, 'ExceptionHandler'
    set_addr $P2180, control_2179
    $P2180."handle_types"(57)
    push_eh $P2180
    .lex "self", self
    .lex "$/", param_2181
    find_lex $P2182, "$/"
    $P2183 = "control"($P2182, ".CONTROL_LOOP_LAST")
    .return ($P2183)
  control_2179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2184, exception, "payload"
    .return ($P2184)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<redo>"  :subid("125_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2188
.annotate 'line', 812
    new $P2187, 'ExceptionHandler'
    set_addr $P2187, control_2186
    $P2187."handle_types"(57)
    push_eh $P2187
    .lex "self", self
    .lex "$/", param_2188
    find_lex $P2189, "$/"
    $P2190 = "control"($P2189, ".CONTROL_LOOP_REDO")
    .return ($P2190)
  control_2186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2191, exception, "payload"
    .return ($P2191)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("126_1275160395.4197") :method :outer("11_1275160395.4197")
    .param pmc param_2195
.annotate 'line', 814
    new $P2194, 'ExceptionHandler'
    set_addr $P2194, control_2193
    $P2194."handle_types"(57)
    push_eh $P2194
    .lex "self", self
    .lex "$/", param_2195
.annotate 'line', 815
    find_lex $P2196, "$/"
    get_hll_global $P2197, ["PAST"], "Op"
    find_lex $P2198, "$/"
    $P2199 = $P2197."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2198 :named("node"))
    $P2200 = $P2196."!make"($P2199)
.annotate 'line', 814
    .return ($P2200)
  control_2193:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2201, exception, "payload"
    .return ($P2201)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2202"  :subid("127_1275160395.4197") :outer("11_1275160395.4197")
.annotate 'line', 819
    .const 'Sub' $P2287 = "134_1275160395.4197" 
    capture_lex $P2287
    .const 'Sub' $P2274 = "133_1275160395.4197" 
    capture_lex $P2274
    .const 'Sub' $P2257 = "132_1275160395.4197" 
    capture_lex $P2257
    .const 'Sub' $P2244 = "131_1275160395.4197" 
    capture_lex $P2244
    .const 'Sub' $P2231 = "130_1275160395.4197" 
    capture_lex $P2231
    .const 'Sub' $P2218 = "129_1275160395.4197" 
    capture_lex $P2218
    .const 'Sub' $P2204 = "128_1275160395.4197" 
    capture_lex $P2204
.annotate 'line', 852
    .const 'Sub' $P2287 = "134_1275160395.4197" 
    newclosure $P2312, $P2287
.annotate 'line', 819
    .return ($P2312)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("128_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2207
.annotate 'line', 821
    new $P2206, 'ExceptionHandler'
    set_addr $P2206, control_2205
    $P2206."handle_types"(57)
    push_eh $P2206
    .lex "self", self
    .lex "$/", param_2207
.annotate 'line', 822
    new $P2208, "Undef"
    .lex "$past", $P2208
    find_lex $P2209, "$/"
    unless_null $P2209, vivify_615
    $P2209 = root_new ['parrot';'Hash']
  vivify_615:
    set $P2210, $P2209["statement"]
    unless_null $P2210, vivify_616
    new $P2210, "Undef"
  vivify_616:
    $P2211 = $P2210."ast"()
    store_lex "$past", $P2211
.annotate 'line', 823
    find_lex $P2212, "$/"
    get_hll_global $P2213, ["PAST"], "Regex"
    find_lex $P2214, "$past"
    $P2215 = $P2213."new"($P2214, "pastnode" :named("pasttype"))
    $P2216 = $P2212."!make"($P2215)
.annotate 'line', 821
    .return ($P2216)
  control_2205:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2217, exception, "payload"
    .return ($P2217)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("129_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2221
.annotate 'line', 826
    new $P2220, 'ExceptionHandler'
    set_addr $P2220, control_2219
    $P2220."handle_types"(57)
    push_eh $P2220
    .lex "self", self
    .lex "$/", param_2221
.annotate 'line', 827
    find_lex $P2222, "$/"
    get_hll_global $P2223, ["PAST"], "Regex"
    find_lex $P2224, "$/"
    unless_null $P2224, vivify_617
    $P2224 = root_new ['parrot';'Hash']
  vivify_617:
    set $P2225, $P2224["codeblock"]
    unless_null $P2225, vivify_618
    new $P2225, "Undef"
  vivify_618:
    $P2226 = $P2225."ast"()
    find_lex $P2227, "$/"
    $P2228 = $P2223."new"($P2226, "pastnode" :named("pasttype"), $P2227 :named("node"))
    $P2229 = $P2222."!make"($P2228)
.annotate 'line', 826
    .return ($P2229)
  control_2219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2230, exception, "payload"
    .return ($P2230)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<nqpvar>"  :subid("130_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2234
.annotate 'line', 831
    new $P2233, 'ExceptionHandler'
    set_addr $P2233, control_2232
    $P2233."handle_types"(57)
    push_eh $P2233
    .lex "self", self
    .lex "$/", param_2234
.annotate 'line', 832
    find_lex $P2235, "$/"
    get_hll_global $P2236, ["PAST"], "Regex"
    find_lex $P2237, "$/"
    unless_null $P2237, vivify_619
    $P2237 = root_new ['parrot';'Hash']
  vivify_619:
    set $P2238, $P2237["var"]
    unless_null $P2238, vivify_620
    new $P2238, "Undef"
  vivify_620:
    $P2239 = $P2238."ast"()
    find_lex $P2240, "$/"
    $P2241 = $P2236."new"("!INTERPOLATE", $P2239, "subrule" :named("pasttype"), "method" :named("subtype"), $P2240 :named("node"))
    $P2242 = $P2235."!make"($P2241)
.annotate 'line', 831
    .return ($P2242)
  control_2232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2243, exception, "payload"
    .return ($P2243)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("131_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2247
.annotate 'line', 836
    new $P2246, 'ExceptionHandler'
    set_addr $P2246, control_2245
    $P2246."handle_types"(57)
    push_eh $P2246
    .lex "self", self
    .lex "$/", param_2247
.annotate 'line', 837
    find_lex $P2248, "$/"
    get_hll_global $P2249, ["PAST"], "Regex"
    find_lex $P2250, "$/"
    unless_null $P2250, vivify_621
    $P2250 = root_new ['parrot';'Hash']
  vivify_621:
    set $P2251, $P2250["codeblock"]
    unless_null $P2251, vivify_622
    new $P2251, "Undef"
  vivify_622:
    $P2252 = $P2251."ast"()
    find_lex $P2253, "$/"
    $P2254 = $P2249."new"("!INTERPOLATE_REGEX", $P2252, "subrule" :named("pasttype"), "method" :named("subtype"), $P2253 :named("node"))
    $P2255 = $P2248."!make"($P2254)
.annotate 'line', 836
    .return ($P2255)
  control_2245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2256, exception, "payload"
    .return ($P2256)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<?{ }>"  :subid("132_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2260
.annotate 'line', 841
    new $P2259, 'ExceptionHandler'
    set_addr $P2259, control_2258
    $P2259."handle_types"(57)
    push_eh $P2259
    .lex "self", self
    .lex "$/", param_2260
.annotate 'line', 842
    find_lex $P2261, "$/"
    get_hll_global $P2262, ["PAST"], "Regex"
    find_lex $P2263, "$/"
    unless_null $P2263, vivify_623
    $P2263 = root_new ['parrot';'Hash']
  vivify_623:
    set $P2264, $P2263["codeblock"]
    unless_null $P2264, vivify_624
    new $P2264, "Undef"
  vivify_624:
    $P2265 = $P2264."ast"()
.annotate 'line', 843
    find_lex $P2266, "$/"
    unless_null $P2266, vivify_625
    $P2266 = root_new ['parrot';'Hash']
  vivify_625:
    set $P2267, $P2266["zw"]
    unless_null $P2267, vivify_626
    new $P2267, "Undef"
  vivify_626:
    set $S2268, $P2267
    iseq $I2269, $S2268, "!"
    find_lex $P2270, "$/"
    $P2271 = $P2262."new"($P2265, "zerowidth" :named("subtype"), $I2269 :named("negate"), "pastnode" :named("pasttype"), $P2270 :named("node"))
.annotate 'line', 842
    $P2272 = $P2261."!make"($P2271)
.annotate 'line', 841
    .return ($P2272)
  control_2258:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2273, exception, "payload"
    .return ($P2273)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<var>"  :subid("133_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2277
.annotate 'line', 847
    new $P2276, 'ExceptionHandler'
    set_addr $P2276, control_2275
    $P2276."handle_types"(57)
    push_eh $P2276
    .lex "self", self
    .lex "$/", param_2277
.annotate 'line', 848
    find_lex $P2278, "$/"
    get_hll_global $P2279, ["PAST"], "Regex"
    find_lex $P2280, "$/"
    unless_null $P2280, vivify_627
    $P2280 = root_new ['parrot';'Hash']
  vivify_627:
    set $P2281, $P2280["var"]
    unless_null $P2281, vivify_628
    new $P2281, "Undef"
  vivify_628:
    $P2282 = $P2281."ast"()
    find_lex $P2283, "$/"
    $P2284 = $P2279."new"("!INTERPOLATE_REGEX", $P2282, "subrule" :named("pasttype"), "method" :named("subtype"), $P2283 :named("node"))
    $P2285 = $P2278."!make"($P2284)
.annotate 'line', 847
    .return ($P2285)
  control_2275:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2286, exception, "payload"
    .return ($P2286)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("134_1275160395.4197") :method :outer("127_1275160395.4197")
    .param pmc param_2290
.annotate 'line', 852
    new $P2289, 'ExceptionHandler'
    set_addr $P2289, control_2288
    $P2289."handle_types"(57)
    push_eh $P2289
    .lex "self", self
    .lex "$/", param_2290
.annotate 'line', 853
    new $P2291, "Undef"
    .lex "$block", $P2291
.annotate 'line', 855
    new $P2292, "Undef"
    .lex "$past", $P2292
.annotate 'line', 853
    find_lex $P2293, "$/"
    unless_null $P2293, vivify_629
    $P2293 = root_new ['parrot';'Hash']
  vivify_629:
    set $P2294, $P2293["block"]
    unless_null $P2294, vivify_630
    new $P2294, "Undef"
  vivify_630:
    $P2295 = $P2294."ast"()
    store_lex "$block", $P2295
.annotate 'line', 854
    find_lex $P2296, "$block"
    $P2296."blocktype"("immediate")
.annotate 'line', 856
    get_hll_global $P2297, ["PAST"], "Stmts"
.annotate 'line', 857
    get_hll_global $P2298, ["PAST"], "Op"
.annotate 'line', 858
    get_hll_global $P2299, ["PAST"], "Var"
    $P2300 = $P2299."new"("$/" :named("name"))
.annotate 'line', 859
    get_hll_global $P2301, ["PAST"], "Op"
.annotate 'line', 860
    get_hll_global $P2302, ["PAST"], "Var"
    $P2303 = $P2302."new"(unicode:"$\x{a2}" :named("name"))
    $P2304 = $P2301."new"($P2303, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 859
    $P2305 = $P2298."new"($P2300, $P2304, "bind" :named("pasttype"))
.annotate 'line', 857
    find_lex $P2306, "$block"
    $P2307 = $P2297."new"($P2305, $P2306)
.annotate 'line', 856
    store_lex "$past", $P2307
.annotate 'line', 868
    find_lex $P2308, "$/"
    find_lex $P2309, "$past"
    $P2310 = $P2308."!make"($P2309)
.annotate 'line', 852
    .return ($P2310)
  control_2288:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2311, exception, "payload"
    .return ($P2311)
.end


.namespace ["NQP";"Actions"]
.sub "_block2314" :load :anon :subid("135_1275160395.4197")
.annotate 'line', 3
    .const 'Sub' $P2316 = "11_1275160395.4197" 
    $P2317 = $P2316()
    .return ($P2317)
.end


.namespace []
.sub "_block2324" :load :anon :subid("137_1275160395.4197")
.annotate 'line', 1
    .const 'Sub' $P2326 = "10_1275160395.4197" 
    $P2327 = $P2326()
    .return ($P2327)
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
