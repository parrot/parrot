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
.sub "_block11"  :anon :subid("10_1267204702.05125")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1296 = $P14()
.annotate "line", 1
    .return ($P1296)
.end


.namespace []
.sub "" :load :init :subid("post331") :outer("10_1267204702.05125")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1267204702.05125" 
    .local pmc block
    set block, $P12
    $P1297 = get_root_global ["parrot"], "P6metaclass"
    $P1297."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1267204702.05125") :outer("10_1267204702.05125")
.annotate "line", 4
    get_hll_global $P1240, ["NQP";"Regex"], "_block1239" 
    capture_lex $P1240
    .const 'Sub' $P1226 = "317_1267204702.05125" 
    capture_lex $P1226
    .const 'Sub' $P1220 = "315_1267204702.05125" 
    capture_lex $P1220
    .const 'Sub' $P1214 = "313_1267204702.05125" 
    capture_lex $P1214
    .const 'Sub' $P1207 = "311_1267204702.05125" 
    capture_lex $P1207
    .const 'Sub' $P1200 = "309_1267204702.05125" 
    capture_lex $P1200
    .const 'Sub' $P1193 = "307_1267204702.05125" 
    capture_lex $P1193
    .const 'Sub' $P1186 = "305_1267204702.05125" 
    capture_lex $P1186
    .const 'Sub' $P1180 = "303_1267204702.05125" 
    capture_lex $P1180
    .const 'Sub' $P1173 = "301_1267204702.05125" 
    capture_lex $P1173
    .const 'Sub' $P1166 = "299_1267204702.05125" 
    capture_lex $P1166
    .const 'Sub' $P1159 = "297_1267204702.05125" 
    capture_lex $P1159
    .const 'Sub' $P1152 = "295_1267204702.05125" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "293_1267204702.05125" 
    capture_lex $P1145
    .const 'Sub' $P1138 = "291_1267204702.05125" 
    capture_lex $P1138
    .const 'Sub' $P1131 = "289_1267204702.05125" 
    capture_lex $P1131
    .const 'Sub' $P1124 = "287_1267204702.05125" 
    capture_lex $P1124
    .const 'Sub' $P1117 = "285_1267204702.05125" 
    capture_lex $P1117
    .const 'Sub' $P1110 = "283_1267204702.05125" 
    capture_lex $P1110
    .const 'Sub' $P1103 = "281_1267204702.05125" 
    capture_lex $P1103
    .const 'Sub' $P1096 = "279_1267204702.05125" 
    capture_lex $P1096
    .const 'Sub' $P1089 = "277_1267204702.05125" 
    capture_lex $P1089
    .const 'Sub' $P1082 = "275_1267204702.05125" 
    capture_lex $P1082
    .const 'Sub' $P1075 = "273_1267204702.05125" 
    capture_lex $P1075
    .const 'Sub' $P1068 = "271_1267204702.05125" 
    capture_lex $P1068
    .const 'Sub' $P1061 = "269_1267204702.05125" 
    capture_lex $P1061
    .const 'Sub' $P1054 = "267_1267204702.05125" 
    capture_lex $P1054
    .const 'Sub' $P1047 = "265_1267204702.05125" 
    capture_lex $P1047
    .const 'Sub' $P1040 = "263_1267204702.05125" 
    capture_lex $P1040
    .const 'Sub' $P1033 = "261_1267204702.05125" 
    capture_lex $P1033
    .const 'Sub' $P1026 = "259_1267204702.05125" 
    capture_lex $P1026
    .const 'Sub' $P1019 = "257_1267204702.05125" 
    capture_lex $P1019
    .const 'Sub' $P1012 = "255_1267204702.05125" 
    capture_lex $P1012
    .const 'Sub' $P1005 = "253_1267204702.05125" 
    capture_lex $P1005
    .const 'Sub' $P998 = "251_1267204702.05125" 
    capture_lex $P998
    .const 'Sub' $P992 = "249_1267204702.05125" 
    capture_lex $P992
    .const 'Sub' $P985 = "247_1267204702.05125" 
    capture_lex $P985
    .const 'Sub' $P978 = "245_1267204702.05125" 
    capture_lex $P978
    .const 'Sub' $P971 = "243_1267204702.05125" 
    capture_lex $P971
    .const 'Sub' $P964 = "241_1267204702.05125" 
    capture_lex $P964
    .const 'Sub' $P957 = "239_1267204702.05125" 
    capture_lex $P957
    .const 'Sub' $P950 = "237_1267204702.05125" 
    capture_lex $P950
    .const 'Sub' $P943 = "235_1267204702.05125" 
    capture_lex $P943
    .const 'Sub' $P937 = "233_1267204702.05125" 
    capture_lex $P937
    .const 'Sub' $P931 = "231_1267204702.05125" 
    capture_lex $P931
    .const 'Sub' $P926 = "229_1267204702.05125" 
    capture_lex $P926
    .const 'Sub' $P920 = "227_1267204702.05125" 
    capture_lex $P920
    .const 'Sub' $P914 = "225_1267204702.05125" 
    capture_lex $P914
    .const 'Sub' $P909 = "223_1267204702.05125" 
    capture_lex $P909
    .const 'Sub' $P904 = "221_1267204702.05125" 
    capture_lex $P904
    .const 'Sub' $P897 = "219_1267204702.05125" 
    capture_lex $P897
    .const 'Sub' $P889 = "217_1267204702.05125" 
    capture_lex $P889
    .const 'Sub' $P884 = "215_1267204702.05125" 
    capture_lex $P884
    .const 'Sub' $P879 = "213_1267204702.05125" 
    capture_lex $P879
    .const 'Sub' $P874 = "211_1267204702.05125" 
    capture_lex $P874
    .const 'Sub' $P866 = "209_1267204702.05125" 
    capture_lex $P866
    .const 'Sub' $P858 = "207_1267204702.05125" 
    capture_lex $P858
    .const 'Sub' $P853 = "205_1267204702.05125" 
    capture_lex $P853
    .const 'Sub' $P848 = "203_1267204702.05125" 
    capture_lex $P848
    .const 'Sub' $P842 = "201_1267204702.05125" 
    capture_lex $P842
    .const 'Sub' $P836 = "199_1267204702.05125" 
    capture_lex $P836
    .const 'Sub' $P830 = "197_1267204702.05125" 
    capture_lex $P830
    .const 'Sub' $P824 = "195_1267204702.05125" 
    capture_lex $P824
    .const 'Sub' $P818 = "193_1267204702.05125" 
    capture_lex $P818
    .const 'Sub' $P813 = "191_1267204702.05125" 
    capture_lex $P813
    .const 'Sub' $P808 = "189_1267204702.05125" 
    capture_lex $P808
    .const 'Sub' $P795 = "185_1267204702.05125" 
    capture_lex $P795
    .const 'Sub' $P787 = "183_1267204702.05125" 
    capture_lex $P787
    .const 'Sub' $P781 = "181_1267204702.05125" 
    capture_lex $P781
    .const 'Sub' $P774 = "179_1267204702.05125" 
    capture_lex $P774
    .const 'Sub' $P768 = "177_1267204702.05125" 
    capture_lex $P768
    .const 'Sub' $P760 = "175_1267204702.05125" 
    capture_lex $P760
    .const 'Sub' $P752 = "173_1267204702.05125" 
    capture_lex $P752
    .const 'Sub' $P746 = "171_1267204702.05125" 
    capture_lex $P746
    .const 'Sub' $P740 = "169_1267204702.05125" 
    capture_lex $P740
    .const 'Sub' $P725 = "165_1267204702.05125" 
    capture_lex $P725
    .const 'Sub' $P688 = "163_1267204702.05125" 
    capture_lex $P688
    .const 'Sub' $P680 = "161_1267204702.05125" 
    capture_lex $P680
    .const 'Sub' $P674 = "159_1267204702.05125" 
    capture_lex $P674
    .const 'Sub' $P664 = "157_1267204702.05125" 
    capture_lex $P664
    .const 'Sub' $P649 = "155_1267204702.05125" 
    capture_lex $P649
    .const 'Sub' $P640 = "153_1267204702.05125" 
    capture_lex $P640
    .const 'Sub' $P621 = "151_1267204702.05125" 
    capture_lex $P621
    .const 'Sub' $P597 = "149_1267204702.05125" 
    capture_lex $P597
    .const 'Sub' $P590 = "147_1267204702.05125" 
    capture_lex $P590
    .const 'Sub' $P583 = "145_1267204702.05125" 
    capture_lex $P583
    .const 'Sub' $P573 = "141_1267204702.05125" 
    capture_lex $P573
    .const 'Sub' $P562 = "139_1267204702.05125" 
    capture_lex $P562
    .const 'Sub' $P555 = "137_1267204702.05125" 
    capture_lex $P555
    .const 'Sub' $P548 = "135_1267204702.05125" 
    capture_lex $P548
    .const 'Sub' $P541 = "133_1267204702.05125" 
    capture_lex $P541
    .const 'Sub' $P514 = "129_1267204702.05125" 
    capture_lex $P514
    .const 'Sub' $P505 = "127_1267204702.05125" 
    capture_lex $P505
    .const 'Sub' $P498 = "125_1267204702.05125" 
    capture_lex $P498
    .const 'Sub' $P489 = "121_1267204702.05125" 
    capture_lex $P489
    .const 'Sub' $P484 = "119_1267204702.05125" 
    capture_lex $P484
    .const 'Sub' $P472 = "117_1267204702.05125" 
    capture_lex $P472
    .const 'Sub' $P460 = "115_1267204702.05125" 
    capture_lex $P460
    .const 'Sub' $P452 = "113_1267204702.05125" 
    capture_lex $P452
    .const 'Sub' $P447 = "111_1267204702.05125" 
    capture_lex $P447
    .const 'Sub' $P441 = "109_1267204702.05125" 
    capture_lex $P441
    .const 'Sub' $P435 = "107_1267204702.05125" 
    capture_lex $P435
    .const 'Sub' $P429 = "105_1267204702.05125" 
    capture_lex $P429
    .const 'Sub' $P423 = "103_1267204702.05125" 
    capture_lex $P423
    .const 'Sub' $P417 = "101_1267204702.05125" 
    capture_lex $P417
    .const 'Sub' $P411 = "99_1267204702.05125" 
    capture_lex $P411
    .const 'Sub' $P405 = "97_1267204702.05125" 
    capture_lex $P405
    .const 'Sub' $P399 = "95_1267204702.05125" 
    capture_lex $P399
    .const 'Sub' $P391 = "93_1267204702.05125" 
    capture_lex $P391
    .const 'Sub' $P383 = "91_1267204702.05125" 
    capture_lex $P383
    .const 'Sub' $P371 = "87_1267204702.05125" 
    capture_lex $P371
    .const 'Sub' $P363 = "85_1267204702.05125" 
    capture_lex $P363
    .const 'Sub' $P353 = "81_1267204702.05125" 
    capture_lex $P353
    .const 'Sub' $P346 = "79_1267204702.05125" 
    capture_lex $P346
    .const 'Sub' $P339 = "77_1267204702.05125" 
    capture_lex $P339
    .const 'Sub' $P327 = "73_1267204702.05125" 
    capture_lex $P327
    .const 'Sub' $P319 = "71_1267204702.05125" 
    capture_lex $P319
    .const 'Sub' $P311 = "69_1267204702.05125" 
    capture_lex $P311
    .const 'Sub' $P291 = "67_1267204702.05125" 
    capture_lex $P291
    .const 'Sub' $P282 = "65_1267204702.05125" 
    capture_lex $P282
    .const 'Sub' $P264 = "62_1267204702.05125" 
    capture_lex $P264
    .const 'Sub' $P244 = "60_1267204702.05125" 
    capture_lex $P244
    .const 'Sub' $P235 = "56_1267204702.05125" 
    capture_lex $P235
    .const 'Sub' $P230 = "54_1267204702.05125" 
    capture_lex $P230
    .const 'Sub' $P221 = "50_1267204702.05125" 
    capture_lex $P221
    .const 'Sub' $P216 = "48_1267204702.05125" 
    capture_lex $P216
    .const 'Sub' $P208 = "46_1267204702.05125" 
    capture_lex $P208
    .const 'Sub' $P201 = "44_1267204702.05125" 
    capture_lex $P201
    .const 'Sub' $P195 = "42_1267204702.05125" 
    capture_lex $P195
    .const 'Sub' $P187 = "40_1267204702.05125" 
    capture_lex $P187
    .const 'Sub' $P181 = "38_1267204702.05125" 
    capture_lex $P181
    .const 'Sub' $P175 = "36_1267204702.05125" 
    capture_lex $P175
    .const 'Sub' $P159 = "33_1267204702.05125" 
    capture_lex $P159
    .const 'Sub' $P146 = "31_1267204702.05125" 
    capture_lex $P146
    .const 'Sub' $P139 = "29_1267204702.05125" 
    capture_lex $P139
    .const 'Sub' $P96 = "26_1267204702.05125" 
    capture_lex $P96
    .const 'Sub' $P78 = "23_1267204702.05125" 
    capture_lex $P78
    .const 'Sub' $P68 = "21_1267204702.05125" 
    capture_lex $P68
    .const 'Sub' $P54 = "19_1267204702.05125" 
    capture_lex $P54
    .const 'Sub' $P46 = "17_1267204702.05125" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1267204702.05125" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1267204702.05125" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1267204702.05125" 
    capture_lex $P15
.annotate "line", 531
    get_hll_global $P1240, ["NQP";"Regex"], "_block1239" 
    capture_lex $P1240
    $P1279 = $P1240()
.annotate "line", 4
    .return ($P1279)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post332") :outer("11_1267204702.05125")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 418
    get_hll_global $P1280, ["NQP"], "Grammar"
    $P1280."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 419
    get_hll_global $P1281, ["NQP"], "Grammar"
    $P1281."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 420
    get_hll_global $P1282, ["NQP"], "Grammar"
    $P1282."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 421
    get_hll_global $P1283, ["NQP"], "Grammar"
    $P1283."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 422
    get_hll_global $P1284, ["NQP"], "Grammar"
    $P1284."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 423
    get_hll_global $P1285, ["NQP"], "Grammar"
    $P1285."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 424
    get_hll_global $P1286, ["NQP"], "Grammar"
    $P1286."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 425
    get_hll_global $P1287, ["NQP"], "Grammar"
    $P1287."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 426
    get_hll_global $P1288, ["NQP"], "Grammar"
    $P1288."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 427
    get_hll_global $P1289, ["NQP"], "Grammar"
    $P1289."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 428
    get_hll_global $P1290, ["NQP"], "Grammar"
    $P1290."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 429
    get_hll_global $P1291, ["NQP"], "Grammar"
    $P1291."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 430
    get_hll_global $P1292, ["NQP"], "Grammar"
    $P1292."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 431
    get_hll_global $P1293, ["NQP"], "Grammar"
    $P1293."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 432
    get_hll_global $P1294, ["NQP"], "Grammar"
    $P1294."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 417
    $P1295 = get_root_global ["parrot"], "P6metaclass"
    $P1295."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
.annotate "line", 5
    $P18 = root_new ['parrot';'Hash']
    .lex "%*LANG", $P18
.annotate "line", 10
    new $P19, "Undef"
    .lex "$*SCOPE", $P19
.annotate "line", 4
    find_lex $P20, "%*LANG"
    unless_null $P20, vivify_333
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_334
    die "Contextual %*LANG not found"
  vivify_334:
  vivify_333:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_335
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_336
    die "Contextual %*LANG not found"
  vivify_336:
    store_lex "%*LANG", $P22
  vivify_335:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_337
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_338
    die "Contextual %*LANG not found"
  vivify_338:
    store_lex "%*LANG", $P24
  vivify_337:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_339
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_340
    die "Contextual %*LANG not found"
  vivify_340:
    store_lex "%*LANG", $P26
  vivify_339:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_341
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_342
    die "Contextual %*LANG not found"
  vivify_342:
    store_lex "%*LANG", $P28
  vivify_341:
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
.sub "identifier"  :subid("13_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__identifier"  :subid("14_1267204702.05125") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__name"  :subid("16_1267204702.05125") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__deflongname"  :subid("18_1267204702.05125") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1267204702.05125") :method
.annotate "line", 4
    new $P57, "ResizablePMCArray"
    push $P57, ""
    .return ($P57)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__ws"  :subid("22_1267204702.05125") :method
.annotate "line", 4
    new $P71, "ResizablePMCArray"
    push $P71, ""
    push $P71, ""
    .return ($P71)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .const 'Sub' $P86 = "25_1267204702.05125" 
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
    .const 'Sub' $P86 = "25_1267204702.05125" 
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
.sub "!PREFIX__unv"  :subid("24_1267204702.05125") :method
.annotate "line", 4
    new $P81, "ResizablePMCArray"
    push $P81, ""
    push $P81, ""
    push $P81, ""
    .return ($P81)
.end


.namespace ["NQP";"Grammar"]
.sub "_block85"  :anon :subid("25_1267204702.05125") :method :outer("23_1267204702.05125")
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
.sub "pod_comment"  :subid("26_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1267204702.05125" 
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
    .const 'Sub' $P131 = "28_1267204702.05125" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1267204702.05125") :method
.annotate "line", 4
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1267204702.05125") :method :outer("26_1267204702.05125")
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
.sub "comp_unit"  :subid("29_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__comp_unit"  :subid("30_1267204702.05125") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1267204702.05125") :method :outer("11_1267204702.05125")
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
.sub "!PREFIX__statementlist"  :subid("32_1267204702.05125") :method
.annotate "line", 4
    new $P149, "ResizablePMCArray"
    push $P149, ""
    push $P149, ""
    .return ($P149)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .const 'Sub' $P165 = "35_1267204702.05125" 
    capture_lex $P165
    .local string rx160_tgt
    .local int rx160_pos
    .local int rx160_off
    .local int rx160_eos
    .local int rx160_rep
    .local pmc rx160_cur
    (rx160_cur, rx160_pos, rx160_tgt) = self."!cursor_start"()
    rx160_cur."!cursor_debug"("START ", "statement")
    rx160_cur."!cursor_caparray"("statement_mod_cond", "statement_mod_loop")
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
    .const 'Sub' $P165 = "35_1267204702.05125" 
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
.annotate "line", 97
  # rx rxquantr170 ** 0..1
    set_addr $I174, rxquantr170_done
    rx160_cur."!mark_push"(0, rx160_pos, $I174)
  rxquantr170_loop:
  alt171_0:
.annotate "line", 93
    set_addr $I10, alt171_1
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 94
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."MARKED"("endstmt")
    unless $P10, rx160_fail
    goto alt171_end
  alt171_1:
    set_addr $I10, alt171_2
    rx160_cur."!mark_push"(0, rx160_pos, $I10)
.annotate "line", 95
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
  alt171_2:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx160_cur."!cursor_pos"(rx160_pos)
    $P10 = rx160_cur."statement_mod_loop"()
    unless $P10, rx160_fail
    rx160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx160_pos = $P10."pos"()
  alt171_end:
.annotate "line", 97
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
.sub "!PREFIX__statement"  :subid("34_1267204702.05125") :method
.annotate "line", 4
    new $P162, "ResizablePMCArray"
    push $P162, ""
    .return ($P162)
.end


.namespace ["NQP";"Grammar"]
.sub "_block164"  :anon :subid("35_1267204702.05125") :method :outer("33_1267204702.05125")
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
.sub "eat_terminator"  :subid("36_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 101
    set_addr $I10, alt180_1
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 102
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
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."MARKED"("endstmt")
    unless $P10, rx176_fail
    goto alt180_end
  alt180_2:
    set_addr $I10, alt180_3
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx176_cur."!cursor_pos"(rx176_pos)
    $P10 = rx176_cur."terminator"()
    unless $P10, rx176_fail
    goto alt180_end
  alt180_3:
.annotate "line", 105
  # rxanchor eos
    ne rx176_pos, rx176_eos, rx176_fail
  alt180_end:
.annotate "line", 101
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
.sub "!PREFIX__eat_terminator"  :subid("37_1267204702.05125") :method
.annotate "line", 4
    new $P178, "ResizablePMCArray"
    push $P178, ""
    push $P178, ""
    push $P178, ""
    push $P178, ";"
    .return ($P178)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 109
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
.annotate "line", 108
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
.sub "!PREFIX__xblock"  :subid("39_1267204702.05125") :method
.annotate "line", 4
    $P184 = self."!PREFIX__!subrule"("EXPR", "")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 112
    set_addr $I10, alt194_1
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."lambda"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."signature"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx188_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 113
    goto alt194_end
  alt194_1:
    set_addr $I10, alt194_2
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx188_pos, rx188_eos, rx188_fail
    sub $I10, rx188_pos, rx188_off
    substr $S10, rx188_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx188_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."newpad"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."blockoid"()
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx188_pos = $P10."pos"()
.annotate "line", 117
    goto alt194_end
  alt194_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."panic"("Missing block")
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
  alt194_end:
.annotate "line", 112
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
.sub "!PREFIX__pblock"  :subid("41_1267204702.05125") :method
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
.sub "lambda"  :subid("42_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 123
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
.sub "!PREFIX__lambda"  :subid("43_1267204702.05125") :method
.annotate "line", 4
    new $P198, "ResizablePMCArray"
    push $P198, "<->"
    push $P198, "->"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 126
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
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."newpad"()
    unless $P10, rx202_fail
    rx202_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."blockoid"()
    unless $P10, rx202_fail
    rx202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx202_pos = $P10."pos"()
.annotate "line", 125
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
.sub "!PREFIX__block"  :subid("45_1267204702.05125") :method
.annotate "line", 4
    $P204 = self."!PREFIX__!subrule"("", "")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    push $P205, "{"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."finishpad"()
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
.annotate "line", 133
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
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."ENDSTMT"()
    unless $P10, rx209_fail
.annotate "line", 131
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
.sub "!PREFIX__blockoid"  :subid("47_1267204702.05125") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 137
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
.sub "!PREFIX__newpad"  :subid("49_1267204702.05125") :method
.annotate "line", 4
    new $P219, "ResizablePMCArray"
    push $P219, ""
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 138
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
.sub "!PREFIX__finishpad"  :subid("51_1267204702.05125") :method
.annotate "line", 4
    new $P224, "ResizablePMCArray"
    push $P224, ""
    .return ($P224)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1267204702.05125") :method
.annotate "line", 140
    $P227 = self."!protoregex"("terminator")
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1267204702.05125") :method
.annotate "line", 140
    $P229 = self."!PREFIX__!protoregex"("terminator")
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 142
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
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1267204702.05125") :method
.annotate "line", 4
    new $P233, "ResizablePMCArray"
    push $P233, ";"
    .return ($P233)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 143
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
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1267204702.05125") :method
.annotate "line", 4
    new $P238, "ResizablePMCArray"
    push $P238, "}"
    .return ($P238)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1267204702.05125") :method
.annotate "line", 147
    $P241 = self."!protoregex"("statement_control")
    .return ($P241)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1267204702.05125") :method
.annotate "line", 147
    $P243 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 150
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
.annotate "line", 151
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
.annotate "line", 152
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
.annotate "line", 153
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
.annotate "line", 149
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1267204702.05125") :method
.annotate "line", 4
    new $P247, "ResizablePMCArray"
    push $P247, "if"
    .return ($P247)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .const 'Sub' $P275 = "64_1267204702.05125" 
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
.annotate "line", 157
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
.annotate "line", 158
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
.annotate "line", 159
    set_addr $I10, alt272_1
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx265_cur."!cursor_pos"(rx265_pos)
    $P10 = rx265_cur."ws"()
    unless $P10, rx265_fail
    rx265_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx265_cur."!cursor_pos"(rx265_pos)
    .const 'Sub' $P275 = "64_1267204702.05125" 
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
.annotate "line", 156
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1267204702.05125") :method
.annotate "line", 4
    new $P267, "ResizablePMCArray"
    push $P267, "unless"
    .return ($P267)
.end


.namespace ["NQP";"Grammar"]
.sub "_block274"  :anon :subid("64_1267204702.05125") :method :outer("62_1267204702.05125")
.annotate "line", 159
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
.sub "statement_control:sym<while>"  :subid("65_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 163
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
.annotate "line", 164
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
.annotate "line", 162
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1267204702.05125") :method
.annotate "line", 4
    new $P285, "ResizablePMCArray"
    push $P285, "until"
    push $P285, "while"
    .return ($P285)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 168
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
.annotate "line", 169
    set_addr $I10, alt298_1
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
.annotate "line", 170
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
.annotate "line", 171
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
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
.annotate "line", 167
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1267204702.05125") :method
.annotate "line", 4
    new $P294, "ResizablePMCArray"
    push $P294, "repeat"
    .return ($P294)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 176
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
.annotate "line", 177
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
.annotate "line", 175
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1267204702.05125") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, "for"
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 181
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
.annotate "line", 182
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
.annotate "line", 180
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
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1267204702.05125") :method
.annotate "line", 4
    new $P322, "ResizablePMCArray"
    push $P322, "CATCH"
    .return ($P322)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 186
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
.annotate "line", 187
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
.annotate "line", 185
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
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1267204702.05125") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "CONTROL"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1267204702.05125") :method
.annotate "line", 190
    $P336 = self."!protoregex"("statement_prefix")
    .return ($P336)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1267204702.05125") :method
.annotate "line", 190
    $P338 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 191
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1267204702.05125") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 194
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
.annotate "line", 195
  # rx subrule "blorst" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."blorst"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx347_pos = $P10."pos"()
.annotate "line", 193
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
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1267204702.05125") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("blorst", "try")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 199
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
.annotate "line", 198
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
.sub "!PREFIX__blorst"  :subid("82_1267204702.05125") :method
.annotate "line", 4
    new $P356, "ResizablePMCArray"
    push $P356, ""
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1267204702.05125") :method
.annotate "line", 204
    $P360 = self."!protoregex"("statement_mod_cond")
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1267204702.05125") :method
.annotate "line", 204
    $P362 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P362)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 206
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1267204702.05125") :method
.annotate "line", 4
    new $P366, "ResizablePMCArray"
    push $P366, "if"
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 207
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1267204702.05125") :method
.annotate "line", 4
    new $P374, "ResizablePMCArray"
    push $P374, "unless"
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1267204702.05125") :method
.annotate "line", 209
    $P380 = self."!protoregex"("statement_mod_loop")
    .return ($P380)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1267204702.05125") :method
.annotate "line", 209
    $P382 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 211
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1267204702.05125") :method
.annotate "line", 4
    new $P386, "ResizablePMCArray"
    push $P386, "while"
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1267204702.05125") :method :outer("11_1267204702.05125")
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
.annotate "line", 212
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1267204702.05125") :method
.annotate "line", 4
    new $P394, "ResizablePMCArray"
    push $P394, "until"
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<fatarrow>"  :subid("95_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "term:sym<fatarrow>")
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
.annotate "line", 216
  # rx subrule "fatarrow" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."fatarrow"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("fatarrow")
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "term:sym<fatarrow>")
    rx400_cur."!cursor_debug"("PASS  ", "term:sym<fatarrow>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate "line", 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "term:sym<fatarrow>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<fatarrow>"  :subid("96_1267204702.05125") :method
.annotate "line", 4
    $P402 = self."!PREFIX__!subrule"("fatarrow", "")
    new $P403, "ResizablePMCArray"
    push $P403, $P402
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("97_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "term:sym<colonpair>")
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
.annotate "line", 217
  # rx subrule "colonpair" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."colonpair"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "term:sym<colonpair>")
    rx406_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("98_1267204702.05125") :method
.annotate "line", 4
    $P408 = self."!PREFIX__!subrule"("colonpair", "")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("99_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt) = self."!cursor_start"()
    rx412_cur."!cursor_debug"("START ", "term:sym<variable>")
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
.annotate "line", 218
  # rx subrule "variable" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."variable"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<variable>")
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_fail:
.annotate "line", 4
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("100_1267204702.05125") :method
.annotate "line", 4
    $P414 = self."!PREFIX__!subrule"("variable", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("101_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
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
.annotate "line", 219
  # rx subrule "package_declarator" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."package_declarator"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<package_declarator>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("102_1267204702.05125") :method
.annotate "line", 4
    $P420 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("103_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
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
.annotate "line", 220
  # rx subrule "scope_declarator" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."scope_declarator"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<scope_declarator>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate "line", 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("104_1267204702.05125") :method
.annotate "line", 4
    $P426 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("105_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
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
.annotate "line", 221
  # rx subrule "routine_declarator" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."routine_declarator"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<routine_declarator>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate "line", 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("106_1267204702.05125") :method
.annotate "line", 4
    $P432 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("107_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
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
.annotate "line", 222
  # rx subrule "regex_declarator" subtype=capture negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."regex_declarator"()
    unless $P10, rx436_fail
    rx436_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "term:sym<regex_declarator>")
    rx436_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate "line", 4
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("108_1267204702.05125") :method
.annotate "line", 4
    $P438 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("109_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
.annotate "line", 223
  # rx subrule "statement_prefix" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."statement_prefix"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "term:sym<statement_prefix>")
    rx442_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate "line", 4
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("110_1267204702.05125") :method
.annotate "line", 4
    $P444 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("111_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    (rx448_cur, rx448_pos, rx448_tgt) = self."!cursor_start"()
    rx448_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx448_cur
    .local pmc match
    .lex "$/", match
    length rx448_eos, rx448_tgt
    set rx448_off, 0
    lt rx448_pos, 2, rx448_start
    sub rx448_off, rx448_pos, 1
    substr rx448_tgt, rx448_tgt, rx448_off
  rx448_start:
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
.annotate "line", 224
  # rx subrule "lambda" subtype=zerowidth negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."lambda"()
    unless $P10, rx448_fail
  # rx subrule "pblock" subtype=capture negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."pblock"()
    unless $P10, rx448_fail
    rx448_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "term:sym<lambda>")
    rx448_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx448_pos)
    .return (rx448_cur)
  rx448_fail:
.annotate "line", 4
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    rx448_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx448_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("112_1267204702.05125") :method
.annotate "line", 4
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "fatarrow"  :subid("113_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "fatarrow")
    .lex unicode:"$\x{a2}", rx453_cur
    .local pmc match
    .lex "$/", match
    length rx453_eos, rx453_tgt
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
.annotate "line", 227
  # rx subrule "identifier" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."identifier"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    rx453_pos = $P10."pos"()
  # rx rxquantr458 ** 0..*
    set_addr $I459, rxquantr458_done
    rx453_cur."!mark_push"(0, rx453_pos, $I459)
  rxquantr458_loop:
  # rx enumcharlist negate=0 
    ge rx453_pos, rx453_eos, rx453_fail
    sub $I10, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx453_fail
    inc rx453_pos
    (rx453_rep) = rx453_cur."!mark_commit"($I459)
    rx453_cur."!mark_push"(rx453_rep, rx453_pos, $I459)
    goto rxquantr458_loop
  rxquantr458_done:
  # rx literal  "=>"
    add $I11, rx453_pos, 2
    gt $I11, rx453_eos, rx453_fail
    sub $I11, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I11, 2
    ne $S10, "=>", rx453_fail
    add rx453_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."ws"()
    unless $P10, rx453_fail
    rx453_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."EXPR"("i=")
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    rx453_pos = $P10."pos"()
.annotate "line", 226
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "fatarrow")
    rx453_cur."!cursor_debug"("PASS  ", "fatarrow", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate "line", 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "fatarrow")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__fatarrow"  :subid("114_1267204702.05125") :method
.annotate "line", 4
    $P455 = self."!PREFIX__!subrule"("key", "")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("115_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx461_tgt
    .local int rx461_pos
    .local int rx461_off
    .local int rx461_eos
    .local int rx461_rep
    .local pmc rx461_cur
    (rx461_cur, rx461_pos, rx461_tgt) = self."!cursor_start"()
    rx461_cur."!cursor_debug"("START ", "colonpair")
    rx461_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx461_cur
    .local pmc match
    .lex "$/", match
    length rx461_eos, rx461_tgt
    set rx461_off, 0
    lt rx461_pos, 2, rx461_start
    sub rx461_off, rx461_pos, 1
    substr rx461_tgt, rx461_tgt, rx461_off
  rx461_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx461_cur."from"()
    inc $P10
    set rx461_pos, $P10
    ge rx461_pos, rx461_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  rxscan467_done:
.annotate "line", 231
  # rx literal  ":"
    add $I11, rx461_pos, 1
    gt $I11, rx461_eos, rx461_fail
    sub $I11, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I11, 1
    ne $S10, ":", rx461_fail
    add rx461_pos, 1
  alt468_0:
.annotate "line", 232
    set_addr $I10, alt468_1
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
.annotate "line", 233
  # rx subcapture "not"
    set_addr $I10, rxcap_469_fail
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  # rx literal  "!"
    add $I11, rx461_pos, 1
    gt $I11, rx461_eos, rx461_fail
    sub $I11, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I11, 1
    ne $S10, "!", rx461_fail
    add rx461_pos, 1
    set_addr $I10, rxcap_469_fail
    ($I12, $I11) = rx461_cur."!mark_peek"($I10)
    rx461_cur."!cursor_pos"($I11)
    ($P10) = rx461_cur."!cursor_start"()
    $P10."!cursor_pass"(rx461_pos, "")
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_469_done
  rxcap_469_fail:
    goto rx461_fail
  rxcap_469_done:
  # rx subrule "identifier" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."identifier"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx461_pos = $P10."pos"()
    goto alt468_end
  alt468_1:
    set_addr $I10, alt468_2
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
.annotate "line", 234
  # rx subrule "identifier" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."identifier"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx461_pos = $P10."pos"()
  # rx rxquantr470 ** 0..1
    set_addr $I471, rxquantr470_done
    rx461_cur."!mark_push"(0, rx461_pos, $I471)
  rxquantr470_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."circumfix"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx461_pos = $P10."pos"()
    (rx461_rep) = rx461_cur."!mark_commit"($I471)
  rxquantr470_done:
    goto alt468_end
  alt468_2:
.annotate "line", 235
  # rx subrule "circumfix" subtype=capture negate=
    rx461_cur."!cursor_pos"(rx461_pos)
    $P10 = rx461_cur."circumfix"()
    unless $P10, rx461_fail
    rx461_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx461_pos = $P10."pos"()
  alt468_end:
.annotate "line", 230
  # rx pass
    rx461_cur."!cursor_pass"(rx461_pos, "colonpair")
    rx461_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx461_pos)
    .return (rx461_cur)
  rx461_fail:
.annotate "line", 4
    (rx461_rep, rx461_pos, $I10, $P10) = rx461_cur."!mark_fail"(0)
    lt rx461_pos, -1, rx461_done
    eq rx461_pos, -1, rx461_fail
    jump $I10
  rx461_done:
    rx461_cur."!cursor_fail"()
    rx461_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx461_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("116_1267204702.05125") :method
.annotate "line", 4
    $P463 = self."!PREFIX__!subrule"("circumfix", ":")
    $P464 = self."!PREFIX__!subrule"("identifier", ":")
    $P465 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P466, "ResizablePMCArray"
    push $P466, $P463
    push $P466, $P464
    push $P466, $P465
    .return ($P466)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("117_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx473_tgt
    .local int rx473_pos
    .local int rx473_off
    .local int rx473_eos
    .local int rx473_rep
    .local pmc rx473_cur
    (rx473_cur, rx473_pos, rx473_tgt) = self."!cursor_start"()
    rx473_cur."!cursor_debug"("START ", "variable")
    rx473_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx473_cur
    .local pmc match
    .lex "$/", match
    length rx473_eos, rx473_tgt
    set rx473_off, 0
    lt rx473_pos, 2, rx473_start
    sub rx473_off, rx473_pos, 1
    substr rx473_tgt, rx473_tgt, rx473_off
  rx473_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx473_cur."from"()
    inc $P10
    set rx473_pos, $P10
    ge rx473_pos, rx473_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  rxscan478_done:
  alt479_0:
.annotate "line", 239
    set_addr $I10, alt479_1
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
.annotate "line", 240
  # rx subrule "sigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."sigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx473_pos = $P10."pos"()
  # rx rxquantr480 ** 0..1
    set_addr $I481, rxquantr480_done
    rx473_cur."!mark_push"(0, rx473_pos, $I481)
  rxquantr480_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."twigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx473_pos = $P10."pos"()
    (rx473_rep) = rx473_cur."!mark_commit"($I481)
  rxquantr480_done:
  # rx subrule "name" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."name"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx473_pos = $P10."pos"()
    goto alt479_end
  alt479_1:
    set_addr $I10, alt479_2
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
.annotate "line", 241
  # rx subrule "sigil" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."sigil"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx473_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx473_pos, rx473_eos, rx473_fail
    sub $I10, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx473_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."postcircumfix"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx473_pos = $P10."pos"()
    goto alt479_end
  alt479_2:
.annotate "line", 242
  # rx subcapture "sigil"
    set_addr $I10, rxcap_482_fail
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  # rx literal  "$"
    add $I11, rx473_pos, 1
    gt $I11, rx473_eos, rx473_fail
    sub $I11, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I11, 1
    ne $S10, "$", rx473_fail
    add rx473_pos, 1
    set_addr $I10, rxcap_482_fail
    ($I12, $I11) = rx473_cur."!mark_peek"($I10)
    rx473_cur."!cursor_pos"($I11)
    ($P10) = rx473_cur."!cursor_start"()
    $P10."!cursor_pass"(rx473_pos, "")
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_482_done
  rxcap_482_fail:
    goto rx473_fail
  rxcap_482_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_483_fail
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx473_pos, rx473_eos, rx473_fail
    sub $I10, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx473_fail
    inc rx473_pos
    set_addr $I10, rxcap_483_fail
    ($I12, $I11) = rx473_cur."!mark_peek"($I10)
    rx473_cur."!cursor_pos"($I11)
    ($P10) = rx473_cur."!cursor_start"()
    $P10."!cursor_pass"(rx473_pos, "")
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_483_done
  rxcap_483_fail:
    goto rx473_fail
  rxcap_483_done:
  alt479_end:
.annotate "line", 239
  # rx pass
    rx473_cur."!cursor_pass"(rx473_pos, "variable")
    rx473_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx473_pos)
    .return (rx473_cur)
  rx473_fail:
.annotate "line", 4
    (rx473_rep, rx473_pos, $I10, $P10) = rx473_cur."!mark_fail"(0)
    lt rx473_pos, -1, rx473_done
    eq rx473_pos, -1, rx473_fail
    jump $I10
  rx473_done:
    rx473_cur."!cursor_fail"()
    rx473_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx473_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("118_1267204702.05125") :method
.annotate "line", 4
    $P475 = self."!PREFIX__!subrule"("sigil", "")
    $P476 = self."!PREFIX__!subrule"("sigil", "")
    new $P477, "ResizablePMCArray"
    push $P477, "$!"
    push $P477, "$_"
    push $P477, "$/"
    push $P477, $P475
    push $P477, $P476
    .return ($P477)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("119_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx485_tgt
    .local int rx485_pos
    .local int rx485_off
    .local int rx485_eos
    .local int rx485_rep
    .local pmc rx485_cur
    (rx485_cur, rx485_pos, rx485_tgt) = self."!cursor_start"()
    rx485_cur."!cursor_debug"("START ", "sigil")
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
    ne $I10, -1, rxscan488_done
    goto rxscan488_scan
  rxscan488_loop:
    ($P10) = rx485_cur."from"()
    inc $P10
    set rx485_pos, $P10
    ge rx485_pos, rx485_eos, rxscan488_done
  rxscan488_scan:
    set_addr $I10, rxscan488_loop
    rx485_cur."!mark_push"(0, rx485_pos, $I10)
  rxscan488_done:
.annotate "line", 245
  # rx enumcharlist negate=0 
    ge rx485_pos, rx485_eos, rx485_fail
    sub $I10, rx485_pos, rx485_off
    substr $S10, rx485_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx485_fail
    inc rx485_pos
  # rx pass
    rx485_cur."!cursor_pass"(rx485_pos, "sigil")
    rx485_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx485_pos)
    .return (rx485_cur)
  rx485_fail:
.annotate "line", 4
    (rx485_rep, rx485_pos, $I10, $P10) = rx485_cur."!mark_fail"(0)
    lt rx485_pos, -1, rx485_done
    eq rx485_pos, -1, rx485_fail
    jump $I10
  rx485_done:
    rx485_cur."!cursor_fail"()
    rx485_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx485_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("120_1267204702.05125") :method
.annotate "line", 4
    new $P487, "ResizablePMCArray"
    push $P487, "&"
    push $P487, "%"
    push $P487, "@"
    push $P487, "$"
    .return ($P487)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("121_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx490_tgt
    .local int rx490_pos
    .local int rx490_off
    .local int rx490_eos
    .local int rx490_rep
    .local pmc rx490_cur
    (rx490_cur, rx490_pos, rx490_tgt) = self."!cursor_start"()
    rx490_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx490_cur
    .local pmc match
    .lex "$/", match
    length rx490_eos, rx490_tgt
    set rx490_off, 0
    lt rx490_pos, 2, rx490_start
    sub rx490_off, rx490_pos, 1
    substr rx490_tgt, rx490_tgt, rx490_off
  rx490_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan493_done
    goto rxscan493_scan
  rxscan493_loop:
    ($P10) = rx490_cur."from"()
    inc $P10
    set rx490_pos, $P10
    ge rx490_pos, rx490_eos, rxscan493_done
  rxscan493_scan:
    set_addr $I10, rxscan493_loop
    rx490_cur."!mark_push"(0, rx490_pos, $I10)
  rxscan493_done:
.annotate "line", 247
  # rx enumcharlist negate=0 
    ge rx490_pos, rx490_eos, rx490_fail
    sub $I10, rx490_pos, rx490_off
    substr $S10, rx490_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx490_fail
    inc rx490_pos
  # rx pass
    rx490_cur."!cursor_pass"(rx490_pos, "twigil")
    rx490_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx490_pos)
    .return (rx490_cur)
  rx490_fail:
.annotate "line", 4
    (rx490_rep, rx490_pos, $I10, $P10) = rx490_cur."!mark_fail"(0)
    lt rx490_pos, -1, rx490_done
    eq rx490_pos, -1, rx490_fail
    jump $I10
  rx490_done:
    rx490_cur."!cursor_fail"()
    rx490_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx490_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("122_1267204702.05125") :method
.annotate "line", 4
    new $P492, "ResizablePMCArray"
    push $P492, "?"
    push $P492, "!"
    push $P492, "*"
    .return ($P492)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("123_1267204702.05125") :method
.annotate "line", 249
    $P495 = self."!protoregex"("package_declarator")
    .return ($P495)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("124_1267204702.05125") :method
.annotate "line", 249
    $P497 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P497)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("125_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx499_tgt
    .local int rx499_pos
    .local int rx499_off
    .local int rx499_eos
    .local int rx499_rep
    .local pmc rx499_cur
    (rx499_cur, rx499_pos, rx499_tgt) = self."!cursor_start"()
    rx499_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx499_cur
    .local pmc match
    .lex "$/", match
    length rx499_eos, rx499_tgt
    set rx499_off, 0
    lt rx499_pos, 2, rx499_start
    sub rx499_off, rx499_pos, 1
    substr rx499_tgt, rx499_tgt, rx499_off
  rx499_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx499_cur."from"()
    inc $P10
    set rx499_pos, $P10
    ge rx499_pos, rx499_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  rxscan503_done:
.annotate "line", 250
  # rx subcapture "sym"
    set_addr $I10, rxcap_504_fail
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  # rx literal  "module"
    add $I11, rx499_pos, 6
    gt $I11, rx499_eos, rx499_fail
    sub $I11, rx499_pos, rx499_off
    substr $S10, rx499_tgt, $I11, 6
    ne $S10, "module", rx499_fail
    add rx499_pos, 6
    set_addr $I10, rxcap_504_fail
    ($I12, $I11) = rx499_cur."!mark_peek"($I10)
    rx499_cur."!cursor_pos"($I11)
    ($P10) = rx499_cur."!cursor_start"()
    $P10."!cursor_pass"(rx499_pos, "")
    rx499_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_504_done
  rxcap_504_fail:
    goto rx499_fail
  rxcap_504_done:
  # rx subrule "package_def" subtype=capture negate=
    rx499_cur."!cursor_pos"(rx499_pos)
    $P10 = rx499_cur."package_def"()
    unless $P10, rx499_fail
    rx499_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx499_pos = $P10."pos"()
  # rx pass
    rx499_cur."!cursor_pass"(rx499_pos, "package_declarator:sym<module>")
    rx499_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx499_pos)
    .return (rx499_cur)
  rx499_fail:
.annotate "line", 4
    (rx499_rep, rx499_pos, $I10, $P10) = rx499_cur."!mark_fail"(0)
    lt rx499_pos, -1, rx499_done
    eq rx499_pos, -1, rx499_fail
    jump $I10
  rx499_done:
    rx499_cur."!cursor_fail"()
    rx499_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx499_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("126_1267204702.05125") :method
.annotate "line", 4
    $P501 = self."!PREFIX__!subrule"("package_def", "module")
    new $P502, "ResizablePMCArray"
    push $P502, $P501
    .return ($P502)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("127_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt) = self."!cursor_start"()
    rx506_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
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
    ne $I10, -1, rxscan511_done
    goto rxscan511_scan
  rxscan511_loop:
    ($P10) = rx506_cur."from"()
    inc $P10
    set rx506_pos, $P10
    ge rx506_pos, rx506_eos, rxscan511_done
  rxscan511_scan:
    set_addr $I10, rxscan511_loop
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxscan511_done:
.annotate "line", 251
  # rx subcapture "sym"
    set_addr $I10, rxcap_513_fail
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  alt512_0:
    set_addr $I10, alt512_1
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  # rx literal  "class"
    add $I11, rx506_pos, 5
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 5
    ne $S10, "class", rx506_fail
    add rx506_pos, 5
    goto alt512_end
  alt512_1:
  # rx literal  "grammar"
    add $I11, rx506_pos, 7
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 7
    ne $S10, "grammar", rx506_fail
    add rx506_pos, 7
  alt512_end:
    set_addr $I10, rxcap_513_fail
    ($I12, $I11) = rx506_cur."!mark_peek"($I10)
    rx506_cur."!cursor_pos"($I11)
    ($P10) = rx506_cur."!cursor_start"()
    $P10."!cursor_pass"(rx506_pos, "")
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_513_done
  rxcap_513_fail:
    goto rx506_fail
  rxcap_513_done:
  # rx subrule "package_def" subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."package_def"()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx506_pos = $P10."pos"()
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "package_declarator:sym<class>")
    rx506_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_fail:
.annotate "line", 4
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx506_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("128_1267204702.05125") :method
.annotate "line", 4
    $P508 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P509 = self."!PREFIX__!subrule"("package_def", "class")
    new $P510, "ResizablePMCArray"
    push $P510, $P508
    push $P510, $P509
    .return ($P510)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("129_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx515_tgt
    .local int rx515_pos
    .local int rx515_off
    .local int rx515_eos
    .local int rx515_rep
    .local pmc rx515_cur
    (rx515_cur, rx515_pos, rx515_tgt) = self."!cursor_start"()
    rx515_cur."!cursor_debug"("START ", "package_def")
    rx515_cur."!cursor_caparray"("parent")
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
    ne $I10, -1, rxscan518_done
    goto rxscan518_scan
  rxscan518_loop:
    ($P10) = rx515_cur."from"()
    inc $P10
    set rx515_pos, $P10
    ge rx515_pos, rx515_eos, rxscan518_done
  rxscan518_scan:
    set_addr $I10, rxscan518_loop
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxscan518_done:
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 254
  # rx subrule "name" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."name"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 255
  # rx rxquantr521 ** 0..1
    set_addr $I525, rxquantr521_done
    rx515_cur."!mark_push"(0, rx515_pos, $I525)
  rxquantr521_loop:
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx515_pos, 2
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 2
    ne $S10, "is", rx515_fail
    add rx515_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."name"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    (rx515_rep) = rx515_cur."!mark_commit"($I525)
  rxquantr521_done:
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  alt527_0:
.annotate "line", 256
    set_addr $I10, alt527_1
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
.annotate "line", 257
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx515_pos, 1
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 1
    ne $S10, ";", rx515_fail
    add rx515_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."comp_unit"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    goto alt527_end
  alt527_1:
    set_addr $I10, alt527_2
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx515_pos, rx515_eos, rx515_fail
    sub $I10, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx515_fail
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."block"()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    goto alt527_end
  alt527_2:
.annotate "line", 259
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."panic"("Malformed package declaration")
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
  alt527_end:
.annotate "line", 260
  # rx subrule "ws" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."ws"()
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
.annotate "line", 253
  # rx pass
    rx515_cur."!cursor_pass"(rx515_pos, "package_def")
    rx515_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx515_pos)
    .return (rx515_cur)
  rx515_fail:
.annotate "line", 4
    (rx515_rep, rx515_pos, $I10, $P10) = rx515_cur."!mark_fail"(0)
    lt rx515_pos, -1, rx515_done
    eq rx515_pos, -1, rx515_fail
    jump $I10
  rx515_done:
    rx515_cur."!cursor_fail"()
    rx515_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx515_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("130_1267204702.05125") :method
.annotate "line", 4
    new $P517, "ResizablePMCArray"
    push $P517, ""
    .return ($P517)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("131_1267204702.05125") :method
.annotate "line", 263
    $P538 = self."!protoregex"("scope_declarator")
    .return ($P538)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("132_1267204702.05125") :method
.annotate "line", 263
    $P540 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P540)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("133_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    (rx542_cur, rx542_pos, rx542_tgt) = self."!cursor_start"()
    rx542_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
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
.annotate "line", 264
  # rx subcapture "sym"
    set_addr $I10, rxcap_547_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "my"
    add $I11, rx542_pos, 2
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    substr $S10, rx542_tgt, $I11, 2
    ne $S10, "my", rx542_fail
    add rx542_pos, 2
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
    $P10 = rx542_cur."scoped"("my")
    unless $P10, rx542_fail
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx542_pos = $P10."pos"()
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "scope_declarator:sym<my>")
    rx542_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx542_pos)
    .return (rx542_cur)
  rx542_fail:
.annotate "line", 4
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    rx542_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx542_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("134_1267204702.05125") :method
.annotate "line", 4
    $P544 = self."!PREFIX__!subrule"("scoped", "my")
    new $P545, "ResizablePMCArray"
    push $P545, $P544
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("135_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx549_tgt
    .local int rx549_pos
    .local int rx549_off
    .local int rx549_eos
    .local int rx549_rep
    .local pmc rx549_cur
    (rx549_cur, rx549_pos, rx549_tgt) = self."!cursor_start"()
    rx549_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx549_cur
    .local pmc match
    .lex "$/", match
    length rx549_eos, rx549_tgt
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
.annotate "line", 265
  # rx subcapture "sym"
    set_addr $I10, rxcap_554_fail
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  # rx literal  "our"
    add $I11, rx549_pos, 3
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 3
    ne $S10, "our", rx549_fail
    add rx549_pos, 3
    set_addr $I10, rxcap_554_fail
    ($I12, $I11) = rx549_cur."!mark_peek"($I10)
    rx549_cur."!cursor_pos"($I11)
    ($P10) = rx549_cur."!cursor_start"()
    $P10."!cursor_pass"(rx549_pos, "")
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_554_done
  rxcap_554_fail:
    goto rx549_fail
  rxcap_554_done:
  # rx subrule "scoped" subtype=capture negate=
    rx549_cur."!cursor_pos"(rx549_pos)
    $P10 = rx549_cur."scoped"("our")
    unless $P10, rx549_fail
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx549_pos = $P10."pos"()
  # rx pass
    rx549_cur."!cursor_pass"(rx549_pos, "scope_declarator:sym<our>")
    rx549_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx549_pos)
    .return (rx549_cur)
  rx549_fail:
.annotate "line", 4
    (rx549_rep, rx549_pos, $I10, $P10) = rx549_cur."!mark_fail"(0)
    lt rx549_pos, -1, rx549_done
    eq rx549_pos, -1, rx549_fail
    jump $I10
  rx549_done:
    rx549_cur."!cursor_fail"()
    rx549_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx549_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("136_1267204702.05125") :method
.annotate "line", 4
    $P551 = self."!PREFIX__!subrule"("scoped", "our")
    new $P552, "ResizablePMCArray"
    push $P552, $P551
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("137_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx556_tgt
    .local int rx556_pos
    .local int rx556_off
    .local int rx556_eos
    .local int rx556_rep
    .local pmc rx556_cur
    (rx556_cur, rx556_pos, rx556_tgt) = self."!cursor_start"()
    rx556_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx556_cur
    .local pmc match
    .lex "$/", match
    length rx556_eos, rx556_tgt
    set rx556_off, 0
    lt rx556_pos, 2, rx556_start
    sub rx556_off, rx556_pos, 1
    substr rx556_tgt, rx556_tgt, rx556_off
  rx556_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan560_done
    goto rxscan560_scan
  rxscan560_loop:
    ($P10) = rx556_cur."from"()
    inc $P10
    set rx556_pos, $P10
    ge rx556_pos, rx556_eos, rxscan560_done
  rxscan560_scan:
    set_addr $I10, rxscan560_loop
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  rxscan560_done:
.annotate "line", 266
  # rx subcapture "sym"
    set_addr $I10, rxcap_561_fail
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  # rx literal  "has"
    add $I11, rx556_pos, 3
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 3
    ne $S10, "has", rx556_fail
    add rx556_pos, 3
    set_addr $I10, rxcap_561_fail
    ($I12, $I11) = rx556_cur."!mark_peek"($I10)
    rx556_cur."!cursor_pos"($I11)
    ($P10) = rx556_cur."!cursor_start"()
    $P10."!cursor_pass"(rx556_pos, "")
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_561_done
  rxcap_561_fail:
    goto rx556_fail
  rxcap_561_done:
  # rx subrule "scoped" subtype=capture negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."scoped"("has")
    unless $P10, rx556_fail
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx556_pos = $P10."pos"()
  # rx pass
    rx556_cur."!cursor_pass"(rx556_pos, "scope_declarator:sym<has>")
    rx556_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx556_pos)
    .return (rx556_cur)
  rx556_fail:
.annotate "line", 4
    (rx556_rep, rx556_pos, $I10, $P10) = rx556_cur."!mark_fail"(0)
    lt rx556_pos, -1, rx556_done
    eq rx556_pos, -1, rx556_fail
    jump $I10
  rx556_done:
    rx556_cur."!cursor_fail"()
    rx556_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx556_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("138_1267204702.05125") :method
.annotate "line", 4
    $P558 = self."!PREFIX__!subrule"("scoped", "has")
    new $P559, "ResizablePMCArray"
    push $P559, $P558
    .return ($P559)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("139_1267204702.05125") :method :outer("11_1267204702.05125")
    .param pmc param_563
.annotate "line", 268
    .lex "$*SCOPE", param_563
.annotate "line", 4
    .local string rx564_tgt
    .local int rx564_pos
    .local int rx564_off
    .local int rx564_eos
    .local int rx564_rep
    .local pmc rx564_cur
    (rx564_cur, rx564_pos, rx564_tgt) = self."!cursor_start"()
    rx564_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx564_cur
    .local pmc match
    .lex "$/", match
    length rx564_eos, rx564_tgt
    set rx564_off, 0
    lt rx564_pos, 2, rx564_start
    sub rx564_off, rx564_pos, 1
    substr rx564_tgt, rx564_tgt, rx564_off
  rx564_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan567_done
    goto rxscan567_scan
  rxscan567_loop:
    ($P10) = rx564_cur."from"()
    inc $P10
    set rx564_pos, $P10
    ge rx564_pos, rx564_eos, rxscan567_done
  rxscan567_scan:
    set_addr $I10, rxscan567_loop
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  rxscan567_done:
  alt568_0:
.annotate "line", 268
    set_addr $I10, alt568_1
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
.annotate "line", 269
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."variable_declarator"()
    unless $P10, rx564_fail
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx564_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
    goto alt568_end
  alt568_1:
.annotate "line", 270
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."routine_declarator"()
    unless $P10, rx564_fail
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx564_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."ws"()
    unless $P10, rx564_fail
    rx564_pos = $P10."pos"()
  alt568_end:
.annotate "line", 268
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "scoped")
    rx564_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx564_pos)
    .return (rx564_cur)
  rx564_fail:
.annotate "line", 4
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    rx564_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx564_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("140_1267204702.05125") :method
.annotate "line", 4
    new $P566, "ResizablePMCArray"
    push $P566, ""
    push $P566, ""
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("141_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx574_tgt
    .local int rx574_pos
    .local int rx574_off
    .local int rx574_eos
    .local int rx574_rep
    .local pmc rx574_cur
    (rx574_cur, rx574_pos, rx574_tgt) = self."!cursor_start"()
    rx574_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx574_cur
    .local pmc match
    .lex "$/", match
    length rx574_eos, rx574_tgt
    set rx574_off, 0
    lt rx574_pos, 2, rx574_start
    sub rx574_off, rx574_pos, 1
    substr rx574_tgt, rx574_tgt, rx574_off
  rx574_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan578_done
    goto rxscan578_scan
  rxscan578_loop:
    ($P10) = rx574_cur."from"()
    inc $P10
    set rx574_pos, $P10
    ge rx574_pos, rx574_eos, rxscan578_done
  rxscan578_scan:
    set_addr $I10, rxscan578_loop
    rx574_cur."!mark_push"(0, rx574_pos, $I10)
  rxscan578_done:
.annotate "line", 273
  # rx subrule "variable" subtype=capture negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."variable"()
    unless $P10, rx574_fail
    rx574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx574_pos = $P10."pos"()
  # rx pass
    rx574_cur."!cursor_pass"(rx574_pos, "variable_declarator")
    rx574_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx574_pos)
    .return (rx574_cur)
  rx574_fail:
.annotate "line", 4
    (rx574_rep, rx574_pos, $I10, $P10) = rx574_cur."!mark_fail"(0)
    lt rx574_pos, -1, rx574_done
    eq rx574_pos, -1, rx574_fail
    jump $I10
  rx574_done:
    rx574_cur."!cursor_fail"()
    rx574_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx574_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("142_1267204702.05125") :method
.annotate "line", 4
    $P576 = self."!PREFIX__!subrule"("variable", "")
    new $P577, "ResizablePMCArray"
    push $P577, $P576
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("143_1267204702.05125") :method
.annotate "line", 275
    $P580 = self."!protoregex"("routine_declarator")
    .return ($P580)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("144_1267204702.05125") :method
.annotate "line", 275
    $P582 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P582)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("145_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx584_tgt
    .local int rx584_pos
    .local int rx584_off
    .local int rx584_eos
    .local int rx584_rep
    .local pmc rx584_cur
    (rx584_cur, rx584_pos, rx584_tgt) = self."!cursor_start"()
    rx584_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
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
.annotate "line", 276
  # rx subcapture "sym"
    set_addr $I10, rxcap_589_fail
    rx584_cur."!mark_push"(0, rx584_pos, $I10)
  # rx literal  "sub"
    add $I11, rx584_pos, 3
    gt $I11, rx584_eos, rx584_fail
    sub $I11, rx584_pos, rx584_off
    substr $S10, rx584_tgt, $I11, 3
    ne $S10, "sub", rx584_fail
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
  # rx subrule "routine_def" subtype=capture negate=
    rx584_cur."!cursor_pos"(rx584_pos)
    $P10 = rx584_cur."routine_def"()
    unless $P10, rx584_fail
    rx584_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx584_pos = $P10."pos"()
  # rx pass
    rx584_cur."!cursor_pass"(rx584_pos, "routine_declarator:sym<sub>")
    rx584_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx584_pos)
    .return (rx584_cur)
  rx584_fail:
.annotate "line", 4
    (rx584_rep, rx584_pos, $I10, $P10) = rx584_cur."!mark_fail"(0)
    lt rx584_pos, -1, rx584_done
    eq rx584_pos, -1, rx584_fail
    jump $I10
  rx584_done:
    rx584_cur."!cursor_fail"()
    rx584_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx584_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("146_1267204702.05125") :method
.annotate "line", 4
    $P586 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P587, "ResizablePMCArray"
    push $P587, $P586
    .return ($P587)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("147_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx591_tgt
    .local int rx591_pos
    .local int rx591_off
    .local int rx591_eos
    .local int rx591_rep
    .local pmc rx591_cur
    (rx591_cur, rx591_pos, rx591_tgt) = self."!cursor_start"()
    rx591_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx591_cur
    .local pmc match
    .lex "$/", match
    length rx591_eos, rx591_tgt
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
.annotate "line", 277
  # rx subcapture "sym"
    set_addr $I10, rxcap_596_fail
    rx591_cur."!mark_push"(0, rx591_pos, $I10)
  # rx literal  "method"
    add $I11, rx591_pos, 6
    gt $I11, rx591_eos, rx591_fail
    sub $I11, rx591_pos, rx591_off
    substr $S10, rx591_tgt, $I11, 6
    ne $S10, "method", rx591_fail
    add rx591_pos, 6
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
  # rx subrule "method_def" subtype=capture negate=
    rx591_cur."!cursor_pos"(rx591_pos)
    $P10 = rx591_cur."method_def"()
    unless $P10, rx591_fail
    rx591_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx591_pos = $P10."pos"()
  # rx pass
    rx591_cur."!cursor_pass"(rx591_pos, "routine_declarator:sym<method>")
    rx591_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx591_pos)
    .return (rx591_cur)
  rx591_fail:
.annotate "line", 4
    (rx591_rep, rx591_pos, $I10, $P10) = rx591_cur."!mark_fail"(0)
    lt rx591_pos, -1, rx591_done
    eq rx591_pos, -1, rx591_fail
    jump $I10
  rx591_done:
    rx591_cur."!cursor_fail"()
    rx591_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx591_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("148_1267204702.05125") :method
.annotate "line", 4
    $P593 = self."!PREFIX__!subrule"("method_def", "method")
    new $P594, "ResizablePMCArray"
    push $P594, $P593
    .return ($P594)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("149_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx598_tgt
    .local int rx598_pos
    .local int rx598_off
    .local int rx598_eos
    .local int rx598_rep
    .local pmc rx598_cur
    (rx598_cur, rx598_pos, rx598_tgt) = self."!cursor_start"()
    rx598_cur."!cursor_debug"("START ", "routine_def")
    rx598_cur."!cursor_caparray"("deflongname", "sigil")
    .lex unicode:"$\x{a2}", rx598_cur
    .local pmc match
    .lex "$/", match
    length rx598_eos, rx598_tgt
    set rx598_off, 0
    lt rx598_pos, 2, rx598_start
    sub rx598_off, rx598_pos, 1
    substr rx598_tgt, rx598_tgt, rx598_off
  rx598_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan601_done
    goto rxscan601_scan
  rxscan601_loop:
    ($P10) = rx598_cur."from"()
    inc $P10
    set rx598_pos, $P10
    ge rx598_pos, rx598_eos, rxscan601_done
  rxscan601_scan:
    set_addr $I10, rxscan601_loop
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  rxscan601_done:
.annotate "line", 279
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 280
  # rx rxquantr603 ** 0..1
    set_addr $I609, rxquantr603_done
    rx598_cur."!mark_push"(0, rx598_pos, $I609)
  rxquantr603_loop:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subcapture "sigil"
    set_addr $I10, rxcap_607_fail
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  # rx rxquantr605 ** 0..1
    set_addr $I606, rxquantr605_done
    rx598_cur."!mark_push"(0, rx598_pos, $I606)
  rxquantr605_loop:
  # rx literal  "&"
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, "&", rx598_fail
    add rx598_pos, 1
    (rx598_rep) = rx598_cur."!mark_commit"($I606)
  rxquantr605_done:
    set_addr $I10, rxcap_607_fail
    ($I12, $I11) = rx598_cur."!mark_peek"($I10)
    rx598_cur."!cursor_pos"($I11)
    ($P10) = rx598_cur."!cursor_start"()
    $P10."!cursor_pass"(rx598_pos, "")
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_607_done
  rxcap_607_fail:
    goto rx598_fail
  rxcap_607_done:
  # rx subrule "deflongname" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."deflongname"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
    (rx598_rep) = rx598_cur."!mark_commit"($I609)
  rxquantr603_done:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 281
  # rx subrule "newpad" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."newpad"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  alt612_0:
.annotate "line", 282
    set_addr $I10, alt612_1
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, "(", rx598_fail
    add rx598_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."signature"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx598_pos, 1
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 1
    ne $S10, ")", rx598_fail
    add rx598_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
    goto alt612_end
  alt612_1:
.annotate "line", 283
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
  alt612_end:
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 284
  # rx subrule "blockoid" subtype=capture negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."blockoid"()
    unless $P10, rx598_fail
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx598_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx598_cur."!cursor_pos"(rx598_pos)
    $P10 = rx598_cur."ws"()
    unless $P10, rx598_fail
    rx598_pos = $P10."pos"()
.annotate "line", 279
  # rx pass
    rx598_cur."!cursor_pass"(rx598_pos, "routine_def")
    rx598_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx598_pos)
    .return (rx598_cur)
  rx598_fail:
.annotate "line", 4
    (rx598_rep, rx598_pos, $I10, $P10) = rx598_cur."!mark_fail"(0)
    lt rx598_pos, -1, rx598_done
    eq rx598_pos, -1, rx598_fail
    jump $I10
  rx598_done:
    rx598_cur."!cursor_fail"()
    rx598_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx598_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("150_1267204702.05125") :method
.annotate "line", 4
    new $P600, "ResizablePMCArray"
    push $P600, ""
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("151_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx622_tgt
    .local int rx622_pos
    .local int rx622_off
    .local int rx622_eos
    .local int rx622_rep
    .local pmc rx622_cur
    (rx622_cur, rx622_pos, rx622_tgt) = self."!cursor_start"()
    rx622_cur."!cursor_debug"("START ", "method_def")
    rx622_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx622_cur
    .local pmc match
    .lex "$/", match
    length rx622_eos, rx622_tgt
    set rx622_off, 0
    lt rx622_pos, 2, rx622_start
    sub rx622_off, rx622_pos, 1
    substr rx622_tgt, rx622_tgt, rx622_off
  rx622_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan625_done
    goto rxscan625_scan
  rxscan625_loop:
    ($P10) = rx622_cur."from"()
    inc $P10
    set rx622_pos, $P10
    ge rx622_pos, rx622_eos, rxscan625_done
  rxscan625_scan:
    set_addr $I10, rxscan625_loop
    rx622_cur."!mark_push"(0, rx622_pos, $I10)
  rxscan625_done:
.annotate "line", 287
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 288
  # rx rxquantr627 ** 0..1
    set_addr $I628, rxquantr627_done
    rx622_cur."!mark_push"(0, rx622_pos, $I628)
  rxquantr627_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."deflongname"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx622_pos = $P10."pos"()
    (rx622_rep) = rx622_cur."!mark_commit"($I628)
  rxquantr627_done:
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 289
  # rx subrule "newpad" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."newpad"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  alt631_0:
.annotate "line", 290
    set_addr $I10, alt631_1
    rx622_cur."!mark_push"(0, rx622_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, "(", rx622_fail
    add rx622_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."signature"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, ")", rx622_fail
    add rx622_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
    goto alt631_end
  alt631_1:
.annotate "line", 291
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
  alt631_end:
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 292
  # rx subrule "blockoid" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."blockoid"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx622_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."ws"()
    unless $P10, rx622_fail
    rx622_pos = $P10."pos"()
.annotate "line", 287
  # rx pass
    rx622_cur."!cursor_pass"(rx622_pos, "method_def")
    rx622_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx622_pos)
    .return (rx622_cur)
  rx622_fail:
.annotate "line", 4
    (rx622_rep, rx622_pos, $I10, $P10) = rx622_cur."!mark_fail"(0)
    lt rx622_pos, -1, rx622_done
    eq rx622_pos, -1, rx622_fail
    jump $I10
  rx622_done:
    rx622_cur."!cursor_fail"()
    rx622_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx622_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("152_1267204702.05125") :method
.annotate "line", 4
    new $P624, "ResizablePMCArray"
    push $P624, ""
    .return ($P624)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("153_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx641_tgt
    .local int rx641_pos
    .local int rx641_off
    .local int rx641_eos
    .local int rx641_rep
    .local pmc rx641_cur
    (rx641_cur, rx641_pos, rx641_tgt) = self."!cursor_start"()
    rx641_cur."!cursor_debug"("START ", "signature")
    rx641_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx641_cur
    .local pmc match
    .lex "$/", match
    length rx641_eos, rx641_tgt
    set rx641_off, 0
    lt rx641_pos, 2, rx641_start
    sub rx641_off, rx641_pos, 1
    substr rx641_tgt, rx641_tgt, rx641_off
  rx641_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan644_done
    goto rxscan644_scan
  rxscan644_loop:
    ($P10) = rx641_cur."from"()
    inc $P10
    set rx641_pos, $P10
    ge rx641_pos, rx641_eos, rxscan644_done
  rxscan644_scan:
    set_addr $I10, rxscan644_loop
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  rxscan644_done:
.annotate "line", 295
  # rx rxquantr645 ** 0..1
    set_addr $I648, rxquantr645_done
    rx641_cur."!mark_push"(0, rx641_pos, $I648)
  rxquantr645_loop:
  # rx rxquantr646 ** 1..*
    set_addr $I647, rxquantr646_done
    rx641_cur."!mark_push"(0, -1, $I647)
  rxquantr646_loop:
  # rx subrule "ws" subtype=method negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."ws"()
    unless $P10, rx641_fail
    rx641_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."parameter"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx641_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."ws"()
    unless $P10, rx641_fail
    rx641_pos = $P10."pos"()
    (rx641_rep) = rx641_cur."!mark_commit"($I647)
    rx641_cur."!mark_push"(rx641_rep, rx641_pos, $I647)
  # rx literal  ","
    add $I11, rx641_pos, 1
    gt $I11, rx641_eos, rx641_fail
    sub $I11, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I11, 1
    ne $S10, ",", rx641_fail
    add rx641_pos, 1
    goto rxquantr646_loop
  rxquantr646_done:
    (rx641_rep) = rx641_cur."!mark_commit"($I648)
  rxquantr645_done:
  # rx pass
    rx641_cur."!cursor_pass"(rx641_pos, "signature")
    rx641_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx641_pos)
    .return (rx641_cur)
  rx641_fail:
.annotate "line", 4
    (rx641_rep, rx641_pos, $I10, $P10) = rx641_cur."!mark_fail"(0)
    lt rx641_pos, -1, rx641_done
    eq rx641_pos, -1, rx641_fail
    jump $I10
  rx641_done:
    rx641_cur."!cursor_fail"()
    rx641_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx641_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("154_1267204702.05125") :method
.annotate "line", 4
    new $P643, "ResizablePMCArray"
    push $P643, ""
    .return ($P643)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("155_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx650_tgt
    .local int rx650_pos
    .local int rx650_off
    .local int rx650_eos
    .local int rx650_rep
    .local pmc rx650_cur
    (rx650_cur, rx650_pos, rx650_tgt) = self."!cursor_start"()
    rx650_cur."!cursor_debug"("START ", "parameter")
    rx650_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx650_cur
    .local pmc match
    .lex "$/", match
    length rx650_eos, rx650_tgt
    set rx650_off, 0
    lt rx650_pos, 2, rx650_start
    sub rx650_off, rx650_pos, 1
    substr rx650_tgt, rx650_tgt, rx650_off
  rx650_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan656_done
    goto rxscan656_scan
  rxscan656_loop:
    ($P10) = rx650_cur."from"()
    inc $P10
    set rx650_pos, $P10
    ge rx650_pos, rx650_eos, rxscan656_done
  rxscan656_scan:
    set_addr $I10, rxscan656_loop
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  rxscan656_done:
  alt657_0:
.annotate "line", 298
    set_addr $I10, alt657_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
.annotate "line", 299
  # rx subcapture "quant"
    set_addr $I10, rxcap_658_fail
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "*"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "*", rx650_fail
    add rx650_pos, 1
    set_addr $I10, rxcap_658_fail
    ($I12, $I11) = rx650_cur."!mark_peek"($I10)
    rx650_cur."!cursor_pos"($I11)
    ($P10) = rx650_cur."!cursor_start"()
    $P10."!cursor_pass"(rx650_pos, "")
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_658_done
  rxcap_658_fail:
    goto rx650_fail
  rxcap_658_done:
  # rx subrule "param_var" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."param_var"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx650_pos = $P10."pos"()
    goto alt657_end
  alt657_1:
  alt659_0:
.annotate "line", 300
    set_addr $I10, alt659_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."param_var"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx650_pos = $P10."pos"()
    goto alt659_end
  alt659_1:
  # rx subrule "named_param" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."named_param"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx650_pos = $P10."pos"()
  alt659_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_661_fail
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  alt660_0:
    set_addr $I10, alt660_1
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "?"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "?", rx650_fail
    add rx650_pos, 1
    goto alt660_end
  alt660_1:
    set_addr $I10, alt660_2
    rx650_cur."!mark_push"(0, rx650_pos, $I10)
  # rx literal  "!"
    add $I11, rx650_pos, 1
    gt $I11, rx650_eos, rx650_fail
    sub $I11, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I11, 1
    ne $S10, "!", rx650_fail
    add rx650_pos, 1
    goto alt660_end
  alt660_2:
  alt660_end:
    set_addr $I10, rxcap_661_fail
    ($I12, $I11) = rx650_cur."!mark_peek"($I10)
    rx650_cur."!cursor_pos"($I11)
    ($P10) = rx650_cur."!cursor_start"()
    $P10."!cursor_pass"(rx650_pos, "")
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_661_done
  rxcap_661_fail:
    goto rx650_fail
  rxcap_661_done:
  alt657_end:
.annotate "line", 302
  # rx rxquantr662 ** 0..1
    set_addr $I663, rxquantr662_done
    rx650_cur."!mark_push"(0, rx650_pos, $I663)
  rxquantr662_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."default_value"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx650_pos = $P10."pos"()
    (rx650_rep) = rx650_cur."!mark_commit"($I663)
  rxquantr662_done:
.annotate "line", 297
  # rx pass
    rx650_cur."!cursor_pass"(rx650_pos, "parameter")
    rx650_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx650_pos)
    .return (rx650_cur)
  rx650_fail:
.annotate "line", 4
    (rx650_rep, rx650_pos, $I10, $P10) = rx650_cur."!mark_fail"(0)
    lt rx650_pos, -1, rx650_done
    eq rx650_pos, -1, rx650_fail
    jump $I10
  rx650_done:
    rx650_cur."!cursor_fail"()
    rx650_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx650_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("156_1267204702.05125") :method
.annotate "line", 4
    $P652 = self."!PREFIX__!subrule"("named_param", "")
    $P653 = self."!PREFIX__!subrule"("param_var", "")
    $P654 = self."!PREFIX__!subrule"("param_var", "*")
    new $P655, "ResizablePMCArray"
    push $P655, $P652
    push $P655, $P653
    push $P655, $P654
    .return ($P655)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("157_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx665_tgt
    .local int rx665_pos
    .local int rx665_off
    .local int rx665_eos
    .local int rx665_rep
    .local pmc rx665_cur
    (rx665_cur, rx665_pos, rx665_tgt) = self."!cursor_start"()
    rx665_cur."!cursor_debug"("START ", "param_var")
    rx665_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx665_cur
    .local pmc match
    .lex "$/", match
    length rx665_eos, rx665_tgt
    set rx665_off, 0
    lt rx665_pos, 2, rx665_start
    sub rx665_off, rx665_pos, 1
    substr rx665_tgt, rx665_tgt, rx665_off
  rx665_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan669_done
    goto rxscan669_scan
  rxscan669_loop:
    ($P10) = rx665_cur."from"()
    inc $P10
    set rx665_pos, $P10
    ge rx665_pos, rx665_eos, rxscan669_done
  rxscan669_scan:
    set_addr $I10, rxscan669_loop
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  rxscan669_done:
.annotate "line", 306
  # rx subrule "sigil" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."sigil"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx665_pos = $P10."pos"()
  # rx rxquantr670 ** 0..1
    set_addr $I671, rxquantr670_done
    rx665_cur."!mark_push"(0, rx665_pos, $I671)
  rxquantr670_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."twigil"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx665_pos = $P10."pos"()
    (rx665_rep) = rx665_cur."!mark_commit"($I671)
  rxquantr670_done:
  alt672_0:
.annotate "line", 307
    set_addr $I10, alt672_1
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."ident"()
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx665_pos = $P10."pos"()
    goto alt672_end
  alt672_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_673_fail
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx665_pos, rx665_eos, rx665_fail
    sub $I10, rx665_pos, rx665_off
    substr $S10, rx665_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx665_fail
    inc rx665_pos
    set_addr $I10, rxcap_673_fail
    ($I12, $I11) = rx665_cur."!mark_peek"($I10)
    rx665_cur."!cursor_pos"($I11)
    ($P10) = rx665_cur."!cursor_start"()
    $P10."!cursor_pass"(rx665_pos, "")
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_673_done
  rxcap_673_fail:
    goto rx665_fail
  rxcap_673_done:
  alt672_end:
.annotate "line", 305
  # rx pass
    rx665_cur."!cursor_pass"(rx665_pos, "param_var")
    rx665_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx665_pos)
    .return (rx665_cur)
  rx665_fail:
.annotate "line", 4
    (rx665_rep, rx665_pos, $I10, $P10) = rx665_cur."!mark_fail"(0)
    lt rx665_pos, -1, rx665_done
    eq rx665_pos, -1, rx665_fail
    jump $I10
  rx665_done:
    rx665_cur."!cursor_fail"()
    rx665_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx665_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("158_1267204702.05125") :method
.annotate "line", 4
    $P667 = self."!PREFIX__!subrule"("sigil", "")
    new $P668, "ResizablePMCArray"
    push $P668, $P667
    .return ($P668)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("159_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx675_tgt
    .local int rx675_pos
    .local int rx675_off
    .local int rx675_eos
    .local int rx675_rep
    .local pmc rx675_cur
    (rx675_cur, rx675_pos, rx675_tgt) = self."!cursor_start"()
    rx675_cur."!cursor_debug"("START ", "named_param")
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
    ne $I10, -1, rxscan679_done
    goto rxscan679_scan
  rxscan679_loop:
    ($P10) = rx675_cur."from"()
    inc $P10
    set rx675_pos, $P10
    ge rx675_pos, rx675_eos, rxscan679_done
  rxscan679_scan:
    set_addr $I10, rxscan679_loop
    rx675_cur."!mark_push"(0, rx675_pos, $I10)
  rxscan679_done:
.annotate "line", 311
  # rx literal  ":"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, ":", rx675_fail
    add rx675_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."param_var"()
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx675_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx675_cur."!cursor_pass"(rx675_pos, "named_param")
    rx675_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx675_pos)
    .return (rx675_cur)
  rx675_fail:
.annotate "line", 4
    (rx675_rep, rx675_pos, $I10, $P10) = rx675_cur."!mark_fail"(0)
    lt rx675_pos, -1, rx675_done
    eq rx675_pos, -1, rx675_fail
    jump $I10
  rx675_done:
    rx675_cur."!cursor_fail"()
    rx675_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx675_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("160_1267204702.05125") :method
.annotate "line", 4
    $P677 = self."!PREFIX__!subrule"("param_var", ":")
    new $P678, "ResizablePMCArray"
    push $P678, $P677
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("161_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx681_tgt
    .local int rx681_pos
    .local int rx681_off
    .local int rx681_eos
    .local int rx681_rep
    .local pmc rx681_cur
    (rx681_cur, rx681_pos, rx681_tgt) = self."!cursor_start"()
    rx681_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx681_cur
    .local pmc match
    .lex "$/", match
    length rx681_eos, rx681_tgt
    set rx681_off, 0
    lt rx681_pos, 2, rx681_start
    sub rx681_off, rx681_pos, 1
    substr rx681_tgt, rx681_tgt, rx681_off
  rx681_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan684_done
    goto rxscan684_scan
  rxscan684_loop:
    ($P10) = rx681_cur."from"()
    inc $P10
    set rx681_pos, $P10
    ge rx681_pos, rx681_eos, rxscan684_done
  rxscan684_scan:
    set_addr $I10, rxscan684_loop
    rx681_cur."!mark_push"(0, rx681_pos, $I10)
  rxscan684_done:
.annotate "line", 314
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx681_pos, 1
    gt $I11, rx681_eos, rx681_fail
    sub $I11, rx681_pos, rx681_off
    substr $S10, rx681_tgt, $I11, 1
    ne $S10, "=", rx681_fail
    add rx681_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."EXPR"("i=")
    unless $P10, rx681_fail
    rx681_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx681_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx681_cur."!cursor_pos"(rx681_pos)
    $P10 = rx681_cur."ws"()
    unless $P10, rx681_fail
    rx681_pos = $P10."pos"()
  # rx pass
    rx681_cur."!cursor_pass"(rx681_pos, "default_value")
    rx681_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx681_pos)
    .return (rx681_cur)
  rx681_fail:
.annotate "line", 4
    (rx681_rep, rx681_pos, $I10, $P10) = rx681_cur."!mark_fail"(0)
    lt rx681_pos, -1, rx681_done
    eq rx681_pos, -1, rx681_fail
    jump $I10
  rx681_done:
    rx681_cur."!cursor_fail"()
    rx681_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx681_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("162_1267204702.05125") :method
.annotate "line", 4
    new $P683, "ResizablePMCArray"
    push $P683, ""
    .return ($P683)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("163_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx689_tgt
    .local int rx689_pos
    .local int rx689_off
    .local int rx689_eos
    .local int rx689_rep
    .local pmc rx689_cur
    (rx689_cur, rx689_pos, rx689_tgt) = self."!cursor_start"()
    rx689_cur."!cursor_debug"("START ", "regex_declarator")
    rx689_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx689_cur
    .local pmc match
    .lex "$/", match
    length rx689_eos, rx689_tgt
    set rx689_off, 0
    lt rx689_pos, 2, rx689_start
    sub rx689_off, rx689_pos, 1
    substr rx689_tgt, rx689_tgt, rx689_off
  rx689_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan692_done
    goto rxscan692_scan
  rxscan692_loop:
    ($P10) = rx689_cur."from"()
    inc $P10
    set rx689_pos, $P10
    ge rx689_pos, rx689_eos, rxscan692_done
  rxscan692_scan:
    set_addr $I10, rxscan692_loop
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  rxscan692_done:
.annotate "line", 316
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt694_0:
.annotate "line", 317
    set_addr $I10, alt694_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
.annotate "line", 318
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_696_fail
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "proto"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "proto", rx689_fail
    add rx689_pos, 5
    set_addr $I10, rxcap_696_fail
    ($I12, $I11) = rx689_cur."!mark_peek"($I10)
    rx689_cur."!cursor_pos"($I11)
    ($P10) = rx689_cur."!cursor_start"()
    $P10."!cursor_pass"(rx689_pos, "")
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_696_done
  rxcap_696_fail:
    goto rx689_fail
  rxcap_696_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt698_0:
    set_addr $I10, alt698_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "regex"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "regex", rx689_fail
    add rx689_pos, 5
    goto alt698_end
  alt698_1:
    set_addr $I10, alt698_2
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "token"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "token", rx689_fail
    add rx689_pos, 5
    goto alt698_end
  alt698_2:
  # rx literal  "rule"
    add $I11, rx689_pos, 4
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 4
    ne $S10, "rule", rx689_fail
    add rx689_pos, 4
  alt698_end:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 319
  # rx subrule "deflongname" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."deflongname"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt701_0:
.annotate "line", 320
    set_addr $I10, alt701_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "{"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "{", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "<...>", rx689_fail
    add rx689_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "}", rx689_fail
    add rx689_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ENDSTMT"()
    unless $P10, rx689_fail
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
    goto alt701_end
  alt701_1:
.annotate "line", 322
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."panic"("Proto regex body must be <...>")
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt701_end:
.annotate "line", 323
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 318
    goto alt694_end
  alt694_1:
.annotate "line", 324
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_711_fail
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  alt710_0:
    set_addr $I10, alt710_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "regex"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "regex", rx689_fail
    add rx689_pos, 5
    goto alt710_end
  alt710_1:
    set_addr $I10, alt710_2
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx literal  "token"
    add $I11, rx689_pos, 5
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 5
    ne $S10, "token", rx689_fail
    add rx689_pos, 5
    goto alt710_end
  alt710_2:
  # rx literal  "rule"
    add $I11, rx689_pos, 4
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 4
    ne $S10, "rule", rx689_fail
    add rx689_pos, 4
  alt710_end:
    set_addr $I10, rxcap_711_fail
    ($I12, $I11) = rx689_cur."!mark_peek"($I10)
    rx689_cur."!cursor_pos"($I11)
    ($P10) = rx689_cur."!cursor_start"()
    $P10."!cursor_pass"(rx689_pos, "")
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_711_done
  rxcap_711_fail:
    goto rx689_fail
  rxcap_711_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 325
  # rx subrule "deflongname" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."deflongname"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 326
  # rx subrule "newpad" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."newpad"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 327
  # rx rxquantr715 ** 0..1
    set_addr $I720, rxquantr715_done
    rx689_cur."!mark_push"(0, rx689_pos, $I720)
  rxquantr715_loop:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "(", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."signature"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx689_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, ")", rx689_fail
    add rx689_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
    (rx689_rep) = rx689_cur."!mark_commit"($I720)
  rxquantr715_done:
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 328
  # rx reduce name="regex_declarator" key="open"
    rx689_cur."!cursor_pos"(rx689_pos)
    rx689_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 329
  # rx literal  "{"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "{", rx689_fail
    add rx689_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."LANG"("Regex", "nibbler")
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx689_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, "}", rx689_fail
    add rx689_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ENDSTMT"()
    unless $P10, rx689_fail
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt694_end:
.annotate "line", 330
  # rx subrule "ws" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."ws"()
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
.annotate "line", 316
  # rx pass
    rx689_cur."!cursor_pass"(rx689_pos, "regex_declarator")
    rx689_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx689_pos)
    .return (rx689_cur)
  rx689_fail:
.annotate "line", 4
    (rx689_rep, rx689_pos, $I10, $P10) = rx689_cur."!mark_fail"(0)
    lt rx689_pos, -1, rx689_done
    eq rx689_pos, -1, rx689_fail
    jump $I10
  rx689_done:
    rx689_cur."!cursor_fail"()
    rx689_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx689_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("164_1267204702.05125") :method
.annotate "line", 4
    new $P691, "ResizablePMCArray"
    push $P691, ""
    .return ($P691)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("165_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx726_tgt
    .local int rx726_pos
    .local int rx726_off
    .local int rx726_eos
    .local int rx726_rep
    .local pmc rx726_cur
    (rx726_cur, rx726_pos, rx726_tgt) = self."!cursor_start"()
    rx726_cur."!cursor_debug"("START ", "dotty")
    rx726_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx726_cur
    .local pmc match
    .lex "$/", match
    length rx726_eos, rx726_tgt
    set rx726_off, 0
    lt rx726_pos, 2, rx726_start
    sub rx726_off, rx726_pos, 1
    substr rx726_tgt, rx726_tgt, rx726_off
  rx726_start:
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
.annotate "line", 334
  # rx literal  "."
    add $I11, rx726_pos, 1
    gt $I11, rx726_eos, rx726_fail
    sub $I11, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I11, 1
    ne $S10, ".", rx726_fail
    add rx726_pos, 1
  alt731_0:
.annotate "line", 335
    set_addr $I10, alt731_1
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."identifier"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx726_pos = $P10."pos"()
    goto alt731_end
  alt731_1:
.annotate "line", 336
  # rx enumcharlist negate=0 zerowidth
    ge rx726_pos, rx726_eos, rx726_fail
    sub $I10, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx726_fail
  # rx subrule "quote" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."quote"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx726_pos = $P10."pos"()
  alt732_0:
.annotate "line", 337
    set_addr $I10, alt732_1
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx726_pos, rx726_eos, rx726_fail
    sub $I10, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx726_fail
    goto alt732_end
  alt732_1:
  # rx subrule "panic" subtype=method negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx726_fail
    rx726_pos = $P10."pos"()
  alt732_end:
  alt731_end:
.annotate "line", 343
  # rx rxquantr733 ** 0..1
    set_addr $I735, rxquantr733_done
    rx726_cur."!mark_push"(0, rx726_pos, $I735)
  rxquantr733_loop:
  alt734_0:
.annotate "line", 340
    set_addr $I10, alt734_1
    rx726_cur."!mark_push"(0, rx726_pos, $I10)
.annotate "line", 341
  # rx enumcharlist negate=0 zerowidth
    ge rx726_pos, rx726_eos, rx726_fail
    sub $I10, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx726_fail
  # rx subrule "args" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."args"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx726_pos = $P10."pos"()
    goto alt734_end
  alt734_1:
.annotate "line", 342
  # rx literal  ":"
    add $I11, rx726_pos, 1
    gt $I11, rx726_eos, rx726_fail
    sub $I11, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I11, 1
    ne $S10, ":", rx726_fail
    add rx726_pos, 1
  # rx charclass s
    ge rx726_pos, rx726_eos, rx726_fail
    sub $I10, rx726_pos, rx726_off
    is_cclass $I11, 32, rx726_tgt, $I10
    unless $I11, rx726_fail
    inc rx726_pos
  # rx subrule "arglist" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."arglist"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx726_pos = $P10."pos"()
  alt734_end:
.annotate "line", 343
    (rx726_rep) = rx726_cur."!mark_commit"($I735)
  rxquantr733_done:
.annotate "line", 333
  # rx pass
    rx726_cur."!cursor_pass"(rx726_pos, "dotty")
    rx726_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx726_pos)
    .return (rx726_cur)
  rx726_fail:
.annotate "line", 4
    (rx726_rep, rx726_pos, $I10, $P10) = rx726_cur."!mark_fail"(0)
    lt rx726_pos, -1, rx726_done
    eq rx726_pos, -1, rx726_fail
    jump $I10
  rx726_done:
    rx726_cur."!cursor_fail"()
    rx726_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx726_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("166_1267204702.05125") :method
.annotate "line", 4
    $P728 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P729, "ResizablePMCArray"
    push $P729, "'"
    push $P729, "\""
    push $P729, $P728
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("167_1267204702.05125") :method
.annotate "line", 347
    $P737 = self."!protoregex"("term")
    .return ($P737)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("168_1267204702.05125") :method
.annotate "line", 347
    $P739 = self."!PREFIX__!protoregex"("term")
    .return ($P739)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("169_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx741_tgt
    .local int rx741_pos
    .local int rx741_off
    .local int rx741_eos
    .local int rx741_rep
    .local pmc rx741_cur
    (rx741_cur, rx741_pos, rx741_tgt) = self."!cursor_start"()
    rx741_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx741_cur
    .local pmc match
    .lex "$/", match
    length rx741_eos, rx741_tgt
    set rx741_off, 0
    lt rx741_pos, 2, rx741_start
    sub rx741_off, rx741_pos, 1
    substr rx741_tgt, rx741_tgt, rx741_off
  rx741_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan744_done
    goto rxscan744_scan
  rxscan744_loop:
    ($P10) = rx741_cur."from"()
    inc $P10
    set rx741_pos, $P10
    ge rx741_pos, rx741_eos, rxscan744_done
  rxscan744_scan:
    set_addr $I10, rxscan744_loop
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  rxscan744_done:
.annotate "line", 349
  # rx subcapture "sym"
    set_addr $I10, rxcap_745_fail
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  # rx literal  "self"
    add $I11, rx741_pos, 4
    gt $I11, rx741_eos, rx741_fail
    sub $I11, rx741_pos, rx741_off
    substr $S10, rx741_tgt, $I11, 4
    ne $S10, "self", rx741_fail
    add rx741_pos, 4
    set_addr $I10, rxcap_745_fail
    ($I12, $I11) = rx741_cur."!mark_peek"($I10)
    rx741_cur."!cursor_pos"($I11)
    ($P10) = rx741_cur."!cursor_start"()
    $P10."!cursor_pass"(rx741_pos, "")
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_745_done
  rxcap_745_fail:
    goto rx741_fail
  rxcap_745_done:
  # rxanchor rwb
    le rx741_pos, 0, rx741_fail
    sub $I10, rx741_pos, rx741_off
    is_cclass $I11, 8192, rx741_tgt, $I10
    if $I11, rx741_fail
    dec $I10
    is_cclass $I11, 8192, rx741_tgt, $I10
    unless $I11, rx741_fail
  # rx pass
    rx741_cur."!cursor_pass"(rx741_pos, "term:sym<self>")
    rx741_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx741_pos)
    .return (rx741_cur)
  rx741_fail:
.annotate "line", 4
    (rx741_rep, rx741_pos, $I10, $P10) = rx741_cur."!mark_fail"(0)
    lt rx741_pos, -1, rx741_done
    eq rx741_pos, -1, rx741_fail
    jump $I10
  rx741_done:
    rx741_cur."!cursor_fail"()
    rx741_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx741_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("170_1267204702.05125") :method
.annotate "line", 4
    new $P743, "ResizablePMCArray"
    push $P743, "self"
    .return ($P743)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("171_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx747_tgt
    .local int rx747_pos
    .local int rx747_off
    .local int rx747_eos
    .local int rx747_rep
    .local pmc rx747_cur
    (rx747_cur, rx747_pos, rx747_tgt) = self."!cursor_start"()
    rx747_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx747_cur
    .local pmc match
    .lex "$/", match
    length rx747_eos, rx747_tgt
    set rx747_off, 0
    lt rx747_pos, 2, rx747_start
    sub rx747_off, rx747_pos, 1
    substr rx747_tgt, rx747_tgt, rx747_off
  rx747_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan751_done
    goto rxscan751_scan
  rxscan751_loop:
    ($P10) = rx747_cur."from"()
    inc $P10
    set rx747_pos, $P10
    ge rx747_pos, rx747_eos, rxscan751_done
  rxscan751_scan:
    set_addr $I10, rxscan751_loop
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
  rxscan751_done:
.annotate "line", 352
  # rx subrule "identifier" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."identifier"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx747_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx747_pos, rx747_eos, rx747_fail
    sub $I10, rx747_pos, rx747_off
    substr $S10, rx747_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx747_fail
  # rx subrule "args" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."args"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx747_pos = $P10."pos"()
.annotate "line", 351
  # rx pass
    rx747_cur."!cursor_pass"(rx747_pos, "term:sym<identifier>")
    rx747_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx747_pos)
    .return (rx747_cur)
  rx747_fail:
.annotate "line", 4
    (rx747_rep, rx747_pos, $I10, $P10) = rx747_cur."!mark_fail"(0)
    lt rx747_pos, -1, rx747_done
    eq rx747_pos, -1, rx747_fail
    jump $I10
  rx747_done:
    rx747_cur."!cursor_fail"()
    rx747_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx747_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("172_1267204702.05125") :method
.annotate "line", 4
    $P749 = self."!PREFIX__!subrule"("identifier", "")
    new $P750, "ResizablePMCArray"
    push $P750, $P749
    .return ($P750)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("173_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx753_tgt
    .local int rx753_pos
    .local int rx753_off
    .local int rx753_eos
    .local int rx753_rep
    .local pmc rx753_cur
    (rx753_cur, rx753_pos, rx753_tgt) = self."!cursor_start"()
    rx753_cur."!cursor_debug"("START ", "term:sym<name>")
    rx753_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx753_cur
    .local pmc match
    .lex "$/", match
    length rx753_eos, rx753_tgt
    set rx753_off, 0
    lt rx753_pos, 2, rx753_start
    sub rx753_off, rx753_pos, 1
    substr rx753_tgt, rx753_tgt, rx753_off
  rx753_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan757_done
    goto rxscan757_scan
  rxscan757_loop:
    ($P10) = rx753_cur."from"()
    inc $P10
    set rx753_pos, $P10
    ge rx753_pos, rx753_eos, rxscan757_done
  rxscan757_scan:
    set_addr $I10, rxscan757_loop
    rx753_cur."!mark_push"(0, rx753_pos, $I10)
  rxscan757_done:
.annotate "line", 356
  # rx subrule "name" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."name"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx753_pos = $P10."pos"()
  # rx rxquantr758 ** 0..1
    set_addr $I759, rxquantr758_done
    rx753_cur."!mark_push"(0, rx753_pos, $I759)
  rxquantr758_loop:
  # rx subrule "args" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."args"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx753_pos = $P10."pos"()
    (rx753_rep) = rx753_cur."!mark_commit"($I759)
  rxquantr758_done:
.annotate "line", 355
  # rx pass
    rx753_cur."!cursor_pass"(rx753_pos, "term:sym<name>")
    rx753_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx753_pos)
    .return (rx753_cur)
  rx753_fail:
.annotate "line", 4
    (rx753_rep, rx753_pos, $I10, $P10) = rx753_cur."!mark_fail"(0)
    lt rx753_pos, -1, rx753_done
    eq rx753_pos, -1, rx753_fail
    jump $I10
  rx753_done:
    rx753_cur."!cursor_fail"()
    rx753_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx753_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("174_1267204702.05125") :method
.annotate "line", 4
    $P755 = self."!PREFIX__!subrule"("name", "")
    new $P756, "ResizablePMCArray"
    push $P756, $P755
    .return ($P756)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("175_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx761_tgt
    .local int rx761_pos
    .local int rx761_off
    .local int rx761_eos
    .local int rx761_rep
    .local pmc rx761_cur
    (rx761_cur, rx761_pos, rx761_tgt) = self."!cursor_start"()
    rx761_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx761_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx761_cur
    .local pmc match
    .lex "$/", match
    length rx761_eos, rx761_tgt
    set rx761_off, 0
    lt rx761_pos, 2, rx761_start
    sub rx761_off, rx761_pos, 1
    substr rx761_tgt, rx761_tgt, rx761_off
  rx761_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan764_done
    goto rxscan764_scan
  rxscan764_loop:
    ($P10) = rx761_cur."from"()
    inc $P10
    set rx761_pos, $P10
    ge rx761_pos, rx761_eos, rxscan764_done
  rxscan764_scan:
    set_addr $I10, rxscan764_loop
    rx761_cur."!mark_push"(0, rx761_pos, $I10)
  rxscan764_done:
.annotate "line", 360
  # rx literal  "pir::"
    add $I11, rx761_pos, 5
    gt $I11, rx761_eos, rx761_fail
    sub $I11, rx761_pos, rx761_off
    substr $S10, rx761_tgt, $I11, 5
    ne $S10, "pir::", rx761_fail
    add rx761_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_765_fail
    rx761_cur."!mark_push"(0, rx761_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx761_pos, rx761_off
    find_not_cclass $I11, 8192, rx761_tgt, $I10, rx761_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx761_fail
    add rx761_pos, rx761_off, $I11
    set_addr $I10, rxcap_765_fail
    ($I12, $I11) = rx761_cur."!mark_peek"($I10)
    rx761_cur."!cursor_pos"($I11)
    ($P10) = rx761_cur."!cursor_start"()
    $P10."!cursor_pass"(rx761_pos, "")
    rx761_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_765_done
  rxcap_765_fail:
    goto rx761_fail
  rxcap_765_done:
  # rx rxquantr766 ** 0..1
    set_addr $I767, rxquantr766_done
    rx761_cur."!mark_push"(0, rx761_pos, $I767)
  rxquantr766_loop:
  # rx subrule "args" subtype=capture negate=
    rx761_cur."!cursor_pos"(rx761_pos)
    $P10 = rx761_cur."args"()
    unless $P10, rx761_fail
    rx761_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx761_pos = $P10."pos"()
    (rx761_rep) = rx761_cur."!mark_commit"($I767)
  rxquantr766_done:
.annotate "line", 359
  # rx pass
    rx761_cur."!cursor_pass"(rx761_pos, "term:sym<pir::op>")
    rx761_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx761_pos)
    .return (rx761_cur)
  rx761_fail:
.annotate "line", 4
    (rx761_rep, rx761_pos, $I10, $P10) = rx761_cur."!mark_fail"(0)
    lt rx761_pos, -1, rx761_done
    eq rx761_pos, -1, rx761_fail
    jump $I10
  rx761_done:
    rx761_cur."!cursor_fail"()
    rx761_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx761_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("176_1267204702.05125") :method
.annotate "line", 4
    new $P763, "ResizablePMCArray"
    push $P763, "pir::"
    .return ($P763)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("177_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx769_tgt
    .local int rx769_pos
    .local int rx769_off
    .local int rx769_eos
    .local int rx769_rep
    .local pmc rx769_cur
    (rx769_cur, rx769_pos, rx769_tgt) = self."!cursor_start"()
    rx769_cur."!cursor_debug"("START ", "args")
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
    ne $I10, -1, rxscan773_done
    goto rxscan773_scan
  rxscan773_loop:
    ($P10) = rx769_cur."from"()
    inc $P10
    set rx769_pos, $P10
    ge rx769_pos, rx769_eos, rxscan773_done
  rxscan773_scan:
    set_addr $I10, rxscan773_loop
    rx769_cur."!mark_push"(0, rx769_pos, $I10)
  rxscan773_done:
.annotate "line", 364
  # rx literal  "("
    add $I11, rx769_pos, 1
    gt $I11, rx769_eos, rx769_fail
    sub $I11, rx769_pos, rx769_off
    substr $S10, rx769_tgt, $I11, 1
    ne $S10, "(", rx769_fail
    add rx769_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."arglist"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx769_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx769_pos, 1
    gt $I11, rx769_eos, rx769_fail
    sub $I11, rx769_pos, rx769_off
    substr $S10, rx769_tgt, $I11, 1
    ne $S10, ")", rx769_fail
    add rx769_pos, 1
  # rx pass
    rx769_cur."!cursor_pass"(rx769_pos, "args")
    rx769_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx769_pos)
    .return (rx769_cur)
  rx769_fail:
.annotate "line", 4
    (rx769_rep, rx769_pos, $I10, $P10) = rx769_cur."!mark_fail"(0)
    lt rx769_pos, -1, rx769_done
    eq rx769_pos, -1, rx769_fail
    jump $I10
  rx769_done:
    rx769_cur."!cursor_fail"()
    rx769_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx769_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("178_1267204702.05125") :method
.annotate "line", 4
    $P771 = self."!PREFIX__!subrule"("arglist", "(")
    new $P772, "ResizablePMCArray"
    push $P772, $P771
    .return ($P772)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("179_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx775_tgt
    .local int rx775_pos
    .local int rx775_off
    .local int rx775_eos
    .local int rx775_rep
    .local pmc rx775_cur
    (rx775_cur, rx775_pos, rx775_tgt) = self."!cursor_start"()
    rx775_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx775_cur
    .local pmc match
    .lex "$/", match
    length rx775_eos, rx775_tgt
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
.annotate "line", 368
  # rx subrule "ws" subtype=method negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."ws"()
    unless $P10, rx775_fail
    rx775_pos = $P10."pos"()
  alt780_0:
.annotate "line", 369
    set_addr $I10, alt780_1
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
.annotate "line", 370
  # rx subrule "EXPR" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."EXPR"("f=")
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx775_pos = $P10."pos"()
    goto alt780_end
  alt780_1:
  alt780_end:
.annotate "line", 367
  # rx pass
    rx775_cur."!cursor_pass"(rx775_pos, "arglist")
    rx775_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx775_pos)
    .return (rx775_cur)
  rx775_fail:
.annotate "line", 4
    (rx775_rep, rx775_pos, $I10, $P10) = rx775_cur."!mark_fail"(0)
    lt rx775_pos, -1, rx775_done
    eq rx775_pos, -1, rx775_fail
    jump $I10
  rx775_done:
    rx775_cur."!cursor_fail"()
    rx775_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx775_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("180_1267204702.05125") :method
.annotate "line", 4
    $P777 = self."!PREFIX__!subrule"("", "")
    new $P778, "ResizablePMCArray"
    push $P778, $P777
    .return ($P778)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("181_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt) = self."!cursor_start"()
    rx782_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx782_cur
    .local pmc match
    .lex "$/", match
    length rx782_eos, rx782_tgt
    set rx782_off, 0
    lt rx782_pos, 2, rx782_start
    sub rx782_off, rx782_pos, 1
    substr rx782_tgt, rx782_tgt, rx782_off
  rx782_start:
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
.annotate "line", 376
  # rx subrule "value" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."value"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx782_pos = $P10."pos"()
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "term:sym<value>")
    rx782_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_fail:
.annotate "line", 4
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("182_1267204702.05125") :method
.annotate "line", 4
    $P784 = self."!PREFIX__!subrule"("value", "")
    new $P785, "ResizablePMCArray"
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("183_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx788_cur
    .local pmc match
    .lex "$/", match
    length rx788_eos, rx788_tgt
    set rx788_off, 0
    lt rx788_pos, 2, rx788_start
    sub rx788_off, rx788_pos, 1
    substr rx788_tgt, rx788_tgt, rx788_off
  rx788_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan793_done
    goto rxscan793_scan
  rxscan793_loop:
    ($P10) = rx788_cur."from"()
    inc $P10
    set rx788_pos, $P10
    ge rx788_pos, rx788_eos, rxscan793_done
  rxscan793_scan:
    set_addr $I10, rxscan793_loop
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  rxscan793_done:
  alt794_0:
.annotate "line", 378
    set_addr $I10, alt794_1
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
.annotate "line", 379
  # rx subrule "quote" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."quote"()
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx788_pos = $P10."pos"()
    goto alt794_end
  alt794_1:
.annotate "line", 380
  # rx subrule "number" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."number"()
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx788_pos = $P10."pos"()
  alt794_end:
.annotate "line", 378
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "value")
    rx788_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate "line", 4
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("184_1267204702.05125") :method
.annotate "line", 4
    $P790 = self."!PREFIX__!subrule"("number", "")
    $P791 = self."!PREFIX__!subrule"("quote", "")
    new $P792, "ResizablePMCArray"
    push $P792, $P790
    push $P792, $P791
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("185_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx796_tgt
    .local int rx796_pos
    .local int rx796_off
    .local int rx796_eos
    .local int rx796_rep
    .local pmc rx796_cur
    (rx796_cur, rx796_pos, rx796_tgt) = self."!cursor_start"()
    rx796_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx796_cur
    .local pmc match
    .lex "$/", match
    length rx796_eos, rx796_tgt
    set rx796_off, 0
    lt rx796_pos, 2, rx796_start
    sub rx796_off, rx796_pos, 1
    substr rx796_tgt, rx796_tgt, rx796_off
  rx796_start:
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
.annotate "line", 384
  # rx subcapture "sign"
    set_addr $I10, rxcap_802_fail
    rx796_cur."!mark_push"(0, rx796_pos, $I10)
  # rx rxquantr800 ** 0..1
    set_addr $I801, rxquantr800_done
    rx796_cur."!mark_push"(0, rx796_pos, $I801)
  rxquantr800_loop:
  # rx enumcharlist negate=0 
    ge rx796_pos, rx796_eos, rx796_fail
    sub $I10, rx796_pos, rx796_off
    substr $S10, rx796_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx796_fail
    inc rx796_pos
    (rx796_rep) = rx796_cur."!mark_commit"($I801)
  rxquantr800_done:
    set_addr $I10, rxcap_802_fail
    ($I12, $I11) = rx796_cur."!mark_peek"($I10)
    rx796_cur."!cursor_pos"($I11)
    ($P10) = rx796_cur."!cursor_start"()
    $P10."!cursor_pass"(rx796_pos, "")
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_802_done
  rxcap_802_fail:
    goto rx796_fail
  rxcap_802_done:
  alt803_0:
.annotate "line", 385
    set_addr $I10, alt803_1
    rx796_cur."!mark_push"(0, rx796_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx796_cur."!cursor_pos"(rx796_pos)
    $P10 = rx796_cur."dec_number"()
    unless $P10, rx796_fail
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx796_pos = $P10."pos"()
    goto alt803_end
  alt803_1:
  # rx subrule "integer" subtype=capture negate=
    rx796_cur."!cursor_pos"(rx796_pos)
    $P10 = rx796_cur."integer"()
    unless $P10, rx796_fail
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx796_pos = $P10."pos"()
  alt803_end:
.annotate "line", 383
  # rx pass
    rx796_cur."!cursor_pass"(rx796_pos, "number")
    rx796_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx796_pos)
    .return (rx796_cur)
  rx796_fail:
.annotate "line", 4
    (rx796_rep, rx796_pos, $I10, $P10) = rx796_cur."!mark_fail"(0)
    lt rx796_pos, -1, rx796_done
    eq rx796_pos, -1, rx796_fail
    jump $I10
  rx796_done:
    rx796_cur."!cursor_fail"()
    rx796_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx796_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("186_1267204702.05125") :method
.annotate "line", 4
    new $P798, "ResizablePMCArray"
    push $P798, ""
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("187_1267204702.05125") :method
.annotate "line", 388
    $P805 = self."!protoregex"("quote")
    .return ($P805)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("188_1267204702.05125") :method
.annotate "line", 388
    $P807 = self."!PREFIX__!protoregex"("quote")
    .return ($P807)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("189_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx809_cur
    .local pmc match
    .lex "$/", match
    length rx809_eos, rx809_tgt
    set rx809_off, 0
    lt rx809_pos, 2, rx809_start
    sub rx809_off, rx809_pos, 1
    substr rx809_tgt, rx809_tgt, rx809_off
  rx809_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan812_done
    goto rxscan812_scan
  rxscan812_loop:
    ($P10) = rx809_cur."from"()
    inc $P10
    set rx809_pos, $P10
    ge rx809_pos, rx809_eos, rxscan812_done
  rxscan812_scan:
    set_addr $I10, rxscan812_loop
    rx809_cur."!mark_push"(0, rx809_pos, $I10)
  rxscan812_done:
.annotate "line", 389
  # rx enumcharlist negate=0 zerowidth
    ge rx809_pos, rx809_eos, rx809_fail
    sub $I10, rx809_pos, rx809_off
    substr $S10, rx809_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx809_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."quote_EXPR"(":q")
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "quote:sym<apos>")
    rx809_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate "line", 4
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("190_1267204702.05125") :method
.annotate "line", 4
    new $P811, "ResizablePMCArray"
    push $P811, "'"
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("191_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx814_tgt
    .local int rx814_pos
    .local int rx814_off
    .local int rx814_eos
    .local int rx814_rep
    .local pmc rx814_cur
    (rx814_cur, rx814_pos, rx814_tgt) = self."!cursor_start"()
    rx814_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
    ne $I10, -1, rxscan817_done
    goto rxscan817_scan
  rxscan817_loop:
    ($P10) = rx814_cur."from"()
    inc $P10
    set rx814_pos, $P10
    ge rx814_pos, rx814_eos, rxscan817_done
  rxscan817_scan:
    set_addr $I10, rxscan817_loop
    rx814_cur."!mark_push"(0, rx814_pos, $I10)
  rxscan817_done:
.annotate "line", 390
  # rx enumcharlist negate=0 zerowidth
    ge rx814_pos, rx814_eos, rx814_fail
    sub $I10, rx814_pos, rx814_off
    substr $S10, rx814_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx814_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."quote_EXPR"(":qq")
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx814_pos = $P10."pos"()
  # rx pass
    rx814_cur."!cursor_pass"(rx814_pos, "quote:sym<dblq>")
    rx814_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx814_pos)
    .return (rx814_cur)
  rx814_fail:
.annotate "line", 4
    (rx814_rep, rx814_pos, $I10, $P10) = rx814_cur."!mark_fail"(0)
    lt rx814_pos, -1, rx814_done
    eq rx814_pos, -1, rx814_fail
    jump $I10
  rx814_done:
    rx814_cur."!cursor_fail"()
    rx814_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx814_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("192_1267204702.05125") :method
.annotate "line", 4
    new $P816, "ResizablePMCArray"
    push $P816, "\""
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("193_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx819_tgt
    .local int rx819_pos
    .local int rx819_off
    .local int rx819_eos
    .local int rx819_rep
    .local pmc rx819_cur
    (rx819_cur, rx819_pos, rx819_tgt) = self."!cursor_start"()
    rx819_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx819_cur
    .local pmc match
    .lex "$/", match
    length rx819_eos, rx819_tgt
    set rx819_off, 0
    lt rx819_pos, 2, rx819_start
    sub rx819_off, rx819_pos, 1
    substr rx819_tgt, rx819_tgt, rx819_off
  rx819_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan823_done
    goto rxscan823_scan
  rxscan823_loop:
    ($P10) = rx819_cur."from"()
    inc $P10
    set rx819_pos, $P10
    ge rx819_pos, rx819_eos, rxscan823_done
  rxscan823_scan:
    set_addr $I10, rxscan823_loop
    rx819_cur."!mark_push"(0, rx819_pos, $I10)
  rxscan823_done:
.annotate "line", 391
  # rx literal  "q"
    add $I11, rx819_pos, 1
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 1
    ne $S10, "q", rx819_fail
    add rx819_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx819_pos, rx819_eos, rx819_fail
    sub $I10, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx819_fail
  # rx subrule "ws" subtype=method negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."ws"()
    unless $P10, rx819_fail
    rx819_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."quote_EXPR"(":q")
    unless $P10, rx819_fail
    rx819_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx819_pos = $P10."pos"()
  # rx pass
    rx819_cur."!cursor_pass"(rx819_pos, "quote:sym<q>")
    rx819_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx819_pos)
    .return (rx819_cur)
  rx819_fail:
.annotate "line", 4
    (rx819_rep, rx819_pos, $I10, $P10) = rx819_cur."!mark_fail"(0)
    lt rx819_pos, -1, rx819_done
    eq rx819_pos, -1, rx819_fail
    jump $I10
  rx819_done:
    rx819_cur."!cursor_fail"()
    rx819_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx819_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("194_1267204702.05125") :method
.annotate "line", 4
    $P821 = self."!PREFIX__!subrule"("", "q")
    new $P822, "ResizablePMCArray"
    push $P822, $P821
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("195_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx825_cur
    .local pmc match
    .lex "$/", match
    length rx825_eos, rx825_tgt
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
.annotate "line", 392
  # rx literal  "qq"
    add $I11, rx825_pos, 2
    gt $I11, rx825_eos, rx825_fail
    sub $I11, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I11, 2
    ne $S10, "qq", rx825_fail
    add rx825_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx825_pos, rx825_eos, rx825_fail
    sub $I10, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx825_fail
  # rx subrule "ws" subtype=method negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."ws"()
    unless $P10, rx825_fail
    rx825_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."quote_EXPR"(":qq")
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx825_pos = $P10."pos"()
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "quote:sym<qq>")
    rx825_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate "line", 4
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("196_1267204702.05125") :method
.annotate "line", 4
    $P827 = self."!PREFIX__!subrule"("", "qq")
    new $P828, "ResizablePMCArray"
    push $P828, $P827
    .return ($P828)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("197_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx831_tgt
    .local int rx831_pos
    .local int rx831_off
    .local int rx831_eos
    .local int rx831_rep
    .local pmc rx831_cur
    (rx831_cur, rx831_pos, rx831_tgt) = self."!cursor_start"()
    rx831_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx831_cur
    .local pmc match
    .lex "$/", match
    length rx831_eos, rx831_tgt
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
.annotate "line", 393
  # rx literal  "Q"
    add $I11, rx831_pos, 1
    gt $I11, rx831_eos, rx831_fail
    sub $I11, rx831_pos, rx831_off
    substr $S10, rx831_tgt, $I11, 1
    ne $S10, "Q", rx831_fail
    add rx831_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx831_pos, rx831_eos, rx831_fail
    sub $I10, rx831_pos, rx831_off
    substr $S10, rx831_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx831_fail
  # rx subrule "ws" subtype=method negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."ws"()
    unless $P10, rx831_fail
    rx831_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."quote_EXPR"()
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx831_pos = $P10."pos"()
  # rx pass
    rx831_cur."!cursor_pass"(rx831_pos, "quote:sym<Q>")
    rx831_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx831_pos)
    .return (rx831_cur)
  rx831_fail:
.annotate "line", 4
    (rx831_rep, rx831_pos, $I10, $P10) = rx831_cur."!mark_fail"(0)
    lt rx831_pos, -1, rx831_done
    eq rx831_pos, -1, rx831_fail
    jump $I10
  rx831_done:
    rx831_cur."!cursor_fail"()
    rx831_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx831_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("198_1267204702.05125") :method
.annotate "line", 4
    $P833 = self."!PREFIX__!subrule"("", "Q")
    new $P834, "ResizablePMCArray"
    push $P834, $P833
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("199_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    (rx837_cur, rx837_pos, rx837_tgt) = self."!cursor_start"()
    rx837_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx837_cur
    .local pmc match
    .lex "$/", match
    length rx837_eos, rx837_tgt
    set rx837_off, 0
    lt rx837_pos, 2, rx837_start
    sub rx837_off, rx837_pos, 1
    substr rx837_tgt, rx837_tgt, rx837_off
  rx837_start:
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
.annotate "line", 394
  # rx literal  "Q:PIR"
    add $I11, rx837_pos, 5
    gt $I11, rx837_eos, rx837_fail
    sub $I11, rx837_pos, rx837_off
    substr $S10, rx837_tgt, $I11, 5
    ne $S10, "Q:PIR", rx837_fail
    add rx837_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."ws"()
    unless $P10, rx837_fail
    rx837_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."quote_EXPR"()
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx837_pos = $P10."pos"()
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "quote:sym<Q:PIR>")
    rx837_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx837_pos)
    .return (rx837_cur)
  rx837_fail:
.annotate "line", 4
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    rx837_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("200_1267204702.05125") :method
.annotate "line", 4
    $P839 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P840, "ResizablePMCArray"
    push $P840, $P839
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym</ />"  :subid("201_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    (rx843_cur, rx843_pos, rx843_tgt) = self."!cursor_start"()
    rx843_cur."!cursor_debug"("START ", "quote:sym</ />")
    .lex unicode:"$\x{a2}", rx843_cur
    .local pmc match
    .lex "$/", match
    length rx843_eos, rx843_tgt
    set rx843_off, 0
    lt rx843_pos, 2, rx843_start
    sub rx843_off, rx843_pos, 1
    substr rx843_tgt, rx843_tgt, rx843_off
  rx843_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan847_done
    goto rxscan847_scan
  rxscan847_loop:
    ($P10) = rx843_cur."from"()
    inc $P10
    set rx843_pos, $P10
    ge rx843_pos, rx843_eos, rxscan847_done
  rxscan847_scan:
    set_addr $I10, rxscan847_loop
    rx843_cur."!mark_push"(0, rx843_pos, $I10)
  rxscan847_done:
.annotate "line", 396
  # rx literal  "/"
    add $I11, rx843_pos, 1
    gt $I11, rx843_eos, rx843_fail
    sub $I11, rx843_pos, rx843_off
    substr $S10, rx843_tgt, $I11, 1
    ne $S10, "/", rx843_fail
    add rx843_pos, 1
.annotate "line", 397
  # rx subrule "newpad" subtype=method negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."newpad"()
    unless $P10, rx843_fail
    rx843_pos = $P10."pos"()
.annotate "line", 398
  # rx reduce name="quote:sym</ />" key="open"
    rx843_cur."!cursor_pos"(rx843_pos)
    rx843_cur."!reduce"("quote:sym</ />", "open")
.annotate "line", 399
  # rx subrule "LANG" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."LANG"("Regex", "nibbler")
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx843_pos = $P10."pos"()
.annotate "line", 400
  # rx literal  "/"
    add $I11, rx843_pos, 1
    gt $I11, rx843_eos, rx843_fail
    sub $I11, rx843_pos, rx843_off
    substr $S10, rx843_tgt, $I11, 1
    ne $S10, "/", rx843_fail
    add rx843_pos, 1
.annotate "line", 395
  # rx pass
    rx843_cur."!cursor_pass"(rx843_pos, "quote:sym</ />")
    rx843_cur."!cursor_debug"("PASS  ", "quote:sym</ />", " at pos=", rx843_pos)
    .return (rx843_cur)
  rx843_fail:
.annotate "line", 4
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    rx843_cur."!cursor_debug"("FAIL  ", "quote:sym</ />")
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym</ />"  :subid("202_1267204702.05125") :method
.annotate "line", 4
    $P845 = self."!PREFIX__!subrule"("", "/")
    new $P846, "ResizablePMCArray"
    push $P846, $P845
    .return ($P846)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("203_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx849_tgt
    .local int rx849_pos
    .local int rx849_off
    .local int rx849_eos
    .local int rx849_rep
    .local pmc rx849_cur
    (rx849_cur, rx849_pos, rx849_tgt) = self."!cursor_start"()
    rx849_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx849_cur
    .local pmc match
    .lex "$/", match
    length rx849_eos, rx849_tgt
    set rx849_off, 0
    lt rx849_pos, 2, rx849_start
    sub rx849_off, rx849_pos, 1
    substr rx849_tgt, rx849_tgt, rx849_off
  rx849_start:
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
.annotate "line", 403
  # rx enumcharlist negate=0 zerowidth
    ge rx849_pos, rx849_eos, rx849_fail
    sub $I10, rx849_pos, rx849_off
    substr $S10, rx849_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx849_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."quotemod_check"("s")
    unless $P10, rx849_fail
  # rx subrule "variable" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."variable"()
    unless $P10, rx849_fail
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx849_pos = $P10."pos"()
  # rx pass
    rx849_cur."!cursor_pass"(rx849_pos, "quote_escape:sym<$>")
    rx849_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx849_pos)
    .return (rx849_cur)
  rx849_fail:
.annotate "line", 4
    (rx849_rep, rx849_pos, $I10, $P10) = rx849_cur."!mark_fail"(0)
    lt rx849_pos, -1, rx849_done
    eq rx849_pos, -1, rx849_fail
    jump $I10
  rx849_done:
    rx849_cur."!cursor_fail"()
    rx849_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx849_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("204_1267204702.05125") :method
.annotate "line", 4
    new $P851, "ResizablePMCArray"
    push $P851, "$"
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("205_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx854_tgt
    .local int rx854_pos
    .local int rx854_off
    .local int rx854_eos
    .local int rx854_rep
    .local pmc rx854_cur
    (rx854_cur, rx854_pos, rx854_tgt) = self."!cursor_start"()
    rx854_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx854_cur
    .local pmc match
    .lex "$/", match
    length rx854_eos, rx854_tgt
    set rx854_off, 0
    lt rx854_pos, 2, rx854_start
    sub rx854_off, rx854_pos, 1
    substr rx854_tgt, rx854_tgt, rx854_off
  rx854_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan857_done
    goto rxscan857_scan
  rxscan857_loop:
    ($P10) = rx854_cur."from"()
    inc $P10
    set rx854_pos, $P10
    ge rx854_pos, rx854_eos, rxscan857_done
  rxscan857_scan:
    set_addr $I10, rxscan857_loop
    rx854_cur."!mark_push"(0, rx854_pos, $I10)
  rxscan857_done:
.annotate "line", 404
  # rx enumcharlist negate=0 zerowidth
    ge rx854_pos, rx854_eos, rx854_fail
    sub $I10, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx854_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."quotemod_check"("c")
    unless $P10, rx854_fail
  # rx subrule "block" subtype=capture negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."block"()
    unless $P10, rx854_fail
    rx854_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx854_pos = $P10."pos"()
  # rx pass
    rx854_cur."!cursor_pass"(rx854_pos, "quote_escape:sym<{ }>")
    rx854_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx854_pos)
    .return (rx854_cur)
  rx854_fail:
.annotate "line", 4
    (rx854_rep, rx854_pos, $I10, $P10) = rx854_cur."!mark_fail"(0)
    lt rx854_pos, -1, rx854_done
    eq rx854_pos, -1, rx854_fail
    jump $I10
  rx854_done:
    rx854_cur."!cursor_fail"()
    rx854_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx854_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("206_1267204702.05125") :method
.annotate "line", 4
    new $P856, "ResizablePMCArray"
    push $P856, "{"
    .return ($P856)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("207_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx859_tgt
    .local int rx859_pos
    .local int rx859_off
    .local int rx859_eos
    .local int rx859_rep
    .local pmc rx859_cur
    (rx859_cur, rx859_pos, rx859_tgt) = self."!cursor_start"()
    rx859_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx859_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx859_cur
    .local pmc match
    .lex "$/", match
    length rx859_eos, rx859_tgt
    set rx859_off, 0
    lt rx859_pos, 2, rx859_start
    sub rx859_off, rx859_pos, 1
    substr rx859_tgt, rx859_tgt, rx859_off
  rx859_start:
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
.annotate "line", 406
  # rx literal  "("
    add $I11, rx859_pos, 1
    gt $I11, rx859_eos, rx859_fail
    sub $I11, rx859_pos, rx859_off
    substr $S10, rx859_tgt, $I11, 1
    ne $S10, "(", rx859_fail
    add rx859_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx859_cur."!cursor_pos"(rx859_pos)
    $P10 = rx859_cur."ws"()
    unless $P10, rx859_fail
    rx859_pos = $P10."pos"()
  # rx rxquantr864 ** 0..1
    set_addr $I865, rxquantr864_done
    rx859_cur."!mark_push"(0, rx859_pos, $I865)
  rxquantr864_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx859_cur."!cursor_pos"(rx859_pos)
    $P10 = rx859_cur."EXPR"()
    unless $P10, rx859_fail
    rx859_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx859_pos = $P10."pos"()
    (rx859_rep) = rx859_cur."!mark_commit"($I865)
  rxquantr864_done:
  # rx literal  ")"
    add $I11, rx859_pos, 1
    gt $I11, rx859_eos, rx859_fail
    sub $I11, rx859_pos, rx859_off
    substr $S10, rx859_tgt, $I11, 1
    ne $S10, ")", rx859_fail
    add rx859_pos, 1
  # rx pass
    rx859_cur."!cursor_pass"(rx859_pos, "circumfix:sym<( )>")
    rx859_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx859_pos)
    .return (rx859_cur)
  rx859_fail:
.annotate "line", 4
    (rx859_rep, rx859_pos, $I10, $P10) = rx859_cur."!mark_fail"(0)
    lt rx859_pos, -1, rx859_done
    eq rx859_pos, -1, rx859_fail
    jump $I10
  rx859_done:
    rx859_cur."!cursor_fail"()
    rx859_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx859_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("208_1267204702.05125") :method
.annotate "line", 4
    $P861 = self."!PREFIX__!subrule"("", "(")
    new $P862, "ResizablePMCArray"
    push $P862, $P861
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("209_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx867_tgt
    .local int rx867_pos
    .local int rx867_off
    .local int rx867_eos
    .local int rx867_rep
    .local pmc rx867_cur
    (rx867_cur, rx867_pos, rx867_tgt) = self."!cursor_start"()
    rx867_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx867_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx867_cur
    .local pmc match
    .lex "$/", match
    length rx867_eos, rx867_tgt
    set rx867_off, 0
    lt rx867_pos, 2, rx867_start
    sub rx867_off, rx867_pos, 1
    substr rx867_tgt, rx867_tgt, rx867_off
  rx867_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan871_done
    goto rxscan871_scan
  rxscan871_loop:
    ($P10) = rx867_cur."from"()
    inc $P10
    set rx867_pos, $P10
    ge rx867_pos, rx867_eos, rxscan871_done
  rxscan871_scan:
    set_addr $I10, rxscan871_loop
    rx867_cur."!mark_push"(0, rx867_pos, $I10)
  rxscan871_done:
.annotate "line", 407
  # rx literal  "["
    add $I11, rx867_pos, 1
    gt $I11, rx867_eos, rx867_fail
    sub $I11, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I11, 1
    ne $S10, "[", rx867_fail
    add rx867_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."ws"()
    unless $P10, rx867_fail
    rx867_pos = $P10."pos"()
  # rx rxquantr872 ** 0..1
    set_addr $I873, rxquantr872_done
    rx867_cur."!mark_push"(0, rx867_pos, $I873)
  rxquantr872_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."EXPR"()
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx867_pos = $P10."pos"()
    (rx867_rep) = rx867_cur."!mark_commit"($I873)
  rxquantr872_done:
  # rx literal  "]"
    add $I11, rx867_pos, 1
    gt $I11, rx867_eos, rx867_fail
    sub $I11, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I11, 1
    ne $S10, "]", rx867_fail
    add rx867_pos, 1
  # rx pass
    rx867_cur."!cursor_pass"(rx867_pos, "circumfix:sym<[ ]>")
    rx867_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx867_pos)
    .return (rx867_cur)
  rx867_fail:
.annotate "line", 4
    (rx867_rep, rx867_pos, $I10, $P10) = rx867_cur."!mark_fail"(0)
    lt rx867_pos, -1, rx867_done
    eq rx867_pos, -1, rx867_fail
    jump $I10
  rx867_done:
    rx867_cur."!cursor_fail"()
    rx867_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx867_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("210_1267204702.05125") :method
.annotate "line", 4
    $P869 = self."!PREFIX__!subrule"("", "[")
    new $P870, "ResizablePMCArray"
    push $P870, $P869
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("211_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
    ne $I10, -1, rxscan878_done
    goto rxscan878_scan
  rxscan878_loop:
    ($P10) = rx875_cur."from"()
    inc $P10
    set rx875_pos, $P10
    ge rx875_pos, rx875_eos, rxscan878_done
  rxscan878_scan:
    set_addr $I10, rxscan878_loop
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  rxscan878_done:
.annotate "line", 408
  # rx enumcharlist negate=0 zerowidth
    ge rx875_pos, rx875_eos, rx875_fail
    sub $I10, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx875_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx875_pos = $P10."pos"()
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "circumfix:sym<ang>")
    rx875_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate "line", 4
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("212_1267204702.05125") :method
.annotate "line", 4
    new $P877, "ResizablePMCArray"
    push $P877, "<"
    .return ($P877)
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("213_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx880_tgt
    .local int rx880_pos
    .local int rx880_off
    .local int rx880_eos
    .local int rx880_rep
    .local pmc rx880_cur
    (rx880_cur, rx880_pos, rx880_tgt) = self."!cursor_start"()
    rx880_cur."!cursor_debug"("START ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
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
.annotate "line", 409
  # rx enumcharlist negate=0 zerowidth
    ge rx880_pos, rx880_eos, rx880_fail
    sub $I10, rx880_pos, rx880_off
    substr $S10, rx880_tgt, $I10, 1
    index $I11, unicode:"\x{ab}", $S10
    lt $I11, 0, rx880_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx880_cur."!cursor_pos"(rx880_pos)
    $P10 = rx880_cur."quote_EXPR"(":qq", ":w")
    unless $P10, rx880_fail
    rx880_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx880_pos = $P10."pos"()
  # rx pass
    rx880_cur."!cursor_pass"(rx880_pos, unicode:"circumfix:sym<\x{ab} \x{bb}>")
    rx880_cur."!cursor_debug"("PASS  ", unicode:"circumfix:sym<\x{ab} \x{bb}>", " at pos=", rx880_pos)
    .return (rx880_cur)
  rx880_fail:
.annotate "line", 4
    (rx880_rep, rx880_pos, $I10, $P10) = rx880_cur."!mark_fail"(0)
    lt rx880_pos, -1, rx880_done
    eq rx880_pos, -1, rx880_fail
    jump $I10
  rx880_done:
    rx880_cur."!cursor_fail"()
    rx880_cur."!cursor_debug"("FAIL  ", unicode:"circumfix:sym<\x{ab} \x{bb}>")
    .return (rx880_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub unicode:"!PREFIX__circumfix:sym<\x{ab} \x{bb}>"  :subid("214_1267204702.05125") :method
.annotate "line", 4
    new $P882, "ResizablePMCArray"
    push $P882, unicode:"\x{ab}"
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("215_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt) = self."!cursor_start"()
    rx885_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
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
.annotate "line", 410
  # rx enumcharlist negate=0 zerowidth
    ge rx885_pos, rx885_eos, rx885_fail
    sub $I10, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx885_fail
  # rx subrule "pblock" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."pblock"()
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx885_pos = $P10."pos"()
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "circumfix:sym<{ }>")
    rx885_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate "line", 4
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("216_1267204702.05125") :method
.annotate "line", 4
    new $P887, "ResizablePMCArray"
    push $P887, "{"
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("217_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx890_tgt
    .local int rx890_pos
    .local int rx890_off
    .local int rx890_eos
    .local int rx890_rep
    .local pmc rx890_cur
    (rx890_cur, rx890_pos, rx890_tgt) = self."!cursor_start"()
    rx890_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
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
.annotate "line", 411
  # rx subrule "sigil" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."sigil"()
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx890_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx890_pos, 1
    gt $I11, rx890_eos, rx890_fail
    sub $I11, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I11, 1
    ne $S10, "(", rx890_fail
    add rx890_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."semilist"()
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx890_pos = $P10."pos"()
  alt895_0:
    set_addr $I10, alt895_1
    rx890_cur."!mark_push"(0, rx890_pos, $I10)
  # rx literal  ")"
    add $I11, rx890_pos, 1
    gt $I11, rx890_eos, rx890_fail
    sub $I11, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I11, 1
    ne $S10, ")", rx890_fail
    add rx890_pos, 1
    goto alt895_end
  alt895_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."FAILGOAL"("')'")
    unless $P10, rx890_fail
    rx890_pos = $P10."pos"()
  alt895_end:
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "circumfix:sym<sigil>")
    rx890_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate "line", 4
    (rx890_rep, rx890_pos, $I10, $P10) = rx890_cur."!mark_fail"(0)
    lt rx890_pos, -1, rx890_done
    eq rx890_pos, -1, rx890_fail
    jump $I10
  rx890_done:
    rx890_cur."!cursor_fail"()
    rx890_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx890_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("218_1267204702.05125") :method
.annotate "line", 4
    $P892 = self."!PREFIX__!subrule"("sigil", "")
    new $P893, "ResizablePMCArray"
    push $P893, $P892
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("219_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 4
    .local string rx898_tgt
    .local int rx898_pos
    .local int rx898_off
    .local int rx898_eos
    .local int rx898_rep
    .local pmc rx898_cur
    (rx898_cur, rx898_pos, rx898_tgt) = self."!cursor_start"()
    rx898_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx898_cur
    .local pmc match
    .lex "$/", match
    length rx898_eos, rx898_tgt
    set rx898_off, 0
    lt rx898_pos, 2, rx898_start
    sub rx898_off, rx898_pos, 1
    substr rx898_tgt, rx898_tgt, rx898_off
  rx898_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan901_done
    goto rxscan901_scan
  rxscan901_loop:
    ($P10) = rx898_cur."from"()
    inc $P10
    set rx898_pos, $P10
    ge rx898_pos, rx898_eos, rxscan901_done
  rxscan901_scan:
    set_addr $I10, rxscan901_loop
    rx898_cur."!mark_push"(0, rx898_pos, $I10)
  rxscan901_done:
.annotate "line", 413
  # rx subrule "ws" subtype=method negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."ws"()
    unless $P10, rx898_fail
    rx898_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."statement"()
    unless $P10, rx898_fail
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx898_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."ws"()
    unless $P10, rx898_fail
    rx898_pos = $P10."pos"()
  # rx pass
    rx898_cur."!cursor_pass"(rx898_pos, "semilist")
    rx898_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx898_pos)
    .return (rx898_cur)
  rx898_fail:
.annotate "line", 4
    (rx898_rep, rx898_pos, $I10, $P10) = rx898_cur."!mark_fail"(0)
    lt rx898_pos, -1, rx898_done
    eq rx898_pos, -1, rx898_fail
    jump $I10
  rx898_done:
    rx898_cur."!cursor_fail"()
    rx898_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx898_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("220_1267204702.05125") :method
.annotate "line", 4
    new $P900, "ResizablePMCArray"
    push $P900, ""
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("221_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx905_tgt
    .local int rx905_pos
    .local int rx905_off
    .local int rx905_eos
    .local int rx905_rep
    .local pmc rx905_cur
    (rx905_cur, rx905_pos, rx905_tgt) = self."!cursor_start"()
    rx905_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx905_cur
    .local pmc match
    .lex "$/", match
    length rx905_eos, rx905_tgt
    set rx905_off, 0
    lt rx905_pos, 2, rx905_start
    sub rx905_off, rx905_pos, 1
    substr rx905_tgt, rx905_tgt, rx905_off
  rx905_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan908_done
    goto rxscan908_scan
  rxscan908_loop:
    ($P10) = rx905_cur."from"()
    inc $P10
    set rx905_pos, $P10
    ge rx905_pos, rx905_eos, rxscan908_done
  rxscan908_scan:
    set_addr $I10, rxscan908_loop
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  rxscan908_done:
.annotate "line", 436
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx905_cur."!cursor_pos"(rx905_pos)
    $P10 = rx905_cur."infixstopper"()
    if $P10, rx905_fail
  # rx subrule "infix" subtype=capture negate=
    rx905_cur."!cursor_pos"(rx905_pos)
    $P10 = rx905_cur."infix"()
    unless $P10, rx905_fail
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx905_pos = $P10."pos"()
  # rx pass
    rx905_cur."!cursor_pass"(rx905_pos, "infixish")
    rx905_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx905_pos)
    .return (rx905_cur)
  rx905_fail:
.annotate "line", 417
    (rx905_rep, rx905_pos, $I10, $P10) = rx905_cur."!mark_fail"(0)
    lt rx905_pos, -1, rx905_done
    eq rx905_pos, -1, rx905_fail
    jump $I10
  rx905_done:
    rx905_cur."!cursor_fail"()
    rx905_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx905_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("222_1267204702.05125") :method
.annotate "line", 417
    new $P907, "ResizablePMCArray"
    push $P907, ""
    .return ($P907)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("223_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx910_tgt
    .local int rx910_pos
    .local int rx910_off
    .local int rx910_eos
    .local int rx910_rep
    .local pmc rx910_cur
    (rx910_cur, rx910_pos, rx910_tgt) = self."!cursor_start"()
    rx910_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx910_cur
    .local pmc match
    .lex "$/", match
    length rx910_eos, rx910_tgt
    set rx910_off, 0
    lt rx910_pos, 2, rx910_start
    sub rx910_off, rx910_pos, 1
    substr rx910_tgt, rx910_tgt, rx910_off
  rx910_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan913_done
    goto rxscan913_scan
  rxscan913_loop:
    ($P10) = rx910_cur."from"()
    inc $P10
    set rx910_pos, $P10
    ge rx910_pos, rx910_eos, rxscan913_done
  rxscan913_scan:
    set_addr $I10, rxscan913_loop
    rx910_cur."!mark_push"(0, rx910_pos, $I10)
  rxscan913_done:
.annotate "line", 437
  # rx subrule "lambda" subtype=zerowidth negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."lambda"()
    unless $P10, rx910_fail
  # rx pass
    rx910_cur."!cursor_pass"(rx910_pos, "infixstopper")
    rx910_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx910_pos)
    .return (rx910_cur)
  rx910_fail:
.annotate "line", 417
    (rx910_rep, rx910_pos, $I10, $P10) = rx910_cur."!mark_fail"(0)
    lt rx910_pos, -1, rx910_done
    eq rx910_pos, -1, rx910_fail
    jump $I10
  rx910_done:
    rx910_cur."!cursor_fail"()
    rx910_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx910_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("224_1267204702.05125") :method
.annotate "line", 417
    new $P912, "ResizablePMCArray"
    push $P912, ""
    .return ($P912)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("225_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx915_tgt
    .local int rx915_pos
    .local int rx915_off
    .local int rx915_eos
    .local int rx915_rep
    .local pmc rx915_cur
    (rx915_cur, rx915_pos, rx915_tgt) = self."!cursor_start"()
    rx915_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx915_cur
    .local pmc match
    .lex "$/", match
    length rx915_eos, rx915_tgt
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
.annotate "line", 440
  # rx literal  "["
    add $I11, rx915_pos, 1
    gt $I11, rx915_eos, rx915_fail
    sub $I11, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I11, 1
    ne $S10, "[", rx915_fail
    add rx915_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."ws"()
    unless $P10, rx915_fail
    rx915_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."EXPR"()
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx915_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx915_pos, 1
    gt $I11, rx915_eos, rx915_fail
    sub $I11, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I11, 1
    ne $S10, "]", rx915_fail
    add rx915_pos, 1
.annotate "line", 441
  # rx subrule "O" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."O"("%methodop")
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx915_pos = $P10."pos"()
.annotate "line", 439
  # rx pass
    rx915_cur."!cursor_pass"(rx915_pos, "postcircumfix:sym<[ ]>")
    rx915_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx915_pos)
    .return (rx915_cur)
  rx915_fail:
.annotate "line", 417
    (rx915_rep, rx915_pos, $I10, $P10) = rx915_cur."!mark_fail"(0)
    lt rx915_pos, -1, rx915_done
    eq rx915_pos, -1, rx915_fail
    jump $I10
  rx915_done:
    rx915_cur."!cursor_fail"()
    rx915_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx915_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("226_1267204702.05125") :method
.annotate "line", 417
    $P917 = self."!PREFIX__!subrule"("", "[")
    new $P918, "ResizablePMCArray"
    push $P918, $P917
    .return ($P918)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("227_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx921_tgt
    .local int rx921_pos
    .local int rx921_off
    .local int rx921_eos
    .local int rx921_rep
    .local pmc rx921_cur
    (rx921_cur, rx921_pos, rx921_tgt) = self."!cursor_start"()
    rx921_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx921_cur
    .local pmc match
    .lex "$/", match
    length rx921_eos, rx921_tgt
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
.annotate "line", 445
  # rx literal  "{"
    add $I11, rx921_pos, 1
    gt $I11, rx921_eos, rx921_fail
    sub $I11, rx921_pos, rx921_off
    substr $S10, rx921_tgt, $I11, 1
    ne $S10, "{", rx921_fail
    add rx921_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."ws"()
    unless $P10, rx921_fail
    rx921_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."EXPR"()
    unless $P10, rx921_fail
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx921_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx921_pos, 1
    gt $I11, rx921_eos, rx921_fail
    sub $I11, rx921_pos, rx921_off
    substr $S10, rx921_tgt, $I11, 1
    ne $S10, "}", rx921_fail
    add rx921_pos, 1
.annotate "line", 446
  # rx subrule "O" subtype=capture negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."O"("%methodop")
    unless $P10, rx921_fail
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx921_pos = $P10."pos"()
.annotate "line", 444
  # rx pass
    rx921_cur."!cursor_pass"(rx921_pos, "postcircumfix:sym<{ }>")
    rx921_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx921_pos)
    .return (rx921_cur)
  rx921_fail:
.annotate "line", 417
    (rx921_rep, rx921_pos, $I10, $P10) = rx921_cur."!mark_fail"(0)
    lt rx921_pos, -1, rx921_done
    eq rx921_pos, -1, rx921_fail
    jump $I10
  rx921_done:
    rx921_cur."!cursor_fail"()
    rx921_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx921_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("228_1267204702.05125") :method
.annotate "line", 417
    $P923 = self."!PREFIX__!subrule"("", "{")
    new $P924, "ResizablePMCArray"
    push $P924, $P923
    .return ($P924)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("229_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
.annotate "line", 450
  # rx enumcharlist negate=0 zerowidth
    ge rx927_pos, rx927_eos, rx927_fail
    sub $I10, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx927_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."quote_EXPR"(":q")
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx927_pos = $P10."pos"()
.annotate "line", 451
  # rx subrule "O" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."O"("%methodop")
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx927_pos = $P10."pos"()
.annotate "line", 449
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "postcircumfix:sym<ang>")
    rx927_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate "line", 417
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("230_1267204702.05125") :method
.annotate "line", 417
    new $P929, "ResizablePMCArray"
    push $P929, "<"
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("231_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx932_tgt
    .local int rx932_pos
    .local int rx932_off
    .local int rx932_eos
    .local int rx932_rep
    .local pmc rx932_cur
    (rx932_cur, rx932_pos, rx932_tgt) = self."!cursor_start"()
    rx932_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx932_cur
    .local pmc match
    .lex "$/", match
    length rx932_eos, rx932_tgt
    set rx932_off, 0
    lt rx932_pos, 2, rx932_start
    sub rx932_off, rx932_pos, 1
    substr rx932_tgt, rx932_tgt, rx932_off
  rx932_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan936_done
    goto rxscan936_scan
  rxscan936_loop:
    ($P10) = rx932_cur."from"()
    inc $P10
    set rx932_pos, $P10
    ge rx932_pos, rx932_eos, rxscan936_done
  rxscan936_scan:
    set_addr $I10, rxscan936_loop
    rx932_cur."!mark_push"(0, rx932_pos, $I10)
  rxscan936_done:
.annotate "line", 455
  # rx literal  "("
    add $I11, rx932_pos, 1
    gt $I11, rx932_eos, rx932_fail
    sub $I11, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I11, 1
    ne $S10, "(", rx932_fail
    add rx932_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."ws"()
    unless $P10, rx932_fail
    rx932_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."arglist"()
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx932_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx932_pos, 1
    gt $I11, rx932_eos, rx932_fail
    sub $I11, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I11, 1
    ne $S10, ")", rx932_fail
    add rx932_pos, 1
.annotate "line", 456
  # rx subrule "O" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."O"("%methodop")
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx932_pos = $P10."pos"()
.annotate "line", 454
  # rx pass
    rx932_cur."!cursor_pass"(rx932_pos, "postcircumfix:sym<( )>")
    rx932_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx932_pos)
    .return (rx932_cur)
  rx932_fail:
.annotate "line", 417
    (rx932_rep, rx932_pos, $I10, $P10) = rx932_cur."!mark_fail"(0)
    lt rx932_pos, -1, rx932_done
    eq rx932_pos, -1, rx932_fail
    jump $I10
  rx932_done:
    rx932_cur."!cursor_fail"()
    rx932_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx932_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("232_1267204702.05125") :method
.annotate "line", 417
    $P934 = self."!PREFIX__!subrule"("", "(")
    new $P935, "ResizablePMCArray"
    push $P935, $P934
    .return ($P935)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("233_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx938_tgt
    .local int rx938_pos
    .local int rx938_off
    .local int rx938_eos
    .local int rx938_rep
    .local pmc rx938_cur
    (rx938_cur, rx938_pos, rx938_tgt) = self."!cursor_start"()
    rx938_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx938_cur
    .local pmc match
    .lex "$/", match
    length rx938_eos, rx938_tgt
    set rx938_off, 0
    lt rx938_pos, 2, rx938_start
    sub rx938_off, rx938_pos, 1
    substr rx938_tgt, rx938_tgt, rx938_off
  rx938_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan942_done
    goto rxscan942_scan
  rxscan942_loop:
    ($P10) = rx938_cur."from"()
    inc $P10
    set rx938_pos, $P10
    ge rx938_pos, rx938_eos, rxscan942_done
  rxscan942_scan:
    set_addr $I10, rxscan942_loop
    rx938_cur."!mark_push"(0, rx938_pos, $I10)
  rxscan942_done:
.annotate "line", 459
  # rx subrule "dotty" subtype=capture negate=
    rx938_cur."!cursor_pos"(rx938_pos)
    $P10 = rx938_cur."dotty"()
    unless $P10, rx938_fail
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx938_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx938_cur."!cursor_pos"(rx938_pos)
    $P10 = rx938_cur."O"("%methodop")
    unless $P10, rx938_fail
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx938_pos = $P10."pos"()
  # rx pass
    rx938_cur."!cursor_pass"(rx938_pos, "postfix:sym<.>")
    rx938_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx938_pos)
    .return (rx938_cur)
  rx938_fail:
.annotate "line", 417
    (rx938_rep, rx938_pos, $I10, $P10) = rx938_cur."!mark_fail"(0)
    lt rx938_pos, -1, rx938_done
    eq rx938_pos, -1, rx938_fail
    jump $I10
  rx938_done:
    rx938_cur."!cursor_fail"()
    rx938_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx938_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("234_1267204702.05125") :method
.annotate "line", 417
    $P940 = self."!PREFIX__!subrule"("dotty", "")
    new $P941, "ResizablePMCArray"
    push $P941, $P940
    .return ($P941)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("235_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx944_tgt
    .local int rx944_pos
    .local int rx944_off
    .local int rx944_eos
    .local int rx944_rep
    .local pmc rx944_cur
    (rx944_cur, rx944_pos, rx944_tgt) = self."!cursor_start"()
    rx944_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx944_cur
    .local pmc match
    .lex "$/", match
    length rx944_eos, rx944_tgt
    set rx944_off, 0
    lt rx944_pos, 2, rx944_start
    sub rx944_off, rx944_pos, 1
    substr rx944_tgt, rx944_tgt, rx944_off
  rx944_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan948_done
    goto rxscan948_scan
  rxscan948_loop:
    ($P10) = rx944_cur."from"()
    inc $P10
    set rx944_pos, $P10
    ge rx944_pos, rx944_eos, rxscan948_done
  rxscan948_scan:
    set_addr $I10, rxscan948_loop
    rx944_cur."!mark_push"(0, rx944_pos, $I10)
  rxscan948_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_949_fail
    rx944_cur."!mark_push"(0, rx944_pos, $I10)
  # rx literal  "++"
    add $I11, rx944_pos, 2
    gt $I11, rx944_eos, rx944_fail
    sub $I11, rx944_pos, rx944_off
    substr $S10, rx944_tgt, $I11, 2
    ne $S10, "++", rx944_fail
    add rx944_pos, 2
    set_addr $I10, rxcap_949_fail
    ($I12, $I11) = rx944_cur."!mark_peek"($I10)
    rx944_cur."!cursor_pos"($I11)
    ($P10) = rx944_cur."!cursor_start"()
    $P10."!cursor_pass"(rx944_pos, "")
    rx944_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_949_done
  rxcap_949_fail:
    goto rx944_fail
  rxcap_949_done:
  # rx subrule "O" subtype=capture negate=
    rx944_cur."!cursor_pos"(rx944_pos)
    $P10 = rx944_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx944_fail
    rx944_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx944_pos = $P10."pos"()
  # rx pass
    rx944_cur."!cursor_pass"(rx944_pos, "prefix:sym<++>")
    rx944_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx944_pos)
    .return (rx944_cur)
  rx944_fail:
.annotate "line", 417
    (rx944_rep, rx944_pos, $I10, $P10) = rx944_cur."!mark_fail"(0)
    lt rx944_pos, -1, rx944_done
    eq rx944_pos, -1, rx944_fail
    jump $I10
  rx944_done:
    rx944_cur."!cursor_fail"()
    rx944_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx944_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("236_1267204702.05125") :method
.annotate "line", 417
    $P946 = self."!PREFIX__!subrule"("O", "++")
    new $P947, "ResizablePMCArray"
    push $P947, $P946
    .return ($P947)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("237_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    (rx951_cur, rx951_pos, rx951_tgt) = self."!cursor_start"()
    rx951_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx951_cur
    .local pmc match
    .lex "$/", match
    length rx951_eos, rx951_tgt
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
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_956_fail
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  # rx literal  "--"
    add $I11, rx951_pos, 2
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I11, 2
    ne $S10, "--", rx951_fail
    add rx951_pos, 2
    set_addr $I10, rxcap_956_fail
    ($I12, $I11) = rx951_cur."!mark_peek"($I10)
    rx951_cur."!cursor_pos"($I11)
    ($P10) = rx951_cur."!cursor_start"()
    $P10."!cursor_pass"(rx951_pos, "")
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_956_done
  rxcap_956_fail:
    goto rx951_fail
  rxcap_956_done:
  # rx subrule "O" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx951_fail
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx951_pos = $P10."pos"()
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "prefix:sym<-->")
    rx951_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx951_pos)
    .return (rx951_cur)
  rx951_fail:
.annotate "line", 417
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    rx951_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("238_1267204702.05125") :method
.annotate "line", 417
    $P953 = self."!PREFIX__!subrule"("O", "--")
    new $P954, "ResizablePMCArray"
    push $P954, $P953
    .return ($P954)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("239_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    (rx958_cur, rx958_pos, rx958_tgt) = self."!cursor_start"()
    rx958_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_963_fail
    rx958_cur."!mark_push"(0, rx958_pos, $I10)
  # rx literal  "++"
    add $I11, rx958_pos, 2
    gt $I11, rx958_eos, rx958_fail
    sub $I11, rx958_pos, rx958_off
    substr $S10, rx958_tgt, $I11, 2
    ne $S10, "++", rx958_fail
    add rx958_pos, 2
    set_addr $I10, rxcap_963_fail
    ($I12, $I11) = rx958_cur."!mark_peek"($I10)
    rx958_cur."!cursor_pos"($I11)
    ($P10) = rx958_cur."!cursor_start"()
    $P10."!cursor_pass"(rx958_pos, "")
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_963_done
  rxcap_963_fail:
    goto rx958_fail
  rxcap_963_done:
  # rx subrule "O" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."O"("%autoincrement")
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx958_pos = $P10."pos"()
  # rx pass
    rx958_cur."!cursor_pass"(rx958_pos, "postfix:sym<++>")
    rx958_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx958_pos)
    .return (rx958_cur)
  rx958_fail:
.annotate "line", 417
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    rx958_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("240_1267204702.05125") :method
.annotate "line", 417
    $P960 = self."!PREFIX__!subrule"("O", "++")
    new $P961, "ResizablePMCArray"
    push $P961, $P960
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("241_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx965_tgt
    .local int rx965_pos
    .local int rx965_off
    .local int rx965_eos
    .local int rx965_rep
    .local pmc rx965_cur
    (rx965_cur, rx965_pos, rx965_tgt) = self."!cursor_start"()
    rx965_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx965_cur
    .local pmc match
    .lex "$/", match
    length rx965_eos, rx965_tgt
    set rx965_off, 0
    lt rx965_pos, 2, rx965_start
    sub rx965_off, rx965_pos, 1
    substr rx965_tgt, rx965_tgt, rx965_off
  rx965_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan969_done
    goto rxscan969_scan
  rxscan969_loop:
    ($P10) = rx965_cur."from"()
    inc $P10
    set rx965_pos, $P10
    ge rx965_pos, rx965_eos, rxscan969_done
  rxscan969_scan:
    set_addr $I10, rxscan969_loop
    rx965_cur."!mark_push"(0, rx965_pos, $I10)
  rxscan969_done:
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_970_fail
    rx965_cur."!mark_push"(0, rx965_pos, $I10)
  # rx literal  "--"
    add $I11, rx965_pos, 2
    gt $I11, rx965_eos, rx965_fail
    sub $I11, rx965_pos, rx965_off
    substr $S10, rx965_tgt, $I11, 2
    ne $S10, "--", rx965_fail
    add rx965_pos, 2
    set_addr $I10, rxcap_970_fail
    ($I12, $I11) = rx965_cur."!mark_peek"($I10)
    rx965_cur."!cursor_pos"($I11)
    ($P10) = rx965_cur."!cursor_start"()
    $P10."!cursor_pass"(rx965_pos, "")
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_970_done
  rxcap_970_fail:
    goto rx965_fail
  rxcap_970_done:
  # rx subrule "O" subtype=capture negate=
    rx965_cur."!cursor_pos"(rx965_pos)
    $P10 = rx965_cur."O"("%autoincrement")
    unless $P10, rx965_fail
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx965_pos = $P10."pos"()
  # rx pass
    rx965_cur."!cursor_pass"(rx965_pos, "postfix:sym<-->")
    rx965_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx965_pos)
    .return (rx965_cur)
  rx965_fail:
.annotate "line", 417
    (rx965_rep, rx965_pos, $I10, $P10) = rx965_cur."!mark_fail"(0)
    lt rx965_pos, -1, rx965_done
    eq rx965_pos, -1, rx965_fail
    jump $I10
  rx965_done:
    rx965_cur."!cursor_fail"()
    rx965_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx965_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("242_1267204702.05125") :method
.annotate "line", 417
    $P967 = self."!PREFIX__!subrule"("O", "--")
    new $P968, "ResizablePMCArray"
    push $P968, $P967
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("243_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx972_tgt
    .local int rx972_pos
    .local int rx972_off
    .local int rx972_eos
    .local int rx972_rep
    .local pmc rx972_cur
    (rx972_cur, rx972_pos, rx972_tgt) = self."!cursor_start"()
    rx972_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx972_cur
    .local pmc match
    .lex "$/", match
    length rx972_eos, rx972_tgt
    set rx972_off, 0
    lt rx972_pos, 2, rx972_start
    sub rx972_off, rx972_pos, 1
    substr rx972_tgt, rx972_tgt, rx972_off
  rx972_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan976_done
    goto rxscan976_scan
  rxscan976_loop:
    ($P10) = rx972_cur."from"()
    inc $P10
    set rx972_pos, $P10
    ge rx972_pos, rx972_eos, rxscan976_done
  rxscan976_scan:
    set_addr $I10, rxscan976_loop
    rx972_cur."!mark_push"(0, rx972_pos, $I10)
  rxscan976_done:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_977_fail
    rx972_cur."!mark_push"(0, rx972_pos, $I10)
  # rx literal  "**"
    add $I11, rx972_pos, 2
    gt $I11, rx972_eos, rx972_fail
    sub $I11, rx972_pos, rx972_off
    substr $S10, rx972_tgt, $I11, 2
    ne $S10, "**", rx972_fail
    add rx972_pos, 2
    set_addr $I10, rxcap_977_fail
    ($I12, $I11) = rx972_cur."!mark_peek"($I10)
    rx972_cur."!cursor_pos"($I11)
    ($P10) = rx972_cur."!cursor_start"()
    $P10."!cursor_pass"(rx972_pos, "")
    rx972_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_977_done
  rxcap_977_fail:
    goto rx972_fail
  rxcap_977_done:
  # rx subrule "O" subtype=capture negate=
    rx972_cur."!cursor_pos"(rx972_pos)
    $P10 = rx972_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx972_fail
    rx972_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx972_pos = $P10."pos"()
  # rx pass
    rx972_cur."!cursor_pass"(rx972_pos, "infix:sym<**>")
    rx972_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx972_pos)
    .return (rx972_cur)
  rx972_fail:
.annotate "line", 417
    (rx972_rep, rx972_pos, $I10, $P10) = rx972_cur."!mark_fail"(0)
    lt rx972_pos, -1, rx972_done
    eq rx972_pos, -1, rx972_fail
    jump $I10
  rx972_done:
    rx972_cur."!cursor_fail"()
    rx972_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx972_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("244_1267204702.05125") :method
.annotate "line", 417
    $P974 = self."!PREFIX__!subrule"("O", "**")
    new $P975, "ResizablePMCArray"
    push $P975, $P974
    .return ($P975)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("245_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx979_tgt
    .local int rx979_pos
    .local int rx979_off
    .local int rx979_eos
    .local int rx979_rep
    .local pmc rx979_cur
    (rx979_cur, rx979_pos, rx979_tgt) = self."!cursor_start"()
    rx979_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx979_cur
    .local pmc match
    .lex "$/", match
    length rx979_eos, rx979_tgt
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
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_984_fail
    rx979_cur."!mark_push"(0, rx979_pos, $I10)
  # rx literal  "+"
    add $I11, rx979_pos, 1
    gt $I11, rx979_eos, rx979_fail
    sub $I11, rx979_pos, rx979_off
    substr $S10, rx979_tgt, $I11, 1
    ne $S10, "+", rx979_fail
    add rx979_pos, 1
    set_addr $I10, rxcap_984_fail
    ($I12, $I11) = rx979_cur."!mark_peek"($I10)
    rx979_cur."!cursor_pos"($I11)
    ($P10) = rx979_cur."!cursor_start"()
    $P10."!cursor_pass"(rx979_pos, "")
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_984_done
  rxcap_984_fail:
    goto rx979_fail
  rxcap_984_done:
  # rx subrule "O" subtype=capture negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx979_fail
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx979_pos = $P10."pos"()
  # rx pass
    rx979_cur."!cursor_pass"(rx979_pos, "prefix:sym<+>")
    rx979_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx979_pos)
    .return (rx979_cur)
  rx979_fail:
.annotate "line", 417
    (rx979_rep, rx979_pos, $I10, $P10) = rx979_cur."!mark_fail"(0)
    lt rx979_pos, -1, rx979_done
    eq rx979_pos, -1, rx979_fail
    jump $I10
  rx979_done:
    rx979_cur."!cursor_fail"()
    rx979_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx979_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("246_1267204702.05125") :method
.annotate "line", 417
    $P981 = self."!PREFIX__!subrule"("O", "+")
    new $P982, "ResizablePMCArray"
    push $P982, $P981
    .return ($P982)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("247_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx986_tgt
    .local int rx986_pos
    .local int rx986_off
    .local int rx986_eos
    .local int rx986_rep
    .local pmc rx986_cur
    (rx986_cur, rx986_pos, rx986_tgt) = self."!cursor_start"()
    rx986_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx986_cur
    .local pmc match
    .lex "$/", match
    length rx986_eos, rx986_tgt
    set rx986_off, 0
    lt rx986_pos, 2, rx986_start
    sub rx986_off, rx986_pos, 1
    substr rx986_tgt, rx986_tgt, rx986_off
  rx986_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan990_done
    goto rxscan990_scan
  rxscan990_loop:
    ($P10) = rx986_cur."from"()
    inc $P10
    set rx986_pos, $P10
    ge rx986_pos, rx986_eos, rxscan990_done
  rxscan990_scan:
    set_addr $I10, rxscan990_loop
    rx986_cur."!mark_push"(0, rx986_pos, $I10)
  rxscan990_done:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_991_fail
    rx986_cur."!mark_push"(0, rx986_pos, $I10)
  # rx literal  "~"
    add $I11, rx986_pos, 1
    gt $I11, rx986_eos, rx986_fail
    sub $I11, rx986_pos, rx986_off
    substr $S10, rx986_tgt, $I11, 1
    ne $S10, "~", rx986_fail
    add rx986_pos, 1
    set_addr $I10, rxcap_991_fail
    ($I12, $I11) = rx986_cur."!mark_peek"($I10)
    rx986_cur."!cursor_pos"($I11)
    ($P10) = rx986_cur."!cursor_start"()
    $P10."!cursor_pass"(rx986_pos, "")
    rx986_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_991_done
  rxcap_991_fail:
    goto rx986_fail
  rxcap_991_done:
  # rx subrule "O" subtype=capture negate=
    rx986_cur."!cursor_pos"(rx986_pos)
    $P10 = rx986_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx986_fail
    rx986_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx986_pos = $P10."pos"()
  # rx pass
    rx986_cur."!cursor_pass"(rx986_pos, "prefix:sym<~>")
    rx986_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx986_pos)
    .return (rx986_cur)
  rx986_fail:
.annotate "line", 417
    (rx986_rep, rx986_pos, $I10, $P10) = rx986_cur."!mark_fail"(0)
    lt rx986_pos, -1, rx986_done
    eq rx986_pos, -1, rx986_fail
    jump $I10
  rx986_done:
    rx986_cur."!cursor_fail"()
    rx986_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx986_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("248_1267204702.05125") :method
.annotate "line", 417
    $P988 = self."!PREFIX__!subrule"("O", "~")
    new $P989, "ResizablePMCArray"
    push $P989, $P988
    .return ($P989)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("249_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    (rx993_cur, rx993_pos, rx993_tgt) = self."!cursor_start"()
    rx993_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx993_cur
    .local pmc match
    .lex "$/", match
    length rx993_eos, rx993_tgt
    set rx993_off, 0
    lt rx993_pos, 2, rx993_start
    sub rx993_off, rx993_pos, 1
    substr rx993_tgt, rx993_tgt, rx993_off
  rx993_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan996_done
    goto rxscan996_scan
  rxscan996_loop:
    ($P10) = rx993_cur."from"()
    inc $P10
    set rx993_pos, $P10
    ge rx993_pos, rx993_eos, rxscan996_done
  rxscan996_scan:
    set_addr $I10, rxscan996_loop
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  rxscan996_done:
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_997_fail
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  # rx literal  "-"
    add $I11, rx993_pos, 1
    gt $I11, rx993_eos, rx993_fail
    sub $I11, rx993_pos, rx993_off
    substr $S10, rx993_tgt, $I11, 1
    ne $S10, "-", rx993_fail
    add rx993_pos, 1
    set_addr $I10, rxcap_997_fail
    ($I12, $I11) = rx993_cur."!mark_peek"($I10)
    rx993_cur."!cursor_pos"($I11)
    ($P10) = rx993_cur."!cursor_start"()
    $P10."!cursor_pass"(rx993_pos, "")
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_997_done
  rxcap_997_fail:
    goto rx993_fail
  rxcap_997_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx993_pos, rx993_eos, rx993_fail
    sub $I10, rx993_pos, rx993_off
    substr $S10, rx993_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx993_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."number"()
    if $P10, rx993_fail
  # rx subrule "O" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx993_pos = $P10."pos"()
  # rx pass
    rx993_cur."!cursor_pass"(rx993_pos, "prefix:sym<->")
    rx993_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx993_pos)
    .return (rx993_cur)
  rx993_fail:
.annotate "line", 417
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    rx993_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("250_1267204702.05125") :method
.annotate "line", 417
    new $P995, "ResizablePMCArray"
    push $P995, "-"
    .return ($P995)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("251_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx999_tgt
    .local int rx999_pos
    .local int rx999_off
    .local int rx999_eos
    .local int rx999_rep
    .local pmc rx999_cur
    (rx999_cur, rx999_pos, rx999_tgt) = self."!cursor_start"()
    rx999_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx999_cur
    .local pmc match
    .lex "$/", match
    length rx999_eos, rx999_tgt
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
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1004_fail
    rx999_cur."!mark_push"(0, rx999_pos, $I10)
  # rx literal  "?"
    add $I11, rx999_pos, 1
    gt $I11, rx999_eos, rx999_fail
    sub $I11, rx999_pos, rx999_off
    substr $S10, rx999_tgt, $I11, 1
    ne $S10, "?", rx999_fail
    add rx999_pos, 1
    set_addr $I10, rxcap_1004_fail
    ($I12, $I11) = rx999_cur."!mark_peek"($I10)
    rx999_cur."!cursor_pos"($I11)
    ($P10) = rx999_cur."!cursor_start"()
    $P10."!cursor_pass"(rx999_pos, "")
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1004_done
  rxcap_1004_fail:
    goto rx999_fail
  rxcap_1004_done:
  # rx subrule "O" subtype=capture negate=
    rx999_cur."!cursor_pos"(rx999_pos)
    $P10 = rx999_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx999_fail
    rx999_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx999_pos = $P10."pos"()
  # rx pass
    rx999_cur."!cursor_pass"(rx999_pos, "prefix:sym<?>")
    rx999_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx999_pos)
    .return (rx999_cur)
  rx999_fail:
.annotate "line", 417
    (rx999_rep, rx999_pos, $I10, $P10) = rx999_cur."!mark_fail"(0)
    lt rx999_pos, -1, rx999_done
    eq rx999_pos, -1, rx999_fail
    jump $I10
  rx999_done:
    rx999_cur."!cursor_fail"()
    rx999_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx999_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("252_1267204702.05125") :method
.annotate "line", 417
    $P1001 = self."!PREFIX__!subrule"("O", "?")
    new $P1002, "ResizablePMCArray"
    push $P1002, $P1001
    .return ($P1002)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("253_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1006_tgt
    .local int rx1006_pos
    .local int rx1006_off
    .local int rx1006_eos
    .local int rx1006_rep
    .local pmc rx1006_cur
    (rx1006_cur, rx1006_pos, rx1006_tgt) = self."!cursor_start"()
    rx1006_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx1006_cur
    .local pmc match
    .lex "$/", match
    length rx1006_eos, rx1006_tgt
    set rx1006_off, 0
    lt rx1006_pos, 2, rx1006_start
    sub rx1006_off, rx1006_pos, 1
    substr rx1006_tgt, rx1006_tgt, rx1006_off
  rx1006_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1010_done
    goto rxscan1010_scan
  rxscan1010_loop:
    ($P10) = rx1006_cur."from"()
    inc $P10
    set rx1006_pos, $P10
    ge rx1006_pos, rx1006_eos, rxscan1010_done
  rxscan1010_scan:
    set_addr $I10, rxscan1010_loop
    rx1006_cur."!mark_push"(0, rx1006_pos, $I10)
  rxscan1010_done:
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1011_fail
    rx1006_cur."!mark_push"(0, rx1006_pos, $I10)
  # rx literal  "!"
    add $I11, rx1006_pos, 1
    gt $I11, rx1006_eos, rx1006_fail
    sub $I11, rx1006_pos, rx1006_off
    substr $S10, rx1006_tgt, $I11, 1
    ne $S10, "!", rx1006_fail
    add rx1006_pos, 1
    set_addr $I10, rxcap_1011_fail
    ($I12, $I11) = rx1006_cur."!mark_peek"($I10)
    rx1006_cur."!cursor_pos"($I11)
    ($P10) = rx1006_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1006_pos, "")
    rx1006_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1011_done
  rxcap_1011_fail:
    goto rx1006_fail
  rxcap_1011_done:
  # rx subrule "O" subtype=capture negate=
    rx1006_cur."!cursor_pos"(rx1006_pos)
    $P10 = rx1006_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx1006_fail
    rx1006_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1006_pos = $P10."pos"()
  # rx pass
    rx1006_cur."!cursor_pass"(rx1006_pos, "prefix:sym<!>")
    rx1006_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx1006_pos)
    .return (rx1006_cur)
  rx1006_fail:
.annotate "line", 417
    (rx1006_rep, rx1006_pos, $I10, $P10) = rx1006_cur."!mark_fail"(0)
    lt rx1006_pos, -1, rx1006_done
    eq rx1006_pos, -1, rx1006_fail
    jump $I10
  rx1006_done:
    rx1006_cur."!cursor_fail"()
    rx1006_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx1006_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("254_1267204702.05125") :method
.annotate "line", 417
    $P1008 = self."!PREFIX__!subrule"("O", "!")
    new $P1009, "ResizablePMCArray"
    push $P1009, $P1008
    .return ($P1009)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("255_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1013_tgt
    .local int rx1013_pos
    .local int rx1013_off
    .local int rx1013_eos
    .local int rx1013_rep
    .local pmc rx1013_cur
    (rx1013_cur, rx1013_pos, rx1013_tgt) = self."!cursor_start"()
    rx1013_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx1013_cur
    .local pmc match
    .lex "$/", match
    length rx1013_eos, rx1013_tgt
    set rx1013_off, 0
    lt rx1013_pos, 2, rx1013_start
    sub rx1013_off, rx1013_pos, 1
    substr rx1013_tgt, rx1013_tgt, rx1013_off
  rx1013_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1017_done
    goto rxscan1017_scan
  rxscan1017_loop:
    ($P10) = rx1013_cur."from"()
    inc $P10
    set rx1013_pos, $P10
    ge rx1013_pos, rx1013_eos, rxscan1017_done
  rxscan1017_scan:
    set_addr $I10, rxscan1017_loop
    rx1013_cur."!mark_push"(0, rx1013_pos, $I10)
  rxscan1017_done:
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1018_fail
    rx1013_cur."!mark_push"(0, rx1013_pos, $I10)
  # rx literal  "|"
    add $I11, rx1013_pos, 1
    gt $I11, rx1013_eos, rx1013_fail
    sub $I11, rx1013_pos, rx1013_off
    substr $S10, rx1013_tgt, $I11, 1
    ne $S10, "|", rx1013_fail
    add rx1013_pos, 1
    set_addr $I10, rxcap_1018_fail
    ($I12, $I11) = rx1013_cur."!mark_peek"($I10)
    rx1013_cur."!cursor_pos"($I11)
    ($P10) = rx1013_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1013_pos, "")
    rx1013_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1018_done
  rxcap_1018_fail:
    goto rx1013_fail
  rxcap_1018_done:
  # rx subrule "O" subtype=capture negate=
    rx1013_cur."!cursor_pos"(rx1013_pos)
    $P10 = rx1013_cur."O"("%symbolic_unary")
    unless $P10, rx1013_fail
    rx1013_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1013_pos = $P10."pos"()
  # rx pass
    rx1013_cur."!cursor_pass"(rx1013_pos, "prefix:sym<|>")
    rx1013_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx1013_pos)
    .return (rx1013_cur)
  rx1013_fail:
.annotate "line", 417
    (rx1013_rep, rx1013_pos, $I10, $P10) = rx1013_cur."!mark_fail"(0)
    lt rx1013_pos, -1, rx1013_done
    eq rx1013_pos, -1, rx1013_fail
    jump $I10
  rx1013_done:
    rx1013_cur."!cursor_fail"()
    rx1013_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx1013_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("256_1267204702.05125") :method
.annotate "line", 417
    $P1015 = self."!PREFIX__!subrule"("O", "|")
    new $P1016, "ResizablePMCArray"
    push $P1016, $P1015
    .return ($P1016)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("257_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx1020_cur
    .local pmc match
    .lex "$/", match
    length rx1020_eos, rx1020_tgt
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
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1025_fail
    rx1020_cur."!mark_push"(0, rx1020_pos, $I10)
  # rx literal  "*"
    add $I11, rx1020_pos, 1
    gt $I11, rx1020_eos, rx1020_fail
    sub $I11, rx1020_pos, rx1020_off
    substr $S10, rx1020_tgt, $I11, 1
    ne $S10, "*", rx1020_fail
    add rx1020_pos, 1
    set_addr $I10, rxcap_1025_fail
    ($I12, $I11) = rx1020_cur."!mark_peek"($I10)
    rx1020_cur."!cursor_pos"($I11)
    ($P10) = rx1020_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1020_pos, "")
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1025_done
  rxcap_1025_fail:
    goto rx1020_fail
  rxcap_1025_done:
  # rx subrule "O" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1020_pos = $P10."pos"()
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "infix:sym<*>")
    rx1020_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
.annotate "line", 417
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("258_1267204702.05125") :method
.annotate "line", 417
    $P1022 = self."!PREFIX__!subrule"("O", "*")
    new $P1023, "ResizablePMCArray"
    push $P1023, $P1022
    .return ($P1023)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("259_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1027_tgt
    .local int rx1027_pos
    .local int rx1027_off
    .local int rx1027_eos
    .local int rx1027_rep
    .local pmc rx1027_cur
    (rx1027_cur, rx1027_pos, rx1027_tgt) = self."!cursor_start"()
    rx1027_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx1027_cur
    .local pmc match
    .lex "$/", match
    length rx1027_eos, rx1027_tgt
    set rx1027_off, 0
    lt rx1027_pos, 2, rx1027_start
    sub rx1027_off, rx1027_pos, 1
    substr rx1027_tgt, rx1027_tgt, rx1027_off
  rx1027_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1031_done
    goto rxscan1031_scan
  rxscan1031_loop:
    ($P10) = rx1027_cur."from"()
    inc $P10
    set rx1027_pos, $P10
    ge rx1027_pos, rx1027_eos, rxscan1031_done
  rxscan1031_scan:
    set_addr $I10, rxscan1031_loop
    rx1027_cur."!mark_push"(0, rx1027_pos, $I10)
  rxscan1031_done:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1032_fail
    rx1027_cur."!mark_push"(0, rx1027_pos, $I10)
  # rx literal  "/"
    add $I11, rx1027_pos, 1
    gt $I11, rx1027_eos, rx1027_fail
    sub $I11, rx1027_pos, rx1027_off
    substr $S10, rx1027_tgt, $I11, 1
    ne $S10, "/", rx1027_fail
    add rx1027_pos, 1
    set_addr $I10, rxcap_1032_fail
    ($I12, $I11) = rx1027_cur."!mark_peek"($I10)
    rx1027_cur."!cursor_pos"($I11)
    ($P10) = rx1027_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1027_pos, "")
    rx1027_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1032_done
  rxcap_1032_fail:
    goto rx1027_fail
  rxcap_1032_done:
  # rx subrule "O" subtype=capture negate=
    rx1027_cur."!cursor_pos"(rx1027_pos)
    $P10 = rx1027_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx1027_fail
    rx1027_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1027_pos = $P10."pos"()
  # rx pass
    rx1027_cur."!cursor_pass"(rx1027_pos, "infix:sym</>")
    rx1027_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx1027_pos)
    .return (rx1027_cur)
  rx1027_fail:
.annotate "line", 417
    (rx1027_rep, rx1027_pos, $I10, $P10) = rx1027_cur."!mark_fail"(0)
    lt rx1027_pos, -1, rx1027_done
    eq rx1027_pos, -1, rx1027_fail
    jump $I10
  rx1027_done:
    rx1027_cur."!cursor_fail"()
    rx1027_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx1027_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("260_1267204702.05125") :method
.annotate "line", 417
    $P1029 = self."!PREFIX__!subrule"("O", "/")
    new $P1030, "ResizablePMCArray"
    push $P1030, $P1029
    .return ($P1030)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("261_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1034_tgt
    .local int rx1034_pos
    .local int rx1034_off
    .local int rx1034_eos
    .local int rx1034_rep
    .local pmc rx1034_cur
    (rx1034_cur, rx1034_pos, rx1034_tgt) = self."!cursor_start"()
    rx1034_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1034_cur
    .local pmc match
    .lex "$/", match
    length rx1034_eos, rx1034_tgt
    set rx1034_off, 0
    lt rx1034_pos, 2, rx1034_start
    sub rx1034_off, rx1034_pos, 1
    substr rx1034_tgt, rx1034_tgt, rx1034_off
  rx1034_start:
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
.annotate "line", 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1039_fail
    rx1034_cur."!mark_push"(0, rx1034_pos, $I10)
  # rx literal  "%"
    add $I11, rx1034_pos, 1
    gt $I11, rx1034_eos, rx1034_fail
    sub $I11, rx1034_pos, rx1034_off
    substr $S10, rx1034_tgt, $I11, 1
    ne $S10, "%", rx1034_fail
    add rx1034_pos, 1
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
    $P10 = rx1034_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1034_fail
    rx1034_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1034_pos = $P10."pos"()
  # rx pass
    rx1034_cur."!cursor_pass"(rx1034_pos, "infix:sym<%>")
    rx1034_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1034_pos)
    .return (rx1034_cur)
  rx1034_fail:
.annotate "line", 417
    (rx1034_rep, rx1034_pos, $I10, $P10) = rx1034_cur."!mark_fail"(0)
    lt rx1034_pos, -1, rx1034_done
    eq rx1034_pos, -1, rx1034_fail
    jump $I10
  rx1034_done:
    rx1034_cur."!cursor_fail"()
    rx1034_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1034_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("262_1267204702.05125") :method
.annotate "line", 417
    $P1036 = self."!PREFIX__!subrule"("O", "%")
    new $P1037, "ResizablePMCArray"
    push $P1037, $P1036
    .return ($P1037)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("263_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1041_tgt
    .local int rx1041_pos
    .local int rx1041_off
    .local int rx1041_eos
    .local int rx1041_rep
    .local pmc rx1041_cur
    (rx1041_cur, rx1041_pos, rx1041_tgt) = self."!cursor_start"()
    rx1041_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1041_cur
    .local pmc match
    .lex "$/", match
    length rx1041_eos, rx1041_tgt
    set rx1041_off, 0
    lt rx1041_pos, 2, rx1041_start
    sub rx1041_off, rx1041_pos, 1
    substr rx1041_tgt, rx1041_tgt, rx1041_off
  rx1041_start:
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
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1046_fail
    rx1041_cur."!mark_push"(0, rx1041_pos, $I10)
  # rx literal  "+"
    add $I11, rx1041_pos, 1
    gt $I11, rx1041_eos, rx1041_fail
    sub $I11, rx1041_pos, rx1041_off
    substr $S10, rx1041_tgt, $I11, 1
    ne $S10, "+", rx1041_fail
    add rx1041_pos, 1
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
    $P10 = rx1041_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1041_fail
    rx1041_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1041_pos = $P10."pos"()
  # rx pass
    rx1041_cur."!cursor_pass"(rx1041_pos, "infix:sym<+>")
    rx1041_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1041_pos)
    .return (rx1041_cur)
  rx1041_fail:
.annotate "line", 417
    (rx1041_rep, rx1041_pos, $I10, $P10) = rx1041_cur."!mark_fail"(0)
    lt rx1041_pos, -1, rx1041_done
    eq rx1041_pos, -1, rx1041_fail
    jump $I10
  rx1041_done:
    rx1041_cur."!cursor_fail"()
    rx1041_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1041_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("264_1267204702.05125") :method
.annotate "line", 417
    $P1043 = self."!PREFIX__!subrule"("O", "+")
    new $P1044, "ResizablePMCArray"
    push $P1044, $P1043
    .return ($P1044)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("265_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1048_tgt
    .local int rx1048_pos
    .local int rx1048_off
    .local int rx1048_eos
    .local int rx1048_rep
    .local pmc rx1048_cur
    (rx1048_cur, rx1048_pos, rx1048_tgt) = self."!cursor_start"()
    rx1048_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1048_cur
    .local pmc match
    .lex "$/", match
    length rx1048_eos, rx1048_tgt
    set rx1048_off, 0
    lt rx1048_pos, 2, rx1048_start
    sub rx1048_off, rx1048_pos, 1
    substr rx1048_tgt, rx1048_tgt, rx1048_off
  rx1048_start:
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
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1053_fail
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
  # rx literal  "-"
    add $I11, rx1048_pos, 1
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 1
    ne $S10, "-", rx1048_fail
    add rx1048_pos, 1
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
    $P10 = rx1048_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1048_pos = $P10."pos"()
  # rx pass
    rx1048_cur."!cursor_pass"(rx1048_pos, "infix:sym<->")
    rx1048_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1048_pos)
    .return (rx1048_cur)
  rx1048_fail:
.annotate "line", 417
    (rx1048_rep, rx1048_pos, $I10, $P10) = rx1048_cur."!mark_fail"(0)
    lt rx1048_pos, -1, rx1048_done
    eq rx1048_pos, -1, rx1048_fail
    jump $I10
  rx1048_done:
    rx1048_cur."!cursor_fail"()
    rx1048_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1048_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("266_1267204702.05125") :method
.annotate "line", 417
    $P1050 = self."!PREFIX__!subrule"("O", "-")
    new $P1051, "ResizablePMCArray"
    push $P1051, $P1050
    .return ($P1051)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("267_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1055_tgt
    .local int rx1055_pos
    .local int rx1055_off
    .local int rx1055_eos
    .local int rx1055_rep
    .local pmc rx1055_cur
    (rx1055_cur, rx1055_pos, rx1055_tgt) = self."!cursor_start"()
    rx1055_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1055_cur
    .local pmc match
    .lex "$/", match
    length rx1055_eos, rx1055_tgt
    set rx1055_off, 0
    lt rx1055_pos, 2, rx1055_start
    sub rx1055_off, rx1055_pos, 1
    substr rx1055_tgt, rx1055_tgt, rx1055_off
  rx1055_start:
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
.annotate "line", 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1060_fail
    rx1055_cur."!mark_push"(0, rx1055_pos, $I10)
  # rx literal  "~"
    add $I11, rx1055_pos, 1
    gt $I11, rx1055_eos, rx1055_fail
    sub $I11, rx1055_pos, rx1055_off
    substr $S10, rx1055_tgt, $I11, 1
    ne $S10, "~", rx1055_fail
    add rx1055_pos, 1
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
    $P10 = rx1055_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1055_fail
    rx1055_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1055_pos = $P10."pos"()
  # rx pass
    rx1055_cur."!cursor_pass"(rx1055_pos, "infix:sym<~>")
    rx1055_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1055_pos)
    .return (rx1055_cur)
  rx1055_fail:
.annotate "line", 417
    (rx1055_rep, rx1055_pos, $I10, $P10) = rx1055_cur."!mark_fail"(0)
    lt rx1055_pos, -1, rx1055_done
    eq rx1055_pos, -1, rx1055_fail
    jump $I10
  rx1055_done:
    rx1055_cur."!cursor_fail"()
    rx1055_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1055_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("268_1267204702.05125") :method
.annotate "line", 417
    $P1057 = self."!PREFIX__!subrule"("O", "~")
    new $P1058, "ResizablePMCArray"
    push $P1058, $P1057
    .return ($P1058)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("269_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1062_tgt
    .local int rx1062_pos
    .local int rx1062_off
    .local int rx1062_eos
    .local int rx1062_rep
    .local pmc rx1062_cur
    (rx1062_cur, rx1062_pos, rx1062_tgt) = self."!cursor_start"()
    rx1062_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1062_cur
    .local pmc match
    .lex "$/", match
    length rx1062_eos, rx1062_tgt
    set rx1062_off, 0
    lt rx1062_pos, 2, rx1062_start
    sub rx1062_off, rx1062_pos, 1
    substr rx1062_tgt, rx1062_tgt, rx1062_off
  rx1062_start:
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
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1067_fail
    rx1062_cur."!mark_push"(0, rx1062_pos, $I10)
  # rx literal  "=="
    add $I11, rx1062_pos, 2
    gt $I11, rx1062_eos, rx1062_fail
    sub $I11, rx1062_pos, rx1062_off
    substr $S10, rx1062_tgt, $I11, 2
    ne $S10, "==", rx1062_fail
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
    $P10 = rx1062_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1062_fail
    rx1062_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1062_pos = $P10."pos"()
  # rx pass
    rx1062_cur."!cursor_pass"(rx1062_pos, "infix:sym<==>")
    rx1062_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1062_pos)
    .return (rx1062_cur)
  rx1062_fail:
.annotate "line", 417
    (rx1062_rep, rx1062_pos, $I10, $P10) = rx1062_cur."!mark_fail"(0)
    lt rx1062_pos, -1, rx1062_done
    eq rx1062_pos, -1, rx1062_fail
    jump $I10
  rx1062_done:
    rx1062_cur."!cursor_fail"()
    rx1062_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1062_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("270_1267204702.05125") :method
.annotate "line", 417
    $P1064 = self."!PREFIX__!subrule"("O", "==")
    new $P1065, "ResizablePMCArray"
    push $P1065, $P1064
    .return ($P1065)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("271_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1069_tgt
    .local int rx1069_pos
    .local int rx1069_off
    .local int rx1069_eos
    .local int rx1069_rep
    .local pmc rx1069_cur
    (rx1069_cur, rx1069_pos, rx1069_tgt) = self."!cursor_start"()
    rx1069_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1069_cur
    .local pmc match
    .lex "$/", match
    length rx1069_eos, rx1069_tgt
    set rx1069_off, 0
    lt rx1069_pos, 2, rx1069_start
    sub rx1069_off, rx1069_pos, 1
    substr rx1069_tgt, rx1069_tgt, rx1069_off
  rx1069_start:
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
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1074_fail
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  # rx literal  "!="
    add $I11, rx1069_pos, 2
    gt $I11, rx1069_eos, rx1069_fail
    sub $I11, rx1069_pos, rx1069_off
    substr $S10, rx1069_tgt, $I11, 2
    ne $S10, "!=", rx1069_fail
    add rx1069_pos, 2
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
    $P10 = rx1069_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1069_fail
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1069_pos = $P10."pos"()
  # rx pass
    rx1069_cur."!cursor_pass"(rx1069_pos, "infix:sym<!=>")
    rx1069_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1069_pos)
    .return (rx1069_cur)
  rx1069_fail:
.annotate "line", 417
    (rx1069_rep, rx1069_pos, $I10, $P10) = rx1069_cur."!mark_fail"(0)
    lt rx1069_pos, -1, rx1069_done
    eq rx1069_pos, -1, rx1069_fail
    jump $I10
  rx1069_done:
    rx1069_cur."!cursor_fail"()
    rx1069_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1069_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("272_1267204702.05125") :method
.annotate "line", 417
    $P1071 = self."!PREFIX__!subrule"("O", "!=")
    new $P1072, "ResizablePMCArray"
    push $P1072, $P1071
    .return ($P1072)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("273_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1076_tgt
    .local int rx1076_pos
    .local int rx1076_off
    .local int rx1076_eos
    .local int rx1076_rep
    .local pmc rx1076_cur
    (rx1076_cur, rx1076_pos, rx1076_tgt) = self."!cursor_start"()
    rx1076_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1076_cur
    .local pmc match
    .lex "$/", match
    length rx1076_eos, rx1076_tgt
    set rx1076_off, 0
    lt rx1076_pos, 2, rx1076_start
    sub rx1076_off, rx1076_pos, 1
    substr rx1076_tgt, rx1076_tgt, rx1076_off
  rx1076_start:
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
.annotate "line", 488
  # rx subcapture "sym"
    set_addr $I10, rxcap_1081_fail
    rx1076_cur."!mark_push"(0, rx1076_pos, $I10)
  # rx literal  "<="
    add $I11, rx1076_pos, 2
    gt $I11, rx1076_eos, rx1076_fail
    sub $I11, rx1076_pos, rx1076_off
    substr $S10, rx1076_tgt, $I11, 2
    ne $S10, "<=", rx1076_fail
    add rx1076_pos, 2
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
    $P10 = rx1076_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1076_fail
    rx1076_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1076_pos = $P10."pos"()
  # rx pass
    rx1076_cur."!cursor_pass"(rx1076_pos, "infix:sym<<=>")
    rx1076_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1076_pos)
    .return (rx1076_cur)
  rx1076_fail:
.annotate "line", 417
    (rx1076_rep, rx1076_pos, $I10, $P10) = rx1076_cur."!mark_fail"(0)
    lt rx1076_pos, -1, rx1076_done
    eq rx1076_pos, -1, rx1076_fail
    jump $I10
  rx1076_done:
    rx1076_cur."!cursor_fail"()
    rx1076_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1076_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("274_1267204702.05125") :method
.annotate "line", 417
    $P1078 = self."!PREFIX__!subrule"("O", "<=")
    new $P1079, "ResizablePMCArray"
    push $P1079, $P1078
    .return ($P1079)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("275_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1083_tgt
    .local int rx1083_pos
    .local int rx1083_off
    .local int rx1083_eos
    .local int rx1083_rep
    .local pmc rx1083_cur
    (rx1083_cur, rx1083_pos, rx1083_tgt) = self."!cursor_start"()
    rx1083_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1083_cur
    .local pmc match
    .lex "$/", match
    length rx1083_eos, rx1083_tgt
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
.annotate "line", 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1088_fail
    rx1083_cur."!mark_push"(0, rx1083_pos, $I10)
  # rx literal  ">="
    add $I11, rx1083_pos, 2
    gt $I11, rx1083_eos, rx1083_fail
    sub $I11, rx1083_pos, rx1083_off
    substr $S10, rx1083_tgt, $I11, 2
    ne $S10, ">=", rx1083_fail
    add rx1083_pos, 2
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
    $P10 = rx1083_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1083_fail
    rx1083_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1083_pos = $P10."pos"()
  # rx pass
    rx1083_cur."!cursor_pass"(rx1083_pos, "infix:sym<>=>")
    rx1083_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1083_pos)
    .return (rx1083_cur)
  rx1083_fail:
.annotate "line", 417
    (rx1083_rep, rx1083_pos, $I10, $P10) = rx1083_cur."!mark_fail"(0)
    lt rx1083_pos, -1, rx1083_done
    eq rx1083_pos, -1, rx1083_fail
    jump $I10
  rx1083_done:
    rx1083_cur."!cursor_fail"()
    rx1083_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1083_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("276_1267204702.05125") :method
.annotate "line", 417
    $P1085 = self."!PREFIX__!subrule"("O", ">=")
    new $P1086, "ResizablePMCArray"
    push $P1086, $P1085
    .return ($P1086)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("277_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1090_tgt
    .local int rx1090_pos
    .local int rx1090_off
    .local int rx1090_eos
    .local int rx1090_rep
    .local pmc rx1090_cur
    (rx1090_cur, rx1090_pos, rx1090_tgt) = self."!cursor_start"()
    rx1090_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1090_cur
    .local pmc match
    .lex "$/", match
    length rx1090_eos, rx1090_tgt
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
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1095_fail
    rx1090_cur."!mark_push"(0, rx1090_pos, $I10)
  # rx literal  "<"
    add $I11, rx1090_pos, 1
    gt $I11, rx1090_eos, rx1090_fail
    sub $I11, rx1090_pos, rx1090_off
    substr $S10, rx1090_tgt, $I11, 1
    ne $S10, "<", rx1090_fail
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
    $P10 = rx1090_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1090_fail
    rx1090_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1090_pos = $P10."pos"()
  # rx pass
    rx1090_cur."!cursor_pass"(rx1090_pos, "infix:sym<<>")
    rx1090_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1090_pos)
    .return (rx1090_cur)
  rx1090_fail:
.annotate "line", 417
    (rx1090_rep, rx1090_pos, $I10, $P10) = rx1090_cur."!mark_fail"(0)
    lt rx1090_pos, -1, rx1090_done
    eq rx1090_pos, -1, rx1090_fail
    jump $I10
  rx1090_done:
    rx1090_cur."!cursor_fail"()
    rx1090_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1090_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("278_1267204702.05125") :method
.annotate "line", 417
    $P1092 = self."!PREFIX__!subrule"("O", "<")
    new $P1093, "ResizablePMCArray"
    push $P1093, $P1092
    .return ($P1093)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("279_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1097_tgt
    .local int rx1097_pos
    .local int rx1097_off
    .local int rx1097_eos
    .local int rx1097_rep
    .local pmc rx1097_cur
    (rx1097_cur, rx1097_pos, rx1097_tgt) = self."!cursor_start"()
    rx1097_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1097_cur
    .local pmc match
    .lex "$/", match
    length rx1097_eos, rx1097_tgt
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
.annotate "line", 491
  # rx subcapture "sym"
    set_addr $I10, rxcap_1102_fail
    rx1097_cur."!mark_push"(0, rx1097_pos, $I10)
  # rx literal  ">"
    add $I11, rx1097_pos, 1
    gt $I11, rx1097_eos, rx1097_fail
    sub $I11, rx1097_pos, rx1097_off
    substr $S10, rx1097_tgt, $I11, 1
    ne $S10, ">", rx1097_fail
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
    $P10 = rx1097_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1097_fail
    rx1097_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1097_pos = $P10."pos"()
  # rx pass
    rx1097_cur."!cursor_pass"(rx1097_pos, "infix:sym<>>")
    rx1097_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1097_pos)
    .return (rx1097_cur)
  rx1097_fail:
.annotate "line", 417
    (rx1097_rep, rx1097_pos, $I10, $P10) = rx1097_cur."!mark_fail"(0)
    lt rx1097_pos, -1, rx1097_done
    eq rx1097_pos, -1, rx1097_fail
    jump $I10
  rx1097_done:
    rx1097_cur."!cursor_fail"()
    rx1097_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1097_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("280_1267204702.05125") :method
.annotate "line", 417
    $P1099 = self."!PREFIX__!subrule"("O", ">")
    new $P1100, "ResizablePMCArray"
    push $P1100, $P1099
    .return ($P1100)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("281_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1104_tgt
    .local int rx1104_pos
    .local int rx1104_off
    .local int rx1104_eos
    .local int rx1104_rep
    .local pmc rx1104_cur
    (rx1104_cur, rx1104_pos, rx1104_tgt) = self."!cursor_start"()
    rx1104_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1104_cur
    .local pmc match
    .lex "$/", match
    length rx1104_eos, rx1104_tgt
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
.annotate "line", 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1109_fail
    rx1104_cur."!mark_push"(0, rx1104_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1104_pos, 2
    gt $I11, rx1104_eos, rx1104_fail
    sub $I11, rx1104_pos, rx1104_off
    substr $S10, rx1104_tgt, $I11, 2
    ne $S10, "eq", rx1104_fail
    add rx1104_pos, 2
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
    $P10 = rx1104_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1104_fail
    rx1104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1104_pos = $P10."pos"()
  # rx pass
    rx1104_cur."!cursor_pass"(rx1104_pos, "infix:sym<eq>")
    rx1104_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1104_pos)
    .return (rx1104_cur)
  rx1104_fail:
.annotate "line", 417
    (rx1104_rep, rx1104_pos, $I10, $P10) = rx1104_cur."!mark_fail"(0)
    lt rx1104_pos, -1, rx1104_done
    eq rx1104_pos, -1, rx1104_fail
    jump $I10
  rx1104_done:
    rx1104_cur."!cursor_fail"()
    rx1104_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1104_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("282_1267204702.05125") :method
.annotate "line", 417
    $P1106 = self."!PREFIX__!subrule"("O", "eq")
    new $P1107, "ResizablePMCArray"
    push $P1107, $P1106
    .return ($P1107)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("283_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1111_tgt
    .local int rx1111_pos
    .local int rx1111_off
    .local int rx1111_eos
    .local int rx1111_rep
    .local pmc rx1111_cur
    (rx1111_cur, rx1111_pos, rx1111_tgt) = self."!cursor_start"()
    rx1111_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1111_cur
    .local pmc match
    .lex "$/", match
    length rx1111_eos, rx1111_tgt
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
.annotate "line", 493
  # rx subcapture "sym"
    set_addr $I10, rxcap_1116_fail
    rx1111_cur."!mark_push"(0, rx1111_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1111_pos, 2
    gt $I11, rx1111_eos, rx1111_fail
    sub $I11, rx1111_pos, rx1111_off
    substr $S10, rx1111_tgt, $I11, 2
    ne $S10, "ne", rx1111_fail
    add rx1111_pos, 2
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
    $P10 = rx1111_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1111_fail
    rx1111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1111_pos = $P10."pos"()
  # rx pass
    rx1111_cur."!cursor_pass"(rx1111_pos, "infix:sym<ne>")
    rx1111_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1111_pos)
    .return (rx1111_cur)
  rx1111_fail:
.annotate "line", 417
    (rx1111_rep, rx1111_pos, $I10, $P10) = rx1111_cur."!mark_fail"(0)
    lt rx1111_pos, -1, rx1111_done
    eq rx1111_pos, -1, rx1111_fail
    jump $I10
  rx1111_done:
    rx1111_cur."!cursor_fail"()
    rx1111_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1111_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("284_1267204702.05125") :method
.annotate "line", 417
    $P1113 = self."!PREFIX__!subrule"("O", "ne")
    new $P1114, "ResizablePMCArray"
    push $P1114, $P1113
    .return ($P1114)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("285_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1118_tgt
    .local int rx1118_pos
    .local int rx1118_off
    .local int rx1118_eos
    .local int rx1118_rep
    .local pmc rx1118_cur
    (rx1118_cur, rx1118_pos, rx1118_tgt) = self."!cursor_start"()
    rx1118_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1118_cur
    .local pmc match
    .lex "$/", match
    length rx1118_eos, rx1118_tgt
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
.annotate "line", 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1123_fail
    rx1118_cur."!mark_push"(0, rx1118_pos, $I10)
  # rx literal  "le"
    add $I11, rx1118_pos, 2
    gt $I11, rx1118_eos, rx1118_fail
    sub $I11, rx1118_pos, rx1118_off
    substr $S10, rx1118_tgt, $I11, 2
    ne $S10, "le", rx1118_fail
    add rx1118_pos, 2
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
    $P10 = rx1118_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1118_fail
    rx1118_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1118_pos = $P10."pos"()
  # rx pass
    rx1118_cur."!cursor_pass"(rx1118_pos, "infix:sym<le>")
    rx1118_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1118_pos)
    .return (rx1118_cur)
  rx1118_fail:
.annotate "line", 417
    (rx1118_rep, rx1118_pos, $I10, $P10) = rx1118_cur."!mark_fail"(0)
    lt rx1118_pos, -1, rx1118_done
    eq rx1118_pos, -1, rx1118_fail
    jump $I10
  rx1118_done:
    rx1118_cur."!cursor_fail"()
    rx1118_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1118_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("286_1267204702.05125") :method
.annotate "line", 417
    $P1120 = self."!PREFIX__!subrule"("O", "le")
    new $P1121, "ResizablePMCArray"
    push $P1121, $P1120
    .return ($P1121)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("287_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1125_tgt
    .local int rx1125_pos
    .local int rx1125_off
    .local int rx1125_eos
    .local int rx1125_rep
    .local pmc rx1125_cur
    (rx1125_cur, rx1125_pos, rx1125_tgt) = self."!cursor_start"()
    rx1125_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1125_cur
    .local pmc match
    .lex "$/", match
    length rx1125_eos, rx1125_tgt
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
.annotate "line", 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1130_fail
    rx1125_cur."!mark_push"(0, rx1125_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1125_pos, 2
    gt $I11, rx1125_eos, rx1125_fail
    sub $I11, rx1125_pos, rx1125_off
    substr $S10, rx1125_tgt, $I11, 2
    ne $S10, "ge", rx1125_fail
    add rx1125_pos, 2
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
    $P10 = rx1125_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1125_fail
    rx1125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1125_pos = $P10."pos"()
  # rx pass
    rx1125_cur."!cursor_pass"(rx1125_pos, "infix:sym<ge>")
    rx1125_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1125_pos)
    .return (rx1125_cur)
  rx1125_fail:
.annotate "line", 417
    (rx1125_rep, rx1125_pos, $I10, $P10) = rx1125_cur."!mark_fail"(0)
    lt rx1125_pos, -1, rx1125_done
    eq rx1125_pos, -1, rx1125_fail
    jump $I10
  rx1125_done:
    rx1125_cur."!cursor_fail"()
    rx1125_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1125_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("288_1267204702.05125") :method
.annotate "line", 417
    $P1127 = self."!PREFIX__!subrule"("O", "ge")
    new $P1128, "ResizablePMCArray"
    push $P1128, $P1127
    .return ($P1128)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("289_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1132_tgt
    .local int rx1132_pos
    .local int rx1132_off
    .local int rx1132_eos
    .local int rx1132_rep
    .local pmc rx1132_cur
    (rx1132_cur, rx1132_pos, rx1132_tgt) = self."!cursor_start"()
    rx1132_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1132_cur
    .local pmc match
    .lex "$/", match
    length rx1132_eos, rx1132_tgt
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
.annotate "line", 496
  # rx subcapture "sym"
    set_addr $I10, rxcap_1137_fail
    rx1132_cur."!mark_push"(0, rx1132_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1132_pos, 2
    gt $I11, rx1132_eos, rx1132_fail
    sub $I11, rx1132_pos, rx1132_off
    substr $S10, rx1132_tgt, $I11, 2
    ne $S10, "lt", rx1132_fail
    add rx1132_pos, 2
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
    $P10 = rx1132_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1132_fail
    rx1132_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1132_pos = $P10."pos"()
  # rx pass
    rx1132_cur."!cursor_pass"(rx1132_pos, "infix:sym<lt>")
    rx1132_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1132_pos)
    .return (rx1132_cur)
  rx1132_fail:
.annotate "line", 417
    (rx1132_rep, rx1132_pos, $I10, $P10) = rx1132_cur."!mark_fail"(0)
    lt rx1132_pos, -1, rx1132_done
    eq rx1132_pos, -1, rx1132_fail
    jump $I10
  rx1132_done:
    rx1132_cur."!cursor_fail"()
    rx1132_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1132_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("290_1267204702.05125") :method
.annotate "line", 417
    $P1134 = self."!PREFIX__!subrule"("O", "lt")
    new $P1135, "ResizablePMCArray"
    push $P1135, $P1134
    .return ($P1135)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("291_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1139_tgt
    .local int rx1139_pos
    .local int rx1139_off
    .local int rx1139_eos
    .local int rx1139_rep
    .local pmc rx1139_cur
    (rx1139_cur, rx1139_pos, rx1139_tgt) = self."!cursor_start"()
    rx1139_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1139_cur
    .local pmc match
    .lex "$/", match
    length rx1139_eos, rx1139_tgt
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
.annotate "line", 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1144_fail
    rx1139_cur."!mark_push"(0, rx1139_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1139_pos, 2
    gt $I11, rx1139_eos, rx1139_fail
    sub $I11, rx1139_pos, rx1139_off
    substr $S10, rx1139_tgt, $I11, 2
    ne $S10, "gt", rx1139_fail
    add rx1139_pos, 2
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
    $P10 = rx1139_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1139_fail
    rx1139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1139_pos = $P10."pos"()
  # rx pass
    rx1139_cur."!cursor_pass"(rx1139_pos, "infix:sym<gt>")
    rx1139_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1139_pos)
    .return (rx1139_cur)
  rx1139_fail:
.annotate "line", 417
    (rx1139_rep, rx1139_pos, $I10, $P10) = rx1139_cur."!mark_fail"(0)
    lt rx1139_pos, -1, rx1139_done
    eq rx1139_pos, -1, rx1139_fail
    jump $I10
  rx1139_done:
    rx1139_cur."!cursor_fail"()
    rx1139_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1139_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("292_1267204702.05125") :method
.annotate "line", 417
    $P1141 = self."!PREFIX__!subrule"("O", "gt")
    new $P1142, "ResizablePMCArray"
    push $P1142, $P1141
    .return ($P1142)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("293_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1146_tgt
    .local int rx1146_pos
    .local int rx1146_off
    .local int rx1146_eos
    .local int rx1146_rep
    .local pmc rx1146_cur
    (rx1146_cur, rx1146_pos, rx1146_tgt) = self."!cursor_start"()
    rx1146_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1146_cur
    .local pmc match
    .lex "$/", match
    length rx1146_eos, rx1146_tgt
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
.annotate "line", 498
  # rx subcapture "sym"
    set_addr $I10, rxcap_1151_fail
    rx1146_cur."!mark_push"(0, rx1146_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1146_pos, 3
    gt $I11, rx1146_eos, rx1146_fail
    sub $I11, rx1146_pos, rx1146_off
    substr $S10, rx1146_tgt, $I11, 3
    ne $S10, "=:=", rx1146_fail
    add rx1146_pos, 3
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
    $P10 = rx1146_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1146_fail
    rx1146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1146_pos = $P10."pos"()
  # rx pass
    rx1146_cur."!cursor_pass"(rx1146_pos, "infix:sym<=:=>")
    rx1146_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1146_pos)
    .return (rx1146_cur)
  rx1146_fail:
.annotate "line", 417
    (rx1146_rep, rx1146_pos, $I10, $P10) = rx1146_cur."!mark_fail"(0)
    lt rx1146_pos, -1, rx1146_done
    eq rx1146_pos, -1, rx1146_fail
    jump $I10
  rx1146_done:
    rx1146_cur."!cursor_fail"()
    rx1146_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1146_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("294_1267204702.05125") :method
.annotate "line", 417
    $P1148 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1149, "ResizablePMCArray"
    push $P1149, $P1148
    .return ($P1149)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~~>"  :subid("295_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1153_tgt
    .local int rx1153_pos
    .local int rx1153_off
    .local int rx1153_eos
    .local int rx1153_rep
    .local pmc rx1153_cur
    (rx1153_cur, rx1153_pos, rx1153_tgt) = self."!cursor_start"()
    rx1153_cur."!cursor_debug"("START ", "infix:sym<~~>")
    .lex unicode:"$\x{a2}", rx1153_cur
    .local pmc match
    .lex "$/", match
    length rx1153_eos, rx1153_tgt
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
.annotate "line", 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1158_fail
    rx1153_cur."!mark_push"(0, rx1153_pos, $I10)
  # rx literal  "~~"
    add $I11, rx1153_pos, 2
    gt $I11, rx1153_eos, rx1153_fail
    sub $I11, rx1153_pos, rx1153_off
    substr $S10, rx1153_tgt, $I11, 2
    ne $S10, "~~", rx1153_fail
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
    $P10 = rx1153_cur."O"("%relational, :reducecheck<smartmatch>")
    unless $P10, rx1153_fail
    rx1153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1153_pos = $P10."pos"()
  # rx pass
    rx1153_cur."!cursor_pass"(rx1153_pos, "infix:sym<~~>")
    rx1153_cur."!cursor_debug"("PASS  ", "infix:sym<~~>", " at pos=", rx1153_pos)
    .return (rx1153_cur)
  rx1153_fail:
.annotate "line", 417
    (rx1153_rep, rx1153_pos, $I10, $P10) = rx1153_cur."!mark_fail"(0)
    lt rx1153_pos, -1, rx1153_done
    eq rx1153_pos, -1, rx1153_fail
    jump $I10
  rx1153_done:
    rx1153_cur."!cursor_fail"()
    rx1153_cur."!cursor_debug"("FAIL  ", "infix:sym<~~>")
    .return (rx1153_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~~>"  :subid("296_1267204702.05125") :method
.annotate "line", 417
    $P1155 = self."!PREFIX__!subrule"("O", "~~")
    new $P1156, "ResizablePMCArray"
    push $P1156, $P1155
    .return ($P1156)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("297_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    (rx1160_cur, rx1160_pos, rx1160_tgt) = self."!cursor_start"()
    rx1160_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1160_cur
    .local pmc match
    .lex "$/", match
    length rx1160_eos, rx1160_tgt
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
.annotate "line", 501
  # rx subcapture "sym"
    set_addr $I10, rxcap_1165_fail
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1160_pos, 2
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    substr $S10, rx1160_tgt, $I11, 2
    ne $S10, "&&", rx1160_fail
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
    $P10 = rx1160_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1160_fail
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1160_pos = $P10."pos"()
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "infix:sym<&&>")
    rx1160_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1160_pos)
    .return (rx1160_cur)
  rx1160_fail:
.annotate "line", 417
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    rx1160_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("298_1267204702.05125") :method
.annotate "line", 417
    $P1162 = self."!PREFIX__!subrule"("O", "&&")
    new $P1163, "ResizablePMCArray"
    push $P1163, $P1162
    .return ($P1163)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("299_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1167_tgt
    .local int rx1167_pos
    .local int rx1167_off
    .local int rx1167_eos
    .local int rx1167_rep
    .local pmc rx1167_cur
    (rx1167_cur, rx1167_pos, rx1167_tgt) = self."!cursor_start"()
    rx1167_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1167_cur
    .local pmc match
    .lex "$/", match
    length rx1167_eos, rx1167_tgt
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
.annotate "line", 503
  # rx subcapture "sym"
    set_addr $I10, rxcap_1172_fail
    rx1167_cur."!mark_push"(0, rx1167_pos, $I10)
  # rx literal  "||"
    add $I11, rx1167_pos, 2
    gt $I11, rx1167_eos, rx1167_fail
    sub $I11, rx1167_pos, rx1167_off
    substr $S10, rx1167_tgt, $I11, 2
    ne $S10, "||", rx1167_fail
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
    $P10 = rx1167_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1167_fail
    rx1167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1167_pos = $P10."pos"()
  # rx pass
    rx1167_cur."!cursor_pass"(rx1167_pos, "infix:sym<||>")
    rx1167_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1167_pos)
    .return (rx1167_cur)
  rx1167_fail:
.annotate "line", 417
    (rx1167_rep, rx1167_pos, $I10, $P10) = rx1167_cur."!mark_fail"(0)
    lt rx1167_pos, -1, rx1167_done
    eq rx1167_pos, -1, rx1167_fail
    jump $I10
  rx1167_done:
    rx1167_cur."!cursor_fail"()
    rx1167_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1167_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("300_1267204702.05125") :method
.annotate "line", 417
    $P1169 = self."!PREFIX__!subrule"("O", "||")
    new $P1170, "ResizablePMCArray"
    push $P1170, $P1169
    .return ($P1170)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("301_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1174_tgt
    .local int rx1174_pos
    .local int rx1174_off
    .local int rx1174_eos
    .local int rx1174_rep
    .local pmc rx1174_cur
    (rx1174_cur, rx1174_pos, rx1174_tgt) = self."!cursor_start"()
    rx1174_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1174_cur
    .local pmc match
    .lex "$/", match
    length rx1174_eos, rx1174_tgt
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
.annotate "line", 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1179_fail
    rx1174_cur."!mark_push"(0, rx1174_pos, $I10)
  # rx literal  "//"
    add $I11, rx1174_pos, 2
    gt $I11, rx1174_eos, rx1174_fail
    sub $I11, rx1174_pos, rx1174_off
    substr $S10, rx1174_tgt, $I11, 2
    ne $S10, "//", rx1174_fail
    add rx1174_pos, 2
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
    $P10 = rx1174_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1174_fail
    rx1174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1174_pos = $P10."pos"()
  # rx pass
    rx1174_cur."!cursor_pass"(rx1174_pos, "infix:sym<//>")
    rx1174_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1174_pos)
    .return (rx1174_cur)
  rx1174_fail:
.annotate "line", 417
    (rx1174_rep, rx1174_pos, $I10, $P10) = rx1174_cur."!mark_fail"(0)
    lt rx1174_pos, -1, rx1174_done
    eq rx1174_pos, -1, rx1174_fail
    jump $I10
  rx1174_done:
    rx1174_cur."!cursor_fail"()
    rx1174_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1174_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("302_1267204702.05125") :method
.annotate "line", 417
    $P1176 = self."!PREFIX__!subrule"("O", "//")
    new $P1177, "ResizablePMCArray"
    push $P1177, $P1176
    .return ($P1177)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("303_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1181_tgt
    .local int rx1181_pos
    .local int rx1181_off
    .local int rx1181_eos
    .local int rx1181_rep
    .local pmc rx1181_cur
    (rx1181_cur, rx1181_pos, rx1181_tgt) = self."!cursor_start"()
    rx1181_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1181_cur
    .local pmc match
    .lex "$/", match
    length rx1181_eos, rx1181_tgt
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
.annotate "line", 507
  # rx literal  "??"
    add $I11, rx1181_pos, 2
    gt $I11, rx1181_eos, rx1181_fail
    sub $I11, rx1181_pos, rx1181_off
    substr $S10, rx1181_tgt, $I11, 2
    ne $S10, "??", rx1181_fail
    add rx1181_pos, 2
.annotate "line", 508
  # rx subrule "ws" subtype=method negate=
    rx1181_cur."!cursor_pos"(rx1181_pos)
    $P10 = rx1181_cur."ws"()
    unless $P10, rx1181_fail
    rx1181_pos = $P10."pos"()
.annotate "line", 509
  # rx subrule "EXPR" subtype=capture negate=
    rx1181_cur."!cursor_pos"(rx1181_pos)
    $P10 = rx1181_cur."EXPR"("i=")
    unless $P10, rx1181_fail
    rx1181_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1181_pos = $P10."pos"()
.annotate "line", 510
  # rx literal  "!!"
    add $I11, rx1181_pos, 2
    gt $I11, rx1181_eos, rx1181_fail
    sub $I11, rx1181_pos, rx1181_off
    substr $S10, rx1181_tgt, $I11, 2
    ne $S10, "!!", rx1181_fail
    add rx1181_pos, 2
.annotate "line", 511
  # rx subrule "O" subtype=capture negate=
    rx1181_cur."!cursor_pos"(rx1181_pos)
    $P10 = rx1181_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1181_fail
    rx1181_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1181_pos = $P10."pos"()
.annotate "line", 506
  # rx pass
    rx1181_cur."!cursor_pass"(rx1181_pos, "infix:sym<?? !!>")
    rx1181_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1181_pos)
    .return (rx1181_cur)
  rx1181_fail:
.annotate "line", 417
    (rx1181_rep, rx1181_pos, $I10, $P10) = rx1181_cur."!mark_fail"(0)
    lt rx1181_pos, -1, rx1181_done
    eq rx1181_pos, -1, rx1181_fail
    jump $I10
  rx1181_done:
    rx1181_cur."!cursor_fail"()
    rx1181_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1181_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("304_1267204702.05125") :method
.annotate "line", 417
    $P1183 = self."!PREFIX__!subrule"("", "??")
    new $P1184, "ResizablePMCArray"
    push $P1184, $P1183
    .return ($P1184)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("305_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1187_tgt
    .local int rx1187_pos
    .local int rx1187_off
    .local int rx1187_eos
    .local int rx1187_rep
    .local pmc rx1187_cur
    (rx1187_cur, rx1187_pos, rx1187_tgt) = self."!cursor_start"()
    rx1187_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1187_cur
    .local pmc match
    .lex "$/", match
    length rx1187_eos, rx1187_tgt
    set rx1187_off, 0
    lt rx1187_pos, 2, rx1187_start
    sub rx1187_off, rx1187_pos, 1
    substr rx1187_tgt, rx1187_tgt, rx1187_off
  rx1187_start:
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
.annotate "line", 515
  # rx subcapture "sym"
    set_addr $I10, rxcap_1192_fail
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  # rx literal  "="
    add $I11, rx1187_pos, 1
    gt $I11, rx1187_eos, rx1187_fail
    sub $I11, rx1187_pos, rx1187_off
    substr $S10, rx1187_tgt, $I11, 1
    ne $S10, "=", rx1187_fail
    add rx1187_pos, 1
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
  # rx subrule "panic" subtype=method negate=
    rx1187_cur."!cursor_pos"(rx1187_pos)
    $P10 = rx1187_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1187_fail
    rx1187_pos = $P10."pos"()
.annotate "line", 514
  # rx pass
    rx1187_cur."!cursor_pass"(rx1187_pos, "infix:sym<=>")
    rx1187_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1187_pos)
    .return (rx1187_cur)
  rx1187_fail:
.annotate "line", 417
    (rx1187_rep, rx1187_pos, $I10, $P10) = rx1187_cur."!mark_fail"(0)
    lt rx1187_pos, -1, rx1187_done
    eq rx1187_pos, -1, rx1187_fail
    jump $I10
  rx1187_done:
    rx1187_cur."!cursor_fail"()
    rx1187_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1187_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("306_1267204702.05125") :method
.annotate "line", 417
    $P1189 = self."!PREFIX__!subrule"("", "=")
    new $P1190, "ResizablePMCArray"
    push $P1190, $P1189
    .return ($P1190)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("307_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1194_tgt
    .local int rx1194_pos
    .local int rx1194_off
    .local int rx1194_eos
    .local int rx1194_rep
    .local pmc rx1194_cur
    (rx1194_cur, rx1194_pos, rx1194_tgt) = self."!cursor_start"()
    rx1194_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1194_cur
    .local pmc match
    .lex "$/", match
    length rx1194_eos, rx1194_tgt
    set rx1194_off, 0
    lt rx1194_pos, 2, rx1194_start
    sub rx1194_off, rx1194_pos, 1
    substr rx1194_tgt, rx1194_tgt, rx1194_off
  rx1194_start:
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
.annotate "line", 517
  # rx subcapture "sym"
    set_addr $I10, rxcap_1199_fail
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  # rx literal  ":="
    add $I11, rx1194_pos, 2
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 2
    ne $S10, ":=", rx1194_fail
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
    $P10 = rx1194_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1194_pos = $P10."pos"()
  # rx pass
    rx1194_cur."!cursor_pass"(rx1194_pos, "infix:sym<:=>")
    rx1194_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1194_pos)
    .return (rx1194_cur)
  rx1194_fail:
.annotate "line", 417
    (rx1194_rep, rx1194_pos, $I10, $P10) = rx1194_cur."!mark_fail"(0)
    lt rx1194_pos, -1, rx1194_done
    eq rx1194_pos, -1, rx1194_fail
    jump $I10
  rx1194_done:
    rx1194_cur."!cursor_fail"()
    rx1194_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1194_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("308_1267204702.05125") :method
.annotate "line", 417
    $P1196 = self."!PREFIX__!subrule"("O", ":=")
    new $P1197, "ResizablePMCArray"
    push $P1197, $P1196
    .return ($P1197)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("309_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1201_tgt
    .local int rx1201_pos
    .local int rx1201_off
    .local int rx1201_eos
    .local int rx1201_rep
    .local pmc rx1201_cur
    (rx1201_cur, rx1201_pos, rx1201_tgt) = self."!cursor_start"()
    rx1201_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1201_cur
    .local pmc match
    .lex "$/", match
    length rx1201_eos, rx1201_tgt
    set rx1201_off, 0
    lt rx1201_pos, 2, rx1201_start
    sub rx1201_off, rx1201_pos, 1
    substr rx1201_tgt, rx1201_tgt, rx1201_off
  rx1201_start:
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
.annotate "line", 518
  # rx subcapture "sym"
    set_addr $I10, rxcap_1206_fail
    rx1201_cur."!mark_push"(0, rx1201_pos, $I10)
  # rx literal  "::="
    add $I11, rx1201_pos, 3
    gt $I11, rx1201_eos, rx1201_fail
    sub $I11, rx1201_pos, rx1201_off
    substr $S10, rx1201_tgt, $I11, 3
    ne $S10, "::=", rx1201_fail
    add rx1201_pos, 3
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
    $P10 = rx1201_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1201_fail
    rx1201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1201_pos = $P10."pos"()
  # rx pass
    rx1201_cur."!cursor_pass"(rx1201_pos, "infix:sym<::=>")
    rx1201_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1201_pos)
    .return (rx1201_cur)
  rx1201_fail:
.annotate "line", 417
    (rx1201_rep, rx1201_pos, $I10, $P10) = rx1201_cur."!mark_fail"(0)
    lt rx1201_pos, -1, rx1201_done
    eq rx1201_pos, -1, rx1201_fail
    jump $I10
  rx1201_done:
    rx1201_cur."!cursor_fail"()
    rx1201_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1201_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("310_1267204702.05125") :method
.annotate "line", 417
    $P1203 = self."!PREFIX__!subrule"("O", "::=")
    new $P1204, "ResizablePMCArray"
    push $P1204, $P1203
    .return ($P1204)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("311_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1208_tgt
    .local int rx1208_pos
    .local int rx1208_off
    .local int rx1208_eos
    .local int rx1208_rep
    .local pmc rx1208_cur
    (rx1208_cur, rx1208_pos, rx1208_tgt) = self."!cursor_start"()
    rx1208_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1208_cur
    .local pmc match
    .lex "$/", match
    length rx1208_eos, rx1208_tgt
    set rx1208_off, 0
    lt rx1208_pos, 2, rx1208_start
    sub rx1208_off, rx1208_pos, 1
    substr rx1208_tgt, rx1208_tgt, rx1208_off
  rx1208_start:
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
.annotate "line", 520
  # rx subcapture "sym"
    set_addr $I10, rxcap_1213_fail
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
  # rx literal  ","
    add $I11, rx1208_pos, 1
    gt $I11, rx1208_eos, rx1208_fail
    sub $I11, rx1208_pos, rx1208_off
    substr $S10, rx1208_tgt, $I11, 1
    ne $S10, ",", rx1208_fail
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
    $P10 = rx1208_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1208_fail
    rx1208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1208_pos = $P10."pos"()
  # rx pass
    rx1208_cur."!cursor_pass"(rx1208_pos, "infix:sym<,>")
    rx1208_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1208_pos)
    .return (rx1208_cur)
  rx1208_fail:
.annotate "line", 417
    (rx1208_rep, rx1208_pos, $I10, $P10) = rx1208_cur."!mark_fail"(0)
    lt rx1208_pos, -1, rx1208_done
    eq rx1208_pos, -1, rx1208_fail
    jump $I10
  rx1208_done:
    rx1208_cur."!cursor_fail"()
    rx1208_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1208_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("312_1267204702.05125") :method
.annotate "line", 417
    $P1210 = self."!PREFIX__!subrule"("O", ",")
    new $P1211, "ResizablePMCArray"
    push $P1211, $P1210
    .return ($P1211)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("313_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1215_tgt
    .local int rx1215_pos
    .local int rx1215_off
    .local int rx1215_eos
    .local int rx1215_rep
    .local pmc rx1215_cur
    (rx1215_cur, rx1215_pos, rx1215_tgt) = self."!cursor_start"()
    rx1215_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1215_cur
    .local pmc match
    .lex "$/", match
    length rx1215_eos, rx1215_tgt
    set rx1215_off, 0
    lt rx1215_pos, 2, rx1215_start
    sub rx1215_off, rx1215_pos, 1
    substr rx1215_tgt, rx1215_tgt, rx1215_off
  rx1215_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1218_done
    goto rxscan1218_scan
  rxscan1218_loop:
    ($P10) = rx1215_cur."from"()
    inc $P10
    set rx1215_pos, $P10
    ge rx1215_pos, rx1215_eos, rxscan1218_done
  rxscan1218_scan:
    set_addr $I10, rxscan1218_loop
    rx1215_cur."!mark_push"(0, rx1215_pos, $I10)
  rxscan1218_done:
.annotate "line", 522
  # rx subcapture "sym"
    set_addr $I10, rxcap_1219_fail
    rx1215_cur."!mark_push"(0, rx1215_pos, $I10)
  # rx literal  "return"
    add $I11, rx1215_pos, 6
    gt $I11, rx1215_eos, rx1215_fail
    sub $I11, rx1215_pos, rx1215_off
    substr $S10, rx1215_tgt, $I11, 6
    ne $S10, "return", rx1215_fail
    add rx1215_pos, 6
    set_addr $I10, rxcap_1219_fail
    ($I12, $I11) = rx1215_cur."!mark_peek"($I10)
    rx1215_cur."!cursor_pos"($I11)
    ($P10) = rx1215_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1215_pos, "")
    rx1215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1219_done
  rxcap_1219_fail:
    goto rx1215_fail
  rxcap_1219_done:
  # rx charclass s
    ge rx1215_pos, rx1215_eos, rx1215_fail
    sub $I10, rx1215_pos, rx1215_off
    is_cclass $I11, 32, rx1215_tgt, $I10
    unless $I11, rx1215_fail
    inc rx1215_pos
  # rx subrule "O" subtype=capture negate=
    rx1215_cur."!cursor_pos"(rx1215_pos)
    $P10 = rx1215_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1215_fail
    rx1215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1215_pos = $P10."pos"()
  # rx pass
    rx1215_cur."!cursor_pass"(rx1215_pos, "prefix:sym<return>")
    rx1215_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1215_pos)
    .return (rx1215_cur)
  rx1215_fail:
.annotate "line", 417
    (rx1215_rep, rx1215_pos, $I10, $P10) = rx1215_cur."!mark_fail"(0)
    lt rx1215_pos, -1, rx1215_done
    eq rx1215_pos, -1, rx1215_fail
    jump $I10
  rx1215_done:
    rx1215_cur."!cursor_fail"()
    rx1215_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1215_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("314_1267204702.05125") :method
.annotate "line", 417
    new $P1217, "ResizablePMCArray"
    push $P1217, "return"
    .return ($P1217)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("315_1267204702.05125") :method :outer("11_1267204702.05125")
.annotate "line", 417
    .local string rx1221_tgt
    .local int rx1221_pos
    .local int rx1221_off
    .local int rx1221_eos
    .local int rx1221_rep
    .local pmc rx1221_cur
    (rx1221_cur, rx1221_pos, rx1221_tgt) = self."!cursor_start"()
    rx1221_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1221_cur
    .local pmc match
    .lex "$/", match
    length rx1221_eos, rx1221_tgt
    set rx1221_off, 0
    lt rx1221_pos, 2, rx1221_start
    sub rx1221_off, rx1221_pos, 1
    substr rx1221_tgt, rx1221_tgt, rx1221_off
  rx1221_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1224_done
    goto rxscan1224_scan
  rxscan1224_loop:
    ($P10) = rx1221_cur."from"()
    inc $P10
    set rx1221_pos, $P10
    ge rx1221_pos, rx1221_eos, rxscan1224_done
  rxscan1224_scan:
    set_addr $I10, rxscan1224_loop
    rx1221_cur."!mark_push"(0, rx1221_pos, $I10)
  rxscan1224_done:
.annotate "line", 523
  # rx subcapture "sym"
    set_addr $I10, rxcap_1225_fail
    rx1221_cur."!mark_push"(0, rx1221_pos, $I10)
  # rx literal  "make"
    add $I11, rx1221_pos, 4
    gt $I11, rx1221_eos, rx1221_fail
    sub $I11, rx1221_pos, rx1221_off
    substr $S10, rx1221_tgt, $I11, 4
    ne $S10, "make", rx1221_fail
    add rx1221_pos, 4
    set_addr $I10, rxcap_1225_fail
    ($I12, $I11) = rx1221_cur."!mark_peek"($I10)
    rx1221_cur."!cursor_pos"($I11)
    ($P10) = rx1221_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1221_pos, "")
    rx1221_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1225_done
  rxcap_1225_fail:
    goto rx1221_fail
  rxcap_1225_done:
  # rx charclass s
    ge rx1221_pos, rx1221_eos, rx1221_fail
    sub $I10, rx1221_pos, rx1221_off
    is_cclass $I11, 32, rx1221_tgt, $I10
    unless $I11, rx1221_fail
    inc rx1221_pos
  # rx subrule "O" subtype=capture negate=
    rx1221_cur."!cursor_pos"(rx1221_pos)
    $P10 = rx1221_cur."O"("%list_prefix")
    unless $P10, rx1221_fail
    rx1221_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1221_pos = $P10."pos"()
  # rx pass
    rx1221_cur."!cursor_pass"(rx1221_pos, "prefix:sym<make>")
    rx1221_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1221_pos)
    .return (rx1221_cur)
  rx1221_fail:
.annotate "line", 417
    (rx1221_rep, rx1221_pos, $I10, $P10) = rx1221_cur."!mark_fail"(0)
    lt rx1221_pos, -1, rx1221_done
    eq rx1221_pos, -1, rx1221_fail
    jump $I10
  rx1221_done:
    rx1221_cur."!cursor_fail"()
    rx1221_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1221_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("316_1267204702.05125") :method
.annotate "line", 417
    new $P1223, "ResizablePMCArray"
    push $P1223, "make"
    .return ($P1223)
.end


.namespace ["NQP";"Grammar"]
.sub "smartmatch"  :subid("317_1267204702.05125") :method :outer("11_1267204702.05125")
    .param pmc param_1229
.annotate "line", 525
    new $P1228, 'ExceptionHandler'
    set_addr $P1228, control_1227
    $P1228."handle_types"(58)
    push_eh $P1228
    .lex "self", self
    .lex "$/", param_1229
.annotate "line", 527
    new $P1230, "Undef"
    .lex "$t", $P1230
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_343
    $P1231 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P1232, $P1231[0]
    unless_null $P1232, vivify_344
    new $P1232, "Undef"
  vivify_344:
    store_lex "$t", $P1232
    find_lex $P1233, "$/"
    unless_null $P1233, vivify_345
    $P1233 = root_new ['parrot';'ResizablePMCArray']
  vivify_345:
    set $P1234, $P1233[1]
    unless_null $P1234, vivify_346
    new $P1234, "Undef"
  vivify_346:
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_347
    $P1235 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1235
  vivify_347:
    set $P1235[0], $P1234
    find_lex $P1236, "$t"
    find_lex $P1237, "$/"
    unless_null $P1237, vivify_348
    $P1237 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$/", $P1237
  vivify_348:
    set $P1237[1], $P1236
.annotate "line", 525
    .return ($P1236)
  control_1227:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1238, exception, "payload"
    .return ($P1238)
.end


.namespace ["NQP";"Regex"]
.sub "_block1239"  :subid("318_1267204702.05125") :outer("11_1267204702.05125")
.annotate "line", 531
    .const 'Sub' $P1273 = "329_1267204702.05125" 
    capture_lex $P1273
    .const 'Sub' $P1260 = "326_1267204702.05125" 
    capture_lex $P1260
    .const 'Sub' $P1255 = "324_1267204702.05125" 
    capture_lex $P1255
    .const 'Sub' $P1250 = "322_1267204702.05125" 
    capture_lex $P1250
    .const 'Sub' $P1241 = "319_1267204702.05125" 
    capture_lex $P1241
    .const 'Sub' $P1273 = "329_1267204702.05125" 
    capture_lex $P1273
    .return ($P1273)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("319_1267204702.05125") :method :outer("318_1267204702.05125")
.annotate "line", 531
    .const 'Sub' $P1247 = "321_1267204702.05125" 
    capture_lex $P1247
    .local string rx1242_tgt
    .local int rx1242_pos
    .local int rx1242_off
    .local int rx1242_eos
    .local int rx1242_rep
    .local pmc rx1242_cur
    (rx1242_cur, rx1242_pos, rx1242_tgt) = self."!cursor_start"()
    rx1242_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1242_cur
    .local pmc match
    .lex "$/", match
    length rx1242_eos, rx1242_tgt
    set rx1242_off, 0
    lt rx1242_pos, 2, rx1242_start
    sub rx1242_off, rx1242_pos, 1
    substr rx1242_tgt, rx1242_tgt, rx1242_off
  rx1242_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1245_done
    goto rxscan1245_scan
  rxscan1245_loop:
    ($P10) = rx1242_cur."from"()
    inc $P10
    set rx1242_pos, $P10
    ge rx1242_pos, rx1242_eos, rxscan1245_done
  rxscan1245_scan:
    set_addr $I10, rxscan1245_loop
    rx1242_cur."!mark_push"(0, rx1242_pos, $I10)
  rxscan1245_done:
.annotate "line", 533
  # rx literal  ":"
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, ":", rx1242_fail
    add rx1242_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    .const 'Sub' $P1247 = "321_1267204702.05125" 
    capture_lex $P1247
    $P10 = rx1242_cur."before"($P1247)
    unless $P10, rx1242_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."LANG"("MAIN", "statement")
    unless $P10, rx1242_fail
    rx1242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1242_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1242_cur."!cursor_pos"(rx1242_pos)
    $P10 = rx1242_cur."ws"()
    unless $P10, rx1242_fail
    rx1242_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1242_pos, 1
    gt $I11, rx1242_eos, rx1242_fail
    sub $I11, rx1242_pos, rx1242_off
    substr $S10, rx1242_tgt, $I11, 1
    ne $S10, ";", rx1242_fail
    add rx1242_pos, 1
.annotate "line", 532
  # rx pass
    rx1242_cur."!cursor_pass"(rx1242_pos, "metachar:sym<:my>")
    rx1242_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1242_pos)
    .return (rx1242_cur)
  rx1242_fail:
.annotate "line", 531
    (rx1242_rep, rx1242_pos, $I10, $P10) = rx1242_cur."!mark_fail"(0)
    lt rx1242_pos, -1, rx1242_done
    eq rx1242_pos, -1, rx1242_fail
    jump $I10
  rx1242_done:
    rx1242_cur."!cursor_fail"()
    rx1242_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1242_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("320_1267204702.05125") :method
.annotate "line", 531
    new $P1244, "ResizablePMCArray"
    push $P1244, ":"
    .return ($P1244)
.end


.namespace ["NQP";"Regex"]
.sub "_block1246"  :anon :subid("321_1267204702.05125") :method :outer("319_1267204702.05125")
.annotate "line", 533
    .local string rx1248_tgt
    .local int rx1248_pos
    .local int rx1248_off
    .local int rx1248_eos
    .local int rx1248_rep
    .local pmc rx1248_cur
    (rx1248_cur, rx1248_pos, rx1248_tgt) = self."!cursor_start"()
    rx1248_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1248_cur
    .local pmc match
    .lex "$/", match
    length rx1248_eos, rx1248_tgt
    set rx1248_off, 0
    lt rx1248_pos, 2, rx1248_start
    sub rx1248_off, rx1248_pos, 1
    substr rx1248_tgt, rx1248_tgt, rx1248_off
  rx1248_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1249_done
    goto rxscan1249_scan
  rxscan1249_loop:
    ($P10) = rx1248_cur."from"()
    inc $P10
    set rx1248_pos, $P10
    ge rx1248_pos, rx1248_eos, rxscan1249_done
  rxscan1249_scan:
    set_addr $I10, rxscan1249_loop
    rx1248_cur."!mark_push"(0, rx1248_pos, $I10)
  rxscan1249_done:
  # rx literal  "my"
    add $I11, rx1248_pos, 2
    gt $I11, rx1248_eos, rx1248_fail
    sub $I11, rx1248_pos, rx1248_off
    substr $S10, rx1248_tgt, $I11, 2
    ne $S10, "my", rx1248_fail
    add rx1248_pos, 2
  # rx pass
    rx1248_cur."!cursor_pass"(rx1248_pos, "")
    rx1248_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1248_pos)
    .return (rx1248_cur)
  rx1248_fail:
    (rx1248_rep, rx1248_pos, $I10, $P10) = rx1248_cur."!mark_fail"(0)
    lt rx1248_pos, -1, rx1248_done
    eq rx1248_pos, -1, rx1248_fail
    jump $I10
  rx1248_done:
    rx1248_cur."!cursor_fail"()
    rx1248_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1248_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("322_1267204702.05125") :method :outer("318_1267204702.05125")
.annotate "line", 531
    .local string rx1251_tgt
    .local int rx1251_pos
    .local int rx1251_off
    .local int rx1251_eos
    .local int rx1251_rep
    .local pmc rx1251_cur
    (rx1251_cur, rx1251_pos, rx1251_tgt) = self."!cursor_start"()
    rx1251_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1251_cur
    .local pmc match
    .lex "$/", match
    length rx1251_eos, rx1251_tgt
    set rx1251_off, 0
    lt rx1251_pos, 2, rx1251_start
    sub rx1251_off, rx1251_pos, 1
    substr rx1251_tgt, rx1251_tgt, rx1251_off
  rx1251_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1254_done
    goto rxscan1254_scan
  rxscan1254_loop:
    ($P10) = rx1251_cur."from"()
    inc $P10
    set rx1251_pos, $P10
    ge rx1251_pos, rx1251_eos, rxscan1254_done
  rxscan1254_scan:
    set_addr $I10, rxscan1254_loop
    rx1251_cur."!mark_push"(0, rx1251_pos, $I10)
  rxscan1254_done:
.annotate "line", 537
  # rx enumcharlist negate=0 zerowidth
    ge rx1251_pos, rx1251_eos, rx1251_fail
    sub $I10, rx1251_pos, rx1251_off
    substr $S10, rx1251_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1251_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1251_cur."!cursor_pos"(rx1251_pos)
    $P10 = rx1251_cur."codeblock"()
    unless $P10, rx1251_fail
    rx1251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1251_pos = $P10."pos"()
.annotate "line", 536
  # rx pass
    rx1251_cur."!cursor_pass"(rx1251_pos, "metachar:sym<{ }>")
    rx1251_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1251_pos)
    .return (rx1251_cur)
  rx1251_fail:
.annotate "line", 531
    (rx1251_rep, rx1251_pos, $I10, $P10) = rx1251_cur."!mark_fail"(0)
    lt rx1251_pos, -1, rx1251_done
    eq rx1251_pos, -1, rx1251_fail
    jump $I10
  rx1251_done:
    rx1251_cur."!cursor_fail"()
    rx1251_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1251_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("323_1267204702.05125") :method
.annotate "line", 531
    new $P1253, "ResizablePMCArray"
    push $P1253, "{"
    .return ($P1253)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("324_1267204702.05125") :method :outer("318_1267204702.05125")
.annotate "line", 531
    .local string rx1256_tgt
    .local int rx1256_pos
    .local int rx1256_off
    .local int rx1256_eos
    .local int rx1256_rep
    .local pmc rx1256_cur
    (rx1256_cur, rx1256_pos, rx1256_tgt) = self."!cursor_start"()
    rx1256_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1256_cur
    .local pmc match
    .lex "$/", match
    length rx1256_eos, rx1256_tgt
    set rx1256_off, 0
    lt rx1256_pos, 2, rx1256_start
    sub rx1256_off, rx1256_pos, 1
    substr rx1256_tgt, rx1256_tgt, rx1256_off
  rx1256_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1259_done
    goto rxscan1259_scan
  rxscan1259_loop:
    ($P10) = rx1256_cur."from"()
    inc $P10
    set rx1256_pos, $P10
    ge rx1256_pos, rx1256_eos, rxscan1259_done
  rxscan1259_scan:
    set_addr $I10, rxscan1259_loop
    rx1256_cur."!mark_push"(0, rx1256_pos, $I10)
  rxscan1259_done:
.annotate "line", 541
  # rx enumcharlist negate=0 zerowidth
    ge rx1256_pos, rx1256_eos, rx1256_fail
    sub $I10, rx1256_pos, rx1256_off
    substr $S10, rx1256_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1256_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1256_cur."!cursor_pos"(rx1256_pos)
    $P10 = rx1256_cur."codeblock"()
    unless $P10, rx1256_fail
    rx1256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1256_pos = $P10."pos"()
.annotate "line", 540
  # rx pass
    rx1256_cur."!cursor_pass"(rx1256_pos, "assertion:sym<{ }>")
    rx1256_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1256_pos)
    .return (rx1256_cur)
  rx1256_fail:
.annotate "line", 531
    (rx1256_rep, rx1256_pos, $I10, $P10) = rx1256_cur."!mark_fail"(0)
    lt rx1256_pos, -1, rx1256_done
    eq rx1256_pos, -1, rx1256_fail
    jump $I10
  rx1256_done:
    rx1256_cur."!cursor_fail"()
    rx1256_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1256_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("325_1267204702.05125") :method
.annotate "line", 531
    new $P1258, "ResizablePMCArray"
    push $P1258, "{"
    .return ($P1258)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("326_1267204702.05125") :method :outer("318_1267204702.05125")
.annotate "line", 531
    .const 'Sub' $P1269 = "328_1267204702.05125" 
    capture_lex $P1269
    .local string rx1261_tgt
    .local int rx1261_pos
    .local int rx1261_off
    .local int rx1261_eos
    .local int rx1261_rep
    .local pmc rx1261_cur
    (rx1261_cur, rx1261_pos, rx1261_tgt) = self."!cursor_start"()
    rx1261_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1261_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1261_cur
    .local pmc match
    .lex "$/", match
    length rx1261_eos, rx1261_tgt
    set rx1261_off, 0
    lt rx1261_pos, 2, rx1261_start
    sub rx1261_off, rx1261_pos, 1
    substr rx1261_tgt, rx1261_tgt, rx1261_off
  rx1261_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1264_done
    goto rxscan1264_scan
  rxscan1264_loop:
    ($P10) = rx1261_cur."from"()
    inc $P10
    set rx1261_pos, $P10
    ge rx1261_pos, rx1261_eos, rxscan1264_done
  rxscan1264_scan:
    set_addr $I10, rxscan1264_loop
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  rxscan1264_done:
.annotate "line", 545
  # rx subcapture "longname"
    set_addr $I10, rxcap_1265_fail
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1261_pos, rx1261_off
    find_not_cclass $I11, 8192, rx1261_tgt, $I10, rx1261_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1261_fail
    add rx1261_pos, rx1261_off, $I11
    set_addr $I10, rxcap_1265_fail
    ($I12, $I11) = rx1261_cur."!mark_peek"($I10)
    rx1261_cur."!cursor_pos"($I11)
    ($P10) = rx1261_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1261_pos, "")
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1265_done
  rxcap_1265_fail:
    goto rx1261_fail
  rxcap_1265_done:
.annotate "line", 552
  # rx rxquantr1266 ** 0..1
    set_addr $I1272, rxquantr1266_done
    rx1261_cur."!mark_push"(0, rx1261_pos, $I1272)
  rxquantr1266_loop:
  alt1267_0:
.annotate "line", 546
    set_addr $I10, alt1267_1
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
.annotate "line", 547
  # rx subrule "before" subtype=zerowidth negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    .const 'Sub' $P1269 = "328_1267204702.05125" 
    capture_lex $P1269
    $P10 = rx1261_cur."before"($P1269)
    unless $P10, rx1261_fail
    goto alt1267_end
  alt1267_1:
    set_addr $I10, alt1267_2
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
.annotate "line", 548
  # rx literal  "="
    add $I11, rx1261_pos, 1
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 1
    ne $S10, "=", rx1261_fail
    add rx1261_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."assertion"()
    unless $P10, rx1261_fail
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1261_pos = $P10."pos"()
    goto alt1267_end
  alt1267_2:
    set_addr $I10, alt1267_3
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
.annotate "line", 549
  # rx literal  ":"
    add $I11, rx1261_pos, 1
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 1
    ne $S10, ":", rx1261_fail
    add rx1261_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."arglist"()
    unless $P10, rx1261_fail
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1261_pos = $P10."pos"()
    goto alt1267_end
  alt1267_3:
    set_addr $I10, alt1267_4
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
.annotate "line", 550
  # rx literal  "("
    add $I11, rx1261_pos, 1
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 1
    ne $S10, "(", rx1261_fail
    add rx1261_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1261_fail
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1261_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1261_pos, 1
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 1
    ne $S10, ")", rx1261_fail
    add rx1261_pos, 1
    goto alt1267_end
  alt1267_4:
.annotate "line", 551
  # rx subrule "normspace" subtype=method negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."normspace"()
    unless $P10, rx1261_fail
    rx1261_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1261_cur."!cursor_pos"(rx1261_pos)
    $P10 = rx1261_cur."nibbler"()
    unless $P10, rx1261_fail
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1261_pos = $P10."pos"()
  alt1267_end:
.annotate "line", 552
    (rx1261_rep) = rx1261_cur."!mark_commit"($I1272)
  rxquantr1266_done:
.annotate "line", 544
  # rx pass
    rx1261_cur."!cursor_pass"(rx1261_pos, "assertion:sym<name>")
    rx1261_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1261_pos)
    .return (rx1261_cur)
  rx1261_fail:
.annotate "line", 531
    (rx1261_rep, rx1261_pos, $I10, $P10) = rx1261_cur."!mark_fail"(0)
    lt rx1261_pos, -1, rx1261_done
    eq rx1261_pos, -1, rx1261_fail
    jump $I10
  rx1261_done:
    rx1261_cur."!cursor_fail"()
    rx1261_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1261_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("327_1267204702.05125") :method
.annotate "line", 531
    new $P1263, "ResizablePMCArray"
    push $P1263, ""
    .return ($P1263)
.end


.namespace ["NQP";"Regex"]
.sub "_block1268"  :anon :subid("328_1267204702.05125") :method :outer("326_1267204702.05125")
.annotate "line", 547
    .local string rx1270_tgt
    .local int rx1270_pos
    .local int rx1270_off
    .local int rx1270_eos
    .local int rx1270_rep
    .local pmc rx1270_cur
    (rx1270_cur, rx1270_pos, rx1270_tgt) = self."!cursor_start"()
    rx1270_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1271_done
    goto rxscan1271_scan
  rxscan1271_loop:
    ($P10) = rx1270_cur."from"()
    inc $P10
    set rx1270_pos, $P10
    ge rx1270_pos, rx1270_eos, rxscan1271_done
  rxscan1271_scan:
    set_addr $I10, rxscan1271_loop
    rx1270_cur."!mark_push"(0, rx1270_pos, $I10)
  rxscan1271_done:
  # rx literal  ">"
    add $I11, rx1270_pos, 1
    gt $I11, rx1270_eos, rx1270_fail
    sub $I11, rx1270_pos, rx1270_off
    substr $S10, rx1270_tgt, $I11, 1
    ne $S10, ">", rx1270_fail
    add rx1270_pos, 1
  # rx pass
    rx1270_cur."!cursor_pass"(rx1270_pos, "")
    rx1270_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1270_pos)
    .return (rx1270_cur)
  rx1270_fail:
    (rx1270_rep, rx1270_pos, $I10, $P10) = rx1270_cur."!mark_fail"(0)
    lt rx1270_pos, -1, rx1270_done
    eq rx1270_pos, -1, rx1270_fail
    jump $I10
  rx1270_done:
    rx1270_cur."!cursor_fail"()
    rx1270_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1270_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("329_1267204702.05125") :method :outer("318_1267204702.05125")
.annotate "line", 531
    .local string rx1274_tgt
    .local int rx1274_pos
    .local int rx1274_off
    .local int rx1274_eos
    .local int rx1274_rep
    .local pmc rx1274_cur
    (rx1274_cur, rx1274_pos, rx1274_tgt) = self."!cursor_start"()
    rx1274_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1274_cur
    .local pmc match
    .lex "$/", match
    length rx1274_eos, rx1274_tgt
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
.annotate "line", 557
  # rx subrule "LANG" subtype=capture negate=
    rx1274_cur."!cursor_pos"(rx1274_pos)
    $P10 = rx1274_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1274_fail
    rx1274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1274_pos = $P10."pos"()
.annotate "line", 556
  # rx pass
    rx1274_cur."!cursor_pass"(rx1274_pos, "codeblock")
    rx1274_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1274_pos)
    .return (rx1274_cur)
  rx1274_fail:
.annotate "line", 531
    (rx1274_rep, rx1274_pos, $I10, $P10) = rx1274_cur."!mark_fail"(0)
    lt rx1274_pos, -1, rx1274_done
    eq rx1274_pos, -1, rx1274_fail
    jump $I10
  rx1274_done:
    rx1274_cur."!cursor_fail"()
    rx1274_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1274_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("330_1267204702.05125") :method
.annotate "line", 531
    $P1276 = self."!PREFIX__!subrule"("block", "")
    new $P1277, "ResizablePMCArray"
    push $P1277, $P1276
    .return ($P1277)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1267204714.47172")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2168 = $P14()
.annotate "line", 1
    .return ($P2168)
.end


.namespace []
.sub "" :load :init :subid("post126") :outer("10_1267204714.47172")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1267204714.47172" 
    .local pmc block
    set block, $P12
    $P2169 = get_root_global ["parrot"], "P6metaclass"
    $P2169."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1267204714.47172") :outer("10_1267204714.47172")
.annotate "line", 3
    .const 'Sub' $P2164 = "125_1267204714.47172" 
    capture_lex $P2164
    get_hll_global $P2100, ["NQP";"RegexActions"], "_block2099" 
    capture_lex $P2100
    .const 'Sub' $P2089 = "119_1267204714.47172" 
    capture_lex $P2089
    .const 'Sub' $P2077 = "118_1267204714.47172" 
    capture_lex $P2077
    .const 'Sub' $P2067 = "117_1267204714.47172" 
    capture_lex $P2067
    .const 'Sub' $P2057 = "116_1267204714.47172" 
    capture_lex $P2057
    .const 'Sub' $P2047 = "115_1267204714.47172" 
    capture_lex $P2047
    .const 'Sub' $P2033 = "114_1267204714.47172" 
    capture_lex $P2033
    .const 'Sub' $P2023 = "113_1267204714.47172" 
    capture_lex $P2023
    .const 'Sub' $P1986 = "112_1267204714.47172" 
    capture_lex $P1986
    .const 'Sub' $P1972 = "111_1267204714.47172" 
    capture_lex $P1972
    .const 'Sub' $P1962 = "110_1267204714.47172" 
    capture_lex $P1962
    .const 'Sub' $P1952 = "109_1267204714.47172" 
    capture_lex $P1952
    .const 'Sub' $P1942 = "108_1267204714.47172" 
    capture_lex $P1942
    .const 'Sub' $P1932 = "107_1267204714.47172" 
    capture_lex $P1932
    .const 'Sub' $P1922 = "106_1267204714.47172" 
    capture_lex $P1922
    .const 'Sub' $P1894 = "105_1267204714.47172" 
    capture_lex $P1894
    .const 'Sub' $P1877 = "104_1267204714.47172" 
    capture_lex $P1877
    .const 'Sub' $P1867 = "103_1267204714.47172" 
    capture_lex $P1867
    .const 'Sub' $P1854 = "102_1267204714.47172" 
    capture_lex $P1854
    .const 'Sub' $P1841 = "101_1267204714.47172" 
    capture_lex $P1841
    .const 'Sub' $P1828 = "100_1267204714.47172" 
    capture_lex $P1828
    .const 'Sub' $P1818 = "99_1267204714.47172" 
    capture_lex $P1818
    .const 'Sub' $P1789 = "98_1267204714.47172" 
    capture_lex $P1789
    .const 'Sub' $P1769 = "97_1267204714.47172" 
    capture_lex $P1769
    .const 'Sub' $P1759 = "96_1267204714.47172" 
    capture_lex $P1759
    .const 'Sub' $P1749 = "95_1267204714.47172" 
    capture_lex $P1749
    .const 'Sub' $P1722 = "94_1267204714.47172" 
    capture_lex $P1722
    .const 'Sub' $P1704 = "93_1267204714.47172" 
    capture_lex $P1704
    .const 'Sub' $P1694 = "92_1267204714.47172" 
    capture_lex $P1694
    .const 'Sub' $P1610 = "89_1267204714.47172" 
    capture_lex $P1610
    .const 'Sub' $P1600 = "88_1267204714.47172" 
    capture_lex $P1600
    .const 'Sub' $P1571 = "87_1267204714.47172" 
    capture_lex $P1571
    .const 'Sub' $P1529 = "86_1267204714.47172" 
    capture_lex $P1529
    .const 'Sub' $P1513 = "85_1267204714.47172" 
    capture_lex $P1513
    .const 'Sub' $P1504 = "84_1267204714.47172" 
    capture_lex $P1504
    .const 'Sub' $P1472 = "83_1267204714.47172" 
    capture_lex $P1472
    .const 'Sub' $P1373 = "80_1267204714.47172" 
    capture_lex $P1373
    .const 'Sub' $P1356 = "79_1267204714.47172" 
    capture_lex $P1356
    .const 'Sub' $P1336 = "78_1267204714.47172" 
    capture_lex $P1336
    .const 'Sub' $P1252 = "77_1267204714.47172" 
    capture_lex $P1252
    .const 'Sub' $P1228 = "75_1267204714.47172" 
    capture_lex $P1228
    .const 'Sub' $P1194 = "73_1267204714.47172" 
    capture_lex $P1194
    .const 'Sub' $P1144 = "71_1267204714.47172" 
    capture_lex $P1144
    .const 'Sub' $P1134 = "70_1267204714.47172" 
    capture_lex $P1134
    .const 'Sub' $P1124 = "69_1267204714.47172" 
    capture_lex $P1124
    .const 'Sub' $P1053 = "67_1267204714.47172" 
    capture_lex $P1053
    .const 'Sub' $P1036 = "66_1267204714.47172" 
    capture_lex $P1036
    .const 'Sub' $P1026 = "65_1267204714.47172" 
    capture_lex $P1026
    .const 'Sub' $P1016 = "64_1267204714.47172" 
    capture_lex $P1016
    .const 'Sub' $P1006 = "63_1267204714.47172" 
    capture_lex $P1006
    .const 'Sub' $P982 = "62_1267204714.47172" 
    capture_lex $P982
    .const 'Sub' $P929 = "61_1267204714.47172" 
    capture_lex $P929
    .const 'Sub' $P919 = "60_1267204714.47172" 
    capture_lex $P919
    .const 'Sub' $P830 = "58_1267204714.47172" 
    capture_lex $P830
    .const 'Sub' $P804 = "57_1267204714.47172" 
    capture_lex $P804
    .const 'Sub' $P788 = "56_1267204714.47172" 
    capture_lex $P788
    .const 'Sub' $P778 = "55_1267204714.47172" 
    capture_lex $P778
    .const 'Sub' $P768 = "54_1267204714.47172" 
    capture_lex $P768
    .const 'Sub' $P758 = "53_1267204714.47172" 
    capture_lex $P758
    .const 'Sub' $P748 = "52_1267204714.47172" 
    capture_lex $P748
    .const 'Sub' $P738 = "51_1267204714.47172" 
    capture_lex $P738
    .const 'Sub' $P728 = "50_1267204714.47172" 
    capture_lex $P728
    .const 'Sub' $P718 = "49_1267204714.47172" 
    capture_lex $P718
    .const 'Sub' $P708 = "48_1267204714.47172" 
    capture_lex $P708
    .const 'Sub' $P698 = "47_1267204714.47172" 
    capture_lex $P698
    .const 'Sub' $P688 = "46_1267204714.47172" 
    capture_lex $P688
    .const 'Sub' $P678 = "45_1267204714.47172" 
    capture_lex $P678
    .const 'Sub' $P668 = "44_1267204714.47172" 
    capture_lex $P668
    .const 'Sub' $P658 = "43_1267204714.47172" 
    capture_lex $P658
    .const 'Sub' $P640 = "42_1267204714.47172" 
    capture_lex $P640
    .const 'Sub' $P605 = "41_1267204714.47172" 
    capture_lex $P605
    .const 'Sub' $P589 = "40_1267204714.47172" 
    capture_lex $P589
    .const 'Sub' $P568 = "39_1267204714.47172" 
    capture_lex $P568
    .const 'Sub' $P548 = "38_1267204714.47172" 
    capture_lex $P548
    .const 'Sub' $P535 = "37_1267204714.47172" 
    capture_lex $P535
    .const 'Sub' $P509 = "36_1267204714.47172" 
    capture_lex $P509
    .const 'Sub' $P473 = "35_1267204714.47172" 
    capture_lex $P473
    .const 'Sub' $P456 = "34_1267204714.47172" 
    capture_lex $P456
    .const 'Sub' $P442 = "33_1267204714.47172" 
    capture_lex $P442
    .const 'Sub' $P389 = "31_1267204714.47172" 
    capture_lex $P389
    .const 'Sub' $P376 = "30_1267204714.47172" 
    capture_lex $P376
    .const 'Sub' $P357 = "29_1267204714.47172" 
    capture_lex $P357
    .const 'Sub' $P347 = "28_1267204714.47172" 
    capture_lex $P347
    .const 'Sub' $P337 = "27_1267204714.47172" 
    capture_lex $P337
    .const 'Sub' $P321 = "26_1267204714.47172" 
    capture_lex $P321
    .const 'Sub' $P261 = "24_1267204714.47172" 
    capture_lex $P261
    .const 'Sub' $P212 = "22_1267204714.47172" 
    capture_lex $P212
    .const 'Sub' $P193 = "21_1267204714.47172" 
    capture_lex $P193
    .const 'Sub' $P160 = "20_1267204714.47172" 
    capture_lex $P160
    .const 'Sub' $P150 = "19_1267204714.47172" 
    capture_lex $P150
    .const 'Sub' $P96 = "18_1267204714.47172" 
    capture_lex $P96
    .const 'Sub' $P81 = "17_1267204714.47172" 
    capture_lex $P81
    .const 'Sub' $P61 = "16_1267204714.47172" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1267204714.47172" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1267204714.47172" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_129
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P15
  vivify_129:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1267204714.47172" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1267204714.47172" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1267204714.47172" 
    capture_lex $P61
    .lex "vivitype", $P61
.annotate "line", 43
    .const 'Sub' $P81 = "17_1267204714.47172" 
    capture_lex $P81
    .lex "colonpair_str", $P81
.annotate "line", 190
    .const 'Sub' $P96 = "18_1267204714.47172" 
    capture_lex $P96
    .lex "push_block_handler", $P96
.annotate "line", 3
    get_global $P146, "@BLOCK"
.annotate "line", 5
    find_lex $P147, "xblock_immediate"
    find_lex $P148, "block_immediate"
    find_lex $P149, "vivitype"
.annotate "line", 35
    find_lex $P192, "colonpair_str"
.annotate "line", 183
    find_lex $P588, "push_block_handler"
.annotate "line", 768
    get_hll_global $P2100, ["NQP";"RegexActions"], "_block2099" 
    capture_lex $P2100
    $P2162 = $P2100()
.annotate "line", 3
    .return ($P2162)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post127") :outer("11_1267204714.47172")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2164 = "125_1267204714.47172" 
    capture_lex $P2164
    $P2164()
    $P2167 = get_root_global ["parrot"], "P6metaclass"
    $P2167."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2163"  :anon :subid("125_1267204714.47172") :outer("11_1267204714.47172")
.annotate "line", 6
    get_global $P2165, "@BLOCK"
    unless_null $P2165, vivify_128
    $P2165 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P2165
  vivify_128:
 $P2166 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2166
.annotate "line", 5
    .return ($P2166)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1267204714.47172") :outer("11_1267204714.47172")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_130
    $P20 = root_new ['parrot';'ResizablePMCArray']
  vivify_130:
    set $P21, $P20[1]
    unless_null $P21, vivify_131
    new $P21, "Undef"
  vivify_131:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_132
    $P23 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$xblock", $P23
  vivify_132:
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
.sub "block_immediate"  :subid("13_1267204714.47172") :outer("11_1267204714.47172")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1267204714.47172" 
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
    .const 'Sub' $P39 = "14_1267204714.47172" 
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
.sub "_block38"  :anon :subid("14_1267204714.47172") :outer("13_1267204714.47172")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1267204714.47172" 
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
    unless $I47, for_undef_133
    iter $P44, $P46
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P44, loop55_done
    shift $P48, $P44
  loop55_redo:
    .const 'Sub' $P50 = "15_1267204714.47172" 
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
  for_undef_133:
.annotate "line", 19
    find_lex $P58, "$stmts"
    store_lex "$block", $P58
.annotate "line", 16
    .return ($P58)
.end


.namespace ["NQP";"Actions"]
.sub "_block49"  :anon :subid("15_1267204714.47172") :outer("14_1267204714.47172")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "vivitype"  :subid("16_1267204714.47172") :outer("11_1267204714.47172")
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
    find_lex $P74, "$sigil"
    set $S75, $P74
    iseq $I76, $S75, "@"
    if $I76, if_73
    new $P79, "String"
    assign $P79, "Undef"
    set $P72, $P79
    goto if_73_end
  if_73:
.annotate "line", 28
    get_hll_global $P77, ["PAST"], "Op"
    $P78 = $P77."new"("    %r = root_new ['parrot';'ResizablePMCArray']" :named("inline"))
    set $P72, $P78
  if_73_end:
    set $P65, $P72
.annotate "line", 25
    goto if_66_end
  if_66:
.annotate "line", 26
    get_hll_global $P70, ["PAST"], "Op"
    $P71 = $P70."new"("    %r = root_new ['parrot';'Hash']" :named("inline"))
    set $P65, $P71
  if_66_end:
.annotate "line", 24
    .return ($P65)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair_str"  :subid("17_1267204714.47172") :outer("11_1267204714.47172")
    .param pmc param_84
.annotate "line", 43
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "$ast", param_84
.annotate "line", 44
    get_hll_global $P87, ["PAST"], "Op"
    find_lex $P88, "$ast"
    $P89 = $P87."ACCEPTS"($P88)
    if $P89, if_86
.annotate "line", 46
    find_lex $P93, "$ast"
    $P94 = $P93."value"()
    set $P85, $P94
.annotate "line", 44
    goto if_86_end
  if_86:
.annotate "line", 45
    find_lex $P90, "$ast"
    $P91 = $P90."list"()
    join $S92, " ", $P91
    new $P85, 'String'
    set $P85, $S92
  if_86_end:
.annotate "line", 43
    .return ($P85)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
.end


.namespace ["NQP";"Actions"]
.sub "push_block_handler"  :subid("18_1267204714.47172") :outer("11_1267204714.47172")
    .param pmc param_99
    .param pmc param_100
.annotate "line", 190
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "$/", param_99
    .lex "$block", param_100
.annotate "line", 191
    get_global $P102, "@BLOCK"
    unless_null $P102, vivify_134
    $P102 = root_new ['parrot';'ResizablePMCArray']
  vivify_134:
    set $P103, $P102[0]
    unless_null $P103, vivify_135
    new $P103, "Undef"
  vivify_135:
    $P104 = $P103."handlers"()
    if $P104, unless_101_end
.annotate "line", 192
    get_global $P105, "@BLOCK"
    unless_null $P105, vivify_136
    $P105 = root_new ['parrot';'ResizablePMCArray']
  vivify_136:
    set $P106, $P105[0]
    unless_null $P106, vivify_137
    new $P106, "Undef"
  vivify_137:
    new $P107, "ResizablePMCArray"
    $P106."handlers"($P107)
  unless_101_end:
.annotate "line", 194
    find_lex $P109, "$block"
    $P110 = $P109."arity"()
    if $P110, unless_108_end
.annotate "line", 195
    find_lex $P111, "$block"
.annotate "line", 196
    get_hll_global $P112, ["PAST"], "Op"
.annotate "line", 197
    get_hll_global $P113, ["PAST"], "Var"
    $P114 = $P113."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate "line", 198
    get_hll_global $P115, ["PAST"], "Var"
    $P116 = $P115."new"("lexical" :named("scope"), "$_" :named("name"))
    $P117 = $P112."new"($P114, $P116, "bind" :named("pasttype"))
.annotate "line", 196
    $P111."unshift"($P117)
.annotate "line", 201
    find_lex $P118, "$block"
    get_hll_global $P119, ["PAST"], "Var"
    $P120 = $P119."new"("$_" :named("name"), "parameter" :named("scope"))
    $P118."unshift"($P120)
.annotate "line", 202
    find_lex $P121, "$block"
    $P121."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 203
    find_lex $P122, "$block"
    $P122."symbol"("$!", "lexical" :named("scope"))
.annotate "line", 204
    find_lex $P123, "$block"
    $P123."arity"(1)
  unless_108_end:
.annotate "line", 206
    find_lex $P124, "$block"
    $P124."blocktype"("declaration")
.annotate "line", 207
    get_global $P125, "@BLOCK"
    unless_null $P125, vivify_138
    $P125 = root_new ['parrot';'ResizablePMCArray']
  vivify_138:
    set $P126, $P125[0]
    unless_null $P126, vivify_139
    new $P126, "Undef"
  vivify_139:
    $P127 = $P126."handlers"()
.annotate "line", 208
    get_hll_global $P128, ["PAST"], "Control"
    find_lex $P129, "$/"
.annotate "line", 210
    get_hll_global $P130, ["PAST"], "Stmts"
.annotate "line", 211
    get_hll_global $P131, ["PAST"], "Op"
    find_lex $P132, "$block"
.annotate "line", 213
    get_hll_global $P133, ["PAST"], "Var"
    $P134 = $P133."new"("register" :named("scope"), "exception" :named("name"))
    $P135 = $P131."new"($P132, $P134, "call" :named("pasttype"))
.annotate "line", 215
    get_hll_global $P136, ["PAST"], "Op"
.annotate "line", 216
    get_hll_global $P137, ["PAST"], "Var"
.annotate "line", 217
    get_hll_global $P138, ["PAST"], "Var"
    $P139 = $P138."new"("register" :named("scope"), "exception" :named("name"))
    $P140 = $P137."new"($P139, "handled", "keyed" :named("scope"))
.annotate "line", 216
    $P141 = $P136."new"($P140, 1, "bind" :named("pasttype"))
.annotate "line", 215
    $P142 = $P130."new"($P135, $P141)
.annotate "line", 210
    $P143 = $P128."new"($P142, $P129 :named("node"))
.annotate "line", 208
    $P144 = $P127."unshift"($P143)
.annotate "line", 190
    .return ($P144)
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P145, exception, "payload"
    .return ($P145)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("19_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_153
.annotate "line", 33
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "self", self
    .lex "$/", param_153
    find_lex $P154, "$/"
    find_lex $P155, "$/"
    unless_null $P155, vivify_140
    $P155 = root_new ['parrot';'Hash']
  vivify_140:
    set $P156, $P155["comp_unit"]
    unless_null $P156, vivify_141
    new $P156, "Undef"
  vivify_141:
    $P157 = $P156."ast"()
    $P158 = $P154."!make"($P157)
    .return ($P158)
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P159, exception, "payload"
    .return ($P159)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("20_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_163
.annotate "line", 35
    new $P162, 'ExceptionHandler'
    set_addr $P162, control_161
    $P162."handle_types"(58)
    push_eh $P162
    .lex "self", self
    .lex "$/", param_163
.annotate "line", 36
    find_lex $P164, "$/"
.annotate "line", 37
    find_lex $P167, "$/"
    unless_null $P167, vivify_142
    $P167 = root_new ['parrot';'Hash']
  vivify_142:
    set $P168, $P167["colonpair"]
    unless_null $P168, vivify_143
    new $P168, "Undef"
  vivify_143:
    if $P168, if_166
.annotate "line", 39
    find_lex $P188, "$/"
    set $S189, $P188
    new $P165, 'String'
    set $P165, $S189
.annotate "line", 37
    goto if_166_end
  if_166:
    find_lex $P169, "$/"
    unless_null $P169, vivify_144
    $P169 = root_new ['parrot';'Hash']
  vivify_144:
    set $P170, $P169["identifier"]
    unless_null $P170, vivify_145
    new $P170, "Undef"
  vivify_145:
    set $S171, $P170
    new $P172, 'String'
    set $P172, $S171
    concat $P173, $P172, ":"
    find_lex $P174, "$/"
    unless_null $P174, vivify_146
    $P174 = root_new ['parrot';'Hash']
  vivify_146:
    set $P175, $P174["colonpair"]
    unless_null $P175, vivify_147
    $P175 = root_new ['parrot';'ResizablePMCArray']
  vivify_147:
    set $P176, $P175[0]
    unless_null $P176, vivify_148
    new $P176, "Undef"
  vivify_148:
    $P177 = $P176."ast"()
    $S178 = $P177."named"()
    concat $P179, $P173, $S178
    concat $P180, $P179, "<"
.annotate "line", 38
    find_lex $P181, "$/"
    unless_null $P181, vivify_149
    $P181 = root_new ['parrot';'Hash']
  vivify_149:
    set $P182, $P181["colonpair"]
    unless_null $P182, vivify_150
    $P182 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P183, $P182[0]
    unless_null $P183, vivify_151
    new $P183, "Undef"
  vivify_151:
    $P184 = $P183."ast"()
    $S185 = "colonpair_str"($P184)
    concat $P186, $P180, $S185
    concat $P187, $P186, ">"
    set $P165, $P187
  if_166_end:
.annotate "line", 37
    $P190 = $P164."!make"($P165)
.annotate "line", 35
    .return ($P190)
  control_161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P191, exception, "payload"
    .return ($P191)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("21_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_196
.annotate "line", 49
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "self", self
    .lex "$/", param_196
.annotate "line", 50
    new $P197, "Undef"
    .lex "$past", $P197
.annotate "line", 51
    new $P198, "Undef"
    .lex "$BLOCK", $P198
.annotate "line", 50
    find_lex $P199, "$/"
    unless_null $P199, vivify_152
    $P199 = root_new ['parrot';'Hash']
  vivify_152:
    set $P200, $P199["statementlist"]
    unless_null $P200, vivify_153
    new $P200, "Undef"
  vivify_153:
    $P201 = $P200."ast"()
    store_lex "$past", $P201
.annotate "line", 51
    get_global $P202, "@BLOCK"
    $P203 = $P202."shift"()
    store_lex "$BLOCK", $P203
.annotate "line", 52
    find_lex $P204, "$BLOCK"
    find_lex $P205, "$past"
    $P204."push"($P205)
.annotate "line", 53
    find_lex $P206, "$BLOCK"
    find_lex $P207, "$/"
    $P206."node"($P207)
.annotate "line", 54
    find_lex $P208, "$/"
    find_lex $P209, "$BLOCK"
    $P210 = $P208."!make"($P209)
.annotate "line", 49
    .return ($P210)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("22_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_215
.annotate "line", 57
    .const 'Sub' $P229 = "23_1267204714.47172" 
    capture_lex $P229
    new $P214, 'ExceptionHandler'
    set_addr $P214, control_213
    $P214."handle_types"(58)
    push_eh $P214
    .lex "self", self
    .lex "$/", param_215
.annotate "line", 58
    new $P216, "Undef"
    .lex "$past", $P216
    get_hll_global $P217, ["PAST"], "Stmts"
    find_lex $P218, "$/"
    $P219 = $P217."new"($P218 :named("node"))
    store_lex "$past", $P219
.annotate "line", 59
    find_lex $P221, "$/"
    unless_null $P221, vivify_154
    $P221 = root_new ['parrot';'Hash']
  vivify_154:
    set $P222, $P221["statement"]
    unless_null $P222, vivify_155
    new $P222, "Undef"
  vivify_155:
    unless $P222, if_220_end
.annotate "line", 60
    find_lex $P224, "$/"
    unless_null $P224, vivify_156
    $P224 = root_new ['parrot';'Hash']
  vivify_156:
    set $P225, $P224["statement"]
    unless_null $P225, vivify_157
    new $P225, "Undef"
  vivify_157:
    defined $I226, $P225
    unless $I226, for_undef_158
    iter $P223, $P225
    new $P255, 'ExceptionHandler'
    set_addr $P255, loop254_handler
    $P255."handle_types"(65, 67, 66)
    push_eh $P255
  loop254_test:
    unless $P223, loop254_done
    shift $P227, $P223
  loop254_redo:
    .const 'Sub' $P229 = "23_1267204714.47172" 
    capture_lex $P229
    $P229($P227)
  loop254_next:
    goto loop254_test
  loop254_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, 'type'
    eq $P256, 65, loop254_next
    eq $P256, 67, loop254_redo
  loop254_done:
    pop_eh 
  for_undef_158:
  if_220_end:
.annotate "line", 69
    find_lex $P257, "$/"
    find_lex $P258, "$past"
    $P259 = $P257."!make"($P258)
.annotate "line", 57
    .return ($P259)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P260, exception, "payload"
    .return ($P260)
.end


.namespace ["NQP";"Actions"]
.sub "_block228"  :anon :subid("23_1267204714.47172") :outer("22_1267204714.47172")
    .param pmc param_231
.annotate "line", 61
    new $P230, "Undef"
    .lex "$ast", $P230
    .lex "$_", param_231
    find_lex $P232, "$_"
    $P233 = $P232."ast"()
    store_lex "$ast", $P233
.annotate "line", 62
    find_lex $P235, "$ast"
    unless_null $P235, vivify_159
    $P235 = root_new ['parrot';'Hash']
  vivify_159:
    set $P236, $P235["sink"]
    unless_null $P236, vivify_160
    new $P236, "Undef"
  vivify_160:
    defined $I237, $P236
    unless $I237, if_234_end
    find_lex $P238, "$ast"
    unless_null $P238, vivify_161
    $P238 = root_new ['parrot';'Hash']
  vivify_161:
    set $P239, $P238["sink"]
    unless_null $P239, vivify_162
    new $P239, "Undef"
  vivify_162:
    store_lex "$ast", $P239
  if_234_end:
.annotate "line", 63
    find_lex $P243, "$ast"
    get_hll_global $P244, ["PAST"], "Block"
    $P245 = $P243."isa"($P244)
    if $P245, if_242
    set $P241, $P245
    goto if_242_end
  if_242:
    find_lex $P246, "$ast"
    $P247 = $P246."blocktype"()
    isfalse $I248, $P247
    new $P241, 'Integer'
    set $P241, $I248
  if_242_end:
    unless $P241, if_240_end
.annotate "line", 64
    find_lex $P249, "$ast"
    $P250 = "block_immediate"($P249)
    store_lex "$ast", $P250
  if_240_end:
.annotate "line", 66
    find_lex $P251, "$past"
    find_lex $P252, "$ast"
    $P253 = $P251."push"($P252)
.annotate "line", 60
    .return ($P253)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("24_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_264
    .param pmc param_265 :optional
    .param int has_param_265 :opt_flag
.annotate "line", 72
    .const 'Sub' $P273 = "25_1267204714.47172" 
    capture_lex $P273
    new $P263, 'ExceptionHandler'
    set_addr $P263, control_262
    $P263."handle_types"(58)
    push_eh $P263
    .lex "self", self
    .lex "$/", param_264
    if has_param_265, optparam_163
    new $P266, "Undef"
    set param_265, $P266
  optparam_163:
    .lex "$key", param_265
.annotate "line", 73
    new $P267, "Undef"
    .lex "$past", $P267
.annotate "line", 72
    find_lex $P268, "$past"
.annotate "line", 74
    find_lex $P270, "$/"
    unless_null $P270, vivify_164
    $P270 = root_new ['parrot';'Hash']
  vivify_164:
    set $P271, $P270["EXPR"]
    unless_null $P271, vivify_165
    new $P271, "Undef"
  vivify_165:
    if $P271, if_269
.annotate "line", 85
    find_lex $P311, "$/"
    unless_null $P311, vivify_166
    $P311 = root_new ['parrot';'Hash']
  vivify_166:
    set $P312, $P311["statement_control"]
    unless_null $P312, vivify_167
    new $P312, "Undef"
  vivify_167:
    if $P312, if_310
.annotate "line", 86
    new $P316, "Integer"
    assign $P316, 0
    store_lex "$past", $P316
    goto if_310_end
  if_310:
.annotate "line", 85
    find_lex $P313, "$/"
    unless_null $P313, vivify_168
    $P313 = root_new ['parrot';'Hash']
  vivify_168:
    set $P314, $P313["statement_control"]
    unless_null $P314, vivify_169
    new $P314, "Undef"
  vivify_169:
    $P315 = $P314."ast"()
    store_lex "$past", $P315
  if_310_end:
    goto if_269_end
  if_269:
.annotate "line", 74
    .const 'Sub' $P273 = "25_1267204714.47172" 
    capture_lex $P273
    $P273()
  if_269_end:
.annotate "line", 87
    find_lex $P317, "$/"
    find_lex $P318, "$past"
    $P319 = $P317."!make"($P318)
.annotate "line", 72
    .return ($P319)
  control_262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
.end


.namespace ["NQP";"Actions"]
.sub "_block272"  :anon :subid("25_1267204714.47172") :outer("24_1267204714.47172")
.annotate "line", 75
    new $P274, "Undef"
    .lex "$mc", $P274
.annotate "line", 76
    new $P275, "Undef"
    .lex "$ml", $P275
.annotate "line", 75
    find_lex $P276, "$/"
    unless_null $P276, vivify_170
    $P276 = root_new ['parrot';'Hash']
  vivify_170:
    set $P277, $P276["statement_mod_cond"]
    unless_null $P277, vivify_171
    $P277 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P278, $P277[0]
    unless_null $P278, vivify_172
    new $P278, "Undef"
  vivify_172:
    store_lex "$mc", $P278
.annotate "line", 76
    find_lex $P279, "$/"
    unless_null $P279, vivify_173
    $P279 = root_new ['parrot';'Hash']
  vivify_173:
    set $P280, $P279["statement_mod_loop"]
    unless_null $P280, vivify_174
    $P280 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P281, $P280[0]
    unless_null $P281, vivify_175
    new $P281, "Undef"
  vivify_175:
    store_lex "$ml", $P281
.annotate "line", 77
    find_lex $P282, "$/"
    unless_null $P282, vivify_176
    $P282 = root_new ['parrot';'Hash']
  vivify_176:
    set $P283, $P282["EXPR"]
    unless_null $P283, vivify_177
    new $P283, "Undef"
  vivify_177:
    $P284 = $P283."ast"()
    store_lex "$past", $P284
.annotate "line", 78
    find_lex $P286, "$mc"
    unless $P286, if_285_end
.annotate "line", 79
    get_hll_global $P287, ["PAST"], "Op"
    find_lex $P288, "$mc"
    unless_null $P288, vivify_178
    $P288 = root_new ['parrot';'Hash']
  vivify_178:
    set $P289, $P288["cond"]
    unless_null $P289, vivify_179
    new $P289, "Undef"
  vivify_179:
    $P290 = $P289."ast"()
    find_lex $P291, "$past"
    find_lex $P292, "$mc"
    unless_null $P292, vivify_180
    $P292 = root_new ['parrot';'Hash']
  vivify_180:
    set $P293, $P292["sym"]
    unless_null $P293, vivify_181
    new $P293, "Undef"
  vivify_181:
    set $S294, $P293
    find_lex $P295, "$/"
    $P296 = $P287."new"($P290, $P291, $S294 :named("pasttype"), $P295 :named("node"))
    store_lex "$past", $P296
  if_285_end:
.annotate "line", 81
    find_lex $P299, "$ml"
    if $P299, if_298
    set $P297, $P299
    goto if_298_end
  if_298:
.annotate "line", 82
    get_hll_global $P300, ["PAST"], "Op"
    find_lex $P301, "$ml"
    unless_null $P301, vivify_182
    $P301 = root_new ['parrot';'Hash']
  vivify_182:
    set $P302, $P301["cond"]
    unless_null $P302, vivify_183
    new $P302, "Undef"
  vivify_183:
    $P303 = $P302."ast"()
    find_lex $P304, "$past"
    find_lex $P305, "$ml"
    unless_null $P305, vivify_184
    $P305 = root_new ['parrot';'Hash']
  vivify_184:
    set $P306, $P305["sym"]
    unless_null $P306, vivify_185
    new $P306, "Undef"
  vivify_185:
    set $S307, $P306
    find_lex $P308, "$/"
    $P309 = $P300."new"($P303, $P304, $S307 :named("pasttype"), $P308 :named("node"))
    store_lex "$past", $P309
.annotate "line", 81
    set $P297, $P309
  if_298_end:
.annotate "line", 74
    .return ($P297)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("26_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_324
.annotate "line", 90
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "self", self
    .lex "$/", param_324
.annotate "line", 91
    find_lex $P325, "$/"
    get_hll_global $P326, ["PAST"], "Op"
    find_lex $P327, "$/"
    unless_null $P327, vivify_186
    $P327 = root_new ['parrot';'Hash']
  vivify_186:
    set $P328, $P327["EXPR"]
    unless_null $P328, vivify_187
    new $P328, "Undef"
  vivify_187:
    $P329 = $P328."ast"()
    find_lex $P330, "$/"
    unless_null $P330, vivify_188
    $P330 = root_new ['parrot';'Hash']
  vivify_188:
    set $P331, $P330["pblock"]
    unless_null $P331, vivify_189
    new $P331, "Undef"
  vivify_189:
    $P332 = $P331."ast"()
    find_lex $P333, "$/"
    $P334 = $P326."new"($P329, $P332, "if" :named("pasttype"), $P333 :named("node"))
    $P335 = $P325."!make"($P334)
.annotate "line", 90
    .return ($P335)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("27_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_340
.annotate "line", 94
    new $P339, 'ExceptionHandler'
    set_addr $P339, control_338
    $P339."handle_types"(58)
    push_eh $P339
    .lex "self", self
    .lex "$/", param_340
.annotate "line", 95
    find_lex $P341, "$/"
    find_lex $P342, "$/"
    unless_null $P342, vivify_190
    $P342 = root_new ['parrot';'Hash']
  vivify_190:
    set $P343, $P342["blockoid"]
    unless_null $P343, vivify_191
    new $P343, "Undef"
  vivify_191:
    $P344 = $P343."ast"()
    $P345 = $P341."!make"($P344)
.annotate "line", 94
    .return ($P345)
  control_338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("28_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_350
.annotate "line", 98
    new $P349, 'ExceptionHandler'
    set_addr $P349, control_348
    $P349."handle_types"(58)
    push_eh $P349
    .lex "self", self
    .lex "$/", param_350
.annotate "line", 99
    find_lex $P351, "$/"
    find_lex $P352, "$/"
    unless_null $P352, vivify_192
    $P352 = root_new ['parrot';'Hash']
  vivify_192:
    set $P353, $P352["blockoid"]
    unless_null $P353, vivify_193
    new $P353, "Undef"
  vivify_193:
    $P354 = $P353."ast"()
    $P355 = $P351."!make"($P354)
.annotate "line", 98
    .return ($P355)
  control_348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("29_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_360
.annotate "line", 102
    new $P359, 'ExceptionHandler'
    set_addr $P359, control_358
    $P359."handle_types"(58)
    push_eh $P359
    .lex "self", self
    .lex "$/", param_360
.annotate "line", 103
    new $P361, "Undef"
    .lex "$past", $P361
.annotate "line", 104
    new $P362, "Undef"
    .lex "$BLOCK", $P362
.annotate "line", 103
    find_lex $P363, "$/"
    unless_null $P363, vivify_194
    $P363 = root_new ['parrot';'Hash']
  vivify_194:
    set $P364, $P363["statementlist"]
    unless_null $P364, vivify_195
    new $P364, "Undef"
  vivify_195:
    $P365 = $P364."ast"()
    store_lex "$past", $P365
.annotate "line", 104
    get_global $P366, "@BLOCK"
    $P367 = $P366."shift"()
    store_lex "$BLOCK", $P367
.annotate "line", 105
    find_lex $P368, "$BLOCK"
    find_lex $P369, "$past"
    $P368."push"($P369)
.annotate "line", 106
    find_lex $P370, "$BLOCK"
    find_lex $P371, "$/"
    $P370."node"($P371)
.annotate "line", 107
    find_lex $P372, "$/"
    find_lex $P373, "$BLOCK"
    $P374 = $P372."!make"($P373)
.annotate "line", 102
    .return ($P374)
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("30_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_379
.annotate "line", 110
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$/", param_379
.annotate "line", 111
    get_global $P380, "@BLOCK"
    unless_null $P380, vivify_196
    $P380 = root_new ['parrot';'ResizablePMCArray']
    set_global "@BLOCK", $P380
  vivify_196:
.annotate "line", 110
    get_global $P381, "@BLOCK"
.annotate "line", 112
    get_global $P382, "@BLOCK"
    get_hll_global $P383, ["PAST"], "Block"
    get_hll_global $P384, ["PAST"], "Stmts"
    $P385 = $P384."new"()
    $P386 = $P383."new"($P385)
    $P387 = $P382."unshift"($P386)
.annotate "line", 110
    .return ($P387)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("31_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_392
.annotate "line", 117
    .const 'Sub' $P420 = "32_1267204714.47172" 
    capture_lex $P420
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(58)
    push_eh $P391
    .lex "self", self
    .lex "$/", param_392
.annotate "line", 118
    new $P393, "Undef"
    .lex "$count", $P393
.annotate "line", 119
    new $P394, "Undef"
    .lex "$past", $P394
.annotate "line", 118
    find_lex $P395, "$/"
    unless_null $P395, vivify_197
    $P395 = root_new ['parrot';'Hash']
  vivify_197:
    set $P396, $P395["xblock"]
    unless_null $P396, vivify_198
    new $P396, "Undef"
  vivify_198:
    set $N397, $P396
    new $P398, 'Float'
    set $P398, $N397
    sub $P399, $P398, 1
    store_lex "$count", $P399
.annotate "line", 119
    find_lex $P400, "$count"
    set $I401, $P400
    find_lex $P402, "$/"
    unless_null $P402, vivify_199
    $P402 = root_new ['parrot';'Hash']
  vivify_199:
    set $P403, $P402["xblock"]
    unless_null $P403, vivify_200
    $P403 = root_new ['parrot';'ResizablePMCArray']
  vivify_200:
    set $P404, $P403[$I401]
    unless_null $P404, vivify_201
    new $P404, "Undef"
  vivify_201:
    $P405 = $P404."ast"()
    $P406 = "xblock_immediate"($P405)
    store_lex "$past", $P406
.annotate "line", 120
    find_lex $P408, "$/"
    unless_null $P408, vivify_202
    $P408 = root_new ['parrot';'Hash']
  vivify_202:
    set $P409, $P408["else"]
    unless_null $P409, vivify_203
    new $P409, "Undef"
  vivify_203:
    unless $P409, if_407_end
.annotate "line", 121
    find_lex $P410, "$past"
    find_lex $P411, "$/"
    unless_null $P411, vivify_204
    $P411 = root_new ['parrot';'Hash']
  vivify_204:
    set $P412, $P411["else"]
    unless_null $P412, vivify_205
    $P412 = root_new ['parrot';'ResizablePMCArray']
  vivify_205:
    set $P413, $P412[0]
    unless_null $P413, vivify_206
    new $P413, "Undef"
  vivify_206:
    $P414 = $P413."ast"()
    $P415 = "block_immediate"($P414)
    $P410."push"($P415)
  if_407_end:
.annotate "line", 124
    new $P436, 'ExceptionHandler'
    set_addr $P436, loop435_handler
    $P436."handle_types"(65, 67, 66)
    push_eh $P436
  loop435_test:
    find_lex $P416, "$count"
    set $N417, $P416
    isgt $I418, $N417, 0.0
    unless $I418, loop435_done
  loop435_redo:
    .const 'Sub' $P420 = "32_1267204714.47172" 
    capture_lex $P420
    $P420()
  loop435_next:
    goto loop435_test
  loop435_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P437, exception, 'type'
    eq $P437, 65, loop435_next
    eq $P437, 67, loop435_redo
  loop435_done:
    pop_eh 
.annotate "line", 130
    find_lex $P438, "$/"
    find_lex $P439, "$past"
    $P440 = $P438."!make"($P439)
.annotate "line", 117
    .return ($P440)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P441, exception, "payload"
    .return ($P441)
.end


.namespace ["NQP";"Actions"]
.sub "_block419"  :anon :subid("32_1267204714.47172") :outer("31_1267204714.47172")
.annotate "line", 126
    new $P421, "Undef"
    .lex "$else", $P421
.annotate "line", 124
    find_lex $P422, "$count"
    clone $P423, $P422
    dec $P422
.annotate "line", 126
    find_lex $P424, "$past"
    store_lex "$else", $P424
.annotate "line", 127
    find_lex $P425, "$count"
    set $I426, $P425
    find_lex $P427, "$/"
    unless_null $P427, vivify_207
    $P427 = root_new ['parrot';'Hash']
  vivify_207:
    set $P428, $P427["xblock"]
    unless_null $P428, vivify_208
    $P428 = root_new ['parrot';'ResizablePMCArray']
  vivify_208:
    set $P429, $P428[$I426]
    unless_null $P429, vivify_209
    new $P429, "Undef"
  vivify_209:
    $P430 = $P429."ast"()
    $P431 = "xblock_immediate"($P430)
    store_lex "$past", $P431
.annotate "line", 128
    find_lex $P432, "$past"
    find_lex $P433, "$else"
    $P434 = $P432."push"($P433)
.annotate "line", 124
    .return ($P434)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("33_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_445
.annotate "line", 133
    new $P444, 'ExceptionHandler'
    set_addr $P444, control_443
    $P444."handle_types"(58)
    push_eh $P444
    .lex "self", self
    .lex "$/", param_445
.annotate "line", 134
    new $P446, "Undef"
    .lex "$past", $P446
    find_lex $P447, "$/"
    unless_null $P447, vivify_210
    $P447 = root_new ['parrot';'Hash']
  vivify_210:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_211
    new $P448, "Undef"
  vivify_211:
    $P449 = $P448."ast"()
    $P450 = "xblock_immediate"($P449)
    store_lex "$past", $P450
.annotate "line", 135
    find_lex $P451, "$past"
    $P451."pasttype"("unless")
.annotate "line", 136
    find_lex $P452, "$/"
    find_lex $P453, "$past"
    $P454 = $P452."!make"($P453)
.annotate "line", 133
    .return ($P454)
  control_443:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P455, exception, "payload"
    .return ($P455)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("34_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_459
.annotate "line", 139
    new $P458, 'ExceptionHandler'
    set_addr $P458, control_457
    $P458."handle_types"(58)
    push_eh $P458
    .lex "self", self
    .lex "$/", param_459
.annotate "line", 140
    new $P460, "Undef"
    .lex "$past", $P460
    find_lex $P461, "$/"
    unless_null $P461, vivify_212
    $P461 = root_new ['parrot';'Hash']
  vivify_212:
    set $P462, $P461["xblock"]
    unless_null $P462, vivify_213
    new $P462, "Undef"
  vivify_213:
    $P463 = $P462."ast"()
    $P464 = "xblock_immediate"($P463)
    store_lex "$past", $P464
.annotate "line", 141
    find_lex $P465, "$past"
    find_lex $P466, "$/"
    unless_null $P466, vivify_214
    $P466 = root_new ['parrot';'Hash']
  vivify_214:
    set $P467, $P466["sym"]
    unless_null $P467, vivify_215
    new $P467, "Undef"
  vivify_215:
    set $S468, $P467
    $P465."pasttype"($S468)
.annotate "line", 142
    find_lex $P469, "$/"
    find_lex $P470, "$past"
    $P471 = $P469."!make"($P470)
.annotate "line", 139
    .return ($P471)
  control_457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("35_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_476
.annotate "line", 145
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(58)
    push_eh $P475
    .lex "self", self
    .lex "$/", param_476
.annotate "line", 146
    new $P477, "Undef"
    .lex "$pasttype", $P477
.annotate "line", 147
    new $P478, "Undef"
    .lex "$past", $P478
.annotate "line", 146
    new $P479, "String"
    assign $P479, "repeat_"
    find_lex $P480, "$/"
    unless_null $P480, vivify_216
    $P480 = root_new ['parrot';'Hash']
  vivify_216:
    set $P481, $P480["wu"]
    unless_null $P481, vivify_217
    new $P481, "Undef"
  vivify_217:
    set $S482, $P481
    concat $P483, $P479, $S482
    store_lex "$pasttype", $P483
    find_lex $P484, "$past"
.annotate "line", 148
    find_lex $P486, "$/"
    unless_null $P486, vivify_218
    $P486 = root_new ['parrot';'Hash']
  vivify_218:
    set $P487, $P486["xblock"]
    unless_null $P487, vivify_219
    new $P487, "Undef"
  vivify_219:
    if $P487, if_485
.annotate "line", 153
    get_hll_global $P494, ["PAST"], "Op"
    find_lex $P495, "$/"
    unless_null $P495, vivify_220
    $P495 = root_new ['parrot';'Hash']
  vivify_220:
    set $P496, $P495["EXPR"]
    unless_null $P496, vivify_221
    new $P496, "Undef"
  vivify_221:
    $P497 = $P496."ast"()
    find_lex $P498, "$/"
    unless_null $P498, vivify_222
    $P498 = root_new ['parrot';'Hash']
  vivify_222:
    set $P499, $P498["pblock"]
    unless_null $P499, vivify_223
    new $P499, "Undef"
  vivify_223:
    $P500 = $P499."ast"()
    $P501 = "block_immediate"($P500)
    find_lex $P502, "$pasttype"
    find_lex $P503, "$/"
    $P504 = $P494."new"($P497, $P501, $P502 :named("pasttype"), $P503 :named("node"))
    store_lex "$past", $P504
.annotate "line", 152
    goto if_485_end
  if_485:
.annotate "line", 149
    find_lex $P488, "$/"
    unless_null $P488, vivify_224
    $P488 = root_new ['parrot';'Hash']
  vivify_224:
    set $P489, $P488["xblock"]
    unless_null $P489, vivify_225
    new $P489, "Undef"
  vivify_225:
    $P490 = $P489."ast"()
    $P491 = "xblock_immediate"($P490)
    store_lex "$past", $P491
.annotate "line", 150
    find_lex $P492, "$past"
    find_lex $P493, "$pasttype"
    $P492."pasttype"($P493)
  if_485_end:
.annotate "line", 156
    find_lex $P505, "$/"
    find_lex $P506, "$past"
    $P507 = $P505."!make"($P506)
.annotate "line", 145
    .return ($P507)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P508, exception, "payload"
    .return ($P508)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("36_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_512
.annotate "line", 159
    new $P511, 'ExceptionHandler'
    set_addr $P511, control_510
    $P511."handle_types"(58)
    push_eh $P511
    .lex "self", self
    .lex "$/", param_512
.annotate "line", 160
    new $P513, "Undef"
    .lex "$past", $P513
.annotate "line", 162
    new $P514, "Undef"
    .lex "$block", $P514
.annotate "line", 160
    find_lex $P515, "$/"
    unless_null $P515, vivify_226
    $P515 = root_new ['parrot';'Hash']
  vivify_226:
    set $P516, $P515["xblock"]
    unless_null $P516, vivify_227
    new $P516, "Undef"
  vivify_227:
    $P517 = $P516."ast"()
    store_lex "$past", $P517
.annotate "line", 161
    find_lex $P518, "$past"
    $P518."pasttype"("for")
.annotate "line", 162
    find_lex $P519, "$past"
    unless_null $P519, vivify_228
    $P519 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P520, $P519[1]
    unless_null $P520, vivify_229
    new $P520, "Undef"
  vivify_229:
    store_lex "$block", $P520
.annotate "line", 163
    find_lex $P522, "$block"
    $P523 = $P522."arity"()
    if $P523, unless_521_end
.annotate "line", 164
    find_lex $P524, "$block"
    unless_null $P524, vivify_230
    $P524 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P525, $P524[0]
    unless_null $P525, vivify_231
    new $P525, "Undef"
  vivify_231:
    get_hll_global $P526, ["PAST"], "Var"
    $P527 = $P526."new"("$_" :named("name"), "parameter" :named("scope"))
    $P525."push"($P527)
.annotate "line", 165
    find_lex $P528, "$block"
    $P528."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 166
    find_lex $P529, "$block"
    $P529."arity"(1)
  unless_521_end:
.annotate "line", 168
    find_lex $P530, "$block"
    $P530."blocktype"("immediate")
.annotate "line", 169
    find_lex $P531, "$/"
    find_lex $P532, "$past"
    $P533 = $P531."!make"($P532)
.annotate "line", 159
    .return ($P533)
  control_510:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P534, exception, "payload"
    .return ($P534)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("37_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_538
.annotate "line", 172
    new $P537, 'ExceptionHandler'
    set_addr $P537, control_536
    $P537."handle_types"(58)
    push_eh $P537
    .lex "self", self
    .lex "$/", param_538
.annotate "line", 173
    find_lex $P539, "$/"
    get_hll_global $P540, ["PAST"], "Op"
    find_lex $P541, "$/"
    unless_null $P541, vivify_232
    $P541 = root_new ['parrot';'Hash']
  vivify_232:
    set $P542, $P541["EXPR"]
    unless_null $P542, vivify_233
    new $P542, "Undef"
  vivify_233:
    $P543 = $P542."ast"()
    find_lex $P544, "$/"
    $P545 = $P540."new"($P543, "return" :named("pasttype"), $P544 :named("node"))
    $P546 = $P539."!make"($P545)
.annotate "line", 172
    .return ($P546)
  control_536:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P547, exception, "payload"
    .return ($P547)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("38_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_551
.annotate "line", 176
    new $P550, 'ExceptionHandler'
    set_addr $P550, control_549
    $P550."handle_types"(58)
    push_eh $P550
    .lex "self", self
    .lex "$/", param_551
.annotate "line", 177
    new $P552, "Undef"
    .lex "$block", $P552
    find_lex $P553, "$/"
    unless_null $P553, vivify_234
    $P553 = root_new ['parrot';'Hash']
  vivify_234:
    set $P554, $P553["block"]
    unless_null $P554, vivify_235
    new $P554, "Undef"
  vivify_235:
    $P555 = $P554."ast"()
    store_lex "$block", $P555
.annotate "line", 178
    find_lex $P556, "$/"
    find_lex $P557, "$block"
    "push_block_handler"($P556, $P557)
.annotate "line", 179
    get_global $P558, "@BLOCK"
    unless_null $P558, vivify_236
    $P558 = root_new ['parrot';'ResizablePMCArray']
  vivify_236:
    set $P559, $P558[0]
    unless_null $P559, vivify_237
    new $P559, "Undef"
  vivify_237:
    $P560 = $P559."handlers"()
    set $P561, $P560[0]
    unless_null $P561, vivify_238
    new $P561, "Undef"
  vivify_238:
    $P561."handle_types_except"("CONTROL")
.annotate "line", 180
    find_lex $P562, "$/"
    get_hll_global $P563, ["PAST"], "Stmts"
    find_lex $P564, "$/"
    $P565 = $P563."new"($P564 :named("node"))
    $P566 = $P562."!make"($P565)
.annotate "line", 176
    .return ($P566)
  control_549:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P567, exception, "payload"
    .return ($P567)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("39_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_571
.annotate "line", 183
    new $P570, 'ExceptionHandler'
    set_addr $P570, control_569
    $P570."handle_types"(58)
    push_eh $P570
    .lex "self", self
    .lex "$/", param_571
.annotate "line", 184
    new $P572, "Undef"
    .lex "$block", $P572
    find_lex $P573, "$/"
    unless_null $P573, vivify_239
    $P573 = root_new ['parrot';'Hash']
  vivify_239:
    set $P574, $P573["block"]
    unless_null $P574, vivify_240
    new $P574, "Undef"
  vivify_240:
    $P575 = $P574."ast"()
    store_lex "$block", $P575
.annotate "line", 185
    find_lex $P576, "$/"
    find_lex $P577, "$block"
    "push_block_handler"($P576, $P577)
.annotate "line", 186
    get_global $P578, "@BLOCK"
    unless_null $P578, vivify_241
    $P578 = root_new ['parrot';'ResizablePMCArray']
  vivify_241:
    set $P579, $P578[0]
    unless_null $P579, vivify_242
    new $P579, "Undef"
  vivify_242:
    $P580 = $P579."handlers"()
    set $P581, $P580[0]
    unless_null $P581, vivify_243
    new $P581, "Undef"
  vivify_243:
    $P581."handle_types"("CONTROL")
.annotate "line", 187
    find_lex $P582, "$/"
    get_hll_global $P583, ["PAST"], "Stmts"
    find_lex $P584, "$/"
    $P585 = $P583."new"($P584 :named("node"))
    $P586 = $P582."!make"($P585)
.annotate "line", 183
    .return ($P586)
  control_569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P587, exception, "payload"
    .return ($P587)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("40_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_592
.annotate "line", 227
    new $P591, 'ExceptionHandler'
    set_addr $P591, control_590
    $P591."handle_types"(58)
    push_eh $P591
    .lex "self", self
    .lex "$/", param_592
.annotate "line", 228
    get_global $P593, "@BLOCK"
    unless_null $P593, vivify_244
    $P593 = root_new ['parrot';'ResizablePMCArray']
  vivify_244:
    set $P594, $P593[0]
    unless_null $P594, vivify_245
    new $P594, "Undef"
  vivify_245:
    $P595 = $P594."loadinit"()
    find_lex $P596, "$/"
    unless_null $P596, vivify_246
    $P596 = root_new ['parrot';'Hash']
  vivify_246:
    set $P597, $P596["blorst"]
    unless_null $P597, vivify_247
    new $P597, "Undef"
  vivify_247:
    $P598 = $P597."ast"()
    $P595."push"($P598)
.annotate "line", 229
    find_lex $P599, "$/"
    get_hll_global $P600, ["PAST"], "Stmts"
    find_lex $P601, "$/"
    $P602 = $P600."new"($P601 :named("node"))
    $P603 = $P599."!make"($P602)
.annotate "line", 227
    .return ($P603)
  control_590:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P604, exception, "payload"
    .return ($P604)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("41_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_608
.annotate "line", 232
    new $P607, 'ExceptionHandler'
    set_addr $P607, control_606
    $P607."handle_types"(58)
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate "line", 233
    new $P609, "Undef"
    .lex "$past", $P609
    find_lex $P610, "$/"
    unless_null $P610, vivify_248
    $P610 = root_new ['parrot';'Hash']
  vivify_248:
    set $P611, $P610["blorst"]
    unless_null $P611, vivify_249
    new $P611, "Undef"
  vivify_249:
    $P612 = $P611."ast"()
    store_lex "$past", $P612
.annotate "line", 234
    find_lex $P614, "$past"
    $S615 = $P614."WHAT"()
    isne $I616, $S615, "PAST::Block()"
    unless $I616, if_613_end
.annotate "line", 235
    get_hll_global $P617, ["PAST"], "Block"
    find_lex $P618, "$past"
    find_lex $P619, "$/"
    $P620 = $P617."new"($P618, "immediate" :named("blocktype"), $P619 :named("node"))
    store_lex "$past", $P620
  if_613_end:
.annotate "line", 237
    find_lex $P622, "$past"
    $P623 = $P622."handlers"()
    if $P623, unless_621_end
.annotate "line", 238
    find_lex $P624, "$past"
    get_hll_global $P625, ["PAST"], "Control"
.annotate "line", 240
    get_hll_global $P626, ["PAST"], "Stmts"
.annotate "line", 241
    get_hll_global $P627, ["PAST"], "Op"
.annotate "line", 242
    get_hll_global $P628, ["PAST"], "Var"
.annotate "line", 243
    get_hll_global $P629, ["PAST"], "Var"
    $P630 = $P629."new"("register" :named("scope"), "exception" :named("name"))
    $P631 = $P628."new"($P630, "handled", "keyed" :named("scope"))
.annotate "line", 242
    $P632 = $P627."new"($P631, 1, "bind" :named("pasttype"))
.annotate "line", 241
    $P633 = $P626."new"($P632)
.annotate "line", 240
    $P634 = $P625."new"($P633, "CONTROL" :named("handle_types_except"))
.annotate "line", 238
    new $P635, "ResizablePMCArray"
    push $P635, $P634
    $P624."handlers"($P635)
  unless_621_end:
.annotate "line", 252
    find_lex $P636, "$/"
    find_lex $P637, "$past"
    $P638 = $P636."!make"($P637)
.annotate "line", 232
    .return ($P638)
  control_606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P639, exception, "payload"
    .return ($P639)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("42_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_643
.annotate "line", 255
    new $P642, 'ExceptionHandler'
    set_addr $P642, control_641
    $P642."handle_types"(58)
    push_eh $P642
    .lex "self", self
    .lex "$/", param_643
.annotate "line", 256
    find_lex $P644, "$/"
.annotate "line", 257
    find_lex $P647, "$/"
    unless_null $P647, vivify_250
    $P647 = root_new ['parrot';'Hash']
  vivify_250:
    set $P648, $P647["block"]
    unless_null $P648, vivify_251
    new $P648, "Undef"
  vivify_251:
    if $P648, if_646
.annotate "line", 258
    find_lex $P653, "$/"
    unless_null $P653, vivify_252
    $P653 = root_new ['parrot';'Hash']
  vivify_252:
    set $P654, $P653["statement"]
    unless_null $P654, vivify_253
    new $P654, "Undef"
  vivify_253:
    $P655 = $P654."ast"()
    set $P645, $P655
.annotate "line", 257
    goto if_646_end
  if_646:
    find_lex $P649, "$/"
    unless_null $P649, vivify_254
    $P649 = root_new ['parrot';'Hash']
  vivify_254:
    set $P650, $P649["block"]
    unless_null $P650, vivify_255
    new $P650, "Undef"
  vivify_255:
    $P651 = $P650."ast"()
    $P652 = "block_immediate"($P651)
    set $P645, $P652
  if_646_end:
    $P656 = $P644."!make"($P645)
.annotate "line", 255
    .return ($P656)
  control_641:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P657, exception, "payload"
    .return ($P657)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("43_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_661
.annotate "line", 263
    new $P660, 'ExceptionHandler'
    set_addr $P660, control_659
    $P660."handle_types"(58)
    push_eh $P660
    .lex "self", self
    .lex "$/", param_661
    find_lex $P662, "$/"
    find_lex $P663, "$/"
    unless_null $P663, vivify_256
    $P663 = root_new ['parrot';'Hash']
  vivify_256:
    set $P664, $P663["cond"]
    unless_null $P664, vivify_257
    new $P664, "Undef"
  vivify_257:
    $P665 = $P664."ast"()
    $P666 = $P662."!make"($P665)
    .return ($P666)
  control_659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P667, exception, "payload"
    .return ($P667)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("44_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_671
.annotate "line", 264
    new $P670, 'ExceptionHandler'
    set_addr $P670, control_669
    $P670."handle_types"(58)
    push_eh $P670
    .lex "self", self
    .lex "$/", param_671
    find_lex $P672, "$/"
    find_lex $P673, "$/"
    unless_null $P673, vivify_258
    $P673 = root_new ['parrot';'Hash']
  vivify_258:
    set $P674, $P673["cond"]
    unless_null $P674, vivify_259
    new $P674, "Undef"
  vivify_259:
    $P675 = $P674."ast"()
    $P676 = $P672."!make"($P675)
    .return ($P676)
  control_669:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P677, exception, "payload"
    .return ($P677)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("45_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_681
.annotate "line", 266
    new $P680, 'ExceptionHandler'
    set_addr $P680, control_679
    $P680."handle_types"(58)
    push_eh $P680
    .lex "self", self
    .lex "$/", param_681
    find_lex $P682, "$/"
    find_lex $P683, "$/"
    unless_null $P683, vivify_260
    $P683 = root_new ['parrot';'Hash']
  vivify_260:
    set $P684, $P683["cond"]
    unless_null $P684, vivify_261
    new $P684, "Undef"
  vivify_261:
    $P685 = $P684."ast"()
    $P686 = $P682."!make"($P685)
    .return ($P686)
  control_679:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P687, exception, "payload"
    .return ($P687)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("46_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_691
.annotate "line", 267
    new $P690, 'ExceptionHandler'
    set_addr $P690, control_689
    $P690."handle_types"(58)
    push_eh $P690
    .lex "self", self
    .lex "$/", param_691
    find_lex $P692, "$/"
    find_lex $P693, "$/"
    unless_null $P693, vivify_262
    $P693 = root_new ['parrot';'Hash']
  vivify_262:
    set $P694, $P693["cond"]
    unless_null $P694, vivify_263
    new $P694, "Undef"
  vivify_263:
    $P695 = $P694."ast"()
    $P696 = $P692."!make"($P695)
    .return ($P696)
  control_689:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P697, exception, "payload"
    .return ($P697)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<fatarrow>"  :subid("47_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_701
.annotate "line", 271
    new $P700, 'ExceptionHandler'
    set_addr $P700, control_699
    $P700."handle_types"(58)
    push_eh $P700
    .lex "self", self
    .lex "$/", param_701
    find_lex $P702, "$/"
    find_lex $P703, "$/"
    unless_null $P703, vivify_264
    $P703 = root_new ['parrot';'Hash']
  vivify_264:
    set $P704, $P703["fatarrow"]
    unless_null $P704, vivify_265
    new $P704, "Undef"
  vivify_265:
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
.sub "term:sym<colonpair>"  :subid("48_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_711
.annotate "line", 272
    new $P710, 'ExceptionHandler'
    set_addr $P710, control_709
    $P710."handle_types"(58)
    push_eh $P710
    .lex "self", self
    .lex "$/", param_711
    find_lex $P712, "$/"
    find_lex $P713, "$/"
    unless_null $P713, vivify_266
    $P713 = root_new ['parrot';'Hash']
  vivify_266:
    set $P714, $P713["colonpair"]
    unless_null $P714, vivify_267
    new $P714, "Undef"
  vivify_267:
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
.sub "term:sym<variable>"  :subid("49_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_721
.annotate "line", 273
    new $P720, 'ExceptionHandler'
    set_addr $P720, control_719
    $P720."handle_types"(58)
    push_eh $P720
    .lex "self", self
    .lex "$/", param_721
    find_lex $P722, "$/"
    find_lex $P723, "$/"
    unless_null $P723, vivify_268
    $P723 = root_new ['parrot';'Hash']
  vivify_268:
    set $P724, $P723["variable"]
    unless_null $P724, vivify_269
    new $P724, "Undef"
  vivify_269:
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
.sub "term:sym<package_declarator>"  :subid("50_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_731
.annotate "line", 274
    new $P730, 'ExceptionHandler'
    set_addr $P730, control_729
    $P730."handle_types"(58)
    push_eh $P730
    .lex "self", self
    .lex "$/", param_731
    find_lex $P732, "$/"
    find_lex $P733, "$/"
    unless_null $P733, vivify_270
    $P733 = root_new ['parrot';'Hash']
  vivify_270:
    set $P734, $P733["package_declarator"]
    unless_null $P734, vivify_271
    new $P734, "Undef"
  vivify_271:
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
.sub "term:sym<scope_declarator>"  :subid("51_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_741
.annotate "line", 275
    new $P740, 'ExceptionHandler'
    set_addr $P740, control_739
    $P740."handle_types"(58)
    push_eh $P740
    .lex "self", self
    .lex "$/", param_741
    find_lex $P742, "$/"
    find_lex $P743, "$/"
    unless_null $P743, vivify_272
    $P743 = root_new ['parrot';'Hash']
  vivify_272:
    set $P744, $P743["scope_declarator"]
    unless_null $P744, vivify_273
    new $P744, "Undef"
  vivify_273:
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
.sub "term:sym<routine_declarator>"  :subid("52_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_751
.annotate "line", 276
    new $P750, 'ExceptionHandler'
    set_addr $P750, control_749
    $P750."handle_types"(58)
    push_eh $P750
    .lex "self", self
    .lex "$/", param_751
    find_lex $P752, "$/"
    find_lex $P753, "$/"
    unless_null $P753, vivify_274
    $P753 = root_new ['parrot';'Hash']
  vivify_274:
    set $P754, $P753["routine_declarator"]
    unless_null $P754, vivify_275
    new $P754, "Undef"
  vivify_275:
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
.sub "term:sym<regex_declarator>"  :subid("53_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_761
.annotate "line", 277
    new $P760, 'ExceptionHandler'
    set_addr $P760, control_759
    $P760."handle_types"(58)
    push_eh $P760
    .lex "self", self
    .lex "$/", param_761
    find_lex $P762, "$/"
    find_lex $P763, "$/"
    unless_null $P763, vivify_276
    $P763 = root_new ['parrot';'Hash']
  vivify_276:
    set $P764, $P763["regex_declarator"]
    unless_null $P764, vivify_277
    new $P764, "Undef"
  vivify_277:
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
.sub "term:sym<statement_prefix>"  :subid("54_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_771
.annotate "line", 278
    new $P770, 'ExceptionHandler'
    set_addr $P770, control_769
    $P770."handle_types"(58)
    push_eh $P770
    .lex "self", self
    .lex "$/", param_771
    find_lex $P772, "$/"
    find_lex $P773, "$/"
    unless_null $P773, vivify_278
    $P773 = root_new ['parrot';'Hash']
  vivify_278:
    set $P774, $P773["statement_prefix"]
    unless_null $P774, vivify_279
    new $P774, "Undef"
  vivify_279:
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
.sub "term:sym<lambda>"  :subid("55_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_781
.annotate "line", 279
    new $P780, 'ExceptionHandler'
    set_addr $P780, control_779
    $P780."handle_types"(58)
    push_eh $P780
    .lex "self", self
    .lex "$/", param_781
    find_lex $P782, "$/"
    find_lex $P783, "$/"
    unless_null $P783, vivify_280
    $P783 = root_new ['parrot';'Hash']
  vivify_280:
    set $P784, $P783["pblock"]
    unless_null $P784, vivify_281
    new $P784, "Undef"
  vivify_281:
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
.sub "fatarrow"  :subid("56_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_791
.annotate "line", 281
    new $P790, 'ExceptionHandler'
    set_addr $P790, control_789
    $P790."handle_types"(58)
    push_eh $P790
    .lex "self", self
    .lex "$/", param_791
.annotate "line", 282
    new $P792, "Undef"
    .lex "$past", $P792
    find_lex $P793, "$/"
    unless_null $P793, vivify_282
    $P793 = root_new ['parrot';'Hash']
  vivify_282:
    set $P794, $P793["val"]
    unless_null $P794, vivify_283
    new $P794, "Undef"
  vivify_283:
    $P795 = $P794."ast"()
    store_lex "$past", $P795
.annotate "line", 283
    find_lex $P796, "$past"
    find_lex $P797, "$/"
    unless_null $P797, vivify_284
    $P797 = root_new ['parrot';'Hash']
  vivify_284:
    set $P798, $P797["key"]
    unless_null $P798, vivify_285
    new $P798, "Undef"
  vivify_285:
    $P799 = $P798."Str"()
    $P796."named"($P799)
.annotate "line", 284
    find_lex $P800, "$/"
    find_lex $P801, "$past"
    $P802 = $P800."!make"($P801)
.annotate "line", 281
    .return ($P802)
  control_789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P803, exception, "payload"
    .return ($P803)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("57_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_807
.annotate "line", 287
    new $P806, 'ExceptionHandler'
    set_addr $P806, control_805
    $P806."handle_types"(58)
    push_eh $P806
    .lex "self", self
    .lex "$/", param_807
.annotate "line", 288
    new $P808, "Undef"
    .lex "$past", $P808
.annotate "line", 289
    find_lex $P811, "$/"
    unless_null $P811, vivify_286
    $P811 = root_new ['parrot';'Hash']
  vivify_286:
    set $P812, $P811["circumfix"]
    unless_null $P812, vivify_287
    new $P812, "Undef"
  vivify_287:
    if $P812, if_810
.annotate "line", 290
    get_hll_global $P817, ["PAST"], "Val"
    find_lex $P818, "$/"
    unless_null $P818, vivify_288
    $P818 = root_new ['parrot';'Hash']
  vivify_288:
    set $P819, $P818["not"]
    unless_null $P819, vivify_289
    new $P819, "Undef"
  vivify_289:
    isfalse $I820, $P819
    $P821 = $P817."new"($I820 :named("value"))
    set $P809, $P821
.annotate "line", 289
    goto if_810_end
  if_810:
    find_lex $P813, "$/"
    unless_null $P813, vivify_290
    $P813 = root_new ['parrot';'Hash']
  vivify_290:
    set $P814, $P813["circumfix"]
    unless_null $P814, vivify_291
    $P814 = root_new ['parrot';'ResizablePMCArray']
  vivify_291:
    set $P815, $P814[0]
    unless_null $P815, vivify_292
    new $P815, "Undef"
  vivify_292:
    $P816 = $P815."ast"()
    set $P809, $P816
  if_810_end:
    store_lex "$past", $P809
.annotate "line", 291
    find_lex $P822, "$past"
    find_lex $P823, "$/"
    unless_null $P823, vivify_293
    $P823 = root_new ['parrot';'Hash']
  vivify_293:
    set $P824, $P823["identifier"]
    unless_null $P824, vivify_294
    new $P824, "Undef"
  vivify_294:
    set $S825, $P824
    $P822."named"($S825)
.annotate "line", 292
    find_lex $P826, "$/"
    find_lex $P827, "$past"
    $P828 = $P826."!make"($P827)
.annotate "line", 287
    .return ($P828)
  control_805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P829, exception, "payload"
    .return ($P829)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("58_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_833
.annotate "line", 295
    .const 'Sub' $P846 = "59_1267204714.47172" 
    capture_lex $P846
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(58)
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
.annotate "line", 296
    new $P834, "Undef"
    .lex "$past", $P834
.annotate "line", 295
    find_lex $P835, "$past"
.annotate "line", 297
    find_lex $P837, "$/"
    unless_null $P837, vivify_295
    $P837 = root_new ['parrot';'Hash']
  vivify_295:
    set $P838, $P837["postcircumfix"]
    unless_null $P838, vivify_296
    new $P838, "Undef"
  vivify_296:
    if $P838, if_836
.annotate "line", 301
    .const 'Sub' $P846 = "59_1267204714.47172" 
    capture_lex $P846
    $P846()
    goto if_836_end
  if_836:
.annotate "line", 298
    find_lex $P839, "$/"
    unless_null $P839, vivify_313
    $P839 = root_new ['parrot';'Hash']
  vivify_313:
    set $P840, $P839["postcircumfix"]
    unless_null $P840, vivify_314
    new $P840, "Undef"
  vivify_314:
    $P841 = $P840."ast"()
    store_lex "$past", $P841
.annotate "line", 299
    find_lex $P842, "$past"
    get_hll_global $P843, ["PAST"], "Var"
    $P844 = $P843."new"("$/" :named("name"))
    $P842."unshift"($P844)
  if_836_end:
.annotate "line", 330
    find_lex $P915, "$/"
    find_lex $P916, "$past"
    $P917 = $P915."!make"($P916)
.annotate "line", 295
    .return ($P917)
  control_831:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P918, exception, "payload"
    .return ($P918)
.end


.namespace ["NQP";"Actions"]
.sub "_block845"  :anon :subid("59_1267204714.47172") :outer("58_1267204714.47172")
.annotate "line", 302
    $P847 = root_new ['parrot';'ResizablePMCArray']
    .lex "@name", $P847
    get_hll_global $P848, ["NQP"], "Compiler"
    find_lex $P849, "$/"
    set $S850, $P849
    $P851 = $P848."parse_name"($S850)
    store_lex "@name", $P851
.annotate "line", 303
    get_hll_global $P852, ["PAST"], "Var"
    find_lex $P853, "@name"
    $P854 = $P853."pop"()
    set $S855, $P854
    $P856 = $P852."new"($S855 :named("name"))
    store_lex "$past", $P856
.annotate "line", 304
    find_lex $P858, "@name"
    unless $P858, if_857_end
.annotate "line", 305
    find_lex $P860, "@name"
    unless_null $P860, vivify_297
    $P860 = root_new ['parrot';'ResizablePMCArray']
  vivify_297:
    set $P861, $P860[0]
    unless_null $P861, vivify_298
    new $P861, "Undef"
  vivify_298:
    set $S862, $P861
    iseq $I863, $S862, "GLOBAL"
    unless $I863, if_859_end
    find_lex $P864, "@name"
    $P864."shift"()
  if_859_end:
.annotate "line", 306
    find_lex $P865, "$past"
    find_lex $P866, "@name"
    $P865."namespace"($P866)
.annotate "line", 307
    find_lex $P867, "$past"
    $P867."scope"("package")
.annotate "line", 308
    find_lex $P868, "$past"
    find_lex $P869, "$/"
    unless_null $P869, vivify_299
    $P869 = root_new ['parrot';'Hash']
  vivify_299:
    set $P870, $P869["sigil"]
    unless_null $P870, vivify_300
    new $P870, "Undef"
  vivify_300:
    $P871 = "vivitype"($P870)
    $P868."viviself"($P871)
.annotate "line", 309
    find_lex $P872, "$past"
    $P872."lvalue"(1)
  if_857_end:
.annotate "line", 311
    find_lex $P875, "$/"
    unless_null $P875, vivify_301
    $P875 = root_new ['parrot';'Hash']
  vivify_301:
    set $P876, $P875["twigil"]
    unless_null $P876, vivify_302
    $P876 = root_new ['parrot';'ResizablePMCArray']
  vivify_302:
    set $P877, $P876[0]
    unless_null $P877, vivify_303
    new $P877, "Undef"
  vivify_303:
    set $S878, $P877
    iseq $I879, $S878, "*"
    if $I879, if_874
.annotate "line", 324
    find_lex $P901, "$/"
    unless_null $P901, vivify_304
    $P901 = root_new ['parrot';'Hash']
  vivify_304:
    set $P902, $P901["twigil"]
    unless_null $P902, vivify_305
    $P902 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P903, $P902[0]
    unless_null $P903, vivify_306
    new $P903, "Undef"
  vivify_306:
    set $S904, $P903
    iseq $I905, $S904, "!"
    if $I905, if_900
    new $P899, 'Integer'
    set $P899, $I905
    goto if_900_end
  if_900:
.annotate "line", 325
    find_lex $P906, "$past"
    get_hll_global $P907, ["PAST"], "Var"
    $P908 = $P907."new"("self" :named("name"))
    $P906."push"($P908)
.annotate "line", 326
    find_lex $P909, "$past"
    $P909."scope"("attribute")
.annotate "line", 327
    find_lex $P910, "$past"
    find_lex $P911, "$/"
    unless_null $P911, vivify_307
    $P911 = root_new ['parrot';'Hash']
  vivify_307:
    set $P912, $P911["sigil"]
    unless_null $P912, vivify_308
    new $P912, "Undef"
  vivify_308:
    $P913 = "vivitype"($P912)
    $P914 = $P910."viviself"($P913)
.annotate "line", 324
    set $P899, $P914
  if_900_end:
    set $P873, $P899
.annotate "line", 311
    goto if_874_end
  if_874:
.annotate "line", 312
    find_lex $P880, "$past"
    $P880."scope"("contextual")
.annotate "line", 313
    find_lex $P881, "$past"
.annotate "line", 314
    get_hll_global $P882, ["PAST"], "Var"
.annotate "line", 316
    find_lex $P883, "$/"
    unless_null $P883, vivify_309
    $P883 = root_new ['parrot';'Hash']
  vivify_309:
    set $P884, $P883["sigil"]
    unless_null $P884, vivify_310
    new $P884, "Undef"
  vivify_310:
    set $S885, $P884
    new $P886, 'String'
    set $P886, $S885
    find_lex $P887, "$/"
    unless_null $P887, vivify_311
    $P887 = root_new ['parrot';'Hash']
  vivify_311:
    set $P888, $P887["desigilname"]
    unless_null $P888, vivify_312
    new $P888, "Undef"
  vivify_312:
    concat $P889, $P886, $P888
.annotate "line", 318
    get_hll_global $P890, ["PAST"], "Op"
    new $P891, "String"
    assign $P891, "Contextual "
    find_lex $P892, "$/"
    set $S893, $P892
    concat $P894, $P891, $S893
    concat $P895, $P894, " not found"
    $P896 = $P890."new"($P895, "die" :named("pirop"))
    $P897 = $P882."new"("package" :named("scope"), "" :named("namespace"), $P889 :named("name"), $P896 :named("viviself"))
.annotate "line", 314
    $P898 = $P881."viviself"($P897)
.annotate "line", 311
    set $P873, $P898
  if_874_end:
.annotate "line", 301
    .return ($P873)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("60_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_922
.annotate "line", 333
    new $P921, 'ExceptionHandler'
    set_addr $P921, control_920
    $P921."handle_types"(58)
    push_eh $P921
    .lex "self", self
    .lex "$/", param_922
    find_lex $P923, "$/"
    find_lex $P924, "$/"
    unless_null $P924, vivify_315
    $P924 = root_new ['parrot';'Hash']
  vivify_315:
    set $P925, $P924["package_def"]
    unless_null $P925, vivify_316
    new $P925, "Undef"
  vivify_316:
    $P926 = $P925."ast"()
    $P927 = $P923."!make"($P926)
    .return ($P927)
  control_920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P928, exception, "payload"
    .return ($P928)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("61_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_932
.annotate "line", 334
    new $P931, 'ExceptionHandler'
    set_addr $P931, control_930
    $P931."handle_types"(58)
    push_eh $P931
    .lex "self", self
    .lex "$/", param_932
.annotate "line", 335
    new $P933, "Undef"
    .lex "$past", $P933
.annotate "line", 336
    new $P934, "Undef"
    .lex "$classinit", $P934
.annotate "line", 345
    new $P935, "Undef"
    .lex "$parent", $P935
.annotate "line", 335
    find_lex $P936, "$/"
    unless_null $P936, vivify_317
    $P936 = root_new ['parrot';'Hash']
  vivify_317:
    set $P937, $P936["package_def"]
    unless_null $P937, vivify_318
    new $P937, "Undef"
  vivify_318:
    $P938 = $P937."ast"()
    store_lex "$past", $P938
.annotate "line", 337
    get_hll_global $P939, ["PAST"], "Op"
.annotate "line", 338
    get_hll_global $P940, ["PAST"], "Op"
    $P941 = $P940."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 341
    find_lex $P942, "$/"
    unless_null $P942, vivify_319
    $P942 = root_new ['parrot';'Hash']
  vivify_319:
    set $P943, $P942["package_def"]
    unless_null $P943, vivify_320
    $P943 = root_new ['parrot';'Hash']
  vivify_320:
    set $P944, $P943["name"]
    unless_null $P944, vivify_321
    new $P944, "Undef"
  vivify_321:
    set $S945, $P944
    $P946 = $P939."new"($P941, $S945, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 337
    store_lex "$classinit", $P946
.annotate "line", 345
    find_lex $P949, "$/"
    unless_null $P949, vivify_322
    $P949 = root_new ['parrot';'Hash']
  vivify_322:
    set $P950, $P949["package_def"]
    unless_null $P950, vivify_323
    $P950 = root_new ['parrot';'Hash']
  vivify_323:
    set $P951, $P950["parent"]
    unless_null $P951, vivify_324
    $P951 = root_new ['parrot';'ResizablePMCArray']
  vivify_324:
    set $P952, $P951[0]
    unless_null $P952, vivify_325
    new $P952, "Undef"
  vivify_325:
    set $S953, $P952
    unless $S953, unless_948
    new $P947, 'String'
    set $P947, $S953
    goto unless_948_end
  unless_948:
.annotate "line", 346
    find_lex $P956, "$/"
    unless_null $P956, vivify_326
    $P956 = root_new ['parrot';'Hash']
  vivify_326:
    set $P957, $P956["sym"]
    unless_null $P957, vivify_327
    new $P957, "Undef"
  vivify_327:
    set $S958, $P957
    iseq $I959, $S958, "grammar"
    if $I959, if_955
    new $P961, "String"
    assign $P961, ""
    set $P954, $P961
    goto if_955_end
  if_955:
    new $P960, "String"
    assign $P960, "Regex::Cursor"
    set $P954, $P960
  if_955_end:
    set $P947, $P954
  unless_948_end:
    store_lex "$parent", $P947
.annotate "line", 347
    find_lex $P963, "$parent"
    unless $P963, if_962_end
.annotate "line", 348
    find_lex $P964, "$classinit"
    get_hll_global $P965, ["PAST"], "Val"
    find_lex $P966, "$parent"
    $P967 = $P965."new"($P966 :named("value"), "parent" :named("named"))
    $P964."push"($P967)
  if_962_end:
.annotate "line", 350
    find_lex $P969, "$past"
    unless_null $P969, vivify_328
    $P969 = root_new ['parrot';'Hash']
  vivify_328:
    set $P970, $P969["attributes"]
    unless_null $P970, vivify_329
    new $P970, "Undef"
  vivify_329:
    unless $P970, if_968_end
.annotate "line", 351
    find_lex $P971, "$classinit"
    find_lex $P972, "$past"
    unless_null $P972, vivify_330
    $P972 = root_new ['parrot';'Hash']
  vivify_330:
    set $P973, $P972["attributes"]
    unless_null $P973, vivify_331
    new $P973, "Undef"
  vivify_331:
    $P971."push"($P973)
  if_968_end:
.annotate "line", 353
    get_global $P974, "@BLOCK"
    unless_null $P974, vivify_332
    $P974 = root_new ['parrot';'ResizablePMCArray']
  vivify_332:
    set $P975, $P974[0]
    unless_null $P975, vivify_333
    new $P975, "Undef"
  vivify_333:
    $P976 = $P975."loadinit"()
    find_lex $P977, "$classinit"
    $P976."push"($P977)
.annotate "line", 354
    find_lex $P978, "$/"
    find_lex $P979, "$past"
    $P980 = $P978."!make"($P979)
.annotate "line", 334
    .return ($P980)
  control_930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P981, exception, "payload"
    .return ($P981)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("62_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_985
.annotate "line", 357
    new $P984, 'ExceptionHandler'
    set_addr $P984, control_983
    $P984."handle_types"(58)
    push_eh $P984
    .lex "self", self
    .lex "$/", param_985
.annotate "line", 358
    new $P986, "Undef"
    .lex "$past", $P986
    find_lex $P989, "$/"
    unless_null $P989, vivify_334
    $P989 = root_new ['parrot';'Hash']
  vivify_334:
    set $P990, $P989["block"]
    unless_null $P990, vivify_335
    new $P990, "Undef"
  vivify_335:
    if $P990, if_988
    find_lex $P994, "$/"
    unless_null $P994, vivify_336
    $P994 = root_new ['parrot';'Hash']
  vivify_336:
    set $P995, $P994["comp_unit"]
    unless_null $P995, vivify_337
    new $P995, "Undef"
  vivify_337:
    $P996 = $P995."ast"()
    set $P987, $P996
    goto if_988_end
  if_988:
    find_lex $P991, "$/"
    unless_null $P991, vivify_338
    $P991 = root_new ['parrot';'Hash']
  vivify_338:
    set $P992, $P991["block"]
    unless_null $P992, vivify_339
    new $P992, "Undef"
  vivify_339:
    $P993 = $P992."ast"()
    set $P987, $P993
  if_988_end:
    store_lex "$past", $P987
.annotate "line", 359
    find_lex $P997, "$past"
    find_lex $P998, "$/"
    unless_null $P998, vivify_340
    $P998 = root_new ['parrot';'Hash']
  vivify_340:
    set $P999, $P998["name"]
    unless_null $P999, vivify_341
    $P999 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1000, $P999["identifier"]
    unless_null $P1000, vivify_342
    new $P1000, "Undef"
  vivify_342:
    $P997."namespace"($P1000)
.annotate "line", 360
    find_lex $P1001, "$past"
    $P1001."blocktype"("immediate")
.annotate "line", 361
    find_lex $P1002, "$/"
    find_lex $P1003, "$past"
    $P1004 = $P1002."!make"($P1003)
.annotate "line", 357
    .return ($P1004)
  control_983:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1005, exception, "payload"
    .return ($P1005)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("63_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1009
.annotate "line", 364
    new $P1008, 'ExceptionHandler'
    set_addr $P1008, control_1007
    $P1008."handle_types"(58)
    push_eh $P1008
    .lex "self", self
    .lex "$/", param_1009
    find_lex $P1010, "$/"
    find_lex $P1011, "$/"
    unless_null $P1011, vivify_343
    $P1011 = root_new ['parrot';'Hash']
  vivify_343:
    set $P1012, $P1011["scoped"]
    unless_null $P1012, vivify_344
    new $P1012, "Undef"
  vivify_344:
    $P1013 = $P1012."ast"()
    $P1014 = $P1010."!make"($P1013)
    .return ($P1014)
  control_1007:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1015, exception, "payload"
    .return ($P1015)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("64_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1019
.annotate "line", 365
    new $P1018, 'ExceptionHandler'
    set_addr $P1018, control_1017
    $P1018."handle_types"(58)
    push_eh $P1018
    .lex "self", self
    .lex "$/", param_1019
    find_lex $P1020, "$/"
    find_lex $P1021, "$/"
    unless_null $P1021, vivify_345
    $P1021 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1022, $P1021["scoped"]
    unless_null $P1022, vivify_346
    new $P1022, "Undef"
  vivify_346:
    $P1023 = $P1022."ast"()
    $P1024 = $P1020."!make"($P1023)
    .return ($P1024)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1025, exception, "payload"
    .return ($P1025)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("65_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1029
.annotate "line", 366
    new $P1028, 'ExceptionHandler'
    set_addr $P1028, control_1027
    $P1028."handle_types"(58)
    push_eh $P1028
    .lex "self", self
    .lex "$/", param_1029
    find_lex $P1030, "$/"
    find_lex $P1031, "$/"
    unless_null $P1031, vivify_347
    $P1031 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1032, $P1031["scoped"]
    unless_null $P1032, vivify_348
    new $P1032, "Undef"
  vivify_348:
    $P1033 = $P1032."ast"()
    $P1034 = $P1030."!make"($P1033)
    .return ($P1034)
  control_1027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1035, exception, "payload"
    .return ($P1035)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("66_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1039
.annotate "line", 368
    new $P1038, 'ExceptionHandler'
    set_addr $P1038, control_1037
    $P1038."handle_types"(58)
    push_eh $P1038
    .lex "self", self
    .lex "$/", param_1039
.annotate "line", 369
    find_lex $P1040, "$/"
.annotate "line", 370
    find_lex $P1043, "$/"
    unless_null $P1043, vivify_349
    $P1043 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1044, $P1043["routine_declarator"]
    unless_null $P1044, vivify_350
    new $P1044, "Undef"
  vivify_350:
    if $P1044, if_1042
.annotate "line", 371
    find_lex $P1048, "$/"
    unless_null $P1048, vivify_351
    $P1048 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1049, $P1048["variable_declarator"]
    unless_null $P1049, vivify_352
    new $P1049, "Undef"
  vivify_352:
    $P1050 = $P1049."ast"()
    set $P1041, $P1050
.annotate "line", 370
    goto if_1042_end
  if_1042:
    find_lex $P1045, "$/"
    unless_null $P1045, vivify_353
    $P1045 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1046, $P1045["routine_declarator"]
    unless_null $P1046, vivify_354
    new $P1046, "Undef"
  vivify_354:
    $P1047 = $P1046."ast"()
    set $P1041, $P1047
  if_1042_end:
    $P1051 = $P1040."!make"($P1041)
.annotate "line", 368
    .return ($P1051)
  control_1037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1052, exception, "payload"
    .return ($P1052)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("67_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1056
.annotate "line", 374
    .const 'Sub' $P1096 = "68_1267204714.47172" 
    capture_lex $P1096
    new $P1055, 'ExceptionHandler'
    set_addr $P1055, control_1054
    $P1055."handle_types"(58)
    push_eh $P1055
    .lex "self", self
    .lex "$/", param_1056
.annotate "line", 375
    new $P1057, "Undef"
    .lex "$past", $P1057
.annotate "line", 376
    new $P1058, "Undef"
    .lex "$sigil", $P1058
.annotate "line", 377
    new $P1059, "Undef"
    .lex "$name", $P1059
.annotate "line", 378
    new $P1060, "Undef"
    .lex "$BLOCK", $P1060
.annotate "line", 375
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_355
    $P1061 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1062, $P1061["variable"]
    unless_null $P1062, vivify_356
    new $P1062, "Undef"
  vivify_356:
    $P1063 = $P1062."ast"()
    store_lex "$past", $P1063
.annotate "line", 376
    find_lex $P1064, "$/"
    unless_null $P1064, vivify_357
    $P1064 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1065, $P1064["variable"]
    unless_null $P1065, vivify_358
    $P1065 = root_new ['parrot';'Hash']
  vivify_358:
    set $P1066, $P1065["sigil"]
    unless_null $P1066, vivify_359
    new $P1066, "Undef"
  vivify_359:
    store_lex "$sigil", $P1066
.annotate "line", 377
    find_lex $P1067, "$past"
    $P1068 = $P1067."name"()
    store_lex "$name", $P1068
.annotate "line", 378
    get_global $P1069, "@BLOCK"
    unless_null $P1069, vivify_360
    $P1069 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P1070, $P1069[0]
    unless_null $P1070, vivify_361
    new $P1070, "Undef"
  vivify_361:
    store_lex "$BLOCK", $P1070
.annotate "line", 379
    find_lex $P1072, "$BLOCK"
    find_lex $P1073, "$name"
    $P1074 = $P1072."symbol"($P1073)
    unless $P1074, if_1071_end
.annotate "line", 380
    find_lex $P1075, "$/"
    $P1076 = $P1075."CURSOR"()
    find_lex $P1077, "$name"
    $P1076."panic"("Redeclaration of symbol ", $P1077)
  if_1071_end:
.annotate "line", 382
    find_dynamic_lex $P1079, "$*SCOPE"
    unless_null $P1079, vivify_362
    get_hll_global $P1079, "$SCOPE"
    unless_null $P1079, vivify_363
    die "Contextual $*SCOPE not found"
  vivify_363:
  vivify_362:
    set $S1080, $P1079
    iseq $I1081, $S1080, "has"
    if $I1081, if_1078
.annotate "line", 391
    .const 'Sub' $P1096 = "68_1267204714.47172" 
    capture_lex $P1096
    $P1096()
    goto if_1078_end
  if_1078:
.annotate "line", 383
    find_lex $P1082, "$BLOCK"
    find_lex $P1083, "$name"
    $P1082."symbol"($P1083, "attribute" :named("scope"))
.annotate "line", 384
    find_lex $P1085, "$BLOCK"
    unless_null $P1085, vivify_368
    $P1085 = root_new ['parrot';'Hash']
  vivify_368:
    set $P1086, $P1085["attributes"]
    unless_null $P1086, vivify_369
    new $P1086, "Undef"
  vivify_369:
    if $P1086, unless_1084_end
.annotate "line", 386
    get_hll_global $P1087, ["PAST"], "Op"
    $P1088 = $P1087."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1089, "$BLOCK"
    unless_null $P1089, vivify_370
    $P1089 = root_new ['parrot';'Hash']
    store_lex "$BLOCK", $P1089
  vivify_370:
    set $P1089["attributes"], $P1088
  unless_1084_end:
.annotate "line", 388
    find_lex $P1090, "$BLOCK"
    unless_null $P1090, vivify_371
    $P1090 = root_new ['parrot';'Hash']
  vivify_371:
    set $P1091, $P1090["attributes"]
    unless_null $P1091, vivify_372
    new $P1091, "Undef"
  vivify_372:
    find_lex $P1092, "$name"
    $P1091."push"($P1092)
.annotate "line", 389
    get_hll_global $P1093, ["PAST"], "Stmts"
    $P1094 = $P1093."new"()
    store_lex "$past", $P1094
  if_1078_end:
.annotate "line", 399
    find_lex $P1120, "$/"
    find_lex $P1121, "$past"
    $P1122 = $P1120."!make"($P1121)
.annotate "line", 374
    .return ($P1122)
  control_1054:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1123, exception, "payload"
    .return ($P1123)
.end


.namespace ["NQP";"Actions"]
.sub "_block1095"  :anon :subid("68_1267204714.47172") :outer("67_1267204714.47172")
.annotate "line", 392
    new $P1097, "Undef"
    .lex "$scope", $P1097
.annotate "line", 393
    new $P1098, "Undef"
    .lex "$decl", $P1098
.annotate "line", 392
    find_dynamic_lex $P1101, "$*SCOPE"
    unless_null $P1101, vivify_364
    get_hll_global $P1101, "$SCOPE"
    unless_null $P1101, vivify_365
    die "Contextual $*SCOPE not found"
  vivify_365:
  vivify_364:
    set $S1102, $P1101
    iseq $I1103, $S1102, "our"
    if $I1103, if_1100
    new $P1105, "String"
    assign $P1105, "lexical"
    set $P1099, $P1105
    goto if_1100_end
  if_1100:
    new $P1104, "String"
    assign $P1104, "package"
    set $P1099, $P1104
  if_1100_end:
    store_lex "$scope", $P1099
.annotate "line", 393
    get_hll_global $P1106, ["PAST"], "Var"
    find_lex $P1107, "$name"
    find_lex $P1108, "$scope"
.annotate "line", 394
    find_lex $P1109, "$sigil"
    $P1110 = "vivitype"($P1109)
    find_lex $P1111, "$/"
    $P1112 = $P1106."new"($P1107 :named("name"), $P1108 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1110 :named("viviself"), $P1111 :named("node"))
.annotate "line", 393
    store_lex "$decl", $P1112
.annotate "line", 396
    find_lex $P1113, "$BLOCK"
    find_lex $P1114, "$name"
    find_lex $P1115, "$scope"
    $P1113."symbol"($P1114, $P1115 :named("scope"))
.annotate "line", 397
    find_lex $P1116, "$BLOCK"
    unless_null $P1116, vivify_366
    $P1116 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P1117, $P1116[0]
    unless_null $P1117, vivify_367
    new $P1117, "Undef"
  vivify_367:
    find_lex $P1118, "$decl"
    $P1119 = $P1117."push"($P1118)
.annotate "line", 391
    .return ($P1119)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("69_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1127
.annotate "line", 402
    new $P1126, 'ExceptionHandler'
    set_addr $P1126, control_1125
    $P1126."handle_types"(58)
    push_eh $P1126
    .lex "self", self
    .lex "$/", param_1127
    find_lex $P1128, "$/"
    find_lex $P1129, "$/"
    unless_null $P1129, vivify_373
    $P1129 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1130, $P1129["routine_def"]
    unless_null $P1130, vivify_374
    new $P1130, "Undef"
  vivify_374:
    $P1131 = $P1130."ast"()
    $P1132 = $P1128."!make"($P1131)
    .return ($P1132)
  control_1125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1133, exception, "payload"
    .return ($P1133)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("70_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1137
.annotate "line", 403
    new $P1136, 'ExceptionHandler'
    set_addr $P1136, control_1135
    $P1136."handle_types"(58)
    push_eh $P1136
    .lex "self", self
    .lex "$/", param_1137
    find_lex $P1138, "$/"
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_375
    $P1139 = root_new ['parrot';'Hash']
  vivify_375:
    set $P1140, $P1139["method_def"]
    unless_null $P1140, vivify_376
    new $P1140, "Undef"
  vivify_376:
    $P1141 = $P1140."ast"()
    $P1142 = $P1138."!make"($P1141)
    .return ($P1142)
  control_1135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1143, exception, "payload"
    .return ($P1143)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("71_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1147
.annotate "line", 405
    .const 'Sub' $P1158 = "72_1267204714.47172" 
    capture_lex $P1158
    new $P1146, 'ExceptionHandler'
    set_addr $P1146, control_1145
    $P1146."handle_types"(58)
    push_eh $P1146
    .lex "self", self
    .lex "$/", param_1147
.annotate "line", 406
    new $P1148, "Undef"
    .lex "$past", $P1148
    find_lex $P1149, "$/"
    unless_null $P1149, vivify_377
    $P1149 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1150, $P1149["blockoid"]
    unless_null $P1150, vivify_378
    new $P1150, "Undef"
  vivify_378:
    $P1151 = $P1150."ast"()
    store_lex "$past", $P1151
.annotate "line", 407
    find_lex $P1152, "$past"
    $P1152."blocktype"("declaration")
.annotate "line", 408
    find_lex $P1153, "$past"
    $P1153."control"("return_pir")
.annotate "line", 409
    find_lex $P1155, "$/"
    unless_null $P1155, vivify_379
    $P1155 = root_new ['parrot';'Hash']
  vivify_379:
    set $P1156, $P1155["deflongname"]
    unless_null $P1156, vivify_380
    new $P1156, "Undef"
  vivify_380:
    unless $P1156, if_1154_end
    .const 'Sub' $P1158 = "72_1267204714.47172" 
    capture_lex $P1158
    $P1158()
  if_1154_end:
.annotate "line", 419
    find_lex $P1190, "$/"
    find_lex $P1191, "$past"
    $P1192 = $P1190."!make"($P1191)
.annotate "line", 405
    .return ($P1192)
  control_1145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1193, exception, "payload"
    .return ($P1193)
.end


.namespace ["NQP";"Actions"]
.sub "_block1157"  :anon :subid("72_1267204714.47172") :outer("71_1267204714.47172")
.annotate "line", 410
    new $P1159, "Undef"
    .lex "$name", $P1159
    find_lex $P1160, "$/"
    unless_null $P1160, vivify_381
    $P1160 = root_new ['parrot';'Hash']
  vivify_381:
    set $P1161, $P1160["sigil"]
    unless_null $P1161, vivify_382
    $P1161 = root_new ['parrot';'ResizablePMCArray']
  vivify_382:
    set $P1162, $P1161[0]
    unless_null $P1162, vivify_383
    new $P1162, "Undef"
  vivify_383:
    set $S1163, $P1162
    new $P1164, 'String'
    set $P1164, $S1163
    find_lex $P1165, "$/"
    unless_null $P1165, vivify_384
    $P1165 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1166, $P1165["deflongname"]
    unless_null $P1166, vivify_385
    $P1166 = root_new ['parrot';'ResizablePMCArray']
  vivify_385:
    set $P1167, $P1166[0]
    unless_null $P1167, vivify_386
    new $P1167, "Undef"
  vivify_386:
    $S1168 = $P1167."ast"()
    concat $P1169, $P1164, $S1168
    store_lex "$name", $P1169
.annotate "line", 411
    find_lex $P1170, "$past"
    find_lex $P1171, "$name"
    $P1170."name"($P1171)
.annotate "line", 412
    find_dynamic_lex $P1174, "$*SCOPE"
    unless_null $P1174, vivify_387
    get_hll_global $P1174, "$SCOPE"
    unless_null $P1174, vivify_388
    die "Contextual $*SCOPE not found"
  vivify_388:
  vivify_387:
    set $S1175, $P1174
    isne $I1176, $S1175, "our"
    if $I1176, if_1173
    new $P1172, 'Integer'
    set $P1172, $I1176
    goto if_1173_end
  if_1173:
.annotate "line", 413
    get_global $P1177, "@BLOCK"
    unless_null $P1177, vivify_389
    $P1177 = root_new ['parrot';'ResizablePMCArray']
  vivify_389:
    set $P1178, $P1177[0]
    unless_null $P1178, vivify_390
    $P1178 = root_new ['parrot';'ResizablePMCArray']
  vivify_390:
    set $P1179, $P1178[0]
    unless_null $P1179, vivify_391
    new $P1179, "Undef"
  vivify_391:
    get_hll_global $P1180, ["PAST"], "Var"
    find_lex $P1181, "$name"
    find_lex $P1182, "$past"
    $P1183 = $P1180."new"($P1181 :named("name"), 1 :named("isdecl"), $P1182 :named("viviself"), "lexical" :named("scope"))
    $P1179."push"($P1183)
.annotate "line", 415
    get_global $P1184, "@BLOCK"
    unless_null $P1184, vivify_392
    $P1184 = root_new ['parrot';'ResizablePMCArray']
  vivify_392:
    set $P1185, $P1184[0]
    unless_null $P1185, vivify_393
    new $P1185, "Undef"
  vivify_393:
    find_lex $P1186, "$name"
    $P1185."symbol"($P1186, "lexical" :named("scope"))
.annotate "line", 416
    get_hll_global $P1187, ["PAST"], "Var"
    find_lex $P1188, "$name"
    $P1189 = $P1187."new"($P1188 :named("name"))
    store_lex "$past", $P1189
.annotate "line", 412
    set $P1172, $P1189
  if_1173_end:
.annotate "line", 409
    .return ($P1172)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("73_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1197
.annotate "line", 423
    .const 'Sub' $P1213 = "74_1267204714.47172" 
    capture_lex $P1213
    new $P1196, 'ExceptionHandler'
    set_addr $P1196, control_1195
    $P1196."handle_types"(58)
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate "line", 424
    new $P1198, "Undef"
    .lex "$past", $P1198
    find_lex $P1199, "$/"
    unless_null $P1199, vivify_394
    $P1199 = root_new ['parrot';'Hash']
  vivify_394:
    set $P1200, $P1199["blockoid"]
    unless_null $P1200, vivify_395
    new $P1200, "Undef"
  vivify_395:
    $P1201 = $P1200."ast"()
    store_lex "$past", $P1201
.annotate "line", 425
    find_lex $P1202, "$past"
    $P1202."blocktype"("method")
.annotate "line", 426
    find_lex $P1203, "$past"
    $P1203."control"("return_pir")
.annotate "line", 427
    find_lex $P1204, "$past"
    unless_null $P1204, vivify_396
    $P1204 = root_new ['parrot';'ResizablePMCArray']
  vivify_396:
    set $P1205, $P1204[0]
    unless_null $P1205, vivify_397
    new $P1205, "Undef"
  vivify_397:
    get_hll_global $P1206, ["PAST"], "Op"
    $P1207 = $P1206."new"("    .lex \"self\", self" :named("inline"))
    $P1205."unshift"($P1207)
.annotate "line", 428
    find_lex $P1208, "$past"
    $P1208."symbol"("self", "lexical" :named("scope"))
.annotate "line", 429
    find_lex $P1210, "$/"
    unless_null $P1210, vivify_398
    $P1210 = root_new ['parrot';'Hash']
  vivify_398:
    set $P1211, $P1210["deflongname"]
    unless_null $P1211, vivify_399
    new $P1211, "Undef"
  vivify_399:
    unless $P1211, if_1209_end
    .const 'Sub' $P1213 = "74_1267204714.47172" 
    capture_lex $P1213
    $P1213()
  if_1209_end:
.annotate "line", 433
    find_lex $P1224, "$/"
    find_lex $P1225, "$past"
    $P1226 = $P1224."!make"($P1225)
.annotate "line", 423
    .return ($P1226)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1227, exception, "payload"
    .return ($P1227)
.end


.namespace ["NQP";"Actions"]
.sub "_block1212"  :anon :subid("74_1267204714.47172") :outer("73_1267204714.47172")
.annotate "line", 430
    new $P1214, "Undef"
    .lex "$name", $P1214
    find_lex $P1215, "$/"
    unless_null $P1215, vivify_400
    $P1215 = root_new ['parrot';'Hash']
  vivify_400:
    set $P1216, $P1215["deflongname"]
    unless_null $P1216, vivify_401
    $P1216 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P1217, $P1216[0]
    unless_null $P1217, vivify_402
    new $P1217, "Undef"
  vivify_402:
    $P1218 = $P1217."ast"()
    set $S1219, $P1218
    new $P1220, 'String'
    set $P1220, $S1219
    store_lex "$name", $P1220
.annotate "line", 431
    find_lex $P1221, "$past"
    find_lex $P1222, "$name"
    $P1223 = $P1221."name"($P1222)
.annotate "line", 429
    .return ($P1223)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("75_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1231
.annotate "line", 437
    .const 'Sub' $P1242 = "76_1267204714.47172" 
    capture_lex $P1242
    new $P1230, 'ExceptionHandler'
    set_addr $P1230, control_1229
    $P1230."handle_types"(58)
    push_eh $P1230
    .lex "self", self
    .lex "$/", param_1231
.annotate "line", 438
    new $P1232, "Undef"
    .lex "$BLOCKINIT", $P1232
    get_global $P1233, "@BLOCK"
    unless_null $P1233, vivify_403
    $P1233 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P1234, $P1233[0]
    unless_null $P1234, vivify_404
    $P1234 = root_new ['parrot';'ResizablePMCArray']
  vivify_404:
    set $P1235, $P1234[0]
    unless_null $P1235, vivify_405
    new $P1235, "Undef"
  vivify_405:
    store_lex "$BLOCKINIT", $P1235
.annotate "line", 439
    find_lex $P1237, "$/"
    unless_null $P1237, vivify_406
    $P1237 = root_new ['parrot';'Hash']
  vivify_406:
    set $P1238, $P1237["parameter"]
    unless_null $P1238, vivify_407
    new $P1238, "Undef"
  vivify_407:
    defined $I1239, $P1238
    unless $I1239, for_undef_408
    iter $P1236, $P1238
    new $P1249, 'ExceptionHandler'
    set_addr $P1249, loop1248_handler
    $P1249."handle_types"(65, 67, 66)
    push_eh $P1249
  loop1248_test:
    unless $P1236, loop1248_done
    shift $P1240, $P1236
  loop1248_redo:
    .const 'Sub' $P1242 = "76_1267204714.47172" 
    capture_lex $P1242
    $P1242($P1240)
  loop1248_next:
    goto loop1248_test
  loop1248_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1250, exception, 'type'
    eq $P1250, 65, loop1248_next
    eq $P1250, 67, loop1248_redo
  loop1248_done:
    pop_eh 
  for_undef_408:
.annotate "line", 437
    .return ($P1236)
  control_1229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1251, exception, "payload"
    .return ($P1251)
.end


.namespace ["NQP";"Actions"]
.sub "_block1241"  :anon :subid("76_1267204714.47172") :outer("75_1267204714.47172")
    .param pmc param_1243
.annotate "line", 439
    .lex "$_", param_1243
    find_lex $P1244, "$BLOCKINIT"
    find_lex $P1245, "$_"
    $P1246 = $P1245."ast"()
    $P1247 = $P1244."push"($P1246)
    .return ($P1247)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("77_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1255
.annotate "line", 442
    new $P1254, 'ExceptionHandler'
    set_addr $P1254, control_1253
    $P1254."handle_types"(58)
    push_eh $P1254
    .lex "self", self
    .lex "$/", param_1255
.annotate "line", 443
    new $P1256, "Undef"
    .lex "$quant", $P1256
.annotate "line", 444
    new $P1257, "Undef"
    .lex "$past", $P1257
.annotate "line", 443
    find_lex $P1258, "$/"
    unless_null $P1258, vivify_409
    $P1258 = root_new ['parrot';'Hash']
  vivify_409:
    set $P1259, $P1258["quant"]
    unless_null $P1259, vivify_410
    new $P1259, "Undef"
  vivify_410:
    store_lex "$quant", $P1259
    find_lex $P1260, "$past"
.annotate "line", 445
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_411
    $P1262 = root_new ['parrot';'Hash']
  vivify_411:
    set $P1263, $P1262["named_param"]
    unless_null $P1263, vivify_412
    new $P1263, "Undef"
  vivify_412:
    if $P1263, if_1261
.annotate "line", 452
    find_lex $P1277, "$/"
    unless_null $P1277, vivify_413
    $P1277 = root_new ['parrot';'Hash']
  vivify_413:
    set $P1278, $P1277["param_var"]
    unless_null $P1278, vivify_414
    new $P1278, "Undef"
  vivify_414:
    $P1279 = $P1278."ast"()
    store_lex "$past", $P1279
.annotate "line", 453
    find_lex $P1281, "$quant"
    set $S1282, $P1281
    iseq $I1283, $S1282, "*"
    if $I1283, if_1280
.annotate "line", 457
    find_lex $P1292, "$quant"
    set $S1293, $P1292
    iseq $I1294, $S1293, "?"
    unless $I1294, if_1291_end
.annotate "line", 458
    find_lex $P1295, "$past"
    find_lex $P1296, "$/"
    unless_null $P1296, vivify_415
    $P1296 = root_new ['parrot';'Hash']
  vivify_415:
    set $P1297, $P1296["param_var"]
    unless_null $P1297, vivify_416
    $P1297 = root_new ['parrot';'Hash']
  vivify_416:
    set $P1298, $P1297["sigil"]
    unless_null $P1298, vivify_417
    new $P1298, "Undef"
  vivify_417:
    $P1299 = "vivitype"($P1298)
    $P1295."viviself"($P1299)
  if_1291_end:
.annotate "line", 457
    goto if_1280_end
  if_1280:
.annotate "line", 454
    find_lex $P1284, "$past"
    $P1284."slurpy"(1)
.annotate "line", 455
    find_lex $P1285, "$past"
    find_lex $P1286, "$/"
    unless_null $P1286, vivify_418
    $P1286 = root_new ['parrot';'Hash']
  vivify_418:
    set $P1287, $P1286["param_var"]
    unless_null $P1287, vivify_419
    $P1287 = root_new ['parrot';'Hash']
  vivify_419:
    set $P1288, $P1287["sigil"]
    unless_null $P1288, vivify_420
    new $P1288, "Undef"
  vivify_420:
    set $S1289, $P1288
    iseq $I1290, $S1289, "%"
    $P1285."named"($I1290)
  if_1280_end:
.annotate "line", 451
    goto if_1261_end
  if_1261:
.annotate "line", 446
    find_lex $P1264, "$/"
    unless_null $P1264, vivify_421
    $P1264 = root_new ['parrot';'Hash']
  vivify_421:
    set $P1265, $P1264["named_param"]
    unless_null $P1265, vivify_422
    new $P1265, "Undef"
  vivify_422:
    $P1266 = $P1265."ast"()
    store_lex "$past", $P1266
.annotate "line", 447
    find_lex $P1268, "$quant"
    set $S1269, $P1268
    isne $I1270, $S1269, "!"
    unless $I1270, if_1267_end
.annotate "line", 448
    find_lex $P1271, "$past"
    find_lex $P1272, "$/"
    unless_null $P1272, vivify_423
    $P1272 = root_new ['parrot';'Hash']
  vivify_423:
    set $P1273, $P1272["named_param"]
    unless_null $P1273, vivify_424
    $P1273 = root_new ['parrot';'Hash']
  vivify_424:
    set $P1274, $P1273["param_var"]
    unless_null $P1274, vivify_425
    $P1274 = root_new ['parrot';'Hash']
  vivify_425:
    set $P1275, $P1274["sigil"]
    unless_null $P1275, vivify_426
    new $P1275, "Undef"
  vivify_426:
    $P1276 = "vivitype"($P1275)
    $P1271."viviself"($P1276)
  if_1267_end:
  if_1261_end:
.annotate "line", 461
    find_lex $P1301, "$/"
    unless_null $P1301, vivify_427
    $P1301 = root_new ['parrot';'Hash']
  vivify_427:
    set $P1302, $P1301["default_value"]
    unless_null $P1302, vivify_428
    new $P1302, "Undef"
  vivify_428:
    unless $P1302, if_1300_end
.annotate "line", 462
    find_lex $P1304, "$quant"
    set $S1305, $P1304
    iseq $I1306, $S1305, "*"
    unless $I1306, if_1303_end
.annotate "line", 463
    find_lex $P1307, "$/"
    $P1308 = $P1307."CURSOR"()
    $P1308."panic"("Can't put default on slurpy parameter")
  if_1303_end:
.annotate "line", 465
    find_lex $P1310, "$quant"
    set $S1311, $P1310
    iseq $I1312, $S1311, "!"
    unless $I1312, if_1309_end
.annotate "line", 466
    find_lex $P1313, "$/"
    $P1314 = $P1313."CURSOR"()
    $P1314."panic"("Can't put default on required parameter")
  if_1309_end:
.annotate "line", 468
    find_lex $P1315, "$past"
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_429
    $P1316 = root_new ['parrot';'Hash']
  vivify_429:
    set $P1317, $P1316["default_value"]
    unless_null $P1317, vivify_430
    $P1317 = root_new ['parrot';'ResizablePMCArray']
  vivify_430:
    set $P1318, $P1317[0]
    unless_null $P1318, vivify_431
    $P1318 = root_new ['parrot';'Hash']
  vivify_431:
    set $P1319, $P1318["EXPR"]
    unless_null $P1319, vivify_432
    new $P1319, "Undef"
  vivify_432:
    $P1320 = $P1319."ast"()
    $P1315."viviself"($P1320)
  if_1300_end:
.annotate "line", 470
    find_lex $P1322, "$past"
    $P1323 = $P1322."viviself"()
    if $P1323, unless_1321_end
    get_global $P1324, "@BLOCK"
    unless_null $P1324, vivify_433
    $P1324 = root_new ['parrot';'ResizablePMCArray']
  vivify_433:
    set $P1325, $P1324[0]
    unless_null $P1325, vivify_434
    new $P1325, "Undef"
  vivify_434:
    get_global $P1326, "@BLOCK"
    unless_null $P1326, vivify_435
    $P1326 = root_new ['parrot';'ResizablePMCArray']
  vivify_435:
    set $P1327, $P1326[0]
    unless_null $P1327, vivify_436
    new $P1327, "Undef"
  vivify_436:
    $P1328 = $P1327."arity"()
    set $N1329, $P1328
    new $P1330, 'Float'
    set $P1330, $N1329
    add $P1331, $P1330, 1
    $P1325."arity"($P1331)
  unless_1321_end:
.annotate "line", 471
    find_lex $P1332, "$/"
    find_lex $P1333, "$past"
    $P1334 = $P1332."!make"($P1333)
.annotate "line", 442
    .return ($P1334)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1335, exception, "payload"
    .return ($P1335)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("78_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1339
.annotate "line", 474
    new $P1338, 'ExceptionHandler'
    set_addr $P1338, control_1337
    $P1338."handle_types"(58)
    push_eh $P1338
    .lex "self", self
    .lex "$/", param_1339
.annotate "line", 475
    new $P1340, "Undef"
    .lex "$name", $P1340
.annotate "line", 476
    new $P1341, "Undef"
    .lex "$past", $P1341
.annotate "line", 475
    find_lex $P1342, "$/"
    set $S1343, $P1342
    new $P1344, 'String'
    set $P1344, $S1343
    store_lex "$name", $P1344
.annotate "line", 476
    get_hll_global $P1345, ["PAST"], "Var"
    find_lex $P1346, "$name"
    find_lex $P1347, "$/"
    $P1348 = $P1345."new"($P1346 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1347 :named("node"))
    store_lex "$past", $P1348
.annotate "line", 478
    get_global $P1349, "@BLOCK"
    unless_null $P1349, vivify_437
    $P1349 = root_new ['parrot';'ResizablePMCArray']
  vivify_437:
    set $P1350, $P1349[0]
    unless_null $P1350, vivify_438
    new $P1350, "Undef"
  vivify_438:
    find_lex $P1351, "$name"
    $P1350."symbol"($P1351, "lexical" :named("scope"))
.annotate "line", 479
    find_lex $P1352, "$/"
    find_lex $P1353, "$past"
    $P1354 = $P1352."!make"($P1353)
.annotate "line", 474
    .return ($P1354)
  control_1337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1355, exception, "payload"
    .return ($P1355)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("79_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1359
.annotate "line", 482
    new $P1358, 'ExceptionHandler'
    set_addr $P1358, control_1357
    $P1358."handle_types"(58)
    push_eh $P1358
    .lex "self", self
    .lex "$/", param_1359
.annotate "line", 483
    new $P1360, "Undef"
    .lex "$past", $P1360
    find_lex $P1361, "$/"
    unless_null $P1361, vivify_439
    $P1361 = root_new ['parrot';'Hash']
  vivify_439:
    set $P1362, $P1361["param_var"]
    unless_null $P1362, vivify_440
    new $P1362, "Undef"
  vivify_440:
    $P1363 = $P1362."ast"()
    store_lex "$past", $P1363
.annotate "line", 484
    find_lex $P1364, "$past"
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_441
    $P1365 = root_new ['parrot';'Hash']
  vivify_441:
    set $P1366, $P1365["param_var"]
    unless_null $P1366, vivify_442
    $P1366 = root_new ['parrot';'Hash']
  vivify_442:
    set $P1367, $P1366["name"]
    unless_null $P1367, vivify_443
    new $P1367, "Undef"
  vivify_443:
    set $S1368, $P1367
    $P1364."named"($S1368)
.annotate "line", 485
    find_lex $P1369, "$/"
    find_lex $P1370, "$past"
    $P1371 = $P1369."!make"($P1370)
.annotate "line", 482
    .return ($P1371)
  control_1357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1372, exception, "payload"
    .return ($P1372)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("80_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1376
    .param pmc param_1377 :optional
    .param int has_param_1377 :opt_flag
.annotate "line", 488
    .const 'Sub' $P1447 = "82_1267204714.47172" 
    capture_lex $P1447
    .const 'Sub' $P1419 = "81_1267204714.47172" 
    capture_lex $P1419
    new $P1375, 'ExceptionHandler'
    set_addr $P1375, control_1374
    $P1375."handle_types"(58)
    push_eh $P1375
    .lex "self", self
    .lex "$/", param_1376
    if has_param_1377, optparam_444
    new $P1378, "Undef"
    set param_1377, $P1378
  optparam_444:
    .lex "$key", param_1377
.annotate "line", 489
    $P1379 = root_new ['parrot';'ResizablePMCArray']
    .lex "@MODIFIERS", $P1379
.annotate "line", 492
    new $P1380, "Undef"
    .lex "$name", $P1380
.annotate "line", 493
    new $P1381, "Undef"
    .lex "$past", $P1381
.annotate "line", 489

        $P1382 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1382
.annotate "line", 492
    find_lex $P1383, "$/"
    unless_null $P1383, vivify_445
    $P1383 = root_new ['parrot';'Hash']
  vivify_445:
    set $P1384, $P1383["deflongname"]
    unless_null $P1384, vivify_446
    new $P1384, "Undef"
  vivify_446:
    $P1385 = $P1384."ast"()
    set $S1386, $P1385
    new $P1387, 'String'
    set $P1387, $S1386
    store_lex "$name", $P1387
    find_lex $P1388, "$past"
.annotate "line", 494
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_447
    $P1390 = root_new ['parrot';'Hash']
  vivify_447:
    set $P1391, $P1390["proto"]
    unless_null $P1391, vivify_448
    new $P1391, "Undef"
  vivify_448:
    if $P1391, if_1389
.annotate "line", 521
    find_lex $P1415, "$key"
    set $S1416, $P1415
    iseq $I1417, $S1416, "open"
    if $I1417, if_1414
.annotate "line", 534
    .const 'Sub' $P1447 = "82_1267204714.47172" 
    capture_lex $P1447
    $P1447()
    goto if_1414_end
  if_1414:
.annotate "line", 521
    .const 'Sub' $P1419 = "81_1267204714.47172" 
    capture_lex $P1419
    $P1419()
  if_1414_end:
    goto if_1389_end
  if_1389:
.annotate "line", 496
    get_hll_global $P1392, ["PAST"], "Stmts"
.annotate "line", 497
    get_hll_global $P1393, ["PAST"], "Block"
    find_lex $P1394, "$name"
.annotate "line", 498
    get_hll_global $P1395, ["PAST"], "Op"
.annotate "line", 499
    get_hll_global $P1396, ["PAST"], "Var"
    $P1397 = $P1396."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1398, "$name"
    $P1399 = $P1395."new"($P1397, $P1398, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 498
    find_lex $P1400, "$/"
    $P1401 = $P1393."new"($P1399, $P1394 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1400 :named("node"))
.annotate "line", 508
    get_hll_global $P1402, ["PAST"], "Block"
    new $P1403, "String"
    assign $P1403, "!PREFIX__"
    find_lex $P1404, "$name"
    concat $P1405, $P1403, $P1404
.annotate "line", 509
    get_hll_global $P1406, ["PAST"], "Op"
.annotate "line", 510
    get_hll_global $P1407, ["PAST"], "Var"
    $P1408 = $P1407."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1409, "$name"
    $P1410 = $P1406."new"($P1408, $P1409, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 509
    find_lex $P1411, "$/"
    $P1412 = $P1402."new"($P1410, $P1405 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1411 :named("node"))
.annotate "line", 508
    $P1413 = $P1392."new"($P1401, $P1412)
.annotate "line", 496
    store_lex "$past", $P1413
  if_1389_end:
.annotate "line", 548
    find_lex $P1468, "$/"
    find_lex $P1469, "$past"
    $P1470 = $P1468."!make"($P1469)
.annotate "line", 488
    .return ($P1470)
  control_1374:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1471, exception, "payload"
    .return ($P1471)
.end


.namespace ["NQP";"Actions"]
.sub "_block1446"  :anon :subid("82_1267204714.47172") :outer("80_1267204714.47172")
.annotate "line", 535
    new $P1448, "Undef"
    .lex "$regex", $P1448
.annotate "line", 536
    get_hll_global $P1449, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1450, "$/"
    unless_null $P1450, vivify_449
    $P1450 = root_new ['parrot';'Hash']
  vivify_449:
    set $P1451, $P1450["p6regex"]
    unless_null $P1451, vivify_450
    new $P1451, "Undef"
  vivify_450:
    $P1452 = $P1451."ast"()
    get_global $P1453, "@BLOCK"
    $P1454 = $P1453."shift"()
    $P1455 = $P1449($P1452, $P1454)
    store_lex "$regex", $P1455
.annotate "line", 537
    find_lex $P1456, "$regex"
    find_lex $P1457, "$name"
    $P1456."name"($P1457)
.annotate "line", 539
    get_hll_global $P1458, ["PAST"], "Op"
.annotate "line", 541
    get_hll_global $P1459, ["PAST"], "Var"
    new $P1460, "ResizablePMCArray"
    push $P1460, "Regex"
    $P1461 = $P1459."new"("Method" :named("name"), $P1460 :named("namespace"), "package" :named("scope"))
    find_lex $P1462, "$regex"
    $P1463 = $P1458."new"($P1461, $P1462, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 539
    store_lex "$past", $P1463
.annotate "line", 545
    find_lex $P1464, "$regex"
    find_lex $P1465, "$past"
    unless_null $P1465, vivify_451
    $P1465 = root_new ['parrot';'Hash']
    store_lex "$past", $P1465
  vivify_451:
    set $P1465["sink"], $P1464
.annotate "line", 546
    find_lex $P1466, "@MODIFIERS"
    $P1467 = $P1466."shift"()
.annotate "line", 534
    .return ($P1467)
.end


.namespace ["NQP";"Actions"]
.sub "_block1418"  :anon :subid("81_1267204714.47172") :outer("80_1267204714.47172")
.annotate "line", 522
    $P1420 = root_new ['parrot';'Hash']
    .lex "%h", $P1420
.annotate "line", 521
    find_lex $P1421, "%h"
.annotate "line", 523
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_452
    $P1423 = root_new ['parrot';'Hash']
  vivify_452:
    set $P1424, $P1423["sym"]
    unless_null $P1424, vivify_453
    new $P1424, "Undef"
  vivify_453:
    set $S1425, $P1424
    iseq $I1426, $S1425, "token"
    unless $I1426, if_1422_end
    new $P1427, "Integer"
    assign $P1427, 1
    find_lex $P1428, "%h"
    unless_null $P1428, vivify_454
    $P1428 = root_new ['parrot';'Hash']
    store_lex "%h", $P1428
  vivify_454:
    set $P1428["r"], $P1427
  if_1422_end:
.annotate "line", 524
    find_lex $P1430, "$/"
    unless_null $P1430, vivify_455
    $P1430 = root_new ['parrot';'Hash']
  vivify_455:
    set $P1431, $P1430["sym"]
    unless_null $P1431, vivify_456
    new $P1431, "Undef"
  vivify_456:
    set $S1432, $P1431
    iseq $I1433, $S1432, "rule"
    unless $I1433, if_1429_end
    new $P1434, "Integer"
    assign $P1434, 1
    find_lex $P1435, "%h"
    unless_null $P1435, vivify_457
    $P1435 = root_new ['parrot';'Hash']
    store_lex "%h", $P1435
  vivify_457:
    set $P1435["r"], $P1434
    new $P1436, "Integer"
    assign $P1436, 1
    find_lex $P1437, "%h"
    unless_null $P1437, vivify_458
    $P1437 = root_new ['parrot';'Hash']
    store_lex "%h", $P1437
  vivify_458:
    set $P1437["s"], $P1436
  if_1429_end:
.annotate "line", 525
    find_lex $P1438, "@MODIFIERS"
    find_lex $P1439, "%h"
    $P1438."unshift"($P1439)
.annotate "line", 526

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 530
    get_global $P1440, "@BLOCK"
    unless_null $P1440, vivify_459
    $P1440 = root_new ['parrot';'ResizablePMCArray']
  vivify_459:
    set $P1441, $P1440[0]
    unless_null $P1441, vivify_460
    new $P1441, "Undef"
  vivify_460:
    $P1441."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 531
    get_global $P1442, "@BLOCK"
    unless_null $P1442, vivify_461
    $P1442 = root_new ['parrot';'ResizablePMCArray']
  vivify_461:
    set $P1443, $P1442[0]
    unless_null $P1443, vivify_462
    new $P1443, "Undef"
  vivify_462:
    $P1443."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 532
    new $P1444, "Exception"
    set $P1444['type'], 58
    new $P1445, "Integer"
    assign $P1445, 0
    setattribute $P1444, 'payload', $P1445
    throw $P1444
.annotate "line", 521
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("83_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1475
.annotate "line", 552
    new $P1474, 'ExceptionHandler'
    set_addr $P1474, control_1473
    $P1474."handle_types"(58)
    push_eh $P1474
    .lex "self", self
    .lex "$/", param_1475
.annotate "line", 553
    new $P1476, "Undef"
    .lex "$past", $P1476
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_463
    $P1479 = root_new ['parrot';'Hash']
  vivify_463:
    set $P1480, $P1479["args"]
    unless_null $P1480, vivify_464
    new $P1480, "Undef"
  vivify_464:
    if $P1480, if_1478
    get_hll_global $P1485, ["PAST"], "Op"
    find_lex $P1486, "$/"
    $P1487 = $P1485."new"($P1486 :named("node"))
    set $P1477, $P1487
    goto if_1478_end
  if_1478:
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_465
    $P1481 = root_new ['parrot';'Hash']
  vivify_465:
    set $P1482, $P1481["args"]
    unless_null $P1482, vivify_466
    $P1482 = root_new ['parrot';'ResizablePMCArray']
  vivify_466:
    set $P1483, $P1482[0]
    unless_null $P1483, vivify_467
    new $P1483, "Undef"
  vivify_467:
    $P1484 = $P1483."ast"()
    set $P1477, $P1484
  if_1478_end:
    store_lex "$past", $P1477
.annotate "line", 554
    find_lex $P1488, "$past"
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_468
    $P1491 = root_new ['parrot';'Hash']
  vivify_468:
    set $P1492, $P1491["quote"]
    unless_null $P1492, vivify_469
    new $P1492, "Undef"
  vivify_469:
    if $P1492, if_1490
    find_lex $P1496, "$/"
    unless_null $P1496, vivify_470
    $P1496 = root_new ['parrot';'Hash']
  vivify_470:
    set $P1497, $P1496["longname"]
    unless_null $P1497, vivify_471
    new $P1497, "Undef"
  vivify_471:
    set $S1498, $P1497
    new $P1489, 'String'
    set $P1489, $S1498
    goto if_1490_end
  if_1490:
    find_lex $P1493, "$/"
    unless_null $P1493, vivify_472
    $P1493 = root_new ['parrot';'Hash']
  vivify_472:
    set $P1494, $P1493["quote"]
    unless_null $P1494, vivify_473
    new $P1494, "Undef"
  vivify_473:
    $P1495 = $P1494."ast"()
    set $P1489, $P1495
  if_1490_end:
    $P1488."name"($P1489)
.annotate "line", 555
    find_lex $P1499, "$past"
    $P1499."pasttype"("callmethod")
.annotate "line", 556
    find_lex $P1500, "$/"
    find_lex $P1501, "$past"
    $P1502 = $P1500."!make"($P1501)
.annotate "line", 552
    .return ($P1502)
  control_1473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1503, exception, "payload"
    .return ($P1503)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("84_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1507
.annotate "line", 561
    new $P1506, 'ExceptionHandler'
    set_addr $P1506, control_1505
    $P1506."handle_types"(58)
    push_eh $P1506
    .lex "self", self
    .lex "$/", param_1507
.annotate "line", 562
    find_lex $P1508, "$/"
    get_hll_global $P1509, ["PAST"], "Var"
    $P1510 = $P1509."new"("self" :named("name"))
    $P1511 = $P1508."!make"($P1510)
.annotate "line", 561
    .return ($P1511)
  control_1505:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1512, exception, "payload"
    .return ($P1512)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("85_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1516
.annotate "line", 565
    new $P1515, 'ExceptionHandler'
    set_addr $P1515, control_1514
    $P1515."handle_types"(58)
    push_eh $P1515
    .lex "self", self
    .lex "$/", param_1516
.annotate "line", 566
    new $P1517, "Undef"
    .lex "$past", $P1517
    find_lex $P1518, "$/"
    unless_null $P1518, vivify_474
    $P1518 = root_new ['parrot';'Hash']
  vivify_474:
    set $P1519, $P1518["args"]
    unless_null $P1519, vivify_475
    new $P1519, "Undef"
  vivify_475:
    $P1520 = $P1519."ast"()
    store_lex "$past", $P1520
.annotate "line", 567
    find_lex $P1521, "$past"
    find_lex $P1522, "$/"
    unless_null $P1522, vivify_476
    $P1522 = root_new ['parrot';'Hash']
  vivify_476:
    set $P1523, $P1522["identifier"]
    unless_null $P1523, vivify_477
    new $P1523, "Undef"
  vivify_477:
    set $S1524, $P1523
    $P1521."name"($S1524)
.annotate "line", 568
    find_lex $P1525, "$/"
    find_lex $P1526, "$past"
    $P1527 = $P1525."!make"($P1526)
.annotate "line", 565
    .return ($P1527)
  control_1514:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, "payload"
    .return ($P1528)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("86_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1532
.annotate "line", 571
    new $P1531, 'ExceptionHandler'
    set_addr $P1531, control_1530
    $P1531."handle_types"(58)
    push_eh $P1531
    .lex "self", self
    .lex "$/", param_1532
.annotate "line", 572
    $P1533 = root_new ['parrot';'ResizablePMCArray']
    .lex "@ns", $P1533
.annotate "line", 573
    new $P1534, "Undef"
    .lex "$name", $P1534
.annotate "line", 575
    new $P1535, "Undef"
    .lex "$var", $P1535
.annotate "line", 577
    new $P1536, "Undef"
    .lex "$past", $P1536
.annotate "line", 572
    find_lex $P1537, "$/"
    unless_null $P1537, vivify_478
    $P1537 = root_new ['parrot';'Hash']
  vivify_478:
    set $P1538, $P1537["name"]
    unless_null $P1538, vivify_479
    $P1538 = root_new ['parrot';'Hash']
  vivify_479:
    set $P1539, $P1538["identifier"]
    unless_null $P1539, vivify_480
    new $P1539, "Undef"
  vivify_480:
    clone $P1540, $P1539
    store_lex "@ns", $P1540
.annotate "line", 573
    find_lex $P1541, "@ns"
    $P1542 = $P1541."pop"()
    store_lex "$name", $P1542
.annotate "line", 574
    find_lex $P1546, "@ns"
    if $P1546, if_1545
    set $P1544, $P1546
    goto if_1545_end
  if_1545:
    find_lex $P1547, "@ns"
    unless_null $P1547, vivify_481
    $P1547 = root_new ['parrot';'ResizablePMCArray']
  vivify_481:
    set $P1548, $P1547[0]
    unless_null $P1548, vivify_482
    new $P1548, "Undef"
  vivify_482:
    set $S1549, $P1548
    iseq $I1550, $S1549, "GLOBAL"
    new $P1544, 'Integer'
    set $P1544, $I1550
  if_1545_end:
    unless $P1544, if_1543_end
    find_lex $P1551, "@ns"
    $P1551."shift"()
  if_1543_end:
.annotate "line", 576
    get_hll_global $P1552, ["PAST"], "Var"
    find_lex $P1553, "$name"
    set $S1554, $P1553
    find_lex $P1555, "@ns"
    $P1556 = $P1552."new"($S1554 :named("name"), $P1555 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1556
.annotate "line", 577
    find_lex $P1557, "$var"
    store_lex "$past", $P1557
.annotate "line", 578
    find_lex $P1559, "$/"
    unless_null $P1559, vivify_483
    $P1559 = root_new ['parrot';'Hash']
  vivify_483:
    set $P1560, $P1559["args"]
    unless_null $P1560, vivify_484
    new $P1560, "Undef"
  vivify_484:
    unless $P1560, if_1558_end
.annotate "line", 579
    find_lex $P1561, "$/"
    unless_null $P1561, vivify_485
    $P1561 = root_new ['parrot';'Hash']
  vivify_485:
    set $P1562, $P1561["args"]
    unless_null $P1562, vivify_486
    $P1562 = root_new ['parrot';'ResizablePMCArray']
  vivify_486:
    set $P1563, $P1562[0]
    unless_null $P1563, vivify_487
    new $P1563, "Undef"
  vivify_487:
    $P1564 = $P1563."ast"()
    store_lex "$past", $P1564
.annotate "line", 580
    find_lex $P1565, "$past"
    find_lex $P1566, "$var"
    $P1565."unshift"($P1566)
  if_1558_end:
.annotate "line", 582
    find_lex $P1567, "$/"
    find_lex $P1568, "$past"
    $P1569 = $P1567."!make"($P1568)
.annotate "line", 571
    .return ($P1569)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("87_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1574
.annotate "line", 585
    new $P1573, 'ExceptionHandler'
    set_addr $P1573, control_1572
    $P1573."handle_types"(58)
    push_eh $P1573
    .lex "self", self
    .lex "$/", param_1574
.annotate "line", 586
    new $P1575, "Undef"
    .lex "$past", $P1575
.annotate "line", 587
    new $P1576, "Undef"
    .lex "$pirop", $P1576
.annotate "line", 586
    find_lex $P1579, "$/"
    unless_null $P1579, vivify_488
    $P1579 = root_new ['parrot';'Hash']
  vivify_488:
    set $P1580, $P1579["args"]
    unless_null $P1580, vivify_489
    new $P1580, "Undef"
  vivify_489:
    if $P1580, if_1578
    get_hll_global $P1585, ["PAST"], "Op"
    find_lex $P1586, "$/"
    $P1587 = $P1585."new"($P1586 :named("node"))
    set $P1577, $P1587
    goto if_1578_end
  if_1578:
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_490
    $P1581 = root_new ['parrot';'Hash']
  vivify_490:
    set $P1582, $P1581["args"]
    unless_null $P1582, vivify_491
    $P1582 = root_new ['parrot';'ResizablePMCArray']
  vivify_491:
    set $P1583, $P1582[0]
    unless_null $P1583, vivify_492
    new $P1583, "Undef"
  vivify_492:
    $P1584 = $P1583."ast"()
    set $P1577, $P1584
  if_1578_end:
    store_lex "$past", $P1577
.annotate "line", 587
    find_lex $P1588, "$/"
    unless_null $P1588, vivify_493
    $P1588 = root_new ['parrot';'Hash']
  vivify_493:
    set $P1589, $P1588["op"]
    unless_null $P1589, vivify_494
    new $P1589, "Undef"
  vivify_494:
    set $S1590, $P1589
    new $P1591, 'String'
    set $P1591, $S1590
    store_lex "$pirop", $P1591
.annotate "line", 588

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1592 = box $S0
    
    store_lex "$pirop", $P1592
.annotate "line", 595
    find_lex $P1593, "$past"
    find_lex $P1594, "$pirop"
    $P1593."pirop"($P1594)
.annotate "line", 596
    find_lex $P1595, "$past"
    $P1595."pasttype"("pirop")
.annotate "line", 597
    find_lex $P1596, "$/"
    find_lex $P1597, "$past"
    $P1598 = $P1596."!make"($P1597)
.annotate "line", 585
    .return ($P1598)
  control_1572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1599, exception, "payload"
    .return ($P1599)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("88_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1603
.annotate "line", 600
    new $P1602, 'ExceptionHandler'
    set_addr $P1602, control_1601
    $P1602."handle_types"(58)
    push_eh $P1602
    .lex "self", self
    .lex "$/", param_1603
    find_lex $P1604, "$/"
    find_lex $P1605, "$/"
    unless_null $P1605, vivify_495
    $P1605 = root_new ['parrot';'Hash']
  vivify_495:
    set $P1606, $P1605["arglist"]
    unless_null $P1606, vivify_496
    new $P1606, "Undef"
  vivify_496:
    $P1607 = $P1606."ast"()
    $P1608 = $P1604."!make"($P1607)
    .return ($P1608)
  control_1601:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1609, exception, "payload"
    .return ($P1609)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("89_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1613
.annotate "line", 602
    .const 'Sub' $P1624 = "90_1267204714.47172" 
    capture_lex $P1624
    new $P1612, 'ExceptionHandler'
    set_addr $P1612, control_1611
    $P1612."handle_types"(58)
    push_eh $P1612
    .lex "self", self
    .lex "$/", param_1613
.annotate "line", 603
    new $P1614, "Undef"
    .lex "$past", $P1614
.annotate "line", 611
    new $P1615, "Undef"
    .lex "$i", $P1615
.annotate "line", 612
    new $P1616, "Undef"
    .lex "$n", $P1616
.annotate "line", 603
    get_hll_global $P1617, ["PAST"], "Op"
    find_lex $P1618, "$/"
    $P1619 = $P1617."new"("call" :named("pasttype"), $P1618 :named("node"))
    store_lex "$past", $P1619
.annotate "line", 604
    find_lex $P1621, "$/"
    unless_null $P1621, vivify_497
    $P1621 = root_new ['parrot';'Hash']
  vivify_497:
    set $P1622, $P1621["EXPR"]
    unless_null $P1622, vivify_498
    new $P1622, "Undef"
  vivify_498:
    unless $P1622, if_1620_end
    .const 'Sub' $P1624 = "90_1267204714.47172" 
    capture_lex $P1624
    $P1624()
  if_1620_end:
.annotate "line", 611
    new $P1656, "Integer"
    assign $P1656, 0
    store_lex "$i", $P1656
.annotate "line", 612
    find_lex $P1657, "$past"
    $P1658 = $P1657."list"()
    set $N1659, $P1658
    new $P1660, 'Float'
    set $P1660, $N1659
    store_lex "$n", $P1660
.annotate "line", 613
    new $P1688, 'ExceptionHandler'
    set_addr $P1688, loop1687_handler
    $P1688."handle_types"(65, 67, 66)
    push_eh $P1688
  loop1687_test:
    find_lex $P1661, "$i"
    set $N1662, $P1661
    find_lex $P1663, "$n"
    set $N1664, $P1663
    islt $I1665, $N1662, $N1664
    unless $I1665, loop1687_done
  loop1687_redo:
.annotate "line", 614
    find_lex $P1667, "$i"
    set $I1668, $P1667
    find_lex $P1669, "$past"
    unless_null $P1669, vivify_502
    $P1669 = root_new ['parrot';'ResizablePMCArray']
  vivify_502:
    set $P1670, $P1669[$I1668]
    unless_null $P1670, vivify_503
    new $P1670, "Undef"
  vivify_503:
    $S1671 = $P1670."name"()
    iseq $I1672, $S1671, "&prefix:<|>"
    unless $I1672, if_1666_end
.annotate "line", 615
    find_lex $P1673, "$i"
    set $I1674, $P1673
    find_lex $P1675, "$past"
    unless_null $P1675, vivify_504
    $P1675 = root_new ['parrot';'ResizablePMCArray']
  vivify_504:
    set $P1676, $P1675[$I1674]
    unless_null $P1676, vivify_505
    $P1676 = root_new ['parrot';'ResizablePMCArray']
  vivify_505:
    set $P1677, $P1676[0]
    unless_null $P1677, vivify_506
    new $P1677, "Undef"
  vivify_506:
    find_lex $P1678, "$i"
    set $I1679, $P1678
    find_lex $P1680, "$past"
    unless_null $P1680, vivify_507
    $P1680 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$past", $P1680
  vivify_507:
    set $P1680[$I1679], $P1677
.annotate "line", 616
    find_lex $P1681, "$i"
    set $I1682, $P1681
    find_lex $P1683, "$past"
    unless_null $P1683, vivify_508
    $P1683 = root_new ['parrot';'ResizablePMCArray']
  vivify_508:
    set $P1684, $P1683[$I1682]
    unless_null $P1684, vivify_509
    new $P1684, "Undef"
  vivify_509:
    $P1684."flat"(1)
  if_1666_end:
.annotate "line", 614
    find_lex $P1685, "$i"
    clone $P1686, $P1685
    inc $P1685
  loop1687_next:
.annotate "line", 613
    goto loop1687_test
  loop1687_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1689, exception, 'type'
    eq $P1689, 65, loop1687_next
    eq $P1689, 67, loop1687_redo
  loop1687_done:
    pop_eh 
.annotate "line", 620
    find_lex $P1690, "$/"
    find_lex $P1691, "$past"
    $P1692 = $P1690."!make"($P1691)
.annotate "line", 602
    .return ($P1692)
  control_1611:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1693, exception, "payload"
    .return ($P1693)
.end


.namespace ["NQP";"Actions"]
.sub "_block1623"  :anon :subid("90_1267204714.47172") :outer("89_1267204714.47172")
.annotate "line", 604
    .const 'Sub' $P1645 = "91_1267204714.47172" 
    capture_lex $P1645
.annotate "line", 605
    new $P1625, "Undef"
    .lex "$expr", $P1625
    find_lex $P1626, "$/"
    unless_null $P1626, vivify_499
    $P1626 = root_new ['parrot';'Hash']
  vivify_499:
    set $P1627, $P1626["EXPR"]
    unless_null $P1627, vivify_500
    new $P1627, "Undef"
  vivify_500:
    $P1628 = $P1627."ast"()
    store_lex "$expr", $P1628
.annotate "line", 606
    find_lex $P1633, "$expr"
    $S1634 = $P1633."name"()
    iseq $I1635, $S1634, "&infix:<,>"
    if $I1635, if_1632
    new $P1631, 'Integer'
    set $P1631, $I1635
    goto if_1632_end
  if_1632:
    find_lex $P1636, "$expr"
    $P1637 = $P1636."named"()
    isfalse $I1638, $P1637
    new $P1631, 'Integer'
    set $P1631, $I1638
  if_1632_end:
    if $P1631, if_1630
.annotate "line", 609
    find_lex $P1653, "$past"
    find_lex $P1654, "$expr"
    $P1655 = $P1653."push"($P1654)
    set $P1629, $P1655
.annotate "line", 606
    goto if_1630_end
  if_1630:
.annotate "line", 607
    find_lex $P1640, "$expr"
    $P1641 = $P1640."list"()
    defined $I1642, $P1641
    unless $I1642, for_undef_501
    iter $P1639, $P1641
    new $P1651, 'ExceptionHandler'
    set_addr $P1651, loop1650_handler
    $P1651."handle_types"(65, 67, 66)
    push_eh $P1651
  loop1650_test:
    unless $P1639, loop1650_done
    shift $P1643, $P1639
  loop1650_redo:
    .const 'Sub' $P1645 = "91_1267204714.47172" 
    capture_lex $P1645
    $P1645($P1643)
  loop1650_next:
    goto loop1650_test
  loop1650_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1652, exception, 'type'
    eq $P1652, 65, loop1650_next
    eq $P1652, 67, loop1650_redo
  loop1650_done:
    pop_eh 
  for_undef_501:
.annotate "line", 606
    set $P1629, $P1639
  if_1630_end:
.annotate "line", 604
    .return ($P1629)
.end


.namespace ["NQP";"Actions"]
.sub "_block1644"  :anon :subid("91_1267204714.47172") :outer("90_1267204714.47172")
    .param pmc param_1646
.annotate "line", 607
    .lex "$_", param_1646
    find_lex $P1647, "$past"
    find_lex $P1648, "$_"
    $P1649 = $P1647."push"($P1648)
    .return ($P1649)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("92_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1697
.annotate "line", 624
    new $P1696, 'ExceptionHandler'
    set_addr $P1696, control_1695
    $P1696."handle_types"(58)
    push_eh $P1696
    .lex "self", self
    .lex "$/", param_1697
    find_lex $P1698, "$/"
    find_lex $P1699, "$/"
    unless_null $P1699, vivify_510
    $P1699 = root_new ['parrot';'Hash']
  vivify_510:
    set $P1700, $P1699["value"]
    unless_null $P1700, vivify_511
    new $P1700, "Undef"
  vivify_511:
    $P1701 = $P1700."ast"()
    $P1702 = $P1698."!make"($P1701)
    .return ($P1702)
  control_1695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1703, exception, "payload"
    .return ($P1703)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("93_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1707
.annotate "line", 626
    new $P1706, 'ExceptionHandler'
    set_addr $P1706, control_1705
    $P1706."handle_types"(58)
    push_eh $P1706
    .lex "self", self
    .lex "$/", param_1707
.annotate "line", 627
    find_lex $P1708, "$/"
.annotate "line", 628
    find_lex $P1711, "$/"
    unless_null $P1711, vivify_512
    $P1711 = root_new ['parrot';'Hash']
  vivify_512:
    set $P1712, $P1711["EXPR"]
    unless_null $P1712, vivify_513
    new $P1712, "Undef"
  vivify_513:
    if $P1712, if_1710
.annotate "line", 629
    get_hll_global $P1717, ["PAST"], "Op"
    find_lex $P1718, "$/"
    $P1719 = $P1717."new"("list" :named("pasttype"), $P1718 :named("node"))
    set $P1709, $P1719
.annotate "line", 628
    goto if_1710_end
  if_1710:
    find_lex $P1713, "$/"
    unless_null $P1713, vivify_514
    $P1713 = root_new ['parrot';'Hash']
  vivify_514:
    set $P1714, $P1713["EXPR"]
    unless_null $P1714, vivify_515
    $P1714 = root_new ['parrot';'ResizablePMCArray']
  vivify_515:
    set $P1715, $P1714[0]
    unless_null $P1715, vivify_516
    new $P1715, "Undef"
  vivify_516:
    $P1716 = $P1715."ast"()
    set $P1709, $P1716
  if_1710_end:
    $P1720 = $P1708."!make"($P1709)
.annotate "line", 626
    .return ($P1720)
  control_1705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1721, exception, "payload"
    .return ($P1721)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("94_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1725
.annotate "line", 632
    new $P1724, 'ExceptionHandler'
    set_addr $P1724, control_1723
    $P1724."handle_types"(58)
    push_eh $P1724
    .lex "self", self
    .lex "$/", param_1725
.annotate "line", 633
    new $P1726, "Undef"
    .lex "$past", $P1726
.annotate "line", 632
    find_lex $P1727, "$past"
.annotate "line", 634
    find_lex $P1729, "$/"
    unless_null $P1729, vivify_517
    $P1729 = root_new ['parrot';'Hash']
  vivify_517:
    set $P1730, $P1729["EXPR"]
    unless_null $P1730, vivify_518
    new $P1730, "Undef"
  vivify_518:
    if $P1730, if_1728
.annotate "line", 641
    get_hll_global $P1742, ["PAST"], "Op"
    $P1743 = $P1742."new"("list" :named("pasttype"))
    store_lex "$past", $P1743
.annotate "line", 640
    goto if_1728_end
  if_1728:
.annotate "line", 635
    find_lex $P1731, "$/"
    unless_null $P1731, vivify_519
    $P1731 = root_new ['parrot';'Hash']
  vivify_519:
    set $P1732, $P1731["EXPR"]
    unless_null $P1732, vivify_520
    $P1732 = root_new ['parrot';'ResizablePMCArray']
  vivify_520:
    set $P1733, $P1732[0]
    unless_null $P1733, vivify_521
    new $P1733, "Undef"
  vivify_521:
    $P1734 = $P1733."ast"()
    store_lex "$past", $P1734
.annotate "line", 636
    find_lex $P1736, "$past"
    $S1737 = $P1736."name"()
    isne $I1738, $S1737, "&infix:<,>"
    unless $I1738, if_1735_end
.annotate "line", 637
    get_hll_global $P1739, ["PAST"], "Op"
    find_lex $P1740, "$past"
    $P1741 = $P1739."new"($P1740, "list" :named("pasttype"))
    store_lex "$past", $P1741
  if_1735_end:
  if_1728_end:
.annotate "line", 643
    find_lex $P1744, "$past"
    $P1744."name"("&circumfix:<[ ]>")
.annotate "line", 644
    find_lex $P1745, "$/"
    find_lex $P1746, "$past"
    $P1747 = $P1745."!make"($P1746)
.annotate "line", 632
    .return ($P1747)
  control_1723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1748, exception, "payload"
    .return ($P1748)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("95_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1752
.annotate "line", 647
    new $P1751, 'ExceptionHandler'
    set_addr $P1751, control_1750
    $P1751."handle_types"(58)
    push_eh $P1751
    .lex "self", self
    .lex "$/", param_1752
    find_lex $P1753, "$/"
    find_lex $P1754, "$/"
    unless_null $P1754, vivify_522
    $P1754 = root_new ['parrot';'Hash']
  vivify_522:
    set $P1755, $P1754["quote_EXPR"]
    unless_null $P1755, vivify_523
    new $P1755, "Undef"
  vivify_523:
    $P1756 = $P1755."ast"()
    $P1757 = $P1753."!make"($P1756)
    .return ($P1757)
  control_1750:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1758, exception, "payload"
    .return ($P1758)
.end


.namespace ["NQP";"Actions"]
.sub unicode:"circumfix:sym<\x{ab} \x{bb}>"  :subid("96_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1762
.annotate "line", 648
    new $P1761, 'ExceptionHandler'
    set_addr $P1761, control_1760
    $P1761."handle_types"(58)
    push_eh $P1761
    .lex "self", self
    .lex "$/", param_1762
    find_lex $P1763, "$/"
    find_lex $P1764, "$/"
    unless_null $P1764, vivify_524
    $P1764 = root_new ['parrot';'Hash']
  vivify_524:
    set $P1765, $P1764["quote_EXPR"]
    unless_null $P1765, vivify_525
    new $P1765, "Undef"
  vivify_525:
    $P1766 = $P1765."ast"()
    $P1767 = $P1763."!make"($P1766)
    .return ($P1767)
  control_1760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1768, exception, "payload"
    .return ($P1768)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("97_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1772
.annotate "line", 650
    new $P1771, 'ExceptionHandler'
    set_addr $P1771, control_1770
    $P1771."handle_types"(58)
    push_eh $P1771
    .lex "self", self
    .lex "$/", param_1772
.annotate "line", 651
    find_lex $P1773, "$/"
    find_lex $P1776, "$/"
    unless_null $P1776, vivify_526
    $P1776 = root_new ['parrot';'Hash']
  vivify_526:
    set $P1777, $P1776["pblock"]
    unless_null $P1777, vivify_527
    $P1777 = root_new ['parrot';'Hash']
  vivify_527:
    set $P1778, $P1777["blockoid"]
    unless_null $P1778, vivify_528
    $P1778 = root_new ['parrot';'Hash']
  vivify_528:
    set $P1779, $P1778["statementlist"]
    unless_null $P1779, vivify_529
    $P1779 = root_new ['parrot';'Hash']
  vivify_529:
    set $P1780, $P1779["statement"]
    unless_null $P1780, vivify_530
    new $P1780, "Undef"
  vivify_530:
    set $N1781, $P1780
    isgt $I1782, $N1781, 0.0
    if $I1782, if_1775
.annotate "line", 653
    $P1786 = "vivitype"("%")
    set $P1774, $P1786
.annotate "line", 651
    goto if_1775_end
  if_1775:
.annotate "line", 652
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_531
    $P1783 = root_new ['parrot';'Hash']
  vivify_531:
    set $P1784, $P1783["pblock"]
    unless_null $P1784, vivify_532
    new $P1784, "Undef"
  vivify_532:
    $P1785 = $P1784."ast"()
    set $P1774, $P1785
  if_1775_end:
    $P1787 = $P1773."!make"($P1774)
.annotate "line", 650
    .return ($P1787)
  control_1770:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1788, exception, "payload"
    .return ($P1788)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("98_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1792
.annotate "line", 656
    new $P1791, 'ExceptionHandler'
    set_addr $P1791, control_1790
    $P1791."handle_types"(58)
    push_eh $P1791
    .lex "self", self
    .lex "$/", param_1792
.annotate "line", 657
    new $P1793, "Undef"
    .lex "$name", $P1793
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_533
    $P1796 = root_new ['parrot';'Hash']
  vivify_533:
    set $P1797, $P1796["sigil"]
    unless_null $P1797, vivify_534
    new $P1797, "Undef"
  vivify_534:
    set $S1798, $P1797
    iseq $I1799, $S1798, "@"
    if $I1799, if_1795
.annotate "line", 658
    find_lex $P1803, "$/"
    unless_null $P1803, vivify_535
    $P1803 = root_new ['parrot';'Hash']
  vivify_535:
    set $P1804, $P1803["sigil"]
    unless_null $P1804, vivify_536
    new $P1804, "Undef"
  vivify_536:
    set $S1805, $P1804
    iseq $I1806, $S1805, "%"
    if $I1806, if_1802
    new $P1808, "String"
    assign $P1808, "item"
    set $P1801, $P1808
    goto if_1802_end
  if_1802:
    new $P1807, "String"
    assign $P1807, "hash"
    set $P1801, $P1807
  if_1802_end:
    set $P1794, $P1801
.annotate "line", 657
    goto if_1795_end
  if_1795:
    new $P1800, "String"
    assign $P1800, "list"
    set $P1794, $P1800
  if_1795_end:
    store_lex "$name", $P1794
.annotate "line", 660
    find_lex $P1809, "$/"
    get_hll_global $P1810, ["PAST"], "Op"
    find_lex $P1811, "$name"
    find_lex $P1812, "$/"
    unless_null $P1812, vivify_537
    $P1812 = root_new ['parrot';'Hash']
  vivify_537:
    set $P1813, $P1812["semilist"]
    unless_null $P1813, vivify_538
    new $P1813, "Undef"
  vivify_538:
    $P1814 = $P1813."ast"()
    $P1815 = $P1810."new"($P1814, "callmethod" :named("pasttype"), $P1811 :named("name"))
    $P1816 = $P1809."!make"($P1815)
.annotate "line", 656
    .return ($P1816)
  control_1790:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1817, exception, "payload"
    .return ($P1817)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("99_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1821
.annotate "line", 663
    new $P1820, 'ExceptionHandler'
    set_addr $P1820, control_1819
    $P1820."handle_types"(58)
    push_eh $P1820
    .lex "self", self
    .lex "$/", param_1821
    find_lex $P1822, "$/"
    find_lex $P1823, "$/"
    unless_null $P1823, vivify_539
    $P1823 = root_new ['parrot';'Hash']
  vivify_539:
    set $P1824, $P1823["statement"]
    unless_null $P1824, vivify_540
    new $P1824, "Undef"
  vivify_540:
    $P1825 = $P1824."ast"()
    $P1826 = $P1822."!make"($P1825)
    .return ($P1826)
  control_1819:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1827, exception, "payload"
    .return ($P1827)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("100_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1831
.annotate "line", 665
    new $P1830, 'ExceptionHandler'
    set_addr $P1830, control_1829
    $P1830."handle_types"(58)
    push_eh $P1830
    .lex "self", self
    .lex "$/", param_1831
.annotate "line", 666
    find_lex $P1832, "$/"
    get_hll_global $P1833, ["PAST"], "Var"
    find_lex $P1834, "$/"
    unless_null $P1834, vivify_541
    $P1834 = root_new ['parrot';'Hash']
  vivify_541:
    set $P1835, $P1834["EXPR"]
    unless_null $P1835, vivify_542
    new $P1835, "Undef"
  vivify_542:
    $P1836 = $P1835."ast"()
.annotate "line", 668
    $P1837 = "vivitype"("@")
    $P1838 = $P1833."new"($P1836, "keyed_int" :named("scope"), "Undef" :named("viviself"), $P1837 :named("vivibase"))
.annotate "line", 666
    $P1839 = $P1832."!make"($P1838)
.annotate "line", 665
    .return ($P1839)
  control_1829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1840, exception, "payload"
    .return ($P1840)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("101_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1844
.annotate "line", 671
    new $P1843, 'ExceptionHandler'
    set_addr $P1843, control_1842
    $P1843."handle_types"(58)
    push_eh $P1843
    .lex "self", self
    .lex "$/", param_1844
.annotate "line", 672
    find_lex $P1845, "$/"
    get_hll_global $P1846, ["PAST"], "Var"
    find_lex $P1847, "$/"
    unless_null $P1847, vivify_543
    $P1847 = root_new ['parrot';'Hash']
  vivify_543:
    set $P1848, $P1847["EXPR"]
    unless_null $P1848, vivify_544
    new $P1848, "Undef"
  vivify_544:
    $P1849 = $P1848."ast"()
.annotate "line", 674
    $P1850 = "vivitype"("%")
    $P1851 = $P1846."new"($P1849, "keyed" :named("scope"), "Undef" :named("viviself"), $P1850 :named("vivibase"))
.annotate "line", 672
    $P1852 = $P1845."!make"($P1851)
.annotate "line", 671
    .return ($P1852)
  control_1842:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1853, exception, "payload"
    .return ($P1853)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("102_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1857
.annotate "line", 677
    new $P1856, 'ExceptionHandler'
    set_addr $P1856, control_1855
    $P1856."handle_types"(58)
    push_eh $P1856
    .lex "self", self
    .lex "$/", param_1857
.annotate "line", 678
    find_lex $P1858, "$/"
    get_hll_global $P1859, ["PAST"], "Var"
    find_lex $P1860, "$/"
    unless_null $P1860, vivify_545
    $P1860 = root_new ['parrot';'Hash']
  vivify_545:
    set $P1861, $P1860["quote_EXPR"]
    unless_null $P1861, vivify_546
    new $P1861, "Undef"
  vivify_546:
    $P1862 = $P1861."ast"()
.annotate "line", 680
    $P1863 = "vivitype"("%")
    $P1864 = $P1859."new"($P1862, "keyed" :named("scope"), "Undef" :named("viviself"), $P1863 :named("vivibase"))
.annotate "line", 678
    $P1865 = $P1858."!make"($P1864)
.annotate "line", 677
    .return ($P1865)
  control_1855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1866, exception, "payload"
    .return ($P1866)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("103_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1870
.annotate "line", 683
    new $P1869, 'ExceptionHandler'
    set_addr $P1869, control_1868
    $P1869."handle_types"(58)
    push_eh $P1869
    .lex "self", self
    .lex "$/", param_1870
.annotate "line", 684
    find_lex $P1871, "$/"
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_547
    $P1872 = root_new ['parrot';'Hash']
  vivify_547:
    set $P1873, $P1872["arglist"]
    unless_null $P1873, vivify_548
    new $P1873, "Undef"
  vivify_548:
    $P1874 = $P1873."ast"()
    $P1875 = $P1871."!make"($P1874)
.annotate "line", 683
    .return ($P1875)
  control_1868:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1876, exception, "payload"
    .return ($P1876)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("104_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1880
.annotate "line", 687
    new $P1879, 'ExceptionHandler'
    set_addr $P1879, control_1878
    $P1879."handle_types"(58)
    push_eh $P1879
    .lex "self", self
    .lex "$/", param_1880
.annotate "line", 688
    find_lex $P1881, "$/"
    find_lex $P1884, "$/"
    unless_null $P1884, vivify_549
    $P1884 = root_new ['parrot';'Hash']
  vivify_549:
    set $P1885, $P1884["quote"]
    unless_null $P1885, vivify_550
    new $P1885, "Undef"
  vivify_550:
    if $P1885, if_1883
    find_lex $P1889, "$/"
    unless_null $P1889, vivify_551
    $P1889 = root_new ['parrot';'Hash']
  vivify_551:
    set $P1890, $P1889["number"]
    unless_null $P1890, vivify_552
    new $P1890, "Undef"
  vivify_552:
    $P1891 = $P1890."ast"()
    set $P1882, $P1891
    goto if_1883_end
  if_1883:
    find_lex $P1886, "$/"
    unless_null $P1886, vivify_553
    $P1886 = root_new ['parrot';'Hash']
  vivify_553:
    set $P1887, $P1886["quote"]
    unless_null $P1887, vivify_554
    new $P1887, "Undef"
  vivify_554:
    $P1888 = $P1887."ast"()
    set $P1882, $P1888
  if_1883_end:
    $P1892 = $P1881."!make"($P1882)
.annotate "line", 687
    .return ($P1892)
  control_1878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1893, exception, "payload"
    .return ($P1893)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("105_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1897
.annotate "line", 691
    new $P1896, 'ExceptionHandler'
    set_addr $P1896, control_1895
    $P1896."handle_types"(58)
    push_eh $P1896
    .lex "self", self
    .lex "$/", param_1897
.annotate "line", 692
    new $P1898, "Undef"
    .lex "$value", $P1898
    find_lex $P1901, "$/"
    unless_null $P1901, vivify_555
    $P1901 = root_new ['parrot';'Hash']
  vivify_555:
    set $P1902, $P1901["dec_number"]
    unless_null $P1902, vivify_556
    new $P1902, "Undef"
  vivify_556:
    if $P1902, if_1900
    find_lex $P1906, "$/"
    unless_null $P1906, vivify_557
    $P1906 = root_new ['parrot';'Hash']
  vivify_557:
    set $P1907, $P1906["integer"]
    unless_null $P1907, vivify_558
    new $P1907, "Undef"
  vivify_558:
    $P1908 = $P1907."ast"()
    set $P1899, $P1908
    goto if_1900_end
  if_1900:
    find_lex $P1903, "$/"
    unless_null $P1903, vivify_559
    $P1903 = root_new ['parrot';'Hash']
  vivify_559:
    set $P1904, $P1903["dec_number"]
    unless_null $P1904, vivify_560
    new $P1904, "Undef"
  vivify_560:
    $P1905 = $P1904."ast"()
    set $P1899, $P1905
  if_1900_end:
    store_lex "$value", $P1899
.annotate "line", 693
    find_lex $P1910, "$/"
    unless_null $P1910, vivify_561
    $P1910 = root_new ['parrot';'Hash']
  vivify_561:
    set $P1911, $P1910["sign"]
    unless_null $P1911, vivify_562
    new $P1911, "Undef"
  vivify_562:
    set $S1912, $P1911
    iseq $I1913, $S1912, "-"
    unless $I1913, if_1909_end
    find_lex $P1914, "$value"
    neg $P1915, $P1914
    store_lex "$value", $P1915
  if_1909_end:
.annotate "line", 694
    find_lex $P1916, "$/"
    get_hll_global $P1917, ["PAST"], "Val"
    find_lex $P1918, "$value"
    $P1919 = $P1917."new"($P1918 :named("value"))
    $P1920 = $P1916."!make"($P1919)
.annotate "line", 691
    .return ($P1920)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1921, exception, "payload"
    .return ($P1921)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("106_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1925
.annotate "line", 697
    new $P1924, 'ExceptionHandler'
    set_addr $P1924, control_1923
    $P1924."handle_types"(58)
    push_eh $P1924
    .lex "self", self
    .lex "$/", param_1925
    find_lex $P1926, "$/"
    find_lex $P1927, "$/"
    unless_null $P1927, vivify_563
    $P1927 = root_new ['parrot';'Hash']
  vivify_563:
    set $P1928, $P1927["quote_EXPR"]
    unless_null $P1928, vivify_564
    new $P1928, "Undef"
  vivify_564:
    $P1929 = $P1928."ast"()
    $P1930 = $P1926."!make"($P1929)
    .return ($P1930)
  control_1923:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1931, exception, "payload"
    .return ($P1931)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("107_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1935
.annotate "line", 698
    new $P1934, 'ExceptionHandler'
    set_addr $P1934, control_1933
    $P1934."handle_types"(58)
    push_eh $P1934
    .lex "self", self
    .lex "$/", param_1935
    find_lex $P1936, "$/"
    find_lex $P1937, "$/"
    unless_null $P1937, vivify_565
    $P1937 = root_new ['parrot';'Hash']
  vivify_565:
    set $P1938, $P1937["quote_EXPR"]
    unless_null $P1938, vivify_566
    new $P1938, "Undef"
  vivify_566:
    $P1939 = $P1938."ast"()
    $P1940 = $P1936."!make"($P1939)
    .return ($P1940)
  control_1933:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1941, exception, "payload"
    .return ($P1941)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("108_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1945
.annotate "line", 699
    new $P1944, 'ExceptionHandler'
    set_addr $P1944, control_1943
    $P1944."handle_types"(58)
    push_eh $P1944
    .lex "self", self
    .lex "$/", param_1945
    find_lex $P1946, "$/"
    find_lex $P1947, "$/"
    unless_null $P1947, vivify_567
    $P1947 = root_new ['parrot';'Hash']
  vivify_567:
    set $P1948, $P1947["quote_EXPR"]
    unless_null $P1948, vivify_568
    new $P1948, "Undef"
  vivify_568:
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
.sub "quote:sym<q>"  :subid("109_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1955
.annotate "line", 700
    new $P1954, 'ExceptionHandler'
    set_addr $P1954, control_1953
    $P1954."handle_types"(58)
    push_eh $P1954
    .lex "self", self
    .lex "$/", param_1955
    find_lex $P1956, "$/"
    find_lex $P1957, "$/"
    unless_null $P1957, vivify_569
    $P1957 = root_new ['parrot';'Hash']
  vivify_569:
    set $P1958, $P1957["quote_EXPR"]
    unless_null $P1958, vivify_570
    new $P1958, "Undef"
  vivify_570:
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
.sub "quote:sym<Q>"  :subid("110_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1965
.annotate "line", 701
    new $P1964, 'ExceptionHandler'
    set_addr $P1964, control_1963
    $P1964."handle_types"(58)
    push_eh $P1964
    .lex "self", self
    .lex "$/", param_1965
    find_lex $P1966, "$/"
    find_lex $P1967, "$/"
    unless_null $P1967, vivify_571
    $P1967 = root_new ['parrot';'Hash']
  vivify_571:
    set $P1968, $P1967["quote_EXPR"]
    unless_null $P1968, vivify_572
    new $P1968, "Undef"
  vivify_572:
    $P1969 = $P1968."ast"()
    $P1970 = $P1966."!make"($P1969)
    .return ($P1970)
  control_1963:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1971, exception, "payload"
    .return ($P1971)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("111_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1975
.annotate "line", 702
    new $P1974, 'ExceptionHandler'
    set_addr $P1974, control_1973
    $P1974."handle_types"(58)
    push_eh $P1974
    .lex "self", self
    .lex "$/", param_1975
.annotate "line", 703
    find_lex $P1976, "$/"
    get_hll_global $P1977, ["PAST"], "Op"
    find_lex $P1978, "$/"
    unless_null $P1978, vivify_573
    $P1978 = root_new ['parrot';'Hash']
  vivify_573:
    set $P1979, $P1978["quote_EXPR"]
    unless_null $P1979, vivify_574
    new $P1979, "Undef"
  vivify_574:
    $P1980 = $P1979."ast"()
    $P1981 = $P1980."value"()
    find_lex $P1982, "$/"
    $P1983 = $P1977."new"($P1981 :named("inline"), "inline" :named("pasttype"), $P1982 :named("node"))
    $P1984 = $P1976."!make"($P1983)
.annotate "line", 702
    .return ($P1984)
  control_1973:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1985, exception, "payload"
    .return ($P1985)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym</ />"  :subid("112_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_1989
    .param pmc param_1990 :optional
    .param int has_param_1990 :opt_flag
.annotate "line", 708
    new $P1988, 'ExceptionHandler'
    set_addr $P1988, control_1987
    $P1988."handle_types"(58)
    push_eh $P1988
    .lex "self", self
    .lex "$/", param_1989
    if has_param_1990, optparam_575
    new $P1991, "Undef"
    set param_1990, $P1991
  optparam_575:
    .lex "$key", param_1990
.annotate "line", 718
    new $P1992, "Undef"
    .lex "$regex", $P1992
.annotate "line", 720
    new $P1993, "Undef"
    .lex "$past", $P1993
.annotate "line", 709
    find_lex $P1995, "$key"
    set $S1996, $P1995
    iseq $I1997, $S1996, "open"
    unless $I1997, if_1994_end
.annotate "line", 710

            null $P0
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 714
    get_global $P1998, "@BLOCK"
    unless_null $P1998, vivify_576
    $P1998 = root_new ['parrot';'ResizablePMCArray']
  vivify_576:
    set $P1999, $P1998[0]
    unless_null $P1999, vivify_577
    new $P1999, "Undef"
  vivify_577:
    $P1999."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 715
    get_global $P2000, "@BLOCK"
    unless_null $P2000, vivify_578
    $P2000 = root_new ['parrot';'ResizablePMCArray']
  vivify_578:
    set $P2001, $P2000[0]
    unless_null $P2001, vivify_579
    new $P2001, "Undef"
  vivify_579:
    $P2001."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 716
    new $P2002, "Exception"
    set $P2002['type'], 58
    new $P2003, "Integer"
    assign $P2003, 0
    setattribute $P2002, 'payload', $P2003
    throw $P2002
  if_1994_end:
.annotate "line", 719
    get_hll_global $P2004, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P2005, "$/"
    unless_null $P2005, vivify_580
    $P2005 = root_new ['parrot';'Hash']
  vivify_580:
    set $P2006, $P2005["p6regex"]
    unless_null $P2006, vivify_581
    new $P2006, "Undef"
  vivify_581:
    $P2007 = $P2006."ast"()
    get_global $P2008, "@BLOCK"
    $P2009 = $P2008."shift"()
    $P2010 = $P2004($P2007, $P2009)
    store_lex "$regex", $P2010
.annotate "line", 721
    get_hll_global $P2011, ["PAST"], "Op"
.annotate "line", 723
    get_hll_global $P2012, ["PAST"], "Var"
    new $P2013, "ResizablePMCArray"
    push $P2013, "Regex"
    $P2014 = $P2012."new"("Regex" :named("name"), $P2013 :named("namespace"), "package" :named("scope"))
    find_lex $P2015, "$regex"
    $P2016 = $P2011."new"($P2014, $P2015, "callmethod" :named("pasttype"), "new" :named("name"))
.annotate "line", 721
    store_lex "$past", $P2016
.annotate "line", 727
    find_lex $P2017, "$regex"
    find_lex $P2018, "$past"
    unless_null $P2018, vivify_582
    $P2018 = root_new ['parrot';'Hash']
    store_lex "$past", $P2018
  vivify_582:
    set $P2018["sink"], $P2017
.annotate "line", 728
    find_lex $P2019, "$/"
    find_lex $P2020, "$past"
    $P2021 = $P2019."!make"($P2020)
.annotate "line", 708
    .return ($P2021)
  control_1987:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2022, exception, "payload"
    .return ($P2022)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("113_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2026
.annotate "line", 731
    new $P2025, 'ExceptionHandler'
    set_addr $P2025, control_2024
    $P2025."handle_types"(58)
    push_eh $P2025
    .lex "self", self
    .lex "$/", param_2026
    find_lex $P2027, "$/"
    find_lex $P2028, "$/"
    unless_null $P2028, vivify_583
    $P2028 = root_new ['parrot';'Hash']
  vivify_583:
    set $P2029, $P2028["variable"]
    unless_null $P2029, vivify_584
    new $P2029, "Undef"
  vivify_584:
    $P2030 = $P2029."ast"()
    $P2031 = $P2027."!make"($P2030)
    .return ($P2031)
  control_2024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2032, exception, "payload"
    .return ($P2032)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("114_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2036
.annotate "line", 732
    new $P2035, 'ExceptionHandler'
    set_addr $P2035, control_2034
    $P2035."handle_types"(58)
    push_eh $P2035
    .lex "self", self
    .lex "$/", param_2036
.annotate "line", 733
    find_lex $P2037, "$/"
    get_hll_global $P2038, ["PAST"], "Op"
.annotate "line", 734
    find_lex $P2039, "$/"
    unless_null $P2039, vivify_585
    $P2039 = root_new ['parrot';'Hash']
  vivify_585:
    set $P2040, $P2039["block"]
    unless_null $P2040, vivify_586
    new $P2040, "Undef"
  vivify_586:
    $P2041 = $P2040."ast"()
    $P2042 = "block_immediate"($P2041)
    find_lex $P2043, "$/"
    $P2044 = $P2038."new"($P2042, "set S*" :named("pirop"), $P2043 :named("node"))
.annotate "line", 733
    $P2045 = $P2037."!make"($P2044)
.annotate "line", 732
    .return ($P2045)
  control_2034:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2046, exception, "payload"
    .return ($P2046)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("115_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2050
.annotate "line", 740
    new $P2049, 'ExceptionHandler'
    set_addr $P2049, control_2048
    $P2049."handle_types"(58)
    push_eh $P2049
    .lex "self", self
    .lex "$/", param_2050
    find_lex $P2051, "$/"
    find_lex $P2052, "$/"
    unless_null $P2052, vivify_587
    $P2052 = root_new ['parrot';'Hash']
  vivify_587:
    set $P2053, $P2052["dotty"]
    unless_null $P2053, vivify_588
    new $P2053, "Undef"
  vivify_588:
    $P2054 = $P2053."ast"()
    $P2055 = $P2051."!make"($P2054)
    .return ($P2055)
  control_2048:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2056, exception, "payload"
    .return ($P2056)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("116_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2060
.annotate "line", 742
    new $P2059, 'ExceptionHandler'
    set_addr $P2059, control_2058
    $P2059."handle_types"(58)
    push_eh $P2059
    .lex "self", self
    .lex "$/", param_2060
.annotate "line", 743
    find_lex $P2061, "$/"
    get_hll_global $P2062, ["PAST"], "Op"
.annotate "line", 744
    new $P2063, "ResizablePMCArray"
    push $P2063, "    clone %r, %0"
    push $P2063, "    inc %0"
    $P2064 = $P2062."new"("postfix:<++>" :named("name"), $P2063 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 743
    $P2065 = $P2061."!make"($P2064)
.annotate "line", 742
    .return ($P2065)
  control_2058:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2066, exception, "payload"
    .return ($P2066)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("117_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2070
.annotate "line", 748
    new $P2069, 'ExceptionHandler'
    set_addr $P2069, control_2068
    $P2069."handle_types"(58)
    push_eh $P2069
    .lex "self", self
    .lex "$/", param_2070
.annotate "line", 749
    find_lex $P2071, "$/"
    get_hll_global $P2072, ["PAST"], "Op"
.annotate "line", 750
    new $P2073, "ResizablePMCArray"
    push $P2073, "    clone %r, %0"
    push $P2073, "    dec %0"
    $P2074 = $P2072."new"("postfix:<-->" :named("name"), $P2073 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 749
    $P2075 = $P2071."!make"($P2074)
.annotate "line", 748
    .return ($P2075)
  control_2068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2076, exception, "payload"
    .return ($P2076)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("118_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2080
.annotate "line", 754
    new $P2079, 'ExceptionHandler'
    set_addr $P2079, control_2078
    $P2079."handle_types"(58)
    push_eh $P2079
    .lex "self", self
    .lex "$/", param_2080
.annotate "line", 755
    find_lex $P2081, "$/"
    get_hll_global $P2082, ["PAST"], "Op"
.annotate "line", 756
    get_hll_global $P2083, ["PAST"], "Var"
    $P2084 = $P2083."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P2085, "$/"
    $P2086 = $P2082."new"($P2084, "callmethod" :named("pasttype"), "!make" :named("name"), $P2085 :named("node"))
.annotate "line", 755
    $P2087 = $P2081."!make"($P2086)
.annotate "line", 754
    .return ($P2087)
  control_2078:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2088, exception, "payload"
    .return ($P2088)
.end


.namespace ["NQP";"Actions"]
.sub "infix:sym<~~>"  :subid("119_1267204714.47172") :method :outer("11_1267204714.47172")
    .param pmc param_2092
.annotate "line", 763
    new $P2091, 'ExceptionHandler'
    set_addr $P2091, control_2090
    $P2091."handle_types"(58)
    push_eh $P2091
    .lex "self", self
    .lex "$/", param_2092
.annotate "line", 764
    find_lex $P2093, "$/"
    get_hll_global $P2094, ["PAST"], "Op"
    find_lex $P2095, "$/"
    $P2096 = $P2094."new"("callmethod" :named("pasttype"), "ACCEPTS" :named("name"), $P2095 :named("node"))
    $P2097 = $P2093."!make"($P2096)
.annotate "line", 763
    .return ($P2097)
  control_2090:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2098, exception, "payload"
    .return ($P2098)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block2099"  :subid("120_1267204714.47172") :outer("11_1267204714.47172")
.annotate "line", 768
    .const 'Sub' $P2135 = "124_1267204714.47172" 
    capture_lex $P2135
    .const 'Sub' $P2125 = "123_1267204714.47172" 
    capture_lex $P2125
    .const 'Sub' $P2115 = "122_1267204714.47172" 
    capture_lex $P2115
    .const 'Sub' $P2101 = "121_1267204714.47172" 
    capture_lex $P2101
.annotate "line", 779
    .const 'Sub' $P2135 = "124_1267204714.47172" 
    capture_lex $P2135
.annotate "line", 768
    .return ($P2135)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("121_1267204714.47172") :method :outer("120_1267204714.47172")
    .param pmc param_2104
.annotate "line", 770
    new $P2103, 'ExceptionHandler'
    set_addr $P2103, control_2102
    $P2103."handle_types"(58)
    push_eh $P2103
    .lex "self", self
    .lex "$/", param_2104
.annotate "line", 771
    new $P2105, "Undef"
    .lex "$past", $P2105
    find_lex $P2106, "$/"
    unless_null $P2106, vivify_589
    $P2106 = root_new ['parrot';'Hash']
  vivify_589:
    set $P2107, $P2106["statement"]
    unless_null $P2107, vivify_590
    new $P2107, "Undef"
  vivify_590:
    $P2108 = $P2107."ast"()
    store_lex "$past", $P2108
.annotate "line", 772
    find_lex $P2109, "$/"
    get_hll_global $P2110, ["PAST"], "Regex"
    find_lex $P2111, "$past"
    $P2112 = $P2110."new"($P2111, "pastnode" :named("pasttype"))
    $P2113 = $P2109."!make"($P2112)
.annotate "line", 770
    .return ($P2113)
  control_2102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2114, exception, "payload"
    .return ($P2114)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("122_1267204714.47172") :method :outer("120_1267204714.47172")
    .param pmc param_2118
.annotate "line", 775
    new $P2117, 'ExceptionHandler'
    set_addr $P2117, control_2116
    $P2117."handle_types"(58)
    push_eh $P2117
    .lex "self", self
    .lex "$/", param_2118
    find_lex $P2119, "$/"
    find_lex $P2120, "$/"
    unless_null $P2120, vivify_591
    $P2120 = root_new ['parrot';'Hash']
  vivify_591:
    set $P2121, $P2120["codeblock"]
    unless_null $P2121, vivify_592
    new $P2121, "Undef"
  vivify_592:
    $P2122 = $P2121."ast"()
    $P2123 = $P2119."!make"($P2122)
    .return ($P2123)
  control_2116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2124, exception, "payload"
    .return ($P2124)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("123_1267204714.47172") :method :outer("120_1267204714.47172")
    .param pmc param_2128
.annotate "line", 777
    new $P2127, 'ExceptionHandler'
    set_addr $P2127, control_2126
    $P2127."handle_types"(58)
    push_eh $P2127
    .lex "self", self
    .lex "$/", param_2128
    find_lex $P2129, "$/"
    find_lex $P2130, "$/"
    unless_null $P2130, vivify_593
    $P2130 = root_new ['parrot';'Hash']
  vivify_593:
    set $P2131, $P2130["codeblock"]
    unless_null $P2131, vivify_594
    new $P2131, "Undef"
  vivify_594:
    $P2132 = $P2131."ast"()
    $P2133 = $P2129."!make"($P2132)
    .return ($P2133)
  control_2126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2134, exception, "payload"
    .return ($P2134)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("124_1267204714.47172") :method :outer("120_1267204714.47172")
    .param pmc param_2138
.annotate "line", 779
    new $P2137, 'ExceptionHandler'
    set_addr $P2137, control_2136
    $P2137."handle_types"(58)
    push_eh $P2137
    .lex "self", self
    .lex "$/", param_2138
.annotate "line", 780
    new $P2139, "Undef"
    .lex "$block", $P2139
.annotate "line", 782
    new $P2140, "Undef"
    .lex "$past", $P2140
.annotate "line", 780
    find_lex $P2141, "$/"
    unless_null $P2141, vivify_595
    $P2141 = root_new ['parrot';'Hash']
  vivify_595:
    set $P2142, $P2141["block"]
    unless_null $P2142, vivify_596
    new $P2142, "Undef"
  vivify_596:
    $P2143 = $P2142."ast"()
    store_lex "$block", $P2143
.annotate "line", 781
    find_lex $P2144, "$block"
    $P2144."blocktype"("immediate")
.annotate "line", 783
    get_hll_global $P2145, ["PAST"], "Regex"
.annotate "line", 784
    get_hll_global $P2146, ["PAST"], "Stmts"
.annotate "line", 785
    get_hll_global $P2147, ["PAST"], "Op"
.annotate "line", 786
    get_hll_global $P2148, ["PAST"], "Var"
    $P2149 = $P2148."new"("$/" :named("name"))
.annotate "line", 787
    get_hll_global $P2150, ["PAST"], "Op"
.annotate "line", 788
    get_hll_global $P2151, ["PAST"], "Var"
    $P2152 = $P2151."new"(unicode:"$\x{a2}" :named("name"))
    $P2153 = $P2150."new"($P2152, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 787
    $P2154 = $P2147."new"($P2149, $P2153, "bind" :named("pasttype"))
.annotate "line", 785
    find_lex $P2155, "$block"
    $P2156 = $P2146."new"($P2154, $P2155)
.annotate "line", 784
    $P2157 = $P2145."new"($P2156, "pastnode" :named("pasttype"))
.annotate "line", 783
    store_lex "$past", $P2157
.annotate "line", 798
    find_lex $P2158, "$/"
    find_lex $P2159, "$past"
    $P2160 = $P2158."!make"($P2159)
.annotate "line", 779
    .return ($P2160)
  control_2136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2161, exception, "payload"
    .return ($P2161)
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
