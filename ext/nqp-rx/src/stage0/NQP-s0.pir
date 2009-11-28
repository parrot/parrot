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
.sub "_block11"  :anon :subid("10_1259420191.48826")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1247 = $P14()
.annotate "line", 1
    .return ($P1247)
.end


.namespace []
.sub "" :load :init :subid("post320") :outer("10_1259420191.48826")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259420191.48826" 
    .local pmc block
    set block, $P12
    $P1248 = get_root_global ["parrot"], "P6metaclass"
    $P1248."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1259420191.48826") :outer("10_1259420191.48826")
.annotate "line", 4
    get_hll_global $P1191, ["NQP";"Regex"], "_block1190" 
    capture_lex $P1191
    .const 'Sub' $P1184 = "305_1259420191.48826" 
    capture_lex $P1184
    .const 'Sub' $P1178 = "303_1259420191.48826" 
    capture_lex $P1178
    .const 'Sub' $P1171 = "301_1259420191.48826" 
    capture_lex $P1171
    .const 'Sub' $P1164 = "299_1259420191.48826" 
    capture_lex $P1164
    .const 'Sub' $P1157 = "297_1259420191.48826" 
    capture_lex $P1157
    .const 'Sub' $P1150 = "295_1259420191.48826" 
    capture_lex $P1150
    .const 'Sub' $P1144 = "293_1259420191.48826" 
    capture_lex $P1144
    .const 'Sub' $P1137 = "291_1259420191.48826" 
    capture_lex $P1137
    .const 'Sub' $P1130 = "289_1259420191.48826" 
    capture_lex $P1130
    .const 'Sub' $P1123 = "287_1259420191.48826" 
    capture_lex $P1123
    .const 'Sub' $P1116 = "285_1259420191.48826" 
    capture_lex $P1116
    .const 'Sub' $P1109 = "283_1259420191.48826" 
    capture_lex $P1109
    .const 'Sub' $P1102 = "281_1259420191.48826" 
    capture_lex $P1102
    .const 'Sub' $P1095 = "279_1259420191.48826" 
    capture_lex $P1095
    .const 'Sub' $P1088 = "277_1259420191.48826" 
    capture_lex $P1088
    .const 'Sub' $P1081 = "275_1259420191.48826" 
    capture_lex $P1081
    .const 'Sub' $P1074 = "273_1259420191.48826" 
    capture_lex $P1074
    .const 'Sub' $P1067 = "271_1259420191.48826" 
    capture_lex $P1067
    .const 'Sub' $P1060 = "269_1259420191.48826" 
    capture_lex $P1060
    .const 'Sub' $P1053 = "267_1259420191.48826" 
    capture_lex $P1053
    .const 'Sub' $P1046 = "265_1259420191.48826" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "263_1259420191.48826" 
    capture_lex $P1039
    .const 'Sub' $P1032 = "261_1259420191.48826" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "259_1259420191.48826" 
    capture_lex $P1025
    .const 'Sub' $P1018 = "257_1259420191.48826" 
    capture_lex $P1018
    .const 'Sub' $P1011 = "255_1259420191.48826" 
    capture_lex $P1011
    .const 'Sub' $P1004 = "253_1259420191.48826" 
    capture_lex $P1004
    .const 'Sub' $P997 = "251_1259420191.48826" 
    capture_lex $P997
    .const 'Sub' $P990 = "249_1259420191.48826" 
    capture_lex $P990
    .const 'Sub' $P983 = "247_1259420191.48826" 
    capture_lex $P983
    .const 'Sub' $P976 = "245_1259420191.48826" 
    capture_lex $P976
    .const 'Sub' $P969 = "243_1259420191.48826" 
    capture_lex $P969
    .const 'Sub' $P963 = "241_1259420191.48826" 
    capture_lex $P963
    .const 'Sub' $P956 = "239_1259420191.48826" 
    capture_lex $P956
    .const 'Sub' $P949 = "237_1259420191.48826" 
    capture_lex $P949
    .const 'Sub' $P942 = "235_1259420191.48826" 
    capture_lex $P942
    .const 'Sub' $P935 = "233_1259420191.48826" 
    capture_lex $P935
    .const 'Sub' $P928 = "231_1259420191.48826" 
    capture_lex $P928
    .const 'Sub' $P921 = "229_1259420191.48826" 
    capture_lex $P921
    .const 'Sub' $P914 = "227_1259420191.48826" 
    capture_lex $P914
    .const 'Sub' $P908 = "225_1259420191.48826" 
    capture_lex $P908
    .const 'Sub' $P902 = "223_1259420191.48826" 
    capture_lex $P902
    .const 'Sub' $P897 = "221_1259420191.48826" 
    capture_lex $P897
    .const 'Sub' $P891 = "219_1259420191.48826" 
    capture_lex $P891
    .const 'Sub' $P885 = "217_1259420191.48826" 
    capture_lex $P885
    .const 'Sub' $P880 = "215_1259420191.48826" 
    capture_lex $P880
    .const 'Sub' $P875 = "213_1259420191.48826" 
    capture_lex $P875
    .const 'Sub' $P868 = "211_1259420191.48826" 
    capture_lex $P868
    .const 'Sub' $P860 = "209_1259420191.48826" 
    capture_lex $P860
    .const 'Sub' $P855 = "207_1259420191.48826" 
    capture_lex $P855
    .const 'Sub' $P850 = "205_1259420191.48826" 
    capture_lex $P850
    .const 'Sub' $P842 = "203_1259420191.48826" 
    capture_lex $P842
    .const 'Sub' $P834 = "201_1259420191.48826" 
    capture_lex $P834
    .const 'Sub' $P829 = "199_1259420191.48826" 
    capture_lex $P829
    .const 'Sub' $P824 = "197_1259420191.48826" 
    capture_lex $P824
    .const 'Sub' $P818 = "195_1259420191.48826" 
    capture_lex $P818
    .const 'Sub' $P812 = "193_1259420191.48826" 
    capture_lex $P812
    .const 'Sub' $P806 = "191_1259420191.48826" 
    capture_lex $P806
    .const 'Sub' $P800 = "189_1259420191.48826" 
    capture_lex $P800
    .const 'Sub' $P795 = "187_1259420191.48826" 
    capture_lex $P795
    .const 'Sub' $P790 = "185_1259420191.48826" 
    capture_lex $P790
    .const 'Sub' $P777 = "181_1259420191.48826" 
    capture_lex $P777
    .const 'Sub' $P769 = "179_1259420191.48826" 
    capture_lex $P769
    .const 'Sub' $P763 = "177_1259420191.48826" 
    capture_lex $P763
    .const 'Sub' $P756 = "175_1259420191.48826" 
    capture_lex $P756
    .const 'Sub' $P750 = "173_1259420191.48826" 
    capture_lex $P750
    .const 'Sub' $P742 = "171_1259420191.48826" 
    capture_lex $P742
    .const 'Sub' $P734 = "169_1259420191.48826" 
    capture_lex $P734
    .const 'Sub' $P728 = "167_1259420191.48826" 
    capture_lex $P728
    .const 'Sub' $P722 = "165_1259420191.48826" 
    capture_lex $P722
    .const 'Sub' $P707 = "161_1259420191.48826" 
    capture_lex $P707
    .const 'Sub' $P675 = "159_1259420191.48826" 
    capture_lex $P675
    .const 'Sub' $P667 = "157_1259420191.48826" 
    capture_lex $P667
    .const 'Sub' $P661 = "155_1259420191.48826" 
    capture_lex $P661
    .const 'Sub' $P651 = "153_1259420191.48826" 
    capture_lex $P651
    .const 'Sub' $P636 = "151_1259420191.48826" 
    capture_lex $P636
    .const 'Sub' $P627 = "149_1259420191.48826" 
    capture_lex $P627
    .const 'Sub' $P608 = "147_1259420191.48826" 
    capture_lex $P608
    .const 'Sub' $P589 = "145_1259420191.48826" 
    capture_lex $P589
    .const 'Sub' $P582 = "143_1259420191.48826" 
    capture_lex $P582
    .const 'Sub' $P575 = "141_1259420191.48826" 
    capture_lex $P575
    .const 'Sub' $P565 = "137_1259420191.48826" 
    capture_lex $P565
    .const 'Sub' $P554 = "135_1259420191.48826" 
    capture_lex $P554
    .const 'Sub' $P547 = "133_1259420191.48826" 
    capture_lex $P547
    .const 'Sub' $P540 = "131_1259420191.48826" 
    capture_lex $P540
    .const 'Sub' $P533 = "129_1259420191.48826" 
    capture_lex $P533
    .const 'Sub' $P506 = "125_1259420191.48826" 
    capture_lex $P506
    .const 'Sub' $P497 = "123_1259420191.48826" 
    capture_lex $P497
    .const 'Sub' $P490 = "121_1259420191.48826" 
    capture_lex $P490
    .const 'Sub' $P481 = "117_1259420191.48826" 
    capture_lex $P481
    .const 'Sub' $P476 = "115_1259420191.48826" 
    capture_lex $P476
    .const 'Sub' $P464 = "113_1259420191.48826" 
    capture_lex $P464
    .const 'Sub' $P453 = "111_1259420191.48826" 
    capture_lex $P453
    .const 'Sub' $P448 = "109_1259420191.48826" 
    capture_lex $P448
    .const 'Sub' $P442 = "107_1259420191.48826" 
    capture_lex $P442
    .const 'Sub' $P436 = "105_1259420191.48826" 
    capture_lex $P436
    .const 'Sub' $P430 = "103_1259420191.48826" 
    capture_lex $P430
    .const 'Sub' $P424 = "101_1259420191.48826" 
    capture_lex $P424
    .const 'Sub' $P418 = "99_1259420191.48826" 
    capture_lex $P418
    .const 'Sub' $P412 = "97_1259420191.48826" 
    capture_lex $P412
    .const 'Sub' $P406 = "95_1259420191.48826" 
    capture_lex $P406
    .const 'Sub' $P398 = "93_1259420191.48826" 
    capture_lex $P398
    .const 'Sub' $P390 = "91_1259420191.48826" 
    capture_lex $P390
    .const 'Sub' $P378 = "87_1259420191.48826" 
    capture_lex $P378
    .const 'Sub' $P370 = "85_1259420191.48826" 
    capture_lex $P370
    .const 'Sub' $P360 = "81_1259420191.48826" 
    capture_lex $P360
    .const 'Sub' $P353 = "79_1259420191.48826" 
    capture_lex $P353
    .const 'Sub' $P346 = "77_1259420191.48826" 
    capture_lex $P346
    .const 'Sub' $P334 = "73_1259420191.48826" 
    capture_lex $P334
    .const 'Sub' $P326 = "71_1259420191.48826" 
    capture_lex $P326
    .const 'Sub' $P318 = "69_1259420191.48826" 
    capture_lex $P318
    .const 'Sub' $P298 = "67_1259420191.48826" 
    capture_lex $P298
    .const 'Sub' $P289 = "65_1259420191.48826" 
    capture_lex $P289
    .const 'Sub' $P271 = "62_1259420191.48826" 
    capture_lex $P271
    .const 'Sub' $P251 = "60_1259420191.48826" 
    capture_lex $P251
    .const 'Sub' $P242 = "56_1259420191.48826" 
    capture_lex $P242
    .const 'Sub' $P237 = "54_1259420191.48826" 
    capture_lex $P237
    .const 'Sub' $P228 = "50_1259420191.48826" 
    capture_lex $P228
    .const 'Sub' $P223 = "48_1259420191.48826" 
    capture_lex $P223
    .const 'Sub' $P215 = "46_1259420191.48826" 
    capture_lex $P215
    .const 'Sub' $P208 = "44_1259420191.48826" 
    capture_lex $P208
    .const 'Sub' $P202 = "42_1259420191.48826" 
    capture_lex $P202
    .const 'Sub' $P194 = "40_1259420191.48826" 
    capture_lex $P194
    .const 'Sub' $P188 = "38_1259420191.48826" 
    capture_lex $P188
    .const 'Sub' $P182 = "36_1259420191.48826" 
    capture_lex $P182
    .const 'Sub' $P166 = "33_1259420191.48826" 
    capture_lex $P166
    .const 'Sub' $P153 = "31_1259420191.48826" 
    capture_lex $P153
    .const 'Sub' $P146 = "29_1259420191.48826" 
    capture_lex $P146
    .const 'Sub' $P103 = "26_1259420191.48826" 
    capture_lex $P103
    .const 'Sub' $P85 = "23_1259420191.48826" 
    capture_lex $P85
    .const 'Sub' $P75 = "21_1259420191.48826" 
    capture_lex $P75
    .const 'Sub' $P61 = "19_1259420191.48826" 
    capture_lex $P61
    .const 'Sub' $P46 = "17_1259420191.48826" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1259420191.48826" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1259420191.48826" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1259420191.48826" 
    capture_lex $P15
.annotate "line", 508
    get_hll_global $P1191, ["NQP";"Regex"], "_block1190" 
    capture_lex $P1191
    $P1230 = $P1191()
.annotate "line", 4
    .return ($P1230)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post321") :outer("11_1259420191.48826")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 401
    get_hll_global $P1231, ["NQP"], "Grammar"
    $P1231."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 402
    get_hll_global $P1232, ["NQP"], "Grammar"
    $P1232."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 403
    get_hll_global $P1233, ["NQP"], "Grammar"
    $P1233."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 404
    get_hll_global $P1234, ["NQP"], "Grammar"
    $P1234."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 405
    get_hll_global $P1235, ["NQP"], "Grammar"
    $P1235."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 406
    get_hll_global $P1236, ["NQP"], "Grammar"
    $P1236."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 407
    get_hll_global $P1237, ["NQP"], "Grammar"
    $P1237."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 408
    get_hll_global $P1238, ["NQP"], "Grammar"
    $P1238."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 409
    get_hll_global $P1239, ["NQP"], "Grammar"
    $P1239."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 410
    get_hll_global $P1240, ["NQP"], "Grammar"
    $P1240."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 411
    get_hll_global $P1241, ["NQP"], "Grammar"
    $P1241."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 412
    get_hll_global $P1242, ["NQP"], "Grammar"
    $P1242."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 413
    get_hll_global $P1243, ["NQP"], "Grammar"
    $P1243."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 414
    get_hll_global $P1244, ["NQP"], "Grammar"
    $P1244."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 415
    get_hll_global $P1245, ["NQP"], "Grammar"
    $P1245."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 400
    $P1246 = get_root_global ["parrot"], "P6metaclass"
    $P1246."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1259420191.48826") :method :outer("11_1259420191.48826")
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
    unless_null $P20, vivify_322
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_323
    die "Contextual %*LANG not found"
  vivify_323:
  vivify_322:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_324
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_325
    die "Contextual %*LANG not found"
  vivify_325:
    store_lex "%*LANG", $P22
  vivify_324:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_326
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_327
    die "Contextual %*LANG not found"
  vivify_327:
    store_lex "%*LANG", $P24
  vivify_326:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_328
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_329
    die "Contextual %*LANG not found"
  vivify_329:
    store_lex "%*LANG", $P26
  vivify_328:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_330
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_331
    die "Contextual %*LANG not found"
  vivify_331:
    store_lex "%*LANG", $P28
  vivify_330:
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
.sub "identifier"  :subid("13_1259420191.48826") :method :outer("11_1259420191.48826")
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
.sub "!PREFIX__identifier"  :subid("14_1259420191.48826") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1259420191.48826") :method :outer("11_1259420191.48826")
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
.sub "!PREFIX__name"  :subid("16_1259420191.48826") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx47_tgt
    .local int rx47_pos
    .local int rx47_off
    .local int rx47_eos
    .local int rx47_rep
    .local pmc rx47_cur
    (rx47_cur, rx47_pos, rx47_tgt) = self."!cursor_start"()
    rx47_cur."!cursor_debug"("START ", "deflongname")
    rx47_cur."!cursor_caparray"("sym")
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
.annotate "line", 22
  # rx rxquantr52 ** 0..1
    set_addr $I60, rxquantr52_done
    rx47_cur."!mark_push"(0, rx47_pos, $I60)
  rxquantr52_loop:
  alt53_0:
    set_addr $I10, alt53_1
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx literal  ":sym<"
    add $I11, rx47_pos, 5
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 5
    ne $S10, ":sym<", rx47_fail
    add rx47_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_56_fail
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx rxquantr54 ** 0..*
    set_addr $I55, rxquantr54_done
    rx47_cur."!mark_push"(0, rx47_pos, $I55)
  rxquantr54_loop:
  # rx enumcharlist negate=1 
    ge rx47_pos, rx47_eos, rx47_fail
    sub $I10, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx47_fail
    inc rx47_pos
    (rx47_rep) = rx47_cur."!mark_commit"($I55)
    rx47_cur."!mark_push"(rx47_rep, rx47_pos, $I55)
    goto rxquantr54_loop
  rxquantr54_done:
    set_addr $I10, rxcap_56_fail
    ($I12, $I11) = rx47_cur."!mark_peek"($I10)
    rx47_cur."!cursor_pos"($I11)
    ($P10) = rx47_cur."!cursor_start"()
    $P10."!cursor_pass"(rx47_pos, "")
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_56_done
  rxcap_56_fail:
    goto rx47_fail
  rxcap_56_done:
  # rx literal  ">"
    add $I11, rx47_pos, 1
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 1
    ne $S10, ">", rx47_fail
    add rx47_pos, 1
    goto alt53_end
  alt53_1:
  # rx literal  unicode:":sym\x{ab}"
    add $I11, rx47_pos, 5
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 5
    ne $S10, unicode:":sym\x{ab}", rx47_fail
    add rx47_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_59_fail
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx rxquantr57 ** 0..*
    set_addr $I58, rxquantr57_done
    rx47_cur."!mark_push"(0, rx47_pos, $I58)
  rxquantr57_loop:
  # rx enumcharlist negate=1 
    ge rx47_pos, rx47_eos, rx47_fail
    sub $I10, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I10, 1
    index $I11, unicode:"\x{bb}", $S10
    ge $I11, 0, rx47_fail
    inc rx47_pos
    (rx47_rep) = rx47_cur."!mark_commit"($I58)
    rx47_cur."!mark_push"(rx47_rep, rx47_pos, $I58)
    goto rxquantr57_loop
  rxquantr57_done:
    set_addr $I10, rxcap_59_fail
    ($I12, $I11) = rx47_cur."!mark_peek"($I10)
    rx47_cur."!cursor_pos"($I11)
    ($P10) = rx47_cur."!cursor_start"()
    $P10."!cursor_pass"(rx47_pos, "")
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_59_done
  rxcap_59_fail:
    goto rx47_fail
  rxcap_59_done:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx47_pos, 1
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx47_fail
    add rx47_pos, 1
  alt53_end:
    (rx47_rep) = rx47_cur."!mark_commit"($I60)
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
.sub "!PREFIX__deflongname"  :subid("18_1259420191.48826") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    (rx62_cur, rx62_pos, rx62_tgt) = self."!cursor_start"()
    rx62_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    set rx62_off, 0
    lt rx62_pos, 2, rx62_start
    sub rx62_off, rx62_pos, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan65_done
    goto rxscan65_scan
  rxscan65_loop:
    ($P10) = rx62_cur."from"()
    inc $P10
    set rx62_pos, $P10
    ge rx62_pos, rx62_eos, rxscan65_done
  rxscan65_scan:
    set_addr $I10, rxscan65_loop
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
  rxscan65_done:
.annotate "line", 29
  # rx rxquantr66 ** 0..1
    set_addr $I74, rxquantr66_done
    rx62_cur."!mark_push"(0, rx62_pos, $I74)
  rxquantr66_loop:
  alt67_0:
.annotate "line", 26
    set_addr $I10, alt67_1
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
.annotate "line", 27
  # rx rxquantr68 ** 0..*
    set_addr $I69, rxquantr68_done
    rx62_cur."!mark_push"(0, rx62_pos, $I69)
  rxquantr68_loop:
  # rx enumcharlist negate=0 
    ge rx62_pos, rx62_eos, rx62_fail
    sub $I10, rx62_pos, rx62_off
    substr $S10, rx62_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx62_fail
    inc rx62_pos
    (rx62_rep) = rx62_cur."!mark_commit"($I69)
    rx62_cur."!mark_push"(rx62_rep, rx62_pos, $I69)
    goto rxquantr68_loop
  rxquantr68_done:
  # rxanchor eol
    sub $I10, rx62_pos, rx62_off
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rxanchor70_done
    ne rx62_pos, rx62_eos, rx62_fail
    eq rx62_pos, 0, rxanchor70_done
    dec $I10
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rx62_fail
  rxanchor70_done:
  # rx subrule "ws" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."ws"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."MARKER"("endstmt")
    unless $P10, rx62_fail
    goto alt67_end
  alt67_1:
.annotate "line", 28
  # rx rxquantr71 ** 0..1
    set_addr $I72, rxquantr71_done
    rx62_cur."!mark_push"(0, rx62_pos, $I72)
  rxquantr71_loop:
  # rx subrule "unv" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."unv"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
    (rx62_rep) = rx62_cur."!mark_commit"($I72)
  rxquantr71_done:
  # rxanchor eol
    sub $I10, rx62_pos, rx62_off
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rxanchor73_done
    ne rx62_pos, rx62_eos, rx62_fail
    eq rx62_pos, 0, rxanchor73_done
    dec $I10
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rx62_fail
  rxanchor73_done:
  # rx subrule "ws" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."ws"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."MARKER"("endstmt")
    unless $P10, rx62_fail
  alt67_end:
.annotate "line", 29
    (rx62_rep) = rx62_cur."!mark_commit"($I74)
  rxquantr66_done:
.annotate "line", 25
  # rx pass
    rx62_cur."!cursor_pass"(rx62_pos, "ENDSTMT")
    rx62_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx62_pos)
    .return (rx62_cur)
  rx62_fail:
.annotate "line", 4
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    rx62_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx62_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1259420191.48826") :method
.annotate "line", 4
    new $P64, "ResizablePMCArray"
    push $P64, ""
    .return ($P64)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx76_tgt
    .local int rx76_pos
    .local int rx76_off
    .local int rx76_eos
    .local int rx76_rep
    .local pmc rx76_cur
    (rx76_cur, rx76_pos, rx76_tgt) = self."!cursor_start"()
    rx76_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx76_cur
    .local pmc match
    .lex "$/", match
    length rx76_eos, rx76_tgt
    set rx76_off, 0
    lt rx76_pos, 2, rx76_start
    sub rx76_off, rx76_pos, 1
    substr rx76_tgt, rx76_tgt, rx76_off
  rx76_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan79_done
    goto rxscan79_scan
  rxscan79_loop:
    ($P10) = rx76_cur."from"()
    inc $P10
    set rx76_pos, $P10
    ge rx76_pos, rx76_eos, rxscan79_done
  rxscan79_scan:
    set_addr $I10, rxscan79_loop
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  rxscan79_done:
  alt80_0:
.annotate "line", 32
    set_addr $I10, alt80_1
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
.annotate "line", 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."MARKED"("ws")
    unless $P10, rx76_fail
    goto alt80_end
  alt80_1:
.annotate "line", 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."ww"()
    if $P10, rx76_fail
.annotate "line", 38
  # rx rxquantr81 ** 0..*
    set_addr $I84, rxquantr81_done
    rx76_cur."!mark_push"(0, rx76_pos, $I84)
  rxquantr81_loop:
  alt82_0:
.annotate "line", 35
    set_addr $I10, alt82_1
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx76_pos, rx76_off
    find_not_cclass $I11, 32, rx76_tgt, $I10, rx76_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx76_fail
    add rx76_pos, rx76_off, $I11
    goto alt82_end
  alt82_1:
    set_addr $I10, alt82_2
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
.annotate "line", 36
  # rx literal  "#"
    add $I11, rx76_pos, 1
    gt $I11, rx76_eos, rx76_fail
    sub $I11, rx76_pos, rx76_off
    substr $S10, rx76_tgt, $I11, 1
    ne $S10, "#", rx76_fail
    add rx76_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx76_pos, rx76_off
    find_cclass $I11, 4096, rx76_tgt, $I10, rx76_eos
    add rx76_pos, rx76_off, $I11
    goto alt82_end
  alt82_2:
.annotate "line", 37
  # rxanchor bol
    eq rx76_pos, 0, rxanchor83_done
    ge rx76_pos, rx76_eos, rx76_fail
    sub $I10, rx76_pos, rx76_off
    dec $I10
    is_cclass $I11, 4096, rx76_tgt, $I10
    unless $I11, rx76_fail
  rxanchor83_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."pod_comment"()
    unless $P10, rx76_fail
    rx76_pos = $P10."pos"()
  alt82_end:
.annotate "line", 38
    (rx76_rep) = rx76_cur."!mark_commit"($I84)
    rx76_cur."!mark_push"(rx76_rep, rx76_pos, $I84)
    goto rxquantr81_loop
  rxquantr81_done:
.annotate "line", 39
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."MARKER"("ws")
    unless $P10, rx76_fail
  alt80_end:
.annotate "line", 32
  # rx pass
    rx76_cur."!cursor_pass"(rx76_pos, "ws")
    rx76_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx76_pos)
    .return (rx76_cur)
  rx76_fail:
.annotate "line", 4
    (rx76_rep, rx76_pos, $I10, $P10) = rx76_cur."!mark_fail"(0)
    lt rx76_pos, -1, rx76_done
    eq rx76_pos, -1, rx76_fail
    jump $I10
  rx76_done:
    rx76_cur."!cursor_fail"()
    rx76_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx76_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1259420191.48826") :method
.annotate "line", 4
    new $P78, "ResizablePMCArray"
    push $P78, ""
    push $P78, ""
    .return ($P78)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .const 'Sub' $P93 = "25_1259420191.48826" 
    capture_lex $P93
    .local string rx86_tgt
    .local int rx86_pos
    .local int rx86_off
    .local int rx86_eos
    .local int rx86_rep
    .local pmc rx86_cur
    (rx86_cur, rx86_pos, rx86_tgt) = self."!cursor_start"()
    rx86_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx86_cur
    .local pmc match
    .lex "$/", match
    length rx86_eos, rx86_tgt
    set rx86_off, 0
    lt rx86_pos, 2, rx86_start
    sub rx86_off, rx86_pos, 1
    substr rx86_tgt, rx86_tgt, rx86_off
  rx86_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan89_done
    goto rxscan89_scan
  rxscan89_loop:
    ($P10) = rx86_cur."from"()
    inc $P10
    set rx86_pos, $P10
    ge rx86_pos, rx86_eos, rxscan89_done
  rxscan89_scan:
    set_addr $I10, rxscan89_loop
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  rxscan89_done:
  alt90_0:
.annotate "line", 44
    set_addr $I10, alt90_1
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
.annotate "line", 45
  # rxanchor bol
    eq rx86_pos, 0, rxanchor91_done
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    dec $I10
    is_cclass $I11, 4096, rx86_tgt, $I10
    unless $I11, rx86_fail
  rxanchor91_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    .const 'Sub' $P93 = "25_1259420191.48826" 
    capture_lex $P93
    $P10 = rx86_cur."before"($P93)
    unless $P10, rx86_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."pod_comment"()
    unless $P10, rx86_fail
    rx86_pos = $P10."pos"()
    goto alt90_end
  alt90_1:
    set_addr $I10, alt90_2
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
.annotate "line", 46
  # rx rxquantr99 ** 0..*
    set_addr $I100, rxquantr99_done
    rx86_cur."!mark_push"(0, rx86_pos, $I100)
  rxquantr99_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I100)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I100)
    goto rxquantr99_loop
  rxquantr99_done:
  # rx literal  "#"
    add $I11, rx86_pos, 1
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 1
    ne $S10, "#", rx86_fail
    add rx86_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx86_pos, rx86_off
    find_cclass $I11, 4096, rx86_tgt, $I10, rx86_eos
    add rx86_pos, rx86_off, $I11
    goto alt90_end
  alt90_2:
.annotate "line", 47
  # rx rxquantr101 ** 1..*
    set_addr $I102, rxquantr101_done
    rx86_cur."!mark_push"(0, -1, $I102)
  rxquantr101_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I102)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I102)
    goto rxquantr101_loop
  rxquantr101_done:
  alt90_end:
.annotate "line", 42
  # rx pass
    rx86_cur."!cursor_pass"(rx86_pos, "unv")
    rx86_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx86_pos)
    .return (rx86_cur)
  rx86_fail:
.annotate "line", 4
    (rx86_rep, rx86_pos, $I10, $P10) = rx86_cur."!mark_fail"(0)
    lt rx86_pos, -1, rx86_done
    eq rx86_pos, -1, rx86_fail
    jump $I10
  rx86_done:
    rx86_cur."!cursor_fail"()
    rx86_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx86_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1259420191.48826") :method
.annotate "line", 4
    new $P88, "ResizablePMCArray"
    push $P88, ""
    push $P88, ""
    push $P88, ""
    .return ($P88)
.end


.namespace ["NQP";"Grammar"]
.sub "_block92"  :anon :subid("25_1259420191.48826") :method :outer("23_1259420191.48826")
.annotate "line", 45
    .local string rx94_tgt
    .local int rx94_pos
    .local int rx94_off
    .local int rx94_eos
    .local int rx94_rep
    .local pmc rx94_cur
    (rx94_cur, rx94_pos, rx94_tgt) = self."!cursor_start"()
    rx94_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx94_cur
    .local pmc match
    .lex "$/", match
    length rx94_eos, rx94_tgt
    set rx94_off, 0
    lt rx94_pos, 2, rx94_start
    sub rx94_off, rx94_pos, 1
    substr rx94_tgt, rx94_tgt, rx94_off
  rx94_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan95_done
    goto rxscan95_scan
  rxscan95_loop:
    ($P10) = rx94_cur."from"()
    inc $P10
    set rx94_pos, $P10
    ge rx94_pos, rx94_eos, rxscan95_done
  rxscan95_scan:
    set_addr $I10, rxscan95_loop
    rx94_cur."!mark_push"(0, rx94_pos, $I10)
  rxscan95_done:
  # rx rxquantr96 ** 0..*
    set_addr $I97, rxquantr96_done
    rx94_cur."!mark_push"(0, rx94_pos, $I97)
  rxquantr96_loop:
  # rx enumcharlist negate=0 
    ge rx94_pos, rx94_eos, rx94_fail
    sub $I10, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx94_fail
    inc rx94_pos
    (rx94_rep) = rx94_cur."!mark_commit"($I97)
    rx94_cur."!mark_push"(rx94_rep, rx94_pos, $I97)
    goto rxquantr96_loop
  rxquantr96_done:
  # rx literal  "="
    add $I11, rx94_pos, 1
    gt $I11, rx94_eos, rx94_fail
    sub $I11, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I11, 1
    ne $S10, "=", rx94_fail
    add rx94_pos, 1
  alt98_0:
    set_addr $I10, alt98_1
    rx94_cur."!mark_push"(0, rx94_pos, $I10)
  # rx charclass w
    ge rx94_pos, rx94_eos, rx94_fail
    sub $I10, rx94_pos, rx94_off
    is_cclass $I11, 8192, rx94_tgt, $I10
    unless $I11, rx94_fail
    inc rx94_pos
    goto alt98_end
  alt98_1:
  # rx literal  "\\"
    add $I11, rx94_pos, 1
    gt $I11, rx94_eos, rx94_fail
    sub $I11, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I11, 1
    ne $S10, "\\", rx94_fail
    add rx94_pos, 1
  alt98_end:
  # rx pass
    rx94_cur."!cursor_pass"(rx94_pos, "")
    rx94_cur."!cursor_debug"("PASS  ", "", " at pos=", rx94_pos)
    .return (rx94_cur)
  rx94_fail:
    (rx94_rep, rx94_pos, $I10, $P10) = rx94_cur."!mark_fail"(0)
    lt rx94_pos, -1, rx94_done
    eq rx94_pos, -1, rx94_fail
    jump $I10
  rx94_done:
    rx94_cur."!cursor_fail"()
    rx94_cur."!cursor_debug"("FAIL  ", "")
    .return (rx94_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .const 'Sub' $P138 = "28_1259420191.48826" 
    capture_lex $P138
    .local string rx104_tgt
    .local int rx104_pos
    .local int rx104_off
    .local int rx104_eos
    .local int rx104_rep
    .local pmc rx104_cur
    (rx104_cur, rx104_pos, rx104_tgt) = self."!cursor_start"()
    rx104_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx104_cur
    .local pmc match
    .lex "$/", match
    length rx104_eos, rx104_tgt
    set rx104_off, 0
    lt rx104_pos, 2, rx104_start
    sub rx104_off, rx104_pos, 1
    substr rx104_tgt, rx104_tgt, rx104_off
  rx104_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan107_done
    goto rxscan107_scan
  rxscan107_loop:
    ($P10) = rx104_cur."from"()
    inc $P10
    set rx104_pos, $P10
    ge rx104_pos, rx104_eos, rxscan107_done
  rxscan107_scan:
    set_addr $I10, rxscan107_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  rxscan107_done:
.annotate "line", 52
  # rxanchor bol
    eq rx104_pos, 0, rxanchor108_done
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    dec $I10
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
  rxanchor108_done:
  # rx rxquantr109 ** 0..*
    set_addr $I110, rxquantr109_done
    rx104_cur."!mark_push"(0, rx104_pos, $I110)
  rxquantr109_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I110)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I110)
    goto rxquantr109_loop
  rxquantr109_done:
  # rx literal  "="
    add $I11, rx104_pos, 1
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 1
    ne $S10, "=", rx104_fail
    add rx104_pos, 1
  alt111_0:
.annotate "line", 53
    set_addr $I10, alt111_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 54
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rx rxquantr112 ** 1..*
    set_addr $I113, rxquantr112_done
    rx104_cur."!mark_push"(0, -1, $I113)
  rxquantr112_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I113)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I113)
    goto rxquantr112_loop
  rxquantr112_done:
  # rx literal  "END"
    add $I11, rx104_pos, 3
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 3
    ne $S10, "END", rx104_fail
    add rx104_pos, 3
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  alt114_0:
.annotate "line", 55
    set_addr $I10, alt114_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx rxquantf115 ** 0..*
    set_addr $I10, rxquantf115_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf115_done
  rxquantf115_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf115_loop
    rx104_cur."!mark_push"($I116, rx104_pos, $I10)
  rxquantf115_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rx rxquantr117 ** 1..*
    set_addr $I118, rxquantr117_done
    rx104_cur."!mark_push"(0, -1, $I118)
  rxquantr117_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I118)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I118)
    goto rxquantr117_loop
  rxquantr117_done:
  # rx literal  "END"
    add $I11, rx104_pos, 3
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 3
    ne $S10, "END", rx104_fail
    add rx104_pos, 3
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt114_end
  alt114_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_not_cclass $I11, 65535, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
  alt114_end:
.annotate "line", 54
    goto alt111_end
  alt111_1:
    set_addr $I10, alt111_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 56
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rx rxquantr119 ** 1..*
    set_addr $I120, rxquantr119_done
    rx104_cur."!mark_push"(0, -1, $I120)
  rxquantr119_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I120)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I120)
    goto rxquantr119_loop
  rxquantr119_done:
  # rx subrule "identifier" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."identifier"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx104_pos = $P10."pos"()
  alt121_0:
.annotate "line", 57
    set_addr $I10, alt121_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 58
  # rx rxquantf122 ** 0..*
    set_addr $I10, rxquantf122_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf122_done
  rxquantf122_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf122_loop
    rx104_cur."!mark_push"($I123, rx104_pos, $I10)
  rxquantf122_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rx rxquantr124 ** 1..*
    set_addr $I125, rxquantr124_done
    rx104_cur."!mark_push"(0, -1, $I125)
  rxquantr124_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I125)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I125)
    goto rxquantr124_loop
  rxquantr124_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."!BACKREF"("identifier")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt121_end
  alt121_1:
.annotate "line", 59
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("=begin without matching =end")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt121_end:
.annotate "line", 56
    goto alt111_end
  alt111_2:
    set_addr $I10, alt111_3
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 61
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx104_cur."!mark_push"(0, rx104_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I128)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  alt129_0:
.annotate "line", 62
    set_addr $I10, alt129_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rxanchor eol
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    if $I11, rxanchor130_done
    ne rx104_pos, rx104_eos, rx104_fail
    eq rx104_pos, 0, rxanchor130_done
    dec $I10
    is_cclass $I11, 4096, rx104_tgt, $I10
    if $I11, rx104_fail
  rxanchor130_done:
    goto alt129_end
  alt129_1:
    set_addr $I10, alt129_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx literal  "#"
    add $I11, rx104_pos, 1
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 1
    ne $S10, "#", rx104_fail
    add rx104_pos, 1
    goto alt129_end
  alt129_2:
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt129_end:
  alt131_0:
.annotate "line", 63
    set_addr $I10, alt131_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 64
  # rx rxquantf132 ** 0..*
    set_addr $I10, rxquantf132_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf132_done
  rxquantf132_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf132_loop
    rx104_cur."!mark_push"($I133, rx104_pos, $I10)
  rxquantf132_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx rxquantr134 ** 0..*
    set_addr $I135, rxquantr134_done
    rx104_cur."!mark_push"(0, rx104_pos, $I135)
  rxquantr134_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I135)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I135)
    goto rxquantr134_loop
  rxquantr134_done:
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt131_end
  alt131_1:
.annotate "line", 65
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("=begin without matching =end")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt131_end:
.annotate "line", 61
    goto alt111_end
  alt111_3:
.annotate "line", 69
  # rx rxquantr136 ** 0..1
    set_addr $I144, rxquantr136_done
    rx104_cur."!mark_push"(0, rx104_pos, $I144)
  rxquantr136_loop:
.annotate "line", 68
  # rx subrule "before" subtype=zerowidth negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    .const 'Sub' $P138 = "28_1259420191.48826" 
    capture_lex $P138
    $P10 = rx104_cur."before"($P138)
    unless $P10, rx104_fail
.annotate "line", 69
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
    (rx104_rep) = rx104_cur."!mark_commit"($I144)
  rxquantr136_done:
  alt145_0:
.annotate "line", 70
    set_addr $I10, alt145_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."alpha"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx104_pos = $P10."pos"()
    goto alt145_end
  alt145_1:
    set_addr $I10, alt145_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx charclass s
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 32, rx104_tgt, $I10
    unless $I11, rx104_fail
    inc rx104_pos
    goto alt145_end
  alt145_2:
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Illegal pod directive")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt145_end:
.annotate "line", 71
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
  alt111_end:
.annotate "line", 51
  # rx pass
    rx104_cur."!cursor_pass"(rx104_pos, "pod_comment")
    rx104_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx104_pos)
    .return (rx104_cur)
  rx104_fail:
.annotate "line", 4
    (rx104_rep, rx104_pos, $I10, $P10) = rx104_cur."!mark_fail"(0)
    lt rx104_pos, -1, rx104_done
    eq rx104_pos, -1, rx104_fail
    jump $I10
  rx104_done:
    rx104_cur."!cursor_fail"()
    rx104_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx104_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1259420191.48826") :method
.annotate "line", 4
    new $P106, "ResizablePMCArray"
    push $P106, ""
    .return ($P106)
.end


.namespace ["NQP";"Grammar"]
.sub "_block137"  :anon :subid("28_1259420191.48826") :method :outer("26_1259420191.48826")
.annotate "line", 68
    .local string rx139_tgt
    .local int rx139_pos
    .local int rx139_off
    .local int rx139_eos
    .local int rx139_rep
    .local pmc rx139_cur
    (rx139_cur, rx139_pos, rx139_tgt) = self."!cursor_start"()
    rx139_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx139_cur
    .local pmc match
    .lex "$/", match
    length rx139_eos, rx139_tgt
    set rx139_off, 0
    lt rx139_pos, 2, rx139_start
    sub rx139_off, rx139_pos, 1
    substr rx139_tgt, rx139_tgt, rx139_off
  rx139_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan140_done
    goto rxscan140_scan
  rxscan140_loop:
    ($P10) = rx139_cur."from"()
    inc $P10
    set rx139_pos, $P10
    ge rx139_pos, rx139_eos, rxscan140_done
  rxscan140_scan:
    set_addr $I10, rxscan140_loop
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
  rxscan140_done:
  # rx rxquantf141 ** 0..*
    set_addr $I10, rxquantf141_loop
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
    goto rxquantf141_done
  rxquantf141_loop:
  # rx charclass .
    ge rx139_pos, rx139_eos, rx139_fail
    inc rx139_pos
    set_addr $I10, rxquantf141_loop
    rx139_cur."!mark_push"($I142, rx139_pos, $I10)
  rxquantf141_done:
  # rxanchor bol
    eq rx139_pos, 0, rxanchor143_done
    ge rx139_pos, rx139_eos, rx139_fail
    sub $I10, rx139_pos, rx139_off
    dec $I10
    is_cclass $I11, 4096, rx139_tgt, $I10
    unless $I11, rx139_fail
  rxanchor143_done:
  # rx literal  "=cut"
    add $I11, rx139_pos, 4
    gt $I11, rx139_eos, rx139_fail
    sub $I11, rx139_pos, rx139_off
    substr $S10, rx139_tgt, $I11, 4
    ne $S10, "=cut", rx139_fail
    add rx139_pos, 4
  # rxanchor rwb
    le rx139_pos, 0, rx139_fail
    sub $I10, rx139_pos, rx139_off
    is_cclass $I11, 8192, rx139_tgt, $I10
    if $I11, rx139_fail
    dec $I10
    is_cclass $I11, 8192, rx139_tgt, $I10
    unless $I11, rx139_fail
  # rx pass
    rx139_cur."!cursor_pass"(rx139_pos, "")
    rx139_cur."!cursor_debug"("PASS  ", "", " at pos=", rx139_pos)
    .return (rx139_cur)
  rx139_fail:
    (rx139_rep, rx139_pos, $I10, $P10) = rx139_cur."!mark_fail"(0)
    lt rx139_pos, -1, rx139_done
    eq rx139_pos, -1, rx139_fail
    jump $I10
  rx139_done:
    rx139_cur."!cursor_fail"()
    rx139_cur."!cursor_debug"("FAIL  ", "")
    .return (rx139_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "comp_unit")
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
    ne $I10, -1, rxscan151_done
    goto rxscan151_scan
  rxscan151_loop:
    ($P10) = rx147_cur."from"()
    inc $P10
    set rx147_pos, $P10
    ge rx147_pos, rx147_eos, rxscan151_done
  rxscan151_scan:
    set_addr $I10, rxscan151_loop
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  rxscan151_done:
.annotate "line", 79
  # rx subrule "newpad" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."newpad"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
.annotate "line", 80
  # rx subrule "statementlist" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."statementlist"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx147_pos = $P10."pos"()
  alt152_0:
.annotate "line", 81
    set_addr $I10, alt152_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  # rxanchor eos
    ne rx147_pos, rx147_eos, rx147_fail
    goto alt152_end
  alt152_1:
  # rx subrule "panic" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."panic"("Confused")
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  alt152_end:
.annotate "line", 78
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "comp_unit")
    rx147_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 4
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx147_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1259420191.48826") :method
.annotate "line", 4
    $P149 = self."!PREFIX__!subrule"("", "")
    new $P150, "ResizablePMCArray"
    push $P150, $P149
    .return ($P150)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx154_tgt
    .local int rx154_pos
    .local int rx154_off
    .local int rx154_eos
    .local int rx154_rep
    .local pmc rx154_cur
    (rx154_cur, rx154_pos, rx154_tgt) = self."!cursor_start"()
    rx154_cur."!cursor_debug"("START ", "statementlist")
    rx154_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx154_cur
    .local pmc match
    .lex "$/", match
    length rx154_eos, rx154_tgt
    set rx154_off, 0
    lt rx154_pos, 2, rx154_start
    sub rx154_off, rx154_pos, 1
    substr rx154_tgt, rx154_tgt, rx154_off
  rx154_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan157_done
    goto rxscan157_scan
  rxscan157_loop:
    ($P10) = rx154_cur."from"()
    inc $P10
    set rx154_pos, $P10
    ge rx154_pos, rx154_eos, rxscan157_done
  rxscan157_scan:
    set_addr $I10, rxscan157_loop
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
  rxscan157_done:
  alt158_0:
.annotate "line", 84
    set_addr $I10, alt158_1
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rxanchor eos
    ne rx154_pos, rx154_eos, rx154_fail
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
    goto alt158_end
  alt158_1:
.annotate "line", 86
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rx rxquantr162 ** 0..*
    set_addr $I164, rxquantr162_done
    rx154_cur."!mark_push"(0, rx154_pos, $I164)
  rxquantr162_loop:
  # rx subrule "statement" subtype=capture negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."statement"()
    unless $P10, rx154_fail
    rx154_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx154_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."eat_terminator"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
    (rx154_rep) = rx154_cur."!mark_commit"($I164)
    rx154_cur."!mark_push"(rx154_rep, rx154_pos, $I164)
    goto rxquantr162_loop
  rxquantr162_done:
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  alt158_end:
.annotate "line", 84
  # rx pass
    rx154_cur."!cursor_pass"(rx154_pos, "statementlist")
    rx154_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx154_pos)
    .return (rx154_cur)
  rx154_fail:
.annotate "line", 4
    (rx154_rep, rx154_pos, $I10, $P10) = rx154_cur."!mark_fail"(0)
    lt rx154_pos, -1, rx154_done
    eq rx154_pos, -1, rx154_fail
    jump $I10
  rx154_done:
    rx154_cur."!cursor_fail"()
    rx154_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx154_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1259420191.48826") :method
.annotate "line", 4
    new $P156, "ResizablePMCArray"
    push $P156, ""
    push $P156, ""
    .return ($P156)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .const 'Sub' $P172 = "35_1259420191.48826" 
    capture_lex $P172
    .local string rx167_tgt
    .local int rx167_pos
    .local int rx167_off
    .local int rx167_eos
    .local int rx167_rep
    .local pmc rx167_cur
    (rx167_cur, rx167_pos, rx167_tgt) = self."!cursor_start"()
    rx167_cur."!cursor_debug"("START ", "statement")
    rx167_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx167_cur
    .local pmc match
    .lex "$/", match
    length rx167_eos, rx167_tgt
    set rx167_off, 0
    lt rx167_pos, 2, rx167_start
    sub rx167_off, rx167_pos, 1
    substr rx167_tgt, rx167_tgt, rx167_off
  rx167_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan170_done
    goto rxscan170_scan
  rxscan170_loop:
    ($P10) = rx167_cur."from"()
    inc $P10
    set rx167_pos, $P10
    ge rx167_pos, rx167_eos, rxscan170_done
  rxscan170_scan:
    set_addr $I10, rxscan170_loop
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
  rxscan170_done:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx167_cur."!cursor_pos"(rx167_pos)
    .const 'Sub' $P172 = "35_1259420191.48826" 
    capture_lex $P172
    $P10 = rx167_cur."before"($P172)
    if $P10, rx167_fail
  alt176_0:
.annotate "line", 91
    set_addr $I10, alt176_1
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
.annotate "line", 92
  # rx subrule "statement_control" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_control"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx167_pos = $P10."pos"()
    goto alt176_end
  alt176_1:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."EXPR"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx167_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."ws"()
    unless $P10, rx167_fail
    rx167_pos = $P10."pos"()
.annotate "line", 97
  # rx rxquantr177 ** 0..1
    set_addr $I181, rxquantr177_done
    rx167_cur."!mark_push"(0, rx167_pos, $I181)
  rxquantr177_loop:
  alt178_0:
.annotate "line", 94
    set_addr $I10, alt178_1
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_cond"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx167_pos = $P10."pos"()
  # rx rxquantr179 ** 0..1
    set_addr $I180, rxquantr179_done
    rx167_cur."!mark_push"(0, rx167_pos, $I180)
  rxquantr179_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_loop"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx167_pos = $P10."pos"()
    (rx167_rep) = rx167_cur."!mark_commit"($I180)
  rxquantr179_done:
    goto alt178_end
  alt178_1:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_loop"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx167_pos = $P10."pos"()
  alt178_end:
.annotate "line", 97
    (rx167_rep) = rx167_cur."!mark_commit"($I181)
  rxquantr177_done:
  alt176_end:
.annotate "line", 89
  # rx pass
    rx167_cur."!cursor_pass"(rx167_pos, "statement")
    rx167_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx167_pos)
    .return (rx167_cur)
  rx167_fail:
.annotate "line", 4
    (rx167_rep, rx167_pos, $I10, $P10) = rx167_cur."!mark_fail"(0)
    lt rx167_pos, -1, rx167_done
    eq rx167_pos, -1, rx167_fail
    jump $I10
  rx167_done:
    rx167_cur."!cursor_fail"()
    rx167_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx167_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1259420191.48826") :method
.annotate "line", 4
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["NQP";"Grammar"]
.sub "_block171"  :anon :subid("35_1259420191.48826") :method :outer("33_1259420191.48826")
.annotate "line", 90
    .local string rx173_tgt
    .local int rx173_pos
    .local int rx173_off
    .local int rx173_eos
    .local int rx173_rep
    .local pmc rx173_cur
    (rx173_cur, rx173_pos, rx173_tgt) = self."!cursor_start"()
    rx173_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx173_cur
    .local pmc match
    .lex "$/", match
    length rx173_eos, rx173_tgt
    set rx173_off, 0
    lt rx173_pos, 2, rx173_start
    sub rx173_off, rx173_pos, 1
    substr rx173_tgt, rx173_tgt, rx173_off
  rx173_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan174_done
    goto rxscan174_scan
  rxscan174_loop:
    ($P10) = rx173_cur."from"()
    inc $P10
    set rx173_pos, $P10
    ge rx173_pos, rx173_eos, rxscan174_done
  rxscan174_scan:
    set_addr $I10, rxscan174_loop
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
  rxscan174_done:
  alt175_0:
    set_addr $I10, alt175_1
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx173_pos, rx173_eos, rx173_fail
    sub $I10, rx173_pos, rx173_off
    substr $S10, rx173_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx173_fail
    inc rx173_pos
    goto alt175_end
  alt175_1:
  # rxanchor eos
    ne rx173_pos, rx173_eos, rx173_fail
  alt175_end:
  # rx pass
    rx173_cur."!cursor_pass"(rx173_pos, "")
    rx173_cur."!cursor_debug"("PASS  ", "", " at pos=", rx173_pos)
    .return (rx173_cur)
  rx173_fail:
    (rx173_rep, rx173_pos, $I10, $P10) = rx173_cur."!mark_fail"(0)
    lt rx173_pos, -1, rx173_done
    eq rx173_pos, -1, rx173_fail
    jump $I10
  rx173_done:
    rx173_cur."!cursor_fail"()
    rx173_cur."!cursor_debug"("FAIL  ", "")
    .return (rx173_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    set rx183_off, 0
    lt rx183_pos, 2, rx183_start
    sub rx183_off, rx183_pos, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan186_done
    goto rxscan186_scan
  rxscan186_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan186_done
  rxscan186_scan:
    set_addr $I10, rxscan186_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan186_done:
  alt187_0:
.annotate "line", 101
    set_addr $I10, alt187_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 102
  # rx literal  ";"
    add $I11, rx183_pos, 1
    gt $I11, rx183_eos, rx183_fail
    sub $I11, rx183_pos, rx183_off
    substr $S10, rx183_tgt, $I11, 1
    ne $S10, ";", rx183_fail
    add rx183_pos, 1
    goto alt187_end
  alt187_1:
    set_addr $I10, alt187_2
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."MARKED"("endstmt")
    unless $P10, rx183_fail
    goto alt187_end
  alt187_2:
    set_addr $I10, alt187_3
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."terminator"()
    unless $P10, rx183_fail
    goto alt187_end
  alt187_3:
.annotate "line", 105
  # rxanchor eos
    ne rx183_pos, rx183_eos, rx183_fail
  alt187_end:
.annotate "line", 101
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "eat_terminator")
    rx183_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_fail:
.annotate "line", 4
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    rx183_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1259420191.48826") :method
.annotate "line", 4
    new $P185, "ResizablePMCArray"
    push $P185, ""
    push $P185, ""
    push $P185, ""
    push $P185, ";"
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    set rx189_off, 0
    lt rx189_pos, 2, rx189_start
    sub rx189_off, rx189_pos, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan193_done
    goto rxscan193_scan
  rxscan193_loop:
    ($P10) = rx189_cur."from"()
    inc $P10
    set rx189_pos, $P10
    ge rx189_pos, rx189_eos, rxscan193_done
  rxscan193_scan:
    set_addr $I10, rxscan193_loop
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
  rxscan193_done:
.annotate "line", 109
  # rx subrule "EXPR" subtype=capture negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."EXPR"()
    unless $P10, rx189_fail
    rx189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx189_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."ws"()
    unless $P10, rx189_fail
    rx189_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."pblock"()
    unless $P10, rx189_fail
    rx189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx189_pos = $P10."pos"()
.annotate "line", 108
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "xblock")
    rx189_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
.annotate "line", 4
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1259420191.48826") :method
.annotate "line", 4
    $P191 = self."!PREFIX__!subrule"("EXPR", "")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx195_cur
    .local pmc match
    .lex "$/", match
    length rx195_eos, rx195_tgt
    set rx195_off, 0
    lt rx195_pos, 2, rx195_start
    sub rx195_off, rx195_pos, 1
    substr rx195_tgt, rx195_tgt, rx195_off
  rx195_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan200_done
    goto rxscan200_scan
  rxscan200_loop:
    ($P10) = rx195_cur."from"()
    inc $P10
    set rx195_pos, $P10
    ge rx195_pos, rx195_eos, rxscan200_done
  rxscan200_scan:
    set_addr $I10, rxscan200_loop
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
  rxscan200_done:
  alt201_0:
.annotate "line", 112
    set_addr $I10, alt201_1
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."lambda"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."newpad"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."signature"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx195_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."blockoid"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx195_pos = $P10."pos"()
.annotate "line", 113
    goto alt201_end
  alt201_1:
    set_addr $I10, alt201_2
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx195_pos, rx195_eos, rx195_fail
    sub $I10, rx195_pos, rx195_off
    substr $S10, rx195_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx195_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."newpad"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."blockoid"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx195_pos = $P10."pos"()
.annotate "line", 117
    goto alt201_end
  alt201_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."panic"("Missing block")
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
  alt201_end:
.annotate "line", 112
  # rx pass
    rx195_cur."!cursor_pass"(rx195_pos, "pblock")
    rx195_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx195_pos)
    .return (rx195_cur)
  rx195_fail:
.annotate "line", 4
    (rx195_rep, rx195_pos, $I10, $P10) = rx195_cur."!mark_fail"(0)
    lt rx195_pos, -1, rx195_done
    eq rx195_pos, -1, rx195_fail
    jump $I10
  rx195_done:
    rx195_cur."!cursor_fail"()
    rx195_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx195_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1259420191.48826") :method
.annotate "line", 4
    $P197 = self."!PREFIX__!subrule"("", "")
    $P198 = self."!PREFIX__!subrule"("", "")
    new $P199, "ResizablePMCArray"
    push $P199, $P197
    push $P199, "{"
    push $P199, $P198
    .return ($P199)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    set rx203_off, 0
    lt rx203_pos, 2, rx203_start
    sub rx203_off, rx203_pos, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx203_cur."from"()
    inc $P10
    set rx203_pos, $P10
    ge rx203_pos, rx203_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  rxscan206_done:
  alt207_0:
.annotate "line", 123
    set_addr $I10, alt207_1
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  # rx literal  "->"
    add $I11, rx203_pos, 2
    gt $I11, rx203_eos, rx203_fail
    sub $I11, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I11, 2
    ne $S10, "->", rx203_fail
    add rx203_pos, 2
    goto alt207_end
  alt207_1:
  # rx literal  "<->"
    add $I11, rx203_pos, 3
    gt $I11, rx203_eos, rx203_fail
    sub $I11, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I11, 3
    ne $S10, "<->", rx203_fail
    add rx203_pos, 3
  alt207_end:
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "lambda")
    rx203_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_fail:
.annotate "line", 4
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1259420191.48826") :method
.annotate "line", 4
    new $P205, "ResizablePMCArray"
    push $P205, "<->"
    push $P205, "->"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "block")
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
  alt214_0:
.annotate "line", 126
    set_addr $I10, alt214_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx209_fail
    goto alt214_end
  alt214_1:
  # rx subrule "panic" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."panic"("Missing block")
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
  alt214_end:
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."newpad"()
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."blockoid"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx209_pos = $P10."pos"()
.annotate "line", 125
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "block")
    rx209_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 4
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1259420191.48826") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    push $P212, "{"
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx216_tgt
    .local int rx216_pos
    .local int rx216_off
    .local int rx216_eos
    .local int rx216_rep
    .local pmc rx216_cur
    (rx216_cur, rx216_pos, rx216_tgt) = self."!cursor_start"()
    rx216_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx216_cur
    .local pmc match
    .lex "$/", match
    length rx216_eos, rx216_tgt
    set rx216_off, 0
    lt rx216_pos, 2, rx216_start
    sub rx216_off, rx216_pos, 1
    substr rx216_tgt, rx216_tgt, rx216_off
  rx216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan220_done
    goto rxscan220_scan
  rxscan220_loop:
    ($P10) = rx216_cur."from"()
    inc $P10
    set rx216_pos, $P10
    ge rx216_pos, rx216_eos, rxscan220_done
  rxscan220_scan:
    set_addr $I10, rxscan220_loop
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  rxscan220_done:
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."finishpad"()
    unless $P10, rx216_fail
    rx216_pos = $P10."pos"()
.annotate "line", 133
  # rx literal  "{"
    add $I11, rx216_pos, 1
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 1
    ne $S10, "{", rx216_fail
    add rx216_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."statementlist"()
    unless $P10, rx216_fail
    rx216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx216_pos = $P10."pos"()
  alt221_0:
    set_addr $I10, alt221_1
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  # rx literal  "}"
    add $I11, rx216_pos, 1
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 1
    ne $S10, "}", rx216_fail
    add rx216_pos, 1
    goto alt221_end
  alt221_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."FAILGOAL"("'}'")
    unless $P10, rx216_fail
    rx216_pos = $P10."pos"()
  alt221_end:
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."ENDSTMT"()
    unless $P10, rx216_fail
.annotate "line", 131
  # rx pass
    rx216_cur."!cursor_pass"(rx216_pos, "blockoid")
    rx216_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx216_pos)
    .return (rx216_cur)
  rx216_fail:
.annotate "line", 4
    (rx216_rep, rx216_pos, $I10, $P10) = rx216_cur."!mark_fail"(0)
    lt rx216_pos, -1, rx216_done
    eq rx216_pos, -1, rx216_fail
    jump $I10
  rx216_done:
    rx216_cur."!cursor_fail"()
    rx216_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx216_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1259420191.48826") :method
.annotate "line", 4
    $P218 = self."!PREFIX__!subrule"("", "")
    new $P219, "ResizablePMCArray"
    push $P219, $P218
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    set rx224_off, 0
    lt rx224_pos, 2, rx224_start
    sub rx224_off, rx224_pos, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan227_done
    goto rxscan227_scan
  rxscan227_loop:
    ($P10) = rx224_cur."from"()
    inc $P10
    set rx224_pos, $P10
    ge rx224_pos, rx224_eos, rxscan227_done
  rxscan227_scan:
    set_addr $I10, rxscan227_loop
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  rxscan227_done:
.annotate "line", 137
  # rx pass
    rx224_cur."!cursor_pass"(rx224_pos, "newpad")
    rx224_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx224_pos)
    .return (rx224_cur)
  rx224_fail:
.annotate "line", 4
    (rx224_rep, rx224_pos, $I10, $P10) = rx224_cur."!mark_fail"(0)
    lt rx224_pos, -1, rx224_done
    eq rx224_pos, -1, rx224_fail
    jump $I10
  rx224_done:
    rx224_cur."!cursor_fail"()
    rx224_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1259420191.48826") :method
.annotate "line", 4
    new $P226, "ResizablePMCArray"
    push $P226, ""
    .return ($P226)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    (rx229_cur, rx229_pos, rx229_tgt) = self."!cursor_start"()
    rx229_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx229_cur
    .local pmc match
    .lex "$/", match
    length rx229_eos, rx229_tgt
    set rx229_off, 0
    lt rx229_pos, 2, rx229_start
    sub rx229_off, rx229_pos, 1
    substr rx229_tgt, rx229_tgt, rx229_off
  rx229_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan232_done
    goto rxscan232_scan
  rxscan232_loop:
    ($P10) = rx229_cur."from"()
    inc $P10
    set rx229_pos, $P10
    ge rx229_pos, rx229_eos, rxscan232_done
  rxscan232_scan:
    set_addr $I10, rxscan232_loop
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  rxscan232_done:
.annotate "line", 138
  # rx pass
    rx229_cur."!cursor_pass"(rx229_pos, "finishpad")
    rx229_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx229_pos)
    .return (rx229_cur)
  rx229_fail:
.annotate "line", 4
    (rx229_rep, rx229_pos, $I10, $P10) = rx229_cur."!mark_fail"(0)
    lt rx229_pos, -1, rx229_done
    eq rx229_pos, -1, rx229_fail
    jump $I10
  rx229_done:
    rx229_cur."!cursor_fail"()
    rx229_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx229_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1259420191.48826") :method
.annotate "line", 4
    new $P231, "ResizablePMCArray"
    push $P231, ""
    .return ($P231)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1259420191.48826") :method
.annotate "line", 140
    $P234 = self."!protoregex"("terminator")
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1259420191.48826") :method
.annotate "line", 140
    $P236 = self."!PREFIX__!protoregex"("terminator")
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx238_tgt
    .local int rx238_pos
    .local int rx238_off
    .local int rx238_eos
    .local int rx238_rep
    .local pmc rx238_cur
    (rx238_cur, rx238_pos, rx238_tgt) = self."!cursor_start"()
    rx238_cur."!cursor_debug"("START ", "terminator:sym<;>")
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
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx238_pos, rx238_eos, rx238_fail
    sub $I10, rx238_pos, rx238_off
    substr $S10, rx238_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx238_fail
  # rx pass
    rx238_cur."!cursor_pass"(rx238_pos, "terminator:sym<;>")
    rx238_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx238_pos)
    .return (rx238_cur)
  rx238_fail:
.annotate "line", 4
    (rx238_rep, rx238_pos, $I10, $P10) = rx238_cur."!mark_fail"(0)
    lt rx238_pos, -1, rx238_done
    eq rx238_pos, -1, rx238_fail
    jump $I10
  rx238_done:
    rx238_cur."!cursor_fail"()
    rx238_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx238_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1259420191.48826") :method
.annotate "line", 4
    new $P240, "ResizablePMCArray"
    push $P240, ";"
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx243_tgt
    .local int rx243_pos
    .local int rx243_off
    .local int rx243_eos
    .local int rx243_rep
    .local pmc rx243_cur
    (rx243_cur, rx243_pos, rx243_tgt) = self."!cursor_start"()
    rx243_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx243_cur
    .local pmc match
    .lex "$/", match
    length rx243_eos, rx243_tgt
    set rx243_off, 0
    lt rx243_pos, 2, rx243_start
    sub rx243_off, rx243_pos, 1
    substr rx243_tgt, rx243_tgt, rx243_off
  rx243_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan246_done
    goto rxscan246_scan
  rxscan246_loop:
    ($P10) = rx243_cur."from"()
    inc $P10
    set rx243_pos, $P10
    ge rx243_pos, rx243_eos, rxscan246_done
  rxscan246_scan:
    set_addr $I10, rxscan246_loop
    rx243_cur."!mark_push"(0, rx243_pos, $I10)
  rxscan246_done:
.annotate "line", 143
  # rx enumcharlist negate=0 zerowidth
    ge rx243_pos, rx243_eos, rx243_fail
    sub $I10, rx243_pos, rx243_off
    substr $S10, rx243_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx243_fail
  # rx pass
    rx243_cur."!cursor_pass"(rx243_pos, "terminator:sym<}>")
    rx243_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx243_pos)
    .return (rx243_cur)
  rx243_fail:
.annotate "line", 4
    (rx243_rep, rx243_pos, $I10, $P10) = rx243_cur."!mark_fail"(0)
    lt rx243_pos, -1, rx243_done
    eq rx243_pos, -1, rx243_fail
    jump $I10
  rx243_done:
    rx243_cur."!cursor_fail"()
    rx243_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx243_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1259420191.48826") :method
.annotate "line", 4
    new $P245, "ResizablePMCArray"
    push $P245, "}"
    .return ($P245)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1259420191.48826") :method
.annotate "line", 147
    $P248 = self."!protoregex"("statement_control")
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1259420191.48826") :method
.annotate "line", 147
    $P250 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P250)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx252_cur."!cursor_caparray"("else", "xblock")
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
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_256_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "if"
    add $I11, rx252_pos, 2
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 2
    ne $S10, "if", rx252_fail
    add rx252_pos, 2
    set_addr $I10, rxcap_256_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_256_done
  rxcap_256_fail:
    goto rx252_fail
  rxcap_256_done:
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."xblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr259 ** 0..*
    set_addr $I263, rxquantr259_done
    rx252_cur."!mark_push"(0, rx252_pos, $I263)
  rxquantr259_loop:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "elsif", rx252_fail
    add rx252_pos, 5
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."xblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
    (rx252_rep) = rx252_cur."!mark_commit"($I263)
    rx252_cur."!mark_push"(rx252_rep, rx252_pos, $I263)
    goto rxquantr259_loop
  rxquantr259_done:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 153
  # rx rxquantr265 ** 0..1
    set_addr $I269, rxquantr265_done
    rx252_cur."!mark_push"(0, rx252_pos, $I269)
  rxquantr265_loop:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx252_pos, 4
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 4
    ne $S10, "else", rx252_fail
    add rx252_pos, 4
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."pblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
    (rx252_rep) = rx252_cur."!mark_commit"($I269)
  rxquantr265_done:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "statement_control:sym<if>")
    rx252_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx252_pos)
    .return (rx252_cur)
  rx252_fail:
.annotate "line", 4
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    rx252_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1259420191.48826") :method
.annotate "line", 4
    new $P254, "ResizablePMCArray"
    push $P254, "if"
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .const 'Sub' $P282 = "64_1259420191.48826" 
    capture_lex $P282
    .local string rx272_tgt
    .local int rx272_pos
    .local int rx272_off
    .local int rx272_eos
    .local int rx272_rep
    .local pmc rx272_cur
    (rx272_cur, rx272_pos, rx272_tgt) = self."!cursor_start"()
    rx272_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx272_cur
    .local pmc match
    .lex "$/", match
    length rx272_eos, rx272_tgt
    set rx272_off, 0
    lt rx272_pos, 2, rx272_start
    sub rx272_off, rx272_pos, 1
    substr rx272_tgt, rx272_tgt, rx272_off
  rx272_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan275_done
    goto rxscan275_scan
  rxscan275_loop:
    ($P10) = rx272_cur."from"()
    inc $P10
    set rx272_pos, $P10
    ge rx272_pos, rx272_eos, rxscan275_done
  rxscan275_scan:
    set_addr $I10, rxscan275_loop
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  rxscan275_done:
.annotate "line", 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_276_fail
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  # rx literal  "unless"
    add $I11, rx272_pos, 6
    gt $I11, rx272_eos, rx272_fail
    sub $I11, rx272_pos, rx272_off
    substr $S10, rx272_tgt, $I11, 6
    ne $S10, "unless", rx272_fail
    add rx272_pos, 6
    set_addr $I10, rxcap_276_fail
    ($I12, $I11) = rx272_cur."!mark_peek"($I10)
    rx272_cur."!cursor_pos"($I11)
    ($P10) = rx272_cur."!cursor_start"()
    $P10."!cursor_pass"(rx272_pos, "")
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_276_done
  rxcap_276_fail:
    goto rx272_fail
  rxcap_276_done:
  # rx charclass s
    ge rx272_pos, rx272_eos, rx272_fail
    sub $I10, rx272_pos, rx272_off
    is_cclass $I11, 32, rx272_tgt, $I10
    unless $I11, rx272_fail
    inc rx272_pos
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
.annotate "line", 158
  # rx subrule "xblock" subtype=capture negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."xblock"()
    unless $P10, rx272_fail
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx272_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  alt279_0:
.annotate "line", 159
    set_addr $I10, alt279_1
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx272_cur."!cursor_pos"(rx272_pos)
    .const 'Sub' $P282 = "64_1259420191.48826" 
    capture_lex $P282
    $P10 = rx272_cur."before"($P282)
    if $P10, rx272_fail
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
    goto alt279_end
  alt279_1:
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  alt279_end:
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
.annotate "line", 156
  # rx pass
    rx272_cur."!cursor_pass"(rx272_pos, "statement_control:sym<unless>")
    rx272_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx272_pos)
    .return (rx272_cur)
  rx272_fail:
.annotate "line", 4
    (rx272_rep, rx272_pos, $I10, $P10) = rx272_cur."!mark_fail"(0)
    lt rx272_pos, -1, rx272_done
    eq rx272_pos, -1, rx272_fail
    jump $I10
  rx272_done:
    rx272_cur."!cursor_fail"()
    rx272_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx272_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1259420191.48826") :method
.annotate "line", 4
    new $P274, "ResizablePMCArray"
    push $P274, "unless"
    .return ($P274)
.end


.namespace ["NQP";"Grammar"]
.sub "_block281"  :anon :subid("64_1259420191.48826") :method :outer("62_1259420191.48826")
.annotate "line", 159
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan284_done
    goto rxscan284_scan
  rxscan284_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan284_done
  rxscan284_scan:
    set_addr $I10, rxscan284_loop
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  rxscan284_done:
  # rx literal  "else"
    add $I11, rx283_pos, 4
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 4
    ne $S10, "else", rx283_fail
    add rx283_pos, 4
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "")
    rx283_cur."!cursor_debug"("PASS  ", "", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "")
    .return (rx283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt) = self."!cursor_start"()
    rx290_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    set rx290_off, 0
    lt rx290_pos, 2, rx290_start
    sub rx290_off, rx290_pos, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan293_done
    goto rxscan293_scan
  rxscan293_loop:
    ($P10) = rx290_cur."from"()
    inc $P10
    set rx290_pos, $P10
    ge rx290_pos, rx290_eos, rxscan293_done
  rxscan293_scan:
    set_addr $I10, rxscan293_loop
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxscan293_done:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_295_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  alt294_0:
    set_addr $I10, alt294_1
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx literal  "while"
    add $I11, rx290_pos, 5
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 5
    ne $S10, "while", rx290_fail
    add rx290_pos, 5
    goto alt294_end
  alt294_1:
  # rx literal  "until"
    add $I11, rx290_pos, 5
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 5
    ne $S10, "until", rx290_fail
    add rx290_pos, 5
  alt294_end:
    set_addr $I10, rxcap_295_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_295_done
  rxcap_295_fail:
    goto rx290_fail
  rxcap_295_done:
  # rx charclass s
    ge rx290_pos, rx290_eos, rx290_fail
    sub $I10, rx290_pos, rx290_off
    is_cclass $I11, 32, rx290_tgt, $I10
    unless $I11, rx290_fail
    inc rx290_pos
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."xblock"()
    unless $P10, rx290_fail
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx290_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx290_cur."!cursor_pass"(rx290_pos, "statement_control:sym<while>")
    rx290_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx290_pos)
    .return (rx290_cur)
  rx290_fail:
.annotate "line", 4
    (rx290_rep, rx290_pos, $I10, $P10) = rx290_cur."!mark_fail"(0)
    lt rx290_pos, -1, rx290_done
    eq rx290_pos, -1, rx290_fail
    jump $I10
  rx290_done:
    rx290_cur."!cursor_fail"()
    rx290_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1259420191.48826") :method
.annotate "line", 4
    new $P292, "ResizablePMCArray"
    push $P292, "until"
    push $P292, "while"
    .return ($P292)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx299_tgt
    .local int rx299_pos
    .local int rx299_off
    .local int rx299_eos
    .local int rx299_rep
    .local pmc rx299_cur
    (rx299_cur, rx299_pos, rx299_tgt) = self."!cursor_start"()
    rx299_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
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
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_303_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx299_pos, 6
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 6
    ne $S10, "repeat", rx299_fail
    add rx299_pos, 6
    set_addr $I10, rxcap_303_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_303_done
  rxcap_303_fail:
    goto rx299_fail
  rxcap_303_done:
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
  alt305_0:
.annotate "line", 169
    set_addr $I10, alt305_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_308_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  alt307_0:
    set_addr $I10, alt307_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "while"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "while", rx299_fail
    add rx299_pos, 5
    goto alt307_end
  alt307_1:
  # rx literal  "until"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "until", rx299_fail
    add rx299_pos, 5
  alt307_end:
    set_addr $I10, rxcap_308_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_308_done
  rxcap_308_fail:
    goto rx299_fail
  rxcap_308_done:
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
    goto alt305_end
  alt305_1:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."pblock"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_314_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  alt313_0:
    set_addr $I10, alt313_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "while"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "while", rx299_fail
    add rx299_pos, 5
    goto alt313_end
  alt313_1:
  # rx literal  "until"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "until", rx299_fail
    add rx299_pos, 5
  alt313_end:
    set_addr $I10, rxcap_314_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_314_done
  rxcap_314_fail:
    goto rx299_fail
  rxcap_314_done:
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
  # rx subrule "EXPR" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."EXPR"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  alt305_end:
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx299_cur."!cursor_pass"(rx299_pos, "statement_control:sym<repeat>")
    rx299_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx299_pos)
    .return (rx299_cur)
  rx299_fail:
.annotate "line", 4
    (rx299_rep, rx299_pos, $I10, $P10) = rx299_cur."!mark_fail"(0)
    lt rx299_pos, -1, rx299_done
    eq rx299_pos, -1, rx299_fail
    jump $I10
  rx299_done:
    rx299_cur."!cursor_fail"()
    rx299_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx299_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1259420191.48826") :method
.annotate "line", 4
    new $P301, "ResizablePMCArray"
    push $P301, "repeat"
    .return ($P301)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    (rx319_cur, rx319_pos, rx319_tgt) = self."!cursor_start"()
    rx319_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx319_cur
    .local pmc match
    .lex "$/", match
    length rx319_eos, rx319_tgt
    set rx319_off, 0
    lt rx319_pos, 2, rx319_start
    sub rx319_off, rx319_pos, 1
    substr rx319_tgt, rx319_tgt, rx319_off
  rx319_start:
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
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_323_fail
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  # rx literal  "for"
    add $I11, rx319_pos, 3
    gt $I11, rx319_eos, rx319_fail
    sub $I11, rx319_pos, rx319_off
    substr $S10, rx319_tgt, $I11, 3
    ne $S10, "for", rx319_fail
    add rx319_pos, 3
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
.annotate "line", 177
  # rx subrule "xblock" subtype=capture negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."xblock"()
    unless $P10, rx319_fail
    rx319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx319_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."ws"()
    unless $P10, rx319_fail
    rx319_pos = $P10."pos"()
.annotate "line", 175
  # rx pass
    rx319_cur."!cursor_pass"(rx319_pos, "statement_control:sym<for>")
    rx319_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx319_pos)
    .return (rx319_cur)
  rx319_fail:
.annotate "line", 4
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    rx319_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1259420191.48826") :method
.annotate "line", 4
    new $P321, "ResizablePMCArray"
    push $P321, "for"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx327_tgt
    .local int rx327_pos
    .local int rx327_off
    .local int rx327_eos
    .local int rx327_rep
    .local pmc rx327_cur
    (rx327_cur, rx327_pos, rx327_tgt) = self."!cursor_start"()
    rx327_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx327_cur
    .local pmc match
    .lex "$/", match
    length rx327_eos, rx327_tgt
    set rx327_off, 0
    lt rx327_pos, 2, rx327_start
    sub rx327_off, rx327_pos, 1
    substr rx327_tgt, rx327_tgt, rx327_off
  rx327_start:
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
.annotate "line", 181
  # rx subcapture "sym"
    set_addr $I10, rxcap_331_fail
    rx327_cur."!mark_push"(0, rx327_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx327_pos, 5
    gt $I11, rx327_eos, rx327_fail
    sub $I11, rx327_pos, rx327_off
    substr $S10, rx327_tgt, $I11, 5
    ne $S10, "CATCH", rx327_fail
    add rx327_pos, 5
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
.annotate "line", 182
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
.annotate "line", 180
  # rx pass
    rx327_cur."!cursor_pass"(rx327_pos, "statement_control:sym<CATCH>")
    rx327_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx327_pos)
    .return (rx327_cur)
  rx327_fail:
.annotate "line", 4
    (rx327_rep, rx327_pos, $I10, $P10) = rx327_cur."!mark_fail"(0)
    lt rx327_pos, -1, rx327_done
    eq rx327_pos, -1, rx327_fail
    jump $I10
  rx327_done:
    rx327_cur."!cursor_fail"()
    rx327_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx327_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1259420191.48826") :method
.annotate "line", 4
    new $P329, "ResizablePMCArray"
    push $P329, "CATCH"
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx335_tgt
    .local int rx335_pos
    .local int rx335_off
    .local int rx335_eos
    .local int rx335_rep
    .local pmc rx335_cur
    (rx335_cur, rx335_pos, rx335_tgt) = self."!cursor_start"()
    rx335_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx335_cur
    .local pmc match
    .lex "$/", match
    length rx335_eos, rx335_tgt
    set rx335_off, 0
    lt rx335_pos, 2, rx335_start
    sub rx335_off, rx335_pos, 1
    substr rx335_tgt, rx335_tgt, rx335_off
  rx335_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan338_done
    goto rxscan338_scan
  rxscan338_loop:
    ($P10) = rx335_cur."from"()
    inc $P10
    set rx335_pos, $P10
    ge rx335_pos, rx335_eos, rxscan338_done
  rxscan338_scan:
    set_addr $I10, rxscan338_loop
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
  rxscan338_done:
.annotate "line", 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_339_fail
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx335_pos, 7
    gt $I11, rx335_eos, rx335_fail
    sub $I11, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I11, 7
    ne $S10, "CONTROL", rx335_fail
    add rx335_pos, 7
    set_addr $I10, rxcap_339_fail
    ($I12, $I11) = rx335_cur."!mark_peek"($I10)
    rx335_cur."!cursor_pos"($I11)
    ($P10) = rx335_cur."!cursor_start"()
    $P10."!cursor_pass"(rx335_pos, "")
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_339_done
  rxcap_339_fail:
    goto rx335_fail
  rxcap_339_done:
  # rx charclass s
    ge rx335_pos, rx335_eos, rx335_fail
    sub $I10, rx335_pos, rx335_off
    is_cclass $I11, 32, rx335_tgt, $I10
    unless $I11, rx335_fail
    inc rx335_pos
  # rx subrule "ws" subtype=method negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."ws"()
    unless $P10, rx335_fail
    rx335_pos = $P10."pos"()
.annotate "line", 187
  # rx subrule "block" subtype=capture negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."block"()
    unless $P10, rx335_fail
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx335_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."ws"()
    unless $P10, rx335_fail
    rx335_pos = $P10."pos"()
.annotate "line", 185
  # rx pass
    rx335_cur."!cursor_pass"(rx335_pos, "statement_control:sym<CONTROL>")
    rx335_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx335_pos)
    .return (rx335_cur)
  rx335_fail:
.annotate "line", 4
    (rx335_rep, rx335_pos, $I10, $P10) = rx335_cur."!mark_fail"(0)
    lt rx335_pos, -1, rx335_done
    eq rx335_pos, -1, rx335_fail
    jump $I10
  rx335_done:
    rx335_cur."!cursor_fail"()
    rx335_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx335_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1259420191.48826") :method
.annotate "line", 4
    new $P337, "ResizablePMCArray"
    push $P337, "CONTROL"
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1259420191.48826") :method
.annotate "line", 190
    $P343 = self."!protoregex"("statement_prefix")
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1259420191.48826") :method
.annotate "line", 190
    $P345 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P345)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    (rx347_cur, rx347_pos, rx347_tgt) = self."!cursor_start"()
    rx347_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
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
.annotate "line", 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx347_pos, 4
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    substr $S10, rx347_tgt, $I11, 4
    ne $S10, "INIT", rx347_fail
    add rx347_pos, 4
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
  # rx subrule "blorst" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."blorst"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx347_pos = $P10."pos"()
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "statement_prefix:sym<INIT>")
    rx347_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx347_pos)
    .return (rx347_cur)
  rx347_fail:
.annotate "line", 4
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    rx347_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx347_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1259420191.48826") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx354_tgt
    .local int rx354_pos
    .local int rx354_off
    .local int rx354_eos
    .local int rx354_rep
    .local pmc rx354_cur
    (rx354_cur, rx354_pos, rx354_tgt) = self."!cursor_start"()
    rx354_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
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
    ne $I10, -1, rxscan358_done
    goto rxscan358_scan
  rxscan358_loop:
    ($P10) = rx354_cur."from"()
    inc $P10
    set rx354_pos, $P10
    ge rx354_pos, rx354_eos, rxscan358_done
  rxscan358_scan:
    set_addr $I10, rxscan358_loop
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  rxscan358_done:
.annotate "line", 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_359_fail
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  # rx literal  "try"
    add $I11, rx354_pos, 3
    gt $I11, rx354_eos, rx354_fail
    sub $I11, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I11, 3
    ne $S10, "try", rx354_fail
    add rx354_pos, 3
    set_addr $I10, rxcap_359_fail
    ($I12, $I11) = rx354_cur."!mark_peek"($I10)
    rx354_cur."!cursor_pos"($I11)
    ($P10) = rx354_cur."!cursor_start"()
    $P10."!cursor_pass"(rx354_pos, "")
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_359_done
  rxcap_359_fail:
    goto rx354_fail
  rxcap_359_done:
.annotate "line", 195
  # rx subrule "blorst" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."blorst"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx354_pos = $P10."pos"()
.annotate "line", 193
  # rx pass
    rx354_cur."!cursor_pass"(rx354_pos, "statement_prefix:sym<try>")
    rx354_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx354_pos)
    .return (rx354_cur)
  rx354_fail:
.annotate "line", 4
    (rx354_rep, rx354_pos, $I10, $P10) = rx354_cur."!mark_fail"(0)
    lt rx354_pos, -1, rx354_done
    eq rx354_pos, -1, rx354_fail
    jump $I10
  rx354_done:
    rx354_cur."!cursor_fail"()
    rx354_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx354_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1259420191.48826") :method
.annotate "line", 4
    $P356 = self."!PREFIX__!subrule"("blorst", "try")
    new $P357, "ResizablePMCArray"
    push $P357, $P356
    .return ($P357)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx361_tgt
    .local int rx361_pos
    .local int rx361_off
    .local int rx361_eos
    .local int rx361_rep
    .local pmc rx361_cur
    (rx361_cur, rx361_pos, rx361_tgt) = self."!cursor_start"()
    rx361_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx361_cur
    .local pmc match
    .lex "$/", match
    length rx361_eos, rx361_tgt
    set rx361_off, 0
    lt rx361_pos, 2, rx361_start
    sub rx361_off, rx361_pos, 1
    substr rx361_tgt, rx361_tgt, rx361_off
  rx361_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan364_done
    goto rxscan364_scan
  rxscan364_loop:
    ($P10) = rx361_cur."from"()
    inc $P10
    set rx361_pos, $P10
    ge rx361_pos, rx361_eos, rxscan364_done
  rxscan364_scan:
    set_addr $I10, rxscan364_loop
    rx361_cur."!mark_push"(0, rx361_pos, $I10)
  rxscan364_done:
.annotate "line", 199
  # rx charclass s
    ge rx361_pos, rx361_eos, rx361_fail
    sub $I10, rx361_pos, rx361_off
    is_cclass $I11, 32, rx361_tgt, $I10
    unless $I11, rx361_fail
    inc rx361_pos
  # rx subrule "ws" subtype=method negate=
    rx361_cur."!cursor_pos"(rx361_pos)
    $P10 = rx361_cur."ws"()
    unless $P10, rx361_fail
    rx361_pos = $P10."pos"()
  alt365_0:
    set_addr $I10, alt365_1
    rx361_cur."!mark_push"(0, rx361_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx361_pos, rx361_eos, rx361_fail
    sub $I10, rx361_pos, rx361_off
    substr $S10, rx361_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx361_fail
  # rx subrule "block" subtype=capture negate=
    rx361_cur."!cursor_pos"(rx361_pos)
    $P10 = rx361_cur."block"()
    unless $P10, rx361_fail
    rx361_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx361_pos = $P10."pos"()
    goto alt365_end
  alt365_1:
  # rx subrule "statement" subtype=capture negate=
    rx361_cur."!cursor_pos"(rx361_pos)
    $P10 = rx361_cur."statement"()
    unless $P10, rx361_fail
    rx361_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx361_pos = $P10."pos"()
  alt365_end:
.annotate "line", 198
  # rx pass
    rx361_cur."!cursor_pass"(rx361_pos, "blorst")
    rx361_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx361_pos)
    .return (rx361_cur)
  rx361_fail:
.annotate "line", 4
    (rx361_rep, rx361_pos, $I10, $P10) = rx361_cur."!mark_fail"(0)
    lt rx361_pos, -1, rx361_done
    eq rx361_pos, -1, rx361_fail
    jump $I10
  rx361_done:
    rx361_cur."!cursor_fail"()
    rx361_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx361_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1259420191.48826") :method
.annotate "line", 4
    new $P363, "ResizablePMCArray"
    push $P363, ""
    .return ($P363)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1259420191.48826") :method
.annotate "line", 204
    $P367 = self."!protoregex"("statement_mod_cond")
    .return ($P367)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1259420191.48826") :method
.annotate "line", 204
    $P369 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P369)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx371_tgt
    .local int rx371_pos
    .local int rx371_off
    .local int rx371_eos
    .local int rx371_rep
    .local pmc rx371_cur
    (rx371_cur, rx371_pos, rx371_tgt) = self."!cursor_start"()
    rx371_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx371_cur
    .local pmc match
    .lex "$/", match
    length rx371_eos, rx371_tgt
    set rx371_off, 0
    lt rx371_pos, 2, rx371_start
    sub rx371_off, rx371_pos, 1
    substr rx371_tgt, rx371_tgt, rx371_off
  rx371_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan374_done
    goto rxscan374_scan
  rxscan374_loop:
    ($P10) = rx371_cur."from"()
    inc $P10
    set rx371_pos, $P10
    ge rx371_pos, rx371_eos, rxscan374_done
  rxscan374_scan:
    set_addr $I10, rxscan374_loop
    rx371_cur."!mark_push"(0, rx371_pos, $I10)
  rxscan374_done:
.annotate "line", 206
  # rx subcapture "sym"
    set_addr $I10, rxcap_375_fail
    rx371_cur."!mark_push"(0, rx371_pos, $I10)
  # rx literal  "if"
    add $I11, rx371_pos, 2
    gt $I11, rx371_eos, rx371_fail
    sub $I11, rx371_pos, rx371_off
    substr $S10, rx371_tgt, $I11, 2
    ne $S10, "if", rx371_fail
    add rx371_pos, 2
    set_addr $I10, rxcap_375_fail
    ($I12, $I11) = rx371_cur."!mark_peek"($I10)
    rx371_cur."!cursor_pos"($I11)
    ($P10) = rx371_cur."!cursor_start"()
    $P10."!cursor_pass"(rx371_pos, "")
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_375_done
  rxcap_375_fail:
    goto rx371_fail
  rxcap_375_done:
  # rx subrule "ws" subtype=method negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."ws"()
    unless $P10, rx371_fail
    rx371_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."EXPR"()
    unless $P10, rx371_fail
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx371_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."ws"()
    unless $P10, rx371_fail
    rx371_pos = $P10."pos"()
  # rx pass
    rx371_cur."!cursor_pass"(rx371_pos, "statement_mod_cond:sym<if>")
    rx371_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx371_pos)
    .return (rx371_cur)
  rx371_fail:
.annotate "line", 4
    (rx371_rep, rx371_pos, $I10, $P10) = rx371_cur."!mark_fail"(0)
    lt rx371_pos, -1, rx371_done
    eq rx371_pos, -1, rx371_fail
    jump $I10
  rx371_done:
    rx371_cur."!cursor_fail"()
    rx371_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx371_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1259420191.48826") :method
.annotate "line", 4
    new $P373, "ResizablePMCArray"
    push $P373, "if"
    .return ($P373)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx379_tgt
    .local int rx379_pos
    .local int rx379_off
    .local int rx379_eos
    .local int rx379_rep
    .local pmc rx379_cur
    (rx379_cur, rx379_pos, rx379_tgt) = self."!cursor_start"()
    rx379_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx379_cur
    .local pmc match
    .lex "$/", match
    length rx379_eos, rx379_tgt
    set rx379_off, 0
    lt rx379_pos, 2, rx379_start
    sub rx379_off, rx379_pos, 1
    substr rx379_tgt, rx379_tgt, rx379_off
  rx379_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan382_done
    goto rxscan382_scan
  rxscan382_loop:
    ($P10) = rx379_cur."from"()
    inc $P10
    set rx379_pos, $P10
    ge rx379_pos, rx379_eos, rxscan382_done
  rxscan382_scan:
    set_addr $I10, rxscan382_loop
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  rxscan382_done:
.annotate "line", 207
  # rx subcapture "sym"
    set_addr $I10, rxcap_383_fail
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  # rx literal  "unless"
    add $I11, rx379_pos, 6
    gt $I11, rx379_eos, rx379_fail
    sub $I11, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I11, 6
    ne $S10, "unless", rx379_fail
    add rx379_pos, 6
    set_addr $I10, rxcap_383_fail
    ($I12, $I11) = rx379_cur."!mark_peek"($I10)
    rx379_cur."!cursor_pos"($I11)
    ($P10) = rx379_cur."!cursor_start"()
    $P10."!cursor_pass"(rx379_pos, "")
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_383_done
  rxcap_383_fail:
    goto rx379_fail
  rxcap_383_done:
  # rx subrule "ws" subtype=method negate=
    rx379_cur."!cursor_pos"(rx379_pos)
    $P10 = rx379_cur."ws"()
    unless $P10, rx379_fail
    rx379_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx379_cur."!cursor_pos"(rx379_pos)
    $P10 = rx379_cur."EXPR"()
    unless $P10, rx379_fail
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx379_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx379_cur."!cursor_pos"(rx379_pos)
    $P10 = rx379_cur."ws"()
    unless $P10, rx379_fail
    rx379_pos = $P10."pos"()
  # rx pass
    rx379_cur."!cursor_pass"(rx379_pos, "statement_mod_cond:sym<unless>")
    rx379_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx379_pos)
    .return (rx379_cur)
  rx379_fail:
.annotate "line", 4
    (rx379_rep, rx379_pos, $I10, $P10) = rx379_cur."!mark_fail"(0)
    lt rx379_pos, -1, rx379_done
    eq rx379_pos, -1, rx379_fail
    jump $I10
  rx379_done:
    rx379_cur."!cursor_fail"()
    rx379_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx379_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1259420191.48826") :method
.annotate "line", 4
    new $P381, "ResizablePMCArray"
    push $P381, "unless"
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1259420191.48826") :method
.annotate "line", 209
    $P387 = self."!protoregex"("statement_mod_loop")
    .return ($P387)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1259420191.48826") :method
.annotate "line", 209
    $P389 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P389)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx391_tgt
    .local int rx391_pos
    .local int rx391_off
    .local int rx391_eos
    .local int rx391_rep
    .local pmc rx391_cur
    (rx391_cur, rx391_pos, rx391_tgt) = self."!cursor_start"()
    rx391_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx391_cur
    .local pmc match
    .lex "$/", match
    length rx391_eos, rx391_tgt
    set rx391_off, 0
    lt rx391_pos, 2, rx391_start
    sub rx391_off, rx391_pos, 1
    substr rx391_tgt, rx391_tgt, rx391_off
  rx391_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan394_done
    goto rxscan394_scan
  rxscan394_loop:
    ($P10) = rx391_cur."from"()
    inc $P10
    set rx391_pos, $P10
    ge rx391_pos, rx391_eos, rxscan394_done
  rxscan394_scan:
    set_addr $I10, rxscan394_loop
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  rxscan394_done:
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_395_fail
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  # rx literal  "while"
    add $I11, rx391_pos, 5
    gt $I11, rx391_eos, rx391_fail
    sub $I11, rx391_pos, rx391_off
    substr $S10, rx391_tgt, $I11, 5
    ne $S10, "while", rx391_fail
    add rx391_pos, 5
    set_addr $I10, rxcap_395_fail
    ($I12, $I11) = rx391_cur."!mark_peek"($I10)
    rx391_cur."!cursor_pos"($I11)
    ($P10) = rx391_cur."!cursor_start"()
    $P10."!cursor_pass"(rx391_pos, "")
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_395_done
  rxcap_395_fail:
    goto rx391_fail
  rxcap_395_done:
  # rx subrule "ws" subtype=method negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."ws"()
    unless $P10, rx391_fail
    rx391_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."EXPR"()
    unless $P10, rx391_fail
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx391_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."ws"()
    unless $P10, rx391_fail
    rx391_pos = $P10."pos"()
  # rx pass
    rx391_cur."!cursor_pass"(rx391_pos, "statement_mod_loop:sym<while>")
    rx391_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx391_pos)
    .return (rx391_cur)
  rx391_fail:
.annotate "line", 4
    (rx391_rep, rx391_pos, $I10, $P10) = rx391_cur."!mark_fail"(0)
    lt rx391_pos, -1, rx391_done
    eq rx391_pos, -1, rx391_fail
    jump $I10
  rx391_done:
    rx391_cur."!cursor_fail"()
    rx391_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx391_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1259420191.48826") :method
.annotate "line", 4
    new $P393, "ResizablePMCArray"
    push $P393, "while"
    .return ($P393)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx399_tgt
    .local int rx399_pos
    .local int rx399_off
    .local int rx399_eos
    .local int rx399_rep
    .local pmc rx399_cur
    (rx399_cur, rx399_pos, rx399_tgt) = self."!cursor_start"()
    rx399_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx399_cur
    .local pmc match
    .lex "$/", match
    length rx399_eos, rx399_tgt
    set rx399_off, 0
    lt rx399_pos, 2, rx399_start
    sub rx399_off, rx399_pos, 1
    substr rx399_tgt, rx399_tgt, rx399_off
  rx399_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan402_done
    goto rxscan402_scan
  rxscan402_loop:
    ($P10) = rx399_cur."from"()
    inc $P10
    set rx399_pos, $P10
    ge rx399_pos, rx399_eos, rxscan402_done
  rxscan402_scan:
    set_addr $I10, rxscan402_loop
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  rxscan402_done:
.annotate "line", 212
  # rx subcapture "sym"
    set_addr $I10, rxcap_403_fail
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx literal  "until"
    add $I11, rx399_pos, 5
    gt $I11, rx399_eos, rx399_fail
    sub $I11, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I11, 5
    ne $S10, "until", rx399_fail
    add rx399_pos, 5
    set_addr $I10, rxcap_403_fail
    ($I12, $I11) = rx399_cur."!mark_peek"($I10)
    rx399_cur."!cursor_pos"($I11)
    ($P10) = rx399_cur."!cursor_start"()
    $P10."!cursor_pass"(rx399_pos, "")
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_403_done
  rxcap_403_fail:
    goto rx399_fail
  rxcap_403_done:
  # rx subrule "ws" subtype=method negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."ws"()
    unless $P10, rx399_fail
    rx399_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."EXPR"()
    unless $P10, rx399_fail
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx399_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."ws"()
    unless $P10, rx399_fail
    rx399_pos = $P10."pos"()
  # rx pass
    rx399_cur."!cursor_pass"(rx399_pos, "statement_mod_loop:sym<until>")
    rx399_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx399_pos)
    .return (rx399_cur)
  rx399_fail:
.annotate "line", 4
    (rx399_rep, rx399_pos, $I10, $P10) = rx399_cur."!mark_fail"(0)
    lt rx399_pos, -1, rx399_done
    eq rx399_pos, -1, rx399_fail
    jump $I10
  rx399_done:
    rx399_cur."!cursor_fail"()
    rx399_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx399_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1259420191.48826") :method
.annotate "line", 4
    new $P401, "ResizablePMCArray"
    push $P401, "until"
    .return ($P401)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("95_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx407_tgt
    .local int rx407_pos
    .local int rx407_off
    .local int rx407_eos
    .local int rx407_rep
    .local pmc rx407_cur
    (rx407_cur, rx407_pos, rx407_tgt) = self."!cursor_start"()
    rx407_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx407_cur
    .local pmc match
    .lex "$/", match
    length rx407_eos, rx407_tgt
    set rx407_off, 0
    lt rx407_pos, 2, rx407_start
    sub rx407_off, rx407_pos, 1
    substr rx407_tgt, rx407_tgt, rx407_off
  rx407_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan411_done
    goto rxscan411_scan
  rxscan411_loop:
    ($P10) = rx407_cur."from"()
    inc $P10
    set rx407_pos, $P10
    ge rx407_pos, rx407_eos, rxscan411_done
  rxscan411_scan:
    set_addr $I10, rxscan411_loop
    rx407_cur."!mark_push"(0, rx407_pos, $I10)
  rxscan411_done:
.annotate "line", 216
  # rx subrule "colonpair" subtype=capture negate=
    rx407_cur."!cursor_pos"(rx407_pos)
    $P10 = rx407_cur."colonpair"()
    unless $P10, rx407_fail
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx407_pos = $P10."pos"()
  # rx pass
    rx407_cur."!cursor_pass"(rx407_pos, "term:sym<colonpair>")
    rx407_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx407_pos)
    .return (rx407_cur)
  rx407_fail:
.annotate "line", 4
    (rx407_rep, rx407_pos, $I10, $P10) = rx407_cur."!mark_fail"(0)
    lt rx407_pos, -1, rx407_done
    eq rx407_pos, -1, rx407_fail
    jump $I10
  rx407_done:
    rx407_cur."!cursor_fail"()
    rx407_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx407_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("96_1259420191.48826") :method
.annotate "line", 4
    $P409 = self."!PREFIX__!subrule"("colonpair", "")
    new $P410, "ResizablePMCArray"
    push $P410, $P409
    .return ($P410)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("97_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx413_tgt
    .local int rx413_pos
    .local int rx413_off
    .local int rx413_eos
    .local int rx413_rep
    .local pmc rx413_cur
    (rx413_cur, rx413_pos, rx413_tgt) = self."!cursor_start"()
    rx413_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx413_cur
    .local pmc match
    .lex "$/", match
    length rx413_eos, rx413_tgt
    set rx413_off, 0
    lt rx413_pos, 2, rx413_start
    sub rx413_off, rx413_pos, 1
    substr rx413_tgt, rx413_tgt, rx413_off
  rx413_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan417_done
    goto rxscan417_scan
  rxscan417_loop:
    ($P10) = rx413_cur."from"()
    inc $P10
    set rx413_pos, $P10
    ge rx413_pos, rx413_eos, rxscan417_done
  rxscan417_scan:
    set_addr $I10, rxscan417_loop
    rx413_cur."!mark_push"(0, rx413_pos, $I10)
  rxscan417_done:
.annotate "line", 217
  # rx subrule "variable" subtype=capture negate=
    rx413_cur."!cursor_pos"(rx413_pos)
    $P10 = rx413_cur."variable"()
    unless $P10, rx413_fail
    rx413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx413_pos = $P10."pos"()
  # rx pass
    rx413_cur."!cursor_pass"(rx413_pos, "term:sym<variable>")
    rx413_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx413_pos)
    .return (rx413_cur)
  rx413_fail:
.annotate "line", 4
    (rx413_rep, rx413_pos, $I10, $P10) = rx413_cur."!mark_fail"(0)
    lt rx413_pos, -1, rx413_done
    eq rx413_pos, -1, rx413_fail
    jump $I10
  rx413_done:
    rx413_cur."!cursor_fail"()
    rx413_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx413_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("98_1259420191.48826") :method
.annotate "line", 4
    $P415 = self."!PREFIX__!subrule"("variable", "")
    new $P416, "ResizablePMCArray"
    push $P416, $P415
    .return ($P416)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("99_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx419_tgt
    .local int rx419_pos
    .local int rx419_off
    .local int rx419_eos
    .local int rx419_rep
    .local pmc rx419_cur
    (rx419_cur, rx419_pos, rx419_tgt) = self."!cursor_start"()
    rx419_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx419_cur
    .local pmc match
    .lex "$/", match
    length rx419_eos, rx419_tgt
    set rx419_off, 0
    lt rx419_pos, 2, rx419_start
    sub rx419_off, rx419_pos, 1
    substr rx419_tgt, rx419_tgt, rx419_off
  rx419_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan423_done
    goto rxscan423_scan
  rxscan423_loop:
    ($P10) = rx419_cur."from"()
    inc $P10
    set rx419_pos, $P10
    ge rx419_pos, rx419_eos, rxscan423_done
  rxscan423_scan:
    set_addr $I10, rxscan423_loop
    rx419_cur."!mark_push"(0, rx419_pos, $I10)
  rxscan423_done:
.annotate "line", 218
  # rx subrule "package_declarator" subtype=capture negate=
    rx419_cur."!cursor_pos"(rx419_pos)
    $P10 = rx419_cur."package_declarator"()
    unless $P10, rx419_fail
    rx419_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx419_pos = $P10."pos"()
  # rx pass
    rx419_cur."!cursor_pass"(rx419_pos, "term:sym<package_declarator>")
    rx419_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx419_pos)
    .return (rx419_cur)
  rx419_fail:
.annotate "line", 4
    (rx419_rep, rx419_pos, $I10, $P10) = rx419_cur."!mark_fail"(0)
    lt rx419_pos, -1, rx419_done
    eq rx419_pos, -1, rx419_fail
    jump $I10
  rx419_done:
    rx419_cur."!cursor_fail"()
    rx419_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx419_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("100_1259420191.48826") :method
.annotate "line", 4
    $P421 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P422, "ResizablePMCArray"
    push $P422, $P421
    .return ($P422)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("101_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx425_tgt
    .local int rx425_pos
    .local int rx425_off
    .local int rx425_eos
    .local int rx425_rep
    .local pmc rx425_cur
    (rx425_cur, rx425_pos, rx425_tgt) = self."!cursor_start"()
    rx425_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx425_cur
    .local pmc match
    .lex "$/", match
    length rx425_eos, rx425_tgt
    set rx425_off, 0
    lt rx425_pos, 2, rx425_start
    sub rx425_off, rx425_pos, 1
    substr rx425_tgt, rx425_tgt, rx425_off
  rx425_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan429_done
    goto rxscan429_scan
  rxscan429_loop:
    ($P10) = rx425_cur."from"()
    inc $P10
    set rx425_pos, $P10
    ge rx425_pos, rx425_eos, rxscan429_done
  rxscan429_scan:
    set_addr $I10, rxscan429_loop
    rx425_cur."!mark_push"(0, rx425_pos, $I10)
  rxscan429_done:
.annotate "line", 219
  # rx subrule "scope_declarator" subtype=capture negate=
    rx425_cur."!cursor_pos"(rx425_pos)
    $P10 = rx425_cur."scope_declarator"()
    unless $P10, rx425_fail
    rx425_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx425_pos = $P10."pos"()
  # rx pass
    rx425_cur."!cursor_pass"(rx425_pos, "term:sym<scope_declarator>")
    rx425_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx425_pos)
    .return (rx425_cur)
  rx425_fail:
.annotate "line", 4
    (rx425_rep, rx425_pos, $I10, $P10) = rx425_cur."!mark_fail"(0)
    lt rx425_pos, -1, rx425_done
    eq rx425_pos, -1, rx425_fail
    jump $I10
  rx425_done:
    rx425_cur."!cursor_fail"()
    rx425_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx425_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("102_1259420191.48826") :method
.annotate "line", 4
    $P427 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P428, "ResizablePMCArray"
    push $P428, $P427
    .return ($P428)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("103_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx431_tgt
    .local int rx431_pos
    .local int rx431_off
    .local int rx431_eos
    .local int rx431_rep
    .local pmc rx431_cur
    (rx431_cur, rx431_pos, rx431_tgt) = self."!cursor_start"()
    rx431_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx431_cur
    .local pmc match
    .lex "$/", match
    length rx431_eos, rx431_tgt
    set rx431_off, 0
    lt rx431_pos, 2, rx431_start
    sub rx431_off, rx431_pos, 1
    substr rx431_tgt, rx431_tgt, rx431_off
  rx431_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan435_done
    goto rxscan435_scan
  rxscan435_loop:
    ($P10) = rx431_cur."from"()
    inc $P10
    set rx431_pos, $P10
    ge rx431_pos, rx431_eos, rxscan435_done
  rxscan435_scan:
    set_addr $I10, rxscan435_loop
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
  rxscan435_done:
.annotate "line", 220
  # rx subrule "routine_declarator" subtype=capture negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."routine_declarator"()
    unless $P10, rx431_fail
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx431_pos = $P10."pos"()
  # rx pass
    rx431_cur."!cursor_pass"(rx431_pos, "term:sym<routine_declarator>")
    rx431_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx431_pos)
    .return (rx431_cur)
  rx431_fail:
.annotate "line", 4
    (rx431_rep, rx431_pos, $I10, $P10) = rx431_cur."!mark_fail"(0)
    lt rx431_pos, -1, rx431_done
    eq rx431_pos, -1, rx431_fail
    jump $I10
  rx431_done:
    rx431_cur."!cursor_fail"()
    rx431_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx431_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("104_1259420191.48826") :method
.annotate "line", 4
    $P433 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P434, "ResizablePMCArray"
    push $P434, $P433
    .return ($P434)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("105_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx437_tgt
    .local int rx437_pos
    .local int rx437_off
    .local int rx437_eos
    .local int rx437_rep
    .local pmc rx437_cur
    (rx437_cur, rx437_pos, rx437_tgt) = self."!cursor_start"()
    rx437_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx437_cur
    .local pmc match
    .lex "$/", match
    length rx437_eos, rx437_tgt
    set rx437_off, 0
    lt rx437_pos, 2, rx437_start
    sub rx437_off, rx437_pos, 1
    substr rx437_tgt, rx437_tgt, rx437_off
  rx437_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan441_done
    goto rxscan441_scan
  rxscan441_loop:
    ($P10) = rx437_cur."from"()
    inc $P10
    set rx437_pos, $P10
    ge rx437_pos, rx437_eos, rxscan441_done
  rxscan441_scan:
    set_addr $I10, rxscan441_loop
    rx437_cur."!mark_push"(0, rx437_pos, $I10)
  rxscan441_done:
.annotate "line", 221
  # rx subrule "regex_declarator" subtype=capture negate=
    rx437_cur."!cursor_pos"(rx437_pos)
    $P10 = rx437_cur."regex_declarator"()
    unless $P10, rx437_fail
    rx437_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx437_pos = $P10."pos"()
  # rx pass
    rx437_cur."!cursor_pass"(rx437_pos, "term:sym<regex_declarator>")
    rx437_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx437_pos)
    .return (rx437_cur)
  rx437_fail:
.annotate "line", 4
    (rx437_rep, rx437_pos, $I10, $P10) = rx437_cur."!mark_fail"(0)
    lt rx437_pos, -1, rx437_done
    eq rx437_pos, -1, rx437_fail
    jump $I10
  rx437_done:
    rx437_cur."!cursor_fail"()
    rx437_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx437_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("106_1259420191.48826") :method
.annotate "line", 4
    $P439 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P440, "ResizablePMCArray"
    push $P440, $P439
    .return ($P440)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("107_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx443_tgt
    .local int rx443_pos
    .local int rx443_off
    .local int rx443_eos
    .local int rx443_rep
    .local pmc rx443_cur
    (rx443_cur, rx443_pos, rx443_tgt) = self."!cursor_start"()
    rx443_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx443_cur
    .local pmc match
    .lex "$/", match
    length rx443_eos, rx443_tgt
    set rx443_off, 0
    lt rx443_pos, 2, rx443_start
    sub rx443_off, rx443_pos, 1
    substr rx443_tgt, rx443_tgt, rx443_off
  rx443_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan447_done
    goto rxscan447_scan
  rxscan447_loop:
    ($P10) = rx443_cur."from"()
    inc $P10
    set rx443_pos, $P10
    ge rx443_pos, rx443_eos, rxscan447_done
  rxscan447_scan:
    set_addr $I10, rxscan447_loop
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  rxscan447_done:
.annotate "line", 222
  # rx subrule "statement_prefix" subtype=capture negate=
    rx443_cur."!cursor_pos"(rx443_pos)
    $P10 = rx443_cur."statement_prefix"()
    unless $P10, rx443_fail
    rx443_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx443_pos = $P10."pos"()
  # rx pass
    rx443_cur."!cursor_pass"(rx443_pos, "term:sym<statement_prefix>")
    rx443_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx443_pos)
    .return (rx443_cur)
  rx443_fail:
.annotate "line", 4
    (rx443_rep, rx443_pos, $I10, $P10) = rx443_cur."!mark_fail"(0)
    lt rx443_pos, -1, rx443_done
    eq rx443_pos, -1, rx443_fail
    jump $I10
  rx443_done:
    rx443_cur."!cursor_fail"()
    rx443_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx443_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("108_1259420191.48826") :method
.annotate "line", 4
    $P445 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P446, "ResizablePMCArray"
    push $P446, $P445
    .return ($P446)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("109_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx449_tgt
    .local int rx449_pos
    .local int rx449_off
    .local int rx449_eos
    .local int rx449_rep
    .local pmc rx449_cur
    (rx449_cur, rx449_pos, rx449_tgt) = self."!cursor_start"()
    rx449_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx449_cur
    .local pmc match
    .lex "$/", match
    length rx449_eos, rx449_tgt
    set rx449_off, 0
    lt rx449_pos, 2, rx449_start
    sub rx449_off, rx449_pos, 1
    substr rx449_tgt, rx449_tgt, rx449_off
  rx449_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan452_done
    goto rxscan452_scan
  rxscan452_loop:
    ($P10) = rx449_cur."from"()
    inc $P10
    set rx449_pos, $P10
    ge rx449_pos, rx449_eos, rxscan452_done
  rxscan452_scan:
    set_addr $I10, rxscan452_loop
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  rxscan452_done:
.annotate "line", 223
  # rx subrule "lambda" subtype=zerowidth negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."lambda"()
    unless $P10, rx449_fail
  # rx subrule "pblock" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."pblock"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx449_pos = $P10."pos"()
  # rx pass
    rx449_cur."!cursor_pass"(rx449_pos, "term:sym<lambda>")
    rx449_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx449_pos)
    .return (rx449_cur)
  rx449_fail:
.annotate "line", 4
    (rx449_rep, rx449_pos, $I10, $P10) = rx449_cur."!mark_fail"(0)
    lt rx449_pos, -1, rx449_done
    eq rx449_pos, -1, rx449_fail
    jump $I10
  rx449_done:
    rx449_cur."!cursor_fail"()
    rx449_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx449_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("110_1259420191.48826") :method
.annotate "line", 4
    new $P451, "ResizablePMCArray"
    push $P451, ""
    .return ($P451)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("111_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt) = self."!cursor_start"()
    rx454_cur."!cursor_debug"("START ", "colonpair")
    rx454_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx454_cur
    .local pmc match
    .lex "$/", match
    length rx454_eos, rx454_tgt
    set rx454_off, 0
    lt rx454_pos, 2, rx454_start
    sub rx454_off, rx454_pos, 1
    substr rx454_tgt, rx454_tgt, rx454_off
  rx454_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan459_done
    goto rxscan459_scan
  rxscan459_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan459_done
  rxscan459_scan:
    set_addr $I10, rxscan459_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan459_done:
.annotate "line", 226
  # rx literal  ":"
    add $I11, rx454_pos, 1
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 1
    ne $S10, ":", rx454_fail
    add rx454_pos, 1
  alt460_0:
.annotate "line", 227
    set_addr $I10, alt460_1
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
.annotate "line", 228
  # rx subcapture "not"
    set_addr $I10, rxcap_461_fail
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  # rx literal  "!"
    add $I11, rx454_pos, 1
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 1
    ne $S10, "!", rx454_fail
    add rx454_pos, 1
    set_addr $I10, rxcap_461_fail
    ($I12, $I11) = rx454_cur."!mark_peek"($I10)
    rx454_cur."!cursor_pos"($I11)
    ($P10) = rx454_cur."!cursor_start"()
    $P10."!cursor_pass"(rx454_pos, "")
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_461_done
  rxcap_461_fail:
    goto rx454_fail
  rxcap_461_done:
  # rx subrule "identifier" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."identifier"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx454_pos = $P10."pos"()
    goto alt460_end
  alt460_1:
.annotate "line", 229
  # rx subrule "identifier" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."identifier"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx454_pos = $P10."pos"()
  # rx rxquantr462 ** 0..1
    set_addr $I463, rxquantr462_done
    rx454_cur."!mark_push"(0, rx454_pos, $I463)
  rxquantr462_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."circumfix"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx454_pos = $P10."pos"()
    (rx454_rep) = rx454_cur."!mark_commit"($I463)
  rxquantr462_done:
  alt460_end:
.annotate "line", 225
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "colonpair")
    rx454_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_fail:
.annotate "line", 4
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx454_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("112_1259420191.48826") :method
.annotate "line", 4
    $P456 = self."!PREFIX__!subrule"("identifier", ":")
    $P457 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P458, "ResizablePMCArray"
    push $P458, $P456
    push $P458, $P457
    .return ($P458)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("113_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    (rx465_cur, rx465_pos, rx465_tgt) = self."!cursor_start"()
    rx465_cur."!cursor_debug"("START ", "variable")
    rx465_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx465_cur
    .local pmc match
    .lex "$/", match
    length rx465_eos, rx465_tgt
    set rx465_off, 0
    lt rx465_pos, 2, rx465_start
    sub rx465_off, rx465_pos, 1
    substr rx465_tgt, rx465_tgt, rx465_off
  rx465_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan470_done
    goto rxscan470_scan
  rxscan470_loop:
    ($P10) = rx465_cur."from"()
    inc $P10
    set rx465_pos, $P10
    ge rx465_pos, rx465_eos, rxscan470_done
  rxscan470_scan:
    set_addr $I10, rxscan470_loop
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  rxscan470_done:
  alt471_0:
.annotate "line", 233
    set_addr $I10, alt471_1
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
.annotate "line", 234
  # rx subrule "sigil" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."sigil"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx465_pos = $P10."pos"()
  # rx rxquantr472 ** 0..1
    set_addr $I473, rxquantr472_done
    rx465_cur."!mark_push"(0, rx465_pos, $I473)
  rxquantr472_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."twigil"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx465_pos = $P10."pos"()
    (rx465_rep) = rx465_cur."!mark_commit"($I473)
  rxquantr472_done:
  # rx subrule "name" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."name"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx465_pos = $P10."pos"()
    goto alt471_end
  alt471_1:
    set_addr $I10, alt471_2
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
.annotate "line", 235
  # rx subrule "sigil" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."sigil"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx465_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx465_pos, rx465_eos, rx465_fail
    sub $I10, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx465_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."postcircumfix"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx465_pos = $P10."pos"()
    goto alt471_end
  alt471_2:
.annotate "line", 236
  # rx subcapture "sigil"
    set_addr $I10, rxcap_474_fail
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  # rx literal  "$"
    add $I11, rx465_pos, 1
    gt $I11, rx465_eos, rx465_fail
    sub $I11, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I11, 1
    ne $S10, "$", rx465_fail
    add rx465_pos, 1
    set_addr $I10, rxcap_474_fail
    ($I12, $I11) = rx465_cur."!mark_peek"($I10)
    rx465_cur."!cursor_pos"($I11)
    ($P10) = rx465_cur."!cursor_start"()
    $P10."!cursor_pass"(rx465_pos, "")
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_474_done
  rxcap_474_fail:
    goto rx465_fail
  rxcap_474_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_475_fail
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx465_pos, rx465_eos, rx465_fail
    sub $I10, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx465_fail
    inc rx465_pos
    set_addr $I10, rxcap_475_fail
    ($I12, $I11) = rx465_cur."!mark_peek"($I10)
    rx465_cur."!cursor_pos"($I11)
    ($P10) = rx465_cur."!cursor_start"()
    $P10."!cursor_pass"(rx465_pos, "")
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_475_done
  rxcap_475_fail:
    goto rx465_fail
  rxcap_475_done:
  alt471_end:
.annotate "line", 233
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "variable")
    rx465_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx465_pos)
    .return (rx465_cur)
  rx465_fail:
.annotate "line", 4
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    rx465_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx465_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("114_1259420191.48826") :method
.annotate "line", 4
    $P467 = self."!PREFIX__!subrule"("sigil", "")
    $P468 = self."!PREFIX__!subrule"("sigil", "")
    new $P469, "ResizablePMCArray"
    push $P469, "$!"
    push $P469, "$_"
    push $P469, "$/"
    push $P469, $P467
    push $P469, $P468
    .return ($P469)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("115_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx477_tgt
    .local int rx477_pos
    .local int rx477_off
    .local int rx477_eos
    .local int rx477_rep
    .local pmc rx477_cur
    (rx477_cur, rx477_pos, rx477_tgt) = self."!cursor_start"()
    rx477_cur."!cursor_debug"("START ", "sigil")
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
    ne $I10, -1, rxscan480_done
    goto rxscan480_scan
  rxscan480_loop:
    ($P10) = rx477_cur."from"()
    inc $P10
    set rx477_pos, $P10
    ge rx477_pos, rx477_eos, rxscan480_done
  rxscan480_scan:
    set_addr $I10, rxscan480_loop
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  rxscan480_done:
.annotate "line", 239
  # rx enumcharlist negate=0 
    ge rx477_pos, rx477_eos, rx477_fail
    sub $I10, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx477_fail
    inc rx477_pos
  # rx pass
    rx477_cur."!cursor_pass"(rx477_pos, "sigil")
    rx477_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx477_pos)
    .return (rx477_cur)
  rx477_fail:
.annotate "line", 4
    (rx477_rep, rx477_pos, $I10, $P10) = rx477_cur."!mark_fail"(0)
    lt rx477_pos, -1, rx477_done
    eq rx477_pos, -1, rx477_fail
    jump $I10
  rx477_done:
    rx477_cur."!cursor_fail"()
    rx477_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx477_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("116_1259420191.48826") :method
.annotate "line", 4
    new $P479, "ResizablePMCArray"
    push $P479, "&"
    push $P479, "%"
    push $P479, "@"
    push $P479, "$"
    .return ($P479)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("117_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt) = self."!cursor_start"()
    rx482_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx482_cur
    .local pmc match
    .lex "$/", match
    length rx482_eos, rx482_tgt
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
.annotate "line", 241
  # rx enumcharlist negate=0 
    ge rx482_pos, rx482_eos, rx482_fail
    sub $I10, rx482_pos, rx482_off
    substr $S10, rx482_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx482_fail
    inc rx482_pos
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "twigil")
    rx482_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_fail:
.annotate "line", 4
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("118_1259420191.48826") :method
.annotate "line", 4
    new $P484, "ResizablePMCArray"
    push $P484, "?"
    push $P484, "!"
    push $P484, "*"
    .return ($P484)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("119_1259420191.48826") :method
.annotate "line", 243
    $P487 = self."!protoregex"("package_declarator")
    .return ($P487)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("120_1259420191.48826") :method
.annotate "line", 243
    $P489 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P489)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("121_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx491_tgt
    .local int rx491_pos
    .local int rx491_off
    .local int rx491_eos
    .local int rx491_rep
    .local pmc rx491_cur
    (rx491_cur, rx491_pos, rx491_tgt) = self."!cursor_start"()
    rx491_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx491_cur
    .local pmc match
    .lex "$/", match
    length rx491_eos, rx491_tgt
    set rx491_off, 0
    lt rx491_pos, 2, rx491_start
    sub rx491_off, rx491_pos, 1
    substr rx491_tgt, rx491_tgt, rx491_off
  rx491_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan495_done
    goto rxscan495_scan
  rxscan495_loop:
    ($P10) = rx491_cur."from"()
    inc $P10
    set rx491_pos, $P10
    ge rx491_pos, rx491_eos, rxscan495_done
  rxscan495_scan:
    set_addr $I10, rxscan495_loop
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  rxscan495_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_496_fail
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  # rx literal  "module"
    add $I11, rx491_pos, 6
    gt $I11, rx491_eos, rx491_fail
    sub $I11, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I11, 6
    ne $S10, "module", rx491_fail
    add rx491_pos, 6
    set_addr $I10, rxcap_496_fail
    ($I12, $I11) = rx491_cur."!mark_peek"($I10)
    rx491_cur."!cursor_pos"($I11)
    ($P10) = rx491_cur."!cursor_start"()
    $P10."!cursor_pass"(rx491_pos, "")
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_496_done
  rxcap_496_fail:
    goto rx491_fail
  rxcap_496_done:
  # rx subrule "package_def" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."package_def"()
    unless $P10, rx491_fail
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx491_pos = $P10."pos"()
  # rx pass
    rx491_cur."!cursor_pass"(rx491_pos, "package_declarator:sym<module>")
    rx491_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx491_pos)
    .return (rx491_cur)
  rx491_fail:
.annotate "line", 4
    (rx491_rep, rx491_pos, $I10, $P10) = rx491_cur."!mark_fail"(0)
    lt rx491_pos, -1, rx491_done
    eq rx491_pos, -1, rx491_fail
    jump $I10
  rx491_done:
    rx491_cur."!cursor_fail"()
    rx491_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx491_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("122_1259420191.48826") :method
.annotate "line", 4
    $P493 = self."!PREFIX__!subrule"("package_def", "module")
    new $P494, "ResizablePMCArray"
    push $P494, $P493
    .return ($P494)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("123_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx498_tgt
    .local int rx498_pos
    .local int rx498_off
    .local int rx498_eos
    .local int rx498_rep
    .local pmc rx498_cur
    (rx498_cur, rx498_pos, rx498_tgt) = self."!cursor_start"()
    rx498_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx498_cur
    .local pmc match
    .lex "$/", match
    length rx498_eos, rx498_tgt
    set rx498_off, 0
    lt rx498_pos, 2, rx498_start
    sub rx498_off, rx498_pos, 1
    substr rx498_tgt, rx498_tgt, rx498_off
  rx498_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx498_cur."from"()
    inc $P10
    set rx498_pos, $P10
    ge rx498_pos, rx498_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  rxscan503_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_505_fail
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  alt504_0:
    set_addr $I10, alt504_1
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  # rx literal  "class"
    add $I11, rx498_pos, 5
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 5
    ne $S10, "class", rx498_fail
    add rx498_pos, 5
    goto alt504_end
  alt504_1:
  # rx literal  "grammar"
    add $I11, rx498_pos, 7
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 7
    ne $S10, "grammar", rx498_fail
    add rx498_pos, 7
  alt504_end:
    set_addr $I10, rxcap_505_fail
    ($I12, $I11) = rx498_cur."!mark_peek"($I10)
    rx498_cur."!cursor_pos"($I11)
    ($P10) = rx498_cur."!cursor_start"()
    $P10."!cursor_pass"(rx498_pos, "")
    rx498_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_505_done
  rxcap_505_fail:
    goto rx498_fail
  rxcap_505_done:
  # rx subrule "package_def" subtype=capture negate=
    rx498_cur."!cursor_pos"(rx498_pos)
    $P10 = rx498_cur."package_def"()
    unless $P10, rx498_fail
    rx498_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx498_pos = $P10."pos"()
  # rx pass
    rx498_cur."!cursor_pass"(rx498_pos, "package_declarator:sym<class>")
    rx498_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx498_pos)
    .return (rx498_cur)
  rx498_fail:
.annotate "line", 4
    (rx498_rep, rx498_pos, $I10, $P10) = rx498_cur."!mark_fail"(0)
    lt rx498_pos, -1, rx498_done
    eq rx498_pos, -1, rx498_fail
    jump $I10
  rx498_done:
    rx498_cur."!cursor_fail"()
    rx498_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx498_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("124_1259420191.48826") :method
.annotate "line", 4
    $P500 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P501 = self."!PREFIX__!subrule"("package_def", "class")
    new $P502, "ResizablePMCArray"
    push $P502, $P500
    push $P502, $P501
    .return ($P502)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("125_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx507_tgt
    .local int rx507_pos
    .local int rx507_off
    .local int rx507_eos
    .local int rx507_rep
    .local pmc rx507_cur
    (rx507_cur, rx507_pos, rx507_tgt) = self."!cursor_start"()
    rx507_cur."!cursor_debug"("START ", "package_def")
    rx507_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx507_cur
    .local pmc match
    .lex "$/", match
    length rx507_eos, rx507_tgt
    set rx507_off, 0
    lt rx507_pos, 2, rx507_start
    sub rx507_off, rx507_pos, 1
    substr rx507_tgt, rx507_tgt, rx507_off
  rx507_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan510_done
    goto rxscan510_scan
  rxscan510_loop:
    ($P10) = rx507_cur."from"()
    inc $P10
    set rx507_pos, $P10
    ge rx507_pos, rx507_eos, rxscan510_done
  rxscan510_scan:
    set_addr $I10, rxscan510_loop
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  rxscan510_done:
.annotate "line", 247
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
.annotate "line", 248
  # rx subrule "name" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."name"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx507_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
.annotate "line", 249
  # rx rxquantr513 ** 0..1
    set_addr $I517, rxquantr513_done
    rx507_cur."!mark_push"(0, rx507_pos, $I517)
  rxquantr513_loop:
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx507_pos, 2
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 2
    ne $S10, "is", rx507_fail
    add rx507_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."name"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx507_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
    (rx507_rep) = rx507_cur."!mark_commit"($I517)
  rxquantr513_done:
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  alt519_0:
.annotate "line", 250
    set_addr $I10, alt519_1
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
.annotate "line", 251
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, ";", rx507_fail
    add rx507_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."comp_unit"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx507_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
    goto alt519_end
  alt519_1:
    set_addr $I10, alt519_2
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx507_pos, rx507_eos, rx507_fail
    sub $I10, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx507_fail
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."block"()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx507_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
    goto alt519_end
  alt519_2:
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."panic"("Malformed package declaration")
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
  alt519_end:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."ws"()
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
.annotate "line", 247
  # rx pass
    rx507_cur."!cursor_pass"(rx507_pos, "package_def")
    rx507_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx507_pos)
    .return (rx507_cur)
  rx507_fail:
.annotate "line", 4
    (rx507_rep, rx507_pos, $I10, $P10) = rx507_cur."!mark_fail"(0)
    lt rx507_pos, -1, rx507_done
    eq rx507_pos, -1, rx507_fail
    jump $I10
  rx507_done:
    rx507_cur."!cursor_fail"()
    rx507_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx507_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("126_1259420191.48826") :method
.annotate "line", 4
    new $P509, "ResizablePMCArray"
    push $P509, ""
    .return ($P509)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("127_1259420191.48826") :method
.annotate "line", 257
    $P530 = self."!protoregex"("scope_declarator")
    .return ($P530)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("128_1259420191.48826") :method
.annotate "line", 257
    $P532 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P532)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("129_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx534_tgt
    .local int rx534_pos
    .local int rx534_off
    .local int rx534_eos
    .local int rx534_rep
    .local pmc rx534_cur
    (rx534_cur, rx534_pos, rx534_tgt) = self."!cursor_start"()
    rx534_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx534_cur
    .local pmc match
    .lex "$/", match
    length rx534_eos, rx534_tgt
    set rx534_off, 0
    lt rx534_pos, 2, rx534_start
    sub rx534_off, rx534_pos, 1
    substr rx534_tgt, rx534_tgt, rx534_off
  rx534_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan538_done
    goto rxscan538_scan
  rxscan538_loop:
    ($P10) = rx534_cur."from"()
    inc $P10
    set rx534_pos, $P10
    ge rx534_pos, rx534_eos, rxscan538_done
  rxscan538_scan:
    set_addr $I10, rxscan538_loop
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  rxscan538_done:
.annotate "line", 258
  # rx subcapture "sym"
    set_addr $I10, rxcap_539_fail
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  # rx literal  "my"
    add $I11, rx534_pos, 2
    gt $I11, rx534_eos, rx534_fail
    sub $I11, rx534_pos, rx534_off
    substr $S10, rx534_tgt, $I11, 2
    ne $S10, "my", rx534_fail
    add rx534_pos, 2
    set_addr $I10, rxcap_539_fail
    ($I12, $I11) = rx534_cur."!mark_peek"($I10)
    rx534_cur."!cursor_pos"($I11)
    ($P10) = rx534_cur."!cursor_start"()
    $P10."!cursor_pass"(rx534_pos, "")
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_539_done
  rxcap_539_fail:
    goto rx534_fail
  rxcap_539_done:
  # rx subrule "scoped" subtype=capture negate=
    rx534_cur."!cursor_pos"(rx534_pos)
    $P10 = rx534_cur."scoped"("my")
    unless $P10, rx534_fail
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx534_pos = $P10."pos"()
  # rx pass
    rx534_cur."!cursor_pass"(rx534_pos, "scope_declarator:sym<my>")
    rx534_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx534_pos)
    .return (rx534_cur)
  rx534_fail:
.annotate "line", 4
    (rx534_rep, rx534_pos, $I10, $P10) = rx534_cur."!mark_fail"(0)
    lt rx534_pos, -1, rx534_done
    eq rx534_pos, -1, rx534_fail
    jump $I10
  rx534_done:
    rx534_cur."!cursor_fail"()
    rx534_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx534_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("130_1259420191.48826") :method
.annotate "line", 4
    $P536 = self."!PREFIX__!subrule"("scoped", "my")
    new $P537, "ResizablePMCArray"
    push $P537, $P536
    .return ($P537)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("131_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx541_tgt
    .local int rx541_pos
    .local int rx541_off
    .local int rx541_eos
    .local int rx541_rep
    .local pmc rx541_cur
    (rx541_cur, rx541_pos, rx541_tgt) = self."!cursor_start"()
    rx541_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx541_cur
    .local pmc match
    .lex "$/", match
    length rx541_eos, rx541_tgt
    set rx541_off, 0
    lt rx541_pos, 2, rx541_start
    sub rx541_off, rx541_pos, 1
    substr rx541_tgt, rx541_tgt, rx541_off
  rx541_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan545_done
    goto rxscan545_scan
  rxscan545_loop:
    ($P10) = rx541_cur."from"()
    inc $P10
    set rx541_pos, $P10
    ge rx541_pos, rx541_eos, rxscan545_done
  rxscan545_scan:
    set_addr $I10, rxscan545_loop
    rx541_cur."!mark_push"(0, rx541_pos, $I10)
  rxscan545_done:
.annotate "line", 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_546_fail
    rx541_cur."!mark_push"(0, rx541_pos, $I10)
  # rx literal  "our"
    add $I11, rx541_pos, 3
    gt $I11, rx541_eos, rx541_fail
    sub $I11, rx541_pos, rx541_off
    substr $S10, rx541_tgt, $I11, 3
    ne $S10, "our", rx541_fail
    add rx541_pos, 3
    set_addr $I10, rxcap_546_fail
    ($I12, $I11) = rx541_cur."!mark_peek"($I10)
    rx541_cur."!cursor_pos"($I11)
    ($P10) = rx541_cur."!cursor_start"()
    $P10."!cursor_pass"(rx541_pos, "")
    rx541_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_546_done
  rxcap_546_fail:
    goto rx541_fail
  rxcap_546_done:
  # rx subrule "scoped" subtype=capture negate=
    rx541_cur."!cursor_pos"(rx541_pos)
    $P10 = rx541_cur."scoped"("our")
    unless $P10, rx541_fail
    rx541_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx541_pos = $P10."pos"()
  # rx pass
    rx541_cur."!cursor_pass"(rx541_pos, "scope_declarator:sym<our>")
    rx541_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx541_pos)
    .return (rx541_cur)
  rx541_fail:
.annotate "line", 4
    (rx541_rep, rx541_pos, $I10, $P10) = rx541_cur."!mark_fail"(0)
    lt rx541_pos, -1, rx541_done
    eq rx541_pos, -1, rx541_fail
    jump $I10
  rx541_done:
    rx541_cur."!cursor_fail"()
    rx541_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx541_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("132_1259420191.48826") :method
.annotate "line", 4
    $P543 = self."!PREFIX__!subrule"("scoped", "our")
    new $P544, "ResizablePMCArray"
    push $P544, $P543
    .return ($P544)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("133_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx548_tgt
    .local int rx548_pos
    .local int rx548_off
    .local int rx548_eos
    .local int rx548_rep
    .local pmc rx548_cur
    (rx548_cur, rx548_pos, rx548_tgt) = self."!cursor_start"()
    rx548_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx548_cur
    .local pmc match
    .lex "$/", match
    length rx548_eos, rx548_tgt
    set rx548_off, 0
    lt rx548_pos, 2, rx548_start
    sub rx548_off, rx548_pos, 1
    substr rx548_tgt, rx548_tgt, rx548_off
  rx548_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan552_done
    goto rxscan552_scan
  rxscan552_loop:
    ($P10) = rx548_cur."from"()
    inc $P10
    set rx548_pos, $P10
    ge rx548_pos, rx548_eos, rxscan552_done
  rxscan552_scan:
    set_addr $I10, rxscan552_loop
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  rxscan552_done:
.annotate "line", 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_553_fail
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  # rx literal  "has"
    add $I11, rx548_pos, 3
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 3
    ne $S10, "has", rx548_fail
    add rx548_pos, 3
    set_addr $I10, rxcap_553_fail
    ($I12, $I11) = rx548_cur."!mark_peek"($I10)
    rx548_cur."!cursor_pos"($I11)
    ($P10) = rx548_cur."!cursor_start"()
    $P10."!cursor_pass"(rx548_pos, "")
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_553_done
  rxcap_553_fail:
    goto rx548_fail
  rxcap_553_done:
  # rx subrule "scoped" subtype=capture negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."scoped"("has")
    unless $P10, rx548_fail
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx548_pos = $P10."pos"()
  # rx pass
    rx548_cur."!cursor_pass"(rx548_pos, "scope_declarator:sym<has>")
    rx548_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx548_pos)
    .return (rx548_cur)
  rx548_fail:
.annotate "line", 4
    (rx548_rep, rx548_pos, $I10, $P10) = rx548_cur."!mark_fail"(0)
    lt rx548_pos, -1, rx548_done
    eq rx548_pos, -1, rx548_fail
    jump $I10
  rx548_done:
    rx548_cur."!cursor_fail"()
    rx548_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx548_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("134_1259420191.48826") :method
.annotate "line", 4
    $P550 = self."!PREFIX__!subrule"("scoped", "has")
    new $P551, "ResizablePMCArray"
    push $P551, $P550
    .return ($P551)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("135_1259420191.48826") :method :outer("11_1259420191.48826")
    .param pmc param_555
.annotate "line", 262
    .lex "$*SCOPE", param_555
.annotate "line", 4
    .local string rx556_tgt
    .local int rx556_pos
    .local int rx556_off
    .local int rx556_eos
    .local int rx556_rep
    .local pmc rx556_cur
    (rx556_cur, rx556_pos, rx556_tgt) = self."!cursor_start"()
    rx556_cur."!cursor_debug"("START ", "scoped")
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
    ne $I10, -1, rxscan559_done
    goto rxscan559_scan
  rxscan559_loop:
    ($P10) = rx556_cur."from"()
    inc $P10
    set rx556_pos, $P10
    ge rx556_pos, rx556_eos, rxscan559_done
  rxscan559_scan:
    set_addr $I10, rxscan559_loop
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  rxscan559_done:
  alt560_0:
.annotate "line", 262
    set_addr $I10, alt560_1
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."ws"()
    unless $P10, rx556_fail
    rx556_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."variable_declarator"()
    unless $P10, rx556_fail
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx556_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."ws"()
    unless $P10, rx556_fail
    rx556_pos = $P10."pos"()
    goto alt560_end
  alt560_1:
.annotate "line", 264
  # rx subrule "ws" subtype=method negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."ws"()
    unless $P10, rx556_fail
    rx556_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."routine_declarator"()
    unless $P10, rx556_fail
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx556_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx556_cur."!cursor_pos"(rx556_pos)
    $P10 = rx556_cur."ws"()
    unless $P10, rx556_fail
    rx556_pos = $P10."pos"()
  alt560_end:
.annotate "line", 262
  # rx pass
    rx556_cur."!cursor_pass"(rx556_pos, "scoped")
    rx556_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx556_pos)
    .return (rx556_cur)
  rx556_fail:
.annotate "line", 4
    (rx556_rep, rx556_pos, $I10, $P10) = rx556_cur."!mark_fail"(0)
    lt rx556_pos, -1, rx556_done
    eq rx556_pos, -1, rx556_fail
    jump $I10
  rx556_done:
    rx556_cur."!cursor_fail"()
    rx556_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx556_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("136_1259420191.48826") :method
.annotate "line", 4
    new $P558, "ResizablePMCArray"
    push $P558, ""
    push $P558, ""
    .return ($P558)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("137_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx566_tgt
    .local int rx566_pos
    .local int rx566_off
    .local int rx566_eos
    .local int rx566_rep
    .local pmc rx566_cur
    (rx566_cur, rx566_pos, rx566_tgt) = self."!cursor_start"()
    rx566_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx566_cur
    .local pmc match
    .lex "$/", match
    length rx566_eos, rx566_tgt
    set rx566_off, 0
    lt rx566_pos, 2, rx566_start
    sub rx566_off, rx566_pos, 1
    substr rx566_tgt, rx566_tgt, rx566_off
  rx566_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan570_done
    goto rxscan570_scan
  rxscan570_loop:
    ($P10) = rx566_cur."from"()
    inc $P10
    set rx566_pos, $P10
    ge rx566_pos, rx566_eos, rxscan570_done
  rxscan570_scan:
    set_addr $I10, rxscan570_loop
    rx566_cur."!mark_push"(0, rx566_pos, $I10)
  rxscan570_done:
.annotate "line", 267
  # rx subrule "variable" subtype=capture negate=
    rx566_cur."!cursor_pos"(rx566_pos)
    $P10 = rx566_cur."variable"()
    unless $P10, rx566_fail
    rx566_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx566_pos = $P10."pos"()
  # rx pass
    rx566_cur."!cursor_pass"(rx566_pos, "variable_declarator")
    rx566_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx566_pos)
    .return (rx566_cur)
  rx566_fail:
.annotate "line", 4
    (rx566_rep, rx566_pos, $I10, $P10) = rx566_cur."!mark_fail"(0)
    lt rx566_pos, -1, rx566_done
    eq rx566_pos, -1, rx566_fail
    jump $I10
  rx566_done:
    rx566_cur."!cursor_fail"()
    rx566_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx566_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("138_1259420191.48826") :method
.annotate "line", 4
    $P568 = self."!PREFIX__!subrule"("variable", "")
    new $P569, "ResizablePMCArray"
    push $P569, $P568
    .return ($P569)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("139_1259420191.48826") :method
.annotate "line", 269
    $P572 = self."!protoregex"("routine_declarator")
    .return ($P572)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("140_1259420191.48826") :method
.annotate "line", 269
    $P574 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P574)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("141_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx576_tgt
    .local int rx576_pos
    .local int rx576_off
    .local int rx576_eos
    .local int rx576_rep
    .local pmc rx576_cur
    (rx576_cur, rx576_pos, rx576_tgt) = self."!cursor_start"()
    rx576_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx576_cur
    .local pmc match
    .lex "$/", match
    length rx576_eos, rx576_tgt
    set rx576_off, 0
    lt rx576_pos, 2, rx576_start
    sub rx576_off, rx576_pos, 1
    substr rx576_tgt, rx576_tgt, rx576_off
  rx576_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan580_done
    goto rxscan580_scan
  rxscan580_loop:
    ($P10) = rx576_cur."from"()
    inc $P10
    set rx576_pos, $P10
    ge rx576_pos, rx576_eos, rxscan580_done
  rxscan580_scan:
    set_addr $I10, rxscan580_loop
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  rxscan580_done:
.annotate "line", 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_581_fail
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  # rx literal  "sub"
    add $I11, rx576_pos, 3
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    substr $S10, rx576_tgt, $I11, 3
    ne $S10, "sub", rx576_fail
    add rx576_pos, 3
    set_addr $I10, rxcap_581_fail
    ($I12, $I11) = rx576_cur."!mark_peek"($I10)
    rx576_cur."!cursor_pos"($I11)
    ($P10) = rx576_cur."!cursor_start"()
    $P10."!cursor_pass"(rx576_pos, "")
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_581_done
  rxcap_581_fail:
    goto rx576_fail
  rxcap_581_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx576_cur."!cursor_pos"(rx576_pos)
    $P10 = rx576_cur."routine_def"()
    unless $P10, rx576_fail
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx576_pos = $P10."pos"()
  # rx pass
    rx576_cur."!cursor_pass"(rx576_pos, "routine_declarator:sym<sub>")
    rx576_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx576_pos)
    .return (rx576_cur)
  rx576_fail:
.annotate "line", 4
    (rx576_rep, rx576_pos, $I10, $P10) = rx576_cur."!mark_fail"(0)
    lt rx576_pos, -1, rx576_done
    eq rx576_pos, -1, rx576_fail
    jump $I10
  rx576_done:
    rx576_cur."!cursor_fail"()
    rx576_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx576_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("142_1259420191.48826") :method
.annotate "line", 4
    $P578 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P579, "ResizablePMCArray"
    push $P579, $P578
    .return ($P579)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("143_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx583_tgt
    .local int rx583_pos
    .local int rx583_off
    .local int rx583_eos
    .local int rx583_rep
    .local pmc rx583_cur
    (rx583_cur, rx583_pos, rx583_tgt) = self."!cursor_start"()
    rx583_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx583_cur
    .local pmc match
    .lex "$/", match
    length rx583_eos, rx583_tgt
    set rx583_off, 0
    lt rx583_pos, 2, rx583_start
    sub rx583_off, rx583_pos, 1
    substr rx583_tgt, rx583_tgt, rx583_off
  rx583_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan587_done
    goto rxscan587_scan
  rxscan587_loop:
    ($P10) = rx583_cur."from"()
    inc $P10
    set rx583_pos, $P10
    ge rx583_pos, rx583_eos, rxscan587_done
  rxscan587_scan:
    set_addr $I10, rxscan587_loop
    rx583_cur."!mark_push"(0, rx583_pos, $I10)
  rxscan587_done:
.annotate "line", 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_588_fail
    rx583_cur."!mark_push"(0, rx583_pos, $I10)
  # rx literal  "method"
    add $I11, rx583_pos, 6
    gt $I11, rx583_eos, rx583_fail
    sub $I11, rx583_pos, rx583_off
    substr $S10, rx583_tgt, $I11, 6
    ne $S10, "method", rx583_fail
    add rx583_pos, 6
    set_addr $I10, rxcap_588_fail
    ($I12, $I11) = rx583_cur."!mark_peek"($I10)
    rx583_cur."!cursor_pos"($I11)
    ($P10) = rx583_cur."!cursor_start"()
    $P10."!cursor_pass"(rx583_pos, "")
    rx583_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_588_done
  rxcap_588_fail:
    goto rx583_fail
  rxcap_588_done:
  # rx subrule "method_def" subtype=capture negate=
    rx583_cur."!cursor_pos"(rx583_pos)
    $P10 = rx583_cur."method_def"()
    unless $P10, rx583_fail
    rx583_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx583_pos = $P10."pos"()
  # rx pass
    rx583_cur."!cursor_pass"(rx583_pos, "routine_declarator:sym<method>")
    rx583_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx583_pos)
    .return (rx583_cur)
  rx583_fail:
.annotate "line", 4
    (rx583_rep, rx583_pos, $I10, $P10) = rx583_cur."!mark_fail"(0)
    lt rx583_pos, -1, rx583_done
    eq rx583_pos, -1, rx583_fail
    jump $I10
  rx583_done:
    rx583_cur."!cursor_fail"()
    rx583_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx583_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("144_1259420191.48826") :method
.annotate "line", 4
    $P585 = self."!PREFIX__!subrule"("method_def", "method")
    new $P586, "ResizablePMCArray"
    push $P586, $P585
    .return ($P586)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("145_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx590_tgt
    .local int rx590_pos
    .local int rx590_off
    .local int rx590_eos
    .local int rx590_rep
    .local pmc rx590_cur
    (rx590_cur, rx590_pos, rx590_tgt) = self."!cursor_start"()
    rx590_cur."!cursor_debug"("START ", "routine_def")
    rx590_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx590_cur
    .local pmc match
    .lex "$/", match
    length rx590_eos, rx590_tgt
    set rx590_off, 0
    lt rx590_pos, 2, rx590_start
    sub rx590_off, rx590_pos, 1
    substr rx590_tgt, rx590_tgt, rx590_off
  rx590_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan593_done
    goto rxscan593_scan
  rxscan593_loop:
    ($P10) = rx590_cur."from"()
    inc $P10
    set rx590_pos, $P10
    ge rx590_pos, rx590_eos, rxscan593_done
  rxscan593_scan:
    set_addr $I10, rxscan593_loop
    rx590_cur."!mark_push"(0, rx590_pos, $I10)
  rxscan593_done:
.annotate "line", 273
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 274
  # rx rxquantr595 ** 0..1
    set_addr $I596, rxquantr595_done
    rx590_cur."!mark_push"(0, rx590_pos, $I596)
  rxquantr595_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."deflongname"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx590_pos = $P10."pos"()
    (rx590_rep) = rx590_cur."!mark_commit"($I596)
  rxquantr595_done:
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 275
  # rx subrule "newpad" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."newpad"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  alt599_0:
.annotate "line", 276
    set_addr $I10, alt599_1
    rx590_cur."!mark_push"(0, rx590_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx590_pos, 1
    gt $I11, rx590_eos, rx590_fail
    sub $I11, rx590_pos, rx590_off
    substr $S10, rx590_tgt, $I11, 1
    ne $S10, "(", rx590_fail
    add rx590_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."signature"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx590_pos, 1
    gt $I11, rx590_eos, rx590_fail
    sub $I11, rx590_pos, rx590_off
    substr $S10, rx590_tgt, $I11, 1
    ne $S10, ")", rx590_fail
    add rx590_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
    goto alt599_end
  alt599_1:
.annotate "line", 277
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  alt599_end:
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 278
  # rx subrule "blockoid" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."blockoid"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 273
  # rx pass
    rx590_cur."!cursor_pass"(rx590_pos, "routine_def")
    rx590_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx590_pos)
    .return (rx590_cur)
  rx590_fail:
.annotate "line", 4
    (rx590_rep, rx590_pos, $I10, $P10) = rx590_cur."!mark_fail"(0)
    lt rx590_pos, -1, rx590_done
    eq rx590_pos, -1, rx590_fail
    jump $I10
  rx590_done:
    rx590_cur."!cursor_fail"()
    rx590_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx590_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("146_1259420191.48826") :method
.annotate "line", 4
    new $P592, "ResizablePMCArray"
    push $P592, ""
    .return ($P592)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("147_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx609_tgt
    .local int rx609_pos
    .local int rx609_off
    .local int rx609_eos
    .local int rx609_rep
    .local pmc rx609_cur
    (rx609_cur, rx609_pos, rx609_tgt) = self."!cursor_start"()
    rx609_cur."!cursor_debug"("START ", "method_def")
    rx609_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx609_cur
    .local pmc match
    .lex "$/", match
    length rx609_eos, rx609_tgt
    set rx609_off, 0
    lt rx609_pos, 2, rx609_start
    sub rx609_off, rx609_pos, 1
    substr rx609_tgt, rx609_tgt, rx609_off
  rx609_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan612_done
    goto rxscan612_scan
  rxscan612_loop:
    ($P10) = rx609_cur."from"()
    inc $P10
    set rx609_pos, $P10
    ge rx609_pos, rx609_eos, rxscan612_done
  rxscan612_scan:
    set_addr $I10, rxscan612_loop
    rx609_cur."!mark_push"(0, rx609_pos, $I10)
  rxscan612_done:
.annotate "line", 281
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate "line", 282
  # rx rxquantr614 ** 0..1
    set_addr $I615, rxquantr614_done
    rx609_cur."!mark_push"(0, rx609_pos, $I615)
  rxquantr614_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."deflongname"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx609_pos = $P10."pos"()
    (rx609_rep) = rx609_cur."!mark_commit"($I615)
  rxquantr614_done:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "newpad" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."newpad"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  alt618_0:
.annotate "line", 284
    set_addr $I10, alt618_1
    rx609_cur."!mark_push"(0, rx609_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, "(", rx609_fail
    add rx609_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."signature"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, ")", rx609_fail
    add rx609_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
    goto alt618_end
  alt618_1:
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  alt618_end:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate "line", 286
  # rx subrule "blockoid" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."blockoid"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
.annotate "line", 281
  # rx pass
    rx609_cur."!cursor_pass"(rx609_pos, "method_def")
    rx609_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx609_pos)
    .return (rx609_cur)
  rx609_fail:
.annotate "line", 4
    (rx609_rep, rx609_pos, $I10, $P10) = rx609_cur."!mark_fail"(0)
    lt rx609_pos, -1, rx609_done
    eq rx609_pos, -1, rx609_fail
    jump $I10
  rx609_done:
    rx609_cur."!cursor_fail"()
    rx609_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx609_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("148_1259420191.48826") :method
.annotate "line", 4
    new $P611, "ResizablePMCArray"
    push $P611, ""
    .return ($P611)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("149_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx628_tgt
    .local int rx628_pos
    .local int rx628_off
    .local int rx628_eos
    .local int rx628_rep
    .local pmc rx628_cur
    (rx628_cur, rx628_pos, rx628_tgt) = self."!cursor_start"()
    rx628_cur."!cursor_debug"("START ", "signature")
    rx628_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx628_cur
    .local pmc match
    .lex "$/", match
    length rx628_eos, rx628_tgt
    set rx628_off, 0
    lt rx628_pos, 2, rx628_start
    sub rx628_off, rx628_pos, 1
    substr rx628_tgt, rx628_tgt, rx628_off
  rx628_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan631_done
    goto rxscan631_scan
  rxscan631_loop:
    ($P10) = rx628_cur."from"()
    inc $P10
    set rx628_pos, $P10
    ge rx628_pos, rx628_eos, rxscan631_done
  rxscan631_scan:
    set_addr $I10, rxscan631_loop
    rx628_cur."!mark_push"(0, rx628_pos, $I10)
  rxscan631_done:
.annotate "line", 289
  # rx rxquantr632 ** 0..1
    set_addr $I635, rxquantr632_done
    rx628_cur."!mark_push"(0, rx628_pos, $I635)
  rxquantr632_loop:
  # rx rxquantr633 ** 1..*
    set_addr $I634, rxquantr633_done
    rx628_cur."!mark_push"(0, -1, $I634)
  rxquantr633_loop:
  # rx subrule "ws" subtype=method negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."ws"()
    unless $P10, rx628_fail
    rx628_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."parameter"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx628_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."ws"()
    unless $P10, rx628_fail
    rx628_pos = $P10."pos"()
    (rx628_rep) = rx628_cur."!mark_commit"($I634)
    rx628_cur."!mark_push"(rx628_rep, rx628_pos, $I634)
  # rx literal  ","
    add $I11, rx628_pos, 1
    gt $I11, rx628_eos, rx628_fail
    sub $I11, rx628_pos, rx628_off
    substr $S10, rx628_tgt, $I11, 1
    ne $S10, ",", rx628_fail
    add rx628_pos, 1
    goto rxquantr633_loop
  rxquantr633_done:
    (rx628_rep) = rx628_cur."!mark_commit"($I635)
  rxquantr632_done:
  # rx pass
    rx628_cur."!cursor_pass"(rx628_pos, "signature")
    rx628_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx628_pos)
    .return (rx628_cur)
  rx628_fail:
.annotate "line", 4
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    rx628_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("150_1259420191.48826") :method
.annotate "line", 4
    new $P630, "ResizablePMCArray"
    push $P630, ""
    .return ($P630)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("151_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx637_tgt
    .local int rx637_pos
    .local int rx637_off
    .local int rx637_eos
    .local int rx637_rep
    .local pmc rx637_cur
    (rx637_cur, rx637_pos, rx637_tgt) = self."!cursor_start"()
    rx637_cur."!cursor_debug"("START ", "parameter")
    rx637_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx637_cur
    .local pmc match
    .lex "$/", match
    length rx637_eos, rx637_tgt
    set rx637_off, 0
    lt rx637_pos, 2, rx637_start
    sub rx637_off, rx637_pos, 1
    substr rx637_tgt, rx637_tgt, rx637_off
  rx637_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan643_done
    goto rxscan643_scan
  rxscan643_loop:
    ($P10) = rx637_cur."from"()
    inc $P10
    set rx637_pos, $P10
    ge rx637_pos, rx637_eos, rxscan643_done
  rxscan643_scan:
    set_addr $I10, rxscan643_loop
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  rxscan643_done:
  alt644_0:
.annotate "line", 292
    set_addr $I10, alt644_1
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
.annotate "line", 293
  # rx subcapture "quant"
    set_addr $I10, rxcap_645_fail
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  # rx literal  "*"
    add $I11, rx637_pos, 1
    gt $I11, rx637_eos, rx637_fail
    sub $I11, rx637_pos, rx637_off
    substr $S10, rx637_tgt, $I11, 1
    ne $S10, "*", rx637_fail
    add rx637_pos, 1
    set_addr $I10, rxcap_645_fail
    ($I12, $I11) = rx637_cur."!mark_peek"($I10)
    rx637_cur."!cursor_pos"($I11)
    ($P10) = rx637_cur."!cursor_start"()
    $P10."!cursor_pass"(rx637_pos, "")
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_645_done
  rxcap_645_fail:
    goto rx637_fail
  rxcap_645_done:
  # rx subrule "param_var" subtype=capture negate=
    rx637_cur."!cursor_pos"(rx637_pos)
    $P10 = rx637_cur."param_var"()
    unless $P10, rx637_fail
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx637_pos = $P10."pos"()
    goto alt644_end
  alt644_1:
  alt646_0:
.annotate "line", 294
    set_addr $I10, alt646_1
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx637_cur."!cursor_pos"(rx637_pos)
    $P10 = rx637_cur."param_var"()
    unless $P10, rx637_fail
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx637_pos = $P10."pos"()
    goto alt646_end
  alt646_1:
  # rx subrule "named_param" subtype=capture negate=
    rx637_cur."!cursor_pos"(rx637_pos)
    $P10 = rx637_cur."named_param"()
    unless $P10, rx637_fail
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx637_pos = $P10."pos"()
  alt646_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_648_fail
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  alt647_0:
    set_addr $I10, alt647_1
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  # rx literal  "?"
    add $I11, rx637_pos, 1
    gt $I11, rx637_eos, rx637_fail
    sub $I11, rx637_pos, rx637_off
    substr $S10, rx637_tgt, $I11, 1
    ne $S10, "?", rx637_fail
    add rx637_pos, 1
    goto alt647_end
  alt647_1:
    set_addr $I10, alt647_2
    rx637_cur."!mark_push"(0, rx637_pos, $I10)
  # rx literal  "!"
    add $I11, rx637_pos, 1
    gt $I11, rx637_eos, rx637_fail
    sub $I11, rx637_pos, rx637_off
    substr $S10, rx637_tgt, $I11, 1
    ne $S10, "!", rx637_fail
    add rx637_pos, 1
    goto alt647_end
  alt647_2:
  alt647_end:
    set_addr $I10, rxcap_648_fail
    ($I12, $I11) = rx637_cur."!mark_peek"($I10)
    rx637_cur."!cursor_pos"($I11)
    ($P10) = rx637_cur."!cursor_start"()
    $P10."!cursor_pass"(rx637_pos, "")
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_648_done
  rxcap_648_fail:
    goto rx637_fail
  rxcap_648_done:
  alt644_end:
.annotate "line", 296
  # rx rxquantr649 ** 0..1
    set_addr $I650, rxquantr649_done
    rx637_cur."!mark_push"(0, rx637_pos, $I650)
  rxquantr649_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx637_cur."!cursor_pos"(rx637_pos)
    $P10 = rx637_cur."default_value"()
    unless $P10, rx637_fail
    rx637_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx637_pos = $P10."pos"()
    (rx637_rep) = rx637_cur."!mark_commit"($I650)
  rxquantr649_done:
.annotate "line", 291
  # rx pass
    rx637_cur."!cursor_pass"(rx637_pos, "parameter")
    rx637_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx637_pos)
    .return (rx637_cur)
  rx637_fail:
.annotate "line", 4
    (rx637_rep, rx637_pos, $I10, $P10) = rx637_cur."!mark_fail"(0)
    lt rx637_pos, -1, rx637_done
    eq rx637_pos, -1, rx637_fail
    jump $I10
  rx637_done:
    rx637_cur."!cursor_fail"()
    rx637_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx637_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("152_1259420191.48826") :method
.annotate "line", 4
    $P639 = self."!PREFIX__!subrule"("named_param", "")
    $P640 = self."!PREFIX__!subrule"("param_var", "")
    $P641 = self."!PREFIX__!subrule"("param_var", "*")
    new $P642, "ResizablePMCArray"
    push $P642, $P639
    push $P642, $P640
    push $P642, $P641
    .return ($P642)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("153_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx652_tgt
    .local int rx652_pos
    .local int rx652_off
    .local int rx652_eos
    .local int rx652_rep
    .local pmc rx652_cur
    (rx652_cur, rx652_pos, rx652_tgt) = self."!cursor_start"()
    rx652_cur."!cursor_debug"("START ", "param_var")
    rx652_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx652_cur
    .local pmc match
    .lex "$/", match
    length rx652_eos, rx652_tgt
    set rx652_off, 0
    lt rx652_pos, 2, rx652_start
    sub rx652_off, rx652_pos, 1
    substr rx652_tgt, rx652_tgt, rx652_off
  rx652_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan656_done
    goto rxscan656_scan
  rxscan656_loop:
    ($P10) = rx652_cur."from"()
    inc $P10
    set rx652_pos, $P10
    ge rx652_pos, rx652_eos, rxscan656_done
  rxscan656_scan:
    set_addr $I10, rxscan656_loop
    rx652_cur."!mark_push"(0, rx652_pos, $I10)
  rxscan656_done:
.annotate "line", 300
  # rx subrule "sigil" subtype=capture negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."sigil"()
    unless $P10, rx652_fail
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx652_pos = $P10."pos"()
  # rx rxquantr657 ** 0..1
    set_addr $I658, rxquantr657_done
    rx652_cur."!mark_push"(0, rx652_pos, $I658)
  rxquantr657_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."twigil"()
    unless $P10, rx652_fail
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx652_pos = $P10."pos"()
    (rx652_rep) = rx652_cur."!mark_commit"($I658)
  rxquantr657_done:
  alt659_0:
.annotate "line", 301
    set_addr $I10, alt659_1
    rx652_cur."!mark_push"(0, rx652_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ident"()
    unless $P10, rx652_fail
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx652_pos = $P10."pos"()
    goto alt659_end
  alt659_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_660_fail
    rx652_cur."!mark_push"(0, rx652_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx652_pos, rx652_eos, rx652_fail
    sub $I10, rx652_pos, rx652_off
    substr $S10, rx652_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx652_fail
    inc rx652_pos
    set_addr $I10, rxcap_660_fail
    ($I12, $I11) = rx652_cur."!mark_peek"($I10)
    rx652_cur."!cursor_pos"($I11)
    ($P10) = rx652_cur."!cursor_start"()
    $P10."!cursor_pass"(rx652_pos, "")
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_660_done
  rxcap_660_fail:
    goto rx652_fail
  rxcap_660_done:
  alt659_end:
.annotate "line", 299
  # rx pass
    rx652_cur."!cursor_pass"(rx652_pos, "param_var")
    rx652_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx652_pos)
    .return (rx652_cur)
  rx652_fail:
.annotate "line", 4
    (rx652_rep, rx652_pos, $I10, $P10) = rx652_cur."!mark_fail"(0)
    lt rx652_pos, -1, rx652_done
    eq rx652_pos, -1, rx652_fail
    jump $I10
  rx652_done:
    rx652_cur."!cursor_fail"()
    rx652_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx652_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("154_1259420191.48826") :method
.annotate "line", 4
    $P654 = self."!PREFIX__!subrule"("sigil", "")
    new $P655, "ResizablePMCArray"
    push $P655, $P654
    .return ($P655)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("155_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx662_tgt
    .local int rx662_pos
    .local int rx662_off
    .local int rx662_eos
    .local int rx662_rep
    .local pmc rx662_cur
    (rx662_cur, rx662_pos, rx662_tgt) = self."!cursor_start"()
    rx662_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx662_cur
    .local pmc match
    .lex "$/", match
    length rx662_eos, rx662_tgt
    set rx662_off, 0
    lt rx662_pos, 2, rx662_start
    sub rx662_off, rx662_pos, 1
    substr rx662_tgt, rx662_tgt, rx662_off
  rx662_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan666_done
    goto rxscan666_scan
  rxscan666_loop:
    ($P10) = rx662_cur."from"()
    inc $P10
    set rx662_pos, $P10
    ge rx662_pos, rx662_eos, rxscan666_done
  rxscan666_scan:
    set_addr $I10, rxscan666_loop
    rx662_cur."!mark_push"(0, rx662_pos, $I10)
  rxscan666_done:
.annotate "line", 305
  # rx literal  ":"
    add $I11, rx662_pos, 1
    gt $I11, rx662_eos, rx662_fail
    sub $I11, rx662_pos, rx662_off
    substr $S10, rx662_tgt, $I11, 1
    ne $S10, ":", rx662_fail
    add rx662_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx662_cur."!cursor_pos"(rx662_pos)
    $P10 = rx662_cur."param_var"()
    unless $P10, rx662_fail
    rx662_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx662_pos = $P10."pos"()
.annotate "line", 304
  # rx pass
    rx662_cur."!cursor_pass"(rx662_pos, "named_param")
    rx662_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx662_pos)
    .return (rx662_cur)
  rx662_fail:
.annotate "line", 4
    (rx662_rep, rx662_pos, $I10, $P10) = rx662_cur."!mark_fail"(0)
    lt rx662_pos, -1, rx662_done
    eq rx662_pos, -1, rx662_fail
    jump $I10
  rx662_done:
    rx662_cur."!cursor_fail"()
    rx662_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx662_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("156_1259420191.48826") :method
.annotate "line", 4
    $P664 = self."!PREFIX__!subrule"("param_var", ":")
    new $P665, "ResizablePMCArray"
    push $P665, $P664
    .return ($P665)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("157_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx668_tgt
    .local int rx668_pos
    .local int rx668_off
    .local int rx668_eos
    .local int rx668_rep
    .local pmc rx668_cur
    (rx668_cur, rx668_pos, rx668_tgt) = self."!cursor_start"()
    rx668_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx668_cur
    .local pmc match
    .lex "$/", match
    length rx668_eos, rx668_tgt
    set rx668_off, 0
    lt rx668_pos, 2, rx668_start
    sub rx668_off, rx668_pos, 1
    substr rx668_tgt, rx668_tgt, rx668_off
  rx668_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan671_done
    goto rxscan671_scan
  rxscan671_loop:
    ($P10) = rx668_cur."from"()
    inc $P10
    set rx668_pos, $P10
    ge rx668_pos, rx668_eos, rxscan671_done
  rxscan671_scan:
    set_addr $I10, rxscan671_loop
    rx668_cur."!mark_push"(0, rx668_pos, $I10)
  rxscan671_done:
.annotate "line", 308
  # rx subrule "ws" subtype=method negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."ws"()
    unless $P10, rx668_fail
    rx668_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx668_pos, 1
    gt $I11, rx668_eos, rx668_fail
    sub $I11, rx668_pos, rx668_off
    substr $S10, rx668_tgt, $I11, 1
    ne $S10, "=", rx668_fail
    add rx668_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."ws"()
    unless $P10, rx668_fail
    rx668_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."EXPR"("i=")
    unless $P10, rx668_fail
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx668_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."ws"()
    unless $P10, rx668_fail
    rx668_pos = $P10."pos"()
  # rx pass
    rx668_cur."!cursor_pass"(rx668_pos, "default_value")
    rx668_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx668_pos)
    .return (rx668_cur)
  rx668_fail:
.annotate "line", 4
    (rx668_rep, rx668_pos, $I10, $P10) = rx668_cur."!mark_fail"(0)
    lt rx668_pos, -1, rx668_done
    eq rx668_pos, -1, rx668_fail
    jump $I10
  rx668_done:
    rx668_cur."!cursor_fail"()
    rx668_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx668_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("158_1259420191.48826") :method
.annotate "line", 4
    new $P670, "ResizablePMCArray"
    push $P670, ""
    .return ($P670)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("159_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx676_tgt
    .local int rx676_pos
    .local int rx676_off
    .local int rx676_eos
    .local int rx676_rep
    .local pmc rx676_cur
    (rx676_cur, rx676_pos, rx676_tgt) = self."!cursor_start"()
    rx676_cur."!cursor_debug"("START ", "regex_declarator")
    rx676_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx676_cur
    .local pmc match
    .lex "$/", match
    length rx676_eos, rx676_tgt
    set rx676_off, 0
    lt rx676_pos, 2, rx676_start
    sub rx676_off, rx676_pos, 1
    substr rx676_tgt, rx676_tgt, rx676_off
  rx676_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan679_done
    goto rxscan679_scan
  rxscan679_loop:
    ($P10) = rx676_cur."from"()
    inc $P10
    set rx676_pos, $P10
    ge rx676_pos, rx676_eos, rxscan679_done
  rxscan679_scan:
    set_addr $I10, rxscan679_loop
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  rxscan679_done:
.annotate "line", 310
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  alt681_0:
.annotate "line", 311
    set_addr $I10, alt681_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
.annotate "line", 312
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_683_fail
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx literal  "proto"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "proto", rx676_fail
    add rx676_pos, 5
    set_addr $I10, rxcap_683_fail
    ($I12, $I11) = rx676_cur."!mark_peek"($I10)
    rx676_cur."!cursor_pos"($I11)
    ($P10) = rx676_cur."!cursor_start"()
    $P10."!cursor_pass"(rx676_pos, "")
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_683_done
  rxcap_683_fail:
    goto rx676_fail
  rxcap_683_done:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  alt685_0:
    set_addr $I10, alt685_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx literal  "regex"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "regex", rx676_fail
    add rx676_pos, 5
    goto alt685_end
  alt685_1:
    set_addr $I10, alt685_2
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx literal  "token"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "token", rx676_fail
    add rx676_pos, 5
    goto alt685_end
  alt685_2:
  # rx literal  "rule"
    add $I11, rx676_pos, 4
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 4
    ne $S10, "rule", rx676_fail
    add rx676_pos, 4
  alt685_end:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 313
  # rx subrule "deflongname" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."deflongname"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 314
  # rx literal  "{"
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, "{", rx676_fail
    add rx676_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "<...>", rx676_fail
    add rx676_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, "}", rx676_fail
    add rx676_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ENDSTMT"()
    unless $P10, rx676_fail
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 312
    goto alt681_end
  alt681_1:
.annotate "line", 315
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_693_fail
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  alt692_0:
    set_addr $I10, alt692_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx literal  "regex"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "regex", rx676_fail
    add rx676_pos, 5
    goto alt692_end
  alt692_1:
    set_addr $I10, alt692_2
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
  # rx literal  "token"
    add $I11, rx676_pos, 5
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 5
    ne $S10, "token", rx676_fail
    add rx676_pos, 5
    goto alt692_end
  alt692_2:
  # rx literal  "rule"
    add $I11, rx676_pos, 4
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 4
    ne $S10, "rule", rx676_fail
    add rx676_pos, 4
  alt692_end:
    set_addr $I10, rxcap_693_fail
    ($I12, $I11) = rx676_cur."!mark_peek"($I10)
    rx676_cur."!cursor_pos"($I11)
    ($P10) = rx676_cur."!cursor_start"()
    $P10."!cursor_pass"(rx676_pos, "")
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_693_done
  rxcap_693_fail:
    goto rx676_fail
  rxcap_693_done:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 316
  # rx subrule "deflongname" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."deflongname"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx676_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 317
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
.annotate "line", 318
  # rx rxquantr697 ** 0..1
    set_addr $I702, rxquantr697_done
    rx676_cur."!mark_push"(0, rx676_pos, $I702)
  rxquantr697_loop:
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
    (rx676_rep) = rx676_cur."!mark_commit"($I702)
  rxquantr697_done:
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 319
  # rx reduce name="regex_declarator" key="open"
    rx676_cur."!cursor_pos"(rx676_pos)
    rx676_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 320
  # rx literal  "{"
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, "{", rx676_fail
    add rx676_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."LANG"("Regex", "nibbler")
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx676_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx676_pos, 1
    gt $I11, rx676_eos, rx676_fail
    sub $I11, rx676_pos, rx676_off
    substr $S10, rx676_tgt, $I11, 1
    ne $S10, "}", rx676_fail
    add rx676_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ENDSTMT"()
    unless $P10, rx676_fail
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
  alt681_end:
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."ws"()
    unless $P10, rx676_fail
    rx676_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx676_cur."!cursor_pass"(rx676_pos, "regex_declarator")
    rx676_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx676_pos)
    .return (rx676_cur)
  rx676_fail:
.annotate "line", 4
    (rx676_rep, rx676_pos, $I10, $P10) = rx676_cur."!mark_fail"(0)
    lt rx676_pos, -1, rx676_done
    eq rx676_pos, -1, rx676_fail
    jump $I10
  rx676_done:
    rx676_cur."!cursor_fail"()
    rx676_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx676_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("160_1259420191.48826") :method
.annotate "line", 4
    new $P678, "ResizablePMCArray"
    push $P678, ""
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("161_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx708_tgt
    .local int rx708_pos
    .local int rx708_off
    .local int rx708_eos
    .local int rx708_rep
    .local pmc rx708_cur
    (rx708_cur, rx708_pos, rx708_tgt) = self."!cursor_start"()
    rx708_cur."!cursor_debug"("START ", "dotty")
    rx708_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx708_cur
    .local pmc match
    .lex "$/", match
    length rx708_eos, rx708_tgt
    set rx708_off, 0
    lt rx708_pos, 2, rx708_start
    sub rx708_off, rx708_pos, 1
    substr rx708_tgt, rx708_tgt, rx708_off
  rx708_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan712_done
    goto rxscan712_scan
  rxscan712_loop:
    ($P10) = rx708_cur."from"()
    inc $P10
    set rx708_pos, $P10
    ge rx708_pos, rx708_eos, rxscan712_done
  rxscan712_scan:
    set_addr $I10, rxscan712_loop
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
  rxscan712_done:
.annotate "line", 325
  # rx literal  "."
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, ".", rx708_fail
    add rx708_pos, 1
  alt713_0:
.annotate "line", 326
    set_addr $I10, alt713_1
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."identifier"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx708_pos = $P10."pos"()
    goto alt713_end
  alt713_1:
.annotate "line", 327
  # rx enumcharlist negate=0 zerowidth
    ge rx708_pos, rx708_eos, rx708_fail
    sub $I10, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx708_fail
  # rx subrule "quote" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."quote"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx708_pos = $P10."pos"()
  alt714_0:
.annotate "line", 328
    set_addr $I10, alt714_1
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx708_pos, rx708_eos, rx708_fail
    sub $I10, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx708_fail
    goto alt714_end
  alt714_1:
  # rx subrule "panic" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  alt714_end:
  alt713_end:
.annotate "line", 334
  # rx rxquantr715 ** 0..1
    set_addr $I717, rxquantr715_done
    rx708_cur."!mark_push"(0, rx708_pos, $I717)
  rxquantr715_loop:
  alt716_0:
.annotate "line", 331
    set_addr $I10, alt716_1
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
.annotate "line", 332
  # rx enumcharlist negate=0 zerowidth
    ge rx708_pos, rx708_eos, rx708_fail
    sub $I10, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx708_fail
  # rx subrule "args" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."args"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx708_pos = $P10."pos"()
    goto alt716_end
  alt716_1:
.annotate "line", 333
  # rx literal  ":"
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, ":", rx708_fail
    add rx708_pos, 1
  # rx charclass s
    ge rx708_pos, rx708_eos, rx708_fail
    sub $I10, rx708_pos, rx708_off
    is_cclass $I11, 32, rx708_tgt, $I10
    unless $I11, rx708_fail
    inc rx708_pos
  # rx subrule "arglist" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."arglist"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx708_pos = $P10."pos"()
  alt716_end:
.annotate "line", 334
    (rx708_rep) = rx708_cur."!mark_commit"($I717)
  rxquantr715_done:
.annotate "line", 324
  # rx pass
    rx708_cur."!cursor_pass"(rx708_pos, "dotty")
    rx708_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx708_pos)
    .return (rx708_cur)
  rx708_fail:
.annotate "line", 4
    (rx708_rep, rx708_pos, $I10, $P10) = rx708_cur."!mark_fail"(0)
    lt rx708_pos, -1, rx708_done
    eq rx708_pos, -1, rx708_fail
    jump $I10
  rx708_done:
    rx708_cur."!cursor_fail"()
    rx708_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx708_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("162_1259420191.48826") :method
.annotate "line", 4
    $P710 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P711, "ResizablePMCArray"
    push $P711, "'"
    push $P711, "\""
    push $P711, $P710
    .return ($P711)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("163_1259420191.48826") :method
.annotate "line", 338
    $P719 = self."!protoregex"("term")
    .return ($P719)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("164_1259420191.48826") :method
.annotate "line", 338
    $P721 = self."!PREFIX__!protoregex"("term")
    .return ($P721)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("165_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx723_tgt
    .local int rx723_pos
    .local int rx723_off
    .local int rx723_eos
    .local int rx723_rep
    .local pmc rx723_cur
    (rx723_cur, rx723_pos, rx723_tgt) = self."!cursor_start"()
    rx723_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx723_cur
    .local pmc match
    .lex "$/", match
    length rx723_eos, rx723_tgt
    set rx723_off, 0
    lt rx723_pos, 2, rx723_start
    sub rx723_off, rx723_pos, 1
    substr rx723_tgt, rx723_tgt, rx723_off
  rx723_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan726_done
    goto rxscan726_scan
  rxscan726_loop:
    ($P10) = rx723_cur."from"()
    inc $P10
    set rx723_pos, $P10
    ge rx723_pos, rx723_eos, rxscan726_done
  rxscan726_scan:
    set_addr $I10, rxscan726_loop
    rx723_cur."!mark_push"(0, rx723_pos, $I10)
  rxscan726_done:
.annotate "line", 340
  # rx subcapture "sym"
    set_addr $I10, rxcap_727_fail
    rx723_cur."!mark_push"(0, rx723_pos, $I10)
  # rx literal  "self"
    add $I11, rx723_pos, 4
    gt $I11, rx723_eos, rx723_fail
    sub $I11, rx723_pos, rx723_off
    substr $S10, rx723_tgt, $I11, 4
    ne $S10, "self", rx723_fail
    add rx723_pos, 4
    set_addr $I10, rxcap_727_fail
    ($I12, $I11) = rx723_cur."!mark_peek"($I10)
    rx723_cur."!cursor_pos"($I11)
    ($P10) = rx723_cur."!cursor_start"()
    $P10."!cursor_pass"(rx723_pos, "")
    rx723_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_727_done
  rxcap_727_fail:
    goto rx723_fail
  rxcap_727_done:
  # rxanchor rwb
    le rx723_pos, 0, rx723_fail
    sub $I10, rx723_pos, rx723_off
    is_cclass $I11, 8192, rx723_tgt, $I10
    if $I11, rx723_fail
    dec $I10
    is_cclass $I11, 8192, rx723_tgt, $I10
    unless $I11, rx723_fail
  # rx pass
    rx723_cur."!cursor_pass"(rx723_pos, "term:sym<self>")
    rx723_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx723_pos)
    .return (rx723_cur)
  rx723_fail:
.annotate "line", 4
    (rx723_rep, rx723_pos, $I10, $P10) = rx723_cur."!mark_fail"(0)
    lt rx723_pos, -1, rx723_done
    eq rx723_pos, -1, rx723_fail
    jump $I10
  rx723_done:
    rx723_cur."!cursor_fail"()
    rx723_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx723_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("166_1259420191.48826") :method
.annotate "line", 4
    new $P725, "ResizablePMCArray"
    push $P725, "self"
    .return ($P725)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("167_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx729_tgt
    .local int rx729_pos
    .local int rx729_off
    .local int rx729_eos
    .local int rx729_rep
    .local pmc rx729_cur
    (rx729_cur, rx729_pos, rx729_tgt) = self."!cursor_start"()
    rx729_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx729_cur
    .local pmc match
    .lex "$/", match
    length rx729_eos, rx729_tgt
    set rx729_off, 0
    lt rx729_pos, 2, rx729_start
    sub rx729_off, rx729_pos, 1
    substr rx729_tgt, rx729_tgt, rx729_off
  rx729_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan733_done
    goto rxscan733_scan
  rxscan733_loop:
    ($P10) = rx729_cur."from"()
    inc $P10
    set rx729_pos, $P10
    ge rx729_pos, rx729_eos, rxscan733_done
  rxscan733_scan:
    set_addr $I10, rxscan733_loop
    rx729_cur."!mark_push"(0, rx729_pos, $I10)
  rxscan733_done:
.annotate "line", 343
  # rx subrule "identifier" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."identifier"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx729_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx729_pos, rx729_eos, rx729_fail
    sub $I10, rx729_pos, rx729_off
    substr $S10, rx729_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx729_fail
  # rx subrule "args" subtype=capture negate=
    rx729_cur."!cursor_pos"(rx729_pos)
    $P10 = rx729_cur."args"()
    unless $P10, rx729_fail
    rx729_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx729_pos = $P10."pos"()
.annotate "line", 342
  # rx pass
    rx729_cur."!cursor_pass"(rx729_pos, "term:sym<identifier>")
    rx729_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx729_pos)
    .return (rx729_cur)
  rx729_fail:
.annotate "line", 4
    (rx729_rep, rx729_pos, $I10, $P10) = rx729_cur."!mark_fail"(0)
    lt rx729_pos, -1, rx729_done
    eq rx729_pos, -1, rx729_fail
    jump $I10
  rx729_done:
    rx729_cur."!cursor_fail"()
    rx729_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx729_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("168_1259420191.48826") :method
.annotate "line", 4
    $P731 = self."!PREFIX__!subrule"("identifier", "")
    new $P732, "ResizablePMCArray"
    push $P732, $P731
    .return ($P732)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("169_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx735_tgt
    .local int rx735_pos
    .local int rx735_off
    .local int rx735_eos
    .local int rx735_rep
    .local pmc rx735_cur
    (rx735_cur, rx735_pos, rx735_tgt) = self."!cursor_start"()
    rx735_cur."!cursor_debug"("START ", "term:sym<name>")
    rx735_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx735_cur
    .local pmc match
    .lex "$/", match
    length rx735_eos, rx735_tgt
    set rx735_off, 0
    lt rx735_pos, 2, rx735_start
    sub rx735_off, rx735_pos, 1
    substr rx735_tgt, rx735_tgt, rx735_off
  rx735_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan739_done
    goto rxscan739_scan
  rxscan739_loop:
    ($P10) = rx735_cur."from"()
    inc $P10
    set rx735_pos, $P10
    ge rx735_pos, rx735_eos, rxscan739_done
  rxscan739_scan:
    set_addr $I10, rxscan739_loop
    rx735_cur."!mark_push"(0, rx735_pos, $I10)
  rxscan739_done:
.annotate "line", 347
  # rx subrule "name" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."name"()
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx735_pos = $P10."pos"()
  # rx rxquantr740 ** 0..1
    set_addr $I741, rxquantr740_done
    rx735_cur."!mark_push"(0, rx735_pos, $I741)
  rxquantr740_loop:
  # rx subrule "args" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."args"()
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx735_pos = $P10."pos"()
    (rx735_rep) = rx735_cur."!mark_commit"($I741)
  rxquantr740_done:
.annotate "line", 346
  # rx pass
    rx735_cur."!cursor_pass"(rx735_pos, "term:sym<name>")
    rx735_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx735_pos)
    .return (rx735_cur)
  rx735_fail:
.annotate "line", 4
    (rx735_rep, rx735_pos, $I10, $P10) = rx735_cur."!mark_fail"(0)
    lt rx735_pos, -1, rx735_done
    eq rx735_pos, -1, rx735_fail
    jump $I10
  rx735_done:
    rx735_cur."!cursor_fail"()
    rx735_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx735_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("170_1259420191.48826") :method
.annotate "line", 4
    $P737 = self."!PREFIX__!subrule"("name", "")
    new $P738, "ResizablePMCArray"
    push $P738, $P737
    .return ($P738)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("171_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx743_tgt
    .local int rx743_pos
    .local int rx743_off
    .local int rx743_eos
    .local int rx743_rep
    .local pmc rx743_cur
    (rx743_cur, rx743_pos, rx743_tgt) = self."!cursor_start"()
    rx743_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx743_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx743_cur
    .local pmc match
    .lex "$/", match
    length rx743_eos, rx743_tgt
    set rx743_off, 0
    lt rx743_pos, 2, rx743_start
    sub rx743_off, rx743_pos, 1
    substr rx743_tgt, rx743_tgt, rx743_off
  rx743_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan746_done
    goto rxscan746_scan
  rxscan746_loop:
    ($P10) = rx743_cur."from"()
    inc $P10
    set rx743_pos, $P10
    ge rx743_pos, rx743_eos, rxscan746_done
  rxscan746_scan:
    set_addr $I10, rxscan746_loop
    rx743_cur."!mark_push"(0, rx743_pos, $I10)
  rxscan746_done:
.annotate "line", 351
  # rx literal  "pir::"
    add $I11, rx743_pos, 5
    gt $I11, rx743_eos, rx743_fail
    sub $I11, rx743_pos, rx743_off
    substr $S10, rx743_tgt, $I11, 5
    ne $S10, "pir::", rx743_fail
    add rx743_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_747_fail
    rx743_cur."!mark_push"(0, rx743_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx743_pos, rx743_off
    find_not_cclass $I11, 8192, rx743_tgt, $I10, rx743_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx743_fail
    add rx743_pos, rx743_off, $I11
    set_addr $I10, rxcap_747_fail
    ($I12, $I11) = rx743_cur."!mark_peek"($I10)
    rx743_cur."!cursor_pos"($I11)
    ($P10) = rx743_cur."!cursor_start"()
    $P10."!cursor_pass"(rx743_pos, "")
    rx743_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_747_done
  rxcap_747_fail:
    goto rx743_fail
  rxcap_747_done:
  # rx rxquantr748 ** 0..1
    set_addr $I749, rxquantr748_done
    rx743_cur."!mark_push"(0, rx743_pos, $I749)
  rxquantr748_loop:
  # rx subrule "args" subtype=capture negate=
    rx743_cur."!cursor_pos"(rx743_pos)
    $P10 = rx743_cur."args"()
    unless $P10, rx743_fail
    rx743_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx743_pos = $P10."pos"()
    (rx743_rep) = rx743_cur."!mark_commit"($I749)
  rxquantr748_done:
.annotate "line", 350
  # rx pass
    rx743_cur."!cursor_pass"(rx743_pos, "term:sym<pir::op>")
    rx743_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx743_pos)
    .return (rx743_cur)
  rx743_fail:
.annotate "line", 4
    (rx743_rep, rx743_pos, $I10, $P10) = rx743_cur."!mark_fail"(0)
    lt rx743_pos, -1, rx743_done
    eq rx743_pos, -1, rx743_fail
    jump $I10
  rx743_done:
    rx743_cur."!cursor_fail"()
    rx743_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx743_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("172_1259420191.48826") :method
.annotate "line", 4
    new $P745, "ResizablePMCArray"
    push $P745, "pir::"
    .return ($P745)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("173_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx751_tgt
    .local int rx751_pos
    .local int rx751_off
    .local int rx751_eos
    .local int rx751_rep
    .local pmc rx751_cur
    (rx751_cur, rx751_pos, rx751_tgt) = self."!cursor_start"()
    rx751_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx751_cur
    .local pmc match
    .lex "$/", match
    length rx751_eos, rx751_tgt
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
.annotate "line", 355
  # rx literal  "("
    add $I11, rx751_pos, 1
    gt $I11, rx751_eos, rx751_fail
    sub $I11, rx751_pos, rx751_off
    substr $S10, rx751_tgt, $I11, 1
    ne $S10, "(", rx751_fail
    add rx751_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."arglist"()
    unless $P10, rx751_fail
    rx751_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx751_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx751_pos, 1
    gt $I11, rx751_eos, rx751_fail
    sub $I11, rx751_pos, rx751_off
    substr $S10, rx751_tgt, $I11, 1
    ne $S10, ")", rx751_fail
    add rx751_pos, 1
  # rx pass
    rx751_cur."!cursor_pass"(rx751_pos, "args")
    rx751_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx751_pos)
    .return (rx751_cur)
  rx751_fail:
.annotate "line", 4
    (rx751_rep, rx751_pos, $I10, $P10) = rx751_cur."!mark_fail"(0)
    lt rx751_pos, -1, rx751_done
    eq rx751_pos, -1, rx751_fail
    jump $I10
  rx751_done:
    rx751_cur."!cursor_fail"()
    rx751_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx751_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("174_1259420191.48826") :method
.annotate "line", 4
    $P753 = self."!PREFIX__!subrule"("arglist", "(")
    new $P754, "ResizablePMCArray"
    push $P754, $P753
    .return ($P754)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("175_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx757_tgt
    .local int rx757_pos
    .local int rx757_off
    .local int rx757_eos
    .local int rx757_rep
    .local pmc rx757_cur
    (rx757_cur, rx757_pos, rx757_tgt) = self."!cursor_start"()
    rx757_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx757_cur
    .local pmc match
    .lex "$/", match
    length rx757_eos, rx757_tgt
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
.annotate "line", 359
  # rx subrule "ws" subtype=method negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."ws"()
    unless $P10, rx757_fail
    rx757_pos = $P10."pos"()
  alt762_0:
.annotate "line", 360
    set_addr $I10, alt762_1
    rx757_cur."!mark_push"(0, rx757_pos, $I10)
.annotate "line", 361
  # rx subrule "EXPR" subtype=capture negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."EXPR"("f=")
    unless $P10, rx757_fail
    rx757_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx757_pos = $P10."pos"()
    goto alt762_end
  alt762_1:
  alt762_end:
.annotate "line", 358
  # rx pass
    rx757_cur."!cursor_pass"(rx757_pos, "arglist")
    rx757_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx757_pos)
    .return (rx757_cur)
  rx757_fail:
.annotate "line", 4
    (rx757_rep, rx757_pos, $I10, $P10) = rx757_cur."!mark_fail"(0)
    lt rx757_pos, -1, rx757_done
    eq rx757_pos, -1, rx757_fail
    jump $I10
  rx757_done:
    rx757_cur."!cursor_fail"()
    rx757_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx757_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("176_1259420191.48826") :method
.annotate "line", 4
    $P759 = self."!PREFIX__!subrule"("", "")
    new $P760, "ResizablePMCArray"
    push $P760, $P759
    .return ($P760)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("177_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx764_tgt
    .local int rx764_pos
    .local int rx764_off
    .local int rx764_eos
    .local int rx764_rep
    .local pmc rx764_cur
    (rx764_cur, rx764_pos, rx764_tgt) = self."!cursor_start"()
    rx764_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx764_cur
    .local pmc match
    .lex "$/", match
    length rx764_eos, rx764_tgt
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
.annotate "line", 367
  # rx subrule "value" subtype=capture negate=
    rx764_cur."!cursor_pos"(rx764_pos)
    $P10 = rx764_cur."value"()
    unless $P10, rx764_fail
    rx764_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx764_pos = $P10."pos"()
  # rx pass
    rx764_cur."!cursor_pass"(rx764_pos, "term:sym<value>")
    rx764_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx764_pos)
    .return (rx764_cur)
  rx764_fail:
.annotate "line", 4
    (rx764_rep, rx764_pos, $I10, $P10) = rx764_cur."!mark_fail"(0)
    lt rx764_pos, -1, rx764_done
    eq rx764_pos, -1, rx764_fail
    jump $I10
  rx764_done:
    rx764_cur."!cursor_fail"()
    rx764_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx764_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("178_1259420191.48826") :method
.annotate "line", 4
    $P766 = self."!PREFIX__!subrule"("value", "")
    new $P767, "ResizablePMCArray"
    push $P767, $P766
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("179_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx770_tgt
    .local int rx770_pos
    .local int rx770_off
    .local int rx770_eos
    .local int rx770_rep
    .local pmc rx770_cur
    (rx770_cur, rx770_pos, rx770_tgt) = self."!cursor_start"()
    rx770_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx770_cur
    .local pmc match
    .lex "$/", match
    length rx770_eos, rx770_tgt
    set rx770_off, 0
    lt rx770_pos, 2, rx770_start
    sub rx770_off, rx770_pos, 1
    substr rx770_tgt, rx770_tgt, rx770_off
  rx770_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan775_done
    goto rxscan775_scan
  rxscan775_loop:
    ($P10) = rx770_cur."from"()
    inc $P10
    set rx770_pos, $P10
    ge rx770_pos, rx770_eos, rxscan775_done
  rxscan775_scan:
    set_addr $I10, rxscan775_loop
    rx770_cur."!mark_push"(0, rx770_pos, $I10)
  rxscan775_done:
  alt776_0:
.annotate "line", 369
    set_addr $I10, alt776_1
    rx770_cur."!mark_push"(0, rx770_pos, $I10)
.annotate "line", 370
  # rx subrule "quote" subtype=capture negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."quote"()
    unless $P10, rx770_fail
    rx770_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx770_pos = $P10."pos"()
    goto alt776_end
  alt776_1:
.annotate "line", 371
  # rx subrule "number" subtype=capture negate=
    rx770_cur."!cursor_pos"(rx770_pos)
    $P10 = rx770_cur."number"()
    unless $P10, rx770_fail
    rx770_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx770_pos = $P10."pos"()
  alt776_end:
.annotate "line", 369
  # rx pass
    rx770_cur."!cursor_pass"(rx770_pos, "value")
    rx770_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx770_pos)
    .return (rx770_cur)
  rx770_fail:
.annotate "line", 4
    (rx770_rep, rx770_pos, $I10, $P10) = rx770_cur."!mark_fail"(0)
    lt rx770_pos, -1, rx770_done
    eq rx770_pos, -1, rx770_fail
    jump $I10
  rx770_done:
    rx770_cur."!cursor_fail"()
    rx770_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx770_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("180_1259420191.48826") :method
.annotate "line", 4
    $P772 = self."!PREFIX__!subrule"("number", "")
    $P773 = self."!PREFIX__!subrule"("quote", "")
    new $P774, "ResizablePMCArray"
    push $P774, $P772
    push $P774, $P773
    .return ($P774)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("181_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx778_tgt
    .local int rx778_pos
    .local int rx778_off
    .local int rx778_eos
    .local int rx778_rep
    .local pmc rx778_cur
    (rx778_cur, rx778_pos, rx778_tgt) = self."!cursor_start"()
    rx778_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx778_cur
    .local pmc match
    .lex "$/", match
    length rx778_eos, rx778_tgt
    set rx778_off, 0
    lt rx778_pos, 2, rx778_start
    sub rx778_off, rx778_pos, 1
    substr rx778_tgt, rx778_tgt, rx778_off
  rx778_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan781_done
    goto rxscan781_scan
  rxscan781_loop:
    ($P10) = rx778_cur."from"()
    inc $P10
    set rx778_pos, $P10
    ge rx778_pos, rx778_eos, rxscan781_done
  rxscan781_scan:
    set_addr $I10, rxscan781_loop
    rx778_cur."!mark_push"(0, rx778_pos, $I10)
  rxscan781_done:
.annotate "line", 375
  # rx subcapture "sign"
    set_addr $I10, rxcap_784_fail
    rx778_cur."!mark_push"(0, rx778_pos, $I10)
  # rx rxquantr782 ** 0..1
    set_addr $I783, rxquantr782_done
    rx778_cur."!mark_push"(0, rx778_pos, $I783)
  rxquantr782_loop:
  # rx enumcharlist negate=0 
    ge rx778_pos, rx778_eos, rx778_fail
    sub $I10, rx778_pos, rx778_off
    substr $S10, rx778_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx778_fail
    inc rx778_pos
    (rx778_rep) = rx778_cur."!mark_commit"($I783)
  rxquantr782_done:
    set_addr $I10, rxcap_784_fail
    ($I12, $I11) = rx778_cur."!mark_peek"($I10)
    rx778_cur."!cursor_pos"($I11)
    ($P10) = rx778_cur."!cursor_start"()
    $P10."!cursor_pass"(rx778_pos, "")
    rx778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_784_done
  rxcap_784_fail:
    goto rx778_fail
  rxcap_784_done:
  alt785_0:
.annotate "line", 376
    set_addr $I10, alt785_1
    rx778_cur."!mark_push"(0, rx778_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx778_cur."!cursor_pos"(rx778_pos)
    $P10 = rx778_cur."dec_number"()
    unless $P10, rx778_fail
    rx778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx778_pos = $P10."pos"()
    goto alt785_end
  alt785_1:
  # rx subrule "integer" subtype=capture negate=
    rx778_cur."!cursor_pos"(rx778_pos)
    $P10 = rx778_cur."integer"()
    unless $P10, rx778_fail
    rx778_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx778_pos = $P10."pos"()
  alt785_end:
.annotate "line", 374
  # rx pass
    rx778_cur."!cursor_pass"(rx778_pos, "number")
    rx778_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx778_pos)
    .return (rx778_cur)
  rx778_fail:
.annotate "line", 4
    (rx778_rep, rx778_pos, $I10, $P10) = rx778_cur."!mark_fail"(0)
    lt rx778_pos, -1, rx778_done
    eq rx778_pos, -1, rx778_fail
    jump $I10
  rx778_done:
    rx778_cur."!cursor_fail"()
    rx778_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx778_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("182_1259420191.48826") :method
.annotate "line", 4
    new $P780, "ResizablePMCArray"
    push $P780, ""
    .return ($P780)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("183_1259420191.48826") :method
.annotate "line", 379
    $P787 = self."!protoregex"("quote")
    .return ($P787)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("184_1259420191.48826") :method
.annotate "line", 379
    $P789 = self."!PREFIX__!protoregex"("quote")
    .return ($P789)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("185_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx791_cur
    .local pmc match
    .lex "$/", match
    length rx791_eos, rx791_tgt
    set rx791_off, 0
    lt rx791_pos, 2, rx791_start
    sub rx791_off, rx791_pos, 1
    substr rx791_tgt, rx791_tgt, rx791_off
  rx791_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan794_done
    goto rxscan794_scan
  rxscan794_loop:
    ($P10) = rx791_cur."from"()
    inc $P10
    set rx791_pos, $P10
    ge rx791_pos, rx791_eos, rxscan794_done
  rxscan794_scan:
    set_addr $I10, rxscan794_loop
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  rxscan794_done:
.annotate "line", 380
  # rx enumcharlist negate=0 zerowidth
    ge rx791_pos, rx791_eos, rx791_fail
    sub $I10, rx791_pos, rx791_off
    substr $S10, rx791_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx791_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."quote_EXPR"(":q")
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx791_pos = $P10."pos"()
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "quote:sym<apos>")
    rx791_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 4
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("186_1259420191.48826") :method
.annotate "line", 4
    new $P793, "ResizablePMCArray"
    push $P793, "'"
    .return ($P793)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("187_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx796_tgt
    .local int rx796_pos
    .local int rx796_off
    .local int rx796_eos
    .local int rx796_rep
    .local pmc rx796_cur
    (rx796_cur, rx796_pos, rx796_tgt) = self."!cursor_start"()
    rx796_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
.annotate "line", 381
  # rx enumcharlist negate=0 zerowidth
    ge rx796_pos, rx796_eos, rx796_fail
    sub $I10, rx796_pos, rx796_off
    substr $S10, rx796_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx796_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx796_cur."!cursor_pos"(rx796_pos)
    $P10 = rx796_cur."quote_EXPR"(":qq")
    unless $P10, rx796_fail
    rx796_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx796_pos = $P10."pos"()
  # rx pass
    rx796_cur."!cursor_pass"(rx796_pos, "quote:sym<dblq>")
    rx796_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx796_pos)
    .return (rx796_cur)
  rx796_fail:
.annotate "line", 4
    (rx796_rep, rx796_pos, $I10, $P10) = rx796_cur."!mark_fail"(0)
    lt rx796_pos, -1, rx796_done
    eq rx796_pos, -1, rx796_fail
    jump $I10
  rx796_done:
    rx796_cur."!cursor_fail"()
    rx796_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx796_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("188_1259420191.48826") :method
.annotate "line", 4
    new $P798, "ResizablePMCArray"
    push $P798, "\""
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("189_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx801_tgt
    .local int rx801_pos
    .local int rx801_off
    .local int rx801_eos
    .local int rx801_rep
    .local pmc rx801_cur
    (rx801_cur, rx801_pos, rx801_tgt) = self."!cursor_start"()
    rx801_cur."!cursor_debug"("START ", "quote:sym<q>")
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
.annotate "line", 382
  # rx literal  "q"
    add $I11, rx801_pos, 1
    gt $I11, rx801_eos, rx801_fail
    sub $I11, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I11, 1
    ne $S10, "q", rx801_fail
    add rx801_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx801_pos, rx801_eos, rx801_fail
    sub $I10, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx801_fail
  # rx subrule "ws" subtype=method negate=
    rx801_cur."!cursor_pos"(rx801_pos)
    $P10 = rx801_cur."ws"()
    unless $P10, rx801_fail
    rx801_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx801_cur."!cursor_pos"(rx801_pos)
    $P10 = rx801_cur."quote_EXPR"(":q")
    unless $P10, rx801_fail
    rx801_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx801_pos = $P10."pos"()
  # rx pass
    rx801_cur."!cursor_pass"(rx801_pos, "quote:sym<q>")
    rx801_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx801_pos)
    .return (rx801_cur)
  rx801_fail:
.annotate "line", 4
    (rx801_rep, rx801_pos, $I10, $P10) = rx801_cur."!mark_fail"(0)
    lt rx801_pos, -1, rx801_done
    eq rx801_pos, -1, rx801_fail
    jump $I10
  rx801_done:
    rx801_cur."!cursor_fail"()
    rx801_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx801_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("190_1259420191.48826") :method
.annotate "line", 4
    $P803 = self."!PREFIX__!subrule"("", "q")
    new $P804, "ResizablePMCArray"
    push $P804, $P803
    .return ($P804)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("191_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx807_tgt
    .local int rx807_pos
    .local int rx807_off
    .local int rx807_eos
    .local int rx807_rep
    .local pmc rx807_cur
    (rx807_cur, rx807_pos, rx807_tgt) = self."!cursor_start"()
    rx807_cur."!cursor_debug"("START ", "quote:sym<qq>")
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
.annotate "line", 383
  # rx literal  "qq"
    add $I11, rx807_pos, 2
    gt $I11, rx807_eos, rx807_fail
    sub $I11, rx807_pos, rx807_off
    substr $S10, rx807_tgt, $I11, 2
    ne $S10, "qq", rx807_fail
    add rx807_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx807_pos, rx807_eos, rx807_fail
    sub $I10, rx807_pos, rx807_off
    substr $S10, rx807_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx807_fail
  # rx subrule "ws" subtype=method negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."ws"()
    unless $P10, rx807_fail
    rx807_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."quote_EXPR"(":qq")
    unless $P10, rx807_fail
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx807_pos = $P10."pos"()
  # rx pass
    rx807_cur."!cursor_pass"(rx807_pos, "quote:sym<qq>")
    rx807_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx807_pos)
    .return (rx807_cur)
  rx807_fail:
.annotate "line", 4
    (rx807_rep, rx807_pos, $I10, $P10) = rx807_cur."!mark_fail"(0)
    lt rx807_pos, -1, rx807_done
    eq rx807_pos, -1, rx807_fail
    jump $I10
  rx807_done:
    rx807_cur."!cursor_fail"()
    rx807_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx807_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("192_1259420191.48826") :method
.annotate "line", 4
    $P809 = self."!PREFIX__!subrule"("", "qq")
    new $P810, "ResizablePMCArray"
    push $P810, $P809
    .return ($P810)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("193_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx813_tgt
    .local int rx813_pos
    .local int rx813_off
    .local int rx813_eos
    .local int rx813_rep
    .local pmc rx813_cur
    (rx813_cur, rx813_pos, rx813_tgt) = self."!cursor_start"()
    rx813_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx813_cur
    .local pmc match
    .lex "$/", match
    length rx813_eos, rx813_tgt
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
.annotate "line", 384
  # rx literal  "Q"
    add $I11, rx813_pos, 1
    gt $I11, rx813_eos, rx813_fail
    sub $I11, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I11, 1
    ne $S10, "Q", rx813_fail
    add rx813_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx813_pos, rx813_eos, rx813_fail
    sub $I10, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx813_fail
  # rx subrule "ws" subtype=method negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."ws"()
    unless $P10, rx813_fail
    rx813_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."quote_EXPR"()
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx813_pos = $P10."pos"()
  # rx pass
    rx813_cur."!cursor_pass"(rx813_pos, "quote:sym<Q>")
    rx813_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx813_pos)
    .return (rx813_cur)
  rx813_fail:
.annotate "line", 4
    (rx813_rep, rx813_pos, $I10, $P10) = rx813_cur."!mark_fail"(0)
    lt rx813_pos, -1, rx813_done
    eq rx813_pos, -1, rx813_fail
    jump $I10
  rx813_done:
    rx813_cur."!cursor_fail"()
    rx813_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx813_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("194_1259420191.48826") :method
.annotate "line", 4
    $P815 = self."!PREFIX__!subrule"("", "Q")
    new $P816, "ResizablePMCArray"
    push $P816, $P815
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("195_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx819_tgt
    .local int rx819_pos
    .local int rx819_off
    .local int rx819_eos
    .local int rx819_rep
    .local pmc rx819_cur
    (rx819_cur, rx819_pos, rx819_tgt) = self."!cursor_start"()
    rx819_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
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
.annotate "line", 385
  # rx literal  "Q:PIR"
    add $I11, rx819_pos, 5
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 5
    ne $S10, "Q:PIR", rx819_fail
    add rx819_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."ws"()
    unless $P10, rx819_fail
    rx819_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."quote_EXPR"()
    unless $P10, rx819_fail
    rx819_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx819_pos = $P10."pos"()
  # rx pass
    rx819_cur."!cursor_pass"(rx819_pos, "quote:sym<Q:PIR>")
    rx819_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx819_pos)
    .return (rx819_cur)
  rx819_fail:
.annotate "line", 4
    (rx819_rep, rx819_pos, $I10, $P10) = rx819_cur."!mark_fail"(0)
    lt rx819_pos, -1, rx819_done
    eq rx819_pos, -1, rx819_fail
    jump $I10
  rx819_done:
    rx819_cur."!cursor_fail"()
    rx819_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx819_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("196_1259420191.48826") :method
.annotate "line", 4
    $P821 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P822, "ResizablePMCArray"
    push $P822, $P821
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("197_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
    ne $I10, -1, rxscan828_done
    goto rxscan828_scan
  rxscan828_loop:
    ($P10) = rx825_cur."from"()
    inc $P10
    set rx825_pos, $P10
    ge rx825_pos, rx825_eos, rxscan828_done
  rxscan828_scan:
    set_addr $I10, rxscan828_loop
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  rxscan828_done:
.annotate "line", 387
  # rx enumcharlist negate=0 zerowidth
    ge rx825_pos, rx825_eos, rx825_fail
    sub $I10, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx825_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."quotemod_check"("s")
    unless $P10, rx825_fail
  # rx subrule "variable" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."variable"()
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx825_pos = $P10."pos"()
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "quote_escape:sym<$>")
    rx825_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate "line", 4
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("198_1259420191.48826") :method
.annotate "line", 4
    new $P827, "ResizablePMCArray"
    push $P827, "$"
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("199_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx830_cur
    .local pmc match
    .lex "$/", match
    length rx830_eos, rx830_tgt
    set rx830_off, 0
    lt rx830_pos, 2, rx830_start
    sub rx830_off, rx830_pos, 1
    substr rx830_tgt, rx830_tgt, rx830_off
  rx830_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan833_done
    goto rxscan833_scan
  rxscan833_loop:
    ($P10) = rx830_cur."from"()
    inc $P10
    set rx830_pos, $P10
    ge rx830_pos, rx830_eos, rxscan833_done
  rxscan833_scan:
    set_addr $I10, rxscan833_loop
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  rxscan833_done:
.annotate "line", 388
  # rx enumcharlist negate=0 zerowidth
    ge rx830_pos, rx830_eos, rx830_fail
    sub $I10, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx830_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."quotemod_check"("c")
    unless $P10, rx830_fail
  # rx subrule "block" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."block"()
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx830_pos = $P10."pos"()
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "quote_escape:sym<{ }>")
    rx830_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate "line", 4
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("200_1259420191.48826") :method
.annotate "line", 4
    new $P832, "ResizablePMCArray"
    push $P832, "{"
    .return ($P832)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("201_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx835_tgt
    .local int rx835_pos
    .local int rx835_off
    .local int rx835_eos
    .local int rx835_rep
    .local pmc rx835_cur
    (rx835_cur, rx835_pos, rx835_tgt) = self."!cursor_start"()
    rx835_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx835_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx835_cur
    .local pmc match
    .lex "$/", match
    length rx835_eos, rx835_tgt
    set rx835_off, 0
    lt rx835_pos, 2, rx835_start
    sub rx835_off, rx835_pos, 1
    substr rx835_tgt, rx835_tgt, rx835_off
  rx835_start:
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
.annotate "line", 390
  # rx literal  "("
    add $I11, rx835_pos, 1
    gt $I11, rx835_eos, rx835_fail
    sub $I11, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I11, 1
    ne $S10, "(", rx835_fail
    add rx835_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."ws"()
    unless $P10, rx835_fail
    rx835_pos = $P10."pos"()
  # rx rxquantr840 ** 0..1
    set_addr $I841, rxquantr840_done
    rx835_cur."!mark_push"(0, rx835_pos, $I841)
  rxquantr840_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."EXPR"()
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx835_pos = $P10."pos"()
    (rx835_rep) = rx835_cur."!mark_commit"($I841)
  rxquantr840_done:
  # rx literal  ")"
    add $I11, rx835_pos, 1
    gt $I11, rx835_eos, rx835_fail
    sub $I11, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I11, 1
    ne $S10, ")", rx835_fail
    add rx835_pos, 1
  # rx pass
    rx835_cur."!cursor_pass"(rx835_pos, "circumfix:sym<( )>")
    rx835_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx835_pos)
    .return (rx835_cur)
  rx835_fail:
.annotate "line", 4
    (rx835_rep, rx835_pos, $I10, $P10) = rx835_cur."!mark_fail"(0)
    lt rx835_pos, -1, rx835_done
    eq rx835_pos, -1, rx835_fail
    jump $I10
  rx835_done:
    rx835_cur."!cursor_fail"()
    rx835_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx835_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("202_1259420191.48826") :method
.annotate "line", 4
    $P837 = self."!PREFIX__!subrule"("", "(")
    new $P838, "ResizablePMCArray"
    push $P838, $P837
    .return ($P838)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("203_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    (rx843_cur, rx843_pos, rx843_tgt) = self."!cursor_start"()
    rx843_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx843_cur."!cursor_caparray"("EXPR")
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
.annotate "line", 391
  # rx literal  "["
    add $I11, rx843_pos, 1
    gt $I11, rx843_eos, rx843_fail
    sub $I11, rx843_pos, rx843_off
    substr $S10, rx843_tgt, $I11, 1
    ne $S10, "[", rx843_fail
    add rx843_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."ws"()
    unless $P10, rx843_fail
    rx843_pos = $P10."pos"()
  # rx rxquantr848 ** 0..1
    set_addr $I849, rxquantr848_done
    rx843_cur."!mark_push"(0, rx843_pos, $I849)
  rxquantr848_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."EXPR"()
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx843_pos = $P10."pos"()
    (rx843_rep) = rx843_cur."!mark_commit"($I849)
  rxquantr848_done:
  # rx literal  "]"
    add $I11, rx843_pos, 1
    gt $I11, rx843_eos, rx843_fail
    sub $I11, rx843_pos, rx843_off
    substr $S10, rx843_tgt, $I11, 1
    ne $S10, "]", rx843_fail
    add rx843_pos, 1
  # rx pass
    rx843_cur."!cursor_pass"(rx843_pos, "circumfix:sym<[ ]>")
    rx843_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx843_pos)
    .return (rx843_cur)
  rx843_fail:
.annotate "line", 4
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    rx843_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("204_1259420191.48826") :method
.annotate "line", 4
    $P845 = self."!PREFIX__!subrule"("", "[")
    new $P846, "ResizablePMCArray"
    push $P846, $P845
    .return ($P846)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("205_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt) = self."!cursor_start"()
    rx851_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
.annotate "line", 392
  # rx enumcharlist negate=0 zerowidth
    ge rx851_pos, rx851_eos, rx851_fail
    sub $I10, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx851_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx851_pos = $P10."pos"()
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "circumfix:sym<ang>")
    rx851_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_fail:
.annotate "line", 4
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("206_1259420191.48826") :method
.annotate "line", 4
    new $P853, "ResizablePMCArray"
    push $P853, "<"
    .return ($P853)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("207_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx856_tgt
    .local int rx856_pos
    .local int rx856_off
    .local int rx856_eos
    .local int rx856_rep
    .local pmc rx856_cur
    (rx856_cur, rx856_pos, rx856_tgt) = self."!cursor_start"()
    rx856_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx856_cur
    .local pmc match
    .lex "$/", match
    length rx856_eos, rx856_tgt
    set rx856_off, 0
    lt rx856_pos, 2, rx856_start
    sub rx856_off, rx856_pos, 1
    substr rx856_tgt, rx856_tgt, rx856_off
  rx856_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan859_done
    goto rxscan859_scan
  rxscan859_loop:
    ($P10) = rx856_cur."from"()
    inc $P10
    set rx856_pos, $P10
    ge rx856_pos, rx856_eos, rxscan859_done
  rxscan859_scan:
    set_addr $I10, rxscan859_loop
    rx856_cur."!mark_push"(0, rx856_pos, $I10)
  rxscan859_done:
.annotate "line", 393
  # rx enumcharlist negate=0 zerowidth
    ge rx856_pos, rx856_eos, rx856_fail
    sub $I10, rx856_pos, rx856_off
    substr $S10, rx856_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx856_fail
  # rx subrule "pblock" subtype=capture negate=
    rx856_cur."!cursor_pos"(rx856_pos)
    $P10 = rx856_cur."pblock"()
    unless $P10, rx856_fail
    rx856_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx856_pos = $P10."pos"()
  # rx pass
    rx856_cur."!cursor_pass"(rx856_pos, "circumfix:sym<{ }>")
    rx856_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx856_pos)
    .return (rx856_cur)
  rx856_fail:
.annotate "line", 4
    (rx856_rep, rx856_pos, $I10, $P10) = rx856_cur."!mark_fail"(0)
    lt rx856_pos, -1, rx856_done
    eq rx856_pos, -1, rx856_fail
    jump $I10
  rx856_done:
    rx856_cur."!cursor_fail"()
    rx856_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx856_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("208_1259420191.48826") :method
.annotate "line", 4
    new $P858, "ResizablePMCArray"
    push $P858, "{"
    .return ($P858)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("209_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx861_tgt
    .local int rx861_pos
    .local int rx861_off
    .local int rx861_eos
    .local int rx861_rep
    .local pmc rx861_cur
    (rx861_cur, rx861_pos, rx861_tgt) = self."!cursor_start"()
    rx861_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx861_cur
    .local pmc match
    .lex "$/", match
    length rx861_eos, rx861_tgt
    set rx861_off, 0
    lt rx861_pos, 2, rx861_start
    sub rx861_off, rx861_pos, 1
    substr rx861_tgt, rx861_tgt, rx861_off
  rx861_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan865_done
    goto rxscan865_scan
  rxscan865_loop:
    ($P10) = rx861_cur."from"()
    inc $P10
    set rx861_pos, $P10
    ge rx861_pos, rx861_eos, rxscan865_done
  rxscan865_scan:
    set_addr $I10, rxscan865_loop
    rx861_cur."!mark_push"(0, rx861_pos, $I10)
  rxscan865_done:
.annotate "line", 394
  # rx subrule "sigil" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."sigil"()
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx861_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx861_pos, 1
    gt $I11, rx861_eos, rx861_fail
    sub $I11, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I11, 1
    ne $S10, "(", rx861_fail
    add rx861_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."semilist"()
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx861_pos = $P10."pos"()
  alt866_0:
    set_addr $I10, alt866_1
    rx861_cur."!mark_push"(0, rx861_pos, $I10)
  # rx literal  ")"
    add $I11, rx861_pos, 1
    gt $I11, rx861_eos, rx861_fail
    sub $I11, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I11, 1
    ne $S10, ")", rx861_fail
    add rx861_pos, 1
    goto alt866_end
  alt866_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."FAILGOAL"("')'")
    unless $P10, rx861_fail
    rx861_pos = $P10."pos"()
  alt866_end:
  # rx pass
    rx861_cur."!cursor_pass"(rx861_pos, "circumfix:sym<sigil>")
    rx861_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx861_pos)
    .return (rx861_cur)
  rx861_fail:
.annotate "line", 4
    (rx861_rep, rx861_pos, $I10, $P10) = rx861_cur."!mark_fail"(0)
    lt rx861_pos, -1, rx861_done
    eq rx861_pos, -1, rx861_fail
    jump $I10
  rx861_done:
    rx861_cur."!cursor_fail"()
    rx861_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx861_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("210_1259420191.48826") :method
.annotate "line", 4
    $P863 = self."!PREFIX__!subrule"("sigil", "")
    new $P864, "ResizablePMCArray"
    push $P864, $P863
    .return ($P864)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("211_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 4
    .local string rx869_tgt
    .local int rx869_pos
    .local int rx869_off
    .local int rx869_eos
    .local int rx869_rep
    .local pmc rx869_cur
    (rx869_cur, rx869_pos, rx869_tgt) = self."!cursor_start"()
    rx869_cur."!cursor_debug"("START ", "semilist")
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
    ne $I10, -1, rxscan872_done
    goto rxscan872_scan
  rxscan872_loop:
    ($P10) = rx869_cur."from"()
    inc $P10
    set rx869_pos, $P10
    ge rx869_pos, rx869_eos, rxscan872_done
  rxscan872_scan:
    set_addr $I10, rxscan872_loop
    rx869_cur."!mark_push"(0, rx869_pos, $I10)
  rxscan872_done:
.annotate "line", 396
  # rx subrule "ws" subtype=method negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."ws"()
    unless $P10, rx869_fail
    rx869_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."statement"()
    unless $P10, rx869_fail
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx869_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."ws"()
    unless $P10, rx869_fail
    rx869_pos = $P10."pos"()
  # rx pass
    rx869_cur."!cursor_pass"(rx869_pos, "semilist")
    rx869_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx869_pos)
    .return (rx869_cur)
  rx869_fail:
.annotate "line", 4
    (rx869_rep, rx869_pos, $I10, $P10) = rx869_cur."!mark_fail"(0)
    lt rx869_pos, -1, rx869_done
    eq rx869_pos, -1, rx869_fail
    jump $I10
  rx869_done:
    rx869_cur."!cursor_fail"()
    rx869_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx869_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("212_1259420191.48826") :method
.annotate "line", 4
    new $P871, "ResizablePMCArray"
    push $P871, ""
    .return ($P871)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("213_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx876_tgt
    .local int rx876_pos
    .local int rx876_off
    .local int rx876_eos
    .local int rx876_rep
    .local pmc rx876_cur
    (rx876_cur, rx876_pos, rx876_tgt) = self."!cursor_start"()
    rx876_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx876_cur
    .local pmc match
    .lex "$/", match
    length rx876_eos, rx876_tgt
    set rx876_off, 0
    lt rx876_pos, 2, rx876_start
    sub rx876_off, rx876_pos, 1
    substr rx876_tgt, rx876_tgt, rx876_off
  rx876_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan879_done
    goto rxscan879_scan
  rxscan879_loop:
    ($P10) = rx876_cur."from"()
    inc $P10
    set rx876_pos, $P10
    ge rx876_pos, rx876_eos, rxscan879_done
  rxscan879_scan:
    set_addr $I10, rxscan879_loop
    rx876_cur."!mark_push"(0, rx876_pos, $I10)
  rxscan879_done:
.annotate "line", 419
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."infixstopper"()
    if $P10, rx876_fail
  # rx subrule "infix" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."infix"()
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx876_pos = $P10."pos"()
  # rx pass
    rx876_cur."!cursor_pass"(rx876_pos, "infixish")
    rx876_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx876_pos)
    .return (rx876_cur)
  rx876_fail:
.annotate "line", 400
    (rx876_rep, rx876_pos, $I10, $P10) = rx876_cur."!mark_fail"(0)
    lt rx876_pos, -1, rx876_done
    eq rx876_pos, -1, rx876_fail
    jump $I10
  rx876_done:
    rx876_cur."!cursor_fail"()
    rx876_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx876_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("214_1259420191.48826") :method
.annotate "line", 400
    new $P878, "ResizablePMCArray"
    push $P878, ""
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("215_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx881_tgt
    .local int rx881_pos
    .local int rx881_off
    .local int rx881_eos
    .local int rx881_rep
    .local pmc rx881_cur
    (rx881_cur, rx881_pos, rx881_tgt) = self."!cursor_start"()
    rx881_cur."!cursor_debug"("START ", "infixstopper")
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
.annotate "line", 420
  # rx subrule "lambda" subtype=zerowidth negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."lambda"()
    unless $P10, rx881_fail
  # rx pass
    rx881_cur."!cursor_pass"(rx881_pos, "infixstopper")
    rx881_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx881_pos)
    .return (rx881_cur)
  rx881_fail:
.annotate "line", 400
    (rx881_rep, rx881_pos, $I10, $P10) = rx881_cur."!mark_fail"(0)
    lt rx881_pos, -1, rx881_done
    eq rx881_pos, -1, rx881_fail
    jump $I10
  rx881_done:
    rx881_cur."!cursor_fail"()
    rx881_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx881_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("216_1259420191.48826") :method
.annotate "line", 400
    new $P883, "ResizablePMCArray"
    push $P883, ""
    .return ($P883)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("217_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx886_tgt
    .local int rx886_pos
    .local int rx886_off
    .local int rx886_eos
    .local int rx886_rep
    .local pmc rx886_cur
    (rx886_cur, rx886_pos, rx886_tgt) = self."!cursor_start"()
    rx886_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
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
    ne $I10, -1, rxscan890_done
    goto rxscan890_scan
  rxscan890_loop:
    ($P10) = rx886_cur."from"()
    inc $P10
    set rx886_pos, $P10
    ge rx886_pos, rx886_eos, rxscan890_done
  rxscan890_scan:
    set_addr $I10, rxscan890_loop
    rx886_cur."!mark_push"(0, rx886_pos, $I10)
  rxscan890_done:
.annotate "line", 423
  # rx literal  "["
    add $I11, rx886_pos, 1
    gt $I11, rx886_eos, rx886_fail
    sub $I11, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I11, 1
    ne $S10, "[", rx886_fail
    add rx886_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."ws"()
    unless $P10, rx886_fail
    rx886_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."EXPR"()
    unless $P10, rx886_fail
    rx886_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx886_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx886_pos, 1
    gt $I11, rx886_eos, rx886_fail
    sub $I11, rx886_pos, rx886_off
    substr $S10, rx886_tgt, $I11, 1
    ne $S10, "]", rx886_fail
    add rx886_pos, 1
.annotate "line", 424
  # rx subrule "O" subtype=capture negate=
    rx886_cur."!cursor_pos"(rx886_pos)
    $P10 = rx886_cur."O"("%methodop")
    unless $P10, rx886_fail
    rx886_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx886_pos = $P10."pos"()
.annotate "line", 422
  # rx pass
    rx886_cur."!cursor_pass"(rx886_pos, "postcircumfix:sym<[ ]>")
    rx886_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx886_pos)
    .return (rx886_cur)
  rx886_fail:
.annotate "line", 400
    (rx886_rep, rx886_pos, $I10, $P10) = rx886_cur."!mark_fail"(0)
    lt rx886_pos, -1, rx886_done
    eq rx886_pos, -1, rx886_fail
    jump $I10
  rx886_done:
    rx886_cur."!cursor_fail"()
    rx886_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx886_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("218_1259420191.48826") :method
.annotate "line", 400
    $P888 = self."!PREFIX__!subrule"("", "[")
    new $P889, "ResizablePMCArray"
    push $P889, $P888
    .return ($P889)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("219_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx892_tgt
    .local int rx892_pos
    .local int rx892_off
    .local int rx892_eos
    .local int rx892_rep
    .local pmc rx892_cur
    (rx892_cur, rx892_pos, rx892_tgt) = self."!cursor_start"()
    rx892_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx892_cur
    .local pmc match
    .lex "$/", match
    length rx892_eos, rx892_tgt
    set rx892_off, 0
    lt rx892_pos, 2, rx892_start
    sub rx892_off, rx892_pos, 1
    substr rx892_tgt, rx892_tgt, rx892_off
  rx892_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan896_done
    goto rxscan896_scan
  rxscan896_loop:
    ($P10) = rx892_cur."from"()
    inc $P10
    set rx892_pos, $P10
    ge rx892_pos, rx892_eos, rxscan896_done
  rxscan896_scan:
    set_addr $I10, rxscan896_loop
    rx892_cur."!mark_push"(0, rx892_pos, $I10)
  rxscan896_done:
.annotate "line", 428
  # rx literal  "{"
    add $I11, rx892_pos, 1
    gt $I11, rx892_eos, rx892_fail
    sub $I11, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I11, 1
    ne $S10, "{", rx892_fail
    add rx892_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."ws"()
    unless $P10, rx892_fail
    rx892_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."EXPR"()
    unless $P10, rx892_fail
    rx892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx892_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx892_pos, 1
    gt $I11, rx892_eos, rx892_fail
    sub $I11, rx892_pos, rx892_off
    substr $S10, rx892_tgt, $I11, 1
    ne $S10, "}", rx892_fail
    add rx892_pos, 1
.annotate "line", 429
  # rx subrule "O" subtype=capture negate=
    rx892_cur."!cursor_pos"(rx892_pos)
    $P10 = rx892_cur."O"("%methodop")
    unless $P10, rx892_fail
    rx892_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx892_pos = $P10."pos"()
.annotate "line", 427
  # rx pass
    rx892_cur."!cursor_pass"(rx892_pos, "postcircumfix:sym<{ }>")
    rx892_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx892_pos)
    .return (rx892_cur)
  rx892_fail:
.annotate "line", 400
    (rx892_rep, rx892_pos, $I10, $P10) = rx892_cur."!mark_fail"(0)
    lt rx892_pos, -1, rx892_done
    eq rx892_pos, -1, rx892_fail
    jump $I10
  rx892_done:
    rx892_cur."!cursor_fail"()
    rx892_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx892_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("220_1259420191.48826") :method
.annotate "line", 400
    $P894 = self."!PREFIX__!subrule"("", "{")
    new $P895, "ResizablePMCArray"
    push $P895, $P894
    .return ($P895)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("221_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx898_tgt
    .local int rx898_pos
    .local int rx898_off
    .local int rx898_eos
    .local int rx898_rep
    .local pmc rx898_cur
    (rx898_cur, rx898_pos, rx898_tgt) = self."!cursor_start"()
    rx898_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
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
.annotate "line", 433
  # rx enumcharlist negate=0 zerowidth
    ge rx898_pos, rx898_eos, rx898_fail
    sub $I10, rx898_pos, rx898_off
    substr $S10, rx898_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx898_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."quote_EXPR"(":q")
    unless $P10, rx898_fail
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx898_pos = $P10."pos"()
.annotate "line", 434
  # rx subrule "O" subtype=capture negate=
    rx898_cur."!cursor_pos"(rx898_pos)
    $P10 = rx898_cur."O"("%methodop")
    unless $P10, rx898_fail
    rx898_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx898_pos = $P10."pos"()
.annotate "line", 432
  # rx pass
    rx898_cur."!cursor_pass"(rx898_pos, "postcircumfix:sym<ang>")
    rx898_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx898_pos)
    .return (rx898_cur)
  rx898_fail:
.annotate "line", 400
    (rx898_rep, rx898_pos, $I10, $P10) = rx898_cur."!mark_fail"(0)
    lt rx898_pos, -1, rx898_done
    eq rx898_pos, -1, rx898_fail
    jump $I10
  rx898_done:
    rx898_cur."!cursor_fail"()
    rx898_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx898_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("222_1259420191.48826") :method
.annotate "line", 400
    new $P900, "ResizablePMCArray"
    push $P900, "<"
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("223_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    (rx903_cur, rx903_pos, rx903_tgt) = self."!cursor_start"()
    rx903_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx903_cur
    .local pmc match
    .lex "$/", match
    length rx903_eos, rx903_tgt
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
.annotate "line", 438
  # rx literal  "("
    add $I11, rx903_pos, 1
    gt $I11, rx903_eos, rx903_fail
    sub $I11, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I11, 1
    ne $S10, "(", rx903_fail
    add rx903_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."ws"()
    unless $P10, rx903_fail
    rx903_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."arglist"()
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx903_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx903_pos, 1
    gt $I11, rx903_eos, rx903_fail
    sub $I11, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I11, 1
    ne $S10, ")", rx903_fail
    add rx903_pos, 1
.annotate "line", 439
  # rx subrule "O" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."O"("%methodop")
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx903_pos = $P10."pos"()
.annotate "line", 437
  # rx pass
    rx903_cur."!cursor_pass"(rx903_pos, "postcircumfix:sym<( )>")
    rx903_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx903_pos)
    .return (rx903_cur)
  rx903_fail:
.annotate "line", 400
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    rx903_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("224_1259420191.48826") :method
.annotate "line", 400
    $P905 = self."!PREFIX__!subrule"("", "(")
    new $P906, "ResizablePMCArray"
    push $P906, $P905
    .return ($P906)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("225_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx909_tgt
    .local int rx909_pos
    .local int rx909_off
    .local int rx909_eos
    .local int rx909_rep
    .local pmc rx909_cur
    (rx909_cur, rx909_pos, rx909_tgt) = self."!cursor_start"()
    rx909_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx909_cur
    .local pmc match
    .lex "$/", match
    length rx909_eos, rx909_tgt
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
.annotate "line", 442
  # rx subrule "dotty" subtype=capture negate=
    rx909_cur."!cursor_pos"(rx909_pos)
    $P10 = rx909_cur."dotty"()
    unless $P10, rx909_fail
    rx909_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx909_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx909_cur."!cursor_pos"(rx909_pos)
    $P10 = rx909_cur."O"("%methodop")
    unless $P10, rx909_fail
    rx909_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx909_pos = $P10."pos"()
  # rx pass
    rx909_cur."!cursor_pass"(rx909_pos, "postfix:sym<.>")
    rx909_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx909_pos)
    .return (rx909_cur)
  rx909_fail:
.annotate "line", 400
    (rx909_rep, rx909_pos, $I10, $P10) = rx909_cur."!mark_fail"(0)
    lt rx909_pos, -1, rx909_done
    eq rx909_pos, -1, rx909_fail
    jump $I10
  rx909_done:
    rx909_cur."!cursor_fail"()
    rx909_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx909_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("226_1259420191.48826") :method
.annotate "line", 400
    $P911 = self."!PREFIX__!subrule"("dotty", "")
    new $P912, "ResizablePMCArray"
    push $P912, $P911
    .return ($P912)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("227_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx915_tgt
    .local int rx915_pos
    .local int rx915_off
    .local int rx915_eos
    .local int rx915_rep
    .local pmc rx915_cur
    (rx915_cur, rx915_pos, rx915_tgt) = self."!cursor_start"()
    rx915_cur."!cursor_debug"("START ", "prefix:sym<++>")
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
.annotate "line", 444
  # rx subcapture "sym"
    set_addr $I10, rxcap_920_fail
    rx915_cur."!mark_push"(0, rx915_pos, $I10)
  # rx literal  "++"
    add $I11, rx915_pos, 2
    gt $I11, rx915_eos, rx915_fail
    sub $I11, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I11, 2
    ne $S10, "++", rx915_fail
    add rx915_pos, 2
    set_addr $I10, rxcap_920_fail
    ($I12, $I11) = rx915_cur."!mark_peek"($I10)
    rx915_cur."!cursor_pos"($I11)
    ($P10) = rx915_cur."!cursor_start"()
    $P10."!cursor_pass"(rx915_pos, "")
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_920_done
  rxcap_920_fail:
    goto rx915_fail
  rxcap_920_done:
  # rx subrule "O" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx915_pos = $P10."pos"()
  # rx pass
    rx915_cur."!cursor_pass"(rx915_pos, "prefix:sym<++>")
    rx915_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx915_pos)
    .return (rx915_cur)
  rx915_fail:
.annotate "line", 400
    (rx915_rep, rx915_pos, $I10, $P10) = rx915_cur."!mark_fail"(0)
    lt rx915_pos, -1, rx915_done
    eq rx915_pos, -1, rx915_fail
    jump $I10
  rx915_done:
    rx915_cur."!cursor_fail"()
    rx915_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx915_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("228_1259420191.48826") :method
.annotate "line", 400
    $P917 = self."!PREFIX__!subrule"("O", "++")
    new $P918, "ResizablePMCArray"
    push $P918, $P917
    .return ($P918)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("229_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx922_tgt
    .local int rx922_pos
    .local int rx922_off
    .local int rx922_eos
    .local int rx922_rep
    .local pmc rx922_cur
    (rx922_cur, rx922_pos, rx922_tgt) = self."!cursor_start"()
    rx922_cur."!cursor_debug"("START ", "prefix:sym<-->")
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
    ne $I10, -1, rxscan926_done
    goto rxscan926_scan
  rxscan926_loop:
    ($P10) = rx922_cur."from"()
    inc $P10
    set rx922_pos, $P10
    ge rx922_pos, rx922_eos, rxscan926_done
  rxscan926_scan:
    set_addr $I10, rxscan926_loop
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  rxscan926_done:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_927_fail
    rx922_cur."!mark_push"(0, rx922_pos, $I10)
  # rx literal  "--"
    add $I11, rx922_pos, 2
    gt $I11, rx922_eos, rx922_fail
    sub $I11, rx922_pos, rx922_off
    substr $S10, rx922_tgt, $I11, 2
    ne $S10, "--", rx922_fail
    add rx922_pos, 2
    set_addr $I10, rxcap_927_fail
    ($I12, $I11) = rx922_cur."!mark_peek"($I10)
    rx922_cur."!cursor_pos"($I11)
    ($P10) = rx922_cur."!cursor_start"()
    $P10."!cursor_pass"(rx922_pos, "")
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_927_done
  rxcap_927_fail:
    goto rx922_fail
  rxcap_927_done:
  # rx subrule "O" subtype=capture negate=
    rx922_cur."!cursor_pos"(rx922_pos)
    $P10 = rx922_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx922_fail
    rx922_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx922_pos = $P10."pos"()
  # rx pass
    rx922_cur."!cursor_pass"(rx922_pos, "prefix:sym<-->")
    rx922_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx922_pos)
    .return (rx922_cur)
  rx922_fail:
.annotate "line", 400
    (rx922_rep, rx922_pos, $I10, $P10) = rx922_cur."!mark_fail"(0)
    lt rx922_pos, -1, rx922_done
    eq rx922_pos, -1, rx922_fail
    jump $I10
  rx922_done:
    rx922_cur."!cursor_fail"()
    rx922_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx922_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("230_1259420191.48826") :method
.annotate "line", 400
    $P924 = self."!PREFIX__!subrule"("O", "--")
    new $P925, "ResizablePMCArray"
    push $P925, $P924
    .return ($P925)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("231_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx929_tgt
    .local int rx929_pos
    .local int rx929_off
    .local int rx929_eos
    .local int rx929_rep
    .local pmc rx929_cur
    (rx929_cur, rx929_pos, rx929_tgt) = self."!cursor_start"()
    rx929_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx929_cur
    .local pmc match
    .lex "$/", match
    length rx929_eos, rx929_tgt
    set rx929_off, 0
    lt rx929_pos, 2, rx929_start
    sub rx929_off, rx929_pos, 1
    substr rx929_tgt, rx929_tgt, rx929_off
  rx929_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan933_done
    goto rxscan933_scan
  rxscan933_loop:
    ($P10) = rx929_cur."from"()
    inc $P10
    set rx929_pos, $P10
    ge rx929_pos, rx929_eos, rxscan933_done
  rxscan933_scan:
    set_addr $I10, rxscan933_loop
    rx929_cur."!mark_push"(0, rx929_pos, $I10)
  rxscan933_done:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_934_fail
    rx929_cur."!mark_push"(0, rx929_pos, $I10)
  # rx literal  "++"
    add $I11, rx929_pos, 2
    gt $I11, rx929_eos, rx929_fail
    sub $I11, rx929_pos, rx929_off
    substr $S10, rx929_tgt, $I11, 2
    ne $S10, "++", rx929_fail
    add rx929_pos, 2
    set_addr $I10, rxcap_934_fail
    ($I12, $I11) = rx929_cur."!mark_peek"($I10)
    rx929_cur."!cursor_pos"($I11)
    ($P10) = rx929_cur."!cursor_start"()
    $P10."!cursor_pass"(rx929_pos, "")
    rx929_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_934_done
  rxcap_934_fail:
    goto rx929_fail
  rxcap_934_done:
  # rx subrule "O" subtype=capture negate=
    rx929_cur."!cursor_pos"(rx929_pos)
    $P10 = rx929_cur."O"("%autoincrement")
    unless $P10, rx929_fail
    rx929_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx929_pos = $P10."pos"()
  # rx pass
    rx929_cur."!cursor_pass"(rx929_pos, "postfix:sym<++>")
    rx929_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx929_pos)
    .return (rx929_cur)
  rx929_fail:
.annotate "line", 400
    (rx929_rep, rx929_pos, $I10, $P10) = rx929_cur."!mark_fail"(0)
    lt rx929_pos, -1, rx929_done
    eq rx929_pos, -1, rx929_fail
    jump $I10
  rx929_done:
    rx929_cur."!cursor_fail"()
    rx929_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx929_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("232_1259420191.48826") :method
.annotate "line", 400
    $P931 = self."!PREFIX__!subrule"("O", "++")
    new $P932, "ResizablePMCArray"
    push $P932, $P931
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("233_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx936_tgt
    .local int rx936_pos
    .local int rx936_off
    .local int rx936_eos
    .local int rx936_rep
    .local pmc rx936_cur
    (rx936_cur, rx936_pos, rx936_tgt) = self."!cursor_start"()
    rx936_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx936_cur
    .local pmc match
    .lex "$/", match
    length rx936_eos, rx936_tgt
    set rx936_off, 0
    lt rx936_pos, 2, rx936_start
    sub rx936_off, rx936_pos, 1
    substr rx936_tgt, rx936_tgt, rx936_off
  rx936_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan940_done
    goto rxscan940_scan
  rxscan940_loop:
    ($P10) = rx936_cur."from"()
    inc $P10
    set rx936_pos, $P10
    ge rx936_pos, rx936_eos, rxscan940_done
  rxscan940_scan:
    set_addr $I10, rxscan940_loop
    rx936_cur."!mark_push"(0, rx936_pos, $I10)
  rxscan940_done:
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_941_fail
    rx936_cur."!mark_push"(0, rx936_pos, $I10)
  # rx literal  "--"
    add $I11, rx936_pos, 2
    gt $I11, rx936_eos, rx936_fail
    sub $I11, rx936_pos, rx936_off
    substr $S10, rx936_tgt, $I11, 2
    ne $S10, "--", rx936_fail
    add rx936_pos, 2
    set_addr $I10, rxcap_941_fail
    ($I12, $I11) = rx936_cur."!mark_peek"($I10)
    rx936_cur."!cursor_pos"($I11)
    ($P10) = rx936_cur."!cursor_start"()
    $P10."!cursor_pass"(rx936_pos, "")
    rx936_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_941_done
  rxcap_941_fail:
    goto rx936_fail
  rxcap_941_done:
  # rx subrule "O" subtype=capture negate=
    rx936_cur."!cursor_pos"(rx936_pos)
    $P10 = rx936_cur."O"("%autoincrement")
    unless $P10, rx936_fail
    rx936_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx936_pos = $P10."pos"()
  # rx pass
    rx936_cur."!cursor_pass"(rx936_pos, "postfix:sym<-->")
    rx936_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx936_pos)
    .return (rx936_cur)
  rx936_fail:
.annotate "line", 400
    (rx936_rep, rx936_pos, $I10, $P10) = rx936_cur."!mark_fail"(0)
    lt rx936_pos, -1, rx936_done
    eq rx936_pos, -1, rx936_fail
    jump $I10
  rx936_done:
    rx936_cur."!cursor_fail"()
    rx936_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx936_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("234_1259420191.48826") :method
.annotate "line", 400
    $P938 = self."!PREFIX__!subrule"("O", "--")
    new $P939, "ResizablePMCArray"
    push $P939, $P938
    .return ($P939)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("235_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx943_tgt
    .local int rx943_pos
    .local int rx943_off
    .local int rx943_eos
    .local int rx943_rep
    .local pmc rx943_cur
    (rx943_cur, rx943_pos, rx943_tgt) = self."!cursor_start"()
    rx943_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx943_cur
    .local pmc match
    .lex "$/", match
    length rx943_eos, rx943_tgt
    set rx943_off, 0
    lt rx943_pos, 2, rx943_start
    sub rx943_off, rx943_pos, 1
    substr rx943_tgt, rx943_tgt, rx943_off
  rx943_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan947_done
    goto rxscan947_scan
  rxscan947_loop:
    ($P10) = rx943_cur."from"()
    inc $P10
    set rx943_pos, $P10
    ge rx943_pos, rx943_eos, rxscan947_done
  rxscan947_scan:
    set_addr $I10, rxscan947_loop
    rx943_cur."!mark_push"(0, rx943_pos, $I10)
  rxscan947_done:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_948_fail
    rx943_cur."!mark_push"(0, rx943_pos, $I10)
  # rx literal  "**"
    add $I11, rx943_pos, 2
    gt $I11, rx943_eos, rx943_fail
    sub $I11, rx943_pos, rx943_off
    substr $S10, rx943_tgt, $I11, 2
    ne $S10, "**", rx943_fail
    add rx943_pos, 2
    set_addr $I10, rxcap_948_fail
    ($I12, $I11) = rx943_cur."!mark_peek"($I10)
    rx943_cur."!cursor_pos"($I11)
    ($P10) = rx943_cur."!cursor_start"()
    $P10."!cursor_pass"(rx943_pos, "")
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_948_done
  rxcap_948_fail:
    goto rx943_fail
  rxcap_948_done:
  # rx subrule "O" subtype=capture negate=
    rx943_cur."!cursor_pos"(rx943_pos)
    $P10 = rx943_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx943_fail
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx943_pos = $P10."pos"()
  # rx pass
    rx943_cur."!cursor_pass"(rx943_pos, "infix:sym<**>")
    rx943_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx943_pos)
    .return (rx943_cur)
  rx943_fail:
.annotate "line", 400
    (rx943_rep, rx943_pos, $I10, $P10) = rx943_cur."!mark_fail"(0)
    lt rx943_pos, -1, rx943_done
    eq rx943_pos, -1, rx943_fail
    jump $I10
  rx943_done:
    rx943_cur."!cursor_fail"()
    rx943_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx943_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("236_1259420191.48826") :method
.annotate "line", 400
    $P945 = self."!PREFIX__!subrule"("O", "**")
    new $P946, "ResizablePMCArray"
    push $P946, $P945
    .return ($P946)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("237_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx950_tgt
    .local int rx950_pos
    .local int rx950_off
    .local int rx950_eos
    .local int rx950_rep
    .local pmc rx950_cur
    (rx950_cur, rx950_pos, rx950_tgt) = self."!cursor_start"()
    rx950_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx950_cur
    .local pmc match
    .lex "$/", match
    length rx950_eos, rx950_tgt
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
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_955_fail
    rx950_cur."!mark_push"(0, rx950_pos, $I10)
  # rx literal  "+"
    add $I11, rx950_pos, 1
    gt $I11, rx950_eos, rx950_fail
    sub $I11, rx950_pos, rx950_off
    substr $S10, rx950_tgt, $I11, 1
    ne $S10, "+", rx950_fail
    add rx950_pos, 1
    set_addr $I10, rxcap_955_fail
    ($I12, $I11) = rx950_cur."!mark_peek"($I10)
    rx950_cur."!cursor_pos"($I11)
    ($P10) = rx950_cur."!cursor_start"()
    $P10."!cursor_pass"(rx950_pos, "")
    rx950_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_955_done
  rxcap_955_fail:
    goto rx950_fail
  rxcap_955_done:
  # rx subrule "O" subtype=capture negate=
    rx950_cur."!cursor_pos"(rx950_pos)
    $P10 = rx950_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx950_fail
    rx950_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx950_pos = $P10."pos"()
  # rx pass
    rx950_cur."!cursor_pass"(rx950_pos, "prefix:sym<+>")
    rx950_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx950_pos)
    .return (rx950_cur)
  rx950_fail:
.annotate "line", 400
    (rx950_rep, rx950_pos, $I10, $P10) = rx950_cur."!mark_fail"(0)
    lt rx950_pos, -1, rx950_done
    eq rx950_pos, -1, rx950_fail
    jump $I10
  rx950_done:
    rx950_cur."!cursor_fail"()
    rx950_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx950_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("238_1259420191.48826") :method
.annotate "line", 400
    $P952 = self."!PREFIX__!subrule"("O", "+")
    new $P953, "ResizablePMCArray"
    push $P953, $P952
    .return ($P953)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("239_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx957_tgt
    .local int rx957_pos
    .local int rx957_off
    .local int rx957_eos
    .local int rx957_rep
    .local pmc rx957_cur
    (rx957_cur, rx957_pos, rx957_tgt) = self."!cursor_start"()
    rx957_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx957_cur
    .local pmc match
    .lex "$/", match
    length rx957_eos, rx957_tgt
    set rx957_off, 0
    lt rx957_pos, 2, rx957_start
    sub rx957_off, rx957_pos, 1
    substr rx957_tgt, rx957_tgt, rx957_off
  rx957_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan961_done
    goto rxscan961_scan
  rxscan961_loop:
    ($P10) = rx957_cur."from"()
    inc $P10
    set rx957_pos, $P10
    ge rx957_pos, rx957_eos, rxscan961_done
  rxscan961_scan:
    set_addr $I10, rxscan961_loop
    rx957_cur."!mark_push"(0, rx957_pos, $I10)
  rxscan961_done:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_962_fail
    rx957_cur."!mark_push"(0, rx957_pos, $I10)
  # rx literal  "~"
    add $I11, rx957_pos, 1
    gt $I11, rx957_eos, rx957_fail
    sub $I11, rx957_pos, rx957_off
    substr $S10, rx957_tgt, $I11, 1
    ne $S10, "~", rx957_fail
    add rx957_pos, 1
    set_addr $I10, rxcap_962_fail
    ($I12, $I11) = rx957_cur."!mark_peek"($I10)
    rx957_cur."!cursor_pos"($I11)
    ($P10) = rx957_cur."!cursor_start"()
    $P10."!cursor_pass"(rx957_pos, "")
    rx957_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_962_done
  rxcap_962_fail:
    goto rx957_fail
  rxcap_962_done:
  # rx subrule "O" subtype=capture negate=
    rx957_cur."!cursor_pos"(rx957_pos)
    $P10 = rx957_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx957_fail
    rx957_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx957_pos = $P10."pos"()
  # rx pass
    rx957_cur."!cursor_pass"(rx957_pos, "prefix:sym<~>")
    rx957_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx957_pos)
    .return (rx957_cur)
  rx957_fail:
.annotate "line", 400
    (rx957_rep, rx957_pos, $I10, $P10) = rx957_cur."!mark_fail"(0)
    lt rx957_pos, -1, rx957_done
    eq rx957_pos, -1, rx957_fail
    jump $I10
  rx957_done:
    rx957_cur."!cursor_fail"()
    rx957_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx957_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("240_1259420191.48826") :method
.annotate "line", 400
    $P959 = self."!PREFIX__!subrule"("O", "~")
    new $P960, "ResizablePMCArray"
    push $P960, $P959
    .return ($P960)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("241_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx964_tgt
    .local int rx964_pos
    .local int rx964_off
    .local int rx964_eos
    .local int rx964_rep
    .local pmc rx964_cur
    (rx964_cur, rx964_pos, rx964_tgt) = self."!cursor_start"()
    rx964_cur."!cursor_debug"("START ", "prefix:sym<->")
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
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_968_fail
    rx964_cur."!mark_push"(0, rx964_pos, $I10)
  # rx literal  "-"
    add $I11, rx964_pos, 1
    gt $I11, rx964_eos, rx964_fail
    sub $I11, rx964_pos, rx964_off
    substr $S10, rx964_tgt, $I11, 1
    ne $S10, "-", rx964_fail
    add rx964_pos, 1
    set_addr $I10, rxcap_968_fail
    ($I12, $I11) = rx964_cur."!mark_peek"($I10)
    rx964_cur."!cursor_pos"($I11)
    ($P10) = rx964_cur."!cursor_start"()
    $P10."!cursor_pass"(rx964_pos, "")
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_968_done
  rxcap_968_fail:
    goto rx964_fail
  rxcap_968_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx964_pos, rx964_eos, rx964_fail
    sub $I10, rx964_pos, rx964_off
    substr $S10, rx964_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx964_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."number"()
    if $P10, rx964_fail
  # rx subrule "O" subtype=capture negate=
    rx964_cur."!cursor_pos"(rx964_pos)
    $P10 = rx964_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx964_fail
    rx964_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx964_pos = $P10."pos"()
  # rx pass
    rx964_cur."!cursor_pass"(rx964_pos, "prefix:sym<->")
    rx964_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx964_pos)
    .return (rx964_cur)
  rx964_fail:
.annotate "line", 400
    (rx964_rep, rx964_pos, $I10, $P10) = rx964_cur."!mark_fail"(0)
    lt rx964_pos, -1, rx964_done
    eq rx964_pos, -1, rx964_fail
    jump $I10
  rx964_done:
    rx964_cur."!cursor_fail"()
    rx964_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx964_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("242_1259420191.48826") :method
.annotate "line", 400
    new $P966, "ResizablePMCArray"
    push $P966, "-"
    .return ($P966)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("243_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx970_tgt
    .local int rx970_pos
    .local int rx970_off
    .local int rx970_eos
    .local int rx970_rep
    .local pmc rx970_cur
    (rx970_cur, rx970_pos, rx970_tgt) = self."!cursor_start"()
    rx970_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx970_cur
    .local pmc match
    .lex "$/", match
    length rx970_eos, rx970_tgt
    set rx970_off, 0
    lt rx970_pos, 2, rx970_start
    sub rx970_off, rx970_pos, 1
    substr rx970_tgt, rx970_tgt, rx970_off
  rx970_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan974_done
    goto rxscan974_scan
  rxscan974_loop:
    ($P10) = rx970_cur."from"()
    inc $P10
    set rx970_pos, $P10
    ge rx970_pos, rx970_eos, rxscan974_done
  rxscan974_scan:
    set_addr $I10, rxscan974_loop
    rx970_cur."!mark_push"(0, rx970_pos, $I10)
  rxscan974_done:
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_975_fail
    rx970_cur."!mark_push"(0, rx970_pos, $I10)
  # rx literal  "?"
    add $I11, rx970_pos, 1
    gt $I11, rx970_eos, rx970_fail
    sub $I11, rx970_pos, rx970_off
    substr $S10, rx970_tgt, $I11, 1
    ne $S10, "?", rx970_fail
    add rx970_pos, 1
    set_addr $I10, rxcap_975_fail
    ($I12, $I11) = rx970_cur."!mark_peek"($I10)
    rx970_cur."!cursor_pos"($I11)
    ($P10) = rx970_cur."!cursor_start"()
    $P10."!cursor_pass"(rx970_pos, "")
    rx970_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_975_done
  rxcap_975_fail:
    goto rx970_fail
  rxcap_975_done:
  # rx subrule "O" subtype=capture negate=
    rx970_cur."!cursor_pos"(rx970_pos)
    $P10 = rx970_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx970_fail
    rx970_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx970_pos = $P10."pos"()
  # rx pass
    rx970_cur."!cursor_pass"(rx970_pos, "prefix:sym<?>")
    rx970_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx970_pos)
    .return (rx970_cur)
  rx970_fail:
.annotate "line", 400
    (rx970_rep, rx970_pos, $I10, $P10) = rx970_cur."!mark_fail"(0)
    lt rx970_pos, -1, rx970_done
    eq rx970_pos, -1, rx970_fail
    jump $I10
  rx970_done:
    rx970_cur."!cursor_fail"()
    rx970_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx970_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("244_1259420191.48826") :method
.annotate "line", 400
    $P972 = self."!PREFIX__!subrule"("O", "?")
    new $P973, "ResizablePMCArray"
    push $P973, $P972
    .return ($P973)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("245_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx977_tgt
    .local int rx977_pos
    .local int rx977_off
    .local int rx977_eos
    .local int rx977_rep
    .local pmc rx977_cur
    (rx977_cur, rx977_pos, rx977_tgt) = self."!cursor_start"()
    rx977_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx977_cur
    .local pmc match
    .lex "$/", match
    length rx977_eos, rx977_tgt
    set rx977_off, 0
    lt rx977_pos, 2, rx977_start
    sub rx977_off, rx977_pos, 1
    substr rx977_tgt, rx977_tgt, rx977_off
  rx977_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan981_done
    goto rxscan981_scan
  rxscan981_loop:
    ($P10) = rx977_cur."from"()
    inc $P10
    set rx977_pos, $P10
    ge rx977_pos, rx977_eos, rxscan981_done
  rxscan981_scan:
    set_addr $I10, rxscan981_loop
    rx977_cur."!mark_push"(0, rx977_pos, $I10)
  rxscan981_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_982_fail
    rx977_cur."!mark_push"(0, rx977_pos, $I10)
  # rx literal  "!"
    add $I11, rx977_pos, 1
    gt $I11, rx977_eos, rx977_fail
    sub $I11, rx977_pos, rx977_off
    substr $S10, rx977_tgt, $I11, 1
    ne $S10, "!", rx977_fail
    add rx977_pos, 1
    set_addr $I10, rxcap_982_fail
    ($I12, $I11) = rx977_cur."!mark_peek"($I10)
    rx977_cur."!cursor_pos"($I11)
    ($P10) = rx977_cur."!cursor_start"()
    $P10."!cursor_pass"(rx977_pos, "")
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_982_done
  rxcap_982_fail:
    goto rx977_fail
  rxcap_982_done:
  # rx subrule "O" subtype=capture negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx977_fail
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx977_pos = $P10."pos"()
  # rx pass
    rx977_cur."!cursor_pass"(rx977_pos, "prefix:sym<!>")
    rx977_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx977_pos)
    .return (rx977_cur)
  rx977_fail:
.annotate "line", 400
    (rx977_rep, rx977_pos, $I10, $P10) = rx977_cur."!mark_fail"(0)
    lt rx977_pos, -1, rx977_done
    eq rx977_pos, -1, rx977_fail
    jump $I10
  rx977_done:
    rx977_cur."!cursor_fail"()
    rx977_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx977_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("246_1259420191.48826") :method
.annotate "line", 400
    $P979 = self."!PREFIX__!subrule"("O", "!")
    new $P980, "ResizablePMCArray"
    push $P980, $P979
    .return ($P980)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("247_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx984_tgt
    .local int rx984_pos
    .local int rx984_off
    .local int rx984_eos
    .local int rx984_rep
    .local pmc rx984_cur
    (rx984_cur, rx984_pos, rx984_tgt) = self."!cursor_start"()
    rx984_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx984_cur
    .local pmc match
    .lex "$/", match
    length rx984_eos, rx984_tgt
    set rx984_off, 0
    lt rx984_pos, 2, rx984_start
    sub rx984_off, rx984_pos, 1
    substr rx984_tgt, rx984_tgt, rx984_off
  rx984_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan988_done
    goto rxscan988_scan
  rxscan988_loop:
    ($P10) = rx984_cur."from"()
    inc $P10
    set rx984_pos, $P10
    ge rx984_pos, rx984_eos, rxscan988_done
  rxscan988_scan:
    set_addr $I10, rxscan988_loop
    rx984_cur."!mark_push"(0, rx984_pos, $I10)
  rxscan988_done:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_989_fail
    rx984_cur."!mark_push"(0, rx984_pos, $I10)
  # rx literal  "|"
    add $I11, rx984_pos, 1
    gt $I11, rx984_eos, rx984_fail
    sub $I11, rx984_pos, rx984_off
    substr $S10, rx984_tgt, $I11, 1
    ne $S10, "|", rx984_fail
    add rx984_pos, 1
    set_addr $I10, rxcap_989_fail
    ($I12, $I11) = rx984_cur."!mark_peek"($I10)
    rx984_cur."!cursor_pos"($I11)
    ($P10) = rx984_cur."!cursor_start"()
    $P10."!cursor_pass"(rx984_pos, "")
    rx984_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_989_done
  rxcap_989_fail:
    goto rx984_fail
  rxcap_989_done:
  # rx subrule "O" subtype=capture negate=
    rx984_cur."!cursor_pos"(rx984_pos)
    $P10 = rx984_cur."O"("%symbolic_unary")
    unless $P10, rx984_fail
    rx984_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx984_pos = $P10."pos"()
  # rx pass
    rx984_cur."!cursor_pass"(rx984_pos, "prefix:sym<|>")
    rx984_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx984_pos)
    .return (rx984_cur)
  rx984_fail:
.annotate "line", 400
    (rx984_rep, rx984_pos, $I10, $P10) = rx984_cur."!mark_fail"(0)
    lt rx984_pos, -1, rx984_done
    eq rx984_pos, -1, rx984_fail
    jump $I10
  rx984_done:
    rx984_cur."!cursor_fail"()
    rx984_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx984_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("248_1259420191.48826") :method
.annotate "line", 400
    $P986 = self."!PREFIX__!subrule"("O", "|")
    new $P987, "ResizablePMCArray"
    push $P987, $P986
    .return ($P987)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("249_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx991_tgt
    .local int rx991_pos
    .local int rx991_off
    .local int rx991_eos
    .local int rx991_rep
    .local pmc rx991_cur
    (rx991_cur, rx991_pos, rx991_tgt) = self."!cursor_start"()
    rx991_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx991_cur
    .local pmc match
    .lex "$/", match
    length rx991_eos, rx991_tgt
    set rx991_off, 0
    lt rx991_pos, 2, rx991_start
    sub rx991_off, rx991_pos, 1
    substr rx991_tgt, rx991_tgt, rx991_off
  rx991_start:
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
.annotate "line", 460
  # rx subcapture "sym"
    set_addr $I10, rxcap_996_fail
    rx991_cur."!mark_push"(0, rx991_pos, $I10)
  # rx literal  "*"
    add $I11, rx991_pos, 1
    gt $I11, rx991_eos, rx991_fail
    sub $I11, rx991_pos, rx991_off
    substr $S10, rx991_tgt, $I11, 1
    ne $S10, "*", rx991_fail
    add rx991_pos, 1
    set_addr $I10, rxcap_996_fail
    ($I12, $I11) = rx991_cur."!mark_peek"($I10)
    rx991_cur."!cursor_pos"($I11)
    ($P10) = rx991_cur."!cursor_start"()
    $P10."!cursor_pass"(rx991_pos, "")
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_996_done
  rxcap_996_fail:
    goto rx991_fail
  rxcap_996_done:
  # rx subrule "O" subtype=capture negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx991_fail
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx991_pos = $P10."pos"()
  # rx pass
    rx991_cur."!cursor_pass"(rx991_pos, "infix:sym<*>")
    rx991_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx991_pos)
    .return (rx991_cur)
  rx991_fail:
.annotate "line", 400
    (rx991_rep, rx991_pos, $I10, $P10) = rx991_cur."!mark_fail"(0)
    lt rx991_pos, -1, rx991_done
    eq rx991_pos, -1, rx991_fail
    jump $I10
  rx991_done:
    rx991_cur."!cursor_fail"()
    rx991_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx991_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("250_1259420191.48826") :method
.annotate "line", 400
    $P993 = self."!PREFIX__!subrule"("O", "*")
    new $P994, "ResizablePMCArray"
    push $P994, $P993
    .return ($P994)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("251_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx998_tgt
    .local int rx998_pos
    .local int rx998_off
    .local int rx998_eos
    .local int rx998_rep
    .local pmc rx998_cur
    (rx998_cur, rx998_pos, rx998_tgt) = self."!cursor_start"()
    rx998_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx998_cur
    .local pmc match
    .lex "$/", match
    length rx998_eos, rx998_tgt
    set rx998_off, 0
    lt rx998_pos, 2, rx998_start
    sub rx998_off, rx998_pos, 1
    substr rx998_tgt, rx998_tgt, rx998_off
  rx998_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1002_done
    goto rxscan1002_scan
  rxscan1002_loop:
    ($P10) = rx998_cur."from"()
    inc $P10
    set rx998_pos, $P10
    ge rx998_pos, rx998_eos, rxscan1002_done
  rxscan1002_scan:
    set_addr $I10, rxscan1002_loop
    rx998_cur."!mark_push"(0, rx998_pos, $I10)
  rxscan1002_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_1003_fail
    rx998_cur."!mark_push"(0, rx998_pos, $I10)
  # rx literal  "/"
    add $I11, rx998_pos, 1
    gt $I11, rx998_eos, rx998_fail
    sub $I11, rx998_pos, rx998_off
    substr $S10, rx998_tgt, $I11, 1
    ne $S10, "/", rx998_fail
    add rx998_pos, 1
    set_addr $I10, rxcap_1003_fail
    ($I12, $I11) = rx998_cur."!mark_peek"($I10)
    rx998_cur."!cursor_pos"($I11)
    ($P10) = rx998_cur."!cursor_start"()
    $P10."!cursor_pass"(rx998_pos, "")
    rx998_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1003_done
  rxcap_1003_fail:
    goto rx998_fail
  rxcap_1003_done:
  # rx subrule "O" subtype=capture negate=
    rx998_cur."!cursor_pos"(rx998_pos)
    $P10 = rx998_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx998_fail
    rx998_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx998_pos = $P10."pos"()
  # rx pass
    rx998_cur."!cursor_pass"(rx998_pos, "infix:sym</>")
    rx998_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx998_pos)
    .return (rx998_cur)
  rx998_fail:
.annotate "line", 400
    (rx998_rep, rx998_pos, $I10, $P10) = rx998_cur."!mark_fail"(0)
    lt rx998_pos, -1, rx998_done
    eq rx998_pos, -1, rx998_fail
    jump $I10
  rx998_done:
    rx998_cur."!cursor_fail"()
    rx998_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx998_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("252_1259420191.48826") :method
.annotate "line", 400
    $P1000 = self."!PREFIX__!subrule"("O", "/")
    new $P1001, "ResizablePMCArray"
    push $P1001, $P1000
    .return ($P1001)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("253_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1005_tgt
    .local int rx1005_pos
    .local int rx1005_off
    .local int rx1005_eos
    .local int rx1005_rep
    .local pmc rx1005_cur
    (rx1005_cur, rx1005_pos, rx1005_tgt) = self."!cursor_start"()
    rx1005_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx1005_cur
    .local pmc match
    .lex "$/", match
    length rx1005_eos, rx1005_tgt
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
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_1010_fail
    rx1005_cur."!mark_push"(0, rx1005_pos, $I10)
  # rx literal  "%"
    add $I11, rx1005_pos, 1
    gt $I11, rx1005_eos, rx1005_fail
    sub $I11, rx1005_pos, rx1005_off
    substr $S10, rx1005_tgt, $I11, 1
    ne $S10, "%", rx1005_fail
    add rx1005_pos, 1
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
    $P10 = rx1005_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx1005_fail
    rx1005_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1005_pos = $P10."pos"()
  # rx pass
    rx1005_cur."!cursor_pass"(rx1005_pos, "infix:sym<%>")
    rx1005_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx1005_pos)
    .return (rx1005_cur)
  rx1005_fail:
.annotate "line", 400
    (rx1005_rep, rx1005_pos, $I10, $P10) = rx1005_cur."!mark_fail"(0)
    lt rx1005_pos, -1, rx1005_done
    eq rx1005_pos, -1, rx1005_fail
    jump $I10
  rx1005_done:
    rx1005_cur."!cursor_fail"()
    rx1005_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx1005_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("254_1259420191.48826") :method
.annotate "line", 400
    $P1007 = self."!PREFIX__!subrule"("O", "%")
    new $P1008, "ResizablePMCArray"
    push $P1008, $P1007
    .return ($P1008)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("255_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1012_tgt
    .local int rx1012_pos
    .local int rx1012_off
    .local int rx1012_eos
    .local int rx1012_rep
    .local pmc rx1012_cur
    (rx1012_cur, rx1012_pos, rx1012_tgt) = self."!cursor_start"()
    rx1012_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx1012_cur
    .local pmc match
    .lex "$/", match
    length rx1012_eos, rx1012_tgt
    set rx1012_off, 0
    lt rx1012_pos, 2, rx1012_start
    sub rx1012_off, rx1012_pos, 1
    substr rx1012_tgt, rx1012_tgt, rx1012_off
  rx1012_start:
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
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_1017_fail
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  # rx literal  "+"
    add $I11, rx1012_pos, 1
    gt $I11, rx1012_eos, rx1012_fail
    sub $I11, rx1012_pos, rx1012_off
    substr $S10, rx1012_tgt, $I11, 1
    ne $S10, "+", rx1012_fail
    add rx1012_pos, 1
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
    $P10 = rx1012_cur."O"("%additive, :pirop<add>")
    unless $P10, rx1012_fail
    rx1012_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1012_pos = $P10."pos"()
  # rx pass
    rx1012_cur."!cursor_pass"(rx1012_pos, "infix:sym<+>")
    rx1012_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx1012_pos)
    .return (rx1012_cur)
  rx1012_fail:
.annotate "line", 400
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    rx1012_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("256_1259420191.48826") :method
.annotate "line", 400
    $P1014 = self."!PREFIX__!subrule"("O", "+")
    new $P1015, "ResizablePMCArray"
    push $P1015, $P1014
    .return ($P1015)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("257_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1019_tgt
    .local int rx1019_pos
    .local int rx1019_off
    .local int rx1019_eos
    .local int rx1019_rep
    .local pmc rx1019_cur
    (rx1019_cur, rx1019_pos, rx1019_tgt) = self."!cursor_start"()
    rx1019_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1019_cur
    .local pmc match
    .lex "$/", match
    length rx1019_eos, rx1019_tgt
    set rx1019_off, 0
    lt rx1019_pos, 2, rx1019_start
    sub rx1019_off, rx1019_pos, 1
    substr rx1019_tgt, rx1019_tgt, rx1019_off
  rx1019_start:
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
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_1024_fail
    rx1019_cur."!mark_push"(0, rx1019_pos, $I10)
  # rx literal  "-"
    add $I11, rx1019_pos, 1
    gt $I11, rx1019_eos, rx1019_fail
    sub $I11, rx1019_pos, rx1019_off
    substr $S10, rx1019_tgt, $I11, 1
    ne $S10, "-", rx1019_fail
    add rx1019_pos, 1
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
    $P10 = rx1019_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1019_fail
    rx1019_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1019_pos = $P10."pos"()
  # rx pass
    rx1019_cur."!cursor_pass"(rx1019_pos, "infix:sym<->")
    rx1019_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1019_pos)
    .return (rx1019_cur)
  rx1019_fail:
.annotate "line", 400
    (rx1019_rep, rx1019_pos, $I10, $P10) = rx1019_cur."!mark_fail"(0)
    lt rx1019_pos, -1, rx1019_done
    eq rx1019_pos, -1, rx1019_fail
    jump $I10
  rx1019_done:
    rx1019_cur."!cursor_fail"()
    rx1019_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1019_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("258_1259420191.48826") :method
.annotate "line", 400
    $P1021 = self."!PREFIX__!subrule"("O", "-")
    new $P1022, "ResizablePMCArray"
    push $P1022, $P1021
    .return ($P1022)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("259_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1026_tgt
    .local int rx1026_pos
    .local int rx1026_off
    .local int rx1026_eos
    .local int rx1026_rep
    .local pmc rx1026_cur
    (rx1026_cur, rx1026_pos, rx1026_tgt) = self."!cursor_start"()
    rx1026_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1026_cur
    .local pmc match
    .lex "$/", match
    length rx1026_eos, rx1026_tgt
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
.annotate "line", 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_1031_fail
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  # rx literal  "~"
    add $I11, rx1026_pos, 1
    gt $I11, rx1026_eos, rx1026_fail
    sub $I11, rx1026_pos, rx1026_off
    substr $S10, rx1026_tgt, $I11, 1
    ne $S10, "~", rx1026_fail
    add rx1026_pos, 1
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
    $P10 = rx1026_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1026_fail
    rx1026_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1026_pos = $P10."pos"()
  # rx pass
    rx1026_cur."!cursor_pass"(rx1026_pos, "infix:sym<~>")
    rx1026_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1026_pos)
    .return (rx1026_cur)
  rx1026_fail:
.annotate "line", 400
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    rx1026_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1026_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("260_1259420191.48826") :method
.annotate "line", 400
    $P1028 = self."!PREFIX__!subrule"("O", "~")
    new $P1029, "ResizablePMCArray"
    push $P1029, $P1028
    .return ($P1029)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("261_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1033_tgt
    .local int rx1033_pos
    .local int rx1033_off
    .local int rx1033_eos
    .local int rx1033_rep
    .local pmc rx1033_cur
    (rx1033_cur, rx1033_pos, rx1033_tgt) = self."!cursor_start"()
    rx1033_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1033_cur
    .local pmc match
    .lex "$/", match
    length rx1033_eos, rx1033_tgt
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
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_1038_fail
    rx1033_cur."!mark_push"(0, rx1033_pos, $I10)
  # rx literal  "=="
    add $I11, rx1033_pos, 2
    gt $I11, rx1033_eos, rx1033_fail
    sub $I11, rx1033_pos, rx1033_off
    substr $S10, rx1033_tgt, $I11, 2
    ne $S10, "==", rx1033_fail
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
    $P10 = rx1033_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1033_fail
    rx1033_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1033_pos = $P10."pos"()
  # rx pass
    rx1033_cur."!cursor_pass"(rx1033_pos, "infix:sym<==>")
    rx1033_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1033_pos)
    .return (rx1033_cur)
  rx1033_fail:
.annotate "line", 400
    (rx1033_rep, rx1033_pos, $I10, $P10) = rx1033_cur."!mark_fail"(0)
    lt rx1033_pos, -1, rx1033_done
    eq rx1033_pos, -1, rx1033_fail
    jump $I10
  rx1033_done:
    rx1033_cur."!cursor_fail"()
    rx1033_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1033_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("262_1259420191.48826") :method
.annotate "line", 400
    $P1035 = self."!PREFIX__!subrule"("O", "==")
    new $P1036, "ResizablePMCArray"
    push $P1036, $P1035
    .return ($P1036)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("263_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1040_tgt
    .local int rx1040_pos
    .local int rx1040_off
    .local int rx1040_eos
    .local int rx1040_rep
    .local pmc rx1040_cur
    (rx1040_cur, rx1040_pos, rx1040_tgt) = self."!cursor_start"()
    rx1040_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1040_cur
    .local pmc match
    .lex "$/", match
    length rx1040_eos, rx1040_tgt
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
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1045_fail
    rx1040_cur."!mark_push"(0, rx1040_pos, $I10)
  # rx literal  "!="
    add $I11, rx1040_pos, 2
    gt $I11, rx1040_eos, rx1040_fail
    sub $I11, rx1040_pos, rx1040_off
    substr $S10, rx1040_tgt, $I11, 2
    ne $S10, "!=", rx1040_fail
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
    $P10 = rx1040_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1040_fail
    rx1040_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1040_pos = $P10."pos"()
  # rx pass
    rx1040_cur."!cursor_pass"(rx1040_pos, "infix:sym<!=>")
    rx1040_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1040_pos)
    .return (rx1040_cur)
  rx1040_fail:
.annotate "line", 400
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    rx1040_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("264_1259420191.48826") :method
.annotate "line", 400
    $P1042 = self."!PREFIX__!subrule"("O", "!=")
    new $P1043, "ResizablePMCArray"
    push $P1043, $P1042
    .return ($P1043)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("265_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1047_tgt
    .local int rx1047_pos
    .local int rx1047_off
    .local int rx1047_eos
    .local int rx1047_rep
    .local pmc rx1047_cur
    (rx1047_cur, rx1047_pos, rx1047_tgt) = self."!cursor_start"()
    rx1047_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1047_cur
    .local pmc match
    .lex "$/", match
    length rx1047_eos, rx1047_tgt
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
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1052_fail
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "<="
    add $I11, rx1047_pos, 2
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    substr $S10, rx1047_tgt, $I11, 2
    ne $S10, "<=", rx1047_fail
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
    $P10 = rx1047_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1047_fail
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1047_pos = $P10."pos"()
  # rx pass
    rx1047_cur."!cursor_pass"(rx1047_pos, "infix:sym<<=>")
    rx1047_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1047_pos)
    .return (rx1047_cur)
  rx1047_fail:
.annotate "line", 400
    (rx1047_rep, rx1047_pos, $I10, $P10) = rx1047_cur."!mark_fail"(0)
    lt rx1047_pos, -1, rx1047_done
    eq rx1047_pos, -1, rx1047_fail
    jump $I10
  rx1047_done:
    rx1047_cur."!cursor_fail"()
    rx1047_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1047_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("266_1259420191.48826") :method
.annotate "line", 400
    $P1049 = self."!PREFIX__!subrule"("O", "<=")
    new $P1050, "ResizablePMCArray"
    push $P1050, $P1049
    .return ($P1050)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("267_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1054_tgt
    .local int rx1054_pos
    .local int rx1054_off
    .local int rx1054_eos
    .local int rx1054_rep
    .local pmc rx1054_cur
    (rx1054_cur, rx1054_pos, rx1054_tgt) = self."!cursor_start"()
    rx1054_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1054_cur
    .local pmc match
    .lex "$/", match
    length rx1054_eos, rx1054_tgt
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
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_1059_fail
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  # rx literal  ">="
    add $I11, rx1054_pos, 2
    gt $I11, rx1054_eos, rx1054_fail
    sub $I11, rx1054_pos, rx1054_off
    substr $S10, rx1054_tgt, $I11, 2
    ne $S10, ">=", rx1054_fail
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
    $P10 = rx1054_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1054_fail
    rx1054_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1054_pos = $P10."pos"()
  # rx pass
    rx1054_cur."!cursor_pass"(rx1054_pos, "infix:sym<>=>")
    rx1054_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1054_pos)
    .return (rx1054_cur)
  rx1054_fail:
.annotate "line", 400
    (rx1054_rep, rx1054_pos, $I10, $P10) = rx1054_cur."!mark_fail"(0)
    lt rx1054_pos, -1, rx1054_done
    eq rx1054_pos, -1, rx1054_fail
    jump $I10
  rx1054_done:
    rx1054_cur."!cursor_fail"()
    rx1054_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1054_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("268_1259420191.48826") :method
.annotate "line", 400
    $P1056 = self."!PREFIX__!subrule"("O", ">=")
    new $P1057, "ResizablePMCArray"
    push $P1057, $P1056
    .return ($P1057)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("269_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1061_tgt
    .local int rx1061_pos
    .local int rx1061_off
    .local int rx1061_eos
    .local int rx1061_rep
    .local pmc rx1061_cur
    (rx1061_cur, rx1061_pos, rx1061_tgt) = self."!cursor_start"()
    rx1061_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1061_cur
    .local pmc match
    .lex "$/", match
    length rx1061_eos, rx1061_tgt
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
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1066_fail
    rx1061_cur."!mark_push"(0, rx1061_pos, $I10)
  # rx literal  "<"
    add $I11, rx1061_pos, 1
    gt $I11, rx1061_eos, rx1061_fail
    sub $I11, rx1061_pos, rx1061_off
    substr $S10, rx1061_tgt, $I11, 1
    ne $S10, "<", rx1061_fail
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
    $P10 = rx1061_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1061_fail
    rx1061_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1061_pos = $P10."pos"()
  # rx pass
    rx1061_cur."!cursor_pass"(rx1061_pos, "infix:sym<<>")
    rx1061_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1061_pos)
    .return (rx1061_cur)
  rx1061_fail:
.annotate "line", 400
    (rx1061_rep, rx1061_pos, $I10, $P10) = rx1061_cur."!mark_fail"(0)
    lt rx1061_pos, -1, rx1061_done
    eq rx1061_pos, -1, rx1061_fail
    jump $I10
  rx1061_done:
    rx1061_cur."!cursor_fail"()
    rx1061_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1061_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("270_1259420191.48826") :method
.annotate "line", 400
    $P1063 = self."!PREFIX__!subrule"("O", "<")
    new $P1064, "ResizablePMCArray"
    push $P1064, $P1063
    .return ($P1064)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("271_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1068_tgt
    .local int rx1068_pos
    .local int rx1068_off
    .local int rx1068_eos
    .local int rx1068_rep
    .local pmc rx1068_cur
    (rx1068_cur, rx1068_pos, rx1068_tgt) = self."!cursor_start"()
    rx1068_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1068_cur
    .local pmc match
    .lex "$/", match
    length rx1068_eos, rx1068_tgt
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
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1073_fail
    rx1068_cur."!mark_push"(0, rx1068_pos, $I10)
  # rx literal  ">"
    add $I11, rx1068_pos, 1
    gt $I11, rx1068_eos, rx1068_fail
    sub $I11, rx1068_pos, rx1068_off
    substr $S10, rx1068_tgt, $I11, 1
    ne $S10, ">", rx1068_fail
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
    $P10 = rx1068_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1068_fail
    rx1068_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1068_pos = $P10."pos"()
  # rx pass
    rx1068_cur."!cursor_pass"(rx1068_pos, "infix:sym<>>")
    rx1068_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1068_pos)
    .return (rx1068_cur)
  rx1068_fail:
.annotate "line", 400
    (rx1068_rep, rx1068_pos, $I10, $P10) = rx1068_cur."!mark_fail"(0)
    lt rx1068_pos, -1, rx1068_done
    eq rx1068_pos, -1, rx1068_fail
    jump $I10
  rx1068_done:
    rx1068_cur."!cursor_fail"()
    rx1068_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1068_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("272_1259420191.48826") :method
.annotate "line", 400
    $P1070 = self."!PREFIX__!subrule"("O", ">")
    new $P1071, "ResizablePMCArray"
    push $P1071, $P1070
    .return ($P1071)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("273_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1075_tgt
    .local int rx1075_pos
    .local int rx1075_off
    .local int rx1075_eos
    .local int rx1075_rep
    .local pmc rx1075_cur
    (rx1075_cur, rx1075_pos, rx1075_tgt) = self."!cursor_start"()
    rx1075_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1075_cur
    .local pmc match
    .lex "$/", match
    length rx1075_eos, rx1075_tgt
    set rx1075_off, 0
    lt rx1075_pos, 2, rx1075_start
    sub rx1075_off, rx1075_pos, 1
    substr rx1075_tgt, rx1075_tgt, rx1075_off
  rx1075_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1079_done
    goto rxscan1079_scan
  rxscan1079_loop:
    ($P10) = rx1075_cur."from"()
    inc $P10
    set rx1075_pos, $P10
    ge rx1075_pos, rx1075_eos, rxscan1079_done
  rxscan1079_scan:
    set_addr $I10, rxscan1079_loop
    rx1075_cur."!mark_push"(0, rx1075_pos, $I10)
  rxscan1079_done:
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1080_fail
    rx1075_cur."!mark_push"(0, rx1075_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1075_pos, 2
    gt $I11, rx1075_eos, rx1075_fail
    sub $I11, rx1075_pos, rx1075_off
    substr $S10, rx1075_tgt, $I11, 2
    ne $S10, "eq", rx1075_fail
    add rx1075_pos, 2
    set_addr $I10, rxcap_1080_fail
    ($I12, $I11) = rx1075_cur."!mark_peek"($I10)
    rx1075_cur."!cursor_pos"($I11)
    ($P10) = rx1075_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1075_pos, "")
    rx1075_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1080_done
  rxcap_1080_fail:
    goto rx1075_fail
  rxcap_1080_done:
  # rx subrule "O" subtype=capture negate=
    rx1075_cur."!cursor_pos"(rx1075_pos)
    $P10 = rx1075_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1075_fail
    rx1075_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1075_pos = $P10."pos"()
  # rx pass
    rx1075_cur."!cursor_pass"(rx1075_pos, "infix:sym<eq>")
    rx1075_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1075_pos)
    .return (rx1075_cur)
  rx1075_fail:
.annotate "line", 400
    (rx1075_rep, rx1075_pos, $I10, $P10) = rx1075_cur."!mark_fail"(0)
    lt rx1075_pos, -1, rx1075_done
    eq rx1075_pos, -1, rx1075_fail
    jump $I10
  rx1075_done:
    rx1075_cur."!cursor_fail"()
    rx1075_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1075_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("274_1259420191.48826") :method
.annotate "line", 400
    $P1077 = self."!PREFIX__!subrule"("O", "eq")
    new $P1078, "ResizablePMCArray"
    push $P1078, $P1077
    .return ($P1078)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("275_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1082_tgt
    .local int rx1082_pos
    .local int rx1082_off
    .local int rx1082_eos
    .local int rx1082_rep
    .local pmc rx1082_cur
    (rx1082_cur, rx1082_pos, rx1082_tgt) = self."!cursor_start"()
    rx1082_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1082_cur
    .local pmc match
    .lex "$/", match
    length rx1082_eos, rx1082_tgt
    set rx1082_off, 0
    lt rx1082_pos, 2, rx1082_start
    sub rx1082_off, rx1082_pos, 1
    substr rx1082_tgt, rx1082_tgt, rx1082_off
  rx1082_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1086_done
    goto rxscan1086_scan
  rxscan1086_loop:
    ($P10) = rx1082_cur."from"()
    inc $P10
    set rx1082_pos, $P10
    ge rx1082_pos, rx1082_eos, rxscan1086_done
  rxscan1086_scan:
    set_addr $I10, rxscan1086_loop
    rx1082_cur."!mark_push"(0, rx1082_pos, $I10)
  rxscan1086_done:
.annotate "line", 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1087_fail
    rx1082_cur."!mark_push"(0, rx1082_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1082_pos, 2
    gt $I11, rx1082_eos, rx1082_fail
    sub $I11, rx1082_pos, rx1082_off
    substr $S10, rx1082_tgt, $I11, 2
    ne $S10, "ne", rx1082_fail
    add rx1082_pos, 2
    set_addr $I10, rxcap_1087_fail
    ($I12, $I11) = rx1082_cur."!mark_peek"($I10)
    rx1082_cur."!cursor_pos"($I11)
    ($P10) = rx1082_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1082_pos, "")
    rx1082_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1087_done
  rxcap_1087_fail:
    goto rx1082_fail
  rxcap_1087_done:
  # rx subrule "O" subtype=capture negate=
    rx1082_cur."!cursor_pos"(rx1082_pos)
    $P10 = rx1082_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1082_fail
    rx1082_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1082_pos = $P10."pos"()
  # rx pass
    rx1082_cur."!cursor_pass"(rx1082_pos, "infix:sym<ne>")
    rx1082_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1082_pos)
    .return (rx1082_cur)
  rx1082_fail:
.annotate "line", 400
    (rx1082_rep, rx1082_pos, $I10, $P10) = rx1082_cur."!mark_fail"(0)
    lt rx1082_pos, -1, rx1082_done
    eq rx1082_pos, -1, rx1082_fail
    jump $I10
  rx1082_done:
    rx1082_cur."!cursor_fail"()
    rx1082_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1082_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("276_1259420191.48826") :method
.annotate "line", 400
    $P1084 = self."!PREFIX__!subrule"("O", "ne")
    new $P1085, "ResizablePMCArray"
    push $P1085, $P1084
    .return ($P1085)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("277_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1089_tgt
    .local int rx1089_pos
    .local int rx1089_off
    .local int rx1089_eos
    .local int rx1089_rep
    .local pmc rx1089_cur
    (rx1089_cur, rx1089_pos, rx1089_tgt) = self."!cursor_start"()
    rx1089_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1089_cur
    .local pmc match
    .lex "$/", match
    length rx1089_eos, rx1089_tgt
    set rx1089_off, 0
    lt rx1089_pos, 2, rx1089_start
    sub rx1089_off, rx1089_pos, 1
    substr rx1089_tgt, rx1089_tgt, rx1089_off
  rx1089_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1093_done
    goto rxscan1093_scan
  rxscan1093_loop:
    ($P10) = rx1089_cur."from"()
    inc $P10
    set rx1089_pos, $P10
    ge rx1089_pos, rx1089_eos, rxscan1093_done
  rxscan1093_scan:
    set_addr $I10, rxscan1093_loop
    rx1089_cur."!mark_push"(0, rx1089_pos, $I10)
  rxscan1093_done:
.annotate "line", 477
  # rx subcapture "sym"
    set_addr $I10, rxcap_1094_fail
    rx1089_cur."!mark_push"(0, rx1089_pos, $I10)
  # rx literal  "le"
    add $I11, rx1089_pos, 2
    gt $I11, rx1089_eos, rx1089_fail
    sub $I11, rx1089_pos, rx1089_off
    substr $S10, rx1089_tgt, $I11, 2
    ne $S10, "le", rx1089_fail
    add rx1089_pos, 2
    set_addr $I10, rxcap_1094_fail
    ($I12, $I11) = rx1089_cur."!mark_peek"($I10)
    rx1089_cur."!cursor_pos"($I11)
    ($P10) = rx1089_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1089_pos, "")
    rx1089_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1094_done
  rxcap_1094_fail:
    goto rx1089_fail
  rxcap_1094_done:
  # rx subrule "O" subtype=capture negate=
    rx1089_cur."!cursor_pos"(rx1089_pos)
    $P10 = rx1089_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1089_fail
    rx1089_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1089_pos = $P10."pos"()
  # rx pass
    rx1089_cur."!cursor_pass"(rx1089_pos, "infix:sym<le>")
    rx1089_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1089_pos)
    .return (rx1089_cur)
  rx1089_fail:
.annotate "line", 400
    (rx1089_rep, rx1089_pos, $I10, $P10) = rx1089_cur."!mark_fail"(0)
    lt rx1089_pos, -1, rx1089_done
    eq rx1089_pos, -1, rx1089_fail
    jump $I10
  rx1089_done:
    rx1089_cur."!cursor_fail"()
    rx1089_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1089_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("278_1259420191.48826") :method
.annotate "line", 400
    $P1091 = self."!PREFIX__!subrule"("O", "le")
    new $P1092, "ResizablePMCArray"
    push $P1092, $P1091
    .return ($P1092)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("279_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1096_tgt
    .local int rx1096_pos
    .local int rx1096_off
    .local int rx1096_eos
    .local int rx1096_rep
    .local pmc rx1096_cur
    (rx1096_cur, rx1096_pos, rx1096_tgt) = self."!cursor_start"()
    rx1096_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1096_cur
    .local pmc match
    .lex "$/", match
    length rx1096_eos, rx1096_tgt
    set rx1096_off, 0
    lt rx1096_pos, 2, rx1096_start
    sub rx1096_off, rx1096_pos, 1
    substr rx1096_tgt, rx1096_tgt, rx1096_off
  rx1096_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1100_done
    goto rxscan1100_scan
  rxscan1100_loop:
    ($P10) = rx1096_cur."from"()
    inc $P10
    set rx1096_pos, $P10
    ge rx1096_pos, rx1096_eos, rxscan1100_done
  rxscan1100_scan:
    set_addr $I10, rxscan1100_loop
    rx1096_cur."!mark_push"(0, rx1096_pos, $I10)
  rxscan1100_done:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1101_fail
    rx1096_cur."!mark_push"(0, rx1096_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1096_pos, 2
    gt $I11, rx1096_eos, rx1096_fail
    sub $I11, rx1096_pos, rx1096_off
    substr $S10, rx1096_tgt, $I11, 2
    ne $S10, "ge", rx1096_fail
    add rx1096_pos, 2
    set_addr $I10, rxcap_1101_fail
    ($I12, $I11) = rx1096_cur."!mark_peek"($I10)
    rx1096_cur."!cursor_pos"($I11)
    ($P10) = rx1096_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1096_pos, "")
    rx1096_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1101_done
  rxcap_1101_fail:
    goto rx1096_fail
  rxcap_1101_done:
  # rx subrule "O" subtype=capture negate=
    rx1096_cur."!cursor_pos"(rx1096_pos)
    $P10 = rx1096_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1096_fail
    rx1096_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1096_pos = $P10."pos"()
  # rx pass
    rx1096_cur."!cursor_pass"(rx1096_pos, "infix:sym<ge>")
    rx1096_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1096_pos)
    .return (rx1096_cur)
  rx1096_fail:
.annotate "line", 400
    (rx1096_rep, rx1096_pos, $I10, $P10) = rx1096_cur."!mark_fail"(0)
    lt rx1096_pos, -1, rx1096_done
    eq rx1096_pos, -1, rx1096_fail
    jump $I10
  rx1096_done:
    rx1096_cur."!cursor_fail"()
    rx1096_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1096_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("280_1259420191.48826") :method
.annotate "line", 400
    $P1098 = self."!PREFIX__!subrule"("O", "ge")
    new $P1099, "ResizablePMCArray"
    push $P1099, $P1098
    .return ($P1099)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("281_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1103_tgt
    .local int rx1103_pos
    .local int rx1103_off
    .local int rx1103_eos
    .local int rx1103_rep
    .local pmc rx1103_cur
    (rx1103_cur, rx1103_pos, rx1103_tgt) = self."!cursor_start"()
    rx1103_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1103_cur
    .local pmc match
    .lex "$/", match
    length rx1103_eos, rx1103_tgt
    set rx1103_off, 0
    lt rx1103_pos, 2, rx1103_start
    sub rx1103_off, rx1103_pos, 1
    substr rx1103_tgt, rx1103_tgt, rx1103_off
  rx1103_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1107_done
    goto rxscan1107_scan
  rxscan1107_loop:
    ($P10) = rx1103_cur."from"()
    inc $P10
    set rx1103_pos, $P10
    ge rx1103_pos, rx1103_eos, rxscan1107_done
  rxscan1107_scan:
    set_addr $I10, rxscan1107_loop
    rx1103_cur."!mark_push"(0, rx1103_pos, $I10)
  rxscan1107_done:
.annotate "line", 479
  # rx subcapture "sym"
    set_addr $I10, rxcap_1108_fail
    rx1103_cur."!mark_push"(0, rx1103_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1103_pos, 2
    gt $I11, rx1103_eos, rx1103_fail
    sub $I11, rx1103_pos, rx1103_off
    substr $S10, rx1103_tgt, $I11, 2
    ne $S10, "lt", rx1103_fail
    add rx1103_pos, 2
    set_addr $I10, rxcap_1108_fail
    ($I12, $I11) = rx1103_cur."!mark_peek"($I10)
    rx1103_cur."!cursor_pos"($I11)
    ($P10) = rx1103_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1103_pos, "")
    rx1103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1108_done
  rxcap_1108_fail:
    goto rx1103_fail
  rxcap_1108_done:
  # rx subrule "O" subtype=capture negate=
    rx1103_cur."!cursor_pos"(rx1103_pos)
    $P10 = rx1103_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1103_fail
    rx1103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1103_pos = $P10."pos"()
  # rx pass
    rx1103_cur."!cursor_pass"(rx1103_pos, "infix:sym<lt>")
    rx1103_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1103_pos)
    .return (rx1103_cur)
  rx1103_fail:
.annotate "line", 400
    (rx1103_rep, rx1103_pos, $I10, $P10) = rx1103_cur."!mark_fail"(0)
    lt rx1103_pos, -1, rx1103_done
    eq rx1103_pos, -1, rx1103_fail
    jump $I10
  rx1103_done:
    rx1103_cur."!cursor_fail"()
    rx1103_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1103_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("282_1259420191.48826") :method
.annotate "line", 400
    $P1105 = self."!PREFIX__!subrule"("O", "lt")
    new $P1106, "ResizablePMCArray"
    push $P1106, $P1105
    .return ($P1106)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("283_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1110_tgt
    .local int rx1110_pos
    .local int rx1110_off
    .local int rx1110_eos
    .local int rx1110_rep
    .local pmc rx1110_cur
    (rx1110_cur, rx1110_pos, rx1110_tgt) = self."!cursor_start"()
    rx1110_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1110_cur
    .local pmc match
    .lex "$/", match
    length rx1110_eos, rx1110_tgt
    set rx1110_off, 0
    lt rx1110_pos, 2, rx1110_start
    sub rx1110_off, rx1110_pos, 1
    substr rx1110_tgt, rx1110_tgt, rx1110_off
  rx1110_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1114_done
    goto rxscan1114_scan
  rxscan1114_loop:
    ($P10) = rx1110_cur."from"()
    inc $P10
    set rx1110_pos, $P10
    ge rx1110_pos, rx1110_eos, rxscan1114_done
  rxscan1114_scan:
    set_addr $I10, rxscan1114_loop
    rx1110_cur."!mark_push"(0, rx1110_pos, $I10)
  rxscan1114_done:
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1115_fail
    rx1110_cur."!mark_push"(0, rx1110_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1110_pos, 2
    gt $I11, rx1110_eos, rx1110_fail
    sub $I11, rx1110_pos, rx1110_off
    substr $S10, rx1110_tgt, $I11, 2
    ne $S10, "gt", rx1110_fail
    add rx1110_pos, 2
    set_addr $I10, rxcap_1115_fail
    ($I12, $I11) = rx1110_cur."!mark_peek"($I10)
    rx1110_cur."!cursor_pos"($I11)
    ($P10) = rx1110_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1110_pos, "")
    rx1110_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1115_done
  rxcap_1115_fail:
    goto rx1110_fail
  rxcap_1115_done:
  # rx subrule "O" subtype=capture negate=
    rx1110_cur."!cursor_pos"(rx1110_pos)
    $P10 = rx1110_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1110_fail
    rx1110_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1110_pos = $P10."pos"()
  # rx pass
    rx1110_cur."!cursor_pass"(rx1110_pos, "infix:sym<gt>")
    rx1110_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1110_pos)
    .return (rx1110_cur)
  rx1110_fail:
.annotate "line", 400
    (rx1110_rep, rx1110_pos, $I10, $P10) = rx1110_cur."!mark_fail"(0)
    lt rx1110_pos, -1, rx1110_done
    eq rx1110_pos, -1, rx1110_fail
    jump $I10
  rx1110_done:
    rx1110_cur."!cursor_fail"()
    rx1110_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1110_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("284_1259420191.48826") :method
.annotate "line", 400
    $P1112 = self."!PREFIX__!subrule"("O", "gt")
    new $P1113, "ResizablePMCArray"
    push $P1113, $P1112
    .return ($P1113)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("285_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1117_tgt
    .local int rx1117_pos
    .local int rx1117_off
    .local int rx1117_eos
    .local int rx1117_rep
    .local pmc rx1117_cur
    (rx1117_cur, rx1117_pos, rx1117_tgt) = self."!cursor_start"()
    rx1117_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1117_cur
    .local pmc match
    .lex "$/", match
    length rx1117_eos, rx1117_tgt
    set rx1117_off, 0
    lt rx1117_pos, 2, rx1117_start
    sub rx1117_off, rx1117_pos, 1
    substr rx1117_tgt, rx1117_tgt, rx1117_off
  rx1117_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1121_done
    goto rxscan1121_scan
  rxscan1121_loop:
    ($P10) = rx1117_cur."from"()
    inc $P10
    set rx1117_pos, $P10
    ge rx1117_pos, rx1117_eos, rxscan1121_done
  rxscan1121_scan:
    set_addr $I10, rxscan1121_loop
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  rxscan1121_done:
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1122_fail
    rx1117_cur."!mark_push"(0, rx1117_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1117_pos, 3
    gt $I11, rx1117_eos, rx1117_fail
    sub $I11, rx1117_pos, rx1117_off
    substr $S10, rx1117_tgt, $I11, 3
    ne $S10, "=:=", rx1117_fail
    add rx1117_pos, 3
    set_addr $I10, rxcap_1122_fail
    ($I12, $I11) = rx1117_cur."!mark_peek"($I10)
    rx1117_cur."!cursor_pos"($I11)
    ($P10) = rx1117_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1117_pos, "")
    rx1117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1122_done
  rxcap_1122_fail:
    goto rx1117_fail
  rxcap_1122_done:
  # rx subrule "O" subtype=capture negate=
    rx1117_cur."!cursor_pos"(rx1117_pos)
    $P10 = rx1117_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1117_fail
    rx1117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1117_pos = $P10."pos"()
  # rx pass
    rx1117_cur."!cursor_pass"(rx1117_pos, "infix:sym<=:=>")
    rx1117_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1117_pos)
    .return (rx1117_cur)
  rx1117_fail:
.annotate "line", 400
    (rx1117_rep, rx1117_pos, $I10, $P10) = rx1117_cur."!mark_fail"(0)
    lt rx1117_pos, -1, rx1117_done
    eq rx1117_pos, -1, rx1117_fail
    jump $I10
  rx1117_done:
    rx1117_cur."!cursor_fail"()
    rx1117_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1117_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("286_1259420191.48826") :method
.annotate "line", 400
    $P1119 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1120, "ResizablePMCArray"
    push $P1120, $P1119
    .return ($P1120)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("287_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1124_tgt
    .local int rx1124_pos
    .local int rx1124_off
    .local int rx1124_eos
    .local int rx1124_rep
    .local pmc rx1124_cur
    (rx1124_cur, rx1124_pos, rx1124_tgt) = self."!cursor_start"()
    rx1124_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1124_cur
    .local pmc match
    .lex "$/", match
    length rx1124_eos, rx1124_tgt
    set rx1124_off, 0
    lt rx1124_pos, 2, rx1124_start
    sub rx1124_off, rx1124_pos, 1
    substr rx1124_tgt, rx1124_tgt, rx1124_off
  rx1124_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1128_done
    goto rxscan1128_scan
  rxscan1128_loop:
    ($P10) = rx1124_cur."from"()
    inc $P10
    set rx1124_pos, $P10
    ge rx1124_pos, rx1124_eos, rxscan1128_done
  rxscan1128_scan:
    set_addr $I10, rxscan1128_loop
    rx1124_cur."!mark_push"(0, rx1124_pos, $I10)
  rxscan1128_done:
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1129_fail
    rx1124_cur."!mark_push"(0, rx1124_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1124_pos, 2
    gt $I11, rx1124_eos, rx1124_fail
    sub $I11, rx1124_pos, rx1124_off
    substr $S10, rx1124_tgt, $I11, 2
    ne $S10, "&&", rx1124_fail
    add rx1124_pos, 2
    set_addr $I10, rxcap_1129_fail
    ($I12, $I11) = rx1124_cur."!mark_peek"($I10)
    rx1124_cur."!cursor_pos"($I11)
    ($P10) = rx1124_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1124_pos, "")
    rx1124_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1129_done
  rxcap_1129_fail:
    goto rx1124_fail
  rxcap_1129_done:
  # rx subrule "O" subtype=capture negate=
    rx1124_cur."!cursor_pos"(rx1124_pos)
    $P10 = rx1124_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1124_fail
    rx1124_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1124_pos = $P10."pos"()
  # rx pass
    rx1124_cur."!cursor_pass"(rx1124_pos, "infix:sym<&&>")
    rx1124_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1124_pos)
    .return (rx1124_cur)
  rx1124_fail:
.annotate "line", 400
    (rx1124_rep, rx1124_pos, $I10, $P10) = rx1124_cur."!mark_fail"(0)
    lt rx1124_pos, -1, rx1124_done
    eq rx1124_pos, -1, rx1124_fail
    jump $I10
  rx1124_done:
    rx1124_cur."!cursor_fail"()
    rx1124_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1124_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("288_1259420191.48826") :method
.annotate "line", 400
    $P1126 = self."!PREFIX__!subrule"("O", "&&")
    new $P1127, "ResizablePMCArray"
    push $P1127, $P1126
    .return ($P1127)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("289_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1131_tgt
    .local int rx1131_pos
    .local int rx1131_off
    .local int rx1131_eos
    .local int rx1131_rep
    .local pmc rx1131_cur
    (rx1131_cur, rx1131_pos, rx1131_tgt) = self."!cursor_start"()
    rx1131_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1131_cur
    .local pmc match
    .lex "$/", match
    length rx1131_eos, rx1131_tgt
    set rx1131_off, 0
    lt rx1131_pos, 2, rx1131_start
    sub rx1131_off, rx1131_pos, 1
    substr rx1131_tgt, rx1131_tgt, rx1131_off
  rx1131_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1135_done
    goto rxscan1135_scan
  rxscan1135_loop:
    ($P10) = rx1131_cur."from"()
    inc $P10
    set rx1131_pos, $P10
    ge rx1131_pos, rx1131_eos, rxscan1135_done
  rxscan1135_scan:
    set_addr $I10, rxscan1135_loop
    rx1131_cur."!mark_push"(0, rx1131_pos, $I10)
  rxscan1135_done:
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1136_fail
    rx1131_cur."!mark_push"(0, rx1131_pos, $I10)
  # rx literal  "||"
    add $I11, rx1131_pos, 2
    gt $I11, rx1131_eos, rx1131_fail
    sub $I11, rx1131_pos, rx1131_off
    substr $S10, rx1131_tgt, $I11, 2
    ne $S10, "||", rx1131_fail
    add rx1131_pos, 2
    set_addr $I10, rxcap_1136_fail
    ($I12, $I11) = rx1131_cur."!mark_peek"($I10)
    rx1131_cur."!cursor_pos"($I11)
    ($P10) = rx1131_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1131_pos, "")
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1136_done
  rxcap_1136_fail:
    goto rx1131_fail
  rxcap_1136_done:
  # rx subrule "O" subtype=capture negate=
    rx1131_cur."!cursor_pos"(rx1131_pos)
    $P10 = rx1131_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1131_fail
    rx1131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1131_pos = $P10."pos"()
  # rx pass
    rx1131_cur."!cursor_pass"(rx1131_pos, "infix:sym<||>")
    rx1131_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1131_pos)
    .return (rx1131_cur)
  rx1131_fail:
.annotate "line", 400
    (rx1131_rep, rx1131_pos, $I10, $P10) = rx1131_cur."!mark_fail"(0)
    lt rx1131_pos, -1, rx1131_done
    eq rx1131_pos, -1, rx1131_fail
    jump $I10
  rx1131_done:
    rx1131_cur."!cursor_fail"()
    rx1131_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1131_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("290_1259420191.48826") :method
.annotate "line", 400
    $P1133 = self."!PREFIX__!subrule"("O", "||")
    new $P1134, "ResizablePMCArray"
    push $P1134, $P1133
    .return ($P1134)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("291_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1138_tgt
    .local int rx1138_pos
    .local int rx1138_off
    .local int rx1138_eos
    .local int rx1138_rep
    .local pmc rx1138_cur
    (rx1138_cur, rx1138_pos, rx1138_tgt) = self."!cursor_start"()
    rx1138_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1138_cur
    .local pmc match
    .lex "$/", match
    length rx1138_eos, rx1138_tgt
    set rx1138_off, 0
    lt rx1138_pos, 2, rx1138_start
    sub rx1138_off, rx1138_pos, 1
    substr rx1138_tgt, rx1138_tgt, rx1138_off
  rx1138_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1142_done
    goto rxscan1142_scan
  rxscan1142_loop:
    ($P10) = rx1138_cur."from"()
    inc $P10
    set rx1138_pos, $P10
    ge rx1138_pos, rx1138_eos, rxscan1142_done
  rxscan1142_scan:
    set_addr $I10, rxscan1142_loop
    rx1138_cur."!mark_push"(0, rx1138_pos, $I10)
  rxscan1142_done:
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1143_fail
    rx1138_cur."!mark_push"(0, rx1138_pos, $I10)
  # rx literal  "//"
    add $I11, rx1138_pos, 2
    gt $I11, rx1138_eos, rx1138_fail
    sub $I11, rx1138_pos, rx1138_off
    substr $S10, rx1138_tgt, $I11, 2
    ne $S10, "//", rx1138_fail
    add rx1138_pos, 2
    set_addr $I10, rxcap_1143_fail
    ($I12, $I11) = rx1138_cur."!mark_peek"($I10)
    rx1138_cur."!cursor_pos"($I11)
    ($P10) = rx1138_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1138_pos, "")
    rx1138_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1143_done
  rxcap_1143_fail:
    goto rx1138_fail
  rxcap_1143_done:
  # rx subrule "O" subtype=capture negate=
    rx1138_cur."!cursor_pos"(rx1138_pos)
    $P10 = rx1138_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1138_fail
    rx1138_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1138_pos = $P10."pos"()
  # rx pass
    rx1138_cur."!cursor_pass"(rx1138_pos, "infix:sym<//>")
    rx1138_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1138_pos)
    .return (rx1138_cur)
  rx1138_fail:
.annotate "line", 400
    (rx1138_rep, rx1138_pos, $I10, $P10) = rx1138_cur."!mark_fail"(0)
    lt rx1138_pos, -1, rx1138_done
    eq rx1138_pos, -1, rx1138_fail
    jump $I10
  rx1138_done:
    rx1138_cur."!cursor_fail"()
    rx1138_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1138_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("292_1259420191.48826") :method
.annotate "line", 400
    $P1140 = self."!PREFIX__!subrule"("O", "//")
    new $P1141, "ResizablePMCArray"
    push $P1141, $P1140
    .return ($P1141)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("293_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1145_tgt
    .local int rx1145_pos
    .local int rx1145_off
    .local int rx1145_eos
    .local int rx1145_rep
    .local pmc rx1145_cur
    (rx1145_cur, rx1145_pos, rx1145_tgt) = self."!cursor_start"()
    rx1145_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1145_cur
    .local pmc match
    .lex "$/", match
    length rx1145_eos, rx1145_tgt
    set rx1145_off, 0
    lt rx1145_pos, 2, rx1145_start
    sub rx1145_off, rx1145_pos, 1
    substr rx1145_tgt, rx1145_tgt, rx1145_off
  rx1145_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1149_done
    goto rxscan1149_scan
  rxscan1149_loop:
    ($P10) = rx1145_cur."from"()
    inc $P10
    set rx1145_pos, $P10
    ge rx1145_pos, rx1145_eos, rxscan1149_done
  rxscan1149_scan:
    set_addr $I10, rxscan1149_loop
    rx1145_cur."!mark_push"(0, rx1145_pos, $I10)
  rxscan1149_done:
.annotate "line", 489
  # rx literal  "??"
    add $I11, rx1145_pos, 2
    gt $I11, rx1145_eos, rx1145_fail
    sub $I11, rx1145_pos, rx1145_off
    substr $S10, rx1145_tgt, $I11, 2
    ne $S10, "??", rx1145_fail
    add rx1145_pos, 2
.annotate "line", 490
  # rx subrule "ws" subtype=method negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."ws"()
    unless $P10, rx1145_fail
    rx1145_pos = $P10."pos"()
.annotate "line", 491
  # rx subrule "EXPR" subtype=capture negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."EXPR"("i=")
    unless $P10, rx1145_fail
    rx1145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1145_pos = $P10."pos"()
.annotate "line", 492
  # rx literal  "!!"
    add $I11, rx1145_pos, 2
    gt $I11, rx1145_eos, rx1145_fail
    sub $I11, rx1145_pos, rx1145_off
    substr $S10, rx1145_tgt, $I11, 2
    ne $S10, "!!", rx1145_fail
    add rx1145_pos, 2
.annotate "line", 493
  # rx subrule "O" subtype=capture negate=
    rx1145_cur."!cursor_pos"(rx1145_pos)
    $P10 = rx1145_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1145_fail
    rx1145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1145_pos = $P10."pos"()
.annotate "line", 488
  # rx pass
    rx1145_cur."!cursor_pass"(rx1145_pos, "infix:sym<?? !!>")
    rx1145_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1145_pos)
    .return (rx1145_cur)
  rx1145_fail:
.annotate "line", 400
    (rx1145_rep, rx1145_pos, $I10, $P10) = rx1145_cur."!mark_fail"(0)
    lt rx1145_pos, -1, rx1145_done
    eq rx1145_pos, -1, rx1145_fail
    jump $I10
  rx1145_done:
    rx1145_cur."!cursor_fail"()
    rx1145_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1145_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("294_1259420191.48826") :method
.annotate "line", 400
    $P1147 = self."!PREFIX__!subrule"("", "??")
    new $P1148, "ResizablePMCArray"
    push $P1148, $P1147
    .return ($P1148)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("295_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1151_tgt
    .local int rx1151_pos
    .local int rx1151_off
    .local int rx1151_eos
    .local int rx1151_rep
    .local pmc rx1151_cur
    (rx1151_cur, rx1151_pos, rx1151_tgt) = self."!cursor_start"()
    rx1151_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1151_cur
    .local pmc match
    .lex "$/", match
    length rx1151_eos, rx1151_tgt
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
.annotate "line", 497
  # rx subcapture "sym"
    set_addr $I10, rxcap_1156_fail
    rx1151_cur."!mark_push"(0, rx1151_pos, $I10)
  # rx literal  "="
    add $I11, rx1151_pos, 1
    gt $I11, rx1151_eos, rx1151_fail
    sub $I11, rx1151_pos, rx1151_off
    substr $S10, rx1151_tgt, $I11, 1
    ne $S10, "=", rx1151_fail
    add rx1151_pos, 1
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
  # rx subrule "panic" subtype=method negate=
    rx1151_cur."!cursor_pos"(rx1151_pos)
    $P10 = rx1151_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1151_fail
    rx1151_pos = $P10."pos"()
.annotate "line", 496
  # rx pass
    rx1151_cur."!cursor_pass"(rx1151_pos, "infix:sym<=>")
    rx1151_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1151_pos)
    .return (rx1151_cur)
  rx1151_fail:
.annotate "line", 400
    (rx1151_rep, rx1151_pos, $I10, $P10) = rx1151_cur."!mark_fail"(0)
    lt rx1151_pos, -1, rx1151_done
    eq rx1151_pos, -1, rx1151_fail
    jump $I10
  rx1151_done:
    rx1151_cur."!cursor_fail"()
    rx1151_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1151_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("296_1259420191.48826") :method
.annotate "line", 400
    $P1153 = self."!PREFIX__!subrule"("", "=")
    new $P1154, "ResizablePMCArray"
    push $P1154, $P1153
    .return ($P1154)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("297_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1158_tgt
    .local int rx1158_pos
    .local int rx1158_off
    .local int rx1158_eos
    .local int rx1158_rep
    .local pmc rx1158_cur
    (rx1158_cur, rx1158_pos, rx1158_tgt) = self."!cursor_start"()
    rx1158_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1158_cur
    .local pmc match
    .lex "$/", match
    length rx1158_eos, rx1158_tgt
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
.annotate "line", 499
  # rx subcapture "sym"
    set_addr $I10, rxcap_1163_fail
    rx1158_cur."!mark_push"(0, rx1158_pos, $I10)
  # rx literal  ":="
    add $I11, rx1158_pos, 2
    gt $I11, rx1158_eos, rx1158_fail
    sub $I11, rx1158_pos, rx1158_off
    substr $S10, rx1158_tgt, $I11, 2
    ne $S10, ":=", rx1158_fail
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
    $P10 = rx1158_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1158_fail
    rx1158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1158_pos = $P10."pos"()
  # rx pass
    rx1158_cur."!cursor_pass"(rx1158_pos, "infix:sym<:=>")
    rx1158_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1158_pos)
    .return (rx1158_cur)
  rx1158_fail:
.annotate "line", 400
    (rx1158_rep, rx1158_pos, $I10, $P10) = rx1158_cur."!mark_fail"(0)
    lt rx1158_pos, -1, rx1158_done
    eq rx1158_pos, -1, rx1158_fail
    jump $I10
  rx1158_done:
    rx1158_cur."!cursor_fail"()
    rx1158_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1158_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("298_1259420191.48826") :method
.annotate "line", 400
    $P1160 = self."!PREFIX__!subrule"("O", ":=")
    new $P1161, "ResizablePMCArray"
    push $P1161, $P1160
    .return ($P1161)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("299_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1165_tgt
    .local int rx1165_pos
    .local int rx1165_off
    .local int rx1165_eos
    .local int rx1165_rep
    .local pmc rx1165_cur
    (rx1165_cur, rx1165_pos, rx1165_tgt) = self."!cursor_start"()
    rx1165_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1165_cur
    .local pmc match
    .lex "$/", match
    length rx1165_eos, rx1165_tgt
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
.annotate "line", 500
  # rx subcapture "sym"
    set_addr $I10, rxcap_1170_fail
    rx1165_cur."!mark_push"(0, rx1165_pos, $I10)
  # rx literal  "::="
    add $I11, rx1165_pos, 3
    gt $I11, rx1165_eos, rx1165_fail
    sub $I11, rx1165_pos, rx1165_off
    substr $S10, rx1165_tgt, $I11, 3
    ne $S10, "::=", rx1165_fail
    add rx1165_pos, 3
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
    $P10 = rx1165_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1165_fail
    rx1165_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1165_pos = $P10."pos"()
  # rx pass
    rx1165_cur."!cursor_pass"(rx1165_pos, "infix:sym<::=>")
    rx1165_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1165_pos)
    .return (rx1165_cur)
  rx1165_fail:
.annotate "line", 400
    (rx1165_rep, rx1165_pos, $I10, $P10) = rx1165_cur."!mark_fail"(0)
    lt rx1165_pos, -1, rx1165_done
    eq rx1165_pos, -1, rx1165_fail
    jump $I10
  rx1165_done:
    rx1165_cur."!cursor_fail"()
    rx1165_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1165_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("300_1259420191.48826") :method
.annotate "line", 400
    $P1167 = self."!PREFIX__!subrule"("O", "::=")
    new $P1168, "ResizablePMCArray"
    push $P1168, $P1167
    .return ($P1168)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("301_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    (rx1172_cur, rx1172_pos, rx1172_tgt) = self."!cursor_start"()
    rx1172_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1172_cur
    .local pmc match
    .lex "$/", match
    length rx1172_eos, rx1172_tgt
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
.annotate "line", 502
  # rx subcapture "sym"
    set_addr $I10, rxcap_1177_fail
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  # rx literal  ","
    add $I11, rx1172_pos, 1
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    substr $S10, rx1172_tgt, $I11, 1
    ne $S10, ",", rx1172_fail
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
    $P10 = rx1172_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1172_fail
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1172_pos = $P10."pos"()
  # rx pass
    rx1172_cur."!cursor_pass"(rx1172_pos, "infix:sym<,>")
    rx1172_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1172_pos)
    .return (rx1172_cur)
  rx1172_fail:
.annotate "line", 400
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    rx1172_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1172_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("302_1259420191.48826") :method
.annotate "line", 400
    $P1174 = self."!PREFIX__!subrule"("O", ",")
    new $P1175, "ResizablePMCArray"
    push $P1175, $P1174
    .return ($P1175)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("303_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1179_tgt
    .local int rx1179_pos
    .local int rx1179_off
    .local int rx1179_eos
    .local int rx1179_rep
    .local pmc rx1179_cur
    (rx1179_cur, rx1179_pos, rx1179_tgt) = self."!cursor_start"()
    rx1179_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1179_cur
    .local pmc match
    .lex "$/", match
    length rx1179_eos, rx1179_tgt
    set rx1179_off, 0
    lt rx1179_pos, 2, rx1179_start
    sub rx1179_off, rx1179_pos, 1
    substr rx1179_tgt, rx1179_tgt, rx1179_off
  rx1179_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1182_done
    goto rxscan1182_scan
  rxscan1182_loop:
    ($P10) = rx1179_cur."from"()
    inc $P10
    set rx1179_pos, $P10
    ge rx1179_pos, rx1179_eos, rxscan1182_done
  rxscan1182_scan:
    set_addr $I10, rxscan1182_loop
    rx1179_cur."!mark_push"(0, rx1179_pos, $I10)
  rxscan1182_done:
.annotate "line", 504
  # rx subcapture "sym"
    set_addr $I10, rxcap_1183_fail
    rx1179_cur."!mark_push"(0, rx1179_pos, $I10)
  # rx literal  "return"
    add $I11, rx1179_pos, 6
    gt $I11, rx1179_eos, rx1179_fail
    sub $I11, rx1179_pos, rx1179_off
    substr $S10, rx1179_tgt, $I11, 6
    ne $S10, "return", rx1179_fail
    add rx1179_pos, 6
    set_addr $I10, rxcap_1183_fail
    ($I12, $I11) = rx1179_cur."!mark_peek"($I10)
    rx1179_cur."!cursor_pos"($I11)
    ($P10) = rx1179_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1179_pos, "")
    rx1179_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1183_done
  rxcap_1183_fail:
    goto rx1179_fail
  rxcap_1183_done:
  # rx charclass s
    ge rx1179_pos, rx1179_eos, rx1179_fail
    sub $I10, rx1179_pos, rx1179_off
    is_cclass $I11, 32, rx1179_tgt, $I10
    unless $I11, rx1179_fail
    inc rx1179_pos
  # rx subrule "O" subtype=capture negate=
    rx1179_cur."!cursor_pos"(rx1179_pos)
    $P10 = rx1179_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1179_fail
    rx1179_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1179_pos = $P10."pos"()
  # rx pass
    rx1179_cur."!cursor_pass"(rx1179_pos, "prefix:sym<return>")
    rx1179_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1179_pos)
    .return (rx1179_cur)
  rx1179_fail:
.annotate "line", 400
    (rx1179_rep, rx1179_pos, $I10, $P10) = rx1179_cur."!mark_fail"(0)
    lt rx1179_pos, -1, rx1179_done
    eq rx1179_pos, -1, rx1179_fail
    jump $I10
  rx1179_done:
    rx1179_cur."!cursor_fail"()
    rx1179_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1179_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("304_1259420191.48826") :method
.annotate "line", 400
    new $P1181, "ResizablePMCArray"
    push $P1181, "return"
    .return ($P1181)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("305_1259420191.48826") :method :outer("11_1259420191.48826")
.annotate "line", 400
    .local string rx1185_tgt
    .local int rx1185_pos
    .local int rx1185_off
    .local int rx1185_eos
    .local int rx1185_rep
    .local pmc rx1185_cur
    (rx1185_cur, rx1185_pos, rx1185_tgt) = self."!cursor_start"()
    rx1185_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1185_cur
    .local pmc match
    .lex "$/", match
    length rx1185_eos, rx1185_tgt
    set rx1185_off, 0
    lt rx1185_pos, 2, rx1185_start
    sub rx1185_off, rx1185_pos, 1
    substr rx1185_tgt, rx1185_tgt, rx1185_off
  rx1185_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1188_done
    goto rxscan1188_scan
  rxscan1188_loop:
    ($P10) = rx1185_cur."from"()
    inc $P10
    set rx1185_pos, $P10
    ge rx1185_pos, rx1185_eos, rxscan1188_done
  rxscan1188_scan:
    set_addr $I10, rxscan1188_loop
    rx1185_cur."!mark_push"(0, rx1185_pos, $I10)
  rxscan1188_done:
.annotate "line", 505
  # rx subcapture "sym"
    set_addr $I10, rxcap_1189_fail
    rx1185_cur."!mark_push"(0, rx1185_pos, $I10)
  # rx literal  "make"
    add $I11, rx1185_pos, 4
    gt $I11, rx1185_eos, rx1185_fail
    sub $I11, rx1185_pos, rx1185_off
    substr $S10, rx1185_tgt, $I11, 4
    ne $S10, "make", rx1185_fail
    add rx1185_pos, 4
    set_addr $I10, rxcap_1189_fail
    ($I12, $I11) = rx1185_cur."!mark_peek"($I10)
    rx1185_cur."!cursor_pos"($I11)
    ($P10) = rx1185_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1185_pos, "")
    rx1185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1189_done
  rxcap_1189_fail:
    goto rx1185_fail
  rxcap_1189_done:
  # rx charclass s
    ge rx1185_pos, rx1185_eos, rx1185_fail
    sub $I10, rx1185_pos, rx1185_off
    is_cclass $I11, 32, rx1185_tgt, $I10
    unless $I11, rx1185_fail
    inc rx1185_pos
  # rx subrule "O" subtype=capture negate=
    rx1185_cur."!cursor_pos"(rx1185_pos)
    $P10 = rx1185_cur."O"("%list_prefix")
    unless $P10, rx1185_fail
    rx1185_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1185_pos = $P10."pos"()
  # rx pass
    rx1185_cur."!cursor_pass"(rx1185_pos, "prefix:sym<make>")
    rx1185_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1185_pos)
    .return (rx1185_cur)
  rx1185_fail:
.annotate "line", 400
    (rx1185_rep, rx1185_pos, $I10, $P10) = rx1185_cur."!mark_fail"(0)
    lt rx1185_pos, -1, rx1185_done
    eq rx1185_pos, -1, rx1185_fail
    jump $I10
  rx1185_done:
    rx1185_cur."!cursor_fail"()
    rx1185_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1185_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("306_1259420191.48826") :method
.annotate "line", 400
    new $P1187, "ResizablePMCArray"
    push $P1187, "make"
    .return ($P1187)
.end


.namespace ["NQP";"Regex"]
.sub "_block1190"  :subid("307_1259420191.48826") :outer("11_1259420191.48826")
.annotate "line", 508
    .const 'Sub' $P1224 = "318_1259420191.48826" 
    capture_lex $P1224
    .const 'Sub' $P1211 = "315_1259420191.48826" 
    capture_lex $P1211
    .const 'Sub' $P1206 = "313_1259420191.48826" 
    capture_lex $P1206
    .const 'Sub' $P1201 = "311_1259420191.48826" 
    capture_lex $P1201
    .const 'Sub' $P1192 = "308_1259420191.48826" 
    capture_lex $P1192
    .const 'Sub' $P1224 = "318_1259420191.48826" 
    capture_lex $P1224
    .return ($P1224)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("308_1259420191.48826") :method :outer("307_1259420191.48826")
.annotate "line", 508
    .const 'Sub' $P1198 = "310_1259420191.48826" 
    capture_lex $P1198
    .local string rx1193_tgt
    .local int rx1193_pos
    .local int rx1193_off
    .local int rx1193_eos
    .local int rx1193_rep
    .local pmc rx1193_cur
    (rx1193_cur, rx1193_pos, rx1193_tgt) = self."!cursor_start"()
    rx1193_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1193_cur
    .local pmc match
    .lex "$/", match
    length rx1193_eos, rx1193_tgt
    set rx1193_off, 0
    lt rx1193_pos, 2, rx1193_start
    sub rx1193_off, rx1193_pos, 1
    substr rx1193_tgt, rx1193_tgt, rx1193_off
  rx1193_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1196_done
    goto rxscan1196_scan
  rxscan1196_loop:
    ($P10) = rx1193_cur."from"()
    inc $P10
    set rx1193_pos, $P10
    ge rx1193_pos, rx1193_eos, rxscan1196_done
  rxscan1196_scan:
    set_addr $I10, rxscan1196_loop
    rx1193_cur."!mark_push"(0, rx1193_pos, $I10)
  rxscan1196_done:
.annotate "line", 510
  # rx literal  ":"
    add $I11, rx1193_pos, 1
    gt $I11, rx1193_eos, rx1193_fail
    sub $I11, rx1193_pos, rx1193_off
    substr $S10, rx1193_tgt, $I11, 1
    ne $S10, ":", rx1193_fail
    add rx1193_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1193_cur."!cursor_pos"(rx1193_pos)
    .const 'Sub' $P1198 = "310_1259420191.48826" 
    capture_lex $P1198
    $P10 = rx1193_cur."before"($P1198)
    unless $P10, rx1193_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1193_cur."!cursor_pos"(rx1193_pos)
    $P10 = rx1193_cur."LANG"("MAIN", "statement")
    unless $P10, rx1193_fail
    rx1193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1193_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1193_cur."!cursor_pos"(rx1193_pos)
    $P10 = rx1193_cur."ws"()
    unless $P10, rx1193_fail
    rx1193_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1193_pos, 1
    gt $I11, rx1193_eos, rx1193_fail
    sub $I11, rx1193_pos, rx1193_off
    substr $S10, rx1193_tgt, $I11, 1
    ne $S10, ";", rx1193_fail
    add rx1193_pos, 1
.annotate "line", 509
  # rx pass
    rx1193_cur."!cursor_pass"(rx1193_pos, "metachar:sym<:my>")
    rx1193_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1193_pos)
    .return (rx1193_cur)
  rx1193_fail:
.annotate "line", 508
    (rx1193_rep, rx1193_pos, $I10, $P10) = rx1193_cur."!mark_fail"(0)
    lt rx1193_pos, -1, rx1193_done
    eq rx1193_pos, -1, rx1193_fail
    jump $I10
  rx1193_done:
    rx1193_cur."!cursor_fail"()
    rx1193_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1193_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("309_1259420191.48826") :method
.annotate "line", 508
    new $P1195, "ResizablePMCArray"
    push $P1195, ":"
    .return ($P1195)
.end


.namespace ["NQP";"Regex"]
.sub "_block1197"  :anon :subid("310_1259420191.48826") :method :outer("308_1259420191.48826")
.annotate "line", 510
    .local string rx1199_tgt
    .local int rx1199_pos
    .local int rx1199_off
    .local int rx1199_eos
    .local int rx1199_rep
    .local pmc rx1199_cur
    (rx1199_cur, rx1199_pos, rx1199_tgt) = self."!cursor_start"()
    rx1199_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1199_cur
    .local pmc match
    .lex "$/", match
    length rx1199_eos, rx1199_tgt
    set rx1199_off, 0
    lt rx1199_pos, 2, rx1199_start
    sub rx1199_off, rx1199_pos, 1
    substr rx1199_tgt, rx1199_tgt, rx1199_off
  rx1199_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1200_done
    goto rxscan1200_scan
  rxscan1200_loop:
    ($P10) = rx1199_cur."from"()
    inc $P10
    set rx1199_pos, $P10
    ge rx1199_pos, rx1199_eos, rxscan1200_done
  rxscan1200_scan:
    set_addr $I10, rxscan1200_loop
    rx1199_cur."!mark_push"(0, rx1199_pos, $I10)
  rxscan1200_done:
  # rx literal  "my"
    add $I11, rx1199_pos, 2
    gt $I11, rx1199_eos, rx1199_fail
    sub $I11, rx1199_pos, rx1199_off
    substr $S10, rx1199_tgt, $I11, 2
    ne $S10, "my", rx1199_fail
    add rx1199_pos, 2
  # rx pass
    rx1199_cur."!cursor_pass"(rx1199_pos, "")
    rx1199_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1199_pos)
    .return (rx1199_cur)
  rx1199_fail:
    (rx1199_rep, rx1199_pos, $I10, $P10) = rx1199_cur."!mark_fail"(0)
    lt rx1199_pos, -1, rx1199_done
    eq rx1199_pos, -1, rx1199_fail
    jump $I10
  rx1199_done:
    rx1199_cur."!cursor_fail"()
    rx1199_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1199_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("311_1259420191.48826") :method :outer("307_1259420191.48826")
.annotate "line", 508
    .local string rx1202_tgt
    .local int rx1202_pos
    .local int rx1202_off
    .local int rx1202_eos
    .local int rx1202_rep
    .local pmc rx1202_cur
    (rx1202_cur, rx1202_pos, rx1202_tgt) = self."!cursor_start"()
    rx1202_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1202_cur
    .local pmc match
    .lex "$/", match
    length rx1202_eos, rx1202_tgt
    set rx1202_off, 0
    lt rx1202_pos, 2, rx1202_start
    sub rx1202_off, rx1202_pos, 1
    substr rx1202_tgt, rx1202_tgt, rx1202_off
  rx1202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1202_cur."from"()
    inc $P10
    set rx1202_pos, $P10
    ge rx1202_pos, rx1202_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  rxscan1205_done:
.annotate "line", 514
  # rx enumcharlist negate=0 zerowidth
    ge rx1202_pos, rx1202_eos, rx1202_fail
    sub $I10, rx1202_pos, rx1202_off
    substr $S10, rx1202_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1202_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1202_cur."!cursor_pos"(rx1202_pos)
    $P10 = rx1202_cur."codeblock"()
    unless $P10, rx1202_fail
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1202_pos = $P10."pos"()
.annotate "line", 513
  # rx pass
    rx1202_cur."!cursor_pass"(rx1202_pos, "metachar:sym<{ }>")
    rx1202_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1202_pos)
    .return (rx1202_cur)
  rx1202_fail:
.annotate "line", 508
    (rx1202_rep, rx1202_pos, $I10, $P10) = rx1202_cur."!mark_fail"(0)
    lt rx1202_pos, -1, rx1202_done
    eq rx1202_pos, -1, rx1202_fail
    jump $I10
  rx1202_done:
    rx1202_cur."!cursor_fail"()
    rx1202_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1202_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("312_1259420191.48826") :method
.annotate "line", 508
    new $P1204, "ResizablePMCArray"
    push $P1204, "{"
    .return ($P1204)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("313_1259420191.48826") :method :outer("307_1259420191.48826")
.annotate "line", 508
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    (rx1207_cur, rx1207_pos, rx1207_tgt) = self."!cursor_start"()
    rx1207_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1207_cur
    .local pmc match
    .lex "$/", match
    length rx1207_eos, rx1207_tgt
    set rx1207_off, 0
    lt rx1207_pos, 2, rx1207_start
    sub rx1207_off, rx1207_pos, 1
    substr rx1207_tgt, rx1207_tgt, rx1207_off
  rx1207_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1210_done
    goto rxscan1210_scan
  rxscan1210_loop:
    ($P10) = rx1207_cur."from"()
    inc $P10
    set rx1207_pos, $P10
    ge rx1207_pos, rx1207_eos, rxscan1210_done
  rxscan1210_scan:
    set_addr $I10, rxscan1210_loop
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  rxscan1210_done:
.annotate "line", 518
  # rx enumcharlist negate=0 zerowidth
    ge rx1207_pos, rx1207_eos, rx1207_fail
    sub $I10, rx1207_pos, rx1207_off
    substr $S10, rx1207_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1207_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1207_cur."!cursor_pos"(rx1207_pos)
    $P10 = rx1207_cur."codeblock"()
    unless $P10, rx1207_fail
    rx1207_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1207_pos = $P10."pos"()
.annotate "line", 517
  # rx pass
    rx1207_cur."!cursor_pass"(rx1207_pos, "assertion:sym<{ }>")
    rx1207_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1207_pos)
    .return (rx1207_cur)
  rx1207_fail:
.annotate "line", 508
    (rx1207_rep, rx1207_pos, $I10, $P10) = rx1207_cur."!mark_fail"(0)
    lt rx1207_pos, -1, rx1207_done
    eq rx1207_pos, -1, rx1207_fail
    jump $I10
  rx1207_done:
    rx1207_cur."!cursor_fail"()
    rx1207_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1207_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("314_1259420191.48826") :method
.annotate "line", 508
    new $P1209, "ResizablePMCArray"
    push $P1209, "{"
    .return ($P1209)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("315_1259420191.48826") :method :outer("307_1259420191.48826")
.annotate "line", 508
    .const 'Sub' $P1220 = "317_1259420191.48826" 
    capture_lex $P1220
    .local string rx1212_tgt
    .local int rx1212_pos
    .local int rx1212_off
    .local int rx1212_eos
    .local int rx1212_rep
    .local pmc rx1212_cur
    (rx1212_cur, rx1212_pos, rx1212_tgt) = self."!cursor_start"()
    rx1212_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1212_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1212_cur
    .local pmc match
    .lex "$/", match
    length rx1212_eos, rx1212_tgt
    set rx1212_off, 0
    lt rx1212_pos, 2, rx1212_start
    sub rx1212_off, rx1212_pos, 1
    substr rx1212_tgt, rx1212_tgt, rx1212_off
  rx1212_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1215_done
    goto rxscan1215_scan
  rxscan1215_loop:
    ($P10) = rx1212_cur."from"()
    inc $P10
    set rx1212_pos, $P10
    ge rx1212_pos, rx1212_eos, rxscan1215_done
  rxscan1215_scan:
    set_addr $I10, rxscan1215_loop
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
  rxscan1215_done:
.annotate "line", 522
  # rx subcapture "longname"
    set_addr $I10, rxcap_1216_fail
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1212_pos, rx1212_off
    find_not_cclass $I11, 8192, rx1212_tgt, $I10, rx1212_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1212_fail
    add rx1212_pos, rx1212_off, $I11
    set_addr $I10, rxcap_1216_fail
    ($I12, $I11) = rx1212_cur."!mark_peek"($I10)
    rx1212_cur."!cursor_pos"($I11)
    ($P10) = rx1212_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1212_pos, "")
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1216_done
  rxcap_1216_fail:
    goto rx1212_fail
  rxcap_1216_done:
.annotate "line", 529
  # rx rxquantr1217 ** 0..1
    set_addr $I1223, rxquantr1217_done
    rx1212_cur."!mark_push"(0, rx1212_pos, $I1223)
  rxquantr1217_loop:
  alt1218_0:
.annotate "line", 523
    set_addr $I10, alt1218_1
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
.annotate "line", 524
  # rx subrule "before" subtype=zerowidth negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    .const 'Sub' $P1220 = "317_1259420191.48826" 
    capture_lex $P1220
    $P10 = rx1212_cur."before"($P1220)
    unless $P10, rx1212_fail
    goto alt1218_end
  alt1218_1:
    set_addr $I10, alt1218_2
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
.annotate "line", 525
  # rx literal  "="
    add $I11, rx1212_pos, 1
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I11, 1
    ne $S10, "=", rx1212_fail
    add rx1212_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."assertion"()
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1212_pos = $P10."pos"()
    goto alt1218_end
  alt1218_2:
    set_addr $I10, alt1218_3
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
.annotate "line", 526
  # rx literal  ":"
    add $I11, rx1212_pos, 1
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I11, 1
    ne $S10, ":", rx1212_fail
    add rx1212_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."arglist"()
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1212_pos = $P10."pos"()
    goto alt1218_end
  alt1218_3:
    set_addr $I10, alt1218_4
    rx1212_cur."!mark_push"(0, rx1212_pos, $I10)
.annotate "line", 527
  # rx literal  "("
    add $I11, rx1212_pos, 1
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I11, 1
    ne $S10, "(", rx1212_fail
    add rx1212_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1212_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1212_pos, 1
    gt $I11, rx1212_eos, rx1212_fail
    sub $I11, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I11, 1
    ne $S10, ")", rx1212_fail
    add rx1212_pos, 1
    goto alt1218_end
  alt1218_4:
.annotate "line", 528
  # rx subrule "normspace" subtype=method negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."normspace"()
    unless $P10, rx1212_fail
    rx1212_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."nibbler"()
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1212_pos = $P10."pos"()
  alt1218_end:
.annotate "line", 529
    (rx1212_rep) = rx1212_cur."!mark_commit"($I1223)
  rxquantr1217_done:
.annotate "line", 521
  # rx pass
    rx1212_cur."!cursor_pass"(rx1212_pos, "assertion:sym<name>")
    rx1212_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1212_pos)
    .return (rx1212_cur)
  rx1212_fail:
.annotate "line", 508
    (rx1212_rep, rx1212_pos, $I10, $P10) = rx1212_cur."!mark_fail"(0)
    lt rx1212_pos, -1, rx1212_done
    eq rx1212_pos, -1, rx1212_fail
    jump $I10
  rx1212_done:
    rx1212_cur."!cursor_fail"()
    rx1212_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1212_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("316_1259420191.48826") :method
.annotate "line", 508
    new $P1214, "ResizablePMCArray"
    push $P1214, ""
    .return ($P1214)
.end


.namespace ["NQP";"Regex"]
.sub "_block1219"  :anon :subid("317_1259420191.48826") :method :outer("315_1259420191.48826")
.annotate "line", 524
    .local string rx1221_tgt
    .local int rx1221_pos
    .local int rx1221_off
    .local int rx1221_eos
    .local int rx1221_rep
    .local pmc rx1221_cur
    (rx1221_cur, rx1221_pos, rx1221_tgt) = self."!cursor_start"()
    rx1221_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1222_done
    goto rxscan1222_scan
  rxscan1222_loop:
    ($P10) = rx1221_cur."from"()
    inc $P10
    set rx1221_pos, $P10
    ge rx1221_pos, rx1221_eos, rxscan1222_done
  rxscan1222_scan:
    set_addr $I10, rxscan1222_loop
    rx1221_cur."!mark_push"(0, rx1221_pos, $I10)
  rxscan1222_done:
  # rx literal  ">"
    add $I11, rx1221_pos, 1
    gt $I11, rx1221_eos, rx1221_fail
    sub $I11, rx1221_pos, rx1221_off
    substr $S10, rx1221_tgt, $I11, 1
    ne $S10, ">", rx1221_fail
    add rx1221_pos, 1
  # rx pass
    rx1221_cur."!cursor_pass"(rx1221_pos, "")
    rx1221_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1221_pos)
    .return (rx1221_cur)
  rx1221_fail:
    (rx1221_rep, rx1221_pos, $I10, $P10) = rx1221_cur."!mark_fail"(0)
    lt rx1221_pos, -1, rx1221_done
    eq rx1221_pos, -1, rx1221_fail
    jump $I10
  rx1221_done:
    rx1221_cur."!cursor_fail"()
    rx1221_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1221_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("318_1259420191.48826") :method :outer("307_1259420191.48826")
.annotate "line", 508
    .local string rx1225_tgt
    .local int rx1225_pos
    .local int rx1225_off
    .local int rx1225_eos
    .local int rx1225_rep
    .local pmc rx1225_cur
    (rx1225_cur, rx1225_pos, rx1225_tgt) = self."!cursor_start"()
    rx1225_cur."!cursor_debug"("START ", "codeblock")
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
.annotate "line", 534
  # rx subrule "LANG" subtype=capture negate=
    rx1225_cur."!cursor_pos"(rx1225_pos)
    $P10 = rx1225_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1225_fail
    rx1225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1225_pos = $P10."pos"()
.annotate "line", 533
  # rx pass
    rx1225_cur."!cursor_pass"(rx1225_pos, "codeblock")
    rx1225_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1225_pos)
    .return (rx1225_cur)
  rx1225_fail:
.annotate "line", 508
    (rx1225_rep, rx1225_pos, $I10, $P10) = rx1225_cur."!mark_fail"(0)
    lt rx1225_pos, -1, rx1225_done
    eq rx1225_pos, -1, rx1225_fail
    jump $I10
  rx1225_done:
    rx1225_cur."!cursor_fail"()
    rx1225_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1225_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("319_1259420191.48826") :method
.annotate "line", 508
    $P1227 = self."!PREFIX__!subrule"("block", "")
    new $P1228, "ResizablePMCArray"
    push $P1228, $P1227
    .return ($P1228)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259420199.1428")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2058 = $P14()
.annotate "line", 1
    .return ($P2058)
.end


.namespace []
.sub "" :load :init :subid("post119") :outer("10_1259420199.1428")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259420199.1428" 
    .local pmc block
    set block, $P12
    $P2059 = get_root_global ["parrot"], "P6metaclass"
    $P2059."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1259420199.1428") :outer("10_1259420199.1428")
.annotate "line", 3
    .const 'Sub' $P2054 = "118_1259420199.1428" 
    capture_lex $P2054
    get_hll_global $P1990, ["NQP";"RegexActions"], "_block1989" 
    capture_lex $P1990
    .const 'Sub' $P1977 = "112_1259420199.1428" 
    capture_lex $P1977
    .const 'Sub' $P1967 = "111_1259420199.1428" 
    capture_lex $P1967
    .const 'Sub' $P1957 = "110_1259420199.1428" 
    capture_lex $P1957
    .const 'Sub' $P1947 = "109_1259420199.1428" 
    capture_lex $P1947
    .const 'Sub' $P1933 = "108_1259420199.1428" 
    capture_lex $P1933
    .const 'Sub' $P1923 = "107_1259420199.1428" 
    capture_lex $P1923
    .const 'Sub' $P1909 = "106_1259420199.1428" 
    capture_lex $P1909
    .const 'Sub' $P1899 = "105_1259420199.1428" 
    capture_lex $P1899
    .const 'Sub' $P1889 = "104_1259420199.1428" 
    capture_lex $P1889
    .const 'Sub' $P1879 = "103_1259420199.1428" 
    capture_lex $P1879
    .const 'Sub' $P1869 = "102_1259420199.1428" 
    capture_lex $P1869
    .const 'Sub' $P1859 = "101_1259420199.1428" 
    capture_lex $P1859
    .const 'Sub' $P1831 = "100_1259420199.1428" 
    capture_lex $P1831
    .const 'Sub' $P1814 = "99_1259420199.1428" 
    capture_lex $P1814
    .const 'Sub' $P1804 = "98_1259420199.1428" 
    capture_lex $P1804
    .const 'Sub' $P1792 = "97_1259420199.1428" 
    capture_lex $P1792
    .const 'Sub' $P1780 = "96_1259420199.1428" 
    capture_lex $P1780
    .const 'Sub' $P1768 = "95_1259420199.1428" 
    capture_lex $P1768
    .const 'Sub' $P1758 = "94_1259420199.1428" 
    capture_lex $P1758
    .const 'Sub' $P1729 = "93_1259420199.1428" 
    capture_lex $P1729
    .const 'Sub' $P1705 = "92_1259420199.1428" 
    capture_lex $P1705
    .const 'Sub' $P1695 = "91_1259420199.1428" 
    capture_lex $P1695
    .const 'Sub' $P1668 = "90_1259420199.1428" 
    capture_lex $P1668
    .const 'Sub' $P1650 = "89_1259420199.1428" 
    capture_lex $P1650
    .const 'Sub' $P1640 = "88_1259420199.1428" 
    capture_lex $P1640
    .const 'Sub' $P1556 = "85_1259420199.1428" 
    capture_lex $P1556
    .const 'Sub' $P1546 = "84_1259420199.1428" 
    capture_lex $P1546
    .const 'Sub' $P1517 = "83_1259420199.1428" 
    capture_lex $P1517
    .const 'Sub' $P1475 = "82_1259420199.1428" 
    capture_lex $P1475
    .const 'Sub' $P1459 = "81_1259420199.1428" 
    capture_lex $P1459
    .const 'Sub' $P1450 = "80_1259420199.1428" 
    capture_lex $P1450
    .const 'Sub' $P1418 = "79_1259420199.1428" 
    capture_lex $P1418
    .const 'Sub' $P1331 = "77_1259420199.1428" 
    capture_lex $P1331
    .const 'Sub' $P1314 = "76_1259420199.1428" 
    capture_lex $P1314
    .const 'Sub' $P1294 = "75_1259420199.1428" 
    capture_lex $P1294
    .const 'Sub' $P1210 = "74_1259420199.1428" 
    capture_lex $P1210
    .const 'Sub' $P1186 = "72_1259420199.1428" 
    capture_lex $P1186
    .const 'Sub' $P1152 = "70_1259420199.1428" 
    capture_lex $P1152
    .const 'Sub' $P1106 = "68_1259420199.1428" 
    capture_lex $P1106
    .const 'Sub' $P1096 = "67_1259420199.1428" 
    capture_lex $P1096
    .const 'Sub' $P1086 = "66_1259420199.1428" 
    capture_lex $P1086
    .const 'Sub' $P1015 = "64_1259420199.1428" 
    capture_lex $P1015
    .const 'Sub' $P998 = "63_1259420199.1428" 
    capture_lex $P998
    .const 'Sub' $P988 = "62_1259420199.1428" 
    capture_lex $P988
    .const 'Sub' $P978 = "61_1259420199.1428" 
    capture_lex $P978
    .const 'Sub' $P968 = "60_1259420199.1428" 
    capture_lex $P968
    .const 'Sub' $P944 = "59_1259420199.1428" 
    capture_lex $P944
    .const 'Sub' $P891 = "58_1259420199.1428" 
    capture_lex $P891
    .const 'Sub' $P881 = "57_1259420199.1428" 
    capture_lex $P881
    .const 'Sub' $P792 = "55_1259420199.1428" 
    capture_lex $P792
    .const 'Sub' $P766 = "54_1259420199.1428" 
    capture_lex $P766
    .const 'Sub' $P756 = "53_1259420199.1428" 
    capture_lex $P756
    .const 'Sub' $P746 = "52_1259420199.1428" 
    capture_lex $P746
    .const 'Sub' $P736 = "51_1259420199.1428" 
    capture_lex $P736
    .const 'Sub' $P726 = "50_1259420199.1428" 
    capture_lex $P726
    .const 'Sub' $P716 = "49_1259420199.1428" 
    capture_lex $P716
    .const 'Sub' $P706 = "48_1259420199.1428" 
    capture_lex $P706
    .const 'Sub' $P696 = "47_1259420199.1428" 
    capture_lex $P696
    .const 'Sub' $P686 = "46_1259420199.1428" 
    capture_lex $P686
    .const 'Sub' $P676 = "45_1259420199.1428" 
    capture_lex $P676
    .const 'Sub' $P666 = "44_1259420199.1428" 
    capture_lex $P666
    .const 'Sub' $P656 = "43_1259420199.1428" 
    capture_lex $P656
    .const 'Sub' $P646 = "42_1259420199.1428" 
    capture_lex $P646
    .const 'Sub' $P628 = "41_1259420199.1428" 
    capture_lex $P628
    .const 'Sub' $P593 = "40_1259420199.1428" 
    capture_lex $P593
    .const 'Sub' $P577 = "39_1259420199.1428" 
    capture_lex $P577
    .const 'Sub' $P556 = "38_1259420199.1428" 
    capture_lex $P556
    .const 'Sub' $P536 = "37_1259420199.1428" 
    capture_lex $P536
    .const 'Sub' $P523 = "36_1259420199.1428" 
    capture_lex $P523
    .const 'Sub' $P497 = "35_1259420199.1428" 
    capture_lex $P497
    .const 'Sub' $P461 = "34_1259420199.1428" 
    capture_lex $P461
    .const 'Sub' $P444 = "33_1259420199.1428" 
    capture_lex $P444
    .const 'Sub' $P430 = "32_1259420199.1428" 
    capture_lex $P430
    .const 'Sub' $P375 = "30_1259420199.1428" 
    capture_lex $P375
    .const 'Sub' $P362 = "29_1259420199.1428" 
    capture_lex $P362
    .const 'Sub' $P343 = "28_1259420199.1428" 
    capture_lex $P343
    .const 'Sub' $P333 = "27_1259420199.1428" 
    capture_lex $P333
    .const 'Sub' $P323 = "26_1259420199.1428" 
    capture_lex $P323
    .const 'Sub' $P307 = "25_1259420199.1428" 
    capture_lex $P307
    .const 'Sub' $P229 = "23_1259420199.1428" 
    capture_lex $P229
    .const 'Sub' $P186 = "21_1259420199.1428" 
    capture_lex $P186
    .const 'Sub' $P167 = "20_1259420199.1428" 
    capture_lex $P167
    .const 'Sub' $P143 = "19_1259420199.1428" 
    capture_lex $P143
    .const 'Sub' $P133 = "18_1259420199.1428" 
    capture_lex $P133
    .const 'Sub' $P79 = "17_1259420199.1428" 
    capture_lex $P79
    .const 'Sub' $P61 = "16_1259420199.1428" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1259420199.1428" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1259420199.1428" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_122
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_122:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1259420199.1428" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1259420199.1428" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1259420199.1428" 
    capture_lex $P61
    .lex "sigiltype", $P61
.annotate "line", 179
    .const 'Sub' $P79 = "17_1259420199.1428" 
    capture_lex $P79
    .lex "push_block_handler", $P79
.annotate "line", 3
    get_global $P129, "@BLOCK"
.annotate "line", 5
    find_lex $P130, "xblock_immediate"
    find_lex $P131, "block_immediate"
    find_lex $P132, "sigiltype"
.annotate "line", 172
    find_lex $P576, "push_block_handler"
.annotate "line", 714
    get_hll_global $P1990, ["NQP";"RegexActions"], "_block1989" 
    capture_lex $P1990
    $P2052 = $P1990()
.annotate "line", 3
    .return ($P2052)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post120") :outer("11_1259420199.1428")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2054 = "118_1259420199.1428" 
    capture_lex $P2054
    $P2054()
    $P2057 = get_root_global ["parrot"], "P6metaclass"
    $P2057."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2053"  :anon :subid("118_1259420199.1428") :outer("11_1259420199.1428")
.annotate "line", 6
    get_global $P2055, "@BLOCK"
    unless_null $P2055, vivify_121
    new $P2055, "ResizablePMCArray"
    set_global "@BLOCK", $P2055
  vivify_121:
 $P2056 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2056
.annotate "line", 5
    .return ($P2056)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1259420199.1428") :outer("11_1259420199.1428")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_123
    new $P20, "ResizablePMCArray"
  vivify_123:
    set $P21, $P20[1]
    unless_null $P21, vivify_124
    new $P21, "Undef"
  vivify_124:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_125
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_125:
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
.sub "block_immediate"  :subid("13_1259420199.1428") :outer("11_1259420199.1428")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1259420199.1428" 
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
    .const 'Sub' $P39 = "14_1259420199.1428" 
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
.sub "_block38"  :anon :subid("14_1259420199.1428") :outer("13_1259420199.1428")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1259420199.1428" 
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
    unless $I47, for_undef_126
    iter $P44, $P46
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P44, loop55_done
    shift $P48, $P44
  loop55_redo:
    .const 'Sub' $P50 = "15_1259420199.1428" 
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
  for_undef_126:
.annotate "line", 19
    find_lex $P58, "$stmts"
    store_lex "$block", $P58
.annotate "line", 16
    .return ($P58)
.end


.namespace ["NQP";"Actions"]
.sub "_block49"  :anon :subid("15_1259420199.1428") :outer("14_1259420199.1428")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1259420199.1428") :outer("11_1259420199.1428")
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
.sub "push_block_handler"  :subid("17_1259420199.1428") :outer("11_1259420199.1428")
    .param pmc param_82
    .param pmc param_83
.annotate "line", 179
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "$/", param_82
    .lex "$block", param_83
.annotate "line", 180
    get_global $P85, "@BLOCK"
    unless_null $P85, vivify_127
    new $P85, "ResizablePMCArray"
  vivify_127:
    set $P86, $P85[0]
    unless_null $P86, vivify_128
    new $P86, "Undef"
  vivify_128:
    $P87 = $P86."handlers"()
    if $P87, unless_84_end
.annotate "line", 181
    get_global $P88, "@BLOCK"
    unless_null $P88, vivify_129
    new $P88, "ResizablePMCArray"
  vivify_129:
    set $P89, $P88[0]
    unless_null $P89, vivify_130
    new $P89, "Undef"
  vivify_130:
    new $P90, "ResizablePMCArray"
    $P89."handlers"($P90)
  unless_84_end:
.annotate "line", 183
    find_lex $P92, "$block"
    $P93 = $P92."arity"()
    if $P93, unless_91_end
.annotate "line", 184
    find_lex $P94, "$block"
.annotate "line", 185
    get_hll_global $P95, ["PAST"], "Op"
.annotate "line", 186
    get_hll_global $P96, ["PAST"], "Var"
    $P97 = $P96."new"("lexical" :named("scope"), "$!" :named("name"), 1 :named("isdecl"))
.annotate "line", 187
    get_hll_global $P98, ["PAST"], "Var"
    $P99 = $P98."new"("lexical" :named("scope"), "$_" :named("name"))
    $P100 = $P95."new"($P97, $P99, "bind" :named("pasttype"))
.annotate "line", 185
    $P94."unshift"($P100)
.annotate "line", 190
    find_lex $P101, "$block"
    get_hll_global $P102, ["PAST"], "Var"
    $P103 = $P102."new"("$_" :named("name"), "parameter" :named("scope"))
    $P101."unshift"($P103)
.annotate "line", 191
    find_lex $P104, "$block"
    $P104."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 192
    find_lex $P105, "$block"
    $P105."symbol"("$!", "lexical" :named("scope"))
.annotate "line", 193
    find_lex $P106, "$block"
    $P106."arity"(1)
  unless_91_end:
.annotate "line", 195
    find_lex $P107, "$block"
    $P107."blocktype"("declaration")
.annotate "line", 196
    get_global $P108, "@BLOCK"
    unless_null $P108, vivify_131
    new $P108, "ResizablePMCArray"
  vivify_131:
    set $P109, $P108[0]
    unless_null $P109, vivify_132
    new $P109, "Undef"
  vivify_132:
    $P110 = $P109."handlers"()
.annotate "line", 197
    get_hll_global $P111, ["PAST"], "Control"
    find_lex $P112, "$/"
.annotate "line", 199
    get_hll_global $P113, ["PAST"], "Stmts"
.annotate "line", 200
    get_hll_global $P114, ["PAST"], "Op"
    find_lex $P115, "$block"
.annotate "line", 202
    get_hll_global $P116, ["PAST"], "Var"
    $P117 = $P116."new"("register" :named("scope"), "exception" :named("name"))
    $P118 = $P114."new"($P115, $P117, "call" :named("pasttype"))
.annotate "line", 204
    get_hll_global $P119, ["PAST"], "Op"
.annotate "line", 205
    get_hll_global $P120, ["PAST"], "Var"
.annotate "line", 206
    get_hll_global $P121, ["PAST"], "Var"
    $P122 = $P121."new"("register" :named("scope"), "exception" :named("name"))
    $P123 = $P120."new"($P122, "handled", "keyed" :named("scope"))
.annotate "line", 205
    $P124 = $P119."new"($P123, 1, "bind" :named("pasttype"))
.annotate "line", 204
    $P125 = $P113."new"($P118, $P124)
.annotate "line", 199
    $P126 = $P111."new"($P125, $P112 :named("node"))
.annotate "line", 197
    $P127 = $P110."unshift"($P126)
.annotate "line", 179
    .return ($P127)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("18_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_136
.annotate "line", 30
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "self", self
    .lex "$/", param_136
    find_lex $P137, "$/"
    find_lex $P138, "$/"
    unless_null $P138, vivify_133
    new $P138, "Hash"
  vivify_133:
    set $P139, $P138["comp_unit"]
    unless_null $P139, vivify_134
    new $P139, "Undef"
  vivify_134:
    $P140 = $P139."ast"()
    $P141 = $P137."!make"($P140)
    .return ($P141)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P142, exception, "payload"
    .return ($P142)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("19_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_146
.annotate "line", 32
    new $P145, 'ExceptionHandler'
    set_addr $P145, control_144
    $P145."handle_types"(58)
    push_eh $P145
    .lex "self", self
    .lex "$/", param_146
.annotate "line", 33
    find_lex $P147, "$/"
    find_lex $P150, "$/"
    unless_null $P150, vivify_135
    new $P150, "Hash"
  vivify_135:
    set $P151, $P150["sym"]
    unless_null $P151, vivify_136
    new $P151, "Undef"
  vivify_136:
    if $P151, if_149
    find_lex $P163, "$/"
    set $S164, $P163
    new $P148, 'String'
    set $P148, $S164
    goto if_149_end
  if_149:
    find_lex $P152, "$/"
    unless_null $P152, vivify_137
    new $P152, "Hash"
  vivify_137:
    set $P153, $P152["identifier"]
    unless_null $P153, vivify_138
    new $P153, "Undef"
  vivify_138:
    set $S154, $P153
    new $P155, 'String'
    set $P155, $S154
    concat $P156, $P155, ":sym<"
    find_lex $P157, "$/"
    unless_null $P157, vivify_139
    new $P157, "Hash"
  vivify_139:
    set $P158, $P157["sym"]
    unless_null $P158, vivify_140
    new $P158, "ResizablePMCArray"
  vivify_140:
    set $P159, $P158[0]
    unless_null $P159, vivify_141
    new $P159, "Undef"
  vivify_141:
    set $S160, $P159
    concat $P161, $P156, $S160
    concat $P162, $P161, ">"
    set $P148, $P162
  if_149_end:
    $P165 = $P147."!make"($P148)
.annotate "line", 32
    .return ($P165)
  control_144:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("20_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_170
.annotate "line", 36
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "self", self
    .lex "$/", param_170
.annotate "line", 37
    new $P171, "Undef"
    .lex "$past", $P171
.annotate "line", 38
    new $P172, "Undef"
    .lex "$BLOCK", $P172
.annotate "line", 37
    find_lex $P173, "$/"
    unless_null $P173, vivify_142
    new $P173, "Hash"
  vivify_142:
    set $P174, $P173["statementlist"]
    unless_null $P174, vivify_143
    new $P174, "Undef"
  vivify_143:
    $P175 = $P174."ast"()
    store_lex "$past", $P175
.annotate "line", 38
    get_global $P176, "@BLOCK"
    $P177 = $P176."shift"()
    store_lex "$BLOCK", $P177
.annotate "line", 39
    find_lex $P178, "$BLOCK"
    find_lex $P179, "$past"
    $P178."push"($P179)
.annotate "line", 40
    find_lex $P180, "$BLOCK"
    find_lex $P181, "$/"
    $P180."node"($P181)
.annotate "line", 41
    find_lex $P182, "$/"
    find_lex $P183, "$BLOCK"
    $P184 = $P182."!make"($P183)
.annotate "line", 36
    .return ($P184)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("21_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_189
.annotate "line", 44
    .const 'Sub' $P203 = "22_1259420199.1428" 
    capture_lex $P203
    new $P188, 'ExceptionHandler'
    set_addr $P188, control_187
    $P188."handle_types"(58)
    push_eh $P188
    .lex "self", self
    .lex "$/", param_189
.annotate "line", 45
    new $P190, "Undef"
    .lex "$past", $P190
    get_hll_global $P191, ["PAST"], "Stmts"
    find_lex $P192, "$/"
    $P193 = $P191."new"($P192 :named("node"))
    store_lex "$past", $P193
.annotate "line", 46
    find_lex $P195, "$/"
    unless_null $P195, vivify_144
    new $P195, "Hash"
  vivify_144:
    set $P196, $P195["statement"]
    unless_null $P196, vivify_145
    new $P196, "Undef"
  vivify_145:
    unless $P196, if_194_end
.annotate "line", 47
    find_lex $P198, "$/"
    unless_null $P198, vivify_146
    new $P198, "Hash"
  vivify_146:
    set $P199, $P198["statement"]
    unless_null $P199, vivify_147
    new $P199, "Undef"
  vivify_147:
    defined $I200, $P199
    unless $I200, for_undef_148
    iter $P197, $P199
    new $P223, 'ExceptionHandler'
    set_addr $P223, loop222_handler
    $P223."handle_types"(65, 67, 66)
    push_eh $P223
  loop222_test:
    unless $P197, loop222_done
    shift $P201, $P197
  loop222_redo:
    .const 'Sub' $P203 = "22_1259420199.1428" 
    capture_lex $P203
    $P203($P201)
  loop222_next:
    goto loop222_test
  loop222_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, 'type'
    eq $P224, 65, loop222_next
    eq $P224, 67, loop222_redo
  loop222_done:
    pop_eh 
  for_undef_148:
  if_194_end:
.annotate "line", 55
    find_lex $P225, "$/"
    find_lex $P226, "$past"
    $P227 = $P225."!make"($P226)
.annotate "line", 44
    .return ($P227)
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P228, exception, "payload"
    .return ($P228)
.end


.namespace ["NQP";"Actions"]
.sub "_block202"  :anon :subid("22_1259420199.1428") :outer("21_1259420199.1428")
    .param pmc param_205
.annotate "line", 48
    new $P204, "Undef"
    .lex "$ast", $P204
    .lex "$_", param_205
    find_lex $P206, "$_"
    $P207 = $P206."ast"()
    store_lex "$ast", $P207
.annotate "line", 49
    find_lex $P211, "$ast"
    get_hll_global $P212, ["PAST"], "Block"
    $P213 = $P211."isa"($P212)
    if $P213, if_210
    set $P209, $P213
    goto if_210_end
  if_210:
    find_lex $P214, "$ast"
    $P215 = $P214."blocktype"()
    isfalse $I216, $P215
    new $P209, 'Integer'
    set $P209, $I216
  if_210_end:
    unless $P209, if_208_end
.annotate "line", 50
    find_lex $P217, "$ast"
    $P218 = "block_immediate"($P217)
    store_lex "$ast", $P218
  if_208_end:
.annotate "line", 52
    find_lex $P219, "$past"
    find_lex $P220, "$ast"
    $P221 = $P219."push"($P220)
.annotate "line", 47
    .return ($P221)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("23_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_232
    .param pmc param_233 :optional
    .param int has_param_233 :opt_flag
.annotate "line", 58
    .const 'Sub' $P241 = "24_1259420199.1428" 
    capture_lex $P241
    new $P231, 'ExceptionHandler'
    set_addr $P231, control_230
    $P231."handle_types"(58)
    push_eh $P231
    .lex "self", self
    .lex "$/", param_232
    if has_param_233, optparam_149
    new $P234, "Undef"
    set param_233, $P234
  optparam_149:
    .lex "$key", param_233
.annotate "line", 59
    new $P235, "Undef"
    .lex "$past", $P235
.annotate "line", 58
    find_lex $P236, "$past"
.annotate "line", 60
    find_lex $P238, "$/"
    unless_null $P238, vivify_150
    new $P238, "Hash"
  vivify_150:
    set $P239, $P238["EXPR"]
    unless_null $P239, vivify_151
    new $P239, "Undef"
  vivify_151:
    if $P239, if_237
.annotate "line", 74
    find_lex $P297, "$/"
    unless_null $P297, vivify_152
    new $P297, "Hash"
  vivify_152:
    set $P298, $P297["statement_control"]
    unless_null $P298, vivify_153
    new $P298, "Undef"
  vivify_153:
    if $P298, if_296
.annotate "line", 75
    new $P302, "Integer"
    assign $P302, 0
    store_lex "$past", $P302
    goto if_296_end
  if_296:
.annotate "line", 74
    find_lex $P299, "$/"
    unless_null $P299, vivify_154
    new $P299, "Hash"
  vivify_154:
    set $P300, $P299["statement_control"]
    unless_null $P300, vivify_155
    new $P300, "Undef"
  vivify_155:
    $P301 = $P300."ast"()
    store_lex "$past", $P301
  if_296_end:
    goto if_237_end
  if_237:
.annotate "line", 60
    .const 'Sub' $P241 = "24_1259420199.1428" 
    capture_lex $P241
    $P241()
  if_237_end:
.annotate "line", 76
    find_lex $P303, "$/"
    find_lex $P304, "$past"
    $P305 = $P303."!make"($P304)
.annotate "line", 58
    .return ($P305)
  control_230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P306, exception, "payload"
    .return ($P306)
.end


.namespace ["NQP";"Actions"]
.sub "_block240"  :anon :subid("24_1259420199.1428") :outer("23_1259420199.1428")
.annotate "line", 61
    new $P242, "Undef"
    .lex "$mc", $P242
.annotate "line", 62
    new $P243, "Undef"
    .lex "$ml", $P243
.annotate "line", 61
    find_lex $P244, "$/"
    unless_null $P244, vivify_156
    new $P244, "Hash"
  vivify_156:
    set $P245, $P244["statement_mod_cond"]
    unless_null $P245, vivify_157
    new $P245, "ResizablePMCArray"
  vivify_157:
    set $P246, $P245[0]
    unless_null $P246, vivify_158
    new $P246, "Undef"
  vivify_158:
    store_lex "$mc", $P246
.annotate "line", 62
    find_lex $P247, "$/"
    unless_null $P247, vivify_159
    new $P247, "Hash"
  vivify_159:
    set $P248, $P247["statement_mod_loop"]
    unless_null $P248, vivify_160
    new $P248, "ResizablePMCArray"
  vivify_160:
    set $P249, $P248[0]
    unless_null $P249, vivify_161
    new $P249, "Undef"
  vivify_161:
    store_lex "$ml", $P249
.annotate "line", 63
    find_lex $P252, "$mc"
    if $P252, if_251
.annotate "line", 68
    find_lex $P280, "$ml"
    if $P280, if_279
.annotate "line", 71
    find_lex $P293, "$/"
    unless_null $P293, vivify_162
    new $P293, "Hash"
  vivify_162:
    set $P294, $P293["EXPR"]
    unless_null $P294, vivify_163
    new $P294, "Undef"
  vivify_163:
    $P295 = $P294."ast"()
    store_lex "$past", $P295
.annotate "line", 70
    set $P278, $P295
.annotate "line", 68
    goto if_279_end
  if_279:
.annotate "line", 69
    get_hll_global $P281, ["PAST"], "Op"
    find_lex $P282, "$ml"
    unless_null $P282, vivify_164
    new $P282, "Hash"
  vivify_164:
    set $P283, $P282["cond"]
    unless_null $P283, vivify_165
    new $P283, "Undef"
  vivify_165:
    $P284 = $P283."ast"()
    find_lex $P285, "$/"
    unless_null $P285, vivify_166
    new $P285, "Hash"
  vivify_166:
    set $P286, $P285["EXPR"]
    unless_null $P286, vivify_167
    new $P286, "Undef"
  vivify_167:
    $P287 = $P286."ast"()
    find_lex $P288, "$ml"
    unless_null $P288, vivify_168
    new $P288, "Hash"
  vivify_168:
    set $P289, $P288["sym"]
    unless_null $P289, vivify_169
    new $P289, "Undef"
  vivify_169:
    set $S290, $P289
    find_lex $P291, "$/"
    $P292 = $P281."new"($P284, $P287, $S290 :named("pasttype"), $P291 :named("node"))
    store_lex "$past", $P292
.annotate "line", 68
    set $P278, $P292
  if_279_end:
    set $P250, $P278
.annotate "line", 63
    goto if_251_end
  if_251:
.annotate "line", 64
    get_hll_global $P253, ["PAST"], "Op"
    find_lex $P254, "$mc"
    unless_null $P254, vivify_170
    new $P254, "Hash"
  vivify_170:
    set $P255, $P254["cond"]
    unless_null $P255, vivify_171
    new $P255, "Undef"
  vivify_171:
    $P256 = $P255."ast"()
    find_lex $P257, "$/"
    unless_null $P257, vivify_172
    new $P257, "Hash"
  vivify_172:
    set $P258, $P257["EXPR"]
    unless_null $P258, vivify_173
    new $P258, "Undef"
  vivify_173:
    $P259 = $P258."ast"()
    find_lex $P260, "$mc"
    unless_null $P260, vivify_174
    new $P260, "Hash"
  vivify_174:
    set $P261, $P260["sym"]
    unless_null $P261, vivify_175
    new $P261, "Undef"
  vivify_175:
    set $S262, $P261
    find_lex $P263, "$/"
    $P264 = $P253."new"($P256, $P259, $S262 :named("pasttype"), $P263 :named("node"))
    store_lex "$past", $P264
.annotate "line", 65
    find_lex $P267, "$ml"
    if $P267, if_266
    set $P265, $P267
    goto if_266_end
  if_266:
.annotate "line", 66
    get_hll_global $P268, ["PAST"], "Op"
    find_lex $P269, "$ml"
    unless_null $P269, vivify_176
    new $P269, "Hash"
  vivify_176:
    set $P270, $P269["cond"]
    unless_null $P270, vivify_177
    new $P270, "Undef"
  vivify_177:
    $P271 = $P270."ast"()
    find_lex $P272, "$past"
    find_lex $P273, "$ml"
    unless_null $P273, vivify_178
    new $P273, "Hash"
  vivify_178:
    set $P274, $P273["sym"]
    unless_null $P274, vivify_179
    new $P274, "Undef"
  vivify_179:
    set $S275, $P274
    find_lex $P276, "$/"
    $P277 = $P268."new"($P271, $P272, $S275 :named("pasttype"), $P276 :named("node"))
    store_lex "$past", $P277
.annotate "line", 65
    set $P265, $P277
  if_266_end:
.annotate "line", 63
    set $P250, $P265
  if_251_end:
.annotate "line", 60
    .return ($P250)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("25_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_310
.annotate "line", 79
    new $P309, 'ExceptionHandler'
    set_addr $P309, control_308
    $P309."handle_types"(58)
    push_eh $P309
    .lex "self", self
    .lex "$/", param_310
.annotate "line", 80
    find_lex $P311, "$/"
    get_hll_global $P312, ["PAST"], "Op"
    find_lex $P313, "$/"
    unless_null $P313, vivify_180
    new $P313, "Hash"
  vivify_180:
    set $P314, $P313["EXPR"]
    unless_null $P314, vivify_181
    new $P314, "Undef"
  vivify_181:
    $P315 = $P314."ast"()
    find_lex $P316, "$/"
    unless_null $P316, vivify_182
    new $P316, "Hash"
  vivify_182:
    set $P317, $P316["pblock"]
    unless_null $P317, vivify_183
    new $P317, "Undef"
  vivify_183:
    $P318 = $P317."ast"()
    find_lex $P319, "$/"
    $P320 = $P312."new"($P315, $P318, "if" :named("pasttype"), $P319 :named("node"))
    $P321 = $P311."!make"($P320)
.annotate "line", 79
    .return ($P321)
  control_308:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P322, exception, "payload"
    .return ($P322)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("26_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_326
.annotate "line", 83
    new $P325, 'ExceptionHandler'
    set_addr $P325, control_324
    $P325."handle_types"(58)
    push_eh $P325
    .lex "self", self
    .lex "$/", param_326
.annotate "line", 84
    find_lex $P327, "$/"
    find_lex $P328, "$/"
    unless_null $P328, vivify_184
    new $P328, "Hash"
  vivify_184:
    set $P329, $P328["blockoid"]
    unless_null $P329, vivify_185
    new $P329, "Undef"
  vivify_185:
    $P330 = $P329."ast"()
    $P331 = $P327."!make"($P330)
.annotate "line", 83
    .return ($P331)
  control_324:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, "payload"
    .return ($P332)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("27_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_336
.annotate "line", 87
    new $P335, 'ExceptionHandler'
    set_addr $P335, control_334
    $P335."handle_types"(58)
    push_eh $P335
    .lex "self", self
    .lex "$/", param_336
.annotate "line", 88
    find_lex $P337, "$/"
    find_lex $P338, "$/"
    unless_null $P338, vivify_186
    new $P338, "Hash"
  vivify_186:
    set $P339, $P338["blockoid"]
    unless_null $P339, vivify_187
    new $P339, "Undef"
  vivify_187:
    $P340 = $P339."ast"()
    $P341 = $P337."!make"($P340)
.annotate "line", 87
    .return ($P341)
  control_334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("28_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_346
.annotate "line", 91
    new $P345, 'ExceptionHandler'
    set_addr $P345, control_344
    $P345."handle_types"(58)
    push_eh $P345
    .lex "self", self
    .lex "$/", param_346
.annotate "line", 92
    new $P347, "Undef"
    .lex "$past", $P347
.annotate "line", 93
    new $P348, "Undef"
    .lex "$BLOCK", $P348
.annotate "line", 92
    find_lex $P349, "$/"
    unless_null $P349, vivify_188
    new $P349, "Hash"
  vivify_188:
    set $P350, $P349["statementlist"]
    unless_null $P350, vivify_189
    new $P350, "Undef"
  vivify_189:
    $P351 = $P350."ast"()
    store_lex "$past", $P351
.annotate "line", 93
    get_global $P352, "@BLOCK"
    $P353 = $P352."shift"()
    store_lex "$BLOCK", $P353
.annotate "line", 94
    find_lex $P354, "$BLOCK"
    find_lex $P355, "$past"
    $P354."push"($P355)
.annotate "line", 95
    find_lex $P356, "$BLOCK"
    find_lex $P357, "$/"
    $P356."node"($P357)
.annotate "line", 96
    find_lex $P358, "$/"
    find_lex $P359, "$BLOCK"
    $P360 = $P358."!make"($P359)
.annotate "line", 91
    .return ($P360)
  control_344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P361, exception, "payload"
    .return ($P361)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("29_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_365
.annotate "line", 99
    new $P364, 'ExceptionHandler'
    set_addr $P364, control_363
    $P364."handle_types"(58)
    push_eh $P364
    .lex "self", self
    .lex "$/", param_365
.annotate "line", 100
    get_global $P366, "@BLOCK"
    unless_null $P366, vivify_190
    new $P366, "ResizablePMCArray"
    set_global "@BLOCK", $P366
  vivify_190:
.annotate "line", 99
    get_global $P367, "@BLOCK"
.annotate "line", 101
    get_global $P368, "@BLOCK"
    get_hll_global $P369, ["PAST"], "Block"
    get_hll_global $P370, ["PAST"], "Stmts"
    $P371 = $P370."new"()
    $P372 = $P369."new"($P371)
    $P373 = $P368."unshift"($P372)
.annotate "line", 99
    .return ($P373)
  control_363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("30_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_378
.annotate "line", 106
    .const 'Sub' $P408 = "31_1259420199.1428" 
    capture_lex $P408
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(58)
    push_eh $P377
    .lex "self", self
    .lex "$/", param_378
.annotate "line", 107
    new $P379, "Undef"
    .lex "$count", $P379
.annotate "line", 108
    new $P380, "Undef"
    .lex "$past", $P380
.annotate "line", 107
    find_lex $P381, "$/"
    unless_null $P381, vivify_191
    new $P381, "Hash"
  vivify_191:
    set $P382, $P381["xblock"]
    unless_null $P382, vivify_192
    new $P382, "Undef"
  vivify_192:
    set $N383, $P382
    new $P384, 'Float'
    set $P384, $N383
    sub $P385, $P384, 1
    store_lex "$count", $P385
.annotate "line", 108
    find_lex $P386, "$count"
    set $I387, $P386
    find_lex $P388, "$/"
    unless_null $P388, vivify_193
    new $P388, "Hash"
  vivify_193:
    set $P389, $P388["xblock"]
    unless_null $P389, vivify_194
    new $P389, "ResizablePMCArray"
  vivify_194:
    set $P390, $P389[$I387]
    unless_null $P390, vivify_195
    new $P390, "Undef"
  vivify_195:
    $P391 = $P390."ast"()
    $P392 = "xblock_immediate"($P391)
    store_lex "$past", $P392
.annotate "line", 109
    find_lex $P394, "$/"
    unless_null $P394, vivify_196
    new $P394, "Hash"
  vivify_196:
    set $P395, $P394["else"]
    unless_null $P395, vivify_197
    new $P395, "Undef"
  vivify_197:
    unless $P395, if_393_end
.annotate "line", 110
    find_lex $P396, "$past"
    find_lex $P397, "$/"
    unless_null $P397, vivify_198
    new $P397, "Hash"
  vivify_198:
    set $P398, $P397["else"]
    unless_null $P398, vivify_199
    new $P398, "ResizablePMCArray"
  vivify_199:
    set $P399, $P398[0]
    unless_null $P399, vivify_200
    new $P399, "Undef"
  vivify_200:
    $P400 = $P399."ast"()
    $P401 = "block_immediate"($P400)
    $P396."push"($P401)
  if_393_end:
.annotate "line", 113
    new $P424, 'ExceptionHandler'
    set_addr $P424, loop423_handler
    $P424."handle_types"(65, 67, 66)
    push_eh $P424
  loop423_test:
    find_lex $P402, "$count"
    set $N403, $P402
    new $P404, "Integer"
    assign $P404, 0
    set $N405, $P404
    isgt $I406, $N403, $N405
    unless $I406, loop423_done
  loop423_redo:
    .const 'Sub' $P408 = "31_1259420199.1428" 
    capture_lex $P408
    $P408()
  loop423_next:
    goto loop423_test
  loop423_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P425, exception, 'type'
    eq $P425, 65, loop423_next
    eq $P425, 67, loop423_redo
  loop423_done:
    pop_eh 
.annotate "line", 119
    find_lex $P426, "$/"
    find_lex $P427, "$past"
    $P428 = $P426."!make"($P427)
.annotate "line", 106
    .return ($P428)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P429, exception, "payload"
    .return ($P429)
.end


.namespace ["NQP";"Actions"]
.sub "_block407"  :anon :subid("31_1259420199.1428") :outer("30_1259420199.1428")
.annotate "line", 115
    new $P409, "Undef"
    .lex "$else", $P409
.annotate "line", 113
    find_lex $P410, "$count"
    clone $P411, $P410
    dec $P410
.annotate "line", 115
    find_lex $P412, "$past"
    store_lex "$else", $P412
.annotate "line", 116
    find_lex $P413, "$count"
    set $I414, $P413
    find_lex $P415, "$/"
    unless_null $P415, vivify_201
    new $P415, "Hash"
  vivify_201:
    set $P416, $P415["xblock"]
    unless_null $P416, vivify_202
    new $P416, "ResizablePMCArray"
  vivify_202:
    set $P417, $P416[$I414]
    unless_null $P417, vivify_203
    new $P417, "Undef"
  vivify_203:
    $P418 = $P417."ast"()
    $P419 = "xblock_immediate"($P418)
    store_lex "$past", $P419
.annotate "line", 117
    find_lex $P420, "$past"
    find_lex $P421, "$else"
    $P422 = $P420."push"($P421)
.annotate "line", 113
    .return ($P422)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("32_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_433
.annotate "line", 122
    new $P432, 'ExceptionHandler'
    set_addr $P432, control_431
    $P432."handle_types"(58)
    push_eh $P432
    .lex "self", self
    .lex "$/", param_433
.annotate "line", 123
    new $P434, "Undef"
    .lex "$past", $P434
    find_lex $P435, "$/"
    unless_null $P435, vivify_204
    new $P435, "Hash"
  vivify_204:
    set $P436, $P435["xblock"]
    unless_null $P436, vivify_205
    new $P436, "Undef"
  vivify_205:
    $P437 = $P436."ast"()
    $P438 = "xblock_immediate"($P437)
    store_lex "$past", $P438
.annotate "line", 124
    find_lex $P439, "$past"
    $P439."pasttype"("unless")
.annotate "line", 125
    find_lex $P440, "$/"
    find_lex $P441, "$past"
    $P442 = $P440."!make"($P441)
.annotate "line", 122
    .return ($P442)
  control_431:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P443, exception, "payload"
    .return ($P443)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("33_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_447
.annotate "line", 128
    new $P446, 'ExceptionHandler'
    set_addr $P446, control_445
    $P446."handle_types"(58)
    push_eh $P446
    .lex "self", self
    .lex "$/", param_447
.annotate "line", 129
    new $P448, "Undef"
    .lex "$past", $P448
    find_lex $P449, "$/"
    unless_null $P449, vivify_206
    new $P449, "Hash"
  vivify_206:
    set $P450, $P449["xblock"]
    unless_null $P450, vivify_207
    new $P450, "Undef"
  vivify_207:
    $P451 = $P450."ast"()
    $P452 = "xblock_immediate"($P451)
    store_lex "$past", $P452
.annotate "line", 130
    find_lex $P453, "$past"
    find_lex $P454, "$/"
    unless_null $P454, vivify_208
    new $P454, "Hash"
  vivify_208:
    set $P455, $P454["sym"]
    unless_null $P455, vivify_209
    new $P455, "Undef"
  vivify_209:
    set $S456, $P455
    $P453."pasttype"($S456)
.annotate "line", 131
    find_lex $P457, "$/"
    find_lex $P458, "$past"
    $P459 = $P457."!make"($P458)
.annotate "line", 128
    .return ($P459)
  control_445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P460, exception, "payload"
    .return ($P460)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("34_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_464
.annotate "line", 134
    new $P463, 'ExceptionHandler'
    set_addr $P463, control_462
    $P463."handle_types"(58)
    push_eh $P463
    .lex "self", self
    .lex "$/", param_464
.annotate "line", 135
    new $P465, "Undef"
    .lex "$pasttype", $P465
.annotate "line", 136
    new $P466, "Undef"
    .lex "$past", $P466
.annotate "line", 135
    new $P467, "String"
    assign $P467, "repeat_"
    find_lex $P468, "$/"
    unless_null $P468, vivify_210
    new $P468, "Hash"
  vivify_210:
    set $P469, $P468["wu"]
    unless_null $P469, vivify_211
    new $P469, "Undef"
  vivify_211:
    set $S470, $P469
    concat $P471, $P467, $S470
    store_lex "$pasttype", $P471
    find_lex $P472, "$past"
.annotate "line", 137
    find_lex $P474, "$/"
    unless_null $P474, vivify_212
    new $P474, "Hash"
  vivify_212:
    set $P475, $P474["xblock"]
    unless_null $P475, vivify_213
    new $P475, "Undef"
  vivify_213:
    if $P475, if_473
.annotate "line", 142
    get_hll_global $P482, ["PAST"], "Op"
    find_lex $P483, "$/"
    unless_null $P483, vivify_214
    new $P483, "Hash"
  vivify_214:
    set $P484, $P483["EXPR"]
    unless_null $P484, vivify_215
    new $P484, "Undef"
  vivify_215:
    $P485 = $P484."ast"()
    find_lex $P486, "$/"
    unless_null $P486, vivify_216
    new $P486, "Hash"
  vivify_216:
    set $P487, $P486["pblock"]
    unless_null $P487, vivify_217
    new $P487, "Undef"
  vivify_217:
    $P488 = $P487."ast"()
    $P489 = "block_immediate"($P488)
    find_lex $P490, "$pasttype"
    find_lex $P491, "$/"
    $P492 = $P482."new"($P485, $P489, $P490 :named("pasttype"), $P491 :named("node"))
    store_lex "$past", $P492
.annotate "line", 141
    goto if_473_end
  if_473:
.annotate "line", 138
    find_lex $P476, "$/"
    unless_null $P476, vivify_218
    new $P476, "Hash"
  vivify_218:
    set $P477, $P476["xblock"]
    unless_null $P477, vivify_219
    new $P477, "Undef"
  vivify_219:
    $P478 = $P477."ast"()
    $P479 = "xblock_immediate"($P478)
    store_lex "$past", $P479
.annotate "line", 139
    find_lex $P480, "$past"
    find_lex $P481, "$pasttype"
    $P480."pasttype"($P481)
  if_473_end:
.annotate "line", 145
    find_lex $P493, "$/"
    find_lex $P494, "$past"
    $P495 = $P493."!make"($P494)
.annotate "line", 134
    .return ($P495)
  control_462:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("35_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_500
.annotate "line", 148
    new $P499, 'ExceptionHandler'
    set_addr $P499, control_498
    $P499."handle_types"(58)
    push_eh $P499
    .lex "self", self
    .lex "$/", param_500
.annotate "line", 149
    new $P501, "Undef"
    .lex "$past", $P501
.annotate "line", 151
    new $P502, "Undef"
    .lex "$block", $P502
.annotate "line", 149
    find_lex $P503, "$/"
    unless_null $P503, vivify_220
    new $P503, "Hash"
  vivify_220:
    set $P504, $P503["xblock"]
    unless_null $P504, vivify_221
    new $P504, "Undef"
  vivify_221:
    $P505 = $P504."ast"()
    store_lex "$past", $P505
.annotate "line", 150
    find_lex $P506, "$past"
    $P506."pasttype"("for")
.annotate "line", 151
    find_lex $P507, "$past"
    unless_null $P507, vivify_222
    new $P507, "ResizablePMCArray"
  vivify_222:
    set $P508, $P507[1]
    unless_null $P508, vivify_223
    new $P508, "Undef"
  vivify_223:
    store_lex "$block", $P508
.annotate "line", 152
    find_lex $P510, "$block"
    $P511 = $P510."arity"()
    if $P511, unless_509_end
.annotate "line", 153
    find_lex $P512, "$block"
    unless_null $P512, vivify_224
    new $P512, "ResizablePMCArray"
  vivify_224:
    set $P513, $P512[0]
    unless_null $P513, vivify_225
    new $P513, "Undef"
  vivify_225:
    get_hll_global $P514, ["PAST"], "Var"
    $P515 = $P514."new"("$_" :named("name"), "parameter" :named("scope"))
    $P513."push"($P515)
.annotate "line", 154
    find_lex $P516, "$block"
    $P516."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 155
    find_lex $P517, "$block"
    $P517."arity"(1)
  unless_509_end:
.annotate "line", 157
    find_lex $P518, "$block"
    $P518."blocktype"("immediate")
.annotate "line", 158
    find_lex $P519, "$/"
    find_lex $P520, "$past"
    $P521 = $P519."!make"($P520)
.annotate "line", 148
    .return ($P521)
  control_498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P522, exception, "payload"
    .return ($P522)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("36_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_526
.annotate "line", 161
    new $P525, 'ExceptionHandler'
    set_addr $P525, control_524
    $P525."handle_types"(58)
    push_eh $P525
    .lex "self", self
    .lex "$/", param_526
.annotate "line", 162
    find_lex $P527, "$/"
    get_hll_global $P528, ["PAST"], "Op"
    find_lex $P529, "$/"
    unless_null $P529, vivify_226
    new $P529, "Hash"
  vivify_226:
    set $P530, $P529["EXPR"]
    unless_null $P530, vivify_227
    new $P530, "Undef"
  vivify_227:
    $P531 = $P530."ast"()
    find_lex $P532, "$/"
    $P533 = $P528."new"($P531, "return" :named("pasttype"), $P532 :named("node"))
    $P534 = $P527."!make"($P533)
.annotate "line", 161
    .return ($P534)
  control_524:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P535, exception, "payload"
    .return ($P535)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("37_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_539
.annotate "line", 165
    new $P538, 'ExceptionHandler'
    set_addr $P538, control_537
    $P538."handle_types"(58)
    push_eh $P538
    .lex "self", self
    .lex "$/", param_539
.annotate "line", 166
    new $P540, "Undef"
    .lex "$block", $P540
    find_lex $P541, "$/"
    unless_null $P541, vivify_228
    new $P541, "Hash"
  vivify_228:
    set $P542, $P541["block"]
    unless_null $P542, vivify_229
    new $P542, "Undef"
  vivify_229:
    $P543 = $P542."ast"()
    store_lex "$block", $P543
.annotate "line", 167
    find_lex $P544, "$/"
    find_lex $P545, "$block"
    "push_block_handler"($P544, $P545)
.annotate "line", 168
    get_global $P546, "@BLOCK"
    unless_null $P546, vivify_230
    new $P546, "ResizablePMCArray"
  vivify_230:
    set $P547, $P546[0]
    unless_null $P547, vivify_231
    new $P547, "Undef"
  vivify_231:
    $P548 = $P547."handlers"()
    set $P549, $P548[0]
    unless_null $P549, vivify_232
    new $P549, "Undef"
  vivify_232:
    $P549."handle_types_except"("CONTROL")
.annotate "line", 169
    find_lex $P550, "$/"
    get_hll_global $P551, ["PAST"], "Stmts"
    find_lex $P552, "$/"
    $P553 = $P551."new"($P552 :named("node"))
    $P554 = $P550."!make"($P553)
.annotate "line", 165
    .return ($P554)
  control_537:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P555, exception, "payload"
    .return ($P555)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("38_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_559
.annotate "line", 172
    new $P558, 'ExceptionHandler'
    set_addr $P558, control_557
    $P558."handle_types"(58)
    push_eh $P558
    .lex "self", self
    .lex "$/", param_559
.annotate "line", 173
    new $P560, "Undef"
    .lex "$block", $P560
    find_lex $P561, "$/"
    unless_null $P561, vivify_233
    new $P561, "Hash"
  vivify_233:
    set $P562, $P561["block"]
    unless_null $P562, vivify_234
    new $P562, "Undef"
  vivify_234:
    $P563 = $P562."ast"()
    store_lex "$block", $P563
.annotate "line", 174
    find_lex $P564, "$/"
    find_lex $P565, "$block"
    "push_block_handler"($P564, $P565)
.annotate "line", 175
    get_global $P566, "@BLOCK"
    unless_null $P566, vivify_235
    new $P566, "ResizablePMCArray"
  vivify_235:
    set $P567, $P566[0]
    unless_null $P567, vivify_236
    new $P567, "Undef"
  vivify_236:
    $P568 = $P567."handlers"()
    set $P569, $P568[0]
    unless_null $P569, vivify_237
    new $P569, "Undef"
  vivify_237:
    $P569."handle_types"("CONTROL")
.annotate "line", 176
    find_lex $P570, "$/"
    get_hll_global $P571, ["PAST"], "Stmts"
    find_lex $P572, "$/"
    $P573 = $P571."new"($P572 :named("node"))
    $P574 = $P570."!make"($P573)
.annotate "line", 172
    .return ($P574)
  control_557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P575, exception, "payload"
    .return ($P575)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("39_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_580
.annotate "line", 216
    new $P579, 'ExceptionHandler'
    set_addr $P579, control_578
    $P579."handle_types"(58)
    push_eh $P579
    .lex "self", self
    .lex "$/", param_580
.annotate "line", 217
    get_global $P581, "@BLOCK"
    unless_null $P581, vivify_238
    new $P581, "ResizablePMCArray"
  vivify_238:
    set $P582, $P581[0]
    unless_null $P582, vivify_239
    new $P582, "Undef"
  vivify_239:
    $P583 = $P582."loadinit"()
    find_lex $P584, "$/"
    unless_null $P584, vivify_240
    new $P584, "Hash"
  vivify_240:
    set $P585, $P584["blorst"]
    unless_null $P585, vivify_241
    new $P585, "Undef"
  vivify_241:
    $P586 = $P585."ast"()
    $P583."push"($P586)
.annotate "line", 218
    find_lex $P587, "$/"
    get_hll_global $P588, ["PAST"], "Stmts"
    find_lex $P589, "$/"
    $P590 = $P588."new"($P589 :named("node"))
    $P591 = $P587."!make"($P590)
.annotate "line", 216
    .return ($P591)
  control_578:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P592, exception, "payload"
    .return ($P592)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("40_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_596
.annotate "line", 221
    new $P595, 'ExceptionHandler'
    set_addr $P595, control_594
    $P595."handle_types"(58)
    push_eh $P595
    .lex "self", self
    .lex "$/", param_596
.annotate "line", 222
    new $P597, "Undef"
    .lex "$past", $P597
    find_lex $P598, "$/"
    unless_null $P598, vivify_242
    new $P598, "Hash"
  vivify_242:
    set $P599, $P598["blorst"]
    unless_null $P599, vivify_243
    new $P599, "Undef"
  vivify_243:
    $P600 = $P599."ast"()
    store_lex "$past", $P600
.annotate "line", 223
    find_lex $P602, "$past"
    $S603 = $P602."WHAT"()
    isne $I604, $S603, "PAST::Block()"
    unless $I604, if_601_end
.annotate "line", 224
    get_hll_global $P605, ["PAST"], "Block"
    find_lex $P606, "$past"
    find_lex $P607, "$/"
    $P608 = $P605."new"($P606, "immediate" :named("blocktype"), $P607 :named("node"))
    store_lex "$past", $P608
  if_601_end:
.annotate "line", 226
    find_lex $P610, "$past"
    $P611 = $P610."handlers"()
    if $P611, unless_609_end
.annotate "line", 227
    find_lex $P612, "$past"
    get_hll_global $P613, ["PAST"], "Control"
.annotate "line", 229
    get_hll_global $P614, ["PAST"], "Stmts"
.annotate "line", 230
    get_hll_global $P615, ["PAST"], "Op"
.annotate "line", 231
    get_hll_global $P616, ["PAST"], "Var"
.annotate "line", 232
    get_hll_global $P617, ["PAST"], "Var"
    $P618 = $P617."new"("register" :named("scope"), "exception" :named("name"))
    $P619 = $P616."new"($P618, "handled", "keyed" :named("scope"))
.annotate "line", 231
    $P620 = $P615."new"($P619, 1, "bind" :named("pasttype"))
.annotate "line", 230
    $P621 = $P614."new"($P620)
.annotate "line", 229
    $P622 = $P613."new"($P621, "CONTROL" :named("handle_types_except"))
.annotate "line", 227
    new $P623, "ResizablePMCArray"
    push $P623, $P622
    $P612."handlers"($P623)
  unless_609_end:
.annotate "line", 241
    find_lex $P624, "$/"
    find_lex $P625, "$past"
    $P626 = $P624."!make"($P625)
.annotate "line", 221
    .return ($P626)
  control_594:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P627, exception, "payload"
    .return ($P627)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("41_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_631
.annotate "line", 244
    new $P630, 'ExceptionHandler'
    set_addr $P630, control_629
    $P630."handle_types"(58)
    push_eh $P630
    .lex "self", self
    .lex "$/", param_631
.annotate "line", 245
    find_lex $P632, "$/"
.annotate "line", 246
    find_lex $P635, "$/"
    unless_null $P635, vivify_244
    new $P635, "Hash"
  vivify_244:
    set $P636, $P635["block"]
    unless_null $P636, vivify_245
    new $P636, "Undef"
  vivify_245:
    if $P636, if_634
.annotate "line", 247
    find_lex $P641, "$/"
    unless_null $P641, vivify_246
    new $P641, "Hash"
  vivify_246:
    set $P642, $P641["statement"]
    unless_null $P642, vivify_247
    new $P642, "Undef"
  vivify_247:
    $P643 = $P642."ast"()
    set $P633, $P643
.annotate "line", 246
    goto if_634_end
  if_634:
    find_lex $P637, "$/"
    unless_null $P637, vivify_248
    new $P637, "Hash"
  vivify_248:
    set $P638, $P637["block"]
    unless_null $P638, vivify_249
    new $P638, "Undef"
  vivify_249:
    $P639 = $P638."ast"()
    $P640 = "block_immediate"($P639)
    set $P633, $P640
  if_634_end:
    $P644 = $P632."!make"($P633)
.annotate "line", 244
    .return ($P644)
  control_629:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P645, exception, "payload"
    .return ($P645)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("42_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_649
.annotate "line", 252
    new $P648, 'ExceptionHandler'
    set_addr $P648, control_647
    $P648."handle_types"(58)
    push_eh $P648
    .lex "self", self
    .lex "$/", param_649
    find_lex $P650, "$/"
    find_lex $P651, "$/"
    unless_null $P651, vivify_250
    new $P651, "Hash"
  vivify_250:
    set $P652, $P651["cond"]
    unless_null $P652, vivify_251
    new $P652, "Undef"
  vivify_251:
    $P653 = $P652."ast"()
    $P654 = $P650."!make"($P653)
    .return ($P654)
  control_647:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P655, exception, "payload"
    .return ($P655)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("43_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_659
.annotate "line", 253
    new $P658, 'ExceptionHandler'
    set_addr $P658, control_657
    $P658."handle_types"(58)
    push_eh $P658
    .lex "self", self
    .lex "$/", param_659
    find_lex $P660, "$/"
    find_lex $P661, "$/"
    unless_null $P661, vivify_252
    new $P661, "Hash"
  vivify_252:
    set $P662, $P661["cond"]
    unless_null $P662, vivify_253
    new $P662, "Undef"
  vivify_253:
    $P663 = $P662."ast"()
    $P664 = $P660."!make"($P663)
    .return ($P664)
  control_657:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P665, exception, "payload"
    .return ($P665)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("44_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_669
.annotate "line", 255
    new $P668, 'ExceptionHandler'
    set_addr $P668, control_667
    $P668."handle_types"(58)
    push_eh $P668
    .lex "self", self
    .lex "$/", param_669
    find_lex $P670, "$/"
    find_lex $P671, "$/"
    unless_null $P671, vivify_254
    new $P671, "Hash"
  vivify_254:
    set $P672, $P671["cond"]
    unless_null $P672, vivify_255
    new $P672, "Undef"
  vivify_255:
    $P673 = $P672."ast"()
    $P674 = $P670."!make"($P673)
    .return ($P674)
  control_667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P675, exception, "payload"
    .return ($P675)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("45_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_679
.annotate "line", 256
    new $P678, 'ExceptionHandler'
    set_addr $P678, control_677
    $P678."handle_types"(58)
    push_eh $P678
    .lex "self", self
    .lex "$/", param_679
    find_lex $P680, "$/"
    find_lex $P681, "$/"
    unless_null $P681, vivify_256
    new $P681, "Hash"
  vivify_256:
    set $P682, $P681["cond"]
    unless_null $P682, vivify_257
    new $P682, "Undef"
  vivify_257:
    $P683 = $P682."ast"()
    $P684 = $P680."!make"($P683)
    .return ($P684)
  control_677:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P685, exception, "payload"
    .return ($P685)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("46_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_689
.annotate "line", 260
    new $P688, 'ExceptionHandler'
    set_addr $P688, control_687
    $P688."handle_types"(58)
    push_eh $P688
    .lex "self", self
    .lex "$/", param_689
    find_lex $P690, "$/"
    find_lex $P691, "$/"
    unless_null $P691, vivify_258
    new $P691, "Hash"
  vivify_258:
    set $P692, $P691["colonpair"]
    unless_null $P692, vivify_259
    new $P692, "Undef"
  vivify_259:
    $P693 = $P692."ast"()
    $P694 = $P690."!make"($P693)
    .return ($P694)
  control_687:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P695, exception, "payload"
    .return ($P695)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("47_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_699
.annotate "line", 261
    new $P698, 'ExceptionHandler'
    set_addr $P698, control_697
    $P698."handle_types"(58)
    push_eh $P698
    .lex "self", self
    .lex "$/", param_699
    find_lex $P700, "$/"
    find_lex $P701, "$/"
    unless_null $P701, vivify_260
    new $P701, "Hash"
  vivify_260:
    set $P702, $P701["variable"]
    unless_null $P702, vivify_261
    new $P702, "Undef"
  vivify_261:
    $P703 = $P702."ast"()
    $P704 = $P700."!make"($P703)
    .return ($P704)
  control_697:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P705, exception, "payload"
    .return ($P705)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("48_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_709
.annotate "line", 262
    new $P708, 'ExceptionHandler'
    set_addr $P708, control_707
    $P708."handle_types"(58)
    push_eh $P708
    .lex "self", self
    .lex "$/", param_709
    find_lex $P710, "$/"
    find_lex $P711, "$/"
    unless_null $P711, vivify_262
    new $P711, "Hash"
  vivify_262:
    set $P712, $P711["package_declarator"]
    unless_null $P712, vivify_263
    new $P712, "Undef"
  vivify_263:
    $P713 = $P712."ast"()
    $P714 = $P710."!make"($P713)
    .return ($P714)
  control_707:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P715, exception, "payload"
    .return ($P715)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("49_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_719
.annotate "line", 263
    new $P718, 'ExceptionHandler'
    set_addr $P718, control_717
    $P718."handle_types"(58)
    push_eh $P718
    .lex "self", self
    .lex "$/", param_719
    find_lex $P720, "$/"
    find_lex $P721, "$/"
    unless_null $P721, vivify_264
    new $P721, "Hash"
  vivify_264:
    set $P722, $P721["scope_declarator"]
    unless_null $P722, vivify_265
    new $P722, "Undef"
  vivify_265:
    $P723 = $P722."ast"()
    $P724 = $P720."!make"($P723)
    .return ($P724)
  control_717:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P725, exception, "payload"
    .return ($P725)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("50_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_729
.annotate "line", 264
    new $P728, 'ExceptionHandler'
    set_addr $P728, control_727
    $P728."handle_types"(58)
    push_eh $P728
    .lex "self", self
    .lex "$/", param_729
    find_lex $P730, "$/"
    find_lex $P731, "$/"
    unless_null $P731, vivify_266
    new $P731, "Hash"
  vivify_266:
    set $P732, $P731["routine_declarator"]
    unless_null $P732, vivify_267
    new $P732, "Undef"
  vivify_267:
    $P733 = $P732."ast"()
    $P734 = $P730."!make"($P733)
    .return ($P734)
  control_727:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P735, exception, "payload"
    .return ($P735)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("51_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_739
.annotate "line", 265
    new $P738, 'ExceptionHandler'
    set_addr $P738, control_737
    $P738."handle_types"(58)
    push_eh $P738
    .lex "self", self
    .lex "$/", param_739
    find_lex $P740, "$/"
    find_lex $P741, "$/"
    unless_null $P741, vivify_268
    new $P741, "Hash"
  vivify_268:
    set $P742, $P741["regex_declarator"]
    unless_null $P742, vivify_269
    new $P742, "Undef"
  vivify_269:
    $P743 = $P742."ast"()
    $P744 = $P740."!make"($P743)
    .return ($P744)
  control_737:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P745, exception, "payload"
    .return ($P745)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("52_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_749
.annotate "line", 266
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(58)
    push_eh $P748
    .lex "self", self
    .lex "$/", param_749
    find_lex $P750, "$/"
    find_lex $P751, "$/"
    unless_null $P751, vivify_270
    new $P751, "Hash"
  vivify_270:
    set $P752, $P751["statement_prefix"]
    unless_null $P752, vivify_271
    new $P752, "Undef"
  vivify_271:
    $P753 = $P752."ast"()
    $P754 = $P750."!make"($P753)
    .return ($P754)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P755, exception, "payload"
    .return ($P755)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("53_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_759
.annotate "line", 267
    new $P758, 'ExceptionHandler'
    set_addr $P758, control_757
    $P758."handle_types"(58)
    push_eh $P758
    .lex "self", self
    .lex "$/", param_759
    find_lex $P760, "$/"
    find_lex $P761, "$/"
    unless_null $P761, vivify_272
    new $P761, "Hash"
  vivify_272:
    set $P762, $P761["pblock"]
    unless_null $P762, vivify_273
    new $P762, "Undef"
  vivify_273:
    $P763 = $P762."ast"()
    $P764 = $P760."!make"($P763)
    .return ($P764)
  control_757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P765, exception, "payload"
    .return ($P765)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("54_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_769
.annotate "line", 269
    new $P768, 'ExceptionHandler'
    set_addr $P768, control_767
    $P768."handle_types"(58)
    push_eh $P768
    .lex "self", self
    .lex "$/", param_769
.annotate "line", 270
    new $P770, "Undef"
    .lex "$past", $P770
.annotate "line", 271
    find_lex $P773, "$/"
    unless_null $P773, vivify_274
    new $P773, "Hash"
  vivify_274:
    set $P774, $P773["circumfix"]
    unless_null $P774, vivify_275
    new $P774, "Undef"
  vivify_275:
    if $P774, if_772
.annotate "line", 272
    get_hll_global $P779, ["PAST"], "Val"
    find_lex $P780, "$/"
    unless_null $P780, vivify_276
    new $P780, "Hash"
  vivify_276:
    set $P781, $P780["not"]
    unless_null $P781, vivify_277
    new $P781, "Undef"
  vivify_277:
    isfalse $I782, $P781
    $P783 = $P779."new"($I782 :named("value"))
    set $P771, $P783
.annotate "line", 271
    goto if_772_end
  if_772:
    find_lex $P775, "$/"
    unless_null $P775, vivify_278
    new $P775, "Hash"
  vivify_278:
    set $P776, $P775["circumfix"]
    unless_null $P776, vivify_279
    new $P776, "ResizablePMCArray"
  vivify_279:
    set $P777, $P776[0]
    unless_null $P777, vivify_280
    new $P777, "Undef"
  vivify_280:
    $P778 = $P777."ast"()
    set $P771, $P778
  if_772_end:
    store_lex "$past", $P771
.annotate "line", 273
    find_lex $P784, "$past"
    find_lex $P785, "$/"
    unless_null $P785, vivify_281
    new $P785, "Hash"
  vivify_281:
    set $P786, $P785["identifier"]
    unless_null $P786, vivify_282
    new $P786, "Undef"
  vivify_282:
    set $S787, $P786
    $P784."named"($S787)
.annotate "line", 274
    find_lex $P788, "$/"
    find_lex $P789, "$past"
    $P790 = $P788."!make"($P789)
.annotate "line", 269
    .return ($P790)
  control_767:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P791, exception, "payload"
    .return ($P791)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("55_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_795
.annotate "line", 277
    .const 'Sub' $P808 = "56_1259420199.1428" 
    capture_lex $P808
    new $P794, 'ExceptionHandler'
    set_addr $P794, control_793
    $P794."handle_types"(58)
    push_eh $P794
    .lex "self", self
    .lex "$/", param_795
.annotate "line", 278
    new $P796, "Undef"
    .lex "$past", $P796
.annotate "line", 277
    find_lex $P797, "$past"
.annotate "line", 279
    find_lex $P799, "$/"
    unless_null $P799, vivify_283
    new $P799, "Hash"
  vivify_283:
    set $P800, $P799["postcircumfix"]
    unless_null $P800, vivify_284
    new $P800, "Undef"
  vivify_284:
    if $P800, if_798
.annotate "line", 283
    .const 'Sub' $P808 = "56_1259420199.1428" 
    capture_lex $P808
    $P808()
    goto if_798_end
  if_798:
.annotate "line", 280
    find_lex $P801, "$/"
    unless_null $P801, vivify_301
    new $P801, "Hash"
  vivify_301:
    set $P802, $P801["postcircumfix"]
    unless_null $P802, vivify_302
    new $P802, "Undef"
  vivify_302:
    $P803 = $P802."ast"()
    store_lex "$past", $P803
.annotate "line", 281
    find_lex $P804, "$past"
    get_hll_global $P805, ["PAST"], "Var"
    $P806 = $P805."new"("$/" :named("name"))
    $P804."unshift"($P806)
  if_798_end:
.annotate "line", 312
    find_lex $P877, "$/"
    find_lex $P878, "$past"
    $P879 = $P877."!make"($P878)
.annotate "line", 277
    .return ($P879)
  control_793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P880, exception, "payload"
    .return ($P880)
.end


.namespace ["NQP";"Actions"]
.sub "_block807"  :anon :subid("56_1259420199.1428") :outer("55_1259420199.1428")
.annotate "line", 284
    new $P809, "ResizablePMCArray"
    .lex "@name", $P809
    get_hll_global $P810, ["NQP"], "Compiler"
    find_lex $P811, "$/"
    set $S812, $P811
    $P813 = $P810."parse_name"($S812)
    store_lex "@name", $P813
.annotate "line", 285
    get_hll_global $P814, ["PAST"], "Var"
    find_lex $P815, "@name"
    $P816 = $P815."pop"()
    set $S817, $P816
    $P818 = $P814."new"($S817 :named("name"))
    store_lex "$past", $P818
.annotate "line", 286
    find_lex $P820, "@name"
    unless $P820, if_819_end
.annotate "line", 287
    find_lex $P822, "@name"
    unless_null $P822, vivify_285
    new $P822, "ResizablePMCArray"
  vivify_285:
    set $P823, $P822[0]
    unless_null $P823, vivify_286
    new $P823, "Undef"
  vivify_286:
    set $S824, $P823
    iseq $I825, $S824, "GLOBAL"
    unless $I825, if_821_end
    find_lex $P826, "@name"
    $P826."shift"()
  if_821_end:
.annotate "line", 288
    find_lex $P827, "$past"
    find_lex $P828, "@name"
    $P827."namespace"($P828)
.annotate "line", 289
    find_lex $P829, "$past"
    $P829."scope"("package")
.annotate "line", 290
    find_lex $P830, "$past"
    find_lex $P831, "$/"
    unless_null $P831, vivify_287
    new $P831, "Hash"
  vivify_287:
    set $P832, $P831["sigil"]
    unless_null $P832, vivify_288
    new $P832, "Undef"
  vivify_288:
    $P833 = "sigiltype"($P832)
    $P830."viviself"($P833)
.annotate "line", 291
    find_lex $P834, "$past"
    $P834."lvalue"(1)
  if_819_end:
.annotate "line", 293
    find_lex $P837, "$/"
    unless_null $P837, vivify_289
    new $P837, "Hash"
  vivify_289:
    set $P838, $P837["twigil"]
    unless_null $P838, vivify_290
    new $P838, "ResizablePMCArray"
  vivify_290:
    set $P839, $P838[0]
    unless_null $P839, vivify_291
    new $P839, "Undef"
  vivify_291:
    set $S840, $P839
    iseq $I841, $S840, "*"
    if $I841, if_836
.annotate "line", 306
    find_lex $P863, "$/"
    unless_null $P863, vivify_292
    new $P863, "Hash"
  vivify_292:
    set $P864, $P863["twigil"]
    unless_null $P864, vivify_293
    new $P864, "ResizablePMCArray"
  vivify_293:
    set $P865, $P864[0]
    unless_null $P865, vivify_294
    new $P865, "Undef"
  vivify_294:
    set $S866, $P865
    iseq $I867, $S866, "!"
    if $I867, if_862
    new $P861, 'Integer'
    set $P861, $I867
    goto if_862_end
  if_862:
.annotate "line", 307
    find_lex $P868, "$past"
    get_hll_global $P869, ["PAST"], "Var"
    $P870 = $P869."new"("self" :named("name"))
    $P868."push"($P870)
.annotate "line", 308
    find_lex $P871, "$past"
    $P871."scope"("attribute")
.annotate "line", 309
    find_lex $P872, "$past"
    find_lex $P873, "$/"
    unless_null $P873, vivify_295
    new $P873, "Hash"
  vivify_295:
    set $P874, $P873["sigil"]
    unless_null $P874, vivify_296
    new $P874, "Undef"
  vivify_296:
    $P875 = "sigiltype"($P874)
    $P876 = $P872."viviself"($P875)
.annotate "line", 306
    set $P861, $P876
  if_862_end:
    set $P835, $P861
.annotate "line", 293
    goto if_836_end
  if_836:
.annotate "line", 294
    find_lex $P842, "$past"
    $P842."scope"("contextual")
.annotate "line", 295
    find_lex $P843, "$past"
.annotate "line", 296
    get_hll_global $P844, ["PAST"], "Var"
.annotate "line", 298
    find_lex $P845, "$/"
    unless_null $P845, vivify_297
    new $P845, "Hash"
  vivify_297:
    set $P846, $P845["sigil"]
    unless_null $P846, vivify_298
    new $P846, "Undef"
  vivify_298:
    set $S847, $P846
    new $P848, 'String'
    set $P848, $S847
    find_lex $P849, "$/"
    unless_null $P849, vivify_299
    new $P849, "Hash"
  vivify_299:
    set $P850, $P849["desigilname"]
    unless_null $P850, vivify_300
    new $P850, "Undef"
  vivify_300:
    concat $P851, $P848, $P850
.annotate "line", 300
    get_hll_global $P852, ["PAST"], "Op"
    new $P853, "String"
    assign $P853, "Contextual "
    find_lex $P854, "$/"
    set $S855, $P854
    concat $P856, $P853, $S855
    concat $P857, $P856, " not found"
    $P858 = $P852."new"($P857, "die" :named("pirop"))
    $P859 = $P844."new"("package" :named("scope"), "" :named("namespace"), $P851 :named("name"), $P858 :named("viviself"))
.annotate "line", 296
    $P860 = $P843."viviself"($P859)
.annotate "line", 293
    set $P835, $P860
  if_836_end:
.annotate "line", 283
    .return ($P835)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("57_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_884
.annotate "line", 315
    new $P883, 'ExceptionHandler'
    set_addr $P883, control_882
    $P883."handle_types"(58)
    push_eh $P883
    .lex "self", self
    .lex "$/", param_884
    find_lex $P885, "$/"
    find_lex $P886, "$/"
    unless_null $P886, vivify_303
    new $P886, "Hash"
  vivify_303:
    set $P887, $P886["package_def"]
    unless_null $P887, vivify_304
    new $P887, "Undef"
  vivify_304:
    $P888 = $P887."ast"()
    $P889 = $P885."!make"($P888)
    .return ($P889)
  control_882:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P890, exception, "payload"
    .return ($P890)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("58_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_894
.annotate "line", 316
    new $P893, 'ExceptionHandler'
    set_addr $P893, control_892
    $P893."handle_types"(58)
    push_eh $P893
    .lex "self", self
    .lex "$/", param_894
.annotate "line", 317
    new $P895, "Undef"
    .lex "$past", $P895
.annotate "line", 318
    new $P896, "Undef"
    .lex "$classinit", $P896
.annotate "line", 327
    new $P897, "Undef"
    .lex "$parent", $P897
.annotate "line", 317
    find_lex $P898, "$/"
    unless_null $P898, vivify_305
    new $P898, "Hash"
  vivify_305:
    set $P899, $P898["package_def"]
    unless_null $P899, vivify_306
    new $P899, "Undef"
  vivify_306:
    $P900 = $P899."ast"()
    store_lex "$past", $P900
.annotate "line", 319
    get_hll_global $P901, ["PAST"], "Op"
.annotate "line", 320
    get_hll_global $P902, ["PAST"], "Op"
    $P903 = $P902."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 323
    find_lex $P904, "$/"
    unless_null $P904, vivify_307
    new $P904, "Hash"
  vivify_307:
    set $P905, $P904["package_def"]
    unless_null $P905, vivify_308
    new $P905, "Hash"
  vivify_308:
    set $P906, $P905["name"]
    unless_null $P906, vivify_309
    new $P906, "Undef"
  vivify_309:
    set $S907, $P906
    $P908 = $P901."new"($P903, $S907, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 319
    store_lex "$classinit", $P908
.annotate "line", 327
    find_lex $P911, "$/"
    unless_null $P911, vivify_310
    new $P911, "Hash"
  vivify_310:
    set $P912, $P911["package_def"]
    unless_null $P912, vivify_311
    new $P912, "Hash"
  vivify_311:
    set $P913, $P912["parent"]
    unless_null $P913, vivify_312
    new $P913, "ResizablePMCArray"
  vivify_312:
    set $P914, $P913[0]
    unless_null $P914, vivify_313
    new $P914, "Undef"
  vivify_313:
    set $S915, $P914
    unless $S915, unless_910
    new $P909, 'String'
    set $P909, $S915
    goto unless_910_end
  unless_910:
.annotate "line", 328
    find_lex $P918, "$/"
    unless_null $P918, vivify_314
    new $P918, "Hash"
  vivify_314:
    set $P919, $P918["sym"]
    unless_null $P919, vivify_315
    new $P919, "Undef"
  vivify_315:
    set $S920, $P919
    iseq $I921, $S920, "grammar"
    if $I921, if_917
    new $P923, "String"
    assign $P923, ""
    set $P916, $P923
    goto if_917_end
  if_917:
    new $P922, "String"
    assign $P922, "Regex::Cursor"
    set $P916, $P922
  if_917_end:
    set $P909, $P916
  unless_910_end:
    store_lex "$parent", $P909
.annotate "line", 329
    find_lex $P925, "$parent"
    unless $P925, if_924_end
.annotate "line", 330
    find_lex $P926, "$classinit"
    get_hll_global $P927, ["PAST"], "Val"
    find_lex $P928, "$parent"
    $P929 = $P927."new"($P928 :named("value"), "parent" :named("named"))
    $P926."push"($P929)
  if_924_end:
.annotate "line", 332
    find_lex $P931, "$past"
    unless_null $P931, vivify_316
    new $P931, "Hash"
  vivify_316:
    set $P932, $P931["attributes"]
    unless_null $P932, vivify_317
    new $P932, "Undef"
  vivify_317:
    unless $P932, if_930_end
.annotate "line", 333
    find_lex $P933, "$classinit"
    find_lex $P934, "$past"
    unless_null $P934, vivify_318
    new $P934, "Hash"
  vivify_318:
    set $P935, $P934["attributes"]
    unless_null $P935, vivify_319
    new $P935, "Undef"
  vivify_319:
    $P933."push"($P935)
  if_930_end:
.annotate "line", 335
    get_global $P936, "@BLOCK"
    unless_null $P936, vivify_320
    new $P936, "ResizablePMCArray"
  vivify_320:
    set $P937, $P936[0]
    unless_null $P937, vivify_321
    new $P937, "Undef"
  vivify_321:
    $P938 = $P937."loadinit"()
    find_lex $P939, "$classinit"
    $P938."push"($P939)
.annotate "line", 336
    find_lex $P940, "$/"
    find_lex $P941, "$past"
    $P942 = $P940."!make"($P941)
.annotate "line", 316
    .return ($P942)
  control_892:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P943, exception, "payload"
    .return ($P943)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("59_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_947
.annotate "line", 339
    new $P946, 'ExceptionHandler'
    set_addr $P946, control_945
    $P946."handle_types"(58)
    push_eh $P946
    .lex "self", self
    .lex "$/", param_947
.annotate "line", 340
    new $P948, "Undef"
    .lex "$past", $P948
    find_lex $P951, "$/"
    unless_null $P951, vivify_322
    new $P951, "Hash"
  vivify_322:
    set $P952, $P951["block"]
    unless_null $P952, vivify_323
    new $P952, "Undef"
  vivify_323:
    if $P952, if_950
    find_lex $P956, "$/"
    unless_null $P956, vivify_324
    new $P956, "Hash"
  vivify_324:
    set $P957, $P956["comp_unit"]
    unless_null $P957, vivify_325
    new $P957, "Undef"
  vivify_325:
    $P958 = $P957."ast"()
    set $P949, $P958
    goto if_950_end
  if_950:
    find_lex $P953, "$/"
    unless_null $P953, vivify_326
    new $P953, "Hash"
  vivify_326:
    set $P954, $P953["block"]
    unless_null $P954, vivify_327
    new $P954, "Undef"
  vivify_327:
    $P955 = $P954."ast"()
    set $P949, $P955
  if_950_end:
    store_lex "$past", $P949
.annotate "line", 341
    find_lex $P959, "$past"
    find_lex $P960, "$/"
    unless_null $P960, vivify_328
    new $P960, "Hash"
  vivify_328:
    set $P961, $P960["name"]
    unless_null $P961, vivify_329
    new $P961, "Hash"
  vivify_329:
    set $P962, $P961["identifier"]
    unless_null $P962, vivify_330
    new $P962, "Undef"
  vivify_330:
    $P959."namespace"($P962)
.annotate "line", 342
    find_lex $P963, "$past"
    $P963."blocktype"("immediate")
.annotate "line", 343
    find_lex $P964, "$/"
    find_lex $P965, "$past"
    $P966 = $P964."!make"($P965)
.annotate "line", 339
    .return ($P966)
  control_945:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P967, exception, "payload"
    .return ($P967)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("60_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_971
.annotate "line", 346
    new $P970, 'ExceptionHandler'
    set_addr $P970, control_969
    $P970."handle_types"(58)
    push_eh $P970
    .lex "self", self
    .lex "$/", param_971
    find_lex $P972, "$/"
    find_lex $P973, "$/"
    unless_null $P973, vivify_331
    new $P973, "Hash"
  vivify_331:
    set $P974, $P973["scoped"]
    unless_null $P974, vivify_332
    new $P974, "Undef"
  vivify_332:
    $P975 = $P974."ast"()
    $P976 = $P972."!make"($P975)
    .return ($P976)
  control_969:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P977, exception, "payload"
    .return ($P977)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("61_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_981
.annotate "line", 347
    new $P980, 'ExceptionHandler'
    set_addr $P980, control_979
    $P980."handle_types"(58)
    push_eh $P980
    .lex "self", self
    .lex "$/", param_981
    find_lex $P982, "$/"
    find_lex $P983, "$/"
    unless_null $P983, vivify_333
    new $P983, "Hash"
  vivify_333:
    set $P984, $P983["scoped"]
    unless_null $P984, vivify_334
    new $P984, "Undef"
  vivify_334:
    $P985 = $P984."ast"()
    $P986 = $P982."!make"($P985)
    .return ($P986)
  control_979:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P987, exception, "payload"
    .return ($P987)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("62_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_991
.annotate "line", 348
    new $P990, 'ExceptionHandler'
    set_addr $P990, control_989
    $P990."handle_types"(58)
    push_eh $P990
    .lex "self", self
    .lex "$/", param_991
    find_lex $P992, "$/"
    find_lex $P993, "$/"
    unless_null $P993, vivify_335
    new $P993, "Hash"
  vivify_335:
    set $P994, $P993["scoped"]
    unless_null $P994, vivify_336
    new $P994, "Undef"
  vivify_336:
    $P995 = $P994."ast"()
    $P996 = $P992."!make"($P995)
    .return ($P996)
  control_989:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P997, exception, "payload"
    .return ($P997)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("63_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1001
.annotate "line", 350
    new $P1000, 'ExceptionHandler'
    set_addr $P1000, control_999
    $P1000."handle_types"(58)
    push_eh $P1000
    .lex "self", self
    .lex "$/", param_1001
.annotate "line", 351
    find_lex $P1002, "$/"
.annotate "line", 352
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_337
    new $P1005, "Hash"
  vivify_337:
    set $P1006, $P1005["routine_declarator"]
    unless_null $P1006, vivify_338
    new $P1006, "Undef"
  vivify_338:
    if $P1006, if_1004
.annotate "line", 353
    find_lex $P1010, "$/"
    unless_null $P1010, vivify_339
    new $P1010, "Hash"
  vivify_339:
    set $P1011, $P1010["variable_declarator"]
    unless_null $P1011, vivify_340
    new $P1011, "Undef"
  vivify_340:
    $P1012 = $P1011."ast"()
    set $P1003, $P1012
.annotate "line", 352
    goto if_1004_end
  if_1004:
    find_lex $P1007, "$/"
    unless_null $P1007, vivify_341
    new $P1007, "Hash"
  vivify_341:
    set $P1008, $P1007["routine_declarator"]
    unless_null $P1008, vivify_342
    new $P1008, "Undef"
  vivify_342:
    $P1009 = $P1008."ast"()
    set $P1003, $P1009
  if_1004_end:
    $P1013 = $P1002."!make"($P1003)
.annotate "line", 350
    .return ($P1013)
  control_999:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1014, exception, "payload"
    .return ($P1014)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("64_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1018
.annotate "line", 356
    .const 'Sub' $P1058 = "65_1259420199.1428" 
    capture_lex $P1058
    new $P1017, 'ExceptionHandler'
    set_addr $P1017, control_1016
    $P1017."handle_types"(58)
    push_eh $P1017
    .lex "self", self
    .lex "$/", param_1018
.annotate "line", 357
    new $P1019, "Undef"
    .lex "$past", $P1019
.annotate "line", 358
    new $P1020, "Undef"
    .lex "$sigil", $P1020
.annotate "line", 359
    new $P1021, "Undef"
    .lex "$name", $P1021
.annotate "line", 360
    new $P1022, "Undef"
    .lex "$BLOCK", $P1022
.annotate "line", 357
    find_lex $P1023, "$/"
    unless_null $P1023, vivify_343
    new $P1023, "Hash"
  vivify_343:
    set $P1024, $P1023["variable"]
    unless_null $P1024, vivify_344
    new $P1024, "Undef"
  vivify_344:
    $P1025 = $P1024."ast"()
    store_lex "$past", $P1025
.annotate "line", 358
    find_lex $P1026, "$/"
    unless_null $P1026, vivify_345
    new $P1026, "Hash"
  vivify_345:
    set $P1027, $P1026["variable"]
    unless_null $P1027, vivify_346
    new $P1027, "Hash"
  vivify_346:
    set $P1028, $P1027["sigil"]
    unless_null $P1028, vivify_347
    new $P1028, "Undef"
  vivify_347:
    store_lex "$sigil", $P1028
.annotate "line", 359
    find_lex $P1029, "$past"
    $P1030 = $P1029."name"()
    store_lex "$name", $P1030
.annotate "line", 360
    get_global $P1031, "@BLOCK"
    unless_null $P1031, vivify_348
    new $P1031, "ResizablePMCArray"
  vivify_348:
    set $P1032, $P1031[0]
    unless_null $P1032, vivify_349
    new $P1032, "Undef"
  vivify_349:
    store_lex "$BLOCK", $P1032
.annotate "line", 361
    find_lex $P1034, "$BLOCK"
    find_lex $P1035, "$name"
    $P1036 = $P1034."symbol"($P1035)
    unless $P1036, if_1033_end
.annotate "line", 362
    find_lex $P1037, "$/"
    $P1038 = $P1037."CURSOR"()
    find_lex $P1039, "$name"
    $P1038."panic"("Redeclaration of symbol ", $P1039)
  if_1033_end:
.annotate "line", 364
    find_dynamic_lex $P1041, "$*SCOPE"
    unless_null $P1041, vivify_350
    get_hll_global $P1041, "$SCOPE"
    unless_null $P1041, vivify_351
    die "Contextual $*SCOPE not found"
  vivify_351:
  vivify_350:
    set $S1042, $P1041
    iseq $I1043, $S1042, "has"
    if $I1043, if_1040
.annotate "line", 373
    .const 'Sub' $P1058 = "65_1259420199.1428" 
    capture_lex $P1058
    $P1058()
    goto if_1040_end
  if_1040:
.annotate "line", 365
    find_lex $P1044, "$BLOCK"
    find_lex $P1045, "$name"
    $P1044."symbol"($P1045, "attribute" :named("scope"))
.annotate "line", 366
    find_lex $P1047, "$BLOCK"
    unless_null $P1047, vivify_356
    new $P1047, "Hash"
  vivify_356:
    set $P1048, $P1047["attributes"]
    unless_null $P1048, vivify_357
    new $P1048, "Undef"
  vivify_357:
    if $P1048, unless_1046_end
.annotate "line", 368
    get_hll_global $P1049, ["PAST"], "Op"
    $P1050 = $P1049."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1051, "$BLOCK"
    unless_null $P1051, vivify_358
    new $P1051, "Hash"
    store_lex "$BLOCK", $P1051
  vivify_358:
    set $P1051["attributes"], $P1050
  unless_1046_end:
.annotate "line", 370
    find_lex $P1052, "$BLOCK"
    unless_null $P1052, vivify_359
    new $P1052, "Hash"
  vivify_359:
    set $P1053, $P1052["attributes"]
    unless_null $P1053, vivify_360
    new $P1053, "Undef"
  vivify_360:
    find_lex $P1054, "$name"
    $P1053."push"($P1054)
.annotate "line", 371
    get_hll_global $P1055, ["PAST"], "Stmts"
    $P1056 = $P1055."new"()
    store_lex "$past", $P1056
  if_1040_end:
.annotate "line", 381
    find_lex $P1082, "$/"
    find_lex $P1083, "$past"
    $P1084 = $P1082."!make"($P1083)
.annotate "line", 356
    .return ($P1084)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1085, exception, "payload"
    .return ($P1085)
.end


.namespace ["NQP";"Actions"]
.sub "_block1057"  :anon :subid("65_1259420199.1428") :outer("64_1259420199.1428")
.annotate "line", 374
    new $P1059, "Undef"
    .lex "$scope", $P1059
.annotate "line", 375
    new $P1060, "Undef"
    .lex "$decl", $P1060
.annotate "line", 374
    find_dynamic_lex $P1063, "$*SCOPE"
    unless_null $P1063, vivify_352
    get_hll_global $P1063, "$SCOPE"
    unless_null $P1063, vivify_353
    die "Contextual $*SCOPE not found"
  vivify_353:
  vivify_352:
    set $S1064, $P1063
    iseq $I1065, $S1064, "our"
    if $I1065, if_1062
    new $P1067, "String"
    assign $P1067, "lexical"
    set $P1061, $P1067
    goto if_1062_end
  if_1062:
    new $P1066, "String"
    assign $P1066, "package"
    set $P1061, $P1066
  if_1062_end:
    store_lex "$scope", $P1061
.annotate "line", 375
    get_hll_global $P1068, ["PAST"], "Var"
    find_lex $P1069, "$name"
    find_lex $P1070, "$scope"
.annotate "line", 376
    find_lex $P1071, "$sigil"
    $P1072 = "sigiltype"($P1071)
    find_lex $P1073, "$/"
    $P1074 = $P1068."new"($P1069 :named("name"), $P1070 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1072 :named("viviself"), $P1073 :named("node"))
.annotate "line", 375
    store_lex "$decl", $P1074
.annotate "line", 378
    find_lex $P1075, "$BLOCK"
    find_lex $P1076, "$name"
    find_lex $P1077, "$scope"
    $P1075."symbol"($P1076, $P1077 :named("scope"))
.annotate "line", 379
    find_lex $P1078, "$BLOCK"
    unless_null $P1078, vivify_354
    new $P1078, "ResizablePMCArray"
  vivify_354:
    set $P1079, $P1078[0]
    unless_null $P1079, vivify_355
    new $P1079, "Undef"
  vivify_355:
    find_lex $P1080, "$decl"
    $P1081 = $P1079."push"($P1080)
.annotate "line", 373
    .return ($P1081)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("66_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1089
.annotate "line", 384
    new $P1088, 'ExceptionHandler'
    set_addr $P1088, control_1087
    $P1088."handle_types"(58)
    push_eh $P1088
    .lex "self", self
    .lex "$/", param_1089
    find_lex $P1090, "$/"
    find_lex $P1091, "$/"
    unless_null $P1091, vivify_361
    new $P1091, "Hash"
  vivify_361:
    set $P1092, $P1091["routine_def"]
    unless_null $P1092, vivify_362
    new $P1092, "Undef"
  vivify_362:
    $P1093 = $P1092."ast"()
    $P1094 = $P1090."!make"($P1093)
    .return ($P1094)
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1095, exception, "payload"
    .return ($P1095)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("67_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1099
.annotate "line", 385
    new $P1098, 'ExceptionHandler'
    set_addr $P1098, control_1097
    $P1098."handle_types"(58)
    push_eh $P1098
    .lex "self", self
    .lex "$/", param_1099
    find_lex $P1100, "$/"
    find_lex $P1101, "$/"
    unless_null $P1101, vivify_363
    new $P1101, "Hash"
  vivify_363:
    set $P1102, $P1101["method_def"]
    unless_null $P1102, vivify_364
    new $P1102, "Undef"
  vivify_364:
    $P1103 = $P1102."ast"()
    $P1104 = $P1100."!make"($P1103)
    .return ($P1104)
  control_1097:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1105, exception, "payload"
    .return ($P1105)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("68_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1109
.annotate "line", 387
    .const 'Sub' $P1120 = "69_1259420199.1428" 
    capture_lex $P1120
    new $P1108, 'ExceptionHandler'
    set_addr $P1108, control_1107
    $P1108."handle_types"(58)
    push_eh $P1108
    .lex "self", self
    .lex "$/", param_1109
.annotate "line", 388
    new $P1110, "Undef"
    .lex "$past", $P1110
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_365
    new $P1111, "Hash"
  vivify_365:
    set $P1112, $P1111["blockoid"]
    unless_null $P1112, vivify_366
    new $P1112, "Undef"
  vivify_366:
    $P1113 = $P1112."ast"()
    store_lex "$past", $P1113
.annotate "line", 389
    find_lex $P1114, "$past"
    $P1114."blocktype"("declaration")
.annotate "line", 390
    find_lex $P1115, "$past"
    $P1115."control"("return_pir")
.annotate "line", 391
    find_lex $P1117, "$/"
    unless_null $P1117, vivify_367
    new $P1117, "Hash"
  vivify_367:
    set $P1118, $P1117["deflongname"]
    unless_null $P1118, vivify_368
    new $P1118, "Undef"
  vivify_368:
    unless $P1118, if_1116_end
    .const 'Sub' $P1120 = "69_1259420199.1428" 
    capture_lex $P1120
    $P1120()
  if_1116_end:
.annotate "line", 401
    find_lex $P1148, "$/"
    find_lex $P1149, "$past"
    $P1150 = $P1148."!make"($P1149)
.annotate "line", 387
    .return ($P1150)
  control_1107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1151, exception, "payload"
    .return ($P1151)
.end


.namespace ["NQP";"Actions"]
.sub "_block1119"  :anon :subid("69_1259420199.1428") :outer("68_1259420199.1428")
.annotate "line", 392
    new $P1121, "Undef"
    .lex "$name", $P1121
    find_lex $P1122, "$/"
    unless_null $P1122, vivify_369
    new $P1122, "Hash"
  vivify_369:
    set $P1123, $P1122["deflongname"]
    unless_null $P1123, vivify_370
    new $P1123, "ResizablePMCArray"
  vivify_370:
    set $P1124, $P1123[0]
    unless_null $P1124, vivify_371
    new $P1124, "Undef"
  vivify_371:
    $P1125 = $P1124."ast"()
    set $S1126, $P1125
    new $P1127, 'String'
    set $P1127, $S1126
    store_lex "$name", $P1127
.annotate "line", 393
    find_lex $P1128, "$past"
    find_lex $P1129, "$name"
    $P1128."name"($P1129)
.annotate "line", 394
    find_dynamic_lex $P1132, "$*SCOPE"
    unless_null $P1132, vivify_372
    get_hll_global $P1132, "$SCOPE"
    unless_null $P1132, vivify_373
    die "Contextual $*SCOPE not found"
  vivify_373:
  vivify_372:
    set $S1133, $P1132
    isne $I1134, $S1133, "our"
    if $I1134, if_1131
    new $P1130, 'Integer'
    set $P1130, $I1134
    goto if_1131_end
  if_1131:
.annotate "line", 395
    get_global $P1135, "@BLOCK"
    unless_null $P1135, vivify_374
    new $P1135, "ResizablePMCArray"
  vivify_374:
    set $P1136, $P1135[0]
    unless_null $P1136, vivify_375
    new $P1136, "ResizablePMCArray"
  vivify_375:
    set $P1137, $P1136[0]
    unless_null $P1137, vivify_376
    new $P1137, "Undef"
  vivify_376:
    get_hll_global $P1138, ["PAST"], "Var"
    find_lex $P1139, "$name"
    find_lex $P1140, "$past"
    $P1141 = $P1138."new"($P1139 :named("name"), 1 :named("isdecl"), $P1140 :named("viviself"), "lexical" :named("scope"))
    $P1137."push"($P1141)
.annotate "line", 397
    get_global $P1142, "@BLOCK"
    unless_null $P1142, vivify_377
    new $P1142, "ResizablePMCArray"
  vivify_377:
    set $P1143, $P1142[0]
    unless_null $P1143, vivify_378
    new $P1143, "Undef"
  vivify_378:
    find_lex $P1144, "$name"
    $P1143."symbol"($P1144, "lexical" :named("scope"))
.annotate "line", 398
    get_hll_global $P1145, ["PAST"], "Var"
    find_lex $P1146, "$name"
    $P1147 = $P1145."new"($P1146 :named("name"))
    store_lex "$past", $P1147
.annotate "line", 394
    set $P1130, $P1147
  if_1131_end:
.annotate "line", 391
    .return ($P1130)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("70_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1155
.annotate "line", 405
    .const 'Sub' $P1171 = "71_1259420199.1428" 
    capture_lex $P1171
    new $P1154, 'ExceptionHandler'
    set_addr $P1154, control_1153
    $P1154."handle_types"(58)
    push_eh $P1154
    .lex "self", self
    .lex "$/", param_1155
.annotate "line", 406
    new $P1156, "Undef"
    .lex "$past", $P1156
    find_lex $P1157, "$/"
    unless_null $P1157, vivify_379
    new $P1157, "Hash"
  vivify_379:
    set $P1158, $P1157["blockoid"]
    unless_null $P1158, vivify_380
    new $P1158, "Undef"
  vivify_380:
    $P1159 = $P1158."ast"()
    store_lex "$past", $P1159
.annotate "line", 407
    find_lex $P1160, "$past"
    $P1160."blocktype"("method")
.annotate "line", 408
    find_lex $P1161, "$past"
    $P1161."control"("return_pir")
.annotate "line", 409
    find_lex $P1162, "$past"
    unless_null $P1162, vivify_381
    new $P1162, "ResizablePMCArray"
  vivify_381:
    set $P1163, $P1162[0]
    unless_null $P1163, vivify_382
    new $P1163, "Undef"
  vivify_382:
    get_hll_global $P1164, ["PAST"], "Op"
    $P1165 = $P1164."new"("    .lex \"self\", self" :named("inline"))
    $P1163."unshift"($P1165)
.annotate "line", 410
    find_lex $P1166, "$past"
    $P1166."symbol"("self", "lexical" :named("scope"))
.annotate "line", 411
    find_lex $P1168, "$/"
    unless_null $P1168, vivify_383
    new $P1168, "Hash"
  vivify_383:
    set $P1169, $P1168["deflongname"]
    unless_null $P1169, vivify_384
    new $P1169, "Undef"
  vivify_384:
    unless $P1169, if_1167_end
    .const 'Sub' $P1171 = "71_1259420199.1428" 
    capture_lex $P1171
    $P1171()
  if_1167_end:
.annotate "line", 415
    find_lex $P1182, "$/"
    find_lex $P1183, "$past"
    $P1184 = $P1182."!make"($P1183)
.annotate "line", 405
    .return ($P1184)
  control_1153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1185, exception, "payload"
    .return ($P1185)
.end


.namespace ["NQP";"Actions"]
.sub "_block1170"  :anon :subid("71_1259420199.1428") :outer("70_1259420199.1428")
.annotate "line", 412
    new $P1172, "Undef"
    .lex "$name", $P1172
    find_lex $P1173, "$/"
    unless_null $P1173, vivify_385
    new $P1173, "Hash"
  vivify_385:
    set $P1174, $P1173["deflongname"]
    unless_null $P1174, vivify_386
    new $P1174, "ResizablePMCArray"
  vivify_386:
    set $P1175, $P1174[0]
    unless_null $P1175, vivify_387
    new $P1175, "Undef"
  vivify_387:
    $P1176 = $P1175."ast"()
    set $S1177, $P1176
    new $P1178, 'String'
    set $P1178, $S1177
    store_lex "$name", $P1178
.annotate "line", 413
    find_lex $P1179, "$past"
    find_lex $P1180, "$name"
    $P1181 = $P1179."name"($P1180)
.annotate "line", 411
    .return ($P1181)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("72_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1189
.annotate "line", 419
    .const 'Sub' $P1200 = "73_1259420199.1428" 
    capture_lex $P1200
    new $P1188, 'ExceptionHandler'
    set_addr $P1188, control_1187
    $P1188."handle_types"(58)
    push_eh $P1188
    .lex "self", self
    .lex "$/", param_1189
.annotate "line", 420
    new $P1190, "Undef"
    .lex "$BLOCKINIT", $P1190
    get_global $P1191, "@BLOCK"
    unless_null $P1191, vivify_388
    new $P1191, "ResizablePMCArray"
  vivify_388:
    set $P1192, $P1191[0]
    unless_null $P1192, vivify_389
    new $P1192, "ResizablePMCArray"
  vivify_389:
    set $P1193, $P1192[0]
    unless_null $P1193, vivify_390
    new $P1193, "Undef"
  vivify_390:
    store_lex "$BLOCKINIT", $P1193
.annotate "line", 421
    find_lex $P1195, "$/"
    unless_null $P1195, vivify_391
    new $P1195, "Hash"
  vivify_391:
    set $P1196, $P1195["parameter"]
    unless_null $P1196, vivify_392
    new $P1196, "Undef"
  vivify_392:
    defined $I1197, $P1196
    unless $I1197, for_undef_393
    iter $P1194, $P1196
    new $P1207, 'ExceptionHandler'
    set_addr $P1207, loop1206_handler
    $P1207."handle_types"(65, 67, 66)
    push_eh $P1207
  loop1206_test:
    unless $P1194, loop1206_done
    shift $P1198, $P1194
  loop1206_redo:
    .const 'Sub' $P1200 = "73_1259420199.1428" 
    capture_lex $P1200
    $P1200($P1198)
  loop1206_next:
    goto loop1206_test
  loop1206_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1208, exception, 'type'
    eq $P1208, 65, loop1206_next
    eq $P1208, 67, loop1206_redo
  loop1206_done:
    pop_eh 
  for_undef_393:
.annotate "line", 419
    .return ($P1194)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, "payload"
    .return ($P1209)
.end


.namespace ["NQP";"Actions"]
.sub "_block1199"  :anon :subid("73_1259420199.1428") :outer("72_1259420199.1428")
    .param pmc param_1201
.annotate "line", 421
    .lex "$_", param_1201
    find_lex $P1202, "$BLOCKINIT"
    find_lex $P1203, "$_"
    $P1204 = $P1203."ast"()
    $P1205 = $P1202."push"($P1204)
    .return ($P1205)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("74_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1213
.annotate "line", 424
    new $P1212, 'ExceptionHandler'
    set_addr $P1212, control_1211
    $P1212."handle_types"(58)
    push_eh $P1212
    .lex "self", self
    .lex "$/", param_1213
.annotate "line", 425
    new $P1214, "Undef"
    .lex "$quant", $P1214
.annotate "line", 426
    new $P1215, "Undef"
    .lex "$past", $P1215
.annotate "line", 425
    find_lex $P1216, "$/"
    unless_null $P1216, vivify_394
    new $P1216, "Hash"
  vivify_394:
    set $P1217, $P1216["quant"]
    unless_null $P1217, vivify_395
    new $P1217, "Undef"
  vivify_395:
    store_lex "$quant", $P1217
    find_lex $P1218, "$past"
.annotate "line", 427
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_396
    new $P1220, "Hash"
  vivify_396:
    set $P1221, $P1220["named_param"]
    unless_null $P1221, vivify_397
    new $P1221, "Undef"
  vivify_397:
    if $P1221, if_1219
.annotate "line", 434
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_398
    new $P1235, "Hash"
  vivify_398:
    set $P1236, $P1235["param_var"]
    unless_null $P1236, vivify_399
    new $P1236, "Undef"
  vivify_399:
    $P1237 = $P1236."ast"()
    store_lex "$past", $P1237
.annotate "line", 435
    find_lex $P1239, "$quant"
    set $S1240, $P1239
    iseq $I1241, $S1240, "*"
    if $I1241, if_1238
.annotate "line", 439
    find_lex $P1250, "$quant"
    set $S1251, $P1250
    iseq $I1252, $S1251, "?"
    unless $I1252, if_1249_end
.annotate "line", 440
    find_lex $P1253, "$past"
    find_lex $P1254, "$/"
    unless_null $P1254, vivify_400
    new $P1254, "Hash"
  vivify_400:
    set $P1255, $P1254["param_var"]
    unless_null $P1255, vivify_401
    new $P1255, "Hash"
  vivify_401:
    set $P1256, $P1255["sigil"]
    unless_null $P1256, vivify_402
    new $P1256, "Undef"
  vivify_402:
    $P1257 = "sigiltype"($P1256)
    $P1253."viviself"($P1257)
  if_1249_end:
.annotate "line", 439
    goto if_1238_end
  if_1238:
.annotate "line", 436
    find_lex $P1242, "$past"
    $P1242."slurpy"(1)
.annotate "line", 437
    find_lex $P1243, "$past"
    find_lex $P1244, "$/"
    unless_null $P1244, vivify_403
    new $P1244, "Hash"
  vivify_403:
    set $P1245, $P1244["param_var"]
    unless_null $P1245, vivify_404
    new $P1245, "Hash"
  vivify_404:
    set $P1246, $P1245["sigil"]
    unless_null $P1246, vivify_405
    new $P1246, "Undef"
  vivify_405:
    set $S1247, $P1246
    iseq $I1248, $S1247, "%"
    $P1243."named"($I1248)
  if_1238_end:
.annotate "line", 433
    goto if_1219_end
  if_1219:
.annotate "line", 428
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_406
    new $P1222, "Hash"
  vivify_406:
    set $P1223, $P1222["named_param"]
    unless_null $P1223, vivify_407
    new $P1223, "Undef"
  vivify_407:
    $P1224 = $P1223."ast"()
    store_lex "$past", $P1224
.annotate "line", 429
    find_lex $P1226, "$quant"
    set $S1227, $P1226
    isne $I1228, $S1227, "!"
    unless $I1228, if_1225_end
.annotate "line", 430
    find_lex $P1229, "$past"
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_408
    new $P1230, "Hash"
  vivify_408:
    set $P1231, $P1230["named_param"]
    unless_null $P1231, vivify_409
    new $P1231, "Hash"
  vivify_409:
    set $P1232, $P1231["param_var"]
    unless_null $P1232, vivify_410
    new $P1232, "Hash"
  vivify_410:
    set $P1233, $P1232["sigil"]
    unless_null $P1233, vivify_411
    new $P1233, "Undef"
  vivify_411:
    $P1234 = "sigiltype"($P1233)
    $P1229."viviself"($P1234)
  if_1225_end:
  if_1219_end:
.annotate "line", 443
    find_lex $P1259, "$/"
    unless_null $P1259, vivify_412
    new $P1259, "Hash"
  vivify_412:
    set $P1260, $P1259["default_value"]
    unless_null $P1260, vivify_413
    new $P1260, "Undef"
  vivify_413:
    unless $P1260, if_1258_end
.annotate "line", 444
    find_lex $P1262, "$quant"
    set $S1263, $P1262
    iseq $I1264, $S1263, "*"
    unless $I1264, if_1261_end
.annotate "line", 445
    find_lex $P1265, "$/"
    $P1266 = $P1265."CURSOR"()
    $P1266."panic"("Can't put default on slurpy parameter")
  if_1261_end:
.annotate "line", 447
    find_lex $P1268, "$quant"
    set $S1269, $P1268
    iseq $I1270, $S1269, "!"
    unless $I1270, if_1267_end
.annotate "line", 448
    find_lex $P1271, "$/"
    $P1272 = $P1271."CURSOR"()
    $P1272."panic"("Can't put default on required parameter")
  if_1267_end:
.annotate "line", 450
    find_lex $P1273, "$past"
    find_lex $P1274, "$/"
    unless_null $P1274, vivify_414
    new $P1274, "Hash"
  vivify_414:
    set $P1275, $P1274["default_value"]
    unless_null $P1275, vivify_415
    new $P1275, "ResizablePMCArray"
  vivify_415:
    set $P1276, $P1275[0]
    unless_null $P1276, vivify_416
    new $P1276, "Hash"
  vivify_416:
    set $P1277, $P1276["EXPR"]
    unless_null $P1277, vivify_417
    new $P1277, "Undef"
  vivify_417:
    $P1278 = $P1277."ast"()
    $P1273."viviself"($P1278)
  if_1258_end:
.annotate "line", 452
    find_lex $P1280, "$past"
    $P1281 = $P1280."viviself"()
    if $P1281, unless_1279_end
    get_global $P1282, "@BLOCK"
    unless_null $P1282, vivify_418
    new $P1282, "ResizablePMCArray"
  vivify_418:
    set $P1283, $P1282[0]
    unless_null $P1283, vivify_419
    new $P1283, "Undef"
  vivify_419:
    get_global $P1284, "@BLOCK"
    unless_null $P1284, vivify_420
    new $P1284, "ResizablePMCArray"
  vivify_420:
    set $P1285, $P1284[0]
    unless_null $P1285, vivify_421
    new $P1285, "Undef"
  vivify_421:
    $P1286 = $P1285."arity"()
    set $N1287, $P1286
    new $P1288, 'Float'
    set $P1288, $N1287
    add $P1289, $P1288, 1
    $P1283."arity"($P1289)
  unless_1279_end:
.annotate "line", 453
    find_lex $P1290, "$/"
    find_lex $P1291, "$past"
    $P1292 = $P1290."!make"($P1291)
.annotate "line", 424
    .return ($P1292)
  control_1211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1293, exception, "payload"
    .return ($P1293)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("75_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1297
.annotate "line", 456
    new $P1296, 'ExceptionHandler'
    set_addr $P1296, control_1295
    $P1296."handle_types"(58)
    push_eh $P1296
    .lex "self", self
    .lex "$/", param_1297
.annotate "line", 457
    new $P1298, "Undef"
    .lex "$name", $P1298
.annotate "line", 458
    new $P1299, "Undef"
    .lex "$past", $P1299
.annotate "line", 457
    find_lex $P1300, "$/"
    set $S1301, $P1300
    new $P1302, 'String'
    set $P1302, $S1301
    store_lex "$name", $P1302
.annotate "line", 458
    get_hll_global $P1303, ["PAST"], "Var"
    find_lex $P1304, "$name"
    find_lex $P1305, "$/"
    $P1306 = $P1303."new"($P1304 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1305 :named("node"))
    store_lex "$past", $P1306
.annotate "line", 460
    get_global $P1307, "@BLOCK"
    unless_null $P1307, vivify_422
    new $P1307, "ResizablePMCArray"
  vivify_422:
    set $P1308, $P1307[0]
    unless_null $P1308, vivify_423
    new $P1308, "Undef"
  vivify_423:
    find_lex $P1309, "$name"
    $P1308."symbol"($P1309, "lexical" :named("scope"))
.annotate "line", 461
    find_lex $P1310, "$/"
    find_lex $P1311, "$past"
    $P1312 = $P1310."!make"($P1311)
.annotate "line", 456
    .return ($P1312)
  control_1295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1313, exception, "payload"
    .return ($P1313)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("76_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1317
.annotate "line", 464
    new $P1316, 'ExceptionHandler'
    set_addr $P1316, control_1315
    $P1316."handle_types"(58)
    push_eh $P1316
    .lex "self", self
    .lex "$/", param_1317
.annotate "line", 465
    new $P1318, "Undef"
    .lex "$past", $P1318
    find_lex $P1319, "$/"
    unless_null $P1319, vivify_424
    new $P1319, "Hash"
  vivify_424:
    set $P1320, $P1319["param_var"]
    unless_null $P1320, vivify_425
    new $P1320, "Undef"
  vivify_425:
    $P1321 = $P1320."ast"()
    store_lex "$past", $P1321
.annotate "line", 466
    find_lex $P1322, "$past"
    find_lex $P1323, "$/"
    unless_null $P1323, vivify_426
    new $P1323, "Hash"
  vivify_426:
    set $P1324, $P1323["param_var"]
    unless_null $P1324, vivify_427
    new $P1324, "Hash"
  vivify_427:
    set $P1325, $P1324["name"]
    unless_null $P1325, vivify_428
    new $P1325, "Undef"
  vivify_428:
    set $S1326, $P1325
    $P1322."named"($S1326)
.annotate "line", 467
    find_lex $P1327, "$/"
    find_lex $P1328, "$past"
    $P1329 = $P1327."!make"($P1328)
.annotate "line", 464
    .return ($P1329)
  control_1315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1330, exception, "payload"
    .return ($P1330)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("77_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1334
    .param pmc param_1335 :optional
    .param int has_param_1335 :opt_flag
.annotate "line", 470
    .const 'Sub' $P1352 = "78_1259420199.1428" 
    capture_lex $P1352
    new $P1333, 'ExceptionHandler'
    set_addr $P1333, control_1332
    $P1333."handle_types"(58)
    push_eh $P1333
    .lex "self", self
    .lex "$/", param_1334
    if has_param_1335, optparam_429
    new $P1336, "Undef"
    set param_1335, $P1336
  optparam_429:
    .lex "$key", param_1335
.annotate "line", 471
    new $P1337, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1337
.annotate "line", 474
    new $P1338, "Undef"
    .lex "$name", $P1338
.annotate "line", 475
    new $P1339, "Undef"
    .lex "$past", $P1339
.annotate "line", 471

        $P1340 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1340
.annotate "line", 474
    find_lex $P1341, "$/"
    unless_null $P1341, vivify_430
    new $P1341, "Hash"
  vivify_430:
    set $P1342, $P1341["deflongname"]
    unless_null $P1342, vivify_431
    new $P1342, "Undef"
  vivify_431:
    $P1343 = $P1342."ast"()
    set $S1344, $P1343
    new $P1345, 'String'
    set $P1345, $S1344
    store_lex "$name", $P1345
    find_lex $P1346, "$past"
.annotate "line", 476
    find_lex $P1348, "$key"
    set $S1349, $P1348
    iseq $I1350, $S1349, "open"
    if $I1350, if_1347
.annotate "line", 489
    find_lex $P1380, "$/"
    unless_null $P1380, vivify_432
    new $P1380, "Hash"
  vivify_432:
    set $P1381, $P1380["proto"]
    unless_null $P1381, vivify_433
    new $P1381, "Undef"
  vivify_433:
    if $P1381, if_1379
.annotate "line", 518
    get_hll_global $P1404, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1405, "$/"
    unless_null $P1405, vivify_434
    new $P1405, "Hash"
  vivify_434:
    set $P1406, $P1405["p6regex"]
    unless_null $P1406, vivify_435
    new $P1406, "Undef"
  vivify_435:
    $P1407 = $P1406."ast"()
    get_global $P1408, "@BLOCK"
    $P1409 = $P1408."shift"()
    $P1410 = $P1404($P1407, $P1409)
    store_lex "$past", $P1410
.annotate "line", 519
    find_lex $P1411, "$past"
    find_lex $P1412, "$name"
    $P1411."name"($P1412)
.annotate "line", 520
    find_lex $P1413, "@MODIFIERS"
    $P1413."shift"()
.annotate "line", 516
    goto if_1379_end
  if_1379:
.annotate "line", 491
    get_hll_global $P1382, ["PAST"], "Stmts"
.annotate "line", 492
    get_hll_global $P1383, ["PAST"], "Block"
    find_lex $P1384, "$name"
.annotate "line", 493
    get_hll_global $P1385, ["PAST"], "Op"
.annotate "line", 494
    get_hll_global $P1386, ["PAST"], "Var"
    $P1387 = $P1386."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1388, "$name"
    $P1389 = $P1385."new"($P1387, $P1388, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 493
    find_lex $P1390, "$/"
    $P1391 = $P1383."new"($P1389, $P1384 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1390 :named("node"))
.annotate "line", 503
    get_hll_global $P1392, ["PAST"], "Block"
    new $P1393, "String"
    assign $P1393, "!PREFIX__"
    find_lex $P1394, "$name"
    concat $P1395, $P1393, $P1394
.annotate "line", 504
    get_hll_global $P1396, ["PAST"], "Op"
.annotate "line", 505
    get_hll_global $P1397, ["PAST"], "Var"
    $P1398 = $P1397."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1399, "$name"
    $P1400 = $P1396."new"($P1398, $P1399, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 504
    find_lex $P1401, "$/"
    $P1402 = $P1392."new"($P1400, $P1395 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1401 :named("node"))
.annotate "line", 503
    $P1403 = $P1382."new"($P1391, $P1402)
.annotate "line", 491
    store_lex "$past", $P1403
  if_1379_end:
.annotate "line", 489
    goto if_1347_end
  if_1347:
.annotate "line", 476
    .const 'Sub' $P1352 = "78_1259420199.1428" 
    capture_lex $P1352
    $P1352()
  if_1347_end:
.annotate "line", 522
    find_lex $P1414, "$/"
    find_lex $P1415, "$past"
    $P1416 = $P1414."!make"($P1415)
.annotate "line", 470
    .return ($P1416)
  control_1332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1417, exception, "payload"
    .return ($P1417)
.end


.namespace ["NQP";"Actions"]
.sub "_block1351"  :anon :subid("78_1259420199.1428") :outer("77_1259420199.1428")
.annotate "line", 477
    new $P1353, "Hash"
    .lex "%h", $P1353
.annotate "line", 476
    find_lex $P1354, "%h"
.annotate "line", 478
    find_lex $P1356, "$/"
    unless_null $P1356, vivify_436
    new $P1356, "Hash"
  vivify_436:
    set $P1357, $P1356["sym"]
    unless_null $P1357, vivify_437
    new $P1357, "Undef"
  vivify_437:
    set $S1358, $P1357
    iseq $I1359, $S1358, "token"
    unless $I1359, if_1355_end
    new $P1360, "Integer"
    assign $P1360, 1
    find_lex $P1361, "%h"
    unless_null $P1361, vivify_438
    new $P1361, "Hash"
    store_lex "%h", $P1361
  vivify_438:
    set $P1361["r"], $P1360
  if_1355_end:
.annotate "line", 479
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_439
    new $P1363, "Hash"
  vivify_439:
    set $P1364, $P1363["sym"]
    unless_null $P1364, vivify_440
    new $P1364, "Undef"
  vivify_440:
    set $S1365, $P1364
    iseq $I1366, $S1365, "rule"
    unless $I1366, if_1362_end
    new $P1367, "Integer"
    assign $P1367, 1
    find_lex $P1368, "%h"
    unless_null $P1368, vivify_441
    new $P1368, "Hash"
    store_lex "%h", $P1368
  vivify_441:
    set $P1368["r"], $P1367
    new $P1369, "Integer"
    assign $P1369, 1
    find_lex $P1370, "%h"
    unless_null $P1370, vivify_442
    new $P1370, "Hash"
    store_lex "%h", $P1370
  vivify_442:
    set $P1370["s"], $P1369
  if_1362_end:
.annotate "line", 480
    find_lex $P1371, "@MODIFIERS"
    find_lex $P1372, "%h"
    $P1371."unshift"($P1372)
.annotate "line", 481

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 485
    get_global $P1373, "@BLOCK"
    unless_null $P1373, vivify_443
    new $P1373, "ResizablePMCArray"
  vivify_443:
    set $P1374, $P1373[0]
    unless_null $P1374, vivify_444
    new $P1374, "Undef"
  vivify_444:
    $P1374."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 486
    get_global $P1375, "@BLOCK"
    unless_null $P1375, vivify_445
    new $P1375, "ResizablePMCArray"
  vivify_445:
    set $P1376, $P1375[0]
    unless_null $P1376, vivify_446
    new $P1376, "Undef"
  vivify_446:
    $P1376."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 487
    new $P1377, "Exception"
    set $P1377['type'], 58
    new $P1378, "Integer"
    assign $P1378, 0
    setattribute $P1377, 'payload', $P1378
    throw $P1377
.annotate "line", 476
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("79_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1421
.annotate "line", 526
    new $P1420, 'ExceptionHandler'
    set_addr $P1420, control_1419
    $P1420."handle_types"(58)
    push_eh $P1420
    .lex "self", self
    .lex "$/", param_1421
.annotate "line", 527
    new $P1422, "Undef"
    .lex "$past", $P1422
    find_lex $P1425, "$/"
    unless_null $P1425, vivify_447
    new $P1425, "Hash"
  vivify_447:
    set $P1426, $P1425["args"]
    unless_null $P1426, vivify_448
    new $P1426, "Undef"
  vivify_448:
    if $P1426, if_1424
    get_hll_global $P1431, ["PAST"], "Op"
    find_lex $P1432, "$/"
    $P1433 = $P1431."new"($P1432 :named("node"))
    set $P1423, $P1433
    goto if_1424_end
  if_1424:
    find_lex $P1427, "$/"
    unless_null $P1427, vivify_449
    new $P1427, "Hash"
  vivify_449:
    set $P1428, $P1427["args"]
    unless_null $P1428, vivify_450
    new $P1428, "ResizablePMCArray"
  vivify_450:
    set $P1429, $P1428[0]
    unless_null $P1429, vivify_451
    new $P1429, "Undef"
  vivify_451:
    $P1430 = $P1429."ast"()
    set $P1423, $P1430
  if_1424_end:
    store_lex "$past", $P1423
.annotate "line", 528
    find_lex $P1434, "$past"
    find_lex $P1437, "$/"
    unless_null $P1437, vivify_452
    new $P1437, "Hash"
  vivify_452:
    set $P1438, $P1437["quote"]
    unless_null $P1438, vivify_453
    new $P1438, "Undef"
  vivify_453:
    if $P1438, if_1436
    find_lex $P1442, "$/"
    unless_null $P1442, vivify_454
    new $P1442, "Hash"
  vivify_454:
    set $P1443, $P1442["longname"]
    unless_null $P1443, vivify_455
    new $P1443, "Undef"
  vivify_455:
    set $S1444, $P1443
    new $P1435, 'String'
    set $P1435, $S1444
    goto if_1436_end
  if_1436:
    find_lex $P1439, "$/"
    unless_null $P1439, vivify_456
    new $P1439, "Hash"
  vivify_456:
    set $P1440, $P1439["quote"]
    unless_null $P1440, vivify_457
    new $P1440, "Undef"
  vivify_457:
    $P1441 = $P1440."ast"()
    set $P1435, $P1441
  if_1436_end:
    $P1434."name"($P1435)
.annotate "line", 529
    find_lex $P1445, "$past"
    $P1445."pasttype"("callmethod")
.annotate "line", 530
    find_lex $P1446, "$/"
    find_lex $P1447, "$past"
    $P1448 = $P1446."!make"($P1447)
.annotate "line", 526
    .return ($P1448)
  control_1419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1449, exception, "payload"
    .return ($P1449)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("80_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1453
.annotate "line", 535
    new $P1452, 'ExceptionHandler'
    set_addr $P1452, control_1451
    $P1452."handle_types"(58)
    push_eh $P1452
    .lex "self", self
    .lex "$/", param_1453
.annotate "line", 536
    find_lex $P1454, "$/"
    get_hll_global $P1455, ["PAST"], "Var"
    $P1456 = $P1455."new"("self" :named("name"))
    $P1457 = $P1454."!make"($P1456)
.annotate "line", 535
    .return ($P1457)
  control_1451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1458, exception, "payload"
    .return ($P1458)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("81_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1462
.annotate "line", 539
    new $P1461, 'ExceptionHandler'
    set_addr $P1461, control_1460
    $P1461."handle_types"(58)
    push_eh $P1461
    .lex "self", self
    .lex "$/", param_1462
.annotate "line", 540
    new $P1463, "Undef"
    .lex "$past", $P1463
    find_lex $P1464, "$/"
    unless_null $P1464, vivify_458
    new $P1464, "Hash"
  vivify_458:
    set $P1465, $P1464["args"]
    unless_null $P1465, vivify_459
    new $P1465, "Undef"
  vivify_459:
    $P1466 = $P1465."ast"()
    store_lex "$past", $P1466
.annotate "line", 541
    find_lex $P1467, "$past"
    find_lex $P1468, "$/"
    unless_null $P1468, vivify_460
    new $P1468, "Hash"
  vivify_460:
    set $P1469, $P1468["identifier"]
    unless_null $P1469, vivify_461
    new $P1469, "Undef"
  vivify_461:
    set $S1470, $P1469
    $P1467."name"($S1470)
.annotate "line", 542
    find_lex $P1471, "$/"
    find_lex $P1472, "$past"
    $P1473 = $P1471."!make"($P1472)
.annotate "line", 539
    .return ($P1473)
  control_1460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1474, exception, "payload"
    .return ($P1474)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("82_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1478
.annotate "line", 545
    new $P1477, 'ExceptionHandler'
    set_addr $P1477, control_1476
    $P1477."handle_types"(58)
    push_eh $P1477
    .lex "self", self
    .lex "$/", param_1478
.annotate "line", 546
    new $P1479, "ResizablePMCArray"
    .lex "@ns", $P1479
.annotate "line", 547
    new $P1480, "Undef"
    .lex "$name", $P1480
.annotate "line", 549
    new $P1481, "Undef"
    .lex "$var", $P1481
.annotate "line", 551
    new $P1482, "Undef"
    .lex "$past", $P1482
.annotate "line", 546
    find_lex $P1483, "$/"
    unless_null $P1483, vivify_462
    new $P1483, "Hash"
  vivify_462:
    set $P1484, $P1483["name"]
    unless_null $P1484, vivify_463
    new $P1484, "Hash"
  vivify_463:
    set $P1485, $P1484["identifier"]
    unless_null $P1485, vivify_464
    new $P1485, "Undef"
  vivify_464:
    clone $P1486, $P1485
    store_lex "@ns", $P1486
.annotate "line", 547
    find_lex $P1487, "@ns"
    $P1488 = $P1487."pop"()
    store_lex "$name", $P1488
.annotate "line", 548
    find_lex $P1492, "@ns"
    if $P1492, if_1491
    set $P1490, $P1492
    goto if_1491_end
  if_1491:
    find_lex $P1493, "@ns"
    unless_null $P1493, vivify_465
    new $P1493, "ResizablePMCArray"
  vivify_465:
    set $P1494, $P1493[0]
    unless_null $P1494, vivify_466
    new $P1494, "Undef"
  vivify_466:
    set $S1495, $P1494
    iseq $I1496, $S1495, "GLOBAL"
    new $P1490, 'Integer'
    set $P1490, $I1496
  if_1491_end:
    unless $P1490, if_1489_end
    find_lex $P1497, "@ns"
    $P1497."shift"()
  if_1489_end:
.annotate "line", 550
    get_hll_global $P1498, ["PAST"], "Var"
    find_lex $P1499, "$name"
    set $S1500, $P1499
    find_lex $P1501, "@ns"
    $P1502 = $P1498."new"($S1500 :named("name"), $P1501 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1502
.annotate "line", 551
    find_lex $P1503, "$var"
    store_lex "$past", $P1503
.annotate "line", 552
    find_lex $P1505, "$/"
    unless_null $P1505, vivify_467
    new $P1505, "Hash"
  vivify_467:
    set $P1506, $P1505["args"]
    unless_null $P1506, vivify_468
    new $P1506, "Undef"
  vivify_468:
    unless $P1506, if_1504_end
.annotate "line", 553
    find_lex $P1507, "$/"
    unless_null $P1507, vivify_469
    new $P1507, "Hash"
  vivify_469:
    set $P1508, $P1507["args"]
    unless_null $P1508, vivify_470
    new $P1508, "ResizablePMCArray"
  vivify_470:
    set $P1509, $P1508[0]
    unless_null $P1509, vivify_471
    new $P1509, "Undef"
  vivify_471:
    $P1510 = $P1509."ast"()
    store_lex "$past", $P1510
.annotate "line", 554
    find_lex $P1511, "$past"
    find_lex $P1512, "$var"
    $P1511."unshift"($P1512)
  if_1504_end:
.annotate "line", 556
    find_lex $P1513, "$/"
    find_lex $P1514, "$past"
    $P1515 = $P1513."!make"($P1514)
.annotate "line", 545
    .return ($P1515)
  control_1476:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1516, exception, "payload"
    .return ($P1516)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("83_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1520
.annotate "line", 559
    new $P1519, 'ExceptionHandler'
    set_addr $P1519, control_1518
    $P1519."handle_types"(58)
    push_eh $P1519
    .lex "self", self
    .lex "$/", param_1520
.annotate "line", 560
    new $P1521, "Undef"
    .lex "$past", $P1521
.annotate "line", 561
    new $P1522, "Undef"
    .lex "$pirop", $P1522
.annotate "line", 560
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_472
    new $P1525, "Hash"
  vivify_472:
    set $P1526, $P1525["args"]
    unless_null $P1526, vivify_473
    new $P1526, "Undef"
  vivify_473:
    if $P1526, if_1524
    get_hll_global $P1531, ["PAST"], "Op"
    find_lex $P1532, "$/"
    $P1533 = $P1531."new"($P1532 :named("node"))
    set $P1523, $P1533
    goto if_1524_end
  if_1524:
    find_lex $P1527, "$/"
    unless_null $P1527, vivify_474
    new $P1527, "Hash"
  vivify_474:
    set $P1528, $P1527["args"]
    unless_null $P1528, vivify_475
    new $P1528, "ResizablePMCArray"
  vivify_475:
    set $P1529, $P1528[0]
    unless_null $P1529, vivify_476
    new $P1529, "Undef"
  vivify_476:
    $P1530 = $P1529."ast"()
    set $P1523, $P1530
  if_1524_end:
    store_lex "$past", $P1523
.annotate "line", 561
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_477
    new $P1534, "Hash"
  vivify_477:
    set $P1535, $P1534["op"]
    unless_null $P1535, vivify_478
    new $P1535, "Undef"
  vivify_478:
    set $S1536, $P1535
    new $P1537, 'String'
    set $P1537, $S1536
    store_lex "$pirop", $P1537
.annotate "line", 562

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1538 = box $S0
    
    store_lex "$pirop", $P1538
.annotate "line", 569
    find_lex $P1539, "$past"
    find_lex $P1540, "$pirop"
    $P1539."pirop"($P1540)
.annotate "line", 570
    find_lex $P1541, "$past"
    $P1541."pasttype"("pirop")
.annotate "line", 571
    find_lex $P1542, "$/"
    find_lex $P1543, "$past"
    $P1544 = $P1542."!make"($P1543)
.annotate "line", 559
    .return ($P1544)
  control_1518:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1545, exception, "payload"
    .return ($P1545)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("84_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1549
.annotate "line", 574
    new $P1548, 'ExceptionHandler'
    set_addr $P1548, control_1547
    $P1548."handle_types"(58)
    push_eh $P1548
    .lex "self", self
    .lex "$/", param_1549
    find_lex $P1550, "$/"
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_479
    new $P1551, "Hash"
  vivify_479:
    set $P1552, $P1551["arglist"]
    unless_null $P1552, vivify_480
    new $P1552, "Undef"
  vivify_480:
    $P1553 = $P1552."ast"()
    $P1554 = $P1550."!make"($P1553)
    .return ($P1554)
  control_1547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1555, exception, "payload"
    .return ($P1555)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("85_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1559
.annotate "line", 576
    .const 'Sub' $P1570 = "86_1259420199.1428" 
    capture_lex $P1570
    new $P1558, 'ExceptionHandler'
    set_addr $P1558, control_1557
    $P1558."handle_types"(58)
    push_eh $P1558
    .lex "self", self
    .lex "$/", param_1559
.annotate "line", 577
    new $P1560, "Undef"
    .lex "$past", $P1560
.annotate "line", 585
    new $P1561, "Undef"
    .lex "$i", $P1561
.annotate "line", 586
    new $P1562, "Undef"
    .lex "$n", $P1562
.annotate "line", 577
    get_hll_global $P1563, ["PAST"], "Op"
    find_lex $P1564, "$/"
    $P1565 = $P1563."new"("call" :named("pasttype"), $P1564 :named("node"))
    store_lex "$past", $P1565
.annotate "line", 578
    find_lex $P1567, "$/"
    unless_null $P1567, vivify_481
    new $P1567, "Hash"
  vivify_481:
    set $P1568, $P1567["EXPR"]
    unless_null $P1568, vivify_482
    new $P1568, "Undef"
  vivify_482:
    unless $P1568, if_1566_end
    .const 'Sub' $P1570 = "86_1259420199.1428" 
    capture_lex $P1570
    $P1570()
  if_1566_end:
.annotate "line", 585
    new $P1602, "Integer"
    assign $P1602, 0
    store_lex "$i", $P1602
.annotate "line", 586
    find_lex $P1603, "$past"
    $P1604 = $P1603."list"()
    set $N1605, $P1604
    new $P1606, 'Float'
    set $P1606, $N1605
    store_lex "$n", $P1606
.annotate "line", 587
    new $P1634, 'ExceptionHandler'
    set_addr $P1634, loop1633_handler
    $P1634."handle_types"(65, 67, 66)
    push_eh $P1634
  loop1633_test:
    find_lex $P1607, "$i"
    set $N1608, $P1607
    find_lex $P1609, "$n"
    set $N1610, $P1609
    islt $I1611, $N1608, $N1610
    unless $I1611, loop1633_done
  loop1633_redo:
.annotate "line", 588
    find_lex $P1613, "$i"
    set $I1614, $P1613
    find_lex $P1615, "$past"
    unless_null $P1615, vivify_486
    new $P1615, "ResizablePMCArray"
  vivify_486:
    set $P1616, $P1615[$I1614]
    unless_null $P1616, vivify_487
    new $P1616, "Undef"
  vivify_487:
    $S1617 = $P1616."name"()
    iseq $I1618, $S1617, "&prefix:<|>"
    unless $I1618, if_1612_end
.annotate "line", 589
    find_lex $P1619, "$i"
    set $I1620, $P1619
    find_lex $P1621, "$past"
    unless_null $P1621, vivify_488
    new $P1621, "ResizablePMCArray"
  vivify_488:
    set $P1622, $P1621[$I1620]
    unless_null $P1622, vivify_489
    new $P1622, "ResizablePMCArray"
  vivify_489:
    set $P1623, $P1622[0]
    unless_null $P1623, vivify_490
    new $P1623, "Undef"
  vivify_490:
    find_lex $P1624, "$i"
    set $I1625, $P1624
    find_lex $P1626, "$past"
    unless_null $P1626, vivify_491
    new $P1626, "ResizablePMCArray"
    store_lex "$past", $P1626
  vivify_491:
    set $P1626[$I1625], $P1623
.annotate "line", 590
    find_lex $P1627, "$i"
    set $I1628, $P1627
    find_lex $P1629, "$past"
    unless_null $P1629, vivify_492
    new $P1629, "ResizablePMCArray"
  vivify_492:
    set $P1630, $P1629[$I1628]
    unless_null $P1630, vivify_493
    new $P1630, "Undef"
  vivify_493:
    $P1630."flat"(1)
  if_1612_end:
.annotate "line", 588
    find_lex $P1631, "$i"
    clone $P1632, $P1631
    inc $P1631
  loop1633_next:
.annotate "line", 587
    goto loop1633_test
  loop1633_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1635, exception, 'type'
    eq $P1635, 65, loop1633_next
    eq $P1635, 67, loop1633_redo
  loop1633_done:
    pop_eh 
.annotate "line", 594
    find_lex $P1636, "$/"
    find_lex $P1637, "$past"
    $P1638 = $P1636."!make"($P1637)
.annotate "line", 576
    .return ($P1638)
  control_1557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1639, exception, "payload"
    .return ($P1639)
.end


.namespace ["NQP";"Actions"]
.sub "_block1569"  :anon :subid("86_1259420199.1428") :outer("85_1259420199.1428")
.annotate "line", 578
    .const 'Sub' $P1591 = "87_1259420199.1428" 
    capture_lex $P1591
.annotate "line", 579
    new $P1571, "Undef"
    .lex "$expr", $P1571
    find_lex $P1572, "$/"
    unless_null $P1572, vivify_483
    new $P1572, "Hash"
  vivify_483:
    set $P1573, $P1572["EXPR"]
    unless_null $P1573, vivify_484
    new $P1573, "Undef"
  vivify_484:
    $P1574 = $P1573."ast"()
    store_lex "$expr", $P1574
.annotate "line", 580
    find_lex $P1579, "$expr"
    $S1580 = $P1579."name"()
    iseq $I1581, $S1580, "&infix:<,>"
    if $I1581, if_1578
    new $P1577, 'Integer'
    set $P1577, $I1581
    goto if_1578_end
  if_1578:
    find_lex $P1582, "$expr"
    $P1583 = $P1582."named"()
    isfalse $I1584, $P1583
    new $P1577, 'Integer'
    set $P1577, $I1584
  if_1578_end:
    if $P1577, if_1576
.annotate "line", 583
    find_lex $P1599, "$past"
    find_lex $P1600, "$expr"
    $P1601 = $P1599."push"($P1600)
    set $P1575, $P1601
.annotate "line", 580
    goto if_1576_end
  if_1576:
.annotate "line", 581
    find_lex $P1586, "$expr"
    $P1587 = $P1586."list"()
    defined $I1588, $P1587
    unless $I1588, for_undef_485
    iter $P1585, $P1587
    new $P1597, 'ExceptionHandler'
    set_addr $P1597, loop1596_handler
    $P1597."handle_types"(65, 67, 66)
    push_eh $P1597
  loop1596_test:
    unless $P1585, loop1596_done
    shift $P1589, $P1585
  loop1596_redo:
    .const 'Sub' $P1591 = "87_1259420199.1428" 
    capture_lex $P1591
    $P1591($P1589)
  loop1596_next:
    goto loop1596_test
  loop1596_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1598, exception, 'type'
    eq $P1598, 65, loop1596_next
    eq $P1598, 67, loop1596_redo
  loop1596_done:
    pop_eh 
  for_undef_485:
.annotate "line", 580
    set $P1575, $P1585
  if_1576_end:
.annotate "line", 578
    .return ($P1575)
.end


.namespace ["NQP";"Actions"]
.sub "_block1590"  :anon :subid("87_1259420199.1428") :outer("86_1259420199.1428")
    .param pmc param_1592
.annotate "line", 581
    .lex "$_", param_1592
    find_lex $P1593, "$past"
    find_lex $P1594, "$_"
    $P1595 = $P1593."push"($P1594)
    .return ($P1595)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("88_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1643
.annotate "line", 598
    new $P1642, 'ExceptionHandler'
    set_addr $P1642, control_1641
    $P1642."handle_types"(58)
    push_eh $P1642
    .lex "self", self
    .lex "$/", param_1643
    find_lex $P1644, "$/"
    find_lex $P1645, "$/"
    unless_null $P1645, vivify_494
    new $P1645, "Hash"
  vivify_494:
    set $P1646, $P1645["value"]
    unless_null $P1646, vivify_495
    new $P1646, "Undef"
  vivify_495:
    $P1647 = $P1646."ast"()
    $P1648 = $P1644."!make"($P1647)
    .return ($P1648)
  control_1641:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1649, exception, "payload"
    .return ($P1649)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("89_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1653
.annotate "line", 600
    new $P1652, 'ExceptionHandler'
    set_addr $P1652, control_1651
    $P1652."handle_types"(58)
    push_eh $P1652
    .lex "self", self
    .lex "$/", param_1653
.annotate "line", 601
    find_lex $P1654, "$/"
.annotate "line", 602
    find_lex $P1657, "$/"
    unless_null $P1657, vivify_496
    new $P1657, "Hash"
  vivify_496:
    set $P1658, $P1657["EXPR"]
    unless_null $P1658, vivify_497
    new $P1658, "Undef"
  vivify_497:
    if $P1658, if_1656
.annotate "line", 603
    get_hll_global $P1663, ["PAST"], "Op"
    find_lex $P1664, "$/"
    $P1665 = $P1663."new"("list" :named("pasttype"), $P1664 :named("node"))
    set $P1655, $P1665
.annotate "line", 602
    goto if_1656_end
  if_1656:
    find_lex $P1659, "$/"
    unless_null $P1659, vivify_498
    new $P1659, "Hash"
  vivify_498:
    set $P1660, $P1659["EXPR"]
    unless_null $P1660, vivify_499
    new $P1660, "ResizablePMCArray"
  vivify_499:
    set $P1661, $P1660[0]
    unless_null $P1661, vivify_500
    new $P1661, "Undef"
  vivify_500:
    $P1662 = $P1661."ast"()
    set $P1655, $P1662
  if_1656_end:
    $P1666 = $P1654."!make"($P1655)
.annotate "line", 600
    .return ($P1666)
  control_1651:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1667, exception, "payload"
    .return ($P1667)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("90_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1671
.annotate "line", 606
    new $P1670, 'ExceptionHandler'
    set_addr $P1670, control_1669
    $P1670."handle_types"(58)
    push_eh $P1670
    .lex "self", self
    .lex "$/", param_1671
.annotate "line", 607
    new $P1672, "Undef"
    .lex "$past", $P1672
.annotate "line", 606
    find_lex $P1673, "$past"
.annotate "line", 608
    find_lex $P1675, "$/"
    unless_null $P1675, vivify_501
    new $P1675, "Hash"
  vivify_501:
    set $P1676, $P1675["EXPR"]
    unless_null $P1676, vivify_502
    new $P1676, "Undef"
  vivify_502:
    if $P1676, if_1674
.annotate "line", 615
    get_hll_global $P1688, ["PAST"], "Op"
    $P1689 = $P1688."new"("list" :named("pasttype"))
    store_lex "$past", $P1689
.annotate "line", 614
    goto if_1674_end
  if_1674:
.annotate "line", 609
    find_lex $P1677, "$/"
    unless_null $P1677, vivify_503
    new $P1677, "Hash"
  vivify_503:
    set $P1678, $P1677["EXPR"]
    unless_null $P1678, vivify_504
    new $P1678, "ResizablePMCArray"
  vivify_504:
    set $P1679, $P1678[0]
    unless_null $P1679, vivify_505
    new $P1679, "Undef"
  vivify_505:
    $P1680 = $P1679."ast"()
    store_lex "$past", $P1680
.annotate "line", 610
    find_lex $P1682, "$past"
    $S1683 = $P1682."name"()
    isne $I1684, $S1683, "&infix:<,>"
    unless $I1684, if_1681_end
.annotate "line", 611
    get_hll_global $P1685, ["PAST"], "Op"
    find_lex $P1686, "$past"
    $P1687 = $P1685."new"($P1686, "list" :named("pasttype"))
    store_lex "$past", $P1687
  if_1681_end:
  if_1674_end:
.annotate "line", 617
    find_lex $P1690, "$past"
    $P1690."name"("&circumfix:<[ ]>")
.annotate "line", 618
    find_lex $P1691, "$/"
    find_lex $P1692, "$past"
    $P1693 = $P1691."!make"($P1692)
.annotate "line", 606
    .return ($P1693)
  control_1669:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1694, exception, "payload"
    .return ($P1694)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("91_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1698
.annotate "line", 621
    new $P1697, 'ExceptionHandler'
    set_addr $P1697, control_1696
    $P1697."handle_types"(58)
    push_eh $P1697
    .lex "self", self
    .lex "$/", param_1698
    find_lex $P1699, "$/"
    find_lex $P1700, "$/"
    unless_null $P1700, vivify_506
    new $P1700, "Hash"
  vivify_506:
    set $P1701, $P1700["quote_EXPR"]
    unless_null $P1701, vivify_507
    new $P1701, "Undef"
  vivify_507:
    $P1702 = $P1701."ast"()
    $P1703 = $P1699."!make"($P1702)
    .return ($P1703)
  control_1696:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1704, exception, "payload"
    .return ($P1704)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("92_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1708
.annotate "line", 623
    new $P1707, 'ExceptionHandler'
    set_addr $P1707, control_1706
    $P1707."handle_types"(58)
    push_eh $P1707
    .lex "self", self
    .lex "$/", param_1708
.annotate "line", 624
    find_lex $P1709, "$/"
    find_lex $P1712, "$/"
    unless_null $P1712, vivify_508
    new $P1712, "Hash"
  vivify_508:
    set $P1713, $P1712["pblock"]
    unless_null $P1713, vivify_509
    new $P1713, "Hash"
  vivify_509:
    set $P1714, $P1713["blockoid"]
    unless_null $P1714, vivify_510
    new $P1714, "Hash"
  vivify_510:
    set $P1715, $P1714["statementlist"]
    unless_null $P1715, vivify_511
    new $P1715, "Hash"
  vivify_511:
    set $P1716, $P1715["statement"]
    unless_null $P1716, vivify_512
    new $P1716, "Undef"
  vivify_512:
    set $N1717, $P1716
    new $P1718, "Integer"
    assign $P1718, 0
    set $N1719, $P1718
    isgt $I1720, $N1717, $N1719
    if $I1720, if_1711
.annotate "line", 626
    get_hll_global $P1724, ["PAST"], "Op"
    find_lex $P1725, "$/"
    $P1726 = $P1724."new"("    %r = new [\"Hash\"]" :named("inline"), $P1725 :named("node"))
    set $P1710, $P1726
.annotate "line", 624
    goto if_1711_end
  if_1711:
.annotate "line", 625
    find_lex $P1721, "$/"
    unless_null $P1721, vivify_513
    new $P1721, "Hash"
  vivify_513:
    set $P1722, $P1721["pblock"]
    unless_null $P1722, vivify_514
    new $P1722, "Undef"
  vivify_514:
    $P1723 = $P1722."ast"()
    set $P1710, $P1723
  if_1711_end:
    $P1727 = $P1709."!make"($P1710)
.annotate "line", 623
    .return ($P1727)
  control_1706:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1728, exception, "payload"
    .return ($P1728)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("93_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1732
.annotate "line", 629
    new $P1731, 'ExceptionHandler'
    set_addr $P1731, control_1730
    $P1731."handle_types"(58)
    push_eh $P1731
    .lex "self", self
    .lex "$/", param_1732
.annotate "line", 630
    new $P1733, "Undef"
    .lex "$name", $P1733
    find_lex $P1736, "$/"
    unless_null $P1736, vivify_515
    new $P1736, "Hash"
  vivify_515:
    set $P1737, $P1736["sigil"]
    unless_null $P1737, vivify_516
    new $P1737, "Undef"
  vivify_516:
    set $S1738, $P1737
    iseq $I1739, $S1738, "@"
    if $I1739, if_1735
.annotate "line", 631
    find_lex $P1743, "$/"
    unless_null $P1743, vivify_517
    new $P1743, "Hash"
  vivify_517:
    set $P1744, $P1743["sigil"]
    unless_null $P1744, vivify_518
    new $P1744, "Undef"
  vivify_518:
    set $S1745, $P1744
    iseq $I1746, $S1745, "%"
    if $I1746, if_1742
    new $P1748, "String"
    assign $P1748, "item"
    set $P1741, $P1748
    goto if_1742_end
  if_1742:
    new $P1747, "String"
    assign $P1747, "hash"
    set $P1741, $P1747
  if_1742_end:
    set $P1734, $P1741
.annotate "line", 630
    goto if_1735_end
  if_1735:
    new $P1740, "String"
    assign $P1740, "list"
    set $P1734, $P1740
  if_1735_end:
    store_lex "$name", $P1734
.annotate "line", 633
    find_lex $P1749, "$/"
    get_hll_global $P1750, ["PAST"], "Op"
    find_lex $P1751, "$name"
    find_lex $P1752, "$/"
    unless_null $P1752, vivify_519
    new $P1752, "Hash"
  vivify_519:
    set $P1753, $P1752["semilist"]
    unless_null $P1753, vivify_520
    new $P1753, "Undef"
  vivify_520:
    $P1754 = $P1753."ast"()
    $P1755 = $P1750."new"($P1754, "callmethod" :named("pasttype"), $P1751 :named("name"))
    $P1756 = $P1749."!make"($P1755)
.annotate "line", 629
    .return ($P1756)
  control_1730:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1757, exception, "payload"
    .return ($P1757)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("94_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1761
.annotate "line", 636
    new $P1760, 'ExceptionHandler'
    set_addr $P1760, control_1759
    $P1760."handle_types"(58)
    push_eh $P1760
    .lex "self", self
    .lex "$/", param_1761
    find_lex $P1762, "$/"
    find_lex $P1763, "$/"
    unless_null $P1763, vivify_521
    new $P1763, "Hash"
  vivify_521:
    set $P1764, $P1763["statement"]
    unless_null $P1764, vivify_522
    new $P1764, "Undef"
  vivify_522:
    $P1765 = $P1764."ast"()
    $P1766 = $P1762."!make"($P1765)
    .return ($P1766)
  control_1759:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1767, exception, "payload"
    .return ($P1767)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("95_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1771
.annotate "line", 638
    new $P1770, 'ExceptionHandler'
    set_addr $P1770, control_1769
    $P1770."handle_types"(58)
    push_eh $P1770
    .lex "self", self
    .lex "$/", param_1771
.annotate "line", 639
    find_lex $P1772, "$/"
    get_hll_global $P1773, ["PAST"], "Var"
    find_lex $P1774, "$/"
    unless_null $P1774, vivify_523
    new $P1774, "Hash"
  vivify_523:
    set $P1775, $P1774["EXPR"]
    unless_null $P1775, vivify_524
    new $P1775, "Undef"
  vivify_524:
    $P1776 = $P1775."ast"()
    $P1777 = $P1773."new"($P1776, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1778 = $P1772."!make"($P1777)
.annotate "line", 638
    .return ($P1778)
  control_1769:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1779, exception, "payload"
    .return ($P1779)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("96_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1783
.annotate "line", 644
    new $P1782, 'ExceptionHandler'
    set_addr $P1782, control_1781
    $P1782."handle_types"(58)
    push_eh $P1782
    .lex "self", self
    .lex "$/", param_1783
.annotate "line", 645
    find_lex $P1784, "$/"
    get_hll_global $P1785, ["PAST"], "Var"
    find_lex $P1786, "$/"
    unless_null $P1786, vivify_525
    new $P1786, "Hash"
  vivify_525:
    set $P1787, $P1786["EXPR"]
    unless_null $P1787, vivify_526
    new $P1787, "Undef"
  vivify_526:
    $P1788 = $P1787."ast"()
    $P1789 = $P1785."new"($P1788, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1790 = $P1784."!make"($P1789)
.annotate "line", 644
    .return ($P1790)
  control_1781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1791, exception, "payload"
    .return ($P1791)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("97_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1795
.annotate "line", 650
    new $P1794, 'ExceptionHandler'
    set_addr $P1794, control_1793
    $P1794."handle_types"(58)
    push_eh $P1794
    .lex "self", self
    .lex "$/", param_1795
.annotate "line", 651
    find_lex $P1796, "$/"
    get_hll_global $P1797, ["PAST"], "Var"
    find_lex $P1798, "$/"
    unless_null $P1798, vivify_527
    new $P1798, "Hash"
  vivify_527:
    set $P1799, $P1798["quote_EXPR"]
    unless_null $P1799, vivify_528
    new $P1799, "Undef"
  vivify_528:
    $P1800 = $P1799."ast"()
    $P1801 = $P1797."new"($P1800, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1802 = $P1796."!make"($P1801)
.annotate "line", 650
    .return ($P1802)
  control_1793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1803, exception, "payload"
    .return ($P1803)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("98_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1807
.annotate "line", 656
    new $P1806, 'ExceptionHandler'
    set_addr $P1806, control_1805
    $P1806."handle_types"(58)
    push_eh $P1806
    .lex "self", self
    .lex "$/", param_1807
.annotate "line", 657
    find_lex $P1808, "$/"
    find_lex $P1809, "$/"
    unless_null $P1809, vivify_529
    new $P1809, "Hash"
  vivify_529:
    set $P1810, $P1809["arglist"]
    unless_null $P1810, vivify_530
    new $P1810, "Undef"
  vivify_530:
    $P1811 = $P1810."ast"()
    $P1812 = $P1808."!make"($P1811)
.annotate "line", 656
    .return ($P1812)
  control_1805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1813, exception, "payload"
    .return ($P1813)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("99_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1817
.annotate "line", 660
    new $P1816, 'ExceptionHandler'
    set_addr $P1816, control_1815
    $P1816."handle_types"(58)
    push_eh $P1816
    .lex "self", self
    .lex "$/", param_1817
.annotate "line", 661
    find_lex $P1818, "$/"
    find_lex $P1821, "$/"
    unless_null $P1821, vivify_531
    new $P1821, "Hash"
  vivify_531:
    set $P1822, $P1821["quote"]
    unless_null $P1822, vivify_532
    new $P1822, "Undef"
  vivify_532:
    if $P1822, if_1820
    find_lex $P1826, "$/"
    unless_null $P1826, vivify_533
    new $P1826, "Hash"
  vivify_533:
    set $P1827, $P1826["number"]
    unless_null $P1827, vivify_534
    new $P1827, "Undef"
  vivify_534:
    $P1828 = $P1827."ast"()
    set $P1819, $P1828
    goto if_1820_end
  if_1820:
    find_lex $P1823, "$/"
    unless_null $P1823, vivify_535
    new $P1823, "Hash"
  vivify_535:
    set $P1824, $P1823["quote"]
    unless_null $P1824, vivify_536
    new $P1824, "Undef"
  vivify_536:
    $P1825 = $P1824."ast"()
    set $P1819, $P1825
  if_1820_end:
    $P1829 = $P1818."!make"($P1819)
.annotate "line", 660
    .return ($P1829)
  control_1815:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1830, exception, "payload"
    .return ($P1830)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("100_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1834
.annotate "line", 664
    new $P1833, 'ExceptionHandler'
    set_addr $P1833, control_1832
    $P1833."handle_types"(58)
    push_eh $P1833
    .lex "self", self
    .lex "$/", param_1834
.annotate "line", 665
    new $P1835, "Undef"
    .lex "$value", $P1835
    find_lex $P1838, "$/"
    unless_null $P1838, vivify_537
    new $P1838, "Hash"
  vivify_537:
    set $P1839, $P1838["dec_number"]
    unless_null $P1839, vivify_538
    new $P1839, "Undef"
  vivify_538:
    if $P1839, if_1837
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_539
    new $P1843, "Hash"
  vivify_539:
    set $P1844, $P1843["integer"]
    unless_null $P1844, vivify_540
    new $P1844, "Undef"
  vivify_540:
    $P1845 = $P1844."ast"()
    set $P1836, $P1845
    goto if_1837_end
  if_1837:
    find_lex $P1840, "$/"
    unless_null $P1840, vivify_541
    new $P1840, "Hash"
  vivify_541:
    set $P1841, $P1840["dec_number"]
    unless_null $P1841, vivify_542
    new $P1841, "Undef"
  vivify_542:
    $P1842 = $P1841."ast"()
    set $P1836, $P1842
  if_1837_end:
    store_lex "$value", $P1836
.annotate "line", 666
    find_lex $P1847, "$/"
    unless_null $P1847, vivify_543
    new $P1847, "Hash"
  vivify_543:
    set $P1848, $P1847["sign"]
    unless_null $P1848, vivify_544
    new $P1848, "Undef"
  vivify_544:
    set $S1849, $P1848
    iseq $I1850, $S1849, "-"
    unless $I1850, if_1846_end
    find_lex $P1851, "$value"
    neg $P1852, $P1851
    store_lex "$value", $P1852
  if_1846_end:
.annotate "line", 667
    find_lex $P1853, "$/"
    get_hll_global $P1854, ["PAST"], "Val"
    find_lex $P1855, "$value"
    $P1856 = $P1854."new"($P1855 :named("value"))
    $P1857 = $P1853."!make"($P1856)
.annotate "line", 664
    .return ($P1857)
  control_1832:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1858, exception, "payload"
    .return ($P1858)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("101_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1862
.annotate "line", 670
    new $P1861, 'ExceptionHandler'
    set_addr $P1861, control_1860
    $P1861."handle_types"(58)
    push_eh $P1861
    .lex "self", self
    .lex "$/", param_1862
    find_lex $P1863, "$/"
    find_lex $P1864, "$/"
    unless_null $P1864, vivify_545
    new $P1864, "Hash"
  vivify_545:
    set $P1865, $P1864["quote_EXPR"]
    unless_null $P1865, vivify_546
    new $P1865, "Undef"
  vivify_546:
    $P1866 = $P1865."ast"()
    $P1867 = $P1863."!make"($P1866)
    .return ($P1867)
  control_1860:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1868, exception, "payload"
    .return ($P1868)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("102_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1872
.annotate "line", 671
    new $P1871, 'ExceptionHandler'
    set_addr $P1871, control_1870
    $P1871."handle_types"(58)
    push_eh $P1871
    .lex "self", self
    .lex "$/", param_1872
    find_lex $P1873, "$/"
    find_lex $P1874, "$/"
    unless_null $P1874, vivify_547
    new $P1874, "Hash"
  vivify_547:
    set $P1875, $P1874["quote_EXPR"]
    unless_null $P1875, vivify_548
    new $P1875, "Undef"
  vivify_548:
    $P1876 = $P1875."ast"()
    $P1877 = $P1873."!make"($P1876)
    .return ($P1877)
  control_1870:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1878, exception, "payload"
    .return ($P1878)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("103_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1882
.annotate "line", 672
    new $P1881, 'ExceptionHandler'
    set_addr $P1881, control_1880
    $P1881."handle_types"(58)
    push_eh $P1881
    .lex "self", self
    .lex "$/", param_1882
    find_lex $P1883, "$/"
    find_lex $P1884, "$/"
    unless_null $P1884, vivify_549
    new $P1884, "Hash"
  vivify_549:
    set $P1885, $P1884["quote_EXPR"]
    unless_null $P1885, vivify_550
    new $P1885, "Undef"
  vivify_550:
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
.sub "quote:sym<q>"  :subid("104_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1892
.annotate "line", 673
    new $P1891, 'ExceptionHandler'
    set_addr $P1891, control_1890
    $P1891."handle_types"(58)
    push_eh $P1891
    .lex "self", self
    .lex "$/", param_1892
    find_lex $P1893, "$/"
    find_lex $P1894, "$/"
    unless_null $P1894, vivify_551
    new $P1894, "Hash"
  vivify_551:
    set $P1895, $P1894["quote_EXPR"]
    unless_null $P1895, vivify_552
    new $P1895, "Undef"
  vivify_552:
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
.sub "quote:sym<Q>"  :subid("105_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1902
.annotate "line", 674
    new $P1901, 'ExceptionHandler'
    set_addr $P1901, control_1900
    $P1901."handle_types"(58)
    push_eh $P1901
    .lex "self", self
    .lex "$/", param_1902
    find_lex $P1903, "$/"
    find_lex $P1904, "$/"
    unless_null $P1904, vivify_553
    new $P1904, "Hash"
  vivify_553:
    set $P1905, $P1904["quote_EXPR"]
    unless_null $P1905, vivify_554
    new $P1905, "Undef"
  vivify_554:
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
.sub "quote:sym<Q:PIR>"  :subid("106_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1912
.annotate "line", 675
    new $P1911, 'ExceptionHandler'
    set_addr $P1911, control_1910
    $P1911."handle_types"(58)
    push_eh $P1911
    .lex "self", self
    .lex "$/", param_1912
.annotate "line", 676
    find_lex $P1913, "$/"
    get_hll_global $P1914, ["PAST"], "Op"
    find_lex $P1915, "$/"
    unless_null $P1915, vivify_555
    new $P1915, "Hash"
  vivify_555:
    set $P1916, $P1915["quote_EXPR"]
    unless_null $P1916, vivify_556
    new $P1916, "Undef"
  vivify_556:
    $P1917 = $P1916."ast"()
    $P1918 = $P1917."value"()
    find_lex $P1919, "$/"
    $P1920 = $P1914."new"($P1918 :named("inline"), "inline" :named("pasttype"), $P1919 :named("node"))
    $P1921 = $P1913."!make"($P1920)
.annotate "line", 675
    .return ($P1921)
  control_1910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1922, exception, "payload"
    .return ($P1922)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("107_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1926
.annotate "line", 681
    new $P1925, 'ExceptionHandler'
    set_addr $P1925, control_1924
    $P1925."handle_types"(58)
    push_eh $P1925
    .lex "self", self
    .lex "$/", param_1926
    find_lex $P1927, "$/"
    find_lex $P1928, "$/"
    unless_null $P1928, vivify_557
    new $P1928, "Hash"
  vivify_557:
    set $P1929, $P1928["variable"]
    unless_null $P1929, vivify_558
    new $P1929, "Undef"
  vivify_558:
    $P1930 = $P1929."ast"()
    $P1931 = $P1927."!make"($P1930)
    .return ($P1931)
  control_1924:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1932, exception, "payload"
    .return ($P1932)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("108_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1936
.annotate "line", 682
    new $P1935, 'ExceptionHandler'
    set_addr $P1935, control_1934
    $P1935."handle_types"(58)
    push_eh $P1935
    .lex "self", self
    .lex "$/", param_1936
.annotate "line", 683
    find_lex $P1937, "$/"
    get_hll_global $P1938, ["PAST"], "Op"
.annotate "line", 684
    find_lex $P1939, "$/"
    unless_null $P1939, vivify_559
    new $P1939, "Hash"
  vivify_559:
    set $P1940, $P1939["block"]
    unless_null $P1940, vivify_560
    new $P1940, "Undef"
  vivify_560:
    $P1941 = $P1940."ast"()
    $P1942 = "block_immediate"($P1941)
    find_lex $P1943, "$/"
    $P1944 = $P1938."new"($P1942, "set S*" :named("pirop"), $P1943 :named("node"))
.annotate "line", 683
    $P1945 = $P1937."!make"($P1944)
.annotate "line", 682
    .return ($P1945)
  control_1934:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1946, exception, "payload"
    .return ($P1946)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("109_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1950
.annotate "line", 690
    new $P1949, 'ExceptionHandler'
    set_addr $P1949, control_1948
    $P1949."handle_types"(58)
    push_eh $P1949
    .lex "self", self
    .lex "$/", param_1950
    find_lex $P1951, "$/"
    find_lex $P1952, "$/"
    unless_null $P1952, vivify_561
    new $P1952, "Hash"
  vivify_561:
    set $P1953, $P1952["dotty"]
    unless_null $P1953, vivify_562
    new $P1953, "Undef"
  vivify_562:
    $P1954 = $P1953."ast"()
    $P1955 = $P1951."!make"($P1954)
    .return ($P1955)
  control_1948:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1956, exception, "payload"
    .return ($P1956)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("110_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1960
.annotate "line", 692
    new $P1959, 'ExceptionHandler'
    set_addr $P1959, control_1958
    $P1959."handle_types"(58)
    push_eh $P1959
    .lex "self", self
    .lex "$/", param_1960
.annotate "line", 693
    find_lex $P1961, "$/"
    get_hll_global $P1962, ["PAST"], "Op"
.annotate "line", 694
    new $P1963, "ResizablePMCArray"
    push $P1963, "    clone %r, %0"
    push $P1963, "    inc %0"
    $P1964 = $P1962."new"("postfix:<++>" :named("name"), $P1963 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 693
    $P1965 = $P1961."!make"($P1964)
.annotate "line", 692
    .return ($P1965)
  control_1958:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1966, exception, "payload"
    .return ($P1966)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("111_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1970
.annotate "line", 698
    new $P1969, 'ExceptionHandler'
    set_addr $P1969, control_1968
    $P1969."handle_types"(58)
    push_eh $P1969
    .lex "self", self
    .lex "$/", param_1970
.annotate "line", 699
    find_lex $P1971, "$/"
    get_hll_global $P1972, ["PAST"], "Op"
.annotate "line", 700
    new $P1973, "ResizablePMCArray"
    push $P1973, "    clone %r, %0"
    push $P1973, "    dec %0"
    $P1974 = $P1972."new"("postfix:<-->" :named("name"), $P1973 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 699
    $P1975 = $P1971."!make"($P1974)
.annotate "line", 698
    .return ($P1975)
  control_1968:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1976, exception, "payload"
    .return ($P1976)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("112_1259420199.1428") :method :outer("11_1259420199.1428")
    .param pmc param_1980
.annotate "line", 704
    new $P1979, 'ExceptionHandler'
    set_addr $P1979, control_1978
    $P1979."handle_types"(58)
    push_eh $P1979
    .lex "self", self
    .lex "$/", param_1980
.annotate "line", 705
    find_lex $P1981, "$/"
    get_hll_global $P1982, ["PAST"], "Op"
.annotate "line", 706
    get_hll_global $P1983, ["PAST"], "Var"
    $P1984 = $P1983."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1985, "$/"
    $P1986 = $P1982."new"($P1984, "callmethod" :named("pasttype"), "!make" :named("name"), $P1985 :named("node"))
.annotate "line", 705
    $P1987 = $P1981."!make"($P1986)
.annotate "line", 704
    .return ($P1987)
  control_1978:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1988, exception, "payload"
    .return ($P1988)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1989"  :subid("113_1259420199.1428") :outer("11_1259420199.1428")
.annotate "line", 714
    .const 'Sub' $P2025 = "117_1259420199.1428" 
    capture_lex $P2025
    .const 'Sub' $P2015 = "116_1259420199.1428" 
    capture_lex $P2015
    .const 'Sub' $P2005 = "115_1259420199.1428" 
    capture_lex $P2005
    .const 'Sub' $P1991 = "114_1259420199.1428" 
    capture_lex $P1991
.annotate "line", 725
    .const 'Sub' $P2025 = "117_1259420199.1428" 
    capture_lex $P2025
.annotate "line", 714
    .return ($P2025)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("114_1259420199.1428") :method :outer("113_1259420199.1428")
    .param pmc param_1994
.annotate "line", 716
    new $P1993, 'ExceptionHandler'
    set_addr $P1993, control_1992
    $P1993."handle_types"(58)
    push_eh $P1993
    .lex "self", self
    .lex "$/", param_1994
.annotate "line", 717
    new $P1995, "Undef"
    .lex "$past", $P1995
    find_lex $P1996, "$/"
    unless_null $P1996, vivify_563
    new $P1996, "Hash"
  vivify_563:
    set $P1997, $P1996["statement"]
    unless_null $P1997, vivify_564
    new $P1997, "Undef"
  vivify_564:
    $P1998 = $P1997."ast"()
    store_lex "$past", $P1998
.annotate "line", 718
    find_lex $P1999, "$/"
    get_hll_global $P2000, ["PAST"], "Regex"
    find_lex $P2001, "$past"
    $P2002 = $P2000."new"($P2001, "pastnode" :named("pasttype"))
    $P2003 = $P1999."!make"($P2002)
.annotate "line", 716
    .return ($P2003)
  control_1992:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2004, exception, "payload"
    .return ($P2004)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("115_1259420199.1428") :method :outer("113_1259420199.1428")
    .param pmc param_2008
.annotate "line", 721
    new $P2007, 'ExceptionHandler'
    set_addr $P2007, control_2006
    $P2007."handle_types"(58)
    push_eh $P2007
    .lex "self", self
    .lex "$/", param_2008
    find_lex $P2009, "$/"
    find_lex $P2010, "$/"
    unless_null $P2010, vivify_565
    new $P2010, "Hash"
  vivify_565:
    set $P2011, $P2010["codeblock"]
    unless_null $P2011, vivify_566
    new $P2011, "Undef"
  vivify_566:
    $P2012 = $P2011."ast"()
    $P2013 = $P2009."!make"($P2012)
    .return ($P2013)
  control_2006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2014, exception, "payload"
    .return ($P2014)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("116_1259420199.1428") :method :outer("113_1259420199.1428")
    .param pmc param_2018
.annotate "line", 723
    new $P2017, 'ExceptionHandler'
    set_addr $P2017, control_2016
    $P2017."handle_types"(58)
    push_eh $P2017
    .lex "self", self
    .lex "$/", param_2018
    find_lex $P2019, "$/"
    find_lex $P2020, "$/"
    unless_null $P2020, vivify_567
    new $P2020, "Hash"
  vivify_567:
    set $P2021, $P2020["codeblock"]
    unless_null $P2021, vivify_568
    new $P2021, "Undef"
  vivify_568:
    $P2022 = $P2021."ast"()
    $P2023 = $P2019."!make"($P2022)
    .return ($P2023)
  control_2016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2024, exception, "payload"
    .return ($P2024)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("117_1259420199.1428") :method :outer("113_1259420199.1428")
    .param pmc param_2028
.annotate "line", 725
    new $P2027, 'ExceptionHandler'
    set_addr $P2027, control_2026
    $P2027."handle_types"(58)
    push_eh $P2027
    .lex "self", self
    .lex "$/", param_2028
.annotate "line", 726
    new $P2029, "Undef"
    .lex "$block", $P2029
.annotate "line", 728
    new $P2030, "Undef"
    .lex "$past", $P2030
.annotate "line", 726
    find_lex $P2031, "$/"
    unless_null $P2031, vivify_569
    new $P2031, "Hash"
  vivify_569:
    set $P2032, $P2031["block"]
    unless_null $P2032, vivify_570
    new $P2032, "Undef"
  vivify_570:
    $P2033 = $P2032."ast"()
    store_lex "$block", $P2033
.annotate "line", 727
    find_lex $P2034, "$block"
    $P2034."blocktype"("immediate")
.annotate "line", 729
    get_hll_global $P2035, ["PAST"], "Regex"
.annotate "line", 730
    get_hll_global $P2036, ["PAST"], "Stmts"
.annotate "line", 731
    get_hll_global $P2037, ["PAST"], "Op"
.annotate "line", 732
    get_hll_global $P2038, ["PAST"], "Var"
    $P2039 = $P2038."new"("$/" :named("name"))
.annotate "line", 733
    get_hll_global $P2040, ["PAST"], "Op"
.annotate "line", 734
    get_hll_global $P2041, ["PAST"], "Var"
    $P2042 = $P2041."new"(unicode:"$\x{a2}" :named("name"))
    $P2043 = $P2040."new"($P2042, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 733
    $P2044 = $P2037."new"($P2039, $P2043, "bind" :named("pasttype"))
.annotate "line", 731
    find_lex $P2045, "$block"
    $P2046 = $P2036."new"($P2044, $P2045)
.annotate "line", 730
    $P2047 = $P2035."new"($P2046, "pastnode" :named("pasttype"))
.annotate "line", 729
    store_lex "$past", $P2047
.annotate "line", 744
    find_lex $P2048, "$/"
    find_lex $P2049, "$past"
    $P2050 = $P2048."!make"($P2049)
.annotate "line", 725
    .return ($P2050)
  control_2026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2051, exception, "payload"
    .return ($P2051)
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
