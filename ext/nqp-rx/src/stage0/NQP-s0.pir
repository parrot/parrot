# Copyright (C) 2009, Patrick R. Michaud

=head1 NAME

NQP::Compiler - NQP compiler

=head1 DESCRIPTION

=cut

.sub '' :anon :load :init
    load_bytecode 'P6Regex.pbc'
.end

### .include 'gen/nqp-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259779041.86401")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1251 = $P14()
.annotate "line", 1
    .return ($P1251)
.end


.namespace []
.sub "" :load :init :subid("post322") :outer("10_1259779041.86401")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259779041.86401" 
    .local pmc block
    set block, $P12
    $P1252 = get_root_global ["parrot"], "P6metaclass"
    $P1252."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1259779041.86401") :outer("10_1259779041.86401")
.annotate "line", 4
    get_hll_global $P1195, ["NQP";"Regex"], "_block1194" 
    capture_lex $P1195
    .const 'Sub' $P1188 = "307_1259779041.86401" 
    capture_lex $P1188
    .const 'Sub' $P1182 = "305_1259779041.86401" 
    capture_lex $P1182
    .const 'Sub' $P1175 = "303_1259779041.86401" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "301_1259779041.86401" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "299_1259779041.86401" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "297_1259779041.86401" 
    capture_lex $P1154
    .const 'Sub' $P1148 = "295_1259779041.86401" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "293_1259779041.86401" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "291_1259779041.86401" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "289_1259779041.86401" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "287_1259779041.86401" 
    capture_lex $P1120
    .const 'Sub' $P1113 = "285_1259779041.86401" 
    capture_lex $P1113
    .const 'Sub' $P1106 = "283_1259779041.86401" 
    capture_lex $P1106
    .const 'Sub' $P1099 = "281_1259779041.86401" 
    capture_lex $P1099
    .const 'Sub' $P1092 = "279_1259779041.86401" 
    capture_lex $P1092
    .const 'Sub' $P1085 = "277_1259779041.86401" 
    capture_lex $P1085
    .const 'Sub' $P1078 = "275_1259779041.86401" 
    capture_lex $P1078
    .const 'Sub' $P1071 = "273_1259779041.86401" 
    capture_lex $P1071
    .const 'Sub' $P1064 = "271_1259779041.86401" 
    capture_lex $P1064
    .const 'Sub' $P1057 = "269_1259779041.86401" 
    capture_lex $P1057
    .const 'Sub' $P1050 = "267_1259779041.86401" 
    capture_lex $P1050
    .const 'Sub' $P1043 = "265_1259779041.86401" 
    capture_lex $P1043
    .const 'Sub' $P1036 = "263_1259779041.86401" 
    capture_lex $P1036
    .const 'Sub' $P1029 = "261_1259779041.86401" 
    capture_lex $P1029
    .const 'Sub' $P1022 = "259_1259779041.86401" 
    capture_lex $P1022
    .const 'Sub' $P1015 = "257_1259779041.86401" 
    capture_lex $P1015
    .const 'Sub' $P1008 = "255_1259779041.86401" 
    capture_lex $P1008
    .const 'Sub' $P1001 = "253_1259779041.86401" 
    capture_lex $P1001
    .const 'Sub' $P994 = "251_1259779041.86401" 
    capture_lex $P994
    .const 'Sub' $P987 = "249_1259779041.86401" 
    capture_lex $P987
    .const 'Sub' $P980 = "247_1259779041.86401" 
    capture_lex $P980
    .const 'Sub' $P973 = "245_1259779041.86401" 
    capture_lex $P973
    .const 'Sub' $P967 = "243_1259779041.86401" 
    capture_lex $P967
    .const 'Sub' $P960 = "241_1259779041.86401" 
    capture_lex $P960
    .const 'Sub' $P953 = "239_1259779041.86401" 
    capture_lex $P953
    .const 'Sub' $P946 = "237_1259779041.86401" 
    capture_lex $P946
    .const 'Sub' $P939 = "235_1259779041.86401" 
    capture_lex $P939
    .const 'Sub' $P932 = "233_1259779041.86401" 
    capture_lex $P932
    .const 'Sub' $P925 = "231_1259779041.86401" 
    capture_lex $P925
    .const 'Sub' $P918 = "229_1259779041.86401" 
    capture_lex $P918
    .const 'Sub' $P912 = "227_1259779041.86401" 
    capture_lex $P912
    .const 'Sub' $P906 = "225_1259779041.86401" 
    capture_lex $P906
    .const 'Sub' $P901 = "223_1259779041.86401" 
    capture_lex $P901
    .const 'Sub' $P895 = "221_1259779041.86401" 
    capture_lex $P895
    .const 'Sub' $P889 = "219_1259779041.86401" 
    capture_lex $P889
    .const 'Sub' $P884 = "217_1259779041.86401" 
    capture_lex $P884
    .const 'Sub' $P879 = "215_1259779041.86401" 
    capture_lex $P879
    .const 'Sub' $P872 = "213_1259779041.86401" 
    capture_lex $P872
    .const 'Sub' $P864 = "211_1259779041.86401" 
    capture_lex $P864
    .const 'Sub' $P859 = "209_1259779041.86401" 
    capture_lex $P859
    .const 'Sub' $P854 = "207_1259779041.86401" 
    capture_lex $P854
    .const 'Sub' $P849 = "205_1259779041.86401" 
    capture_lex $P849
    .const 'Sub' $P841 = "203_1259779041.86401" 
    capture_lex $P841
    .const 'Sub' $P833 = "201_1259779041.86401" 
    capture_lex $P833
    .const 'Sub' $P828 = "199_1259779041.86401" 
    capture_lex $P828
    .const 'Sub' $P823 = "197_1259779041.86401" 
    capture_lex $P823
    .const 'Sub' $P817 = "195_1259779041.86401" 
    capture_lex $P817
    .const 'Sub' $P811 = "193_1259779041.86401" 
    capture_lex $P811
    .const 'Sub' $P805 = "191_1259779041.86401" 
    capture_lex $P805
    .const 'Sub' $P799 = "189_1259779041.86401" 
    capture_lex $P799
    .const 'Sub' $P794 = "187_1259779041.86401" 
    capture_lex $P794
    .const 'Sub' $P789 = "185_1259779041.86401" 
    capture_lex $P789
    .const 'Sub' $P776 = "181_1259779041.86401" 
    capture_lex $P776
    .const 'Sub' $P768 = "179_1259779041.86401" 
    capture_lex $P768
    .const 'Sub' $P762 = "177_1259779041.86401" 
    capture_lex $P762
    .const 'Sub' $P755 = "175_1259779041.86401" 
    capture_lex $P755
    .const 'Sub' $P749 = "173_1259779041.86401" 
    capture_lex $P749
    .const 'Sub' $P741 = "171_1259779041.86401" 
    capture_lex $P741
    .const 'Sub' $P733 = "169_1259779041.86401" 
    capture_lex $P733
    .const 'Sub' $P727 = "167_1259779041.86401" 
    capture_lex $P727
    .const 'Sub' $P721 = "165_1259779041.86401" 
    capture_lex $P721
    .const 'Sub' $P706 = "161_1259779041.86401" 
    capture_lex $P706
    .const 'Sub' $P674 = "159_1259779041.86401" 
    capture_lex $P674
    .const 'Sub' $P666 = "157_1259779041.86401" 
    capture_lex $P666
    .const 'Sub' $P660 = "155_1259779041.86401" 
    capture_lex $P660
    .const 'Sub' $P650 = "153_1259779041.86401" 
    capture_lex $P650
    .const 'Sub' $P635 = "151_1259779041.86401" 
    capture_lex $P635
    .const 'Sub' $P626 = "149_1259779041.86401" 
    capture_lex $P626
    .const 'Sub' $P607 = "147_1259779041.86401" 
    capture_lex $P607
    .const 'Sub' $P583 = "145_1259779041.86401" 
    capture_lex $P583
    .const 'Sub' $P576 = "143_1259779041.86401" 
    capture_lex $P576
    .const 'Sub' $P569 = "141_1259779041.86401" 
    capture_lex $P569
    .const 'Sub' $P559 = "137_1259779041.86401" 
    capture_lex $P559
    .const 'Sub' $P548 = "135_1259779041.86401" 
    capture_lex $P548
    .const 'Sub' $P541 = "133_1259779041.86401" 
    capture_lex $P541
    .const 'Sub' $P534 = "131_1259779041.86401" 
    capture_lex $P534
    .const 'Sub' $P527 = "129_1259779041.86401" 
    capture_lex $P527
    .const 'Sub' $P500 = "125_1259779041.86401" 
    capture_lex $P500
    .const 'Sub' $P491 = "123_1259779041.86401" 
    capture_lex $P491
    .const 'Sub' $P484 = "121_1259779041.86401" 
    capture_lex $P484
    .const 'Sub' $P475 = "117_1259779041.86401" 
    capture_lex $P475
    .const 'Sub' $P470 = "115_1259779041.86401" 
    capture_lex $P470
    .const 'Sub' $P458 = "113_1259779041.86401" 
    capture_lex $P458
    .const 'Sub' $P446 = "111_1259779041.86401" 
    capture_lex $P446
    .const 'Sub' $P441 = "109_1259779041.86401" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1259779041.86401" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1259779041.86401" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1259779041.86401" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1259779041.86401" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1259779041.86401" 
    capture_lex $P411
    .const 'Sub' $P405 = "97_1259779041.86401" 
    capture_lex $P405
    .const 'Sub' $P399 = "95_1259779041.86401" 
    capture_lex $P399
    .const 'Sub' $P391 = "93_1259779041.86401" 
    capture_lex $P391
    .const 'Sub' $P383 = "91_1259779041.86401" 
    capture_lex $P383
    .const 'Sub' $P371 = "87_1259779041.86401" 
    capture_lex $P371
    .const 'Sub' $P363 = "85_1259779041.86401" 
    capture_lex $P363
    .const 'Sub' $P353 = "81_1259779041.86401" 
    capture_lex $P353
    .const 'Sub' $P346 = "79_1259779041.86401" 
    capture_lex $P346
    .const 'Sub' $P339 = "77_1259779041.86401" 
    capture_lex $P339
    .const 'Sub' $P327 = "73_1259779041.86401" 
    capture_lex $P327
    .const 'Sub' $P319 = "71_1259779041.86401" 
    capture_lex $P319
    .const 'Sub' $P311 = "69_1259779041.86401" 
    capture_lex $P311
    .const 'Sub' $P291 = "67_1259779041.86401" 
    capture_lex $P291
    .const 'Sub' $P282 = "65_1259779041.86401" 
    capture_lex $P282
    .const 'Sub' $P264 = "62_1259779041.86401" 
    capture_lex $P264
    .const 'Sub' $P244 = "60_1259779041.86401" 
    capture_lex $P244
    .const 'Sub' $P235 = "56_1259779041.86401" 
    capture_lex $P235
    .const 'Sub' $P230 = "54_1259779041.86401" 
    capture_lex $P230
    .const 'Sub' $P221 = "50_1259779041.86401" 
    capture_lex $P221
    .const 'Sub' $P216 = "48_1259779041.86401" 
    capture_lex $P216
    .const 'Sub' $P208 = "46_1259779041.86401" 
    capture_lex $P208
    .const 'Sub' $P201 = "44_1259779041.86401" 
    capture_lex $P201
    .const 'Sub' $P195 = "42_1259779041.86401" 
    capture_lex $P195
    .const 'Sub' $P187 = "40_1259779041.86401" 
    capture_lex $P187
    .const 'Sub' $P181 = "38_1259779041.86401" 
    capture_lex $P181
    .const 'Sub' $P175 = "36_1259779041.86401" 
    capture_lex $P175
    .const 'Sub' $P159 = "33_1259779041.86401" 
    capture_lex $P159
    .const 'Sub' $P146 = "31_1259779041.86401" 
    capture_lex $P146
    .const 'Sub' $P139 = "29_1259779041.86401" 
    capture_lex $P139
    .const 'Sub' $P96 = "26_1259779041.86401" 
    capture_lex $P96
    .const 'Sub' $P78 = "23_1259779041.86401" 
    capture_lex $P78
    .const 'Sub' $P68 = "21_1259779041.86401" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1259779041.86401" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1259779041.86401" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1259779041.86401" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1259779041.86401" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1259779041.86401" 
    capture_lex $P15
.annotate "line", 509
    get_hll_global $P1195, ["NQP";"Regex"], "_block1194" 
    capture_lex $P1195
    $P1234 = $P1195()
.annotate "line", 4
    .return ($P1234)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post323") :outer("11_1259779041.86401")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 402
    get_hll_global $P1235, ["NQP"], "Grammar"
    $P1235."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 403
    get_hll_global $P1236, ["NQP"], "Grammar"
    $P1236."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 404
    get_hll_global $P1237, ["NQP"], "Grammar"
    $P1237."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 405
    get_hll_global $P1238, ["NQP"], "Grammar"
    $P1238."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 406
    get_hll_global $P1239, ["NQP"], "Grammar"
    $P1239."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 407
    get_hll_global $P1240, ["NQP"], "Grammar"
    $P1240."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 408
    get_hll_global $P1241, ["NQP"], "Grammar"
    $P1241."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 409
    get_hll_global $P1242, ["NQP"], "Grammar"
    $P1242."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 410
    get_hll_global $P1243, ["NQP"], "Grammar"
    $P1243."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 411
    get_hll_global $P1244, ["NQP"], "Grammar"
    $P1244."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 412
    get_hll_global $P1245, ["NQP"], "Grammar"
    $P1245."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 413
    get_hll_global $P1246, ["NQP"], "Grammar"
    $P1246."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 414
    get_hll_global $P1247, ["NQP"], "Grammar"
    $P1247."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 415
    get_hll_global $P1248, ["NQP"], "Grammar"
    $P1248."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 416
    get_hll_global $P1249, ["NQP"], "Grammar"
    $P1249."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 401
    $P1250 = get_root_global ["parrot"], "P6metaclass"
    $P1250."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
.annotate "line", 5
    new $P18, "Hash"
    .lex "%*LANG", $P18
.annotate "line", 10
    new $P19, "Undef"
    .lex "$*SCOPE", $P19
.annotate "line", 4
    find_lex $P20, "%*LANG"
    unless_null $P20, vivify_324
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_325
    die "Contextual %*LANG not found"
  vivify_325:
  vivify_324:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_326
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_327
    die "Contextual %*LANG not found"
  vivify_327:
    store_lex "%*LANG", $P22
  vivify_326:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_328
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_329
    die "Contextual %*LANG not found"
  vivify_329:
    store_lex "%*LANG", $P24
  vivify_328:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_330
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_331
    die "Contextual %*LANG not found"
  vivify_331:
    store_lex "%*LANG", $P26
  vivify_330:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_332
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_333
    die "Contextual %*LANG not found"
  vivify_333:
    store_lex "%*LANG", $P28
  vivify_332:
    set $P28["MAIN-actions"], $P27
.annotate "line", 10
    new $P29, "String"
    assign $P29, ""
    store_lex "$*SCOPE", $P29
.annotate "line", 11
    find_lex $P30, "self"
    $P31 = $P30."comp_unit"()
.annotate "line", 4
    .return ($P31)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
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
.annotate "line", 16
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
.annotate "line", 4
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
.sub "!PREFIX__identifier"  :subid("14_1259779041.86401") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
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
.annotate "line", 18
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
.annotate "line", 4
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
.sub "!PREFIX__name"  :subid("16_1259779041.86401") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
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
.annotate "line", 21
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
.annotate "line", 20
  # rx pass
    rx47_cur."!cursor_pass"(rx47_pos, "deflongname")
    rx47_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx47_pos)
    .return (rx47_cur)
  rx47_fail:
.annotate "line", 4
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
.sub "!PREFIX__deflongname"  :subid("18_1259779041.86401") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
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
.annotate "line", 28
  # rx rxquantr59 ** 0..1
    set_addr $I67, rxquantr59_done
    rx55_cur."!mark_push"(0, rx55_pos, $I67)
  rxquantr59_loop:
  alt60_0:
.annotate "line", 25
    set_addr $I10, alt60_1
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
.annotate "line", 26
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
.annotate "line", 27
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
.annotate "line", 28
    (rx55_rep) = rx55_cur."!mark_commit"($I67)
  rxquantr59_done:
.annotate "line", 24
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "ENDSTMT")
    rx55_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate "line", 4
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1259779041.86401") :method
.annotate "line", 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
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
.annotate "line", 31
    set_addr $I10, alt73_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate "line", 32
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKED"("ws")
    unless $P10, rx69_fail
    goto alt73_end
  alt73_1:
.annotate "line", 33
  # rx subrule "ww" subtype=zerowidth negate=1
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ww"()
    if $P10, rx69_fail
.annotate "line", 37
  # rx rxquantr74 ** 0..*
    set_addr $I77, rxquantr74_done
    rx69_cur."!mark_push"(0, rx69_pos, $I77)
  rxquantr74_loop:
  alt75_0:
.annotate "line", 34
    set_addr $I10, alt75_1
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx69_pos, rx69_off
    find_not_cclass $I11, 32, rx69_tgt, $I10, rx69_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx69_fail
    add rx69_pos, rx69_off, $I11
    goto alt75_end
  alt75_1:
    set_addr $I10, alt75_2
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
.annotate "line", 35
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
.annotate "line", 36
  # rxanchor bol
    eq rx69_pos, 0, rxanchor76_done
    ge rx69_pos, rx69_eos, rx69_fail
    sub $I10, rx69_pos, rx69_off
    dec $I10
    is_cclass $I11, 4096, rx69_tgt, $I10
    unless $I11, rx69_fail
  rxanchor76_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."pod_comment"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  alt75_end:
.annotate "line", 37
    (rx69_rep) = rx69_cur."!mark_commit"($I77)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I77)
    goto rxquantr74_loop
  rxquantr74_done:
.annotate "line", 38
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."MARKER"("ws")
    unless $P10, rx69_fail
  alt73_end:
.annotate "line", 31
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "ws")
    rx69_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_fail:
.annotate "line", 4
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
.sub "!PREFIX__ws"  :subid("22_1259779041.86401") :method
.annotate "line", 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .const 'Sub' $P86 = "25_1259779041.86401" 
    capture_lex $P86
    .local string rx79_tgt
    .local int rx79_pos
    .local int rx79_off
    .local int rx79_eos
    .local int rx79_rep
    .local pmc rx79_cur
    (rx79_cur, rx79_pos, rx79_tgt) = self."!cursor_start"()
    rx79_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx79_cur
    .local pmc match
    .lex "$/", match
    length rx79_eos, rx79_tgt
    set rx79_off, 0
    lt rx79_pos, 2, rx79_start
    sub rx79_off, rx79_pos, 1
    substr rx79_tgt, rx79_tgt, rx79_off
  rx79_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan82_done
    goto rxscan82_scan
  rxscan82_loop:
    ($P10) = rx79_cur."from"()
    inc $P10
    set rx79_pos, $P10
    ge rx79_pos, rx79_eos, rxscan82_done
  rxscan82_scan:
    set_addr $I10, rxscan82_loop
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
  rxscan82_done:
  alt83_0:
.annotate "line", 43
    set_addr $I10, alt83_1
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
.annotate "line", 44
  # rxanchor bol
    eq rx79_pos, 0, rxanchor84_done
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    dec $I10
    is_cclass $I11, 4096, rx79_tgt, $I10
    unless $I11, rx79_fail
  rxanchor84_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx79_cur."!cursor_pos"(rx79_pos)
    .const 'Sub' $P86 = "25_1259779041.86401" 
    capture_lex $P86
    $P10 = rx79_cur."before"($P86)
    unless $P10, rx79_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx79_cur."!cursor_pos"(rx79_pos)
    $P10 = rx79_cur."pod_comment"()
    unless $P10, rx79_fail
    rx79_pos = $P10."pos"()
    goto alt83_end
  alt83_1:
    set_addr $I10, alt83_2
    rx79_cur."!mark_push"(0, rx79_pos, $I10)
.annotate "line", 45
  # rx rxquantr92 ** 0..*
    set_addr $I93, rxquantr92_done
    rx79_cur."!mark_push"(0, rx79_pos, $I93)
  rxquantr92_loop:
  # rx enumcharlist negate=0 
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx79_fail
    inc rx79_pos
    (rx79_rep) = rx79_cur."!mark_commit"($I93)
    rx79_cur."!mark_push"(rx79_rep, rx79_pos, $I93)
    goto rxquantr92_loop
  rxquantr92_done:
  # rx literal  "#"
    add $I11, rx79_pos, 1
    gt $I11, rx79_eos, rx79_fail
    sub $I11, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I11, 1
    ne $S10, "#", rx79_fail
    add rx79_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx79_pos, rx79_off
    find_cclass $I11, 4096, rx79_tgt, $I10, rx79_eos
    add rx79_pos, rx79_off, $I11
    goto alt83_end
  alt83_2:
.annotate "line", 46
  # rx rxquantr94 ** 1..*
    set_addr $I95, rxquantr94_done
    rx79_cur."!mark_push"(0, -1, $I95)
  rxquantr94_loop:
  # rx enumcharlist negate=0 
    ge rx79_pos, rx79_eos, rx79_fail
    sub $I10, rx79_pos, rx79_off
    substr $S10, rx79_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx79_fail
    inc rx79_pos
    (rx79_rep) = rx79_cur."!mark_commit"($I95)
    rx79_cur."!mark_push"(rx79_rep, rx79_pos, $I95)
    goto rxquantr94_loop
  rxquantr94_done:
  alt83_end:
.annotate "line", 41
  # rx pass
    rx79_cur."!cursor_pass"(rx79_pos, "unv")
    rx79_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx79_pos)
    .return (rx79_cur)
  rx79_fail:
.annotate "line", 4
    (rx79_rep, rx79_pos, $I10, $P10) = rx79_cur."!mark_fail"(0)
    lt rx79_pos, -1, rx79_done
    eq rx79_pos, -1, rx79_fail
    jump $I10
  rx79_done:
    rx79_cur."!cursor_fail"()
    rx79_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx79_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1259779041.86401") :method
.annotate "line", 4
    new $P81, "ResizablePMCArray"
    push $P81, ""
    push $P81, ""
    push $P81, ""
    .return ($P81)
.end


.namespace ["NQP";"Grammar"]
.sub "_block85"  :anon :subid("25_1259779041.86401") :method :outer("23_1259779041.86401")
.annotate "line", 44
    .local string rx87_tgt
    .local int rx87_pos
    .local int rx87_off
    .local int rx87_eos
    .local int rx87_rep
    .local pmc rx87_cur
    (rx87_cur, rx87_pos, rx87_tgt) = self."!cursor_start"()
    rx87_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx87_cur
    .local pmc match
    .lex "$/", match
    length rx87_eos, rx87_tgt
    set rx87_off, 0
    lt rx87_pos, 2, rx87_start
    sub rx87_off, rx87_pos, 1
    substr rx87_tgt, rx87_tgt, rx87_off
  rx87_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan88_done
    goto rxscan88_scan
  rxscan88_loop:
    ($P10) = rx87_cur."from"()
    inc $P10
    set rx87_pos, $P10
    ge rx87_pos, rx87_eos, rxscan88_done
  rxscan88_scan:
    set_addr $I10, rxscan88_loop
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  rxscan88_done:
  # rx rxquantr89 ** 0..*
    set_addr $I90, rxquantr89_done
    rx87_cur."!mark_push"(0, rx87_pos, $I90)
  rxquantr89_loop:
  # rx enumcharlist negate=0 
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx87_fail
    inc rx87_pos
    (rx87_rep) = rx87_cur."!mark_commit"($I90)
    rx87_cur."!mark_push"(rx87_rep, rx87_pos, $I90)
    goto rxquantr89_loop
  rxquantr89_done:
  # rx literal  "="
    add $I11, rx87_pos, 1
    gt $I11, rx87_eos, rx87_fail
    sub $I11, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I11, 1
    ne $S10, "=", rx87_fail
    add rx87_pos, 1
  alt91_0:
    set_addr $I10, alt91_1
    rx87_cur."!mark_push"(0, rx87_pos, $I10)
  # rx charclass w
    ge rx87_pos, rx87_eos, rx87_fail
    sub $I10, rx87_pos, rx87_off
    is_cclass $I11, 8192, rx87_tgt, $I10
    unless $I11, rx87_fail
    inc rx87_pos
    goto alt91_end
  alt91_1:
  # rx literal  "\\"
    add $I11, rx87_pos, 1
    gt $I11, rx87_eos, rx87_fail
    sub $I11, rx87_pos, rx87_off
    substr $S10, rx87_tgt, $I11, 1
    ne $S10, "\\", rx87_fail
    add rx87_pos, 1
  alt91_end:
  # rx pass
    rx87_cur."!cursor_pass"(rx87_pos, "")
    rx87_cur."!cursor_debug"("PASS  ", "", " at pos=", rx87_pos)
    .return (rx87_cur)
  rx87_fail:
    (rx87_rep, rx87_pos, $I10, $P10) = rx87_cur."!mark_fail"(0)
    lt rx87_pos, -1, rx87_done
    eq rx87_pos, -1, rx87_fail
    jump $I10
  rx87_done:
    rx87_cur."!cursor_fail"()
    rx87_cur."!cursor_debug"("FAIL  ", "")
    .return (rx87_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1259779041.86401" 
    capture_lex $P131
    .local string rx97_tgt
    .local int rx97_pos
    .local int rx97_off
    .local int rx97_eos
    .local int rx97_rep
    .local pmc rx97_cur
    (rx97_cur, rx97_pos, rx97_tgt) = self."!cursor_start"()
    rx97_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx97_cur
    .local pmc match
    .lex "$/", match
    length rx97_eos, rx97_tgt
    set rx97_off, 0
    lt rx97_pos, 2, rx97_start
    sub rx97_off, rx97_pos, 1
    substr rx97_tgt, rx97_tgt, rx97_off
  rx97_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan100_done
    goto rxscan100_scan
  rxscan100_loop:
    ($P10) = rx97_cur."from"()
    inc $P10
    set rx97_pos, $P10
    ge rx97_pos, rx97_eos, rxscan100_done
  rxscan100_scan:
    set_addr $I10, rxscan100_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  rxscan100_done:
.annotate "line", 51
  # rxanchor bol
    eq rx97_pos, 0, rxanchor101_done
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    dec $I10
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
  rxanchor101_done:
  # rx rxquantr102 ** 0..*
    set_addr $I103, rxquantr102_done
    rx97_cur."!mark_push"(0, rx97_pos, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I103)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
  # rx literal  "="
    add $I11, rx97_pos, 1
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 1
    ne $S10, "=", rx97_fail
    add rx97_pos, 1
  alt104_0:
.annotate "line", 52
    set_addr $I10, alt104_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 53
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rx rxquantr105 ** 1..*
    set_addr $I106, rxquantr105_done
    rx97_cur."!mark_push"(0, -1, $I106)
  rxquantr105_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I106)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I106)
    goto rxquantr105_loop
  rxquantr105_done:
  # rx literal  "END"
    add $I11, rx97_pos, 3
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 3
    ne $S10, "END", rx97_fail
    add rx97_pos, 3
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  alt107_0:
.annotate "line", 54
    set_addr $I10, alt107_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx rxquantf108 ** 0..*
    set_addr $I10, rxquantf108_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf108_done
  rxquantf108_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf108_loop
    rx97_cur."!mark_push"($I109, rx97_pos, $I10)
  rxquantf108_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rx rxquantr110 ** 1..*
    set_addr $I111, rxquantr110_done
    rx97_cur."!mark_push"(0, -1, $I111)
  rxquantr110_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I111)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I111)
    goto rxquantr110_loop
  rxquantr110_done:
  # rx literal  "END"
    add $I11, rx97_pos, 3
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 3
    ne $S10, "END", rx97_fail
    add rx97_pos, 3
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt107_end
  alt107_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_not_cclass $I11, 65535, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
  alt107_end:
.annotate "line", 53
    goto alt104_end
  alt104_1:
    set_addr $I10, alt104_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 55
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rx rxquantr112 ** 1..*
    set_addr $I113, rxquantr112_done
    rx97_cur."!mark_push"(0, -1, $I113)
  rxquantr112_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I113)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I113)
    goto rxquantr112_loop
  rxquantr112_done:
  # rx subrule "identifier" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."identifier"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx97_pos = $P10."pos"()
  alt114_0:
.annotate "line", 56
    set_addr $I10, alt114_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 57
  # rx rxquantf115 ** 0..*
    set_addr $I10, rxquantf115_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf115_done
  rxquantf115_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf115_loop
    rx97_cur."!mark_push"($I116, rx97_pos, $I10)
  rxquantf115_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rx rxquantr117 ** 1..*
    set_addr $I118, rxquantr117_done
    rx97_cur."!mark_push"(0, -1, $I118)
  rxquantr117_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I118)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I118)
    goto rxquantr117_loop
  rxquantr117_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."!BACKREF"("identifier")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt114_end
  alt114_1:
.annotate "line", 58
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("=begin without matching =end")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt114_end:
.annotate "line", 55
    goto alt104_end
  alt104_2:
    set_addr $I10, alt104_3
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 60
  # rx literal  "begin"
    add $I11, rx97_pos, 5
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 5
    ne $S10, "begin", rx97_fail
    add rx97_pos, 5
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx rxquantr120 ** 0..*
    set_addr $I121, rxquantr120_done
    rx97_cur."!mark_push"(0, rx97_pos, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I121)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  alt122_0:
.annotate "line", 61
    set_addr $I10, alt122_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rxanchor eol
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    if $I11, rxanchor123_done
    ne rx97_pos, rx97_eos, rx97_fail
    eq rx97_pos, 0, rxanchor123_done
    dec $I10
    is_cclass $I11, 4096, rx97_tgt, $I10
    if $I11, rx97_fail
  rxanchor123_done:
    goto alt122_end
  alt122_1:
    set_addr $I10, alt122_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx literal  "#"
    add $I11, rx97_pos, 1
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 1
    ne $S10, "#", rx97_fail
    add rx97_pos, 1
    goto alt122_end
  alt122_2:
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt122_end:
  alt124_0:
.annotate "line", 62
    set_addr $I10, alt124_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
.annotate "line", 63
  # rx rxquantf125 ** 0..*
    set_addr $I10, rxquantf125_loop
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
    goto rxquantf125_done
  rxquantf125_loop:
  # rx charclass .
    ge rx97_pos, rx97_eos, rx97_fail
    inc rx97_pos
    set_addr $I10, rxquantf125_loop
    rx97_cur."!mark_push"($I126, rx97_pos, $I10)
  rxquantf125_done:
  # rx charclass nl
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 4096, rx97_tgt, $I10
    unless $I11, rx97_fail
    substr $S10, rx97_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx97_pos, $I11
    inc rx97_pos
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx97_cur."!mark_push"(0, rx97_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx97_fail
    inc rx97_pos
    (rx97_rep) = rx97_cur."!mark_commit"($I128)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  # rx literal  "=end"
    add $I11, rx97_pos, 4
    gt $I11, rx97_eos, rx97_fail
    sub $I11, rx97_pos, rx97_off
    substr $S10, rx97_tgt, $I11, 4
    ne $S10, "=end", rx97_fail
    add rx97_pos, 4
  # rxanchor rwb
    le rx97_pos, 0, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 8192, rx97_tgt, $I10
    if $I11, rx97_fail
    dec $I10
    is_cclass $I11, 8192, rx97_tgt, $I10
    unless $I11, rx97_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
    goto alt124_end
  alt124_1:
.annotate "line", 64
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("=begin without matching =end")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt124_end:
.annotate "line", 60
    goto alt104_end
  alt104_3:
.annotate "line", 68
  # rx rxquantr129 ** 0..1
    set_addr $I137, rxquantr129_done
    rx97_cur."!mark_push"(0, rx97_pos, $I137)
  rxquantr129_loop:
.annotate "line", 67
  # rx subrule "before" subtype=zerowidth negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    .const 'Sub' $P131 = "28_1259779041.86401" 
    capture_lex $P131
    $P10 = rx97_cur."before"($P131)
    unless $P10, rx97_fail
.annotate "line", 68
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
    (rx97_rep) = rx97_cur."!mark_commit"($I137)
  rxquantr129_done:
  alt138_0:
.annotate "line", 69
    set_addr $I10, alt138_1
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."alpha"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx97_pos = $P10."pos"()
    goto alt138_end
  alt138_1:
    set_addr $I10, alt138_2
    rx97_cur."!mark_push"(0, rx97_pos, $I10)
  # rx charclass s
    ge rx97_pos, rx97_eos, rx97_fail
    sub $I10, rx97_pos, rx97_off
    is_cclass $I11, 32, rx97_tgt, $I10
    unless $I11, rx97_fail
    inc rx97_pos
    goto alt138_end
  alt138_2:
  # rx subrule "panic" subtype=method negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."panic"("Illegal pod directive")
    unless $P10, rx97_fail
    rx97_pos = $P10."pos"()
  alt138_end:
.annotate "line", 70
  # rx charclass_q N r 0..-1
    sub $I10, rx97_pos, rx97_off
    find_cclass $I11, 4096, rx97_tgt, $I10, rx97_eos
    add rx97_pos, rx97_off, $I11
  alt104_end:
.annotate "line", 50
  # rx pass
    rx97_cur."!cursor_pass"(rx97_pos, "pod_comment")
    rx97_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx97_pos)
    .return (rx97_cur)
  rx97_fail:
.annotate "line", 4
    (rx97_rep, rx97_pos, $I10, $P10) = rx97_cur."!mark_fail"(0)
    lt rx97_pos, -1, rx97_done
    eq rx97_pos, -1, rx97_fail
    jump $I10
  rx97_done:
    rx97_cur."!cursor_fail"()
    rx97_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx97_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1259779041.86401") :method
.annotate "line", 4
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1259779041.86401") :method :outer("26_1259779041.86401")
.annotate "line", 67
    .local string rx132_tgt
    .local int rx132_pos
    .local int rx132_off
    .local int rx132_eos
    .local int rx132_rep
    .local pmc rx132_cur
    (rx132_cur, rx132_pos, rx132_tgt) = self."!cursor_start"()
    rx132_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx132_cur
    .local pmc match
    .lex "$/", match
    length rx132_eos, rx132_tgt
    set rx132_off, 0
    lt rx132_pos, 2, rx132_start
    sub rx132_off, rx132_pos, 1
    substr rx132_tgt, rx132_tgt, rx132_off
  rx132_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan133_done
    goto rxscan133_scan
  rxscan133_loop:
    ($P10) = rx132_cur."from"()
    inc $P10
    set rx132_pos, $P10
    ge rx132_pos, rx132_eos, rxscan133_done
  rxscan133_scan:
    set_addr $I10, rxscan133_loop
    rx132_cur."!mark_push"(0, rx132_pos, $I10)
  rxscan133_done:
  # rx rxquantf134 ** 0..*
    set_addr $I10, rxquantf134_loop
    rx132_cur."!mark_push"(0, rx132_pos, $I10)
    goto rxquantf134_done
  rxquantf134_loop:
  # rx charclass .
    ge rx132_pos, rx132_eos, rx132_fail
    inc rx132_pos
    set_addr $I10, rxquantf134_loop
    rx132_cur."!mark_push"($I135, rx132_pos, $I10)
  rxquantf134_done:
  # rxanchor bol
    eq rx132_pos, 0, rxanchor136_done
    ge rx132_pos, rx132_eos, rx132_fail
    sub $I10, rx132_pos, rx132_off
    dec $I10
    is_cclass $I11, 4096, rx132_tgt, $I10
    unless $I11, rx132_fail
  rxanchor136_done:
  # rx literal  "=cut"
    add $I11, rx132_pos, 4
    gt $I11, rx132_eos, rx132_fail
    sub $I11, rx132_pos, rx132_off
    substr $S10, rx132_tgt, $I11, 4
    ne $S10, "=cut", rx132_fail
    add rx132_pos, 4
  # rxanchor rwb
    le rx132_pos, 0, rx132_fail
    sub $I10, rx132_pos, rx132_off
    is_cclass $I11, 8192, rx132_tgt, $I10
    if $I11, rx132_fail
    dec $I10
    is_cclass $I11, 8192, rx132_tgt, $I10
    unless $I11, rx132_fail
  # rx pass
    rx132_cur."!cursor_pass"(rx132_pos, "")
    rx132_cur."!cursor_debug"("PASS  ", "", " at pos=", rx132_pos)
    .return (rx132_cur)
  rx132_fail:
    (rx132_rep, rx132_pos, $I10, $P10) = rx132_cur."!mark_fail"(0)
    lt rx132_pos, -1, rx132_done
    eq rx132_pos, -1, rx132_fail
    jump $I10
  rx132_done:
    rx132_cur."!cursor_fail"()
    rx132_cur."!cursor_debug"("FAIL  ", "")
    .return (rx132_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx140_tgt
    .local int rx140_pos
    .local int rx140_off
    .local int rx140_eos
    .local int rx140_rep
    .local pmc rx140_cur
    (rx140_cur, rx140_pos, rx140_tgt) = self."!cursor_start"()
    rx140_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx140_cur
    .local pmc match
    .lex "$/", match
    length rx140_eos, rx140_tgt
    set rx140_off, 0
    lt rx140_pos, 2, rx140_start
    sub rx140_off, rx140_pos, 1
    substr rx140_tgt, rx140_tgt, rx140_off
  rx140_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan144_done
    goto rxscan144_scan
  rxscan144_loop:
    ($P10) = rx140_cur."from"()
    inc $P10
    set rx140_pos, $P10
    ge rx140_pos, rx140_eos, rxscan144_done
  rxscan144_scan:
    set_addr $I10, rxscan144_loop
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  rxscan144_done:
.annotate "line", 78
  # rx subrule "newpad" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."newpad"()
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
.annotate "line", 79
  # rx subrule "statementlist" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."statementlist"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx140_pos = $P10."pos"()
  alt145_0:
.annotate "line", 80
    set_addr $I10, alt145_1
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rxanchor eos
    ne rx140_pos, rx140_eos, rx140_fail
    goto alt145_end
  alt145_1:
  # rx subrule "panic" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."panic"("Confused")
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
  alt145_end:
.annotate "line", 77
  # rx pass
    rx140_cur."!cursor_pass"(rx140_pos, "comp_unit")
    rx140_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx140_pos)
    .return (rx140_cur)
  rx140_fail:
.annotate "line", 4
    (rx140_rep, rx140_pos, $I10, $P10) = rx140_cur."!mark_fail"(0)
    lt rx140_pos, -1, rx140_done
    eq rx140_pos, -1, rx140_fail
    jump $I10
  rx140_done:
    rx140_cur."!cursor_fail"()
    rx140_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx140_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1259779041.86401") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "statementlist")
    rx147_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx147_cur
    .local pmc match
    .lex "$/", match
    length rx147_eos, rx147_tgt
    set rx147_off, 0
    lt rx147_pos, 2, rx147_start
    sub rx147_off, rx147_pos, 1
    substr rx147_tgt, rx147_tgt, rx147_off
  rx147_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan150_done
    goto rxscan150_scan
  rxscan150_loop:
    ($P10) = rx147_cur."from"()
    inc $P10
    set rx147_pos, $P10
    ge rx147_pos, rx147_eos, rxscan150_done
  rxscan150_scan:
    set_addr $I10, rxscan150_loop
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  rxscan150_done:
  alt151_0:
.annotate "line", 83
    set_addr $I10, alt151_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 84
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rxanchor eos
    ne rx147_pos, rx147_eos, rx147_fail
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
    goto alt151_end
  alt151_1:
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rx rxquantr155 ** 0..*
    set_addr $I157, rxquantr155_done
    rx147_cur."!mark_push"(0, rx147_pos, $I157)
  rxquantr155_loop:
  # rx subrule "statement" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."statement"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx147_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."eat_terminator"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
    (rx147_rep) = rx147_cur."!mark_commit"($I157)
    rx147_cur."!mark_push"(rx147_rep, rx147_pos, $I157)
    goto rxquantr155_loop
  rxquantr155_done:
  # rx subrule "ws" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."ws"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  alt151_end:
.annotate "line", 83
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "statementlist")
    rx147_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 4
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx147_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1259779041.86401") :method
.annotate "line", 4
    new $P149, "ResizablePMCArray"
    push $P149, ""
    push $P149, ""
    .return ($P149)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .const 'Sub' $P165 = "35_1259779041.86401" 
    capture_lex $P165
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "statement")
    rx160_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx160_cur
    .local pmc match
    .lex "$/", match
    length rx160_eos, rx160_tgt
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
.annotate "line", 89
  # rx subrule "before" subtype=zerowidth negate=1
    rx160_cur."!cursor_pos"(rx160_pos)
    .const 'Sub' $P165 = "35_1259779041.86401" 
    capture_lex $P165
    $P10 = rx160_cur."before"($P165)
    if $P10, rx160_fail
  alt169_0:
.annotate "line", 90
    set_addr $I10, alt169_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 91
  # rx subrule "statement_control" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_control"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx160_pos = $P10."pos"()
    goto alt169_end
  alt169_1:
.annotate "line", 92
  # rx subrule "EXPR" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."EXPR"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx160_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."ws"()
    unless $P10, rx160_fail
    rx160_pos = $P10."pos"()
.annotate "line", 96
  # rx rxquantr170 ** 0..1
    set_addr $I174, rxquantr170_done
    rx160_cur."!mark_push"(0, rx160_pos, $I174)
  rxquantr170_loop:
  alt171_0:
.annotate "line", 93
    set_addr $I10, alt171_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 94
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_cond"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx160_pos = $P10."pos"()
  # rx rxquantr172 ** 0..1
    set_addr $I173, rxquantr172_done
    rx160_cur."!mark_push"(0, rx160_pos, $I173)
  rxquantr172_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_loop"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx160_pos = $P10."pos"()
    (rx160_rep) = rx160_cur."!mark_commit"($I173)
  rxquantr172_done:
    goto alt171_end
  alt171_1:
.annotate "line", 95
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_loop"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx160_pos = $P10."pos"()
  alt171_end:
.annotate "line", 96
    (rx160_rep) = rx160_cur."!mark_commit"($I174)
  rxquantr170_done:
  alt169_end:
.annotate "line", 88
  # rx pass
    rx160_cur."!cursor_pass"(rx160_pos, "statement")
    rx160_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx160_pos)
    .return (rx160_cur)
  rx160_fail:
.annotate "line", 4
    (rx160_rep, rx160_pos, $I10, $P10) = rx160_cur."!mark_fail"(0)
    lt rx160_pos, -1, rx160_done
    eq rx160_pos, -1, rx160_fail
    jump $I10
  rx160_done:
    rx160_cur."!cursor_fail"()
    rx160_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1259779041.86401") :method
.annotate "line", 4
    new $P162, "ResizablePMCArray"
    push $P162, ""
    .return ($P162)
.end


.namespace ["NQP";"Grammar"]
.sub "_block164"  :anon :subid("35_1259779041.86401") :method :outer("33_1259779041.86401")
.annotate "line", 89
    .local string rx166_tgt
    .local int rx166_pos
    .local int rx166_off
    .local int rx166_eos
    .local int rx166_rep
    .local pmc rx166_cur
    (rx166_cur, rx166_pos, rx166_tgt) = self."!cursor_start"()
    rx166_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx166_cur
    .local pmc match
    .lex "$/", match
    length rx166_eos, rx166_tgt
    set rx166_off, 0
    lt rx166_pos, 2, rx166_start
    sub rx166_off, rx166_pos, 1
    substr rx166_tgt, rx166_tgt, rx166_off
  rx166_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan167_done
    goto rxscan167_scan
  rxscan167_loop:
    ($P10) = rx166_cur."from"()
    inc $P10
    set rx166_pos, $P10
    ge rx166_pos, rx166_eos, rxscan167_done
  rxscan167_scan:
    set_addr $I10, rxscan167_loop
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  rxscan167_done:
  alt168_0:
    set_addr $I10, alt168_1
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx166_pos, rx166_eos, rx166_fail
    sub $I10, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx166_fail
    inc rx166_pos
    goto alt168_end
  alt168_1:
  # rxanchor eos
    ne rx166_pos, rx166_eos, rx166_fail
  alt168_end:
  # rx pass
    rx166_cur."!cursor_pass"(rx166_pos, "")
    rx166_cur."!cursor_debug"("PASS  ", "", " at pos=", rx166_pos)
    .return (rx166_cur)
  rx166_fail:
    (rx166_rep, rx166_pos, $I10, $P10) = rx166_cur."!mark_fail"(0)
    lt rx166_pos, -1, rx166_done
    eq rx166_pos, -1, rx166_fail
    jump $I10
  rx166_done:
    rx166_cur."!cursor_fail"()
    rx166_cur."!cursor_debug"("FAIL  ", "")
    .return (rx166_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx176_tgt
    .local int rx176_pos
    .local int rx176_off
    .local int rx176_eos
    .local int rx176_rep
    .local pmc rx176_cur
    (rx176_cur, rx176_pos, rx176_tgt) = self."!cursor_start"()
    rx176_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx176_cur
    .local pmc match
    .lex "$/", match
    length rx176_eos, rx176_tgt
    set rx176_off, 0
    lt rx176_pos, 2, rx176_start
    sub rx176_off, rx176_pos, 1
    substr rx176_tgt, rx176_tgt, rx176_off
  rx176_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan179_done
    goto rxscan179_scan
  rxscan179_loop:
    ($P10) = rx176_cur."from"()
    inc $P10
    set rx176_pos, $P10
    ge rx176_pos, rx176_eos, rxscan179_done
  rxscan179_scan:
    set_addr $I10, rxscan179_loop
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  rxscan179_done:
  alt180_0:
.annotate "line", 100
    set_addr $I10, alt180_1
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 101
  # rx literal  ";"
    add $I11, rx176_pos, 1
    gt $I11, rx176_eos, rx176_fail
    sub $I11, rx176_pos, rx176_off
    substr $S10, rx176_tgt, $I11, 1
    ne $S10, ";", rx176_fail
    add rx176_pos, 1
    goto alt180_end
  alt180_1:
    set_addr $I10, alt180_2
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 102
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."MARKED"("endstmt")
    unless $P10, rx176_fail
    goto alt180_end
  alt180_2:
    set_addr $I10, alt180_3
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 103
  # rx subrule "terminator" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."terminator"()
    unless $P10, rx176_fail
    goto alt180_end
  alt180_3:
.annotate "line", 104
  # rxanchor eos
    ne rx176_pos, rx176_eos, rx176_fail
  alt180_end:
.annotate "line", 100
  # rx pass
    rx176_cur."!cursor_pass"(rx176_pos, "eat_terminator")
    rx176_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx176_pos)
    .return (rx176_cur)
  rx176_fail:
.annotate "line", 4
    (rx176_rep, rx176_pos, $I10, $P10) = rx176_cur."!mark_fail"(0)
    lt rx176_pos, -1, rx176_done
    eq rx176_pos, -1, rx176_fail
    jump $I10
  rx176_done:
    rx176_cur."!cursor_fail"()
    rx176_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1259779041.86401") :method
.annotate "line", 4
    new $P178, "ResizablePMCArray"
    push $P178, ""
    push $P178, ""
    push $P178, ""
    push $P178, ";"
    .return ($P178)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx182_tgt
    .local int rx182_pos
    .local int rx182_off
    .local int rx182_eos
    .local int rx182_rep
    .local pmc rx182_cur
    (rx182_cur, rx182_pos, rx182_tgt) = self."!cursor_start"()
    rx182_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx182_cur
    .local pmc match
    .lex "$/", match
    length rx182_eos, rx182_tgt
    set rx182_off, 0
    lt rx182_pos, 2, rx182_start
    sub rx182_off, rx182_pos, 1
    substr rx182_tgt, rx182_tgt, rx182_off
  rx182_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan186_done
    goto rxscan186_scan
  rxscan186_loop:
    ($P10) = rx182_cur."from"()
    inc $P10
    set rx182_pos, $P10
    ge rx182_pos, rx182_eos, rxscan186_done
  rxscan186_scan:
    set_addr $I10, rxscan186_loop
    rx182_cur."!mark_push"(0, rx182_pos, $I10)
  rxscan186_done:
.annotate "line", 108
  # rx subrule "EXPR" subtype=capture negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."EXPR"()
    unless $P10, rx182_fail
    rx182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx182_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."ws"()
    unless $P10, rx182_fail
    rx182_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."pblock"()
    unless $P10, rx182_fail
    rx182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx182_pos = $P10."pos"()
.annotate "line", 107
  # rx pass
    rx182_cur."!cursor_pass"(rx182_pos, "xblock")
    rx182_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx182_pos)
    .return (rx182_cur)
  rx182_fail:
.annotate "line", 4
    (rx182_rep, rx182_pos, $I10, $P10) = rx182_cur."!mark_fail"(0)
    lt rx182_pos, -1, rx182_done
    eq rx182_pos, -1, rx182_fail
    jump $I10
  rx182_done:
    rx182_cur."!cursor_fail"()
    rx182_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx182_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1259779041.86401") :method
.annotate "line", 4
    $P184 = self."!PREFIX__!subrule"("EXPR", "")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    set rx188_off, 0
    lt rx188_pos, 2, rx188_start
    sub rx188_off, rx188_pos, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan193_done
    goto rxscan193_scan
  rxscan193_loop:
    ($P10) = rx188_cur."from"()
    inc $P10
    set rx188_pos, $P10
    ge rx188_pos, rx188_eos, rxscan193_done
  rxscan193_scan:
    set_addr $I10, rxscan193_loop
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
  rxscan193_done:
  alt194_0:
.annotate "line", 111
    set_addr $I10, alt194_1
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 112
  # rx subrule "lambda" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."lambda"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 113
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "signature" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."signature"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx188_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 112
    goto alt194_end
  alt194_1:
    set_addr $I10, alt194_2
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 116
  # rx enumcharlist negate=0 zerowidth
    ge rx188_pos, rx188_eos, rx188_fail
    sub $I10, rx188_pos, rx188_off
    substr $S10, rx188_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx188_fail
.annotate "line", 117
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 118
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 116
    goto alt194_end
  alt194_2:
.annotate "line", 119
  # rx subrule "panic" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."panic"("Missing block")
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
  alt194_end:
.annotate "line", 111
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "pblock")
    rx188_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate "line", 4
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx188_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1259779041.86401") :method
.annotate "line", 4
    $P190 = self."!PREFIX__!subrule"("", "")
    $P191 = self."!PREFIX__!subrule"("", "")
    new $P192, "ResizablePMCArray"
    push $P192, $P190
    push $P192, "{"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt rx196_pos, 2, rx196_start
    sub rx196_off, rx196_pos, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan199_done
    goto rxscan199_scan
  rxscan199_loop:
    ($P10) = rx196_cur."from"()
    inc $P10
    set rx196_pos, $P10
    ge rx196_pos, rx196_eos, rxscan199_done
  rxscan199_scan:
    set_addr $I10, rxscan199_loop
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  rxscan199_done:
  alt200_0:
.annotate "line", 122
    set_addr $I10, alt200_1
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  # rx literal  "->"
    add $I11, rx196_pos, 2
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 2
    ne $S10, "->", rx196_fail
    add rx196_pos, 2
    goto alt200_end
  alt200_1:
  # rx literal  "<->"
    add $I11, rx196_pos, 3
    gt $I11, rx196_eos, rx196_fail
    sub $I11, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I11, 3
    ne $S10, "<->", rx196_fail
    add rx196_pos, 3
  alt200_end:
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "lambda")
    rx196_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 4
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx196_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1259779041.86401") :method
.annotate "line", 4
    new $P198, "ResizablePMCArray"
    push $P198, "<->"
    push $P198, "->"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    (rx202_cur, rx202_pos, rx202_tgt) = self."!cursor_start"()
    rx202_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx202_cur
    .local pmc match
    .lex "$/", match
    length rx202_eos, rx202_tgt
    set rx202_off, 0
    lt rx202_pos, 2, rx202_start
    sub rx202_off, rx202_pos, 1
    substr rx202_tgt, rx202_tgt, rx202_off
  rx202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx202_cur."from"()
    inc $P10
    set rx202_pos, $P10
    ge rx202_pos, rx202_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  rxscan206_done:
  alt207_0:
.annotate "line", 125
    set_addr $I10, alt207_1
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx202_pos, rx202_eos, rx202_fail
    sub $I10, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx202_fail
    goto alt207_end
  alt207_1:
  # rx subrule "panic" subtype=method negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."panic"("Missing block")
    unless $P10, rx202_fail
    rx202_pos = $P10."pos"()
  alt207_end:
.annotate "line", 126
  # rx subrule "newpad" subtype=method negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."newpad"()
    unless $P10, rx202_fail
    rx202_pos = $P10."pos"()
.annotate "line", 127
  # rx subrule "blockoid" subtype=capture negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."blockoid"()
    unless $P10, rx202_fail
    rx202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx202_pos = $P10."pos"()
.annotate "line", 124
  # rx pass
    rx202_cur."!cursor_pass"(rx202_pos, "block")
    rx202_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx202_pos)
    .return (rx202_cur)
  rx202_fail:
.annotate "line", 4
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    rx202_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx202_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1259779041.86401") :method
.annotate "line", 4
    $P204 = self."!PREFIX__!subrule"("", "")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    push $P205, "{"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt rx209_pos, 2, rx209_start
    sub rx209_off, rx209_pos, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan213_done
    goto rxscan213_scan
  rxscan213_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan213_done
  rxscan213_scan:
    set_addr $I10, rxscan213_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan213_done:
.annotate "line", 131
  # rx subrule "finishpad" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."finishpad"()
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
.annotate "line", 132
  # rx literal  "{"
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "{", rx209_fail
    add rx209_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."statementlist"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx209_pos = $P10."pos"()
  alt214_0:
    set_addr $I10, alt214_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx literal  "}"
    add $I11, rx209_pos, 1
    gt $I11, rx209_eos, rx209_fail
    sub $I11, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I11, 1
    ne $S10, "}", rx209_fail
    add rx209_pos, 1
    goto alt214_end
  alt214_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."FAILGOAL"("'}'")
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
  alt214_end:
.annotate "line", 133
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."ENDSTMT"()
    unless $P10, rx209_fail
.annotate "line", 130
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "blockoid")
    rx209_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 4
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1259779041.86401") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    set rx217_off, 0
    lt rx217_pos, 2, rx217_start
    sub rx217_off, rx217_pos, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan220_done
    goto rxscan220_scan
  rxscan220_loop:
    ($P10) = rx217_cur."from"()
    inc $P10
    set rx217_pos, $P10
    ge rx217_pos, rx217_eos, rxscan220_done
  rxscan220_scan:
    set_addr $I10, rxscan220_loop
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  rxscan220_done:
.annotate "line", 136
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "newpad")
    rx217_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate "line", 4
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx217_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1259779041.86401") :method
.annotate "line", 4
    new $P219, "ResizablePMCArray"
    push $P219, ""
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    (rx222_cur, rx222_pos, rx222_tgt) = self."!cursor_start"()
    rx222_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    set rx222_off, 0
    lt rx222_pos, 2, rx222_start
    sub rx222_off, rx222_pos, 1
    substr rx222_tgt, rx222_tgt, rx222_off
  rx222_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan225_done
    goto rxscan225_scan
  rxscan225_loop:
    ($P10) = rx222_cur."from"()
    inc $P10
    set rx222_pos, $P10
    ge rx222_pos, rx222_eos, rxscan225_done
  rxscan225_scan:
    set_addr $I10, rxscan225_loop
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  rxscan225_done:
.annotate "line", 137
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "finishpad")
    rx222_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx222_pos)
    .return (rx222_cur)
  rx222_fail:
.annotate "line", 4
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    rx222_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx222_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1259779041.86401") :method
.annotate "line", 4
    new $P224, "ResizablePMCArray"
    push $P224, ""
    .return ($P224)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1259779041.86401") :method
.annotate "line", 139
    $P227 = self."!protoregex"("terminator")
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1259779041.86401") :method
.annotate "line", 139
    $P229 = self."!PREFIX__!protoregex"("terminator")
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx231_tgt
    .local int rx231_pos
    .local int rx231_off
    .local int rx231_eos
    .local int rx231_rep
    .local pmc rx231_cur
    (rx231_cur, rx231_pos, rx231_tgt) = self."!cursor_start"()
    rx231_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx231_cur
    .local pmc match
    .lex "$/", match
    length rx231_eos, rx231_tgt
    set rx231_off, 0
    lt rx231_pos, 2, rx231_start
    sub rx231_off, rx231_pos, 1
    substr rx231_tgt, rx231_tgt, rx231_off
  rx231_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan234_done
    goto rxscan234_scan
  rxscan234_loop:
    ($P10) = rx231_cur."from"()
    inc $P10
    set rx231_pos, $P10
    ge rx231_pos, rx231_eos, rxscan234_done
  rxscan234_scan:
    set_addr $I10, rxscan234_loop
    rx231_cur."!mark_push"(0, rx231_pos, $I10)
  rxscan234_done:
.annotate "line", 141
  # rx enumcharlist negate=0 zerowidth
    ge rx231_pos, rx231_eos, rx231_fail
    sub $I10, rx231_pos, rx231_off
    substr $S10, rx231_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx231_fail
  # rx pass
    rx231_cur."!cursor_pass"(rx231_pos, "terminator:sym<;>")
    rx231_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx231_pos)
    .return (rx231_cur)
  rx231_fail:
.annotate "line", 4
    (rx231_rep, rx231_pos, $I10, $P10) = rx231_cur."!mark_fail"(0)
    lt rx231_pos, -1, rx231_done
    eq rx231_pos, -1, rx231_fail
    jump $I10
  rx231_done:
    rx231_cur."!cursor_fail"()
    rx231_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx231_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1259779041.86401") :method
.annotate "line", 4
    new $P233, "ResizablePMCArray"
    push $P233, ";"
    .return ($P233)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx236_tgt
    .local int rx236_pos
    .local int rx236_off
    .local int rx236_eos
    .local int rx236_rep
    .local pmc rx236_cur
    (rx236_cur, rx236_pos, rx236_tgt) = self."!cursor_start"()
    rx236_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx236_cur
    .local pmc match
    .lex "$/", match
    length rx236_eos, rx236_tgt
    set rx236_off, 0
    lt rx236_pos, 2, rx236_start
    sub rx236_off, rx236_pos, 1
    substr rx236_tgt, rx236_tgt, rx236_off
  rx236_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan239_done
    goto rxscan239_scan
  rxscan239_loop:
    ($P10) = rx236_cur."from"()
    inc $P10
    set rx236_pos, $P10
    ge rx236_pos, rx236_eos, rxscan239_done
  rxscan239_scan:
    set_addr $I10, rxscan239_loop
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
  rxscan239_done:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx236_pos, rx236_eos, rx236_fail
    sub $I10, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx236_fail
  # rx pass
    rx236_cur."!cursor_pass"(rx236_pos, "terminator:sym<}>")
    rx236_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx236_pos)
    .return (rx236_cur)
  rx236_fail:
.annotate "line", 4
    (rx236_rep, rx236_pos, $I10, $P10) = rx236_cur."!mark_fail"(0)
    lt rx236_pos, -1, rx236_done
    eq rx236_pos, -1, rx236_fail
    jump $I10
  rx236_done:
    rx236_cur."!cursor_fail"()
    rx236_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx236_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1259779041.86401") :method
.annotate "line", 4
    new $P238, "ResizablePMCArray"
    push $P238, "}"
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1259779041.86401") :method
.annotate "line", 146
    $P241 = self."!protoregex"("statement_control")
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1259779041.86401") :method
.annotate "line", 146
    $P243 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    (rx245_cur, rx245_pos, rx245_tgt) = self."!cursor_start"()
    rx245_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx245_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx245_cur
    .local pmc match
    .lex "$/", match
    length rx245_eos, rx245_tgt
    set rx245_off, 0
    lt rx245_pos, 2, rx245_start
    sub rx245_off, rx245_pos, 1
    substr rx245_tgt, rx245_tgt, rx245_off
  rx245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan248_done
    goto rxscan248_scan
  rxscan248_loop:
    ($P10) = rx245_cur."from"()
    inc $P10
    set rx245_pos, $P10
    ge rx245_pos, rx245_eos, rxscan248_done
  rxscan248_scan:
    set_addr $I10, rxscan248_loop
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  rxscan248_done:
.annotate "line", 149
  # rx subcapture "sym"
    set_addr $I10, rxcap_249_fail
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  # rx literal  "if"
    add $I11, rx245_pos, 2
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 2
    ne $S10, "if", rx245_fail
    add rx245_pos, 2
    set_addr $I10, rxcap_249_fail
    ($I12, $I11) = rx245_cur."!mark_peek"($I10)
    rx245_cur."!cursor_pos"($I11)
    ($P10) = rx245_cur."!cursor_start"()
    $P10."!cursor_pass"(rx245_pos, "")
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_249_done
  rxcap_249_fail:
    goto rx245_fail
  rxcap_249_done:
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 150
  # rx subrule "xblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."xblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 151
  # rx rxquantr252 ** 0..*
    set_addr $I256, rxquantr252_done
    rx245_cur."!mark_push"(0, rx245_pos, $I256)
  rxquantr252_loop:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx245_pos, 5
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 5
    ne $S10, "elsif", rx245_fail
    add rx245_pos, 5
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."xblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
    (rx245_rep) = rx245_cur."!mark_commit"($I256)
    rx245_cur."!mark_push"(rx245_rep, rx245_pos, $I256)
    goto rxquantr252_loop
  rxquantr252_done:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr258 ** 0..1
    set_addr $I262, rxquantr258_done
    rx245_cur."!mark_push"(0, rx245_pos, $I262)
  rxquantr258_loop:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx245_pos, 4
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 4
    ne $S10, "else", rx245_fail
    add rx245_pos, 4
  # rx charclass s
    ge rx245_pos, rx245_eos, rx245_fail
    sub $I10, rx245_pos, rx245_off
    is_cclass $I11, 32, rx245_tgt, $I10
    unless $I11, rx245_fail
    inc rx245_pos
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."pblock"()
    unless $P10, rx245_fail
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx245_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
    (rx245_rep) = rx245_cur."!mark_commit"($I262)
  rxquantr258_done:
  # rx subrule "ws" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."ws"()
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
.annotate "line", 148
  # rx pass
    rx245_cur."!cursor_pass"(rx245_pos, "statement_control:sym<if>")
    rx245_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx245_pos)
    .return (rx245_cur)
  rx245_fail:
.annotate "line", 4
    (rx245_rep, rx245_pos, $I10, $P10) = rx245_cur."!mark_fail"(0)
    lt rx245_pos, -1, rx245_done
    eq rx245_pos, -1, rx245_fail
    jump $I10
  rx245_done:
    rx245_cur."!cursor_fail"()
    rx245_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx245_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1259779041.86401") :method
.annotate "line", 4
    new $P247, "ResizablePMCArray"
    push $P247, "if"
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .const 'Sub' $P275 = "64_1259779041.86401" 
    capture_lex $P275
    .local string rx265_tgt
    .local int rx265_pos
    .local int rx265_off
    .local int rx265_eos
    .local int rx265_rep
    .local pmc rx265_cur
    (rx265_cur, rx265_pos, rx265_tgt) = self."!cursor_start"()
    rx265_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx265_cur
    .local pmc match
    .lex "$/", match
    length rx265_eos, rx265_tgt
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
.annotate "line", 156
  # rx subcapture "sym"
    set_addr $I10, rxcap_269_fail
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx literal  "unless"
    add $I11, rx265_pos, 6
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 6
    ne $S10, "unless", rx265_fail
    add rx265_pos, 6
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
.annotate "line", 157
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
  alt272_0:
.annotate "line", 158
    set_addr $I10, alt272_1
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx265_cur."!cursor_pos"(rx265_pos)
    .const 'Sub' $P275 = "64_1259779041.86401" 
    capture_lex $P275
    $P10 = rx265_cur."before"($P275)
    if $P10, rx265_fail
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
    goto alt272_end
  alt272_1:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  alt272_end:
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
.annotate "line", 155
  # rx pass
    rx265_cur."!cursor_pass"(rx265_pos, "statement_control:sym<unless>")
    rx265_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx265_pos)
    .return (rx265_cur)
  rx265_fail:
.annotate "line", 4
    (rx265_rep, rx265_pos, $I10, $P10) = rx265_cur."!mark_fail"(0)
    lt rx265_pos, -1, rx265_done
    eq rx265_pos, -1, rx265_fail
    jump $I10
  rx265_done:
    rx265_cur."!cursor_fail"()
    rx265_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx265_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1259779041.86401") :method
.annotate "line", 4
    new $P267, "ResizablePMCArray"
    push $P267, "unless"
    .return ($P267)
.end


.namespace ["NQP";"Grammar"]
.sub "_block274"  :anon :subid("64_1259779041.86401") :method :outer("62_1259779041.86401")
.annotate "line", 158
    .local string rx276_tgt
    .local int rx276_pos
    .local int rx276_off
    .local int rx276_eos
    .local int rx276_rep
    .local pmc rx276_cur
    (rx276_cur, rx276_pos, rx276_tgt) = self."!cursor_start"()
    rx276_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx276_cur
    .local pmc match
    .lex "$/", match
    length rx276_eos, rx276_tgt
    set rx276_off, 0
    lt rx276_pos, 2, rx276_start
    sub rx276_off, rx276_pos, 1
    substr rx276_tgt, rx276_tgt, rx276_off
  rx276_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan277_done
    goto rxscan277_scan
  rxscan277_loop:
    ($P10) = rx276_cur."from"()
    inc $P10
    set rx276_pos, $P10
    ge rx276_pos, rx276_eos, rxscan277_done
  rxscan277_scan:
    set_addr $I10, rxscan277_loop
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  rxscan277_done:
  # rx literal  "else"
    add $I11, rx276_pos, 4
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 4
    ne $S10, "else", rx276_fail
    add rx276_pos, 4
  # rx pass
    rx276_cur."!cursor_pass"(rx276_pos, "")
    rx276_cur."!cursor_debug"("PASS  ", "", " at pos=", rx276_pos)
    .return (rx276_cur)
  rx276_fail:
    (rx276_rep, rx276_pos, $I10, $P10) = rx276_cur."!mark_fail"(0)
    lt rx276_pos, -1, rx276_done
    eq rx276_pos, -1, rx276_fail
    jump $I10
  rx276_done:
    rx276_cur."!cursor_fail"()
    rx276_cur."!cursor_debug"("FAIL  ", "")
    .return (rx276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
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
.annotate "line", 162
  # rx subcapture "sym"
    set_addr $I10, rxcap_288_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  alt287_0:
    set_addr $I10, alt287_1
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx literal  "while"
    add $I11, rx283_pos, 5
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 5
    ne $S10, "while", rx283_fail
    add rx283_pos, 5
    goto alt287_end
  alt287_1:
  # rx literal  "until"
    add $I11, rx283_pos, 5
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 5
    ne $S10, "until", rx283_fail
    add rx283_pos, 5
  alt287_end:
    set_addr $I10, rxcap_288_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_288_done
  rxcap_288_fail:
    goto rx283_fail
  rxcap_288_done:
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
.annotate "line", 163
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
.annotate "line", 161
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "statement_control:sym<while>")
    rx283_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
.annotate "line", 4
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1259779041.86401") :method
.annotate "line", 4
    new $P285, "ResizablePMCArray"
    push $P285, "until"
    push $P285, "while"
    .return ($P285)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx292_tgt
    .local int rx292_pos
    .local int rx292_off
    .local int rx292_eos
    .local int rx292_rep
    .local pmc rx292_cur
    (rx292_cur, rx292_pos, rx292_tgt) = self."!cursor_start"()
    rx292_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
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
    ne $I10, -1, rxscan295_done
    goto rxscan295_scan
  rxscan295_loop:
    ($P10) = rx292_cur."from"()
    inc $P10
    set rx292_pos, $P10
    ge rx292_pos, rx292_eos, rxscan295_done
  rxscan295_scan:
    set_addr $I10, rxscan295_loop
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  rxscan295_done:
.annotate "line", 167
  # rx subcapture "sym"
    set_addr $I10, rxcap_296_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx292_pos, 6
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 6
    ne $S10, "repeat", rx292_fail
    add rx292_pos, 6
    set_addr $I10, rxcap_296_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_296_done
  rxcap_296_fail:
    goto rx292_fail
  rxcap_296_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  alt298_0:
.annotate "line", 168
    set_addr $I10, alt298_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
.annotate "line", 169
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_301_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  alt300_0:
    set_addr $I10, alt300_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "while"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "while", rx292_fail
    add rx292_pos, 5
    goto alt300_end
  alt300_1:
  # rx literal  "until"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "until", rx292_fail
    add rx292_pos, 5
  alt300_end:
    set_addr $I10, rxcap_301_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_301_done
  rxcap_301_fail:
    goto rx292_fail
  rxcap_301_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."xblock"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
    goto alt298_end
  alt298_1:
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."pblock"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_307_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  alt306_0:
    set_addr $I10, alt306_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "while"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "while", rx292_fail
    add rx292_pos, 5
    goto alt306_end
  alt306_1:
  # rx literal  "until"
    add $I11, rx292_pos, 5
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 5
    ne $S10, "until", rx292_fail
    add rx292_pos, 5
  alt306_end:
    set_addr $I10, rxcap_307_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_307_done
  rxcap_307_fail:
    goto rx292_fail
  rxcap_307_done:
  # rx charclass s
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    is_cclass $I11, 32, rx292_tgt, $I10
    unless $I11, rx292_fail
    inc rx292_pos
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."EXPR"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx292_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  alt298_end:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
.annotate "line", 166
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "statement_control:sym<repeat>")
    rx292_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx292_pos)
    .return (rx292_cur)
  rx292_fail:
.annotate "line", 4
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    rx292_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx292_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1259779041.86401") :method
.annotate "line", 4
    new $P294, "ResizablePMCArray"
    push $P294, "repeat"
    .return ($P294)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx312_tgt
    .local int rx312_pos
    .local int rx312_off
    .local int rx312_eos
    .local int rx312_rep
    .local pmc rx312_cur
    (rx312_cur, rx312_pos, rx312_tgt) = self."!cursor_start"()
    rx312_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx312_cur
    .local pmc match
    .lex "$/", match
    length rx312_eos, rx312_tgt
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
.annotate "line", 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_316_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx literal  "for"
    add $I11, rx312_pos, 3
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 3
    ne $S10, "for", rx312_fail
    add rx312_pos, 3
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
.annotate "line", 176
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
.annotate "line", 174
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "statement_control:sym<for>")
    rx312_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate "line", 4
    (rx312_rep, rx312_pos, $I10, $P10) = rx312_cur."!mark_fail"(0)
    lt rx312_pos, -1, rx312_done
    eq rx312_pos, -1, rx312_fail
    jump $I10
  rx312_done:
    rx312_cur."!cursor_fail"()
    rx312_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx312_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1259779041.86401") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, "for"
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx320_tgt
    .local int rx320_pos
    .local int rx320_off
    .local int rx320_eos
    .local int rx320_rep
    .local pmc rx320_cur
    (rx320_cur, rx320_pos, rx320_tgt) = self."!cursor_start"()
    rx320_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx320_cur
    .local pmc match
    .lex "$/", match
    length rx320_eos, rx320_tgt
    set rx320_off, 0
    lt rx320_pos, 2, rx320_start
    sub rx320_off, rx320_pos, 1
    substr rx320_tgt, rx320_tgt, rx320_off
  rx320_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan323_done
    goto rxscan323_scan
  rxscan323_loop:
    ($P10) = rx320_cur."from"()
    inc $P10
    set rx320_pos, $P10
    ge rx320_pos, rx320_eos, rxscan323_done
  rxscan323_scan:
    set_addr $I10, rxscan323_loop
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  rxscan323_done:
.annotate "line", 180
  # rx subcapture "sym"
    set_addr $I10, rxcap_324_fail
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx320_pos, 5
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    substr $S10, rx320_tgt, $I11, 5
    ne $S10, "CATCH", rx320_fail
    add rx320_pos, 5
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx320_cur."!mark_peek"($I10)
    rx320_cur."!cursor_pos"($I11)
    ($P10) = rx320_cur."!cursor_start"()
    $P10."!cursor_pass"(rx320_pos, "")
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx320_fail
  rxcap_324_done:
  # rx charclass s
    ge rx320_pos, rx320_eos, rx320_fail
    sub $I10, rx320_pos, rx320_off
    is_cclass $I11, 32, rx320_tgt, $I10
    unless $I11, rx320_fail
    inc rx320_pos
  # rx subrule "ws" subtype=method negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."ws"()
    unless $P10, rx320_fail
    rx320_pos = $P10."pos"()
.annotate "line", 181
  # rx subrule "block" subtype=capture negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."block"()
    unless $P10, rx320_fail
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx320_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."ws"()
    unless $P10, rx320_fail
    rx320_pos = $P10."pos"()
.annotate "line", 179
  # rx pass
    rx320_cur."!cursor_pass"(rx320_pos, "statement_control:sym<CATCH>")
    rx320_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx320_pos)
    .return (rx320_cur)
  rx320_fail:
.annotate "line", 4
    (rx320_rep, rx320_pos, $I10, $P10) = rx320_cur."!mark_fail"(0)
    lt rx320_pos, -1, rx320_done
    eq rx320_pos, -1, rx320_fail
    jump $I10
  rx320_done:
    rx320_cur."!cursor_fail"()
    rx320_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx320_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1259779041.86401") :method
.annotate "line", 4
    new $P322, "ResizablePMCArray"
    push $P322, "CATCH"
    .return ($P322)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
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
.annotate "line", 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_332_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx328_pos, 7
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 7
    ne $S10, "CONTROL", rx328_fail
    add rx328_pos, 7
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
.annotate "line", 186
  # rx subrule "block" subtype=capture negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."block"()
    unless $P10, rx328_fail
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx328_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
.annotate "line", 184
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "statement_control:sym<CONTROL>")
    rx328_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate "line", 4
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx328_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1259779041.86401") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "CONTROL"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1259779041.86401") :method
.annotate "line", 189
    $P336 = self."!protoregex"("statement_prefix")
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1259779041.86401") :method
.annotate "line", 189
    $P338 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    set rx340_off, 0
    lt rx340_pos, 2, rx340_start
    sub rx340_off, rx340_pos, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan344_done
    goto rxscan344_scan
  rxscan344_loop:
    ($P10) = rx340_cur."from"()
    inc $P10
    set rx340_pos, $P10
    ge rx340_pos, rx340_eos, rxscan344_done
  rxscan344_scan:
    set_addr $I10, rxscan344_loop
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  rxscan344_done:
.annotate "line", 190
  # rx subcapture "sym"
    set_addr $I10, rxcap_345_fail
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx340_pos, 4
    gt $I11, rx340_eos, rx340_fail
    sub $I11, rx340_pos, rx340_off
    substr $S10, rx340_tgt, $I11, 4
    ne $S10, "INIT", rx340_fail
    add rx340_pos, 4
    set_addr $I10, rxcap_345_fail
    ($I12, $I11) = rx340_cur."!mark_peek"($I10)
    rx340_cur."!cursor_pos"($I11)
    ($P10) = rx340_cur."!cursor_start"()
    $P10."!cursor_pass"(rx340_pos, "")
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_345_done
  rxcap_345_fail:
    goto rx340_fail
  rxcap_345_done:
  # rx subrule "blorst" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."blorst"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx340_pos = $P10."pos"()
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "statement_prefix:sym<INIT>")
    rx340_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate "line", 4
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1259779041.86401") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    (rx347_cur, rx347_pos, rx347_tgt) = self."!cursor_start"()
    rx347_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx347_cur
    .local pmc match
    .lex "$/", match
    length rx347_eos, rx347_tgt
    set rx347_off, 0
    lt rx347_pos, 2, rx347_start
    sub rx347_off, rx347_pos, 1
    substr rx347_tgt, rx347_tgt, rx347_off
  rx347_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan351_done
    goto rxscan351_scan
  rxscan351_loop:
    ($P10) = rx347_cur."from"()
    inc $P10
    set rx347_pos, $P10
    ge rx347_pos, rx347_eos, rxscan351_done
  rxscan351_scan:
    set_addr $I10, rxscan351_loop
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  rxscan351_done:
.annotate "line", 193
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx literal  "try"
    add $I11, rx347_pos, 3
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    substr $S10, rx347_tgt, $I11, 3
    ne $S10, "try", rx347_fail
    add rx347_pos, 3
    set_addr $I10, rxcap_352_fail
    ($I12, $I11) = rx347_cur."!mark_peek"($I10)
    rx347_cur."!cursor_pos"($I11)
    ($P10) = rx347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx347_pos, "")
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_352_done
  rxcap_352_fail:
    goto rx347_fail
  rxcap_352_done:
.annotate "line", 194
  # rx subrule "blorst" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."blorst"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx347_pos = $P10."pos"()
.annotate "line", 192
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "statement_prefix:sym<try>")
    rx347_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx347_pos)
    .return (rx347_cur)
  rx347_fail:
.annotate "line", 4
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    rx347_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx347_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1259779041.86401") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("blorst", "try")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx354_tgt
    .local int rx354_pos
    .local int rx354_off
    .local int rx354_eos
    .local int rx354_rep
    .local pmc rx354_cur
    (rx354_cur, rx354_pos, rx354_tgt) = self."!cursor_start"()
    rx354_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx354_cur
    .local pmc match
    .lex "$/", match
    length rx354_eos, rx354_tgt
    set rx354_off, 0
    lt rx354_pos, 2, rx354_start
    sub rx354_off, rx354_pos, 1
    substr rx354_tgt, rx354_tgt, rx354_off
  rx354_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan357_done
    goto rxscan357_scan
  rxscan357_loop:
    ($P10) = rx354_cur."from"()
    inc $P10
    set rx354_pos, $P10
    ge rx354_pos, rx354_eos, rxscan357_done
  rxscan357_scan:
    set_addr $I10, rxscan357_loop
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  rxscan357_done:
.annotate "line", 198
  # rx charclass s
    ge rx354_pos, rx354_eos, rx354_fail
    sub $I10, rx354_pos, rx354_off
    is_cclass $I11, 32, rx354_tgt, $I10
    unless $I11, rx354_fail
    inc rx354_pos
  # rx subrule "ws" subtype=method negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."ws"()
    unless $P10, rx354_fail
    rx354_pos = $P10."pos"()
  alt358_0:
    set_addr $I10, alt358_1
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx354_pos, rx354_eos, rx354_fail
    sub $I10, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx354_fail
  # rx subrule "block" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."block"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx354_pos = $P10."pos"()
    goto alt358_end
  alt358_1:
  # rx subrule "statement" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."statement"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx354_pos = $P10."pos"()
  alt358_end:
.annotate "line", 197
  # rx pass
    rx354_cur."!cursor_pass"(rx354_pos, "blorst")
    rx354_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx354_pos)
    .return (rx354_cur)
  rx354_fail:
.annotate "line", 4
    (rx354_rep, rx354_pos, $I10, $P10) = rx354_cur."!mark_fail"(0)
    lt rx354_pos, -1, rx354_done
    eq rx354_pos, -1, rx354_fail
    jump $I10
  rx354_done:
    rx354_cur."!cursor_fail"()
    rx354_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx354_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1259779041.86401") :method
.annotate "line", 4
    new $P356, "ResizablePMCArray"
    push $P356, ""
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1259779041.86401") :method
.annotate "line", 203
    $P360 = self."!protoregex"("statement_mod_cond")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1259779041.86401") :method
.annotate "line", 203
    $P362 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P362)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx364_tgt
    .local int rx364_pos
    .local int rx364_off
    .local int rx364_eos
    .local int rx364_rep
    .local pmc rx364_cur
    (rx364_cur, rx364_pos, rx364_tgt) = self."!cursor_start"()
    rx364_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx364_cur
    .local pmc match
    .lex "$/", match
    length rx364_eos, rx364_tgt
    set rx364_off, 0
    lt rx364_pos, 2, rx364_start
    sub rx364_off, rx364_pos, 1
    substr rx364_tgt, rx364_tgt, rx364_off
  rx364_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan367_done
    goto rxscan367_scan
  rxscan367_loop:
    ($P10) = rx364_cur."from"()
    inc $P10
    set rx364_pos, $P10
    ge rx364_pos, rx364_eos, rxscan367_done
  rxscan367_scan:
    set_addr $I10, rxscan367_loop
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  rxscan367_done:
.annotate "line", 205
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx literal  "if"
    add $I11, rx364_pos, 2
    gt $I11, rx364_eos, rx364_fail
    sub $I11, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I11, 2
    ne $S10, "if", rx364_fail
    add rx364_pos, 2
    set_addr $I10, rxcap_368_fail
    ($I12, $I11) = rx364_cur."!mark_peek"($I10)
    rx364_cur."!cursor_pos"($I11)
    ($P10) = rx364_cur."!cursor_start"()
    $P10."!cursor_pass"(rx364_pos, "")
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_368_done
  rxcap_368_fail:
    goto rx364_fail
  rxcap_368_done:
  # rx subrule "ws" subtype=method negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."ws"()
    unless $P10, rx364_fail
    rx364_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."EXPR"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx364_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."ws"()
    unless $P10, rx364_fail
    rx364_pos = $P10."pos"()
  # rx pass
    rx364_cur."!cursor_pass"(rx364_pos, "statement_mod_cond:sym<if>")
    rx364_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx364_pos)
    .return (rx364_cur)
  rx364_fail:
.annotate "line", 4
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    rx364_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx364_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1259779041.86401") :method
.annotate "line", 4
    new $P366, "ResizablePMCArray"
    push $P366, "if"
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt) = self."!cursor_start"()
    rx372_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx372_cur
    .local pmc match
    .lex "$/", match
    length rx372_eos, rx372_tgt
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
.annotate "line", 206
  # rx subcapture "sym"
    set_addr $I10, rxcap_376_fail
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx literal  "unless"
    add $I11, rx372_pos, 6
    gt $I11, rx372_eos, rx372_fail
    sub $I11, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I11, 6
    ne $S10, "unless", rx372_fail
    add rx372_pos, 6
    set_addr $I10, rxcap_376_fail
    ($I12, $I11) = rx372_cur."!mark_peek"($I10)
    rx372_cur."!cursor_pos"($I11)
    ($P10) = rx372_cur."!cursor_start"()
    $P10."!cursor_pass"(rx372_pos, "")
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_376_done
  rxcap_376_fail:
    goto rx372_fail
  rxcap_376_done:
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
  rx372_fail:
.annotate "line", 4
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1259779041.86401") :method
.annotate "line", 4
    new $P374, "ResizablePMCArray"
    push $P374, "unless"
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1259779041.86401") :method
.annotate "line", 208
    $P380 = self."!protoregex"("statement_mod_loop")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1259779041.86401") :method
.annotate "line", 208
    $P382 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx384_cur
    .local pmc match
    .lex "$/", match
    length rx384_eos, rx384_tgt
    set rx384_off, 0
    lt rx384_pos, 2, rx384_start
    sub rx384_off, rx384_pos, 1
    substr rx384_tgt, rx384_tgt, rx384_off
  rx384_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan387_done
    goto rxscan387_scan
  rxscan387_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan387_done
  rxscan387_scan:
    set_addr $I10, rxscan387_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan387_done:
.annotate "line", 210
  # rx subcapture "sym"
    set_addr $I10, rxcap_388_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx literal  "while"
    add $I11, rx384_pos, 5
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 5
    ne $S10, "while", rx384_fail
    add rx384_pos, 5
    set_addr $I10, rxcap_388_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_388_done
  rxcap_388_fail:
    goto rx384_fail
  rxcap_388_done:
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
    rx384_cur."!cursor_pass"(rx384_pos, "statement_mod_loop:sym<while>")
    rx384_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate "line", 4
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1259779041.86401") :method
.annotate "line", 4
    new $P386, "ResizablePMCArray"
    push $P386, "while"
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx392_tgt
    .local int rx392_pos
    .local int rx392_off
    .local int rx392_eos
    .local int rx392_rep
    .local pmc rx392_cur
    (rx392_cur, rx392_pos, rx392_tgt) = self."!cursor_start"()
    rx392_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx392_cur
    .local pmc match
    .lex "$/", match
    length rx392_eos, rx392_tgt
    set rx392_off, 0
    lt rx392_pos, 2, rx392_start
    sub rx392_off, rx392_pos, 1
    substr rx392_tgt, rx392_tgt, rx392_off
  rx392_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan395_done
    goto rxscan395_scan
  rxscan395_loop:
    ($P10) = rx392_cur."from"()
    inc $P10
    set rx392_pos, $P10
    ge rx392_pos, rx392_eos, rxscan395_done
  rxscan395_scan:
    set_addr $I10, rxscan395_loop
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  rxscan395_done:
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_396_fail
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  # rx literal  "until"
    add $I11, rx392_pos, 5
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 5
    ne $S10, "until", rx392_fail
    add rx392_pos, 5
    set_addr $I10, rxcap_396_fail
    ($I12, $I11) = rx392_cur."!mark_peek"($I10)
    rx392_cur."!cursor_pos"($I11)
    ($P10) = rx392_cur."!cursor_start"()
    $P10."!cursor_pass"(rx392_pos, "")
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_396_done
  rxcap_396_fail:
    goto rx392_fail
  rxcap_396_done:
  # rx subrule "ws" subtype=method negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."ws"()
    unless $P10, rx392_fail
    rx392_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."EXPR"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx392_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."ws"()
    unless $P10, rx392_fail
    rx392_pos = $P10."pos"()
  # rx pass
    rx392_cur."!cursor_pass"(rx392_pos, "statement_mod_loop:sym<until>")
    rx392_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx392_pos)
    .return (rx392_cur)
  rx392_fail:
.annotate "line", 4
    (rx392_rep, rx392_pos, $I10, $P10) = rx392_cur."!mark_fail"(0)
    lt rx392_pos, -1, rx392_done
    eq rx392_pos, -1, rx392_fail
    jump $I10
  rx392_done:
    rx392_cur."!cursor_fail"()
    rx392_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx392_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1259779041.86401") :method
.annotate "line", 4
    new $P394, "ResizablePMCArray"
    push $P394, "until"
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("95_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
    ne $I10, -1, rxscan404_done
    goto rxscan404_scan
  rxscan404_loop:
    ($P10) = rx400_cur."from"()
    inc $P10
    set rx400_pos, $P10
    ge rx400_pos, rx400_eos, rxscan404_done
  rxscan404_scan:
    set_addr $I10, rxscan404_loop
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  rxscan404_done:
.annotate "line", 215
  # rx subrule "colonpair" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."colonpair"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "term:sym<colonpair>")
    rx400_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate "line", 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("96_1259779041.86401") :method
.annotate "line", 4
    $P402 = self."!PREFIX__!subrule"("colonpair", "")
    new $P403, "ResizablePMCArray"
    push $P403, $P402
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("97_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx406_cur
    .local pmc match
    .lex "$/", match
    length rx406_eos, rx406_tgt
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
.annotate "line", 216
  # rx subrule "variable" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."variable"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "term:sym<variable>")
    rx406_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("98_1259779041.86401") :method
.annotate "line", 4
    $P408 = self."!PREFIX__!subrule"("variable", "")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("99_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt) = self."!cursor_start"()
    rx412_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx412_cur
    .local pmc match
    .lex "$/", match
    length rx412_eos, rx412_tgt
    set rx412_off, 0
    lt rx412_pos, 2, rx412_start
    sub rx412_off, rx412_pos, 1
    substr rx412_tgt, rx412_tgt, rx412_off
  rx412_start:
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
.annotate "line", 217
  # rx subrule "package_declarator" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."package_declarator"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<package_declarator>")
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_fail:
.annotate "line", 4
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("100_1259779041.86401") :method
.annotate "line", 4
    $P414 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("101_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
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
.annotate "line", 218
  # rx subrule "scope_declarator" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."scope_declarator"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<scope_declarator>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("102_1259779041.86401") :method
.annotate "line", 4
    $P420 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("103_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx424_cur
    .local pmc match
    .lex "$/", match
    length rx424_eos, rx424_tgt
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
.annotate "line", 219
  # rx subrule "routine_declarator" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."routine_declarator"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<routine_declarator>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate "line", 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("104_1259779041.86401") :method
.annotate "line", 4
    $P426 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("105_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx430_cur
    .local pmc match
    .lex "$/", match
    length rx430_eos, rx430_tgt
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
.annotate "line", 220
  # rx subrule "regex_declarator" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."regex_declarator"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<regex_declarator>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate "line", 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("106_1259779041.86401") :method
.annotate "line", 4
    $P432 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("107_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx436_cur
    .local pmc match
    .lex "$/", match
    length rx436_eos, rx436_tgt
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
.annotate "line", 221
  # rx subrule "statement_prefix" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."statement_prefix"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<statement_prefix>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate "line", 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("108_1259779041.86401") :method
.annotate "line", 4
    $P438 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("109_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    set rx442_off, 0
    lt rx442_pos, 2, rx442_start
    sub rx442_off, rx442_pos, 1
    substr rx442_tgt, rx442_tgt, rx442_off
  rx442_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan445_done
    goto rxscan445_scan
  rxscan445_loop:
    ($P10) = rx442_cur."from"()
    inc $P10
    set rx442_pos, $P10
    ge rx442_pos, rx442_eos, rxscan445_done
  rxscan445_scan:
    set_addr $I10, rxscan445_loop
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  rxscan445_done:
.annotate "line", 222
  # rx subrule "lambda" subtype=zerowidth negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."lambda"()
    unless $P10, rx442_fail
  # rx subrule "pblock" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."pblock"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<lambda>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate "line", 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("110_1259779041.86401") :method
.annotate "line", 4
    new $P444, "ResizablePMCArray"
    push $P444, ""
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("111_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "colonpair")
    rx447_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx447_cur
    .local pmc match
    .lex "$/", match
    length rx447_eos, rx447_tgt
    set rx447_off, 0
    lt rx447_pos, 2, rx447_start
    sub rx447_off, rx447_pos, 1
    substr rx447_tgt, rx447_tgt, rx447_off
  rx447_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan453_done
    goto rxscan453_scan
  rxscan453_loop:
    ($P10) = rx447_cur."from"()
    inc $P10
    set rx447_pos, $P10
    ge rx447_pos, rx447_eos, rxscan453_done
  rxscan453_scan:
    set_addr $I10, rxscan453_loop
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  rxscan453_done:
.annotate "line", 225
  # rx literal  ":"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 1
    ne $S10, ":", rx447_fail
    add rx447_pos, 1
  alt454_0:
.annotate "line", 226
    set_addr $I10, alt454_1
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
.annotate "line", 227
  # rx subcapture "not"
    set_addr $I10, rxcap_455_fail
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  # rx literal  "!"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 1
    ne $S10, "!", rx447_fail
    add rx447_pos, 1
    set_addr $I10, rxcap_455_fail
    ($I12, $I11) = rx447_cur."!mark_peek"($I10)
    rx447_cur."!cursor_pos"($I11)
    ($P10) = rx447_cur."!cursor_start"()
    $P10."!cursor_pass"(rx447_pos, "")
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_455_done
  rxcap_455_fail:
    goto rx447_fail
  rxcap_455_done:
  # rx subrule "identifier" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."identifier"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx447_pos = $P10."pos"()
    goto alt454_end
  alt454_1:
    set_addr $I10, alt454_2
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
.annotate "line", 228
  # rx subrule "identifier" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."identifier"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx447_pos = $P10."pos"()
  # rx rxquantr456 ** 0..1
    set_addr $I457, rxquantr456_done
    rx447_cur."!mark_push"(0, rx447_pos, $I457)
  rxquantr456_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."circumfix"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx447_pos = $P10."pos"()
    (rx447_rep) = rx447_cur."!mark_commit"($I457)
  rxquantr456_done:
    goto alt454_end
  alt454_2:
.annotate "line", 229
  # rx subrule "circumfix" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."circumfix"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx447_pos = $P10."pos"()
  alt454_end:
.annotate "line", 224
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "colonpair")
    rx447_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate "line", 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("112_1259779041.86401") :method
.annotate "line", 4
    $P449 = self."!PREFIX__!subrule"("circumfix", ":")
    $P450 = self."!PREFIX__!subrule"("identifier", ":")
    $P451 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P452, "ResizablePMCArray"
    push $P452, $P449
    push $P452, $P450
    push $P452, $P451
    .return ($P452)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("113_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "variable")
    rx459_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    set rx459_off, 0
    lt rx459_pos, 2, rx459_start
    sub rx459_off, rx459_pos, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan464_done
    goto rxscan464_scan
  rxscan464_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan464_done
  rxscan464_scan:
    set_addr $I10, rxscan464_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan464_done:
  alt465_0:
.annotate "line", 233
    set_addr $I10, alt465_1
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
.annotate "line", 234
  # rx subrule "sigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."sigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx459_pos = $P10."pos"()
  # rx rxquantr466 ** 0..1
    set_addr $I467, rxquantr466_done
    rx459_cur."!mark_push"(0, rx459_pos, $I467)
  rxquantr466_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."twigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx459_pos = $P10."pos"()
    (rx459_rep) = rx459_cur."!mark_commit"($I467)
  rxquantr466_done:
  # rx subrule "name" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."name"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx459_pos = $P10."pos"()
    goto alt465_end
  alt465_1:
    set_addr $I10, alt465_2
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
.annotate "line", 235
  # rx subrule "sigil" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."sigil"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx459_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx459_pos, rx459_eos, rx459_fail
    sub $I10, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx459_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."postcircumfix"()
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx459_pos = $P10."pos"()
    goto alt465_end
  alt465_2:
.annotate "line", 236
  # rx subcapture "sigil"
    set_addr $I10, rxcap_468_fail
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  # rx literal  "$"
    add $I11, rx459_pos, 1
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I11, 1
    ne $S10, "$", rx459_fail
    add rx459_pos, 1
    set_addr $I10, rxcap_468_fail
    ($I12, $I11) = rx459_cur."!mark_peek"($I10)
    rx459_cur."!cursor_pos"($I11)
    ($P10) = rx459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx459_pos, "")
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_468_done
  rxcap_468_fail:
    goto rx459_fail
  rxcap_468_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_469_fail
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx459_pos, rx459_eos, rx459_fail
    sub $I10, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx459_fail
    inc rx459_pos
    set_addr $I10, rxcap_469_fail
    ($I12, $I11) = rx459_cur."!mark_peek"($I10)
    rx459_cur."!cursor_pos"($I11)
    ($P10) = rx459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx459_pos, "")
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_469_done
  rxcap_469_fail:
    goto rx459_fail
  rxcap_469_done:
  alt465_end:
.annotate "line", 233
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "variable")
    rx459_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate "line", 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("114_1259779041.86401") :method
.annotate "line", 4
    $P461 = self."!PREFIX__!subrule"("sigil", "")
    $P462 = self."!PREFIX__!subrule"("sigil", "")
    new $P463, "ResizablePMCArray"
    push $P463, "$!"
    push $P463, "$_"
    push $P463, "$/"
    push $P463, $P461
    push $P463, $P462
    .return ($P463)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("115_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx471_cur
    .local pmc match
    .lex "$/", match
    length rx471_eos, rx471_tgt
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
.annotate "line", 239
  # rx enumcharlist negate=0 
    ge rx471_pos, rx471_eos, rx471_fail
    sub $I10, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx471_fail
    inc rx471_pos
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "sigil")
    rx471_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
.annotate "line", 4
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx471_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("116_1259779041.86401") :method
.annotate "line", 4
    new $P473, "ResizablePMCArray"
    push $P473, "&"
    push $P473, "%"
    push $P473, "@"
    push $P473, "$"
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("117_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx476_cur
    .local pmc match
    .lex "$/", match
    length rx476_eos, rx476_tgt
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
.annotate "line", 241
  # rx enumcharlist negate=0 
    ge rx476_pos, rx476_eos, rx476_fail
    sub $I10, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx476_fail
    inc rx476_pos
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "twigil")
    rx476_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate "line", 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("118_1259779041.86401") :method
.annotate "line", 4
    new $P478, "ResizablePMCArray"
    push $P478, "?"
    push $P478, "!"
    push $P478, "*"
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("119_1259779041.86401") :method
.annotate "line", 243
    $P481 = self."!protoregex"("package_declarator")
    .return ($P481)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("120_1259779041.86401") :method
.annotate "line", 243
    $P483 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P483)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("121_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx485_tgt
    .local int rx485_pos
    .local int rx485_off
    .local int rx485_eos
    .local int rx485_rep
    .local pmc rx485_cur
    (rx485_cur, rx485_pos, rx485_tgt) = self."!cursor_start"()
    rx485_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx485_cur
    .local pmc match
    .lex "$/", match
    length rx485_eos, rx485_tgt
    set rx485_off, 0
    lt rx485_pos, 2, rx485_start
    sub rx485_off, rx485_pos, 1
    substr rx485_tgt, rx485_tgt, rx485_off
  rx485_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx485_cur."from"()
    inc $P10
    set rx485_pos, $P10
    ge rx485_pos, rx485_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  rxscan489_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_490_fail
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  # rx literal  "module"
    add $I11, rx485_pos, 6
    gt $I11, rx485_eos, rx485_fail
    sub $I11, rx485_pos, rx485_off
    substr $S10, rx485_tgt, $I11, 6
    ne $S10, "module", rx485_fail
    add rx485_pos, 6
    set_addr $I10, rxcap_490_fail
    ($I12, $I11) = rx485_cur."!mark_peek"($I10)
    rx485_cur."!cursor_pos"($I11)
    ($P10) = rx485_cur."!cursor_start"()
    $P10."!cursor_pass"(rx485_pos, "")
    rx485_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_490_done
  rxcap_490_fail:
    goto rx485_fail
  rxcap_490_done:
  # rx subrule "package_def" subtype=capture negate=
    rx485_cur."!cursor_pos"(rx485_pos)
    $P10 = rx485_cur."package_def"()
    unless $P10, rx485_fail
    rx485_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx485_pos = $P10."pos"()
  # rx pass
    rx485_cur."!cursor_pass"(rx485_pos, "package_declarator:sym<module>")
    rx485_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx485_pos)
    .return (rx485_cur)
  rx485_fail:
.annotate "line", 4
    (rx485_rep, rx485_pos, $I10, $P10) = rx485_cur."!mark_fail"(0)
    lt rx485_pos, -1, rx485_done
    eq rx485_pos, -1, rx485_fail
    jump $I10
  rx485_done:
    rx485_cur."!cursor_fail"()
    rx485_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx485_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("122_1259779041.86401") :method
.annotate "line", 4
    $P487 = self."!PREFIX__!subrule"("package_def", "module")
    new $P488, "ResizablePMCArray"
    push $P488, $P487
    .return ($P488)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("123_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx492_tgt
    .local int rx492_pos
    .local int rx492_off
    .local int rx492_eos
    .local int rx492_rep
    .local pmc rx492_cur
    (rx492_cur, rx492_pos, rx492_tgt) = self."!cursor_start"()
    rx492_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx492_cur
    .local pmc match
    .lex "$/", match
    length rx492_eos, rx492_tgt
    set rx492_off, 0
    lt rx492_pos, 2, rx492_start
    sub rx492_off, rx492_pos, 1
    substr rx492_tgt, rx492_tgt, rx492_off
  rx492_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan497_done
    goto rxscan497_scan
  rxscan497_loop:
    ($P10) = rx492_cur."from"()
    inc $P10
    set rx492_pos, $P10
    ge rx492_pos, rx492_eos, rxscan497_done
  rxscan497_scan:
    set_addr $I10, rxscan497_loop
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  rxscan497_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_499_fail
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  alt498_0:
    set_addr $I10, alt498_1
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  # rx literal  "class"
    add $I11, rx492_pos, 5
    gt $I11, rx492_eos, rx492_fail
    sub $I11, rx492_pos, rx492_off
    substr $S10, rx492_tgt, $I11, 5
    ne $S10, "class", rx492_fail
    add rx492_pos, 5
    goto alt498_end
  alt498_1:
  # rx literal  "grammar"
    add $I11, rx492_pos, 7
    gt $I11, rx492_eos, rx492_fail
    sub $I11, rx492_pos, rx492_off
    substr $S10, rx492_tgt, $I11, 7
    ne $S10, "grammar", rx492_fail
    add rx492_pos, 7
  alt498_end:
    set_addr $I10, rxcap_499_fail
    ($I12, $I11) = rx492_cur."!mark_peek"($I10)
    rx492_cur."!cursor_pos"($I11)
    ($P10) = rx492_cur."!cursor_start"()
    $P10."!cursor_pass"(rx492_pos, "")
    rx492_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_499_done
  rxcap_499_fail:
    goto rx492_fail
  rxcap_499_done:
  # rx subrule "package_def" subtype=capture negate=
    rx492_cur."!cursor_pos"(rx492_pos)
    $P10 = rx492_cur."package_def"()
    unless $P10, rx492_fail
    rx492_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx492_pos = $P10."pos"()
  # rx pass
    rx492_cur."!cursor_pass"(rx492_pos, "package_declarator:sym<class>")
    rx492_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx492_pos)
    .return (rx492_cur)
  rx492_fail:
.annotate "line", 4
    (rx492_rep, rx492_pos, $I10, $P10) = rx492_cur."!mark_fail"(0)
    lt rx492_pos, -1, rx492_done
    eq rx492_pos, -1, rx492_fail
    jump $I10
  rx492_done:
    rx492_cur."!cursor_fail"()
    rx492_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx492_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("124_1259779041.86401") :method
.annotate "line", 4
    $P494 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P495 = self."!PREFIX__!subrule"("package_def", "class")
    new $P496, "ResizablePMCArray"
    push $P496, $P494
    push $P496, $P495
    .return ($P496)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("125_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "package_def")
    rx501_cur."!cursor_caparray"("parent")
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
.annotate "line", 247
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 248
  # rx subrule "name" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."name"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 249
  # rx rxquantr507 ** 0..1
    set_addr $I511, rxquantr507_done
    rx501_cur."!mark_push"(0, rx501_pos, $I511)
  rxquantr507_loop:
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx501_pos, 2
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I11, 2
    ne $S10, "is", rx501_fail
    add rx501_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."name"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    (rx501_rep) = rx501_cur."!mark_commit"($I511)
  rxquantr507_done:
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  alt513_0:
.annotate "line", 250
    set_addr $I10, alt513_1
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate "line", 251
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx501_pos, 1
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I11, 1
    ne $S10, ";", rx501_fail
    add rx501_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."comp_unit"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    goto alt513_end
  alt513_1:
    set_addr $I10, alt513_2
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx501_pos, rx501_eos, rx501_fail
    sub $I10, rx501_pos, rx501_off
    substr $S10, rx501_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx501_fail
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."block"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
    goto alt513_end
  alt513_2:
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."panic"("Malformed package declaration")
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
  alt513_end:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."ws"()
    unless $P10, rx501_fail
    rx501_pos = $P10."pos"()
.annotate "line", 247
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "package_def")
    rx501_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate "line", 4
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx501_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("126_1259779041.86401") :method
.annotate "line", 4
    new $P503, "ResizablePMCArray"
    push $P503, ""
    .return ($P503)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("127_1259779041.86401") :method
.annotate "line", 257
    $P524 = self."!protoregex"("scope_declarator")
    .return ($P524)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("128_1259779041.86401") :method
.annotate "line", 257
    $P526 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P526)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("129_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx528_tgt
    .local int rx528_pos
    .local int rx528_off
    .local int rx528_eos
    .local int rx528_rep
    .local pmc rx528_cur
    (rx528_cur, rx528_pos, rx528_tgt) = self."!cursor_start"()
    rx528_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx528_cur
    .local pmc match
    .lex "$/", match
    length rx528_eos, rx528_tgt
    set rx528_off, 0
    lt rx528_pos, 2, rx528_start
    sub rx528_off, rx528_pos, 1
    substr rx528_tgt, rx528_tgt, rx528_off
  rx528_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan532_done
    goto rxscan532_scan
  rxscan532_loop:
    ($P10) = rx528_cur."from"()
    inc $P10
    set rx528_pos, $P10
    ge rx528_pos, rx528_eos, rxscan532_done
  rxscan532_scan:
    set_addr $I10, rxscan532_loop
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  rxscan532_done:
.annotate "line", 258
  # rx subcapture "sym"
    set_addr $I10, rxcap_533_fail
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  # rx literal  "my"
    add $I11, rx528_pos, 2
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 2
    ne $S10, "my", rx528_fail
    add rx528_pos, 2
    set_addr $I10, rxcap_533_fail
    ($I12, $I11) = rx528_cur."!mark_peek"($I10)
    rx528_cur."!cursor_pos"($I11)
    ($P10) = rx528_cur."!cursor_start"()
    $P10."!cursor_pass"(rx528_pos, "")
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_533_done
  rxcap_533_fail:
    goto rx528_fail
  rxcap_533_done:
  # rx subrule "scoped" subtype=capture negate=
    rx528_cur."!cursor_pos"(rx528_pos)
    $P10 = rx528_cur."scoped"("my")
    unless $P10, rx528_fail
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx528_pos = $P10."pos"()
  # rx pass
    rx528_cur."!cursor_pass"(rx528_pos, "scope_declarator:sym<my>")
    rx528_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx528_pos)
    .return (rx528_cur)
  rx528_fail:
.annotate "line", 4
    (rx528_rep, rx528_pos, $I10, $P10) = rx528_cur."!mark_fail"(0)
    lt rx528_pos, -1, rx528_done
    eq rx528_pos, -1, rx528_fail
    jump $I10
  rx528_done:
    rx528_cur."!cursor_fail"()
    rx528_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx528_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("130_1259779041.86401") :method
.annotate "line", 4
    $P530 = self."!PREFIX__!subrule"("scoped", "my")
    new $P531, "ResizablePMCArray"
    push $P531, $P530
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("131_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx535_cur
    .local pmc match
    .lex "$/", match
    length rx535_eos, rx535_tgt
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
.annotate "line", 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_540_fail
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  # rx literal  "our"
    add $I11, rx535_pos, 3
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 3
    ne $S10, "our", rx535_fail
    add rx535_pos, 3
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
  # rx subrule "scoped" subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    $P10 = rx535_cur."scoped"("our")
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx535_pos = $P10."pos"()
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "scope_declarator:sym<our>")
    rx535_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate "line", 4
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx535_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("132_1259779041.86401") :method
.annotate "line", 4
    $P537 = self."!PREFIX__!subrule"("scoped", "our")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("133_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    (rx542_cur, rx542_pos, rx542_tgt) = self."!cursor_start"()
    rx542_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx542_cur
    .local pmc match
    .lex "$/", match
    length rx542_eos, rx542_tgt
    set rx542_off, 0
    lt rx542_pos, 2, rx542_start
    sub rx542_off, rx542_pos, 1
    substr rx542_tgt, rx542_tgt, rx542_off
  rx542_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan546_done
    goto rxscan546_scan
  rxscan546_loop:
    ($P10) = rx542_cur."from"()
    inc $P10
    set rx542_pos, $P10
    ge rx542_pos, rx542_eos, rxscan546_done
  rxscan546_scan:
    set_addr $I10, rxscan546_loop
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxscan546_done:
.annotate "line", 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_547_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "has"
    add $I11, rx542_pos, 3
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 3
    ne $S10, "has", rx542_fail
    add rx542_pos, 3
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx542_cur."!mark_peek"($I10)
    rx542_cur."!cursor_pos"($I11)
    ($P10) = rx542_cur."!cursor_start"()
    $P10."!cursor_pass"(rx542_pos, "")
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx542_fail
  rxcap_547_done:
  # rx subrule "scoped" subtype=capture negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    $P10 = rx542_cur."scoped"("has")
    unless $P10, rx542_fail
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx542_pos = $P10."pos"()
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "scope_declarator:sym<has>")
    rx542_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx542_pos)
    .return (rx542_cur)
  rx542_fail:
.annotate "line", 4
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    rx542_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx542_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("134_1259779041.86401") :method
.annotate "line", 4
    $P544 = self."!PREFIX__!subrule"("scoped", "has")
    new $P545, "ResizablePMCArray"
    push $P545, $P544
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("135_1259779041.86401") :method :outer("11_1259779041.86401")
    .param pmc param_549
.annotate "line", 262
    .lex "$*SCOPE", param_549
.annotate "line", 4
    .local string rx550_tgt
    .local int rx550_pos
    .local int rx550_off
    .local int rx550_eos
    .local int rx550_rep
    .local pmc rx550_cur
    (rx550_cur, rx550_pos, rx550_tgt) = self."!cursor_start"()
    rx550_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx550_cur
    .local pmc match
    .lex "$/", match
    length rx550_eos, rx550_tgt
    set rx550_off, 0
    lt rx550_pos, 2, rx550_start
    sub rx550_off, rx550_pos, 1
    substr rx550_tgt, rx550_tgt, rx550_off
  rx550_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan553_done
    goto rxscan553_scan
  rxscan553_loop:
    ($P10) = rx550_cur."from"()
    inc $P10
    set rx550_pos, $P10
    ge rx550_pos, rx550_eos, rxscan553_done
  rxscan553_scan:
    set_addr $I10, rxscan553_loop
    rx550_cur."!mark_push"(0, rx550_pos, $I10)
  rxscan553_done:
  alt554_0:
.annotate "line", 262
    set_addr $I10, alt554_1
    rx550_cur."!mark_push"(0, rx550_pos, $I10)
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."variable_declarator"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx550_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
    goto alt554_end
  alt554_1:
.annotate "line", 264
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."routine_declarator"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx550_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  alt554_end:
.annotate "line", 262
  # rx pass
    rx550_cur."!cursor_pass"(rx550_pos, "scoped")
    rx550_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx550_pos)
    .return (rx550_cur)
  rx550_fail:
.annotate "line", 4
    (rx550_rep, rx550_pos, $I10, $P10) = rx550_cur."!mark_fail"(0)
    lt rx550_pos, -1, rx550_done
    eq rx550_pos, -1, rx550_fail
    jump $I10
  rx550_done:
    rx550_cur."!cursor_fail"()
    rx550_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx550_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("136_1259779041.86401") :method
.annotate "line", 4
    new $P552, "ResizablePMCArray"
    push $P552, ""
    push $P552, ""
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("137_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
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
.annotate "line", 267
  # rx subrule "variable" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."variable"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx560_pos = $P10."pos"()
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "variable_declarator")
    rx560_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("138_1259779041.86401") :method
.annotate "line", 4
    $P562 = self."!PREFIX__!subrule"("variable", "")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("139_1259779041.86401") :method
.annotate "line", 269
    $P566 = self."!protoregex"("routine_declarator")
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("140_1259779041.86401") :method
.annotate "line", 269
    $P568 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P568)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("141_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    (rx570_cur, rx570_pos, rx570_tgt) = self."!cursor_start"()
    rx570_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx570_cur
    .local pmc match
    .lex "$/", match
    length rx570_eos, rx570_tgt
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
.annotate "line", 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_575_fail
    rx570_cur."!mark_push"(0, rx570_pos, $I10)
  # rx literal  "sub"
    add $I11, rx570_pos, 3
    gt $I11, rx570_eos, rx570_fail
    sub $I11, rx570_pos, rx570_off
    substr $S10, rx570_tgt, $I11, 3
    ne $S10, "sub", rx570_fail
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
  # rx subrule "routine_def" subtype=capture negate=
    rx570_cur."!cursor_pos"(rx570_pos)
    $P10 = rx570_cur."routine_def"()
    unless $P10, rx570_fail
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx570_pos = $P10."pos"()
  # rx pass
    rx570_cur."!cursor_pass"(rx570_pos, "routine_declarator:sym<sub>")
    rx570_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx570_pos)
    .return (rx570_cur)
  rx570_fail:
.annotate "line", 4
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    rx570_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("142_1259779041.86401") :method
.annotate "line", 4
    $P572 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("143_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx577_cur
    .local pmc match
    .lex "$/", match
    length rx577_eos, rx577_tgt
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
.annotate "line", 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_582_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "method"
    add $I11, rx577_pos, 6
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 6
    ne $S10, "method", rx577_fail
    add rx577_pos, 6
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
  # rx subrule "method_def" subtype=capture negate=
    rx577_cur."!cursor_pos"(rx577_pos)
    $P10 = rx577_cur."method_def"()
    unless $P10, rx577_fail
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx577_pos = $P10."pos"()
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "routine_declarator:sym<method>")
    rx577_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate "line", 4
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("144_1259779041.86401") :method
.annotate "line", 4
    $P579 = self."!PREFIX__!subrule"("method_def", "method")
    new $P580, "ResizablePMCArray"
    push $P580, $P579
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("145_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "routine_def")
    rx584_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx584_cur
    .local pmc match
    .lex "$/", match
    length rx584_eos, rx584_tgt
    set rx584_off, 0
    lt rx584_pos, 2, rx584_start
    sub rx584_off, rx584_pos, 1
    substr rx584_tgt, rx584_tgt, rx584_off
  rx584_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan587_done
    goto rxscan587_scan
  rxscan587_loop:
    ($P10) = rx584_cur."from"()
    inc $P10
    set rx584_pos, $P10
    ge rx584_pos, rx584_eos, rxscan587_done
  rxscan587_scan:
    set_addr $I10, rxscan587_loop
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  rxscan587_done:
.annotate "line", 273
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 274
  # rx rxquantr589 ** 0..1
    set_addr $I595, rxquantr589_done
    rx584_cur."!mark_push"(0, rx584_pos, $I595)
  rxquantr589_loop:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_593_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx rxquantr591 ** 0..1
    set_addr $I592, rxquantr591_done
    rx584_cur."!mark_push"(0, rx584_pos, $I592)
  rxquantr591_loop:
  # rx literal  "&"
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, "&", rx584_fail
    add rx584_pos, 1
    (rx584_rep) = rx584_cur."!mark_commit"($I592)
  rxquantr591_done:
    set_addr $I10, rxcap_593_fail
    ($I12, $I11) = rx584_cur."!mark_peek"($I10)
    rx584_cur."!cursor_pos"($I11)
    ($P10) = rx584_cur."!cursor_start"()
    $P10."!cursor_pass"(rx584_pos, "")
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_593_done
  rxcap_593_fail:
    goto rx584_fail
  rxcap_593_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."deflongname"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
    (rx584_rep) = rx584_cur."!mark_commit"($I595)
  rxquantr589_done:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 275
  # rx subrule "newpad" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."newpad"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  alt598_0:
.annotate "line", 276
    set_addr $I10, alt598_1
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, "(", rx584_fail
    add rx584_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."signature"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx584_pos, 1
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 1
    ne $S10, ")", rx584_fail
    add rx584_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
    goto alt598_end
  alt598_1:
.annotate "line", 277
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
  alt598_end:
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 278
  # rx subrule "blockoid" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."blockoid"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx584_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."ws"()
    unless $P10, rx584_fail
    rx584_pos = $P10."pos"()
.annotate "line", 273
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "routine_def")
    rx584_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate "line", 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("146_1259779041.86401") :method
.annotate "line", 4
    new $P586, "ResizablePMCArray"
    push $P586, ""
    .return ($P586)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("147_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx608_tgt
    .local int rx608_pos
    .local int rx608_off
    .local int rx608_eos
    .local int rx608_rep
    .local pmc rx608_cur
    (rx608_cur, rx608_pos, rx608_tgt) = self."!cursor_start"()
    rx608_cur."!cursor_debug"("START ", "method_def")
    rx608_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx608_cur
    .local pmc match
    .lex "$/", match
    length rx608_eos, rx608_tgt
    set rx608_off, 0
    lt rx608_pos, 2, rx608_start
    sub rx608_off, rx608_pos, 1
    substr rx608_tgt, rx608_tgt, rx608_off
  rx608_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan611_done
    goto rxscan611_scan
  rxscan611_loop:
    ($P10) = rx608_cur."from"()
    inc $P10
    set rx608_pos, $P10
    ge rx608_pos, rx608_eos, rxscan611_done
  rxscan611_scan:
    set_addr $I10, rxscan611_loop
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
  rxscan611_done:
.annotate "line", 281
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 282
  # rx rxquantr613 ** 0..1
    set_addr $I614, rxquantr613_done
    rx608_cur."!mark_push"(0, rx608_pos, $I614)
  rxquantr613_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."deflongname"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx608_pos = $P10."pos"()
    (rx608_rep) = rx608_cur."!mark_commit"($I614)
  rxquantr613_done:
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "newpad" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."newpad"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  alt617_0:
.annotate "line", 284
    set_addr $I10, alt617_1
    rx608_cur."!mark_push"(0, rx608_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx608_pos, 1
    gt $I11, rx608_eos, rx608_fail
    sub $I11, rx608_pos, rx608_off
    substr $S10, rx608_tgt, $I11, 1
    ne $S10, "(", rx608_fail
    add rx608_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."signature"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx608_pos, 1
    gt $I11, rx608_eos, rx608_fail
    sub $I11, rx608_pos, rx608_off
    substr $S10, rx608_tgt, $I11, 1
    ne $S10, ")", rx608_fail
    add rx608_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
    goto alt617_end
  alt617_1:
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
  alt617_end:
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 286
  # rx subrule "blockoid" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."blockoid"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx608_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."ws"()
    unless $P10, rx608_fail
    rx608_pos = $P10."pos"()
.annotate "line", 281
  # rx pass
    rx608_cur."!cursor_pass"(rx608_pos, "method_def")
    rx608_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx608_pos)
    .return (rx608_cur)
  rx608_fail:
.annotate "line", 4
    (rx608_rep, rx608_pos, $I10, $P10) = rx608_cur."!mark_fail"(0)
    lt rx608_pos, -1, rx608_done
    eq rx608_pos, -1, rx608_fail
    jump $I10
  rx608_done:
    rx608_cur."!cursor_fail"()
    rx608_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx608_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("148_1259779041.86401") :method
.annotate "line", 4
    new $P610, "ResizablePMCArray"
    push $P610, ""
    .return ($P610)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("149_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx627_tgt
    .local int rx627_pos
    .local int rx627_off
    .local int rx627_eos
    .local int rx627_rep
    .local pmc rx627_cur
    (rx627_cur, rx627_pos, rx627_tgt) = self."!cursor_start"()
    rx627_cur."!cursor_debug"("START ", "signature")
    rx627_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx627_cur
    .local pmc match
    .lex "$/", match
    length rx627_eos, rx627_tgt
    set rx627_off, 0
    lt rx627_pos, 2, rx627_start
    sub rx627_off, rx627_pos, 1
    substr rx627_tgt, rx627_tgt, rx627_off
  rx627_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan630_done
    goto rxscan630_scan
  rxscan630_loop:
    ($P10) = rx627_cur."from"()
    inc $P10
    set rx627_pos, $P10
    ge rx627_pos, rx627_eos, rxscan630_done
  rxscan630_scan:
    set_addr $I10, rxscan630_loop
    rx627_cur."!mark_push"(0, rx627_pos, $I10)
  rxscan630_done:
.annotate "line", 289
  # rx rxquantr631 ** 0..1
    set_addr $I634, rxquantr631_done
    rx627_cur."!mark_push"(0, rx627_pos, $I634)
  rxquantr631_loop:
  # rx rxquantr632 ** 1..*
    set_addr $I633, rxquantr632_done
    rx627_cur."!mark_push"(0, -1, $I633)
  rxquantr632_loop:
  # rx subrule "ws" subtype=method negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."ws"()
    unless $P10, rx627_fail
    rx627_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."parameter"()
    unless $P10, rx627_fail
    rx627_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx627_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."ws"()
    unless $P10, rx627_fail
    rx627_pos = $P10."pos"()
    (rx627_rep) = rx627_cur."!mark_commit"($I633)
    rx627_cur."!mark_push"(rx627_rep, rx627_pos, $I633)
  # rx literal  ","
    add $I11, rx627_pos, 1
    gt $I11, rx627_eos, rx627_fail
    sub $I11, rx627_pos, rx627_off
    substr $S10, rx627_tgt, $I11, 1
    ne $S10, ",", rx627_fail
    add rx627_pos, 1
    goto rxquantr632_loop
  rxquantr632_done:
    (rx627_rep) = rx627_cur."!mark_commit"($I634)
  rxquantr631_done:
  # rx pass
    rx627_cur."!cursor_pass"(rx627_pos, "signature")
    rx627_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx627_pos)
    .return (rx627_cur)
  rx627_fail:
.annotate "line", 4
    (rx627_rep, rx627_pos, $I10, $P10) = rx627_cur."!mark_fail"(0)
    lt rx627_pos, -1, rx627_done
    eq rx627_pos, -1, rx627_fail
    jump $I10
  rx627_done:
    rx627_cur."!cursor_fail"()
    rx627_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx627_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("150_1259779041.86401") :method
.annotate "line", 4
    new $P629, "ResizablePMCArray"
    push $P629, ""
    .return ($P629)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("151_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx636_tgt
    .local int rx636_pos
    .local int rx636_off
    .local int rx636_eos
    .local int rx636_rep
    .local pmc rx636_cur
    (rx636_cur, rx636_pos, rx636_tgt) = self."!cursor_start"()
    rx636_cur."!cursor_debug"("START ", "parameter")
    rx636_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx636_cur
    .local pmc match
    .lex "$/", match
    length rx636_eos, rx636_tgt
    set rx636_off, 0
    lt rx636_pos, 2, rx636_start
    sub rx636_off, rx636_pos, 1
    substr rx636_tgt, rx636_tgt, rx636_off
  rx636_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan642_done
    goto rxscan642_scan
  rxscan642_loop:
    ($P10) = rx636_cur."from"()
    inc $P10
    set rx636_pos, $P10
    ge rx636_pos, rx636_eos, rxscan642_done
  rxscan642_scan:
    set_addr $I10, rxscan642_loop
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  rxscan642_done:
  alt643_0:
.annotate "line", 292
    set_addr $I10, alt643_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
.annotate "line", 293
  # rx subcapture "quant"
    set_addr $I10, rxcap_644_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "*"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "*", rx636_fail
    add rx636_pos, 1
    set_addr $I10, rxcap_644_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_644_done
  rxcap_644_fail:
    goto rx636_fail
  rxcap_644_done:
  # rx subrule "param_var" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."param_var"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx636_pos = $P10."pos"()
    goto alt643_end
  alt643_1:
  alt645_0:
.annotate "line", 294
    set_addr $I10, alt645_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."param_var"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx636_pos = $P10."pos"()
    goto alt645_end
  alt645_1:
  # rx subrule "named_param" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."named_param"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx636_pos = $P10."pos"()
  alt645_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_647_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  alt646_0:
    set_addr $I10, alt646_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "?"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "?", rx636_fail
    add rx636_pos, 1
    goto alt646_end
  alt646_1:
    set_addr $I10, alt646_2
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "!"
    add $I11, rx636_pos, 1
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 1
    ne $S10, "!", rx636_fail
    add rx636_pos, 1
    goto alt646_end
  alt646_2:
  alt646_end:
    set_addr $I10, rxcap_647_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_647_done
  rxcap_647_fail:
    goto rx636_fail
  rxcap_647_done:
  alt643_end:
.annotate "line", 296
  # rx rxquantr648 ** 0..1
    set_addr $I649, rxquantr648_done
    rx636_cur."!mark_push"(0, rx636_pos, $I649)
  rxquantr648_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."default_value"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx636_pos = $P10."pos"()
    (rx636_rep) = rx636_cur."!mark_commit"($I649)
  rxquantr648_done:
.annotate "line", 291
  # rx pass
    rx636_cur."!cursor_pass"(rx636_pos, "parameter")
    rx636_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx636_pos)
    .return (rx636_cur)
  rx636_fail:
.annotate "line", 4
    (rx636_rep, rx636_pos, $I10, $P10) = rx636_cur."!mark_fail"(0)
    lt rx636_pos, -1, rx636_done
    eq rx636_pos, -1, rx636_fail
    jump $I10
  rx636_done:
    rx636_cur."!cursor_fail"()
    rx636_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("152_1259779041.86401") :method
.annotate "line", 4
    $P638 = self."!PREFIX__!subrule"("named_param", "")
    $P639 = self."!PREFIX__!subrule"("param_var", "")
    $P640 = self."!PREFIX__!subrule"("param_var", "*")
    new $P641, "ResizablePMCArray"
    push $P641, $P638
    push $P641, $P639
    push $P641, $P640
    .return ($P641)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("153_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx651_tgt
    .local int rx651_pos
    .local int rx651_off
    .local int rx651_eos
    .local int rx651_rep
    .local pmc rx651_cur
    (rx651_cur, rx651_pos, rx651_tgt) = self."!cursor_start"()
    rx651_cur."!cursor_debug"("START ", "param_var")
    rx651_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx651_cur
    .local pmc match
    .lex "$/", match
    length rx651_eos, rx651_tgt
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
.annotate "line", 300
  # rx subrule "sigil" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."sigil"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx651_pos = $P10."pos"()
  # rx rxquantr656 ** 0..1
    set_addr $I657, rxquantr656_done
    rx651_cur."!mark_push"(0, rx651_pos, $I657)
  rxquantr656_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."twigil"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx651_pos = $P10."pos"()
    (rx651_rep) = rx651_cur."!mark_commit"($I657)
  rxquantr656_done:
  alt658_0:
.annotate "line", 301
    set_addr $I10, alt658_1
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx651_cur."!cursor_pos"(rx651_pos)
    $P10 = rx651_cur."ident"()
    unless $P10, rx651_fail
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx651_pos = $P10."pos"()
    goto alt658_end
  alt658_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_659_fail
    rx651_cur."!mark_push"(0, rx651_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx651_pos, rx651_eos, rx651_fail
    sub $I10, rx651_pos, rx651_off
    substr $S10, rx651_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx651_fail
    inc rx651_pos
    set_addr $I10, rxcap_659_fail
    ($I12, $I11) = rx651_cur."!mark_peek"($I10)
    rx651_cur."!cursor_pos"($I11)
    ($P10) = rx651_cur."!cursor_start"()
    $P10."!cursor_pass"(rx651_pos, "")
    rx651_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_659_done
  rxcap_659_fail:
    goto rx651_fail
  rxcap_659_done:
  alt658_end:
.annotate "line", 299
  # rx pass
    rx651_cur."!cursor_pass"(rx651_pos, "param_var")
    rx651_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx651_pos)
    .return (rx651_cur)
  rx651_fail:
.annotate "line", 4
    (rx651_rep, rx651_pos, $I10, $P10) = rx651_cur."!mark_fail"(0)
    lt rx651_pos, -1, rx651_done
    eq rx651_pos, -1, rx651_fail
    jump $I10
  rx651_done:
    rx651_cur."!cursor_fail"()
    rx651_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx651_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("154_1259779041.86401") :method
.annotate "line", 4
    $P653 = self."!PREFIX__!subrule"("sigil", "")
    new $P654, "ResizablePMCArray"
    push $P654, $P653
    .return ($P654)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("155_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx661_tgt
    .local int rx661_pos
    .local int rx661_off
    .local int rx661_eos
    .local int rx661_rep
    .local pmc rx661_cur
    (rx661_cur, rx661_pos, rx661_tgt) = self."!cursor_start"()
    rx661_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx661_cur
    .local pmc match
    .lex "$/", match
    length rx661_eos, rx661_tgt
    set rx661_off, 0
    lt rx661_pos, 2, rx661_start
    sub rx661_off, rx661_pos, 1
    substr rx661_tgt, rx661_tgt, rx661_off
  rx661_start:
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
.annotate "line", 305
  # rx literal  ":"
    add $I11, rx661_pos, 1
    gt $I11, rx661_eos, rx661_fail
    sub $I11, rx661_pos, rx661_off
    substr $S10, rx661_tgt, $I11, 1
    ne $S10, ":", rx661_fail
    add rx661_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx661_cur."!cursor_pos"(rx661_pos)
    $P10 = rx661_cur."param_var"()
    unless $P10, rx661_fail
    rx661_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx661_pos = $P10."pos"()
.annotate "line", 304
  # rx pass
    rx661_cur."!cursor_pass"(rx661_pos, "named_param")
    rx661_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx661_pos)
    .return (rx661_cur)
  rx661_fail:
.annotate "line", 4
    (rx661_rep, rx661_pos, $I10, $P10) = rx661_cur."!mark_fail"(0)
    lt rx661_pos, -1, rx661_done
    eq rx661_pos, -1, rx661_fail
    jump $I10
  rx661_done:
    rx661_cur."!cursor_fail"()
    rx661_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx661_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("156_1259779041.86401") :method
.annotate "line", 4
    $P663 = self."!PREFIX__!subrule"("param_var", ":")
    new $P664, "ResizablePMCArray"
    push $P664, $P663
    .return ($P664)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("157_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx667_tgt
    .local int rx667_pos
    .local int rx667_off
    .local int rx667_eos
    .local int rx667_rep
    .local pmc rx667_cur
    (rx667_cur, rx667_pos, rx667_tgt) = self."!cursor_start"()
    rx667_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx667_cur
    .local pmc match
    .lex "$/", match
    length rx667_eos, rx667_tgt
    set rx667_off, 0
    lt rx667_pos, 2, rx667_start
    sub rx667_off, rx667_pos, 1
    substr rx667_tgt, rx667_tgt, rx667_off
  rx667_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan670_done
    goto rxscan670_scan
  rxscan670_loop:
    ($P10) = rx667_cur."from"()
    inc $P10
    set rx667_pos, $P10
    ge rx667_pos, rx667_eos, rxscan670_done
  rxscan670_scan:
    set_addr $I10, rxscan670_loop
    rx667_cur."!mark_push"(0, rx667_pos, $I10)
  rxscan670_done:
.annotate "line", 308
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx667_pos, 1
    gt $I11, rx667_eos, rx667_fail
    sub $I11, rx667_pos, rx667_off
    substr $S10, rx667_tgt, $I11, 1
    ne $S10, "=", rx667_fail
    add rx667_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."EXPR"("i=")
    unless $P10, rx667_fail
    rx667_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx667_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  # rx pass
    rx667_cur."!cursor_pass"(rx667_pos, "default_value")
    rx667_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx667_pos)
    .return (rx667_cur)
  rx667_fail:
.annotate "line", 4
    (rx667_rep, rx667_pos, $I10, $P10) = rx667_cur."!mark_fail"(0)
    lt rx667_pos, -1, rx667_done
    eq rx667_pos, -1, rx667_fail
    jump $I10
  rx667_done:
    rx667_cur."!cursor_fail"()
    rx667_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx667_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("158_1259779041.86401") :method
.annotate "line", 4
    new $P669, "ResizablePMCArray"
    push $P669, ""
    .return ($P669)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("159_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx675_tgt
    .local int rx675_pos
    .local int rx675_off
    .local int rx675_eos
    .local int rx675_rep
    .local pmc rx675_cur
    (rx675_cur, rx675_pos, rx675_tgt) = self."!cursor_start"()
    rx675_cur."!cursor_debug"("START ", "regex_declarator")
    rx675_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx675_cur
    .local pmc match
    .lex "$/", match
    length rx675_eos, rx675_tgt
    set rx675_off, 0
    lt rx675_pos, 2, rx675_start
    sub rx675_off, rx675_pos, 1
    substr rx675_tgt, rx675_tgt, rx675_off
  rx675_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan678_done
    goto rxscan678_scan
  rxscan678_loop:
    ($P10) = rx675_cur."from"()
    inc $P10
    set rx675_pos, $P10
    ge rx675_pos, rx675_eos, rxscan678_done
  rxscan678_scan:
    set_addr $I10, rxscan678_loop
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  rxscan678_done:
.annotate "line", 310
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt680_0:
.annotate "line", 311
    set_addr $I10, alt680_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
.annotate "line", 312
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_682_fail
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "proto"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "proto", rx675_fail
    add rx675_pos, 5
    set_addr $I10, rxcap_682_fail
    ($I12, $I11) = rx675_cur."!mark_peek"($I10)
    rx675_cur."!cursor_pos"($I11)
    ($P10) = rx675_cur."!cursor_start"()
    $P10."!cursor_pass"(rx675_pos, "")
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_682_done
  rxcap_682_fail:
    goto rx675_fail
  rxcap_682_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt684_0:
    set_addr $I10, alt684_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "regex"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "regex", rx675_fail
    add rx675_pos, 5
    goto alt684_end
  alt684_1:
    set_addr $I10, alt684_2
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "token"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "token", rx675_fail
    add rx675_pos, 5
    goto alt684_end
  alt684_2:
  # rx literal  "rule"
    add $I11, rx675_pos, 4
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 4
    ne $S10, "rule", rx675_fail
    add rx675_pos, 4
  alt684_end:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 313
  # rx subrule "deflongname" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."deflongname"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 314
  # rx literal  "{"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "{", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "<...>", rx675_fail
    add rx675_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "}", rx675_fail
    add rx675_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ENDSTMT"()
    unless $P10, rx675_fail
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 312
    goto alt680_end
  alt680_1:
.annotate "line", 315
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_692_fail
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  alt691_0:
    set_addr $I10, alt691_1
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "regex"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "regex", rx675_fail
    add rx675_pos, 5
    goto alt691_end
  alt691_1:
    set_addr $I10, alt691_2
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  # rx literal  "token"
    add $I11, rx675_pos, 5
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 5
    ne $S10, "token", rx675_fail
    add rx675_pos, 5
    goto alt691_end
  alt691_2:
  # rx literal  "rule"
    add $I11, rx675_pos, 4
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 4
    ne $S10, "rule", rx675_fail
    add rx675_pos, 4
  alt691_end:
    set_addr $I10, rxcap_692_fail
    ($I12, $I11) = rx675_cur."!mark_peek"($I10)
    rx675_cur."!cursor_pos"($I11)
    ($P10) = rx675_cur."!cursor_start"()
    $P10."!cursor_pass"(rx675_pos, "")
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_692_done
  rxcap_692_fail:
    goto rx675_fail
  rxcap_692_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 316
  # rx subrule "deflongname" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."deflongname"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 317
  # rx subrule "newpad" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."newpad"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 318
  # rx rxquantr696 ** 0..1
    set_addr $I701, rxquantr696_done
    rx675_cur."!mark_push"(0, rx675_pos, $I701)
  rxquantr696_loop:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "(", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."signature"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx675_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, ")", rx675_fail
    add rx675_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
    (rx675_rep) = rx675_cur."!mark_commit"($I701)
  rxquantr696_done:
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 319
  # rx reduce name="regex_declarator" key="open"
    rx675_cur."!cursor_pos"(rx675_pos)
    rx675_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 320
  # rx literal  "{"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "{", rx675_fail
    add rx675_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."LANG"("Regex", "nibbler")
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx675_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "}", rx675_fail
    add rx675_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ENDSTMT"()
    unless $P10, rx675_fail
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  alt680_end:
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx675_cur."!cursor_pass"(rx675_pos, "regex_declarator")
    rx675_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx675_pos)
    .return (rx675_cur)
  rx675_fail:
.annotate "line", 4
    (rx675_rep, rx675_pos, $I10, $P10) = rx675_cur."!mark_fail"(0)
    lt rx675_pos, -1, rx675_done
    eq rx675_pos, -1, rx675_fail
    jump $I10
  rx675_done:
    rx675_cur."!cursor_fail"()
    rx675_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx675_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("160_1259779041.86401") :method
.annotate "line", 4
    new $P677, "ResizablePMCArray"
    push $P677, ""
    .return ($P677)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("161_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    (rx707_cur, rx707_pos, rx707_tgt) = self."!cursor_start"()
    rx707_cur."!cursor_debug"("START ", "dotty")
    rx707_cur."!cursor_caparray"("args")
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
.annotate "line", 325
  # rx literal  "."
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, ".", rx707_fail
    add rx707_pos, 1
  alt712_0:
.annotate "line", 326
    set_addr $I10, alt712_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."identifier"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx707_pos = $P10."pos"()
    goto alt712_end
  alt712_1:
.annotate "line", 327
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx707_fail
  # rx subrule "quote" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."quote"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx707_pos = $P10."pos"()
  alt713_0:
.annotate "line", 328
    set_addr $I10, alt713_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx707_fail
    goto alt713_end
  alt713_1:
  # rx subrule "panic" subtype=method negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx707_fail
    rx707_pos = $P10."pos"()
  alt713_end:
  alt712_end:
.annotate "line", 334
  # rx rxquantr714 ** 0..1
    set_addr $I716, rxquantr714_done
    rx707_cur."!mark_push"(0, rx707_pos, $I716)
  rxquantr714_loop:
  alt715_0:
.annotate "line", 331
    set_addr $I10, alt715_1
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
.annotate "line", 332
  # rx enumcharlist negate=0 zerowidth
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx707_fail
  # rx subrule "args" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."args"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx707_pos = $P10."pos"()
    goto alt715_end
  alt715_1:
.annotate "line", 333
  # rx literal  ":"
    add $I11, rx707_pos, 1
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 1
    ne $S10, ":", rx707_fail
    add rx707_pos, 1
  # rx charclass s
    ge rx707_pos, rx707_eos, rx707_fail
    sub $I10, rx707_pos, rx707_off
    is_cclass $I11, 32, rx707_tgt, $I10
    unless $I11, rx707_fail
    inc rx707_pos
  # rx subrule "arglist" subtype=capture negate=
    rx707_cur."!cursor_pos"(rx707_pos)
    $P10 = rx707_cur."arglist"()
    unless $P10, rx707_fail
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx707_pos = $P10."pos"()
  alt715_end:
.annotate "line", 334
    (rx707_rep) = rx707_cur."!mark_commit"($I716)
  rxquantr714_done:
.annotate "line", 324
  # rx pass
    rx707_cur."!cursor_pass"(rx707_pos, "dotty")
    rx707_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx707_pos)
    .return (rx707_cur)
  rx707_fail:
.annotate "line", 4
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    rx707_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("162_1259779041.86401") :method
.annotate "line", 4
    $P709 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P710, "ResizablePMCArray"
    push $P710, "'"
    push $P710, "\""
    push $P710, $P709
    .return ($P710)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("163_1259779041.86401") :method
.annotate "line", 338
    $P718 = self."!protoregex"("term")
    .return ($P718)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("164_1259779041.86401") :method
.annotate "line", 338
    $P720 = self."!PREFIX__!protoregex"("term")
    .return ($P720)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("165_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx722_tgt
    .local int rx722_pos
    .local int rx722_off
    .local int rx722_eos
    .local int rx722_rep
    .local pmc rx722_cur
    (rx722_cur, rx722_pos, rx722_tgt) = self."!cursor_start"()
    rx722_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx722_cur
    .local pmc match
    .lex "$/", match
    length rx722_eos, rx722_tgt
    set rx722_off, 0
    lt rx722_pos, 2, rx722_start
    sub rx722_off, rx722_pos, 1
    substr rx722_tgt, rx722_tgt, rx722_off
  rx722_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan725_done
    goto rxscan725_scan
  rxscan725_loop:
    ($P10) = rx722_cur."from"()
    inc $P10
    set rx722_pos, $P10
    ge rx722_pos, rx722_eos, rxscan725_done
  rxscan725_scan:
    set_addr $I10, rxscan725_loop
    rx722_cur."!mark_push"(0, rx722_pos, $I10)
  rxscan725_done:
.annotate "line", 340
  # rx subcapture "sym"
    set_addr $I10, rxcap_726_fail
    rx722_cur."!mark_push"(0, rx722_pos, $I10)
  # rx literal  "self"
    add $I11, rx722_pos, 4
    gt $I11, rx722_eos, rx722_fail
    sub $I11, rx722_pos, rx722_off
    substr $S10, rx722_tgt, $I11, 4
    ne $S10, "self", rx722_fail
    add rx722_pos, 4
    set_addr $I10, rxcap_726_fail
    ($I12, $I11) = rx722_cur."!mark_peek"($I10)
    rx722_cur."!cursor_pos"($I11)
    ($P10) = rx722_cur."!cursor_start"()
    $P10."!cursor_pass"(rx722_pos, "")
    rx722_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_726_done
  rxcap_726_fail:
    goto rx722_fail
  rxcap_726_done:
  # rxanchor rwb
    le rx722_pos, 0, rx722_fail
    sub $I10, rx722_pos, rx722_off
    is_cclass $I11, 8192, rx722_tgt, $I10
    if $I11, rx722_fail
    dec $I10
    is_cclass $I11, 8192, rx722_tgt, $I10
    unless $I11, rx722_fail
  # rx pass
    rx722_cur."!cursor_pass"(rx722_pos, "term:sym<self>")
    rx722_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx722_pos)
    .return (rx722_cur)
  rx722_fail:
.annotate "line", 4
    (rx722_rep, rx722_pos, $I10, $P10) = rx722_cur."!mark_fail"(0)
    lt rx722_pos, -1, rx722_done
    eq rx722_pos, -1, rx722_fail
    jump $I10
  rx722_done:
    rx722_cur."!cursor_fail"()
    rx722_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx722_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("166_1259779041.86401") :method
.annotate "line", 4
    new $P724, "ResizablePMCArray"
    push $P724, "self"
    .return ($P724)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("167_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx728_tgt
    .local int rx728_pos
    .local int rx728_off
    .local int rx728_eos
    .local int rx728_rep
    .local pmc rx728_cur
    (rx728_cur, rx728_pos, rx728_tgt) = self."!cursor_start"()
    rx728_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx728_cur
    .local pmc match
    .lex "$/", match
    length rx728_eos, rx728_tgt
    set rx728_off, 0
    lt rx728_pos, 2, rx728_start
    sub rx728_off, rx728_pos, 1
    substr rx728_tgt, rx728_tgt, rx728_off
  rx728_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan732_done
    goto rxscan732_scan
  rxscan732_loop:
    ($P10) = rx728_cur."from"()
    inc $P10
    set rx728_pos, $P10
    ge rx728_pos, rx728_eos, rxscan732_done
  rxscan732_scan:
    set_addr $I10, rxscan732_loop
    rx728_cur."!mark_push"(0, rx728_pos, $I10)
  rxscan732_done:
.annotate "line", 343
  # rx subrule "identifier" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."identifier"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx728_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx728_pos, rx728_eos, rx728_fail
    sub $I10, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx728_fail
  # rx subrule "args" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."args"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx728_pos = $P10."pos"()
.annotate "line", 342
  # rx pass
    rx728_cur."!cursor_pass"(rx728_pos, "term:sym<identifier>")
    rx728_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx728_pos)
    .return (rx728_cur)
  rx728_fail:
.annotate "line", 4
    (rx728_rep, rx728_pos, $I10, $P10) = rx728_cur."!mark_fail"(0)
    lt rx728_pos, -1, rx728_done
    eq rx728_pos, -1, rx728_fail
    jump $I10
  rx728_done:
    rx728_cur."!cursor_fail"()
    rx728_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx728_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("168_1259779041.86401") :method
.annotate "line", 4
    $P730 = self."!PREFIX__!subrule"("identifier", "")
    new $P731, "ResizablePMCArray"
    push $P731, $P730
    .return ($P731)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("169_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx734_tgt
    .local int rx734_pos
    .local int rx734_off
    .local int rx734_eos
    .local int rx734_rep
    .local pmc rx734_cur
    (rx734_cur, rx734_pos, rx734_tgt) = self."!cursor_start"()
    rx734_cur."!cursor_debug"("START ", "term:sym<name>")
    rx734_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx734_cur
    .local pmc match
    .lex "$/", match
    length rx734_eos, rx734_tgt
    set rx734_off, 0
    lt rx734_pos, 2, rx734_start
    sub rx734_off, rx734_pos, 1
    substr rx734_tgt, rx734_tgt, rx734_off
  rx734_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan738_done
    goto rxscan738_scan
  rxscan738_loop:
    ($P10) = rx734_cur."from"()
    inc $P10
    set rx734_pos, $P10
    ge rx734_pos, rx734_eos, rxscan738_done
  rxscan738_scan:
    set_addr $I10, rxscan738_loop
    rx734_cur."!mark_push"(0, rx734_pos, $I10)
  rxscan738_done:
.annotate "line", 347
  # rx subrule "name" subtype=capture negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."name"()
    unless $P10, rx734_fail
    rx734_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx734_pos = $P10."pos"()
  # rx rxquantr739 ** 0..1
    set_addr $I740, rxquantr739_done
    rx734_cur."!mark_push"(0, rx734_pos, $I740)
  rxquantr739_loop:
  # rx subrule "args" subtype=capture negate=
    rx734_cur."!cursor_pos"(rx734_pos)
    $P10 = rx734_cur."args"()
    unless $P10, rx734_fail
    rx734_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx734_pos = $P10."pos"()
    (rx734_rep) = rx734_cur."!mark_commit"($I740)
  rxquantr739_done:
.annotate "line", 346
  # rx pass
    rx734_cur."!cursor_pass"(rx734_pos, "term:sym<name>")
    rx734_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx734_pos)
    .return (rx734_cur)
  rx734_fail:
.annotate "line", 4
    (rx734_rep, rx734_pos, $I10, $P10) = rx734_cur."!mark_fail"(0)
    lt rx734_pos, -1, rx734_done
    eq rx734_pos, -1, rx734_fail
    jump $I10
  rx734_done:
    rx734_cur."!cursor_fail"()
    rx734_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx734_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("170_1259779041.86401") :method
.annotate "line", 4
    $P736 = self."!PREFIX__!subrule"("name", "")
    new $P737, "ResizablePMCArray"
    push $P737, $P736
    .return ($P737)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("171_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    (rx742_cur, rx742_pos, rx742_tgt) = self."!cursor_start"()
    rx742_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx742_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx742_cur
    .local pmc match
    .lex "$/", match
    length rx742_eos, rx742_tgt
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
.annotate "line", 351
  # rx literal  "pir::"
    add $I11, rx742_pos, 5
    gt $I11, rx742_eos, rx742_fail
    sub $I11, rx742_pos, rx742_off
    substr $S10, rx742_tgt, $I11, 5
    ne $S10, "pir::", rx742_fail
    add rx742_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_746_fail
    rx742_cur."!mark_push"(0, rx742_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx742_pos, rx742_off
    find_not_cclass $I11, 8192, rx742_tgt, $I10, rx742_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx742_fail
    add rx742_pos, rx742_off, $I11
    set_addr $I10, rxcap_746_fail
    ($I12, $I11) = rx742_cur."!mark_peek"($I10)
    rx742_cur."!cursor_pos"($I11)
    ($P10) = rx742_cur."!cursor_start"()
    $P10."!cursor_pass"(rx742_pos, "")
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_746_done
  rxcap_746_fail:
    goto rx742_fail
  rxcap_746_done:
  # rx rxquantr747 ** 0..1
    set_addr $I748, rxquantr747_done
    rx742_cur."!mark_push"(0, rx742_pos, $I748)
  rxquantr747_loop:
  # rx subrule "args" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."args"()
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx742_pos = $P10."pos"()
    (rx742_rep) = rx742_cur."!mark_commit"($I748)
  rxquantr747_done:
.annotate "line", 350
  # rx pass
    rx742_cur."!cursor_pass"(rx742_pos, "term:sym<pir::op>")
    rx742_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx742_pos)
    .return (rx742_cur)
  rx742_fail:
.annotate "line", 4
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    rx742_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("172_1259779041.86401") :method
.annotate "line", 4
    new $P744, "ResizablePMCArray"
    push $P744, "pir::"
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("173_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx750_tgt
    .local int rx750_pos
    .local int rx750_off
    .local int rx750_eos
    .local int rx750_rep
    .local pmc rx750_cur
    (rx750_cur, rx750_pos, rx750_tgt) = self."!cursor_start"()
    rx750_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx750_cur
    .local pmc match
    .lex "$/", match
    length rx750_eos, rx750_tgt
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
.annotate "line", 355
  # rx literal  "("
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, "(", rx750_fail
    add rx750_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx750_cur."!cursor_pos"(rx750_pos)
    $P10 = rx750_cur."arglist"()
    unless $P10, rx750_fail
    rx750_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx750_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx750_pos, 1
    gt $I11, rx750_eos, rx750_fail
    sub $I11, rx750_pos, rx750_off
    substr $S10, rx750_tgt, $I11, 1
    ne $S10, ")", rx750_fail
    add rx750_pos, 1
  # rx pass
    rx750_cur."!cursor_pass"(rx750_pos, "args")
    rx750_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx750_pos)
    .return (rx750_cur)
  rx750_fail:
.annotate "line", 4
    (rx750_rep, rx750_pos, $I10, $P10) = rx750_cur."!mark_fail"(0)
    lt rx750_pos, -1, rx750_done
    eq rx750_pos, -1, rx750_fail
    jump $I10
  rx750_done:
    rx750_cur."!cursor_fail"()
    rx750_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx750_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("174_1259779041.86401") :method
.annotate "line", 4
    $P752 = self."!PREFIX__!subrule"("arglist", "(")
    new $P753, "ResizablePMCArray"
    push $P753, $P752
    .return ($P753)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("175_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx756_tgt
    .local int rx756_pos
    .local int rx756_off
    .local int rx756_eos
    .local int rx756_rep
    .local pmc rx756_cur
    (rx756_cur, rx756_pos, rx756_tgt) = self."!cursor_start"()
    rx756_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx756_cur
    .local pmc match
    .lex "$/", match
    length rx756_eos, rx756_tgt
    set rx756_off, 0
    lt rx756_pos, 2, rx756_start
    sub rx756_off, rx756_pos, 1
    substr rx756_tgt, rx756_tgt, rx756_off
  rx756_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan760_done
    goto rxscan760_scan
  rxscan760_loop:
    ($P10) = rx756_cur."from"()
    inc $P10
    set rx756_pos, $P10
    ge rx756_pos, rx756_eos, rxscan760_done
  rxscan760_scan:
    set_addr $I10, rxscan760_loop
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
  rxscan760_done:
.annotate "line", 359
  # rx subrule "ws" subtype=method negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."ws"()
    unless $P10, rx756_fail
    rx756_pos = $P10."pos"()
  alt761_0:
.annotate "line", 360
    set_addr $I10, alt761_1
    rx756_cur."!mark_push"(0, rx756_pos, $I10)
.annotate "line", 361
  # rx subrule "EXPR" subtype=capture negate=
    rx756_cur."!cursor_pos"(rx756_pos)
    $P10 = rx756_cur."EXPR"("f=")
    unless $P10, rx756_fail
    rx756_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx756_pos = $P10."pos"()
    goto alt761_end
  alt761_1:
  alt761_end:
.annotate "line", 358
  # rx pass
    rx756_cur."!cursor_pass"(rx756_pos, "arglist")
    rx756_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx756_pos)
    .return (rx756_cur)
  rx756_fail:
.annotate "line", 4
    (rx756_rep, rx756_pos, $I10, $P10) = rx756_cur."!mark_fail"(0)
    lt rx756_pos, -1, rx756_done
    eq rx756_pos, -1, rx756_fail
    jump $I10
  rx756_done:
    rx756_cur."!cursor_fail"()
    rx756_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx756_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("176_1259779041.86401") :method
.annotate "line", 4
    $P758 = self."!PREFIX__!subrule"("", "")
    new $P759, "ResizablePMCArray"
    push $P759, $P758
    .return ($P759)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("177_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx763_tgt
    .local int rx763_pos
    .local int rx763_off
    .local int rx763_eos
    .local int rx763_rep
    .local pmc rx763_cur
    (rx763_cur, rx763_pos, rx763_tgt) = self."!cursor_start"()
    rx763_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx763_cur
    .local pmc match
    .lex "$/", match
    length rx763_eos, rx763_tgt
    set rx763_off, 0
    lt rx763_pos, 2, rx763_start
    sub rx763_off, rx763_pos, 1
    substr rx763_tgt, rx763_tgt, rx763_off
  rx763_start:
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
.annotate "line", 367
  # rx subrule "value" subtype=capture negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."value"()
    unless $P10, rx763_fail
    rx763_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx763_pos = $P10."pos"()
  # rx pass
    rx763_cur."!cursor_pass"(rx763_pos, "term:sym<value>")
    rx763_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx763_pos)
    .return (rx763_cur)
  rx763_fail:
.annotate "line", 4
    (rx763_rep, rx763_pos, $I10, $P10) = rx763_cur."!mark_fail"(0)
    lt rx763_pos, -1, rx763_done
    eq rx763_pos, -1, rx763_fail
    jump $I10
  rx763_done:
    rx763_cur."!cursor_fail"()
    rx763_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx763_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("178_1259779041.86401") :method
.annotate "line", 4
    $P765 = self."!PREFIX__!subrule"("value", "")
    new $P766, "ResizablePMCArray"
    push $P766, $P765
    .return ($P766)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("179_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx769_tgt
    .local int rx769_pos
    .local int rx769_off
    .local int rx769_eos
    .local int rx769_rep
    .local pmc rx769_cur
    (rx769_cur, rx769_pos, rx769_tgt) = self."!cursor_start"()
    rx769_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx769_cur
    .local pmc match
    .lex "$/", match
    length rx769_eos, rx769_tgt
    set rx769_off, 0
    lt rx769_pos, 2, rx769_start
    sub rx769_off, rx769_pos, 1
    substr rx769_tgt, rx769_tgt, rx769_off
  rx769_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan774_done
    goto rxscan774_scan
  rxscan774_loop:
    ($P10) = rx769_cur."from"()
    inc $P10
    set rx769_pos, $P10
    ge rx769_pos, rx769_eos, rxscan774_done
  rxscan774_scan:
    set_addr $I10, rxscan774_loop
    rx769_cur."!mark_push"(0, rx769_pos, $I10)
  rxscan774_done:
  alt775_0:
.annotate "line", 369
    set_addr $I10, alt775_1
    rx769_cur."!mark_push"(0, rx769_pos, $I10)
.annotate "line", 370
  # rx subrule "quote" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."quote"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx769_pos = $P10."pos"()
    goto alt775_end
  alt775_1:
.annotate "line", 371
  # rx subrule "number" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."number"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx769_pos = $P10."pos"()
  alt775_end:
.annotate "line", 369
  # rx pass
    rx769_cur."!cursor_pass"(rx769_pos, "value")
    rx769_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx769_pos)
    .return (rx769_cur)
  rx769_fail:
.annotate "line", 4
    (rx769_rep, rx769_pos, $I10, $P10) = rx769_cur."!mark_fail"(0)
    lt rx769_pos, -1, rx769_done
    eq rx769_pos, -1, rx769_fail
    jump $I10
  rx769_done:
    rx769_cur."!cursor_fail"()
    rx769_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx769_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("180_1259779041.86401") :method
.annotate "line", 4
    $P771 = self."!PREFIX__!subrule"("number", "")
    $P772 = self."!PREFIX__!subrule"("quote", "")
    new $P773, "ResizablePMCArray"
    push $P773, $P771
    push $P773, $P772
    .return ($P773)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("181_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx777_cur
    .local pmc match
    .lex "$/", match
    length rx777_eos, rx777_tgt
    set rx777_off, 0
    lt rx777_pos, 2, rx777_start
    sub rx777_off, rx777_pos, 1
    substr rx777_tgt, rx777_tgt, rx777_off
  rx777_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan780_done
    goto rxscan780_scan
  rxscan780_loop:
    ($P10) = rx777_cur."from"()
    inc $P10
    set rx777_pos, $P10
    ge rx777_pos, rx777_eos, rxscan780_done
  rxscan780_scan:
    set_addr $I10, rxscan780_loop
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  rxscan780_done:
.annotate "line", 375
  # rx subcapture "sign"
    set_addr $I10, rxcap_783_fail
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  # rx rxquantr781 ** 0..1
    set_addr $I782, rxquantr781_done
    rx777_cur."!mark_push"(0, rx777_pos, $I782)
  rxquantr781_loop:
  # rx enumcharlist negate=0 
    ge rx777_pos, rx777_eos, rx777_fail
    sub $I10, rx777_pos, rx777_off
    substr $S10, rx777_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx777_fail
    inc rx777_pos
    (rx777_rep) = rx777_cur."!mark_commit"($I782)
  rxquantr781_done:
    set_addr $I10, rxcap_783_fail
    ($I12, $I11) = rx777_cur."!mark_peek"($I10)
    rx777_cur."!cursor_pos"($I11)
    ($P10) = rx777_cur."!cursor_start"()
    $P10."!cursor_pass"(rx777_pos, "")
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_783_done
  rxcap_783_fail:
    goto rx777_fail
  rxcap_783_done:
  alt784_0:
.annotate "line", 376
    set_addr $I10, alt784_1
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."dec_number"()
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx777_pos = $P10."pos"()
    goto alt784_end
  alt784_1:
  # rx subrule "integer" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."integer"()
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx777_pos = $P10."pos"()
  alt784_end:
.annotate "line", 374
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "number")
    rx777_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 4
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("182_1259779041.86401") :method
.annotate "line", 4
    new $P779, "ResizablePMCArray"
    push $P779, ""
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("183_1259779041.86401") :method
.annotate "line", 379
    $P786 = self."!protoregex"("quote")
    .return ($P786)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("184_1259779041.86401") :method
.annotate "line", 379
    $P788 = self."!PREFIX__!protoregex"("quote")
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("185_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx790_tgt
    .local int rx790_pos
    .local int rx790_off
    .local int rx790_eos
    .local int rx790_rep
    .local pmc rx790_cur
    (rx790_cur, rx790_pos, rx790_tgt) = self."!cursor_start"()
    rx790_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx790_cur
    .local pmc match
    .lex "$/", match
    length rx790_eos, rx790_tgt
    set rx790_off, 0
    lt rx790_pos, 2, rx790_start
    sub rx790_off, rx790_pos, 1
    substr rx790_tgt, rx790_tgt, rx790_off
  rx790_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan793_done
    goto rxscan793_scan
  rxscan793_loop:
    ($P10) = rx790_cur."from"()
    inc $P10
    set rx790_pos, $P10
    ge rx790_pos, rx790_eos, rxscan793_done
  rxscan793_scan:
    set_addr $I10, rxscan793_loop
    rx790_cur."!mark_push"(0, rx790_pos, $I10)
  rxscan793_done:
.annotate "line", 380
  # rx enumcharlist negate=0 zerowidth
    ge rx790_pos, rx790_eos, rx790_fail
    sub $I10, rx790_pos, rx790_off
    substr $S10, rx790_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx790_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx790_cur."!cursor_pos"(rx790_pos)
    $P10 = rx790_cur."quote_EXPR"(":q")
    unless $P10, rx790_fail
    rx790_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx790_pos = $P10."pos"()
  # rx pass
    rx790_cur."!cursor_pass"(rx790_pos, "quote:sym<apos>")
    rx790_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx790_pos)
    .return (rx790_cur)
  rx790_fail:
.annotate "line", 4
    (rx790_rep, rx790_pos, $I10, $P10) = rx790_cur."!mark_fail"(0)
    lt rx790_pos, -1, rx790_done
    eq rx790_pos, -1, rx790_fail
    jump $I10
  rx790_done:
    rx790_cur."!cursor_fail"()
    rx790_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx790_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("186_1259779041.86401") :method
.annotate "line", 4
    new $P792, "ResizablePMCArray"
    push $P792, "'"
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("187_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx795_tgt
    .local int rx795_pos
    .local int rx795_off
    .local int rx795_eos
    .local int rx795_rep
    .local pmc rx795_cur
    (rx795_cur, rx795_pos, rx795_tgt) = self."!cursor_start"()
    rx795_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx795_cur
    .local pmc match
    .lex "$/", match
    length rx795_eos, rx795_tgt
    set rx795_off, 0
    lt rx795_pos, 2, rx795_start
    sub rx795_off, rx795_pos, 1
    substr rx795_tgt, rx795_tgt, rx795_off
  rx795_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan798_done
    goto rxscan798_scan
  rxscan798_loop:
    ($P10) = rx795_cur."from"()
    inc $P10
    set rx795_pos, $P10
    ge rx795_pos, rx795_eos, rxscan798_done
  rxscan798_scan:
    set_addr $I10, rxscan798_loop
    rx795_cur."!mark_push"(0, rx795_pos, $I10)
  rxscan798_done:
.annotate "line", 381
  # rx enumcharlist negate=0 zerowidth
    ge rx795_pos, rx795_eos, rx795_fail
    sub $I10, rx795_pos, rx795_off
    substr $S10, rx795_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx795_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx795_cur."!cursor_pos"(rx795_pos)
    $P10 = rx795_cur."quote_EXPR"(":qq")
    unless $P10, rx795_fail
    rx795_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx795_pos = $P10."pos"()
  # rx pass
    rx795_cur."!cursor_pass"(rx795_pos, "quote:sym<dblq>")
    rx795_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx795_pos)
    .return (rx795_cur)
  rx795_fail:
.annotate "line", 4
    (rx795_rep, rx795_pos, $I10, $P10) = rx795_cur."!mark_fail"(0)
    lt rx795_pos, -1, rx795_done
    eq rx795_pos, -1, rx795_fail
    jump $I10
  rx795_done:
    rx795_cur."!cursor_fail"()
    rx795_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx795_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("188_1259779041.86401") :method
.annotate "line", 4
    new $P797, "ResizablePMCArray"
    push $P797, "\""
    .return ($P797)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("189_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx800_tgt
    .local int rx800_pos
    .local int rx800_off
    .local int rx800_eos
    .local int rx800_rep
    .local pmc rx800_cur
    (rx800_cur, rx800_pos, rx800_tgt) = self."!cursor_start"()
    rx800_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx800_cur
    .local pmc match
    .lex "$/", match
    length rx800_eos, rx800_tgt
    set rx800_off, 0
    lt rx800_pos, 2, rx800_start
    sub rx800_off, rx800_pos, 1
    substr rx800_tgt, rx800_tgt, rx800_off
  rx800_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan804_done
    goto rxscan804_scan
  rxscan804_loop:
    ($P10) = rx800_cur."from"()
    inc $P10
    set rx800_pos, $P10
    ge rx800_pos, rx800_eos, rxscan804_done
  rxscan804_scan:
    set_addr $I10, rxscan804_loop
    rx800_cur."!mark_push"(0, rx800_pos, $I10)
  rxscan804_done:
.annotate "line", 382
  # rx literal  "q"
    add $I11, rx800_pos, 1
    gt $I11, rx800_eos, rx800_fail
    sub $I11, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I11, 1
    ne $S10, "q", rx800_fail
    add rx800_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx800_pos, rx800_eos, rx800_fail
    sub $I10, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx800_fail
  # rx subrule "ws" subtype=method negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."ws"()
    unless $P10, rx800_fail
    rx800_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."quote_EXPR"(":q")
    unless $P10, rx800_fail
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx800_pos = $P10."pos"()
  # rx pass
    rx800_cur."!cursor_pass"(rx800_pos, "quote:sym<q>")
    rx800_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx800_pos)
    .return (rx800_cur)
  rx800_fail:
.annotate "line", 4
    (rx800_rep, rx800_pos, $I10, $P10) = rx800_cur."!mark_fail"(0)
    lt rx800_pos, -1, rx800_done
    eq rx800_pos, -1, rx800_fail
    jump $I10
  rx800_done:
    rx800_cur."!cursor_fail"()
    rx800_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx800_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("190_1259779041.86401") :method
.annotate "line", 4
    $P802 = self."!PREFIX__!subrule"("", "q")
    new $P803, "ResizablePMCArray"
    push $P803, $P802
    .return ($P803)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("191_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx806_tgt
    .local int rx806_pos
    .local int rx806_off
    .local int rx806_eos
    .local int rx806_rep
    .local pmc rx806_cur
    (rx806_cur, rx806_pos, rx806_tgt) = self."!cursor_start"()
    rx806_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx806_cur
    .local pmc match
    .lex "$/", match
    length rx806_eos, rx806_tgt
    set rx806_off, 0
    lt rx806_pos, 2, rx806_start
    sub rx806_off, rx806_pos, 1
    substr rx806_tgt, rx806_tgt, rx806_off
  rx806_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan810_done
    goto rxscan810_scan
  rxscan810_loop:
    ($P10) = rx806_cur."from"()
    inc $P10
    set rx806_pos, $P10
    ge rx806_pos, rx806_eos, rxscan810_done
  rxscan810_scan:
    set_addr $I10, rxscan810_loop
    rx806_cur."!mark_push"(0, rx806_pos, $I10)
  rxscan810_done:
.annotate "line", 383
  # rx literal  "qq"
    add $I11, rx806_pos, 2
    gt $I11, rx806_eos, rx806_fail
    sub $I11, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I11, 2
    ne $S10, "qq", rx806_fail
    add rx806_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx806_pos, rx806_eos, rx806_fail
    sub $I10, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx806_fail
  # rx subrule "ws" subtype=method negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."ws"()
    unless $P10, rx806_fail
    rx806_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."quote_EXPR"(":qq")
    unless $P10, rx806_fail
    rx806_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx806_pos = $P10."pos"()
  # rx pass
    rx806_cur."!cursor_pass"(rx806_pos, "quote:sym<qq>")
    rx806_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx806_pos)
    .return (rx806_cur)
  rx806_fail:
.annotate "line", 4
    (rx806_rep, rx806_pos, $I10, $P10) = rx806_cur."!mark_fail"(0)
    lt rx806_pos, -1, rx806_done
    eq rx806_pos, -1, rx806_fail
    jump $I10
  rx806_done:
    rx806_cur."!cursor_fail"()
    rx806_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx806_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("192_1259779041.86401") :method
.annotate "line", 4
    $P808 = self."!PREFIX__!subrule"("", "qq")
    new $P809, "ResizablePMCArray"
    push $P809, $P808
    .return ($P809)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("193_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx812_tgt
    .local int rx812_pos
    .local int rx812_off
    .local int rx812_eos
    .local int rx812_rep
    .local pmc rx812_cur
    (rx812_cur, rx812_pos, rx812_tgt) = self."!cursor_start"()
    rx812_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx812_cur
    .local pmc match
    .lex "$/", match
    length rx812_eos, rx812_tgt
    set rx812_off, 0
    lt rx812_pos, 2, rx812_start
    sub rx812_off, rx812_pos, 1
    substr rx812_tgt, rx812_tgt, rx812_off
  rx812_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan816_done
    goto rxscan816_scan
  rxscan816_loop:
    ($P10) = rx812_cur."from"()
    inc $P10
    set rx812_pos, $P10
    ge rx812_pos, rx812_eos, rxscan816_done
  rxscan816_scan:
    set_addr $I10, rxscan816_loop
    rx812_cur."!mark_push"(0, rx812_pos, $I10)
  rxscan816_done:
.annotate "line", 384
  # rx literal  "Q"
    add $I11, rx812_pos, 1
    gt $I11, rx812_eos, rx812_fail
    sub $I11, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I11, 1
    ne $S10, "Q", rx812_fail
    add rx812_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx812_pos, rx812_eos, rx812_fail
    sub $I10, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx812_fail
  # rx subrule "ws" subtype=method negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."ws"()
    unless $P10, rx812_fail
    rx812_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."quote_EXPR"()
    unless $P10, rx812_fail
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx812_pos = $P10."pos"()
  # rx pass
    rx812_cur."!cursor_pass"(rx812_pos, "quote:sym<Q>")
    rx812_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx812_pos)
    .return (rx812_cur)
  rx812_fail:
.annotate "line", 4
    (rx812_rep, rx812_pos, $I10, $P10) = rx812_cur."!mark_fail"(0)
    lt rx812_pos, -1, rx812_done
    eq rx812_pos, -1, rx812_fail
    jump $I10
  rx812_done:
    rx812_cur."!cursor_fail"()
    rx812_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx812_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("194_1259779041.86401") :method
.annotate "line", 4
    $P814 = self."!PREFIX__!subrule"("", "Q")
    new $P815, "ResizablePMCArray"
    push $P815, $P814
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("195_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx818_tgt
    .local int rx818_pos
    .local int rx818_off
    .local int rx818_eos
    .local int rx818_rep
    .local pmc rx818_cur
    (rx818_cur, rx818_pos, rx818_tgt) = self."!cursor_start"()
    rx818_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx818_cur
    .local pmc match
    .lex "$/", match
    length rx818_eos, rx818_tgt
    set rx818_off, 0
    lt rx818_pos, 2, rx818_start
    sub rx818_off, rx818_pos, 1
    substr rx818_tgt, rx818_tgt, rx818_off
  rx818_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan822_done
    goto rxscan822_scan
  rxscan822_loop:
    ($P10) = rx818_cur."from"()
    inc $P10
    set rx818_pos, $P10
    ge rx818_pos, rx818_eos, rxscan822_done
  rxscan822_scan:
    set_addr $I10, rxscan822_loop
    rx818_cur."!mark_push"(0, rx818_pos, $I10)
  rxscan822_done:
.annotate "line", 385
  # rx literal  "Q:PIR"
    add $I11, rx818_pos, 5
    gt $I11, rx818_eos, rx818_fail
    sub $I11, rx818_pos, rx818_off
    substr $S10, rx818_tgt, $I11, 5
    ne $S10, "Q:PIR", rx818_fail
    add rx818_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx818_cur."!cursor_pos"(rx818_pos)
    $P10 = rx818_cur."ws"()
    unless $P10, rx818_fail
    rx818_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx818_cur."!cursor_pos"(rx818_pos)
    $P10 = rx818_cur."quote_EXPR"()
    unless $P10, rx818_fail
    rx818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx818_pos = $P10."pos"()
  # rx pass
    rx818_cur."!cursor_pass"(rx818_pos, "quote:sym<Q:PIR>")
    rx818_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx818_pos)
    .return (rx818_cur)
  rx818_fail:
.annotate "line", 4
    (rx818_rep, rx818_pos, $I10, $P10) = rx818_cur."!mark_fail"(0)
    lt rx818_pos, -1, rx818_done
    eq rx818_pos, -1, rx818_fail
    jump $I10
  rx818_done:
    rx818_cur."!cursor_fail"()
    rx818_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx818_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("196_1259779041.86401") :method
.annotate "line", 4
    $P820 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P821, "ResizablePMCArray"
    push $P821, $P820
    .return ($P821)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("197_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    (rx824_cur, rx824_pos, rx824_tgt) = self."!cursor_start"()
    rx824_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx824_cur
    .local pmc match
    .lex "$/", match
    length rx824_eos, rx824_tgt
    set rx824_off, 0
    lt rx824_pos, 2, rx824_start
    sub rx824_off, rx824_pos, 1
    substr rx824_tgt, rx824_tgt, rx824_off
  rx824_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan827_done
    goto rxscan827_scan
  rxscan827_loop:
    ($P10) = rx824_cur."from"()
    inc $P10
    set rx824_pos, $P10
    ge rx824_pos, rx824_eos, rxscan827_done
  rxscan827_scan:
    set_addr $I10, rxscan827_loop
    rx824_cur."!mark_push"(0, rx824_pos, $I10)
  rxscan827_done:
.annotate "line", 387
  # rx enumcharlist negate=0 zerowidth
    ge rx824_pos, rx824_eos, rx824_fail
    sub $I10, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx824_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."quotemod_check"("s")
    unless $P10, rx824_fail
  # rx subrule "variable" subtype=capture negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."variable"()
    unless $P10, rx824_fail
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx824_pos = $P10."pos"()
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "quote_escape:sym<$>")
    rx824_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx824_pos)
    .return (rx824_cur)
  rx824_fail:
.annotate "line", 4
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    rx824_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("198_1259779041.86401") :method
.annotate "line", 4
    new $P826, "ResizablePMCArray"
    push $P826, "$"
    .return ($P826)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("199_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx829_tgt
    .local int rx829_pos
    .local int rx829_off
    .local int rx829_eos
    .local int rx829_rep
    .local pmc rx829_cur
    (rx829_cur, rx829_pos, rx829_tgt) = self."!cursor_start"()
    rx829_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx829_cur
    .local pmc match
    .lex "$/", match
    length rx829_eos, rx829_tgt
    set rx829_off, 0
    lt rx829_pos, 2, rx829_start
    sub rx829_off, rx829_pos, 1
    substr rx829_tgt, rx829_tgt, rx829_off
  rx829_start:
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
.annotate "line", 388
  # rx enumcharlist negate=0 zerowidth
    ge rx829_pos, rx829_eos, rx829_fail
    sub $I10, rx829_pos, rx829_off
    substr $S10, rx829_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx829_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."quotemod_check"("c")
    unless $P10, rx829_fail
  # rx subrule "block" subtype=capture negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."block"()
    unless $P10, rx829_fail
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx829_pos = $P10."pos"()
  # rx pass
    rx829_cur."!cursor_pass"(rx829_pos, "quote_escape:sym<{ }>")
    rx829_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx829_pos)
    .return (rx829_cur)
  rx829_fail:
.annotate "line", 4
    (rx829_rep, rx829_pos, $I10, $P10) = rx829_cur."!mark_fail"(0)
    lt rx829_pos, -1, rx829_done
    eq rx829_pos, -1, rx829_fail
    jump $I10
  rx829_done:
    rx829_cur."!cursor_fail"()
    rx829_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx829_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("200_1259779041.86401") :method
.annotate "line", 4
    new $P831, "ResizablePMCArray"
    push $P831, "{"
    .return ($P831)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("201_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx834_tgt
    .local int rx834_pos
    .local int rx834_off
    .local int rx834_eos
    .local int rx834_rep
    .local pmc rx834_cur
    (rx834_cur, rx834_pos, rx834_tgt) = self."!cursor_start"()
    rx834_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx834_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx834_cur
    .local pmc match
    .lex "$/", match
    length rx834_eos, rx834_tgt
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
.annotate "line", 390
  # rx literal  "("
    add $I11, rx834_pos, 1
    gt $I11, rx834_eos, rx834_fail
    sub $I11, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I11, 1
    ne $S10, "(", rx834_fail
    add rx834_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."ws"()
    unless $P10, rx834_fail
    rx834_pos = $P10."pos"()
  # rx rxquantr839 ** 0..1
    set_addr $I840, rxquantr839_done
    rx834_cur."!mark_push"(0, rx834_pos, $I840)
  rxquantr839_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."EXPR"()
    unless $P10, rx834_fail
    rx834_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx834_pos = $P10."pos"()
    (rx834_rep) = rx834_cur."!mark_commit"($I840)
  rxquantr839_done:
  # rx literal  ")"
    add $I11, rx834_pos, 1
    gt $I11, rx834_eos, rx834_fail
    sub $I11, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I11, 1
    ne $S10, ")", rx834_fail
    add rx834_pos, 1
  # rx pass
    rx834_cur."!cursor_pass"(rx834_pos, "circumfix:sym<( )>")
    rx834_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx834_pos)
    .return (rx834_cur)
  rx834_fail:
.annotate "line", 4
    (rx834_rep, rx834_pos, $I10, $P10) = rx834_cur."!mark_fail"(0)
    lt rx834_pos, -1, rx834_done
    eq rx834_pos, -1, rx834_fail
    jump $I10
  rx834_done:
    rx834_cur."!cursor_fail"()
    rx834_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx834_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("202_1259779041.86401") :method
.annotate "line", 4
    $P836 = self."!PREFIX__!subrule"("", "(")
    new $P837, "ResizablePMCArray"
    push $P837, $P836
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("203_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx842_tgt
    .local int rx842_pos
    .local int rx842_off
    .local int rx842_eos
    .local int rx842_rep
    .local pmc rx842_cur
    (rx842_cur, rx842_pos, rx842_tgt) = self."!cursor_start"()
    rx842_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx842_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx842_cur
    .local pmc match
    .lex "$/", match
    length rx842_eos, rx842_tgt
    set rx842_off, 0
    lt rx842_pos, 2, rx842_start
    sub rx842_off, rx842_pos, 1
    substr rx842_tgt, rx842_tgt, rx842_off
  rx842_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan846_done
    goto rxscan846_scan
  rxscan846_loop:
    ($P10) = rx842_cur."from"()
    inc $P10
    set rx842_pos, $P10
    ge rx842_pos, rx842_eos, rxscan846_done
  rxscan846_scan:
    set_addr $I10, rxscan846_loop
    rx842_cur."!mark_push"(0, rx842_pos, $I10)
  rxscan846_done:
.annotate "line", 391
  # rx literal  "["
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, "[", rx842_fail
    add rx842_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."ws"()
    unless $P10, rx842_fail
    rx842_pos = $P10."pos"()
  # rx rxquantr847 ** 0..1
    set_addr $I848, rxquantr847_done
    rx842_cur."!mark_push"(0, rx842_pos, $I848)
  rxquantr847_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."EXPR"()
    unless $P10, rx842_fail
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx842_pos = $P10."pos"()
    (rx842_rep) = rx842_cur."!mark_commit"($I848)
  rxquantr847_done:
  # rx literal  "]"
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, "]", rx842_fail
    add rx842_pos, 1
  # rx pass
    rx842_cur."!cursor_pass"(rx842_pos, "circumfix:sym<[ ]>")
    rx842_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx842_pos)
    .return (rx842_cur)
  rx842_fail:
.annotate "line", 4
    (rx842_rep, rx842_pos, $I10, $P10) = rx842_cur."!mark_fail"(0)
    lt rx842_pos, -1, rx842_done
    eq rx842_pos, -1, rx842_fail
    jump $I10
  rx842_done:
    rx842_cur."!cursor_fail"()
    rx842_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx842_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("204_1259779041.86401") :method
.annotate "line", 4
    $P844 = self."!PREFIX__!subrule"("", "[")
    new $P845, "ResizablePMCArray"
    push $P845, $P844
    .return ($P845)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("205_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx850_tgt
    .local int rx850_pos
    .local int rx850_off
    .local int rx850_eos
    .local int rx850_rep
    .local pmc rx850_cur
    (rx850_cur, rx850_pos, rx850_tgt) = self."!cursor_start"()
    rx850_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx850_cur
    .local pmc match
    .lex "$/", match
    length rx850_eos, rx850_tgt
    set rx850_off, 0
    lt rx850_pos, 2, rx850_start
    sub rx850_off, rx850_pos, 1
    substr rx850_tgt, rx850_tgt, rx850_off
  rx850_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan853_done
    goto rxscan853_scan
  rxscan853_loop:
    ($P10) = rx850_cur."from"()
    inc $P10
    set rx850_pos, $P10
    ge rx850_pos, rx850_eos, rxscan853_done
  rxscan853_scan:
    set_addr $I10, rxscan853_loop
    rx850_cur."!mark_push"(0, rx850_pos, $I10)
  rxscan853_done:
.annotate "line", 392
  # rx enumcharlist negate=0 zerowidth
    ge rx850_pos, rx850_eos, rx850_fail
    sub $I10, rx850_pos, rx850_off
    substr $S10, rx850_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx850_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx850_cur."!cursor_pos"(rx850_pos)
    $P10 = rx850_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx850_fail
    rx850_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx850_pos = $P10."pos"()
  # rx pass
    rx850_cur."!cursor_pass"(rx850_pos, "circumfix:sym<ang>")
    rx850_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx850_pos)
    .return (rx850_cur)
  rx850_fail:
.annotate "line", 4
    (rx850_rep, rx850_pos, $I10, $P10) = rx850_cur."!mark_fail"(0)
    lt rx850_pos, -1, rx850_done
    eq rx850_pos, -1, rx850_fail
    jump $I10
  rx850_done:
    rx850_cur."!cursor_fail"()
    rx850_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx850_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("206_1259779041.86401") :method
.annotate "line", 4
    new $P852, "ResizablePMCArray"
    push $P852, "<"
    .return ($P852)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("207_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx855_tgt
    .local int rx855_pos
    .local int rx855_off
    .local int rx855_eos
    .local int rx855_rep
    .local pmc rx855_cur
    (rx855_cur, rx855_pos, rx855_tgt) = self."!cursor_start"()
    rx855_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .lex unicode:"$\x{a2}", rx855_cur
    .local pmc match
    .lex "$/", match
    length rx855_eos, rx855_tgt
    set rx855_off, 0
    lt rx855_pos, 2, rx855_start
    sub rx855_off, rx855_pos, 1
    substr rx855_tgt, rx855_tgt, rx855_off
  rx855_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan858_done
    goto rxscan858_scan
  rxscan858_loop:
    ($P10) = rx855_cur."from"()
    inc $P10
    set rx855_pos, $P10
    ge rx855_pos, rx855_eos, rxscan858_done
  rxscan858_scan:
    set_addr $I10, rxscan858_loop
    rx855_cur."!mark_push"(0, rx855_pos, $I10)
  rxscan858_done:
.annotate "line", 393
  # rx enumcharlist negate=0 zerowidth
    ge rx855_pos, rx855_eos, rx855_fail
    sub $I10, rx855_pos, rx855_off
    substr $S10, rx855_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx855_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx855_fail
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx855_pos = $P10."pos"()
  # rx pass
    rx855_cur."!cursor_pass"(rx855_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx855_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx855_pos)
    .return (rx855_cur)
  rx855_fail:
.annotate "line", 4
    (rx855_rep, rx855_pos, $I10, $P10) = rx855_cur."!mark_fail"(0)
    lt rx855_pos, -1, rx855_done
    eq rx855_pos, -1, rx855_fail
    jump $I10
  rx855_done:
    rx855_cur."!cursor_fail"()
    rx855_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx855_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("208_1259779041.86401") :method
.annotate "line", 4
    new $P857, "ResizablePMCArray"
    push $P857, unicode:"\x{ab}"
    .return ($P857)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("209_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx860_tgt
    .local int rx860_pos
    .local int rx860_off
    .local int rx860_eos
    .local int rx860_rep
    .local pmc rx860_cur
    (rx860_cur, rx860_pos, rx860_tgt) = self."!cursor_start"()
    rx860_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx860_cur
    .local pmc match
    .lex "$/", match
    length rx860_eos, rx860_tgt
    set rx860_off, 0
    lt rx860_pos, 2, rx860_start
    sub rx860_off, rx860_pos, 1
    substr rx860_tgt, rx860_tgt, rx860_off
  rx860_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan863_done
    goto rxscan863_scan
  rxscan863_loop:
    ($P10) = rx860_cur."from"()
    inc $P10
    set rx860_pos, $P10
    ge rx860_pos, rx860_eos, rxscan863_done
  rxscan863_scan:
    set_addr $I10, rxscan863_loop
    rx860_cur."!mark_push"(0, rx860_pos, $I10)
  rxscan863_done:
.annotate "line", 394
  # rx enumcharlist negate=0 zerowidth
    ge rx860_pos, rx860_eos, rx860_fail
    sub $I10, rx860_pos, rx860_off
    substr $S10, rx860_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx860_fail
  # rx subrule "pblock" subtype=capture negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."pblock"()
    unless $P10, rx860_fail
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx860_pos = $P10."pos"()
  # rx pass
    rx860_cur."!cursor_pass"(rx860_pos, "circumfix:sym<{ }>")
    rx860_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx860_pos)
    .return (rx860_cur)
  rx860_fail:
.annotate "line", 4
    (rx860_rep, rx860_pos, $I10, $P10) = rx860_cur."!mark_fail"(0)
    lt rx860_pos, -1, rx860_done
    eq rx860_pos, -1, rx860_fail
    jump $I10
  rx860_done:
    rx860_cur."!cursor_fail"()
    rx860_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx860_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("210_1259779041.86401") :method
.annotate "line", 4
    new $P862, "ResizablePMCArray"
    push $P862, "{"
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("211_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx865_tgt
    .local int rx865_pos
    .local int rx865_off
    .local int rx865_eos
    .local int rx865_rep
    .local pmc rx865_cur
    (rx865_cur, rx865_pos, rx865_tgt) = self."!cursor_start"()
    rx865_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx865_cur
    .local pmc match
    .lex "$/", match
    length rx865_eos, rx865_tgt
    set rx865_off, 0
    lt rx865_pos, 2, rx865_start
    sub rx865_off, rx865_pos, 1
    substr rx865_tgt, rx865_tgt, rx865_off
  rx865_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan869_done
    goto rxscan869_scan
  rxscan869_loop:
    ($P10) = rx865_cur."from"()
    inc $P10
    set rx865_pos, $P10
    ge rx865_pos, rx865_eos, rxscan869_done
  rxscan869_scan:
    set_addr $I10, rxscan869_loop
    rx865_cur."!mark_push"(0, rx865_pos, $I10)
  rxscan869_done:
.annotate "line", 395
  # rx subrule "sigil" subtype=capture negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."sigil"()
    unless $P10, rx865_fail
    rx865_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx865_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx865_pos, 1
    gt $I11, rx865_eos, rx865_fail
    sub $I11, rx865_pos, rx865_off
    substr $S10, rx865_tgt, $I11, 1
    ne $S10, "(", rx865_fail
    add rx865_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."semilist"()
    unless $P10, rx865_fail
    rx865_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx865_pos = $P10."pos"()
  alt870_0:
    set_addr $I10, alt870_1
    rx865_cur."!mark_push"(0, rx865_pos, $I10)
  # rx literal  ")"
    add $I11, rx865_pos, 1
    gt $I11, rx865_eos, rx865_fail
    sub $I11, rx865_pos, rx865_off
    substr $S10, rx865_tgt, $I11, 1
    ne $S10, ")", rx865_fail
    add rx865_pos, 1
    goto alt870_end
  alt870_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."FAILGOAL"("')'")
    unless $P10, rx865_fail
    rx865_pos = $P10."pos"()
  alt870_end:
  # rx pass
    rx865_cur."!cursor_pass"(rx865_pos, "circumfix:sym<sigil>")
    rx865_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx865_pos)
    .return (rx865_cur)
  rx865_fail:
.annotate "line", 4
    (rx865_rep, rx865_pos, $I10, $P10) = rx865_cur."!mark_fail"(0)
    lt rx865_pos, -1, rx865_done
    eq rx865_pos, -1, rx865_fail
    jump $I10
  rx865_done:
    rx865_cur."!cursor_fail"()
    rx865_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx865_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("212_1259779041.86401") :method
.annotate "line", 4
    $P867 = self."!PREFIX__!subrule"("sigil", "")
    new $P868, "ResizablePMCArray"
    push $P868, $P867
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("213_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 4
    .local string rx873_tgt
    .local int rx873_pos
    .local int rx873_off
    .local int rx873_eos
    .local int rx873_rep
    .local pmc rx873_cur
    (rx873_cur, rx873_pos, rx873_tgt) = self."!cursor_start"()
    rx873_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx873_cur
    .local pmc match
    .lex "$/", match
    length rx873_eos, rx873_tgt
    set rx873_off, 0
    lt rx873_pos, 2, rx873_start
    sub rx873_off, rx873_pos, 1
    substr rx873_tgt, rx873_tgt, rx873_off
  rx873_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan876_done
    goto rxscan876_scan
  rxscan876_loop:
    ($P10) = rx873_cur."from"()
    inc $P10
    set rx873_pos, $P10
    ge rx873_pos, rx873_eos, rxscan876_done
  rxscan876_scan:
    set_addr $I10, rxscan876_loop
    rx873_cur."!mark_push"(0, rx873_pos, $I10)
  rxscan876_done:
.annotate "line", 397
  # rx subrule "ws" subtype=method negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."ws"()
    unless $P10, rx873_fail
    rx873_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."statement"()
    unless $P10, rx873_fail
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx873_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."ws"()
    unless $P10, rx873_fail
    rx873_pos = $P10."pos"()
  # rx pass
    rx873_cur."!cursor_pass"(rx873_pos, "semilist")
    rx873_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx873_pos)
    .return (rx873_cur)
  rx873_fail:
.annotate "line", 4
    (rx873_rep, rx873_pos, $I10, $P10) = rx873_cur."!mark_fail"(0)
    lt rx873_pos, -1, rx873_done
    eq rx873_pos, -1, rx873_fail
    jump $I10
  rx873_done:
    rx873_cur."!cursor_fail"()
    rx873_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx873_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("214_1259779041.86401") :method
.annotate "line", 4
    new $P875, "ResizablePMCArray"
    push $P875, ""
    .return ($P875)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("215_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx880_tgt
    .local int rx880_pos
    .local int rx880_off
    .local int rx880_eos
    .local int rx880_rep
    .local pmc rx880_cur
    (rx880_cur, rx880_pos, rx880_tgt) = self."!cursor_start"()
    rx880_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx880_cur
    .local pmc match
    .lex "$/", match
    length rx880_eos, rx880_tgt
    set rx880_off, 0
    lt rx880_pos, 2, rx880_start
    sub rx880_off, rx880_pos, 1
    substr rx880_tgt, rx880_tgt, rx880_off
  rx880_start:
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
.annotate "line", 420
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."infixstopper"()
    if $P10, rx880_fail
  # rx subrule "infix" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."infix"()
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx880_pos = $P10."pos"()
  # rx pass
    rx880_cur."!cursor_pass"(rx880_pos, "infixish")
    rx880_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx880_pos)
    .return (rx880_cur)
  rx880_fail:
.annotate "line", 401
    (rx880_rep, rx880_pos, $I10, $P10) = rx880_cur."!mark_fail"(0)
    lt rx880_pos, -1, rx880_done
    eq rx880_pos, -1, rx880_fail
    jump $I10
  rx880_done:
    rx880_cur."!cursor_fail"()
    rx880_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx880_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("216_1259779041.86401") :method
.annotate "line", 401
    new $P882, "ResizablePMCArray"
    push $P882, ""
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("217_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt) = self."!cursor_start"()
    rx885_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx885_cur
    .local pmc match
    .lex "$/", match
    length rx885_eos, rx885_tgt
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
.annotate "line", 421
  # rx subrule "lambda" subtype=zerowidth negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."lambda"()
    unless $P10, rx885_fail
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "infixstopper")
    rx885_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate "line", 401
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("218_1259779041.86401") :method
.annotate "line", 401
    new $P887, "ResizablePMCArray"
    push $P887, ""
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("219_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx890_tgt
    .local int rx890_pos
    .local int rx890_off
    .local int rx890_eos
    .local int rx890_rep
    .local pmc rx890_cur
    (rx890_cur, rx890_pos, rx890_tgt) = self."!cursor_start"()
    rx890_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx890_cur
    .local pmc match
    .lex "$/", match
    length rx890_eos, rx890_tgt
    set rx890_off, 0
    lt rx890_pos, 2, rx890_start
    sub rx890_off, rx890_pos, 1
    substr rx890_tgt, rx890_tgt, rx890_off
  rx890_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan894_done
    goto rxscan894_scan
  rxscan894_loop:
    ($P10) = rx890_cur."from"()
    inc $P10
    set rx890_pos, $P10
    ge rx890_pos, rx890_eos, rxscan894_done
  rxscan894_scan:
    set_addr $I10, rxscan894_loop
    rx890_cur."!mark_push"(0, rx890_pos, $I10)
  rxscan894_done:
.annotate "line", 424
  # rx literal  "["
    add $I11, rx890_pos, 1
    gt $I11, rx890_eos, rx890_fail
    sub $I11, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I11, 1
    ne $S10, "[", rx890_fail
    add rx890_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."ws"()
    unless $P10, rx890_fail
    rx890_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."EXPR"()
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx890_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx890_pos, 1
    gt $I11, rx890_eos, rx890_fail
    sub $I11, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I11, 1
    ne $S10, "]", rx890_fail
    add rx890_pos, 1
.annotate "line", 425
  # rx subrule "O" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."O"("%methodop")
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx890_pos = $P10."pos"()
.annotate "line", 423
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "postcircumfix:sym<[ ]>")
    rx890_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate "line", 401
    (rx890_rep, rx890_pos, $I10, $P10) = rx890_cur."!mark_fail"(0)
    lt rx890_pos, -1, rx890_done
    eq rx890_pos, -1, rx890_fail
    jump $I10
  rx890_done:
    rx890_cur."!cursor_fail"()
    rx890_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx890_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("220_1259779041.86401") :method
.annotate "line", 401
    $P892 = self."!PREFIX__!subrule"("", "[")
    new $P893, "ResizablePMCArray"
    push $P893, $P892
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("221_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
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
.annotate "line", 429
  # rx literal  "{"
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, "{", rx896_fail
    add rx896_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."ws"()
    unless $P10, rx896_fail
    rx896_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."EXPR"()
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx896_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx896_pos, 1
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 1
    ne $S10, "}", rx896_fail
    add rx896_pos, 1
.annotate "line", 430
  # rx subrule "O" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."O"("%methodop")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx896_pos = $P10."pos"()
.annotate "line", 428
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "postcircumfix:sym<{ }>")
    rx896_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate "line", 401
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("222_1259779041.86401") :method
.annotate "line", 401
    $P898 = self."!PREFIX__!subrule"("", "{")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("223_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx902_tgt
    .local int rx902_pos
    .local int rx902_off
    .local int rx902_eos
    .local int rx902_rep
    .local pmc rx902_cur
    (rx902_cur, rx902_pos, rx902_tgt) = self."!cursor_start"()
    rx902_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx902_cur
    .local pmc match
    .lex "$/", match
    length rx902_eos, rx902_tgt
    set rx902_off, 0
    lt rx902_pos, 2, rx902_start
    sub rx902_off, rx902_pos, 1
    substr rx902_tgt, rx902_tgt, rx902_off
  rx902_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan905_done
    goto rxscan905_scan
  rxscan905_loop:
    ($P10) = rx902_cur."from"()
    inc $P10
    set rx902_pos, $P10
    ge rx902_pos, rx902_eos, rxscan905_done
  rxscan905_scan:
    set_addr $I10, rxscan905_loop
    rx902_cur."!mark_push"(0, rx902_pos, $I10)
  rxscan905_done:
.annotate "line", 434
  # rx enumcharlist negate=0 zerowidth
    ge rx902_pos, rx902_eos, rx902_fail
    sub $I10, rx902_pos, rx902_off
    substr $S10, rx902_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx902_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."quote_EXPR"(":q")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx902_pos = $P10."pos"()
.annotate "line", 435
  # rx subrule "O" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."O"("%methodop")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx902_pos = $P10."pos"()
.annotate "line", 433
  # rx pass
    rx902_cur."!cursor_pass"(rx902_pos, "postcircumfix:sym<ang>")
    rx902_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx902_pos)
    .return (rx902_cur)
  rx902_fail:
.annotate "line", 401
    (rx902_rep, rx902_pos, $I10, $P10) = rx902_cur."!mark_fail"(0)
    lt rx902_pos, -1, rx902_done
    eq rx902_pos, -1, rx902_fail
    jump $I10
  rx902_done:
    rx902_cur."!cursor_fail"()
    rx902_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx902_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("224_1259779041.86401") :method
.annotate "line", 401
    new $P904, "ResizablePMCArray"
    push $P904, "<"
    .return ($P904)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("225_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx907_tgt
    .local int rx907_pos
    .local int rx907_off
    .local int rx907_eos
    .local int rx907_rep
    .local pmc rx907_cur
    (rx907_cur, rx907_pos, rx907_tgt) = self."!cursor_start"()
    rx907_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx907_cur
    .local pmc match
    .lex "$/", match
    length rx907_eos, rx907_tgt
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
.annotate "line", 439
  # rx literal  "("
    add $I11, rx907_pos, 1
    gt $I11, rx907_eos, rx907_fail
    sub $I11, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I11, 1
    ne $S10, "(", rx907_fail
    add rx907_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."ws"()
    unless $P10, rx907_fail
    rx907_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."arglist"()
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx907_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx907_pos, 1
    gt $I11, rx907_eos, rx907_fail
    sub $I11, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I11, 1
    ne $S10, ")", rx907_fail
    add rx907_pos, 1
.annotate "line", 440
  # rx subrule "O" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."O"("%methodop")
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx907_pos = $P10."pos"()
.annotate "line", 438
  # rx pass
    rx907_cur."!cursor_pass"(rx907_pos, "postcircumfix:sym<( )>")
    rx907_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx907_pos)
    .return (rx907_cur)
  rx907_fail:
.annotate "line", 401
    (rx907_rep, rx907_pos, $I10, $P10) = rx907_cur."!mark_fail"(0)
    lt rx907_pos, -1, rx907_done
    eq rx907_pos, -1, rx907_fail
    jump $I10
  rx907_done:
    rx907_cur."!cursor_fail"()
    rx907_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx907_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("226_1259779041.86401") :method
.annotate "line", 401
    $P909 = self."!PREFIX__!subrule"("", "(")
    new $P910, "ResizablePMCArray"
    push $P910, $P909
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("227_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx913_cur
    .local pmc match
    .lex "$/", match
    length rx913_eos, rx913_tgt
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
.annotate "line", 443
  # rx subrule "dotty" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."dotty"()
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx913_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."O"("%methodop")
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx913_pos = $P10."pos"()
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "postfix:sym<.>")
    rx913_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate "line", 401
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("228_1259779041.86401") :method
.annotate "line", 401
    $P915 = self."!PREFIX__!subrule"("dotty", "")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("229_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx919_tgt
    .local int rx919_pos
    .local int rx919_off
    .local int rx919_eos
    .local int rx919_rep
    .local pmc rx919_cur
    (rx919_cur, rx919_pos, rx919_tgt) = self."!cursor_start"()
    rx919_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx919_cur
    .local pmc match
    .lex "$/", match
    length rx919_eos, rx919_tgt
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
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_924_fail
    rx919_cur."!mark_push"(0, rx919_pos, $I10)
  # rx literal  "++"
    add $I11, rx919_pos, 2
    gt $I11, rx919_eos, rx919_fail
    sub $I11, rx919_pos, rx919_off
    substr $S10, rx919_tgt, $I11, 2
    ne $S10, "++", rx919_fail
    add rx919_pos, 2
    set_addr $I10, rxcap_924_fail
    ($I12, $I11) = rx919_cur."!mark_peek"($I10)
    rx919_cur."!cursor_pos"($I11)
    ($P10) = rx919_cur."!cursor_start"()
    $P10."!cursor_pass"(rx919_pos, "")
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_924_done
  rxcap_924_fail:
    goto rx919_fail
  rxcap_924_done:
  # rx subrule "O" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx919_pos = $P10."pos"()
  # rx pass
    rx919_cur."!cursor_pass"(rx919_pos, "prefix:sym<++>")
    rx919_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx919_pos)
    .return (rx919_cur)
  rx919_fail:
.annotate "line", 401
    (rx919_rep, rx919_pos, $I10, $P10) = rx919_cur."!mark_fail"(0)
    lt rx919_pos, -1, rx919_done
    eq rx919_pos, -1, rx919_fail
    jump $I10
  rx919_done:
    rx919_cur."!cursor_fail"()
    rx919_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx919_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("230_1259779041.86401") :method
.annotate "line", 401
    $P921 = self."!PREFIX__!subrule"("O", "++")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("231_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    (rx926_cur, rx926_pos, rx926_tgt) = self."!cursor_start"()
    rx926_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx926_cur
    .local pmc match
    .lex "$/", match
    length rx926_eos, rx926_tgt
    set rx926_off, 0
    lt rx926_pos, 2, rx926_start
    sub rx926_off, rx926_pos, 1
    substr rx926_tgt, rx926_tgt, rx926_off
  rx926_start:
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
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_931_fail
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  # rx literal  "--"
    add $I11, rx926_pos, 2
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    substr $S10, rx926_tgt, $I11, 2
    ne $S10, "--", rx926_fail
    add rx926_pos, 2
    set_addr $I10, rxcap_931_fail
    ($I12, $I11) = rx926_cur."!mark_peek"($I10)
    rx926_cur."!cursor_pos"($I11)
    ($P10) = rx926_cur."!cursor_start"()
    $P10."!cursor_pass"(rx926_pos, "")
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_931_done
  rxcap_931_fail:
    goto rx926_fail
  rxcap_931_done:
  # rx subrule "O" subtype=capture negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx926_fail
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx926_pos = $P10."pos"()
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "prefix:sym<-->")
    rx926_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx926_pos)
    .return (rx926_cur)
  rx926_fail:
.annotate "line", 401
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    rx926_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("232_1259779041.86401") :method
.annotate "line", 401
    $P928 = self."!PREFIX__!subrule"("O", "--")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("233_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx933_tgt
    .local int rx933_pos
    .local int rx933_off
    .local int rx933_eos
    .local int rx933_rep
    .local pmc rx933_cur
    (rx933_cur, rx933_pos, rx933_tgt) = self."!cursor_start"()
    rx933_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx933_cur
    .local pmc match
    .lex "$/", match
    length rx933_eos, rx933_tgt
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
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_938_fail
    rx933_cur."!mark_push"(0, rx933_pos, $I10)
  # rx literal  "++"
    add $I11, rx933_pos, 2
    gt $I11, rx933_eos, rx933_fail
    sub $I11, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I11, 2
    ne $S10, "++", rx933_fail
    add rx933_pos, 2
    set_addr $I10, rxcap_938_fail
    ($I12, $I11) = rx933_cur."!mark_peek"($I10)
    rx933_cur."!cursor_pos"($I11)
    ($P10) = rx933_cur."!cursor_start"()
    $P10."!cursor_pass"(rx933_pos, "")
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_938_done
  rxcap_938_fail:
    goto rx933_fail
  rxcap_938_done:
  # rx subrule "O" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."O"("%autoincrement")
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx933_pos = $P10."pos"()
  # rx pass
    rx933_cur."!cursor_pass"(rx933_pos, "postfix:sym<++>")
    rx933_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx933_pos)
    .return (rx933_cur)
  rx933_fail:
.annotate "line", 401
    (rx933_rep, rx933_pos, $I10, $P10) = rx933_cur."!mark_fail"(0)
    lt rx933_pos, -1, rx933_done
    eq rx933_pos, -1, rx933_fail
    jump $I10
  rx933_done:
    rx933_cur."!cursor_fail"()
    rx933_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx933_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("234_1259779041.86401") :method
.annotate "line", 401
    $P935 = self."!PREFIX__!subrule"("O", "++")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("235_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx940_tgt
    .local int rx940_pos
    .local int rx940_off
    .local int rx940_eos
    .local int rx940_rep
    .local pmc rx940_cur
    (rx940_cur, rx940_pos, rx940_tgt) = self."!cursor_start"()
    rx940_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx940_cur
    .local pmc match
    .lex "$/", match
    length rx940_eos, rx940_tgt
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
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_945_fail
    rx940_cur."!mark_push"(0, rx940_pos, $I10)
  # rx literal  "--"
    add $I11, rx940_pos, 2
    gt $I11, rx940_eos, rx940_fail
    sub $I11, rx940_pos, rx940_off
    substr $S10, rx940_tgt, $I11, 2
    ne $S10, "--", rx940_fail
    add rx940_pos, 2
    set_addr $I10, rxcap_945_fail
    ($I12, $I11) = rx940_cur."!mark_peek"($I10)
    rx940_cur."!cursor_pos"($I11)
    ($P10) = rx940_cur."!cursor_start"()
    $P10."!cursor_pass"(rx940_pos, "")
    rx940_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_945_done
  rxcap_945_fail:
    goto rx940_fail
  rxcap_945_done:
  # rx subrule "O" subtype=capture negate=
    rx940_cur."!cursor_pos"(rx940_pos)
    $P10 = rx940_cur."O"("%autoincrement")
    unless $P10, rx940_fail
    rx940_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx940_pos = $P10."pos"()
  # rx pass
    rx940_cur."!cursor_pass"(rx940_pos, "postfix:sym<-->")
    rx940_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx940_pos)
    .return (rx940_cur)
  rx940_fail:
.annotate "line", 401
    (rx940_rep, rx940_pos, $I10, $P10) = rx940_cur."!mark_fail"(0)
    lt rx940_pos, -1, rx940_done
    eq rx940_pos, -1, rx940_fail
    jump $I10
  rx940_done:
    rx940_cur."!cursor_fail"()
    rx940_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx940_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("236_1259779041.86401") :method
.annotate "line", 401
    $P942 = self."!PREFIX__!subrule"("O", "--")
    new $P943, "ResizablePMCArray"
    push $P943, $P942
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("237_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "infix:sym<**>")
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
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_952_fail
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  # rx literal  "**"
    add $I11, rx947_pos, 2
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 2
    ne $S10, "**", rx947_fail
    add rx947_pos, 2
    set_addr $I10, rxcap_952_fail
    ($I12, $I11) = rx947_cur."!mark_peek"($I10)
    rx947_cur."!cursor_pos"($I11)
    ($P10) = rx947_cur."!cursor_start"()
    $P10."!cursor_pass"(rx947_pos, "")
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_952_done
  rxcap_952_fail:
    goto rx947_fail
  rxcap_952_done:
  # rx subrule "O" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "infix:sym<**>")
    rx947_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate "line", 401
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("238_1259779041.86401") :method
.annotate "line", 401
    $P949 = self."!PREFIX__!subrule"("O", "**")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("239_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx954_tgt
    .local int rx954_pos
    .local int rx954_off
    .local int rx954_eos
    .local int rx954_rep
    .local pmc rx954_cur
    (rx954_cur, rx954_pos, rx954_tgt) = self."!cursor_start"()
    rx954_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx954_cur
    .local pmc match
    .lex "$/", match
    length rx954_eos, rx954_tgt
    set rx954_off, 0
    lt rx954_pos, 2, rx954_start
    sub rx954_off, rx954_pos, 1
    substr rx954_tgt, rx954_tgt, rx954_off
  rx954_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan958_done
    goto rxscan958_scan
  rxscan958_loop:
    ($P10) = rx954_cur."from"()
    inc $P10
    set rx954_pos, $P10
    ge rx954_pos, rx954_eos, rxscan958_done
  rxscan958_scan:
    set_addr $I10, rxscan958_loop
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  rxscan958_done:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_959_fail
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  # rx literal  "+"
    add $I11, rx954_pos, 1
    gt $I11, rx954_eos, rx954_fail
    sub $I11, rx954_pos, rx954_off
    substr $S10, rx954_tgt, $I11, 1
    ne $S10, "+", rx954_fail
    add rx954_pos, 1
    set_addr $I10, rxcap_959_fail
    ($I12, $I11) = rx954_cur."!mark_peek"($I10)
    rx954_cur."!cursor_pos"($I11)
    ($P10) = rx954_cur."!cursor_start"()
    $P10."!cursor_pass"(rx954_pos, "")
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_959_done
  rxcap_959_fail:
    goto rx954_fail
  rxcap_959_done:
  # rx subrule "O" subtype=capture negate=
    rx954_cur."!cursor_pos"(rx954_pos)
    $P10 = rx954_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx954_pos = $P10."pos"()
  # rx pass
    rx954_cur."!cursor_pass"(rx954_pos, "prefix:sym<+>")
    rx954_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx954_pos)
    .return (rx954_cur)
  rx954_fail:
.annotate "line", 401
    (rx954_rep, rx954_pos, $I10, $P10) = rx954_cur."!mark_fail"(0)
    lt rx954_pos, -1, rx954_done
    eq rx954_pos, -1, rx954_fail
    jump $I10
  rx954_done:
    rx954_cur."!cursor_fail"()
    rx954_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx954_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("240_1259779041.86401") :method
.annotate "line", 401
    $P956 = self."!PREFIX__!subrule"("O", "+")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("241_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx961_cur
    .local pmc match
    .lex "$/", match
    length rx961_eos, rx961_tgt
    set rx961_off, 0
    lt rx961_pos, 2, rx961_start
    sub rx961_off, rx961_pos, 1
    substr rx961_tgt, rx961_tgt, rx961_off
  rx961_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan965_done
    goto rxscan965_scan
  rxscan965_loop:
    ($P10) = rx961_cur."from"()
    inc $P10
    set rx961_pos, $P10
    ge rx961_pos, rx961_eos, rxscan965_done
  rxscan965_scan:
    set_addr $I10, rxscan965_loop
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  rxscan965_done:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  # rx literal  "~"
    add $I11, rx961_pos, 1
    gt $I11, rx961_eos, rx961_fail
    sub $I11, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I11, 1
    ne $S10, "~", rx961_fail
    add rx961_pos, 1
    set_addr $I10, rxcap_966_fail
    ($I12, $I11) = rx961_cur."!mark_peek"($I10)
    rx961_cur."!cursor_pos"($I11)
    ($P10) = rx961_cur."!cursor_start"()
    $P10."!cursor_pass"(rx961_pos, "")
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_966_done
  rxcap_966_fail:
    goto rx961_fail
  rxcap_966_done:
  # rx subrule "O" subtype=capture negate=
    rx961_cur."!cursor_pos"(rx961_pos)
    $P10 = rx961_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, "prefix:sym<~>")
    rx961_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate "line", 401
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("242_1259779041.86401") :method
.annotate "line", 401
    $P963 = self."!PREFIX__!subrule"("O", "~")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("243_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
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
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  "-"
    add $I11, rx968_pos, 1
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 1
    ne $S10, "-", rx968_fail
    add rx968_pos, 1
    set_addr $I10, rxcap_972_fail
    ($I12, $I11) = rx968_cur."!mark_peek"($I10)
    rx968_cur."!cursor_pos"($I11)
    ($P10) = rx968_cur."!cursor_start"()
    $P10."!cursor_pass"(rx968_pos, "")
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_972_done
  rxcap_972_fail:
    goto rx968_fail
  rxcap_972_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx968_pos, rx968_eos, rx968_fail
    sub $I10, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx968_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."number"()
    if $P10, rx968_fail
  # rx subrule "O" subtype=capture negate=
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "prefix:sym<->")
    rx968_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 401
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("244_1259779041.86401") :method
.annotate "line", 401
    new $P970, "ResizablePMCArray"
    push $P970, "-"
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("245_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx974_cur
    .local pmc match
    .lex "$/", match
    length rx974_eos, rx974_tgt
    set rx974_off, 0
    lt rx974_pos, 2, rx974_start
    sub rx974_off, rx974_pos, 1
    substr rx974_tgt, rx974_tgt, rx974_off
  rx974_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan978_done
    goto rxscan978_scan
  rxscan978_loop:
    ($P10) = rx974_cur."from"()
    inc $P10
    set rx974_pos, $P10
    ge rx974_pos, rx974_eos, rxscan978_done
  rxscan978_scan:
    set_addr $I10, rxscan978_loop
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  rxscan978_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_979_fail
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  # rx literal  "?"
    add $I11, rx974_pos, 1
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 1
    ne $S10, "?", rx974_fail
    add rx974_pos, 1
    set_addr $I10, rxcap_979_fail
    ($I12, $I11) = rx974_cur."!mark_peek"($I10)
    rx974_cur."!cursor_pos"($I11)
    ($P10) = rx974_cur."!cursor_start"()
    $P10."!cursor_pass"(rx974_pos, "")
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_979_done
  rxcap_979_fail:
    goto rx974_fail
  rxcap_979_done:
  # rx subrule "O" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "prefix:sym<?>")
    rx974_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate "line", 401
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("246_1259779041.86401") :method
.annotate "line", 401
    $P976 = self."!PREFIX__!subrule"("O", "?")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("247_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx981_tgt
    .local int rx981_pos
    .local int rx981_off
    .local int rx981_eos
    .local int rx981_rep
    .local pmc rx981_cur
    (rx981_cur, rx981_pos, rx981_tgt) = self."!cursor_start"()
    rx981_cur."!cursor_debug"("START ", "prefix:sym<!>")
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
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_986_fail
    rx981_cur."!mark_push"(0, rx981_pos, $I10)
  # rx literal  "!"
    add $I11, rx981_pos, 1
    gt $I11, rx981_eos, rx981_fail
    sub $I11, rx981_pos, rx981_off
    substr $S10, rx981_tgt, $I11, 1
    ne $S10, "!", rx981_fail
    add rx981_pos, 1
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
    $P10 = rx981_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx981_fail
    rx981_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx981_pos = $P10."pos"()
  # rx pass
    rx981_cur."!cursor_pass"(rx981_pos, "prefix:sym<!>")
    rx981_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx981_pos)
    .return (rx981_cur)
  rx981_fail:
.annotate "line", 401
    (rx981_rep, rx981_pos, $I10, $P10) = rx981_cur."!mark_fail"(0)
    lt rx981_pos, -1, rx981_done
    eq rx981_pos, -1, rx981_fail
    jump $I10
  rx981_done:
    rx981_cur."!cursor_fail"()
    rx981_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx981_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("248_1259779041.86401") :method
.annotate "line", 401
    $P983 = self."!PREFIX__!subrule"("O", "!")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("249_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "prefix:sym<|>")
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
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_993_fail
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  # rx literal  "|"
    add $I11, rx988_pos, 1
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 1
    ne $S10, "|", rx988_fail
    add rx988_pos, 1
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
    $P10 = rx988_cur."O"("%symbolic_unary")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "prefix:sym<|>")
    rx988_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate "line", 401
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("250_1259779041.86401") :method
.annotate "line", 401
    $P990 = self."!PREFIX__!subrule"("O", "|")
    new $P991, "ResizablePMCArray"
    push $P991, $P990
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("251_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx995_tgt
    .local int rx995_pos
    .local int rx995_off
    .local int rx995_eos
    .local int rx995_rep
    .local pmc rx995_cur
    (rx995_cur, rx995_pos, rx995_tgt) = self."!cursor_start"()
    rx995_cur."!cursor_debug"("START ", "infix:sym<*>")
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
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_1000_fail
    rx995_cur."!mark_push"(0, rx995_pos, $I10)
  # rx literal  "*"
    add $I11, rx995_pos, 1
    gt $I11, rx995_eos, rx995_fail
    sub $I11, rx995_pos, rx995_off
    substr $S10, rx995_tgt, $I11, 1
    ne $S10, "*", rx995_fail
    add rx995_pos, 1
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
    $P10 = rx995_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx995_fail
    rx995_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx995_pos = $P10."pos"()
  # rx pass
    rx995_cur."!cursor_pass"(rx995_pos, "infix:sym<*>")
    rx995_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx995_pos)
    .return (rx995_cur)
  rx995_fail:
.annotate "line", 401
    (rx995_rep, rx995_pos, $I10, $P10) = rx995_cur."!mark_fail"(0)
    lt rx995_pos, -1, rx995_done
    eq rx995_pos, -1, rx995_fail
    jump $I10
  rx995_done:
    rx995_cur."!cursor_fail"()
    rx995_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx995_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("252_1259779041.86401") :method
.annotate "line", 401
    $P997 = self."!PREFIX__!subrule"("O", "*")
    new $P998, "ResizablePMCArray"
    push $P998, $P997
    .return ($P998)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("253_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1002_tgt
    .local int rx1002_pos
    .local int rx1002_off
    .local int rx1002_eos
    .local int rx1002_rep
    .local pmc rx1002_cur
    (rx1002_cur, rx1002_pos, rx1002_tgt) = self."!cursor_start"()
    rx1002_cur."!cursor_debug"("START ", "infix:sym</>")
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
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_1007_fail
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  # rx literal  "/"
    add $I11, rx1002_pos, 1
    gt $I11, rx1002_eos, rx1002_fail
    sub $I11, rx1002_pos, rx1002_off
    substr $S10, rx1002_tgt, $I11, 1
    ne $S10, "/", rx1002_fail
    add rx1002_pos, 1
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
    $P10 = rx1002_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1002_fail
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1002_pos = $P10."pos"()
  # rx pass
    rx1002_cur."!cursor_pass"(rx1002_pos, "infix:sym</>")
    rx1002_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1002_pos)
    .return (rx1002_cur)
  rx1002_fail:
.annotate "line", 401
    (rx1002_rep, rx1002_pos, $I10, $P10) = rx1002_cur."!mark_fail"(0)
    lt rx1002_pos, -1, rx1002_done
    eq rx1002_pos, -1, rx1002_fail
    jump $I10
  rx1002_done:
    rx1002_cur."!cursor_fail"()
    rx1002_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1002_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("254_1259779041.86401") :method
.annotate "line", 401
    $P1004 = self."!PREFIX__!subrule"("O", "/")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("255_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1009_tgt
    .local int rx1009_pos
    .local int rx1009_off
    .local int rx1009_eos
    .local int rx1009_rep
    .local pmc rx1009_cur
    (rx1009_cur, rx1009_pos, rx1009_tgt) = self."!cursor_start"()
    rx1009_cur."!cursor_debug"("START ", "infix:sym<%>")
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
.annotate "line", 463
  # rx subcapture "sym"
    set_addr $I10, rxcap_1014_fail
    rx1009_cur."!mark_push"(0, rx1009_pos, $I10)
  # rx literal  "%"
    add $I11, rx1009_pos, 1
    gt $I11, rx1009_eos, rx1009_fail
    sub $I11, rx1009_pos, rx1009_off
    substr $S10, rx1009_tgt, $I11, 1
    ne $S10, "%", rx1009_fail
    add rx1009_pos, 1
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
    $P10 = rx1009_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1009_fail
    rx1009_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1009_pos = $P10."pos"()
  # rx pass
    rx1009_cur."!cursor_pass"(rx1009_pos, "infix:sym<%>")
    rx1009_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1009_pos)
    .return (rx1009_cur)
  rx1009_fail:
.annotate "line", 401
    (rx1009_rep, rx1009_pos, $I10, $P10) = rx1009_cur."!mark_fail"(0)
    lt rx1009_pos, -1, rx1009_done
    eq rx1009_pos, -1, rx1009_fail
    jump $I10
  rx1009_done:
    rx1009_cur."!cursor_fail"()
    rx1009_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1009_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("256_1259779041.86401") :method
.annotate "line", 401
    $P1011 = self."!PREFIX__!subrule"("O", "%")
    new $P1012, "ResizablePMCArray"
    push $P1012, $P1011
    .return ($P1012)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("257_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "infix:sym<+>")
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
.annotate "line", 465
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
    $P10 = rx1016_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1016_pos = $P10."pos"()
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "infix:sym<+>")
    rx1016_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate "line", 401
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("258_1259779041.86401") :method
.annotate "line", 401
    $P1018 = self."!PREFIX__!subrule"("O", "+")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("259_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    (rx1023_cur, rx1023_pos, rx1023_tgt) = self."!cursor_start"()
    rx1023_cur."!cursor_debug"("START ", "infix:sym<->")
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
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_1028_fail
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  # rx literal  "-"
    add $I11, rx1023_pos, 1
    gt $I11, rx1023_eos, rx1023_fail
    sub $I11, rx1023_pos, rx1023_off
    substr $S10, rx1023_tgt, $I11, 1
    ne $S10, "-", rx1023_fail
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
    $P10 = rx1023_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1023_pos = $P10."pos"()
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "infix:sym<->")
    rx1023_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1023_pos)
    .return (rx1023_cur)
  rx1023_fail:
.annotate "line", 401
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    rx1023_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("260_1259779041.86401") :method
.annotate "line", 401
    $P1025 = self."!PREFIX__!subrule"("O", "-")
    new $P1026, "ResizablePMCArray"
    push $P1026, $P1025
    .return ($P1026)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("261_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1030_tgt
    .local int rx1030_pos
    .local int rx1030_off
    .local int rx1030_eos
    .local int rx1030_rep
    .local pmc rx1030_cur
    (rx1030_cur, rx1030_pos, rx1030_tgt) = self."!cursor_start"()
    rx1030_cur."!cursor_debug"("START ", "infix:sym<~>")
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
    ne $I10, -1, rxscan1034_done
    goto rxscan1034_scan
  rxscan1034_loop:
    ($P10) = rx1030_cur."from"()
    inc $P10
    set rx1030_pos, $P10
    ge rx1030_pos, rx1030_eos, rxscan1034_done
  rxscan1034_scan:
    set_addr $I10, rxscan1034_loop
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  rxscan1034_done:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_1035_fail
    rx1030_cur."!mark_push"(0, rx1030_pos, $I10)
  # rx literal  "~"
    add $I11, rx1030_pos, 1
    gt $I11, rx1030_eos, rx1030_fail
    sub $I11, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I11, 1
    ne $S10, "~", rx1030_fail
    add rx1030_pos, 1
    set_addr $I10, rxcap_1035_fail
    ($I12, $I11) = rx1030_cur."!mark_peek"($I10)
    rx1030_cur."!cursor_pos"($I11)
    ($P10) = rx1030_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1030_pos, "")
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1035_done
  rxcap_1035_fail:
    goto rx1030_fail
  rxcap_1035_done:
  # rx subrule "O" subtype=capture negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1030_fail
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1030_pos = $P10."pos"()
  # rx pass
    rx1030_cur."!cursor_pass"(rx1030_pos, "infix:sym<~>")
    rx1030_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1030_pos)
    .return (rx1030_cur)
  rx1030_fail:
.annotate "line", 401
    (rx1030_rep, rx1030_pos, $I10, $P10) = rx1030_cur."!mark_fail"(0)
    lt rx1030_pos, -1, rx1030_done
    eq rx1030_pos, -1, rx1030_fail
    jump $I10
  rx1030_done:
    rx1030_cur."!cursor_fail"()
    rx1030_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1030_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("262_1259779041.86401") :method
.annotate "line", 401
    $P1032 = self."!PREFIX__!subrule"("O", "~")
    new $P1033, "ResizablePMCArray"
    push $P1033, $P1032
    .return ($P1033)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("263_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1037_tgt
    .local int rx1037_pos
    .local int rx1037_off
    .local int rx1037_eos
    .local int rx1037_rep
    .local pmc rx1037_cur
    (rx1037_cur, rx1037_pos, rx1037_tgt) = self."!cursor_start"()
    rx1037_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1037_cur
    .local pmc match
    .lex "$/", match
    length rx1037_eos, rx1037_tgt
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
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1042_fail
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  # rx literal  "=="
    add $I11, rx1037_pos, 2
    gt $I11, rx1037_eos, rx1037_fail
    sub $I11, rx1037_pos, rx1037_off
    substr $S10, rx1037_tgt, $I11, 2
    ne $S10, "==", rx1037_fail
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
    $P10 = rx1037_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1037_fail
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1037_pos = $P10."pos"()
  # rx pass
    rx1037_cur."!cursor_pass"(rx1037_pos, "infix:sym<==>")
    rx1037_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1037_pos)
    .return (rx1037_cur)
  rx1037_fail:
.annotate "line", 401
    (rx1037_rep, rx1037_pos, $I10, $P10) = rx1037_cur."!mark_fail"(0)
    lt rx1037_pos, -1, rx1037_done
    eq rx1037_pos, -1, rx1037_fail
    jump $I10
  rx1037_done:
    rx1037_cur."!cursor_fail"()
    rx1037_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1037_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("264_1259779041.86401") :method
.annotate "line", 401
    $P1039 = self."!PREFIX__!subrule"("O", "==")
    new $P1040, "ResizablePMCArray"
    push $P1040, $P1039
    .return ($P1040)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("265_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1044_tgt
    .local int rx1044_pos
    .local int rx1044_off
    .local int rx1044_eos
    .local int rx1044_rep
    .local pmc rx1044_cur
    (rx1044_cur, rx1044_pos, rx1044_tgt) = self."!cursor_start"()
    rx1044_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1044_cur
    .local pmc match
    .lex "$/", match
    length rx1044_eos, rx1044_tgt
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
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1049_fail
    rx1044_cur."!mark_push"(0, rx1044_pos, $I10)
  # rx literal  "!="
    add $I11, rx1044_pos, 2
    gt $I11, rx1044_eos, rx1044_fail
    sub $I11, rx1044_pos, rx1044_off
    substr $S10, rx1044_tgt, $I11, 2
    ne $S10, "!=", rx1044_fail
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
    $P10 = rx1044_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1044_fail
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1044_pos = $P10."pos"()
  # rx pass
    rx1044_cur."!cursor_pass"(rx1044_pos, "infix:sym<!=>")
    rx1044_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1044_pos)
    .return (rx1044_cur)
  rx1044_fail:
.annotate "line", 401
    (rx1044_rep, rx1044_pos, $I10, $P10) = rx1044_cur."!mark_fail"(0)
    lt rx1044_pos, -1, rx1044_done
    eq rx1044_pos, -1, rx1044_fail
    jump $I10
  rx1044_done:
    rx1044_cur."!cursor_fail"()
    rx1044_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1044_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("266_1259779041.86401") :method
.annotate "line", 401
    $P1046 = self."!PREFIX__!subrule"("O", "!=")
    new $P1047, "ResizablePMCArray"
    push $P1047, $P1046
    .return ($P1047)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("267_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1051_tgt
    .local int rx1051_pos
    .local int rx1051_off
    .local int rx1051_eos
    .local int rx1051_rep
    .local pmc rx1051_cur
    (rx1051_cur, rx1051_pos, rx1051_tgt) = self."!cursor_start"()
    rx1051_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1051_cur
    .local pmc match
    .lex "$/", match
    length rx1051_eos, rx1051_tgt
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
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_1056_fail
    rx1051_cur."!mark_push"(0, rx1051_pos, $I10)
  # rx literal  "<="
    add $I11, rx1051_pos, 2
    gt $I11, rx1051_eos, rx1051_fail
    sub $I11, rx1051_pos, rx1051_off
    substr $S10, rx1051_tgt, $I11, 2
    ne $S10, "<=", rx1051_fail
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
    $P10 = rx1051_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1051_fail
    rx1051_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1051_pos = $P10."pos"()
  # rx pass
    rx1051_cur."!cursor_pass"(rx1051_pos, "infix:sym<<=>")
    rx1051_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1051_pos)
    .return (rx1051_cur)
  rx1051_fail:
.annotate "line", 401
    (rx1051_rep, rx1051_pos, $I10, $P10) = rx1051_cur."!mark_fail"(0)
    lt rx1051_pos, -1, rx1051_done
    eq rx1051_pos, -1, rx1051_fail
    jump $I10
  rx1051_done:
    rx1051_cur."!cursor_fail"()
    rx1051_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1051_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("268_1259779041.86401") :method
.annotate "line", 401
    $P1053 = self."!PREFIX__!subrule"("O", "<=")
    new $P1054, "ResizablePMCArray"
    push $P1054, $P1053
    .return ($P1054)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("269_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1058_tgt
    .local int rx1058_pos
    .local int rx1058_off
    .local int rx1058_eos
    .local int rx1058_rep
    .local pmc rx1058_cur
    (rx1058_cur, rx1058_pos, rx1058_tgt) = self."!cursor_start"()
    rx1058_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1058_cur
    .local pmc match
    .lex "$/", match
    length rx1058_eos, rx1058_tgt
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
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1063_fail
    rx1058_cur."!mark_push"(0, rx1058_pos, $I10)
  # rx literal  ">="
    add $I11, rx1058_pos, 2
    gt $I11, rx1058_eos, rx1058_fail
    sub $I11, rx1058_pos, rx1058_off
    substr $S10, rx1058_tgt, $I11, 2
    ne $S10, ">=", rx1058_fail
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
    $P10 = rx1058_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1058_fail
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1058_pos = $P10."pos"()
  # rx pass
    rx1058_cur."!cursor_pass"(rx1058_pos, "infix:sym<>=>")
    rx1058_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1058_pos)
    .return (rx1058_cur)
  rx1058_fail:
.annotate "line", 401
    (rx1058_rep, rx1058_pos, $I10, $P10) = rx1058_cur."!mark_fail"(0)
    lt rx1058_pos, -1, rx1058_done
    eq rx1058_pos, -1, rx1058_fail
    jump $I10
  rx1058_done:
    rx1058_cur."!cursor_fail"()
    rx1058_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1058_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("270_1259779041.86401") :method
.annotate "line", 401
    $P1060 = self."!PREFIX__!subrule"("O", ">=")
    new $P1061, "ResizablePMCArray"
    push $P1061, $P1060
    .return ($P1061)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("271_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1065_tgt
    .local int rx1065_pos
    .local int rx1065_off
    .local int rx1065_eos
    .local int rx1065_rep
    .local pmc rx1065_cur
    (rx1065_cur, rx1065_pos, rx1065_tgt) = self."!cursor_start"()
    rx1065_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1065_cur
    .local pmc match
    .lex "$/", match
    length rx1065_eos, rx1065_tgt
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
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1070_fail
    rx1065_cur."!mark_push"(0, rx1065_pos, $I10)
  # rx literal  "<"
    add $I11, rx1065_pos, 1
    gt $I11, rx1065_eos, rx1065_fail
    sub $I11, rx1065_pos, rx1065_off
    substr $S10, rx1065_tgt, $I11, 1
    ne $S10, "<", rx1065_fail
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
    $P10 = rx1065_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1065_fail
    rx1065_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1065_pos = $P10."pos"()
  # rx pass
    rx1065_cur."!cursor_pass"(rx1065_pos, "infix:sym<<>")
    rx1065_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1065_pos)
    .return (rx1065_cur)
  rx1065_fail:
.annotate "line", 401
    (rx1065_rep, rx1065_pos, $I10, $P10) = rx1065_cur."!mark_fail"(0)
    lt rx1065_pos, -1, rx1065_done
    eq rx1065_pos, -1, rx1065_fail
    jump $I10
  rx1065_done:
    rx1065_cur."!cursor_fail"()
    rx1065_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1065_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("272_1259779041.86401") :method
.annotate "line", 401
    $P1067 = self."!PREFIX__!subrule"("O", "<")
    new $P1068, "ResizablePMCArray"
    push $P1068, $P1067
    .return ($P1068)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("273_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1072_tgt
    .local int rx1072_pos
    .local int rx1072_off
    .local int rx1072_eos
    .local int rx1072_rep
    .local pmc rx1072_cur
    (rx1072_cur, rx1072_pos, rx1072_tgt) = self."!cursor_start"()
    rx1072_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1072_cur
    .local pmc match
    .lex "$/", match
    length rx1072_eos, rx1072_tgt
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
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1077_fail
    rx1072_cur."!mark_push"(0, rx1072_pos, $I10)
  # rx literal  ">"
    add $I11, rx1072_pos, 1
    gt $I11, rx1072_eos, rx1072_fail
    sub $I11, rx1072_pos, rx1072_off
    substr $S10, rx1072_tgt, $I11, 1
    ne $S10, ">", rx1072_fail
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
    $P10 = rx1072_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1072_fail
    rx1072_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1072_pos = $P10."pos"()
  # rx pass
    rx1072_cur."!cursor_pass"(rx1072_pos, "infix:sym<>>")
    rx1072_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1072_pos)
    .return (rx1072_cur)
  rx1072_fail:
.annotate "line", 401
    (rx1072_rep, rx1072_pos, $I10, $P10) = rx1072_cur."!mark_fail"(0)
    lt rx1072_pos, -1, rx1072_done
    eq rx1072_pos, -1, rx1072_fail
    jump $I10
  rx1072_done:
    rx1072_cur."!cursor_fail"()
    rx1072_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1072_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("274_1259779041.86401") :method
.annotate "line", 401
    $P1074 = self."!PREFIX__!subrule"("O", ">")
    new $P1075, "ResizablePMCArray"
    push $P1075, $P1074
    .return ($P1075)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("275_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1079_tgt
    .local int rx1079_pos
    .local int rx1079_off
    .local int rx1079_eos
    .local int rx1079_rep
    .local pmc rx1079_cur
    (rx1079_cur, rx1079_pos, rx1079_tgt) = self."!cursor_start"()
    rx1079_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1079_cur
    .local pmc match
    .lex "$/", match
    length rx1079_eos, rx1079_tgt
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
.annotate "line", 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1084_fail
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1079_pos, 2
    gt $I11, rx1079_eos, rx1079_fail
    sub $I11, rx1079_pos, rx1079_off
    substr $S10, rx1079_tgt, $I11, 2
    ne $S10, "eq", rx1079_fail
    add rx1079_pos, 2
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
    $P10 = rx1079_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1079_fail
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1079_pos = $P10."pos"()
  # rx pass
    rx1079_cur."!cursor_pass"(rx1079_pos, "infix:sym<eq>")
    rx1079_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1079_pos)
    .return (rx1079_cur)
  rx1079_fail:
.annotate "line", 401
    (rx1079_rep, rx1079_pos, $I10, $P10) = rx1079_cur."!mark_fail"(0)
    lt rx1079_pos, -1, rx1079_done
    eq rx1079_pos, -1, rx1079_fail
    jump $I10
  rx1079_done:
    rx1079_cur."!cursor_fail"()
    rx1079_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1079_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("276_1259779041.86401") :method
.annotate "line", 401
    $P1081 = self."!PREFIX__!subrule"("O", "eq")
    new $P1082, "ResizablePMCArray"
    push $P1082, $P1081
    .return ($P1082)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("277_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1086_tgt
    .local int rx1086_pos
    .local int rx1086_off
    .local int rx1086_eos
    .local int rx1086_rep
    .local pmc rx1086_cur
    (rx1086_cur, rx1086_pos, rx1086_tgt) = self."!cursor_start"()
    rx1086_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1086_cur
    .local pmc match
    .lex "$/", match
    length rx1086_eos, rx1086_tgt
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
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1091_fail
    rx1086_cur."!mark_push"(0, rx1086_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1086_pos, 2
    gt $I11, rx1086_eos, rx1086_fail
    sub $I11, rx1086_pos, rx1086_off
    substr $S10, rx1086_tgt, $I11, 2
    ne $S10, "ne", rx1086_fail
    add rx1086_pos, 2
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
    $P10 = rx1086_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1086_fail
    rx1086_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1086_pos = $P10."pos"()
  # rx pass
    rx1086_cur."!cursor_pass"(rx1086_pos, "infix:sym<ne>")
    rx1086_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1086_pos)
    .return (rx1086_cur)
  rx1086_fail:
.annotate "line", 401
    (rx1086_rep, rx1086_pos, $I10, $P10) = rx1086_cur."!mark_fail"(0)
    lt rx1086_pos, -1, rx1086_done
    eq rx1086_pos, -1, rx1086_fail
    jump $I10
  rx1086_done:
    rx1086_cur."!cursor_fail"()
    rx1086_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1086_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("278_1259779041.86401") :method
.annotate "line", 401
    $P1088 = self."!PREFIX__!subrule"("O", "ne")
    new $P1089, "ResizablePMCArray"
    push $P1089, $P1088
    .return ($P1089)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("279_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1093_tgt
    .local int rx1093_pos
    .local int rx1093_off
    .local int rx1093_eos
    .local int rx1093_rep
    .local pmc rx1093_cur
    (rx1093_cur, rx1093_pos, rx1093_tgt) = self."!cursor_start"()
    rx1093_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1093_cur
    .local pmc match
    .lex "$/", match
    length rx1093_eos, rx1093_tgt
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
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1098_fail
    rx1093_cur."!mark_push"(0, rx1093_pos, $I10)
  # rx literal  "le"
    add $I11, rx1093_pos, 2
    gt $I11, rx1093_eos, rx1093_fail
    sub $I11, rx1093_pos, rx1093_off
    substr $S10, rx1093_tgt, $I11, 2
    ne $S10, "le", rx1093_fail
    add rx1093_pos, 2
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
    $P10 = rx1093_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1093_fail
    rx1093_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1093_pos = $P10."pos"()
  # rx pass
    rx1093_cur."!cursor_pass"(rx1093_pos, "infix:sym<le>")
    rx1093_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1093_pos)
    .return (rx1093_cur)
  rx1093_fail:
.annotate "line", 401
    (rx1093_rep, rx1093_pos, $I10, $P10) = rx1093_cur."!mark_fail"(0)
    lt rx1093_pos, -1, rx1093_done
    eq rx1093_pos, -1, rx1093_fail
    jump $I10
  rx1093_done:
    rx1093_cur."!cursor_fail"()
    rx1093_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1093_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("280_1259779041.86401") :method
.annotate "line", 401
    $P1095 = self."!PREFIX__!subrule"("O", "le")
    new $P1096, "ResizablePMCArray"
    push $P1096, $P1095
    .return ($P1096)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("281_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1100_tgt
    .local int rx1100_pos
    .local int rx1100_off
    .local int rx1100_eos
    .local int rx1100_rep
    .local pmc rx1100_cur
    (rx1100_cur, rx1100_pos, rx1100_tgt) = self."!cursor_start"()
    rx1100_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1100_cur
    .local pmc match
    .lex "$/", match
    length rx1100_eos, rx1100_tgt
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
.annotate "line", 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1105_fail
    rx1100_cur."!mark_push"(0, rx1100_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1100_pos, 2
    gt $I11, rx1100_eos, rx1100_fail
    sub $I11, rx1100_pos, rx1100_off
    substr $S10, rx1100_tgt, $I11, 2
    ne $S10, "ge", rx1100_fail
    add rx1100_pos, 2
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
    $P10 = rx1100_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1100_fail
    rx1100_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1100_pos = $P10."pos"()
  # rx pass
    rx1100_cur."!cursor_pass"(rx1100_pos, "infix:sym<ge>")
    rx1100_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1100_pos)
    .return (rx1100_cur)
  rx1100_fail:
.annotate "line", 401
    (rx1100_rep, rx1100_pos, $I10, $P10) = rx1100_cur."!mark_fail"(0)
    lt rx1100_pos, -1, rx1100_done
    eq rx1100_pos, -1, rx1100_fail
    jump $I10
  rx1100_done:
    rx1100_cur."!cursor_fail"()
    rx1100_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1100_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("282_1259779041.86401") :method
.annotate "line", 401
    $P1102 = self."!PREFIX__!subrule"("O", "ge")
    new $P1103, "ResizablePMCArray"
    push $P1103, $P1102
    .return ($P1103)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("283_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1107_tgt
    .local int rx1107_pos
    .local int rx1107_off
    .local int rx1107_eos
    .local int rx1107_rep
    .local pmc rx1107_cur
    (rx1107_cur, rx1107_pos, rx1107_tgt) = self."!cursor_start"()
    rx1107_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1107_cur
    .local pmc match
    .lex "$/", match
    length rx1107_eos, rx1107_tgt
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
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1112_fail
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1107_pos, 2
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    substr $S10, rx1107_tgt, $I11, 2
    ne $S10, "lt", rx1107_fail
    add rx1107_pos, 2
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
    $P10 = rx1107_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1107_pos = $P10."pos"()
  # rx pass
    rx1107_cur."!cursor_pass"(rx1107_pos, "infix:sym<lt>")
    rx1107_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1107_pos)
    .return (rx1107_cur)
  rx1107_fail:
.annotate "line", 401
    (rx1107_rep, rx1107_pos, $I10, $P10) = rx1107_cur."!mark_fail"(0)
    lt rx1107_pos, -1, rx1107_done
    eq rx1107_pos, -1, rx1107_fail
    jump $I10
  rx1107_done:
    rx1107_cur."!cursor_fail"()
    rx1107_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1107_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("284_1259779041.86401") :method
.annotate "line", 401
    $P1109 = self."!PREFIX__!subrule"("O", "lt")
    new $P1110, "ResizablePMCArray"
    push $P1110, $P1109
    .return ($P1110)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("285_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1114_tgt
    .local int rx1114_pos
    .local int rx1114_off
    .local int rx1114_eos
    .local int rx1114_rep
    .local pmc rx1114_cur
    (rx1114_cur, rx1114_pos, rx1114_tgt) = self."!cursor_start"()
    rx1114_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1114_cur
    .local pmc match
    .lex "$/", match
    length rx1114_eos, rx1114_tgt
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
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1119_fail
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1114_pos, 2
    gt $I11, rx1114_eos, rx1114_fail
    sub $I11, rx1114_pos, rx1114_off
    substr $S10, rx1114_tgt, $I11, 2
    ne $S10, "gt", rx1114_fail
    add rx1114_pos, 2
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
    $P10 = rx1114_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1114_fail
    rx1114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1114_pos = $P10."pos"()
  # rx pass
    rx1114_cur."!cursor_pass"(rx1114_pos, "infix:sym<gt>")
    rx1114_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1114_pos)
    .return (rx1114_cur)
  rx1114_fail:
.annotate "line", 401
    (rx1114_rep, rx1114_pos, $I10, $P10) = rx1114_cur."!mark_fail"(0)
    lt rx1114_pos, -1, rx1114_done
    eq rx1114_pos, -1, rx1114_fail
    jump $I10
  rx1114_done:
    rx1114_cur."!cursor_fail"()
    rx1114_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1114_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("286_1259779041.86401") :method
.annotate "line", 401
    $P1116 = self."!PREFIX__!subrule"("O", "gt")
    new $P1117, "ResizablePMCArray"
    push $P1117, $P1116
    .return ($P1117)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("287_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1121_tgt
    .local int rx1121_pos
    .local int rx1121_off
    .local int rx1121_eos
    .local int rx1121_rep
    .local pmc rx1121_cur
    (rx1121_cur, rx1121_pos, rx1121_tgt) = self."!cursor_start"()
    rx1121_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1121_cur
    .local pmc match
    .lex "$/", match
    length rx1121_eos, rx1121_tgt
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
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1126_fail
    rx1121_cur."!mark_push"(0, rx1121_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1121_pos, 3
    gt $I11, rx1121_eos, rx1121_fail
    sub $I11, rx1121_pos, rx1121_off
    substr $S10, rx1121_tgt, $I11, 3
    ne $S10, "=:=", rx1121_fail
    add rx1121_pos, 3
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
    $P10 = rx1121_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1121_fail
    rx1121_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1121_pos = $P10."pos"()
  # rx pass
    rx1121_cur."!cursor_pass"(rx1121_pos, "infix:sym<=:=>")
    rx1121_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1121_pos)
    .return (rx1121_cur)
  rx1121_fail:
.annotate "line", 401
    (rx1121_rep, rx1121_pos, $I10, $P10) = rx1121_cur."!mark_fail"(0)
    lt rx1121_pos, -1, rx1121_done
    eq rx1121_pos, -1, rx1121_fail
    jump $I10
  rx1121_done:
    rx1121_cur."!cursor_fail"()
    rx1121_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1121_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("288_1259779041.86401") :method
.annotate "line", 401
    $P1123 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("289_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1128_tgt
    .local int rx1128_pos
    .local int rx1128_off
    .local int rx1128_eos
    .local int rx1128_rep
    .local pmc rx1128_cur
    (rx1128_cur, rx1128_pos, rx1128_tgt) = self."!cursor_start"()
    rx1128_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1128_cur
    .local pmc match
    .lex "$/", match
    length rx1128_eos, rx1128_tgt
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
.annotate "line", 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1133_fail
    rx1128_cur."!mark_push"(0, rx1128_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1128_pos, 2
    gt $I11, rx1128_eos, rx1128_fail
    sub $I11, rx1128_pos, rx1128_off
    substr $S10, rx1128_tgt, $I11, 2
    ne $S10, "&&", rx1128_fail
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
    $P10 = rx1128_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1128_fail
    rx1128_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1128_pos = $P10."pos"()
  # rx pass
    rx1128_cur."!cursor_pass"(rx1128_pos, "infix:sym<&&>")
    rx1128_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1128_pos)
    .return (rx1128_cur)
  rx1128_fail:
.annotate "line", 401
    (rx1128_rep, rx1128_pos, $I10, $P10) = rx1128_cur."!mark_fail"(0)
    lt rx1128_pos, -1, rx1128_done
    eq rx1128_pos, -1, rx1128_fail
    jump $I10
  rx1128_done:
    rx1128_cur."!cursor_fail"()
    rx1128_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1128_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("290_1259779041.86401") :method
.annotate "line", 401
    $P1130 = self."!PREFIX__!subrule"("O", "&&")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("291_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    (rx1135_cur, rx1135_pos, rx1135_tgt) = self."!cursor_start"()
    rx1135_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1135_cur
    .local pmc match
    .lex "$/", match
    length rx1135_eos, rx1135_tgt
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
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "||"
    add $I11, rx1135_pos, 2
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 2
    ne $S10, "||", rx1135_fail
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
    $P10 = rx1135_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1135_fail
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1135_pos = $P10."pos"()
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<||>")
    rx1135_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1135_pos)
    .return (rx1135_cur)
  rx1135_fail:
.annotate "line", 401
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    rx1135_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("292_1259779041.86401") :method
.annotate "line", 401
    $P1137 = self."!PREFIX__!subrule"("O", "||")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("293_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    (rx1142_cur, rx1142_pos, rx1142_tgt) = self."!cursor_start"()
    rx1142_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1142_cur
    .local pmc match
    .lex "$/", match
    length rx1142_eos, rx1142_tgt
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
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  "//"
    add $I11, rx1142_pos, 2
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    substr $S10, rx1142_tgt, $I11, 2
    ne $S10, "//", rx1142_fail
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
    $P10 = rx1142_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<//>")
    rx1142_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1142_pos)
    .return (rx1142_cur)
  rx1142_fail:
.annotate "line", 401
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    rx1142_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("294_1259779041.86401") :method
.annotate "line", 401
    $P1144 = self."!PREFIX__!subrule"("O", "//")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("295_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    (rx1149_cur, rx1149_pos, rx1149_tgt) = self."!cursor_start"()
    rx1149_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1149_cur
    .local pmc match
    .lex "$/", match
    length rx1149_eos, rx1149_tgt
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
.annotate "line", 490
  # rx literal  "??"
    add $I11, rx1149_pos, 2
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 2
    ne $S10, "??", rx1149_fail
    add rx1149_pos, 2
.annotate "line", 491
  # rx subrule "ws" subtype=method negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."ws"()
    unless $P10, rx1149_fail
    rx1149_pos = $P10."pos"()
.annotate "line", 492
  # rx subrule "EXPR" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."EXPR"("i=")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1149_pos = $P10."pos"()
.annotate "line", 493
  # rx literal  "!!"
    add $I11, rx1149_pos, 2
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 2
    ne $S10, "!!", rx1149_fail
    add rx1149_pos, 2
.annotate "line", 494
  # rx subrule "O" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
.annotate "line", 489
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<?? !!>")
    rx1149_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate "line", 401
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    rx1149_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("296_1259779041.86401") :method
.annotate "line", 401
    $P1151 = self."!PREFIX__!subrule"("", "??")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("297_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1155_tgt
    .local int rx1155_pos
    .local int rx1155_off
    .local int rx1155_eos
    .local int rx1155_rep
    .local pmc rx1155_cur
    (rx1155_cur, rx1155_pos, rx1155_tgt) = self."!cursor_start"()
    rx1155_cur."!cursor_debug"("START ", "infix:sym<=>")
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
.annotate "line", 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1160_fail
    rx1155_cur."!mark_push"(0, rx1155_pos, $I10)
  # rx literal  "="
    add $I11, rx1155_pos, 1
    gt $I11, rx1155_eos, rx1155_fail
    sub $I11, rx1155_pos, rx1155_off
    substr $S10, rx1155_tgt, $I11, 1
    ne $S10, "=", rx1155_fail
    add rx1155_pos, 1
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
  # rx subrule "panic" subtype=method negate=
    rx1155_cur."!cursor_pos"(rx1155_pos)
    $P10 = rx1155_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1155_fail
    rx1155_pos = $P10."pos"()
.annotate "line", 497
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<=>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate "line", 401
    (rx1155_rep, rx1155_pos, $I10, $P10) = rx1155_cur."!mark_fail"(0)
    lt rx1155_pos, -1, rx1155_done
    eq rx1155_pos, -1, rx1155_fail
    jump $I10
  rx1155_done:
    rx1155_cur."!cursor_fail"()
    rx1155_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1155_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("298_1259779041.86401") :method
.annotate "line", 401
    $P1157 = self."!PREFIX__!subrule"("", "=")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("299_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1162_tgt
    .local int rx1162_pos
    .local int rx1162_off
    .local int rx1162_eos
    .local int rx1162_rep
    .local pmc rx1162_cur
    (rx1162_cur, rx1162_pos, rx1162_tgt) = self."!cursor_start"()
    rx1162_cur."!cursor_debug"("START ", "infix:sym<:=>")
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
.annotate "line", 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1162_cur."!mark_push"(0, rx1162_pos, $I10)
  # rx literal  ":="
    add $I11, rx1162_pos, 2
    gt $I11, rx1162_eos, rx1162_fail
    sub $I11, rx1162_pos, rx1162_off
    substr $S10, rx1162_tgt, $I11, 2
    ne $S10, ":=", rx1162_fail
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
    $P10 = rx1162_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1162_fail
    rx1162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1162_pos = $P10."pos"()
  # rx pass
    rx1162_cur."!cursor_pass"(rx1162_pos, "infix:sym<:=>")
    rx1162_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1162_pos)
    .return (rx1162_cur)
  rx1162_fail:
.annotate "line", 401
    (rx1162_rep, rx1162_pos, $I10, $P10) = rx1162_cur."!mark_fail"(0)
    lt rx1162_pos, -1, rx1162_done
    eq rx1162_pos, -1, rx1162_fail
    jump $I10
  rx1162_done:
    rx1162_cur."!cursor_fail"()
    rx1162_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("300_1259779041.86401") :method
.annotate "line", 401
    $P1164 = self."!PREFIX__!subrule"("O", ":=")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("301_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "infix:sym<::=>")
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
.annotate "line", 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1174_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "::="
    add $I11, rx1169_pos, 3
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 3
    ne $S10, "::=", rx1169_fail
    add rx1169_pos, 3
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
    $P10 = rx1169_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "infix:sym<::=>")
    rx1169_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate "line", 401
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("302_1259779041.86401") :method
.annotate "line", 401
    $P1171 = self."!PREFIX__!subrule"("O", "::=")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("303_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1176_tgt
    .local int rx1176_pos
    .local int rx1176_off
    .local int rx1176_eos
    .local int rx1176_rep
    .local pmc rx1176_cur
    (rx1176_cur, rx1176_pos, rx1176_tgt) = self."!cursor_start"()
    rx1176_cur."!cursor_debug"("START ", "infix:sym<,>")
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
.annotate "line", 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1181_fail
    rx1176_cur."!mark_push"(0, rx1176_pos, $I10)
  # rx literal  ","
    add $I11, rx1176_pos, 1
    gt $I11, rx1176_eos, rx1176_fail
    sub $I11, rx1176_pos, rx1176_off
    substr $S10, rx1176_tgt, $I11, 1
    ne $S10, ",", rx1176_fail
    add rx1176_pos, 1
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
    $P10 = rx1176_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1176_fail
    rx1176_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1176_pos = $P10."pos"()
  # rx pass
    rx1176_cur."!cursor_pass"(rx1176_pos, "infix:sym<,>")
    rx1176_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1176_pos)
    .return (rx1176_cur)
  rx1176_fail:
.annotate "line", 401
    (rx1176_rep, rx1176_pos, $I10, $P10) = rx1176_cur."!mark_fail"(0)
    lt rx1176_pos, -1, rx1176_done
    eq rx1176_pos, -1, rx1176_fail
    jump $I10
  rx1176_done:
    rx1176_cur."!cursor_fail"()
    rx1176_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("304_1259779041.86401") :method
.annotate "line", 401
    $P1178 = self."!PREFIX__!subrule"("O", ",")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("305_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1183_tgt
    .local int rx1183_pos
    .local int rx1183_off
    .local int rx1183_eos
    .local int rx1183_rep
    .local pmc rx1183_cur
    (rx1183_cur, rx1183_pos, rx1183_tgt) = self."!cursor_start"()
    rx1183_cur."!cursor_debug"("START ", "prefix:sym<return>")
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
    ne $I10, -1, rxscan1186_done
    goto rxscan1186_scan
  rxscan1186_loop:
    ($P10) = rx1183_cur."from"()
    inc $P10
    set rx1183_pos, $P10
    ge rx1183_pos, rx1183_eos, rxscan1186_done
  rxscan1186_scan:
    set_addr $I10, rxscan1186_loop
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  rxscan1186_done:
.annotate "line", 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1187_fail
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  # rx literal  "return"
    add $I11, rx1183_pos, 6
    gt $I11, rx1183_eos, rx1183_fail
    sub $I11, rx1183_pos, rx1183_off
    substr $S10, rx1183_tgt, $I11, 6
    ne $S10, "return", rx1183_fail
    add rx1183_pos, 6
    set_addr $I10, rxcap_1187_fail
    ($I12, $I11) = rx1183_cur."!mark_peek"($I10)
    rx1183_cur."!cursor_pos"($I11)
    ($P10) = rx1183_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1183_pos, "")
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1187_done
  rxcap_1187_fail:
    goto rx1183_fail
  rxcap_1187_done:
  # rx charclass s
    ge rx1183_pos, rx1183_eos, rx1183_fail
    sub $I10, rx1183_pos, rx1183_off
    is_cclass $I11, 32, rx1183_tgt, $I10
    unless $I11, rx1183_fail
    inc rx1183_pos
  # rx subrule "O" subtype=capture negate=
    rx1183_cur."!cursor_pos"(rx1183_pos)
    $P10 = rx1183_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1183_fail
    rx1183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1183_pos = $P10."pos"()
  # rx pass
    rx1183_cur."!cursor_pass"(rx1183_pos, "prefix:sym<return>")
    rx1183_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1183_pos)
    .return (rx1183_cur)
  rx1183_fail:
.annotate "line", 401
    (rx1183_rep, rx1183_pos, $I10, $P10) = rx1183_cur."!mark_fail"(0)
    lt rx1183_pos, -1, rx1183_done
    eq rx1183_pos, -1, rx1183_fail
    jump $I10
  rx1183_done:
    rx1183_cur."!cursor_fail"()
    rx1183_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("306_1259779041.86401") :method
.annotate "line", 401
    new $P1185, "ResizablePMCArray"
    push $P1185, "return"
    .return ($P1185)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("307_1259779041.86401") :method :outer("11_1259779041.86401")
.annotate "line", 401
    .local string rx1189_tgt
    .local int rx1189_pos
    .local int rx1189_off
    .local int rx1189_eos
    .local int rx1189_rep
    .local pmc rx1189_cur
    (rx1189_cur, rx1189_pos, rx1189_tgt) = self."!cursor_start"()
    rx1189_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1189_cur
    .local pmc match
    .lex "$/", match
    length rx1189_eos, rx1189_tgt
    set rx1189_off, 0
    lt rx1189_pos, 2, rx1189_start
    sub rx1189_off, rx1189_pos, 1
    substr rx1189_tgt, rx1189_tgt, rx1189_off
  rx1189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1192_done
    goto rxscan1192_scan
  rxscan1192_loop:
    ($P10) = rx1189_cur."from"()
    inc $P10
    set rx1189_pos, $P10
    ge rx1189_pos, rx1189_eos, rxscan1192_done
  rxscan1192_scan:
    set_addr $I10, rxscan1192_loop
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  rxscan1192_done:
.annotate "line", 506
  # rx subcapture "sym"
    set_addr $I10, rxcap_1193_fail
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  # rx literal  "make"
    add $I11, rx1189_pos, 4
    gt $I11, rx1189_eos, rx1189_fail
    sub $I11, rx1189_pos, rx1189_off
    substr $S10, rx1189_tgt, $I11, 4
    ne $S10, "make", rx1189_fail
    add rx1189_pos, 4
    set_addr $I10, rxcap_1193_fail
    ($I12, $I11) = rx1189_cur."!mark_peek"($I10)
    rx1189_cur."!cursor_pos"($I11)
    ($P10) = rx1189_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1189_pos, "")
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1193_done
  rxcap_1193_fail:
    goto rx1189_fail
  rxcap_1193_done:
  # rx charclass s
    ge rx1189_pos, rx1189_eos, rx1189_fail
    sub $I10, rx1189_pos, rx1189_off
    is_cclass $I11, 32, rx1189_tgt, $I10
    unless $I11, rx1189_fail
    inc rx1189_pos
  # rx subrule "O" subtype=capture negate=
    rx1189_cur."!cursor_pos"(rx1189_pos)
    $P10 = rx1189_cur."O"("%list_prefix")
    unless $P10, rx1189_fail
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1189_pos = $P10."pos"()
  # rx pass
    rx1189_cur."!cursor_pass"(rx1189_pos, "prefix:sym<make>")
    rx1189_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1189_pos)
    .return (rx1189_cur)
  rx1189_fail:
.annotate "line", 401
    (rx1189_rep, rx1189_pos, $I10, $P10) = rx1189_cur."!mark_fail"(0)
    lt rx1189_pos, -1, rx1189_done
    eq rx1189_pos, -1, rx1189_fail
    jump $I10
  rx1189_done:
    rx1189_cur."!cursor_fail"()
    rx1189_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("308_1259779041.86401") :method
.annotate "line", 401
    new $P1191, "ResizablePMCArray"
    push $P1191, "make"
    .return ($P1191)
.end


.namespace ["NQP";"Regex"]
.sub "_block1194"  :subid("309_1259779041.86401") :outer("11_1259779041.86401")
.annotate "line", 509
    .const 'Sub' $P1228 = "320_1259779041.86401" 
    capture_lex $P1228
    .const 'Sub' $P1215 = "317_1259779041.86401" 
    capture_lex $P1215
    .const 'Sub' $P1210 = "315_1259779041.86401" 
    capture_lex $P1210
    .const 'Sub' $P1205 = "313_1259779041.86401" 
    capture_lex $P1205
    .const 'Sub' $P1196 = "310_1259779041.86401" 
    capture_lex $P1196
    .const 'Sub' $P1228 = "320_1259779041.86401" 
    capture_lex $P1228
    .return ($P1228)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("310_1259779041.86401") :method :outer("309_1259779041.86401")
.annotate "line", 509
    .const 'Sub' $P1202 = "312_1259779041.86401" 
    capture_lex $P1202
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    (rx1197_cur, rx1197_pos, rx1197_tgt) = self."!cursor_start"()
    rx1197_cur."!cursor_debug"("START ", "metachar:sym<:my>")
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
    ne $I10, -1, rxscan1200_done
    goto rxscan1200_scan
  rxscan1200_loop:
    ($P10) = rx1197_cur."from"()
    inc $P10
    set rx1197_pos, $P10
    ge rx1197_pos, rx1197_eos, rxscan1200_done
  rxscan1200_scan:
    set_addr $I10, rxscan1200_loop
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  rxscan1200_done:
.annotate "line", 511
  # rx literal  ":"
    add $I11, rx1197_pos, 1
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 1
    ne $S10, ":", rx1197_fail
    add rx1197_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    .const 'Sub' $P1202 = "312_1259779041.86401" 
    capture_lex $P1202
    $P10 = rx1197_cur."before"($P1202)
    unless $P10, rx1197_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."LANG"("MAIN", "statement")
    unless $P10, rx1197_fail
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1197_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."ws"()
    unless $P10, rx1197_fail
    rx1197_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1197_pos, 1
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 1
    ne $S10, ";", rx1197_fail
    add rx1197_pos, 1
.annotate "line", 510
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "metachar:sym<:my>")
    rx1197_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate "line", 509
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    rx1197_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1197_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("311_1259779041.86401") :method
.annotate "line", 509
    new $P1199, "ResizablePMCArray"
    push $P1199, ":"
    .return ($P1199)
.end


.namespace ["NQP";"Regex"]
.sub "_block1201"  :anon :subid("312_1259779041.86401") :method :outer("310_1259779041.86401")
.annotate "line", 511
    .local string rx1203_tgt
    .local int rx1203_pos
    .local int rx1203_off
    .local int rx1203_eos
    .local int rx1203_rep
    .local pmc rx1203_cur
    (rx1203_cur, rx1203_pos, rx1203_tgt) = self."!cursor_start"()
    rx1203_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1203_cur
    .local pmc match
    .lex "$/", match
    length rx1203_eos, rx1203_tgt
    set rx1203_off, 0
    lt rx1203_pos, 2, rx1203_start
    sub rx1203_off, rx1203_pos, 1
    substr rx1203_tgt, rx1203_tgt, rx1203_off
  rx1203_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1204_done
    goto rxscan1204_scan
  rxscan1204_loop:
    ($P10) = rx1203_cur."from"()
    inc $P10
    set rx1203_pos, $P10
    ge rx1203_pos, rx1203_eos, rxscan1204_done
  rxscan1204_scan:
    set_addr $I10, rxscan1204_loop
    rx1203_cur."!mark_push"(0, rx1203_pos, $I10)
  rxscan1204_done:
  # rx literal  "my"
    add $I11, rx1203_pos, 2
    gt $I11, rx1203_eos, rx1203_fail
    sub $I11, rx1203_pos, rx1203_off
    substr $S10, rx1203_tgt, $I11, 2
    ne $S10, "my", rx1203_fail
    add rx1203_pos, 2
  # rx pass
    rx1203_cur."!cursor_pass"(rx1203_pos, "")
    rx1203_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1203_pos)
    .return (rx1203_cur)
  rx1203_fail:
    (rx1203_rep, rx1203_pos, $I10, $P10) = rx1203_cur."!mark_fail"(0)
    lt rx1203_pos, -1, rx1203_done
    eq rx1203_pos, -1, rx1203_fail
    jump $I10
  rx1203_done:
    rx1203_cur."!cursor_fail"()
    rx1203_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1203_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("313_1259779041.86401") :method :outer("309_1259779041.86401")
.annotate "line", 509
    .local string rx1206_tgt
    .local int rx1206_pos
    .local int rx1206_off
    .local int rx1206_eos
    .local int rx1206_rep
    .local pmc rx1206_cur
    (rx1206_cur, rx1206_pos, rx1206_tgt) = self."!cursor_start"()
    rx1206_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1206_cur
    .local pmc match
    .lex "$/", match
    length rx1206_eos, rx1206_tgt
    set rx1206_off, 0
    lt rx1206_pos, 2, rx1206_start
    sub rx1206_off, rx1206_pos, 1
    substr rx1206_tgt, rx1206_tgt, rx1206_off
  rx1206_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1209_done
    goto rxscan1209_scan
  rxscan1209_loop:
    ($P10) = rx1206_cur."from"()
    inc $P10
    set rx1206_pos, $P10
    ge rx1206_pos, rx1206_eos, rxscan1209_done
  rxscan1209_scan:
    set_addr $I10, rxscan1209_loop
    rx1206_cur."!mark_push"(0, rx1206_pos, $I10)
  rxscan1209_done:
.annotate "line", 515
  # rx enumcharlist negate=0 zerowidth
    ge rx1206_pos, rx1206_eos, rx1206_fail
    sub $I10, rx1206_pos, rx1206_off
    substr $S10, rx1206_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1206_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1206_cur."!cursor_pos"(rx1206_pos)
    $P10 = rx1206_cur."codeblock"()
    unless $P10, rx1206_fail
    rx1206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1206_pos = $P10."pos"()
.annotate "line", 514
  # rx pass
    rx1206_cur."!cursor_pass"(rx1206_pos, "metachar:sym<{ }>")
    rx1206_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1206_pos)
    .return (rx1206_cur)
  rx1206_fail:
.annotate "line", 509
    (rx1206_rep, rx1206_pos, $I10, $P10) = rx1206_cur."!mark_fail"(0)
    lt rx1206_pos, -1, rx1206_done
    eq rx1206_pos, -1, rx1206_fail
    jump $I10
  rx1206_done:
    rx1206_cur."!cursor_fail"()
    rx1206_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1206_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("314_1259779041.86401") :method
.annotate "line", 509
    new $P1208, "ResizablePMCArray"
    push $P1208, "{"
    .return ($P1208)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("315_1259779041.86401") :method :outer("309_1259779041.86401")
.annotate "line", 509
    .local string rx1211_tgt
    .local int rx1211_pos
    .local int rx1211_off
    .local int rx1211_eos
    .local int rx1211_rep
    .local pmc rx1211_cur
    (rx1211_cur, rx1211_pos, rx1211_tgt) = self."!cursor_start"()
    rx1211_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
    ne $I10, -1, rxscan1214_done
    goto rxscan1214_scan
  rxscan1214_loop:
    ($P10) = rx1211_cur."from"()
    inc $P10
    set rx1211_pos, $P10
    ge rx1211_pos, rx1211_eos, rxscan1214_done
  rxscan1214_scan:
    set_addr $I10, rxscan1214_loop
    rx1211_cur."!mark_push"(0, rx1211_pos, $I10)
  rxscan1214_done:
.annotate "line", 519
  # rx enumcharlist negate=0 zerowidth
    ge rx1211_pos, rx1211_eos, rx1211_fail
    sub $I10, rx1211_pos, rx1211_off
    substr $S10, rx1211_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1211_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1211_cur."!cursor_pos"(rx1211_pos)
    $P10 = rx1211_cur."codeblock"()
    unless $P10, rx1211_fail
    rx1211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1211_pos = $P10."pos"()
.annotate "line", 518
  # rx pass
    rx1211_cur."!cursor_pass"(rx1211_pos, "assertion:sym<{ }>")
    rx1211_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1211_pos)
    .return (rx1211_cur)
  rx1211_fail:
.annotate "line", 509
    (rx1211_rep, rx1211_pos, $I10, $P10) = rx1211_cur."!mark_fail"(0)
    lt rx1211_pos, -1, rx1211_done
    eq rx1211_pos, -1, rx1211_fail
    jump $I10
  rx1211_done:
    rx1211_cur."!cursor_fail"()
    rx1211_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1211_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("316_1259779041.86401") :method
.annotate "line", 509
    new $P1213, "ResizablePMCArray"
    push $P1213, "{"
    .return ($P1213)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("317_1259779041.86401") :method :outer("309_1259779041.86401")
.annotate "line", 509
    .const 'Sub' $P1224 = "319_1259779041.86401" 
    capture_lex $P1224
    .local string rx1216_tgt
    .local int rx1216_pos
    .local int rx1216_off
    .local int rx1216_eos
    .local int rx1216_rep
    .local pmc rx1216_cur
    (rx1216_cur, rx1216_pos, rx1216_tgt) = self."!cursor_start"()
    rx1216_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1216_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1216_cur
    .local pmc match
    .lex "$/", match
    length rx1216_eos, rx1216_tgt
    set rx1216_off, 0
    lt rx1216_pos, 2, rx1216_start
    sub rx1216_off, rx1216_pos, 1
    substr rx1216_tgt, rx1216_tgt, rx1216_off
  rx1216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1219_done
    goto rxscan1219_scan
  rxscan1219_loop:
    ($P10) = rx1216_cur."from"()
    inc $P10
    set rx1216_pos, $P10
    ge rx1216_pos, rx1216_eos, rxscan1219_done
  rxscan1219_scan:
    set_addr $I10, rxscan1219_loop
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  rxscan1219_done:
.annotate "line", 523
  # rx subcapture "longname"
    set_addr $I10, rxcap_1220_fail
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1216_pos, rx1216_off
    find_not_cclass $I11, 8192, rx1216_tgt, $I10, rx1216_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1216_fail
    add rx1216_pos, rx1216_off, $I11
    set_addr $I10, rxcap_1220_fail
    ($I12, $I11) = rx1216_cur."!mark_peek"($I10)
    rx1216_cur."!cursor_pos"($I11)
    ($P10) = rx1216_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1216_pos, "")
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1220_done
  rxcap_1220_fail:
    goto rx1216_fail
  rxcap_1220_done:
.annotate "line", 530
  # rx rxquantr1221 ** 0..1
    set_addr $I1227, rxquantr1221_done
    rx1216_cur."!mark_push"(0, rx1216_pos, $I1227)
  rxquantr1221_loop:
  alt1222_0:
.annotate "line", 524
    set_addr $I10, alt1222_1
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
.annotate "line", 525
  # rx subrule "before" subtype=zerowidth negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    .const 'Sub' $P1224 = "319_1259779041.86401" 
    capture_lex $P1224
    $P10 = rx1216_cur."before"($P1224)
    unless $P10, rx1216_fail
    goto alt1222_end
  alt1222_1:
    set_addr $I10, alt1222_2
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
.annotate "line", 526
  # rx literal  "="
    add $I11, rx1216_pos, 1
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 1
    ne $S10, "=", rx1216_fail
    add rx1216_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."assertion"()
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1216_pos = $P10."pos"()
    goto alt1222_end
  alt1222_2:
    set_addr $I10, alt1222_3
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
.annotate "line", 527
  # rx literal  ":"
    add $I11, rx1216_pos, 1
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 1
    ne $S10, ":", rx1216_fail
    add rx1216_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."arglist"()
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1216_pos = $P10."pos"()
    goto alt1222_end
  alt1222_3:
    set_addr $I10, alt1222_4
    rx1216_cur."!mark_push"(0, rx1216_pos, $I10)
.annotate "line", 528
  # rx literal  "("
    add $I11, rx1216_pos, 1
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 1
    ne $S10, "(", rx1216_fail
    add rx1216_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1216_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1216_pos, 1
    gt $I11, rx1216_eos, rx1216_fail
    sub $I11, rx1216_pos, rx1216_off
    substr $S10, rx1216_tgt, $I11, 1
    ne $S10, ")", rx1216_fail
    add rx1216_pos, 1
    goto alt1222_end
  alt1222_4:
.annotate "line", 529
  # rx subrule "normspace" subtype=method negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."normspace"()
    unless $P10, rx1216_fail
    rx1216_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1216_cur."!cursor_pos"(rx1216_pos)
    $P10 = rx1216_cur."nibbler"()
    unless $P10, rx1216_fail
    rx1216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1216_pos = $P10."pos"()
  alt1222_end:
.annotate "line", 530
    (rx1216_rep) = rx1216_cur."!mark_commit"($I1227)
  rxquantr1221_done:
.annotate "line", 522
  # rx pass
    rx1216_cur."!cursor_pass"(rx1216_pos, "assertion:sym<name>")
    rx1216_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1216_pos)
    .return (rx1216_cur)
  rx1216_fail:
.annotate "line", 509
    (rx1216_rep, rx1216_pos, $I10, $P10) = rx1216_cur."!mark_fail"(0)
    lt rx1216_pos, -1, rx1216_done
    eq rx1216_pos, -1, rx1216_fail
    jump $I10
  rx1216_done:
    rx1216_cur."!cursor_fail"()
    rx1216_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1216_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("318_1259779041.86401") :method
.annotate "line", 509
    new $P1218, "ResizablePMCArray"
    push $P1218, ""
    .return ($P1218)
.end


.namespace ["NQP";"Regex"]
.sub "_block1223"  :anon :subid("319_1259779041.86401") :method :outer("317_1259779041.86401")
.annotate "line", 525
    .local string rx1225_tgt
    .local int rx1225_pos
    .local int rx1225_off
    .local int rx1225_eos
    .local int rx1225_rep
    .local pmc rx1225_cur
    (rx1225_cur, rx1225_pos, rx1225_tgt) = self."!cursor_start"()
    rx1225_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1225_cur
    .local pmc match
    .lex "$/", match
    length rx1225_eos, rx1225_tgt
    set rx1225_off, 0
    lt rx1225_pos, 2, rx1225_start
    sub rx1225_off, rx1225_pos, 1
    substr rx1225_tgt, rx1225_tgt, rx1225_off
  rx1225_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1226_done
    goto rxscan1226_scan
  rxscan1226_loop:
    ($P10) = rx1225_cur."from"()
    inc $P10
    set rx1225_pos, $P10
    ge rx1225_pos, rx1225_eos, rxscan1226_done
  rxscan1226_scan:
    set_addr $I10, rxscan1226_loop
    rx1225_cur."!mark_push"(0, rx1225_pos, $I10)
  rxscan1226_done:
  # rx literal  ">"
    add $I11, rx1225_pos, 1
    gt $I11, rx1225_eos, rx1225_fail
    sub $I11, rx1225_pos, rx1225_off
    substr $S10, rx1225_tgt, $I11, 1
    ne $S10, ">", rx1225_fail
    add rx1225_pos, 1
  # rx pass
    rx1225_cur."!cursor_pass"(rx1225_pos, "")
    rx1225_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1225_pos)
    .return (rx1225_cur)
  rx1225_fail:
    (rx1225_rep, rx1225_pos, $I10, $P10) = rx1225_cur."!mark_fail"(0)
    lt rx1225_pos, -1, rx1225_done
    eq rx1225_pos, -1, rx1225_fail
    jump $I10
  rx1225_done:
    rx1225_cur."!cursor_fail"()
    rx1225_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1225_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("320_1259779041.86401") :method :outer("309_1259779041.86401")
.annotate "line", 509
    .local string rx1229_tgt
    .local int rx1229_pos
    .local int rx1229_off
    .local int rx1229_eos
    .local int rx1229_rep
    .local pmc rx1229_cur
    (rx1229_cur, rx1229_pos, rx1229_tgt) = self."!cursor_start"()
    rx1229_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1229_cur
    .local pmc match
    .lex "$/", match
    length rx1229_eos, rx1229_tgt
    set rx1229_off, 0
    lt rx1229_pos, 2, rx1229_start
    sub rx1229_off, rx1229_pos, 1
    substr rx1229_tgt, rx1229_tgt, rx1229_off
  rx1229_start:
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
.annotate "line", 535
  # rx subrule "LANG" subtype=capture negate=
    rx1229_cur."!cursor_pos"(rx1229_pos)
    $P10 = rx1229_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1229_fail
    rx1229_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1229_pos = $P10."pos"()
.annotate "line", 534
  # rx pass
    rx1229_cur."!cursor_pass"(rx1229_pos, "codeblock")
    rx1229_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1229_pos)
    .return (rx1229_cur)
  rx1229_fail:
.annotate "line", 509
    (rx1229_rep, rx1229_pos, $I10, $P10) = rx1229_cur."!mark_fail"(0)
    lt rx1229_pos, -1, rx1229_done
    eq rx1229_pos, -1, rx1229_fail
    jump $I10
  rx1229_done:
    rx1229_cur."!cursor_fail"()
    rx1229_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1229_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("321_1259779041.86401") :method
.annotate "line", 509
    $P1231 = self."!PREFIX__!subrule"("block", "")
    new $P1232, "ResizablePMCArray"
    push $P1232, $P1231
    .return ($P1232)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259779054.5228")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2078 = $P14()
.annotate "line", 1
    .return ($P2078)
.end


.namespace []
.sub "" :load :init :subid("post121") :outer("10_1259779054.5228")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259779054.5228" 
    .local pmc block
    set block, $P12
    $P2079 = get_root_global ["parrot"], "P6metaclass"
    $P2079."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1259779054.5228") :outer("10_1259779054.5228")
.annotate "line", 3
    .const 'Sub' $P2074 = "120_1259779054.5228" 
    capture_lex $P2074
    get_hll_global $P2010, ["NQP";"RegexActions"], "_block2009" 
    capture_lex $P2010
    .const 'Sub' $P1997 = "114_1259779054.5228" 
    capture_lex $P1997
    .const 'Sub' $P1987 = "113_1259779054.5228" 
    capture_lex $P1987
    .const 'Sub' $P1977 = "112_1259779054.5228" 
    capture_lex $P1977
    .const 'Sub' $P1967 = "111_1259779054.5228" 
    capture_lex $P1967
    .const 'Sub' $P1953 = "110_1259779054.5228" 
    capture_lex $P1953
    .const 'Sub' $P1943 = "109_1259779054.5228" 
    capture_lex $P1943
    .const 'Sub' $P1929 = "108_1259779054.5228" 
    capture_lex $P1929
    .const 'Sub' $P1919 = "107_1259779054.5228" 
    capture_lex $P1919
    .const 'Sub' $P1909 = "106_1259779054.5228" 
    capture_lex $P1909
    .const 'Sub' $P1899 = "105_1259779054.5228" 
    capture_lex $P1899
    .const 'Sub' $P1889 = "104_1259779054.5228" 
    capture_lex $P1889
    .const 'Sub' $P1879 = "103_1259779054.5228" 
    capture_lex $P1879
    .const 'Sub' $P1851 = "102_1259779054.5228" 
    capture_lex $P1851
    .const 'Sub' $P1834 = "101_1259779054.5228" 
    capture_lex $P1834
    .const 'Sub' $P1824 = "100_1259779054.5228" 
    capture_lex $P1824
    .const 'Sub' $P1812 = "99_1259779054.5228" 
    capture_lex $P1812
    .const 'Sub' $P1800 = "98_1259779054.5228" 
    capture_lex $P1800
    .const 'Sub' $P1788 = "97_1259779054.5228" 
    capture_lex $P1788
    .const 'Sub' $P1778 = "96_1259779054.5228" 
    capture_lex $P1778
    .const 'Sub' $P1749 = "95_1259779054.5228" 
    capture_lex $P1749
    .const 'Sub' $P1725 = "94_1259779054.5228" 
    capture_lex $P1725
    .const 'Sub' $P1715 = "93_1259779054.5228" 
    capture_lex $P1715
    .const 'Sub' $P1705 = "92_1259779054.5228" 
    capture_lex $P1705
    .const 'Sub' $P1678 = "91_1259779054.5228" 
    capture_lex $P1678
    .const 'Sub' $P1660 = "90_1259779054.5228" 
    capture_lex $P1660
    .const 'Sub' $P1650 = "89_1259779054.5228" 
    capture_lex $P1650
    .const 'Sub' $P1566 = "86_1259779054.5228" 
    capture_lex $P1566
    .const 'Sub' $P1556 = "85_1259779054.5228" 
    capture_lex $P1556
    .const 'Sub' $P1527 = "84_1259779054.5228" 
    capture_lex $P1527
    .const 'Sub' $P1485 = "83_1259779054.5228" 
    capture_lex $P1485
    .const 'Sub' $P1469 = "82_1259779054.5228" 
    capture_lex $P1469
    .const 'Sub' $P1460 = "81_1259779054.5228" 
    capture_lex $P1460
    .const 'Sub' $P1428 = "80_1259779054.5228" 
    capture_lex $P1428
    .const 'Sub' $P1341 = "78_1259779054.5228" 
    capture_lex $P1341
    .const 'Sub' $P1324 = "77_1259779054.5228" 
    capture_lex $P1324
    .const 'Sub' $P1304 = "76_1259779054.5228" 
    capture_lex $P1304
    .const 'Sub' $P1220 = "75_1259779054.5228" 
    capture_lex $P1220
    .const 'Sub' $P1196 = "73_1259779054.5228" 
    capture_lex $P1196
    .const 'Sub' $P1162 = "71_1259779054.5228" 
    capture_lex $P1162
    .const 'Sub' $P1112 = "69_1259779054.5228" 
    capture_lex $P1112
    .const 'Sub' $P1102 = "68_1259779054.5228" 
    capture_lex $P1102
    .const 'Sub' $P1092 = "67_1259779054.5228" 
    capture_lex $P1092
    .const 'Sub' $P1021 = "65_1259779054.5228" 
    capture_lex $P1021
    .const 'Sub' $P1004 = "64_1259779054.5228" 
    capture_lex $P1004
    .const 'Sub' $P994 = "63_1259779054.5228" 
    capture_lex $P994
    .const 'Sub' $P984 = "62_1259779054.5228" 
    capture_lex $P984
    .const 'Sub' $P974 = "61_1259779054.5228" 
    capture_lex $P974
    .const 'Sub' $P950 = "60_1259779054.5228" 
    capture_lex $P950
    .const 'Sub' $P897 = "59_1259779054.5228" 
    capture_lex $P897
    .const 'Sub' $P887 = "58_1259779054.5228" 
    capture_lex $P887
    .const 'Sub' $P798 = "56_1259779054.5228" 
    capture_lex $P798
    .const 'Sub' $P772 = "55_1259779054.5228" 
    capture_lex $P772
    .const 'Sub' $P762 = "54_1259779054.5228" 
    capture_lex $P762
    .const 'Sub' $P752 = "53_1259779054.5228" 
    capture_lex $P752
    .const 'Sub' $P742 = "52_1259779054.5228" 
    capture_lex $P742
    .const 'Sub' $P732 = "51_1259779054.5228" 
    capture_lex $P732
    .const 'Sub' $P722 = "50_1259779054.5228" 
    capture_lex $P722
    .const 'Sub' $P712 = "49_1259779054.5228" 
    capture_lex $P712
    .const 'Sub' $P702 = "48_1259779054.5228" 
    capture_lex $P702
    .const 'Sub' $P692 = "47_1259779054.5228" 
    capture_lex $P692
    .const 'Sub' $P682 = "46_1259779054.5228" 
    capture_lex $P682
    .const 'Sub' $P672 = "45_1259779054.5228" 
    capture_lex $P672
    .const 'Sub' $P662 = "44_1259779054.5228" 
    capture_lex $P662
    .const 'Sub' $P652 = "43_1259779054.5228" 
    capture_lex $P652
    .const 'Sub' $P634 = "42_1259779054.5228" 
    capture_lex $P634
    .const 'Sub' $P599 = "41_1259779054.5228" 
    capture_lex $P599
    .const 'Sub' $P583 = "40_1259779054.5228" 
    capture_lex $P583
    .const 'Sub' $P562 = "39_1259779054.5228" 
    capture_lex $P562
    .const 'Sub' $P542 = "38_1259779054.5228" 
    capture_lex $P542
    .const 'Sub' $P529 = "37_1259779054.5228" 
    capture_lex $P529
    .const 'Sub' $P503 = "36_1259779054.5228" 
    capture_lex $P503
    .const 'Sub' $P467 = "35_1259779054.5228" 
    capture_lex $P467
    .const 'Sub' $P450 = "34_1259779054.5228" 
    capture_lex $P450
    .const 'Sub' $P436 = "33_1259779054.5228" 
    capture_lex $P436
    .const 'Sub' $P381 = "31_1259779054.5228" 
    capture_lex $P381
    .const 'Sub' $P368 = "30_1259779054.5228" 
    capture_lex $P368
    .const 'Sub' $P349 = "29_1259779054.5228" 
    capture_lex $P349
    .const 'Sub' $P339 = "28_1259779054.5228" 
    capture_lex $P339
    .const 'Sub' $P329 = "27_1259779054.5228" 
    capture_lex $P329
    .const 'Sub' $P313 = "26_1259779054.5228" 
    capture_lex $P313
    .const 'Sub' $P253 = "24_1259779054.5228" 
    capture_lex $P253
    .const 'Sub' $P210 = "22_1259779054.5228" 
    capture_lex $P210
    .const 'Sub' $P191 = "21_1259779054.5228" 
    capture_lex $P191
    .const 'Sub' $P158 = "20_1259779054.5228" 
    capture_lex $P158
    .const 'Sub' $P148 = "19_1259779054.5228" 
    capture_lex $P148
    .const 'Sub' $P94 = "18_1259779054.5228" 
    capture_lex $P94
    .const 'Sub' $P79 = "17_1259779054.5228" 
    capture_lex $P79
    .const 'Sub' $P61 = "16_1259779054.5228" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1259779054.5228" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1259779054.5228" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_124
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_124:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1259779054.5228" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1259779054.5228" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1259779054.5228" 
    capture_lex $P61
    .lex "sigiltype", $P61
.annotate "line", 40
    .const 'Sub' $P79 = "17_1259779054.5228" 
    capture_lex $P79
    .lex "colonpair_str", $P79
.annotate "line", 186
    .const 'Sub' $P94 = "18_1259779054.5228" 
    capture_lex $P94
    .lex "push_block_handler", $P94
.annotate "line", 3
    get_global $P144, "@BLOCK"
.annotate "line", 5
    find_lex $P145, "xblock_immediate"
    find_lex $P146, "block_immediate"
    find_lex $P147, "sigiltype"
.annotate "line", 32
    find_lex $P190, "colonpair_str"
.annotate "line", 179
    find_lex $P582, "push_block_handler"
.annotate "line", 722
    get_hll_global $P2010, ["NQP";"RegexActions"], "_block2009" 
    capture_lex $P2010
    $P2072 = $P2010()
.annotate "line", 3
    .return ($P2072)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post122") :outer("11_1259779054.5228")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2074 = "120_1259779054.5228" 
    capture_lex $P2074
    $P2074()
    $P2077 = get_root_global ["parrot"], "P6metaclass"
    $P2077."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2073"  :anon :subid("120_1259779054.5228") :outer("11_1259779054.5228")
.annotate "line", 6
    get_global $P2075, "@BLOCK"
    unless_null $P2075, vivify_123
    new $P2075, "ResizablePMCArray"
    set_global "@BLOCK", $P2075
  vivify_123:
 $P2076 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2076
.annotate "line", 5
    .return ($P2076)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1259779054.5228") :outer("11_1259779054.5228")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_125
    new $P20, "ResizablePMCArray"
  vivify_125:
    set $P21, $P20[1]
    unless_null $P21, vivify_126
    new $P21, "Undef"
  vivify_126:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_127
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_127:
    set $P23[1], $P22
    find_lex $P24, "$xblock"
.annotate "line", 9
    .return ($P24)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["NQP";"Actions"]
.sub "block_immediate"  :subid("13_1259779054.5228") :outer("11_1259779054.5228")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1259779054.5228" 
    capture_lex $P39
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$block", param_29
.annotate "line", 15
    find_lex $P30, "$block"
    $P30."blocktype"("immediate")
.annotate "line", 16
    find_lex $P34, "$block"
    $P35 = $P34."symtable"()
    unless $P35, unless_33
    set $P32, $P35
    goto unless_33_end
  unless_33:
    find_lex $P36, "$block"
    $P37 = $P36."handlers"()
    set $P32, $P37
  unless_33_end:
    if $P32, unless_31_end
    .const 'Sub' $P39 = "14_1259779054.5228" 
    capture_lex $P39
    $P39()
  unless_31_end:
    find_lex $P59, "$block"
.annotate "line", 14
    .return ($P59)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["NQP";"Actions"]
.sub "_block38"  :anon :subid("14_1259779054.5228") :outer("13_1259779054.5228")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1259779054.5228" 
    capture_lex $P50
.annotate "line", 17
    new $P40, "Undef"
    .lex "$stmts", $P40
    get_hll_global $P41, ["PAST"], "Stmts"
    find_lex $P42, "$block"
    $P43 = $P41."new"($P42 :named("node"))
    store_lex "$stmts", $P43
.annotate "line", 18
    find_lex $P45, "$block"
    $P46 = $P45."list"()
    defined $I47, $P46
    unless $I47, for_undef_128
    iter $P44, $P46
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P44, loop55_done
    shift $P48, $P44
  loop55_redo:
    .const 'Sub' $P50 = "15_1259779054.5228" 
    capture_lex $P50
    $P50($P48)
  loop55_next:
    goto loop55_test
  loop55_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, 'type'
    eq $P57, 65, loop55_next
    eq $P57, 67, loop55_redo
  loop55_done:
    pop_eh 
  for_undef_128:
.annotate "line", 19
    find_lex $P58, "$stmts"
    store_lex "$block", $P58
.annotate "line", 16
    .return ($P58)
.end


.namespace ["NQP";"Actions"]
.sub "_block49"  :anon :subid("15_1259779054.5228") :outer("14_1259779054.5228")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1259779054.5228") :outer("11_1259779054.5228")
    .param pmc param_64
.annotate "line", 24
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "$sigil", param_64
.annotate "line", 25
    find_lex $P67, "$sigil"
    set $S68, $P67
    iseq $I69, $S68, "%"
    if $I69, if_66
.annotate "line", 27
    find_lex $P73, "$sigil"
    set $S74, $P73
    iseq $I75, $S74, "@"
    if $I75, if_72
    new $P77, "String"
    assign $P77, "Undef"
    set $P71, $P77
    goto if_72_end
  if_72:
    new $P76, "String"
    assign $P76, "ResizablePMCArray"
    set $P71, $P76
  if_72_end:
    set $P65, $P71
.annotate "line", 25
    goto if_66_end
  if_66:
    new $P70, "String"
    assign $P70, "Hash"
    set $P65, $P70
  if_66_end:
.annotate "line", 24
    .return ($P65)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair_str"  :subid("17_1259779054.5228") :outer("11_1259779054.5228")
    .param pmc param_82
.annotate "line", 40
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "$ast", param_82
.annotate "line", 41
    get_hll_global $P85, ["PAST"], "Op"
    find_lex $P86, "$ast"
    $P87 = $P85."ACCEPTS"($P86)
    if $P87, if_84
.annotate "line", 43
    find_lex $P91, "$ast"
    $P92 = $P91."value"()
    set $P83, $P92
.annotate "line", 41
    goto if_84_end
  if_84:
.annotate "line", 42
    find_lex $P88, "$ast"
    $P89 = $P88."list"()
    join $S90, " ", $P89
    new $P83, 'String'
    set $P83, $S90
  if_84_end:
.annotate "line", 40
    .return ($P83)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["NQP";"Actions"]
.sub "push_block_handler"  :subid("18_1259779054.5228") :outer("11_1259779054.5228")
    .param pmc param_97
    .param pmc param_98
.annotate "line", 186
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "$/", param_97
    .lex "$block", param_98
.annotate "line", 187
    get_global $P100, "@BLOCK"
    unless_null $P100, vivify_129
    new $P100, "ResizablePMCArray"
  vivify_129:
    set $P101, $P100[0]
    unless_null $P101, vivify_130
    new $P101, "Undef"
  vivify_130:
    $P102 = $P101."handlers"()
    if $P102, unless_99_end
.annotate "line", 188
    get_global $P103, "@BLOCK"
    unless_null $P103, vivify_131
    new $P103, "ResizablePMCArray"
  vivify_131:
    set $P104, $P103[0]
    unless_null $P104, vivify_132
    new $P104, "Undef"
  vivify_132:
    new $P105, "ResizablePMCArray"
    $P104."handlers"($P105)
  unless_99_end:
.annotate "line", 190
    find_lex $P107, "$block"
    $P108 = $P107."arity"()
    if $P108, unless_106_end
.annotate "line", 191
    find_lex $P109, "$block"
.annotate "line", 192
    get_hll_global $P110, ["PAST"], "Op"
.annotate "line", 193
    get_hll_global $P111, ["PAST"], "Var"
    $P112 = $P111."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate "line", 194
    get_hll_global $P113, ["PAST"], "Var"
    $P114 = $P113."new"("lexical" :named("scope"), "$_" :named("name"))
    $P115 = $P110."new"($P112, $P114, "bind" :named("pasttype"))
.annotate "line", 192
    $P109."unshift"($P115)
.annotate "line", 197
    find_lex $P116, "$block"
    get_hll_global $P117, ["PAST"], "Var"
    $P118 = $P117."new"("$_" :named("name"), "parameter" :named("scope"))
    $P116."unshift"($P118)
.annotate "line", 198
    find_lex $P119, "$block"
    $P119."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 199
    find_lex $P120, "$block"
    $P120."symbol"("$!", "lexical" :named("scope"))
.annotate "line", 200
    find_lex $P121, "$block"
    $P121."arity"(1)
  unless_106_end:
.annotate "line", 202
    find_lex $P122, "$block"
    $P122."blocktype"("declaration")
.annotate "line", 203
    get_global $P123, "@BLOCK"
    unless_null $P123, vivify_133
    new $P123, "ResizablePMCArray"
  vivify_133:
    set $P124, $P123[0]
    unless_null $P124, vivify_134
    new $P124, "Undef"
  vivify_134:
    $P125 = $P124."handlers"()
.annotate "line", 204
    get_hll_global $P126, ["PAST"], "Control"
    find_lex $P127, "$/"
.annotate "line", 206
    get_hll_global $P128, ["PAST"], "Stmts"
.annotate "line", 207
    get_hll_global $P129, ["PAST"], "Op"
    find_lex $P130, "$block"
.annotate "line", 209
    get_hll_global $P131, ["PAST"], "Var"
    $P132 = $P131."new"("register" :named("scope"), "exception" :named("name"))
    $P133 = $P129."new"($P130, $P132, "call" :named("pasttype"))
.annotate "line", 211
    get_hll_global $P134, ["PAST"], "Op"
.annotate "line", 212
    get_hll_global $P135, ["PAST"], "Var"
.annotate "line", 213
    get_hll_global $P136, ["PAST"], "Var"
    $P137 = $P136."new"("register" :named("scope"), "exception" :named("name"))
    $P138 = $P135."new"($P137, "handled", "keyed" :named("scope"))
.annotate "line", 212
    $P139 = $P134."new"($P138, 1, "bind" :named("pasttype"))
.annotate "line", 211
    $P140 = $P128."new"($P133, $P139)
.annotate "line", 206
    $P141 = $P126."new"($P140, $P127 :named("node"))
.annotate "line", 204
    $P142 = $P125."unshift"($P141)
.annotate "line", 186
    .return ($P142)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("19_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_151
.annotate "line", 30
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    .lex "$/", param_151
    find_lex $P152, "$/"
    find_lex $P153, "$/"
    unless_null $P153, vivify_135
    new $P153, "Hash"
  vivify_135:
    set $P154, $P153["comp_unit"]
    unless_null $P154, vivify_136
    new $P154, "Undef"
  vivify_136:
    $P155 = $P154."ast"()
    $P156 = $P152."!make"($P155)
    .return ($P156)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, "payload"
    .return ($P157)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("20_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_161
.annotate "line", 32
    new $P160, 'ExceptionHandler'
    set_addr $P160, control_159
    $P160."handle_types"(58)
    push_eh $P160
    .lex "self", self
    .lex "$/", param_161
.annotate "line", 33
    find_lex $P162, "$/"
.annotate "line", 34
    find_lex $P165, "$/"
    unless_null $P165, vivify_137
    new $P165, "Hash"
  vivify_137:
    set $P166, $P165["colonpair"]
    unless_null $P166, vivify_138
    new $P166, "Undef"
  vivify_138:
    if $P166, if_164
.annotate "line", 36
    find_lex $P186, "$/"
    set $S187, $P186
    new $P163, 'String'
    set $P163, $S187
.annotate "line", 34
    goto if_164_end
  if_164:
    find_lex $P167, "$/"
    unless_null $P167, vivify_139
    new $P167, "Hash"
  vivify_139:
    set $P168, $P167["identifier"]
    unless_null $P168, vivify_140
    new $P168, "Undef"
  vivify_140:
    set $S169, $P168
    new $P170, 'String'
    set $P170, $S169
    concat $P171, $P170, ":"
    find_lex $P172, "$/"
    unless_null $P172, vivify_141
    new $P172, "Hash"
  vivify_141:
    set $P173, $P172["colonpair"]
    unless_null $P173, vivify_142
    new $P173, "ResizablePMCArray"
  vivify_142:
    set $P174, $P173[0]
    unless_null $P174, vivify_143
    new $P174, "Undef"
  vivify_143:
    $P175 = $P174."ast"()
    $S176 = $P175."named"()
    concat $P177, $P171, $S176
    concat $P178, $P177, "<"
.annotate "line", 35
    find_lex $P179, "$/"
    unless_null $P179, vivify_144
    new $P179, "Hash"
  vivify_144:
    set $P180, $P179["colonpair"]
    unless_null $P180, vivify_145
    new $P180, "ResizablePMCArray"
  vivify_145:
    set $P181, $P180[0]
    unless_null $P181, vivify_146
    new $P181, "Undef"
  vivify_146:
    $P182 = $P181."ast"()
    $S183 = "colonpair_str"($P182)
    concat $P184, $P178, $S183
    concat $P185, $P184, ">"
    set $P163, $P185
  if_164_end:
.annotate "line", 34
    $P188 = $P162."!make"($P163)
.annotate "line", 32
    .return ($P188)
  control_159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("21_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_194
.annotate "line", 46
    new $P193, 'ExceptionHandler'
    set_addr $P193, control_192
    $P193."handle_types"(58)
    push_eh $P193
    .lex "self", self
    .lex "$/", param_194
.annotate "line", 47
    new $P195, "Undef"
    .lex "$past", $P195
.annotate "line", 48
    new $P196, "Undef"
    .lex "$BLOCK", $P196
.annotate "line", 47
    find_lex $P197, "$/"
    unless_null $P197, vivify_147
    new $P197, "Hash"
  vivify_147:
    set $P198, $P197["statementlist"]
    unless_null $P198, vivify_148
    new $P198, "Undef"
  vivify_148:
    $P199 = $P198."ast"()
    store_lex "$past", $P199
.annotate "line", 48
    get_global $P200, "@BLOCK"
    $P201 = $P200."shift"()
    store_lex "$BLOCK", $P201
.annotate "line", 49
    find_lex $P202, "$BLOCK"
    find_lex $P203, "$past"
    $P202."push"($P203)
.annotate "line", 50
    find_lex $P204, "$BLOCK"
    find_lex $P205, "$/"
    $P204."node"($P205)
.annotate "line", 51
    find_lex $P206, "$/"
    find_lex $P207, "$BLOCK"
    $P208 = $P206."!make"($P207)
.annotate "line", 46
    .return ($P208)
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("22_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_213
.annotate "line", 54
    .const 'Sub' $P227 = "23_1259779054.5228" 
    capture_lex $P227
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "self", self
    .lex "$/", param_213
.annotate "line", 55
    new $P214, "Undef"
    .lex "$past", $P214
    get_hll_global $P215, ["PAST"], "Stmts"
    find_lex $P216, "$/"
    $P217 = $P215."new"($P216 :named("node"))
    store_lex "$past", $P217
.annotate "line", 56
    find_lex $P219, "$/"
    unless_null $P219, vivify_149
    new $P219, "Hash"
  vivify_149:
    set $P220, $P219["statement"]
    unless_null $P220, vivify_150
    new $P220, "Undef"
  vivify_150:
    unless $P220, if_218_end
.annotate "line", 57
    find_lex $P222, "$/"
    unless_null $P222, vivify_151
    new $P222, "Hash"
  vivify_151:
    set $P223, $P222["statement"]
    unless_null $P223, vivify_152
    new $P223, "Undef"
  vivify_152:
    defined $I224, $P223
    unless $I224, for_undef_153
    iter $P221, $P223
    new $P247, 'ExceptionHandler'
    set_addr $P247, loop246_handler
    $P247."handle_types"(65, 67, 66)
    push_eh $P247
  loop246_test:
    unless $P221, loop246_done
    shift $P225, $P221
  loop246_redo:
    .const 'Sub' $P227 = "23_1259779054.5228" 
    capture_lex $P227
    $P227($P225)
  loop246_next:
    goto loop246_test
  loop246_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, 'type'
    eq $P248, 65, loop246_next
    eq $P248, 67, loop246_redo
  loop246_done:
    pop_eh 
  for_undef_153:
  if_218_end:
.annotate "line", 65
    find_lex $P249, "$/"
    find_lex $P250, "$past"
    $P251 = $P249."!make"($P250)
.annotate "line", 54
    .return ($P251)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
.end


.namespace ["NQP";"Actions"]
.sub "_block226"  :anon :subid("23_1259779054.5228") :outer("22_1259779054.5228")
    .param pmc param_229
.annotate "line", 58
    new $P228, "Undef"
    .lex "$ast", $P228
    .lex "$_", param_229
    find_lex $P230, "$_"
    $P231 = $P230."ast"()
    store_lex "$ast", $P231
.annotate "line", 59
    find_lex $P235, "$ast"
    get_hll_global $P236, ["PAST"], "Block"
    $P237 = $P235."isa"($P236)
    if $P237, if_234
    set $P233, $P237
    goto if_234_end
  if_234:
    find_lex $P238, "$ast"
    $P239 = $P238."blocktype"()
    isfalse $I240, $P239
    new $P233, 'Integer'
    set $P233, $I240
  if_234_end:
    unless $P233, if_232_end
.annotate "line", 60
    find_lex $P241, "$ast"
    $P242 = "block_immediate"($P241)
    store_lex "$ast", $P242
  if_232_end:
.annotate "line", 62
    find_lex $P243, "$past"
    find_lex $P244, "$ast"
    $P245 = $P243."push"($P244)
.annotate "line", 57
    .return ($P245)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("24_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_256
    .param pmc param_257 :optional
    .param int has_param_257 :opt_flag
.annotate "line", 68
    .const 'Sub' $P265 = "25_1259779054.5228" 
    capture_lex $P265
    new $P255, 'ExceptionHandler'
    set_addr $P255, control_254
    $P255."handle_types"(58)
    push_eh $P255
    .lex "self", self
    .lex "$/", param_256
    if has_param_257, optparam_154
    new $P258, "Undef"
    set param_257, $P258
  optparam_154:
    .lex "$key", param_257
.annotate "line", 69
    new $P259, "Undef"
    .lex "$past", $P259
.annotate "line", 68
    find_lex $P260, "$past"
.annotate "line", 70
    find_lex $P262, "$/"
    unless_null $P262, vivify_155
    new $P262, "Hash"
  vivify_155:
    set $P263, $P262["EXPR"]
    unless_null $P263, vivify_156
    new $P263, "Undef"
  vivify_156:
    if $P263, if_261
.annotate "line", 81
    find_lex $P303, "$/"
    unless_null $P303, vivify_157
    new $P303, "Hash"
  vivify_157:
    set $P304, $P303["statement_control"]
    unless_null $P304, vivify_158
    new $P304, "Undef"
  vivify_158:
    if $P304, if_302
.annotate "line", 82
    new $P308, "Integer"
    assign $P308, 0
    store_lex "$past", $P308
    goto if_302_end
  if_302:
.annotate "line", 81
    find_lex $P305, "$/"
    unless_null $P305, vivify_159
    new $P305, "Hash"
  vivify_159:
    set $P306, $P305["statement_control"]
    unless_null $P306, vivify_160
    new $P306, "Undef"
  vivify_160:
    $P307 = $P306."ast"()
    store_lex "$past", $P307
  if_302_end:
    goto if_261_end
  if_261:
.annotate "line", 70
    .const 'Sub' $P265 = "25_1259779054.5228" 
    capture_lex $P265
    $P265()
  if_261_end:
.annotate "line", 83
    find_lex $P309, "$/"
    find_lex $P310, "$past"
    $P311 = $P309."!make"($P310)
.annotate "line", 68
    .return ($P311)
  control_254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, "payload"
    .return ($P312)
.end


.namespace ["NQP";"Actions"]
.sub "_block264"  :anon :subid("25_1259779054.5228") :outer("24_1259779054.5228")
.annotate "line", 71
    new $P266, "Undef"
    .lex "$mc", $P266
.annotate "line", 72
    new $P267, "Undef"
    .lex "$ml", $P267
.annotate "line", 71
    find_lex $P268, "$/"
    unless_null $P268, vivify_161
    new $P268, "Hash"
  vivify_161:
    set $P269, $P268["statement_mod_cond"]
    unless_null $P269, vivify_162
    new $P269, "ResizablePMCArray"
  vivify_162:
    set $P270, $P269[0]
    unless_null $P270, vivify_163
    new $P270, "Undef"
  vivify_163:
    store_lex "$mc", $P270
.annotate "line", 72
    find_lex $P271, "$/"
    unless_null $P271, vivify_164
    new $P271, "Hash"
  vivify_164:
    set $P272, $P271["statement_mod_loop"]
    unless_null $P272, vivify_165
    new $P272, "ResizablePMCArray"
  vivify_165:
    set $P273, $P272[0]
    unless_null $P273, vivify_166
    new $P273, "Undef"
  vivify_166:
    store_lex "$ml", $P273
.annotate "line", 73
    find_lex $P274, "$/"
    unless_null $P274, vivify_167
    new $P274, "Hash"
  vivify_167:
    set $P275, $P274["EXPR"]
    unless_null $P275, vivify_168
    new $P275, "Undef"
  vivify_168:
    $P276 = $P275."ast"()
    store_lex "$past", $P276
.annotate "line", 74
    find_lex $P278, "$mc"
    unless $P278, if_277_end
.annotate "line", 75
    get_hll_global $P279, ["PAST"], "Op"
    find_lex $P280, "$mc"
    unless_null $P280, vivify_169
    new $P280, "Hash"
  vivify_169:
    set $P281, $P280["cond"]
    unless_null $P281, vivify_170
    new $P281, "Undef"
  vivify_170:
    $P282 = $P281."ast"()
    find_lex $P283, "$past"
    find_lex $P284, "$mc"
    unless_null $P284, vivify_171
    new $P284, "Hash"
  vivify_171:
    set $P285, $P284["sym"]
    unless_null $P285, vivify_172
    new $P285, "Undef"
  vivify_172:
    set $S286, $P285
    find_lex $P287, "$/"
    $P288 = $P279."new"($P282, $P283, $S286 :named("pasttype"), $P287 :named("node"))
    store_lex "$past", $P288
  if_277_end:
.annotate "line", 77
    find_lex $P291, "$ml"
    if $P291, if_290
    set $P289, $P291
    goto if_290_end
  if_290:
.annotate "line", 78
    get_hll_global $P292, ["PAST"], "Op"
    find_lex $P293, "$ml"
    unless_null $P293, vivify_173
    new $P293, "Hash"
  vivify_173:
    set $P294, $P293["cond"]
    unless_null $P294, vivify_174
    new $P294, "Undef"
  vivify_174:
    $P295 = $P294."ast"()
    find_lex $P296, "$past"
    find_lex $P297, "$ml"
    unless_null $P297, vivify_175
    new $P297, "Hash"
  vivify_175:
    set $P298, $P297["sym"]
    unless_null $P298, vivify_176
    new $P298, "Undef"
  vivify_176:
    set $S299, $P298
    find_lex $P300, "$/"
    $P301 = $P292."new"($P295, $P296, $S299 :named("pasttype"), $P300 :named("node"))
    store_lex "$past", $P301
.annotate "line", 77
    set $P289, $P301
  if_290_end:
.annotate "line", 70
    .return ($P289)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("26_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_316
.annotate "line", 86
    new $P315, 'ExceptionHandler'
    set_addr $P315, control_314
    $P315."handle_types"(58)
    push_eh $P315
    .lex "self", self
    .lex "$/", param_316
.annotate "line", 87
    find_lex $P317, "$/"
    get_hll_global $P318, ["PAST"], "Op"
    find_lex $P319, "$/"
    unless_null $P319, vivify_177
    new $P319, "Hash"
  vivify_177:
    set $P320, $P319["EXPR"]
    unless_null $P320, vivify_178
    new $P320, "Undef"
  vivify_178:
    $P321 = $P320."ast"()
    find_lex $P322, "$/"
    unless_null $P322, vivify_179
    new $P322, "Hash"
  vivify_179:
    set $P323, $P322["pblock"]
    unless_null $P323, vivify_180
    new $P323, "Undef"
  vivify_180:
    $P324 = $P323."ast"()
    find_lex $P325, "$/"
    $P326 = $P318."new"($P321, $P324, "if" :named("pasttype"), $P325 :named("node"))
    $P327 = $P317."!make"($P326)
.annotate "line", 86
    .return ($P327)
  control_314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P328, exception, "payload"
    .return ($P328)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("27_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_332
.annotate "line", 90
    new $P331, 'ExceptionHandler'
    set_addr $P331, control_330
    $P331."handle_types"(58)
    push_eh $P331
    .lex "self", self
    .lex "$/", param_332
.annotate "line", 91
    find_lex $P333, "$/"
    find_lex $P334, "$/"
    unless_null $P334, vivify_181
    new $P334, "Hash"
  vivify_181:
    set $P335, $P334["blockoid"]
    unless_null $P335, vivify_182
    new $P335, "Undef"
  vivify_182:
    $P336 = $P335."ast"()
    $P337 = $P333."!make"($P336)
.annotate "line", 90
    .return ($P337)
  control_330:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, "payload"
    .return ($P338)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("28_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_342
.annotate "line", 94
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "self", self
    .lex "$/", param_342
.annotate "line", 95
    find_lex $P343, "$/"
    find_lex $P344, "$/"
    unless_null $P344, vivify_183
    new $P344, "Hash"
  vivify_183:
    set $P345, $P344["blockoid"]
    unless_null $P345, vivify_184
    new $P345, "Undef"
  vivify_184:
    $P346 = $P345."ast"()
    $P347 = $P343."!make"($P346)
.annotate "line", 94
    .return ($P347)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P348, exception, "payload"
    .return ($P348)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("29_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_352
.annotate "line", 98
    new $P351, 'ExceptionHandler'
    set_addr $P351, control_350
    $P351."handle_types"(58)
    push_eh $P351
    .lex "self", self
    .lex "$/", param_352
.annotate "line", 99
    new $P353, "Undef"
    .lex "$past", $P353
.annotate "line", 100
    new $P354, "Undef"
    .lex "$BLOCK", $P354
.annotate "line", 99
    find_lex $P355, "$/"
    unless_null $P355, vivify_185
    new $P355, "Hash"
  vivify_185:
    set $P356, $P355["statementlist"]
    unless_null $P356, vivify_186
    new $P356, "Undef"
  vivify_186:
    $P357 = $P356."ast"()
    store_lex "$past", $P357
.annotate "line", 100
    get_global $P358, "@BLOCK"
    $P359 = $P358."shift"()
    store_lex "$BLOCK", $P359
.annotate "line", 101
    find_lex $P360, "$BLOCK"
    find_lex $P361, "$past"
    $P360."push"($P361)
.annotate "line", 102
    find_lex $P362, "$BLOCK"
    find_lex $P363, "$/"
    $P362."node"($P363)
.annotate "line", 103
    find_lex $P364, "$/"
    find_lex $P365, "$BLOCK"
    $P366 = $P364."!make"($P365)
.annotate "line", 98
    .return ($P366)
  control_350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P367, exception, "payload"
    .return ($P367)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("30_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_371
.annotate "line", 106
    new $P370, 'ExceptionHandler'
    set_addr $P370, control_369
    $P370."handle_types"(58)
    push_eh $P370
    .lex "self", self
    .lex "$/", param_371
.annotate "line", 107
    get_global $P372, "@BLOCK"
    unless_null $P372, vivify_187
    new $P372, "ResizablePMCArray"
    set_global "@BLOCK", $P372
  vivify_187:
.annotate "line", 106
    get_global $P373, "@BLOCK"
.annotate "line", 108
    get_global $P374, "@BLOCK"
    get_hll_global $P375, ["PAST"], "Block"
    get_hll_global $P376, ["PAST"], "Stmts"
    $P377 = $P376."new"()
    $P378 = $P375."new"($P377)
    $P379 = $P374."unshift"($P378)
.annotate "line", 106
    .return ($P379)
  control_369:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P380, exception, "payload"
    .return ($P380)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("31_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_384
.annotate "line", 113
    .const 'Sub' $P414 = "32_1259779054.5228" 
    capture_lex $P414
    new $P383, 'ExceptionHandler'
    set_addr $P383, control_382
    $P383."handle_types"(58)
    push_eh $P383
    .lex "self", self
    .lex "$/", param_384
.annotate "line", 114
    new $P385, "Undef"
    .lex "$count", $P385
.annotate "line", 115
    new $P386, "Undef"
    .lex "$past", $P386
.annotate "line", 114
    find_lex $P387, "$/"
    unless_null $P387, vivify_188
    new $P387, "Hash"
  vivify_188:
    set $P388, $P387["xblock"]
    unless_null $P388, vivify_189
    new $P388, "Undef"
  vivify_189:
    set $N389, $P388
    new $P390, 'Float'
    set $P390, $N389
    sub $P391, $P390, 1
    store_lex "$count", $P391
.annotate "line", 115
    find_lex $P392, "$count"
    set $I393, $P392
    find_lex $P394, "$/"
    unless_null $P394, vivify_190
    new $P394, "Hash"
  vivify_190:
    set $P395, $P394["xblock"]
    unless_null $P395, vivify_191
    new $P395, "ResizablePMCArray"
  vivify_191:
    set $P396, $P395[$I393]
    unless_null $P396, vivify_192
    new $P396, "Undef"
  vivify_192:
    $P397 = $P396."ast"()
    $P398 = "xblock_immediate"($P397)
    store_lex "$past", $P398
.annotate "line", 116
    find_lex $P400, "$/"
    unless_null $P400, vivify_193
    new $P400, "Hash"
  vivify_193:
    set $P401, $P400["else"]
    unless_null $P401, vivify_194
    new $P401, "Undef"
  vivify_194:
    unless $P401, if_399_end
.annotate "line", 117
    find_lex $P402, "$past"
    find_lex $P403, "$/"
    unless_null $P403, vivify_195
    new $P403, "Hash"
  vivify_195:
    set $P404, $P403["else"]
    unless_null $P404, vivify_196
    new $P404, "ResizablePMCArray"
  vivify_196:
    set $P405, $P404[0]
    unless_null $P405, vivify_197
    new $P405, "Undef"
  vivify_197:
    $P406 = $P405."ast"()
    $P407 = "block_immediate"($P406)
    $P402."push"($P407)
  if_399_end:
.annotate "line", 120
    new $P430, 'ExceptionHandler'
    set_addr $P430, loop429_handler
    $P430."handle_types"(65, 67, 66)
    push_eh $P430
  loop429_test:
    find_lex $P408, "$count"
    set $N409, $P408
    new $P410, "Integer"
    assign $P410, 0
    set $N411, $P410
    isgt $I412, $N409, $N411
    unless $I412, loop429_done
  loop429_redo:
    .const 'Sub' $P414 = "32_1259779054.5228" 
    capture_lex $P414
    $P414()
  loop429_next:
    goto loop429_test
  loop429_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P431, exception, 'type'
    eq $P431, 65, loop429_next
    eq $P431, 67, loop429_redo
  loop429_done:
    pop_eh 
.annotate "line", 126
    find_lex $P432, "$/"
    find_lex $P433, "$past"
    $P434 = $P432."!make"($P433)
.annotate "line", 113
    .return ($P434)
  control_382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P435, exception, "payload"
    .return ($P435)
.end


.namespace ["NQP";"Actions"]
.sub "_block413"  :anon :subid("32_1259779054.5228") :outer("31_1259779054.5228")
.annotate "line", 122
    new $P415, "Undef"
    .lex "$else", $P415
.annotate "line", 120
    find_lex $P416, "$count"
    clone $P417, $P416
    dec $P416
.annotate "line", 122
    find_lex $P418, "$past"
    store_lex "$else", $P418
.annotate "line", 123
    find_lex $P419, "$count"
    set $I420, $P419
    find_lex $P421, "$/"
    unless_null $P421, vivify_198
    new $P421, "Hash"
  vivify_198:
    set $P422, $P421["xblock"]
    unless_null $P422, vivify_199
    new $P422, "ResizablePMCArray"
  vivify_199:
    set $P423, $P422[$I420]
    unless_null $P423, vivify_200
    new $P423, "Undef"
  vivify_200:
    $P424 = $P423."ast"()
    $P425 = "xblock_immediate"($P424)
    store_lex "$past", $P425
.annotate "line", 124
    find_lex $P426, "$past"
    find_lex $P427, "$else"
    $P428 = $P426."push"($P427)
.annotate "line", 120
    .return ($P428)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("33_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_439
.annotate "line", 129
    new $P438, 'ExceptionHandler'
    set_addr $P438, control_437
    $P438."handle_types"(58)
    push_eh $P438
    .lex "self", self
    .lex "$/", param_439
.annotate "line", 130
    new $P440, "Undef"
    .lex "$past", $P440
    find_lex $P441, "$/"
    unless_null $P441, vivify_201
    new $P441, "Hash"
  vivify_201:
    set $P442, $P441["xblock"]
    unless_null $P442, vivify_202
    new $P442, "Undef"
  vivify_202:
    $P443 = $P442."ast"()
    $P444 = "xblock_immediate"($P443)
    store_lex "$past", $P444
.annotate "line", 131
    find_lex $P445, "$past"
    $P445."pasttype"("unless")
.annotate "line", 132
    find_lex $P446, "$/"
    find_lex $P447, "$past"
    $P448 = $P446."!make"($P447)
.annotate "line", 129
    .return ($P448)
  control_437:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P449, exception, "payload"
    .return ($P449)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("34_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_453
.annotate "line", 135
    new $P452, 'ExceptionHandler'
    set_addr $P452, control_451
    $P452."handle_types"(58)
    push_eh $P452
    .lex "self", self
    .lex "$/", param_453
.annotate "line", 136
    new $P454, "Undef"
    .lex "$past", $P454
    find_lex $P455, "$/"
    unless_null $P455, vivify_203
    new $P455, "Hash"
  vivify_203:
    set $P456, $P455["xblock"]
    unless_null $P456, vivify_204
    new $P456, "Undef"
  vivify_204:
    $P457 = $P456."ast"()
    $P458 = "xblock_immediate"($P457)
    store_lex "$past", $P458
.annotate "line", 137
    find_lex $P459, "$past"
    find_lex $P460, "$/"
    unless_null $P460, vivify_205
    new $P460, "Hash"
  vivify_205:
    set $P461, $P460["sym"]
    unless_null $P461, vivify_206
    new $P461, "Undef"
  vivify_206:
    set $S462, $P461
    $P459."pasttype"($S462)
.annotate "line", 138
    find_lex $P463, "$/"
    find_lex $P464, "$past"
    $P465 = $P463."!make"($P464)
.annotate "line", 135
    .return ($P465)
  control_451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P466, exception, "payload"
    .return ($P466)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("35_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_470
.annotate "line", 141
    new $P469, 'ExceptionHandler'
    set_addr $P469, control_468
    $P469."handle_types"(58)
    push_eh $P469
    .lex "self", self
    .lex "$/", param_470
.annotate "line", 142
    new $P471, "Undef"
    .lex "$pasttype", $P471
.annotate "line", 143
    new $P472, "Undef"
    .lex "$past", $P472
.annotate "line", 142
    new $P473, "String"
    assign $P473, "repeat_"
    find_lex $P474, "$/"
    unless_null $P474, vivify_207
    new $P474, "Hash"
  vivify_207:
    set $P475, $P474["wu"]
    unless_null $P475, vivify_208
    new $P475, "Undef"
  vivify_208:
    set $S476, $P475
    concat $P477, $P473, $S476
    store_lex "$pasttype", $P477
    find_lex $P478, "$past"
.annotate "line", 144
    find_lex $P480, "$/"
    unless_null $P480, vivify_209
    new $P480, "Hash"
  vivify_209:
    set $P481, $P480["xblock"]
    unless_null $P481, vivify_210
    new $P481, "Undef"
  vivify_210:
    if $P481, if_479
.annotate "line", 149
    get_hll_global $P488, ["PAST"], "Op"
    find_lex $P489, "$/"
    unless_null $P489, vivify_211
    new $P489, "Hash"
  vivify_211:
    set $P490, $P489["EXPR"]
    unless_null $P490, vivify_212
    new $P490, "Undef"
  vivify_212:
    $P491 = $P490."ast"()
    find_lex $P492, "$/"
    unless_null $P492, vivify_213
    new $P492, "Hash"
  vivify_213:
    set $P493, $P492["pblock"]
    unless_null $P493, vivify_214
    new $P493, "Undef"
  vivify_214:
    $P494 = $P493."ast"()
    $P495 = "block_immediate"($P494)
    find_lex $P496, "$pasttype"
    find_lex $P497, "$/"
    $P498 = $P488."new"($P491, $P495, $P496 :named("pasttype"), $P497 :named("node"))
    store_lex "$past", $P498
.annotate "line", 148
    goto if_479_end
  if_479:
.annotate "line", 145
    find_lex $P482, "$/"
    unless_null $P482, vivify_215
    new $P482, "Hash"
  vivify_215:
    set $P483, $P482["xblock"]
    unless_null $P483, vivify_216
    new $P483, "Undef"
  vivify_216:
    $P484 = $P483."ast"()
    $P485 = "xblock_immediate"($P484)
    store_lex "$past", $P485
.annotate "line", 146
    find_lex $P486, "$past"
    find_lex $P487, "$pasttype"
    $P486."pasttype"($P487)
  if_479_end:
.annotate "line", 152
    find_lex $P499, "$/"
    find_lex $P500, "$past"
    $P501 = $P499."!make"($P500)
.annotate "line", 141
    .return ($P501)
  control_468:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P502, exception, "payload"
    .return ($P502)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("36_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_506
.annotate "line", 155
    new $P505, 'ExceptionHandler'
    set_addr $P505, control_504
    $P505."handle_types"(58)
    push_eh $P505
    .lex "self", self
    .lex "$/", param_506
.annotate "line", 156
    new $P507, "Undef"
    .lex "$past", $P507
.annotate "line", 158
    new $P508, "Undef"
    .lex "$block", $P508
.annotate "line", 156
    find_lex $P509, "$/"
    unless_null $P509, vivify_217
    new $P509, "Hash"
  vivify_217:
    set $P510, $P509["xblock"]
    unless_null $P510, vivify_218
    new $P510, "Undef"
  vivify_218:
    $P511 = $P510."ast"()
    store_lex "$past", $P511
.annotate "line", 157
    find_lex $P512, "$past"
    $P512."pasttype"("for")
.annotate "line", 158
    find_lex $P513, "$past"
    unless_null $P513, vivify_219
    new $P513, "ResizablePMCArray"
  vivify_219:
    set $P514, $P513[1]
    unless_null $P514, vivify_220
    new $P514, "Undef"
  vivify_220:
    store_lex "$block", $P514
.annotate "line", 159
    find_lex $P516, "$block"
    $P517 = $P516."arity"()
    if $P517, unless_515_end
.annotate "line", 160
    find_lex $P518, "$block"
    unless_null $P518, vivify_221
    new $P518, "ResizablePMCArray"
  vivify_221:
    set $P519, $P518[0]
    unless_null $P519, vivify_222
    new $P519, "Undef"
  vivify_222:
    get_hll_global $P520, ["PAST"], "Var"
    $P521 = $P520."new"("$_" :named("name"), "parameter" :named("scope"))
    $P519."push"($P521)
.annotate "line", 161
    find_lex $P522, "$block"
    $P522."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 162
    find_lex $P523, "$block"
    $P523."arity"(1)
  unless_515_end:
.annotate "line", 164
    find_lex $P524, "$block"
    $P524."blocktype"("immediate")
.annotate "line", 165
    find_lex $P525, "$/"
    find_lex $P526, "$past"
    $P527 = $P525."!make"($P526)
.annotate "line", 155
    .return ($P527)
  control_504:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P528, exception, "payload"
    .return ($P528)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("37_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_532
.annotate "line", 168
    new $P531, 'ExceptionHandler'
    set_addr $P531, control_530
    $P531."handle_types"(58)
    push_eh $P531
    .lex "self", self
    .lex "$/", param_532
.annotate "line", 169
    find_lex $P533, "$/"
    get_hll_global $P534, ["PAST"], "Op"
    find_lex $P535, "$/"
    unless_null $P535, vivify_223
    new $P535, "Hash"
  vivify_223:
    set $P536, $P535["EXPR"]
    unless_null $P536, vivify_224
    new $P536, "Undef"
  vivify_224:
    $P537 = $P536."ast"()
    find_lex $P538, "$/"
    $P539 = $P534."new"($P537, "return" :named("pasttype"), $P538 :named("node"))
    $P540 = $P533."!make"($P539)
.annotate "line", 168
    .return ($P540)
  control_530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P541, exception, "payload"
    .return ($P541)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("38_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_545
.annotate "line", 172
    new $P544, 'ExceptionHandler'
    set_addr $P544, control_543
    $P544."handle_types"(58)
    push_eh $P544
    .lex "self", self
    .lex "$/", param_545
.annotate "line", 173
    new $P546, "Undef"
    .lex "$block", $P546
    find_lex $P547, "$/"
    unless_null $P547, vivify_225
    new $P547, "Hash"
  vivify_225:
    set $P548, $P547["block"]
    unless_null $P548, vivify_226
    new $P548, "Undef"
  vivify_226:
    $P549 = $P548."ast"()
    store_lex "$block", $P549
.annotate "line", 174
    find_lex $P550, "$/"
    find_lex $P551, "$block"
    "push_block_handler"($P550, $P551)
.annotate "line", 175
    get_global $P552, "@BLOCK"
    unless_null $P552, vivify_227
    new $P552, "ResizablePMCArray"
  vivify_227:
    set $P553, $P552[0]
    unless_null $P553, vivify_228
    new $P553, "Undef"
  vivify_228:
    $P554 = $P553."handlers"()
    set $P555, $P554[0]
    unless_null $P555, vivify_229
    new $P555, "Undef"
  vivify_229:
    $P555."handle_types_except"("CONTROL")
.annotate "line", 176
    find_lex $P556, "$/"
    get_hll_global $P557, ["PAST"], "Stmts"
    find_lex $P558, "$/"
    $P559 = $P557."new"($P558 :named("node"))
    $P560 = $P556."!make"($P559)
.annotate "line", 172
    .return ($P560)
  control_543:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P561, exception, "payload"
    .return ($P561)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("39_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_565
.annotate "line", 179
    new $P564, 'ExceptionHandler'
    set_addr $P564, control_563
    $P564."handle_types"(58)
    push_eh $P564
    .lex "self", self
    .lex "$/", param_565
.annotate "line", 180
    new $P566, "Undef"
    .lex "$block", $P566
    find_lex $P567, "$/"
    unless_null $P567, vivify_230
    new $P567, "Hash"
  vivify_230:
    set $P568, $P567["block"]
    unless_null $P568, vivify_231
    new $P568, "Undef"
  vivify_231:
    $P569 = $P568."ast"()
    store_lex "$block", $P569
.annotate "line", 181
    find_lex $P570, "$/"
    find_lex $P571, "$block"
    "push_block_handler"($P570, $P571)
.annotate "line", 182
    get_global $P572, "@BLOCK"
    unless_null $P572, vivify_232
    new $P572, "ResizablePMCArray"
  vivify_232:
    set $P573, $P572[0]
    unless_null $P573, vivify_233
    new $P573, "Undef"
  vivify_233:
    $P574 = $P573."handlers"()
    set $P575, $P574[0]
    unless_null $P575, vivify_234
    new $P575, "Undef"
  vivify_234:
    $P575."handle_types"("CONTROL")
.annotate "line", 183
    find_lex $P576, "$/"
    get_hll_global $P577, ["PAST"], "Stmts"
    find_lex $P578, "$/"
    $P579 = $P577."new"($P578 :named("node"))
    $P580 = $P576."!make"($P579)
.annotate "line", 179
    .return ($P580)
  control_563:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P581, exception, "payload"
    .return ($P581)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("40_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_586
.annotate "line", 223
    new $P585, 'ExceptionHandler'
    set_addr $P585, control_584
    $P585."handle_types"(58)
    push_eh $P585
    .lex "self", self
    .lex "$/", param_586
.annotate "line", 224
    get_global $P587, "@BLOCK"
    unless_null $P587, vivify_235
    new $P587, "ResizablePMCArray"
  vivify_235:
    set $P588, $P587[0]
    unless_null $P588, vivify_236
    new $P588, "Undef"
  vivify_236:
    $P589 = $P588."loadinit"()
    find_lex $P590, "$/"
    unless_null $P590, vivify_237
    new $P590, "Hash"
  vivify_237:
    set $P591, $P590["blorst"]
    unless_null $P591, vivify_238
    new $P591, "Undef"
  vivify_238:
    $P592 = $P591."ast"()
    $P589."push"($P592)
.annotate "line", 225
    find_lex $P593, "$/"
    get_hll_global $P594, ["PAST"], "Stmts"
    find_lex $P595, "$/"
    $P596 = $P594."new"($P595 :named("node"))
    $P597 = $P593."!make"($P596)
.annotate "line", 223
    .return ($P597)
  control_584:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P598, exception, "payload"
    .return ($P598)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("41_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_602
.annotate "line", 228
    new $P601, 'ExceptionHandler'
    set_addr $P601, control_600
    $P601."handle_types"(58)
    push_eh $P601
    .lex "self", self
    .lex "$/", param_602
.annotate "line", 229
    new $P603, "Undef"
    .lex "$past", $P603
    find_lex $P604, "$/"
    unless_null $P604, vivify_239
    new $P604, "Hash"
  vivify_239:
    set $P605, $P604["blorst"]
    unless_null $P605, vivify_240
    new $P605, "Undef"
  vivify_240:
    $P606 = $P605."ast"()
    store_lex "$past", $P606
.annotate "line", 230
    find_lex $P608, "$past"
    $S609 = $P608."WHAT"()
    isne $I610, $S609, "PAST::Block()"
    unless $I610, if_607_end
.annotate "line", 231
    get_hll_global $P611, ["PAST"], "Block"
    find_lex $P612, "$past"
    find_lex $P613, "$/"
    $P614 = $P611."new"($P612, "immediate" :named("blocktype"), $P613 :named("node"))
    store_lex "$past", $P614
  if_607_end:
.annotate "line", 233
    find_lex $P616, "$past"
    $P617 = $P616."handlers"()
    if $P617, unless_615_end
.annotate "line", 234
    find_lex $P618, "$past"
    get_hll_global $P619, ["PAST"], "Control"
.annotate "line", 236
    get_hll_global $P620, ["PAST"], "Stmts"
.annotate "line", 237
    get_hll_global $P621, ["PAST"], "Op"
.annotate "line", 238
    get_hll_global $P622, ["PAST"], "Var"
.annotate "line", 239
    get_hll_global $P623, ["PAST"], "Var"
    $P624 = $P623."new"("register" :named("scope"), "exception" :named("name"))
    $P625 = $P622."new"($P624, "handled", "keyed" :named("scope"))
.annotate "line", 238
    $P626 = $P621."new"($P625, 1, "bind" :named("pasttype"))
.annotate "line", 237
    $P627 = $P620."new"($P626)
.annotate "line", 236
    $P628 = $P619."new"($P627, "CONTROL" :named("handle_types_except"))
.annotate "line", 234
    new $P629, "ResizablePMCArray"
    push $P629, $P628
    $P618."handlers"($P629)
  unless_615_end:
.annotate "line", 248
    find_lex $P630, "$/"
    find_lex $P631, "$past"
    $P632 = $P630."!make"($P631)
.annotate "line", 228
    .return ($P632)
  control_600:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("42_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_637
.annotate "line", 251
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(58)
    push_eh $P636
    .lex "self", self
    .lex "$/", param_637
.annotate "line", 252
    find_lex $P638, "$/"
.annotate "line", 253
    find_lex $P641, "$/"
    unless_null $P641, vivify_241
    new $P641, "Hash"
  vivify_241:
    set $P642, $P641["block"]
    unless_null $P642, vivify_242
    new $P642, "Undef"
  vivify_242:
    if $P642, if_640
.annotate "line", 254
    find_lex $P647, "$/"
    unless_null $P647, vivify_243
    new $P647, "Hash"
  vivify_243:
    set $P648, $P647["statement"]
    unless_null $P648, vivify_244
    new $P648, "Undef"
  vivify_244:
    $P649 = $P648."ast"()
    set $P639, $P649
.annotate "line", 253
    goto if_640_end
  if_640:
    find_lex $P643, "$/"
    unless_null $P643, vivify_245
    new $P643, "Hash"
  vivify_245:
    set $P644, $P643["block"]
    unless_null $P644, vivify_246
    new $P644, "Undef"
  vivify_246:
    $P645 = $P644."ast"()
    $P646 = "block_immediate"($P645)
    set $P639, $P646
  if_640_end:
    $P650 = $P638."!make"($P639)
.annotate "line", 251
    .return ($P650)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P651, exception, "payload"
    .return ($P651)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("43_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_655
.annotate "line", 259
    new $P654, 'ExceptionHandler'
    set_addr $P654, control_653
    $P654."handle_types"(58)
    push_eh $P654
    .lex "self", self
    .lex "$/", param_655
    find_lex $P656, "$/"
    find_lex $P657, "$/"
    unless_null $P657, vivify_247
    new $P657, "Hash"
  vivify_247:
    set $P658, $P657["cond"]
    unless_null $P658, vivify_248
    new $P658, "Undef"
  vivify_248:
    $P659 = $P658."ast"()
    $P660 = $P656."!make"($P659)
    .return ($P660)
  control_653:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P661, exception, "payload"
    .return ($P661)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("44_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_665
.annotate "line", 260
    new $P664, 'ExceptionHandler'
    set_addr $P664, control_663
    $P664."handle_types"(58)
    push_eh $P664
    .lex "self", self
    .lex "$/", param_665
    find_lex $P666, "$/"
    find_lex $P667, "$/"
    unless_null $P667, vivify_249
    new $P667, "Hash"
  vivify_249:
    set $P668, $P667["cond"]
    unless_null $P668, vivify_250
    new $P668, "Undef"
  vivify_250:
    $P669 = $P668."ast"()
    $P670 = $P666."!make"($P669)
    .return ($P670)
  control_663:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P671, exception, "payload"
    .return ($P671)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("45_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_675
.annotate "line", 262
    new $P674, 'ExceptionHandler'
    set_addr $P674, control_673
    $P674."handle_types"(58)
    push_eh $P674
    .lex "self", self
    .lex "$/", param_675
    find_lex $P676, "$/"
    find_lex $P677, "$/"
    unless_null $P677, vivify_251
    new $P677, "Hash"
  vivify_251:
    set $P678, $P677["cond"]
    unless_null $P678, vivify_252
    new $P678, "Undef"
  vivify_252:
    $P679 = $P678."ast"()
    $P680 = $P676."!make"($P679)
    .return ($P680)
  control_673:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P681, exception, "payload"
    .return ($P681)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("46_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_685
.annotate "line", 263
    new $P684, 'ExceptionHandler'
    set_addr $P684, control_683
    $P684."handle_types"(58)
    push_eh $P684
    .lex "self", self
    .lex "$/", param_685
    find_lex $P686, "$/"
    find_lex $P687, "$/"
    unless_null $P687, vivify_253
    new $P687, "Hash"
  vivify_253:
    set $P688, $P687["cond"]
    unless_null $P688, vivify_254
    new $P688, "Undef"
  vivify_254:
    $P689 = $P688."ast"()
    $P690 = $P686."!make"($P689)
    .return ($P690)
  control_683:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P691, exception, "payload"
    .return ($P691)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("47_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_695
.annotate "line", 267
    new $P694, 'ExceptionHandler'
    set_addr $P694, control_693
    $P694."handle_types"(58)
    push_eh $P694
    .lex "self", self
    .lex "$/", param_695
    find_lex $P696, "$/"
    find_lex $P697, "$/"
    unless_null $P697, vivify_255
    new $P697, "Hash"
  vivify_255:
    set $P698, $P697["colonpair"]
    unless_null $P698, vivify_256
    new $P698, "Undef"
  vivify_256:
    $P699 = $P698."ast"()
    $P700 = $P696."!make"($P699)
    .return ($P700)
  control_693:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P701, exception, "payload"
    .return ($P701)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("48_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_705
.annotate "line", 268
    new $P704, 'ExceptionHandler'
    set_addr $P704, control_703
    $P704."handle_types"(58)
    push_eh $P704
    .lex "self", self
    .lex "$/", param_705
    find_lex $P706, "$/"
    find_lex $P707, "$/"
    unless_null $P707, vivify_257
    new $P707, "Hash"
  vivify_257:
    set $P708, $P707["variable"]
    unless_null $P708, vivify_258
    new $P708, "Undef"
  vivify_258:
    $P709 = $P708."ast"()
    $P710 = $P706."!make"($P709)
    .return ($P710)
  control_703:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P711, exception, "payload"
    .return ($P711)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("49_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_715
.annotate "line", 269
    new $P714, 'ExceptionHandler'
    set_addr $P714, control_713
    $P714."handle_types"(58)
    push_eh $P714
    .lex "self", self
    .lex "$/", param_715
    find_lex $P716, "$/"
    find_lex $P717, "$/"
    unless_null $P717, vivify_259
    new $P717, "Hash"
  vivify_259:
    set $P718, $P717["package_declarator"]
    unless_null $P718, vivify_260
    new $P718, "Undef"
  vivify_260:
    $P719 = $P718."ast"()
    $P720 = $P716."!make"($P719)
    .return ($P720)
  control_713:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P721, exception, "payload"
    .return ($P721)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("50_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_725
.annotate "line", 270
    new $P724, 'ExceptionHandler'
    set_addr $P724, control_723
    $P724."handle_types"(58)
    push_eh $P724
    .lex "self", self
    .lex "$/", param_725
    find_lex $P726, "$/"
    find_lex $P727, "$/"
    unless_null $P727, vivify_261
    new $P727, "Hash"
  vivify_261:
    set $P728, $P727["scope_declarator"]
    unless_null $P728, vivify_262
    new $P728, "Undef"
  vivify_262:
    $P729 = $P728."ast"()
    $P730 = $P726."!make"($P729)
    .return ($P730)
  control_723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P731, exception, "payload"
    .return ($P731)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("51_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_735
.annotate "line", 271
    new $P734, 'ExceptionHandler'
    set_addr $P734, control_733
    $P734."handle_types"(58)
    push_eh $P734
    .lex "self", self
    .lex "$/", param_735
    find_lex $P736, "$/"
    find_lex $P737, "$/"
    unless_null $P737, vivify_263
    new $P737, "Hash"
  vivify_263:
    set $P738, $P737["routine_declarator"]
    unless_null $P738, vivify_264
    new $P738, "Undef"
  vivify_264:
    $P739 = $P738."ast"()
    $P740 = $P736."!make"($P739)
    .return ($P740)
  control_733:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P741, exception, "payload"
    .return ($P741)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("52_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_745
.annotate "line", 272
    new $P744, 'ExceptionHandler'
    set_addr $P744, control_743
    $P744."handle_types"(58)
    push_eh $P744
    .lex "self", self
    .lex "$/", param_745
    find_lex $P746, "$/"
    find_lex $P747, "$/"
    unless_null $P747, vivify_265
    new $P747, "Hash"
  vivify_265:
    set $P748, $P747["regex_declarator"]
    unless_null $P748, vivify_266
    new $P748, "Undef"
  vivify_266:
    $P749 = $P748."ast"()
    $P750 = $P746."!make"($P749)
    .return ($P750)
  control_743:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P751, exception, "payload"
    .return ($P751)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("53_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_755
.annotate "line", 273
    new $P754, 'ExceptionHandler'
    set_addr $P754, control_753
    $P754."handle_types"(58)
    push_eh $P754
    .lex "self", self
    .lex "$/", param_755
    find_lex $P756, "$/"
    find_lex $P757, "$/"
    unless_null $P757, vivify_267
    new $P757, "Hash"
  vivify_267:
    set $P758, $P757["statement_prefix"]
    unless_null $P758, vivify_268
    new $P758, "Undef"
  vivify_268:
    $P759 = $P758."ast"()
    $P760 = $P756."!make"($P759)
    .return ($P760)
  control_753:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P761, exception, "payload"
    .return ($P761)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("54_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_765
.annotate "line", 274
    new $P764, 'ExceptionHandler'
    set_addr $P764, control_763
    $P764."handle_types"(58)
    push_eh $P764
    .lex "self", self
    .lex "$/", param_765
    find_lex $P766, "$/"
    find_lex $P767, "$/"
    unless_null $P767, vivify_269
    new $P767, "Hash"
  vivify_269:
    set $P768, $P767["pblock"]
    unless_null $P768, vivify_270
    new $P768, "Undef"
  vivify_270:
    $P769 = $P768."ast"()
    $P770 = $P766."!make"($P769)
    .return ($P770)
  control_763:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P771, exception, "payload"
    .return ($P771)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("55_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_775
.annotate "line", 276
    new $P774, 'ExceptionHandler'
    set_addr $P774, control_773
    $P774."handle_types"(58)
    push_eh $P774
    .lex "self", self
    .lex "$/", param_775
.annotate "line", 277
    new $P776, "Undef"
    .lex "$past", $P776
.annotate "line", 278
    find_lex $P779, "$/"
    unless_null $P779, vivify_271
    new $P779, "Hash"
  vivify_271:
    set $P780, $P779["circumfix"]
    unless_null $P780, vivify_272
    new $P780, "Undef"
  vivify_272:
    if $P780, if_778
.annotate "line", 279
    get_hll_global $P785, ["PAST"], "Val"
    find_lex $P786, "$/"
    unless_null $P786, vivify_273
    new $P786, "Hash"
  vivify_273:
    set $P787, $P786["not"]
    unless_null $P787, vivify_274
    new $P787, "Undef"
  vivify_274:
    isfalse $I788, $P787
    $P789 = $P785."new"($I788 :named("value"))
    set $P777, $P789
.annotate "line", 278
    goto if_778_end
  if_778:
    find_lex $P781, "$/"
    unless_null $P781, vivify_275
    new $P781, "Hash"
  vivify_275:
    set $P782, $P781["circumfix"]
    unless_null $P782, vivify_276
    new $P782, "ResizablePMCArray"
  vivify_276:
    set $P783, $P782[0]
    unless_null $P783, vivify_277
    new $P783, "Undef"
  vivify_277:
    $P784 = $P783."ast"()
    set $P777, $P784
  if_778_end:
    store_lex "$past", $P777
.annotate "line", 280
    find_lex $P790, "$past"
    find_lex $P791, "$/"
    unless_null $P791, vivify_278
    new $P791, "Hash"
  vivify_278:
    set $P792, $P791["identifier"]
    unless_null $P792, vivify_279
    new $P792, "Undef"
  vivify_279:
    set $S793, $P792
    $P790."named"($S793)
.annotate "line", 281
    find_lex $P794, "$/"
    find_lex $P795, "$past"
    $P796 = $P794."!make"($P795)
.annotate "line", 276
    .return ($P796)
  control_773:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P797, exception, "payload"
    .return ($P797)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("56_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_801
.annotate "line", 284
    .const 'Sub' $P814 = "57_1259779054.5228" 
    capture_lex $P814
    new $P800, 'ExceptionHandler'
    set_addr $P800, control_799
    $P800."handle_types"(58)
    push_eh $P800
    .lex "self", self
    .lex "$/", param_801
.annotate "line", 285
    new $P802, "Undef"
    .lex "$past", $P802
.annotate "line", 284
    find_lex $P803, "$past"
.annotate "line", 286
    find_lex $P805, "$/"
    unless_null $P805, vivify_280
    new $P805, "Hash"
  vivify_280:
    set $P806, $P805["postcircumfix"]
    unless_null $P806, vivify_281
    new $P806, "Undef"
  vivify_281:
    if $P806, if_804
.annotate "line", 290
    .const 'Sub' $P814 = "57_1259779054.5228" 
    capture_lex $P814
    $P814()
    goto if_804_end
  if_804:
.annotate "line", 287
    find_lex $P807, "$/"
    unless_null $P807, vivify_298
    new $P807, "Hash"
  vivify_298:
    set $P808, $P807["postcircumfix"]
    unless_null $P808, vivify_299
    new $P808, "Undef"
  vivify_299:
    $P809 = $P808."ast"()
    store_lex "$past", $P809
.annotate "line", 288
    find_lex $P810, "$past"
    get_hll_global $P811, ["PAST"], "Var"
    $P812 = $P811."new"("$/" :named("name"))
    $P810."unshift"($P812)
  if_804_end:
.annotate "line", 319
    find_lex $P883, "$/"
    find_lex $P884, "$past"
    $P885 = $P883."!make"($P884)
.annotate "line", 284
    .return ($P885)
  control_799:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
.end


.namespace ["NQP";"Actions"]
.sub "_block813"  :anon :subid("57_1259779054.5228") :outer("56_1259779054.5228")
.annotate "line", 291
    new $P815, "ResizablePMCArray"
    .lex "@name", $P815
    get_hll_global $P816, ["NQP"], "Compiler"
    find_lex $P817, "$/"
    set $S818, $P817
    $P819 = $P816."parse_name"($S818)
    store_lex "@name", $P819
.annotate "line", 292
    get_hll_global $P820, ["PAST"], "Var"
    find_lex $P821, "@name"
    $P822 = $P821."pop"()
    set $S823, $P822
    $P824 = $P820."new"($S823 :named("name"))
    store_lex "$past", $P824
.annotate "line", 293
    find_lex $P826, "@name"
    unless $P826, if_825_end
.annotate "line", 294
    find_lex $P828, "@name"
    unless_null $P828, vivify_282
    new $P828, "ResizablePMCArray"
  vivify_282:
    set $P829, $P828[0]
    unless_null $P829, vivify_283
    new $P829, "Undef"
  vivify_283:
    set $S830, $P829
    iseq $I831, $S830, "GLOBAL"
    unless $I831, if_827_end
    find_lex $P832, "@name"
    $P832."shift"()
  if_827_end:
.annotate "line", 295
    find_lex $P833, "$past"
    find_lex $P834, "@name"
    $P833."namespace"($P834)
.annotate "line", 296
    find_lex $P835, "$past"
    $P835."scope"("package")
.annotate "line", 297
    find_lex $P836, "$past"
    find_lex $P837, "$/"
    unless_null $P837, vivify_284
    new $P837, "Hash"
  vivify_284:
    set $P838, $P837["sigil"]
    unless_null $P838, vivify_285
    new $P838, "Undef"
  vivify_285:
    $P839 = "sigiltype"($P838)
    $P836."viviself"($P839)
.annotate "line", 298
    find_lex $P840, "$past"
    $P840."lvalue"(1)
  if_825_end:
.annotate "line", 300
    find_lex $P843, "$/"
    unless_null $P843, vivify_286
    new $P843, "Hash"
  vivify_286:
    set $P844, $P843["twigil"]
    unless_null $P844, vivify_287
    new $P844, "ResizablePMCArray"
  vivify_287:
    set $P845, $P844[0]
    unless_null $P845, vivify_288
    new $P845, "Undef"
  vivify_288:
    set $S846, $P845
    iseq $I847, $S846, "*"
    if $I847, if_842
.annotate "line", 313
    find_lex $P869, "$/"
    unless_null $P869, vivify_289
    new $P869, "Hash"
  vivify_289:
    set $P870, $P869["twigil"]
    unless_null $P870, vivify_290
    new $P870, "ResizablePMCArray"
  vivify_290:
    set $P871, $P870[0]
    unless_null $P871, vivify_291
    new $P871, "Undef"
  vivify_291:
    set $S872, $P871
    iseq $I873, $S872, "!"
    if $I873, if_868
    new $P867, 'Integer'
    set $P867, $I873
    goto if_868_end
  if_868:
.annotate "line", 314
    find_lex $P874, "$past"
    get_hll_global $P875, ["PAST"], "Var"
    $P876 = $P875."new"("self" :named("name"))
    $P874."push"($P876)
.annotate "line", 315
    find_lex $P877, "$past"
    $P877."scope"("attribute")
.annotate "line", 316
    find_lex $P878, "$past"
    find_lex $P879, "$/"
    unless_null $P879, vivify_292
    new $P879, "Hash"
  vivify_292:
    set $P880, $P879["sigil"]
    unless_null $P880, vivify_293
    new $P880, "Undef"
  vivify_293:
    $P881 = "sigiltype"($P880)
    $P882 = $P878."viviself"($P881)
.annotate "line", 313
    set $P867, $P882
  if_868_end:
    set $P841, $P867
.annotate "line", 300
    goto if_842_end
  if_842:
.annotate "line", 301
    find_lex $P848, "$past"
    $P848."scope"("contextual")
.annotate "line", 302
    find_lex $P849, "$past"
.annotate "line", 303
    get_hll_global $P850, ["PAST"], "Var"
.annotate "line", 305
    find_lex $P851, "$/"
    unless_null $P851, vivify_294
    new $P851, "Hash"
  vivify_294:
    set $P852, $P851["sigil"]
    unless_null $P852, vivify_295
    new $P852, "Undef"
  vivify_295:
    set $S853, $P852
    new $P854, 'String'
    set $P854, $S853
    find_lex $P855, "$/"
    unless_null $P855, vivify_296
    new $P855, "Hash"
  vivify_296:
    set $P856, $P855["desigilname"]
    unless_null $P856, vivify_297
    new $P856, "Undef"
  vivify_297:
    concat $P857, $P854, $P856
.annotate "line", 307
    get_hll_global $P858, ["PAST"], "Op"
    new $P859, "String"
    assign $P859, "Contextual "
    find_lex $P860, "$/"
    set $S861, $P860
    concat $P862, $P859, $S861
    concat $P863, $P862, " not found"
    $P864 = $P858."new"($P863, "die" :named("pirop"))
    $P865 = $P850."new"("package" :named("scope"), "" :named("namespace"), $P857 :named("name"), $P864 :named("viviself"))
.annotate "line", 303
    $P866 = $P849."viviself"($P865)
.annotate "line", 300
    set $P841, $P866
  if_842_end:
.annotate "line", 290
    .return ($P841)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("58_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_890
.annotate "line", 322
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(58)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
    find_lex $P891, "$/"
    find_lex $P892, "$/"
    unless_null $P892, vivify_300
    new $P892, "Hash"
  vivify_300:
    set $P893, $P892["package_def"]
    unless_null $P893, vivify_301
    new $P893, "Undef"
  vivify_301:
    $P894 = $P893."ast"()
    $P895 = $P891."!make"($P894)
    .return ($P895)
  control_888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P896, exception, "payload"
    .return ($P896)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("59_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_900
.annotate "line", 323
    new $P899, 'ExceptionHandler'
    set_addr $P899, control_898
    $P899."handle_types"(58)
    push_eh $P899
    .lex "self", self
    .lex "$/", param_900
.annotate "line", 324
    new $P901, "Undef"
    .lex "$past", $P901
.annotate "line", 325
    new $P902, "Undef"
    .lex "$classinit", $P902
.annotate "line", 334
    new $P903, "Undef"
    .lex "$parent", $P903
.annotate "line", 324
    find_lex $P904, "$/"
    unless_null $P904, vivify_302
    new $P904, "Hash"
  vivify_302:
    set $P905, $P904["package_def"]
    unless_null $P905, vivify_303
    new $P905, "Undef"
  vivify_303:
    $P906 = $P905."ast"()
    store_lex "$past", $P906
.annotate "line", 326
    get_hll_global $P907, ["PAST"], "Op"
.annotate "line", 327
    get_hll_global $P908, ["PAST"], "Op"
    $P909 = $P908."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 330
    find_lex $P910, "$/"
    unless_null $P910, vivify_304
    new $P910, "Hash"
  vivify_304:
    set $P911, $P910["package_def"]
    unless_null $P911, vivify_305
    new $P911, "Hash"
  vivify_305:
    set $P912, $P911["name"]
    unless_null $P912, vivify_306
    new $P912, "Undef"
  vivify_306:
    set $S913, $P912
    $P914 = $P907."new"($P909, $S913, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 326
    store_lex "$classinit", $P914
.annotate "line", 334
    find_lex $P917, "$/"
    unless_null $P917, vivify_307
    new $P917, "Hash"
  vivify_307:
    set $P918, $P917["package_def"]
    unless_null $P918, vivify_308
    new $P918, "Hash"
  vivify_308:
    set $P919, $P918["parent"]
    unless_null $P919, vivify_309
    new $P919, "ResizablePMCArray"
  vivify_309:
    set $P920, $P919[0]
    unless_null $P920, vivify_310
    new $P920, "Undef"
  vivify_310:
    set $S921, $P920
    unless $S921, unless_916
    new $P915, 'String'
    set $P915, $S921
    goto unless_916_end
  unless_916:
.annotate "line", 335
    find_lex $P924, "$/"
    unless_null $P924, vivify_311
    new $P924, "Hash"
  vivify_311:
    set $P925, $P924["sym"]
    unless_null $P925, vivify_312
    new $P925, "Undef"
  vivify_312:
    set $S926, $P925
    iseq $I927, $S926, "grammar"
    if $I927, if_923
    new $P929, "String"
    assign $P929, ""
    set $P922, $P929
    goto if_923_end
  if_923:
    new $P928, "String"
    assign $P928, "Regex::Cursor"
    set $P922, $P928
  if_923_end:
    set $P915, $P922
  unless_916_end:
    store_lex "$parent", $P915
.annotate "line", 336
    find_lex $P931, "$parent"
    unless $P931, if_930_end
.annotate "line", 337
    find_lex $P932, "$classinit"
    get_hll_global $P933, ["PAST"], "Val"
    find_lex $P934, "$parent"
    $P935 = $P933."new"($P934 :named("value"), "parent" :named("named"))
    $P932."push"($P935)
  if_930_end:
.annotate "line", 339
    find_lex $P937, "$past"
    unless_null $P937, vivify_313
    new $P937, "Hash"
  vivify_313:
    set $P938, $P937["attributes"]
    unless_null $P938, vivify_314
    new $P938, "Undef"
  vivify_314:
    unless $P938, if_936_end
.annotate "line", 340
    find_lex $P939, "$classinit"
    find_lex $P940, "$past"
    unless_null $P940, vivify_315
    new $P940, "Hash"
  vivify_315:
    set $P941, $P940["attributes"]
    unless_null $P941, vivify_316
    new $P941, "Undef"
  vivify_316:
    $P939."push"($P941)
  if_936_end:
.annotate "line", 342
    get_global $P942, "@BLOCK"
    unless_null $P942, vivify_317
    new $P942, "ResizablePMCArray"
  vivify_317:
    set $P943, $P942[0]
    unless_null $P943, vivify_318
    new $P943, "Undef"
  vivify_318:
    $P944 = $P943."loadinit"()
    find_lex $P945, "$classinit"
    $P944."push"($P945)
.annotate "line", 343
    find_lex $P946, "$/"
    find_lex $P947, "$past"
    $P948 = $P946."!make"($P947)
.annotate "line", 323
    .return ($P948)
  control_898:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P949, exception, "payload"
    .return ($P949)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("60_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_953
.annotate "line", 346
    new $P952, 'ExceptionHandler'
    set_addr $P952, control_951
    $P952."handle_types"(58)
    push_eh $P952
    .lex "self", self
    .lex "$/", param_953
.annotate "line", 347
    new $P954, "Undef"
    .lex "$past", $P954
    find_lex $P957, "$/"
    unless_null $P957, vivify_319
    new $P957, "Hash"
  vivify_319:
    set $P958, $P957["block"]
    unless_null $P958, vivify_320
    new $P958, "Undef"
  vivify_320:
    if $P958, if_956
    find_lex $P962, "$/"
    unless_null $P962, vivify_321
    new $P962, "Hash"
  vivify_321:
    set $P963, $P962["comp_unit"]
    unless_null $P963, vivify_322
    new $P963, "Undef"
  vivify_322:
    $P964 = $P963."ast"()
    set $P955, $P964
    goto if_956_end
  if_956:
    find_lex $P959, "$/"
    unless_null $P959, vivify_323
    new $P959, "Hash"
  vivify_323:
    set $P960, $P959["block"]
    unless_null $P960, vivify_324
    new $P960, "Undef"
  vivify_324:
    $P961 = $P960."ast"()
    set $P955, $P961
  if_956_end:
    store_lex "$past", $P955
.annotate "line", 348
    find_lex $P965, "$past"
    find_lex $P966, "$/"
    unless_null $P966, vivify_325
    new $P966, "Hash"
  vivify_325:
    set $P967, $P966["name"]
    unless_null $P967, vivify_326
    new $P967, "Hash"
  vivify_326:
    set $P968, $P967["identifier"]
    unless_null $P968, vivify_327
    new $P968, "Undef"
  vivify_327:
    $P965."namespace"($P968)
.annotate "line", 349
    find_lex $P969, "$past"
    $P969."blocktype"("immediate")
.annotate "line", 350
    find_lex $P970, "$/"
    find_lex $P971, "$past"
    $P972 = $P970."!make"($P971)
.annotate "line", 346
    .return ($P972)
  control_951:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P973, exception, "payload"
    .return ($P973)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("61_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_977
.annotate "line", 353
    new $P976, 'ExceptionHandler'
    set_addr $P976, control_975
    $P976."handle_types"(58)
    push_eh $P976
    .lex "self", self
    .lex "$/", param_977
    find_lex $P978, "$/"
    find_lex $P979, "$/"
    unless_null $P979, vivify_328
    new $P979, "Hash"
  vivify_328:
    set $P980, $P979["scoped"]
    unless_null $P980, vivify_329
    new $P980, "Undef"
  vivify_329:
    $P981 = $P980."ast"()
    $P982 = $P978."!make"($P981)
    .return ($P982)
  control_975:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P983, exception, "payload"
    .return ($P983)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("62_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_987
.annotate "line", 354
    new $P986, 'ExceptionHandler'
    set_addr $P986, control_985
    $P986."handle_types"(58)
    push_eh $P986
    .lex "self", self
    .lex "$/", param_987
    find_lex $P988, "$/"
    find_lex $P989, "$/"
    unless_null $P989, vivify_330
    new $P989, "Hash"
  vivify_330:
    set $P990, $P989["scoped"]
    unless_null $P990, vivify_331
    new $P990, "Undef"
  vivify_331:
    $P991 = $P990."ast"()
    $P992 = $P988."!make"($P991)
    .return ($P992)
  control_985:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P993, exception, "payload"
    .return ($P993)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("63_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_997
.annotate "line", 355
    new $P996, 'ExceptionHandler'
    set_addr $P996, control_995
    $P996."handle_types"(58)
    push_eh $P996
    .lex "self", self
    .lex "$/", param_997
    find_lex $P998, "$/"
    find_lex $P999, "$/"
    unless_null $P999, vivify_332
    new $P999, "Hash"
  vivify_332:
    set $P1000, $P999["scoped"]
    unless_null $P1000, vivify_333
    new $P1000, "Undef"
  vivify_333:
    $P1001 = $P1000."ast"()
    $P1002 = $P998."!make"($P1001)
    .return ($P1002)
  control_995:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1003, exception, "payload"
    .return ($P1003)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("64_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1007
.annotate "line", 357
    new $P1006, 'ExceptionHandler'
    set_addr $P1006, control_1005
    $P1006."handle_types"(58)
    push_eh $P1006
    .lex "self", self
    .lex "$/", param_1007
.annotate "line", 358
    find_lex $P1008, "$/"
.annotate "line", 359
    find_lex $P1011, "$/"
    unless_null $P1011, vivify_334
    new $P1011, "Hash"
  vivify_334:
    set $P1012, $P1011["routine_declarator"]
    unless_null $P1012, vivify_335
    new $P1012, "Undef"
  vivify_335:
    if $P1012, if_1010
.annotate "line", 360
    find_lex $P1016, "$/"
    unless_null $P1016, vivify_336
    new $P1016, "Hash"
  vivify_336:
    set $P1017, $P1016["variable_declarator"]
    unless_null $P1017, vivify_337
    new $P1017, "Undef"
  vivify_337:
    $P1018 = $P1017."ast"()
    set $P1009, $P1018
.annotate "line", 359
    goto if_1010_end
  if_1010:
    find_lex $P1013, "$/"
    unless_null $P1013, vivify_338
    new $P1013, "Hash"
  vivify_338:
    set $P1014, $P1013["routine_declarator"]
    unless_null $P1014, vivify_339
    new $P1014, "Undef"
  vivify_339:
    $P1015 = $P1014."ast"()
    set $P1009, $P1015
  if_1010_end:
    $P1019 = $P1008."!make"($P1009)
.annotate "line", 357
    .return ($P1019)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1020, exception, "payload"
    .return ($P1020)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("65_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1024
.annotate "line", 363
    .const 'Sub' $P1064 = "66_1259779054.5228" 
    capture_lex $P1064
    new $P1023, 'ExceptionHandler'
    set_addr $P1023, control_1022
    $P1023."handle_types"(58)
    push_eh $P1023
    .lex "self", self
    .lex "$/", param_1024
.annotate "line", 364
    new $P1025, "Undef"
    .lex "$past", $P1025
.annotate "line", 365
    new $P1026, "Undef"
    .lex "$sigil", $P1026
.annotate "line", 366
    new $P1027, "Undef"
    .lex "$name", $P1027
.annotate "line", 367
    new $P1028, "Undef"
    .lex "$BLOCK", $P1028
.annotate "line", 364
    find_lex $P1029, "$/"
    unless_null $P1029, vivify_340
    new $P1029, "Hash"
  vivify_340:
    set $P1030, $P1029["variable"]
    unless_null $P1030, vivify_341
    new $P1030, "Undef"
  vivify_341:
    $P1031 = $P1030."ast"()
    store_lex "$past", $P1031
.annotate "line", 365
    find_lex $P1032, "$/"
    unless_null $P1032, vivify_342
    new $P1032, "Hash"
  vivify_342:
    set $P1033, $P1032["variable"]
    unless_null $P1033, vivify_343
    new $P1033, "Hash"
  vivify_343:
    set $P1034, $P1033["sigil"]
    unless_null $P1034, vivify_344
    new $P1034, "Undef"
  vivify_344:
    store_lex "$sigil", $P1034
.annotate "line", 366
    find_lex $P1035, "$past"
    $P1036 = $P1035."name"()
    store_lex "$name", $P1036
.annotate "line", 367
    get_global $P1037, "@BLOCK"
    unless_null $P1037, vivify_345
    new $P1037, "ResizablePMCArray"
  vivify_345:
    set $P1038, $P1037[0]
    unless_null $P1038, vivify_346
    new $P1038, "Undef"
  vivify_346:
    store_lex "$BLOCK", $P1038
.annotate "line", 368
    find_lex $P1040, "$BLOCK"
    find_lex $P1041, "$name"
    $P1042 = $P1040."symbol"($P1041)
    unless $P1042, if_1039_end
.annotate "line", 369
    find_lex $P1043, "$/"
    $P1044 = $P1043."CURSOR"()
    find_lex $P1045, "$name"
    $P1044."panic"("Redeclaration of symbol ", $P1045)
  if_1039_end:
.annotate "line", 371
    find_dynamic_lex $P1047, "$*SCOPE"
    unless_null $P1047, vivify_347
    get_hll_global $P1047, "$SCOPE"
    unless_null $P1047, vivify_348
    die "Contextual $*SCOPE not found"
  vivify_348:
  vivify_347:
    set $S1048, $P1047
    iseq $I1049, $S1048, "has"
    if $I1049, if_1046
.annotate "line", 380
    .const 'Sub' $P1064 = "66_1259779054.5228" 
    capture_lex $P1064
    $P1064()
    goto if_1046_end
  if_1046:
.annotate "line", 372
    find_lex $P1050, "$BLOCK"
    find_lex $P1051, "$name"
    $P1050."symbol"($P1051, "attribute" :named("scope"))
.annotate "line", 373
    find_lex $P1053, "$BLOCK"
    unless_null $P1053, vivify_353
    new $P1053, "Hash"
  vivify_353:
    set $P1054, $P1053["attributes"]
    unless_null $P1054, vivify_354
    new $P1054, "Undef"
  vivify_354:
    if $P1054, unless_1052_end
.annotate "line", 375
    get_hll_global $P1055, ["PAST"], "Op"
    $P1056 = $P1055."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1057, "$BLOCK"
    unless_null $P1057, vivify_355
    new $P1057, "Hash"
    store_lex "$BLOCK", $P1057
  vivify_355:
    set $P1057["attributes"], $P1056
  unless_1052_end:
.annotate "line", 377
    find_lex $P1058, "$BLOCK"
    unless_null $P1058, vivify_356
    new $P1058, "Hash"
  vivify_356:
    set $P1059, $P1058["attributes"]
    unless_null $P1059, vivify_357
    new $P1059, "Undef"
  vivify_357:
    find_lex $P1060, "$name"
    $P1059."push"($P1060)
.annotate "line", 378
    get_hll_global $P1061, ["PAST"], "Stmts"
    $P1062 = $P1061."new"()
    store_lex "$past", $P1062
  if_1046_end:
.annotate "line", 388
    find_lex $P1088, "$/"
    find_lex $P1089, "$past"
    $P1090 = $P1088."!make"($P1089)
.annotate "line", 363
    .return ($P1090)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1091, exception, "payload"
    .return ($P1091)
.end


.namespace ["NQP";"Actions"]
.sub "_block1063"  :anon :subid("66_1259779054.5228") :outer("65_1259779054.5228")
.annotate "line", 381
    new $P1065, "Undef"
    .lex "$scope", $P1065
.annotate "line", 382
    new $P1066, "Undef"
    .lex "$decl", $P1066
.annotate "line", 381
    find_dynamic_lex $P1069, "$*SCOPE"
    unless_null $P1069, vivify_349
    get_hll_global $P1069, "$SCOPE"
    unless_null $P1069, vivify_350
    die "Contextual $*SCOPE not found"
  vivify_350:
  vivify_349:
    set $S1070, $P1069
    iseq $I1071, $S1070, "our"
    if $I1071, if_1068
    new $P1073, "String"
    assign $P1073, "lexical"
    set $P1067, $P1073
    goto if_1068_end
  if_1068:
    new $P1072, "String"
    assign $P1072, "package"
    set $P1067, $P1072
  if_1068_end:
    store_lex "$scope", $P1067
.annotate "line", 382
    get_hll_global $P1074, ["PAST"], "Var"
    find_lex $P1075, "$name"
    find_lex $P1076, "$scope"
.annotate "line", 383
    find_lex $P1077, "$sigil"
    $P1078 = "sigiltype"($P1077)
    find_lex $P1079, "$/"
    $P1080 = $P1074."new"($P1075 :named("name"), $P1076 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1078 :named("viviself"), $P1079 :named("node"))
.annotate "line", 382
    store_lex "$decl", $P1080
.annotate "line", 385
    find_lex $P1081, "$BLOCK"
    find_lex $P1082, "$name"
    find_lex $P1083, "$scope"
    $P1081."symbol"($P1082, $P1083 :named("scope"))
.annotate "line", 386
    find_lex $P1084, "$BLOCK"
    unless_null $P1084, vivify_351
    new $P1084, "ResizablePMCArray"
  vivify_351:
    set $P1085, $P1084[0]
    unless_null $P1085, vivify_352
    new $P1085, "Undef"
  vivify_352:
    find_lex $P1086, "$decl"
    $P1087 = $P1085."push"($P1086)
.annotate "line", 380
    .return ($P1087)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("67_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1095
.annotate "line", 391
    new $P1094, 'ExceptionHandler'
    set_addr $P1094, control_1093
    $P1094."handle_types"(58)
    push_eh $P1094
    .lex "self", self
    .lex "$/", param_1095
    find_lex $P1096, "$/"
    find_lex $P1097, "$/"
    unless_null $P1097, vivify_358
    new $P1097, "Hash"
  vivify_358:
    set $P1098, $P1097["routine_def"]
    unless_null $P1098, vivify_359
    new $P1098, "Undef"
  vivify_359:
    $P1099 = $P1098."ast"()
    $P1100 = $P1096."!make"($P1099)
    .return ($P1100)
  control_1093:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1101, exception, "payload"
    .return ($P1101)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("68_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1105
.annotate "line", 392
    new $P1104, 'ExceptionHandler'
    set_addr $P1104, control_1103
    $P1104."handle_types"(58)
    push_eh $P1104
    .lex "self", self
    .lex "$/", param_1105
    find_lex $P1106, "$/"
    find_lex $P1107, "$/"
    unless_null $P1107, vivify_360
    new $P1107, "Hash"
  vivify_360:
    set $P1108, $P1107["method_def"]
    unless_null $P1108, vivify_361
    new $P1108, "Undef"
  vivify_361:
    $P1109 = $P1108."ast"()
    $P1110 = $P1106."!make"($P1109)
    .return ($P1110)
  control_1103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1111, exception, "payload"
    .return ($P1111)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("69_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1115
.annotate "line", 394
    .const 'Sub' $P1126 = "70_1259779054.5228" 
    capture_lex $P1126
    new $P1114, 'ExceptionHandler'
    set_addr $P1114, control_1113
    $P1114."handle_types"(58)
    push_eh $P1114
    .lex "self", self
    .lex "$/", param_1115
.annotate "line", 395
    new $P1116, "Undef"
    .lex "$past", $P1116
    find_lex $P1117, "$/"
    unless_null $P1117, vivify_362
    new $P1117, "Hash"
  vivify_362:
    set $P1118, $P1117["blockoid"]
    unless_null $P1118, vivify_363
    new $P1118, "Undef"
  vivify_363:
    $P1119 = $P1118."ast"()
    store_lex "$past", $P1119
.annotate "line", 396
    find_lex $P1120, "$past"
    $P1120."blocktype"("declaration")
.annotate "line", 397
    find_lex $P1121, "$past"
    $P1121."control"("return_pir")
.annotate "line", 398
    find_lex $P1123, "$/"
    unless_null $P1123, vivify_364
    new $P1123, "Hash"
  vivify_364:
    set $P1124, $P1123["deflongname"]
    unless_null $P1124, vivify_365
    new $P1124, "Undef"
  vivify_365:
    unless $P1124, if_1122_end
    .const 'Sub' $P1126 = "70_1259779054.5228" 
    capture_lex $P1126
    $P1126()
  if_1122_end:
.annotate "line", 408
    find_lex $P1158, "$/"
    find_lex $P1159, "$past"
    $P1160 = $P1158."!make"($P1159)
.annotate "line", 394
    .return ($P1160)
  control_1113:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.namespace ["NQP";"Actions"]
.sub "_block1125"  :anon :subid("70_1259779054.5228") :outer("69_1259779054.5228")
.annotate "line", 399
    new $P1127, "Undef"
    .lex "$name", $P1127
    find_lex $P1128, "$/"
    unless_null $P1128, vivify_366
    new $P1128, "Hash"
  vivify_366:
    set $P1129, $P1128["sigil"]
    unless_null $P1129, vivify_367
    new $P1129, "ResizablePMCArray"
  vivify_367:
    set $P1130, $P1129[0]
    unless_null $P1130, vivify_368
    new $P1130, "Undef"
  vivify_368:
    set $S1131, $P1130
    new $P1132, 'String'
    set $P1132, $S1131
    find_lex $P1133, "$/"
    unless_null $P1133, vivify_369
    new $P1133, "Hash"
  vivify_369:
    set $P1134, $P1133["deflongname"]
    unless_null $P1134, vivify_370
    new $P1134, "ResizablePMCArray"
  vivify_370:
    set $P1135, $P1134[0]
    unless_null $P1135, vivify_371
    new $P1135, "Undef"
  vivify_371:
    $S1136 = $P1135."ast"()
    concat $P1137, $P1132, $S1136
    store_lex "$name", $P1137
.annotate "line", 400
    find_lex $P1138, "$past"
    find_lex $P1139, "$name"
    $P1138."name"($P1139)
.annotate "line", 401
    find_dynamic_lex $P1142, "$*SCOPE"
    unless_null $P1142, vivify_372
    get_hll_global $P1142, "$SCOPE"
    unless_null $P1142, vivify_373
    die "Contextual $*SCOPE not found"
  vivify_373:
  vivify_372:
    set $S1143, $P1142
    isne $I1144, $S1143, "our"
    if $I1144, if_1141
    new $P1140, 'Integer'
    set $P1140, $I1144
    goto if_1141_end
  if_1141:
.annotate "line", 402
    get_global $P1145, "@BLOCK"
    unless_null $P1145, vivify_374
    new $P1145, "ResizablePMCArray"
  vivify_374:
    set $P1146, $P1145[0]
    unless_null $P1146, vivify_375
    new $P1146, "ResizablePMCArray"
  vivify_375:
    set $P1147, $P1146[0]
    unless_null $P1147, vivify_376
    new $P1147, "Undef"
  vivify_376:
    get_hll_global $P1148, ["PAST"], "Var"
    find_lex $P1149, "$name"
    find_lex $P1150, "$past"
    $P1151 = $P1148."new"($P1149 :named("name"), 1 :named("isdecl"), $P1150 :named("viviself"), "lexical" :named("scope"))
    $P1147."push"($P1151)
.annotate "line", 404
    get_global $P1152, "@BLOCK"
    unless_null $P1152, vivify_377
    new $P1152, "ResizablePMCArray"
  vivify_377:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_378
    new $P1153, "Undef"
  vivify_378:
    find_lex $P1154, "$name"
    $P1153."symbol"($P1154, "lexical" :named("scope"))
.annotate "line", 405
    get_hll_global $P1155, ["PAST"], "Var"
    find_lex $P1156, "$name"
    $P1157 = $P1155."new"($P1156 :named("name"))
    store_lex "$past", $P1157
.annotate "line", 401
    set $P1140, $P1157
  if_1141_end:
.annotate "line", 398
    .return ($P1140)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("71_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1165
.annotate "line", 412
    .const 'Sub' $P1181 = "72_1259779054.5228" 
    capture_lex $P1181
    new $P1164, 'ExceptionHandler'
    set_addr $P1164, control_1163
    $P1164."handle_types"(58)
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate "line", 413
    new $P1166, "Undef"
    .lex "$past", $P1166
    find_lex $P1167, "$/"
    unless_null $P1167, vivify_379
    new $P1167, "Hash"
  vivify_379:
    set $P1168, $P1167["blockoid"]
    unless_null $P1168, vivify_380
    new $P1168, "Undef"
  vivify_380:
    $P1169 = $P1168."ast"()
    store_lex "$past", $P1169
.annotate "line", 414
    find_lex $P1170, "$past"
    $P1170."blocktype"("method")
.annotate "line", 415
    find_lex $P1171, "$past"
    $P1171."control"("return_pir")
.annotate "line", 416
    find_lex $P1172, "$past"
    unless_null $P1172, vivify_381
    new $P1172, "ResizablePMCArray"
  vivify_381:
    set $P1173, $P1172[0]
    unless_null $P1173, vivify_382
    new $P1173, "Undef"
  vivify_382:
    get_hll_global $P1174, ["PAST"], "Op"
    $P1175 = $P1174."new"("    .lex \"self\", self" :named("inline"))
    $P1173."unshift"($P1175)
.annotate "line", 417
    find_lex $P1176, "$past"
    $P1176."symbol"("self", "lexical" :named("scope"))
.annotate "line", 418
    find_lex $P1178, "$/"
    unless_null $P1178, vivify_383
    new $P1178, "Hash"
  vivify_383:
    set $P1179, $P1178["deflongname"]
    unless_null $P1179, vivify_384
    new $P1179, "Undef"
  vivify_384:
    unless $P1179, if_1177_end
    .const 'Sub' $P1181 = "72_1259779054.5228" 
    capture_lex $P1181
    $P1181()
  if_1177_end:
.annotate "line", 422
    find_lex $P1192, "$/"
    find_lex $P1193, "$past"
    $P1194 = $P1192."!make"($P1193)
.annotate "line", 412
    .return ($P1194)
  control_1163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1195, exception, "payload"
    .return ($P1195)
.end


.namespace ["NQP";"Actions"]
.sub "_block1180"  :anon :subid("72_1259779054.5228") :outer("71_1259779054.5228")
.annotate "line", 419
    new $P1182, "Undef"
    .lex "$name", $P1182
    find_lex $P1183, "$/"
    unless_null $P1183, vivify_385
    new $P1183, "Hash"
  vivify_385:
    set $P1184, $P1183["deflongname"]
    unless_null $P1184, vivify_386
    new $P1184, "ResizablePMCArray"
  vivify_386:
    set $P1185, $P1184[0]
    unless_null $P1185, vivify_387
    new $P1185, "Undef"
  vivify_387:
    $P1186 = $P1185."ast"()
    set $S1187, $P1186
    new $P1188, 'String'
    set $P1188, $S1187
    store_lex "$name", $P1188
.annotate "line", 420
    find_lex $P1189, "$past"
    find_lex $P1190, "$name"
    $P1191 = $P1189."name"($P1190)
.annotate "line", 418
    .return ($P1191)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("73_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1199
.annotate "line", 426
    .const 'Sub' $P1210 = "74_1259779054.5228" 
    capture_lex $P1210
    new $P1198, 'ExceptionHandler'
    set_addr $P1198, control_1197
    $P1198."handle_types"(58)
    push_eh $P1198
    .lex "self", self
    .lex "$/", param_1199
.annotate "line", 427
    new $P1200, "Undef"
    .lex "$BLOCKINIT", $P1200
    get_global $P1201, "@BLOCK"
    unless_null $P1201, vivify_388
    new $P1201, "ResizablePMCArray"
  vivify_388:
    set $P1202, $P1201[0]
    unless_null $P1202, vivify_389
    new $P1202, "ResizablePMCArray"
  vivify_389:
    set $P1203, $P1202[0]
    unless_null $P1203, vivify_390
    new $P1203, "Undef"
  vivify_390:
    store_lex "$BLOCKINIT", $P1203
.annotate "line", 428
    find_lex $P1205, "$/"
    unless_null $P1205, vivify_391
    new $P1205, "Hash"
  vivify_391:
    set $P1206, $P1205["parameter"]
    unless_null $P1206, vivify_392
    new $P1206, "Undef"
  vivify_392:
    defined $I1207, $P1206
    unless $I1207, for_undef_393
    iter $P1204, $P1206
    new $P1217, 'ExceptionHandler'
    set_addr $P1217, loop1216_handler
    $P1217."handle_types"(65, 67, 66)
    push_eh $P1217
  loop1216_test:
    unless $P1204, loop1216_done
    shift $P1208, $P1204
  loop1216_redo:
    .const 'Sub' $P1210 = "74_1259779054.5228" 
    capture_lex $P1210
    $P1210($P1208)
  loop1216_next:
    goto loop1216_test
  loop1216_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1218, exception, 'type'
    eq $P1218, 65, loop1216_next
    eq $P1218, 67, loop1216_redo
  loop1216_done:
    pop_eh 
  for_undef_393:
.annotate "line", 426
    .return ($P1204)
  control_1197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1219, exception, "payload"
    .return ($P1219)
.end


.namespace ["NQP";"Actions"]
.sub "_block1209"  :anon :subid("74_1259779054.5228") :outer("73_1259779054.5228")
    .param pmc param_1211
.annotate "line", 428
    .lex "$_", param_1211
    find_lex $P1212, "$BLOCKINIT"
    find_lex $P1213, "$_"
    $P1214 = $P1213."ast"()
    $P1215 = $P1212."push"($P1214)
    .return ($P1215)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("75_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1223
.annotate "line", 431
    new $P1222, 'ExceptionHandler'
    set_addr $P1222, control_1221
    $P1222."handle_types"(58)
    push_eh $P1222
    .lex "self", self
    .lex "$/", param_1223
.annotate "line", 432
    new $P1224, "Undef"
    .lex "$quant", $P1224
.annotate "line", 433
    new $P1225, "Undef"
    .lex "$past", $P1225
.annotate "line", 432
    find_lex $P1226, "$/"
    unless_null $P1226, vivify_394
    new $P1226, "Hash"
  vivify_394:
    set $P1227, $P1226["quant"]
    unless_null $P1227, vivify_395
    new $P1227, "Undef"
  vivify_395:
    store_lex "$quant", $P1227
    find_lex $P1228, "$past"
.annotate "line", 434
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_396
    new $P1230, "Hash"
  vivify_396:
    set $P1231, $P1230["named_param"]
    unless_null $P1231, vivify_397
    new $P1231, "Undef"
  vivify_397:
    if $P1231, if_1229
.annotate "line", 441
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_398
    new $P1245, "Hash"
  vivify_398:
    set $P1246, $P1245["param_var"]
    unless_null $P1246, vivify_399
    new $P1246, "Undef"
  vivify_399:
    $P1247 = $P1246."ast"()
    store_lex "$past", $P1247
.annotate "line", 442
    find_lex $P1249, "$quant"
    set $S1250, $P1249
    iseq $I1251, $S1250, "*"
    if $I1251, if_1248
.annotate "line", 446
    find_lex $P1260, "$quant"
    set $S1261, $P1260
    iseq $I1262, $S1261, "?"
    unless $I1262, if_1259_end
.annotate "line", 447
    find_lex $P1263, "$past"
    find_lex $P1264, "$/"
    unless_null $P1264, vivify_400
    new $P1264, "Hash"
  vivify_400:
    set $P1265, $P1264["param_var"]
    unless_null $P1265, vivify_401
    new $P1265, "Hash"
  vivify_401:
    set $P1266, $P1265["sigil"]
    unless_null $P1266, vivify_402
    new $P1266, "Undef"
  vivify_402:
    $P1267 = "sigiltype"($P1266)
    $P1263."viviself"($P1267)
  if_1259_end:
.annotate "line", 446
    goto if_1248_end
  if_1248:
.annotate "line", 443
    find_lex $P1252, "$past"
    $P1252."slurpy"(1)
.annotate "line", 444
    find_lex $P1253, "$past"
    find_lex $P1254, "$/"
    unless_null $P1254, vivify_403
    new $P1254, "Hash"
  vivify_403:
    set $P1255, $P1254["param_var"]
    unless_null $P1255, vivify_404
    new $P1255, "Hash"
  vivify_404:
    set $P1256, $P1255["sigil"]
    unless_null $P1256, vivify_405
    new $P1256, "Undef"
  vivify_405:
    set $S1257, $P1256
    iseq $I1258, $S1257, "%"
    $P1253."named"($I1258)
  if_1248_end:
.annotate "line", 440
    goto if_1229_end
  if_1229:
.annotate "line", 435
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_406
    new $P1232, "Hash"
  vivify_406:
    set $P1233, $P1232["named_param"]
    unless_null $P1233, vivify_407
    new $P1233, "Undef"
  vivify_407:
    $P1234 = $P1233."ast"()
    store_lex "$past", $P1234
.annotate "line", 436
    find_lex $P1236, "$quant"
    set $S1237, $P1236
    isne $I1238, $S1237, "!"
    unless $I1238, if_1235_end
.annotate "line", 437
    find_lex $P1239, "$past"
    find_lex $P1240, "$/"
    unless_null $P1240, vivify_408
    new $P1240, "Hash"
  vivify_408:
    set $P1241, $P1240["named_param"]
    unless_null $P1241, vivify_409
    new $P1241, "Hash"
  vivify_409:
    set $P1242, $P1241["param_var"]
    unless_null $P1242, vivify_410
    new $P1242, "Hash"
  vivify_410:
    set $P1243, $P1242["sigil"]
    unless_null $P1243, vivify_411
    new $P1243, "Undef"
  vivify_411:
    $P1244 = "sigiltype"($P1243)
    $P1239."viviself"($P1244)
  if_1235_end:
  if_1229_end:
.annotate "line", 450
    find_lex $P1269, "$/"
    unless_null $P1269, vivify_412
    new $P1269, "Hash"
  vivify_412:
    set $P1270, $P1269["default_value"]
    unless_null $P1270, vivify_413
    new $P1270, "Undef"
  vivify_413:
    unless $P1270, if_1268_end
.annotate "line", 451
    find_lex $P1272, "$quant"
    set $S1273, $P1272
    iseq $I1274, $S1273, "*"
    unless $I1274, if_1271_end
.annotate "line", 452
    find_lex $P1275, "$/"
    $P1276 = $P1275."CURSOR"()
    $P1276."panic"("Can't put default on slurpy parameter")
  if_1271_end:
.annotate "line", 454
    find_lex $P1278, "$quant"
    set $S1279, $P1278
    iseq $I1280, $S1279, "!"
    unless $I1280, if_1277_end
.annotate "line", 455
    find_lex $P1281, "$/"
    $P1282 = $P1281."CURSOR"()
    $P1282."panic"("Can't put default on required parameter")
  if_1277_end:
.annotate "line", 457
    find_lex $P1283, "$past"
    find_lex $P1284, "$/"
    unless_null $P1284, vivify_414
    new $P1284, "Hash"
  vivify_414:
    set $P1285, $P1284["default_value"]
    unless_null $P1285, vivify_415
    new $P1285, "ResizablePMCArray"
  vivify_415:
    set $P1286, $P1285[0]
    unless_null $P1286, vivify_416
    new $P1286, "Hash"
  vivify_416:
    set $P1287, $P1286["EXPR"]
    unless_null $P1287, vivify_417
    new $P1287, "Undef"
  vivify_417:
    $P1288 = $P1287."ast"()
    $P1283."viviself"($P1288)
  if_1268_end:
.annotate "line", 459
    find_lex $P1290, "$past"
    $P1291 = $P1290."viviself"()
    if $P1291, unless_1289_end
    get_global $P1292, "@BLOCK"
    unless_null $P1292, vivify_418
    new $P1292, "ResizablePMCArray"
  vivify_418:
    set $P1293, $P1292[0]
    unless_null $P1293, vivify_419
    new $P1293, "Undef"
  vivify_419:
    get_global $P1294, "@BLOCK"
    unless_null $P1294, vivify_420
    new $P1294, "ResizablePMCArray"
  vivify_420:
    set $P1295, $P1294[0]
    unless_null $P1295, vivify_421
    new $P1295, "Undef"
  vivify_421:
    $P1296 = $P1295."arity"()
    set $N1297, $P1296
    new $P1298, 'Float'
    set $P1298, $N1297
    add $P1299, $P1298, 1
    $P1293."arity"($P1299)
  unless_1289_end:
.annotate "line", 460
    find_lex $P1300, "$/"
    find_lex $P1301, "$past"
    $P1302 = $P1300."!make"($P1301)
.annotate "line", 431
    .return ($P1302)
  control_1221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1303, exception, "payload"
    .return ($P1303)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("76_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1307
.annotate "line", 463
    new $P1306, 'ExceptionHandler'
    set_addr $P1306, control_1305
    $P1306."handle_types"(58)
    push_eh $P1306
    .lex "self", self
    .lex "$/", param_1307
.annotate "line", 464
    new $P1308, "Undef"
    .lex "$name", $P1308
.annotate "line", 465
    new $P1309, "Undef"
    .lex "$past", $P1309
.annotate "line", 464
    find_lex $P1310, "$/"
    set $S1311, $P1310
    new $P1312, 'String'
    set $P1312, $S1311
    store_lex "$name", $P1312
.annotate "line", 465
    get_hll_global $P1313, ["PAST"], "Var"
    find_lex $P1314, "$name"
    find_lex $P1315, "$/"
    $P1316 = $P1313."new"($P1314 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1315 :named("node"))
    store_lex "$past", $P1316
.annotate "line", 467
    get_global $P1317, "@BLOCK"
    unless_null $P1317, vivify_422
    new $P1317, "ResizablePMCArray"
  vivify_422:
    set $P1318, $P1317[0]
    unless_null $P1318, vivify_423
    new $P1318, "Undef"
  vivify_423:
    find_lex $P1319, "$name"
    $P1318."symbol"($P1319, "lexical" :named("scope"))
.annotate "line", 468
    find_lex $P1320, "$/"
    find_lex $P1321, "$past"
    $P1322 = $P1320."!make"($P1321)
.annotate "line", 463
    .return ($P1322)
  control_1305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1323, exception, "payload"
    .return ($P1323)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("77_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1327
.annotate "line", 471
    new $P1326, 'ExceptionHandler'
    set_addr $P1326, control_1325
    $P1326."handle_types"(58)
    push_eh $P1326
    .lex "self", self
    .lex "$/", param_1327
.annotate "line", 472
    new $P1328, "Undef"
    .lex "$past", $P1328
    find_lex $P1329, "$/"
    unless_null $P1329, vivify_424
    new $P1329, "Hash"
  vivify_424:
    set $P1330, $P1329["param_var"]
    unless_null $P1330, vivify_425
    new $P1330, "Undef"
  vivify_425:
    $P1331 = $P1330."ast"()
    store_lex "$past", $P1331
.annotate "line", 473
    find_lex $P1332, "$past"
    find_lex $P1333, "$/"
    unless_null $P1333, vivify_426
    new $P1333, "Hash"
  vivify_426:
    set $P1334, $P1333["param_var"]
    unless_null $P1334, vivify_427
    new $P1334, "Hash"
  vivify_427:
    set $P1335, $P1334["name"]
    unless_null $P1335, vivify_428
    new $P1335, "Undef"
  vivify_428:
    set $S1336, $P1335
    $P1332."named"($S1336)
.annotate "line", 474
    find_lex $P1337, "$/"
    find_lex $P1338, "$past"
    $P1339 = $P1337."!make"($P1338)
.annotate "line", 471
    .return ($P1339)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1340, exception, "payload"
    .return ($P1340)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("78_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1344
    .param pmc param_1345 :optional
    .param int has_param_1345 :opt_flag
.annotate "line", 477
    .const 'Sub' $P1362 = "79_1259779054.5228" 
    capture_lex $P1362
    new $P1343, 'ExceptionHandler'
    set_addr $P1343, control_1342
    $P1343."handle_types"(58)
    push_eh $P1343
    .lex "self", self
    .lex "$/", param_1344
    if has_param_1345, optparam_429
    new $P1346, "Undef"
    set param_1345, $P1346
  optparam_429:
    .lex "$key", param_1345
.annotate "line", 478
    new $P1347, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1347
.annotate "line", 481
    new $P1348, "Undef"
    .lex "$name", $P1348
.annotate "line", 482
    new $P1349, "Undef"
    .lex "$past", $P1349
.annotate "line", 478

        $P1350 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1350
.annotate "line", 481
    find_lex $P1351, "$/"
    unless_null $P1351, vivify_430
    new $P1351, "Hash"
  vivify_430:
    set $P1352, $P1351["deflongname"]
    unless_null $P1352, vivify_431
    new $P1352, "Undef"
  vivify_431:
    $P1353 = $P1352."ast"()
    set $S1354, $P1353
    new $P1355, 'String'
    set $P1355, $S1354
    store_lex "$name", $P1355
    find_lex $P1356, "$past"
.annotate "line", 483
    find_lex $P1358, "$key"
    set $S1359, $P1358
    iseq $I1360, $S1359, "open"
    if $I1360, if_1357
.annotate "line", 496
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_432
    new $P1390, "Hash"
  vivify_432:
    set $P1391, $P1390["proto"]
    unless_null $P1391, vivify_433
    new $P1391, "Undef"
  vivify_433:
    if $P1391, if_1389
.annotate "line", 525
    get_hll_global $P1414, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1415, "$/"
    unless_null $P1415, vivify_434
    new $P1415, "Hash"
  vivify_434:
    set $P1416, $P1415["p6regex"]
    unless_null $P1416, vivify_435
    new $P1416, "Undef"
  vivify_435:
    $P1417 = $P1416."ast"()
    get_global $P1418, "@BLOCK"
    $P1419 = $P1418."shift"()
    $P1420 = $P1414($P1417, $P1419)
    store_lex "$past", $P1420
.annotate "line", 526
    find_lex $P1421, "$past"
    find_lex $P1422, "$name"
    $P1421."name"($P1422)
.annotate "line", 527
    find_lex $P1423, "@MODIFIERS"
    $P1423."shift"()
.annotate "line", 523
    goto if_1389_end
  if_1389:
.annotate "line", 498
    get_hll_global $P1392, ["PAST"], "Stmts"
.annotate "line", 499
    get_hll_global $P1393, ["PAST"], "Block"
    find_lex $P1394, "$name"
.annotate "line", 500
    get_hll_global $P1395, ["PAST"], "Op"
.annotate "line", 501
    get_hll_global $P1396, ["PAST"], "Var"
    $P1397 = $P1396."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1398, "$name"
    $P1399 = $P1395."new"($P1397, $P1398, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 500
    find_lex $P1400, "$/"
    $P1401 = $P1393."new"($P1399, $P1394 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1400 :named("node"))
.annotate "line", 510
    get_hll_global $P1402, ["PAST"], "Block"
    new $P1403, "String"
    assign $P1403, "!PREFIX__"
    find_lex $P1404, "$name"
    concat $P1405, $P1403, $P1404
.annotate "line", 511
    get_hll_global $P1406, ["PAST"], "Op"
.annotate "line", 512
    get_hll_global $P1407, ["PAST"], "Var"
    $P1408 = $P1407."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1409, "$name"
    $P1410 = $P1406."new"($P1408, $P1409, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 511
    find_lex $P1411, "$/"
    $P1412 = $P1402."new"($P1410, $P1405 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1411 :named("node"))
.annotate "line", 510
    $P1413 = $P1392."new"($P1401, $P1412)
.annotate "line", 498
    store_lex "$past", $P1413
  if_1389_end:
.annotate "line", 496
    goto if_1357_end
  if_1357:
.annotate "line", 483
    .const 'Sub' $P1362 = "79_1259779054.5228" 
    capture_lex $P1362
    $P1362()
  if_1357_end:
.annotate "line", 529
    find_lex $P1424, "$/"
    find_lex $P1425, "$past"
    $P1426 = $P1424."!make"($P1425)
.annotate "line", 477
    .return ($P1426)
  control_1342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1427, exception, "payload"
    .return ($P1427)
.end


.namespace ["NQP";"Actions"]
.sub "_block1361"  :anon :subid("79_1259779054.5228") :outer("78_1259779054.5228")
.annotate "line", 484
    new $P1363, "Hash"
    .lex "%h", $P1363
.annotate "line", 483
    find_lex $P1364, "%h"
.annotate "line", 485
    find_lex $P1366, "$/"
    unless_null $P1366, vivify_436
    new $P1366, "Hash"
  vivify_436:
    set $P1367, $P1366["sym"]
    unless_null $P1367, vivify_437
    new $P1367, "Undef"
  vivify_437:
    set $S1368, $P1367
    iseq $I1369, $S1368, "token"
    unless $I1369, if_1365_end
    new $P1370, "Integer"
    assign $P1370, 1
    find_lex $P1371, "%h"
    unless_null $P1371, vivify_438
    new $P1371, "Hash"
    store_lex "%h", $P1371
  vivify_438:
    set $P1371["r"], $P1370
  if_1365_end:
.annotate "line", 486
    find_lex $P1373, "$/"
    unless_null $P1373, vivify_439
    new $P1373, "Hash"
  vivify_439:
    set $P1374, $P1373["sym"]
    unless_null $P1374, vivify_440
    new $P1374, "Undef"
  vivify_440:
    set $S1375, $P1374
    iseq $I1376, $S1375, "rule"
    unless $I1376, if_1372_end
    new $P1377, "Integer"
    assign $P1377, 1
    find_lex $P1378, "%h"
    unless_null $P1378, vivify_441
    new $P1378, "Hash"
    store_lex "%h", $P1378
  vivify_441:
    set $P1378["r"], $P1377
    new $P1379, "Integer"
    assign $P1379, 1
    find_lex $P1380, "%h"
    unless_null $P1380, vivify_442
    new $P1380, "Hash"
    store_lex "%h", $P1380
  vivify_442:
    set $P1380["s"], $P1379
  if_1372_end:
.annotate "line", 487
    find_lex $P1381, "@MODIFIERS"
    find_lex $P1382, "%h"
    $P1381."unshift"($P1382)
.annotate "line", 488

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 492
    get_global $P1383, "@BLOCK"
    unless_null $P1383, vivify_443
    new $P1383, "ResizablePMCArray"
  vivify_443:
    set $P1384, $P1383[0]
    unless_null $P1384, vivify_444
    new $P1384, "Undef"
  vivify_444:
    $P1384."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 493
    get_global $P1385, "@BLOCK"
    unless_null $P1385, vivify_445
    new $P1385, "ResizablePMCArray"
  vivify_445:
    set $P1386, $P1385[0]
    unless_null $P1386, vivify_446
    new $P1386, "Undef"
  vivify_446:
    $P1386."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 494
    new $P1387, "Exception"
    set $P1387['type'], 58
    new $P1388, "Integer"
    assign $P1388, 0
    setattribute $P1387, 'payload', $P1388
    throw $P1387
.annotate "line", 483
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("80_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1431
.annotate "line", 533
    new $P1430, 'ExceptionHandler'
    set_addr $P1430, control_1429
    $P1430."handle_types"(58)
    push_eh $P1430
    .lex "self", self
    .lex "$/", param_1431
.annotate "line", 534
    new $P1432, "Undef"
    .lex "$past", $P1432
    find_lex $P1435, "$/"
    unless_null $P1435, vivify_447
    new $P1435, "Hash"
  vivify_447:
    set $P1436, $P1435["args"]
    unless_null $P1436, vivify_448
    new $P1436, "Undef"
  vivify_448:
    if $P1436, if_1434
    get_hll_global $P1441, ["PAST"], "Op"
    find_lex $P1442, "$/"
    $P1443 = $P1441."new"($P1442 :named("node"))
    set $P1433, $P1443
    goto if_1434_end
  if_1434:
    find_lex $P1437, "$/"
    unless_null $P1437, vivify_449
    new $P1437, "Hash"
  vivify_449:
    set $P1438, $P1437["args"]
    unless_null $P1438, vivify_450
    new $P1438, "ResizablePMCArray"
  vivify_450:
    set $P1439, $P1438[0]
    unless_null $P1439, vivify_451
    new $P1439, "Undef"
  vivify_451:
    $P1440 = $P1439."ast"()
    set $P1433, $P1440
  if_1434_end:
    store_lex "$past", $P1433
.annotate "line", 535
    find_lex $P1444, "$past"
    find_lex $P1447, "$/"
    unless_null $P1447, vivify_452
    new $P1447, "Hash"
  vivify_452:
    set $P1448, $P1447["quote"]
    unless_null $P1448, vivify_453
    new $P1448, "Undef"
  vivify_453:
    if $P1448, if_1446
    find_lex $P1452, "$/"
    unless_null $P1452, vivify_454
    new $P1452, "Hash"
  vivify_454:
    set $P1453, $P1452["longname"]
    unless_null $P1453, vivify_455
    new $P1453, "Undef"
  vivify_455:
    set $S1454, $P1453
    new $P1445, 'String'
    set $P1445, $S1454
    goto if_1446_end
  if_1446:
    find_lex $P1449, "$/"
    unless_null $P1449, vivify_456
    new $P1449, "Hash"
  vivify_456:
    set $P1450, $P1449["quote"]
    unless_null $P1450, vivify_457
    new $P1450, "Undef"
  vivify_457:
    $P1451 = $P1450."ast"()
    set $P1445, $P1451
  if_1446_end:
    $P1444."name"($P1445)
.annotate "line", 536
    find_lex $P1455, "$past"
    $P1455."pasttype"("callmethod")
.annotate "line", 537
    find_lex $P1456, "$/"
    find_lex $P1457, "$past"
    $P1458 = $P1456."!make"($P1457)
.annotate "line", 533
    .return ($P1458)
  control_1429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1459, exception, "payload"
    .return ($P1459)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("81_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1463
.annotate "line", 542
    new $P1462, 'ExceptionHandler'
    set_addr $P1462, control_1461
    $P1462."handle_types"(58)
    push_eh $P1462
    .lex "self", self
    .lex "$/", param_1463
.annotate "line", 543
    find_lex $P1464, "$/"
    get_hll_global $P1465, ["PAST"], "Var"
    $P1466 = $P1465."new"("self" :named("name"))
    $P1467 = $P1464."!make"($P1466)
.annotate "line", 542
    .return ($P1467)
  control_1461:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1468, exception, "payload"
    .return ($P1468)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("82_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1472
.annotate "line", 546
    new $P1471, 'ExceptionHandler'
    set_addr $P1471, control_1470
    $P1471."handle_types"(58)
    push_eh $P1471
    .lex "self", self
    .lex "$/", param_1472
.annotate "line", 547
    new $P1473, "Undef"
    .lex "$past", $P1473
    find_lex $P1474, "$/"
    unless_null $P1474, vivify_458
    new $P1474, "Hash"
  vivify_458:
    set $P1475, $P1474["args"]
    unless_null $P1475, vivify_459
    new $P1475, "Undef"
  vivify_459:
    $P1476 = $P1475."ast"()
    store_lex "$past", $P1476
.annotate "line", 548
    find_lex $P1477, "$past"
    find_lex $P1478, "$/"
    unless_null $P1478, vivify_460
    new $P1478, "Hash"
  vivify_460:
    set $P1479, $P1478["identifier"]
    unless_null $P1479, vivify_461
    new $P1479, "Undef"
  vivify_461:
    set $S1480, $P1479
    $P1477."name"($S1480)
.annotate "line", 549
    find_lex $P1481, "$/"
    find_lex $P1482, "$past"
    $P1483 = $P1481."!make"($P1482)
.annotate "line", 546
    .return ($P1483)
  control_1470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1484, exception, "payload"
    .return ($P1484)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("83_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1488
.annotate "line", 552
    new $P1487, 'ExceptionHandler'
    set_addr $P1487, control_1486
    $P1487."handle_types"(58)
    push_eh $P1487
    .lex "self", self
    .lex "$/", param_1488
.annotate "line", 553
    new $P1489, "ResizablePMCArray"
    .lex "@ns", $P1489
.annotate "line", 554
    new $P1490, "Undef"
    .lex "$name", $P1490
.annotate "line", 556
    new $P1491, "Undef"
    .lex "$var", $P1491
.annotate "line", 558
    new $P1492, "Undef"
    .lex "$past", $P1492
.annotate "line", 553
    find_lex $P1493, "$/"
    unless_null $P1493, vivify_462
    new $P1493, "Hash"
  vivify_462:
    set $P1494, $P1493["name"]
    unless_null $P1494, vivify_463
    new $P1494, "Hash"
  vivify_463:
    set $P1495, $P1494["identifier"]
    unless_null $P1495, vivify_464
    new $P1495, "Undef"
  vivify_464:
    clone $P1496, $P1495
    store_lex "@ns", $P1496
.annotate "line", 554
    find_lex $P1497, "@ns"
    $P1498 = $P1497."pop"()
    store_lex "$name", $P1498
.annotate "line", 555
    find_lex $P1502, "@ns"
    if $P1502, if_1501
    set $P1500, $P1502
    goto if_1501_end
  if_1501:
    find_lex $P1503, "@ns"
    unless_null $P1503, vivify_465
    new $P1503, "ResizablePMCArray"
  vivify_465:
    set $P1504, $P1503[0]
    unless_null $P1504, vivify_466
    new $P1504, "Undef"
  vivify_466:
    set $S1505, $P1504
    iseq $I1506, $S1505, "GLOBAL"
    new $P1500, 'Integer'
    set $P1500, $I1506
  if_1501_end:
    unless $P1500, if_1499_end
    find_lex $P1507, "@ns"
    $P1507."shift"()
  if_1499_end:
.annotate "line", 557
    get_hll_global $P1508, ["PAST"], "Var"
    find_lex $P1509, "$name"
    set $S1510, $P1509
    find_lex $P1511, "@ns"
    $P1512 = $P1508."new"($S1510 :named("name"), $P1511 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1512
.annotate "line", 558
    find_lex $P1513, "$var"
    store_lex "$past", $P1513
.annotate "line", 559
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_467
    new $P1515, "Hash"
  vivify_467:
    set $P1516, $P1515["args"]
    unless_null $P1516, vivify_468
    new $P1516, "Undef"
  vivify_468:
    unless $P1516, if_1514_end
.annotate "line", 560
    find_lex $P1517, "$/"
    unless_null $P1517, vivify_469
    new $P1517, "Hash"
  vivify_469:
    set $P1518, $P1517["args"]
    unless_null $P1518, vivify_470
    new $P1518, "ResizablePMCArray"
  vivify_470:
    set $P1519, $P1518[0]
    unless_null $P1519, vivify_471
    new $P1519, "Undef"
  vivify_471:
    $P1520 = $P1519."ast"()
    store_lex "$past", $P1520
.annotate "line", 561
    find_lex $P1521, "$past"
    find_lex $P1522, "$var"
    $P1521."unshift"($P1522)
  if_1514_end:
.annotate "line", 563
    find_lex $P1523, "$/"
    find_lex $P1524, "$past"
    $P1525 = $P1523."!make"($P1524)
.annotate "line", 552
    .return ($P1525)
  control_1486:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1526, exception, "payload"
    .return ($P1526)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("84_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1530
.annotate "line", 566
    new $P1529, 'ExceptionHandler'
    set_addr $P1529, control_1528
    $P1529."handle_types"(58)
    push_eh $P1529
    .lex "self", self
    .lex "$/", param_1530
.annotate "line", 567
    new $P1531, "Undef"
    .lex "$past", $P1531
.annotate "line", 568
    new $P1532, "Undef"
    .lex "$pirop", $P1532
.annotate "line", 567
    find_lex $P1535, "$/"
    unless_null $P1535, vivify_472
    new $P1535, "Hash"
  vivify_472:
    set $P1536, $P1535["args"]
    unless_null $P1536, vivify_473
    new $P1536, "Undef"
  vivify_473:
    if $P1536, if_1534
    get_hll_global $P1541, ["PAST"], "Op"
    find_lex $P1542, "$/"
    $P1543 = $P1541."new"($P1542 :named("node"))
    set $P1533, $P1543
    goto if_1534_end
  if_1534:
    find_lex $P1537, "$/"
    unless_null $P1537, vivify_474
    new $P1537, "Hash"
  vivify_474:
    set $P1538, $P1537["args"]
    unless_null $P1538, vivify_475
    new $P1538, "ResizablePMCArray"
  vivify_475:
    set $P1539, $P1538[0]
    unless_null $P1539, vivify_476
    new $P1539, "Undef"
  vivify_476:
    $P1540 = $P1539."ast"()
    set $P1533, $P1540
  if_1534_end:
    store_lex "$past", $P1533
.annotate "line", 568
    find_lex $P1544, "$/"
    unless_null $P1544, vivify_477
    new $P1544, "Hash"
  vivify_477:
    set $P1545, $P1544["op"]
    unless_null $P1545, vivify_478
    new $P1545, "Undef"
  vivify_478:
    set $S1546, $P1545
    new $P1547, 'String'
    set $P1547, $S1546
    store_lex "$pirop", $P1547
.annotate "line", 569

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1548 = box $S0
    
    store_lex "$pirop", $P1548
.annotate "line", 576
    find_lex $P1549, "$past"
    find_lex $P1550, "$pirop"
    $P1549."pirop"($P1550)
.annotate "line", 577
    find_lex $P1551, "$past"
    $P1551."pasttype"("pirop")
.annotate "line", 578
    find_lex $P1552, "$/"
    find_lex $P1553, "$past"
    $P1554 = $P1552."!make"($P1553)
.annotate "line", 566
    .return ($P1554)
  control_1528:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1555, exception, "payload"
    .return ($P1555)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("85_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1559
.annotate "line", 581
    new $P1558, 'ExceptionHandler'
    set_addr $P1558, control_1557
    $P1558."handle_types"(58)
    push_eh $P1558
    .lex "self", self
    .lex "$/", param_1559
    find_lex $P1560, "$/"
    find_lex $P1561, "$/"
    unless_null $P1561, vivify_479
    new $P1561, "Hash"
  vivify_479:
    set $P1562, $P1561["arglist"]
    unless_null $P1562, vivify_480
    new $P1562, "Undef"
  vivify_480:
    $P1563 = $P1562."ast"()
    $P1564 = $P1560."!make"($P1563)
    .return ($P1564)
  control_1557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1565, exception, "payload"
    .return ($P1565)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("86_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1569
.annotate "line", 583
    .const 'Sub' $P1580 = "87_1259779054.5228" 
    capture_lex $P1580
    new $P1568, 'ExceptionHandler'
    set_addr $P1568, control_1567
    $P1568."handle_types"(58)
    push_eh $P1568
    .lex "self", self
    .lex "$/", param_1569
.annotate "line", 584
    new $P1570, "Undef"
    .lex "$past", $P1570
.annotate "line", 592
    new $P1571, "Undef"
    .lex "$i", $P1571
.annotate "line", 593
    new $P1572, "Undef"
    .lex "$n", $P1572
.annotate "line", 584
    get_hll_global $P1573, ["PAST"], "Op"
    find_lex $P1574, "$/"
    $P1575 = $P1573."new"("call" :named("pasttype"), $P1574 :named("node"))
    store_lex "$past", $P1575
.annotate "line", 585
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_481
    new $P1577, "Hash"
  vivify_481:
    set $P1578, $P1577["EXPR"]
    unless_null $P1578, vivify_482
    new $P1578, "Undef"
  vivify_482:
    unless $P1578, if_1576_end
    .const 'Sub' $P1580 = "87_1259779054.5228" 
    capture_lex $P1580
    $P1580()
  if_1576_end:
.annotate "line", 592
    new $P1612, "Integer"
    assign $P1612, 0
    store_lex "$i", $P1612
.annotate "line", 593
    find_lex $P1613, "$past"
    $P1614 = $P1613."list"()
    set $N1615, $P1614
    new $P1616, 'Float'
    set $P1616, $N1615
    store_lex "$n", $P1616
.annotate "line", 594
    new $P1644, 'ExceptionHandler'
    set_addr $P1644, loop1643_handler
    $P1644."handle_types"(65, 67, 66)
    push_eh $P1644
  loop1643_test:
    find_lex $P1617, "$i"
    set $N1618, $P1617
    find_lex $P1619, "$n"
    set $N1620, $P1619
    islt $I1621, $N1618, $N1620
    unless $I1621, loop1643_done
  loop1643_redo:
.annotate "line", 595
    find_lex $P1623, "$i"
    set $I1624, $P1623
    find_lex $P1625, "$past"
    unless_null $P1625, vivify_486
    new $P1625, "ResizablePMCArray"
  vivify_486:
    set $P1626, $P1625[$I1624]
    unless_null $P1626, vivify_487
    new $P1626, "Undef"
  vivify_487:
    $S1627 = $P1626."name"()
    iseq $I1628, $S1627, "&prefix:<|>"
    unless $I1628, if_1622_end
.annotate "line", 596
    find_lex $P1629, "$i"
    set $I1630, $P1629
    find_lex $P1631, "$past"
    unless_null $P1631, vivify_488
    new $P1631, "ResizablePMCArray"
  vivify_488:
    set $P1632, $P1631[$I1630]
    unless_null $P1632, vivify_489
    new $P1632, "ResizablePMCArray"
  vivify_489:
    set $P1633, $P1632[0]
    unless_null $P1633, vivify_490
    new $P1633, "Undef"
  vivify_490:
    find_lex $P1634, "$i"
    set $I1635, $P1634
    find_lex $P1636, "$past"
    unless_null $P1636, vivify_491
    new $P1636, "ResizablePMCArray"
    store_lex "$past", $P1636
  vivify_491:
    set $P1636[$I1635], $P1633
.annotate "line", 597
    find_lex $P1637, "$i"
    set $I1638, $P1637
    find_lex $P1639, "$past"
    unless_null $P1639, vivify_492
    new $P1639, "ResizablePMCArray"
  vivify_492:
    set $P1640, $P1639[$I1638]
    unless_null $P1640, vivify_493
    new $P1640, "Undef"
  vivify_493:
    $P1640."flat"(1)
  if_1622_end:
.annotate "line", 595
    find_lex $P1641, "$i"
    clone $P1642, $P1641
    inc $P1641
  loop1643_next:
.annotate "line", 594
    goto loop1643_test
  loop1643_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1645, exception, 'type'
    eq $P1645, 65, loop1643_next
    eq $P1645, 67, loop1643_redo
  loop1643_done:
    pop_eh 
.annotate "line", 601
    find_lex $P1646, "$/"
    find_lex $P1647, "$past"
    $P1648 = $P1646."!make"($P1647)
.annotate "line", 583
    .return ($P1648)
  control_1567:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1649, exception, "payload"
    .return ($P1649)
.end


.namespace ["NQP";"Actions"]
.sub "_block1579"  :anon :subid("87_1259779054.5228") :outer("86_1259779054.5228")
.annotate "line", 585
    .const 'Sub' $P1601 = "88_1259779054.5228" 
    capture_lex $P1601
.annotate "line", 586
    new $P1581, "Undef"
    .lex "$expr", $P1581
    find_lex $P1582, "$/"
    unless_null $P1582, vivify_483
    new $P1582, "Hash"
  vivify_483:
    set $P1583, $P1582["EXPR"]
    unless_null $P1583, vivify_484
    new $P1583, "Undef"
  vivify_484:
    $P1584 = $P1583."ast"()
    store_lex "$expr", $P1584
.annotate "line", 587
    find_lex $P1589, "$expr"
    $S1590 = $P1589."name"()
    iseq $I1591, $S1590, "&infix:<,>"
    if $I1591, if_1588
    new $P1587, 'Integer'
    set $P1587, $I1591
    goto if_1588_end
  if_1588:
    find_lex $P1592, "$expr"
    $P1593 = $P1592."named"()
    isfalse $I1594, $P1593
    new $P1587, 'Integer'
    set $P1587, $I1594
  if_1588_end:
    if $P1587, if_1586
.annotate "line", 590
    find_lex $P1609, "$past"
    find_lex $P1610, "$expr"
    $P1611 = $P1609."push"($P1610)
    set $P1585, $P1611
.annotate "line", 587
    goto if_1586_end
  if_1586:
.annotate "line", 588
    find_lex $P1596, "$expr"
    $P1597 = $P1596."list"()
    defined $I1598, $P1597
    unless $I1598, for_undef_485
    iter $P1595, $P1597
    new $P1607, 'ExceptionHandler'
    set_addr $P1607, loop1606_handler
    $P1607."handle_types"(65, 67, 66)
    push_eh $P1607
  loop1606_test:
    unless $P1595, loop1606_done
    shift $P1599, $P1595
  loop1606_redo:
    .const 'Sub' $P1601 = "88_1259779054.5228" 
    capture_lex $P1601
    $P1601($P1599)
  loop1606_next:
    goto loop1606_test
  loop1606_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1608, exception, 'type'
    eq $P1608, 65, loop1606_next
    eq $P1608, 67, loop1606_redo
  loop1606_done:
    pop_eh 
  for_undef_485:
.annotate "line", 587
    set $P1585, $P1595
  if_1586_end:
.annotate "line", 585
    .return ($P1585)
.end


.namespace ["NQP";"Actions"]
.sub "_block1600"  :anon :subid("88_1259779054.5228") :outer("87_1259779054.5228")
    .param pmc param_1602
.annotate "line", 588
    .lex "$_", param_1602
    find_lex $P1603, "$past"
    find_lex $P1604, "$_"
    $P1605 = $P1603."push"($P1604)
    .return ($P1605)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("89_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1653
.annotate "line", 605
    new $P1652, 'ExceptionHandler'
    set_addr $P1652, control_1651
    $P1652."handle_types"(58)
    push_eh $P1652
    .lex "self", self
    .lex "$/", param_1653
    find_lex $P1654, "$/"
    find_lex $P1655, "$/"
    unless_null $P1655, vivify_494
    new $P1655, "Hash"
  vivify_494:
    set $P1656, $P1655["value"]
    unless_null $P1656, vivify_495
    new $P1656, "Undef"
  vivify_495:
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
.sub "circumfix:sym<( )>"  :subid("90_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1663
.annotate "line", 607
    new $P1662, 'ExceptionHandler'
    set_addr $P1662, control_1661
    $P1662."handle_types"(58)
    push_eh $P1662
    .lex "self", self
    .lex "$/", param_1663
.annotate "line", 608
    find_lex $P1664, "$/"
.annotate "line", 609
    find_lex $P1667, "$/"
    unless_null $P1667, vivify_496
    new $P1667, "Hash"
  vivify_496:
    set $P1668, $P1667["EXPR"]
    unless_null $P1668, vivify_497
    new $P1668, "Undef"
  vivify_497:
    if $P1668, if_1666
.annotate "line", 610
    get_hll_global $P1673, ["PAST"], "Op"
    find_lex $P1674, "$/"
    $P1675 = $P1673."new"("list" :named("pasttype"), $P1674 :named("node"))
    set $P1665, $P1675
.annotate "line", 609
    goto if_1666_end
  if_1666:
    find_lex $P1669, "$/"
    unless_null $P1669, vivify_498
    new $P1669, "Hash"
  vivify_498:
    set $P1670, $P1669["EXPR"]
    unless_null $P1670, vivify_499
    new $P1670, "ResizablePMCArray"
  vivify_499:
    set $P1671, $P1670[0]
    unless_null $P1671, vivify_500
    new $P1671, "Undef"
  vivify_500:
    $P1672 = $P1671."ast"()
    set $P1665, $P1672
  if_1666_end:
    $P1676 = $P1664."!make"($P1665)
.annotate "line", 607
    .return ($P1676)
  control_1661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1677, exception, "payload"
    .return ($P1677)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("91_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1681
.annotate "line", 613
    new $P1680, 'ExceptionHandler'
    set_addr $P1680, control_1679
    $P1680."handle_types"(58)
    push_eh $P1680
    .lex "self", self
    .lex "$/", param_1681
.annotate "line", 614
    new $P1682, "Undef"
    .lex "$past", $P1682
.annotate "line", 613
    find_lex $P1683, "$past"
.annotate "line", 615
    find_lex $P1685, "$/"
    unless_null $P1685, vivify_501
    new $P1685, "Hash"
  vivify_501:
    set $P1686, $P1685["EXPR"]
    unless_null $P1686, vivify_502
    new $P1686, "Undef"
  vivify_502:
    if $P1686, if_1684
.annotate "line", 622
    get_hll_global $P1698, ["PAST"], "Op"
    $P1699 = $P1698."new"("list" :named("pasttype"))
    store_lex "$past", $P1699
.annotate "line", 621
    goto if_1684_end
  if_1684:
.annotate "line", 616
    find_lex $P1687, "$/"
    unless_null $P1687, vivify_503
    new $P1687, "Hash"
  vivify_503:
    set $P1688, $P1687["EXPR"]
    unless_null $P1688, vivify_504
    new $P1688, "ResizablePMCArray"
  vivify_504:
    set $P1689, $P1688[0]
    unless_null $P1689, vivify_505
    new $P1689, "Undef"
  vivify_505:
    $P1690 = $P1689."ast"()
    store_lex "$past", $P1690
.annotate "line", 617
    find_lex $P1692, "$past"
    $S1693 = $P1692."name"()
    isne $I1694, $S1693, "&infix:<,>"
    unless $I1694, if_1691_end
.annotate "line", 618
    get_hll_global $P1695, ["PAST"], "Op"
    find_lex $P1696, "$past"
    $P1697 = $P1695."new"($P1696, "list" :named("pasttype"))
    store_lex "$past", $P1697
  if_1691_end:
  if_1684_end:
.annotate "line", 624
    find_lex $P1700, "$past"
    $P1700."name"("&circumfix:<[ ]>")
.annotate "line", 625
    find_lex $P1701, "$/"
    find_lex $P1702, "$past"
    $P1703 = $P1701."!make"($P1702)
.annotate "line", 613
    .return ($P1703)
  control_1679:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1704, exception, "payload"
    .return ($P1704)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("92_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1708
.annotate "line", 628
    new $P1707, 'ExceptionHandler'
    set_addr $P1707, control_1706
    $P1707."handle_types"(58)
    push_eh $P1707
    .lex "self", self
    .lex "$/", param_1708
    find_lex $P1709, "$/"
    find_lex $P1710, "$/"
    unless_null $P1710, vivify_506
    new $P1710, "Hash"
  vivify_506:
    set $P1711, $P1710["quote_EXPR"]
    unless_null $P1711, vivify_507
    new $P1711, "Undef"
  vivify_507:
    $P1712 = $P1711."ast"()
    $P1713 = $P1709."!make"($P1712)
    .return ($P1713)
  control_1706:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1714, exception, "payload"
    .return ($P1714)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("93_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1718
.annotate "line", 629
    new $P1717, 'ExceptionHandler'
    set_addr $P1717, control_1716
    $P1717."handle_types"(58)
    push_eh $P1717
    .lex "self", self
    .lex "$/", param_1718
    find_lex $P1719, "$/"
    find_lex $P1720, "$/"
    unless_null $P1720, vivify_508
    new $P1720, "Hash"
  vivify_508:
    set $P1721, $P1720["quote_EXPR"]
    unless_null $P1721, vivify_509
    new $P1721, "Undef"
  vivify_509:
    $P1722 = $P1721."ast"()
    $P1723 = $P1719."!make"($P1722)
    .return ($P1723)
  control_1716:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1724, exception, "payload"
    .return ($P1724)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("94_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1728
.annotate "line", 631
    new $P1727, 'ExceptionHandler'
    set_addr $P1727, control_1726
    $P1727."handle_types"(58)
    push_eh $P1727
    .lex "self", self
    .lex "$/", param_1728
.annotate "line", 632
    find_lex $P1729, "$/"
    find_lex $P1732, "$/"
    unless_null $P1732, vivify_510
    new $P1732, "Hash"
  vivify_510:
    set $P1733, $P1732["pblock"]
    unless_null $P1733, vivify_511
    new $P1733, "Hash"
  vivify_511:
    set $P1734, $P1733["blockoid"]
    unless_null $P1734, vivify_512
    new $P1734, "Hash"
  vivify_512:
    set $P1735, $P1734["statementlist"]
    unless_null $P1735, vivify_513
    new $P1735, "Hash"
  vivify_513:
    set $P1736, $P1735["statement"]
    unless_null $P1736, vivify_514
    new $P1736, "Undef"
  vivify_514:
    set $N1737, $P1736
    new $P1738, "Integer"
    assign $P1738, 0
    set $N1739, $P1738
    isgt $I1740, $N1737, $N1739
    if $I1740, if_1731
.annotate "line", 634
    get_hll_global $P1744, ["PAST"], "Op"
    find_lex $P1745, "$/"
    $P1746 = $P1744."new"("    %r = new [\"Hash\"]" :named("inline"), $P1745 :named("node"))
    set $P1730, $P1746
.annotate "line", 632
    goto if_1731_end
  if_1731:
.annotate "line", 633
    find_lex $P1741, "$/"
    unless_null $P1741, vivify_515
    new $P1741, "Hash"
  vivify_515:
    set $P1742, $P1741["pblock"]
    unless_null $P1742, vivify_516
    new $P1742, "Undef"
  vivify_516:
    $P1743 = $P1742."ast"()
    set $P1730, $P1743
  if_1731_end:
    $P1747 = $P1729."!make"($P1730)
.annotate "line", 631
    .return ($P1747)
  control_1726:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1748, exception, "payload"
    .return ($P1748)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("95_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1752
.annotate "line", 637
    new $P1751, 'ExceptionHandler'
    set_addr $P1751, control_1750
    $P1751."handle_types"(58)
    push_eh $P1751
    .lex "self", self
    .lex "$/", param_1752
.annotate "line", 638
    new $P1753, "Undef"
    .lex "$name", $P1753
    find_lex $P1756, "$/"
    unless_null $P1756, vivify_517
    new $P1756, "Hash"
  vivify_517:
    set $P1757, $P1756["sigil"]
    unless_null $P1757, vivify_518
    new $P1757, "Undef"
  vivify_518:
    set $S1758, $P1757
    iseq $I1759, $S1758, "@"
    if $I1759, if_1755
.annotate "line", 639
    find_lex $P1763, "$/"
    unless_null $P1763, vivify_519
    new $P1763, "Hash"
  vivify_519:
    set $P1764, $P1763["sigil"]
    unless_null $P1764, vivify_520
    new $P1764, "Undef"
  vivify_520:
    set $S1765, $P1764
    iseq $I1766, $S1765, "%"
    if $I1766, if_1762
    new $P1768, "String"
    assign $P1768, "item"
    set $P1761, $P1768
    goto if_1762_end
  if_1762:
    new $P1767, "String"
    assign $P1767, "hash"
    set $P1761, $P1767
  if_1762_end:
    set $P1754, $P1761
.annotate "line", 638
    goto if_1755_end
  if_1755:
    new $P1760, "String"
    assign $P1760, "list"
    set $P1754, $P1760
  if_1755_end:
    store_lex "$name", $P1754
.annotate "line", 641
    find_lex $P1769, "$/"
    get_hll_global $P1770, ["PAST"], "Op"
    find_lex $P1771, "$name"
    find_lex $P1772, "$/"
    unless_null $P1772, vivify_521
    new $P1772, "Hash"
  vivify_521:
    set $P1773, $P1772["semilist"]
    unless_null $P1773, vivify_522
    new $P1773, "Undef"
  vivify_522:
    $P1774 = $P1773."ast"()
    $P1775 = $P1770."new"($P1774, "callmethod" :named("pasttype"), $P1771 :named("name"))
    $P1776 = $P1769."!make"($P1775)
.annotate "line", 637
    .return ($P1776)
  control_1750:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1777, exception, "payload"
    .return ($P1777)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("96_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1781
.annotate "line", 644
    new $P1780, 'ExceptionHandler'
    set_addr $P1780, control_1779
    $P1780."handle_types"(58)
    push_eh $P1780
    .lex "self", self
    .lex "$/", param_1781
    find_lex $P1782, "$/"
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_523
    new $P1783, "Hash"
  vivify_523:
    set $P1784, $P1783["statement"]
    unless_null $P1784, vivify_524
    new $P1784, "Undef"
  vivify_524:
    $P1785 = $P1784."ast"()
    $P1786 = $P1782."!make"($P1785)
    .return ($P1786)
  control_1779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1787, exception, "payload"
    .return ($P1787)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("97_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1791
.annotate "line", 646
    new $P1790, 'ExceptionHandler'
    set_addr $P1790, control_1789
    $P1790."handle_types"(58)
    push_eh $P1790
    .lex "self", self
    .lex "$/", param_1791
.annotate "line", 647
    find_lex $P1792, "$/"
    get_hll_global $P1793, ["PAST"], "Var"
    find_lex $P1794, "$/"
    unless_null $P1794, vivify_525
    new $P1794, "Hash"
  vivify_525:
    set $P1795, $P1794["EXPR"]
    unless_null $P1795, vivify_526
    new $P1795, "Undef"
  vivify_526:
    $P1796 = $P1795."ast"()
    $P1797 = $P1793."new"($P1796, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1798 = $P1792."!make"($P1797)
.annotate "line", 646
    .return ($P1798)
  control_1789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1799, exception, "payload"
    .return ($P1799)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("98_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1803
.annotate "line", 652
    new $P1802, 'ExceptionHandler'
    set_addr $P1802, control_1801
    $P1802."handle_types"(58)
    push_eh $P1802
    .lex "self", self
    .lex "$/", param_1803
.annotate "line", 653
    find_lex $P1804, "$/"
    get_hll_global $P1805, ["PAST"], "Var"
    find_lex $P1806, "$/"
    unless_null $P1806, vivify_527
    new $P1806, "Hash"
  vivify_527:
    set $P1807, $P1806["EXPR"]
    unless_null $P1807, vivify_528
    new $P1807, "Undef"
  vivify_528:
    $P1808 = $P1807."ast"()
    $P1809 = $P1805."new"($P1808, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1810 = $P1804."!make"($P1809)
.annotate "line", 652
    .return ($P1810)
  control_1801:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1811, exception, "payload"
    .return ($P1811)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("99_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1815
.annotate "line", 658
    new $P1814, 'ExceptionHandler'
    set_addr $P1814, control_1813
    $P1814."handle_types"(58)
    push_eh $P1814
    .lex "self", self
    .lex "$/", param_1815
.annotate "line", 659
    find_lex $P1816, "$/"
    get_hll_global $P1817, ["PAST"], "Var"
    find_lex $P1818, "$/"
    unless_null $P1818, vivify_529
    new $P1818, "Hash"
  vivify_529:
    set $P1819, $P1818["quote_EXPR"]
    unless_null $P1819, vivify_530
    new $P1819, "Undef"
  vivify_530:
    $P1820 = $P1819."ast"()
    $P1821 = $P1817."new"($P1820, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1822 = $P1816."!make"($P1821)
.annotate "line", 658
    .return ($P1822)
  control_1813:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1823, exception, "payload"
    .return ($P1823)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("100_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1827
.annotate "line", 664
    new $P1826, 'ExceptionHandler'
    set_addr $P1826, control_1825
    $P1826."handle_types"(58)
    push_eh $P1826
    .lex "self", self
    .lex "$/", param_1827
.annotate "line", 665
    find_lex $P1828, "$/"
    find_lex $P1829, "$/"
    unless_null $P1829, vivify_531
    new $P1829, "Hash"
  vivify_531:
    set $P1830, $P1829["arglist"]
    unless_null $P1830, vivify_532
    new $P1830, "Undef"
  vivify_532:
    $P1831 = $P1830."ast"()
    $P1832 = $P1828."!make"($P1831)
.annotate "line", 664
    .return ($P1832)
  control_1825:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1833, exception, "payload"
    .return ($P1833)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("101_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1837
.annotate "line", 668
    new $P1836, 'ExceptionHandler'
    set_addr $P1836, control_1835
    $P1836."handle_types"(58)
    push_eh $P1836
    .lex "self", self
    .lex "$/", param_1837
.annotate "line", 669
    find_lex $P1838, "$/"
    find_lex $P1841, "$/"
    unless_null $P1841, vivify_533
    new $P1841, "Hash"
  vivify_533:
    set $P1842, $P1841["quote"]
    unless_null $P1842, vivify_534
    new $P1842, "Undef"
  vivify_534:
    if $P1842, if_1840
    find_lex $P1846, "$/"
    unless_null $P1846, vivify_535
    new $P1846, "Hash"
  vivify_535:
    set $P1847, $P1846["number"]
    unless_null $P1847, vivify_536
    new $P1847, "Undef"
  vivify_536:
    $P1848 = $P1847."ast"()
    set $P1839, $P1848
    goto if_1840_end
  if_1840:
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_537
    new $P1843, "Hash"
  vivify_537:
    set $P1844, $P1843["quote"]
    unless_null $P1844, vivify_538
    new $P1844, "Undef"
  vivify_538:
    $P1845 = $P1844."ast"()
    set $P1839, $P1845
  if_1840_end:
    $P1849 = $P1838."!make"($P1839)
.annotate "line", 668
    .return ($P1849)
  control_1835:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1850, exception, "payload"
    .return ($P1850)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("102_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1854
.annotate "line", 672
    new $P1853, 'ExceptionHandler'
    set_addr $P1853, control_1852
    $P1853."handle_types"(58)
    push_eh $P1853
    .lex "self", self
    .lex "$/", param_1854
.annotate "line", 673
    new $P1855, "Undef"
    .lex "$value", $P1855
    find_lex $P1858, "$/"
    unless_null $P1858, vivify_539
    new $P1858, "Hash"
  vivify_539:
    set $P1859, $P1858["dec_number"]
    unless_null $P1859, vivify_540
    new $P1859, "Undef"
  vivify_540:
    if $P1859, if_1857
    find_lex $P1863, "$/"
    unless_null $P1863, vivify_541
    new $P1863, "Hash"
  vivify_541:
    set $P1864, $P1863["integer"]
    unless_null $P1864, vivify_542
    new $P1864, "Undef"
  vivify_542:
    $P1865 = $P1864."ast"()
    set $P1856, $P1865
    goto if_1857_end
  if_1857:
    find_lex $P1860, "$/"
    unless_null $P1860, vivify_543
    new $P1860, "Hash"
  vivify_543:
    set $P1861, $P1860["dec_number"]
    unless_null $P1861, vivify_544
    new $P1861, "Undef"
  vivify_544:
    $P1862 = $P1861."ast"()
    set $P1856, $P1862
  if_1857_end:
    store_lex "$value", $P1856
.annotate "line", 674
    find_lex $P1867, "$/"
    unless_null $P1867, vivify_545
    new $P1867, "Hash"
  vivify_545:
    set $P1868, $P1867["sign"]
    unless_null $P1868, vivify_546
    new $P1868, "Undef"
  vivify_546:
    set $S1869, $P1868
    iseq $I1870, $S1869, "-"
    unless $I1870, if_1866_end
    find_lex $P1871, "$value"
    neg $P1872, $P1871
    store_lex "$value", $P1872
  if_1866_end:
.annotate "line", 675
    find_lex $P1873, "$/"
    get_hll_global $P1874, ["PAST"], "Val"
    find_lex $P1875, "$value"
    $P1876 = $P1874."new"($P1875 :named("value"))
    $P1877 = $P1873."!make"($P1876)
.annotate "line", 672
    .return ($P1877)
  control_1852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1878, exception, "payload"
    .return ($P1878)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("103_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1882
.annotate "line", 678
    new $P1881, 'ExceptionHandler'
    set_addr $P1881, control_1880
    $P1881."handle_types"(58)
    push_eh $P1881
    .lex "self", self
    .lex "$/", param_1882
    find_lex $P1883, "$/"
    find_lex $P1884, "$/"
    unless_null $P1884, vivify_547
    new $P1884, "Hash"
  vivify_547:
    set $P1885, $P1884["quote_EXPR"]
    unless_null $P1885, vivify_548
    new $P1885, "Undef"
  vivify_548:
    $P1886 = $P1885."ast"()
    $P1887 = $P1883."!make"($P1886)
    .return ($P1887)
  control_1880:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1888, exception, "payload"
    .return ($P1888)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("104_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1892
.annotate "line", 679
    new $P1891, 'ExceptionHandler'
    set_addr $P1891, control_1890
    $P1891."handle_types"(58)
    push_eh $P1891
    .lex "self", self
    .lex "$/", param_1892
    find_lex $P1893, "$/"
    find_lex $P1894, "$/"
    unless_null $P1894, vivify_549
    new $P1894, "Hash"
  vivify_549:
    set $P1895, $P1894["quote_EXPR"]
    unless_null $P1895, vivify_550
    new $P1895, "Undef"
  vivify_550:
    $P1896 = $P1895."ast"()
    $P1897 = $P1893."!make"($P1896)
    .return ($P1897)
  control_1890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1898, exception, "payload"
    .return ($P1898)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("105_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1902
.annotate "line", 680
    new $P1901, 'ExceptionHandler'
    set_addr $P1901, control_1900
    $P1901."handle_types"(58)
    push_eh $P1901
    .lex "self", self
    .lex "$/", param_1902
    find_lex $P1903, "$/"
    find_lex $P1904, "$/"
    unless_null $P1904, vivify_551
    new $P1904, "Hash"
  vivify_551:
    set $P1905, $P1904["quote_EXPR"]
    unless_null $P1905, vivify_552
    new $P1905, "Undef"
  vivify_552:
    $P1906 = $P1905."ast"()
    $P1907 = $P1903."!make"($P1906)
    .return ($P1907)
  control_1900:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1908, exception, "payload"
    .return ($P1908)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("106_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1912
.annotate "line", 681
    new $P1911, 'ExceptionHandler'
    set_addr $P1911, control_1910
    $P1911."handle_types"(58)
    push_eh $P1911
    .lex "self", self
    .lex "$/", param_1912
    find_lex $P1913, "$/"
    find_lex $P1914, "$/"
    unless_null $P1914, vivify_553
    new $P1914, "Hash"
  vivify_553:
    set $P1915, $P1914["quote_EXPR"]
    unless_null $P1915, vivify_554
    new $P1915, "Undef"
  vivify_554:
    $P1916 = $P1915."ast"()
    $P1917 = $P1913."!make"($P1916)
    .return ($P1917)
  control_1910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1918, exception, "payload"
    .return ($P1918)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("107_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1922
.annotate "line", 682
    new $P1921, 'ExceptionHandler'
    set_addr $P1921, control_1920
    $P1921."handle_types"(58)
    push_eh $P1921
    .lex "self", self
    .lex "$/", param_1922
    find_lex $P1923, "$/"
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_555
    new $P1924, "Hash"
  vivify_555:
    set $P1925, $P1924["quote_EXPR"]
    unless_null $P1925, vivify_556
    new $P1925, "Undef"
  vivify_556:
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
.sub "quote:sym<Q:PIR>"  :subid("108_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1932
.annotate "line", 683
    new $P1931, 'ExceptionHandler'
    set_addr $P1931, control_1930
    $P1931."handle_types"(58)
    push_eh $P1931
    .lex "self", self
    .lex "$/", param_1932
.annotate "line", 684
    find_lex $P1933, "$/"
    get_hll_global $P1934, ["PAST"], "Op"
    find_lex $P1935, "$/"
    unless_null $P1935, vivify_557
    new $P1935, "Hash"
  vivify_557:
    set $P1936, $P1935["quote_EXPR"]
    unless_null $P1936, vivify_558
    new $P1936, "Undef"
  vivify_558:
    $P1937 = $P1936."ast"()
    $P1938 = $P1937."value"()
    find_lex $P1939, "$/"
    $P1940 = $P1934."new"($P1938 :named("inline"), "inline" :named("pasttype"), $P1939 :named("node"))
    $P1941 = $P1933."!make"($P1940)
.annotate "line", 683
    .return ($P1941)
  control_1930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1942, exception, "payload"
    .return ($P1942)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("109_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1946
.annotate "line", 689
    new $P1945, 'ExceptionHandler'
    set_addr $P1945, control_1944
    $P1945."handle_types"(58)
    push_eh $P1945
    .lex "self", self
    .lex "$/", param_1946
    find_lex $P1947, "$/"
    find_lex $P1948, "$/"
    unless_null $P1948, vivify_559
    new $P1948, "Hash"
  vivify_559:
    set $P1949, $P1948["variable"]
    unless_null $P1949, vivify_560
    new $P1949, "Undef"
  vivify_560:
    $P1950 = $P1949."ast"()
    $P1951 = $P1947."!make"($P1950)
    .return ($P1951)
  control_1944:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1952, exception, "payload"
    .return ($P1952)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("110_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1956
.annotate "line", 690
    new $P1955, 'ExceptionHandler'
    set_addr $P1955, control_1954
    $P1955."handle_types"(58)
    push_eh $P1955
    .lex "self", self
    .lex "$/", param_1956
.annotate "line", 691
    find_lex $P1957, "$/"
    get_hll_global $P1958, ["PAST"], "Op"
.annotate "line", 692
    find_lex $P1959, "$/"
    unless_null $P1959, vivify_561
    new $P1959, "Hash"
  vivify_561:
    set $P1960, $P1959["block"]
    unless_null $P1960, vivify_562
    new $P1960, "Undef"
  vivify_562:
    $P1961 = $P1960."ast"()
    $P1962 = "block_immediate"($P1961)
    find_lex $P1963, "$/"
    $P1964 = $P1958."new"($P1962, "set S*" :named("pirop"), $P1963 :named("node"))
.annotate "line", 691
    $P1965 = $P1957."!make"($P1964)
.annotate "line", 690
    .return ($P1965)
  control_1954:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1966, exception, "payload"
    .return ($P1966)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("111_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1970
.annotate "line", 698
    new $P1969, 'ExceptionHandler'
    set_addr $P1969, control_1968
    $P1969."handle_types"(58)
    push_eh $P1969
    .lex "self", self
    .lex "$/", param_1970
    find_lex $P1971, "$/"
    find_lex $P1972, "$/"
    unless_null $P1972, vivify_563
    new $P1972, "Hash"
  vivify_563:
    set $P1973, $P1972["dotty"]
    unless_null $P1973, vivify_564
    new $P1973, "Undef"
  vivify_564:
    $P1974 = $P1973."ast"()
    $P1975 = $P1971."!make"($P1974)
    .return ($P1975)
  control_1968:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1976, exception, "payload"
    .return ($P1976)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("112_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1980
.annotate "line", 700
    new $P1979, 'ExceptionHandler'
    set_addr $P1979, control_1978
    $P1979."handle_types"(58)
    push_eh $P1979
    .lex "self", self
    .lex "$/", param_1980
.annotate "line", 701
    find_lex $P1981, "$/"
    get_hll_global $P1982, ["PAST"], "Op"
.annotate "line", 702
    new $P1983, "ResizablePMCArray"
    push $P1983, "    clone %r, %0"
    push $P1983, "    inc %0"
    $P1984 = $P1982."new"("postfix:<++>" :named("name"), $P1983 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 701
    $P1985 = $P1981."!make"($P1984)
.annotate "line", 700
    .return ($P1985)
  control_1978:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1986, exception, "payload"
    .return ($P1986)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("113_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_1990
.annotate "line", 706
    new $P1989, 'ExceptionHandler'
    set_addr $P1989, control_1988
    $P1989."handle_types"(58)
    push_eh $P1989
    .lex "self", self
    .lex "$/", param_1990
.annotate "line", 707
    find_lex $P1991, "$/"
    get_hll_global $P1992, ["PAST"], "Op"
.annotate "line", 708
    new $P1993, "ResizablePMCArray"
    push $P1993, "    clone %r, %0"
    push $P1993, "    dec %0"
    $P1994 = $P1992."new"("postfix:<-->" :named("name"), $P1993 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 707
    $P1995 = $P1991."!make"($P1994)
.annotate "line", 706
    .return ($P1995)
  control_1988:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1996, exception, "payload"
    .return ($P1996)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("114_1259779054.5228") :method :outer("11_1259779054.5228")
    .param pmc param_2000
.annotate "line", 712
    new $P1999, 'ExceptionHandler'
    set_addr $P1999, control_1998
    $P1999."handle_types"(58)
    push_eh $P1999
    .lex "self", self
    .lex "$/", param_2000
.annotate "line", 713
    find_lex $P2001, "$/"
    get_hll_global $P2002, ["PAST"], "Op"
.annotate "line", 714
    get_hll_global $P2003, ["PAST"], "Var"
    $P2004 = $P2003."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2005, "$/"
    $P2006 = $P2002."new"($P2004, "callmethod" :named("pasttype"), "!make" :named("name"), $P2005 :named("node"))
.annotate "line", 713
    $P2007 = $P2001."!make"($P2006)
.annotate "line", 712
    .return ($P2007)
  control_1998:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2008, exception, "payload"
    .return ($P2008)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2009"  :subid("115_1259779054.5228") :outer("11_1259779054.5228")
.annotate "line", 722
    .const 'Sub' $P2045 = "119_1259779054.5228" 
    capture_lex $P2045
    .const 'Sub' $P2035 = "118_1259779054.5228" 
    capture_lex $P2035
    .const 'Sub' $P2025 = "117_1259779054.5228" 
    capture_lex $P2025
    .const 'Sub' $P2011 = "116_1259779054.5228" 
    capture_lex $P2011
.annotate "line", 733
    .const 'Sub' $P2045 = "119_1259779054.5228" 
    capture_lex $P2045
.annotate "line", 722
    .return ($P2045)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("116_1259779054.5228") :method :outer("115_1259779054.5228")
    .param pmc param_2014
.annotate "line", 724
    new $P2013, 'ExceptionHandler'
    set_addr $P2013, control_2012
    $P2013."handle_types"(58)
    push_eh $P2013
    .lex "self", self
    .lex "$/", param_2014
.annotate "line", 725
    new $P2015, "Undef"
    .lex "$past", $P2015
    find_lex $P2016, "$/"
    unless_null $P2016, vivify_565
    new $P2016, "Hash"
  vivify_565:
    set $P2017, $P2016["statement"]
    unless_null $P2017, vivify_566
    new $P2017, "Undef"
  vivify_566:
    $P2018 = $P2017."ast"()
    store_lex "$past", $P2018
.annotate "line", 726
    find_lex $P2019, "$/"
    get_hll_global $P2020, ["PAST"], "Regex"
    find_lex $P2021, "$past"
    $P2022 = $P2020."new"($P2021, "pastnode" :named("pasttype"))
    $P2023 = $P2019."!make"($P2022)
.annotate "line", 724
    .return ($P2023)
  control_2012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2024, exception, "payload"
    .return ($P2024)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("117_1259779054.5228") :method :outer("115_1259779054.5228")
    .param pmc param_2028
.annotate "line", 729
    new $P2027, 'ExceptionHandler'
    set_addr $P2027, control_2026
    $P2027."handle_types"(58)
    push_eh $P2027
    .lex "self", self
    .lex "$/", param_2028
    find_lex $P2029, "$/"
    find_lex $P2030, "$/"
    unless_null $P2030, vivify_567
    new $P2030, "Hash"
  vivify_567:
    set $P2031, $P2030["codeblock"]
    unless_null $P2031, vivify_568
    new $P2031, "Undef"
  vivify_568:
    $P2032 = $P2031."ast"()
    $P2033 = $P2029."!make"($P2032)
    .return ($P2033)
  control_2026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2034, exception, "payload"
    .return ($P2034)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("118_1259779054.5228") :method :outer("115_1259779054.5228")
    .param pmc param_2038
.annotate "line", 731
    new $P2037, 'ExceptionHandler'
    set_addr $P2037, control_2036
    $P2037."handle_types"(58)
    push_eh $P2037
    .lex "self", self
    .lex "$/", param_2038
    find_lex $P2039, "$/"
    find_lex $P2040, "$/"
    unless_null $P2040, vivify_569
    new $P2040, "Hash"
  vivify_569:
    set $P2041, $P2040["codeblock"]
    unless_null $P2041, vivify_570
    new $P2041, "Undef"
  vivify_570:
    $P2042 = $P2041."ast"()
    $P2043 = $P2039."!make"($P2042)
    .return ($P2043)
  control_2036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2044, exception, "payload"
    .return ($P2044)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("119_1259779054.5228") :method :outer("115_1259779054.5228")
    .param pmc param_2048
.annotate "line", 733
    new $P2047, 'ExceptionHandler'
    set_addr $P2047, control_2046
    $P2047."handle_types"(58)
    push_eh $P2047
    .lex "self", self
    .lex "$/", param_2048
.annotate "line", 734
    new $P2049, "Undef"
    .lex "$block", $P2049
.annotate "line", 736
    new $P2050, "Undef"
    .lex "$past", $P2050
.annotate "line", 734
    find_lex $P2051, "$/"
    unless_null $P2051, vivify_571
    new $P2051, "Hash"
  vivify_571:
    set $P2052, $P2051["block"]
    unless_null $P2052, vivify_572
    new $P2052, "Undef"
  vivify_572:
    $P2053 = $P2052."ast"()
    store_lex "$block", $P2053
.annotate "line", 735
    find_lex $P2054, "$block"
    $P2054."blocktype"("immediate")
.annotate "line", 737
    get_hll_global $P2055, ["PAST"], "Regex"
.annotate "line", 738
    get_hll_global $P2056, ["PAST"], "Stmts"
.annotate "line", 739
    get_hll_global $P2057, ["PAST"], "Op"
.annotate "line", 740
    get_hll_global $P2058, ["PAST"], "Var"
    $P2059 = $P2058."new"("$/" :named("name"))
.annotate "line", 741
    get_hll_global $P2060, ["PAST"], "Op"
.annotate "line", 742
    get_hll_global $P2061, ["PAST"], "Var"
    $P2062 = $P2061."new"(unicode:"$\x{a2}" :named("name"))
    $P2063 = $P2060."new"($P2062, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 741
    $P2064 = $P2057."new"($P2059, $P2063, "bind" :named("pasttype"))
.annotate "line", 739
    find_lex $P2065, "$block"
    $P2066 = $P2056."new"($P2064, $P2065)
.annotate "line", 738
    $P2067 = $P2055."new"($P2066, "pastnode" :named("pasttype"))
.annotate "line", 737
    store_lex "$past", $P2067
.annotate "line", 752
    find_lex $P2068, "$/"
    find_lex $P2069, "$past"
    $P2070 = $P2068."!make"($P2069)
.annotate "line", 733
    .return ($P2070)
  control_2046:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2071, exception, "payload"
    .return ($P2071)
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
    $P0 = split ' ', 'e=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v parsetrace'
    setattribute nqpproto, '@cmdoptions', $P0
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
