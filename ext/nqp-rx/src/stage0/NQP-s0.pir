# Copyright (C) 2009, The Perl Foundation.

=head1 NAME

NQP::Compiler - NQP compiler

=head1 DESCRIPTION

=cut

.sub '' :anon :tag('load') :tag('init')
    '__load_bytecode'('P6object.pbc', 'load')
    '__load_bytecode'('P6Regex.pbc', 'load')
.end

.sub '__load_bytecode' :anon
    .param string pbc_name
    .param string tagname

    $P0 = load_bytecode pbc_name
    $I0 = $P0.'is_initialized'(tagname)
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'(tagname)
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'(tagname)
  done_initialization:
.end

### .include 'gen/nqp-grammar.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1309998847.42912")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1309998847.42912"
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 4
    .const 'Sub' $P1003 = "11_1309998847.42912"
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1968 = "377_1309998847.42912"
    .return ($P1968)
.end


.namespace []
.sub "" :tag('load') :tag('init') :subid("post378") :outer("10_1309998847.42912")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1309998847.42912"
    .local pmc block
    set block, $P1001
    $P1970 = get_root_global ["parrot"], "P6metaclass"
    $P1970."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block1002"  :subid("11_1309998847.42912") :outer("10_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1911 = "355_1309998847.42912"
    capture_lex $P1911
    .const 'Sub' $P1901 = "354_1309998847.42912"
    capture_lex $P1901
    .const 'Sub' $P1896 = "352_1309998847.42912"
    capture_lex $P1896
    .const 'Sub' $P1891 = "350_1309998847.42912"
    capture_lex $P1891
    .const 'Sub' $P1886 = "348_1309998847.42912"
    capture_lex $P1886
    .const 'Sub' $P1881 = "346_1309998847.42912"
    capture_lex $P1881
    .const 'Sub' $P1876 = "344_1309998847.42912"
    capture_lex $P1876
    .const 'Sub' $P1871 = "342_1309998847.42912"
    capture_lex $P1871
    .const 'Sub' $P1866 = "340_1309998847.42912"
    capture_lex $P1866
    .const 'Sub' $P1861 = "338_1309998847.42912"
    capture_lex $P1861
    .const 'Sub' $P1856 = "336_1309998847.42912"
    capture_lex $P1856
    .const 'Sub' $P1852 = "334_1309998847.42912"
    capture_lex $P1852
    .const 'Sub' $P1847 = "332_1309998847.42912"
    capture_lex $P1847
    .const 'Sub' $P1842 = "330_1309998847.42912"
    capture_lex $P1842
    .const 'Sub' $P1837 = "328_1309998847.42912"
    capture_lex $P1837
    .const 'Sub' $P1832 = "326_1309998847.42912"
    capture_lex $P1832
    .const 'Sub' $P1827 = "324_1309998847.42912"
    capture_lex $P1827
    .const 'Sub' $P1822 = "322_1309998847.42912"
    capture_lex $P1822
    .const 'Sub' $P1817 = "320_1309998847.42912"
    capture_lex $P1817
    .const 'Sub' $P1812 = "318_1309998847.42912"
    capture_lex $P1812
    .const 'Sub' $P1807 = "316_1309998847.42912"
    capture_lex $P1807
    .const 'Sub' $P1802 = "314_1309998847.42912"
    capture_lex $P1802
    .const 'Sub' $P1797 = "312_1309998847.42912"
    capture_lex $P1797
    .const 'Sub' $P1792 = "310_1309998847.42912"
    capture_lex $P1792
    .const 'Sub' $P1787 = "308_1309998847.42912"
    capture_lex $P1787
    .const 'Sub' $P1782 = "306_1309998847.42912"
    capture_lex $P1782
    .const 'Sub' $P1777 = "304_1309998847.42912"
    capture_lex $P1777
    .const 'Sub' $P1772 = "302_1309998847.42912"
    capture_lex $P1772
    .const 'Sub' $P1767 = "300_1309998847.42912"
    capture_lex $P1767
    .const 'Sub' $P1762 = "298_1309998847.42912"
    capture_lex $P1762
    .const 'Sub' $P1757 = "296_1309998847.42912"
    capture_lex $P1757
    .const 'Sub' $P1752 = "294_1309998847.42912"
    capture_lex $P1752
    .const 'Sub' $P1747 = "292_1309998847.42912"
    capture_lex $P1747
    .const 'Sub' $P1742 = "290_1309998847.42912"
    capture_lex $P1742
    .const 'Sub' $P1737 = "288_1309998847.42912"
    capture_lex $P1737
    .const 'Sub' $P1732 = "286_1309998847.42912"
    capture_lex $P1732
    .const 'Sub' $P1727 = "284_1309998847.42912"
    capture_lex $P1727
    .const 'Sub' $P1722 = "282_1309998847.42912"
    capture_lex $P1722
    .const 'Sub' $P1717 = "280_1309998847.42912"
    capture_lex $P1717
    .const 'Sub' $P1712 = "278_1309998847.42912"
    capture_lex $P1712
    .const 'Sub' $P1707 = "276_1309998847.42912"
    capture_lex $P1707
    .const 'Sub' $P1702 = "274_1309998847.42912"
    capture_lex $P1702
    .const 'Sub' $P1697 = "272_1309998847.42912"
    capture_lex $P1697
    .const 'Sub' $P1692 = "270_1309998847.42912"
    capture_lex $P1692
    .const 'Sub' $P1687 = "268_1309998847.42912"
    capture_lex $P1687
    .const 'Sub' $P1682 = "266_1309998847.42912"
    capture_lex $P1682
    .const 'Sub' $P1677 = "264_1309998847.42912"
    capture_lex $P1677
    .const 'Sub' $P1672 = "262_1309998847.42912"
    capture_lex $P1672
    .const 'Sub' $P1667 = "260_1309998847.42912"
    capture_lex $P1667
    .const 'Sub' $P1663 = "258_1309998847.42912"
    capture_lex $P1663
    .const 'Sub' $P1659 = "256_1309998847.42912"
    capture_lex $P1659
    .const 'Sub' $P1655 = "254_1309998847.42912"
    capture_lex $P1655
    .const 'Sub' $P1651 = "252_1309998847.42912"
    capture_lex $P1651
    .const 'Sub' $P1647 = "250_1309998847.42912"
    capture_lex $P1647
    .const 'Sub' $P1643 = "248_1309998847.42912"
    capture_lex $P1643
    .const 'Sub' $P1639 = "246_1309998847.42912"
    capture_lex $P1639
    .const 'Sub' $P1635 = "244_1309998847.42912"
    capture_lex $P1635
    .const 'Sub' $P1629 = "242_1309998847.42912"
    capture_lex $P1629
    .const 'Sub' $P1625 = "240_1309998847.42912"
    capture_lex $P1625
    .const 'Sub' $P1621 = "238_1309998847.42912"
    capture_lex $P1621
    .const 'Sub' $P1617 = "236_1309998847.42912"
    capture_lex $P1617
    .const 'Sub' $P1611 = "234_1309998847.42912"
    capture_lex $P1611
    .const 'Sub' $P1605 = "232_1309998847.42912"
    capture_lex $P1605
    .const 'Sub' $P1601 = "230_1309998847.42912"
    capture_lex $P1601
    .const 'Sub' $P1597 = "228_1309998847.42912"
    capture_lex $P1597
    .const 'Sub' $P1593 = "226_1309998847.42912"
    capture_lex $P1593
    .const 'Sub' $P1589 = "224_1309998847.42912"
    capture_lex $P1589
    .const 'Sub' $P1585 = "222_1309998847.42912"
    capture_lex $P1585
    .const 'Sub' $P1581 = "220_1309998847.42912"
    capture_lex $P1581
    .const 'Sub' $P1577 = "218_1309998847.42912"
    capture_lex $P1577
    .const 'Sub' $P1573 = "216_1309998847.42912"
    capture_lex $P1573
    .const 'Sub' $P1569 = "214_1309998847.42912"
    capture_lex $P1569
    .const 'Sub' $P1565 = "212_1309998847.42912"
    capture_lex $P1565
    .const 'Sub' $P1556 = "208_1309998847.42912"
    capture_lex $P1556
    .const 'Sub' $P1551 = "206_1309998847.42912"
    capture_lex $P1551
    .const 'Sub' $P1547 = "204_1309998847.42912"
    capture_lex $P1547
    .const 'Sub' $P1542 = "202_1309998847.42912"
    capture_lex $P1542
    .const 'Sub' $P1538 = "200_1309998847.42912"
    capture_lex $P1538
    .const 'Sub' $P1531 = "198_1309998847.42912"
    capture_lex $P1531
    .const 'Sub' $P1525 = "196_1309998847.42912"
    capture_lex $P1525
    .const 'Sub' $P1521 = "194_1309998847.42912"
    capture_lex $P1521
    .const 'Sub' $P1516 = "192_1309998847.42912"
    capture_lex $P1516
    .const 'Sub' $P1506 = "188_1309998847.42912"
    capture_lex $P1506
    .const 'Sub' $P1495 = "186_1309998847.42912"
    capture_lex $P1495
    .const 'Sub' $P1488 = "184_1309998847.42912"
    capture_lex $P1488
    .const 'Sub' $P1482 = "180_1309998847.42912"
    capture_lex $P1482
    .const 'Sub' $P1478 = "178_1309998847.42912"
    capture_lex $P1478
    .const 'Sub' $P1474 = "176_1309998847.42912"
    capture_lex $P1474
    .const 'Sub' $P1466 = "174_1309998847.42912"
    capture_lex $P1466
    .const 'Sub' $P1454 = "172_1309998847.42912"
    capture_lex $P1454
    .const 'Sub' $P1448 = "170_1309998847.42912"
    capture_lex $P1448
    .const 'Sub' $P1443 = "168_1309998847.42912"
    capture_lex $P1443
    .const 'Sub' $P1436 = "166_1309998847.42912"
    capture_lex $P1436
    .const 'Sub' $P1425 = "162_1309998847.42912"
    capture_lex $P1425
    .const 'Sub' $P1415 = "160_1309998847.42912"
    capture_lex $P1415
    .const 'Sub' $P1410 = "158_1309998847.42912"
    capture_lex $P1410
    .const 'Sub' $P1405 = "156_1309998847.42912"
    capture_lex $P1405
    .const 'Sub' $P1399 = "152_1309998847.42912"
    capture_lex $P1399
    .const 'Sub' $P1394 = "150_1309998847.42912"
    capture_lex $P1394
    .const 'Sub' $P1390 = "148_1309998847.42912"
    capture_lex $P1390
    .const 'Sub' $P1384 = "146_1309998847.42912"
    capture_lex $P1384
    .const 'Sub' $P1379 = "144_1309998847.42912"
    capture_lex $P1379
    .const 'Sub' $P1374 = "142_1309998847.42912"
    capture_lex $P1374
    .const 'Sub' $P1369 = "140_1309998847.42912"
    capture_lex $P1369
    .const 'Sub' $P1361 = "136_1309998847.42912"
    capture_lex $P1361
    .const 'Sub' $P1355 = "134_1309998847.42912"
    capture_lex $P1355
    .const 'Sub' $P1350 = "132_1309998847.42912"
    capture_lex $P1350
    .const 'Sub' $P1344 = "128_1309998847.42912"
    capture_lex $P1344
    .const 'Sub' $P1340 = "126_1309998847.42912"
    capture_lex $P1340
    .const 'Sub' $P1331 = "124_1309998847.42912"
    capture_lex $P1331
    .const 'Sub' $P1323 = "122_1309998847.42912"
    capture_lex $P1323
    .const 'Sub' $P1318 = "120_1309998847.42912"
    capture_lex $P1318
    .const 'Sub' $P1314 = "118_1309998847.42912"
    capture_lex $P1314
    .const 'Sub' $P1310 = "116_1309998847.42912"
    capture_lex $P1310
    .const 'Sub' $P1306 = "114_1309998847.42912"
    capture_lex $P1306
    .const 'Sub' $P1297 = "111_1309998847.42912"
    capture_lex $P1297
    .const 'Sub' $P1293 = "109_1309998847.42912"
    capture_lex $P1293
    .const 'Sub' $P1289 = "107_1309998847.42912"
    capture_lex $P1289
    .const 'Sub' $P1285 = "105_1309998847.42912"
    capture_lex $P1285
    .const 'Sub' $P1281 = "103_1309998847.42912"
    capture_lex $P1281
    .const 'Sub' $P1277 = "101_1309998847.42912"
    capture_lex $P1277
    .const 'Sub' $P1273 = "99_1309998847.42912"
    capture_lex $P1273
    .const 'Sub' $P1268 = "97_1309998847.42912"
    capture_lex $P1268
    .const 'Sub' $P1263 = "95_1309998847.42912"
    capture_lex $P1263
    .const 'Sub' $P1258 = "93_1309998847.42912"
    capture_lex $P1258
    .const 'Sub' $P1251 = "89_1309998847.42912"
    capture_lex $P1251
    .const 'Sub' $P1246 = "87_1309998847.42912"
    capture_lex $P1246
    .const 'Sub' $P1239 = "83_1309998847.42912"
    capture_lex $P1239
    .const 'Sub' $P1234 = "81_1309998847.42912"
    capture_lex $P1234
    .const 'Sub' $P1229 = "79_1309998847.42912"
    capture_lex $P1229
    .const 'Sub' $P1222 = "75_1309998847.42912"
    capture_lex $P1222
    .const 'Sub' $P1217 = "73_1309998847.42912"
    capture_lex $P1217
    .const 'Sub' $P1212 = "71_1309998847.42912"
    capture_lex $P1212
    .const 'Sub' $P1202 = "69_1309998847.42912"
    capture_lex $P1202
    .const 'Sub' $P1196 = "67_1309998847.42912"
    capture_lex $P1196
    .const 'Sub' $P1186 = "64_1309998847.42912"
    capture_lex $P1186
    .const 'Sub' $P1179 = "62_1309998847.42912"
    capture_lex $P1179
    .const 'Sub' $P1173 = "58_1309998847.42912"
    capture_lex $P1173
    .const 'Sub' $P1169 = "56_1309998847.42912"
    capture_lex $P1169
    .const 'Sub' $P1163 = "52_1309998847.42912"
    capture_lex $P1163
    .const 'Sub' $P1159 = "50_1309998847.42912"
    capture_lex $P1159
    .const 'Sub' $P1155 = "48_1309998847.42912"
    capture_lex $P1155
    .const 'Sub' $P1149 = "46_1309998847.42912"
    capture_lex $P1149
    .const 'Sub' $P1144 = "44_1309998847.42912"
    capture_lex $P1144
    .const 'Sub' $P1139 = "42_1309998847.42912"
    capture_lex $P1139
    .const 'Sub' $P1134 = "40_1309998847.42912"
    capture_lex $P1134
    .const 'Sub' $P1130 = "38_1309998847.42912"
    capture_lex $P1130
    .const 'Sub' $P1125 = "36_1309998847.42912"
    capture_lex $P1125
    .const 'Sub' $P1111 = "33_1309998847.42912"
    capture_lex $P1111
    .const 'Sub' $P1105 = "31_1309998847.42912"
    capture_lex $P1105
    .const 'Sub' $P1100 = "29_1309998847.42912"
    capture_lex $P1100
    .const 'Sub' $P1063 = "26_1309998847.42912"
    capture_lex $P1063
    .const 'Sub' $P1049 = "23_1309998847.42912"
    capture_lex $P1049
    .const 'Sub' $P1039 = "21_1309998847.42912"
    capture_lex $P1039
    .const 'Sub' $P1028 = "19_1309998847.42912"
    capture_lex $P1028
    .const 'Sub' $P1022 = "17_1309998847.42912"
    capture_lex $P1022
    .const 'Sub' $P1016 = "15_1309998847.42912"
    capture_lex $P1016
    .const 'Sub' $P1011 = "13_1309998847.42912"
    capture_lex $P1011
    .const 'Sub' $P1004 = "12_1309998847.42912"
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 575
    .const 'Sub' $P1911 = "355_1309998847.42912"
    capture_lex $P1911
    $P100 = $P1911()
.annotate 'line', 4
    .return ($P100)
    .const 'Sub' $P1964 = "376_1309998847.42912"
    .return ($P1964)
.end


.namespace ["NQP";"Grammar"]
.sub "" :tag('load') :tag('init') :subid("post379") :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1003 = "11_1309998847.42912"
    .local pmc block
    set block, $P1003
.annotate 'line', 456
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate 'line', 457
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate 'line', 458
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate 'line', 459
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate 'line', 460
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate 'line', 461
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate 'line', 462
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate 'line', 463
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate 'line', 464
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate 'line', 465
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate 'line', 466
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate 'line', 467
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate 'line', 468
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate 'line', 469
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate 'line', 470
    get_hll_global $P102, ["NQP"], "Grammar"
    $P102."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate 'line', 455
    $P1966 = get_root_global ["parrot"], "P6metaclass"
    $P1966."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "TOP"  :subid("12_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
.annotate 'line', 5
    $P1008 = root_new ['parrot';'Hash']
    set $P1007, $P1008
    .lex "%*LANG", $P1007
.annotate 'line', 10
    new $P100, "Undef"
    set $P1009, $P100
    .lex "$*SCOPE", $P1009
.annotate 'line', 11
    new $P101, "Undef"
    set $P1010, $P101
    .lex "$*MULTINESS", $P1010
.annotate 'line', 4
    find_lex $P102, "%*LANG"
    unless_null $P102, vivify_380
    get_hll_global $P102, "%LANG"
    unless_null $P102, vivify_381
    die "Contextual %*LANG not found"
  vivify_381:
  vivify_380:
.annotate 'line', 6
    get_hll_global $P102, ["NQP"], "Regex"
    find_lex $P103, "%*LANG"
    unless_null $P103, vivify_382
    get_hll_global $P103, "%LANG"
    unless_null $P103, vivify_383
    die "Contextual %*LANG not found"
  vivify_383:
    store_lex "%*LANG", $P103
  vivify_382:
    set $P103["Regex"], $P102
.annotate 'line', 7
    get_hll_global $P102, ["NQP"], "RegexActions"
    find_lex $P103, "%*LANG"
    unless_null $P103, vivify_384
    get_hll_global $P103, "%LANG"
    unless_null $P103, vivify_385
    die "Contextual %*LANG not found"
  vivify_385:
    store_lex "%*LANG", $P103
  vivify_384:
    set $P103["Regex-actions"], $P102
.annotate 'line', 8
    get_hll_global $P102, ["NQP"], "Grammar"
    find_lex $P103, "%*LANG"
    unless_null $P103, vivify_386
    get_hll_global $P103, "%LANG"
    unless_null $P103, vivify_387
    die "Contextual %*LANG not found"
  vivify_387:
    store_lex "%*LANG", $P103
  vivify_386:
    set $P103["MAIN"], $P102
.annotate 'line', 9
    get_hll_global $P102, ["NQP"], "Actions"
    find_lex $P103, "%*LANG"
    unless_null $P103, vivify_388
    get_hll_global $P103, "%LANG"
    unless_null $P103, vivify_389
    die "Contextual %*LANG not found"
  vivify_389:
    store_lex "%*LANG", $P103
  vivify_388:
    set $P103["MAIN-actions"], $P102
.annotate 'line', 10
    new $P102, "String"
    assign $P102, ""
    store_lex "$*SCOPE", $P102
.annotate 'line', 11
    new $P102, "String"
    assign $P102, ""
    store_lex "$*MULTINESS", $P102
.annotate 'line', 12
    find_lex $P102, "self"
    $P103 = $P102."comp_unit"()
.annotate 'line', 4
    .return ($P103)
  control_1005:
    .local pmc exception
    .get_results (exception)
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1012_debug, debug_390
    rx1012_cur."!cursor_debug"("START", "identifier")
  debug_390:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1014_done
    goto rxscan1014_scan
  rxscan1014_loop:
    ($P10) = rx1012_cur."from"()
    inc $P10
    set rx1012_pos, $P10
    ge rx1012_pos, rx1012_eos, rxscan1014_done
  rxscan1014_scan:
    set_addr $I10, rxscan1014_loop
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  rxscan1014_done:
.annotate 'line', 17
  # rx subrule "ident" subtype=method negate=
    rx1012_cur."!cursor_pos"(rx1012_pos)
    $P10 = rx1012_cur."ident"()
    unless $P10, rx1012_fail
    rx1012_pos = $P10."pos"()
  # rx rxquantr1015 ** 0..*
    set_addr $I10, rxquantr1015_done
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  rxquantr1015_loop:
  # rx enumcharlist negate=0
    ge rx1012_pos, rx1012_eos, rx1012_fail
    sub $I10, rx1012_pos, rx1012_off
    substr $S10, rx1012_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx1012_fail
    inc rx1012_pos
  # rx subrule "ident" subtype=method negate=
    rx1012_cur."!cursor_pos"(rx1012_pos)
    $P10 = rx1012_cur."ident"()
    unless $P10, rx1012_fail
    rx1012_pos = $P10."pos"()
    set_addr $I10, rxquantr1015_done
    (rx1012_rep) = rx1012_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1015_done
    rx1012_cur."!mark_push"(rx1012_rep, rx1012_pos, $I10)
    goto rxquantr1015_loop
  rxquantr1015_done:
  # rx pass
    rx1012_cur."!cursor_pass"(rx1012_pos, "identifier")
    if_null rx1012_debug, debug_391
    rx1012_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx1012_pos)
  debug_391:
    .return (rx1012_cur)
  rx1012_restart:
.annotate 'line', 4
    if_null rx1012_debug, debug_392
    rx1012_cur."!cursor_debug"("NEXT", "identifier")
  debug_392:
  rx1012_fail:
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    if_null rx1012_debug, debug_393
    rx1012_cur."!cursor_debug"("FAIL", "identifier")
  debug_393:
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__identifier"  :subid("14_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ident", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    .local pmc rx1017_debug
    (rx1017_cur, rx1017_pos, rx1017_tgt, $I10) = self."!cursor_start"()
    rx1017_cur."!cursor_caparray"("identifier")
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
    if_null rx1017_debug, debug_394
    rx1017_cur."!cursor_debug"("START", "name")
  debug_394:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1019_done
    goto rxscan1019_scan
  rxscan1019_loop:
    ($P10) = rx1017_cur."from"()
    inc $P10
    set rx1017_pos, $P10
    ge rx1017_pos, rx1017_eos, rxscan1019_done
  rxscan1019_scan:
    set_addr $I10, rxscan1019_loop
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  rxscan1019_done:
.annotate 'line', 19
  # rx rxquantr1020 ** 1..*
    set_addr $I10, rxquantr1020_done
    rx1017_cur."!mark_push"(0, -1, $I10)
  rxquantr1020_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    $P10 = rx1017_cur."identifier"()
    unless $P10, rx1017_fail
    goto rxsubrule1021_pass
  rxsubrule1021_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1017_fail
  rxsubrule1021_pass:
    set_addr $I10, rxsubrule1021_back
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10, $P10)
    $P10."!cursor_names"("identifier")
    rx1017_pos = $P10."pos"()
    set_addr $I10, rxquantr1020_done
    (rx1017_rep) = rx1017_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1020_done
    rx1017_cur."!mark_push"(rx1017_rep, rx1017_pos, $I10)
  # rx literal  "::"
    add $I11, rx1017_pos, 2
    gt $I11, rx1017_eos, rx1017_fail
    sub $I11, rx1017_pos, rx1017_off
    substr $S10, rx1017_tgt, $I11, 2
    ne $S10, "::", rx1017_fail
    add rx1017_pos, 2
    goto rxquantr1020_loop
  rxquantr1020_done:
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "name")
    if_null rx1017_debug, debug_395
    rx1017_cur."!cursor_debug"("PASS", "name", " at pos=", rx1017_pos)
  debug_395:
    .return (rx1017_cur)
  rx1017_restart:
.annotate 'line', 4
    if_null rx1017_debug, debug_396
    rx1017_cur."!cursor_debug"("NEXT", "name")
  debug_396:
  rx1017_fail:
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    if_null rx1017_debug, debug_397
    rx1017_cur."!cursor_debug"("FAIL", "name")
  debug_397:
    .return (rx1017_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    .local pmc rx1023_debug
    (rx1023_cur, rx1023_pos, rx1023_tgt, $I10) = self."!cursor_start"()
    rx1023_cur."!cursor_caparray"("colonpair")
    getattribute rx1023_debug, rx1023_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1023_cur
    .local pmc match
    .lex "$/", match
    length rx1023_eos, rx1023_tgt
    gt rx1023_pos, rx1023_eos, rx1023_done
    set rx1023_off, 0
    lt rx1023_pos, 2, rx1023_start
    sub rx1023_off, rx1023_pos, 1
    substr rx1023_tgt, rx1023_tgt, rx1023_off
  rx1023_start:
    eq $I10, 1, rx1023_restart
    if_null rx1023_debug, debug_398
    rx1023_cur."!cursor_debug"("START", "deflongname")
  debug_398:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1025_done
    goto rxscan1025_scan
  rxscan1025_loop:
    ($P10) = rx1023_cur."from"()
    inc $P10
    set rx1023_pos, $P10
    ge rx1023_pos, rx1023_eos, rxscan1025_done
  rxscan1025_scan:
    set_addr $I10, rxscan1025_loop
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  rxscan1025_done:
.annotate 'line', 22
  # rx subrule "identifier" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."identifier"()
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx1023_pos = $P10."pos"()
  # rx rxquantr1026 ** 0..1
    set_addr $I10, rxquantr1026_done
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  rxquantr1026_loop:
  # rx subrule "colonpair" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."colonpair"()
    unless $P10, rx1023_fail
    goto rxsubrule1027_pass
  rxsubrule1027_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1023_fail
  rxsubrule1027_pass:
    set_addr $I10, rxsubrule1027_back
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10, $P10)
    $P10."!cursor_names"("colonpair")
    rx1023_pos = $P10."pos"()
    set_addr $I10, rxquantr1026_done
    (rx1023_rep) = rx1023_cur."!mark_commit"($I10)
  rxquantr1026_done:
.annotate 'line', 21
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "deflongname")
    if_null rx1023_debug, debug_399
    rx1023_cur."!cursor_debug"("PASS", "deflongname", " at pos=", rx1023_pos)
  debug_399:
    .return (rx1023_cur)
  rx1023_restart:
.annotate 'line', 4
    if_null rx1023_debug, debug_400
    rx1023_cur."!cursor_debug"("NEXT", "deflongname")
  debug_400:
  rx1023_fail:
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    if_null rx1023_debug, debug_401
    rx1023_cur."!cursor_debug"("FAIL", "deflongname")
  debug_401:
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("identifier", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1029_tgt
    .local int rx1029_pos
    .local int rx1029_off
    .local int rx1029_eos
    .local int rx1029_rep
    .local pmc rx1029_cur
    .local pmc rx1029_debug
    (rx1029_cur, rx1029_pos, rx1029_tgt, $I10) = self."!cursor_start"()
    getattribute rx1029_debug, rx1029_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1029_cur
    .local pmc match
    .lex "$/", match
    length rx1029_eos, rx1029_tgt
    gt rx1029_pos, rx1029_eos, rx1029_done
    set rx1029_off, 0
    lt rx1029_pos, 2, rx1029_start
    sub rx1029_off, rx1029_pos, 1
    substr rx1029_tgt, rx1029_tgt, rx1029_off
  rx1029_start:
    eq $I10, 1, rx1029_restart
    if_null rx1029_debug, debug_402
    rx1029_cur."!cursor_debug"("START", "ENDSTMT")
  debug_402:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1031_done
    goto rxscan1031_scan
  rxscan1031_loop:
    ($P10) = rx1029_cur."from"()
    inc $P10
    set rx1029_pos, $P10
    ge rx1029_pos, rx1029_eos, rxscan1031_done
  rxscan1031_scan:
    set_addr $I10, rxscan1031_loop
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  rxscan1031_done:
.annotate 'line', 29
  # rx rxquantr1032 ** 0..1
    set_addr $I10, rxquantr1032_done
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  rxquantr1032_loop:
  alt1033_0:
.annotate 'line', 26
    set_addr $I10, alt1033_1
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
.annotate 'line', 27
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1029_pos, rx1029_off
    set rx1029_rep, 0
    sub $I12, rx1029_eos, rx1029_pos
  rxenumcharlistq1034_loop:
    le $I12, 0, rxenumcharlistq1034_done
    substr $S10, rx1029_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1034_done
    inc rx1029_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1034_loop
  rxenumcharlistq1034_done:
    add rx1029_pos, rx1029_pos, rx1029_rep
  # rxanchor eol
    sub $I10, rx1029_pos, rx1029_off
    is_cclass $I11, 4096, rx1029_tgt, $I10
    if $I11, rxanchor1035_done
    ne rx1029_pos, rx1029_eos, rx1029_fail
    eq rx1029_pos, 0, rxanchor1035_done
    dec $I10
    is_cclass $I11, 4096, rx1029_tgt, $I10
    if $I11, rx1029_fail
  rxanchor1035_done:
  # rx subrule "ws" subtype=method negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."ws"()
    unless $P10, rx1029_fail
    rx1029_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."MARKER"("endstmt")
    unless $P10, rx1029_fail
    goto alt1033_end
  alt1033_1:
.annotate 'line', 28
  # rx rxquantr1036 ** 0..1
    set_addr $I10, rxquantr1036_done
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10)
  rxquantr1036_loop:
  # rx subrule "unv" subtype=method negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."unv"()
    unless $P10, rx1029_fail
    goto rxsubrule1037_pass
  rxsubrule1037_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1029_fail
  rxsubrule1037_pass:
    set_addr $I10, rxsubrule1037_back
    rx1029_cur."!mark_push"(0, rx1029_pos, $I10, $P10)
    rx1029_pos = $P10."pos"()
    set_addr $I10, rxquantr1036_done
    (rx1029_rep) = rx1029_cur."!mark_commit"($I10)
  rxquantr1036_done:
  # rxanchor eol
    sub $I10, rx1029_pos, rx1029_off
    is_cclass $I11, 4096, rx1029_tgt, $I10
    if $I11, rxanchor1038_done
    ne rx1029_pos, rx1029_eos, rx1029_fail
    eq rx1029_pos, 0, rxanchor1038_done
    dec $I10
    is_cclass $I11, 4096, rx1029_tgt, $I10
    if $I11, rx1029_fail
  rxanchor1038_done:
  # rx subrule "ws" subtype=method negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."ws"()
    unless $P10, rx1029_fail
    rx1029_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx1029_cur."!cursor_pos"(rx1029_pos)
    $P10 = rx1029_cur."MARKER"("endstmt")
    unless $P10, rx1029_fail
  alt1033_end:
.annotate 'line', 29
    set_addr $I10, rxquantr1032_done
    (rx1029_rep) = rx1029_cur."!mark_commit"($I10)
  rxquantr1032_done:
.annotate 'line', 25
  # rx pass
    rx1029_cur."!cursor_pass"(rx1029_pos, "ENDSTMT")
    if_null rx1029_debug, debug_403
    rx1029_cur."!cursor_debug"("PASS", "ENDSTMT", " at pos=", rx1029_pos)
  debug_403:
    .return (rx1029_cur)
  rx1029_restart:
.annotate 'line', 4
    if_null rx1029_debug, debug_404
    rx1029_cur."!cursor_debug"("NEXT", "ENDSTMT")
  debug_404:
  rx1029_fail:
    (rx1029_rep, rx1029_pos, $I10, $P10) = rx1029_cur."!mark_fail"(0)
    lt rx1029_pos, -1, rx1029_done
    eq rx1029_pos, -1, rx1029_fail
    jump $I10
  rx1029_done:
    rx1029_cur."!cursor_fail"()
    if_null rx1029_debug, debug_405
    rx1029_cur."!cursor_debug"("FAIL", "ENDSTMT")
  debug_405:
    .return (rx1029_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1040_debug, debug_406
    rx1040_cur."!cursor_debug"("START", "ws")
  debug_406:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1042_done
    goto rxscan1042_scan
  rxscan1042_loop:
    ($P10) = rx1040_cur."from"()
    inc $P10
    set rx1040_pos, $P10
    ge rx1040_pos, rx1040_eos, rxscan1042_done
  rxscan1042_scan:
    set_addr $I10, rxscan1042_loop
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  rxscan1042_done:
  alt1043_0:
.annotate 'line', 32
    set_addr $I10, alt1043_1
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
.annotate 'line', 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."MARKED"("ws")
    unless $P10, rx1040_fail
    goto alt1043_end
  alt1043_1:
.annotate 'line', 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."ww"()
    if $P10, rx1040_fail
.annotate 'line', 39
  # rx rxquantr1044 ** 0..*
    set_addr $I10, rxquantr1044_done
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  rxquantr1044_loop:
  alt1045_0:
.annotate 'line', 35
    set_addr $I10, alt1045_1
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1040_pos, rx1040_off
    set rx1040_rep, 0
    sub $I12, rx1040_eos, rx1040_pos
  rxenumcharlistq1046_loop:
    le $I12, 0, rxenumcharlistq1046_done
    substr $S10, rx1040_tgt, $I10, 1
    index $I11, unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", $S10
    lt $I11, 0, rxenumcharlistq1046_done
    inc rx1040_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1046_loop
  rxenumcharlistq1046_done:
    lt rx1040_rep, 1, rx1040_fail
    add rx1040_pos, rx1040_pos, rx1040_rep
    goto alt1045_end
  alt1045_1:
    set_addr $I10, alt1045_2
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
.annotate 'line', 36
  # rx literal  "#"
    add $I11, rx1040_pos, 1
    gt $I11, rx1040_eos, rx1040_fail
    sub $I11, rx1040_pos, rx1040_off
    ord $I11, rx1040_tgt, $I11
    ne $I11, 35, rx1040_fail
    add rx1040_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx1040_pos, rx1040_off
    find_cclass $I11, 4096, rx1040_tgt, $I10, rx1040_eos
    add rx1040_pos, rx1040_off, $I11
    goto alt1045_end
  alt1045_2:
    set_addr $I10, alt1045_3
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
.annotate 'line', 37
  # rxanchor bol
    eq rx1040_pos, 0, rxanchor1047_done
    ge rx1040_pos, rx1040_eos, rx1040_fail
    sub $I10, rx1040_pos, rx1040_off
    dec $I10
    is_cclass $I11, 4096, rx1040_tgt, $I10
    unless $I11, rx1040_fail
  rxanchor1047_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."pod_comment"()
    unless $P10, rx1040_fail
    rx1040_pos = $P10."pos"()
    goto alt1045_end
  alt1045_3:
.annotate 'line', 38
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1040_pos, rx1040_off
    set rx1040_rep, 0
    sub $I12, rx1040_eos, rx1040_pos
  rxenumcharlistq1048_loop:
    le $I12, 0, rxenumcharlistq1048_done
    substr $S10, rx1040_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1048_done
    inc rx1040_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1048_loop
  rxenumcharlistq1048_done:
    lt rx1040_rep, 1, rx1040_fail
    add rx1040_pos, rx1040_pos, rx1040_rep
  alt1045_end:
.annotate 'line', 39
    set_addr $I10, rxquantr1044_done
    (rx1040_rep) = rx1040_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1044_done
    rx1040_cur."!mark_push"(rx1040_rep, rx1040_pos, $I10)
    goto rxquantr1044_loop
  rxquantr1044_done:
.annotate 'line', 40
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."MARKER"("ws")
    unless $P10, rx1040_fail
  alt1043_end:
.annotate 'line', 32
  # rx pass
    rx1040_cur."!cursor_pass"(rx1040_pos, "ws")
    if_null rx1040_debug, debug_407
    rx1040_cur."!cursor_debug"("PASS", "ws", " at pos=", rx1040_pos)
  debug_407:
    .return (rx1040_cur)
  rx1040_restart:
.annotate 'line', 4
    if_null rx1040_debug, debug_408
    rx1040_cur."!cursor_debug"("NEXT", "ws")
  debug_408:
  rx1040_fail:
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    if_null rx1040_debug, debug_409
    rx1040_cur."!cursor_debug"("FAIL", "ws")
  debug_409:
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1056 = "25_1309998847.42912"
    capture_lex $P1056
    .local string rx1050_tgt
    .local int rx1050_pos
    .local int rx1050_off
    .local int rx1050_eos
    .local int rx1050_rep
    .local pmc rx1050_cur
    .local pmc rx1050_debug
    (rx1050_cur, rx1050_pos, rx1050_tgt, $I10) = self."!cursor_start"()
    getattribute rx1050_debug, rx1050_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1050_cur
    .local pmc match
    .lex "$/", match
    length rx1050_eos, rx1050_tgt
    gt rx1050_pos, rx1050_eos, rx1050_done
    set rx1050_off, 0
    lt rx1050_pos, 2, rx1050_start
    sub rx1050_off, rx1050_pos, 1
    substr rx1050_tgt, rx1050_tgt, rx1050_off
  rx1050_start:
    eq $I10, 1, rx1050_restart
    if_null rx1050_debug, debug_410
    rx1050_cur."!cursor_debug"("START", "unv")
  debug_410:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1052_done
    goto rxscan1052_scan
  rxscan1052_loop:
    ($P10) = rx1050_cur."from"()
    inc $P10
    set rx1050_pos, $P10
    ge rx1050_pos, rx1050_eos, rxscan1052_done
  rxscan1052_scan:
    set_addr $I10, rxscan1052_loop
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
  rxscan1052_done:
  alt1053_0:
.annotate 'line', 45
    set_addr $I10, alt1053_1
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
.annotate 'line', 46
  # rxanchor bol
    eq rx1050_pos, 0, rxanchor1054_done
    ge rx1050_pos, rx1050_eos, rx1050_fail
    sub $I10, rx1050_pos, rx1050_off
    dec $I10
    is_cclass $I11, 4096, rx1050_tgt, $I10
    unless $I11, rx1050_fail
  rxanchor1054_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx1050_cur."!cursor_pos"(rx1050_pos)
    .const 'Sub' $P1056 = "25_1309998847.42912"
    capture_lex $P1056
    $P10 = rx1050_cur."before"($P1056)
    unless $P10, rx1050_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx1050_cur."!cursor_pos"(rx1050_pos)
    $P10 = rx1050_cur."pod_comment"()
    unless $P10, rx1050_fail
    rx1050_pos = $P10."pos"()
    goto alt1053_end
  alt1053_1:
    set_addr $I10, alt1053_2
    rx1050_cur."!mark_push"(0, rx1050_pos, $I10)
.annotate 'line', 47
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1050_pos, rx1050_off
    set rx1050_rep, 0
    sub $I12, rx1050_eos, rx1050_pos
  rxenumcharlistq1061_loop:
    le $I12, 0, rxenumcharlistq1061_done
    substr $S10, rx1050_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1061_done
    inc rx1050_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1061_loop
  rxenumcharlistq1061_done:
    add rx1050_pos, rx1050_pos, rx1050_rep
  # rx literal  "#"
    add $I11, rx1050_pos, 1
    gt $I11, rx1050_eos, rx1050_fail
    sub $I11, rx1050_pos, rx1050_off
    ord $I11, rx1050_tgt, $I11
    ne $I11, 35, rx1050_fail
    add rx1050_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx1050_pos, rx1050_off
    find_cclass $I11, 4096, rx1050_tgt, $I10, rx1050_eos
    add rx1050_pos, rx1050_off, $I11
    goto alt1053_end
  alt1053_2:
.annotate 'line', 48
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1050_pos, rx1050_off
    set rx1050_rep, 0
    sub $I12, rx1050_eos, rx1050_pos
  rxenumcharlistq1062_loop:
    le $I12, 0, rxenumcharlistq1062_done
    substr $S10, rx1050_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1062_done
    inc rx1050_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1062_loop
  rxenumcharlistq1062_done:
    lt rx1050_rep, 1, rx1050_fail
    add rx1050_pos, rx1050_pos, rx1050_rep
  alt1053_end:
.annotate 'line', 43
  # rx pass
    rx1050_cur."!cursor_pass"(rx1050_pos, "unv")
    if_null rx1050_debug, debug_415
    rx1050_cur."!cursor_debug"("PASS", "unv", " at pos=", rx1050_pos)
  debug_415:
    .return (rx1050_cur)
  rx1050_restart:
.annotate 'line', 4
    if_null rx1050_debug, debug_416
    rx1050_cur."!cursor_debug"("NEXT", "unv")
  debug_416:
  rx1050_fail:
    (rx1050_rep, rx1050_pos, $I10, $P10) = rx1050_cur."!mark_fail"(0)
    lt rx1050_pos, -1, rx1050_done
    eq rx1050_pos, -1, rx1050_fail
    jump $I10
  rx1050_done:
    rx1050_cur."!cursor_fail"()
    if_null rx1050_debug, debug_417
    rx1050_cur."!cursor_debug"("FAIL", "unv")
  debug_417:
    .return (rx1050_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, ""
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1055"  :anon :subid("25_1309998847.42912") :method :outer("23_1309998847.42912")
.annotate 'line', 46
    .local string rx1057_tgt
    .local int rx1057_pos
    .local int rx1057_off
    .local int rx1057_eos
    .local int rx1057_rep
    .local pmc rx1057_cur
    .local pmc rx1057_debug
    (rx1057_cur, rx1057_pos, rx1057_tgt, $I10) = self."!cursor_start"()
    getattribute rx1057_debug, rx1057_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1057_cur
    .local pmc match
    .lex "$/", match
    length rx1057_eos, rx1057_tgt
    gt rx1057_pos, rx1057_eos, rx1057_done
    set rx1057_off, 0
    lt rx1057_pos, 2, rx1057_start
    sub rx1057_off, rx1057_pos, 1
    substr rx1057_tgt, rx1057_tgt, rx1057_off
  rx1057_start:
    eq $I10, 1, rx1057_restart
    if_null rx1057_debug, debug_411
    rx1057_cur."!cursor_debug"("START", "")
  debug_411:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1058_done
    goto rxscan1058_scan
  rxscan1058_loop:
    ($P10) = rx1057_cur."from"()
    inc $P10
    set rx1057_pos, $P10
    ge rx1057_pos, rx1057_eos, rxscan1058_done
  rxscan1058_scan:
    set_addr $I10, rxscan1058_loop
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  rxscan1058_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1057_pos, rx1057_off
    set rx1057_rep, 0
    sub $I12, rx1057_eos, rx1057_pos
  rxenumcharlistq1059_loop:
    le $I12, 0, rxenumcharlistq1059_done
    substr $S10, rx1057_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1059_done
    inc rx1057_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1059_loop
  rxenumcharlistq1059_done:
    add rx1057_pos, rx1057_pos, rx1057_rep
  # rx literal  "="
    add $I11, rx1057_pos, 1
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    ord $I11, rx1057_tgt, $I11
    ne $I11, 61, rx1057_fail
    add rx1057_pos, 1
  alt1060_0:
    set_addr $I10, alt1060_1
    rx1057_cur."!mark_push"(0, rx1057_pos, $I10)
  # rx charclass w
    ge rx1057_pos, rx1057_eos, rx1057_fail
    sub $I10, rx1057_pos, rx1057_off
    is_cclass $I11, 8192, rx1057_tgt, $I10
    unless $I11, rx1057_fail
    inc rx1057_pos
    goto alt1060_end
  alt1060_1:
  # rx literal  "\\"
    add $I11, rx1057_pos, 1
    gt $I11, rx1057_eos, rx1057_fail
    sub $I11, rx1057_pos, rx1057_off
    ord $I11, rx1057_tgt, $I11
    ne $I11, 92, rx1057_fail
    add rx1057_pos, 1
  alt1060_end:
  # rx pass
    rx1057_cur."!cursor_pass"(rx1057_pos, "")
    if_null rx1057_debug, debug_412
    rx1057_cur."!cursor_debug"("PASS", "", " at pos=", rx1057_pos)
  debug_412:
    .return (rx1057_cur)
  rx1057_restart:
    if_null rx1057_debug, debug_413
    rx1057_cur."!cursor_debug"("NEXT", "")
  debug_413:
  rx1057_fail:
    (rx1057_rep, rx1057_pos, $I10, $P10) = rx1057_cur."!mark_fail"(0)
    lt rx1057_pos, -1, rx1057_done
    eq rx1057_pos, -1, rx1057_fail
    jump $I10
  rx1057_done:
    rx1057_cur."!cursor_fail"()
    if_null rx1057_debug, debug_414
    rx1057_cur."!cursor_debug"("FAIL", "")
  debug_414:
    .return (rx1057_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1093 = "28_1309998847.42912"
    capture_lex $P1093
    .local string rx1064_tgt
    .local int rx1064_pos
    .local int rx1064_off
    .local int rx1064_eos
    .local int rx1064_rep
    .local pmc rx1064_cur
    .local pmc rx1064_debug
    (rx1064_cur, rx1064_pos, rx1064_tgt, $I10) = self."!cursor_start"()
    getattribute rx1064_debug, rx1064_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1064_cur
    .local pmc match
    .lex "$/", match
    length rx1064_eos, rx1064_tgt
    gt rx1064_pos, rx1064_eos, rx1064_done
    set rx1064_off, 0
    lt rx1064_pos, 2, rx1064_start
    sub rx1064_off, rx1064_pos, 1
    substr rx1064_tgt, rx1064_tgt, rx1064_off
  rx1064_start:
    eq $I10, 1, rx1064_restart
    if_null rx1064_debug, debug_418
    rx1064_cur."!cursor_debug"("START", "pod_comment")
  debug_418:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1066_done
    goto rxscan1066_scan
  rxscan1066_loop:
    ($P10) = rx1064_cur."from"()
    inc $P10
    set rx1064_pos, $P10
    ge rx1064_pos, rx1064_eos, rxscan1066_done
  rxscan1066_scan:
    set_addr $I10, rxscan1066_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  rxscan1066_done:
.annotate 'line', 53
  # rxanchor bol
    eq rx1064_pos, 0, rxanchor1067_done
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    dec $I10
    is_cclass $I11, 4096, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  rxanchor1067_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1068_loop:
    le $I12, 0, rxenumcharlistq1068_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1068_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1068_loop
  rxenumcharlistq1068_done:
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "="
    add $I11, rx1064_pos, 1
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    ord $I11, rx1064_tgt, $I11
    ne $I11, 61, rx1064_fail
    add rx1064_pos, 1
  alt1069_0:
.annotate 'line', 54
    set_addr $I10, alt1069_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 55
  # rx literal  "begin"
    add $I11, rx1064_pos, 5
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 5
    ne $S10, "begin", rx1064_fail
    add rx1064_pos, 5
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1070_loop:
    le $I12, 0, rxenumcharlistq1070_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1070_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1070_loop
  rxenumcharlistq1070_done:
    lt rx1064_rep, 1, rx1064_fail
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "END"
    add $I11, rx1064_pos, 3
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 3
    ne $S10, "END", rx1064_fail
    add rx1064_pos, 3
  # rxanchor rwb
    le rx1064_pos, 0, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 8192, rx1064_tgt, $I10
    if $I11, rx1064_fail
    dec $I10
    is_cclass $I11, 8192, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  alt1071_0:
.annotate 'line', 56
    set_addr $I10, alt1071_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx rxquantf1072 ** 0..*
    set_addr $I10, rxquantf1072_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
    goto rxquantf1072_done
  rxquantf1072_loop:
  # rx charclass .
    ge rx1064_pos, rx1064_eos, rx1064_fail
    inc rx1064_pos
    set_addr $I10, rxquantf1072_loop
    rx1064_cur."!mark_push"(rx1064_rep, rx1064_pos, $I10)
  rxquantf1072_done:
  # rx charclass nl
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 4096, rx1064_tgt, $I10
    unless $I11, rx1064_fail
    substr $S10, rx1064_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx1064_pos, $I11
    inc rx1064_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1074_loop:
    le $I12, 0, rxenumcharlistq1074_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1074_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1074_loop
  rxenumcharlistq1074_done:
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "=end"
    add $I11, rx1064_pos, 4
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 4
    ne $S10, "=end", rx1064_fail
    add rx1064_pos, 4
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1075_loop:
    le $I12, 0, rxenumcharlistq1075_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1075_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1075_loop
  rxenumcharlistq1075_done:
    lt rx1064_rep, 1, rx1064_fail
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "END"
    add $I11, rx1064_pos, 3
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 3
    ne $S10, "END", rx1064_fail
    add rx1064_pos, 3
  # rxanchor rwb
    le rx1064_pos, 0, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 8192, rx1064_tgt, $I10
    if $I11, rx1064_fail
    dec $I10
    is_cclass $I11, 8192, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    find_cclass $I11, 4096, rx1064_tgt, $I10, rx1064_eos
    add rx1064_pos, rx1064_off, $I11
    goto alt1071_end
  alt1071_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    find_not_cclass $I11, 65535, rx1064_tgt, $I10, rx1064_eos
    add rx1064_pos, rx1064_off, $I11
  alt1071_end:
.annotate 'line', 55
    goto alt1069_end
  alt1069_1:
    set_addr $I10, alt1069_2
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 57
  # rx literal  "begin"
    add $I11, rx1064_pos, 5
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 5
    ne $S10, "begin", rx1064_fail
    add rx1064_pos, 5
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1076_loop:
    le $I12, 0, rxenumcharlistq1076_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1076_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1076_loop
  rxenumcharlistq1076_done:
    lt rx1064_rep, 1, rx1064_fail
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx subrule "identifier" subtype=capture negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."identifier"()
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx1064_pos = $P10."pos"()
  alt1077_0:
.annotate 'line', 58
    set_addr $I10, alt1077_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 59
  # rx rxquantf1078 ** 0..*
    set_addr $I10, rxquantf1078_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
    goto rxquantf1078_done
  rxquantf1078_loop:
  # rx charclass .
    ge rx1064_pos, rx1064_eos, rx1064_fail
    inc rx1064_pos
    set_addr $I10, rxquantf1078_loop
    rx1064_cur."!mark_push"(rx1064_rep, rx1064_pos, $I10)
  rxquantf1078_done:
  # rx charclass nl
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 4096, rx1064_tgt, $I10
    unless $I11, rx1064_fail
    substr $S10, rx1064_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx1064_pos, $I11
    inc rx1064_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1080_loop:
    le $I12, 0, rxenumcharlistq1080_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1080_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1080_loop
  rxenumcharlistq1080_done:
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "=end"
    add $I11, rx1064_pos, 4
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 4
    ne $S10, "=end", rx1064_fail
    add rx1064_pos, 4
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1081_loop:
    le $I12, 0, rxenumcharlistq1081_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1081_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1081_loop
  rxenumcharlistq1081_done:
    lt rx1064_rep, 1, rx1064_fail
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx subrule "!BACKREF" subtype=method negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."!BACKREF"("identifier")
    unless $P10, rx1064_fail
    rx1064_pos = $P10."pos"()
  # rxanchor rwb
    le rx1064_pos, 0, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 8192, rx1064_tgt, $I10
    if $I11, rx1064_fail
    dec $I10
    is_cclass $I11, 8192, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    find_cclass $I11, 4096, rx1064_tgt, $I10, rx1064_eos
    add rx1064_pos, rx1064_off, $I11
    goto alt1077_end
  alt1077_1:
.annotate 'line', 60
  # rx subrule "panic" subtype=method negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."panic"("=begin without matching =end")
    unless $P10, rx1064_fail
    rx1064_pos = $P10."pos"()
  alt1077_end:
.annotate 'line', 57
    goto alt1069_end
  alt1069_2:
    set_addr $I10, alt1069_3
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 62
  # rx literal  "begin"
    add $I11, rx1064_pos, 5
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 5
    ne $S10, "begin", rx1064_fail
    add rx1064_pos, 5
  # rxanchor rwb
    le rx1064_pos, 0, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 8192, rx1064_tgt, $I10
    if $I11, rx1064_fail
    dec $I10
    is_cclass $I11, 8192, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1082_loop:
    le $I12, 0, rxenumcharlistq1082_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1082_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1082_loop
  rxenumcharlistq1082_done:
    add rx1064_pos, rx1064_pos, rx1064_rep
  alt1083_0:
.annotate 'line', 63
    set_addr $I10, alt1083_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rxanchor eol
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 4096, rx1064_tgt, $I10
    if $I11, rxanchor1084_done
    ne rx1064_pos, rx1064_eos, rx1064_fail
    eq rx1064_pos, 0, rxanchor1084_done
    dec $I10
    is_cclass $I11, 4096, rx1064_tgt, $I10
    if $I11, rx1064_fail
  rxanchor1084_done:
    goto alt1083_end
  alt1083_1:
    set_addr $I10, alt1083_2
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx literal  "#"
    add $I11, rx1064_pos, 1
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    ord $I11, rx1064_tgt, $I11
    ne $I11, 35, rx1064_fail
    add rx1064_pos, 1
    goto alt1083_end
  alt1083_2:
  # rx subrule "panic" subtype=method negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx1064_fail
    rx1064_pos = $P10."pos"()
  alt1083_end:
  alt1085_0:
.annotate 'line', 64
    set_addr $I10, alt1085_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 65
  # rx rxquantf1086 ** 0..*
    set_addr $I10, rxquantf1086_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
    goto rxquantf1086_done
  rxquantf1086_loop:
  # rx charclass .
    ge rx1064_pos, rx1064_eos, rx1064_fail
    inc rx1064_pos
    set_addr $I10, rxquantf1086_loop
    rx1064_cur."!mark_push"(rx1064_rep, rx1064_pos, $I10)
  rxquantf1086_done:
  # rx charclass nl
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 4096, rx1064_tgt, $I10
    unless $I11, rx1064_fail
    substr $S10, rx1064_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx1064_pos, $I11
    inc rx1064_pos
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    set rx1064_rep, 0
    sub $I12, rx1064_eos, rx1064_pos
  rxenumcharlistq1088_loop:
    le $I12, 0, rxenumcharlistq1088_done
    substr $S10, rx1064_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1088_done
    inc rx1064_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1088_loop
  rxenumcharlistq1088_done:
    add rx1064_pos, rx1064_pos, rx1064_rep
  # rx literal  "=end"
    add $I11, rx1064_pos, 4
    gt $I11, rx1064_eos, rx1064_fail
    sub $I11, rx1064_pos, rx1064_off
    substr $S10, rx1064_tgt, $I11, 4
    ne $S10, "=end", rx1064_fail
    add rx1064_pos, 4
  # rxanchor rwb
    le rx1064_pos, 0, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 8192, rx1064_tgt, $I10
    if $I11, rx1064_fail
    dec $I10
    is_cclass $I11, 8192, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    find_cclass $I11, 4096, rx1064_tgt, $I10, rx1064_eos
    add rx1064_pos, rx1064_off, $I11
    goto alt1085_end
  alt1085_1:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."panic"("=begin without matching =end")
    unless $P10, rx1064_fail
    rx1064_pos = $P10."pos"()
  alt1085_end:
.annotate 'line', 62
    goto alt1069_end
  alt1069_3:
    set_addr $I10, alt1069_4
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
.annotate 'line', 68
  # rx subrule "identifier" subtype=capture negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."identifier"()
    unless $P10, rx1064_fail
    rx1064_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx1064_pos = $P10."pos"()
.annotate 'line', 69
  # rx rxquantf1089 ** 0..*
    set_addr $I10, rxquantf1089_loop
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
    goto rxquantf1089_done
  rxquantf1089_loop:
  # rx charclass .
    ge rx1064_pos, rx1064_eos, rx1064_fail
    inc rx1064_pos
    set_addr $I10, rxquantf1089_loop
    rx1064_cur."!mark_push"(rx1064_rep, rx1064_pos, $I10)
  rxquantf1089_done:
  # rxanchor bol
    eq rx1064_pos, 0, rxanchor1091_done
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    dec $I10
    is_cclass $I11, 4096, rx1064_tgt, $I10
    unless $I11, rx1064_fail
  rxanchor1091_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    .const 'Sub' $P1093 = "28_1309998847.42912"
    capture_lex $P1093
    $P10 = rx1064_cur."before"($P1093)
    unless $P10, rx1064_fail
.annotate 'line', 68
    goto alt1069_end
  alt1069_4:
  alt1099_0:
.annotate 'line', 75
    set_addr $I10, alt1099_1
    rx1064_cur."!mark_push"(0, rx1064_pos, $I10)
  # rx charclass s
    ge rx1064_pos, rx1064_eos, rx1064_fail
    sub $I10, rx1064_pos, rx1064_off
    is_cclass $I11, 32, rx1064_tgt, $I10
    unless $I11, rx1064_fail
    inc rx1064_pos
    goto alt1099_end
  alt1099_1:
  # rx subrule "panic" subtype=method negate=
    rx1064_cur."!cursor_pos"(rx1064_pos)
    $P10 = rx1064_cur."panic"("Illegal pod directive")
    unless $P10, rx1064_fail
    rx1064_pos = $P10."pos"()
  alt1099_end:
.annotate 'line', 76
  # rx charclass_q N r 0..-1
    sub $I10, rx1064_pos, rx1064_off
    find_cclass $I11, 4096, rx1064_tgt, $I10, rx1064_eos
    add rx1064_pos, rx1064_off, $I11
  alt1069_end:
.annotate 'line', 52
  # rx pass
    rx1064_cur."!cursor_pass"(rx1064_pos, "pod_comment")
    if_null rx1064_debug, debug_423
    rx1064_cur."!cursor_debug"("PASS", "pod_comment", " at pos=", rx1064_pos)
  debug_423:
    .return (rx1064_cur)
  rx1064_restart:
.annotate 'line', 4
    if_null rx1064_debug, debug_424
    rx1064_cur."!cursor_debug"("NEXT", "pod_comment")
  debug_424:
  rx1064_fail:
    (rx1064_rep, rx1064_pos, $I10, $P10) = rx1064_cur."!mark_fail"(0)
    lt rx1064_pos, -1, rx1064_done
    eq rx1064_pos, -1, rx1064_fail
    jump $I10
  rx1064_done:
    rx1064_cur."!cursor_fail"()
    if_null rx1064_debug, debug_425
    rx1064_cur."!cursor_debug"("FAIL", "pod_comment")
  debug_425:
    .return (rx1064_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1092"  :anon :subid("28_1309998847.42912") :method :outer("26_1309998847.42912")
.annotate 'line', 69
    .local string rx1094_tgt
    .local int rx1094_pos
    .local int rx1094_off
    .local int rx1094_eos
    .local int rx1094_rep
    .local pmc rx1094_cur
    .local pmc rx1094_debug
    (rx1094_cur, rx1094_pos, rx1094_tgt, $I10) = self."!cursor_start"()
    getattribute rx1094_debug, rx1094_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1094_cur
    .local pmc match
    .lex "$/", match
    length rx1094_eos, rx1094_tgt
    gt rx1094_pos, rx1094_eos, rx1094_done
    set rx1094_off, 0
    lt rx1094_pos, 2, rx1094_start
    sub rx1094_off, rx1094_pos, 1
    substr rx1094_tgt, rx1094_tgt, rx1094_off
  rx1094_start:
    eq $I10, 1, rx1094_restart
    if_null rx1094_debug, debug_419
    rx1094_cur."!cursor_debug"("START", "")
  debug_419:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1095_done
    goto rxscan1095_scan
  rxscan1095_loop:
    ($P10) = rx1094_cur."from"()
    inc $P10
    set rx1094_pos, $P10
    ge rx1094_pos, rx1094_eos, rxscan1095_done
  rxscan1095_scan:
    set_addr $I10, rxscan1095_loop
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  rxscan1095_done:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1094_pos, rx1094_off
    set rx1094_rep, 0
    sub $I12, rx1094_eos, rx1094_pos
  rxenumcharlistq1096_loop:
    le $I12, 0, rxenumcharlistq1096_done
    substr $S10, rx1094_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1096_done
    inc rx1094_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1096_loop
  rxenumcharlistq1096_done:
    add rx1094_pos, rx1094_pos, rx1094_rep
  alt1097_0:
    set_addr $I10, alt1097_1
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
.annotate 'line', 70
  # rx literal  "="
    add $I11, rx1094_pos, 1
    gt $I11, rx1094_eos, rx1094_fail
    sub $I11, rx1094_pos, rx1094_off
    ord $I11, rx1094_tgt, $I11
    ne $I11, 61, rx1094_fail
    add rx1094_pos, 1
.annotate 'line', 72
  # rx rxquantr1098 ** 0..1
    set_addr $I10, rxquantr1098_done
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  rxquantr1098_loop:
.annotate 'line', 71
  # rx literal  "cut"
    add $I11, rx1094_pos, 3
    gt $I11, rx1094_eos, rx1094_fail
    sub $I11, rx1094_pos, rx1094_off
    substr $S10, rx1094_tgt, $I11, 3
    ne $S10, "cut", rx1094_fail
    add rx1094_pos, 3
  # rxanchor rwb
    le rx1094_pos, 0, rx1094_fail
    sub $I10, rx1094_pos, rx1094_off
    is_cclass $I11, 8192, rx1094_tgt, $I10
    if $I11, rx1094_fail
    dec $I10
    is_cclass $I11, 8192, rx1094_tgt, $I10
    unless $I11, rx1094_fail
.annotate 'line', 72
  # rx subrule "panic" subtype=method negate=
    rx1094_cur."!cursor_pos"(rx1094_pos)
    $P10 = rx1094_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx1094_fail
    rx1094_pos = $P10."pos"()
    set_addr $I10, rxquantr1098_done
    (rx1094_rep) = rx1094_cur."!mark_commit"($I10)
  rxquantr1098_done:
.annotate 'line', 69
    goto alt1097_end
  alt1097_1:
.annotate 'line', 73
  # rx charclass nl
    ge rx1094_pos, rx1094_eos, rx1094_fail
    sub $I10, rx1094_pos, rx1094_off
    is_cclass $I11, 4096, rx1094_tgt, $I10
    unless $I11, rx1094_fail
    substr $S10, rx1094_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx1094_pos, $I11
    inc rx1094_pos
  alt1097_end:
.annotate 'line', 69
  # rx pass
    rx1094_cur."!cursor_pass"(rx1094_pos, "")
    if_null rx1094_debug, debug_420
    rx1094_cur."!cursor_debug"("PASS", "", " at pos=", rx1094_pos)
  debug_420:
    .return (rx1094_cur)
  rx1094_restart:
    if_null rx1094_debug, debug_421
    rx1094_cur."!cursor_debug"("NEXT", "")
  debug_421:
  rx1094_fail:
    (rx1094_rep, rx1094_pos, $I10, $P10) = rx1094_cur."!mark_fail"(0)
    lt rx1094_pos, -1, rx1094_done
    eq rx1094_pos, -1, rx1094_fail
    jump $I10
  rx1094_done:
    rx1094_cur."!cursor_fail"()
    if_null rx1094_debug, debug_422
    rx1094_cur."!cursor_debug"("FAIL", "")
  debug_422:
    .return (rx1094_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1101_tgt
    .local int rx1101_pos
    .local int rx1101_off
    .local int rx1101_eos
    .local int rx1101_rep
    .local pmc rx1101_cur
    .local pmc rx1101_debug
    (rx1101_cur, rx1101_pos, rx1101_tgt, $I10) = self."!cursor_start"()
    getattribute rx1101_debug, rx1101_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1101_cur
    .local pmc match
    .lex "$/", match
    length rx1101_eos, rx1101_tgt
    gt rx1101_pos, rx1101_eos, rx1101_done
    set rx1101_off, 0
    lt rx1101_pos, 2, rx1101_start
    sub rx1101_off, rx1101_pos, 1
    substr rx1101_tgt, rx1101_tgt, rx1101_off
  rx1101_start:
    eq $I10, 1, rx1101_restart
    if_null rx1101_debug, debug_426
    rx1101_cur."!cursor_debug"("START", "comp_unit")
  debug_426:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1103_done
    goto rxscan1103_scan
  rxscan1103_loop:
    ($P10) = rx1101_cur."from"()
    inc $P10
    set rx1101_pos, $P10
    ge rx1101_pos, rx1101_eos, rxscan1103_done
  rxscan1103_scan:
    set_addr $I10, rxscan1103_loop
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  rxscan1103_done:
.annotate 'line', 84
  # rx subrule "newpad" subtype=method negate=
    rx1101_cur."!cursor_pos"(rx1101_pos)
    $P10 = rx1101_cur."newpad"()
    unless $P10, rx1101_fail
    rx1101_pos = $P10."pos"()
.annotate 'line', 85
  # rx subrule "outerctx" subtype=method negate=
    rx1101_cur."!cursor_pos"(rx1101_pos)
    $P10 = rx1101_cur."outerctx"()
    unless $P10, rx1101_fail
    rx1101_pos = $P10."pos"()
.annotate 'line', 86
  # rx subrule "statementlist" subtype=capture negate=
    rx1101_cur."!cursor_pos"(rx1101_pos)
    $P10 = rx1101_cur."statementlist"()
    unless $P10, rx1101_fail
    rx1101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx1101_pos = $P10."pos"()
  alt1104_0:
.annotate 'line', 87
    set_addr $I10, alt1104_1
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  # rxanchor eos
    ne rx1101_pos, rx1101_eos, rx1101_fail
    goto alt1104_end
  alt1104_1:
  # rx subrule "panic" subtype=method negate=
    rx1101_cur."!cursor_pos"(rx1101_pos)
    $P10 = rx1101_cur."panic"("Confused")
    unless $P10, rx1101_fail
    rx1101_pos = $P10."pos"()
  alt1104_end:
.annotate 'line', 83
  # rx pass
    rx1101_cur."!cursor_pass"(rx1101_pos, "comp_unit")
    if_null rx1101_debug, debug_427
    rx1101_cur."!cursor_debug"("PASS", "comp_unit", " at pos=", rx1101_pos)
  debug_427:
    .return (rx1101_cur)
  rx1101_restart:
.annotate 'line', 4
    if_null rx1101_debug, debug_428
    rx1101_cur."!cursor_debug"("NEXT", "comp_unit")
  debug_428:
  rx1101_fail:
    (rx1101_rep, rx1101_pos, $I10, $P10) = rx1101_cur."!mark_fail"(0)
    lt rx1101_pos, -1, rx1101_done
    eq rx1101_pos, -1, rx1101_fail
    jump $I10
  rx1101_done:
    rx1101_cur."!cursor_fail"()
    if_null rx1101_debug, debug_429
    rx1101_cur."!cursor_debug"("FAIL", "comp_unit")
  debug_429:
    .return (rx1101_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("newpad", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1106_tgt
    .local int rx1106_pos
    .local int rx1106_off
    .local int rx1106_eos
    .local int rx1106_rep
    .local pmc rx1106_cur
    .local pmc rx1106_debug
    (rx1106_cur, rx1106_pos, rx1106_tgt, $I10) = self."!cursor_start"()
    rx1106_cur."!cursor_caparray"("statement")
    getattribute rx1106_debug, rx1106_cur, "$!debug"
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
    eq $I10, 1, rx1106_restart
    if_null rx1106_debug, debug_430
    rx1106_cur."!cursor_debug"("START", "statementlist")
  debug_430:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1108_done
    goto rxscan1108_scan
  rxscan1108_loop:
    ($P10) = rx1106_cur."from"()
    inc $P10
    set rx1106_pos, $P10
    ge rx1106_pos, rx1106_eos, rxscan1108_done
  rxscan1108_scan:
    set_addr $I10, rxscan1108_loop
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  rxscan1108_done:
  alt1109_0:
.annotate 'line', 90
    set_addr $I10, alt1109_1
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
.annotate 'line', 91
  # rx subrule "ws" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."ws"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
  # rxanchor eos
    ne rx1106_pos, rx1106_eos, rx1106_fail
  # rx subrule "ws" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."ws"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
    goto alt1109_end
  alt1109_1:
.annotate 'line', 92
  # rx subrule "ws" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."ws"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
  # rx rxquantr1110 ** 0..*
    set_addr $I10, rxquantr1110_done
    rx1106_cur."!mark_push"(0, rx1106_pos, $I10)
  rxquantr1110_loop:
  # rx subrule "statement" subtype=capture negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."statement"()
    unless $P10, rx1106_fail
    rx1106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1106_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."eat_terminator"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."ws"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
    set_addr $I10, rxquantr1110_done
    (rx1106_rep) = rx1106_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1110_done
    rx1106_cur."!mark_push"(rx1106_rep, rx1106_pos, $I10)
    goto rxquantr1110_loop
  rxquantr1110_done:
  # rx subrule "ws" subtype=method negate=
    rx1106_cur."!cursor_pos"(rx1106_pos)
    $P10 = rx1106_cur."ws"()
    unless $P10, rx1106_fail
    rx1106_pos = $P10."pos"()
  alt1109_end:
.annotate 'line', 90
  # rx pass
    rx1106_cur."!cursor_pass"(rx1106_pos, "statementlist")
    if_null rx1106_debug, debug_431
    rx1106_cur."!cursor_debug"("PASS", "statementlist", " at pos=", rx1106_pos)
  debug_431:
    .return (rx1106_cur)
  rx1106_restart:
.annotate 'line', 4
    if_null rx1106_debug, debug_432
    rx1106_cur."!cursor_debug"("NEXT", "statementlist")
  debug_432:
  rx1106_fail:
    (rx1106_rep, rx1106_pos, $I10, $P10) = rx1106_cur."!mark_fail"(0)
    lt rx1106_pos, -1, rx1106_done
    eq rx1106_pos, -1, rx1106_fail
    jump $I10
  rx1106_done:
    rx1106_cur."!cursor_fail"()
    if_null rx1106_debug, debug_433
    rx1106_cur."!cursor_debug"("FAIL", "statementlist")
  debug_433:
    .return (rx1106_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    $P101 = self."!PREFIX__!subrule"("ws", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1116 = "35_1309998847.42912"
    capture_lex $P1116
    .local string rx1112_tgt
    .local int rx1112_pos
    .local int rx1112_off
    .local int rx1112_eos
    .local int rx1112_rep
    .local pmc rx1112_cur
    .local pmc rx1112_debug
    (rx1112_cur, rx1112_pos, rx1112_tgt, $I10) = self."!cursor_start"()
    rx1112_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
    getattribute rx1112_debug, rx1112_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1112_cur
    .local pmc match
    .lex "$/", match
    length rx1112_eos, rx1112_tgt
    gt rx1112_pos, rx1112_eos, rx1112_done
    set rx1112_off, 0
    lt rx1112_pos, 2, rx1112_start
    sub rx1112_off, rx1112_pos, 1
    substr rx1112_tgt, rx1112_tgt, rx1112_off
  rx1112_start:
    eq $I10, 1, rx1112_restart
    if_null rx1112_debug, debug_434
    rx1112_cur."!cursor_debug"("START", "statement")
  debug_434:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1114_done
    goto rxscan1114_scan
  rxscan1114_loop:
    ($P10) = rx1112_cur."from"()
    inc $P10
    set rx1112_pos, $P10
    ge rx1112_pos, rx1112_eos, rxscan1114_done
  rxscan1114_scan:
    set_addr $I10, rxscan1114_loop
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
  rxscan1114_done:
.annotate 'line', 96
  # rx subrule "before" subtype=zerowidth negate=1
    rx1112_cur."!cursor_pos"(rx1112_pos)
    .const 'Sub' $P1116 = "35_1309998847.42912"
    capture_lex $P1116
    $P10 = rx1112_cur."before"($P1116)
    if $P10, rx1112_fail
  alt1120_0:
.annotate 'line', 97
    set_addr $I10, alt1120_1
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
.annotate 'line', 98
  # rx subrule "statement_control" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."statement_control"()
    unless $P10, rx1112_fail
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx1112_pos = $P10."pos"()
    goto alt1120_end
  alt1120_1:
.annotate 'line', 99
  # rx subrule "EXPR" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."EXPR"()
    unless $P10, rx1112_fail
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1112_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."ws"()
    unless $P10, rx1112_fail
    rx1112_pos = $P10."pos"()
.annotate 'line', 104
  # rx rxquantr1121 ** 0..1
    set_addr $I10, rxquantr1121_done
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
  rxquantr1121_loop:
  alt1122_0:
.annotate 'line', 100
    set_addr $I10, alt1122_1
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
.annotate 'line', 101
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."MARKED"("endstmt")
    unless $P10, rx1112_fail
    goto alt1122_end
  alt1122_1:
    set_addr $I10, alt1122_2
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
.annotate 'line', 102
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."statement_mod_cond"()
    unless $P10, rx1112_fail
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx1112_pos = $P10."pos"()
  # rx rxquantr1123 ** 0..1
    set_addr $I10, rxquantr1123_done
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
  rxquantr1123_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."statement_mod_loop"()
    unless $P10, rx1112_fail
    goto rxsubrule1124_pass
  rxsubrule1124_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1112_fail
  rxsubrule1124_pass:
    set_addr $I10, rxsubrule1124_back
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx1112_pos = $P10."pos"()
    set_addr $I10, rxquantr1123_done
    (rx1112_rep) = rx1112_cur."!mark_commit"($I10)
  rxquantr1123_done:
    goto alt1122_end
  alt1122_2:
.annotate 'line', 103
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."statement_mod_loop"()
    unless $P10, rx1112_fail
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx1112_pos = $P10."pos"()
  alt1122_end:
.annotate 'line', 104
    set_addr $I10, rxquantr1121_done
    (rx1112_rep) = rx1112_cur."!mark_commit"($I10)
  rxquantr1121_done:
  alt1120_end:
.annotate 'line', 95
  # rx pass
    rx1112_cur."!cursor_pass"(rx1112_pos, "statement")
    if_null rx1112_debug, debug_439
    rx1112_cur."!cursor_debug"("PASS", "statement", " at pos=", rx1112_pos)
  debug_439:
    .return (rx1112_cur)
  rx1112_restart:
.annotate 'line', 4
    if_null rx1112_debug, debug_440
    rx1112_cur."!cursor_debug"("NEXT", "statement")
  debug_440:
  rx1112_fail:
    (rx1112_rep, rx1112_pos, $I10, $P10) = rx1112_cur."!mark_fail"(0)
    lt rx1112_pos, -1, rx1112_done
    eq rx1112_pos, -1, rx1112_fail
    jump $I10
  rx1112_done:
    rx1112_cur."!cursor_fail"()
    if_null rx1112_debug, debug_441
    rx1112_cur."!cursor_debug"("FAIL", "statement")
  debug_441:
    .return (rx1112_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1115"  :anon :subid("35_1309998847.42912") :method :outer("33_1309998847.42912")
.annotate 'line', 96
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
    if_null rx1117_debug, debug_435
    rx1117_cur."!cursor_debug"("START", "")
  debug_435:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1118_done
    goto rxscan1118_scan
  rxscan1118_loop:
    ($P10) = rx1117_cur."from"()
    inc $P10
    set rx1117_pos, $P10
    ge rx1117_pos, rx1117_eos, rxscan1118_done
  rxscan1118_scan:
    set_addr $I10, rxscan1118_loop
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  rxscan1118_done:
  alt1119_0:
    set_addr $I10, alt1119_1
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  # rx enumcharlist negate=0
    ge rx1117_pos, rx1117_eos, rx1117_fail
    sub $I10, rx1117_pos, rx1117_off
    substr $S10, rx1117_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx1117_fail
    inc rx1117_pos
    goto alt1119_end
  alt1119_1:
  # rxanchor eos
    ne rx1117_pos, rx1117_eos, rx1117_fail
  alt1119_end:
  # rx pass
    rx1117_cur."!cursor_pass"(rx1117_pos, "")
    if_null rx1117_debug, debug_436
    rx1117_cur."!cursor_debug"("PASS", "", " at pos=", rx1117_pos)
  debug_436:
    .return (rx1117_cur)
  rx1117_restart:
    if_null rx1117_debug, debug_437
    rx1117_cur."!cursor_debug"("NEXT", "")
  debug_437:
  rx1117_fail:
    (rx1117_rep, rx1117_pos, $I10, $P10) = rx1117_cur."!mark_fail"(0)
    lt rx1117_pos, -1, rx1117_done
    eq rx1117_pos, -1, rx1117_fail
    jump $I10
  rx1117_done:
    rx1117_cur."!cursor_fail"()
    if_null rx1117_debug, debug_438
    rx1117_cur."!cursor_debug"("FAIL", "")
  debug_438:
    .return (rx1117_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1126_tgt
    .local int rx1126_pos
    .local int rx1126_off
    .local int rx1126_eos
    .local int rx1126_rep
    .local pmc rx1126_cur
    .local pmc rx1126_debug
    (rx1126_cur, rx1126_pos, rx1126_tgt, $I10) = self."!cursor_start"()
    getattribute rx1126_debug, rx1126_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1126_cur
    .local pmc match
    .lex "$/", match
    length rx1126_eos, rx1126_tgt
    gt rx1126_pos, rx1126_eos, rx1126_done
    set rx1126_off, 0
    lt rx1126_pos, 2, rx1126_start
    sub rx1126_off, rx1126_pos, 1
    substr rx1126_tgt, rx1126_tgt, rx1126_off
  rx1126_start:
    eq $I10, 1, rx1126_restart
    if_null rx1126_debug, debug_442
    rx1126_cur."!cursor_debug"("START", "eat_terminator")
  debug_442:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1128_done
    goto rxscan1128_scan
  rxscan1128_loop:
    ($P10) = rx1126_cur."from"()
    inc $P10
    set rx1126_pos, $P10
    ge rx1126_pos, rx1126_eos, rxscan1128_done
  rxscan1128_scan:
    set_addr $I10, rxscan1128_loop
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxscan1128_done:
  alt1129_0:
.annotate 'line', 108
    set_addr $I10, alt1129_1
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 109
  # rx literal  ";"
    add $I11, rx1126_pos, 1
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    ord $I11, rx1126_tgt, $I11
    ne $I11, 59, rx1126_fail
    add rx1126_pos, 1
    goto alt1129_end
  alt1129_1:
    set_addr $I10, alt1129_2
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 110
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."MARKED"("endstmt")
    unless $P10, rx1126_fail
    goto alt1129_end
  alt1129_2:
    set_addr $I10, alt1129_3
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 111
  # rx subrule "terminator" subtype=zerowidth negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."terminator"()
    unless $P10, rx1126_fail
    goto alt1129_end
  alt1129_3:
.annotate 'line', 112
  # rxanchor eos
    ne rx1126_pos, rx1126_eos, rx1126_fail
  alt1129_end:
.annotate 'line', 108
  # rx pass
    rx1126_cur."!cursor_pass"(rx1126_pos, "eat_terminator")
    if_null rx1126_debug, debug_443
    rx1126_cur."!cursor_debug"("PASS", "eat_terminator", " at pos=", rx1126_pos)
  debug_443:
    .return (rx1126_cur)
  rx1126_restart:
.annotate 'line', 4
    if_null rx1126_debug, debug_444
    rx1126_cur."!cursor_debug"("NEXT", "eat_terminator")
  debug_444:
  rx1126_fail:
    (rx1126_rep, rx1126_pos, $I10, $P10) = rx1126_cur."!mark_fail"(0)
    lt rx1126_pos, -1, rx1126_done
    eq rx1126_pos, -1, rx1126_fail
    jump $I10
  rx1126_done:
    rx1126_cur."!cursor_fail"()
    if_null rx1126_debug, debug_445
    rx1126_cur."!cursor_debug"("FAIL", "eat_terminator")
  debug_445:
    .return (rx1126_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, ""
    push $P100, ""
    push $P100, ";"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1131_debug, debug_446
    rx1131_cur."!cursor_debug"("START", "xblock")
  debug_446:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1133_done
    goto rxscan1133_scan
  rxscan1133_loop:
    ($P10) = rx1131_cur."from"()
    inc $P10
    set rx1131_pos, $P10
    ge rx1131_pos, rx1131_eos, rxscan1133_done
  rxscan1133_scan:
    set_addr $I10, rxscan1133_loop
    rx1131_cur."!mark_push"(0, rx1131_pos, $I10)
  rxscan1133_done:
.annotate 'line', 116
  # rx subrule "EXPR" subtype=capture negate=
    rx1131_cur."!cursor_pos"(rx1131_pos)
    $P10 = rx1131_cur."EXPR"()
    unless $P10, rx1131_fail
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1131_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1131_cur."!cursor_pos"(rx1131_pos)
    $P10 = rx1131_cur."ws"()
    unless $P10, rx1131_fail
    rx1131_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx1131_cur."!cursor_pos"(rx1131_pos)
    $P10 = rx1131_cur."pblock"()
    unless $P10, rx1131_fail
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx1131_pos = $P10."pos"()
.annotate 'line', 115
  # rx pass
    rx1131_cur."!cursor_pass"(rx1131_pos, "xblock")
    if_null rx1131_debug, debug_447
    rx1131_cur."!cursor_debug"("PASS", "xblock", " at pos=", rx1131_pos)
  debug_447:
    .return (rx1131_cur)
  rx1131_restart:
.annotate 'line', 4
    if_null rx1131_debug, debug_448
    rx1131_cur."!cursor_debug"("NEXT", "xblock")
  debug_448:
  rx1131_fail:
    (rx1131_rep, rx1131_pos, $I10, $P10) = rx1131_cur."!mark_fail"(0)
    lt rx1131_pos, -1, rx1131_done
    eq rx1131_pos, -1, rx1131_fail
    jump $I10
  rx1131_done:
    rx1131_cur."!cursor_fail"()
    if_null rx1131_debug, debug_449
    rx1131_cur."!cursor_debug"("FAIL", "xblock")
  debug_449:
    .return (rx1131_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("EXPR", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1135_debug, debug_450
    rx1135_cur."!cursor_debug"("START", "pblock")
  debug_450:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1137_done
    goto rxscan1137_scan
  rxscan1137_loop:
    ($P10) = rx1135_cur."from"()
    inc $P10
    set rx1135_pos, $P10
    ge rx1135_pos, rx1135_eos, rxscan1137_done
  rxscan1137_scan:
    set_addr $I10, rxscan1137_loop
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  rxscan1137_done:
  alt1138_0:
.annotate 'line', 119
    set_addr $I10, alt1138_1
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
.annotate 'line', 120
  # rx subrule "lambda" subtype=method negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."lambda"()
    unless $P10, rx1135_fail
    rx1135_pos = $P10."pos"()
.annotate 'line', 121
  # rx subrule "newpad" subtype=method negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."newpad"()
    unless $P10, rx1135_fail
    rx1135_pos = $P10."pos"()
.annotate 'line', 122
  # rx subrule "signature" subtype=capture negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."signature"()
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx1135_pos = $P10."pos"()
.annotate 'line', 123
  # rx subrule "blockoid" subtype=capture negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."blockoid"()
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx1135_pos = $P10."pos"()
.annotate 'line', 120
    goto alt1138_end
  alt1138_1:
    set_addr $I10, alt1138_2
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
.annotate 'line', 124
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1135_fail
.annotate 'line', 125
  # rx subrule "newpad" subtype=method negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."newpad"()
    unless $P10, rx1135_fail
    rx1135_pos = $P10."pos"()
.annotate 'line', 126
  # rx subrule "blockoid" subtype=capture negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."blockoid"()
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx1135_pos = $P10."pos"()
.annotate 'line', 124
    goto alt1138_end
  alt1138_2:
.annotate 'line', 127
  # rx subrule "panic" subtype=method negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."panic"("Missing block")
    unless $P10, rx1135_fail
    rx1135_pos = $P10."pos"()
  alt1138_end:
.annotate 'line', 119
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "pblock")
    if_null rx1135_debug, debug_451
    rx1135_cur."!cursor_debug"("PASS", "pblock", " at pos=", rx1135_pos)
  debug_451:
    .return (rx1135_cur)
  rx1135_restart:
.annotate 'line', 4
    if_null rx1135_debug, debug_452
    rx1135_cur."!cursor_debug"("NEXT", "pblock")
  debug_452:
  rx1135_fail:
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    if_null rx1135_debug, debug_453
    rx1135_cur."!cursor_debug"("FAIL", "pblock")
  debug_453:
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("panic", "")
    $P101 = self."!PREFIX__!subrule"("lambda", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, "{"
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1140_tgt
    .local int rx1140_pos
    .local int rx1140_off
    .local int rx1140_eos
    .local int rx1140_rep
    .local pmc rx1140_cur
    .local pmc rx1140_debug
    (rx1140_cur, rx1140_pos, rx1140_tgt, $I10) = self."!cursor_start"()
    getattribute rx1140_debug, rx1140_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1140_cur
    .local pmc match
    .lex "$/", match
    length rx1140_eos, rx1140_tgt
    gt rx1140_pos, rx1140_eos, rx1140_done
    set rx1140_off, 0
    lt rx1140_pos, 2, rx1140_start
    sub rx1140_off, rx1140_pos, 1
    substr rx1140_tgt, rx1140_tgt, rx1140_off
  rx1140_start:
    eq $I10, 1, rx1140_restart
    if_null rx1140_debug, debug_454
    rx1140_cur."!cursor_debug"("START", "lambda")
  debug_454:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1142_done
    goto rxscan1142_scan
  rxscan1142_loop:
    ($P10) = rx1140_cur."from"()
    inc $P10
    set rx1140_pos, $P10
    ge rx1140_pos, rx1140_eos, rxscan1142_done
  rxscan1142_scan:
    set_addr $I10, rxscan1142_loop
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  rxscan1142_done:
  alt1143_0:
.annotate 'line', 130
    set_addr $I10, alt1143_1
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  # rx literal  "->"
    add $I11, rx1140_pos, 2
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    substr $S10, rx1140_tgt, $I11, 2
    ne $S10, "->", rx1140_fail
    add rx1140_pos, 2
    goto alt1143_end
  alt1143_1:
  # rx literal  "<->"
    add $I11, rx1140_pos, 3
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    substr $S10, rx1140_tgt, $I11, 3
    ne $S10, "<->", rx1140_fail
    add rx1140_pos, 3
  alt1143_end:
  # rx pass
    rx1140_cur."!cursor_pass"(rx1140_pos, "lambda")
    if_null rx1140_debug, debug_455
    rx1140_cur."!cursor_debug"("PASS", "lambda", " at pos=", rx1140_pos)
  debug_455:
    .return (rx1140_cur)
  rx1140_restart:
.annotate 'line', 4
    if_null rx1140_debug, debug_456
    rx1140_cur."!cursor_debug"("NEXT", "lambda")
  debug_456:
  rx1140_fail:
    (rx1140_rep, rx1140_pos, $I10, $P10) = rx1140_cur."!mark_fail"(0)
    lt rx1140_pos, -1, rx1140_done
    eq rx1140_pos, -1, rx1140_fail
    jump $I10
  rx1140_done:
    rx1140_cur."!cursor_fail"()
    if_null rx1140_debug, debug_457
    rx1140_cur."!cursor_debug"("FAIL", "lambda")
  debug_457:
    .return (rx1140_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "<->"
    push $P100, "->"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1145_debug, debug_458
    rx1145_cur."!cursor_debug"("START", "block")
  debug_458:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1147_done
    goto rxscan1147_scan
  rxscan1147_loop:
    ($P10) = rx1145_cur."from"()
    inc $P10
    set rx1145_pos, $P10
    ge rx1145_pos, rx1145_eos, rxscan1147_done
  rxscan1147_scan:
    set_addr $I10, rxscan1147_loop
    rx1145_cur."!mark_push"(0, rx1145_pos, $I10)
  rxscan1147_done:
  alt1148_0:
.annotate 'line', 133
    set_addr $I10, alt1148_1
    rx1145_cur."!mark_push"(0, rx1145_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1145_pos, rx1145_off
    substr $S10, rx1145_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1145_fail
    goto alt1148_end
  alt1148_1:
  # rx subrule "panic" subtype=method negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."panic"("Missing block")
    unless $P10, rx1145_fail
    rx1145_pos = $P10."pos"()
  alt1148_end:
.annotate 'line', 134
  # rx subrule "newpad" subtype=method negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."newpad"()
    unless $P10, rx1145_fail
    rx1145_pos = $P10."pos"()
.annotate 'line', 135
  # rx subrule "blockoid" subtype=capture negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."blockoid"()
    unless $P10, rx1145_fail
    rx1145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx1145_pos = $P10."pos"()
.annotate 'line', 132
  # rx pass
    rx1145_cur."!cursor_pass"(rx1145_pos, "block")
    if_null rx1145_debug, debug_459
    rx1145_cur."!cursor_debug"("PASS", "block", " at pos=", rx1145_pos)
  debug_459:
    .return (rx1145_cur)
  rx1145_restart:
.annotate 'line', 4
    if_null rx1145_debug, debug_460
    rx1145_cur."!cursor_debug"("NEXT", "block")
  debug_460:
  rx1145_fail:
    (rx1145_rep, rx1145_pos, $I10, $P10) = rx1145_cur."!mark_fail"(0)
    lt rx1145_pos, -1, rx1145_done
    eq rx1145_pos, -1, rx1145_fail
    jump $I10
  rx1145_done:
    rx1145_cur."!cursor_fail"()
    if_null rx1145_debug, debug_461
    rx1145_cur."!cursor_debug"("FAIL", "block")
  debug_461:
    .return (rx1145_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("panic", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, "{"
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1150_tgt
    .local int rx1150_pos
    .local int rx1150_off
    .local int rx1150_eos
    .local int rx1150_rep
    .local pmc rx1150_cur
    .local pmc rx1150_debug
    (rx1150_cur, rx1150_pos, rx1150_tgt, $I10) = self."!cursor_start"()
    getattribute rx1150_debug, rx1150_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1150_cur
    .local pmc match
    .lex "$/", match
    length rx1150_eos, rx1150_tgt
    gt rx1150_pos, rx1150_eos, rx1150_done
    set rx1150_off, 0
    lt rx1150_pos, 2, rx1150_start
    sub rx1150_off, rx1150_pos, 1
    substr rx1150_tgt, rx1150_tgt, rx1150_off
  rx1150_start:
    eq $I10, 1, rx1150_restart
    if_null rx1150_debug, debug_462
    rx1150_cur."!cursor_debug"("START", "blockoid")
  debug_462:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1152_done
    goto rxscan1152_scan
  rxscan1152_loop:
    ($P10) = rx1150_cur."from"()
    inc $P10
    set rx1150_pos, $P10
    ge rx1150_pos, rx1150_eos, rxscan1152_done
  rxscan1152_scan:
    set_addr $I10, rxscan1152_loop
    rx1150_cur."!mark_push"(0, rx1150_pos, $I10)
  rxscan1152_done:
.annotate 'line', 139
  # rx subrule "finishpad" subtype=method negate=
    rx1150_cur."!cursor_pos"(rx1150_pos)
    $P10 = rx1150_cur."finishpad"()
    unless $P10, rx1150_fail
    rx1150_pos = $P10."pos"()
.annotate 'line', 140
  # rx literal  "{"
    add $I11, rx1150_pos, 1
    gt $I11, rx1150_eos, rx1150_fail
    sub $I11, rx1150_pos, rx1150_off
    ord $I11, rx1150_tgt, $I11
    ne $I11, 123, rx1150_fail
    add rx1150_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx1150_cur."!cursor_pos"(rx1150_pos)
    $P10 = rx1150_cur."statementlist"()
    unless $P10, rx1150_fail
    rx1150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx1150_pos = $P10."pos"()
  alt1153_0:
    set_addr $I10, alt1153_1
    rx1150_cur."!mark_push"(0, rx1150_pos, $I10)
  # rx literal  "}"
    add $I11, rx1150_pos, 1
    gt $I11, rx1150_eos, rx1150_fail
    sub $I11, rx1150_pos, rx1150_off
    ord $I11, rx1150_tgt, $I11
    ne $I11, 125, rx1150_fail
    add rx1150_pos, 1
    goto alt1153_end
  alt1153_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx1150_cur."!cursor_pos"(rx1150_pos)
    $P10 = rx1150_cur."FAILGOAL"("'}'")
    unless $P10, rx1150_fail
    goto rxsubrule1154_pass
  rxsubrule1154_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1150_fail
  rxsubrule1154_pass:
    set_addr $I10, rxsubrule1154_back
    rx1150_cur."!mark_push"(0, rx1150_pos, $I10, $P10)
    rx1150_pos = $P10."pos"()
  alt1153_end:
.annotate 'line', 141
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx1150_cur."!cursor_pos"(rx1150_pos)
    $P10 = rx1150_cur."ENDSTMT"()
    unless $P10, rx1150_fail
.annotate 'line', 138
  # rx pass
    rx1150_cur."!cursor_pass"(rx1150_pos, "blockoid")
    if_null rx1150_debug, debug_463
    rx1150_cur."!cursor_debug"("PASS", "blockoid", " at pos=", rx1150_pos)
  debug_463:
    .return (rx1150_cur)
  rx1150_restart:
.annotate 'line', 4
    if_null rx1150_debug, debug_464
    rx1150_cur."!cursor_debug"("NEXT", "blockoid")
  debug_464:
  rx1150_fail:
    (rx1150_rep, rx1150_pos, $I10, $P10) = rx1150_cur."!mark_fail"(0)
    lt rx1150_pos, -1, rx1150_done
    eq rx1150_pos, -1, rx1150_fail
    jump $I10
  rx1150_done:
    rx1150_cur."!cursor_fail"()
    if_null rx1150_debug, debug_465
    rx1150_cur."!cursor_debug"("FAIL", "blockoid")
  debug_465:
    .return (rx1150_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("finishpad", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1156_debug, debug_466
    rx1156_cur."!cursor_debug"("START", "newpad")
  debug_466:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1158_done
    goto rxscan1158_scan
  rxscan1158_loop:
    ($P10) = rx1156_cur."from"()
    inc $P10
    set rx1156_pos, $P10
    ge rx1156_pos, rx1156_eos, rxscan1158_done
  rxscan1158_scan:
    set_addr $I10, rxscan1158_loop
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  rxscan1158_done:
.annotate 'line', 144
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "newpad")
    if_null rx1156_debug, debug_467
    rx1156_cur."!cursor_debug"("PASS", "newpad", " at pos=", rx1156_pos)
  debug_467:
    .return (rx1156_cur)
  rx1156_restart:
.annotate 'line', 4
    if_null rx1156_debug, debug_468
    rx1156_cur."!cursor_debug"("NEXT", "newpad")
  debug_468:
  rx1156_fail:
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    if_null rx1156_debug, debug_469
    rx1156_cur."!cursor_debug"("FAIL", "newpad")
  debug_469:
    .return (rx1156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "outerctx"  :subid("50_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    .local pmc rx1160_debug
    (rx1160_cur, rx1160_pos, rx1160_tgt, $I10) = self."!cursor_start"()
    getattribute rx1160_debug, rx1160_cur, "$!debug"
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
    eq $I10, 1, rx1160_restart
    if_null rx1160_debug, debug_470
    rx1160_cur."!cursor_debug"("START", "outerctx")
  debug_470:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1162_done
    goto rxscan1162_scan
  rxscan1162_loop:
    ($P10) = rx1160_cur."from"()
    inc $P10
    set rx1160_pos, $P10
    ge rx1160_pos, rx1160_eos, rxscan1162_done
  rxscan1162_scan:
    set_addr $I10, rxscan1162_loop
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  rxscan1162_done:
.annotate 'line', 145
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "outerctx")
    if_null rx1160_debug, debug_471
    rx1160_cur."!cursor_debug"("PASS", "outerctx", " at pos=", rx1160_pos)
  debug_471:
    .return (rx1160_cur)
  rx1160_restart:
.annotate 'line', 4
    if_null rx1160_debug, debug_472
    rx1160_cur."!cursor_debug"("NEXT", "outerctx")
  debug_472:
  rx1160_fail:
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    if_null rx1160_debug, debug_473
    rx1160_cur."!cursor_debug"("FAIL", "outerctx")
  debug_473:
    .return (rx1160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__outerctx"  :subid("51_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("52_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1164_tgt
    .local int rx1164_pos
    .local int rx1164_off
    .local int rx1164_eos
    .local int rx1164_rep
    .local pmc rx1164_cur
    .local pmc rx1164_debug
    (rx1164_cur, rx1164_pos, rx1164_tgt, $I10) = self."!cursor_start"()
    getattribute rx1164_debug, rx1164_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1164_cur
    .local pmc match
    .lex "$/", match
    length rx1164_eos, rx1164_tgt
    gt rx1164_pos, rx1164_eos, rx1164_done
    set rx1164_off, 0
    lt rx1164_pos, 2, rx1164_start
    sub rx1164_off, rx1164_pos, 1
    substr rx1164_tgt, rx1164_tgt, rx1164_off
  rx1164_start:
    eq $I10, 1, rx1164_restart
    if_null rx1164_debug, debug_474
    rx1164_cur."!cursor_debug"("START", "finishpad")
  debug_474:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1166_done
    goto rxscan1166_scan
  rxscan1166_loop:
    ($P10) = rx1164_cur."from"()
    inc $P10
    set rx1164_pos, $P10
    ge rx1164_pos, rx1164_eos, rxscan1166_done
  rxscan1166_scan:
    set_addr $I10, rxscan1166_loop
    rx1164_cur."!mark_push"(0, rx1164_pos, $I10)
  rxscan1166_done:
.annotate 'line', 146
  # rx pass
    rx1164_cur."!cursor_pass"(rx1164_pos, "finishpad")
    if_null rx1164_debug, debug_475
    rx1164_cur."!cursor_debug"("PASS", "finishpad", " at pos=", rx1164_pos)
  debug_475:
    .return (rx1164_cur)
  rx1164_restart:
.annotate 'line', 4
    if_null rx1164_debug, debug_476
    rx1164_cur."!cursor_debug"("NEXT", "finishpad")
  debug_476:
  rx1164_fail:
    (rx1164_rep, rx1164_pos, $I10, $P10) = rx1164_cur."!mark_fail"(0)
    lt rx1164_pos, -1, rx1164_done
    eq rx1164_pos, -1, rx1164_fail
    jump $I10
  rx1164_done:
    rx1164_cur."!cursor_fail"()
    if_null rx1164_debug, debug_477
    rx1164_cur."!cursor_debug"("FAIL", "finishpad")
  debug_477:
    .return (rx1164_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("53_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("54_1309998847.42912") :method
.annotate 'line', 148
    $P100 = self."!protoregex"("terminator")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("55_1309998847.42912") :method
.annotate 'line', 148
    $P101 = self."!PREFIX__!protoregex"("terminator")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("56_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1170_debug, debug_478
    rx1170_cur."!cursor_debug"("START", "terminator:sym<;>")
  debug_478:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1172_done
    goto rxscan1172_scan
  rxscan1172_loop:
    ($P10) = rx1170_cur."from"()
    inc $P10
    set rx1170_pos, $P10
    ge rx1170_pos, rx1170_eos, rxscan1172_done
  rxscan1172_scan:
    set_addr $I10, rxscan1172_loop
    rx1170_cur."!mark_push"(0, rx1170_pos, $I10)
  rxscan1172_done:
.annotate 'line', 150
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1170_pos, rx1170_off
    substr $S10, rx1170_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx1170_fail
  # rx pass
    rx1170_cur."!cursor_pass"(rx1170_pos, "terminator:sym<;>")
    if_null rx1170_debug, debug_479
    rx1170_cur."!cursor_debug"("PASS", "terminator:sym<;>", " at pos=", rx1170_pos)
  debug_479:
    .return (rx1170_cur)
  rx1170_restart:
.annotate 'line', 4
    if_null rx1170_debug, debug_480
    rx1170_cur."!cursor_debug"("NEXT", "terminator:sym<;>")
  debug_480:
  rx1170_fail:
    (rx1170_rep, rx1170_pos, $I10, $P10) = rx1170_cur."!mark_fail"(0)
    lt rx1170_pos, -1, rx1170_done
    eq rx1170_pos, -1, rx1170_fail
    jump $I10
  rx1170_done:
    rx1170_cur."!cursor_fail"()
    if_null rx1170_debug, debug_481
    rx1170_cur."!cursor_debug"("FAIL", "terminator:sym<;>")
  debug_481:
    .return (rx1170_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("57_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ";"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("58_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1174_tgt
    .local int rx1174_pos
    .local int rx1174_off
    .local int rx1174_eos
    .local int rx1174_rep
    .local pmc rx1174_cur
    .local pmc rx1174_debug
    (rx1174_cur, rx1174_pos, rx1174_tgt, $I10) = self."!cursor_start"()
    getattribute rx1174_debug, rx1174_cur, "$!debug"
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
    eq $I10, 1, rx1174_restart
    if_null rx1174_debug, debug_482
    rx1174_cur."!cursor_debug"("START", "terminator:sym<}>")
  debug_482:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1176_done
    goto rxscan1176_scan
  rxscan1176_loop:
    ($P10) = rx1174_cur."from"()
    inc $P10
    set rx1174_pos, $P10
    ge rx1174_pos, rx1174_eos, rxscan1176_done
  rxscan1176_scan:
    set_addr $I10, rxscan1176_loop
    rx1174_cur."!mark_push"(0, rx1174_pos, $I10)
  rxscan1176_done:
.annotate 'line', 151
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1174_pos, rx1174_off
    substr $S10, rx1174_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx1174_fail
  # rx pass
    rx1174_cur."!cursor_pass"(rx1174_pos, "terminator:sym<}>")
    if_null rx1174_debug, debug_483
    rx1174_cur."!cursor_debug"("PASS", "terminator:sym<}>", " at pos=", rx1174_pos)
  debug_483:
    .return (rx1174_cur)
  rx1174_restart:
.annotate 'line', 4
    if_null rx1174_debug, debug_484
    rx1174_cur."!cursor_debug"("NEXT", "terminator:sym<}>")
  debug_484:
  rx1174_fail:
    (rx1174_rep, rx1174_pos, $I10, $P10) = rx1174_cur."!mark_fail"(0)
    lt rx1174_pos, -1, rx1174_done
    eq rx1174_pos, -1, rx1174_fail
    jump $I10
  rx1174_done:
    rx1174_cur."!cursor_fail"()
    if_null rx1174_debug, debug_485
    rx1174_cur."!cursor_debug"("FAIL", "terminator:sym<}>")
  debug_485:
    .return (rx1174_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("59_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "}"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("60_1309998847.42912") :method
.annotate 'line', 155
    $P100 = self."!protoregex"("statement_control")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("61_1309998847.42912") :method
.annotate 'line', 155
    $P101 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("62_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1180_tgt
    .local int rx1180_pos
    .local int rx1180_off
    .local int rx1180_eos
    .local int rx1180_rep
    .local pmc rx1180_cur
    .local pmc rx1180_debug
    (rx1180_cur, rx1180_pos, rx1180_tgt, $I10) = self."!cursor_start"()
    rx1180_cur."!cursor_caparray"("xblock", "else")
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
    if_null rx1180_debug, debug_486
    rx1180_cur."!cursor_debug"("START", "statement_control:sym<if>")
  debug_486:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1182_done
    goto rxscan1182_scan
  rxscan1182_loop:
    ($P10) = rx1180_cur."from"()
    inc $P10
    set rx1180_pos, $P10
    ge rx1180_pos, rx1180_eos, rxscan1182_done
  rxscan1182_scan:
    set_addr $I10, rxscan1182_loop
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  rxscan1182_done:
.annotate 'line', 158
  # rx subcapture "sym"
    set_addr $I10, rxcap_1183_fail
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  # rx literal  "if"
    add $I11, rx1180_pos, 2
    gt $I11, rx1180_eos, rx1180_fail
    sub $I11, rx1180_pos, rx1180_off
    substr $S10, rx1180_tgt, $I11, 2
    ne $S10, "if", rx1180_fail
    add rx1180_pos, 2
    set_addr $I10, rxcap_1183_fail
    ($I12, $I11) = rx1180_cur."!mark_peek"($I10)
    rx1180_cur."!cursor_pos"($I11)
    ($P10) = rx1180_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1180_pos, "")
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1183_done
  rxcap_1183_fail:
    goto rx1180_fail
  rxcap_1183_done:
  # rx charclass s
    ge rx1180_pos, rx1180_eos, rx1180_fail
    sub $I10, rx1180_pos, rx1180_off
    is_cclass $I11, 32, rx1180_tgt, $I10
    unless $I11, rx1180_fail
    inc rx1180_pos
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
.annotate 'line', 159
  # rx subrule "xblock" subtype=capture negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."xblock"()
    unless $P10, rx1180_fail
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1180_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
.annotate 'line', 160
  # rx rxquantr1184 ** 0..*
    set_addr $I10, rxquantr1184_done
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  rxquantr1184_loop:
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx1180_pos, 5
    gt $I11, rx1180_eos, rx1180_fail
    sub $I11, rx1180_pos, rx1180_off
    substr $S10, rx1180_tgt, $I11, 5
    ne $S10, "elsif", rx1180_fail
    add rx1180_pos, 5
  # rx charclass s
    ge rx1180_pos, rx1180_eos, rx1180_fail
    sub $I10, rx1180_pos, rx1180_off
    is_cclass $I11, 32, rx1180_tgt, $I10
    unless $I11, rx1180_fail
    inc rx1180_pos
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."xblock"()
    unless $P10, rx1180_fail
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1180_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
    set_addr $I10, rxquantr1184_done
    (rx1180_rep) = rx1180_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1184_done
    rx1180_cur."!mark_push"(rx1180_rep, rx1180_pos, $I10)
    goto rxquantr1184_loop
  rxquantr1184_done:
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
.annotate 'line', 161
  # rx rxquantr1185 ** 0..1
    set_addr $I10, rxquantr1185_done
    rx1180_cur."!mark_push"(0, rx1180_pos, $I10)
  rxquantr1185_loop:
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx1180_pos, 4
    gt $I11, rx1180_eos, rx1180_fail
    sub $I11, rx1180_pos, rx1180_off
    substr $S10, rx1180_tgt, $I11, 4
    ne $S10, "else", rx1180_fail
    add rx1180_pos, 4
  # rx charclass s
    ge rx1180_pos, rx1180_eos, rx1180_fail
    sub $I10, rx1180_pos, rx1180_off
    is_cclass $I11, 32, rx1180_tgt, $I10
    unless $I11, rx1180_fail
    inc rx1180_pos
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."pblock"()
    unless $P10, rx1180_fail
    rx1180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx1180_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
    set_addr $I10, rxquantr1185_done
    (rx1180_rep) = rx1180_cur."!mark_commit"($I10)
  rxquantr1185_done:
  # rx subrule "ws" subtype=method negate=
    rx1180_cur."!cursor_pos"(rx1180_pos)
    $P10 = rx1180_cur."ws"()
    unless $P10, rx1180_fail
    rx1180_pos = $P10."pos"()
.annotate 'line', 157
  # rx pass
    rx1180_cur."!cursor_pass"(rx1180_pos, "statement_control:sym<if>")
    if_null rx1180_debug, debug_487
    rx1180_cur."!cursor_debug"("PASS", "statement_control:sym<if>", " at pos=", rx1180_pos)
  debug_487:
    .return (rx1180_cur)
  rx1180_restart:
.annotate 'line', 4
    if_null rx1180_debug, debug_488
    rx1180_cur."!cursor_debug"("NEXT", "statement_control:sym<if>")
  debug_488:
  rx1180_fail:
    (rx1180_rep, rx1180_pos, $I10, $P10) = rx1180_cur."!mark_fail"(0)
    lt rx1180_pos, -1, rx1180_done
    eq rx1180_pos, -1, rx1180_fail
    jump $I10
  rx1180_done:
    rx1180_cur."!cursor_fail"()
    if_null rx1180_debug, debug_489
    rx1180_cur."!cursor_debug"("FAIL", "statement_control:sym<if>")
  debug_489:
    .return (rx1180_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("63_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "if"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("64_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1193 = "66_1309998847.42912"
    capture_lex $P1193
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
    if_null rx1187_debug, debug_490
    rx1187_cur."!cursor_debug"("START", "statement_control:sym<unless>")
  debug_490:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1189_done
    goto rxscan1189_scan
  rxscan1189_loop:
    ($P10) = rx1187_cur."from"()
    inc $P10
    set rx1187_pos, $P10
    ge rx1187_pos, rx1187_eos, rxscan1189_done
  rxscan1189_scan:
    set_addr $I10, rxscan1189_loop
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  rxscan1189_done:
.annotate 'line', 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_1190_fail
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  # rx literal  "unless"
    add $I11, rx1187_pos, 6
    gt $I11, rx1187_eos, rx1187_fail
    sub $I11, rx1187_pos, rx1187_off
    substr $S10, rx1187_tgt, $I11, 6
    ne $S10, "unless", rx1187_fail
    add rx1187_pos, 6
    set_addr $I10, rxcap_1190_fail
    ($I12, $I11) = rx1187_cur."!mark_peek"($I10)
    rx1187_cur."!cursor_pos"($I11)
    ($P10) = rx1187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1187_pos, "")
    rx1187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1190_done
  rxcap_1190_fail:
    goto rx1187_fail
  rxcap_1190_done:
  # rx charclass s
    ge rx1187_pos, rx1187_eos, rx1187_fail
    sub $I10, rx1187_pos, rx1187_off
    is_cclass $I11, 32, rx1187_tgt, $I10
    unless $I11, rx1187_fail
    inc rx1187_pos
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
.annotate 'line', 166
  # rx subrule "xblock" subtype=capture negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."xblock"()
    unless $P10, rx1187_fail
    rx1187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1187_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
  alt1191_0:
.annotate 'line', 167
    set_addr $I10, alt1191_1
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx1187_cur."!cursor_pos"(rx1187_pos)
    .const 'Sub' $P1193 = "66_1309998847.42912"
    capture_lex $P1193
    $P10 = rx1187_cur."before"($P1193)
    if $P10, rx1187_fail
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
    goto alt1191_end
  alt1191_1:
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
  alt1191_end:
  # rx subrule "ws" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."ws"()
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
.annotate 'line', 164
  # rx pass
    rx1187_cur."!cursor_pass"(rx1187_pos, "statement_control:sym<unless>")
    if_null rx1187_debug, debug_495
    rx1187_cur."!cursor_debug"("PASS", "statement_control:sym<unless>", " at pos=", rx1187_pos)
  debug_495:
    .return (rx1187_cur)
  rx1187_restart:
.annotate 'line', 4
    if_null rx1187_debug, debug_496
    rx1187_cur."!cursor_debug"("NEXT", "statement_control:sym<unless>")
  debug_496:
  rx1187_fail:
    (rx1187_rep, rx1187_pos, $I10, $P10) = rx1187_cur."!mark_fail"(0)
    lt rx1187_pos, -1, rx1187_done
    eq rx1187_pos, -1, rx1187_fail
    jump $I10
  rx1187_done:
    rx1187_cur."!cursor_fail"()
    if_null rx1187_debug, debug_497
    rx1187_cur."!cursor_debug"("FAIL", "statement_control:sym<unless>")
  debug_497:
    .return (rx1187_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("65_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "unless"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1192"  :anon :subid("66_1309998847.42912") :method :outer("64_1309998847.42912")
.annotate 'line', 167
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
    if_null rx1194_debug, debug_491
    rx1194_cur."!cursor_debug"("START", "")
  debug_491:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1195_done
    goto rxscan1195_scan
  rxscan1195_loop:
    ($P10) = rx1194_cur."from"()
    inc $P10
    set rx1194_pos, $P10
    ge rx1194_pos, rx1194_eos, rxscan1195_done
  rxscan1195_scan:
    set_addr $I10, rxscan1195_loop
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  rxscan1195_done:
  # rx literal  "else"
    add $I11, rx1194_pos, 4
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 4
    ne $S10, "else", rx1194_fail
    add rx1194_pos, 4
  # rx pass
    rx1194_cur."!cursor_pass"(rx1194_pos, "")
    if_null rx1194_debug, debug_492
    rx1194_cur."!cursor_debug"("PASS", "", " at pos=", rx1194_pos)
  debug_492:
    .return (rx1194_cur)
  rx1194_restart:
    if_null rx1194_debug, debug_493
    rx1194_cur."!cursor_debug"("NEXT", "")
  debug_493:
  rx1194_fail:
    (rx1194_rep, rx1194_pos, $I10, $P10) = rx1194_cur."!mark_fail"(0)
    lt rx1194_pos, -1, rx1194_done
    eq rx1194_pos, -1, rx1194_fail
    jump $I10
  rx1194_done:
    rx1194_cur."!cursor_fail"()
    if_null rx1194_debug, debug_494
    rx1194_cur."!cursor_debug"("FAIL", "")
  debug_494:
    .return (rx1194_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("67_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    .local pmc rx1197_debug
    (rx1197_cur, rx1197_pos, rx1197_tgt, $I10) = self."!cursor_start"()
    getattribute rx1197_debug, rx1197_cur, "$!debug"
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
    eq $I10, 1, rx1197_restart
    if_null rx1197_debug, debug_498
    rx1197_cur."!cursor_debug"("START", "statement_control:sym<while>")
  debug_498:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1199_done
    goto rxscan1199_scan
  rxscan1199_loop:
    ($P10) = rx1197_cur."from"()
    inc $P10
    set rx1197_pos, $P10
    ge rx1197_pos, rx1197_eos, rxscan1199_done
  rxscan1199_scan:
    set_addr $I10, rxscan1199_loop
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  rxscan1199_done:
.annotate 'line', 171
  # rx subcapture "sym"
    set_addr $I10, rxcap_1201_fail
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  alt1200_0:
    set_addr $I10, alt1200_1
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  # rx literal  "while"
    add $I11, rx1197_pos, 5
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 5
    ne $S10, "while", rx1197_fail
    add rx1197_pos, 5
    goto alt1200_end
  alt1200_1:
  # rx literal  "until"
    add $I11, rx1197_pos, 5
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 5
    ne $S10, "until", rx1197_fail
    add rx1197_pos, 5
  alt1200_end:
    set_addr $I10, rxcap_1201_fail
    ($I12, $I11) = rx1197_cur."!mark_peek"($I10)
    rx1197_cur."!cursor_pos"($I11)
    ($P10) = rx1197_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1197_pos, "")
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1201_done
  rxcap_1201_fail:
    goto rx1197_fail
  rxcap_1201_done:
  # rx charclass s
    ge rx1197_pos, rx1197_eos, rx1197_fail
    sub $I10, rx1197_pos, rx1197_off
    is_cclass $I11, 32, rx1197_tgt, $I10
    unless $I11, rx1197_fail
    inc rx1197_pos
  # rx subrule "ws" subtype=method negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."ws"()
    unless $P10, rx1197_fail
    rx1197_pos = $P10."pos"()
.annotate 'line', 172
  # rx subrule "xblock" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."xblock"()
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1197_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."ws"()
    unless $P10, rx1197_fail
    rx1197_pos = $P10."pos"()
.annotate 'line', 170
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "statement_control:sym<while>")
    if_null rx1197_debug, debug_499
    rx1197_cur."!cursor_debug"("PASS", "statement_control:sym<while>", " at pos=", rx1197_pos)
  debug_499:
    .return (rx1197_cur)
  rx1197_restart:
.annotate 'line', 4
    if_null rx1197_debug, debug_500
    rx1197_cur."!cursor_debug"("NEXT", "statement_control:sym<while>")
  debug_500:
  rx1197_fail:
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    if_null rx1197_debug, debug_501
    rx1197_cur."!cursor_debug"("FAIL", "statement_control:sym<while>")
  debug_501:
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("68_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "until"
    push $P100, "while"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("69_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1203_tgt
    .local int rx1203_pos
    .local int rx1203_off
    .local int rx1203_eos
    .local int rx1203_rep
    .local pmc rx1203_cur
    .local pmc rx1203_debug
    (rx1203_cur, rx1203_pos, rx1203_tgt, $I10) = self."!cursor_start"()
    getattribute rx1203_debug, rx1203_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1203_cur
    .local pmc match
    .lex "$/", match
    length rx1203_eos, rx1203_tgt
    gt rx1203_pos, rx1203_eos, rx1203_done
    set rx1203_off, 0
    lt rx1203_pos, 2, rx1203_start
    sub rx1203_off, rx1203_pos, 1
    substr rx1203_tgt, rx1203_tgt, rx1203_off
  rx1203_start:
    eq $I10, 1, rx1203_restart
    if_null rx1203_debug, debug_502
    rx1203_cur."!cursor_debug"("START", "statement_control:sym<repeat>")
  debug_502:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1203_cur."from"()
    inc $P10
    set rx1203_pos, $P10
    ge rx1203_pos, rx1203_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  rxscan1205_done:
.annotate 'line', 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_1206_fail
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx1203_pos, 6
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 6
    ne $S10, "repeat", rx1203_fail
    add rx1203_pos, 6
    set_addr $I10, rxcap_1206_fail
    ($I12, $I11) = rx1203_cur."!mark_peek"($I10)
    rx1203_cur."!cursor_pos"($I11)
    ($P10) = rx1203_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1203_pos, "")
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1206_done
  rxcap_1206_fail:
    goto rx1203_fail
  rxcap_1206_done:
  # rx charclass s
    ge rx1203_pos, rx1203_eos, rx1203_fail
    sub $I10, rx1203_pos, rx1203_off
    is_cclass $I11, 32, rx1203_tgt, $I10
    unless $I11, rx1203_fail
    inc rx1203_pos
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  alt1207_0:
.annotate 'line', 177
    set_addr $I10, alt1207_1
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
.annotate 'line', 178
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_1209_fail
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  alt1208_0:
    set_addr $I10, alt1208_1
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  # rx literal  "while"
    add $I11, rx1203_pos, 5
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 5
    ne $S10, "while", rx1203_fail
    add rx1203_pos, 5
    goto alt1208_end
  alt1208_1:
  # rx literal  "until"
    add $I11, rx1203_pos, 5
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 5
    ne $S10, "until", rx1203_fail
    add rx1203_pos, 5
  alt1208_end:
    set_addr $I10, rxcap_1209_fail
    ($I12, $I11) = rx1203_cur."!mark_peek"($I10)
    rx1203_cur."!cursor_pos"($I11)
    ($P10) = rx1203_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1203_pos, "")
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_1209_done
  rxcap_1209_fail:
    goto rx1203_fail
  rxcap_1209_done:
  # rx charclass s
    ge rx1203_pos, rx1203_eos, rx1203_fail
    sub $I10, rx1203_pos, rx1203_off
    is_cclass $I11, 32, rx1203_tgt, $I10
    unless $I11, rx1203_fail
    inc rx1203_pos
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."xblock"()
    unless $P10, rx1203_fail
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1203_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
    goto alt1207_end
  alt1207_1:
.annotate 'line', 179
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."pblock"()
    unless $P10, rx1203_fail
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx1203_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_1211_fail
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  alt1210_0:
    set_addr $I10, alt1210_1
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  # rx literal  "while"
    add $I11, rx1203_pos, 5
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 5
    ne $S10, "while", rx1203_fail
    add rx1203_pos, 5
    goto alt1210_end
  alt1210_1:
  # rx literal  "until"
    add $I11, rx1203_pos, 5
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 5
    ne $S10, "until", rx1203_fail
    add rx1203_pos, 5
  alt1210_end:
    set_addr $I10, rxcap_1211_fail
    ($I12, $I11) = rx1203_cur."!mark_peek"($I10)
    rx1203_cur."!cursor_pos"($I11)
    ($P10) = rx1203_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1203_pos, "")
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_1211_done
  rxcap_1211_fail:
    goto rx1203_fail
  rxcap_1211_done:
  # rx charclass s
    ge rx1203_pos, rx1203_eos, rx1203_fail
    sub $I10, rx1203_pos, rx1203_off
    is_cclass $I11, 32, rx1203_tgt, $I10
    unless $I11, rx1203_fail
    inc rx1203_pos
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."EXPR"()
    unless $P10, rx1203_fail
    rx1203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1203_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
  alt1207_end:
.annotate 'line', 180
  # rx subrule "ws" subtype=method negate=
    rx1203_cur."!cursor_pos"(rx1203_pos)
    $P10 = rx1203_cur."ws"()
    unless $P10, rx1203_fail
    rx1203_pos = $P10."pos"()
.annotate 'line', 175
  # rx pass
    rx1203_cur."!cursor_pass"(rx1203_pos, "statement_control:sym<repeat>")
    if_null rx1203_debug, debug_503
    rx1203_cur."!cursor_debug"("PASS", "statement_control:sym<repeat>", " at pos=", rx1203_pos)
  debug_503:
    .return (rx1203_cur)
  rx1203_restart:
.annotate 'line', 4
    if_null rx1203_debug, debug_504
    rx1203_cur."!cursor_debug"("NEXT", "statement_control:sym<repeat>")
  debug_504:
  rx1203_fail:
    (rx1203_rep, rx1203_pos, $I10, $P10) = rx1203_cur."!mark_fail"(0)
    lt rx1203_pos, -1, rx1203_done
    eq rx1203_pos, -1, rx1203_fail
    jump $I10
  rx1203_done:
    rx1203_cur."!cursor_fail"()
    if_null rx1203_debug, debug_505
    rx1203_cur."!cursor_debug"("FAIL", "statement_control:sym<repeat>")
  debug_505:
    .return (rx1203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("70_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "repeat"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("71_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1213_tgt
    .local int rx1213_pos
    .local int rx1213_off
    .local int rx1213_eos
    .local int rx1213_rep
    .local pmc rx1213_cur
    .local pmc rx1213_debug
    (rx1213_cur, rx1213_pos, rx1213_tgt, $I10) = self."!cursor_start"()
    getattribute rx1213_debug, rx1213_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1213_cur
    .local pmc match
    .lex "$/", match
    length rx1213_eos, rx1213_tgt
    gt rx1213_pos, rx1213_eos, rx1213_done
    set rx1213_off, 0
    lt rx1213_pos, 2, rx1213_start
    sub rx1213_off, rx1213_pos, 1
    substr rx1213_tgt, rx1213_tgt, rx1213_off
  rx1213_start:
    eq $I10, 1, rx1213_restart
    if_null rx1213_debug, debug_506
    rx1213_cur."!cursor_debug"("START", "statement_control:sym<for>")
  debug_506:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1215_done
    goto rxscan1215_scan
  rxscan1215_loop:
    ($P10) = rx1213_cur."from"()
    inc $P10
    set rx1213_pos, $P10
    ge rx1213_pos, rx1213_eos, rxscan1215_done
  rxscan1215_scan:
    set_addr $I10, rxscan1215_loop
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  rxscan1215_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_1216_fail
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  # rx literal  "for"
    add $I11, rx1213_pos, 3
    gt $I11, rx1213_eos, rx1213_fail
    sub $I11, rx1213_pos, rx1213_off
    substr $S10, rx1213_tgt, $I11, 3
    ne $S10, "for", rx1213_fail
    add rx1213_pos, 3
    set_addr $I10, rxcap_1216_fail
    ($I12, $I11) = rx1213_cur."!mark_peek"($I10)
    rx1213_cur."!cursor_pos"($I11)
    ($P10) = rx1213_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1213_pos, "")
    rx1213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1216_done
  rxcap_1216_fail:
    goto rx1213_fail
  rxcap_1216_done:
  # rx charclass s
    ge rx1213_pos, rx1213_eos, rx1213_fail
    sub $I10, rx1213_pos, rx1213_off
    is_cclass $I11, 32, rx1213_tgt, $I10
    unless $I11, rx1213_fail
    inc rx1213_pos
  # rx subrule "ws" subtype=method negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."ws"()
    unless $P10, rx1213_fail
    rx1213_pos = $P10."pos"()
.annotate 'line', 185
  # rx subrule "xblock" subtype=capture negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."xblock"()
    unless $P10, rx1213_fail
    rx1213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx1213_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1213_cur."!cursor_pos"(rx1213_pos)
    $P10 = rx1213_cur."ws"()
    unless $P10, rx1213_fail
    rx1213_pos = $P10."pos"()
.annotate 'line', 183
  # rx pass
    rx1213_cur."!cursor_pass"(rx1213_pos, "statement_control:sym<for>")
    if_null rx1213_debug, debug_507
    rx1213_cur."!cursor_debug"("PASS", "statement_control:sym<for>", " at pos=", rx1213_pos)
  debug_507:
    .return (rx1213_cur)
  rx1213_restart:
.annotate 'line', 4
    if_null rx1213_debug, debug_508
    rx1213_cur."!cursor_debug"("NEXT", "statement_control:sym<for>")
  debug_508:
  rx1213_fail:
    (rx1213_rep, rx1213_pos, $I10, $P10) = rx1213_cur."!mark_fail"(0)
    lt rx1213_pos, -1, rx1213_done
    eq rx1213_pos, -1, rx1213_fail
    jump $I10
  rx1213_done:
    rx1213_cur."!cursor_fail"()
    if_null rx1213_debug, debug_509
    rx1213_cur."!cursor_debug"("FAIL", "statement_control:sym<for>")
  debug_509:
    .return (rx1213_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("72_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "for"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("73_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1218_tgt
    .local int rx1218_pos
    .local int rx1218_off
    .local int rx1218_eos
    .local int rx1218_rep
    .local pmc rx1218_cur
    .local pmc rx1218_debug
    (rx1218_cur, rx1218_pos, rx1218_tgt, $I10) = self."!cursor_start"()
    getattribute rx1218_debug, rx1218_cur, "$!debug"
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
    eq $I10, 1, rx1218_restart
    if_null rx1218_debug, debug_510
    rx1218_cur."!cursor_debug"("START", "statement_control:sym<CATCH>")
  debug_510:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1220_done
    goto rxscan1220_scan
  rxscan1220_loop:
    ($P10) = rx1218_cur."from"()
    inc $P10
    set rx1218_pos, $P10
    ge rx1218_pos, rx1218_eos, rxscan1220_done
  rxscan1220_scan:
    set_addr $I10, rxscan1220_loop
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  rxscan1220_done:
.annotate 'line', 189
  # rx subcapture "sym"
    set_addr $I10, rxcap_1221_fail
    rx1218_cur."!mark_push"(0, rx1218_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx1218_pos, 5
    gt $I11, rx1218_eos, rx1218_fail
    sub $I11, rx1218_pos, rx1218_off
    substr $S10, rx1218_tgt, $I11, 5
    ne $S10, "CATCH", rx1218_fail
    add rx1218_pos, 5
    set_addr $I10, rxcap_1221_fail
    ($I12, $I11) = rx1218_cur."!mark_peek"($I10)
    rx1218_cur."!cursor_pos"($I11)
    ($P10) = rx1218_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1218_pos, "")
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1221_done
  rxcap_1221_fail:
    goto rx1218_fail
  rxcap_1221_done:
  # rx charclass s
    ge rx1218_pos, rx1218_eos, rx1218_fail
    sub $I10, rx1218_pos, rx1218_off
    is_cclass $I11, 32, rx1218_tgt, $I10
    unless $I11, rx1218_fail
    inc rx1218_pos
  # rx subrule "ws" subtype=method negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."ws"()
    unless $P10, rx1218_fail
    rx1218_pos = $P10."pos"()
.annotate 'line', 190
  # rx subrule "block" subtype=capture negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."block"()
    unless $P10, rx1218_fail
    rx1218_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1218_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1218_cur."!cursor_pos"(rx1218_pos)
    $P10 = rx1218_cur."ws"()
    unless $P10, rx1218_fail
    rx1218_pos = $P10."pos"()
.annotate 'line', 188
  # rx pass
    rx1218_cur."!cursor_pass"(rx1218_pos, "statement_control:sym<CATCH>")
    if_null rx1218_debug, debug_511
    rx1218_cur."!cursor_debug"("PASS", "statement_control:sym<CATCH>", " at pos=", rx1218_pos)
  debug_511:
    .return (rx1218_cur)
  rx1218_restart:
.annotate 'line', 4
    if_null rx1218_debug, debug_512
    rx1218_cur."!cursor_debug"("NEXT", "statement_control:sym<CATCH>")
  debug_512:
  rx1218_fail:
    (rx1218_rep, rx1218_pos, $I10, $P10) = rx1218_cur."!mark_fail"(0)
    lt rx1218_pos, -1, rx1218_done
    eq rx1218_pos, -1, rx1218_fail
    jump $I10
  rx1218_done:
    rx1218_cur."!cursor_fail"()
    if_null rx1218_debug, debug_513
    rx1218_cur."!cursor_debug"("FAIL", "statement_control:sym<CATCH>")
  debug_513:
    .return (rx1218_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("74_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "CATCH"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("75_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1223_tgt
    .local int rx1223_pos
    .local int rx1223_off
    .local int rx1223_eos
    .local int rx1223_rep
    .local pmc rx1223_cur
    .local pmc rx1223_debug
    (rx1223_cur, rx1223_pos, rx1223_tgt, $I10) = self."!cursor_start"()
    getattribute rx1223_debug, rx1223_cur, "$!debug"
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
    eq $I10, 1, rx1223_restart
    if_null rx1223_debug, debug_514
    rx1223_cur."!cursor_debug"("START", "statement_control:sym<CONTROL>")
  debug_514:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1225_done
    goto rxscan1225_scan
  rxscan1225_loop:
    ($P10) = rx1223_cur."from"()
    inc $P10
    set rx1223_pos, $P10
    ge rx1223_pos, rx1223_eos, rxscan1225_done
  rxscan1225_scan:
    set_addr $I10, rxscan1225_loop
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  rxscan1225_done:
.annotate 'line', 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_1226_fail
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx1223_pos, 7
    gt $I11, rx1223_eos, rx1223_fail
    sub $I11, rx1223_pos, rx1223_off
    substr $S10, rx1223_tgt, $I11, 7
    ne $S10, "CONTROL", rx1223_fail
    add rx1223_pos, 7
    set_addr $I10, rxcap_1226_fail
    ($I12, $I11) = rx1223_cur."!mark_peek"($I10)
    rx1223_cur."!cursor_pos"($I11)
    ($P10) = rx1223_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1223_pos, "")
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1226_done
  rxcap_1226_fail:
    goto rx1223_fail
  rxcap_1226_done:
  # rx charclass s
    ge rx1223_pos, rx1223_eos, rx1223_fail
    sub $I10, rx1223_pos, rx1223_off
    is_cclass $I11, 32, rx1223_tgt, $I10
    unless $I11, rx1223_fail
    inc rx1223_pos
  # rx subrule "ws" subtype=method negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."ws"()
    unless $P10, rx1223_fail
    rx1223_pos = $P10."pos"()
.annotate 'line', 195
  # rx subrule "block" subtype=capture negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."block"()
    unless $P10, rx1223_fail
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1223_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."ws"()
    unless $P10, rx1223_fail
    rx1223_pos = $P10."pos"()
.annotate 'line', 193
  # rx pass
    rx1223_cur."!cursor_pass"(rx1223_pos, "statement_control:sym<CONTROL>")
    if_null rx1223_debug, debug_515
    rx1223_cur."!cursor_debug"("PASS", "statement_control:sym<CONTROL>", " at pos=", rx1223_pos)
  debug_515:
    .return (rx1223_cur)
  rx1223_restart:
.annotate 'line', 4
    if_null rx1223_debug, debug_516
    rx1223_cur."!cursor_debug"("NEXT", "statement_control:sym<CONTROL>")
  debug_516:
  rx1223_fail:
    (rx1223_rep, rx1223_pos, $I10, $P10) = rx1223_cur."!mark_fail"(0)
    lt rx1223_pos, -1, rx1223_done
    eq rx1223_pos, -1, rx1223_fail
    jump $I10
  rx1223_done:
    rx1223_cur."!cursor_fail"()
    if_null rx1223_debug, debug_517
    rx1223_cur."!cursor_debug"("FAIL", "statement_control:sym<CONTROL>")
  debug_517:
    .return (rx1223_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("76_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "CONTROL"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("77_1309998847.42912") :method
.annotate 'line', 198
    $P100 = self."!protoregex"("statement_prefix")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("78_1309998847.42912") :method
.annotate 'line', 198
    $P101 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("79_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1230_tgt
    .local int rx1230_pos
    .local int rx1230_off
    .local int rx1230_eos
    .local int rx1230_rep
    .local pmc rx1230_cur
    .local pmc rx1230_debug
    (rx1230_cur, rx1230_pos, rx1230_tgt, $I10) = self."!cursor_start"()
    getattribute rx1230_debug, rx1230_cur, "$!debug"
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
    eq $I10, 1, rx1230_restart
    if_null rx1230_debug, debug_518
    rx1230_cur."!cursor_debug"("START", "statement_prefix:sym<INIT>")
  debug_518:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1232_done
    goto rxscan1232_scan
  rxscan1232_loop:
    ($P10) = rx1230_cur."from"()
    inc $P10
    set rx1230_pos, $P10
    ge rx1230_pos, rx1230_eos, rxscan1232_done
  rxscan1232_scan:
    set_addr $I10, rxscan1232_loop
    rx1230_cur."!mark_push"(0, rx1230_pos, $I10)
  rxscan1232_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_1233_fail
    rx1230_cur."!mark_push"(0, rx1230_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx1230_pos, 4
    gt $I11, rx1230_eos, rx1230_fail
    sub $I11, rx1230_pos, rx1230_off
    substr $S10, rx1230_tgt, $I11, 4
    ne $S10, "INIT", rx1230_fail
    add rx1230_pos, 4
    set_addr $I10, rxcap_1233_fail
    ($I12, $I11) = rx1230_cur."!mark_peek"($I10)
    rx1230_cur."!cursor_pos"($I11)
    ($P10) = rx1230_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1230_pos, "")
    rx1230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1233_done
  rxcap_1233_fail:
    goto rx1230_fail
  rxcap_1233_done:
  # rx subrule "blorst" subtype=capture negate=
    rx1230_cur."!cursor_pos"(rx1230_pos)
    $P10 = rx1230_cur."blorst"()
    unless $P10, rx1230_fail
    rx1230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx1230_pos = $P10."pos"()
  # rx pass
    rx1230_cur."!cursor_pass"(rx1230_pos, "statement_prefix:sym<INIT>")
    if_null rx1230_debug, debug_519
    rx1230_cur."!cursor_debug"("PASS", "statement_prefix:sym<INIT>", " at pos=", rx1230_pos)
  debug_519:
    .return (rx1230_cur)
  rx1230_restart:
.annotate 'line', 4
    if_null rx1230_debug, debug_520
    rx1230_cur."!cursor_debug"("NEXT", "statement_prefix:sym<INIT>")
  debug_520:
  rx1230_fail:
    (rx1230_rep, rx1230_pos, $I10, $P10) = rx1230_cur."!mark_fail"(0)
    lt rx1230_pos, -1, rx1230_done
    eq rx1230_pos, -1, rx1230_fail
    jump $I10
  rx1230_done:
    rx1230_cur."!cursor_fail"()
    if_null rx1230_debug, debug_521
    rx1230_cur."!cursor_debug"("FAIL", "statement_prefix:sym<INIT>")
  debug_521:
    .return (rx1230_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("80_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("81_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1235_debug, debug_522
    rx1235_cur."!cursor_debug"("START", "statement_prefix:sym<try>")
  debug_522:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1237_done
    goto rxscan1237_scan
  rxscan1237_loop:
    ($P10) = rx1235_cur."from"()
    inc $P10
    set rx1235_pos, $P10
    ge rx1235_pos, rx1235_eos, rxscan1237_done
  rxscan1237_scan:
    set_addr $I10, rxscan1237_loop
    rx1235_cur."!mark_push"(0, rx1235_pos, $I10)
  rxscan1237_done:
.annotate 'line', 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_1238_fail
    rx1235_cur."!mark_push"(0, rx1235_pos, $I10)
  # rx literal  "try"
    add $I11, rx1235_pos, 3
    gt $I11, rx1235_eos, rx1235_fail
    sub $I11, rx1235_pos, rx1235_off
    substr $S10, rx1235_tgt, $I11, 3
    ne $S10, "try", rx1235_fail
    add rx1235_pos, 3
    set_addr $I10, rxcap_1238_fail
    ($I12, $I11) = rx1235_cur."!mark_peek"($I10)
    rx1235_cur."!cursor_pos"($I11)
    ($P10) = rx1235_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1235_pos, "")
    rx1235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1238_done
  rxcap_1238_fail:
    goto rx1235_fail
  rxcap_1238_done:
.annotate 'line', 203
  # rx subrule "blorst" subtype=capture negate=
    rx1235_cur."!cursor_pos"(rx1235_pos)
    $P10 = rx1235_cur."blorst"()
    unless $P10, rx1235_fail
    rx1235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx1235_pos = $P10."pos"()
.annotate 'line', 201
  # rx pass
    rx1235_cur."!cursor_pass"(rx1235_pos, "statement_prefix:sym<try>")
    if_null rx1235_debug, debug_523
    rx1235_cur."!cursor_debug"("PASS", "statement_prefix:sym<try>", " at pos=", rx1235_pos)
  debug_523:
    .return (rx1235_cur)
  rx1235_restart:
.annotate 'line', 4
    if_null rx1235_debug, debug_524
    rx1235_cur."!cursor_debug"("NEXT", "statement_prefix:sym<try>")
  debug_524:
  rx1235_fail:
    (rx1235_rep, rx1235_pos, $I10, $P10) = rx1235_cur."!mark_fail"(0)
    lt rx1235_pos, -1, rx1235_done
    eq rx1235_pos, -1, rx1235_fail
    jump $I10
  rx1235_done:
    rx1235_cur."!cursor_fail"()
    if_null rx1235_debug, debug_525
    rx1235_cur."!cursor_debug"("FAIL", "statement_prefix:sym<try>")
  debug_525:
    .return (rx1235_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("82_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("blorst", "try")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("83_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1240_debug, debug_526
    rx1240_cur."!cursor_debug"("START", "blorst")
  debug_526:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1242_done
    goto rxscan1242_scan
  rxscan1242_loop:
    ($P10) = rx1240_cur."from"()
    inc $P10
    set rx1240_pos, $P10
    ge rx1240_pos, rx1240_eos, rxscan1242_done
  rxscan1242_scan:
    set_addr $I10, rxscan1242_loop
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  rxscan1242_done:
.annotate 'line', 207
  # rx charclass s
    ge rx1240_pos, rx1240_eos, rx1240_fail
    sub $I10, rx1240_pos, rx1240_off
    is_cclass $I11, 32, rx1240_tgt, $I10
    unless $I11, rx1240_fail
    inc rx1240_pos
  # rx subrule "ws" subtype=method negate=
    rx1240_cur."!cursor_pos"(rx1240_pos)
    $P10 = rx1240_cur."ws"()
    unless $P10, rx1240_fail
    rx1240_pos = $P10."pos"()
  alt1243_0:
    set_addr $I10, alt1243_1
    rx1240_cur."!mark_push"(0, rx1240_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1240_pos, rx1240_off
    substr $S10, rx1240_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1240_fail
  # rx subrule "block" subtype=capture negate=
    rx1240_cur."!cursor_pos"(rx1240_pos)
    $P10 = rx1240_cur."block"()
    unless $P10, rx1240_fail
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1240_pos = $P10."pos"()
    goto alt1243_end
  alt1243_1:
  # rx subrule "statement" subtype=capture negate=
    rx1240_cur."!cursor_pos"(rx1240_pos)
    $P10 = rx1240_cur."statement"()
    unless $P10, rx1240_fail
    rx1240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1240_pos = $P10."pos"()
  alt1243_end:
.annotate 'line', 206
  # rx pass
    rx1240_cur."!cursor_pass"(rx1240_pos, "blorst")
    if_null rx1240_debug, debug_527
    rx1240_cur."!cursor_debug"("PASS", "blorst", " at pos=", rx1240_pos)
  debug_527:
    .return (rx1240_cur)
  rx1240_restart:
.annotate 'line', 4
    if_null rx1240_debug, debug_528
    rx1240_cur."!cursor_debug"("NEXT", "blorst")
  debug_528:
  rx1240_fail:
    (rx1240_rep, rx1240_pos, $I10, $P10) = rx1240_cur."!mark_fail"(0)
    lt rx1240_pos, -1, rx1240_done
    eq rx1240_pos, -1, rx1240_fail
    jump $I10
  rx1240_done:
    rx1240_cur."!cursor_fail"()
    if_null rx1240_debug, debug_529
    rx1240_cur."!cursor_debug"("FAIL", "blorst")
  debug_529:
    .return (rx1240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("84_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("85_1309998847.42912") :method
.annotate 'line', 212
    $P100 = self."!protoregex"("statement_mod_cond")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("86_1309998847.42912") :method
.annotate 'line', 212
    $P101 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("87_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1247_debug, debug_530
    rx1247_cur."!cursor_debug"("START", "statement_mod_cond:sym<if>")
  debug_530:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1249_done
    goto rxscan1249_scan
  rxscan1249_loop:
    ($P10) = rx1247_cur."from"()
    inc $P10
    set rx1247_pos, $P10
    ge rx1247_pos, rx1247_eos, rxscan1249_done
  rxscan1249_scan:
    set_addr $I10, rxscan1249_loop
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  rxscan1249_done:
.annotate 'line', 214
  # rx subcapture "sym"
    set_addr $I10, rxcap_1250_fail
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  # rx literal  "if"
    add $I11, rx1247_pos, 2
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    substr $S10, rx1247_tgt, $I11, 2
    ne $S10, "if", rx1247_fail
    add rx1247_pos, 2
    set_addr $I10, rxcap_1250_fail
    ($I12, $I11) = rx1247_cur."!mark_peek"($I10)
    rx1247_cur."!cursor_pos"($I11)
    ($P10) = rx1247_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1247_pos, "")
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1250_done
  rxcap_1250_fail:
    goto rx1247_fail
  rxcap_1250_done:
  # rx subrule "ws" subtype=method negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."ws"()
    unless $P10, rx1247_fail
    rx1247_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."EXPR"()
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx1247_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."ws"()
    unless $P10, rx1247_fail
    rx1247_pos = $P10."pos"()
  # rx pass
    rx1247_cur."!cursor_pass"(rx1247_pos, "statement_mod_cond:sym<if>")
    if_null rx1247_debug, debug_531
    rx1247_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<if>", " at pos=", rx1247_pos)
  debug_531:
    .return (rx1247_cur)
  rx1247_restart:
.annotate 'line', 4
    if_null rx1247_debug, debug_532
    rx1247_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<if>")
  debug_532:
  rx1247_fail:
    (rx1247_rep, rx1247_pos, $I10, $P10) = rx1247_cur."!mark_fail"(0)
    lt rx1247_pos, -1, rx1247_done
    eq rx1247_pos, -1, rx1247_fail
    jump $I10
  rx1247_done:
    rx1247_cur."!cursor_fail"()
    if_null rx1247_debug, debug_533
    rx1247_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<if>")
  debug_533:
    .return (rx1247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("88_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "if")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("89_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1252_tgt
    .local int rx1252_pos
    .local int rx1252_off
    .local int rx1252_eos
    .local int rx1252_rep
    .local pmc rx1252_cur
    .local pmc rx1252_debug
    (rx1252_cur, rx1252_pos, rx1252_tgt, $I10) = self."!cursor_start"()
    getattribute rx1252_debug, rx1252_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1252_cur
    .local pmc match
    .lex "$/", match
    length rx1252_eos, rx1252_tgt
    gt rx1252_pos, rx1252_eos, rx1252_done
    set rx1252_off, 0
    lt rx1252_pos, 2, rx1252_start
    sub rx1252_off, rx1252_pos, 1
    substr rx1252_tgt, rx1252_tgt, rx1252_off
  rx1252_start:
    eq $I10, 1, rx1252_restart
    if_null rx1252_debug, debug_534
    rx1252_cur."!cursor_debug"("START", "statement_mod_cond:sym<unless>")
  debug_534:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1254_done
    goto rxscan1254_scan
  rxscan1254_loop:
    ($P10) = rx1252_cur."from"()
    inc $P10
    set rx1252_pos, $P10
    ge rx1252_pos, rx1252_eos, rxscan1254_done
  rxscan1254_scan:
    set_addr $I10, rxscan1254_loop
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  rxscan1254_done:
.annotate 'line', 215
  # rx subcapture "sym"
    set_addr $I10, rxcap_1255_fail
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  # rx literal  "unless"
    add $I11, rx1252_pos, 6
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    substr $S10, rx1252_tgt, $I11, 6
    ne $S10, "unless", rx1252_fail
    add rx1252_pos, 6
    set_addr $I10, rxcap_1255_fail
    ($I12, $I11) = rx1252_cur."!mark_peek"($I10)
    rx1252_cur."!cursor_pos"($I11)
    ($P10) = rx1252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1252_pos, "")
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1255_done
  rxcap_1255_fail:
    goto rx1252_fail
  rxcap_1255_done:
  # rx subrule "ws" subtype=method negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."ws"()
    unless $P10, rx1252_fail
    rx1252_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."EXPR"()
    unless $P10, rx1252_fail
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx1252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."ws"()
    unless $P10, rx1252_fail
    rx1252_pos = $P10."pos"()
  # rx pass
    rx1252_cur."!cursor_pass"(rx1252_pos, "statement_mod_cond:sym<unless>")
    if_null rx1252_debug, debug_535
    rx1252_cur."!cursor_debug"("PASS", "statement_mod_cond:sym<unless>", " at pos=", rx1252_pos)
  debug_535:
    .return (rx1252_cur)
  rx1252_restart:
.annotate 'line', 4
    if_null rx1252_debug, debug_536
    rx1252_cur."!cursor_debug"("NEXT", "statement_mod_cond:sym<unless>")
  debug_536:
  rx1252_fail:
    (rx1252_rep, rx1252_pos, $I10, $P10) = rx1252_cur."!mark_fail"(0)
    lt rx1252_pos, -1, rx1252_done
    eq rx1252_pos, -1, rx1252_fail
    jump $I10
  rx1252_done:
    rx1252_cur."!cursor_fail"()
    if_null rx1252_debug, debug_537
    rx1252_cur."!cursor_debug"("FAIL", "statement_mod_cond:sym<unless>")
  debug_537:
    .return (rx1252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("90_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "unless")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("91_1309998847.42912") :method
.annotate 'line', 217
    $P100 = self."!protoregex"("statement_mod_loop")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("92_1309998847.42912") :method
.annotate 'line', 217
    $P101 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("93_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1259_tgt
    .local int rx1259_pos
    .local int rx1259_off
    .local int rx1259_eos
    .local int rx1259_rep
    .local pmc rx1259_cur
    .local pmc rx1259_debug
    (rx1259_cur, rx1259_pos, rx1259_tgt, $I10) = self."!cursor_start"()
    getattribute rx1259_debug, rx1259_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1259_cur
    .local pmc match
    .lex "$/", match
    length rx1259_eos, rx1259_tgt
    gt rx1259_pos, rx1259_eos, rx1259_done
    set rx1259_off, 0
    lt rx1259_pos, 2, rx1259_start
    sub rx1259_off, rx1259_pos, 1
    substr rx1259_tgt, rx1259_tgt, rx1259_off
  rx1259_start:
    eq $I10, 1, rx1259_restart
    if_null rx1259_debug, debug_538
    rx1259_cur."!cursor_debug"("START", "statement_mod_loop:sym<while>")
  debug_538:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1261_done
    goto rxscan1261_scan
  rxscan1261_loop:
    ($P10) = rx1259_cur."from"()
    inc $P10
    set rx1259_pos, $P10
    ge rx1259_pos, rx1259_eos, rxscan1261_done
  rxscan1261_scan:
    set_addr $I10, rxscan1261_loop
    rx1259_cur."!mark_push"(0, rx1259_pos, $I10)
  rxscan1261_done:
.annotate 'line', 219
  # rx subcapture "sym"
    set_addr $I10, rxcap_1262_fail
    rx1259_cur."!mark_push"(0, rx1259_pos, $I10)
  # rx literal  "while"
    add $I11, rx1259_pos, 5
    gt $I11, rx1259_eos, rx1259_fail
    sub $I11, rx1259_pos, rx1259_off
    substr $S10, rx1259_tgt, $I11, 5
    ne $S10, "while", rx1259_fail
    add rx1259_pos, 5
    set_addr $I10, rxcap_1262_fail
    ($I12, $I11) = rx1259_cur."!mark_peek"($I10)
    rx1259_cur."!cursor_pos"($I11)
    ($P10) = rx1259_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1259_pos, "")
    rx1259_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1262_done
  rxcap_1262_fail:
    goto rx1259_fail
  rxcap_1262_done:
  # rx subrule "ws" subtype=method negate=
    rx1259_cur."!cursor_pos"(rx1259_pos)
    $P10 = rx1259_cur."ws"()
    unless $P10, rx1259_fail
    rx1259_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1259_cur."!cursor_pos"(rx1259_pos)
    $P10 = rx1259_cur."EXPR"()
    unless $P10, rx1259_fail
    rx1259_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx1259_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1259_cur."!cursor_pos"(rx1259_pos)
    $P10 = rx1259_cur."ws"()
    unless $P10, rx1259_fail
    rx1259_pos = $P10."pos"()
  # rx pass
    rx1259_cur."!cursor_pass"(rx1259_pos, "statement_mod_loop:sym<while>")
    if_null rx1259_debug, debug_539
    rx1259_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<while>", " at pos=", rx1259_pos)
  debug_539:
    .return (rx1259_cur)
  rx1259_restart:
.annotate 'line', 4
    if_null rx1259_debug, debug_540
    rx1259_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<while>")
  debug_540:
  rx1259_fail:
    (rx1259_rep, rx1259_pos, $I10, $P10) = rx1259_cur."!mark_fail"(0)
    lt rx1259_pos, -1, rx1259_done
    eq rx1259_pos, -1, rx1259_fail
    jump $I10
  rx1259_done:
    rx1259_cur."!cursor_fail"()
    if_null rx1259_debug, debug_541
    rx1259_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<while>")
  debug_541:
    .return (rx1259_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("94_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "while")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("95_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1264_debug, debug_542
    rx1264_cur."!cursor_debug"("START", "statement_mod_loop:sym<until>")
  debug_542:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1266_done
    goto rxscan1266_scan
  rxscan1266_loop:
    ($P10) = rx1264_cur."from"()
    inc $P10
    set rx1264_pos, $P10
    ge rx1264_pos, rx1264_eos, rxscan1266_done
  rxscan1266_scan:
    set_addr $I10, rxscan1266_loop
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  rxscan1266_done:
.annotate 'line', 220
  # rx subcapture "sym"
    set_addr $I10, rxcap_1267_fail
    rx1264_cur."!mark_push"(0, rx1264_pos, $I10)
  # rx literal  "until"
    add $I11, rx1264_pos, 5
    gt $I11, rx1264_eos, rx1264_fail
    sub $I11, rx1264_pos, rx1264_off
    substr $S10, rx1264_tgt, $I11, 5
    ne $S10, "until", rx1264_fail
    add rx1264_pos, 5
    set_addr $I10, rxcap_1267_fail
    ($I12, $I11) = rx1264_cur."!mark_peek"($I10)
    rx1264_cur."!cursor_pos"($I11)
    ($P10) = rx1264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1264_pos, "")
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1267_done
  rxcap_1267_fail:
    goto rx1264_fail
  rxcap_1267_done:
  # rx subrule "ws" subtype=method negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."ws"()
    unless $P10, rx1264_fail
    rx1264_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."EXPR"()
    unless $P10, rx1264_fail
    rx1264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx1264_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1264_cur."!cursor_pos"(rx1264_pos)
    $P10 = rx1264_cur."ws"()
    unless $P10, rx1264_fail
    rx1264_pos = $P10."pos"()
  # rx pass
    rx1264_cur."!cursor_pass"(rx1264_pos, "statement_mod_loop:sym<until>")
    if_null rx1264_debug, debug_543
    rx1264_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<until>", " at pos=", rx1264_pos)
  debug_543:
    .return (rx1264_cur)
  rx1264_restart:
.annotate 'line', 4
    if_null rx1264_debug, debug_544
    rx1264_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<until>")
  debug_544:
  rx1264_fail:
    (rx1264_rep, rx1264_pos, $I10, $P10) = rx1264_cur."!mark_fail"(0)
    lt rx1264_pos, -1, rx1264_done
    eq rx1264_pos, -1, rx1264_fail
    jump $I10
  rx1264_done:
    rx1264_cur."!cursor_fail"()
    if_null rx1264_debug, debug_545
    rx1264_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<until>")
  debug_545:
    .return (rx1264_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("96_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "until")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<for>"  :subid("97_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1269_debug, debug_546
    rx1269_cur."!cursor_debug"("START", "statement_mod_loop:sym<for>")
  debug_546:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1271_done
    goto rxscan1271_scan
  rxscan1271_loop:
    ($P10) = rx1269_cur."from"()
    inc $P10
    set rx1269_pos, $P10
    ge rx1269_pos, rx1269_eos, rxscan1271_done
  rxscan1271_scan:
    set_addr $I10, rxscan1271_loop
    rx1269_cur."!mark_push"(0, rx1269_pos, $I10)
  rxscan1271_done:
.annotate 'line', 221
  # rx subcapture "sym"
    set_addr $I10, rxcap_1272_fail
    rx1269_cur."!mark_push"(0, rx1269_pos, $I10)
  # rx literal  "for"
    add $I11, rx1269_pos, 3
    gt $I11, rx1269_eos, rx1269_fail
    sub $I11, rx1269_pos, rx1269_off
    substr $S10, rx1269_tgt, $I11, 3
    ne $S10, "for", rx1269_fail
    add rx1269_pos, 3
    set_addr $I10, rxcap_1272_fail
    ($I12, $I11) = rx1269_cur."!mark_peek"($I10)
    rx1269_cur."!cursor_pos"($I11)
    ($P10) = rx1269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1269_pos, "")
    rx1269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1272_done
  rxcap_1272_fail:
    goto rx1269_fail
  rxcap_1272_done:
  # rx subrule "ws" subtype=method negate=
    rx1269_cur."!cursor_pos"(rx1269_pos)
    $P10 = rx1269_cur."ws"()
    unless $P10, rx1269_fail
    rx1269_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1269_cur."!cursor_pos"(rx1269_pos)
    $P10 = rx1269_cur."EXPR"()
    unless $P10, rx1269_fail
    rx1269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx1269_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1269_cur."!cursor_pos"(rx1269_pos)
    $P10 = rx1269_cur."ws"()
    unless $P10, rx1269_fail
    rx1269_pos = $P10."pos"()
  # rx pass
    rx1269_cur."!cursor_pass"(rx1269_pos, "statement_mod_loop:sym<for>")
    if_null rx1269_debug, debug_547
    rx1269_cur."!cursor_debug"("PASS", "statement_mod_loop:sym<for>", " at pos=", rx1269_pos)
  debug_547:
    .return (rx1269_cur)
  rx1269_restart:
.annotate 'line', 4
    if_null rx1269_debug, debug_548
    rx1269_cur."!cursor_debug"("NEXT", "statement_mod_loop:sym<for>")
  debug_548:
  rx1269_fail:
    (rx1269_rep, rx1269_pos, $I10, $P10) = rx1269_cur."!mark_fail"(0)
    lt rx1269_pos, -1, rx1269_done
    eq rx1269_pos, -1, rx1269_fail
    jump $I10
  rx1269_done:
    rx1269_cur."!cursor_fail"()
    if_null rx1269_debug, debug_549
    rx1269_cur."!cursor_debug"("FAIL", "statement_mod_loop:sym<for>")
  debug_549:
    .return (rx1269_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<for>"  :subid("98_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "for")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("99_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1274_tgt
    .local int rx1274_pos
    .local int rx1274_off
    .local int rx1274_eos
    .local int rx1274_rep
    .local pmc rx1274_cur
    .local pmc rx1274_debug
    (rx1274_cur, rx1274_pos, rx1274_tgt, $I10) = self."!cursor_start"()
    getattribute rx1274_debug, rx1274_cur, "$!debug"
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
    eq $I10, 1, rx1274_restart
    if_null rx1274_debug, debug_550
    rx1274_cur."!cursor_debug"("START", "term:sym<fatarrow>")
  debug_550:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1276_done
    goto rxscan1276_scan
  rxscan1276_loop:
    ($P10) = rx1274_cur."from"()
    inc $P10
    set rx1274_pos, $P10
    ge rx1274_pos, rx1274_eos, rxscan1276_done
  rxscan1276_scan:
    set_addr $I10, rxscan1276_loop
    rx1274_cur."!mark_push"(0, rx1274_pos, $I10)
  rxscan1276_done:
.annotate 'line', 225
  # rx subrule "fatarrow" subtype=capture negate=
    rx1274_cur."!cursor_pos"(rx1274_pos)
    $P10 = rx1274_cur."fatarrow"()
    unless $P10, rx1274_fail
    rx1274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx1274_pos = $P10."pos"()
  # rx pass
    rx1274_cur."!cursor_pass"(rx1274_pos, "term:sym<fatarrow>")
    if_null rx1274_debug, debug_551
    rx1274_cur."!cursor_debug"("PASS", "term:sym<fatarrow>", " at pos=", rx1274_pos)
  debug_551:
    .return (rx1274_cur)
  rx1274_restart:
.annotate 'line', 4
    if_null rx1274_debug, debug_552
    rx1274_cur."!cursor_debug"("NEXT", "term:sym<fatarrow>")
  debug_552:
  rx1274_fail:
    (rx1274_rep, rx1274_pos, $I10, $P10) = rx1274_cur."!mark_fail"(0)
    lt rx1274_pos, -1, rx1274_done
    eq rx1274_pos, -1, rx1274_fail
    jump $I10
  rx1274_done:
    rx1274_cur."!cursor_fail"()
    if_null rx1274_debug, debug_553
    rx1274_cur."!cursor_debug"("FAIL", "term:sym<fatarrow>")
  debug_553:
    .return (rx1274_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("100_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("101_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1278_debug, debug_554
    rx1278_cur."!cursor_debug"("START", "term:sym<colonpair>")
  debug_554:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1280_done
    goto rxscan1280_scan
  rxscan1280_loop:
    ($P10) = rx1278_cur."from"()
    inc $P10
    set rx1278_pos, $P10
    ge rx1278_pos, rx1278_eos, rxscan1280_done
  rxscan1280_scan:
    set_addr $I10, rxscan1280_loop
    rx1278_cur."!mark_push"(0, rx1278_pos, $I10)
  rxscan1280_done:
.annotate 'line', 226
  # rx subrule "colonpair" subtype=capture negate=
    rx1278_cur."!cursor_pos"(rx1278_pos)
    $P10 = rx1278_cur."colonpair"()
    unless $P10, rx1278_fail
    rx1278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx1278_pos = $P10."pos"()
  # rx pass
    rx1278_cur."!cursor_pass"(rx1278_pos, "term:sym<colonpair>")
    if_null rx1278_debug, debug_555
    rx1278_cur."!cursor_debug"("PASS", "term:sym<colonpair>", " at pos=", rx1278_pos)
  debug_555:
    .return (rx1278_cur)
  rx1278_restart:
.annotate 'line', 4
    if_null rx1278_debug, debug_556
    rx1278_cur."!cursor_debug"("NEXT", "term:sym<colonpair>")
  debug_556:
  rx1278_fail:
    (rx1278_rep, rx1278_pos, $I10, $P10) = rx1278_cur."!mark_fail"(0)
    lt rx1278_pos, -1, rx1278_done
    eq rx1278_pos, -1, rx1278_fail
    jump $I10
  rx1278_done:
    rx1278_cur."!cursor_fail"()
    if_null rx1278_debug, debug_557
    rx1278_cur."!cursor_debug"("FAIL", "term:sym<colonpair>")
  debug_557:
    .return (rx1278_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("102_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("colonpair", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("103_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1282_debug, debug_558
    rx1282_cur."!cursor_debug"("START", "term:sym<variable>")
  debug_558:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1284_done
    goto rxscan1284_scan
  rxscan1284_loop:
    ($P10) = rx1282_cur."from"()
    inc $P10
    set rx1282_pos, $P10
    ge rx1282_pos, rx1282_eos, rxscan1284_done
  rxscan1284_scan:
    set_addr $I10, rxscan1284_loop
    rx1282_cur."!mark_push"(0, rx1282_pos, $I10)
  rxscan1284_done:
.annotate 'line', 227
  # rx subrule "variable" subtype=capture negate=
    rx1282_cur."!cursor_pos"(rx1282_pos)
    $P10 = rx1282_cur."variable"()
    unless $P10, rx1282_fail
    rx1282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx1282_pos = $P10."pos"()
  # rx pass
    rx1282_cur."!cursor_pass"(rx1282_pos, "term:sym<variable>")
    if_null rx1282_debug, debug_559
    rx1282_cur."!cursor_debug"("PASS", "term:sym<variable>", " at pos=", rx1282_pos)
  debug_559:
    .return (rx1282_cur)
  rx1282_restart:
.annotate 'line', 4
    if_null rx1282_debug, debug_560
    rx1282_cur."!cursor_debug"("NEXT", "term:sym<variable>")
  debug_560:
  rx1282_fail:
    (rx1282_rep, rx1282_pos, $I10, $P10) = rx1282_cur."!mark_fail"(0)
    lt rx1282_pos, -1, rx1282_done
    eq rx1282_pos, -1, rx1282_fail
    jump $I10
  rx1282_done:
    rx1282_cur."!cursor_fail"()
    if_null rx1282_debug, debug_561
    rx1282_cur."!cursor_debug"("FAIL", "term:sym<variable>")
  debug_561:
    .return (rx1282_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("104_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("variable", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("105_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1286_tgt
    .local int rx1286_pos
    .local int rx1286_off
    .local int rx1286_eos
    .local int rx1286_rep
    .local pmc rx1286_cur
    .local pmc rx1286_debug
    (rx1286_cur, rx1286_pos, rx1286_tgt, $I10) = self."!cursor_start"()
    getattribute rx1286_debug, rx1286_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1286_cur
    .local pmc match
    .lex "$/", match
    length rx1286_eos, rx1286_tgt
    gt rx1286_pos, rx1286_eos, rx1286_done
    set rx1286_off, 0
    lt rx1286_pos, 2, rx1286_start
    sub rx1286_off, rx1286_pos, 1
    substr rx1286_tgt, rx1286_tgt, rx1286_off
  rx1286_start:
    eq $I10, 1, rx1286_restart
    if_null rx1286_debug, debug_562
    rx1286_cur."!cursor_debug"("START", "term:sym<package_declarator>")
  debug_562:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1288_done
    goto rxscan1288_scan
  rxscan1288_loop:
    ($P10) = rx1286_cur."from"()
    inc $P10
    set rx1286_pos, $P10
    ge rx1286_pos, rx1286_eos, rxscan1288_done
  rxscan1288_scan:
    set_addr $I10, rxscan1288_loop
    rx1286_cur."!mark_push"(0, rx1286_pos, $I10)
  rxscan1288_done:
.annotate 'line', 228
  # rx subrule "package_declarator" subtype=capture negate=
    rx1286_cur."!cursor_pos"(rx1286_pos)
    $P10 = rx1286_cur."package_declarator"()
    unless $P10, rx1286_fail
    rx1286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx1286_pos = $P10."pos"()
  # rx pass
    rx1286_cur."!cursor_pass"(rx1286_pos, "term:sym<package_declarator>")
    if_null rx1286_debug, debug_563
    rx1286_cur."!cursor_debug"("PASS", "term:sym<package_declarator>", " at pos=", rx1286_pos)
  debug_563:
    .return (rx1286_cur)
  rx1286_restart:
.annotate 'line', 4
    if_null rx1286_debug, debug_564
    rx1286_cur."!cursor_debug"("NEXT", "term:sym<package_declarator>")
  debug_564:
  rx1286_fail:
    (rx1286_rep, rx1286_pos, $I10, $P10) = rx1286_cur."!mark_fail"(0)
    lt rx1286_pos, -1, rx1286_done
    eq rx1286_pos, -1, rx1286_fail
    jump $I10
  rx1286_done:
    rx1286_cur."!cursor_fail"()
    if_null rx1286_debug, debug_565
    rx1286_cur."!cursor_debug"("FAIL", "term:sym<package_declarator>")
  debug_565:
    .return (rx1286_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("106_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("107_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1290_debug, debug_566
    rx1290_cur."!cursor_debug"("START", "term:sym<scope_declarator>")
  debug_566:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1292_done
    goto rxscan1292_scan
  rxscan1292_loop:
    ($P10) = rx1290_cur."from"()
    inc $P10
    set rx1290_pos, $P10
    ge rx1290_pos, rx1290_eos, rxscan1292_done
  rxscan1292_scan:
    set_addr $I10, rxscan1292_loop
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  rxscan1292_done:
.annotate 'line', 229
  # rx subrule "scope_declarator" subtype=capture negate=
    rx1290_cur."!cursor_pos"(rx1290_pos)
    $P10 = rx1290_cur."scope_declarator"()
    unless $P10, rx1290_fail
    rx1290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx1290_pos = $P10."pos"()
  # rx pass
    rx1290_cur."!cursor_pass"(rx1290_pos, "term:sym<scope_declarator>")
    if_null rx1290_debug, debug_567
    rx1290_cur."!cursor_debug"("PASS", "term:sym<scope_declarator>", " at pos=", rx1290_pos)
  debug_567:
    .return (rx1290_cur)
  rx1290_restart:
.annotate 'line', 4
    if_null rx1290_debug, debug_568
    rx1290_cur."!cursor_debug"("NEXT", "term:sym<scope_declarator>")
  debug_568:
  rx1290_fail:
    (rx1290_rep, rx1290_pos, $I10, $P10) = rx1290_cur."!mark_fail"(0)
    lt rx1290_pos, -1, rx1290_done
    eq rx1290_pos, -1, rx1290_fail
    jump $I10
  rx1290_done:
    rx1290_cur."!cursor_fail"()
    if_null rx1290_debug, debug_569
    rx1290_cur."!cursor_debug"("FAIL", "term:sym<scope_declarator>")
  debug_569:
    .return (rx1290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("108_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("109_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1294_tgt
    .local int rx1294_pos
    .local int rx1294_off
    .local int rx1294_eos
    .local int rx1294_rep
    .local pmc rx1294_cur
    .local pmc rx1294_debug
    (rx1294_cur, rx1294_pos, rx1294_tgt, $I10) = self."!cursor_start"()
    getattribute rx1294_debug, rx1294_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1294_cur
    .local pmc match
    .lex "$/", match
    length rx1294_eos, rx1294_tgt
    gt rx1294_pos, rx1294_eos, rx1294_done
    set rx1294_off, 0
    lt rx1294_pos, 2, rx1294_start
    sub rx1294_off, rx1294_pos, 1
    substr rx1294_tgt, rx1294_tgt, rx1294_off
  rx1294_start:
    eq $I10, 1, rx1294_restart
    if_null rx1294_debug, debug_570
    rx1294_cur."!cursor_debug"("START", "term:sym<routine_declarator>")
  debug_570:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1296_done
    goto rxscan1296_scan
  rxscan1296_loop:
    ($P10) = rx1294_cur."from"()
    inc $P10
    set rx1294_pos, $P10
    ge rx1294_pos, rx1294_eos, rxscan1296_done
  rxscan1296_scan:
    set_addr $I10, rxscan1296_loop
    rx1294_cur."!mark_push"(0, rx1294_pos, $I10)
  rxscan1296_done:
.annotate 'line', 230
  # rx subrule "routine_declarator" subtype=capture negate=
    rx1294_cur."!cursor_pos"(rx1294_pos)
    $P10 = rx1294_cur."routine_declarator"()
    unless $P10, rx1294_fail
    rx1294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx1294_pos = $P10."pos"()
  # rx pass
    rx1294_cur."!cursor_pass"(rx1294_pos, "term:sym<routine_declarator>")
    if_null rx1294_debug, debug_571
    rx1294_cur."!cursor_debug"("PASS", "term:sym<routine_declarator>", " at pos=", rx1294_pos)
  debug_571:
    .return (rx1294_cur)
  rx1294_restart:
.annotate 'line', 4
    if_null rx1294_debug, debug_572
    rx1294_cur."!cursor_debug"("NEXT", "term:sym<routine_declarator>")
  debug_572:
  rx1294_fail:
    (rx1294_rep, rx1294_pos, $I10, $P10) = rx1294_cur."!mark_fail"(0)
    lt rx1294_pos, -1, rx1294_done
    eq rx1294_pos, -1, rx1294_fail
    jump $I10
  rx1294_done:
    rx1294_cur."!cursor_fail"()
    if_null rx1294_debug, debug_573
    rx1294_cur."!cursor_debug"("FAIL", "term:sym<routine_declarator>")
  debug_573:
    .return (rx1294_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("110_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<multi_declarator>"  :subid("111_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1302 = "113_1309998847.42912"
    capture_lex $P1302
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
    if_null rx1298_debug, debug_574
    rx1298_cur."!cursor_debug"("START", "term:sym<multi_declarator>")
  debug_574:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1300_done
    goto rxscan1300_scan
  rxscan1300_loop:
    ($P10) = rx1298_cur."from"()
    inc $P10
    set rx1298_pos, $P10
    ge rx1298_pos, rx1298_eos, rxscan1300_done
  rxscan1300_scan:
    set_addr $I10, rxscan1300_loop
    rx1298_cur."!mark_push"(0, rx1298_pos, $I10)
  rxscan1300_done:
.annotate 'line', 231
  # rx subrule "before" subtype=zerowidth negate=
    rx1298_cur."!cursor_pos"(rx1298_pos)
    .const 'Sub' $P1302 = "113_1309998847.42912"
    capture_lex $P1302
    $P10 = rx1298_cur."before"($P1302)
    unless $P10, rx1298_fail
  # rx subrule "multi_declarator" subtype=capture negate=
    rx1298_cur."!cursor_pos"(rx1298_pos)
    $P10 = rx1298_cur."multi_declarator"()
    unless $P10, rx1298_fail
    rx1298_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx1298_pos = $P10."pos"()
  # rx pass
    rx1298_cur."!cursor_pass"(rx1298_pos, "term:sym<multi_declarator>")
    if_null rx1298_debug, debug_579
    rx1298_cur."!cursor_debug"("PASS", "term:sym<multi_declarator>", " at pos=", rx1298_pos)
  debug_579:
    .return (rx1298_cur)
  rx1298_restart:
.annotate 'line', 4
    if_null rx1298_debug, debug_580
    rx1298_cur."!cursor_debug"("NEXT", "term:sym<multi_declarator>")
  debug_580:
  rx1298_fail:
    (rx1298_rep, rx1298_pos, $I10, $P10) = rx1298_cur."!mark_fail"(0)
    lt rx1298_pos, -1, rx1298_done
    eq rx1298_pos, -1, rx1298_fail
    jump $I10
  rx1298_done:
    rx1298_cur."!cursor_fail"()
    if_null rx1298_debug, debug_581
    rx1298_cur."!cursor_debug"("FAIL", "term:sym<multi_declarator>")
  debug_581:
    .return (rx1298_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<multi_declarator>"  :subid("112_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1301"  :anon :subid("113_1309998847.42912") :method :outer("111_1309998847.42912")
.annotate 'line', 231
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
    if_null rx1303_debug, debug_575
    rx1303_cur."!cursor_debug"("START", "")
  debug_575:
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
  alt1305_0:
    set_addr $I10, alt1305_1
    rx1303_cur."!mark_push"(0, rx1303_pos, $I10)
  # rx literal  "multi"
    add $I11, rx1303_pos, 5
    gt $I11, rx1303_eos, rx1303_fail
    sub $I11, rx1303_pos, rx1303_off
    substr $S10, rx1303_tgt, $I11, 5
    ne $S10, "multi", rx1303_fail
    add rx1303_pos, 5
    goto alt1305_end
  alt1305_1:
    set_addr $I10, alt1305_2
    rx1303_cur."!mark_push"(0, rx1303_pos, $I10)
  # rx literal  "proto"
    add $I11, rx1303_pos, 5
    gt $I11, rx1303_eos, rx1303_fail
    sub $I11, rx1303_pos, rx1303_off
    substr $S10, rx1303_tgt, $I11, 5
    ne $S10, "proto", rx1303_fail
    add rx1303_pos, 5
    goto alt1305_end
  alt1305_2:
  # rx literal  "only"
    add $I11, rx1303_pos, 4
    gt $I11, rx1303_eos, rx1303_fail
    sub $I11, rx1303_pos, rx1303_off
    substr $S10, rx1303_tgt, $I11, 4
    ne $S10, "only", rx1303_fail
    add rx1303_pos, 4
  alt1305_end:
  # rx pass
    rx1303_cur."!cursor_pass"(rx1303_pos, "")
    if_null rx1303_debug, debug_576
    rx1303_cur."!cursor_debug"("PASS", "", " at pos=", rx1303_pos)
  debug_576:
    .return (rx1303_cur)
  rx1303_restart:
    if_null rx1303_debug, debug_577
    rx1303_cur."!cursor_debug"("NEXT", "")
  debug_577:
  rx1303_fail:
    (rx1303_rep, rx1303_pos, $I10, $P10) = rx1303_cur."!mark_fail"(0)
    lt rx1303_pos, -1, rx1303_done
    eq rx1303_pos, -1, rx1303_fail
    jump $I10
  rx1303_done:
    rx1303_cur."!cursor_fail"()
    if_null rx1303_debug, debug_578
    rx1303_cur."!cursor_debug"("FAIL", "")
  debug_578:
    .return (rx1303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("114_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1307_tgt
    .local int rx1307_pos
    .local int rx1307_off
    .local int rx1307_eos
    .local int rx1307_rep
    .local pmc rx1307_cur
    .local pmc rx1307_debug
    (rx1307_cur, rx1307_pos, rx1307_tgt, $I10) = self."!cursor_start"()
    getattribute rx1307_debug, rx1307_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1307_cur
    .local pmc match
    .lex "$/", match
    length rx1307_eos, rx1307_tgt
    gt rx1307_pos, rx1307_eos, rx1307_done
    set rx1307_off, 0
    lt rx1307_pos, 2, rx1307_start
    sub rx1307_off, rx1307_pos, 1
    substr rx1307_tgt, rx1307_tgt, rx1307_off
  rx1307_start:
    eq $I10, 1, rx1307_restart
    if_null rx1307_debug, debug_582
    rx1307_cur."!cursor_debug"("START", "term:sym<regex_declarator>")
  debug_582:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1309_done
    goto rxscan1309_scan
  rxscan1309_loop:
    ($P10) = rx1307_cur."from"()
    inc $P10
    set rx1307_pos, $P10
    ge rx1307_pos, rx1307_eos, rxscan1309_done
  rxscan1309_scan:
    set_addr $I10, rxscan1309_loop
    rx1307_cur."!mark_push"(0, rx1307_pos, $I10)
  rxscan1309_done:
.annotate 'line', 232
  # rx subrule "regex_declarator" subtype=capture negate=
    rx1307_cur."!cursor_pos"(rx1307_pos)
    $P10 = rx1307_cur."regex_declarator"()
    unless $P10, rx1307_fail
    rx1307_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx1307_pos = $P10."pos"()
  # rx pass
    rx1307_cur."!cursor_pass"(rx1307_pos, "term:sym<regex_declarator>")
    if_null rx1307_debug, debug_583
    rx1307_cur."!cursor_debug"("PASS", "term:sym<regex_declarator>", " at pos=", rx1307_pos)
  debug_583:
    .return (rx1307_cur)
  rx1307_restart:
.annotate 'line', 4
    if_null rx1307_debug, debug_584
    rx1307_cur."!cursor_debug"("NEXT", "term:sym<regex_declarator>")
  debug_584:
  rx1307_fail:
    (rx1307_rep, rx1307_pos, $I10, $P10) = rx1307_cur."!mark_fail"(0)
    lt rx1307_pos, -1, rx1307_done
    eq rx1307_pos, -1, rx1307_fail
    jump $I10
  rx1307_done:
    rx1307_cur."!cursor_fail"()
    if_null rx1307_debug, debug_585
    rx1307_cur."!cursor_debug"("FAIL", "term:sym<regex_declarator>")
  debug_585:
    .return (rx1307_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("115_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("116_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1311_tgt
    .local int rx1311_pos
    .local int rx1311_off
    .local int rx1311_eos
    .local int rx1311_rep
    .local pmc rx1311_cur
    .local pmc rx1311_debug
    (rx1311_cur, rx1311_pos, rx1311_tgt, $I10) = self."!cursor_start"()
    getattribute rx1311_debug, rx1311_cur, "$!debug"
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
    eq $I10, 1, rx1311_restart
    if_null rx1311_debug, debug_586
    rx1311_cur."!cursor_debug"("START", "term:sym<statement_prefix>")
  debug_586:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1313_done
    goto rxscan1313_scan
  rxscan1313_loop:
    ($P10) = rx1311_cur."from"()
    inc $P10
    set rx1311_pos, $P10
    ge rx1311_pos, rx1311_eos, rxscan1313_done
  rxscan1313_scan:
    set_addr $I10, rxscan1313_loop
    rx1311_cur."!mark_push"(0, rx1311_pos, $I10)
  rxscan1313_done:
.annotate 'line', 233
  # rx subrule "statement_prefix" subtype=capture negate=
    rx1311_cur."!cursor_pos"(rx1311_pos)
    $P10 = rx1311_cur."statement_prefix"()
    unless $P10, rx1311_fail
    rx1311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx1311_pos = $P10."pos"()
  # rx pass
    rx1311_cur."!cursor_pass"(rx1311_pos, "term:sym<statement_prefix>")
    if_null rx1311_debug, debug_587
    rx1311_cur."!cursor_debug"("PASS", "term:sym<statement_prefix>", " at pos=", rx1311_pos)
  debug_587:
    .return (rx1311_cur)
  rx1311_restart:
.annotate 'line', 4
    if_null rx1311_debug, debug_588
    rx1311_cur."!cursor_debug"("NEXT", "term:sym<statement_prefix>")
  debug_588:
  rx1311_fail:
    (rx1311_rep, rx1311_pos, $I10, $P10) = rx1311_cur."!mark_fail"(0)
    lt rx1311_pos, -1, rx1311_done
    eq rx1311_pos, -1, rx1311_fail
    jump $I10
  rx1311_done:
    rx1311_cur."!cursor_fail"()
    if_null rx1311_debug, debug_589
    rx1311_cur."!cursor_debug"("FAIL", "term:sym<statement_prefix>")
  debug_589:
    .return (rx1311_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("117_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("118_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1315_debug, debug_590
    rx1315_cur."!cursor_debug"("START", "term:sym<lambda>")
  debug_590:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1317_done
    goto rxscan1317_scan
  rxscan1317_loop:
    ($P10) = rx1315_cur."from"()
    inc $P10
    set rx1315_pos, $P10
    ge rx1315_pos, rx1315_eos, rxscan1317_done
  rxscan1317_scan:
    set_addr $I10, rxscan1317_loop
    rx1315_cur."!mark_push"(0, rx1315_pos, $I10)
  rxscan1317_done:
.annotate 'line', 234
  # rx subrule "lambda" subtype=zerowidth negate=
    rx1315_cur."!cursor_pos"(rx1315_pos)
    $P10 = rx1315_cur."lambda"()
    unless $P10, rx1315_fail
  # rx subrule "pblock" subtype=capture negate=
    rx1315_cur."!cursor_pos"(rx1315_pos)
    $P10 = rx1315_cur."pblock"()
    unless $P10, rx1315_fail
    rx1315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx1315_pos = $P10."pos"()
  # rx pass
    rx1315_cur."!cursor_pass"(rx1315_pos, "term:sym<lambda>")
    if_null rx1315_debug, debug_591
    rx1315_cur."!cursor_debug"("PASS", "term:sym<lambda>", " at pos=", rx1315_pos)
  debug_591:
    .return (rx1315_cur)
  rx1315_restart:
.annotate 'line', 4
    if_null rx1315_debug, debug_592
    rx1315_cur."!cursor_debug"("NEXT", "term:sym<lambda>")
  debug_592:
  rx1315_fail:
    (rx1315_rep, rx1315_pos, $I10, $P10) = rx1315_cur."!mark_fail"(0)
    lt rx1315_pos, -1, rx1315_done
    eq rx1315_pos, -1, rx1315_fail
    jump $I10
  rx1315_done:
    rx1315_cur."!cursor_fail"()
    if_null rx1315_debug, debug_593
    rx1315_cur."!cursor_debug"("FAIL", "term:sym<lambda>")
  debug_593:
    .return (rx1315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("119_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("120_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1319_debug, debug_594
    rx1319_cur."!cursor_debug"("START", "fatarrow")
  debug_594:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1321_done
    goto rxscan1321_scan
  rxscan1321_loop:
    ($P10) = rx1319_cur."from"()
    inc $P10
    set rx1319_pos, $P10
    ge rx1319_pos, rx1319_eos, rxscan1321_done
  rxscan1321_scan:
    set_addr $I10, rxscan1321_loop
    rx1319_cur."!mark_push"(0, rx1319_pos, $I10)
  rxscan1321_done:
.annotate 'line', 237
  # rx subrule "identifier" subtype=capture negate=
    rx1319_cur."!cursor_pos"(rx1319_pos)
    $P10 = rx1319_cur."identifier"()
    unless $P10, rx1319_fail
    rx1319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx1319_pos = $P10."pos"()
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1319_pos, rx1319_off
    set rx1319_rep, 0
    sub $I12, rx1319_eos, rx1319_pos
  rxenumcharlistq1322_loop:
    le $I12, 0, rxenumcharlistq1322_done
    substr $S10, rx1319_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1322_done
    inc rx1319_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1322_loop
  rxenumcharlistq1322_done:
    add rx1319_pos, rx1319_pos, rx1319_rep
  # rx literal  "=>"
    add $I11, rx1319_pos, 2
    gt $I11, rx1319_eos, rx1319_fail
    sub $I11, rx1319_pos, rx1319_off
    substr $S10, rx1319_tgt, $I11, 2
    ne $S10, "=>", rx1319_fail
    add rx1319_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx1319_cur."!cursor_pos"(rx1319_pos)
    $P10 = rx1319_cur."ws"()
    unless $P10, rx1319_fail
    rx1319_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1319_cur."!cursor_pos"(rx1319_pos)
    $P10 = rx1319_cur."EXPR"("i=")
    unless $P10, rx1319_fail
    rx1319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx1319_pos = $P10."pos"()
.annotate 'line', 236
  # rx pass
    rx1319_cur."!cursor_pass"(rx1319_pos, "fatarrow")
    if_null rx1319_debug, debug_595
    rx1319_cur."!cursor_debug"("PASS", "fatarrow", " at pos=", rx1319_pos)
  debug_595:
    .return (rx1319_cur)
  rx1319_restart:
.annotate 'line', 4
    if_null rx1319_debug, debug_596
    rx1319_cur."!cursor_debug"("NEXT", "fatarrow")
  debug_596:
  rx1319_fail:
    (rx1319_rep, rx1319_pos, $I10, $P10) = rx1319_cur."!mark_fail"(0)
    lt rx1319_pos, -1, rx1319_done
    eq rx1319_pos, -1, rx1319_fail
    jump $I10
  rx1319_done:
    rx1319_cur."!cursor_fail"()
    if_null rx1319_debug, debug_597
    rx1319_cur."!cursor_debug"("FAIL", "fatarrow")
  debug_597:
    .return (rx1319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("121_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("identifier", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("122_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1324_tgt
    .local int rx1324_pos
    .local int rx1324_off
    .local int rx1324_eos
    .local int rx1324_rep
    .local pmc rx1324_cur
    .local pmc rx1324_debug
    (rx1324_cur, rx1324_pos, rx1324_tgt, $I10) = self."!cursor_start"()
    rx1324_cur."!cursor_caparray"("circumfix")
    getattribute rx1324_debug, rx1324_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1324_cur
    .local pmc match
    .lex "$/", match
    length rx1324_eos, rx1324_tgt
    gt rx1324_pos, rx1324_eos, rx1324_done
    set rx1324_off, 0
    lt rx1324_pos, 2, rx1324_start
    sub rx1324_off, rx1324_pos, 1
    substr rx1324_tgt, rx1324_tgt, rx1324_off
  rx1324_start:
    eq $I10, 1, rx1324_restart
    if_null rx1324_debug, debug_598
    rx1324_cur."!cursor_debug"("START", "colonpair")
  debug_598:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1326_done
    goto rxscan1326_scan
  rxscan1326_loop:
    ($P10) = rx1324_cur."from"()
    inc $P10
    set rx1324_pos, $P10
    ge rx1324_pos, rx1324_eos, rxscan1326_done
  rxscan1326_scan:
    set_addr $I10, rxscan1326_loop
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10)
  rxscan1326_done:
.annotate 'line', 241
  # rx literal  ":"
    add $I11, rx1324_pos, 1
    gt $I11, rx1324_eos, rx1324_fail
    sub $I11, rx1324_pos, rx1324_off
    ord $I11, rx1324_tgt, $I11
    ne $I11, 58, rx1324_fail
    add rx1324_pos, 1
  alt1327_0:
.annotate 'line', 242
    set_addr $I10, alt1327_1
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10)
.annotate 'line', 243
  # rx subcapture "not"
    set_addr $I10, rxcap_1328_fail
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10)
  # rx literal  "!"
    add $I11, rx1324_pos, 1
    gt $I11, rx1324_eos, rx1324_fail
    sub $I11, rx1324_pos, rx1324_off
    ord $I11, rx1324_tgt, $I11
    ne $I11, 33, rx1324_fail
    add rx1324_pos, 1
    set_addr $I10, rxcap_1328_fail
    ($I12, $I11) = rx1324_cur."!mark_peek"($I10)
    rx1324_cur."!cursor_pos"($I11)
    ($P10) = rx1324_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1324_pos, "")
    rx1324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_1328_done
  rxcap_1328_fail:
    goto rx1324_fail
  rxcap_1328_done:
  # rx subrule "identifier" subtype=capture negate=
    rx1324_cur."!cursor_pos"(rx1324_pos)
    $P10 = rx1324_cur."identifier"()
    unless $P10, rx1324_fail
    rx1324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx1324_pos = $P10."pos"()
    goto alt1327_end
  alt1327_1:
    set_addr $I10, alt1327_2
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10)
.annotate 'line', 244
  # rx subrule "identifier" subtype=capture negate=
    rx1324_cur."!cursor_pos"(rx1324_pos)
    $P10 = rx1324_cur."identifier"()
    unless $P10, rx1324_fail
    rx1324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx1324_pos = $P10."pos"()
  # rx rxquantr1329 ** 0..1
    set_addr $I10, rxquantr1329_done
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10)
  rxquantr1329_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx1324_cur."!cursor_pos"(rx1324_pos)
    $P10 = rx1324_cur."circumfix"()
    unless $P10, rx1324_fail
    goto rxsubrule1330_pass
  rxsubrule1330_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1324_fail
  rxsubrule1330_pass:
    set_addr $I10, rxsubrule1330_back
    rx1324_cur."!mark_push"(0, rx1324_pos, $I10, $P10)
    $P10."!cursor_names"("circumfix")
    rx1324_pos = $P10."pos"()
    set_addr $I10, rxquantr1329_done
    (rx1324_rep) = rx1324_cur."!mark_commit"($I10)
  rxquantr1329_done:
    goto alt1327_end
  alt1327_2:
.annotate 'line', 245
  # rx subrule "circumfix" subtype=capture negate=
    rx1324_cur."!cursor_pos"(rx1324_pos)
    $P10 = rx1324_cur."circumfix"()
    unless $P10, rx1324_fail
    rx1324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx1324_pos = $P10."pos"()
  alt1327_end:
.annotate 'line', 240
  # rx pass
    rx1324_cur."!cursor_pass"(rx1324_pos, "colonpair")
    if_null rx1324_debug, debug_599
    rx1324_cur."!cursor_debug"("PASS", "colonpair", " at pos=", rx1324_pos)
  debug_599:
    .return (rx1324_cur)
  rx1324_restart:
.annotate 'line', 4
    if_null rx1324_debug, debug_600
    rx1324_cur."!cursor_debug"("NEXT", "colonpair")
  debug_600:
  rx1324_fail:
    (rx1324_rep, rx1324_pos, $I10, $P10) = rx1324_cur."!mark_fail"(0)
    lt rx1324_pos, -1, rx1324_done
    eq rx1324_pos, -1, rx1324_fail
    jump $I10
  rx1324_done:
    rx1324_cur."!cursor_fail"()
    if_null rx1324_debug, debug_601
    rx1324_cur."!cursor_debug"("FAIL", "colonpair")
  debug_601:
    .return (rx1324_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("123_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("circumfix", ":")
    $P101 = self."!PREFIX__!subrule"("identifier", ":")
    $P102 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P103, "ResizablePMCArray"
    push $P103, $P100
    push $P103, $P101
    push $P103, $P102
    .return ($P103)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("124_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1332_tgt
    .local int rx1332_pos
    .local int rx1332_off
    .local int rx1332_eos
    .local int rx1332_rep
    .local pmc rx1332_cur
    .local pmc rx1332_debug
    (rx1332_cur, rx1332_pos, rx1332_tgt, $I10) = self."!cursor_start"()
    rx1332_cur."!cursor_caparray"("twigil")
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
    if_null rx1332_debug, debug_602
    rx1332_cur."!cursor_debug"("START", "variable")
  debug_602:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1334_done
    goto rxscan1334_scan
  rxscan1334_loop:
    ($P10) = rx1332_cur."from"()
    inc $P10
    set rx1332_pos, $P10
    ge rx1332_pos, rx1332_eos, rxscan1334_done
  rxscan1334_scan:
    set_addr $I10, rxscan1334_loop
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  rxscan1334_done:
  alt1335_0:
.annotate 'line', 249
    set_addr $I10, alt1335_1
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
.annotate 'line', 250
  # rx subrule "sigil" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."sigil"()
    unless $P10, rx1332_fail
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx1332_pos = $P10."pos"()
  # rx rxquantr1336 ** 0..1
    set_addr $I10, rxquantr1336_done
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  rxquantr1336_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."twigil"()
    unless $P10, rx1332_fail
    goto rxsubrule1337_pass
  rxsubrule1337_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1332_fail
  rxsubrule1337_pass:
    set_addr $I10, rxsubrule1337_back
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10, $P10)
    $P10."!cursor_names"("twigil")
    rx1332_pos = $P10."pos"()
    set_addr $I10, rxquantr1336_done
    (rx1332_rep) = rx1332_cur."!mark_commit"($I10)
  rxquantr1336_done:
  # rx subrule "name" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."name"()
    unless $P10, rx1332_fail
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx1332_pos = $P10."pos"()
    goto alt1335_end
  alt1335_1:
    set_addr $I10, alt1335_2
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
.annotate 'line', 251
  # rx subrule "sigil" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."sigil"()
    unless $P10, rx1332_fail
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx1332_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1332_pos, rx1332_off
    substr $S10, rx1332_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx1332_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx1332_cur."!cursor_pos"(rx1332_pos)
    $P10 = rx1332_cur."postcircumfix"()
    unless $P10, rx1332_fail
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx1332_pos = $P10."pos"()
    goto alt1335_end
  alt1335_2:
.annotate 'line', 252
  # rx subcapture "sigil"
    set_addr $I10, rxcap_1338_fail
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  # rx literal  "$"
    add $I11, rx1332_pos, 1
    gt $I11, rx1332_eos, rx1332_fail
    sub $I11, rx1332_pos, rx1332_off
    ord $I11, rx1332_tgt, $I11
    ne $I11, 36, rx1332_fail
    add rx1332_pos, 1
    set_addr $I10, rxcap_1338_fail
    ($I12, $I11) = rx1332_cur."!mark_peek"($I10)
    rx1332_cur."!cursor_pos"($I11)
    ($P10) = rx1332_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1332_pos, "")
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_1338_done
  rxcap_1338_fail:
    goto rx1332_fail
  rxcap_1338_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_1339_fail
    rx1332_cur."!mark_push"(0, rx1332_pos, $I10)
  # rx enumcharlist negate=0
    ge rx1332_pos, rx1332_eos, rx1332_fail
    sub $I10, rx1332_pos, rx1332_off
    substr $S10, rx1332_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx1332_fail
    inc rx1332_pos
    set_addr $I10, rxcap_1339_fail
    ($I12, $I11) = rx1332_cur."!mark_peek"($I10)
    rx1332_cur."!cursor_pos"($I11)
    ($P10) = rx1332_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1332_pos, "")
    rx1332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_1339_done
  rxcap_1339_fail:
    goto rx1332_fail
  rxcap_1339_done:
  alt1335_end:
.annotate 'line', 249
  # rx pass
    rx1332_cur."!cursor_pass"(rx1332_pos, "variable")
    if_null rx1332_debug, debug_603
    rx1332_cur."!cursor_debug"("PASS", "variable", " at pos=", rx1332_pos)
  debug_603:
    .return (rx1332_cur)
  rx1332_restart:
.annotate 'line', 4
    if_null rx1332_debug, debug_604
    rx1332_cur."!cursor_debug"("NEXT", "variable")
  debug_604:
  rx1332_fail:
    (rx1332_rep, rx1332_pos, $I10, $P10) = rx1332_cur."!mark_fail"(0)
    lt rx1332_pos, -1, rx1332_done
    eq rx1332_pos, -1, rx1332_fail
    jump $I10
  rx1332_done:
    rx1332_cur."!cursor_fail"()
    if_null rx1332_debug, debug_605
    rx1332_cur."!cursor_debug"("FAIL", "variable")
  debug_605:
    .return (rx1332_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("125_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("sigil", "")
    $P101 = self."!PREFIX__!subrule"("sigil", "")
    new $P102, "ResizablePMCArray"
    push $P102, "$!"
    push $P102, "$_"
    push $P102, "$/"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("126_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1341_tgt
    .local int rx1341_pos
    .local int rx1341_off
    .local int rx1341_eos
    .local int rx1341_rep
    .local pmc rx1341_cur
    .local pmc rx1341_debug
    (rx1341_cur, rx1341_pos, rx1341_tgt, $I10) = self."!cursor_start"()
    getattribute rx1341_debug, rx1341_cur, "$!debug"
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
    eq $I10, 1, rx1341_restart
    if_null rx1341_debug, debug_606
    rx1341_cur."!cursor_debug"("START", "sigil")
  debug_606:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1343_done
    goto rxscan1343_scan
  rxscan1343_loop:
    ($P10) = rx1341_cur."from"()
    inc $P10
    set rx1341_pos, $P10
    ge rx1341_pos, rx1341_eos, rxscan1343_done
  rxscan1343_scan:
    set_addr $I10, rxscan1343_loop
    rx1341_cur."!mark_push"(0, rx1341_pos, $I10)
  rxscan1343_done:
.annotate 'line', 255
  # rx enumcharlist negate=0
    ge rx1341_pos, rx1341_eos, rx1341_fail
    sub $I10, rx1341_pos, rx1341_off
    substr $S10, rx1341_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx1341_fail
    inc rx1341_pos
  # rx pass
    rx1341_cur."!cursor_pass"(rx1341_pos, "sigil")
    if_null rx1341_debug, debug_607
    rx1341_cur."!cursor_debug"("PASS", "sigil", " at pos=", rx1341_pos)
  debug_607:
    .return (rx1341_cur)
  rx1341_restart:
.annotate 'line', 4
    if_null rx1341_debug, debug_608
    rx1341_cur."!cursor_debug"("NEXT", "sigil")
  debug_608:
  rx1341_fail:
    (rx1341_rep, rx1341_pos, $I10, $P10) = rx1341_cur."!mark_fail"(0)
    lt rx1341_pos, -1, rx1341_done
    eq rx1341_pos, -1, rx1341_fail
    jump $I10
  rx1341_done:
    rx1341_cur."!cursor_fail"()
    if_null rx1341_debug, debug_609
    rx1341_cur."!cursor_debug"("FAIL", "sigil")
  debug_609:
    .return (rx1341_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("127_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "&"
    push $P100, "%"
    push $P100, "@"
    push $P100, "$"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("128_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1345_tgt
    .local int rx1345_pos
    .local int rx1345_off
    .local int rx1345_eos
    .local int rx1345_rep
    .local pmc rx1345_cur
    .local pmc rx1345_debug
    (rx1345_cur, rx1345_pos, rx1345_tgt, $I10) = self."!cursor_start"()
    getattribute rx1345_debug, rx1345_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1345_cur
    .local pmc match
    .lex "$/", match
    length rx1345_eos, rx1345_tgt
    gt rx1345_pos, rx1345_eos, rx1345_done
    set rx1345_off, 0
    lt rx1345_pos, 2, rx1345_start
    sub rx1345_off, rx1345_pos, 1
    substr rx1345_tgt, rx1345_tgt, rx1345_off
  rx1345_start:
    eq $I10, 1, rx1345_restart
    if_null rx1345_debug, debug_610
    rx1345_cur."!cursor_debug"("START", "twigil")
  debug_610:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1347_done
    goto rxscan1347_scan
  rxscan1347_loop:
    ($P10) = rx1345_cur."from"()
    inc $P10
    set rx1345_pos, $P10
    ge rx1345_pos, rx1345_eos, rxscan1347_done
  rxscan1347_scan:
    set_addr $I10, rxscan1347_loop
    rx1345_cur."!mark_push"(0, rx1345_pos, $I10)
  rxscan1347_done:
.annotate 'line', 257
  # rx enumcharlist negate=0
    ge rx1345_pos, rx1345_eos, rx1345_fail
    sub $I10, rx1345_pos, rx1345_off
    substr $S10, rx1345_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx1345_fail
    inc rx1345_pos
  # rx pass
    rx1345_cur."!cursor_pass"(rx1345_pos, "twigil")
    if_null rx1345_debug, debug_611
    rx1345_cur."!cursor_debug"("PASS", "twigil", " at pos=", rx1345_pos)
  debug_611:
    .return (rx1345_cur)
  rx1345_restart:
.annotate 'line', 4
    if_null rx1345_debug, debug_612
    rx1345_cur."!cursor_debug"("NEXT", "twigil")
  debug_612:
  rx1345_fail:
    (rx1345_rep, rx1345_pos, $I10, $P10) = rx1345_cur."!mark_fail"(0)
    lt rx1345_pos, -1, rx1345_done
    eq rx1345_pos, -1, rx1345_fail
    jump $I10
  rx1345_done:
    rx1345_cur."!cursor_fail"()
    if_null rx1345_debug, debug_613
    rx1345_cur."!cursor_debug"("FAIL", "twigil")
  debug_613:
    .return (rx1345_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("129_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "?"
    push $P100, "!"
    push $P100, "*"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("130_1309998847.42912") :method
.annotate 'line', 259
    $P100 = self."!protoregex"("package_declarator")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("131_1309998847.42912") :method
.annotate 'line', 259
    $P101 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("132_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1351_debug, debug_614
    rx1351_cur."!cursor_debug"("START", "package_declarator:sym<module>")
  debug_614:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1353_done
    goto rxscan1353_scan
  rxscan1353_loop:
    ($P10) = rx1351_cur."from"()
    inc $P10
    set rx1351_pos, $P10
    ge rx1351_pos, rx1351_eos, rxscan1353_done
  rxscan1353_scan:
    set_addr $I10, rxscan1353_loop
    rx1351_cur."!mark_push"(0, rx1351_pos, $I10)
  rxscan1353_done:
.annotate 'line', 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_1354_fail
    rx1351_cur."!mark_push"(0, rx1351_pos, $I10)
  # rx literal  "module"
    add $I11, rx1351_pos, 6
    gt $I11, rx1351_eos, rx1351_fail
    sub $I11, rx1351_pos, rx1351_off
    substr $S10, rx1351_tgt, $I11, 6
    ne $S10, "module", rx1351_fail
    add rx1351_pos, 6
    set_addr $I10, rxcap_1354_fail
    ($I12, $I11) = rx1351_cur."!mark_peek"($I10)
    rx1351_cur."!cursor_pos"($I11)
    ($P10) = rx1351_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1351_pos, "")
    rx1351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1354_done
  rxcap_1354_fail:
    goto rx1351_fail
  rxcap_1354_done:
  # rx subrule "package_def" subtype=capture negate=
    rx1351_cur."!cursor_pos"(rx1351_pos)
    $P10 = rx1351_cur."package_def"()
    unless $P10, rx1351_fail
    rx1351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx1351_pos = $P10."pos"()
  # rx pass
    rx1351_cur."!cursor_pass"(rx1351_pos, "package_declarator:sym<module>")
    if_null rx1351_debug, debug_615
    rx1351_cur."!cursor_debug"("PASS", "package_declarator:sym<module>", " at pos=", rx1351_pos)
  debug_615:
    .return (rx1351_cur)
  rx1351_restart:
.annotate 'line', 4
    if_null rx1351_debug, debug_616
    rx1351_cur."!cursor_debug"("NEXT", "package_declarator:sym<module>")
  debug_616:
  rx1351_fail:
    (rx1351_rep, rx1351_pos, $I10, $P10) = rx1351_cur."!mark_fail"(0)
    lt rx1351_pos, -1, rx1351_done
    eq rx1351_pos, -1, rx1351_fail
    jump $I10
  rx1351_done:
    rx1351_cur."!cursor_fail"()
    if_null rx1351_debug, debug_617
    rx1351_cur."!cursor_debug"("FAIL", "package_declarator:sym<module>")
  debug_617:
    .return (rx1351_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("133_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("package_def", "module")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("134_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1356_debug, debug_618
    rx1356_cur."!cursor_debug"("START", "package_declarator:sym<class>")
  debug_618:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1358_done
    goto rxscan1358_scan
  rxscan1358_loop:
    ($P10) = rx1356_cur."from"()
    inc $P10
    set rx1356_pos, $P10
    ge rx1356_pos, rx1356_eos, rxscan1358_done
  rxscan1358_scan:
    set_addr $I10, rxscan1358_loop
    rx1356_cur."!mark_push"(0, rx1356_pos, $I10)
  rxscan1358_done:
.annotate 'line', 261
  # rx subcapture "sym"
    set_addr $I10, rxcap_1360_fail
    rx1356_cur."!mark_push"(0, rx1356_pos, $I10)
  alt1359_0:
    set_addr $I10, alt1359_1
    rx1356_cur."!mark_push"(0, rx1356_pos, $I10)
  # rx literal  "class"
    add $I11, rx1356_pos, 5
    gt $I11, rx1356_eos, rx1356_fail
    sub $I11, rx1356_pos, rx1356_off
    substr $S10, rx1356_tgt, $I11, 5
    ne $S10, "class", rx1356_fail
    add rx1356_pos, 5
    goto alt1359_end
  alt1359_1:
  # rx literal  "grammar"
    add $I11, rx1356_pos, 7
    gt $I11, rx1356_eos, rx1356_fail
    sub $I11, rx1356_pos, rx1356_off
    substr $S10, rx1356_tgt, $I11, 7
    ne $S10, "grammar", rx1356_fail
    add rx1356_pos, 7
  alt1359_end:
    set_addr $I10, rxcap_1360_fail
    ($I12, $I11) = rx1356_cur."!mark_peek"($I10)
    rx1356_cur."!cursor_pos"($I11)
    ($P10) = rx1356_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1356_pos, "")
    rx1356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1360_done
  rxcap_1360_fail:
    goto rx1356_fail
  rxcap_1360_done:
  # rx subrule "package_def" subtype=capture negate=
    rx1356_cur."!cursor_pos"(rx1356_pos)
    $P10 = rx1356_cur."package_def"()
    unless $P10, rx1356_fail
    rx1356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx1356_pos = $P10."pos"()
  # rx pass
    rx1356_cur."!cursor_pass"(rx1356_pos, "package_declarator:sym<class>")
    if_null rx1356_debug, debug_619
    rx1356_cur."!cursor_debug"("PASS", "package_declarator:sym<class>", " at pos=", rx1356_pos)
  debug_619:
    .return (rx1356_cur)
  rx1356_restart:
.annotate 'line', 4
    if_null rx1356_debug, debug_620
    rx1356_cur."!cursor_debug"("NEXT", "package_declarator:sym<class>")
  debug_620:
  rx1356_fail:
    (rx1356_rep, rx1356_pos, $I10, $P10) = rx1356_cur."!mark_fail"(0)
    lt rx1356_pos, -1, rx1356_done
    eq rx1356_pos, -1, rx1356_fail
    jump $I10
  rx1356_done:
    rx1356_cur."!cursor_fail"()
    if_null rx1356_debug, debug_621
    rx1356_cur."!cursor_debug"("FAIL", "package_declarator:sym<class>")
  debug_621:
    .return (rx1356_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("135_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P101 = self."!PREFIX__!subrule"("package_def", "class")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("136_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1362_tgt
    .local int rx1362_pos
    .local int rx1362_off
    .local int rx1362_eos
    .local int rx1362_rep
    .local pmc rx1362_cur
    .local pmc rx1362_debug
    (rx1362_cur, rx1362_pos, rx1362_tgt, $I10) = self."!cursor_start"()
    rx1362_cur."!cursor_caparray"("parent")
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
    if_null rx1362_debug, debug_622
    rx1362_cur."!cursor_debug"("START", "package_def")
  debug_622:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1364_done
    goto rxscan1364_scan
  rxscan1364_loop:
    ($P10) = rx1362_cur."from"()
    inc $P10
    set rx1362_pos, $P10
    ge rx1362_pos, rx1362_eos, rxscan1364_done
  rxscan1364_scan:
    set_addr $I10, rxscan1364_loop
    rx1362_cur."!mark_push"(0, rx1362_pos, $I10)
  rxscan1364_done:
.annotate 'line', 263
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
.annotate 'line', 264
  # rx subrule "name" subtype=capture negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."name"()
    unless $P10, rx1362_fail
    rx1362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx1362_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
.annotate 'line', 265
  # rx rxquantr1365 ** 0..1
    set_addr $I10, rxquantr1365_done
    rx1362_cur."!mark_push"(0, rx1362_pos, $I10)
  rxquantr1365_loop:
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx1362_pos, 2
    gt $I11, rx1362_eos, rx1362_fail
    sub $I11, rx1362_pos, rx1362_off
    substr $S10, rx1362_tgt, $I11, 2
    ne $S10, "is", rx1362_fail
    add rx1362_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."name"()
    unless $P10, rx1362_fail
    rx1362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx1362_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
    set_addr $I10, rxquantr1365_done
    (rx1362_rep) = rx1362_cur."!mark_commit"($I10)
  rxquantr1365_done:
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  alt1366_0:
.annotate 'line', 266
    set_addr $I10, alt1366_1
    rx1362_cur."!mark_push"(0, rx1362_pos, $I10)
.annotate 'line', 267
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1362_pos, 1
    gt $I11, rx1362_eos, rx1362_fail
    sub $I11, rx1362_pos, rx1362_off
    ord $I11, rx1362_tgt, $I11
    ne $I11, 59, rx1362_fail
    add rx1362_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."comp_unit"()
    unless $P10, rx1362_fail
    rx1362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx1362_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
    goto alt1366_end
  alt1366_1:
    set_addr $I10, alt1366_2
    rx1362_cur."!mark_push"(0, rx1362_pos, $I10)
.annotate 'line', 268
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1362_pos, rx1362_off
    substr $S10, rx1362_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1362_fail
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."block"()
    unless $P10, rx1362_fail
    rx1362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1362_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
    goto alt1366_end
  alt1366_2:
.annotate 'line', 269
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."panic"("Malformed package declaration")
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
  alt1366_end:
.annotate 'line', 270
  # rx subrule "ws" subtype=method negate=
    rx1362_cur."!cursor_pos"(rx1362_pos)
    $P10 = rx1362_cur."ws"()
    unless $P10, rx1362_fail
    rx1362_pos = $P10."pos"()
.annotate 'line', 263
  # rx pass
    rx1362_cur."!cursor_pass"(rx1362_pos, "package_def")
    if_null rx1362_debug, debug_623
    rx1362_cur."!cursor_debug"("PASS", "package_def", " at pos=", rx1362_pos)
  debug_623:
    .return (rx1362_cur)
  rx1362_restart:
.annotate 'line', 4
    if_null rx1362_debug, debug_624
    rx1362_cur."!cursor_debug"("NEXT", "package_def")
  debug_624:
  rx1362_fail:
    (rx1362_rep, rx1362_pos, $I10, $P10) = rx1362_cur."!mark_fail"(0)
    lt rx1362_pos, -1, rx1362_done
    eq rx1362_pos, -1, rx1362_fail
    jump $I10
  rx1362_done:
    rx1362_cur."!cursor_fail"()
    if_null rx1362_debug, debug_625
    rx1362_cur."!cursor_debug"("FAIL", "package_def")
  debug_625:
    .return (rx1362_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("137_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("138_1309998847.42912") :method
.annotate 'line', 273
    $P100 = self."!protoregex"("scope_declarator")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("139_1309998847.42912") :method
.annotate 'line', 273
    $P101 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("140_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1370_debug, debug_626
    rx1370_cur."!cursor_debug"("START", "scope_declarator:sym<my>")
  debug_626:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1372_done
    goto rxscan1372_scan
  rxscan1372_loop:
    ($P10) = rx1370_cur."from"()
    inc $P10
    set rx1370_pos, $P10
    ge rx1370_pos, rx1370_eos, rxscan1372_done
  rxscan1372_scan:
    set_addr $I10, rxscan1372_loop
    rx1370_cur."!mark_push"(0, rx1370_pos, $I10)
  rxscan1372_done:
.annotate 'line', 274
  # rx subcapture "sym"
    set_addr $I10, rxcap_1373_fail
    rx1370_cur."!mark_push"(0, rx1370_pos, $I10)
  # rx literal  "my"
    add $I11, rx1370_pos, 2
    gt $I11, rx1370_eos, rx1370_fail
    sub $I11, rx1370_pos, rx1370_off
    substr $S10, rx1370_tgt, $I11, 2
    ne $S10, "my", rx1370_fail
    add rx1370_pos, 2
    set_addr $I10, rxcap_1373_fail
    ($I12, $I11) = rx1370_cur."!mark_peek"($I10)
    rx1370_cur."!cursor_pos"($I11)
    ($P10) = rx1370_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1370_pos, "")
    rx1370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1373_done
  rxcap_1373_fail:
    goto rx1370_fail
  rxcap_1373_done:
  # rx subrule "scoped" subtype=capture negate=
    rx1370_cur."!cursor_pos"(rx1370_pos)
    $P10 = rx1370_cur."scoped"("my")
    unless $P10, rx1370_fail
    rx1370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx1370_pos = $P10."pos"()
  # rx pass
    rx1370_cur."!cursor_pass"(rx1370_pos, "scope_declarator:sym<my>")
    if_null rx1370_debug, debug_627
    rx1370_cur."!cursor_debug"("PASS", "scope_declarator:sym<my>", " at pos=", rx1370_pos)
  debug_627:
    .return (rx1370_cur)
  rx1370_restart:
.annotate 'line', 4
    if_null rx1370_debug, debug_628
    rx1370_cur."!cursor_debug"("NEXT", "scope_declarator:sym<my>")
  debug_628:
  rx1370_fail:
    (rx1370_rep, rx1370_pos, $I10, $P10) = rx1370_cur."!mark_fail"(0)
    lt rx1370_pos, -1, rx1370_done
    eq rx1370_pos, -1, rx1370_fail
    jump $I10
  rx1370_done:
    rx1370_cur."!cursor_fail"()
    if_null rx1370_debug, debug_629
    rx1370_cur."!cursor_debug"("FAIL", "scope_declarator:sym<my>")
  debug_629:
    .return (rx1370_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("141_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("scoped", "my")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("142_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1375_debug, debug_630
    rx1375_cur."!cursor_debug"("START", "scope_declarator:sym<our>")
  debug_630:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1377_done
    goto rxscan1377_scan
  rxscan1377_loop:
    ($P10) = rx1375_cur."from"()
    inc $P10
    set rx1375_pos, $P10
    ge rx1375_pos, rx1375_eos, rxscan1377_done
  rxscan1377_scan:
    set_addr $I10, rxscan1377_loop
    rx1375_cur."!mark_push"(0, rx1375_pos, $I10)
  rxscan1377_done:
.annotate 'line', 275
  # rx subcapture "sym"
    set_addr $I10, rxcap_1378_fail
    rx1375_cur."!mark_push"(0, rx1375_pos, $I10)
  # rx literal  "our"
    add $I11, rx1375_pos, 3
    gt $I11, rx1375_eos, rx1375_fail
    sub $I11, rx1375_pos, rx1375_off
    substr $S10, rx1375_tgt, $I11, 3
    ne $S10, "our", rx1375_fail
    add rx1375_pos, 3
    set_addr $I10, rxcap_1378_fail
    ($I12, $I11) = rx1375_cur."!mark_peek"($I10)
    rx1375_cur."!cursor_pos"($I11)
    ($P10) = rx1375_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1375_pos, "")
    rx1375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1378_done
  rxcap_1378_fail:
    goto rx1375_fail
  rxcap_1378_done:
  # rx subrule "scoped" subtype=capture negate=
    rx1375_cur."!cursor_pos"(rx1375_pos)
    $P10 = rx1375_cur."scoped"("our")
    unless $P10, rx1375_fail
    rx1375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx1375_pos = $P10."pos"()
  # rx pass
    rx1375_cur."!cursor_pass"(rx1375_pos, "scope_declarator:sym<our>")
    if_null rx1375_debug, debug_631
    rx1375_cur."!cursor_debug"("PASS", "scope_declarator:sym<our>", " at pos=", rx1375_pos)
  debug_631:
    .return (rx1375_cur)
  rx1375_restart:
.annotate 'line', 4
    if_null rx1375_debug, debug_632
    rx1375_cur."!cursor_debug"("NEXT", "scope_declarator:sym<our>")
  debug_632:
  rx1375_fail:
    (rx1375_rep, rx1375_pos, $I10, $P10) = rx1375_cur."!mark_fail"(0)
    lt rx1375_pos, -1, rx1375_done
    eq rx1375_pos, -1, rx1375_fail
    jump $I10
  rx1375_done:
    rx1375_cur."!cursor_fail"()
    if_null rx1375_debug, debug_633
    rx1375_cur."!cursor_debug"("FAIL", "scope_declarator:sym<our>")
  debug_633:
    .return (rx1375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("143_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("scoped", "our")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("144_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1380_debug, debug_634
    rx1380_cur."!cursor_debug"("START", "scope_declarator:sym<has>")
  debug_634:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1382_done
    goto rxscan1382_scan
  rxscan1382_loop:
    ($P10) = rx1380_cur."from"()
    inc $P10
    set rx1380_pos, $P10
    ge rx1380_pos, rx1380_eos, rxscan1382_done
  rxscan1382_scan:
    set_addr $I10, rxscan1382_loop
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  rxscan1382_done:
.annotate 'line', 276
  # rx subcapture "sym"
    set_addr $I10, rxcap_1383_fail
    rx1380_cur."!mark_push"(0, rx1380_pos, $I10)
  # rx literal  "has"
    add $I11, rx1380_pos, 3
    gt $I11, rx1380_eos, rx1380_fail
    sub $I11, rx1380_pos, rx1380_off
    substr $S10, rx1380_tgt, $I11, 3
    ne $S10, "has", rx1380_fail
    add rx1380_pos, 3
    set_addr $I10, rxcap_1383_fail
    ($I12, $I11) = rx1380_cur."!mark_peek"($I10)
    rx1380_cur."!cursor_pos"($I11)
    ($P10) = rx1380_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1380_pos, "")
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1383_done
  rxcap_1383_fail:
    goto rx1380_fail
  rxcap_1383_done:
  # rx subrule "scoped" subtype=capture negate=
    rx1380_cur."!cursor_pos"(rx1380_pos)
    $P10 = rx1380_cur."scoped"("has")
    unless $P10, rx1380_fail
    rx1380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx1380_pos = $P10."pos"()
  # rx pass
    rx1380_cur."!cursor_pass"(rx1380_pos, "scope_declarator:sym<has>")
    if_null rx1380_debug, debug_635
    rx1380_cur."!cursor_debug"("PASS", "scope_declarator:sym<has>", " at pos=", rx1380_pos)
  debug_635:
    .return (rx1380_cur)
  rx1380_restart:
.annotate 'line', 4
    if_null rx1380_debug, debug_636
    rx1380_cur."!cursor_debug"("NEXT", "scope_declarator:sym<has>")
  debug_636:
  rx1380_fail:
    (rx1380_rep, rx1380_pos, $I10, $P10) = rx1380_cur."!mark_fail"(0)
    lt rx1380_pos, -1, rx1380_done
    eq rx1380_pos, -1, rx1380_fail
    jump $I10
  rx1380_done:
    rx1380_cur."!cursor_fail"()
    if_null rx1380_debug, debug_637
    rx1380_cur."!cursor_debug"("FAIL", "scope_declarator:sym<has>")
  debug_637:
    .return (rx1380_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("145_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("scoped", "has")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("146_1309998847.42912") :method :outer("11_1309998847.42912")
    .param pmc param_1385
.annotate 'line', 278
    .lex "$*SCOPE", param_1385
.annotate 'line', 4
    .local string rx1386_tgt
    .local int rx1386_pos
    .local int rx1386_off
    .local int rx1386_eos
    .local int rx1386_rep
    .local pmc rx1386_cur
    .local pmc rx1386_debug
    (rx1386_cur, rx1386_pos, rx1386_tgt, $I10) = self."!cursor_start"()
    getattribute rx1386_debug, rx1386_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1386_cur
    .local pmc match
    .lex "$/", match
    length rx1386_eos, rx1386_tgt
    gt rx1386_pos, rx1386_eos, rx1386_done
    set rx1386_off, 0
    lt rx1386_pos, 2, rx1386_start
    sub rx1386_off, rx1386_pos, 1
    substr rx1386_tgt, rx1386_tgt, rx1386_off
  rx1386_start:
    eq $I10, 1, rx1386_restart
    if_null rx1386_debug, debug_638
    rx1386_cur."!cursor_debug"("START", "scoped")
  debug_638:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1388_done
    goto rxscan1388_scan
  rxscan1388_loop:
    ($P10) = rx1386_cur."from"()
    inc $P10
    set rx1386_pos, $P10
    ge rx1386_pos, rx1386_eos, rxscan1388_done
  rxscan1388_scan:
    set_addr $I10, rxscan1388_loop
    rx1386_cur."!mark_push"(0, rx1386_pos, $I10)
  rxscan1388_done:
  alt1389_0:
.annotate 'line', 278
    set_addr $I10, alt1389_1
    rx1386_cur."!mark_push"(0, rx1386_pos, $I10)
.annotate 'line', 279
  # rx subrule "ws" subtype=method negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."ws"()
    unless $P10, rx1386_fail
    rx1386_pos = $P10."pos"()
  # rx subrule "declarator" subtype=capture negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."declarator"()
    unless $P10, rx1386_fail
    rx1386_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx1386_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."ws"()
    unless $P10, rx1386_fail
    rx1386_pos = $P10."pos"()
    goto alt1389_end
  alt1389_1:
.annotate 'line', 280
  # rx subrule "ws" subtype=method negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."ws"()
    unless $P10, rx1386_fail
    rx1386_pos = $P10."pos"()
  # rx subrule "multi_declarator" subtype=capture negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."multi_declarator"()
    unless $P10, rx1386_fail
    rx1386_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("multi_declarator")
    rx1386_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1386_cur."!cursor_pos"(rx1386_pos)
    $P10 = rx1386_cur."ws"()
    unless $P10, rx1386_fail
    rx1386_pos = $P10."pos"()
  alt1389_end:
.annotate 'line', 278
  # rx pass
    rx1386_cur."!cursor_pass"(rx1386_pos, "scoped")
    if_null rx1386_debug, debug_639
    rx1386_cur."!cursor_debug"("PASS", "scoped", " at pos=", rx1386_pos)
  debug_639:
    .return (rx1386_cur)
  rx1386_restart:
.annotate 'line', 4
    if_null rx1386_debug, debug_640
    rx1386_cur."!cursor_debug"("NEXT", "scoped")
  debug_640:
  rx1386_fail:
    (rx1386_rep, rx1386_pos, $I10, $P10) = rx1386_cur."!mark_fail"(0)
    lt rx1386_pos, -1, rx1386_done
    eq rx1386_pos, -1, rx1386_fail
    jump $I10
  rx1386_done:
    rx1386_cur."!cursor_fail"()
    if_null rx1386_debug, debug_641
    rx1386_cur."!cursor_debug"("FAIL", "scoped")
  debug_641:
    .return (rx1386_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("147_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    $P101 = self."!PREFIX__!subrule"("ws", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "typename"  :subid("148_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1391_debug, debug_642
    rx1391_cur."!cursor_debug"("START", "typename")
  debug_642:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1393_done
    goto rxscan1393_scan
  rxscan1393_loop:
    ($P10) = rx1391_cur."from"()
    inc $P10
    set rx1391_pos, $P10
    ge rx1391_pos, rx1391_eos, rxscan1393_done
  rxscan1393_scan:
    set_addr $I10, rxscan1393_loop
    rx1391_cur."!mark_push"(0, rx1391_pos, $I10)
  rxscan1393_done:
.annotate 'line', 283
  # rx subrule "name" subtype=capture negate=
    rx1391_cur."!cursor_pos"(rx1391_pos)
    $P10 = rx1391_cur."name"()
    unless $P10, rx1391_fail
    rx1391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx1391_pos = $P10."pos"()
  # rx pass
    rx1391_cur."!cursor_pass"(rx1391_pos, "typename")
    if_null rx1391_debug, debug_643
    rx1391_cur."!cursor_debug"("PASS", "typename", " at pos=", rx1391_pos)
  debug_643:
    .return (rx1391_cur)
  rx1391_restart:
.annotate 'line', 4
    if_null rx1391_debug, debug_644
    rx1391_cur."!cursor_debug"("NEXT", "typename")
  debug_644:
  rx1391_fail:
    (rx1391_rep, rx1391_pos, $I10, $P10) = rx1391_cur."!mark_fail"(0)
    lt rx1391_pos, -1, rx1391_done
    eq rx1391_pos, -1, rx1391_fail
    jump $I10
  rx1391_done:
    rx1391_cur."!cursor_fail"()
    if_null rx1391_debug, debug_645
    rx1391_cur."!cursor_debug"("FAIL", "typename")
  debug_645:
    .return (rx1391_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__typename"  :subid("149_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("name", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "declarator"  :subid("150_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
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
    if_null rx1395_debug, debug_646
    rx1395_cur."!cursor_debug"("START", "declarator")
  debug_646:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1397_done
    goto rxscan1397_scan
  rxscan1397_loop:
    ($P10) = rx1395_cur."from"()
    inc $P10
    set rx1395_pos, $P10
    ge rx1395_pos, rx1395_eos, rxscan1397_done
  rxscan1397_scan:
    set_addr $I10, rxscan1397_loop
    rx1395_cur."!mark_push"(0, rx1395_pos, $I10)
  rxscan1397_done:
  alt1398_0:
.annotate 'line', 285
    set_addr $I10, alt1398_1
    rx1395_cur."!mark_push"(0, rx1395_pos, $I10)
.annotate 'line', 286
  # rx subrule "variable_declarator" subtype=capture negate=
    rx1395_cur."!cursor_pos"(rx1395_pos)
    $P10 = rx1395_cur."variable_declarator"()
    unless $P10, rx1395_fail
    rx1395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx1395_pos = $P10."pos"()
    goto alt1398_end
  alt1398_1:
.annotate 'line', 287
  # rx subrule "routine_declarator" subtype=capture negate=
    rx1395_cur."!cursor_pos"(rx1395_pos)
    $P10 = rx1395_cur."routine_declarator"()
    unless $P10, rx1395_fail
    rx1395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx1395_pos = $P10."pos"()
  alt1398_end:
.annotate 'line', 285
  # rx pass
    rx1395_cur."!cursor_pass"(rx1395_pos, "declarator")
    if_null rx1395_debug, debug_647
    rx1395_cur."!cursor_debug"("PASS", "declarator", " at pos=", rx1395_pos)
  debug_647:
    .return (rx1395_cur)
  rx1395_restart:
.annotate 'line', 4
    if_null rx1395_debug, debug_648
    rx1395_cur."!cursor_debug"("NEXT", "declarator")
  debug_648:
  rx1395_fail:
    (rx1395_rep, rx1395_pos, $I10, $P10) = rx1395_cur."!mark_fail"(0)
    lt rx1395_pos, -1, rx1395_done
    eq rx1395_pos, -1, rx1395_fail
    jump $I10
  rx1395_done:
    rx1395_cur."!cursor_fail"()
    if_null rx1395_debug, debug_649
    rx1395_cur."!cursor_debug"("FAIL", "declarator")
  debug_649:
    .return (rx1395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__declarator"  :subid("151_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("routine_declarator", "")
    $P101 = self."!PREFIX__!subrule"("variable_declarator", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("152_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1400_tgt
    .local int rx1400_pos
    .local int rx1400_off
    .local int rx1400_eos
    .local int rx1400_rep
    .local pmc rx1400_cur
    .local pmc rx1400_debug
    (rx1400_cur, rx1400_pos, rx1400_tgt, $I10) = self."!cursor_start"()
    getattribute rx1400_debug, rx1400_cur, "$!debug"
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
    eq $I10, 1, rx1400_restart
    if_null rx1400_debug, debug_650
    rx1400_cur."!cursor_debug"("START", "variable_declarator")
  debug_650:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1402_done
    goto rxscan1402_scan
  rxscan1402_loop:
    ($P10) = rx1400_cur."from"()
    inc $P10
    set rx1400_pos, $P10
    ge rx1400_pos, rx1400_eos, rxscan1402_done
  rxscan1402_scan:
    set_addr $I10, rxscan1402_loop
    rx1400_cur."!mark_push"(0, rx1400_pos, $I10)
  rxscan1402_done:
.annotate 'line', 290
  # rx subrule "variable" subtype=capture negate=
    rx1400_cur."!cursor_pos"(rx1400_pos)
    $P10 = rx1400_cur."variable"()
    unless $P10, rx1400_fail
    rx1400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx1400_pos = $P10."pos"()
  # rx pass
    rx1400_cur."!cursor_pass"(rx1400_pos, "variable_declarator")
    if_null rx1400_debug, debug_651
    rx1400_cur."!cursor_debug"("PASS", "variable_declarator", " at pos=", rx1400_pos)
  debug_651:
    .return (rx1400_cur)
  rx1400_restart:
.annotate 'line', 4
    if_null rx1400_debug, debug_652
    rx1400_cur."!cursor_debug"("NEXT", "variable_declarator")
  debug_652:
  rx1400_fail:
    (rx1400_rep, rx1400_pos, $I10, $P10) = rx1400_cur."!mark_fail"(0)
    lt rx1400_pos, -1, rx1400_done
    eq rx1400_pos, -1, rx1400_fail
    jump $I10
  rx1400_done:
    rx1400_cur."!cursor_fail"()
    if_null rx1400_debug, debug_653
    rx1400_cur."!cursor_debug"("FAIL", "variable_declarator")
  debug_653:
    .return (rx1400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("153_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("variable", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("154_1309998847.42912") :method
.annotate 'line', 292
    $P100 = self."!protoregex"("routine_declarator")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("155_1309998847.42912") :method
.annotate 'line', 292
    $P101 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("156_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1406_tgt
    .local int rx1406_pos
    .local int rx1406_off
    .local int rx1406_eos
    .local int rx1406_rep
    .local pmc rx1406_cur
    .local pmc rx1406_debug
    (rx1406_cur, rx1406_pos, rx1406_tgt, $I10) = self."!cursor_start"()
    getattribute rx1406_debug, rx1406_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1406_cur
    .local pmc match
    .lex "$/", match
    length rx1406_eos, rx1406_tgt
    gt rx1406_pos, rx1406_eos, rx1406_done
    set rx1406_off, 0
    lt rx1406_pos, 2, rx1406_start
    sub rx1406_off, rx1406_pos, 1
    substr rx1406_tgt, rx1406_tgt, rx1406_off
  rx1406_start:
    eq $I10, 1, rx1406_restart
    if_null rx1406_debug, debug_654
    rx1406_cur."!cursor_debug"("START", "routine_declarator:sym<sub>")
  debug_654:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1408_done
    goto rxscan1408_scan
  rxscan1408_loop:
    ($P10) = rx1406_cur."from"()
    inc $P10
    set rx1406_pos, $P10
    ge rx1406_pos, rx1406_eos, rxscan1408_done
  rxscan1408_scan:
    set_addr $I10, rxscan1408_loop
    rx1406_cur."!mark_push"(0, rx1406_pos, $I10)
  rxscan1408_done:
.annotate 'line', 293
  # rx subcapture "sym"
    set_addr $I10, rxcap_1409_fail
    rx1406_cur."!mark_push"(0, rx1406_pos, $I10)
  # rx literal  "sub"
    add $I11, rx1406_pos, 3
    gt $I11, rx1406_eos, rx1406_fail
    sub $I11, rx1406_pos, rx1406_off
    substr $S10, rx1406_tgt, $I11, 3
    ne $S10, "sub", rx1406_fail
    add rx1406_pos, 3
    set_addr $I10, rxcap_1409_fail
    ($I12, $I11) = rx1406_cur."!mark_peek"($I10)
    rx1406_cur."!cursor_pos"($I11)
    ($P10) = rx1406_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1406_pos, "")
    rx1406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1409_done
  rxcap_1409_fail:
    goto rx1406_fail
  rxcap_1409_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx1406_cur."!cursor_pos"(rx1406_pos)
    $P10 = rx1406_cur."routine_def"()
    unless $P10, rx1406_fail
    rx1406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx1406_pos = $P10."pos"()
  # rx pass
    rx1406_cur."!cursor_pass"(rx1406_pos, "routine_declarator:sym<sub>")
    if_null rx1406_debug, debug_655
    rx1406_cur."!cursor_debug"("PASS", "routine_declarator:sym<sub>", " at pos=", rx1406_pos)
  debug_655:
    .return (rx1406_cur)
  rx1406_restart:
.annotate 'line', 4
    if_null rx1406_debug, debug_656
    rx1406_cur."!cursor_debug"("NEXT", "routine_declarator:sym<sub>")
  debug_656:
  rx1406_fail:
    (rx1406_rep, rx1406_pos, $I10, $P10) = rx1406_cur."!mark_fail"(0)
    lt rx1406_pos, -1, rx1406_done
    eq rx1406_pos, -1, rx1406_fail
    jump $I10
  rx1406_done:
    rx1406_cur."!cursor_fail"()
    if_null rx1406_debug, debug_657
    rx1406_cur."!cursor_debug"("FAIL", "routine_declarator:sym<sub>")
  debug_657:
    .return (rx1406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("157_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("158_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1411_tgt
    .local int rx1411_pos
    .local int rx1411_off
    .local int rx1411_eos
    .local int rx1411_rep
    .local pmc rx1411_cur
    .local pmc rx1411_debug
    (rx1411_cur, rx1411_pos, rx1411_tgt, $I10) = self."!cursor_start"()
    getattribute rx1411_debug, rx1411_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1411_cur
    .local pmc match
    .lex "$/", match
    length rx1411_eos, rx1411_tgt
    gt rx1411_pos, rx1411_eos, rx1411_done
    set rx1411_off, 0
    lt rx1411_pos, 2, rx1411_start
    sub rx1411_off, rx1411_pos, 1
    substr rx1411_tgt, rx1411_tgt, rx1411_off
  rx1411_start:
    eq $I10, 1, rx1411_restart
    if_null rx1411_debug, debug_658
    rx1411_cur."!cursor_debug"("START", "routine_declarator:sym<method>")
  debug_658:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1413_done
    goto rxscan1413_scan
  rxscan1413_loop:
    ($P10) = rx1411_cur."from"()
    inc $P10
    set rx1411_pos, $P10
    ge rx1411_pos, rx1411_eos, rxscan1413_done
  rxscan1413_scan:
    set_addr $I10, rxscan1413_loop
    rx1411_cur."!mark_push"(0, rx1411_pos, $I10)
  rxscan1413_done:
.annotate 'line', 294
  # rx subcapture "sym"
    set_addr $I10, rxcap_1414_fail
    rx1411_cur."!mark_push"(0, rx1411_pos, $I10)
  # rx literal  "method"
    add $I11, rx1411_pos, 6
    gt $I11, rx1411_eos, rx1411_fail
    sub $I11, rx1411_pos, rx1411_off
    substr $S10, rx1411_tgt, $I11, 6
    ne $S10, "method", rx1411_fail
    add rx1411_pos, 6
    set_addr $I10, rxcap_1414_fail
    ($I12, $I11) = rx1411_cur."!mark_peek"($I10)
    rx1411_cur."!cursor_pos"($I11)
    ($P10) = rx1411_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1411_pos, "")
    rx1411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1414_done
  rxcap_1414_fail:
    goto rx1411_fail
  rxcap_1414_done:
  # rx subrule "method_def" subtype=capture negate=
    rx1411_cur."!cursor_pos"(rx1411_pos)
    $P10 = rx1411_cur."method_def"()
    unless $P10, rx1411_fail
    rx1411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx1411_pos = $P10."pos"()
  # rx pass
    rx1411_cur."!cursor_pass"(rx1411_pos, "routine_declarator:sym<method>")
    if_null rx1411_debug, debug_659
    rx1411_cur."!cursor_debug"("PASS", "routine_declarator:sym<method>", " at pos=", rx1411_pos)
  debug_659:
    .return (rx1411_cur)
  rx1411_restart:
.annotate 'line', 4
    if_null rx1411_debug, debug_660
    rx1411_cur."!cursor_debug"("NEXT", "routine_declarator:sym<method>")
  debug_660:
  rx1411_fail:
    (rx1411_rep, rx1411_pos, $I10, $P10) = rx1411_cur."!mark_fail"(0)
    lt rx1411_pos, -1, rx1411_done
    eq rx1411_pos, -1, rx1411_fail
    jump $I10
  rx1411_done:
    rx1411_cur."!cursor_fail"()
    if_null rx1411_debug, debug_661
    rx1411_cur."!cursor_debug"("FAIL", "routine_declarator:sym<method>")
  debug_661:
    .return (rx1411_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("159_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("method_def", "method")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("160_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1416_tgt
    .local int rx1416_pos
    .local int rx1416_off
    .local int rx1416_eos
    .local int rx1416_rep
    .local pmc rx1416_cur
    .local pmc rx1416_debug
    (rx1416_cur, rx1416_pos, rx1416_tgt, $I10) = self."!cursor_start"()
    rx1416_cur."!cursor_caparray"("sigil", "deflongname", "trait")
    getattribute rx1416_debug, rx1416_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1416_cur
    .local pmc match
    .lex "$/", match
    length rx1416_eos, rx1416_tgt
    gt rx1416_pos, rx1416_eos, rx1416_done
    set rx1416_off, 0
    lt rx1416_pos, 2, rx1416_start
    sub rx1416_off, rx1416_pos, 1
    substr rx1416_tgt, rx1416_tgt, rx1416_off
  rx1416_start:
    eq $I10, 1, rx1416_restart
    if_null rx1416_debug, debug_662
    rx1416_cur."!cursor_debug"("START", "routine_def")
  debug_662:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1418_done
    goto rxscan1418_scan
  rxscan1418_loop:
    ($P10) = rx1416_cur."from"()
    inc $P10
    set rx1416_pos, $P10
    ge rx1416_pos, rx1416_eos, rxscan1418_done
  rxscan1418_scan:
    set_addr $I10, rxscan1418_loop
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  rxscan1418_done:
.annotate 'line', 296
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
.annotate 'line', 297
  # rx rxquantr1419 ** 0..1
    set_addr $I10, rxquantr1419_done
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  rxquantr1419_loop:
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_1421_fail
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  # rx rxquantr1420 ** 0..1
    set_addr $I10, rxquantr1420_done
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  rxquantr1420_loop:
  # rx literal  "&"
    add $I11, rx1416_pos, 1
    gt $I11, rx1416_eos, rx1416_fail
    sub $I11, rx1416_pos, rx1416_off
    ord $I11, rx1416_tgt, $I11
    ne $I11, 38, rx1416_fail
    add rx1416_pos, 1
    set_addr $I10, rxquantr1420_done
    (rx1416_rep) = rx1416_cur."!mark_commit"($I10)
  rxquantr1420_done:
    set_addr $I10, rxcap_1421_fail
    ($I12, $I11) = rx1416_cur."!mark_peek"($I10)
    rx1416_cur."!cursor_pos"($I11)
    ($P10) = rx1416_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1416_pos, "")
    rx1416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_1421_done
  rxcap_1421_fail:
    goto rx1416_fail
  rxcap_1421_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."deflongname"()
    unless $P10, rx1416_fail
    rx1416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx1416_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
    set_addr $I10, rxquantr1419_done
    (rx1416_rep) = rx1416_cur."!mark_commit"($I10)
  rxquantr1419_done:
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
.annotate 'line', 298
  # rx subrule "newpad" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."newpad"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  alt1422_0:
.annotate 'line', 299
    set_addr $I10, alt1422_1
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx1416_pos, 1
    gt $I11, rx1416_eos, rx1416_fail
    sub $I11, rx1416_pos, rx1416_off
    ord $I11, rx1416_tgt, $I11
    ne $I11, 40, rx1416_fail
    add rx1416_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."signature"()
    unless $P10, rx1416_fail
    rx1416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx1416_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1416_pos, 1
    gt $I11, rx1416_eos, rx1416_fail
    sub $I11, rx1416_pos, rx1416_off
    ord $I11, rx1416_tgt, $I11
    ne $I11, 41, rx1416_fail
    add rx1416_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
    goto alt1422_end
  alt1422_1:
.annotate 'line', 300
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
  alt1422_end:
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
.annotate 'line', 301
  # rx rxquantr1423 ** 0..*
    set_addr $I10, rxquantr1423_done
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10)
  rxquantr1423_loop:
  # rx subrule "trait" subtype=capture negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."trait"()
    unless $P10, rx1416_fail
    goto rxsubrule1424_pass
  rxsubrule1424_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1416_fail
  rxsubrule1424_pass:
    set_addr $I10, rxsubrule1424_back
    rx1416_cur."!mark_push"(0, rx1416_pos, $I10, $P10)
    $P10."!cursor_names"("trait")
    rx1416_pos = $P10."pos"()
    set_addr $I10, rxquantr1423_done
    (rx1416_rep) = rx1416_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1423_done
    rx1416_cur."!mark_push"(rx1416_rep, rx1416_pos, $I10)
    goto rxquantr1423_loop
  rxquantr1423_done:
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
.annotate 'line', 302
  # rx subrule "blockoid" subtype=capture negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."blockoid"()
    unless $P10, rx1416_fail
    rx1416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx1416_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1416_cur."!cursor_pos"(rx1416_pos)
    $P10 = rx1416_cur."ws"()
    unless $P10, rx1416_fail
    rx1416_pos = $P10."pos"()
.annotate 'line', 296
  # rx pass
    rx1416_cur."!cursor_pass"(rx1416_pos, "routine_def")
    if_null rx1416_debug, debug_663
    rx1416_cur."!cursor_debug"("PASS", "routine_def", " at pos=", rx1416_pos)
  debug_663:
    .return (rx1416_cur)
  rx1416_restart:
.annotate 'line', 4
    if_null rx1416_debug, debug_664
    rx1416_cur."!cursor_debug"("NEXT", "routine_def")
  debug_664:
  rx1416_fail:
    (rx1416_rep, rx1416_pos, $I10, $P10) = rx1416_cur."!mark_fail"(0)
    lt rx1416_pos, -1, rx1416_done
    eq rx1416_pos, -1, rx1416_fail
    jump $I10
  rx1416_done:
    rx1416_cur."!cursor_fail"()
    if_null rx1416_debug, debug_665
    rx1416_cur."!cursor_debug"("FAIL", "routine_def")
  debug_665:
    .return (rx1416_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("161_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("162_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1426_tgt
    .local int rx1426_pos
    .local int rx1426_off
    .local int rx1426_eos
    .local int rx1426_rep
    .local pmc rx1426_cur
    .local pmc rx1426_debug
    (rx1426_cur, rx1426_pos, rx1426_tgt, $I10) = self."!cursor_start"()
    rx1426_cur."!cursor_caparray"("deflongname", "trait")
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
    if_null rx1426_debug, debug_666
    rx1426_cur."!cursor_debug"("START", "method_def")
  debug_666:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1428_done
    goto rxscan1428_scan
  rxscan1428_loop:
    ($P10) = rx1426_cur."from"()
    inc $P10
    set rx1426_pos, $P10
    ge rx1426_pos, rx1426_eos, rxscan1428_done
  rxscan1428_scan:
    set_addr $I10, rxscan1428_loop
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10)
  rxscan1428_done:
.annotate 'line', 305
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
.annotate 'line', 306
  # rx rxquantr1429 ** 0..1
    set_addr $I10, rxquantr1429_done
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10)
  rxquantr1429_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."deflongname"()
    unless $P10, rx1426_fail
    goto rxsubrule1430_pass
  rxsubrule1430_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1426_fail
  rxsubrule1430_pass:
    set_addr $I10, rxsubrule1430_back
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10, $P10)
    $P10."!cursor_names"("deflongname")
    rx1426_pos = $P10."pos"()
    set_addr $I10, rxquantr1429_done
    (rx1426_rep) = rx1426_cur."!mark_commit"($I10)
  rxquantr1429_done:
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
.annotate 'line', 307
  # rx subrule "newpad" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."newpad"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  alt1431_0:
.annotate 'line', 308
    set_addr $I10, alt1431_1
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx1426_pos, 1
    gt $I11, rx1426_eos, rx1426_fail
    sub $I11, rx1426_pos, rx1426_off
    ord $I11, rx1426_tgt, $I11
    ne $I11, 40, rx1426_fail
    add rx1426_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."signature"()
    unless $P10, rx1426_fail
    rx1426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx1426_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1426_pos, 1
    gt $I11, rx1426_eos, rx1426_fail
    sub $I11, rx1426_pos, rx1426_off
    ord $I11, rx1426_tgt, $I11
    ne $I11, 41, rx1426_fail
    add rx1426_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
    goto alt1431_end
  alt1431_1:
.annotate 'line', 309
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
  alt1431_end:
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
.annotate 'line', 310
  # rx rxquantr1432 ** 0..*
    set_addr $I10, rxquantr1432_done
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10)
  rxquantr1432_loop:
  # rx subrule "trait" subtype=capture negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."trait"()
    unless $P10, rx1426_fail
    goto rxsubrule1433_pass
  rxsubrule1433_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1426_fail
  rxsubrule1433_pass:
    set_addr $I10, rxsubrule1433_back
    rx1426_cur."!mark_push"(0, rx1426_pos, $I10, $P10)
    $P10."!cursor_names"("trait")
    rx1426_pos = $P10."pos"()
    set_addr $I10, rxquantr1432_done
    (rx1426_rep) = rx1426_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1432_done
    rx1426_cur."!mark_push"(rx1426_rep, rx1426_pos, $I10)
    goto rxquantr1432_loop
  rxquantr1432_done:
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
.annotate 'line', 311
  # rx subrule "blockoid" subtype=capture negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."blockoid"()
    unless $P10, rx1426_fail
    rx1426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx1426_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1426_cur."!cursor_pos"(rx1426_pos)
    $P10 = rx1426_cur."ws"()
    unless $P10, rx1426_fail
    rx1426_pos = $P10."pos"()
.annotate 'line', 305
  # rx pass
    rx1426_cur."!cursor_pass"(rx1426_pos, "method_def")
    if_null rx1426_debug, debug_667
    rx1426_cur."!cursor_debug"("PASS", "method_def", " at pos=", rx1426_pos)
  debug_667:
    .return (rx1426_cur)
  rx1426_restart:
.annotate 'line', 4
    if_null rx1426_debug, debug_668
    rx1426_cur."!cursor_debug"("NEXT", "method_def")
  debug_668:
  rx1426_fail:
    (rx1426_rep, rx1426_pos, $I10, $P10) = rx1426_cur."!mark_fail"(0)
    lt rx1426_pos, -1, rx1426_done
    eq rx1426_pos, -1, rx1426_fail
    jump $I10
  rx1426_done:
    rx1426_cur."!cursor_fail"()
    if_null rx1426_debug, debug_669
    rx1426_cur."!cursor_debug"("FAIL", "method_def")
  debug_669:
    .return (rx1426_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("163_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator"  :subid("164_1309998847.42912") :method
.annotate 'line', 314
    $P100 = self."!protoregex"("multi_declarator")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator"  :subid("165_1309998847.42912") :method
.annotate 'line', 314
    $P101 = self."!PREFIX__!protoregex"("multi_declarator")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<multi>"  :subid("166_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 316
    new $P100, "Undef"
    set $P1437, $P100
    .lex "$*MULTINESS", $P1437
.annotate 'line', 4
    .local string rx1438_tgt
    .local int rx1438_pos
    .local int rx1438_off
    .local int rx1438_eos
    .local int rx1438_rep
    .local pmc rx1438_cur
    .local pmc rx1438_debug
    (rx1438_cur, rx1438_pos, rx1438_tgt, $I10) = self."!cursor_start"()
    getattribute rx1438_debug, rx1438_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1438_cur
    .local pmc match
    .lex "$/", match
    length rx1438_eos, rx1438_tgt
    gt rx1438_pos, rx1438_eos, rx1438_done
    set rx1438_off, 0
    lt rx1438_pos, 2, rx1438_start
    sub rx1438_off, rx1438_pos, 1
    substr rx1438_tgt, rx1438_tgt, rx1438_off
  rx1438_start:
    eq $I10, 1, rx1438_restart
    if_null rx1438_debug, debug_670
    rx1438_cur."!cursor_debug"("START", "multi_declarator:sym<multi>")
  debug_670:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1440_done
    goto rxscan1440_scan
  rxscan1440_loop:
    ($P10) = rx1438_cur."from"()
    inc $P10
    set rx1438_pos, $P10
    ge rx1438_pos, rx1438_eos, rxscan1440_done
  rxscan1440_scan:
    set_addr $I10, rxscan1440_loop
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  rxscan1440_done:
.annotate 'line', 316
    rx1438_cur."!cursor_pos"(rx1438_pos)
    new $P103, "String"
    assign $P103, "multi"
    store_lex "$*MULTINESS", $P103
.annotate 'line', 317
  # rx subcapture "sym"
    set_addr $I10, rxcap_1441_fail
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  # rx literal  "multi"
    add $I11, rx1438_pos, 5
    gt $I11, rx1438_eos, rx1438_fail
    sub $I11, rx1438_pos, rx1438_off
    substr $S10, rx1438_tgt, $I11, 5
    ne $S10, "multi", rx1438_fail
    add rx1438_pos, 5
    set_addr $I10, rxcap_1441_fail
    ($I12, $I11) = rx1438_cur."!mark_peek"($I10)
    rx1438_cur."!cursor_pos"($I11)
    ($P10) = rx1438_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1438_pos, "")
    rx1438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1441_done
  rxcap_1441_fail:
    goto rx1438_fail
  rxcap_1441_done:
.annotate 'line', 318
  # rx subrule "ws" subtype=method negate=
    rx1438_cur."!cursor_pos"(rx1438_pos)
    $P10 = rx1438_cur."ws"()
    unless $P10, rx1438_fail
    rx1438_pos = $P10."pos"()
  alt1442_0:
    set_addr $I10, alt1442_1
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  # rx subrule "declarator" subtype=capture negate=
    rx1438_cur."!cursor_pos"(rx1438_pos)
    $P10 = rx1438_cur."declarator"()
    unless $P10, rx1438_fail
    rx1438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx1438_pos = $P10."pos"()
    goto alt1442_end
  alt1442_1:
    set_addr $I10, alt1442_2
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  # rx subrule "routine_def" subtype=capture negate=
    rx1438_cur."!cursor_pos"(rx1438_pos)
    $P10 = rx1438_cur."routine_def"()
    unless $P10, rx1438_fail
    rx1438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx1438_pos = $P10."pos"()
    goto alt1442_end
  alt1442_2:
  # rx subrule "panic" subtype=method negate=
    rx1438_cur."!cursor_pos"(rx1438_pos)
    $P10 = rx1438_cur."panic"("Malformed multi")
    unless $P10, rx1438_fail
    rx1438_pos = $P10."pos"()
  alt1442_end:
.annotate 'line', 315
  # rx pass
    rx1438_cur."!cursor_pass"(rx1438_pos, "multi_declarator:sym<multi>")
    if_null rx1438_debug, debug_671
    rx1438_cur."!cursor_debug"("PASS", "multi_declarator:sym<multi>", " at pos=", rx1438_pos)
  debug_671:
    .return (rx1438_cur)
  rx1438_restart:
.annotate 'line', 4
    if_null rx1438_debug, debug_672
    rx1438_cur."!cursor_debug"("NEXT", "multi_declarator:sym<multi>")
  debug_672:
  rx1438_fail:
    (rx1438_rep, rx1438_pos, $I10, $P10) = rx1438_cur."!mark_fail"(0)
    lt rx1438_pos, -1, rx1438_done
    eq rx1438_pos, -1, rx1438_fail
    jump $I10
  rx1438_done:
    rx1438_cur."!cursor_fail"()
    if_null rx1438_debug, debug_673
    rx1438_cur."!cursor_debug"("FAIL", "multi_declarator:sym<multi>")
  debug_673:
    .return (rx1438_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<multi>"  :subid("167_1309998847.42912") :method
.annotate 'line', 4
    $P101 = self."!PREFIX__!subrule"("ws", "multi")
    new $P102, "ResizablePMCArray"
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "multi_declarator:sym<null>"  :subid("168_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 321
    new $P100, "Undef"
    set $P1444, $P100
    .lex "$*MULTINESS", $P1444
.annotate 'line', 4
    .local string rx1445_tgt
    .local int rx1445_pos
    .local int rx1445_off
    .local int rx1445_eos
    .local int rx1445_rep
    .local pmc rx1445_cur
    .local pmc rx1445_debug
    (rx1445_cur, rx1445_pos, rx1445_tgt, $I10) = self."!cursor_start"()
    getattribute rx1445_debug, rx1445_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1445_cur
    .local pmc match
    .lex "$/", match
    length rx1445_eos, rx1445_tgt
    gt rx1445_pos, rx1445_eos, rx1445_done
    set rx1445_off, 0
    lt rx1445_pos, 2, rx1445_start
    sub rx1445_off, rx1445_pos, 1
    substr rx1445_tgt, rx1445_tgt, rx1445_off
  rx1445_start:
    eq $I10, 1, rx1445_restart
    if_null rx1445_debug, debug_674
    rx1445_cur."!cursor_debug"("START", "multi_declarator:sym<null>")
  debug_674:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1447_done
    goto rxscan1447_scan
  rxscan1447_loop:
    ($P10) = rx1445_cur."from"()
    inc $P10
    set rx1445_pos, $P10
    ge rx1445_pos, rx1445_eos, rxscan1447_done
  rxscan1447_scan:
    set_addr $I10, rxscan1447_loop
    rx1445_cur."!mark_push"(0, rx1445_pos, $I10)
  rxscan1447_done:
.annotate 'line', 321
    rx1445_cur."!cursor_pos"(rx1445_pos)
    new $P103, "String"
    assign $P103, ""
    store_lex "$*MULTINESS", $P103
.annotate 'line', 322
  # rx subrule "declarator" subtype=capture negate=
    rx1445_cur."!cursor_pos"(rx1445_pos)
    $P10 = rx1445_cur."declarator"()
    unless $P10, rx1445_fail
    rx1445_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("declarator")
    rx1445_pos = $P10."pos"()
.annotate 'line', 320
  # rx pass
    rx1445_cur."!cursor_pass"(rx1445_pos, "multi_declarator:sym<null>")
    if_null rx1445_debug, debug_675
    rx1445_cur."!cursor_debug"("PASS", "multi_declarator:sym<null>", " at pos=", rx1445_pos)
  debug_675:
    .return (rx1445_cur)
  rx1445_restart:
.annotate 'line', 4
    if_null rx1445_debug, debug_676
    rx1445_cur."!cursor_debug"("NEXT", "multi_declarator:sym<null>")
  debug_676:
  rx1445_fail:
    (rx1445_rep, rx1445_pos, $I10, $P10) = rx1445_cur."!mark_fail"(0)
    lt rx1445_pos, -1, rx1445_done
    eq rx1445_pos, -1, rx1445_fail
    jump $I10
  rx1445_done:
    rx1445_cur."!cursor_fail"()
    if_null rx1445_debug, debug_677
    rx1445_cur."!cursor_debug"("FAIL", "multi_declarator:sym<null>")
  debug_677:
    .return (rx1445_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__multi_declarator:sym<null>"  :subid("169_1309998847.42912") :method
.annotate 'line', 4
    $P101 = self."!PREFIX__!subrule"("declarator", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("170_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1449_tgt
    .local int rx1449_pos
    .local int rx1449_off
    .local int rx1449_eos
    .local int rx1449_rep
    .local pmc rx1449_cur
    .local pmc rx1449_debug
    (rx1449_cur, rx1449_pos, rx1449_tgt, $I10) = self."!cursor_start"()
    rx1449_cur."!cursor_caparray"("parameter")
    getattribute rx1449_debug, rx1449_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1449_cur
    .local pmc match
    .lex "$/", match
    length rx1449_eos, rx1449_tgt
    gt rx1449_pos, rx1449_eos, rx1449_done
    set rx1449_off, 0
    lt rx1449_pos, 2, rx1449_start
    sub rx1449_off, rx1449_pos, 1
    substr rx1449_tgt, rx1449_tgt, rx1449_off
  rx1449_start:
    eq $I10, 1, rx1449_restart
    if_null rx1449_debug, debug_678
    rx1449_cur."!cursor_debug"("START", "signature")
  debug_678:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1451_done
    goto rxscan1451_scan
  rxscan1451_loop:
    ($P10) = rx1449_cur."from"()
    inc $P10
    set rx1449_pos, $P10
    ge rx1449_pos, rx1449_eos, rxscan1451_done
  rxscan1451_scan:
    set_addr $I10, rxscan1451_loop
    rx1449_cur."!mark_push"(0, rx1449_pos, $I10)
  rxscan1451_done:
.annotate 'line', 325
  # rx rxquantr1452 ** 0..1
    set_addr $I10, rxquantr1452_done
    rx1449_cur."!mark_push"(0, rx1449_pos, $I10)
  rxquantr1452_loop:
  # rx rxquantr1453 ** 1..*
    set_addr $I10, rxquantr1453_done
    rx1449_cur."!mark_push"(0, -1, $I10)
  rxquantr1453_loop:
  # rx subrule "ws" subtype=method negate=
    rx1449_cur."!cursor_pos"(rx1449_pos)
    $P10 = rx1449_cur."ws"()
    unless $P10, rx1449_fail
    rx1449_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx1449_cur."!cursor_pos"(rx1449_pos)
    $P10 = rx1449_cur."parameter"()
    unless $P10, rx1449_fail
    rx1449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx1449_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1449_cur."!cursor_pos"(rx1449_pos)
    $P10 = rx1449_cur."ws"()
    unless $P10, rx1449_fail
    rx1449_pos = $P10."pos"()
    set_addr $I10, rxquantr1453_done
    (rx1449_rep) = rx1449_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1453_done
    rx1449_cur."!mark_push"(rx1449_rep, rx1449_pos, $I10)
  # rx literal  ","
    add $I11, rx1449_pos, 1
    gt $I11, rx1449_eos, rx1449_fail
    sub $I11, rx1449_pos, rx1449_off
    ord $I11, rx1449_tgt, $I11
    ne $I11, 44, rx1449_fail
    add rx1449_pos, 1
    goto rxquantr1453_loop
  rxquantr1453_done:
    set_addr $I10, rxquantr1452_done
    (rx1449_rep) = rx1449_cur."!mark_commit"($I10)
  rxquantr1452_done:
  # rx pass
    rx1449_cur."!cursor_pass"(rx1449_pos, "signature")
    if_null rx1449_debug, debug_679
    rx1449_cur."!cursor_debug"("PASS", "signature", " at pos=", rx1449_pos)
  debug_679:
    .return (rx1449_cur)
  rx1449_restart:
.annotate 'line', 4
    if_null rx1449_debug, debug_680
    rx1449_cur."!cursor_debug"("NEXT", "signature")
  debug_680:
  rx1449_fail:
    (rx1449_rep, rx1449_pos, $I10, $P10) = rx1449_cur."!mark_fail"(0)
    lt rx1449_pos, -1, rx1449_done
    eq rx1449_pos, -1, rx1449_fail
    jump $I10
  rx1449_done:
    rx1449_cur."!cursor_fail"()
    if_null rx1449_debug, debug_681
    rx1449_cur."!cursor_debug"("FAIL", "signature")
  debug_681:
    .return (rx1449_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("171_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("172_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1455_tgt
    .local int rx1455_pos
    .local int rx1455_off
    .local int rx1455_eos
    .local int rx1455_rep
    .local pmc rx1455_cur
    .local pmc rx1455_debug
    (rx1455_cur, rx1455_pos, rx1455_tgt, $I10) = self."!cursor_start"()
    rx1455_cur."!cursor_caparray"("typename", "default_value")
    getattribute rx1455_debug, rx1455_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1455_cur
    .local pmc match
    .lex "$/", match
    length rx1455_eos, rx1455_tgt
    gt rx1455_pos, rx1455_eos, rx1455_done
    set rx1455_off, 0
    lt rx1455_pos, 2, rx1455_start
    sub rx1455_off, rx1455_pos, 1
    substr rx1455_tgt, rx1455_tgt, rx1455_off
  rx1455_start:
    eq $I10, 1, rx1455_restart
    if_null rx1455_debug, debug_682
    rx1455_cur."!cursor_debug"("START", "parameter")
  debug_682:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1457_done
    goto rxscan1457_scan
  rxscan1457_loop:
    ($P10) = rx1455_cur."from"()
    inc $P10
    set rx1455_pos, $P10
    ge rx1455_pos, rx1455_eos, rxscan1457_done
  rxscan1457_scan:
    set_addr $I10, rxscan1457_loop
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  rxscan1457_done:
.annotate 'line', 328
  # rx rxquantr1458 ** 0..*
    set_addr $I10, rxquantr1458_done
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  rxquantr1458_loop:
  # rx subrule "typename" subtype=capture negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."typename"()
    unless $P10, rx1455_fail
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("typename")
    rx1455_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."ws"()
    unless $P10, rx1455_fail
    rx1455_pos = $P10."pos"()
    set_addr $I10, rxquantr1458_done
    (rx1455_rep) = rx1455_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1458_done
    rx1455_cur."!mark_push"(rx1455_rep, rx1455_pos, $I10)
    goto rxquantr1458_loop
  rxquantr1458_done:
  alt1459_0:
.annotate 'line', 329
    set_addr $I10, alt1459_1
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
.annotate 'line', 330
  # rx subcapture "quant"
    set_addr $I10, rxcap_1460_fail
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  # rx literal  "*"
    add $I11, rx1455_pos, 1
    gt $I11, rx1455_eos, rx1455_fail
    sub $I11, rx1455_pos, rx1455_off
    ord $I11, rx1455_tgt, $I11
    ne $I11, 42, rx1455_fail
    add rx1455_pos, 1
    set_addr $I10, rxcap_1460_fail
    ($I12, $I11) = rx1455_cur."!mark_peek"($I10)
    rx1455_cur."!cursor_pos"($I11)
    ($P10) = rx1455_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1455_pos, "")
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_1460_done
  rxcap_1460_fail:
    goto rx1455_fail
  rxcap_1460_done:
  # rx subrule "param_var" subtype=capture negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."param_var"()
    unless $P10, rx1455_fail
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx1455_pos = $P10."pos"()
    goto alt1459_end
  alt1459_1:
  alt1461_0:
.annotate 'line', 331
    set_addr $I10, alt1461_1
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."param_var"()
    unless $P10, rx1455_fail
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx1455_pos = $P10."pos"()
    goto alt1461_end
  alt1461_1:
  # rx subrule "named_param" subtype=capture negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."named_param"()
    unless $P10, rx1455_fail
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx1455_pos = $P10."pos"()
  alt1461_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_1463_fail
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  alt1462_0:
    set_addr $I10, alt1462_1
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  # rx literal  "?"
    add $I11, rx1455_pos, 1
    gt $I11, rx1455_eos, rx1455_fail
    sub $I11, rx1455_pos, rx1455_off
    ord $I11, rx1455_tgt, $I11
    ne $I11, 63, rx1455_fail
    add rx1455_pos, 1
    goto alt1462_end
  alt1462_1:
    set_addr $I10, alt1462_2
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  # rx literal  "!"
    add $I11, rx1455_pos, 1
    gt $I11, rx1455_eos, rx1455_fail
    sub $I11, rx1455_pos, rx1455_off
    ord $I11, rx1455_tgt, $I11
    ne $I11, 33, rx1455_fail
    add rx1455_pos, 1
    goto alt1462_end
  alt1462_2:
  alt1462_end:
    set_addr $I10, rxcap_1463_fail
    ($I12, $I11) = rx1455_cur."!mark_peek"($I10)
    rx1455_cur."!cursor_pos"($I11)
    ($P10) = rx1455_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1455_pos, "")
    rx1455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_1463_done
  rxcap_1463_fail:
    goto rx1455_fail
  rxcap_1463_done:
  alt1459_end:
.annotate 'line', 333
  # rx rxquantr1464 ** 0..1
    set_addr $I10, rxquantr1464_done
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10)
  rxquantr1464_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx1455_cur."!cursor_pos"(rx1455_pos)
    $P10 = rx1455_cur."default_value"()
    unless $P10, rx1455_fail
    goto rxsubrule1465_pass
  rxsubrule1465_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1455_fail
  rxsubrule1465_pass:
    set_addr $I10, rxsubrule1465_back
    rx1455_cur."!mark_push"(0, rx1455_pos, $I10, $P10)
    $P10."!cursor_names"("default_value")
    rx1455_pos = $P10."pos"()
    set_addr $I10, rxquantr1464_done
    (rx1455_rep) = rx1455_cur."!mark_commit"($I10)
  rxquantr1464_done:
.annotate 'line', 327
  # rx pass
    rx1455_cur."!cursor_pass"(rx1455_pos, "parameter")
    if_null rx1455_debug, debug_683
    rx1455_cur."!cursor_debug"("PASS", "parameter", " at pos=", rx1455_pos)
  debug_683:
    .return (rx1455_cur)
  rx1455_restart:
.annotate 'line', 4
    if_null rx1455_debug, debug_684
    rx1455_cur."!cursor_debug"("NEXT", "parameter")
  debug_684:
  rx1455_fail:
    (rx1455_rep, rx1455_pos, $I10, $P10) = rx1455_cur."!mark_fail"(0)
    lt rx1455_pos, -1, rx1455_done
    eq rx1455_pos, -1, rx1455_fail
    jump $I10
  rx1455_done:
    rx1455_cur."!cursor_fail"()
    if_null rx1455_debug, debug_685
    rx1455_cur."!cursor_debug"("FAIL", "parameter")
  debug_685:
    .return (rx1455_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("173_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("174_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1467_tgt
    .local int rx1467_pos
    .local int rx1467_off
    .local int rx1467_eos
    .local int rx1467_rep
    .local pmc rx1467_cur
    .local pmc rx1467_debug
    (rx1467_cur, rx1467_pos, rx1467_tgt, $I10) = self."!cursor_start"()
    rx1467_cur."!cursor_caparray"("twigil")
    getattribute rx1467_debug, rx1467_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1467_cur
    .local pmc match
    .lex "$/", match
    length rx1467_eos, rx1467_tgt
    gt rx1467_pos, rx1467_eos, rx1467_done
    set rx1467_off, 0
    lt rx1467_pos, 2, rx1467_start
    sub rx1467_off, rx1467_pos, 1
    substr rx1467_tgt, rx1467_tgt, rx1467_off
  rx1467_start:
    eq $I10, 1, rx1467_restart
    if_null rx1467_debug, debug_686
    rx1467_cur."!cursor_debug"("START", "param_var")
  debug_686:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1469_done
    goto rxscan1469_scan
  rxscan1469_loop:
    ($P10) = rx1467_cur."from"()
    inc $P10
    set rx1467_pos, $P10
    ge rx1467_pos, rx1467_eos, rxscan1469_done
  rxscan1469_scan:
    set_addr $I10, rxscan1469_loop
    rx1467_cur."!mark_push"(0, rx1467_pos, $I10)
  rxscan1469_done:
.annotate 'line', 337
  # rx subrule "sigil" subtype=capture negate=
    rx1467_cur."!cursor_pos"(rx1467_pos)
    $P10 = rx1467_cur."sigil"()
    unless $P10, rx1467_fail
    rx1467_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx1467_pos = $P10."pos"()
  # rx rxquantr1470 ** 0..1
    set_addr $I10, rxquantr1470_done
    rx1467_cur."!mark_push"(0, rx1467_pos, $I10)
  rxquantr1470_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx1467_cur."!cursor_pos"(rx1467_pos)
    $P10 = rx1467_cur."twigil"()
    unless $P10, rx1467_fail
    goto rxsubrule1471_pass
  rxsubrule1471_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1467_fail
  rxsubrule1471_pass:
    set_addr $I10, rxsubrule1471_back
    rx1467_cur."!mark_push"(0, rx1467_pos, $I10, $P10)
    $P10."!cursor_names"("twigil")
    rx1467_pos = $P10."pos"()
    set_addr $I10, rxquantr1470_done
    (rx1467_rep) = rx1467_cur."!mark_commit"($I10)
  rxquantr1470_done:
  alt1472_0:
.annotate 'line', 338
    set_addr $I10, alt1472_1
    rx1467_cur."!mark_push"(0, rx1467_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx1467_cur."!cursor_pos"(rx1467_pos)
    $P10 = rx1467_cur."ident"()
    unless $P10, rx1467_fail
    rx1467_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx1467_pos = $P10."pos"()
    goto alt1472_end
  alt1472_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_1473_fail
    rx1467_cur."!mark_push"(0, rx1467_pos, $I10)
  # rx enumcharlist negate=0
    ge rx1467_pos, rx1467_eos, rx1467_fail
    sub $I10, rx1467_pos, rx1467_off
    substr $S10, rx1467_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx1467_fail
    inc rx1467_pos
    set_addr $I10, rxcap_1473_fail
    ($I12, $I11) = rx1467_cur."!mark_peek"($I10)
    rx1467_cur."!cursor_pos"($I11)
    ($P10) = rx1467_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1467_pos, "")
    rx1467_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_1473_done
  rxcap_1473_fail:
    goto rx1467_fail
  rxcap_1473_done:
  alt1472_end:
.annotate 'line', 336
  # rx pass
    rx1467_cur."!cursor_pass"(rx1467_pos, "param_var")
    if_null rx1467_debug, debug_687
    rx1467_cur."!cursor_debug"("PASS", "param_var", " at pos=", rx1467_pos)
  debug_687:
    .return (rx1467_cur)
  rx1467_restart:
.annotate 'line', 4
    if_null rx1467_debug, debug_688
    rx1467_cur."!cursor_debug"("NEXT", "param_var")
  debug_688:
  rx1467_fail:
    (rx1467_rep, rx1467_pos, $I10, $P10) = rx1467_cur."!mark_fail"(0)
    lt rx1467_pos, -1, rx1467_done
    eq rx1467_pos, -1, rx1467_fail
    jump $I10
  rx1467_done:
    rx1467_cur."!cursor_fail"()
    if_null rx1467_debug, debug_689
    rx1467_cur."!cursor_debug"("FAIL", "param_var")
  debug_689:
    .return (rx1467_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("175_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("sigil", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("176_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1475_tgt
    .local int rx1475_pos
    .local int rx1475_off
    .local int rx1475_eos
    .local int rx1475_rep
    .local pmc rx1475_cur
    .local pmc rx1475_debug
    (rx1475_cur, rx1475_pos, rx1475_tgt, $I10) = self."!cursor_start"()
    getattribute rx1475_debug, rx1475_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1475_cur
    .local pmc match
    .lex "$/", match
    length rx1475_eos, rx1475_tgt
    gt rx1475_pos, rx1475_eos, rx1475_done
    set rx1475_off, 0
    lt rx1475_pos, 2, rx1475_start
    sub rx1475_off, rx1475_pos, 1
    substr rx1475_tgt, rx1475_tgt, rx1475_off
  rx1475_start:
    eq $I10, 1, rx1475_restart
    if_null rx1475_debug, debug_690
    rx1475_cur."!cursor_debug"("START", "named_param")
  debug_690:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1477_done
    goto rxscan1477_scan
  rxscan1477_loop:
    ($P10) = rx1475_cur."from"()
    inc $P10
    set rx1475_pos, $P10
    ge rx1475_pos, rx1475_eos, rxscan1477_done
  rxscan1477_scan:
    set_addr $I10, rxscan1477_loop
    rx1475_cur."!mark_push"(0, rx1475_pos, $I10)
  rxscan1477_done:
.annotate 'line', 342
  # rx literal  ":"
    add $I11, rx1475_pos, 1
    gt $I11, rx1475_eos, rx1475_fail
    sub $I11, rx1475_pos, rx1475_off
    ord $I11, rx1475_tgt, $I11
    ne $I11, 58, rx1475_fail
    add rx1475_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx1475_cur."!cursor_pos"(rx1475_pos)
    $P10 = rx1475_cur."param_var"()
    unless $P10, rx1475_fail
    rx1475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx1475_pos = $P10."pos"()
.annotate 'line', 341
  # rx pass
    rx1475_cur."!cursor_pass"(rx1475_pos, "named_param")
    if_null rx1475_debug, debug_691
    rx1475_cur."!cursor_debug"("PASS", "named_param", " at pos=", rx1475_pos)
  debug_691:
    .return (rx1475_cur)
  rx1475_restart:
.annotate 'line', 4
    if_null rx1475_debug, debug_692
    rx1475_cur."!cursor_debug"("NEXT", "named_param")
  debug_692:
  rx1475_fail:
    (rx1475_rep, rx1475_pos, $I10, $P10) = rx1475_cur."!mark_fail"(0)
    lt rx1475_pos, -1, rx1475_done
    eq rx1475_pos, -1, rx1475_fail
    jump $I10
  rx1475_done:
    rx1475_cur."!cursor_fail"()
    if_null rx1475_debug, debug_693
    rx1475_cur."!cursor_debug"("FAIL", "named_param")
  debug_693:
    .return (rx1475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("177_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("param_var", ":")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("178_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1479_tgt
    .local int rx1479_pos
    .local int rx1479_off
    .local int rx1479_eos
    .local int rx1479_rep
    .local pmc rx1479_cur
    .local pmc rx1479_debug
    (rx1479_cur, rx1479_pos, rx1479_tgt, $I10) = self."!cursor_start"()
    getattribute rx1479_debug, rx1479_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1479_cur
    .local pmc match
    .lex "$/", match
    length rx1479_eos, rx1479_tgt
    gt rx1479_pos, rx1479_eos, rx1479_done
    set rx1479_off, 0
    lt rx1479_pos, 2, rx1479_start
    sub rx1479_off, rx1479_pos, 1
    substr rx1479_tgt, rx1479_tgt, rx1479_off
  rx1479_start:
    eq $I10, 1, rx1479_restart
    if_null rx1479_debug, debug_694
    rx1479_cur."!cursor_debug"("START", "default_value")
  debug_694:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1481_done
    goto rxscan1481_scan
  rxscan1481_loop:
    ($P10) = rx1479_cur."from"()
    inc $P10
    set rx1479_pos, $P10
    ge rx1479_pos, rx1479_eos, rxscan1481_done
  rxscan1481_scan:
    set_addr $I10, rxscan1481_loop
    rx1479_cur."!mark_push"(0, rx1479_pos, $I10)
  rxscan1481_done:
.annotate 'line', 345
  # rx subrule "ws" subtype=method negate=
    rx1479_cur."!cursor_pos"(rx1479_pos)
    $P10 = rx1479_cur."ws"()
    unless $P10, rx1479_fail
    rx1479_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx1479_pos, 1
    gt $I11, rx1479_eos, rx1479_fail
    sub $I11, rx1479_pos, rx1479_off
    ord $I11, rx1479_tgt, $I11
    ne $I11, 61, rx1479_fail
    add rx1479_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1479_cur."!cursor_pos"(rx1479_pos)
    $P10 = rx1479_cur."ws"()
    unless $P10, rx1479_fail
    rx1479_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1479_cur."!cursor_pos"(rx1479_pos)
    $P10 = rx1479_cur."EXPR"("i=")
    unless $P10, rx1479_fail
    rx1479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1479_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1479_cur."!cursor_pos"(rx1479_pos)
    $P10 = rx1479_cur."ws"()
    unless $P10, rx1479_fail
    rx1479_pos = $P10."pos"()
  # rx pass
    rx1479_cur."!cursor_pass"(rx1479_pos, "default_value")
    if_null rx1479_debug, debug_695
    rx1479_cur."!cursor_debug"("PASS", "default_value", " at pos=", rx1479_pos)
  debug_695:
    .return (rx1479_cur)
  rx1479_restart:
.annotate 'line', 4
    if_null rx1479_debug, debug_696
    rx1479_cur."!cursor_debug"("NEXT", "default_value")
  debug_696:
  rx1479_fail:
    (rx1479_rep, rx1479_pos, $I10, $P10) = rx1479_cur."!mark_fail"(0)
    lt rx1479_pos, -1, rx1479_done
    eq rx1479_pos, -1, rx1479_fail
    jump $I10
  rx1479_done:
    rx1479_cur."!cursor_fail"()
    if_null rx1479_debug, debug_697
    rx1479_cur."!cursor_debug"("FAIL", "default_value")
  debug_697:
    .return (rx1479_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("179_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "trait"  :subid("180_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1483_tgt
    .local int rx1483_pos
    .local int rx1483_off
    .local int rx1483_eos
    .local int rx1483_rep
    .local pmc rx1483_cur
    .local pmc rx1483_debug
    (rx1483_cur, rx1483_pos, rx1483_tgt, $I10) = self."!cursor_start"()
    getattribute rx1483_debug, rx1483_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1483_cur
    .local pmc match
    .lex "$/", match
    length rx1483_eos, rx1483_tgt
    gt rx1483_pos, rx1483_eos, rx1483_done
    set rx1483_off, 0
    lt rx1483_pos, 2, rx1483_start
    sub rx1483_off, rx1483_pos, 1
    substr rx1483_tgt, rx1483_tgt, rx1483_off
  rx1483_start:
    eq $I10, 1, rx1483_restart
    if_null rx1483_debug, debug_698
    rx1483_cur."!cursor_debug"("START", "trait")
  debug_698:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1485_done
    goto rxscan1485_scan
  rxscan1485_loop:
    ($P10) = rx1483_cur."from"()
    inc $P10
    set rx1483_pos, $P10
    ge rx1483_pos, rx1483_eos, rxscan1485_done
  rxscan1485_scan:
    set_addr $I10, rxscan1485_loop
    rx1483_cur."!mark_push"(0, rx1483_pos, $I10)
  rxscan1485_done:
.annotate 'line', 347
  # rx subrule "ws" subtype=method negate=
    rx1483_cur."!cursor_pos"(rx1483_pos)
    $P10 = rx1483_cur."ws"()
    unless $P10, rx1483_fail
    rx1483_pos = $P10."pos"()
  # rx subrule "trait_mod" subtype=capture negate=
    rx1483_cur."!cursor_pos"(rx1483_pos)
    $P10 = rx1483_cur."trait_mod"()
    unless $P10, rx1483_fail
    rx1483_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("trait_mod")
    rx1483_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1483_cur."!cursor_pos"(rx1483_pos)
    $P10 = rx1483_cur."ws"()
    unless $P10, rx1483_fail
    rx1483_pos = $P10."pos"()
  # rx pass
    rx1483_cur."!cursor_pass"(rx1483_pos, "trait")
    if_null rx1483_debug, debug_699
    rx1483_cur."!cursor_debug"("PASS", "trait", " at pos=", rx1483_pos)
  debug_699:
    .return (rx1483_cur)
  rx1483_restart:
.annotate 'line', 4
    if_null rx1483_debug, debug_700
    rx1483_cur."!cursor_debug"("NEXT", "trait")
  debug_700:
  rx1483_fail:
    (rx1483_rep, rx1483_pos, $I10, $P10) = rx1483_cur."!mark_fail"(0)
    lt rx1483_pos, -1, rx1483_done
    eq rx1483_pos, -1, rx1483_fail
    jump $I10
  rx1483_done:
    rx1483_cur."!cursor_fail"()
    if_null rx1483_debug, debug_701
    rx1483_cur."!cursor_debug"("FAIL", "trait")
  debug_701:
    .return (rx1483_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait"  :subid("181_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod"  :subid("182_1309998847.42912") :method
.annotate 'line', 349
    $P100 = self."!protoregex"("trait_mod")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait_mod"  :subid("183_1309998847.42912") :method
.annotate 'line', 349
    $P101 = self."!PREFIX__!protoregex"("trait_mod")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "trait_mod:sym<is>"  :subid("184_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1489_tgt
    .local int rx1489_pos
    .local int rx1489_off
    .local int rx1489_eos
    .local int rx1489_rep
    .local pmc rx1489_cur
    .local pmc rx1489_debug
    (rx1489_cur, rx1489_pos, rx1489_tgt, $I10) = self."!cursor_start"()
    rx1489_cur."!cursor_caparray"("circumfix")
    getattribute rx1489_debug, rx1489_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1489_cur
    .local pmc match
    .lex "$/", match
    length rx1489_eos, rx1489_tgt
    gt rx1489_pos, rx1489_eos, rx1489_done
    set rx1489_off, 0
    lt rx1489_pos, 2, rx1489_start
    sub rx1489_off, rx1489_pos, 1
    substr rx1489_tgt, rx1489_tgt, rx1489_off
  rx1489_start:
    eq $I10, 1, rx1489_restart
    if_null rx1489_debug, debug_702
    rx1489_cur."!cursor_debug"("START", "trait_mod:sym<is>")
  debug_702:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1491_done
    goto rxscan1491_scan
  rxscan1491_loop:
    ($P10) = rx1489_cur."from"()
    inc $P10
    set rx1489_pos, $P10
    ge rx1489_pos, rx1489_eos, rxscan1491_done
  rxscan1491_scan:
    set_addr $I10, rxscan1491_loop
    rx1489_cur."!mark_push"(0, rx1489_pos, $I10)
  rxscan1491_done:
.annotate 'line', 350
  # rx subcapture "sym"
    set_addr $I10, rxcap_1492_fail
    rx1489_cur."!mark_push"(0, rx1489_pos, $I10)
  # rx literal  "is"
    add $I11, rx1489_pos, 2
    gt $I11, rx1489_eos, rx1489_fail
    sub $I11, rx1489_pos, rx1489_off
    substr $S10, rx1489_tgt, $I11, 2
    ne $S10, "is", rx1489_fail
    add rx1489_pos, 2
    set_addr $I10, rxcap_1492_fail
    ($I12, $I11) = rx1489_cur."!mark_peek"($I10)
    rx1489_cur."!cursor_pos"($I11)
    ($P10) = rx1489_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1489_pos, "")
    rx1489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1492_done
  rxcap_1492_fail:
    goto rx1489_fail
  rxcap_1492_done:
  # rx subrule "ws" subtype=method negate=
    rx1489_cur."!cursor_pos"(rx1489_pos)
    $P10 = rx1489_cur."ws"()
    unless $P10, rx1489_fail
    rx1489_pos = $P10."pos"()
  # rx subrule "deflongname" subtype=capture negate=
    rx1489_cur."!cursor_pos"(rx1489_pos)
    $P10 = rx1489_cur."deflongname"()
    unless $P10, rx1489_fail
    rx1489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1489_pos = $P10."pos"()
  # rx rxquantr1493 ** 0..1
    set_addr $I10, rxquantr1493_done
    rx1489_cur."!mark_push"(0, rx1489_pos, $I10)
  rxquantr1493_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx1489_cur."!cursor_pos"(rx1489_pos)
    $P10 = rx1489_cur."circumfix"()
    unless $P10, rx1489_fail
    goto rxsubrule1494_pass
  rxsubrule1494_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1489_fail
  rxsubrule1494_pass:
    set_addr $I10, rxsubrule1494_back
    rx1489_cur."!mark_push"(0, rx1489_pos, $I10, $P10)
    $P10."!cursor_names"("circumfix")
    rx1489_pos = $P10."pos"()
    set_addr $I10, rxquantr1493_done
    (rx1489_rep) = rx1489_cur."!mark_commit"($I10)
  rxquantr1493_done:
  # rx subrule "ws" subtype=method negate=
    rx1489_cur."!cursor_pos"(rx1489_pos)
    $P10 = rx1489_cur."ws"()
    unless $P10, rx1489_fail
    rx1489_pos = $P10."pos"()
  # rx pass
    rx1489_cur."!cursor_pass"(rx1489_pos, "trait_mod:sym<is>")
    if_null rx1489_debug, debug_703
    rx1489_cur."!cursor_debug"("PASS", "trait_mod:sym<is>", " at pos=", rx1489_pos)
  debug_703:
    .return (rx1489_cur)
  rx1489_restart:
.annotate 'line', 4
    if_null rx1489_debug, debug_704
    rx1489_cur."!cursor_debug"("NEXT", "trait_mod:sym<is>")
  debug_704:
  rx1489_fail:
    (rx1489_rep, rx1489_pos, $I10, $P10) = rx1489_cur."!mark_fail"(0)
    lt rx1489_pos, -1, rx1489_done
    eq rx1489_pos, -1, rx1489_fail
    jump $I10
  rx1489_done:
    rx1489_cur."!cursor_fail"()
    if_null rx1489_debug, debug_705
    rx1489_cur."!cursor_debug"("FAIL", "trait_mod:sym<is>")
  debug_705:
    .return (rx1489_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__trait_mod:sym<is>"  :subid("185_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "is")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("186_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1496_tgt
    .local int rx1496_pos
    .local int rx1496_off
    .local int rx1496_eos
    .local int rx1496_rep
    .local pmc rx1496_cur
    .local pmc rx1496_debug
    (rx1496_cur, rx1496_pos, rx1496_tgt, $I10) = self."!cursor_start"()
    rx1496_cur."!cursor_caparray"("signature")
    getattribute rx1496_debug, rx1496_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1496_cur
    .local pmc match
    .lex "$/", match
    length rx1496_eos, rx1496_tgt
    gt rx1496_pos, rx1496_eos, rx1496_done
    set rx1496_off, 0
    lt rx1496_pos, 2, rx1496_start
    sub rx1496_off, rx1496_pos, 1
    substr rx1496_tgt, rx1496_tgt, rx1496_off
  rx1496_start:
    eq $I10, 1, rx1496_restart
    if_null rx1496_debug, debug_706
    rx1496_cur."!cursor_debug"("START", "regex_declarator")
  debug_706:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1498_done
    goto rxscan1498_scan
  rxscan1498_loop:
    ($P10) = rx1496_cur."from"()
    inc $P10
    set rx1496_pos, $P10
    ge rx1496_pos, rx1496_eos, rxscan1498_done
  rxscan1498_scan:
    set_addr $I10, rxscan1498_loop
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  rxscan1498_done:
.annotate 'line', 352
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  alt1499_0:
.annotate 'line', 353
    set_addr $I10, alt1499_1
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
.annotate 'line', 354
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_1500_fail
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  # rx literal  "proto"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "proto", rx1496_fail
    add rx1496_pos, 5
    set_addr $I10, rxcap_1500_fail
    ($I12, $I11) = rx1496_cur."!mark_peek"($I10)
    rx1496_cur."!cursor_pos"($I11)
    ($P10) = rx1496_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1496_pos, "")
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_1500_done
  rxcap_1500_fail:
    goto rx1496_fail
  rxcap_1500_done:
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  alt1501_0:
    set_addr $I10, alt1501_1
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  # rx literal  "regex"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "regex", rx1496_fail
    add rx1496_pos, 5
    goto alt1501_end
  alt1501_1:
    set_addr $I10, alt1501_2
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  # rx literal  "token"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "token", rx1496_fail
    add rx1496_pos, 5
    goto alt1501_end
  alt1501_2:
  # rx literal  "rule"
    add $I11, rx1496_pos, 4
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 4
    ne $S10, "rule", rx1496_fail
    add rx1496_pos, 4
  alt1501_end:
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 355
  # rx subrule "deflongname" subtype=capture negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."deflongname"()
    unless $P10, rx1496_fail
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx1496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  alt1502_0:
.annotate 'line', 356
    set_addr $I10, alt1502_1
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
.annotate 'line', 357
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 123, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "<...>", rx1496_fail
    add rx1496_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 125, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ENDSTMT"()
    unless $P10, rx1496_fail
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
    goto alt1502_end
  alt1502_1:
    set_addr $I10, alt1502_2
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
.annotate 'line', 358
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 123, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "<*>"
    add $I11, rx1496_pos, 3
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 3
    ne $S10, "<*>", rx1496_fail
    add rx1496_pos, 3
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 125, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ENDSTMT"()
    unless $P10, rx1496_fail
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
    goto alt1502_end
  alt1502_2:
.annotate 'line', 359
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."panic"("Proto regex body must be <*> (or <...>, which is deprecated)")
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  alt1502_end:
.annotate 'line', 360
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 354
    goto alt1499_end
  alt1499_1:
.annotate 'line', 361
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_1504_fail
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  alt1503_0:
    set_addr $I10, alt1503_1
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  # rx literal  "regex"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "regex", rx1496_fail
    add rx1496_pos, 5
    goto alt1503_end
  alt1503_1:
    set_addr $I10, alt1503_2
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  # rx literal  "token"
    add $I11, rx1496_pos, 5
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 5
    ne $S10, "token", rx1496_fail
    add rx1496_pos, 5
    goto alt1503_end
  alt1503_2:
  # rx literal  "rule"
    add $I11, rx1496_pos, 4
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    substr $S10, rx1496_tgt, $I11, 4
    ne $S10, "rule", rx1496_fail
    add rx1496_pos, 4
  alt1503_end:
    set_addr $I10, rxcap_1504_fail
    ($I12, $I11) = rx1496_cur."!mark_peek"($I10)
    rx1496_cur."!cursor_pos"($I11)
    ($P10) = rx1496_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1496_pos, "")
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1504_done
  rxcap_1504_fail:
    goto rx1496_fail
  rxcap_1504_done:
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 362
  # rx subrule "deflongname" subtype=capture negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."deflongname"()
    unless $P10, rx1496_fail
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx1496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 363
  # rx subrule "newpad" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."newpad"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 364
  # rx rxquantr1505 ** 0..1
    set_addr $I10, rxquantr1505_done
    rx1496_cur."!mark_push"(0, rx1496_pos, $I10)
  rxquantr1505_loop:
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 40, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."signature"()
    unless $P10, rx1496_fail
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx1496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 41, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
    set_addr $I10, rxquantr1505_done
    (rx1496_rep) = rx1496_cur."!mark_commit"($I10)
  rxquantr1505_done:
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 365
  # rx reduce name="regex_declarator" key="open"
    rx1496_cur."!cursor_pos"(rx1496_pos)
    rx1496_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 366
  # rx literal  "{"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 123, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."LANG"("Regex", "nibbler")
    unless $P10, rx1496_fail
    rx1496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx1496_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1496_pos, 1
    gt $I11, rx1496_eos, rx1496_fail
    sub $I11, rx1496_pos, rx1496_off
    ord $I11, rx1496_tgt, $I11
    ne $I11, 125, rx1496_fail
    add rx1496_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ENDSTMT"()
    unless $P10, rx1496_fail
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
  alt1499_end:
.annotate 'line', 367
  # rx subrule "ws" subtype=method negate=
    rx1496_cur."!cursor_pos"(rx1496_pos)
    $P10 = rx1496_cur."ws"()
    unless $P10, rx1496_fail
    rx1496_pos = $P10."pos"()
.annotate 'line', 352
  # rx pass
    rx1496_cur."!cursor_pass"(rx1496_pos, "regex_declarator")
    if_null rx1496_debug, debug_707
    rx1496_cur."!cursor_debug"("PASS", "regex_declarator", " at pos=", rx1496_pos)
  debug_707:
    .return (rx1496_cur)
  rx1496_restart:
.annotate 'line', 4
    if_null rx1496_debug, debug_708
    rx1496_cur."!cursor_debug"("NEXT", "regex_declarator")
  debug_708:
  rx1496_fail:
    (rx1496_rep, rx1496_pos, $I10, $P10) = rx1496_cur."!mark_fail"(0)
    lt rx1496_pos, -1, rx1496_done
    eq rx1496_pos, -1, rx1496_fail
    jump $I10
  rx1496_done:
    rx1496_cur."!cursor_fail"()
    if_null rx1496_debug, debug_709
    rx1496_cur."!cursor_debug"("FAIL", "regex_declarator")
  debug_709:
    .return (rx1496_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("187_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("188_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1507_tgt
    .local int rx1507_pos
    .local int rx1507_off
    .local int rx1507_eos
    .local int rx1507_rep
    .local pmc rx1507_cur
    .local pmc rx1507_debug
    (rx1507_cur, rx1507_pos, rx1507_tgt, $I10) = self."!cursor_start"()
    rx1507_cur."!cursor_caparray"("args")
    getattribute rx1507_debug, rx1507_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1507_cur
    .local pmc match
    .lex "$/", match
    length rx1507_eos, rx1507_tgt
    gt rx1507_pos, rx1507_eos, rx1507_done
    set rx1507_off, 0
    lt rx1507_pos, 2, rx1507_start
    sub rx1507_off, rx1507_pos, 1
    substr rx1507_tgt, rx1507_tgt, rx1507_off
  rx1507_start:
    eq $I10, 1, rx1507_restart
    if_null rx1507_debug, debug_710
    rx1507_cur."!cursor_debug"("START", "dotty")
  debug_710:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1509_done
    goto rxscan1509_scan
  rxscan1509_loop:
    ($P10) = rx1507_cur."from"()
    inc $P10
    set rx1507_pos, $P10
    ge rx1507_pos, rx1507_eos, rxscan1509_done
  rxscan1509_scan:
    set_addr $I10, rxscan1509_loop
    rx1507_cur."!mark_push"(0, rx1507_pos, $I10)
  rxscan1509_done:
.annotate 'line', 371
  # rx literal  "."
    add $I11, rx1507_pos, 1
    gt $I11, rx1507_eos, rx1507_fail
    sub $I11, rx1507_pos, rx1507_off
    ord $I11, rx1507_tgt, $I11
    ne $I11, 46, rx1507_fail
    add rx1507_pos, 1
  alt1510_0:
.annotate 'line', 372
    set_addr $I10, alt1510_1
    rx1507_cur."!mark_push"(0, rx1507_pos, $I10)
  # rx subrule "deflongname" subtype=capture negate=
    rx1507_cur."!cursor_pos"(rx1507_pos)
    $P10 = rx1507_cur."deflongname"()
    unless $P10, rx1507_fail
    rx1507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=deflongname")
    rx1507_pos = $P10."pos"()
    goto alt1510_end
  alt1510_1:
.annotate 'line', 373
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1507_pos, rx1507_off
    substr $S10, rx1507_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx1507_fail
  # rx subrule "quote" subtype=capture negate=
    rx1507_cur."!cursor_pos"(rx1507_pos)
    $P10 = rx1507_cur."quote"()
    unless $P10, rx1507_fail
    rx1507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx1507_pos = $P10."pos"()
  alt1511_0:
.annotate 'line', 374
    set_addr $I10, alt1511_1
    rx1507_cur."!mark_push"(0, rx1507_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1507_pos, rx1507_off
    substr $S10, rx1507_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx1507_fail
    goto alt1511_end
  alt1511_1:
  # rx subrule "panic" subtype=method negate=
    rx1507_cur."!cursor_pos"(rx1507_pos)
    $P10 = rx1507_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx1507_fail
    rx1507_pos = $P10."pos"()
  alt1511_end:
  alt1510_end:
.annotate 'line', 380
  # rx rxquantr1512 ** 0..1
    set_addr $I10, rxquantr1512_done
    rx1507_cur."!mark_push"(0, rx1507_pos, $I10)
  rxquantr1512_loop:
  alt1513_0:
.annotate 'line', 377
    set_addr $I10, alt1513_1
    rx1507_cur."!mark_push"(0, rx1507_pos, $I10)
.annotate 'line', 378
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1507_pos, rx1507_off
    substr $S10, rx1507_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx1507_fail
  # rx subrule "args" subtype=capture negate=
    rx1507_cur."!cursor_pos"(rx1507_pos)
    $P10 = rx1507_cur."args"()
    unless $P10, rx1507_fail
    rx1507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx1507_pos = $P10."pos"()
    goto alt1513_end
  alt1513_1:
.annotate 'line', 379
  # rx literal  ":"
    add $I11, rx1507_pos, 1
    gt $I11, rx1507_eos, rx1507_fail
    sub $I11, rx1507_pos, rx1507_off
    ord $I11, rx1507_tgt, $I11
    ne $I11, 58, rx1507_fail
    add rx1507_pos, 1
  # rx charclass s
    ge rx1507_pos, rx1507_eos, rx1507_fail
    sub $I10, rx1507_pos, rx1507_off
    is_cclass $I11, 32, rx1507_tgt, $I10
    unless $I11, rx1507_fail
    inc rx1507_pos
  # rx subrule "arglist" subtype=capture negate=
    rx1507_cur."!cursor_pos"(rx1507_pos)
    $P10 = rx1507_cur."arglist"()
    unless $P10, rx1507_fail
    rx1507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx1507_pos = $P10."pos"()
  alt1513_end:
.annotate 'line', 380
    set_addr $I10, rxquantr1512_done
    (rx1507_rep) = rx1507_cur."!mark_commit"($I10)
  rxquantr1512_done:
.annotate 'line', 370
  # rx pass
    rx1507_cur."!cursor_pass"(rx1507_pos, "dotty")
    if_null rx1507_debug, debug_711
    rx1507_cur."!cursor_debug"("PASS", "dotty", " at pos=", rx1507_pos)
  debug_711:
    .return (rx1507_cur)
  rx1507_restart:
.annotate 'line', 4
    if_null rx1507_debug, debug_712
    rx1507_cur."!cursor_debug"("NEXT", "dotty")
  debug_712:
  rx1507_fail:
    (rx1507_rep, rx1507_pos, $I10, $P10) = rx1507_cur."!mark_fail"(0)
    lt rx1507_pos, -1, rx1507_done
    eq rx1507_pos, -1, rx1507_fail
    jump $I10
  rx1507_done:
    rx1507_cur."!cursor_fail"()
    if_null rx1507_debug, debug_713
    rx1507_cur."!cursor_debug"("FAIL", "dotty")
  debug_713:
    .return (rx1507_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("189_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("deflongname", ".")
    new $P101, "ResizablePMCArray"
    push $P101, "'"
    push $P101, "\""
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("190_1309998847.42912") :method
.annotate 'line', 384
    $P100 = self."!protoregex"("term")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("191_1309998847.42912") :method
.annotate 'line', 384
    $P101 = self."!PREFIX__!protoregex"("term")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("192_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1517_tgt
    .local int rx1517_pos
    .local int rx1517_off
    .local int rx1517_eos
    .local int rx1517_rep
    .local pmc rx1517_cur
    .local pmc rx1517_debug
    (rx1517_cur, rx1517_pos, rx1517_tgt, $I10) = self."!cursor_start"()
    getattribute rx1517_debug, rx1517_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1517_cur
    .local pmc match
    .lex "$/", match
    length rx1517_eos, rx1517_tgt
    gt rx1517_pos, rx1517_eos, rx1517_done
    set rx1517_off, 0
    lt rx1517_pos, 2, rx1517_start
    sub rx1517_off, rx1517_pos, 1
    substr rx1517_tgt, rx1517_tgt, rx1517_off
  rx1517_start:
    eq $I10, 1, rx1517_restart
    if_null rx1517_debug, debug_714
    rx1517_cur."!cursor_debug"("START", "term:sym<self>")
  debug_714:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1519_done
    goto rxscan1519_scan
  rxscan1519_loop:
    ($P10) = rx1517_cur."from"()
    inc $P10
    set rx1517_pos, $P10
    ge rx1517_pos, rx1517_eos, rxscan1519_done
  rxscan1519_scan:
    set_addr $I10, rxscan1519_loop
    rx1517_cur."!mark_push"(0, rx1517_pos, $I10)
  rxscan1519_done:
.annotate 'line', 386
  # rx subcapture "sym"
    set_addr $I10, rxcap_1520_fail
    rx1517_cur."!mark_push"(0, rx1517_pos, $I10)
  # rx literal  "self"
    add $I11, rx1517_pos, 4
    gt $I11, rx1517_eos, rx1517_fail
    sub $I11, rx1517_pos, rx1517_off
    substr $S10, rx1517_tgt, $I11, 4
    ne $S10, "self", rx1517_fail
    add rx1517_pos, 4
    set_addr $I10, rxcap_1520_fail
    ($I12, $I11) = rx1517_cur."!mark_peek"($I10)
    rx1517_cur."!cursor_pos"($I11)
    ($P10) = rx1517_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1517_pos, "")
    rx1517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1520_done
  rxcap_1520_fail:
    goto rx1517_fail
  rxcap_1520_done:
  # rxanchor rwb
    le rx1517_pos, 0, rx1517_fail
    sub $I10, rx1517_pos, rx1517_off
    is_cclass $I11, 8192, rx1517_tgt, $I10
    if $I11, rx1517_fail
    dec $I10
    is_cclass $I11, 8192, rx1517_tgt, $I10
    unless $I11, rx1517_fail
  # rx pass
    rx1517_cur."!cursor_pass"(rx1517_pos, "term:sym<self>")
    if_null rx1517_debug, debug_715
    rx1517_cur."!cursor_debug"("PASS", "term:sym<self>", " at pos=", rx1517_pos)
  debug_715:
    .return (rx1517_cur)
  rx1517_restart:
.annotate 'line', 4
    if_null rx1517_debug, debug_716
    rx1517_cur."!cursor_debug"("NEXT", "term:sym<self>")
  debug_716:
  rx1517_fail:
    (rx1517_rep, rx1517_pos, $I10, $P10) = rx1517_cur."!mark_fail"(0)
    lt rx1517_pos, -1, rx1517_done
    eq rx1517_pos, -1, rx1517_fail
    jump $I10
  rx1517_done:
    rx1517_cur."!cursor_fail"()
    if_null rx1517_debug, debug_717
    rx1517_cur."!cursor_debug"("FAIL", "term:sym<self>")
  debug_717:
    .return (rx1517_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("193_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "self"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("194_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1522_tgt
    .local int rx1522_pos
    .local int rx1522_off
    .local int rx1522_eos
    .local int rx1522_rep
    .local pmc rx1522_cur
    .local pmc rx1522_debug
    (rx1522_cur, rx1522_pos, rx1522_tgt, $I10) = self."!cursor_start"()
    getattribute rx1522_debug, rx1522_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1522_cur
    .local pmc match
    .lex "$/", match
    length rx1522_eos, rx1522_tgt
    gt rx1522_pos, rx1522_eos, rx1522_done
    set rx1522_off, 0
    lt rx1522_pos, 2, rx1522_start
    sub rx1522_off, rx1522_pos, 1
    substr rx1522_tgt, rx1522_tgt, rx1522_off
  rx1522_start:
    eq $I10, 1, rx1522_restart
    if_null rx1522_debug, debug_718
    rx1522_cur."!cursor_debug"("START", "term:sym<identifier>")
  debug_718:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1524_done
    goto rxscan1524_scan
  rxscan1524_loop:
    ($P10) = rx1522_cur."from"()
    inc $P10
    set rx1522_pos, $P10
    ge rx1522_pos, rx1522_eos, rxscan1524_done
  rxscan1524_scan:
    set_addr $I10, rxscan1524_loop
    rx1522_cur."!mark_push"(0, rx1522_pos, $I10)
  rxscan1524_done:
.annotate 'line', 389
  # rx subrule "deflongname" subtype=capture negate=
    rx1522_cur."!cursor_pos"(rx1522_pos)
    $P10 = rx1522_cur."deflongname"()
    unless $P10, rx1522_fail
    rx1522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx1522_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1522_pos, rx1522_off
    substr $S10, rx1522_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx1522_fail
  # rx subrule "args" subtype=capture negate=
    rx1522_cur."!cursor_pos"(rx1522_pos)
    $P10 = rx1522_cur."args"()
    unless $P10, rx1522_fail
    rx1522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx1522_pos = $P10."pos"()
.annotate 'line', 388
  # rx pass
    rx1522_cur."!cursor_pass"(rx1522_pos, "term:sym<identifier>")
    if_null rx1522_debug, debug_719
    rx1522_cur."!cursor_debug"("PASS", "term:sym<identifier>", " at pos=", rx1522_pos)
  debug_719:
    .return (rx1522_cur)
  rx1522_restart:
.annotate 'line', 4
    if_null rx1522_debug, debug_720
    rx1522_cur."!cursor_debug"("NEXT", "term:sym<identifier>")
  debug_720:
  rx1522_fail:
    (rx1522_rep, rx1522_pos, $I10, $P10) = rx1522_cur."!mark_fail"(0)
    lt rx1522_pos, -1, rx1522_done
    eq rx1522_pos, -1, rx1522_fail
    jump $I10
  rx1522_done:
    rx1522_cur."!cursor_fail"()
    if_null rx1522_debug, debug_721
    rx1522_cur."!cursor_debug"("FAIL", "term:sym<identifier>")
  debug_721:
    .return (rx1522_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("195_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("deflongname", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("196_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1526_tgt
    .local int rx1526_pos
    .local int rx1526_off
    .local int rx1526_eos
    .local int rx1526_rep
    .local pmc rx1526_cur
    .local pmc rx1526_debug
    (rx1526_cur, rx1526_pos, rx1526_tgt, $I10) = self."!cursor_start"()
    rx1526_cur."!cursor_caparray"("args")
    getattribute rx1526_debug, rx1526_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1526_cur
    .local pmc match
    .lex "$/", match
    length rx1526_eos, rx1526_tgt
    gt rx1526_pos, rx1526_eos, rx1526_done
    set rx1526_off, 0
    lt rx1526_pos, 2, rx1526_start
    sub rx1526_off, rx1526_pos, 1
    substr rx1526_tgt, rx1526_tgt, rx1526_off
  rx1526_start:
    eq $I10, 1, rx1526_restart
    if_null rx1526_debug, debug_722
    rx1526_cur."!cursor_debug"("START", "term:sym<name>")
  debug_722:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1528_done
    goto rxscan1528_scan
  rxscan1528_loop:
    ($P10) = rx1526_cur."from"()
    inc $P10
    set rx1526_pos, $P10
    ge rx1526_pos, rx1526_eos, rxscan1528_done
  rxscan1528_scan:
    set_addr $I10, rxscan1528_loop
    rx1526_cur."!mark_push"(0, rx1526_pos, $I10)
  rxscan1528_done:
.annotate 'line', 393
  # rx subrule "name" subtype=capture negate=
    rx1526_cur."!cursor_pos"(rx1526_pos)
    $P10 = rx1526_cur."name"()
    unless $P10, rx1526_fail
    rx1526_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx1526_pos = $P10."pos"()
  # rx rxquantr1529 ** 0..1
    set_addr $I10, rxquantr1529_done
    rx1526_cur."!mark_push"(0, rx1526_pos, $I10)
  rxquantr1529_loop:
  # rx subrule "args" subtype=capture negate=
    rx1526_cur."!cursor_pos"(rx1526_pos)
    $P10 = rx1526_cur."args"()
    unless $P10, rx1526_fail
    goto rxsubrule1530_pass
  rxsubrule1530_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1526_fail
  rxsubrule1530_pass:
    set_addr $I10, rxsubrule1530_back
    rx1526_cur."!mark_push"(0, rx1526_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx1526_pos = $P10."pos"()
    set_addr $I10, rxquantr1529_done
    (rx1526_rep) = rx1526_cur."!mark_commit"($I10)
  rxquantr1529_done:
.annotate 'line', 392
  # rx pass
    rx1526_cur."!cursor_pass"(rx1526_pos, "term:sym<name>")
    if_null rx1526_debug, debug_723
    rx1526_cur."!cursor_debug"("PASS", "term:sym<name>", " at pos=", rx1526_pos)
  debug_723:
    .return (rx1526_cur)
  rx1526_restart:
.annotate 'line', 4
    if_null rx1526_debug, debug_724
    rx1526_cur."!cursor_debug"("NEXT", "term:sym<name>")
  debug_724:
  rx1526_fail:
    (rx1526_rep, rx1526_pos, $I10, $P10) = rx1526_cur."!mark_fail"(0)
    lt rx1526_pos, -1, rx1526_done
    eq rx1526_pos, -1, rx1526_fail
    jump $I10
  rx1526_done:
    rx1526_cur."!cursor_fail"()
    if_null rx1526_debug, debug_725
    rx1526_cur."!cursor_debug"("FAIL", "term:sym<name>")
  debug_725:
    .return (rx1526_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("197_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("name", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("198_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1532_tgt
    .local int rx1532_pos
    .local int rx1532_off
    .local int rx1532_eos
    .local int rx1532_rep
    .local pmc rx1532_cur
    .local pmc rx1532_debug
    (rx1532_cur, rx1532_pos, rx1532_tgt, $I10) = self."!cursor_start"()
    rx1532_cur."!cursor_caparray"("args")
    getattribute rx1532_debug, rx1532_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1532_cur
    .local pmc match
    .lex "$/", match
    length rx1532_eos, rx1532_tgt
    gt rx1532_pos, rx1532_eos, rx1532_done
    set rx1532_off, 0
    lt rx1532_pos, 2, rx1532_start
    sub rx1532_off, rx1532_pos, 1
    substr rx1532_tgt, rx1532_tgt, rx1532_off
  rx1532_start:
    eq $I10, 1, rx1532_restart
    if_null rx1532_debug, debug_726
    rx1532_cur."!cursor_debug"("START", "term:sym<pir::op>")
  debug_726:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1534_done
    goto rxscan1534_scan
  rxscan1534_loop:
    ($P10) = rx1532_cur."from"()
    inc $P10
    set rx1532_pos, $P10
    ge rx1532_pos, rx1532_eos, rxscan1534_done
  rxscan1534_scan:
    set_addr $I10, rxscan1534_loop
    rx1532_cur."!mark_push"(0, rx1532_pos, $I10)
  rxscan1534_done:
.annotate 'line', 397
  # rx literal  "pir::"
    add $I11, rx1532_pos, 5
    gt $I11, rx1532_eos, rx1532_fail
    sub $I11, rx1532_pos, rx1532_off
    substr $S10, rx1532_tgt, $I11, 5
    ne $S10, "pir::", rx1532_fail
    add rx1532_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_1535_fail
    rx1532_cur."!mark_push"(0, rx1532_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1532_pos, rx1532_off
    find_not_cclass $I11, 8192, rx1532_tgt, $I10, rx1532_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1532_fail
    add rx1532_pos, rx1532_off, $I11
    set_addr $I10, rxcap_1535_fail
    ($I12, $I11) = rx1532_cur."!mark_peek"($I10)
    rx1532_cur."!cursor_pos"($I11)
    ($P10) = rx1532_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1532_pos, "")
    rx1532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_1535_done
  rxcap_1535_fail:
    goto rx1532_fail
  rxcap_1535_done:
  # rx rxquantr1536 ** 0..1
    set_addr $I10, rxquantr1536_done
    rx1532_cur."!mark_push"(0, rx1532_pos, $I10)
  rxquantr1536_loop:
  # rx subrule "args" subtype=capture negate=
    rx1532_cur."!cursor_pos"(rx1532_pos)
    $P10 = rx1532_cur."args"()
    unless $P10, rx1532_fail
    goto rxsubrule1537_pass
  rxsubrule1537_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1532_fail
  rxsubrule1537_pass:
    set_addr $I10, rxsubrule1537_back
    rx1532_cur."!mark_push"(0, rx1532_pos, $I10, $P10)
    $P10."!cursor_names"("args")
    rx1532_pos = $P10."pos"()
    set_addr $I10, rxquantr1536_done
    (rx1532_rep) = rx1532_cur."!mark_commit"($I10)
  rxquantr1536_done:
.annotate 'line', 396
  # rx pass
    rx1532_cur."!cursor_pass"(rx1532_pos, "term:sym<pir::op>")
    if_null rx1532_debug, debug_727
    rx1532_cur."!cursor_debug"("PASS", "term:sym<pir::op>", " at pos=", rx1532_pos)
  debug_727:
    .return (rx1532_cur)
  rx1532_restart:
.annotate 'line', 4
    if_null rx1532_debug, debug_728
    rx1532_cur."!cursor_debug"("NEXT", "term:sym<pir::op>")
  debug_728:
  rx1532_fail:
    (rx1532_rep, rx1532_pos, $I10, $P10) = rx1532_cur."!mark_fail"(0)
    lt rx1532_pos, -1, rx1532_done
    eq rx1532_pos, -1, rx1532_fail
    jump $I10
  rx1532_done:
    rx1532_cur."!cursor_fail"()
    if_null rx1532_debug, debug_729
    rx1532_cur."!cursor_debug"("FAIL", "term:sym<pir::op>")
  debug_729:
    .return (rx1532_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("199_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "pir::"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("200_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1539_tgt
    .local int rx1539_pos
    .local int rx1539_off
    .local int rx1539_eos
    .local int rx1539_rep
    .local pmc rx1539_cur
    .local pmc rx1539_debug
    (rx1539_cur, rx1539_pos, rx1539_tgt, $I10) = self."!cursor_start"()
    getattribute rx1539_debug, rx1539_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1539_cur
    .local pmc match
    .lex "$/", match
    length rx1539_eos, rx1539_tgt
    gt rx1539_pos, rx1539_eos, rx1539_done
    set rx1539_off, 0
    lt rx1539_pos, 2, rx1539_start
    sub rx1539_off, rx1539_pos, 1
    substr rx1539_tgt, rx1539_tgt, rx1539_off
  rx1539_start:
    eq $I10, 1, rx1539_restart
    if_null rx1539_debug, debug_730
    rx1539_cur."!cursor_debug"("START", "args")
  debug_730:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1541_done
    goto rxscan1541_scan
  rxscan1541_loop:
    ($P10) = rx1539_cur."from"()
    inc $P10
    set rx1539_pos, $P10
    ge rx1539_pos, rx1539_eos, rxscan1541_done
  rxscan1541_scan:
    set_addr $I10, rxscan1541_loop
    rx1539_cur."!mark_push"(0, rx1539_pos, $I10)
  rxscan1541_done:
.annotate 'line', 401
  # rx literal  "("
    add $I11, rx1539_pos, 1
    gt $I11, rx1539_eos, rx1539_fail
    sub $I11, rx1539_pos, rx1539_off
    ord $I11, rx1539_tgt, $I11
    ne $I11, 40, rx1539_fail
    add rx1539_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1539_cur."!cursor_pos"(rx1539_pos)
    $P10 = rx1539_cur."arglist"()
    unless $P10, rx1539_fail
    rx1539_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1539_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1539_pos, 1
    gt $I11, rx1539_eos, rx1539_fail
    sub $I11, rx1539_pos, rx1539_off
    ord $I11, rx1539_tgt, $I11
    ne $I11, 41, rx1539_fail
    add rx1539_pos, 1
  # rx pass
    rx1539_cur."!cursor_pass"(rx1539_pos, "args")
    if_null rx1539_debug, debug_731
    rx1539_cur."!cursor_debug"("PASS", "args", " at pos=", rx1539_pos)
  debug_731:
    .return (rx1539_cur)
  rx1539_restart:
.annotate 'line', 4
    if_null rx1539_debug, debug_732
    rx1539_cur."!cursor_debug"("NEXT", "args")
  debug_732:
  rx1539_fail:
    (rx1539_rep, rx1539_pos, $I10, $P10) = rx1539_cur."!mark_fail"(0)
    lt rx1539_pos, -1, rx1539_done
    eq rx1539_pos, -1, rx1539_fail
    jump $I10
  rx1539_done:
    rx1539_cur."!cursor_fail"()
    if_null rx1539_debug, debug_733
    rx1539_cur."!cursor_debug"("FAIL", "args")
  debug_733:
    .return (rx1539_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("201_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("arglist", "(")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("202_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1543_tgt
    .local int rx1543_pos
    .local int rx1543_off
    .local int rx1543_eos
    .local int rx1543_rep
    .local pmc rx1543_cur
    .local pmc rx1543_debug
    (rx1543_cur, rx1543_pos, rx1543_tgt, $I10) = self."!cursor_start"()
    getattribute rx1543_debug, rx1543_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1543_cur
    .local pmc match
    .lex "$/", match
    length rx1543_eos, rx1543_tgt
    gt rx1543_pos, rx1543_eos, rx1543_done
    set rx1543_off, 0
    lt rx1543_pos, 2, rx1543_start
    sub rx1543_off, rx1543_pos, 1
    substr rx1543_tgt, rx1543_tgt, rx1543_off
  rx1543_start:
    eq $I10, 1, rx1543_restart
    if_null rx1543_debug, debug_734
    rx1543_cur."!cursor_debug"("START", "arglist")
  debug_734:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1545_done
    goto rxscan1545_scan
  rxscan1545_loop:
    ($P10) = rx1543_cur."from"()
    inc $P10
    set rx1543_pos, $P10
    ge rx1543_pos, rx1543_eos, rxscan1545_done
  rxscan1545_scan:
    set_addr $I10, rxscan1545_loop
    rx1543_cur."!mark_push"(0, rx1543_pos, $I10)
  rxscan1545_done:
.annotate 'line', 405
  # rx subrule "ws" subtype=method negate=
    rx1543_cur."!cursor_pos"(rx1543_pos)
    $P10 = rx1543_cur."ws"()
    unless $P10, rx1543_fail
    rx1543_pos = $P10."pos"()
  alt1546_0:
.annotate 'line', 406
    set_addr $I10, alt1546_1
    rx1543_cur."!mark_push"(0, rx1543_pos, $I10)
.annotate 'line', 407
  # rx subrule "EXPR" subtype=capture negate=
    rx1543_cur."!cursor_pos"(rx1543_pos)
    $P10 = rx1543_cur."EXPR"("f=")
    unless $P10, rx1543_fail
    rx1543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1543_pos = $P10."pos"()
    goto alt1546_end
  alt1546_1:
  alt1546_end:
.annotate 'line', 404
  # rx pass
    rx1543_cur."!cursor_pass"(rx1543_pos, "arglist")
    if_null rx1543_debug, debug_735
    rx1543_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx1543_pos)
  debug_735:
    .return (rx1543_cur)
  rx1543_restart:
.annotate 'line', 4
    if_null rx1543_debug, debug_736
    rx1543_cur."!cursor_debug"("NEXT", "arglist")
  debug_736:
  rx1543_fail:
    (rx1543_rep, rx1543_pos, $I10, $P10) = rx1543_cur."!mark_fail"(0)
    lt rx1543_pos, -1, rx1543_done
    eq rx1543_pos, -1, rx1543_fail
    jump $I10
  rx1543_done:
    rx1543_cur."!cursor_fail"()
    if_null rx1543_debug, debug_737
    rx1543_cur."!cursor_debug"("FAIL", "arglist")
  debug_737:
    .return (rx1543_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("203_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("204_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1548_tgt
    .local int rx1548_pos
    .local int rx1548_off
    .local int rx1548_eos
    .local int rx1548_rep
    .local pmc rx1548_cur
    .local pmc rx1548_debug
    (rx1548_cur, rx1548_pos, rx1548_tgt, $I10) = self."!cursor_start"()
    getattribute rx1548_debug, rx1548_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1548_cur
    .local pmc match
    .lex "$/", match
    length rx1548_eos, rx1548_tgt
    gt rx1548_pos, rx1548_eos, rx1548_done
    set rx1548_off, 0
    lt rx1548_pos, 2, rx1548_start
    sub rx1548_off, rx1548_pos, 1
    substr rx1548_tgt, rx1548_tgt, rx1548_off
  rx1548_start:
    eq $I10, 1, rx1548_restart
    if_null rx1548_debug, debug_738
    rx1548_cur."!cursor_debug"("START", "term:sym<value>")
  debug_738:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1550_done
    goto rxscan1550_scan
  rxscan1550_loop:
    ($P10) = rx1548_cur."from"()
    inc $P10
    set rx1548_pos, $P10
    ge rx1548_pos, rx1548_eos, rxscan1550_done
  rxscan1550_scan:
    set_addr $I10, rxscan1550_loop
    rx1548_cur."!mark_push"(0, rx1548_pos, $I10)
  rxscan1550_done:
.annotate 'line', 413
  # rx subrule "value" subtype=capture negate=
    rx1548_cur."!cursor_pos"(rx1548_pos)
    $P10 = rx1548_cur."value"()
    unless $P10, rx1548_fail
    rx1548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx1548_pos = $P10."pos"()
  # rx pass
    rx1548_cur."!cursor_pass"(rx1548_pos, "term:sym<value>")
    if_null rx1548_debug, debug_739
    rx1548_cur."!cursor_debug"("PASS", "term:sym<value>", " at pos=", rx1548_pos)
  debug_739:
    .return (rx1548_cur)
  rx1548_restart:
.annotate 'line', 4
    if_null rx1548_debug, debug_740
    rx1548_cur."!cursor_debug"("NEXT", "term:sym<value>")
  debug_740:
  rx1548_fail:
    (rx1548_rep, rx1548_pos, $I10, $P10) = rx1548_cur."!mark_fail"(0)
    lt rx1548_pos, -1, rx1548_done
    eq rx1548_pos, -1, rx1548_fail
    jump $I10
  rx1548_done:
    rx1548_cur."!cursor_fail"()
    if_null rx1548_debug, debug_741
    rx1548_cur."!cursor_debug"("FAIL", "term:sym<value>")
  debug_741:
    .return (rx1548_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("205_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("value", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("206_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1552_tgt
    .local int rx1552_pos
    .local int rx1552_off
    .local int rx1552_eos
    .local int rx1552_rep
    .local pmc rx1552_cur
    .local pmc rx1552_debug
    (rx1552_cur, rx1552_pos, rx1552_tgt, $I10) = self."!cursor_start"()
    getattribute rx1552_debug, rx1552_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1552_cur
    .local pmc match
    .lex "$/", match
    length rx1552_eos, rx1552_tgt
    gt rx1552_pos, rx1552_eos, rx1552_done
    set rx1552_off, 0
    lt rx1552_pos, 2, rx1552_start
    sub rx1552_off, rx1552_pos, 1
    substr rx1552_tgt, rx1552_tgt, rx1552_off
  rx1552_start:
    eq $I10, 1, rx1552_restart
    if_null rx1552_debug, debug_742
    rx1552_cur."!cursor_debug"("START", "value")
  debug_742:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1554_done
    goto rxscan1554_scan
  rxscan1554_loop:
    ($P10) = rx1552_cur."from"()
    inc $P10
    set rx1552_pos, $P10
    ge rx1552_pos, rx1552_eos, rxscan1554_done
  rxscan1554_scan:
    set_addr $I10, rxscan1554_loop
    rx1552_cur."!mark_push"(0, rx1552_pos, $I10)
  rxscan1554_done:
  alt1555_0:
.annotate 'line', 415
    set_addr $I10, alt1555_1
    rx1552_cur."!mark_push"(0, rx1552_pos, $I10)
.annotate 'line', 416
  # rx subrule "quote" subtype=capture negate=
    rx1552_cur."!cursor_pos"(rx1552_pos)
    $P10 = rx1552_cur."quote"()
    unless $P10, rx1552_fail
    rx1552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx1552_pos = $P10."pos"()
    goto alt1555_end
  alt1555_1:
.annotate 'line', 417
  # rx subrule "number" subtype=capture negate=
    rx1552_cur."!cursor_pos"(rx1552_pos)
    $P10 = rx1552_cur."number"()
    unless $P10, rx1552_fail
    rx1552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx1552_pos = $P10."pos"()
  alt1555_end:
.annotate 'line', 415
  # rx pass
    rx1552_cur."!cursor_pass"(rx1552_pos, "value")
    if_null rx1552_debug, debug_743
    rx1552_cur."!cursor_debug"("PASS", "value", " at pos=", rx1552_pos)
  debug_743:
    .return (rx1552_cur)
  rx1552_restart:
.annotate 'line', 4
    if_null rx1552_debug, debug_744
    rx1552_cur."!cursor_debug"("NEXT", "value")
  debug_744:
  rx1552_fail:
    (rx1552_rep, rx1552_pos, $I10, $P10) = rx1552_cur."!mark_fail"(0)
    lt rx1552_pos, -1, rx1552_done
    eq rx1552_pos, -1, rx1552_fail
    jump $I10
  rx1552_done:
    rx1552_cur."!cursor_fail"()
    if_null rx1552_debug, debug_745
    rx1552_cur."!cursor_debug"("FAIL", "value")
  debug_745:
    .return (rx1552_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("207_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("number", "")
    $P101 = self."!PREFIX__!subrule"("quote", "")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("208_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1557_tgt
    .local int rx1557_pos
    .local int rx1557_off
    .local int rx1557_eos
    .local int rx1557_rep
    .local pmc rx1557_cur
    .local pmc rx1557_debug
    (rx1557_cur, rx1557_pos, rx1557_tgt, $I10) = self."!cursor_start"()
    getattribute rx1557_debug, rx1557_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1557_cur
    .local pmc match
    .lex "$/", match
    length rx1557_eos, rx1557_tgt
    gt rx1557_pos, rx1557_eos, rx1557_done
    set rx1557_off, 0
    lt rx1557_pos, 2, rx1557_start
    sub rx1557_off, rx1557_pos, 1
    substr rx1557_tgt, rx1557_tgt, rx1557_off
  rx1557_start:
    eq $I10, 1, rx1557_restart
    if_null rx1557_debug, debug_746
    rx1557_cur."!cursor_debug"("START", "number")
  debug_746:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1559_done
    goto rxscan1559_scan
  rxscan1559_loop:
    ($P10) = rx1557_cur."from"()
    inc $P10
    set rx1557_pos, $P10
    ge rx1557_pos, rx1557_eos, rxscan1559_done
  rxscan1559_scan:
    set_addr $I10, rxscan1559_loop
    rx1557_cur."!mark_push"(0, rx1557_pos, $I10)
  rxscan1559_done:
.annotate 'line', 421
  # rx subcapture "sign"
    set_addr $I10, rxcap_1561_fail
    rx1557_cur."!mark_push"(0, rx1557_pos, $I10)
  # rx enumcharlist_q negate=0  r 0..1
    sub $I10, rx1557_pos, rx1557_off
    set rx1557_rep, 0
    sub $I12, rx1557_eos, rx1557_pos
    le $I12, 1, rxenumcharlistq1560_loop
    set $I12, 1
  rxenumcharlistq1560_loop:
    le $I12, 0, rxenumcharlistq1560_done
    substr $S10, rx1557_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rxenumcharlistq1560_done
    inc rx1557_rep
  rxenumcharlistq1560_done:
    add rx1557_pos, rx1557_pos, rx1557_rep
    set_addr $I10, rxcap_1561_fail
    ($I12, $I11) = rx1557_cur."!mark_peek"($I10)
    rx1557_cur."!cursor_pos"($I11)
    ($P10) = rx1557_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1557_pos, "")
    rx1557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_1561_done
  rxcap_1561_fail:
    goto rx1557_fail
  rxcap_1561_done:
  alt1562_0:
.annotate 'line', 422
    set_addr $I10, alt1562_1
    rx1557_cur."!mark_push"(0, rx1557_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx1557_cur."!cursor_pos"(rx1557_pos)
    $P10 = rx1557_cur."dec_number"()
    unless $P10, rx1557_fail
    rx1557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx1557_pos = $P10."pos"()
    goto alt1562_end
  alt1562_1:
  # rx subrule "integer" subtype=capture negate=
    rx1557_cur."!cursor_pos"(rx1557_pos)
    $P10 = rx1557_cur."integer"()
    unless $P10, rx1557_fail
    rx1557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx1557_pos = $P10."pos"()
  alt1562_end:
.annotate 'line', 420
  # rx pass
    rx1557_cur."!cursor_pass"(rx1557_pos, "number")
    if_null rx1557_debug, debug_747
    rx1557_cur."!cursor_debug"("PASS", "number", " at pos=", rx1557_pos)
  debug_747:
    .return (rx1557_cur)
  rx1557_restart:
.annotate 'line', 4
    if_null rx1557_debug, debug_748
    rx1557_cur."!cursor_debug"("NEXT", "number")
  debug_748:
  rx1557_fail:
    (rx1557_rep, rx1557_pos, $I10, $P10) = rx1557_cur."!mark_fail"(0)
    lt rx1557_pos, -1, rx1557_done
    eq rx1557_pos, -1, rx1557_fail
    jump $I10
  rx1557_done:
    rx1557_cur."!cursor_fail"()
    if_null rx1557_debug, debug_749
    rx1557_cur."!cursor_debug"("FAIL", "number")
  debug_749:
    .return (rx1557_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("209_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("210_1309998847.42912") :method
.annotate 'line', 425
    $P100 = self."!protoregex"("quote")
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("211_1309998847.42912") :method
.annotate 'line', 425
    $P101 = self."!PREFIX__!protoregex"("quote")
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("212_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1566_tgt
    .local int rx1566_pos
    .local int rx1566_off
    .local int rx1566_eos
    .local int rx1566_rep
    .local pmc rx1566_cur
    .local pmc rx1566_debug
    (rx1566_cur, rx1566_pos, rx1566_tgt, $I10) = self."!cursor_start"()
    getattribute rx1566_debug, rx1566_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1566_cur
    .local pmc match
    .lex "$/", match
    length rx1566_eos, rx1566_tgt
    gt rx1566_pos, rx1566_eos, rx1566_done
    set rx1566_off, 0
    lt rx1566_pos, 2, rx1566_start
    sub rx1566_off, rx1566_pos, 1
    substr rx1566_tgt, rx1566_tgt, rx1566_off
  rx1566_start:
    eq $I10, 1, rx1566_restart
    if_null rx1566_debug, debug_750
    rx1566_cur."!cursor_debug"("START", "quote:sym<apos>")
  debug_750:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1568_done
    goto rxscan1568_scan
  rxscan1568_loop:
    ($P10) = rx1566_cur."from"()
    inc $P10
    set rx1566_pos, $P10
    ge rx1566_pos, rx1566_eos, rxscan1568_done
  rxscan1568_scan:
    set_addr $I10, rxscan1568_loop
    rx1566_cur."!mark_push"(0, rx1566_pos, $I10)
  rxscan1568_done:
.annotate 'line', 426
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1566_pos, rx1566_off
    substr $S10, rx1566_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx1566_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1566_cur."!cursor_pos"(rx1566_pos)
    $P10 = rx1566_cur."quote_EXPR"(":q")
    unless $P10, rx1566_fail
    rx1566_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1566_pos = $P10."pos"()
  # rx pass
    rx1566_cur."!cursor_pass"(rx1566_pos, "quote:sym<apos>")
    if_null rx1566_debug, debug_751
    rx1566_cur."!cursor_debug"("PASS", "quote:sym<apos>", " at pos=", rx1566_pos)
  debug_751:
    .return (rx1566_cur)
  rx1566_restart:
.annotate 'line', 4
    if_null rx1566_debug, debug_752
    rx1566_cur."!cursor_debug"("NEXT", "quote:sym<apos>")
  debug_752:
  rx1566_fail:
    (rx1566_rep, rx1566_pos, $I10, $P10) = rx1566_cur."!mark_fail"(0)
    lt rx1566_pos, -1, rx1566_done
    eq rx1566_pos, -1, rx1566_fail
    jump $I10
  rx1566_done:
    rx1566_cur."!cursor_fail"()
    if_null rx1566_debug, debug_753
    rx1566_cur."!cursor_debug"("FAIL", "quote:sym<apos>")
  debug_753:
    .return (rx1566_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("213_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "'"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("214_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1570_tgt
    .local int rx1570_pos
    .local int rx1570_off
    .local int rx1570_eos
    .local int rx1570_rep
    .local pmc rx1570_cur
    .local pmc rx1570_debug
    (rx1570_cur, rx1570_pos, rx1570_tgt, $I10) = self."!cursor_start"()
    getattribute rx1570_debug, rx1570_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1570_cur
    .local pmc match
    .lex "$/", match
    length rx1570_eos, rx1570_tgt
    gt rx1570_pos, rx1570_eos, rx1570_done
    set rx1570_off, 0
    lt rx1570_pos, 2, rx1570_start
    sub rx1570_off, rx1570_pos, 1
    substr rx1570_tgt, rx1570_tgt, rx1570_off
  rx1570_start:
    eq $I10, 1, rx1570_restart
    if_null rx1570_debug, debug_754
    rx1570_cur."!cursor_debug"("START", "quote:sym<dblq>")
  debug_754:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1572_done
    goto rxscan1572_scan
  rxscan1572_loop:
    ($P10) = rx1570_cur."from"()
    inc $P10
    set rx1570_pos, $P10
    ge rx1570_pos, rx1570_eos, rxscan1572_done
  rxscan1572_scan:
    set_addr $I10, rxscan1572_loop
    rx1570_cur."!mark_push"(0, rx1570_pos, $I10)
  rxscan1572_done:
.annotate 'line', 427
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1570_pos, rx1570_off
    substr $S10, rx1570_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx1570_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1570_cur."!cursor_pos"(rx1570_pos)
    $P10 = rx1570_cur."quote_EXPR"(":qq")
    unless $P10, rx1570_fail
    rx1570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1570_pos = $P10."pos"()
  # rx pass
    rx1570_cur."!cursor_pass"(rx1570_pos, "quote:sym<dblq>")
    if_null rx1570_debug, debug_755
    rx1570_cur."!cursor_debug"("PASS", "quote:sym<dblq>", " at pos=", rx1570_pos)
  debug_755:
    .return (rx1570_cur)
  rx1570_restart:
.annotate 'line', 4
    if_null rx1570_debug, debug_756
    rx1570_cur."!cursor_debug"("NEXT", "quote:sym<dblq>")
  debug_756:
  rx1570_fail:
    (rx1570_rep, rx1570_pos, $I10, $P10) = rx1570_cur."!mark_fail"(0)
    lt rx1570_pos, -1, rx1570_done
    eq rx1570_pos, -1, rx1570_fail
    jump $I10
  rx1570_done:
    rx1570_cur."!cursor_fail"()
    if_null rx1570_debug, debug_757
    rx1570_cur."!cursor_debug"("FAIL", "quote:sym<dblq>")
  debug_757:
    .return (rx1570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("215_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "\""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("216_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1574_tgt
    .local int rx1574_pos
    .local int rx1574_off
    .local int rx1574_eos
    .local int rx1574_rep
    .local pmc rx1574_cur
    .local pmc rx1574_debug
    (rx1574_cur, rx1574_pos, rx1574_tgt, $I10) = self."!cursor_start"()
    getattribute rx1574_debug, rx1574_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1574_cur
    .local pmc match
    .lex "$/", match
    length rx1574_eos, rx1574_tgt
    gt rx1574_pos, rx1574_eos, rx1574_done
    set rx1574_off, 0
    lt rx1574_pos, 2, rx1574_start
    sub rx1574_off, rx1574_pos, 1
    substr rx1574_tgt, rx1574_tgt, rx1574_off
  rx1574_start:
    eq $I10, 1, rx1574_restart
    if_null rx1574_debug, debug_758
    rx1574_cur."!cursor_debug"("START", "quote:sym<q>")
  debug_758:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1576_done
    goto rxscan1576_scan
  rxscan1576_loop:
    ($P10) = rx1574_cur."from"()
    inc $P10
    set rx1574_pos, $P10
    ge rx1574_pos, rx1574_eos, rxscan1576_done
  rxscan1576_scan:
    set_addr $I10, rxscan1576_loop
    rx1574_cur."!mark_push"(0, rx1574_pos, $I10)
  rxscan1576_done:
.annotate 'line', 428
  # rx literal  "q"
    add $I11, rx1574_pos, 1
    gt $I11, rx1574_eos, rx1574_fail
    sub $I11, rx1574_pos, rx1574_off
    ord $I11, rx1574_tgt, $I11
    ne $I11, 113, rx1574_fail
    add rx1574_pos, 1
  # rxanchor rwb
    le rx1574_pos, 0, rx1574_fail
    sub $I10, rx1574_pos, rx1574_off
    is_cclass $I11, 8192, rx1574_tgt, $I10
    if $I11, rx1574_fail
    dec $I10
    is_cclass $I11, 8192, rx1574_tgt, $I10
    unless $I11, rx1574_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1574_pos, rx1574_off
    substr $S10, rx1574_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx1574_fail
  # rx subrule "ws" subtype=method negate=
    rx1574_cur."!cursor_pos"(rx1574_pos)
    $P10 = rx1574_cur."ws"()
    unless $P10, rx1574_fail
    rx1574_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1574_cur."!cursor_pos"(rx1574_pos)
    $P10 = rx1574_cur."quote_EXPR"(":q")
    unless $P10, rx1574_fail
    rx1574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1574_pos = $P10."pos"()
  # rx pass
    rx1574_cur."!cursor_pass"(rx1574_pos, "quote:sym<q>")
    if_null rx1574_debug, debug_759
    rx1574_cur."!cursor_debug"("PASS", "quote:sym<q>", " at pos=", rx1574_pos)
  debug_759:
    .return (rx1574_cur)
  rx1574_restart:
.annotate 'line', 4
    if_null rx1574_debug, debug_760
    rx1574_cur."!cursor_debug"("NEXT", "quote:sym<q>")
  debug_760:
  rx1574_fail:
    (rx1574_rep, rx1574_pos, $I10, $P10) = rx1574_cur."!mark_fail"(0)
    lt rx1574_pos, -1, rx1574_done
    eq rx1574_pos, -1, rx1574_fail
    jump $I10
  rx1574_done:
    rx1574_cur."!cursor_fail"()
    if_null rx1574_debug, debug_761
    rx1574_cur."!cursor_debug"("FAIL", "quote:sym<q>")
  debug_761:
    .return (rx1574_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("217_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "q")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("218_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1578_tgt
    .local int rx1578_pos
    .local int rx1578_off
    .local int rx1578_eos
    .local int rx1578_rep
    .local pmc rx1578_cur
    .local pmc rx1578_debug
    (rx1578_cur, rx1578_pos, rx1578_tgt, $I10) = self."!cursor_start"()
    getattribute rx1578_debug, rx1578_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1578_cur
    .local pmc match
    .lex "$/", match
    length rx1578_eos, rx1578_tgt
    gt rx1578_pos, rx1578_eos, rx1578_done
    set rx1578_off, 0
    lt rx1578_pos, 2, rx1578_start
    sub rx1578_off, rx1578_pos, 1
    substr rx1578_tgt, rx1578_tgt, rx1578_off
  rx1578_start:
    eq $I10, 1, rx1578_restart
    if_null rx1578_debug, debug_762
    rx1578_cur."!cursor_debug"("START", "quote:sym<qq>")
  debug_762:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1580_done
    goto rxscan1580_scan
  rxscan1580_loop:
    ($P10) = rx1578_cur."from"()
    inc $P10
    set rx1578_pos, $P10
    ge rx1578_pos, rx1578_eos, rxscan1580_done
  rxscan1580_scan:
    set_addr $I10, rxscan1580_loop
    rx1578_cur."!mark_push"(0, rx1578_pos, $I10)
  rxscan1580_done:
.annotate 'line', 429
  # rx literal  "qq"
    add $I11, rx1578_pos, 2
    gt $I11, rx1578_eos, rx1578_fail
    sub $I11, rx1578_pos, rx1578_off
    substr $S10, rx1578_tgt, $I11, 2
    ne $S10, "qq", rx1578_fail
    add rx1578_pos, 2
  # rxanchor rwb
    le rx1578_pos, 0, rx1578_fail
    sub $I10, rx1578_pos, rx1578_off
    is_cclass $I11, 8192, rx1578_tgt, $I10
    if $I11, rx1578_fail
    dec $I10
    is_cclass $I11, 8192, rx1578_tgt, $I10
    unless $I11, rx1578_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1578_pos, rx1578_off
    substr $S10, rx1578_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx1578_fail
  # rx subrule "ws" subtype=method negate=
    rx1578_cur."!cursor_pos"(rx1578_pos)
    $P10 = rx1578_cur."ws"()
    unless $P10, rx1578_fail
    rx1578_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1578_cur."!cursor_pos"(rx1578_pos)
    $P10 = rx1578_cur."quote_EXPR"(":qq")
    unless $P10, rx1578_fail
    rx1578_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1578_pos = $P10."pos"()
  # rx pass
    rx1578_cur."!cursor_pass"(rx1578_pos, "quote:sym<qq>")
    if_null rx1578_debug, debug_763
    rx1578_cur."!cursor_debug"("PASS", "quote:sym<qq>", " at pos=", rx1578_pos)
  debug_763:
    .return (rx1578_cur)
  rx1578_restart:
.annotate 'line', 4
    if_null rx1578_debug, debug_764
    rx1578_cur."!cursor_debug"("NEXT", "quote:sym<qq>")
  debug_764:
  rx1578_fail:
    (rx1578_rep, rx1578_pos, $I10, $P10) = rx1578_cur."!mark_fail"(0)
    lt rx1578_pos, -1, rx1578_done
    eq rx1578_pos, -1, rx1578_fail
    jump $I10
  rx1578_done:
    rx1578_cur."!cursor_fail"()
    if_null rx1578_debug, debug_765
    rx1578_cur."!cursor_debug"("FAIL", "quote:sym<qq>")
  debug_765:
    .return (rx1578_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("219_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "qq")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("220_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1582_tgt
    .local int rx1582_pos
    .local int rx1582_off
    .local int rx1582_eos
    .local int rx1582_rep
    .local pmc rx1582_cur
    .local pmc rx1582_debug
    (rx1582_cur, rx1582_pos, rx1582_tgt, $I10) = self."!cursor_start"()
    getattribute rx1582_debug, rx1582_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1582_cur
    .local pmc match
    .lex "$/", match
    length rx1582_eos, rx1582_tgt
    gt rx1582_pos, rx1582_eos, rx1582_done
    set rx1582_off, 0
    lt rx1582_pos, 2, rx1582_start
    sub rx1582_off, rx1582_pos, 1
    substr rx1582_tgt, rx1582_tgt, rx1582_off
  rx1582_start:
    eq $I10, 1, rx1582_restart
    if_null rx1582_debug, debug_766
    rx1582_cur."!cursor_debug"("START", "quote:sym<Q>")
  debug_766:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1584_done
    goto rxscan1584_scan
  rxscan1584_loop:
    ($P10) = rx1582_cur."from"()
    inc $P10
    set rx1582_pos, $P10
    ge rx1582_pos, rx1582_eos, rxscan1584_done
  rxscan1584_scan:
    set_addr $I10, rxscan1584_loop
    rx1582_cur."!mark_push"(0, rx1582_pos, $I10)
  rxscan1584_done:
.annotate 'line', 430
  # rx literal  "Q"
    add $I11, rx1582_pos, 1
    gt $I11, rx1582_eos, rx1582_fail
    sub $I11, rx1582_pos, rx1582_off
    ord $I11, rx1582_tgt, $I11
    ne $I11, 81, rx1582_fail
    add rx1582_pos, 1
  # rxanchor rwb
    le rx1582_pos, 0, rx1582_fail
    sub $I10, rx1582_pos, rx1582_off
    is_cclass $I11, 8192, rx1582_tgt, $I10
    if $I11, rx1582_fail
    dec $I10
    is_cclass $I11, 8192, rx1582_tgt, $I10
    unless $I11, rx1582_fail
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1582_pos, rx1582_off
    substr $S10, rx1582_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx1582_fail
  # rx subrule "ws" subtype=method negate=
    rx1582_cur."!cursor_pos"(rx1582_pos)
    $P10 = rx1582_cur."ws"()
    unless $P10, rx1582_fail
    rx1582_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1582_cur."!cursor_pos"(rx1582_pos)
    $P10 = rx1582_cur."quote_EXPR"()
    unless $P10, rx1582_fail
    rx1582_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1582_pos = $P10."pos"()
  # rx pass
    rx1582_cur."!cursor_pass"(rx1582_pos, "quote:sym<Q>")
    if_null rx1582_debug, debug_767
    rx1582_cur."!cursor_debug"("PASS", "quote:sym<Q>", " at pos=", rx1582_pos)
  debug_767:
    .return (rx1582_cur)
  rx1582_restart:
.annotate 'line', 4
    if_null rx1582_debug, debug_768
    rx1582_cur."!cursor_debug"("NEXT", "quote:sym<Q>")
  debug_768:
  rx1582_fail:
    (rx1582_rep, rx1582_pos, $I10, $P10) = rx1582_cur."!mark_fail"(0)
    lt rx1582_pos, -1, rx1582_done
    eq rx1582_pos, -1, rx1582_fail
    jump $I10
  rx1582_done:
    rx1582_cur."!cursor_fail"()
    if_null rx1582_debug, debug_769
    rx1582_cur."!cursor_debug"("FAIL", "quote:sym<Q>")
  debug_769:
    .return (rx1582_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("221_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "Q")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("222_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1586_tgt
    .local int rx1586_pos
    .local int rx1586_off
    .local int rx1586_eos
    .local int rx1586_rep
    .local pmc rx1586_cur
    .local pmc rx1586_debug
    (rx1586_cur, rx1586_pos, rx1586_tgt, $I10) = self."!cursor_start"()
    getattribute rx1586_debug, rx1586_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1586_cur
    .local pmc match
    .lex "$/", match
    length rx1586_eos, rx1586_tgt
    gt rx1586_pos, rx1586_eos, rx1586_done
    set rx1586_off, 0
    lt rx1586_pos, 2, rx1586_start
    sub rx1586_off, rx1586_pos, 1
    substr rx1586_tgt, rx1586_tgt, rx1586_off
  rx1586_start:
    eq $I10, 1, rx1586_restart
    if_null rx1586_debug, debug_770
    rx1586_cur."!cursor_debug"("START", "quote:sym<Q:PIR>")
  debug_770:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1588_done
    goto rxscan1588_scan
  rxscan1588_loop:
    ($P10) = rx1586_cur."from"()
    inc $P10
    set rx1586_pos, $P10
    ge rx1586_pos, rx1586_eos, rxscan1588_done
  rxscan1588_scan:
    set_addr $I10, rxscan1588_loop
    rx1586_cur."!mark_push"(0, rx1586_pos, $I10)
  rxscan1588_done:
.annotate 'line', 431
  # rx literal  "Q:PIR"
    add $I11, rx1586_pos, 5
    gt $I11, rx1586_eos, rx1586_fail
    sub $I11, rx1586_pos, rx1586_off
    substr $S10, rx1586_tgt, $I11, 5
    ne $S10, "Q:PIR", rx1586_fail
    add rx1586_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx1586_cur."!cursor_pos"(rx1586_pos)
    $P10 = rx1586_cur."ws"()
    unless $P10, rx1586_fail
    rx1586_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1586_cur."!cursor_pos"(rx1586_pos)
    $P10 = rx1586_cur."quote_EXPR"()
    unless $P10, rx1586_fail
    rx1586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1586_pos = $P10."pos"()
  # rx pass
    rx1586_cur."!cursor_pass"(rx1586_pos, "quote:sym<Q:PIR>")
    if_null rx1586_debug, debug_771
    rx1586_cur."!cursor_debug"("PASS", "quote:sym<Q:PIR>", " at pos=", rx1586_pos)
  debug_771:
    .return (rx1586_cur)
  rx1586_restart:
.annotate 'line', 4
    if_null rx1586_debug, debug_772
    rx1586_cur."!cursor_debug"("NEXT", "quote:sym<Q:PIR>")
  debug_772:
  rx1586_fail:
    (rx1586_rep, rx1586_pos, $I10, $P10) = rx1586_cur."!mark_fail"(0)
    lt rx1586_pos, -1, rx1586_done
    eq rx1586_pos, -1, rx1586_fail
    jump $I10
  rx1586_done:
    rx1586_cur."!cursor_fail"()
    if_null rx1586_debug, debug_773
    rx1586_cur."!cursor_debug"("FAIL", "quote:sym<Q:PIR>")
  debug_773:
    .return (rx1586_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("223_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("224_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1590_tgt
    .local int rx1590_pos
    .local int rx1590_off
    .local int rx1590_eos
    .local int rx1590_rep
    .local pmc rx1590_cur
    .local pmc rx1590_debug
    (rx1590_cur, rx1590_pos, rx1590_tgt, $I10) = self."!cursor_start"()
    getattribute rx1590_debug, rx1590_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1590_cur
    .local pmc match
    .lex "$/", match
    length rx1590_eos, rx1590_tgt
    gt rx1590_pos, rx1590_eos, rx1590_done
    set rx1590_off, 0
    lt rx1590_pos, 2, rx1590_start
    sub rx1590_off, rx1590_pos, 1
    substr rx1590_tgt, rx1590_tgt, rx1590_off
  rx1590_start:
    eq $I10, 1, rx1590_restart
    if_null rx1590_debug, debug_774
    rx1590_cur."!cursor_debug"("START", "quote:sym</ />")
  debug_774:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1592_done
    goto rxscan1592_scan
  rxscan1592_loop:
    ($P10) = rx1590_cur."from"()
    inc $P10
    set rx1590_pos, $P10
    ge rx1590_pos, rx1590_eos, rxscan1592_done
  rxscan1592_scan:
    set_addr $I10, rxscan1592_loop
    rx1590_cur."!mark_push"(0, rx1590_pos, $I10)
  rxscan1592_done:
.annotate 'line', 433
  # rx literal  "/"
    add $I11, rx1590_pos, 1
    gt $I11, rx1590_eos, rx1590_fail
    sub $I11, rx1590_pos, rx1590_off
    ord $I11, rx1590_tgt, $I11
    ne $I11, 47, rx1590_fail
    add rx1590_pos, 1
.annotate 'line', 434
  # rx subrule "newpad" subtype=method negate=
    rx1590_cur."!cursor_pos"(rx1590_pos)
    $P10 = rx1590_cur."newpad"()
    unless $P10, rx1590_fail
    rx1590_pos = $P10."pos"()
.annotate 'line', 435
  # rx reduce name="quote:sym</ />" key="open"
    rx1590_cur."!cursor_pos"(rx1590_pos)
    rx1590_cur."!reduce"("quote:sym</ />", "open")
.annotate 'line', 436
  # rx subrule "LANG" subtype=capture negate=
    rx1590_cur."!cursor_pos"(rx1590_pos)
    $P10 = rx1590_cur."LANG"("Regex", "nibbler")
    unless $P10, rx1590_fail
    rx1590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx1590_pos = $P10."pos"()
.annotate 'line', 437
  # rx literal  "/"
    add $I11, rx1590_pos, 1
    gt $I11, rx1590_eos, rx1590_fail
    sub $I11, rx1590_pos, rx1590_off
    ord $I11, rx1590_tgt, $I11
    ne $I11, 47, rx1590_fail
    add rx1590_pos, 1
.annotate 'line', 432
  # rx pass
    rx1590_cur."!cursor_pass"(rx1590_pos, "quote:sym</ />")
    if_null rx1590_debug, debug_775
    rx1590_cur."!cursor_debug"("PASS", "quote:sym</ />", " at pos=", rx1590_pos)
  debug_775:
    .return (rx1590_cur)
  rx1590_restart:
.annotate 'line', 4
    if_null rx1590_debug, debug_776
    rx1590_cur."!cursor_debug"("NEXT", "quote:sym</ />")
  debug_776:
  rx1590_fail:
    (rx1590_rep, rx1590_pos, $I10, $P10) = rx1590_cur."!mark_fail"(0)
    lt rx1590_pos, -1, rx1590_done
    eq rx1590_pos, -1, rx1590_fail
    jump $I10
  rx1590_done:
    rx1590_cur."!cursor_fail"()
    if_null rx1590_debug, debug_777
    rx1590_cur."!cursor_debug"("FAIL", "quote:sym</ />")
  debug_777:
    .return (rx1590_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("225_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("newpad", "/")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("226_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1594_tgt
    .local int rx1594_pos
    .local int rx1594_off
    .local int rx1594_eos
    .local int rx1594_rep
    .local pmc rx1594_cur
    .local pmc rx1594_debug
    (rx1594_cur, rx1594_pos, rx1594_tgt, $I10) = self."!cursor_start"()
    getattribute rx1594_debug, rx1594_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1594_cur
    .local pmc match
    .lex "$/", match
    length rx1594_eos, rx1594_tgt
    gt rx1594_pos, rx1594_eos, rx1594_done
    set rx1594_off, 0
    lt rx1594_pos, 2, rx1594_start
    sub rx1594_off, rx1594_pos, 1
    substr rx1594_tgt, rx1594_tgt, rx1594_off
  rx1594_start:
    eq $I10, 1, rx1594_restart
    if_null rx1594_debug, debug_778
    rx1594_cur."!cursor_debug"("START", "quote_escape:sym<$>")
  debug_778:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1596_done
    goto rxscan1596_scan
  rxscan1596_loop:
    ($P10) = rx1594_cur."from"()
    inc $P10
    set rx1594_pos, $P10
    ge rx1594_pos, rx1594_eos, rxscan1596_done
  rxscan1596_scan:
    set_addr $I10, rxscan1596_loop
    rx1594_cur."!mark_push"(0, rx1594_pos, $I10)
  rxscan1596_done:
.annotate 'line', 440
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1594_pos, rx1594_off
    substr $S10, rx1594_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx1594_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1594_cur."!cursor_pos"(rx1594_pos)
    $P10 = rx1594_cur."quotemod_check"("s")
    unless $P10, rx1594_fail
  # rx subrule "variable" subtype=capture negate=
    rx1594_cur."!cursor_pos"(rx1594_pos)
    $P10 = rx1594_cur."variable"()
    unless $P10, rx1594_fail
    rx1594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx1594_pos = $P10."pos"()
  # rx pass
    rx1594_cur."!cursor_pass"(rx1594_pos, "quote_escape:sym<$>")
    if_null rx1594_debug, debug_779
    rx1594_cur."!cursor_debug"("PASS", "quote_escape:sym<$>", " at pos=", rx1594_pos)
  debug_779:
    .return (rx1594_cur)
  rx1594_restart:
.annotate 'line', 4
    if_null rx1594_debug, debug_780
    rx1594_cur."!cursor_debug"("NEXT", "quote_escape:sym<$>")
  debug_780:
  rx1594_fail:
    (rx1594_rep, rx1594_pos, $I10, $P10) = rx1594_cur."!mark_fail"(0)
    lt rx1594_pos, -1, rx1594_done
    eq rx1594_pos, -1, rx1594_fail
    jump $I10
  rx1594_done:
    rx1594_cur."!cursor_fail"()
    if_null rx1594_debug, debug_781
    rx1594_cur."!cursor_debug"("FAIL", "quote_escape:sym<$>")
  debug_781:
    .return (rx1594_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("227_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "$"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("228_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1598_tgt
    .local int rx1598_pos
    .local int rx1598_off
    .local int rx1598_eos
    .local int rx1598_rep
    .local pmc rx1598_cur
    .local pmc rx1598_debug
    (rx1598_cur, rx1598_pos, rx1598_tgt, $I10) = self."!cursor_start"()
    getattribute rx1598_debug, rx1598_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1598_cur
    .local pmc match
    .lex "$/", match
    length rx1598_eos, rx1598_tgt
    gt rx1598_pos, rx1598_eos, rx1598_done
    set rx1598_off, 0
    lt rx1598_pos, 2, rx1598_start
    sub rx1598_off, rx1598_pos, 1
    substr rx1598_tgt, rx1598_tgt, rx1598_off
  rx1598_start:
    eq $I10, 1, rx1598_restart
    if_null rx1598_debug, debug_782
    rx1598_cur."!cursor_debug"("START", "quote_escape:sym<{ }>")
  debug_782:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1600_done
    goto rxscan1600_scan
  rxscan1600_loop:
    ($P10) = rx1598_cur."from"()
    inc $P10
    set rx1598_pos, $P10
    ge rx1598_pos, rx1598_eos, rxscan1600_done
  rxscan1600_scan:
    set_addr $I10, rxscan1600_loop
    rx1598_cur."!mark_push"(0, rx1598_pos, $I10)
  rxscan1600_done:
.annotate 'line', 441
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1598_pos, rx1598_off
    substr $S10, rx1598_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1598_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1598_cur."!cursor_pos"(rx1598_pos)
    $P10 = rx1598_cur."quotemod_check"("c")
    unless $P10, rx1598_fail
  # rx subrule "block" subtype=capture negate=
    rx1598_cur."!cursor_pos"(rx1598_pos)
    $P10 = rx1598_cur."block"()
    unless $P10, rx1598_fail
    rx1598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1598_pos = $P10."pos"()
  # rx pass
    rx1598_cur."!cursor_pass"(rx1598_pos, "quote_escape:sym<{ }>")
    if_null rx1598_debug, debug_783
    rx1598_cur."!cursor_debug"("PASS", "quote_escape:sym<{ }>", " at pos=", rx1598_pos)
  debug_783:
    .return (rx1598_cur)
  rx1598_restart:
.annotate 'line', 4
    if_null rx1598_debug, debug_784
    rx1598_cur."!cursor_debug"("NEXT", "quote_escape:sym<{ }>")
  debug_784:
  rx1598_fail:
    (rx1598_rep, rx1598_pos, $I10, $P10) = rx1598_cur."!mark_fail"(0)
    lt rx1598_pos, -1, rx1598_done
    eq rx1598_pos, -1, rx1598_fail
    jump $I10
  rx1598_done:
    rx1598_cur."!cursor_fail"()
    if_null rx1598_debug, debug_785
    rx1598_cur."!cursor_debug"("FAIL", "quote_escape:sym<{ }>")
  debug_785:
    .return (rx1598_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("229_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "{"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<esc>"  :subid("230_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1602_tgt
    .local int rx1602_pos
    .local int rx1602_off
    .local int rx1602_eos
    .local int rx1602_rep
    .local pmc rx1602_cur
    .local pmc rx1602_debug
    (rx1602_cur, rx1602_pos, rx1602_tgt, $I10) = self."!cursor_start"()
    getattribute rx1602_debug, rx1602_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1602_cur
    .local pmc match
    .lex "$/", match
    length rx1602_eos, rx1602_tgt
    gt rx1602_pos, rx1602_eos, rx1602_done
    set rx1602_off, 0
    lt rx1602_pos, 2, rx1602_start
    sub rx1602_off, rx1602_pos, 1
    substr rx1602_tgt, rx1602_tgt, rx1602_off
  rx1602_start:
    eq $I10, 1, rx1602_restart
    if_null rx1602_debug, debug_786
    rx1602_cur."!cursor_debug"("START", "quote_escape:sym<esc>")
  debug_786:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1604_done
    goto rxscan1604_scan
  rxscan1604_loop:
    ($P10) = rx1602_cur."from"()
    inc $P10
    set rx1602_pos, $P10
    ge rx1602_pos, rx1602_eos, rxscan1604_done
  rxscan1604_scan:
    set_addr $I10, rxscan1604_loop
    rx1602_cur."!mark_push"(0, rx1602_pos, $I10)
  rxscan1604_done:
.annotate 'line', 442
  # rx literal  "\\e"
    add $I11, rx1602_pos, 2
    gt $I11, rx1602_eos, rx1602_fail
    sub $I11, rx1602_pos, rx1602_off
    substr $S10, rx1602_tgt, $I11, 2
    ne $S10, "\\e", rx1602_fail
    add rx1602_pos, 2
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx1602_cur."!cursor_pos"(rx1602_pos)
    $P10 = rx1602_cur."quotemod_check"("b")
    unless $P10, rx1602_fail
  # rx pass
    rx1602_cur."!cursor_pass"(rx1602_pos, "quote_escape:sym<esc>")
    if_null rx1602_debug, debug_787
    rx1602_cur."!cursor_debug"("PASS", "quote_escape:sym<esc>", " at pos=", rx1602_pos)
  debug_787:
    .return (rx1602_cur)
  rx1602_restart:
.annotate 'line', 4
    if_null rx1602_debug, debug_788
    rx1602_cur."!cursor_debug"("NEXT", "quote_escape:sym<esc>")
  debug_788:
  rx1602_fail:
    (rx1602_rep, rx1602_pos, $I10, $P10) = rx1602_cur."!mark_fail"(0)
    lt rx1602_pos, -1, rx1602_done
    eq rx1602_pos, -1, rx1602_fail
    jump $I10
  rx1602_done:
    rx1602_cur."!cursor_fail"()
    if_null rx1602_debug, debug_789
    rx1602_cur."!cursor_debug"("FAIL", "quote_escape:sym<esc>")
  debug_789:
    .return (rx1602_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<esc>"  :subid("231_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "\\e"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("232_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1606_tgt
    .local int rx1606_pos
    .local int rx1606_off
    .local int rx1606_eos
    .local int rx1606_rep
    .local pmc rx1606_cur
    .local pmc rx1606_debug
    (rx1606_cur, rx1606_pos, rx1606_tgt, $I10) = self."!cursor_start"()
    rx1606_cur."!cursor_caparray"("EXPR")
    getattribute rx1606_debug, rx1606_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1606_cur
    .local pmc match
    .lex "$/", match
    length rx1606_eos, rx1606_tgt
    gt rx1606_pos, rx1606_eos, rx1606_done
    set rx1606_off, 0
    lt rx1606_pos, 2, rx1606_start
    sub rx1606_off, rx1606_pos, 1
    substr rx1606_tgt, rx1606_tgt, rx1606_off
  rx1606_start:
    eq $I10, 1, rx1606_restart
    if_null rx1606_debug, debug_790
    rx1606_cur."!cursor_debug"("START", "circumfix:sym<( )>")
  debug_790:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1608_done
    goto rxscan1608_scan
  rxscan1608_loop:
    ($P10) = rx1606_cur."from"()
    inc $P10
    set rx1606_pos, $P10
    ge rx1606_pos, rx1606_eos, rxscan1608_done
  rxscan1608_scan:
    set_addr $I10, rxscan1608_loop
    rx1606_cur."!mark_push"(0, rx1606_pos, $I10)
  rxscan1608_done:
.annotate 'line', 444
  # rx literal  "("
    add $I11, rx1606_pos, 1
    gt $I11, rx1606_eos, rx1606_fail
    sub $I11, rx1606_pos, rx1606_off
    ord $I11, rx1606_tgt, $I11
    ne $I11, 40, rx1606_fail
    add rx1606_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1606_cur."!cursor_pos"(rx1606_pos)
    $P10 = rx1606_cur."ws"()
    unless $P10, rx1606_fail
    rx1606_pos = $P10."pos"()
  # rx rxquantr1609 ** 0..1
    set_addr $I10, rxquantr1609_done
    rx1606_cur."!mark_push"(0, rx1606_pos, $I10)
  rxquantr1609_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx1606_cur."!cursor_pos"(rx1606_pos)
    $P10 = rx1606_cur."EXPR"()
    unless $P10, rx1606_fail
    goto rxsubrule1610_pass
  rxsubrule1610_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1606_fail
  rxsubrule1610_pass:
    set_addr $I10, rxsubrule1610_back
    rx1606_cur."!mark_push"(0, rx1606_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx1606_pos = $P10."pos"()
    set_addr $I10, rxquantr1609_done
    (rx1606_rep) = rx1606_cur."!mark_commit"($I10)
  rxquantr1609_done:
  # rx literal  ")"
    add $I11, rx1606_pos, 1
    gt $I11, rx1606_eos, rx1606_fail
    sub $I11, rx1606_pos, rx1606_off
    ord $I11, rx1606_tgt, $I11
    ne $I11, 41, rx1606_fail
    add rx1606_pos, 1
  # rx pass
    rx1606_cur."!cursor_pass"(rx1606_pos, "circumfix:sym<( )>")
    if_null rx1606_debug, debug_791
    rx1606_cur."!cursor_debug"("PASS", "circumfix:sym<( )>", " at pos=", rx1606_pos)
  debug_791:
    .return (rx1606_cur)
  rx1606_restart:
.annotate 'line', 4
    if_null rx1606_debug, debug_792
    rx1606_cur."!cursor_debug"("NEXT", "circumfix:sym<( )>")
  debug_792:
  rx1606_fail:
    (rx1606_rep, rx1606_pos, $I10, $P10) = rx1606_cur."!mark_fail"(0)
    lt rx1606_pos, -1, rx1606_done
    eq rx1606_pos, -1, rx1606_fail
    jump $I10
  rx1606_done:
    rx1606_cur."!cursor_fail"()
    if_null rx1606_debug, debug_793
    rx1606_cur."!cursor_debug"("FAIL", "circumfix:sym<( )>")
  debug_793:
    .return (rx1606_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("233_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "(")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("234_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1612_tgt
    .local int rx1612_pos
    .local int rx1612_off
    .local int rx1612_eos
    .local int rx1612_rep
    .local pmc rx1612_cur
    .local pmc rx1612_debug
    (rx1612_cur, rx1612_pos, rx1612_tgt, $I10) = self."!cursor_start"()
    rx1612_cur."!cursor_caparray"("EXPR")
    getattribute rx1612_debug, rx1612_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1612_cur
    .local pmc match
    .lex "$/", match
    length rx1612_eos, rx1612_tgt
    gt rx1612_pos, rx1612_eos, rx1612_done
    set rx1612_off, 0
    lt rx1612_pos, 2, rx1612_start
    sub rx1612_off, rx1612_pos, 1
    substr rx1612_tgt, rx1612_tgt, rx1612_off
  rx1612_start:
    eq $I10, 1, rx1612_restart
    if_null rx1612_debug, debug_794
    rx1612_cur."!cursor_debug"("START", "circumfix:sym<[ ]>")
  debug_794:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1614_done
    goto rxscan1614_scan
  rxscan1614_loop:
    ($P10) = rx1612_cur."from"()
    inc $P10
    set rx1612_pos, $P10
    ge rx1612_pos, rx1612_eos, rxscan1614_done
  rxscan1614_scan:
    set_addr $I10, rxscan1614_loop
    rx1612_cur."!mark_push"(0, rx1612_pos, $I10)
  rxscan1614_done:
.annotate 'line', 445
  # rx literal  "["
    add $I11, rx1612_pos, 1
    gt $I11, rx1612_eos, rx1612_fail
    sub $I11, rx1612_pos, rx1612_off
    ord $I11, rx1612_tgt, $I11
    ne $I11, 91, rx1612_fail
    add rx1612_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1612_cur."!cursor_pos"(rx1612_pos)
    $P10 = rx1612_cur."ws"()
    unless $P10, rx1612_fail
    rx1612_pos = $P10."pos"()
  # rx rxquantr1615 ** 0..1
    set_addr $I10, rxquantr1615_done
    rx1612_cur."!mark_push"(0, rx1612_pos, $I10)
  rxquantr1615_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx1612_cur."!cursor_pos"(rx1612_pos)
    $P10 = rx1612_cur."EXPR"()
    unless $P10, rx1612_fail
    goto rxsubrule1616_pass
  rxsubrule1616_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1612_fail
  rxsubrule1616_pass:
    set_addr $I10, rxsubrule1616_back
    rx1612_cur."!mark_push"(0, rx1612_pos, $I10, $P10)
    $P10."!cursor_names"("EXPR")
    rx1612_pos = $P10."pos"()
    set_addr $I10, rxquantr1615_done
    (rx1612_rep) = rx1612_cur."!mark_commit"($I10)
  rxquantr1615_done:
  # rx literal  "]"
    add $I11, rx1612_pos, 1
    gt $I11, rx1612_eos, rx1612_fail
    sub $I11, rx1612_pos, rx1612_off
    ord $I11, rx1612_tgt, $I11
    ne $I11, 93, rx1612_fail
    add rx1612_pos, 1
  # rx pass
    rx1612_cur."!cursor_pass"(rx1612_pos, "circumfix:sym<[ ]>")
    if_null rx1612_debug, debug_795
    rx1612_cur."!cursor_debug"("PASS", "circumfix:sym<[ ]>", " at pos=", rx1612_pos)
  debug_795:
    .return (rx1612_cur)
  rx1612_restart:
.annotate 'line', 4
    if_null rx1612_debug, debug_796
    rx1612_cur."!cursor_debug"("NEXT", "circumfix:sym<[ ]>")
  debug_796:
  rx1612_fail:
    (rx1612_rep, rx1612_pos, $I10, $P10) = rx1612_cur."!mark_fail"(0)
    lt rx1612_pos, -1, rx1612_done
    eq rx1612_pos, -1, rx1612_fail
    jump $I10
  rx1612_done:
    rx1612_cur."!cursor_fail"()
    if_null rx1612_debug, debug_797
    rx1612_cur."!cursor_debug"("FAIL", "circumfix:sym<[ ]>")
  debug_797:
    .return (rx1612_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("235_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "[")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("236_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1618_tgt
    .local int rx1618_pos
    .local int rx1618_off
    .local int rx1618_eos
    .local int rx1618_rep
    .local pmc rx1618_cur
    .local pmc rx1618_debug
    (rx1618_cur, rx1618_pos, rx1618_tgt, $I10) = self."!cursor_start"()
    getattribute rx1618_debug, rx1618_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1618_cur
    .local pmc match
    .lex "$/", match
    length rx1618_eos, rx1618_tgt
    gt rx1618_pos, rx1618_eos, rx1618_done
    set rx1618_off, 0
    lt rx1618_pos, 2, rx1618_start
    sub rx1618_off, rx1618_pos, 1
    substr rx1618_tgt, rx1618_tgt, rx1618_off
  rx1618_start:
    eq $I10, 1, rx1618_restart
    if_null rx1618_debug, debug_798
    rx1618_cur."!cursor_debug"("START", "circumfix:sym<ang>")
  debug_798:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1620_done
    goto rxscan1620_scan
  rxscan1620_loop:
    ($P10) = rx1618_cur."from"()
    inc $P10
    set rx1618_pos, $P10
    ge rx1618_pos, rx1618_eos, rxscan1620_done
  rxscan1620_scan:
    set_addr $I10, rxscan1620_loop
    rx1618_cur."!mark_push"(0, rx1618_pos, $I10)
  rxscan1620_done:
.annotate 'line', 446
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1618_pos, rx1618_off
    substr $S10, rx1618_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1618_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1618_cur."!cursor_pos"(rx1618_pos)
    $P10 = rx1618_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx1618_fail
    rx1618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1618_pos = $P10."pos"()
  # rx pass
    rx1618_cur."!cursor_pass"(rx1618_pos, "circumfix:sym<ang>")
    if_null rx1618_debug, debug_799
    rx1618_cur."!cursor_debug"("PASS", "circumfix:sym<ang>", " at pos=", rx1618_pos)
  debug_799:
    .return (rx1618_cur)
  rx1618_restart:
.annotate 'line', 4
    if_null rx1618_debug, debug_800
    rx1618_cur."!cursor_debug"("NEXT", "circumfix:sym<ang>")
  debug_800:
  rx1618_fail:
    (rx1618_rep, rx1618_pos, $I10, $P10) = rx1618_cur."!mark_fail"(0)
    lt rx1618_pos, -1, rx1618_done
    eq rx1618_pos, -1, rx1618_fail
    jump $I10
  rx1618_done:
    rx1618_cur."!cursor_fail"()
    if_null rx1618_debug, debug_801
    rx1618_cur."!cursor_debug"("FAIL", "circumfix:sym<ang>")
  debug_801:
    .return (rx1618_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("237_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "<"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("238_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1622_tgt
    .local int rx1622_pos
    .local int rx1622_off
    .local int rx1622_eos
    .local int rx1622_rep
    .local pmc rx1622_cur
    .local pmc rx1622_debug
    (rx1622_cur, rx1622_pos, rx1622_tgt, $I10) = self."!cursor_start"()
    getattribute rx1622_debug, rx1622_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1622_cur
    .local pmc match
    .lex "$/", match
    length rx1622_eos, rx1622_tgt
    gt rx1622_pos, rx1622_eos, rx1622_done
    set rx1622_off, 0
    lt rx1622_pos, 2, rx1622_start
    sub rx1622_off, rx1622_pos, 1
    substr rx1622_tgt, rx1622_tgt, rx1622_off
  rx1622_start:
    eq $I10, 1, rx1622_restart
    if_null rx1622_debug, debug_802
    rx1622_cur."!cursor_debug"("START", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_802:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1624_done
    goto rxscan1624_scan
  rxscan1624_loop:
    ($P10) = rx1622_cur."from"()
    inc $P10
    set rx1622_pos, $P10
    ge rx1622_pos, rx1622_eos, rxscan1624_done
  rxscan1624_scan:
    set_addr $I10, rxscan1624_loop
    rx1622_cur."!mark_push"(0, rx1622_pos, $I10)
  rxscan1624_done:
.annotate 'line', 447
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1622_pos, rx1622_off
    substr $S10, rx1622_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx1622_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1622_cur."!cursor_pos"(rx1622_pos)
    $P10 = rx1622_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx1622_fail
    rx1622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1622_pos = $P10."pos"()
  # rx pass
    rx1622_cur."!cursor_pass"(rx1622_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    if_null rx1622_debug, debug_803
    rx1622_cur."!cursor_debug"("PASS", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx1622_pos)
  debug_803:
    .return (rx1622_cur)
  rx1622_restart:
.annotate 'line', 4
    if_null rx1622_debug, debug_804
    rx1622_cur."!cursor_debug"("NEXT", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_804:
  rx1622_fail:
    (rx1622_rep, rx1622_pos, $I10, $P10) = rx1622_cur."!mark_fail"(0)
    lt rx1622_pos, -1, rx1622_done
    eq rx1622_pos, -1, rx1622_fail
    jump $I10
  rx1622_done:
    rx1622_cur."!cursor_fail"()
    if_null rx1622_debug, debug_805
    rx1622_cur."!cursor_debug"("FAIL", unicode:"circumfix:sym<\x{ab} \x{bb}>")
  debug_805:
    .return (rx1622_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("239_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, unicode:"\x{ab}"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("240_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1626_tgt
    .local int rx1626_pos
    .local int rx1626_off
    .local int rx1626_eos
    .local int rx1626_rep
    .local pmc rx1626_cur
    .local pmc rx1626_debug
    (rx1626_cur, rx1626_pos, rx1626_tgt, $I10) = self."!cursor_start"()
    getattribute rx1626_debug, rx1626_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1626_cur
    .local pmc match
    .lex "$/", match
    length rx1626_eos, rx1626_tgt
    gt rx1626_pos, rx1626_eos, rx1626_done
    set rx1626_off, 0
    lt rx1626_pos, 2, rx1626_start
    sub rx1626_off, rx1626_pos, 1
    substr rx1626_tgt, rx1626_tgt, rx1626_off
  rx1626_start:
    eq $I10, 1, rx1626_restart
    if_null rx1626_debug, debug_806
    rx1626_cur."!cursor_debug"("START", "circumfix:sym<{ }>")
  debug_806:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1628_done
    goto rxscan1628_scan
  rxscan1628_loop:
    ($P10) = rx1626_cur."from"()
    inc $P10
    set rx1626_pos, $P10
    ge rx1626_pos, rx1626_eos, rxscan1628_done
  rxscan1628_scan:
    set_addr $I10, rxscan1628_loop
    rx1626_cur."!mark_push"(0, rx1626_pos, $I10)
  rxscan1628_done:
.annotate 'line', 448
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1626_pos, rx1626_off
    substr $S10, rx1626_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1626_fail
  # rx subrule "pblock" subtype=capture negate=
    rx1626_cur."!cursor_pos"(rx1626_pos)
    $P10 = rx1626_cur."pblock"()
    unless $P10, rx1626_fail
    rx1626_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx1626_pos = $P10."pos"()
  # rx pass
    rx1626_cur."!cursor_pass"(rx1626_pos, "circumfix:sym<{ }>")
    if_null rx1626_debug, debug_807
    rx1626_cur."!cursor_debug"("PASS", "circumfix:sym<{ }>", " at pos=", rx1626_pos)
  debug_807:
    .return (rx1626_cur)
  rx1626_restart:
.annotate 'line', 4
    if_null rx1626_debug, debug_808
    rx1626_cur."!cursor_debug"("NEXT", "circumfix:sym<{ }>")
  debug_808:
  rx1626_fail:
    (rx1626_rep, rx1626_pos, $I10, $P10) = rx1626_cur."!mark_fail"(0)
    lt rx1626_pos, -1, rx1626_done
    eq rx1626_pos, -1, rx1626_fail
    jump $I10
  rx1626_done:
    rx1626_cur."!cursor_fail"()
    if_null rx1626_debug, debug_809
    rx1626_cur."!cursor_debug"("FAIL", "circumfix:sym<{ }>")
  debug_809:
    .return (rx1626_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("241_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "{"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("242_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1630_tgt
    .local int rx1630_pos
    .local int rx1630_off
    .local int rx1630_eos
    .local int rx1630_rep
    .local pmc rx1630_cur
    .local pmc rx1630_debug
    (rx1630_cur, rx1630_pos, rx1630_tgt, $I10) = self."!cursor_start"()
    getattribute rx1630_debug, rx1630_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1630_cur
    .local pmc match
    .lex "$/", match
    length rx1630_eos, rx1630_tgt
    gt rx1630_pos, rx1630_eos, rx1630_done
    set rx1630_off, 0
    lt rx1630_pos, 2, rx1630_start
    sub rx1630_off, rx1630_pos, 1
    substr rx1630_tgt, rx1630_tgt, rx1630_off
  rx1630_start:
    eq $I10, 1, rx1630_restart
    if_null rx1630_debug, debug_810
    rx1630_cur."!cursor_debug"("START", "circumfix:sym<sigil>")
  debug_810:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1632_done
    goto rxscan1632_scan
  rxscan1632_loop:
    ($P10) = rx1630_cur."from"()
    inc $P10
    set rx1630_pos, $P10
    ge rx1630_pos, rx1630_eos, rxscan1632_done
  rxscan1632_scan:
    set_addr $I10, rxscan1632_loop
    rx1630_cur."!mark_push"(0, rx1630_pos, $I10)
  rxscan1632_done:
.annotate 'line', 449
  # rx subrule "sigil" subtype=capture negate=
    rx1630_cur."!cursor_pos"(rx1630_pos)
    $P10 = rx1630_cur."sigil"()
    unless $P10, rx1630_fail
    rx1630_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx1630_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx1630_pos, 1
    gt $I11, rx1630_eos, rx1630_fail
    sub $I11, rx1630_pos, rx1630_off
    ord $I11, rx1630_tgt, $I11
    ne $I11, 40, rx1630_fail
    add rx1630_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx1630_cur."!cursor_pos"(rx1630_pos)
    $P10 = rx1630_cur."semilist"()
    unless $P10, rx1630_fail
    rx1630_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx1630_pos = $P10."pos"()
  alt1633_0:
    set_addr $I10, alt1633_1
    rx1630_cur."!mark_push"(0, rx1630_pos, $I10)
  # rx literal  ")"
    add $I11, rx1630_pos, 1
    gt $I11, rx1630_eos, rx1630_fail
    sub $I11, rx1630_pos, rx1630_off
    ord $I11, rx1630_tgt, $I11
    ne $I11, 41, rx1630_fail
    add rx1630_pos, 1
    goto alt1633_end
  alt1633_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx1630_cur."!cursor_pos"(rx1630_pos)
    $P10 = rx1630_cur."FAILGOAL"("')'")
    unless $P10, rx1630_fail
    goto rxsubrule1634_pass
  rxsubrule1634_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1630_fail
  rxsubrule1634_pass:
    set_addr $I10, rxsubrule1634_back
    rx1630_cur."!mark_push"(0, rx1630_pos, $I10, $P10)
    rx1630_pos = $P10."pos"()
  alt1633_end:
  # rx pass
    rx1630_cur."!cursor_pass"(rx1630_pos, "circumfix:sym<sigil>")
    if_null rx1630_debug, debug_811
    rx1630_cur."!cursor_debug"("PASS", "circumfix:sym<sigil>", " at pos=", rx1630_pos)
  debug_811:
    .return (rx1630_cur)
  rx1630_restart:
.annotate 'line', 4
    if_null rx1630_debug, debug_812
    rx1630_cur."!cursor_debug"("NEXT", "circumfix:sym<sigil>")
  debug_812:
  rx1630_fail:
    (rx1630_rep, rx1630_pos, $I10, $P10) = rx1630_cur."!mark_fail"(0)
    lt rx1630_pos, -1, rx1630_done
    eq rx1630_pos, -1, rx1630_fail
    jump $I10
  rx1630_done:
    rx1630_cur."!cursor_fail"()
    if_null rx1630_debug, debug_813
    rx1630_cur."!cursor_debug"("FAIL", "circumfix:sym<sigil>")
  debug_813:
    .return (rx1630_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("243_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("sigil", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("244_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1636_tgt
    .local int rx1636_pos
    .local int rx1636_off
    .local int rx1636_eos
    .local int rx1636_rep
    .local pmc rx1636_cur
    .local pmc rx1636_debug
    (rx1636_cur, rx1636_pos, rx1636_tgt, $I10) = self."!cursor_start"()
    getattribute rx1636_debug, rx1636_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1636_cur
    .local pmc match
    .lex "$/", match
    length rx1636_eos, rx1636_tgt
    gt rx1636_pos, rx1636_eos, rx1636_done
    set rx1636_off, 0
    lt rx1636_pos, 2, rx1636_start
    sub rx1636_off, rx1636_pos, 1
    substr rx1636_tgt, rx1636_tgt, rx1636_off
  rx1636_start:
    eq $I10, 1, rx1636_restart
    if_null rx1636_debug, debug_814
    rx1636_cur."!cursor_debug"("START", "semilist")
  debug_814:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1638_done
    goto rxscan1638_scan
  rxscan1638_loop:
    ($P10) = rx1636_cur."from"()
    inc $P10
    set rx1636_pos, $P10
    ge rx1636_pos, rx1636_eos, rxscan1638_done
  rxscan1638_scan:
    set_addr $I10, rxscan1638_loop
    rx1636_cur."!mark_push"(0, rx1636_pos, $I10)
  rxscan1638_done:
.annotate 'line', 451
  # rx subrule "ws" subtype=method negate=
    rx1636_cur."!cursor_pos"(rx1636_pos)
    $P10 = rx1636_cur."ws"()
    unless $P10, rx1636_fail
    rx1636_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx1636_cur."!cursor_pos"(rx1636_pos)
    $P10 = rx1636_cur."statement"()
    unless $P10, rx1636_fail
    rx1636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1636_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1636_cur."!cursor_pos"(rx1636_pos)
    $P10 = rx1636_cur."ws"()
    unless $P10, rx1636_fail
    rx1636_pos = $P10."pos"()
  # rx pass
    rx1636_cur."!cursor_pass"(rx1636_pos, "semilist")
    if_null rx1636_debug, debug_815
    rx1636_cur."!cursor_debug"("PASS", "semilist", " at pos=", rx1636_pos)
  debug_815:
    .return (rx1636_cur)
  rx1636_restart:
.annotate 'line', 4
    if_null rx1636_debug, debug_816
    rx1636_cur."!cursor_debug"("NEXT", "semilist")
  debug_816:
  rx1636_fail:
    (rx1636_rep, rx1636_pos, $I10, $P10) = rx1636_cur."!mark_fail"(0)
    lt rx1636_pos, -1, rx1636_done
    eq rx1636_pos, -1, rx1636_fail
    jump $I10
  rx1636_done:
    rx1636_cur."!cursor_fail"()
    if_null rx1636_debug, debug_817
    rx1636_cur."!cursor_debug"("FAIL", "semilist")
  debug_817:
    .return (rx1636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("245_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("246_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1640_tgt
    .local int rx1640_pos
    .local int rx1640_off
    .local int rx1640_eos
    .local int rx1640_rep
    .local pmc rx1640_cur
    .local pmc rx1640_debug
    (rx1640_cur, rx1640_pos, rx1640_tgt, $I10) = self."!cursor_start"()
    getattribute rx1640_debug, rx1640_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1640_cur
    .local pmc match
    .lex "$/", match
    length rx1640_eos, rx1640_tgt
    gt rx1640_pos, rx1640_eos, rx1640_done
    set rx1640_off, 0
    lt rx1640_pos, 2, rx1640_start
    sub rx1640_off, rx1640_pos, 1
    substr rx1640_tgt, rx1640_tgt, rx1640_off
  rx1640_start:
    eq $I10, 1, rx1640_restart
    if_null rx1640_debug, debug_818
    rx1640_cur."!cursor_debug"("START", "infixish")
  debug_818:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1642_done
    goto rxscan1642_scan
  rxscan1642_loop:
    ($P10) = rx1640_cur."from"()
    inc $P10
    set rx1640_pos, $P10
    ge rx1640_pos, rx1640_eos, rxscan1642_done
  rxscan1642_scan:
    set_addr $I10, rxscan1642_loop
    rx1640_cur."!mark_push"(0, rx1640_pos, $I10)
  rxscan1642_done:
.annotate 'line', 474
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx1640_cur."!cursor_pos"(rx1640_pos)
    $P10 = rx1640_cur."infixstopper"()
    if $P10, rx1640_fail
  # rx subrule "infix" subtype=capture negate=
    rx1640_cur."!cursor_pos"(rx1640_pos)
    $P10 = rx1640_cur."infix"()
    unless $P10, rx1640_fail
    rx1640_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx1640_pos = $P10."pos"()
  # rx pass
    rx1640_cur."!cursor_pass"(rx1640_pos, "infixish")
    if_null rx1640_debug, debug_819
    rx1640_cur."!cursor_debug"("PASS", "infixish", " at pos=", rx1640_pos)
  debug_819:
    .return (rx1640_cur)
  rx1640_restart:
.annotate 'line', 4
    if_null rx1640_debug, debug_820
    rx1640_cur."!cursor_debug"("NEXT", "infixish")
  debug_820:
  rx1640_fail:
    (rx1640_rep, rx1640_pos, $I10, $P10) = rx1640_cur."!mark_fail"(0)
    lt rx1640_pos, -1, rx1640_done
    eq rx1640_pos, -1, rx1640_fail
    jump $I10
  rx1640_done:
    rx1640_cur."!cursor_fail"()
    if_null rx1640_debug, debug_821
    rx1640_cur."!cursor_debug"("FAIL", "infixish")
  debug_821:
    .return (rx1640_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("247_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("248_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1644_tgt
    .local int rx1644_pos
    .local int rx1644_off
    .local int rx1644_eos
    .local int rx1644_rep
    .local pmc rx1644_cur
    .local pmc rx1644_debug
    (rx1644_cur, rx1644_pos, rx1644_tgt, $I10) = self."!cursor_start"()
    getattribute rx1644_debug, rx1644_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1644_cur
    .local pmc match
    .lex "$/", match
    length rx1644_eos, rx1644_tgt
    gt rx1644_pos, rx1644_eos, rx1644_done
    set rx1644_off, 0
    lt rx1644_pos, 2, rx1644_start
    sub rx1644_off, rx1644_pos, 1
    substr rx1644_tgt, rx1644_tgt, rx1644_off
  rx1644_start:
    eq $I10, 1, rx1644_restart
    if_null rx1644_debug, debug_822
    rx1644_cur."!cursor_debug"("START", "infixstopper")
  debug_822:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1646_done
    goto rxscan1646_scan
  rxscan1646_loop:
    ($P10) = rx1644_cur."from"()
    inc $P10
    set rx1644_pos, $P10
    ge rx1644_pos, rx1644_eos, rxscan1646_done
  rxscan1646_scan:
    set_addr $I10, rxscan1646_loop
    rx1644_cur."!mark_push"(0, rx1644_pos, $I10)
  rxscan1646_done:
.annotate 'line', 475
  # rx subrule "lambda" subtype=zerowidth negate=
    rx1644_cur."!cursor_pos"(rx1644_pos)
    $P10 = rx1644_cur."lambda"()
    unless $P10, rx1644_fail
  # rx pass
    rx1644_cur."!cursor_pass"(rx1644_pos, "infixstopper")
    if_null rx1644_debug, debug_823
    rx1644_cur."!cursor_debug"("PASS", "infixstopper", " at pos=", rx1644_pos)
  debug_823:
    .return (rx1644_cur)
  rx1644_restart:
.annotate 'line', 4
    if_null rx1644_debug, debug_824
    rx1644_cur."!cursor_debug"("NEXT", "infixstopper")
  debug_824:
  rx1644_fail:
    (rx1644_rep, rx1644_pos, $I10, $P10) = rx1644_cur."!mark_fail"(0)
    lt rx1644_pos, -1, rx1644_done
    eq rx1644_pos, -1, rx1644_fail
    jump $I10
  rx1644_done:
    rx1644_cur."!cursor_fail"()
    if_null rx1644_debug, debug_825
    rx1644_cur."!cursor_debug"("FAIL", "infixstopper")
  debug_825:
    .return (rx1644_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("249_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("250_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1648_tgt
    .local int rx1648_pos
    .local int rx1648_off
    .local int rx1648_eos
    .local int rx1648_rep
    .local pmc rx1648_cur
    .local pmc rx1648_debug
    (rx1648_cur, rx1648_pos, rx1648_tgt, $I10) = self."!cursor_start"()
    getattribute rx1648_debug, rx1648_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1648_cur
    .local pmc match
    .lex "$/", match
    length rx1648_eos, rx1648_tgt
    gt rx1648_pos, rx1648_eos, rx1648_done
    set rx1648_off, 0
    lt rx1648_pos, 2, rx1648_start
    sub rx1648_off, rx1648_pos, 1
    substr rx1648_tgt, rx1648_tgt, rx1648_off
  rx1648_start:
    eq $I10, 1, rx1648_restart
    if_null rx1648_debug, debug_826
    rx1648_cur."!cursor_debug"("START", "postcircumfix:sym<[ ]>")
  debug_826:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1650_done
    goto rxscan1650_scan
  rxscan1650_loop:
    ($P10) = rx1648_cur."from"()
    inc $P10
    set rx1648_pos, $P10
    ge rx1648_pos, rx1648_eos, rxscan1650_done
  rxscan1650_scan:
    set_addr $I10, rxscan1650_loop
    rx1648_cur."!mark_push"(0, rx1648_pos, $I10)
  rxscan1650_done:
.annotate 'line', 478
  # rx literal  "["
    add $I11, rx1648_pos, 1
    gt $I11, rx1648_eos, rx1648_fail
    sub $I11, rx1648_pos, rx1648_off
    ord $I11, rx1648_tgt, $I11
    ne $I11, 91, rx1648_fail
    add rx1648_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1648_cur."!cursor_pos"(rx1648_pos)
    $P10 = rx1648_cur."ws"()
    unless $P10, rx1648_fail
    rx1648_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1648_cur."!cursor_pos"(rx1648_pos)
    $P10 = rx1648_cur."EXPR"()
    unless $P10, rx1648_fail
    rx1648_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1648_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1648_pos, 1
    gt $I11, rx1648_eos, rx1648_fail
    sub $I11, rx1648_pos, rx1648_off
    ord $I11, rx1648_tgt, $I11
    ne $I11, 93, rx1648_fail
    add rx1648_pos, 1
.annotate 'line', 479
  # rx subrule "O" subtype=capture negate=
    rx1648_cur."!cursor_pos"(rx1648_pos)
    $P10 = rx1648_cur."O"("%methodop")
    unless $P10, rx1648_fail
    rx1648_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1648_pos = $P10."pos"()
.annotate 'line', 477
  # rx pass
    rx1648_cur."!cursor_pass"(rx1648_pos, "postcircumfix:sym<[ ]>")
    if_null rx1648_debug, debug_827
    rx1648_cur."!cursor_debug"("PASS", "postcircumfix:sym<[ ]>", " at pos=", rx1648_pos)
  debug_827:
    .return (rx1648_cur)
  rx1648_restart:
.annotate 'line', 4
    if_null rx1648_debug, debug_828
    rx1648_cur."!cursor_debug"("NEXT", "postcircumfix:sym<[ ]>")
  debug_828:
  rx1648_fail:
    (rx1648_rep, rx1648_pos, $I10, $P10) = rx1648_cur."!mark_fail"(0)
    lt rx1648_pos, -1, rx1648_done
    eq rx1648_pos, -1, rx1648_fail
    jump $I10
  rx1648_done:
    rx1648_cur."!cursor_fail"()
    if_null rx1648_debug, debug_829
    rx1648_cur."!cursor_debug"("FAIL", "postcircumfix:sym<[ ]>")
  debug_829:
    .return (rx1648_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("251_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "[")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("252_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1652_tgt
    .local int rx1652_pos
    .local int rx1652_off
    .local int rx1652_eos
    .local int rx1652_rep
    .local pmc rx1652_cur
    .local pmc rx1652_debug
    (rx1652_cur, rx1652_pos, rx1652_tgt, $I10) = self."!cursor_start"()
    getattribute rx1652_debug, rx1652_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1652_cur
    .local pmc match
    .lex "$/", match
    length rx1652_eos, rx1652_tgt
    gt rx1652_pos, rx1652_eos, rx1652_done
    set rx1652_off, 0
    lt rx1652_pos, 2, rx1652_start
    sub rx1652_off, rx1652_pos, 1
    substr rx1652_tgt, rx1652_tgt, rx1652_off
  rx1652_start:
    eq $I10, 1, rx1652_restart
    if_null rx1652_debug, debug_830
    rx1652_cur."!cursor_debug"("START", "postcircumfix:sym<{ }>")
  debug_830:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1654_done
    goto rxscan1654_scan
  rxscan1654_loop:
    ($P10) = rx1652_cur."from"()
    inc $P10
    set rx1652_pos, $P10
    ge rx1652_pos, rx1652_eos, rxscan1654_done
  rxscan1654_scan:
    set_addr $I10, rxscan1654_loop
    rx1652_cur."!mark_push"(0, rx1652_pos, $I10)
  rxscan1654_done:
.annotate 'line', 483
  # rx literal  "{"
    add $I11, rx1652_pos, 1
    gt $I11, rx1652_eos, rx1652_fail
    sub $I11, rx1652_pos, rx1652_off
    ord $I11, rx1652_tgt, $I11
    ne $I11, 123, rx1652_fail
    add rx1652_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1652_cur."!cursor_pos"(rx1652_pos)
    $P10 = rx1652_cur."ws"()
    unless $P10, rx1652_fail
    rx1652_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx1652_cur."!cursor_pos"(rx1652_pos)
    $P10 = rx1652_cur."EXPR"()
    unless $P10, rx1652_fail
    rx1652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1652_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1652_pos, 1
    gt $I11, rx1652_eos, rx1652_fail
    sub $I11, rx1652_pos, rx1652_off
    ord $I11, rx1652_tgt, $I11
    ne $I11, 125, rx1652_fail
    add rx1652_pos, 1
.annotate 'line', 484
  # rx subrule "O" subtype=capture negate=
    rx1652_cur."!cursor_pos"(rx1652_pos)
    $P10 = rx1652_cur."O"("%methodop")
    unless $P10, rx1652_fail
    rx1652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1652_pos = $P10."pos"()
.annotate 'line', 482
  # rx pass
    rx1652_cur."!cursor_pass"(rx1652_pos, "postcircumfix:sym<{ }>")
    if_null rx1652_debug, debug_831
    rx1652_cur."!cursor_debug"("PASS", "postcircumfix:sym<{ }>", " at pos=", rx1652_pos)
  debug_831:
    .return (rx1652_cur)
  rx1652_restart:
.annotate 'line', 4
    if_null rx1652_debug, debug_832
    rx1652_cur."!cursor_debug"("NEXT", "postcircumfix:sym<{ }>")
  debug_832:
  rx1652_fail:
    (rx1652_rep, rx1652_pos, $I10, $P10) = rx1652_cur."!mark_fail"(0)
    lt rx1652_pos, -1, rx1652_done
    eq rx1652_pos, -1, rx1652_fail
    jump $I10
  rx1652_done:
    rx1652_cur."!cursor_fail"()
    if_null rx1652_debug, debug_833
    rx1652_cur."!cursor_debug"("FAIL", "postcircumfix:sym<{ }>")
  debug_833:
    .return (rx1652_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("253_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "{")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("254_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1656_tgt
    .local int rx1656_pos
    .local int rx1656_off
    .local int rx1656_eos
    .local int rx1656_rep
    .local pmc rx1656_cur
    .local pmc rx1656_debug
    (rx1656_cur, rx1656_pos, rx1656_tgt, $I10) = self."!cursor_start"()
    getattribute rx1656_debug, rx1656_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1656_cur
    .local pmc match
    .lex "$/", match
    length rx1656_eos, rx1656_tgt
    gt rx1656_pos, rx1656_eos, rx1656_done
    set rx1656_off, 0
    lt rx1656_pos, 2, rx1656_start
    sub rx1656_off, rx1656_pos, 1
    substr rx1656_tgt, rx1656_tgt, rx1656_off
  rx1656_start:
    eq $I10, 1, rx1656_restart
    if_null rx1656_debug, debug_834
    rx1656_cur."!cursor_debug"("START", "postcircumfix:sym<ang>")
  debug_834:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1658_done
    goto rxscan1658_scan
  rxscan1658_loop:
    ($P10) = rx1656_cur."from"()
    inc $P10
    set rx1656_pos, $P10
    ge rx1656_pos, rx1656_eos, rxscan1658_done
  rxscan1658_scan:
    set_addr $I10, rxscan1658_loop
    rx1656_cur."!mark_push"(0, rx1656_pos, $I10)
  rxscan1658_done:
.annotate 'line', 488
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1656_pos, rx1656_off
    substr $S10, rx1656_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx1656_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1656_cur."!cursor_pos"(rx1656_pos)
    $P10 = rx1656_cur."quote_EXPR"(":q")
    unless $P10, rx1656_fail
    rx1656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1656_pos = $P10."pos"()
.annotate 'line', 489
  # rx subrule "O" subtype=capture negate=
    rx1656_cur."!cursor_pos"(rx1656_pos)
    $P10 = rx1656_cur."O"("%methodop")
    unless $P10, rx1656_fail
    rx1656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1656_pos = $P10."pos"()
.annotate 'line', 487
  # rx pass
    rx1656_cur."!cursor_pass"(rx1656_pos, "postcircumfix:sym<ang>")
    if_null rx1656_debug, debug_835
    rx1656_cur."!cursor_debug"("PASS", "postcircumfix:sym<ang>", " at pos=", rx1656_pos)
  debug_835:
    .return (rx1656_cur)
  rx1656_restart:
.annotate 'line', 4
    if_null rx1656_debug, debug_836
    rx1656_cur."!cursor_debug"("NEXT", "postcircumfix:sym<ang>")
  debug_836:
  rx1656_fail:
    (rx1656_rep, rx1656_pos, $I10, $P10) = rx1656_cur."!mark_fail"(0)
    lt rx1656_pos, -1, rx1656_done
    eq rx1656_pos, -1, rx1656_fail
    jump $I10
  rx1656_done:
    rx1656_cur."!cursor_fail"()
    if_null rx1656_debug, debug_837
    rx1656_cur."!cursor_debug"("FAIL", "postcircumfix:sym<ang>")
  debug_837:
    .return (rx1656_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("255_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "<"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("256_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1660_tgt
    .local int rx1660_pos
    .local int rx1660_off
    .local int rx1660_eos
    .local int rx1660_rep
    .local pmc rx1660_cur
    .local pmc rx1660_debug
    (rx1660_cur, rx1660_pos, rx1660_tgt, $I10) = self."!cursor_start"()
    getattribute rx1660_debug, rx1660_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1660_cur
    .local pmc match
    .lex "$/", match
    length rx1660_eos, rx1660_tgt
    gt rx1660_pos, rx1660_eos, rx1660_done
    set rx1660_off, 0
    lt rx1660_pos, 2, rx1660_start
    sub rx1660_off, rx1660_pos, 1
    substr rx1660_tgt, rx1660_tgt, rx1660_off
  rx1660_start:
    eq $I10, 1, rx1660_restart
    if_null rx1660_debug, debug_838
    rx1660_cur."!cursor_debug"("START", "postcircumfix:sym<( )>")
  debug_838:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1662_done
    goto rxscan1662_scan
  rxscan1662_loop:
    ($P10) = rx1660_cur."from"()
    inc $P10
    set rx1660_pos, $P10
    ge rx1660_pos, rx1660_eos, rxscan1662_done
  rxscan1662_scan:
    set_addr $I10, rxscan1662_loop
    rx1660_cur."!mark_push"(0, rx1660_pos, $I10)
  rxscan1662_done:
.annotate 'line', 493
  # rx literal  "("
    add $I11, rx1660_pos, 1
    gt $I11, rx1660_eos, rx1660_fail
    sub $I11, rx1660_pos, rx1660_off
    ord $I11, rx1660_tgt, $I11
    ne $I11, 40, rx1660_fail
    add rx1660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1660_cur."!cursor_pos"(rx1660_pos)
    $P10 = rx1660_cur."ws"()
    unless $P10, rx1660_fail
    rx1660_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx1660_cur."!cursor_pos"(rx1660_pos)
    $P10 = rx1660_cur."arglist"()
    unless $P10, rx1660_fail
    rx1660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1660_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1660_pos, 1
    gt $I11, rx1660_eos, rx1660_fail
    sub $I11, rx1660_pos, rx1660_off
    ord $I11, rx1660_tgt, $I11
    ne $I11, 41, rx1660_fail
    add rx1660_pos, 1
.annotate 'line', 494
  # rx subrule "O" subtype=capture negate=
    rx1660_cur."!cursor_pos"(rx1660_pos)
    $P10 = rx1660_cur."O"("%methodop")
    unless $P10, rx1660_fail
    rx1660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1660_pos = $P10."pos"()
.annotate 'line', 492
  # rx pass
    rx1660_cur."!cursor_pass"(rx1660_pos, "postcircumfix:sym<( )>")
    if_null rx1660_debug, debug_839
    rx1660_cur."!cursor_debug"("PASS", "postcircumfix:sym<( )>", " at pos=", rx1660_pos)
  debug_839:
    .return (rx1660_cur)
  rx1660_restart:
.annotate 'line', 4
    if_null rx1660_debug, debug_840
    rx1660_cur."!cursor_debug"("NEXT", "postcircumfix:sym<( )>")
  debug_840:
  rx1660_fail:
    (rx1660_rep, rx1660_pos, $I10, $P10) = rx1660_cur."!mark_fail"(0)
    lt rx1660_pos, -1, rx1660_done
    eq rx1660_pos, -1, rx1660_fail
    jump $I10
  rx1660_done:
    rx1660_cur."!cursor_fail"()
    if_null rx1660_debug, debug_841
    rx1660_cur."!cursor_debug"("FAIL", "postcircumfix:sym<( )>")
  debug_841:
    .return (rx1660_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("257_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "(")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("258_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1664_tgt
    .local int rx1664_pos
    .local int rx1664_off
    .local int rx1664_eos
    .local int rx1664_rep
    .local pmc rx1664_cur
    .local pmc rx1664_debug
    (rx1664_cur, rx1664_pos, rx1664_tgt, $I10) = self."!cursor_start"()
    getattribute rx1664_debug, rx1664_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1664_cur
    .local pmc match
    .lex "$/", match
    length rx1664_eos, rx1664_tgt
    gt rx1664_pos, rx1664_eos, rx1664_done
    set rx1664_off, 0
    lt rx1664_pos, 2, rx1664_start
    sub rx1664_off, rx1664_pos, 1
    substr rx1664_tgt, rx1664_tgt, rx1664_off
  rx1664_start:
    eq $I10, 1, rx1664_restart
    if_null rx1664_debug, debug_842
    rx1664_cur."!cursor_debug"("START", "postfix:sym<.>")
  debug_842:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1666_done
    goto rxscan1666_scan
  rxscan1666_loop:
    ($P10) = rx1664_cur."from"()
    inc $P10
    set rx1664_pos, $P10
    ge rx1664_pos, rx1664_eos, rxscan1666_done
  rxscan1666_scan:
    set_addr $I10, rxscan1666_loop
    rx1664_cur."!mark_push"(0, rx1664_pos, $I10)
  rxscan1666_done:
.annotate 'line', 497
  # rx subrule "dotty" subtype=capture negate=
    rx1664_cur."!cursor_pos"(rx1664_pos)
    $P10 = rx1664_cur."dotty"()
    unless $P10, rx1664_fail
    rx1664_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx1664_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx1664_cur."!cursor_pos"(rx1664_pos)
    $P10 = rx1664_cur."O"("%methodop")
    unless $P10, rx1664_fail
    rx1664_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1664_pos = $P10."pos"()
  # rx pass
    rx1664_cur."!cursor_pass"(rx1664_pos, "postfix:sym<.>")
    if_null rx1664_debug, debug_843
    rx1664_cur."!cursor_debug"("PASS", "postfix:sym<.>", " at pos=", rx1664_pos)
  debug_843:
    .return (rx1664_cur)
  rx1664_restart:
.annotate 'line', 4
    if_null rx1664_debug, debug_844
    rx1664_cur."!cursor_debug"("NEXT", "postfix:sym<.>")
  debug_844:
  rx1664_fail:
    (rx1664_rep, rx1664_pos, $I10, $P10) = rx1664_cur."!mark_fail"(0)
    lt rx1664_pos, -1, rx1664_done
    eq rx1664_pos, -1, rx1664_fail
    jump $I10
  rx1664_done:
    rx1664_cur."!cursor_fail"()
    if_null rx1664_debug, debug_845
    rx1664_cur."!cursor_debug"("FAIL", "postfix:sym<.>")
  debug_845:
    .return (rx1664_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("259_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("dotty", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("260_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1668_tgt
    .local int rx1668_pos
    .local int rx1668_off
    .local int rx1668_eos
    .local int rx1668_rep
    .local pmc rx1668_cur
    .local pmc rx1668_debug
    (rx1668_cur, rx1668_pos, rx1668_tgt, $I10) = self."!cursor_start"()
    getattribute rx1668_debug, rx1668_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1668_cur
    .local pmc match
    .lex "$/", match
    length rx1668_eos, rx1668_tgt
    gt rx1668_pos, rx1668_eos, rx1668_done
    set rx1668_off, 0
    lt rx1668_pos, 2, rx1668_start
    sub rx1668_off, rx1668_pos, 1
    substr rx1668_tgt, rx1668_tgt, rx1668_off
  rx1668_start:
    eq $I10, 1, rx1668_restart
    if_null rx1668_debug, debug_846
    rx1668_cur."!cursor_debug"("START", "prefix:sym<++>")
  debug_846:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1670_done
    goto rxscan1670_scan
  rxscan1670_loop:
    ($P10) = rx1668_cur."from"()
    inc $P10
    set rx1668_pos, $P10
    ge rx1668_pos, rx1668_eos, rxscan1670_done
  rxscan1670_scan:
    set_addr $I10, rxscan1670_loop
    rx1668_cur."!mark_push"(0, rx1668_pos, $I10)
  rxscan1670_done:
.annotate 'line', 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1671_fail
    rx1668_cur."!mark_push"(0, rx1668_pos, $I10)
  # rx literal  "++"
    add $I11, rx1668_pos, 2
    gt $I11, rx1668_eos, rx1668_fail
    sub $I11, rx1668_pos, rx1668_off
    substr $S10, rx1668_tgt, $I11, 2
    ne $S10, "++", rx1668_fail
    add rx1668_pos, 2
    set_addr $I10, rxcap_1671_fail
    ($I12, $I11) = rx1668_cur."!mark_peek"($I10)
    rx1668_cur."!cursor_pos"($I11)
    ($P10) = rx1668_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1668_pos, "")
    rx1668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1671_done
  rxcap_1671_fail:
    goto rx1668_fail
  rxcap_1671_done:
  # rx subrule "O" subtype=capture negate=
    rx1668_cur."!cursor_pos"(rx1668_pos)
    $P10 = rx1668_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx1668_fail
    rx1668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1668_pos = $P10."pos"()
  # rx pass
    rx1668_cur."!cursor_pass"(rx1668_pos, "prefix:sym<++>")
    if_null rx1668_debug, debug_847
    rx1668_cur."!cursor_debug"("PASS", "prefix:sym<++>", " at pos=", rx1668_pos)
  debug_847:
    .return (rx1668_cur)
  rx1668_restart:
.annotate 'line', 4
    if_null rx1668_debug, debug_848
    rx1668_cur."!cursor_debug"("NEXT", "prefix:sym<++>")
  debug_848:
  rx1668_fail:
    (rx1668_rep, rx1668_pos, $I10, $P10) = rx1668_cur."!mark_fail"(0)
    lt rx1668_pos, -1, rx1668_done
    eq rx1668_pos, -1, rx1668_fail
    jump $I10
  rx1668_done:
    rx1668_cur."!cursor_fail"()
    if_null rx1668_debug, debug_849
    rx1668_cur."!cursor_debug"("FAIL", "prefix:sym<++>")
  debug_849:
    .return (rx1668_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("261_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "++")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("262_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1673_tgt
    .local int rx1673_pos
    .local int rx1673_off
    .local int rx1673_eos
    .local int rx1673_rep
    .local pmc rx1673_cur
    .local pmc rx1673_debug
    (rx1673_cur, rx1673_pos, rx1673_tgt, $I10) = self."!cursor_start"()
    getattribute rx1673_debug, rx1673_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1673_cur
    .local pmc match
    .lex "$/", match
    length rx1673_eos, rx1673_tgt
    gt rx1673_pos, rx1673_eos, rx1673_done
    set rx1673_off, 0
    lt rx1673_pos, 2, rx1673_start
    sub rx1673_off, rx1673_pos, 1
    substr rx1673_tgt, rx1673_tgt, rx1673_off
  rx1673_start:
    eq $I10, 1, rx1673_restart
    if_null rx1673_debug, debug_850
    rx1673_cur."!cursor_debug"("START", "prefix:sym<-->")
  debug_850:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1675_done
    goto rxscan1675_scan
  rxscan1675_loop:
    ($P10) = rx1673_cur."from"()
    inc $P10
    set rx1673_pos, $P10
    ge rx1673_pos, rx1673_eos, rxscan1675_done
  rxscan1675_scan:
    set_addr $I10, rxscan1675_loop
    rx1673_cur."!mark_push"(0, rx1673_pos, $I10)
  rxscan1675_done:
.annotate 'line', 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1676_fail
    rx1673_cur."!mark_push"(0, rx1673_pos, $I10)
  # rx literal  "--"
    add $I11, rx1673_pos, 2
    gt $I11, rx1673_eos, rx1673_fail
    sub $I11, rx1673_pos, rx1673_off
    substr $S10, rx1673_tgt, $I11, 2
    ne $S10, "--", rx1673_fail
    add rx1673_pos, 2
    set_addr $I10, rxcap_1676_fail
    ($I12, $I11) = rx1673_cur."!mark_peek"($I10)
    rx1673_cur."!cursor_pos"($I11)
    ($P10) = rx1673_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1673_pos, "")
    rx1673_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1676_done
  rxcap_1676_fail:
    goto rx1673_fail
  rxcap_1676_done:
  # rx subrule "O" subtype=capture negate=
    rx1673_cur."!cursor_pos"(rx1673_pos)
    $P10 = rx1673_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx1673_fail
    rx1673_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1673_pos = $P10."pos"()
  # rx pass
    rx1673_cur."!cursor_pass"(rx1673_pos, "prefix:sym<-->")
    if_null rx1673_debug, debug_851
    rx1673_cur."!cursor_debug"("PASS", "prefix:sym<-->", " at pos=", rx1673_pos)
  debug_851:
    .return (rx1673_cur)
  rx1673_restart:
.annotate 'line', 4
    if_null rx1673_debug, debug_852
    rx1673_cur."!cursor_debug"("NEXT", "prefix:sym<-->")
  debug_852:
  rx1673_fail:
    (rx1673_rep, rx1673_pos, $I10, $P10) = rx1673_cur."!mark_fail"(0)
    lt rx1673_pos, -1, rx1673_done
    eq rx1673_pos, -1, rx1673_fail
    jump $I10
  rx1673_done:
    rx1673_cur."!cursor_fail"()
    if_null rx1673_debug, debug_853
    rx1673_cur."!cursor_debug"("FAIL", "prefix:sym<-->")
  debug_853:
    .return (rx1673_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("263_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "--")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("264_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1678_tgt
    .local int rx1678_pos
    .local int rx1678_off
    .local int rx1678_eos
    .local int rx1678_rep
    .local pmc rx1678_cur
    .local pmc rx1678_debug
    (rx1678_cur, rx1678_pos, rx1678_tgt, $I10) = self."!cursor_start"()
    getattribute rx1678_debug, rx1678_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1678_cur
    .local pmc match
    .lex "$/", match
    length rx1678_eos, rx1678_tgt
    gt rx1678_pos, rx1678_eos, rx1678_done
    set rx1678_off, 0
    lt rx1678_pos, 2, rx1678_start
    sub rx1678_off, rx1678_pos, 1
    substr rx1678_tgt, rx1678_tgt, rx1678_off
  rx1678_start:
    eq $I10, 1, rx1678_restart
    if_null rx1678_debug, debug_854
    rx1678_cur."!cursor_debug"("START", "postfix:sym<++>")
  debug_854:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1680_done
    goto rxscan1680_scan
  rxscan1680_loop:
    ($P10) = rx1678_cur."from"()
    inc $P10
    set rx1678_pos, $P10
    ge rx1678_pos, rx1678_eos, rxscan1680_done
  rxscan1680_scan:
    set_addr $I10, rxscan1680_loop
    rx1678_cur."!mark_push"(0, rx1678_pos, $I10)
  rxscan1680_done:
.annotate 'line', 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1681_fail
    rx1678_cur."!mark_push"(0, rx1678_pos, $I10)
  # rx literal  "++"
    add $I11, rx1678_pos, 2
    gt $I11, rx1678_eos, rx1678_fail
    sub $I11, rx1678_pos, rx1678_off
    substr $S10, rx1678_tgt, $I11, 2
    ne $S10, "++", rx1678_fail
    add rx1678_pos, 2
    set_addr $I10, rxcap_1681_fail
    ($I12, $I11) = rx1678_cur."!mark_peek"($I10)
    rx1678_cur."!cursor_pos"($I11)
    ($P10) = rx1678_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1678_pos, "")
    rx1678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1681_done
  rxcap_1681_fail:
    goto rx1678_fail
  rxcap_1681_done:
  # rx subrule "O" subtype=capture negate=
    rx1678_cur."!cursor_pos"(rx1678_pos)
    $P10 = rx1678_cur."O"("%autoincrement")
    unless $P10, rx1678_fail
    rx1678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1678_pos = $P10."pos"()
  # rx pass
    rx1678_cur."!cursor_pass"(rx1678_pos, "postfix:sym<++>")
    if_null rx1678_debug, debug_855
    rx1678_cur."!cursor_debug"("PASS", "postfix:sym<++>", " at pos=", rx1678_pos)
  debug_855:
    .return (rx1678_cur)
  rx1678_restart:
.annotate 'line', 4
    if_null rx1678_debug, debug_856
    rx1678_cur."!cursor_debug"("NEXT", "postfix:sym<++>")
  debug_856:
  rx1678_fail:
    (rx1678_rep, rx1678_pos, $I10, $P10) = rx1678_cur."!mark_fail"(0)
    lt rx1678_pos, -1, rx1678_done
    eq rx1678_pos, -1, rx1678_fail
    jump $I10
  rx1678_done:
    rx1678_cur."!cursor_fail"()
    if_null rx1678_debug, debug_857
    rx1678_cur."!cursor_debug"("FAIL", "postfix:sym<++>")
  debug_857:
    .return (rx1678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("265_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "++")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("266_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1683_tgt
    .local int rx1683_pos
    .local int rx1683_off
    .local int rx1683_eos
    .local int rx1683_rep
    .local pmc rx1683_cur
    .local pmc rx1683_debug
    (rx1683_cur, rx1683_pos, rx1683_tgt, $I10) = self."!cursor_start"()
    getattribute rx1683_debug, rx1683_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1683_cur
    .local pmc match
    .lex "$/", match
    length rx1683_eos, rx1683_tgt
    gt rx1683_pos, rx1683_eos, rx1683_done
    set rx1683_off, 0
    lt rx1683_pos, 2, rx1683_start
    sub rx1683_off, rx1683_pos, 1
    substr rx1683_tgt, rx1683_tgt, rx1683_off
  rx1683_start:
    eq $I10, 1, rx1683_restart
    if_null rx1683_debug, debug_858
    rx1683_cur."!cursor_debug"("START", "postfix:sym<-->")
  debug_858:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1685_done
    goto rxscan1685_scan
  rxscan1685_loop:
    ($P10) = rx1683_cur."from"()
    inc $P10
    set rx1683_pos, $P10
    ge rx1683_pos, rx1683_eos, rxscan1685_done
  rxscan1685_scan:
    set_addr $I10, rxscan1685_loop
    rx1683_cur."!mark_push"(0, rx1683_pos, $I10)
  rxscan1685_done:
.annotate 'line', 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1686_fail
    rx1683_cur."!mark_push"(0, rx1683_pos, $I10)
  # rx literal  "--"
    add $I11, rx1683_pos, 2
    gt $I11, rx1683_eos, rx1683_fail
    sub $I11, rx1683_pos, rx1683_off
    substr $S10, rx1683_tgt, $I11, 2
    ne $S10, "--", rx1683_fail
    add rx1683_pos, 2
    set_addr $I10, rxcap_1686_fail
    ($I12, $I11) = rx1683_cur."!mark_peek"($I10)
    rx1683_cur."!cursor_pos"($I11)
    ($P10) = rx1683_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1683_pos, "")
    rx1683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1686_done
  rxcap_1686_fail:
    goto rx1683_fail
  rxcap_1686_done:
  # rx subrule "O" subtype=capture negate=
    rx1683_cur."!cursor_pos"(rx1683_pos)
    $P10 = rx1683_cur."O"("%autoincrement")
    unless $P10, rx1683_fail
    rx1683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1683_pos = $P10."pos"()
  # rx pass
    rx1683_cur."!cursor_pass"(rx1683_pos, "postfix:sym<-->")
    if_null rx1683_debug, debug_859
    rx1683_cur."!cursor_debug"("PASS", "postfix:sym<-->", " at pos=", rx1683_pos)
  debug_859:
    .return (rx1683_cur)
  rx1683_restart:
.annotate 'line', 4
    if_null rx1683_debug, debug_860
    rx1683_cur."!cursor_debug"("NEXT", "postfix:sym<-->")
  debug_860:
  rx1683_fail:
    (rx1683_rep, rx1683_pos, $I10, $P10) = rx1683_cur."!mark_fail"(0)
    lt rx1683_pos, -1, rx1683_done
    eq rx1683_pos, -1, rx1683_fail
    jump $I10
  rx1683_done:
    rx1683_cur."!cursor_fail"()
    if_null rx1683_debug, debug_861
    rx1683_cur."!cursor_debug"("FAIL", "postfix:sym<-->")
  debug_861:
    .return (rx1683_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("267_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "--")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("268_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1688_tgt
    .local int rx1688_pos
    .local int rx1688_off
    .local int rx1688_eos
    .local int rx1688_rep
    .local pmc rx1688_cur
    .local pmc rx1688_debug
    (rx1688_cur, rx1688_pos, rx1688_tgt, $I10) = self."!cursor_start"()
    getattribute rx1688_debug, rx1688_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1688_cur
    .local pmc match
    .lex "$/", match
    length rx1688_eos, rx1688_tgt
    gt rx1688_pos, rx1688_eos, rx1688_done
    set rx1688_off, 0
    lt rx1688_pos, 2, rx1688_start
    sub rx1688_off, rx1688_pos, 1
    substr rx1688_tgt, rx1688_tgt, rx1688_off
  rx1688_start:
    eq $I10, 1, rx1688_restart
    if_null rx1688_debug, debug_862
    rx1688_cur."!cursor_debug"("START", "infix:sym<**>")
  debug_862:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1690_done
    goto rxscan1690_scan
  rxscan1690_loop:
    ($P10) = rx1688_cur."from"()
    inc $P10
    set rx1688_pos, $P10
    ge rx1688_pos, rx1688_eos, rxscan1690_done
  rxscan1690_scan:
    set_addr $I10, rxscan1690_loop
    rx1688_cur."!mark_push"(0, rx1688_pos, $I10)
  rxscan1690_done:
.annotate 'line', 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1691_fail
    rx1688_cur."!mark_push"(0, rx1688_pos, $I10)
  # rx literal  "**"
    add $I11, rx1688_pos, 2
    gt $I11, rx1688_eos, rx1688_fail
    sub $I11, rx1688_pos, rx1688_off
    substr $S10, rx1688_tgt, $I11, 2
    ne $S10, "**", rx1688_fail
    add rx1688_pos, 2
    set_addr $I10, rxcap_1691_fail
    ($I12, $I11) = rx1688_cur."!mark_peek"($I10)
    rx1688_cur."!cursor_pos"($I11)
    ($P10) = rx1688_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1688_pos, "")
    rx1688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1691_done
  rxcap_1691_fail:
    goto rx1688_fail
  rxcap_1691_done:
  # rx subrule "O" subtype=capture negate=
    rx1688_cur."!cursor_pos"(rx1688_pos)
    $P10 = rx1688_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx1688_fail
    rx1688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1688_pos = $P10."pos"()
  # rx pass
    rx1688_cur."!cursor_pass"(rx1688_pos, "infix:sym<**>")
    if_null rx1688_debug, debug_863
    rx1688_cur."!cursor_debug"("PASS", "infix:sym<**>", " at pos=", rx1688_pos)
  debug_863:
    .return (rx1688_cur)
  rx1688_restart:
.annotate 'line', 4
    if_null rx1688_debug, debug_864
    rx1688_cur."!cursor_debug"("NEXT", "infix:sym<**>")
  debug_864:
  rx1688_fail:
    (rx1688_rep, rx1688_pos, $I10, $P10) = rx1688_cur."!mark_fail"(0)
    lt rx1688_pos, -1, rx1688_done
    eq rx1688_pos, -1, rx1688_fail
    jump $I10
  rx1688_done:
    rx1688_cur."!cursor_fail"()
    if_null rx1688_debug, debug_865
    rx1688_cur."!cursor_debug"("FAIL", "infix:sym<**>")
  debug_865:
    .return (rx1688_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("269_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "**")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("270_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1693_tgt
    .local int rx1693_pos
    .local int rx1693_off
    .local int rx1693_eos
    .local int rx1693_rep
    .local pmc rx1693_cur
    .local pmc rx1693_debug
    (rx1693_cur, rx1693_pos, rx1693_tgt, $I10) = self."!cursor_start"()
    getattribute rx1693_debug, rx1693_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1693_cur
    .local pmc match
    .lex "$/", match
    length rx1693_eos, rx1693_tgt
    gt rx1693_pos, rx1693_eos, rx1693_done
    set rx1693_off, 0
    lt rx1693_pos, 2, rx1693_start
    sub rx1693_off, rx1693_pos, 1
    substr rx1693_tgt, rx1693_tgt, rx1693_off
  rx1693_start:
    eq $I10, 1, rx1693_restart
    if_null rx1693_debug, debug_866
    rx1693_cur."!cursor_debug"("START", "prefix:sym<+>")
  debug_866:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1695_done
    goto rxscan1695_scan
  rxscan1695_loop:
    ($P10) = rx1693_cur."from"()
    inc $P10
    set rx1693_pos, $P10
    ge rx1693_pos, rx1693_eos, rxscan1695_done
  rxscan1695_scan:
    set_addr $I10, rxscan1695_loop
    rx1693_cur."!mark_push"(0, rx1693_pos, $I10)
  rxscan1695_done:
.annotate 'line', 508
  # rx subcapture "sym"
    set_addr $I10, rxcap_1696_fail
    rx1693_cur."!mark_push"(0, rx1693_pos, $I10)
  # rx literal  "+"
    add $I11, rx1693_pos, 1
    gt $I11, rx1693_eos, rx1693_fail
    sub $I11, rx1693_pos, rx1693_off
    ord $I11, rx1693_tgt, $I11
    ne $I11, 43, rx1693_fail
    add rx1693_pos, 1
    set_addr $I10, rxcap_1696_fail
    ($I12, $I11) = rx1693_cur."!mark_peek"($I10)
    rx1693_cur."!cursor_pos"($I11)
    ($P10) = rx1693_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1693_pos, "")
    rx1693_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1696_done
  rxcap_1696_fail:
    goto rx1693_fail
  rxcap_1696_done:
  # rx subrule "O" subtype=capture negate=
    rx1693_cur."!cursor_pos"(rx1693_pos)
    $P10 = rx1693_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx1693_fail
    rx1693_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1693_pos = $P10."pos"()
  # rx pass
    rx1693_cur."!cursor_pass"(rx1693_pos, "prefix:sym<+>")
    if_null rx1693_debug, debug_867
    rx1693_cur."!cursor_debug"("PASS", "prefix:sym<+>", " at pos=", rx1693_pos)
  debug_867:
    .return (rx1693_cur)
  rx1693_restart:
.annotate 'line', 4
    if_null rx1693_debug, debug_868
    rx1693_cur."!cursor_debug"("NEXT", "prefix:sym<+>")
  debug_868:
  rx1693_fail:
    (rx1693_rep, rx1693_pos, $I10, $P10) = rx1693_cur."!mark_fail"(0)
    lt rx1693_pos, -1, rx1693_done
    eq rx1693_pos, -1, rx1693_fail
    jump $I10
  rx1693_done:
    rx1693_cur."!cursor_fail"()
    if_null rx1693_debug, debug_869
    rx1693_cur."!cursor_debug"("FAIL", "prefix:sym<+>")
  debug_869:
    .return (rx1693_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("271_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "+")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("272_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1698_tgt
    .local int rx1698_pos
    .local int rx1698_off
    .local int rx1698_eos
    .local int rx1698_rep
    .local pmc rx1698_cur
    .local pmc rx1698_debug
    (rx1698_cur, rx1698_pos, rx1698_tgt, $I10) = self."!cursor_start"()
    getattribute rx1698_debug, rx1698_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1698_cur
    .local pmc match
    .lex "$/", match
    length rx1698_eos, rx1698_tgt
    gt rx1698_pos, rx1698_eos, rx1698_done
    set rx1698_off, 0
    lt rx1698_pos, 2, rx1698_start
    sub rx1698_off, rx1698_pos, 1
    substr rx1698_tgt, rx1698_tgt, rx1698_off
  rx1698_start:
    eq $I10, 1, rx1698_restart
    if_null rx1698_debug, debug_870
    rx1698_cur."!cursor_debug"("START", "prefix:sym<~>")
  debug_870:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1700_done
    goto rxscan1700_scan
  rxscan1700_loop:
    ($P10) = rx1698_cur."from"()
    inc $P10
    set rx1698_pos, $P10
    ge rx1698_pos, rx1698_eos, rxscan1700_done
  rxscan1700_scan:
    set_addr $I10, rxscan1700_loop
    rx1698_cur."!mark_push"(0, rx1698_pos, $I10)
  rxscan1700_done:
.annotate 'line', 509
  # rx subcapture "sym"
    set_addr $I10, rxcap_1701_fail
    rx1698_cur."!mark_push"(0, rx1698_pos, $I10)
  # rx literal  "~"
    add $I11, rx1698_pos, 1
    gt $I11, rx1698_eos, rx1698_fail
    sub $I11, rx1698_pos, rx1698_off
    ord $I11, rx1698_tgt, $I11
    ne $I11, 126, rx1698_fail
    add rx1698_pos, 1
    set_addr $I10, rxcap_1701_fail
    ($I12, $I11) = rx1698_cur."!mark_peek"($I10)
    rx1698_cur."!cursor_pos"($I11)
    ($P10) = rx1698_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1698_pos, "")
    rx1698_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1701_done
  rxcap_1701_fail:
    goto rx1698_fail
  rxcap_1701_done:
  # rx subrule "O" subtype=capture negate=
    rx1698_cur."!cursor_pos"(rx1698_pos)
    $P10 = rx1698_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx1698_fail
    rx1698_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1698_pos = $P10."pos"()
  # rx pass
    rx1698_cur."!cursor_pass"(rx1698_pos, "prefix:sym<~>")
    if_null rx1698_debug, debug_871
    rx1698_cur."!cursor_debug"("PASS", "prefix:sym<~>", " at pos=", rx1698_pos)
  debug_871:
    .return (rx1698_cur)
  rx1698_restart:
.annotate 'line', 4
    if_null rx1698_debug, debug_872
    rx1698_cur."!cursor_debug"("NEXT", "prefix:sym<~>")
  debug_872:
  rx1698_fail:
    (rx1698_rep, rx1698_pos, $I10, $P10) = rx1698_cur."!mark_fail"(0)
    lt rx1698_pos, -1, rx1698_done
    eq rx1698_pos, -1, rx1698_fail
    jump $I10
  rx1698_done:
    rx1698_cur."!cursor_fail"()
    if_null rx1698_debug, debug_873
    rx1698_cur."!cursor_debug"("FAIL", "prefix:sym<~>")
  debug_873:
    .return (rx1698_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("273_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "~")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("274_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1703_tgt
    .local int rx1703_pos
    .local int rx1703_off
    .local int rx1703_eos
    .local int rx1703_rep
    .local pmc rx1703_cur
    .local pmc rx1703_debug
    (rx1703_cur, rx1703_pos, rx1703_tgt, $I10) = self."!cursor_start"()
    getattribute rx1703_debug, rx1703_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1703_cur
    .local pmc match
    .lex "$/", match
    length rx1703_eos, rx1703_tgt
    gt rx1703_pos, rx1703_eos, rx1703_done
    set rx1703_off, 0
    lt rx1703_pos, 2, rx1703_start
    sub rx1703_off, rx1703_pos, 1
    substr rx1703_tgt, rx1703_tgt, rx1703_off
  rx1703_start:
    eq $I10, 1, rx1703_restart
    if_null rx1703_debug, debug_874
    rx1703_cur."!cursor_debug"("START", "prefix:sym<->")
  debug_874:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1705_done
    goto rxscan1705_scan
  rxscan1705_loop:
    ($P10) = rx1703_cur."from"()
    inc $P10
    set rx1703_pos, $P10
    ge rx1703_pos, rx1703_eos, rxscan1705_done
  rxscan1705_scan:
    set_addr $I10, rxscan1705_loop
    rx1703_cur."!mark_push"(0, rx1703_pos, $I10)
  rxscan1705_done:
.annotate 'line', 510
  # rx subcapture "sym"
    set_addr $I10, rxcap_1706_fail
    rx1703_cur."!mark_push"(0, rx1703_pos, $I10)
  # rx literal  "-"
    add $I11, rx1703_pos, 1
    gt $I11, rx1703_eos, rx1703_fail
    sub $I11, rx1703_pos, rx1703_off
    ord $I11, rx1703_tgt, $I11
    ne $I11, 45, rx1703_fail
    add rx1703_pos, 1
    set_addr $I10, rxcap_1706_fail
    ($I12, $I11) = rx1703_cur."!mark_peek"($I10)
    rx1703_cur."!cursor_pos"($I11)
    ($P10) = rx1703_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1703_pos, "")
    rx1703_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1706_done
  rxcap_1706_fail:
    goto rx1703_fail
  rxcap_1706_done:
  # rx enumcharlist negate=1 zerowidth
    sub $I10, rx1703_pos, rx1703_off
    substr $S10, rx1703_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx1703_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx1703_cur."!cursor_pos"(rx1703_pos)
    $P10 = rx1703_cur."number"()
    if $P10, rx1703_fail
  # rx subrule "O" subtype=capture negate=
    rx1703_cur."!cursor_pos"(rx1703_pos)
    $P10 = rx1703_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx1703_fail
    rx1703_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1703_pos = $P10."pos"()
  # rx pass
    rx1703_cur."!cursor_pass"(rx1703_pos, "prefix:sym<->")
    if_null rx1703_debug, debug_875
    rx1703_cur."!cursor_debug"("PASS", "prefix:sym<->", " at pos=", rx1703_pos)
  debug_875:
    .return (rx1703_cur)
  rx1703_restart:
.annotate 'line', 4
    if_null rx1703_debug, debug_876
    rx1703_cur."!cursor_debug"("NEXT", "prefix:sym<->")
  debug_876:
  rx1703_fail:
    (rx1703_rep, rx1703_pos, $I10, $P10) = rx1703_cur."!mark_fail"(0)
    lt rx1703_pos, -1, rx1703_done
    eq rx1703_pos, -1, rx1703_fail
    jump $I10
  rx1703_done:
    rx1703_cur."!cursor_fail"()
    if_null rx1703_debug, debug_877
    rx1703_cur."!cursor_debug"("FAIL", "prefix:sym<->")
  debug_877:
    .return (rx1703_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("275_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "-"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("276_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1708_tgt
    .local int rx1708_pos
    .local int rx1708_off
    .local int rx1708_eos
    .local int rx1708_rep
    .local pmc rx1708_cur
    .local pmc rx1708_debug
    (rx1708_cur, rx1708_pos, rx1708_tgt, $I10) = self."!cursor_start"()
    getattribute rx1708_debug, rx1708_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1708_cur
    .local pmc match
    .lex "$/", match
    length rx1708_eos, rx1708_tgt
    gt rx1708_pos, rx1708_eos, rx1708_done
    set rx1708_off, 0
    lt rx1708_pos, 2, rx1708_start
    sub rx1708_off, rx1708_pos, 1
    substr rx1708_tgt, rx1708_tgt, rx1708_off
  rx1708_start:
    eq $I10, 1, rx1708_restart
    if_null rx1708_debug, debug_878
    rx1708_cur."!cursor_debug"("START", "prefix:sym<?>")
  debug_878:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1710_done
    goto rxscan1710_scan
  rxscan1710_loop:
    ($P10) = rx1708_cur."from"()
    inc $P10
    set rx1708_pos, $P10
    ge rx1708_pos, rx1708_eos, rxscan1710_done
  rxscan1710_scan:
    set_addr $I10, rxscan1710_loop
    rx1708_cur."!mark_push"(0, rx1708_pos, $I10)
  rxscan1710_done:
.annotate 'line', 511
  # rx subcapture "sym"
    set_addr $I10, rxcap_1711_fail
    rx1708_cur."!mark_push"(0, rx1708_pos, $I10)
  # rx literal  "?"
    add $I11, rx1708_pos, 1
    gt $I11, rx1708_eos, rx1708_fail
    sub $I11, rx1708_pos, rx1708_off
    ord $I11, rx1708_tgt, $I11
    ne $I11, 63, rx1708_fail
    add rx1708_pos, 1
    set_addr $I10, rxcap_1711_fail
    ($I12, $I11) = rx1708_cur."!mark_peek"($I10)
    rx1708_cur."!cursor_pos"($I11)
    ($P10) = rx1708_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1708_pos, "")
    rx1708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1711_done
  rxcap_1711_fail:
    goto rx1708_fail
  rxcap_1711_done:
  # rx subrule "O" subtype=capture negate=
    rx1708_cur."!cursor_pos"(rx1708_pos)
    $P10 = rx1708_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx1708_fail
    rx1708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1708_pos = $P10."pos"()
  # rx pass
    rx1708_cur."!cursor_pass"(rx1708_pos, "prefix:sym<?>")
    if_null rx1708_debug, debug_879
    rx1708_cur."!cursor_debug"("PASS", "prefix:sym<?>", " at pos=", rx1708_pos)
  debug_879:
    .return (rx1708_cur)
  rx1708_restart:
.annotate 'line', 4
    if_null rx1708_debug, debug_880
    rx1708_cur."!cursor_debug"("NEXT", "prefix:sym<?>")
  debug_880:
  rx1708_fail:
    (rx1708_rep, rx1708_pos, $I10, $P10) = rx1708_cur."!mark_fail"(0)
    lt rx1708_pos, -1, rx1708_done
    eq rx1708_pos, -1, rx1708_fail
    jump $I10
  rx1708_done:
    rx1708_cur."!cursor_fail"()
    if_null rx1708_debug, debug_881
    rx1708_cur."!cursor_debug"("FAIL", "prefix:sym<?>")
  debug_881:
    .return (rx1708_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("277_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "?")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("278_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1713_tgt
    .local int rx1713_pos
    .local int rx1713_off
    .local int rx1713_eos
    .local int rx1713_rep
    .local pmc rx1713_cur
    .local pmc rx1713_debug
    (rx1713_cur, rx1713_pos, rx1713_tgt, $I10) = self."!cursor_start"()
    getattribute rx1713_debug, rx1713_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1713_cur
    .local pmc match
    .lex "$/", match
    length rx1713_eos, rx1713_tgt
    gt rx1713_pos, rx1713_eos, rx1713_done
    set rx1713_off, 0
    lt rx1713_pos, 2, rx1713_start
    sub rx1713_off, rx1713_pos, 1
    substr rx1713_tgt, rx1713_tgt, rx1713_off
  rx1713_start:
    eq $I10, 1, rx1713_restart
    if_null rx1713_debug, debug_882
    rx1713_cur."!cursor_debug"("START", "prefix:sym<!>")
  debug_882:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1715_done
    goto rxscan1715_scan
  rxscan1715_loop:
    ($P10) = rx1713_cur."from"()
    inc $P10
    set rx1713_pos, $P10
    ge rx1713_pos, rx1713_eos, rxscan1715_done
  rxscan1715_scan:
    set_addr $I10, rxscan1715_loop
    rx1713_cur."!mark_push"(0, rx1713_pos, $I10)
  rxscan1715_done:
.annotate 'line', 512
  # rx subcapture "sym"
    set_addr $I10, rxcap_1716_fail
    rx1713_cur."!mark_push"(0, rx1713_pos, $I10)
  # rx literal  "!"
    add $I11, rx1713_pos, 1
    gt $I11, rx1713_eos, rx1713_fail
    sub $I11, rx1713_pos, rx1713_off
    ord $I11, rx1713_tgt, $I11
    ne $I11, 33, rx1713_fail
    add rx1713_pos, 1
    set_addr $I10, rxcap_1716_fail
    ($I12, $I11) = rx1713_cur."!mark_peek"($I10)
    rx1713_cur."!cursor_pos"($I11)
    ($P10) = rx1713_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1713_pos, "")
    rx1713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1716_done
  rxcap_1716_fail:
    goto rx1713_fail
  rxcap_1716_done:
  # rx subrule "O" subtype=capture negate=
    rx1713_cur."!cursor_pos"(rx1713_pos)
    $P10 = rx1713_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1713_fail
    rx1713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1713_pos = $P10."pos"()
  # rx pass
    rx1713_cur."!cursor_pass"(rx1713_pos, "prefix:sym<!>")
    if_null rx1713_debug, debug_883
    rx1713_cur."!cursor_debug"("PASS", "prefix:sym<!>", " at pos=", rx1713_pos)
  debug_883:
    .return (rx1713_cur)
  rx1713_restart:
.annotate 'line', 4
    if_null rx1713_debug, debug_884
    rx1713_cur."!cursor_debug"("NEXT", "prefix:sym<!>")
  debug_884:
  rx1713_fail:
    (rx1713_rep, rx1713_pos, $I10, $P10) = rx1713_cur."!mark_fail"(0)
    lt rx1713_pos, -1, rx1713_done
    eq rx1713_pos, -1, rx1713_fail
    jump $I10
  rx1713_done:
    rx1713_cur."!cursor_fail"()
    if_null rx1713_debug, debug_885
    rx1713_cur."!cursor_debug"("FAIL", "prefix:sym<!>")
  debug_885:
    .return (rx1713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("279_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "!")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("280_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1718_tgt
    .local int rx1718_pos
    .local int rx1718_off
    .local int rx1718_eos
    .local int rx1718_rep
    .local pmc rx1718_cur
    .local pmc rx1718_debug
    (rx1718_cur, rx1718_pos, rx1718_tgt, $I10) = self."!cursor_start"()
    getattribute rx1718_debug, rx1718_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1718_cur
    .local pmc match
    .lex "$/", match
    length rx1718_eos, rx1718_tgt
    gt rx1718_pos, rx1718_eos, rx1718_done
    set rx1718_off, 0
    lt rx1718_pos, 2, rx1718_start
    sub rx1718_off, rx1718_pos, 1
    substr rx1718_tgt, rx1718_tgt, rx1718_off
  rx1718_start:
    eq $I10, 1, rx1718_restart
    if_null rx1718_debug, debug_886
    rx1718_cur."!cursor_debug"("START", "prefix:sym<|>")
  debug_886:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1720_done
    goto rxscan1720_scan
  rxscan1720_loop:
    ($P10) = rx1718_cur."from"()
    inc $P10
    set rx1718_pos, $P10
    ge rx1718_pos, rx1718_eos, rxscan1720_done
  rxscan1720_scan:
    set_addr $I10, rxscan1720_loop
    rx1718_cur."!mark_push"(0, rx1718_pos, $I10)
  rxscan1720_done:
.annotate 'line', 513
  # rx subcapture "sym"
    set_addr $I10, rxcap_1721_fail
    rx1718_cur."!mark_push"(0, rx1718_pos, $I10)
  # rx literal  "|"
    add $I11, rx1718_pos, 1
    gt $I11, rx1718_eos, rx1718_fail
    sub $I11, rx1718_pos, rx1718_off
    ord $I11, rx1718_tgt, $I11
    ne $I11, 124, rx1718_fail
    add rx1718_pos, 1
    set_addr $I10, rxcap_1721_fail
    ($I12, $I11) = rx1718_cur."!mark_peek"($I10)
    rx1718_cur."!cursor_pos"($I11)
    ($P10) = rx1718_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1718_pos, "")
    rx1718_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1721_done
  rxcap_1721_fail:
    goto rx1718_fail
  rxcap_1721_done:
  # rx subrule "O" subtype=capture negate=
    rx1718_cur."!cursor_pos"(rx1718_pos)
    $P10 = rx1718_cur."O"("%symbolic_unary")
    unless $P10, rx1718_fail
    rx1718_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1718_pos = $P10."pos"()
  # rx pass
    rx1718_cur."!cursor_pass"(rx1718_pos, "prefix:sym<|>")
    if_null rx1718_debug, debug_887
    rx1718_cur."!cursor_debug"("PASS", "prefix:sym<|>", " at pos=", rx1718_pos)
  debug_887:
    .return (rx1718_cur)
  rx1718_restart:
.annotate 'line', 4
    if_null rx1718_debug, debug_888
    rx1718_cur."!cursor_debug"("NEXT", "prefix:sym<|>")
  debug_888:
  rx1718_fail:
    (rx1718_rep, rx1718_pos, $I10, $P10) = rx1718_cur."!mark_fail"(0)
    lt rx1718_pos, -1, rx1718_done
    eq rx1718_pos, -1, rx1718_fail
    jump $I10
  rx1718_done:
    rx1718_cur."!cursor_fail"()
    if_null rx1718_debug, debug_889
    rx1718_cur."!cursor_debug"("FAIL", "prefix:sym<|>")
  debug_889:
    .return (rx1718_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("281_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "|")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("282_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1723_tgt
    .local int rx1723_pos
    .local int rx1723_off
    .local int rx1723_eos
    .local int rx1723_rep
    .local pmc rx1723_cur
    .local pmc rx1723_debug
    (rx1723_cur, rx1723_pos, rx1723_tgt, $I10) = self."!cursor_start"()
    getattribute rx1723_debug, rx1723_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1723_cur
    .local pmc match
    .lex "$/", match
    length rx1723_eos, rx1723_tgt
    gt rx1723_pos, rx1723_eos, rx1723_done
    set rx1723_off, 0
    lt rx1723_pos, 2, rx1723_start
    sub rx1723_off, rx1723_pos, 1
    substr rx1723_tgt, rx1723_tgt, rx1723_off
  rx1723_start:
    eq $I10, 1, rx1723_restart
    if_null rx1723_debug, debug_890
    rx1723_cur."!cursor_debug"("START", "infix:sym<*>")
  debug_890:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1725_done
    goto rxscan1725_scan
  rxscan1725_loop:
    ($P10) = rx1723_cur."from"()
    inc $P10
    set rx1723_pos, $P10
    ge rx1723_pos, rx1723_eos, rxscan1725_done
  rxscan1725_scan:
    set_addr $I10, rxscan1725_loop
    rx1723_cur."!mark_push"(0, rx1723_pos, $I10)
  rxscan1725_done:
.annotate 'line', 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1726_fail
    rx1723_cur."!mark_push"(0, rx1723_pos, $I10)
  # rx literal  "*"
    add $I11, rx1723_pos, 1
    gt $I11, rx1723_eos, rx1723_fail
    sub $I11, rx1723_pos, rx1723_off
    ord $I11, rx1723_tgt, $I11
    ne $I11, 42, rx1723_fail
    add rx1723_pos, 1
    set_addr $I10, rxcap_1726_fail
    ($I12, $I11) = rx1723_cur."!mark_peek"($I10)
    rx1723_cur."!cursor_pos"($I11)
    ($P10) = rx1723_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1723_pos, "")
    rx1723_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1726_done
  rxcap_1726_fail:
    goto rx1723_fail
  rxcap_1726_done:
  # rx subrule "O" subtype=capture negate=
    rx1723_cur."!cursor_pos"(rx1723_pos)
    $P10 = rx1723_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1723_fail
    rx1723_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1723_pos = $P10."pos"()
  # rx pass
    rx1723_cur."!cursor_pass"(rx1723_pos, "infix:sym<*>")
    if_null rx1723_debug, debug_891
    rx1723_cur."!cursor_debug"("PASS", "infix:sym<*>", " at pos=", rx1723_pos)
  debug_891:
    .return (rx1723_cur)
  rx1723_restart:
.annotate 'line', 4
    if_null rx1723_debug, debug_892
    rx1723_cur."!cursor_debug"("NEXT", "infix:sym<*>")
  debug_892:
  rx1723_fail:
    (rx1723_rep, rx1723_pos, $I10, $P10) = rx1723_cur."!mark_fail"(0)
    lt rx1723_pos, -1, rx1723_done
    eq rx1723_pos, -1, rx1723_fail
    jump $I10
  rx1723_done:
    rx1723_cur."!cursor_fail"()
    if_null rx1723_debug, debug_893
    rx1723_cur."!cursor_debug"("FAIL", "infix:sym<*>")
  debug_893:
    .return (rx1723_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("283_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "*")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("284_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1728_tgt
    .local int rx1728_pos
    .local int rx1728_off
    .local int rx1728_eos
    .local int rx1728_rep
    .local pmc rx1728_cur
    .local pmc rx1728_debug
    (rx1728_cur, rx1728_pos, rx1728_tgt, $I10) = self."!cursor_start"()
    getattribute rx1728_debug, rx1728_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1728_cur
    .local pmc match
    .lex "$/", match
    length rx1728_eos, rx1728_tgt
    gt rx1728_pos, rx1728_eos, rx1728_done
    set rx1728_off, 0
    lt rx1728_pos, 2, rx1728_start
    sub rx1728_off, rx1728_pos, 1
    substr rx1728_tgt, rx1728_tgt, rx1728_off
  rx1728_start:
    eq $I10, 1, rx1728_restart
    if_null rx1728_debug, debug_894
    rx1728_cur."!cursor_debug"("START", "infix:sym</>")
  debug_894:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1730_done
    goto rxscan1730_scan
  rxscan1730_loop:
    ($P10) = rx1728_cur."from"()
    inc $P10
    set rx1728_pos, $P10
    ge rx1728_pos, rx1728_eos, rxscan1730_done
  rxscan1730_scan:
    set_addr $I10, rxscan1730_loop
    rx1728_cur."!mark_push"(0, rx1728_pos, $I10)
  rxscan1730_done:
.annotate 'line', 516
  # rx subcapture "sym"
    set_addr $I10, rxcap_1731_fail
    rx1728_cur."!mark_push"(0, rx1728_pos, $I10)
  # rx literal  "/"
    add $I11, rx1728_pos, 1
    gt $I11, rx1728_eos, rx1728_fail
    sub $I11, rx1728_pos, rx1728_off
    ord $I11, rx1728_tgt, $I11
    ne $I11, 47, rx1728_fail
    add rx1728_pos, 1
    set_addr $I10, rxcap_1731_fail
    ($I12, $I11) = rx1728_cur."!mark_peek"($I10)
    rx1728_cur."!cursor_pos"($I11)
    ($P10) = rx1728_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1728_pos, "")
    rx1728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1731_done
  rxcap_1731_fail:
    goto rx1728_fail
  rxcap_1731_done:
  # rx subrule "O" subtype=capture negate=
    rx1728_cur."!cursor_pos"(rx1728_pos)
    $P10 = rx1728_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1728_fail
    rx1728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1728_pos = $P10."pos"()
  # rx pass
    rx1728_cur."!cursor_pass"(rx1728_pos, "infix:sym</>")
    if_null rx1728_debug, debug_895
    rx1728_cur."!cursor_debug"("PASS", "infix:sym</>", " at pos=", rx1728_pos)
  debug_895:
    .return (rx1728_cur)
  rx1728_restart:
.annotate 'line', 4
    if_null rx1728_debug, debug_896
    rx1728_cur."!cursor_debug"("NEXT", "infix:sym</>")
  debug_896:
  rx1728_fail:
    (rx1728_rep, rx1728_pos, $I10, $P10) = rx1728_cur."!mark_fail"(0)
    lt rx1728_pos, -1, rx1728_done
    eq rx1728_pos, -1, rx1728_fail
    jump $I10
  rx1728_done:
    rx1728_cur."!cursor_fail"()
    if_null rx1728_debug, debug_897
    rx1728_cur."!cursor_debug"("FAIL", "infix:sym</>")
  debug_897:
    .return (rx1728_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("285_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "/")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("286_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1733_tgt
    .local int rx1733_pos
    .local int rx1733_off
    .local int rx1733_eos
    .local int rx1733_rep
    .local pmc rx1733_cur
    .local pmc rx1733_debug
    (rx1733_cur, rx1733_pos, rx1733_tgt, $I10) = self."!cursor_start"()
    getattribute rx1733_debug, rx1733_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1733_cur
    .local pmc match
    .lex "$/", match
    length rx1733_eos, rx1733_tgt
    gt rx1733_pos, rx1733_eos, rx1733_done
    set rx1733_off, 0
    lt rx1733_pos, 2, rx1733_start
    sub rx1733_off, rx1733_pos, 1
    substr rx1733_tgt, rx1733_tgt, rx1733_off
  rx1733_start:
    eq $I10, 1, rx1733_restart
    if_null rx1733_debug, debug_898
    rx1733_cur."!cursor_debug"("START", "infix:sym<%>")
  debug_898:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1735_done
    goto rxscan1735_scan
  rxscan1735_loop:
    ($P10) = rx1733_cur."from"()
    inc $P10
    set rx1733_pos, $P10
    ge rx1733_pos, rx1733_eos, rxscan1735_done
  rxscan1735_scan:
    set_addr $I10, rxscan1735_loop
    rx1733_cur."!mark_push"(0, rx1733_pos, $I10)
  rxscan1735_done:
.annotate 'line', 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1736_fail
    rx1733_cur."!mark_push"(0, rx1733_pos, $I10)
  # rx literal  "%"
    add $I11, rx1733_pos, 1
    gt $I11, rx1733_eos, rx1733_fail
    sub $I11, rx1733_pos, rx1733_off
    ord $I11, rx1733_tgt, $I11
    ne $I11, 37, rx1733_fail
    add rx1733_pos, 1
    set_addr $I10, rxcap_1736_fail
    ($I12, $I11) = rx1733_cur."!mark_peek"($I10)
    rx1733_cur."!cursor_pos"($I11)
    ($P10) = rx1733_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1733_pos, "")
    rx1733_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1736_done
  rxcap_1736_fail:
    goto rx1733_fail
  rxcap_1736_done:
  # rx subrule "O" subtype=capture negate=
    rx1733_cur."!cursor_pos"(rx1733_pos)
    $P10 = rx1733_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1733_fail
    rx1733_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1733_pos = $P10."pos"()
  # rx pass
    rx1733_cur."!cursor_pass"(rx1733_pos, "infix:sym<%>")
    if_null rx1733_debug, debug_899
    rx1733_cur."!cursor_debug"("PASS", "infix:sym<%>", " at pos=", rx1733_pos)
  debug_899:
    .return (rx1733_cur)
  rx1733_restart:
.annotate 'line', 4
    if_null rx1733_debug, debug_900
    rx1733_cur."!cursor_debug"("NEXT", "infix:sym<%>")
  debug_900:
  rx1733_fail:
    (rx1733_rep, rx1733_pos, $I10, $P10) = rx1733_cur."!mark_fail"(0)
    lt rx1733_pos, -1, rx1733_done
    eq rx1733_pos, -1, rx1733_fail
    jump $I10
  rx1733_done:
    rx1733_cur."!cursor_fail"()
    if_null rx1733_debug, debug_901
    rx1733_cur."!cursor_debug"("FAIL", "infix:sym<%>")
  debug_901:
    .return (rx1733_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("287_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "%")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+&>"  :subid("288_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1738_tgt
    .local int rx1738_pos
    .local int rx1738_off
    .local int rx1738_eos
    .local int rx1738_rep
    .local pmc rx1738_cur
    .local pmc rx1738_debug
    (rx1738_cur, rx1738_pos, rx1738_tgt, $I10) = self."!cursor_start"()
    getattribute rx1738_debug, rx1738_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1738_cur
    .local pmc match
    .lex "$/", match
    length rx1738_eos, rx1738_tgt
    gt rx1738_pos, rx1738_eos, rx1738_done
    set rx1738_off, 0
    lt rx1738_pos, 2, rx1738_start
    sub rx1738_off, rx1738_pos, 1
    substr rx1738_tgt, rx1738_tgt, rx1738_off
  rx1738_start:
    eq $I10, 1, rx1738_restart
    if_null rx1738_debug, debug_902
    rx1738_cur."!cursor_debug"("START", "infix:sym<+&>")
  debug_902:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1740_done
    goto rxscan1740_scan
  rxscan1740_loop:
    ($P10) = rx1738_cur."from"()
    inc $P10
    set rx1738_pos, $P10
    ge rx1738_pos, rx1738_eos, rxscan1740_done
  rxscan1740_scan:
    set_addr $I10, rxscan1740_loop
    rx1738_cur."!mark_push"(0, rx1738_pos, $I10)
  rxscan1740_done:
.annotate 'line', 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1741_fail
    rx1738_cur."!mark_push"(0, rx1738_pos, $I10)
  # rx literal  "+&"
    add $I11, rx1738_pos, 2
    gt $I11, rx1738_eos, rx1738_fail
    sub $I11, rx1738_pos, rx1738_off
    substr $S10, rx1738_tgt, $I11, 2
    ne $S10, "+&", rx1738_fail
    add rx1738_pos, 2
    set_addr $I10, rxcap_1741_fail
    ($I12, $I11) = rx1738_cur."!mark_peek"($I10)
    rx1738_cur."!cursor_pos"($I11)
    ($P10) = rx1738_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1738_pos, "")
    rx1738_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1741_done
  rxcap_1741_fail:
    goto rx1738_fail
  rxcap_1741_done:
  # rx subrule "O" subtype=capture negate=
    rx1738_cur."!cursor_pos"(rx1738_pos)
    $P10 = rx1738_cur."O"("%multiplicative, :pirop<band III>")
    unless $P10, rx1738_fail
    rx1738_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1738_pos = $P10."pos"()
  # rx pass
    rx1738_cur."!cursor_pass"(rx1738_pos, "infix:sym<+&>")
    if_null rx1738_debug, debug_903
    rx1738_cur."!cursor_debug"("PASS", "infix:sym<+&>", " at pos=", rx1738_pos)
  debug_903:
    .return (rx1738_cur)
  rx1738_restart:
.annotate 'line', 4
    if_null rx1738_debug, debug_904
    rx1738_cur."!cursor_debug"("NEXT", "infix:sym<+&>")
  debug_904:
  rx1738_fail:
    (rx1738_rep, rx1738_pos, $I10, $P10) = rx1738_cur."!mark_fail"(0)
    lt rx1738_pos, -1, rx1738_done
    eq rx1738_pos, -1, rx1738_fail
    jump $I10
  rx1738_done:
    rx1738_cur."!cursor_fail"()
    if_null rx1738_debug, debug_905
    rx1738_cur."!cursor_debug"("FAIL", "infix:sym<+&>")
  debug_905:
    .return (rx1738_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+&>"  :subid("289_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "+&")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("290_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1743_tgt
    .local int rx1743_pos
    .local int rx1743_off
    .local int rx1743_eos
    .local int rx1743_rep
    .local pmc rx1743_cur
    .local pmc rx1743_debug
    (rx1743_cur, rx1743_pos, rx1743_tgt, $I10) = self."!cursor_start"()
    getattribute rx1743_debug, rx1743_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1743_cur
    .local pmc match
    .lex "$/", match
    length rx1743_eos, rx1743_tgt
    gt rx1743_pos, rx1743_eos, rx1743_done
    set rx1743_off, 0
    lt rx1743_pos, 2, rx1743_start
    sub rx1743_off, rx1743_pos, 1
    substr rx1743_tgt, rx1743_tgt, rx1743_off
  rx1743_start:
    eq $I10, 1, rx1743_restart
    if_null rx1743_debug, debug_906
    rx1743_cur."!cursor_debug"("START", "infix:sym<+>")
  debug_906:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1745_done
    goto rxscan1745_scan
  rxscan1745_loop:
    ($P10) = rx1743_cur."from"()
    inc $P10
    set rx1743_pos, $P10
    ge rx1743_pos, rx1743_eos, rxscan1745_done
  rxscan1745_scan:
    set_addr $I10, rxscan1745_loop
    rx1743_cur."!mark_push"(0, rx1743_pos, $I10)
  rxscan1745_done:
.annotate 'line', 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1746_fail
    rx1743_cur."!mark_push"(0, rx1743_pos, $I10)
  # rx literal  "+"
    add $I11, rx1743_pos, 1
    gt $I11, rx1743_eos, rx1743_fail
    sub $I11, rx1743_pos, rx1743_off
    ord $I11, rx1743_tgt, $I11
    ne $I11, 43, rx1743_fail
    add rx1743_pos, 1
    set_addr $I10, rxcap_1746_fail
    ($I12, $I11) = rx1743_cur."!mark_peek"($I10)
    rx1743_cur."!cursor_pos"($I11)
    ($P10) = rx1743_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1743_pos, "")
    rx1743_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1746_done
  rxcap_1746_fail:
    goto rx1743_fail
  rxcap_1746_done:
  # rx subrule "O" subtype=capture negate=
    rx1743_cur."!cursor_pos"(rx1743_pos)
    $P10 = rx1743_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1743_fail
    rx1743_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1743_pos = $P10."pos"()
  # rx pass
    rx1743_cur."!cursor_pass"(rx1743_pos, "infix:sym<+>")
    if_null rx1743_debug, debug_907
    rx1743_cur."!cursor_debug"("PASS", "infix:sym<+>", " at pos=", rx1743_pos)
  debug_907:
    .return (rx1743_cur)
  rx1743_restart:
.annotate 'line', 4
    if_null rx1743_debug, debug_908
    rx1743_cur."!cursor_debug"("NEXT", "infix:sym<+>")
  debug_908:
  rx1743_fail:
    (rx1743_rep, rx1743_pos, $I10, $P10) = rx1743_cur."!mark_fail"(0)
    lt rx1743_pos, -1, rx1743_done
    eq rx1743_pos, -1, rx1743_fail
    jump $I10
  rx1743_done:
    rx1743_cur."!cursor_fail"()
    if_null rx1743_debug, debug_909
    rx1743_cur."!cursor_debug"("FAIL", "infix:sym<+>")
  debug_909:
    .return (rx1743_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("291_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "+")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("292_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1748_tgt
    .local int rx1748_pos
    .local int rx1748_off
    .local int rx1748_eos
    .local int rx1748_rep
    .local pmc rx1748_cur
    .local pmc rx1748_debug
    (rx1748_cur, rx1748_pos, rx1748_tgt, $I10) = self."!cursor_start"()
    getattribute rx1748_debug, rx1748_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1748_cur
    .local pmc match
    .lex "$/", match
    length rx1748_eos, rx1748_tgt
    gt rx1748_pos, rx1748_eos, rx1748_done
    set rx1748_off, 0
    lt rx1748_pos, 2, rx1748_start
    sub rx1748_off, rx1748_pos, 1
    substr rx1748_tgt, rx1748_tgt, rx1748_off
  rx1748_start:
    eq $I10, 1, rx1748_restart
    if_null rx1748_debug, debug_910
    rx1748_cur."!cursor_debug"("START", "infix:sym<->")
  debug_910:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1750_done
    goto rxscan1750_scan
  rxscan1750_loop:
    ($P10) = rx1748_cur."from"()
    inc $P10
    set rx1748_pos, $P10
    ge rx1748_pos, rx1748_eos, rxscan1750_done
  rxscan1750_scan:
    set_addr $I10, rxscan1750_loop
    rx1748_cur."!mark_push"(0, rx1748_pos, $I10)
  rxscan1750_done:
.annotate 'line', 521
  # rx subcapture "sym"
    set_addr $I10, rxcap_1751_fail
    rx1748_cur."!mark_push"(0, rx1748_pos, $I10)
  # rx literal  "-"
    add $I11, rx1748_pos, 1
    gt $I11, rx1748_eos, rx1748_fail
    sub $I11, rx1748_pos, rx1748_off
    ord $I11, rx1748_tgt, $I11
    ne $I11, 45, rx1748_fail
    add rx1748_pos, 1
    set_addr $I10, rxcap_1751_fail
    ($I12, $I11) = rx1748_cur."!mark_peek"($I10)
    rx1748_cur."!cursor_pos"($I11)
    ($P10) = rx1748_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1748_pos, "")
    rx1748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1751_done
  rxcap_1751_fail:
    goto rx1748_fail
  rxcap_1751_done:
  # rx subrule "O" subtype=capture negate=
    rx1748_cur."!cursor_pos"(rx1748_pos)
    $P10 = rx1748_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1748_fail
    rx1748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1748_pos = $P10."pos"()
  # rx pass
    rx1748_cur."!cursor_pass"(rx1748_pos, "infix:sym<->")
    if_null rx1748_debug, debug_911
    rx1748_cur."!cursor_debug"("PASS", "infix:sym<->", " at pos=", rx1748_pos)
  debug_911:
    .return (rx1748_cur)
  rx1748_restart:
.annotate 'line', 4
    if_null rx1748_debug, debug_912
    rx1748_cur."!cursor_debug"("NEXT", "infix:sym<->")
  debug_912:
  rx1748_fail:
    (rx1748_rep, rx1748_pos, $I10, $P10) = rx1748_cur."!mark_fail"(0)
    lt rx1748_pos, -1, rx1748_done
    eq rx1748_pos, -1, rx1748_fail
    jump $I10
  rx1748_done:
    rx1748_cur."!cursor_fail"()
    if_null rx1748_debug, debug_913
    rx1748_cur."!cursor_debug"("FAIL", "infix:sym<->")
  debug_913:
    .return (rx1748_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("293_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "-")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+|>"  :subid("294_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1753_tgt
    .local int rx1753_pos
    .local int rx1753_off
    .local int rx1753_eos
    .local int rx1753_rep
    .local pmc rx1753_cur
    .local pmc rx1753_debug
    (rx1753_cur, rx1753_pos, rx1753_tgt, $I10) = self."!cursor_start"()
    getattribute rx1753_debug, rx1753_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1753_cur
    .local pmc match
    .lex "$/", match
    length rx1753_eos, rx1753_tgt
    gt rx1753_pos, rx1753_eos, rx1753_done
    set rx1753_off, 0
    lt rx1753_pos, 2, rx1753_start
    sub rx1753_off, rx1753_pos, 1
    substr rx1753_tgt, rx1753_tgt, rx1753_off
  rx1753_start:
    eq $I10, 1, rx1753_restart
    if_null rx1753_debug, debug_914
    rx1753_cur."!cursor_debug"("START", "infix:sym<+|>")
  debug_914:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1755_done
    goto rxscan1755_scan
  rxscan1755_loop:
    ($P10) = rx1753_cur."from"()
    inc $P10
    set rx1753_pos, $P10
    ge rx1753_pos, rx1753_eos, rxscan1755_done
  rxscan1755_scan:
    set_addr $I10, rxscan1755_loop
    rx1753_cur."!mark_push"(0, rx1753_pos, $I10)
  rxscan1755_done:
.annotate 'line', 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1756_fail
    rx1753_cur."!mark_push"(0, rx1753_pos, $I10)
  # rx literal  "+|"
    add $I11, rx1753_pos, 2
    gt $I11, rx1753_eos, rx1753_fail
    sub $I11, rx1753_pos, rx1753_off
    substr $S10, rx1753_tgt, $I11, 2
    ne $S10, "+|", rx1753_fail
    add rx1753_pos, 2
    set_addr $I10, rxcap_1756_fail
    ($I12, $I11) = rx1753_cur."!mark_peek"($I10)
    rx1753_cur."!cursor_pos"($I11)
    ($P10) = rx1753_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1753_pos, "")
    rx1753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1756_done
  rxcap_1756_fail:
    goto rx1753_fail
  rxcap_1756_done:
  # rx subrule "O" subtype=capture negate=
    rx1753_cur."!cursor_pos"(rx1753_pos)
    $P10 = rx1753_cur."O"("%additive, :pirop<bor III>")
    unless $P10, rx1753_fail
    rx1753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1753_pos = $P10."pos"()
  # rx pass
    rx1753_cur."!cursor_pass"(rx1753_pos, "infix:sym<+|>")
    if_null rx1753_debug, debug_915
    rx1753_cur."!cursor_debug"("PASS", "infix:sym<+|>", " at pos=", rx1753_pos)
  debug_915:
    .return (rx1753_cur)
  rx1753_restart:
.annotate 'line', 4
    if_null rx1753_debug, debug_916
    rx1753_cur."!cursor_debug"("NEXT", "infix:sym<+|>")
  debug_916:
  rx1753_fail:
    (rx1753_rep, rx1753_pos, $I10, $P10) = rx1753_cur."!mark_fail"(0)
    lt rx1753_pos, -1, rx1753_done
    eq rx1753_pos, -1, rx1753_fail
    jump $I10
  rx1753_done:
    rx1753_cur."!cursor_fail"()
    if_null rx1753_debug, debug_917
    rx1753_cur."!cursor_debug"("FAIL", "infix:sym<+|>")
  debug_917:
    .return (rx1753_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+|>"  :subid("295_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "+|")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+^>"  :subid("296_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1758_tgt
    .local int rx1758_pos
    .local int rx1758_off
    .local int rx1758_eos
    .local int rx1758_rep
    .local pmc rx1758_cur
    .local pmc rx1758_debug
    (rx1758_cur, rx1758_pos, rx1758_tgt, $I10) = self."!cursor_start"()
    getattribute rx1758_debug, rx1758_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1758_cur
    .local pmc match
    .lex "$/", match
    length rx1758_eos, rx1758_tgt
    gt rx1758_pos, rx1758_eos, rx1758_done
    set rx1758_off, 0
    lt rx1758_pos, 2, rx1758_start
    sub rx1758_off, rx1758_pos, 1
    substr rx1758_tgt, rx1758_tgt, rx1758_off
  rx1758_start:
    eq $I10, 1, rx1758_restart
    if_null rx1758_debug, debug_918
    rx1758_cur."!cursor_debug"("START", "infix:sym<+^>")
  debug_918:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1760_done
    goto rxscan1760_scan
  rxscan1760_loop:
    ($P10) = rx1758_cur."from"()
    inc $P10
    set rx1758_pos, $P10
    ge rx1758_pos, rx1758_eos, rxscan1760_done
  rxscan1760_scan:
    set_addr $I10, rxscan1760_loop
    rx1758_cur."!mark_push"(0, rx1758_pos, $I10)
  rxscan1760_done:
.annotate 'line', 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1761_fail
    rx1758_cur."!mark_push"(0, rx1758_pos, $I10)
  # rx literal  "+^"
    add $I11, rx1758_pos, 2
    gt $I11, rx1758_eos, rx1758_fail
    sub $I11, rx1758_pos, rx1758_off
    substr $S10, rx1758_tgt, $I11, 2
    ne $S10, "+^", rx1758_fail
    add rx1758_pos, 2
    set_addr $I10, rxcap_1761_fail
    ($I12, $I11) = rx1758_cur."!mark_peek"($I10)
    rx1758_cur."!cursor_pos"($I11)
    ($P10) = rx1758_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1758_pos, "")
    rx1758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1761_done
  rxcap_1761_fail:
    goto rx1758_fail
  rxcap_1761_done:
  # rx subrule "O" subtype=capture negate=
    rx1758_cur."!cursor_pos"(rx1758_pos)
    $P10 = rx1758_cur."O"("%additive, :pirop<bxor III>")
    unless $P10, rx1758_fail
    rx1758_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1758_pos = $P10."pos"()
  # rx pass
    rx1758_cur."!cursor_pass"(rx1758_pos, "infix:sym<+^>")
    if_null rx1758_debug, debug_919
    rx1758_cur."!cursor_debug"("PASS", "infix:sym<+^>", " at pos=", rx1758_pos)
  debug_919:
    .return (rx1758_cur)
  rx1758_restart:
.annotate 'line', 4
    if_null rx1758_debug, debug_920
    rx1758_cur."!cursor_debug"("NEXT", "infix:sym<+^>")
  debug_920:
  rx1758_fail:
    (rx1758_rep, rx1758_pos, $I10, $P10) = rx1758_cur."!mark_fail"(0)
    lt rx1758_pos, -1, rx1758_done
    eq rx1758_pos, -1, rx1758_fail
    jump $I10
  rx1758_done:
    rx1758_cur."!cursor_fail"()
    if_null rx1758_debug, debug_921
    rx1758_cur."!cursor_debug"("FAIL", "infix:sym<+^>")
  debug_921:
    .return (rx1758_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+^>"  :subid("297_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "+^")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("298_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1763_tgt
    .local int rx1763_pos
    .local int rx1763_off
    .local int rx1763_eos
    .local int rx1763_rep
    .local pmc rx1763_cur
    .local pmc rx1763_debug
    (rx1763_cur, rx1763_pos, rx1763_tgt, $I10) = self."!cursor_start"()
    getattribute rx1763_debug, rx1763_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1763_cur
    .local pmc match
    .lex "$/", match
    length rx1763_eos, rx1763_tgt
    gt rx1763_pos, rx1763_eos, rx1763_done
    set rx1763_off, 0
    lt rx1763_pos, 2, rx1763_start
    sub rx1763_off, rx1763_pos, 1
    substr rx1763_tgt, rx1763_tgt, rx1763_off
  rx1763_start:
    eq $I10, 1, rx1763_restart
    if_null rx1763_debug, debug_922
    rx1763_cur."!cursor_debug"("START", "infix:sym<~>")
  debug_922:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1765_done
    goto rxscan1765_scan
  rxscan1765_loop:
    ($P10) = rx1763_cur."from"()
    inc $P10
    set rx1763_pos, $P10
    ge rx1763_pos, rx1763_eos, rxscan1765_done
  rxscan1765_scan:
    set_addr $I10, rxscan1765_loop
    rx1763_cur."!mark_push"(0, rx1763_pos, $I10)
  rxscan1765_done:
.annotate 'line', 525
  # rx subcapture "sym"
    set_addr $I10, rxcap_1766_fail
    rx1763_cur."!mark_push"(0, rx1763_pos, $I10)
  # rx literal  "~"
    add $I11, rx1763_pos, 1
    gt $I11, rx1763_eos, rx1763_fail
    sub $I11, rx1763_pos, rx1763_off
    ord $I11, rx1763_tgt, $I11
    ne $I11, 126, rx1763_fail
    add rx1763_pos, 1
    set_addr $I10, rxcap_1766_fail
    ($I12, $I11) = rx1763_cur."!mark_peek"($I10)
    rx1763_cur."!cursor_pos"($I11)
    ($P10) = rx1763_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1763_pos, "")
    rx1763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1766_done
  rxcap_1766_fail:
    goto rx1763_fail
  rxcap_1766_done:
  # rx subrule "O" subtype=capture negate=
    rx1763_cur."!cursor_pos"(rx1763_pos)
    $P10 = rx1763_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1763_fail
    rx1763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1763_pos = $P10."pos"()
  # rx pass
    rx1763_cur."!cursor_pass"(rx1763_pos, "infix:sym<~>")
    if_null rx1763_debug, debug_923
    rx1763_cur."!cursor_debug"("PASS", "infix:sym<~>", " at pos=", rx1763_pos)
  debug_923:
    .return (rx1763_cur)
  rx1763_restart:
.annotate 'line', 4
    if_null rx1763_debug, debug_924
    rx1763_cur."!cursor_debug"("NEXT", "infix:sym<~>")
  debug_924:
  rx1763_fail:
    (rx1763_rep, rx1763_pos, $I10, $P10) = rx1763_cur."!mark_fail"(0)
    lt rx1763_pos, -1, rx1763_done
    eq rx1763_pos, -1, rx1763_fail
    jump $I10
  rx1763_done:
    rx1763_cur."!cursor_fail"()
    if_null rx1763_debug, debug_925
    rx1763_cur."!cursor_debug"("FAIL", "infix:sym<~>")
  debug_925:
    .return (rx1763_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("299_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "~")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("300_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1768_tgt
    .local int rx1768_pos
    .local int rx1768_off
    .local int rx1768_eos
    .local int rx1768_rep
    .local pmc rx1768_cur
    .local pmc rx1768_debug
    (rx1768_cur, rx1768_pos, rx1768_tgt, $I10) = self."!cursor_start"()
    getattribute rx1768_debug, rx1768_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1768_cur
    .local pmc match
    .lex "$/", match
    length rx1768_eos, rx1768_tgt
    gt rx1768_pos, rx1768_eos, rx1768_done
    set rx1768_off, 0
    lt rx1768_pos, 2, rx1768_start
    sub rx1768_off, rx1768_pos, 1
    substr rx1768_tgt, rx1768_tgt, rx1768_off
  rx1768_start:
    eq $I10, 1, rx1768_restart
    if_null rx1768_debug, debug_926
    rx1768_cur."!cursor_debug"("START", "infix:sym<==>")
  debug_926:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1770_done
    goto rxscan1770_scan
  rxscan1770_loop:
    ($P10) = rx1768_cur."from"()
    inc $P10
    set rx1768_pos, $P10
    ge rx1768_pos, rx1768_eos, rxscan1770_done
  rxscan1770_scan:
    set_addr $I10, rxscan1770_loop
    rx1768_cur."!mark_push"(0, rx1768_pos, $I10)
  rxscan1770_done:
.annotate 'line', 527
  # rx subcapture "sym"
    set_addr $I10, rxcap_1771_fail
    rx1768_cur."!mark_push"(0, rx1768_pos, $I10)
  # rx literal  "=="
    add $I11, rx1768_pos, 2
    gt $I11, rx1768_eos, rx1768_fail
    sub $I11, rx1768_pos, rx1768_off
    substr $S10, rx1768_tgt, $I11, 2
    ne $S10, "==", rx1768_fail
    add rx1768_pos, 2
    set_addr $I10, rxcap_1771_fail
    ($I12, $I11) = rx1768_cur."!mark_peek"($I10)
    rx1768_cur."!cursor_pos"($I11)
    ($P10) = rx1768_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1768_pos, "")
    rx1768_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1771_done
  rxcap_1771_fail:
    goto rx1768_fail
  rxcap_1771_done:
  # rx subrule "O" subtype=capture negate=
    rx1768_cur."!cursor_pos"(rx1768_pos)
    $P10 = rx1768_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1768_fail
    rx1768_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1768_pos = $P10."pos"()
  # rx pass
    rx1768_cur."!cursor_pass"(rx1768_pos, "infix:sym<==>")
    if_null rx1768_debug, debug_927
    rx1768_cur."!cursor_debug"("PASS", "infix:sym<==>", " at pos=", rx1768_pos)
  debug_927:
    .return (rx1768_cur)
  rx1768_restart:
.annotate 'line', 4
    if_null rx1768_debug, debug_928
    rx1768_cur."!cursor_debug"("NEXT", "infix:sym<==>")
  debug_928:
  rx1768_fail:
    (rx1768_rep, rx1768_pos, $I10, $P10) = rx1768_cur."!mark_fail"(0)
    lt rx1768_pos, -1, rx1768_done
    eq rx1768_pos, -1, rx1768_fail
    jump $I10
  rx1768_done:
    rx1768_cur."!cursor_fail"()
    if_null rx1768_debug, debug_929
    rx1768_cur."!cursor_debug"("FAIL", "infix:sym<==>")
  debug_929:
    .return (rx1768_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("301_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "==")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("302_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1773_tgt
    .local int rx1773_pos
    .local int rx1773_off
    .local int rx1773_eos
    .local int rx1773_rep
    .local pmc rx1773_cur
    .local pmc rx1773_debug
    (rx1773_cur, rx1773_pos, rx1773_tgt, $I10) = self."!cursor_start"()
    getattribute rx1773_debug, rx1773_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1773_cur
    .local pmc match
    .lex "$/", match
    length rx1773_eos, rx1773_tgt
    gt rx1773_pos, rx1773_eos, rx1773_done
    set rx1773_off, 0
    lt rx1773_pos, 2, rx1773_start
    sub rx1773_off, rx1773_pos, 1
    substr rx1773_tgt, rx1773_tgt, rx1773_off
  rx1773_start:
    eq $I10, 1, rx1773_restart
    if_null rx1773_debug, debug_930
    rx1773_cur."!cursor_debug"("START", "infix:sym<!=>")
  debug_930:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1775_done
    goto rxscan1775_scan
  rxscan1775_loop:
    ($P10) = rx1773_cur."from"()
    inc $P10
    set rx1773_pos, $P10
    ge rx1773_pos, rx1773_eos, rxscan1775_done
  rxscan1775_scan:
    set_addr $I10, rxscan1775_loop
    rx1773_cur."!mark_push"(0, rx1773_pos, $I10)
  rxscan1775_done:
.annotate 'line', 528
  # rx subcapture "sym"
    set_addr $I10, rxcap_1776_fail
    rx1773_cur."!mark_push"(0, rx1773_pos, $I10)
  # rx literal  "!="
    add $I11, rx1773_pos, 2
    gt $I11, rx1773_eos, rx1773_fail
    sub $I11, rx1773_pos, rx1773_off
    substr $S10, rx1773_tgt, $I11, 2
    ne $S10, "!=", rx1773_fail
    add rx1773_pos, 2
    set_addr $I10, rxcap_1776_fail
    ($I12, $I11) = rx1773_cur."!mark_peek"($I10)
    rx1773_cur."!cursor_pos"($I11)
    ($P10) = rx1773_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1773_pos, "")
    rx1773_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1776_done
  rxcap_1776_fail:
    goto rx1773_fail
  rxcap_1776_done:
  # rx subrule "O" subtype=capture negate=
    rx1773_cur."!cursor_pos"(rx1773_pos)
    $P10 = rx1773_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1773_fail
    rx1773_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1773_pos = $P10."pos"()
  # rx pass
    rx1773_cur."!cursor_pass"(rx1773_pos, "infix:sym<!=>")
    if_null rx1773_debug, debug_931
    rx1773_cur."!cursor_debug"("PASS", "infix:sym<!=>", " at pos=", rx1773_pos)
  debug_931:
    .return (rx1773_cur)
  rx1773_restart:
.annotate 'line', 4
    if_null rx1773_debug, debug_932
    rx1773_cur."!cursor_debug"("NEXT", "infix:sym<!=>")
  debug_932:
  rx1773_fail:
    (rx1773_rep, rx1773_pos, $I10, $P10) = rx1773_cur."!mark_fail"(0)
    lt rx1773_pos, -1, rx1773_done
    eq rx1773_pos, -1, rx1773_fail
    jump $I10
  rx1773_done:
    rx1773_cur."!cursor_fail"()
    if_null rx1773_debug, debug_933
    rx1773_cur."!cursor_debug"("FAIL", "infix:sym<!=>")
  debug_933:
    .return (rx1773_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("303_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "!=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("304_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1778_tgt
    .local int rx1778_pos
    .local int rx1778_off
    .local int rx1778_eos
    .local int rx1778_rep
    .local pmc rx1778_cur
    .local pmc rx1778_debug
    (rx1778_cur, rx1778_pos, rx1778_tgt, $I10) = self."!cursor_start"()
    getattribute rx1778_debug, rx1778_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1778_cur
    .local pmc match
    .lex "$/", match
    length rx1778_eos, rx1778_tgt
    gt rx1778_pos, rx1778_eos, rx1778_done
    set rx1778_off, 0
    lt rx1778_pos, 2, rx1778_start
    sub rx1778_off, rx1778_pos, 1
    substr rx1778_tgt, rx1778_tgt, rx1778_off
  rx1778_start:
    eq $I10, 1, rx1778_restart
    if_null rx1778_debug, debug_934
    rx1778_cur."!cursor_debug"("START", "infix:sym<<=>")
  debug_934:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1780_done
    goto rxscan1780_scan
  rxscan1780_loop:
    ($P10) = rx1778_cur."from"()
    inc $P10
    set rx1778_pos, $P10
    ge rx1778_pos, rx1778_eos, rxscan1780_done
  rxscan1780_scan:
    set_addr $I10, rxscan1780_loop
    rx1778_cur."!mark_push"(0, rx1778_pos, $I10)
  rxscan1780_done:
.annotate 'line', 529
  # rx subcapture "sym"
    set_addr $I10, rxcap_1781_fail
    rx1778_cur."!mark_push"(0, rx1778_pos, $I10)
  # rx literal  "<="
    add $I11, rx1778_pos, 2
    gt $I11, rx1778_eos, rx1778_fail
    sub $I11, rx1778_pos, rx1778_off
    substr $S10, rx1778_tgt, $I11, 2
    ne $S10, "<=", rx1778_fail
    add rx1778_pos, 2
    set_addr $I10, rxcap_1781_fail
    ($I12, $I11) = rx1778_cur."!mark_peek"($I10)
    rx1778_cur."!cursor_pos"($I11)
    ($P10) = rx1778_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1778_pos, "")
    rx1778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1781_done
  rxcap_1781_fail:
    goto rx1778_fail
  rxcap_1781_done:
  # rx subrule "O" subtype=capture negate=
    rx1778_cur."!cursor_pos"(rx1778_pos)
    $P10 = rx1778_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1778_fail
    rx1778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1778_pos = $P10."pos"()
  # rx pass
    rx1778_cur."!cursor_pass"(rx1778_pos, "infix:sym<<=>")
    if_null rx1778_debug, debug_935
    rx1778_cur."!cursor_debug"("PASS", "infix:sym<<=>", " at pos=", rx1778_pos)
  debug_935:
    .return (rx1778_cur)
  rx1778_restart:
.annotate 'line', 4
    if_null rx1778_debug, debug_936
    rx1778_cur."!cursor_debug"("NEXT", "infix:sym<<=>")
  debug_936:
  rx1778_fail:
    (rx1778_rep, rx1778_pos, $I10, $P10) = rx1778_cur."!mark_fail"(0)
    lt rx1778_pos, -1, rx1778_done
    eq rx1778_pos, -1, rx1778_fail
    jump $I10
  rx1778_done:
    rx1778_cur."!cursor_fail"()
    if_null rx1778_debug, debug_937
    rx1778_cur."!cursor_debug"("FAIL", "infix:sym<<=>")
  debug_937:
    .return (rx1778_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("305_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "<=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("306_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1783_tgt
    .local int rx1783_pos
    .local int rx1783_off
    .local int rx1783_eos
    .local int rx1783_rep
    .local pmc rx1783_cur
    .local pmc rx1783_debug
    (rx1783_cur, rx1783_pos, rx1783_tgt, $I10) = self."!cursor_start"()
    getattribute rx1783_debug, rx1783_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1783_cur
    .local pmc match
    .lex "$/", match
    length rx1783_eos, rx1783_tgt
    gt rx1783_pos, rx1783_eos, rx1783_done
    set rx1783_off, 0
    lt rx1783_pos, 2, rx1783_start
    sub rx1783_off, rx1783_pos, 1
    substr rx1783_tgt, rx1783_tgt, rx1783_off
  rx1783_start:
    eq $I10, 1, rx1783_restart
    if_null rx1783_debug, debug_938
    rx1783_cur."!cursor_debug"("START", "infix:sym<>=>")
  debug_938:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1785_done
    goto rxscan1785_scan
  rxscan1785_loop:
    ($P10) = rx1783_cur."from"()
    inc $P10
    set rx1783_pos, $P10
    ge rx1783_pos, rx1783_eos, rxscan1785_done
  rxscan1785_scan:
    set_addr $I10, rxscan1785_loop
    rx1783_cur."!mark_push"(0, rx1783_pos, $I10)
  rxscan1785_done:
.annotate 'line', 530
  # rx subcapture "sym"
    set_addr $I10, rxcap_1786_fail
    rx1783_cur."!mark_push"(0, rx1783_pos, $I10)
  # rx literal  ">="
    add $I11, rx1783_pos, 2
    gt $I11, rx1783_eos, rx1783_fail
    sub $I11, rx1783_pos, rx1783_off
    substr $S10, rx1783_tgt, $I11, 2
    ne $S10, ">=", rx1783_fail
    add rx1783_pos, 2
    set_addr $I10, rxcap_1786_fail
    ($I12, $I11) = rx1783_cur."!mark_peek"($I10)
    rx1783_cur."!cursor_pos"($I11)
    ($P10) = rx1783_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1783_pos, "")
    rx1783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1786_done
  rxcap_1786_fail:
    goto rx1783_fail
  rxcap_1786_done:
  # rx subrule "O" subtype=capture negate=
    rx1783_cur."!cursor_pos"(rx1783_pos)
    $P10 = rx1783_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1783_fail
    rx1783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1783_pos = $P10."pos"()
  # rx pass
    rx1783_cur."!cursor_pass"(rx1783_pos, "infix:sym<>=>")
    if_null rx1783_debug, debug_939
    rx1783_cur."!cursor_debug"("PASS", "infix:sym<>=>", " at pos=", rx1783_pos)
  debug_939:
    .return (rx1783_cur)
  rx1783_restart:
.annotate 'line', 4
    if_null rx1783_debug, debug_940
    rx1783_cur."!cursor_debug"("NEXT", "infix:sym<>=>")
  debug_940:
  rx1783_fail:
    (rx1783_rep, rx1783_pos, $I10, $P10) = rx1783_cur."!mark_fail"(0)
    lt rx1783_pos, -1, rx1783_done
    eq rx1783_pos, -1, rx1783_fail
    jump $I10
  rx1783_done:
    rx1783_cur."!cursor_fail"()
    if_null rx1783_debug, debug_941
    rx1783_cur."!cursor_debug"("FAIL", "infix:sym<>=>")
  debug_941:
    .return (rx1783_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("307_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", ">=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("308_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1788_tgt
    .local int rx1788_pos
    .local int rx1788_off
    .local int rx1788_eos
    .local int rx1788_rep
    .local pmc rx1788_cur
    .local pmc rx1788_debug
    (rx1788_cur, rx1788_pos, rx1788_tgt, $I10) = self."!cursor_start"()
    getattribute rx1788_debug, rx1788_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1788_cur
    .local pmc match
    .lex "$/", match
    length rx1788_eos, rx1788_tgt
    gt rx1788_pos, rx1788_eos, rx1788_done
    set rx1788_off, 0
    lt rx1788_pos, 2, rx1788_start
    sub rx1788_off, rx1788_pos, 1
    substr rx1788_tgt, rx1788_tgt, rx1788_off
  rx1788_start:
    eq $I10, 1, rx1788_restart
    if_null rx1788_debug, debug_942
    rx1788_cur."!cursor_debug"("START", "infix:sym<<>")
  debug_942:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1790_done
    goto rxscan1790_scan
  rxscan1790_loop:
    ($P10) = rx1788_cur."from"()
    inc $P10
    set rx1788_pos, $P10
    ge rx1788_pos, rx1788_eos, rxscan1790_done
  rxscan1790_scan:
    set_addr $I10, rxscan1790_loop
    rx1788_cur."!mark_push"(0, rx1788_pos, $I10)
  rxscan1790_done:
.annotate 'line', 531
  # rx subcapture "sym"
    set_addr $I10, rxcap_1791_fail
    rx1788_cur."!mark_push"(0, rx1788_pos, $I10)
  # rx literal  "<"
    add $I11, rx1788_pos, 1
    gt $I11, rx1788_eos, rx1788_fail
    sub $I11, rx1788_pos, rx1788_off
    ord $I11, rx1788_tgt, $I11
    ne $I11, 60, rx1788_fail
    add rx1788_pos, 1
    set_addr $I10, rxcap_1791_fail
    ($I12, $I11) = rx1788_cur."!mark_peek"($I10)
    rx1788_cur."!cursor_pos"($I11)
    ($P10) = rx1788_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1788_pos, "")
    rx1788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1791_done
  rxcap_1791_fail:
    goto rx1788_fail
  rxcap_1791_done:
  # rx subrule "O" subtype=capture negate=
    rx1788_cur."!cursor_pos"(rx1788_pos)
    $P10 = rx1788_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1788_fail
    rx1788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1788_pos = $P10."pos"()
  # rx pass
    rx1788_cur."!cursor_pass"(rx1788_pos, "infix:sym<<>")
    if_null rx1788_debug, debug_943
    rx1788_cur."!cursor_debug"("PASS", "infix:sym<<>", " at pos=", rx1788_pos)
  debug_943:
    .return (rx1788_cur)
  rx1788_restart:
.annotate 'line', 4
    if_null rx1788_debug, debug_944
    rx1788_cur."!cursor_debug"("NEXT", "infix:sym<<>")
  debug_944:
  rx1788_fail:
    (rx1788_rep, rx1788_pos, $I10, $P10) = rx1788_cur."!mark_fail"(0)
    lt rx1788_pos, -1, rx1788_done
    eq rx1788_pos, -1, rx1788_fail
    jump $I10
  rx1788_done:
    rx1788_cur."!cursor_fail"()
    if_null rx1788_debug, debug_945
    rx1788_cur."!cursor_debug"("FAIL", "infix:sym<<>")
  debug_945:
    .return (rx1788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("309_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "<")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("310_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1793_tgt
    .local int rx1793_pos
    .local int rx1793_off
    .local int rx1793_eos
    .local int rx1793_rep
    .local pmc rx1793_cur
    .local pmc rx1793_debug
    (rx1793_cur, rx1793_pos, rx1793_tgt, $I10) = self."!cursor_start"()
    getattribute rx1793_debug, rx1793_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1793_cur
    .local pmc match
    .lex "$/", match
    length rx1793_eos, rx1793_tgt
    gt rx1793_pos, rx1793_eos, rx1793_done
    set rx1793_off, 0
    lt rx1793_pos, 2, rx1793_start
    sub rx1793_off, rx1793_pos, 1
    substr rx1793_tgt, rx1793_tgt, rx1793_off
  rx1793_start:
    eq $I10, 1, rx1793_restart
    if_null rx1793_debug, debug_946
    rx1793_cur."!cursor_debug"("START", "infix:sym<>>")
  debug_946:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1795_done
    goto rxscan1795_scan
  rxscan1795_loop:
    ($P10) = rx1793_cur."from"()
    inc $P10
    set rx1793_pos, $P10
    ge rx1793_pos, rx1793_eos, rxscan1795_done
  rxscan1795_scan:
    set_addr $I10, rxscan1795_loop
    rx1793_cur."!mark_push"(0, rx1793_pos, $I10)
  rxscan1795_done:
.annotate 'line', 532
  # rx subcapture "sym"
    set_addr $I10, rxcap_1796_fail
    rx1793_cur."!mark_push"(0, rx1793_pos, $I10)
  # rx literal  ">"
    add $I11, rx1793_pos, 1
    gt $I11, rx1793_eos, rx1793_fail
    sub $I11, rx1793_pos, rx1793_off
    ord $I11, rx1793_tgt, $I11
    ne $I11, 62, rx1793_fail
    add rx1793_pos, 1
    set_addr $I10, rxcap_1796_fail
    ($I12, $I11) = rx1793_cur."!mark_peek"($I10)
    rx1793_cur."!cursor_pos"($I11)
    ($P10) = rx1793_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1793_pos, "")
    rx1793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1796_done
  rxcap_1796_fail:
    goto rx1793_fail
  rxcap_1796_done:
  # rx subrule "O" subtype=capture negate=
    rx1793_cur."!cursor_pos"(rx1793_pos)
    $P10 = rx1793_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1793_fail
    rx1793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1793_pos = $P10."pos"()
  # rx pass
    rx1793_cur."!cursor_pass"(rx1793_pos, "infix:sym<>>")
    if_null rx1793_debug, debug_947
    rx1793_cur."!cursor_debug"("PASS", "infix:sym<>>", " at pos=", rx1793_pos)
  debug_947:
    .return (rx1793_cur)
  rx1793_restart:
.annotate 'line', 4
    if_null rx1793_debug, debug_948
    rx1793_cur."!cursor_debug"("NEXT", "infix:sym<>>")
  debug_948:
  rx1793_fail:
    (rx1793_rep, rx1793_pos, $I10, $P10) = rx1793_cur."!mark_fail"(0)
    lt rx1793_pos, -1, rx1793_done
    eq rx1793_pos, -1, rx1793_fail
    jump $I10
  rx1793_done:
    rx1793_cur."!cursor_fail"()
    if_null rx1793_debug, debug_949
    rx1793_cur."!cursor_debug"("FAIL", "infix:sym<>>")
  debug_949:
    .return (rx1793_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("311_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", ">")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("312_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1798_tgt
    .local int rx1798_pos
    .local int rx1798_off
    .local int rx1798_eos
    .local int rx1798_rep
    .local pmc rx1798_cur
    .local pmc rx1798_debug
    (rx1798_cur, rx1798_pos, rx1798_tgt, $I10) = self."!cursor_start"()
    getattribute rx1798_debug, rx1798_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1798_cur
    .local pmc match
    .lex "$/", match
    length rx1798_eos, rx1798_tgt
    gt rx1798_pos, rx1798_eos, rx1798_done
    set rx1798_off, 0
    lt rx1798_pos, 2, rx1798_start
    sub rx1798_off, rx1798_pos, 1
    substr rx1798_tgt, rx1798_tgt, rx1798_off
  rx1798_start:
    eq $I10, 1, rx1798_restart
    if_null rx1798_debug, debug_950
    rx1798_cur."!cursor_debug"("START", "infix:sym<eq>")
  debug_950:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1800_done
    goto rxscan1800_scan
  rxscan1800_loop:
    ($P10) = rx1798_cur."from"()
    inc $P10
    set rx1798_pos, $P10
    ge rx1798_pos, rx1798_eos, rxscan1800_done
  rxscan1800_scan:
    set_addr $I10, rxscan1800_loop
    rx1798_cur."!mark_push"(0, rx1798_pos, $I10)
  rxscan1800_done:
.annotate 'line', 533
  # rx subcapture "sym"
    set_addr $I10, rxcap_1801_fail
    rx1798_cur."!mark_push"(0, rx1798_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1798_pos, 2
    gt $I11, rx1798_eos, rx1798_fail
    sub $I11, rx1798_pos, rx1798_off
    substr $S10, rx1798_tgt, $I11, 2
    ne $S10, "eq", rx1798_fail
    add rx1798_pos, 2
    set_addr $I10, rxcap_1801_fail
    ($I12, $I11) = rx1798_cur."!mark_peek"($I10)
    rx1798_cur."!cursor_pos"($I11)
    ($P10) = rx1798_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1798_pos, "")
    rx1798_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1801_done
  rxcap_1801_fail:
    goto rx1798_fail
  rxcap_1801_done:
  # rx subrule "O" subtype=capture negate=
    rx1798_cur."!cursor_pos"(rx1798_pos)
    $P10 = rx1798_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1798_fail
    rx1798_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1798_pos = $P10."pos"()
  # rx pass
    rx1798_cur."!cursor_pass"(rx1798_pos, "infix:sym<eq>")
    if_null rx1798_debug, debug_951
    rx1798_cur."!cursor_debug"("PASS", "infix:sym<eq>", " at pos=", rx1798_pos)
  debug_951:
    .return (rx1798_cur)
  rx1798_restart:
.annotate 'line', 4
    if_null rx1798_debug, debug_952
    rx1798_cur."!cursor_debug"("NEXT", "infix:sym<eq>")
  debug_952:
  rx1798_fail:
    (rx1798_rep, rx1798_pos, $I10, $P10) = rx1798_cur."!mark_fail"(0)
    lt rx1798_pos, -1, rx1798_done
    eq rx1798_pos, -1, rx1798_fail
    jump $I10
  rx1798_done:
    rx1798_cur."!cursor_fail"()
    if_null rx1798_debug, debug_953
    rx1798_cur."!cursor_debug"("FAIL", "infix:sym<eq>")
  debug_953:
    .return (rx1798_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("313_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "eq")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("314_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1803_tgt
    .local int rx1803_pos
    .local int rx1803_off
    .local int rx1803_eos
    .local int rx1803_rep
    .local pmc rx1803_cur
    .local pmc rx1803_debug
    (rx1803_cur, rx1803_pos, rx1803_tgt, $I10) = self."!cursor_start"()
    getattribute rx1803_debug, rx1803_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1803_cur
    .local pmc match
    .lex "$/", match
    length rx1803_eos, rx1803_tgt
    gt rx1803_pos, rx1803_eos, rx1803_done
    set rx1803_off, 0
    lt rx1803_pos, 2, rx1803_start
    sub rx1803_off, rx1803_pos, 1
    substr rx1803_tgt, rx1803_tgt, rx1803_off
  rx1803_start:
    eq $I10, 1, rx1803_restart
    if_null rx1803_debug, debug_954
    rx1803_cur."!cursor_debug"("START", "infix:sym<ne>")
  debug_954:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1805_done
    goto rxscan1805_scan
  rxscan1805_loop:
    ($P10) = rx1803_cur."from"()
    inc $P10
    set rx1803_pos, $P10
    ge rx1803_pos, rx1803_eos, rxscan1805_done
  rxscan1805_scan:
    set_addr $I10, rxscan1805_loop
    rx1803_cur."!mark_push"(0, rx1803_pos, $I10)
  rxscan1805_done:
.annotate 'line', 534
  # rx subcapture "sym"
    set_addr $I10, rxcap_1806_fail
    rx1803_cur."!mark_push"(0, rx1803_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1803_pos, 2
    gt $I11, rx1803_eos, rx1803_fail
    sub $I11, rx1803_pos, rx1803_off
    substr $S10, rx1803_tgt, $I11, 2
    ne $S10, "ne", rx1803_fail
    add rx1803_pos, 2
    set_addr $I10, rxcap_1806_fail
    ($I12, $I11) = rx1803_cur."!mark_peek"($I10)
    rx1803_cur."!cursor_pos"($I11)
    ($P10) = rx1803_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1803_pos, "")
    rx1803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1806_done
  rxcap_1806_fail:
    goto rx1803_fail
  rxcap_1806_done:
  # rx subrule "O" subtype=capture negate=
    rx1803_cur."!cursor_pos"(rx1803_pos)
    $P10 = rx1803_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1803_fail
    rx1803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1803_pos = $P10."pos"()
  # rx pass
    rx1803_cur."!cursor_pass"(rx1803_pos, "infix:sym<ne>")
    if_null rx1803_debug, debug_955
    rx1803_cur."!cursor_debug"("PASS", "infix:sym<ne>", " at pos=", rx1803_pos)
  debug_955:
    .return (rx1803_cur)
  rx1803_restart:
.annotate 'line', 4
    if_null rx1803_debug, debug_956
    rx1803_cur."!cursor_debug"("NEXT", "infix:sym<ne>")
  debug_956:
  rx1803_fail:
    (rx1803_rep, rx1803_pos, $I10, $P10) = rx1803_cur."!mark_fail"(0)
    lt rx1803_pos, -1, rx1803_done
    eq rx1803_pos, -1, rx1803_fail
    jump $I10
  rx1803_done:
    rx1803_cur."!cursor_fail"()
    if_null rx1803_debug, debug_957
    rx1803_cur."!cursor_debug"("FAIL", "infix:sym<ne>")
  debug_957:
    .return (rx1803_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("315_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "ne")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("316_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1808_tgt
    .local int rx1808_pos
    .local int rx1808_off
    .local int rx1808_eos
    .local int rx1808_rep
    .local pmc rx1808_cur
    .local pmc rx1808_debug
    (rx1808_cur, rx1808_pos, rx1808_tgt, $I10) = self."!cursor_start"()
    getattribute rx1808_debug, rx1808_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1808_cur
    .local pmc match
    .lex "$/", match
    length rx1808_eos, rx1808_tgt
    gt rx1808_pos, rx1808_eos, rx1808_done
    set rx1808_off, 0
    lt rx1808_pos, 2, rx1808_start
    sub rx1808_off, rx1808_pos, 1
    substr rx1808_tgt, rx1808_tgt, rx1808_off
  rx1808_start:
    eq $I10, 1, rx1808_restart
    if_null rx1808_debug, debug_958
    rx1808_cur."!cursor_debug"("START", "infix:sym<le>")
  debug_958:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1810_done
    goto rxscan1810_scan
  rxscan1810_loop:
    ($P10) = rx1808_cur."from"()
    inc $P10
    set rx1808_pos, $P10
    ge rx1808_pos, rx1808_eos, rxscan1810_done
  rxscan1810_scan:
    set_addr $I10, rxscan1810_loop
    rx1808_cur."!mark_push"(0, rx1808_pos, $I10)
  rxscan1810_done:
.annotate 'line', 535
  # rx subcapture "sym"
    set_addr $I10, rxcap_1811_fail
    rx1808_cur."!mark_push"(0, rx1808_pos, $I10)
  # rx literal  "le"
    add $I11, rx1808_pos, 2
    gt $I11, rx1808_eos, rx1808_fail
    sub $I11, rx1808_pos, rx1808_off
    substr $S10, rx1808_tgt, $I11, 2
    ne $S10, "le", rx1808_fail
    add rx1808_pos, 2
    set_addr $I10, rxcap_1811_fail
    ($I12, $I11) = rx1808_cur."!mark_peek"($I10)
    rx1808_cur."!cursor_pos"($I11)
    ($P10) = rx1808_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1808_pos, "")
    rx1808_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1811_done
  rxcap_1811_fail:
    goto rx1808_fail
  rxcap_1811_done:
  # rx subrule "O" subtype=capture negate=
    rx1808_cur."!cursor_pos"(rx1808_pos)
    $P10 = rx1808_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1808_fail
    rx1808_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1808_pos = $P10."pos"()
  # rx pass
    rx1808_cur."!cursor_pass"(rx1808_pos, "infix:sym<le>")
    if_null rx1808_debug, debug_959
    rx1808_cur."!cursor_debug"("PASS", "infix:sym<le>", " at pos=", rx1808_pos)
  debug_959:
    .return (rx1808_cur)
  rx1808_restart:
.annotate 'line', 4
    if_null rx1808_debug, debug_960
    rx1808_cur."!cursor_debug"("NEXT", "infix:sym<le>")
  debug_960:
  rx1808_fail:
    (rx1808_rep, rx1808_pos, $I10, $P10) = rx1808_cur."!mark_fail"(0)
    lt rx1808_pos, -1, rx1808_done
    eq rx1808_pos, -1, rx1808_fail
    jump $I10
  rx1808_done:
    rx1808_cur."!cursor_fail"()
    if_null rx1808_debug, debug_961
    rx1808_cur."!cursor_debug"("FAIL", "infix:sym<le>")
  debug_961:
    .return (rx1808_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("317_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "le")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("318_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1813_tgt
    .local int rx1813_pos
    .local int rx1813_off
    .local int rx1813_eos
    .local int rx1813_rep
    .local pmc rx1813_cur
    .local pmc rx1813_debug
    (rx1813_cur, rx1813_pos, rx1813_tgt, $I10) = self."!cursor_start"()
    getattribute rx1813_debug, rx1813_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1813_cur
    .local pmc match
    .lex "$/", match
    length rx1813_eos, rx1813_tgt
    gt rx1813_pos, rx1813_eos, rx1813_done
    set rx1813_off, 0
    lt rx1813_pos, 2, rx1813_start
    sub rx1813_off, rx1813_pos, 1
    substr rx1813_tgt, rx1813_tgt, rx1813_off
  rx1813_start:
    eq $I10, 1, rx1813_restart
    if_null rx1813_debug, debug_962
    rx1813_cur."!cursor_debug"("START", "infix:sym<ge>")
  debug_962:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1815_done
    goto rxscan1815_scan
  rxscan1815_loop:
    ($P10) = rx1813_cur."from"()
    inc $P10
    set rx1813_pos, $P10
    ge rx1813_pos, rx1813_eos, rxscan1815_done
  rxscan1815_scan:
    set_addr $I10, rxscan1815_loop
    rx1813_cur."!mark_push"(0, rx1813_pos, $I10)
  rxscan1815_done:
.annotate 'line', 536
  # rx subcapture "sym"
    set_addr $I10, rxcap_1816_fail
    rx1813_cur."!mark_push"(0, rx1813_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1813_pos, 2
    gt $I11, rx1813_eos, rx1813_fail
    sub $I11, rx1813_pos, rx1813_off
    substr $S10, rx1813_tgt, $I11, 2
    ne $S10, "ge", rx1813_fail
    add rx1813_pos, 2
    set_addr $I10, rxcap_1816_fail
    ($I12, $I11) = rx1813_cur."!mark_peek"($I10)
    rx1813_cur."!cursor_pos"($I11)
    ($P10) = rx1813_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1813_pos, "")
    rx1813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1816_done
  rxcap_1816_fail:
    goto rx1813_fail
  rxcap_1816_done:
  # rx subrule "O" subtype=capture negate=
    rx1813_cur."!cursor_pos"(rx1813_pos)
    $P10 = rx1813_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1813_fail
    rx1813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1813_pos = $P10."pos"()
  # rx pass
    rx1813_cur."!cursor_pass"(rx1813_pos, "infix:sym<ge>")
    if_null rx1813_debug, debug_963
    rx1813_cur."!cursor_debug"("PASS", "infix:sym<ge>", " at pos=", rx1813_pos)
  debug_963:
    .return (rx1813_cur)
  rx1813_restart:
.annotate 'line', 4
    if_null rx1813_debug, debug_964
    rx1813_cur."!cursor_debug"("NEXT", "infix:sym<ge>")
  debug_964:
  rx1813_fail:
    (rx1813_rep, rx1813_pos, $I10, $P10) = rx1813_cur."!mark_fail"(0)
    lt rx1813_pos, -1, rx1813_done
    eq rx1813_pos, -1, rx1813_fail
    jump $I10
  rx1813_done:
    rx1813_cur."!cursor_fail"()
    if_null rx1813_debug, debug_965
    rx1813_cur."!cursor_debug"("FAIL", "infix:sym<ge>")
  debug_965:
    .return (rx1813_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("319_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "ge")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("320_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1818_tgt
    .local int rx1818_pos
    .local int rx1818_off
    .local int rx1818_eos
    .local int rx1818_rep
    .local pmc rx1818_cur
    .local pmc rx1818_debug
    (rx1818_cur, rx1818_pos, rx1818_tgt, $I10) = self."!cursor_start"()
    getattribute rx1818_debug, rx1818_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1818_cur
    .local pmc match
    .lex "$/", match
    length rx1818_eos, rx1818_tgt
    gt rx1818_pos, rx1818_eos, rx1818_done
    set rx1818_off, 0
    lt rx1818_pos, 2, rx1818_start
    sub rx1818_off, rx1818_pos, 1
    substr rx1818_tgt, rx1818_tgt, rx1818_off
  rx1818_start:
    eq $I10, 1, rx1818_restart
    if_null rx1818_debug, debug_966
    rx1818_cur."!cursor_debug"("START", "infix:sym<lt>")
  debug_966:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1820_done
    goto rxscan1820_scan
  rxscan1820_loop:
    ($P10) = rx1818_cur."from"()
    inc $P10
    set rx1818_pos, $P10
    ge rx1818_pos, rx1818_eos, rxscan1820_done
  rxscan1820_scan:
    set_addr $I10, rxscan1820_loop
    rx1818_cur."!mark_push"(0, rx1818_pos, $I10)
  rxscan1820_done:
.annotate 'line', 537
  # rx subcapture "sym"
    set_addr $I10, rxcap_1821_fail
    rx1818_cur."!mark_push"(0, rx1818_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1818_pos, 2
    gt $I11, rx1818_eos, rx1818_fail
    sub $I11, rx1818_pos, rx1818_off
    substr $S10, rx1818_tgt, $I11, 2
    ne $S10, "lt", rx1818_fail
    add rx1818_pos, 2
    set_addr $I10, rxcap_1821_fail
    ($I12, $I11) = rx1818_cur."!mark_peek"($I10)
    rx1818_cur."!cursor_pos"($I11)
    ($P10) = rx1818_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1818_pos, "")
    rx1818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1821_done
  rxcap_1821_fail:
    goto rx1818_fail
  rxcap_1821_done:
  # rx subrule "O" subtype=capture negate=
    rx1818_cur."!cursor_pos"(rx1818_pos)
    $P10 = rx1818_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1818_fail
    rx1818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1818_pos = $P10."pos"()
  # rx pass
    rx1818_cur."!cursor_pass"(rx1818_pos, "infix:sym<lt>")
    if_null rx1818_debug, debug_967
    rx1818_cur."!cursor_debug"("PASS", "infix:sym<lt>", " at pos=", rx1818_pos)
  debug_967:
    .return (rx1818_cur)
  rx1818_restart:
.annotate 'line', 4
    if_null rx1818_debug, debug_968
    rx1818_cur."!cursor_debug"("NEXT", "infix:sym<lt>")
  debug_968:
  rx1818_fail:
    (rx1818_rep, rx1818_pos, $I10, $P10) = rx1818_cur."!mark_fail"(0)
    lt rx1818_pos, -1, rx1818_done
    eq rx1818_pos, -1, rx1818_fail
    jump $I10
  rx1818_done:
    rx1818_cur."!cursor_fail"()
    if_null rx1818_debug, debug_969
    rx1818_cur."!cursor_debug"("FAIL", "infix:sym<lt>")
  debug_969:
    .return (rx1818_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("321_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "lt")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("322_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1823_tgt
    .local int rx1823_pos
    .local int rx1823_off
    .local int rx1823_eos
    .local int rx1823_rep
    .local pmc rx1823_cur
    .local pmc rx1823_debug
    (rx1823_cur, rx1823_pos, rx1823_tgt, $I10) = self."!cursor_start"()
    getattribute rx1823_debug, rx1823_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1823_cur
    .local pmc match
    .lex "$/", match
    length rx1823_eos, rx1823_tgt
    gt rx1823_pos, rx1823_eos, rx1823_done
    set rx1823_off, 0
    lt rx1823_pos, 2, rx1823_start
    sub rx1823_off, rx1823_pos, 1
    substr rx1823_tgt, rx1823_tgt, rx1823_off
  rx1823_start:
    eq $I10, 1, rx1823_restart
    if_null rx1823_debug, debug_970
    rx1823_cur."!cursor_debug"("START", "infix:sym<gt>")
  debug_970:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1825_done
    goto rxscan1825_scan
  rxscan1825_loop:
    ($P10) = rx1823_cur."from"()
    inc $P10
    set rx1823_pos, $P10
    ge rx1823_pos, rx1823_eos, rxscan1825_done
  rxscan1825_scan:
    set_addr $I10, rxscan1825_loop
    rx1823_cur."!mark_push"(0, rx1823_pos, $I10)
  rxscan1825_done:
.annotate 'line', 538
  # rx subcapture "sym"
    set_addr $I10, rxcap_1826_fail
    rx1823_cur."!mark_push"(0, rx1823_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1823_pos, 2
    gt $I11, rx1823_eos, rx1823_fail
    sub $I11, rx1823_pos, rx1823_off
    substr $S10, rx1823_tgt, $I11, 2
    ne $S10, "gt", rx1823_fail
    add rx1823_pos, 2
    set_addr $I10, rxcap_1826_fail
    ($I12, $I11) = rx1823_cur."!mark_peek"($I10)
    rx1823_cur."!cursor_pos"($I11)
    ($P10) = rx1823_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1823_pos, "")
    rx1823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1826_done
  rxcap_1826_fail:
    goto rx1823_fail
  rxcap_1826_done:
  # rx subrule "O" subtype=capture negate=
    rx1823_cur."!cursor_pos"(rx1823_pos)
    $P10 = rx1823_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1823_fail
    rx1823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1823_pos = $P10."pos"()
  # rx pass
    rx1823_cur."!cursor_pass"(rx1823_pos, "infix:sym<gt>")
    if_null rx1823_debug, debug_971
    rx1823_cur."!cursor_debug"("PASS", "infix:sym<gt>", " at pos=", rx1823_pos)
  debug_971:
    .return (rx1823_cur)
  rx1823_restart:
.annotate 'line', 4
    if_null rx1823_debug, debug_972
    rx1823_cur."!cursor_debug"("NEXT", "infix:sym<gt>")
  debug_972:
  rx1823_fail:
    (rx1823_rep, rx1823_pos, $I10, $P10) = rx1823_cur."!mark_fail"(0)
    lt rx1823_pos, -1, rx1823_done
    eq rx1823_pos, -1, rx1823_fail
    jump $I10
  rx1823_done:
    rx1823_cur."!cursor_fail"()
    if_null rx1823_debug, debug_973
    rx1823_cur."!cursor_debug"("FAIL", "infix:sym<gt>")
  debug_973:
    .return (rx1823_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("323_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "gt")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("324_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1828_tgt
    .local int rx1828_pos
    .local int rx1828_off
    .local int rx1828_eos
    .local int rx1828_rep
    .local pmc rx1828_cur
    .local pmc rx1828_debug
    (rx1828_cur, rx1828_pos, rx1828_tgt, $I10) = self."!cursor_start"()
    getattribute rx1828_debug, rx1828_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1828_cur
    .local pmc match
    .lex "$/", match
    length rx1828_eos, rx1828_tgt
    gt rx1828_pos, rx1828_eos, rx1828_done
    set rx1828_off, 0
    lt rx1828_pos, 2, rx1828_start
    sub rx1828_off, rx1828_pos, 1
    substr rx1828_tgt, rx1828_tgt, rx1828_off
  rx1828_start:
    eq $I10, 1, rx1828_restart
    if_null rx1828_debug, debug_974
    rx1828_cur."!cursor_debug"("START", "infix:sym<=:=>")
  debug_974:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1830_done
    goto rxscan1830_scan
  rxscan1830_loop:
    ($P10) = rx1828_cur."from"()
    inc $P10
    set rx1828_pos, $P10
    ge rx1828_pos, rx1828_eos, rxscan1830_done
  rxscan1830_scan:
    set_addr $I10, rxscan1830_loop
    rx1828_cur."!mark_push"(0, rx1828_pos, $I10)
  rxscan1830_done:
.annotate 'line', 539
  # rx subcapture "sym"
    set_addr $I10, rxcap_1831_fail
    rx1828_cur."!mark_push"(0, rx1828_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1828_pos, 3
    gt $I11, rx1828_eos, rx1828_fail
    sub $I11, rx1828_pos, rx1828_off
    substr $S10, rx1828_tgt, $I11, 3
    ne $S10, "=:=", rx1828_fail
    add rx1828_pos, 3
    set_addr $I10, rxcap_1831_fail
    ($I12, $I11) = rx1828_cur."!mark_peek"($I10)
    rx1828_cur."!cursor_pos"($I11)
    ($P10) = rx1828_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1828_pos, "")
    rx1828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1831_done
  rxcap_1831_fail:
    goto rx1828_fail
  rxcap_1831_done:
  # rx subrule "O" subtype=capture negate=
    rx1828_cur."!cursor_pos"(rx1828_pos)
    $P10 = rx1828_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1828_fail
    rx1828_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1828_pos = $P10."pos"()
  # rx pass
    rx1828_cur."!cursor_pass"(rx1828_pos, "infix:sym<=:=>")
    if_null rx1828_debug, debug_975
    rx1828_cur."!cursor_debug"("PASS", "infix:sym<=:=>", " at pos=", rx1828_pos)
  debug_975:
    .return (rx1828_cur)
  rx1828_restart:
.annotate 'line', 4
    if_null rx1828_debug, debug_976
    rx1828_cur."!cursor_debug"("NEXT", "infix:sym<=:=>")
  debug_976:
  rx1828_fail:
    (rx1828_rep, rx1828_pos, $I10, $P10) = rx1828_cur."!mark_fail"(0)
    lt rx1828_pos, -1, rx1828_done
    eq rx1828_pos, -1, rx1828_fail
    jump $I10
  rx1828_done:
    rx1828_cur."!cursor_fail"()
    if_null rx1828_debug, debug_977
    rx1828_cur."!cursor_debug"("FAIL", "infix:sym<=:=>")
  debug_977:
    .return (rx1828_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("325_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "=:=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("326_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1833_tgt
    .local int rx1833_pos
    .local int rx1833_off
    .local int rx1833_eos
    .local int rx1833_rep
    .local pmc rx1833_cur
    .local pmc rx1833_debug
    (rx1833_cur, rx1833_pos, rx1833_tgt, $I10) = self."!cursor_start"()
    getattribute rx1833_debug, rx1833_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1833_cur
    .local pmc match
    .lex "$/", match
    length rx1833_eos, rx1833_tgt
    gt rx1833_pos, rx1833_eos, rx1833_done
    set rx1833_off, 0
    lt rx1833_pos, 2, rx1833_start
    sub rx1833_off, rx1833_pos, 1
    substr rx1833_tgt, rx1833_tgt, rx1833_off
  rx1833_start:
    eq $I10, 1, rx1833_restart
    if_null rx1833_debug, debug_978
    rx1833_cur."!cursor_debug"("START", "infix:sym<~~>")
  debug_978:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1835_done
    goto rxscan1835_scan
  rxscan1835_loop:
    ($P10) = rx1833_cur."from"()
    inc $P10
    set rx1833_pos, $P10
    ge rx1833_pos, rx1833_eos, rxscan1835_done
  rxscan1835_scan:
    set_addr $I10, rxscan1835_loop
    rx1833_cur."!mark_push"(0, rx1833_pos, $I10)
  rxscan1835_done:
.annotate 'line', 540
  # rx subcapture "sym"
    set_addr $I10, rxcap_1836_fail
    rx1833_cur."!mark_push"(0, rx1833_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1833_pos, 2
    gt $I11, rx1833_eos, rx1833_fail
    sub $I11, rx1833_pos, rx1833_off
    substr $S10, rx1833_tgt, $I11, 2
    ne $S10, "~~", rx1833_fail
    add rx1833_pos, 2
    set_addr $I10, rxcap_1836_fail
    ($I12, $I11) = rx1833_cur."!mark_peek"($I10)
    rx1833_cur."!cursor_pos"($I11)
    ($P10) = rx1833_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1833_pos, "")
    rx1833_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1836_done
  rxcap_1836_fail:
    goto rx1833_fail
  rxcap_1836_done:
  # rx subrule "O" subtype=capture negate=
    rx1833_cur."!cursor_pos"(rx1833_pos)
    $P10 = rx1833_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1833_fail
    rx1833_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1833_pos = $P10."pos"()
  # rx pass
    rx1833_cur."!cursor_pass"(rx1833_pos, "infix:sym<~~>")
    if_null rx1833_debug, debug_979
    rx1833_cur."!cursor_debug"("PASS", "infix:sym<~~>", " at pos=", rx1833_pos)
  debug_979:
    .return (rx1833_cur)
  rx1833_restart:
.annotate 'line', 4
    if_null rx1833_debug, debug_980
    rx1833_cur."!cursor_debug"("NEXT", "infix:sym<~~>")
  debug_980:
  rx1833_fail:
    (rx1833_rep, rx1833_pos, $I10, $P10) = rx1833_cur."!mark_fail"(0)
    lt rx1833_pos, -1, rx1833_done
    eq rx1833_pos, -1, rx1833_fail
    jump $I10
  rx1833_done:
    rx1833_cur."!cursor_fail"()
    if_null rx1833_debug, debug_981
    rx1833_cur."!cursor_debug"("FAIL", "infix:sym<~~>")
  debug_981:
    .return (rx1833_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("327_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "~~")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("328_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1838_tgt
    .local int rx1838_pos
    .local int rx1838_off
    .local int rx1838_eos
    .local int rx1838_rep
    .local pmc rx1838_cur
    .local pmc rx1838_debug
    (rx1838_cur, rx1838_pos, rx1838_tgt, $I10) = self."!cursor_start"()
    getattribute rx1838_debug, rx1838_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1838_cur
    .local pmc match
    .lex "$/", match
    length rx1838_eos, rx1838_tgt
    gt rx1838_pos, rx1838_eos, rx1838_done
    set rx1838_off, 0
    lt rx1838_pos, 2, rx1838_start
    sub rx1838_off, rx1838_pos, 1
    substr rx1838_tgt, rx1838_tgt, rx1838_off
  rx1838_start:
    eq $I10, 1, rx1838_restart
    if_null rx1838_debug, debug_982
    rx1838_cur."!cursor_debug"("START", "infix:sym<&&>")
  debug_982:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1840_done
    goto rxscan1840_scan
  rxscan1840_loop:
    ($P10) = rx1838_cur."from"()
    inc $P10
    set rx1838_pos, $P10
    ge rx1838_pos, rx1838_eos, rxscan1840_done
  rxscan1840_scan:
    set_addr $I10, rxscan1840_loop
    rx1838_cur."!mark_push"(0, rx1838_pos, $I10)
  rxscan1840_done:
.annotate 'line', 542
  # rx subcapture "sym"
    set_addr $I10, rxcap_1841_fail
    rx1838_cur."!mark_push"(0, rx1838_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1838_pos, 2
    gt $I11, rx1838_eos, rx1838_fail
    sub $I11, rx1838_pos, rx1838_off
    substr $S10, rx1838_tgt, $I11, 2
    ne $S10, "&&", rx1838_fail
    add rx1838_pos, 2
    set_addr $I10, rxcap_1841_fail
    ($I12, $I11) = rx1838_cur."!mark_peek"($I10)
    rx1838_cur."!cursor_pos"($I11)
    ($P10) = rx1838_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1838_pos, "")
    rx1838_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1841_done
  rxcap_1841_fail:
    goto rx1838_fail
  rxcap_1841_done:
  # rx subrule "O" subtype=capture negate=
    rx1838_cur."!cursor_pos"(rx1838_pos)
    $P10 = rx1838_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1838_fail
    rx1838_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1838_pos = $P10."pos"()
  # rx pass
    rx1838_cur."!cursor_pass"(rx1838_pos, "infix:sym<&&>")
    if_null rx1838_debug, debug_983
    rx1838_cur."!cursor_debug"("PASS", "infix:sym<&&>", " at pos=", rx1838_pos)
  debug_983:
    .return (rx1838_cur)
  rx1838_restart:
.annotate 'line', 4
    if_null rx1838_debug, debug_984
    rx1838_cur."!cursor_debug"("NEXT", "infix:sym<&&>")
  debug_984:
  rx1838_fail:
    (rx1838_rep, rx1838_pos, $I10, $P10) = rx1838_cur."!mark_fail"(0)
    lt rx1838_pos, -1, rx1838_done
    eq rx1838_pos, -1, rx1838_fail
    jump $I10
  rx1838_done:
    rx1838_cur."!cursor_fail"()
    if_null rx1838_debug, debug_985
    rx1838_cur."!cursor_debug"("FAIL", "infix:sym<&&>")
  debug_985:
    .return (rx1838_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("329_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "&&")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("330_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1843_tgt
    .local int rx1843_pos
    .local int rx1843_off
    .local int rx1843_eos
    .local int rx1843_rep
    .local pmc rx1843_cur
    .local pmc rx1843_debug
    (rx1843_cur, rx1843_pos, rx1843_tgt, $I10) = self."!cursor_start"()
    getattribute rx1843_debug, rx1843_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1843_cur
    .local pmc match
    .lex "$/", match
    length rx1843_eos, rx1843_tgt
    gt rx1843_pos, rx1843_eos, rx1843_done
    set rx1843_off, 0
    lt rx1843_pos, 2, rx1843_start
    sub rx1843_off, rx1843_pos, 1
    substr rx1843_tgt, rx1843_tgt, rx1843_off
  rx1843_start:
    eq $I10, 1, rx1843_restart
    if_null rx1843_debug, debug_986
    rx1843_cur."!cursor_debug"("START", "infix:sym<||>")
  debug_986:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1845_done
    goto rxscan1845_scan
  rxscan1845_loop:
    ($P10) = rx1843_cur."from"()
    inc $P10
    set rx1843_pos, $P10
    ge rx1843_pos, rx1843_eos, rxscan1845_done
  rxscan1845_scan:
    set_addr $I10, rxscan1845_loop
    rx1843_cur."!mark_push"(0, rx1843_pos, $I10)
  rxscan1845_done:
.annotate 'line', 544
  # rx subcapture "sym"
    set_addr $I10, rxcap_1846_fail
    rx1843_cur."!mark_push"(0, rx1843_pos, $I10)
  # rx literal  "||"
    add $I11, rx1843_pos, 2
    gt $I11, rx1843_eos, rx1843_fail
    sub $I11, rx1843_pos, rx1843_off
    substr $S10, rx1843_tgt, $I11, 2
    ne $S10, "||", rx1843_fail
    add rx1843_pos, 2
    set_addr $I10, rxcap_1846_fail
    ($I12, $I11) = rx1843_cur."!mark_peek"($I10)
    rx1843_cur."!cursor_pos"($I11)
    ($P10) = rx1843_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1843_pos, "")
    rx1843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1846_done
  rxcap_1846_fail:
    goto rx1843_fail
  rxcap_1846_done:
  # rx subrule "O" subtype=capture negate=
    rx1843_cur."!cursor_pos"(rx1843_pos)
    $P10 = rx1843_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1843_fail
    rx1843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1843_pos = $P10."pos"()
  # rx pass
    rx1843_cur."!cursor_pass"(rx1843_pos, "infix:sym<||>")
    if_null rx1843_debug, debug_987
    rx1843_cur."!cursor_debug"("PASS", "infix:sym<||>", " at pos=", rx1843_pos)
  debug_987:
    .return (rx1843_cur)
  rx1843_restart:
.annotate 'line', 4
    if_null rx1843_debug, debug_988
    rx1843_cur."!cursor_debug"("NEXT", "infix:sym<||>")
  debug_988:
  rx1843_fail:
    (rx1843_rep, rx1843_pos, $I10, $P10) = rx1843_cur."!mark_fail"(0)
    lt rx1843_pos, -1, rx1843_done
    eq rx1843_pos, -1, rx1843_fail
    jump $I10
  rx1843_done:
    rx1843_cur."!cursor_fail"()
    if_null rx1843_debug, debug_989
    rx1843_cur."!cursor_debug"("FAIL", "infix:sym<||>")
  debug_989:
    .return (rx1843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("331_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "||")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("332_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1848_tgt
    .local int rx1848_pos
    .local int rx1848_off
    .local int rx1848_eos
    .local int rx1848_rep
    .local pmc rx1848_cur
    .local pmc rx1848_debug
    (rx1848_cur, rx1848_pos, rx1848_tgt, $I10) = self."!cursor_start"()
    getattribute rx1848_debug, rx1848_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1848_cur
    .local pmc match
    .lex "$/", match
    length rx1848_eos, rx1848_tgt
    gt rx1848_pos, rx1848_eos, rx1848_done
    set rx1848_off, 0
    lt rx1848_pos, 2, rx1848_start
    sub rx1848_off, rx1848_pos, 1
    substr rx1848_tgt, rx1848_tgt, rx1848_off
  rx1848_start:
    eq $I10, 1, rx1848_restart
    if_null rx1848_debug, debug_990
    rx1848_cur."!cursor_debug"("START", "infix:sym<//>")
  debug_990:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1850_done
    goto rxscan1850_scan
  rxscan1850_loop:
    ($P10) = rx1848_cur."from"()
    inc $P10
    set rx1848_pos, $P10
    ge rx1848_pos, rx1848_eos, rxscan1850_done
  rxscan1850_scan:
    set_addr $I10, rxscan1850_loop
    rx1848_cur."!mark_push"(0, rx1848_pos, $I10)
  rxscan1850_done:
.annotate 'line', 545
  # rx subcapture "sym"
    set_addr $I10, rxcap_1851_fail
    rx1848_cur."!mark_push"(0, rx1848_pos, $I10)
  # rx literal  "//"
    add $I11, rx1848_pos, 2
    gt $I11, rx1848_eos, rx1848_fail
    sub $I11, rx1848_pos, rx1848_off
    substr $S10, rx1848_tgt, $I11, 2
    ne $S10, "//", rx1848_fail
    add rx1848_pos, 2
    set_addr $I10, rxcap_1851_fail
    ($I12, $I11) = rx1848_cur."!mark_peek"($I10)
    rx1848_cur."!cursor_pos"($I11)
    ($P10) = rx1848_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1848_pos, "")
    rx1848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1851_done
  rxcap_1851_fail:
    goto rx1848_fail
  rxcap_1851_done:
  # rx subrule "O" subtype=capture negate=
    rx1848_cur."!cursor_pos"(rx1848_pos)
    $P10 = rx1848_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1848_fail
    rx1848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1848_pos = $P10."pos"()
  # rx pass
    rx1848_cur."!cursor_pass"(rx1848_pos, "infix:sym<//>")
    if_null rx1848_debug, debug_991
    rx1848_cur."!cursor_debug"("PASS", "infix:sym<//>", " at pos=", rx1848_pos)
  debug_991:
    .return (rx1848_cur)
  rx1848_restart:
.annotate 'line', 4
    if_null rx1848_debug, debug_992
    rx1848_cur."!cursor_debug"("NEXT", "infix:sym<//>")
  debug_992:
  rx1848_fail:
    (rx1848_rep, rx1848_pos, $I10, $P10) = rx1848_cur."!mark_fail"(0)
    lt rx1848_pos, -1, rx1848_done
    eq rx1848_pos, -1, rx1848_fail
    jump $I10
  rx1848_done:
    rx1848_cur."!cursor_fail"()
    if_null rx1848_debug, debug_993
    rx1848_cur."!cursor_debug"("FAIL", "infix:sym<//>")
  debug_993:
    .return (rx1848_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("333_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "//")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("334_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1853_tgt
    .local int rx1853_pos
    .local int rx1853_off
    .local int rx1853_eos
    .local int rx1853_rep
    .local pmc rx1853_cur
    .local pmc rx1853_debug
    (rx1853_cur, rx1853_pos, rx1853_tgt, $I10) = self."!cursor_start"()
    getattribute rx1853_debug, rx1853_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1853_cur
    .local pmc match
    .lex "$/", match
    length rx1853_eos, rx1853_tgt
    gt rx1853_pos, rx1853_eos, rx1853_done
    set rx1853_off, 0
    lt rx1853_pos, 2, rx1853_start
    sub rx1853_off, rx1853_pos, 1
    substr rx1853_tgt, rx1853_tgt, rx1853_off
  rx1853_start:
    eq $I10, 1, rx1853_restart
    if_null rx1853_debug, debug_994
    rx1853_cur."!cursor_debug"("START", "infix:sym<?? !!>")
  debug_994:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1855_done
    goto rxscan1855_scan
  rxscan1855_loop:
    ($P10) = rx1853_cur."from"()
    inc $P10
    set rx1853_pos, $P10
    ge rx1853_pos, rx1853_eos, rxscan1855_done
  rxscan1855_scan:
    set_addr $I10, rxscan1855_loop
    rx1853_cur."!mark_push"(0, rx1853_pos, $I10)
  rxscan1855_done:
.annotate 'line', 548
  # rx literal  "??"
    add $I11, rx1853_pos, 2
    gt $I11, rx1853_eos, rx1853_fail
    sub $I11, rx1853_pos, rx1853_off
    substr $S10, rx1853_tgt, $I11, 2
    ne $S10, "??", rx1853_fail
    add rx1853_pos, 2
.annotate 'line', 549
  # rx subrule "ws" subtype=method negate=
    rx1853_cur."!cursor_pos"(rx1853_pos)
    $P10 = rx1853_cur."ws"()
    unless $P10, rx1853_fail
    rx1853_pos = $P10."pos"()
.annotate 'line', 550
  # rx subrule "EXPR" subtype=capture negate=
    rx1853_cur."!cursor_pos"(rx1853_pos)
    $P10 = rx1853_cur."EXPR"("i=")
    unless $P10, rx1853_fail
    rx1853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1853_pos = $P10."pos"()
.annotate 'line', 551
  # rx literal  "!!"
    add $I11, rx1853_pos, 2
    gt $I11, rx1853_eos, rx1853_fail
    sub $I11, rx1853_pos, rx1853_off
    substr $S10, rx1853_tgt, $I11, 2
    ne $S10, "!!", rx1853_fail
    add rx1853_pos, 2
.annotate 'line', 552
  # rx subrule "O" subtype=capture negate=
    rx1853_cur."!cursor_pos"(rx1853_pos)
    $P10 = rx1853_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1853_fail
    rx1853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1853_pos = $P10."pos"()
.annotate 'line', 547
  # rx pass
    rx1853_cur."!cursor_pass"(rx1853_pos, "infix:sym<?? !!>")
    if_null rx1853_debug, debug_995
    rx1853_cur."!cursor_debug"("PASS", "infix:sym<?? !!>", " at pos=", rx1853_pos)
  debug_995:
    .return (rx1853_cur)
  rx1853_restart:
.annotate 'line', 4
    if_null rx1853_debug, debug_996
    rx1853_cur."!cursor_debug"("NEXT", "infix:sym<?? !!>")
  debug_996:
  rx1853_fail:
    (rx1853_rep, rx1853_pos, $I10, $P10) = rx1853_cur."!mark_fail"(0)
    lt rx1853_pos, -1, rx1853_done
    eq rx1853_pos, -1, rx1853_fail
    jump $I10
  rx1853_done:
    rx1853_cur."!cursor_fail"()
    if_null rx1853_debug, debug_997
    rx1853_cur."!cursor_debug"("FAIL", "infix:sym<?? !!>")
  debug_997:
    .return (rx1853_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("335_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("ws", "??")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("336_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1857_tgt
    .local int rx1857_pos
    .local int rx1857_off
    .local int rx1857_eos
    .local int rx1857_rep
    .local pmc rx1857_cur
    .local pmc rx1857_debug
    (rx1857_cur, rx1857_pos, rx1857_tgt, $I10) = self."!cursor_start"()
    getattribute rx1857_debug, rx1857_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1857_cur
    .local pmc match
    .lex "$/", match
    length rx1857_eos, rx1857_tgt
    gt rx1857_pos, rx1857_eos, rx1857_done
    set rx1857_off, 0
    lt rx1857_pos, 2, rx1857_start
    sub rx1857_off, rx1857_pos, 1
    substr rx1857_tgt, rx1857_tgt, rx1857_off
  rx1857_start:
    eq $I10, 1, rx1857_restart
    if_null rx1857_debug, debug_998
    rx1857_cur."!cursor_debug"("START", "infix:sym<=>")
  debug_998:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1859_done
    goto rxscan1859_scan
  rxscan1859_loop:
    ($P10) = rx1857_cur."from"()
    inc $P10
    set rx1857_pos, $P10
    ge rx1857_pos, rx1857_eos, rxscan1859_done
  rxscan1859_scan:
    set_addr $I10, rxscan1859_loop
    rx1857_cur."!mark_push"(0, rx1857_pos, $I10)
  rxscan1859_done:
.annotate 'line', 556
  # rx subcapture "sym"
    set_addr $I10, rxcap_1860_fail
    rx1857_cur."!mark_push"(0, rx1857_pos, $I10)
  # rx literal  "="
    add $I11, rx1857_pos, 1
    gt $I11, rx1857_eos, rx1857_fail
    sub $I11, rx1857_pos, rx1857_off
    ord $I11, rx1857_tgt, $I11
    ne $I11, 61, rx1857_fail
    add rx1857_pos, 1
    set_addr $I10, rxcap_1860_fail
    ($I12, $I11) = rx1857_cur."!mark_peek"($I10)
    rx1857_cur."!cursor_pos"($I11)
    ($P10) = rx1857_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1857_pos, "")
    rx1857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1860_done
  rxcap_1860_fail:
    goto rx1857_fail
  rxcap_1860_done:
  # rx subrule "panic" subtype=method negate=
    rx1857_cur."!cursor_pos"(rx1857_pos)
    $P10 = rx1857_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1857_fail
    rx1857_pos = $P10."pos"()
.annotate 'line', 555
  # rx pass
    rx1857_cur."!cursor_pass"(rx1857_pos, "infix:sym<=>")
    if_null rx1857_debug, debug_999
    rx1857_cur."!cursor_debug"("PASS", "infix:sym<=>", " at pos=", rx1857_pos)
  debug_999:
    .return (rx1857_cur)
  rx1857_restart:
.annotate 'line', 4
    if_null rx1857_debug, debug_1000
    rx1857_cur."!cursor_debug"("NEXT", "infix:sym<=>")
  debug_1000:
  rx1857_fail:
    (rx1857_rep, rx1857_pos, $I10, $P10) = rx1857_cur."!mark_fail"(0)
    lt rx1857_pos, -1, rx1857_done
    eq rx1857_pos, -1, rx1857_fail
    jump $I10
  rx1857_done:
    rx1857_cur."!cursor_fail"()
    if_null rx1857_debug, debug_1001
    rx1857_cur."!cursor_debug"("FAIL", "infix:sym<=>")
  debug_1001:
    .return (rx1857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("337_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("panic", "=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("338_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1862_tgt
    .local int rx1862_pos
    .local int rx1862_off
    .local int rx1862_eos
    .local int rx1862_rep
    .local pmc rx1862_cur
    .local pmc rx1862_debug
    (rx1862_cur, rx1862_pos, rx1862_tgt, $I10) = self."!cursor_start"()
    getattribute rx1862_debug, rx1862_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1862_cur
    .local pmc match
    .lex "$/", match
    length rx1862_eos, rx1862_tgt
    gt rx1862_pos, rx1862_eos, rx1862_done
    set rx1862_off, 0
    lt rx1862_pos, 2, rx1862_start
    sub rx1862_off, rx1862_pos, 1
    substr rx1862_tgt, rx1862_tgt, rx1862_off
  rx1862_start:
    eq $I10, 1, rx1862_restart
    if_null rx1862_debug, debug_1002
    rx1862_cur."!cursor_debug"("START", "infix:sym<:=>")
  debug_1002:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1864_done
    goto rxscan1864_scan
  rxscan1864_loop:
    ($P10) = rx1862_cur."from"()
    inc $P10
    set rx1862_pos, $P10
    ge rx1862_pos, rx1862_eos, rxscan1864_done
  rxscan1864_scan:
    set_addr $I10, rxscan1864_loop
    rx1862_cur."!mark_push"(0, rx1862_pos, $I10)
  rxscan1864_done:
.annotate 'line', 558
  # rx subcapture "sym"
    set_addr $I10, rxcap_1865_fail
    rx1862_cur."!mark_push"(0, rx1862_pos, $I10)
  # rx literal  ":="
    add $I11, rx1862_pos, 2
    gt $I11, rx1862_eos, rx1862_fail
    sub $I11, rx1862_pos, rx1862_off
    substr $S10, rx1862_tgt, $I11, 2
    ne $S10, ":=", rx1862_fail
    add rx1862_pos, 2
    set_addr $I10, rxcap_1865_fail
    ($I12, $I11) = rx1862_cur."!mark_peek"($I10)
    rx1862_cur."!cursor_pos"($I11)
    ($P10) = rx1862_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1862_pos, "")
    rx1862_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1865_done
  rxcap_1865_fail:
    goto rx1862_fail
  rxcap_1865_done:
  # rx subrule "O" subtype=capture negate=
    rx1862_cur."!cursor_pos"(rx1862_pos)
    $P10 = rx1862_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1862_fail
    rx1862_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1862_pos = $P10."pos"()
  # rx pass
    rx1862_cur."!cursor_pass"(rx1862_pos, "infix:sym<:=>")
    if_null rx1862_debug, debug_1003
    rx1862_cur."!cursor_debug"("PASS", "infix:sym<:=>", " at pos=", rx1862_pos)
  debug_1003:
    .return (rx1862_cur)
  rx1862_restart:
.annotate 'line', 4
    if_null rx1862_debug, debug_1004
    rx1862_cur."!cursor_debug"("NEXT", "infix:sym<:=>")
  debug_1004:
  rx1862_fail:
    (rx1862_rep, rx1862_pos, $I10, $P10) = rx1862_cur."!mark_fail"(0)
    lt rx1862_pos, -1, rx1862_done
    eq rx1862_pos, -1, rx1862_fail
    jump $I10
  rx1862_done:
    rx1862_cur."!cursor_fail"()
    if_null rx1862_debug, debug_1005
    rx1862_cur."!cursor_debug"("FAIL", "infix:sym<:=>")
  debug_1005:
    .return (rx1862_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("339_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", ":=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("340_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1867_tgt
    .local int rx1867_pos
    .local int rx1867_off
    .local int rx1867_eos
    .local int rx1867_rep
    .local pmc rx1867_cur
    .local pmc rx1867_debug
    (rx1867_cur, rx1867_pos, rx1867_tgt, $I10) = self."!cursor_start"()
    getattribute rx1867_debug, rx1867_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1867_cur
    .local pmc match
    .lex "$/", match
    length rx1867_eos, rx1867_tgt
    gt rx1867_pos, rx1867_eos, rx1867_done
    set rx1867_off, 0
    lt rx1867_pos, 2, rx1867_start
    sub rx1867_off, rx1867_pos, 1
    substr rx1867_tgt, rx1867_tgt, rx1867_off
  rx1867_start:
    eq $I10, 1, rx1867_restart
    if_null rx1867_debug, debug_1006
    rx1867_cur."!cursor_debug"("START", "infix:sym<::=>")
  debug_1006:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1869_done
    goto rxscan1869_scan
  rxscan1869_loop:
    ($P10) = rx1867_cur."from"()
    inc $P10
    set rx1867_pos, $P10
    ge rx1867_pos, rx1867_eos, rxscan1869_done
  rxscan1869_scan:
    set_addr $I10, rxscan1869_loop
    rx1867_cur."!mark_push"(0, rx1867_pos, $I10)
  rxscan1869_done:
.annotate 'line', 559
  # rx subcapture "sym"
    set_addr $I10, rxcap_1870_fail
    rx1867_cur."!mark_push"(0, rx1867_pos, $I10)
  # rx literal  "::="
    add $I11, rx1867_pos, 3
    gt $I11, rx1867_eos, rx1867_fail
    sub $I11, rx1867_pos, rx1867_off
    substr $S10, rx1867_tgt, $I11, 3
    ne $S10, "::=", rx1867_fail
    add rx1867_pos, 3
    set_addr $I10, rxcap_1870_fail
    ($I12, $I11) = rx1867_cur."!mark_peek"($I10)
    rx1867_cur."!cursor_pos"($I11)
    ($P10) = rx1867_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1867_pos, "")
    rx1867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1870_done
  rxcap_1870_fail:
    goto rx1867_fail
  rxcap_1870_done:
  # rx subrule "O" subtype=capture negate=
    rx1867_cur."!cursor_pos"(rx1867_pos)
    $P10 = rx1867_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1867_fail
    rx1867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1867_pos = $P10."pos"()
  # rx pass
    rx1867_cur."!cursor_pass"(rx1867_pos, "infix:sym<::=>")
    if_null rx1867_debug, debug_1007
    rx1867_cur."!cursor_debug"("PASS", "infix:sym<::=>", " at pos=", rx1867_pos)
  debug_1007:
    .return (rx1867_cur)
  rx1867_restart:
.annotate 'line', 4
    if_null rx1867_debug, debug_1008
    rx1867_cur."!cursor_debug"("NEXT", "infix:sym<::=>")
  debug_1008:
  rx1867_fail:
    (rx1867_rep, rx1867_pos, $I10, $P10) = rx1867_cur."!mark_fail"(0)
    lt rx1867_pos, -1, rx1867_done
    eq rx1867_pos, -1, rx1867_fail
    jump $I10
  rx1867_done:
    rx1867_cur."!cursor_fail"()
    if_null rx1867_debug, debug_1009
    rx1867_cur."!cursor_debug"("FAIL", "infix:sym<::=>")
  debug_1009:
    .return (rx1867_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("341_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", "::=")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("342_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1872_tgt
    .local int rx1872_pos
    .local int rx1872_off
    .local int rx1872_eos
    .local int rx1872_rep
    .local pmc rx1872_cur
    .local pmc rx1872_debug
    (rx1872_cur, rx1872_pos, rx1872_tgt, $I10) = self."!cursor_start"()
    getattribute rx1872_debug, rx1872_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1872_cur
    .local pmc match
    .lex "$/", match
    length rx1872_eos, rx1872_tgt
    gt rx1872_pos, rx1872_eos, rx1872_done
    set rx1872_off, 0
    lt rx1872_pos, 2, rx1872_start
    sub rx1872_off, rx1872_pos, 1
    substr rx1872_tgt, rx1872_tgt, rx1872_off
  rx1872_start:
    eq $I10, 1, rx1872_restart
    if_null rx1872_debug, debug_1010
    rx1872_cur."!cursor_debug"("START", "infix:sym<,>")
  debug_1010:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1874_done
    goto rxscan1874_scan
  rxscan1874_loop:
    ($P10) = rx1872_cur."from"()
    inc $P10
    set rx1872_pos, $P10
    ge rx1872_pos, rx1872_eos, rxscan1874_done
  rxscan1874_scan:
    set_addr $I10, rxscan1874_loop
    rx1872_cur."!mark_push"(0, rx1872_pos, $I10)
  rxscan1874_done:
.annotate 'line', 561
  # rx subcapture "sym"
    set_addr $I10, rxcap_1875_fail
    rx1872_cur."!mark_push"(0, rx1872_pos, $I10)
  # rx literal  ","
    add $I11, rx1872_pos, 1
    gt $I11, rx1872_eos, rx1872_fail
    sub $I11, rx1872_pos, rx1872_off
    ord $I11, rx1872_tgt, $I11
    ne $I11, 44, rx1872_fail
    add rx1872_pos, 1
    set_addr $I10, rxcap_1875_fail
    ($I12, $I11) = rx1872_cur."!mark_peek"($I10)
    rx1872_cur."!cursor_pos"($I11)
    ($P10) = rx1872_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1872_pos, "")
    rx1872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1875_done
  rxcap_1875_fail:
    goto rx1872_fail
  rxcap_1875_done:
  # rx subrule "O" subtype=capture negate=
    rx1872_cur."!cursor_pos"(rx1872_pos)
    $P10 = rx1872_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1872_fail
    rx1872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1872_pos = $P10."pos"()
  # rx pass
    rx1872_cur."!cursor_pass"(rx1872_pos, "infix:sym<,>")
    if_null rx1872_debug, debug_1011
    rx1872_cur."!cursor_debug"("PASS", "infix:sym<,>", " at pos=", rx1872_pos)
  debug_1011:
    .return (rx1872_cur)
  rx1872_restart:
.annotate 'line', 4
    if_null rx1872_debug, debug_1012
    rx1872_cur."!cursor_debug"("NEXT", "infix:sym<,>")
  debug_1012:
  rx1872_fail:
    (rx1872_rep, rx1872_pos, $I10, $P10) = rx1872_cur."!mark_fail"(0)
    lt rx1872_pos, -1, rx1872_done
    eq rx1872_pos, -1, rx1872_fail
    jump $I10
  rx1872_done:
    rx1872_cur."!cursor_fail"()
    if_null rx1872_debug, debug_1013
    rx1872_cur."!cursor_debug"("FAIL", "infix:sym<,>")
  debug_1013:
    .return (rx1872_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("343_1309998847.42912") :method
.annotate 'line', 4
    $P100 = self."!PREFIX__!subrule"("O", ",")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("344_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1877_tgt
    .local int rx1877_pos
    .local int rx1877_off
    .local int rx1877_eos
    .local int rx1877_rep
    .local pmc rx1877_cur
    .local pmc rx1877_debug
    (rx1877_cur, rx1877_pos, rx1877_tgt, $I10) = self."!cursor_start"()
    getattribute rx1877_debug, rx1877_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1877_cur
    .local pmc match
    .lex "$/", match
    length rx1877_eos, rx1877_tgt
    gt rx1877_pos, rx1877_eos, rx1877_done
    set rx1877_off, 0
    lt rx1877_pos, 2, rx1877_start
    sub rx1877_off, rx1877_pos, 1
    substr rx1877_tgt, rx1877_tgt, rx1877_off
  rx1877_start:
    eq $I10, 1, rx1877_restart
    if_null rx1877_debug, debug_1014
    rx1877_cur."!cursor_debug"("START", "prefix:sym<return>")
  debug_1014:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1879_done
    goto rxscan1879_scan
  rxscan1879_loop:
    ($P10) = rx1877_cur."from"()
    inc $P10
    set rx1877_pos, $P10
    ge rx1877_pos, rx1877_eos, rxscan1879_done
  rxscan1879_scan:
    set_addr $I10, rxscan1879_loop
    rx1877_cur."!mark_push"(0, rx1877_pos, $I10)
  rxscan1879_done:
.annotate 'line', 563
  # rx subcapture "sym"
    set_addr $I10, rxcap_1880_fail
    rx1877_cur."!mark_push"(0, rx1877_pos, $I10)
  # rx literal  "return"
    add $I11, rx1877_pos, 6
    gt $I11, rx1877_eos, rx1877_fail
    sub $I11, rx1877_pos, rx1877_off
    substr $S10, rx1877_tgt, $I11, 6
    ne $S10, "return", rx1877_fail
    add rx1877_pos, 6
    set_addr $I10, rxcap_1880_fail
    ($I12, $I11) = rx1877_cur."!mark_peek"($I10)
    rx1877_cur."!cursor_pos"($I11)
    ($P10) = rx1877_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1877_pos, "")
    rx1877_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1880_done
  rxcap_1880_fail:
    goto rx1877_fail
  rxcap_1880_done:
  # rx charclass s
    ge rx1877_pos, rx1877_eos, rx1877_fail
    sub $I10, rx1877_pos, rx1877_off
    is_cclass $I11, 32, rx1877_tgt, $I10
    unless $I11, rx1877_fail
    inc rx1877_pos
  # rx subrule "O" subtype=capture negate=
    rx1877_cur."!cursor_pos"(rx1877_pos)
    $P10 = rx1877_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1877_fail
    rx1877_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1877_pos = $P10."pos"()
  # rx pass
    rx1877_cur."!cursor_pass"(rx1877_pos, "prefix:sym<return>")
    if_null rx1877_debug, debug_1015
    rx1877_cur."!cursor_debug"("PASS", "prefix:sym<return>", " at pos=", rx1877_pos)
  debug_1015:
    .return (rx1877_cur)
  rx1877_restart:
.annotate 'line', 4
    if_null rx1877_debug, debug_1016
    rx1877_cur."!cursor_debug"("NEXT", "prefix:sym<return>")
  debug_1016:
  rx1877_fail:
    (rx1877_rep, rx1877_pos, $I10, $P10) = rx1877_cur."!mark_fail"(0)
    lt rx1877_pos, -1, rx1877_done
    eq rx1877_pos, -1, rx1877_fail
    jump $I10
  rx1877_done:
    rx1877_cur."!cursor_fail"()
    if_null rx1877_debug, debug_1017
    rx1877_cur."!cursor_debug"("FAIL", "prefix:sym<return>")
  debug_1017:
    .return (rx1877_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("345_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "return"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("346_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1882_tgt
    .local int rx1882_pos
    .local int rx1882_off
    .local int rx1882_eos
    .local int rx1882_rep
    .local pmc rx1882_cur
    .local pmc rx1882_debug
    (rx1882_cur, rx1882_pos, rx1882_tgt, $I10) = self."!cursor_start"()
    getattribute rx1882_debug, rx1882_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1882_cur
    .local pmc match
    .lex "$/", match
    length rx1882_eos, rx1882_tgt
    gt rx1882_pos, rx1882_eos, rx1882_done
    set rx1882_off, 0
    lt rx1882_pos, 2, rx1882_start
    sub rx1882_off, rx1882_pos, 1
    substr rx1882_tgt, rx1882_tgt, rx1882_off
  rx1882_start:
    eq $I10, 1, rx1882_restart
    if_null rx1882_debug, debug_1018
    rx1882_cur."!cursor_debug"("START", "prefix:sym<make>")
  debug_1018:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1884_done
    goto rxscan1884_scan
  rxscan1884_loop:
    ($P10) = rx1882_cur."from"()
    inc $P10
    set rx1882_pos, $P10
    ge rx1882_pos, rx1882_eos, rxscan1884_done
  rxscan1884_scan:
    set_addr $I10, rxscan1884_loop
    rx1882_cur."!mark_push"(0, rx1882_pos, $I10)
  rxscan1884_done:
.annotate 'line', 564
  # rx subcapture "sym"
    set_addr $I10, rxcap_1885_fail
    rx1882_cur."!mark_push"(0, rx1882_pos, $I10)
  # rx literal  "make"
    add $I11, rx1882_pos, 4
    gt $I11, rx1882_eos, rx1882_fail
    sub $I11, rx1882_pos, rx1882_off
    substr $S10, rx1882_tgt, $I11, 4
    ne $S10, "make", rx1882_fail
    add rx1882_pos, 4
    set_addr $I10, rxcap_1885_fail
    ($I12, $I11) = rx1882_cur."!mark_peek"($I10)
    rx1882_cur."!cursor_pos"($I11)
    ($P10) = rx1882_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1882_pos, "")
    rx1882_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1885_done
  rxcap_1885_fail:
    goto rx1882_fail
  rxcap_1885_done:
  # rx charclass s
    ge rx1882_pos, rx1882_eos, rx1882_fail
    sub $I10, rx1882_pos, rx1882_off
    is_cclass $I11, 32, rx1882_tgt, $I10
    unless $I11, rx1882_fail
    inc rx1882_pos
  # rx subrule "O" subtype=capture negate=
    rx1882_cur."!cursor_pos"(rx1882_pos)
    $P10 = rx1882_cur."O"("%list_prefix")
    unless $P10, rx1882_fail
    rx1882_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1882_pos = $P10."pos"()
  # rx pass
    rx1882_cur."!cursor_pass"(rx1882_pos, "prefix:sym<make>")
    if_null rx1882_debug, debug_1019
    rx1882_cur."!cursor_debug"("PASS", "prefix:sym<make>", " at pos=", rx1882_pos)
  debug_1019:
    .return (rx1882_cur)
  rx1882_restart:
.annotate 'line', 4
    if_null rx1882_debug, debug_1020
    rx1882_cur."!cursor_debug"("NEXT", "prefix:sym<make>")
  debug_1020:
  rx1882_fail:
    (rx1882_rep, rx1882_pos, $I10, $P10) = rx1882_cur."!mark_fail"(0)
    lt rx1882_pos, -1, rx1882_done
    eq rx1882_pos, -1, rx1882_fail
    jump $I10
  rx1882_done:
    rx1882_cur."!cursor_fail"()
    if_null rx1882_debug, debug_1021
    rx1882_cur."!cursor_debug"("FAIL", "prefix:sym<make>")
  debug_1021:
    .return (rx1882_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("347_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "make"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<last>"  :subid("348_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1887_tgt
    .local int rx1887_pos
    .local int rx1887_off
    .local int rx1887_eos
    .local int rx1887_rep
    .local pmc rx1887_cur
    .local pmc rx1887_debug
    (rx1887_cur, rx1887_pos, rx1887_tgt, $I10) = self."!cursor_start"()
    getattribute rx1887_debug, rx1887_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1887_cur
    .local pmc match
    .lex "$/", match
    length rx1887_eos, rx1887_tgt
    gt rx1887_pos, rx1887_eos, rx1887_done
    set rx1887_off, 0
    lt rx1887_pos, 2, rx1887_start
    sub rx1887_off, rx1887_pos, 1
    substr rx1887_tgt, rx1887_tgt, rx1887_off
  rx1887_start:
    eq $I10, 1, rx1887_restart
    if_null rx1887_debug, debug_1022
    rx1887_cur."!cursor_debug"("START", "term:sym<last>")
  debug_1022:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1889_done
    goto rxscan1889_scan
  rxscan1889_loop:
    ($P10) = rx1887_cur."from"()
    inc $P10
    set rx1887_pos, $P10
    ge rx1887_pos, rx1887_eos, rxscan1889_done
  rxscan1889_scan:
    set_addr $I10, rxscan1889_loop
    rx1887_cur."!mark_push"(0, rx1887_pos, $I10)
  rxscan1889_done:
.annotate 'line', 565
  # rx subcapture "sym"
    set_addr $I10, rxcap_1890_fail
    rx1887_cur."!mark_push"(0, rx1887_pos, $I10)
  # rx literal  "last"
    add $I11, rx1887_pos, 4
    gt $I11, rx1887_eos, rx1887_fail
    sub $I11, rx1887_pos, rx1887_off
    substr $S10, rx1887_tgt, $I11, 4
    ne $S10, "last", rx1887_fail
    add rx1887_pos, 4
    set_addr $I10, rxcap_1890_fail
    ($I12, $I11) = rx1887_cur."!mark_peek"($I10)
    rx1887_cur."!cursor_pos"($I11)
    ($P10) = rx1887_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1887_pos, "")
    rx1887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1890_done
  rxcap_1890_fail:
    goto rx1887_fail
  rxcap_1890_done:
  # rx pass
    rx1887_cur."!cursor_pass"(rx1887_pos, "term:sym<last>")
    if_null rx1887_debug, debug_1023
    rx1887_cur."!cursor_debug"("PASS", "term:sym<last>", " at pos=", rx1887_pos)
  debug_1023:
    .return (rx1887_cur)
  rx1887_restart:
.annotate 'line', 4
    if_null rx1887_debug, debug_1024
    rx1887_cur."!cursor_debug"("NEXT", "term:sym<last>")
  debug_1024:
  rx1887_fail:
    (rx1887_rep, rx1887_pos, $I10, $P10) = rx1887_cur."!mark_fail"(0)
    lt rx1887_pos, -1, rx1887_done
    eq rx1887_pos, -1, rx1887_fail
    jump $I10
  rx1887_done:
    rx1887_cur."!cursor_fail"()
    if_null rx1887_debug, debug_1025
    rx1887_cur."!cursor_debug"("FAIL", "term:sym<last>")
  debug_1025:
    .return (rx1887_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<last>"  :subid("349_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "last"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<next>"  :subid("350_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1892_tgt
    .local int rx1892_pos
    .local int rx1892_off
    .local int rx1892_eos
    .local int rx1892_rep
    .local pmc rx1892_cur
    .local pmc rx1892_debug
    (rx1892_cur, rx1892_pos, rx1892_tgt, $I10) = self."!cursor_start"()
    getattribute rx1892_debug, rx1892_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1892_cur
    .local pmc match
    .lex "$/", match
    length rx1892_eos, rx1892_tgt
    gt rx1892_pos, rx1892_eos, rx1892_done
    set rx1892_off, 0
    lt rx1892_pos, 2, rx1892_start
    sub rx1892_off, rx1892_pos, 1
    substr rx1892_tgt, rx1892_tgt, rx1892_off
  rx1892_start:
    eq $I10, 1, rx1892_restart
    if_null rx1892_debug, debug_1026
    rx1892_cur."!cursor_debug"("START", "term:sym<next>")
  debug_1026:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1894_done
    goto rxscan1894_scan
  rxscan1894_loop:
    ($P10) = rx1892_cur."from"()
    inc $P10
    set rx1892_pos, $P10
    ge rx1892_pos, rx1892_eos, rxscan1894_done
  rxscan1894_scan:
    set_addr $I10, rxscan1894_loop
    rx1892_cur."!mark_push"(0, rx1892_pos, $I10)
  rxscan1894_done:
.annotate 'line', 566
  # rx subcapture "sym"
    set_addr $I10, rxcap_1895_fail
    rx1892_cur."!mark_push"(0, rx1892_pos, $I10)
  # rx literal  "next"
    add $I11, rx1892_pos, 4
    gt $I11, rx1892_eos, rx1892_fail
    sub $I11, rx1892_pos, rx1892_off
    substr $S10, rx1892_tgt, $I11, 4
    ne $S10, "next", rx1892_fail
    add rx1892_pos, 4
    set_addr $I10, rxcap_1895_fail
    ($I12, $I11) = rx1892_cur."!mark_peek"($I10)
    rx1892_cur."!cursor_pos"($I11)
    ($P10) = rx1892_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1892_pos, "")
    rx1892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1895_done
  rxcap_1895_fail:
    goto rx1892_fail
  rxcap_1895_done:
  # rx pass
    rx1892_cur."!cursor_pass"(rx1892_pos, "term:sym<next>")
    if_null rx1892_debug, debug_1027
    rx1892_cur."!cursor_debug"("PASS", "term:sym<next>", " at pos=", rx1892_pos)
  debug_1027:
    .return (rx1892_cur)
  rx1892_restart:
.annotate 'line', 4
    if_null rx1892_debug, debug_1028
    rx1892_cur."!cursor_debug"("NEXT", "term:sym<next>")
  debug_1028:
  rx1892_fail:
    (rx1892_rep, rx1892_pos, $I10, $P10) = rx1892_cur."!mark_fail"(0)
    lt rx1892_pos, -1, rx1892_done
    eq rx1892_pos, -1, rx1892_fail
    jump $I10
  rx1892_done:
    rx1892_cur."!cursor_fail"()
    if_null rx1892_debug, debug_1029
    rx1892_cur."!cursor_debug"("FAIL", "term:sym<next>")
  debug_1029:
    .return (rx1892_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<next>"  :subid("351_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "next"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<redo>"  :subid("352_1309998847.42912") :method :outer("11_1309998847.42912")
.annotate 'line', 4
    .local string rx1897_tgt
    .local int rx1897_pos
    .local int rx1897_off
    .local int rx1897_eos
    .local int rx1897_rep
    .local pmc rx1897_cur
    .local pmc rx1897_debug
    (rx1897_cur, rx1897_pos, rx1897_tgt, $I10) = self."!cursor_start"()
    getattribute rx1897_debug, rx1897_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1897_cur
    .local pmc match
    .lex "$/", match
    length rx1897_eos, rx1897_tgt
    gt rx1897_pos, rx1897_eos, rx1897_done
    set rx1897_off, 0
    lt rx1897_pos, 2, rx1897_start
    sub rx1897_off, rx1897_pos, 1
    substr rx1897_tgt, rx1897_tgt, rx1897_off
  rx1897_start:
    eq $I10, 1, rx1897_restart
    if_null rx1897_debug, debug_1030
    rx1897_cur."!cursor_debug"("START", "term:sym<redo>")
  debug_1030:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1899_done
    goto rxscan1899_scan
  rxscan1899_loop:
    ($P10) = rx1897_cur."from"()
    inc $P10
    set rx1897_pos, $P10
    ge rx1897_pos, rx1897_eos, rxscan1899_done
  rxscan1899_scan:
    set_addr $I10, rxscan1899_loop
    rx1897_cur."!mark_push"(0, rx1897_pos, $I10)
  rxscan1899_done:
.annotate 'line', 567
  # rx subcapture "sym"
    set_addr $I10, rxcap_1900_fail
    rx1897_cur."!mark_push"(0, rx1897_pos, $I10)
  # rx literal  "redo"
    add $I11, rx1897_pos, 4
    gt $I11, rx1897_eos, rx1897_fail
    sub $I11, rx1897_pos, rx1897_off
    substr $S10, rx1897_tgt, $I11, 4
    ne $S10, "redo", rx1897_fail
    add rx1897_pos, 4
    set_addr $I10, rxcap_1900_fail
    ($I12, $I11) = rx1897_cur."!mark_peek"($I10)
    rx1897_cur."!cursor_pos"($I11)
    ($P10) = rx1897_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1897_pos, "")
    rx1897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1900_done
  rxcap_1900_fail:
    goto rx1897_fail
  rxcap_1900_done:
  # rx pass
    rx1897_cur."!cursor_pass"(rx1897_pos, "term:sym<redo>")
    if_null rx1897_debug, debug_1031
    rx1897_cur."!cursor_debug"("PASS", "term:sym<redo>", " at pos=", rx1897_pos)
  debug_1031:
    .return (rx1897_cur)
  rx1897_restart:
.annotate 'line', 4
    if_null rx1897_debug, debug_1032
    rx1897_cur."!cursor_debug"("NEXT", "term:sym<redo>")
  debug_1032:
  rx1897_fail:
    (rx1897_rep, rx1897_pos, $I10, $P10) = rx1897_cur."!mark_fail"(0)
    lt rx1897_pos, -1, rx1897_done
    eq rx1897_pos, -1, rx1897_fail
    jump $I10
  rx1897_done:
    rx1897_cur."!cursor_fail"()
    if_null rx1897_debug, debug_1033
    rx1897_cur."!cursor_debug"("FAIL", "term:sym<redo>")
  debug_1033:
    .return (rx1897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<redo>"  :subid("353_1309998847.42912") :method
.annotate 'line', 4
    new $P100, "ResizablePMCArray"
    push $P100, "redo"
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.include "except_types.pasm"
.sub "smartmatch"  :subid("354_1309998847.42912") :method :outer("11_1309998847.42912")
    .param pmc param_1904
.annotate 'line', 569
    new $P1903, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1903, control_1902
    push_eh $P1903
    .lex "self", self
    .lex "$/", param_1904
.annotate 'line', 571
    new $P100, "Undef"
    set $P1905, $P100
    .lex "$t", $P1905
    find_lex $P1906, "$/"
    unless_null $P1906, vivify_1034
    $P1906 = root_new ['parrot';'ResizablePMCArray']
  vivify_1034:
    set $P101, $P1906[0]
    unless_null $P101, vivify_1035
    new $P101, "Undef"
  vivify_1035:
    store_lex "$t", $P101
    find_lex $P1907, "$/"
    unless_null $P1907, vivify_1036
    $P1907 = root_new ['parrot';'ResizablePMCArray']
  vivify_1036:
    set $P101, $P1907[1]
    unless_null $P101, vivify_1037
    new $P101, "Undef"
  vivify_1037:
    find_lex $P1908, "$/"
    unless_null $P1908, vivify_1038
    $P1908 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1908
  vivify_1038:
    set $P1908[0], $P101
    find_lex $P101, "$t"
    find_lex $P1909, "$/"
    unless_null $P1909, vivify_1039
    $P1909 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1909
  vivify_1039:
    set $P1909[1], $P101
.annotate 'line', 569
    .return ($P101)
  control_1902:
    .local pmc exception
    .get_results (exception)
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["NQP";"Regex"]
.sub "_block1910"  :subid("355_1309998847.42912") :outer("11_1309998847.42912")
.annotate 'line', 575
    .const 'Sub' $P1959 = "374_1309998847.42912"
    capture_lex $P1959
    .const 'Sub' $P1955 = "372_1309998847.42912"
    capture_lex $P1955
    .const 'Sub' $P1945 = "369_1309998847.42912"
    capture_lex $P1945
    .const 'Sub' $P1936 = "366_1309998847.42912"
    capture_lex $P1936
    .const 'Sub' $P1932 = "364_1309998847.42912"
    capture_lex $P1932
    .const 'Sub' $P1924 = "361_1309998847.42912"
    capture_lex $P1924
    .const 'Sub' $P1920 = "359_1309998847.42912"
    capture_lex $P1920
    .const 'Sub' $P1912 = "356_1309998847.42912"
    capture_lex $P1912
    .const 'Sub' $P1959 = "374_1309998847.42912"
    capture_lex $P1959
    .return ($P1959)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("356_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .const 'Sub' $P1917 = "358_1309998847.42912"
    capture_lex $P1917
    .local string rx1913_tgt
    .local int rx1913_pos
    .local int rx1913_off
    .local int rx1913_eos
    .local int rx1913_rep
    .local pmc rx1913_cur
    .local pmc rx1913_debug
    (rx1913_cur, rx1913_pos, rx1913_tgt, $I10) = self."!cursor_start"()
    getattribute rx1913_debug, rx1913_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1913_cur
    .local pmc match
    .lex "$/", match
    length rx1913_eos, rx1913_tgt
    gt rx1913_pos, rx1913_eos, rx1913_done
    set rx1913_off, 0
    lt rx1913_pos, 2, rx1913_start
    sub rx1913_off, rx1913_pos, 1
    substr rx1913_tgt, rx1913_tgt, rx1913_off
  rx1913_start:
    eq $I10, 1, rx1913_restart
    if_null rx1913_debug, debug_1040
    rx1913_cur."!cursor_debug"("START", "metachar:sym<:my>")
  debug_1040:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1915_done
    goto rxscan1915_scan
  rxscan1915_loop:
    ($P10) = rx1913_cur."from"()
    inc $P10
    set rx1913_pos, $P10
    ge rx1913_pos, rx1913_eos, rxscan1915_done
  rxscan1915_scan:
    set_addr $I10, rxscan1915_loop
    rx1913_cur."!mark_push"(0, rx1913_pos, $I10)
  rxscan1915_done:
.annotate 'line', 577
  # rx literal  ":"
    add $I11, rx1913_pos, 1
    gt $I11, rx1913_eos, rx1913_fail
    sub $I11, rx1913_pos, rx1913_off
    ord $I11, rx1913_tgt, $I11
    ne $I11, 58, rx1913_fail
    add rx1913_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1913_cur."!cursor_pos"(rx1913_pos)
    .const 'Sub' $P1917 = "358_1309998847.42912"
    capture_lex $P1917
    $P10 = rx1913_cur."before"($P1917)
    unless $P10, rx1913_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1913_cur."!cursor_pos"(rx1913_pos)
    $P10 = rx1913_cur."LANG"("MAIN", "statement")
    unless $P10, rx1913_fail
    rx1913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1913_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1913_cur."!cursor_pos"(rx1913_pos)
    $P10 = rx1913_cur."ws"()
    unless $P10, rx1913_fail
    rx1913_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1913_pos, 1
    gt $I11, rx1913_eos, rx1913_fail
    sub $I11, rx1913_pos, rx1913_off
    ord $I11, rx1913_tgt, $I11
    ne $I11, 59, rx1913_fail
    add rx1913_pos, 1
.annotate 'line', 576
  # rx pass
    rx1913_cur."!cursor_pass"(rx1913_pos, "metachar:sym<:my>")
    if_null rx1913_debug, debug_1045
    rx1913_cur."!cursor_debug"("PASS", "metachar:sym<:my>", " at pos=", rx1913_pos)
  debug_1045:
    .return (rx1913_cur)
  rx1913_restart:
.annotate 'line', 575
    if_null rx1913_debug, debug_1046
    rx1913_cur."!cursor_debug"("NEXT", "metachar:sym<:my>")
  debug_1046:
  rx1913_fail:
    (rx1913_rep, rx1913_pos, $I10, $P10) = rx1913_cur."!mark_fail"(0)
    lt rx1913_pos, -1, rx1913_done
    eq rx1913_pos, -1, rx1913_fail
    jump $I10
  rx1913_done:
    rx1913_cur."!cursor_fail"()
    if_null rx1913_debug, debug_1047
    rx1913_cur."!cursor_debug"("FAIL", "metachar:sym<:my>")
  debug_1047:
    .return (rx1913_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("357_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, ":"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "_block1916"  :anon :subid("358_1309998847.42912") :method :outer("356_1309998847.42912")
.annotate 'line', 577
    .local string rx1918_tgt
    .local int rx1918_pos
    .local int rx1918_off
    .local int rx1918_eos
    .local int rx1918_rep
    .local pmc rx1918_cur
    .local pmc rx1918_debug
    (rx1918_cur, rx1918_pos, rx1918_tgt, $I10) = self."!cursor_start"()
    getattribute rx1918_debug, rx1918_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1918_cur
    .local pmc match
    .lex "$/", match
    length rx1918_eos, rx1918_tgt
    gt rx1918_pos, rx1918_eos, rx1918_done
    set rx1918_off, 0
    lt rx1918_pos, 2, rx1918_start
    sub rx1918_off, rx1918_pos, 1
    substr rx1918_tgt, rx1918_tgt, rx1918_off
  rx1918_start:
    eq $I10, 1, rx1918_restart
    if_null rx1918_debug, debug_1041
    rx1918_cur."!cursor_debug"("START", "")
  debug_1041:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1919_done
    goto rxscan1919_scan
  rxscan1919_loop:
    ($P10) = rx1918_cur."from"()
    inc $P10
    set rx1918_pos, $P10
    ge rx1918_pos, rx1918_eos, rxscan1919_done
  rxscan1919_scan:
    set_addr $I10, rxscan1919_loop
    rx1918_cur."!mark_push"(0, rx1918_pos, $I10)
  rxscan1919_done:
  # rx literal  "my"
    add $I11, rx1918_pos, 2
    gt $I11, rx1918_eos, rx1918_fail
    sub $I11, rx1918_pos, rx1918_off
    substr $S10, rx1918_tgt, $I11, 2
    ne $S10, "my", rx1918_fail
    add rx1918_pos, 2
  # rx pass
    rx1918_cur."!cursor_pass"(rx1918_pos, "")
    if_null rx1918_debug, debug_1042
    rx1918_cur."!cursor_debug"("PASS", "", " at pos=", rx1918_pos)
  debug_1042:
    .return (rx1918_cur)
  rx1918_restart:
    if_null rx1918_debug, debug_1043
    rx1918_cur."!cursor_debug"("NEXT", "")
  debug_1043:
  rx1918_fail:
    (rx1918_rep, rx1918_pos, $I10, $P10) = rx1918_cur."!mark_fail"(0)
    lt rx1918_pos, -1, rx1918_done
    eq rx1918_pos, -1, rx1918_fail
    jump $I10
  rx1918_done:
    rx1918_cur."!cursor_fail"()
    if_null rx1918_debug, debug_1044
    rx1918_cur."!cursor_debug"("FAIL", "")
  debug_1044:
    .return (rx1918_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("359_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .local string rx1921_tgt
    .local int rx1921_pos
    .local int rx1921_off
    .local int rx1921_eos
    .local int rx1921_rep
    .local pmc rx1921_cur
    .local pmc rx1921_debug
    (rx1921_cur, rx1921_pos, rx1921_tgt, $I10) = self."!cursor_start"()
    getattribute rx1921_debug, rx1921_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1921_cur
    .local pmc match
    .lex "$/", match
    length rx1921_eos, rx1921_tgt
    gt rx1921_pos, rx1921_eos, rx1921_done
    set rx1921_off, 0
    lt rx1921_pos, 2, rx1921_start
    sub rx1921_off, rx1921_pos, 1
    substr rx1921_tgt, rx1921_tgt, rx1921_off
  rx1921_start:
    eq $I10, 1, rx1921_restart
    if_null rx1921_debug, debug_1048
    rx1921_cur."!cursor_debug"("START", "metachar:sym<{ }>")
  debug_1048:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1923_done
    goto rxscan1923_scan
  rxscan1923_loop:
    ($P10) = rx1921_cur."from"()
    inc $P10
    set rx1921_pos, $P10
    ge rx1921_pos, rx1921_eos, rxscan1923_done
  rxscan1923_scan:
    set_addr $I10, rxscan1923_loop
    rx1921_cur."!mark_push"(0, rx1921_pos, $I10)
  rxscan1923_done:
.annotate 'line', 581
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1921_pos, rx1921_off
    substr $S10, rx1921_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1921_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1921_cur."!cursor_pos"(rx1921_pos)
    $P10 = rx1921_cur."codeblock"()
    unless $P10, rx1921_fail
    rx1921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1921_pos = $P10."pos"()
.annotate 'line', 580
  # rx pass
    rx1921_cur."!cursor_pass"(rx1921_pos, "metachar:sym<{ }>")
    if_null rx1921_debug, debug_1049
    rx1921_cur."!cursor_debug"("PASS", "metachar:sym<{ }>", " at pos=", rx1921_pos)
  debug_1049:
    .return (rx1921_cur)
  rx1921_restart:
.annotate 'line', 575
    if_null rx1921_debug, debug_1050
    rx1921_cur."!cursor_debug"("NEXT", "metachar:sym<{ }>")
  debug_1050:
  rx1921_fail:
    (rx1921_rep, rx1921_pos, $I10, $P10) = rx1921_cur."!mark_fail"(0)
    lt rx1921_pos, -1, rx1921_done
    eq rx1921_pos, -1, rx1921_fail
    jump $I10
  rx1921_done:
    rx1921_cur."!cursor_fail"()
    if_null rx1921_debug, debug_1051
    rx1921_cur."!cursor_debug"("FAIL", "metachar:sym<{ }>")
  debug_1051:
    .return (rx1921_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("360_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, "{"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<nqpvar>"  :subid("361_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .const 'Sub' $P1929 = "363_1309998847.42912"
    capture_lex $P1929
    .local string rx1925_tgt
    .local int rx1925_pos
    .local int rx1925_off
    .local int rx1925_eos
    .local int rx1925_rep
    .local pmc rx1925_cur
    .local pmc rx1925_debug
    (rx1925_cur, rx1925_pos, rx1925_tgt, $I10) = self."!cursor_start"()
    getattribute rx1925_debug, rx1925_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1925_cur
    .local pmc match
    .lex "$/", match
    length rx1925_eos, rx1925_tgt
    gt rx1925_pos, rx1925_eos, rx1925_done
    set rx1925_off, 0
    lt rx1925_pos, 2, rx1925_start
    sub rx1925_off, rx1925_pos, 1
    substr rx1925_tgt, rx1925_tgt, rx1925_off
  rx1925_start:
    eq $I10, 1, rx1925_restart
    if_null rx1925_debug, debug_1052
    rx1925_cur."!cursor_debug"("START", "metachar:sym<nqpvar>")
  debug_1052:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1927_done
    goto rxscan1927_scan
  rxscan1927_loop:
    ($P10) = rx1925_cur."from"()
    inc $P10
    set rx1925_pos, $P10
    ge rx1925_pos, rx1925_eos, rxscan1927_done
  rxscan1927_scan:
    set_addr $I10, rxscan1927_loop
    rx1925_cur."!mark_push"(0, rx1925_pos, $I10)
  rxscan1927_done:
.annotate 'line', 585
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1925_pos, rx1925_off
    substr $S10, rx1925_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1925_fail
  # rx subrule "before" subtype=zerowidth negate=
    rx1925_cur."!cursor_pos"(rx1925_pos)
    .const 'Sub' $P1929 = "363_1309998847.42912"
    capture_lex $P1929
    $P10 = rx1925_cur."before"($P1929)
    unless $P10, rx1925_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1925_cur."!cursor_pos"(rx1925_pos)
    $P10 = rx1925_cur."LANG"("MAIN", "variable")
    unless $P10, rx1925_fail
    rx1925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1925_pos = $P10."pos"()
.annotate 'line', 584
  # rx pass
    rx1925_cur."!cursor_pass"(rx1925_pos, "metachar:sym<nqpvar>")
    if_null rx1925_debug, debug_1057
    rx1925_cur."!cursor_debug"("PASS", "metachar:sym<nqpvar>", " at pos=", rx1925_pos)
  debug_1057:
    .return (rx1925_cur)
  rx1925_restart:
.annotate 'line', 575
    if_null rx1925_debug, debug_1058
    rx1925_cur."!cursor_debug"("NEXT", "metachar:sym<nqpvar>")
  debug_1058:
  rx1925_fail:
    (rx1925_rep, rx1925_pos, $I10, $P10) = rx1925_cur."!mark_fail"(0)
    lt rx1925_pos, -1, rx1925_done
    eq rx1925_pos, -1, rx1925_fail
    jump $I10
  rx1925_done:
    rx1925_cur."!cursor_fail"()
    if_null rx1925_debug, debug_1059
    rx1925_cur."!cursor_debug"("FAIL", "metachar:sym<nqpvar>")
  debug_1059:
    .return (rx1925_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<nqpvar>"  :subid("362_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, "$"
    push $P100, "@"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "_block1928"  :anon :subid("363_1309998847.42912") :method :outer("361_1309998847.42912")
.annotate 'line', 585
    .local string rx1930_tgt
    .local int rx1930_pos
    .local int rx1930_off
    .local int rx1930_eos
    .local int rx1930_rep
    .local pmc rx1930_cur
    .local pmc rx1930_debug
    (rx1930_cur, rx1930_pos, rx1930_tgt, $I10) = self."!cursor_start"()
    getattribute rx1930_debug, rx1930_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1930_cur
    .local pmc match
    .lex "$/", match
    length rx1930_eos, rx1930_tgt
    gt rx1930_pos, rx1930_eos, rx1930_done
    set rx1930_off, 0
    lt rx1930_pos, 2, rx1930_start
    sub rx1930_off, rx1930_pos, 1
    substr rx1930_tgt, rx1930_tgt, rx1930_off
  rx1930_start:
    eq $I10, 1, rx1930_restart
    if_null rx1930_debug, debug_1053
    rx1930_cur."!cursor_debug"("START", "")
  debug_1053:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1931_done
    goto rxscan1931_scan
  rxscan1931_loop:
    ($P10) = rx1930_cur."from"()
    inc $P10
    set rx1930_pos, $P10
    ge rx1930_pos, rx1930_eos, rxscan1931_done
  rxscan1931_scan:
    set_addr $I10, rxscan1931_loop
    rx1930_cur."!mark_push"(0, rx1930_pos, $I10)
  rxscan1931_done:
  # rx charclass .
    ge rx1930_pos, rx1930_eos, rx1930_fail
    inc rx1930_pos
  # rx charclass w
    ge rx1930_pos, rx1930_eos, rx1930_fail
    sub $I10, rx1930_pos, rx1930_off
    is_cclass $I11, 8192, rx1930_tgt, $I10
    unless $I11, rx1930_fail
    inc rx1930_pos
  # rx pass
    rx1930_cur."!cursor_pass"(rx1930_pos, "")
    if_null rx1930_debug, debug_1054
    rx1930_cur."!cursor_debug"("PASS", "", " at pos=", rx1930_pos)
  debug_1054:
    .return (rx1930_cur)
  rx1930_restart:
    if_null rx1930_debug, debug_1055
    rx1930_cur."!cursor_debug"("NEXT", "")
  debug_1055:
  rx1930_fail:
    (rx1930_rep, rx1930_pos, $I10, $P10) = rx1930_cur."!mark_fail"(0)
    lt rx1930_pos, -1, rx1930_done
    eq rx1930_pos, -1, rx1930_fail
    jump $I10
  rx1930_done:
    rx1930_cur."!cursor_fail"()
    if_null rx1930_debug, debug_1056
    rx1930_cur."!cursor_debug"("FAIL", "")
  debug_1056:
    .return (rx1930_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("364_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .local string rx1933_tgt
    .local int rx1933_pos
    .local int rx1933_off
    .local int rx1933_eos
    .local int rx1933_rep
    .local pmc rx1933_cur
    .local pmc rx1933_debug
    (rx1933_cur, rx1933_pos, rx1933_tgt, $I10) = self."!cursor_start"()
    getattribute rx1933_debug, rx1933_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1933_cur
    .local pmc match
    .lex "$/", match
    length rx1933_eos, rx1933_tgt
    gt rx1933_pos, rx1933_eos, rx1933_done
    set rx1933_off, 0
    lt rx1933_pos, 2, rx1933_start
    sub rx1933_off, rx1933_pos, 1
    substr rx1933_tgt, rx1933_tgt, rx1933_off
  rx1933_start:
    eq $I10, 1, rx1933_restart
    if_null rx1933_debug, debug_1060
    rx1933_cur."!cursor_debug"("START", "assertion:sym<{ }>")
  debug_1060:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1935_done
    goto rxscan1935_scan
  rxscan1935_loop:
    ($P10) = rx1933_cur."from"()
    inc $P10
    set rx1933_pos, $P10
    ge rx1933_pos, rx1933_eos, rxscan1935_done
  rxscan1935_scan:
    set_addr $I10, rxscan1935_loop
    rx1933_cur."!mark_push"(0, rx1933_pos, $I10)
  rxscan1935_done:
.annotate 'line', 589
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1933_pos, rx1933_off
    substr $S10, rx1933_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1933_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1933_cur."!cursor_pos"(rx1933_pos)
    $P10 = rx1933_cur."codeblock"()
    unless $P10, rx1933_fail
    rx1933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1933_pos = $P10."pos"()
.annotate 'line', 588
  # rx pass
    rx1933_cur."!cursor_pass"(rx1933_pos, "assertion:sym<{ }>")
    if_null rx1933_debug, debug_1061
    rx1933_cur."!cursor_debug"("PASS", "assertion:sym<{ }>", " at pos=", rx1933_pos)
  debug_1061:
    .return (rx1933_cur)
  rx1933_restart:
.annotate 'line', 575
    if_null rx1933_debug, debug_1062
    rx1933_cur."!cursor_debug"("NEXT", "assertion:sym<{ }>")
  debug_1062:
  rx1933_fail:
    (rx1933_rep, rx1933_pos, $I10, $P10) = rx1933_cur."!mark_fail"(0)
    lt rx1933_pos, -1, rx1933_done
    eq rx1933_pos, -1, rx1933_fail
    jump $I10
  rx1933_done:
    rx1933_cur."!cursor_fail"()
    if_null rx1933_debug, debug_1063
    rx1933_cur."!cursor_debug"("FAIL", "assertion:sym<{ }>")
  debug_1063:
    .return (rx1933_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("365_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, "{"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<?{ }>"  :subid("366_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .const 'Sub' $P1941 = "368_1309998847.42912"
    capture_lex $P1941
    .local string rx1937_tgt
    .local int rx1937_pos
    .local int rx1937_off
    .local int rx1937_eos
    .local int rx1937_rep
    .local pmc rx1937_cur
    .local pmc rx1937_debug
    (rx1937_cur, rx1937_pos, rx1937_tgt, $I10) = self."!cursor_start"()
    getattribute rx1937_debug, rx1937_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1937_cur
    .local pmc match
    .lex "$/", match
    length rx1937_eos, rx1937_tgt
    gt rx1937_pos, rx1937_eos, rx1937_done
    set rx1937_off, 0
    lt rx1937_pos, 2, rx1937_start
    sub rx1937_off, rx1937_pos, 1
    substr rx1937_tgt, rx1937_tgt, rx1937_off
  rx1937_start:
    eq $I10, 1, rx1937_restart
    if_null rx1937_debug, debug_1064
    rx1937_cur."!cursor_debug"("START", "assertion:sym<?{ }>")
  debug_1064:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1939_done
    goto rxscan1939_scan
  rxscan1939_loop:
    ($P10) = rx1937_cur."from"()
    inc $P10
    set rx1937_pos, $P10
    ge rx1937_pos, rx1937_eos, rxscan1939_done
  rxscan1939_scan:
    set_addr $I10, rxscan1939_loop
    rx1937_cur."!mark_push"(0, rx1937_pos, $I10)
  rxscan1939_done:
.annotate 'line', 593
  # rx subcapture "zw"
    set_addr $I10, rxcap_1944_fail
    rx1937_cur."!mark_push"(0, rx1937_pos, $I10)
  # rx enumcharlist negate=0
    ge rx1937_pos, rx1937_eos, rx1937_fail
    sub $I10, rx1937_pos, rx1937_off
    substr $S10, rx1937_tgt, $I10, 1
    index $I11, "?!", $S10
    lt $I11, 0, rx1937_fail
    inc rx1937_pos
  # rx subrule "before" subtype=zerowidth negate=
    rx1937_cur."!cursor_pos"(rx1937_pos)
    .const 'Sub' $P1941 = "368_1309998847.42912"
    capture_lex $P1941
    $P10 = rx1937_cur."before"($P1941)
    unless $P10, rx1937_fail
    set_addr $I10, rxcap_1944_fail
    ($I12, $I11) = rx1937_cur."!mark_peek"($I10)
    rx1937_cur."!cursor_pos"($I11)
    ($P10) = rx1937_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1937_pos, "")
    rx1937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("zw")
    goto rxcap_1944_done
  rxcap_1944_fail:
    goto rx1937_fail
  rxcap_1944_done:
  # rx subrule "codeblock" subtype=capture negate=
    rx1937_cur."!cursor_pos"(rx1937_pos)
    $P10 = rx1937_cur."codeblock"()
    unless $P10, rx1937_fail
    rx1937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1937_pos = $P10."pos"()
.annotate 'line', 592
  # rx pass
    rx1937_cur."!cursor_pass"(rx1937_pos, "assertion:sym<?{ }>")
    if_null rx1937_debug, debug_1069
    rx1937_cur."!cursor_debug"("PASS", "assertion:sym<?{ }>", " at pos=", rx1937_pos)
  debug_1069:
    .return (rx1937_cur)
  rx1937_restart:
.annotate 'line', 575
    if_null rx1937_debug, debug_1070
    rx1937_cur."!cursor_debug"("NEXT", "assertion:sym<?{ }>")
  debug_1070:
  rx1937_fail:
    (rx1937_rep, rx1937_pos, $I10, $P10) = rx1937_cur."!mark_fail"(0)
    lt rx1937_pos, -1, rx1937_done
    eq rx1937_pos, -1, rx1937_fail
    jump $I10
  rx1937_done:
    rx1937_cur."!cursor_fail"()
    if_null rx1937_debug, debug_1071
    rx1937_cur."!cursor_debug"("FAIL", "assertion:sym<?{ }>")
  debug_1071:
    .return (rx1937_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<?{ }>"  :subid("367_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, "!"
    push $P100, "?"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "_block1940"  :anon :subid("368_1309998847.42912") :method :outer("366_1309998847.42912")
.annotate 'line', 593
    .local string rx1942_tgt
    .local int rx1942_pos
    .local int rx1942_off
    .local int rx1942_eos
    .local int rx1942_rep
    .local pmc rx1942_cur
    .local pmc rx1942_debug
    (rx1942_cur, rx1942_pos, rx1942_tgt, $I10) = self."!cursor_start"()
    getattribute rx1942_debug, rx1942_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1942_cur
    .local pmc match
    .lex "$/", match
    length rx1942_eos, rx1942_tgt
    gt rx1942_pos, rx1942_eos, rx1942_done
    set rx1942_off, 0
    lt rx1942_pos, 2, rx1942_start
    sub rx1942_off, rx1942_pos, 1
    substr rx1942_tgt, rx1942_tgt, rx1942_off
  rx1942_start:
    eq $I10, 1, rx1942_restart
    if_null rx1942_debug, debug_1065
    rx1942_cur."!cursor_debug"("START", "")
  debug_1065:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1943_done
    goto rxscan1943_scan
  rxscan1943_loop:
    ($P10) = rx1942_cur."from"()
    inc $P10
    set rx1942_pos, $P10
    ge rx1942_pos, rx1942_eos, rxscan1943_done
  rxscan1943_scan:
    set_addr $I10, rxscan1943_loop
    rx1942_cur."!mark_push"(0, rx1942_pos, $I10)
  rxscan1943_done:
  # rx literal  "{"
    add $I11, rx1942_pos, 1
    gt $I11, rx1942_eos, rx1942_fail
    sub $I11, rx1942_pos, rx1942_off
    ord $I11, rx1942_tgt, $I11
    ne $I11, 123, rx1942_fail
    add rx1942_pos, 1
  # rx pass
    rx1942_cur."!cursor_pass"(rx1942_pos, "")
    if_null rx1942_debug, debug_1066
    rx1942_cur."!cursor_debug"("PASS", "", " at pos=", rx1942_pos)
  debug_1066:
    .return (rx1942_cur)
  rx1942_restart:
    if_null rx1942_debug, debug_1067
    rx1942_cur."!cursor_debug"("NEXT", "")
  debug_1067:
  rx1942_fail:
    (rx1942_rep, rx1942_pos, $I10, $P10) = rx1942_cur."!mark_fail"(0)
    lt rx1942_pos, -1, rx1942_done
    eq rx1942_pos, -1, rx1942_fail
    jump $I10
  rx1942_done:
    rx1942_cur."!cursor_fail"()
    if_null rx1942_debug, debug_1068
    rx1942_cur."!cursor_debug"("FAIL", "")
  debug_1068:
    .return (rx1942_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("369_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .const 'Sub' $P1952 = "371_1309998847.42912"
    capture_lex $P1952
    .local string rx1946_tgt
    .local int rx1946_pos
    .local int rx1946_off
    .local int rx1946_eos
    .local int rx1946_rep
    .local pmc rx1946_cur
    .local pmc rx1946_debug
    (rx1946_cur, rx1946_pos, rx1946_tgt, $I10) = self."!cursor_start"()
    rx1946_cur."!cursor_caparray"("assertion", "arglist", "nibbler")
    getattribute rx1946_debug, rx1946_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1946_cur
    .local pmc match
    .lex "$/", match
    length rx1946_eos, rx1946_tgt
    gt rx1946_pos, rx1946_eos, rx1946_done
    set rx1946_off, 0
    lt rx1946_pos, 2, rx1946_start
    sub rx1946_off, rx1946_pos, 1
    substr rx1946_tgt, rx1946_tgt, rx1946_off
  rx1946_start:
    eq $I10, 1, rx1946_restart
    if_null rx1946_debug, debug_1072
    rx1946_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_1072:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1948_done
    goto rxscan1948_scan
  rxscan1948_loop:
    ($P10) = rx1946_cur."from"()
    inc $P10
    set rx1946_pos, $P10
    ge rx1946_pos, rx1946_eos, rxscan1948_done
  rxscan1948_scan:
    set_addr $I10, rxscan1948_loop
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
  rxscan1948_done:
.annotate 'line', 597
  # rx subrule "identifier" subtype=capture negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."identifier"()
    unless $P10, rx1946_fail
    rx1946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1946_pos = $P10."pos"()
.annotate 'line', 604
  # rx rxquantr1949 ** 0..1
    set_addr $I10, rxquantr1949_done
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
  rxquantr1949_loop:
  alt1950_0:
.annotate 'line', 598
    set_addr $I10, alt1950_1
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
.annotate 'line', 599
  # rx subrule "before" subtype=zerowidth negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    .const 'Sub' $P1952 = "371_1309998847.42912"
    capture_lex $P1952
    $P10 = rx1946_cur."before"($P1952)
    unless $P10, rx1946_fail
    goto alt1950_end
  alt1950_1:
    set_addr $I10, alt1950_2
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
.annotate 'line', 600
  # rx literal  "="
    add $I11, rx1946_pos, 1
    gt $I11, rx1946_eos, rx1946_fail
    sub $I11, rx1946_pos, rx1946_off
    ord $I11, rx1946_tgt, $I11
    ne $I11, 61, rx1946_fail
    add rx1946_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."assertion"()
    unless $P10, rx1946_fail
    rx1946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1946_pos = $P10."pos"()
    goto alt1950_end
  alt1950_2:
    set_addr $I10, alt1950_3
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
.annotate 'line', 601
  # rx literal  ":"
    add $I11, rx1946_pos, 1
    gt $I11, rx1946_eos, rx1946_fail
    sub $I11, rx1946_pos, rx1946_off
    ord $I11, rx1946_tgt, $I11
    ne $I11, 58, rx1946_fail
    add rx1946_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."arglist"()
    unless $P10, rx1946_fail
    rx1946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1946_pos = $P10."pos"()
    goto alt1950_end
  alt1950_3:
    set_addr $I10, alt1950_4
    rx1946_cur."!mark_push"(0, rx1946_pos, $I10)
.annotate 'line', 602
  # rx literal  "("
    add $I11, rx1946_pos, 1
    gt $I11, rx1946_eos, rx1946_fail
    sub $I11, rx1946_pos, rx1946_off
    ord $I11, rx1946_tgt, $I11
    ne $I11, 40, rx1946_fail
    add rx1946_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1946_fail
    rx1946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1946_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1946_pos, 1
    gt $I11, rx1946_eos, rx1946_fail
    sub $I11, rx1946_pos, rx1946_off
    ord $I11, rx1946_tgt, $I11
    ne $I11, 41, rx1946_fail
    add rx1946_pos, 1
    goto alt1950_end
  alt1950_4:
.annotate 'line', 603
  # rx subrule "normspace" subtype=method negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."normspace"()
    unless $P10, rx1946_fail
    rx1946_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1946_cur."!cursor_pos"(rx1946_pos)
    $P10 = rx1946_cur."nibbler"()
    unless $P10, rx1946_fail
    rx1946_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1946_pos = $P10."pos"()
  alt1950_end:
.annotate 'line', 604
    set_addr $I10, rxquantr1949_done
    (rx1946_rep) = rx1946_cur."!mark_commit"($I10)
  rxquantr1949_done:
.annotate 'line', 596
  # rx pass
    rx1946_cur."!cursor_pass"(rx1946_pos, "assertion:sym<name>")
    if_null rx1946_debug, debug_1077
    rx1946_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx1946_pos)
  debug_1077:
    .return (rx1946_cur)
  rx1946_restart:
.annotate 'line', 575
    if_null rx1946_debug, debug_1078
    rx1946_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_1078:
  rx1946_fail:
    (rx1946_rep, rx1946_pos, $I10, $P10) = rx1946_cur."!mark_fail"(0)
    lt rx1946_pos, -1, rx1946_done
    eq rx1946_pos, -1, rx1946_fail
    jump $I10
  rx1946_done:
    rx1946_cur."!cursor_fail"()
    if_null rx1946_debug, debug_1079
    rx1946_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_1079:
    .return (rx1946_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("370_1309998847.42912") :method
.annotate 'line', 575
    $P100 = self."!PREFIX__!subrule"("identifier", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Regex"]
.sub "_block1951"  :anon :subid("371_1309998847.42912") :method :outer("369_1309998847.42912")
.annotate 'line', 599
    .local string rx1953_tgt
    .local int rx1953_pos
    .local int rx1953_off
    .local int rx1953_eos
    .local int rx1953_rep
    .local pmc rx1953_cur
    .local pmc rx1953_debug
    (rx1953_cur, rx1953_pos, rx1953_tgt, $I10) = self."!cursor_start"()
    getattribute rx1953_debug, rx1953_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1953_cur
    .local pmc match
    .lex "$/", match
    length rx1953_eos, rx1953_tgt
    gt rx1953_pos, rx1953_eos, rx1953_done
    set rx1953_off, 0
    lt rx1953_pos, 2, rx1953_start
    sub rx1953_off, rx1953_pos, 1
    substr rx1953_tgt, rx1953_tgt, rx1953_off
  rx1953_start:
    eq $I10, 1, rx1953_restart
    if_null rx1953_debug, debug_1073
    rx1953_cur."!cursor_debug"("START", "")
  debug_1073:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1954_done
    goto rxscan1954_scan
  rxscan1954_loop:
    ($P10) = rx1953_cur."from"()
    inc $P10
    set rx1953_pos, $P10
    ge rx1953_pos, rx1953_eos, rxscan1954_done
  rxscan1954_scan:
    set_addr $I10, rxscan1954_loop
    rx1953_cur."!mark_push"(0, rx1953_pos, $I10)
  rxscan1954_done:
  # rx literal  ">"
    add $I11, rx1953_pos, 1
    gt $I11, rx1953_eos, rx1953_fail
    sub $I11, rx1953_pos, rx1953_off
    ord $I11, rx1953_tgt, $I11
    ne $I11, 62, rx1953_fail
    add rx1953_pos, 1
  # rx pass
    rx1953_cur."!cursor_pass"(rx1953_pos, "")
    if_null rx1953_debug, debug_1074
    rx1953_cur."!cursor_debug"("PASS", "", " at pos=", rx1953_pos)
  debug_1074:
    .return (rx1953_cur)
  rx1953_restart:
    if_null rx1953_debug, debug_1075
    rx1953_cur."!cursor_debug"("NEXT", "")
  debug_1075:
  rx1953_fail:
    (rx1953_rep, rx1953_pos, $I10, $P10) = rx1953_cur."!mark_fail"(0)
    lt rx1953_pos, -1, rx1953_done
    eq rx1953_pos, -1, rx1953_fail
    jump $I10
  rx1953_done:
    rx1953_cur."!cursor_fail"()
    if_null rx1953_debug, debug_1076
    rx1953_cur."!cursor_debug"("FAIL", "")
  debug_1076:
    .return (rx1953_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<var>"  :subid("372_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .local string rx1956_tgt
    .local int rx1956_pos
    .local int rx1956_off
    .local int rx1956_eos
    .local int rx1956_rep
    .local pmc rx1956_cur
    .local pmc rx1956_debug
    (rx1956_cur, rx1956_pos, rx1956_tgt, $I10) = self."!cursor_start"()
    getattribute rx1956_debug, rx1956_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1956_cur
    .local pmc match
    .lex "$/", match
    length rx1956_eos, rx1956_tgt
    gt rx1956_pos, rx1956_eos, rx1956_done
    set rx1956_off, 0
    lt rx1956_pos, 2, rx1956_start
    sub rx1956_off, rx1956_pos, 1
    substr rx1956_tgt, rx1956_tgt, rx1956_off
  rx1956_start:
    eq $I10, 1, rx1956_restart
    if_null rx1956_debug, debug_1080
    rx1956_cur."!cursor_debug"("START", "assertion:sym<var>")
  debug_1080:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1958_done
    goto rxscan1958_scan
  rxscan1958_loop:
    ($P10) = rx1956_cur."from"()
    inc $P10
    set rx1956_pos, $P10
    ge rx1956_pos, rx1956_eos, rxscan1958_done
  rxscan1958_scan:
    set_addr $I10, rxscan1958_loop
    rx1956_cur."!mark_push"(0, rx1956_pos, $I10)
  rxscan1958_done:
.annotate 'line', 608
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1956_pos, rx1956_off
    substr $S10, rx1956_tgt, $I10, 1
    index $I11, "$@", $S10
    lt $I11, 0, rx1956_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1956_cur."!cursor_pos"(rx1956_pos)
    $P10 = rx1956_cur."LANG"("MAIN", "variable")
    unless $P10, rx1956_fail
    rx1956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("var")
    rx1956_pos = $P10."pos"()
.annotate 'line', 607
  # rx pass
    rx1956_cur."!cursor_pass"(rx1956_pos, "assertion:sym<var>")
    if_null rx1956_debug, debug_1081
    rx1956_cur."!cursor_debug"("PASS", "assertion:sym<var>", " at pos=", rx1956_pos)
  debug_1081:
    .return (rx1956_cur)
  rx1956_restart:
.annotate 'line', 575
    if_null rx1956_debug, debug_1082
    rx1956_cur."!cursor_debug"("NEXT", "assertion:sym<var>")
  debug_1082:
  rx1956_fail:
    (rx1956_rep, rx1956_pos, $I10, $P10) = rx1956_cur."!mark_fail"(0)
    lt rx1956_pos, -1, rx1956_done
    eq rx1956_pos, -1, rx1956_fail
    jump $I10
  rx1956_done:
    rx1956_cur."!cursor_fail"()
    if_null rx1956_debug, debug_1083
    rx1956_cur."!cursor_debug"("FAIL", "assertion:sym<var>")
  debug_1083:
    .return (rx1956_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<var>"  :subid("373_1309998847.42912") :method
.annotate 'line', 575
    new $P100, "ResizablePMCArray"
    push $P100, "$"
    push $P100, "@"
    .return ($P100)
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("374_1309998847.42912") :method :outer("355_1309998847.42912")
.annotate 'line', 575
    .local string rx1960_tgt
    .local int rx1960_pos
    .local int rx1960_off
    .local int rx1960_eos
    .local int rx1960_rep
    .local pmc rx1960_cur
    .local pmc rx1960_debug
    (rx1960_cur, rx1960_pos, rx1960_tgt, $I10) = self."!cursor_start"()
    getattribute rx1960_debug, rx1960_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1960_cur
    .local pmc match
    .lex "$/", match
    length rx1960_eos, rx1960_tgt
    gt rx1960_pos, rx1960_eos, rx1960_done
    set rx1960_off, 0
    lt rx1960_pos, 2, rx1960_start
    sub rx1960_off, rx1960_pos, 1
    substr rx1960_tgt, rx1960_tgt, rx1960_off
  rx1960_start:
    eq $I10, 1, rx1960_restart
    if_null rx1960_debug, debug_1084
    rx1960_cur."!cursor_debug"("START", "codeblock")
  debug_1084:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1962_done
    goto rxscan1962_scan
  rxscan1962_loop:
    ($P10) = rx1960_cur."from"()
    inc $P10
    set rx1960_pos, $P10
    ge rx1960_pos, rx1960_eos, rxscan1962_done
  rxscan1962_scan:
    set_addr $I10, rxscan1962_loop
    rx1960_cur."!mark_push"(0, rx1960_pos, $I10)
  rxscan1962_done:
.annotate 'line', 612
  # rx subrule "LANG" subtype=capture negate=
    rx1960_cur."!cursor_pos"(rx1960_pos)
    $P10 = rx1960_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1960_fail
    rx1960_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1960_pos = $P10."pos"()
.annotate 'line', 611
  # rx pass
    rx1960_cur."!cursor_pass"(rx1960_pos, "codeblock")
    if_null rx1960_debug, debug_1085
    rx1960_cur."!cursor_debug"("PASS", "codeblock", " at pos=", rx1960_pos)
  debug_1085:
    .return (rx1960_cur)
  rx1960_restart:
.annotate 'line', 575
    if_null rx1960_debug, debug_1086
    rx1960_cur."!cursor_debug"("NEXT", "codeblock")
  debug_1086:
  rx1960_fail:
    (rx1960_rep, rx1960_pos, $I10, $P10) = rx1960_cur."!mark_fail"(0)
    lt rx1960_pos, -1, rx1960_done
    eq rx1960_pos, -1, rx1960_fail
    jump $I10
  rx1960_done:
    rx1960_cur."!cursor_fail"()
    if_null rx1960_debug, debug_1087
    rx1960_cur."!cursor_debug"("FAIL", "codeblock")
  debug_1087:
    .return (rx1960_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("375_1309998847.42912") :method
.annotate 'line', 575
    $P100 = self."!PREFIX__!subrule"("LANG", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["NQP";"Grammar"]
.sub "_block1963" :tag('load') :anon :subid("376_1309998847.42912")
.annotate 'line', 4
    .const 'Sub' $P1965 = "11_1309998847.42912"
    $P101 = $P1965()
    .return ($P101)
.end


.namespace []
.sub "_block1967" :tag('load') :anon :subid("377_1309998847.42912")
.annotate 'line', 1
    .const 'Sub' $P1969 = "10_1309998847.42912"
    $P100 = $P1969()
    .return ($P100)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1309998850.8808")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1309998850.8808"
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1309998850.8808"
    capture_lex $P1003
    $P112 = $P1003()
.annotate 'line', 1
    .return ($P112)
    .const 'Sub' $P2014 = "149_1309998850.8808"
    .return ($P2014)
.end


.namespace []
.sub "" :tag('load') :tag('init') :subid("post150") :outer("10_1309998850.8808")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1309998850.8808"
    .local pmc block
    set block, $P1001
    $P2016 = get_root_global ["parrot"], "P6metaclass"
    $P2016."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1002"  :subid("11_1309998850.8808") :outer("10_1309998850.8808")
.annotate 'line', 3
    .const 'Sub' $P2009 = "148_1309998850.8808"
    capture_lex $P2009
    .const 'Sub' $P1964 = "139_1309998850.8808"
    capture_lex $P1964
    .const 'Sub' $P1959 = "138_1309998850.8808"
    capture_lex $P1959
    .const 'Sub' $P1955 = "137_1309998850.8808"
    capture_lex $P1955
    .const 'Sub' $P1951 = "136_1309998850.8808"
    capture_lex $P1951
    .const 'Sub' $P1947 = "135_1309998850.8808"
    capture_lex $P1947
    .const 'Sub' $P1943 = "134_1309998850.8808"
    capture_lex $P1943
    .const 'Sub' $P1939 = "133_1309998850.8808"
    capture_lex $P1939
    .const 'Sub' $P1935 = "132_1309998850.8808"
    capture_lex $P1935
    .const 'Sub' $P1930 = "131_1309998850.8808"
    capture_lex $P1930
    .const 'Sub' $P1926 = "130_1309998850.8808"
    capture_lex $P1926
    .const 'Sub' $P1921 = "129_1309998850.8808"
    capture_lex $P1921
    .const 'Sub' $P1916 = "128_1309998850.8808"
    capture_lex $P1916
    .const 'Sub' $P1904 = "127_1309998850.8808"
    capture_lex $P1904
    .const 'Sub' $P1899 = "126_1309998850.8808"
    capture_lex $P1899
    .const 'Sub' $P1894 = "125_1309998850.8808"
    capture_lex $P1894
    .const 'Sub' $P1889 = "124_1309998850.8808"
    capture_lex $P1889
    .const 'Sub' $P1884 = "123_1309998850.8808"
    capture_lex $P1884
    .const 'Sub' $P1879 = "122_1309998850.8808"
    capture_lex $P1879
    .const 'Sub' $P1874 = "121_1309998850.8808"
    capture_lex $P1874
    .const 'Sub' $P1863 = "120_1309998850.8808"
    capture_lex $P1863
    .const 'Sub' $P1855 = "119_1309998850.8808"
    capture_lex $P1855
    .const 'Sub' $P1850 = "118_1309998850.8808"
    capture_lex $P1850
    .const 'Sub' $P1845 = "117_1309998850.8808"
    capture_lex $P1845
    .const 'Sub' $P1840 = "116_1309998850.8808"
    capture_lex $P1840
    .const 'Sub' $P1835 = "115_1309998850.8808"
    capture_lex $P1835
    .const 'Sub' $P1830 = "114_1309998850.8808"
    capture_lex $P1830
    .const 'Sub' $P1820 = "113_1309998850.8808"
    capture_lex $P1820
    .const 'Sub' $P1808 = "112_1309998850.8808"
    capture_lex $P1808
    .const 'Sub' $P1803 = "111_1309998850.8808"
    capture_lex $P1803
    .const 'Sub' $P1798 = "110_1309998850.8808"
    capture_lex $P1798
    .const 'Sub' $P1788 = "109_1309998850.8808"
    capture_lex $P1788
    .const 'Sub' $P1780 = "108_1309998850.8808"
    capture_lex $P1780
    .const 'Sub' $P1775 = "107_1309998850.8808"
    capture_lex $P1775
    .const 'Sub' $P1743 = "104_1309998850.8808"
    capture_lex $P1743
    .const 'Sub' $P1738 = "103_1309998850.8808"
    capture_lex $P1738
    .const 'Sub' $P1726 = "102_1309998850.8808"
    capture_lex $P1726
    .const 'Sub' $P1708 = "101_1309998850.8808"
    capture_lex $P1708
    .const 'Sub' $P1701 = "100_1309998850.8808"
    capture_lex $P1701
    .const 'Sub' $P1697 = "99_1309998850.8808"
    capture_lex $P1697
    .const 'Sub' $P1684 = "98_1309998850.8808"
    capture_lex $P1684
    .const 'Sub' $P1652 = "95_1309998850.8808"
    capture_lex $P1652
    .const 'Sub' $P1637 = "93_1309998850.8808"
    capture_lex $P1637
    .const 'Sub' $P1632 = "92_1309998850.8808"
    capture_lex $P1632
    .const 'Sub' $P1624 = "91_1309998850.8808"
    capture_lex $P1624
    .const 'Sub' $P1617 = "90_1309998850.8808"
    capture_lex $P1617
    .const 'Sub' $P1572 = "87_1309998850.8808"
    capture_lex $P1572
    .const 'Sub' $P1544 = "83_1309998850.8808"
    capture_lex $P1544
    .const 'Sub' $P1520 = "80_1309998850.8808"
    capture_lex $P1520
    .const 'Sub' $P1492 = "77_1309998850.8808"
    capture_lex $P1492
    .const 'Sub' $P1487 = "76_1309998850.8808"
    capture_lex $P1487
    .const 'Sub' $P1482 = "75_1309998850.8808"
    capture_lex $P1482
    .const 'Sub' $P1458 = "73_1309998850.8808"
    capture_lex $P1458
    .const 'Sub' $P1453 = "72_1309998850.8808"
    capture_lex $P1453
    .const 'Sub' $P1445 = "71_1309998850.8808"
    capture_lex $P1445
    .const 'Sub' $P1437 = "70_1309998850.8808"
    capture_lex $P1437
    .const 'Sub' $P1429 = "69_1309998850.8808"
    capture_lex $P1429
    .const 'Sub' $P1424 = "68_1309998850.8808"
    capture_lex $P1424
    .const 'Sub' $P1419 = "67_1309998850.8808"
    capture_lex $P1419
    .const 'Sub' $P1414 = "66_1309998850.8808"
    capture_lex $P1414
    .const 'Sub' $P1403 = "65_1309998850.8808"
    capture_lex $P1403
    .const 'Sub' $P1382 = "64_1309998850.8808"
    capture_lex $P1382
    .const 'Sub' $P1377 = "63_1309998850.8808"
    capture_lex $P1377
    .const 'Sub' $P1352 = "61_1309998850.8808"
    capture_lex $P1352
    .const 'Sub' $P1341 = "60_1309998850.8808"
    capture_lex $P1341
    .const 'Sub' $P1334 = "59_1309998850.8808"
    capture_lex $P1334
    .const 'Sub' $P1329 = "58_1309998850.8808"
    capture_lex $P1329
    .const 'Sub' $P1324 = "57_1309998850.8808"
    capture_lex $P1324
    .const 'Sub' $P1319 = "56_1309998850.8808"
    capture_lex $P1319
    .const 'Sub' $P1314 = "55_1309998850.8808"
    capture_lex $P1314
    .const 'Sub' $P1309 = "54_1309998850.8808"
    capture_lex $P1309
    .const 'Sub' $P1304 = "53_1309998850.8808"
    capture_lex $P1304
    .const 'Sub' $P1299 = "52_1309998850.8808"
    capture_lex $P1299
    .const 'Sub' $P1294 = "51_1309998850.8808"
    capture_lex $P1294
    .const 'Sub' $P1289 = "50_1309998850.8808"
    capture_lex $P1289
    .const 'Sub' $P1284 = "49_1309998850.8808"
    capture_lex $P1284
    .const 'Sub' $P1279 = "48_1309998850.8808"
    capture_lex $P1279
    .const 'Sub' $P1274 = "47_1309998850.8808"
    capture_lex $P1274
    .const 'Sub' $P1269 = "46_1309998850.8808"
    capture_lex $P1269
    .const 'Sub' $P1264 = "45_1309998850.8808"
    capture_lex $P1264
    .const 'Sub' $P1256 = "44_1309998850.8808"
    capture_lex $P1256
    .const 'Sub' $P1248 = "43_1309998850.8808"
    capture_lex $P1248
    .const 'Sub' $P1242 = "42_1309998850.8808"
    capture_lex $P1242
    .const 'Sub' $P1235 = "41_1309998850.8808"
    capture_lex $P1235
    .const 'Sub' $P1228 = "40_1309998850.8808"
    capture_lex $P1228
    .const 'Sub' $P1223 = "39_1309998850.8808"
    capture_lex $P1223
    .const 'Sub' $P1213 = "38_1309998850.8808"
    capture_lex $P1213
    .const 'Sub' $P1201 = "37_1309998850.8808"
    capture_lex $P1201
    .const 'Sub' $P1194 = "36_1309998850.8808"
    capture_lex $P1194
    .const 'Sub' $P1188 = "35_1309998850.8808"
    capture_lex $P1188
    .const 'Sub' $P1168 = "33_1309998850.8808"
    capture_lex $P1168
    .const 'Sub' $P1162 = "32_1309998850.8808"
    capture_lex $P1162
    .const 'Sub' $P1157 = "31_1309998850.8808"
    capture_lex $P1157
    .const 'Sub' $P1150 = "30_1309998850.8808"
    capture_lex $P1150
    .const 'Sub' $P1145 = "29_1309998850.8808"
    capture_lex $P1145
    .const 'Sub' $P1140 = "28_1309998850.8808"
    capture_lex $P1140
    .const 'Sub' $P1134 = "27_1309998850.8808"
    capture_lex $P1134
    .const 'Sub' $P1104 = "25_1309998850.8808"
    capture_lex $P1104
    .const 'Sub' $P1085 = "23_1309998850.8808"
    capture_lex $P1085
    .const 'Sub' $P1078 = "22_1309998850.8808"
    capture_lex $P1078
    .const 'Sub' $P1067 = "21_1309998850.8808"
    capture_lex $P1067
    .const 'Sub' $P1062 = "20_1309998850.8808"
    capture_lex $P1062
    .const 'Sub' $P1056 = "19_1309998850.8808"
    capture_lex $P1056
    .const 'Sub' $P1044 = "18_1309998850.8808"
    capture_lex $P1044
    .const 'Sub' $P1037 = "17_1309998850.8808"
    capture_lex $P1037
    .const 'Sub' $P1029 = "16_1309998850.8808"
    capture_lex $P1029
    .const 'Sub' $P1014 = "13_1309998850.8808"
    capture_lex $P1014
    .const 'Sub' $P1006 = "12_1309998850.8808"
    capture_lex $P1006
    get_global $P1004, "@BLOCK"
    unless_null $P1004, vivify_153
    $P1004 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P1004
  vivify_153:
.annotate 'line', 9
    .const 'Sub' $P1006 = "12_1309998850.8808"
    newclosure $P1012, $P1006
    set $P1005, $P1012
    .lex "xblock_immediate", $P1005
.annotate 'line', 14
    .const 'Sub' $P1014 = "13_1309998850.8808"
    newclosure $P1027, $P1014
    set $P1013, $P1027
    .lex "block_immediate", $P1013
.annotate 'line', 24
    .const 'Sub' $P1029 = "16_1309998850.8808"
    newclosure $P1035, $P1029
    set $P1028, $P1035
    .lex "vivitype", $P1028
.annotate 'line', 43
    .const 'Sub' $P1037 = "17_1309998850.8808"
    newclosure $P1042, $P1037
    set $P1036, $P1042
    .lex "colonpair_str", $P1036
.annotate 'line', 224
    .const 'Sub' $P1044 = "18_1309998850.8808"
    newclosure $P1054, $P1044
    set $P1043, $P1054
    .lex "push_block_handler", $P1043
.annotate 'line', 863
    .const 'Sub' $P1056 = "19_1309998850.8808"
    newclosure $P1061, $P1056
    set $P1055, $P1061
    .lex "control", $P1055
.annotate 'line', 3
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P110, "@BLOCK"
    find_lex $P110, "xblock_immediate"
    find_lex $P110, "block_immediate"
    find_lex $P110, "vivitype"
    find_lex $P110, "colonpair_str"
    find_lex $P110, "push_block_handler"
    find_lex $P110, "control"
.annotate 'line', 881
    .const 'Sub' $P1964 = "139_1309998850.8808"
    capture_lex $P1964
    $P110 = $P1964()
.annotate 'line', 3
    .return ($P110)
    .const 'Sub' $P2006 = "147_1309998850.8808"
    .return ($P2006)
.end


.namespace ["NQP";"Actions"]
.sub "" :tag('load') :tag('init') :subid("post151") :outer("11_1309998850.8808")
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1309998850.8808"
    .local pmc block
    set block, $P1003
.annotate 'line', 5
    .const 'Sub' $P2009 = "148_1309998850.8808"
    capture_lex $P2009
    $P2009()
    $P2012 = get_root_global ["parrot"], "P6metaclass"
    $P2012."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2008"  :anon :subid("148_1309998850.8808") :outer("11_1309998850.8808")
.annotate 'line', 6
    get_global $P2010, "@BLOCK"
    unless_null $P2010, vivify_152
    $P2010 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2010
  vivify_152:
 $P2011 = new ['ResizablePMCArray']
    set_global "@BLOCK", $P2011
.annotate 'line', 5
    .return ($P2011)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock_immediate"  :subid("12_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1009
.annotate 'line', 9
    new $P1008, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1008, control_1007
    push_eh $P1008
    .lex "$xblock", param_1009
.annotate 'line', 10
    find_lex $P1010, "$xblock"
    unless_null $P1010, vivify_154
    $P1010 = root_new ['parrot';'ResizablePMCArray']
  vivify_154:
    set $P100, $P1010[1]
    unless_null $P100, vivify_155
    new $P100, "Undef"
  vivify_155:
    $P101 = "block_immediate"($P100)
    find_lex $P1011, "$xblock"
    unless_null $P1011, vivify_156
    $P1011 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P1011
  vivify_156:
    set $P1011[1], $P101
.annotate 'line', 9
    find_lex $P100, "$xblock"
    .return ($P100)
  control_1007:
    .local pmc exception
    .get_results (exception)
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "block_immediate"  :subid("13_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1017
.annotate 'line', 14
    .const 'Sub' $P1021 = "14_1309998850.8808"
    capture_lex $P1021
    new $P1016, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1016, control_1015
    push_eh $P1016
    .lex "$block", param_1017
.annotate 'line', 15
    find_lex $P102, "$block"
    $P102."blocktype"("immediate")
.annotate 'line', 16
    find_lex $P103, "$block"
    $P104 = $P103."symtable"()
    unless $P104, unless_1019
    set $P102, $P104
    goto unless_1019_end
  unless_1019:
    find_lex $P105, "$block"
    $P106 = $P105."handlers"()
    set $P102, $P106
  unless_1019_end:
    if $P102, unless_1018_end
    .const 'Sub' $P1021 = "14_1309998850.8808"
    capture_lex $P1021
    $P1021()
  unless_1018_end:
.annotate 'line', 14
    find_lex $P102, "$block"
    .return ($P102)
  control_1015:
    .local pmc exception
    .get_results (exception)
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1020"  :anon :subid("14_1309998850.8808") :outer("13_1309998850.8808")
.annotate 'line', 16
    .const 'Sub' $P1024 = "15_1309998850.8808"
    capture_lex $P1024
.annotate 'line', 17
    new $P107, "Undef"
    set $P1022, $P107
    .lex "$stmts", $P1022
    get_hll_global $P108, ["PAST"], "Stmts"
    find_lex $P109, "$block"
    $P110 = $P108."new"($P109 :named("node"))
    store_lex "$stmts", $P110
.annotate 'line', 18
    find_lex $P109, "$block"
    $P110 = $P109."list"()
    defined $I100, $P110
    unless $I100, for_undef_157
    iter $P108, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1026_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1026_test:
    unless $P108, loop1026_done
    shift $P111, $P108
  loop1026_redo:
    .const 'Sub' $P1024 = "15_1309998850.8808"
    capture_lex $P1024
    $P1024($P111)
  loop1026_next:
    goto loop1026_test
  loop1026_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1026_next
    eq $P113, .CONTROL_LOOP_REDO, loop1026_redo
  loop1026_done:
    pop_eh
  for_undef_157:
.annotate 'line', 19
    find_lex $P108, "$stmts"
    store_lex "$block", $P108
.annotate 'line', 16
    .return ($P108)
.end


.namespace ["NQP";"Actions"]
.sub "_block1023"  :anon :subid("15_1309998850.8808") :outer("14_1309998850.8808")
    .param pmc param_1025
.annotate 'line', 18
    .lex "$_", param_1025
    find_lex $P112, "$stmts"
    find_lex $P113, "$_"
    $P114 = $P112."push"($P113)
    .return ($P114)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "vivitype"  :subid("16_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1032
.annotate 'line', 24
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1031, control_1030
    push_eh $P1031
    .lex "$sigil", param_1032
.annotate 'line', 25
    find_lex $P105, "$sigil"
    set $S100, $P105
    iseq $I100, $S100, "%"
    if $I100, if_1033
.annotate 'line', 27
    find_lex $P109, "$sigil"
    set $S101, $P109
    iseq $I101, $S101, "@"
    if $I101, if_1034
    new $P112, "String"
    assign $P112, "Undef"
    set $P108, $P112
    goto if_1034_end
  if_1034:
.annotate 'line', 28
    get_hll_global $P110, ["PAST"], "Op"
    $P111 = $P110."new"("    %r = root_new ['parrot';'ResizablePMCArray']" :named("inline"))
    set $P108, $P111
  if_1034_end:
    set $P104, $P108
.annotate 'line', 25
    goto if_1033_end
  if_1033:
.annotate 'line', 26
    get_hll_global $P106, ["PAST"], "Op"
    $P107 = $P106."new"("    %r = root_new ['parrot';'Hash']" :named("inline"))
    set $P104, $P107
  if_1033_end:
.annotate 'line', 24
    .return ($P104)
  control_1030:
    .local pmc exception
    .get_results (exception)
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "colonpair_str"  :subid("17_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1040
.annotate 'line', 43
    new $P1039, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1039, control_1038
    push_eh $P1039
    .lex "$ast", param_1040
.annotate 'line', 44
    get_hll_global $P107, ["PAST"], "Op"
    find_lex $P108, "$ast"
    $P109 = $P107."ACCEPTS"($P108)
    if $P109, if_1041
.annotate 'line', 46
    find_lex $P112, "$ast"
    $P113 = $P112."value"()
    set $P106, $P113
.annotate 'line', 44
    goto if_1041_end
  if_1041:
.annotate 'line', 45
    find_lex $P110, "$ast"
    $P111 = $P110."list"()
    join $S100, " ", $P111
    new $P106, 'String'
    set $P106, $S100
  if_1041_end:
.annotate 'line', 43
    .return ($P106)
  control_1038:
    .local pmc exception
    .get_results (exception)
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "push_block_handler"  :subid("18_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1047
    .param pmc param_1048
.annotate 'line', 224
    new $P1046, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1046, control_1045
    push_eh $P1046
    .lex "$/", param_1047
    .lex "$block", param_1048
.annotate 'line', 225
    get_global $P1050, "@BLOCK"
    unless_null $P1050, vivify_158
    $P1050 = root_new ['parrot';'ResizablePMCArray']
  vivify_158:
    set $P108, $P1050[0]
    unless_null $P108, vivify_159
    new $P108, "Undef"
  vivify_159:
    $P109 = $P108."handlers"()
    if $P109, unless_1049_end
.annotate 'line', 226
    get_global $P1051, "@BLOCK"
    unless_null $P1051, vivify_160
    $P1051 = root_new ['parrot';'ResizablePMCArray']
  vivify_160:
    set $P110, $P1051[0]
    unless_null $P110, vivify_161
    new $P110, "Undef"
  vivify_161:
    new $P111, "ResizablePMCArray"
    $P110."handlers"($P111)
  unless_1049_end:
.annotate 'line', 228
    find_lex $P108, "$block"
    $P109 = $P108."arity"()
    if $P109, unless_1052_end
.annotate 'line', 229
    find_lex $P110, "$block"
.annotate 'line', 230
    get_hll_global $P111, ["PAST"], "Op"
.annotate 'line', 231
    get_hll_global $P112, ["PAST"], "Var"
    $P113 = $P112."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate 'line', 232
    get_hll_global $P114, ["PAST"], "Var"
    $P115 = $P114."new"("lexical" :named("scope"), "$_" :named("name"))
    $P116 = $P111."new"($P113, $P115, "bind" :named("pasttype"))
.annotate 'line', 230
    $P110."unshift"($P116)
.annotate 'line', 235
    find_lex $P110, "$block"
    get_hll_global $P111, ["PAST"], "Var"
    $P112 = $P111."new"("$_" :named("name"), "parameter" :named("scope"))
    $P110."unshift"($P112)
.annotate 'line', 236
    find_lex $P110, "$block"
    $P110."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 237
    find_lex $P110, "$block"
    $P110."symbol"("$!", "lexical" :named("scope"))
.annotate 'line', 238
    find_lex $P110, "$block"
    $P110."arity"(1)
  unless_1052_end:
.annotate 'line', 240
    find_lex $P108, "$block"
    $P108."blocktype"("declaration")
.annotate 'line', 241
    get_global $P1053, "@BLOCK"
    unless_null $P1053, vivify_162
    $P1053 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P108, $P1053[0]
    unless_null $P108, vivify_163
    new $P108, "Undef"
  vivify_163:
    $P109 = $P108."handlers"()
.annotate 'line', 242
    get_hll_global $P110, ["PAST"], "Control"
    find_lex $P111, "$/"
.annotate 'line', 244
    get_hll_global $P112, ["PAST"], "Stmts"
.annotate 'line', 245
    get_hll_global $P113, ["PAST"], "Op"
    find_lex $P114, "$block"
.annotate 'line', 247
    get_hll_global $P115, ["PAST"], "Var"
    $P116 = $P115."new"("register" :named("scope"), "exception" :named("name"))
    $P117 = $P113."new"($P114, $P116, "call" :named("pasttype"))
.annotate 'line', 249
    get_hll_global $P118, ["PAST"], "Op"
.annotate 'line', 250
    get_hll_global $P119, ["PAST"], "Var"
.annotate 'line', 251
    get_hll_global $P120, ["PAST"], "Var"
    $P121 = $P120."new"("register" :named("scope"), "exception" :named("name"))
    $P122 = $P119."new"($P121, "handled", "keyed" :named("scope"))
.annotate 'line', 250
    $P123 = $P118."new"($P122, 1, "bind" :named("pasttype"))
.annotate 'line', 249
    $P124 = $P112."new"($P117, $P123)
.annotate 'line', 244
    $P125 = $P110."new"($P124, $P111 :named("node"))
.annotate 'line', 242
    $P126 = $P109."unshift"($P125)
.annotate 'line', 224
    .return ($P126)
  control_1045:
    .local pmc exception
    .get_results (exception)
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "control"  :subid("19_1309998850.8808") :outer("11_1309998850.8808")
    .param pmc param_1059
    .param pmc param_1060
.annotate 'line', 863
    new $P1058, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1058, control_1057
    push_eh $P1058
    .lex "$/", param_1059
    .lex "$type", param_1060
.annotate 'line', 864
    find_lex $P109, "$/"
    get_hll_global $P110, ["PAST"], "Op"
    find_lex $P111, "$/"
.annotate 'line', 868
    get_hll_global $P112, ["PAST"], "Val"
    find_lex $P113, "$type"
    $P114 = $P112."new"($P113 :named("value"), "!except_types" :named("returns"))
    $P115 = $P110."new"(0, $P114, $P111 :named("node"), "die__vii" :named("pirop"))
.annotate 'line', 864
    $P116 = $P109."!make"($P115)
.annotate 'line', 863
    .return ($P116)
  control_1057:
    .local pmc exception
    .get_results (exception)
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("20_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1065
.annotate 'line', 33
    new $P1064, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1064, control_1063
    push_eh $P1064
    .lex "self", self
    .lex "$/", param_1065
    find_lex $P110, "$/"
    find_lex $P1066, "$/"
    unless_null $P1066, vivify_164
    $P1066 = root_new ['parrot';'Hash']
  vivify_164:
    set $P111, $P1066["comp_unit"]
    unless_null $P111, vivify_165
    new $P111, "Undef"
  vivify_165:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1063:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "deflongname"  :subid("21_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1070
.annotate 'line', 35
    new $P1069, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1069, control_1068
    push_eh $P1069
    .lex "self", self
    .lex "$/", param_1070
.annotate 'line', 36
    find_lex $P110, "$/"
.annotate 'line', 37
    find_lex $P1072, "$/"
    unless_null $P1072, vivify_166
    $P1072 = root_new ['parrot';'Hash']
  vivify_166:
    set $P112, $P1072["colonpair"]
    unless_null $P112, vivify_167
    new $P112, "Undef"
  vivify_167:
    if $P112, if_1071
.annotate 'line', 39
    find_lex $P125, "$/"
    set $S103, $P125
    new $P111, 'String'
    set $P111, $S103
.annotate 'line', 37
    goto if_1071_end
  if_1071:
    find_lex $P1073, "$/"
    unless_null $P1073, vivify_168
    $P1073 = root_new ['parrot';'Hash']
  vivify_168:
    set $P113, $P1073["identifier"]
    unless_null $P113, vivify_169
    new $P113, "Undef"
  vivify_169:
    set $S100, $P113
    new $P114, 'String'
    set $P114, $S100
    concat $P115, $P114, ":"
    find_lex $P1074, "$/"
    unless_null $P1074, vivify_170
    $P1074 = root_new ['parrot';'Hash']
  vivify_170:
    set $P1075, $P1074["colonpair"]
    unless_null $P1075, vivify_171
    $P1075 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P117, $P1075[0]
    unless_null $P117, vivify_172
    new $P117, "Undef"
  vivify_172:
    $P118 = $P117."ast"()
    $S101 = $P118."named"()
    concat $P119, $P115, $S101
    concat $P120, $P119, "<"
.annotate 'line', 38
    find_lex $P1076, "$/"
    unless_null $P1076, vivify_173
    $P1076 = root_new ['parrot';'Hash']
  vivify_173:
    set $P1077, $P1076["colonpair"]
    unless_null $P1077, vivify_174
    $P1077 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P121, $P1077[0]
    unless_null $P121, vivify_175
    new $P121, "Undef"
  vivify_175:
    $P122 = $P121."ast"()
    $S102 = "colonpair_str"($P122)
    concat $P123, $P120, $S102
    concat $P124, $P123, ">"
    set $P111, $P124
  if_1071_end:
.annotate 'line', 37
    $P127 = $P110."!make"($P111)
.annotate 'line', 35
    .return ($P127)
  control_1068:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "comp_unit"  :subid("22_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1081
.annotate 'line', 49
    new $P1080, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1080, control_1079
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
.annotate 'line', 50
    new $P110, "Undef"
    set $P1082, $P110
    .lex "$mainline", $P1082
.annotate 'line', 51
    new $P111, "Undef"
    set $P1083, $P111
    .lex "$unit", $P1083
.annotate 'line', 50
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_176
    $P1084 = root_new ['parrot';'Hash']
  vivify_176:
    set $P112, $P1084["statementlist"]
    unless_null $P112, vivify_177
    new $P112, "Undef"
  vivify_177:
    $P113 = $P112."ast"()
    store_lex "$mainline", $P113
.annotate 'line', 51
    get_global $P112, "@BLOCK"
    $P113 = $P112."shift"()
    store_lex "$unit", $P113
.annotate 'line', 55
    find_lex $P112, "$unit"
    find_lex $P113, "self"
    $P114 = $P113."CTXSAVE"()
    $P112."push"($P114)
.annotate 'line', 60
    find_lex $P112, "$unit"
.annotate 'line', 61
    get_hll_global $P113, ["PAST"], "Op"
    find_lex $P114, "$mainline"
    $P115 = $P113."new"($P114, "return" :named("pirop"))
    $P112."push"($P115)
.annotate 'line', 66
    find_lex $P112, "$unit"
.annotate 'line', 67
    get_hll_global $P113, ["PAST"], "Block"
.annotate 'line', 69
    get_hll_global $P114, ["PAST"], "Op"
    get_hll_global $P115, ["PAST"], "Val"
    find_lex $P117, "$unit"
    $P118 = $P115."new"($P117 :named("value"))
    $P119 = $P114."new"($P118, "call" :named("pasttype"))
    $P120 = $P113."new"($P119, ":tag('load')" :named("pirflags"), 0 :named("lexical"), "" :named("namespace"))
.annotate 'line', 67
    $P112."push"($P120)
.annotate 'line', 72
    find_lex $P112, "$unit"
    find_lex $P113, "$/"
    $P112."node"($P113)
.annotate 'line', 73
    find_lex $P112, "$/"
    find_lex $P113, "$unit"
    $P114 = $P112."!make"($P113)
.annotate 'line', 49
    .return ($P114)
  control_1079:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statementlist"  :subid("23_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1088
.annotate 'line', 76
    .const 'Sub' $P1094 = "24_1309998850.8808"
    capture_lex $P1094
    new $P1087, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1087, control_1086
    push_eh $P1087
    .lex "self", self
    .lex "$/", param_1088
.annotate 'line', 77
    new $P110, "Undef"
    set $P1089, $P110
    .lex "$past", $P1089
    get_hll_global $P111, ["PAST"], "Stmts"
    find_lex $P112, "$/"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 78
    find_lex $P1091, "$/"
    unless_null $P1091, vivify_178
    $P1091 = root_new ['parrot';'Hash']
  vivify_178:
    set $P111, $P1091["statement"]
    unless_null $P111, vivify_179
    new $P111, "Undef"
  vivify_179:
    unless $P111, if_1090_end
.annotate 'line', 79
    find_lex $P1092, "$/"
    unless_null $P1092, vivify_180
    $P1092 = root_new ['parrot';'Hash']
  vivify_180:
    set $P113, $P1092["statement"]
    unless_null $P113, vivify_181
    new $P113, "Undef"
  vivify_181:
    defined $I100, $P113
    unless $I100, for_undef_182
    iter $P112, $P113
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1103_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1103_test:
    unless $P112, loop1103_done
    shift $P114, $P112
  loop1103_redo:
    .const 'Sub' $P1094 = "24_1309998850.8808"
    capture_lex $P1094
    $P1094($P114)
  loop1103_next:
    goto loop1103_test
  loop1103_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1103_next
    eq $P118, .CONTROL_LOOP_REDO, loop1103_redo
  loop1103_done:
    pop_eh
  for_undef_182:
  if_1090_end:
.annotate 'line', 87
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 76
    .return ($P113)
  control_1086:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.sub "_block1093"  :anon :subid("24_1309998850.8808") :outer("23_1309998850.8808")
    .param pmc param_1096
.annotate 'line', 80
    new $P115, "Undef"
    set $P1095, $P115
    .lex "$ast", $P1095
    .lex "$_", param_1096
    find_lex $P117, "$_"
    $P118 = $P117."ast"()
    store_lex "$ast", $P118
.annotate 'line', 81
    find_lex $P1098, "$ast"
    unless_null $P1098, vivify_183
    $P1098 = root_new ['parrot';'Hash']
  vivify_183:
    set $P117, $P1098["sink"]
    unless_null $P117, vivify_184
    new $P117, "Undef"
  vivify_184:
    defined $I101, $P117
    unless $I101, if_1097_end
    find_lex $P1099, "$ast"
    unless_null $P1099, vivify_185
    $P1099 = root_new ['parrot';'Hash']
  vivify_185:
    set $P118, $P1099["sink"]
    unless_null $P118, vivify_186
    new $P118, "Undef"
  vivify_186:
    store_lex "$ast", $P118
  if_1097_end:
.annotate 'line', 82
    find_lex $P1101, "$ast"
    unless_null $P1101, vivify_187
    $P1101 = root_new ['parrot';'Hash']
  vivify_187:
    set $P117, $P1101["bareblock"]
    unless_null $P117, vivify_188
    new $P117, "Undef"
  vivify_188:
    unless $P117, if_1100_end
    find_lex $P118, "$ast"
    $P119 = "block_immediate"($P118)
    store_lex "$ast", $P119
  if_1100_end:
.annotate 'line', 83
    get_hll_global $P117, ["PAST"], "Node"
    find_lex $P118, "$ast"
    $P119 = $P117."ACCEPTS"($P118)
    unless $P119, if_1102_end
    get_hll_global $P120, ["PAST"], "Stmt"
    find_lex $P121, "$ast"
    $P122 = $P120."new"($P121)
    store_lex "$ast", $P122
  if_1102_end:
.annotate 'line', 84
    find_lex $P117, "$past"
    find_lex $P118, "$ast"
    $P119 = $P117."push"($P118)
.annotate 'line', 79
    .return ($P119)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement"  :subid("25_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1107
    .param pmc param_1108 :optional
    .param int has_param_1108 :opt_flag
.annotate 'line', 90
    .const 'Sub' $P1113 = "26_1309998850.8808"
    capture_lex $P1113
    new $P1106, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1106, control_1105
    push_eh $P1106
    .lex "self", self
    .lex "$/", param_1107
    if has_param_1108, optparam_189
    new $P110, "Undef"
    set param_1108, $P110
  optparam_189:
    .lex "$key", param_1108
.annotate 'line', 91
    new $P111, "Undef"
    set $P1109, $P111
    .lex "$past", $P1109
.annotate 'line', 90
    find_lex $P112, "$past"
.annotate 'line', 92
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_190
    $P1111 = root_new ['parrot';'Hash']
  vivify_190:
    set $P112, $P1111["EXPR"]
    unless_null $P112, vivify_191
    new $P112, "Undef"
  vivify_191:
    if $P112, if_1110
.annotate 'line', 113
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_192
    $P1132 = root_new ['parrot';'Hash']
  vivify_192:
    set $P117, $P1132["statement_control"]
    unless_null $P117, vivify_193
    new $P117, "Undef"
  vivify_193:
    if $P117, if_1131
.annotate 'line', 114
    new $P118, "Integer"
    assign $P118, 0
    store_lex "$past", $P118
    goto if_1131_end
  if_1131:
.annotate 'line', 113
    find_lex $P1133, "$/"
    unless_null $P1133, vivify_194
    $P1133 = root_new ['parrot';'Hash']
  vivify_194:
    set $P118, $P1133["statement_control"]
    unless_null $P118, vivify_195
    new $P118, "Undef"
  vivify_195:
    $P119 = $P118."ast"()
    store_lex "$past", $P119
  if_1131_end:
    goto if_1110_end
  if_1110:
.annotate 'line', 92
    .const 'Sub' $P1113 = "26_1309998850.8808"
    capture_lex $P1113
    $P1113()
  if_1110_end:
.annotate 'line', 115
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 90
    .return ($P114)
  control_1105:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block1112"  :anon :subid("26_1309998850.8808") :outer("25_1309998850.8808")
.annotate 'line', 93
    new $P113, "Undef"
    set $P1114, $P113
    .lex "$mc", $P1114
.annotate 'line', 94
    new $P114, "Undef"
    set $P1115, $P114
    .lex "$ml", $P1115
.annotate 'line', 93
    find_lex $P1116, "$/"
    unless_null $P1116, vivify_196
    $P1116 = root_new ['parrot';'Hash']
  vivify_196:
    set $P1117, $P1116["statement_mod_cond"]
    unless_null $P1117, vivify_197
    $P1117 = root_new ['parrot';'ResizablePMCArray']
  vivify_197:
    set $P115, $P1117[0]
    unless_null $P115, vivify_198
    new $P115, "Undef"
  vivify_198:
    store_lex "$mc", $P115
.annotate 'line', 94
    find_lex $P1118, "$/"
    unless_null $P1118, vivify_199
    $P1118 = root_new ['parrot';'Hash']
  vivify_199:
    set $P1119, $P1118["statement_mod_loop"]
    unless_null $P1119, vivify_200
    $P1119 = root_new ['parrot';'ResizablePMCArray']
  vivify_200:
    set $P115, $P1119[0]
    unless_null $P115, vivify_201
    new $P115, "Undef"
  vivify_201:
    store_lex "$ml", $P115
.annotate 'line', 95
    find_lex $P1120, "$/"
    unless_null $P1120, vivify_202
    $P1120 = root_new ['parrot';'Hash']
  vivify_202:
    set $P115, $P1120["EXPR"]
    unless_null $P115, vivify_203
    new $P115, "Undef"
  vivify_203:
    $P117 = $P115."ast"()
    store_lex "$past", $P117
.annotate 'line', 96
    find_lex $P115, "$mc"
    unless $P115, if_1121_end
.annotate 'line', 97
    get_hll_global $P117, ["PAST"], "Op"
    find_lex $P1122, "$mc"
    unless_null $P1122, vivify_204
    $P1122 = root_new ['parrot';'Hash']
  vivify_204:
    set $P118, $P1122["cond"]
    unless_null $P118, vivify_205
    new $P118, "Undef"
  vivify_205:
    $P119 = $P118."ast"()
    find_lex $P120, "$past"
    find_lex $P1123, "$mc"
    unless_null $P1123, vivify_206
    $P1123 = root_new ['parrot';'Hash']
  vivify_206:
    set $P121, $P1123["sym"]
    unless_null $P121, vivify_207
    new $P121, "Undef"
  vivify_207:
    set $S100, $P121
    find_lex $P122, "$/"
    $P123 = $P117."new"($P119, $P120, $S100 :named("pasttype"), $P122 :named("node"))
    store_lex "$past", $P123
  if_1121_end:
.annotate 'line', 99
    find_lex $P117, "$ml"
    if $P117, if_1124
    set $P115, $P117
    goto if_1124_end
  if_1124:
.annotate 'line', 100
    find_lex $P1126, "$ml"
    unless_null $P1126, vivify_208
    $P1126 = root_new ['parrot';'Hash']
  vivify_208:
    set $P119, $P1126["sym"]
    unless_null $P119, vivify_209
    new $P119, "Undef"
  vivify_209:
    set $S100, $P119
    iseq $I100, $S100, "for"
    if $I100, if_1125
.annotate 'line', 109
    get_hll_global $P120, ["PAST"], "Op"
    find_lex $P1129, "$ml"
    unless_null $P1129, vivify_210
    $P1129 = root_new ['parrot';'Hash']
  vivify_210:
    set $P121, $P1129["cond"]
    unless_null $P121, vivify_211
    new $P121, "Undef"
  vivify_211:
    $P122 = $P121."ast"()
    find_lex $P123, "$past"
    find_lex $P1130, "$ml"
    unless_null $P1130, vivify_212
    $P1130 = root_new ['parrot';'Hash']
  vivify_212:
    set $P124, $P1130["sym"]
    unless_null $P124, vivify_213
    new $P124, "Undef"
  vivify_213:
    set $S101, $P124
    find_lex $P125, "$/"
    $P128 = $P120."new"($P122, $P123, $S101 :named("pasttype"), $P125 :named("node"))
    store_lex "$past", $P128
.annotate 'line', 108
    set $P118, $P128
.annotate 'line', 100
    goto if_1125_end
  if_1125:
.annotate 'line', 101
    get_hll_global $P120, ["PAST"], "Block"
.annotate 'line', 102
    get_hll_global $P121, ["PAST"], "Var"
    $P122 = $P121."new"("$_" :named("name"), "parameter" :named("scope"), 1 :named("isdecl"))
    find_lex $P123, "$past"
    $P124 = $P120."new"($P122, $P123, "immediate" :named("blocktype"))
.annotate 'line', 101
    store_lex "$past", $P124
.annotate 'line', 104
    find_lex $P120, "$past"
    $P120."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 105
    find_lex $P120, "$past"
    $P120."arity"(1)
.annotate 'line', 106
    get_hll_global $P120, ["PAST"], "Op"
    find_lex $P1127, "$ml"
    unless_null $P1127, vivify_214
    $P1127 = root_new ['parrot';'Hash']
  vivify_214:
    set $P121, $P1127["cond"]
    unless_null $P121, vivify_215
    new $P121, "Undef"
  vivify_215:
    $P122 = $P121."ast"()
    find_lex $P123, "$past"
    find_lex $P1128, "$ml"
    unless_null $P1128, vivify_216
    $P1128 = root_new ['parrot';'Hash']
  vivify_216:
    set $P124, $P1128["sym"]
    unless_null $P124, vivify_217
    new $P124, "Undef"
  vivify_217:
    set $S101, $P124
    find_lex $P125, "$/"
    $P127 = $P120."new"($P122, $P123, $S101 :named("pasttype"), $P125 :named("node"))
    store_lex "$past", $P127
.annotate 'line', 100
    set $P118, $P127
  if_1125_end:
.annotate 'line', 99
    set $P115, $P118
  if_1124_end:
.annotate 'line', 92
    .return ($P115)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "xblock"  :subid("27_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1137
.annotate 'line', 118
    new $P1136, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1136, control_1135
    push_eh $P1136
    .lex "self", self
    .lex "$/", param_1137
.annotate 'line', 119
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
    find_lex $P1138, "$/"
    unless_null $P1138, vivify_218
    $P1138 = root_new ['parrot';'Hash']
  vivify_218:
    set $P112, $P1138["EXPR"]
    unless_null $P112, vivify_219
    new $P112, "Undef"
  vivify_219:
    $P113 = $P112."ast"()
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_220
    $P1139 = root_new ['parrot';'Hash']
  vivify_220:
    set $P114, $P1139["pblock"]
    unless_null $P114, vivify_221
    new $P114, "Undef"
  vivify_221:
    $P115 = $P114."ast"()
    find_lex $P117, "$/"
    $P118 = $P111."new"($P113, $P115, "if" :named("pasttype"), $P117 :named("node"))
    $P119 = $P110."!make"($P118)
.annotate 'line', 118
    .return ($P119)
  control_1135:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "pblock"  :subid("28_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1143
.annotate 'line', 122
    new $P1142, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1142, control_1141
    push_eh $P1142
    .lex "self", self
    .lex "$/", param_1143
.annotate 'line', 123
    find_lex $P110, "$/"
    find_lex $P1144, "$/"
    unless_null $P1144, vivify_222
    $P1144 = root_new ['parrot';'Hash']
  vivify_222:
    set $P111, $P1144["blockoid"]
    unless_null $P111, vivify_223
    new $P111, "Undef"
  vivify_223:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
.annotate 'line', 122
    .return ($P113)
  control_1141:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "block"  :subid("29_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1148
.annotate 'line', 126
    new $P1147, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1147, control_1146
    push_eh $P1147
    .lex "self", self
    .lex "$/", param_1148
.annotate 'line', 127
    find_lex $P110, "$/"
    find_lex $P1149, "$/"
    unless_null $P1149, vivify_224
    $P1149 = root_new ['parrot';'Hash']
  vivify_224:
    set $P111, $P1149["blockoid"]
    unless_null $P111, vivify_225
    new $P111, "Undef"
  vivify_225:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
.annotate 'line', 126
    .return ($P113)
  control_1146:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blockoid"  :subid("30_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1153
.annotate 'line', 130
    new $P1152, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1152, control_1151
    push_eh $P1152
    .lex "self", self
    .lex "$/", param_1153
.annotate 'line', 131
    new $P110, "Undef"
    set $P1154, $P110
    .lex "$past", $P1154
.annotate 'line', 132
    new $P111, "Undef"
    set $P1155, $P111
    .lex "$BLOCK", $P1155
.annotate 'line', 131
    find_lex $P1156, "$/"
    unless_null $P1156, vivify_226
    $P1156 = root_new ['parrot';'Hash']
  vivify_226:
    set $P112, $P1156["statementlist"]
    unless_null $P112, vivify_227
    new $P112, "Undef"
  vivify_227:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 132
    get_global $P112, "@BLOCK"
    $P113 = $P112."shift"()
    store_lex "$BLOCK", $P113
.annotate 'line', 133
    find_lex $P112, "$BLOCK"
    find_lex $P113, "$past"
    $P112."push"($P113)
.annotate 'line', 134
    find_lex $P112, "$BLOCK"
    find_lex $P113, "$/"
    $P112."node"($P113)
.annotate 'line', 135
    find_lex $P112, "$BLOCK"
    $P112."closure"(1)
.annotate 'line', 136
    find_lex $P112, "$/"
    find_lex $P113, "$BLOCK"
    $P114 = $P112."!make"($P113)
.annotate 'line', 130
    .return ($P114)
  control_1151:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "newpad"  :subid("31_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1160
.annotate 'line', 139
    new $P1159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1159, control_1158
    push_eh $P1159
    .lex "self", self
    .lex "$/", param_1160
.annotate 'line', 140
    get_global $P1161, "@BLOCK"
    unless_null $P1161, vivify_228
    $P1161 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P1161
  vivify_228:
.annotate 'line', 139
    get_global $P110, "@BLOCK"
.annotate 'line', 141
    get_global $P110, "@BLOCK"
    get_hll_global $P111, ["PAST"], "Block"
    get_hll_global $P112, ["PAST"], "Stmts"
    $P113 = $P112."new"()
    $P114 = $P111."new"($P113)
    $P115 = $P110."unshift"($P114)
.annotate 'line', 139
    .return ($P115)
  control_1158:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "outerctx"  :subid("32_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1165
.annotate 'line', 144
    new $P1164, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1164, control_1163
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate 'line', 145
    get_global $P1166, "@BLOCK"
    unless_null $P1166, vivify_229
    $P1166 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P1166
  vivify_229:
.annotate 'line', 144
    get_global $P110, "@BLOCK"
.annotate 'line', 146
    find_lex $P110, "self"
    get_global $P1167, "@BLOCK"
    unless_null $P1167, vivify_230
    $P1167 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P111, $P1167[0]
    unless_null $P111, vivify_231
    new $P111, "Undef"
  vivify_231:
    $P112 = $P110."SET_BLOCK_OUTER_CTX"($P111)
.annotate 'line', 144
    .return ($P112)
  control_1163:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<if>"  :subid("33_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1171
.annotate 'line', 151
    .const 'Sub' $P1182 = "34_1309998850.8808"
    capture_lex $P1182
    new $P1170, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1170, control_1169
    push_eh $P1170
    .lex "self", self
    .lex "$/", param_1171
.annotate 'line', 152
    new $P110, "Undef"
    set $P1172, $P110
    .lex "$count", $P1172
.annotate 'line', 153
    new $P111, "Undef"
    set $P1173, $P111
    .lex "$past", $P1173
.annotate 'line', 152
    find_lex $P1174, "$/"
    unless_null $P1174, vivify_232
    $P1174 = root_new ['parrot';'Hash']
  vivify_232:
    set $P112, $P1174["xblock"]
    unless_null $P112, vivify_233
    new $P112, "Undef"
  vivify_233:
    set $N100, $P112
    new $P113, 'Float'
    set $P113, $N100
    sub $P114, $P113, 1
    store_lex "$count", $P114
.annotate 'line', 153
    find_lex $P112, "$count"
    set $I100, $P112
    find_lex $P1175, "$/"
    unless_null $P1175, vivify_234
    $P1175 = root_new ['parrot';'Hash']
  vivify_234:
    set $P1176, $P1175["xblock"]
    unless_null $P1176, vivify_235
    $P1176 = root_new ['parrot';'ResizablePMCArray']
  vivify_235:
    set $P113, $P1176[$I100]
    unless_null $P113, vivify_236
    new $P113, "Undef"
  vivify_236:
    $P114 = $P113."ast"()
    $P115 = "xblock_immediate"($P114)
    store_lex "$past", $P115
.annotate 'line', 154
    find_lex $P1178, "$/"
    unless_null $P1178, vivify_237
    $P1178 = root_new ['parrot';'Hash']
  vivify_237:
    set $P112, $P1178["else"]
    unless_null $P112, vivify_238
    new $P112, "Undef"
  vivify_238:
    unless $P112, if_1177_end
.annotate 'line', 155
    find_lex $P113, "$past"
    find_lex $P1179, "$/"
    unless_null $P1179, vivify_239
    $P1179 = root_new ['parrot';'Hash']
  vivify_239:
    set $P1180, $P1179["else"]
    unless_null $P1180, vivify_240
    $P1180 = root_new ['parrot';'ResizablePMCArray']
  vivify_240:
    set $P114, $P1180[0]
    unless_null $P114, vivify_241
    new $P114, "Undef"
  vivify_241:
    $P115 = $P114."ast"()
    $P117 = "block_immediate"($P115)
    $P113."push"($P117)
  if_1177_end:
.annotate 'line', 158
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1187_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1187_test:
    find_lex $P112, "$count"
    set $N100, $P112
    isgt $I100, $N100, 0.0
    unless $I100, loop1187_done
  loop1187_redo:
    .const 'Sub' $P1182 = "34_1309998850.8808"
    capture_lex $P1182
    $P1182()
  loop1187_next:
    goto loop1187_test
  loop1187_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1187_next
    eq $P115, .CONTROL_LOOP_REDO, loop1187_redo
  loop1187_done:
    pop_eh
.annotate 'line', 164
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 151
    .return ($P114)
  control_1169:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block1181"  :anon :subid("34_1309998850.8808") :outer("33_1309998850.8808")
.annotate 'line', 160
    new $P113, "Undef"
    set $P1183, $P113
    .lex "$else", $P1183
.annotate 'line', 158
    find_lex $P114, "$count"
    clone $P1184, $P114
    dec $P114
.annotate 'line', 160
    find_lex $P114, "$past"
    store_lex "$else", $P114
.annotate 'line', 161
    find_lex $P114, "$count"
    set $I101, $P114
    find_lex $P1185, "$/"
    unless_null $P1185, vivify_242
    $P1185 = root_new ['parrot';'Hash']
  vivify_242:
    set $P1186, $P1185["xblock"]
    unless_null $P1186, vivify_243
    $P1186 = root_new ['parrot';'ResizablePMCArray']
  vivify_243:
    set $P115, $P1186[$I101]
    unless_null $P115, vivify_244
    new $P115, "Undef"
  vivify_244:
    $P117 = $P115."ast"()
    $P118 = "xblock_immediate"($P117)
    store_lex "$past", $P118
.annotate 'line', 162
    find_lex $P114, "$past"
    find_lex $P115, "$else"
    $P117 = $P114."push"($P115)
.annotate 'line', 158
    .return ($P117)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<unless>"  :subid("35_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1191
.annotate 'line', 167
    new $P1190, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1190, control_1189
    push_eh $P1190
    .lex "self", self
    .lex "$/", param_1191
.annotate 'line', 168
    new $P110, "Undef"
    set $P1192, $P110
    .lex "$past", $P1192
    find_lex $P1193, "$/"
    unless_null $P1193, vivify_245
    $P1193 = root_new ['parrot';'Hash']
  vivify_245:
    set $P111, $P1193["xblock"]
    unless_null $P111, vivify_246
    new $P111, "Undef"
  vivify_246:
    $P112 = $P111."ast"()
    $P113 = "xblock_immediate"($P112)
    store_lex "$past", $P113
.annotate 'line', 169
    find_lex $P111, "$past"
    $P111."pasttype"("unless")
.annotate 'line', 170
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 167
    .return ($P113)
  control_1189:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<while>"  :subid("36_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1197
.annotate 'line', 173
    new $P1196, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1196, control_1195
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate 'line', 174
    new $P110, "Undef"
    set $P1198, $P110
    .lex "$past", $P1198
    find_lex $P1199, "$/"
    unless_null $P1199, vivify_247
    $P1199 = root_new ['parrot';'Hash']
  vivify_247:
    set $P111, $P1199["xblock"]
    unless_null $P111, vivify_248
    new $P111, "Undef"
  vivify_248:
    $P112 = $P111."ast"()
    $P113 = "xblock_immediate"($P112)
    store_lex "$past", $P113
.annotate 'line', 175
    find_lex $P111, "$past"
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_249
    $P1200 = root_new ['parrot';'Hash']
  vivify_249:
    set $P112, $P1200["sym"]
    unless_null $P112, vivify_250
    new $P112, "Undef"
  vivify_250:
    set $S100, $P112
    $P111."pasttype"($S100)
.annotate 'line', 176
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 173
    .return ($P113)
  control_1195:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<repeat>"  :subid("37_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1204
.annotate 'line', 179
    new $P1203, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1203, control_1202
    push_eh $P1203
    .lex "self", self
    .lex "$/", param_1204
.annotate 'line', 180
    new $P110, "Undef"
    set $P1205, $P110
    .lex "$pasttype", $P1205
.annotate 'line', 181
    new $P111, "Undef"
    set $P1206, $P111
    .lex "$past", $P1206
.annotate 'line', 180
    new $P112, "String"
    assign $P112, "repeat_"
    find_lex $P1207, "$/"
    unless_null $P1207, vivify_251
    $P1207 = root_new ['parrot';'Hash']
  vivify_251:
    set $P113, $P1207["wu"]
    unless_null $P113, vivify_252
    new $P113, "Undef"
  vivify_252:
    set $S100, $P113
    concat $P114, $P112, $S100
    store_lex "$pasttype", $P114
.annotate 'line', 179
    find_lex $P112, "$past"
.annotate 'line', 182
    find_lex $P1209, "$/"
    unless_null $P1209, vivify_253
    $P1209 = root_new ['parrot';'Hash']
  vivify_253:
    set $P112, $P1209["xblock"]
    unless_null $P112, vivify_254
    new $P112, "Undef"
  vivify_254:
    if $P112, if_1208
.annotate 'line', 187
    get_hll_global $P113, ["PAST"], "Op"
    find_lex $P1211, "$/"
    unless_null $P1211, vivify_255
    $P1211 = root_new ['parrot';'Hash']
  vivify_255:
    set $P114, $P1211["EXPR"]
    unless_null $P114, vivify_256
    new $P114, "Undef"
  vivify_256:
    $P115 = $P114."ast"()
    find_lex $P1212, "$/"
    unless_null $P1212, vivify_257
    $P1212 = root_new ['parrot';'Hash']
  vivify_257:
    set $P117, $P1212["pblock"]
    unless_null $P117, vivify_258
    new $P117, "Undef"
  vivify_258:
    $P118 = $P117."ast"()
    $P119 = "block_immediate"($P118)
    find_lex $P120, "$pasttype"
    find_lex $P121, "$/"
    $P122 = $P113."new"($P115, $P119, $P120 :named("pasttype"), $P121 :named("node"))
    store_lex "$past", $P122
.annotate 'line', 186
    goto if_1208_end
  if_1208:
.annotate 'line', 183
    find_lex $P1210, "$/"
    unless_null $P1210, vivify_259
    $P1210 = root_new ['parrot';'Hash']
  vivify_259:
    set $P113, $P1210["xblock"]
    unless_null $P113, vivify_260
    new $P113, "Undef"
  vivify_260:
    $P114 = $P113."ast"()
    $P115 = "xblock_immediate"($P114)
    store_lex "$past", $P115
.annotate 'line', 184
    find_lex $P113, "$past"
    find_lex $P114, "$pasttype"
    $P113."pasttype"($P114)
  if_1208_end:
.annotate 'line', 190
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 179
    .return ($P114)
  control_1202:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<for>"  :subid("38_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1216
.annotate 'line', 193
    new $P1215, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1215, control_1214
    push_eh $P1215
    .lex "self", self
    .lex "$/", param_1216
.annotate 'line', 194
    new $P110, "Undef"
    set $P1217, $P110
    .lex "$past", $P1217
.annotate 'line', 196
    new $P111, "Undef"
    set $P1218, $P111
    .lex "$block", $P1218
.annotate 'line', 194
    find_lex $P1219, "$/"
    unless_null $P1219, vivify_261
    $P1219 = root_new ['parrot';'Hash']
  vivify_261:
    set $P112, $P1219["xblock"]
    unless_null $P112, vivify_262
    new $P112, "Undef"
  vivify_262:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 195
    find_lex $P112, "$past"
    $P112."pasttype"("for")
.annotate 'line', 196
    find_lex $P1220, "$past"
    unless_null $P1220, vivify_263
    $P1220 = root_new ['parrot';'ResizablePMCArray']
  vivify_263:
    set $P112, $P1220[1]
    unless_null $P112, vivify_264
    new $P112, "Undef"
  vivify_264:
    store_lex "$block", $P112
.annotate 'line', 197
    find_lex $P112, "$block"
    $P113 = $P112."arity"()
    if $P113, unless_1221_end
.annotate 'line', 198
    find_lex $P1222, "$block"
    unless_null $P1222, vivify_265
    $P1222 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P114, $P1222[0]
    unless_null $P114, vivify_266
    new $P114, "Undef"
  vivify_266:
    get_hll_global $P115, ["PAST"], "Var"
    $P117 = $P115."new"("$_" :named("name"), "parameter" :named("scope"))
    $P114."push"($P117)
.annotate 'line', 199
    find_lex $P114, "$block"
    $P114."symbol"("$_", "lexical" :named("scope"))
.annotate 'line', 200
    find_lex $P114, "$block"
    $P114."arity"(1)
  unless_1221_end:
.annotate 'line', 202
    find_lex $P112, "$block"
    $P112."blocktype"("immediate")
.annotate 'line', 203
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 193
    .return ($P114)
  control_1214:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<return>"  :subid("39_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1226
.annotate 'line', 206
    new $P1225, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1225, control_1224
    push_eh $P1225
    .lex "self", self
    .lex "$/", param_1226
.annotate 'line', 207
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
    find_lex $P1227, "$/"
    unless_null $P1227, vivify_267
    $P1227 = root_new ['parrot';'Hash']
  vivify_267:
    set $P112, $P1227["EXPR"]
    unless_null $P112, vivify_268
    new $P112, "Undef"
  vivify_268:
    $P113 = $P112."ast"()
    find_lex $P114, "$/"
    $P115 = $P111."new"($P113, "return" :named("pasttype"), $P114 :named("node"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 206
    .return ($P117)
  control_1224:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CATCH>"  :subid("40_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1231
.annotate 'line', 210
    new $P1230, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1230, control_1229
    push_eh $P1230
    .lex "self", self
    .lex "$/", param_1231
.annotate 'line', 211
    new $P110, "Undef"
    set $P1232, $P110
    .lex "$block", $P1232
    find_lex $P1233, "$/"
    unless_null $P1233, vivify_269
    $P1233 = root_new ['parrot';'Hash']
  vivify_269:
    set $P111, $P1233["block"]
    unless_null $P111, vivify_270
    new $P111, "Undef"
  vivify_270:
    $P112 = $P111."ast"()
    store_lex "$block", $P112
.annotate 'line', 212
    find_lex $P111, "$/"
    find_lex $P112, "$block"
    "push_block_handler"($P111, $P112)
.annotate 'line', 213
    get_global $P1234, "@BLOCK"
    unless_null $P1234, vivify_271
    $P1234 = root_new ['parrot';'ResizablePMCArray']
  vivify_271:
    set $P111, $P1234[0]
    unless_null $P111, vivify_272
    new $P111, "Undef"
  vivify_272:
    $P112 = $P111."handlers"()
    set $P113, $P112[0]
    unless_null $P113, vivify_273
    new $P113, "Undef"
  vivify_273:
    $P113."handle_types_except"("CONTROL")
.annotate 'line', 214
    find_lex $P111, "$/"
    get_hll_global $P112, ["PAST"], "Stmts"
    find_lex $P113, "$/"
    $P114 = $P112."new"($P113 :named("node"))
    $P115 = $P111."!make"($P114)
.annotate 'line', 210
    .return ($P115)
  control_1229:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_control:sym<CONTROL>"  :subid("41_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1238
.annotate 'line', 217
    new $P1237, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1237, control_1236
    push_eh $P1237
    .lex "self", self
    .lex "$/", param_1238
.annotate 'line', 218
    new $P110, "Undef"
    set $P1239, $P110
    .lex "$block", $P1239
    find_lex $P1240, "$/"
    unless_null $P1240, vivify_274
    $P1240 = root_new ['parrot';'Hash']
  vivify_274:
    set $P111, $P1240["block"]
    unless_null $P111, vivify_275
    new $P111, "Undef"
  vivify_275:
    $P112 = $P111."ast"()
    store_lex "$block", $P112
.annotate 'line', 219
    find_lex $P111, "$/"
    find_lex $P112, "$block"
    "push_block_handler"($P111, $P112)
.annotate 'line', 220
    get_global $P1241, "@BLOCK"
    unless_null $P1241, vivify_276
    $P1241 = root_new ['parrot';'ResizablePMCArray']
  vivify_276:
    set $P111, $P1241[0]
    unless_null $P111, vivify_277
    new $P111, "Undef"
  vivify_277:
    $P112 = $P111."handlers"()
    set $P113, $P112[0]
    unless_null $P113, vivify_278
    new $P113, "Undef"
  vivify_278:
    $P113."handle_types"("CONTROL")
.annotate 'line', 221
    find_lex $P111, "$/"
    get_hll_global $P112, ["PAST"], "Stmts"
    find_lex $P113, "$/"
    $P114 = $P112."new"($P113 :named("node"))
    $P115 = $P111."!make"($P114)
.annotate 'line', 217
    .return ($P115)
  control_1236:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<INIT>"  :subid("42_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1245
.annotate 'line', 261
    new $P1244, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1244, control_1243
    push_eh $P1244
    .lex "self", self
    .lex "$/", param_1245
.annotate 'line', 262
    get_global $P1246, "@BLOCK"
    unless_null $P1246, vivify_279
    $P1246 = root_new ['parrot';'ResizablePMCArray']
  vivify_279:
    set $P110, $P1246[0]
    unless_null $P110, vivify_280
    new $P110, "Undef"
  vivify_280:
    $P111 = $P110."loadinit"()
    find_lex $P1247, "$/"
    unless_null $P1247, vivify_281
    $P1247 = root_new ['parrot';'Hash']
  vivify_281:
    set $P112, $P1247["blorst"]
    unless_null $P112, vivify_282
    new $P112, "Undef"
  vivify_282:
    $P113 = $P112."ast"()
    $P111."push"($P113)
.annotate 'line', 263
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Stmts"
    find_lex $P112, "$/"
    $P113 = $P111."new"($P112 :named("node"))
    $P114 = $P110."!make"($P113)
.annotate 'line', 261
    .return ($P114)
  control_1243:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_prefix:sym<try>"  :subid("43_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1251
.annotate 'line', 266
    new $P1250, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1250, control_1249
    push_eh $P1250
    .lex "self", self
    .lex "$/", param_1251
.annotate 'line', 267
    new $P110, "Undef"
    set $P1252, $P110
    .lex "$past", $P1252
    find_lex $P1253, "$/"
    unless_null $P1253, vivify_283
    $P1253 = root_new ['parrot';'Hash']
  vivify_283:
    set $P111, $P1253["blorst"]
    unless_null $P111, vivify_284
    new $P111, "Undef"
  vivify_284:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 268
    find_lex $P111, "$past"
    $S100 = $P111."WHAT"()
    isne $I100, $S100, "PAST::Block()"
    unless $I100, if_1254_end
.annotate 'line', 269
    get_hll_global $P112, ["PAST"], "Block"
    find_lex $P113, "$past"
    find_lex $P114, "$/"
    $P115 = $P112."new"($P113, "immediate" :named("blocktype"), $P114 :named("node"))
    store_lex "$past", $P115
  if_1254_end:
.annotate 'line', 271
    find_lex $P111, "$past"
    $P112 = $P111."handlers"()
    if $P112, unless_1255_end
.annotate 'line', 272
    find_lex $P113, "$past"
    get_hll_global $P114, ["PAST"], "Control"
.annotate 'line', 274
    get_hll_global $P115, ["PAST"], "Stmts"
.annotate 'line', 275
    get_hll_global $P117, ["PAST"], "Op"
.annotate 'line', 276
    get_hll_global $P118, ["PAST"], "Var"
.annotate 'line', 277
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("register" :named("scope"), "exception" :named("name"))
    $P121 = $P118."new"($P120, "handled", "keyed" :named("scope"))
.annotate 'line', 276
    $P122 = $P117."new"($P121, 1, "bind" :named("pasttype"))
.annotate 'line', 275
    $P123 = $P115."new"($P122)
.annotate 'line', 274
    $P124 = $P114."new"($P123, "CONTROL" :named("handle_types_except"))
.annotate 'line', 272
    new $P125, "ResizablePMCArray"
    push $P125, $P124
    $P113."handlers"($P125)
  unless_1255_end:
.annotate 'line', 286
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 266
    .return ($P113)
  control_1249:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "blorst"  :subid("44_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1259
.annotate 'line', 289
    new $P1258, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1258, control_1257
    push_eh $P1258
    .lex "self", self
    .lex "$/", param_1259
.annotate 'line', 290
    find_lex $P110, "$/"
.annotate 'line', 291
    find_lex $P1261, "$/"
    unless_null $P1261, vivify_285
    $P1261 = root_new ['parrot';'Hash']
  vivify_285:
    set $P112, $P1261["block"]
    unless_null $P112, vivify_286
    new $P112, "Undef"
  vivify_286:
    if $P112, if_1260
.annotate 'line', 292
    find_lex $P1263, "$/"
    unless_null $P1263, vivify_287
    $P1263 = root_new ['parrot';'Hash']
  vivify_287:
    set $P117, $P1263["statement"]
    unless_null $P117, vivify_288
    new $P117, "Undef"
  vivify_288:
    $P118 = $P117."ast"()
    set $P111, $P118
.annotate 'line', 291
    goto if_1260_end
  if_1260:
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_289
    $P1262 = root_new ['parrot';'Hash']
  vivify_289:
    set $P113, $P1262["block"]
    unless_null $P113, vivify_290
    new $P113, "Undef"
  vivify_290:
    $P114 = $P113."ast"()
    $P115 = "block_immediate"($P114)
    set $P111, $P115
  if_1260_end:
    $P119 = $P110."!make"($P111)
.annotate 'line', 289
    .return ($P119)
  control_1257:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<if>"  :subid("45_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1267
.annotate 'line', 297
    new $P1266, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1266, control_1265
    push_eh $P1266
    .lex "self", self
    .lex "$/", param_1267
    find_lex $P110, "$/"
    find_lex $P1268, "$/"
    unless_null $P1268, vivify_291
    $P1268 = root_new ['parrot';'Hash']
  vivify_291:
    set $P111, $P1268["cond"]
    unless_null $P111, vivify_292
    new $P111, "Undef"
  vivify_292:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1265:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_cond:sym<unless>"  :subid("46_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1272
.annotate 'line', 298
    new $P1271, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1271, control_1270
    push_eh $P1271
    .lex "self", self
    .lex "$/", param_1272
    find_lex $P110, "$/"
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_293
    $P1273 = root_new ['parrot';'Hash']
  vivify_293:
    set $P111, $P1273["cond"]
    unless_null $P111, vivify_294
    new $P111, "Undef"
  vivify_294:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1270:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<while>"  :subid("47_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1277
.annotate 'line', 300
    new $P1276, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1276, control_1275
    push_eh $P1276
    .lex "self", self
    .lex "$/", param_1277
    find_lex $P110, "$/"
    find_lex $P1278, "$/"
    unless_null $P1278, vivify_295
    $P1278 = root_new ['parrot';'Hash']
  vivify_295:
    set $P111, $P1278["cond"]
    unless_null $P111, vivify_296
    new $P111, "Undef"
  vivify_296:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1275:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "statement_mod_loop:sym<until>"  :subid("48_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1282
.annotate 'line', 301
    new $P1281, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1281, control_1280
    push_eh $P1281
    .lex "self", self
    .lex "$/", param_1282
    find_lex $P110, "$/"
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_297
    $P1283 = root_new ['parrot';'Hash']
  vivify_297:
    set $P111, $P1283["cond"]
    unless_null $P111, vivify_298
    new $P111, "Undef"
  vivify_298:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1280:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<fatarrow>"  :subid("49_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1287
.annotate 'line', 305
    new $P1286, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1286, control_1285
    push_eh $P1286
    .lex "self", self
    .lex "$/", param_1287
    find_lex $P110, "$/"
    find_lex $P1288, "$/"
    unless_null $P1288, vivify_299
    $P1288 = root_new ['parrot';'Hash']
  vivify_299:
    set $P111, $P1288["fatarrow"]
    unless_null $P111, vivify_300
    new $P111, "Undef"
  vivify_300:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1285:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<colonpair>"  :subid("50_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1292
.annotate 'line', 306
    new $P1291, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1291, control_1290
    push_eh $P1291
    .lex "self", self
    .lex "$/", param_1292
    find_lex $P110, "$/"
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_301
    $P1293 = root_new ['parrot';'Hash']
  vivify_301:
    set $P111, $P1293["colonpair"]
    unless_null $P111, vivify_302
    new $P111, "Undef"
  vivify_302:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1290:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<variable>"  :subid("51_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1297
.annotate 'line', 307
    new $P1296, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1296, control_1295
    push_eh $P1296
    .lex "self", self
    .lex "$/", param_1297
    find_lex $P110, "$/"
    find_lex $P1298, "$/"
    unless_null $P1298, vivify_303
    $P1298 = root_new ['parrot';'Hash']
  vivify_303:
    set $P111, $P1298["variable"]
    unless_null $P111, vivify_304
    new $P111, "Undef"
  vivify_304:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1295:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<package_declarator>"  :subid("52_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1302
.annotate 'line', 308
    new $P1301, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1301, control_1300
    push_eh $P1301
    .lex "self", self
    .lex "$/", param_1302
    find_lex $P110, "$/"
    find_lex $P1303, "$/"
    unless_null $P1303, vivify_305
    $P1303 = root_new ['parrot';'Hash']
  vivify_305:
    set $P111, $P1303["package_declarator"]
    unless_null $P111, vivify_306
    new $P111, "Undef"
  vivify_306:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1300:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<scope_declarator>"  :subid("53_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1307
.annotate 'line', 309
    new $P1306, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1306, control_1305
    push_eh $P1306
    .lex "self", self
    .lex "$/", param_1307
    find_lex $P110, "$/"
    find_lex $P1308, "$/"
    unless_null $P1308, vivify_307
    $P1308 = root_new ['parrot';'Hash']
  vivify_307:
    set $P111, $P1308["scope_declarator"]
    unless_null $P111, vivify_308
    new $P111, "Undef"
  vivify_308:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1305:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<routine_declarator>"  :subid("54_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1312
.annotate 'line', 310
    new $P1311, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1311, control_1310
    push_eh $P1311
    .lex "self", self
    .lex "$/", param_1312
    find_lex $P110, "$/"
    find_lex $P1313, "$/"
    unless_null $P1313, vivify_309
    $P1313 = root_new ['parrot';'Hash']
  vivify_309:
    set $P111, $P1313["routine_declarator"]
    unless_null $P111, vivify_310
    new $P111, "Undef"
  vivify_310:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1310:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<multi_declarator>"  :subid("55_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1317
.annotate 'line', 311
    new $P1316, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1316, control_1315
    push_eh $P1316
    .lex "self", self
    .lex "$/", param_1317
    find_lex $P110, "$/"
    find_lex $P1318, "$/"
    unless_null $P1318, vivify_311
    $P1318 = root_new ['parrot';'Hash']
  vivify_311:
    set $P111, $P1318["multi_declarator"]
    unless_null $P111, vivify_312
    new $P111, "Undef"
  vivify_312:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1315:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<regex_declarator>"  :subid("56_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1322
.annotate 'line', 312
    new $P1321, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1321, control_1320
    push_eh $P1321
    .lex "self", self
    .lex "$/", param_1322
    find_lex $P110, "$/"
    find_lex $P1323, "$/"
    unless_null $P1323, vivify_313
    $P1323 = root_new ['parrot';'Hash']
  vivify_313:
    set $P111, $P1323["regex_declarator"]
    unless_null $P111, vivify_314
    new $P111, "Undef"
  vivify_314:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1320:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<statement_prefix>"  :subid("57_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1327
.annotate 'line', 313
    new $P1326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1326, control_1325
    push_eh $P1326
    .lex "self", self
    .lex "$/", param_1327
    find_lex $P110, "$/"
    find_lex $P1328, "$/"
    unless_null $P1328, vivify_315
    $P1328 = root_new ['parrot';'Hash']
  vivify_315:
    set $P111, $P1328["statement_prefix"]
    unless_null $P111, vivify_316
    new $P111, "Undef"
  vivify_316:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1325:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<lambda>"  :subid("58_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1332
.annotate 'line', 314
    new $P1331, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1331, control_1330
    push_eh $P1331
    .lex "self", self
    .lex "$/", param_1332
    find_lex $P110, "$/"
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_317
    $P1333 = root_new ['parrot';'Hash']
  vivify_317:
    set $P111, $P1333["pblock"]
    unless_null $P111, vivify_318
    new $P111, "Undef"
  vivify_318:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1330:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "fatarrow"  :subid("59_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1337
.annotate 'line', 316
    new $P1336, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1336, control_1335
    push_eh $P1336
    .lex "self", self
    .lex "$/", param_1337
.annotate 'line', 317
    new $P110, "Undef"
    set $P1338, $P110
    .lex "$past", $P1338
    find_lex $P1339, "$/"
    unless_null $P1339, vivify_319
    $P1339 = root_new ['parrot';'Hash']
  vivify_319:
    set $P111, $P1339["val"]
    unless_null $P111, vivify_320
    new $P111, "Undef"
  vivify_320:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 318
    find_lex $P111, "$past"
    find_lex $P1340, "$/"
    unless_null $P1340, vivify_321
    $P1340 = root_new ['parrot';'Hash']
  vivify_321:
    set $P112, $P1340["key"]
    unless_null $P112, vivify_322
    new $P112, "Undef"
  vivify_322:
    $P113 = $P112."Str"()
    $P111."named"($P113)
.annotate 'line', 319
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 316
    .return ($P113)
  control_1335:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "colonpair"  :subid("60_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1344
.annotate 'line', 322
    new $P1343, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1343, control_1342
    push_eh $P1343
    .lex "self", self
    .lex "$/", param_1344
.annotate 'line', 323
    new $P110, "Undef"
    set $P1345, $P110
    .lex "$past", $P1345
.annotate 'line', 324
    find_lex $P1347, "$/"
    unless_null $P1347, vivify_323
    $P1347 = root_new ['parrot';'Hash']
  vivify_323:
    set $P112, $P1347["circumfix"]
    unless_null $P112, vivify_324
    new $P112, "Undef"
  vivify_324:
    if $P112, if_1346
.annotate 'line', 325
    get_hll_global $P115, ["PAST"], "Val"
    find_lex $P1350, "$/"
    unless_null $P1350, vivify_325
    $P1350 = root_new ['parrot';'Hash']
  vivify_325:
    set $P117, $P1350["not"]
    unless_null $P117, vivify_326
    new $P117, "Undef"
  vivify_326:
    isfalse $I100, $P117
    $P118 = $P115."new"($I100 :named("value"))
    set $P111, $P118
.annotate 'line', 324
    goto if_1346_end
  if_1346:
    find_lex $P1348, "$/"
    unless_null $P1348, vivify_327
    $P1348 = root_new ['parrot';'Hash']
  vivify_327:
    set $P1349, $P1348["circumfix"]
    unless_null $P1349, vivify_328
    $P1349 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P113, $P1349[0]
    unless_null $P113, vivify_329
    new $P113, "Undef"
  vivify_329:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1346_end:
    store_lex "$past", $P111
.annotate 'line', 326
    find_lex $P111, "$past"
    find_lex $P1351, "$/"
    unless_null $P1351, vivify_330
    $P1351 = root_new ['parrot';'Hash']
  vivify_330:
    set $P112, $P1351["identifier"]
    unless_null $P112, vivify_331
    new $P112, "Undef"
  vivify_331:
    set $S100, $P112
    $P111."named"($S100)
.annotate 'line', 327
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 322
    .return ($P113)
  control_1342:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable"  :subid("61_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1355
.annotate 'line', 330
    .const 'Sub' $P1361 = "62_1309998850.8808"
    capture_lex $P1361
    new $P1354, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1354, control_1353
    push_eh $P1354
    .lex "self", self
    .lex "$/", param_1355
.annotate 'line', 331
    new $P110, "Undef"
    set $P1356, $P110
    .lex "$past", $P1356
.annotate 'line', 330
    find_lex $P111, "$past"
.annotate 'line', 332
    find_lex $P1358, "$/"
    unless_null $P1358, vivify_332
    $P1358 = root_new ['parrot';'Hash']
  vivify_332:
    set $P111, $P1358["postcircumfix"]
    unless_null $P111, vivify_333
    new $P111, "Undef"
  vivify_333:
    if $P111, if_1357
.annotate 'line', 336
    .const 'Sub' $P1361 = "62_1309998850.8808"
    capture_lex $P1361
    $P1361()
    goto if_1357_end
  if_1357:
.annotate 'line', 333
    find_lex $P1359, "$/"
    unless_null $P1359, vivify_350
    $P1359 = root_new ['parrot';'Hash']
  vivify_350:
    set $P112, $P1359["postcircumfix"]
    unless_null $P112, vivify_351
    new $P112, "Undef"
  vivify_351:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 334
    find_lex $P112, "$past"
    get_hll_global $P113, ["PAST"], "Var"
    $P114 = $P113."new"("$/" :named("name"))
    $P112."unshift"($P114)
  if_1357_end:
.annotate 'line', 365
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 330
    .return ($P113)
  control_1353:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.sub "_block1360"  :anon :subid("62_1309998850.8808") :outer("61_1309998850.8808")
.annotate 'line', 337
    $P1363 = root_new ['parrot';'ResizablePMCArray']
    set $P1362, $P1363
    .lex "@name", $P1362
    get_hll_global $P112, ["NQP"], "Compiler"
    find_lex $P113, "$/"
    set $S100, $P113
    $P114 = $P112."parse_name"($S100)
    store_lex "@name", $P114
.annotate 'line', 338
    get_hll_global $P112, ["PAST"], "Var"
    find_lex $P113, "@name"
    $P114 = $P113."pop"()
    set $S100, $P114
    $P115 = $P112."new"($S100 :named("name"))
    store_lex "$past", $P115
.annotate 'line', 339
    find_lex $P112, "@name"
    unless $P112, if_1364_end
.annotate 'line', 340
    find_lex $P1366, "@name"
    unless_null $P1366, vivify_334
    $P1366 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P113, $P1366[0]
    unless_null $P113, vivify_335
    new $P113, "Undef"
  vivify_335:
    set $S100, $P113
    iseq $I100, $S100, "GLOBAL"
    unless $I100, if_1365_end
    find_lex $P114, "@name"
    $P114."shift"()
  if_1365_end:
.annotate 'line', 341
    find_lex $P113, "$past"
    find_lex $P114, "@name"
    $P113."namespace"($P114)
.annotate 'line', 342
    find_lex $P113, "$past"
    $P113."scope"("package")
.annotate 'line', 343
    find_lex $P113, "$past"
    find_lex $P1367, "$/"
    unless_null $P1367, vivify_336
    $P1367 = root_new ['parrot';'Hash']
  vivify_336:
    set $P114, $P1367["sigil"]
    unless_null $P114, vivify_337
    new $P114, "Undef"
  vivify_337:
    $P115 = "vivitype"($P114)
    $P113."viviself"($P115)
.annotate 'line', 344
    find_lex $P113, "$past"
    $P113."lvalue"(1)
  if_1364_end:
.annotate 'line', 346
    find_lex $P1369, "$/"
    unless_null $P1369, vivify_338
    $P1369 = root_new ['parrot';'Hash']
  vivify_338:
    set $P1370, $P1369["twigil"]
    unless_null $P1370, vivify_339
    $P1370 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P113, $P1370[0]
    unless_null $P113, vivify_340
    new $P113, "Undef"
  vivify_340:
    set $S100, $P113
    iseq $I100, $S100, "*"
    if $I100, if_1368
.annotate 'line', 359
    find_lex $P1374, "$/"
    unless_null $P1374, vivify_341
    $P1374 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1375, $P1374["twigil"]
    unless_null $P1375, vivify_342
    $P1375 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P115, $P1375[0]
    unless_null $P115, vivify_343
    new $P115, "Undef"
  vivify_343:
    set $S101, $P115
    iseq $I101, $S101, "!"
    if $I101, if_1373
    new $P114, 'Integer'
    set $P114, $I101
    goto if_1373_end
  if_1373:
.annotate 'line', 360
    find_lex $P117, "$past"
    get_hll_global $P118, ["PAST"], "Var"
    $P119 = $P118."new"("self" :named("name"))
    $P117."push"($P119)
.annotate 'line', 361
    find_lex $P117, "$past"
    $P117."scope"("attribute")
.annotate 'line', 362
    find_lex $P117, "$past"
    find_lex $P1376, "$/"
    unless_null $P1376, vivify_344
    $P1376 = root_new ['parrot';'Hash']
  vivify_344:
    set $P118, $P1376["sigil"]
    unless_null $P118, vivify_345
    new $P118, "Undef"
  vivify_345:
    $P119 = "vivitype"($P118)
    $P120 = $P117."viviself"($P119)
.annotate 'line', 359
    set $P114, $P120
  if_1373_end:
    set $P112, $P114
.annotate 'line', 346
    goto if_1368_end
  if_1368:
.annotate 'line', 347
    find_lex $P114, "$past"
    $P114."scope"("contextual")
.annotate 'line', 348
    find_lex $P114, "$past"
.annotate 'line', 349
    get_hll_global $P115, ["PAST"], "Var"
.annotate 'line', 351
    find_lex $P1371, "$/"
    unless_null $P1371, vivify_346
    $P1371 = root_new ['parrot';'Hash']
  vivify_346:
    set $P117, $P1371["sigil"]
    unless_null $P117, vivify_347
    new $P117, "Undef"
  vivify_347:
    set $S101, $P117
    new $P118, 'String'
    set $P118, $S101
    find_lex $P1372, "$/"
    unless_null $P1372, vivify_348
    $P1372 = root_new ['parrot';'Hash']
  vivify_348:
    set $P119, $P1372["desigilname"]
    unless_null $P119, vivify_349
    new $P119, "Undef"
  vivify_349:
    concat $P120, $P118, $P119
.annotate 'line', 353
    get_hll_global $P121, ["PAST"], "Op"
    new $P122, "String"
    assign $P122, "Contextual "
    find_lex $P123, "$/"
    set $S102, $P123
    concat $P124, $P122, $S102
    concat $P125, $P124, " not found"
    $P127 = $P121."new"($P125, "die" :named("pirop"))
.annotate 'line', 349
    $P128 = $P115."new"("package" :named("scope"), "" :named("namespace"), $P120 :named("name"), $P127 :named("viviself"))
    $P129 = $P114."viviself"($P128)
.annotate 'line', 346
    set $P112, $P129
  if_1368_end:
.annotate 'line', 336
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<module>"  :subid("63_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1380
.annotate 'line', 368
    new $P1379, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1379, control_1378
    push_eh $P1379
    .lex "self", self
    .lex "$/", param_1380
    find_lex $P110, "$/"
    find_lex $P1381, "$/"
    unless_null $P1381, vivify_352
    $P1381 = root_new ['parrot';'Hash']
  vivify_352:
    set $P111, $P1381["package_def"]
    unless_null $P111, vivify_353
    new $P111, "Undef"
  vivify_353:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1378:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_declarator:sym<class>"  :subid("64_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1385
.annotate 'line', 369
    new $P1384, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1384, control_1383
    push_eh $P1384
    .lex "self", self
    .lex "$/", param_1385
.annotate 'line', 370
    new $P110, "Undef"
    set $P1386, $P110
    .lex "$past", $P1386
.annotate 'line', 371
    new $P111, "Undef"
    set $P1387, $P111
    .lex "$classinit", $P1387
.annotate 'line', 380
    new $P112, "Undef"
    set $P1388, $P112
    .lex "$parent", $P1388
.annotate 'line', 370
    find_lex $P1389, "$/"
    unless_null $P1389, vivify_354
    $P1389 = root_new ['parrot';'Hash']
  vivify_354:
    set $P113, $P1389["package_def"]
    unless_null $P113, vivify_355
    new $P113, "Undef"
  vivify_355:
    $P114 = $P113."ast"()
    store_lex "$past", $P114
.annotate 'line', 372
    get_hll_global $P113, ["PAST"], "Op"
.annotate 'line', 373
    get_hll_global $P114, ["PAST"], "Op"
    $P115 = $P114."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate 'line', 376
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_356
    $P1390 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1391, $P1390["package_def"]
    unless_null $P1391, vivify_357
    $P1391 = root_new ['parrot';'Hash']
  vivify_357:
    set $P117, $P1391["name"]
    unless_null $P117, vivify_358
    new $P117, "Undef"
  vivify_358:
    set $S100, $P117
    $P118 = $P113."new"($P115, $S100, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 372
    store_lex "$classinit", $P118
.annotate 'line', 380
    find_lex $P1393, "$/"
    unless_null $P1393, vivify_359
    $P1393 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1394, $P1393["package_def"]
    unless_null $P1394, vivify_360
    $P1394 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1395, $P1394["parent"]
    unless_null $P1395, vivify_361
    $P1395 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P114, $P1395[0]
    unless_null $P114, vivify_362
    new $P114, "Undef"
  vivify_362:
    set $S100, $P114
    unless $S100, unless_1392
    new $P113, 'String'
    set $P113, $S100
    goto unless_1392_end
  unless_1392:
.annotate 'line', 381
    find_lex $P1397, "$/"
    unless_null $P1397, vivify_363
    $P1397 = root_new ['parrot';'Hash']
  vivify_363:
    set $P117, $P1397["sym"]
    unless_null $P117, vivify_364
    new $P117, "Undef"
  vivify_364:
    set $S101, $P117
    iseq $I100, $S101, "grammar"
    if $I100, if_1396
    new $P119, "String"
    assign $P119, ""
    set $P115, $P119
    goto if_1396_end
  if_1396:
    new $P118, "String"
    assign $P118, "Regex::Cursor"
    set $P115, $P118
  if_1396_end:
    set $P113, $P115
  unless_1392_end:
    store_lex "$parent", $P113
.annotate 'line', 382
    find_lex $P113, "$parent"
    unless $P113, if_1398_end
.annotate 'line', 383
    find_lex $P114, "$classinit"
    get_hll_global $P115, ["PAST"], "Val"
    find_lex $P117, "$parent"
    $P118 = $P115."new"($P117 :named("value"), "parent" :named("named"))
    $P114."push"($P118)
  if_1398_end:
.annotate 'line', 385
    find_lex $P1400, "$past"
    unless_null $P1400, vivify_365
    $P1400 = root_new ['parrot';'Hash']
  vivify_365:
    set $P113, $P1400["attributes"]
    unless_null $P113, vivify_366
    new $P113, "Undef"
  vivify_366:
    unless $P113, if_1399_end
.annotate 'line', 386
    find_lex $P114, "$classinit"
    find_lex $P1401, "$past"
    unless_null $P1401, vivify_367
    $P1401 = root_new ['parrot';'Hash']
  vivify_367:
    set $P115, $P1401["attributes"]
    unless_null $P115, vivify_368
    new $P115, "Undef"
  vivify_368:
    $P114."push"($P115)
  if_1399_end:
.annotate 'line', 388
    get_global $P1402, "@BLOCK"
    unless_null $P1402, vivify_369
    $P1402 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P113, $P1402[0]
    unless_null $P113, vivify_370
    new $P113, "Undef"
  vivify_370:
    $P114 = $P113."loadinit"()
    find_lex $P115, "$classinit"
    $P114."push"($P115)
.annotate 'line', 389
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 369
    .return ($P115)
  control_1383:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "package_def"  :subid("65_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1406
.annotate 'line', 392
    new $P1405, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1405, control_1404
    push_eh $P1405
    .lex "self", self
    .lex "$/", param_1406
.annotate 'line', 393
    new $P110, "Undef"
    set $P1407, $P110
    .lex "$past", $P1407
    find_lex $P1409, "$/"
    unless_null $P1409, vivify_371
    $P1409 = root_new ['parrot';'Hash']
  vivify_371:
    set $P112, $P1409["block"]
    unless_null $P112, vivify_372
    new $P112, "Undef"
  vivify_372:
    if $P112, if_1408
    find_lex $P1411, "$/"
    unless_null $P1411, vivify_373
    $P1411 = root_new ['parrot';'Hash']
  vivify_373:
    set $P115, $P1411["comp_unit"]
    unless_null $P115, vivify_374
    new $P115, "Undef"
  vivify_374:
    $P117 = $P115."ast"()
    set $P111, $P117
    goto if_1408_end
  if_1408:
    find_lex $P1410, "$/"
    unless_null $P1410, vivify_375
    $P1410 = root_new ['parrot';'Hash']
  vivify_375:
    set $P113, $P1410["block"]
    unless_null $P113, vivify_376
    new $P113, "Undef"
  vivify_376:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1408_end:
    store_lex "$past", $P111
.annotate 'line', 394
    find_lex $P111, "$past"
    find_lex $P1412, "$/"
    unless_null $P1412, vivify_377
    $P1412 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1413, $P1412["name"]
    unless_null $P1413, vivify_378
    $P1413 = root_new ['parrot';'Hash']
  vivify_378:
    set $P112, $P1413["identifier"]
    unless_null $P112, vivify_379
    new $P112, "Undef"
  vivify_379:
    $P111."namespace"($P112)
.annotate 'line', 395
    find_lex $P111, "$past"
    $P111."blocktype"("immediate")
.annotate 'line', 396
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 392
    .return ($P113)
  control_1404:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<my>"  :subid("66_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1417
.annotate 'line', 399
    new $P1416, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1416, control_1415
    push_eh $P1416
    .lex "self", self
    .lex "$/", param_1417
    find_lex $P110, "$/"
    find_lex $P1418, "$/"
    unless_null $P1418, vivify_380
    $P1418 = root_new ['parrot';'Hash']
  vivify_380:
    set $P111, $P1418["scoped"]
    unless_null $P111, vivify_381
    new $P111, "Undef"
  vivify_381:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1415:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<our>"  :subid("67_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1422
.annotate 'line', 400
    new $P1421, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1421, control_1420
    push_eh $P1421
    .lex "self", self
    .lex "$/", param_1422
    find_lex $P110, "$/"
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_382
    $P1423 = root_new ['parrot';'Hash']
  vivify_382:
    set $P111, $P1423["scoped"]
    unless_null $P111, vivify_383
    new $P111, "Undef"
  vivify_383:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1420:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scope_declarator:sym<has>"  :subid("68_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1427
.annotate 'line', 401
    new $P1426, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1426, control_1425
    push_eh $P1426
    .lex "self", self
    .lex "$/", param_1427
    find_lex $P110, "$/"
    find_lex $P1428, "$/"
    unless_null $P1428, vivify_384
    $P1428 = root_new ['parrot';'Hash']
  vivify_384:
    set $P111, $P1428["scoped"]
    unless_null $P111, vivify_385
    new $P111, "Undef"
  vivify_385:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1425:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "scoped"  :subid("69_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1432
.annotate 'line', 403
    new $P1431, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1431, control_1430
    push_eh $P1431
    .lex "self", self
    .lex "$/", param_1432
.annotate 'line', 404
    find_lex $P110, "$/"
.annotate 'line', 405
    find_lex $P1434, "$/"
    unless_null $P1434, vivify_386
    $P1434 = root_new ['parrot';'Hash']
  vivify_386:
    set $P112, $P1434["declarator"]
    unless_null $P112, vivify_387
    new $P112, "Undef"
  vivify_387:
    if $P112, if_1433
.annotate 'line', 406
    find_lex $P1436, "$/"
    unless_null $P1436, vivify_388
    $P1436 = root_new ['parrot';'Hash']
  vivify_388:
    set $P115, $P1436["multi_declarator"]
    unless_null $P115, vivify_389
    new $P115, "Undef"
  vivify_389:
    $P117 = $P115."ast"()
    set $P111, $P117
.annotate 'line', 405
    goto if_1433_end
  if_1433:
    find_lex $P1435, "$/"
    unless_null $P1435, vivify_390
    $P1435 = root_new ['parrot';'Hash']
  vivify_390:
    set $P113, $P1435["declarator"]
    unless_null $P113, vivify_391
    new $P113, "Undef"
  vivify_391:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1433_end:
    $P118 = $P110."!make"($P111)
.annotate 'line', 403
    .return ($P118)
  control_1430:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "declarator"  :subid("70_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1440
.annotate 'line', 409
    new $P1439, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1439, control_1438
    push_eh $P1439
    .lex "self", self
    .lex "$/", param_1440
.annotate 'line', 410
    find_lex $P110, "$/"
.annotate 'line', 411
    find_lex $P1442, "$/"
    unless_null $P1442, vivify_392
    $P1442 = root_new ['parrot';'Hash']
  vivify_392:
    set $P112, $P1442["routine_declarator"]
    unless_null $P112, vivify_393
    new $P112, "Undef"
  vivify_393:
    if $P112, if_1441
.annotate 'line', 412
    find_lex $P1444, "$/"
    unless_null $P1444, vivify_394
    $P1444 = root_new ['parrot';'Hash']
  vivify_394:
    set $P115, $P1444["variable_declarator"]
    unless_null $P115, vivify_395
    new $P115, "Undef"
  vivify_395:
    $P117 = $P115."ast"()
    set $P111, $P117
.annotate 'line', 411
    goto if_1441_end
  if_1441:
    find_lex $P1443, "$/"
    unless_null $P1443, vivify_396
    $P1443 = root_new ['parrot';'Hash']
  vivify_396:
    set $P113, $P1443["routine_declarator"]
    unless_null $P113, vivify_397
    new $P113, "Undef"
  vivify_397:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1441_end:
    $P118 = $P110."!make"($P111)
.annotate 'line', 409
    .return ($P118)
  control_1438:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<multi>"  :subid("71_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1448
.annotate 'line', 415
    new $P1447, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1447, control_1446
    push_eh $P1447
    .lex "self", self
    .lex "$/", param_1448
    find_lex $P110, "$/"
    find_lex $P1450, "$/"
    unless_null $P1450, vivify_398
    $P1450 = root_new ['parrot';'Hash']
  vivify_398:
    set $P112, $P1450["declarator"]
    unless_null $P112, vivify_399
    new $P112, "Undef"
  vivify_399:
    if $P112, if_1449
    find_lex $P1452, "$/"
    unless_null $P1452, vivify_400
    $P1452 = root_new ['parrot';'Hash']
  vivify_400:
    set $P115, $P1452["routine_def"]
    unless_null $P115, vivify_401
    new $P115, "Undef"
  vivify_401:
    $P117 = $P115."ast"()
    set $P111, $P117
    goto if_1449_end
  if_1449:
    find_lex $P1451, "$/"
    unless_null $P1451, vivify_402
    $P1451 = root_new ['parrot';'Hash']
  vivify_402:
    set $P113, $P1451["declarator"]
    unless_null $P113, vivify_403
    new $P113, "Undef"
  vivify_403:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1449_end:
    $P118 = $P110."!make"($P111)
    .return ($P118)
  control_1446:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "multi_declarator:sym<null>"  :subid("72_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1456
.annotate 'line', 416
    new $P1455, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1455, control_1454
    push_eh $P1455
    .lex "self", self
    .lex "$/", param_1456
    find_lex $P110, "$/"
    find_lex $P1457, "$/"
    unless_null $P1457, vivify_404
    $P1457 = root_new ['parrot';'Hash']
  vivify_404:
    set $P111, $P1457["declarator"]
    unless_null $P111, vivify_405
    new $P111, "Undef"
  vivify_405:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1454:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "variable_declarator"  :subid("73_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1461
.annotate 'line', 419
    .const 'Sub' $P1477 = "74_1309998850.8808"
    capture_lex $P1477
    new $P1460, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1460, control_1459
    push_eh $P1460
    .lex "self", self
    .lex "$/", param_1461
.annotate 'line', 420
    new $P110, "Undef"
    set $P1462, $P110
    .lex "$past", $P1462
.annotate 'line', 421
    new $P111, "Undef"
    set $P1463, $P111
    .lex "$sigil", $P1463
.annotate 'line', 422
    new $P112, "Undef"
    set $P1464, $P112
    .lex "$name", $P1464
.annotate 'line', 423
    new $P113, "Undef"
    set $P1465, $P113
    .lex "$BLOCK", $P1465
.annotate 'line', 420
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_406
    $P1466 = root_new ['parrot';'Hash']
  vivify_406:
    set $P114, $P1466["variable"]
    unless_null $P114, vivify_407
    new $P114, "Undef"
  vivify_407:
    $P115 = $P114."ast"()
    store_lex "$past", $P115
.annotate 'line', 421
    find_lex $P1467, "$/"
    unless_null $P1467, vivify_408
    $P1467 = root_new ['parrot';'Hash']
  vivify_408:
    set $P1468, $P1467["variable"]
    unless_null $P1468, vivify_409
    $P1468 = root_new ['parrot';'Hash']
  vivify_409:
    set $P114, $P1468["sigil"]
    unless_null $P114, vivify_410
    new $P114, "Undef"
  vivify_410:
    store_lex "$sigil", $P114
.annotate 'line', 422
    find_lex $P114, "$past"
    $P115 = $P114."name"()
    store_lex "$name", $P115
.annotate 'line', 423
    get_global $P1469, "@BLOCK"
    unless_null $P1469, vivify_411
    $P1469 = root_new ['parrot';'ResizablePMCArray']
  vivify_411:
    set $P114, $P1469[0]
    unless_null $P114, vivify_412
    new $P114, "Undef"
  vivify_412:
    store_lex "$BLOCK", $P114
.annotate 'line', 424
    find_lex $P114, "$BLOCK"
    find_lex $P115, "$name"
    $P117 = $P114."symbol"($P115)
    unless $P117, if_1470_end
.annotate 'line', 425
    find_lex $P118, "$/"
    $P119 = $P118."CURSOR"()
    find_lex $P120, "$name"
    $P119."panic"("Redeclaration of symbol ", $P120)
  if_1470_end:
.annotate 'line', 427
    find_dynamic_lex $P114, "$*SCOPE"
    unless_null $P114, vivify_413
    get_hll_global $P114, "$SCOPE"
    unless_null $P114, vivify_414
    die "Contextual $*SCOPE not found"
  vivify_414:
  vivify_413:
    set $S100, $P114
    iseq $I100, $S100, "has"
    if $I100, if_1471
.annotate 'line', 436
    .const 'Sub' $P1477 = "74_1309998850.8808"
    capture_lex $P1477
    $P1477()
    goto if_1471_end
  if_1471:
.annotate 'line', 428
    find_lex $P115, "$BLOCK"
    find_lex $P117, "$name"
    $P115."symbol"($P117, "attribute" :named("scope"))
.annotate 'line', 429
    find_lex $P1473, "$BLOCK"
    unless_null $P1473, vivify_419
    $P1473 = root_new ['parrot';'Hash']
  vivify_419:
    set $P115, $P1473["attributes"]
    unless_null $P115, vivify_420
    new $P115, "Undef"
  vivify_420:
    if $P115, unless_1472_end
.annotate 'line', 431
    get_hll_global $P117, ["PAST"], "Op"
    $P118 = $P117."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1474, "$BLOCK"
    unless_null $P1474, vivify_421
    $P1474 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1474
  vivify_421:
    set $P1474["attributes"], $P118
  unless_1472_end:
.annotate 'line', 433
    find_lex $P1475, "$BLOCK"
    unless_null $P1475, vivify_422
    $P1475 = root_new ['parrot';'Hash']
  vivify_422:
    set $P115, $P1475["attributes"]
    unless_null $P115, vivify_423
    new $P115, "Undef"
  vivify_423:
    find_lex $P117, "$name"
    $P115."push"($P117)
.annotate 'line', 434
    get_hll_global $P115, ["PAST"], "Stmts"
    $P117 = $P115."new"()
    store_lex "$past", $P117
  if_1471_end:
.annotate 'line', 444
    find_lex $P114, "$/"
    find_lex $P115, "$past"
    $P117 = $P114."!make"($P115)
.annotate 'line', 419
    .return ($P117)
  control_1459:
    .local pmc exception
    .get_results (exception)
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["NQP";"Actions"]
.sub "_block1476"  :anon :subid("74_1309998850.8808") :outer("73_1309998850.8808")
.annotate 'line', 437
    new $P115, "Undef"
    set $P1478, $P115
    .lex "$scope", $P1478
.annotate 'line', 438
    new $P117, "Undef"
    set $P1479, $P117
    .lex "$decl", $P1479
.annotate 'line', 437
    find_dynamic_lex $P119, "$*SCOPE"
    unless_null $P119, vivify_415
    get_hll_global $P119, "$SCOPE"
    unless_null $P119, vivify_416
    die "Contextual $*SCOPE not found"
  vivify_416:
  vivify_415:
    set $S101, $P119
    iseq $I101, $S101, "our"
    if $I101, if_1480
    new $P121, "String"
    assign $P121, "lexical"
    set $P118, $P121
    goto if_1480_end
  if_1480:
    new $P120, "String"
    assign $P120, "package"
    set $P118, $P120
  if_1480_end:
    store_lex "$scope", $P118
.annotate 'line', 438
    get_hll_global $P118, ["PAST"], "Var"
    find_lex $P119, "$name"
    find_lex $P120, "$scope"
.annotate 'line', 439
    find_lex $P121, "$sigil"
    $P122 = "vivitype"($P121)
.annotate 'line', 438
    find_lex $P123, "$/"
    $P124 = $P118."new"($P119 :named("name"), $P120 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P122 :named("viviself"), $P123 :named("node"))
    store_lex "$decl", $P124
.annotate 'line', 441
    find_lex $P118, "$BLOCK"
    find_lex $P119, "$name"
    find_lex $P120, "$scope"
    $P118."symbol"($P119, $P120 :named("scope"))
.annotate 'line', 442
    find_lex $P1481, "$BLOCK"
    unless_null $P1481, vivify_417
    $P1481 = root_new ['parrot';'ResizablePMCArray']
  vivify_417:
    set $P118, $P1481[0]
    unless_null $P118, vivify_418
    new $P118, "Undef"
  vivify_418:
    find_lex $P119, "$decl"
    $P120 = $P118."push"($P119)
.annotate 'line', 436
    .return ($P120)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<sub>"  :subid("75_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1485
.annotate 'line', 447
    new $P1484, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1484, control_1483
    push_eh $P1484
    .lex "self", self
    .lex "$/", param_1485
    find_lex $P110, "$/"
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_424
    $P1486 = root_new ['parrot';'Hash']
  vivify_424:
    set $P111, $P1486["routine_def"]
    unless_null $P111, vivify_425
    new $P111, "Undef"
  vivify_425:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1483:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_declarator:sym<method>"  :subid("76_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1490
.annotate 'line', 448
    new $P1489, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1489, control_1488
    push_eh $P1489
    .lex "self", self
    .lex "$/", param_1490
    find_lex $P110, "$/"
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_426
    $P1491 = root_new ['parrot';'Hash']
  vivify_426:
    set $P111, $P1491["method_def"]
    unless_null $P111, vivify_427
    new $P111, "Undef"
  vivify_427:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1488:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "routine_def"  :subid("77_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1495
.annotate 'line', 450
    .const 'Sub' $P1517 = "79_1309998850.8808"
    capture_lex $P1517
    .const 'Sub' $P1502 = "78_1309998850.8808"
    capture_lex $P1502
    new $P1494, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1494, control_1493
    push_eh $P1494
    .lex "self", self
    .lex "$/", param_1495
.annotate 'line', 451
    new $P110, "Undef"
    set $P1496, $P110
    .lex "$block", $P1496
.annotate 'line', 454
    new $P111, "Undef"
    set $P1497, $P111
    .lex "$past", $P1497
.annotate 'line', 451
    find_lex $P1498, "$/"
    unless_null $P1498, vivify_428
    $P1498 = root_new ['parrot';'Hash']
  vivify_428:
    set $P112, $P1498["blockoid"]
    unless_null $P112, vivify_429
    new $P112, "Undef"
  vivify_429:
    $P113 = $P112."ast"()
    store_lex "$block", $P113
.annotate 'line', 452
    find_lex $P112, "$block"
    $P112."blocktype"("declaration")
.annotate 'line', 453
    find_lex $P112, "$block"
    $P112."control"("return_pir")
.annotate 'line', 454
    find_lex $P112, "$block"
    store_lex "$past", $P112
.annotate 'line', 455
    find_lex $P1500, "$/"
    unless_null $P1500, vivify_430
    $P1500 = root_new ['parrot';'Hash']
  vivify_430:
    set $P112, $P1500["deflongname"]
    unless_null $P112, vivify_431
    new $P112, "Undef"
  vivify_431:
    unless $P112, if_1499_end
    .const 'Sub' $P1502 = "78_1309998850.8808"
    capture_lex $P1502
    $P1502()
  if_1499_end:
.annotate 'line', 465
    find_lex $P112, "$block"
    find_lex $P1512, "$past"
    unless_null $P1512, vivify_445
    $P1512 = root_new ['parrot';'Hash']
    store_lex "$past", $P1512
  vivify_445:
    set $P1512["block_past"], $P112
.annotate 'line', 466
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P112."!make"($P113)
.annotate 'line', 467
    find_lex $P1514, "$/"
    unless_null $P1514, vivify_446
    $P1514 = root_new ['parrot';'Hash']
  vivify_446:
    set $P113, $P1514["trait"]
    unless_null $P113, vivify_447
    new $P113, "Undef"
  vivify_447:
    if $P113, if_1513
    set $P112, $P113
    goto if_1513_end
  if_1513:
.annotate 'line', 468
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_448
    $P1515 = root_new ['parrot';'Hash']
  vivify_448:
    set $P115, $P1515["trait"]
    unless_null $P115, vivify_449
    new $P115, "Undef"
  vivify_449:
    defined $I100, $P115
    unless $I100, for_undef_450
    iter $P114, $P115
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1519_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1519_test:
    unless $P114, loop1519_done
    shift $P117, $P114
  loop1519_redo:
    .const 'Sub' $P1517 = "79_1309998850.8808"
    capture_lex $P1517
    $P1517($P117)
  loop1519_next:
    goto loop1519_test
  loop1519_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1519_next
    eq $P119, .CONTROL_LOOP_REDO, loop1519_redo
  loop1519_done:
    pop_eh
  for_undef_450:
.annotate 'line', 467
    set $P112, $P114
  if_1513_end:
.annotate 'line', 450
    .return ($P112)
  control_1493:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.sub "_block1501"  :anon :subid("78_1309998850.8808") :outer("77_1309998850.8808")
.annotate 'line', 456
    new $P113, "Undef"
    set $P1503, $P113
    .lex "$name", $P1503
    find_lex $P1504, "$/"
    unless_null $P1504, vivify_432
    $P1504 = root_new ['parrot';'Hash']
  vivify_432:
    set $P1505, $P1504["sigil"]
    unless_null $P1505, vivify_433
    $P1505 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P114, $P1505[0]
    unless_null $P114, vivify_434
    new $P114, "Undef"
  vivify_434:
    set $S100, $P114
    new $P115, 'String'
    set $P115, $S100
    find_lex $P1506, "$/"
    unless_null $P1506, vivify_435
    $P1506 = root_new ['parrot';'Hash']
  vivify_435:
    set $P1507, $P1506["deflongname"]
    unless_null $P1507, vivify_436
    $P1507 = root_new ['parrot';'ResizablePMCArray']
  vivify_436:
    set $P117, $P1507[0]
    unless_null $P117, vivify_437
    new $P117, "Undef"
  vivify_437:
    $S101 = $P117."ast"()
    concat $P118, $P115, $S101
    store_lex "$name", $P118
.annotate 'line', 457
    find_lex $P114, "$past"
    find_lex $P115, "$name"
    $P114."name"($P115)
.annotate 'line', 458
    find_dynamic_lex $P115, "$*SCOPE"
    unless_null $P115, vivify_438
    get_hll_global $P115, "$SCOPE"
    unless_null $P115, vivify_439
    die "Contextual $*SCOPE not found"
  vivify_439:
  vivify_438:
    set $S100, $P115
    isne $I100, $S100, "our"
    if $I100, if_1508
    new $P114, 'Integer'
    set $P114, $I100
    goto if_1508_end
  if_1508:
.annotate 'line', 459
    get_global $P1509, "@BLOCK"
    unless_null $P1509, vivify_440
    $P1509 = root_new ['parrot';'ResizablePMCArray']
  vivify_440:
    set $P1510, $P1509[0]
    unless_null $P1510, vivify_441
    $P1510 = root_new ['parrot';'ResizablePMCArray']
  vivify_441:
    set $P117, $P1510[0]
    unless_null $P117, vivify_442
    new $P117, "Undef"
  vivify_442:
    get_hll_global $P118, ["PAST"], "Var"
    find_lex $P119, "$name"
    find_lex $P120, "$past"
    $P121 = $P118."new"($P119 :named("name"), 1 :named("isdecl"), $P120 :named("viviself"), "lexical" :named("scope"))
    $P117."push"($P121)
.annotate 'line', 461
    get_global $P1511, "@BLOCK"
    unless_null $P1511, vivify_443
    $P1511 = root_new ['parrot';'ResizablePMCArray']
  vivify_443:
    set $P117, $P1511[0]
    unless_null $P117, vivify_444
    new $P117, "Undef"
  vivify_444:
    find_lex $P118, "$name"
    $P117."symbol"($P118, "lexical" :named("scope"))
.annotate 'line', 462
    get_hll_global $P117, ["PAST"], "Var"
    find_lex $P118, "$name"
    $P119 = $P117."new"($P118 :named("name"))
    store_lex "$past", $P119
.annotate 'line', 458
    set $P114, $P119
  if_1508_end:
.annotate 'line', 455
    .return ($P114)
.end


.namespace ["NQP";"Actions"]
.sub "_block1516"  :anon :subid("79_1309998850.8808") :outer("77_1309998850.8808")
    .param pmc param_1518
.annotate 'line', 468
    .lex "$_", param_1518
    find_lex $P118, "$_"
    $P119 = $P118."ast"()
    find_lex $P120, "$/"
    $P121 = $P119($P120)
    .return ($P121)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "method_def"  :subid("80_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1523
.annotate 'line', 473
    .const 'Sub' $P1541 = "82_1309998850.8808"
    capture_lex $P1541
    .const 'Sub' $P1531 = "81_1309998850.8808"
    capture_lex $P1531
    new $P1522, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1522, control_1521
    push_eh $P1522
    .lex "self", self
    .lex "$/", param_1523
.annotate 'line', 474
    new $P110, "Undef"
    set $P1524, $P110
    .lex "$past", $P1524
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_451
    $P1525 = root_new ['parrot';'Hash']
  vivify_451:
    set $P111, $P1525["blockoid"]
    unless_null $P111, vivify_452
    new $P111, "Undef"
  vivify_452:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 475
    find_lex $P111, "$past"
    $P111."blocktype"("method")
.annotate 'line', 476
    find_dynamic_lex $P111, "$*SCOPE"
    unless_null $P111, vivify_453
    get_hll_global $P111, "$SCOPE"
    unless_null $P111, vivify_454
    die "Contextual $*SCOPE not found"
  vivify_454:
  vivify_453:
    set $S100, $P111
    iseq $I100, $S100, "our"
    unless $I100, if_1526_end
.annotate 'line', 477
    find_lex $P112, "$past"
    $P112."pirflags"(":nsentry")
  if_1526_end:
.annotate 'line', 479
    find_lex $P111, "$past"
    $P111."control"("return_pir")
.annotate 'line', 480
    find_lex $P1527, "$past"
    unless_null $P1527, vivify_455
    $P1527 = root_new ['parrot';'ResizablePMCArray']
  vivify_455:
    set $P111, $P1527[0]
    unless_null $P111, vivify_456
    new $P111, "Undef"
  vivify_456:
    get_hll_global $P112, ["PAST"], "Op"
    $P113 = $P112."new"("    .lex \"self\", self" :named("inline"))
    $P111."unshift"($P113)
.annotate 'line', 481
    find_lex $P111, "$past"
    $P111."symbol"("self", "lexical" :named("scope"))
.annotate 'line', 482
    find_lex $P1529, "$/"
    unless_null $P1529, vivify_457
    $P1529 = root_new ['parrot';'Hash']
  vivify_457:
    set $P111, $P1529["deflongname"]
    unless_null $P111, vivify_458
    new $P111, "Undef"
  vivify_458:
    unless $P111, if_1528_end
    .const 'Sub' $P1531 = "81_1309998850.8808"
    capture_lex $P1531
    $P1531()
  if_1528_end:
.annotate 'line', 486
    find_dynamic_lex $P111, "$*MULTINESS"
    unless_null $P111, vivify_462
    get_hll_global $P111, "$MULTINESS"
    unless_null $P111, vivify_463
    die "Contextual $*MULTINESS not found"
  vivify_463:
  vivify_462:
    set $S100, $P111
    iseq $I100, $S100, "multi"
    unless $I100, if_1535_end
    find_lex $P112, "$past"
    $P113 = $P112."multi"()
    $P113."unshift"("_")
  if_1535_end:
.annotate 'line', 487
    find_lex $P111, "$past"
    find_lex $P1536, "$past"
    unless_null $P1536, vivify_464
    $P1536 = root_new ['parrot';'Hash']
    store_lex "$past", $P1536
  vivify_464:
    set $P1536["block_past"], $P111
.annotate 'line', 488
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P111."!make"($P112)
.annotate 'line', 489
    find_lex $P1538, "$/"
    unless_null $P1538, vivify_465
    $P1538 = root_new ['parrot';'Hash']
  vivify_465:
    set $P112, $P1538["trait"]
    unless_null $P112, vivify_466
    new $P112, "Undef"
  vivify_466:
    if $P112, if_1537
    set $P111, $P112
    goto if_1537_end
  if_1537:
.annotate 'line', 490
    find_lex $P1539, "$/"
    unless_null $P1539, vivify_467
    $P1539 = root_new ['parrot';'Hash']
  vivify_467:
    set $P114, $P1539["trait"]
    unless_null $P114, vivify_468
    new $P114, "Undef"
  vivify_468:
    defined $I100, $P114
    unless $I100, for_undef_469
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1543_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1543_test:
    unless $P113, loop1543_done
    shift $P115, $P113
  loop1543_redo:
    .const 'Sub' $P1541 = "82_1309998850.8808"
    capture_lex $P1541
    $P1541($P115)
  loop1543_next:
    goto loop1543_test
  loop1543_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1543_next
    eq $P118, .CONTROL_LOOP_REDO, loop1543_redo
  loop1543_done:
    pop_eh
  for_undef_469:
.annotate 'line', 489
    set $P111, $P113
  if_1537_end:
.annotate 'line', 473
    .return ($P111)
  control_1521:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block1530"  :anon :subid("81_1309998850.8808") :outer("80_1309998850.8808")
.annotate 'line', 483
    new $P112, "Undef"
    set $P1532, $P112
    .lex "$name", $P1532
    find_lex $P1533, "$/"
    unless_null $P1533, vivify_459
    $P1533 = root_new ['parrot';'Hash']
  vivify_459:
    set $P1534, $P1533["deflongname"]
    unless_null $P1534, vivify_460
    $P1534 = root_new ['parrot';'ResizablePMCArray']
  vivify_460:
    set $P113, $P1534[0]
    unless_null $P113, vivify_461
    new $P113, "Undef"
  vivify_461:
    $P114 = $P113."ast"()
    set $S100, $P114
    new $P115, 'String'
    set $P115, $S100
    store_lex "$name", $P115
.annotate 'line', 484
    find_lex $P113, "$past"
    find_lex $P114, "$name"
    $P115 = $P113."name"($P114)
.annotate 'line', 482
    .return ($P115)
.end


.namespace ["NQP";"Actions"]
.sub "_block1540"  :anon :subid("82_1309998850.8808") :outer("80_1309998850.8808")
    .param pmc param_1542
.annotate 'line', 490
    .lex "$_", param_1542
    find_lex $P117, "$_"
    $P118 = $P117."ast"()
    find_lex $P119, "$/"
    $P120 = $P118($P119)
    .return ($P120)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "signature"  :subid("83_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1547
.annotate 'line', 495
    .const 'Sub' $P1558 = "85_1309998850.8808"
    capture_lex $P1558
    .const 'Sub' $P1553 = "84_1309998850.8808"
    capture_lex $P1553
    new $P1546, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1546, control_1545
    push_eh $P1546
    .lex "self", self
    .lex "$/", param_1547
.annotate 'line', 496
    new $P110, "Undef"
    set $P1548, $P110
    .lex "$BLOCKINIT", $P1548
    get_global $P1549, "@BLOCK"
    unless_null $P1549, vivify_470
    $P1549 = root_new ['parrot';'ResizablePMCArray']
  vivify_470:
    set $P1550, $P1549[0]
    unless_null $P1550, vivify_471
    $P1550 = root_new ['parrot';'ResizablePMCArray']
  vivify_471:
    set $P111, $P1550[0]
    unless_null $P111, vivify_472
    new $P111, "Undef"
  vivify_472:
    store_lex "$BLOCKINIT", $P111
.annotate 'line', 498
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_473
    $P1551 = root_new ['parrot';'Hash']
  vivify_473:
    set $P112, $P1551["parameter"]
    unless_null $P112, vivify_474
    new $P112, "Undef"
  vivify_474:
    defined $I100, $P112
    unless $I100, for_undef_475
    iter $P111, $P112
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1555_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1555_test:
    unless $P111, loop1555_done
    shift $P113, $P111
  loop1555_redo:
    .const 'Sub' $P1553 = "84_1309998850.8808"
    capture_lex $P1553
    $P1553($P113)
  loop1555_next:
    goto loop1555_test
  loop1555_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1555_next
    eq $P115, .CONTROL_LOOP_REDO, loop1555_redo
  loop1555_done:
    pop_eh
  for_undef_475:
.annotate 'line', 501
    find_dynamic_lex $P112, "$*MULTINESS"
    unless_null $P112, vivify_476
    get_hll_global $P112, "$MULTINESS"
    unless_null $P112, vivify_477
    die "Contextual $*MULTINESS not found"
  vivify_477:
  vivify_476:
    set $S100, $P112
    iseq $I100, $S100, "multi"
    if $I100, if_1556
    new $P111, 'Integer'
    set $P111, $I100
    goto if_1556_end
  if_1556:
    .const 'Sub' $P1558 = "85_1309998850.8808"
    capture_lex $P1558
    $P113 = $P1558()
    set $P111, $P113
  if_1556_end:
.annotate 'line', 495
    .return ($P111)
  control_1545:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block1552"  :anon :subid("84_1309998850.8808") :outer("83_1309998850.8808")
    .param pmc param_1554
.annotate 'line', 498
    .lex "$_", param_1554
    find_lex $P114, "$BLOCKINIT"
    find_lex $P115, "$_"
    $P117 = $P115."ast"()
    $P118 = $P114."push"($P117)
    .return ($P118)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1557"  :anon :subid("85_1309998850.8808") :outer("83_1309998850.8808")
.annotate 'line', 501
    .const 'Sub' $P1562 = "86_1309998850.8808"
    capture_lex $P1562
.annotate 'line', 502
    $P1560 = root_new ['parrot';'ResizablePMCArray']
    set $P1559, $P1560
    .lex "@params", $P1559
.annotate 'line', 501
    find_lex $P113, "@params"
.annotate 'line', 503
    find_lex $P114, "$BLOCKINIT"
    $P115 = $P114."list"()
    defined $I101, $P115
    unless $I101, for_undef_478
    iter $P113, $P115
    new $P119, 'ExceptionHandler'
    set_label $P119, loop1570_handler
    $P119."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P119
  loop1570_test:
    unless $P113, loop1570_done
    shift $P117, $P113
  loop1570_redo:
    .const 'Sub' $P1562 = "86_1309998850.8808"
    capture_lex $P1562
    $P1562($P117)
  loop1570_next:
    goto loop1570_test
  loop1570_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P120, exception, 'type'
    eq $P120, .CONTROL_LOOP_NEXT, loop1570_next
    eq $P120, .CONTROL_LOOP_REDO, loop1570_redo
  loop1570_done:
    pop_eh
  for_undef_478:
.annotate 'line', 507
    get_global $P1571, "@BLOCK"
    unless_null $P1571, vivify_479
    $P1571 = root_new ['parrot';'ResizablePMCArray']
  vivify_479:
    set $P113, $P1571[0]
    unless_null $P113, vivify_480
    new $P113, "Undef"
  vivify_480:
    find_lex $P114, "@params"
    $P115 = $P113."multi"($P114)
.annotate 'line', 501
    .return ($P115)
.end


.namespace ["NQP";"Actions"]
.sub "_block1561"  :anon :subid("86_1309998850.8808") :outer("85_1309998850.8808")
    .param pmc param_1563
.annotate 'line', 503
    .lex "$_", param_1563
.annotate 'line', 505
    find_lex $P121, "$_"
    $P122 = $P121."slurpy"()
    unless $P122, unless_1566
    set $P120, $P122
    goto unless_1566_end
  unless_1566:
    find_lex $P123, "$_"
    $P124 = $P123."named"()
    set $P120, $P124
  unless_1566_end:
    unless $P120, unless_1565
    set $P119, $P120
    goto unless_1565_end
  unless_1565:
    find_lex $P125, "$_"
    $P127 = $P125."viviself"()
    set $P119, $P127
  unless_1565_end:
    unless $P119, unless_1564
    set $P118, $P119
    goto unless_1564_end
  unless_1564:
.annotate 'line', 504
    find_lex $P128, "@params"
    find_lex $P129, "$_"
    $P130 = $P129."multitype"()
    set $P1567, $P130
    defined $I1569, $P1567
    if $I1569, default_1568
    new $P131, "String"
    assign $P131, "_"
    set $P1567, $P131
  default_1568:
    $P132 = $P128."push"($P1567)
    set $P118, $P132
  unless_1564_end:
.annotate 'line', 503
    .return ($P118)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "parameter"  :subid("87_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1575
.annotate 'line', 511
    .const 'Sub' $P1606 = "88_1309998850.8808"
    capture_lex $P1606
    new $P1574, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1574, control_1573
    push_eh $P1574
    .lex "self", self
    .lex "$/", param_1575
.annotate 'line', 512
    new $P110, "Undef"
    set $P1576, $P110
    .lex "$quant", $P1576
.annotate 'line', 513
    new $P111, "Undef"
    set $P1577, $P111
    .lex "$past", $P1577
.annotate 'line', 512
    find_lex $P1578, "$/"
    unless_null $P1578, vivify_481
    $P1578 = root_new ['parrot';'Hash']
  vivify_481:
    set $P112, $P1578["quant"]
    unless_null $P112, vivify_482
    new $P112, "Undef"
  vivify_482:
    store_lex "$quant", $P112
.annotate 'line', 511
    find_lex $P112, "$past"
.annotate 'line', 514
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_483
    $P1580 = root_new ['parrot';'Hash']
  vivify_483:
    set $P112, $P1580["named_param"]
    unless_null $P112, vivify_484
    new $P112, "Undef"
  vivify_484:
    if $P112, if_1579
.annotate 'line', 521
    find_lex $P1586, "$/"
    unless_null $P1586, vivify_485
    $P1586 = root_new ['parrot';'Hash']
  vivify_485:
    set $P113, $P1586["param_var"]
    unless_null $P113, vivify_486
    new $P113, "Undef"
  vivify_486:
    $P114 = $P113."ast"()
    store_lex "$past", $P114
.annotate 'line', 522
    find_lex $P113, "$quant"
    set $S100, $P113
    iseq $I100, $S100, "*"
    if $I100, if_1587
.annotate 'line', 526
    find_lex $P114, "$quant"
    set $S101, $P114
    iseq $I101, $S101, "?"
    unless $I101, if_1590_end
.annotate 'line', 527
    find_lex $P115, "$past"
    find_lex $P1591, "$/"
    unless_null $P1591, vivify_487
    $P1591 = root_new ['parrot';'Hash']
  vivify_487:
    set $P1592, $P1591["param_var"]
    unless_null $P1592, vivify_488
    $P1592 = root_new ['parrot';'Hash']
  vivify_488:
    set $P117, $P1592["sigil"]
    unless_null $P117, vivify_489
    new $P117, "Undef"
  vivify_489:
    $P118 = "vivitype"($P117)
    $P115."viviself"($P118)
  if_1590_end:
.annotate 'line', 526
    goto if_1587_end
  if_1587:
.annotate 'line', 523
    find_lex $P114, "$past"
    $P114."slurpy"(1)
.annotate 'line', 524
    find_lex $P114, "$past"
    find_lex $P1588, "$/"
    unless_null $P1588, vivify_490
    $P1588 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1589, $P1588["param_var"]
    unless_null $P1589, vivify_491
    $P1589 = root_new ['parrot';'Hash']
  vivify_491:
    set $P115, $P1589["sigil"]
    unless_null $P115, vivify_492
    new $P115, "Undef"
  vivify_492:
    set $S101, $P115
    iseq $I101, $S101, "%"
    $P114."named"($I101)
  if_1587_end:
.annotate 'line', 520
    goto if_1579_end
  if_1579:
.annotate 'line', 515
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_493
    $P1581 = root_new ['parrot';'Hash']
  vivify_493:
    set $P113, $P1581["named_param"]
    unless_null $P113, vivify_494
    new $P113, "Undef"
  vivify_494:
    $P114 = $P113."ast"()
    store_lex "$past", $P114
.annotate 'line', 516
    find_lex $P113, "$quant"
    set $S100, $P113
    isne $I100, $S100, "!"
    unless $I100, if_1582_end
.annotate 'line', 517
    find_lex $P114, "$past"
    find_lex $P1583, "$/"
    unless_null $P1583, vivify_495
    $P1583 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1584, $P1583["named_param"]
    unless_null $P1584, vivify_496
    $P1584 = root_new ['parrot';'Hash']
  vivify_496:
    set $P1585, $P1584["param_var"]
    unless_null $P1585, vivify_497
    $P1585 = root_new ['parrot';'Hash']
  vivify_497:
    set $P115, $P1585["sigil"]
    unless_null $P115, vivify_498
    new $P115, "Undef"
  vivify_498:
    $P117 = "vivitype"($P115)
    $P114."viviself"($P117)
  if_1582_end:
  if_1579_end:
.annotate 'line', 530
    find_lex $P1594, "$/"
    unless_null $P1594, vivify_499
    $P1594 = root_new ['parrot';'Hash']
  vivify_499:
    set $P112, $P1594["default_value"]
    unless_null $P112, vivify_500
    new $P112, "Undef"
  vivify_500:
    unless $P112, if_1593_end
.annotate 'line', 531
    find_lex $P113, "$quant"
    set $S100, $P113
    iseq $I100, $S100, "*"
    unless $I100, if_1595_end
.annotate 'line', 532
    find_lex $P114, "$/"
    $P115 = $P114."CURSOR"()
    $P115."panic"("Can't put default on slurpy parameter")
  if_1595_end:
.annotate 'line', 534
    find_lex $P113, "$quant"
    set $S100, $P113
    iseq $I100, $S100, "!"
    unless $I100, if_1596_end
.annotate 'line', 535
    find_lex $P114, "$/"
    $P115 = $P114."CURSOR"()
    $P115."panic"("Can't put default on required parameter")
  if_1596_end:
.annotate 'line', 537
    find_lex $P113, "$past"
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_501
    $P1597 = root_new ['parrot';'Hash']
  vivify_501:
    set $P1598, $P1597["default_value"]
    unless_null $P1598, vivify_502
    $P1598 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1599, $P1598[0]
    unless_null $P1599, vivify_503
    $P1599 = root_new ['parrot';'Hash']
  vivify_503:
    set $P114, $P1599["EXPR"]
    unless_null $P114, vivify_504
    new $P114, "Undef"
  vivify_504:
    $P115 = $P114."ast"()
    $P113."viviself"($P115)
  if_1593_end:
.annotate 'line', 539
    find_lex $P112, "$past"
    $P113 = $P112."viviself"()
    if $P113, unless_1600_end
    get_global $P1601, "@BLOCK"
    unless_null $P1601, vivify_505
    $P1601 = root_new ['parrot';'ResizablePMCArray']
  vivify_505:
    set $P114, $P1601[0]
    unless_null $P114, vivify_506
    new $P114, "Undef"
  vivify_506:
    get_global $P1602, "@BLOCK"
    unless_null $P1602, vivify_507
    $P1602 = root_new ['parrot';'ResizablePMCArray']
  vivify_507:
    set $P115, $P1602[0]
    unless_null $P115, vivify_508
    new $P115, "Undef"
  vivify_508:
    $P117 = $P115."arity"()
    set $N100, $P117
    new $P118, 'Float'
    set $P118, $N100
    add $P119, $P118, 1
    $P114."arity"($P119)
  unless_1600_end:
.annotate 'line', 542
    find_lex $P1604, "$/"
    unless_null $P1604, vivify_509
    $P1604 = root_new ['parrot';'Hash']
  vivify_509:
    set $P112, $P1604["typename"]
    unless_null $P112, vivify_510
    new $P112, "Undef"
  vivify_510:
    unless $P112, if_1603_end
    .const 'Sub' $P1606 = "88_1309998850.8808"
    capture_lex $P1606
    $P1606()
  if_1603_end:
.annotate 'line', 548
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 511
    .return ($P114)
  control_1573:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1605"  :anon :subid("88_1309998850.8808") :outer("87_1309998850.8808")
.annotate 'line', 542
    .const 'Sub' $P1614 = "89_1309998850.8808"
    capture_lex $P1614
.annotate 'line', 543
    $P1608 = root_new ['parrot';'ResizablePMCArray']
    set $P1607, $P1608
    .lex "@multitype", $P1607
.annotate 'line', 542
    find_lex $P113, "@multitype"
.annotate 'line', 544
    find_lex $P1609, "$/"
    unless_null $P1609, vivify_511
    $P1609 = root_new ['parrot';'Hash']
  vivify_511:
    set $P1610, $P1609["typename"]
    unless_null $P1610, vivify_512
    $P1610 = root_new ['parrot';'ResizablePMCArray']
  vivify_512:
    set $P1611, $P1610[0]
    unless_null $P1611, vivify_513
    $P1611 = root_new ['parrot';'Hash']
  vivify_513:
    set $P1612, $P1611["name"]
    unless_null $P1612, vivify_514
    $P1612 = root_new ['parrot';'Hash']
  vivify_514:
    set $P114, $P1612["identifier"]
    unless_null $P114, vivify_515
    new $P114, "Undef"
  vivify_515:
    defined $I100, $P114
    unless $I100, for_undef_516
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1616_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1616_test:
    unless $P113, loop1616_done
    shift $P115, $P113
  loop1616_redo:
    .const 'Sub' $P1614 = "89_1309998850.8808"
    capture_lex $P1614
    $P1614($P115)
  loop1616_next:
    goto loop1616_test
  loop1616_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1616_next
    eq $P118, .CONTROL_LOOP_REDO, loop1616_redo
  loop1616_done:
    pop_eh
  for_undef_516:
.annotate 'line', 545
    find_lex $P113, "$past"
    find_lex $P114, "@multitype"
    $P115 = $P113."multitype"($P114)
.annotate 'line', 542
    .return ($P115)
.end


.namespace ["NQP";"Actions"]
.sub "_block1613"  :anon :subid("89_1309998850.8808") :outer("88_1309998850.8808")
    .param pmc param_1615
.annotate 'line', 544
    .lex "$_", param_1615
    find_lex $P117, "@multitype"
    find_lex $P118, "$_"
    set $S100, $P118
    $P119 = $P117."push"($S100)
    .return ($P119)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "param_var"  :subid("90_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1620
.annotate 'line', 551
    new $P1619, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1619, control_1618
    push_eh $P1619
    .lex "self", self
    .lex "$/", param_1620
.annotate 'line', 552
    new $P110, "Undef"
    set $P1621, $P110
    .lex "$name", $P1621
.annotate 'line', 553
    new $P111, "Undef"
    set $P1622, $P111
    .lex "$past", $P1622
.annotate 'line', 552
    find_lex $P112, "$/"
    set $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$name", $P113
.annotate 'line', 553
    get_hll_global $P112, ["PAST"], "Var"
    find_lex $P113, "$name"
    find_lex $P114, "$/"
    $P115 = $P112."new"($P113 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P114 :named("node"))
    store_lex "$past", $P115
.annotate 'line', 555
    get_global $P1623, "@BLOCK"
    unless_null $P1623, vivify_517
    $P1623 = root_new ['parrot';'ResizablePMCArray']
  vivify_517:
    set $P112, $P1623[0]
    unless_null $P112, vivify_518
    new $P112, "Undef"
  vivify_518:
    find_lex $P113, "$name"
    $P112."symbol"($P113, "lexical" :named("scope"))
.annotate 'line', 556
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 551
    .return ($P114)
  control_1618:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "named_param"  :subid("91_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1627
.annotate 'line', 559
    new $P1626, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1626, control_1625
    push_eh $P1626
    .lex "self", self
    .lex "$/", param_1627
.annotate 'line', 560
    new $P110, "Undef"
    set $P1628, $P110
    .lex "$past", $P1628
    find_lex $P1629, "$/"
    unless_null $P1629, vivify_519
    $P1629 = root_new ['parrot';'Hash']
  vivify_519:
    set $P111, $P1629["param_var"]
    unless_null $P111, vivify_520
    new $P111, "Undef"
  vivify_520:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 561
    find_lex $P111, "$past"
    find_lex $P1630, "$/"
    unless_null $P1630, vivify_521
    $P1630 = root_new ['parrot';'Hash']
  vivify_521:
    set $P1631, $P1630["param_var"]
    unless_null $P1631, vivify_522
    $P1631 = root_new ['parrot';'Hash']
  vivify_522:
    set $P112, $P1631["name"]
    unless_null $P112, vivify_523
    new $P112, "Undef"
  vivify_523:
    set $S100, $P112
    $P111."named"($S100)
.annotate 'line', 562
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 559
    .return ($P113)
  control_1625:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait"  :subid("92_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1635
.annotate 'line', 565
    new $P1634, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1634, control_1633
    push_eh $P1634
    .lex "self", self
    .lex "$/", param_1635
.annotate 'line', 566
    find_lex $P110, "$/"
    find_lex $P1636, "$/"
    unless_null $P1636, vivify_524
    $P1636 = root_new ['parrot';'Hash']
  vivify_524:
    set $P111, $P1636["trait_mod"]
    unless_null $P111, vivify_525
    new $P111, "Undef"
  vivify_525:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
.annotate 'line', 565
    .return ($P113)
  control_1633:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "trait_mod:sym<is>"  :subid("93_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1640
.annotate 'line', 569
    .const 'Sub' $P1648 = "94_1309998850.8808"
    capture_lex $P1648
    new $P1639, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1639, control_1638
    push_eh $P1639
    .lex "self", self
    .lex "$/", param_1640
.annotate 'line', 570
    new $P110, "Undef"
    set $P1641, $P110
    .lex "$cpast", $P1641
    find_lex $P1642, "$/"
    unless_null $P1642, vivify_526
    $P1642 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1643, $P1642["circumfix"]
    unless_null $P1643, vivify_527
    $P1643 = root_new ['parrot';'ResizablePMCArray']
  vivify_527:
    set $P111, $P1643[0]
    unless_null $P111, vivify_528
    new $P111, "Undef"
  vivify_528:
    $P112 = $P111."ast"()
    store_lex "$cpast", $P112
.annotate 'line', 571
    find_lex $P1645, "$/"
    unless_null $P1645, vivify_529
    $P1645 = root_new ['parrot';'Hash']
  vivify_529:
    set $P112, $P1645["longname"]
    unless_null $P112, vivify_530
    new $P112, "Undef"
  vivify_530:
    set $S100, $P112
    iseq $I100, $S100, "pirflags"
    if $I100, if_1644
.annotate 'line', 577
    find_lex $P113, "$/"
    $P115 = $P113."CURSOR"()
    new $P117, 'String'
    set $P117, "Trait '"
    find_lex $P1651, "$/"
    unless_null $P1651, vivify_531
    $P1651 = root_new ['parrot';'Hash']
  vivify_531:
    set $P118, $P1651["longname"]
    unless_null $P118, vivify_532
    new $P118, "Undef"
  vivify_532:
    concat $P119, $P117, $P118
    concat $P120, $P119, "' not implemented"
    $P121 = $P115."panic"($P120)
.annotate 'line', 576
    set $P111, $P121
.annotate 'line', 571
    goto if_1644_end
  if_1644:
.annotate 'line', 573
    get_hll_global $P113, ["PAST"], "Val"
    find_lex $P114, "$cpast"
    $P115 = $P113."ACCEPTS"($P114)
    if $P115, unless_1646_end
.annotate 'line', 572
    find_lex $P117, "$/"
    $P118 = $P117."CURSOR"()
    $P118."panic"("Trait 'pirflags' requires constant scalar argument")
  unless_1646_end:
.annotate 'line', 574
    find_lex $P113, "$/"
    .const 'Sub' $P1648 = "94_1309998850.8808"
    newclosure $P1650, $P1648
    $P114 = $P113."!make"($P1650)
.annotate 'line', 571
    set $P111, $P114
  if_1644_end:
.annotate 'line', 569
    .return ($P111)
  control_1638:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block1647"  :anon :subid("94_1309998850.8808") :outer("93_1309998850.8808")
    .param pmc param_1649
.annotate 'line', 574
    .lex "$match", param_1649
    find_lex $P114, "$match"
    $P115 = $P114."ast"()
    set $P117, $P115["block_past"]
    unless_null $P117, vivify_533
    new $P117, "Undef"
  vivify_533:
    find_lex $P118, "$cpast"
    $P119 = $P118."value"()
    $P120 = $P117."pirflags"($P119)
    .return ($P120)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "regex_declarator"  :subid("95_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1655
    .param pmc param_1656 :optional
    .param int has_param_1656 :opt_flag
.annotate 'line', 581
    .const 'Sub' $P1680 = "97_1309998850.8808"
    capture_lex $P1680
    .const 'Sub' $P1667 = "96_1309998850.8808"
    capture_lex $P1667
    new $P1654, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1654, control_1653
    push_eh $P1654
    .lex "self", self
    .lex "$/", param_1655
    if has_param_1656, optparam_534
    new $P110, "Undef"
    set param_1656, $P110
  optparam_534:
    .lex "$key", param_1656
.annotate 'line', 582
    $P1658 = root_new ['parrot';'ResizablePMCArray']
    set $P1657, $P1658
    .lex "@MODIFIERS", $P1657
.annotate 'line', 585
    new $P111, "Undef"
    set $P1659, $P111
    .lex "$name", $P1659
.annotate 'line', 586
    new $P112, "Undef"
    set $P1660, $P112
    .lex "$past", $P1660
.annotate 'line', 582

        $P1661 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'

    store_lex "@MODIFIERS", $P1661
.annotate 'line', 585
    find_lex $P1662, "$/"
    unless_null $P1662, vivify_535
    $P1662 = root_new ['parrot';'Hash']
  vivify_535:
    set $P113, $P1662["deflongname"]
    unless_null $P113, vivify_536
    new $P113, "Undef"
  vivify_536:
    $P114 = $P113."ast"()
    set $S100, $P114
    new $P115, 'String'
    set $P115, $S100
    store_lex "$name", $P115
.annotate 'line', 581
    find_lex $P113, "$past"
.annotate 'line', 587
    find_lex $P1664, "$/"
    unless_null $P1664, vivify_537
    $P1664 = root_new ['parrot';'Hash']
  vivify_537:
    set $P113, $P1664["proto"]
    unless_null $P113, vivify_538
    new $P113, "Undef"
  vivify_538:
    if $P113, if_1663
.annotate 'line', 614
    find_lex $P114, "$key"
    set $S100, $P114
    iseq $I100, $S100, "open"
    if $I100, if_1665
.annotate 'line', 627
    .const 'Sub' $P1680 = "97_1309998850.8808"
    capture_lex $P1680
    $P1680()
    goto if_1665_end
  if_1665:
.annotate 'line', 614
    .const 'Sub' $P1667 = "96_1309998850.8808"
    capture_lex $P1667
    $P1667()
  if_1665_end:
    goto if_1663_end
  if_1663:
.annotate 'line', 589
    get_hll_global $P114, ["PAST"], "Stmts"
.annotate 'line', 590
    get_hll_global $P115, ["PAST"], "Block"
    find_lex $P117, "$name"
.annotate 'line', 591
    get_hll_global $P118, ["PAST"], "Op"
.annotate 'line', 592
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P121, "$name"
    $P122 = $P118."new"($P120, $P121, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 591
    find_lex $P123, "$/"
    $P124 = $P115."new"($P122, $P117 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P123 :named("node"))
.annotate 'line', 601
    get_hll_global $P125, ["PAST"], "Block"
    new $P127, "String"
    assign $P127, "!PREFIX__"
    find_lex $P128, "$name"
    concat $P129, $P127, $P128
.annotate 'line', 602
    get_hll_global $P130, ["PAST"], "Op"
.annotate 'line', 603
    get_hll_global $P131, ["PAST"], "Var"
    $P132 = $P131."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P133, "$name"
    $P134 = $P130."new"($P132, $P133, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 602
    find_lex $P135, "$/"
    $P136 = $P125."new"($P134, $P129 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P135 :named("node"))
.annotate 'line', 601
    $P137 = $P114."new"($P124, $P136)
.annotate 'line', 589
    store_lex "$past", $P137
  if_1663_end:
.annotate 'line', 641
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 581
    .return ($P115)
  control_1653:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.sub "_block1679"  :anon :subid("97_1309998850.8808") :outer("95_1309998850.8808")
.annotate 'line', 628
    new $P115, "Undef"
    set $P1681, $P115
    .lex "$regex", $P1681
.annotate 'line', 629
    get_hll_global $P117, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1682, "$/"
    unless_null $P1682, vivify_539
    $P1682 = root_new ['parrot';'Hash']
  vivify_539:
    set $P118, $P1682["p6regex"]
    unless_null $P118, vivify_540
    new $P118, "Undef"
  vivify_540:
    $P119 = $P118."ast"()
    get_global $P120, "@BLOCK"
    $P121 = $P120."shift"()
    $P122 = $P117($P119, $P121)
    store_lex "$regex", $P122
.annotate 'line', 630
    find_lex $P117, "$regex"
    find_lex $P118, "$name"
    $P117."name"($P118)
.annotate 'line', 632
    get_hll_global $P117, ["PAST"], "Op"
.annotate 'line', 634
    get_hll_global $P118, ["PAST"], "Var"
    new $P119, "ResizablePMCArray"
    push $P119, "Regex"
    $P120 = $P118."new"("Method" :named("name"), $P119 :named("namespace"), "package" :named("scope"))
    find_lex $P121, "$regex"
    $P122 = $P117."new"($P120, $P121, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 632
    store_lex "$past", $P122
.annotate 'line', 638
    find_lex $P117, "$regex"
    find_lex $P1683, "$past"
    unless_null $P1683, vivify_541
    $P1683 = root_new ['parrot';'Hash']
    store_lex "$past", $P1683
  vivify_541:
    set $P1683["sink"], $P117
.annotate 'line', 639
    find_lex $P117, "@MODIFIERS"
    $P118 = $P117."shift"()
.annotate 'line', 627
    .return ($P118)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1666"  :anon :subid("96_1309998850.8808") :outer("95_1309998850.8808")
.annotate 'line', 615
    $P1669 = root_new ['parrot';'Hash']
    set $P1668, $P1669
    .lex "%h", $P1668
.annotate 'line', 614
    find_lex $P115, "%h"
.annotate 'line', 616
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_542
    $P1671 = root_new ['parrot';'Hash']
  vivify_542:
    set $P115, $P1671["sym"]
    unless_null $P115, vivify_543
    new $P115, "Undef"
  vivify_543:
    set $S101, $P115
    iseq $I101, $S101, "token"
    unless $I101, if_1670_end
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1672, "%h"
    unless_null $P1672, vivify_544
    $P1672 = root_new ['parrot';'Hash']
    store_lex "%h", $P1672
  vivify_544:
    set $P1672["r"], $P117
  if_1670_end:
.annotate 'line', 617
    find_lex $P1674, "$/"
    unless_null $P1674, vivify_545
    $P1674 = root_new ['parrot';'Hash']
  vivify_545:
    set $P115, $P1674["sym"]
    unless_null $P115, vivify_546
    new $P115, "Undef"
  vivify_546:
    set $S101, $P115
    iseq $I101, $S101, "rule"
    unless $I101, if_1673_end
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1675, "%h"
    unless_null $P1675, vivify_547
    $P1675 = root_new ['parrot';'Hash']
    store_lex "%h", $P1675
  vivify_547:
    set $P1675["r"], $P117
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1676, "%h"
    unless_null $P1676, vivify_548
    $P1676 = root_new ['parrot';'Hash']
    store_lex "%h", $P1676
  vivify_548:
    set $P1676["s"], $P117
  if_1673_end:
.annotate 'line', 618
    find_lex $P115, "@MODIFIERS"
    find_lex $P117, "%h"
    $P115."unshift"($P117)
.annotate 'line', 619

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0

.annotate 'line', 623
    get_global $P1677, "@BLOCK"
    unless_null $P1677, vivify_549
    $P1677 = root_new ['parrot';'ResizablePMCArray']
  vivify_549:
    set $P115, $P1677[0]
    unless_null $P115, vivify_550
    new $P115, "Undef"
  vivify_550:
    $P115."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 624
    get_global $P1678, "@BLOCK"
    unless_null $P1678, vivify_551
    $P1678 = root_new ['parrot';'ResizablePMCArray']
  vivify_551:
    set $P115, $P1678[0]
    unless_null $P115, vivify_552
    new $P115, "Undef"
  vivify_552:
    $P115."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 625
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    new $P117, "Integer"
    assign $P117, 0
    setattribute $P115, 'payload', $P117
    throw $P115
.annotate 'line', 614
    .return ()
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "dotty"  :subid("98_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1687
.annotate 'line', 645
    new $P1686, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1686, control_1685
    push_eh $P1686
    .lex "self", self
    .lex "$/", param_1687
.annotate 'line', 646
    new $P110, "Undef"
    set $P1688, $P110
    .lex "$past", $P1688
    find_lex $P1690, "$/"
    unless_null $P1690, vivify_553
    $P1690 = root_new ['parrot';'Hash']
  vivify_553:
    set $P112, $P1690["args"]
    unless_null $P112, vivify_554
    new $P112, "Undef"
  vivify_554:
    if $P112, if_1689
    get_hll_global $P115, ["PAST"], "Op"
    find_lex $P117, "$/"
    $P118 = $P115."new"($P117 :named("node"))
    set $P111, $P118
    goto if_1689_end
  if_1689:
    find_lex $P1691, "$/"
    unless_null $P1691, vivify_555
    $P1691 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1692, $P1691["args"]
    unless_null $P1692, vivify_556
    $P1692 = root_new ['parrot';'ResizablePMCArray']
  vivify_556:
    set $P113, $P1692[0]
    unless_null $P113, vivify_557
    new $P113, "Undef"
  vivify_557:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1689_end:
    store_lex "$past", $P111
.annotate 'line', 647
    find_lex $P111, "$past"
    find_lex $P1694, "$/"
    unless_null $P1694, vivify_558
    $P1694 = root_new ['parrot';'Hash']
  vivify_558:
    set $P113, $P1694["quote"]
    unless_null $P113, vivify_559
    new $P113, "Undef"
  vivify_559:
    if $P113, if_1693
    find_lex $P1696, "$/"
    unless_null $P1696, vivify_560
    $P1696 = root_new ['parrot';'Hash']
  vivify_560:
    set $P117, $P1696["longname"]
    unless_null $P117, vivify_561
    new $P117, "Undef"
  vivify_561:
    set $S100, $P117
    new $P112, 'String'
    set $P112, $S100
    goto if_1693_end
  if_1693:
    find_lex $P1695, "$/"
    unless_null $P1695, vivify_562
    $P1695 = root_new ['parrot';'Hash']
  vivify_562:
    set $P114, $P1695["quote"]
    unless_null $P114, vivify_563
    new $P114, "Undef"
  vivify_563:
    $P115 = $P114."ast"()
    set $P112, $P115
  if_1693_end:
    $P111."name"($P112)
.annotate 'line', 648
    find_lex $P111, "$past"
    $P111."pasttype"("callmethod")
.annotate 'line', 649
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 645
    .return ($P113)
  control_1685:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<self>"  :subid("99_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1700
.annotate 'line', 654
    new $P1699, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1699, control_1698
    push_eh $P1699
    .lex "self", self
    .lex "$/", param_1700
.annotate 'line', 655
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Var"
    $P112 = $P111."new"("self" :named("name"))
    $P113 = $P110."!make"($P112)
.annotate 'line', 654
    .return ($P113)
  control_1698:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<identifier>"  :subid("100_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1704
.annotate 'line', 658
    new $P1703, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1703, control_1702
    push_eh $P1703
    .lex "self", self
    .lex "$/", param_1704
.annotate 'line', 659
    new $P110, "Undef"
    set $P1705, $P110
    .lex "$past", $P1705
    find_lex $P1706, "$/"
    unless_null $P1706, vivify_564
    $P1706 = root_new ['parrot';'Hash']
  vivify_564:
    set $P111, $P1706["args"]
    unless_null $P111, vivify_565
    new $P111, "Undef"
  vivify_565:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 660
    find_lex $P111, "$past"
    find_lex $P1707, "$/"
    unless_null $P1707, vivify_566
    $P1707 = root_new ['parrot';'Hash']
  vivify_566:
    set $P112, $P1707["deflongname"]
    unless_null $P112, vivify_567
    new $P112, "Undef"
  vivify_567:
    set $S100, $P112
    $P111."name"($S100)
.annotate 'line', 661
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 658
    .return ($P113)
  control_1702:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<name>"  :subid("101_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1711
.annotate 'line', 664
    new $P1710, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1710, control_1709
    push_eh $P1710
    .lex "self", self
    .lex "$/", param_1711
.annotate 'line', 665
    $P1713 = root_new ['parrot';'ResizablePMCArray']
    set $P1712, $P1713
    .lex "@ns", $P1712
.annotate 'line', 666
    new $P110, "Undef"
    set $P1714, $P110
    .lex "$name", $P1714
.annotate 'line', 668
    new $P111, "Undef"
    set $P1715, $P111
    .lex "$var", $P1715
.annotate 'line', 670
    new $P112, "Undef"
    set $P1716, $P112
    .lex "$past", $P1716
.annotate 'line', 665
    find_lex $P1717, "$/"
    unless_null $P1717, vivify_568
    $P1717 = root_new ['parrot';'Hash']
  vivify_568:
    set $P1718, $P1717["name"]
    unless_null $P1718, vivify_569
    $P1718 = root_new ['parrot';'Hash']
  vivify_569:
    set $P113, $P1718["identifier"]
    unless_null $P113, vivify_570
    new $P113, "Undef"
  vivify_570:
    clone $P114, $P113
    store_lex "@ns", $P114
.annotate 'line', 666
    find_lex $P113, "@ns"
    $P114 = $P113."pop"()
    store_lex "$name", $P114
.annotate 'line', 667
    find_lex $P114, "@ns"
    if $P114, if_1720
    set $P113, $P114
    goto if_1720_end
  if_1720:
    find_lex $P1721, "@ns"
    unless_null $P1721, vivify_571
    $P1721 = root_new ['parrot';'ResizablePMCArray']
  vivify_571:
    set $P115, $P1721[0]
    unless_null $P115, vivify_572
    new $P115, "Undef"
  vivify_572:
    set $S100, $P115
    iseq $I100, $S100, "GLOBAL"
    new $P113, 'Integer'
    set $P113, $I100
  if_1720_end:
    unless $P113, if_1719_end
    find_lex $P117, "@ns"
    $P117."shift"()
  if_1719_end:
.annotate 'line', 669
    get_hll_global $P113, ["PAST"], "Var"
    find_lex $P114, "$name"
    set $S100, $P114
    find_lex $P115, "@ns"
    $P117 = $P113."new"($S100 :named("name"), $P115 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P117
.annotate 'line', 670
    find_lex $P113, "$var"
    store_lex "$past", $P113
.annotate 'line', 671
    find_lex $P1723, "$/"
    unless_null $P1723, vivify_573
    $P1723 = root_new ['parrot';'Hash']
  vivify_573:
    set $P113, $P1723["args"]
    unless_null $P113, vivify_574
    new $P113, "Undef"
  vivify_574:
    unless $P113, if_1722_end
.annotate 'line', 672
    find_lex $P1724, "$/"
    unless_null $P1724, vivify_575
    $P1724 = root_new ['parrot';'Hash']
  vivify_575:
    set $P1725, $P1724["args"]
    unless_null $P1725, vivify_576
    $P1725 = root_new ['parrot';'ResizablePMCArray']
  vivify_576:
    set $P114, $P1725[0]
    unless_null $P114, vivify_577
    new $P114, "Undef"
  vivify_577:
    $P115 = $P114."ast"()
    store_lex "$past", $P115
.annotate 'line', 673
    find_lex $P114, "$past"
    find_lex $P115, "$var"
    $P114."unshift"($P115)
  if_1722_end:
.annotate 'line', 675
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 664
    .return ($P115)
  control_1709:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<pir::op>"  :subid("102_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1729
.annotate 'line', 678
    new $P1728, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1728, control_1727
    push_eh $P1728
    .lex "self", self
    .lex "$/", param_1729
.annotate 'line', 679
    new $P110, "Undef"
    set $P1730, $P110
    .lex "$past", $P1730
.annotate 'line', 680
    new $P111, "Undef"
    set $P1731, $P111
    .lex "$pirop", $P1731
.annotate 'line', 679
    find_lex $P1733, "$/"
    unless_null $P1733, vivify_578
    $P1733 = root_new ['parrot';'Hash']
  vivify_578:
    set $P113, $P1733["args"]
    unless_null $P113, vivify_579
    new $P113, "Undef"
  vivify_579:
    if $P113, if_1732
    get_hll_global $P117, ["PAST"], "Op"
    find_lex $P118, "$/"
    $P119 = $P117."new"($P118 :named("node"))
    set $P112, $P119
    goto if_1732_end
  if_1732:
    find_lex $P1734, "$/"
    unless_null $P1734, vivify_580
    $P1734 = root_new ['parrot';'Hash']
  vivify_580:
    set $P1735, $P1734["args"]
    unless_null $P1735, vivify_581
    $P1735 = root_new ['parrot';'ResizablePMCArray']
  vivify_581:
    set $P114, $P1735[0]
    unless_null $P114, vivify_582
    new $P114, "Undef"
  vivify_582:
    $P115 = $P114."ast"()
    set $P112, $P115
  if_1732_end:
    store_lex "$past", $P112
.annotate 'line', 680
    find_lex $P1736, "$/"
    unless_null $P1736, vivify_583
    $P1736 = root_new ['parrot';'Hash']
  vivify_583:
    set $P112, $P1736["op"]
    unless_null $P112, vivify_584
    new $P112, "Undef"
  vivify_584:
    set $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$pirop", $P113
.annotate 'line', 681

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1737 = box $S0

    store_lex "$pirop", $P1737
.annotate 'line', 688
    find_lex $P112, "$past"
    find_lex $P113, "$pirop"
    $P112."pirop"($P113)
.annotate 'line', 689
    find_lex $P112, "$past"
    $P112."pasttype"("pirop")
.annotate 'line', 690
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 678
    .return ($P114)
  control_1727:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "args"  :subid("103_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1741
.annotate 'line', 693
    new $P1740, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1740, control_1739
    push_eh $P1740
    .lex "self", self
    .lex "$/", param_1741
    find_lex $P110, "$/"
    find_lex $P1742, "$/"
    unless_null $P1742, vivify_585
    $P1742 = root_new ['parrot';'Hash']
  vivify_585:
    set $P111, $P1742["arglist"]
    unless_null $P111, vivify_586
    new $P111, "Undef"
  vivify_586:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1739:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("104_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1746
.annotate 'line', 695
    .const 'Sub' $P1753 = "105_1309998850.8808"
    capture_lex $P1753
    new $P1745, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1745, control_1744
    push_eh $P1745
    .lex "self", self
    .lex "$/", param_1746
.annotate 'line', 696
    new $P110, "Undef"
    set $P1747, $P110
    .lex "$past", $P1747
.annotate 'line', 704
    new $P111, "Undef"
    set $P1748, $P111
    .lex "$i", $P1748
.annotate 'line', 705
    new $P112, "Undef"
    set $P1749, $P112
    .lex "$n", $P1749
.annotate 'line', 696
    get_hll_global $P113, ["PAST"], "Op"
    find_lex $P114, "$/"
    $P115 = $P113."new"("call" :named("pasttype"), $P114 :named("node"))
    store_lex "$past", $P115
.annotate 'line', 697
    find_lex $P1751, "$/"
    unless_null $P1751, vivify_587
    $P1751 = root_new ['parrot';'Hash']
  vivify_587:
    set $P113, $P1751["EXPR"]
    unless_null $P113, vivify_588
    new $P113, "Undef"
  vivify_588:
    unless $P113, if_1750_end
    .const 'Sub' $P1753 = "105_1309998850.8808"
    capture_lex $P1753
    $P1753()
  if_1750_end:
.annotate 'line', 704
    new $P113, "Integer"
    assign $P113, 0
    store_lex "$i", $P113
.annotate 'line', 705
    find_lex $P113, "$past"
    $P114 = $P113."list"()
    set $N100, $P114
    new $P115, 'Float'
    set $P115, $N100
    store_lex "$n", $P115
.annotate 'line', 706
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1774_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1774_test:
    find_lex $P113, "$i"
    set $N100, $P113
    find_lex $P114, "$n"
    set $N101, $P114
    islt $I100, $N100, $N101
    unless $I100, loop1774_done
  loop1774_redo:
.annotate 'line', 707
    find_lex $P115, "$i"
    set $I101, $P115
    find_lex $P1763, "$past"
    unless_null $P1763, vivify_592
    $P1763 = root_new ['parrot';'ResizablePMCArray']
  vivify_592:
    set $P117, $P1763[$I101]
    unless_null $P117, vivify_593
    new $P117, "Undef"
  vivify_593:
    $S100 = $P117."name"()
    iseq $I102, $S100, "&prefix:<|>"
    unless $I102, if_1762_end
.annotate 'line', 708
    find_lex $P118, "$i"
    set $I103, $P118
    find_lex $P1764, "$past"
    unless_null $P1764, vivify_594
    $P1764 = root_new ['parrot';'ResizablePMCArray']
  vivify_594:
    set $P1765, $P1764[$I103]
    unless_null $P1765, vivify_595
    $P1765 = root_new ['parrot';'ResizablePMCArray']
  vivify_595:
    set $P119, $P1765[0]
    unless_null $P119, vivify_596
    new $P119, "Undef"
  vivify_596:
    find_lex $P120, "$i"
    set $I104, $P120
    find_lex $P1766, "$past"
    unless_null $P1766, vivify_597
    $P1766 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1766
  vivify_597:
    set $P1766[$I104], $P119
.annotate 'line', 709
    find_lex $P118, "$i"
    set $I103, $P118
    find_lex $P1767, "$past"
    unless_null $P1767, vivify_598
    $P1767 = root_new ['parrot';'ResizablePMCArray']
  vivify_598:
    set $P119, $P1767[$I103]
    unless_null $P119, vivify_599
    new $P119, "Undef"
  vivify_599:
    $P119."flat"(1)
.annotate 'line', 710
    find_lex $P119, "$i"
    set $I103, $P119
    find_lex $P1770, "$past"
    unless_null $P1770, vivify_600
    $P1770 = root_new ['parrot';'ResizablePMCArray']
  vivify_600:
    set $P120, $P1770[$I103]
    unless_null $P120, vivify_601
    new $P120, "Undef"
  vivify_601:
    get_hll_global $P121, ["PAST"], "Val"
    $P122 = $P120."isa"($P121)
    if $P122, if_1769
    set $P118, $P122
    goto if_1769_end
  if_1769:
.annotate 'line', 711
    find_lex $P123, "$i"
    set $I104, $P123
    find_lex $P1771, "$past"
    unless_null $P1771, vivify_602
    $P1771 = root_new ['parrot';'ResizablePMCArray']
  vivify_602:
    set $P124, $P1771[$I104]
    unless_null $P124, vivify_603
    new $P124, "Undef"
  vivify_603:
    $S101 = $P124."name"()
    substr $S102, $S101, 0, 1
    iseq $I105, $S102, "%"
    new $P118, 'Integer'
    set $P118, $I105
  if_1769_end:
    unless $P118, if_1768_end
.annotate 'line', 712
    find_lex $P125, "$i"
    set $I106, $P125
    find_lex $P1772, "$past"
    unless_null $P1772, vivify_604
    $P1772 = root_new ['parrot';'ResizablePMCArray']
  vivify_604:
    set $P127, $P1772[$I106]
    unless_null $P127, vivify_605
    new $P127, "Undef"
  vivify_605:
    $P127."named"(1)
  if_1768_end:
  if_1762_end:
.annotate 'line', 706
    find_lex $P115, "$i"
    clone $P1773, $P115
    inc $P115
  loop1774_next:
    goto loop1774_test
  loop1774_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1774_next
    eq $P117, .CONTROL_LOOP_REDO, loop1774_redo
  loop1774_done:
    pop_eh
.annotate 'line', 717
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 695
    .return ($P115)
  control_1744:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "_block1752"  :anon :subid("105_1309998850.8808") :outer("104_1309998850.8808")
.annotate 'line', 697
    .const 'Sub' $P1759 = "106_1309998850.8808"
    capture_lex $P1759
.annotate 'line', 698
    new $P114, "Undef"
    set $P1754, $P114
    .lex "$expr", $P1754
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_589
    $P1755 = root_new ['parrot';'Hash']
  vivify_589:
    set $P115, $P1755["EXPR"]
    unless_null $P115, vivify_590
    new $P115, "Undef"
  vivify_590:
    $P117 = $P115."ast"()
    store_lex "$expr", $P117
.annotate 'line', 699
    find_lex $P118, "$expr"
    $S100 = $P118."name"()
    iseq $I100, $S100, "&infix:<,>"
    if $I100, if_1757
    new $P117, 'Integer'
    set $P117, $I100
    goto if_1757_end
  if_1757:
    find_lex $P119, "$expr"
    $P120 = $P119."named"()
    isfalse $I101, $P120
    new $P117, 'Integer'
    set $P117, $I101
  if_1757_end:
    if $P117, if_1756
.annotate 'line', 702
    find_lex $P122, "$past"
    find_lex $P123, "$expr"
    $P124 = $P122."push"($P123)
    set $P115, $P124
.annotate 'line', 699
    goto if_1756_end
  if_1756:
.annotate 'line', 700
    find_lex $P122, "$expr"
    $P123 = $P122."list"()
    defined $I102, $P123
    unless $I102, for_undef_591
    iter $P121, $P123
    new $P125, 'ExceptionHandler'
    set_label $P125, loop1761_handler
    $P125."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P125
  loop1761_test:
    unless $P121, loop1761_done
    shift $P124, $P121
  loop1761_redo:
    .const 'Sub' $P1759 = "106_1309998850.8808"
    capture_lex $P1759
    $P1759($P124)
  loop1761_next:
    goto loop1761_test
  loop1761_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P127, exception, 'type'
    eq $P127, .CONTROL_LOOP_NEXT, loop1761_next
    eq $P127, .CONTROL_LOOP_REDO, loop1761_redo
  loop1761_done:
    pop_eh
  for_undef_591:
.annotate 'line', 699
    set $P115, $P121
  if_1756_end:
.annotate 'line', 697
    .return ($P115)
.end


.namespace ["NQP";"Actions"]
.sub "_block1758"  :anon :subid("106_1309998850.8808") :outer("105_1309998850.8808")
    .param pmc param_1760
.annotate 'line', 700
    .lex "$_", param_1760
    find_lex $P125, "$past"
    find_lex $P127, "$_"
    $P128 = $P125."push"($P127)
    .return ($P128)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<value>"  :subid("107_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1778
.annotate 'line', 721
    new $P1777, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1777, control_1776
    push_eh $P1777
    .lex "self", self
    .lex "$/", param_1778
    find_lex $P110, "$/"
    find_lex $P1779, "$/"
    unless_null $P1779, vivify_606
    $P1779 = root_new ['parrot';'Hash']
  vivify_606:
    set $P111, $P1779["value"]
    unless_null $P111, vivify_607
    new $P111, "Undef"
  vivify_607:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1776:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<( )>"  :subid("108_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1783
.annotate 'line', 723
    new $P1782, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1782, control_1781
    push_eh $P1782
    .lex "self", self
    .lex "$/", param_1783
.annotate 'line', 724
    find_lex $P110, "$/"
.annotate 'line', 725
    find_lex $P1785, "$/"
    unless_null $P1785, vivify_608
    $P1785 = root_new ['parrot';'Hash']
  vivify_608:
    set $P112, $P1785["EXPR"]
    unless_null $P112, vivify_609
    new $P112, "Undef"
  vivify_609:
    if $P112, if_1784
.annotate 'line', 726
    get_hll_global $P115, ["PAST"], "Op"
    find_lex $P117, "$/"
    $P118 = $P115."new"("list" :named("pasttype"), $P117 :named("node"))
    set $P111, $P118
.annotate 'line', 725
    goto if_1784_end
  if_1784:
    find_lex $P1786, "$/"
    unless_null $P1786, vivify_610
    $P1786 = root_new ['parrot';'Hash']
  vivify_610:
    set $P1787, $P1786["EXPR"]
    unless_null $P1787, vivify_611
    $P1787 = root_new ['parrot';'ResizablePMCArray']
  vivify_611:
    set $P113, $P1787[0]
    unless_null $P113, vivify_612
    new $P113, "Undef"
  vivify_612:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1784_end:
    $P119 = $P110."!make"($P111)
.annotate 'line', 723
    .return ($P119)
  control_1781:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<[ ]>"  :subid("109_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1791
.annotate 'line', 729
    new $P1790, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1790, control_1789
    push_eh $P1790
    .lex "self", self
    .lex "$/", param_1791
.annotate 'line', 730
    new $P110, "Undef"
    set $P1792, $P110
    .lex "$past", $P1792
.annotate 'line', 729
    find_lex $P111, "$past"
.annotate 'line', 731
    find_lex $P1794, "$/"
    unless_null $P1794, vivify_613
    $P1794 = root_new ['parrot';'Hash']
  vivify_613:
    set $P111, $P1794["EXPR"]
    unless_null $P111, vivify_614
    new $P111, "Undef"
  vivify_614:
    if $P111, if_1793
.annotate 'line', 738
    get_hll_global $P112, ["PAST"], "Op"
    $P113 = $P112."new"("list" :named("pasttype"))
    store_lex "$past", $P113
.annotate 'line', 737
    goto if_1793_end
  if_1793:
.annotate 'line', 732
    find_lex $P1795, "$/"
    unless_null $P1795, vivify_615
    $P1795 = root_new ['parrot';'Hash']
  vivify_615:
    set $P1796, $P1795["EXPR"]
    unless_null $P1796, vivify_616
    $P1796 = root_new ['parrot';'ResizablePMCArray']
  vivify_616:
    set $P112, $P1796[0]
    unless_null $P112, vivify_617
    new $P112, "Undef"
  vivify_617:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 733
    find_lex $P112, "$past"
    $S100 = $P112."name"()
    isne $I100, $S100, "&infix:<,>"
    unless $I100, if_1797_end
.annotate 'line', 734
    get_hll_global $P113, ["PAST"], "Op"
    find_lex $P114, "$past"
    $P115 = $P113."new"($P114, "list" :named("pasttype"))
    store_lex "$past", $P115
  if_1797_end:
  if_1793_end:
.annotate 'line', 740
    find_lex $P111, "$past"
    $P111."name"("&circumfix:<[ ]>")
.annotate 'line', 741
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 729
    .return ($P113)
  control_1789:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<ang>"  :subid("110_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1801
.annotate 'line', 744
    new $P1800, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1800, control_1799
    push_eh $P1800
    .lex "self", self
    .lex "$/", param_1801
    find_lex $P110, "$/"
    find_lex $P1802, "$/"
    unless_null $P1802, vivify_618
    $P1802 = root_new ['parrot';'Hash']
  vivify_618:
    set $P111, $P1802["quote_EXPR"]
    unless_null $P111, vivify_619
    new $P111, "Undef"
  vivify_619:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1799:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("111_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1806
.annotate 'line', 745
    new $P1805, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1805, control_1804
    push_eh $P1805
    .lex "self", self
    .lex "$/", param_1806
    find_lex $P110, "$/"
    find_lex $P1807, "$/"
    unless_null $P1807, vivify_620
    $P1807 = root_new ['parrot';'Hash']
  vivify_620:
    set $P111, $P1807["quote_EXPR"]
    unless_null $P111, vivify_621
    new $P111, "Undef"
  vivify_621:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1804:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<{ }>"  :subid("112_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1811
.annotate 'line', 747
    new $P1810, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1810, control_1809
    push_eh $P1810
    .lex "self", self
    .lex "$/", param_1811
.annotate 'line', 748
    new $P110, "Undef"
    set $P1812, $P110
    .lex "$past", $P1812
    find_lex $P1814, "$/"
    unless_null $P1814, vivify_622
    $P1814 = root_new ['parrot';'Hash']
  vivify_622:
    set $P1815, $P1814["pblock"]
    unless_null $P1815, vivify_623
    $P1815 = root_new ['parrot';'Hash']
  vivify_623:
    set $P1816, $P1815["blockoid"]
    unless_null $P1816, vivify_624
    $P1816 = root_new ['parrot';'Hash']
  vivify_624:
    set $P1817, $P1816["statementlist"]
    unless_null $P1817, vivify_625
    $P1817 = root_new ['parrot';'Hash']
  vivify_625:
    set $P112, $P1817["statement"]
    unless_null $P112, vivify_626
    new $P112, "Undef"
  vivify_626:
    set $N100, $P112
    isgt $I100, $N100, 0.0
    if $I100, if_1813
.annotate 'line', 750
    $P115 = "vivitype"("%")
    set $P111, $P115
.annotate 'line', 748
    goto if_1813_end
  if_1813:
.annotate 'line', 749
    find_lex $P1818, "$/"
    unless_null $P1818, vivify_627
    $P1818 = root_new ['parrot';'Hash']
  vivify_627:
    set $P113, $P1818["pblock"]
    unless_null $P113, vivify_628
    new $P113, "Undef"
  vivify_628:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1813_end:
    store_lex "$past", $P111
.annotate 'line', 751
    new $P111, "Integer"
    assign $P111, 1
    find_lex $P1819, "$past"
    unless_null $P1819, vivify_629
    $P1819 = root_new ['parrot';'Hash']
    store_lex "$past", $P1819
  vivify_629:
    set $P1819["bareblock"], $P111
.annotate 'line', 752
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 747
    .return ($P113)
  control_1809:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "circumfix:sym<sigil>"  :subid("113_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1823
.annotate 'line', 755
    new $P1822, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1822, control_1821
    push_eh $P1822
    .lex "self", self
    .lex "$/", param_1823
.annotate 'line', 756
    new $P110, "Undef"
    set $P1824, $P110
    .lex "$name", $P1824
    find_lex $P1826, "$/"
    unless_null $P1826, vivify_630
    $P1826 = root_new ['parrot';'Hash']
  vivify_630:
    set $P112, $P1826["sigil"]
    unless_null $P112, vivify_631
    new $P112, "Undef"
  vivify_631:
    set $S100, $P112
    iseq $I100, $S100, "@"
    if $I100, if_1825
.annotate 'line', 757
    find_lex $P1828, "$/"
    unless_null $P1828, vivify_632
    $P1828 = root_new ['parrot';'Hash']
  vivify_632:
    set $P115, $P1828["sigil"]
    unless_null $P115, vivify_633
    new $P115, "Undef"
  vivify_633:
    set $S101, $P115
    iseq $I101, $S101, "%"
    if $I101, if_1827
    new $P118, "String"
    assign $P118, "item"
    set $P114, $P118
    goto if_1827_end
  if_1827:
    new $P117, "String"
    assign $P117, "hash"
    set $P114, $P117
  if_1827_end:
    set $P111, $P114
.annotate 'line', 756
    goto if_1825_end
  if_1825:
    new $P113, "String"
    assign $P113, "list"
    set $P111, $P113
  if_1825_end:
    store_lex "$name", $P111
.annotate 'line', 759
    find_lex $P111, "$/"
    get_hll_global $P112, ["PAST"], "Op"
    find_lex $P113, "$name"
    find_lex $P1829, "$/"
    unless_null $P1829, vivify_634
    $P1829 = root_new ['parrot';'Hash']
  vivify_634:
    set $P114, $P1829["semilist"]
    unless_null $P114, vivify_635
    new $P114, "Undef"
  vivify_635:
    $P115 = $P114."ast"()
    $P117 = $P112."new"($P115, "callmethod" :named("pasttype"), $P113 :named("name"))
    $P118 = $P111."!make"($P117)
.annotate 'line', 755
    .return ($P118)
  control_1821:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "semilist"  :subid("114_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1833
.annotate 'line', 762
    new $P1832, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1832, control_1831
    push_eh $P1832
    .lex "self", self
    .lex "$/", param_1833
    find_lex $P110, "$/"
    find_lex $P1834, "$/"
    unless_null $P1834, vivify_636
    $P1834 = root_new ['parrot';'Hash']
  vivify_636:
    set $P111, $P1834["statement"]
    unless_null $P111, vivify_637
    new $P111, "Undef"
  vivify_637:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1831:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<[ ]>"  :subid("115_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1838
.annotate 'line', 764
    new $P1837, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1837, control_1836
    push_eh $P1837
    .lex "self", self
    .lex "$/", param_1838
.annotate 'line', 765
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Var"
    find_lex $P1839, "$/"
    unless_null $P1839, vivify_638
    $P1839 = root_new ['parrot';'Hash']
  vivify_638:
    set $P112, $P1839["EXPR"]
    unless_null $P112, vivify_639
    new $P112, "Undef"
  vivify_639:
    $P113 = $P112."ast"()
.annotate 'line', 767
    $P114 = "vivitype"("@")
.annotate 'line', 765
    $P115 = $P111."new"($P113, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P114 :named("vivibase"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 764
    .return ($P117)
  control_1836:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<{ }>"  :subid("116_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1843
.annotate 'line', 770
    new $P1842, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1842, control_1841
    push_eh $P1842
    .lex "self", self
    .lex "$/", param_1843
.annotate 'line', 771
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Var"
    find_lex $P1844, "$/"
    unless_null $P1844, vivify_640
    $P1844 = root_new ['parrot';'Hash']
  vivify_640:
    set $P112, $P1844["EXPR"]
    unless_null $P112, vivify_641
    new $P112, "Undef"
  vivify_641:
    $P113 = $P112."ast"()
.annotate 'line', 773
    $P114 = "vivitype"("%")
.annotate 'line', 771
    $P115 = $P111."new"($P113, "keyed" :named("scope"), "Undef" :named("viviself"), $P114 :named("vivibase"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 770
    .return ($P117)
  control_1841:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<ang>"  :subid("117_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1848
.annotate 'line', 776
    new $P1847, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1847, control_1846
    push_eh $P1847
    .lex "self", self
    .lex "$/", param_1848
.annotate 'line', 777
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Var"
    find_lex $P1849, "$/"
    unless_null $P1849, vivify_642
    $P1849 = root_new ['parrot';'Hash']
  vivify_642:
    set $P112, $P1849["quote_EXPR"]
    unless_null $P112, vivify_643
    new $P112, "Undef"
  vivify_643:
    $P113 = $P112."ast"()
.annotate 'line', 779
    $P114 = "vivitype"("%")
.annotate 'line', 777
    $P115 = $P111."new"($P113, "keyed" :named("scope"), "Undef" :named("viviself"), $P114 :named("vivibase"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 776
    .return ($P117)
  control_1846:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postcircumfix:sym<( )>"  :subid("118_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1853
.annotate 'line', 782
    new $P1852, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1852, control_1851
    push_eh $P1852
    .lex "self", self
    .lex "$/", param_1853
.annotate 'line', 783
    find_lex $P110, "$/"
    find_lex $P1854, "$/"
    unless_null $P1854, vivify_644
    $P1854 = root_new ['parrot';'Hash']
  vivify_644:
    set $P111, $P1854["arglist"]
    unless_null $P111, vivify_645
    new $P111, "Undef"
  vivify_645:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
.annotate 'line', 782
    .return ($P113)
  control_1851:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "value"  :subid("119_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1858
.annotate 'line', 786
    new $P1857, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1857, control_1856
    push_eh $P1857
    .lex "self", self
    .lex "$/", param_1858
.annotate 'line', 787
    find_lex $P110, "$/"
    find_lex $P1860, "$/"
    unless_null $P1860, vivify_646
    $P1860 = root_new ['parrot';'Hash']
  vivify_646:
    set $P112, $P1860["quote"]
    unless_null $P112, vivify_647
    new $P112, "Undef"
  vivify_647:
    if $P112, if_1859
    find_lex $P1862, "$/"
    unless_null $P1862, vivify_648
    $P1862 = root_new ['parrot';'Hash']
  vivify_648:
    set $P115, $P1862["number"]
    unless_null $P115, vivify_649
    new $P115, "Undef"
  vivify_649:
    $P117 = $P115."ast"()
    set $P111, $P117
    goto if_1859_end
  if_1859:
    find_lex $P1861, "$/"
    unless_null $P1861, vivify_650
    $P1861 = root_new ['parrot';'Hash']
  vivify_650:
    set $P113, $P1861["quote"]
    unless_null $P113, vivify_651
    new $P113, "Undef"
  vivify_651:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1859_end:
    $P118 = $P110."!make"($P111)
.annotate 'line', 786
    .return ($P118)
  control_1856:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "number"  :subid("120_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1866
.annotate 'line', 790
    new $P1865, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1865, control_1864
    push_eh $P1865
    .lex "self", self
    .lex "$/", param_1866
.annotate 'line', 791
    new $P110, "Undef"
    set $P1867, $P110
    .lex "$value", $P1867
    find_lex $P1869, "$/"
    unless_null $P1869, vivify_652
    $P1869 = root_new ['parrot';'Hash']
  vivify_652:
    set $P112, $P1869["dec_number"]
    unless_null $P112, vivify_653
    new $P112, "Undef"
  vivify_653:
    if $P112, if_1868
    find_lex $P1871, "$/"
    unless_null $P1871, vivify_654
    $P1871 = root_new ['parrot';'Hash']
  vivify_654:
    set $P115, $P1871["integer"]
    unless_null $P115, vivify_655
    new $P115, "Undef"
  vivify_655:
    $P117 = $P115."ast"()
    set $P111, $P117
    goto if_1868_end
  if_1868:
    find_lex $P1870, "$/"
    unless_null $P1870, vivify_656
    $P1870 = root_new ['parrot';'Hash']
  vivify_656:
    set $P113, $P1870["dec_number"]
    unless_null $P113, vivify_657
    new $P113, "Undef"
  vivify_657:
    $P114 = $P113."ast"()
    set $P111, $P114
  if_1868_end:
    store_lex "$value", $P111
.annotate 'line', 792
    find_lex $P1873, "$/"
    unless_null $P1873, vivify_658
    $P1873 = root_new ['parrot';'Hash']
  vivify_658:
    set $P111, $P1873["sign"]
    unless_null $P111, vivify_659
    new $P111, "Undef"
  vivify_659:
    set $S100, $P111
    iseq $I100, $S100, "-"
    unless $I100, if_1872_end
    find_lex $P112, "$value"
    neg $P113, $P112
    store_lex "$value", $P113
  if_1872_end:
.annotate 'line', 793
    find_lex $P111, "$/"
    get_hll_global $P112, ["PAST"], "Val"
    find_lex $P113, "$value"
    $P114 = $P112."new"($P113 :named("value"))
    $P115 = $P111."!make"($P114)
.annotate 'line', 790
    .return ($P115)
  control_1864:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<apos>"  :subid("121_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1877
.annotate 'line', 796
    new $P1876, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1876, control_1875
    push_eh $P1876
    .lex "self", self
    .lex "$/", param_1877
    find_lex $P110, "$/"
    find_lex $P1878, "$/"
    unless_null $P1878, vivify_660
    $P1878 = root_new ['parrot';'Hash']
  vivify_660:
    set $P111, $P1878["quote_EXPR"]
    unless_null $P111, vivify_661
    new $P111, "Undef"
  vivify_661:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1875:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<dblq>"  :subid("122_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1882
.annotate 'line', 797
    new $P1881, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1881, control_1880
    push_eh $P1881
    .lex "self", self
    .lex "$/", param_1882
    find_lex $P110, "$/"
    find_lex $P1883, "$/"
    unless_null $P1883, vivify_662
    $P1883 = root_new ['parrot';'Hash']
  vivify_662:
    set $P111, $P1883["quote_EXPR"]
    unless_null $P111, vivify_663
    new $P111, "Undef"
  vivify_663:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1880:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<qq>"  :subid("123_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1887
.annotate 'line', 798
    new $P1886, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1886, control_1885
    push_eh $P1886
    .lex "self", self
    .lex "$/", param_1887
    find_lex $P110, "$/"
    find_lex $P1888, "$/"
    unless_null $P1888, vivify_664
    $P1888 = root_new ['parrot';'Hash']
  vivify_664:
    set $P111, $P1888["quote_EXPR"]
    unless_null $P111, vivify_665
    new $P111, "Undef"
  vivify_665:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1885:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<q>"  :subid("124_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1892
.annotate 'line', 799
    new $P1891, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1891, control_1890
    push_eh $P1891
    .lex "self", self
    .lex "$/", param_1892
    find_lex $P110, "$/"
    find_lex $P1893, "$/"
    unless_null $P1893, vivify_666
    $P1893 = root_new ['parrot';'Hash']
  vivify_666:
    set $P111, $P1893["quote_EXPR"]
    unless_null $P111, vivify_667
    new $P111, "Undef"
  vivify_667:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1890:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q>"  :subid("125_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1897
.annotate 'line', 800
    new $P1896, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1896, control_1895
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
    find_lex $P110, "$/"
    find_lex $P1898, "$/"
    unless_null $P1898, vivify_668
    $P1898 = root_new ['parrot';'Hash']
  vivify_668:
    set $P111, $P1898["quote_EXPR"]
    unless_null $P111, vivify_669
    new $P111, "Undef"
  vivify_669:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1895:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym<Q:PIR>"  :subid("126_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1902
.annotate 'line', 801
    new $P1901, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1901, control_1900
    push_eh $P1901
    .lex "self", self
    .lex "$/", param_1902
.annotate 'line', 802
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
    find_lex $P1903, "$/"
    unless_null $P1903, vivify_670
    $P1903 = root_new ['parrot';'Hash']
  vivify_670:
    set $P112, $P1903["quote_EXPR"]
    unless_null $P112, vivify_671
    new $P112, "Undef"
  vivify_671:
    $P113 = $P112."ast"()
    $P114 = $P113."value"()
    find_lex $P115, "$/"
    $P117 = $P111."new"($P114 :named("inline"), "inline" :named("pasttype"), $P115 :named("node"))
    $P118 = $P110."!make"($P117)
.annotate 'line', 801
    .return ($P118)
  control_1900:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote:sym</ />"  :subid("127_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1907
    .param pmc param_1908 :optional
    .param int has_param_1908 :opt_flag
.annotate 'line', 807
    new $P1906, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1906, control_1905
    push_eh $P1906
    .lex "self", self
    .lex "$/", param_1907
    if has_param_1908, optparam_672
    new $P110, "Undef"
    set param_1908, $P110
  optparam_672:
    .lex "$key", param_1908
.annotate 'line', 817
    new $P111, "Undef"
    set $P1909, $P111
    .lex "$regex", $P1909
.annotate 'line', 819
    new $P112, "Undef"
    set $P1910, $P112
    .lex "$past", $P1910
.annotate 'line', 808
    find_lex $P113, "$key"
    set $S100, $P113
    iseq $I100, $S100, "open"
    unless $I100, if_1911_end
.annotate 'line', 809

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0

.annotate 'line', 813
    get_global $P1912, "@BLOCK"
    unless_null $P1912, vivify_673
    $P1912 = root_new ['parrot';'ResizablePMCArray']
  vivify_673:
    set $P114, $P1912[0]
    unless_null $P114, vivify_674
    new $P114, "Undef"
  vivify_674:
    $P114."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate 'line', 814
    get_global $P1913, "@BLOCK"
    unless_null $P1913, vivify_675
    $P1913 = root_new ['parrot';'ResizablePMCArray']
  vivify_675:
    set $P114, $P1913[0]
    unless_null $P114, vivify_676
    new $P114, "Undef"
  vivify_676:
    $P114."symbol"("$/", "lexical" :named("scope"))
.annotate 'line', 815
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    new $P115, "Integer"
    assign $P115, 0
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1911_end:
.annotate 'line', 818
    get_hll_global $P113, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1914, "$/"
    unless_null $P1914, vivify_677
    $P1914 = root_new ['parrot';'Hash']
  vivify_677:
    set $P114, $P1914["p6regex"]
    unless_null $P114, vivify_678
    new $P114, "Undef"
  vivify_678:
    $P115 = $P114."ast"()
    get_global $P117, "@BLOCK"
    $P118 = $P117."shift"()
    $P119 = $P113($P115, $P118)
    store_lex "$regex", $P119
.annotate 'line', 820
    get_hll_global $P113, ["PAST"], "Op"
.annotate 'line', 822
    get_hll_global $P114, ["PAST"], "Var"
    new $P115, "ResizablePMCArray"
    push $P115, "Regex"
    $P117 = $P114."new"("Regex" :named("name"), $P115 :named("namespace"), "package" :named("scope"))
    find_lex $P118, "$regex"
    $P119 = $P113."new"($P117, $P118, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate 'line', 820
    store_lex "$past", $P119
.annotate 'line', 826
    find_lex $P113, "$regex"
    find_lex $P1915, "$past"
    unless_null $P1915, vivify_679
    $P1915 = root_new ['parrot';'Hash']
    store_lex "$past", $P1915
  vivify_679:
    set $P1915["sink"], $P113
.annotate 'line', 827
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 807
    .return ($P115)
  control_1905:
    .local pmc exception
    .get_results (exception)
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<$>"  :subid("128_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1919
.annotate 'line', 830
    new $P1918, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1918, control_1917
    push_eh $P1918
    .lex "self", self
    .lex "$/", param_1919
    find_lex $P110, "$/"
    find_lex $P1920, "$/"
    unless_null $P1920, vivify_680
    $P1920 = root_new ['parrot';'Hash']
  vivify_680:
    set $P111, $P1920["variable"]
    unless_null $P111, vivify_681
    new $P111, "Undef"
  vivify_681:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1917:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<{ }>"  :subid("129_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1924
.annotate 'line', 831
    new $P1923, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1923, control_1922
    push_eh $P1923
    .lex "self", self
    .lex "$/", param_1924
.annotate 'line', 832
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
.annotate 'line', 833
    find_lex $P1925, "$/"
    unless_null $P1925, vivify_682
    $P1925 = root_new ['parrot';'Hash']
  vivify_682:
    set $P112, $P1925["block"]
    unless_null $P112, vivify_683
    new $P112, "Undef"
  vivify_683:
    $P113 = $P112."ast"()
    $P114 = "block_immediate"($P113)
    find_lex $P115, "$/"
    $P117 = $P111."new"($P114, "set S*" :named("pirop"), $P115 :named("node"))
.annotate 'line', 832
    $P118 = $P110."!make"($P117)
.annotate 'line', 831
    .return ($P118)
  control_1922:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "quote_escape:sym<esc>"  :subid("130_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1929
.annotate 'line', 836
    new $P1928, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1928, control_1927
    push_eh $P1928
    .lex "self", self
    .lex "$/", param_1929
    find_lex $P110, "$/"
    $P111 = $P110."!make"("\e")
    .return ($P111)
  control_1927:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<.>"  :subid("131_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1933
.annotate 'line', 840
    new $P1932, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1932, control_1931
    push_eh $P1932
    .lex "self", self
    .lex "$/", param_1933
    find_lex $P110, "$/"
    find_lex $P1934, "$/"
    unless_null $P1934, vivify_684
    $P1934 = root_new ['parrot';'Hash']
  vivify_684:
    set $P111, $P1934["dotty"]
    unless_null $P111, vivify_685
    new $P111, "Undef"
  vivify_685:
    $P112 = $P111."ast"()
    $P113 = $P110."!make"($P112)
    .return ($P113)
  control_1931:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<++>"  :subid("132_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1938
.annotate 'line', 842
    new $P1937, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1937, control_1936
    push_eh $P1937
    .lex "self", self
    .lex "$/", param_1938
.annotate 'line', 843
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
.annotate 'line', 844
    new $P112, "ResizablePMCArray"
    push $P112, "    clone %r, %0"
    push $P112, "    inc %0"
.annotate 'line', 843
    $P113 = $P111."new"("postfix:<++>" :named("name"), $P112 :named("inline"), "inline" :named("pasttype"))
    $P114 = $P110."!make"($P113)
.annotate 'line', 842
    .return ($P114)
  control_1936:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "postfix:sym<-->"  :subid("133_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1942
.annotate 'line', 848
    new $P1941, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1941, control_1940
    push_eh $P1941
    .lex "self", self
    .lex "$/", param_1942
.annotate 'line', 849
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
.annotate 'line', 850
    new $P112, "ResizablePMCArray"
    push $P112, "    clone %r, %0"
    push $P112, "    dec %0"
.annotate 'line', 849
    $P113 = $P111."new"("postfix:<-->" :named("name"), $P112 :named("inline"), "inline" :named("pasttype"))
    $P114 = $P110."!make"($P113)
.annotate 'line', 848
    .return ($P114)
  control_1940:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "prefix:sym<make>"  :subid("134_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1946
.annotate 'line', 854
    new $P1945, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1945, control_1944
    push_eh $P1945
    .lex "self", self
    .lex "$/", param_1946
.annotate 'line', 855
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
.annotate 'line', 856
    get_hll_global $P112, ["PAST"], "Var"
    $P113 = $P112."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P114, "$/"
    $P115 = $P111."new"($P113, "callmethod" :named("pasttype"), "!make" :named("name"), $P114 :named("node"))
.annotate 'line', 855
    $P117 = $P110."!make"($P115)
.annotate 'line', 854
    .return ($P117)
  control_1944:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<next>"  :subid("135_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1950
.annotate 'line', 872
    new $P1949, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1949, control_1948
    push_eh $P1949
    .lex "self", self
    .lex "$/", param_1950
    find_lex $P110, "$/"
    $P111 = "control"($P110, "CONTROL_LOOP_NEXT")
    .return ($P111)
  control_1948:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<last>"  :subid("136_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1954
.annotate 'line', 873
    new $P1953, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1953, control_1952
    push_eh $P1953
    .lex "self", self
    .lex "$/", param_1954
    find_lex $P110, "$/"
    $P111 = "control"($P110, "CONTROL_LOOP_LAST")
    .return ($P111)
  control_1952:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "term:sym<redo>"  :subid("137_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1958
.annotate 'line', 874
    new $P1957, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1957, control_1956
    push_eh $P1957
    .lex "self", self
    .lex "$/", param_1958
    find_lex $P110, "$/"
    $P111 = "control"($P110, "CONTROL_LOOP_REDO")
    .return ($P111)
  control_1956:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.include "except_types.pasm"
.sub "infix:sym<~~>"  :subid("138_1309998850.8808") :method :outer("11_1309998850.8808")
    .param pmc param_1962
.annotate 'line', 876
    new $P1961, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1961, control_1960
    push_eh $P1961
    .lex "self", self
    .lex "$/", param_1962
.annotate 'line', 877
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Op"
    find_lex $P112, "$/"
    $P113 = $P111."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P112 :named("node"))
    $P114 = $P110."!make"($P113)
.annotate 'line', 876
    .return ($P114)
  control_1960:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1963"  :subid("139_1309998850.8808") :outer("11_1309998850.8808")
.annotate 'line', 881
    .const 'Sub' $P1997 = "146_1309998850.8808"
    capture_lex $P1997
    .const 'Sub' $P1992 = "145_1309998850.8808"
    capture_lex $P1992
    .const 'Sub' $P1986 = "144_1309998850.8808"
    capture_lex $P1986
    .const 'Sub' $P1981 = "143_1309998850.8808"
    capture_lex $P1981
    .const 'Sub' $P1976 = "142_1309998850.8808"
    capture_lex $P1976
    .const 'Sub' $P1971 = "141_1309998850.8808"
    capture_lex $P1971
    .const 'Sub' $P1965 = "140_1309998850.8808"
    capture_lex $P1965
.annotate 'line', 915
    .const 'Sub' $P1997 = "146_1309998850.8808"
    newclosure $P2004, $P1997
.annotate 'line', 881
    .return ($P2004)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<:my>"  :subid("140_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1968
.annotate 'line', 883
    new $P1967, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1967, control_1966
    push_eh $P1967
    .lex "self", self
    .lex "$/", param_1968
.annotate 'line', 884
    new $P110, "Undef"
    set $P1969, $P110
    .lex "$past", $P1969
    find_lex $P1970, "$/"
    unless_null $P1970, vivify_686
    $P1970 = root_new ['parrot';'Hash']
  vivify_686:
    set $P111, $P1970["statement"]
    unless_null $P111, vivify_687
    new $P111, "Undef"
  vivify_687:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 885
    find_lex $P111, "$/"
    get_hll_global $P112, ["PAST"], "Regex"
    find_lex $P113, "$past"
    find_lex $P114, "$/"
    $P115 = $P112."new"($P113, "pastnode" :named("pasttype"), "declarative" :named("subtype"), $P114 :named("node"))
    $P117 = $P111."!make"($P115)
.annotate 'line', 883
    .return ($P117)
  control_1966:
    .local pmc exception
    .get_results (exception)
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<{ }>"  :subid("141_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1974
.annotate 'line', 889
    new $P1973, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1973, control_1972
    push_eh $P1973
    .lex "self", self
    .lex "$/", param_1974
.annotate 'line', 890
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P1975, "$/"
    unless_null $P1975, vivify_688
    $P1975 = root_new ['parrot';'Hash']
  vivify_688:
    set $P112, $P1975["codeblock"]
    unless_null $P112, vivify_689
    new $P112, "Undef"
  vivify_689:
    $P113 = $P112."ast"()
    find_lex $P114, "$/"
    $P115 = $P111."new"($P113, "pastnode" :named("pasttype"), $P114 :named("node"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 889
    .return ($P117)
  control_1972:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "metachar:sym<nqpvar>"  :subid("142_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1979
.annotate 'line', 894
    new $P1978, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1978, control_1977
    push_eh $P1978
    .lex "self", self
    .lex "$/", param_1979
.annotate 'line', 895
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P1980, "$/"
    unless_null $P1980, vivify_690
    $P1980 = root_new ['parrot';'Hash']
  vivify_690:
    set $P112, $P1980["var"]
    unless_null $P112, vivify_691
    new $P112, "Undef"
  vivify_691:
    $P113 = $P112."ast"()
    find_lex $P114, "$/"
    $P115 = $P111."new"("!INTERPOLATE", $P113, "subrule" :named("pasttype"), "method" :named("subtype"), $P114 :named("node"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 894
    .return ($P117)
  control_1977:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<{ }>"  :subid("143_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1984
.annotate 'line', 899
    new $P1983, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1983, control_1982
    push_eh $P1983
    .lex "self", self
    .lex "$/", param_1984
.annotate 'line', 900
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P1985, "$/"
    unless_null $P1985, vivify_692
    $P1985 = root_new ['parrot';'Hash']
  vivify_692:
    set $P112, $P1985["codeblock"]
    unless_null $P112, vivify_693
    new $P112, "Undef"
  vivify_693:
    $P113 = $P112."ast"()
    find_lex $P114, "$/"
    $P115 = $P111."new"("!INTERPOLATE_REGEX", $P113, "subrule" :named("pasttype"), "method" :named("subtype"), $P114 :named("node"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 899
    .return ($P117)
  control_1982:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<?{ }>"  :subid("144_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1989
.annotate 'line', 904
    new $P1988, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1988, control_1987
    push_eh $P1988
    .lex "self", self
    .lex "$/", param_1989
.annotate 'line', 905
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P1990, "$/"
    unless_null $P1990, vivify_694
    $P1990 = root_new ['parrot';'Hash']
  vivify_694:
    set $P112, $P1990["codeblock"]
    unless_null $P112, vivify_695
    new $P112, "Undef"
  vivify_695:
    $P113 = $P112."ast"()
.annotate 'line', 906
    find_lex $P1991, "$/"
    unless_null $P1991, vivify_696
    $P1991 = root_new ['parrot';'Hash']
  vivify_696:
    set $P114, $P1991["zw"]
    unless_null $P114, vivify_697
    new $P114, "Undef"
  vivify_697:
    set $S100, $P114
    iseq $I100, $S100, "!"
.annotate 'line', 905
    find_lex $P115, "$/"
    $P117 = $P111."new"($P113, "zerowidth" :named("subtype"), $I100 :named("negate"), "pastnode" :named("pasttype"), $P115 :named("node"))
    $P118 = $P110."!make"($P117)
.annotate 'line', 904
    .return ($P118)
  control_1987:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "assertion:sym<var>"  :subid("145_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_1995
.annotate 'line', 910
    new $P1994, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1994, control_1993
    push_eh $P1994
    .lex "self", self
    .lex "$/", param_1995
.annotate 'line', 911
    find_lex $P110, "$/"
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P1996, "$/"
    unless_null $P1996, vivify_698
    $P1996 = root_new ['parrot';'Hash']
  vivify_698:
    set $P112, $P1996["var"]
    unless_null $P112, vivify_699
    new $P112, "Undef"
  vivify_699:
    $P113 = $P112."ast"()
    find_lex $P114, "$/"
    $P115 = $P111."new"("!INTERPOLATE_REGEX", $P113, "subrule" :named("pasttype"), "method" :named("subtype"), $P114 :named("node"))
    $P117 = $P110."!make"($P115)
.annotate 'line', 910
    .return ($P117)
  control_1993:
    .local pmc exception
    .get_results (exception)
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"RegexActions"]
.include "except_types.pasm"
.sub "codeblock"  :subid("146_1309998850.8808") :method :outer("139_1309998850.8808")
    .param pmc param_2000
.annotate 'line', 915
    new $P1999, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1999, control_1998
    push_eh $P1999
    .lex "self", self
    .lex "$/", param_2000
.annotate 'line', 916
    new $P110, "Undef"
    set $P2001, $P110
    .lex "$block", $P2001
.annotate 'line', 918
    new $P111, "Undef"
    set $P2002, $P111
    .lex "$past", $P2002
.annotate 'line', 916
    find_lex $P2003, "$/"
    unless_null $P2003, vivify_700
    $P2003 = root_new ['parrot';'Hash']
  vivify_700:
    set $P112, $P2003["block"]
    unless_null $P112, vivify_701
    new $P112, "Undef"
  vivify_701:
    $P113 = $P112."ast"()
    store_lex "$block", $P113
.annotate 'line', 917
    find_lex $P112, "$block"
    $P112."blocktype"("immediate")
.annotate 'line', 919
    get_hll_global $P112, ["PAST"], "Stmts"
.annotate 'line', 920
    get_hll_global $P113, ["PAST"], "Op"
.annotate 'line', 921
    get_hll_global $P114, ["PAST"], "Var"
    $P115 = $P114."new"("$/" :named("name"))
.annotate 'line', 922
    get_hll_global $P117, ["PAST"], "Op"
.annotate 'line', 923
    get_hll_global $P118, ["PAST"], "Var"
    $P119 = $P118."new"(unicode:"$\x{a2}" :named("name"))
    $P120 = $P117."new"($P119, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate 'line', 922
    $P121 = $P113."new"($P115, $P120, "bind" :named("pasttype"))
.annotate 'line', 920
    find_lex $P122, "$block"
    $P123 = $P112."new"($P121, $P122)
.annotate 'line', 919
    store_lex "$past", $P123
.annotate 'line', 931
    find_lex $P112, "$/"
    find_lex $P113, "$past"
    $P114 = $P112."!make"($P113)
.annotate 'line', 915
    .return ($P114)
  control_1998:
    .local pmc exception
    .get_results (exception)
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "_block2005" :tag('load') :anon :subid("147_1309998850.8808")
.annotate 'line', 3
    .const 'Sub' $P2007 = "11_1309998850.8808"
    $P111 = $P2007()
    .return ($P111)
.end


.namespace []
.sub "_block2013" :tag('load') :anon :subid("149_1309998850.8808")
.annotate 'line', 1
    .const 'Sub' $P2015 = "10_1309998850.8808"
    $P100 = $P2015()
    .return ($P100)
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

.sub '' :anon :tag('init') :tag('load')
    $P0 = box 0
    set_global '$test_counter', $P0
.end



.namespace ['NQP';'Compiler']

.sub '' :anon :tag('load', 'init')
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
