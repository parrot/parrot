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
.sub "_block11"  :anon :subid("10_1259177761.22934")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1253 = $P14()
.annotate "line", 1
    .return ($P1253)
.end


.namespace []
.sub "" :load :init :subid("post320") :outer("10_1259177761.22934")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259177761.22934" 
    .local pmc block
    set block, $P12
    $P1254 = get_root_global ["parrot"], "P6metaclass"
    $P1254."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1259177761.22934") :outer("10_1259177761.22934")
.annotate "line", 4
    get_hll_global $P1195, ["NQP";"Regex"], "_block1194" 
    capture_lex $P1195
    .const 'Sub' $P1188 = "305_1259177761.22934" 
    capture_lex $P1188
    .const 'Sub' $P1182 = "303_1259177761.22934" 
    capture_lex $P1182
    .const 'Sub' $P1175 = "301_1259177761.22934" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "299_1259177761.22934" 
    capture_lex $P1168
    .const 'Sub' $P1161 = "297_1259177761.22934" 
    capture_lex $P1161
    .const 'Sub' $P1154 = "295_1259177761.22934" 
    capture_lex $P1154
    .const 'Sub' $P1148 = "293_1259177761.22934" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "291_1259177761.22934" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "289_1259177761.22934" 
    capture_lex $P1134
    .const 'Sub' $P1127 = "287_1259177761.22934" 
    capture_lex $P1127
    .const 'Sub' $P1120 = "285_1259177761.22934" 
    capture_lex $P1120
    .const 'Sub' $P1113 = "283_1259177761.22934" 
    capture_lex $P1113
    .const 'Sub' $P1106 = "281_1259177761.22934" 
    capture_lex $P1106
    .const 'Sub' $P1099 = "279_1259177761.22934" 
    capture_lex $P1099
    .const 'Sub' $P1092 = "277_1259177761.22934" 
    capture_lex $P1092
    .const 'Sub' $P1085 = "275_1259177761.22934" 
    capture_lex $P1085
    .const 'Sub' $P1078 = "273_1259177761.22934" 
    capture_lex $P1078
    .const 'Sub' $P1071 = "271_1259177761.22934" 
    capture_lex $P1071
    .const 'Sub' $P1064 = "269_1259177761.22934" 
    capture_lex $P1064
    .const 'Sub' $P1057 = "267_1259177761.22934" 
    capture_lex $P1057
    .const 'Sub' $P1050 = "265_1259177761.22934" 
    capture_lex $P1050
    .const 'Sub' $P1043 = "263_1259177761.22934" 
    capture_lex $P1043
    .const 'Sub' $P1036 = "261_1259177761.22934" 
    capture_lex $P1036
    .const 'Sub' $P1029 = "259_1259177761.22934" 
    capture_lex $P1029
    .const 'Sub' $P1022 = "257_1259177761.22934" 
    capture_lex $P1022
    .const 'Sub' $P1015 = "255_1259177761.22934" 
    capture_lex $P1015
    .const 'Sub' $P1008 = "253_1259177761.22934" 
    capture_lex $P1008
    .const 'Sub' $P1001 = "251_1259177761.22934" 
    capture_lex $P1001
    .const 'Sub' $P994 = "249_1259177761.22934" 
    capture_lex $P994
    .const 'Sub' $P987 = "247_1259177761.22934" 
    capture_lex $P987
    .const 'Sub' $P980 = "245_1259177761.22934" 
    capture_lex $P980
    .const 'Sub' $P973 = "243_1259177761.22934" 
    capture_lex $P973
    .const 'Sub' $P967 = "241_1259177761.22934" 
    capture_lex $P967
    .const 'Sub' $P960 = "239_1259177761.22934" 
    capture_lex $P960
    .const 'Sub' $P953 = "237_1259177761.22934" 
    capture_lex $P953
    .const 'Sub' $P946 = "235_1259177761.22934" 
    capture_lex $P946
    .const 'Sub' $P939 = "233_1259177761.22934" 
    capture_lex $P939
    .const 'Sub' $P932 = "231_1259177761.22934" 
    capture_lex $P932
    .const 'Sub' $P925 = "229_1259177761.22934" 
    capture_lex $P925
    .const 'Sub' $P918 = "227_1259177761.22934" 
    capture_lex $P918
    .const 'Sub' $P912 = "225_1259177761.22934" 
    capture_lex $P912
    .const 'Sub' $P906 = "223_1259177761.22934" 
    capture_lex $P906
    .const 'Sub' $P901 = "221_1259177761.22934" 
    capture_lex $P901
    .const 'Sub' $P895 = "219_1259177761.22934" 
    capture_lex $P895
    .const 'Sub' $P889 = "217_1259177761.22934" 
    capture_lex $P889
    .const 'Sub' $P884 = "215_1259177761.22934" 
    capture_lex $P884
    .const 'Sub' $P879 = "213_1259177761.22934" 
    capture_lex $P879
    .const 'Sub' $P872 = "211_1259177761.22934" 
    capture_lex $P872
    .const 'Sub' $P864 = "209_1259177761.22934" 
    capture_lex $P864
    .const 'Sub' $P859 = "207_1259177761.22934" 
    capture_lex $P859
    .const 'Sub' $P854 = "205_1259177761.22934" 
    capture_lex $P854
    .const 'Sub' $P846 = "203_1259177761.22934" 
    capture_lex $P846
    .const 'Sub' $P838 = "201_1259177761.22934" 
    capture_lex $P838
    .const 'Sub' $P833 = "199_1259177761.22934" 
    capture_lex $P833
    .const 'Sub' $P828 = "197_1259177761.22934" 
    capture_lex $P828
    .const 'Sub' $P822 = "195_1259177761.22934" 
    capture_lex $P822
    .const 'Sub' $P816 = "193_1259177761.22934" 
    capture_lex $P816
    .const 'Sub' $P810 = "191_1259177761.22934" 
    capture_lex $P810
    .const 'Sub' $P804 = "189_1259177761.22934" 
    capture_lex $P804
    .const 'Sub' $P799 = "187_1259177761.22934" 
    capture_lex $P799
    .const 'Sub' $P794 = "185_1259177761.22934" 
    capture_lex $P794
    .const 'Sub' $P781 = "181_1259177761.22934" 
    capture_lex $P781
    .const 'Sub' $P773 = "179_1259177761.22934" 
    capture_lex $P773
    .const 'Sub' $P767 = "177_1259177761.22934" 
    capture_lex $P767
    .const 'Sub' $P760 = "175_1259177761.22934" 
    capture_lex $P760
    .const 'Sub' $P754 = "173_1259177761.22934" 
    capture_lex $P754
    .const 'Sub' $P746 = "171_1259177761.22934" 
    capture_lex $P746
    .const 'Sub' $P738 = "169_1259177761.22934" 
    capture_lex $P738
    .const 'Sub' $P732 = "167_1259177761.22934" 
    capture_lex $P732
    .const 'Sub' $P726 = "165_1259177761.22934" 
    capture_lex $P726
    .const 'Sub' $P711 = "161_1259177761.22934" 
    capture_lex $P711
    .const 'Sub' $P679 = "159_1259177761.22934" 
    capture_lex $P679
    .const 'Sub' $P671 = "157_1259177761.22934" 
    capture_lex $P671
    .const 'Sub' $P665 = "155_1259177761.22934" 
    capture_lex $P665
    .const 'Sub' $P655 = "153_1259177761.22934" 
    capture_lex $P655
    .const 'Sub' $P640 = "151_1259177761.22934" 
    capture_lex $P640
    .const 'Sub' $P631 = "149_1259177761.22934" 
    capture_lex $P631
    .const 'Sub' $P612 = "147_1259177761.22934" 
    capture_lex $P612
    .const 'Sub' $P593 = "145_1259177761.22934" 
    capture_lex $P593
    .const 'Sub' $P586 = "143_1259177761.22934" 
    capture_lex $P586
    .const 'Sub' $P579 = "141_1259177761.22934" 
    capture_lex $P579
    .const 'Sub' $P569 = "137_1259177761.22934" 
    capture_lex $P569
    .const 'Sub' $P558 = "135_1259177761.22934" 
    capture_lex $P558
    .const 'Sub' $P551 = "133_1259177761.22934" 
    capture_lex $P551
    .const 'Sub' $P544 = "131_1259177761.22934" 
    capture_lex $P544
    .const 'Sub' $P537 = "129_1259177761.22934" 
    capture_lex $P537
    .const 'Sub' $P510 = "125_1259177761.22934" 
    capture_lex $P510
    .const 'Sub' $P501 = "123_1259177761.22934" 
    capture_lex $P501
    .const 'Sub' $P494 = "121_1259177761.22934" 
    capture_lex $P494
    .const 'Sub' $P485 = "117_1259177761.22934" 
    capture_lex $P485
    .const 'Sub' $P480 = "115_1259177761.22934" 
    capture_lex $P480
    .const 'Sub' $P468 = "113_1259177761.22934" 
    capture_lex $P468
    .const 'Sub' $P457 = "111_1259177761.22934" 
    capture_lex $P457
    .const 'Sub' $P452 = "109_1259177761.22934" 
    capture_lex $P452
    .const 'Sub' $P446 = "107_1259177761.22934" 
    capture_lex $P446
    .const 'Sub' $P440 = "105_1259177761.22934" 
    capture_lex $P440
    .const 'Sub' $P434 = "103_1259177761.22934" 
    capture_lex $P434
    .const 'Sub' $P428 = "101_1259177761.22934" 
    capture_lex $P428
    .const 'Sub' $P422 = "99_1259177761.22934" 
    capture_lex $P422
    .const 'Sub' $P416 = "97_1259177761.22934" 
    capture_lex $P416
    .const 'Sub' $P410 = "95_1259177761.22934" 
    capture_lex $P410
    .const 'Sub' $P402 = "93_1259177761.22934" 
    capture_lex $P402
    .const 'Sub' $P394 = "91_1259177761.22934" 
    capture_lex $P394
    .const 'Sub' $P382 = "87_1259177761.22934" 
    capture_lex $P382
    .const 'Sub' $P374 = "85_1259177761.22934" 
    capture_lex $P374
    .const 'Sub' $P364 = "81_1259177761.22934" 
    capture_lex $P364
    .const 'Sub' $P357 = "79_1259177761.22934" 
    capture_lex $P357
    .const 'Sub' $P350 = "77_1259177761.22934" 
    capture_lex $P350
    .const 'Sub' $P338 = "73_1259177761.22934" 
    capture_lex $P338
    .const 'Sub' $P330 = "71_1259177761.22934" 
    capture_lex $P330
    .const 'Sub' $P322 = "69_1259177761.22934" 
    capture_lex $P322
    .const 'Sub' $P302 = "67_1259177761.22934" 
    capture_lex $P302
    .const 'Sub' $P293 = "65_1259177761.22934" 
    capture_lex $P293
    .const 'Sub' $P274 = "62_1259177761.22934" 
    capture_lex $P274
    .const 'Sub' $P254 = "60_1259177761.22934" 
    capture_lex $P254
    .const 'Sub' $P245 = "56_1259177761.22934" 
    capture_lex $P245
    .const 'Sub' $P240 = "54_1259177761.22934" 
    capture_lex $P240
    .const 'Sub' $P231 = "50_1259177761.22934" 
    capture_lex $P231
    .const 'Sub' $P226 = "48_1259177761.22934" 
    capture_lex $P226
    .const 'Sub' $P218 = "46_1259177761.22934" 
    capture_lex $P218
    .const 'Sub' $P211 = "44_1259177761.22934" 
    capture_lex $P211
    .const 'Sub' $P205 = "42_1259177761.22934" 
    capture_lex $P205
    .const 'Sub' $P197 = "40_1259177761.22934" 
    capture_lex $P197
    .const 'Sub' $P191 = "38_1259177761.22934" 
    capture_lex $P191
    .const 'Sub' $P185 = "36_1259177761.22934" 
    capture_lex $P185
    .const 'Sub' $P168 = "33_1259177761.22934" 
    capture_lex $P168
    .const 'Sub' $P155 = "31_1259177761.22934" 
    capture_lex $P155
    .const 'Sub' $P148 = "29_1259177761.22934" 
    capture_lex $P148
    .const 'Sub' $P104 = "26_1259177761.22934" 
    capture_lex $P104
    .const 'Sub' $P85 = "23_1259177761.22934" 
    capture_lex $P85
    .const 'Sub' $P75 = "21_1259177761.22934" 
    capture_lex $P75
    .const 'Sub' $P61 = "19_1259177761.22934" 
    capture_lex $P61
    .const 'Sub' $P46 = "17_1259177761.22934" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1259177761.22934" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1259177761.22934" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1259177761.22934" 
    capture_lex $P15
.annotate "line", 508
    get_hll_global $P1195, ["NQP";"Regex"], "_block1194" 
    capture_lex $P1195
    $P1236 = $P1195()
.annotate "line", 4
    .return ($P1236)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post321") :outer("11_1259177761.22934")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 401
    get_hll_global $P1237, ["NQP"], "Grammar"
    $P1237."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 402
    get_hll_global $P1238, ["NQP"], "Grammar"
    $P1238."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 403
    get_hll_global $P1239, ["NQP"], "Grammar"
    $P1239."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 404
    get_hll_global $P1240, ["NQP"], "Grammar"
    $P1240."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 405
    get_hll_global $P1241, ["NQP"], "Grammar"
    $P1241."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 406
    get_hll_global $P1242, ["NQP"], "Grammar"
    $P1242."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 407
    get_hll_global $P1243, ["NQP"], "Grammar"
    $P1243."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 408
    get_hll_global $P1244, ["NQP"], "Grammar"
    $P1244."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 409
    get_hll_global $P1245, ["NQP"], "Grammar"
    $P1245."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 410
    get_hll_global $P1246, ["NQP"], "Grammar"
    $P1246."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 411
    get_hll_global $P1247, ["NQP"], "Grammar"
    $P1247."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 412
    get_hll_global $P1248, ["NQP"], "Grammar"
    $P1248."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 413
    get_hll_global $P1249, ["NQP"], "Grammar"
    $P1249."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 414
    get_hll_global $P1250, ["NQP"], "Grammar"
    $P1250."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 415
    get_hll_global $P1251, ["NQP"], "Grammar"
    $P1251."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 400
    $P1252 = get_root_global ["parrot"], "P6metaclass"
    $P1252."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "identifier"  :subid("13_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "!PREFIX__identifier"  :subid("14_1259177761.22934") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "!PREFIX__name"  :subid("16_1259177761.22934") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "!PREFIX__deflongname"  :subid("18_1259177761.22934") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1259177761.22934") :method
.annotate "line", 4
    new $P64, "ResizablePMCArray"
    push $P64, ""
    .return ($P64)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1259177761.22934") :method :outer("11_1259177761.22934")
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
.sub "!PREFIX__ws"  :subid("22_1259177761.22934") :method
.annotate "line", 4
    new $P78, "ResizablePMCArray"
    push $P78, ""
    push $P78, ""
    .return ($P78)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .const 'Sub' $P93 = "25_1259177761.22934" 
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
    .const 'Sub' $P93 = "25_1259177761.22934" 
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
  # rx rxquantr100 ** 0..*
    set_addr $I101, rxquantr100_done
    rx86_cur."!mark_push"(0, rx86_pos, $I101)
  rxquantr100_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I101)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
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
  # rx rxquantr102 ** 1..*
    set_addr $I103, rxquantr102_done
    rx86_cur."!mark_push"(0, -1, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I103)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
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
.sub "!PREFIX__unv"  :subid("24_1259177761.22934") :method
.annotate "line", 4
    new $P88, "ResizablePMCArray"
    push $P88, ""
    push $P88, ""
    push $P88, ""
    .return ($P88)
.end


.namespace ["NQP";"Grammar"]
.sub "_block92"  :anon :subid("25_1259177761.22934") :method :outer("23_1259177761.22934")
.annotate "line", 45
    .lex unicode:"$\x{a2}", $P94
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
.sub "pod_comment"  :subid("26_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .const 'Sub' $P139 = "28_1259177761.22934" 
    capture_lex $P139
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
.annotate "line", 52
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
.annotate "line", 53
    set_addr $I10, alt112_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 54
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
.annotate "line", 55
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
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr118 ** 1..*
    set_addr $I119, rxquantr118_done
    rx105_cur."!mark_push"(0, -1, $I119)
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
.annotate "line", 54
    goto alt112_end
  alt112_1:
    set_addr $I10, alt112_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 56
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
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
  # rx subrule "identifier" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."identifier"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx105_pos = $P10."pos"()
  alt122_0:
.annotate "line", 57
    set_addr $I10, alt122_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 58
  # rx rxquantf123 ** 0..*
    set_addr $I10, rxquantf123_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf123_done
  rxquantf123_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf123_loop
    rx105_cur."!mark_push"($I124, rx105_pos, $I10)
  rxquantf123_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr125 ** 1..*
    set_addr $I126, rxquantr125_done
    rx105_cur."!mark_push"(0, -1, $I126)
  rxquantr125_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I126)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I126)
    goto rxquantr125_loop
  rxquantr125_done:
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
    goto alt122_end
  alt122_1:
.annotate "line", 59
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt122_end:
.annotate "line", 56
    goto alt112_end
  alt112_2:
    set_addr $I10, alt112_3
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 61
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
  # rx rxquantr128 ** 0..*
    set_addr $I129, rxquantr128_done
    rx105_cur."!mark_push"(0, rx105_pos, $I129)
  rxquantr128_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I129)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I129)
    goto rxquantr128_loop
  rxquantr128_done:
  alt130_0:
.annotate "line", 62
    set_addr $I10, alt130_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rxanchor eol
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rxanchor131_done
    ne rx105_pos, rx105_eos, rx105_fail
    eq rx105_pos, 0, rxanchor131_done
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rx105_fail
  rxanchor131_done:
    goto alt130_end
  alt130_1:
    set_addr $I10, alt130_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx literal  "#"
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "#", rx105_fail
    add rx105_pos, 1
    goto alt130_end
  alt130_2:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt130_end:
  alt132_0:
.annotate "line", 63
    set_addr $I10, alt132_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 64
  # rx rxquantf133 ** 0..*
    set_addr $I10, rxquantf133_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf133_done
  rxquantf133_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf133_loop
    rx105_cur."!mark_push"($I134, rx105_pos, $I10)
  rxquantf133_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx rxquantr135 ** 0..*
    set_addr $I136, rxquantr135_done
    rx105_cur."!mark_push"(0, rx105_pos, $I136)
  rxquantr135_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I136)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I136)
    goto rxquantr135_loop
  rxquantr135_done:
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
    goto alt132_end
  alt132_1:
.annotate "line", 65
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt132_end:
.annotate "line", 61
    goto alt112_end
  alt112_3:
.annotate "line", 69
  # rx rxquantr137 ** 0..1
    set_addr $I146, rxquantr137_done
    rx105_cur."!mark_push"(0, rx105_pos, $I146)
  rxquantr137_loop:
.annotate "line", 68
  # rx subrule "before" subtype=zerowidth negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    .const 'Sub' $P139 = "28_1259177761.22934" 
    capture_lex $P139
    $P10 = rx105_cur."before"($P139)
    unless $P10, rx105_fail
.annotate "line", 69
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
    (rx105_rep) = rx105_cur."!mark_commit"($I146)
  rxquantr137_done:
  alt147_0:
.annotate "line", 70
    set_addr $I10, alt147_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."alpha"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx105_pos = $P10."pos"()
    goto alt147_end
  alt147_1:
    set_addr $I10, alt147_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx charclass s
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 32, rx105_tgt, $I10
    unless $I11, rx105_fail
    inc rx105_pos
    goto alt147_end
  alt147_2:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Illegal pod directive")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt147_end:
.annotate "line", 71
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
  alt112_end:
.annotate "line", 51
  # rx pass
    rx105_cur."!cursor_pass"(rx105_pos, "pod_comment")
    rx105_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx105_pos)
    .return (rx105_cur)
  rx105_fail:
.annotate "line", 4
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
.sub "!PREFIX__pod_comment"  :subid("27_1259177761.22934") :method
.annotate "line", 4
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["NQP";"Grammar"]
.sub "_block138"  :anon :subid("28_1259177761.22934") :method :outer("26_1259177761.22934")
.annotate "line", 68
    .lex unicode:"$\x{a2}", $P140
    .local string rx141_tgt
    .local int rx141_pos
    .local int rx141_off
    .local int rx141_eos
    .local int rx141_rep
    .local pmc rx141_cur
    (rx141_cur, rx141_pos, rx141_tgt) = self."!cursor_start"()
    rx141_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx141_cur
    .local pmc match
    .lex "$/", match
    length rx141_eos, rx141_tgt
    set rx141_off, 0
    lt rx141_pos, 2, rx141_start
    sub rx141_off, rx141_pos, 1
    substr rx141_tgt, rx141_tgt, rx141_off
  rx141_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan142_done
    goto rxscan142_scan
  rxscan142_loop:
    ($P10) = rx141_cur."from"()
    inc $P10
    set rx141_pos, $P10
    ge rx141_pos, rx141_eos, rxscan142_done
  rxscan142_scan:
    set_addr $I10, rxscan142_loop
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
  rxscan142_done:
  # rx rxquantf143 ** 0..*
    set_addr $I10, rxquantf143_loop
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
    goto rxquantf143_done
  rxquantf143_loop:
  # rx charclass .
    ge rx141_pos, rx141_eos, rx141_fail
    inc rx141_pos
    set_addr $I10, rxquantf143_loop
    rx141_cur."!mark_push"($I144, rx141_pos, $I10)
  rxquantf143_done:
  # rxanchor bol
    eq rx141_pos, 0, rxanchor145_done
    ge rx141_pos, rx141_eos, rx141_fail
    sub $I10, rx141_pos, rx141_off
    dec $I10
    is_cclass $I11, 4096, rx141_tgt, $I10
    unless $I11, rx141_fail
  rxanchor145_done:
  # rx literal  "=cut"
    add $I11, rx141_pos, 4
    gt $I11, rx141_eos, rx141_fail
    sub $I11, rx141_pos, rx141_off
    substr $S10, rx141_tgt, $I11, 4
    ne $S10, "=cut", rx141_fail
    add rx141_pos, 4
  # rxanchor rwb
    le rx141_pos, 0, rx141_fail
    sub $I10, rx141_pos, rx141_off
    is_cclass $I11, 8192, rx141_tgt, $I10
    if $I11, rx141_fail
    dec $I10
    is_cclass $I11, 8192, rx141_tgt, $I10
    unless $I11, rx141_fail
  # rx pass
    rx141_cur."!cursor_pass"(rx141_pos, "")
    rx141_cur."!cursor_debug"("PASS  ", "", " at pos=", rx141_pos)
    .return (rx141_cur)
  rx141_fail:
    (rx141_rep, rx141_pos, $I10, $P10) = rx141_cur."!mark_fail"(0)
    lt rx141_pos, -1, rx141_done
    eq rx141_pos, -1, rx141_fail
    jump $I10
  rx141_done:
    rx141_cur."!cursor_fail"()
    rx141_cur."!cursor_debug"("FAIL  ", "")
    .return (rx141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx149_tgt
    .local int rx149_pos
    .local int rx149_off
    .local int rx149_eos
    .local int rx149_rep
    .local pmc rx149_cur
    (rx149_cur, rx149_pos, rx149_tgt) = self."!cursor_start"()
    rx149_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx149_cur
    .local pmc match
    .lex "$/", match
    length rx149_eos, rx149_tgt
    set rx149_off, 0
    lt rx149_pos, 2, rx149_start
    sub rx149_off, rx149_pos, 1
    substr rx149_tgt, rx149_tgt, rx149_off
  rx149_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan153_done
    goto rxscan153_scan
  rxscan153_loop:
    ($P10) = rx149_cur."from"()
    inc $P10
    set rx149_pos, $P10
    ge rx149_pos, rx149_eos, rxscan153_done
  rxscan153_scan:
    set_addr $I10, rxscan153_loop
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
  rxscan153_done:
.annotate "line", 79
  # rx subrule "newpad" subtype=method negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."newpad"()
    unless $P10, rx149_fail
    rx149_pos = $P10."pos"()
.annotate "line", 80
  # rx subrule "statementlist" subtype=capture negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."statementlist"()
    unless $P10, rx149_fail
    rx149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx149_pos = $P10."pos"()
  alt154_0:
.annotate "line", 81
    set_addr $I10, alt154_1
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
  # rxanchor eos
    ne rx149_pos, rx149_eos, rx149_fail
    goto alt154_end
  alt154_1:
  # rx subrule "panic" subtype=method negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."panic"("Confused")
    unless $P10, rx149_fail
    rx149_pos = $P10."pos"()
  alt154_end:
.annotate "line", 78
  # rx pass
    rx149_cur."!cursor_pass"(rx149_pos, "comp_unit")
    rx149_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx149_pos)
    .return (rx149_cur)
  rx149_fail:
.annotate "line", 4
    (rx149_rep, rx149_pos, $I10, $P10) = rx149_cur."!mark_fail"(0)
    lt rx149_pos, -1, rx149_done
    eq rx149_pos, -1, rx149_fail
    jump $I10
  rx149_done:
    rx149_cur."!cursor_fail"()
    rx149_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1259177761.22934") :method
.annotate "line", 4
    $P151 = self."!PREFIX__!subrule"("", "")
    new $P152, "ResizablePMCArray"
    push $P152, $P151
    .return ($P152)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    (rx156_cur, rx156_pos, rx156_tgt) = self."!cursor_start"()
    rx156_cur."!cursor_debug"("START ", "statementlist")
    rx156_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx156_cur
    .local pmc match
    .lex "$/", match
    length rx156_eos, rx156_tgt
    set rx156_off, 0
    lt rx156_pos, 2, rx156_start
    sub rx156_off, rx156_pos, 1
    substr rx156_tgt, rx156_tgt, rx156_off
  rx156_start:
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
  alt160_0:
.annotate "line", 84
    set_addr $I10, alt160_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rxanchor eos
    ne rx156_pos, rx156_eos, rx156_fail
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
    goto alt160_end
  alt160_1:
.annotate "line", 86
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rx rxquantr164 ** 0..*
    set_addr $I166, rxquantr164_done
    rx156_cur."!mark_push"(0, rx156_pos, $I166)
  rxquantr164_loop:
  # rx subrule "statement" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx156_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."eat_terminator"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
    (rx156_rep) = rx156_cur."!mark_commit"($I166)
    rx156_cur."!mark_push"(rx156_rep, rx156_pos, $I166)
    goto rxquantr164_loop
  rxquantr164_done:
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  alt160_end:
.annotate "line", 84
  # rx pass
    rx156_cur."!cursor_pass"(rx156_pos, "statementlist")
    rx156_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx156_pos)
    .return (rx156_cur)
  rx156_fail:
.annotate "line", 4
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    rx156_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1259177761.22934") :method
.annotate "line", 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .const 'Sub' $P174 = "35_1259177761.22934" 
    capture_lex $P174
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "statement")
    rx169_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx169_cur
    .local pmc match
    .lex "$/", match
    length rx169_eos, rx169_tgt
    set rx169_off, 0
    lt rx169_pos, 2, rx169_start
    sub rx169_off, rx169_pos, 1
    substr rx169_tgt, rx169_tgt, rx169_off
  rx169_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan172_done
    goto rxscan172_scan
  rxscan172_loop:
    ($P10) = rx169_cur."from"()
    inc $P10
    set rx169_pos, $P10
    ge rx169_pos, rx169_eos, rxscan172_done
  rxscan172_scan:
    set_addr $I10, rxscan172_loop
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  rxscan172_done:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx169_cur."!cursor_pos"(rx169_pos)
    .const 'Sub' $P174 = "35_1259177761.22934" 
    capture_lex $P174
    $P10 = rx169_cur."before"($P174)
    if $P10, rx169_fail
  alt179_0:
.annotate "line", 91
    set_addr $I10, alt179_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
.annotate "line", 92
  # rx subrule "statement_control" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_control"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx169_pos = $P10."pos"()
    goto alt179_end
  alt179_1:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."EXPR"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx169_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."ws"()
    unless $P10, rx169_fail
    rx169_pos = $P10."pos"()
.annotate "line", 97
  # rx rxquantr180 ** 0..1
    set_addr $I184, rxquantr180_done
    rx169_cur."!mark_push"(0, rx169_pos, $I184)
  rxquantr180_loop:
  alt181_0:
.annotate "line", 94
    set_addr $I10, alt181_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_cond"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx169_pos = $P10."pos"()
  # rx rxquantr182 ** 0..1
    set_addr $I183, rxquantr182_done
    rx169_cur."!mark_push"(0, rx169_pos, $I183)
  rxquantr182_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_loop"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx169_pos = $P10."pos"()
    (rx169_rep) = rx169_cur."!mark_commit"($I183)
  rxquantr182_done:
    goto alt181_end
  alt181_1:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_loop"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx169_pos = $P10."pos"()
  alt181_end:
.annotate "line", 97
    (rx169_rep) = rx169_cur."!mark_commit"($I184)
  rxquantr180_done:
  alt179_end:
.annotate "line", 89
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "statement")
    rx169_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
.annotate "line", 4
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1259177761.22934") :method
.annotate "line", 4
    new $P171, "ResizablePMCArray"
    push $P171, ""
    .return ($P171)
.end


.namespace ["NQP";"Grammar"]
.sub "_block173"  :anon :subid("35_1259177761.22934") :method :outer("33_1259177761.22934")
.annotate "line", 90
    .lex unicode:"$\x{a2}", $P175
    .local string rx176_tgt
    .local int rx176_pos
    .local int rx176_off
    .local int rx176_eos
    .local int rx176_rep
    .local pmc rx176_cur
    (rx176_cur, rx176_pos, rx176_tgt) = self."!cursor_start"()
    rx176_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan177_done
    goto rxscan177_scan
  rxscan177_loop:
    ($P10) = rx176_cur."from"()
    inc $P10
    set rx176_pos, $P10
    ge rx176_pos, rx176_eos, rxscan177_done
  rxscan177_scan:
    set_addr $I10, rxscan177_loop
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  rxscan177_done:
  alt178_0:
    set_addr $I10, alt178_1
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx176_pos, rx176_eos, rx176_fail
    sub $I10, rx176_pos, rx176_off
    substr $S10, rx176_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx176_fail
    inc rx176_pos
    goto alt178_end
  alt178_1:
  # rxanchor eos
    ne rx176_pos, rx176_eos, rx176_fail
  alt178_end:
  # rx pass
    rx176_cur."!cursor_pass"(rx176_pos, "")
    rx176_cur."!cursor_debug"("PASS  ", "", " at pos=", rx176_pos)
    .return (rx176_cur)
  rx176_fail:
    (rx176_rep, rx176_pos, $I10, $P10) = rx176_cur."!mark_fail"(0)
    lt rx176_pos, -1, rx176_done
    eq rx176_pos, -1, rx176_fail
    jump $I10
  rx176_done:
    rx176_cur."!cursor_fail"()
    rx176_cur."!cursor_debug"("FAIL  ", "")
    .return (rx176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx186_tgt
    .local int rx186_pos
    .local int rx186_off
    .local int rx186_eos
    .local int rx186_rep
    .local pmc rx186_cur
    (rx186_cur, rx186_pos, rx186_tgt) = self."!cursor_start"()
    rx186_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx186_cur
    .local pmc match
    .lex "$/", match
    length rx186_eos, rx186_tgt
    set rx186_off, 0
    lt rx186_pos, 2, rx186_start
    sub rx186_off, rx186_pos, 1
    substr rx186_tgt, rx186_tgt, rx186_off
  rx186_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan189_done
    goto rxscan189_scan
  rxscan189_loop:
    ($P10) = rx186_cur."from"()
    inc $P10
    set rx186_pos, $P10
    ge rx186_pos, rx186_eos, rxscan189_done
  rxscan189_scan:
    set_addr $I10, rxscan189_loop
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
  rxscan189_done:
  alt190_0:
.annotate "line", 101
    set_addr $I10, alt190_1
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 102
  # rx literal  ";"
    add $I11, rx186_pos, 1
    gt $I11, rx186_eos, rx186_fail
    sub $I11, rx186_pos, rx186_off
    substr $S10, rx186_tgt, $I11, 1
    ne $S10, ";", rx186_fail
    add rx186_pos, 1
    goto alt190_end
  alt190_1:
    set_addr $I10, alt190_2
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."MARKED"("endstmt")
    unless $P10, rx186_fail
    goto alt190_end
  alt190_2:
    set_addr $I10, alt190_3
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."terminator"()
    unless $P10, rx186_fail
    goto alt190_end
  alt190_3:
.annotate "line", 105
  # rxanchor eos
    ne rx186_pos, rx186_eos, rx186_fail
  alt190_end:
.annotate "line", 101
  # rx pass
    rx186_cur."!cursor_pass"(rx186_pos, "eat_terminator")
    rx186_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx186_pos)
    .return (rx186_cur)
  rx186_fail:
.annotate "line", 4
    (rx186_rep, rx186_pos, $I10, $P10) = rx186_cur."!mark_fail"(0)
    lt rx186_pos, -1, rx186_done
    eq rx186_pos, -1, rx186_fail
    jump $I10
  rx186_done:
    rx186_cur."!cursor_fail"()
    rx186_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx186_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1259177761.22934") :method
.annotate "line", 4
    new $P188, "ResizablePMCArray"
    push $P188, ""
    push $P188, ""
    push $P188, ""
    push $P188, ";"
    .return ($P188)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt) = self."!cursor_start"()
    rx192_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    set rx192_off, 0
    lt rx192_pos, 2, rx192_start
    sub rx192_off, rx192_pos, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan196_done
    goto rxscan196_scan
  rxscan196_loop:
    ($P10) = rx192_cur."from"()
    inc $P10
    set rx192_pos, $P10
    ge rx192_pos, rx192_eos, rxscan196_done
  rxscan196_scan:
    set_addr $I10, rxscan196_loop
    rx192_cur."!mark_push"(0, rx192_pos, $I10)
  rxscan196_done:
.annotate "line", 109
  # rx subrule "EXPR" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."EXPR"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx192_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."ws"()
    unless $P10, rx192_fail
    rx192_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."pblock"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx192_pos = $P10."pos"()
.annotate "line", 108
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "xblock")
    rx192_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_fail:
.annotate "line", 4
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx192_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1259177761.22934") :method
.annotate "line", 4
    $P194 = self."!PREFIX__!subrule"("EXPR", "")
    new $P195, "ResizablePMCArray"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx198_tgt
    .local int rx198_pos
    .local int rx198_off
    .local int rx198_eos
    .local int rx198_rep
    .local pmc rx198_cur
    (rx198_cur, rx198_pos, rx198_tgt) = self."!cursor_start"()
    rx198_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx198_cur
    .local pmc match
    .lex "$/", match
    length rx198_eos, rx198_tgt
    set rx198_off, 0
    lt rx198_pos, 2, rx198_start
    sub rx198_off, rx198_pos, 1
    substr rx198_tgt, rx198_tgt, rx198_off
  rx198_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan203_done
    goto rxscan203_scan
  rxscan203_loop:
    ($P10) = rx198_cur."from"()
    inc $P10
    set rx198_pos, $P10
    ge rx198_pos, rx198_eos, rxscan203_done
  rxscan203_scan:
    set_addr $I10, rxscan203_loop
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
  rxscan203_done:
  alt204_0:
.annotate "line", 112
    set_addr $I10, alt204_1
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."lambda"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."newpad"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."signature"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx198_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."blockoid"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx198_pos = $P10."pos"()
.annotate "line", 113
    goto alt204_end
  alt204_1:
    set_addr $I10, alt204_2
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx198_pos, rx198_eos, rx198_fail
    sub $I10, rx198_pos, rx198_off
    substr $S10, rx198_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx198_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."newpad"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."blockoid"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx198_pos = $P10."pos"()
.annotate "line", 117
    goto alt204_end
  alt204_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."panic"("Missing block")
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
  alt204_end:
.annotate "line", 112
  # rx pass
    rx198_cur."!cursor_pass"(rx198_pos, "pblock")
    rx198_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx198_pos)
    .return (rx198_cur)
  rx198_fail:
.annotate "line", 4
    (rx198_rep, rx198_pos, $I10, $P10) = rx198_cur."!mark_fail"(0)
    lt rx198_pos, -1, rx198_done
    eq rx198_pos, -1, rx198_fail
    jump $I10
  rx198_done:
    rx198_cur."!cursor_fail"()
    rx198_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx198_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1259177761.22934") :method
.annotate "line", 4
    $P200 = self."!PREFIX__!subrule"("", "")
    $P201 = self."!PREFIX__!subrule"("", "")
    new $P202, "ResizablePMCArray"
    push $P202, $P200
    push $P202, "{"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    (rx206_cur, rx206_pos, rx206_tgt) = self."!cursor_start"()
    rx206_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    set rx206_off, 0
    lt rx206_pos, 2, rx206_start
    sub rx206_off, rx206_pos, 1
    substr rx206_tgt, rx206_tgt, rx206_off
  rx206_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan209_done
    goto rxscan209_scan
  rxscan209_loop:
    ($P10) = rx206_cur."from"()
    inc $P10
    set rx206_pos, $P10
    ge rx206_pos, rx206_eos, rxscan209_done
  rxscan209_scan:
    set_addr $I10, rxscan209_loop
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  rxscan209_done:
  alt210_0:
.annotate "line", 123
    set_addr $I10, alt210_1
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  # rx literal  "->"
    add $I11, rx206_pos, 2
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 2
    ne $S10, "->", rx206_fail
    add rx206_pos, 2
    goto alt210_end
  alt210_1:
  # rx literal  "<->"
    add $I11, rx206_pos, 3
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 3
    ne $S10, "<->", rx206_fail
    add rx206_pos, 3
  alt210_end:
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "lambda")
    rx206_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx206_pos)
    .return (rx206_cur)
  rx206_fail:
.annotate "line", 4
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    rx206_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx206_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1259177761.22934") :method
.annotate "line", 4
    new $P208, "ResizablePMCArray"
    push $P208, "<->"
    push $P208, "->"
    .return ($P208)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt rx212_pos, 2, rx212_start
    sub rx212_off, rx212_pos, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan216_done
    goto rxscan216_scan
  rxscan216_loop:
    ($P10) = rx212_cur."from"()
    inc $P10
    set rx212_pos, $P10
    ge rx212_pos, rx212_eos, rxscan216_done
  rxscan216_scan:
    set_addr $I10, rxscan216_loop
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  rxscan216_done:
  alt217_0:
.annotate "line", 126
    set_addr $I10, alt217_1
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx212_pos, rx212_eos, rx212_fail
    sub $I10, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx212_fail
    goto alt217_end
  alt217_1:
  # rx subrule "panic" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."panic"("Missing block")
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
  alt217_end:
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."newpad"()
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."blockoid"()
    unless $P10, rx212_fail
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx212_pos = $P10."pos"()
.annotate "line", 125
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "block")
    rx212_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 4
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1259177761.22934") :method
.annotate "line", 4
    $P214 = self."!PREFIX__!subrule"("", "")
    new $P215, "ResizablePMCArray"
    push $P215, $P214
    push $P215, "{"
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt) = self."!cursor_start"()
    rx219_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx219_cur
    .local pmc match
    .lex "$/", match
    length rx219_eos, rx219_tgt
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
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."finishpad"()
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
.annotate "line", 133
  # rx literal  "{"
    add $I11, rx219_pos, 1
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 1
    ne $S10, "{", rx219_fail
    add rx219_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."statementlist"()
    unless $P10, rx219_fail
    rx219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx219_pos = $P10."pos"()
  alt224_0:
    set_addr $I10, alt224_1
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  # rx literal  "}"
    add $I11, rx219_pos, 1
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 1
    ne $S10, "}", rx219_fail
    add rx219_pos, 1
    goto alt224_end
  alt224_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."FAILGOAL"("'}'")
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
  alt224_end:
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."ENDSTMT"()
    unless $P10, rx219_fail
.annotate "line", 131
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "blockoid")
    rx219_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_fail:
.annotate "line", 4
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1259177761.22934") :method
.annotate "line", 4
    $P221 = self."!PREFIX__!subrule"("", "")
    new $P222, "ResizablePMCArray"
    push $P222, $P221
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx227_tgt
    .local int rx227_pos
    .local int rx227_off
    .local int rx227_eos
    .local int rx227_rep
    .local pmc rx227_cur
    (rx227_cur, rx227_pos, rx227_tgt) = self."!cursor_start"()
    rx227_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx227_cur
    .local pmc match
    .lex "$/", match
    length rx227_eos, rx227_tgt
    set rx227_off, 0
    lt rx227_pos, 2, rx227_start
    sub rx227_off, rx227_pos, 1
    substr rx227_tgt, rx227_tgt, rx227_off
  rx227_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan230_done
    goto rxscan230_scan
  rxscan230_loop:
    ($P10) = rx227_cur."from"()
    inc $P10
    set rx227_pos, $P10
    ge rx227_pos, rx227_eos, rxscan230_done
  rxscan230_scan:
    set_addr $I10, rxscan230_loop
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  rxscan230_done:
.annotate "line", 137
  # rx pass
    rx227_cur."!cursor_pass"(rx227_pos, "newpad")
    rx227_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx227_pos)
    .return (rx227_cur)
  rx227_fail:
.annotate "line", 4
    (rx227_rep, rx227_pos, $I10, $P10) = rx227_cur."!mark_fail"(0)
    lt rx227_pos, -1, rx227_done
    eq rx227_pos, -1, rx227_fail
    jump $I10
  rx227_done:
    rx227_cur."!cursor_fail"()
    rx227_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx227_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1259177761.22934") :method
.annotate "line", 4
    new $P229, "ResizablePMCArray"
    push $P229, ""
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt) = self."!cursor_start"()
    rx232_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx232_cur
    .local pmc match
    .lex "$/", match
    length rx232_eos, rx232_tgt
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
.annotate "line", 138
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "finishpad")
    rx232_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_fail:
.annotate "line", 4
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1259177761.22934") :method
.annotate "line", 4
    new $P234, "ResizablePMCArray"
    push $P234, ""
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1259177761.22934") :method
.annotate "line", 140
    $P237 = self."!protoregex"("terminator")
    .return ($P237)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1259177761.22934") :method
.annotate "line", 140
    $P239 = self."!PREFIX__!protoregex"("terminator")
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx241_tgt
    .local int rx241_pos
    .local int rx241_off
    .local int rx241_eos
    .local int rx241_rep
    .local pmc rx241_cur
    (rx241_cur, rx241_pos, rx241_tgt) = self."!cursor_start"()
    rx241_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx241_cur
    .local pmc match
    .lex "$/", match
    length rx241_eos, rx241_tgt
    set rx241_off, 0
    lt rx241_pos, 2, rx241_start
    sub rx241_off, rx241_pos, 1
    substr rx241_tgt, rx241_tgt, rx241_off
  rx241_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan244_done
    goto rxscan244_scan
  rxscan244_loop:
    ($P10) = rx241_cur."from"()
    inc $P10
    set rx241_pos, $P10
    ge rx241_pos, rx241_eos, rxscan244_done
  rxscan244_scan:
    set_addr $I10, rxscan244_loop
    rx241_cur."!mark_push"(0, rx241_pos, $I10)
  rxscan244_done:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx241_pos, rx241_eos, rx241_fail
    sub $I10, rx241_pos, rx241_off
    substr $S10, rx241_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx241_fail
  # rx pass
    rx241_cur."!cursor_pass"(rx241_pos, "terminator:sym<;>")
    rx241_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx241_pos)
    .return (rx241_cur)
  rx241_fail:
.annotate "line", 4
    (rx241_rep, rx241_pos, $I10, $P10) = rx241_cur."!mark_fail"(0)
    lt rx241_pos, -1, rx241_done
    eq rx241_pos, -1, rx241_fail
    jump $I10
  rx241_done:
    rx241_cur."!cursor_fail"()
    rx241_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx241_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1259177761.22934") :method
.annotate "line", 4
    new $P243, "ResizablePMCArray"
    push $P243, ";"
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
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
.annotate "line", 143
  # rx enumcharlist negate=0 zerowidth
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx246_fail
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "terminator:sym<}>")
    rx246_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
.annotate "line", 4
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1259177761.22934") :method
.annotate "line", 4
    new $P248, "ResizablePMCArray"
    push $P248, "}"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1259177761.22934") :method
.annotate "line", 147
    $P251 = self."!protoregex"("statement_control")
    .return ($P251)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1259177761.22934") :method
.annotate "line", 147
    $P253 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P253)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx255_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx255_cur
    .local pmc match
    .lex "$/", match
    length rx255_eos, rx255_tgt
    set rx255_off, 0
    lt rx255_pos, 2, rx255_start
    sub rx255_off, rx255_pos, 1
    substr rx255_tgt, rx255_tgt, rx255_off
  rx255_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan258_done
    goto rxscan258_scan
  rxscan258_loop:
    ($P10) = rx255_cur."from"()
    inc $P10
    set rx255_pos, $P10
    ge rx255_pos, rx255_eos, rxscan258_done
  rxscan258_scan:
    set_addr $I10, rxscan258_loop
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  rxscan258_done:
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_259_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "if"
    add $I11, rx255_pos, 2
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 2
    ne $S10, "if", rx255_fail
    add rx255_pos, 2
    set_addr $I10, rxcap_259_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_259_done
  rxcap_259_fail:
    goto rx255_fail
  rxcap_259_done:
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."xblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr262 ** 0..*
    set_addr $I266, rxquantr262_done
    rx255_cur."!mark_push"(0, rx255_pos, $I266)
  rxquantr262_loop:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "elsif", rx255_fail
    add rx255_pos, 5
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."xblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
    (rx255_rep) = rx255_cur."!mark_commit"($I266)
    rx255_cur."!mark_push"(rx255_rep, rx255_pos, $I266)
    goto rxquantr262_loop
  rxquantr262_done:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 153
  # rx rxquantr268 ** 0..1
    set_addr $I272, rxquantr268_done
    rx255_cur."!mark_push"(0, rx255_pos, $I272)
  rxquantr268_loop:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx255_pos, 4
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 4
    ne $S10, "else", rx255_fail
    add rx255_pos, 4
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."pblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
    (rx255_rep) = rx255_cur."!mark_commit"($I272)
  rxquantr268_done:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "statement_control:sym<if>")
    rx255_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate "line", 4
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx255_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1259177761.22934") :method
.annotate "line", 4
    new $P257, "ResizablePMCArray"
    push $P257, "if"
    .return ($P257)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .const 'Sub' $P285 = "64_1259177761.22934" 
    capture_lex $P285
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    (rx275_cur, rx275_pos, rx275_tgt) = self."!cursor_start"()
    rx275_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx275_cur
    .local pmc match
    .lex "$/", match
    length rx275_eos, rx275_tgt
    set rx275_off, 0
    lt rx275_pos, 2, rx275_start
    sub rx275_off, rx275_pos, 1
    substr rx275_tgt, rx275_tgt, rx275_off
  rx275_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan278_done
    goto rxscan278_scan
  rxscan278_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan278_done
  rxscan278_scan:
    set_addr $I10, rxscan278_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan278_done:
.annotate "line", 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_279_fail
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx literal  "unless"
    add $I11, rx275_pos, 6
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 6
    ne $S10, "unless", rx275_fail
    add rx275_pos, 6
    set_addr $I10, rxcap_279_fail
    ($I12, $I11) = rx275_cur."!mark_peek"($I10)
    rx275_cur."!cursor_pos"($I11)
    ($P10) = rx275_cur."!cursor_start"()
    $P10."!cursor_pass"(rx275_pos, "")
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_279_done
  rxcap_279_fail:
    goto rx275_fail
  rxcap_279_done:
  # rx charclass s
    ge rx275_pos, rx275_eos, rx275_fail
    sub $I10, rx275_pos, rx275_off
    is_cclass $I11, 32, rx275_tgt, $I10
    unless $I11, rx275_fail
    inc rx275_pos
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
.annotate "line", 158
  # rx subrule "xblock" subtype=capture negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."xblock"()
    unless $P10, rx275_fail
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx275_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  alt282_0:
.annotate "line", 159
    set_addr $I10, alt282_1
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx275_cur."!cursor_pos"(rx275_pos)
    .const 'Sub' $P285 = "64_1259177761.22934" 
    capture_lex $P285
    $P10 = rx275_cur."before"($P285)
    if $P10, rx275_fail
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
    goto alt282_end
  alt282_1:
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  alt282_end:
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
.annotate "line", 156
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "statement_control:sym<unless>")
    rx275_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx275_pos)
    .return (rx275_cur)
  rx275_fail:
.annotate "line", 4
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    rx275_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1259177761.22934") :method
.annotate "line", 4
    new $P277, "ResizablePMCArray"
    push $P277, "unless"
    .return ($P277)
.end


.namespace ["NQP";"Grammar"]
.sub "_block284"  :anon :subid("64_1259177761.22934") :method :outer("62_1259177761.22934")
.annotate "line", 159
    .lex unicode:"$\x{a2}", $P286
    .local string rx287_tgt
    .local int rx287_pos
    .local int rx287_off
    .local int rx287_eos
    .local int rx287_rep
    .local pmc rx287_cur
    (rx287_cur, rx287_pos, rx287_tgt) = self."!cursor_start"()
    rx287_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx287_cur
    .local pmc match
    .lex "$/", match
    length rx287_eos, rx287_tgt
    set rx287_off, 0
    lt rx287_pos, 2, rx287_start
    sub rx287_off, rx287_pos, 1
    substr rx287_tgt, rx287_tgt, rx287_off
  rx287_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan288_done
    goto rxscan288_scan
  rxscan288_loop:
    ($P10) = rx287_cur."from"()
    inc $P10
    set rx287_pos, $P10
    ge rx287_pos, rx287_eos, rxscan288_done
  rxscan288_scan:
    set_addr $I10, rxscan288_loop
    rx287_cur."!mark_push"(0, rx287_pos, $I10)
  rxscan288_done:
  # rx literal  "else"
    add $I11, rx287_pos, 4
    gt $I11, rx287_eos, rx287_fail
    sub $I11, rx287_pos, rx287_off
    substr $S10, rx287_tgt, $I11, 4
    ne $S10, "else", rx287_fail
    add rx287_pos, 4
  # rx pass
    rx287_cur."!cursor_pass"(rx287_pos, "")
    rx287_cur."!cursor_debug"("PASS  ", "", " at pos=", rx287_pos)
    .return (rx287_cur)
  rx287_fail:
    (rx287_rep, rx287_pos, $I10, $P10) = rx287_cur."!mark_fail"(0)
    lt rx287_pos, -1, rx287_done
    eq rx287_pos, -1, rx287_fail
    jump $I10
  rx287_done:
    rx287_cur."!cursor_fail"()
    rx287_cur."!cursor_debug"("FAIL  ", "")
    .return (rx287_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx294_tgt
    .local int rx294_pos
    .local int rx294_off
    .local int rx294_eos
    .local int rx294_rep
    .local pmc rx294_cur
    (rx294_cur, rx294_pos, rx294_tgt) = self."!cursor_start"()
    rx294_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx294_cur
    .local pmc match
    .lex "$/", match
    length rx294_eos, rx294_tgt
    set rx294_off, 0
    lt rx294_pos, 2, rx294_start
    sub rx294_off, rx294_pos, 1
    substr rx294_tgt, rx294_tgt, rx294_off
  rx294_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan297_done
    goto rxscan297_scan
  rxscan297_loop:
    ($P10) = rx294_cur."from"()
    inc $P10
    set rx294_pos, $P10
    ge rx294_pos, rx294_eos, rxscan297_done
  rxscan297_scan:
    set_addr $I10, rxscan297_loop
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  rxscan297_done:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_299_fail
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  alt298_0:
    set_addr $I10, alt298_1
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  # rx literal  "while"
    add $I11, rx294_pos, 5
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 5
    ne $S10, "while", rx294_fail
    add rx294_pos, 5
    goto alt298_end
  alt298_1:
  # rx literal  "until"
    add $I11, rx294_pos, 5
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 5
    ne $S10, "until", rx294_fail
    add rx294_pos, 5
  alt298_end:
    set_addr $I10, rxcap_299_fail
    ($I12, $I11) = rx294_cur."!mark_peek"($I10)
    rx294_cur."!cursor_pos"($I11)
    ($P10) = rx294_cur."!cursor_start"()
    $P10."!cursor_pass"(rx294_pos, "")
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_299_done
  rxcap_299_fail:
    goto rx294_fail
  rxcap_299_done:
  # rx charclass s
    ge rx294_pos, rx294_eos, rx294_fail
    sub $I10, rx294_pos, rx294_off
    is_cclass $I11, 32, rx294_tgt, $I10
    unless $I11, rx294_fail
    inc rx294_pos
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."xblock"()
    unless $P10, rx294_fail
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx294_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx294_cur."!cursor_pass"(rx294_pos, "statement_control:sym<while>")
    rx294_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx294_pos)
    .return (rx294_cur)
  rx294_fail:
.annotate "line", 4
    (rx294_rep, rx294_pos, $I10, $P10) = rx294_cur."!mark_fail"(0)
    lt rx294_pos, -1, rx294_done
    eq rx294_pos, -1, rx294_fail
    jump $I10
  rx294_done:
    rx294_cur."!cursor_fail"()
    rx294_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx294_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1259177761.22934") :method
.annotate "line", 4
    new $P296, "ResizablePMCArray"
    push $P296, "until"
    push $P296, "while"
    .return ($P296)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx303_tgt
    .local int rx303_pos
    .local int rx303_off
    .local int rx303_eos
    .local int rx303_rep
    .local pmc rx303_cur
    (rx303_cur, rx303_pos, rx303_tgt) = self."!cursor_start"()
    rx303_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx303_cur
    .local pmc match
    .lex "$/", match
    length rx303_eos, rx303_tgt
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
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_307_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx303_pos, 6
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 6
    ne $S10, "repeat", rx303_fail
    add rx303_pos, 6
    set_addr $I10, rxcap_307_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_307_done
  rxcap_307_fail:
    goto rx303_fail
  rxcap_307_done:
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
  alt309_0:
.annotate "line", 169
    set_addr $I10, alt309_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_312_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  alt311_0:
    set_addr $I10, alt311_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "while"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "while", rx303_fail
    add rx303_pos, 5
    goto alt311_end
  alt311_1:
  # rx literal  "until"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "until", rx303_fail
    add rx303_pos, 5
  alt311_end:
    set_addr $I10, rxcap_312_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_312_done
  rxcap_312_fail:
    goto rx303_fail
  rxcap_312_done:
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
    goto alt309_end
  alt309_1:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."pblock"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx303_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_318_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  alt317_0:
    set_addr $I10, alt317_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "while"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "while", rx303_fail
    add rx303_pos, 5
    goto alt317_end
  alt317_1:
  # rx literal  "until"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "until", rx303_fail
    add rx303_pos, 5
  alt317_end:
    set_addr $I10, rxcap_318_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_318_done
  rxcap_318_fail:
    goto rx303_fail
  rxcap_318_done:
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
  # rx subrule "EXPR" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."EXPR"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx303_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  alt309_end:
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "statement_control:sym<repeat>")
    rx303_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx303_pos)
    .return (rx303_cur)
  rx303_fail:
.annotate "line", 4
    (rx303_rep, rx303_pos, $I10, $P10) = rx303_cur."!mark_fail"(0)
    lt rx303_pos, -1, rx303_done
    eq rx303_pos, -1, rx303_fail
    jump $I10
  rx303_done:
    rx303_cur."!cursor_fail"()
    rx303_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1259177761.22934") :method
.annotate "line", 4
    new $P305, "ResizablePMCArray"
    push $P305, "repeat"
    .return ($P305)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx323_tgt
    .local int rx323_pos
    .local int rx323_off
    .local int rx323_eos
    .local int rx323_rep
    .local pmc rx323_cur
    (rx323_cur, rx323_pos, rx323_tgt) = self."!cursor_start"()
    rx323_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx323_cur
    .local pmc match
    .lex "$/", match
    length rx323_eos, rx323_tgt
    set rx323_off, 0
    lt rx323_pos, 2, rx323_start
    sub rx323_off, rx323_pos, 1
    substr rx323_tgt, rx323_tgt, rx323_off
  rx323_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan326_done
    goto rxscan326_scan
  rxscan326_loop:
    ($P10) = rx323_cur."from"()
    inc $P10
    set rx323_pos, $P10
    ge rx323_pos, rx323_eos, rxscan326_done
  rxscan326_scan:
    set_addr $I10, rxscan326_loop
    rx323_cur."!mark_push"(0, rx323_pos, $I10)
  rxscan326_done:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_327_fail
    rx323_cur."!mark_push"(0, rx323_pos, $I10)
  # rx literal  "for"
    add $I11, rx323_pos, 3
    gt $I11, rx323_eos, rx323_fail
    sub $I11, rx323_pos, rx323_off
    substr $S10, rx323_tgt, $I11, 3
    ne $S10, "for", rx323_fail
    add rx323_pos, 3
    set_addr $I10, rxcap_327_fail
    ($I12, $I11) = rx323_cur."!mark_peek"($I10)
    rx323_cur."!cursor_pos"($I11)
    ($P10) = rx323_cur."!cursor_start"()
    $P10."!cursor_pass"(rx323_pos, "")
    rx323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_327_done
  rxcap_327_fail:
    goto rx323_fail
  rxcap_327_done:
  # rx charclass s
    ge rx323_pos, rx323_eos, rx323_fail
    sub $I10, rx323_pos, rx323_off
    is_cclass $I11, 32, rx323_tgt, $I10
    unless $I11, rx323_fail
    inc rx323_pos
  # rx subrule "ws" subtype=method negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."ws"()
    unless $P10, rx323_fail
    rx323_pos = $P10."pos"()
.annotate "line", 177
  # rx subrule "xblock" subtype=capture negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."xblock"()
    unless $P10, rx323_fail
    rx323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx323_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."ws"()
    unless $P10, rx323_fail
    rx323_pos = $P10."pos"()
.annotate "line", 175
  # rx pass
    rx323_cur."!cursor_pass"(rx323_pos, "statement_control:sym<for>")
    rx323_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx323_pos)
    .return (rx323_cur)
  rx323_fail:
.annotate "line", 4
    (rx323_rep, rx323_pos, $I10, $P10) = rx323_cur."!mark_fail"(0)
    lt rx323_pos, -1, rx323_done
    eq rx323_pos, -1, rx323_fail
    jump $I10
  rx323_done:
    rx323_cur."!cursor_fail"()
    rx323_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx323_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1259177761.22934") :method
.annotate "line", 4
    new $P325, "ResizablePMCArray"
    push $P325, "for"
    .return ($P325)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CATCH>"  :subid("71_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "statement_control:sym<CATCH>")
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    set rx331_off, 0
    lt rx331_pos, 2, rx331_start
    sub rx331_off, rx331_pos, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan334_done
    goto rxscan334_scan
  rxscan334_loop:
    ($P10) = rx331_cur."from"()
    inc $P10
    set rx331_pos, $P10
    ge rx331_pos, rx331_eos, rxscan334_done
  rxscan334_scan:
    set_addr $I10, rxscan334_loop
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  rxscan334_done:
.annotate "line", 181
  # rx subcapture "sym"
    set_addr $I10, rxcap_335_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx literal  "CATCH"
    add $I11, rx331_pos, 5
    gt $I11, rx331_eos, rx331_fail
    sub $I11, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I11, 5
    ne $S10, "CATCH", rx331_fail
    add rx331_pos, 5
    set_addr $I10, rxcap_335_fail
    ($I12, $I11) = rx331_cur."!mark_peek"($I10)
    rx331_cur."!cursor_pos"($I11)
    ($P10) = rx331_cur."!cursor_start"()
    $P10."!cursor_pass"(rx331_pos, "")
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_335_done
  rxcap_335_fail:
    goto rx331_fail
  rxcap_335_done:
  # rx charclass s
    ge rx331_pos, rx331_eos, rx331_fail
    sub $I10, rx331_pos, rx331_off
    is_cclass $I11, 32, rx331_tgt, $I10
    unless $I11, rx331_fail
    inc rx331_pos
  # rx subrule "ws" subtype=method negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."ws"()
    unless $P10, rx331_fail
    rx331_pos = $P10."pos"()
.annotate "line", 182
  # rx subrule "block" subtype=capture negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."block"()
    unless $P10, rx331_fail
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx331_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."ws"()
    unless $P10, rx331_fail
    rx331_pos = $P10."pos"()
.annotate "line", 180
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "statement_control:sym<CATCH>")
    rx331_cur."!cursor_debug"("PASS  ", "statement_control:sym<CATCH>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate "line", 4
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CATCH>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CATCH>"  :subid("72_1259177761.22934") :method
.annotate "line", 4
    new $P333, "ResizablePMCArray"
    push $P333, "CATCH"
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<CONTROL>"  :subid("73_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx339_tgt
    .local int rx339_pos
    .local int rx339_off
    .local int rx339_eos
    .local int rx339_rep
    .local pmc rx339_cur
    (rx339_cur, rx339_pos, rx339_tgt) = self."!cursor_start"()
    rx339_cur."!cursor_debug"("START ", "statement_control:sym<CONTROL>")
    .lex unicode:"$\x{a2}", rx339_cur
    .local pmc match
    .lex "$/", match
    length rx339_eos, rx339_tgt
    set rx339_off, 0
    lt rx339_pos, 2, rx339_start
    sub rx339_off, rx339_pos, 1
    substr rx339_tgt, rx339_tgt, rx339_off
  rx339_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan342_done
    goto rxscan342_scan
  rxscan342_loop:
    ($P10) = rx339_cur."from"()
    inc $P10
    set rx339_pos, $P10
    ge rx339_pos, rx339_eos, rxscan342_done
  rxscan342_scan:
    set_addr $I10, rxscan342_loop
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  rxscan342_done:
.annotate "line", 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_343_fail
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  # rx literal  "CONTROL"
    add $I11, rx339_pos, 7
    gt $I11, rx339_eos, rx339_fail
    sub $I11, rx339_pos, rx339_off
    substr $S10, rx339_tgt, $I11, 7
    ne $S10, "CONTROL", rx339_fail
    add rx339_pos, 7
    set_addr $I10, rxcap_343_fail
    ($I12, $I11) = rx339_cur."!mark_peek"($I10)
    rx339_cur."!cursor_pos"($I11)
    ($P10) = rx339_cur."!cursor_start"()
    $P10."!cursor_pass"(rx339_pos, "")
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_343_done
  rxcap_343_fail:
    goto rx339_fail
  rxcap_343_done:
  # rx charclass s
    ge rx339_pos, rx339_eos, rx339_fail
    sub $I10, rx339_pos, rx339_off
    is_cclass $I11, 32, rx339_tgt, $I10
    unless $I11, rx339_fail
    inc rx339_pos
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
.annotate "line", 187
  # rx subrule "block" subtype=capture negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."block"()
    unless $P10, rx339_fail
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx339_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
.annotate "line", 185
  # rx pass
    rx339_cur."!cursor_pass"(rx339_pos, "statement_control:sym<CONTROL>")
    rx339_cur."!cursor_debug"("PASS  ", "statement_control:sym<CONTROL>", " at pos=", rx339_pos)
    .return (rx339_cur)
  rx339_fail:
.annotate "line", 4
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    rx339_cur."!cursor_debug"("FAIL  ", "statement_control:sym<CONTROL>")
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<CONTROL>"  :subid("74_1259177761.22934") :method
.annotate "line", 4
    new $P341, "ResizablePMCArray"
    push $P341, "CONTROL"
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("75_1259177761.22934") :method
.annotate "line", 190
    $P347 = self."!protoregex"("statement_prefix")
    .return ($P347)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("76_1259177761.22934") :method
.annotate "line", 190
    $P349 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P349)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("77_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx351_tgt
    .local int rx351_pos
    .local int rx351_off
    .local int rx351_eos
    .local int rx351_rep
    .local pmc rx351_cur
    (rx351_cur, rx351_pos, rx351_tgt) = self."!cursor_start"()
    rx351_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx351_cur
    .local pmc match
    .lex "$/", match
    length rx351_eos, rx351_tgt
    set rx351_off, 0
    lt rx351_pos, 2, rx351_start
    sub rx351_off, rx351_pos, 1
    substr rx351_tgt, rx351_tgt, rx351_off
  rx351_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan355_done
    goto rxscan355_scan
  rxscan355_loop:
    ($P10) = rx351_cur."from"()
    inc $P10
    set rx351_pos, $P10
    ge rx351_pos, rx351_eos, rxscan355_done
  rxscan355_scan:
    set_addr $I10, rxscan355_loop
    rx351_cur."!mark_push"(0, rx351_pos, $I10)
  rxscan355_done:
.annotate "line", 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_356_fail
    rx351_cur."!mark_push"(0, rx351_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx351_pos, 4
    gt $I11, rx351_eos, rx351_fail
    sub $I11, rx351_pos, rx351_off
    substr $S10, rx351_tgt, $I11, 4
    ne $S10, "INIT", rx351_fail
    add rx351_pos, 4
    set_addr $I10, rxcap_356_fail
    ($I12, $I11) = rx351_cur."!mark_peek"($I10)
    rx351_cur."!cursor_pos"($I11)
    ($P10) = rx351_cur."!cursor_start"()
    $P10."!cursor_pass"(rx351_pos, "")
    rx351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_356_done
  rxcap_356_fail:
    goto rx351_fail
  rxcap_356_done:
  # rx subrule "blorst" subtype=capture negate=
    rx351_cur."!cursor_pos"(rx351_pos)
    $P10 = rx351_cur."blorst"()
    unless $P10, rx351_fail
    rx351_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx351_pos = $P10."pos"()
  # rx pass
    rx351_cur."!cursor_pass"(rx351_pos, "statement_prefix:sym<INIT>")
    rx351_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx351_pos)
    .return (rx351_cur)
  rx351_fail:
.annotate "line", 4
    (rx351_rep, rx351_pos, $I10, $P10) = rx351_cur."!mark_fail"(0)
    lt rx351_pos, -1, rx351_done
    eq rx351_pos, -1, rx351_fail
    jump $I10
  rx351_done:
    rx351_cur."!cursor_fail"()
    rx351_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx351_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("78_1259177761.22934") :method
.annotate "line", 4
    $P353 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P354, "ResizablePMCArray"
    push $P354, $P353
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("79_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    set rx358_off, 0
    lt rx358_pos, 2, rx358_start
    sub rx358_off, rx358_pos, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan362_done
    goto rxscan362_scan
  rxscan362_loop:
    ($P10) = rx358_cur."from"()
    inc $P10
    set rx358_pos, $P10
    ge rx358_pos, rx358_eos, rxscan362_done
  rxscan362_scan:
    set_addr $I10, rxscan362_loop
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  rxscan362_done:
.annotate "line", 194
  # rx subcapture "sym"
    set_addr $I10, rxcap_363_fail
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx literal  "try"
    add $I11, rx358_pos, 3
    gt $I11, rx358_eos, rx358_fail
    sub $I11, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I11, 3
    ne $S10, "try", rx358_fail
    add rx358_pos, 3
    set_addr $I10, rxcap_363_fail
    ($I12, $I11) = rx358_cur."!mark_peek"($I10)
    rx358_cur."!cursor_pos"($I11)
    ($P10) = rx358_cur."!cursor_start"()
    $P10."!cursor_pass"(rx358_pos, "")
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_363_done
  rxcap_363_fail:
    goto rx358_fail
  rxcap_363_done:
.annotate "line", 195
  # rx subrule "blorst" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."blorst"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx358_pos = $P10."pos"()
.annotate "line", 193
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "statement_prefix:sym<try>")
    rx358_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate "line", 4
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("80_1259177761.22934") :method
.annotate "line", 4
    $P360 = self."!PREFIX__!subrule"("blorst", "try")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("81_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx365_tgt
    .local int rx365_pos
    .local int rx365_off
    .local int rx365_eos
    .local int rx365_rep
    .local pmc rx365_cur
    (rx365_cur, rx365_pos, rx365_tgt) = self."!cursor_start"()
    rx365_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx365_cur
    .local pmc match
    .lex "$/", match
    length rx365_eos, rx365_tgt
    set rx365_off, 0
    lt rx365_pos, 2, rx365_start
    sub rx365_off, rx365_pos, 1
    substr rx365_tgt, rx365_tgt, rx365_off
  rx365_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan368_done
    goto rxscan368_scan
  rxscan368_loop:
    ($P10) = rx365_cur."from"()
    inc $P10
    set rx365_pos, $P10
    ge rx365_pos, rx365_eos, rxscan368_done
  rxscan368_scan:
    set_addr $I10, rxscan368_loop
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  rxscan368_done:
.annotate "line", 199
  # rx charclass s
    ge rx365_pos, rx365_eos, rx365_fail
    sub $I10, rx365_pos, rx365_off
    is_cclass $I11, 32, rx365_tgt, $I10
    unless $I11, rx365_fail
    inc rx365_pos
  # rx subrule "ws" subtype=method negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."ws"()
    unless $P10, rx365_fail
    rx365_pos = $P10."pos"()
  alt369_0:
    set_addr $I10, alt369_1
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx365_pos, rx365_eos, rx365_fail
    sub $I10, rx365_pos, rx365_off
    substr $S10, rx365_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx365_fail
  # rx subrule "block" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."block"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx365_pos = $P10."pos"()
    goto alt369_end
  alt369_1:
  # rx subrule "statement" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."statement"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx365_pos = $P10."pos"()
  alt369_end:
.annotate "line", 198
  # rx pass
    rx365_cur."!cursor_pass"(rx365_pos, "blorst")
    rx365_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx365_pos)
    .return (rx365_cur)
  rx365_fail:
.annotate "line", 4
    (rx365_rep, rx365_pos, $I10, $P10) = rx365_cur."!mark_fail"(0)
    lt rx365_pos, -1, rx365_done
    eq rx365_pos, -1, rx365_fail
    jump $I10
  rx365_done:
    rx365_cur."!cursor_fail"()
    rx365_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx365_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("82_1259177761.22934") :method
.annotate "line", 4
    new $P367, "ResizablePMCArray"
    push $P367, ""
    .return ($P367)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("83_1259177761.22934") :method
.annotate "line", 204
    $P371 = self."!protoregex"("statement_mod_cond")
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("84_1259177761.22934") :method
.annotate "line", 204
    $P373 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P373)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("85_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    (rx375_cur, rx375_pos, rx375_tgt) = self."!cursor_start"()
    rx375_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx375_cur
    .local pmc match
    .lex "$/", match
    length rx375_eos, rx375_tgt
    set rx375_off, 0
    lt rx375_pos, 2, rx375_start
    sub rx375_off, rx375_pos, 1
    substr rx375_tgt, rx375_tgt, rx375_off
  rx375_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan378_done
    goto rxscan378_scan
  rxscan378_loop:
    ($P10) = rx375_cur."from"()
    inc $P10
    set rx375_pos, $P10
    ge rx375_pos, rx375_eos, rxscan378_done
  rxscan378_scan:
    set_addr $I10, rxscan378_loop
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  rxscan378_done:
.annotate "line", 206
  # rx subcapture "sym"
    set_addr $I10, rxcap_379_fail
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  # rx literal  "if"
    add $I11, rx375_pos, 2
    gt $I11, rx375_eos, rx375_fail
    sub $I11, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I11, 2
    ne $S10, "if", rx375_fail
    add rx375_pos, 2
    set_addr $I10, rxcap_379_fail
    ($I12, $I11) = rx375_cur."!mark_peek"($I10)
    rx375_cur."!cursor_pos"($I11)
    ($P10) = rx375_cur."!cursor_start"()
    $P10."!cursor_pass"(rx375_pos, "")
    rx375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_379_done
  rxcap_379_fail:
    goto rx375_fail
  rxcap_379_done:
  # rx subrule "ws" subtype=method negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."ws"()
    unless $P10, rx375_fail
    rx375_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."EXPR"()
    unless $P10, rx375_fail
    rx375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx375_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."ws"()
    unless $P10, rx375_fail
    rx375_pos = $P10."pos"()
  # rx pass
    rx375_cur."!cursor_pass"(rx375_pos, "statement_mod_cond:sym<if>")
    rx375_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx375_pos)
    .return (rx375_cur)
  rx375_fail:
.annotate "line", 4
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    rx375_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("86_1259177761.22934") :method
.annotate "line", 4
    new $P377, "ResizablePMCArray"
    push $P377, "if"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("87_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    set rx383_off, 0
    lt rx383_pos, 2, rx383_start
    sub rx383_off, rx383_pos, 1
    substr rx383_tgt, rx383_tgt, rx383_off
  rx383_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan386_done
    goto rxscan386_scan
  rxscan386_loop:
    ($P10) = rx383_cur."from"()
    inc $P10
    set rx383_pos, $P10
    ge rx383_pos, rx383_eos, rxscan386_done
  rxscan386_scan:
    set_addr $I10, rxscan386_loop
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  rxscan386_done:
.annotate "line", 207
  # rx subcapture "sym"
    set_addr $I10, rxcap_387_fail
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  # rx literal  "unless"
    add $I11, rx383_pos, 6
    gt $I11, rx383_eos, rx383_fail
    sub $I11, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I11, 6
    ne $S10, "unless", rx383_fail
    add rx383_pos, 6
    set_addr $I10, rxcap_387_fail
    ($I12, $I11) = rx383_cur."!mark_peek"($I10)
    rx383_cur."!cursor_pos"($I11)
    ($P10) = rx383_cur."!cursor_start"()
    $P10."!cursor_pass"(rx383_pos, "")
    rx383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_387_done
  rxcap_387_fail:
    goto rx383_fail
  rxcap_387_done:
  # rx subrule "ws" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."ws"()
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."EXPR"()
    unless $P10, rx383_fail
    rx383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx383_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."ws"()
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "statement_mod_cond:sym<unless>")
    rx383_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate "line", 4
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("88_1259177761.22934") :method
.annotate "line", 4
    new $P385, "ResizablePMCArray"
    push $P385, "unless"
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("89_1259177761.22934") :method
.annotate "line", 209
    $P391 = self."!protoregex"("statement_mod_loop")
    .return ($P391)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("90_1259177761.22934") :method
.annotate "line", 209
    $P393 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P393)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("91_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx395_cur
    .local pmc match
    .lex "$/", match
    length rx395_eos, rx395_tgt
    set rx395_off, 0
    lt rx395_pos, 2, rx395_start
    sub rx395_off, rx395_pos, 1
    substr rx395_tgt, rx395_tgt, rx395_off
  rx395_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan398_done
    goto rxscan398_scan
  rxscan398_loop:
    ($P10) = rx395_cur."from"()
    inc $P10
    set rx395_pos, $P10
    ge rx395_pos, rx395_eos, rxscan398_done
  rxscan398_scan:
    set_addr $I10, rxscan398_loop
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  rxscan398_done:
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx literal  "while"
    add $I11, rx395_pos, 5
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 5
    ne $S10, "while", rx395_fail
    add rx395_pos, 5
    set_addr $I10, rxcap_399_fail
    ($I12, $I11) = rx395_cur."!mark_peek"($I10)
    rx395_cur."!cursor_pos"($I11)
    ($P10) = rx395_cur."!cursor_start"()
    $P10."!cursor_pass"(rx395_pos, "")
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_399_done
  rxcap_399_fail:
    goto rx395_fail
  rxcap_399_done:
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
    rx395_cur."!cursor_pass"(rx395_pos, "statement_mod_loop:sym<while>")
    rx395_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate "line", 4
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("92_1259177761.22934") :method
.annotate "line", 4
    new $P397, "ResizablePMCArray"
    push $P397, "while"
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("93_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx403_cur
    .local pmc match
    .lex "$/", match
    length rx403_eos, rx403_tgt
    set rx403_off, 0
    lt rx403_pos, 2, rx403_start
    sub rx403_off, rx403_pos, 1
    substr rx403_tgt, rx403_tgt, rx403_off
  rx403_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan406_done
    goto rxscan406_scan
  rxscan406_loop:
    ($P10) = rx403_cur."from"()
    inc $P10
    set rx403_pos, $P10
    ge rx403_pos, rx403_eos, rxscan406_done
  rxscan406_scan:
    set_addr $I10, rxscan406_loop
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  rxscan406_done:
.annotate "line", 212
  # rx subcapture "sym"
    set_addr $I10, rxcap_407_fail
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  # rx literal  "until"
    add $I11, rx403_pos, 5
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 5
    ne $S10, "until", rx403_fail
    add rx403_pos, 5
    set_addr $I10, rxcap_407_fail
    ($I12, $I11) = rx403_cur."!mark_peek"($I10)
    rx403_cur."!cursor_pos"($I11)
    ($P10) = rx403_cur."!cursor_start"()
    $P10."!cursor_pass"(rx403_pos, "")
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_407_done
  rxcap_407_fail:
    goto rx403_fail
  rxcap_407_done:
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
    rx403_cur."!cursor_pass"(rx403_pos, "statement_mod_loop:sym<until>")
    rx403_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
.annotate "line", 4
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("94_1259177761.22934") :method
.annotate "line", 4
    new $P405, "ResizablePMCArray"
    push $P405, "until"
    .return ($P405)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("95_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx411_tgt
    .local int rx411_pos
    .local int rx411_off
    .local int rx411_eos
    .local int rx411_rep
    .local pmc rx411_cur
    (rx411_cur, rx411_pos, rx411_tgt) = self."!cursor_start"()
    rx411_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx411_cur
    .local pmc match
    .lex "$/", match
    length rx411_eos, rx411_tgt
    set rx411_off, 0
    lt rx411_pos, 2, rx411_start
    sub rx411_off, rx411_pos, 1
    substr rx411_tgt, rx411_tgt, rx411_off
  rx411_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan415_done
    goto rxscan415_scan
  rxscan415_loop:
    ($P10) = rx411_cur."from"()
    inc $P10
    set rx411_pos, $P10
    ge rx411_pos, rx411_eos, rxscan415_done
  rxscan415_scan:
    set_addr $I10, rxscan415_loop
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  rxscan415_done:
.annotate "line", 216
  # rx subrule "colonpair" subtype=capture negate=
    rx411_cur."!cursor_pos"(rx411_pos)
    $P10 = rx411_cur."colonpair"()
    unless $P10, rx411_fail
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx411_pos = $P10."pos"()
  # rx pass
    rx411_cur."!cursor_pass"(rx411_pos, "term:sym<colonpair>")
    rx411_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx411_pos)
    .return (rx411_cur)
  rx411_fail:
.annotate "line", 4
    (rx411_rep, rx411_pos, $I10, $P10) = rx411_cur."!mark_fail"(0)
    lt rx411_pos, -1, rx411_done
    eq rx411_pos, -1, rx411_fail
    jump $I10
  rx411_done:
    rx411_cur."!cursor_fail"()
    rx411_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx411_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("96_1259177761.22934") :method
.annotate "line", 4
    $P413 = self."!PREFIX__!subrule"("colonpair", "")
    new $P414, "ResizablePMCArray"
    push $P414, $P413
    .return ($P414)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("97_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx417_tgt
    .local int rx417_pos
    .local int rx417_off
    .local int rx417_eos
    .local int rx417_rep
    .local pmc rx417_cur
    (rx417_cur, rx417_pos, rx417_tgt) = self."!cursor_start"()
    rx417_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx417_cur
    .local pmc match
    .lex "$/", match
    length rx417_eos, rx417_tgt
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
.annotate "line", 217
  # rx subrule "variable" subtype=capture negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."variable"()
    unless $P10, rx417_fail
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx417_pos = $P10."pos"()
  # rx pass
    rx417_cur."!cursor_pass"(rx417_pos, "term:sym<variable>")
    rx417_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx417_pos)
    .return (rx417_cur)
  rx417_fail:
.annotate "line", 4
    (rx417_rep, rx417_pos, $I10, $P10) = rx417_cur."!mark_fail"(0)
    lt rx417_pos, -1, rx417_done
    eq rx417_pos, -1, rx417_fail
    jump $I10
  rx417_done:
    rx417_cur."!cursor_fail"()
    rx417_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx417_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("98_1259177761.22934") :method
.annotate "line", 4
    $P419 = self."!PREFIX__!subrule"("variable", "")
    new $P420, "ResizablePMCArray"
    push $P420, $P419
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("99_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx423_tgt
    .local int rx423_pos
    .local int rx423_off
    .local int rx423_eos
    .local int rx423_rep
    .local pmc rx423_cur
    (rx423_cur, rx423_pos, rx423_tgt) = self."!cursor_start"()
    rx423_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx423_cur
    .local pmc match
    .lex "$/", match
    length rx423_eos, rx423_tgt
    set rx423_off, 0
    lt rx423_pos, 2, rx423_start
    sub rx423_off, rx423_pos, 1
    substr rx423_tgt, rx423_tgt, rx423_off
  rx423_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan427_done
    goto rxscan427_scan
  rxscan427_loop:
    ($P10) = rx423_cur."from"()
    inc $P10
    set rx423_pos, $P10
    ge rx423_pos, rx423_eos, rxscan427_done
  rxscan427_scan:
    set_addr $I10, rxscan427_loop
    rx423_cur."!mark_push"(0, rx423_pos, $I10)
  rxscan427_done:
.annotate "line", 218
  # rx subrule "package_declarator" subtype=capture negate=
    rx423_cur."!cursor_pos"(rx423_pos)
    $P10 = rx423_cur."package_declarator"()
    unless $P10, rx423_fail
    rx423_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx423_pos = $P10."pos"()
  # rx pass
    rx423_cur."!cursor_pass"(rx423_pos, "term:sym<package_declarator>")
    rx423_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx423_pos)
    .return (rx423_cur)
  rx423_fail:
.annotate "line", 4
    (rx423_rep, rx423_pos, $I10, $P10) = rx423_cur."!mark_fail"(0)
    lt rx423_pos, -1, rx423_done
    eq rx423_pos, -1, rx423_fail
    jump $I10
  rx423_done:
    rx423_cur."!cursor_fail"()
    rx423_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx423_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("100_1259177761.22934") :method
.annotate "line", 4
    $P425 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P426, "ResizablePMCArray"
    push $P426, $P425
    .return ($P426)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("101_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx429_tgt
    .local int rx429_pos
    .local int rx429_off
    .local int rx429_eos
    .local int rx429_rep
    .local pmc rx429_cur
    (rx429_cur, rx429_pos, rx429_tgt) = self."!cursor_start"()
    rx429_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx429_cur
    .local pmc match
    .lex "$/", match
    length rx429_eos, rx429_tgt
    set rx429_off, 0
    lt rx429_pos, 2, rx429_start
    sub rx429_off, rx429_pos, 1
    substr rx429_tgt, rx429_tgt, rx429_off
  rx429_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan433_done
    goto rxscan433_scan
  rxscan433_loop:
    ($P10) = rx429_cur."from"()
    inc $P10
    set rx429_pos, $P10
    ge rx429_pos, rx429_eos, rxscan433_done
  rxscan433_scan:
    set_addr $I10, rxscan433_loop
    rx429_cur."!mark_push"(0, rx429_pos, $I10)
  rxscan433_done:
.annotate "line", 219
  # rx subrule "scope_declarator" subtype=capture negate=
    rx429_cur."!cursor_pos"(rx429_pos)
    $P10 = rx429_cur."scope_declarator"()
    unless $P10, rx429_fail
    rx429_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx429_pos = $P10."pos"()
  # rx pass
    rx429_cur."!cursor_pass"(rx429_pos, "term:sym<scope_declarator>")
    rx429_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx429_pos)
    .return (rx429_cur)
  rx429_fail:
.annotate "line", 4
    (rx429_rep, rx429_pos, $I10, $P10) = rx429_cur."!mark_fail"(0)
    lt rx429_pos, -1, rx429_done
    eq rx429_pos, -1, rx429_fail
    jump $I10
  rx429_done:
    rx429_cur."!cursor_fail"()
    rx429_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx429_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("102_1259177761.22934") :method
.annotate "line", 4
    $P431 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P432, "ResizablePMCArray"
    push $P432, $P431
    .return ($P432)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("103_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx435_tgt
    .local int rx435_pos
    .local int rx435_off
    .local int rx435_eos
    .local int rx435_rep
    .local pmc rx435_cur
    (rx435_cur, rx435_pos, rx435_tgt) = self."!cursor_start"()
    rx435_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx435_cur
    .local pmc match
    .lex "$/", match
    length rx435_eos, rx435_tgt
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
.annotate "line", 220
  # rx subrule "routine_declarator" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."routine_declarator"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx435_pos = $P10."pos"()
  # rx pass
    rx435_cur."!cursor_pass"(rx435_pos, "term:sym<routine_declarator>")
    rx435_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx435_pos)
    .return (rx435_cur)
  rx435_fail:
.annotate "line", 4
    (rx435_rep, rx435_pos, $I10, $P10) = rx435_cur."!mark_fail"(0)
    lt rx435_pos, -1, rx435_done
    eq rx435_pos, -1, rx435_fail
    jump $I10
  rx435_done:
    rx435_cur."!cursor_fail"()
    rx435_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx435_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("104_1259177761.22934") :method
.annotate "line", 4
    $P437 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P438, "ResizablePMCArray"
    push $P438, $P437
    .return ($P438)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("105_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx441_tgt
    .local int rx441_pos
    .local int rx441_off
    .local int rx441_eos
    .local int rx441_rep
    .local pmc rx441_cur
    (rx441_cur, rx441_pos, rx441_tgt) = self."!cursor_start"()
    rx441_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx441_cur
    .local pmc match
    .lex "$/", match
    length rx441_eos, rx441_tgt
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
.annotate "line", 221
  # rx subrule "regex_declarator" subtype=capture negate=
    rx441_cur."!cursor_pos"(rx441_pos)
    $P10 = rx441_cur."regex_declarator"()
    unless $P10, rx441_fail
    rx441_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx441_pos = $P10."pos"()
  # rx pass
    rx441_cur."!cursor_pass"(rx441_pos, "term:sym<regex_declarator>")
    rx441_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx441_pos)
    .return (rx441_cur)
  rx441_fail:
.annotate "line", 4
    (rx441_rep, rx441_pos, $I10, $P10) = rx441_cur."!mark_fail"(0)
    lt rx441_pos, -1, rx441_done
    eq rx441_pos, -1, rx441_fail
    jump $I10
  rx441_done:
    rx441_cur."!cursor_fail"()
    rx441_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx441_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("106_1259177761.22934") :method
.annotate "line", 4
    $P443 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P444, "ResizablePMCArray"
    push $P444, $P443
    .return ($P444)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("107_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
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
.annotate "line", 222
  # rx subrule "statement_prefix" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."statement_prefix"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx447_pos = $P10."pos"()
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "term:sym<statement_prefix>")
    rx447_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate "line", 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("108_1259177761.22934") :method
.annotate "line", 4
    $P449 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("109_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "term:sym<lambda>")
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
    ne $I10, -1, rxscan456_done
    goto rxscan456_scan
  rxscan456_loop:
    ($P10) = rx453_cur."from"()
    inc $P10
    set rx453_pos, $P10
    ge rx453_pos, rx453_eos, rxscan456_done
  rxscan456_scan:
    set_addr $I10, rxscan456_loop
    rx453_cur."!mark_push"(0, rx453_pos, $I10)
  rxscan456_done:
.annotate "line", 223
  # rx subrule "lambda" subtype=zerowidth negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."lambda"()
    unless $P10, rx453_fail
  # rx subrule "pblock" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."pblock"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx453_pos = $P10."pos"()
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "term:sym<lambda>")
    rx453_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate "line", 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("110_1259177761.22934") :method
.annotate "line", 4
    new $P455, "ResizablePMCArray"
    push $P455, ""
    .return ($P455)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("111_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    (rx458_cur, rx458_pos, rx458_tgt) = self."!cursor_start"()
    rx458_cur."!cursor_debug"("START ", "colonpair")
    rx458_cur."!cursor_caparray"("circumfix")
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
    ne $I10, -1, rxscan463_done
    goto rxscan463_scan
  rxscan463_loop:
    ($P10) = rx458_cur."from"()
    inc $P10
    set rx458_pos, $P10
    ge rx458_pos, rx458_eos, rxscan463_done
  rxscan463_scan:
    set_addr $I10, rxscan463_loop
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  rxscan463_done:
.annotate "line", 226
  # rx literal  ":"
    add $I11, rx458_pos, 1
    gt $I11, rx458_eos, rx458_fail
    sub $I11, rx458_pos, rx458_off
    substr $S10, rx458_tgt, $I11, 1
    ne $S10, ":", rx458_fail
    add rx458_pos, 1
  alt464_0:
.annotate "line", 227
    set_addr $I10, alt464_1
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
.annotate "line", 228
  # rx subcapture "not"
    set_addr $I10, rxcap_465_fail
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  # rx literal  "!"
    add $I11, rx458_pos, 1
    gt $I11, rx458_eos, rx458_fail
    sub $I11, rx458_pos, rx458_off
    substr $S10, rx458_tgt, $I11, 1
    ne $S10, "!", rx458_fail
    add rx458_pos, 1
    set_addr $I10, rxcap_465_fail
    ($I12, $I11) = rx458_cur."!mark_peek"($I10)
    rx458_cur."!cursor_pos"($I11)
    ($P10) = rx458_cur."!cursor_start"()
    $P10."!cursor_pass"(rx458_pos, "")
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_465_done
  rxcap_465_fail:
    goto rx458_fail
  rxcap_465_done:
  # rx subrule "identifier" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."identifier"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx458_pos = $P10."pos"()
    goto alt464_end
  alt464_1:
.annotate "line", 229
  # rx subrule "identifier" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."identifier"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx458_pos = $P10."pos"()
  # rx rxquantr466 ** 0..1
    set_addr $I467, rxquantr466_done
    rx458_cur."!mark_push"(0, rx458_pos, $I467)
  rxquantr466_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."circumfix"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx458_pos = $P10."pos"()
    (rx458_rep) = rx458_cur."!mark_commit"($I467)
  rxquantr466_done:
  alt464_end:
.annotate "line", 225
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "colonpair")
    rx458_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx458_pos)
    .return (rx458_cur)
  rx458_fail:
.annotate "line", 4
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    rx458_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("112_1259177761.22934") :method
.annotate "line", 4
    $P460 = self."!PREFIX__!subrule"("identifier", ":")
    $P461 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P462, "ResizablePMCArray"
    push $P462, $P460
    push $P462, $P461
    .return ($P462)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("113_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx469_tgt
    .local int rx469_pos
    .local int rx469_off
    .local int rx469_eos
    .local int rx469_rep
    .local pmc rx469_cur
    (rx469_cur, rx469_pos, rx469_tgt) = self."!cursor_start"()
    rx469_cur."!cursor_debug"("START ", "variable")
    rx469_cur."!cursor_caparray"("twigil")
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
    ne $I10, -1, rxscan474_done
    goto rxscan474_scan
  rxscan474_loop:
    ($P10) = rx469_cur."from"()
    inc $P10
    set rx469_pos, $P10
    ge rx469_pos, rx469_eos, rxscan474_done
  rxscan474_scan:
    set_addr $I10, rxscan474_loop
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
  rxscan474_done:
  alt475_0:
.annotate "line", 233
    set_addr $I10, alt475_1
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
.annotate "line", 234
  # rx subrule "sigil" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."sigil"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx469_pos = $P10."pos"()
  # rx rxquantr476 ** 0..1
    set_addr $I477, rxquantr476_done
    rx469_cur."!mark_push"(0, rx469_pos, $I477)
  rxquantr476_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."twigil"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx469_pos = $P10."pos"()
    (rx469_rep) = rx469_cur."!mark_commit"($I477)
  rxquantr476_done:
  # rx subrule "name" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."name"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx469_pos = $P10."pos"()
    goto alt475_end
  alt475_1:
    set_addr $I10, alt475_2
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
.annotate "line", 235
  # rx subrule "sigil" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."sigil"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx469_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx469_pos, rx469_eos, rx469_fail
    sub $I10, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx469_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."postcircumfix"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx469_pos = $P10."pos"()
    goto alt475_end
  alt475_2:
.annotate "line", 236
  # rx subcapture "sigil"
    set_addr $I10, rxcap_478_fail
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
  # rx literal  "$"
    add $I11, rx469_pos, 1
    gt $I11, rx469_eos, rx469_fail
    sub $I11, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I11, 1
    ne $S10, "$", rx469_fail
    add rx469_pos, 1
    set_addr $I10, rxcap_478_fail
    ($I12, $I11) = rx469_cur."!mark_peek"($I10)
    rx469_cur."!cursor_pos"($I11)
    ($P10) = rx469_cur."!cursor_start"()
    $P10."!cursor_pass"(rx469_pos, "")
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_478_done
  rxcap_478_fail:
    goto rx469_fail
  rxcap_478_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_479_fail
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx469_pos, rx469_eos, rx469_fail
    sub $I10, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx469_fail
    inc rx469_pos
    set_addr $I10, rxcap_479_fail
    ($I12, $I11) = rx469_cur."!mark_peek"($I10)
    rx469_cur."!cursor_pos"($I11)
    ($P10) = rx469_cur."!cursor_start"()
    $P10."!cursor_pass"(rx469_pos, "")
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_479_done
  rxcap_479_fail:
    goto rx469_fail
  rxcap_479_done:
  alt475_end:
.annotate "line", 233
  # rx pass
    rx469_cur."!cursor_pass"(rx469_pos, "variable")
    rx469_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx469_pos)
    .return (rx469_cur)
  rx469_fail:
.annotate "line", 4
    (rx469_rep, rx469_pos, $I10, $P10) = rx469_cur."!mark_fail"(0)
    lt rx469_pos, -1, rx469_done
    eq rx469_pos, -1, rx469_fail
    jump $I10
  rx469_done:
    rx469_cur."!cursor_fail"()
    rx469_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx469_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("114_1259177761.22934") :method
.annotate "line", 4
    $P471 = self."!PREFIX__!subrule"("sigil", "")
    $P472 = self."!PREFIX__!subrule"("sigil", "")
    new $P473, "ResizablePMCArray"
    push $P473, "$!"
    push $P473, "$_"
    push $P473, "$/"
    push $P473, $P471
    push $P473, $P472
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("115_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    (rx481_cur, rx481_pos, rx481_tgt) = self."!cursor_start"()
    rx481_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx481_cur
    .local pmc match
    .lex "$/", match
    length rx481_eos, rx481_tgt
    set rx481_off, 0
    lt rx481_pos, 2, rx481_start
    sub rx481_off, rx481_pos, 1
    substr rx481_tgt, rx481_tgt, rx481_off
  rx481_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan484_done
    goto rxscan484_scan
  rxscan484_loop:
    ($P10) = rx481_cur."from"()
    inc $P10
    set rx481_pos, $P10
    ge rx481_pos, rx481_eos, rxscan484_done
  rxscan484_scan:
    set_addr $I10, rxscan484_loop
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
  rxscan484_done:
.annotate "line", 239
  # rx enumcharlist negate=0 
    ge rx481_pos, rx481_eos, rx481_fail
    sub $I10, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx481_fail
    inc rx481_pos
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "sigil")
    rx481_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx481_pos)
    .return (rx481_cur)
  rx481_fail:
.annotate "line", 4
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    rx481_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx481_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("116_1259177761.22934") :method
.annotate "line", 4
    new $P483, "ResizablePMCArray"
    push $P483, "&"
    push $P483, "%"
    push $P483, "@"
    push $P483, "$"
    .return ($P483)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("117_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx486_tgt
    .local int rx486_pos
    .local int rx486_off
    .local int rx486_eos
    .local int rx486_rep
    .local pmc rx486_cur
    (rx486_cur, rx486_pos, rx486_tgt) = self."!cursor_start"()
    rx486_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx486_cur
    .local pmc match
    .lex "$/", match
    length rx486_eos, rx486_tgt
    set rx486_off, 0
    lt rx486_pos, 2, rx486_start
    sub rx486_off, rx486_pos, 1
    substr rx486_tgt, rx486_tgt, rx486_off
  rx486_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx486_cur."from"()
    inc $P10
    set rx486_pos, $P10
    ge rx486_pos, rx486_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx486_cur."!mark_push"(0, rx486_pos, $I10)
  rxscan489_done:
.annotate "line", 241
  # rx enumcharlist negate=0 
    ge rx486_pos, rx486_eos, rx486_fail
    sub $I10, rx486_pos, rx486_off
    substr $S10, rx486_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx486_fail
    inc rx486_pos
  # rx pass
    rx486_cur."!cursor_pass"(rx486_pos, "twigil")
    rx486_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx486_pos)
    .return (rx486_cur)
  rx486_fail:
.annotate "line", 4
    (rx486_rep, rx486_pos, $I10, $P10) = rx486_cur."!mark_fail"(0)
    lt rx486_pos, -1, rx486_done
    eq rx486_pos, -1, rx486_fail
    jump $I10
  rx486_done:
    rx486_cur."!cursor_fail"()
    rx486_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx486_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("118_1259177761.22934") :method
.annotate "line", 4
    new $P488, "ResizablePMCArray"
    push $P488, "?"
    push $P488, "!"
    push $P488, "*"
    .return ($P488)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("119_1259177761.22934") :method
.annotate "line", 243
    $P491 = self."!protoregex"("package_declarator")
    .return ($P491)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("120_1259177761.22934") :method
.annotate "line", 243
    $P493 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P493)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("121_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx495_tgt
    .local int rx495_pos
    .local int rx495_off
    .local int rx495_eos
    .local int rx495_rep
    .local pmc rx495_cur
    (rx495_cur, rx495_pos, rx495_tgt) = self."!cursor_start"()
    rx495_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx495_cur
    .local pmc match
    .lex "$/", match
    length rx495_eos, rx495_tgt
    set rx495_off, 0
    lt rx495_pos, 2, rx495_start
    sub rx495_off, rx495_pos, 1
    substr rx495_tgt, rx495_tgt, rx495_off
  rx495_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx495_cur."from"()
    inc $P10
    set rx495_pos, $P10
    ge rx495_pos, rx495_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxscan499_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_500_fail
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  # rx literal  "module"
    add $I11, rx495_pos, 6
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 6
    ne $S10, "module", rx495_fail
    add rx495_pos, 6
    set_addr $I10, rxcap_500_fail
    ($I12, $I11) = rx495_cur."!mark_peek"($I10)
    rx495_cur."!cursor_pos"($I11)
    ($P10) = rx495_cur."!cursor_start"()
    $P10."!cursor_pass"(rx495_pos, "")
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_500_done
  rxcap_500_fail:
    goto rx495_fail
  rxcap_500_done:
  # rx subrule "package_def" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."package_def"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx495_pos = $P10."pos"()
  # rx pass
    rx495_cur."!cursor_pass"(rx495_pos, "package_declarator:sym<module>")
    rx495_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx495_pos)
    .return (rx495_cur)
  rx495_fail:
.annotate "line", 4
    (rx495_rep, rx495_pos, $I10, $P10) = rx495_cur."!mark_fail"(0)
    lt rx495_pos, -1, rx495_done
    eq rx495_pos, -1, rx495_fail
    jump $I10
  rx495_done:
    rx495_cur."!cursor_fail"()
    rx495_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx495_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("122_1259177761.22934") :method
.annotate "line", 4
    $P497 = self."!PREFIX__!subrule"("package_def", "module")
    new $P498, "ResizablePMCArray"
    push $P498, $P497
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("123_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx502_tgt
    .local int rx502_pos
    .local int rx502_off
    .local int rx502_eos
    .local int rx502_rep
    .local pmc rx502_cur
    (rx502_cur, rx502_pos, rx502_tgt) = self."!cursor_start"()
    rx502_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx502_cur
    .local pmc match
    .lex "$/", match
    length rx502_eos, rx502_tgt
    set rx502_off, 0
    lt rx502_pos, 2, rx502_start
    sub rx502_off, rx502_pos, 1
    substr rx502_tgt, rx502_tgt, rx502_off
  rx502_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan507_done
    goto rxscan507_scan
  rxscan507_loop:
    ($P10) = rx502_cur."from"()
    inc $P10
    set rx502_pos, $P10
    ge rx502_pos, rx502_eos, rxscan507_done
  rxscan507_scan:
    set_addr $I10, rxscan507_loop
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  rxscan507_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_509_fail
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  alt508_0:
    set_addr $I10, alt508_1
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  # rx literal  "class"
    add $I11, rx502_pos, 5
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 5
    ne $S10, "class", rx502_fail
    add rx502_pos, 5
    goto alt508_end
  alt508_1:
  # rx literal  "grammar"
    add $I11, rx502_pos, 7
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 7
    ne $S10, "grammar", rx502_fail
    add rx502_pos, 7
  alt508_end:
    set_addr $I10, rxcap_509_fail
    ($I12, $I11) = rx502_cur."!mark_peek"($I10)
    rx502_cur."!cursor_pos"($I11)
    ($P10) = rx502_cur."!cursor_start"()
    $P10."!cursor_pass"(rx502_pos, "")
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_509_done
  rxcap_509_fail:
    goto rx502_fail
  rxcap_509_done:
  # rx subrule "package_def" subtype=capture negate=
    rx502_cur."!cursor_pos"(rx502_pos)
    $P10 = rx502_cur."package_def"()
    unless $P10, rx502_fail
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx502_pos = $P10."pos"()
  # rx pass
    rx502_cur."!cursor_pass"(rx502_pos, "package_declarator:sym<class>")
    rx502_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx502_pos)
    .return (rx502_cur)
  rx502_fail:
.annotate "line", 4
    (rx502_rep, rx502_pos, $I10, $P10) = rx502_cur."!mark_fail"(0)
    lt rx502_pos, -1, rx502_done
    eq rx502_pos, -1, rx502_fail
    jump $I10
  rx502_done:
    rx502_cur."!cursor_fail"()
    rx502_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx502_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("124_1259177761.22934") :method
.annotate "line", 4
    $P504 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P505 = self."!PREFIX__!subrule"("package_def", "class")
    new $P506, "ResizablePMCArray"
    push $P506, $P504
    push $P506, $P505
    .return ($P506)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("125_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx511_tgt
    .local int rx511_pos
    .local int rx511_off
    .local int rx511_eos
    .local int rx511_rep
    .local pmc rx511_cur
    (rx511_cur, rx511_pos, rx511_tgt) = self."!cursor_start"()
    rx511_cur."!cursor_debug"("START ", "package_def")
    rx511_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx511_cur
    .local pmc match
    .lex "$/", match
    length rx511_eos, rx511_tgt
    set rx511_off, 0
    lt rx511_pos, 2, rx511_start
    sub rx511_off, rx511_pos, 1
    substr rx511_tgt, rx511_tgt, rx511_off
  rx511_start:
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
.annotate "line", 247
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 248
  # rx subrule "name" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."name"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 249
  # rx rxquantr517 ** 0..1
    set_addr $I521, rxquantr517_done
    rx511_cur."!mark_push"(0, rx511_pos, $I521)
  rxquantr517_loop:
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx511_pos, 2
    gt $I11, rx511_eos, rx511_fail
    sub $I11, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I11, 2
    ne $S10, "is", rx511_fail
    add rx511_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."name"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
    (rx511_rep) = rx511_cur."!mark_commit"($I521)
  rxquantr517_done:
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  alt523_0:
.annotate "line", 250
    set_addr $I10, alt523_1
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
.annotate "line", 251
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx511_pos, 1
    gt $I11, rx511_eos, rx511_fail
    sub $I11, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I11, 1
    ne $S10, ";", rx511_fail
    add rx511_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."comp_unit"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
    goto alt523_end
  alt523_1:
    set_addr $I10, alt523_2
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx511_pos, rx511_eos, rx511_fail
    sub $I10, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx511_fail
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."block"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
    goto alt523_end
  alt523_2:
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."panic"("Malformed package declaration")
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  alt523_end:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 247
  # rx pass
    rx511_cur."!cursor_pass"(rx511_pos, "package_def")
    rx511_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx511_pos)
    .return (rx511_cur)
  rx511_fail:
.annotate "line", 4
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    rx511_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("126_1259177761.22934") :method
.annotate "line", 4
    new $P513, "ResizablePMCArray"
    push $P513, ""
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("127_1259177761.22934") :method
.annotate "line", 257
    $P534 = self."!protoregex"("scope_declarator")
    .return ($P534)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("128_1259177761.22934") :method
.annotate "line", 257
    $P536 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P536)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("129_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx538_tgt
    .local int rx538_pos
    .local int rx538_off
    .local int rx538_eos
    .local int rx538_rep
    .local pmc rx538_cur
    (rx538_cur, rx538_pos, rx538_tgt) = self."!cursor_start"()
    rx538_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx538_cur
    .local pmc match
    .lex "$/", match
    length rx538_eos, rx538_tgt
    set rx538_off, 0
    lt rx538_pos, 2, rx538_start
    sub rx538_off, rx538_pos, 1
    substr rx538_tgt, rx538_tgt, rx538_off
  rx538_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan542_done
    goto rxscan542_scan
  rxscan542_loop:
    ($P10) = rx538_cur."from"()
    inc $P10
    set rx538_pos, $P10
    ge rx538_pos, rx538_eos, rxscan542_done
  rxscan542_scan:
    set_addr $I10, rxscan542_loop
    rx538_cur."!mark_push"(0, rx538_pos, $I10)
  rxscan542_done:
.annotate "line", 258
  # rx subcapture "sym"
    set_addr $I10, rxcap_543_fail
    rx538_cur."!mark_push"(0, rx538_pos, $I10)
  # rx literal  "my"
    add $I11, rx538_pos, 2
    gt $I11, rx538_eos, rx538_fail
    sub $I11, rx538_pos, rx538_off
    substr $S10, rx538_tgt, $I11, 2
    ne $S10, "my", rx538_fail
    add rx538_pos, 2
    set_addr $I10, rxcap_543_fail
    ($I12, $I11) = rx538_cur."!mark_peek"($I10)
    rx538_cur."!cursor_pos"($I11)
    ($P10) = rx538_cur."!cursor_start"()
    $P10."!cursor_pass"(rx538_pos, "")
    rx538_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_543_done
  rxcap_543_fail:
    goto rx538_fail
  rxcap_543_done:
  # rx subrule "scoped" subtype=capture negate=
    rx538_cur."!cursor_pos"(rx538_pos)
    $P10 = rx538_cur."scoped"("my")
    unless $P10, rx538_fail
    rx538_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx538_pos = $P10."pos"()
  # rx pass
    rx538_cur."!cursor_pass"(rx538_pos, "scope_declarator:sym<my>")
    rx538_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx538_pos)
    .return (rx538_cur)
  rx538_fail:
.annotate "line", 4
    (rx538_rep, rx538_pos, $I10, $P10) = rx538_cur."!mark_fail"(0)
    lt rx538_pos, -1, rx538_done
    eq rx538_pos, -1, rx538_fail
    jump $I10
  rx538_done:
    rx538_cur."!cursor_fail"()
    rx538_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx538_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("130_1259177761.22934") :method
.annotate "line", 4
    $P540 = self."!PREFIX__!subrule"("scoped", "my")
    new $P541, "ResizablePMCArray"
    push $P541, $P540
    .return ($P541)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("131_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx545_tgt
    .local int rx545_pos
    .local int rx545_off
    .local int rx545_eos
    .local int rx545_rep
    .local pmc rx545_cur
    (rx545_cur, rx545_pos, rx545_tgt) = self."!cursor_start"()
    rx545_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx545_cur
    .local pmc match
    .lex "$/", match
    length rx545_eos, rx545_tgt
    set rx545_off, 0
    lt rx545_pos, 2, rx545_start
    sub rx545_off, rx545_pos, 1
    substr rx545_tgt, rx545_tgt, rx545_off
  rx545_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan549_done
    goto rxscan549_scan
  rxscan549_loop:
    ($P10) = rx545_cur."from"()
    inc $P10
    set rx545_pos, $P10
    ge rx545_pos, rx545_eos, rxscan549_done
  rxscan549_scan:
    set_addr $I10, rxscan549_loop
    rx545_cur."!mark_push"(0, rx545_pos, $I10)
  rxscan549_done:
.annotate "line", 259
  # rx subcapture "sym"
    set_addr $I10, rxcap_550_fail
    rx545_cur."!mark_push"(0, rx545_pos, $I10)
  # rx literal  "our"
    add $I11, rx545_pos, 3
    gt $I11, rx545_eos, rx545_fail
    sub $I11, rx545_pos, rx545_off
    substr $S10, rx545_tgt, $I11, 3
    ne $S10, "our", rx545_fail
    add rx545_pos, 3
    set_addr $I10, rxcap_550_fail
    ($I12, $I11) = rx545_cur."!mark_peek"($I10)
    rx545_cur."!cursor_pos"($I11)
    ($P10) = rx545_cur."!cursor_start"()
    $P10."!cursor_pass"(rx545_pos, "")
    rx545_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_550_done
  rxcap_550_fail:
    goto rx545_fail
  rxcap_550_done:
  # rx subrule "scoped" subtype=capture negate=
    rx545_cur."!cursor_pos"(rx545_pos)
    $P10 = rx545_cur."scoped"("our")
    unless $P10, rx545_fail
    rx545_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx545_pos = $P10."pos"()
  # rx pass
    rx545_cur."!cursor_pass"(rx545_pos, "scope_declarator:sym<our>")
    rx545_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx545_pos)
    .return (rx545_cur)
  rx545_fail:
.annotate "line", 4
    (rx545_rep, rx545_pos, $I10, $P10) = rx545_cur."!mark_fail"(0)
    lt rx545_pos, -1, rx545_done
    eq rx545_pos, -1, rx545_fail
    jump $I10
  rx545_done:
    rx545_cur."!cursor_fail"()
    rx545_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx545_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("132_1259177761.22934") :method
.annotate "line", 4
    $P547 = self."!PREFIX__!subrule"("scoped", "our")
    new $P548, "ResizablePMCArray"
    push $P548, $P547
    .return ($P548)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("133_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx552_tgt
    .local int rx552_pos
    .local int rx552_off
    .local int rx552_eos
    .local int rx552_rep
    .local pmc rx552_cur
    (rx552_cur, rx552_pos, rx552_tgt) = self."!cursor_start"()
    rx552_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx552_cur
    .local pmc match
    .lex "$/", match
    length rx552_eos, rx552_tgt
    set rx552_off, 0
    lt rx552_pos, 2, rx552_start
    sub rx552_off, rx552_pos, 1
    substr rx552_tgt, rx552_tgt, rx552_off
  rx552_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan556_done
    goto rxscan556_scan
  rxscan556_loop:
    ($P10) = rx552_cur."from"()
    inc $P10
    set rx552_pos, $P10
    ge rx552_pos, rx552_eos, rxscan556_done
  rxscan556_scan:
    set_addr $I10, rxscan556_loop
    rx552_cur."!mark_push"(0, rx552_pos, $I10)
  rxscan556_done:
.annotate "line", 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_557_fail
    rx552_cur."!mark_push"(0, rx552_pos, $I10)
  # rx literal  "has"
    add $I11, rx552_pos, 3
    gt $I11, rx552_eos, rx552_fail
    sub $I11, rx552_pos, rx552_off
    substr $S10, rx552_tgt, $I11, 3
    ne $S10, "has", rx552_fail
    add rx552_pos, 3
    set_addr $I10, rxcap_557_fail
    ($I12, $I11) = rx552_cur."!mark_peek"($I10)
    rx552_cur."!cursor_pos"($I11)
    ($P10) = rx552_cur."!cursor_start"()
    $P10."!cursor_pass"(rx552_pos, "")
    rx552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_557_done
  rxcap_557_fail:
    goto rx552_fail
  rxcap_557_done:
  # rx subrule "scoped" subtype=capture negate=
    rx552_cur."!cursor_pos"(rx552_pos)
    $P10 = rx552_cur."scoped"("has")
    unless $P10, rx552_fail
    rx552_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx552_pos = $P10."pos"()
  # rx pass
    rx552_cur."!cursor_pass"(rx552_pos, "scope_declarator:sym<has>")
    rx552_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx552_pos)
    .return (rx552_cur)
  rx552_fail:
.annotate "line", 4
    (rx552_rep, rx552_pos, $I10, $P10) = rx552_cur."!mark_fail"(0)
    lt rx552_pos, -1, rx552_done
    eq rx552_pos, -1, rx552_fail
    jump $I10
  rx552_done:
    rx552_cur."!cursor_fail"()
    rx552_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx552_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("134_1259177761.22934") :method
.annotate "line", 4
    $P554 = self."!PREFIX__!subrule"("scoped", "has")
    new $P555, "ResizablePMCArray"
    push $P555, $P554
    .return ($P555)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("135_1259177761.22934") :method :outer("11_1259177761.22934")
    .param pmc param_559
.annotate "line", 262
    .lex "$*SCOPE", param_559
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "scoped")
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
    ne $I10, -1, rxscan563_done
    goto rxscan563_scan
  rxscan563_loop:
    ($P10) = rx560_cur."from"()
    inc $P10
    set rx560_pos, $P10
    ge rx560_pos, rx560_eos, rxscan563_done
  rxscan563_scan:
    set_addr $I10, rxscan563_loop
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  rxscan563_done:
  alt564_0:
.annotate "line", 262
    set_addr $I10, alt564_1
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."variable_declarator"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
    goto alt564_end
  alt564_1:
.annotate "line", 264
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."routine_declarator"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx560_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."ws"()
    unless $P10, rx560_fail
    rx560_pos = $P10."pos"()
  alt564_end:
.annotate "line", 262
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "scoped")
    rx560_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("136_1259177761.22934") :method
.annotate "line", 4
    new $P562, "ResizablePMCArray"
    push $P562, ""
    push $P562, ""
    .return ($P562)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("137_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx570_tgt
    .local int rx570_pos
    .local int rx570_off
    .local int rx570_eos
    .local int rx570_rep
    .local pmc rx570_cur
    (rx570_cur, rx570_pos, rx570_tgt) = self."!cursor_start"()
    rx570_cur."!cursor_debug"("START ", "variable_declarator")
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
.annotate "line", 267
  # rx subrule "variable" subtype=capture negate=
    rx570_cur."!cursor_pos"(rx570_pos)
    $P10 = rx570_cur."variable"()
    unless $P10, rx570_fail
    rx570_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx570_pos = $P10."pos"()
  # rx pass
    rx570_cur."!cursor_pass"(rx570_pos, "variable_declarator")
    rx570_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx570_pos)
    .return (rx570_cur)
  rx570_fail:
.annotate "line", 4
    (rx570_rep, rx570_pos, $I10, $P10) = rx570_cur."!mark_fail"(0)
    lt rx570_pos, -1, rx570_done
    eq rx570_pos, -1, rx570_fail
    jump $I10
  rx570_done:
    rx570_cur."!cursor_fail"()
    rx570_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx570_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("138_1259177761.22934") :method
.annotate "line", 4
    $P572 = self."!PREFIX__!subrule"("variable", "")
    new $P573, "ResizablePMCArray"
    push $P573, $P572
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("139_1259177761.22934") :method
.annotate "line", 269
    $P576 = self."!protoregex"("routine_declarator")
    .return ($P576)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("140_1259177761.22934") :method
.annotate "line", 269
    $P578 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P578)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("141_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx580_tgt
    .local int rx580_pos
    .local int rx580_off
    .local int rx580_eos
    .local int rx580_rep
    .local pmc rx580_cur
    (rx580_cur, rx580_pos, rx580_tgt) = self."!cursor_start"()
    rx580_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
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
    ne $I10, -1, rxscan584_done
    goto rxscan584_scan
  rxscan584_loop:
    ($P10) = rx580_cur."from"()
    inc $P10
    set rx580_pos, $P10
    ge rx580_pos, rx580_eos, rxscan584_done
  rxscan584_scan:
    set_addr $I10, rxscan584_loop
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  rxscan584_done:
.annotate "line", 270
  # rx subcapture "sym"
    set_addr $I10, rxcap_585_fail
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  # rx literal  "sub"
    add $I11, rx580_pos, 3
    gt $I11, rx580_eos, rx580_fail
    sub $I11, rx580_pos, rx580_off
    substr $S10, rx580_tgt, $I11, 3
    ne $S10, "sub", rx580_fail
    add rx580_pos, 3
    set_addr $I10, rxcap_585_fail
    ($I12, $I11) = rx580_cur."!mark_peek"($I10)
    rx580_cur."!cursor_pos"($I11)
    ($P10) = rx580_cur."!cursor_start"()
    $P10."!cursor_pass"(rx580_pos, "")
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_585_done
  rxcap_585_fail:
    goto rx580_fail
  rxcap_585_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx580_cur."!cursor_pos"(rx580_pos)
    $P10 = rx580_cur."routine_def"()
    unless $P10, rx580_fail
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx580_pos = $P10."pos"()
  # rx pass
    rx580_cur."!cursor_pass"(rx580_pos, "routine_declarator:sym<sub>")
    rx580_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx580_pos)
    .return (rx580_cur)
  rx580_fail:
.annotate "line", 4
    (rx580_rep, rx580_pos, $I10, $P10) = rx580_cur."!mark_fail"(0)
    lt rx580_pos, -1, rx580_done
    eq rx580_pos, -1, rx580_fail
    jump $I10
  rx580_done:
    rx580_cur."!cursor_fail"()
    rx580_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx580_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("142_1259177761.22934") :method
.annotate "line", 4
    $P582 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P583, "ResizablePMCArray"
    push $P583, $P582
    .return ($P583)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("143_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx587_tgt
    .local int rx587_pos
    .local int rx587_off
    .local int rx587_eos
    .local int rx587_rep
    .local pmc rx587_cur
    (rx587_cur, rx587_pos, rx587_tgt) = self."!cursor_start"()
    rx587_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx587_cur
    .local pmc match
    .lex "$/", match
    length rx587_eos, rx587_tgt
    set rx587_off, 0
    lt rx587_pos, 2, rx587_start
    sub rx587_off, rx587_pos, 1
    substr rx587_tgt, rx587_tgt, rx587_off
  rx587_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan591_done
    goto rxscan591_scan
  rxscan591_loop:
    ($P10) = rx587_cur."from"()
    inc $P10
    set rx587_pos, $P10
    ge rx587_pos, rx587_eos, rxscan591_done
  rxscan591_scan:
    set_addr $I10, rxscan591_loop
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  rxscan591_done:
.annotate "line", 271
  # rx subcapture "sym"
    set_addr $I10, rxcap_592_fail
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  # rx literal  "method"
    add $I11, rx587_pos, 6
    gt $I11, rx587_eos, rx587_fail
    sub $I11, rx587_pos, rx587_off
    substr $S10, rx587_tgt, $I11, 6
    ne $S10, "method", rx587_fail
    add rx587_pos, 6
    set_addr $I10, rxcap_592_fail
    ($I12, $I11) = rx587_cur."!mark_peek"($I10)
    rx587_cur."!cursor_pos"($I11)
    ($P10) = rx587_cur."!cursor_start"()
    $P10."!cursor_pass"(rx587_pos, "")
    rx587_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_592_done
  rxcap_592_fail:
    goto rx587_fail
  rxcap_592_done:
  # rx subrule "method_def" subtype=capture negate=
    rx587_cur."!cursor_pos"(rx587_pos)
    $P10 = rx587_cur."method_def"()
    unless $P10, rx587_fail
    rx587_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx587_pos = $P10."pos"()
  # rx pass
    rx587_cur."!cursor_pass"(rx587_pos, "routine_declarator:sym<method>")
    rx587_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx587_pos)
    .return (rx587_cur)
  rx587_fail:
.annotate "line", 4
    (rx587_rep, rx587_pos, $I10, $P10) = rx587_cur."!mark_fail"(0)
    lt rx587_pos, -1, rx587_done
    eq rx587_pos, -1, rx587_fail
    jump $I10
  rx587_done:
    rx587_cur."!cursor_fail"()
    rx587_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx587_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("144_1259177761.22934") :method
.annotate "line", 4
    $P589 = self."!PREFIX__!subrule"("method_def", "method")
    new $P590, "ResizablePMCArray"
    push $P590, $P589
    .return ($P590)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("145_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx594_tgt
    .local int rx594_pos
    .local int rx594_off
    .local int rx594_eos
    .local int rx594_rep
    .local pmc rx594_cur
    (rx594_cur, rx594_pos, rx594_tgt) = self."!cursor_start"()
    rx594_cur."!cursor_debug"("START ", "routine_def")
    rx594_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx594_cur
    .local pmc match
    .lex "$/", match
    length rx594_eos, rx594_tgt
    set rx594_off, 0
    lt rx594_pos, 2, rx594_start
    sub rx594_off, rx594_pos, 1
    substr rx594_tgt, rx594_tgt, rx594_off
  rx594_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan597_done
    goto rxscan597_scan
  rxscan597_loop:
    ($P10) = rx594_cur."from"()
    inc $P10
    set rx594_pos, $P10
    ge rx594_pos, rx594_eos, rxscan597_done
  rxscan597_scan:
    set_addr $I10, rxscan597_loop
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
  rxscan597_done:
.annotate "line", 273
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
.annotate "line", 274
  # rx rxquantr599 ** 0..1
    set_addr $I600, rxquantr599_done
    rx594_cur."!mark_push"(0, rx594_pos, $I600)
  rxquantr599_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."deflongname"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx594_pos = $P10."pos"()
    (rx594_rep) = rx594_cur."!mark_commit"($I600)
  rxquantr599_done:
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
.annotate "line", 275
  # rx subrule "newpad" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."newpad"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  alt603_0:
.annotate "line", 276
    set_addr $I10, alt603_1
    rx594_cur."!mark_push"(0, rx594_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx594_pos, 1
    gt $I11, rx594_eos, rx594_fail
    sub $I11, rx594_pos, rx594_off
    substr $S10, rx594_tgt, $I11, 1
    ne $S10, "(", rx594_fail
    add rx594_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."signature"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx594_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx594_pos, 1
    gt $I11, rx594_eos, rx594_fail
    sub $I11, rx594_pos, rx594_off
    substr $S10, rx594_tgt, $I11, 1
    ne $S10, ")", rx594_fail
    add rx594_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
    goto alt603_end
  alt603_1:
.annotate "line", 277
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
  alt603_end:
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
.annotate "line", 278
  # rx subrule "blockoid" subtype=capture negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."blockoid"()
    unless $P10, rx594_fail
    rx594_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx594_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx594_cur."!cursor_pos"(rx594_pos)
    $P10 = rx594_cur."ws"()
    unless $P10, rx594_fail
    rx594_pos = $P10."pos"()
.annotate "line", 273
  # rx pass
    rx594_cur."!cursor_pass"(rx594_pos, "routine_def")
    rx594_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx594_pos)
    .return (rx594_cur)
  rx594_fail:
.annotate "line", 4
    (rx594_rep, rx594_pos, $I10, $P10) = rx594_cur."!mark_fail"(0)
    lt rx594_pos, -1, rx594_done
    eq rx594_pos, -1, rx594_fail
    jump $I10
  rx594_done:
    rx594_cur."!cursor_fail"()
    rx594_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx594_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("146_1259177761.22934") :method
.annotate "line", 4
    new $P596, "ResizablePMCArray"
    push $P596, ""
    .return ($P596)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("147_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx613_tgt
    .local int rx613_pos
    .local int rx613_off
    .local int rx613_eos
    .local int rx613_rep
    .local pmc rx613_cur
    (rx613_cur, rx613_pos, rx613_tgt) = self."!cursor_start"()
    rx613_cur."!cursor_debug"("START ", "method_def")
    rx613_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx613_cur
    .local pmc match
    .lex "$/", match
    length rx613_eos, rx613_tgt
    set rx613_off, 0
    lt rx613_pos, 2, rx613_start
    sub rx613_off, rx613_pos, 1
    substr rx613_tgt, rx613_tgt, rx613_off
  rx613_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan616_done
    goto rxscan616_scan
  rxscan616_loop:
    ($P10) = rx613_cur."from"()
    inc $P10
    set rx613_pos, $P10
    ge rx613_pos, rx613_eos, rxscan616_done
  rxscan616_scan:
    set_addr $I10, rxscan616_loop
    rx613_cur."!mark_push"(0, rx613_pos, $I10)
  rxscan616_done:
.annotate "line", 281
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
.annotate "line", 282
  # rx rxquantr618 ** 0..1
    set_addr $I619, rxquantr618_done
    rx613_cur."!mark_push"(0, rx613_pos, $I619)
  rxquantr618_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."deflongname"()
    unless $P10, rx613_fail
    rx613_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx613_pos = $P10."pos"()
    (rx613_rep) = rx613_cur."!mark_commit"($I619)
  rxquantr618_done:
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "newpad" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."newpad"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  alt622_0:
.annotate "line", 284
    set_addr $I10, alt622_1
    rx613_cur."!mark_push"(0, rx613_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx613_pos, 1
    gt $I11, rx613_eos, rx613_fail
    sub $I11, rx613_pos, rx613_off
    substr $S10, rx613_tgt, $I11, 1
    ne $S10, "(", rx613_fail
    add rx613_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."signature"()
    unless $P10, rx613_fail
    rx613_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx613_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx613_pos, 1
    gt $I11, rx613_eos, rx613_fail
    sub $I11, rx613_pos, rx613_off
    substr $S10, rx613_tgt, $I11, 1
    ne $S10, ")", rx613_fail
    add rx613_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
    goto alt622_end
  alt622_1:
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
  alt622_end:
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
.annotate "line", 286
  # rx subrule "blockoid" subtype=capture negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."blockoid"()
    unless $P10, rx613_fail
    rx613_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx613_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx613_cur."!cursor_pos"(rx613_pos)
    $P10 = rx613_cur."ws"()
    unless $P10, rx613_fail
    rx613_pos = $P10."pos"()
.annotate "line", 281
  # rx pass
    rx613_cur."!cursor_pass"(rx613_pos, "method_def")
    rx613_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx613_pos)
    .return (rx613_cur)
  rx613_fail:
.annotate "line", 4
    (rx613_rep, rx613_pos, $I10, $P10) = rx613_cur."!mark_fail"(0)
    lt rx613_pos, -1, rx613_done
    eq rx613_pos, -1, rx613_fail
    jump $I10
  rx613_done:
    rx613_cur."!cursor_fail"()
    rx613_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx613_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("148_1259177761.22934") :method
.annotate "line", 4
    new $P615, "ResizablePMCArray"
    push $P615, ""
    .return ($P615)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("149_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx632_tgt
    .local int rx632_pos
    .local int rx632_off
    .local int rx632_eos
    .local int rx632_rep
    .local pmc rx632_cur
    (rx632_cur, rx632_pos, rx632_tgt) = self."!cursor_start"()
    rx632_cur."!cursor_debug"("START ", "signature")
    rx632_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx632_cur
    .local pmc match
    .lex "$/", match
    length rx632_eos, rx632_tgt
    set rx632_off, 0
    lt rx632_pos, 2, rx632_start
    sub rx632_off, rx632_pos, 1
    substr rx632_tgt, rx632_tgt, rx632_off
  rx632_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan635_done
    goto rxscan635_scan
  rxscan635_loop:
    ($P10) = rx632_cur."from"()
    inc $P10
    set rx632_pos, $P10
    ge rx632_pos, rx632_eos, rxscan635_done
  rxscan635_scan:
    set_addr $I10, rxscan635_loop
    rx632_cur."!mark_push"(0, rx632_pos, $I10)
  rxscan635_done:
.annotate "line", 289
  # rx rxquantr636 ** 0..1
    set_addr $I639, rxquantr636_done
    rx632_cur."!mark_push"(0, rx632_pos, $I639)
  rxquantr636_loop:
  # rx rxquantr637 ** 1..*
    set_addr $I638, rxquantr637_done
    rx632_cur."!mark_push"(0, -1, $I638)
  rxquantr637_loop:
  # rx subrule "ws" subtype=method negate=
    rx632_cur."!cursor_pos"(rx632_pos)
    $P10 = rx632_cur."ws"()
    unless $P10, rx632_fail
    rx632_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx632_cur."!cursor_pos"(rx632_pos)
    $P10 = rx632_cur."parameter"()
    unless $P10, rx632_fail
    rx632_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx632_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx632_cur."!cursor_pos"(rx632_pos)
    $P10 = rx632_cur."ws"()
    unless $P10, rx632_fail
    rx632_pos = $P10."pos"()
    (rx632_rep) = rx632_cur."!mark_commit"($I638)
    rx632_cur."!mark_push"(rx632_rep, rx632_pos, $I638)
  # rx literal  ","
    add $I11, rx632_pos, 1
    gt $I11, rx632_eos, rx632_fail
    sub $I11, rx632_pos, rx632_off
    substr $S10, rx632_tgt, $I11, 1
    ne $S10, ",", rx632_fail
    add rx632_pos, 1
    goto rxquantr637_loop
  rxquantr637_done:
    (rx632_rep) = rx632_cur."!mark_commit"($I639)
  rxquantr636_done:
  # rx pass
    rx632_cur."!cursor_pass"(rx632_pos, "signature")
    rx632_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx632_pos)
    .return (rx632_cur)
  rx632_fail:
.annotate "line", 4
    (rx632_rep, rx632_pos, $I10, $P10) = rx632_cur."!mark_fail"(0)
    lt rx632_pos, -1, rx632_done
    eq rx632_pos, -1, rx632_fail
    jump $I10
  rx632_done:
    rx632_cur."!cursor_fail"()
    rx632_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx632_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("150_1259177761.22934") :method
.annotate "line", 4
    new $P634, "ResizablePMCArray"
    push $P634, ""
    .return ($P634)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("151_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx641_tgt
    .local int rx641_pos
    .local int rx641_off
    .local int rx641_eos
    .local int rx641_rep
    .local pmc rx641_cur
    (rx641_cur, rx641_pos, rx641_tgt) = self."!cursor_start"()
    rx641_cur."!cursor_debug"("START ", "parameter")
    rx641_cur."!cursor_caparray"("default_value")
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
    ne $I10, -1, rxscan647_done
    goto rxscan647_scan
  rxscan647_loop:
    ($P10) = rx641_cur."from"()
    inc $P10
    set rx641_pos, $P10
    ge rx641_pos, rx641_eos, rxscan647_done
  rxscan647_scan:
    set_addr $I10, rxscan647_loop
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  rxscan647_done:
  alt648_0:
.annotate "line", 292
    set_addr $I10, alt648_1
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
.annotate "line", 293
  # rx subcapture "quant"
    set_addr $I10, rxcap_649_fail
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  # rx literal  "*"
    add $I11, rx641_pos, 1
    gt $I11, rx641_eos, rx641_fail
    sub $I11, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I11, 1
    ne $S10, "*", rx641_fail
    add rx641_pos, 1
    set_addr $I10, rxcap_649_fail
    ($I12, $I11) = rx641_cur."!mark_peek"($I10)
    rx641_cur."!cursor_pos"($I11)
    ($P10) = rx641_cur."!cursor_start"()
    $P10."!cursor_pass"(rx641_pos, "")
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_649_done
  rxcap_649_fail:
    goto rx641_fail
  rxcap_649_done:
  # rx subrule "param_var" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."param_var"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx641_pos = $P10."pos"()
    goto alt648_end
  alt648_1:
  alt650_0:
.annotate "line", 294
    set_addr $I10, alt650_1
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."param_var"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx641_pos = $P10."pos"()
    goto alt650_end
  alt650_1:
  # rx subrule "named_param" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."named_param"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx641_pos = $P10."pos"()
  alt650_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_652_fail
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  alt651_0:
    set_addr $I10, alt651_1
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  # rx literal  "?"
    add $I11, rx641_pos, 1
    gt $I11, rx641_eos, rx641_fail
    sub $I11, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I11, 1
    ne $S10, "?", rx641_fail
    add rx641_pos, 1
    goto alt651_end
  alt651_1:
    set_addr $I10, alt651_2
    rx641_cur."!mark_push"(0, rx641_pos, $I10)
  # rx literal  "!"
    add $I11, rx641_pos, 1
    gt $I11, rx641_eos, rx641_fail
    sub $I11, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I11, 1
    ne $S10, "!", rx641_fail
    add rx641_pos, 1
    goto alt651_end
  alt651_2:
  alt651_end:
    set_addr $I10, rxcap_652_fail
    ($I12, $I11) = rx641_cur."!mark_peek"($I10)
    rx641_cur."!cursor_pos"($I11)
    ($P10) = rx641_cur."!cursor_start"()
    $P10."!cursor_pass"(rx641_pos, "")
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_652_done
  rxcap_652_fail:
    goto rx641_fail
  rxcap_652_done:
  alt648_end:
.annotate "line", 296
  # rx rxquantr653 ** 0..1
    set_addr $I654, rxquantr653_done
    rx641_cur."!mark_push"(0, rx641_pos, $I654)
  rxquantr653_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."default_value"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx641_pos = $P10."pos"()
    (rx641_rep) = rx641_cur."!mark_commit"($I654)
  rxquantr653_done:
.annotate "line", 291
  # rx pass
    rx641_cur."!cursor_pass"(rx641_pos, "parameter")
    rx641_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx641_pos)
    .return (rx641_cur)
  rx641_fail:
.annotate "line", 4
    (rx641_rep, rx641_pos, $I10, $P10) = rx641_cur."!mark_fail"(0)
    lt rx641_pos, -1, rx641_done
    eq rx641_pos, -1, rx641_fail
    jump $I10
  rx641_done:
    rx641_cur."!cursor_fail"()
    rx641_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx641_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("152_1259177761.22934") :method
.annotate "line", 4
    $P643 = self."!PREFIX__!subrule"("named_param", "")
    $P644 = self."!PREFIX__!subrule"("param_var", "")
    $P645 = self."!PREFIX__!subrule"("param_var", "*")
    new $P646, "ResizablePMCArray"
    push $P646, $P643
    push $P646, $P644
    push $P646, $P645
    .return ($P646)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("153_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx656_tgt
    .local int rx656_pos
    .local int rx656_off
    .local int rx656_eos
    .local int rx656_rep
    .local pmc rx656_cur
    (rx656_cur, rx656_pos, rx656_tgt) = self."!cursor_start"()
    rx656_cur."!cursor_debug"("START ", "param_var")
    rx656_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx656_cur
    .local pmc match
    .lex "$/", match
    length rx656_eos, rx656_tgt
    set rx656_off, 0
    lt rx656_pos, 2, rx656_start
    sub rx656_off, rx656_pos, 1
    substr rx656_tgt, rx656_tgt, rx656_off
  rx656_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan660_done
    goto rxscan660_scan
  rxscan660_loop:
    ($P10) = rx656_cur."from"()
    inc $P10
    set rx656_pos, $P10
    ge rx656_pos, rx656_eos, rxscan660_done
  rxscan660_scan:
    set_addr $I10, rxscan660_loop
    rx656_cur."!mark_push"(0, rx656_pos, $I10)
  rxscan660_done:
.annotate "line", 300
  # rx subrule "sigil" subtype=capture negate=
    rx656_cur."!cursor_pos"(rx656_pos)
    $P10 = rx656_cur."sigil"()
    unless $P10, rx656_fail
    rx656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx656_pos = $P10."pos"()
  # rx rxquantr661 ** 0..1
    set_addr $I662, rxquantr661_done
    rx656_cur."!mark_push"(0, rx656_pos, $I662)
  rxquantr661_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx656_cur."!cursor_pos"(rx656_pos)
    $P10 = rx656_cur."twigil"()
    unless $P10, rx656_fail
    rx656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx656_pos = $P10."pos"()
    (rx656_rep) = rx656_cur."!mark_commit"($I662)
  rxquantr661_done:
  alt663_0:
.annotate "line", 301
    set_addr $I10, alt663_1
    rx656_cur."!mark_push"(0, rx656_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx656_cur."!cursor_pos"(rx656_pos)
    $P10 = rx656_cur."ident"()
    unless $P10, rx656_fail
    rx656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx656_pos = $P10."pos"()
    goto alt663_end
  alt663_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_664_fail
    rx656_cur."!mark_push"(0, rx656_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx656_pos, rx656_eos, rx656_fail
    sub $I10, rx656_pos, rx656_off
    substr $S10, rx656_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx656_fail
    inc rx656_pos
    set_addr $I10, rxcap_664_fail
    ($I12, $I11) = rx656_cur."!mark_peek"($I10)
    rx656_cur."!cursor_pos"($I11)
    ($P10) = rx656_cur."!cursor_start"()
    $P10."!cursor_pass"(rx656_pos, "")
    rx656_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_664_done
  rxcap_664_fail:
    goto rx656_fail
  rxcap_664_done:
  alt663_end:
.annotate "line", 299
  # rx pass
    rx656_cur."!cursor_pass"(rx656_pos, "param_var")
    rx656_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx656_pos)
    .return (rx656_cur)
  rx656_fail:
.annotate "line", 4
    (rx656_rep, rx656_pos, $I10, $P10) = rx656_cur."!mark_fail"(0)
    lt rx656_pos, -1, rx656_done
    eq rx656_pos, -1, rx656_fail
    jump $I10
  rx656_done:
    rx656_cur."!cursor_fail"()
    rx656_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx656_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("154_1259177761.22934") :method
.annotate "line", 4
    $P658 = self."!PREFIX__!subrule"("sigil", "")
    new $P659, "ResizablePMCArray"
    push $P659, $P658
    .return ($P659)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("155_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx666_tgt
    .local int rx666_pos
    .local int rx666_off
    .local int rx666_eos
    .local int rx666_rep
    .local pmc rx666_cur
    (rx666_cur, rx666_pos, rx666_tgt) = self."!cursor_start"()
    rx666_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx666_cur
    .local pmc match
    .lex "$/", match
    length rx666_eos, rx666_tgt
    set rx666_off, 0
    lt rx666_pos, 2, rx666_start
    sub rx666_off, rx666_pos, 1
    substr rx666_tgt, rx666_tgt, rx666_off
  rx666_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan670_done
    goto rxscan670_scan
  rxscan670_loop:
    ($P10) = rx666_cur."from"()
    inc $P10
    set rx666_pos, $P10
    ge rx666_pos, rx666_eos, rxscan670_done
  rxscan670_scan:
    set_addr $I10, rxscan670_loop
    rx666_cur."!mark_push"(0, rx666_pos, $I10)
  rxscan670_done:
.annotate "line", 305
  # rx literal  ":"
    add $I11, rx666_pos, 1
    gt $I11, rx666_eos, rx666_fail
    sub $I11, rx666_pos, rx666_off
    substr $S10, rx666_tgt, $I11, 1
    ne $S10, ":", rx666_fail
    add rx666_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx666_cur."!cursor_pos"(rx666_pos)
    $P10 = rx666_cur."param_var"()
    unless $P10, rx666_fail
    rx666_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx666_pos = $P10."pos"()
.annotate "line", 304
  # rx pass
    rx666_cur."!cursor_pass"(rx666_pos, "named_param")
    rx666_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx666_pos)
    .return (rx666_cur)
  rx666_fail:
.annotate "line", 4
    (rx666_rep, rx666_pos, $I10, $P10) = rx666_cur."!mark_fail"(0)
    lt rx666_pos, -1, rx666_done
    eq rx666_pos, -1, rx666_fail
    jump $I10
  rx666_done:
    rx666_cur."!cursor_fail"()
    rx666_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx666_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("156_1259177761.22934") :method
.annotate "line", 4
    $P668 = self."!PREFIX__!subrule"("param_var", ":")
    new $P669, "ResizablePMCArray"
    push $P669, $P668
    .return ($P669)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("157_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx672_tgt
    .local int rx672_pos
    .local int rx672_off
    .local int rx672_eos
    .local int rx672_rep
    .local pmc rx672_cur
    (rx672_cur, rx672_pos, rx672_tgt) = self."!cursor_start"()
    rx672_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx672_cur
    .local pmc match
    .lex "$/", match
    length rx672_eos, rx672_tgt
    set rx672_off, 0
    lt rx672_pos, 2, rx672_start
    sub rx672_off, rx672_pos, 1
    substr rx672_tgt, rx672_tgt, rx672_off
  rx672_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan675_done
    goto rxscan675_scan
  rxscan675_loop:
    ($P10) = rx672_cur."from"()
    inc $P10
    set rx672_pos, $P10
    ge rx672_pos, rx672_eos, rxscan675_done
  rxscan675_scan:
    set_addr $I10, rxscan675_loop
    rx672_cur."!mark_push"(0, rx672_pos, $I10)
  rxscan675_done:
.annotate "line", 308
  # rx subrule "ws" subtype=method negate=
    rx672_cur."!cursor_pos"(rx672_pos)
    $P10 = rx672_cur."ws"()
    unless $P10, rx672_fail
    rx672_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx672_pos, 1
    gt $I11, rx672_eos, rx672_fail
    sub $I11, rx672_pos, rx672_off
    substr $S10, rx672_tgt, $I11, 1
    ne $S10, "=", rx672_fail
    add rx672_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx672_cur."!cursor_pos"(rx672_pos)
    $P10 = rx672_cur."ws"()
    unless $P10, rx672_fail
    rx672_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx672_cur."!cursor_pos"(rx672_pos)
    $P10 = rx672_cur."EXPR"("i=")
    unless $P10, rx672_fail
    rx672_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx672_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx672_cur."!cursor_pos"(rx672_pos)
    $P10 = rx672_cur."ws"()
    unless $P10, rx672_fail
    rx672_pos = $P10."pos"()
  # rx pass
    rx672_cur."!cursor_pass"(rx672_pos, "default_value")
    rx672_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx672_pos)
    .return (rx672_cur)
  rx672_fail:
.annotate "line", 4
    (rx672_rep, rx672_pos, $I10, $P10) = rx672_cur."!mark_fail"(0)
    lt rx672_pos, -1, rx672_done
    eq rx672_pos, -1, rx672_fail
    jump $I10
  rx672_done:
    rx672_cur."!cursor_fail"()
    rx672_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx672_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("158_1259177761.22934") :method
.annotate "line", 4
    new $P674, "ResizablePMCArray"
    push $P674, ""
    .return ($P674)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("159_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx680_tgt
    .local int rx680_pos
    .local int rx680_off
    .local int rx680_eos
    .local int rx680_rep
    .local pmc rx680_cur
    (rx680_cur, rx680_pos, rx680_tgt) = self."!cursor_start"()
    rx680_cur."!cursor_debug"("START ", "regex_declarator")
    rx680_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx680_cur
    .local pmc match
    .lex "$/", match
    length rx680_eos, rx680_tgt
    set rx680_off, 0
    lt rx680_pos, 2, rx680_start
    sub rx680_off, rx680_pos, 1
    substr rx680_tgt, rx680_tgt, rx680_off
  rx680_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan683_done
    goto rxscan683_scan
  rxscan683_loop:
    ($P10) = rx680_cur."from"()
    inc $P10
    set rx680_pos, $P10
    ge rx680_pos, rx680_eos, rxscan683_done
  rxscan683_scan:
    set_addr $I10, rxscan683_loop
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  rxscan683_done:
.annotate "line", 310
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  alt685_0:
.annotate "line", 311
    set_addr $I10, alt685_1
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
.annotate "line", 312
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_687_fail
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  # rx literal  "proto"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "proto", rx680_fail
    add rx680_pos, 5
    set_addr $I10, rxcap_687_fail
    ($I12, $I11) = rx680_cur."!mark_peek"($I10)
    rx680_cur."!cursor_pos"($I11)
    ($P10) = rx680_cur."!cursor_start"()
    $P10."!cursor_pass"(rx680_pos, "")
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_687_done
  rxcap_687_fail:
    goto rx680_fail
  rxcap_687_done:
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  alt689_0:
    set_addr $I10, alt689_1
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  # rx literal  "regex"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "regex", rx680_fail
    add rx680_pos, 5
    goto alt689_end
  alt689_1:
    set_addr $I10, alt689_2
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  # rx literal  "token"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "token", rx680_fail
    add rx680_pos, 5
    goto alt689_end
  alt689_2:
  # rx literal  "rule"
    add $I11, rx680_pos, 4
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 4
    ne $S10, "rule", rx680_fail
    add rx680_pos, 4
  alt689_end:
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 313
  # rx subrule "deflongname" subtype=capture negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."deflongname"()
    unless $P10, rx680_fail
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx680_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 314
  # rx literal  "{"
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, "{", rx680_fail
    add rx680_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "<...>", rx680_fail
    add rx680_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, "}", rx680_fail
    add rx680_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ENDSTMT"()
    unless $P10, rx680_fail
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 312
    goto alt685_end
  alt685_1:
.annotate "line", 315
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_697_fail
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  alt696_0:
    set_addr $I10, alt696_1
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  # rx literal  "regex"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "regex", rx680_fail
    add rx680_pos, 5
    goto alt696_end
  alt696_1:
    set_addr $I10, alt696_2
    rx680_cur."!mark_push"(0, rx680_pos, $I10)
  # rx literal  "token"
    add $I11, rx680_pos, 5
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 5
    ne $S10, "token", rx680_fail
    add rx680_pos, 5
    goto alt696_end
  alt696_2:
  # rx literal  "rule"
    add $I11, rx680_pos, 4
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 4
    ne $S10, "rule", rx680_fail
    add rx680_pos, 4
  alt696_end:
    set_addr $I10, rxcap_697_fail
    ($I12, $I11) = rx680_cur."!mark_peek"($I10)
    rx680_cur."!cursor_pos"($I11)
    ($P10) = rx680_cur."!cursor_start"()
    $P10."!cursor_pass"(rx680_pos, "")
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_697_done
  rxcap_697_fail:
    goto rx680_fail
  rxcap_697_done:
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 316
  # rx subrule "deflongname" subtype=capture negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."deflongname"()
    unless $P10, rx680_fail
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx680_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 317
  # rx subrule "newpad" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."newpad"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 318
  # rx rxquantr701 ** 0..1
    set_addr $I706, rxquantr701_done
    rx680_cur."!mark_push"(0, rx680_pos, $I706)
  rxquantr701_loop:
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, "(", rx680_fail
    add rx680_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."signature"()
    unless $P10, rx680_fail
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx680_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, ")", rx680_fail
    add rx680_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
    (rx680_rep) = rx680_cur."!mark_commit"($I706)
  rxquantr701_done:
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 319
  # rx reduce name="regex_declarator" key="open"
    rx680_cur."!cursor_pos"(rx680_pos)
    rx680_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 320
  # rx literal  "{"
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, "{", rx680_fail
    add rx680_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."LANG"("Regex", "nibbler")
    unless $P10, rx680_fail
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx680_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx680_pos, 1
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 1
    ne $S10, "}", rx680_fail
    add rx680_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ENDSTMT"()
    unless $P10, rx680_fail
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  alt685_end:
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx680_cur."!cursor_pass"(rx680_pos, "regex_declarator")
    rx680_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx680_pos)
    .return (rx680_cur)
  rx680_fail:
.annotate "line", 4
    (rx680_rep, rx680_pos, $I10, $P10) = rx680_cur."!mark_fail"(0)
    lt rx680_pos, -1, rx680_done
    eq rx680_pos, -1, rx680_fail
    jump $I10
  rx680_done:
    rx680_cur."!cursor_fail"()
    rx680_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx680_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("160_1259177761.22934") :method
.annotate "line", 4
    new $P682, "ResizablePMCArray"
    push $P682, ""
    .return ($P682)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("161_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx712_tgt
    .local int rx712_pos
    .local int rx712_off
    .local int rx712_eos
    .local int rx712_rep
    .local pmc rx712_cur
    (rx712_cur, rx712_pos, rx712_tgt) = self."!cursor_start"()
    rx712_cur."!cursor_debug"("START ", "dotty")
    rx712_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx712_cur
    .local pmc match
    .lex "$/", match
    length rx712_eos, rx712_tgt
    set rx712_off, 0
    lt rx712_pos, 2, rx712_start
    sub rx712_off, rx712_pos, 1
    substr rx712_tgt, rx712_tgt, rx712_off
  rx712_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan716_done
    goto rxscan716_scan
  rxscan716_loop:
    ($P10) = rx712_cur."from"()
    inc $P10
    set rx712_pos, $P10
    ge rx712_pos, rx712_eos, rxscan716_done
  rxscan716_scan:
    set_addr $I10, rxscan716_loop
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  rxscan716_done:
.annotate "line", 325
  # rx literal  "."
    add $I11, rx712_pos, 1
    gt $I11, rx712_eos, rx712_fail
    sub $I11, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I11, 1
    ne $S10, ".", rx712_fail
    add rx712_pos, 1
  alt717_0:
.annotate "line", 326
    set_addr $I10, alt717_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."identifier"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx712_pos = $P10."pos"()
    goto alt717_end
  alt717_1:
.annotate "line", 327
  # rx enumcharlist negate=0 zerowidth
    ge rx712_pos, rx712_eos, rx712_fail
    sub $I10, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx712_fail
  # rx subrule "quote" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."quote"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx712_pos = $P10."pos"()
  alt718_0:
.annotate "line", 328
    set_addr $I10, alt718_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx712_pos, rx712_eos, rx712_fail
    sub $I10, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx712_fail
    goto alt718_end
  alt718_1:
  # rx subrule "panic" subtype=method negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx712_fail
    rx712_pos = $P10."pos"()
  alt718_end:
  alt717_end:
.annotate "line", 334
  # rx rxquantr719 ** 0..1
    set_addr $I721, rxquantr719_done
    rx712_cur."!mark_push"(0, rx712_pos, $I721)
  rxquantr719_loop:
  alt720_0:
.annotate "line", 331
    set_addr $I10, alt720_1
    rx712_cur."!mark_push"(0, rx712_pos, $I10)
.annotate "line", 332
  # rx enumcharlist negate=0 zerowidth
    ge rx712_pos, rx712_eos, rx712_fail
    sub $I10, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx712_fail
  # rx subrule "args" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."args"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx712_pos = $P10."pos"()
    goto alt720_end
  alt720_1:
.annotate "line", 333
  # rx literal  ":"
    add $I11, rx712_pos, 1
    gt $I11, rx712_eos, rx712_fail
    sub $I11, rx712_pos, rx712_off
    substr $S10, rx712_tgt, $I11, 1
    ne $S10, ":", rx712_fail
    add rx712_pos, 1
  # rx charclass s
    ge rx712_pos, rx712_eos, rx712_fail
    sub $I10, rx712_pos, rx712_off
    is_cclass $I11, 32, rx712_tgt, $I10
    unless $I11, rx712_fail
    inc rx712_pos
  # rx subrule "arglist" subtype=capture negate=
    rx712_cur."!cursor_pos"(rx712_pos)
    $P10 = rx712_cur."arglist"()
    unless $P10, rx712_fail
    rx712_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx712_pos = $P10."pos"()
  alt720_end:
.annotate "line", 334
    (rx712_rep) = rx712_cur."!mark_commit"($I721)
  rxquantr719_done:
.annotate "line", 324
  # rx pass
    rx712_cur."!cursor_pass"(rx712_pos, "dotty")
    rx712_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx712_pos)
    .return (rx712_cur)
  rx712_fail:
.annotate "line", 4
    (rx712_rep, rx712_pos, $I10, $P10) = rx712_cur."!mark_fail"(0)
    lt rx712_pos, -1, rx712_done
    eq rx712_pos, -1, rx712_fail
    jump $I10
  rx712_done:
    rx712_cur."!cursor_fail"()
    rx712_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx712_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("162_1259177761.22934") :method
.annotate "line", 4
    $P714 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P715, "ResizablePMCArray"
    push $P715, "'"
    push $P715, "\""
    push $P715, $P714
    .return ($P715)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("163_1259177761.22934") :method
.annotate "line", 338
    $P723 = self."!protoregex"("term")
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("164_1259177761.22934") :method
.annotate "line", 338
    $P725 = self."!PREFIX__!protoregex"("term")
    .return ($P725)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("165_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx727_tgt
    .local int rx727_pos
    .local int rx727_off
    .local int rx727_eos
    .local int rx727_rep
    .local pmc rx727_cur
    (rx727_cur, rx727_pos, rx727_tgt) = self."!cursor_start"()
    rx727_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx727_cur
    .local pmc match
    .lex "$/", match
    length rx727_eos, rx727_tgt
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
.annotate "line", 340
  # rx subcapture "sym"
    set_addr $I10, rxcap_731_fail
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx literal  "self"
    add $I11, rx727_pos, 4
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 4
    ne $S10, "self", rx727_fail
    add rx727_pos, 4
    set_addr $I10, rxcap_731_fail
    ($I12, $I11) = rx727_cur."!mark_peek"($I10)
    rx727_cur."!cursor_pos"($I11)
    ($P10) = rx727_cur."!cursor_start"()
    $P10."!cursor_pass"(rx727_pos, "")
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_731_done
  rxcap_731_fail:
    goto rx727_fail
  rxcap_731_done:
  # rxanchor rwb
    le rx727_pos, 0, rx727_fail
    sub $I10, rx727_pos, rx727_off
    is_cclass $I11, 8192, rx727_tgt, $I10
    if $I11, rx727_fail
    dec $I10
    is_cclass $I11, 8192, rx727_tgt, $I10
    unless $I11, rx727_fail
  # rx pass
    rx727_cur."!cursor_pass"(rx727_pos, "term:sym<self>")
    rx727_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx727_pos)
    .return (rx727_cur)
  rx727_fail:
.annotate "line", 4
    (rx727_rep, rx727_pos, $I10, $P10) = rx727_cur."!mark_fail"(0)
    lt rx727_pos, -1, rx727_done
    eq rx727_pos, -1, rx727_fail
    jump $I10
  rx727_done:
    rx727_cur."!cursor_fail"()
    rx727_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx727_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("166_1259177761.22934") :method
.annotate "line", 4
    new $P729, "ResizablePMCArray"
    push $P729, "self"
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("167_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx733_tgt
    .local int rx733_pos
    .local int rx733_off
    .local int rx733_eos
    .local int rx733_rep
    .local pmc rx733_cur
    (rx733_cur, rx733_pos, rx733_tgt) = self."!cursor_start"()
    rx733_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx733_cur
    .local pmc match
    .lex "$/", match
    length rx733_eos, rx733_tgt
    set rx733_off, 0
    lt rx733_pos, 2, rx733_start
    sub rx733_off, rx733_pos, 1
    substr rx733_tgt, rx733_tgt, rx733_off
  rx733_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan737_done
    goto rxscan737_scan
  rxscan737_loop:
    ($P10) = rx733_cur."from"()
    inc $P10
    set rx733_pos, $P10
    ge rx733_pos, rx733_eos, rxscan737_done
  rxscan737_scan:
    set_addr $I10, rxscan737_loop
    rx733_cur."!mark_push"(0, rx733_pos, $I10)
  rxscan737_done:
.annotate "line", 343
  # rx subrule "identifier" subtype=capture negate=
    rx733_cur."!cursor_pos"(rx733_pos)
    $P10 = rx733_cur."identifier"()
    unless $P10, rx733_fail
    rx733_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx733_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx733_pos, rx733_eos, rx733_fail
    sub $I10, rx733_pos, rx733_off
    substr $S10, rx733_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx733_fail
  # rx subrule "args" subtype=capture negate=
    rx733_cur."!cursor_pos"(rx733_pos)
    $P10 = rx733_cur."args"()
    unless $P10, rx733_fail
    rx733_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx733_pos = $P10."pos"()
.annotate "line", 342
  # rx pass
    rx733_cur."!cursor_pass"(rx733_pos, "term:sym<identifier>")
    rx733_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx733_pos)
    .return (rx733_cur)
  rx733_fail:
.annotate "line", 4
    (rx733_rep, rx733_pos, $I10, $P10) = rx733_cur."!mark_fail"(0)
    lt rx733_pos, -1, rx733_done
    eq rx733_pos, -1, rx733_fail
    jump $I10
  rx733_done:
    rx733_cur."!cursor_fail"()
    rx733_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx733_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("168_1259177761.22934") :method
.annotate "line", 4
    $P735 = self."!PREFIX__!subrule"("identifier", "")
    new $P736, "ResizablePMCArray"
    push $P736, $P735
    .return ($P736)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("169_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx739_tgt
    .local int rx739_pos
    .local int rx739_off
    .local int rx739_eos
    .local int rx739_rep
    .local pmc rx739_cur
    (rx739_cur, rx739_pos, rx739_tgt) = self."!cursor_start"()
    rx739_cur."!cursor_debug"("START ", "term:sym<name>")
    rx739_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx739_cur
    .local pmc match
    .lex "$/", match
    length rx739_eos, rx739_tgt
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
.annotate "line", 347
  # rx subrule "name" subtype=capture negate=
    rx739_cur."!cursor_pos"(rx739_pos)
    $P10 = rx739_cur."name"()
    unless $P10, rx739_fail
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx739_pos = $P10."pos"()
  # rx rxquantr744 ** 0..1
    set_addr $I745, rxquantr744_done
    rx739_cur."!mark_push"(0, rx739_pos, $I745)
  rxquantr744_loop:
  # rx subrule "args" subtype=capture negate=
    rx739_cur."!cursor_pos"(rx739_pos)
    $P10 = rx739_cur."args"()
    unless $P10, rx739_fail
    rx739_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx739_pos = $P10."pos"()
    (rx739_rep) = rx739_cur."!mark_commit"($I745)
  rxquantr744_done:
.annotate "line", 346
  # rx pass
    rx739_cur."!cursor_pass"(rx739_pos, "term:sym<name>")
    rx739_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx739_pos)
    .return (rx739_cur)
  rx739_fail:
.annotate "line", 4
    (rx739_rep, rx739_pos, $I10, $P10) = rx739_cur."!mark_fail"(0)
    lt rx739_pos, -1, rx739_done
    eq rx739_pos, -1, rx739_fail
    jump $I10
  rx739_done:
    rx739_cur."!cursor_fail"()
    rx739_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx739_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("170_1259177761.22934") :method
.annotate "line", 4
    $P741 = self."!PREFIX__!subrule"("name", "")
    new $P742, "ResizablePMCArray"
    push $P742, $P741
    .return ($P742)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("171_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx747_tgt
    .local int rx747_pos
    .local int rx747_off
    .local int rx747_eos
    .local int rx747_rep
    .local pmc rx747_cur
    (rx747_cur, rx747_pos, rx747_tgt) = self."!cursor_start"()
    rx747_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx747_cur."!cursor_caparray"("args")
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
    ne $I10, -1, rxscan750_done
    goto rxscan750_scan
  rxscan750_loop:
    ($P10) = rx747_cur."from"()
    inc $P10
    set rx747_pos, $P10
    ge rx747_pos, rx747_eos, rxscan750_done
  rxscan750_scan:
    set_addr $I10, rxscan750_loop
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
  rxscan750_done:
.annotate "line", 351
  # rx literal  "pir::"
    add $I11, rx747_pos, 5
    gt $I11, rx747_eos, rx747_fail
    sub $I11, rx747_pos, rx747_off
    substr $S10, rx747_tgt, $I11, 5
    ne $S10, "pir::", rx747_fail
    add rx747_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_751_fail
    rx747_cur."!mark_push"(0, rx747_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx747_pos, rx747_off
    find_not_cclass $I11, 8192, rx747_tgt, $I10, rx747_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx747_fail
    add rx747_pos, rx747_off, $I11
    set_addr $I10, rxcap_751_fail
    ($I12, $I11) = rx747_cur."!mark_peek"($I10)
    rx747_cur."!cursor_pos"($I11)
    ($P10) = rx747_cur."!cursor_start"()
    $P10."!cursor_pass"(rx747_pos, "")
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_751_done
  rxcap_751_fail:
    goto rx747_fail
  rxcap_751_done:
  # rx rxquantr752 ** 0..1
    set_addr $I753, rxquantr752_done
    rx747_cur."!mark_push"(0, rx747_pos, $I753)
  rxquantr752_loop:
  # rx subrule "args" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."args"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx747_pos = $P10."pos"()
    (rx747_rep) = rx747_cur."!mark_commit"($I753)
  rxquantr752_done:
.annotate "line", 350
  # rx pass
    rx747_cur."!cursor_pass"(rx747_pos, "term:sym<pir::op>")
    rx747_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx747_pos)
    .return (rx747_cur)
  rx747_fail:
.annotate "line", 4
    (rx747_rep, rx747_pos, $I10, $P10) = rx747_cur."!mark_fail"(0)
    lt rx747_pos, -1, rx747_done
    eq rx747_pos, -1, rx747_fail
    jump $I10
  rx747_done:
    rx747_cur."!cursor_fail"()
    rx747_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx747_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("172_1259177761.22934") :method
.annotate "line", 4
    new $P749, "ResizablePMCArray"
    push $P749, "pir::"
    .return ($P749)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("173_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx755_tgt
    .local int rx755_pos
    .local int rx755_off
    .local int rx755_eos
    .local int rx755_rep
    .local pmc rx755_cur
    (rx755_cur, rx755_pos, rx755_tgt) = self."!cursor_start"()
    rx755_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx755_cur
    .local pmc match
    .lex "$/", match
    length rx755_eos, rx755_tgt
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
.annotate "line", 355
  # rx literal  "("
    add $I11, rx755_pos, 1
    gt $I11, rx755_eos, rx755_fail
    sub $I11, rx755_pos, rx755_off
    substr $S10, rx755_tgt, $I11, 1
    ne $S10, "(", rx755_fail
    add rx755_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."arglist"()
    unless $P10, rx755_fail
    rx755_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx755_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx755_pos, 1
    gt $I11, rx755_eos, rx755_fail
    sub $I11, rx755_pos, rx755_off
    substr $S10, rx755_tgt, $I11, 1
    ne $S10, ")", rx755_fail
    add rx755_pos, 1
  # rx pass
    rx755_cur."!cursor_pass"(rx755_pos, "args")
    rx755_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx755_pos)
    .return (rx755_cur)
  rx755_fail:
.annotate "line", 4
    (rx755_rep, rx755_pos, $I10, $P10) = rx755_cur."!mark_fail"(0)
    lt rx755_pos, -1, rx755_done
    eq rx755_pos, -1, rx755_fail
    jump $I10
  rx755_done:
    rx755_cur."!cursor_fail"()
    rx755_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx755_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("174_1259177761.22934") :method
.annotate "line", 4
    $P757 = self."!PREFIX__!subrule"("arglist", "(")
    new $P758, "ResizablePMCArray"
    push $P758, $P757
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("175_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx761_tgt
    .local int rx761_pos
    .local int rx761_off
    .local int rx761_eos
    .local int rx761_rep
    .local pmc rx761_cur
    (rx761_cur, rx761_pos, rx761_tgt) = self."!cursor_start"()
    rx761_cur."!cursor_debug"("START ", "arglist")
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
    ne $I10, -1, rxscan765_done
    goto rxscan765_scan
  rxscan765_loop:
    ($P10) = rx761_cur."from"()
    inc $P10
    set rx761_pos, $P10
    ge rx761_pos, rx761_eos, rxscan765_done
  rxscan765_scan:
    set_addr $I10, rxscan765_loop
    rx761_cur."!mark_push"(0, rx761_pos, $I10)
  rxscan765_done:
.annotate "line", 359
  # rx subrule "ws" subtype=method negate=
    rx761_cur."!cursor_pos"(rx761_pos)
    $P10 = rx761_cur."ws"()
    unless $P10, rx761_fail
    rx761_pos = $P10."pos"()
  alt766_0:
.annotate "line", 360
    set_addr $I10, alt766_1
    rx761_cur."!mark_push"(0, rx761_pos, $I10)
.annotate "line", 361
  # rx subrule "EXPR" subtype=capture negate=
    rx761_cur."!cursor_pos"(rx761_pos)
    $P10 = rx761_cur."EXPR"("f=")
    unless $P10, rx761_fail
    rx761_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx761_pos = $P10."pos"()
    goto alt766_end
  alt766_1:
  alt766_end:
.annotate "line", 358
  # rx pass
    rx761_cur."!cursor_pass"(rx761_pos, "arglist")
    rx761_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx761_pos)
    .return (rx761_cur)
  rx761_fail:
.annotate "line", 4
    (rx761_rep, rx761_pos, $I10, $P10) = rx761_cur."!mark_fail"(0)
    lt rx761_pos, -1, rx761_done
    eq rx761_pos, -1, rx761_fail
    jump $I10
  rx761_done:
    rx761_cur."!cursor_fail"()
    rx761_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx761_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("176_1259177761.22934") :method
.annotate "line", 4
    $P763 = self."!PREFIX__!subrule"("", "")
    new $P764, "ResizablePMCArray"
    push $P764, $P763
    .return ($P764)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("177_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx768_tgt
    .local int rx768_pos
    .local int rx768_off
    .local int rx768_eos
    .local int rx768_rep
    .local pmc rx768_cur
    (rx768_cur, rx768_pos, rx768_tgt) = self."!cursor_start"()
    rx768_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx768_cur
    .local pmc match
    .lex "$/", match
    length rx768_eos, rx768_tgt
    set rx768_off, 0
    lt rx768_pos, 2, rx768_start
    sub rx768_off, rx768_pos, 1
    substr rx768_tgt, rx768_tgt, rx768_off
  rx768_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan772_done
    goto rxscan772_scan
  rxscan772_loop:
    ($P10) = rx768_cur."from"()
    inc $P10
    set rx768_pos, $P10
    ge rx768_pos, rx768_eos, rxscan772_done
  rxscan772_scan:
    set_addr $I10, rxscan772_loop
    rx768_cur."!mark_push"(0, rx768_pos, $I10)
  rxscan772_done:
.annotate "line", 367
  # rx subrule "value" subtype=capture negate=
    rx768_cur."!cursor_pos"(rx768_pos)
    $P10 = rx768_cur."value"()
    unless $P10, rx768_fail
    rx768_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx768_pos = $P10."pos"()
  # rx pass
    rx768_cur."!cursor_pass"(rx768_pos, "term:sym<value>")
    rx768_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx768_pos)
    .return (rx768_cur)
  rx768_fail:
.annotate "line", 4
    (rx768_rep, rx768_pos, $I10, $P10) = rx768_cur."!mark_fail"(0)
    lt rx768_pos, -1, rx768_done
    eq rx768_pos, -1, rx768_fail
    jump $I10
  rx768_done:
    rx768_cur."!cursor_fail"()
    rx768_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx768_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("178_1259177761.22934") :method
.annotate "line", 4
    $P770 = self."!PREFIX__!subrule"("value", "")
    new $P771, "ResizablePMCArray"
    push $P771, $P770
    .return ($P771)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("179_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx774_tgt
    .local int rx774_pos
    .local int rx774_off
    .local int rx774_eos
    .local int rx774_rep
    .local pmc rx774_cur
    (rx774_cur, rx774_pos, rx774_tgt) = self."!cursor_start"()
    rx774_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx774_cur
    .local pmc match
    .lex "$/", match
    length rx774_eos, rx774_tgt
    set rx774_off, 0
    lt rx774_pos, 2, rx774_start
    sub rx774_off, rx774_pos, 1
    substr rx774_tgt, rx774_tgt, rx774_off
  rx774_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan779_done
    goto rxscan779_scan
  rxscan779_loop:
    ($P10) = rx774_cur."from"()
    inc $P10
    set rx774_pos, $P10
    ge rx774_pos, rx774_eos, rxscan779_done
  rxscan779_scan:
    set_addr $I10, rxscan779_loop
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
  rxscan779_done:
  alt780_0:
.annotate "line", 369
    set_addr $I10, alt780_1
    rx774_cur."!mark_push"(0, rx774_pos, $I10)
.annotate "line", 370
  # rx subrule "quote" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."quote"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx774_pos = $P10."pos"()
    goto alt780_end
  alt780_1:
.annotate "line", 371
  # rx subrule "number" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."number"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx774_pos = $P10."pos"()
  alt780_end:
.annotate "line", 369
  # rx pass
    rx774_cur."!cursor_pass"(rx774_pos, "value")
    rx774_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx774_pos)
    .return (rx774_cur)
  rx774_fail:
.annotate "line", 4
    (rx774_rep, rx774_pos, $I10, $P10) = rx774_cur."!mark_fail"(0)
    lt rx774_pos, -1, rx774_done
    eq rx774_pos, -1, rx774_fail
    jump $I10
  rx774_done:
    rx774_cur."!cursor_fail"()
    rx774_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx774_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("180_1259177761.22934") :method
.annotate "line", 4
    $P776 = self."!PREFIX__!subrule"("number", "")
    $P777 = self."!PREFIX__!subrule"("quote", "")
    new $P778, "ResizablePMCArray"
    push $P778, $P776
    push $P778, $P777
    .return ($P778)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("181_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt) = self."!cursor_start"()
    rx782_cur."!cursor_debug"("START ", "number")
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
    ne $I10, -1, rxscan785_done
    goto rxscan785_scan
  rxscan785_loop:
    ($P10) = rx782_cur."from"()
    inc $P10
    set rx782_pos, $P10
    ge rx782_pos, rx782_eos, rxscan785_done
  rxscan785_scan:
    set_addr $I10, rxscan785_loop
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  rxscan785_done:
.annotate "line", 375
  # rx subcapture "sign"
    set_addr $I10, rxcap_788_fail
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  # rx rxquantr786 ** 0..1
    set_addr $I787, rxquantr786_done
    rx782_cur."!mark_push"(0, rx782_pos, $I787)
  rxquantr786_loop:
  # rx enumcharlist negate=0 
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx782_fail
    inc rx782_pos
    (rx782_rep) = rx782_cur."!mark_commit"($I787)
  rxquantr786_done:
    set_addr $I10, rxcap_788_fail
    ($I12, $I11) = rx782_cur."!mark_peek"($I10)
    rx782_cur."!cursor_pos"($I11)
    ($P10) = rx782_cur."!cursor_start"()
    $P10."!cursor_pass"(rx782_pos, "")
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_788_done
  rxcap_788_fail:
    goto rx782_fail
  rxcap_788_done:
  alt789_0:
.annotate "line", 376
    set_addr $I10, alt789_1
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."dec_number"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx782_pos = $P10."pos"()
    goto alt789_end
  alt789_1:
  # rx subrule "integer" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."integer"()
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx782_pos = $P10."pos"()
  alt789_end:
.annotate "line", 374
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "number")
    rx782_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_fail:
.annotate "line", 4
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("182_1259177761.22934") :method
.annotate "line", 4
    new $P784, "ResizablePMCArray"
    push $P784, ""
    .return ($P784)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("183_1259177761.22934") :method
.annotate "line", 379
    $P791 = self."!protoregex"("quote")
    .return ($P791)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("184_1259177761.22934") :method
.annotate "line", 379
    $P793 = self."!PREFIX__!protoregex"("quote")
    .return ($P793)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("185_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx795_tgt
    .local int rx795_pos
    .local int rx795_off
    .local int rx795_eos
    .local int rx795_rep
    .local pmc rx795_cur
    (rx795_cur, rx795_pos, rx795_tgt) = self."!cursor_start"()
    rx795_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
.annotate "line", 380
  # rx enumcharlist negate=0 zerowidth
    ge rx795_pos, rx795_eos, rx795_fail
    sub $I10, rx795_pos, rx795_off
    substr $S10, rx795_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx795_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx795_cur."!cursor_pos"(rx795_pos)
    $P10 = rx795_cur."quote_EXPR"(":q")
    unless $P10, rx795_fail
    rx795_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx795_pos = $P10."pos"()
  # rx pass
    rx795_cur."!cursor_pass"(rx795_pos, "quote:sym<apos>")
    rx795_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx795_pos)
    .return (rx795_cur)
  rx795_fail:
.annotate "line", 4
    (rx795_rep, rx795_pos, $I10, $P10) = rx795_cur."!mark_fail"(0)
    lt rx795_pos, -1, rx795_done
    eq rx795_pos, -1, rx795_fail
    jump $I10
  rx795_done:
    rx795_cur."!cursor_fail"()
    rx795_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx795_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("186_1259177761.22934") :method
.annotate "line", 4
    new $P797, "ResizablePMCArray"
    push $P797, "'"
    .return ($P797)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("187_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx800_tgt
    .local int rx800_pos
    .local int rx800_off
    .local int rx800_eos
    .local int rx800_rep
    .local pmc rx800_cur
    (rx800_cur, rx800_pos, rx800_tgt) = self."!cursor_start"()
    rx800_cur."!cursor_debug"("START ", "quote:sym<dblq>")
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
    ne $I10, -1, rxscan803_done
    goto rxscan803_scan
  rxscan803_loop:
    ($P10) = rx800_cur."from"()
    inc $P10
    set rx800_pos, $P10
    ge rx800_pos, rx800_eos, rxscan803_done
  rxscan803_scan:
    set_addr $I10, rxscan803_loop
    rx800_cur."!mark_push"(0, rx800_pos, $I10)
  rxscan803_done:
.annotate "line", 381
  # rx enumcharlist negate=0 zerowidth
    ge rx800_pos, rx800_eos, rx800_fail
    sub $I10, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx800_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."quote_EXPR"(":qq")
    unless $P10, rx800_fail
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx800_pos = $P10."pos"()
  # rx pass
    rx800_cur."!cursor_pass"(rx800_pos, "quote:sym<dblq>")
    rx800_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx800_pos)
    .return (rx800_cur)
  rx800_fail:
.annotate "line", 4
    (rx800_rep, rx800_pos, $I10, $P10) = rx800_cur."!mark_fail"(0)
    lt rx800_pos, -1, rx800_done
    eq rx800_pos, -1, rx800_fail
    jump $I10
  rx800_done:
    rx800_cur."!cursor_fail"()
    rx800_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx800_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("188_1259177761.22934") :method
.annotate "line", 4
    new $P802, "ResizablePMCArray"
    push $P802, "\""
    .return ($P802)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("189_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx805_tgt
    .local int rx805_pos
    .local int rx805_off
    .local int rx805_eos
    .local int rx805_rep
    .local pmc rx805_cur
    (rx805_cur, rx805_pos, rx805_tgt) = self."!cursor_start"()
    rx805_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx805_cur
    .local pmc match
    .lex "$/", match
    length rx805_eos, rx805_tgt
    set rx805_off, 0
    lt rx805_pos, 2, rx805_start
    sub rx805_off, rx805_pos, 1
    substr rx805_tgt, rx805_tgt, rx805_off
  rx805_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan809_done
    goto rxscan809_scan
  rxscan809_loop:
    ($P10) = rx805_cur."from"()
    inc $P10
    set rx805_pos, $P10
    ge rx805_pos, rx805_eos, rxscan809_done
  rxscan809_scan:
    set_addr $I10, rxscan809_loop
    rx805_cur."!mark_push"(0, rx805_pos, $I10)
  rxscan809_done:
.annotate "line", 382
  # rx literal  "q"
    add $I11, rx805_pos, 1
    gt $I11, rx805_eos, rx805_fail
    sub $I11, rx805_pos, rx805_off
    substr $S10, rx805_tgt, $I11, 1
    ne $S10, "q", rx805_fail
    add rx805_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx805_pos, rx805_eos, rx805_fail
    sub $I10, rx805_pos, rx805_off
    substr $S10, rx805_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx805_fail
  # rx subrule "ws" subtype=method negate=
    rx805_cur."!cursor_pos"(rx805_pos)
    $P10 = rx805_cur."ws"()
    unless $P10, rx805_fail
    rx805_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx805_cur."!cursor_pos"(rx805_pos)
    $P10 = rx805_cur."quote_EXPR"(":q")
    unless $P10, rx805_fail
    rx805_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx805_pos = $P10."pos"()
  # rx pass
    rx805_cur."!cursor_pass"(rx805_pos, "quote:sym<q>")
    rx805_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx805_pos)
    .return (rx805_cur)
  rx805_fail:
.annotate "line", 4
    (rx805_rep, rx805_pos, $I10, $P10) = rx805_cur."!mark_fail"(0)
    lt rx805_pos, -1, rx805_done
    eq rx805_pos, -1, rx805_fail
    jump $I10
  rx805_done:
    rx805_cur."!cursor_fail"()
    rx805_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx805_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("190_1259177761.22934") :method
.annotate "line", 4
    $P807 = self."!PREFIX__!subrule"("", "q")
    new $P808, "ResizablePMCArray"
    push $P808, $P807
    .return ($P808)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("191_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx811_tgt
    .local int rx811_pos
    .local int rx811_off
    .local int rx811_eos
    .local int rx811_rep
    .local pmc rx811_cur
    (rx811_cur, rx811_pos, rx811_tgt) = self."!cursor_start"()
    rx811_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx811_cur
    .local pmc match
    .lex "$/", match
    length rx811_eos, rx811_tgt
    set rx811_off, 0
    lt rx811_pos, 2, rx811_start
    sub rx811_off, rx811_pos, 1
    substr rx811_tgt, rx811_tgt, rx811_off
  rx811_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan815_done
    goto rxscan815_scan
  rxscan815_loop:
    ($P10) = rx811_cur."from"()
    inc $P10
    set rx811_pos, $P10
    ge rx811_pos, rx811_eos, rxscan815_done
  rxscan815_scan:
    set_addr $I10, rxscan815_loop
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  rxscan815_done:
.annotate "line", 383
  # rx literal  "qq"
    add $I11, rx811_pos, 2
    gt $I11, rx811_eos, rx811_fail
    sub $I11, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I11, 2
    ne $S10, "qq", rx811_fail
    add rx811_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx811_pos, rx811_eos, rx811_fail
    sub $I10, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx811_fail
  # rx subrule "ws" subtype=method negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."ws"()
    unless $P10, rx811_fail
    rx811_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."quote_EXPR"(":qq")
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx811_pos = $P10."pos"()
  # rx pass
    rx811_cur."!cursor_pass"(rx811_pos, "quote:sym<qq>")
    rx811_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx811_pos)
    .return (rx811_cur)
  rx811_fail:
.annotate "line", 4
    (rx811_rep, rx811_pos, $I10, $P10) = rx811_cur."!mark_fail"(0)
    lt rx811_pos, -1, rx811_done
    eq rx811_pos, -1, rx811_fail
    jump $I10
  rx811_done:
    rx811_cur."!cursor_fail"()
    rx811_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx811_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("192_1259177761.22934") :method
.annotate "line", 4
    $P813 = self."!PREFIX__!subrule"("", "qq")
    new $P814, "ResizablePMCArray"
    push $P814, $P813
    .return ($P814)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("193_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx817_tgt
    .local int rx817_pos
    .local int rx817_off
    .local int rx817_eos
    .local int rx817_rep
    .local pmc rx817_cur
    (rx817_cur, rx817_pos, rx817_tgt) = self."!cursor_start"()
    rx817_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx817_cur
    .local pmc match
    .lex "$/", match
    length rx817_eos, rx817_tgt
    set rx817_off, 0
    lt rx817_pos, 2, rx817_start
    sub rx817_off, rx817_pos, 1
    substr rx817_tgt, rx817_tgt, rx817_off
  rx817_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan821_done
    goto rxscan821_scan
  rxscan821_loop:
    ($P10) = rx817_cur."from"()
    inc $P10
    set rx817_pos, $P10
    ge rx817_pos, rx817_eos, rxscan821_done
  rxscan821_scan:
    set_addr $I10, rxscan821_loop
    rx817_cur."!mark_push"(0, rx817_pos, $I10)
  rxscan821_done:
.annotate "line", 384
  # rx literal  "Q"
    add $I11, rx817_pos, 1
    gt $I11, rx817_eos, rx817_fail
    sub $I11, rx817_pos, rx817_off
    substr $S10, rx817_tgt, $I11, 1
    ne $S10, "Q", rx817_fail
    add rx817_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx817_pos, rx817_eos, rx817_fail
    sub $I10, rx817_pos, rx817_off
    substr $S10, rx817_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx817_fail
  # rx subrule "ws" subtype=method negate=
    rx817_cur."!cursor_pos"(rx817_pos)
    $P10 = rx817_cur."ws"()
    unless $P10, rx817_fail
    rx817_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx817_cur."!cursor_pos"(rx817_pos)
    $P10 = rx817_cur."quote_EXPR"()
    unless $P10, rx817_fail
    rx817_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx817_pos = $P10."pos"()
  # rx pass
    rx817_cur."!cursor_pass"(rx817_pos, "quote:sym<Q>")
    rx817_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx817_pos)
    .return (rx817_cur)
  rx817_fail:
.annotate "line", 4
    (rx817_rep, rx817_pos, $I10, $P10) = rx817_cur."!mark_fail"(0)
    lt rx817_pos, -1, rx817_done
    eq rx817_pos, -1, rx817_fail
    jump $I10
  rx817_done:
    rx817_cur."!cursor_fail"()
    rx817_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx817_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("194_1259177761.22934") :method
.annotate "line", 4
    $P819 = self."!PREFIX__!subrule"("", "Q")
    new $P820, "ResizablePMCArray"
    push $P820, $P819
    .return ($P820)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("195_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx823_tgt
    .local int rx823_pos
    .local int rx823_off
    .local int rx823_eos
    .local int rx823_rep
    .local pmc rx823_cur
    (rx823_cur, rx823_pos, rx823_tgt) = self."!cursor_start"()
    rx823_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx823_cur
    .local pmc match
    .lex "$/", match
    length rx823_eos, rx823_tgt
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
.annotate "line", 385
  # rx literal  "Q:PIR"
    add $I11, rx823_pos, 5
    gt $I11, rx823_eos, rx823_fail
    sub $I11, rx823_pos, rx823_off
    substr $S10, rx823_tgt, $I11, 5
    ne $S10, "Q:PIR", rx823_fail
    add rx823_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."ws"()
    unless $P10, rx823_fail
    rx823_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."quote_EXPR"()
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx823_pos = $P10."pos"()
  # rx pass
    rx823_cur."!cursor_pass"(rx823_pos, "quote:sym<Q:PIR>")
    rx823_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx823_pos)
    .return (rx823_cur)
  rx823_fail:
.annotate "line", 4
    (rx823_rep, rx823_pos, $I10, $P10) = rx823_cur."!mark_fail"(0)
    lt rx823_pos, -1, rx823_done
    eq rx823_pos, -1, rx823_fail
    jump $I10
  rx823_done:
    rx823_cur."!cursor_fail"()
    rx823_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx823_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("196_1259177761.22934") :method
.annotate "line", 4
    $P825 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P826, "ResizablePMCArray"
    push $P826, $P825
    .return ($P826)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("197_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx829_tgt
    .local int rx829_pos
    .local int rx829_off
    .local int rx829_eos
    .local int rx829_rep
    .local pmc rx829_cur
    (rx829_cur, rx829_pos, rx829_tgt) = self."!cursor_start"()
    rx829_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
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
.annotate "line", 387
  # rx enumcharlist negate=0 zerowidth
    ge rx829_pos, rx829_eos, rx829_fail
    sub $I10, rx829_pos, rx829_off
    substr $S10, rx829_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx829_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."quotemod_check"("s")
    unless $P10, rx829_fail
  # rx subrule "variable" subtype=capture negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."variable"()
    unless $P10, rx829_fail
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx829_pos = $P10."pos"()
  # rx pass
    rx829_cur."!cursor_pass"(rx829_pos, "quote_escape:sym<$>")
    rx829_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx829_pos)
    .return (rx829_cur)
  rx829_fail:
.annotate "line", 4
    (rx829_rep, rx829_pos, $I10, $P10) = rx829_cur."!mark_fail"(0)
    lt rx829_pos, -1, rx829_done
    eq rx829_pos, -1, rx829_fail
    jump $I10
  rx829_done:
    rx829_cur."!cursor_fail"()
    rx829_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx829_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("198_1259177761.22934") :method
.annotate "line", 4
    new $P831, "ResizablePMCArray"
    push $P831, "$"
    .return ($P831)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("199_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx834_tgt
    .local int rx834_pos
    .local int rx834_off
    .local int rx834_eos
    .local int rx834_rep
    .local pmc rx834_cur
    (rx834_cur, rx834_pos, rx834_tgt) = self."!cursor_start"()
    rx834_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
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
    ne $I10, -1, rxscan837_done
    goto rxscan837_scan
  rxscan837_loop:
    ($P10) = rx834_cur."from"()
    inc $P10
    set rx834_pos, $P10
    ge rx834_pos, rx834_eos, rxscan837_done
  rxscan837_scan:
    set_addr $I10, rxscan837_loop
    rx834_cur."!mark_push"(0, rx834_pos, $I10)
  rxscan837_done:
.annotate "line", 388
  # rx enumcharlist negate=0 zerowidth
    ge rx834_pos, rx834_eos, rx834_fail
    sub $I10, rx834_pos, rx834_off
    substr $S10, rx834_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx834_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."quotemod_check"("c")
    unless $P10, rx834_fail
  # rx subrule "block" subtype=capture negate=
    rx834_cur."!cursor_pos"(rx834_pos)
    $P10 = rx834_cur."block"()
    unless $P10, rx834_fail
    rx834_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx834_pos = $P10."pos"()
  # rx pass
    rx834_cur."!cursor_pass"(rx834_pos, "quote_escape:sym<{ }>")
    rx834_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx834_pos)
    .return (rx834_cur)
  rx834_fail:
.annotate "line", 4
    (rx834_rep, rx834_pos, $I10, $P10) = rx834_cur."!mark_fail"(0)
    lt rx834_pos, -1, rx834_done
    eq rx834_pos, -1, rx834_fail
    jump $I10
  rx834_done:
    rx834_cur."!cursor_fail"()
    rx834_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx834_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("200_1259177761.22934") :method
.annotate "line", 4
    new $P836, "ResizablePMCArray"
    push $P836, "{"
    .return ($P836)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("201_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx839_tgt
    .local int rx839_pos
    .local int rx839_off
    .local int rx839_eos
    .local int rx839_rep
    .local pmc rx839_cur
    (rx839_cur, rx839_pos, rx839_tgt) = self."!cursor_start"()
    rx839_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx839_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx839_cur
    .local pmc match
    .lex "$/", match
    length rx839_eos, rx839_tgt
    set rx839_off, 0
    lt rx839_pos, 2, rx839_start
    sub rx839_off, rx839_pos, 1
    substr rx839_tgt, rx839_tgt, rx839_off
  rx839_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan843_done
    goto rxscan843_scan
  rxscan843_loop:
    ($P10) = rx839_cur."from"()
    inc $P10
    set rx839_pos, $P10
    ge rx839_pos, rx839_eos, rxscan843_done
  rxscan843_scan:
    set_addr $I10, rxscan843_loop
    rx839_cur."!mark_push"(0, rx839_pos, $I10)
  rxscan843_done:
.annotate "line", 390
  # rx literal  "("
    add $I11, rx839_pos, 1
    gt $I11, rx839_eos, rx839_fail
    sub $I11, rx839_pos, rx839_off
    substr $S10, rx839_tgt, $I11, 1
    ne $S10, "(", rx839_fail
    add rx839_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx839_cur."!cursor_pos"(rx839_pos)
    $P10 = rx839_cur."ws"()
    unless $P10, rx839_fail
    rx839_pos = $P10."pos"()
  # rx rxquantr844 ** 0..1
    set_addr $I845, rxquantr844_done
    rx839_cur."!mark_push"(0, rx839_pos, $I845)
  rxquantr844_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx839_cur."!cursor_pos"(rx839_pos)
    $P10 = rx839_cur."EXPR"()
    unless $P10, rx839_fail
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx839_pos = $P10."pos"()
    (rx839_rep) = rx839_cur."!mark_commit"($I845)
  rxquantr844_done:
  # rx literal  ")"
    add $I11, rx839_pos, 1
    gt $I11, rx839_eos, rx839_fail
    sub $I11, rx839_pos, rx839_off
    substr $S10, rx839_tgt, $I11, 1
    ne $S10, ")", rx839_fail
    add rx839_pos, 1
  # rx pass
    rx839_cur."!cursor_pass"(rx839_pos, "circumfix:sym<( )>")
    rx839_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx839_pos)
    .return (rx839_cur)
  rx839_fail:
.annotate "line", 4
    (rx839_rep, rx839_pos, $I10, $P10) = rx839_cur."!mark_fail"(0)
    lt rx839_pos, -1, rx839_done
    eq rx839_pos, -1, rx839_fail
    jump $I10
  rx839_done:
    rx839_cur."!cursor_fail"()
    rx839_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx839_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("202_1259177761.22934") :method
.annotate "line", 4
    $P841 = self."!PREFIX__!subrule"("", "(")
    new $P842, "ResizablePMCArray"
    push $P842, $P841
    .return ($P842)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("203_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx847_tgt
    .local int rx847_pos
    .local int rx847_off
    .local int rx847_eos
    .local int rx847_rep
    .local pmc rx847_cur
    (rx847_cur, rx847_pos, rx847_tgt) = self."!cursor_start"()
    rx847_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx847_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx847_cur
    .local pmc match
    .lex "$/", match
    length rx847_eos, rx847_tgt
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
.annotate "line", 391
  # rx literal  "["
    add $I11, rx847_pos, 1
    gt $I11, rx847_eos, rx847_fail
    sub $I11, rx847_pos, rx847_off
    substr $S10, rx847_tgt, $I11, 1
    ne $S10, "[", rx847_fail
    add rx847_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx847_cur."!cursor_pos"(rx847_pos)
    $P10 = rx847_cur."ws"()
    unless $P10, rx847_fail
    rx847_pos = $P10."pos"()
  # rx rxquantr852 ** 0..1
    set_addr $I853, rxquantr852_done
    rx847_cur."!mark_push"(0, rx847_pos, $I853)
  rxquantr852_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx847_cur."!cursor_pos"(rx847_pos)
    $P10 = rx847_cur."EXPR"()
    unless $P10, rx847_fail
    rx847_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx847_pos = $P10."pos"()
    (rx847_rep) = rx847_cur."!mark_commit"($I853)
  rxquantr852_done:
  # rx literal  "]"
    add $I11, rx847_pos, 1
    gt $I11, rx847_eos, rx847_fail
    sub $I11, rx847_pos, rx847_off
    substr $S10, rx847_tgt, $I11, 1
    ne $S10, "]", rx847_fail
    add rx847_pos, 1
  # rx pass
    rx847_cur."!cursor_pass"(rx847_pos, "circumfix:sym<[ ]>")
    rx847_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx847_pos)
    .return (rx847_cur)
  rx847_fail:
.annotate "line", 4
    (rx847_rep, rx847_pos, $I10, $P10) = rx847_cur."!mark_fail"(0)
    lt rx847_pos, -1, rx847_done
    eq rx847_pos, -1, rx847_fail
    jump $I10
  rx847_done:
    rx847_cur."!cursor_fail"()
    rx847_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx847_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("204_1259177761.22934") :method
.annotate "line", 4
    $P849 = self."!PREFIX__!subrule"("", "[")
    new $P850, "ResizablePMCArray"
    push $P850, $P849
    .return ($P850)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("205_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 4
    .local string rx855_tgt
    .local int rx855_pos
    .local int rx855_off
    .local int rx855_eos
    .local int rx855_rep
    .local pmc rx855_cur
    (rx855_cur, rx855_pos, rx855_tgt) = self."!cursor_start"()
    rx855_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
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
.annotate "line", 392
  # rx enumcharlist negate=0 zerowidth
    ge rx855_pos, rx855_eos, rx855_fail
    sub $I10, rx855_pos, rx855_off
    substr $S10, rx855_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx855_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx855_fail
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx855_pos = $P10."pos"()
  # rx pass
    rx855_cur."!cursor_pass"(rx855_pos, "circumfix:sym<ang>")
    rx855_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx855_pos)
    .return (rx855_cur)
  rx855_fail:
.annotate "line", 4
    (rx855_rep, rx855_pos, $I10, $P10) = rx855_cur."!mark_fail"(0)
    lt rx855_pos, -1, rx855_done
    eq rx855_pos, -1, rx855_fail
    jump $I10
  rx855_done:
    rx855_cur."!cursor_fail"()
    rx855_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx855_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("206_1259177761.22934") :method
.annotate "line", 4
    new $P857, "ResizablePMCArray"
    push $P857, "<"
    .return ($P857)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("207_1259177761.22934") :method :outer("11_1259177761.22934")
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
.annotate "line", 393
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
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("208_1259177761.22934") :method
.annotate "line", 4
    new $P862, "ResizablePMCArray"
    push $P862, "{"
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("209_1259177761.22934") :method :outer("11_1259177761.22934")
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
.annotate "line", 394
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
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("210_1259177761.22934") :method
.annotate "line", 4
    $P867 = self."!PREFIX__!subrule"("sigil", "")
    new $P868, "ResizablePMCArray"
    push $P868, $P867
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("211_1259177761.22934") :method :outer("11_1259177761.22934")
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
.annotate "line", 396
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
.sub "!PREFIX__semilist"  :subid("212_1259177761.22934") :method
.annotate "line", 4
    new $P875, "ResizablePMCArray"
    push $P875, ""
    .return ($P875)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("213_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 419
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
.annotate "line", 400
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
.sub "!PREFIX__infixish"  :subid("214_1259177761.22934") :method
.annotate "line", 400
    new $P882, "ResizablePMCArray"
    push $P882, ""
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("215_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 420
  # rx subrule "lambda" subtype=zerowidth negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."lambda"()
    unless $P10, rx885_fail
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "infixstopper")
    rx885_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate "line", 400
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
.sub "!PREFIX__infixstopper"  :subid("216_1259177761.22934") :method
.annotate "line", 400
    new $P887, "ResizablePMCArray"
    push $P887, ""
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("217_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 423
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
.annotate "line", 424
  # rx subrule "O" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."O"("%methodop")
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx890_pos = $P10."pos"()
.annotate "line", 422
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "postcircumfix:sym<[ ]>")
    rx890_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate "line", 400
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
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("218_1259177761.22934") :method
.annotate "line", 400
    $P892 = self."!PREFIX__!subrule"("", "[")
    new $P893, "ResizablePMCArray"
    push $P893, $P892
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("219_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 428
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
.annotate "line", 429
  # rx subrule "O" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."O"("%methodop")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx896_pos = $P10."pos"()
.annotate "line", 427
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "postcircumfix:sym<{ }>")
    rx896_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate "line", 400
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
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("220_1259177761.22934") :method
.annotate "line", 400
    $P898 = self."!PREFIX__!subrule"("", "{")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("221_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 433
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
.annotate "line", 434
  # rx subrule "O" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."O"("%methodop")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx902_pos = $P10."pos"()
.annotate "line", 432
  # rx pass
    rx902_cur."!cursor_pass"(rx902_pos, "postcircumfix:sym<ang>")
    rx902_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx902_pos)
    .return (rx902_cur)
  rx902_fail:
.annotate "line", 400
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
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("222_1259177761.22934") :method
.annotate "line", 400
    new $P904, "ResizablePMCArray"
    push $P904, "<"
    .return ($P904)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("223_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 438
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
.annotate "line", 439
  # rx subrule "O" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."O"("%methodop")
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx907_pos = $P10."pos"()
.annotate "line", 437
  # rx pass
    rx907_cur."!cursor_pass"(rx907_pos, "postcircumfix:sym<( )>")
    rx907_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx907_pos)
    .return (rx907_cur)
  rx907_fail:
.annotate "line", 400
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
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("224_1259177761.22934") :method
.annotate "line", 400
    $P909 = self."!PREFIX__!subrule"("", "(")
    new $P910, "ResizablePMCArray"
    push $P910, $P909
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("225_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 442
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
.annotate "line", 400
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
.sub "!PREFIX__postfix:sym<.>"  :subid("226_1259177761.22934") :method
.annotate "line", 400
    $P915 = self."!PREFIX__!subrule"("dotty", "")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("227_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 444
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<++>"  :subid("228_1259177761.22934") :method
.annotate "line", 400
    $P921 = self."!PREFIX__!subrule"("O", "++")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("229_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 445
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<-->"  :subid("230_1259177761.22934") :method
.annotate "line", 400
    $P928 = self."!PREFIX__!subrule"("O", "--")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("231_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 448
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
.annotate "line", 400
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
.sub "!PREFIX__postfix:sym<++>"  :subid("232_1259177761.22934") :method
.annotate "line", 400
    $P935 = self."!PREFIX__!subrule"("O", "++")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("233_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 449
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
.annotate "line", 400
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
.sub "!PREFIX__postfix:sym<-->"  :subid("234_1259177761.22934") :method
.annotate "line", 400
    $P942 = self."!PREFIX__!subrule"("O", "--")
    new $P943, "ResizablePMCArray"
    push $P943, $P942
    .return ($P943)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("235_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 451
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<**>"  :subid("236_1259177761.22934") :method
.annotate "line", 400
    $P949 = self."!PREFIX__!subrule"("O", "**")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("237_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 453
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<+>"  :subid("238_1259177761.22934") :method
.annotate "line", 400
    $P956 = self."!PREFIX__!subrule"("O", "+")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("239_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 454
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<~>"  :subid("240_1259177761.22934") :method
.annotate "line", 400
    $P963 = self."!PREFIX__!subrule"("O", "~")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("241_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 455
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<->"  :subid("242_1259177761.22934") :method
.annotate "line", 400
    new $P970, "ResizablePMCArray"
    push $P970, "-"
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("243_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 456
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<?>"  :subid("244_1259177761.22934") :method
.annotate "line", 400
    $P976 = self."!PREFIX__!subrule"("O", "?")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("245_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 457
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<!>"  :subid("246_1259177761.22934") :method
.annotate "line", 400
    $P983 = self."!PREFIX__!subrule"("O", "!")
    new $P984, "ResizablePMCArray"
    push $P984, $P983
    .return ($P984)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("247_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 458
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<|>"  :subid("248_1259177761.22934") :method
.annotate "line", 400
    $P990 = self."!PREFIX__!subrule"("O", "|")
    new $P991, "ResizablePMCArray"
    push $P991, $P990
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("249_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 460
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<*>"  :subid("250_1259177761.22934") :method
.annotate "line", 400
    $P997 = self."!PREFIX__!subrule"("O", "*")
    new $P998, "ResizablePMCArray"
    push $P998, $P997
    .return ($P998)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("251_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 461
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym</>"  :subid("252_1259177761.22934") :method
.annotate "line", 400
    $P1004 = self."!PREFIX__!subrule"("O", "/")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("253_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 462
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<%>"  :subid("254_1259177761.22934") :method
.annotate "line", 400
    $P1011 = self."!PREFIX__!subrule"("O", "%")
    new $P1012, "ResizablePMCArray"
    push $P1012, $P1011
    .return ($P1012)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("255_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 464
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<+>"  :subid("256_1259177761.22934") :method
.annotate "line", 400
    $P1018 = self."!PREFIX__!subrule"("O", "+")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("257_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 465
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<->"  :subid("258_1259177761.22934") :method
.annotate "line", 400
    $P1025 = self."!PREFIX__!subrule"("O", "-")
    new $P1026, "ResizablePMCArray"
    push $P1026, $P1025
    .return ($P1026)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("259_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 467
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<~>"  :subid("260_1259177761.22934") :method
.annotate "line", 400
    $P1032 = self."!PREFIX__!subrule"("O", "~")
    new $P1033, "ResizablePMCArray"
    push $P1033, $P1032
    .return ($P1033)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("261_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 469
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<==>"  :subid("262_1259177761.22934") :method
.annotate "line", 400
    $P1039 = self."!PREFIX__!subrule"("O", "==")
    new $P1040, "ResizablePMCArray"
    push $P1040, $P1039
    .return ($P1040)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("263_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 470
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<!=>"  :subid("264_1259177761.22934") :method
.annotate "line", 400
    $P1046 = self."!PREFIX__!subrule"("O", "!=")
    new $P1047, "ResizablePMCArray"
    push $P1047, $P1046
    .return ($P1047)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("265_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 471
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<<=>"  :subid("266_1259177761.22934") :method
.annotate "line", 400
    $P1053 = self."!PREFIX__!subrule"("O", "<=")
    new $P1054, "ResizablePMCArray"
    push $P1054, $P1053
    .return ($P1054)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("267_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 472
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<>=>"  :subid("268_1259177761.22934") :method
.annotate "line", 400
    $P1060 = self."!PREFIX__!subrule"("O", ">=")
    new $P1061, "ResizablePMCArray"
    push $P1061, $P1060
    .return ($P1061)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("269_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 473
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<<>"  :subid("270_1259177761.22934") :method
.annotate "line", 400
    $P1067 = self."!PREFIX__!subrule"("O", "<")
    new $P1068, "ResizablePMCArray"
    push $P1068, $P1067
    .return ($P1068)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("271_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 474
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<>>"  :subid("272_1259177761.22934") :method
.annotate "line", 400
    $P1074 = self."!PREFIX__!subrule"("O", ">")
    new $P1075, "ResizablePMCArray"
    push $P1075, $P1074
    .return ($P1075)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("273_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 475
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<eq>"  :subid("274_1259177761.22934") :method
.annotate "line", 400
    $P1081 = self."!PREFIX__!subrule"("O", "eq")
    new $P1082, "ResizablePMCArray"
    push $P1082, $P1081
    .return ($P1082)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("275_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 476
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<ne>"  :subid("276_1259177761.22934") :method
.annotate "line", 400
    $P1088 = self."!PREFIX__!subrule"("O", "ne")
    new $P1089, "ResizablePMCArray"
    push $P1089, $P1088
    .return ($P1089)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("277_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 477
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<le>"  :subid("278_1259177761.22934") :method
.annotate "line", 400
    $P1095 = self."!PREFIX__!subrule"("O", "le")
    new $P1096, "ResizablePMCArray"
    push $P1096, $P1095
    .return ($P1096)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("279_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 478
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<ge>"  :subid("280_1259177761.22934") :method
.annotate "line", 400
    $P1102 = self."!PREFIX__!subrule"("O", "ge")
    new $P1103, "ResizablePMCArray"
    push $P1103, $P1102
    .return ($P1103)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("281_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 479
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<lt>"  :subid("282_1259177761.22934") :method
.annotate "line", 400
    $P1109 = self."!PREFIX__!subrule"("O", "lt")
    new $P1110, "ResizablePMCArray"
    push $P1110, $P1109
    .return ($P1110)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("283_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 480
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<gt>"  :subid("284_1259177761.22934") :method
.annotate "line", 400
    $P1116 = self."!PREFIX__!subrule"("O", "gt")
    new $P1117, "ResizablePMCArray"
    push $P1117, $P1116
    .return ($P1117)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("285_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 481
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<=:=>"  :subid("286_1259177761.22934") :method
.annotate "line", 400
    $P1123 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1124, "ResizablePMCArray"
    push $P1124, $P1123
    .return ($P1124)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("287_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 483
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<&&>"  :subid("288_1259177761.22934") :method
.annotate "line", 400
    $P1130 = self."!PREFIX__!subrule"("O", "&&")
    new $P1131, "ResizablePMCArray"
    push $P1131, $P1130
    .return ($P1131)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("289_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 485
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<||>"  :subid("290_1259177761.22934") :method
.annotate "line", 400
    $P1137 = self."!PREFIX__!subrule"("O", "||")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("291_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 486
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<//>"  :subid("292_1259177761.22934") :method
.annotate "line", 400
    $P1144 = self."!PREFIX__!subrule"("O", "//")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("293_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 489
  # rx literal  "??"
    add $I11, rx1149_pos, 2
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 2
    ne $S10, "??", rx1149_fail
    add rx1149_pos, 2
.annotate "line", 490
  # rx subrule "ws" subtype=method negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."ws"()
    unless $P10, rx1149_fail
    rx1149_pos = $P10."pos"()
.annotate "line", 491
  # rx subrule "EXPR" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."EXPR"("i=")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1149_pos = $P10."pos"()
.annotate "line", 492
  # rx literal  "!!"
    add $I11, rx1149_pos, 2
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 2
    ne $S10, "!!", rx1149_fail
    add rx1149_pos, 2
.annotate "line", 493
  # rx subrule "O" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
.annotate "line", 488
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<?? !!>")
    rx1149_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<?? !!>"  :subid("294_1259177761.22934") :method
.annotate "line", 400
    $P1151 = self."!PREFIX__!subrule"("", "??")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("295_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 497
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
.annotate "line", 496
  # rx pass
    rx1155_cur."!cursor_pass"(rx1155_pos, "infix:sym<=>")
    rx1155_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1155_pos)
    .return (rx1155_cur)
  rx1155_fail:
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<=>"  :subid("296_1259177761.22934") :method
.annotate "line", 400
    $P1157 = self."!PREFIX__!subrule"("", "=")
    new $P1158, "ResizablePMCArray"
    push $P1158, $P1157
    .return ($P1158)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("297_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 499
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<:=>"  :subid("298_1259177761.22934") :method
.annotate "line", 400
    $P1164 = self."!PREFIX__!subrule"("O", ":=")
    new $P1165, "ResizablePMCArray"
    push $P1165, $P1164
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("299_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 500
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<::=>"  :subid("300_1259177761.22934") :method
.annotate "line", 400
    $P1171 = self."!PREFIX__!subrule"("O", "::=")
    new $P1172, "ResizablePMCArray"
    push $P1172, $P1171
    .return ($P1172)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("301_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 502
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
.annotate "line", 400
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
.sub "!PREFIX__infix:sym<,>"  :subid("302_1259177761.22934") :method
.annotate "line", 400
    $P1178 = self."!PREFIX__!subrule"("O", ",")
    new $P1179, "ResizablePMCArray"
    push $P1179, $P1178
    .return ($P1179)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("303_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 504
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<return>"  :subid("304_1259177761.22934") :method
.annotate "line", 400
    new $P1185, "ResizablePMCArray"
    push $P1185, "return"
    .return ($P1185)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("305_1259177761.22934") :method :outer("11_1259177761.22934")
.annotate "line", 400
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
.annotate "line", 505
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
.annotate "line", 400
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
.sub "!PREFIX__prefix:sym<make>"  :subid("306_1259177761.22934") :method
.annotate "line", 400
    new $P1191, "ResizablePMCArray"
    push $P1191, "make"
    .return ($P1191)
.end


.namespace ["NQP";"Regex"]
.sub "_block1194"  :subid("307_1259177761.22934") :outer("11_1259177761.22934")
.annotate "line", 508
    .const 'Sub' $P1230 = "318_1259177761.22934" 
    capture_lex $P1230
    .const 'Sub' $P1216 = "315_1259177761.22934" 
    capture_lex $P1216
    .const 'Sub' $P1211 = "313_1259177761.22934" 
    capture_lex $P1211
    .const 'Sub' $P1206 = "311_1259177761.22934" 
    capture_lex $P1206
    .const 'Sub' $P1196 = "308_1259177761.22934" 
    capture_lex $P1196
    .const 'Sub' $P1230 = "318_1259177761.22934" 
    capture_lex $P1230
    .return ($P1230)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("308_1259177761.22934") :method :outer("307_1259177761.22934")
.annotate "line", 508
    .const 'Sub' $P1202 = "310_1259177761.22934" 
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
.annotate "line", 510
  # rx literal  ":"
    add $I11, rx1197_pos, 1
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 1
    ne $S10, ":", rx1197_fail
    add rx1197_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    .const 'Sub' $P1202 = "310_1259177761.22934" 
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
.annotate "line", 509
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "metachar:sym<:my>")
    rx1197_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1197_pos)
    .return (rx1197_cur)
  rx1197_fail:
.annotate "line", 508
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
.sub "!PREFIX__metachar:sym<:my>"  :subid("309_1259177761.22934") :method
.annotate "line", 508
    new $P1199, "ResizablePMCArray"
    push $P1199, ":"
    .return ($P1199)
.end


.namespace ["NQP";"Regex"]
.sub "_block1201"  :anon :subid("310_1259177761.22934") :method :outer("308_1259177761.22934")
.annotate "line", 510
    .lex unicode:"$\x{a2}", $P1203
    .local string rx1204_tgt
    .local int rx1204_pos
    .local int rx1204_off
    .local int rx1204_eos
    .local int rx1204_rep
    .local pmc rx1204_cur
    (rx1204_cur, rx1204_pos, rx1204_tgt) = self."!cursor_start"()
    rx1204_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1204_cur."from"()
    inc $P10
    set rx1204_pos, $P10
    ge rx1204_pos, rx1204_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  rxscan1205_done:
  # rx literal  "my"
    add $I11, rx1204_pos, 2
    gt $I11, rx1204_eos, rx1204_fail
    sub $I11, rx1204_pos, rx1204_off
    substr $S10, rx1204_tgt, $I11, 2
    ne $S10, "my", rx1204_fail
    add rx1204_pos, 2
  # rx pass
    rx1204_cur."!cursor_pass"(rx1204_pos, "")
    rx1204_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1204_pos)
    .return (rx1204_cur)
  rx1204_fail:
    (rx1204_rep, rx1204_pos, $I10, $P10) = rx1204_cur."!mark_fail"(0)
    lt rx1204_pos, -1, rx1204_done
    eq rx1204_pos, -1, rx1204_fail
    jump $I10
  rx1204_done:
    rx1204_cur."!cursor_fail"()
    rx1204_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1204_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("311_1259177761.22934") :method :outer("307_1259177761.22934")
.annotate "line", 508
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    (rx1207_cur, rx1207_pos, rx1207_tgt) = self."!cursor_start"()
    rx1207_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
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
.annotate "line", 514
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
.annotate "line", 513
  # rx pass
    rx1207_cur."!cursor_pass"(rx1207_pos, "metachar:sym<{ }>")
    rx1207_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1207_pos)
    .return (rx1207_cur)
  rx1207_fail:
.annotate "line", 508
    (rx1207_rep, rx1207_pos, $I10, $P10) = rx1207_cur."!mark_fail"(0)
    lt rx1207_pos, -1, rx1207_done
    eq rx1207_pos, -1, rx1207_fail
    jump $I10
  rx1207_done:
    rx1207_cur."!cursor_fail"()
    rx1207_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1207_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("312_1259177761.22934") :method
.annotate "line", 508
    new $P1209, "ResizablePMCArray"
    push $P1209, "{"
    .return ($P1209)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("313_1259177761.22934") :method :outer("307_1259177761.22934")
.annotate "line", 508
    .local string rx1212_tgt
    .local int rx1212_pos
    .local int rx1212_off
    .local int rx1212_eos
    .local int rx1212_rep
    .local pmc rx1212_cur
    (rx1212_cur, rx1212_pos, rx1212_tgt) = self."!cursor_start"()
    rx1212_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
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
.annotate "line", 518
  # rx enumcharlist negate=0 zerowidth
    ge rx1212_pos, rx1212_eos, rx1212_fail
    sub $I10, rx1212_pos, rx1212_off
    substr $S10, rx1212_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1212_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1212_cur."!cursor_pos"(rx1212_pos)
    $P10 = rx1212_cur."codeblock"()
    unless $P10, rx1212_fail
    rx1212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1212_pos = $P10."pos"()
.annotate "line", 517
  # rx pass
    rx1212_cur."!cursor_pass"(rx1212_pos, "assertion:sym<{ }>")
    rx1212_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1212_pos)
    .return (rx1212_cur)
  rx1212_fail:
.annotate "line", 508
    (rx1212_rep, rx1212_pos, $I10, $P10) = rx1212_cur."!mark_fail"(0)
    lt rx1212_pos, -1, rx1212_done
    eq rx1212_pos, -1, rx1212_fail
    jump $I10
  rx1212_done:
    rx1212_cur."!cursor_fail"()
    rx1212_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1212_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("314_1259177761.22934") :method
.annotate "line", 508
    new $P1214, "ResizablePMCArray"
    push $P1214, "{"
    .return ($P1214)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("315_1259177761.22934") :method :outer("307_1259177761.22934")
.annotate "line", 508
    .const 'Sub' $P1225 = "317_1259177761.22934" 
    capture_lex $P1225
    .local string rx1217_tgt
    .local int rx1217_pos
    .local int rx1217_off
    .local int rx1217_eos
    .local int rx1217_rep
    .local pmc rx1217_cur
    (rx1217_cur, rx1217_pos, rx1217_tgt) = self."!cursor_start"()
    rx1217_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1217_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1217_cur
    .local pmc match
    .lex "$/", match
    length rx1217_eos, rx1217_tgt
    set rx1217_off, 0
    lt rx1217_pos, 2, rx1217_start
    sub rx1217_off, rx1217_pos, 1
    substr rx1217_tgt, rx1217_tgt, rx1217_off
  rx1217_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1220_done
    goto rxscan1220_scan
  rxscan1220_loop:
    ($P10) = rx1217_cur."from"()
    inc $P10
    set rx1217_pos, $P10
    ge rx1217_pos, rx1217_eos, rxscan1220_done
  rxscan1220_scan:
    set_addr $I10, rxscan1220_loop
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
  rxscan1220_done:
.annotate "line", 522
  # rx subcapture "longname"
    set_addr $I10, rxcap_1221_fail
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1217_pos, rx1217_off
    find_not_cclass $I11, 8192, rx1217_tgt, $I10, rx1217_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1217_fail
    add rx1217_pos, rx1217_off, $I11
    set_addr $I10, rxcap_1221_fail
    ($I12, $I11) = rx1217_cur."!mark_peek"($I10)
    rx1217_cur."!cursor_pos"($I11)
    ($P10) = rx1217_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1217_pos, "")
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1221_done
  rxcap_1221_fail:
    goto rx1217_fail
  rxcap_1221_done:
.annotate "line", 529
  # rx rxquantr1222 ** 0..1
    set_addr $I1229, rxquantr1222_done
    rx1217_cur."!mark_push"(0, rx1217_pos, $I1229)
  rxquantr1222_loop:
  alt1223_0:
.annotate "line", 523
    set_addr $I10, alt1223_1
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
.annotate "line", 524
  # rx subrule "before" subtype=zerowidth negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    .const 'Sub' $P1225 = "317_1259177761.22934" 
    capture_lex $P1225
    $P10 = rx1217_cur."before"($P1225)
    unless $P10, rx1217_fail
    goto alt1223_end
  alt1223_1:
    set_addr $I10, alt1223_2
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
.annotate "line", 525
  # rx literal  "="
    add $I11, rx1217_pos, 1
    gt $I11, rx1217_eos, rx1217_fail
    sub $I11, rx1217_pos, rx1217_off
    substr $S10, rx1217_tgt, $I11, 1
    ne $S10, "=", rx1217_fail
    add rx1217_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."assertion"()
    unless $P10, rx1217_fail
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1217_pos = $P10."pos"()
    goto alt1223_end
  alt1223_2:
    set_addr $I10, alt1223_3
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
.annotate "line", 526
  # rx literal  ":"
    add $I11, rx1217_pos, 1
    gt $I11, rx1217_eos, rx1217_fail
    sub $I11, rx1217_pos, rx1217_off
    substr $S10, rx1217_tgt, $I11, 1
    ne $S10, ":", rx1217_fail
    add rx1217_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."arglist"()
    unless $P10, rx1217_fail
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1217_pos = $P10."pos"()
    goto alt1223_end
  alt1223_3:
    set_addr $I10, alt1223_4
    rx1217_cur."!mark_push"(0, rx1217_pos, $I10)
.annotate "line", 527
  # rx literal  "("
    add $I11, rx1217_pos, 1
    gt $I11, rx1217_eos, rx1217_fail
    sub $I11, rx1217_pos, rx1217_off
    substr $S10, rx1217_tgt, $I11, 1
    ne $S10, "(", rx1217_fail
    add rx1217_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1217_fail
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1217_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1217_pos, 1
    gt $I11, rx1217_eos, rx1217_fail
    sub $I11, rx1217_pos, rx1217_off
    substr $S10, rx1217_tgt, $I11, 1
    ne $S10, ")", rx1217_fail
    add rx1217_pos, 1
    goto alt1223_end
  alt1223_4:
.annotate "line", 528
  # rx subrule "normspace" subtype=method negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."normspace"()
    unless $P10, rx1217_fail
    rx1217_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1217_cur."!cursor_pos"(rx1217_pos)
    $P10 = rx1217_cur."nibbler"()
    unless $P10, rx1217_fail
    rx1217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1217_pos = $P10."pos"()
  alt1223_end:
.annotate "line", 529
    (rx1217_rep) = rx1217_cur."!mark_commit"($I1229)
  rxquantr1222_done:
.annotate "line", 521
  # rx pass
    rx1217_cur."!cursor_pass"(rx1217_pos, "assertion:sym<name>")
    rx1217_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1217_pos)
    .return (rx1217_cur)
  rx1217_fail:
.annotate "line", 508
    (rx1217_rep, rx1217_pos, $I10, $P10) = rx1217_cur."!mark_fail"(0)
    lt rx1217_pos, -1, rx1217_done
    eq rx1217_pos, -1, rx1217_fail
    jump $I10
  rx1217_done:
    rx1217_cur."!cursor_fail"()
    rx1217_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1217_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("316_1259177761.22934") :method
.annotate "line", 508
    new $P1219, "ResizablePMCArray"
    push $P1219, ""
    .return ($P1219)
.end


.namespace ["NQP";"Regex"]
.sub "_block1224"  :anon :subid("317_1259177761.22934") :method :outer("315_1259177761.22934")
.annotate "line", 524
    .lex unicode:"$\x{a2}", $P1226
    .local string rx1227_tgt
    .local int rx1227_pos
    .local int rx1227_off
    .local int rx1227_eos
    .local int rx1227_rep
    .local pmc rx1227_cur
    (rx1227_cur, rx1227_pos, rx1227_tgt) = self."!cursor_start"()
    rx1227_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1227_cur
    .local pmc match
    .lex "$/", match
    length rx1227_eos, rx1227_tgt
    set rx1227_off, 0
    lt rx1227_pos, 2, rx1227_start
    sub rx1227_off, rx1227_pos, 1
    substr rx1227_tgt, rx1227_tgt, rx1227_off
  rx1227_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1228_done
    goto rxscan1228_scan
  rxscan1228_loop:
    ($P10) = rx1227_cur."from"()
    inc $P10
    set rx1227_pos, $P10
    ge rx1227_pos, rx1227_eos, rxscan1228_done
  rxscan1228_scan:
    set_addr $I10, rxscan1228_loop
    rx1227_cur."!mark_push"(0, rx1227_pos, $I10)
  rxscan1228_done:
  # rx literal  ">"
    add $I11, rx1227_pos, 1
    gt $I11, rx1227_eos, rx1227_fail
    sub $I11, rx1227_pos, rx1227_off
    substr $S10, rx1227_tgt, $I11, 1
    ne $S10, ">", rx1227_fail
    add rx1227_pos, 1
  # rx pass
    rx1227_cur."!cursor_pass"(rx1227_pos, "")
    rx1227_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1227_pos)
    .return (rx1227_cur)
  rx1227_fail:
    (rx1227_rep, rx1227_pos, $I10, $P10) = rx1227_cur."!mark_fail"(0)
    lt rx1227_pos, -1, rx1227_done
    eq rx1227_pos, -1, rx1227_fail
    jump $I10
  rx1227_done:
    rx1227_cur."!cursor_fail"()
    rx1227_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1227_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("318_1259177761.22934") :method :outer("307_1259177761.22934")
.annotate "line", 508
    .local string rx1231_tgt
    .local int rx1231_pos
    .local int rx1231_off
    .local int rx1231_eos
    .local int rx1231_rep
    .local pmc rx1231_cur
    (rx1231_cur, rx1231_pos, rx1231_tgt) = self."!cursor_start"()
    rx1231_cur."!cursor_debug"("START ", "codeblock")
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
.annotate "line", 534
  # rx subrule "LANG" subtype=capture negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1231_fail
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1231_pos = $P10."pos"()
.annotate "line", 533
  # rx pass
    rx1231_cur."!cursor_pass"(rx1231_pos, "codeblock")
    rx1231_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1231_pos)
    .return (rx1231_cur)
  rx1231_fail:
.annotate "line", 508
    (rx1231_rep, rx1231_pos, $I10, $P10) = rx1231_cur."!mark_fail"(0)
    lt rx1231_pos, -1, rx1231_done
    eq rx1231_pos, -1, rx1231_fail
    jump $I10
  rx1231_done:
    rx1231_cur."!cursor_fail"()
    rx1231_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1231_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("319_1259177761.22934") :method
.annotate "line", 508
    $P1233 = self."!PREFIX__!subrule"("block", "")
    new $P1234, "ResizablePMCArray"
    push $P1234, $P1233
    .return ($P1234)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259177779.79485")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P2056 = $P14()
.annotate "line", 1
    .return ($P2056)
.end


.namespace []
.sub "" :load :init :subid("post119") :outer("10_1259177779.79485")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259177779.79485" 
    .local pmc block
    set block, $P12
    $P2057 = get_root_global ["parrot"], "P6metaclass"
    $P2057."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1259177779.79485") :outer("10_1259177779.79485")
.annotate "line", 3
    .const 'Sub' $P2052 = "118_1259177779.79485" 
    capture_lex $P2052
    get_hll_global $P1988, ["NQP";"RegexActions"], "_block1987" 
    capture_lex $P1988
    .const 'Sub' $P1975 = "112_1259177779.79485" 
    capture_lex $P1975
    .const 'Sub' $P1965 = "111_1259177779.79485" 
    capture_lex $P1965
    .const 'Sub' $P1955 = "110_1259177779.79485" 
    capture_lex $P1955
    .const 'Sub' $P1945 = "109_1259177779.79485" 
    capture_lex $P1945
    .const 'Sub' $P1931 = "108_1259177779.79485" 
    capture_lex $P1931
    .const 'Sub' $P1921 = "107_1259177779.79485" 
    capture_lex $P1921
    .const 'Sub' $P1907 = "106_1259177779.79485" 
    capture_lex $P1907
    .const 'Sub' $P1897 = "105_1259177779.79485" 
    capture_lex $P1897
    .const 'Sub' $P1887 = "104_1259177779.79485" 
    capture_lex $P1887
    .const 'Sub' $P1877 = "103_1259177779.79485" 
    capture_lex $P1877
    .const 'Sub' $P1867 = "102_1259177779.79485" 
    capture_lex $P1867
    .const 'Sub' $P1857 = "101_1259177779.79485" 
    capture_lex $P1857
    .const 'Sub' $P1829 = "100_1259177779.79485" 
    capture_lex $P1829
    .const 'Sub' $P1812 = "99_1259177779.79485" 
    capture_lex $P1812
    .const 'Sub' $P1802 = "98_1259177779.79485" 
    capture_lex $P1802
    .const 'Sub' $P1790 = "97_1259177779.79485" 
    capture_lex $P1790
    .const 'Sub' $P1778 = "96_1259177779.79485" 
    capture_lex $P1778
    .const 'Sub' $P1766 = "95_1259177779.79485" 
    capture_lex $P1766
    .const 'Sub' $P1756 = "94_1259177779.79485" 
    capture_lex $P1756
    .const 'Sub' $P1727 = "93_1259177779.79485" 
    capture_lex $P1727
    .const 'Sub' $P1703 = "92_1259177779.79485" 
    capture_lex $P1703
    .const 'Sub' $P1693 = "91_1259177779.79485" 
    capture_lex $P1693
    .const 'Sub' $P1666 = "90_1259177779.79485" 
    capture_lex $P1666
    .const 'Sub' $P1648 = "89_1259177779.79485" 
    capture_lex $P1648
    .const 'Sub' $P1638 = "88_1259177779.79485" 
    capture_lex $P1638
    .const 'Sub' $P1554 = "85_1259177779.79485" 
    capture_lex $P1554
    .const 'Sub' $P1544 = "84_1259177779.79485" 
    capture_lex $P1544
    .const 'Sub' $P1515 = "83_1259177779.79485" 
    capture_lex $P1515
    .const 'Sub' $P1473 = "82_1259177779.79485" 
    capture_lex $P1473
    .const 'Sub' $P1457 = "81_1259177779.79485" 
    capture_lex $P1457
    .const 'Sub' $P1448 = "80_1259177779.79485" 
    capture_lex $P1448
    .const 'Sub' $P1416 = "79_1259177779.79485" 
    capture_lex $P1416
    .const 'Sub' $P1329 = "77_1259177779.79485" 
    capture_lex $P1329
    .const 'Sub' $P1312 = "76_1259177779.79485" 
    capture_lex $P1312
    .const 'Sub' $P1292 = "75_1259177779.79485" 
    capture_lex $P1292
    .const 'Sub' $P1208 = "74_1259177779.79485" 
    capture_lex $P1208
    .const 'Sub' $P1184 = "72_1259177779.79485" 
    capture_lex $P1184
    .const 'Sub' $P1150 = "70_1259177779.79485" 
    capture_lex $P1150
    .const 'Sub' $P1104 = "68_1259177779.79485" 
    capture_lex $P1104
    .const 'Sub' $P1094 = "67_1259177779.79485" 
    capture_lex $P1094
    .const 'Sub' $P1084 = "66_1259177779.79485" 
    capture_lex $P1084
    .const 'Sub' $P1013 = "64_1259177779.79485" 
    capture_lex $P1013
    .const 'Sub' $P996 = "63_1259177779.79485" 
    capture_lex $P996
    .const 'Sub' $P986 = "62_1259177779.79485" 
    capture_lex $P986
    .const 'Sub' $P976 = "61_1259177779.79485" 
    capture_lex $P976
    .const 'Sub' $P966 = "60_1259177779.79485" 
    capture_lex $P966
    .const 'Sub' $P942 = "59_1259177779.79485" 
    capture_lex $P942
    .const 'Sub' $P889 = "58_1259177779.79485" 
    capture_lex $P889
    .const 'Sub' $P879 = "57_1259177779.79485" 
    capture_lex $P879
    .const 'Sub' $P790 = "55_1259177779.79485" 
    capture_lex $P790
    .const 'Sub' $P764 = "54_1259177779.79485" 
    capture_lex $P764
    .const 'Sub' $P754 = "53_1259177779.79485" 
    capture_lex $P754
    .const 'Sub' $P744 = "52_1259177779.79485" 
    capture_lex $P744
    .const 'Sub' $P734 = "51_1259177779.79485" 
    capture_lex $P734
    .const 'Sub' $P724 = "50_1259177779.79485" 
    capture_lex $P724
    .const 'Sub' $P714 = "49_1259177779.79485" 
    capture_lex $P714
    .const 'Sub' $P704 = "48_1259177779.79485" 
    capture_lex $P704
    .const 'Sub' $P694 = "47_1259177779.79485" 
    capture_lex $P694
    .const 'Sub' $P684 = "46_1259177779.79485" 
    capture_lex $P684
    .const 'Sub' $P674 = "45_1259177779.79485" 
    capture_lex $P674
    .const 'Sub' $P664 = "44_1259177779.79485" 
    capture_lex $P664
    .const 'Sub' $P654 = "43_1259177779.79485" 
    capture_lex $P654
    .const 'Sub' $P644 = "42_1259177779.79485" 
    capture_lex $P644
    .const 'Sub' $P626 = "41_1259177779.79485" 
    capture_lex $P626
    .const 'Sub' $P591 = "40_1259177779.79485" 
    capture_lex $P591
    .const 'Sub' $P575 = "39_1259177779.79485" 
    capture_lex $P575
    .const 'Sub' $P554 = "38_1259177779.79485" 
    capture_lex $P554
    .const 'Sub' $P534 = "37_1259177779.79485" 
    capture_lex $P534
    .const 'Sub' $P521 = "36_1259177779.79485" 
    capture_lex $P521
    .const 'Sub' $P495 = "35_1259177779.79485" 
    capture_lex $P495
    .const 'Sub' $P459 = "34_1259177779.79485" 
    capture_lex $P459
    .const 'Sub' $P442 = "33_1259177779.79485" 
    capture_lex $P442
    .const 'Sub' $P428 = "32_1259177779.79485" 
    capture_lex $P428
    .const 'Sub' $P373 = "30_1259177779.79485" 
    capture_lex $P373
    .const 'Sub' $P360 = "29_1259177779.79485" 
    capture_lex $P360
    .const 'Sub' $P341 = "28_1259177779.79485" 
    capture_lex $P341
    .const 'Sub' $P331 = "27_1259177779.79485" 
    capture_lex $P331
    .const 'Sub' $P321 = "26_1259177779.79485" 
    capture_lex $P321
    .const 'Sub' $P305 = "25_1259177779.79485" 
    capture_lex $P305
    .const 'Sub' $P227 = "23_1259177779.79485" 
    capture_lex $P227
    .const 'Sub' $P184 = "21_1259177779.79485" 
    capture_lex $P184
    .const 'Sub' $P165 = "20_1259177779.79485" 
    capture_lex $P165
    .const 'Sub' $P143 = "19_1259177779.79485" 
    capture_lex $P143
    .const 'Sub' $P133 = "18_1259177779.79485" 
    capture_lex $P133
    .const 'Sub' $P79 = "17_1259177779.79485" 
    capture_lex $P79
    .const 'Sub' $P61 = "16_1259177779.79485" 
    capture_lex $P61
    .const 'Sub' $P26 = "13_1259177779.79485" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1259177779.79485" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_122
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_122:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1259177779.79485" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1259177779.79485" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P61 = "16_1259177779.79485" 
    capture_lex $P61
    .lex "sigiltype", $P61
.annotate "line", 179
    .const 'Sub' $P79 = "17_1259177779.79485" 
    capture_lex $P79
    .lex "push_block_handler", $P79
.annotate "line", 3
    get_global $P129, "@BLOCK"
.annotate "line", 5
    find_lex $P130, "xblock_immediate"
    find_lex $P131, "block_immediate"
    find_lex $P132, "sigiltype"
.annotate "line", 172
    find_lex $P574, "push_block_handler"
.annotate "line", 714
    get_hll_global $P1988, ["NQP";"RegexActions"], "_block1987" 
    capture_lex $P1988
    $P2050 = $P1988()
.annotate "line", 3
    .return ($P2050)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post120") :outer("11_1259177779.79485")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P2052 = "118_1259177779.79485" 
    capture_lex $P2052
    $P2052()
    $P2055 = get_root_global ["parrot"], "P6metaclass"
    $P2055."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block2051"  :anon :subid("118_1259177779.79485") :outer("11_1259177779.79485")
.annotate "line", 6
    get_global $P2053, "@BLOCK"
    unless_null $P2053, vivify_121
    new $P2053, "ResizablePMCArray"
    set_global "@BLOCK", $P2053
  vivify_121:
 $P2054 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P2054
.annotate "line", 5
    .return ($P2054)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1259177779.79485") :outer("11_1259177779.79485")
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
.sub "block_immediate"  :subid("13_1259177779.79485") :outer("11_1259177779.79485")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P39 = "14_1259177779.79485" 
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
    .const 'Sub' $P39 = "14_1259177779.79485" 
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
.sub "_block38"  :anon :subid("14_1259177779.79485") :outer("13_1259177779.79485")
.annotate "line", 16
    .const 'Sub' $P50 = "15_1259177779.79485" 
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
    .const 'Sub' $P50 = "15_1259177779.79485" 
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
.sub "_block49"  :anon :subid("15_1259177779.79485") :outer("14_1259177779.79485")
    .param pmc param_51
.annotate "line", 18
    .lex "$_", param_51
    find_lex $P52, "$stmts"
    find_lex $P53, "$_"
    $P54 = $P52."push"($P53)
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1259177779.79485") :outer("11_1259177779.79485")
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
.sub "push_block_handler"  :subid("17_1259177779.79485") :outer("11_1259177779.79485")
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
.sub "TOP"  :subid("18_1259177779.79485") :method :outer("11_1259177779.79485")
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
.sub "deflongname"  :subid("19_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_146
.annotate "line", 32
    new $P145, 'ExceptionHandler'
    set_addr $P145, control_144
    $P145."handle_types"(58)
    push_eh $P145
    .lex "self", self
    .lex "$/", param_146
.annotate "line", 33
    find_lex $P149, "$/"
    unless_null $P149, vivify_135
    new $P149, "Hash"
  vivify_135:
    set $P150, $P149["sym"]
    unless_null $P150, vivify_136
    new $P150, "Undef"
  vivify_136:
    if $P150, if_148
    set $P147, $P150
    goto if_148_end
  if_148:
    find_lex $P151, "$/"
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
    $P163 = $P151."!make"($P162)
    set $P147, $P163
  if_148_end:
.annotate "line", 32
    .return ($P147)
  control_144:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("20_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_168
.annotate "line", 36
    new $P167, 'ExceptionHandler'
    set_addr $P167, control_166
    $P167."handle_types"(58)
    push_eh $P167
    .lex "self", self
    .lex "$/", param_168
.annotate "line", 37
    new $P169, "Undef"
    .lex "$past", $P169
.annotate "line", 38
    new $P170, "Undef"
    .lex "$BLOCK", $P170
.annotate "line", 37
    find_lex $P171, "$/"
    unless_null $P171, vivify_142
    new $P171, "Hash"
  vivify_142:
    set $P172, $P171["statementlist"]
    unless_null $P172, vivify_143
    new $P172, "Undef"
  vivify_143:
    $P173 = $P172."ast"()
    store_lex "$past", $P173
.annotate "line", 38
    get_global $P174, "@BLOCK"
    $P175 = $P174."shift"()
    store_lex "$BLOCK", $P175
.annotate "line", 39
    find_lex $P176, "$BLOCK"
    find_lex $P177, "$past"
    $P176."push"($P177)
.annotate "line", 40
    find_lex $P178, "$BLOCK"
    find_lex $P179, "$/"
    $P178."node"($P179)
.annotate "line", 41
    find_lex $P180, "$/"
    find_lex $P181, "$BLOCK"
    $P182 = $P180."!make"($P181)
.annotate "line", 36
    .return ($P182)
  control_166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P183, exception, "payload"
    .return ($P183)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("21_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_187
.annotate "line", 44
    .const 'Sub' $P201 = "22_1259177779.79485" 
    capture_lex $P201
    new $P186, 'ExceptionHandler'
    set_addr $P186, control_185
    $P186."handle_types"(58)
    push_eh $P186
    .lex "self", self
    .lex "$/", param_187
.annotate "line", 45
    new $P188, "Undef"
    .lex "$past", $P188
    get_hll_global $P189, ["PAST"], "Stmts"
    find_lex $P190, "$/"
    $P191 = $P189."new"($P190 :named("node"))
    store_lex "$past", $P191
.annotate "line", 46
    find_lex $P193, "$/"
    unless_null $P193, vivify_144
    new $P193, "Hash"
  vivify_144:
    set $P194, $P193["statement"]
    unless_null $P194, vivify_145
    new $P194, "Undef"
  vivify_145:
    unless $P194, if_192_end
.annotate "line", 47
    find_lex $P196, "$/"
    unless_null $P196, vivify_146
    new $P196, "Hash"
  vivify_146:
    set $P197, $P196["statement"]
    unless_null $P197, vivify_147
    new $P197, "Undef"
  vivify_147:
    defined $I198, $P197
    unless $I198, for_undef_148
    iter $P195, $P197
    new $P221, 'ExceptionHandler'
    set_addr $P221, loop220_handler
    $P221."handle_types"(65, 67, 66)
    push_eh $P221
  loop220_test:
    unless $P195, loop220_done
    shift $P199, $P195
  loop220_redo:
    .const 'Sub' $P201 = "22_1259177779.79485" 
    capture_lex $P201
    $P201($P199)
  loop220_next:
    goto loop220_test
  loop220_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, 'type'
    eq $P222, 65, loop220_next
    eq $P222, 67, loop220_redo
  loop220_done:
    pop_eh 
  for_undef_148:
  if_192_end:
.annotate "line", 55
    find_lex $P223, "$/"
    find_lex $P224, "$past"
    $P225 = $P223."!make"($P224)
.annotate "line", 44
    .return ($P225)
  control_185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
.end


.namespace ["NQP";"Actions"]
.sub "_block200"  :anon :subid("22_1259177779.79485") :outer("21_1259177779.79485")
    .param pmc param_203
.annotate "line", 48
    new $P202, "Undef"
    .lex "$ast", $P202
    .lex "$_", param_203
    find_lex $P204, "$_"
    $P205 = $P204."ast"()
    store_lex "$ast", $P205
.annotate "line", 49
    find_lex $P209, "$ast"
    get_hll_global $P210, ["PAST"], "Block"
    $P211 = $P209."isa"($P210)
    if $P211, if_208
    set $P207, $P211
    goto if_208_end
  if_208:
    find_lex $P212, "$ast"
    $P213 = $P212."blocktype"()
    isfalse $I214, $P213
    new $P207, 'Integer'
    set $P207, $I214
  if_208_end:
    unless $P207, if_206_end
.annotate "line", 50
    find_lex $P215, "$ast"
    $P216 = "block_immediate"($P215)
    store_lex "$ast", $P216
  if_206_end:
.annotate "line", 52
    find_lex $P217, "$past"
    find_lex $P218, "$ast"
    $P219 = $P217."push"($P218)
.annotate "line", 47
    .return ($P219)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("23_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_230
    .param pmc param_231 :optional
    .param int has_param_231 :opt_flag
.annotate "line", 58
    .const 'Sub' $P239 = "24_1259177779.79485" 
    capture_lex $P239
    new $P229, 'ExceptionHandler'
    set_addr $P229, control_228
    $P229."handle_types"(58)
    push_eh $P229
    .lex "self", self
    .lex "$/", param_230
    if has_param_231, optparam_149
    new $P232, "Undef"
    set param_231, $P232
  optparam_149:
    .lex "$key", param_231
.annotate "line", 59
    new $P233, "Undef"
    .lex "$past", $P233
.annotate "line", 58
    find_lex $P234, "$past"
.annotate "line", 60
    find_lex $P236, "$/"
    unless_null $P236, vivify_150
    new $P236, "Hash"
  vivify_150:
    set $P237, $P236["EXPR"]
    unless_null $P237, vivify_151
    new $P237, "Undef"
  vivify_151:
    if $P237, if_235
.annotate "line", 74
    find_lex $P295, "$/"
    unless_null $P295, vivify_152
    new $P295, "Hash"
  vivify_152:
    set $P296, $P295["statement_control"]
    unless_null $P296, vivify_153
    new $P296, "Undef"
  vivify_153:
    if $P296, if_294
.annotate "line", 75
    new $P300, "Integer"
    assign $P300, 0
    store_lex "$past", $P300
    goto if_294_end
  if_294:
.annotate "line", 74
    find_lex $P297, "$/"
    unless_null $P297, vivify_154
    new $P297, "Hash"
  vivify_154:
    set $P298, $P297["statement_control"]
    unless_null $P298, vivify_155
    new $P298, "Undef"
  vivify_155:
    $P299 = $P298."ast"()
    store_lex "$past", $P299
  if_294_end:
    goto if_235_end
  if_235:
.annotate "line", 60
    .const 'Sub' $P239 = "24_1259177779.79485" 
    capture_lex $P239
    $P239()
  if_235_end:
.annotate "line", 76
    find_lex $P301, "$/"
    find_lex $P302, "$past"
    $P303 = $P301."!make"($P302)
.annotate "line", 58
    .return ($P303)
  control_228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P304, exception, "payload"
    .return ($P304)
.end


.namespace ["NQP";"Actions"]
.sub "_block238"  :anon :subid("24_1259177779.79485") :outer("23_1259177779.79485")
.annotate "line", 61
    new $P240, "Undef"
    .lex "$mc", $P240
.annotate "line", 62
    new $P241, "Undef"
    .lex "$ml", $P241
.annotate "line", 61
    find_lex $P242, "$/"
    unless_null $P242, vivify_156
    new $P242, "Hash"
  vivify_156:
    set $P243, $P242["statement_mod_cond"]
    unless_null $P243, vivify_157
    new $P243, "ResizablePMCArray"
  vivify_157:
    set $P244, $P243[0]
    unless_null $P244, vivify_158
    new $P244, "Undef"
  vivify_158:
    store_lex "$mc", $P244
.annotate "line", 62
    find_lex $P245, "$/"
    unless_null $P245, vivify_159
    new $P245, "Hash"
  vivify_159:
    set $P246, $P245["statement_mod_loop"]
    unless_null $P246, vivify_160
    new $P246, "ResizablePMCArray"
  vivify_160:
    set $P247, $P246[0]
    unless_null $P247, vivify_161
    new $P247, "Undef"
  vivify_161:
    store_lex "$ml", $P247
.annotate "line", 63
    find_lex $P250, "$mc"
    if $P250, if_249
.annotate "line", 68
    find_lex $P278, "$ml"
    if $P278, if_277
.annotate "line", 71
    find_lex $P291, "$/"
    unless_null $P291, vivify_162
    new $P291, "Hash"
  vivify_162:
    set $P292, $P291["EXPR"]
    unless_null $P292, vivify_163
    new $P292, "Undef"
  vivify_163:
    $P293 = $P292."ast"()
    store_lex "$past", $P293
.annotate "line", 70
    set $P276, $P293
.annotate "line", 68
    goto if_277_end
  if_277:
.annotate "line", 69
    get_hll_global $P279, ["PAST"], "Op"
    find_lex $P280, "$ml"
    unless_null $P280, vivify_164
    new $P280, "Hash"
  vivify_164:
    set $P281, $P280["cond"]
    unless_null $P281, vivify_165
    new $P281, "Undef"
  vivify_165:
    $P282 = $P281."ast"()
    find_lex $P283, "$/"
    unless_null $P283, vivify_166
    new $P283, "Hash"
  vivify_166:
    set $P284, $P283["EXPR"]
    unless_null $P284, vivify_167
    new $P284, "Undef"
  vivify_167:
    $P285 = $P284."ast"()
    find_lex $P286, "$ml"
    unless_null $P286, vivify_168
    new $P286, "Hash"
  vivify_168:
    set $P287, $P286["sym"]
    unless_null $P287, vivify_169
    new $P287, "Undef"
  vivify_169:
    set $S288, $P287
    find_lex $P289, "$/"
    $P290 = $P279."new"($P282, $P285, $S288 :named("pasttype"), $P289 :named("node"))
    store_lex "$past", $P290
.annotate "line", 68
    set $P276, $P290
  if_277_end:
    set $P248, $P276
.annotate "line", 63
    goto if_249_end
  if_249:
.annotate "line", 64
    get_hll_global $P251, ["PAST"], "Op"
    find_lex $P252, "$mc"
    unless_null $P252, vivify_170
    new $P252, "Hash"
  vivify_170:
    set $P253, $P252["cond"]
    unless_null $P253, vivify_171
    new $P253, "Undef"
  vivify_171:
    $P254 = $P253."ast"()
    find_lex $P255, "$/"
    unless_null $P255, vivify_172
    new $P255, "Hash"
  vivify_172:
    set $P256, $P255["EXPR"]
    unless_null $P256, vivify_173
    new $P256, "Undef"
  vivify_173:
    $P257 = $P256."ast"()
    find_lex $P258, "$mc"
    unless_null $P258, vivify_174
    new $P258, "Hash"
  vivify_174:
    set $P259, $P258["sym"]
    unless_null $P259, vivify_175
    new $P259, "Undef"
  vivify_175:
    set $S260, $P259
    find_lex $P261, "$/"
    $P262 = $P251."new"($P254, $P257, $S260 :named("pasttype"), $P261 :named("node"))
    store_lex "$past", $P262
.annotate "line", 65
    find_lex $P265, "$ml"
    if $P265, if_264
    set $P263, $P265
    goto if_264_end
  if_264:
.annotate "line", 66
    get_hll_global $P266, ["PAST"], "Op"
    find_lex $P267, "$ml"
    unless_null $P267, vivify_176
    new $P267, "Hash"
  vivify_176:
    set $P268, $P267["cond"]
    unless_null $P268, vivify_177
    new $P268, "Undef"
  vivify_177:
    $P269 = $P268."ast"()
    find_lex $P270, "$past"
    find_lex $P271, "$ml"
    unless_null $P271, vivify_178
    new $P271, "Hash"
  vivify_178:
    set $P272, $P271["sym"]
    unless_null $P272, vivify_179
    new $P272, "Undef"
  vivify_179:
    set $S273, $P272
    find_lex $P274, "$/"
    $P275 = $P266."new"($P269, $P270, $S273 :named("pasttype"), $P274 :named("node"))
    store_lex "$past", $P275
.annotate "line", 65
    set $P263, $P275
  if_264_end:
.annotate "line", 63
    set $P248, $P263
  if_249_end:
.annotate "line", 60
    .return ($P248)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("25_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_308
.annotate "line", 79
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(58)
    push_eh $P307
    .lex "self", self
    .lex "$/", param_308
.annotate "line", 80
    find_lex $P309, "$/"
    get_hll_global $P310, ["PAST"], "Op"
    find_lex $P311, "$/"
    unless_null $P311, vivify_180
    new $P311, "Hash"
  vivify_180:
    set $P312, $P311["EXPR"]
    unless_null $P312, vivify_181
    new $P312, "Undef"
  vivify_181:
    $P313 = $P312."ast"()
    find_lex $P314, "$/"
    unless_null $P314, vivify_182
    new $P314, "Hash"
  vivify_182:
    set $P315, $P314["pblock"]
    unless_null $P315, vivify_183
    new $P315, "Undef"
  vivify_183:
    $P316 = $P315."ast"()
    find_lex $P317, "$/"
    $P318 = $P310."new"($P313, $P316, "if" :named("pasttype"), $P317 :named("node"))
    $P319 = $P309."!make"($P318)
.annotate "line", 79
    .return ($P319)
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("26_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_324
.annotate "line", 83
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "self", self
    .lex "$/", param_324
.annotate "line", 84
    find_lex $P325, "$/"
    find_lex $P326, "$/"
    unless_null $P326, vivify_184
    new $P326, "Hash"
  vivify_184:
    set $P327, $P326["blockoid"]
    unless_null $P327, vivify_185
    new $P327, "Undef"
  vivify_185:
    $P328 = $P327."ast"()
    $P329 = $P325."!make"($P328)
.annotate "line", 83
    .return ($P329)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, "payload"
    .return ($P330)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("27_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_334
.annotate "line", 87
    new $P333, 'ExceptionHandler'
    set_addr $P333, control_332
    $P333."handle_types"(58)
    push_eh $P333
    .lex "self", self
    .lex "$/", param_334
.annotate "line", 88
    find_lex $P335, "$/"
    find_lex $P336, "$/"
    unless_null $P336, vivify_186
    new $P336, "Hash"
  vivify_186:
    set $P337, $P336["blockoid"]
    unless_null $P337, vivify_187
    new $P337, "Undef"
  vivify_187:
    $P338 = $P337."ast"()
    $P339 = $P335."!make"($P338)
.annotate "line", 87
    .return ($P339)
  control_332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P340, exception, "payload"
    .return ($P340)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("28_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_344
.annotate "line", 91
    new $P343, 'ExceptionHandler'
    set_addr $P343, control_342
    $P343."handle_types"(58)
    push_eh $P343
    .lex "self", self
    .lex "$/", param_344
.annotate "line", 92
    new $P345, "Undef"
    .lex "$past", $P345
.annotate "line", 93
    new $P346, "Undef"
    .lex "$BLOCK", $P346
.annotate "line", 92
    find_lex $P347, "$/"
    unless_null $P347, vivify_188
    new $P347, "Hash"
  vivify_188:
    set $P348, $P347["statementlist"]
    unless_null $P348, vivify_189
    new $P348, "Undef"
  vivify_189:
    $P349 = $P348."ast"()
    store_lex "$past", $P349
.annotate "line", 93
    get_global $P350, "@BLOCK"
    $P351 = $P350."shift"()
    store_lex "$BLOCK", $P351
.annotate "line", 94
    find_lex $P352, "$BLOCK"
    find_lex $P353, "$past"
    $P352."push"($P353)
.annotate "line", 95
    find_lex $P354, "$BLOCK"
    find_lex $P355, "$/"
    $P354."node"($P355)
.annotate "line", 96
    find_lex $P356, "$/"
    find_lex $P357, "$BLOCK"
    $P358 = $P356."!make"($P357)
.annotate "line", 91
    .return ($P358)
  control_342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("29_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_363
.annotate "line", 99
    new $P362, 'ExceptionHandler'
    set_addr $P362, control_361
    $P362."handle_types"(58)
    push_eh $P362
    .lex "self", self
    .lex "$/", param_363
.annotate "line", 100
    get_global $P364, "@BLOCK"
    unless_null $P364, vivify_190
    new $P364, "ResizablePMCArray"
    set_global "@BLOCK", $P364
  vivify_190:
.annotate "line", 99
    get_global $P365, "@BLOCK"
.annotate "line", 101
    get_global $P366, "@BLOCK"
    get_hll_global $P367, ["PAST"], "Block"
    get_hll_global $P368, ["PAST"], "Stmts"
    $P369 = $P368."new"()
    $P370 = $P367."new"($P369)
    $P371 = $P366."unshift"($P370)
.annotate "line", 99
    .return ($P371)
  control_361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P372, exception, "payload"
    .return ($P372)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("30_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_376
.annotate "line", 106
    .const 'Sub' $P406 = "31_1259177779.79485" 
    capture_lex $P406
    new $P375, 'ExceptionHandler'
    set_addr $P375, control_374
    $P375."handle_types"(58)
    push_eh $P375
    .lex "self", self
    .lex "$/", param_376
.annotate "line", 107
    new $P377, "Undef"
    .lex "$count", $P377
.annotate "line", 108
    new $P378, "Undef"
    .lex "$past", $P378
.annotate "line", 107
    find_lex $P379, "$/"
    unless_null $P379, vivify_191
    new $P379, "Hash"
  vivify_191:
    set $P380, $P379["xblock"]
    unless_null $P380, vivify_192
    new $P380, "Undef"
  vivify_192:
    set $N381, $P380
    new $P382, 'Float'
    set $P382, $N381
    sub $P383, $P382, 1
    store_lex "$count", $P383
.annotate "line", 108
    find_lex $P384, "$count"
    set $I385, $P384
    find_lex $P386, "$/"
    unless_null $P386, vivify_193
    new $P386, "Hash"
  vivify_193:
    set $P387, $P386["xblock"]
    unless_null $P387, vivify_194
    new $P387, "ResizablePMCArray"
  vivify_194:
    set $P388, $P387[$I385]
    unless_null $P388, vivify_195
    new $P388, "Undef"
  vivify_195:
    $P389 = $P388."ast"()
    $P390 = "xblock_immediate"($P389)
    store_lex "$past", $P390
.annotate "line", 109
    find_lex $P392, "$/"
    unless_null $P392, vivify_196
    new $P392, "Hash"
  vivify_196:
    set $P393, $P392["else"]
    unless_null $P393, vivify_197
    new $P393, "Undef"
  vivify_197:
    unless $P393, if_391_end
.annotate "line", 110
    find_lex $P394, "$past"
    find_lex $P395, "$/"
    unless_null $P395, vivify_198
    new $P395, "Hash"
  vivify_198:
    set $P396, $P395["else"]
    unless_null $P396, vivify_199
    new $P396, "ResizablePMCArray"
  vivify_199:
    set $P397, $P396[0]
    unless_null $P397, vivify_200
    new $P397, "Undef"
  vivify_200:
    $P398 = $P397."ast"()
    $P399 = "block_immediate"($P398)
    $P394."push"($P399)
  if_391_end:
.annotate "line", 113
    new $P422, 'ExceptionHandler'
    set_addr $P422, loop421_handler
    $P422."handle_types"(65, 67, 66)
    push_eh $P422
  loop421_test:
    find_lex $P400, "$count"
    set $N401, $P400
    new $P402, "Integer"
    assign $P402, 0
    set $N403, $P402
    isgt $I404, $N401, $N403
    unless $I404, loop421_done
  loop421_redo:
    .const 'Sub' $P406 = "31_1259177779.79485" 
    capture_lex $P406
    $P406()
  loop421_next:
    goto loop421_test
  loop421_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P423, exception, 'type'
    eq $P423, 65, loop421_next
    eq $P423, 67, loop421_redo
  loop421_done:
    pop_eh 
.annotate "line", 119
    find_lex $P424, "$/"
    find_lex $P425, "$past"
    $P426 = $P424."!make"($P425)
.annotate "line", 106
    .return ($P426)
  control_374:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P427, exception, "payload"
    .return ($P427)
.end


.namespace ["NQP";"Actions"]
.sub "_block405"  :anon :subid("31_1259177779.79485") :outer("30_1259177779.79485")
.annotate "line", 115
    new $P407, "Undef"
    .lex "$else", $P407
.annotate "line", 113
    find_lex $P408, "$count"
    clone $P409, $P408
    dec $P408
.annotate "line", 115
    find_lex $P410, "$past"
    store_lex "$else", $P410
.annotate "line", 116
    find_lex $P411, "$count"
    set $I412, $P411
    find_lex $P413, "$/"
    unless_null $P413, vivify_201
    new $P413, "Hash"
  vivify_201:
    set $P414, $P413["xblock"]
    unless_null $P414, vivify_202
    new $P414, "ResizablePMCArray"
  vivify_202:
    set $P415, $P414[$I412]
    unless_null $P415, vivify_203
    new $P415, "Undef"
  vivify_203:
    $P416 = $P415."ast"()
    $P417 = "xblock_immediate"($P416)
    store_lex "$past", $P417
.annotate "line", 117
    find_lex $P418, "$past"
    find_lex $P419, "$else"
    $P420 = $P418."push"($P419)
.annotate "line", 113
    .return ($P420)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("32_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_431
.annotate "line", 122
    new $P430, 'ExceptionHandler'
    set_addr $P430, control_429
    $P430."handle_types"(58)
    push_eh $P430
    .lex "self", self
    .lex "$/", param_431
.annotate "line", 123
    new $P432, "Undef"
    .lex "$past", $P432
    find_lex $P433, "$/"
    unless_null $P433, vivify_204
    new $P433, "Hash"
  vivify_204:
    set $P434, $P433["xblock"]
    unless_null $P434, vivify_205
    new $P434, "Undef"
  vivify_205:
    $P435 = $P434."ast"()
    $P436 = "xblock_immediate"($P435)
    store_lex "$past", $P436
.annotate "line", 124
    find_lex $P437, "$past"
    $P437."pasttype"("unless")
.annotate "line", 125
    find_lex $P438, "$/"
    find_lex $P439, "$past"
    $P440 = $P438."!make"($P439)
.annotate "line", 122
    .return ($P440)
  control_429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P441, exception, "payload"
    .return ($P441)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("33_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_445
.annotate "line", 128
    new $P444, 'ExceptionHandler'
    set_addr $P444, control_443
    $P444."handle_types"(58)
    push_eh $P444
    .lex "self", self
    .lex "$/", param_445
.annotate "line", 129
    new $P446, "Undef"
    .lex "$past", $P446
    find_lex $P447, "$/"
    unless_null $P447, vivify_206
    new $P447, "Hash"
  vivify_206:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_207
    new $P448, "Undef"
  vivify_207:
    $P449 = $P448."ast"()
    $P450 = "xblock_immediate"($P449)
    store_lex "$past", $P450
.annotate "line", 130
    find_lex $P451, "$past"
    find_lex $P452, "$/"
    unless_null $P452, vivify_208
    new $P452, "Hash"
  vivify_208:
    set $P453, $P452["sym"]
    unless_null $P453, vivify_209
    new $P453, "Undef"
  vivify_209:
    set $S454, $P453
    $P451."pasttype"($S454)
.annotate "line", 131
    find_lex $P455, "$/"
    find_lex $P456, "$past"
    $P457 = $P455."!make"($P456)
.annotate "line", 128
    .return ($P457)
  control_443:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P458, exception, "payload"
    .return ($P458)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("34_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_462
.annotate "line", 134
    new $P461, 'ExceptionHandler'
    set_addr $P461, control_460
    $P461."handle_types"(58)
    push_eh $P461
    .lex "self", self
    .lex "$/", param_462
.annotate "line", 135
    new $P463, "Undef"
    .lex "$pasttype", $P463
.annotate "line", 136
    new $P464, "Undef"
    .lex "$past", $P464
.annotate "line", 135
    new $P465, "String"
    assign $P465, "repeat_"
    find_lex $P466, "$/"
    unless_null $P466, vivify_210
    new $P466, "Hash"
  vivify_210:
    set $P467, $P466["wu"]
    unless_null $P467, vivify_211
    new $P467, "Undef"
  vivify_211:
    set $S468, $P467
    concat $P469, $P465, $S468
    store_lex "$pasttype", $P469
    find_lex $P470, "$past"
.annotate "line", 137
    find_lex $P472, "$/"
    unless_null $P472, vivify_212
    new $P472, "Hash"
  vivify_212:
    set $P473, $P472["xblock"]
    unless_null $P473, vivify_213
    new $P473, "Undef"
  vivify_213:
    if $P473, if_471
.annotate "line", 142
    get_hll_global $P480, ["PAST"], "Op"
    find_lex $P481, "$/"
    unless_null $P481, vivify_214
    new $P481, "Hash"
  vivify_214:
    set $P482, $P481["EXPR"]
    unless_null $P482, vivify_215
    new $P482, "Undef"
  vivify_215:
    $P483 = $P482."ast"()
    find_lex $P484, "$/"
    unless_null $P484, vivify_216
    new $P484, "Hash"
  vivify_216:
    set $P485, $P484["pblock"]
    unless_null $P485, vivify_217
    new $P485, "Undef"
  vivify_217:
    $P486 = $P485."ast"()
    $P487 = "block_immediate"($P486)
    find_lex $P488, "$pasttype"
    find_lex $P489, "$/"
    $P490 = $P480."new"($P483, $P487, $P488 :named("pasttype"), $P489 :named("node"))
    store_lex "$past", $P490
.annotate "line", 141
    goto if_471_end
  if_471:
.annotate "line", 138
    find_lex $P474, "$/"
    unless_null $P474, vivify_218
    new $P474, "Hash"
  vivify_218:
    set $P475, $P474["xblock"]
    unless_null $P475, vivify_219
    new $P475, "Undef"
  vivify_219:
    $P476 = $P475."ast"()
    $P477 = "xblock_immediate"($P476)
    store_lex "$past", $P477
.annotate "line", 139
    find_lex $P478, "$past"
    find_lex $P479, "$pasttype"
    $P478."pasttype"($P479)
  if_471_end:
.annotate "line", 145
    find_lex $P491, "$/"
    find_lex $P492, "$past"
    $P493 = $P491."!make"($P492)
.annotate "line", 134
    .return ($P493)
  control_460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P494, exception, "payload"
    .return ($P494)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("35_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_498
.annotate "line", 148
    new $P497, 'ExceptionHandler'
    set_addr $P497, control_496
    $P497."handle_types"(58)
    push_eh $P497
    .lex "self", self
    .lex "$/", param_498
.annotate "line", 149
    new $P499, "Undef"
    .lex "$past", $P499
.annotate "line", 151
    new $P500, "Undef"
    .lex "$block", $P500
.annotate "line", 149
    find_lex $P501, "$/"
    unless_null $P501, vivify_220
    new $P501, "Hash"
  vivify_220:
    set $P502, $P501["xblock"]
    unless_null $P502, vivify_221
    new $P502, "Undef"
  vivify_221:
    $P503 = $P502."ast"()
    store_lex "$past", $P503
.annotate "line", 150
    find_lex $P504, "$past"
    $P504."pasttype"("for")
.annotate "line", 151
    find_lex $P505, "$past"
    unless_null $P505, vivify_222
    new $P505, "ResizablePMCArray"
  vivify_222:
    set $P506, $P505[1]
    unless_null $P506, vivify_223
    new $P506, "Undef"
  vivify_223:
    store_lex "$block", $P506
.annotate "line", 152
    find_lex $P508, "$block"
    $P509 = $P508."arity"()
    if $P509, unless_507_end
.annotate "line", 153
    find_lex $P510, "$block"
    unless_null $P510, vivify_224
    new $P510, "ResizablePMCArray"
  vivify_224:
    set $P511, $P510[0]
    unless_null $P511, vivify_225
    new $P511, "Undef"
  vivify_225:
    get_hll_global $P512, ["PAST"], "Var"
    $P513 = $P512."new"("$_" :named("name"), "parameter" :named("scope"))
    $P511."push"($P513)
.annotate "line", 154
    find_lex $P514, "$block"
    $P514."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 155
    find_lex $P515, "$block"
    $P515."arity"(1)
  unless_507_end:
.annotate "line", 157
    find_lex $P516, "$block"
    $P516."blocktype"("immediate")
.annotate "line", 158
    find_lex $P517, "$/"
    find_lex $P518, "$past"
    $P519 = $P517."!make"($P518)
.annotate "line", 148
    .return ($P519)
  control_496:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P520, exception, "payload"
    .return ($P520)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("36_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_524
.annotate "line", 161
    new $P523, 'ExceptionHandler'
    set_addr $P523, control_522
    $P523."handle_types"(58)
    push_eh $P523
    .lex "self", self
    .lex "$/", param_524
.annotate "line", 162
    find_lex $P525, "$/"
    get_hll_global $P526, ["PAST"], "Op"
    find_lex $P527, "$/"
    unless_null $P527, vivify_226
    new $P527, "Hash"
  vivify_226:
    set $P528, $P527["EXPR"]
    unless_null $P528, vivify_227
    new $P528, "Undef"
  vivify_227:
    $P529 = $P528."ast"()
    find_lex $P530, "$/"
    $P531 = $P526."new"($P529, "return" :named("pasttype"), $P530 :named("node"))
    $P532 = $P525."!make"($P531)
.annotate "line", 161
    .return ($P532)
  control_522:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P533, exception, "payload"
    .return ($P533)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CATCH>"  :subid("37_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_537
.annotate "line", 165
    new $P536, 'ExceptionHandler'
    set_addr $P536, control_535
    $P536."handle_types"(58)
    push_eh $P536
    .lex "self", self
    .lex "$/", param_537
.annotate "line", 166
    new $P538, "Undef"
    .lex "$block", $P538
    find_lex $P539, "$/"
    unless_null $P539, vivify_228
    new $P539, "Hash"
  vivify_228:
    set $P540, $P539["block"]
    unless_null $P540, vivify_229
    new $P540, "Undef"
  vivify_229:
    $P541 = $P540."ast"()
    store_lex "$block", $P541
.annotate "line", 167
    find_lex $P542, "$/"
    find_lex $P543, "$block"
    "push_block_handler"($P542, $P543)
.annotate "line", 168
    get_global $P544, "@BLOCK"
    unless_null $P544, vivify_230
    new $P544, "ResizablePMCArray"
  vivify_230:
    set $P545, $P544[0]
    unless_null $P545, vivify_231
    new $P545, "Undef"
  vivify_231:
    $P546 = $P545."handlers"()
    set $P547, $P546[0]
    unless_null $P547, vivify_232
    new $P547, "Undef"
  vivify_232:
    $P547."handle_types_except"("CONTROL")
.annotate "line", 169
    find_lex $P548, "$/"
    get_hll_global $P549, ["PAST"], "Stmts"
    find_lex $P550, "$/"
    $P551 = $P549."new"($P550 :named("node"))
    $P552 = $P548."!make"($P551)
.annotate "line", 165
    .return ($P552)
  control_535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P553, exception, "payload"
    .return ($P553)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<CONTROL>"  :subid("38_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_557
.annotate "line", 172
    new $P556, 'ExceptionHandler'
    set_addr $P556, control_555
    $P556."handle_types"(58)
    push_eh $P556
    .lex "self", self
    .lex "$/", param_557
.annotate "line", 173
    new $P558, "Undef"
    .lex "$block", $P558
    find_lex $P559, "$/"
    unless_null $P559, vivify_233
    new $P559, "Hash"
  vivify_233:
    set $P560, $P559["block"]
    unless_null $P560, vivify_234
    new $P560, "Undef"
  vivify_234:
    $P561 = $P560."ast"()
    store_lex "$block", $P561
.annotate "line", 174
    find_lex $P562, "$/"
    find_lex $P563, "$block"
    "push_block_handler"($P562, $P563)
.annotate "line", 175
    get_global $P564, "@BLOCK"
    unless_null $P564, vivify_235
    new $P564, "ResizablePMCArray"
  vivify_235:
    set $P565, $P564[0]
    unless_null $P565, vivify_236
    new $P565, "Undef"
  vivify_236:
    $P566 = $P565."handlers"()
    set $P567, $P566[0]
    unless_null $P567, vivify_237
    new $P567, "Undef"
  vivify_237:
    $P567."handle_types"("CONTROL")
.annotate "line", 176
    find_lex $P568, "$/"
    get_hll_global $P569, ["PAST"], "Stmts"
    find_lex $P570, "$/"
    $P571 = $P569."new"($P570 :named("node"))
    $P572 = $P568."!make"($P571)
.annotate "line", 172
    .return ($P572)
  control_555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("39_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_578
.annotate "line", 216
    new $P577, 'ExceptionHandler'
    set_addr $P577, control_576
    $P577."handle_types"(58)
    push_eh $P577
    .lex "self", self
    .lex "$/", param_578
.annotate "line", 217
    get_global $P579, "@BLOCK"
    unless_null $P579, vivify_238
    new $P579, "ResizablePMCArray"
  vivify_238:
    set $P580, $P579[0]
    unless_null $P580, vivify_239
    new $P580, "Undef"
  vivify_239:
    $P581 = $P580."loadinit"()
    find_lex $P582, "$/"
    unless_null $P582, vivify_240
    new $P582, "Hash"
  vivify_240:
    set $P583, $P582["blorst"]
    unless_null $P583, vivify_241
    new $P583, "Undef"
  vivify_241:
    $P584 = $P583."ast"()
    $P581."push"($P584)
.annotate "line", 218
    find_lex $P585, "$/"
    get_hll_global $P586, ["PAST"], "Stmts"
    find_lex $P587, "$/"
    $P588 = $P586."new"($P587 :named("node"))
    $P589 = $P585."!make"($P588)
.annotate "line", 216
    .return ($P589)
  control_576:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P590, exception, "payload"
    .return ($P590)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("40_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_594
.annotate "line", 221
    new $P593, 'ExceptionHandler'
    set_addr $P593, control_592
    $P593."handle_types"(58)
    push_eh $P593
    .lex "self", self
    .lex "$/", param_594
.annotate "line", 222
    new $P595, "Undef"
    .lex "$past", $P595
    find_lex $P596, "$/"
    unless_null $P596, vivify_242
    new $P596, "Hash"
  vivify_242:
    set $P597, $P596["blorst"]
    unless_null $P597, vivify_243
    new $P597, "Undef"
  vivify_243:
    $P598 = $P597."ast"()
    store_lex "$past", $P598
.annotate "line", 223
    find_lex $P600, "$past"
    $S601 = $P600."WHAT"()
    isne $I602, $S601, "PAST::Block()"
    unless $I602, if_599_end
.annotate "line", 224
    get_hll_global $P603, ["PAST"], "Block"
    find_lex $P604, "$past"
    find_lex $P605, "$/"
    $P606 = $P603."new"($P604, "immediate" :named("blocktype"), $P605 :named("node"))
    store_lex "$past", $P606
  if_599_end:
.annotate "line", 226
    find_lex $P608, "$past"
    $P609 = $P608."handlers"()
    if $P609, unless_607_end
.annotate "line", 227
    find_lex $P610, "$past"
    get_hll_global $P611, ["PAST"], "Control"
.annotate "line", 229
    get_hll_global $P612, ["PAST"], "Stmts"
.annotate "line", 230
    get_hll_global $P613, ["PAST"], "Op"
.annotate "line", 231
    get_hll_global $P614, ["PAST"], "Var"
.annotate "line", 232
    get_hll_global $P615, ["PAST"], "Var"
    $P616 = $P615."new"("register" :named("scope"), "exception" :named("name"))
    $P617 = $P614."new"($P616, "handled", "keyed" :named("scope"))
.annotate "line", 231
    $P618 = $P613."new"($P617, 1, "bind" :named("pasttype"))
.annotate "line", 230
    $P619 = $P612."new"($P618)
.annotate "line", 229
    $P620 = $P611."new"($P619, "CONTROL" :named("handle_types_except"))
.annotate "line", 227
    new $P621, "ResizablePMCArray"
    push $P621, $P620
    $P610."handlers"($P621)
  unless_607_end:
.annotate "line", 241
    find_lex $P622, "$/"
    find_lex $P623, "$past"
    $P624 = $P622."!make"($P623)
.annotate "line", 221
    .return ($P624)
  control_592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P625, exception, "payload"
    .return ($P625)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("41_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_629
.annotate "line", 244
    new $P628, 'ExceptionHandler'
    set_addr $P628, control_627
    $P628."handle_types"(58)
    push_eh $P628
    .lex "self", self
    .lex "$/", param_629
.annotate "line", 245
    find_lex $P630, "$/"
.annotate "line", 246
    find_lex $P633, "$/"
    unless_null $P633, vivify_244
    new $P633, "Hash"
  vivify_244:
    set $P634, $P633["block"]
    unless_null $P634, vivify_245
    new $P634, "Undef"
  vivify_245:
    if $P634, if_632
.annotate "line", 247
    find_lex $P639, "$/"
    unless_null $P639, vivify_246
    new $P639, "Hash"
  vivify_246:
    set $P640, $P639["statement"]
    unless_null $P640, vivify_247
    new $P640, "Undef"
  vivify_247:
    $P641 = $P640."ast"()
    set $P631, $P641
.annotate "line", 246
    goto if_632_end
  if_632:
    find_lex $P635, "$/"
    unless_null $P635, vivify_248
    new $P635, "Hash"
  vivify_248:
    set $P636, $P635["block"]
    unless_null $P636, vivify_249
    new $P636, "Undef"
  vivify_249:
    $P637 = $P636."ast"()
    $P638 = "block_immediate"($P637)
    set $P631, $P638
  if_632_end:
    $P642 = $P630."!make"($P631)
.annotate "line", 244
    .return ($P642)
  control_627:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P643, exception, "payload"
    .return ($P643)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("42_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_647
.annotate "line", 252
    new $P646, 'ExceptionHandler'
    set_addr $P646, control_645
    $P646."handle_types"(58)
    push_eh $P646
    .lex "self", self
    .lex "$/", param_647
    find_lex $P648, "$/"
    find_lex $P649, "$/"
    unless_null $P649, vivify_250
    new $P649, "Hash"
  vivify_250:
    set $P650, $P649["cond"]
    unless_null $P650, vivify_251
    new $P650, "Undef"
  vivify_251:
    $P651 = $P650."ast"()
    $P652 = $P648."!make"($P651)
    .return ($P652)
  control_645:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P653, exception, "payload"
    .return ($P653)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("43_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_657
.annotate "line", 253
    new $P656, 'ExceptionHandler'
    set_addr $P656, control_655
    $P656."handle_types"(58)
    push_eh $P656
    .lex "self", self
    .lex "$/", param_657
    find_lex $P658, "$/"
    find_lex $P659, "$/"
    unless_null $P659, vivify_252
    new $P659, "Hash"
  vivify_252:
    set $P660, $P659["cond"]
    unless_null $P660, vivify_253
    new $P660, "Undef"
  vivify_253:
    $P661 = $P660."ast"()
    $P662 = $P658."!make"($P661)
    .return ($P662)
  control_655:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P663, exception, "payload"
    .return ($P663)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("44_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_667
.annotate "line", 255
    new $P666, 'ExceptionHandler'
    set_addr $P666, control_665
    $P666."handle_types"(58)
    push_eh $P666
    .lex "self", self
    .lex "$/", param_667
    find_lex $P668, "$/"
    find_lex $P669, "$/"
    unless_null $P669, vivify_254
    new $P669, "Hash"
  vivify_254:
    set $P670, $P669["cond"]
    unless_null $P670, vivify_255
    new $P670, "Undef"
  vivify_255:
    $P671 = $P670."ast"()
    $P672 = $P668."!make"($P671)
    .return ($P672)
  control_665:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P673, exception, "payload"
    .return ($P673)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("45_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_677
.annotate "line", 256
    new $P676, 'ExceptionHandler'
    set_addr $P676, control_675
    $P676."handle_types"(58)
    push_eh $P676
    .lex "self", self
    .lex "$/", param_677
    find_lex $P678, "$/"
    find_lex $P679, "$/"
    unless_null $P679, vivify_256
    new $P679, "Hash"
  vivify_256:
    set $P680, $P679["cond"]
    unless_null $P680, vivify_257
    new $P680, "Undef"
  vivify_257:
    $P681 = $P680."ast"()
    $P682 = $P678."!make"($P681)
    .return ($P682)
  control_675:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P683, exception, "payload"
    .return ($P683)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("46_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_687
.annotate "line", 260
    new $P686, 'ExceptionHandler'
    set_addr $P686, control_685
    $P686."handle_types"(58)
    push_eh $P686
    .lex "self", self
    .lex "$/", param_687
    find_lex $P688, "$/"
    find_lex $P689, "$/"
    unless_null $P689, vivify_258
    new $P689, "Hash"
  vivify_258:
    set $P690, $P689["colonpair"]
    unless_null $P690, vivify_259
    new $P690, "Undef"
  vivify_259:
    $P691 = $P690."ast"()
    $P692 = $P688."!make"($P691)
    .return ($P692)
  control_685:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P693, exception, "payload"
    .return ($P693)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("47_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_697
.annotate "line", 261
    new $P696, 'ExceptionHandler'
    set_addr $P696, control_695
    $P696."handle_types"(58)
    push_eh $P696
    .lex "self", self
    .lex "$/", param_697
    find_lex $P698, "$/"
    find_lex $P699, "$/"
    unless_null $P699, vivify_260
    new $P699, "Hash"
  vivify_260:
    set $P700, $P699["variable"]
    unless_null $P700, vivify_261
    new $P700, "Undef"
  vivify_261:
    $P701 = $P700."ast"()
    $P702 = $P698."!make"($P701)
    .return ($P702)
  control_695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P703, exception, "payload"
    .return ($P703)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("48_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_707
.annotate "line", 262
    new $P706, 'ExceptionHandler'
    set_addr $P706, control_705
    $P706."handle_types"(58)
    push_eh $P706
    .lex "self", self
    .lex "$/", param_707
    find_lex $P708, "$/"
    find_lex $P709, "$/"
    unless_null $P709, vivify_262
    new $P709, "Hash"
  vivify_262:
    set $P710, $P709["package_declarator"]
    unless_null $P710, vivify_263
    new $P710, "Undef"
  vivify_263:
    $P711 = $P710."ast"()
    $P712 = $P708."!make"($P711)
    .return ($P712)
  control_705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P713, exception, "payload"
    .return ($P713)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("49_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_717
.annotate "line", 263
    new $P716, 'ExceptionHandler'
    set_addr $P716, control_715
    $P716."handle_types"(58)
    push_eh $P716
    .lex "self", self
    .lex "$/", param_717
    find_lex $P718, "$/"
    find_lex $P719, "$/"
    unless_null $P719, vivify_264
    new $P719, "Hash"
  vivify_264:
    set $P720, $P719["scope_declarator"]
    unless_null $P720, vivify_265
    new $P720, "Undef"
  vivify_265:
    $P721 = $P720."ast"()
    $P722 = $P718."!make"($P721)
    .return ($P722)
  control_715:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P723, exception, "payload"
    .return ($P723)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("50_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_727
.annotate "line", 264
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(58)
    push_eh $P726
    .lex "self", self
    .lex "$/", param_727
    find_lex $P728, "$/"
    find_lex $P729, "$/"
    unless_null $P729, vivify_266
    new $P729, "Hash"
  vivify_266:
    set $P730, $P729["routine_declarator"]
    unless_null $P730, vivify_267
    new $P730, "Undef"
  vivify_267:
    $P731 = $P730."ast"()
    $P732 = $P728."!make"($P731)
    .return ($P732)
  control_725:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P733, exception, "payload"
    .return ($P733)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("51_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_737
.annotate "line", 265
    new $P736, 'ExceptionHandler'
    set_addr $P736, control_735
    $P736."handle_types"(58)
    push_eh $P736
    .lex "self", self
    .lex "$/", param_737
    find_lex $P738, "$/"
    find_lex $P739, "$/"
    unless_null $P739, vivify_268
    new $P739, "Hash"
  vivify_268:
    set $P740, $P739["regex_declarator"]
    unless_null $P740, vivify_269
    new $P740, "Undef"
  vivify_269:
    $P741 = $P740."ast"()
    $P742 = $P738."!make"($P741)
    .return ($P742)
  control_735:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P743, exception, "payload"
    .return ($P743)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("52_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_747
.annotate "line", 266
    new $P746, 'ExceptionHandler'
    set_addr $P746, control_745
    $P746."handle_types"(58)
    push_eh $P746
    .lex "self", self
    .lex "$/", param_747
    find_lex $P748, "$/"
    find_lex $P749, "$/"
    unless_null $P749, vivify_270
    new $P749, "Hash"
  vivify_270:
    set $P750, $P749["statement_prefix"]
    unless_null $P750, vivify_271
    new $P750, "Undef"
  vivify_271:
    $P751 = $P750."ast"()
    $P752 = $P748."!make"($P751)
    .return ($P752)
  control_745:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P753, exception, "payload"
    .return ($P753)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("53_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_757
.annotate "line", 267
    new $P756, 'ExceptionHandler'
    set_addr $P756, control_755
    $P756."handle_types"(58)
    push_eh $P756
    .lex "self", self
    .lex "$/", param_757
    find_lex $P758, "$/"
    find_lex $P759, "$/"
    unless_null $P759, vivify_272
    new $P759, "Hash"
  vivify_272:
    set $P760, $P759["pblock"]
    unless_null $P760, vivify_273
    new $P760, "Undef"
  vivify_273:
    $P761 = $P760."ast"()
    $P762 = $P758."!make"($P761)
    .return ($P762)
  control_755:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P763, exception, "payload"
    .return ($P763)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("54_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_767
.annotate "line", 269
    new $P766, 'ExceptionHandler'
    set_addr $P766, control_765
    $P766."handle_types"(58)
    push_eh $P766
    .lex "self", self
    .lex "$/", param_767
.annotate "line", 270
    new $P768, "Undef"
    .lex "$past", $P768
.annotate "line", 271
    find_lex $P771, "$/"
    unless_null $P771, vivify_274
    new $P771, "Hash"
  vivify_274:
    set $P772, $P771["circumfix"]
    unless_null $P772, vivify_275
    new $P772, "Undef"
  vivify_275:
    if $P772, if_770
.annotate "line", 272
    get_hll_global $P777, ["PAST"], "Val"
    find_lex $P778, "$/"
    unless_null $P778, vivify_276
    new $P778, "Hash"
  vivify_276:
    set $P779, $P778["not"]
    unless_null $P779, vivify_277
    new $P779, "Undef"
  vivify_277:
    isfalse $I780, $P779
    $P781 = $P777."new"($I780 :named("value"))
    set $P769, $P781
.annotate "line", 271
    goto if_770_end
  if_770:
    find_lex $P773, "$/"
    unless_null $P773, vivify_278
    new $P773, "Hash"
  vivify_278:
    set $P774, $P773["circumfix"]
    unless_null $P774, vivify_279
    new $P774, "ResizablePMCArray"
  vivify_279:
    set $P775, $P774[0]
    unless_null $P775, vivify_280
    new $P775, "Undef"
  vivify_280:
    $P776 = $P775."ast"()
    set $P769, $P776
  if_770_end:
    store_lex "$past", $P769
.annotate "line", 273
    find_lex $P782, "$past"
    find_lex $P783, "$/"
    unless_null $P783, vivify_281
    new $P783, "Hash"
  vivify_281:
    set $P784, $P783["identifier"]
    unless_null $P784, vivify_282
    new $P784, "Undef"
  vivify_282:
    set $S785, $P784
    $P782."named"($S785)
.annotate "line", 274
    find_lex $P786, "$/"
    find_lex $P787, "$past"
    $P788 = $P786."!make"($P787)
.annotate "line", 269
    .return ($P788)
  control_765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P789, exception, "payload"
    .return ($P789)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("55_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_793
.annotate "line", 277
    .const 'Sub' $P806 = "56_1259177779.79485" 
    capture_lex $P806
    new $P792, 'ExceptionHandler'
    set_addr $P792, control_791
    $P792."handle_types"(58)
    push_eh $P792
    .lex "self", self
    .lex "$/", param_793
.annotate "line", 278
    new $P794, "Undef"
    .lex "$past", $P794
.annotate "line", 277
    find_lex $P795, "$past"
.annotate "line", 279
    find_lex $P797, "$/"
    unless_null $P797, vivify_283
    new $P797, "Hash"
  vivify_283:
    set $P798, $P797["postcircumfix"]
    unless_null $P798, vivify_284
    new $P798, "Undef"
  vivify_284:
    if $P798, if_796
.annotate "line", 283
    .const 'Sub' $P806 = "56_1259177779.79485" 
    capture_lex $P806
    $P806()
    goto if_796_end
  if_796:
.annotate "line", 280
    find_lex $P799, "$/"
    unless_null $P799, vivify_301
    new $P799, "Hash"
  vivify_301:
    set $P800, $P799["postcircumfix"]
    unless_null $P800, vivify_302
    new $P800, "Undef"
  vivify_302:
    $P801 = $P800."ast"()
    store_lex "$past", $P801
.annotate "line", 281
    find_lex $P802, "$past"
    get_hll_global $P803, ["PAST"], "Var"
    $P804 = $P803."new"("$/" :named("name"))
    $P802."unshift"($P804)
  if_796_end:
.annotate "line", 312
    find_lex $P875, "$/"
    find_lex $P876, "$past"
    $P877 = $P875."!make"($P876)
.annotate "line", 277
    .return ($P877)
  control_791:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P878, exception, "payload"
    .return ($P878)
.end


.namespace ["NQP";"Actions"]
.sub "_block805"  :anon :subid("56_1259177779.79485") :outer("55_1259177779.79485")
.annotate "line", 284
    new $P807, "ResizablePMCArray"
    .lex "@name", $P807
    get_hll_global $P808, ["NQP"], "Compiler"
    find_lex $P809, "$/"
    set $S810, $P809
    $P811 = $P808."parse_name"($S810)
    store_lex "@name", $P811
.annotate "line", 285
    get_hll_global $P812, ["PAST"], "Var"
    find_lex $P813, "@name"
    $P814 = $P813."pop"()
    set $S815, $P814
    $P816 = $P812."new"($S815 :named("name"))
    store_lex "$past", $P816
.annotate "line", 286
    find_lex $P818, "@name"
    unless $P818, if_817_end
.annotate "line", 287
    find_lex $P820, "@name"
    unless_null $P820, vivify_285
    new $P820, "ResizablePMCArray"
  vivify_285:
    set $P821, $P820[0]
    unless_null $P821, vivify_286
    new $P821, "Undef"
  vivify_286:
    set $S822, $P821
    iseq $I823, $S822, "GLOBAL"
    unless $I823, if_819_end
    find_lex $P824, "@name"
    $P824."shift"()
  if_819_end:
.annotate "line", 288
    find_lex $P825, "$past"
    find_lex $P826, "@name"
    $P825."namespace"($P826)
.annotate "line", 289
    find_lex $P827, "$past"
    $P827."scope"("package")
.annotate "line", 290
    find_lex $P828, "$past"
    find_lex $P829, "$/"
    unless_null $P829, vivify_287
    new $P829, "Hash"
  vivify_287:
    set $P830, $P829["sigil"]
    unless_null $P830, vivify_288
    new $P830, "Undef"
  vivify_288:
    $P831 = "sigiltype"($P830)
    $P828."viviself"($P831)
.annotate "line", 291
    find_lex $P832, "$past"
    $P832."lvalue"(1)
  if_817_end:
.annotate "line", 293
    find_lex $P835, "$/"
    unless_null $P835, vivify_289
    new $P835, "Hash"
  vivify_289:
    set $P836, $P835["twigil"]
    unless_null $P836, vivify_290
    new $P836, "ResizablePMCArray"
  vivify_290:
    set $P837, $P836[0]
    unless_null $P837, vivify_291
    new $P837, "Undef"
  vivify_291:
    set $S838, $P837
    iseq $I839, $S838, "*"
    if $I839, if_834
.annotate "line", 306
    find_lex $P861, "$/"
    unless_null $P861, vivify_292
    new $P861, "Hash"
  vivify_292:
    set $P862, $P861["twigil"]
    unless_null $P862, vivify_293
    new $P862, "ResizablePMCArray"
  vivify_293:
    set $P863, $P862[0]
    unless_null $P863, vivify_294
    new $P863, "Undef"
  vivify_294:
    set $S864, $P863
    iseq $I865, $S864, "!"
    if $I865, if_860
    new $P859, 'Integer'
    set $P859, $I865
    goto if_860_end
  if_860:
.annotate "line", 307
    find_lex $P866, "$past"
    get_hll_global $P867, ["PAST"], "Var"
    $P868 = $P867."new"("self" :named("name"))
    $P866."push"($P868)
.annotate "line", 308
    find_lex $P869, "$past"
    $P869."scope"("attribute")
.annotate "line", 309
    find_lex $P870, "$past"
    find_lex $P871, "$/"
    unless_null $P871, vivify_295
    new $P871, "Hash"
  vivify_295:
    set $P872, $P871["sigil"]
    unless_null $P872, vivify_296
    new $P872, "Undef"
  vivify_296:
    $P873 = "sigiltype"($P872)
    $P874 = $P870."viviself"($P873)
.annotate "line", 306
    set $P859, $P874
  if_860_end:
    set $P833, $P859
.annotate "line", 293
    goto if_834_end
  if_834:
.annotate "line", 294
    find_lex $P840, "$past"
    $P840."scope"("contextual")
.annotate "line", 295
    find_lex $P841, "$past"
.annotate "line", 296
    get_hll_global $P842, ["PAST"], "Var"
.annotate "line", 298
    find_lex $P843, "$/"
    unless_null $P843, vivify_297
    new $P843, "Hash"
  vivify_297:
    set $P844, $P843["sigil"]
    unless_null $P844, vivify_298
    new $P844, "Undef"
  vivify_298:
    set $S845, $P844
    new $P846, 'String'
    set $P846, $S845
    find_lex $P847, "$/"
    unless_null $P847, vivify_299
    new $P847, "Hash"
  vivify_299:
    set $P848, $P847["desigilname"]
    unless_null $P848, vivify_300
    new $P848, "Undef"
  vivify_300:
    concat $P849, $P846, $P848
.annotate "line", 300
    get_hll_global $P850, ["PAST"], "Op"
    new $P851, "String"
    assign $P851, "Contextual "
    find_lex $P852, "$/"
    set $S853, $P852
    concat $P854, $P851, $S853
    concat $P855, $P854, " not found"
    $P856 = $P850."new"($P855, "die" :named("pirop"))
    $P857 = $P842."new"("package" :named("scope"), "" :named("namespace"), $P849 :named("name"), $P856 :named("viviself"))
.annotate "line", 296
    $P858 = $P841."viviself"($P857)
.annotate "line", 293
    set $P833, $P858
  if_834_end:
.annotate "line", 283
    .return ($P833)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("57_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_882
.annotate "line", 315
    new $P881, 'ExceptionHandler'
    set_addr $P881, control_880
    $P881."handle_types"(58)
    push_eh $P881
    .lex "self", self
    .lex "$/", param_882
    find_lex $P883, "$/"
    find_lex $P884, "$/"
    unless_null $P884, vivify_303
    new $P884, "Hash"
  vivify_303:
    set $P885, $P884["package_def"]
    unless_null $P885, vivify_304
    new $P885, "Undef"
  vivify_304:
    $P886 = $P885."ast"()
    $P887 = $P883."!make"($P886)
    .return ($P887)
  control_880:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P888, exception, "payload"
    .return ($P888)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("58_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_892
.annotate "line", 316
    new $P891, 'ExceptionHandler'
    set_addr $P891, control_890
    $P891."handle_types"(58)
    push_eh $P891
    .lex "self", self
    .lex "$/", param_892
.annotate "line", 317
    new $P893, "Undef"
    .lex "$past", $P893
.annotate "line", 318
    new $P894, "Undef"
    .lex "$classinit", $P894
.annotate "line", 327
    new $P895, "Undef"
    .lex "$parent", $P895
.annotate "line", 317
    find_lex $P896, "$/"
    unless_null $P896, vivify_305
    new $P896, "Hash"
  vivify_305:
    set $P897, $P896["package_def"]
    unless_null $P897, vivify_306
    new $P897, "Undef"
  vivify_306:
    $P898 = $P897."ast"()
    store_lex "$past", $P898
.annotate "line", 319
    get_hll_global $P899, ["PAST"], "Op"
.annotate "line", 320
    get_hll_global $P900, ["PAST"], "Op"
    $P901 = $P900."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 323
    find_lex $P902, "$/"
    unless_null $P902, vivify_307
    new $P902, "Hash"
  vivify_307:
    set $P903, $P902["package_def"]
    unless_null $P903, vivify_308
    new $P903, "Hash"
  vivify_308:
    set $P904, $P903["name"]
    unless_null $P904, vivify_309
    new $P904, "Undef"
  vivify_309:
    set $S905, $P904
    $P906 = $P899."new"($P901, $S905, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 319
    store_lex "$classinit", $P906
.annotate "line", 327
    find_lex $P909, "$/"
    unless_null $P909, vivify_310
    new $P909, "Hash"
  vivify_310:
    set $P910, $P909["package_def"]
    unless_null $P910, vivify_311
    new $P910, "Hash"
  vivify_311:
    set $P911, $P910["parent"]
    unless_null $P911, vivify_312
    new $P911, "ResizablePMCArray"
  vivify_312:
    set $P912, $P911[0]
    unless_null $P912, vivify_313
    new $P912, "Undef"
  vivify_313:
    set $S913, $P912
    unless $S913, unless_908
    new $P907, 'String'
    set $P907, $S913
    goto unless_908_end
  unless_908:
.annotate "line", 328
    find_lex $P916, "$/"
    unless_null $P916, vivify_314
    new $P916, "Hash"
  vivify_314:
    set $P917, $P916["sym"]
    unless_null $P917, vivify_315
    new $P917, "Undef"
  vivify_315:
    set $S918, $P917
    iseq $I919, $S918, "grammar"
    if $I919, if_915
    new $P921, "String"
    assign $P921, ""
    set $P914, $P921
    goto if_915_end
  if_915:
    new $P920, "String"
    assign $P920, "Regex::Cursor"
    set $P914, $P920
  if_915_end:
    set $P907, $P914
  unless_908_end:
    store_lex "$parent", $P907
.annotate "line", 329
    find_lex $P923, "$parent"
    unless $P923, if_922_end
.annotate "line", 330
    find_lex $P924, "$classinit"
    get_hll_global $P925, ["PAST"], "Val"
    find_lex $P926, "$parent"
    $P927 = $P925."new"($P926 :named("value"), "parent" :named("named"))
    $P924."push"($P927)
  if_922_end:
.annotate "line", 332
    find_lex $P929, "$past"
    unless_null $P929, vivify_316
    new $P929, "Hash"
  vivify_316:
    set $P930, $P929["attributes"]
    unless_null $P930, vivify_317
    new $P930, "Undef"
  vivify_317:
    unless $P930, if_928_end
.annotate "line", 333
    find_lex $P931, "$classinit"
    find_lex $P932, "$past"
    unless_null $P932, vivify_318
    new $P932, "Hash"
  vivify_318:
    set $P933, $P932["attributes"]
    unless_null $P933, vivify_319
    new $P933, "Undef"
  vivify_319:
    $P931."push"($P933)
  if_928_end:
.annotate "line", 335
    get_global $P934, "@BLOCK"
    unless_null $P934, vivify_320
    new $P934, "ResizablePMCArray"
  vivify_320:
    set $P935, $P934[0]
    unless_null $P935, vivify_321
    new $P935, "Undef"
  vivify_321:
    $P936 = $P935."loadinit"()
    find_lex $P937, "$classinit"
    $P936."push"($P937)
.annotate "line", 336
    find_lex $P938, "$/"
    find_lex $P939, "$past"
    $P940 = $P938."!make"($P939)
.annotate "line", 316
    .return ($P940)
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P941, exception, "payload"
    .return ($P941)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("59_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_945
.annotate "line", 339
    new $P944, 'ExceptionHandler'
    set_addr $P944, control_943
    $P944."handle_types"(58)
    push_eh $P944
    .lex "self", self
    .lex "$/", param_945
.annotate "line", 340
    new $P946, "Undef"
    .lex "$past", $P946
    find_lex $P949, "$/"
    unless_null $P949, vivify_322
    new $P949, "Hash"
  vivify_322:
    set $P950, $P949["block"]
    unless_null $P950, vivify_323
    new $P950, "Undef"
  vivify_323:
    if $P950, if_948
    find_lex $P954, "$/"
    unless_null $P954, vivify_324
    new $P954, "Hash"
  vivify_324:
    set $P955, $P954["comp_unit"]
    unless_null $P955, vivify_325
    new $P955, "Undef"
  vivify_325:
    $P956 = $P955."ast"()
    set $P947, $P956
    goto if_948_end
  if_948:
    find_lex $P951, "$/"
    unless_null $P951, vivify_326
    new $P951, "Hash"
  vivify_326:
    set $P952, $P951["block"]
    unless_null $P952, vivify_327
    new $P952, "Undef"
  vivify_327:
    $P953 = $P952."ast"()
    set $P947, $P953
  if_948_end:
    store_lex "$past", $P947
.annotate "line", 341
    find_lex $P957, "$past"
    find_lex $P958, "$/"
    unless_null $P958, vivify_328
    new $P958, "Hash"
  vivify_328:
    set $P959, $P958["name"]
    unless_null $P959, vivify_329
    new $P959, "Hash"
  vivify_329:
    set $P960, $P959["identifier"]
    unless_null $P960, vivify_330
    new $P960, "Undef"
  vivify_330:
    $P957."namespace"($P960)
.annotate "line", 342
    find_lex $P961, "$past"
    $P961."blocktype"("immediate")
.annotate "line", 343
    find_lex $P962, "$/"
    find_lex $P963, "$past"
    $P964 = $P962."!make"($P963)
.annotate "line", 339
    .return ($P964)
  control_943:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P965, exception, "payload"
    .return ($P965)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("60_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_969
.annotate "line", 346
    new $P968, 'ExceptionHandler'
    set_addr $P968, control_967
    $P968."handle_types"(58)
    push_eh $P968
    .lex "self", self
    .lex "$/", param_969
    find_lex $P970, "$/"
    find_lex $P971, "$/"
    unless_null $P971, vivify_331
    new $P971, "Hash"
  vivify_331:
    set $P972, $P971["scoped"]
    unless_null $P972, vivify_332
    new $P972, "Undef"
  vivify_332:
    $P973 = $P972."ast"()
    $P974 = $P970."!make"($P973)
    .return ($P974)
  control_967:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P975, exception, "payload"
    .return ($P975)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("61_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_979
.annotate "line", 347
    new $P978, 'ExceptionHandler'
    set_addr $P978, control_977
    $P978."handle_types"(58)
    push_eh $P978
    .lex "self", self
    .lex "$/", param_979
    find_lex $P980, "$/"
    find_lex $P981, "$/"
    unless_null $P981, vivify_333
    new $P981, "Hash"
  vivify_333:
    set $P982, $P981["scoped"]
    unless_null $P982, vivify_334
    new $P982, "Undef"
  vivify_334:
    $P983 = $P982."ast"()
    $P984 = $P980."!make"($P983)
    .return ($P984)
  control_977:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P985, exception, "payload"
    .return ($P985)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("62_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_989
.annotate "line", 348
    new $P988, 'ExceptionHandler'
    set_addr $P988, control_987
    $P988."handle_types"(58)
    push_eh $P988
    .lex "self", self
    .lex "$/", param_989
    find_lex $P990, "$/"
    find_lex $P991, "$/"
    unless_null $P991, vivify_335
    new $P991, "Hash"
  vivify_335:
    set $P992, $P991["scoped"]
    unless_null $P992, vivify_336
    new $P992, "Undef"
  vivify_336:
    $P993 = $P992."ast"()
    $P994 = $P990."!make"($P993)
    .return ($P994)
  control_987:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P995, exception, "payload"
    .return ($P995)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("63_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_999
.annotate "line", 350
    new $P998, 'ExceptionHandler'
    set_addr $P998, control_997
    $P998."handle_types"(58)
    push_eh $P998
    .lex "self", self
    .lex "$/", param_999
.annotate "line", 351
    find_lex $P1000, "$/"
.annotate "line", 352
    find_lex $P1003, "$/"
    unless_null $P1003, vivify_337
    new $P1003, "Hash"
  vivify_337:
    set $P1004, $P1003["routine_declarator"]
    unless_null $P1004, vivify_338
    new $P1004, "Undef"
  vivify_338:
    if $P1004, if_1002
.annotate "line", 353
    find_lex $P1008, "$/"
    unless_null $P1008, vivify_339
    new $P1008, "Hash"
  vivify_339:
    set $P1009, $P1008["variable_declarator"]
    unless_null $P1009, vivify_340
    new $P1009, "Undef"
  vivify_340:
    $P1010 = $P1009."ast"()
    set $P1001, $P1010
.annotate "line", 352
    goto if_1002_end
  if_1002:
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_341
    new $P1005, "Hash"
  vivify_341:
    set $P1006, $P1005["routine_declarator"]
    unless_null $P1006, vivify_342
    new $P1006, "Undef"
  vivify_342:
    $P1007 = $P1006."ast"()
    set $P1001, $P1007
  if_1002_end:
    $P1011 = $P1000."!make"($P1001)
.annotate "line", 350
    .return ($P1011)
  control_997:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1012, exception, "payload"
    .return ($P1012)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("64_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1016
.annotate "line", 356
    .const 'Sub' $P1056 = "65_1259177779.79485" 
    capture_lex $P1056
    new $P1015, 'ExceptionHandler'
    set_addr $P1015, control_1014
    $P1015."handle_types"(58)
    push_eh $P1015
    .lex "self", self
    .lex "$/", param_1016
.annotate "line", 357
    new $P1017, "Undef"
    .lex "$past", $P1017
.annotate "line", 358
    new $P1018, "Undef"
    .lex "$sigil", $P1018
.annotate "line", 359
    new $P1019, "Undef"
    .lex "$name", $P1019
.annotate "line", 360
    new $P1020, "Undef"
    .lex "$BLOCK", $P1020
.annotate "line", 357
    find_lex $P1021, "$/"
    unless_null $P1021, vivify_343
    new $P1021, "Hash"
  vivify_343:
    set $P1022, $P1021["variable"]
    unless_null $P1022, vivify_344
    new $P1022, "Undef"
  vivify_344:
    $P1023 = $P1022."ast"()
    store_lex "$past", $P1023
.annotate "line", 358
    find_lex $P1024, "$/"
    unless_null $P1024, vivify_345
    new $P1024, "Hash"
  vivify_345:
    set $P1025, $P1024["variable"]
    unless_null $P1025, vivify_346
    new $P1025, "Hash"
  vivify_346:
    set $P1026, $P1025["sigil"]
    unless_null $P1026, vivify_347
    new $P1026, "Undef"
  vivify_347:
    store_lex "$sigil", $P1026
.annotate "line", 359
    find_lex $P1027, "$past"
    $P1028 = $P1027."name"()
    store_lex "$name", $P1028
.annotate "line", 360
    get_global $P1029, "@BLOCK"
    unless_null $P1029, vivify_348
    new $P1029, "ResizablePMCArray"
  vivify_348:
    set $P1030, $P1029[0]
    unless_null $P1030, vivify_349
    new $P1030, "Undef"
  vivify_349:
    store_lex "$BLOCK", $P1030
.annotate "line", 361
    find_lex $P1032, "$BLOCK"
    find_lex $P1033, "$name"
    $P1034 = $P1032."symbol"($P1033)
    unless $P1034, if_1031_end
.annotate "line", 362
    find_lex $P1035, "$/"
    $P1036 = $P1035."CURSOR"()
    find_lex $P1037, "$name"
    $P1036."panic"("Redeclaration of symbol ", $P1037)
  if_1031_end:
.annotate "line", 364
    find_dynamic_lex $P1039, "$*SCOPE"
    unless_null $P1039, vivify_350
    get_hll_global $P1039, "$SCOPE"
    unless_null $P1039, vivify_351
    die "Contextual $*SCOPE not found"
  vivify_351:
  vivify_350:
    set $S1040, $P1039
    iseq $I1041, $S1040, "has"
    if $I1041, if_1038
.annotate "line", 373
    .const 'Sub' $P1056 = "65_1259177779.79485" 
    capture_lex $P1056
    $P1056()
    goto if_1038_end
  if_1038:
.annotate "line", 365
    find_lex $P1042, "$BLOCK"
    find_lex $P1043, "$name"
    $P1042."symbol"($P1043, "attribute" :named("scope"))
.annotate "line", 366
    find_lex $P1045, "$BLOCK"
    unless_null $P1045, vivify_356
    new $P1045, "Hash"
  vivify_356:
    set $P1046, $P1045["attributes"]
    unless_null $P1046, vivify_357
    new $P1046, "Undef"
  vivify_357:
    if $P1046, unless_1044_end
.annotate "line", 368
    get_hll_global $P1047, ["PAST"], "Op"
    $P1048 = $P1047."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P1049, "$BLOCK"
    unless_null $P1049, vivify_358
    new $P1049, "Hash"
    store_lex "$BLOCK", $P1049
  vivify_358:
    set $P1049["attributes"], $P1048
  unless_1044_end:
.annotate "line", 370
    find_lex $P1050, "$BLOCK"
    unless_null $P1050, vivify_359
    new $P1050, "Hash"
  vivify_359:
    set $P1051, $P1050["attributes"]
    unless_null $P1051, vivify_360
    new $P1051, "Undef"
  vivify_360:
    find_lex $P1052, "$name"
    $P1051."push"($P1052)
.annotate "line", 371
    get_hll_global $P1053, ["PAST"], "Stmts"
    $P1054 = $P1053."new"()
    store_lex "$past", $P1054
  if_1038_end:
.annotate "line", 381
    find_lex $P1080, "$/"
    find_lex $P1081, "$past"
    $P1082 = $P1080."!make"($P1081)
.annotate "line", 356
    .return ($P1082)
  control_1014:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1083, exception, "payload"
    .return ($P1083)
.end


.namespace ["NQP";"Actions"]
.sub "_block1055"  :anon :subid("65_1259177779.79485") :outer("64_1259177779.79485")
.annotate "line", 374
    new $P1057, "Undef"
    .lex "$scope", $P1057
.annotate "line", 375
    new $P1058, "Undef"
    .lex "$decl", $P1058
.annotate "line", 374
    find_dynamic_lex $P1061, "$*SCOPE"
    unless_null $P1061, vivify_352
    get_hll_global $P1061, "$SCOPE"
    unless_null $P1061, vivify_353
    die "Contextual $*SCOPE not found"
  vivify_353:
  vivify_352:
    set $S1062, $P1061
    iseq $I1063, $S1062, "our"
    if $I1063, if_1060
    new $P1065, "String"
    assign $P1065, "lexical"
    set $P1059, $P1065
    goto if_1060_end
  if_1060:
    new $P1064, "String"
    assign $P1064, "package"
    set $P1059, $P1064
  if_1060_end:
    store_lex "$scope", $P1059
.annotate "line", 375
    get_hll_global $P1066, ["PAST"], "Var"
    find_lex $P1067, "$name"
    find_lex $P1068, "$scope"
.annotate "line", 376
    find_lex $P1069, "$sigil"
    $P1070 = "sigiltype"($P1069)
    find_lex $P1071, "$/"
    $P1072 = $P1066."new"($P1067 :named("name"), $P1068 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P1070 :named("viviself"), $P1071 :named("node"))
.annotate "line", 375
    store_lex "$decl", $P1072
.annotate "line", 378
    find_lex $P1073, "$BLOCK"
    find_lex $P1074, "$name"
    find_lex $P1075, "$scope"
    $P1073."symbol"($P1074, $P1075 :named("scope"))
.annotate "line", 379
    find_lex $P1076, "$BLOCK"
    unless_null $P1076, vivify_354
    new $P1076, "ResizablePMCArray"
  vivify_354:
    set $P1077, $P1076[0]
    unless_null $P1077, vivify_355
    new $P1077, "Undef"
  vivify_355:
    find_lex $P1078, "$decl"
    $P1079 = $P1077."push"($P1078)
.annotate "line", 373
    .return ($P1079)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("66_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1087
.annotate "line", 384
    new $P1086, 'ExceptionHandler'
    set_addr $P1086, control_1085
    $P1086."handle_types"(58)
    push_eh $P1086
    .lex "self", self
    .lex "$/", param_1087
    find_lex $P1088, "$/"
    find_lex $P1089, "$/"
    unless_null $P1089, vivify_361
    new $P1089, "Hash"
  vivify_361:
    set $P1090, $P1089["routine_def"]
    unless_null $P1090, vivify_362
    new $P1090, "Undef"
  vivify_362:
    $P1091 = $P1090."ast"()
    $P1092 = $P1088."!make"($P1091)
    .return ($P1092)
  control_1085:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1093, exception, "payload"
    .return ($P1093)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("67_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1097
.annotate "line", 385
    new $P1096, 'ExceptionHandler'
    set_addr $P1096, control_1095
    $P1096."handle_types"(58)
    push_eh $P1096
    .lex "self", self
    .lex "$/", param_1097
    find_lex $P1098, "$/"
    find_lex $P1099, "$/"
    unless_null $P1099, vivify_363
    new $P1099, "Hash"
  vivify_363:
    set $P1100, $P1099["method_def"]
    unless_null $P1100, vivify_364
    new $P1100, "Undef"
  vivify_364:
    $P1101 = $P1100."ast"()
    $P1102 = $P1098."!make"($P1101)
    .return ($P1102)
  control_1095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1103, exception, "payload"
    .return ($P1103)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("68_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1107
.annotate "line", 387
    .const 'Sub' $P1118 = "69_1259177779.79485" 
    capture_lex $P1118
    new $P1106, 'ExceptionHandler'
    set_addr $P1106, control_1105
    $P1106."handle_types"(58)
    push_eh $P1106
    .lex "self", self
    .lex "$/", param_1107
.annotate "line", 388
    new $P1108, "Undef"
    .lex "$past", $P1108
    find_lex $P1109, "$/"
    unless_null $P1109, vivify_365
    new $P1109, "Hash"
  vivify_365:
    set $P1110, $P1109["blockoid"]
    unless_null $P1110, vivify_366
    new $P1110, "Undef"
  vivify_366:
    $P1111 = $P1110."ast"()
    store_lex "$past", $P1111
.annotate "line", 389
    find_lex $P1112, "$past"
    $P1112."blocktype"("declaration")
.annotate "line", 390
    find_lex $P1113, "$past"
    $P1113."control"("return_pir")
.annotate "line", 391
    find_lex $P1115, "$/"
    unless_null $P1115, vivify_367
    new $P1115, "Hash"
  vivify_367:
    set $P1116, $P1115["deflongname"]
    unless_null $P1116, vivify_368
    new $P1116, "Undef"
  vivify_368:
    unless $P1116, if_1114_end
    .const 'Sub' $P1118 = "69_1259177779.79485" 
    capture_lex $P1118
    $P1118()
  if_1114_end:
.annotate "line", 401
    find_lex $P1146, "$/"
    find_lex $P1147, "$past"
    $P1148 = $P1146."!make"($P1147)
.annotate "line", 387
    .return ($P1148)
  control_1105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1149, exception, "payload"
    .return ($P1149)
.end


.namespace ["NQP";"Actions"]
.sub "_block1117"  :anon :subid("69_1259177779.79485") :outer("68_1259177779.79485")
.annotate "line", 392
    new $P1119, "Undef"
    .lex "$name", $P1119
    find_lex $P1120, "$/"
    unless_null $P1120, vivify_369
    new $P1120, "Hash"
  vivify_369:
    set $P1121, $P1120["deflongname"]
    unless_null $P1121, vivify_370
    new $P1121, "ResizablePMCArray"
  vivify_370:
    set $P1122, $P1121[0]
    unless_null $P1122, vivify_371
    new $P1122, "Undef"
  vivify_371:
    $P1123 = $P1122."ast"()
    set $S1124, $P1123
    new $P1125, 'String'
    set $P1125, $S1124
    store_lex "$name", $P1125
.annotate "line", 393
    find_lex $P1126, "$past"
    find_lex $P1127, "$name"
    $P1126."name"($P1127)
.annotate "line", 394
    find_dynamic_lex $P1130, "$*SCOPE"
    unless_null $P1130, vivify_372
    get_hll_global $P1130, "$SCOPE"
    unless_null $P1130, vivify_373
    die "Contextual $*SCOPE not found"
  vivify_373:
  vivify_372:
    set $S1131, $P1130
    isne $I1132, $S1131, "our"
    if $I1132, if_1129
    new $P1128, 'Integer'
    set $P1128, $I1132
    goto if_1129_end
  if_1129:
.annotate "line", 395
    get_global $P1133, "@BLOCK"
    unless_null $P1133, vivify_374
    new $P1133, "ResizablePMCArray"
  vivify_374:
    set $P1134, $P1133[0]
    unless_null $P1134, vivify_375
    new $P1134, "ResizablePMCArray"
  vivify_375:
    set $P1135, $P1134[0]
    unless_null $P1135, vivify_376
    new $P1135, "Undef"
  vivify_376:
    get_hll_global $P1136, ["PAST"], "Var"
    find_lex $P1137, "$name"
    find_lex $P1138, "$past"
    $P1139 = $P1136."new"($P1137 :named("name"), 1 :named("isdecl"), $P1138 :named("viviself"), "lexical" :named("scope"))
    $P1135."push"($P1139)
.annotate "line", 397
    get_global $P1140, "@BLOCK"
    unless_null $P1140, vivify_377
    new $P1140, "ResizablePMCArray"
  vivify_377:
    set $P1141, $P1140[0]
    unless_null $P1141, vivify_378
    new $P1141, "Undef"
  vivify_378:
    find_lex $P1142, "$name"
    $P1141."symbol"($P1142, "lexical" :named("scope"))
.annotate "line", 398
    get_hll_global $P1143, ["PAST"], "Var"
    find_lex $P1144, "$name"
    $P1145 = $P1143."new"($P1144 :named("name"))
    store_lex "$past", $P1145
.annotate "line", 394
    set $P1128, $P1145
  if_1129_end:
.annotate "line", 391
    .return ($P1128)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("70_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1153
.annotate "line", 405
    .const 'Sub' $P1169 = "71_1259177779.79485" 
    capture_lex $P1169
    new $P1152, 'ExceptionHandler'
    set_addr $P1152, control_1151
    $P1152."handle_types"(58)
    push_eh $P1152
    .lex "self", self
    .lex "$/", param_1153
.annotate "line", 406
    new $P1154, "Undef"
    .lex "$past", $P1154
    find_lex $P1155, "$/"
    unless_null $P1155, vivify_379
    new $P1155, "Hash"
  vivify_379:
    set $P1156, $P1155["blockoid"]
    unless_null $P1156, vivify_380
    new $P1156, "Undef"
  vivify_380:
    $P1157 = $P1156."ast"()
    store_lex "$past", $P1157
.annotate "line", 407
    find_lex $P1158, "$past"
    $P1158."blocktype"("method")
.annotate "line", 408
    find_lex $P1159, "$past"
    $P1159."control"("return_pir")
.annotate "line", 409
    find_lex $P1160, "$past"
    unless_null $P1160, vivify_381
    new $P1160, "ResizablePMCArray"
  vivify_381:
    set $P1161, $P1160[0]
    unless_null $P1161, vivify_382
    new $P1161, "Undef"
  vivify_382:
    get_hll_global $P1162, ["PAST"], "Op"
    $P1163 = $P1162."new"("    .lex \"self\", self" :named("inline"))
    $P1161."unshift"($P1163)
.annotate "line", 410
    find_lex $P1164, "$past"
    $P1164."symbol"("self", "lexical" :named("scope"))
.annotate "line", 411
    find_lex $P1166, "$/"
    unless_null $P1166, vivify_383
    new $P1166, "Hash"
  vivify_383:
    set $P1167, $P1166["deflongname"]
    unless_null $P1167, vivify_384
    new $P1167, "Undef"
  vivify_384:
    unless $P1167, if_1165_end
    .const 'Sub' $P1169 = "71_1259177779.79485" 
    capture_lex $P1169
    $P1169()
  if_1165_end:
.annotate "line", 415
    find_lex $P1180, "$/"
    find_lex $P1181, "$past"
    $P1182 = $P1180."!make"($P1181)
.annotate "line", 405
    .return ($P1182)
  control_1151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1183, exception, "payload"
    .return ($P1183)
.end


.namespace ["NQP";"Actions"]
.sub "_block1168"  :anon :subid("71_1259177779.79485") :outer("70_1259177779.79485")
.annotate "line", 412
    new $P1170, "Undef"
    .lex "$name", $P1170
    find_lex $P1171, "$/"
    unless_null $P1171, vivify_385
    new $P1171, "Hash"
  vivify_385:
    set $P1172, $P1171["deflongname"]
    unless_null $P1172, vivify_386
    new $P1172, "ResizablePMCArray"
  vivify_386:
    set $P1173, $P1172[0]
    unless_null $P1173, vivify_387
    new $P1173, "Undef"
  vivify_387:
    $P1174 = $P1173."ast"()
    set $S1175, $P1174
    new $P1176, 'String'
    set $P1176, $S1175
    store_lex "$name", $P1176
.annotate "line", 413
    find_lex $P1177, "$past"
    find_lex $P1178, "$name"
    $P1179 = $P1177."name"($P1178)
.annotate "line", 411
    .return ($P1179)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("72_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1187
.annotate "line", 419
    .const 'Sub' $P1198 = "73_1259177779.79485" 
    capture_lex $P1198
    new $P1186, 'ExceptionHandler'
    set_addr $P1186, control_1185
    $P1186."handle_types"(58)
    push_eh $P1186
    .lex "self", self
    .lex "$/", param_1187
.annotate "line", 420
    new $P1188, "Undef"
    .lex "$BLOCKINIT", $P1188
    get_global $P1189, "@BLOCK"
    unless_null $P1189, vivify_388
    new $P1189, "ResizablePMCArray"
  vivify_388:
    set $P1190, $P1189[0]
    unless_null $P1190, vivify_389
    new $P1190, "ResizablePMCArray"
  vivify_389:
    set $P1191, $P1190[0]
    unless_null $P1191, vivify_390
    new $P1191, "Undef"
  vivify_390:
    store_lex "$BLOCKINIT", $P1191
.annotate "line", 421
    find_lex $P1193, "$/"
    unless_null $P1193, vivify_391
    new $P1193, "Hash"
  vivify_391:
    set $P1194, $P1193["parameter"]
    unless_null $P1194, vivify_392
    new $P1194, "Undef"
  vivify_392:
    defined $I1195, $P1194
    unless $I1195, for_undef_393
    iter $P1192, $P1194
    new $P1205, 'ExceptionHandler'
    set_addr $P1205, loop1204_handler
    $P1205."handle_types"(65, 67, 66)
    push_eh $P1205
  loop1204_test:
    unless $P1192, loop1204_done
    shift $P1196, $P1192
  loop1204_redo:
    .const 'Sub' $P1198 = "73_1259177779.79485" 
    capture_lex $P1198
    $P1198($P1196)
  loop1204_next:
    goto loop1204_test
  loop1204_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1206, exception, 'type'
    eq $P1206, 65, loop1204_next
    eq $P1206, 67, loop1204_redo
  loop1204_done:
    pop_eh 
  for_undef_393:
.annotate "line", 419
    .return ($P1192)
  control_1185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1207, exception, "payload"
    .return ($P1207)
.end


.namespace ["NQP";"Actions"]
.sub "_block1197"  :anon :subid("73_1259177779.79485") :outer("72_1259177779.79485")
    .param pmc param_1199
.annotate "line", 421
    .lex "$_", param_1199
    find_lex $P1200, "$BLOCKINIT"
    find_lex $P1201, "$_"
    $P1202 = $P1201."ast"()
    $P1203 = $P1200."push"($P1202)
    .return ($P1203)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("74_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1211
.annotate "line", 424
    new $P1210, 'ExceptionHandler'
    set_addr $P1210, control_1209
    $P1210."handle_types"(58)
    push_eh $P1210
    .lex "self", self
    .lex "$/", param_1211
.annotate "line", 425
    new $P1212, "Undef"
    .lex "$quant", $P1212
.annotate "line", 426
    new $P1213, "Undef"
    .lex "$past", $P1213
.annotate "line", 425
    find_lex $P1214, "$/"
    unless_null $P1214, vivify_394
    new $P1214, "Hash"
  vivify_394:
    set $P1215, $P1214["quant"]
    unless_null $P1215, vivify_395
    new $P1215, "Undef"
  vivify_395:
    store_lex "$quant", $P1215
    find_lex $P1216, "$past"
.annotate "line", 427
    find_lex $P1218, "$/"
    unless_null $P1218, vivify_396
    new $P1218, "Hash"
  vivify_396:
    set $P1219, $P1218["named_param"]
    unless_null $P1219, vivify_397
    new $P1219, "Undef"
  vivify_397:
    if $P1219, if_1217
.annotate "line", 434
    find_lex $P1233, "$/"
    unless_null $P1233, vivify_398
    new $P1233, "Hash"
  vivify_398:
    set $P1234, $P1233["param_var"]
    unless_null $P1234, vivify_399
    new $P1234, "Undef"
  vivify_399:
    $P1235 = $P1234."ast"()
    store_lex "$past", $P1235
.annotate "line", 435
    find_lex $P1237, "$quant"
    set $S1238, $P1237
    iseq $I1239, $S1238, "*"
    if $I1239, if_1236
.annotate "line", 439
    find_lex $P1248, "$quant"
    set $S1249, $P1248
    iseq $I1250, $S1249, "?"
    unless $I1250, if_1247_end
.annotate "line", 440
    find_lex $P1251, "$past"
    find_lex $P1252, "$/"
    unless_null $P1252, vivify_400
    new $P1252, "Hash"
  vivify_400:
    set $P1253, $P1252["param_var"]
    unless_null $P1253, vivify_401
    new $P1253, "Hash"
  vivify_401:
    set $P1254, $P1253["sigil"]
    unless_null $P1254, vivify_402
    new $P1254, "Undef"
  vivify_402:
    $P1255 = "sigiltype"($P1254)
    $P1251."viviself"($P1255)
  if_1247_end:
.annotate "line", 439
    goto if_1236_end
  if_1236:
.annotate "line", 436
    find_lex $P1240, "$past"
    $P1240."slurpy"(1)
.annotate "line", 437
    find_lex $P1241, "$past"
    find_lex $P1242, "$/"
    unless_null $P1242, vivify_403
    new $P1242, "Hash"
  vivify_403:
    set $P1243, $P1242["param_var"]
    unless_null $P1243, vivify_404
    new $P1243, "Hash"
  vivify_404:
    set $P1244, $P1243["sigil"]
    unless_null $P1244, vivify_405
    new $P1244, "Undef"
  vivify_405:
    set $S1245, $P1244
    iseq $I1246, $S1245, "%"
    $P1241."named"($I1246)
  if_1236_end:
.annotate "line", 433
    goto if_1217_end
  if_1217:
.annotate "line", 428
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_406
    new $P1220, "Hash"
  vivify_406:
    set $P1221, $P1220["named_param"]
    unless_null $P1221, vivify_407
    new $P1221, "Undef"
  vivify_407:
    $P1222 = $P1221."ast"()
    store_lex "$past", $P1222
.annotate "line", 429
    find_lex $P1224, "$quant"
    set $S1225, $P1224
    isne $I1226, $S1225, "!"
    unless $I1226, if_1223_end
.annotate "line", 430
    find_lex $P1227, "$past"
    find_lex $P1228, "$/"
    unless_null $P1228, vivify_408
    new $P1228, "Hash"
  vivify_408:
    set $P1229, $P1228["named_param"]
    unless_null $P1229, vivify_409
    new $P1229, "Hash"
  vivify_409:
    set $P1230, $P1229["param_var"]
    unless_null $P1230, vivify_410
    new $P1230, "Hash"
  vivify_410:
    set $P1231, $P1230["sigil"]
    unless_null $P1231, vivify_411
    new $P1231, "Undef"
  vivify_411:
    $P1232 = "sigiltype"($P1231)
    $P1227."viviself"($P1232)
  if_1223_end:
  if_1217_end:
.annotate "line", 443
    find_lex $P1257, "$/"
    unless_null $P1257, vivify_412
    new $P1257, "Hash"
  vivify_412:
    set $P1258, $P1257["default_value"]
    unless_null $P1258, vivify_413
    new $P1258, "Undef"
  vivify_413:
    unless $P1258, if_1256_end
.annotate "line", 444
    find_lex $P1260, "$quant"
    set $S1261, $P1260
    iseq $I1262, $S1261, "*"
    unless $I1262, if_1259_end
.annotate "line", 445
    find_lex $P1263, "$/"
    $P1264 = $P1263."CURSOR"()
    $P1264."panic"("Can't put default on slurpy parameter")
  if_1259_end:
.annotate "line", 447
    find_lex $P1266, "$quant"
    set $S1267, $P1266
    iseq $I1268, $S1267, "!"
    unless $I1268, if_1265_end
.annotate "line", 448
    find_lex $P1269, "$/"
    $P1270 = $P1269."CURSOR"()
    $P1270."panic"("Can't put default on required parameter")
  if_1265_end:
.annotate "line", 450
    find_lex $P1271, "$past"
    find_lex $P1272, "$/"
    unless_null $P1272, vivify_414
    new $P1272, "Hash"
  vivify_414:
    set $P1273, $P1272["default_value"]
    unless_null $P1273, vivify_415
    new $P1273, "ResizablePMCArray"
  vivify_415:
    set $P1274, $P1273[0]
    unless_null $P1274, vivify_416
    new $P1274, "Hash"
  vivify_416:
    set $P1275, $P1274["EXPR"]
    unless_null $P1275, vivify_417
    new $P1275, "Undef"
  vivify_417:
    $P1276 = $P1275."ast"()
    $P1271."viviself"($P1276)
  if_1256_end:
.annotate "line", 452
    find_lex $P1278, "$past"
    $P1279 = $P1278."viviself"()
    if $P1279, unless_1277_end
    get_global $P1280, "@BLOCK"
    unless_null $P1280, vivify_418
    new $P1280, "ResizablePMCArray"
  vivify_418:
    set $P1281, $P1280[0]
    unless_null $P1281, vivify_419
    new $P1281, "Undef"
  vivify_419:
    get_global $P1282, "@BLOCK"
    unless_null $P1282, vivify_420
    new $P1282, "ResizablePMCArray"
  vivify_420:
    set $P1283, $P1282[0]
    unless_null $P1283, vivify_421
    new $P1283, "Undef"
  vivify_421:
    $P1284 = $P1283."arity"()
    set $N1285, $P1284
    new $P1286, 'Float'
    set $P1286, $N1285
    add $P1287, $P1286, 1
    $P1281."arity"($P1287)
  unless_1277_end:
.annotate "line", 453
    find_lex $P1288, "$/"
    find_lex $P1289, "$past"
    $P1290 = $P1288."!make"($P1289)
.annotate "line", 424
    .return ($P1290)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1291, exception, "payload"
    .return ($P1291)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("75_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1295
.annotate "line", 456
    new $P1294, 'ExceptionHandler'
    set_addr $P1294, control_1293
    $P1294."handle_types"(58)
    push_eh $P1294
    .lex "self", self
    .lex "$/", param_1295
.annotate "line", 457
    new $P1296, "Undef"
    .lex "$name", $P1296
.annotate "line", 458
    new $P1297, "Undef"
    .lex "$past", $P1297
.annotate "line", 457
    find_lex $P1298, "$/"
    set $S1299, $P1298
    new $P1300, 'String'
    set $P1300, $S1299
    store_lex "$name", $P1300
.annotate "line", 458
    get_hll_global $P1301, ["PAST"], "Var"
    find_lex $P1302, "$name"
    find_lex $P1303, "$/"
    $P1304 = $P1301."new"($P1302 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1303 :named("node"))
    store_lex "$past", $P1304
.annotate "line", 460
    get_global $P1305, "@BLOCK"
    unless_null $P1305, vivify_422
    new $P1305, "ResizablePMCArray"
  vivify_422:
    set $P1306, $P1305[0]
    unless_null $P1306, vivify_423
    new $P1306, "Undef"
  vivify_423:
    find_lex $P1307, "$name"
    $P1306."symbol"($P1307, "lexical" :named("scope"))
.annotate "line", 461
    find_lex $P1308, "$/"
    find_lex $P1309, "$past"
    $P1310 = $P1308."!make"($P1309)
.annotate "line", 456
    .return ($P1310)
  control_1293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1311, exception, "payload"
    .return ($P1311)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("76_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1315
.annotate "line", 464
    new $P1314, 'ExceptionHandler'
    set_addr $P1314, control_1313
    $P1314."handle_types"(58)
    push_eh $P1314
    .lex "self", self
    .lex "$/", param_1315
.annotate "line", 465
    new $P1316, "Undef"
    .lex "$past", $P1316
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_424
    new $P1317, "Hash"
  vivify_424:
    set $P1318, $P1317["param_var"]
    unless_null $P1318, vivify_425
    new $P1318, "Undef"
  vivify_425:
    $P1319 = $P1318."ast"()
    store_lex "$past", $P1319
.annotate "line", 466
    find_lex $P1320, "$past"
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_426
    new $P1321, "Hash"
  vivify_426:
    set $P1322, $P1321["param_var"]
    unless_null $P1322, vivify_427
    new $P1322, "Hash"
  vivify_427:
    set $P1323, $P1322["name"]
    unless_null $P1323, vivify_428
    new $P1323, "Undef"
  vivify_428:
    set $S1324, $P1323
    $P1320."named"($S1324)
.annotate "line", 467
    find_lex $P1325, "$/"
    find_lex $P1326, "$past"
    $P1327 = $P1325."!make"($P1326)
.annotate "line", 464
    .return ($P1327)
  control_1313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1328, exception, "payload"
    .return ($P1328)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("77_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1332
    .param pmc param_1333 :optional
    .param int has_param_1333 :opt_flag
.annotate "line", 470
    .const 'Sub' $P1350 = "78_1259177779.79485" 
    capture_lex $P1350
    new $P1331, 'ExceptionHandler'
    set_addr $P1331, control_1330
    $P1331."handle_types"(58)
    push_eh $P1331
    .lex "self", self
    .lex "$/", param_1332
    if has_param_1333, optparam_429
    new $P1334, "Undef"
    set param_1333, $P1334
  optparam_429:
    .lex "$key", param_1333
.annotate "line", 471
    new $P1335, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1335
.annotate "line", 474
    new $P1336, "Undef"
    .lex "$name", $P1336
.annotate "line", 475
    new $P1337, "Undef"
    .lex "$past", $P1337
.annotate "line", 471

        $P1338 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1338
.annotate "line", 474
    find_lex $P1339, "$/"
    unless_null $P1339, vivify_430
    new $P1339, "Hash"
  vivify_430:
    set $P1340, $P1339["deflongname"]
    unless_null $P1340, vivify_431
    new $P1340, "Undef"
  vivify_431:
    $P1341 = $P1340."ast"()
    set $S1342, $P1341
    new $P1343, 'String'
    set $P1343, $S1342
    store_lex "$name", $P1343
    find_lex $P1344, "$past"
.annotate "line", 476
    find_lex $P1346, "$key"
    set $S1347, $P1346
    iseq $I1348, $S1347, "open"
    if $I1348, if_1345
.annotate "line", 489
    find_lex $P1378, "$/"
    unless_null $P1378, vivify_432
    new $P1378, "Hash"
  vivify_432:
    set $P1379, $P1378["proto"]
    unless_null $P1379, vivify_433
    new $P1379, "Undef"
  vivify_433:
    if $P1379, if_1377
.annotate "line", 518
    get_hll_global $P1402, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1403, "$/"
    unless_null $P1403, vivify_434
    new $P1403, "Hash"
  vivify_434:
    set $P1404, $P1403["p6regex"]
    unless_null $P1404, vivify_435
    new $P1404, "Undef"
  vivify_435:
    $P1405 = $P1404."ast"()
    get_global $P1406, "@BLOCK"
    $P1407 = $P1406."shift"()
    $P1408 = $P1402($P1405, $P1407)
    store_lex "$past", $P1408
.annotate "line", 519
    find_lex $P1409, "$past"
    find_lex $P1410, "$name"
    $P1409."name"($P1410)
.annotate "line", 520
    find_lex $P1411, "@MODIFIERS"
    $P1411."shift"()
.annotate "line", 516
    goto if_1377_end
  if_1377:
.annotate "line", 491
    get_hll_global $P1380, ["PAST"], "Stmts"
.annotate "line", 492
    get_hll_global $P1381, ["PAST"], "Block"
    find_lex $P1382, "$name"
.annotate "line", 493
    get_hll_global $P1383, ["PAST"], "Op"
.annotate "line", 494
    get_hll_global $P1384, ["PAST"], "Var"
    $P1385 = $P1384."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1386, "$name"
    $P1387 = $P1383."new"($P1385, $P1386, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 493
    find_lex $P1388, "$/"
    $P1389 = $P1381."new"($P1387, $P1382 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1388 :named("node"))
.annotate "line", 503
    get_hll_global $P1390, ["PAST"], "Block"
    new $P1391, "String"
    assign $P1391, "!PREFIX__"
    find_lex $P1392, "$name"
    concat $P1393, $P1391, $P1392
.annotate "line", 504
    get_hll_global $P1394, ["PAST"], "Op"
.annotate "line", 505
    get_hll_global $P1395, ["PAST"], "Var"
    $P1396 = $P1395."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1397, "$name"
    $P1398 = $P1394."new"($P1396, $P1397, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 504
    find_lex $P1399, "$/"
    $P1400 = $P1390."new"($P1398, $P1393 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1399 :named("node"))
.annotate "line", 503
    $P1401 = $P1380."new"($P1389, $P1400)
.annotate "line", 491
    store_lex "$past", $P1401
  if_1377_end:
.annotate "line", 489
    goto if_1345_end
  if_1345:
.annotate "line", 476
    .const 'Sub' $P1350 = "78_1259177779.79485" 
    capture_lex $P1350
    $P1350()
  if_1345_end:
.annotate "line", 522
    find_lex $P1412, "$/"
    find_lex $P1413, "$past"
    $P1414 = $P1412."!make"($P1413)
.annotate "line", 470
    .return ($P1414)
  control_1330:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1415, exception, "payload"
    .return ($P1415)
.end


.namespace ["NQP";"Actions"]
.sub "_block1349"  :anon :subid("78_1259177779.79485") :outer("77_1259177779.79485")
.annotate "line", 477
    new $P1351, "Hash"
    .lex "%h", $P1351
.annotate "line", 476
    find_lex $P1352, "%h"
.annotate "line", 478
    find_lex $P1354, "$/"
    unless_null $P1354, vivify_436
    new $P1354, "Hash"
  vivify_436:
    set $P1355, $P1354["sym"]
    unless_null $P1355, vivify_437
    new $P1355, "Undef"
  vivify_437:
    set $S1356, $P1355
    iseq $I1357, $S1356, "token"
    unless $I1357, if_1353_end
    new $P1358, "Integer"
    assign $P1358, 1
    find_lex $P1359, "%h"
    unless_null $P1359, vivify_438
    new $P1359, "Hash"
    store_lex "%h", $P1359
  vivify_438:
    set $P1359["r"], $P1358
  if_1353_end:
.annotate "line", 479
    find_lex $P1361, "$/"
    unless_null $P1361, vivify_439
    new $P1361, "Hash"
  vivify_439:
    set $P1362, $P1361["sym"]
    unless_null $P1362, vivify_440
    new $P1362, "Undef"
  vivify_440:
    set $S1363, $P1362
    iseq $I1364, $S1363, "rule"
    unless $I1364, if_1360_end
    new $P1365, "Integer"
    assign $P1365, 1
    find_lex $P1366, "%h"
    unless_null $P1366, vivify_441
    new $P1366, "Hash"
    store_lex "%h", $P1366
  vivify_441:
    set $P1366["r"], $P1365
    new $P1367, "Integer"
    assign $P1367, 1
    find_lex $P1368, "%h"
    unless_null $P1368, vivify_442
    new $P1368, "Hash"
    store_lex "%h", $P1368
  vivify_442:
    set $P1368["s"], $P1367
  if_1360_end:
.annotate "line", 480
    find_lex $P1369, "@MODIFIERS"
    find_lex $P1370, "%h"
    $P1369."unshift"($P1370)
.annotate "line", 481

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 485
    get_global $P1371, "@BLOCK"
    unless_null $P1371, vivify_443
    new $P1371, "ResizablePMCArray"
  vivify_443:
    set $P1372, $P1371[0]
    unless_null $P1372, vivify_444
    new $P1372, "Undef"
  vivify_444:
    $P1372."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 486
    get_global $P1373, "@BLOCK"
    unless_null $P1373, vivify_445
    new $P1373, "ResizablePMCArray"
  vivify_445:
    set $P1374, $P1373[0]
    unless_null $P1374, vivify_446
    new $P1374, "Undef"
  vivify_446:
    $P1374."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 487
    new $P1375, "Exception"
    set $P1375['type'], 58
    new $P1376, "Integer"
    assign $P1376, 0
    setattribute $P1375, 'payload', $P1376
    throw $P1375
.annotate "line", 476
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("79_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1419
.annotate "line", 526
    new $P1418, 'ExceptionHandler'
    set_addr $P1418, control_1417
    $P1418."handle_types"(58)
    push_eh $P1418
    .lex "self", self
    .lex "$/", param_1419
.annotate "line", 527
    new $P1420, "Undef"
    .lex "$past", $P1420
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_447
    new $P1423, "Hash"
  vivify_447:
    set $P1424, $P1423["args"]
    unless_null $P1424, vivify_448
    new $P1424, "Undef"
  vivify_448:
    if $P1424, if_1422
    get_hll_global $P1429, ["PAST"], "Op"
    find_lex $P1430, "$/"
    $P1431 = $P1429."new"($P1430 :named("node"))
    set $P1421, $P1431
    goto if_1422_end
  if_1422:
    find_lex $P1425, "$/"
    unless_null $P1425, vivify_449
    new $P1425, "Hash"
  vivify_449:
    set $P1426, $P1425["args"]
    unless_null $P1426, vivify_450
    new $P1426, "ResizablePMCArray"
  vivify_450:
    set $P1427, $P1426[0]
    unless_null $P1427, vivify_451
    new $P1427, "Undef"
  vivify_451:
    $P1428 = $P1427."ast"()
    set $P1421, $P1428
  if_1422_end:
    store_lex "$past", $P1421
.annotate "line", 528
    find_lex $P1432, "$past"
    find_lex $P1435, "$/"
    unless_null $P1435, vivify_452
    new $P1435, "Hash"
  vivify_452:
    set $P1436, $P1435["quote"]
    unless_null $P1436, vivify_453
    new $P1436, "Undef"
  vivify_453:
    if $P1436, if_1434
    find_lex $P1440, "$/"
    unless_null $P1440, vivify_454
    new $P1440, "Hash"
  vivify_454:
    set $P1441, $P1440["longname"]
    unless_null $P1441, vivify_455
    new $P1441, "Undef"
  vivify_455:
    set $S1442, $P1441
    new $P1433, 'String'
    set $P1433, $S1442
    goto if_1434_end
  if_1434:
    find_lex $P1437, "$/"
    unless_null $P1437, vivify_456
    new $P1437, "Hash"
  vivify_456:
    set $P1438, $P1437["quote"]
    unless_null $P1438, vivify_457
    new $P1438, "Undef"
  vivify_457:
    $P1439 = $P1438."ast"()
    set $P1433, $P1439
  if_1434_end:
    $P1432."name"($P1433)
.annotate "line", 529
    find_lex $P1443, "$past"
    $P1443."pasttype"("callmethod")
.annotate "line", 530
    find_lex $P1444, "$/"
    find_lex $P1445, "$past"
    $P1446 = $P1444."!make"($P1445)
.annotate "line", 526
    .return ($P1446)
  control_1417:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1447, exception, "payload"
    .return ($P1447)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("80_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1451
.annotate "line", 535
    new $P1450, 'ExceptionHandler'
    set_addr $P1450, control_1449
    $P1450."handle_types"(58)
    push_eh $P1450
    .lex "self", self
    .lex "$/", param_1451
.annotate "line", 536
    find_lex $P1452, "$/"
    get_hll_global $P1453, ["PAST"], "Var"
    $P1454 = $P1453."new"("self" :named("name"))
    $P1455 = $P1452."!make"($P1454)
.annotate "line", 535
    .return ($P1455)
  control_1449:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1456, exception, "payload"
    .return ($P1456)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("81_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1460
.annotate "line", 539
    new $P1459, 'ExceptionHandler'
    set_addr $P1459, control_1458
    $P1459."handle_types"(58)
    push_eh $P1459
    .lex "self", self
    .lex "$/", param_1460
.annotate "line", 540
    new $P1461, "Undef"
    .lex "$past", $P1461
    find_lex $P1462, "$/"
    unless_null $P1462, vivify_458
    new $P1462, "Hash"
  vivify_458:
    set $P1463, $P1462["args"]
    unless_null $P1463, vivify_459
    new $P1463, "Undef"
  vivify_459:
    $P1464 = $P1463."ast"()
    store_lex "$past", $P1464
.annotate "line", 541
    find_lex $P1465, "$past"
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_460
    new $P1466, "Hash"
  vivify_460:
    set $P1467, $P1466["identifier"]
    unless_null $P1467, vivify_461
    new $P1467, "Undef"
  vivify_461:
    set $S1468, $P1467
    $P1465."name"($S1468)
.annotate "line", 542
    find_lex $P1469, "$/"
    find_lex $P1470, "$past"
    $P1471 = $P1469."!make"($P1470)
.annotate "line", 539
    .return ($P1471)
  control_1458:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1472, exception, "payload"
    .return ($P1472)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("82_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1476
.annotate "line", 545
    new $P1475, 'ExceptionHandler'
    set_addr $P1475, control_1474
    $P1475."handle_types"(58)
    push_eh $P1475
    .lex "self", self
    .lex "$/", param_1476
.annotate "line", 546
    new $P1477, "ResizablePMCArray"
    .lex "@ns", $P1477
.annotate "line", 547
    new $P1478, "Undef"
    .lex "$name", $P1478
.annotate "line", 549
    new $P1479, "Undef"
    .lex "$var", $P1479
.annotate "line", 551
    new $P1480, "Undef"
    .lex "$past", $P1480
.annotate "line", 546
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_462
    new $P1481, "Hash"
  vivify_462:
    set $P1482, $P1481["name"]
    unless_null $P1482, vivify_463
    new $P1482, "Hash"
  vivify_463:
    set $P1483, $P1482["identifier"]
    unless_null $P1483, vivify_464
    new $P1483, "Undef"
  vivify_464:
    clone $P1484, $P1483
    store_lex "@ns", $P1484
.annotate "line", 547
    find_lex $P1485, "@ns"
    $P1486 = $P1485."pop"()
    store_lex "$name", $P1486
.annotate "line", 548
    find_lex $P1490, "@ns"
    if $P1490, if_1489
    set $P1488, $P1490
    goto if_1489_end
  if_1489:
    find_lex $P1491, "@ns"
    unless_null $P1491, vivify_465
    new $P1491, "ResizablePMCArray"
  vivify_465:
    set $P1492, $P1491[0]
    unless_null $P1492, vivify_466
    new $P1492, "Undef"
  vivify_466:
    set $S1493, $P1492
    iseq $I1494, $S1493, "GLOBAL"
    new $P1488, 'Integer'
    set $P1488, $I1494
  if_1489_end:
    unless $P1488, if_1487_end
    find_lex $P1495, "@ns"
    $P1495."shift"()
  if_1487_end:
.annotate "line", 550
    get_hll_global $P1496, ["PAST"], "Var"
    find_lex $P1497, "$name"
    set $S1498, $P1497
    find_lex $P1499, "@ns"
    $P1500 = $P1496."new"($S1498 :named("name"), $P1499 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1500
.annotate "line", 551
    find_lex $P1501, "$var"
    store_lex "$past", $P1501
.annotate "line", 552
    find_lex $P1503, "$/"
    unless_null $P1503, vivify_467
    new $P1503, "Hash"
  vivify_467:
    set $P1504, $P1503["args"]
    unless_null $P1504, vivify_468
    new $P1504, "Undef"
  vivify_468:
    unless $P1504, if_1502_end
.annotate "line", 553
    find_lex $P1505, "$/"
    unless_null $P1505, vivify_469
    new $P1505, "Hash"
  vivify_469:
    set $P1506, $P1505["args"]
    unless_null $P1506, vivify_470
    new $P1506, "ResizablePMCArray"
  vivify_470:
    set $P1507, $P1506[0]
    unless_null $P1507, vivify_471
    new $P1507, "Undef"
  vivify_471:
    $P1508 = $P1507."ast"()
    store_lex "$past", $P1508
.annotate "line", 554
    find_lex $P1509, "$past"
    find_lex $P1510, "$var"
    $P1509."unshift"($P1510)
  if_1502_end:
.annotate "line", 556
    find_lex $P1511, "$/"
    find_lex $P1512, "$past"
    $P1513 = $P1511."!make"($P1512)
.annotate "line", 545
    .return ($P1513)
  control_1474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1514, exception, "payload"
    .return ($P1514)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("83_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1518
.annotate "line", 559
    new $P1517, 'ExceptionHandler'
    set_addr $P1517, control_1516
    $P1517."handle_types"(58)
    push_eh $P1517
    .lex "self", self
    .lex "$/", param_1518
.annotate "line", 560
    new $P1519, "Undef"
    .lex "$past", $P1519
.annotate "line", 561
    new $P1520, "Undef"
    .lex "$pirop", $P1520
.annotate "line", 560
    find_lex $P1523, "$/"
    unless_null $P1523, vivify_472
    new $P1523, "Hash"
  vivify_472:
    set $P1524, $P1523["args"]
    unless_null $P1524, vivify_473
    new $P1524, "Undef"
  vivify_473:
    if $P1524, if_1522
    get_hll_global $P1529, ["PAST"], "Op"
    find_lex $P1530, "$/"
    $P1531 = $P1529."new"($P1530 :named("node"))
    set $P1521, $P1531
    goto if_1522_end
  if_1522:
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_474
    new $P1525, "Hash"
  vivify_474:
    set $P1526, $P1525["args"]
    unless_null $P1526, vivify_475
    new $P1526, "ResizablePMCArray"
  vivify_475:
    set $P1527, $P1526[0]
    unless_null $P1527, vivify_476
    new $P1527, "Undef"
  vivify_476:
    $P1528 = $P1527."ast"()
    set $P1521, $P1528
  if_1522_end:
    store_lex "$past", $P1521
.annotate "line", 561
    find_lex $P1532, "$/"
    unless_null $P1532, vivify_477
    new $P1532, "Hash"
  vivify_477:
    set $P1533, $P1532["op"]
    unless_null $P1533, vivify_478
    new $P1533, "Undef"
  vivify_478:
    set $S1534, $P1533
    new $P1535, 'String'
    set $P1535, $S1534
    store_lex "$pirop", $P1535
.annotate "line", 562

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1536 = box $S0
    
    store_lex "$pirop", $P1536
.annotate "line", 569
    find_lex $P1537, "$past"
    find_lex $P1538, "$pirop"
    $P1537."pirop"($P1538)
.annotate "line", 570
    find_lex $P1539, "$past"
    $P1539."pasttype"("pirop")
.annotate "line", 571
    find_lex $P1540, "$/"
    find_lex $P1541, "$past"
    $P1542 = $P1540."!make"($P1541)
.annotate "line", 559
    .return ($P1542)
  control_1516:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1543, exception, "payload"
    .return ($P1543)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("84_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1547
.annotate "line", 574
    new $P1546, 'ExceptionHandler'
    set_addr $P1546, control_1545
    $P1546."handle_types"(58)
    push_eh $P1546
    .lex "self", self
    .lex "$/", param_1547
    find_lex $P1548, "$/"
    find_lex $P1549, "$/"
    unless_null $P1549, vivify_479
    new $P1549, "Hash"
  vivify_479:
    set $P1550, $P1549["arglist"]
    unless_null $P1550, vivify_480
    new $P1550, "Undef"
  vivify_480:
    $P1551 = $P1550."ast"()
    $P1552 = $P1548."!make"($P1551)
    .return ($P1552)
  control_1545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1553, exception, "payload"
    .return ($P1553)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("85_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1557
.annotate "line", 576
    .const 'Sub' $P1568 = "86_1259177779.79485" 
    capture_lex $P1568
    new $P1556, 'ExceptionHandler'
    set_addr $P1556, control_1555
    $P1556."handle_types"(58)
    push_eh $P1556
    .lex "self", self
    .lex "$/", param_1557
.annotate "line", 577
    new $P1558, "Undef"
    .lex "$past", $P1558
.annotate "line", 585
    new $P1559, "Undef"
    .lex "$i", $P1559
.annotate "line", 586
    new $P1560, "Undef"
    .lex "$n", $P1560
.annotate "line", 577
    get_hll_global $P1561, ["PAST"], "Op"
    find_lex $P1562, "$/"
    $P1563 = $P1561."new"("call" :named("pasttype"), $P1562 :named("node"))
    store_lex "$past", $P1563
.annotate "line", 578
    find_lex $P1565, "$/"
    unless_null $P1565, vivify_481
    new $P1565, "Hash"
  vivify_481:
    set $P1566, $P1565["EXPR"]
    unless_null $P1566, vivify_482
    new $P1566, "Undef"
  vivify_482:
    unless $P1566, if_1564_end
    .const 'Sub' $P1568 = "86_1259177779.79485" 
    capture_lex $P1568
    $P1568()
  if_1564_end:
.annotate "line", 585
    new $P1600, "Integer"
    assign $P1600, 0
    store_lex "$i", $P1600
.annotate "line", 586
    find_lex $P1601, "$past"
    $P1602 = $P1601."list"()
    set $N1603, $P1602
    new $P1604, 'Float'
    set $P1604, $N1603
    store_lex "$n", $P1604
.annotate "line", 587
    new $P1632, 'ExceptionHandler'
    set_addr $P1632, loop1631_handler
    $P1632."handle_types"(65, 67, 66)
    push_eh $P1632
  loop1631_test:
    find_lex $P1605, "$i"
    set $N1606, $P1605
    find_lex $P1607, "$n"
    set $N1608, $P1607
    islt $I1609, $N1606, $N1608
    unless $I1609, loop1631_done
  loop1631_redo:
.annotate "line", 588
    find_lex $P1611, "$i"
    set $I1612, $P1611
    find_lex $P1613, "$past"
    unless_null $P1613, vivify_486
    new $P1613, "ResizablePMCArray"
  vivify_486:
    set $P1614, $P1613[$I1612]
    unless_null $P1614, vivify_487
    new $P1614, "Undef"
  vivify_487:
    $S1615 = $P1614."name"()
    iseq $I1616, $S1615, "&prefix:<|>"
    unless $I1616, if_1610_end
.annotate "line", 589
    find_lex $P1617, "$i"
    set $I1618, $P1617
    find_lex $P1619, "$past"
    unless_null $P1619, vivify_488
    new $P1619, "ResizablePMCArray"
  vivify_488:
    set $P1620, $P1619[$I1618]
    unless_null $P1620, vivify_489
    new $P1620, "ResizablePMCArray"
  vivify_489:
    set $P1621, $P1620[0]
    unless_null $P1621, vivify_490
    new $P1621, "Undef"
  vivify_490:
    find_lex $P1622, "$i"
    set $I1623, $P1622
    find_lex $P1624, "$past"
    unless_null $P1624, vivify_491
    new $P1624, "ResizablePMCArray"
    store_lex "$past", $P1624
  vivify_491:
    set $P1624[$I1623], $P1621
.annotate "line", 590
    find_lex $P1625, "$i"
    set $I1626, $P1625
    find_lex $P1627, "$past"
    unless_null $P1627, vivify_492
    new $P1627, "ResizablePMCArray"
  vivify_492:
    set $P1628, $P1627[$I1626]
    unless_null $P1628, vivify_493
    new $P1628, "Undef"
  vivify_493:
    $P1628."flat"(1)
  if_1610_end:
.annotate "line", 588
    find_lex $P1629, "$i"
    clone $P1630, $P1629
    inc $P1629
  loop1631_next:
.annotate "line", 587
    goto loop1631_test
  loop1631_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1633, exception, 'type'
    eq $P1633, 65, loop1631_next
    eq $P1633, 67, loop1631_redo
  loop1631_done:
    pop_eh 
.annotate "line", 594
    find_lex $P1634, "$/"
    find_lex $P1635, "$past"
    $P1636 = $P1634."!make"($P1635)
.annotate "line", 576
    .return ($P1636)
  control_1555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1637, exception, "payload"
    .return ($P1637)
.end


.namespace ["NQP";"Actions"]
.sub "_block1567"  :anon :subid("86_1259177779.79485") :outer("85_1259177779.79485")
.annotate "line", 578
    .const 'Sub' $P1589 = "87_1259177779.79485" 
    capture_lex $P1589
.annotate "line", 579
    new $P1569, "Undef"
    .lex "$expr", $P1569
    find_lex $P1570, "$/"
    unless_null $P1570, vivify_483
    new $P1570, "Hash"
  vivify_483:
    set $P1571, $P1570["EXPR"]
    unless_null $P1571, vivify_484
    new $P1571, "Undef"
  vivify_484:
    $P1572 = $P1571."ast"()
    store_lex "$expr", $P1572
.annotate "line", 580
    find_lex $P1577, "$expr"
    $S1578 = $P1577."name"()
    iseq $I1579, $S1578, "&infix:<,>"
    if $I1579, if_1576
    new $P1575, 'Integer'
    set $P1575, $I1579
    goto if_1576_end
  if_1576:
    find_lex $P1580, "$expr"
    $P1581 = $P1580."named"()
    isfalse $I1582, $P1581
    new $P1575, 'Integer'
    set $P1575, $I1582
  if_1576_end:
    if $P1575, if_1574
.annotate "line", 583
    find_lex $P1597, "$past"
    find_lex $P1598, "$expr"
    $P1599 = $P1597."push"($P1598)
    set $P1573, $P1599
.annotate "line", 580
    goto if_1574_end
  if_1574:
.annotate "line", 581
    find_lex $P1584, "$expr"
    $P1585 = $P1584."list"()
    defined $I1586, $P1585
    unless $I1586, for_undef_485
    iter $P1583, $P1585
    new $P1595, 'ExceptionHandler'
    set_addr $P1595, loop1594_handler
    $P1595."handle_types"(65, 67, 66)
    push_eh $P1595
  loop1594_test:
    unless $P1583, loop1594_done
    shift $P1587, $P1583
  loop1594_redo:
    .const 'Sub' $P1589 = "87_1259177779.79485" 
    capture_lex $P1589
    $P1589($P1587)
  loop1594_next:
    goto loop1594_test
  loop1594_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1596, exception, 'type'
    eq $P1596, 65, loop1594_next
    eq $P1596, 67, loop1594_redo
  loop1594_done:
    pop_eh 
  for_undef_485:
.annotate "line", 580
    set $P1573, $P1583
  if_1574_end:
.annotate "line", 578
    .return ($P1573)
.end


.namespace ["NQP";"Actions"]
.sub "_block1588"  :anon :subid("87_1259177779.79485") :outer("86_1259177779.79485")
    .param pmc param_1590
.annotate "line", 581
    .lex "$_", param_1590
    find_lex $P1591, "$past"
    find_lex $P1592, "$_"
    $P1593 = $P1591."push"($P1592)
    .return ($P1593)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("88_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1641
.annotate "line", 598
    new $P1640, 'ExceptionHandler'
    set_addr $P1640, control_1639
    $P1640."handle_types"(58)
    push_eh $P1640
    .lex "self", self
    .lex "$/", param_1641
    find_lex $P1642, "$/"
    find_lex $P1643, "$/"
    unless_null $P1643, vivify_494
    new $P1643, "Hash"
  vivify_494:
    set $P1644, $P1643["value"]
    unless_null $P1644, vivify_495
    new $P1644, "Undef"
  vivify_495:
    $P1645 = $P1644."ast"()
    $P1646 = $P1642."!make"($P1645)
    .return ($P1646)
  control_1639:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1647, exception, "payload"
    .return ($P1647)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("89_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1651
.annotate "line", 600
    new $P1650, 'ExceptionHandler'
    set_addr $P1650, control_1649
    $P1650."handle_types"(58)
    push_eh $P1650
    .lex "self", self
    .lex "$/", param_1651
.annotate "line", 601
    find_lex $P1652, "$/"
.annotate "line", 602
    find_lex $P1655, "$/"
    unless_null $P1655, vivify_496
    new $P1655, "Hash"
  vivify_496:
    set $P1656, $P1655["EXPR"]
    unless_null $P1656, vivify_497
    new $P1656, "Undef"
  vivify_497:
    if $P1656, if_1654
.annotate "line", 603
    get_hll_global $P1661, ["PAST"], "Op"
    find_lex $P1662, "$/"
    $P1663 = $P1661."new"("list" :named("pasttype"), $P1662 :named("node"))
    set $P1653, $P1663
.annotate "line", 602
    goto if_1654_end
  if_1654:
    find_lex $P1657, "$/"
    unless_null $P1657, vivify_498
    new $P1657, "Hash"
  vivify_498:
    set $P1658, $P1657["EXPR"]
    unless_null $P1658, vivify_499
    new $P1658, "ResizablePMCArray"
  vivify_499:
    set $P1659, $P1658[0]
    unless_null $P1659, vivify_500
    new $P1659, "Undef"
  vivify_500:
    $P1660 = $P1659."ast"()
    set $P1653, $P1660
  if_1654_end:
    $P1664 = $P1652."!make"($P1653)
.annotate "line", 600
    .return ($P1664)
  control_1649:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1665, exception, "payload"
    .return ($P1665)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("90_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1669
.annotate "line", 606
    new $P1668, 'ExceptionHandler'
    set_addr $P1668, control_1667
    $P1668."handle_types"(58)
    push_eh $P1668
    .lex "self", self
    .lex "$/", param_1669
.annotate "line", 607
    new $P1670, "Undef"
    .lex "$past", $P1670
.annotate "line", 606
    find_lex $P1671, "$past"
.annotate "line", 608
    find_lex $P1673, "$/"
    unless_null $P1673, vivify_501
    new $P1673, "Hash"
  vivify_501:
    set $P1674, $P1673["EXPR"]
    unless_null $P1674, vivify_502
    new $P1674, "Undef"
  vivify_502:
    if $P1674, if_1672
.annotate "line", 615
    get_hll_global $P1686, ["PAST"], "Op"
    $P1687 = $P1686."new"("list" :named("pasttype"))
    store_lex "$past", $P1687
.annotate "line", 614
    goto if_1672_end
  if_1672:
.annotate "line", 609
    find_lex $P1675, "$/"
    unless_null $P1675, vivify_503
    new $P1675, "Hash"
  vivify_503:
    set $P1676, $P1675["EXPR"]
    unless_null $P1676, vivify_504
    new $P1676, "ResizablePMCArray"
  vivify_504:
    set $P1677, $P1676[0]
    unless_null $P1677, vivify_505
    new $P1677, "Undef"
  vivify_505:
    $P1678 = $P1677."ast"()
    store_lex "$past", $P1678
.annotate "line", 610
    find_lex $P1680, "$past"
    $S1681 = $P1680."name"()
    isne $I1682, $S1681, "&infix:<,>"
    unless $I1682, if_1679_end
.annotate "line", 611
    get_hll_global $P1683, ["PAST"], "Op"
    find_lex $P1684, "$past"
    $P1685 = $P1683."new"($P1684, "list" :named("pasttype"))
    store_lex "$past", $P1685
  if_1679_end:
  if_1672_end:
.annotate "line", 617
    find_lex $P1688, "$past"
    $P1688."name"("&circumfix:<[ ]>")
.annotate "line", 618
    find_lex $P1689, "$/"
    find_lex $P1690, "$past"
    $P1691 = $P1689."!make"($P1690)
.annotate "line", 606
    .return ($P1691)
  control_1667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1692, exception, "payload"
    .return ($P1692)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("91_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1696
.annotate "line", 621
    new $P1695, 'ExceptionHandler'
    set_addr $P1695, control_1694
    $P1695."handle_types"(58)
    push_eh $P1695
    .lex "self", self
    .lex "$/", param_1696
    find_lex $P1697, "$/"
    find_lex $P1698, "$/"
    unless_null $P1698, vivify_506
    new $P1698, "Hash"
  vivify_506:
    set $P1699, $P1698["quote_EXPR"]
    unless_null $P1699, vivify_507
    new $P1699, "Undef"
  vivify_507:
    $P1700 = $P1699."ast"()
    $P1701 = $P1697."!make"($P1700)
    .return ($P1701)
  control_1694:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1702, exception, "payload"
    .return ($P1702)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("92_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1706
.annotate "line", 623
    new $P1705, 'ExceptionHandler'
    set_addr $P1705, control_1704
    $P1705."handle_types"(58)
    push_eh $P1705
    .lex "self", self
    .lex "$/", param_1706
.annotate "line", 624
    find_lex $P1707, "$/"
    find_lex $P1710, "$/"
    unless_null $P1710, vivify_508
    new $P1710, "Hash"
  vivify_508:
    set $P1711, $P1710["pblock"]
    unless_null $P1711, vivify_509
    new $P1711, "Hash"
  vivify_509:
    set $P1712, $P1711["blockoid"]
    unless_null $P1712, vivify_510
    new $P1712, "Hash"
  vivify_510:
    set $P1713, $P1712["statementlist"]
    unless_null $P1713, vivify_511
    new $P1713, "Hash"
  vivify_511:
    set $P1714, $P1713["statement"]
    unless_null $P1714, vivify_512
    new $P1714, "Undef"
  vivify_512:
    set $N1715, $P1714
    new $P1716, "Integer"
    assign $P1716, 0
    set $N1717, $P1716
    isgt $I1718, $N1715, $N1717
    if $I1718, if_1709
.annotate "line", 626
    get_hll_global $P1722, ["PAST"], "Op"
    find_lex $P1723, "$/"
    $P1724 = $P1722."new"("    %r = new [\"Hash\"]" :named("inline"), $P1723 :named("node"))
    set $P1708, $P1724
.annotate "line", 624
    goto if_1709_end
  if_1709:
.annotate "line", 625
    find_lex $P1719, "$/"
    unless_null $P1719, vivify_513
    new $P1719, "Hash"
  vivify_513:
    set $P1720, $P1719["pblock"]
    unless_null $P1720, vivify_514
    new $P1720, "Undef"
  vivify_514:
    $P1721 = $P1720."ast"()
    set $P1708, $P1721
  if_1709_end:
    $P1725 = $P1707."!make"($P1708)
.annotate "line", 623
    .return ($P1725)
  control_1704:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1726, exception, "payload"
    .return ($P1726)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("93_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1730
.annotate "line", 629
    new $P1729, 'ExceptionHandler'
    set_addr $P1729, control_1728
    $P1729."handle_types"(58)
    push_eh $P1729
    .lex "self", self
    .lex "$/", param_1730
.annotate "line", 630
    new $P1731, "Undef"
    .lex "$name", $P1731
    find_lex $P1734, "$/"
    unless_null $P1734, vivify_515
    new $P1734, "Hash"
  vivify_515:
    set $P1735, $P1734["sigil"]
    unless_null $P1735, vivify_516
    new $P1735, "Undef"
  vivify_516:
    set $S1736, $P1735
    iseq $I1737, $S1736, "@"
    if $I1737, if_1733
.annotate "line", 631
    find_lex $P1741, "$/"
    unless_null $P1741, vivify_517
    new $P1741, "Hash"
  vivify_517:
    set $P1742, $P1741["sigil"]
    unless_null $P1742, vivify_518
    new $P1742, "Undef"
  vivify_518:
    set $S1743, $P1742
    iseq $I1744, $S1743, "%"
    if $I1744, if_1740
    new $P1746, "String"
    assign $P1746, "item"
    set $P1739, $P1746
    goto if_1740_end
  if_1740:
    new $P1745, "String"
    assign $P1745, "hash"
    set $P1739, $P1745
  if_1740_end:
    set $P1732, $P1739
.annotate "line", 630
    goto if_1733_end
  if_1733:
    new $P1738, "String"
    assign $P1738, "list"
    set $P1732, $P1738
  if_1733_end:
    store_lex "$name", $P1732
.annotate "line", 633
    find_lex $P1747, "$/"
    get_hll_global $P1748, ["PAST"], "Op"
    find_lex $P1749, "$name"
    find_lex $P1750, "$/"
    unless_null $P1750, vivify_519
    new $P1750, "Hash"
  vivify_519:
    set $P1751, $P1750["semilist"]
    unless_null $P1751, vivify_520
    new $P1751, "Undef"
  vivify_520:
    $P1752 = $P1751."ast"()
    $P1753 = $P1748."new"($P1752, "callmethod" :named("pasttype"), $P1749 :named("name"))
    $P1754 = $P1747."!make"($P1753)
.annotate "line", 629
    .return ($P1754)
  control_1728:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1755, exception, "payload"
    .return ($P1755)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("94_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1759
.annotate "line", 636
    new $P1758, 'ExceptionHandler'
    set_addr $P1758, control_1757
    $P1758."handle_types"(58)
    push_eh $P1758
    .lex "self", self
    .lex "$/", param_1759
    find_lex $P1760, "$/"
    find_lex $P1761, "$/"
    unless_null $P1761, vivify_521
    new $P1761, "Hash"
  vivify_521:
    set $P1762, $P1761["statement"]
    unless_null $P1762, vivify_522
    new $P1762, "Undef"
  vivify_522:
    $P1763 = $P1762."ast"()
    $P1764 = $P1760."!make"($P1763)
    .return ($P1764)
  control_1757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1765, exception, "payload"
    .return ($P1765)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("95_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1769
.annotate "line", 638
    new $P1768, 'ExceptionHandler'
    set_addr $P1768, control_1767
    $P1768."handle_types"(58)
    push_eh $P1768
    .lex "self", self
    .lex "$/", param_1769
.annotate "line", 639
    find_lex $P1770, "$/"
    get_hll_global $P1771, ["PAST"], "Var"
    find_lex $P1772, "$/"
    unless_null $P1772, vivify_523
    new $P1772, "Hash"
  vivify_523:
    set $P1773, $P1772["EXPR"]
    unless_null $P1773, vivify_524
    new $P1773, "Undef"
  vivify_524:
    $P1774 = $P1773."ast"()
    $P1775 = $P1771."new"($P1774, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1776 = $P1770."!make"($P1775)
.annotate "line", 638
    .return ($P1776)
  control_1767:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1777, exception, "payload"
    .return ($P1777)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("96_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1781
.annotate "line", 644
    new $P1780, 'ExceptionHandler'
    set_addr $P1780, control_1779
    $P1780."handle_types"(58)
    push_eh $P1780
    .lex "self", self
    .lex "$/", param_1781
.annotate "line", 645
    find_lex $P1782, "$/"
    get_hll_global $P1783, ["PAST"], "Var"
    find_lex $P1784, "$/"
    unless_null $P1784, vivify_525
    new $P1784, "Hash"
  vivify_525:
    set $P1785, $P1784["EXPR"]
    unless_null $P1785, vivify_526
    new $P1785, "Undef"
  vivify_526:
    $P1786 = $P1785."ast"()
    $P1787 = $P1783."new"($P1786, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1788 = $P1782."!make"($P1787)
.annotate "line", 644
    .return ($P1788)
  control_1779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1789, exception, "payload"
    .return ($P1789)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("97_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1793
.annotate "line", 650
    new $P1792, 'ExceptionHandler'
    set_addr $P1792, control_1791
    $P1792."handle_types"(58)
    push_eh $P1792
    .lex "self", self
    .lex "$/", param_1793
.annotate "line", 651
    find_lex $P1794, "$/"
    get_hll_global $P1795, ["PAST"], "Var"
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_527
    new $P1796, "Hash"
  vivify_527:
    set $P1797, $P1796["quote_EXPR"]
    unless_null $P1797, vivify_528
    new $P1797, "Undef"
  vivify_528:
    $P1798 = $P1797."ast"()
    $P1799 = $P1795."new"($P1798, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1800 = $P1794."!make"($P1799)
.annotate "line", 650
    .return ($P1800)
  control_1791:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1801, exception, "payload"
    .return ($P1801)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("98_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1805
.annotate "line", 656
    new $P1804, 'ExceptionHandler'
    set_addr $P1804, control_1803
    $P1804."handle_types"(58)
    push_eh $P1804
    .lex "self", self
    .lex "$/", param_1805
.annotate "line", 657
    find_lex $P1806, "$/"
    find_lex $P1807, "$/"
    unless_null $P1807, vivify_529
    new $P1807, "Hash"
  vivify_529:
    set $P1808, $P1807["arglist"]
    unless_null $P1808, vivify_530
    new $P1808, "Undef"
  vivify_530:
    $P1809 = $P1808."ast"()
    $P1810 = $P1806."!make"($P1809)
.annotate "line", 656
    .return ($P1810)
  control_1803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1811, exception, "payload"
    .return ($P1811)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("99_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1815
.annotate "line", 660
    new $P1814, 'ExceptionHandler'
    set_addr $P1814, control_1813
    $P1814."handle_types"(58)
    push_eh $P1814
    .lex "self", self
    .lex "$/", param_1815
.annotate "line", 661
    find_lex $P1816, "$/"
    find_lex $P1819, "$/"
    unless_null $P1819, vivify_531
    new $P1819, "Hash"
  vivify_531:
    set $P1820, $P1819["quote"]
    unless_null $P1820, vivify_532
    new $P1820, "Undef"
  vivify_532:
    if $P1820, if_1818
    find_lex $P1824, "$/"
    unless_null $P1824, vivify_533
    new $P1824, "Hash"
  vivify_533:
    set $P1825, $P1824["number"]
    unless_null $P1825, vivify_534
    new $P1825, "Undef"
  vivify_534:
    $P1826 = $P1825."ast"()
    set $P1817, $P1826
    goto if_1818_end
  if_1818:
    find_lex $P1821, "$/"
    unless_null $P1821, vivify_535
    new $P1821, "Hash"
  vivify_535:
    set $P1822, $P1821["quote"]
    unless_null $P1822, vivify_536
    new $P1822, "Undef"
  vivify_536:
    $P1823 = $P1822."ast"()
    set $P1817, $P1823
  if_1818_end:
    $P1827 = $P1816."!make"($P1817)
.annotate "line", 660
    .return ($P1827)
  control_1813:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1828, exception, "payload"
    .return ($P1828)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("100_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1832
.annotate "line", 664
    new $P1831, 'ExceptionHandler'
    set_addr $P1831, control_1830
    $P1831."handle_types"(58)
    push_eh $P1831
    .lex "self", self
    .lex "$/", param_1832
.annotate "line", 665
    new $P1833, "Undef"
    .lex "$value", $P1833
    find_lex $P1836, "$/"
    unless_null $P1836, vivify_537
    new $P1836, "Hash"
  vivify_537:
    set $P1837, $P1836["dec_number"]
    unless_null $P1837, vivify_538
    new $P1837, "Undef"
  vivify_538:
    if $P1837, if_1835
    find_lex $P1841, "$/"
    unless_null $P1841, vivify_539
    new $P1841, "Hash"
  vivify_539:
    set $P1842, $P1841["integer"]
    unless_null $P1842, vivify_540
    new $P1842, "Undef"
  vivify_540:
    $P1843 = $P1842."ast"()
    set $P1834, $P1843
    goto if_1835_end
  if_1835:
    find_lex $P1838, "$/"
    unless_null $P1838, vivify_541
    new $P1838, "Hash"
  vivify_541:
    set $P1839, $P1838["dec_number"]
    unless_null $P1839, vivify_542
    new $P1839, "Undef"
  vivify_542:
    $P1840 = $P1839."ast"()
    set $P1834, $P1840
  if_1835_end:
    store_lex "$value", $P1834
.annotate "line", 666
    find_lex $P1845, "$/"
    unless_null $P1845, vivify_543
    new $P1845, "Hash"
  vivify_543:
    set $P1846, $P1845["sign"]
    unless_null $P1846, vivify_544
    new $P1846, "Undef"
  vivify_544:
    set $S1847, $P1846
    iseq $I1848, $S1847, "-"
    unless $I1848, if_1844_end
    find_lex $P1849, "$value"
    neg $P1850, $P1849
    store_lex "$value", $P1850
  if_1844_end:
.annotate "line", 667
    find_lex $P1851, "$/"
    get_hll_global $P1852, ["PAST"], "Val"
    find_lex $P1853, "$value"
    $P1854 = $P1852."new"($P1853 :named("value"))
    $P1855 = $P1851."!make"($P1854)
.annotate "line", 664
    .return ($P1855)
  control_1830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1856, exception, "payload"
    .return ($P1856)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("101_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1860
.annotate "line", 670
    new $P1859, 'ExceptionHandler'
    set_addr $P1859, control_1858
    $P1859."handle_types"(58)
    push_eh $P1859
    .lex "self", self
    .lex "$/", param_1860
    find_lex $P1861, "$/"
    find_lex $P1862, "$/"
    unless_null $P1862, vivify_545
    new $P1862, "Hash"
  vivify_545:
    set $P1863, $P1862["quote_EXPR"]
    unless_null $P1863, vivify_546
    new $P1863, "Undef"
  vivify_546:
    $P1864 = $P1863."ast"()
    $P1865 = $P1861."!make"($P1864)
    .return ($P1865)
  control_1858:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1866, exception, "payload"
    .return ($P1866)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("102_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1870
.annotate "line", 671
    new $P1869, 'ExceptionHandler'
    set_addr $P1869, control_1868
    $P1869."handle_types"(58)
    push_eh $P1869
    .lex "self", self
    .lex "$/", param_1870
    find_lex $P1871, "$/"
    find_lex $P1872, "$/"
    unless_null $P1872, vivify_547
    new $P1872, "Hash"
  vivify_547:
    set $P1873, $P1872["quote_EXPR"]
    unless_null $P1873, vivify_548
    new $P1873, "Undef"
  vivify_548:
    $P1874 = $P1873."ast"()
    $P1875 = $P1871."!make"($P1874)
    .return ($P1875)
  control_1868:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1876, exception, "payload"
    .return ($P1876)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("103_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1880
.annotate "line", 672
    new $P1879, 'ExceptionHandler'
    set_addr $P1879, control_1878
    $P1879."handle_types"(58)
    push_eh $P1879
    .lex "self", self
    .lex "$/", param_1880
    find_lex $P1881, "$/"
    find_lex $P1882, "$/"
    unless_null $P1882, vivify_549
    new $P1882, "Hash"
  vivify_549:
    set $P1883, $P1882["quote_EXPR"]
    unless_null $P1883, vivify_550
    new $P1883, "Undef"
  vivify_550:
    $P1884 = $P1883."ast"()
    $P1885 = $P1881."!make"($P1884)
    .return ($P1885)
  control_1878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1886, exception, "payload"
    .return ($P1886)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("104_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1890
.annotate "line", 673
    new $P1889, 'ExceptionHandler'
    set_addr $P1889, control_1888
    $P1889."handle_types"(58)
    push_eh $P1889
    .lex "self", self
    .lex "$/", param_1890
    find_lex $P1891, "$/"
    find_lex $P1892, "$/"
    unless_null $P1892, vivify_551
    new $P1892, "Hash"
  vivify_551:
    set $P1893, $P1892["quote_EXPR"]
    unless_null $P1893, vivify_552
    new $P1893, "Undef"
  vivify_552:
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
.sub "quote:sym<Q>"  :subid("105_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1900
.annotate "line", 674
    new $P1899, 'ExceptionHandler'
    set_addr $P1899, control_1898
    $P1899."handle_types"(58)
    push_eh $P1899
    .lex "self", self
    .lex "$/", param_1900
    find_lex $P1901, "$/"
    find_lex $P1902, "$/"
    unless_null $P1902, vivify_553
    new $P1902, "Hash"
  vivify_553:
    set $P1903, $P1902["quote_EXPR"]
    unless_null $P1903, vivify_554
    new $P1903, "Undef"
  vivify_554:
    $P1904 = $P1903."ast"()
    $P1905 = $P1901."!make"($P1904)
    .return ($P1905)
  control_1898:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1906, exception, "payload"
    .return ($P1906)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("106_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1910
.annotate "line", 675
    new $P1909, 'ExceptionHandler'
    set_addr $P1909, control_1908
    $P1909."handle_types"(58)
    push_eh $P1909
    .lex "self", self
    .lex "$/", param_1910
.annotate "line", 676
    find_lex $P1911, "$/"
    get_hll_global $P1912, ["PAST"], "Op"
    find_lex $P1913, "$/"
    unless_null $P1913, vivify_555
    new $P1913, "Hash"
  vivify_555:
    set $P1914, $P1913["quote_EXPR"]
    unless_null $P1914, vivify_556
    new $P1914, "Undef"
  vivify_556:
    $P1915 = $P1914."ast"()
    $P1916 = $P1915."value"()
    find_lex $P1917, "$/"
    $P1918 = $P1912."new"($P1916 :named("inline"), "inline" :named("pasttype"), $P1917 :named("node"))
    $P1919 = $P1911."!make"($P1918)
.annotate "line", 675
    .return ($P1919)
  control_1908:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1920, exception, "payload"
    .return ($P1920)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("107_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1924
.annotate "line", 681
    new $P1923, 'ExceptionHandler'
    set_addr $P1923, control_1922
    $P1923."handle_types"(58)
    push_eh $P1923
    .lex "self", self
    .lex "$/", param_1924
    find_lex $P1925, "$/"
    find_lex $P1926, "$/"
    unless_null $P1926, vivify_557
    new $P1926, "Hash"
  vivify_557:
    set $P1927, $P1926["variable"]
    unless_null $P1927, vivify_558
    new $P1927, "Undef"
  vivify_558:
    $P1928 = $P1927."ast"()
    $P1929 = $P1925."!make"($P1928)
    .return ($P1929)
  control_1922:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1930, exception, "payload"
    .return ($P1930)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("108_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1934
.annotate "line", 682
    new $P1933, 'ExceptionHandler'
    set_addr $P1933, control_1932
    $P1933."handle_types"(58)
    push_eh $P1933
    .lex "self", self
    .lex "$/", param_1934
.annotate "line", 683
    find_lex $P1935, "$/"
    get_hll_global $P1936, ["PAST"], "Op"
.annotate "line", 684
    find_lex $P1937, "$/"
    unless_null $P1937, vivify_559
    new $P1937, "Hash"
  vivify_559:
    set $P1938, $P1937["block"]
    unless_null $P1938, vivify_560
    new $P1938, "Undef"
  vivify_560:
    $P1939 = $P1938."ast"()
    $P1940 = "block_immediate"($P1939)
    find_lex $P1941, "$/"
    $P1942 = $P1936."new"($P1940, "set S*" :named("pirop"), $P1941 :named("node"))
.annotate "line", 683
    $P1943 = $P1935."!make"($P1942)
.annotate "line", 682
    .return ($P1943)
  control_1932:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1944, exception, "payload"
    .return ($P1944)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("109_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1948
.annotate "line", 690
    new $P1947, 'ExceptionHandler'
    set_addr $P1947, control_1946
    $P1947."handle_types"(58)
    push_eh $P1947
    .lex "self", self
    .lex "$/", param_1948
    find_lex $P1949, "$/"
    find_lex $P1950, "$/"
    unless_null $P1950, vivify_561
    new $P1950, "Hash"
  vivify_561:
    set $P1951, $P1950["dotty"]
    unless_null $P1951, vivify_562
    new $P1951, "Undef"
  vivify_562:
    $P1952 = $P1951."ast"()
    $P1953 = $P1949."!make"($P1952)
    .return ($P1953)
  control_1946:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1954, exception, "payload"
    .return ($P1954)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("110_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1958
.annotate "line", 692
    new $P1957, 'ExceptionHandler'
    set_addr $P1957, control_1956
    $P1957."handle_types"(58)
    push_eh $P1957
    .lex "self", self
    .lex "$/", param_1958
.annotate "line", 693
    find_lex $P1959, "$/"
    get_hll_global $P1960, ["PAST"], "Op"
.annotate "line", 694
    new $P1961, "ResizablePMCArray"
    push $P1961, "    clone %r, %0"
    push $P1961, "    inc %0"
    $P1962 = $P1960."new"("postfix:<++>" :named("name"), $P1961 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 693
    $P1963 = $P1959."!make"($P1962)
.annotate "line", 692
    .return ($P1963)
  control_1956:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1964, exception, "payload"
    .return ($P1964)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("111_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1968
.annotate "line", 698
    new $P1967, 'ExceptionHandler'
    set_addr $P1967, control_1966
    $P1967."handle_types"(58)
    push_eh $P1967
    .lex "self", self
    .lex "$/", param_1968
.annotate "line", 699
    find_lex $P1969, "$/"
    get_hll_global $P1970, ["PAST"], "Op"
.annotate "line", 700
    new $P1971, "ResizablePMCArray"
    push $P1971, "    clone %r, %0"
    push $P1971, "    dec %0"
    $P1972 = $P1970."new"("postfix:<-->" :named("name"), $P1971 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 699
    $P1973 = $P1969."!make"($P1972)
.annotate "line", 698
    .return ($P1973)
  control_1966:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1974, exception, "payload"
    .return ($P1974)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("112_1259177779.79485") :method :outer("11_1259177779.79485")
    .param pmc param_1978
.annotate "line", 704
    new $P1977, 'ExceptionHandler'
    set_addr $P1977, control_1976
    $P1977."handle_types"(58)
    push_eh $P1977
    .lex "self", self
    .lex "$/", param_1978
.annotate "line", 705
    find_lex $P1979, "$/"
    get_hll_global $P1980, ["PAST"], "Op"
.annotate "line", 706
    get_hll_global $P1981, ["PAST"], "Var"
    $P1982 = $P1981."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1983, "$/"
    $P1984 = $P1980."new"($P1982, "callmethod" :named("pasttype"), "!make" :named("name"), $P1983 :named("node"))
.annotate "line", 705
    $P1985 = $P1979."!make"($P1984)
.annotate "line", 704
    .return ($P1985)
  control_1976:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1986, exception, "payload"
    .return ($P1986)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1987"  :subid("113_1259177779.79485") :outer("11_1259177779.79485")
.annotate "line", 714
    .const 'Sub' $P2023 = "117_1259177779.79485" 
    capture_lex $P2023
    .const 'Sub' $P2013 = "116_1259177779.79485" 
    capture_lex $P2013
    .const 'Sub' $P2003 = "115_1259177779.79485" 
    capture_lex $P2003
    .const 'Sub' $P1989 = "114_1259177779.79485" 
    capture_lex $P1989
.annotate "line", 725
    .const 'Sub' $P2023 = "117_1259177779.79485" 
    capture_lex $P2023
.annotate "line", 714
    .return ($P2023)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("114_1259177779.79485") :method :outer("113_1259177779.79485")
    .param pmc param_1992
.annotate "line", 716
    new $P1991, 'ExceptionHandler'
    set_addr $P1991, control_1990
    $P1991."handle_types"(58)
    push_eh $P1991
    .lex "self", self
    .lex "$/", param_1992
.annotate "line", 717
    new $P1993, "Undef"
    .lex "$past", $P1993
    find_lex $P1994, "$/"
    unless_null $P1994, vivify_563
    new $P1994, "Hash"
  vivify_563:
    set $P1995, $P1994["statement"]
    unless_null $P1995, vivify_564
    new $P1995, "Undef"
  vivify_564:
    $P1996 = $P1995."ast"()
    store_lex "$past", $P1996
.annotate "line", 718
    find_lex $P1997, "$/"
    get_hll_global $P1998, ["PAST"], "Regex"
    find_lex $P1999, "$past"
    $P2000 = $P1998."new"($P1999, "pastnode" :named("pasttype"))
    $P2001 = $P1997."!make"($P2000)
.annotate "line", 716
    .return ($P2001)
  control_1990:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2002, exception, "payload"
    .return ($P2002)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("115_1259177779.79485") :method :outer("113_1259177779.79485")
    .param pmc param_2006
.annotate "line", 721
    new $P2005, 'ExceptionHandler'
    set_addr $P2005, control_2004
    $P2005."handle_types"(58)
    push_eh $P2005
    .lex "self", self
    .lex "$/", param_2006
    find_lex $P2007, "$/"
    find_lex $P2008, "$/"
    unless_null $P2008, vivify_565
    new $P2008, "Hash"
  vivify_565:
    set $P2009, $P2008["codeblock"]
    unless_null $P2009, vivify_566
    new $P2009, "Undef"
  vivify_566:
    $P2010 = $P2009."ast"()
    $P2011 = $P2007."!make"($P2010)
    .return ($P2011)
  control_2004:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2012, exception, "payload"
    .return ($P2012)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("116_1259177779.79485") :method :outer("113_1259177779.79485")
    .param pmc param_2016
.annotate "line", 723
    new $P2015, 'ExceptionHandler'
    set_addr $P2015, control_2014
    $P2015."handle_types"(58)
    push_eh $P2015
    .lex "self", self
    .lex "$/", param_2016
    find_lex $P2017, "$/"
    find_lex $P2018, "$/"
    unless_null $P2018, vivify_567
    new $P2018, "Hash"
  vivify_567:
    set $P2019, $P2018["codeblock"]
    unless_null $P2019, vivify_568
    new $P2019, "Undef"
  vivify_568:
    $P2020 = $P2019."ast"()
    $P2021 = $P2017."!make"($P2020)
    .return ($P2021)
  control_2014:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2022, exception, "payload"
    .return ($P2022)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("117_1259177779.79485") :method :outer("113_1259177779.79485")
    .param pmc param_2026
.annotate "line", 725
    new $P2025, 'ExceptionHandler'
    set_addr $P2025, control_2024
    $P2025."handle_types"(58)
    push_eh $P2025
    .lex "self", self
    .lex "$/", param_2026
.annotate "line", 726
    new $P2027, "Undef"
    .lex "$block", $P2027
.annotate "line", 728
    new $P2028, "Undef"
    .lex "$past", $P2028
.annotate "line", 726
    find_lex $P2029, "$/"
    unless_null $P2029, vivify_569
    new $P2029, "Hash"
  vivify_569:
    set $P2030, $P2029["block"]
    unless_null $P2030, vivify_570
    new $P2030, "Undef"
  vivify_570:
    $P2031 = $P2030."ast"()
    store_lex "$block", $P2031
.annotate "line", 727
    find_lex $P2032, "$block"
    $P2032."blocktype"("immediate")
.annotate "line", 729
    get_hll_global $P2033, ["PAST"], "Regex"
.annotate "line", 730
    get_hll_global $P2034, ["PAST"], "Stmts"
.annotate "line", 731
    get_hll_global $P2035, ["PAST"], "Op"
.annotate "line", 732
    get_hll_global $P2036, ["PAST"], "Var"
    $P2037 = $P2036."new"("$/" :named("name"))
.annotate "line", 733
    get_hll_global $P2038, ["PAST"], "Op"
.annotate "line", 734
    get_hll_global $P2039, ["PAST"], "Var"
    $P2040 = $P2039."new"(unicode:"$\x{a2}" :named("name"))
    $P2041 = $P2038."new"($P2040, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 733
    $P2042 = $P2035."new"($P2037, $P2041, "bind" :named("pasttype"))
.annotate "line", 731
    find_lex $P2043, "$block"
    $P2044 = $P2034."new"($P2042, $P2043)
.annotate "line", 730
    $P2045 = $P2033."new"($P2044, "pastnode" :named("pasttype"))
.annotate "line", 729
    store_lex "$past", $P2045
.annotate "line", 744
    find_lex $P2046, "$/"
    find_lex $P2047, "$past"
    $P2048 = $P2046."!make"($P2047)
.annotate "line", 725
    .return ($P2048)
  control_2024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2049, exception, "payload"
    .return ($P2049)
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
