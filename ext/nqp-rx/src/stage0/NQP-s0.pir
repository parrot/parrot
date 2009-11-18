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
.sub "_block11"  :anon :subid("10_1258533478.31768")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1079 = $P14()
.annotate "line", 1
    .return ($P1079)
.end


.namespace []
.sub "" :load :init :subid("post312") :outer("10_1258533478.31768")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258533478.31768" 
    .local pmc block
    set block, $P12
    $P1080 = get_root_global ["parrot"], "P6metaclass"
    $P1080."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258533478.31768") :outer("10_1258533478.31768")
.annotate "line", 4
    get_hll_global $P1028, ["NQP";"Regex"], "_block1027" 
    capture_lex $P1028
    .const 'Sub' $P1022 = "297_1258533478.31768" 
    capture_lex $P1022
    .const 'Sub' $P1017 = "295_1258533478.31768" 
    capture_lex $P1017
    .const 'Sub' $P1011 = "293_1258533478.31768" 
    capture_lex $P1011
    .const 'Sub' $P1005 = "291_1258533478.31768" 
    capture_lex $P1005
    .const 'Sub' $P999 = "289_1258533478.31768" 
    capture_lex $P999
    .const 'Sub' $P993 = "287_1258533478.31768" 
    capture_lex $P993
    .const 'Sub' $P988 = "285_1258533478.31768" 
    capture_lex $P988
    .const 'Sub' $P982 = "283_1258533478.31768" 
    capture_lex $P982
    .const 'Sub' $P976 = "281_1258533478.31768" 
    capture_lex $P976
    .const 'Sub' $P970 = "279_1258533478.31768" 
    capture_lex $P970
    .const 'Sub' $P964 = "277_1258533478.31768" 
    capture_lex $P964
    .const 'Sub' $P958 = "275_1258533478.31768" 
    capture_lex $P958
    .const 'Sub' $P952 = "273_1258533478.31768" 
    capture_lex $P952
    .const 'Sub' $P946 = "271_1258533478.31768" 
    capture_lex $P946
    .const 'Sub' $P940 = "269_1258533478.31768" 
    capture_lex $P940
    .const 'Sub' $P934 = "267_1258533478.31768" 
    capture_lex $P934
    .const 'Sub' $P928 = "265_1258533478.31768" 
    capture_lex $P928
    .const 'Sub' $P922 = "263_1258533478.31768" 
    capture_lex $P922
    .const 'Sub' $P916 = "261_1258533478.31768" 
    capture_lex $P916
    .const 'Sub' $P910 = "259_1258533478.31768" 
    capture_lex $P910
    .const 'Sub' $P904 = "257_1258533478.31768" 
    capture_lex $P904
    .const 'Sub' $P898 = "255_1258533478.31768" 
    capture_lex $P898
    .const 'Sub' $P892 = "253_1258533478.31768" 
    capture_lex $P892
    .const 'Sub' $P886 = "251_1258533478.31768" 
    capture_lex $P886
    .const 'Sub' $P880 = "249_1258533478.31768" 
    capture_lex $P880
    .const 'Sub' $P874 = "247_1258533478.31768" 
    capture_lex $P874
    .const 'Sub' $P868 = "245_1258533478.31768" 
    capture_lex $P868
    .const 'Sub' $P862 = "243_1258533478.31768" 
    capture_lex $P862
    .const 'Sub' $P856 = "241_1258533478.31768" 
    capture_lex $P856
    .const 'Sub' $P850 = "239_1258533478.31768" 
    capture_lex $P850
    .const 'Sub' $P844 = "237_1258533478.31768" 
    capture_lex $P844
    .const 'Sub' $P838 = "235_1258533478.31768" 
    capture_lex $P838
    .const 'Sub' $P832 = "233_1258533478.31768" 
    capture_lex $P832
    .const 'Sub' $P826 = "231_1258533478.31768" 
    capture_lex $P826
    .const 'Sub' $P820 = "229_1258533478.31768" 
    capture_lex $P820
    .const 'Sub' $P814 = "227_1258533478.31768" 
    capture_lex $P814
    .const 'Sub' $P808 = "225_1258533478.31768" 
    capture_lex $P808
    .const 'Sub' $P802 = "223_1258533478.31768" 
    capture_lex $P802
    .const 'Sub' $P796 = "221_1258533478.31768" 
    capture_lex $P796
    .const 'Sub' $P790 = "219_1258533478.31768" 
    capture_lex $P790
    .const 'Sub' $P785 = "217_1258533478.31768" 
    capture_lex $P785
    .const 'Sub' $P780 = "215_1258533478.31768" 
    capture_lex $P780
    .const 'Sub' $P776 = "213_1258533478.31768" 
    capture_lex $P776
    .const 'Sub' $P771 = "211_1258533478.31768" 
    capture_lex $P771
    .const 'Sub' $P766 = "209_1258533478.31768" 
    capture_lex $P766
    .const 'Sub' $P762 = "207_1258533478.31768" 
    capture_lex $P762
    .const 'Sub' $P758 = "205_1258533478.31768" 
    capture_lex $P758
    .const 'Sub' $P752 = "203_1258533478.31768" 
    capture_lex $P752
    .const 'Sub' $P745 = "201_1258533478.31768" 
    capture_lex $P745
    .const 'Sub' $P741 = "199_1258533478.31768" 
    capture_lex $P741
    .const 'Sub' $P737 = "197_1258533478.31768" 
    capture_lex $P737
    .const 'Sub' $P730 = "195_1258533478.31768" 
    capture_lex $P730
    .const 'Sub' $P723 = "193_1258533478.31768" 
    capture_lex $P723
    .const 'Sub' $P719 = "191_1258533478.31768" 
    capture_lex $P719
    .const 'Sub' $P715 = "189_1258533478.31768" 
    capture_lex $P715
    .const 'Sub' $P710 = "187_1258533478.31768" 
    capture_lex $P710
    .const 'Sub' $P705 = "185_1258533478.31768" 
    capture_lex $P705
    .const 'Sub' $P700 = "183_1258533478.31768" 
    capture_lex $P700
    .const 'Sub' $P695 = "181_1258533478.31768" 
    capture_lex $P695
    .const 'Sub' $P691 = "179_1258533478.31768" 
    capture_lex $P691
    .const 'Sub' $P687 = "177_1258533478.31768" 
    capture_lex $P687
    .const 'Sub' $P675 = "173_1258533478.31768" 
    capture_lex $P675
    .const 'Sub' $P670 = "171_1258533478.31768" 
    capture_lex $P670
    .const 'Sub' $P664 = "169_1258533478.31768" 
    capture_lex $P664
    .const 'Sub' $P659 = "167_1258533478.31768" 
    capture_lex $P659
    .const 'Sub' $P652 = "165_1258533478.31768" 
    capture_lex $P652
    .const 'Sub' $P645 = "163_1258533478.31768" 
    capture_lex $P645
    .const 'Sub' $P640 = "161_1258533478.31768" 
    capture_lex $P640
    .const 'Sub' $P635 = "159_1258533478.31768" 
    capture_lex $P635
    .const 'Sub' $P623 = "155_1258533478.31768" 
    capture_lex $P623
    .const 'Sub' $P592 = "153_1258533478.31768" 
    capture_lex $P592
    .const 'Sub' $P585 = "151_1258533478.31768" 
    capture_lex $P585
    .const 'Sub' $P580 = "149_1258533478.31768" 
    capture_lex $P580
    .const 'Sub' $P571 = "147_1258533478.31768" 
    capture_lex $P571
    .const 'Sub' $P557 = "145_1258533478.31768" 
    capture_lex $P557
    .const 'Sub' $P549 = "143_1258533478.31768" 
    capture_lex $P549
    .const 'Sub' $P531 = "141_1258533478.31768" 
    capture_lex $P531
    .const 'Sub' $P513 = "139_1258533478.31768" 
    capture_lex $P513
    .const 'Sub' $P507 = "137_1258533478.31768" 
    capture_lex $P507
    .const 'Sub' $P501 = "135_1258533478.31768" 
    capture_lex $P501
    .const 'Sub' $P492 = "131_1258533478.31768" 
    capture_lex $P492
    .const 'Sub' $P482 = "129_1258533478.31768" 
    capture_lex $P482
    .const 'Sub' $P476 = "127_1258533478.31768" 
    capture_lex $P476
    .const 'Sub' $P470 = "125_1258533478.31768" 
    capture_lex $P470
    .const 'Sub' $P464 = "123_1258533478.31768" 
    capture_lex $P464
    .const 'Sub' $P438 = "119_1258533478.31768" 
    capture_lex $P438
    .const 'Sub' $P430 = "117_1258533478.31768" 
    capture_lex $P430
    .const 'Sub' $P424 = "115_1258533478.31768" 
    capture_lex $P424
    .const 'Sub' $P416 = "111_1258533478.31768" 
    capture_lex $P416
    .const 'Sub' $P412 = "109_1258533478.31768" 
    capture_lex $P412
    .const 'Sub' $P401 = "107_1258533478.31768" 
    capture_lex $P401
    .const 'Sub' $P391 = "105_1258533478.31768" 
    capture_lex $P391
    .const 'Sub' $P387 = "103_1258533478.31768" 
    capture_lex $P387
    .const 'Sub' $P382 = "101_1258533478.31768" 
    capture_lex $P382
    .const 'Sub' $P377 = "99_1258533478.31768" 
    capture_lex $P377
    .const 'Sub' $P372 = "97_1258533478.31768" 
    capture_lex $P372
    .const 'Sub' $P367 = "95_1258533478.31768" 
    capture_lex $P367
    .const 'Sub' $P362 = "93_1258533478.31768" 
    capture_lex $P362
    .const 'Sub' $P357 = "91_1258533478.31768" 
    capture_lex $P357
    .const 'Sub' $P352 = "89_1258533478.31768" 
    capture_lex $P352
    .const 'Sub' $P345 = "87_1258533478.31768" 
    capture_lex $P345
    .const 'Sub' $P338 = "85_1258533478.31768" 
    capture_lex $P338
    .const 'Sub' $P327 = "81_1258533478.31768" 
    capture_lex $P327
    .const 'Sub' $P320 = "79_1258533478.31768" 
    capture_lex $P320
    .const 'Sub' $P311 = "75_1258533478.31768" 
    capture_lex $P311
    .const 'Sub' $P305 = "73_1258533478.31768" 
    capture_lex $P305
    .const 'Sub' $P294 = "69_1258533478.31768" 
    capture_lex $P294
    .const 'Sub' $P275 = "67_1258533478.31768" 
    capture_lex $P275
    .const 'Sub' $P267 = "65_1258533478.31768" 
    capture_lex $P267
    .const 'Sub' $P250 = "62_1258533478.31768" 
    capture_lex $P250
    .const 'Sub' $P231 = "60_1258533478.31768" 
    capture_lex $P231
    .const 'Sub' $P223 = "56_1258533478.31768" 
    capture_lex $P223
    .const 'Sub' $P219 = "54_1258533478.31768" 
    capture_lex $P219
    .const 'Sub' $P211 = "50_1258533478.31768" 
    capture_lex $P211
    .const 'Sub' $P207 = "48_1258533478.31768" 
    capture_lex $P207
    .const 'Sub' $P200 = "46_1258533478.31768" 
    capture_lex $P200
    .const 'Sub' $P194 = "44_1258533478.31768" 
    capture_lex $P194
    .const 'Sub' $P189 = "42_1258533478.31768" 
    capture_lex $P189
    .const 'Sub' $P182 = "40_1258533478.31768" 
    capture_lex $P182
    .const 'Sub' $P177 = "38_1258533478.31768" 
    capture_lex $P177
    .const 'Sub' $P172 = "36_1258533478.31768" 
    capture_lex $P172
    .const 'Sub' $P157 = "33_1258533478.31768" 
    capture_lex $P157
    .const 'Sub' $P145 = "31_1258533478.31768" 
    capture_lex $P145
    .const 'Sub' $P139 = "29_1258533478.31768" 
    capture_lex $P139
    .const 'Sub' $P97 = "26_1258533478.31768" 
    capture_lex $P97
    .const 'Sub' $P80 = "23_1258533478.31768" 
    capture_lex $P80
    .const 'Sub' $P71 = "21_1258533478.31768" 
    capture_lex $P71
    .const 'Sub' $P58 = "19_1258533478.31768" 
    capture_lex $P58
    .const 'Sub' $P44 = "17_1258533478.31768" 
    capture_lex $P44
    .const 'Sub' $P38 = "15_1258533478.31768" 
    capture_lex $P38
    .const 'Sub' $P33 = "13_1258533478.31768" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258533478.31768" 
    capture_lex $P15
.annotate "line", 484
    get_hll_global $P1028, ["NQP";"Regex"], "_block1027" 
    capture_lex $P1028
    $P1062 = $P1028()
.annotate "line", 4
    .return ($P1062)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post313") :outer("11_1258533478.31768")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 377
    get_hll_global $P1063, ["NQP"], "Grammar"
    $P1063."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 378
    get_hll_global $P1064, ["NQP"], "Grammar"
    $P1064."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 379
    get_hll_global $P1065, ["NQP"], "Grammar"
    $P1065."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 380
    get_hll_global $P1066, ["NQP"], "Grammar"
    $P1066."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 381
    get_hll_global $P1067, ["NQP"], "Grammar"
    $P1067."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 382
    get_hll_global $P1068, ["NQP"], "Grammar"
    $P1068."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 383
    get_hll_global $P1069, ["NQP"], "Grammar"
    $P1069."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 384
    get_hll_global $P1070, ["NQP"], "Grammar"
    $P1070."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 385
    get_hll_global $P1071, ["NQP"], "Grammar"
    $P1071."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 386
    get_hll_global $P1072, ["NQP"], "Grammar"
    $P1072."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 387
    get_hll_global $P1073, ["NQP"], "Grammar"
    $P1073."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 388
    get_hll_global $P1074, ["NQP"], "Grammar"
    $P1074."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 389
    get_hll_global $P1075, ["NQP"], "Grammar"
    $P1075."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 390
    get_hll_global $P1076, ["NQP"], "Grammar"
    $P1076."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 391
    get_hll_global $P1077, ["NQP"], "Grammar"
    $P1077."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 376
    $P1078 = get_root_global ["parrot"], "P6metaclass"
    $P1078."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258533478.31768") :method :outer("11_1258533478.31768")
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
    unless_null $P20, vivify_314
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_315
    die "Contextual %*LANG not found"
  vivify_315:
  vivify_314:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_316
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_317
    die "Contextual %*LANG not found"
  vivify_317:
    store_lex "%*LANG", $P22
  vivify_316:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_318
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_319
    die "Contextual %*LANG not found"
  vivify_319:
    store_lex "%*LANG", $P24
  vivify_318:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_320
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_321
    die "Contextual %*LANG not found"
  vivify_321:
    store_lex "%*LANG", $P26
  vivify_320:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_322
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_323
    die "Contextual %*LANG not found"
  vivify_323:
    store_lex "%*LANG", $P28
  vivify_322:
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
    rethrow exception
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx34_tgt
    .local int rx34_pos
    .local int rx34_off
    .local int rx34_eos
    .local int rx34_rep
    .local pmc rx34_cur
    (rx34_cur, rx34_pos, rx34_tgt, $I10) = self."!cursor_start"()
    rx34_cur."!cursor_debug"("START ", "identifier")
    .lex unicode:"$\x{a2}", rx34_cur
    .local pmc match
    .lex "$/", match
    length rx34_eos, rx34_tgt
    set rx34_off, 0
    lt $I10, 2, rx34_start
    sub rx34_off, $I10, 1
    substr rx34_tgt, rx34_tgt, rx34_off
  rx34_start:
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
.sub "!PREFIX__identifier"  :subid("14_1258533478.31768") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx39_tgt
    .local int rx39_pos
    .local int rx39_off
    .local int rx39_eos
    .local int rx39_rep
    .local pmc rx39_cur
    (rx39_cur, rx39_pos, rx39_tgt, $I10) = self."!cursor_start"()
    rx39_cur."!cursor_debug"("START ", "name")
    rx39_cur."!cursor_caparray"("identifier")
    .lex unicode:"$\x{a2}", rx39_cur
    .local pmc match
    .lex "$/", match
    length rx39_eos, rx39_tgt
    set rx39_off, 0
    lt $I10, 2, rx39_start
    sub rx39_off, $I10, 1
    substr rx39_tgt, rx39_tgt, rx39_off
  rx39_start:
.annotate "line", 18
  # rx rxquantr42 ** 1..*
    set_addr $I43, rxquantr42_done
    rx39_cur."!mark_push"(0, -1, $I43)
  rxquantr42_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx39_cur."!cursor_pos"(rx39_pos)
    $P10 = rx39_cur."identifier"()
    unless $P10, rx39_fail
    rx39_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx39_pos = $P10."pos"()
    (rx39_rep) = rx39_cur."!mark_commit"($I43)
    rx39_cur."!mark_push"(rx39_rep, rx39_pos, $I43)
  # rx literal  "::"
    add $I11, rx39_pos, 2
    gt $I11, rx39_eos, rx39_fail
    sub $I11, rx39_pos, rx39_off
    substr $S10, rx39_tgt, $I11, 2
    ne $S10, "::", rx39_fail
    add rx39_pos, 2
    goto rxquantr42_loop
  rxquantr42_done:
  # rx pass
    rx39_cur."!cursor_pass"(rx39_pos, "name")
    rx39_cur."!cursor_debug"("PASS  ", "name", " at pos=", rx39_pos)
    .return (rx39_cur)
  rx39_fail:
.annotate "line", 4
    (rx39_rep, rx39_pos, $I10, $P10) = rx39_cur."!mark_fail"(0)
    lt rx39_pos, -1, rx39_done
    eq rx39_pos, -1, rx39_fail
    jump $I10
  rx39_done:
    rx39_cur."!cursor_fail"()
    rx39_cur."!cursor_debug"("FAIL  ", "name")
    .return (rx39_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1258533478.31768") :method
.annotate "line", 4
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx45_tgt
    .local int rx45_pos
    .local int rx45_off
    .local int rx45_eos
    .local int rx45_rep
    .local pmc rx45_cur
    (rx45_cur, rx45_pos, rx45_tgt, $I10) = self."!cursor_start"()
    rx45_cur."!cursor_debug"("START ", "deflongname")
    rx45_cur."!cursor_caparray"("sym")
    .lex unicode:"$\x{a2}", rx45_cur
    .local pmc match
    .lex "$/", match
    length rx45_eos, rx45_tgt
    set rx45_off, 0
    lt $I10, 2, rx45_start
    sub rx45_off, $I10, 1
    substr rx45_tgt, rx45_tgt, rx45_off
  rx45_start:
.annotate "line", 21
  # rx subrule "identifier" subtype=capture negate=
    rx45_cur."!cursor_pos"(rx45_pos)
    $P10 = rx45_cur."identifier"()
    unless $P10, rx45_fail
    rx45_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx45_pos = $P10."pos"()
.annotate "line", 22
  # rx rxquantr49 ** 0..1
    set_addr $I57, rxquantr49_done
    rx45_cur."!mark_push"(0, rx45_pos, $I57)
  rxquantr49_loop:
  alt50_0:
    set_addr $I10, alt50_1
    rx45_cur."!mark_push"(0, rx45_pos, $I10)
  # rx literal  ":sym<"
    add $I11, rx45_pos, 5
    gt $I11, rx45_eos, rx45_fail
    sub $I11, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I11, 5
    ne $S10, ":sym<", rx45_fail
    add rx45_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_53_fail
    rx45_cur."!mark_push"(0, rx45_pos, $I10)
  # rx rxquantr51 ** 0..*
    set_addr $I52, rxquantr51_done
    rx45_cur."!mark_push"(0, rx45_pos, $I52)
  rxquantr51_loop:
  # rx enumcharlist negate=1 
    ge rx45_pos, rx45_eos, rx45_fail
    sub $I10, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx45_fail
    inc rx45_pos
    (rx45_rep) = rx45_cur."!mark_commit"($I52)
    rx45_cur."!mark_push"(rx45_rep, rx45_pos, $I52)
    goto rxquantr51_loop
  rxquantr51_done:
    set_addr $I10, rxcap_53_fail
    ($I12, $I11) = rx45_cur."!mark_peek"($I10)
    rx45_cur."!cursor_pos"($I11)
    ($P10) = rx45_cur."!cursor_start"()
    $P10."!cursor_pass"(rx45_pos, "")
    rx45_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_53_done
  rxcap_53_fail:
    goto rx45_fail
  rxcap_53_done:
  # rx literal  ">"
    add $I11, rx45_pos, 1
    gt $I11, rx45_eos, rx45_fail
    sub $I11, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I11, 1
    ne $S10, ">", rx45_fail
    add rx45_pos, 1
    goto alt50_end
  alt50_1:
  # rx literal  unicode:":sym\x{ab}"
    add $I11, rx45_pos, 5
    gt $I11, rx45_eos, rx45_fail
    sub $I11, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I11, 5
    ne $S10, unicode:":sym\x{ab}", rx45_fail
    add rx45_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_56_fail
    rx45_cur."!mark_push"(0, rx45_pos, $I10)
  # rx rxquantr54 ** 0..*
    set_addr $I55, rxquantr54_done
    rx45_cur."!mark_push"(0, rx45_pos, $I55)
  rxquantr54_loop:
  # rx enumcharlist negate=1 
    ge rx45_pos, rx45_eos, rx45_fail
    sub $I10, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I10, 1
    index $I11, unicode:"\x{bb}", $S10
    ge $I11, 0, rx45_fail
    inc rx45_pos
    (rx45_rep) = rx45_cur."!mark_commit"($I55)
    rx45_cur."!mark_push"(rx45_rep, rx45_pos, $I55)
    goto rxquantr54_loop
  rxquantr54_done:
    set_addr $I10, rxcap_56_fail
    ($I12, $I11) = rx45_cur."!mark_peek"($I10)
    rx45_cur."!cursor_pos"($I11)
    ($P10) = rx45_cur."!cursor_start"()
    $P10."!cursor_pass"(rx45_pos, "")
    rx45_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_56_done
  rxcap_56_fail:
    goto rx45_fail
  rxcap_56_done:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx45_pos, 1
    gt $I11, rx45_eos, rx45_fail
    sub $I11, rx45_pos, rx45_off
    substr $S10, rx45_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx45_fail
    add rx45_pos, 1
  alt50_end:
    (rx45_rep) = rx45_cur."!mark_commit"($I57)
  rxquantr49_done:
.annotate "line", 20
  # rx pass
    rx45_cur."!cursor_pass"(rx45_pos, "deflongname")
    rx45_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx45_pos)
    .return (rx45_cur)
  rx45_fail:
.annotate "line", 4
    (rx45_rep, rx45_pos, $I10, $P10) = rx45_cur."!mark_fail"(0)
    lt rx45_pos, -1, rx45_done
    eq rx45_pos, -1, rx45_fail
    jump $I10
  rx45_done:
    rx45_cur."!cursor_fail"()
    rx45_cur."!cursor_debug"("FAIL  ", "deflongname")
    .return (rx45_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1258533478.31768") :method
.annotate "line", 4
    $P47 = self."!PREFIX__!subrule"("identifier", "")
    new $P48, "ResizablePMCArray"
    push $P48, $P47
    .return ($P48)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx59_tgt
    .local int rx59_pos
    .local int rx59_off
    .local int rx59_eos
    .local int rx59_rep
    .local pmc rx59_cur
    (rx59_cur, rx59_pos, rx59_tgt, $I10) = self."!cursor_start"()
    rx59_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx59_cur
    .local pmc match
    .lex "$/", match
    length rx59_eos, rx59_tgt
    set rx59_off, 0
    lt $I10, 2, rx59_start
    sub rx59_off, $I10, 1
    substr rx59_tgt, rx59_tgt, rx59_off
  rx59_start:
.annotate "line", 29
  # rx rxquantr62 ** 0..1
    set_addr $I70, rxquantr62_done
    rx59_cur."!mark_push"(0, rx59_pos, $I70)
  rxquantr62_loop:
  alt63_0:
.annotate "line", 26
    set_addr $I10, alt63_1
    rx59_cur."!mark_push"(0, rx59_pos, $I10)
.annotate "line", 27
  # rx rxquantr64 ** 0..*
    set_addr $I65, rxquantr64_done
    rx59_cur."!mark_push"(0, rx59_pos, $I65)
  rxquantr64_loop:
  # rx enumcharlist negate=0 
    ge rx59_pos, rx59_eos, rx59_fail
    sub $I10, rx59_pos, rx59_off
    substr $S10, rx59_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx59_fail
    inc rx59_pos
    (rx59_rep) = rx59_cur."!mark_commit"($I65)
    rx59_cur."!mark_push"(rx59_rep, rx59_pos, $I65)
    goto rxquantr64_loop
  rxquantr64_done:
  # rxanchor eol
    sub $I10, rx59_pos, rx59_off
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rxanchor66_done
    ne rx59_pos, rx59_eos, rx59_fail
    eq rx59_pos, 0, rxanchor66_done
    dec $I10
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rx59_fail
  rxanchor66_done:
  # rx subrule "ws" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."ws"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."MARKER"("endstmt")
    unless $P10, rx59_fail
    goto alt63_end
  alt63_1:
.annotate "line", 28
  # rx rxquantr67 ** 0..1
    set_addr $I68, rxquantr67_done
    rx59_cur."!mark_push"(0, rx59_pos, $I68)
  rxquantr67_loop:
  # rx subrule "unv" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."unv"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
    (rx59_rep) = rx59_cur."!mark_commit"($I68)
  rxquantr67_done:
  # rxanchor eol
    sub $I10, rx59_pos, rx59_off
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rxanchor69_done
    ne rx59_pos, rx59_eos, rx59_fail
    eq rx59_pos, 0, rxanchor69_done
    dec $I10
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rx59_fail
  rxanchor69_done:
  # rx subrule "ws" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."ws"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."MARKER"("endstmt")
    unless $P10, rx59_fail
  alt63_end:
.annotate "line", 29
    (rx59_rep) = rx59_cur."!mark_commit"($I70)
  rxquantr62_done:
.annotate "line", 25
  # rx pass
    rx59_cur."!cursor_pass"(rx59_pos, "ENDSTMT")
    rx59_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx59_pos)
    .return (rx59_cur)
  rx59_fail:
.annotate "line", 4
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258533478.31768") :method
.annotate "line", 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx72_tgt
    .local int rx72_pos
    .local int rx72_off
    .local int rx72_eos
    .local int rx72_rep
    .local pmc rx72_cur
    (rx72_cur, rx72_pos, rx72_tgt, $I10) = self."!cursor_start"()
    rx72_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx72_cur
    .local pmc match
    .lex "$/", match
    length rx72_eos, rx72_tgt
    set rx72_off, 0
    lt $I10, 2, rx72_start
    sub rx72_off, $I10, 1
    substr rx72_tgt, rx72_tgt, rx72_off
  rx72_start:
  alt75_0:
.annotate "line", 32
    set_addr $I10, alt75_1
    rx72_cur."!mark_push"(0, rx72_pos, $I10)
.annotate "line", 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."MARKED"("ws")
    unless $P10, rx72_fail
    goto alt75_end
  alt75_1:
.annotate "line", 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ww"()
    if $P10, rx72_fail
.annotate "line", 38
  # rx rxquantr76 ** 0..*
    set_addr $I79, rxquantr76_done
    rx72_cur."!mark_push"(0, rx72_pos, $I79)
  rxquantr76_loop:
  alt77_0:
.annotate "line", 35
    set_addr $I10, alt77_1
    rx72_cur."!mark_push"(0, rx72_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx72_pos, rx72_off
    find_not_cclass $I11, 32, rx72_tgt, $I10, rx72_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx72_fail
    add rx72_pos, rx72_off, $I11
    goto alt77_end
  alt77_1:
    set_addr $I10, alt77_2
    rx72_cur."!mark_push"(0, rx72_pos, $I10)
.annotate "line", 36
  # rx literal  "#"
    add $I11, rx72_pos, 1
    gt $I11, rx72_eos, rx72_fail
    sub $I11, rx72_pos, rx72_off
    substr $S10, rx72_tgt, $I11, 1
    ne $S10, "#", rx72_fail
    add rx72_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx72_pos, rx72_off
    find_cclass $I11, 4096, rx72_tgt, $I10, rx72_eos
    add rx72_pos, rx72_off, $I11
    goto alt77_end
  alt77_2:
.annotate "line", 37
  # rxanchor bol
    eq rx72_pos, 0, rxanchor78_done
    ge rx72_pos, rx72_eos, rx72_fail
    sub $I10, rx72_pos, rx72_off
    dec $I10
    is_cclass $I11, 4096, rx72_tgt, $I10
    unless $I11, rx72_fail
  rxanchor78_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."pod_comment"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  alt77_end:
.annotate "line", 38
    (rx72_rep) = rx72_cur."!mark_commit"($I79)
    rx72_cur."!mark_push"(rx72_rep, rx72_pos, $I79)
    goto rxquantr76_loop
  rxquantr76_done:
.annotate "line", 39
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."MARKER"("ws")
    unless $P10, rx72_fail
  alt75_end:
.annotate "line", 32
  # rx pass
    rx72_cur."!cursor_pass"(rx72_pos, "ws")
    rx72_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx72_pos)
    .return (rx72_cur)
  rx72_fail:
.annotate "line", 4
    (rx72_rep, rx72_pos, $I10, $P10) = rx72_cur."!mark_fail"(0)
    lt rx72_pos, -1, rx72_done
    eq rx72_pos, -1, rx72_fail
    jump $I10
  rx72_done:
    rx72_cur."!cursor_fail"()
    rx72_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx72_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1258533478.31768") :method
.annotate "line", 4
    new $P74, "ResizablePMCArray"
    push $P74, ""
    push $P74, ""
    .return ($P74)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .const 'Sub' $P87 = "25_1258533478.31768" 
    capture_lex $P87
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
    rx81_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx81_cur
    .local pmc match
    .lex "$/", match
    length rx81_eos, rx81_tgt
    set rx81_off, 0
    lt $I10, 2, rx81_start
    sub rx81_off, $I10, 1
    substr rx81_tgt, rx81_tgt, rx81_off
  rx81_start:
  alt84_0:
.annotate "line", 44
    set_addr $I10, alt84_1
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
.annotate "line", 45
  # rxanchor bol
    eq rx81_pos, 0, rxanchor85_done
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    dec $I10
    is_cclass $I11, 4096, rx81_tgt, $I10
    unless $I11, rx81_fail
  rxanchor85_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    .const 'Sub' $P87 = "25_1258533478.31768" 
    capture_lex $P87
    $P10 = rx81_cur."before"($P87)
    unless $P10, rx81_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    $P10 = rx81_cur."pod_comment"()
    unless $P10, rx81_fail
    rx81_pos = $P10."pos"()
    goto alt84_end
  alt84_1:
    set_addr $I10, alt84_2
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
.annotate "line", 46
  # rx rxquantr93 ** 0..*
    set_addr $I94, rxquantr93_done
    rx81_cur."!mark_push"(0, rx81_pos, $I94)
  rxquantr93_loop:
  # rx enumcharlist negate=0 
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx81_fail
    inc rx81_pos
    (rx81_rep) = rx81_cur."!mark_commit"($I94)
    rx81_cur."!mark_push"(rx81_rep, rx81_pos, $I94)
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
    goto alt84_end
  alt84_2:
.annotate "line", 47
  # rx rxquantr95 ** 1..*
    set_addr $I96, rxquantr95_done
    rx81_cur."!mark_push"(0, -1, $I96)
  rxquantr95_loop:
  # rx enumcharlist negate=0 
    ge rx81_pos, rx81_eos, rx81_fail
    sub $I10, rx81_pos, rx81_off
    substr $S10, rx81_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx81_fail
    inc rx81_pos
    (rx81_rep) = rx81_cur."!mark_commit"($I96)
    rx81_cur."!mark_push"(rx81_rep, rx81_pos, $I96)
    goto rxquantr95_loop
  rxquantr95_done:
  alt84_end:
.annotate "line", 42
  # rx pass
    rx81_cur."!cursor_pass"(rx81_pos, "unv")
    rx81_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx81_pos)
    .return (rx81_cur)
  rx81_fail:
.annotate "line", 4
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
.sub "!PREFIX__unv"  :subid("24_1258533478.31768") :method
.annotate "line", 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block86"  :anon :subid("25_1258533478.31768") :method :outer("23_1258533478.31768")
.annotate "line", 45
    .local string rx88_tgt
    .local int rx88_pos
    .local int rx88_off
    .local int rx88_eos
    .local int rx88_rep
    .local pmc rx88_cur
    (rx88_cur, rx88_pos, rx88_tgt, $I10) = self."!cursor_start"()
    rx88_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx88_cur
    .local pmc match
    .lex "$/", match
    length rx88_eos, rx88_tgt
    set rx88_off, 0
    lt $I10, 2, rx88_start
    sub rx88_off, $I10, 1
    substr rx88_tgt, rx88_tgt, rx88_off
  rx88_start:
    ge rx88_pos, 0, rxscan89_done
  rxscan89_loop:
    ($P10) = rx88_cur."from"()
    inc $P10
    set rx88_pos, $P10
    ge rx88_pos, rx88_eos, rxscan89_done
    set_addr $I10, rxscan89_loop
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  rxscan89_done:
  # rx rxquantr90 ** 0..*
    set_addr $I91, rxquantr90_done
    rx88_cur."!mark_push"(0, rx88_pos, $I91)
  rxquantr90_loop:
  # rx enumcharlist negate=0 
    ge rx88_pos, rx88_eos, rx88_fail
    sub $I10, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx88_fail
    inc rx88_pos
    (rx88_rep) = rx88_cur."!mark_commit"($I91)
    rx88_cur."!mark_push"(rx88_rep, rx88_pos, $I91)
    goto rxquantr90_loop
  rxquantr90_done:
  # rx literal  "="
    add $I11, rx88_pos, 1
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 1
    ne $S10, "=", rx88_fail
    add rx88_pos, 1
  alt92_0:
    set_addr $I10, alt92_1
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx charclass w
    ge rx88_pos, rx88_eos, rx88_fail
    sub $I10, rx88_pos, rx88_off
    is_cclass $I11, 8192, rx88_tgt, $I10
    unless $I11, rx88_fail
    inc rx88_pos
    goto alt92_end
  alt92_1:
  # rx literal  "\\"
    add $I11, rx88_pos, 1
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 1
    ne $S10, "\\", rx88_fail
    add rx88_pos, 1
  alt92_end:
  # rx pass
    rx88_cur."!cursor_pass"(rx88_pos, "")
    rx88_cur."!cursor_debug"("PASS  ", "", " at pos=", rx88_pos)
    .return (rx88_cur)
  rx88_fail:
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    rx88_cur."!cursor_debug"("FAIL  ", "")
    .return (rx88_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1258533478.31768" 
    capture_lex $P131
    .local string rx98_tgt
    .local int rx98_pos
    .local int rx98_off
    .local int rx98_eos
    .local int rx98_rep
    .local pmc rx98_cur
    (rx98_cur, rx98_pos, rx98_tgt, $I10) = self."!cursor_start"()
    rx98_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx98_cur
    .local pmc match
    .lex "$/", match
    length rx98_eos, rx98_tgt
    set rx98_off, 0
    lt $I10, 2, rx98_start
    sub rx98_off, $I10, 1
    substr rx98_tgt, rx98_tgt, rx98_off
  rx98_start:
.annotate "line", 52
  # rxanchor bol
    eq rx98_pos, 0, rxanchor101_done
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    dec $I10
    is_cclass $I11, 4096, rx98_tgt, $I10
    unless $I11, rx98_fail
  rxanchor101_done:
  # rx rxquantr102 ** 0..*
    set_addr $I103, rxquantr102_done
    rx98_cur."!mark_push"(0, rx98_pos, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I103)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
  # rx literal  "="
    add $I11, rx98_pos, 1
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 1
    ne $S10, "=", rx98_fail
    add rx98_pos, 1
  alt104_0:
.annotate "line", 53
    set_addr $I10, alt104_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
.annotate "line", 54
  # rx literal  "begin"
    add $I11, rx98_pos, 5
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 5
    ne $S10, "begin", rx98_fail
    add rx98_pos, 5
  # rx rxquantr105 ** 1..*
    set_addr $I106, rxquantr105_done
    rx98_cur."!mark_push"(0, -1, $I106)
  rxquantr105_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I106)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I106)
    goto rxquantr105_loop
  rxquantr105_done:
  # rx literal  "END"
    add $I11, rx98_pos, 3
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 3
    ne $S10, "END", rx98_fail
    add rx98_pos, 3
  # rxanchor rwb
    le rx98_pos, 0, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 8192, rx98_tgt, $I10
    if $I11, rx98_fail
    dec $I10
    is_cclass $I11, 8192, rx98_tgt, $I10
    unless $I11, rx98_fail
  alt107_0:
.annotate "line", 55
    set_addr $I10, alt107_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx rxquantf108 ** 0..*
    set_addr $I10, rxquantf108_loop
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
    goto rxquantf108_done
  rxquantf108_loop:
  # rx charclass .
    ge rx98_pos, rx98_eos, rx98_fail
    inc rx98_pos
    set_addr $I10, rxquantf108_loop
    rx98_cur."!mark_push"($I109, rx98_pos, $I10)
  rxquantf108_done:
  # rx charclass nl
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 4096, rx98_tgt, $I10
    unless $I11, rx98_fail
    substr $S10, rx98_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx98_pos, $I11
    inc rx98_pos
  # rx literal  "=end"
    add $I11, rx98_pos, 4
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 4
    ne $S10, "=end", rx98_fail
    add rx98_pos, 4
  # rx rxquantr110 ** 1..*
    set_addr $I111, rxquantr110_done
    rx98_cur."!mark_push"(0, -1, $I111)
  rxquantr110_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I111)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I111)
    goto rxquantr110_loop
  rxquantr110_done:
  # rx literal  "END"
    add $I11, rx98_pos, 3
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 3
    ne $S10, "END", rx98_fail
    add rx98_pos, 3
  # rxanchor rwb
    le rx98_pos, 0, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 8192, rx98_tgt, $I10
    if $I11, rx98_fail
    dec $I10
    is_cclass $I11, 8192, rx98_tgt, $I10
    unless $I11, rx98_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx98_pos, rx98_off
    find_cclass $I11, 4096, rx98_tgt, $I10, rx98_eos
    add rx98_pos, rx98_off, $I11
    goto alt107_end
  alt107_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx98_pos, rx98_off
    find_not_cclass $I11, 65535, rx98_tgt, $I10, rx98_eos
    add rx98_pos, rx98_off, $I11
  alt107_end:
.annotate "line", 54
    goto alt104_end
  alt104_1:
    set_addr $I10, alt104_2
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
.annotate "line", 56
  # rx literal  "begin"
    add $I11, rx98_pos, 5
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 5
    ne $S10, "begin", rx98_fail
    add rx98_pos, 5
  # rx rxquantr112 ** 1..*
    set_addr $I113, rxquantr112_done
    rx98_cur."!mark_push"(0, -1, $I113)
  rxquantr112_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I113)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I113)
    goto rxquantr112_loop
  rxquantr112_done:
  # rx subrule "identifier" subtype=capture negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."identifier"()
    unless $P10, rx98_fail
    rx98_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx98_pos = $P10."pos"()
  alt114_0:
.annotate "line", 57
    set_addr $I10, alt114_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
.annotate "line", 58
  # rx rxquantf115 ** 0..*
    set_addr $I10, rxquantf115_loop
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
    goto rxquantf115_done
  rxquantf115_loop:
  # rx charclass .
    ge rx98_pos, rx98_eos, rx98_fail
    inc rx98_pos
    set_addr $I10, rxquantf115_loop
    rx98_cur."!mark_push"($I116, rx98_pos, $I10)
  rxquantf115_done:
  # rx charclass nl
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 4096, rx98_tgt, $I10
    unless $I11, rx98_fail
    substr $S10, rx98_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx98_pos, $I11
    inc rx98_pos
  # rx literal  "=end"
    add $I11, rx98_pos, 4
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 4
    ne $S10, "=end", rx98_fail
    add rx98_pos, 4
  # rx rxquantr117 ** 1..*
    set_addr $I118, rxquantr117_done
    rx98_cur."!mark_push"(0, -1, $I118)
  rxquantr117_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I118)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I118)
    goto rxquantr117_loop
  rxquantr117_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."!BACKREF"("identifier")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  # rxanchor rwb
    le rx98_pos, 0, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 8192, rx98_tgt, $I10
    if $I11, rx98_fail
    dec $I10
    is_cclass $I11, 8192, rx98_tgt, $I10
    unless $I11, rx98_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx98_pos, rx98_off
    find_cclass $I11, 4096, rx98_tgt, $I10, rx98_eos
    add rx98_pos, rx98_off, $I11
    goto alt114_end
  alt114_1:
.annotate "line", 59
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("=begin without matching =end")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  alt114_end:
.annotate "line", 56
    goto alt104_end
  alt104_2:
    set_addr $I10, alt104_3
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
.annotate "line", 61
  # rx literal  "begin"
    add $I11, rx98_pos, 5
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 5
    ne $S10, "begin", rx98_fail
    add rx98_pos, 5
  # rxanchor rwb
    le rx98_pos, 0, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 8192, rx98_tgt, $I10
    if $I11, rx98_fail
    dec $I10
    is_cclass $I11, 8192, rx98_tgt, $I10
    unless $I11, rx98_fail
  # rx rxquantr120 ** 0..*
    set_addr $I121, rxquantr120_done
    rx98_cur."!mark_push"(0, rx98_pos, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I121)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  alt122_0:
.annotate "line", 62
    set_addr $I10, alt122_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rxanchor eol
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 4096, rx98_tgt, $I10
    if $I11, rxanchor123_done
    ne rx98_pos, rx98_eos, rx98_fail
    eq rx98_pos, 0, rxanchor123_done
    dec $I10
    is_cclass $I11, 4096, rx98_tgt, $I10
    if $I11, rx98_fail
  rxanchor123_done:
    goto alt122_end
  alt122_1:
    set_addr $I10, alt122_2
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx literal  "#"
    add $I11, rx98_pos, 1
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 1
    ne $S10, "#", rx98_fail
    add rx98_pos, 1
    goto alt122_end
  alt122_2:
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  alt122_end:
  alt124_0:
.annotate "line", 63
    set_addr $I10, alt124_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
.annotate "line", 64
  # rx rxquantf125 ** 0..*
    set_addr $I10, rxquantf125_loop
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
    goto rxquantf125_done
  rxquantf125_loop:
  # rx charclass .
    ge rx98_pos, rx98_eos, rx98_fail
    inc rx98_pos
    set_addr $I10, rxquantf125_loop
    rx98_cur."!mark_push"($I126, rx98_pos, $I10)
  rxquantf125_done:
  # rx charclass nl
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 4096, rx98_tgt, $I10
    unless $I11, rx98_fail
    substr $S10, rx98_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx98_pos, $I11
    inc rx98_pos
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx98_cur."!mark_push"(0, rx98_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx98_fail
    inc rx98_pos
    (rx98_rep) = rx98_cur."!mark_commit"($I128)
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  # rx literal  "=end"
    add $I11, rx98_pos, 4
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 4
    ne $S10, "=end", rx98_fail
    add rx98_pos, 4
  # rxanchor rwb
    le rx98_pos, 0, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 8192, rx98_tgt, $I10
    if $I11, rx98_fail
    dec $I10
    is_cclass $I11, 8192, rx98_tgt, $I10
    unless $I11, rx98_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx98_pos, rx98_off
    find_cclass $I11, 4096, rx98_tgt, $I10, rx98_eos
    add rx98_pos, rx98_off, $I11
    goto alt124_end
  alt124_1:
.annotate "line", 65
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("=begin without matching =end")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  alt124_end:
.annotate "line", 61
    goto alt104_end
  alt104_3:
.annotate "line", 69
  # rx rxquantr129 ** 0..1
    set_addr $I137, rxquantr129_done
    rx98_cur."!mark_push"(0, rx98_pos, $I137)
  rxquantr129_loop:
.annotate "line", 68
  # rx subrule "before" subtype=zerowidth negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    .const 'Sub' $P131 = "28_1258533478.31768" 
    capture_lex $P131
    $P10 = rx98_cur."before"($P131)
    unless $P10, rx98_fail
.annotate "line", 69
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
    (rx98_rep) = rx98_cur."!mark_commit"($I137)
  rxquantr129_done:
  alt138_0:
.annotate "line", 70
    set_addr $I10, alt138_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."alpha"()
    unless $P10, rx98_fail
    rx98_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx98_pos = $P10."pos"()
    goto alt138_end
  alt138_1:
    set_addr $I10, alt138_2
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx charclass s
    ge rx98_pos, rx98_eos, rx98_fail
    sub $I10, rx98_pos, rx98_off
    is_cclass $I11, 32, rx98_tgt, $I10
    unless $I11, rx98_fail
    inc rx98_pos
    goto alt138_end
  alt138_2:
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("Illegal pod directive")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  alt138_end:
.annotate "line", 71
  # rx charclass_q N r 0..-1
    sub $I10, rx98_pos, rx98_off
    find_cclass $I11, 4096, rx98_tgt, $I10, rx98_eos
    add rx98_pos, rx98_off, $I11
  alt104_end:
.annotate "line", 51
  # rx pass
    rx98_cur."!cursor_pass"(rx98_pos, "pod_comment")
    rx98_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx98_pos)
    .return (rx98_cur)
  rx98_fail:
.annotate "line", 4
    (rx98_rep, rx98_pos, $I10, $P10) = rx98_cur."!mark_fail"(0)
    lt rx98_pos, -1, rx98_done
    eq rx98_pos, -1, rx98_fail
    jump $I10
  rx98_done:
    rx98_cur."!cursor_fail"()
    rx98_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx98_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1258533478.31768") :method
.annotate "line", 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1258533478.31768") :method :outer("26_1258533478.31768")
.annotate "line", 68
    .local string rx132_tgt
    .local int rx132_pos
    .local int rx132_off
    .local int rx132_eos
    .local int rx132_rep
    .local pmc rx132_cur
    (rx132_cur, rx132_pos, rx132_tgt, $I10) = self."!cursor_start"()
    rx132_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx132_cur
    .local pmc match
    .lex "$/", match
    length rx132_eos, rx132_tgt
    set rx132_off, 0
    lt $I10, 2, rx132_start
    sub rx132_off, $I10, 1
    substr rx132_tgt, rx132_tgt, rx132_off
  rx132_start:
    ge rx132_pos, 0, rxscan133_done
  rxscan133_loop:
    ($P10) = rx132_cur."from"()
    inc $P10
    set rx132_pos, $P10
    ge rx132_pos, rx132_eos, rxscan133_done
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
.sub "comp_unit"  :subid("29_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx140_tgt
    .local int rx140_pos
    .local int rx140_off
    .local int rx140_eos
    .local int rx140_rep
    .local pmc rx140_cur
    (rx140_cur, rx140_pos, rx140_tgt, $I10) = self."!cursor_start"()
    rx140_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx140_cur
    .local pmc match
    .lex "$/", match
    length rx140_eos, rx140_tgt
    set rx140_off, 0
    lt $I10, 2, rx140_start
    sub rx140_off, $I10, 1
    substr rx140_tgt, rx140_tgt, rx140_off
  rx140_start:
.annotate "line", 79
  # rx subrule "newpad" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."newpad"()
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
.annotate "line", 80
  # rx subrule "statementlist" subtype=capture negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."statementlist"()
    unless $P10, rx140_fail
    rx140_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx140_pos = $P10."pos"()
  alt144_0:
.annotate "line", 81
    set_addr $I10, alt144_1
    rx140_cur."!mark_push"(0, rx140_pos, $I10)
  # rxanchor eos
    ne rx140_pos, rx140_eos, rx140_fail
    goto alt144_end
  alt144_1:
  # rx subrule "panic" subtype=method negate=
    rx140_cur."!cursor_pos"(rx140_pos)
    $P10 = rx140_cur."panic"("Confused")
    unless $P10, rx140_fail
    rx140_pos = $P10."pos"()
  alt144_end:
.annotate "line", 78
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
.sub "!PREFIX__comp_unit"  :subid("30_1258533478.31768") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx146_tgt
    .local int rx146_pos
    .local int rx146_off
    .local int rx146_eos
    .local int rx146_rep
    .local pmc rx146_cur
    (rx146_cur, rx146_pos, rx146_tgt, $I10) = self."!cursor_start"()
    rx146_cur."!cursor_debug"("START ", "statementlist")
    rx146_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx146_cur
    .local pmc match
    .lex "$/", match
    length rx146_eos, rx146_tgt
    set rx146_off, 0
    lt $I10, 2, rx146_start
    sub rx146_off, $I10, 1
    substr rx146_tgt, rx146_tgt, rx146_off
  rx146_start:
  alt149_0:
.annotate "line", 84
    set_addr $I10, alt149_1
    rx146_cur."!mark_push"(0, rx146_pos, $I10)
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
  # rxanchor eos
    ne rx146_pos, rx146_eos, rx146_fail
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
    goto alt149_end
  alt149_1:
.annotate "line", 86
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
  # rx rxquantr153 ** 0..*
    set_addr $I155, rxquantr153_done
    rx146_cur."!mark_push"(0, rx146_pos, $I155)
  rxquantr153_loop:
  # rx subrule "statement" subtype=capture negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."statement"()
    unless $P10, rx146_fail
    rx146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx146_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."eat_terminator"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
    (rx146_rep) = rx146_cur."!mark_commit"($I155)
    rx146_cur."!mark_push"(rx146_rep, rx146_pos, $I155)
    goto rxquantr153_loop
  rxquantr153_done:
  # rx subrule "ws" subtype=method negate=
    rx146_cur."!cursor_pos"(rx146_pos)
    $P10 = rx146_cur."ws"()
    unless $P10, rx146_fail
    rx146_pos = $P10."pos"()
  alt149_end:
.annotate "line", 84
  # rx pass
    rx146_cur."!cursor_pass"(rx146_pos, "statementlist")
    rx146_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx146_pos)
    .return (rx146_cur)
  rx146_fail:
.annotate "line", 4
    (rx146_rep, rx146_pos, $I10, $P10) = rx146_cur."!mark_fail"(0)
    lt rx146_pos, -1, rx146_done
    eq rx146_pos, -1, rx146_fail
    jump $I10
  rx146_done:
    rx146_cur."!cursor_fail"()
    rx146_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx146_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1258533478.31768") :method
.annotate "line", 4
    new $P148, "ResizablePMCArray"
    push $P148, ""
    push $P148, ""
    .return ($P148)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .const 'Sub' $P162 = "35_1258533478.31768" 
    capture_lex $P162
    .local string rx158_tgt
    .local int rx158_pos
    .local int rx158_off
    .local int rx158_eos
    .local int rx158_rep
    .local pmc rx158_cur
    (rx158_cur, rx158_pos, rx158_tgt, $I10) = self."!cursor_start"()
    rx158_cur."!cursor_debug"("START ", "statement")
    rx158_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx158_cur
    .local pmc match
    .lex "$/", match
    length rx158_eos, rx158_tgt
    set rx158_off, 0
    lt $I10, 2, rx158_start
    sub rx158_off, $I10, 1
    substr rx158_tgt, rx158_tgt, rx158_off
  rx158_start:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx158_cur."!cursor_pos"(rx158_pos)
    .const 'Sub' $P162 = "35_1258533478.31768" 
    capture_lex $P162
    $P10 = rx158_cur."before"($P162)
    if $P10, rx158_fail
  alt166_0:
.annotate "line", 91
    set_addr $I10, alt166_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 92
  # rx subrule "statement_control" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."statement_control"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx158_pos = $P10."pos"()
    goto alt166_end
  alt166_1:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."EXPR"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx158_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."ws"()
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
.annotate "line", 97
  # rx rxquantr167 ** 0..1
    set_addr $I171, rxquantr167_done
    rx158_cur."!mark_push"(0, rx158_pos, $I171)
  rxquantr167_loop:
  alt168_0:
.annotate "line", 94
    set_addr $I10, alt168_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."statement_mod_cond"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx158_pos = $P10."pos"()
  # rx rxquantr169 ** 0..1
    set_addr $I170, rxquantr169_done
    rx158_cur."!mark_push"(0, rx158_pos, $I170)
  rxquantr169_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."statement_mod_loop"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx158_pos = $P10."pos"()
    (rx158_rep) = rx158_cur."!mark_commit"($I170)
  rxquantr169_done:
    goto alt168_end
  alt168_1:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."statement_mod_loop"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx158_pos = $P10."pos"()
  alt168_end:
.annotate "line", 97
    (rx158_rep) = rx158_cur."!mark_commit"($I171)
  rxquantr167_done:
  alt166_end:
.annotate "line", 89
  # rx pass
    rx158_cur."!cursor_pass"(rx158_pos, "statement")
    rx158_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx158_pos)
    .return (rx158_cur)
  rx158_fail:
.annotate "line", 4
    (rx158_rep, rx158_pos, $I10, $P10) = rx158_cur."!mark_fail"(0)
    lt rx158_pos, -1, rx158_done
    eq rx158_pos, -1, rx158_fail
    jump $I10
  rx158_done:
    rx158_cur."!cursor_fail"()
    rx158_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx158_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1258533478.31768") :method
.annotate "line", 4
    new $P160, "ResizablePMCArray"
    push $P160, ""
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "_block161"  :anon :subid("35_1258533478.31768") :method :outer("33_1258533478.31768")
.annotate "line", 90
    .local string rx163_tgt
    .local int rx163_pos
    .local int rx163_off
    .local int rx163_eos
    .local int rx163_rep
    .local pmc rx163_cur
    (rx163_cur, rx163_pos, rx163_tgt, $I10) = self."!cursor_start"()
    rx163_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx163_cur
    .local pmc match
    .lex "$/", match
    length rx163_eos, rx163_tgt
    set rx163_off, 0
    lt $I10, 2, rx163_start
    sub rx163_off, $I10, 1
    substr rx163_tgt, rx163_tgt, rx163_off
  rx163_start:
    ge rx163_pos, 0, rxscan164_done
  rxscan164_loop:
    ($P10) = rx163_cur."from"()
    inc $P10
    set rx163_pos, $P10
    ge rx163_pos, rx163_eos, rxscan164_done
    set_addr $I10, rxscan164_loop
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
  rxscan164_done:
  alt165_0:
    set_addr $I10, alt165_1
    rx163_cur."!mark_push"(0, rx163_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx163_pos, rx163_eos, rx163_fail
    sub $I10, rx163_pos, rx163_off
    substr $S10, rx163_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx163_fail
    inc rx163_pos
    goto alt165_end
  alt165_1:
  # rxanchor eos
    ne rx163_pos, rx163_eos, rx163_fail
  alt165_end:
  # rx pass
    rx163_cur."!cursor_pass"(rx163_pos, "")
    rx163_cur."!cursor_debug"("PASS  ", "", " at pos=", rx163_pos)
    .return (rx163_cur)
  rx163_fail:
    (rx163_rep, rx163_pos, $I10, $P10) = rx163_cur."!mark_fail"(0)
    lt rx163_pos, -1, rx163_done
    eq rx163_pos, -1, rx163_fail
    jump $I10
  rx163_done:
    rx163_cur."!cursor_fail"()
    rx163_cur."!cursor_debug"("FAIL  ", "")
    .return (rx163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx173_tgt
    .local int rx173_pos
    .local int rx173_off
    .local int rx173_eos
    .local int rx173_rep
    .local pmc rx173_cur
    (rx173_cur, rx173_pos, rx173_tgt, $I10) = self."!cursor_start"()
    rx173_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx173_cur
    .local pmc match
    .lex "$/", match
    length rx173_eos, rx173_tgt
    set rx173_off, 0
    lt $I10, 2, rx173_start
    sub rx173_off, $I10, 1
    substr rx173_tgt, rx173_tgt, rx173_off
  rx173_start:
  alt176_0:
.annotate "line", 101
    set_addr $I10, alt176_1
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate "line", 102
  # rx literal  ";"
    add $I11, rx173_pos, 1
    gt $I11, rx173_eos, rx173_fail
    sub $I11, rx173_pos, rx173_off
    substr $S10, rx173_tgt, $I11, 1
    ne $S10, ";", rx173_fail
    add rx173_pos, 1
    goto alt176_end
  alt176_1:
    set_addr $I10, alt176_2
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."MARKED"("endstmt")
    unless $P10, rx173_fail
    goto alt176_end
  alt176_2:
    set_addr $I10, alt176_3
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx173_cur."!cursor_pos"(rx173_pos)
    $P10 = rx173_cur."terminator"()
    unless $P10, rx173_fail
    goto alt176_end
  alt176_3:
.annotate "line", 105
  # rxanchor eos
    ne rx173_pos, rx173_eos, rx173_fail
  alt176_end:
.annotate "line", 101
  # rx pass
    rx173_cur."!cursor_pass"(rx173_pos, "eat_terminator")
    rx173_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx173_pos)
    .return (rx173_cur)
  rx173_fail:
.annotate "line", 4
    (rx173_rep, rx173_pos, $I10, $P10) = rx173_cur."!mark_fail"(0)
    lt rx173_pos, -1, rx173_done
    eq rx173_pos, -1, rx173_fail
    jump $I10
  rx173_done:
    rx173_cur."!cursor_fail"()
    rx173_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx173_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1258533478.31768") :method
.annotate "line", 4
    new $P175, "ResizablePMCArray"
    push $P175, ""
    push $P175, ""
    push $P175, ""
    push $P175, ";"
    .return ($P175)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx178_tgt
    .local int rx178_pos
    .local int rx178_off
    .local int rx178_eos
    .local int rx178_rep
    .local pmc rx178_cur
    (rx178_cur, rx178_pos, rx178_tgt, $I10) = self."!cursor_start"()
    rx178_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx178_cur
    .local pmc match
    .lex "$/", match
    length rx178_eos, rx178_tgt
    set rx178_off, 0
    lt $I10, 2, rx178_start
    sub rx178_off, $I10, 1
    substr rx178_tgt, rx178_tgt, rx178_off
  rx178_start:
.annotate "line", 109
  # rx subrule "EXPR" subtype=capture negate=
    rx178_cur."!cursor_pos"(rx178_pos)
    $P10 = rx178_cur."EXPR"()
    unless $P10, rx178_fail
    rx178_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx178_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx178_cur."!cursor_pos"(rx178_pos)
    $P10 = rx178_cur."ws"()
    unless $P10, rx178_fail
    rx178_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx178_cur."!cursor_pos"(rx178_pos)
    $P10 = rx178_cur."pblock"()
    unless $P10, rx178_fail
    rx178_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx178_pos = $P10."pos"()
.annotate "line", 108
  # rx pass
    rx178_cur."!cursor_pass"(rx178_pos, "xblock")
    rx178_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx178_pos)
    .return (rx178_cur)
  rx178_fail:
.annotate "line", 4
    (rx178_rep, rx178_pos, $I10, $P10) = rx178_cur."!mark_fail"(0)
    lt rx178_pos, -1, rx178_done
    eq rx178_pos, -1, rx178_fail
    jump $I10
  rx178_done:
    rx178_cur."!cursor_fail"()
    rx178_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx178_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1258533478.31768") :method
.annotate "line", 4
    $P180 = self."!PREFIX__!subrule"("EXPR", "")
    new $P181, "ResizablePMCArray"
    push $P181, $P180
    .return ($P181)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt, $I10) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    set rx183_off, 0
    lt $I10, 2, rx183_start
    sub rx183_off, $I10, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
  alt188_0:
.annotate "line", 112
    set_addr $I10, alt188_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."lambda"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."newpad"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."signature"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx183_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."blockoid"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx183_pos = $P10."pos"()
.annotate "line", 113
    goto alt188_end
  alt188_1:
    set_addr $I10, alt188_2
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx183_pos, rx183_eos, rx183_fail
    sub $I10, rx183_pos, rx183_off
    substr $S10, rx183_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx183_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."newpad"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."blockoid"()
    unless $P10, rx183_fail
    rx183_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx183_pos = $P10."pos"()
.annotate "line", 117
    goto alt188_end
  alt188_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."panic"("Missing block")
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
  alt188_end:
.annotate "line", 112
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "pblock")
    rx183_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_fail:
.annotate "line", 4
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
.sub "!PREFIX__pblock"  :subid("41_1258533478.31768") :method
.annotate "line", 4
    $P185 = self."!PREFIX__!subrule"("", "")
    $P186 = self."!PREFIX__!subrule"("", "")
    new $P187, "ResizablePMCArray"
    push $P187, $P185
    push $P187, "{"
    push $P187, $P186
    .return ($P187)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx190_tgt
    .local int rx190_pos
    .local int rx190_off
    .local int rx190_eos
    .local int rx190_rep
    .local pmc rx190_cur
    (rx190_cur, rx190_pos, rx190_tgt, $I10) = self."!cursor_start"()
    rx190_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx190_cur
    .local pmc match
    .lex "$/", match
    length rx190_eos, rx190_tgt
    set rx190_off, 0
    lt $I10, 2, rx190_start
    sub rx190_off, $I10, 1
    substr rx190_tgt, rx190_tgt, rx190_off
  rx190_start:
  alt193_0:
.annotate "line", 123
    set_addr $I10, alt193_1
    rx190_cur."!mark_push"(0, rx190_pos, $I10)
  # rx literal  "->"
    add $I11, rx190_pos, 2
    gt $I11, rx190_eos, rx190_fail
    sub $I11, rx190_pos, rx190_off
    substr $S10, rx190_tgt, $I11, 2
    ne $S10, "->", rx190_fail
    add rx190_pos, 2
    goto alt193_end
  alt193_1:
  # rx literal  "<->"
    add $I11, rx190_pos, 3
    gt $I11, rx190_eos, rx190_fail
    sub $I11, rx190_pos, rx190_off
    substr $S10, rx190_tgt, $I11, 3
    ne $S10, "<->", rx190_fail
    add rx190_pos, 3
  alt193_end:
  # rx pass
    rx190_cur."!cursor_pass"(rx190_pos, "lambda")
    rx190_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx190_pos)
    .return (rx190_cur)
  rx190_fail:
.annotate "line", 4
    (rx190_rep, rx190_pos, $I10, $P10) = rx190_cur."!mark_fail"(0)
    lt rx190_pos, -1, rx190_done
    eq rx190_pos, -1, rx190_fail
    jump $I10
  rx190_done:
    rx190_cur."!cursor_fail"()
    rx190_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx190_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1258533478.31768") :method
.annotate "line", 4
    new $P192, "ResizablePMCArray"
    push $P192, "<->"
    push $P192, "->"
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt, $I10) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx195_cur
    .local pmc match
    .lex "$/", match
    length rx195_eos, rx195_tgt
    set rx195_off, 0
    lt $I10, 2, rx195_start
    sub rx195_off, $I10, 1
    substr rx195_tgt, rx195_tgt, rx195_off
  rx195_start:
  alt199_0:
.annotate "line", 126
    set_addr $I10, alt199_1
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx195_pos, rx195_eos, rx195_fail
    sub $I10, rx195_pos, rx195_off
    substr $S10, rx195_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx195_fail
    goto alt199_end
  alt199_1:
  # rx subrule "panic" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."panic"("Missing block")
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
  alt199_end:
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."newpad"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."blockoid"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx195_pos = $P10."pos"()
.annotate "line", 125
  # rx pass
    rx195_cur."!cursor_pass"(rx195_pos, "block")
    rx195_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx195_pos)
    .return (rx195_cur)
  rx195_fail:
.annotate "line", 4
    (rx195_rep, rx195_pos, $I10, $P10) = rx195_cur."!mark_fail"(0)
    lt rx195_pos, -1, rx195_done
    eq rx195_pos, -1, rx195_fail
    jump $I10
  rx195_done:
    rx195_cur."!cursor_fail"()
    rx195_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx195_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1258533478.31768") :method
.annotate "line", 4
    $P197 = self."!PREFIX__!subrule"("", "")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    push $P198, "{"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx201_tgt
    .local int rx201_pos
    .local int rx201_off
    .local int rx201_eos
    .local int rx201_rep
    .local pmc rx201_cur
    (rx201_cur, rx201_pos, rx201_tgt, $I10) = self."!cursor_start"()
    rx201_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx201_cur
    .local pmc match
    .lex "$/", match
    length rx201_eos, rx201_tgt
    set rx201_off, 0
    lt $I10, 2, rx201_start
    sub rx201_off, $I10, 1
    substr rx201_tgt, rx201_tgt, rx201_off
  rx201_start:
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."finishpad"()
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
.annotate "line", 133
  # rx literal  "{"
    add $I11, rx201_pos, 1
    gt $I11, rx201_eos, rx201_fail
    sub $I11, rx201_pos, rx201_off
    substr $S10, rx201_tgt, $I11, 1
    ne $S10, "{", rx201_fail
    add rx201_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."statementlist"()
    unless $P10, rx201_fail
    rx201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx201_pos = $P10."pos"()
  alt205_0:
    set_addr $I10, alt205_1
    rx201_cur."!mark_push"(0, rx201_pos, $I10)
  # rx literal  "}"
    add $I11, rx201_pos, 1
    gt $I11, rx201_eos, rx201_fail
    sub $I11, rx201_pos, rx201_off
    substr $S10, rx201_tgt, $I11, 1
    ne $S10, "}", rx201_fail
    add rx201_pos, 1
    goto alt205_end
  alt205_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."FAILGOAL"("'}'")
    unless $P10, rx201_fail
    rx201_pos = $P10."pos"()
  alt205_end:
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."ENDSTMT"()
    unless $P10, rx201_fail
.annotate "line", 131
  # rx pass
    rx201_cur."!cursor_pass"(rx201_pos, "blockoid")
    rx201_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx201_pos)
    .return (rx201_cur)
  rx201_fail:
.annotate "line", 4
    (rx201_rep, rx201_pos, $I10, $P10) = rx201_cur."!mark_fail"(0)
    lt rx201_pos, -1, rx201_done
    eq rx201_pos, -1, rx201_fail
    jump $I10
  rx201_done:
    rx201_cur."!cursor_fail"()
    rx201_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx201_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1258533478.31768") :method
.annotate "line", 4
    $P203 = self."!PREFIX__!subrule"("", "")
    new $P204, "ResizablePMCArray"
    push $P204, $P203
    .return ($P204)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx208_tgt
    .local int rx208_pos
    .local int rx208_off
    .local int rx208_eos
    .local int rx208_rep
    .local pmc rx208_cur
    (rx208_cur, rx208_pos, rx208_tgt, $I10) = self."!cursor_start"()
    rx208_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx208_cur
    .local pmc match
    .lex "$/", match
    length rx208_eos, rx208_tgt
    set rx208_off, 0
    lt $I10, 2, rx208_start
    sub rx208_off, $I10, 1
    substr rx208_tgt, rx208_tgt, rx208_off
  rx208_start:
.annotate "line", 137
  # rx pass
    rx208_cur."!cursor_pass"(rx208_pos, "newpad")
    rx208_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx208_pos)
    .return (rx208_cur)
  rx208_fail:
.annotate "line", 4
    (rx208_rep, rx208_pos, $I10, $P10) = rx208_cur."!mark_fail"(0)
    lt rx208_pos, -1, rx208_done
    eq rx208_pos, -1, rx208_fail
    jump $I10
  rx208_done:
    rx208_cur."!cursor_fail"()
    rx208_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx208_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1258533478.31768") :method
.annotate "line", 4
    new $P210, "ResizablePMCArray"
    push $P210, ""
    .return ($P210)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt, $I10) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt $I10, 2, rx212_start
    sub rx212_off, $I10, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
.annotate "line", 138
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "finishpad")
    rx212_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 4
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1258533478.31768") :method
.annotate "line", 4
    new $P214, "ResizablePMCArray"
    push $P214, ""
    .return ($P214)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1258533478.31768") :method
.annotate "line", 140
    $P216 = self."!protoregex"("terminator")
    .return ($P216)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1258533478.31768") :method
.annotate "line", 140
    $P218 = self."!PREFIX__!protoregex"("terminator")
    .return ($P218)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx220_tgt
    .local int rx220_pos
    .local int rx220_off
    .local int rx220_eos
    .local int rx220_rep
    .local pmc rx220_cur
    (rx220_cur, rx220_pos, rx220_tgt, $I10) = self."!cursor_start"()
    rx220_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx220_cur
    .local pmc match
    .lex "$/", match
    length rx220_eos, rx220_tgt
    set rx220_off, 0
    lt $I10, 2, rx220_start
    sub rx220_off, $I10, 1
    substr rx220_tgt, rx220_tgt, rx220_off
  rx220_start:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx220_pos, rx220_eos, rx220_fail
    sub $I10, rx220_pos, rx220_off
    substr $S10, rx220_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx220_fail
  # rx pass
    rx220_cur."!cursor_pass"(rx220_pos, "terminator:sym<;>")
    rx220_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx220_pos)
    .return (rx220_cur)
  rx220_fail:
.annotate "line", 4
    (rx220_rep, rx220_pos, $I10, $P10) = rx220_cur."!mark_fail"(0)
    lt rx220_pos, -1, rx220_done
    eq rx220_pos, -1, rx220_fail
    jump $I10
  rx220_done:
    rx220_cur."!cursor_fail"()
    rx220_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx220_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1258533478.31768") :method
.annotate "line", 4
    new $P222, "ResizablePMCArray"
    push $P222, ";"
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt, $I10) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    set rx224_off, 0
    lt $I10, 2, rx224_start
    sub rx224_off, $I10, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
.annotate "line", 143
  # rx enumcharlist negate=0 zerowidth
    ge rx224_pos, rx224_eos, rx224_fail
    sub $I10, rx224_pos, rx224_off
    substr $S10, rx224_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx224_fail
  # rx pass
    rx224_cur."!cursor_pass"(rx224_pos, "terminator:sym<}>")
    rx224_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx224_pos)
    .return (rx224_cur)
  rx224_fail:
.annotate "line", 4
    (rx224_rep, rx224_pos, $I10, $P10) = rx224_cur."!mark_fail"(0)
    lt rx224_pos, -1, rx224_done
    eq rx224_pos, -1, rx224_fail
    jump $I10
  rx224_done:
    rx224_cur."!cursor_fail"()
    rx224_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1258533478.31768") :method
.annotate "line", 4
    new $P226, "ResizablePMCArray"
    push $P226, "}"
    .return ($P226)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1258533478.31768") :method
.annotate "line", 147
    $P228 = self."!protoregex"("statement_control")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1258533478.31768") :method
.annotate "line", 147
    $P230 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt, $I10) = self."!cursor_start"()
    rx232_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx232_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx232_cur
    .local pmc match
    .lex "$/", match
    length rx232_eos, rx232_tgt
    set rx232_off, 0
    lt $I10, 2, rx232_start
    sub rx232_off, $I10, 1
    substr rx232_tgt, rx232_tgt, rx232_off
  rx232_start:
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_235_fail
    rx232_cur."!mark_push"(0, rx232_pos, $I10)
  # rx literal  "if"
    add $I11, rx232_pos, 2
    gt $I11, rx232_eos, rx232_fail
    sub $I11, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I11, 2
    ne $S10, "if", rx232_fail
    add rx232_pos, 2
    set_addr $I10, rxcap_235_fail
    ($I12, $I11) = rx232_cur."!mark_peek"($I10)
    rx232_cur."!cursor_pos"($I11)
    ($P10) = rx232_cur."!cursor_start"()
    $P10."!cursor_pass"(rx232_pos, "")
    rx232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_235_done
  rxcap_235_fail:
    goto rx232_fail
  rxcap_235_done:
  # rx charclass s
    ge rx232_pos, rx232_eos, rx232_fail
    sub $I10, rx232_pos, rx232_off
    is_cclass $I11, 32, rx232_tgt, $I10
    unless $I11, rx232_fail
    inc rx232_pos
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."xblock"()
    unless $P10, rx232_fail
    rx232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx232_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr238 ** 0..*
    set_addr $I242, rxquantr238_done
    rx232_cur."!mark_push"(0, rx232_pos, $I242)
  rxquantr238_loop:
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx232_pos, 5
    gt $I11, rx232_eos, rx232_fail
    sub $I11, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I11, 5
    ne $S10, "elsif", rx232_fail
    add rx232_pos, 5
  # rx charclass s
    ge rx232_pos, rx232_eos, rx232_fail
    sub $I10, rx232_pos, rx232_off
    is_cclass $I11, 32, rx232_tgt, $I10
    unless $I11, rx232_fail
    inc rx232_pos
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."xblock"()
    unless $P10, rx232_fail
    rx232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx232_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
    (rx232_rep) = rx232_cur."!mark_commit"($I242)
    rx232_cur."!mark_push"(rx232_rep, rx232_pos, $I242)
    goto rxquantr238_loop
  rxquantr238_done:
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
.annotate "line", 153
  # rx rxquantr244 ** 0..1
    set_addr $I248, rxquantr244_done
    rx232_cur."!mark_push"(0, rx232_pos, $I248)
  rxquantr244_loop:
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx232_pos, 4
    gt $I11, rx232_eos, rx232_fail
    sub $I11, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I11, 4
    ne $S10, "else", rx232_fail
    add rx232_pos, 4
  # rx charclass s
    ge rx232_pos, rx232_eos, rx232_fail
    sub $I10, rx232_pos, rx232_off
    is_cclass $I11, 32, rx232_tgt, $I10
    unless $I11, rx232_fail
    inc rx232_pos
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."pblock"()
    unless $P10, rx232_fail
    rx232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx232_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
    (rx232_rep) = rx232_cur."!mark_commit"($I248)
  rxquantr244_done:
  # rx subrule "ws" subtype=method negate=
    rx232_cur."!cursor_pos"(rx232_pos)
    $P10 = rx232_cur."ws"()
    unless $P10, rx232_fail
    rx232_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "statement_control:sym<if>")
    rx232_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_fail:
.annotate "line", 4
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1258533478.31768") :method
.annotate "line", 4
    new $P234, "ResizablePMCArray"
    push $P234, "if"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .const 'Sub' $P260 = "64_1258533478.31768" 
    capture_lex $P260
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    (rx251_cur, rx251_pos, rx251_tgt, $I10) = self."!cursor_start"()
    rx251_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx251_cur
    .local pmc match
    .lex "$/", match
    length rx251_eos, rx251_tgt
    set rx251_off, 0
    lt $I10, 2, rx251_start
    sub rx251_off, $I10, 1
    substr rx251_tgt, rx251_tgt, rx251_off
  rx251_start:
.annotate "line", 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_254_fail
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  # rx literal  "unless"
    add $I11, rx251_pos, 6
    gt $I11, rx251_eos, rx251_fail
    sub $I11, rx251_pos, rx251_off
    substr $S10, rx251_tgt, $I11, 6
    ne $S10, "unless", rx251_fail
    add rx251_pos, 6
    set_addr $I10, rxcap_254_fail
    ($I12, $I11) = rx251_cur."!mark_peek"($I10)
    rx251_cur."!cursor_pos"($I11)
    ($P10) = rx251_cur."!cursor_start"()
    $P10."!cursor_pass"(rx251_pos, "")
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_254_done
  rxcap_254_fail:
    goto rx251_fail
  rxcap_254_done:
  # rx charclass s
    ge rx251_pos, rx251_eos, rx251_fail
    sub $I10, rx251_pos, rx251_off
    is_cclass $I11, 32, rx251_tgt, $I10
    unless $I11, rx251_fail
    inc rx251_pos
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
.annotate "line", 158
  # rx subrule "xblock" subtype=capture negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."xblock"()
    unless $P10, rx251_fail
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx251_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  alt257_0:
.annotate "line", 159
    set_addr $I10, alt257_1
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx251_cur."!cursor_pos"(rx251_pos)
    .const 'Sub' $P260 = "64_1258533478.31768" 
    capture_lex $P260
    $P10 = rx251_cur."before"($P260)
    if $P10, rx251_fail
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
    goto alt257_end
  alt257_1:
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  alt257_end:
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
.annotate "line", 156
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "statement_control:sym<unless>")
    rx251_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx251_pos)
    .return (rx251_cur)
  rx251_fail:
.annotate "line", 4
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    rx251_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx251_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1258533478.31768") :method
.annotate "line", 4
    new $P253, "ResizablePMCArray"
    push $P253, "unless"
    .return ($P253)
.end


.namespace ["NQP";"Grammar"]
.sub "_block259"  :anon :subid("64_1258533478.31768") :method :outer("62_1258533478.31768")
.annotate "line", 159
    .local string rx261_tgt
    .local int rx261_pos
    .local int rx261_off
    .local int rx261_eos
    .local int rx261_rep
    .local pmc rx261_cur
    (rx261_cur, rx261_pos, rx261_tgt, $I10) = self."!cursor_start"()
    rx261_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx261_cur
    .local pmc match
    .lex "$/", match
    length rx261_eos, rx261_tgt
    set rx261_off, 0
    lt $I10, 2, rx261_start
    sub rx261_off, $I10, 1
    substr rx261_tgt, rx261_tgt, rx261_off
  rx261_start:
    ge rx261_pos, 0, rxscan262_done
  rxscan262_loop:
    ($P10) = rx261_cur."from"()
    inc $P10
    set rx261_pos, $P10
    ge rx261_pos, rx261_eos, rxscan262_done
    set_addr $I10, rxscan262_loop
    rx261_cur."!mark_push"(0, rx261_pos, $I10)
  rxscan262_done:
  # rx literal  "else"
    add $I11, rx261_pos, 4
    gt $I11, rx261_eos, rx261_fail
    sub $I11, rx261_pos, rx261_off
    substr $S10, rx261_tgt, $I11, 4
    ne $S10, "else", rx261_fail
    add rx261_pos, 4
  # rx pass
    rx261_cur."!cursor_pass"(rx261_pos, "")
    rx261_cur."!cursor_debug"("PASS  ", "", " at pos=", rx261_pos)
    .return (rx261_cur)
  rx261_fail:
    (rx261_rep, rx261_pos, $I10, $P10) = rx261_cur."!mark_fail"(0)
    lt rx261_pos, -1, rx261_done
    eq rx261_pos, -1, rx261_fail
    jump $I10
  rx261_done:
    rx261_cur."!cursor_fail"()
    rx261_cur."!cursor_debug"("FAIL  ", "")
    .return (rx261_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx268_tgt
    .local int rx268_pos
    .local int rx268_off
    .local int rx268_eos
    .local int rx268_rep
    .local pmc rx268_cur
    (rx268_cur, rx268_pos, rx268_tgt, $I10) = self."!cursor_start"()
    rx268_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx268_cur
    .local pmc match
    .lex "$/", match
    length rx268_eos, rx268_tgt
    set rx268_off, 0
    lt $I10, 2, rx268_start
    sub rx268_off, $I10, 1
    substr rx268_tgt, rx268_tgt, rx268_off
  rx268_start:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_272_fail
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  alt271_0:
    set_addr $I10, alt271_1
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  # rx literal  "while"
    add $I11, rx268_pos, 5
    gt $I11, rx268_eos, rx268_fail
    sub $I11, rx268_pos, rx268_off
    substr $S10, rx268_tgt, $I11, 5
    ne $S10, "while", rx268_fail
    add rx268_pos, 5
    goto alt271_end
  alt271_1:
  # rx literal  "until"
    add $I11, rx268_pos, 5
    gt $I11, rx268_eos, rx268_fail
    sub $I11, rx268_pos, rx268_off
    substr $S10, rx268_tgt, $I11, 5
    ne $S10, "until", rx268_fail
    add rx268_pos, 5
  alt271_end:
    set_addr $I10, rxcap_272_fail
    ($I12, $I11) = rx268_cur."!mark_peek"($I10)
    rx268_cur."!cursor_pos"($I11)
    ($P10) = rx268_cur."!cursor_start"()
    $P10."!cursor_pass"(rx268_pos, "")
    rx268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_272_done
  rxcap_272_fail:
    goto rx268_fail
  rxcap_272_done:
  # rx charclass s
    ge rx268_pos, rx268_eos, rx268_fail
    sub $I10, rx268_pos, rx268_off
    is_cclass $I11, 32, rx268_tgt, $I10
    unless $I11, rx268_fail
    inc rx268_pos
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."xblock"()
    unless $P10, rx268_fail
    rx268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx268_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx268_cur."!cursor_pos"(rx268_pos)
    $P10 = rx268_cur."ws"()
    unless $P10, rx268_fail
    rx268_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx268_cur."!cursor_pass"(rx268_pos, "statement_control:sym<while>")
    rx268_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx268_pos)
    .return (rx268_cur)
  rx268_fail:
.annotate "line", 4
    (rx268_rep, rx268_pos, $I10, $P10) = rx268_cur."!mark_fail"(0)
    lt rx268_pos, -1, rx268_done
    eq rx268_pos, -1, rx268_fail
    jump $I10
  rx268_done:
    rx268_cur."!cursor_fail"()
    rx268_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx268_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1258533478.31768") :method
.annotate "line", 4
    new $P270, "ResizablePMCArray"
    push $P270, "until"
    push $P270, "while"
    .return ($P270)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx276_tgt
    .local int rx276_pos
    .local int rx276_off
    .local int rx276_eos
    .local int rx276_rep
    .local pmc rx276_cur
    (rx276_cur, rx276_pos, rx276_tgt, $I10) = self."!cursor_start"()
    rx276_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx276_cur
    .local pmc match
    .lex "$/", match
    length rx276_eos, rx276_tgt
    set rx276_off, 0
    lt $I10, 2, rx276_start
    sub rx276_off, $I10, 1
    substr rx276_tgt, rx276_tgt, rx276_off
  rx276_start:
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_279_fail
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx276_pos, 6
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 6
    ne $S10, "repeat", rx276_fail
    add rx276_pos, 6
    set_addr $I10, rxcap_279_fail
    ($I12, $I11) = rx276_cur."!mark_peek"($I10)
    rx276_cur."!cursor_pos"($I11)
    ($P10) = rx276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx276_pos, "")
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_279_done
  rxcap_279_fail:
    goto rx276_fail
  rxcap_279_done:
  # rx charclass s
    ge rx276_pos, rx276_eos, rx276_fail
    sub $I10, rx276_pos, rx276_off
    is_cclass $I11, 32, rx276_tgt, $I10
    unless $I11, rx276_fail
    inc rx276_pos
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt281_0:
.annotate "line", 169
    set_addr $I10, alt281_1
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_284_fail
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  alt283_0:
    set_addr $I10, alt283_1
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx literal  "while"
    add $I11, rx276_pos, 5
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 5
    ne $S10, "while", rx276_fail
    add rx276_pos, 5
    goto alt283_end
  alt283_1:
  # rx literal  "until"
    add $I11, rx276_pos, 5
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 5
    ne $S10, "until", rx276_fail
    add rx276_pos, 5
  alt283_end:
    set_addr $I10, rxcap_284_fail
    ($I12, $I11) = rx276_cur."!mark_peek"($I10)
    rx276_cur."!cursor_pos"($I11)
    ($P10) = rx276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx276_pos, "")
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_284_done
  rxcap_284_fail:
    goto rx276_fail
  rxcap_284_done:
  # rx charclass s
    ge rx276_pos, rx276_eos, rx276_fail
    sub $I10, rx276_pos, rx276_off
    is_cclass $I11, 32, rx276_tgt, $I10
    unless $I11, rx276_fail
    inc rx276_pos
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."xblock"()
    unless $P10, rx276_fail
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
    goto alt281_end
  alt281_1:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."pblock"()
    unless $P10, rx276_fail
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_290_fail
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  alt289_0:
    set_addr $I10, alt289_1
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx literal  "while"
    add $I11, rx276_pos, 5
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 5
    ne $S10, "while", rx276_fail
    add rx276_pos, 5
    goto alt289_end
  alt289_1:
  # rx literal  "until"
    add $I11, rx276_pos, 5
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 5
    ne $S10, "until", rx276_fail
    add rx276_pos, 5
  alt289_end:
    set_addr $I10, rxcap_290_fail
    ($I12, $I11) = rx276_cur."!mark_peek"($I10)
    rx276_cur."!cursor_pos"($I11)
    ($P10) = rx276_cur."!cursor_start"()
    $P10."!cursor_pass"(rx276_pos, "")
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_290_done
  rxcap_290_fail:
    goto rx276_fail
  rxcap_290_done:
  # rx charclass s
    ge rx276_pos, rx276_eos, rx276_fail
    sub $I10, rx276_pos, rx276_off
    is_cclass $I11, 32, rx276_tgt, $I10
    unless $I11, rx276_fail
    inc rx276_pos
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."EXPR"()
    unless $P10, rx276_fail
    rx276_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt281_end:
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx276_cur."!cursor_pass"(rx276_pos, "statement_control:sym<repeat>")
    rx276_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx276_pos)
    .return (rx276_cur)
  rx276_fail:
.annotate "line", 4
    (rx276_rep, rx276_pos, $I10, $P10) = rx276_cur."!mark_fail"(0)
    lt rx276_pos, -1, rx276_done
    eq rx276_pos, -1, rx276_fail
    jump $I10
  rx276_done:
    rx276_cur."!cursor_fail"()
    rx276_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1258533478.31768") :method
.annotate "line", 4
    new $P278, "ResizablePMCArray"
    push $P278, "repeat"
    .return ($P278)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx295_tgt
    .local int rx295_pos
    .local int rx295_off
    .local int rx295_eos
    .local int rx295_rep
    .local pmc rx295_cur
    (rx295_cur, rx295_pos, rx295_tgt, $I10) = self."!cursor_start"()
    rx295_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx295_cur
    .local pmc match
    .lex "$/", match
    length rx295_eos, rx295_tgt
    set rx295_off, 0
    lt $I10, 2, rx295_start
    sub rx295_off, $I10, 1
    substr rx295_tgt, rx295_tgt, rx295_off
  rx295_start:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_298_fail
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  # rx literal  "for"
    add $I11, rx295_pos, 3
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 3
    ne $S10, "for", rx295_fail
    add rx295_pos, 3
    set_addr $I10, rxcap_298_fail
    ($I12, $I11) = rx295_cur."!mark_peek"($I10)
    rx295_cur."!cursor_pos"($I11)
    ($P10) = rx295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx295_pos, "")
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_298_done
  rxcap_298_fail:
    goto rx295_fail
  rxcap_298_done:
  # rx charclass s
    ge rx295_pos, rx295_eos, rx295_fail
    sub $I10, rx295_pos, rx295_off
    is_cclass $I11, 32, rx295_tgt, $I10
    unless $I11, rx295_fail
    inc rx295_pos
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
.annotate "line", 177
  # rx subrule "xblock" subtype=capture negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."xblock"()
    unless $P10, rx295_fail
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx295_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx295_cur."!cursor_pos"(rx295_pos)
    $P10 = rx295_cur."ws"()
    unless $P10, rx295_fail
    rx295_pos = $P10."pos"()
.annotate "line", 175
  # rx pass
    rx295_cur."!cursor_pass"(rx295_pos, "statement_control:sym<for>")
    rx295_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx295_pos)
    .return (rx295_cur)
  rx295_fail:
.annotate "line", 4
    (rx295_rep, rx295_pos, $I10, $P10) = rx295_cur."!mark_fail"(0)
    lt rx295_pos, -1, rx295_done
    eq rx295_pos, -1, rx295_fail
    jump $I10
  rx295_done:
    rx295_cur."!cursor_fail"()
    rx295_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx295_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1258533478.31768") :method
.annotate "line", 4
    new $P297, "ResizablePMCArray"
    push $P297, "for"
    .return ($P297)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("71_1258533478.31768") :method
.annotate "line", 180
    $P302 = self."!protoregex"("statement_prefix")
    .return ($P302)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("72_1258533478.31768") :method
.annotate "line", 180
    $P304 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P304)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("73_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx306_tgt
    .local int rx306_pos
    .local int rx306_off
    .local int rx306_eos
    .local int rx306_rep
    .local pmc rx306_cur
    (rx306_cur, rx306_pos, rx306_tgt, $I10) = self."!cursor_start"()
    rx306_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx306_cur
    .local pmc match
    .lex "$/", match
    length rx306_eos, rx306_tgt
    set rx306_off, 0
    lt $I10, 2, rx306_start
    sub rx306_off, $I10, 1
    substr rx306_tgt, rx306_tgt, rx306_off
  rx306_start:
.annotate "line", 181
  # rx subcapture "sym"
    set_addr $I10, rxcap_310_fail
    rx306_cur."!mark_push"(0, rx306_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx306_pos, 4
    gt $I11, rx306_eos, rx306_fail
    sub $I11, rx306_pos, rx306_off
    substr $S10, rx306_tgt, $I11, 4
    ne $S10, "INIT", rx306_fail
    add rx306_pos, 4
    set_addr $I10, rxcap_310_fail
    ($I12, $I11) = rx306_cur."!mark_peek"($I10)
    rx306_cur."!cursor_pos"($I11)
    ($P10) = rx306_cur."!cursor_start"()
    $P10."!cursor_pass"(rx306_pos, "")
    rx306_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_310_done
  rxcap_310_fail:
    goto rx306_fail
  rxcap_310_done:
  # rx subrule "blorst" subtype=capture negate=
    rx306_cur."!cursor_pos"(rx306_pos)
    $P10 = rx306_cur."blorst"()
    unless $P10, rx306_fail
    rx306_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx306_pos = $P10."pos"()
  # rx pass
    rx306_cur."!cursor_pass"(rx306_pos, "statement_prefix:sym<INIT>")
    rx306_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx306_pos)
    .return (rx306_cur)
  rx306_fail:
.annotate "line", 4
    (rx306_rep, rx306_pos, $I10, $P10) = rx306_cur."!mark_fail"(0)
    lt rx306_pos, -1, rx306_done
    eq rx306_pos, -1, rx306_fail
    jump $I10
  rx306_done:
    rx306_cur."!cursor_fail"()
    rx306_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx306_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("74_1258533478.31768") :method
.annotate "line", 4
    $P308 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P309, "ResizablePMCArray"
    push $P309, $P308
    .return ($P309)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("75_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx312_tgt
    .local int rx312_pos
    .local int rx312_off
    .local int rx312_eos
    .local int rx312_rep
    .local pmc rx312_cur
    (rx312_cur, rx312_pos, rx312_tgt, $I10) = self."!cursor_start"()
    rx312_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx312_cur
    .local pmc match
    .lex "$/", match
    length rx312_eos, rx312_tgt
    set rx312_off, 0
    lt $I10, 2, rx312_start
    sub rx312_off, $I10, 1
    substr rx312_tgt, rx312_tgt, rx312_off
  rx312_start:
.annotate "line", 184
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
  alt315_0:
    set_addr $I10, alt315_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx312_pos, rx312_eos, rx312_fail
    sub $I10, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx312_fail
  # rx subrule "block" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."block"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx312_pos = $P10."pos"()
    goto alt315_end
  alt315_1:
  # rx subrule "statement" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."statement"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx312_pos = $P10."pos"()
  alt315_end:
.annotate "line", 183
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "blorst")
    rx312_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate "line", 4
    (rx312_rep, rx312_pos, $I10, $P10) = rx312_cur."!mark_fail"(0)
    lt rx312_pos, -1, rx312_done
    eq rx312_pos, -1, rx312_fail
    jump $I10
  rx312_done:
    rx312_cur."!cursor_fail"()
    rx312_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx312_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("76_1258533478.31768") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, ""
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("77_1258533478.31768") :method
.annotate "line", 189
    $P317 = self."!protoregex"("statement_mod_cond")
    .return ($P317)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("78_1258533478.31768") :method
.annotate "line", 189
    $P319 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P319)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("79_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx321_tgt
    .local int rx321_pos
    .local int rx321_off
    .local int rx321_eos
    .local int rx321_rep
    .local pmc rx321_cur
    (rx321_cur, rx321_pos, rx321_tgt, $I10) = self."!cursor_start"()
    rx321_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx321_cur
    .local pmc match
    .lex "$/", match
    length rx321_eos, rx321_tgt
    set rx321_off, 0
    lt $I10, 2, rx321_start
    sub rx321_off, $I10, 1
    substr rx321_tgt, rx321_tgt, rx321_off
  rx321_start:
.annotate "line", 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_324_fail
    rx321_cur."!mark_push"(0, rx321_pos, $I10)
  # rx literal  "if"
    add $I11, rx321_pos, 2
    gt $I11, rx321_eos, rx321_fail
    sub $I11, rx321_pos, rx321_off
    substr $S10, rx321_tgt, $I11, 2
    ne $S10, "if", rx321_fail
    add rx321_pos, 2
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx321_cur."!mark_peek"($I10)
    rx321_cur."!cursor_pos"($I11)
    ($P10) = rx321_cur."!cursor_start"()
    $P10."!cursor_pass"(rx321_pos, "")
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx321_fail
  rxcap_324_done:
  # rx subrule "ws" subtype=method negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."ws"()
    unless $P10, rx321_fail
    rx321_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."EXPR"()
    unless $P10, rx321_fail
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx321_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."ws"()
    unless $P10, rx321_fail
    rx321_pos = $P10."pos"()
  # rx pass
    rx321_cur."!cursor_pass"(rx321_pos, "statement_mod_cond:sym<if>")
    rx321_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx321_pos)
    .return (rx321_cur)
  rx321_fail:
.annotate "line", 4
    (rx321_rep, rx321_pos, $I10, $P10) = rx321_cur."!mark_fail"(0)
    lt rx321_pos, -1, rx321_done
    eq rx321_pos, -1, rx321_fail
    jump $I10
  rx321_done:
    rx321_cur."!cursor_fail"()
    rx321_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx321_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("80_1258533478.31768") :method
.annotate "line", 4
    new $P323, "ResizablePMCArray"
    push $P323, "if"
    .return ($P323)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("81_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt, $I10) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx328_cur
    .local pmc match
    .lex "$/", match
    length rx328_eos, rx328_tgt
    set rx328_off, 0
    lt $I10, 2, rx328_start
    sub rx328_off, $I10, 1
    substr rx328_tgt, rx328_tgt, rx328_off
  rx328_start:
.annotate "line", 192
  # rx subcapture "sym"
    set_addr $I10, rxcap_331_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx literal  "unless"
    add $I11, rx328_pos, 6
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 6
    ne $S10, "unless", rx328_fail
    add rx328_pos, 6
    set_addr $I10, rxcap_331_fail
    ($I12, $I11) = rx328_cur."!mark_peek"($I10)
    rx328_cur."!cursor_pos"($I11)
    ($P10) = rx328_cur."!cursor_start"()
    $P10."!cursor_pass"(rx328_pos, "")
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_331_done
  rxcap_331_fail:
    goto rx328_fail
  rxcap_331_done:
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."EXPR"()
    unless $P10, rx328_fail
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx328_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx328_cur."!cursor_pos"(rx328_pos)
    $P10 = rx328_cur."ws"()
    unless $P10, rx328_fail
    rx328_pos = $P10."pos"()
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "statement_mod_cond:sym<unless>")
    rx328_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate "line", 4
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx328_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("82_1258533478.31768") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "unless"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("83_1258533478.31768") :method
.annotate "line", 194
    $P335 = self."!protoregex"("statement_mod_loop")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("84_1258533478.31768") :method
.annotate "line", 194
    $P337 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("85_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx339_tgt
    .local int rx339_pos
    .local int rx339_off
    .local int rx339_eos
    .local int rx339_rep
    .local pmc rx339_cur
    (rx339_cur, rx339_pos, rx339_tgt, $I10) = self."!cursor_start"()
    rx339_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx339_cur
    .local pmc match
    .lex "$/", match
    length rx339_eos, rx339_tgt
    set rx339_off, 0
    lt $I10, 2, rx339_start
    sub rx339_off, $I10, 1
    substr rx339_tgt, rx339_tgt, rx339_off
  rx339_start:
.annotate "line", 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_342_fail
    rx339_cur."!mark_push"(0, rx339_pos, $I10)
  # rx literal  "while"
    add $I11, rx339_pos, 5
    gt $I11, rx339_eos, rx339_fail
    sub $I11, rx339_pos, rx339_off
    substr $S10, rx339_tgt, $I11, 5
    ne $S10, "while", rx339_fail
    add rx339_pos, 5
    set_addr $I10, rxcap_342_fail
    ($I12, $I11) = rx339_cur."!mark_peek"($I10)
    rx339_cur."!cursor_pos"($I11)
    ($P10) = rx339_cur."!cursor_start"()
    $P10."!cursor_pass"(rx339_pos, "")
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_342_done
  rxcap_342_fail:
    goto rx339_fail
  rxcap_342_done:
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."EXPR"()
    unless $P10, rx339_fail
    rx339_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx339_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx339_cur."!cursor_pos"(rx339_pos)
    $P10 = rx339_cur."ws"()
    unless $P10, rx339_fail
    rx339_pos = $P10."pos"()
  # rx pass
    rx339_cur."!cursor_pass"(rx339_pos, "statement_mod_loop:sym<while>")
    rx339_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx339_pos)
    .return (rx339_cur)
  rx339_fail:
.annotate "line", 4
    (rx339_rep, rx339_pos, $I10, $P10) = rx339_cur."!mark_fail"(0)
    lt rx339_pos, -1, rx339_done
    eq rx339_pos, -1, rx339_fail
    jump $I10
  rx339_done:
    rx339_cur."!cursor_fail"()
    rx339_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx339_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("86_1258533478.31768") :method
.annotate "line", 4
    new $P341, "ResizablePMCArray"
    push $P341, "while"
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("87_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    (rx346_cur, rx346_pos, rx346_tgt, $I10) = self."!cursor_start"()
    rx346_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx346_cur
    .local pmc match
    .lex "$/", match
    length rx346_eos, rx346_tgt
    set rx346_off, 0
    lt $I10, 2, rx346_start
    sub rx346_off, $I10, 1
    substr rx346_tgt, rx346_tgt, rx346_off
  rx346_start:
.annotate "line", 197
  # rx subcapture "sym"
    set_addr $I10, rxcap_349_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx literal  "until"
    add $I11, rx346_pos, 5
    gt $I11, rx346_eos, rx346_fail
    sub $I11, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I11, 5
    ne $S10, "until", rx346_fail
    add rx346_pos, 5
    set_addr $I10, rxcap_349_fail
    ($I12, $I11) = rx346_cur."!mark_peek"($I10)
    rx346_cur."!cursor_pos"($I11)
    ($P10) = rx346_cur."!cursor_start"()
    $P10."!cursor_pass"(rx346_pos, "")
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_349_done
  rxcap_349_fail:
    goto rx346_fail
  rxcap_349_done:
  # rx subrule "ws" subtype=method negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."ws"()
    unless $P10, rx346_fail
    rx346_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."EXPR"()
    unless $P10, rx346_fail
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx346_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."ws"()
    unless $P10, rx346_fail
    rx346_pos = $P10."pos"()
  # rx pass
    rx346_cur."!cursor_pass"(rx346_pos, "statement_mod_loop:sym<until>")
    rx346_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx346_pos)
    .return (rx346_cur)
  rx346_fail:
.annotate "line", 4
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    rx346_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx346_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("88_1258533478.31768") :method
.annotate "line", 4
    new $P348, "ResizablePMCArray"
    push $P348, "until"
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("89_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx353_tgt
    .local int rx353_pos
    .local int rx353_off
    .local int rx353_eos
    .local int rx353_rep
    .local pmc rx353_cur
    (rx353_cur, rx353_pos, rx353_tgt, $I10) = self."!cursor_start"()
    rx353_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx353_cur
    .local pmc match
    .lex "$/", match
    length rx353_eos, rx353_tgt
    set rx353_off, 0
    lt $I10, 2, rx353_start
    sub rx353_off, $I10, 1
    substr rx353_tgt, rx353_tgt, rx353_off
  rx353_start:
.annotate "line", 201
  # rx subrule "colonpair" subtype=capture negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."colonpair"()
    unless $P10, rx353_fail
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx353_pos = $P10."pos"()
  # rx pass
    rx353_cur."!cursor_pass"(rx353_pos, "term:sym<colonpair>")
    rx353_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx353_pos)
    .return (rx353_cur)
  rx353_fail:
.annotate "line", 4
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    rx353_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx353_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("90_1258533478.31768") :method
.annotate "line", 4
    $P355 = self."!PREFIX__!subrule"("colonpair", "")
    new $P356, "ResizablePMCArray"
    push $P356, $P355
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("91_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt, $I10) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    set rx358_off, 0
    lt $I10, 2, rx358_start
    sub rx358_off, $I10, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
.annotate "line", 202
  # rx subrule "variable" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."variable"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx358_pos = $P10."pos"()
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "term:sym<variable>")
    rx358_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate "line", 4
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("92_1258533478.31768") :method
.annotate "line", 4
    $P360 = self."!PREFIX__!subrule"("variable", "")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("93_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    (rx363_cur, rx363_pos, rx363_tgt, $I10) = self."!cursor_start"()
    rx363_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx363_cur
    .local pmc match
    .lex "$/", match
    length rx363_eos, rx363_tgt
    set rx363_off, 0
    lt $I10, 2, rx363_start
    sub rx363_off, $I10, 1
    substr rx363_tgt, rx363_tgt, rx363_off
  rx363_start:
.annotate "line", 203
  # rx subrule "package_declarator" subtype=capture negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."package_declarator"()
    unless $P10, rx363_fail
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx363_pos = $P10."pos"()
  # rx pass
    rx363_cur."!cursor_pass"(rx363_pos, "term:sym<package_declarator>")
    rx363_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx363_pos)
    .return (rx363_cur)
  rx363_fail:
.annotate "line", 4
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    rx363_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("94_1258533478.31768") :method
.annotate "line", 4
    $P365 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("95_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx368_tgt
    .local int rx368_pos
    .local int rx368_off
    .local int rx368_eos
    .local int rx368_rep
    .local pmc rx368_cur
    (rx368_cur, rx368_pos, rx368_tgt, $I10) = self."!cursor_start"()
    rx368_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx368_cur
    .local pmc match
    .lex "$/", match
    length rx368_eos, rx368_tgt
    set rx368_off, 0
    lt $I10, 2, rx368_start
    sub rx368_off, $I10, 1
    substr rx368_tgt, rx368_tgt, rx368_off
  rx368_start:
.annotate "line", 204
  # rx subrule "scope_declarator" subtype=capture negate=
    rx368_cur."!cursor_pos"(rx368_pos)
    $P10 = rx368_cur."scope_declarator"()
    unless $P10, rx368_fail
    rx368_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx368_pos = $P10."pos"()
  # rx pass
    rx368_cur."!cursor_pass"(rx368_pos, "term:sym<scope_declarator>")
    rx368_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx368_pos)
    .return (rx368_cur)
  rx368_fail:
.annotate "line", 4
    (rx368_rep, rx368_pos, $I10, $P10) = rx368_cur."!mark_fail"(0)
    lt rx368_pos, -1, rx368_done
    eq rx368_pos, -1, rx368_fail
    jump $I10
  rx368_done:
    rx368_cur."!cursor_fail"()
    rx368_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx368_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("96_1258533478.31768") :method
.annotate "line", 4
    $P370 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P371, "ResizablePMCArray"
    push $P371, $P370
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("97_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx373_tgt
    .local int rx373_pos
    .local int rx373_off
    .local int rx373_eos
    .local int rx373_rep
    .local pmc rx373_cur
    (rx373_cur, rx373_pos, rx373_tgt, $I10) = self."!cursor_start"()
    rx373_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx373_cur
    .local pmc match
    .lex "$/", match
    length rx373_eos, rx373_tgt
    set rx373_off, 0
    lt $I10, 2, rx373_start
    sub rx373_off, $I10, 1
    substr rx373_tgt, rx373_tgt, rx373_off
  rx373_start:
.annotate "line", 205
  # rx subrule "routine_declarator" subtype=capture negate=
    rx373_cur."!cursor_pos"(rx373_pos)
    $P10 = rx373_cur."routine_declarator"()
    unless $P10, rx373_fail
    rx373_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx373_pos = $P10."pos"()
  # rx pass
    rx373_cur."!cursor_pass"(rx373_pos, "term:sym<routine_declarator>")
    rx373_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx373_pos)
    .return (rx373_cur)
  rx373_fail:
.annotate "line", 4
    (rx373_rep, rx373_pos, $I10, $P10) = rx373_cur."!mark_fail"(0)
    lt rx373_pos, -1, rx373_done
    eq rx373_pos, -1, rx373_fail
    jump $I10
  rx373_done:
    rx373_cur."!cursor_fail"()
    rx373_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx373_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("98_1258533478.31768") :method
.annotate "line", 4
    $P375 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P376, "ResizablePMCArray"
    push $P376, $P375
    .return ($P376)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("99_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx378_tgt
    .local int rx378_pos
    .local int rx378_off
    .local int rx378_eos
    .local int rx378_rep
    .local pmc rx378_cur
    (rx378_cur, rx378_pos, rx378_tgt, $I10) = self."!cursor_start"()
    rx378_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx378_cur
    .local pmc match
    .lex "$/", match
    length rx378_eos, rx378_tgt
    set rx378_off, 0
    lt $I10, 2, rx378_start
    sub rx378_off, $I10, 1
    substr rx378_tgt, rx378_tgt, rx378_off
  rx378_start:
.annotate "line", 206
  # rx subrule "regex_declarator" subtype=capture negate=
    rx378_cur."!cursor_pos"(rx378_pos)
    $P10 = rx378_cur."regex_declarator"()
    unless $P10, rx378_fail
    rx378_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx378_pos = $P10."pos"()
  # rx pass
    rx378_cur."!cursor_pass"(rx378_pos, "term:sym<regex_declarator>")
    rx378_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx378_pos)
    .return (rx378_cur)
  rx378_fail:
.annotate "line", 4
    (rx378_rep, rx378_pos, $I10, $P10) = rx378_cur."!mark_fail"(0)
    lt rx378_pos, -1, rx378_done
    eq rx378_pos, -1, rx378_fail
    jump $I10
  rx378_done:
    rx378_cur."!cursor_fail"()
    rx378_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx378_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("100_1258533478.31768") :method
.annotate "line", 4
    $P380 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P381, "ResizablePMCArray"
    push $P381, $P380
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("101_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt, $I10) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    set rx383_off, 0
    lt $I10, 2, rx383_start
    sub rx383_off, $I10, 1
    substr rx383_tgt, rx383_tgt, rx383_off
  rx383_start:
.annotate "line", 207
  # rx subrule "statement_prefix" subtype=capture negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."statement_prefix"()
    unless $P10, rx383_fail
    rx383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx383_pos = $P10."pos"()
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "term:sym<statement_prefix>")
    rx383_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate "line", 4
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("102_1258533478.31768") :method
.annotate "line", 4
    $P385 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P386, "ResizablePMCArray"
    push $P386, $P385
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("103_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt, $I10) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt $I10, 2, rx388_start
    sub rx388_off, $I10, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
.annotate "line", 208
  # rx subrule "lambda" subtype=zerowidth negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."lambda"()
    unless $P10, rx388_fail
  # rx subrule "pblock" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."pblock"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx388_pos = $P10."pos"()
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "term:sym<lambda>")
    rx388_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate "line", 4
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("104_1258533478.31768") :method
.annotate "line", 4
    new $P390, "ResizablePMCArray"
    push $P390, ""
    .return ($P390)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("105_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx392_tgt
    .local int rx392_pos
    .local int rx392_off
    .local int rx392_eos
    .local int rx392_rep
    .local pmc rx392_cur
    (rx392_cur, rx392_pos, rx392_tgt, $I10) = self."!cursor_start"()
    rx392_cur."!cursor_debug"("START ", "colonpair")
    rx392_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx392_cur
    .local pmc match
    .lex "$/", match
    length rx392_eos, rx392_tgt
    set rx392_off, 0
    lt $I10, 2, rx392_start
    sub rx392_off, $I10, 1
    substr rx392_tgt, rx392_tgt, rx392_off
  rx392_start:
.annotate "line", 211
  # rx literal  ":"
    add $I11, rx392_pos, 1
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 1
    ne $S10, ":", rx392_fail
    add rx392_pos, 1
  alt397_0:
.annotate "line", 212
    set_addr $I10, alt397_1
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
.annotate "line", 213
  # rx subcapture "not"
    set_addr $I10, rxcap_398_fail
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  # rx literal  "!"
    add $I11, rx392_pos, 1
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 1
    ne $S10, "!", rx392_fail
    add rx392_pos, 1
    set_addr $I10, rxcap_398_fail
    ($I12, $I11) = rx392_cur."!mark_peek"($I10)
    rx392_cur."!cursor_pos"($I11)
    ($P10) = rx392_cur."!cursor_start"()
    $P10."!cursor_pass"(rx392_pos, "")
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_398_done
  rxcap_398_fail:
    goto rx392_fail
  rxcap_398_done:
  # rx subrule "identifier" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."identifier"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx392_pos = $P10."pos"()
    goto alt397_end
  alt397_1:
.annotate "line", 214
  # rx subrule "identifier" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."identifier"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx392_pos = $P10."pos"()
  # rx rxquantr399 ** 0..1
    set_addr $I400, rxquantr399_done
    rx392_cur."!mark_push"(0, rx392_pos, $I400)
  rxquantr399_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."circumfix"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx392_pos = $P10."pos"()
    (rx392_rep) = rx392_cur."!mark_commit"($I400)
  rxquantr399_done:
  alt397_end:
.annotate "line", 210
  # rx pass
    rx392_cur."!cursor_pass"(rx392_pos, "colonpair")
    rx392_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx392_pos)
    .return (rx392_cur)
  rx392_fail:
.annotate "line", 4
    (rx392_rep, rx392_pos, $I10, $P10) = rx392_cur."!mark_fail"(0)
    lt rx392_pos, -1, rx392_done
    eq rx392_pos, -1, rx392_fail
    jump $I10
  rx392_done:
    rx392_cur."!cursor_fail"()
    rx392_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx392_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("106_1258533478.31768") :method
.annotate "line", 4
    $P394 = self."!PREFIX__!subrule"("identifier", ":")
    $P395 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P396, "ResizablePMCArray"
    push $P396, $P394
    push $P396, $P395
    .return ($P396)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("107_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx402_tgt
    .local int rx402_pos
    .local int rx402_off
    .local int rx402_eos
    .local int rx402_rep
    .local pmc rx402_cur
    (rx402_cur, rx402_pos, rx402_tgt, $I10) = self."!cursor_start"()
    rx402_cur."!cursor_debug"("START ", "variable")
    rx402_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx402_cur
    .local pmc match
    .lex "$/", match
    length rx402_eos, rx402_tgt
    set rx402_off, 0
    lt $I10, 2, rx402_start
    sub rx402_off, $I10, 1
    substr rx402_tgt, rx402_tgt, rx402_off
  rx402_start:
  alt407_0:
.annotate "line", 218
    set_addr $I10, alt407_1
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
.annotate "line", 219
  # rx subrule "sigil" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."sigil"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx402_pos = $P10."pos"()
  # rx rxquantr408 ** 0..1
    set_addr $I409, rxquantr408_done
    rx402_cur."!mark_push"(0, rx402_pos, $I409)
  rxquantr408_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."twigil"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx402_pos = $P10."pos"()
    (rx402_rep) = rx402_cur."!mark_commit"($I409)
  rxquantr408_done:
  # rx subrule "name" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."name"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx402_pos = $P10."pos"()
    goto alt407_end
  alt407_1:
    set_addr $I10, alt407_2
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
.annotate "line", 220
  # rx subrule "sigil" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."sigil"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx402_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx402_pos, rx402_eos, rx402_fail
    sub $I10, rx402_pos, rx402_off
    substr $S10, rx402_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx402_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."postcircumfix"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx402_pos = $P10."pos"()
    goto alt407_end
  alt407_2:
.annotate "line", 221
  # rx subcapture "sigil"
    set_addr $I10, rxcap_410_fail
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  # rx literal  "$"
    add $I11, rx402_pos, 1
    gt $I11, rx402_eos, rx402_fail
    sub $I11, rx402_pos, rx402_off
    substr $S10, rx402_tgt, $I11, 1
    ne $S10, "$", rx402_fail
    add rx402_pos, 1
    set_addr $I10, rxcap_410_fail
    ($I12, $I11) = rx402_cur."!mark_peek"($I10)
    rx402_cur."!cursor_pos"($I11)
    ($P10) = rx402_cur."!cursor_start"()
    $P10."!cursor_pass"(rx402_pos, "")
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_410_done
  rxcap_410_fail:
    goto rx402_fail
  rxcap_410_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_411_fail
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx402_pos, rx402_eos, rx402_fail
    sub $I10, rx402_pos, rx402_off
    substr $S10, rx402_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx402_fail
    inc rx402_pos
    set_addr $I10, rxcap_411_fail
    ($I12, $I11) = rx402_cur."!mark_peek"($I10)
    rx402_cur."!cursor_pos"($I11)
    ($P10) = rx402_cur."!cursor_start"()
    $P10."!cursor_pass"(rx402_pos, "")
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_411_done
  rxcap_411_fail:
    goto rx402_fail
  rxcap_411_done:
  alt407_end:
.annotate "line", 218
  # rx pass
    rx402_cur."!cursor_pass"(rx402_pos, "variable")
    rx402_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx402_pos)
    .return (rx402_cur)
  rx402_fail:
.annotate "line", 4
    (rx402_rep, rx402_pos, $I10, $P10) = rx402_cur."!mark_fail"(0)
    lt rx402_pos, -1, rx402_done
    eq rx402_pos, -1, rx402_fail
    jump $I10
  rx402_done:
    rx402_cur."!cursor_fail"()
    rx402_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx402_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("108_1258533478.31768") :method
.annotate "line", 4
    $P404 = self."!PREFIX__!subrule"("sigil", "")
    $P405 = self."!PREFIX__!subrule"("sigil", "")
    new $P406, "ResizablePMCArray"
    push $P406, "$!"
    push $P406, "$_"
    push $P406, "$/"
    push $P406, $P404
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("109_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx413_tgt
    .local int rx413_pos
    .local int rx413_off
    .local int rx413_eos
    .local int rx413_rep
    .local pmc rx413_cur
    (rx413_cur, rx413_pos, rx413_tgt, $I10) = self."!cursor_start"()
    rx413_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx413_cur
    .local pmc match
    .lex "$/", match
    length rx413_eos, rx413_tgt
    set rx413_off, 0
    lt $I10, 2, rx413_start
    sub rx413_off, $I10, 1
    substr rx413_tgt, rx413_tgt, rx413_off
  rx413_start:
.annotate "line", 224
  # rx enumcharlist negate=0 
    ge rx413_pos, rx413_eos, rx413_fail
    sub $I10, rx413_pos, rx413_off
    substr $S10, rx413_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx413_fail
    inc rx413_pos
  # rx pass
    rx413_cur."!cursor_pass"(rx413_pos, "sigil")
    rx413_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx413_pos)
    .return (rx413_cur)
  rx413_fail:
.annotate "line", 4
    (rx413_rep, rx413_pos, $I10, $P10) = rx413_cur."!mark_fail"(0)
    lt rx413_pos, -1, rx413_done
    eq rx413_pos, -1, rx413_fail
    jump $I10
  rx413_done:
    rx413_cur."!cursor_fail"()
    rx413_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx413_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("110_1258533478.31768") :method
.annotate "line", 4
    new $P415, "ResizablePMCArray"
    push $P415, "&"
    push $P415, "%"
    push $P415, "@"
    push $P415, "$"
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("111_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx417_tgt
    .local int rx417_pos
    .local int rx417_off
    .local int rx417_eos
    .local int rx417_rep
    .local pmc rx417_cur
    (rx417_cur, rx417_pos, rx417_tgt, $I10) = self."!cursor_start"()
    rx417_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx417_cur
    .local pmc match
    .lex "$/", match
    length rx417_eos, rx417_tgt
    set rx417_off, 0
    lt $I10, 2, rx417_start
    sub rx417_off, $I10, 1
    substr rx417_tgt, rx417_tgt, rx417_off
  rx417_start:
.annotate "line", 226
  # rx enumcharlist negate=0 
    ge rx417_pos, rx417_eos, rx417_fail
    sub $I10, rx417_pos, rx417_off
    substr $S10, rx417_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx417_fail
    inc rx417_pos
  # rx pass
    rx417_cur."!cursor_pass"(rx417_pos, "twigil")
    rx417_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx417_pos)
    .return (rx417_cur)
  rx417_fail:
.annotate "line", 4
    (rx417_rep, rx417_pos, $I10, $P10) = rx417_cur."!mark_fail"(0)
    lt rx417_pos, -1, rx417_done
    eq rx417_pos, -1, rx417_fail
    jump $I10
  rx417_done:
    rx417_cur."!cursor_fail"()
    rx417_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx417_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("112_1258533478.31768") :method
.annotate "line", 4
    new $P419, "ResizablePMCArray"
    push $P419, "?"
    push $P419, "!"
    push $P419, "*"
    .return ($P419)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("113_1258533478.31768") :method
.annotate "line", 228
    $P421 = self."!protoregex"("package_declarator")
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("114_1258533478.31768") :method
.annotate "line", 228
    $P423 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P423)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("115_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx425_tgt
    .local int rx425_pos
    .local int rx425_off
    .local int rx425_eos
    .local int rx425_rep
    .local pmc rx425_cur
    (rx425_cur, rx425_pos, rx425_tgt, $I10) = self."!cursor_start"()
    rx425_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx425_cur
    .local pmc match
    .lex "$/", match
    length rx425_eos, rx425_tgt
    set rx425_off, 0
    lt $I10, 2, rx425_start
    sub rx425_off, $I10, 1
    substr rx425_tgt, rx425_tgt, rx425_off
  rx425_start:
.annotate "line", 229
  # rx subcapture "sym"
    set_addr $I10, rxcap_429_fail
    rx425_cur."!mark_push"(0, rx425_pos, $I10)
  # rx literal  "module"
    add $I11, rx425_pos, 6
    gt $I11, rx425_eos, rx425_fail
    sub $I11, rx425_pos, rx425_off
    substr $S10, rx425_tgt, $I11, 6
    ne $S10, "module", rx425_fail
    add rx425_pos, 6
    set_addr $I10, rxcap_429_fail
    ($I12, $I11) = rx425_cur."!mark_peek"($I10)
    rx425_cur."!cursor_pos"($I11)
    ($P10) = rx425_cur."!cursor_start"()
    $P10."!cursor_pass"(rx425_pos, "")
    rx425_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_429_done
  rxcap_429_fail:
    goto rx425_fail
  rxcap_429_done:
  # rx subrule "package_def" subtype=capture negate=
    rx425_cur."!cursor_pos"(rx425_pos)
    $P10 = rx425_cur."package_def"()
    unless $P10, rx425_fail
    rx425_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx425_pos = $P10."pos"()
  # rx pass
    rx425_cur."!cursor_pass"(rx425_pos, "package_declarator:sym<module>")
    rx425_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx425_pos)
    .return (rx425_cur)
  rx425_fail:
.annotate "line", 4
    (rx425_rep, rx425_pos, $I10, $P10) = rx425_cur."!mark_fail"(0)
    lt rx425_pos, -1, rx425_done
    eq rx425_pos, -1, rx425_fail
    jump $I10
  rx425_done:
    rx425_cur."!cursor_fail"()
    rx425_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx425_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("116_1258533478.31768") :method
.annotate "line", 4
    $P427 = self."!PREFIX__!subrule"("package_def", "module")
    new $P428, "ResizablePMCArray"
    push $P428, $P427
    .return ($P428)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("117_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx431_tgt
    .local int rx431_pos
    .local int rx431_off
    .local int rx431_eos
    .local int rx431_rep
    .local pmc rx431_cur
    (rx431_cur, rx431_pos, rx431_tgt, $I10) = self."!cursor_start"()
    rx431_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx431_cur
    .local pmc match
    .lex "$/", match
    length rx431_eos, rx431_tgt
    set rx431_off, 0
    lt $I10, 2, rx431_start
    sub rx431_off, $I10, 1
    substr rx431_tgt, rx431_tgt, rx431_off
  rx431_start:
.annotate "line", 230
  # rx subcapture "sym"
    set_addr $I10, rxcap_437_fail
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
  alt436_0:
    set_addr $I10, alt436_1
    rx431_cur."!mark_push"(0, rx431_pos, $I10)
  # rx literal  "class"
    add $I11, rx431_pos, 5
    gt $I11, rx431_eos, rx431_fail
    sub $I11, rx431_pos, rx431_off
    substr $S10, rx431_tgt, $I11, 5
    ne $S10, "class", rx431_fail
    add rx431_pos, 5
    goto alt436_end
  alt436_1:
  # rx literal  "grammar"
    add $I11, rx431_pos, 7
    gt $I11, rx431_eos, rx431_fail
    sub $I11, rx431_pos, rx431_off
    substr $S10, rx431_tgt, $I11, 7
    ne $S10, "grammar", rx431_fail
    add rx431_pos, 7
  alt436_end:
    set_addr $I10, rxcap_437_fail
    ($I12, $I11) = rx431_cur."!mark_peek"($I10)
    rx431_cur."!cursor_pos"($I11)
    ($P10) = rx431_cur."!cursor_start"()
    $P10."!cursor_pass"(rx431_pos, "")
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_437_done
  rxcap_437_fail:
    goto rx431_fail
  rxcap_437_done:
  # rx subrule "package_def" subtype=capture negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."package_def"()
    unless $P10, rx431_fail
    rx431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx431_pos = $P10."pos"()
  # rx pass
    rx431_cur."!cursor_pass"(rx431_pos, "package_declarator:sym<class>")
    rx431_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx431_pos)
    .return (rx431_cur)
  rx431_fail:
.annotate "line", 4
    (rx431_rep, rx431_pos, $I10, $P10) = rx431_cur."!mark_fail"(0)
    lt rx431_pos, -1, rx431_done
    eq rx431_pos, -1, rx431_fail
    jump $I10
  rx431_done:
    rx431_cur."!cursor_fail"()
    rx431_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx431_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("118_1258533478.31768") :method
.annotate "line", 4
    $P433 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P434 = self."!PREFIX__!subrule"("package_def", "class")
    new $P435, "ResizablePMCArray"
    push $P435, $P433
    push $P435, $P434
    .return ($P435)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("119_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx439_tgt
    .local int rx439_pos
    .local int rx439_off
    .local int rx439_eos
    .local int rx439_rep
    .local pmc rx439_cur
    (rx439_cur, rx439_pos, rx439_tgt, $I10) = self."!cursor_start"()
    rx439_cur."!cursor_debug"("START ", "package_def")
    rx439_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx439_cur
    .local pmc match
    .lex "$/", match
    length rx439_eos, rx439_tgt
    set rx439_off, 0
    lt $I10, 2, rx439_start
    sub rx439_off, $I10, 1
    substr rx439_tgt, rx439_tgt, rx439_off
  rx439_start:
.annotate "line", 232
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
.annotate "line", 233
  # rx subrule "name" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."name"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx439_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
.annotate "line", 234
  # rx rxquantr444 ** 0..1
    set_addr $I448, rxquantr444_done
    rx439_cur."!mark_push"(0, rx439_pos, $I448)
  rxquantr444_loop:
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx439_pos, 2
    gt $I11, rx439_eos, rx439_fail
    sub $I11, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I11, 2
    ne $S10, "is", rx439_fail
    add rx439_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."name"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx439_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
    (rx439_rep) = rx439_cur."!mark_commit"($I448)
  rxquantr444_done:
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  alt450_0:
.annotate "line", 235
    set_addr $I10, alt450_1
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
.annotate "line", 236
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx439_pos, 1
    gt $I11, rx439_eos, rx439_fail
    sub $I11, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I11, 1
    ne $S10, ";", rx439_fail
    add rx439_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."comp_unit"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx439_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
    goto alt450_end
  alt450_1:
    set_addr $I10, alt450_2
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
.annotate "line", 237
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx439_pos, rx439_eos, rx439_fail
    sub $I10, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx439_fail
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."block"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx439_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
    goto alt450_end
  alt450_2:
.annotate "line", 238
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."panic"("Malformed package declaration")
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  alt450_end:
.annotate "line", 239
  # rx subrule "ws" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."ws"()
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
.annotate "line", 232
  # rx pass
    rx439_cur."!cursor_pass"(rx439_pos, "package_def")
    rx439_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx439_pos)
    .return (rx439_cur)
  rx439_fail:
.annotate "line", 4
    (rx439_rep, rx439_pos, $I10, $P10) = rx439_cur."!mark_fail"(0)
    lt rx439_pos, -1, rx439_done
    eq rx439_pos, -1, rx439_fail
    jump $I10
  rx439_done:
    rx439_cur."!cursor_fail"()
    rx439_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx439_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("120_1258533478.31768") :method
.annotate "line", 4
    new $P441, "ResizablePMCArray"
    push $P441, ""
    .return ($P441)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("121_1258533478.31768") :method
.annotate "line", 242
    $P461 = self."!protoregex"("scope_declarator")
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("122_1258533478.31768") :method
.annotate "line", 242
    $P463 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P463)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("123_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    (rx465_cur, rx465_pos, rx465_tgt, $I10) = self."!cursor_start"()
    rx465_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx465_cur
    .local pmc match
    .lex "$/", match
    length rx465_eos, rx465_tgt
    set rx465_off, 0
    lt $I10, 2, rx465_start
    sub rx465_off, $I10, 1
    substr rx465_tgt, rx465_tgt, rx465_off
  rx465_start:
.annotate "line", 243
  # rx subcapture "sym"
    set_addr $I10, rxcap_469_fail
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  # rx literal  "my"
    add $I11, rx465_pos, 2
    gt $I11, rx465_eos, rx465_fail
    sub $I11, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I11, 2
    ne $S10, "my", rx465_fail
    add rx465_pos, 2
    set_addr $I10, rxcap_469_fail
    ($I12, $I11) = rx465_cur."!mark_peek"($I10)
    rx465_cur."!cursor_pos"($I11)
    ($P10) = rx465_cur."!cursor_start"()
    $P10."!cursor_pass"(rx465_pos, "")
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_469_done
  rxcap_469_fail:
    goto rx465_fail
  rxcap_469_done:
  # rx subrule "scoped" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."scoped"("my")
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx465_pos = $P10."pos"()
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "scope_declarator:sym<my>")
    rx465_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx465_pos)
    .return (rx465_cur)
  rx465_fail:
.annotate "line", 4
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    rx465_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx465_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("124_1258533478.31768") :method
.annotate "line", 4
    $P467 = self."!PREFIX__!subrule"("scoped", "my")
    new $P468, "ResizablePMCArray"
    push $P468, $P467
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("125_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt, $I10) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx471_cur
    .local pmc match
    .lex "$/", match
    length rx471_eos, rx471_tgt
    set rx471_off, 0
    lt $I10, 2, rx471_start
    sub rx471_off, $I10, 1
    substr rx471_tgt, rx471_tgt, rx471_off
  rx471_start:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_475_fail
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  # rx literal  "our"
    add $I11, rx471_pos, 3
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 3
    ne $S10, "our", rx471_fail
    add rx471_pos, 3
    set_addr $I10, rxcap_475_fail
    ($I12, $I11) = rx471_cur."!mark_peek"($I10)
    rx471_cur."!cursor_pos"($I11)
    ($P10) = rx471_cur."!cursor_start"()
    $P10."!cursor_pass"(rx471_pos, "")
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_475_done
  rxcap_475_fail:
    goto rx471_fail
  rxcap_475_done:
  # rx subrule "scoped" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."scoped"("our")
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx471_pos = $P10."pos"()
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "scope_declarator:sym<our>")
    rx471_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
.annotate "line", 4
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx471_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("126_1258533478.31768") :method
.annotate "line", 4
    $P473 = self."!PREFIX__!subrule"("scoped", "our")
    new $P474, "ResizablePMCArray"
    push $P474, $P473
    .return ($P474)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("127_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx477_tgt
    .local int rx477_pos
    .local int rx477_off
    .local int rx477_eos
    .local int rx477_rep
    .local pmc rx477_cur
    (rx477_cur, rx477_pos, rx477_tgt, $I10) = self."!cursor_start"()
    rx477_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx477_cur
    .local pmc match
    .lex "$/", match
    length rx477_eos, rx477_tgt
    set rx477_off, 0
    lt $I10, 2, rx477_start
    sub rx477_off, $I10, 1
    substr rx477_tgt, rx477_tgt, rx477_off
  rx477_start:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_481_fail
    rx477_cur."!mark_push"(0, rx477_pos, $I10)
  # rx literal  "has"
    add $I11, rx477_pos, 3
    gt $I11, rx477_eos, rx477_fail
    sub $I11, rx477_pos, rx477_off
    substr $S10, rx477_tgt, $I11, 3
    ne $S10, "has", rx477_fail
    add rx477_pos, 3
    set_addr $I10, rxcap_481_fail
    ($I12, $I11) = rx477_cur."!mark_peek"($I10)
    rx477_cur."!cursor_pos"($I11)
    ($P10) = rx477_cur."!cursor_start"()
    $P10."!cursor_pass"(rx477_pos, "")
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_481_done
  rxcap_481_fail:
    goto rx477_fail
  rxcap_481_done:
  # rx subrule "scoped" subtype=capture negate=
    rx477_cur."!cursor_pos"(rx477_pos)
    $P10 = rx477_cur."scoped"("has")
    unless $P10, rx477_fail
    rx477_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx477_pos = $P10."pos"()
  # rx pass
    rx477_cur."!cursor_pass"(rx477_pos, "scope_declarator:sym<has>")
    rx477_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx477_pos)
    .return (rx477_cur)
  rx477_fail:
.annotate "line", 4
    (rx477_rep, rx477_pos, $I10, $P10) = rx477_cur."!mark_fail"(0)
    lt rx477_pos, -1, rx477_done
    eq rx477_pos, -1, rx477_fail
    jump $I10
  rx477_done:
    rx477_cur."!cursor_fail"()
    rx477_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx477_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("128_1258533478.31768") :method
.annotate "line", 4
    $P479 = self."!PREFIX__!subrule"("scoped", "has")
    new $P480, "ResizablePMCArray"
    push $P480, $P479
    .return ($P480)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("129_1258533478.31768") :method :outer("11_1258533478.31768")
    .param pmc param_483
.annotate "line", 247
    .lex "$*SCOPE", param_483
.annotate "line", 4
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt, $I10) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    set rx484_off, 0
    lt $I10, 2, rx484_start
    sub rx484_off, $I10, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
  alt487_0:
.annotate "line", 247
    set_addr $I10, alt487_1
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
.annotate "line", 248
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."variable_declarator"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
    goto alt487_end
  alt487_1:
.annotate "line", 249
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."routine_declarator"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx484_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."ws"()
    unless $P10, rx484_fail
    rx484_pos = $P10."pos"()
  alt487_end:
.annotate "line", 247
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "scoped")
    rx484_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
.annotate "line", 4
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx484_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("130_1258533478.31768") :method
.annotate "line", 4
    new $P486, "ResizablePMCArray"
    push $P486, ""
    push $P486, ""
    .return ($P486)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("131_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx493_tgt
    .local int rx493_pos
    .local int rx493_off
    .local int rx493_eos
    .local int rx493_rep
    .local pmc rx493_cur
    (rx493_cur, rx493_pos, rx493_tgt, $I10) = self."!cursor_start"()
    rx493_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx493_cur
    .local pmc match
    .lex "$/", match
    length rx493_eos, rx493_tgt
    set rx493_off, 0
    lt $I10, 2, rx493_start
    sub rx493_off, $I10, 1
    substr rx493_tgt, rx493_tgt, rx493_off
  rx493_start:
.annotate "line", 252
  # rx subrule "variable" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."variable"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx493_pos = $P10."pos"()
  # rx pass
    rx493_cur."!cursor_pass"(rx493_pos, "variable_declarator")
    rx493_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx493_pos)
    .return (rx493_cur)
  rx493_fail:
.annotate "line", 4
    (rx493_rep, rx493_pos, $I10, $P10) = rx493_cur."!mark_fail"(0)
    lt rx493_pos, -1, rx493_done
    eq rx493_pos, -1, rx493_fail
    jump $I10
  rx493_done:
    rx493_cur."!cursor_fail"()
    rx493_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx493_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("132_1258533478.31768") :method
.annotate "line", 4
    $P495 = self."!PREFIX__!subrule"("variable", "")
    new $P496, "ResizablePMCArray"
    push $P496, $P495
    .return ($P496)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("133_1258533478.31768") :method
.annotate "line", 254
    $P498 = self."!protoregex"("routine_declarator")
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("134_1258533478.31768") :method
.annotate "line", 254
    $P500 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P500)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("135_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx502_tgt
    .local int rx502_pos
    .local int rx502_off
    .local int rx502_eos
    .local int rx502_rep
    .local pmc rx502_cur
    (rx502_cur, rx502_pos, rx502_tgt, $I10) = self."!cursor_start"()
    rx502_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx502_cur
    .local pmc match
    .lex "$/", match
    length rx502_eos, rx502_tgt
    set rx502_off, 0
    lt $I10, 2, rx502_start
    sub rx502_off, $I10, 1
    substr rx502_tgt, rx502_tgt, rx502_off
  rx502_start:
.annotate "line", 255
  # rx subcapture "sym"
    set_addr $I10, rxcap_506_fail
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  # rx literal  "sub"
    add $I11, rx502_pos, 3
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 3
    ne $S10, "sub", rx502_fail
    add rx502_pos, 3
    set_addr $I10, rxcap_506_fail
    ($I12, $I11) = rx502_cur."!mark_peek"($I10)
    rx502_cur."!cursor_pos"($I11)
    ($P10) = rx502_cur."!cursor_start"()
    $P10."!cursor_pass"(rx502_pos, "")
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_506_done
  rxcap_506_fail:
    goto rx502_fail
  rxcap_506_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx502_cur."!cursor_pos"(rx502_pos)
    $P10 = rx502_cur."routine_def"()
    unless $P10, rx502_fail
    rx502_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx502_pos = $P10."pos"()
  # rx pass
    rx502_cur."!cursor_pass"(rx502_pos, "routine_declarator:sym<sub>")
    rx502_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx502_pos)
    .return (rx502_cur)
  rx502_fail:
.annotate "line", 4
    (rx502_rep, rx502_pos, $I10, $P10) = rx502_cur."!mark_fail"(0)
    lt rx502_pos, -1, rx502_done
    eq rx502_pos, -1, rx502_fail
    jump $I10
  rx502_done:
    rx502_cur."!cursor_fail"()
    rx502_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx502_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("136_1258533478.31768") :method
.annotate "line", 4
    $P504 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P505, "ResizablePMCArray"
    push $P505, $P504
    .return ($P505)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("137_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx508_tgt
    .local int rx508_pos
    .local int rx508_off
    .local int rx508_eos
    .local int rx508_rep
    .local pmc rx508_cur
    (rx508_cur, rx508_pos, rx508_tgt, $I10) = self."!cursor_start"()
    rx508_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx508_cur
    .local pmc match
    .lex "$/", match
    length rx508_eos, rx508_tgt
    set rx508_off, 0
    lt $I10, 2, rx508_start
    sub rx508_off, $I10, 1
    substr rx508_tgt, rx508_tgt, rx508_off
  rx508_start:
.annotate "line", 256
  # rx subcapture "sym"
    set_addr $I10, rxcap_512_fail
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  # rx literal  "method"
    add $I11, rx508_pos, 6
    gt $I11, rx508_eos, rx508_fail
    sub $I11, rx508_pos, rx508_off
    substr $S10, rx508_tgt, $I11, 6
    ne $S10, "method", rx508_fail
    add rx508_pos, 6
    set_addr $I10, rxcap_512_fail
    ($I12, $I11) = rx508_cur."!mark_peek"($I10)
    rx508_cur."!cursor_pos"($I11)
    ($P10) = rx508_cur."!cursor_start"()
    $P10."!cursor_pass"(rx508_pos, "")
    rx508_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_512_done
  rxcap_512_fail:
    goto rx508_fail
  rxcap_512_done:
  # rx subrule "method_def" subtype=capture negate=
    rx508_cur."!cursor_pos"(rx508_pos)
    $P10 = rx508_cur."method_def"()
    unless $P10, rx508_fail
    rx508_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx508_pos = $P10."pos"()
  # rx pass
    rx508_cur."!cursor_pass"(rx508_pos, "routine_declarator:sym<method>")
    rx508_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx508_pos)
    .return (rx508_cur)
  rx508_fail:
.annotate "line", 4
    (rx508_rep, rx508_pos, $I10, $P10) = rx508_cur."!mark_fail"(0)
    lt rx508_pos, -1, rx508_done
    eq rx508_pos, -1, rx508_fail
    jump $I10
  rx508_done:
    rx508_cur."!cursor_fail"()
    rx508_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx508_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("138_1258533478.31768") :method
.annotate "line", 4
    $P510 = self."!PREFIX__!subrule"("method_def", "method")
    new $P511, "ResizablePMCArray"
    push $P511, $P510
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("139_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx514_tgt
    .local int rx514_pos
    .local int rx514_off
    .local int rx514_eos
    .local int rx514_rep
    .local pmc rx514_cur
    (rx514_cur, rx514_pos, rx514_tgt, $I10) = self."!cursor_start"()
    rx514_cur."!cursor_debug"("START ", "routine_def")
    rx514_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx514_cur
    .local pmc match
    .lex "$/", match
    length rx514_eos, rx514_tgt
    set rx514_off, 0
    lt $I10, 2, rx514_start
    sub rx514_off, $I10, 1
    substr rx514_tgt, rx514_tgt, rx514_off
  rx514_start:
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
.annotate "line", 259
  # rx rxquantr518 ** 0..1
    set_addr $I519, rxquantr518_done
    rx514_cur."!mark_push"(0, rx514_pos, $I519)
  rxquantr518_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."deflongname"()
    unless $P10, rx514_fail
    rx514_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx514_pos = $P10."pos"()
    (rx514_rep) = rx514_cur."!mark_commit"($I519)
  rxquantr518_done:
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
.annotate "line", 260
  # rx subrule "newpad" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."newpad"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  alt522_0:
.annotate "line", 261
    set_addr $I10, alt522_1
    rx514_cur."!mark_push"(0, rx514_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx514_pos, 1
    gt $I11, rx514_eos, rx514_fail
    sub $I11, rx514_pos, rx514_off
    substr $S10, rx514_tgt, $I11, 1
    ne $S10, "(", rx514_fail
    add rx514_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."signature"()
    unless $P10, rx514_fail
    rx514_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx514_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx514_pos, 1
    gt $I11, rx514_eos, rx514_fail
    sub $I11, rx514_pos, rx514_off
    substr $S10, rx514_tgt, $I11, 1
    ne $S10, ")", rx514_fail
    add rx514_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
    goto alt522_end
  alt522_1:
.annotate "line", 262
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
  alt522_end:
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
.annotate "line", 263
  # rx subrule "blockoid" subtype=capture negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."blockoid"()
    unless $P10, rx514_fail
    rx514_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx514_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx514_cur."!cursor_pos"(rx514_pos)
    $P10 = rx514_cur."ws"()
    unless $P10, rx514_fail
    rx514_pos = $P10."pos"()
.annotate "line", 258
  # rx pass
    rx514_cur."!cursor_pass"(rx514_pos, "routine_def")
    rx514_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx514_pos)
    .return (rx514_cur)
  rx514_fail:
.annotate "line", 4
    (rx514_rep, rx514_pos, $I10, $P10) = rx514_cur."!mark_fail"(0)
    lt rx514_pos, -1, rx514_done
    eq rx514_pos, -1, rx514_fail
    jump $I10
  rx514_done:
    rx514_cur."!cursor_fail"()
    rx514_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx514_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("140_1258533478.31768") :method
.annotate "line", 4
    new $P516, "ResizablePMCArray"
    push $P516, ""
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("141_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx532_tgt
    .local int rx532_pos
    .local int rx532_off
    .local int rx532_eos
    .local int rx532_rep
    .local pmc rx532_cur
    (rx532_cur, rx532_pos, rx532_tgt, $I10) = self."!cursor_start"()
    rx532_cur."!cursor_debug"("START ", "method_def")
    rx532_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx532_cur
    .local pmc match
    .lex "$/", match
    length rx532_eos, rx532_tgt
    set rx532_off, 0
    lt $I10, 2, rx532_start
    sub rx532_off, $I10, 1
    substr rx532_tgt, rx532_tgt, rx532_off
  rx532_start:
.annotate "line", 266
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
.annotate "line", 267
  # rx rxquantr536 ** 0..1
    set_addr $I537, rxquantr536_done
    rx532_cur."!mark_push"(0, rx532_pos, $I537)
  rxquantr536_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."deflongname"()
    unless $P10, rx532_fail
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx532_pos = $P10."pos"()
    (rx532_rep) = rx532_cur."!mark_commit"($I537)
  rxquantr536_done:
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
.annotate "line", 268
  # rx subrule "newpad" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."newpad"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  alt540_0:
.annotate "line", 269
    set_addr $I10, alt540_1
    rx532_cur."!mark_push"(0, rx532_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx532_pos, 1
    gt $I11, rx532_eos, rx532_fail
    sub $I11, rx532_pos, rx532_off
    substr $S10, rx532_tgt, $I11, 1
    ne $S10, "(", rx532_fail
    add rx532_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."signature"()
    unless $P10, rx532_fail
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx532_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx532_pos, 1
    gt $I11, rx532_eos, rx532_fail
    sub $I11, rx532_pos, rx532_off
    substr $S10, rx532_tgt, $I11, 1
    ne $S10, ")", rx532_fail
    add rx532_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
    goto alt540_end
  alt540_1:
.annotate "line", 270
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  alt540_end:
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
.annotate "line", 271
  # rx subrule "blockoid" subtype=capture negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."blockoid"()
    unless $P10, rx532_fail
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx532_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
.annotate "line", 266
  # rx pass
    rx532_cur."!cursor_pass"(rx532_pos, "method_def")
    rx532_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx532_pos)
    .return (rx532_cur)
  rx532_fail:
.annotate "line", 4
    (rx532_rep, rx532_pos, $I10, $P10) = rx532_cur."!mark_fail"(0)
    lt rx532_pos, -1, rx532_done
    eq rx532_pos, -1, rx532_fail
    jump $I10
  rx532_done:
    rx532_cur."!cursor_fail"()
    rx532_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx532_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("142_1258533478.31768") :method
.annotate "line", 4
    new $P534, "ResizablePMCArray"
    push $P534, ""
    .return ($P534)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("143_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx550_tgt
    .local int rx550_pos
    .local int rx550_off
    .local int rx550_eos
    .local int rx550_rep
    .local pmc rx550_cur
    (rx550_cur, rx550_pos, rx550_tgt, $I10) = self."!cursor_start"()
    rx550_cur."!cursor_debug"("START ", "signature")
    rx550_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx550_cur
    .local pmc match
    .lex "$/", match
    length rx550_eos, rx550_tgt
    set rx550_off, 0
    lt $I10, 2, rx550_start
    sub rx550_off, $I10, 1
    substr rx550_tgt, rx550_tgt, rx550_off
  rx550_start:
.annotate "line", 274
  # rx rxquantr553 ** 0..1
    set_addr $I556, rxquantr553_done
    rx550_cur."!mark_push"(0, rx550_pos, $I556)
  rxquantr553_loop:
  # rx rxquantr554 ** 1..*
    set_addr $I555, rxquantr554_done
    rx550_cur."!mark_push"(0, -1, $I555)
  rxquantr554_loop:
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."parameter"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx550_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."ws"()
    unless $P10, rx550_fail
    rx550_pos = $P10."pos"()
    (rx550_rep) = rx550_cur."!mark_commit"($I555)
    rx550_cur."!mark_push"(rx550_rep, rx550_pos, $I555)
  # rx literal  ","
    add $I11, rx550_pos, 1
    gt $I11, rx550_eos, rx550_fail
    sub $I11, rx550_pos, rx550_off
    substr $S10, rx550_tgt, $I11, 1
    ne $S10, ",", rx550_fail
    add rx550_pos, 1
    goto rxquantr554_loop
  rxquantr554_done:
    (rx550_rep) = rx550_cur."!mark_commit"($I556)
  rxquantr553_done:
  # rx pass
    rx550_cur."!cursor_pass"(rx550_pos, "signature")
    rx550_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx550_pos)
    .return (rx550_cur)
  rx550_fail:
.annotate "line", 4
    (rx550_rep, rx550_pos, $I10, $P10) = rx550_cur."!mark_fail"(0)
    lt rx550_pos, -1, rx550_done
    eq rx550_pos, -1, rx550_fail
    jump $I10
  rx550_done:
    rx550_cur."!cursor_fail"()
    rx550_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx550_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("144_1258533478.31768") :method
.annotate "line", 4
    new $P552, "ResizablePMCArray"
    push $P552, ""
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("145_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx558_tgt
    .local int rx558_pos
    .local int rx558_off
    .local int rx558_eos
    .local int rx558_rep
    .local pmc rx558_cur
    (rx558_cur, rx558_pos, rx558_tgt, $I10) = self."!cursor_start"()
    rx558_cur."!cursor_debug"("START ", "parameter")
    rx558_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx558_cur
    .local pmc match
    .lex "$/", match
    length rx558_eos, rx558_tgt
    set rx558_off, 0
    lt $I10, 2, rx558_start
    sub rx558_off, $I10, 1
    substr rx558_tgt, rx558_tgt, rx558_off
  rx558_start:
  alt564_0:
.annotate "line", 277
    set_addr $I10, alt564_1
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
.annotate "line", 278
  # rx subcapture "quant"
    set_addr $I10, rxcap_565_fail
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  # rx literal  "*"
    add $I11, rx558_pos, 1
    gt $I11, rx558_eos, rx558_fail
    sub $I11, rx558_pos, rx558_off
    substr $S10, rx558_tgt, $I11, 1
    ne $S10, "*", rx558_fail
    add rx558_pos, 1
    set_addr $I10, rxcap_565_fail
    ($I12, $I11) = rx558_cur."!mark_peek"($I10)
    rx558_cur."!cursor_pos"($I11)
    ($P10) = rx558_cur."!cursor_start"()
    $P10."!cursor_pass"(rx558_pos, "")
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_565_done
  rxcap_565_fail:
    goto rx558_fail
  rxcap_565_done:
  # rx subrule "param_var" subtype=capture negate=
    rx558_cur."!cursor_pos"(rx558_pos)
    $P10 = rx558_cur."param_var"()
    unless $P10, rx558_fail
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx558_pos = $P10."pos"()
    goto alt564_end
  alt564_1:
  alt566_0:
.annotate "line", 279
    set_addr $I10, alt566_1
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx558_cur."!cursor_pos"(rx558_pos)
    $P10 = rx558_cur."param_var"()
    unless $P10, rx558_fail
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx558_pos = $P10."pos"()
    goto alt566_end
  alt566_1:
  # rx subrule "named_param" subtype=capture negate=
    rx558_cur."!cursor_pos"(rx558_pos)
    $P10 = rx558_cur."named_param"()
    unless $P10, rx558_fail
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx558_pos = $P10."pos"()
  alt566_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_568_fail
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  alt567_0:
    set_addr $I10, alt567_1
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  # rx literal  "?"
    add $I11, rx558_pos, 1
    gt $I11, rx558_eos, rx558_fail
    sub $I11, rx558_pos, rx558_off
    substr $S10, rx558_tgt, $I11, 1
    ne $S10, "?", rx558_fail
    add rx558_pos, 1
    goto alt567_end
  alt567_1:
    set_addr $I10, alt567_2
    rx558_cur."!mark_push"(0, rx558_pos, $I10)
  # rx literal  "!"
    add $I11, rx558_pos, 1
    gt $I11, rx558_eos, rx558_fail
    sub $I11, rx558_pos, rx558_off
    substr $S10, rx558_tgt, $I11, 1
    ne $S10, "!", rx558_fail
    add rx558_pos, 1
    goto alt567_end
  alt567_2:
  alt567_end:
    set_addr $I10, rxcap_568_fail
    ($I12, $I11) = rx558_cur."!mark_peek"($I10)
    rx558_cur."!cursor_pos"($I11)
    ($P10) = rx558_cur."!cursor_start"()
    $P10."!cursor_pass"(rx558_pos, "")
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_568_done
  rxcap_568_fail:
    goto rx558_fail
  rxcap_568_done:
  alt564_end:
.annotate "line", 281
  # rx rxquantr569 ** 0..1
    set_addr $I570, rxquantr569_done
    rx558_cur."!mark_push"(0, rx558_pos, $I570)
  rxquantr569_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx558_cur."!cursor_pos"(rx558_pos)
    $P10 = rx558_cur."default_value"()
    unless $P10, rx558_fail
    rx558_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx558_pos = $P10."pos"()
    (rx558_rep) = rx558_cur."!mark_commit"($I570)
  rxquantr569_done:
.annotate "line", 276
  # rx pass
    rx558_cur."!cursor_pass"(rx558_pos, "parameter")
    rx558_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx558_pos)
    .return (rx558_cur)
  rx558_fail:
.annotate "line", 4
    (rx558_rep, rx558_pos, $I10, $P10) = rx558_cur."!mark_fail"(0)
    lt rx558_pos, -1, rx558_done
    eq rx558_pos, -1, rx558_fail
    jump $I10
  rx558_done:
    rx558_cur."!cursor_fail"()
    rx558_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx558_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("146_1258533478.31768") :method
.annotate "line", 4
    $P560 = self."!PREFIX__!subrule"("named_param", "")
    $P561 = self."!PREFIX__!subrule"("param_var", "")
    $P562 = self."!PREFIX__!subrule"("param_var", "*")
    new $P563, "ResizablePMCArray"
    push $P563, $P560
    push $P563, $P561
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("147_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx572_tgt
    .local int rx572_pos
    .local int rx572_off
    .local int rx572_eos
    .local int rx572_rep
    .local pmc rx572_cur
    (rx572_cur, rx572_pos, rx572_tgt, $I10) = self."!cursor_start"()
    rx572_cur."!cursor_debug"("START ", "param_var")
    rx572_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx572_cur
    .local pmc match
    .lex "$/", match
    length rx572_eos, rx572_tgt
    set rx572_off, 0
    lt $I10, 2, rx572_start
    sub rx572_off, $I10, 1
    substr rx572_tgt, rx572_tgt, rx572_off
  rx572_start:
.annotate "line", 285
  # rx subrule "sigil" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."sigil"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx572_pos = $P10."pos"()
  # rx rxquantr576 ** 0..1
    set_addr $I577, rxquantr576_done
    rx572_cur."!mark_push"(0, rx572_pos, $I577)
  rxquantr576_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."twigil"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx572_pos = $P10."pos"()
    (rx572_rep) = rx572_cur."!mark_commit"($I577)
  rxquantr576_done:
  alt578_0:
.annotate "line", 286
    set_addr $I10, alt578_1
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ident"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx572_pos = $P10."pos"()
    goto alt578_end
  alt578_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_579_fail
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx572_pos, rx572_eos, rx572_fail
    sub $I10, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx572_fail
    inc rx572_pos
    set_addr $I10, rxcap_579_fail
    ($I12, $I11) = rx572_cur."!mark_peek"($I10)
    rx572_cur."!cursor_pos"($I11)
    ($P10) = rx572_cur."!cursor_start"()
    $P10."!cursor_pass"(rx572_pos, "")
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_579_done
  rxcap_579_fail:
    goto rx572_fail
  rxcap_579_done:
  alt578_end:
.annotate "line", 284
  # rx pass
    rx572_cur."!cursor_pass"(rx572_pos, "param_var")
    rx572_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx572_pos)
    .return (rx572_cur)
  rx572_fail:
.annotate "line", 4
    (rx572_rep, rx572_pos, $I10, $P10) = rx572_cur."!mark_fail"(0)
    lt rx572_pos, -1, rx572_done
    eq rx572_pos, -1, rx572_fail
    jump $I10
  rx572_done:
    rx572_cur."!cursor_fail"()
    rx572_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx572_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("148_1258533478.31768") :method
.annotate "line", 4
    $P574 = self."!PREFIX__!subrule"("sigil", "")
    new $P575, "ResizablePMCArray"
    push $P575, $P574
    .return ($P575)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("149_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx581_tgt
    .local int rx581_pos
    .local int rx581_off
    .local int rx581_eos
    .local int rx581_rep
    .local pmc rx581_cur
    (rx581_cur, rx581_pos, rx581_tgt, $I10) = self."!cursor_start"()
    rx581_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx581_cur
    .local pmc match
    .lex "$/", match
    length rx581_eos, rx581_tgt
    set rx581_off, 0
    lt $I10, 2, rx581_start
    sub rx581_off, $I10, 1
    substr rx581_tgt, rx581_tgt, rx581_off
  rx581_start:
.annotate "line", 290
  # rx literal  ":"
    add $I11, rx581_pos, 1
    gt $I11, rx581_eos, rx581_fail
    sub $I11, rx581_pos, rx581_off
    substr $S10, rx581_tgt, $I11, 1
    ne $S10, ":", rx581_fail
    add rx581_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx581_cur."!cursor_pos"(rx581_pos)
    $P10 = rx581_cur."param_var"()
    unless $P10, rx581_fail
    rx581_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx581_pos = $P10."pos"()
.annotate "line", 289
  # rx pass
    rx581_cur."!cursor_pass"(rx581_pos, "named_param")
    rx581_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx581_pos)
    .return (rx581_cur)
  rx581_fail:
.annotate "line", 4
    (rx581_rep, rx581_pos, $I10, $P10) = rx581_cur."!mark_fail"(0)
    lt rx581_pos, -1, rx581_done
    eq rx581_pos, -1, rx581_fail
    jump $I10
  rx581_done:
    rx581_cur."!cursor_fail"()
    rx581_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx581_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("150_1258533478.31768") :method
.annotate "line", 4
    $P583 = self."!PREFIX__!subrule"("param_var", ":")
    new $P584, "ResizablePMCArray"
    push $P584, $P583
    .return ($P584)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("151_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx586_tgt
    .local int rx586_pos
    .local int rx586_off
    .local int rx586_eos
    .local int rx586_rep
    .local pmc rx586_cur
    (rx586_cur, rx586_pos, rx586_tgt, $I10) = self."!cursor_start"()
    rx586_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx586_cur
    .local pmc match
    .lex "$/", match
    length rx586_eos, rx586_tgt
    set rx586_off, 0
    lt $I10, 2, rx586_start
    sub rx586_off, $I10, 1
    substr rx586_tgt, rx586_tgt, rx586_off
  rx586_start:
.annotate "line", 293
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx586_pos, 1
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 1
    ne $S10, "=", rx586_fail
    add rx586_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."EXPR"("i=")
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx586_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."ws"()
    unless $P10, rx586_fail
    rx586_pos = $P10."pos"()
  # rx pass
    rx586_cur."!cursor_pass"(rx586_pos, "default_value")
    rx586_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx586_pos)
    .return (rx586_cur)
  rx586_fail:
.annotate "line", 4
    (rx586_rep, rx586_pos, $I10, $P10) = rx586_cur."!mark_fail"(0)
    lt rx586_pos, -1, rx586_done
    eq rx586_pos, -1, rx586_fail
    jump $I10
  rx586_done:
    rx586_cur."!cursor_fail"()
    rx586_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx586_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("152_1258533478.31768") :method
.annotate "line", 4
    new $P588, "ResizablePMCArray"
    push $P588, ""
    .return ($P588)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("153_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx593_tgt
    .local int rx593_pos
    .local int rx593_off
    .local int rx593_eos
    .local int rx593_rep
    .local pmc rx593_cur
    (rx593_cur, rx593_pos, rx593_tgt, $I10) = self."!cursor_start"()
    rx593_cur."!cursor_debug"("START ", "regex_declarator")
    rx593_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx593_cur
    .local pmc match
    .lex "$/", match
    length rx593_eos, rx593_tgt
    set rx593_off, 0
    lt $I10, 2, rx593_start
    sub rx593_off, $I10, 1
    substr rx593_tgt, rx593_tgt, rx593_off
  rx593_start:
.annotate "line", 295
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  alt597_0:
.annotate "line", 296
    set_addr $I10, alt597_1
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
.annotate "line", 297
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_599_fail
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "proto"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "proto", rx593_fail
    add rx593_pos, 5
    set_addr $I10, rxcap_599_fail
    ($I12, $I11) = rx593_cur."!mark_peek"($I10)
    rx593_cur."!cursor_pos"($I11)
    ($P10) = rx593_cur."!cursor_start"()
    $P10."!cursor_pass"(rx593_pos, "")
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_599_done
  rxcap_599_fail:
    goto rx593_fail
  rxcap_599_done:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  alt601_0:
    set_addr $I10, alt601_1
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "regex"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "regex", rx593_fail
    add rx593_pos, 5
    goto alt601_end
  alt601_1:
    set_addr $I10, alt601_2
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "token"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "token", rx593_fail
    add rx593_pos, 5
    goto alt601_end
  alt601_2:
  # rx literal  "rule"
    add $I11, rx593_pos, 4
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 4
    ne $S10, "rule", rx593_fail
    add rx593_pos, 4
  alt601_end:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 298
  # rx subrule "deflongname" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."deflongname"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 299
  # rx literal  "{"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "{", rx593_fail
    add rx593_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "<...>", rx593_fail
    add rx593_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "}", rx593_fail
    add rx593_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ENDSTMT"()
    unless $P10, rx593_fail
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 297
    goto alt597_end
  alt597_1:
.annotate "line", 300
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_609_fail
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  alt608_0:
    set_addr $I10, alt608_1
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "regex"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "regex", rx593_fail
    add rx593_pos, 5
    goto alt608_end
  alt608_1:
    set_addr $I10, alt608_2
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx literal  "token"
    add $I11, rx593_pos, 5
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 5
    ne $S10, "token", rx593_fail
    add rx593_pos, 5
    goto alt608_end
  alt608_2:
  # rx literal  "rule"
    add $I11, rx593_pos, 4
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 4
    ne $S10, "rule", rx593_fail
    add rx593_pos, 4
  alt608_end:
    set_addr $I10, rxcap_609_fail
    ($I12, $I11) = rx593_cur."!mark_peek"($I10)
    rx593_cur."!cursor_pos"($I11)
    ($P10) = rx593_cur."!cursor_start"()
    $P10."!cursor_pass"(rx593_pos, "")
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_609_done
  rxcap_609_fail:
    goto rx593_fail
  rxcap_609_done:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 301
  # rx subrule "deflongname" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."deflongname"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 302
  # rx subrule "newpad" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."newpad"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 303
  # rx rxquantr613 ** 0..1
    set_addr $I618, rxquantr613_done
    rx593_cur."!mark_push"(0, rx593_pos, $I618)
  rxquantr613_loop:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "(", rx593_fail
    add rx593_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."signature"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, ")", rx593_fail
    add rx593_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
    (rx593_rep) = rx593_cur."!mark_commit"($I618)
  rxquantr613_done:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 304
  # rx reduce name="regex_declarator" key="open"
    rx593_cur."!cursor_pos"(rx593_pos)
    rx593_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 305
  # rx literal  "{"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "{", rx593_fail
    add rx593_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."LANG"("Regex", "nibbler")
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx593_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "}", rx593_fail
    add rx593_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ENDSTMT"()
    unless $P10, rx593_fail
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  alt597_end:
.annotate "line", 306
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 295
  # rx pass
    rx593_cur."!cursor_pass"(rx593_pos, "regex_declarator")
    rx593_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx593_pos)
    .return (rx593_cur)
  rx593_fail:
.annotate "line", 4
    (rx593_rep, rx593_pos, $I10, $P10) = rx593_cur."!mark_fail"(0)
    lt rx593_pos, -1, rx593_done
    eq rx593_pos, -1, rx593_fail
    jump $I10
  rx593_done:
    rx593_cur."!cursor_fail"()
    rx593_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx593_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("154_1258533478.31768") :method
.annotate "line", 4
    new $P595, "ResizablePMCArray"
    push $P595, ""
    .return ($P595)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("155_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx624_tgt
    .local int rx624_pos
    .local int rx624_off
    .local int rx624_eos
    .local int rx624_rep
    .local pmc rx624_cur
    (rx624_cur, rx624_pos, rx624_tgt, $I10) = self."!cursor_start"()
    rx624_cur."!cursor_debug"("START ", "dotty")
    rx624_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx624_cur
    .local pmc match
    .lex "$/", match
    length rx624_eos, rx624_tgt
    set rx624_off, 0
    lt $I10, 2, rx624_start
    sub rx624_off, $I10, 1
    substr rx624_tgt, rx624_tgt, rx624_off
  rx624_start:
.annotate "line", 310
  # rx literal  "."
    add $I11, rx624_pos, 1
    gt $I11, rx624_eos, rx624_fail
    sub $I11, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I11, 1
    ne $S10, ".", rx624_fail
    add rx624_pos, 1
  # rx subrule "identifier" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."identifier"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx624_pos = $P10."pos"()
.annotate "line", 314
  # rx rxquantr628 ** 0..1
    set_addr $I630, rxquantr628_done
    rx624_cur."!mark_push"(0, rx624_pos, $I630)
  rxquantr628_loop:
  alt629_0:
.annotate "line", 311
    set_addr $I10, alt629_1
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
.annotate "line", 312
  # rx enumcharlist negate=0 zerowidth
    ge rx624_pos, rx624_eos, rx624_fail
    sub $I10, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx624_fail
  # rx subrule "args" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."args"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx624_pos = $P10."pos"()
    goto alt629_end
  alt629_1:
.annotate "line", 313
  # rx literal  ":"
    add $I11, rx624_pos, 1
    gt $I11, rx624_eos, rx624_fail
    sub $I11, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I11, 1
    ne $S10, ":", rx624_fail
    add rx624_pos, 1
  # rx charclass s
    ge rx624_pos, rx624_eos, rx624_fail
    sub $I10, rx624_pos, rx624_off
    is_cclass $I11, 32, rx624_tgt, $I10
    unless $I11, rx624_fail
    inc rx624_pos
  # rx subrule "arglist" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."arglist"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx624_pos = $P10."pos"()
  alt629_end:
.annotate "line", 314
    (rx624_rep) = rx624_cur."!mark_commit"($I630)
  rxquantr628_done:
.annotate "line", 309
  # rx pass
    rx624_cur."!cursor_pass"(rx624_pos, "dotty")
    rx624_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx624_pos)
    .return (rx624_cur)
  rx624_fail:
.annotate "line", 4
    (rx624_rep, rx624_pos, $I10, $P10) = rx624_cur."!mark_fail"(0)
    lt rx624_pos, -1, rx624_done
    eq rx624_pos, -1, rx624_fail
    jump $I10
  rx624_done:
    rx624_cur."!cursor_fail"()
    rx624_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx624_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("156_1258533478.31768") :method
.annotate "line", 4
    $P626 = self."!PREFIX__!subrule"("identifier", ".")
    new $P627, "ResizablePMCArray"
    push $P627, $P626
    .return ($P627)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("157_1258533478.31768") :method
.annotate "line", 318
    $P632 = self."!protoregex"("term")
    .return ($P632)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("158_1258533478.31768") :method
.annotate "line", 318
    $P634 = self."!PREFIX__!protoregex"("term")
    .return ($P634)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("159_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx636_tgt
    .local int rx636_pos
    .local int rx636_off
    .local int rx636_eos
    .local int rx636_rep
    .local pmc rx636_cur
    (rx636_cur, rx636_pos, rx636_tgt, $I10) = self."!cursor_start"()
    rx636_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx636_cur
    .local pmc match
    .lex "$/", match
    length rx636_eos, rx636_tgt
    set rx636_off, 0
    lt $I10, 2, rx636_start
    sub rx636_off, $I10, 1
    substr rx636_tgt, rx636_tgt, rx636_off
  rx636_start:
.annotate "line", 320
  # rx subcapture "sym"
    set_addr $I10, rxcap_639_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx literal  "self"
    add $I11, rx636_pos, 4
    gt $I11, rx636_eos, rx636_fail
    sub $I11, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I11, 4
    ne $S10, "self", rx636_fail
    add rx636_pos, 4
    set_addr $I10, rxcap_639_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_639_done
  rxcap_639_fail:
    goto rx636_fail
  rxcap_639_done:
  # rxanchor rwb
    le rx636_pos, 0, rx636_fail
    sub $I10, rx636_pos, rx636_off
    is_cclass $I11, 8192, rx636_tgt, $I10
    if $I11, rx636_fail
    dec $I10
    is_cclass $I11, 8192, rx636_tgt, $I10
    unless $I11, rx636_fail
  # rx pass
    rx636_cur."!cursor_pass"(rx636_pos, "term:sym<self>")
    rx636_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx636_pos)
    .return (rx636_cur)
  rx636_fail:
.annotate "line", 4
    (rx636_rep, rx636_pos, $I10, $P10) = rx636_cur."!mark_fail"(0)
    lt rx636_pos, -1, rx636_done
    eq rx636_pos, -1, rx636_fail
    jump $I10
  rx636_done:
    rx636_cur."!cursor_fail"()
    rx636_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("160_1258533478.31768") :method
.annotate "line", 4
    new $P638, "ResizablePMCArray"
    push $P638, "self"
    .return ($P638)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("161_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx641_tgt
    .local int rx641_pos
    .local int rx641_off
    .local int rx641_eos
    .local int rx641_rep
    .local pmc rx641_cur
    (rx641_cur, rx641_pos, rx641_tgt, $I10) = self."!cursor_start"()
    rx641_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx641_cur
    .local pmc match
    .lex "$/", match
    length rx641_eos, rx641_tgt
    set rx641_off, 0
    lt $I10, 2, rx641_start
    sub rx641_off, $I10, 1
    substr rx641_tgt, rx641_tgt, rx641_off
  rx641_start:
.annotate "line", 323
  # rx subrule "identifier" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."identifier"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx641_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx641_pos, rx641_eos, rx641_fail
    sub $I10, rx641_pos, rx641_off
    substr $S10, rx641_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx641_fail
  # rx subrule "args" subtype=capture negate=
    rx641_cur."!cursor_pos"(rx641_pos)
    $P10 = rx641_cur."args"()
    unless $P10, rx641_fail
    rx641_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx641_pos = $P10."pos"()
.annotate "line", 322
  # rx pass
    rx641_cur."!cursor_pass"(rx641_pos, "term:sym<identifier>")
    rx641_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx641_pos)
    .return (rx641_cur)
  rx641_fail:
.annotate "line", 4
    (rx641_rep, rx641_pos, $I10, $P10) = rx641_cur."!mark_fail"(0)
    lt rx641_pos, -1, rx641_done
    eq rx641_pos, -1, rx641_fail
    jump $I10
  rx641_done:
    rx641_cur."!cursor_fail"()
    rx641_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx641_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("162_1258533478.31768") :method
.annotate "line", 4
    $P643 = self."!PREFIX__!subrule"("identifier", "")
    new $P644, "ResizablePMCArray"
    push $P644, $P643
    .return ($P644)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("163_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx646_tgt
    .local int rx646_pos
    .local int rx646_off
    .local int rx646_eos
    .local int rx646_rep
    .local pmc rx646_cur
    (rx646_cur, rx646_pos, rx646_tgt, $I10) = self."!cursor_start"()
    rx646_cur."!cursor_debug"("START ", "term:sym<name>")
    rx646_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx646_cur
    .local pmc match
    .lex "$/", match
    length rx646_eos, rx646_tgt
    set rx646_off, 0
    lt $I10, 2, rx646_start
    sub rx646_off, $I10, 1
    substr rx646_tgt, rx646_tgt, rx646_off
  rx646_start:
.annotate "line", 327
  # rx subrule "name" subtype=capture negate=
    rx646_cur."!cursor_pos"(rx646_pos)
    $P10 = rx646_cur."name"()
    unless $P10, rx646_fail
    rx646_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx646_pos = $P10."pos"()
  # rx rxquantr650 ** 0..1
    set_addr $I651, rxquantr650_done
    rx646_cur."!mark_push"(0, rx646_pos, $I651)
  rxquantr650_loop:
  # rx subrule "args" subtype=capture negate=
    rx646_cur."!cursor_pos"(rx646_pos)
    $P10 = rx646_cur."args"()
    unless $P10, rx646_fail
    rx646_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx646_pos = $P10."pos"()
    (rx646_rep) = rx646_cur."!mark_commit"($I651)
  rxquantr650_done:
.annotate "line", 326
  # rx pass
    rx646_cur."!cursor_pass"(rx646_pos, "term:sym<name>")
    rx646_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx646_pos)
    .return (rx646_cur)
  rx646_fail:
.annotate "line", 4
    (rx646_rep, rx646_pos, $I10, $P10) = rx646_cur."!mark_fail"(0)
    lt rx646_pos, -1, rx646_done
    eq rx646_pos, -1, rx646_fail
    jump $I10
  rx646_done:
    rx646_cur."!cursor_fail"()
    rx646_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx646_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("164_1258533478.31768") :method
.annotate "line", 4
    $P648 = self."!PREFIX__!subrule"("name", "")
    new $P649, "ResizablePMCArray"
    push $P649, $P648
    .return ($P649)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("165_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx653_tgt
    .local int rx653_pos
    .local int rx653_off
    .local int rx653_eos
    .local int rx653_rep
    .local pmc rx653_cur
    (rx653_cur, rx653_pos, rx653_tgt, $I10) = self."!cursor_start"()
    rx653_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx653_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx653_cur
    .local pmc match
    .lex "$/", match
    length rx653_eos, rx653_tgt
    set rx653_off, 0
    lt $I10, 2, rx653_start
    sub rx653_off, $I10, 1
    substr rx653_tgt, rx653_tgt, rx653_off
  rx653_start:
.annotate "line", 331
  # rx literal  "pir::"
    add $I11, rx653_pos, 5
    gt $I11, rx653_eos, rx653_fail
    sub $I11, rx653_pos, rx653_off
    substr $S10, rx653_tgt, $I11, 5
    ne $S10, "pir::", rx653_fail
    add rx653_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_656_fail
    rx653_cur."!mark_push"(0, rx653_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx653_pos, rx653_off
    find_not_cclass $I11, 8192, rx653_tgt, $I10, rx653_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx653_fail
    add rx653_pos, rx653_off, $I11
    set_addr $I10, rxcap_656_fail
    ($I12, $I11) = rx653_cur."!mark_peek"($I10)
    rx653_cur."!cursor_pos"($I11)
    ($P10) = rx653_cur."!cursor_start"()
    $P10."!cursor_pass"(rx653_pos, "")
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_656_done
  rxcap_656_fail:
    goto rx653_fail
  rxcap_656_done:
  # rx rxquantr657 ** 0..1
    set_addr $I658, rxquantr657_done
    rx653_cur."!mark_push"(0, rx653_pos, $I658)
  rxquantr657_loop:
  # rx subrule "args" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."args"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx653_pos = $P10."pos"()
    (rx653_rep) = rx653_cur."!mark_commit"($I658)
  rxquantr657_done:
.annotate "line", 330
  # rx pass
    rx653_cur."!cursor_pass"(rx653_pos, "term:sym<pir::op>")
    rx653_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx653_pos)
    .return (rx653_cur)
  rx653_fail:
.annotate "line", 4
    (rx653_rep, rx653_pos, $I10, $P10) = rx653_cur."!mark_fail"(0)
    lt rx653_pos, -1, rx653_done
    eq rx653_pos, -1, rx653_fail
    jump $I10
  rx653_done:
    rx653_cur."!cursor_fail"()
    rx653_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx653_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("166_1258533478.31768") :method
.annotate "line", 4
    new $P655, "ResizablePMCArray"
    push $P655, "pir::"
    .return ($P655)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("167_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx660_tgt
    .local int rx660_pos
    .local int rx660_off
    .local int rx660_eos
    .local int rx660_rep
    .local pmc rx660_cur
    (rx660_cur, rx660_pos, rx660_tgt, $I10) = self."!cursor_start"()
    rx660_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx660_cur
    .local pmc match
    .lex "$/", match
    length rx660_eos, rx660_tgt
    set rx660_off, 0
    lt $I10, 2, rx660_start
    sub rx660_off, $I10, 1
    substr rx660_tgt, rx660_tgt, rx660_off
  rx660_start:
.annotate "line", 335
  # rx literal  "("
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "(", rx660_fail
    add rx660_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."arglist"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx660_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, ")", rx660_fail
    add rx660_pos, 1
  # rx pass
    rx660_cur."!cursor_pass"(rx660_pos, "args")
    rx660_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx660_pos)
    .return (rx660_cur)
  rx660_fail:
.annotate "line", 4
    (rx660_rep, rx660_pos, $I10, $P10) = rx660_cur."!mark_fail"(0)
    lt rx660_pos, -1, rx660_done
    eq rx660_pos, -1, rx660_fail
    jump $I10
  rx660_done:
    rx660_cur."!cursor_fail"()
    rx660_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx660_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("168_1258533478.31768") :method
.annotate "line", 4
    $P662 = self."!PREFIX__!subrule"("arglist", "(")
    new $P663, "ResizablePMCArray"
    push $P663, $P662
    .return ($P663)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("169_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx665_tgt
    .local int rx665_pos
    .local int rx665_off
    .local int rx665_eos
    .local int rx665_rep
    .local pmc rx665_cur
    (rx665_cur, rx665_pos, rx665_tgt, $I10) = self."!cursor_start"()
    rx665_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx665_cur
    .local pmc match
    .lex "$/", match
    length rx665_eos, rx665_tgt
    set rx665_off, 0
    lt $I10, 2, rx665_start
    sub rx665_off, $I10, 1
    substr rx665_tgt, rx665_tgt, rx665_off
  rx665_start:
.annotate "line", 339
  # rx subrule "ws" subtype=method negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."ws"()
    unless $P10, rx665_fail
    rx665_pos = $P10."pos"()
  alt669_0:
.annotate "line", 340
    set_addr $I10, alt669_1
    rx665_cur."!mark_push"(0, rx665_pos, $I10)
.annotate "line", 341
  # rx subrule "EXPR" subtype=capture negate=
    rx665_cur."!cursor_pos"(rx665_pos)
    $P10 = rx665_cur."EXPR"("f=")
    unless $P10, rx665_fail
    rx665_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx665_pos = $P10."pos"()
    goto alt669_end
  alt669_1:
  alt669_end:
.annotate "line", 338
  # rx pass
    rx665_cur."!cursor_pass"(rx665_pos, "arglist")
    rx665_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx665_pos)
    .return (rx665_cur)
  rx665_fail:
.annotate "line", 4
    (rx665_rep, rx665_pos, $I10, $P10) = rx665_cur."!mark_fail"(0)
    lt rx665_pos, -1, rx665_done
    eq rx665_pos, -1, rx665_fail
    jump $I10
  rx665_done:
    rx665_cur."!cursor_fail"()
    rx665_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx665_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("170_1258533478.31768") :method
.annotate "line", 4
    $P667 = self."!PREFIX__!subrule"("", "")
    new $P668, "ResizablePMCArray"
    push $P668, $P667
    .return ($P668)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("171_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx671_tgt
    .local int rx671_pos
    .local int rx671_off
    .local int rx671_eos
    .local int rx671_rep
    .local pmc rx671_cur
    (rx671_cur, rx671_pos, rx671_tgt, $I10) = self."!cursor_start"()
    rx671_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx671_cur
    .local pmc match
    .lex "$/", match
    length rx671_eos, rx671_tgt
    set rx671_off, 0
    lt $I10, 2, rx671_start
    sub rx671_off, $I10, 1
    substr rx671_tgt, rx671_tgt, rx671_off
  rx671_start:
.annotate "line", 347
  # rx subrule "value" subtype=capture negate=
    rx671_cur."!cursor_pos"(rx671_pos)
    $P10 = rx671_cur."value"()
    unless $P10, rx671_fail
    rx671_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx671_pos = $P10."pos"()
  # rx pass
    rx671_cur."!cursor_pass"(rx671_pos, "term:sym<value>")
    rx671_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx671_pos)
    .return (rx671_cur)
  rx671_fail:
.annotate "line", 4
    (rx671_rep, rx671_pos, $I10, $P10) = rx671_cur."!mark_fail"(0)
    lt rx671_pos, -1, rx671_done
    eq rx671_pos, -1, rx671_fail
    jump $I10
  rx671_done:
    rx671_cur."!cursor_fail"()
    rx671_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx671_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("172_1258533478.31768") :method
.annotate "line", 4
    $P673 = self."!PREFIX__!subrule"("value", "")
    new $P674, "ResizablePMCArray"
    push $P674, $P673
    .return ($P674)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("173_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx676_tgt
    .local int rx676_pos
    .local int rx676_off
    .local int rx676_eos
    .local int rx676_rep
    .local pmc rx676_cur
    (rx676_cur, rx676_pos, rx676_tgt, $I10) = self."!cursor_start"()
    rx676_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx676_cur
    .local pmc match
    .lex "$/", match
    length rx676_eos, rx676_tgt
    set rx676_off, 0
    lt $I10, 2, rx676_start
    sub rx676_off, $I10, 1
    substr rx676_tgt, rx676_tgt, rx676_off
  rx676_start:
  alt682_0:
.annotate "line", 349
    set_addr $I10, alt682_1
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
.annotate "line", 350
  # rx subrule "dec_number" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."dec_number"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx676_pos = $P10."pos"()
    goto alt682_end
  alt682_1:
    set_addr $I10, alt682_2
    rx676_cur."!mark_push"(0, rx676_pos, $I10)
.annotate "line", 351
  # rx subrule "quote" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."quote"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx676_pos = $P10."pos"()
    goto alt682_end
  alt682_2:
.annotate "line", 352
  # rx subrule "integer" subtype=capture negate=
    rx676_cur."!cursor_pos"(rx676_pos)
    $P10 = rx676_cur."integer"()
    unless $P10, rx676_fail
    rx676_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx676_pos = $P10."pos"()
  alt682_end:
.annotate "line", 349
  # rx pass
    rx676_cur."!cursor_pass"(rx676_pos, "value")
    rx676_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx676_pos)
    .return (rx676_cur)
  rx676_fail:
.annotate "line", 4
    (rx676_rep, rx676_pos, $I10, $P10) = rx676_cur."!mark_fail"(0)
    lt rx676_pos, -1, rx676_done
    eq rx676_pos, -1, rx676_fail
    jump $I10
  rx676_done:
    rx676_cur."!cursor_fail"()
    rx676_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx676_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("174_1258533478.31768") :method
.annotate "line", 4
    $P678 = self."!PREFIX__!subrule"("integer", "")
    $P679 = self."!PREFIX__!subrule"("quote", "")
    $P680 = self."!PREFIX__!subrule"("dec_number", "")
    new $P681, "ResizablePMCArray"
    push $P681, $P678
    push $P681, $P679
    push $P681, $P680
    .return ($P681)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("175_1258533478.31768") :method
.annotate "line", 355
    $P684 = self."!protoregex"("quote")
    .return ($P684)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("176_1258533478.31768") :method
.annotate "line", 355
    $P686 = self."!PREFIX__!protoregex"("quote")
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("177_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx688_tgt
    .local int rx688_pos
    .local int rx688_off
    .local int rx688_eos
    .local int rx688_rep
    .local pmc rx688_cur
    (rx688_cur, rx688_pos, rx688_tgt, $I10) = self."!cursor_start"()
    rx688_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx688_cur
    .local pmc match
    .lex "$/", match
    length rx688_eos, rx688_tgt
    set rx688_off, 0
    lt $I10, 2, rx688_start
    sub rx688_off, $I10, 1
    substr rx688_tgt, rx688_tgt, rx688_off
  rx688_start:
.annotate "line", 356
  # rx enumcharlist negate=0 zerowidth
    ge rx688_pos, rx688_eos, rx688_fail
    sub $I10, rx688_pos, rx688_off
    substr $S10, rx688_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx688_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."quote_EXPR"(":q")
    unless $P10, rx688_fail
    rx688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx688_pos = $P10."pos"()
  # rx pass
    rx688_cur."!cursor_pass"(rx688_pos, "quote:sym<apos>")
    rx688_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx688_pos)
    .return (rx688_cur)
  rx688_fail:
.annotate "line", 4
    (rx688_rep, rx688_pos, $I10, $P10) = rx688_cur."!mark_fail"(0)
    lt rx688_pos, -1, rx688_done
    eq rx688_pos, -1, rx688_fail
    jump $I10
  rx688_done:
    rx688_cur."!cursor_fail"()
    rx688_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx688_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("178_1258533478.31768") :method
.annotate "line", 4
    new $P690, "ResizablePMCArray"
    push $P690, "'"
    .return ($P690)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("179_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx692_tgt
    .local int rx692_pos
    .local int rx692_off
    .local int rx692_eos
    .local int rx692_rep
    .local pmc rx692_cur
    (rx692_cur, rx692_pos, rx692_tgt, $I10) = self."!cursor_start"()
    rx692_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx692_cur
    .local pmc match
    .lex "$/", match
    length rx692_eos, rx692_tgt
    set rx692_off, 0
    lt $I10, 2, rx692_start
    sub rx692_off, $I10, 1
    substr rx692_tgt, rx692_tgt, rx692_off
  rx692_start:
.annotate "line", 357
  # rx enumcharlist negate=0 zerowidth
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx692_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."quote_EXPR"(":qq")
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx692_pos = $P10."pos"()
  # rx pass
    rx692_cur."!cursor_pass"(rx692_pos, "quote:sym<dblq>")
    rx692_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx692_pos)
    .return (rx692_cur)
  rx692_fail:
.annotate "line", 4
    (rx692_rep, rx692_pos, $I10, $P10) = rx692_cur."!mark_fail"(0)
    lt rx692_pos, -1, rx692_done
    eq rx692_pos, -1, rx692_fail
    jump $I10
  rx692_done:
    rx692_cur."!cursor_fail"()
    rx692_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx692_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("180_1258533478.31768") :method
.annotate "line", 4
    new $P694, "ResizablePMCArray"
    push $P694, "\""
    .return ($P694)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("181_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx696_tgt
    .local int rx696_pos
    .local int rx696_off
    .local int rx696_eos
    .local int rx696_rep
    .local pmc rx696_cur
    (rx696_cur, rx696_pos, rx696_tgt, $I10) = self."!cursor_start"()
    rx696_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx696_cur
    .local pmc match
    .lex "$/", match
    length rx696_eos, rx696_tgt
    set rx696_off, 0
    lt $I10, 2, rx696_start
    sub rx696_off, $I10, 1
    substr rx696_tgt, rx696_tgt, rx696_off
  rx696_start:
.annotate "line", 358
  # rx literal  "q"
    add $I11, rx696_pos, 1
    gt $I11, rx696_eos, rx696_fail
    sub $I11, rx696_pos, rx696_off
    substr $S10, rx696_tgt, $I11, 1
    ne $S10, "q", rx696_fail
    add rx696_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx696_pos, rx696_eos, rx696_fail
    sub $I10, rx696_pos, rx696_off
    substr $S10, rx696_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx696_fail
  # rx subrule "ws" subtype=method negate=
    rx696_cur."!cursor_pos"(rx696_pos)
    $P10 = rx696_cur."ws"()
    unless $P10, rx696_fail
    rx696_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx696_cur."!cursor_pos"(rx696_pos)
    $P10 = rx696_cur."quote_EXPR"(":q")
    unless $P10, rx696_fail
    rx696_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx696_pos = $P10."pos"()
  # rx pass
    rx696_cur."!cursor_pass"(rx696_pos, "quote:sym<q>")
    rx696_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx696_pos)
    .return (rx696_cur)
  rx696_fail:
.annotate "line", 4
    (rx696_rep, rx696_pos, $I10, $P10) = rx696_cur."!mark_fail"(0)
    lt rx696_pos, -1, rx696_done
    eq rx696_pos, -1, rx696_fail
    jump $I10
  rx696_done:
    rx696_cur."!cursor_fail"()
    rx696_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx696_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("182_1258533478.31768") :method
.annotate "line", 4
    $P698 = self."!PREFIX__!subrule"("", "q")
    new $P699, "ResizablePMCArray"
    push $P699, $P698
    .return ($P699)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("183_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx701_tgt
    .local int rx701_pos
    .local int rx701_off
    .local int rx701_eos
    .local int rx701_rep
    .local pmc rx701_cur
    (rx701_cur, rx701_pos, rx701_tgt, $I10) = self."!cursor_start"()
    rx701_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx701_cur
    .local pmc match
    .lex "$/", match
    length rx701_eos, rx701_tgt
    set rx701_off, 0
    lt $I10, 2, rx701_start
    sub rx701_off, $I10, 1
    substr rx701_tgt, rx701_tgt, rx701_off
  rx701_start:
.annotate "line", 359
  # rx literal  "qq"
    add $I11, rx701_pos, 2
    gt $I11, rx701_eos, rx701_fail
    sub $I11, rx701_pos, rx701_off
    substr $S10, rx701_tgt, $I11, 2
    ne $S10, "qq", rx701_fail
    add rx701_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx701_pos, rx701_eos, rx701_fail
    sub $I10, rx701_pos, rx701_off
    substr $S10, rx701_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx701_fail
  # rx subrule "ws" subtype=method negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."ws"()
    unless $P10, rx701_fail
    rx701_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx701_cur."!cursor_pos"(rx701_pos)
    $P10 = rx701_cur."quote_EXPR"(":qq")
    unless $P10, rx701_fail
    rx701_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx701_pos = $P10."pos"()
  # rx pass
    rx701_cur."!cursor_pass"(rx701_pos, "quote:sym<qq>")
    rx701_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx701_pos)
    .return (rx701_cur)
  rx701_fail:
.annotate "line", 4
    (rx701_rep, rx701_pos, $I10, $P10) = rx701_cur."!mark_fail"(0)
    lt rx701_pos, -1, rx701_done
    eq rx701_pos, -1, rx701_fail
    jump $I10
  rx701_done:
    rx701_cur."!cursor_fail"()
    rx701_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx701_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("184_1258533478.31768") :method
.annotate "line", 4
    $P703 = self."!PREFIX__!subrule"("", "qq")
    new $P704, "ResizablePMCArray"
    push $P704, $P703
    .return ($P704)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("185_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx706_tgt
    .local int rx706_pos
    .local int rx706_off
    .local int rx706_eos
    .local int rx706_rep
    .local pmc rx706_cur
    (rx706_cur, rx706_pos, rx706_tgt, $I10) = self."!cursor_start"()
    rx706_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx706_cur
    .local pmc match
    .lex "$/", match
    length rx706_eos, rx706_tgt
    set rx706_off, 0
    lt $I10, 2, rx706_start
    sub rx706_off, $I10, 1
    substr rx706_tgt, rx706_tgt, rx706_off
  rx706_start:
.annotate "line", 360
  # rx literal  "Q"
    add $I11, rx706_pos, 1
    gt $I11, rx706_eos, rx706_fail
    sub $I11, rx706_pos, rx706_off
    substr $S10, rx706_tgt, $I11, 1
    ne $S10, "Q", rx706_fail
    add rx706_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx706_pos, rx706_eos, rx706_fail
    sub $I10, rx706_pos, rx706_off
    substr $S10, rx706_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx706_fail
  # rx subrule "ws" subtype=method negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."ws"()
    unless $P10, rx706_fail
    rx706_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."quote_EXPR"()
    unless $P10, rx706_fail
    rx706_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx706_pos = $P10."pos"()
  # rx pass
    rx706_cur."!cursor_pass"(rx706_pos, "quote:sym<Q>")
    rx706_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx706_pos)
    .return (rx706_cur)
  rx706_fail:
.annotate "line", 4
    (rx706_rep, rx706_pos, $I10, $P10) = rx706_cur."!mark_fail"(0)
    lt rx706_pos, -1, rx706_done
    eq rx706_pos, -1, rx706_fail
    jump $I10
  rx706_done:
    rx706_cur."!cursor_fail"()
    rx706_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx706_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("186_1258533478.31768") :method
.annotate "line", 4
    $P708 = self."!PREFIX__!subrule"("", "Q")
    new $P709, "ResizablePMCArray"
    push $P709, $P708
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("187_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx711_tgt
    .local int rx711_pos
    .local int rx711_off
    .local int rx711_eos
    .local int rx711_rep
    .local pmc rx711_cur
    (rx711_cur, rx711_pos, rx711_tgt, $I10) = self."!cursor_start"()
    rx711_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx711_cur
    .local pmc match
    .lex "$/", match
    length rx711_eos, rx711_tgt
    set rx711_off, 0
    lt $I10, 2, rx711_start
    sub rx711_off, $I10, 1
    substr rx711_tgt, rx711_tgt, rx711_off
  rx711_start:
.annotate "line", 361
  # rx literal  "Q:PIR"
    add $I11, rx711_pos, 5
    gt $I11, rx711_eos, rx711_fail
    sub $I11, rx711_pos, rx711_off
    substr $S10, rx711_tgt, $I11, 5
    ne $S10, "Q:PIR", rx711_fail
    add rx711_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx711_cur."!cursor_pos"(rx711_pos)
    $P10 = rx711_cur."ws"()
    unless $P10, rx711_fail
    rx711_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx711_cur."!cursor_pos"(rx711_pos)
    $P10 = rx711_cur."quote_EXPR"()
    unless $P10, rx711_fail
    rx711_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx711_pos = $P10."pos"()
  # rx pass
    rx711_cur."!cursor_pass"(rx711_pos, "quote:sym<Q:PIR>")
    rx711_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx711_pos)
    .return (rx711_cur)
  rx711_fail:
.annotate "line", 4
    (rx711_rep, rx711_pos, $I10, $P10) = rx711_cur."!mark_fail"(0)
    lt rx711_pos, -1, rx711_done
    eq rx711_pos, -1, rx711_fail
    jump $I10
  rx711_done:
    rx711_cur."!cursor_fail"()
    rx711_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx711_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("188_1258533478.31768") :method
.annotate "line", 4
    $P713 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P714, "ResizablePMCArray"
    push $P714, $P713
    .return ($P714)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("189_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx716_tgt
    .local int rx716_pos
    .local int rx716_off
    .local int rx716_eos
    .local int rx716_rep
    .local pmc rx716_cur
    (rx716_cur, rx716_pos, rx716_tgt, $I10) = self."!cursor_start"()
    rx716_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx716_cur
    .local pmc match
    .lex "$/", match
    length rx716_eos, rx716_tgt
    set rx716_off, 0
    lt $I10, 2, rx716_start
    sub rx716_off, $I10, 1
    substr rx716_tgt, rx716_tgt, rx716_off
  rx716_start:
.annotate "line", 363
  # rx enumcharlist negate=0 zerowidth
    ge rx716_pos, rx716_eos, rx716_fail
    sub $I10, rx716_pos, rx716_off
    substr $S10, rx716_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx716_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."quotemod_check"("s")
    unless $P10, rx716_fail
  # rx subrule "variable" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."variable"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx716_pos = $P10."pos"()
  # rx pass
    rx716_cur."!cursor_pass"(rx716_pos, "quote_escape:sym<$>")
    rx716_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx716_pos)
    .return (rx716_cur)
  rx716_fail:
.annotate "line", 4
    (rx716_rep, rx716_pos, $I10, $P10) = rx716_cur."!mark_fail"(0)
    lt rx716_pos, -1, rx716_done
    eq rx716_pos, -1, rx716_fail
    jump $I10
  rx716_done:
    rx716_cur."!cursor_fail"()
    rx716_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx716_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("190_1258533478.31768") :method
.annotate "line", 4
    new $P718, "ResizablePMCArray"
    push $P718, "$"
    .return ($P718)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("191_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    (rx720_cur, rx720_pos, rx720_tgt, $I10) = self."!cursor_start"()
    rx720_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx720_cur
    .local pmc match
    .lex "$/", match
    length rx720_eos, rx720_tgt
    set rx720_off, 0
    lt $I10, 2, rx720_start
    sub rx720_off, $I10, 1
    substr rx720_tgt, rx720_tgt, rx720_off
  rx720_start:
.annotate "line", 364
  # rx enumcharlist negate=0 zerowidth
    ge rx720_pos, rx720_eos, rx720_fail
    sub $I10, rx720_pos, rx720_off
    substr $S10, rx720_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx720_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."quotemod_check"("c")
    unless $P10, rx720_fail
  # rx subrule "block" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."block"()
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx720_pos = $P10."pos"()
  # rx pass
    rx720_cur."!cursor_pass"(rx720_pos, "quote_escape:sym<{ }>")
    rx720_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx720_pos)
    .return (rx720_cur)
  rx720_fail:
.annotate "line", 4
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    rx720_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("192_1258533478.31768") :method
.annotate "line", 4
    new $P722, "ResizablePMCArray"
    push $P722, "{"
    .return ($P722)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("193_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx724_tgt
    .local int rx724_pos
    .local int rx724_off
    .local int rx724_eos
    .local int rx724_rep
    .local pmc rx724_cur
    (rx724_cur, rx724_pos, rx724_tgt, $I10) = self."!cursor_start"()
    rx724_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx724_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx724_cur
    .local pmc match
    .lex "$/", match
    length rx724_eos, rx724_tgt
    set rx724_off, 0
    lt $I10, 2, rx724_start
    sub rx724_off, $I10, 1
    substr rx724_tgt, rx724_tgt, rx724_off
  rx724_start:
.annotate "line", 366
  # rx literal  "("
    add $I11, rx724_pos, 1
    gt $I11, rx724_eos, rx724_fail
    sub $I11, rx724_pos, rx724_off
    substr $S10, rx724_tgt, $I11, 1
    ne $S10, "(", rx724_fail
    add rx724_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx724_cur."!cursor_pos"(rx724_pos)
    $P10 = rx724_cur."ws"()
    unless $P10, rx724_fail
    rx724_pos = $P10."pos"()
  # rx rxquantr728 ** 0..1
    set_addr $I729, rxquantr728_done
    rx724_cur."!mark_push"(0, rx724_pos, $I729)
  rxquantr728_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx724_cur."!cursor_pos"(rx724_pos)
    $P10 = rx724_cur."EXPR"()
    unless $P10, rx724_fail
    rx724_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx724_pos = $P10."pos"()
    (rx724_rep) = rx724_cur."!mark_commit"($I729)
  rxquantr728_done:
  # rx literal  ")"
    add $I11, rx724_pos, 1
    gt $I11, rx724_eos, rx724_fail
    sub $I11, rx724_pos, rx724_off
    substr $S10, rx724_tgt, $I11, 1
    ne $S10, ")", rx724_fail
    add rx724_pos, 1
  # rx pass
    rx724_cur."!cursor_pass"(rx724_pos, "circumfix:sym<( )>")
    rx724_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx724_pos)
    .return (rx724_cur)
  rx724_fail:
.annotate "line", 4
    (rx724_rep, rx724_pos, $I10, $P10) = rx724_cur."!mark_fail"(0)
    lt rx724_pos, -1, rx724_done
    eq rx724_pos, -1, rx724_fail
    jump $I10
  rx724_done:
    rx724_cur."!cursor_fail"()
    rx724_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx724_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("194_1258533478.31768") :method
.annotate "line", 4
    $P726 = self."!PREFIX__!subrule"("", "(")
    new $P727, "ResizablePMCArray"
    push $P727, $P726
    .return ($P727)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("195_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx731_tgt
    .local int rx731_pos
    .local int rx731_off
    .local int rx731_eos
    .local int rx731_rep
    .local pmc rx731_cur
    (rx731_cur, rx731_pos, rx731_tgt, $I10) = self."!cursor_start"()
    rx731_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx731_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx731_cur
    .local pmc match
    .lex "$/", match
    length rx731_eos, rx731_tgt
    set rx731_off, 0
    lt $I10, 2, rx731_start
    sub rx731_off, $I10, 1
    substr rx731_tgt, rx731_tgt, rx731_off
  rx731_start:
.annotate "line", 367
  # rx literal  "["
    add $I11, rx731_pos, 1
    gt $I11, rx731_eos, rx731_fail
    sub $I11, rx731_pos, rx731_off
    substr $S10, rx731_tgt, $I11, 1
    ne $S10, "[", rx731_fail
    add rx731_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx731_cur."!cursor_pos"(rx731_pos)
    $P10 = rx731_cur."ws"()
    unless $P10, rx731_fail
    rx731_pos = $P10."pos"()
  # rx rxquantr735 ** 0..1
    set_addr $I736, rxquantr735_done
    rx731_cur."!mark_push"(0, rx731_pos, $I736)
  rxquantr735_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx731_cur."!cursor_pos"(rx731_pos)
    $P10 = rx731_cur."EXPR"()
    unless $P10, rx731_fail
    rx731_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx731_pos = $P10."pos"()
    (rx731_rep) = rx731_cur."!mark_commit"($I736)
  rxquantr735_done:
  # rx literal  "]"
    add $I11, rx731_pos, 1
    gt $I11, rx731_eos, rx731_fail
    sub $I11, rx731_pos, rx731_off
    substr $S10, rx731_tgt, $I11, 1
    ne $S10, "]", rx731_fail
    add rx731_pos, 1
  # rx pass
    rx731_cur."!cursor_pass"(rx731_pos, "circumfix:sym<[ ]>")
    rx731_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx731_pos)
    .return (rx731_cur)
  rx731_fail:
.annotate "line", 4
    (rx731_rep, rx731_pos, $I10, $P10) = rx731_cur."!mark_fail"(0)
    lt rx731_pos, -1, rx731_done
    eq rx731_pos, -1, rx731_fail
    jump $I10
  rx731_done:
    rx731_cur."!cursor_fail"()
    rx731_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx731_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("196_1258533478.31768") :method
.annotate "line", 4
    $P733 = self."!PREFIX__!subrule"("", "[")
    new $P734, "ResizablePMCArray"
    push $P734, $P733
    .return ($P734)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("197_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx738_tgt
    .local int rx738_pos
    .local int rx738_off
    .local int rx738_eos
    .local int rx738_rep
    .local pmc rx738_cur
    (rx738_cur, rx738_pos, rx738_tgt, $I10) = self."!cursor_start"()
    rx738_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx738_cur
    .local pmc match
    .lex "$/", match
    length rx738_eos, rx738_tgt
    set rx738_off, 0
    lt $I10, 2, rx738_start
    sub rx738_off, $I10, 1
    substr rx738_tgt, rx738_tgt, rx738_off
  rx738_start:
.annotate "line", 368
  # rx enumcharlist negate=0 zerowidth
    ge rx738_pos, rx738_eos, rx738_fail
    sub $I10, rx738_pos, rx738_off
    substr $S10, rx738_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx738_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx738_cur."!cursor_pos"(rx738_pos)
    $P10 = rx738_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx738_fail
    rx738_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx738_pos = $P10."pos"()
  # rx pass
    rx738_cur."!cursor_pass"(rx738_pos, "circumfix:sym<ang>")
    rx738_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx738_pos)
    .return (rx738_cur)
  rx738_fail:
.annotate "line", 4
    (rx738_rep, rx738_pos, $I10, $P10) = rx738_cur."!mark_fail"(0)
    lt rx738_pos, -1, rx738_done
    eq rx738_pos, -1, rx738_fail
    jump $I10
  rx738_done:
    rx738_cur."!cursor_fail"()
    rx738_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx738_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("198_1258533478.31768") :method
.annotate "line", 4
    new $P740, "ResizablePMCArray"
    push $P740, "<"
    .return ($P740)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("199_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx742_tgt
    .local int rx742_pos
    .local int rx742_off
    .local int rx742_eos
    .local int rx742_rep
    .local pmc rx742_cur
    (rx742_cur, rx742_pos, rx742_tgt, $I10) = self."!cursor_start"()
    rx742_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx742_cur
    .local pmc match
    .lex "$/", match
    length rx742_eos, rx742_tgt
    set rx742_off, 0
    lt $I10, 2, rx742_start
    sub rx742_off, $I10, 1
    substr rx742_tgt, rx742_tgt, rx742_off
  rx742_start:
.annotate "line", 369
  # rx enumcharlist negate=0 zerowidth
    ge rx742_pos, rx742_eos, rx742_fail
    sub $I10, rx742_pos, rx742_off
    substr $S10, rx742_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx742_fail
  # rx subrule "pblock" subtype=capture negate=
    rx742_cur."!cursor_pos"(rx742_pos)
    $P10 = rx742_cur."pblock"()
    unless $P10, rx742_fail
    rx742_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx742_pos = $P10."pos"()
  # rx pass
    rx742_cur."!cursor_pass"(rx742_pos, "circumfix:sym<{ }>")
    rx742_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx742_pos)
    .return (rx742_cur)
  rx742_fail:
.annotate "line", 4
    (rx742_rep, rx742_pos, $I10, $P10) = rx742_cur."!mark_fail"(0)
    lt rx742_pos, -1, rx742_done
    eq rx742_pos, -1, rx742_fail
    jump $I10
  rx742_done:
    rx742_cur."!cursor_fail"()
    rx742_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx742_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("200_1258533478.31768") :method
.annotate "line", 4
    new $P744, "ResizablePMCArray"
    push $P744, "{"
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("201_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx746_tgt
    .local int rx746_pos
    .local int rx746_off
    .local int rx746_eos
    .local int rx746_rep
    .local pmc rx746_cur
    (rx746_cur, rx746_pos, rx746_tgt, $I10) = self."!cursor_start"()
    rx746_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx746_cur
    .local pmc match
    .lex "$/", match
    length rx746_eos, rx746_tgt
    set rx746_off, 0
    lt $I10, 2, rx746_start
    sub rx746_off, $I10, 1
    substr rx746_tgt, rx746_tgt, rx746_off
  rx746_start:
.annotate "line", 370
  # rx subrule "sigil" subtype=capture negate=
    rx746_cur."!cursor_pos"(rx746_pos)
    $P10 = rx746_cur."sigil"()
    unless $P10, rx746_fail
    rx746_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx746_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx746_pos, 1
    gt $I11, rx746_eos, rx746_fail
    sub $I11, rx746_pos, rx746_off
    substr $S10, rx746_tgt, $I11, 1
    ne $S10, "(", rx746_fail
    add rx746_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx746_cur."!cursor_pos"(rx746_pos)
    $P10 = rx746_cur."semilist"()
    unless $P10, rx746_fail
    rx746_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx746_pos = $P10."pos"()
  alt750_0:
    set_addr $I10, alt750_1
    rx746_cur."!mark_push"(0, rx746_pos, $I10)
  # rx literal  ")"
    add $I11, rx746_pos, 1
    gt $I11, rx746_eos, rx746_fail
    sub $I11, rx746_pos, rx746_off
    substr $S10, rx746_tgt, $I11, 1
    ne $S10, ")", rx746_fail
    add rx746_pos, 1
    goto alt750_end
  alt750_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx746_cur."!cursor_pos"(rx746_pos)
    $P10 = rx746_cur."FAILGOAL"("')'")
    unless $P10, rx746_fail
    rx746_pos = $P10."pos"()
  alt750_end:
  # rx pass
    rx746_cur."!cursor_pass"(rx746_pos, "circumfix:sym<sigil>")
    rx746_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx746_pos)
    .return (rx746_cur)
  rx746_fail:
.annotate "line", 4
    (rx746_rep, rx746_pos, $I10, $P10) = rx746_cur."!mark_fail"(0)
    lt rx746_pos, -1, rx746_done
    eq rx746_pos, -1, rx746_fail
    jump $I10
  rx746_done:
    rx746_cur."!cursor_fail"()
    rx746_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx746_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("202_1258533478.31768") :method
.annotate "line", 4
    $P748 = self."!PREFIX__!subrule"("sigil", "")
    new $P749, "ResizablePMCArray"
    push $P749, $P748
    .return ($P749)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("203_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 4
    .local string rx753_tgt
    .local int rx753_pos
    .local int rx753_off
    .local int rx753_eos
    .local int rx753_rep
    .local pmc rx753_cur
    (rx753_cur, rx753_pos, rx753_tgt, $I10) = self."!cursor_start"()
    rx753_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx753_cur
    .local pmc match
    .lex "$/", match
    length rx753_eos, rx753_tgt
    set rx753_off, 0
    lt $I10, 2, rx753_start
    sub rx753_off, $I10, 1
    substr rx753_tgt, rx753_tgt, rx753_off
  rx753_start:
.annotate "line", 372
  # rx subrule "ws" subtype=method negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."ws"()
    unless $P10, rx753_fail
    rx753_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."statement"()
    unless $P10, rx753_fail
    rx753_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx753_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx753_cur."!cursor_pos"(rx753_pos)
    $P10 = rx753_cur."ws"()
    unless $P10, rx753_fail
    rx753_pos = $P10."pos"()
  # rx pass
    rx753_cur."!cursor_pass"(rx753_pos, "semilist")
    rx753_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx753_pos)
    .return (rx753_cur)
  rx753_fail:
.annotate "line", 4
    (rx753_rep, rx753_pos, $I10, $P10) = rx753_cur."!mark_fail"(0)
    lt rx753_pos, -1, rx753_done
    eq rx753_pos, -1, rx753_fail
    jump $I10
  rx753_done:
    rx753_cur."!cursor_fail"()
    rx753_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx753_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("204_1258533478.31768") :method
.annotate "line", 4
    new $P755, "ResizablePMCArray"
    push $P755, ""
    .return ($P755)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("205_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx759_tgt
    .local int rx759_pos
    .local int rx759_off
    .local int rx759_eos
    .local int rx759_rep
    .local pmc rx759_cur
    (rx759_cur, rx759_pos, rx759_tgt, $I10) = self."!cursor_start"()
    rx759_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx759_cur
    .local pmc match
    .lex "$/", match
    length rx759_eos, rx759_tgt
    set rx759_off, 0
    lt $I10, 2, rx759_start
    sub rx759_off, $I10, 1
    substr rx759_tgt, rx759_tgt, rx759_off
  rx759_start:
.annotate "line", 395
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx759_cur."!cursor_pos"(rx759_pos)
    $P10 = rx759_cur."infixstopper"()
    if $P10, rx759_fail
  # rx subrule "infix" subtype=capture negate=
    rx759_cur."!cursor_pos"(rx759_pos)
    $P10 = rx759_cur."infix"()
    unless $P10, rx759_fail
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx759_pos = $P10."pos"()
  # rx pass
    rx759_cur."!cursor_pass"(rx759_pos, "infixish")
    rx759_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx759_pos)
    .return (rx759_cur)
  rx759_fail:
.annotate "line", 376
    (rx759_rep, rx759_pos, $I10, $P10) = rx759_cur."!mark_fail"(0)
    lt rx759_pos, -1, rx759_done
    eq rx759_pos, -1, rx759_fail
    jump $I10
  rx759_done:
    rx759_cur."!cursor_fail"()
    rx759_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx759_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("206_1258533478.31768") :method
.annotate "line", 376
    new $P761, "ResizablePMCArray"
    push $P761, ""
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("207_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx763_tgt
    .local int rx763_pos
    .local int rx763_off
    .local int rx763_eos
    .local int rx763_rep
    .local pmc rx763_cur
    (rx763_cur, rx763_pos, rx763_tgt, $I10) = self."!cursor_start"()
    rx763_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx763_cur
    .local pmc match
    .lex "$/", match
    length rx763_eos, rx763_tgt
    set rx763_off, 0
    lt $I10, 2, rx763_start
    sub rx763_off, $I10, 1
    substr rx763_tgt, rx763_tgt, rx763_off
  rx763_start:
.annotate "line", 396
  # rx subrule "lambda" subtype=zerowidth negate=
    rx763_cur."!cursor_pos"(rx763_pos)
    $P10 = rx763_cur."lambda"()
    unless $P10, rx763_fail
  # rx pass
    rx763_cur."!cursor_pass"(rx763_pos, "infixstopper")
    rx763_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx763_pos)
    .return (rx763_cur)
  rx763_fail:
.annotate "line", 376
    (rx763_rep, rx763_pos, $I10, $P10) = rx763_cur."!mark_fail"(0)
    lt rx763_pos, -1, rx763_done
    eq rx763_pos, -1, rx763_fail
    jump $I10
  rx763_done:
    rx763_cur."!cursor_fail"()
    rx763_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx763_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("208_1258533478.31768") :method
.annotate "line", 376
    new $P765, "ResizablePMCArray"
    push $P765, ""
    .return ($P765)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("209_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx767_tgt
    .local int rx767_pos
    .local int rx767_off
    .local int rx767_eos
    .local int rx767_rep
    .local pmc rx767_cur
    (rx767_cur, rx767_pos, rx767_tgt, $I10) = self."!cursor_start"()
    rx767_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx767_cur
    .local pmc match
    .lex "$/", match
    length rx767_eos, rx767_tgt
    set rx767_off, 0
    lt $I10, 2, rx767_start
    sub rx767_off, $I10, 1
    substr rx767_tgt, rx767_tgt, rx767_off
  rx767_start:
.annotate "line", 399
  # rx literal  "["
    add $I11, rx767_pos, 1
    gt $I11, rx767_eos, rx767_fail
    sub $I11, rx767_pos, rx767_off
    substr $S10, rx767_tgt, $I11, 1
    ne $S10, "[", rx767_fail
    add rx767_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx767_cur."!cursor_pos"(rx767_pos)
    $P10 = rx767_cur."ws"()
    unless $P10, rx767_fail
    rx767_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx767_cur."!cursor_pos"(rx767_pos)
    $P10 = rx767_cur."EXPR"()
    unless $P10, rx767_fail
    rx767_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx767_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx767_pos, 1
    gt $I11, rx767_eos, rx767_fail
    sub $I11, rx767_pos, rx767_off
    substr $S10, rx767_tgt, $I11, 1
    ne $S10, "]", rx767_fail
    add rx767_pos, 1
.annotate "line", 400
  # rx subrule "O" subtype=capture negate=
    rx767_cur."!cursor_pos"(rx767_pos)
    $P10 = rx767_cur."O"("%methodop")
    unless $P10, rx767_fail
    rx767_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx767_pos = $P10."pos"()
.annotate "line", 398
  # rx pass
    rx767_cur."!cursor_pass"(rx767_pos, "postcircumfix:sym<[ ]>")
    rx767_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx767_pos)
    .return (rx767_cur)
  rx767_fail:
.annotate "line", 376
    (rx767_rep, rx767_pos, $I10, $P10) = rx767_cur."!mark_fail"(0)
    lt rx767_pos, -1, rx767_done
    eq rx767_pos, -1, rx767_fail
    jump $I10
  rx767_done:
    rx767_cur."!cursor_fail"()
    rx767_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx767_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("210_1258533478.31768") :method
.annotate "line", 376
    $P769 = self."!PREFIX__!subrule"("", "[")
    new $P770, "ResizablePMCArray"
    push $P770, $P769
    .return ($P770)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("211_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx772_tgt
    .local int rx772_pos
    .local int rx772_off
    .local int rx772_eos
    .local int rx772_rep
    .local pmc rx772_cur
    (rx772_cur, rx772_pos, rx772_tgt, $I10) = self."!cursor_start"()
    rx772_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx772_cur
    .local pmc match
    .lex "$/", match
    length rx772_eos, rx772_tgt
    set rx772_off, 0
    lt $I10, 2, rx772_start
    sub rx772_off, $I10, 1
    substr rx772_tgt, rx772_tgt, rx772_off
  rx772_start:
.annotate "line", 404
  # rx literal  "{"
    add $I11, rx772_pos, 1
    gt $I11, rx772_eos, rx772_fail
    sub $I11, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I11, 1
    ne $S10, "{", rx772_fail
    add rx772_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."ws"()
    unless $P10, rx772_fail
    rx772_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."EXPR"()
    unless $P10, rx772_fail
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx772_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx772_pos, 1
    gt $I11, rx772_eos, rx772_fail
    sub $I11, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I11, 1
    ne $S10, "}", rx772_fail
    add rx772_pos, 1
.annotate "line", 405
  # rx subrule "O" subtype=capture negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."O"("%methodop")
    unless $P10, rx772_fail
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx772_pos = $P10."pos"()
.annotate "line", 403
  # rx pass
    rx772_cur."!cursor_pass"(rx772_pos, "postcircumfix:sym<{ }>")
    rx772_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx772_pos)
    .return (rx772_cur)
  rx772_fail:
.annotate "line", 376
    (rx772_rep, rx772_pos, $I10, $P10) = rx772_cur."!mark_fail"(0)
    lt rx772_pos, -1, rx772_done
    eq rx772_pos, -1, rx772_fail
    jump $I10
  rx772_done:
    rx772_cur."!cursor_fail"()
    rx772_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx772_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("212_1258533478.31768") :method
.annotate "line", 376
    $P774 = self."!PREFIX__!subrule"("", "{")
    new $P775, "ResizablePMCArray"
    push $P775, $P774
    .return ($P775)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("213_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt, $I10) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx777_cur
    .local pmc match
    .lex "$/", match
    length rx777_eos, rx777_tgt
    set rx777_off, 0
    lt $I10, 2, rx777_start
    sub rx777_off, $I10, 1
    substr rx777_tgt, rx777_tgt, rx777_off
  rx777_start:
.annotate "line", 409
  # rx enumcharlist negate=0 zerowidth
    ge rx777_pos, rx777_eos, rx777_fail
    sub $I10, rx777_pos, rx777_off
    substr $S10, rx777_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx777_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."quote_EXPR"(":q")
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx777_pos = $P10."pos"()
.annotate "line", 410
  # rx subrule "O" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."O"("%methodop")
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx777_pos = $P10."pos"()
.annotate "line", 408
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "postcircumfix:sym<ang>")
    rx777_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 376
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("214_1258533478.31768") :method
.annotate "line", 376
    new $P779, "ResizablePMCArray"
    push $P779, "<"
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("215_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx781_tgt
    .local int rx781_pos
    .local int rx781_off
    .local int rx781_eos
    .local int rx781_rep
    .local pmc rx781_cur
    (rx781_cur, rx781_pos, rx781_tgt, $I10) = self."!cursor_start"()
    rx781_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx781_cur
    .local pmc match
    .lex "$/", match
    length rx781_eos, rx781_tgt
    set rx781_off, 0
    lt $I10, 2, rx781_start
    sub rx781_off, $I10, 1
    substr rx781_tgt, rx781_tgt, rx781_off
  rx781_start:
.annotate "line", 414
  # rx literal  "("
    add $I11, rx781_pos, 1
    gt $I11, rx781_eos, rx781_fail
    sub $I11, rx781_pos, rx781_off
    substr $S10, rx781_tgt, $I11, 1
    ne $S10, "(", rx781_fail
    add rx781_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx781_cur."!cursor_pos"(rx781_pos)
    $P10 = rx781_cur."ws"()
    unless $P10, rx781_fail
    rx781_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx781_cur."!cursor_pos"(rx781_pos)
    $P10 = rx781_cur."arglist"()
    unless $P10, rx781_fail
    rx781_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx781_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx781_pos, 1
    gt $I11, rx781_eos, rx781_fail
    sub $I11, rx781_pos, rx781_off
    substr $S10, rx781_tgt, $I11, 1
    ne $S10, ")", rx781_fail
    add rx781_pos, 1
.annotate "line", 415
  # rx subrule "O" subtype=capture negate=
    rx781_cur."!cursor_pos"(rx781_pos)
    $P10 = rx781_cur."O"("%methodop")
    unless $P10, rx781_fail
    rx781_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx781_pos = $P10."pos"()
.annotate "line", 413
  # rx pass
    rx781_cur."!cursor_pass"(rx781_pos, "postcircumfix:sym<( )>")
    rx781_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx781_pos)
    .return (rx781_cur)
  rx781_fail:
.annotate "line", 376
    (rx781_rep, rx781_pos, $I10, $P10) = rx781_cur."!mark_fail"(0)
    lt rx781_pos, -1, rx781_done
    eq rx781_pos, -1, rx781_fail
    jump $I10
  rx781_done:
    rx781_cur."!cursor_fail"()
    rx781_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx781_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("216_1258533478.31768") :method
.annotate "line", 376
    $P783 = self."!PREFIX__!subrule"("", "(")
    new $P784, "ResizablePMCArray"
    push $P784, $P783
    .return ($P784)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("217_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx786_tgt
    .local int rx786_pos
    .local int rx786_off
    .local int rx786_eos
    .local int rx786_rep
    .local pmc rx786_cur
    (rx786_cur, rx786_pos, rx786_tgt, $I10) = self."!cursor_start"()
    rx786_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx786_cur
    .local pmc match
    .lex "$/", match
    length rx786_eos, rx786_tgt
    set rx786_off, 0
    lt $I10, 2, rx786_start
    sub rx786_off, $I10, 1
    substr rx786_tgt, rx786_tgt, rx786_off
  rx786_start:
.annotate "line", 418
  # rx subrule "dotty" subtype=capture negate=
    rx786_cur."!cursor_pos"(rx786_pos)
    $P10 = rx786_cur."dotty"()
    unless $P10, rx786_fail
    rx786_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx786_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx786_cur."!cursor_pos"(rx786_pos)
    $P10 = rx786_cur."O"("%methodop")
    unless $P10, rx786_fail
    rx786_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx786_pos = $P10."pos"()
  # rx pass
    rx786_cur."!cursor_pass"(rx786_pos, "postfix:sym<.>")
    rx786_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx786_pos)
    .return (rx786_cur)
  rx786_fail:
.annotate "line", 376
    (rx786_rep, rx786_pos, $I10, $P10) = rx786_cur."!mark_fail"(0)
    lt rx786_pos, -1, rx786_done
    eq rx786_pos, -1, rx786_fail
    jump $I10
  rx786_done:
    rx786_cur."!cursor_fail"()
    rx786_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx786_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("218_1258533478.31768") :method
.annotate "line", 376
    $P788 = self."!PREFIX__!subrule"("dotty", "")
    new $P789, "ResizablePMCArray"
    push $P789, $P788
    .return ($P789)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("219_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt, $I10) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx791_cur
    .local pmc match
    .lex "$/", match
    length rx791_eos, rx791_tgt
    set rx791_off, 0
    lt $I10, 2, rx791_start
    sub rx791_off, $I10, 1
    substr rx791_tgt, rx791_tgt, rx791_off
  rx791_start:
.annotate "line", 420
  # rx subcapture "sym"
    set_addr $I10, rxcap_795_fail
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  # rx literal  "++"
    add $I11, rx791_pos, 2
    gt $I11, rx791_eos, rx791_fail
    sub $I11, rx791_pos, rx791_off
    substr $S10, rx791_tgt, $I11, 2
    ne $S10, "++", rx791_fail
    add rx791_pos, 2
    set_addr $I10, rxcap_795_fail
    ($I12, $I11) = rx791_cur."!mark_peek"($I10)
    rx791_cur."!cursor_pos"($I11)
    ($P10) = rx791_cur."!cursor_start"()
    $P10."!cursor_pass"(rx791_pos, "")
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_795_done
  rxcap_795_fail:
    goto rx791_fail
  rxcap_795_done:
  # rx subrule "O" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx791_pos = $P10."pos"()
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "prefix:sym<++>")
    rx791_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 376
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("220_1258533478.31768") :method
.annotate "line", 376
    $P793 = self."!PREFIX__!subrule"("O", "++")
    new $P794, "ResizablePMCArray"
    push $P794, $P793
    .return ($P794)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("221_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx797_tgt
    .local int rx797_pos
    .local int rx797_off
    .local int rx797_eos
    .local int rx797_rep
    .local pmc rx797_cur
    (rx797_cur, rx797_pos, rx797_tgt, $I10) = self."!cursor_start"()
    rx797_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx797_cur
    .local pmc match
    .lex "$/", match
    length rx797_eos, rx797_tgt
    set rx797_off, 0
    lt $I10, 2, rx797_start
    sub rx797_off, $I10, 1
    substr rx797_tgt, rx797_tgt, rx797_off
  rx797_start:
.annotate "line", 421
  # rx subcapture "sym"
    set_addr $I10, rxcap_801_fail
    rx797_cur."!mark_push"(0, rx797_pos, $I10)
  # rx literal  "--"
    add $I11, rx797_pos, 2
    gt $I11, rx797_eos, rx797_fail
    sub $I11, rx797_pos, rx797_off
    substr $S10, rx797_tgt, $I11, 2
    ne $S10, "--", rx797_fail
    add rx797_pos, 2
    set_addr $I10, rxcap_801_fail
    ($I12, $I11) = rx797_cur."!mark_peek"($I10)
    rx797_cur."!cursor_pos"($I11)
    ($P10) = rx797_cur."!cursor_start"()
    $P10."!cursor_pass"(rx797_pos, "")
    rx797_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_801_done
  rxcap_801_fail:
    goto rx797_fail
  rxcap_801_done:
  # rx subrule "O" subtype=capture negate=
    rx797_cur."!cursor_pos"(rx797_pos)
    $P10 = rx797_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx797_fail
    rx797_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx797_pos = $P10."pos"()
  # rx pass
    rx797_cur."!cursor_pass"(rx797_pos, "prefix:sym<-->")
    rx797_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx797_pos)
    .return (rx797_cur)
  rx797_fail:
.annotate "line", 376
    (rx797_rep, rx797_pos, $I10, $P10) = rx797_cur."!mark_fail"(0)
    lt rx797_pos, -1, rx797_done
    eq rx797_pos, -1, rx797_fail
    jump $I10
  rx797_done:
    rx797_cur."!cursor_fail"()
    rx797_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx797_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("222_1258533478.31768") :method
.annotate "line", 376
    $P799 = self."!PREFIX__!subrule"("O", "--")
    new $P800, "ResizablePMCArray"
    push $P800, $P799
    .return ($P800)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("223_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx803_tgt
    .local int rx803_pos
    .local int rx803_off
    .local int rx803_eos
    .local int rx803_rep
    .local pmc rx803_cur
    (rx803_cur, rx803_pos, rx803_tgt, $I10) = self."!cursor_start"()
    rx803_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx803_cur
    .local pmc match
    .lex "$/", match
    length rx803_eos, rx803_tgt
    set rx803_off, 0
    lt $I10, 2, rx803_start
    sub rx803_off, $I10, 1
    substr rx803_tgt, rx803_tgt, rx803_off
  rx803_start:
.annotate "line", 424
  # rx subcapture "sym"
    set_addr $I10, rxcap_807_fail
    rx803_cur."!mark_push"(0, rx803_pos, $I10)
  # rx literal  "++"
    add $I11, rx803_pos, 2
    gt $I11, rx803_eos, rx803_fail
    sub $I11, rx803_pos, rx803_off
    substr $S10, rx803_tgt, $I11, 2
    ne $S10, "++", rx803_fail
    add rx803_pos, 2
    set_addr $I10, rxcap_807_fail
    ($I12, $I11) = rx803_cur."!mark_peek"($I10)
    rx803_cur."!cursor_pos"($I11)
    ($P10) = rx803_cur."!cursor_start"()
    $P10."!cursor_pass"(rx803_pos, "")
    rx803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_807_done
  rxcap_807_fail:
    goto rx803_fail
  rxcap_807_done:
  # rx subrule "O" subtype=capture negate=
    rx803_cur."!cursor_pos"(rx803_pos)
    $P10 = rx803_cur."O"("%autoincrement")
    unless $P10, rx803_fail
    rx803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx803_pos = $P10."pos"()
  # rx pass
    rx803_cur."!cursor_pass"(rx803_pos, "postfix:sym<++>")
    rx803_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx803_pos)
    .return (rx803_cur)
  rx803_fail:
.annotate "line", 376
    (rx803_rep, rx803_pos, $I10, $P10) = rx803_cur."!mark_fail"(0)
    lt rx803_pos, -1, rx803_done
    eq rx803_pos, -1, rx803_fail
    jump $I10
  rx803_done:
    rx803_cur."!cursor_fail"()
    rx803_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx803_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("224_1258533478.31768") :method
.annotate "line", 376
    $P805 = self."!PREFIX__!subrule"("O", "++")
    new $P806, "ResizablePMCArray"
    push $P806, $P805
    .return ($P806)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("225_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt, $I10) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx809_cur
    .local pmc match
    .lex "$/", match
    length rx809_eos, rx809_tgt
    set rx809_off, 0
    lt $I10, 2, rx809_start
    sub rx809_off, $I10, 1
    substr rx809_tgt, rx809_tgt, rx809_off
  rx809_start:
.annotate "line", 425
  # rx subcapture "sym"
    set_addr $I10, rxcap_813_fail
    rx809_cur."!mark_push"(0, rx809_pos, $I10)
  # rx literal  "--"
    add $I11, rx809_pos, 2
    gt $I11, rx809_eos, rx809_fail
    sub $I11, rx809_pos, rx809_off
    substr $S10, rx809_tgt, $I11, 2
    ne $S10, "--", rx809_fail
    add rx809_pos, 2
    set_addr $I10, rxcap_813_fail
    ($I12, $I11) = rx809_cur."!mark_peek"($I10)
    rx809_cur."!cursor_pos"($I11)
    ($P10) = rx809_cur."!cursor_start"()
    $P10."!cursor_pass"(rx809_pos, "")
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_813_done
  rxcap_813_fail:
    goto rx809_fail
  rxcap_813_done:
  # rx subrule "O" subtype=capture negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."O"("%autoincrement")
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "postfix:sym<-->")
    rx809_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate "line", 376
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("226_1258533478.31768") :method
.annotate "line", 376
    $P811 = self."!PREFIX__!subrule"("O", "--")
    new $P812, "ResizablePMCArray"
    push $P812, $P811
    .return ($P812)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("227_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx815_tgt
    .local int rx815_pos
    .local int rx815_off
    .local int rx815_eos
    .local int rx815_rep
    .local pmc rx815_cur
    (rx815_cur, rx815_pos, rx815_tgt, $I10) = self."!cursor_start"()
    rx815_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx815_cur
    .local pmc match
    .lex "$/", match
    length rx815_eos, rx815_tgt
    set rx815_off, 0
    lt $I10, 2, rx815_start
    sub rx815_off, $I10, 1
    substr rx815_tgt, rx815_tgt, rx815_off
  rx815_start:
.annotate "line", 427
  # rx subcapture "sym"
    set_addr $I10, rxcap_819_fail
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  # rx literal  "**"
    add $I11, rx815_pos, 2
    gt $I11, rx815_eos, rx815_fail
    sub $I11, rx815_pos, rx815_off
    substr $S10, rx815_tgt, $I11, 2
    ne $S10, "**", rx815_fail
    add rx815_pos, 2
    set_addr $I10, rxcap_819_fail
    ($I12, $I11) = rx815_cur."!mark_peek"($I10)
    rx815_cur."!cursor_pos"($I11)
    ($P10) = rx815_cur."!cursor_start"()
    $P10."!cursor_pass"(rx815_pos, "")
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_819_done
  rxcap_819_fail:
    goto rx815_fail
  rxcap_819_done:
  # rx subrule "O" subtype=capture negate=
    rx815_cur."!cursor_pos"(rx815_pos)
    $P10 = rx815_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx815_pos = $P10."pos"()
  # rx pass
    rx815_cur."!cursor_pass"(rx815_pos, "infix:sym<**>")
    rx815_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx815_pos)
    .return (rx815_cur)
  rx815_fail:
.annotate "line", 376
    (rx815_rep, rx815_pos, $I10, $P10) = rx815_cur."!mark_fail"(0)
    lt rx815_pos, -1, rx815_done
    eq rx815_pos, -1, rx815_fail
    jump $I10
  rx815_done:
    rx815_cur."!cursor_fail"()
    rx815_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx815_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("228_1258533478.31768") :method
.annotate "line", 376
    $P817 = self."!PREFIX__!subrule"("O", "**")
    new $P818, "ResizablePMCArray"
    push $P818, $P817
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("229_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx821_tgt
    .local int rx821_pos
    .local int rx821_off
    .local int rx821_eos
    .local int rx821_rep
    .local pmc rx821_cur
    (rx821_cur, rx821_pos, rx821_tgt, $I10) = self."!cursor_start"()
    rx821_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx821_cur
    .local pmc match
    .lex "$/", match
    length rx821_eos, rx821_tgt
    set rx821_off, 0
    lt $I10, 2, rx821_start
    sub rx821_off, $I10, 1
    substr rx821_tgt, rx821_tgt, rx821_off
  rx821_start:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_825_fail
    rx821_cur."!mark_push"(0, rx821_pos, $I10)
  # rx literal  "+"
    add $I11, rx821_pos, 1
    gt $I11, rx821_eos, rx821_fail
    sub $I11, rx821_pos, rx821_off
    substr $S10, rx821_tgt, $I11, 1
    ne $S10, "+", rx821_fail
    add rx821_pos, 1
    set_addr $I10, rxcap_825_fail
    ($I12, $I11) = rx821_cur."!mark_peek"($I10)
    rx821_cur."!cursor_pos"($I11)
    ($P10) = rx821_cur."!cursor_start"()
    $P10."!cursor_pass"(rx821_pos, "")
    rx821_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_825_done
  rxcap_825_fail:
    goto rx821_fail
  rxcap_825_done:
  # rx subrule "O" subtype=capture negate=
    rx821_cur."!cursor_pos"(rx821_pos)
    $P10 = rx821_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx821_fail
    rx821_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx821_pos = $P10."pos"()
  # rx pass
    rx821_cur."!cursor_pass"(rx821_pos, "prefix:sym<+>")
    rx821_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx821_pos)
    .return (rx821_cur)
  rx821_fail:
.annotate "line", 376
    (rx821_rep, rx821_pos, $I10, $P10) = rx821_cur."!mark_fail"(0)
    lt rx821_pos, -1, rx821_done
    eq rx821_pos, -1, rx821_fail
    jump $I10
  rx821_done:
    rx821_cur."!cursor_fail"()
    rx821_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx821_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("230_1258533478.31768") :method
.annotate "line", 376
    $P823 = self."!PREFIX__!subrule"("O", "+")
    new $P824, "ResizablePMCArray"
    push $P824, $P823
    .return ($P824)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("231_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx827_tgt
    .local int rx827_pos
    .local int rx827_off
    .local int rx827_eos
    .local int rx827_rep
    .local pmc rx827_cur
    (rx827_cur, rx827_pos, rx827_tgt, $I10) = self."!cursor_start"()
    rx827_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx827_cur
    .local pmc match
    .lex "$/", match
    length rx827_eos, rx827_tgt
    set rx827_off, 0
    lt $I10, 2, rx827_start
    sub rx827_off, $I10, 1
    substr rx827_tgt, rx827_tgt, rx827_off
  rx827_start:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_831_fail
    rx827_cur."!mark_push"(0, rx827_pos, $I10)
  # rx literal  "~"
    add $I11, rx827_pos, 1
    gt $I11, rx827_eos, rx827_fail
    sub $I11, rx827_pos, rx827_off
    substr $S10, rx827_tgt, $I11, 1
    ne $S10, "~", rx827_fail
    add rx827_pos, 1
    set_addr $I10, rxcap_831_fail
    ($I12, $I11) = rx827_cur."!mark_peek"($I10)
    rx827_cur."!cursor_pos"($I11)
    ($P10) = rx827_cur."!cursor_start"()
    $P10."!cursor_pass"(rx827_pos, "")
    rx827_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_831_done
  rxcap_831_fail:
    goto rx827_fail
  rxcap_831_done:
  # rx subrule "O" subtype=capture negate=
    rx827_cur."!cursor_pos"(rx827_pos)
    $P10 = rx827_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx827_fail
    rx827_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx827_pos = $P10."pos"()
  # rx pass
    rx827_cur."!cursor_pass"(rx827_pos, "prefix:sym<~>")
    rx827_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx827_pos)
    .return (rx827_cur)
  rx827_fail:
.annotate "line", 376
    (rx827_rep, rx827_pos, $I10, $P10) = rx827_cur."!mark_fail"(0)
    lt rx827_pos, -1, rx827_done
    eq rx827_pos, -1, rx827_fail
    jump $I10
  rx827_done:
    rx827_cur."!cursor_fail"()
    rx827_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx827_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("232_1258533478.31768") :method
.annotate "line", 376
    $P829 = self."!PREFIX__!subrule"("O", "~")
    new $P830, "ResizablePMCArray"
    push $P830, $P829
    .return ($P830)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("233_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx833_tgt
    .local int rx833_pos
    .local int rx833_off
    .local int rx833_eos
    .local int rx833_rep
    .local pmc rx833_cur
    (rx833_cur, rx833_pos, rx833_tgt, $I10) = self."!cursor_start"()
    rx833_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx833_cur
    .local pmc match
    .lex "$/", match
    length rx833_eos, rx833_tgt
    set rx833_off, 0
    lt $I10, 2, rx833_start
    sub rx833_off, $I10, 1
    substr rx833_tgt, rx833_tgt, rx833_off
  rx833_start:
.annotate "line", 431
  # rx subcapture "sym"
    set_addr $I10, rxcap_837_fail
    rx833_cur."!mark_push"(0, rx833_pos, $I10)
  # rx literal  "-"
    add $I11, rx833_pos, 1
    gt $I11, rx833_eos, rx833_fail
    sub $I11, rx833_pos, rx833_off
    substr $S10, rx833_tgt, $I11, 1
    ne $S10, "-", rx833_fail
    add rx833_pos, 1
    set_addr $I10, rxcap_837_fail
    ($I12, $I11) = rx833_cur."!mark_peek"($I10)
    rx833_cur."!cursor_pos"($I11)
    ($P10) = rx833_cur."!cursor_start"()
    $P10."!cursor_pass"(rx833_pos, "")
    rx833_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_837_done
  rxcap_837_fail:
    goto rx833_fail
  rxcap_837_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx833_pos, rx833_eos, rx833_fail
    sub $I10, rx833_pos, rx833_off
    substr $S10, rx833_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx833_fail
  # rx subrule "O" subtype=capture negate=
    rx833_cur."!cursor_pos"(rx833_pos)
    $P10 = rx833_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx833_fail
    rx833_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx833_pos = $P10."pos"()
  # rx pass
    rx833_cur."!cursor_pass"(rx833_pos, "prefix:sym<->")
    rx833_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx833_pos)
    .return (rx833_cur)
  rx833_fail:
.annotate "line", 376
    (rx833_rep, rx833_pos, $I10, $P10) = rx833_cur."!mark_fail"(0)
    lt rx833_pos, -1, rx833_done
    eq rx833_pos, -1, rx833_fail
    jump $I10
  rx833_done:
    rx833_cur."!cursor_fail"()
    rx833_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx833_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("234_1258533478.31768") :method
.annotate "line", 376
    $P835 = self."!PREFIX__!subrule"("O", "-")
    new $P836, "ResizablePMCArray"
    push $P836, $P835
    .return ($P836)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("235_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx839_tgt
    .local int rx839_pos
    .local int rx839_off
    .local int rx839_eos
    .local int rx839_rep
    .local pmc rx839_cur
    (rx839_cur, rx839_pos, rx839_tgt, $I10) = self."!cursor_start"()
    rx839_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx839_cur
    .local pmc match
    .lex "$/", match
    length rx839_eos, rx839_tgt
    set rx839_off, 0
    lt $I10, 2, rx839_start
    sub rx839_off, $I10, 1
    substr rx839_tgt, rx839_tgt, rx839_off
  rx839_start:
.annotate "line", 432
  # rx subcapture "sym"
    set_addr $I10, rxcap_843_fail
    rx839_cur."!mark_push"(0, rx839_pos, $I10)
  # rx literal  "?"
    add $I11, rx839_pos, 1
    gt $I11, rx839_eos, rx839_fail
    sub $I11, rx839_pos, rx839_off
    substr $S10, rx839_tgt, $I11, 1
    ne $S10, "?", rx839_fail
    add rx839_pos, 1
    set_addr $I10, rxcap_843_fail
    ($I12, $I11) = rx839_cur."!mark_peek"($I10)
    rx839_cur."!cursor_pos"($I11)
    ($P10) = rx839_cur."!cursor_start"()
    $P10."!cursor_pass"(rx839_pos, "")
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_843_done
  rxcap_843_fail:
    goto rx839_fail
  rxcap_843_done:
  # rx subrule "O" subtype=capture negate=
    rx839_cur."!cursor_pos"(rx839_pos)
    $P10 = rx839_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx839_fail
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx839_pos = $P10."pos"()
  # rx pass
    rx839_cur."!cursor_pass"(rx839_pos, "prefix:sym<?>")
    rx839_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx839_pos)
    .return (rx839_cur)
  rx839_fail:
.annotate "line", 376
    (rx839_rep, rx839_pos, $I10, $P10) = rx839_cur."!mark_fail"(0)
    lt rx839_pos, -1, rx839_done
    eq rx839_pos, -1, rx839_fail
    jump $I10
  rx839_done:
    rx839_cur."!cursor_fail"()
    rx839_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx839_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("236_1258533478.31768") :method
.annotate "line", 376
    $P841 = self."!PREFIX__!subrule"("O", "?")
    new $P842, "ResizablePMCArray"
    push $P842, $P841
    .return ($P842)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("237_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    (rx845_cur, rx845_pos, rx845_tgt, $I10) = self."!cursor_start"()
    rx845_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx845_cur
    .local pmc match
    .lex "$/", match
    length rx845_eos, rx845_tgt
    set rx845_off, 0
    lt $I10, 2, rx845_start
    sub rx845_off, $I10, 1
    substr rx845_tgt, rx845_tgt, rx845_off
  rx845_start:
.annotate "line", 433
  # rx subcapture "sym"
    set_addr $I10, rxcap_849_fail
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  # rx literal  "!"
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, "!", rx845_fail
    add rx845_pos, 1
    set_addr $I10, rxcap_849_fail
    ($I12, $I11) = rx845_cur."!mark_peek"($I10)
    rx845_cur."!cursor_pos"($I11)
    ($P10) = rx845_cur."!cursor_start"()
    $P10."!cursor_pass"(rx845_pos, "")
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_849_done
  rxcap_849_fail:
    goto rx845_fail
  rxcap_849_done:
  # rx subrule "O" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx845_pos = $P10."pos"()
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "prefix:sym<!>")
    rx845_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx845_pos)
    .return (rx845_cur)
  rx845_fail:
.annotate "line", 376
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    rx845_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("238_1258533478.31768") :method
.annotate "line", 376
    $P847 = self."!PREFIX__!subrule"("O", "!")
    new $P848, "ResizablePMCArray"
    push $P848, $P847
    .return ($P848)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("239_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt, $I10) = self."!cursor_start"()
    rx851_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx851_cur
    .local pmc match
    .lex "$/", match
    length rx851_eos, rx851_tgt
    set rx851_off, 0
    lt $I10, 2, rx851_start
    sub rx851_off, $I10, 1
    substr rx851_tgt, rx851_tgt, rx851_off
  rx851_start:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_855_fail
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  # rx literal  "|"
    add $I11, rx851_pos, 1
    gt $I11, rx851_eos, rx851_fail
    sub $I11, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I11, 1
    ne $S10, "|", rx851_fail
    add rx851_pos, 1
    set_addr $I10, rxcap_855_fail
    ($I12, $I11) = rx851_cur."!mark_peek"($I10)
    rx851_cur."!cursor_pos"($I11)
    ($P10) = rx851_cur."!cursor_start"()
    $P10."!cursor_pass"(rx851_pos, "")
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_855_done
  rxcap_855_fail:
    goto rx851_fail
  rxcap_855_done:
  # rx subrule "O" subtype=capture negate=
    rx851_cur."!cursor_pos"(rx851_pos)
    $P10 = rx851_cur."O"("%symbolic_unary")
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx851_pos = $P10."pos"()
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "prefix:sym<|>")
    rx851_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_fail:
.annotate "line", 376
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("240_1258533478.31768") :method
.annotate "line", 376
    $P853 = self."!PREFIX__!subrule"("O", "|")
    new $P854, "ResizablePMCArray"
    push $P854, $P853
    .return ($P854)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("241_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt, $I10) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx857_cur
    .local pmc match
    .lex "$/", match
    length rx857_eos, rx857_tgt
    set rx857_off, 0
    lt $I10, 2, rx857_start
    sub rx857_off, $I10, 1
    substr rx857_tgt, rx857_tgt, rx857_off
  rx857_start:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_861_fail
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  # rx literal  "*"
    add $I11, rx857_pos, 1
    gt $I11, rx857_eos, rx857_fail
    sub $I11, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I11, 1
    ne $S10, "*", rx857_fail
    add rx857_pos, 1
    set_addr $I10, rxcap_861_fail
    ($I12, $I11) = rx857_cur."!mark_peek"($I10)
    rx857_cur."!cursor_pos"($I11)
    ($P10) = rx857_cur."!cursor_start"()
    $P10."!cursor_pass"(rx857_pos, "")
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_861_done
  rxcap_861_fail:
    goto rx857_fail
  rxcap_861_done:
  # rx subrule "O" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx857_pos = $P10."pos"()
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "infix:sym<*>")
    rx857_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate "line", 376
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("242_1258533478.31768") :method
.annotate "line", 376
    $P859 = self."!PREFIX__!subrule"("O", "*")
    new $P860, "ResizablePMCArray"
    push $P860, $P859
    .return ($P860)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("243_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx863_tgt
    .local int rx863_pos
    .local int rx863_off
    .local int rx863_eos
    .local int rx863_rep
    .local pmc rx863_cur
    (rx863_cur, rx863_pos, rx863_tgt, $I10) = self."!cursor_start"()
    rx863_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx863_cur
    .local pmc match
    .lex "$/", match
    length rx863_eos, rx863_tgt
    set rx863_off, 0
    lt $I10, 2, rx863_start
    sub rx863_off, $I10, 1
    substr rx863_tgt, rx863_tgt, rx863_off
  rx863_start:
.annotate "line", 437
  # rx subcapture "sym"
    set_addr $I10, rxcap_867_fail
    rx863_cur."!mark_push"(0, rx863_pos, $I10)
  # rx literal  "/"
    add $I11, rx863_pos, 1
    gt $I11, rx863_eos, rx863_fail
    sub $I11, rx863_pos, rx863_off
    substr $S10, rx863_tgt, $I11, 1
    ne $S10, "/", rx863_fail
    add rx863_pos, 1
    set_addr $I10, rxcap_867_fail
    ($I12, $I11) = rx863_cur."!mark_peek"($I10)
    rx863_cur."!cursor_pos"($I11)
    ($P10) = rx863_cur."!cursor_start"()
    $P10."!cursor_pass"(rx863_pos, "")
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_867_done
  rxcap_867_fail:
    goto rx863_fail
  rxcap_867_done:
  # rx subrule "O" subtype=capture negate=
    rx863_cur."!cursor_pos"(rx863_pos)
    $P10 = rx863_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx863_fail
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx863_pos = $P10."pos"()
  # rx pass
    rx863_cur."!cursor_pass"(rx863_pos, "infix:sym</>")
    rx863_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx863_pos)
    .return (rx863_cur)
  rx863_fail:
.annotate "line", 376
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    rx863_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("244_1258533478.31768") :method
.annotate "line", 376
    $P865 = self."!PREFIX__!subrule"("O", "/")
    new $P866, "ResizablePMCArray"
    push $P866, $P865
    .return ($P866)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("245_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx869_tgt
    .local int rx869_pos
    .local int rx869_off
    .local int rx869_eos
    .local int rx869_rep
    .local pmc rx869_cur
    (rx869_cur, rx869_pos, rx869_tgt, $I10) = self."!cursor_start"()
    rx869_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx869_cur
    .local pmc match
    .lex "$/", match
    length rx869_eos, rx869_tgt
    set rx869_off, 0
    lt $I10, 2, rx869_start
    sub rx869_off, $I10, 1
    substr rx869_tgt, rx869_tgt, rx869_off
  rx869_start:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_873_fail
    rx869_cur."!mark_push"(0, rx869_pos, $I10)
  # rx literal  "%"
    add $I11, rx869_pos, 1
    gt $I11, rx869_eos, rx869_fail
    sub $I11, rx869_pos, rx869_off
    substr $S10, rx869_tgt, $I11, 1
    ne $S10, "%", rx869_fail
    add rx869_pos, 1
    set_addr $I10, rxcap_873_fail
    ($I12, $I11) = rx869_cur."!mark_peek"($I10)
    rx869_cur."!cursor_pos"($I11)
    ($P10) = rx869_cur."!cursor_start"()
    $P10."!cursor_pass"(rx869_pos, "")
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_873_done
  rxcap_873_fail:
    goto rx869_fail
  rxcap_873_done:
  # rx subrule "O" subtype=capture negate=
    rx869_cur."!cursor_pos"(rx869_pos)
    $P10 = rx869_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx869_fail
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx869_pos = $P10."pos"()
  # rx pass
    rx869_cur."!cursor_pass"(rx869_pos, "infix:sym<%>")
    rx869_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx869_pos)
    .return (rx869_cur)
  rx869_fail:
.annotate "line", 376
    (rx869_rep, rx869_pos, $I10, $P10) = rx869_cur."!mark_fail"(0)
    lt rx869_pos, -1, rx869_done
    eq rx869_pos, -1, rx869_fail
    jump $I10
  rx869_done:
    rx869_cur."!cursor_fail"()
    rx869_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx869_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("246_1258533478.31768") :method
.annotate "line", 376
    $P871 = self."!PREFIX__!subrule"("O", "%")
    new $P872, "ResizablePMCArray"
    push $P872, $P871
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("247_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt, $I10) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx875_cur
    .local pmc match
    .lex "$/", match
    length rx875_eos, rx875_tgt
    set rx875_off, 0
    lt $I10, 2, rx875_start
    sub rx875_off, $I10, 1
    substr rx875_tgt, rx875_tgt, rx875_off
  rx875_start:
.annotate "line", 440
  # rx subcapture "sym"
    set_addr $I10, rxcap_879_fail
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  # rx literal  "+"
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, "+", rx875_fail
    add rx875_pos, 1
    set_addr $I10, rxcap_879_fail
    ($I12, $I11) = rx875_cur."!mark_peek"($I10)
    rx875_cur."!cursor_pos"($I11)
    ($P10) = rx875_cur."!cursor_start"()
    $P10."!cursor_pass"(rx875_pos, "")
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_879_done
  rxcap_879_fail:
    goto rx875_fail
  rxcap_879_done:
  # rx subrule "O" subtype=capture negate=
    rx875_cur."!cursor_pos"(rx875_pos)
    $P10 = rx875_cur."O"("%additive, :pirop<add>")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx875_pos = $P10."pos"()
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "infix:sym<+>")
    rx875_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate "line", 376
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("248_1258533478.31768") :method
.annotate "line", 376
    $P877 = self."!PREFIX__!subrule"("O", "+")
    new $P878, "ResizablePMCArray"
    push $P878, $P877
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("249_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx881_tgt
    .local int rx881_pos
    .local int rx881_off
    .local int rx881_eos
    .local int rx881_rep
    .local pmc rx881_cur
    (rx881_cur, rx881_pos, rx881_tgt, $I10) = self."!cursor_start"()
    rx881_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx881_cur
    .local pmc match
    .lex "$/", match
    length rx881_eos, rx881_tgt
    set rx881_off, 0
    lt $I10, 2, rx881_start
    sub rx881_off, $I10, 1
    substr rx881_tgt, rx881_tgt, rx881_off
  rx881_start:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_885_fail
    rx881_cur."!mark_push"(0, rx881_pos, $I10)
  # rx literal  "-"
    add $I11, rx881_pos, 1
    gt $I11, rx881_eos, rx881_fail
    sub $I11, rx881_pos, rx881_off
    substr $S10, rx881_tgt, $I11, 1
    ne $S10, "-", rx881_fail
    add rx881_pos, 1
    set_addr $I10, rxcap_885_fail
    ($I12, $I11) = rx881_cur."!mark_peek"($I10)
    rx881_cur."!cursor_pos"($I11)
    ($P10) = rx881_cur."!cursor_start"()
    $P10."!cursor_pass"(rx881_pos, "")
    rx881_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_885_done
  rxcap_885_fail:
    goto rx881_fail
  rxcap_885_done:
  # rx subrule "O" subtype=capture negate=
    rx881_cur."!cursor_pos"(rx881_pos)
    $P10 = rx881_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx881_fail
    rx881_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx881_pos = $P10."pos"()
  # rx pass
    rx881_cur."!cursor_pass"(rx881_pos, "infix:sym<->")
    rx881_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx881_pos)
    .return (rx881_cur)
  rx881_fail:
.annotate "line", 376
    (rx881_rep, rx881_pos, $I10, $P10) = rx881_cur."!mark_fail"(0)
    lt rx881_pos, -1, rx881_done
    eq rx881_pos, -1, rx881_fail
    jump $I10
  rx881_done:
    rx881_cur."!cursor_fail"()
    rx881_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx881_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("250_1258533478.31768") :method
.annotate "line", 376
    $P883 = self."!PREFIX__!subrule"("O", "-")
    new $P884, "ResizablePMCArray"
    push $P884, $P883
    .return ($P884)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("251_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx887_tgt
    .local int rx887_pos
    .local int rx887_off
    .local int rx887_eos
    .local int rx887_rep
    .local pmc rx887_cur
    (rx887_cur, rx887_pos, rx887_tgt, $I10) = self."!cursor_start"()
    rx887_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx887_cur
    .local pmc match
    .lex "$/", match
    length rx887_eos, rx887_tgt
    set rx887_off, 0
    lt $I10, 2, rx887_start
    sub rx887_off, $I10, 1
    substr rx887_tgt, rx887_tgt, rx887_off
  rx887_start:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_891_fail
    rx887_cur."!mark_push"(0, rx887_pos, $I10)
  # rx literal  "~"
    add $I11, rx887_pos, 1
    gt $I11, rx887_eos, rx887_fail
    sub $I11, rx887_pos, rx887_off
    substr $S10, rx887_tgt, $I11, 1
    ne $S10, "~", rx887_fail
    add rx887_pos, 1
    set_addr $I10, rxcap_891_fail
    ($I12, $I11) = rx887_cur."!mark_peek"($I10)
    rx887_cur."!cursor_pos"($I11)
    ($P10) = rx887_cur."!cursor_start"()
    $P10."!cursor_pass"(rx887_pos, "")
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_891_done
  rxcap_891_fail:
    goto rx887_fail
  rxcap_891_done:
  # rx subrule "O" subtype=capture negate=
    rx887_cur."!cursor_pos"(rx887_pos)
    $P10 = rx887_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx887_fail
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx887_pos = $P10."pos"()
  # rx pass
    rx887_cur."!cursor_pass"(rx887_pos, "infix:sym<~>")
    rx887_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx887_pos)
    .return (rx887_cur)
  rx887_fail:
.annotate "line", 376
    (rx887_rep, rx887_pos, $I10, $P10) = rx887_cur."!mark_fail"(0)
    lt rx887_pos, -1, rx887_done
    eq rx887_pos, -1, rx887_fail
    jump $I10
  rx887_done:
    rx887_cur."!cursor_fail"()
    rx887_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx887_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("252_1258533478.31768") :method
.annotate "line", 376
    $P889 = self."!PREFIX__!subrule"("O", "~")
    new $P890, "ResizablePMCArray"
    push $P890, $P889
    .return ($P890)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("253_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx893_tgt
    .local int rx893_pos
    .local int rx893_off
    .local int rx893_eos
    .local int rx893_rep
    .local pmc rx893_cur
    (rx893_cur, rx893_pos, rx893_tgt, $I10) = self."!cursor_start"()
    rx893_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx893_cur
    .local pmc match
    .lex "$/", match
    length rx893_eos, rx893_tgt
    set rx893_off, 0
    lt $I10, 2, rx893_start
    sub rx893_off, $I10, 1
    substr rx893_tgt, rx893_tgt, rx893_off
  rx893_start:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_897_fail
    rx893_cur."!mark_push"(0, rx893_pos, $I10)
  # rx literal  "=="
    add $I11, rx893_pos, 2
    gt $I11, rx893_eos, rx893_fail
    sub $I11, rx893_pos, rx893_off
    substr $S10, rx893_tgt, $I11, 2
    ne $S10, "==", rx893_fail
    add rx893_pos, 2
    set_addr $I10, rxcap_897_fail
    ($I12, $I11) = rx893_cur."!mark_peek"($I10)
    rx893_cur."!cursor_pos"($I11)
    ($P10) = rx893_cur."!cursor_start"()
    $P10."!cursor_pass"(rx893_pos, "")
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_897_done
  rxcap_897_fail:
    goto rx893_fail
  rxcap_897_done:
  # rx subrule "O" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx893_pos = $P10."pos"()
  # rx pass
    rx893_cur."!cursor_pass"(rx893_pos, "infix:sym<==>")
    rx893_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx893_pos)
    .return (rx893_cur)
  rx893_fail:
.annotate "line", 376
    (rx893_rep, rx893_pos, $I10, $P10) = rx893_cur."!mark_fail"(0)
    lt rx893_pos, -1, rx893_done
    eq rx893_pos, -1, rx893_fail
    jump $I10
  rx893_done:
    rx893_cur."!cursor_fail"()
    rx893_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx893_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("254_1258533478.31768") :method
.annotate "line", 376
    $P895 = self."!PREFIX__!subrule"("O", "==")
    new $P896, "ResizablePMCArray"
    push $P896, $P895
    .return ($P896)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("255_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx899_tgt
    .local int rx899_pos
    .local int rx899_off
    .local int rx899_eos
    .local int rx899_rep
    .local pmc rx899_cur
    (rx899_cur, rx899_pos, rx899_tgt, $I10) = self."!cursor_start"()
    rx899_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx899_cur
    .local pmc match
    .lex "$/", match
    length rx899_eos, rx899_tgt
    set rx899_off, 0
    lt $I10, 2, rx899_start
    sub rx899_off, $I10, 1
    substr rx899_tgt, rx899_tgt, rx899_off
  rx899_start:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_903_fail
    rx899_cur."!mark_push"(0, rx899_pos, $I10)
  # rx literal  "!="
    add $I11, rx899_pos, 2
    gt $I11, rx899_eos, rx899_fail
    sub $I11, rx899_pos, rx899_off
    substr $S10, rx899_tgt, $I11, 2
    ne $S10, "!=", rx899_fail
    add rx899_pos, 2
    set_addr $I10, rxcap_903_fail
    ($I12, $I11) = rx899_cur."!mark_peek"($I10)
    rx899_cur."!cursor_pos"($I11)
    ($P10) = rx899_cur."!cursor_start"()
    $P10."!cursor_pass"(rx899_pos, "")
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_903_done
  rxcap_903_fail:
    goto rx899_fail
  rxcap_903_done:
  # rx subrule "O" subtype=capture negate=
    rx899_cur."!cursor_pos"(rx899_pos)
    $P10 = rx899_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx899_fail
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx899_pos = $P10."pos"()
  # rx pass
    rx899_cur."!cursor_pass"(rx899_pos, "infix:sym<!=>")
    rx899_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx899_pos)
    .return (rx899_cur)
  rx899_fail:
.annotate "line", 376
    (rx899_rep, rx899_pos, $I10, $P10) = rx899_cur."!mark_fail"(0)
    lt rx899_pos, -1, rx899_done
    eq rx899_pos, -1, rx899_fail
    jump $I10
  rx899_done:
    rx899_cur."!cursor_fail"()
    rx899_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx899_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("256_1258533478.31768") :method
.annotate "line", 376
    $P901 = self."!PREFIX__!subrule"("O", "!=")
    new $P902, "ResizablePMCArray"
    push $P902, $P901
    .return ($P902)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("257_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx905_tgt
    .local int rx905_pos
    .local int rx905_off
    .local int rx905_eos
    .local int rx905_rep
    .local pmc rx905_cur
    (rx905_cur, rx905_pos, rx905_tgt, $I10) = self."!cursor_start"()
    rx905_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx905_cur
    .local pmc match
    .lex "$/", match
    length rx905_eos, rx905_tgt
    set rx905_off, 0
    lt $I10, 2, rx905_start
    sub rx905_off, $I10, 1
    substr rx905_tgt, rx905_tgt, rx905_off
  rx905_start:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_909_fail
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  # rx literal  "<="
    add $I11, rx905_pos, 2
    gt $I11, rx905_eos, rx905_fail
    sub $I11, rx905_pos, rx905_off
    substr $S10, rx905_tgt, $I11, 2
    ne $S10, "<=", rx905_fail
    add rx905_pos, 2
    set_addr $I10, rxcap_909_fail
    ($I12, $I11) = rx905_cur."!mark_peek"($I10)
    rx905_cur."!cursor_pos"($I11)
    ($P10) = rx905_cur."!cursor_start"()
    $P10."!cursor_pass"(rx905_pos, "")
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_909_done
  rxcap_909_fail:
    goto rx905_fail
  rxcap_909_done:
  # rx subrule "O" subtype=capture negate=
    rx905_cur."!cursor_pos"(rx905_pos)
    $P10 = rx905_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx905_fail
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx905_pos = $P10."pos"()
  # rx pass
    rx905_cur."!cursor_pass"(rx905_pos, "infix:sym<<=>")
    rx905_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx905_pos)
    .return (rx905_cur)
  rx905_fail:
.annotate "line", 376
    (rx905_rep, rx905_pos, $I10, $P10) = rx905_cur."!mark_fail"(0)
    lt rx905_pos, -1, rx905_done
    eq rx905_pos, -1, rx905_fail
    jump $I10
  rx905_done:
    rx905_cur."!cursor_fail"()
    rx905_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx905_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("258_1258533478.31768") :method
.annotate "line", 376
    $P907 = self."!PREFIX__!subrule"("O", "<=")
    new $P908, "ResizablePMCArray"
    push $P908, $P907
    .return ($P908)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("259_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx911_tgt
    .local int rx911_pos
    .local int rx911_off
    .local int rx911_eos
    .local int rx911_rep
    .local pmc rx911_cur
    (rx911_cur, rx911_pos, rx911_tgt, $I10) = self."!cursor_start"()
    rx911_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx911_cur
    .local pmc match
    .lex "$/", match
    length rx911_eos, rx911_tgt
    set rx911_off, 0
    lt $I10, 2, rx911_start
    sub rx911_off, $I10, 1
    substr rx911_tgt, rx911_tgt, rx911_off
  rx911_start:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_915_fail
    rx911_cur."!mark_push"(0, rx911_pos, $I10)
  # rx literal  ">="
    add $I11, rx911_pos, 2
    gt $I11, rx911_eos, rx911_fail
    sub $I11, rx911_pos, rx911_off
    substr $S10, rx911_tgt, $I11, 2
    ne $S10, ">=", rx911_fail
    add rx911_pos, 2
    set_addr $I10, rxcap_915_fail
    ($I12, $I11) = rx911_cur."!mark_peek"($I10)
    rx911_cur."!cursor_pos"($I11)
    ($P10) = rx911_cur."!cursor_start"()
    $P10."!cursor_pass"(rx911_pos, "")
    rx911_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_915_done
  rxcap_915_fail:
    goto rx911_fail
  rxcap_915_done:
  # rx subrule "O" subtype=capture negate=
    rx911_cur."!cursor_pos"(rx911_pos)
    $P10 = rx911_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx911_fail
    rx911_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx911_pos = $P10."pos"()
  # rx pass
    rx911_cur."!cursor_pass"(rx911_pos, "infix:sym<>=>")
    rx911_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx911_pos)
    .return (rx911_cur)
  rx911_fail:
.annotate "line", 376
    (rx911_rep, rx911_pos, $I10, $P10) = rx911_cur."!mark_fail"(0)
    lt rx911_pos, -1, rx911_done
    eq rx911_pos, -1, rx911_fail
    jump $I10
  rx911_done:
    rx911_cur."!cursor_fail"()
    rx911_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx911_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("260_1258533478.31768") :method
.annotate "line", 376
    $P913 = self."!PREFIX__!subrule"("O", ">=")
    new $P914, "ResizablePMCArray"
    push $P914, $P913
    .return ($P914)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("261_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx917_tgt
    .local int rx917_pos
    .local int rx917_off
    .local int rx917_eos
    .local int rx917_rep
    .local pmc rx917_cur
    (rx917_cur, rx917_pos, rx917_tgt, $I10) = self."!cursor_start"()
    rx917_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx917_cur
    .local pmc match
    .lex "$/", match
    length rx917_eos, rx917_tgt
    set rx917_off, 0
    lt $I10, 2, rx917_start
    sub rx917_off, $I10, 1
    substr rx917_tgt, rx917_tgt, rx917_off
  rx917_start:
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_921_fail
    rx917_cur."!mark_push"(0, rx917_pos, $I10)
  # rx literal  "<"
    add $I11, rx917_pos, 1
    gt $I11, rx917_eos, rx917_fail
    sub $I11, rx917_pos, rx917_off
    substr $S10, rx917_tgt, $I11, 1
    ne $S10, "<", rx917_fail
    add rx917_pos, 1
    set_addr $I10, rxcap_921_fail
    ($I12, $I11) = rx917_cur."!mark_peek"($I10)
    rx917_cur."!cursor_pos"($I11)
    ($P10) = rx917_cur."!cursor_start"()
    $P10."!cursor_pass"(rx917_pos, "")
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_921_done
  rxcap_921_fail:
    goto rx917_fail
  rxcap_921_done:
  # rx subrule "O" subtype=capture negate=
    rx917_cur."!cursor_pos"(rx917_pos)
    $P10 = rx917_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx917_fail
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx917_pos = $P10."pos"()
  # rx pass
    rx917_cur."!cursor_pass"(rx917_pos, "infix:sym<<>")
    rx917_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx917_pos)
    .return (rx917_cur)
  rx917_fail:
.annotate "line", 376
    (rx917_rep, rx917_pos, $I10, $P10) = rx917_cur."!mark_fail"(0)
    lt rx917_pos, -1, rx917_done
    eq rx917_pos, -1, rx917_fail
    jump $I10
  rx917_done:
    rx917_cur."!cursor_fail"()
    rx917_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx917_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("262_1258533478.31768") :method
.annotate "line", 376
    $P919 = self."!PREFIX__!subrule"("O", "<")
    new $P920, "ResizablePMCArray"
    push $P920, $P919
    .return ($P920)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("263_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx923_tgt
    .local int rx923_pos
    .local int rx923_off
    .local int rx923_eos
    .local int rx923_rep
    .local pmc rx923_cur
    (rx923_cur, rx923_pos, rx923_tgt, $I10) = self."!cursor_start"()
    rx923_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx923_cur
    .local pmc match
    .lex "$/", match
    length rx923_eos, rx923_tgt
    set rx923_off, 0
    lt $I10, 2, rx923_start
    sub rx923_off, $I10, 1
    substr rx923_tgt, rx923_tgt, rx923_off
  rx923_start:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_927_fail
    rx923_cur."!mark_push"(0, rx923_pos, $I10)
  # rx literal  ">"
    add $I11, rx923_pos, 1
    gt $I11, rx923_eos, rx923_fail
    sub $I11, rx923_pos, rx923_off
    substr $S10, rx923_tgt, $I11, 1
    ne $S10, ">", rx923_fail
    add rx923_pos, 1
    set_addr $I10, rxcap_927_fail
    ($I12, $I11) = rx923_cur."!mark_peek"($I10)
    rx923_cur."!cursor_pos"($I11)
    ($P10) = rx923_cur."!cursor_start"()
    $P10."!cursor_pass"(rx923_pos, "")
    rx923_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_927_done
  rxcap_927_fail:
    goto rx923_fail
  rxcap_927_done:
  # rx subrule "O" subtype=capture negate=
    rx923_cur."!cursor_pos"(rx923_pos)
    $P10 = rx923_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx923_fail
    rx923_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx923_pos = $P10."pos"()
  # rx pass
    rx923_cur."!cursor_pass"(rx923_pos, "infix:sym<>>")
    rx923_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx923_pos)
    .return (rx923_cur)
  rx923_fail:
.annotate "line", 376
    (rx923_rep, rx923_pos, $I10, $P10) = rx923_cur."!mark_fail"(0)
    lt rx923_pos, -1, rx923_done
    eq rx923_pos, -1, rx923_fail
    jump $I10
  rx923_done:
    rx923_cur."!cursor_fail"()
    rx923_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx923_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("264_1258533478.31768") :method
.annotate "line", 376
    $P925 = self."!PREFIX__!subrule"("O", ">")
    new $P926, "ResizablePMCArray"
    push $P926, $P925
    .return ($P926)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("265_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx929_tgt
    .local int rx929_pos
    .local int rx929_off
    .local int rx929_eos
    .local int rx929_rep
    .local pmc rx929_cur
    (rx929_cur, rx929_pos, rx929_tgt, $I10) = self."!cursor_start"()
    rx929_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx929_cur
    .local pmc match
    .lex "$/", match
    length rx929_eos, rx929_tgt
    set rx929_off, 0
    lt $I10, 2, rx929_start
    sub rx929_off, $I10, 1
    substr rx929_tgt, rx929_tgt, rx929_off
  rx929_start:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_933_fail
    rx929_cur."!mark_push"(0, rx929_pos, $I10)
  # rx literal  "eq"
    add $I11, rx929_pos, 2
    gt $I11, rx929_eos, rx929_fail
    sub $I11, rx929_pos, rx929_off
    substr $S10, rx929_tgt, $I11, 2
    ne $S10, "eq", rx929_fail
    add rx929_pos, 2
    set_addr $I10, rxcap_933_fail
    ($I12, $I11) = rx929_cur."!mark_peek"($I10)
    rx929_cur."!cursor_pos"($I11)
    ($P10) = rx929_cur."!cursor_start"()
    $P10."!cursor_pass"(rx929_pos, "")
    rx929_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_933_done
  rxcap_933_fail:
    goto rx929_fail
  rxcap_933_done:
  # rx subrule "O" subtype=capture negate=
    rx929_cur."!cursor_pos"(rx929_pos)
    $P10 = rx929_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx929_fail
    rx929_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx929_pos = $P10."pos"()
  # rx pass
    rx929_cur."!cursor_pass"(rx929_pos, "infix:sym<eq>")
    rx929_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx929_pos)
    .return (rx929_cur)
  rx929_fail:
.annotate "line", 376
    (rx929_rep, rx929_pos, $I10, $P10) = rx929_cur."!mark_fail"(0)
    lt rx929_pos, -1, rx929_done
    eq rx929_pos, -1, rx929_fail
    jump $I10
  rx929_done:
    rx929_cur."!cursor_fail"()
    rx929_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx929_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("266_1258533478.31768") :method
.annotate "line", 376
    $P931 = self."!PREFIX__!subrule"("O", "eq")
    new $P932, "ResizablePMCArray"
    push $P932, $P931
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("267_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx935_tgt
    .local int rx935_pos
    .local int rx935_off
    .local int rx935_eos
    .local int rx935_rep
    .local pmc rx935_cur
    (rx935_cur, rx935_pos, rx935_tgt, $I10) = self."!cursor_start"()
    rx935_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx935_cur
    .local pmc match
    .lex "$/", match
    length rx935_eos, rx935_tgt
    set rx935_off, 0
    lt $I10, 2, rx935_start
    sub rx935_off, $I10, 1
    substr rx935_tgt, rx935_tgt, rx935_off
  rx935_start:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_939_fail
    rx935_cur."!mark_push"(0, rx935_pos, $I10)
  # rx literal  "ne"
    add $I11, rx935_pos, 2
    gt $I11, rx935_eos, rx935_fail
    sub $I11, rx935_pos, rx935_off
    substr $S10, rx935_tgt, $I11, 2
    ne $S10, "ne", rx935_fail
    add rx935_pos, 2
    set_addr $I10, rxcap_939_fail
    ($I12, $I11) = rx935_cur."!mark_peek"($I10)
    rx935_cur."!cursor_pos"($I11)
    ($P10) = rx935_cur."!cursor_start"()
    $P10."!cursor_pass"(rx935_pos, "")
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_939_done
  rxcap_939_fail:
    goto rx935_fail
  rxcap_939_done:
  # rx subrule "O" subtype=capture negate=
    rx935_cur."!cursor_pos"(rx935_pos)
    $P10 = rx935_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx935_fail
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx935_pos = $P10."pos"()
  # rx pass
    rx935_cur."!cursor_pass"(rx935_pos, "infix:sym<ne>")
    rx935_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx935_pos)
    .return (rx935_cur)
  rx935_fail:
.annotate "line", 376
    (rx935_rep, rx935_pos, $I10, $P10) = rx935_cur."!mark_fail"(0)
    lt rx935_pos, -1, rx935_done
    eq rx935_pos, -1, rx935_fail
    jump $I10
  rx935_done:
    rx935_cur."!cursor_fail"()
    rx935_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx935_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("268_1258533478.31768") :method
.annotate "line", 376
    $P937 = self."!PREFIX__!subrule"("O", "ne")
    new $P938, "ResizablePMCArray"
    push $P938, $P937
    .return ($P938)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("269_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt, $I10) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx941_cur
    .local pmc match
    .lex "$/", match
    length rx941_eos, rx941_tgt
    set rx941_off, 0
    lt $I10, 2, rx941_start
    sub rx941_off, $I10, 1
    substr rx941_tgt, rx941_tgt, rx941_off
  rx941_start:
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_945_fail
    rx941_cur."!mark_push"(0, rx941_pos, $I10)
  # rx literal  "le"
    add $I11, rx941_pos, 2
    gt $I11, rx941_eos, rx941_fail
    sub $I11, rx941_pos, rx941_off
    substr $S10, rx941_tgt, $I11, 2
    ne $S10, "le", rx941_fail
    add rx941_pos, 2
    set_addr $I10, rxcap_945_fail
    ($I12, $I11) = rx941_cur."!mark_peek"($I10)
    rx941_cur."!cursor_pos"($I11)
    ($P10) = rx941_cur."!cursor_start"()
    $P10."!cursor_pass"(rx941_pos, "")
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_945_done
  rxcap_945_fail:
    goto rx941_fail
  rxcap_945_done:
  # rx subrule "O" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "infix:sym<le>")
    rx941_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate "line", 376
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("270_1258533478.31768") :method
.annotate "line", 376
    $P943 = self."!PREFIX__!subrule"("O", "le")
    new $P944, "ResizablePMCArray"
    push $P944, $P943
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("271_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt, $I10) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx947_cur
    .local pmc match
    .lex "$/", match
    length rx947_eos, rx947_tgt
    set rx947_off, 0
    lt $I10, 2, rx947_start
    sub rx947_off, $I10, 1
    substr rx947_tgt, rx947_tgt, rx947_off
  rx947_start:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_951_fail
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  # rx literal  "ge"
    add $I11, rx947_pos, 2
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 2
    ne $S10, "ge", rx947_fail
    add rx947_pos, 2
    set_addr $I10, rxcap_951_fail
    ($I12, $I11) = rx947_cur."!mark_peek"($I10)
    rx947_cur."!cursor_pos"($I11)
    ($P10) = rx947_cur."!cursor_start"()
    $P10."!cursor_pass"(rx947_pos, "")
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_951_done
  rxcap_951_fail:
    goto rx947_fail
  rxcap_951_done:
  # rx subrule "O" subtype=capture negate=
    rx947_cur."!cursor_pos"(rx947_pos)
    $P10 = rx947_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "infix:sym<ge>")
    rx947_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate "line", 376
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("272_1258533478.31768") :method
.annotate "line", 376
    $P949 = self."!PREFIX__!subrule"("O", "ge")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("273_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx953_tgt
    .local int rx953_pos
    .local int rx953_off
    .local int rx953_eos
    .local int rx953_rep
    .local pmc rx953_cur
    (rx953_cur, rx953_pos, rx953_tgt, $I10) = self."!cursor_start"()
    rx953_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx953_cur
    .local pmc match
    .lex "$/", match
    length rx953_eos, rx953_tgt
    set rx953_off, 0
    lt $I10, 2, rx953_start
    sub rx953_off, $I10, 1
    substr rx953_tgt, rx953_tgt, rx953_off
  rx953_start:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_957_fail
    rx953_cur."!mark_push"(0, rx953_pos, $I10)
  # rx literal  "lt"
    add $I11, rx953_pos, 2
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 2
    ne $S10, "lt", rx953_fail
    add rx953_pos, 2
    set_addr $I10, rxcap_957_fail
    ($I12, $I11) = rx953_cur."!mark_peek"($I10)
    rx953_cur."!cursor_pos"($I11)
    ($P10) = rx953_cur."!cursor_start"()
    $P10."!cursor_pass"(rx953_pos, "")
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_957_done
  rxcap_957_fail:
    goto rx953_fail
  rxcap_957_done:
  # rx subrule "O" subtype=capture negate=
    rx953_cur."!cursor_pos"(rx953_pos)
    $P10 = rx953_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx953_pos = $P10."pos"()
  # rx pass
    rx953_cur."!cursor_pass"(rx953_pos, "infix:sym<lt>")
    rx953_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx953_pos)
    .return (rx953_cur)
  rx953_fail:
.annotate "line", 376
    (rx953_rep, rx953_pos, $I10, $P10) = rx953_cur."!mark_fail"(0)
    lt rx953_pos, -1, rx953_done
    eq rx953_pos, -1, rx953_fail
    jump $I10
  rx953_done:
    rx953_cur."!cursor_fail"()
    rx953_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx953_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("274_1258533478.31768") :method
.annotate "line", 376
    $P955 = self."!PREFIX__!subrule"("O", "lt")
    new $P956, "ResizablePMCArray"
    push $P956, $P955
    .return ($P956)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("275_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx959_tgt
    .local int rx959_pos
    .local int rx959_off
    .local int rx959_eos
    .local int rx959_rep
    .local pmc rx959_cur
    (rx959_cur, rx959_pos, rx959_tgt, $I10) = self."!cursor_start"()
    rx959_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx959_cur
    .local pmc match
    .lex "$/", match
    length rx959_eos, rx959_tgt
    set rx959_off, 0
    lt $I10, 2, rx959_start
    sub rx959_off, $I10, 1
    substr rx959_tgt, rx959_tgt, rx959_off
  rx959_start:
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_963_fail
    rx959_cur."!mark_push"(0, rx959_pos, $I10)
  # rx literal  "gt"
    add $I11, rx959_pos, 2
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    substr $S10, rx959_tgt, $I11, 2
    ne $S10, "gt", rx959_fail
    add rx959_pos, 2
    set_addr $I10, rxcap_963_fail
    ($I12, $I11) = rx959_cur."!mark_peek"($I10)
    rx959_cur."!cursor_pos"($I11)
    ($P10) = rx959_cur."!cursor_start"()
    $P10."!cursor_pass"(rx959_pos, "")
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_963_done
  rxcap_963_fail:
    goto rx959_fail
  rxcap_963_done:
  # rx subrule "O" subtype=capture negate=
    rx959_cur."!cursor_pos"(rx959_pos)
    $P10 = rx959_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx959_fail
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx959_pos = $P10."pos"()
  # rx pass
    rx959_cur."!cursor_pass"(rx959_pos, "infix:sym<gt>")
    rx959_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx959_pos)
    .return (rx959_cur)
  rx959_fail:
.annotate "line", 376
    (rx959_rep, rx959_pos, $I10, $P10) = rx959_cur."!mark_fail"(0)
    lt rx959_pos, -1, rx959_done
    eq rx959_pos, -1, rx959_fail
    jump $I10
  rx959_done:
    rx959_cur."!cursor_fail"()
    rx959_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx959_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("276_1258533478.31768") :method
.annotate "line", 376
    $P961 = self."!PREFIX__!subrule"("O", "gt")
    new $P962, "ResizablePMCArray"
    push $P962, $P961
    .return ($P962)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("277_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx965_tgt
    .local int rx965_pos
    .local int rx965_off
    .local int rx965_eos
    .local int rx965_rep
    .local pmc rx965_cur
    (rx965_cur, rx965_pos, rx965_tgt, $I10) = self."!cursor_start"()
    rx965_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx965_cur
    .local pmc match
    .lex "$/", match
    length rx965_eos, rx965_tgt
    set rx965_off, 0
    lt $I10, 2, rx965_start
    sub rx965_off, $I10, 1
    substr rx965_tgt, rx965_tgt, rx965_off
  rx965_start:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_969_fail
    rx965_cur."!mark_push"(0, rx965_pos, $I10)
  # rx literal  "=:="
    add $I11, rx965_pos, 3
    gt $I11, rx965_eos, rx965_fail
    sub $I11, rx965_pos, rx965_off
    substr $S10, rx965_tgt, $I11, 3
    ne $S10, "=:=", rx965_fail
    add rx965_pos, 3
    set_addr $I10, rxcap_969_fail
    ($I12, $I11) = rx965_cur."!mark_peek"($I10)
    rx965_cur."!cursor_pos"($I11)
    ($P10) = rx965_cur."!cursor_start"()
    $P10."!cursor_pass"(rx965_pos, "")
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_969_done
  rxcap_969_fail:
    goto rx965_fail
  rxcap_969_done:
  # rx subrule "O" subtype=capture negate=
    rx965_cur."!cursor_pos"(rx965_pos)
    $P10 = rx965_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx965_fail
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx965_pos = $P10."pos"()
  # rx pass
    rx965_cur."!cursor_pass"(rx965_pos, "infix:sym<=:=>")
    rx965_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx965_pos)
    .return (rx965_cur)
  rx965_fail:
.annotate "line", 376
    (rx965_rep, rx965_pos, $I10, $P10) = rx965_cur."!mark_fail"(0)
    lt rx965_pos, -1, rx965_done
    eq rx965_pos, -1, rx965_fail
    jump $I10
  rx965_done:
    rx965_cur."!cursor_fail"()
    rx965_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx965_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("278_1258533478.31768") :method
.annotate "line", 376
    $P967 = self."!PREFIX__!subrule"("O", "=:=")
    new $P968, "ResizablePMCArray"
    push $P968, $P967
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("279_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    (rx971_cur, rx971_pos, rx971_tgt, $I10) = self."!cursor_start"()
    rx971_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx971_cur
    .local pmc match
    .lex "$/", match
    length rx971_eos, rx971_tgt
    set rx971_off, 0
    lt $I10, 2, rx971_start
    sub rx971_off, $I10, 1
    substr rx971_tgt, rx971_tgt, rx971_off
  rx971_start:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_975_fail
    rx971_cur."!mark_push"(0, rx971_pos, $I10)
  # rx literal  "&&"
    add $I11, rx971_pos, 2
    gt $I11, rx971_eos, rx971_fail
    sub $I11, rx971_pos, rx971_off
    substr $S10, rx971_tgt, $I11, 2
    ne $S10, "&&", rx971_fail
    add rx971_pos, 2
    set_addr $I10, rxcap_975_fail
    ($I12, $I11) = rx971_cur."!mark_peek"($I10)
    rx971_cur."!cursor_pos"($I11)
    ($P10) = rx971_cur."!cursor_start"()
    $P10."!cursor_pass"(rx971_pos, "")
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_975_done
  rxcap_975_fail:
    goto rx971_fail
  rxcap_975_done:
  # rx subrule "O" subtype=capture negate=
    rx971_cur."!cursor_pos"(rx971_pos)
    $P10 = rx971_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx971_fail
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx971_pos = $P10."pos"()
  # rx pass
    rx971_cur."!cursor_pass"(rx971_pos, "infix:sym<&&>")
    rx971_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx971_pos)
    .return (rx971_cur)
  rx971_fail:
.annotate "line", 376
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    rx971_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("280_1258533478.31768") :method
.annotate "line", 376
    $P973 = self."!PREFIX__!subrule"("O", "&&")
    new $P974, "ResizablePMCArray"
    push $P974, $P973
    .return ($P974)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("281_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx977_tgt
    .local int rx977_pos
    .local int rx977_off
    .local int rx977_eos
    .local int rx977_rep
    .local pmc rx977_cur
    (rx977_cur, rx977_pos, rx977_tgt, $I10) = self."!cursor_start"()
    rx977_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx977_cur
    .local pmc match
    .lex "$/", match
    length rx977_eos, rx977_tgt
    set rx977_off, 0
    lt $I10, 2, rx977_start
    sub rx977_off, $I10, 1
    substr rx977_tgt, rx977_tgt, rx977_off
  rx977_start:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_981_fail
    rx977_cur."!mark_push"(0, rx977_pos, $I10)
  # rx literal  "||"
    add $I11, rx977_pos, 2
    gt $I11, rx977_eos, rx977_fail
    sub $I11, rx977_pos, rx977_off
    substr $S10, rx977_tgt, $I11, 2
    ne $S10, "||", rx977_fail
    add rx977_pos, 2
    set_addr $I10, rxcap_981_fail
    ($I12, $I11) = rx977_cur."!mark_peek"($I10)
    rx977_cur."!cursor_pos"($I11)
    ($P10) = rx977_cur."!cursor_start"()
    $P10."!cursor_pass"(rx977_pos, "")
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_981_done
  rxcap_981_fail:
    goto rx977_fail
  rxcap_981_done:
  # rx subrule "O" subtype=capture negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx977_fail
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx977_pos = $P10."pos"()
  # rx pass
    rx977_cur."!cursor_pass"(rx977_pos, "infix:sym<||>")
    rx977_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx977_pos)
    .return (rx977_cur)
  rx977_fail:
.annotate "line", 376
    (rx977_rep, rx977_pos, $I10, $P10) = rx977_cur."!mark_fail"(0)
    lt rx977_pos, -1, rx977_done
    eq rx977_pos, -1, rx977_fail
    jump $I10
  rx977_done:
    rx977_cur."!cursor_fail"()
    rx977_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx977_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("282_1258533478.31768") :method
.annotate "line", 376
    $P979 = self."!PREFIX__!subrule"("O", "||")
    new $P980, "ResizablePMCArray"
    push $P980, $P979
    .return ($P980)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("283_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx983_tgt
    .local int rx983_pos
    .local int rx983_off
    .local int rx983_eos
    .local int rx983_rep
    .local pmc rx983_cur
    (rx983_cur, rx983_pos, rx983_tgt, $I10) = self."!cursor_start"()
    rx983_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx983_cur
    .local pmc match
    .lex "$/", match
    length rx983_eos, rx983_tgt
    set rx983_off, 0
    lt $I10, 2, rx983_start
    sub rx983_off, $I10, 1
    substr rx983_tgt, rx983_tgt, rx983_off
  rx983_start:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_987_fail
    rx983_cur."!mark_push"(0, rx983_pos, $I10)
  # rx literal  "//"
    add $I11, rx983_pos, 2
    gt $I11, rx983_eos, rx983_fail
    sub $I11, rx983_pos, rx983_off
    substr $S10, rx983_tgt, $I11, 2
    ne $S10, "//", rx983_fail
    add rx983_pos, 2
    set_addr $I10, rxcap_987_fail
    ($I12, $I11) = rx983_cur."!mark_peek"($I10)
    rx983_cur."!cursor_pos"($I11)
    ($P10) = rx983_cur."!cursor_start"()
    $P10."!cursor_pass"(rx983_pos, "")
    rx983_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_987_done
  rxcap_987_fail:
    goto rx983_fail
  rxcap_987_done:
  # rx subrule "O" subtype=capture negate=
    rx983_cur."!cursor_pos"(rx983_pos)
    $P10 = rx983_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx983_fail
    rx983_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx983_pos = $P10."pos"()
  # rx pass
    rx983_cur."!cursor_pass"(rx983_pos, "infix:sym<//>")
    rx983_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx983_pos)
    .return (rx983_cur)
  rx983_fail:
.annotate "line", 376
    (rx983_rep, rx983_pos, $I10, $P10) = rx983_cur."!mark_fail"(0)
    lt rx983_pos, -1, rx983_done
    eq rx983_pos, -1, rx983_fail
    jump $I10
  rx983_done:
    rx983_cur."!cursor_fail"()
    rx983_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx983_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("284_1258533478.31768") :method
.annotate "line", 376
    $P985 = self."!PREFIX__!subrule"("O", "//")
    new $P986, "ResizablePMCArray"
    push $P986, $P985
    .return ($P986)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("285_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx989_tgt
    .local int rx989_pos
    .local int rx989_off
    .local int rx989_eos
    .local int rx989_rep
    .local pmc rx989_cur
    (rx989_cur, rx989_pos, rx989_tgt, $I10) = self."!cursor_start"()
    rx989_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx989_cur
    .local pmc match
    .lex "$/", match
    length rx989_eos, rx989_tgt
    set rx989_off, 0
    lt $I10, 2, rx989_start
    sub rx989_off, $I10, 1
    substr rx989_tgt, rx989_tgt, rx989_off
  rx989_start:
.annotate "line", 465
  # rx literal  "??"
    add $I11, rx989_pos, 2
    gt $I11, rx989_eos, rx989_fail
    sub $I11, rx989_pos, rx989_off
    substr $S10, rx989_tgt, $I11, 2
    ne $S10, "??", rx989_fail
    add rx989_pos, 2
.annotate "line", 466
  # rx subrule "ws" subtype=method negate=
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."ws"()
    unless $P10, rx989_fail
    rx989_pos = $P10."pos"()
.annotate "line", 467
  # rx subrule "EXPR" subtype=capture negate=
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."EXPR"("i=")
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx989_pos = $P10."pos"()
.annotate "line", 468
  # rx literal  "!!"
    add $I11, rx989_pos, 2
    gt $I11, rx989_eos, rx989_fail
    sub $I11, rx989_pos, rx989_off
    substr $S10, rx989_tgt, $I11, 2
    ne $S10, "!!", rx989_fail
    add rx989_pos, 2
.annotate "line", 469
  # rx subrule "O" subtype=capture negate=
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx989_pos = $P10."pos"()
.annotate "line", 464
  # rx pass
    rx989_cur."!cursor_pass"(rx989_pos, "infix:sym<?? !!>")
    rx989_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx989_pos)
    .return (rx989_cur)
  rx989_fail:
.annotate "line", 376
    (rx989_rep, rx989_pos, $I10, $P10) = rx989_cur."!mark_fail"(0)
    lt rx989_pos, -1, rx989_done
    eq rx989_pos, -1, rx989_fail
    jump $I10
  rx989_done:
    rx989_cur."!cursor_fail"()
    rx989_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx989_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("286_1258533478.31768") :method
.annotate "line", 376
    $P991 = self."!PREFIX__!subrule"("", "??")
    new $P992, "ResizablePMCArray"
    push $P992, $P991
    .return ($P992)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("287_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx994_tgt
    .local int rx994_pos
    .local int rx994_off
    .local int rx994_eos
    .local int rx994_rep
    .local pmc rx994_cur
    (rx994_cur, rx994_pos, rx994_tgt, $I10) = self."!cursor_start"()
    rx994_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx994_cur
    .local pmc match
    .lex "$/", match
    length rx994_eos, rx994_tgt
    set rx994_off, 0
    lt $I10, 2, rx994_start
    sub rx994_off, $I10, 1
    substr rx994_tgt, rx994_tgt, rx994_off
  rx994_start:
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_998_fail
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  # rx literal  "="
    add $I11, rx994_pos, 1
    gt $I11, rx994_eos, rx994_fail
    sub $I11, rx994_pos, rx994_off
    substr $S10, rx994_tgt, $I11, 1
    ne $S10, "=", rx994_fail
    add rx994_pos, 1
    set_addr $I10, rxcap_998_fail
    ($I12, $I11) = rx994_cur."!mark_peek"($I10)
    rx994_cur."!cursor_pos"($I11)
    ($P10) = rx994_cur."!cursor_start"()
    $P10."!cursor_pass"(rx994_pos, "")
    rx994_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_998_done
  rxcap_998_fail:
    goto rx994_fail
  rxcap_998_done:
  # rx subrule "panic" subtype=method negate=
    rx994_cur."!cursor_pos"(rx994_pos)
    $P10 = rx994_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx994_fail
    rx994_pos = $P10."pos"()
.annotate "line", 472
  # rx pass
    rx994_cur."!cursor_pass"(rx994_pos, "infix:sym<=>")
    rx994_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx994_pos)
    .return (rx994_cur)
  rx994_fail:
.annotate "line", 376
    (rx994_rep, rx994_pos, $I10, $P10) = rx994_cur."!mark_fail"(0)
    lt rx994_pos, -1, rx994_done
    eq rx994_pos, -1, rx994_fail
    jump $I10
  rx994_done:
    rx994_cur."!cursor_fail"()
    rx994_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx994_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("288_1258533478.31768") :method
.annotate "line", 376
    $P996 = self."!PREFIX__!subrule"("", "=")
    new $P997, "ResizablePMCArray"
    push $P997, $P996
    .return ($P997)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("289_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx1000_tgt
    .local int rx1000_pos
    .local int rx1000_off
    .local int rx1000_eos
    .local int rx1000_rep
    .local pmc rx1000_cur
    (rx1000_cur, rx1000_pos, rx1000_tgt, $I10) = self."!cursor_start"()
    rx1000_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1000_cur
    .local pmc match
    .lex "$/", match
    length rx1000_eos, rx1000_tgt
    set rx1000_off, 0
    lt $I10, 2, rx1000_start
    sub rx1000_off, $I10, 1
    substr rx1000_tgt, rx1000_tgt, rx1000_off
  rx1000_start:
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1004_fail
    rx1000_cur."!mark_push"(0, rx1000_pos, $I10)
  # rx literal  ":="
    add $I11, rx1000_pos, 2
    gt $I11, rx1000_eos, rx1000_fail
    sub $I11, rx1000_pos, rx1000_off
    substr $S10, rx1000_tgt, $I11, 2
    ne $S10, ":=", rx1000_fail
    add rx1000_pos, 2
    set_addr $I10, rxcap_1004_fail
    ($I12, $I11) = rx1000_cur."!mark_peek"($I10)
    rx1000_cur."!cursor_pos"($I11)
    ($P10) = rx1000_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1000_pos, "")
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1004_done
  rxcap_1004_fail:
    goto rx1000_fail
  rxcap_1004_done:
  # rx subrule "O" subtype=capture negate=
    rx1000_cur."!cursor_pos"(rx1000_pos)
    $P10 = rx1000_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1000_fail
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1000_pos = $P10."pos"()
  # rx pass
    rx1000_cur."!cursor_pass"(rx1000_pos, "infix:sym<:=>")
    rx1000_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1000_pos)
    .return (rx1000_cur)
  rx1000_fail:
.annotate "line", 376
    (rx1000_rep, rx1000_pos, $I10, $P10) = rx1000_cur."!mark_fail"(0)
    lt rx1000_pos, -1, rx1000_done
    eq rx1000_pos, -1, rx1000_fail
    jump $I10
  rx1000_done:
    rx1000_cur."!cursor_fail"()
    rx1000_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1000_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("290_1258533478.31768") :method
.annotate "line", 376
    $P1002 = self."!PREFIX__!subrule"("O", ":=")
    new $P1003, "ResizablePMCArray"
    push $P1003, $P1002
    .return ($P1003)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("291_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx1006_tgt
    .local int rx1006_pos
    .local int rx1006_off
    .local int rx1006_eos
    .local int rx1006_rep
    .local pmc rx1006_cur
    (rx1006_cur, rx1006_pos, rx1006_tgt, $I10) = self."!cursor_start"()
    rx1006_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1006_cur
    .local pmc match
    .lex "$/", match
    length rx1006_eos, rx1006_tgt
    set rx1006_off, 0
    lt $I10, 2, rx1006_start
    sub rx1006_off, $I10, 1
    substr rx1006_tgt, rx1006_tgt, rx1006_off
  rx1006_start:
.annotate "line", 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1010_fail
    rx1006_cur."!mark_push"(0, rx1006_pos, $I10)
  # rx literal  "::="
    add $I11, rx1006_pos, 3
    gt $I11, rx1006_eos, rx1006_fail
    sub $I11, rx1006_pos, rx1006_off
    substr $S10, rx1006_tgt, $I11, 3
    ne $S10, "::=", rx1006_fail
    add rx1006_pos, 3
    set_addr $I10, rxcap_1010_fail
    ($I12, $I11) = rx1006_cur."!mark_peek"($I10)
    rx1006_cur."!cursor_pos"($I11)
    ($P10) = rx1006_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1006_pos, "")
    rx1006_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1010_done
  rxcap_1010_fail:
    goto rx1006_fail
  rxcap_1010_done:
  # rx subrule "O" subtype=capture negate=
    rx1006_cur."!cursor_pos"(rx1006_pos)
    $P10 = rx1006_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1006_fail
    rx1006_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1006_pos = $P10."pos"()
  # rx pass
    rx1006_cur."!cursor_pass"(rx1006_pos, "infix:sym<::=>")
    rx1006_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1006_pos)
    .return (rx1006_cur)
  rx1006_fail:
.annotate "line", 376
    (rx1006_rep, rx1006_pos, $I10, $P10) = rx1006_cur."!mark_fail"(0)
    lt rx1006_pos, -1, rx1006_done
    eq rx1006_pos, -1, rx1006_fail
    jump $I10
  rx1006_done:
    rx1006_cur."!cursor_fail"()
    rx1006_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1006_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("292_1258533478.31768") :method
.annotate "line", 376
    $P1008 = self."!PREFIX__!subrule"("O", "::=")
    new $P1009, "ResizablePMCArray"
    push $P1009, $P1008
    .return ($P1009)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("293_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx1012_tgt
    .local int rx1012_pos
    .local int rx1012_off
    .local int rx1012_eos
    .local int rx1012_rep
    .local pmc rx1012_cur
    (rx1012_cur, rx1012_pos, rx1012_tgt, $I10) = self."!cursor_start"()
    rx1012_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1012_cur
    .local pmc match
    .lex "$/", match
    length rx1012_eos, rx1012_tgt
    set rx1012_off, 0
    lt $I10, 2, rx1012_start
    sub rx1012_off, $I10, 1
    substr rx1012_tgt, rx1012_tgt, rx1012_off
  rx1012_start:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1016_fail
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  # rx literal  ","
    add $I11, rx1012_pos, 1
    gt $I11, rx1012_eos, rx1012_fail
    sub $I11, rx1012_pos, rx1012_off
    substr $S10, rx1012_tgt, $I11, 1
    ne $S10, ",", rx1012_fail
    add rx1012_pos, 1
    set_addr $I10, rxcap_1016_fail
    ($I12, $I11) = rx1012_cur."!mark_peek"($I10)
    rx1012_cur."!cursor_pos"($I11)
    ($P10) = rx1012_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1012_pos, "")
    rx1012_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1016_done
  rxcap_1016_fail:
    goto rx1012_fail
  rxcap_1016_done:
  # rx subrule "O" subtype=capture negate=
    rx1012_cur."!cursor_pos"(rx1012_pos)
    $P10 = rx1012_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1012_fail
    rx1012_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1012_pos = $P10."pos"()
  # rx pass
    rx1012_cur."!cursor_pass"(rx1012_pos, "infix:sym<,>")
    rx1012_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1012_pos)
    .return (rx1012_cur)
  rx1012_fail:
.annotate "line", 376
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    rx1012_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("294_1258533478.31768") :method
.annotate "line", 376
    $P1014 = self."!PREFIX__!subrule"("O", ",")
    new $P1015, "ResizablePMCArray"
    push $P1015, $P1014
    .return ($P1015)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("295_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx1018_tgt
    .local int rx1018_pos
    .local int rx1018_off
    .local int rx1018_eos
    .local int rx1018_rep
    .local pmc rx1018_cur
    (rx1018_cur, rx1018_pos, rx1018_tgt, $I10) = self."!cursor_start"()
    rx1018_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1018_cur
    .local pmc match
    .lex "$/", match
    length rx1018_eos, rx1018_tgt
    set rx1018_off, 0
    lt $I10, 2, rx1018_start
    sub rx1018_off, $I10, 1
    substr rx1018_tgt, rx1018_tgt, rx1018_off
  rx1018_start:
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1021_fail
    rx1018_cur."!mark_push"(0, rx1018_pos, $I10)
  # rx literal  "return"
    add $I11, rx1018_pos, 6
    gt $I11, rx1018_eos, rx1018_fail
    sub $I11, rx1018_pos, rx1018_off
    substr $S10, rx1018_tgt, $I11, 6
    ne $S10, "return", rx1018_fail
    add rx1018_pos, 6
    set_addr $I10, rxcap_1021_fail
    ($I12, $I11) = rx1018_cur."!mark_peek"($I10)
    rx1018_cur."!cursor_pos"($I11)
    ($P10) = rx1018_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1018_pos, "")
    rx1018_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1021_done
  rxcap_1021_fail:
    goto rx1018_fail
  rxcap_1021_done:
  # rx charclass s
    ge rx1018_pos, rx1018_eos, rx1018_fail
    sub $I10, rx1018_pos, rx1018_off
    is_cclass $I11, 32, rx1018_tgt, $I10
    unless $I11, rx1018_fail
    inc rx1018_pos
  # rx subrule "O" subtype=capture negate=
    rx1018_cur."!cursor_pos"(rx1018_pos)
    $P10 = rx1018_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1018_fail
    rx1018_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1018_pos = $P10."pos"()
  # rx pass
    rx1018_cur."!cursor_pass"(rx1018_pos, "prefix:sym<return>")
    rx1018_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1018_pos)
    .return (rx1018_cur)
  rx1018_fail:
.annotate "line", 376
    (rx1018_rep, rx1018_pos, $I10, $P10) = rx1018_cur."!mark_fail"(0)
    lt rx1018_pos, -1, rx1018_done
    eq rx1018_pos, -1, rx1018_fail
    jump $I10
  rx1018_done:
    rx1018_cur."!cursor_fail"()
    rx1018_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1018_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("296_1258533478.31768") :method
.annotate "line", 376
    new $P1020, "ResizablePMCArray"
    push $P1020, "return"
    .return ($P1020)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("297_1258533478.31768") :method :outer("11_1258533478.31768")
.annotate "line", 376
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    (rx1023_cur, rx1023_pos, rx1023_tgt, $I10) = self."!cursor_start"()
    rx1023_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1023_cur
    .local pmc match
    .lex "$/", match
    length rx1023_eos, rx1023_tgt
    set rx1023_off, 0
    lt $I10, 2, rx1023_start
    sub rx1023_off, $I10, 1
    substr rx1023_tgt, rx1023_tgt, rx1023_off
  rx1023_start:
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1026_fail
    rx1023_cur."!mark_push"(0, rx1023_pos, $I10)
  # rx literal  "make"
    add $I11, rx1023_pos, 4
    gt $I11, rx1023_eos, rx1023_fail
    sub $I11, rx1023_pos, rx1023_off
    substr $S10, rx1023_tgt, $I11, 4
    ne $S10, "make", rx1023_fail
    add rx1023_pos, 4
    set_addr $I10, rxcap_1026_fail
    ($I12, $I11) = rx1023_cur."!mark_peek"($I10)
    rx1023_cur."!cursor_pos"($I11)
    ($P10) = rx1023_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1023_pos, "")
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1026_done
  rxcap_1026_fail:
    goto rx1023_fail
  rxcap_1026_done:
  # rx charclass s
    ge rx1023_pos, rx1023_eos, rx1023_fail
    sub $I10, rx1023_pos, rx1023_off
    is_cclass $I11, 32, rx1023_tgt, $I10
    unless $I11, rx1023_fail
    inc rx1023_pos
  # rx subrule "O" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."O"("%list_prefix")
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1023_pos = $P10."pos"()
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "prefix:sym<make>")
    rx1023_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1023_pos)
    .return (rx1023_cur)
  rx1023_fail:
.annotate "line", 376
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    rx1023_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("298_1258533478.31768") :method
.annotate "line", 376
    new $P1025, "ResizablePMCArray"
    push $P1025, "make"
    .return ($P1025)
.end


.namespace ["NQP";"Regex"]
.sub "_block1027"  :subid("299_1258533478.31768") :outer("11_1258533478.31768")
.annotate "line", 484
    .const 'Sub' $P1057 = "310_1258533478.31768" 
    capture_lex $P1057
    .const 'Sub' $P1045 = "307_1258533478.31768" 
    capture_lex $P1045
    .const 'Sub' $P1041 = "305_1258533478.31768" 
    capture_lex $P1041
    .const 'Sub' $P1037 = "303_1258533478.31768" 
    capture_lex $P1037
    .const 'Sub' $P1029 = "300_1258533478.31768" 
    capture_lex $P1029
    .const 'Sub' $P1057 = "310_1258533478.31768" 
    capture_lex $P1057
    .return ($P1057)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("300_1258533478.31768") :method :outer("299_1258533478.31768")
.annotate "line", 484
    .const 'Sub' $P1034 = "302_1258533478.31768" 
    capture_lex $P1034
    .local string rx1030_tgt
    .local int rx1030_pos
    .local int rx1030_off
    .local int rx1030_eos
    .local int rx1030_rep
    .local pmc rx1030_cur
    (rx1030_cur, rx1030_pos, rx1030_tgt, $I10) = self."!cursor_start"()
    rx1030_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1030_cur
    .local pmc match
    .lex "$/", match
    length rx1030_eos, rx1030_tgt
    set rx1030_off, 0
    lt $I10, 2, rx1030_start
    sub rx1030_off, $I10, 1
    substr rx1030_tgt, rx1030_tgt, rx1030_off
  rx1030_start:
.annotate "line", 486
  # rx literal  ":"
    add $I11, rx1030_pos, 1
    gt $I11, rx1030_eos, rx1030_fail
    sub $I11, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I11, 1
    ne $S10, ":", rx1030_fail
    add rx1030_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    .const 'Sub' $P1034 = "302_1258533478.31768" 
    capture_lex $P1034
    $P10 = rx1030_cur."before"($P1034)
    unless $P10, rx1030_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."LANG"("MAIN", "statement")
    unless $P10, rx1030_fail
    rx1030_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1030_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1030_cur."!cursor_pos"(rx1030_pos)
    $P10 = rx1030_cur."ws"()
    unless $P10, rx1030_fail
    rx1030_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1030_pos, 1
    gt $I11, rx1030_eos, rx1030_fail
    sub $I11, rx1030_pos, rx1030_off
    substr $S10, rx1030_tgt, $I11, 1
    ne $S10, ";", rx1030_fail
    add rx1030_pos, 1
.annotate "line", 485
  # rx pass
    rx1030_cur."!cursor_pass"(rx1030_pos, "metachar:sym<:my>")
    rx1030_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1030_pos)
    .return (rx1030_cur)
  rx1030_fail:
.annotate "line", 484
    (rx1030_rep, rx1030_pos, $I10, $P10) = rx1030_cur."!mark_fail"(0)
    lt rx1030_pos, -1, rx1030_done
    eq rx1030_pos, -1, rx1030_fail
    jump $I10
  rx1030_done:
    rx1030_cur."!cursor_fail"()
    rx1030_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1030_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("301_1258533478.31768") :method
.annotate "line", 484
    new $P1032, "ResizablePMCArray"
    push $P1032, ":"
    .return ($P1032)
.end


.namespace ["NQP";"Regex"]
.sub "_block1033"  :anon :subid("302_1258533478.31768") :method :outer("300_1258533478.31768")
.annotate "line", 486
    .local string rx1035_tgt
    .local int rx1035_pos
    .local int rx1035_off
    .local int rx1035_eos
    .local int rx1035_rep
    .local pmc rx1035_cur
    (rx1035_cur, rx1035_pos, rx1035_tgt, $I10) = self."!cursor_start"()
    rx1035_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1035_cur
    .local pmc match
    .lex "$/", match
    length rx1035_eos, rx1035_tgt
    set rx1035_off, 0
    lt $I10, 2, rx1035_start
    sub rx1035_off, $I10, 1
    substr rx1035_tgt, rx1035_tgt, rx1035_off
  rx1035_start:
    ge rx1035_pos, 0, rxscan1036_done
  rxscan1036_loop:
    ($P10) = rx1035_cur."from"()
    inc $P10
    set rx1035_pos, $P10
    ge rx1035_pos, rx1035_eos, rxscan1036_done
    set_addr $I10, rxscan1036_loop
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  rxscan1036_done:
  # rx literal  "my"
    add $I11, rx1035_pos, 2
    gt $I11, rx1035_eos, rx1035_fail
    sub $I11, rx1035_pos, rx1035_off
    substr $S10, rx1035_tgt, $I11, 2
    ne $S10, "my", rx1035_fail
    add rx1035_pos, 2
  # rx pass
    rx1035_cur."!cursor_pass"(rx1035_pos, "")
    rx1035_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1035_pos)
    .return (rx1035_cur)
  rx1035_fail:
    (rx1035_rep, rx1035_pos, $I10, $P10) = rx1035_cur."!mark_fail"(0)
    lt rx1035_pos, -1, rx1035_done
    eq rx1035_pos, -1, rx1035_fail
    jump $I10
  rx1035_done:
    rx1035_cur."!cursor_fail"()
    rx1035_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1035_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("303_1258533478.31768") :method :outer("299_1258533478.31768")
.annotate "line", 484
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    (rx1038_cur, rx1038_pos, rx1038_tgt, $I10) = self."!cursor_start"()
    rx1038_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1038_cur
    .local pmc match
    .lex "$/", match
    length rx1038_eos, rx1038_tgt
    set rx1038_off, 0
    lt $I10, 2, rx1038_start
    sub rx1038_off, $I10, 1
    substr rx1038_tgt, rx1038_tgt, rx1038_off
  rx1038_start:
.annotate "line", 490
  # rx enumcharlist negate=0 zerowidth
    ge rx1038_pos, rx1038_eos, rx1038_fail
    sub $I10, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1038_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1038_cur."!cursor_pos"(rx1038_pos)
    $P10 = rx1038_cur."codeblock"()
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1038_pos = $P10."pos"()
.annotate "line", 489
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "metachar:sym<{ }>")
    rx1038_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1038_pos)
    .return (rx1038_cur)
  rx1038_fail:
.annotate "line", 484
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    rx1038_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("304_1258533478.31768") :method
.annotate "line", 484
    new $P1040, "ResizablePMCArray"
    push $P1040, "{"
    .return ($P1040)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("305_1258533478.31768") :method :outer("299_1258533478.31768")
.annotate "line", 484
    .local string rx1042_tgt
    .local int rx1042_pos
    .local int rx1042_off
    .local int rx1042_eos
    .local int rx1042_rep
    .local pmc rx1042_cur
    (rx1042_cur, rx1042_pos, rx1042_tgt, $I10) = self."!cursor_start"()
    rx1042_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1042_cur
    .local pmc match
    .lex "$/", match
    length rx1042_eos, rx1042_tgt
    set rx1042_off, 0
    lt $I10, 2, rx1042_start
    sub rx1042_off, $I10, 1
    substr rx1042_tgt, rx1042_tgt, rx1042_off
  rx1042_start:
.annotate "line", 494
  # rx enumcharlist negate=0 zerowidth
    ge rx1042_pos, rx1042_eos, rx1042_fail
    sub $I10, rx1042_pos, rx1042_off
    substr $S10, rx1042_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1042_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1042_cur."!cursor_pos"(rx1042_pos)
    $P10 = rx1042_cur."codeblock"()
    unless $P10, rx1042_fail
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1042_pos = $P10."pos"()
.annotate "line", 493
  # rx pass
    rx1042_cur."!cursor_pass"(rx1042_pos, "assertion:sym<{ }>")
    rx1042_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1042_pos)
    .return (rx1042_cur)
  rx1042_fail:
.annotate "line", 484
    (rx1042_rep, rx1042_pos, $I10, $P10) = rx1042_cur."!mark_fail"(0)
    lt rx1042_pos, -1, rx1042_done
    eq rx1042_pos, -1, rx1042_fail
    jump $I10
  rx1042_done:
    rx1042_cur."!cursor_fail"()
    rx1042_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1042_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("306_1258533478.31768") :method
.annotate "line", 484
    new $P1044, "ResizablePMCArray"
    push $P1044, "{"
    .return ($P1044)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("307_1258533478.31768") :method :outer("299_1258533478.31768")
.annotate "line", 484
    .const 'Sub' $P1053 = "309_1258533478.31768" 
    capture_lex $P1053
    .local string rx1046_tgt
    .local int rx1046_pos
    .local int rx1046_off
    .local int rx1046_eos
    .local int rx1046_rep
    .local pmc rx1046_cur
    (rx1046_cur, rx1046_pos, rx1046_tgt, $I10) = self."!cursor_start"()
    rx1046_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1046_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1046_cur
    .local pmc match
    .lex "$/", match
    length rx1046_eos, rx1046_tgt
    set rx1046_off, 0
    lt $I10, 2, rx1046_start
    sub rx1046_off, $I10, 1
    substr rx1046_tgt, rx1046_tgt, rx1046_off
  rx1046_start:
.annotate "line", 498
  # rx subcapture "longname"
    set_addr $I10, rxcap_1049_fail
    rx1046_cur."!mark_push"(0, rx1046_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1046_pos, rx1046_off
    find_not_cclass $I11, 8192, rx1046_tgt, $I10, rx1046_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1046_fail
    add rx1046_pos, rx1046_off, $I11
    set_addr $I10, rxcap_1049_fail
    ($I12, $I11) = rx1046_cur."!mark_peek"($I10)
    rx1046_cur."!cursor_pos"($I11)
    ($P10) = rx1046_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1046_pos, "")
    rx1046_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1049_done
  rxcap_1049_fail:
    goto rx1046_fail
  rxcap_1049_done:
.annotate "line", 505
  # rx rxquantr1050 ** 0..1
    set_addr $I1056, rxquantr1050_done
    rx1046_cur."!mark_push"(0, rx1046_pos, $I1056)
  rxquantr1050_loop:
  alt1051_0:
.annotate "line", 499
    set_addr $I10, alt1051_1
    rx1046_cur."!mark_push"(0, rx1046_pos, $I10)
.annotate "line", 500
  # rx subrule "before" subtype=zerowidth negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    .const 'Sub' $P1053 = "309_1258533478.31768" 
    capture_lex $P1053
    $P10 = rx1046_cur."before"($P1053)
    unless $P10, rx1046_fail
    goto alt1051_end
  alt1051_1:
    set_addr $I10, alt1051_2
    rx1046_cur."!mark_push"(0, rx1046_pos, $I10)
.annotate "line", 501
  # rx literal  "="
    add $I11, rx1046_pos, 1
    gt $I11, rx1046_eos, rx1046_fail
    sub $I11, rx1046_pos, rx1046_off
    substr $S10, rx1046_tgt, $I11, 1
    ne $S10, "=", rx1046_fail
    add rx1046_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    $P10 = rx1046_cur."assertion"()
    unless $P10, rx1046_fail
    rx1046_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1046_pos = $P10."pos"()
    goto alt1051_end
  alt1051_2:
    set_addr $I10, alt1051_3
    rx1046_cur."!mark_push"(0, rx1046_pos, $I10)
.annotate "line", 502
  # rx literal  ":"
    add $I11, rx1046_pos, 1
    gt $I11, rx1046_eos, rx1046_fail
    sub $I11, rx1046_pos, rx1046_off
    substr $S10, rx1046_tgt, $I11, 1
    ne $S10, ":", rx1046_fail
    add rx1046_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    $P10 = rx1046_cur."arglist"()
    unless $P10, rx1046_fail
    rx1046_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1046_pos = $P10."pos"()
    goto alt1051_end
  alt1051_3:
    set_addr $I10, alt1051_4
    rx1046_cur."!mark_push"(0, rx1046_pos, $I10)
.annotate "line", 503
  # rx literal  "("
    add $I11, rx1046_pos, 1
    gt $I11, rx1046_eos, rx1046_fail
    sub $I11, rx1046_pos, rx1046_off
    substr $S10, rx1046_tgt, $I11, 1
    ne $S10, "(", rx1046_fail
    add rx1046_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    $P10 = rx1046_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1046_fail
    rx1046_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1046_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1046_pos, 1
    gt $I11, rx1046_eos, rx1046_fail
    sub $I11, rx1046_pos, rx1046_off
    substr $S10, rx1046_tgt, $I11, 1
    ne $S10, ")", rx1046_fail
    add rx1046_pos, 1
    goto alt1051_end
  alt1051_4:
.annotate "line", 504
  # rx subrule "normspace" subtype=method negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    $P10 = rx1046_cur."normspace"()
    unless $P10, rx1046_fail
    rx1046_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1046_cur."!cursor_pos"(rx1046_pos)
    $P10 = rx1046_cur."nibbler"()
    unless $P10, rx1046_fail
    rx1046_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1046_pos = $P10."pos"()
  alt1051_end:
.annotate "line", 505
    (rx1046_rep) = rx1046_cur."!mark_commit"($I1056)
  rxquantr1050_done:
.annotate "line", 497
  # rx pass
    rx1046_cur."!cursor_pass"(rx1046_pos, "assertion:sym<name>")
    rx1046_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1046_pos)
    .return (rx1046_cur)
  rx1046_fail:
.annotate "line", 484
    (rx1046_rep, rx1046_pos, $I10, $P10) = rx1046_cur."!mark_fail"(0)
    lt rx1046_pos, -1, rx1046_done
    eq rx1046_pos, -1, rx1046_fail
    jump $I10
  rx1046_done:
    rx1046_cur."!cursor_fail"()
    rx1046_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1046_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("308_1258533478.31768") :method
.annotate "line", 484
    new $P1048, "ResizablePMCArray"
    push $P1048, ""
    .return ($P1048)
.end


.namespace ["NQP";"Regex"]
.sub "_block1052"  :anon :subid("309_1258533478.31768") :method :outer("307_1258533478.31768")
.annotate "line", 500
    .local string rx1054_tgt
    .local int rx1054_pos
    .local int rx1054_off
    .local int rx1054_eos
    .local int rx1054_rep
    .local pmc rx1054_cur
    (rx1054_cur, rx1054_pos, rx1054_tgt, $I10) = self."!cursor_start"()
    rx1054_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1054_cur
    .local pmc match
    .lex "$/", match
    length rx1054_eos, rx1054_tgt
    set rx1054_off, 0
    lt $I10, 2, rx1054_start
    sub rx1054_off, $I10, 1
    substr rx1054_tgt, rx1054_tgt, rx1054_off
  rx1054_start:
    ge rx1054_pos, 0, rxscan1055_done
  rxscan1055_loop:
    ($P10) = rx1054_cur."from"()
    inc $P10
    set rx1054_pos, $P10
    ge rx1054_pos, rx1054_eos, rxscan1055_done
    set_addr $I10, rxscan1055_loop
    rx1054_cur."!mark_push"(0, rx1054_pos, $I10)
  rxscan1055_done:
  # rx literal  ">"
    add $I11, rx1054_pos, 1
    gt $I11, rx1054_eos, rx1054_fail
    sub $I11, rx1054_pos, rx1054_off
    substr $S10, rx1054_tgt, $I11, 1
    ne $S10, ">", rx1054_fail
    add rx1054_pos, 1
  # rx pass
    rx1054_cur."!cursor_pass"(rx1054_pos, "")
    rx1054_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1054_pos)
    .return (rx1054_cur)
  rx1054_fail:
    (rx1054_rep, rx1054_pos, $I10, $P10) = rx1054_cur."!mark_fail"(0)
    lt rx1054_pos, -1, rx1054_done
    eq rx1054_pos, -1, rx1054_fail
    jump $I10
  rx1054_done:
    rx1054_cur."!cursor_fail"()
    rx1054_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1054_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("310_1258533478.31768") :method :outer("299_1258533478.31768")
.annotate "line", 484
    .local string rx1058_tgt
    .local int rx1058_pos
    .local int rx1058_off
    .local int rx1058_eos
    .local int rx1058_rep
    .local pmc rx1058_cur
    (rx1058_cur, rx1058_pos, rx1058_tgt, $I10) = self."!cursor_start"()
    rx1058_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1058_cur
    .local pmc match
    .lex "$/", match
    length rx1058_eos, rx1058_tgt
    set rx1058_off, 0
    lt $I10, 2, rx1058_start
    sub rx1058_off, $I10, 1
    substr rx1058_tgt, rx1058_tgt, rx1058_off
  rx1058_start:
.annotate "line", 510
  # rx subrule "LANG" subtype=capture negate=
    rx1058_cur."!cursor_pos"(rx1058_pos)
    $P10 = rx1058_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1058_fail
    rx1058_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1058_pos = $P10."pos"()
.annotate "line", 509
  # rx pass
    rx1058_cur."!cursor_pass"(rx1058_pos, "codeblock")
    rx1058_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1058_pos)
    .return (rx1058_cur)
  rx1058_fail:
.annotate "line", 484
    (rx1058_rep, rx1058_pos, $I10, $P10) = rx1058_cur."!mark_fail"(0)
    lt rx1058_pos, -1, rx1058_done
    eq rx1058_pos, -1, rx1058_fail
    jump $I10
  rx1058_done:
    rx1058_cur."!cursor_fail"()
    rx1058_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1058_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("311_1258533478.31768") :method
.annotate "line", 484
    $P1060 = self."!PREFIX__!subrule"("block", "")
    new $P1061, "ResizablePMCArray"
    push $P1061, $P1060
    .return ($P1061)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258533497.4656")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1907 = $P14()
.annotate "line", 1
    .return ($P1907)
.end


.namespace []
.sub "" :load :init :subid("post115") :outer("10_1258533497.4656")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258533497.4656" 
    .local pmc block
    set block, $P12
    $P1908 = get_root_global ["parrot"], "P6metaclass"
    $P1908."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258533497.4656") :outer("10_1258533497.4656")
.annotate "line", 3
    .const 'Sub' $P1903 = "114_1258533497.4656" 
    capture_lex $P1903
    get_hll_global $P1839, ["NQP";"RegexActions"], "_block1838" 
    capture_lex $P1839
    .const 'Sub' $P1826 = "108_1258533497.4656" 
    capture_lex $P1826
    .const 'Sub' $P1816 = "107_1258533497.4656" 
    capture_lex $P1816
    .const 'Sub' $P1806 = "106_1258533497.4656" 
    capture_lex $P1806
    .const 'Sub' $P1796 = "105_1258533497.4656" 
    capture_lex $P1796
    .const 'Sub' $P1782 = "104_1258533497.4656" 
    capture_lex $P1782
    .const 'Sub' $P1772 = "103_1258533497.4656" 
    capture_lex $P1772
    .const 'Sub' $P1758 = "102_1258533497.4656" 
    capture_lex $P1758
    .const 'Sub' $P1748 = "101_1258533497.4656" 
    capture_lex $P1748
    .const 'Sub' $P1738 = "100_1258533497.4656" 
    capture_lex $P1738
    .const 'Sub' $P1728 = "99_1258533497.4656" 
    capture_lex $P1728
    .const 'Sub' $P1718 = "98_1258533497.4656" 
    capture_lex $P1718
    .const 'Sub' $P1708 = "97_1258533497.4656" 
    capture_lex $P1708
    .const 'Sub' $P1680 = "96_1258533497.4656" 
    capture_lex $P1680
    .const 'Sub' $P1670 = "95_1258533497.4656" 
    capture_lex $P1670
    .const 'Sub' $P1658 = "94_1258533497.4656" 
    capture_lex $P1658
    .const 'Sub' $P1646 = "93_1258533497.4656" 
    capture_lex $P1646
    .const 'Sub' $P1634 = "92_1258533497.4656" 
    capture_lex $P1634
    .const 'Sub' $P1624 = "91_1258533497.4656" 
    capture_lex $P1624
    .const 'Sub' $P1595 = "90_1258533497.4656" 
    capture_lex $P1595
    .const 'Sub' $P1571 = "89_1258533497.4656" 
    capture_lex $P1571
    .const 'Sub' $P1561 = "88_1258533497.4656" 
    capture_lex $P1561
    .const 'Sub' $P1534 = "87_1258533497.4656" 
    capture_lex $P1534
    .const 'Sub' $P1516 = "86_1258533497.4656" 
    capture_lex $P1516
    .const 'Sub' $P1506 = "85_1258533497.4656" 
    capture_lex $P1506
    .const 'Sub' $P1422 = "82_1258533497.4656" 
    capture_lex $P1422
    .const 'Sub' $P1412 = "81_1258533497.4656" 
    capture_lex $P1412
    .const 'Sub' $P1383 = "80_1258533497.4656" 
    capture_lex $P1383
    .const 'Sub' $P1350 = "79_1258533497.4656" 
    capture_lex $P1350
    .const 'Sub' $P1334 = "78_1258533497.4656" 
    capture_lex $P1334
    .const 'Sub' $P1325 = "77_1258533497.4656" 
    capture_lex $P1325
    .const 'Sub' $P1300 = "76_1258533497.4656" 
    capture_lex $P1300
    .const 'Sub' $P1196 = "73_1258533497.4656" 
    capture_lex $P1196
    .const 'Sub' $P1179 = "72_1258533497.4656" 
    capture_lex $P1179
    .const 'Sub' $P1159 = "71_1258533497.4656" 
    capture_lex $P1159
    .const 'Sub' $P1075 = "70_1258533497.4656" 
    capture_lex $P1075
    .const 'Sub' $P1051 = "68_1258533497.4656" 
    capture_lex $P1051
    .const 'Sub' $P1017 = "66_1258533497.4656" 
    capture_lex $P1017
    .const 'Sub' $P971 = "64_1258533497.4656" 
    capture_lex $P971
    .const 'Sub' $P961 = "63_1258533497.4656" 
    capture_lex $P961
    .const 'Sub' $P951 = "62_1258533497.4656" 
    capture_lex $P951
    .const 'Sub' $P880 = "60_1258533497.4656" 
    capture_lex $P880
    .const 'Sub' $P863 = "59_1258533497.4656" 
    capture_lex $P863
    .const 'Sub' $P853 = "58_1258533497.4656" 
    capture_lex $P853
    .const 'Sub' $P843 = "57_1258533497.4656" 
    capture_lex $P843
    .const 'Sub' $P833 = "56_1258533497.4656" 
    capture_lex $P833
    .const 'Sub' $P809 = "55_1258533497.4656" 
    capture_lex $P809
    .const 'Sub' $P756 = "54_1258533497.4656" 
    capture_lex $P756
    .const 'Sub' $P746 = "53_1258533497.4656" 
    capture_lex $P746
    .const 'Sub' $P660 = "51_1258533497.4656" 
    capture_lex $P660
    .const 'Sub' $P634 = "50_1258533497.4656" 
    capture_lex $P634
    .const 'Sub' $P624 = "49_1258533497.4656" 
    capture_lex $P624
    .const 'Sub' $P614 = "48_1258533497.4656" 
    capture_lex $P614
    .const 'Sub' $P604 = "47_1258533497.4656" 
    capture_lex $P604
    .const 'Sub' $P594 = "46_1258533497.4656" 
    capture_lex $P594
    .const 'Sub' $P584 = "45_1258533497.4656" 
    capture_lex $P584
    .const 'Sub' $P574 = "44_1258533497.4656" 
    capture_lex $P574
    .const 'Sub' $P564 = "43_1258533497.4656" 
    capture_lex $P564
    .const 'Sub' $P554 = "42_1258533497.4656" 
    capture_lex $P554
    .const 'Sub' $P544 = "41_1258533497.4656" 
    capture_lex $P544
    .const 'Sub' $P534 = "40_1258533497.4656" 
    capture_lex $P534
    .const 'Sub' $P524 = "39_1258533497.4656" 
    capture_lex $P524
    .const 'Sub' $P514 = "38_1258533497.4656" 
    capture_lex $P514
    .const 'Sub' $P496 = "37_1258533497.4656" 
    capture_lex $P496
    .const 'Sub' $P480 = "36_1258533497.4656" 
    capture_lex $P480
    .const 'Sub' $P467 = "35_1258533497.4656" 
    capture_lex $P467
    .const 'Sub' $P441 = "34_1258533497.4656" 
    capture_lex $P441
    .const 'Sub' $P405 = "33_1258533497.4656" 
    capture_lex $P405
    .const 'Sub' $P388 = "32_1258533497.4656" 
    capture_lex $P388
    .const 'Sub' $P374 = "31_1258533497.4656" 
    capture_lex $P374
    .const 'Sub' $P319 = "29_1258533497.4656" 
    capture_lex $P319
    .const 'Sub' $P306 = "28_1258533497.4656" 
    capture_lex $P306
    .const 'Sub' $P287 = "27_1258533497.4656" 
    capture_lex $P287
    .const 'Sub' $P277 = "26_1258533497.4656" 
    capture_lex $P277
    .const 'Sub' $P267 = "25_1258533497.4656" 
    capture_lex $P267
    .const 'Sub' $P251 = "24_1258533497.4656" 
    capture_lex $P251
    .const 'Sub' $P173 = "22_1258533497.4656" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258533497.4656" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258533497.4656" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258533497.4656" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258533497.4656" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258533497.4656" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258533497.4656" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258533497.4656" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_118
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_118:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258533497.4656" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258533497.4656" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258533497.4656" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 653
    get_hll_global $P1839, ["NQP";"RegexActions"], "_block1838" 
    capture_lex $P1839
    $P1901 = $P1839()
.annotate "line", 3
    .return ($P1901)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post116") :outer("11_1258533497.4656")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1903 = "114_1258533497.4656" 
    capture_lex $P1903
    $P1903()
    $P1906 = get_root_global ["parrot"], "P6metaclass"
    $P1906."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1902"  :anon :subid("114_1258533497.4656") :outer("11_1258533497.4656")
.annotate "line", 6
    get_global $P1904, "@BLOCK"
    unless_null $P1904, vivify_117
    new $P1904, "ResizablePMCArray"
    set_global "@BLOCK", $P1904
  vivify_117:
 $P1905 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1905
.annotate "line", 5
    .return ($P1905)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258533497.4656") :outer("11_1258533497.4656")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_119
    new $P20, "ResizablePMCArray"
  vivify_119:
    set $P21, $P20[1]
    unless_null $P21, vivify_120
    new $P21, "Undef"
  vivify_120:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_121
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_121:
    set $P23[1], $P22
    find_lex $P24, "$xblock"
.annotate "line", 9
    .return ($P24)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "block_immediate"  :subid("13_1258533497.4656") :outer("11_1258533497.4656")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258533497.4656" 
    capture_lex $P35
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$block", param_29
.annotate "line", 15
    find_lex $P30, "$block"
    $P30."blocktype"("immediate")
.annotate "line", 16
    find_lex $P32, "$block"
    $P33 = $P32."symtable"()
    if $P33, unless_31_end
    .const 'Sub' $P35 = "14_1258533497.4656" 
    capture_lex $P35
    $P35()
  unless_31_end:
    find_lex $P55, "$block"
.annotate "line", 14
    .return ($P55)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block34"  :anon :subid("14_1258533497.4656") :outer("13_1258533497.4656")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258533497.4656" 
    capture_lex $P46
.annotate "line", 17
    new $P36, "Undef"
    .lex "$stmts", $P36
    get_hll_global $P37, ["PAST"], "Stmts"
    find_lex $P38, "$block"
    $P39 = $P37."new"($P38 :named("node"))
    store_lex "$stmts", $P39
.annotate "line", 18
    find_lex $P41, "$block"
    $P42 = $P41."list"()
    defined $I43, $P42
    unless $I43, for_undef_122
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1258533497.4656" 
    capture_lex $P46
    $P46($P44)
  loop51_next:
    goto loop51_test
  loop51_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, 'type'
    eq $P53, 65, loop51_next
    eq $P53, 67, loop51_redo
  loop51_done:
    pop_eh 
  for_undef_122:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1258533497.4656") :outer("14_1258533497.4656")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258533497.4656") :outer("11_1258533497.4656")
    .param pmc param_60
.annotate "line", 24
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "$sigil", param_60
.annotate "line", 25
    find_lex $P63, "$sigil"
    set $S64, $P63
    iseq $I65, $S64, "%"
    if $I65, if_62
.annotate "line", 27
    find_lex $P69, "$sigil"
    set $S70, $P69
    iseq $I71, $S70, "@"
    if $I71, if_68
    new $P73, "String"
    assign $P73, "Undef"
    set $P67, $P73
    goto if_68_end
  if_68:
    new $P72, "String"
    assign $P72, "ResizablePMCArray"
    set $P67, $P72
  if_68_end:
    set $P61, $P67
.annotate "line", 25
    goto if_62_end
  if_62:
    new $P66, "String"
    assign $P66, "Hash"
    set $P61, $P66
  if_62_end:
.annotate "line", 24
    .return ($P61)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("17_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_82
.annotate "line", 30
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    .lex "$/", param_82
    find_lex $P83, "$/"
    find_lex $P84, "$/"
    unless_null $P84, vivify_123
    new $P84, "Hash"
  vivify_123:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_124
    new $P85, "Undef"
  vivify_124:
    $P86 = $P85."ast"()
    $P87 = $P83."!make"($P86)
    .return ($P87)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P88, exception, "payload"
    .return ($P88)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("18_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_92
.annotate "line", 32
    new $P91, 'ExceptionHandler'
    set_addr $P91, control_90
    $P91."handle_types"(58)
    push_eh $P91
    .lex "self", self
    .lex "$/", param_92
.annotate "line", 33
    find_lex $P95, "$/"
    unless_null $P95, vivify_125
    new $P95, "Hash"
  vivify_125:
    set $P96, $P95["sym"]
    unless_null $P96, vivify_126
    new $P96, "Undef"
  vivify_126:
    if $P96, if_94
    set $P93, $P96
    goto if_94_end
  if_94:
    find_lex $P97, "$/"
    find_lex $P98, "$/"
    unless_null $P98, vivify_127
    new $P98, "Hash"
  vivify_127:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_128
    new $P99, "Undef"
  vivify_128:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_129
    new $P103, "Hash"
  vivify_129:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_130
    new $P104, "ResizablePMCArray"
  vivify_130:
    set $P105, $P104[0]
    unless_null $P105, vivify_131
    new $P105, "Undef"
  vivify_131:
    set $S106, $P105
    concat $P107, $P102, $S106
    concat $P108, $P107, ">"
    $P109 = $P97."!make"($P108)
    set $P93, $P109
  if_94_end:
.annotate "line", 32
    .return ($P93)
  control_90:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("19_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_114
.annotate "line", 36
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$/", param_114
.annotate "line", 37
    new $P115, "Undef"
    .lex "$past", $P115
.annotate "line", 38
    new $P116, "Undef"
    .lex "$BLOCK", $P116
.annotate "line", 37
    find_lex $P117, "$/"
    unless_null $P117, vivify_132
    new $P117, "Hash"
  vivify_132:
    set $P118, $P117["statementlist"]
    unless_null $P118, vivify_133
    new $P118, "Undef"
  vivify_133:
    $P119 = $P118."ast"()
    store_lex "$past", $P119
.annotate "line", 38
    get_global $P120, "@BLOCK"
    $P121 = $P120."shift"()
    store_lex "$BLOCK", $P121
.annotate "line", 39
    find_lex $P122, "$BLOCK"
    find_lex $P123, "$past"
    $P122."push"($P123)
.annotate "line", 40
    find_lex $P124, "$BLOCK"
    find_lex $P125, "$/"
    $P124."node"($P125)
.annotate "line", 41
    find_lex $P126, "$/"
    find_lex $P127, "$BLOCK"
    $P128 = $P126."!make"($P127)
.annotate "line", 36
    .return ($P128)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("20_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258533497.4656" 
    capture_lex $P147
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "$/", param_133
.annotate "line", 45
    new $P134, "Undef"
    .lex "$past", $P134
    get_hll_global $P135, ["PAST"], "Stmts"
    find_lex $P136, "$/"
    $P137 = $P135."new"($P136 :named("node"))
    store_lex "$past", $P137
.annotate "line", 46
    find_lex $P139, "$/"
    unless_null $P139, vivify_134
    new $P139, "Hash"
  vivify_134:
    set $P140, $P139["statement"]
    unless_null $P140, vivify_135
    new $P140, "Undef"
  vivify_135:
    unless $P140, if_138_end
.annotate "line", 47
    find_lex $P142, "$/"
    unless_null $P142, vivify_136
    new $P142, "Hash"
  vivify_136:
    set $P143, $P142["statement"]
    unless_null $P143, vivify_137
    new $P143, "Undef"
  vivify_137:
    defined $I144, $P143
    unless $I144, for_undef_138
    iter $P141, $P143
    new $P167, 'ExceptionHandler'
    set_addr $P167, loop166_handler
    $P167."handle_types"(65, 67, 66)
    push_eh $P167
  loop166_test:
    unless $P141, loop166_done
    shift $P145, $P141
  loop166_redo:
    .const 'Sub' $P147 = "21_1258533497.4656" 
    capture_lex $P147
    $P147($P145)
  loop166_next:
    goto loop166_test
  loop166_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, 'type'
    eq $P168, 65, loop166_next
    eq $P168, 67, loop166_redo
  loop166_done:
    pop_eh 
  for_undef_138:
  if_138_end:
.annotate "line", 55
    find_lex $P169, "$/"
    find_lex $P170, "$past"
    $P171 = $P169."!make"($P170)
.annotate "line", 44
    .return ($P171)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P172, exception, "payload"
    .return ($P172)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block146"  :anon :subid("21_1258533497.4656") :outer("20_1258533497.4656")
    .param pmc param_149
.annotate "line", 48
    new $P148, "Undef"
    .lex "$ast", $P148
    .lex "$_", param_149
    find_lex $P150, "$_"
    $P151 = $P150."ast"()
    store_lex "$ast", $P151
.annotate "line", 49
    find_lex $P155, "$ast"
    get_hll_global $P156, ["PAST"], "Block"
    $P157 = $P155."isa"($P156)
    if $P157, if_154
    set $P153, $P157
    goto if_154_end
  if_154:
    find_lex $P158, "$ast"
    $P159 = $P158."blocktype"()
    isfalse $I160, $P159
    new $P153, 'Integer'
    set $P153, $I160
  if_154_end:
    unless $P153, if_152_end
.annotate "line", 50
    find_lex $P161, "$ast"
    $P162 = "block_immediate"($P161)
    store_lex "$ast", $P162
  if_152_end:
.annotate "line", 52
    find_lex $P163, "$past"
    find_lex $P164, "$ast"
    $P165 = $P163."push"($P164)
.annotate "line", 47
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("22_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1258533497.4656" 
    capture_lex $P185
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
    if has_param_177, optparam_139
    new $P178, "Undef"
    set param_177, $P178
  optparam_139:
    .lex "$key", param_177
.annotate "line", 59
    new $P179, "Undef"
    .lex "$past", $P179
.annotate "line", 58
    find_lex $P180, "$past"
.annotate "line", 60
    find_lex $P182, "$/"
    unless_null $P182, vivify_140
    new $P182, "Hash"
  vivify_140:
    set $P183, $P182["EXPR"]
    unless_null $P183, vivify_141
    new $P183, "Undef"
  vivify_141:
    if $P183, if_181
.annotate "line", 74
    find_lex $P241, "$/"
    unless_null $P241, vivify_142
    new $P241, "Hash"
  vivify_142:
    set $P242, $P241["statement_control"]
    unless_null $P242, vivify_143
    new $P242, "Undef"
  vivify_143:
    if $P242, if_240
.annotate "line", 75
    new $P246, "Integer"
    assign $P246, 0
    store_lex "$past", $P246
    goto if_240_end
  if_240:
.annotate "line", 74
    find_lex $P243, "$/"
    unless_null $P243, vivify_144
    new $P243, "Hash"
  vivify_144:
    set $P244, $P243["statement_control"]
    unless_null $P244, vivify_145
    new $P244, "Undef"
  vivify_145:
    $P245 = $P244."ast"()
    store_lex "$past", $P245
  if_240_end:
    goto if_181_end
  if_181:
.annotate "line", 60
    .const 'Sub' $P185 = "23_1258533497.4656" 
    capture_lex $P185
    $P185()
  if_181_end:
.annotate "line", 76
    find_lex $P247, "$/"
    find_lex $P248, "$past"
    $P249 = $P247."!make"($P248)
.annotate "line", 58
    .return ($P249)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block184"  :anon :subid("23_1258533497.4656") :outer("22_1258533497.4656")
.annotate "line", 61
    new $P186, "Undef"
    .lex "$mc", $P186
.annotate "line", 62
    new $P187, "Undef"
    .lex "$ml", $P187
.annotate "line", 61
    find_lex $P188, "$/"
    unless_null $P188, vivify_146
    new $P188, "Hash"
  vivify_146:
    set $P189, $P188["statement_mod_cond"]
    unless_null $P189, vivify_147
    new $P189, "ResizablePMCArray"
  vivify_147:
    set $P190, $P189[0]
    unless_null $P190, vivify_148
    new $P190, "Undef"
  vivify_148:
    store_lex "$mc", $P190
.annotate "line", 62
    find_lex $P191, "$/"
    unless_null $P191, vivify_149
    new $P191, "Hash"
  vivify_149:
    set $P192, $P191["statement_mod_loop"]
    unless_null $P192, vivify_150
    new $P192, "ResizablePMCArray"
  vivify_150:
    set $P193, $P192[0]
    unless_null $P193, vivify_151
    new $P193, "Undef"
  vivify_151:
    store_lex "$ml", $P193
.annotate "line", 63
    find_lex $P196, "$mc"
    if $P196, if_195
.annotate "line", 68
    find_lex $P224, "$ml"
    if $P224, if_223
.annotate "line", 71
    find_lex $P237, "$/"
    unless_null $P237, vivify_152
    new $P237, "Hash"
  vivify_152:
    set $P238, $P237["EXPR"]
    unless_null $P238, vivify_153
    new $P238, "Undef"
  vivify_153:
    $P239 = $P238."ast"()
    store_lex "$past", $P239
.annotate "line", 70
    set $P222, $P239
.annotate "line", 68
    goto if_223_end
  if_223:
.annotate "line", 69
    get_hll_global $P225, ["PAST"], "Op"
    find_lex $P226, "$ml"
    unless_null $P226, vivify_154
    new $P226, "Hash"
  vivify_154:
    set $P227, $P226["cond"]
    unless_null $P227, vivify_155
    new $P227, "Undef"
  vivify_155:
    $P228 = $P227."ast"()
    find_lex $P229, "$/"
    unless_null $P229, vivify_156
    new $P229, "Hash"
  vivify_156:
    set $P230, $P229["EXPR"]
    unless_null $P230, vivify_157
    new $P230, "Undef"
  vivify_157:
    $P231 = $P230."ast"()
    find_lex $P232, "$ml"
    unless_null $P232, vivify_158
    new $P232, "Hash"
  vivify_158:
    set $P233, $P232["sym"]
    unless_null $P233, vivify_159
    new $P233, "Undef"
  vivify_159:
    set $S234, $P233
    find_lex $P235, "$/"
    $P236 = $P225."new"($P228, $P231, $S234 :named("pasttype"), $P235 :named("node"))
    store_lex "$past", $P236
.annotate "line", 68
    set $P222, $P236
  if_223_end:
    set $P194, $P222
.annotate "line", 63
    goto if_195_end
  if_195:
.annotate "line", 64
    get_hll_global $P197, ["PAST"], "Op"
    find_lex $P198, "$mc"
    unless_null $P198, vivify_160
    new $P198, "Hash"
  vivify_160:
    set $P199, $P198["cond"]
    unless_null $P199, vivify_161
    new $P199, "Undef"
  vivify_161:
    $P200 = $P199."ast"()
    find_lex $P201, "$/"
    unless_null $P201, vivify_162
    new $P201, "Hash"
  vivify_162:
    set $P202, $P201["EXPR"]
    unless_null $P202, vivify_163
    new $P202, "Undef"
  vivify_163:
    $P203 = $P202."ast"()
    find_lex $P204, "$mc"
    unless_null $P204, vivify_164
    new $P204, "Hash"
  vivify_164:
    set $P205, $P204["sym"]
    unless_null $P205, vivify_165
    new $P205, "Undef"
  vivify_165:
    set $S206, $P205
    find_lex $P207, "$/"
    $P208 = $P197."new"($P200, $P203, $S206 :named("pasttype"), $P207 :named("node"))
    store_lex "$past", $P208
.annotate "line", 65
    find_lex $P211, "$ml"
    if $P211, if_210
    set $P209, $P211
    goto if_210_end
  if_210:
.annotate "line", 66
    get_hll_global $P212, ["PAST"], "Op"
    find_lex $P213, "$ml"
    unless_null $P213, vivify_166
    new $P213, "Hash"
  vivify_166:
    set $P214, $P213["cond"]
    unless_null $P214, vivify_167
    new $P214, "Undef"
  vivify_167:
    $P215 = $P214."ast"()
    find_lex $P216, "$past"
    find_lex $P217, "$ml"
    unless_null $P217, vivify_168
    new $P217, "Hash"
  vivify_168:
    set $P218, $P217["sym"]
    unless_null $P218, vivify_169
    new $P218, "Undef"
  vivify_169:
    set $S219, $P218
    find_lex $P220, "$/"
    $P221 = $P212."new"($P215, $P216, $S219 :named("pasttype"), $P220 :named("node"))
    store_lex "$past", $P221
.annotate "line", 65
    set $P209, $P221
  if_210_end:
.annotate "line", 63
    set $P194, $P209
  if_195_end:
.annotate "line", 60
    .return ($P194)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("24_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_254
.annotate "line", 79
    new $P253, 'ExceptionHandler'
    set_addr $P253, control_252
    $P253."handle_types"(58)
    push_eh $P253
    .lex "self", self
    .lex "$/", param_254
.annotate "line", 80
    find_lex $P255, "$/"
    get_hll_global $P256, ["PAST"], "Op"
    find_lex $P257, "$/"
    unless_null $P257, vivify_170
    new $P257, "Hash"
  vivify_170:
    set $P258, $P257["EXPR"]
    unless_null $P258, vivify_171
    new $P258, "Undef"
  vivify_171:
    $P259 = $P258."ast"()
    find_lex $P260, "$/"
    unless_null $P260, vivify_172
    new $P260, "Hash"
  vivify_172:
    set $P261, $P260["pblock"]
    unless_null $P261, vivify_173
    new $P261, "Undef"
  vivify_173:
    $P262 = $P261."ast"()
    find_lex $P263, "$/"
    $P264 = $P256."new"($P259, $P262, "if" :named("pasttype"), $P263 :named("node"))
    $P265 = $P255."!make"($P264)
.annotate "line", 79
    .return ($P265)
  control_252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("25_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_270
.annotate "line", 83
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
    .lex "$/", param_270
.annotate "line", 84
    find_lex $P271, "$/"
    find_lex $P272, "$/"
    unless_null $P272, vivify_174
    new $P272, "Hash"
  vivify_174:
    set $P273, $P272["blockoid"]
    unless_null $P273, vivify_175
    new $P273, "Undef"
  vivify_175:
    $P274 = $P273."ast"()
    $P275 = $P271."!make"($P274)
.annotate "line", 83
    .return ($P275)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, "payload"
    .return ($P276)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("26_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_280
.annotate "line", 87
    new $P279, 'ExceptionHandler'
    set_addr $P279, control_278
    $P279."handle_types"(58)
    push_eh $P279
    .lex "self", self
    .lex "$/", param_280
.annotate "line", 88
    find_lex $P281, "$/"
    find_lex $P282, "$/"
    unless_null $P282, vivify_176
    new $P282, "Hash"
  vivify_176:
    set $P283, $P282["blockoid"]
    unless_null $P283, vivify_177
    new $P283, "Undef"
  vivify_177:
    $P284 = $P283."ast"()
    $P285 = $P281."!make"($P284)
.annotate "line", 87
    .return ($P285)
  control_278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P286, exception, "payload"
    .return ($P286)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("27_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_290
.annotate "line", 91
    new $P289, 'ExceptionHandler'
    set_addr $P289, control_288
    $P289."handle_types"(58)
    push_eh $P289
    .lex "self", self
    .lex "$/", param_290
.annotate "line", 92
    new $P291, "Undef"
    .lex "$past", $P291
.annotate "line", 93
    new $P292, "Undef"
    .lex "$BLOCK", $P292
.annotate "line", 92
    find_lex $P293, "$/"
    unless_null $P293, vivify_178
    new $P293, "Hash"
  vivify_178:
    set $P294, $P293["statementlist"]
    unless_null $P294, vivify_179
    new $P294, "Undef"
  vivify_179:
    $P295 = $P294."ast"()
    store_lex "$past", $P295
.annotate "line", 93
    get_global $P296, "@BLOCK"
    $P297 = $P296."shift"()
    store_lex "$BLOCK", $P297
.annotate "line", 94
    find_lex $P298, "$BLOCK"
    find_lex $P299, "$past"
    $P298."push"($P299)
.annotate "line", 95
    find_lex $P300, "$BLOCK"
    find_lex $P301, "$/"
    $P300."node"($P301)
.annotate "line", 96
    find_lex $P302, "$/"
    find_lex $P303, "$BLOCK"
    $P304 = $P302."!make"($P303)
.annotate "line", 91
    .return ($P304)
  control_288:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, "payload"
    .return ($P305)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("28_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_309
.annotate "line", 99
    new $P308, 'ExceptionHandler'
    set_addr $P308, control_307
    $P308."handle_types"(58)
    push_eh $P308
    .lex "self", self
    .lex "$/", param_309
.annotate "line", 100
    get_global $P310, "@BLOCK"
    unless_null $P310, vivify_180
    new $P310, "ResizablePMCArray"
    set_global "@BLOCK", $P310
  vivify_180:
.annotate "line", 99
    get_global $P311, "@BLOCK"
.annotate "line", 101
    get_global $P312, "@BLOCK"
    get_hll_global $P313, ["PAST"], "Block"
    get_hll_global $P314, ["PAST"], "Stmts"
    $P315 = $P314."new"()
    $P316 = $P313."new"($P315)
    $P317 = $P312."unshift"($P316)
.annotate "line", 99
    .return ($P317)
  control_307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("29_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_322
.annotate "line", 106
    .const 'Sub' $P352 = "30_1258533497.4656" 
    capture_lex $P352
    new $P321, 'ExceptionHandler'
    set_addr $P321, control_320
    $P321."handle_types"(58)
    push_eh $P321
    .lex "self", self
    .lex "$/", param_322
.annotate "line", 107
    new $P323, "Undef"
    .lex "$count", $P323
.annotate "line", 108
    new $P324, "Undef"
    .lex "$past", $P324
.annotate "line", 107
    find_lex $P325, "$/"
    unless_null $P325, vivify_181
    new $P325, "Hash"
  vivify_181:
    set $P326, $P325["xblock"]
    unless_null $P326, vivify_182
    new $P326, "Undef"
  vivify_182:
    set $N327, $P326
    new $P328, 'Float'
    set $P328, $N327
    sub $P329, $P328, 1
    store_lex "$count", $P329
.annotate "line", 108
    find_lex $P330, "$count"
    set $I331, $P330
    find_lex $P332, "$/"
    unless_null $P332, vivify_183
    new $P332, "Hash"
  vivify_183:
    set $P333, $P332["xblock"]
    unless_null $P333, vivify_184
    new $P333, "ResizablePMCArray"
  vivify_184:
    set $P334, $P333[$I331]
    unless_null $P334, vivify_185
    new $P334, "Undef"
  vivify_185:
    $P335 = $P334."ast"()
    $P336 = "xblock_immediate"($P335)
    store_lex "$past", $P336
.annotate "line", 109
    find_lex $P338, "$/"
    unless_null $P338, vivify_186
    new $P338, "Hash"
  vivify_186:
    set $P339, $P338["else"]
    unless_null $P339, vivify_187
    new $P339, "Undef"
  vivify_187:
    unless $P339, if_337_end
.annotate "line", 110
    find_lex $P340, "$past"
    find_lex $P341, "$/"
    unless_null $P341, vivify_188
    new $P341, "Hash"
  vivify_188:
    set $P342, $P341["else"]
    unless_null $P342, vivify_189
    new $P342, "ResizablePMCArray"
  vivify_189:
    set $P343, $P342[0]
    unless_null $P343, vivify_190
    new $P343, "Undef"
  vivify_190:
    $P344 = $P343."ast"()
    $P345 = "block_immediate"($P344)
    $P340."push"($P345)
  if_337_end:
.annotate "line", 113
    new $P368, 'ExceptionHandler'
    set_addr $P368, loop367_handler
    $P368."handle_types"(65, 67, 66)
    push_eh $P368
  loop367_test:
    find_lex $P346, "$count"
    set $N347, $P346
    new $P348, "Integer"
    assign $P348, 0
    set $N349, $P348
    isgt $I350, $N347, $N349
    unless $I350, loop367_done
  loop367_redo:
    .const 'Sub' $P352 = "30_1258533497.4656" 
    capture_lex $P352
    $P352()
  loop367_next:
    goto loop367_test
  loop367_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, 'type'
    eq $P369, 65, loop367_next
    eq $P369, 67, loop367_redo
  loop367_done:
    pop_eh 
.annotate "line", 119
    find_lex $P370, "$/"
    find_lex $P371, "$past"
    $P372 = $P370."!make"($P371)
.annotate "line", 106
    .return ($P372)
  control_320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block351"  :anon :subid("30_1258533497.4656") :outer("29_1258533497.4656")
.annotate "line", 115
    new $P353, "Undef"
    .lex "$else", $P353
.annotate "line", 113
    find_lex $P354, "$count"
    clone $P355, $P354
    dec $P354
.annotate "line", 115
    find_lex $P356, "$past"
    store_lex "$else", $P356
.annotate "line", 116
    find_lex $P357, "$count"
    set $I358, $P357
    find_lex $P359, "$/"
    unless_null $P359, vivify_191
    new $P359, "Hash"
  vivify_191:
    set $P360, $P359["xblock"]
    unless_null $P360, vivify_192
    new $P360, "ResizablePMCArray"
  vivify_192:
    set $P361, $P360[$I358]
    unless_null $P361, vivify_193
    new $P361, "Undef"
  vivify_193:
    $P362 = $P361."ast"()
    $P363 = "xblock_immediate"($P362)
    store_lex "$past", $P363
.annotate "line", 117
    find_lex $P364, "$past"
    find_lex $P365, "$else"
    $P366 = $P364."push"($P365)
.annotate "line", 113
    .return ($P366)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("31_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_377
.annotate "line", 122
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(58)
    push_eh $P376
    .lex "self", self
    .lex "$/", param_377
.annotate "line", 123
    new $P378, "Undef"
    .lex "$past", $P378
    find_lex $P379, "$/"
    unless_null $P379, vivify_194
    new $P379, "Hash"
  vivify_194:
    set $P380, $P379["xblock"]
    unless_null $P380, vivify_195
    new $P380, "Undef"
  vivify_195:
    $P381 = $P380."ast"()
    $P382 = "xblock_immediate"($P381)
    store_lex "$past", $P382
.annotate "line", 124
    find_lex $P383, "$past"
    $P383."pasttype"("unless")
.annotate "line", 125
    find_lex $P384, "$/"
    find_lex $P385, "$past"
    $P386 = $P384."!make"($P385)
.annotate "line", 122
    .return ($P386)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P387, exception, "payload"
    .return ($P387)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("32_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_391
.annotate "line", 128
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "self", self
    .lex "$/", param_391
.annotate "line", 129
    new $P392, "Undef"
    .lex "$past", $P392
    find_lex $P393, "$/"
    unless_null $P393, vivify_196
    new $P393, "Hash"
  vivify_196:
    set $P394, $P393["xblock"]
    unless_null $P394, vivify_197
    new $P394, "Undef"
  vivify_197:
    $P395 = $P394."ast"()
    $P396 = "xblock_immediate"($P395)
    store_lex "$past", $P396
.annotate "line", 130
    find_lex $P397, "$past"
    find_lex $P398, "$/"
    unless_null $P398, vivify_198
    new $P398, "Hash"
  vivify_198:
    set $P399, $P398["sym"]
    unless_null $P399, vivify_199
    new $P399, "Undef"
  vivify_199:
    set $S400, $P399
    $P397."pasttype"($S400)
.annotate "line", 131
    find_lex $P401, "$/"
    find_lex $P402, "$past"
    $P403 = $P401."!make"($P402)
.annotate "line", 128
    .return ($P403)
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("33_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_408
.annotate "line", 134
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate "line", 135
    new $P409, "Undef"
    .lex "$pasttype", $P409
.annotate "line", 136
    new $P410, "Undef"
    .lex "$past", $P410
.annotate "line", 135
    new $P411, "String"
    assign $P411, "repeat_"
    find_lex $P412, "$/"
    unless_null $P412, vivify_200
    new $P412, "Hash"
  vivify_200:
    set $P413, $P412["wu"]
    unless_null $P413, vivify_201
    new $P413, "Undef"
  vivify_201:
    set $S414, $P413
    concat $P415, $P411, $S414
    store_lex "$pasttype", $P415
    find_lex $P416, "$past"
.annotate "line", 137
    find_lex $P418, "$/"
    unless_null $P418, vivify_202
    new $P418, "Hash"
  vivify_202:
    set $P419, $P418["xblock"]
    unless_null $P419, vivify_203
    new $P419, "Undef"
  vivify_203:
    if $P419, if_417
.annotate "line", 142
    get_hll_global $P426, ["PAST"], "Op"
    find_lex $P427, "$/"
    unless_null $P427, vivify_204
    new $P427, "Hash"
  vivify_204:
    set $P428, $P427["EXPR"]
    unless_null $P428, vivify_205
    new $P428, "Undef"
  vivify_205:
    $P429 = $P428."ast"()
    find_lex $P430, "$/"
    unless_null $P430, vivify_206
    new $P430, "Hash"
  vivify_206:
    set $P431, $P430["pblock"]
    unless_null $P431, vivify_207
    new $P431, "Undef"
  vivify_207:
    $P432 = $P431."ast"()
    $P433 = "block_immediate"($P432)
    find_lex $P434, "$pasttype"
    find_lex $P435, "$/"
    $P436 = $P426."new"($P429, $P433, $P434 :named("pasttype"), $P435 :named("node"))
    store_lex "$past", $P436
.annotate "line", 141
    goto if_417_end
  if_417:
.annotate "line", 138
    find_lex $P420, "$/"
    unless_null $P420, vivify_208
    new $P420, "Hash"
  vivify_208:
    set $P421, $P420["xblock"]
    unless_null $P421, vivify_209
    new $P421, "Undef"
  vivify_209:
    $P422 = $P421."ast"()
    $P423 = "xblock_immediate"($P422)
    store_lex "$past", $P423
.annotate "line", 139
    find_lex $P424, "$past"
    find_lex $P425, "$pasttype"
    $P424."pasttype"($P425)
  if_417_end:
.annotate "line", 145
    find_lex $P437, "$/"
    find_lex $P438, "$past"
    $P439 = $P437."!make"($P438)
.annotate "line", 134
    .return ($P439)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P440, exception, "payload"
    .return ($P440)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("34_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_444
.annotate "line", 148
    new $P443, 'ExceptionHandler'
    set_addr $P443, control_442
    $P443."handle_types"(58)
    push_eh $P443
    .lex "self", self
    .lex "$/", param_444
.annotate "line", 149
    new $P445, "Undef"
    .lex "$past", $P445
.annotate "line", 151
    new $P446, "Undef"
    .lex "$block", $P446
.annotate "line", 149
    find_lex $P447, "$/"
    unless_null $P447, vivify_210
    new $P447, "Hash"
  vivify_210:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_211
    new $P448, "Undef"
  vivify_211:
    $P449 = $P448."ast"()
    store_lex "$past", $P449
.annotate "line", 150
    find_lex $P450, "$past"
    $P450."pasttype"("for")
.annotate "line", 151
    find_lex $P451, "$past"
    unless_null $P451, vivify_212
    new $P451, "ResizablePMCArray"
  vivify_212:
    set $P452, $P451[1]
    unless_null $P452, vivify_213
    new $P452, "Undef"
  vivify_213:
    store_lex "$block", $P452
.annotate "line", 152
    find_lex $P454, "$block"
    $P455 = $P454."arity"()
    if $P455, unless_453_end
.annotate "line", 153
    find_lex $P456, "$block"
    unless_null $P456, vivify_214
    new $P456, "ResizablePMCArray"
  vivify_214:
    set $P457, $P456[0]
    unless_null $P457, vivify_215
    new $P457, "Undef"
  vivify_215:
    get_hll_global $P458, ["PAST"], "Var"
    $P459 = $P458."new"("$_" :named("name"), "parameter" :named("scope"))
    $P457."push"($P459)
.annotate "line", 154
    find_lex $P460, "$block"
    $P460."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 155
    find_lex $P461, "$block"
    $P461."arity"(1)
  unless_453_end:
.annotate "line", 157
    find_lex $P462, "$block"
    $P462."blocktype"("immediate")
.annotate "line", 158
    find_lex $P463, "$/"
    find_lex $P464, "$past"
    $P465 = $P463."!make"($P464)
.annotate "line", 148
    .return ($P465)
  control_442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P466, exception, "payload"
    .return ($P466)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("35_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_470
.annotate "line", 161
    new $P469, 'ExceptionHandler'
    set_addr $P469, control_468
    $P469."handle_types"(58)
    push_eh $P469
    .lex "self", self
    .lex "$/", param_470
.annotate "line", 162
    find_lex $P471, "$/"
    get_hll_global $P472, ["PAST"], "Op"
    find_lex $P473, "$/"
    unless_null $P473, vivify_216
    new $P473, "Hash"
  vivify_216:
    set $P474, $P473["EXPR"]
    unless_null $P474, vivify_217
    new $P474, "Undef"
  vivify_217:
    $P475 = $P474."ast"()
    find_lex $P476, "$/"
    $P477 = $P472."new"($P475, "return" :named("pasttype"), $P476 :named("node"))
    $P478 = $P471."!make"($P477)
.annotate "line", 161
    .return ($P478)
  control_468:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P479, exception, "payload"
    .return ($P479)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("36_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_483
.annotate "line", 165
    new $P482, 'ExceptionHandler'
    set_addr $P482, control_481
    $P482."handle_types"(58)
    push_eh $P482
    .lex "self", self
    .lex "$/", param_483
.annotate "line", 166
    get_global $P484, "@BLOCK"
    unless_null $P484, vivify_218
    new $P484, "ResizablePMCArray"
  vivify_218:
    set $P485, $P484[0]
    unless_null $P485, vivify_219
    new $P485, "Undef"
  vivify_219:
    $P486 = $P485."loadinit"()
    find_lex $P487, "$/"
    unless_null $P487, vivify_220
    new $P487, "Hash"
  vivify_220:
    set $P488, $P487["blorst"]
    unless_null $P488, vivify_221
    new $P488, "Undef"
  vivify_221:
    $P489 = $P488."ast"()
    $P486."push"($P489)
.annotate "line", 167
    find_lex $P490, "$/"
    get_hll_global $P491, ["PAST"], "Stmts"
    find_lex $P492, "$/"
    $P493 = $P491."new"($P492 :named("node"))
    $P494 = $P490."!make"($P493)
.annotate "line", 165
    .return ($P494)
  control_481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P495, exception, "payload"
    .return ($P495)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("37_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_499
.annotate "line", 170
    new $P498, 'ExceptionHandler'
    set_addr $P498, control_497
    $P498."handle_types"(58)
    push_eh $P498
    .lex "self", self
    .lex "$/", param_499
.annotate "line", 171
    find_lex $P500, "$/"
.annotate "line", 172
    find_lex $P503, "$/"
    unless_null $P503, vivify_222
    new $P503, "Hash"
  vivify_222:
    set $P504, $P503["block"]
    unless_null $P504, vivify_223
    new $P504, "Undef"
  vivify_223:
    if $P504, if_502
.annotate "line", 173
    find_lex $P509, "$/"
    unless_null $P509, vivify_224
    new $P509, "Hash"
  vivify_224:
    set $P510, $P509["statement"]
    unless_null $P510, vivify_225
    new $P510, "Undef"
  vivify_225:
    $P511 = $P510."ast"()
    set $P501, $P511
.annotate "line", 172
    goto if_502_end
  if_502:
    find_lex $P505, "$/"
    unless_null $P505, vivify_226
    new $P505, "Hash"
  vivify_226:
    set $P506, $P505["block"]
    unless_null $P506, vivify_227
    new $P506, "Undef"
  vivify_227:
    $P507 = $P506."ast"()
    $P508 = "block_immediate"($P507)
    set $P501, $P508
  if_502_end:
    $P512 = $P500."!make"($P501)
.annotate "line", 170
    .return ($P512)
  control_497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("38_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_517
.annotate "line", 178
    new $P516, 'ExceptionHandler'
    set_addr $P516, control_515
    $P516."handle_types"(58)
    push_eh $P516
    .lex "self", self
    .lex "$/", param_517
    find_lex $P518, "$/"
    find_lex $P519, "$/"
    unless_null $P519, vivify_228
    new $P519, "Hash"
  vivify_228:
    set $P520, $P519["cond"]
    unless_null $P520, vivify_229
    new $P520, "Undef"
  vivify_229:
    $P521 = $P520."ast"()
    $P522 = $P518."!make"($P521)
    .return ($P522)
  control_515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P523, exception, "payload"
    .return ($P523)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("39_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_527
.annotate "line", 179
    new $P526, 'ExceptionHandler'
    set_addr $P526, control_525
    $P526."handle_types"(58)
    push_eh $P526
    .lex "self", self
    .lex "$/", param_527
    find_lex $P528, "$/"
    find_lex $P529, "$/"
    unless_null $P529, vivify_230
    new $P529, "Hash"
  vivify_230:
    set $P530, $P529["cond"]
    unless_null $P530, vivify_231
    new $P530, "Undef"
  vivify_231:
    $P531 = $P530."ast"()
    $P532 = $P528."!make"($P531)
    .return ($P532)
  control_525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P533, exception, "payload"
    .return ($P533)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("40_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_537
.annotate "line", 181
    new $P536, 'ExceptionHandler'
    set_addr $P536, control_535
    $P536."handle_types"(58)
    push_eh $P536
    .lex "self", self
    .lex "$/", param_537
    find_lex $P538, "$/"
    find_lex $P539, "$/"
    unless_null $P539, vivify_232
    new $P539, "Hash"
  vivify_232:
    set $P540, $P539["cond"]
    unless_null $P540, vivify_233
    new $P540, "Undef"
  vivify_233:
    $P541 = $P540."ast"()
    $P542 = $P538."!make"($P541)
    .return ($P542)
  control_535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P543, exception, "payload"
    .return ($P543)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("41_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_547
.annotate "line", 182
    new $P546, 'ExceptionHandler'
    set_addr $P546, control_545
    $P546."handle_types"(58)
    push_eh $P546
    .lex "self", self
    .lex "$/", param_547
    find_lex $P548, "$/"
    find_lex $P549, "$/"
    unless_null $P549, vivify_234
    new $P549, "Hash"
  vivify_234:
    set $P550, $P549["cond"]
    unless_null $P550, vivify_235
    new $P550, "Undef"
  vivify_235:
    $P551 = $P550."ast"()
    $P552 = $P548."!make"($P551)
    .return ($P552)
  control_545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P553, exception, "payload"
    .return ($P553)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("42_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_557
.annotate "line", 186
    new $P556, 'ExceptionHandler'
    set_addr $P556, control_555
    $P556."handle_types"(58)
    push_eh $P556
    .lex "self", self
    .lex "$/", param_557
    find_lex $P558, "$/"
    find_lex $P559, "$/"
    unless_null $P559, vivify_236
    new $P559, "Hash"
  vivify_236:
    set $P560, $P559["colonpair"]
    unless_null $P560, vivify_237
    new $P560, "Undef"
  vivify_237:
    $P561 = $P560."ast"()
    $P562 = $P558."!make"($P561)
    .return ($P562)
  control_555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P563, exception, "payload"
    .return ($P563)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("43_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_567
.annotate "line", 187
    new $P566, 'ExceptionHandler'
    set_addr $P566, control_565
    $P566."handle_types"(58)
    push_eh $P566
    .lex "self", self
    .lex "$/", param_567
    find_lex $P568, "$/"
    find_lex $P569, "$/"
    unless_null $P569, vivify_238
    new $P569, "Hash"
  vivify_238:
    set $P570, $P569["variable"]
    unless_null $P570, vivify_239
    new $P570, "Undef"
  vivify_239:
    $P571 = $P570."ast"()
    $P572 = $P568."!make"($P571)
    .return ($P572)
  control_565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("44_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_577
.annotate "line", 188
    new $P576, 'ExceptionHandler'
    set_addr $P576, control_575
    $P576."handle_types"(58)
    push_eh $P576
    .lex "self", self
    .lex "$/", param_577
    find_lex $P578, "$/"
    find_lex $P579, "$/"
    unless_null $P579, vivify_240
    new $P579, "Hash"
  vivify_240:
    set $P580, $P579["package_declarator"]
    unless_null $P580, vivify_241
    new $P580, "Undef"
  vivify_241:
    $P581 = $P580."ast"()
    $P582 = $P578."!make"($P581)
    .return ($P582)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P583, exception, "payload"
    .return ($P583)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("45_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_587
.annotate "line", 189
    new $P586, 'ExceptionHandler'
    set_addr $P586, control_585
    $P586."handle_types"(58)
    push_eh $P586
    .lex "self", self
    .lex "$/", param_587
    find_lex $P588, "$/"
    find_lex $P589, "$/"
    unless_null $P589, vivify_242
    new $P589, "Hash"
  vivify_242:
    set $P590, $P589["scope_declarator"]
    unless_null $P590, vivify_243
    new $P590, "Undef"
  vivify_243:
    $P591 = $P590."ast"()
    $P592 = $P588."!make"($P591)
    .return ($P592)
  control_585:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P593, exception, "payload"
    .return ($P593)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("46_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_597
.annotate "line", 190
    new $P596, 'ExceptionHandler'
    set_addr $P596, control_595
    $P596."handle_types"(58)
    push_eh $P596
    .lex "self", self
    .lex "$/", param_597
    find_lex $P598, "$/"
    find_lex $P599, "$/"
    unless_null $P599, vivify_244
    new $P599, "Hash"
  vivify_244:
    set $P600, $P599["routine_declarator"]
    unless_null $P600, vivify_245
    new $P600, "Undef"
  vivify_245:
    $P601 = $P600."ast"()
    $P602 = $P598."!make"($P601)
    .return ($P602)
  control_595:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P603, exception, "payload"
    .return ($P603)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("47_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_607
.annotate "line", 191
    new $P606, 'ExceptionHandler'
    set_addr $P606, control_605
    $P606."handle_types"(58)
    push_eh $P606
    .lex "self", self
    .lex "$/", param_607
    find_lex $P608, "$/"
    find_lex $P609, "$/"
    unless_null $P609, vivify_246
    new $P609, "Hash"
  vivify_246:
    set $P610, $P609["regex_declarator"]
    unless_null $P610, vivify_247
    new $P610, "Undef"
  vivify_247:
    $P611 = $P610."ast"()
    $P612 = $P608."!make"($P611)
    .return ($P612)
  control_605:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P613, exception, "payload"
    .return ($P613)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("48_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_617
.annotate "line", 192
    new $P616, 'ExceptionHandler'
    set_addr $P616, control_615
    $P616."handle_types"(58)
    push_eh $P616
    .lex "self", self
    .lex "$/", param_617
    find_lex $P618, "$/"
    find_lex $P619, "$/"
    unless_null $P619, vivify_248
    new $P619, "Hash"
  vivify_248:
    set $P620, $P619["statement_prefix"]
    unless_null $P620, vivify_249
    new $P620, "Undef"
  vivify_249:
    $P621 = $P620."ast"()
    $P622 = $P618."!make"($P621)
    .return ($P622)
  control_615:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P623, exception, "payload"
    .return ($P623)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("49_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_627
.annotate "line", 193
    new $P626, 'ExceptionHandler'
    set_addr $P626, control_625
    $P626."handle_types"(58)
    push_eh $P626
    .lex "self", self
    .lex "$/", param_627
    find_lex $P628, "$/"
    find_lex $P629, "$/"
    unless_null $P629, vivify_250
    new $P629, "Hash"
  vivify_250:
    set $P630, $P629["pblock"]
    unless_null $P630, vivify_251
    new $P630, "Undef"
  vivify_251:
    $P631 = $P630."ast"()
    $P632 = $P628."!make"($P631)
    .return ($P632)
  control_625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("50_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_637
.annotate "line", 195
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(58)
    push_eh $P636
    .lex "self", self
    .lex "$/", param_637
.annotate "line", 196
    new $P638, "Undef"
    .lex "$past", $P638
.annotate "line", 197
    find_lex $P641, "$/"
    unless_null $P641, vivify_252
    new $P641, "Hash"
  vivify_252:
    set $P642, $P641["circumfix"]
    unless_null $P642, vivify_253
    new $P642, "Undef"
  vivify_253:
    if $P642, if_640
.annotate "line", 198
    get_hll_global $P647, ["PAST"], "Val"
    find_lex $P648, "$/"
    unless_null $P648, vivify_254
    new $P648, "Hash"
  vivify_254:
    set $P649, $P648["not"]
    unless_null $P649, vivify_255
    new $P649, "Undef"
  vivify_255:
    isfalse $I650, $P649
    $P651 = $P647."new"($I650 :named("value"))
    set $P639, $P651
.annotate "line", 197
    goto if_640_end
  if_640:
    find_lex $P643, "$/"
    unless_null $P643, vivify_256
    new $P643, "Hash"
  vivify_256:
    set $P644, $P643["circumfix"]
    unless_null $P644, vivify_257
    new $P644, "ResizablePMCArray"
  vivify_257:
    set $P645, $P644[0]
    unless_null $P645, vivify_258
    new $P645, "Undef"
  vivify_258:
    $P646 = $P645."ast"()
    set $P639, $P646
  if_640_end:
    store_lex "$past", $P639
.annotate "line", 199
    find_lex $P652, "$past"
    find_lex $P653, "$/"
    unless_null $P653, vivify_259
    new $P653, "Hash"
  vivify_259:
    set $P654, $P653["identifier"]
    unless_null $P654, vivify_260
    new $P654, "Undef"
  vivify_260:
    set $S655, $P654
    $P652."named"($S655)
.annotate "line", 200
    find_lex $P656, "$/"
    find_lex $P657, "$past"
    $P658 = $P656."!make"($P657)
.annotate "line", 195
    .return ($P658)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P659, exception, "payload"
    .return ($P659)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("51_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_663
.annotate "line", 203
    .const 'Sub' $P676 = "52_1258533497.4656" 
    capture_lex $P676
    new $P662, 'ExceptionHandler'
    set_addr $P662, control_661
    $P662."handle_types"(58)
    push_eh $P662
    .lex "self", self
    .lex "$/", param_663
.annotate "line", 204
    new $P664, "Undef"
    .lex "$past", $P664
.annotate "line", 203
    find_lex $P665, "$past"
.annotate "line", 205
    find_lex $P667, "$/"
    unless_null $P667, vivify_261
    new $P667, "Hash"
  vivify_261:
    set $P668, $P667["postcircumfix"]
    unless_null $P668, vivify_262
    new $P668, "Undef"
  vivify_262:
    if $P668, if_666
.annotate "line", 209
    .const 'Sub' $P676 = "52_1258533497.4656" 
    capture_lex $P676
    $P676()
    goto if_666_end
  if_666:
.annotate "line", 206
    find_lex $P669, "$/"
    unless_null $P669, vivify_279
    new $P669, "Hash"
  vivify_279:
    set $P670, $P669["postcircumfix"]
    unless_null $P670, vivify_280
    new $P670, "Undef"
  vivify_280:
    $P671 = $P670."ast"()
    store_lex "$past", $P671
.annotate "line", 207
    find_lex $P672, "$past"
    get_hll_global $P673, ["PAST"], "Var"
    $P674 = $P673."new"("$/" :named("name"))
    $P672."unshift"($P674)
  if_666_end:
.annotate "line", 237
    find_lex $P742, "$/"
    find_lex $P743, "$past"
    $P744 = $P742."!make"($P743)
.annotate "line", 203
    .return ($P744)
  control_661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P745, exception, "payload"
    .return ($P745)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block675"  :anon :subid("52_1258533497.4656") :outer("51_1258533497.4656")
.annotate "line", 210
    new $P677, "ResizablePMCArray"
    .lex "@name", $P677
    get_hll_global $P678, ["NQP"], "Compiler"
    find_lex $P679, "$/"
    set $S680, $P679
    $P681 = $P678."parse_name"($S680)
    store_lex "@name", $P681
.annotate "line", 211
    get_hll_global $P682, ["PAST"], "Var"
    find_lex $P683, "@name"
    $P684 = $P683."pop"()
    set $S685, $P684
    $P686 = $P682."new"($S685 :named("name"))
    store_lex "$past", $P686
.annotate "line", 212
    find_lex $P688, "@name"
    unless $P688, if_687_end
.annotate "line", 213
    find_lex $P690, "@name"
    unless_null $P690, vivify_263
    new $P690, "ResizablePMCArray"
  vivify_263:
    set $P691, $P690[0]
    unless_null $P691, vivify_264
    new $P691, "Undef"
  vivify_264:
    set $S692, $P691
    iseq $I693, $S692, "GLOBAL"
    unless $I693, if_689_end
    find_lex $P694, "@name"
    $P694."shift"()
  if_689_end:
.annotate "line", 214
    find_lex $P695, "$past"
    find_lex $P696, "@name"
    $P695."namespace"($P696)
.annotate "line", 215
    find_lex $P697, "$past"
    $P697."scope"("package")
.annotate "line", 216
    find_lex $P698, "$past"
    find_lex $P699, "$/"
    unless_null $P699, vivify_265
    new $P699, "Hash"
  vivify_265:
    set $P700, $P699["sigil"]
    unless_null $P700, vivify_266
    new $P700, "Undef"
  vivify_266:
    $P701 = "sigiltype"($P700)
    $P698."viviself"($P701)
.annotate "line", 217
    find_lex $P702, "$past"
    $P702."lvalue"(1)
  if_687_end:
.annotate "line", 219
    find_lex $P705, "$/"
    unless_null $P705, vivify_267
    new $P705, "Hash"
  vivify_267:
    set $P706, $P705["twigil"]
    unless_null $P706, vivify_268
    new $P706, "ResizablePMCArray"
  vivify_268:
    set $P707, $P706[0]
    unless_null $P707, vivify_269
    new $P707, "Undef"
  vivify_269:
    set $S708, $P707
    iseq $I709, $S708, "*"
    if $I709, if_704
.annotate "line", 232
    find_lex $P731, "$/"
    unless_null $P731, vivify_270
    new $P731, "Hash"
  vivify_270:
    set $P732, $P731["twigil"]
    unless_null $P732, vivify_271
    new $P732, "ResizablePMCArray"
  vivify_271:
    set $P733, $P732[0]
    unless_null $P733, vivify_272
    new $P733, "Undef"
  vivify_272:
    set $S734, $P733
    iseq $I735, $S734, "!"
    if $I735, if_730
    new $P729, 'Integer'
    set $P729, $I735
    goto if_730_end
  if_730:
.annotate "line", 233
    find_lex $P736, "$past"
    $P736."scope"("attribute")
.annotate "line", 234
    find_lex $P737, "$past"
    find_lex $P738, "$/"
    unless_null $P738, vivify_273
    new $P738, "Hash"
  vivify_273:
    set $P739, $P738["sigil"]
    unless_null $P739, vivify_274
    new $P739, "Undef"
  vivify_274:
    $P740 = "sigiltype"($P739)
    $P741 = $P737."viviself"($P740)
.annotate "line", 232
    set $P729, $P741
  if_730_end:
    set $P703, $P729
.annotate "line", 219
    goto if_704_end
  if_704:
.annotate "line", 220
    find_lex $P710, "$past"
    $P710."scope"("contextual")
.annotate "line", 221
    find_lex $P711, "$past"
.annotate "line", 222
    get_hll_global $P712, ["PAST"], "Var"
.annotate "line", 224
    find_lex $P713, "$/"
    unless_null $P713, vivify_275
    new $P713, "Hash"
  vivify_275:
    set $P714, $P713["sigil"]
    unless_null $P714, vivify_276
    new $P714, "Undef"
  vivify_276:
    set $S715, $P714
    new $P716, 'String'
    set $P716, $S715
    find_lex $P717, "$/"
    unless_null $P717, vivify_277
    new $P717, "Hash"
  vivify_277:
    set $P718, $P717["desigilname"]
    unless_null $P718, vivify_278
    new $P718, "Undef"
  vivify_278:
    concat $P719, $P716, $P718
.annotate "line", 226
    get_hll_global $P720, ["PAST"], "Op"
    new $P721, "String"
    assign $P721, "Contextual "
    find_lex $P722, "$/"
    set $S723, $P722
    concat $P724, $P721, $S723
    concat $P725, $P724, " not found"
    $P726 = $P720."new"($P725, "die" :named("pirop"))
    $P727 = $P712."new"("package" :named("scope"), "" :named("namespace"), $P719 :named("name"), $P726 :named("viviself"))
.annotate "line", 222
    $P728 = $P711."viviself"($P727)
.annotate "line", 219
    set $P703, $P728
  if_704_end:
.annotate "line", 209
    .return ($P703)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("53_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_749
.annotate "line", 240
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(58)
    push_eh $P748
    .lex "self", self
    .lex "$/", param_749
    find_lex $P750, "$/"
    find_lex $P751, "$/"
    unless_null $P751, vivify_281
    new $P751, "Hash"
  vivify_281:
    set $P752, $P751["package_def"]
    unless_null $P752, vivify_282
    new $P752, "Undef"
  vivify_282:
    $P753 = $P752."ast"()
    $P754 = $P750."!make"($P753)
    .return ($P754)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P755, exception, "payload"
    .return ($P755)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("54_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_759
.annotate "line", 241
    new $P758, 'ExceptionHandler'
    set_addr $P758, control_757
    $P758."handle_types"(58)
    push_eh $P758
    .lex "self", self
    .lex "$/", param_759
.annotate "line", 242
    new $P760, "Undef"
    .lex "$past", $P760
.annotate "line", 243
    new $P761, "Undef"
    .lex "$classinit", $P761
.annotate "line", 252
    new $P762, "Undef"
    .lex "$parent", $P762
.annotate "line", 242
    find_lex $P763, "$/"
    unless_null $P763, vivify_283
    new $P763, "Hash"
  vivify_283:
    set $P764, $P763["package_def"]
    unless_null $P764, vivify_284
    new $P764, "Undef"
  vivify_284:
    $P765 = $P764."ast"()
    store_lex "$past", $P765
.annotate "line", 244
    get_hll_global $P766, ["PAST"], "Op"
.annotate "line", 245
    get_hll_global $P767, ["PAST"], "Op"
    $P768 = $P767."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 248
    find_lex $P769, "$/"
    unless_null $P769, vivify_285
    new $P769, "Hash"
  vivify_285:
    set $P770, $P769["package_def"]
    unless_null $P770, vivify_286
    new $P770, "Hash"
  vivify_286:
    set $P771, $P770["name"]
    unless_null $P771, vivify_287
    new $P771, "Undef"
  vivify_287:
    set $S772, $P771
    $P773 = $P766."new"($P768, $S772, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 244
    store_lex "$classinit", $P773
.annotate "line", 252
    find_lex $P776, "$/"
    unless_null $P776, vivify_288
    new $P776, "Hash"
  vivify_288:
    set $P777, $P776["package_def"]
    unless_null $P777, vivify_289
    new $P777, "Hash"
  vivify_289:
    set $P778, $P777["parent"]
    unless_null $P778, vivify_290
    new $P778, "ResizablePMCArray"
  vivify_290:
    set $P779, $P778[0]
    unless_null $P779, vivify_291
    new $P779, "Undef"
  vivify_291:
    set $S780, $P779
    unless $S780, unless_775
    new $P774, 'String'
    set $P774, $S780
    goto unless_775_end
  unless_775:
.annotate "line", 253
    find_lex $P783, "$/"
    unless_null $P783, vivify_292
    new $P783, "Hash"
  vivify_292:
    set $P784, $P783["sym"]
    unless_null $P784, vivify_293
    new $P784, "Undef"
  vivify_293:
    set $S785, $P784
    iseq $I786, $S785, "grammar"
    if $I786, if_782
    new $P788, "String"
    assign $P788, ""
    set $P781, $P788
    goto if_782_end
  if_782:
    new $P787, "String"
    assign $P787, "Regex::Cursor"
    set $P781, $P787
  if_782_end:
    set $P774, $P781
  unless_775_end:
    store_lex "$parent", $P774
.annotate "line", 254
    find_lex $P790, "$parent"
    unless $P790, if_789_end
.annotate "line", 255
    find_lex $P791, "$classinit"
    get_hll_global $P792, ["PAST"], "Val"
    find_lex $P793, "$parent"
    $P794 = $P792."new"($P793 :named("value"), "parent" :named("named"))
    $P791."push"($P794)
  if_789_end:
.annotate "line", 257
    find_lex $P796, "$past"
    unless_null $P796, vivify_294
    new $P796, "Hash"
  vivify_294:
    set $P797, $P796["attributes"]
    unless_null $P797, vivify_295
    new $P797, "Undef"
  vivify_295:
    unless $P797, if_795_end
.annotate "line", 258
    find_lex $P798, "$classinit"
    find_lex $P799, "$past"
    unless_null $P799, vivify_296
    new $P799, "Hash"
  vivify_296:
    set $P800, $P799["attributes"]
    unless_null $P800, vivify_297
    new $P800, "Undef"
  vivify_297:
    $P798."push"($P800)
  if_795_end:
.annotate "line", 260
    get_global $P801, "@BLOCK"
    unless_null $P801, vivify_298
    new $P801, "ResizablePMCArray"
  vivify_298:
    set $P802, $P801[0]
    unless_null $P802, vivify_299
    new $P802, "Undef"
  vivify_299:
    $P803 = $P802."loadinit"()
    find_lex $P804, "$classinit"
    $P803."push"($P804)
.annotate "line", 261
    find_lex $P805, "$/"
    find_lex $P806, "$past"
    $P807 = $P805."!make"($P806)
.annotate "line", 241
    .return ($P807)
  control_757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P808, exception, "payload"
    .return ($P808)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("55_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_812
.annotate "line", 264
    new $P811, 'ExceptionHandler'
    set_addr $P811, control_810
    $P811."handle_types"(58)
    push_eh $P811
    .lex "self", self
    .lex "$/", param_812
.annotate "line", 265
    new $P813, "Undef"
    .lex "$past", $P813
    find_lex $P816, "$/"
    unless_null $P816, vivify_300
    new $P816, "Hash"
  vivify_300:
    set $P817, $P816["block"]
    unless_null $P817, vivify_301
    new $P817, "Undef"
  vivify_301:
    if $P817, if_815
    find_lex $P821, "$/"
    unless_null $P821, vivify_302
    new $P821, "Hash"
  vivify_302:
    set $P822, $P821["comp_unit"]
    unless_null $P822, vivify_303
    new $P822, "Undef"
  vivify_303:
    $P823 = $P822."ast"()
    set $P814, $P823
    goto if_815_end
  if_815:
    find_lex $P818, "$/"
    unless_null $P818, vivify_304
    new $P818, "Hash"
  vivify_304:
    set $P819, $P818["block"]
    unless_null $P819, vivify_305
    new $P819, "Undef"
  vivify_305:
    $P820 = $P819."ast"()
    set $P814, $P820
  if_815_end:
    store_lex "$past", $P814
.annotate "line", 266
    find_lex $P824, "$past"
    find_lex $P825, "$/"
    unless_null $P825, vivify_306
    new $P825, "Hash"
  vivify_306:
    set $P826, $P825["name"]
    unless_null $P826, vivify_307
    new $P826, "Hash"
  vivify_307:
    set $P827, $P826["identifier"]
    unless_null $P827, vivify_308
    new $P827, "Undef"
  vivify_308:
    $P824."namespace"($P827)
.annotate "line", 267
    find_lex $P828, "$past"
    $P828."blocktype"("immediate")
.annotate "line", 268
    find_lex $P829, "$/"
    find_lex $P830, "$past"
    $P831 = $P829."!make"($P830)
.annotate "line", 264
    .return ($P831)
  control_810:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P832, exception, "payload"
    .return ($P832)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("56_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_836
.annotate "line", 271
    new $P835, 'ExceptionHandler'
    set_addr $P835, control_834
    $P835."handle_types"(58)
    push_eh $P835
    .lex "self", self
    .lex "$/", param_836
    find_lex $P837, "$/"
    find_lex $P838, "$/"
    unless_null $P838, vivify_309
    new $P838, "Hash"
  vivify_309:
    set $P839, $P838["scoped"]
    unless_null $P839, vivify_310
    new $P839, "Undef"
  vivify_310:
    $P840 = $P839."ast"()
    $P841 = $P837."!make"($P840)
    .return ($P841)
  control_834:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("57_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_846
.annotate "line", 272
    new $P845, 'ExceptionHandler'
    set_addr $P845, control_844
    $P845."handle_types"(58)
    push_eh $P845
    .lex "self", self
    .lex "$/", param_846
    find_lex $P847, "$/"
    find_lex $P848, "$/"
    unless_null $P848, vivify_311
    new $P848, "Hash"
  vivify_311:
    set $P849, $P848["scoped"]
    unless_null $P849, vivify_312
    new $P849, "Undef"
  vivify_312:
    $P850 = $P849."ast"()
    $P851 = $P847."!make"($P850)
    .return ($P851)
  control_844:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P852, exception, "payload"
    .return ($P852)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("58_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_856
.annotate "line", 273
    new $P855, 'ExceptionHandler'
    set_addr $P855, control_854
    $P855."handle_types"(58)
    push_eh $P855
    .lex "self", self
    .lex "$/", param_856
    find_lex $P857, "$/"
    find_lex $P858, "$/"
    unless_null $P858, vivify_313
    new $P858, "Hash"
  vivify_313:
    set $P859, $P858["scoped"]
    unless_null $P859, vivify_314
    new $P859, "Undef"
  vivify_314:
    $P860 = $P859."ast"()
    $P861 = $P857."!make"($P860)
    .return ($P861)
  control_854:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P862, exception, "payload"
    .return ($P862)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("59_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_866
.annotate "line", 275
    new $P865, 'ExceptionHandler'
    set_addr $P865, control_864
    $P865."handle_types"(58)
    push_eh $P865
    .lex "self", self
    .lex "$/", param_866
.annotate "line", 276
    find_lex $P867, "$/"
.annotate "line", 277
    find_lex $P870, "$/"
    unless_null $P870, vivify_315
    new $P870, "Hash"
  vivify_315:
    set $P871, $P870["routine_declarator"]
    unless_null $P871, vivify_316
    new $P871, "Undef"
  vivify_316:
    if $P871, if_869
.annotate "line", 278
    find_lex $P875, "$/"
    unless_null $P875, vivify_317
    new $P875, "Hash"
  vivify_317:
    set $P876, $P875["variable_declarator"]
    unless_null $P876, vivify_318
    new $P876, "Undef"
  vivify_318:
    $P877 = $P876."ast"()
    set $P868, $P877
.annotate "line", 277
    goto if_869_end
  if_869:
    find_lex $P872, "$/"
    unless_null $P872, vivify_319
    new $P872, "Hash"
  vivify_319:
    set $P873, $P872["routine_declarator"]
    unless_null $P873, vivify_320
    new $P873, "Undef"
  vivify_320:
    $P874 = $P873."ast"()
    set $P868, $P874
  if_869_end:
    $P878 = $P867."!make"($P868)
.annotate "line", 275
    .return ($P878)
  control_864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P879, exception, "payload"
    .return ($P879)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("60_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_883
.annotate "line", 281
    .const 'Sub' $P923 = "61_1258533497.4656" 
    capture_lex $P923
    new $P882, 'ExceptionHandler'
    set_addr $P882, control_881
    $P882."handle_types"(58)
    push_eh $P882
    .lex "self", self
    .lex "$/", param_883
.annotate "line", 282
    new $P884, "Undef"
    .lex "$past", $P884
.annotate "line", 283
    new $P885, "Undef"
    .lex "$sigil", $P885
.annotate "line", 284
    new $P886, "Undef"
    .lex "$name", $P886
.annotate "line", 285
    new $P887, "Undef"
    .lex "$BLOCK", $P887
.annotate "line", 282
    find_lex $P888, "$/"
    unless_null $P888, vivify_321
    new $P888, "Hash"
  vivify_321:
    set $P889, $P888["variable"]
    unless_null $P889, vivify_322
    new $P889, "Undef"
  vivify_322:
    $P890 = $P889."ast"()
    store_lex "$past", $P890
.annotate "line", 283
    find_lex $P891, "$/"
    unless_null $P891, vivify_323
    new $P891, "Hash"
  vivify_323:
    set $P892, $P891["variable"]
    unless_null $P892, vivify_324
    new $P892, "Hash"
  vivify_324:
    set $P893, $P892["sigil"]
    unless_null $P893, vivify_325
    new $P893, "Undef"
  vivify_325:
    store_lex "$sigil", $P893
.annotate "line", 284
    find_lex $P894, "$past"
    $P895 = $P894."name"()
    store_lex "$name", $P895
.annotate "line", 285
    get_global $P896, "@BLOCK"
    unless_null $P896, vivify_326
    new $P896, "ResizablePMCArray"
  vivify_326:
    set $P897, $P896[0]
    unless_null $P897, vivify_327
    new $P897, "Undef"
  vivify_327:
    store_lex "$BLOCK", $P897
.annotate "line", 286
    find_lex $P899, "$BLOCK"
    find_lex $P900, "$name"
    $P901 = $P899."symbol"($P900)
    unless $P901, if_898_end
.annotate "line", 287
    find_lex $P902, "$/"
    $P903 = $P902."CURSOR"()
    find_lex $P904, "$name"
    $P903."panic"("Redeclaration of symbol ", $P904)
  if_898_end:
.annotate "line", 289
    find_dynamic_lex $P906, "$*SCOPE"
    unless_null $P906, vivify_328
    get_hll_global $P906, "$SCOPE"
    unless_null $P906, vivify_329
    die "Contextual $*SCOPE not found"
  vivify_329:
  vivify_328:
    set $S907, $P906
    iseq $I908, $S907, "has"
    if $I908, if_905
.annotate "line", 298
    .const 'Sub' $P923 = "61_1258533497.4656" 
    capture_lex $P923
    $P923()
    goto if_905_end
  if_905:
.annotate "line", 290
    find_lex $P909, "$BLOCK"
    find_lex $P910, "$name"
    $P909."symbol"($P910, "attribute" :named("scope"))
.annotate "line", 291
    find_lex $P912, "$BLOCK"
    unless_null $P912, vivify_334
    new $P912, "Hash"
  vivify_334:
    set $P913, $P912["attributes"]
    unless_null $P913, vivify_335
    new $P913, "Undef"
  vivify_335:
    if $P913, unless_911_end
.annotate "line", 293
    get_hll_global $P914, ["PAST"], "Op"
    $P915 = $P914."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P916, "$BLOCK"
    unless_null $P916, vivify_336
    new $P916, "Hash"
    store_lex "$BLOCK", $P916
  vivify_336:
    set $P916["attributes"], $P915
  unless_911_end:
.annotate "line", 295
    find_lex $P917, "$BLOCK"
    unless_null $P917, vivify_337
    new $P917, "Hash"
  vivify_337:
    set $P918, $P917["attributes"]
    unless_null $P918, vivify_338
    new $P918, "Undef"
  vivify_338:
    find_lex $P919, "$name"
    $P918."push"($P919)
.annotate "line", 296
    get_hll_global $P920, ["PAST"], "Stmts"
    $P921 = $P920."new"()
    store_lex "$past", $P921
  if_905_end:
.annotate "line", 306
    find_lex $P947, "$/"
    find_lex $P948, "$past"
    $P949 = $P947."!make"($P948)
.annotate "line", 281
    .return ($P949)
  control_881:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P950, exception, "payload"
    .return ($P950)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block922"  :anon :subid("61_1258533497.4656") :outer("60_1258533497.4656")
.annotate "line", 299
    new $P924, "Undef"
    .lex "$scope", $P924
.annotate "line", 300
    new $P925, "Undef"
    .lex "$decl", $P925
.annotate "line", 299
    find_dynamic_lex $P928, "$*SCOPE"
    unless_null $P928, vivify_330
    get_hll_global $P928, "$SCOPE"
    unless_null $P928, vivify_331
    die "Contextual $*SCOPE not found"
  vivify_331:
  vivify_330:
    set $S929, $P928
    iseq $I930, $S929, "our"
    if $I930, if_927
    new $P932, "String"
    assign $P932, "lexical"
    set $P926, $P932
    goto if_927_end
  if_927:
    new $P931, "String"
    assign $P931, "package"
    set $P926, $P931
  if_927_end:
    store_lex "$scope", $P926
.annotate "line", 300
    get_hll_global $P933, ["PAST"], "Var"
    find_lex $P934, "$name"
    find_lex $P935, "$scope"
.annotate "line", 301
    find_lex $P936, "$sigil"
    $P937 = "sigiltype"($P936)
    find_lex $P938, "$/"
    $P939 = $P933."new"($P934 :named("name"), $P935 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P937 :named("viviself"), $P938 :named("node"))
.annotate "line", 300
    store_lex "$decl", $P939
.annotate "line", 303
    find_lex $P940, "$BLOCK"
    find_lex $P941, "$name"
    find_lex $P942, "$scope"
    $P940."symbol"($P941, $P942 :named("scope"))
.annotate "line", 304
    find_lex $P943, "$BLOCK"
    unless_null $P943, vivify_332
    new $P943, "ResizablePMCArray"
  vivify_332:
    set $P944, $P943[0]
    unless_null $P944, vivify_333
    new $P944, "Undef"
  vivify_333:
    find_lex $P945, "$decl"
    $P946 = $P944."push"($P945)
.annotate "line", 298
    .return ($P946)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("62_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_954
.annotate "line", 309
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(58)
    push_eh $P953
    .lex "self", self
    .lex "$/", param_954
    find_lex $P955, "$/"
    find_lex $P956, "$/"
    unless_null $P956, vivify_339
    new $P956, "Hash"
  vivify_339:
    set $P957, $P956["routine_def"]
    unless_null $P957, vivify_340
    new $P957, "Undef"
  vivify_340:
    $P958 = $P957."ast"()
    $P959 = $P955."!make"($P958)
    .return ($P959)
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P960, exception, "payload"
    .return ($P960)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("63_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_964
.annotate "line", 310
    new $P963, 'ExceptionHandler'
    set_addr $P963, control_962
    $P963."handle_types"(58)
    push_eh $P963
    .lex "self", self
    .lex "$/", param_964
    find_lex $P965, "$/"
    find_lex $P966, "$/"
    unless_null $P966, vivify_341
    new $P966, "Hash"
  vivify_341:
    set $P967, $P966["method_def"]
    unless_null $P967, vivify_342
    new $P967, "Undef"
  vivify_342:
    $P968 = $P967."ast"()
    $P969 = $P965."!make"($P968)
    .return ($P969)
  control_962:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P970, exception, "payload"
    .return ($P970)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("64_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_974
.annotate "line", 312
    .const 'Sub' $P985 = "65_1258533497.4656" 
    capture_lex $P985
    new $P973, 'ExceptionHandler'
    set_addr $P973, control_972
    $P973."handle_types"(58)
    push_eh $P973
    .lex "self", self
    .lex "$/", param_974
.annotate "line", 313
    new $P975, "Undef"
    .lex "$past", $P975
    find_lex $P976, "$/"
    unless_null $P976, vivify_343
    new $P976, "Hash"
  vivify_343:
    set $P977, $P976["blockoid"]
    unless_null $P977, vivify_344
    new $P977, "Undef"
  vivify_344:
    $P978 = $P977."ast"()
    store_lex "$past", $P978
.annotate "line", 314
    find_lex $P979, "$past"
    $P979."blocktype"("declaration")
.annotate "line", 315
    find_lex $P980, "$past"
    $P980."control"("return_pir")
.annotate "line", 316
    find_lex $P982, "$/"
    unless_null $P982, vivify_345
    new $P982, "Hash"
  vivify_345:
    set $P983, $P982["deflongname"]
    unless_null $P983, vivify_346
    new $P983, "Undef"
  vivify_346:
    unless $P983, if_981_end
    .const 'Sub' $P985 = "65_1258533497.4656" 
    capture_lex $P985
    $P985()
  if_981_end:
.annotate "line", 326
    find_lex $P1013, "$/"
    find_lex $P1014, "$past"
    $P1015 = $P1013."!make"($P1014)
.annotate "line", 312
    .return ($P1015)
  control_972:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1016, exception, "payload"
    .return ($P1016)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block984"  :anon :subid("65_1258533497.4656") :outer("64_1258533497.4656")
.annotate "line", 317
    new $P986, "Undef"
    .lex "$name", $P986
    find_lex $P987, "$/"
    unless_null $P987, vivify_347
    new $P987, "Hash"
  vivify_347:
    set $P988, $P987["deflongname"]
    unless_null $P988, vivify_348
    new $P988, "ResizablePMCArray"
  vivify_348:
    set $P989, $P988[0]
    unless_null $P989, vivify_349
    new $P989, "Undef"
  vivify_349:
    $P990 = $P989."ast"()
    set $S991, $P990
    new $P992, 'String'
    set $P992, $S991
    store_lex "$name", $P992
.annotate "line", 318
    find_lex $P993, "$past"
    find_lex $P994, "$name"
    $P993."name"($P994)
.annotate "line", 319
    find_dynamic_lex $P997, "$*SCOPE"
    unless_null $P997, vivify_350
    get_hll_global $P997, "$SCOPE"
    unless_null $P997, vivify_351
    die "Contextual $*SCOPE not found"
  vivify_351:
  vivify_350:
    set $S998, $P997
    isne $I999, $S998, "our"
    if $I999, if_996
    new $P995, 'Integer'
    set $P995, $I999
    goto if_996_end
  if_996:
.annotate "line", 320
    get_global $P1000, "@BLOCK"
    unless_null $P1000, vivify_352
    new $P1000, "ResizablePMCArray"
  vivify_352:
    set $P1001, $P1000[0]
    unless_null $P1001, vivify_353
    new $P1001, "ResizablePMCArray"
  vivify_353:
    set $P1002, $P1001[0]
    unless_null $P1002, vivify_354
    new $P1002, "Undef"
  vivify_354:
    get_hll_global $P1003, ["PAST"], "Var"
    find_lex $P1004, "$name"
    find_lex $P1005, "$past"
    $P1006 = $P1003."new"($P1004 :named("name"), 1 :named("isdecl"), $P1005 :named("viviself"), "lexical" :named("scope"))
    $P1002."push"($P1006)
.annotate "line", 322
    get_global $P1007, "@BLOCK"
    unless_null $P1007, vivify_355
    new $P1007, "ResizablePMCArray"
  vivify_355:
    set $P1008, $P1007[0]
    unless_null $P1008, vivify_356
    new $P1008, "Undef"
  vivify_356:
    find_lex $P1009, "$name"
    $P1008."symbol"($P1009, "lexical" :named("scope"))
.annotate "line", 323
    get_hll_global $P1010, ["PAST"], "Var"
    find_lex $P1011, "$name"
    $P1012 = $P1010."new"($P1011 :named("name"))
    store_lex "$past", $P1012
.annotate "line", 319
    set $P995, $P1012
  if_996_end:
.annotate "line", 316
    .return ($P995)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("66_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1020
.annotate "line", 330
    .const 'Sub' $P1036 = "67_1258533497.4656" 
    capture_lex $P1036
    new $P1019, 'ExceptionHandler'
    set_addr $P1019, control_1018
    $P1019."handle_types"(58)
    push_eh $P1019
    .lex "self", self
    .lex "$/", param_1020
.annotate "line", 331
    new $P1021, "Undef"
    .lex "$past", $P1021
    find_lex $P1022, "$/"
    unless_null $P1022, vivify_357
    new $P1022, "Hash"
  vivify_357:
    set $P1023, $P1022["blockoid"]
    unless_null $P1023, vivify_358
    new $P1023, "Undef"
  vivify_358:
    $P1024 = $P1023."ast"()
    store_lex "$past", $P1024
.annotate "line", 332
    find_lex $P1025, "$past"
    $P1025."blocktype"("method")
.annotate "line", 333
    find_lex $P1026, "$past"
    $P1026."control"("return_pir")
.annotate "line", 334
    find_lex $P1027, "$past"
    unless_null $P1027, vivify_359
    new $P1027, "ResizablePMCArray"
  vivify_359:
    set $P1028, $P1027[0]
    unless_null $P1028, vivify_360
    new $P1028, "Undef"
  vivify_360:
    get_hll_global $P1029, ["PAST"], "Op"
    $P1030 = $P1029."new"("    .lex \"self\", self" :named("inline"))
    $P1028."unshift"($P1030)
.annotate "line", 335
    find_lex $P1031, "$past"
    $P1031."symbol"("self", "lexical" :named("scope"))
.annotate "line", 336
    find_lex $P1033, "$/"
    unless_null $P1033, vivify_361
    new $P1033, "Hash"
  vivify_361:
    set $P1034, $P1033["deflongname"]
    unless_null $P1034, vivify_362
    new $P1034, "Undef"
  vivify_362:
    unless $P1034, if_1032_end
    .const 'Sub' $P1036 = "67_1258533497.4656" 
    capture_lex $P1036
    $P1036()
  if_1032_end:
.annotate "line", 340
    find_lex $P1047, "$/"
    find_lex $P1048, "$past"
    $P1049 = $P1047."!make"($P1048)
.annotate "line", 330
    .return ($P1049)
  control_1018:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1050, exception, "payload"
    .return ($P1050)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1035"  :anon :subid("67_1258533497.4656") :outer("66_1258533497.4656")
.annotate "line", 337
    new $P1037, "Undef"
    .lex "$name", $P1037
    find_lex $P1038, "$/"
    unless_null $P1038, vivify_363
    new $P1038, "Hash"
  vivify_363:
    set $P1039, $P1038["deflongname"]
    unless_null $P1039, vivify_364
    new $P1039, "ResizablePMCArray"
  vivify_364:
    set $P1040, $P1039[0]
    unless_null $P1040, vivify_365
    new $P1040, "Undef"
  vivify_365:
    $P1041 = $P1040."ast"()
    set $S1042, $P1041
    new $P1043, 'String'
    set $P1043, $S1042
    store_lex "$name", $P1043
.annotate "line", 338
    find_lex $P1044, "$past"
    find_lex $P1045, "$name"
    $P1046 = $P1044."name"($P1045)
.annotate "line", 336
    .return ($P1046)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("68_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1054
.annotate "line", 344
    .const 'Sub' $P1065 = "69_1258533497.4656" 
    capture_lex $P1065
    new $P1053, 'ExceptionHandler'
    set_addr $P1053, control_1052
    $P1053."handle_types"(58)
    push_eh $P1053
    .lex "self", self
    .lex "$/", param_1054
.annotate "line", 345
    new $P1055, "Undef"
    .lex "$BLOCKINIT", $P1055
    get_global $P1056, "@BLOCK"
    unless_null $P1056, vivify_366
    new $P1056, "ResizablePMCArray"
  vivify_366:
    set $P1057, $P1056[0]
    unless_null $P1057, vivify_367
    new $P1057, "ResizablePMCArray"
  vivify_367:
    set $P1058, $P1057[0]
    unless_null $P1058, vivify_368
    new $P1058, "Undef"
  vivify_368:
    store_lex "$BLOCKINIT", $P1058
.annotate "line", 346
    find_lex $P1060, "$/"
    unless_null $P1060, vivify_369
    new $P1060, "Hash"
  vivify_369:
    set $P1061, $P1060["parameter"]
    unless_null $P1061, vivify_370
    new $P1061, "Undef"
  vivify_370:
    defined $I1062, $P1061
    unless $I1062, for_undef_371
    iter $P1059, $P1061
    new $P1072, 'ExceptionHandler'
    set_addr $P1072, loop1071_handler
    $P1072."handle_types"(65, 67, 66)
    push_eh $P1072
  loop1071_test:
    unless $P1059, loop1071_done
    shift $P1063, $P1059
  loop1071_redo:
    .const 'Sub' $P1065 = "69_1258533497.4656" 
    capture_lex $P1065
    $P1065($P1063)
  loop1071_next:
    goto loop1071_test
  loop1071_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1073, exception, 'type'
    eq $P1073, 65, loop1071_next
    eq $P1073, 67, loop1071_redo
  loop1071_done:
    pop_eh 
  for_undef_371:
.annotate "line", 344
    .return ($P1059)
  control_1052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1064"  :anon :subid("69_1258533497.4656") :outer("68_1258533497.4656")
    .param pmc param_1066
.annotate "line", 346
    .lex "$_", param_1066
    find_lex $P1067, "$BLOCKINIT"
    find_lex $P1068, "$_"
    $P1069 = $P1068."ast"()
    $P1070 = $P1067."push"($P1069)
    .return ($P1070)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("70_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1078
.annotate "line", 349
    new $P1077, 'ExceptionHandler'
    set_addr $P1077, control_1076
    $P1077."handle_types"(58)
    push_eh $P1077
    .lex "self", self
    .lex "$/", param_1078
.annotate "line", 350
    new $P1079, "Undef"
    .lex "$quant", $P1079
.annotate "line", 351
    new $P1080, "Undef"
    .lex "$past", $P1080
.annotate "line", 350
    find_lex $P1081, "$/"
    unless_null $P1081, vivify_372
    new $P1081, "Hash"
  vivify_372:
    set $P1082, $P1081["quant"]
    unless_null $P1082, vivify_373
    new $P1082, "Undef"
  vivify_373:
    store_lex "$quant", $P1082
    find_lex $P1083, "$past"
.annotate "line", 352
    find_lex $P1085, "$/"
    unless_null $P1085, vivify_374
    new $P1085, "Hash"
  vivify_374:
    set $P1086, $P1085["named_param"]
    unless_null $P1086, vivify_375
    new $P1086, "Undef"
  vivify_375:
    if $P1086, if_1084
.annotate "line", 359
    find_lex $P1100, "$/"
    unless_null $P1100, vivify_376
    new $P1100, "Hash"
  vivify_376:
    set $P1101, $P1100["param_var"]
    unless_null $P1101, vivify_377
    new $P1101, "Undef"
  vivify_377:
    $P1102 = $P1101."ast"()
    store_lex "$past", $P1102
.annotate "line", 360
    find_lex $P1104, "$quant"
    set $S1105, $P1104
    iseq $I1106, $S1105, "*"
    if $I1106, if_1103
.annotate "line", 364
    find_lex $P1115, "$quant"
    set $S1116, $P1115
    iseq $I1117, $S1116, "?"
    unless $I1117, if_1114_end
.annotate "line", 365
    find_lex $P1118, "$past"
    find_lex $P1119, "$/"
    unless_null $P1119, vivify_378
    new $P1119, "Hash"
  vivify_378:
    set $P1120, $P1119["param_var"]
    unless_null $P1120, vivify_379
    new $P1120, "Hash"
  vivify_379:
    set $P1121, $P1120["sigil"]
    unless_null $P1121, vivify_380
    new $P1121, "Undef"
  vivify_380:
    $P1122 = "sigiltype"($P1121)
    $P1118."viviself"($P1122)
  if_1114_end:
.annotate "line", 364
    goto if_1103_end
  if_1103:
.annotate "line", 361
    find_lex $P1107, "$past"
    $P1107."slurpy"(1)
.annotate "line", 362
    find_lex $P1108, "$past"
    find_lex $P1109, "$/"
    unless_null $P1109, vivify_381
    new $P1109, "Hash"
  vivify_381:
    set $P1110, $P1109["param_var"]
    unless_null $P1110, vivify_382
    new $P1110, "Hash"
  vivify_382:
    set $P1111, $P1110["sigil"]
    unless_null $P1111, vivify_383
    new $P1111, "Undef"
  vivify_383:
    set $S1112, $P1111
    iseq $I1113, $S1112, "%"
    $P1108."named"($I1113)
  if_1103_end:
.annotate "line", 358
    goto if_1084_end
  if_1084:
.annotate "line", 353
    find_lex $P1087, "$/"
    unless_null $P1087, vivify_384
    new $P1087, "Hash"
  vivify_384:
    set $P1088, $P1087["named_param"]
    unless_null $P1088, vivify_385
    new $P1088, "Undef"
  vivify_385:
    $P1089 = $P1088."ast"()
    store_lex "$past", $P1089
.annotate "line", 354
    find_lex $P1091, "$quant"
    set $S1092, $P1091
    isne $I1093, $S1092, "!"
    unless $I1093, if_1090_end
.annotate "line", 355
    find_lex $P1094, "$past"
    find_lex $P1095, "$/"
    unless_null $P1095, vivify_386
    new $P1095, "Hash"
  vivify_386:
    set $P1096, $P1095["named_param"]
    unless_null $P1096, vivify_387
    new $P1096, "Hash"
  vivify_387:
    set $P1097, $P1096["param_var"]
    unless_null $P1097, vivify_388
    new $P1097, "Hash"
  vivify_388:
    set $P1098, $P1097["sigil"]
    unless_null $P1098, vivify_389
    new $P1098, "Undef"
  vivify_389:
    $P1099 = "sigiltype"($P1098)
    $P1094."viviself"($P1099)
  if_1090_end:
  if_1084_end:
.annotate "line", 368
    find_lex $P1124, "$/"
    unless_null $P1124, vivify_390
    new $P1124, "Hash"
  vivify_390:
    set $P1125, $P1124["default_value"]
    unless_null $P1125, vivify_391
    new $P1125, "Undef"
  vivify_391:
    unless $P1125, if_1123_end
.annotate "line", 369
    find_lex $P1127, "$quant"
    set $S1128, $P1127
    iseq $I1129, $S1128, "*"
    unless $I1129, if_1126_end
.annotate "line", 370
    find_lex $P1130, "$/"
    $P1131 = $P1130."CURSOR"()
    $P1131."panic"("Can't put default on slurpy parameter")
  if_1126_end:
.annotate "line", 372
    find_lex $P1133, "$quant"
    set $S1134, $P1133
    iseq $I1135, $S1134, "!"
    unless $I1135, if_1132_end
.annotate "line", 373
    find_lex $P1136, "$/"
    $P1137 = $P1136."CURSOR"()
    $P1137."panic"("Can't put default on required parameter")
  if_1132_end:
.annotate "line", 375
    find_lex $P1138, "$past"
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_392
    new $P1139, "Hash"
  vivify_392:
    set $P1140, $P1139["default_value"]
    unless_null $P1140, vivify_393
    new $P1140, "ResizablePMCArray"
  vivify_393:
    set $P1141, $P1140[0]
    unless_null $P1141, vivify_394
    new $P1141, "Hash"
  vivify_394:
    set $P1142, $P1141["EXPR"]
    unless_null $P1142, vivify_395
    new $P1142, "Undef"
  vivify_395:
    $P1143 = $P1142."ast"()
    $P1138."viviself"($P1143)
  if_1123_end:
.annotate "line", 377
    find_lex $P1145, "$past"
    $P1146 = $P1145."viviself"()
    if $P1146, unless_1144_end
    get_global $P1147, "@BLOCK"
    unless_null $P1147, vivify_396
    new $P1147, "ResizablePMCArray"
  vivify_396:
    set $P1148, $P1147[0]
    unless_null $P1148, vivify_397
    new $P1148, "Undef"
  vivify_397:
    get_global $P1149, "@BLOCK"
    unless_null $P1149, vivify_398
    new $P1149, "ResizablePMCArray"
  vivify_398:
    set $P1150, $P1149[0]
    unless_null $P1150, vivify_399
    new $P1150, "Undef"
  vivify_399:
    $P1151 = $P1150."arity"()
    set $N1152, $P1151
    new $P1153, 'Float'
    set $P1153, $N1152
    add $P1154, $P1153, 1
    $P1148."arity"($P1154)
  unless_1144_end:
.annotate "line", 378
    find_lex $P1155, "$/"
    find_lex $P1156, "$past"
    $P1157 = $P1155."!make"($P1156)
.annotate "line", 349
    .return ($P1157)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1158, exception, "payload"
    .return ($P1158)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("71_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1162
.annotate "line", 381
    new $P1161, 'ExceptionHandler'
    set_addr $P1161, control_1160
    $P1161."handle_types"(58)
    push_eh $P1161
    .lex "self", self
    .lex "$/", param_1162
.annotate "line", 382
    new $P1163, "Undef"
    .lex "$name", $P1163
.annotate "line", 383
    new $P1164, "Undef"
    .lex "$past", $P1164
.annotate "line", 382
    find_lex $P1165, "$/"
    set $S1166, $P1165
    new $P1167, 'String'
    set $P1167, $S1166
    store_lex "$name", $P1167
.annotate "line", 383
    get_hll_global $P1168, ["PAST"], "Var"
    find_lex $P1169, "$name"
    find_lex $P1170, "$/"
    $P1171 = $P1168."new"($P1169 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1170 :named("node"))
    store_lex "$past", $P1171
.annotate "line", 385
    get_global $P1172, "@BLOCK"
    unless_null $P1172, vivify_400
    new $P1172, "ResizablePMCArray"
  vivify_400:
    set $P1173, $P1172[0]
    unless_null $P1173, vivify_401
    new $P1173, "Undef"
  vivify_401:
    find_lex $P1174, "$name"
    $P1173."symbol"($P1174, "lexical" :named("scope"))
.annotate "line", 386
    find_lex $P1175, "$/"
    find_lex $P1176, "$past"
    $P1177 = $P1175."!make"($P1176)
.annotate "line", 381
    .return ($P1177)
  control_1160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1178, exception, "payload"
    .return ($P1178)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("72_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1182
.annotate "line", 389
    new $P1181, 'ExceptionHandler'
    set_addr $P1181, control_1180
    $P1181."handle_types"(58)
    push_eh $P1181
    .lex "self", self
    .lex "$/", param_1182
.annotate "line", 390
    new $P1183, "Undef"
    .lex "$past", $P1183
    find_lex $P1184, "$/"
    unless_null $P1184, vivify_402
    new $P1184, "Hash"
  vivify_402:
    set $P1185, $P1184["param_var"]
    unless_null $P1185, vivify_403
    new $P1185, "Undef"
  vivify_403:
    $P1186 = $P1185."ast"()
    store_lex "$past", $P1186
.annotate "line", 391
    find_lex $P1187, "$past"
    find_lex $P1188, "$/"
    unless_null $P1188, vivify_404
    new $P1188, "Hash"
  vivify_404:
    set $P1189, $P1188["param_var"]
    unless_null $P1189, vivify_405
    new $P1189, "Hash"
  vivify_405:
    set $P1190, $P1189["name"]
    unless_null $P1190, vivify_406
    new $P1190, "Undef"
  vivify_406:
    set $S1191, $P1190
    $P1187."named"($S1191)
.annotate "line", 392
    find_lex $P1192, "$/"
    find_lex $P1193, "$past"
    $P1194 = $P1192."!make"($P1193)
.annotate "line", 389
    .return ($P1194)
  control_1180:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1195, exception, "payload"
    .return ($P1195)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("73_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1199
    .param pmc param_1200 :optional
    .param int has_param_1200 :opt_flag
.annotate "line", 395
    .const 'Sub' $P1270 = "75_1258533497.4656" 
    capture_lex $P1270
    .const 'Sub' $P1217 = "74_1258533497.4656" 
    capture_lex $P1217
    new $P1198, 'ExceptionHandler'
    set_addr $P1198, control_1197
    $P1198."handle_types"(58)
    push_eh $P1198
    .lex "self", self
    .lex "$/", param_1199
    if has_param_1200, optparam_407
    new $P1201, "Undef"
    set param_1200, $P1201
  optparam_407:
    .lex "$key", param_1200
.annotate "line", 396
    new $P1202, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1202
.annotate "line", 399
    new $P1203, "Undef"
    .lex "$name", $P1203
.annotate "line", 400
    new $P1204, "Undef"
    .lex "$past", $P1204
.annotate "line", 396

        $P1205 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1205
.annotate "line", 399
    find_lex $P1206, "$/"
    unless_null $P1206, vivify_408
    new $P1206, "Hash"
  vivify_408:
    set $P1207, $P1206["deflongname"]
    unless_null $P1207, vivify_409
    new $P1207, "Undef"
  vivify_409:
    $P1208 = $P1207."ast"()
    set $S1209, $P1208
    new $P1210, 'String'
    set $P1210, $S1209
    store_lex "$name", $P1210
    find_lex $P1211, "$past"
.annotate "line", 401
    find_lex $P1213, "$key"
    set $S1214, $P1213
    iseq $I1215, $S1214, "open"
    if $I1215, if_1212
.annotate "line", 414
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_410
    new $P1245, "Hash"
  vivify_410:
    set $P1246, $P1245["proto"]
    unless_null $P1246, vivify_411
    new $P1246, "Undef"
  vivify_411:
    if $P1246, if_1244
.annotate "line", 441
    .const 'Sub' $P1270 = "75_1258533497.4656" 
    capture_lex $P1270
    $P1270()
    goto if_1244_end
  if_1244:
.annotate "line", 416
    get_hll_global $P1247, ["PAST"], "Stmts"
.annotate "line", 417
    get_hll_global $P1248, ["PAST"], "Block"
    find_lex $P1249, "$name"
.annotate "line", 418
    get_hll_global $P1250, ["PAST"], "Op"
.annotate "line", 419
    get_hll_global $P1251, ["PAST"], "Var"
    $P1252 = $P1251."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1253, "$name"
    $P1254 = $P1250."new"($P1252, $P1253, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 418
    find_lex $P1255, "$/"
    $P1256 = $P1248."new"($P1254, $P1249 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1255 :named("node"))
.annotate "line", 428
    get_hll_global $P1257, ["PAST"], "Block"
    new $P1258, "String"
    assign $P1258, "!PREFIX__"
    find_lex $P1259, "$name"
    concat $P1260, $P1258, $P1259
.annotate "line", 429
    get_hll_global $P1261, ["PAST"], "Op"
.annotate "line", 430
    get_hll_global $P1262, ["PAST"], "Var"
    $P1263 = $P1262."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1264, "$name"
    $P1265 = $P1261."new"($P1263, $P1264, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 429
    find_lex $P1266, "$/"
    $P1267 = $P1257."new"($P1265, $P1260 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1266 :named("node"))
.annotate "line", 428
    $P1268 = $P1247."new"($P1256, $P1267)
.annotate "line", 416
    store_lex "$past", $P1268
  if_1244_end:
.annotate "line", 414
    goto if_1212_end
  if_1212:
.annotate "line", 401
    .const 'Sub' $P1217 = "74_1258533497.4656" 
    capture_lex $P1217
    $P1217()
  if_1212_end:
.annotate "line", 457
    find_lex $P1296, "$/"
    find_lex $P1297, "$past"
    $P1298 = $P1296."!make"($P1297)
.annotate "line", 395
    .return ($P1298)
  control_1197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1299, exception, "payload"
    .return ($P1299)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1269"  :anon :subid("75_1258533497.4656") :outer("73_1258533497.4656")
.annotate "line", 442
    new $P1271, "Undef"
    .lex "$rpast", $P1271
.annotate "line", 443
    new $P1272, "Hash"
    .lex "%capnames", $P1272
.annotate "line", 442
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_412
    new $P1273, "Hash"
  vivify_412:
    set $P1274, $P1273["p6regex"]
    unless_null $P1274, vivify_413
    new $P1274, "Undef"
  vivify_413:
    $P1275 = $P1274."ast"()
    store_lex "$rpast", $P1275
.annotate "line", 443
    get_hll_global $P1276, ["Regex";"P6Regex";"Actions"], "capnames"
    find_lex $P1277, "$rpast"
    $P1278 = $P1276($P1277, 0)
    store_lex "%capnames", $P1278
.annotate "line", 444
    new $P1279, "Integer"
    assign $P1279, 0
    find_lex $P1280, "%capnames"
    unless_null $P1280, vivify_414
    new $P1280, "Hash"
    store_lex "%capnames", $P1280
  vivify_414:
    set $P1280[""], $P1279
.annotate "line", 445
    get_hll_global $P1281, ["PAST"], "Regex"
    find_lex $P1282, "$rpast"
.annotate "line", 447
    get_hll_global $P1283, ["PAST"], "Regex"
    $P1284 = $P1283."new"("pass" :named("pasttype"))
    find_lex $P1285, "%capnames"
    $P1286 = $P1281."new"($P1282, $P1284, "concat" :named("pasttype"), $P1285 :named("capnames"))
.annotate "line", 445
    store_lex "$rpast", $P1286
.annotate "line", 451
    get_global $P1287, "@BLOCK"
    $P1288 = $P1287."shift"()
    store_lex "$past", $P1288
.annotate "line", 452
    find_lex $P1289, "$past"
    $P1289."blocktype"("method")
.annotate "line", 453
    find_lex $P1290, "$past"
    find_lex $P1291, "$name"
    $P1290."name"($P1291)
.annotate "line", 454
    find_lex $P1292, "$past"
    find_lex $P1293, "$rpast"
    $P1292."push"($P1293)
.annotate "line", 455
    find_lex $P1294, "@MODIFIERS"
    $P1295 = $P1294."shift"()
.annotate "line", 441
    .return ($P1295)
.end


.namespace ["NQP";"Actions"]
.sub "_block1216"  :anon :subid("74_1258533497.4656") :outer("73_1258533497.4656")
.annotate "line", 402
    new $P1218, "Hash"
    .lex "%h", $P1218
.annotate "line", 401
    find_lex $P1219, "%h"
.annotate "line", 403
    find_lex $P1221, "$/"
    unless_null $P1221, vivify_415
    new $P1221, "Hash"
  vivify_415:
    set $P1222, $P1221["sym"]
    unless_null $P1222, vivify_416
    new $P1222, "Undef"
  vivify_416:
    set $S1223, $P1222
    iseq $I1224, $S1223, "token"
    unless $I1224, if_1220_end
    new $P1225, "Integer"
    assign $P1225, 1
    find_lex $P1226, "%h"
    unless_null $P1226, vivify_417
    new $P1226, "Hash"
    store_lex "%h", $P1226
  vivify_417:
    set $P1226["r"], $P1225
  if_1220_end:
.annotate "line", 404
    find_lex $P1228, "$/"
    unless_null $P1228, vivify_418
    new $P1228, "Hash"
  vivify_418:
    set $P1229, $P1228["sym"]
    unless_null $P1229, vivify_419
    new $P1229, "Undef"
  vivify_419:
    set $S1230, $P1229
    iseq $I1231, $S1230, "rule"
    unless $I1231, if_1227_end
    new $P1232, "Integer"
    assign $P1232, 1
    find_lex $P1233, "%h"
    unless_null $P1233, vivify_420
    new $P1233, "Hash"
    store_lex "%h", $P1233
  vivify_420:
    set $P1233["r"], $P1232
    new $P1234, "Integer"
    assign $P1234, 1
    find_lex $P1235, "%h"
    unless_null $P1235, vivify_421
    new $P1235, "Hash"
    store_lex "%h", $P1235
  vivify_421:
    set $P1235["s"], $P1234
  if_1227_end:
.annotate "line", 405
    find_lex $P1236, "@MODIFIERS"
    find_lex $P1237, "%h"
    $P1236."unshift"($P1237)
.annotate "line", 406

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 410
    get_global $P1238, "@BLOCK"
    unless_null $P1238, vivify_422
    new $P1238, "ResizablePMCArray"
  vivify_422:
    set $P1239, $P1238[0]
    unless_null $P1239, vivify_423
    new $P1239, "Undef"
  vivify_423:
    $P1239."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 411
    get_global $P1240, "@BLOCK"
    unless_null $P1240, vivify_424
    new $P1240, "ResizablePMCArray"
  vivify_424:
    set $P1241, $P1240[0]
    unless_null $P1241, vivify_425
    new $P1241, "Undef"
  vivify_425:
    $P1241."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 412
    new $P1242, "Exception"
    set $P1242['type'], 58
    new $P1243, "Integer"
    assign $P1243, 0
    setattribute $P1242, 'payload', $P1243
    throw $P1242
.annotate "line", 401
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("76_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1303
.annotate "line", 461
    new $P1302, 'ExceptionHandler'
    set_addr $P1302, control_1301
    $P1302."handle_types"(58)
    push_eh $P1302
    .lex "self", self
    .lex "$/", param_1303
.annotate "line", 462
    new $P1304, "Undef"
    .lex "$past", $P1304
    find_lex $P1307, "$/"
    unless_null $P1307, vivify_426
    new $P1307, "Hash"
  vivify_426:
    set $P1308, $P1307["args"]
    unless_null $P1308, vivify_427
    new $P1308, "Undef"
  vivify_427:
    if $P1308, if_1306
    get_hll_global $P1313, ["PAST"], "Op"
    find_lex $P1314, "$/"
    $P1315 = $P1313."new"($P1314 :named("node"))
    set $P1305, $P1315
    goto if_1306_end
  if_1306:
    find_lex $P1309, "$/"
    unless_null $P1309, vivify_428
    new $P1309, "Hash"
  vivify_428:
    set $P1310, $P1309["args"]
    unless_null $P1310, vivify_429
    new $P1310, "ResizablePMCArray"
  vivify_429:
    set $P1311, $P1310[0]
    unless_null $P1311, vivify_430
    new $P1311, "Undef"
  vivify_430:
    $P1312 = $P1311."ast"()
    set $P1305, $P1312
  if_1306_end:
    store_lex "$past", $P1305
.annotate "line", 463
    find_lex $P1316, "$past"
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_431
    new $P1317, "Hash"
  vivify_431:
    set $P1318, $P1317["identifier"]
    unless_null $P1318, vivify_432
    new $P1318, "Undef"
  vivify_432:
    set $S1319, $P1318
    $P1316."name"($S1319)
.annotate "line", 464
    find_lex $P1320, "$past"
    $P1320."pasttype"("callmethod")
.annotate "line", 465
    find_lex $P1321, "$/"
    find_lex $P1322, "$past"
    $P1323 = $P1321."!make"($P1322)
.annotate "line", 461
    .return ($P1323)
  control_1301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1324, exception, "payload"
    .return ($P1324)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("77_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1328
.annotate "line", 470
    new $P1327, 'ExceptionHandler'
    set_addr $P1327, control_1326
    $P1327."handle_types"(58)
    push_eh $P1327
    .lex "self", self
    .lex "$/", param_1328
.annotate "line", 471
    find_lex $P1329, "$/"
    get_hll_global $P1330, ["PAST"], "Var"
    $P1331 = $P1330."new"("self" :named("name"))
    $P1332 = $P1329."!make"($P1331)
.annotate "line", 470
    .return ($P1332)
  control_1326:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1333, exception, "payload"
    .return ($P1333)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("78_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1337
.annotate "line", 474
    new $P1336, 'ExceptionHandler'
    set_addr $P1336, control_1335
    $P1336."handle_types"(58)
    push_eh $P1336
    .lex "self", self
    .lex "$/", param_1337
.annotate "line", 475
    new $P1338, "Undef"
    .lex "$past", $P1338
    find_lex $P1339, "$/"
    unless_null $P1339, vivify_433
    new $P1339, "Hash"
  vivify_433:
    set $P1340, $P1339["args"]
    unless_null $P1340, vivify_434
    new $P1340, "Undef"
  vivify_434:
    $P1341 = $P1340."ast"()
    store_lex "$past", $P1341
.annotate "line", 476
    find_lex $P1342, "$past"
    find_lex $P1343, "$/"
    unless_null $P1343, vivify_435
    new $P1343, "Hash"
  vivify_435:
    set $P1344, $P1343["identifier"]
    unless_null $P1344, vivify_436
    new $P1344, "Undef"
  vivify_436:
    set $S1345, $P1344
    $P1342."name"($S1345)
.annotate "line", 477
    find_lex $P1346, "$/"
    find_lex $P1347, "$past"
    $P1348 = $P1346."!make"($P1347)
.annotate "line", 474
    .return ($P1348)
  control_1335:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1349, exception, "payload"
    .return ($P1349)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("79_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1353
.annotate "line", 480
    new $P1352, 'ExceptionHandler'
    set_addr $P1352, control_1351
    $P1352."handle_types"(58)
    push_eh $P1352
    .lex "self", self
    .lex "$/", param_1353
.annotate "line", 481
    new $P1354, "Undef"
    .lex "$ns", $P1354
.annotate "line", 486
    new $P1355, "Undef"
    .lex "$name", $P1355
.annotate "line", 487
    new $P1356, "Undef"
    .lex "$var", $P1356
.annotate "line", 489
    new $P1357, "Undef"
    .lex "$past", $P1357
.annotate "line", 481
    find_lex $P1358, "$/"
    unless_null $P1358, vivify_437
    new $P1358, "Hash"
  vivify_437:
    set $P1359, $P1358["name"]
    unless_null $P1359, vivify_438
    new $P1359, "Hash"
  vivify_438:
    set $P1360, $P1359["identifier"]
    unless_null $P1360, vivify_439
    new $P1360, "Undef"
  vivify_439:
    store_lex "$ns", $P1360
.annotate "line", 482

               $P0 = find_lex '$ns'
               $P1361 = clone $P0
           
    store_lex "$ns", $P1361
.annotate "line", 486
    find_lex $P1362, "$ns"
    $P1363 = $P1362."pop"()
    store_lex "$name", $P1363
.annotate "line", 488
    get_hll_global $P1364, ["PAST"], "Var"
    find_lex $P1365, "$name"
    set $S1366, $P1365
    find_lex $P1367, "$ns"
    $P1368 = $P1364."new"($S1366 :named("name"), $P1367 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1368
.annotate "line", 489
    find_lex $P1369, "$var"
    store_lex "$past", $P1369
.annotate "line", 490
    find_lex $P1371, "$/"
    unless_null $P1371, vivify_440
    new $P1371, "Hash"
  vivify_440:
    set $P1372, $P1371["args"]
    unless_null $P1372, vivify_441
    new $P1372, "Undef"
  vivify_441:
    unless $P1372, if_1370_end
.annotate "line", 491
    find_lex $P1373, "$/"
    unless_null $P1373, vivify_442
    new $P1373, "Hash"
  vivify_442:
    set $P1374, $P1373["args"]
    unless_null $P1374, vivify_443
    new $P1374, "ResizablePMCArray"
  vivify_443:
    set $P1375, $P1374[0]
    unless_null $P1375, vivify_444
    new $P1375, "Undef"
  vivify_444:
    $P1376 = $P1375."ast"()
    store_lex "$past", $P1376
.annotate "line", 492
    find_lex $P1377, "$past"
    find_lex $P1378, "$var"
    $P1377."unshift"($P1378)
  if_1370_end:
.annotate "line", 494
    find_lex $P1379, "$/"
    find_lex $P1380, "$past"
    $P1381 = $P1379."!make"($P1380)
.annotate "line", 480
    .return ($P1381)
  control_1351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1382, exception, "payload"
    .return ($P1382)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("80_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1386
.annotate "line", 497
    new $P1385, 'ExceptionHandler'
    set_addr $P1385, control_1384
    $P1385."handle_types"(58)
    push_eh $P1385
    .lex "self", self
    .lex "$/", param_1386
.annotate "line", 498
    new $P1387, "Undef"
    .lex "$past", $P1387
.annotate "line", 499
    new $P1388, "Undef"
    .lex "$pirop", $P1388
.annotate "line", 498
    find_lex $P1391, "$/"
    unless_null $P1391, vivify_445
    new $P1391, "Hash"
  vivify_445:
    set $P1392, $P1391["args"]
    unless_null $P1392, vivify_446
    new $P1392, "Undef"
  vivify_446:
    if $P1392, if_1390
    get_hll_global $P1397, ["PAST"], "Op"
    find_lex $P1398, "$/"
    $P1399 = $P1397."new"($P1398 :named("node"))
    set $P1389, $P1399
    goto if_1390_end
  if_1390:
    find_lex $P1393, "$/"
    unless_null $P1393, vivify_447
    new $P1393, "Hash"
  vivify_447:
    set $P1394, $P1393["args"]
    unless_null $P1394, vivify_448
    new $P1394, "ResizablePMCArray"
  vivify_448:
    set $P1395, $P1394[0]
    unless_null $P1395, vivify_449
    new $P1395, "Undef"
  vivify_449:
    $P1396 = $P1395."ast"()
    set $P1389, $P1396
  if_1390_end:
    store_lex "$past", $P1389
.annotate "line", 499
    find_lex $P1400, "$/"
    unless_null $P1400, vivify_450
    new $P1400, "Hash"
  vivify_450:
    set $P1401, $P1400["op"]
    unless_null $P1401, vivify_451
    new $P1401, "Undef"
  vivify_451:
    set $S1402, $P1401
    new $P1403, 'String'
    set $P1403, $S1402
    store_lex "$pirop", $P1403
.annotate "line", 500

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1404 = box $S0
    
    store_lex "$pirop", $P1404
.annotate "line", 507
    find_lex $P1405, "$past"
    find_lex $P1406, "$pirop"
    $P1405."pirop"($P1406)
.annotate "line", 508
    find_lex $P1407, "$past"
    $P1407."pasttype"("pirop")
.annotate "line", 509
    find_lex $P1408, "$/"
    find_lex $P1409, "$past"
    $P1410 = $P1408."!make"($P1409)
.annotate "line", 497
    .return ($P1410)
  control_1384:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1411, exception, "payload"
    .return ($P1411)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("81_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1415
.annotate "line", 512
    new $P1414, 'ExceptionHandler'
    set_addr $P1414, control_1413
    $P1414."handle_types"(58)
    push_eh $P1414
    .lex "self", self
    .lex "$/", param_1415
    find_lex $P1416, "$/"
    find_lex $P1417, "$/"
    unless_null $P1417, vivify_452
    new $P1417, "Hash"
  vivify_452:
    set $P1418, $P1417["arglist"]
    unless_null $P1418, vivify_453
    new $P1418, "Undef"
  vivify_453:
    $P1419 = $P1418."ast"()
    $P1420 = $P1416."!make"($P1419)
    .return ($P1420)
  control_1413:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1421, exception, "payload"
    .return ($P1421)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("82_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1425
.annotate "line", 514
    .const 'Sub' $P1436 = "83_1258533497.4656" 
    capture_lex $P1436
    new $P1424, 'ExceptionHandler'
    set_addr $P1424, control_1423
    $P1424."handle_types"(58)
    push_eh $P1424
    .lex "self", self
    .lex "$/", param_1425
.annotate "line", 515
    new $P1426, "Undef"
    .lex "$past", $P1426
.annotate "line", 523
    new $P1427, "Undef"
    .lex "$i", $P1427
.annotate "line", 524
    new $P1428, "Undef"
    .lex "$n", $P1428
.annotate "line", 515
    get_hll_global $P1429, ["PAST"], "Op"
    find_lex $P1430, "$/"
    $P1431 = $P1429."new"("call" :named("pasttype"), $P1430 :named("node"))
    store_lex "$past", $P1431
.annotate "line", 516
    find_lex $P1433, "$/"
    unless_null $P1433, vivify_454
    new $P1433, "Hash"
  vivify_454:
    set $P1434, $P1433["EXPR"]
    unless_null $P1434, vivify_455
    new $P1434, "Undef"
  vivify_455:
    unless $P1434, if_1432_end
    .const 'Sub' $P1436 = "83_1258533497.4656" 
    capture_lex $P1436
    $P1436()
  if_1432_end:
.annotate "line", 523
    new $P1468, "Integer"
    assign $P1468, 0
    store_lex "$i", $P1468
.annotate "line", 524
    find_lex $P1469, "$past"
    $P1470 = $P1469."list"()
    set $N1471, $P1470
    new $P1472, 'Float'
    set $P1472, $N1471
    store_lex "$n", $P1472
.annotate "line", 525
    new $P1500, 'ExceptionHandler'
    set_addr $P1500, loop1499_handler
    $P1500."handle_types"(65, 67, 66)
    push_eh $P1500
  loop1499_test:
    find_lex $P1473, "$i"
    set $N1474, $P1473
    find_lex $P1475, "$n"
    set $N1476, $P1475
    islt $I1477, $N1474, $N1476
    unless $I1477, loop1499_done
  loop1499_redo:
.annotate "line", 526
    find_lex $P1479, "$i"
    set $I1480, $P1479
    find_lex $P1481, "$past"
    unless_null $P1481, vivify_459
    new $P1481, "ResizablePMCArray"
  vivify_459:
    set $P1482, $P1481[$I1480]
    unless_null $P1482, vivify_460
    new $P1482, "Undef"
  vivify_460:
    $S1483 = $P1482."name"()
    iseq $I1484, $S1483, "&prefix:<|>"
    unless $I1484, if_1478_end
.annotate "line", 527
    find_lex $P1485, "$i"
    set $I1486, $P1485
    find_lex $P1487, "$past"
    unless_null $P1487, vivify_461
    new $P1487, "ResizablePMCArray"
  vivify_461:
    set $P1488, $P1487[$I1486]
    unless_null $P1488, vivify_462
    new $P1488, "ResizablePMCArray"
  vivify_462:
    set $P1489, $P1488[0]
    unless_null $P1489, vivify_463
    new $P1489, "Undef"
  vivify_463:
    find_lex $P1490, "$i"
    set $I1491, $P1490
    find_lex $P1492, "$past"
    unless_null $P1492, vivify_464
    new $P1492, "ResizablePMCArray"
    store_lex "$past", $P1492
  vivify_464:
    set $P1492[$I1491], $P1489
.annotate "line", 528
    find_lex $P1493, "$i"
    set $I1494, $P1493
    find_lex $P1495, "$past"
    unless_null $P1495, vivify_465
    new $P1495, "ResizablePMCArray"
  vivify_465:
    set $P1496, $P1495[$I1494]
    unless_null $P1496, vivify_466
    new $P1496, "Undef"
  vivify_466:
    $P1496."flat"(1)
  if_1478_end:
.annotate "line", 526
    find_lex $P1497, "$i"
    clone $P1498, $P1497
    inc $P1497
  loop1499_next:
.annotate "line", 525
    goto loop1499_test
  loop1499_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1501, exception, 'type'
    eq $P1501, 65, loop1499_next
    eq $P1501, 67, loop1499_redo
  loop1499_done:
    pop_eh 
.annotate "line", 532
    find_lex $P1502, "$/"
    find_lex $P1503, "$past"
    $P1504 = $P1502."!make"($P1503)
.annotate "line", 514
    .return ($P1504)
  control_1423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1505, exception, "payload"
    .return ($P1505)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1435"  :anon :subid("83_1258533497.4656") :outer("82_1258533497.4656")
.annotate "line", 516
    .const 'Sub' $P1457 = "84_1258533497.4656" 
    capture_lex $P1457
.annotate "line", 517
    new $P1437, "Undef"
    .lex "$expr", $P1437
    find_lex $P1438, "$/"
    unless_null $P1438, vivify_456
    new $P1438, "Hash"
  vivify_456:
    set $P1439, $P1438["EXPR"]
    unless_null $P1439, vivify_457
    new $P1439, "Undef"
  vivify_457:
    $P1440 = $P1439."ast"()
    store_lex "$expr", $P1440
.annotate "line", 518
    find_lex $P1445, "$expr"
    $S1446 = $P1445."name"()
    iseq $I1447, $S1446, "&infix:<,>"
    if $I1447, if_1444
    new $P1443, 'Integer'
    set $P1443, $I1447
    goto if_1444_end
  if_1444:
    find_lex $P1448, "$expr"
    $P1449 = $P1448."named"()
    isfalse $I1450, $P1449
    new $P1443, 'Integer'
    set $P1443, $I1450
  if_1444_end:
    if $P1443, if_1442
.annotate "line", 521
    find_lex $P1465, "$past"
    find_lex $P1466, "$expr"
    $P1467 = $P1465."push"($P1466)
    set $P1441, $P1467
.annotate "line", 518
    goto if_1442_end
  if_1442:
.annotate "line", 519
    find_lex $P1452, "$expr"
    $P1453 = $P1452."list"()
    defined $I1454, $P1453
    unless $I1454, for_undef_458
    iter $P1451, $P1453
    new $P1463, 'ExceptionHandler'
    set_addr $P1463, loop1462_handler
    $P1463."handle_types"(65, 67, 66)
    push_eh $P1463
  loop1462_test:
    unless $P1451, loop1462_done
    shift $P1455, $P1451
  loop1462_redo:
    .const 'Sub' $P1457 = "84_1258533497.4656" 
    capture_lex $P1457
    $P1457($P1455)
  loop1462_next:
    goto loop1462_test
  loop1462_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1464, exception, 'type'
    eq $P1464, 65, loop1462_next
    eq $P1464, 67, loop1462_redo
  loop1462_done:
    pop_eh 
  for_undef_458:
.annotate "line", 518
    set $P1441, $P1451
  if_1442_end:
.annotate "line", 516
    .return ($P1441)
.end


.namespace ["NQP";"Actions"]
.sub "_block1456"  :anon :subid("84_1258533497.4656") :outer("83_1258533497.4656")
    .param pmc param_1458
.annotate "line", 519
    .lex "$_", param_1458
    find_lex $P1459, "$past"
    find_lex $P1460, "$_"
    $P1461 = $P1459."push"($P1460)
    .return ($P1461)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("85_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1509
.annotate "line", 536
    new $P1508, 'ExceptionHandler'
    set_addr $P1508, control_1507
    $P1508."handle_types"(58)
    push_eh $P1508
    .lex "self", self
    .lex "$/", param_1509
    find_lex $P1510, "$/"
    find_lex $P1511, "$/"
    unless_null $P1511, vivify_467
    new $P1511, "Hash"
  vivify_467:
    set $P1512, $P1511["value"]
    unless_null $P1512, vivify_468
    new $P1512, "Undef"
  vivify_468:
    $P1513 = $P1512."ast"()
    $P1514 = $P1510."!make"($P1513)
    .return ($P1514)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1515, exception, "payload"
    .return ($P1515)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("86_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1519
.annotate "line", 538
    new $P1518, 'ExceptionHandler'
    set_addr $P1518, control_1517
    $P1518."handle_types"(58)
    push_eh $P1518
    .lex "self", self
    .lex "$/", param_1519
.annotate "line", 539
    find_lex $P1520, "$/"
.annotate "line", 540
    find_lex $P1523, "$/"
    unless_null $P1523, vivify_469
    new $P1523, "Hash"
  vivify_469:
    set $P1524, $P1523["EXPR"]
    unless_null $P1524, vivify_470
    new $P1524, "Undef"
  vivify_470:
    if $P1524, if_1522
.annotate "line", 541
    get_hll_global $P1529, ["PAST"], "Op"
    find_lex $P1530, "$/"
    $P1531 = $P1529."new"("list" :named("pasttype"), $P1530 :named("node"))
    set $P1521, $P1531
.annotate "line", 540
    goto if_1522_end
  if_1522:
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_471
    new $P1525, "Hash"
  vivify_471:
    set $P1526, $P1525["EXPR"]
    unless_null $P1526, vivify_472
    new $P1526, "ResizablePMCArray"
  vivify_472:
    set $P1527, $P1526[0]
    unless_null $P1527, vivify_473
    new $P1527, "Undef"
  vivify_473:
    $P1528 = $P1527."ast"()
    set $P1521, $P1528
  if_1522_end:
    $P1532 = $P1520."!make"($P1521)
.annotate "line", 538
    .return ($P1532)
  control_1517:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1533, exception, "payload"
    .return ($P1533)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("87_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1537
.annotate "line", 544
    new $P1536, 'ExceptionHandler'
    set_addr $P1536, control_1535
    $P1536."handle_types"(58)
    push_eh $P1536
    .lex "self", self
    .lex "$/", param_1537
.annotate "line", 545
    new $P1538, "Undef"
    .lex "$past", $P1538
.annotate "line", 544
    find_lex $P1539, "$past"
.annotate "line", 546
    find_lex $P1541, "$/"
    unless_null $P1541, vivify_474
    new $P1541, "Hash"
  vivify_474:
    set $P1542, $P1541["EXPR"]
    unless_null $P1542, vivify_475
    new $P1542, "Undef"
  vivify_475:
    if $P1542, if_1540
.annotate "line", 553
    get_hll_global $P1554, ["PAST"], "Op"
    $P1555 = $P1554."new"("list" :named("pasttype"))
    store_lex "$past", $P1555
.annotate "line", 552
    goto if_1540_end
  if_1540:
.annotate "line", 547
    find_lex $P1543, "$/"
    unless_null $P1543, vivify_476
    new $P1543, "Hash"
  vivify_476:
    set $P1544, $P1543["EXPR"]
    unless_null $P1544, vivify_477
    new $P1544, "ResizablePMCArray"
  vivify_477:
    set $P1545, $P1544[0]
    unless_null $P1545, vivify_478
    new $P1545, "Undef"
  vivify_478:
    $P1546 = $P1545."ast"()
    store_lex "$past", $P1546
.annotate "line", 548
    find_lex $P1548, "$past"
    $S1549 = $P1548."name"()
    isne $I1550, $S1549, "&infix:<,>"
    unless $I1550, if_1547_end
.annotate "line", 549
    get_hll_global $P1551, ["PAST"], "Op"
    find_lex $P1552, "$past"
    $P1553 = $P1551."new"($P1552, "list" :named("pasttype"))
    store_lex "$past", $P1553
  if_1547_end:
  if_1540_end:
.annotate "line", 555
    find_lex $P1556, "$past"
    $P1556."name"("&circumfix:<[ ]>")
.annotate "line", 556
    find_lex $P1557, "$/"
    find_lex $P1558, "$past"
    $P1559 = $P1557."!make"($P1558)
.annotate "line", 544
    .return ($P1559)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1560, exception, "payload"
    .return ($P1560)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("88_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1564
.annotate "line", 559
    new $P1563, 'ExceptionHandler'
    set_addr $P1563, control_1562
    $P1563."handle_types"(58)
    push_eh $P1563
    .lex "self", self
    .lex "$/", param_1564
    find_lex $P1565, "$/"
    find_lex $P1566, "$/"
    unless_null $P1566, vivify_479
    new $P1566, "Hash"
  vivify_479:
    set $P1567, $P1566["quote_EXPR"]
    unless_null $P1567, vivify_480
    new $P1567, "Undef"
  vivify_480:
    $P1568 = $P1567."ast"()
    $P1569 = $P1565."!make"($P1568)
    .return ($P1569)
  control_1562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("89_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1574
.annotate "line", 561
    new $P1573, 'ExceptionHandler'
    set_addr $P1573, control_1572
    $P1573."handle_types"(58)
    push_eh $P1573
    .lex "self", self
    .lex "$/", param_1574
.annotate "line", 562
    find_lex $P1575, "$/"
    find_lex $P1578, "$/"
    unless_null $P1578, vivify_481
    new $P1578, "Hash"
  vivify_481:
    set $P1579, $P1578["pblock"]
    unless_null $P1579, vivify_482
    new $P1579, "Hash"
  vivify_482:
    set $P1580, $P1579["blockoid"]
    unless_null $P1580, vivify_483
    new $P1580, "Hash"
  vivify_483:
    set $P1581, $P1580["statementlist"]
    unless_null $P1581, vivify_484
    new $P1581, "Hash"
  vivify_484:
    set $P1582, $P1581["statement"]
    unless_null $P1582, vivify_485
    new $P1582, "Undef"
  vivify_485:
    set $N1583, $P1582
    new $P1584, "Integer"
    assign $P1584, 0
    set $N1585, $P1584
    isgt $I1586, $N1583, $N1585
    if $I1586, if_1577
.annotate "line", 564
    get_hll_global $P1590, ["PAST"], "Op"
    find_lex $P1591, "$/"
    $P1592 = $P1590."new"("    %r = new [\"Hash\"]" :named("inline"), $P1591 :named("node"))
    set $P1576, $P1592
.annotate "line", 562
    goto if_1577_end
  if_1577:
.annotate "line", 563
    find_lex $P1587, "$/"
    unless_null $P1587, vivify_486
    new $P1587, "Hash"
  vivify_486:
    set $P1588, $P1587["pblock"]
    unless_null $P1588, vivify_487
    new $P1588, "Undef"
  vivify_487:
    $P1589 = $P1588."ast"()
    set $P1576, $P1589
  if_1577_end:
    $P1593 = $P1575."!make"($P1576)
.annotate "line", 561
    .return ($P1593)
  control_1572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1594, exception, "payload"
    .return ($P1594)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("90_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1598
.annotate "line", 567
    new $P1597, 'ExceptionHandler'
    set_addr $P1597, control_1596
    $P1597."handle_types"(58)
    push_eh $P1597
    .lex "self", self
    .lex "$/", param_1598
.annotate "line", 568
    new $P1599, "Undef"
    .lex "$name", $P1599
    find_lex $P1602, "$/"
    unless_null $P1602, vivify_488
    new $P1602, "Hash"
  vivify_488:
    set $P1603, $P1602["sigil"]
    unless_null $P1603, vivify_489
    new $P1603, "Undef"
  vivify_489:
    set $S1604, $P1603
    iseq $I1605, $S1604, "@"
    if $I1605, if_1601
.annotate "line", 569
    find_lex $P1609, "$/"
    unless_null $P1609, vivify_490
    new $P1609, "Hash"
  vivify_490:
    set $P1610, $P1609["sigil"]
    unless_null $P1610, vivify_491
    new $P1610, "Undef"
  vivify_491:
    set $S1611, $P1610
    iseq $I1612, $S1611, "%"
    if $I1612, if_1608
    new $P1614, "String"
    assign $P1614, "item"
    set $P1607, $P1614
    goto if_1608_end
  if_1608:
    new $P1613, "String"
    assign $P1613, "hash"
    set $P1607, $P1613
  if_1608_end:
    set $P1600, $P1607
.annotate "line", 568
    goto if_1601_end
  if_1601:
    new $P1606, "String"
    assign $P1606, "list"
    set $P1600, $P1606
  if_1601_end:
    store_lex "$name", $P1600
.annotate "line", 571
    find_lex $P1615, "$/"
    get_hll_global $P1616, ["PAST"], "Op"
    find_lex $P1617, "$name"
    find_lex $P1618, "$/"
    unless_null $P1618, vivify_492
    new $P1618, "Hash"
  vivify_492:
    set $P1619, $P1618["semilist"]
    unless_null $P1619, vivify_493
    new $P1619, "Undef"
  vivify_493:
    $P1620 = $P1619."ast"()
    $P1621 = $P1616."new"($P1620, "callmethod" :named("pasttype"), $P1617 :named("name"))
    $P1622 = $P1615."!make"($P1621)
.annotate "line", 567
    .return ($P1622)
  control_1596:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1623, exception, "payload"
    .return ($P1623)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("91_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1627
.annotate "line", 574
    new $P1626, 'ExceptionHandler'
    set_addr $P1626, control_1625
    $P1626."handle_types"(58)
    push_eh $P1626
    .lex "self", self
    .lex "$/", param_1627
    find_lex $P1628, "$/"
    find_lex $P1629, "$/"
    unless_null $P1629, vivify_494
    new $P1629, "Hash"
  vivify_494:
    set $P1630, $P1629["statement"]
    unless_null $P1630, vivify_495
    new $P1630, "Undef"
  vivify_495:
    $P1631 = $P1630."ast"()
    $P1632 = $P1628."!make"($P1631)
    .return ($P1632)
  control_1625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1633, exception, "payload"
    .return ($P1633)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("92_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1637
.annotate "line", 576
    new $P1636, 'ExceptionHandler'
    set_addr $P1636, control_1635
    $P1636."handle_types"(58)
    push_eh $P1636
    .lex "self", self
    .lex "$/", param_1637
.annotate "line", 577
    find_lex $P1638, "$/"
    get_hll_global $P1639, ["PAST"], "Var"
    find_lex $P1640, "$/"
    unless_null $P1640, vivify_496
    new $P1640, "Hash"
  vivify_496:
    set $P1641, $P1640["EXPR"]
    unless_null $P1641, vivify_497
    new $P1641, "Undef"
  vivify_497:
    $P1642 = $P1641."ast"()
    $P1643 = $P1639."new"($P1642, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1644 = $P1638."!make"($P1643)
.annotate "line", 576
    .return ($P1644)
  control_1635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1645, exception, "payload"
    .return ($P1645)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("93_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1649
.annotate "line", 582
    new $P1648, 'ExceptionHandler'
    set_addr $P1648, control_1647
    $P1648."handle_types"(58)
    push_eh $P1648
    .lex "self", self
    .lex "$/", param_1649
.annotate "line", 583
    find_lex $P1650, "$/"
    get_hll_global $P1651, ["PAST"], "Var"
    find_lex $P1652, "$/"
    unless_null $P1652, vivify_498
    new $P1652, "Hash"
  vivify_498:
    set $P1653, $P1652["EXPR"]
    unless_null $P1653, vivify_499
    new $P1653, "Undef"
  vivify_499:
    $P1654 = $P1653."ast"()
    $P1655 = $P1651."new"($P1654, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1656 = $P1650."!make"($P1655)
.annotate "line", 582
    .return ($P1656)
  control_1647:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1657, exception, "payload"
    .return ($P1657)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("94_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1661
.annotate "line", 588
    new $P1660, 'ExceptionHandler'
    set_addr $P1660, control_1659
    $P1660."handle_types"(58)
    push_eh $P1660
    .lex "self", self
    .lex "$/", param_1661
.annotate "line", 589
    find_lex $P1662, "$/"
    get_hll_global $P1663, ["PAST"], "Var"
    find_lex $P1664, "$/"
    unless_null $P1664, vivify_500
    new $P1664, "Hash"
  vivify_500:
    set $P1665, $P1664["quote_EXPR"]
    unless_null $P1665, vivify_501
    new $P1665, "Undef"
  vivify_501:
    $P1666 = $P1665."ast"()
    $P1667 = $P1663."new"($P1666, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1668 = $P1662."!make"($P1667)
.annotate "line", 588
    .return ($P1668)
  control_1659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1669, exception, "payload"
    .return ($P1669)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("95_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1673
.annotate "line", 594
    new $P1672, 'ExceptionHandler'
    set_addr $P1672, control_1671
    $P1672."handle_types"(58)
    push_eh $P1672
    .lex "self", self
    .lex "$/", param_1673
.annotate "line", 595
    find_lex $P1674, "$/"
    find_lex $P1675, "$/"
    unless_null $P1675, vivify_502
    new $P1675, "Hash"
  vivify_502:
    set $P1676, $P1675["arglist"]
    unless_null $P1676, vivify_503
    new $P1676, "Undef"
  vivify_503:
    $P1677 = $P1676."ast"()
    $P1678 = $P1674."!make"($P1677)
.annotate "line", 594
    .return ($P1678)
  control_1671:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1679, exception, "payload"
    .return ($P1679)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("96_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1683
.annotate "line", 598
    new $P1682, 'ExceptionHandler'
    set_addr $P1682, control_1681
    $P1682."handle_types"(58)
    push_eh $P1682
    .lex "self", self
    .lex "$/", param_1683
.annotate "line", 599
    new $P1684, "Undef"
    .lex "$past", $P1684
.annotate "line", 600
    find_lex $P1687, "$/"
    unless_null $P1687, vivify_504
    new $P1687, "Hash"
  vivify_504:
    set $P1688, $P1687["quote"]
    unless_null $P1688, vivify_505
    new $P1688, "Undef"
  vivify_505:
    if $P1688, if_1686
.annotate "line", 601
    get_hll_global $P1692, ["PAST"], "Val"
.annotate "line", 603
    find_lex $P1695, "$/"
    unless_null $P1695, vivify_506
    new $P1695, "Hash"
  vivify_506:
    set $P1696, $P1695["dec_number"]
    unless_null $P1696, vivify_507
    new $P1696, "Undef"
  vivify_507:
    if $P1696, if_1694
.annotate "line", 604
    find_lex $P1700, "$/"
    unless_null $P1700, vivify_508
    new $P1700, "Hash"
  vivify_508:
    set $P1701, $P1700["integer"]
    unless_null $P1701, vivify_509
    new $P1701, "Undef"
  vivify_509:
    $P1702 = $P1701."ast"()
    set $P1693, $P1702
.annotate "line", 603
    goto if_1694_end
  if_1694:
    find_lex $P1697, "$/"
    unless_null $P1697, vivify_510
    new $P1697, "Hash"
  vivify_510:
    set $P1698, $P1697["dec_number"]
    unless_null $P1698, vivify_511
    new $P1698, "Undef"
  vivify_511:
    $P1699 = $P1698."ast"()
    set $P1693, $P1699
  if_1694_end:
    $P1703 = $P1692."new"($P1693 :named("value"))
.annotate "line", 601
    set $P1685, $P1703
.annotate "line", 600
    goto if_1686_end
  if_1686:
    find_lex $P1689, "$/"
    unless_null $P1689, vivify_512
    new $P1689, "Hash"
  vivify_512:
    set $P1690, $P1689["quote"]
    unless_null $P1690, vivify_513
    new $P1690, "Undef"
  vivify_513:
    $P1691 = $P1690."ast"()
    set $P1685, $P1691
  if_1686_end:
    store_lex "$past", $P1685
.annotate "line", 606
    find_lex $P1704, "$/"
    find_lex $P1705, "$past"
    $P1706 = $P1704."!make"($P1705)
.annotate "line", 598
    .return ($P1706)
  control_1681:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1707, exception, "payload"
    .return ($P1707)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("97_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1711
.annotate "line", 609
    new $P1710, 'ExceptionHandler'
    set_addr $P1710, control_1709
    $P1710."handle_types"(58)
    push_eh $P1710
    .lex "self", self
    .lex "$/", param_1711
    find_lex $P1712, "$/"
    find_lex $P1713, "$/"
    unless_null $P1713, vivify_514
    new $P1713, "Hash"
  vivify_514:
    set $P1714, $P1713["quote_EXPR"]
    unless_null $P1714, vivify_515
    new $P1714, "Undef"
  vivify_515:
    $P1715 = $P1714."ast"()
    $P1716 = $P1712."!make"($P1715)
    .return ($P1716)
  control_1709:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1717, exception, "payload"
    .return ($P1717)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("98_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1721
.annotate "line", 610
    new $P1720, 'ExceptionHandler'
    set_addr $P1720, control_1719
    $P1720."handle_types"(58)
    push_eh $P1720
    .lex "self", self
    .lex "$/", param_1721
    find_lex $P1722, "$/"
    find_lex $P1723, "$/"
    unless_null $P1723, vivify_516
    new $P1723, "Hash"
  vivify_516:
    set $P1724, $P1723["quote_EXPR"]
    unless_null $P1724, vivify_517
    new $P1724, "Undef"
  vivify_517:
    $P1725 = $P1724."ast"()
    $P1726 = $P1722."!make"($P1725)
    .return ($P1726)
  control_1719:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1727, exception, "payload"
    .return ($P1727)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("99_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1731
.annotate "line", 611
    new $P1730, 'ExceptionHandler'
    set_addr $P1730, control_1729
    $P1730."handle_types"(58)
    push_eh $P1730
    .lex "self", self
    .lex "$/", param_1731
    find_lex $P1732, "$/"
    find_lex $P1733, "$/"
    unless_null $P1733, vivify_518
    new $P1733, "Hash"
  vivify_518:
    set $P1734, $P1733["quote_EXPR"]
    unless_null $P1734, vivify_519
    new $P1734, "Undef"
  vivify_519:
    $P1735 = $P1734."ast"()
    $P1736 = $P1732."!make"($P1735)
    .return ($P1736)
  control_1729:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1737, exception, "payload"
    .return ($P1737)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("100_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1741
.annotate "line", 612
    new $P1740, 'ExceptionHandler'
    set_addr $P1740, control_1739
    $P1740."handle_types"(58)
    push_eh $P1740
    .lex "self", self
    .lex "$/", param_1741
    find_lex $P1742, "$/"
    find_lex $P1743, "$/"
    unless_null $P1743, vivify_520
    new $P1743, "Hash"
  vivify_520:
    set $P1744, $P1743["quote_EXPR"]
    unless_null $P1744, vivify_521
    new $P1744, "Undef"
  vivify_521:
    $P1745 = $P1744."ast"()
    $P1746 = $P1742."!make"($P1745)
    .return ($P1746)
  control_1739:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1747, exception, "payload"
    .return ($P1747)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("101_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1751
.annotate "line", 613
    new $P1750, 'ExceptionHandler'
    set_addr $P1750, control_1749
    $P1750."handle_types"(58)
    push_eh $P1750
    .lex "self", self
    .lex "$/", param_1751
    find_lex $P1752, "$/"
    find_lex $P1753, "$/"
    unless_null $P1753, vivify_522
    new $P1753, "Hash"
  vivify_522:
    set $P1754, $P1753["quote_EXPR"]
    unless_null $P1754, vivify_523
    new $P1754, "Undef"
  vivify_523:
    $P1755 = $P1754."ast"()
    $P1756 = $P1752."!make"($P1755)
    .return ($P1756)
  control_1749:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1757, exception, "payload"
    .return ($P1757)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("102_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1761
.annotate "line", 614
    new $P1760, 'ExceptionHandler'
    set_addr $P1760, control_1759
    $P1760."handle_types"(58)
    push_eh $P1760
    .lex "self", self
    .lex "$/", param_1761
.annotate "line", 615
    find_lex $P1762, "$/"
    get_hll_global $P1763, ["PAST"], "Op"
    find_lex $P1764, "$/"
    unless_null $P1764, vivify_524
    new $P1764, "Hash"
  vivify_524:
    set $P1765, $P1764["quote_EXPR"]
    unless_null $P1765, vivify_525
    new $P1765, "Undef"
  vivify_525:
    $P1766 = $P1765."ast"()
    $P1767 = $P1766."value"()
    find_lex $P1768, "$/"
    $P1769 = $P1763."new"($P1767 :named("inline"), "inline" :named("pasttype"), $P1768 :named("node"))
    $P1770 = $P1762."!make"($P1769)
.annotate "line", 614
    .return ($P1770)
  control_1759:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1771, exception, "payload"
    .return ($P1771)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("103_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1775
.annotate "line", 620
    new $P1774, 'ExceptionHandler'
    set_addr $P1774, control_1773
    $P1774."handle_types"(58)
    push_eh $P1774
    .lex "self", self
    .lex "$/", param_1775
    find_lex $P1776, "$/"
    find_lex $P1777, "$/"
    unless_null $P1777, vivify_526
    new $P1777, "Hash"
  vivify_526:
    set $P1778, $P1777["variable"]
    unless_null $P1778, vivify_527
    new $P1778, "Undef"
  vivify_527:
    $P1779 = $P1778."ast"()
    $P1780 = $P1776."!make"($P1779)
    .return ($P1780)
  control_1773:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1781, exception, "payload"
    .return ($P1781)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("104_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1785
.annotate "line", 621
    new $P1784, 'ExceptionHandler'
    set_addr $P1784, control_1783
    $P1784."handle_types"(58)
    push_eh $P1784
    .lex "self", self
    .lex "$/", param_1785
.annotate "line", 622
    find_lex $P1786, "$/"
    get_hll_global $P1787, ["PAST"], "Op"
.annotate "line", 623
    find_lex $P1788, "$/"
    unless_null $P1788, vivify_528
    new $P1788, "Hash"
  vivify_528:
    set $P1789, $P1788["block"]
    unless_null $P1789, vivify_529
    new $P1789, "Undef"
  vivify_529:
    $P1790 = $P1789."ast"()
    $P1791 = "block_immediate"($P1790)
    find_lex $P1792, "$/"
    $P1793 = $P1787."new"($P1791, "set S*" :named("pirop"), $P1792 :named("node"))
.annotate "line", 622
    $P1794 = $P1786."!make"($P1793)
.annotate "line", 621
    .return ($P1794)
  control_1783:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1795, exception, "payload"
    .return ($P1795)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("105_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1799
.annotate "line", 629
    new $P1798, 'ExceptionHandler'
    set_addr $P1798, control_1797
    $P1798."handle_types"(58)
    push_eh $P1798
    .lex "self", self
    .lex "$/", param_1799
    find_lex $P1800, "$/"
    find_lex $P1801, "$/"
    unless_null $P1801, vivify_530
    new $P1801, "Hash"
  vivify_530:
    set $P1802, $P1801["dotty"]
    unless_null $P1802, vivify_531
    new $P1802, "Undef"
  vivify_531:
    $P1803 = $P1802."ast"()
    $P1804 = $P1800."!make"($P1803)
    .return ($P1804)
  control_1797:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1805, exception, "payload"
    .return ($P1805)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("106_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1809
.annotate "line", 631
    new $P1808, 'ExceptionHandler'
    set_addr $P1808, control_1807
    $P1808."handle_types"(58)
    push_eh $P1808
    .lex "self", self
    .lex "$/", param_1809
.annotate "line", 632
    find_lex $P1810, "$/"
    get_hll_global $P1811, ["PAST"], "Op"
.annotate "line", 633
    new $P1812, "ResizablePMCArray"
    push $P1812, "    clone %r, %0"
    push $P1812, "    inc %0"
    $P1813 = $P1811."new"("postfix:<++>" :named("name"), $P1812 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 632
    $P1814 = $P1810."!make"($P1813)
.annotate "line", 631
    .return ($P1814)
  control_1807:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1815, exception, "payload"
    .return ($P1815)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("107_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1819
.annotate "line", 637
    new $P1818, 'ExceptionHandler'
    set_addr $P1818, control_1817
    $P1818."handle_types"(58)
    push_eh $P1818
    .lex "self", self
    .lex "$/", param_1819
.annotate "line", 638
    find_lex $P1820, "$/"
    get_hll_global $P1821, ["PAST"], "Op"
.annotate "line", 639
    new $P1822, "ResizablePMCArray"
    push $P1822, "    clone %r, %0"
    push $P1822, "    dec %0"
    $P1823 = $P1821."new"("postfix:<-->" :named("name"), $P1822 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 638
    $P1824 = $P1820."!make"($P1823)
.annotate "line", 637
    .return ($P1824)
  control_1817:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1825, exception, "payload"
    .return ($P1825)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("108_1258533497.4656") :method :outer("11_1258533497.4656")
    .param pmc param_1829
.annotate "line", 643
    new $P1828, 'ExceptionHandler'
    set_addr $P1828, control_1827
    $P1828."handle_types"(58)
    push_eh $P1828
    .lex "self", self
    .lex "$/", param_1829
.annotate "line", 644
    find_lex $P1830, "$/"
    get_hll_global $P1831, ["PAST"], "Op"
.annotate "line", 645
    get_hll_global $P1832, ["PAST"], "Var"
    $P1833 = $P1832."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1834, "$/"
    $P1835 = $P1831."new"($P1833, "callmethod" :named("pasttype"), "!make" :named("name"), $P1834 :named("node"))
.annotate "line", 644
    $P1836 = $P1830."!make"($P1835)
.annotate "line", 643
    .return ($P1836)
  control_1827:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1837, exception, "payload"
    .return ($P1837)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1838"  :subid("109_1258533497.4656") :outer("11_1258533497.4656")
.annotate "line", 653
    .const 'Sub' $P1874 = "113_1258533497.4656" 
    capture_lex $P1874
    .const 'Sub' $P1864 = "112_1258533497.4656" 
    capture_lex $P1864
    .const 'Sub' $P1854 = "111_1258533497.4656" 
    capture_lex $P1854
    .const 'Sub' $P1840 = "110_1258533497.4656" 
    capture_lex $P1840
.annotate "line", 664
    .const 'Sub' $P1874 = "113_1258533497.4656" 
    capture_lex $P1874
.annotate "line", 653
    .return ($P1874)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("110_1258533497.4656") :method :outer("109_1258533497.4656")
    .param pmc param_1843
.annotate "line", 655
    new $P1842, 'ExceptionHandler'
    set_addr $P1842, control_1841
    $P1842."handle_types"(58)
    push_eh $P1842
    .lex "self", self
    .lex "$/", param_1843
.annotate "line", 656
    new $P1844, "Undef"
    .lex "$past", $P1844
    find_lex $P1845, "$/"
    unless_null $P1845, vivify_532
    new $P1845, "Hash"
  vivify_532:
    set $P1846, $P1845["statement"]
    unless_null $P1846, vivify_533
    new $P1846, "Undef"
  vivify_533:
    $P1847 = $P1846."ast"()
    store_lex "$past", $P1847
.annotate "line", 657
    find_lex $P1848, "$/"
    get_hll_global $P1849, ["PAST"], "Regex"
    find_lex $P1850, "$past"
    $P1851 = $P1849."new"($P1850, "pastnode" :named("pasttype"))
    $P1852 = $P1848."!make"($P1851)
.annotate "line", 655
    .return ($P1852)
  control_1841:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1853, exception, "payload"
    .return ($P1853)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("111_1258533497.4656") :method :outer("109_1258533497.4656")
    .param pmc param_1857
.annotate "line", 660
    new $P1856, 'ExceptionHandler'
    set_addr $P1856, control_1855
    $P1856."handle_types"(58)
    push_eh $P1856
    .lex "self", self
    .lex "$/", param_1857
    find_lex $P1858, "$/"
    find_lex $P1859, "$/"
    unless_null $P1859, vivify_534
    new $P1859, "Hash"
  vivify_534:
    set $P1860, $P1859["codeblock"]
    unless_null $P1860, vivify_535
    new $P1860, "Undef"
  vivify_535:
    $P1861 = $P1860."ast"()
    $P1862 = $P1858."!make"($P1861)
    .return ($P1862)
  control_1855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1863, exception, "payload"
    .return ($P1863)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("112_1258533497.4656") :method :outer("109_1258533497.4656")
    .param pmc param_1867
.annotate "line", 662
    new $P1866, 'ExceptionHandler'
    set_addr $P1866, control_1865
    $P1866."handle_types"(58)
    push_eh $P1866
    .lex "self", self
    .lex "$/", param_1867
    find_lex $P1868, "$/"
    find_lex $P1869, "$/"
    unless_null $P1869, vivify_536
    new $P1869, "Hash"
  vivify_536:
    set $P1870, $P1869["codeblock"]
    unless_null $P1870, vivify_537
    new $P1870, "Undef"
  vivify_537:
    $P1871 = $P1870."ast"()
    $P1872 = $P1868."!make"($P1871)
    .return ($P1872)
  control_1865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1873, exception, "payload"
    .return ($P1873)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("113_1258533497.4656") :method :outer("109_1258533497.4656")
    .param pmc param_1877
.annotate "line", 664
    new $P1876, 'ExceptionHandler'
    set_addr $P1876, control_1875
    $P1876."handle_types"(58)
    push_eh $P1876
    .lex "self", self
    .lex "$/", param_1877
.annotate "line", 665
    new $P1878, "Undef"
    .lex "$block", $P1878
.annotate "line", 667
    new $P1879, "Undef"
    .lex "$past", $P1879
.annotate "line", 665
    find_lex $P1880, "$/"
    unless_null $P1880, vivify_538
    new $P1880, "Hash"
  vivify_538:
    set $P1881, $P1880["block"]
    unless_null $P1881, vivify_539
    new $P1881, "Undef"
  vivify_539:
    $P1882 = $P1881."ast"()
    store_lex "$block", $P1882
.annotate "line", 666
    find_lex $P1883, "$block"
    $P1883."blocktype"("immediate")
.annotate "line", 668
    get_hll_global $P1884, ["PAST"], "Regex"
.annotate "line", 669
    get_hll_global $P1885, ["PAST"], "Stmts"
.annotate "line", 670
    get_hll_global $P1886, ["PAST"], "Op"
.annotate "line", 671
    get_hll_global $P1887, ["PAST"], "Var"
    $P1888 = $P1887."new"("$/" :named("name"))
.annotate "line", 672
    get_hll_global $P1889, ["PAST"], "Op"
.annotate "line", 673
    get_hll_global $P1890, ["PAST"], "Var"
    $P1891 = $P1890."new"(unicode:"$\x{a2}" :named("name"))
    $P1892 = $P1889."new"($P1891, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 672
    $P1893 = $P1886."new"($P1888, $P1892, "bind" :named("pasttype"))
.annotate "line", 670
    find_lex $P1894, "$block"
    $P1895 = $P1885."new"($P1893, $P1894)
.annotate "line", 669
    $P1896 = $P1884."new"($P1895, "pastnode" :named("pasttype"))
.annotate "line", 668
    store_lex "$past", $P1896
.annotate "line", 683
    find_lex $P1897, "$/"
    find_lex $P1898, "$past"
    $P1899 = $P1897."!make"($P1898)
.annotate "line", 664
    .return ($P1899)
  control_1875:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1900, exception, "payload"
    .return ($P1900)
    rethrow exception
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
