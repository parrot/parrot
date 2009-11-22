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
.sub "_block11"  :anon :subid("10_1258897739.74728")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1081 = $P14()
.annotate "line", 1
    .return ($P1081)
.end


.namespace []
.sub "" :load :init :subid("post312") :outer("10_1258897739.74728")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258897739.74728" 
    .local pmc block
    set block, $P12
    $P1082 = get_root_global ["parrot"], "P6metaclass"
    $P1082."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258897739.74728") :outer("10_1258897739.74728")
.annotate "line", 4
    get_hll_global $P1030, ["NQP";"Regex"], "_block1029" 
    capture_lex $P1030
    .const 'Sub' $P1024 = "297_1258897739.74728" 
    capture_lex $P1024
    .const 'Sub' $P1019 = "295_1258897739.74728" 
    capture_lex $P1019
    .const 'Sub' $P1013 = "293_1258897739.74728" 
    capture_lex $P1013
    .const 'Sub' $P1007 = "291_1258897739.74728" 
    capture_lex $P1007
    .const 'Sub' $P1001 = "289_1258897739.74728" 
    capture_lex $P1001
    .const 'Sub' $P995 = "287_1258897739.74728" 
    capture_lex $P995
    .const 'Sub' $P990 = "285_1258897739.74728" 
    capture_lex $P990
    .const 'Sub' $P984 = "283_1258897739.74728" 
    capture_lex $P984
    .const 'Sub' $P978 = "281_1258897739.74728" 
    capture_lex $P978
    .const 'Sub' $P972 = "279_1258897739.74728" 
    capture_lex $P972
    .const 'Sub' $P966 = "277_1258897739.74728" 
    capture_lex $P966
    .const 'Sub' $P960 = "275_1258897739.74728" 
    capture_lex $P960
    .const 'Sub' $P954 = "273_1258897739.74728" 
    capture_lex $P954
    .const 'Sub' $P948 = "271_1258897739.74728" 
    capture_lex $P948
    .const 'Sub' $P942 = "269_1258897739.74728" 
    capture_lex $P942
    .const 'Sub' $P936 = "267_1258897739.74728" 
    capture_lex $P936
    .const 'Sub' $P930 = "265_1258897739.74728" 
    capture_lex $P930
    .const 'Sub' $P924 = "263_1258897739.74728" 
    capture_lex $P924
    .const 'Sub' $P918 = "261_1258897739.74728" 
    capture_lex $P918
    .const 'Sub' $P912 = "259_1258897739.74728" 
    capture_lex $P912
    .const 'Sub' $P906 = "257_1258897739.74728" 
    capture_lex $P906
    .const 'Sub' $P900 = "255_1258897739.74728" 
    capture_lex $P900
    .const 'Sub' $P894 = "253_1258897739.74728" 
    capture_lex $P894
    .const 'Sub' $P888 = "251_1258897739.74728" 
    capture_lex $P888
    .const 'Sub' $P882 = "249_1258897739.74728" 
    capture_lex $P882
    .const 'Sub' $P876 = "247_1258897739.74728" 
    capture_lex $P876
    .const 'Sub' $P870 = "245_1258897739.74728" 
    capture_lex $P870
    .const 'Sub' $P864 = "243_1258897739.74728" 
    capture_lex $P864
    .const 'Sub' $P858 = "241_1258897739.74728" 
    capture_lex $P858
    .const 'Sub' $P852 = "239_1258897739.74728" 
    capture_lex $P852
    .const 'Sub' $P846 = "237_1258897739.74728" 
    capture_lex $P846
    .const 'Sub' $P840 = "235_1258897739.74728" 
    capture_lex $P840
    .const 'Sub' $P834 = "233_1258897739.74728" 
    capture_lex $P834
    .const 'Sub' $P828 = "231_1258897739.74728" 
    capture_lex $P828
    .const 'Sub' $P822 = "229_1258897739.74728" 
    capture_lex $P822
    .const 'Sub' $P816 = "227_1258897739.74728" 
    capture_lex $P816
    .const 'Sub' $P810 = "225_1258897739.74728" 
    capture_lex $P810
    .const 'Sub' $P804 = "223_1258897739.74728" 
    capture_lex $P804
    .const 'Sub' $P798 = "221_1258897739.74728" 
    capture_lex $P798
    .const 'Sub' $P792 = "219_1258897739.74728" 
    capture_lex $P792
    .const 'Sub' $P787 = "217_1258897739.74728" 
    capture_lex $P787
    .const 'Sub' $P782 = "215_1258897739.74728" 
    capture_lex $P782
    .const 'Sub' $P778 = "213_1258897739.74728" 
    capture_lex $P778
    .const 'Sub' $P773 = "211_1258897739.74728" 
    capture_lex $P773
    .const 'Sub' $P768 = "209_1258897739.74728" 
    capture_lex $P768
    .const 'Sub' $P764 = "207_1258897739.74728" 
    capture_lex $P764
    .const 'Sub' $P760 = "205_1258897739.74728" 
    capture_lex $P760
    .const 'Sub' $P754 = "203_1258897739.74728" 
    capture_lex $P754
    .const 'Sub' $P747 = "201_1258897739.74728" 
    capture_lex $P747
    .const 'Sub' $P743 = "199_1258897739.74728" 
    capture_lex $P743
    .const 'Sub' $P739 = "197_1258897739.74728" 
    capture_lex $P739
    .const 'Sub' $P732 = "195_1258897739.74728" 
    capture_lex $P732
    .const 'Sub' $P725 = "193_1258897739.74728" 
    capture_lex $P725
    .const 'Sub' $P721 = "191_1258897739.74728" 
    capture_lex $P721
    .const 'Sub' $P717 = "189_1258897739.74728" 
    capture_lex $P717
    .const 'Sub' $P712 = "187_1258897739.74728" 
    capture_lex $P712
    .const 'Sub' $P707 = "185_1258897739.74728" 
    capture_lex $P707
    .const 'Sub' $P702 = "183_1258897739.74728" 
    capture_lex $P702
    .const 'Sub' $P697 = "181_1258897739.74728" 
    capture_lex $P697
    .const 'Sub' $P693 = "179_1258897739.74728" 
    capture_lex $P693
    .const 'Sub' $P689 = "177_1258897739.74728" 
    capture_lex $P689
    .const 'Sub' $P677 = "173_1258897739.74728" 
    capture_lex $P677
    .const 'Sub' $P672 = "171_1258897739.74728" 
    capture_lex $P672
    .const 'Sub' $P666 = "169_1258897739.74728" 
    capture_lex $P666
    .const 'Sub' $P661 = "167_1258897739.74728" 
    capture_lex $P661
    .const 'Sub' $P654 = "165_1258897739.74728" 
    capture_lex $P654
    .const 'Sub' $P647 = "163_1258897739.74728" 
    capture_lex $P647
    .const 'Sub' $P642 = "161_1258897739.74728" 
    capture_lex $P642
    .const 'Sub' $P637 = "159_1258897739.74728" 
    capture_lex $P637
    .const 'Sub' $P623 = "155_1258897739.74728" 
    capture_lex $P623
    .const 'Sub' $P592 = "153_1258897739.74728" 
    capture_lex $P592
    .const 'Sub' $P585 = "151_1258897739.74728" 
    capture_lex $P585
    .const 'Sub' $P580 = "149_1258897739.74728" 
    capture_lex $P580
    .const 'Sub' $P571 = "147_1258897739.74728" 
    capture_lex $P571
    .const 'Sub' $P557 = "145_1258897739.74728" 
    capture_lex $P557
    .const 'Sub' $P549 = "143_1258897739.74728" 
    capture_lex $P549
    .const 'Sub' $P531 = "141_1258897739.74728" 
    capture_lex $P531
    .const 'Sub' $P513 = "139_1258897739.74728" 
    capture_lex $P513
    .const 'Sub' $P507 = "137_1258897739.74728" 
    capture_lex $P507
    .const 'Sub' $P501 = "135_1258897739.74728" 
    capture_lex $P501
    .const 'Sub' $P492 = "131_1258897739.74728" 
    capture_lex $P492
    .const 'Sub' $P482 = "129_1258897739.74728" 
    capture_lex $P482
    .const 'Sub' $P476 = "127_1258897739.74728" 
    capture_lex $P476
    .const 'Sub' $P470 = "125_1258897739.74728" 
    capture_lex $P470
    .const 'Sub' $P464 = "123_1258897739.74728" 
    capture_lex $P464
    .const 'Sub' $P438 = "119_1258897739.74728" 
    capture_lex $P438
    .const 'Sub' $P430 = "117_1258897739.74728" 
    capture_lex $P430
    .const 'Sub' $P424 = "115_1258897739.74728" 
    capture_lex $P424
    .const 'Sub' $P416 = "111_1258897739.74728" 
    capture_lex $P416
    .const 'Sub' $P412 = "109_1258897739.74728" 
    capture_lex $P412
    .const 'Sub' $P401 = "107_1258897739.74728" 
    capture_lex $P401
    .const 'Sub' $P391 = "105_1258897739.74728" 
    capture_lex $P391
    .const 'Sub' $P387 = "103_1258897739.74728" 
    capture_lex $P387
    .const 'Sub' $P382 = "101_1258897739.74728" 
    capture_lex $P382
    .const 'Sub' $P377 = "99_1258897739.74728" 
    capture_lex $P377
    .const 'Sub' $P372 = "97_1258897739.74728" 
    capture_lex $P372
    .const 'Sub' $P367 = "95_1258897739.74728" 
    capture_lex $P367
    .const 'Sub' $P362 = "93_1258897739.74728" 
    capture_lex $P362
    .const 'Sub' $P357 = "91_1258897739.74728" 
    capture_lex $P357
    .const 'Sub' $P352 = "89_1258897739.74728" 
    capture_lex $P352
    .const 'Sub' $P345 = "87_1258897739.74728" 
    capture_lex $P345
    .const 'Sub' $P338 = "85_1258897739.74728" 
    capture_lex $P338
    .const 'Sub' $P327 = "81_1258897739.74728" 
    capture_lex $P327
    .const 'Sub' $P320 = "79_1258897739.74728" 
    capture_lex $P320
    .const 'Sub' $P311 = "75_1258897739.74728" 
    capture_lex $P311
    .const 'Sub' $P305 = "73_1258897739.74728" 
    capture_lex $P305
    .const 'Sub' $P294 = "69_1258897739.74728" 
    capture_lex $P294
    .const 'Sub' $P275 = "67_1258897739.74728" 
    capture_lex $P275
    .const 'Sub' $P267 = "65_1258897739.74728" 
    capture_lex $P267
    .const 'Sub' $P250 = "62_1258897739.74728" 
    capture_lex $P250
    .const 'Sub' $P231 = "60_1258897739.74728" 
    capture_lex $P231
    .const 'Sub' $P223 = "56_1258897739.74728" 
    capture_lex $P223
    .const 'Sub' $P219 = "54_1258897739.74728" 
    capture_lex $P219
    .const 'Sub' $P211 = "50_1258897739.74728" 
    capture_lex $P211
    .const 'Sub' $P207 = "48_1258897739.74728" 
    capture_lex $P207
    .const 'Sub' $P200 = "46_1258897739.74728" 
    capture_lex $P200
    .const 'Sub' $P194 = "44_1258897739.74728" 
    capture_lex $P194
    .const 'Sub' $P189 = "42_1258897739.74728" 
    capture_lex $P189
    .const 'Sub' $P182 = "40_1258897739.74728" 
    capture_lex $P182
    .const 'Sub' $P177 = "38_1258897739.74728" 
    capture_lex $P177
    .const 'Sub' $P172 = "36_1258897739.74728" 
    capture_lex $P172
    .const 'Sub' $P157 = "33_1258897739.74728" 
    capture_lex $P157
    .const 'Sub' $P145 = "31_1258897739.74728" 
    capture_lex $P145
    .const 'Sub' $P139 = "29_1258897739.74728" 
    capture_lex $P139
    .const 'Sub' $P97 = "26_1258897739.74728" 
    capture_lex $P97
    .const 'Sub' $P80 = "23_1258897739.74728" 
    capture_lex $P80
    .const 'Sub' $P71 = "21_1258897739.74728" 
    capture_lex $P71
    .const 'Sub' $P58 = "19_1258897739.74728" 
    capture_lex $P58
    .const 'Sub' $P44 = "17_1258897739.74728" 
    capture_lex $P44
    .const 'Sub' $P38 = "15_1258897739.74728" 
    capture_lex $P38
    .const 'Sub' $P33 = "13_1258897739.74728" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258897739.74728" 
    capture_lex $P15
.annotate "line", 489
    get_hll_global $P1030, ["NQP";"Regex"], "_block1029" 
    capture_lex $P1030
    $P1064 = $P1030()
.annotate "line", 4
    .return ($P1064)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post313") :outer("11_1258897739.74728")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 382
    get_hll_global $P1065, ["NQP"], "Grammar"
    $P1065."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 383
    get_hll_global $P1066, ["NQP"], "Grammar"
    $P1066."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 384
    get_hll_global $P1067, ["NQP"], "Grammar"
    $P1067."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 385
    get_hll_global $P1068, ["NQP"], "Grammar"
    $P1068."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 386
    get_hll_global $P1069, ["NQP"], "Grammar"
    $P1069."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 387
    get_hll_global $P1070, ["NQP"], "Grammar"
    $P1070."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 388
    get_hll_global $P1071, ["NQP"], "Grammar"
    $P1071."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 389
    get_hll_global $P1072, ["NQP"], "Grammar"
    $P1072."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 390
    get_hll_global $P1073, ["NQP"], "Grammar"
    $P1073."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 391
    get_hll_global $P1074, ["NQP"], "Grammar"
    $P1074."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 392
    get_hll_global $P1075, ["NQP"], "Grammar"
    $P1075."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 393
    get_hll_global $P1076, ["NQP"], "Grammar"
    $P1076."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 394
    get_hll_global $P1077, ["NQP"], "Grammar"
    $P1077."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 395
    get_hll_global $P1078, ["NQP"], "Grammar"
    $P1078."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 396
    get_hll_global $P1079, ["NQP"], "Grammar"
    $P1079."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 381
    $P1080 = get_root_global ["parrot"], "P6metaclass"
    $P1080."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258897739.74728") :method :outer("11_1258897739.74728")
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
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__identifier"  :subid("14_1258897739.74728") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__name"  :subid("16_1258897739.74728") :method
.annotate "line", 4
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__deflongname"  :subid("18_1258897739.74728") :method
.annotate "line", 4
    $P47 = self."!PREFIX__!subrule"("identifier", "")
    new $P48, "ResizablePMCArray"
    push $P48, $P47
    .return ($P48)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258897739.74728") :method
.annotate "line", 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__ws"  :subid("22_1258897739.74728") :method
.annotate "line", 4
    new $P74, "ResizablePMCArray"
    push $P74, ""
    push $P74, ""
    .return ($P74)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .const 'Sub' $P87 = "25_1258897739.74728" 
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
    .const 'Sub' $P87 = "25_1258897739.74728" 
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
.sub "!PREFIX__unv"  :subid("24_1258897739.74728") :method
.annotate "line", 4
    new $P83, "ResizablePMCArray"
    push $P83, ""
    push $P83, ""
    push $P83, ""
    .return ($P83)
.end


.namespace ["NQP";"Grammar"]
.sub "_block86"  :anon :subid("25_1258897739.74728") :method :outer("23_1258897739.74728")
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
.sub "pod_comment"  :subid("26_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .const 'Sub' $P131 = "28_1258897739.74728" 
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
    .const 'Sub' $P131 = "28_1258897739.74728" 
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
.sub "!PREFIX__pod_comment"  :subid("27_1258897739.74728") :method
.annotate "line", 4
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["NQP";"Grammar"]
.sub "_block130"  :anon :subid("28_1258897739.74728") :method :outer("26_1258897739.74728")
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
.sub "comp_unit"  :subid("29_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__comp_unit"  :subid("30_1258897739.74728") :method
.annotate "line", 4
    $P142 = self."!PREFIX__!subrule"("", "")
    new $P143, "ResizablePMCArray"
    push $P143, $P142
    .return ($P143)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statementlist"  :subid("32_1258897739.74728") :method
.annotate "line", 4
    new $P148, "ResizablePMCArray"
    push $P148, ""
    push $P148, ""
    .return ($P148)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .const 'Sub' $P162 = "35_1258897739.74728" 
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
    .const 'Sub' $P162 = "35_1258897739.74728" 
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
.sub "!PREFIX__statement"  :subid("34_1258897739.74728") :method
.annotate "line", 4
    new $P160, "ResizablePMCArray"
    push $P160, ""
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "_block161"  :anon :subid("35_1258897739.74728") :method :outer("33_1258897739.74728")
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
.sub "eat_terminator"  :subid("36_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__eat_terminator"  :subid("37_1258897739.74728") :method
.annotate "line", 4
    new $P175, "ResizablePMCArray"
    push $P175, ""
    push $P175, ""
    push $P175, ""
    push $P175, ";"
    .return ($P175)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__xblock"  :subid("39_1258897739.74728") :method
.annotate "line", 4
    $P180 = self."!PREFIX__!subrule"("EXPR", "")
    new $P181, "ResizablePMCArray"
    push $P181, $P180
    .return ($P181)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__pblock"  :subid("41_1258897739.74728") :method
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
.sub "lambda"  :subid("42_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__lambda"  :subid("43_1258897739.74728") :method
.annotate "line", 4
    new $P192, "ResizablePMCArray"
    push $P192, "<->"
    push $P192, "->"
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__block"  :subid("45_1258897739.74728") :method
.annotate "line", 4
    $P197 = self."!PREFIX__!subrule"("", "")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    push $P198, "{"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__blockoid"  :subid("47_1258897739.74728") :method
.annotate "line", 4
    $P203 = self."!PREFIX__!subrule"("", "")
    new $P204, "ResizablePMCArray"
    push $P204, $P203
    .return ($P204)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__newpad"  :subid("49_1258897739.74728") :method
.annotate "line", 4
    new $P210, "ResizablePMCArray"
    push $P210, ""
    .return ($P210)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__finishpad"  :subid("51_1258897739.74728") :method
.annotate "line", 4
    new $P214, "ResizablePMCArray"
    push $P214, ""
    .return ($P214)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1258897739.74728") :method
.annotate "line", 140
    $P216 = self."!protoregex"("terminator")
    .return ($P216)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1258897739.74728") :method
.annotate "line", 140
    $P218 = self."!PREFIX__!protoregex"("terminator")
    .return ($P218)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1258897739.74728") :method
.annotate "line", 4
    new $P222, "ResizablePMCArray"
    push $P222, ";"
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1258897739.74728") :method
.annotate "line", 4
    new $P226, "ResizablePMCArray"
    push $P226, "}"
    .return ($P226)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1258897739.74728") :method
.annotate "line", 147
    $P228 = self."!protoregex"("statement_control")
    .return ($P228)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1258897739.74728") :method
.annotate "line", 147
    $P230 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P230)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1258897739.74728") :method
.annotate "line", 4
    new $P234, "ResizablePMCArray"
    push $P234, "if"
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .const 'Sub' $P260 = "64_1258897739.74728" 
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
    .const 'Sub' $P260 = "64_1258897739.74728" 
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
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1258897739.74728") :method
.annotate "line", 4
    new $P253, "ResizablePMCArray"
    push $P253, "unless"
    .return ($P253)
.end


.namespace ["NQP";"Grammar"]
.sub "_block259"  :anon :subid("64_1258897739.74728") :method :outer("62_1258897739.74728")
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
.sub "statement_control:sym<while>"  :subid("65_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1258897739.74728") :method
.annotate "line", 4
    new $P270, "ResizablePMCArray"
    push $P270, "until"
    push $P270, "while"
    .return ($P270)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1258897739.74728") :method
.annotate "line", 4
    new $P278, "ResizablePMCArray"
    push $P278, "repeat"
    .return ($P278)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1258897739.74728") :method
.annotate "line", 4
    new $P297, "ResizablePMCArray"
    push $P297, "for"
    .return ($P297)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("71_1258897739.74728") :method
.annotate "line", 180
    $P302 = self."!protoregex"("statement_prefix")
    .return ($P302)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("72_1258897739.74728") :method
.annotate "line", 180
    $P304 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P304)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("73_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("74_1258897739.74728") :method
.annotate "line", 4
    $P308 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P309, "ResizablePMCArray"
    push $P309, $P308
    .return ($P309)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("75_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__blorst"  :subid("76_1258897739.74728") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, ""
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("77_1258897739.74728") :method
.annotate "line", 189
    $P317 = self."!protoregex"("statement_mod_cond")
    .return ($P317)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("78_1258897739.74728") :method
.annotate "line", 189
    $P319 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P319)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("79_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("80_1258897739.74728") :method
.annotate "line", 4
    new $P323, "ResizablePMCArray"
    push $P323, "if"
    .return ($P323)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("81_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("82_1258897739.74728") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "unless"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("83_1258897739.74728") :method
.annotate "line", 194
    $P335 = self."!protoregex"("statement_mod_loop")
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("84_1258897739.74728") :method
.annotate "line", 194
    $P337 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P337)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("85_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("86_1258897739.74728") :method
.annotate "line", 4
    new $P341, "ResizablePMCArray"
    push $P341, "while"
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("87_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("88_1258897739.74728") :method
.annotate "line", 4
    new $P348, "ResizablePMCArray"
    push $P348, "until"
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("89_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<colonpair>"  :subid("90_1258897739.74728") :method
.annotate "line", 4
    $P355 = self."!PREFIX__!subrule"("colonpair", "")
    new $P356, "ResizablePMCArray"
    push $P356, $P355
    .return ($P356)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("91_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<variable>"  :subid("92_1258897739.74728") :method
.annotate "line", 4
    $P360 = self."!PREFIX__!subrule"("variable", "")
    new $P361, "ResizablePMCArray"
    push $P361, $P360
    .return ($P361)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("93_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<package_declarator>"  :subid("94_1258897739.74728") :method
.annotate "line", 4
    $P365 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P366, "ResizablePMCArray"
    push $P366, $P365
    .return ($P366)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("95_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("96_1258897739.74728") :method
.annotate "line", 4
    $P370 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P371, "ResizablePMCArray"
    push $P371, $P370
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("97_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("98_1258897739.74728") :method
.annotate "line", 4
    $P375 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P376, "ResizablePMCArray"
    push $P376, $P375
    .return ($P376)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("99_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("100_1258897739.74728") :method
.annotate "line", 4
    $P380 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P381, "ResizablePMCArray"
    push $P381, $P380
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("101_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("102_1258897739.74728") :method
.annotate "line", 4
    $P385 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P386, "ResizablePMCArray"
    push $P386, $P385
    .return ($P386)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("103_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__term:sym<lambda>"  :subid("104_1258897739.74728") :method
.annotate "line", 4
    new $P390, "ResizablePMCArray"
    push $P390, ""
    .return ($P390)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("105_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__colonpair"  :subid("106_1258897739.74728") :method
.annotate "line", 4
    $P394 = self."!PREFIX__!subrule"("identifier", ":")
    $P395 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P396, "ResizablePMCArray"
    push $P396, $P394
    push $P396, $P395
    .return ($P396)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("107_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__variable"  :subid("108_1258897739.74728") :method
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
.sub "sigil"  :subid("109_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__sigil"  :subid("110_1258897739.74728") :method
.annotate "line", 4
    new $P415, "ResizablePMCArray"
    push $P415, "&"
    push $P415, "%"
    push $P415, "@"
    push $P415, "$"
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("111_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__twigil"  :subid("112_1258897739.74728") :method
.annotate "line", 4
    new $P419, "ResizablePMCArray"
    push $P419, "?"
    push $P419, "!"
    push $P419, "*"
    .return ($P419)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("113_1258897739.74728") :method
.annotate "line", 228
    $P421 = self."!protoregex"("package_declarator")
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("114_1258897739.74728") :method
.annotate "line", 228
    $P423 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P423)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("115_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__package_declarator:sym<module>"  :subid("116_1258897739.74728") :method
.annotate "line", 4
    $P427 = self."!PREFIX__!subrule"("package_def", "module")
    new $P428, "ResizablePMCArray"
    push $P428, $P427
    .return ($P428)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("117_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__package_declarator:sym<class>"  :subid("118_1258897739.74728") :method
.annotate "line", 4
    $P433 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P434 = self."!PREFIX__!subrule"("package_def", "class")
    new $P435, "ResizablePMCArray"
    push $P435, $P433
    push $P435, $P434
    .return ($P435)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("119_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__package_def"  :subid("120_1258897739.74728") :method
.annotate "line", 4
    new $P441, "ResizablePMCArray"
    push $P441, ""
    .return ($P441)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("121_1258897739.74728") :method
.annotate "line", 242
    $P461 = self."!protoregex"("scope_declarator")
    .return ($P461)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("122_1258897739.74728") :method
.annotate "line", 242
    $P463 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P463)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("123_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("124_1258897739.74728") :method
.annotate "line", 4
    $P467 = self."!PREFIX__!subrule"("scoped", "my")
    new $P468, "ResizablePMCArray"
    push $P468, $P467
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("125_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("126_1258897739.74728") :method
.annotate "line", 4
    $P473 = self."!PREFIX__!subrule"("scoped", "our")
    new $P474, "ResizablePMCArray"
    push $P474, $P473
    .return ($P474)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("127_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("128_1258897739.74728") :method
.annotate "line", 4
    $P479 = self."!PREFIX__!subrule"("scoped", "has")
    new $P480, "ResizablePMCArray"
    push $P480, $P479
    .return ($P480)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("129_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__scoped"  :subid("130_1258897739.74728") :method
.annotate "line", 4
    new $P486, "ResizablePMCArray"
    push $P486, ""
    push $P486, ""
    .return ($P486)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("131_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__variable_declarator"  :subid("132_1258897739.74728") :method
.annotate "line", 4
    $P495 = self."!PREFIX__!subrule"("variable", "")
    new $P496, "ResizablePMCArray"
    push $P496, $P495
    .return ($P496)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("133_1258897739.74728") :method
.annotate "line", 254
    $P498 = self."!protoregex"("routine_declarator")
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("134_1258897739.74728") :method
.annotate "line", 254
    $P500 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P500)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("135_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("136_1258897739.74728") :method
.annotate "line", 4
    $P504 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P505, "ResizablePMCArray"
    push $P505, $P504
    .return ($P505)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("137_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("138_1258897739.74728") :method
.annotate "line", 4
    $P510 = self."!PREFIX__!subrule"("method_def", "method")
    new $P511, "ResizablePMCArray"
    push $P511, $P510
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("139_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__routine_def"  :subid("140_1258897739.74728") :method
.annotate "line", 4
    new $P516, "ResizablePMCArray"
    push $P516, ""
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("141_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__method_def"  :subid("142_1258897739.74728") :method
.annotate "line", 4
    new $P534, "ResizablePMCArray"
    push $P534, ""
    .return ($P534)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("143_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__signature"  :subid("144_1258897739.74728") :method
.annotate "line", 4
    new $P552, "ResizablePMCArray"
    push $P552, ""
    .return ($P552)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("145_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__parameter"  :subid("146_1258897739.74728") :method
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
.sub "param_var"  :subid("147_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__param_var"  :subid("148_1258897739.74728") :method
.annotate "line", 4
    $P574 = self."!PREFIX__!subrule"("sigil", "")
    new $P575, "ResizablePMCArray"
    push $P575, $P574
    .return ($P575)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("149_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__named_param"  :subid("150_1258897739.74728") :method
.annotate "line", 4
    $P583 = self."!PREFIX__!subrule"("param_var", ":")
    new $P584, "ResizablePMCArray"
    push $P584, $P583
    .return ($P584)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("151_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__default_value"  :subid("152_1258897739.74728") :method
.annotate "line", 4
    new $P588, "ResizablePMCArray"
    push $P588, ""
    .return ($P588)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("153_1258897739.74728") :method :outer("11_1258897739.74728")
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
.sub "!PREFIX__regex_declarator"  :subid("154_1258897739.74728") :method
.annotate "line", 4
    new $P595, "ResizablePMCArray"
    push $P595, ""
    .return ($P595)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("155_1258897739.74728") :method :outer("11_1258897739.74728")
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
  alt628_0:
.annotate "line", 311
    set_addr $I10, alt628_1
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."identifier"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx624_pos = $P10."pos"()
    goto alt628_end
  alt628_1:
.annotate "line", 312
  # rx enumcharlist negate=0 zerowidth
    ge rx624_pos, rx624_eos, rx624_fail
    sub $I10, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx624_fail
  # rx subrule "quote" subtype=capture negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."quote"()
    unless $P10, rx624_fail
    rx624_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx624_pos = $P10."pos"()
  alt629_0:
.annotate "line", 313
    set_addr $I10, alt629_1
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx624_pos, rx624_eos, rx624_fail
    sub $I10, rx624_pos, rx624_off
    substr $S10, rx624_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx624_fail
    goto alt629_end
  alt629_1:
  # rx subrule "panic" subtype=method negate=
    rx624_cur."!cursor_pos"(rx624_pos)
    $P10 = rx624_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx624_fail
    rx624_pos = $P10."pos"()
  alt629_end:
  alt628_end:
.annotate "line", 319
  # rx rxquantr630 ** 0..1
    set_addr $I632, rxquantr630_done
    rx624_cur."!mark_push"(0, rx624_pos, $I632)
  rxquantr630_loop:
  alt631_0:
.annotate "line", 316
    set_addr $I10, alt631_1
    rx624_cur."!mark_push"(0, rx624_pos, $I10)
.annotate "line", 317
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
    goto alt631_end
  alt631_1:
.annotate "line", 318
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
  alt631_end:
.annotate "line", 319
    (rx624_rep) = rx624_cur."!mark_commit"($I632)
  rxquantr630_done:
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
.sub "!PREFIX__dotty"  :subid("156_1258897739.74728") :method
.annotate "line", 4
    $P626 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P627, "ResizablePMCArray"
    push $P627, "'"
    push $P627, "\""
    push $P627, $P626
    .return ($P627)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("157_1258897739.74728") :method
.annotate "line", 323
    $P634 = self."!protoregex"("term")
    .return ($P634)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("158_1258897739.74728") :method
.annotate "line", 323
    $P636 = self."!PREFIX__!protoregex"("term")
    .return ($P636)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("159_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx638_tgt
    .local int rx638_pos
    .local int rx638_off
    .local int rx638_eos
    .local int rx638_rep
    .local pmc rx638_cur
    (rx638_cur, rx638_pos, rx638_tgt, $I10) = self."!cursor_start"()
    rx638_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx638_cur
    .local pmc match
    .lex "$/", match
    length rx638_eos, rx638_tgt
    set rx638_off, 0
    lt $I10, 2, rx638_start
    sub rx638_off, $I10, 1
    substr rx638_tgt, rx638_tgt, rx638_off
  rx638_start:
.annotate "line", 325
  # rx subcapture "sym"
    set_addr $I10, rxcap_641_fail
    rx638_cur."!mark_push"(0, rx638_pos, $I10)
  # rx literal  "self"
    add $I11, rx638_pos, 4
    gt $I11, rx638_eos, rx638_fail
    sub $I11, rx638_pos, rx638_off
    substr $S10, rx638_tgt, $I11, 4
    ne $S10, "self", rx638_fail
    add rx638_pos, 4
    set_addr $I10, rxcap_641_fail
    ($I12, $I11) = rx638_cur."!mark_peek"($I10)
    rx638_cur."!cursor_pos"($I11)
    ($P10) = rx638_cur."!cursor_start"()
    $P10."!cursor_pass"(rx638_pos, "")
    rx638_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_641_done
  rxcap_641_fail:
    goto rx638_fail
  rxcap_641_done:
  # rxanchor rwb
    le rx638_pos, 0, rx638_fail
    sub $I10, rx638_pos, rx638_off
    is_cclass $I11, 8192, rx638_tgt, $I10
    if $I11, rx638_fail
    dec $I10
    is_cclass $I11, 8192, rx638_tgt, $I10
    unless $I11, rx638_fail
  # rx pass
    rx638_cur."!cursor_pass"(rx638_pos, "term:sym<self>")
    rx638_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx638_pos)
    .return (rx638_cur)
  rx638_fail:
.annotate "line", 4
    (rx638_rep, rx638_pos, $I10, $P10) = rx638_cur."!mark_fail"(0)
    lt rx638_pos, -1, rx638_done
    eq rx638_pos, -1, rx638_fail
    jump $I10
  rx638_done:
    rx638_cur."!cursor_fail"()
    rx638_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx638_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("160_1258897739.74728") :method
.annotate "line", 4
    new $P640, "ResizablePMCArray"
    push $P640, "self"
    .return ($P640)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("161_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx643_tgt
    .local int rx643_pos
    .local int rx643_off
    .local int rx643_eos
    .local int rx643_rep
    .local pmc rx643_cur
    (rx643_cur, rx643_pos, rx643_tgt, $I10) = self."!cursor_start"()
    rx643_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx643_cur
    .local pmc match
    .lex "$/", match
    length rx643_eos, rx643_tgt
    set rx643_off, 0
    lt $I10, 2, rx643_start
    sub rx643_off, $I10, 1
    substr rx643_tgt, rx643_tgt, rx643_off
  rx643_start:
.annotate "line", 328
  # rx subrule "identifier" subtype=capture negate=
    rx643_cur."!cursor_pos"(rx643_pos)
    $P10 = rx643_cur."identifier"()
    unless $P10, rx643_fail
    rx643_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx643_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx643_pos, rx643_eos, rx643_fail
    sub $I10, rx643_pos, rx643_off
    substr $S10, rx643_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx643_fail
  # rx subrule "args" subtype=capture negate=
    rx643_cur."!cursor_pos"(rx643_pos)
    $P10 = rx643_cur."args"()
    unless $P10, rx643_fail
    rx643_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx643_pos = $P10."pos"()
.annotate "line", 327
  # rx pass
    rx643_cur."!cursor_pass"(rx643_pos, "term:sym<identifier>")
    rx643_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx643_pos)
    .return (rx643_cur)
  rx643_fail:
.annotate "line", 4
    (rx643_rep, rx643_pos, $I10, $P10) = rx643_cur."!mark_fail"(0)
    lt rx643_pos, -1, rx643_done
    eq rx643_pos, -1, rx643_fail
    jump $I10
  rx643_done:
    rx643_cur."!cursor_fail"()
    rx643_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx643_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("162_1258897739.74728") :method
.annotate "line", 4
    $P645 = self."!PREFIX__!subrule"("identifier", "")
    new $P646, "ResizablePMCArray"
    push $P646, $P645
    .return ($P646)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("163_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx648_tgt
    .local int rx648_pos
    .local int rx648_off
    .local int rx648_eos
    .local int rx648_rep
    .local pmc rx648_cur
    (rx648_cur, rx648_pos, rx648_tgt, $I10) = self."!cursor_start"()
    rx648_cur."!cursor_debug"("START ", "term:sym<name>")
    rx648_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx648_cur
    .local pmc match
    .lex "$/", match
    length rx648_eos, rx648_tgt
    set rx648_off, 0
    lt $I10, 2, rx648_start
    sub rx648_off, $I10, 1
    substr rx648_tgt, rx648_tgt, rx648_off
  rx648_start:
.annotate "line", 332
  # rx subrule "name" subtype=capture negate=
    rx648_cur."!cursor_pos"(rx648_pos)
    $P10 = rx648_cur."name"()
    unless $P10, rx648_fail
    rx648_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx648_pos = $P10."pos"()
  # rx rxquantr652 ** 0..1
    set_addr $I653, rxquantr652_done
    rx648_cur."!mark_push"(0, rx648_pos, $I653)
  rxquantr652_loop:
  # rx subrule "args" subtype=capture negate=
    rx648_cur."!cursor_pos"(rx648_pos)
    $P10 = rx648_cur."args"()
    unless $P10, rx648_fail
    rx648_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx648_pos = $P10."pos"()
    (rx648_rep) = rx648_cur."!mark_commit"($I653)
  rxquantr652_done:
.annotate "line", 331
  # rx pass
    rx648_cur."!cursor_pass"(rx648_pos, "term:sym<name>")
    rx648_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx648_pos)
    .return (rx648_cur)
  rx648_fail:
.annotate "line", 4
    (rx648_rep, rx648_pos, $I10, $P10) = rx648_cur."!mark_fail"(0)
    lt rx648_pos, -1, rx648_done
    eq rx648_pos, -1, rx648_fail
    jump $I10
  rx648_done:
    rx648_cur."!cursor_fail"()
    rx648_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx648_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("164_1258897739.74728") :method
.annotate "line", 4
    $P650 = self."!PREFIX__!subrule"("name", "")
    new $P651, "ResizablePMCArray"
    push $P651, $P650
    .return ($P651)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("165_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx655_tgt
    .local int rx655_pos
    .local int rx655_off
    .local int rx655_eos
    .local int rx655_rep
    .local pmc rx655_cur
    (rx655_cur, rx655_pos, rx655_tgt, $I10) = self."!cursor_start"()
    rx655_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx655_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx655_cur
    .local pmc match
    .lex "$/", match
    length rx655_eos, rx655_tgt
    set rx655_off, 0
    lt $I10, 2, rx655_start
    sub rx655_off, $I10, 1
    substr rx655_tgt, rx655_tgt, rx655_off
  rx655_start:
.annotate "line", 336
  # rx literal  "pir::"
    add $I11, rx655_pos, 5
    gt $I11, rx655_eos, rx655_fail
    sub $I11, rx655_pos, rx655_off
    substr $S10, rx655_tgt, $I11, 5
    ne $S10, "pir::", rx655_fail
    add rx655_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_658_fail
    rx655_cur."!mark_push"(0, rx655_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx655_pos, rx655_off
    find_not_cclass $I11, 8192, rx655_tgt, $I10, rx655_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx655_fail
    add rx655_pos, rx655_off, $I11
    set_addr $I10, rxcap_658_fail
    ($I12, $I11) = rx655_cur."!mark_peek"($I10)
    rx655_cur."!cursor_pos"($I11)
    ($P10) = rx655_cur."!cursor_start"()
    $P10."!cursor_pass"(rx655_pos, "")
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_658_done
  rxcap_658_fail:
    goto rx655_fail
  rxcap_658_done:
  # rx rxquantr659 ** 0..1
    set_addr $I660, rxquantr659_done
    rx655_cur."!mark_push"(0, rx655_pos, $I660)
  rxquantr659_loop:
  # rx subrule "args" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."args"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx655_pos = $P10."pos"()
    (rx655_rep) = rx655_cur."!mark_commit"($I660)
  rxquantr659_done:
.annotate "line", 335
  # rx pass
    rx655_cur."!cursor_pass"(rx655_pos, "term:sym<pir::op>")
    rx655_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx655_pos)
    .return (rx655_cur)
  rx655_fail:
.annotate "line", 4
    (rx655_rep, rx655_pos, $I10, $P10) = rx655_cur."!mark_fail"(0)
    lt rx655_pos, -1, rx655_done
    eq rx655_pos, -1, rx655_fail
    jump $I10
  rx655_done:
    rx655_cur."!cursor_fail"()
    rx655_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx655_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("166_1258897739.74728") :method
.annotate "line", 4
    new $P657, "ResizablePMCArray"
    push $P657, "pir::"
    .return ($P657)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("167_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx662_tgt
    .local int rx662_pos
    .local int rx662_off
    .local int rx662_eos
    .local int rx662_rep
    .local pmc rx662_cur
    (rx662_cur, rx662_pos, rx662_tgt, $I10) = self."!cursor_start"()
    rx662_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx662_cur
    .local pmc match
    .lex "$/", match
    length rx662_eos, rx662_tgt
    set rx662_off, 0
    lt $I10, 2, rx662_start
    sub rx662_off, $I10, 1
    substr rx662_tgt, rx662_tgt, rx662_off
  rx662_start:
.annotate "line", 340
  # rx literal  "("
    add $I11, rx662_pos, 1
    gt $I11, rx662_eos, rx662_fail
    sub $I11, rx662_pos, rx662_off
    substr $S10, rx662_tgt, $I11, 1
    ne $S10, "(", rx662_fail
    add rx662_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx662_cur."!cursor_pos"(rx662_pos)
    $P10 = rx662_cur."arglist"()
    unless $P10, rx662_fail
    rx662_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx662_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx662_pos, 1
    gt $I11, rx662_eos, rx662_fail
    sub $I11, rx662_pos, rx662_off
    substr $S10, rx662_tgt, $I11, 1
    ne $S10, ")", rx662_fail
    add rx662_pos, 1
  # rx pass
    rx662_cur."!cursor_pass"(rx662_pos, "args")
    rx662_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx662_pos)
    .return (rx662_cur)
  rx662_fail:
.annotate "line", 4
    (rx662_rep, rx662_pos, $I10, $P10) = rx662_cur."!mark_fail"(0)
    lt rx662_pos, -1, rx662_done
    eq rx662_pos, -1, rx662_fail
    jump $I10
  rx662_done:
    rx662_cur."!cursor_fail"()
    rx662_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx662_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("168_1258897739.74728") :method
.annotate "line", 4
    $P664 = self."!PREFIX__!subrule"("arglist", "(")
    new $P665, "ResizablePMCArray"
    push $P665, $P664
    .return ($P665)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("169_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx667_tgt
    .local int rx667_pos
    .local int rx667_off
    .local int rx667_eos
    .local int rx667_rep
    .local pmc rx667_cur
    (rx667_cur, rx667_pos, rx667_tgt, $I10) = self."!cursor_start"()
    rx667_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx667_cur
    .local pmc match
    .lex "$/", match
    length rx667_eos, rx667_tgt
    set rx667_off, 0
    lt $I10, 2, rx667_start
    sub rx667_off, $I10, 1
    substr rx667_tgt, rx667_tgt, rx667_off
  rx667_start:
.annotate "line", 344
  # rx subrule "ws" subtype=method negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."ws"()
    unless $P10, rx667_fail
    rx667_pos = $P10."pos"()
  alt671_0:
.annotate "line", 345
    set_addr $I10, alt671_1
    rx667_cur."!mark_push"(0, rx667_pos, $I10)
.annotate "line", 346
  # rx subrule "EXPR" subtype=capture negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."EXPR"("f=")
    unless $P10, rx667_fail
    rx667_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx667_pos = $P10."pos"()
    goto alt671_end
  alt671_1:
  alt671_end:
.annotate "line", 343
  # rx pass
    rx667_cur."!cursor_pass"(rx667_pos, "arglist")
    rx667_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx667_pos)
    .return (rx667_cur)
  rx667_fail:
.annotate "line", 4
    (rx667_rep, rx667_pos, $I10, $P10) = rx667_cur."!mark_fail"(0)
    lt rx667_pos, -1, rx667_done
    eq rx667_pos, -1, rx667_fail
    jump $I10
  rx667_done:
    rx667_cur."!cursor_fail"()
    rx667_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx667_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("170_1258897739.74728") :method
.annotate "line", 4
    $P669 = self."!PREFIX__!subrule"("", "")
    new $P670, "ResizablePMCArray"
    push $P670, $P669
    .return ($P670)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("171_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx673_tgt
    .local int rx673_pos
    .local int rx673_off
    .local int rx673_eos
    .local int rx673_rep
    .local pmc rx673_cur
    (rx673_cur, rx673_pos, rx673_tgt, $I10) = self."!cursor_start"()
    rx673_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx673_cur
    .local pmc match
    .lex "$/", match
    length rx673_eos, rx673_tgt
    set rx673_off, 0
    lt $I10, 2, rx673_start
    sub rx673_off, $I10, 1
    substr rx673_tgt, rx673_tgt, rx673_off
  rx673_start:
.annotate "line", 352
  # rx subrule "value" subtype=capture negate=
    rx673_cur."!cursor_pos"(rx673_pos)
    $P10 = rx673_cur."value"()
    unless $P10, rx673_fail
    rx673_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx673_pos = $P10."pos"()
  # rx pass
    rx673_cur."!cursor_pass"(rx673_pos, "term:sym<value>")
    rx673_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx673_pos)
    .return (rx673_cur)
  rx673_fail:
.annotate "line", 4
    (rx673_rep, rx673_pos, $I10, $P10) = rx673_cur."!mark_fail"(0)
    lt rx673_pos, -1, rx673_done
    eq rx673_pos, -1, rx673_fail
    jump $I10
  rx673_done:
    rx673_cur."!cursor_fail"()
    rx673_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx673_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("172_1258897739.74728") :method
.annotate "line", 4
    $P675 = self."!PREFIX__!subrule"("value", "")
    new $P676, "ResizablePMCArray"
    push $P676, $P675
    .return ($P676)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("173_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx678_tgt
    .local int rx678_pos
    .local int rx678_off
    .local int rx678_eos
    .local int rx678_rep
    .local pmc rx678_cur
    (rx678_cur, rx678_pos, rx678_tgt, $I10) = self."!cursor_start"()
    rx678_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx678_cur
    .local pmc match
    .lex "$/", match
    length rx678_eos, rx678_tgt
    set rx678_off, 0
    lt $I10, 2, rx678_start
    sub rx678_off, $I10, 1
    substr rx678_tgt, rx678_tgt, rx678_off
  rx678_start:
  alt684_0:
.annotate "line", 354
    set_addr $I10, alt684_1
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
.annotate "line", 355
  # rx subrule "dec_number" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."dec_number"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx678_pos = $P10."pos"()
    goto alt684_end
  alt684_1:
    set_addr $I10, alt684_2
    rx678_cur."!mark_push"(0, rx678_pos, $I10)
.annotate "line", 356
  # rx subrule "quote" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."quote"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx678_pos = $P10."pos"()
    goto alt684_end
  alt684_2:
.annotate "line", 357
  # rx subrule "integer" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."integer"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx678_pos = $P10."pos"()
  alt684_end:
.annotate "line", 354
  # rx pass
    rx678_cur."!cursor_pass"(rx678_pos, "value")
    rx678_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx678_pos)
    .return (rx678_cur)
  rx678_fail:
.annotate "line", 4
    (rx678_rep, rx678_pos, $I10, $P10) = rx678_cur."!mark_fail"(0)
    lt rx678_pos, -1, rx678_done
    eq rx678_pos, -1, rx678_fail
    jump $I10
  rx678_done:
    rx678_cur."!cursor_fail"()
    rx678_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("174_1258897739.74728") :method
.annotate "line", 4
    $P680 = self."!PREFIX__!subrule"("integer", "")
    $P681 = self."!PREFIX__!subrule"("quote", "")
    $P682 = self."!PREFIX__!subrule"("dec_number", "")
    new $P683, "ResizablePMCArray"
    push $P683, $P680
    push $P683, $P681
    push $P683, $P682
    .return ($P683)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("175_1258897739.74728") :method
.annotate "line", 360
    $P686 = self."!protoregex"("quote")
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("176_1258897739.74728") :method
.annotate "line", 360
    $P688 = self."!PREFIX__!protoregex"("quote")
    .return ($P688)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("177_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx690_tgt
    .local int rx690_pos
    .local int rx690_off
    .local int rx690_eos
    .local int rx690_rep
    .local pmc rx690_cur
    (rx690_cur, rx690_pos, rx690_tgt, $I10) = self."!cursor_start"()
    rx690_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx690_cur
    .local pmc match
    .lex "$/", match
    length rx690_eos, rx690_tgt
    set rx690_off, 0
    lt $I10, 2, rx690_start
    sub rx690_off, $I10, 1
    substr rx690_tgt, rx690_tgt, rx690_off
  rx690_start:
.annotate "line", 361
  # rx enumcharlist negate=0 zerowidth
    ge rx690_pos, rx690_eos, rx690_fail
    sub $I10, rx690_pos, rx690_off
    substr $S10, rx690_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx690_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx690_cur."!cursor_pos"(rx690_pos)
    $P10 = rx690_cur."quote_EXPR"(":q")
    unless $P10, rx690_fail
    rx690_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx690_pos = $P10."pos"()
  # rx pass
    rx690_cur."!cursor_pass"(rx690_pos, "quote:sym<apos>")
    rx690_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx690_pos)
    .return (rx690_cur)
  rx690_fail:
.annotate "line", 4
    (rx690_rep, rx690_pos, $I10, $P10) = rx690_cur."!mark_fail"(0)
    lt rx690_pos, -1, rx690_done
    eq rx690_pos, -1, rx690_fail
    jump $I10
  rx690_done:
    rx690_cur."!cursor_fail"()
    rx690_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx690_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("178_1258897739.74728") :method
.annotate "line", 4
    new $P692, "ResizablePMCArray"
    push $P692, "'"
    .return ($P692)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("179_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx694_tgt
    .local int rx694_pos
    .local int rx694_off
    .local int rx694_eos
    .local int rx694_rep
    .local pmc rx694_cur
    (rx694_cur, rx694_pos, rx694_tgt, $I10) = self."!cursor_start"()
    rx694_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx694_cur
    .local pmc match
    .lex "$/", match
    length rx694_eos, rx694_tgt
    set rx694_off, 0
    lt $I10, 2, rx694_start
    sub rx694_off, $I10, 1
    substr rx694_tgt, rx694_tgt, rx694_off
  rx694_start:
.annotate "line", 362
  # rx enumcharlist negate=0 zerowidth
    ge rx694_pos, rx694_eos, rx694_fail
    sub $I10, rx694_pos, rx694_off
    substr $S10, rx694_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx694_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx694_cur."!cursor_pos"(rx694_pos)
    $P10 = rx694_cur."quote_EXPR"(":qq")
    unless $P10, rx694_fail
    rx694_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx694_pos = $P10."pos"()
  # rx pass
    rx694_cur."!cursor_pass"(rx694_pos, "quote:sym<dblq>")
    rx694_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx694_pos)
    .return (rx694_cur)
  rx694_fail:
.annotate "line", 4
    (rx694_rep, rx694_pos, $I10, $P10) = rx694_cur."!mark_fail"(0)
    lt rx694_pos, -1, rx694_done
    eq rx694_pos, -1, rx694_fail
    jump $I10
  rx694_done:
    rx694_cur."!cursor_fail"()
    rx694_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx694_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("180_1258897739.74728") :method
.annotate "line", 4
    new $P696, "ResizablePMCArray"
    push $P696, "\""
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("181_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx698_tgt
    .local int rx698_pos
    .local int rx698_off
    .local int rx698_eos
    .local int rx698_rep
    .local pmc rx698_cur
    (rx698_cur, rx698_pos, rx698_tgt, $I10) = self."!cursor_start"()
    rx698_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx698_cur
    .local pmc match
    .lex "$/", match
    length rx698_eos, rx698_tgt
    set rx698_off, 0
    lt $I10, 2, rx698_start
    sub rx698_off, $I10, 1
    substr rx698_tgt, rx698_tgt, rx698_off
  rx698_start:
.annotate "line", 363
  # rx literal  "q"
    add $I11, rx698_pos, 1
    gt $I11, rx698_eos, rx698_fail
    sub $I11, rx698_pos, rx698_off
    substr $S10, rx698_tgt, $I11, 1
    ne $S10, "q", rx698_fail
    add rx698_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx698_pos, rx698_eos, rx698_fail
    sub $I10, rx698_pos, rx698_off
    substr $S10, rx698_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx698_fail
  # rx subrule "ws" subtype=method negate=
    rx698_cur."!cursor_pos"(rx698_pos)
    $P10 = rx698_cur."ws"()
    unless $P10, rx698_fail
    rx698_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx698_cur."!cursor_pos"(rx698_pos)
    $P10 = rx698_cur."quote_EXPR"(":q")
    unless $P10, rx698_fail
    rx698_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx698_pos = $P10."pos"()
  # rx pass
    rx698_cur."!cursor_pass"(rx698_pos, "quote:sym<q>")
    rx698_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx698_pos)
    .return (rx698_cur)
  rx698_fail:
.annotate "line", 4
    (rx698_rep, rx698_pos, $I10, $P10) = rx698_cur."!mark_fail"(0)
    lt rx698_pos, -1, rx698_done
    eq rx698_pos, -1, rx698_fail
    jump $I10
  rx698_done:
    rx698_cur."!cursor_fail"()
    rx698_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx698_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("182_1258897739.74728") :method
.annotate "line", 4
    $P700 = self."!PREFIX__!subrule"("", "q")
    new $P701, "ResizablePMCArray"
    push $P701, $P700
    .return ($P701)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("183_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx703_tgt
    .local int rx703_pos
    .local int rx703_off
    .local int rx703_eos
    .local int rx703_rep
    .local pmc rx703_cur
    (rx703_cur, rx703_pos, rx703_tgt, $I10) = self."!cursor_start"()
    rx703_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx703_cur
    .local pmc match
    .lex "$/", match
    length rx703_eos, rx703_tgt
    set rx703_off, 0
    lt $I10, 2, rx703_start
    sub rx703_off, $I10, 1
    substr rx703_tgt, rx703_tgt, rx703_off
  rx703_start:
.annotate "line", 364
  # rx literal  "qq"
    add $I11, rx703_pos, 2
    gt $I11, rx703_eos, rx703_fail
    sub $I11, rx703_pos, rx703_off
    substr $S10, rx703_tgt, $I11, 2
    ne $S10, "qq", rx703_fail
    add rx703_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx703_pos, rx703_eos, rx703_fail
    sub $I10, rx703_pos, rx703_off
    substr $S10, rx703_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx703_fail
  # rx subrule "ws" subtype=method negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."ws"()
    unless $P10, rx703_fail
    rx703_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."quote_EXPR"(":qq")
    unless $P10, rx703_fail
    rx703_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx703_pos = $P10."pos"()
  # rx pass
    rx703_cur."!cursor_pass"(rx703_pos, "quote:sym<qq>")
    rx703_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx703_pos)
    .return (rx703_cur)
  rx703_fail:
.annotate "line", 4
    (rx703_rep, rx703_pos, $I10, $P10) = rx703_cur."!mark_fail"(0)
    lt rx703_pos, -1, rx703_done
    eq rx703_pos, -1, rx703_fail
    jump $I10
  rx703_done:
    rx703_cur."!cursor_fail"()
    rx703_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx703_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("184_1258897739.74728") :method
.annotate "line", 4
    $P705 = self."!PREFIX__!subrule"("", "qq")
    new $P706, "ResizablePMCArray"
    push $P706, $P705
    .return ($P706)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("185_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx708_tgt
    .local int rx708_pos
    .local int rx708_off
    .local int rx708_eos
    .local int rx708_rep
    .local pmc rx708_cur
    (rx708_cur, rx708_pos, rx708_tgt, $I10) = self."!cursor_start"()
    rx708_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx708_cur
    .local pmc match
    .lex "$/", match
    length rx708_eos, rx708_tgt
    set rx708_off, 0
    lt $I10, 2, rx708_start
    sub rx708_off, $I10, 1
    substr rx708_tgt, rx708_tgt, rx708_off
  rx708_start:
.annotate "line", 365
  # rx literal  "Q"
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, "Q", rx708_fail
    add rx708_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx708_pos, rx708_eos, rx708_fail
    sub $I10, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx708_fail
  # rx subrule "ws" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."ws"()
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."quote_EXPR"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx708_pos = $P10."pos"()
  # rx pass
    rx708_cur."!cursor_pass"(rx708_pos, "quote:sym<Q>")
    rx708_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx708_pos)
    .return (rx708_cur)
  rx708_fail:
.annotate "line", 4
    (rx708_rep, rx708_pos, $I10, $P10) = rx708_cur."!mark_fail"(0)
    lt rx708_pos, -1, rx708_done
    eq rx708_pos, -1, rx708_fail
    jump $I10
  rx708_done:
    rx708_cur."!cursor_fail"()
    rx708_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx708_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("186_1258897739.74728") :method
.annotate "line", 4
    $P710 = self."!PREFIX__!subrule"("", "Q")
    new $P711, "ResizablePMCArray"
    push $P711, $P710
    .return ($P711)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("187_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    (rx713_cur, rx713_pos, rx713_tgt, $I10) = self."!cursor_start"()
    rx713_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx713_cur
    .local pmc match
    .lex "$/", match
    length rx713_eos, rx713_tgt
    set rx713_off, 0
    lt $I10, 2, rx713_start
    sub rx713_off, $I10, 1
    substr rx713_tgt, rx713_tgt, rx713_off
  rx713_start:
.annotate "line", 366
  # rx literal  "Q:PIR"
    add $I11, rx713_pos, 5
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    substr $S10, rx713_tgt, $I11, 5
    ne $S10, "Q:PIR", rx713_fail
    add rx713_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."quote_EXPR"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx713_pos = $P10."pos"()
  # rx pass
    rx713_cur."!cursor_pass"(rx713_pos, "quote:sym<Q:PIR>")
    rx713_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx713_pos)
    .return (rx713_cur)
  rx713_fail:
.annotate "line", 4
    (rx713_rep, rx713_pos, $I10, $P10) = rx713_cur."!mark_fail"(0)
    lt rx713_pos, -1, rx713_done
    eq rx713_pos, -1, rx713_fail
    jump $I10
  rx713_done:
    rx713_cur."!cursor_fail"()
    rx713_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("188_1258897739.74728") :method
.annotate "line", 4
    $P715 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P716, "ResizablePMCArray"
    push $P716, $P715
    .return ($P716)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("189_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx718_tgt
    .local int rx718_pos
    .local int rx718_off
    .local int rx718_eos
    .local int rx718_rep
    .local pmc rx718_cur
    (rx718_cur, rx718_pos, rx718_tgt, $I10) = self."!cursor_start"()
    rx718_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx718_cur
    .local pmc match
    .lex "$/", match
    length rx718_eos, rx718_tgt
    set rx718_off, 0
    lt $I10, 2, rx718_start
    sub rx718_off, $I10, 1
    substr rx718_tgt, rx718_tgt, rx718_off
  rx718_start:
.annotate "line", 368
  # rx enumcharlist negate=0 zerowidth
    ge rx718_pos, rx718_eos, rx718_fail
    sub $I10, rx718_pos, rx718_off
    substr $S10, rx718_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx718_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx718_cur."!cursor_pos"(rx718_pos)
    $P10 = rx718_cur."quotemod_check"("s")
    unless $P10, rx718_fail
  # rx subrule "variable" subtype=capture negate=
    rx718_cur."!cursor_pos"(rx718_pos)
    $P10 = rx718_cur."variable"()
    unless $P10, rx718_fail
    rx718_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx718_pos = $P10."pos"()
  # rx pass
    rx718_cur."!cursor_pass"(rx718_pos, "quote_escape:sym<$>")
    rx718_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx718_pos)
    .return (rx718_cur)
  rx718_fail:
.annotate "line", 4
    (rx718_rep, rx718_pos, $I10, $P10) = rx718_cur."!mark_fail"(0)
    lt rx718_pos, -1, rx718_done
    eq rx718_pos, -1, rx718_fail
    jump $I10
  rx718_done:
    rx718_cur."!cursor_fail"()
    rx718_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx718_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("190_1258897739.74728") :method
.annotate "line", 4
    new $P720, "ResizablePMCArray"
    push $P720, "$"
    .return ($P720)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("191_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx722_tgt
    .local int rx722_pos
    .local int rx722_off
    .local int rx722_eos
    .local int rx722_rep
    .local pmc rx722_cur
    (rx722_cur, rx722_pos, rx722_tgt, $I10) = self."!cursor_start"()
    rx722_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx722_cur
    .local pmc match
    .lex "$/", match
    length rx722_eos, rx722_tgt
    set rx722_off, 0
    lt $I10, 2, rx722_start
    sub rx722_off, $I10, 1
    substr rx722_tgt, rx722_tgt, rx722_off
  rx722_start:
.annotate "line", 369
  # rx enumcharlist negate=0 zerowidth
    ge rx722_pos, rx722_eos, rx722_fail
    sub $I10, rx722_pos, rx722_off
    substr $S10, rx722_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx722_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx722_cur."!cursor_pos"(rx722_pos)
    $P10 = rx722_cur."quotemod_check"("c")
    unless $P10, rx722_fail
  # rx subrule "block" subtype=capture negate=
    rx722_cur."!cursor_pos"(rx722_pos)
    $P10 = rx722_cur."block"()
    unless $P10, rx722_fail
    rx722_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx722_pos = $P10."pos"()
  # rx pass
    rx722_cur."!cursor_pass"(rx722_pos, "quote_escape:sym<{ }>")
    rx722_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx722_pos)
    .return (rx722_cur)
  rx722_fail:
.annotate "line", 4
    (rx722_rep, rx722_pos, $I10, $P10) = rx722_cur."!mark_fail"(0)
    lt rx722_pos, -1, rx722_done
    eq rx722_pos, -1, rx722_fail
    jump $I10
  rx722_done:
    rx722_cur."!cursor_fail"()
    rx722_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx722_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("192_1258897739.74728") :method
.annotate "line", 4
    new $P724, "ResizablePMCArray"
    push $P724, "{"
    .return ($P724)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("193_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx726_tgt
    .local int rx726_pos
    .local int rx726_off
    .local int rx726_eos
    .local int rx726_rep
    .local pmc rx726_cur
    (rx726_cur, rx726_pos, rx726_tgt, $I10) = self."!cursor_start"()
    rx726_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx726_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx726_cur
    .local pmc match
    .lex "$/", match
    length rx726_eos, rx726_tgt
    set rx726_off, 0
    lt $I10, 2, rx726_start
    sub rx726_off, $I10, 1
    substr rx726_tgt, rx726_tgt, rx726_off
  rx726_start:
.annotate "line", 371
  # rx literal  "("
    add $I11, rx726_pos, 1
    gt $I11, rx726_eos, rx726_fail
    sub $I11, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I11, 1
    ne $S10, "(", rx726_fail
    add rx726_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."ws"()
    unless $P10, rx726_fail
    rx726_pos = $P10."pos"()
  # rx rxquantr730 ** 0..1
    set_addr $I731, rxquantr730_done
    rx726_cur."!mark_push"(0, rx726_pos, $I731)
  rxquantr730_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx726_cur."!cursor_pos"(rx726_pos)
    $P10 = rx726_cur."EXPR"()
    unless $P10, rx726_fail
    rx726_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx726_pos = $P10."pos"()
    (rx726_rep) = rx726_cur."!mark_commit"($I731)
  rxquantr730_done:
  # rx literal  ")"
    add $I11, rx726_pos, 1
    gt $I11, rx726_eos, rx726_fail
    sub $I11, rx726_pos, rx726_off
    substr $S10, rx726_tgt, $I11, 1
    ne $S10, ")", rx726_fail
    add rx726_pos, 1
  # rx pass
    rx726_cur."!cursor_pass"(rx726_pos, "circumfix:sym<( )>")
    rx726_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx726_pos)
    .return (rx726_cur)
  rx726_fail:
.annotate "line", 4
    (rx726_rep, rx726_pos, $I10, $P10) = rx726_cur."!mark_fail"(0)
    lt rx726_pos, -1, rx726_done
    eq rx726_pos, -1, rx726_fail
    jump $I10
  rx726_done:
    rx726_cur."!cursor_fail"()
    rx726_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx726_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("194_1258897739.74728") :method
.annotate "line", 4
    $P728 = self."!PREFIX__!subrule"("", "(")
    new $P729, "ResizablePMCArray"
    push $P729, $P728
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("195_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx733_tgt
    .local int rx733_pos
    .local int rx733_off
    .local int rx733_eos
    .local int rx733_rep
    .local pmc rx733_cur
    (rx733_cur, rx733_pos, rx733_tgt, $I10) = self."!cursor_start"()
    rx733_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx733_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx733_cur
    .local pmc match
    .lex "$/", match
    length rx733_eos, rx733_tgt
    set rx733_off, 0
    lt $I10, 2, rx733_start
    sub rx733_off, $I10, 1
    substr rx733_tgt, rx733_tgt, rx733_off
  rx733_start:
.annotate "line", 372
  # rx literal  "["
    add $I11, rx733_pos, 1
    gt $I11, rx733_eos, rx733_fail
    sub $I11, rx733_pos, rx733_off
    substr $S10, rx733_tgt, $I11, 1
    ne $S10, "[", rx733_fail
    add rx733_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx733_cur."!cursor_pos"(rx733_pos)
    $P10 = rx733_cur."ws"()
    unless $P10, rx733_fail
    rx733_pos = $P10."pos"()
  # rx rxquantr737 ** 0..1
    set_addr $I738, rxquantr737_done
    rx733_cur."!mark_push"(0, rx733_pos, $I738)
  rxquantr737_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx733_cur."!cursor_pos"(rx733_pos)
    $P10 = rx733_cur."EXPR"()
    unless $P10, rx733_fail
    rx733_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx733_pos = $P10."pos"()
    (rx733_rep) = rx733_cur."!mark_commit"($I738)
  rxquantr737_done:
  # rx literal  "]"
    add $I11, rx733_pos, 1
    gt $I11, rx733_eos, rx733_fail
    sub $I11, rx733_pos, rx733_off
    substr $S10, rx733_tgt, $I11, 1
    ne $S10, "]", rx733_fail
    add rx733_pos, 1
  # rx pass
    rx733_cur."!cursor_pass"(rx733_pos, "circumfix:sym<[ ]>")
    rx733_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx733_pos)
    .return (rx733_cur)
  rx733_fail:
.annotate "line", 4
    (rx733_rep, rx733_pos, $I10, $P10) = rx733_cur."!mark_fail"(0)
    lt rx733_pos, -1, rx733_done
    eq rx733_pos, -1, rx733_fail
    jump $I10
  rx733_done:
    rx733_cur."!cursor_fail"()
    rx733_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx733_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("196_1258897739.74728") :method
.annotate "line", 4
    $P735 = self."!PREFIX__!subrule"("", "[")
    new $P736, "ResizablePMCArray"
    push $P736, $P735
    .return ($P736)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("197_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx740_tgt
    .local int rx740_pos
    .local int rx740_off
    .local int rx740_eos
    .local int rx740_rep
    .local pmc rx740_cur
    (rx740_cur, rx740_pos, rx740_tgt, $I10) = self."!cursor_start"()
    rx740_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx740_cur
    .local pmc match
    .lex "$/", match
    length rx740_eos, rx740_tgt
    set rx740_off, 0
    lt $I10, 2, rx740_start
    sub rx740_off, $I10, 1
    substr rx740_tgt, rx740_tgt, rx740_off
  rx740_start:
.annotate "line", 373
  # rx enumcharlist negate=0 zerowidth
    ge rx740_pos, rx740_eos, rx740_fail
    sub $I10, rx740_pos, rx740_off
    substr $S10, rx740_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx740_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx740_cur."!cursor_pos"(rx740_pos)
    $P10 = rx740_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx740_fail
    rx740_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx740_pos = $P10."pos"()
  # rx pass
    rx740_cur."!cursor_pass"(rx740_pos, "circumfix:sym<ang>")
    rx740_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx740_pos)
    .return (rx740_cur)
  rx740_fail:
.annotate "line", 4
    (rx740_rep, rx740_pos, $I10, $P10) = rx740_cur."!mark_fail"(0)
    lt rx740_pos, -1, rx740_done
    eq rx740_pos, -1, rx740_fail
    jump $I10
  rx740_done:
    rx740_cur."!cursor_fail"()
    rx740_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx740_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("198_1258897739.74728") :method
.annotate "line", 4
    new $P742, "ResizablePMCArray"
    push $P742, "<"
    .return ($P742)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("199_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx744_tgt
    .local int rx744_pos
    .local int rx744_off
    .local int rx744_eos
    .local int rx744_rep
    .local pmc rx744_cur
    (rx744_cur, rx744_pos, rx744_tgt, $I10) = self."!cursor_start"()
    rx744_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx744_cur
    .local pmc match
    .lex "$/", match
    length rx744_eos, rx744_tgt
    set rx744_off, 0
    lt $I10, 2, rx744_start
    sub rx744_off, $I10, 1
    substr rx744_tgt, rx744_tgt, rx744_off
  rx744_start:
.annotate "line", 374
  # rx enumcharlist negate=0 zerowidth
    ge rx744_pos, rx744_eos, rx744_fail
    sub $I10, rx744_pos, rx744_off
    substr $S10, rx744_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx744_fail
  # rx subrule "pblock" subtype=capture negate=
    rx744_cur."!cursor_pos"(rx744_pos)
    $P10 = rx744_cur."pblock"()
    unless $P10, rx744_fail
    rx744_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx744_pos = $P10."pos"()
  # rx pass
    rx744_cur."!cursor_pass"(rx744_pos, "circumfix:sym<{ }>")
    rx744_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx744_pos)
    .return (rx744_cur)
  rx744_fail:
.annotate "line", 4
    (rx744_rep, rx744_pos, $I10, $P10) = rx744_cur."!mark_fail"(0)
    lt rx744_pos, -1, rx744_done
    eq rx744_pos, -1, rx744_fail
    jump $I10
  rx744_done:
    rx744_cur."!cursor_fail"()
    rx744_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx744_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("200_1258897739.74728") :method
.annotate "line", 4
    new $P746, "ResizablePMCArray"
    push $P746, "{"
    .return ($P746)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("201_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx748_tgt
    .local int rx748_pos
    .local int rx748_off
    .local int rx748_eos
    .local int rx748_rep
    .local pmc rx748_cur
    (rx748_cur, rx748_pos, rx748_tgt, $I10) = self."!cursor_start"()
    rx748_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx748_cur
    .local pmc match
    .lex "$/", match
    length rx748_eos, rx748_tgt
    set rx748_off, 0
    lt $I10, 2, rx748_start
    sub rx748_off, $I10, 1
    substr rx748_tgt, rx748_tgt, rx748_off
  rx748_start:
.annotate "line", 375
  # rx subrule "sigil" subtype=capture negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."sigil"()
    unless $P10, rx748_fail
    rx748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx748_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx748_pos, 1
    gt $I11, rx748_eos, rx748_fail
    sub $I11, rx748_pos, rx748_off
    substr $S10, rx748_tgt, $I11, 1
    ne $S10, "(", rx748_fail
    add rx748_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."semilist"()
    unless $P10, rx748_fail
    rx748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx748_pos = $P10."pos"()
  alt752_0:
    set_addr $I10, alt752_1
    rx748_cur."!mark_push"(0, rx748_pos, $I10)
  # rx literal  ")"
    add $I11, rx748_pos, 1
    gt $I11, rx748_eos, rx748_fail
    sub $I11, rx748_pos, rx748_off
    substr $S10, rx748_tgt, $I11, 1
    ne $S10, ")", rx748_fail
    add rx748_pos, 1
    goto alt752_end
  alt752_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."FAILGOAL"("')'")
    unless $P10, rx748_fail
    rx748_pos = $P10."pos"()
  alt752_end:
  # rx pass
    rx748_cur."!cursor_pass"(rx748_pos, "circumfix:sym<sigil>")
    rx748_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx748_pos)
    .return (rx748_cur)
  rx748_fail:
.annotate "line", 4
    (rx748_rep, rx748_pos, $I10, $P10) = rx748_cur."!mark_fail"(0)
    lt rx748_pos, -1, rx748_done
    eq rx748_pos, -1, rx748_fail
    jump $I10
  rx748_done:
    rx748_cur."!cursor_fail"()
    rx748_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx748_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("202_1258897739.74728") :method
.annotate "line", 4
    $P750 = self."!PREFIX__!subrule"("sigil", "")
    new $P751, "ResizablePMCArray"
    push $P751, $P750
    .return ($P751)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("203_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 4
    .local string rx755_tgt
    .local int rx755_pos
    .local int rx755_off
    .local int rx755_eos
    .local int rx755_rep
    .local pmc rx755_cur
    (rx755_cur, rx755_pos, rx755_tgt, $I10) = self."!cursor_start"()
    rx755_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx755_cur
    .local pmc match
    .lex "$/", match
    length rx755_eos, rx755_tgt
    set rx755_off, 0
    lt $I10, 2, rx755_start
    sub rx755_off, $I10, 1
    substr rx755_tgt, rx755_tgt, rx755_off
  rx755_start:
.annotate "line", 377
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."statement"()
    unless $P10, rx755_fail
    rx755_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx755_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx pass
    rx755_cur."!cursor_pass"(rx755_pos, "semilist")
    rx755_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx755_pos)
    .return (rx755_cur)
  rx755_fail:
.annotate "line", 4
    (rx755_rep, rx755_pos, $I10, $P10) = rx755_cur."!mark_fail"(0)
    lt rx755_pos, -1, rx755_done
    eq rx755_pos, -1, rx755_fail
    jump $I10
  rx755_done:
    rx755_cur."!cursor_fail"()
    rx755_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx755_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("204_1258897739.74728") :method
.annotate "line", 4
    new $P757, "ResizablePMCArray"
    push $P757, ""
    .return ($P757)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("205_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx761_tgt
    .local int rx761_pos
    .local int rx761_off
    .local int rx761_eos
    .local int rx761_rep
    .local pmc rx761_cur
    (rx761_cur, rx761_pos, rx761_tgt, $I10) = self."!cursor_start"()
    rx761_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx761_cur
    .local pmc match
    .lex "$/", match
    length rx761_eos, rx761_tgt
    set rx761_off, 0
    lt $I10, 2, rx761_start
    sub rx761_off, $I10, 1
    substr rx761_tgt, rx761_tgt, rx761_off
  rx761_start:
.annotate "line", 400
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx761_cur."!cursor_pos"(rx761_pos)
    $P10 = rx761_cur."infixstopper"()
    if $P10, rx761_fail
  # rx subrule "infix" subtype=capture negate=
    rx761_cur."!cursor_pos"(rx761_pos)
    $P10 = rx761_cur."infix"()
    unless $P10, rx761_fail
    rx761_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx761_pos = $P10."pos"()
  # rx pass
    rx761_cur."!cursor_pass"(rx761_pos, "infixish")
    rx761_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx761_pos)
    .return (rx761_cur)
  rx761_fail:
.annotate "line", 381
    (rx761_rep, rx761_pos, $I10, $P10) = rx761_cur."!mark_fail"(0)
    lt rx761_pos, -1, rx761_done
    eq rx761_pos, -1, rx761_fail
    jump $I10
  rx761_done:
    rx761_cur."!cursor_fail"()
    rx761_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx761_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("206_1258897739.74728") :method
.annotate "line", 381
    new $P763, "ResizablePMCArray"
    push $P763, ""
    .return ($P763)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("207_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx765_tgt
    .local int rx765_pos
    .local int rx765_off
    .local int rx765_eos
    .local int rx765_rep
    .local pmc rx765_cur
    (rx765_cur, rx765_pos, rx765_tgt, $I10) = self."!cursor_start"()
    rx765_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx765_cur
    .local pmc match
    .lex "$/", match
    length rx765_eos, rx765_tgt
    set rx765_off, 0
    lt $I10, 2, rx765_start
    sub rx765_off, $I10, 1
    substr rx765_tgt, rx765_tgt, rx765_off
  rx765_start:
.annotate "line", 401
  # rx subrule "lambda" subtype=zerowidth negate=
    rx765_cur."!cursor_pos"(rx765_pos)
    $P10 = rx765_cur."lambda"()
    unless $P10, rx765_fail
  # rx pass
    rx765_cur."!cursor_pass"(rx765_pos, "infixstopper")
    rx765_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx765_pos)
    .return (rx765_cur)
  rx765_fail:
.annotate "line", 381
    (rx765_rep, rx765_pos, $I10, $P10) = rx765_cur."!mark_fail"(0)
    lt rx765_pos, -1, rx765_done
    eq rx765_pos, -1, rx765_fail
    jump $I10
  rx765_done:
    rx765_cur."!cursor_fail"()
    rx765_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx765_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("208_1258897739.74728") :method
.annotate "line", 381
    new $P767, "ResizablePMCArray"
    push $P767, ""
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("209_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx769_tgt
    .local int rx769_pos
    .local int rx769_off
    .local int rx769_eos
    .local int rx769_rep
    .local pmc rx769_cur
    (rx769_cur, rx769_pos, rx769_tgt, $I10) = self."!cursor_start"()
    rx769_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx769_cur
    .local pmc match
    .lex "$/", match
    length rx769_eos, rx769_tgt
    set rx769_off, 0
    lt $I10, 2, rx769_start
    sub rx769_off, $I10, 1
    substr rx769_tgt, rx769_tgt, rx769_off
  rx769_start:
.annotate "line", 404
  # rx literal  "["
    add $I11, rx769_pos, 1
    gt $I11, rx769_eos, rx769_fail
    sub $I11, rx769_pos, rx769_off
    substr $S10, rx769_tgt, $I11, 1
    ne $S10, "[", rx769_fail
    add rx769_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."ws"()
    unless $P10, rx769_fail
    rx769_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."EXPR"()
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx769_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx769_pos, 1
    gt $I11, rx769_eos, rx769_fail
    sub $I11, rx769_pos, rx769_off
    substr $S10, rx769_tgt, $I11, 1
    ne $S10, "]", rx769_fail
    add rx769_pos, 1
.annotate "line", 405
  # rx subrule "O" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."O"("%methodop")
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx769_pos = $P10."pos"()
.annotate "line", 403
  # rx pass
    rx769_cur."!cursor_pass"(rx769_pos, "postcircumfix:sym<[ ]>")
    rx769_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx769_pos)
    .return (rx769_cur)
  rx769_fail:
.annotate "line", 381
    (rx769_rep, rx769_pos, $I10, $P10) = rx769_cur."!mark_fail"(0)
    lt rx769_pos, -1, rx769_done
    eq rx769_pos, -1, rx769_fail
    jump $I10
  rx769_done:
    rx769_cur."!cursor_fail"()
    rx769_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx769_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("210_1258897739.74728") :method
.annotate "line", 381
    $P771 = self."!PREFIX__!subrule"("", "[")
    new $P772, "ResizablePMCArray"
    push $P772, $P771
    .return ($P772)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("211_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx774_tgt
    .local int rx774_pos
    .local int rx774_off
    .local int rx774_eos
    .local int rx774_rep
    .local pmc rx774_cur
    (rx774_cur, rx774_pos, rx774_tgt, $I10) = self."!cursor_start"()
    rx774_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx774_cur
    .local pmc match
    .lex "$/", match
    length rx774_eos, rx774_tgt
    set rx774_off, 0
    lt $I10, 2, rx774_start
    sub rx774_off, $I10, 1
    substr rx774_tgt, rx774_tgt, rx774_off
  rx774_start:
.annotate "line", 409
  # rx literal  "{"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 1
    ne $S10, "{", rx774_fail
    add rx774_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."ws"()
    unless $P10, rx774_fail
    rx774_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."EXPR"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx774_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx774_pos, 1
    gt $I11, rx774_eos, rx774_fail
    sub $I11, rx774_pos, rx774_off
    substr $S10, rx774_tgt, $I11, 1
    ne $S10, "}", rx774_fail
    add rx774_pos, 1
.annotate "line", 410
  # rx subrule "O" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."O"("%methodop")
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx774_pos = $P10."pos"()
.annotate "line", 408
  # rx pass
    rx774_cur."!cursor_pass"(rx774_pos, "postcircumfix:sym<{ }>")
    rx774_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx774_pos)
    .return (rx774_cur)
  rx774_fail:
.annotate "line", 381
    (rx774_rep, rx774_pos, $I10, $P10) = rx774_cur."!mark_fail"(0)
    lt rx774_pos, -1, rx774_done
    eq rx774_pos, -1, rx774_fail
    jump $I10
  rx774_done:
    rx774_cur."!cursor_fail"()
    rx774_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx774_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("212_1258897739.74728") :method
.annotate "line", 381
    $P776 = self."!PREFIX__!subrule"("", "{")
    new $P777, "ResizablePMCArray"
    push $P777, $P776
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("213_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx779_tgt
    .local int rx779_pos
    .local int rx779_off
    .local int rx779_eos
    .local int rx779_rep
    .local pmc rx779_cur
    (rx779_cur, rx779_pos, rx779_tgt, $I10) = self."!cursor_start"()
    rx779_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx779_cur
    .local pmc match
    .lex "$/", match
    length rx779_eos, rx779_tgt
    set rx779_off, 0
    lt $I10, 2, rx779_start
    sub rx779_off, $I10, 1
    substr rx779_tgt, rx779_tgt, rx779_off
  rx779_start:
.annotate "line", 414
  # rx enumcharlist negate=0 zerowidth
    ge rx779_pos, rx779_eos, rx779_fail
    sub $I10, rx779_pos, rx779_off
    substr $S10, rx779_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx779_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx779_cur."!cursor_pos"(rx779_pos)
    $P10 = rx779_cur."quote_EXPR"(":q")
    unless $P10, rx779_fail
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx779_pos = $P10."pos"()
.annotate "line", 415
  # rx subrule "O" subtype=capture negate=
    rx779_cur."!cursor_pos"(rx779_pos)
    $P10 = rx779_cur."O"("%methodop")
    unless $P10, rx779_fail
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx779_pos = $P10."pos"()
.annotate "line", 413
  # rx pass
    rx779_cur."!cursor_pass"(rx779_pos, "postcircumfix:sym<ang>")
    rx779_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx779_pos)
    .return (rx779_cur)
  rx779_fail:
.annotate "line", 381
    (rx779_rep, rx779_pos, $I10, $P10) = rx779_cur."!mark_fail"(0)
    lt rx779_pos, -1, rx779_done
    eq rx779_pos, -1, rx779_fail
    jump $I10
  rx779_done:
    rx779_cur."!cursor_fail"()
    rx779_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx779_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("214_1258897739.74728") :method
.annotate "line", 381
    new $P781, "ResizablePMCArray"
    push $P781, "<"
    .return ($P781)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("215_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx783_tgt
    .local int rx783_pos
    .local int rx783_off
    .local int rx783_eos
    .local int rx783_rep
    .local pmc rx783_cur
    (rx783_cur, rx783_pos, rx783_tgt, $I10) = self."!cursor_start"()
    rx783_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx783_cur
    .local pmc match
    .lex "$/", match
    length rx783_eos, rx783_tgt
    set rx783_off, 0
    lt $I10, 2, rx783_start
    sub rx783_off, $I10, 1
    substr rx783_tgt, rx783_tgt, rx783_off
  rx783_start:
.annotate "line", 419
  # rx literal  "("
    add $I11, rx783_pos, 1
    gt $I11, rx783_eos, rx783_fail
    sub $I11, rx783_pos, rx783_off
    substr $S10, rx783_tgt, $I11, 1
    ne $S10, "(", rx783_fail
    add rx783_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."ws"()
    unless $P10, rx783_fail
    rx783_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."arglist"()
    unless $P10, rx783_fail
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx783_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx783_pos, 1
    gt $I11, rx783_eos, rx783_fail
    sub $I11, rx783_pos, rx783_off
    substr $S10, rx783_tgt, $I11, 1
    ne $S10, ")", rx783_fail
    add rx783_pos, 1
.annotate "line", 420
  # rx subrule "O" subtype=capture negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."O"("%methodop")
    unless $P10, rx783_fail
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx783_pos = $P10."pos"()
.annotate "line", 418
  # rx pass
    rx783_cur."!cursor_pass"(rx783_pos, "postcircumfix:sym<( )>")
    rx783_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx783_pos)
    .return (rx783_cur)
  rx783_fail:
.annotate "line", 381
    (rx783_rep, rx783_pos, $I10, $P10) = rx783_cur."!mark_fail"(0)
    lt rx783_pos, -1, rx783_done
    eq rx783_pos, -1, rx783_fail
    jump $I10
  rx783_done:
    rx783_cur."!cursor_fail"()
    rx783_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx783_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("216_1258897739.74728") :method
.annotate "line", 381
    $P785 = self."!PREFIX__!subrule"("", "(")
    new $P786, "ResizablePMCArray"
    push $P786, $P785
    .return ($P786)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("217_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt, $I10) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx788_cur
    .local pmc match
    .lex "$/", match
    length rx788_eos, rx788_tgt
    set rx788_off, 0
    lt $I10, 2, rx788_start
    sub rx788_off, $I10, 1
    substr rx788_tgt, rx788_tgt, rx788_off
  rx788_start:
.annotate "line", 423
  # rx subrule "dotty" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."dotty"()
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx788_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."O"("%methodop")
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx788_pos = $P10."pos"()
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "postfix:sym<.>")
    rx788_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate "line", 381
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("218_1258897739.74728") :method
.annotate "line", 381
    $P790 = self."!PREFIX__!subrule"("dotty", "")
    new $P791, "ResizablePMCArray"
    push $P791, $P790
    .return ($P791)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("219_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx793_tgt
    .local int rx793_pos
    .local int rx793_off
    .local int rx793_eos
    .local int rx793_rep
    .local pmc rx793_cur
    (rx793_cur, rx793_pos, rx793_tgt, $I10) = self."!cursor_start"()
    rx793_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx793_cur
    .local pmc match
    .lex "$/", match
    length rx793_eos, rx793_tgt
    set rx793_off, 0
    lt $I10, 2, rx793_start
    sub rx793_off, $I10, 1
    substr rx793_tgt, rx793_tgt, rx793_off
  rx793_start:
.annotate "line", 425
  # rx subcapture "sym"
    set_addr $I10, rxcap_797_fail
    rx793_cur."!mark_push"(0, rx793_pos, $I10)
  # rx literal  "++"
    add $I11, rx793_pos, 2
    gt $I11, rx793_eos, rx793_fail
    sub $I11, rx793_pos, rx793_off
    substr $S10, rx793_tgt, $I11, 2
    ne $S10, "++", rx793_fail
    add rx793_pos, 2
    set_addr $I10, rxcap_797_fail
    ($I12, $I11) = rx793_cur."!mark_peek"($I10)
    rx793_cur."!cursor_pos"($I11)
    ($P10) = rx793_cur."!cursor_start"()
    $P10."!cursor_pass"(rx793_pos, "")
    rx793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_797_done
  rxcap_797_fail:
    goto rx793_fail
  rxcap_797_done:
  # rx subrule "O" subtype=capture negate=
    rx793_cur."!cursor_pos"(rx793_pos)
    $P10 = rx793_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx793_fail
    rx793_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx793_pos = $P10."pos"()
  # rx pass
    rx793_cur."!cursor_pass"(rx793_pos, "prefix:sym<++>")
    rx793_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx793_pos)
    .return (rx793_cur)
  rx793_fail:
.annotate "line", 381
    (rx793_rep, rx793_pos, $I10, $P10) = rx793_cur."!mark_fail"(0)
    lt rx793_pos, -1, rx793_done
    eq rx793_pos, -1, rx793_fail
    jump $I10
  rx793_done:
    rx793_cur."!cursor_fail"()
    rx793_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx793_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("220_1258897739.74728") :method
.annotate "line", 381
    $P795 = self."!PREFIX__!subrule"("O", "++")
    new $P796, "ResizablePMCArray"
    push $P796, $P795
    .return ($P796)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("221_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx799_tgt
    .local int rx799_pos
    .local int rx799_off
    .local int rx799_eos
    .local int rx799_rep
    .local pmc rx799_cur
    (rx799_cur, rx799_pos, rx799_tgt, $I10) = self."!cursor_start"()
    rx799_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx799_cur
    .local pmc match
    .lex "$/", match
    length rx799_eos, rx799_tgt
    set rx799_off, 0
    lt $I10, 2, rx799_start
    sub rx799_off, $I10, 1
    substr rx799_tgt, rx799_tgt, rx799_off
  rx799_start:
.annotate "line", 426
  # rx subcapture "sym"
    set_addr $I10, rxcap_803_fail
    rx799_cur."!mark_push"(0, rx799_pos, $I10)
  # rx literal  "--"
    add $I11, rx799_pos, 2
    gt $I11, rx799_eos, rx799_fail
    sub $I11, rx799_pos, rx799_off
    substr $S10, rx799_tgt, $I11, 2
    ne $S10, "--", rx799_fail
    add rx799_pos, 2
    set_addr $I10, rxcap_803_fail
    ($I12, $I11) = rx799_cur."!mark_peek"($I10)
    rx799_cur."!cursor_pos"($I11)
    ($P10) = rx799_cur."!cursor_start"()
    $P10."!cursor_pass"(rx799_pos, "")
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_803_done
  rxcap_803_fail:
    goto rx799_fail
  rxcap_803_done:
  # rx subrule "O" subtype=capture negate=
    rx799_cur."!cursor_pos"(rx799_pos)
    $P10 = rx799_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx799_fail
    rx799_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx799_pos = $P10."pos"()
  # rx pass
    rx799_cur."!cursor_pass"(rx799_pos, "prefix:sym<-->")
    rx799_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx799_pos)
    .return (rx799_cur)
  rx799_fail:
.annotate "line", 381
    (rx799_rep, rx799_pos, $I10, $P10) = rx799_cur."!mark_fail"(0)
    lt rx799_pos, -1, rx799_done
    eq rx799_pos, -1, rx799_fail
    jump $I10
  rx799_done:
    rx799_cur."!cursor_fail"()
    rx799_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx799_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("222_1258897739.74728") :method
.annotate "line", 381
    $P801 = self."!PREFIX__!subrule"("O", "--")
    new $P802, "ResizablePMCArray"
    push $P802, $P801
    .return ($P802)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("223_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx805_tgt
    .local int rx805_pos
    .local int rx805_off
    .local int rx805_eos
    .local int rx805_rep
    .local pmc rx805_cur
    (rx805_cur, rx805_pos, rx805_tgt, $I10) = self."!cursor_start"()
    rx805_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx805_cur
    .local pmc match
    .lex "$/", match
    length rx805_eos, rx805_tgt
    set rx805_off, 0
    lt $I10, 2, rx805_start
    sub rx805_off, $I10, 1
    substr rx805_tgt, rx805_tgt, rx805_off
  rx805_start:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_809_fail
    rx805_cur."!mark_push"(0, rx805_pos, $I10)
  # rx literal  "++"
    add $I11, rx805_pos, 2
    gt $I11, rx805_eos, rx805_fail
    sub $I11, rx805_pos, rx805_off
    substr $S10, rx805_tgt, $I11, 2
    ne $S10, "++", rx805_fail
    add rx805_pos, 2
    set_addr $I10, rxcap_809_fail
    ($I12, $I11) = rx805_cur."!mark_peek"($I10)
    rx805_cur."!cursor_pos"($I11)
    ($P10) = rx805_cur."!cursor_start"()
    $P10."!cursor_pass"(rx805_pos, "")
    rx805_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_809_done
  rxcap_809_fail:
    goto rx805_fail
  rxcap_809_done:
  # rx subrule "O" subtype=capture negate=
    rx805_cur."!cursor_pos"(rx805_pos)
    $P10 = rx805_cur."O"("%autoincrement")
    unless $P10, rx805_fail
    rx805_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx805_pos = $P10."pos"()
  # rx pass
    rx805_cur."!cursor_pass"(rx805_pos, "postfix:sym<++>")
    rx805_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx805_pos)
    .return (rx805_cur)
  rx805_fail:
.annotate "line", 381
    (rx805_rep, rx805_pos, $I10, $P10) = rx805_cur."!mark_fail"(0)
    lt rx805_pos, -1, rx805_done
    eq rx805_pos, -1, rx805_fail
    jump $I10
  rx805_done:
    rx805_cur."!cursor_fail"()
    rx805_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx805_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("224_1258897739.74728") :method
.annotate "line", 381
    $P807 = self."!PREFIX__!subrule"("O", "++")
    new $P808, "ResizablePMCArray"
    push $P808, $P807
    .return ($P808)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("225_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx811_tgt
    .local int rx811_pos
    .local int rx811_off
    .local int rx811_eos
    .local int rx811_rep
    .local pmc rx811_cur
    (rx811_cur, rx811_pos, rx811_tgt, $I10) = self."!cursor_start"()
    rx811_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx811_cur
    .local pmc match
    .lex "$/", match
    length rx811_eos, rx811_tgt
    set rx811_off, 0
    lt $I10, 2, rx811_start
    sub rx811_off, $I10, 1
    substr rx811_tgt, rx811_tgt, rx811_off
  rx811_start:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_815_fail
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  # rx literal  "--"
    add $I11, rx811_pos, 2
    gt $I11, rx811_eos, rx811_fail
    sub $I11, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I11, 2
    ne $S10, "--", rx811_fail
    add rx811_pos, 2
    set_addr $I10, rxcap_815_fail
    ($I12, $I11) = rx811_cur."!mark_peek"($I10)
    rx811_cur."!cursor_pos"($I11)
    ($P10) = rx811_cur."!cursor_start"()
    $P10."!cursor_pass"(rx811_pos, "")
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_815_done
  rxcap_815_fail:
    goto rx811_fail
  rxcap_815_done:
  # rx subrule "O" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."O"("%autoincrement")
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx811_pos = $P10."pos"()
  # rx pass
    rx811_cur."!cursor_pass"(rx811_pos, "postfix:sym<-->")
    rx811_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx811_pos)
    .return (rx811_cur)
  rx811_fail:
.annotate "line", 381
    (rx811_rep, rx811_pos, $I10, $P10) = rx811_cur."!mark_fail"(0)
    lt rx811_pos, -1, rx811_done
    eq rx811_pos, -1, rx811_fail
    jump $I10
  rx811_done:
    rx811_cur."!cursor_fail"()
    rx811_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx811_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("226_1258897739.74728") :method
.annotate "line", 381
    $P813 = self."!PREFIX__!subrule"("O", "--")
    new $P814, "ResizablePMCArray"
    push $P814, $P813
    .return ($P814)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("227_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx817_tgt
    .local int rx817_pos
    .local int rx817_off
    .local int rx817_eos
    .local int rx817_rep
    .local pmc rx817_cur
    (rx817_cur, rx817_pos, rx817_tgt, $I10) = self."!cursor_start"()
    rx817_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx817_cur
    .local pmc match
    .lex "$/", match
    length rx817_eos, rx817_tgt
    set rx817_off, 0
    lt $I10, 2, rx817_start
    sub rx817_off, $I10, 1
    substr rx817_tgt, rx817_tgt, rx817_off
  rx817_start:
.annotate "line", 432
  # rx subcapture "sym"
    set_addr $I10, rxcap_821_fail
    rx817_cur."!mark_push"(0, rx817_pos, $I10)
  # rx literal  "**"
    add $I11, rx817_pos, 2
    gt $I11, rx817_eos, rx817_fail
    sub $I11, rx817_pos, rx817_off
    substr $S10, rx817_tgt, $I11, 2
    ne $S10, "**", rx817_fail
    add rx817_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx817_cur."!cursor_pos"(rx817_pos)
    $P10 = rx817_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx817_fail
    rx817_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx817_pos = $P10."pos"()
  # rx pass
    rx817_cur."!cursor_pass"(rx817_pos, "infix:sym<**>")
    rx817_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx817_pos)
    .return (rx817_cur)
  rx817_fail:
.annotate "line", 381
    (rx817_rep, rx817_pos, $I10, $P10) = rx817_cur."!mark_fail"(0)
    lt rx817_pos, -1, rx817_done
    eq rx817_pos, -1, rx817_fail
    jump $I10
  rx817_done:
    rx817_cur."!cursor_fail"()
    rx817_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx817_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("228_1258897739.74728") :method
.annotate "line", 381
    $P819 = self."!PREFIX__!subrule"("O", "**")
    new $P820, "ResizablePMCArray"
    push $P820, $P819
    .return ($P820)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("229_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx823_tgt
    .local int rx823_pos
    .local int rx823_off
    .local int rx823_eos
    .local int rx823_rep
    .local pmc rx823_cur
    (rx823_cur, rx823_pos, rx823_tgt, $I10) = self."!cursor_start"()
    rx823_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx823_cur
    .local pmc match
    .lex "$/", match
    length rx823_eos, rx823_tgt
    set rx823_off, 0
    lt $I10, 2, rx823_start
    sub rx823_off, $I10, 1
    substr rx823_tgt, rx823_tgt, rx823_off
  rx823_start:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_827_fail
    rx823_cur."!mark_push"(0, rx823_pos, $I10)
  # rx literal  "+"
    add $I11, rx823_pos, 1
    gt $I11, rx823_eos, rx823_fail
    sub $I11, rx823_pos, rx823_off
    substr $S10, rx823_tgt, $I11, 1
    ne $S10, "+", rx823_fail
    add rx823_pos, 1
    set_addr $I10, rxcap_827_fail
    ($I12, $I11) = rx823_cur."!mark_peek"($I10)
    rx823_cur."!cursor_pos"($I11)
    ($P10) = rx823_cur."!cursor_start"()
    $P10."!cursor_pass"(rx823_pos, "")
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_827_done
  rxcap_827_fail:
    goto rx823_fail
  rxcap_827_done:
  # rx subrule "O" subtype=capture negate=
    rx823_cur."!cursor_pos"(rx823_pos)
    $P10 = rx823_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx823_fail
    rx823_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx823_pos = $P10."pos"()
  # rx pass
    rx823_cur."!cursor_pass"(rx823_pos, "prefix:sym<+>")
    rx823_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx823_pos)
    .return (rx823_cur)
  rx823_fail:
.annotate "line", 381
    (rx823_rep, rx823_pos, $I10, $P10) = rx823_cur."!mark_fail"(0)
    lt rx823_pos, -1, rx823_done
    eq rx823_pos, -1, rx823_fail
    jump $I10
  rx823_done:
    rx823_cur."!cursor_fail"()
    rx823_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx823_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("230_1258897739.74728") :method
.annotate "line", 381
    $P825 = self."!PREFIX__!subrule"("O", "+")
    new $P826, "ResizablePMCArray"
    push $P826, $P825
    .return ($P826)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("231_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx829_tgt
    .local int rx829_pos
    .local int rx829_off
    .local int rx829_eos
    .local int rx829_rep
    .local pmc rx829_cur
    (rx829_cur, rx829_pos, rx829_tgt, $I10) = self."!cursor_start"()
    rx829_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx829_cur
    .local pmc match
    .lex "$/", match
    length rx829_eos, rx829_tgt
    set rx829_off, 0
    lt $I10, 2, rx829_start
    sub rx829_off, $I10, 1
    substr rx829_tgt, rx829_tgt, rx829_off
  rx829_start:
.annotate "line", 435
  # rx subcapture "sym"
    set_addr $I10, rxcap_833_fail
    rx829_cur."!mark_push"(0, rx829_pos, $I10)
  # rx literal  "~"
    add $I11, rx829_pos, 1
    gt $I11, rx829_eos, rx829_fail
    sub $I11, rx829_pos, rx829_off
    substr $S10, rx829_tgt, $I11, 1
    ne $S10, "~", rx829_fail
    add rx829_pos, 1
    set_addr $I10, rxcap_833_fail
    ($I12, $I11) = rx829_cur."!mark_peek"($I10)
    rx829_cur."!cursor_pos"($I11)
    ($P10) = rx829_cur."!cursor_start"()
    $P10."!cursor_pass"(rx829_pos, "")
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_833_done
  rxcap_833_fail:
    goto rx829_fail
  rxcap_833_done:
  # rx subrule "O" subtype=capture negate=
    rx829_cur."!cursor_pos"(rx829_pos)
    $P10 = rx829_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx829_fail
    rx829_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx829_pos = $P10."pos"()
  # rx pass
    rx829_cur."!cursor_pass"(rx829_pos, "prefix:sym<~>")
    rx829_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx829_pos)
    .return (rx829_cur)
  rx829_fail:
.annotate "line", 381
    (rx829_rep, rx829_pos, $I10, $P10) = rx829_cur."!mark_fail"(0)
    lt rx829_pos, -1, rx829_done
    eq rx829_pos, -1, rx829_fail
    jump $I10
  rx829_done:
    rx829_cur."!cursor_fail"()
    rx829_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx829_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("232_1258897739.74728") :method
.annotate "line", 381
    $P831 = self."!PREFIX__!subrule"("O", "~")
    new $P832, "ResizablePMCArray"
    push $P832, $P831
    .return ($P832)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("233_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx835_tgt
    .local int rx835_pos
    .local int rx835_off
    .local int rx835_eos
    .local int rx835_rep
    .local pmc rx835_cur
    (rx835_cur, rx835_pos, rx835_tgt, $I10) = self."!cursor_start"()
    rx835_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx835_cur
    .local pmc match
    .lex "$/", match
    length rx835_eos, rx835_tgt
    set rx835_off, 0
    lt $I10, 2, rx835_start
    sub rx835_off, $I10, 1
    substr rx835_tgt, rx835_tgt, rx835_off
  rx835_start:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_839_fail
    rx835_cur."!mark_push"(0, rx835_pos, $I10)
  # rx literal  "-"
    add $I11, rx835_pos, 1
    gt $I11, rx835_eos, rx835_fail
    sub $I11, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I11, 1
    ne $S10, "-", rx835_fail
    add rx835_pos, 1
    set_addr $I10, rxcap_839_fail
    ($I12, $I11) = rx835_cur."!mark_peek"($I10)
    rx835_cur."!cursor_pos"($I11)
    ($P10) = rx835_cur."!cursor_start"()
    $P10."!cursor_pass"(rx835_pos, "")
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_839_done
  rxcap_839_fail:
    goto rx835_fail
  rxcap_839_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx835_pos, rx835_eos, rx835_fail
    sub $I10, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx835_fail
  # rx subrule "O" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx835_pos = $P10."pos"()
  # rx pass
    rx835_cur."!cursor_pass"(rx835_pos, "prefix:sym<->")
    rx835_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx835_pos)
    .return (rx835_cur)
  rx835_fail:
.annotate "line", 381
    (rx835_rep, rx835_pos, $I10, $P10) = rx835_cur."!mark_fail"(0)
    lt rx835_pos, -1, rx835_done
    eq rx835_pos, -1, rx835_fail
    jump $I10
  rx835_done:
    rx835_cur."!cursor_fail"()
    rx835_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx835_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("234_1258897739.74728") :method
.annotate "line", 381
    $P837 = self."!PREFIX__!subrule"("O", "-")
    new $P838, "ResizablePMCArray"
    push $P838, $P837
    .return ($P838)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("235_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx841_tgt
    .local int rx841_pos
    .local int rx841_off
    .local int rx841_eos
    .local int rx841_rep
    .local pmc rx841_cur
    (rx841_cur, rx841_pos, rx841_tgt, $I10) = self."!cursor_start"()
    rx841_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx841_cur
    .local pmc match
    .lex "$/", match
    length rx841_eos, rx841_tgt
    set rx841_off, 0
    lt $I10, 2, rx841_start
    sub rx841_off, $I10, 1
    substr rx841_tgt, rx841_tgt, rx841_off
  rx841_start:
.annotate "line", 437
  # rx subcapture "sym"
    set_addr $I10, rxcap_845_fail
    rx841_cur."!mark_push"(0, rx841_pos, $I10)
  # rx literal  "?"
    add $I11, rx841_pos, 1
    gt $I11, rx841_eos, rx841_fail
    sub $I11, rx841_pos, rx841_off
    substr $S10, rx841_tgt, $I11, 1
    ne $S10, "?", rx841_fail
    add rx841_pos, 1
    set_addr $I10, rxcap_845_fail
    ($I12, $I11) = rx841_cur."!mark_peek"($I10)
    rx841_cur."!cursor_pos"($I11)
    ($P10) = rx841_cur."!cursor_start"()
    $P10."!cursor_pass"(rx841_pos, "")
    rx841_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_845_done
  rxcap_845_fail:
    goto rx841_fail
  rxcap_845_done:
  # rx subrule "O" subtype=capture negate=
    rx841_cur."!cursor_pos"(rx841_pos)
    $P10 = rx841_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx841_fail
    rx841_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx841_pos = $P10."pos"()
  # rx pass
    rx841_cur."!cursor_pass"(rx841_pos, "prefix:sym<?>")
    rx841_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx841_pos)
    .return (rx841_cur)
  rx841_fail:
.annotate "line", 381
    (rx841_rep, rx841_pos, $I10, $P10) = rx841_cur."!mark_fail"(0)
    lt rx841_pos, -1, rx841_done
    eq rx841_pos, -1, rx841_fail
    jump $I10
  rx841_done:
    rx841_cur."!cursor_fail"()
    rx841_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx841_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("236_1258897739.74728") :method
.annotate "line", 381
    $P843 = self."!PREFIX__!subrule"("O", "?")
    new $P844, "ResizablePMCArray"
    push $P844, $P843
    .return ($P844)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("237_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx847_tgt
    .local int rx847_pos
    .local int rx847_off
    .local int rx847_eos
    .local int rx847_rep
    .local pmc rx847_cur
    (rx847_cur, rx847_pos, rx847_tgt, $I10) = self."!cursor_start"()
    rx847_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx847_cur
    .local pmc match
    .lex "$/", match
    length rx847_eos, rx847_tgt
    set rx847_off, 0
    lt $I10, 2, rx847_start
    sub rx847_off, $I10, 1
    substr rx847_tgt, rx847_tgt, rx847_off
  rx847_start:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_851_fail
    rx847_cur."!mark_push"(0, rx847_pos, $I10)
  # rx literal  "!"
    add $I11, rx847_pos, 1
    gt $I11, rx847_eos, rx847_fail
    sub $I11, rx847_pos, rx847_off
    substr $S10, rx847_tgt, $I11, 1
    ne $S10, "!", rx847_fail
    add rx847_pos, 1
    set_addr $I10, rxcap_851_fail
    ($I12, $I11) = rx847_cur."!mark_peek"($I10)
    rx847_cur."!cursor_pos"($I11)
    ($P10) = rx847_cur."!cursor_start"()
    $P10."!cursor_pass"(rx847_pos, "")
    rx847_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_851_done
  rxcap_851_fail:
    goto rx847_fail
  rxcap_851_done:
  # rx subrule "O" subtype=capture negate=
    rx847_cur."!cursor_pos"(rx847_pos)
    $P10 = rx847_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx847_fail
    rx847_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx847_pos = $P10."pos"()
  # rx pass
    rx847_cur."!cursor_pass"(rx847_pos, "prefix:sym<!>")
    rx847_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx847_pos)
    .return (rx847_cur)
  rx847_fail:
.annotate "line", 381
    (rx847_rep, rx847_pos, $I10, $P10) = rx847_cur."!mark_fail"(0)
    lt rx847_pos, -1, rx847_done
    eq rx847_pos, -1, rx847_fail
    jump $I10
  rx847_done:
    rx847_cur."!cursor_fail"()
    rx847_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx847_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("238_1258897739.74728") :method
.annotate "line", 381
    $P849 = self."!PREFIX__!subrule"("O", "!")
    new $P850, "ResizablePMCArray"
    push $P850, $P849
    .return ($P850)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("239_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx853_tgt
    .local int rx853_pos
    .local int rx853_off
    .local int rx853_eos
    .local int rx853_rep
    .local pmc rx853_cur
    (rx853_cur, rx853_pos, rx853_tgt, $I10) = self."!cursor_start"()
    rx853_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx853_cur
    .local pmc match
    .lex "$/", match
    length rx853_eos, rx853_tgt
    set rx853_off, 0
    lt $I10, 2, rx853_start
    sub rx853_off, $I10, 1
    substr rx853_tgt, rx853_tgt, rx853_off
  rx853_start:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_857_fail
    rx853_cur."!mark_push"(0, rx853_pos, $I10)
  # rx literal  "|"
    add $I11, rx853_pos, 1
    gt $I11, rx853_eos, rx853_fail
    sub $I11, rx853_pos, rx853_off
    substr $S10, rx853_tgt, $I11, 1
    ne $S10, "|", rx853_fail
    add rx853_pos, 1
    set_addr $I10, rxcap_857_fail
    ($I12, $I11) = rx853_cur."!mark_peek"($I10)
    rx853_cur."!cursor_pos"($I11)
    ($P10) = rx853_cur."!cursor_start"()
    $P10."!cursor_pass"(rx853_pos, "")
    rx853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_857_done
  rxcap_857_fail:
    goto rx853_fail
  rxcap_857_done:
  # rx subrule "O" subtype=capture negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."O"("%symbolic_unary")
    unless $P10, rx853_fail
    rx853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx853_pos = $P10."pos"()
  # rx pass
    rx853_cur."!cursor_pass"(rx853_pos, "prefix:sym<|>")
    rx853_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx853_pos)
    .return (rx853_cur)
  rx853_fail:
.annotate "line", 381
    (rx853_rep, rx853_pos, $I10, $P10) = rx853_cur."!mark_fail"(0)
    lt rx853_pos, -1, rx853_done
    eq rx853_pos, -1, rx853_fail
    jump $I10
  rx853_done:
    rx853_cur."!cursor_fail"()
    rx853_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx853_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("240_1258897739.74728") :method
.annotate "line", 381
    $P855 = self."!PREFIX__!subrule"("O", "|")
    new $P856, "ResizablePMCArray"
    push $P856, $P855
    .return ($P856)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("241_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx859_tgt
    .local int rx859_pos
    .local int rx859_off
    .local int rx859_eos
    .local int rx859_rep
    .local pmc rx859_cur
    (rx859_cur, rx859_pos, rx859_tgt, $I10) = self."!cursor_start"()
    rx859_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx859_cur
    .local pmc match
    .lex "$/", match
    length rx859_eos, rx859_tgt
    set rx859_off, 0
    lt $I10, 2, rx859_start
    sub rx859_off, $I10, 1
    substr rx859_tgt, rx859_tgt, rx859_off
  rx859_start:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_863_fail
    rx859_cur."!mark_push"(0, rx859_pos, $I10)
  # rx literal  "*"
    add $I11, rx859_pos, 1
    gt $I11, rx859_eos, rx859_fail
    sub $I11, rx859_pos, rx859_off
    substr $S10, rx859_tgt, $I11, 1
    ne $S10, "*", rx859_fail
    add rx859_pos, 1
    set_addr $I10, rxcap_863_fail
    ($I12, $I11) = rx859_cur."!mark_peek"($I10)
    rx859_cur."!cursor_pos"($I11)
    ($P10) = rx859_cur."!cursor_start"()
    $P10."!cursor_pass"(rx859_pos, "")
    rx859_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_863_done
  rxcap_863_fail:
    goto rx859_fail
  rxcap_863_done:
  # rx subrule "O" subtype=capture negate=
    rx859_cur."!cursor_pos"(rx859_pos)
    $P10 = rx859_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx859_fail
    rx859_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx859_pos = $P10."pos"()
  # rx pass
    rx859_cur."!cursor_pass"(rx859_pos, "infix:sym<*>")
    rx859_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx859_pos)
    .return (rx859_cur)
  rx859_fail:
.annotate "line", 381
    (rx859_rep, rx859_pos, $I10, $P10) = rx859_cur."!mark_fail"(0)
    lt rx859_pos, -1, rx859_done
    eq rx859_pos, -1, rx859_fail
    jump $I10
  rx859_done:
    rx859_cur."!cursor_fail"()
    rx859_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx859_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("242_1258897739.74728") :method
.annotate "line", 381
    $P861 = self."!PREFIX__!subrule"("O", "*")
    new $P862, "ResizablePMCArray"
    push $P862, $P861
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("243_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx865_tgt
    .local int rx865_pos
    .local int rx865_off
    .local int rx865_eos
    .local int rx865_rep
    .local pmc rx865_cur
    (rx865_cur, rx865_pos, rx865_tgt, $I10) = self."!cursor_start"()
    rx865_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx865_cur
    .local pmc match
    .lex "$/", match
    length rx865_eos, rx865_tgt
    set rx865_off, 0
    lt $I10, 2, rx865_start
    sub rx865_off, $I10, 1
    substr rx865_tgt, rx865_tgt, rx865_off
  rx865_start:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_869_fail
    rx865_cur."!mark_push"(0, rx865_pos, $I10)
  # rx literal  "/"
    add $I11, rx865_pos, 1
    gt $I11, rx865_eos, rx865_fail
    sub $I11, rx865_pos, rx865_off
    substr $S10, rx865_tgt, $I11, 1
    ne $S10, "/", rx865_fail
    add rx865_pos, 1
    set_addr $I10, rxcap_869_fail
    ($I12, $I11) = rx865_cur."!mark_peek"($I10)
    rx865_cur."!cursor_pos"($I11)
    ($P10) = rx865_cur."!cursor_start"()
    $P10."!cursor_pass"(rx865_pos, "")
    rx865_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_869_done
  rxcap_869_fail:
    goto rx865_fail
  rxcap_869_done:
  # rx subrule "O" subtype=capture negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx865_fail
    rx865_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx865_pos = $P10."pos"()
  # rx pass
    rx865_cur."!cursor_pass"(rx865_pos, "infix:sym</>")
    rx865_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx865_pos)
    .return (rx865_cur)
  rx865_fail:
.annotate "line", 381
    (rx865_rep, rx865_pos, $I10, $P10) = rx865_cur."!mark_fail"(0)
    lt rx865_pos, -1, rx865_done
    eq rx865_pos, -1, rx865_fail
    jump $I10
  rx865_done:
    rx865_cur."!cursor_fail"()
    rx865_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx865_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("244_1258897739.74728") :method
.annotate "line", 381
    $P867 = self."!PREFIX__!subrule"("O", "/")
    new $P868, "ResizablePMCArray"
    push $P868, $P867
    .return ($P868)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("245_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx871_tgt
    .local int rx871_pos
    .local int rx871_off
    .local int rx871_eos
    .local int rx871_rep
    .local pmc rx871_cur
    (rx871_cur, rx871_pos, rx871_tgt, $I10) = self."!cursor_start"()
    rx871_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx871_cur
    .local pmc match
    .lex "$/", match
    length rx871_eos, rx871_tgt
    set rx871_off, 0
    lt $I10, 2, rx871_start
    sub rx871_off, $I10, 1
    substr rx871_tgt, rx871_tgt, rx871_off
  rx871_start:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_875_fail
    rx871_cur."!mark_push"(0, rx871_pos, $I10)
  # rx literal  "%"
    add $I11, rx871_pos, 1
    gt $I11, rx871_eos, rx871_fail
    sub $I11, rx871_pos, rx871_off
    substr $S10, rx871_tgt, $I11, 1
    ne $S10, "%", rx871_fail
    add rx871_pos, 1
    set_addr $I10, rxcap_875_fail
    ($I12, $I11) = rx871_cur."!mark_peek"($I10)
    rx871_cur."!cursor_pos"($I11)
    ($P10) = rx871_cur."!cursor_start"()
    $P10."!cursor_pass"(rx871_pos, "")
    rx871_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_875_done
  rxcap_875_fail:
    goto rx871_fail
  rxcap_875_done:
  # rx subrule "O" subtype=capture negate=
    rx871_cur."!cursor_pos"(rx871_pos)
    $P10 = rx871_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx871_fail
    rx871_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx871_pos = $P10."pos"()
  # rx pass
    rx871_cur."!cursor_pass"(rx871_pos, "infix:sym<%>")
    rx871_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx871_pos)
    .return (rx871_cur)
  rx871_fail:
.annotate "line", 381
    (rx871_rep, rx871_pos, $I10, $P10) = rx871_cur."!mark_fail"(0)
    lt rx871_pos, -1, rx871_done
    eq rx871_pos, -1, rx871_fail
    jump $I10
  rx871_done:
    rx871_cur."!cursor_fail"()
    rx871_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx871_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("246_1258897739.74728") :method
.annotate "line", 381
    $P873 = self."!PREFIX__!subrule"("O", "%")
    new $P874, "ResizablePMCArray"
    push $P874, $P873
    .return ($P874)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("247_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx877_tgt
    .local int rx877_pos
    .local int rx877_off
    .local int rx877_eos
    .local int rx877_rep
    .local pmc rx877_cur
    (rx877_cur, rx877_pos, rx877_tgt, $I10) = self."!cursor_start"()
    rx877_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx877_cur
    .local pmc match
    .lex "$/", match
    length rx877_eos, rx877_tgt
    set rx877_off, 0
    lt $I10, 2, rx877_start
    sub rx877_off, $I10, 1
    substr rx877_tgt, rx877_tgt, rx877_off
  rx877_start:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_881_fail
    rx877_cur."!mark_push"(0, rx877_pos, $I10)
  # rx literal  "+"
    add $I11, rx877_pos, 1
    gt $I11, rx877_eos, rx877_fail
    sub $I11, rx877_pos, rx877_off
    substr $S10, rx877_tgt, $I11, 1
    ne $S10, "+", rx877_fail
    add rx877_pos, 1
    set_addr $I10, rxcap_881_fail
    ($I12, $I11) = rx877_cur."!mark_peek"($I10)
    rx877_cur."!cursor_pos"($I11)
    ($P10) = rx877_cur."!cursor_start"()
    $P10."!cursor_pass"(rx877_pos, "")
    rx877_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_881_done
  rxcap_881_fail:
    goto rx877_fail
  rxcap_881_done:
  # rx subrule "O" subtype=capture negate=
    rx877_cur."!cursor_pos"(rx877_pos)
    $P10 = rx877_cur."O"("%additive, :pirop<add>")
    unless $P10, rx877_fail
    rx877_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx877_pos = $P10."pos"()
  # rx pass
    rx877_cur."!cursor_pass"(rx877_pos, "infix:sym<+>")
    rx877_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx877_pos)
    .return (rx877_cur)
  rx877_fail:
.annotate "line", 381
    (rx877_rep, rx877_pos, $I10, $P10) = rx877_cur."!mark_fail"(0)
    lt rx877_pos, -1, rx877_done
    eq rx877_pos, -1, rx877_fail
    jump $I10
  rx877_done:
    rx877_cur."!cursor_fail"()
    rx877_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx877_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("248_1258897739.74728") :method
.annotate "line", 381
    $P879 = self."!PREFIX__!subrule"("O", "+")
    new $P880, "ResizablePMCArray"
    push $P880, $P879
    .return ($P880)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("249_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx883_tgt
    .local int rx883_pos
    .local int rx883_off
    .local int rx883_eos
    .local int rx883_rep
    .local pmc rx883_cur
    (rx883_cur, rx883_pos, rx883_tgt, $I10) = self."!cursor_start"()
    rx883_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx883_cur
    .local pmc match
    .lex "$/", match
    length rx883_eos, rx883_tgt
    set rx883_off, 0
    lt $I10, 2, rx883_start
    sub rx883_off, $I10, 1
    substr rx883_tgt, rx883_tgt, rx883_off
  rx883_start:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_887_fail
    rx883_cur."!mark_push"(0, rx883_pos, $I10)
  # rx literal  "-"
    add $I11, rx883_pos, 1
    gt $I11, rx883_eos, rx883_fail
    sub $I11, rx883_pos, rx883_off
    substr $S10, rx883_tgt, $I11, 1
    ne $S10, "-", rx883_fail
    add rx883_pos, 1
    set_addr $I10, rxcap_887_fail
    ($I12, $I11) = rx883_cur."!mark_peek"($I10)
    rx883_cur."!cursor_pos"($I11)
    ($P10) = rx883_cur."!cursor_start"()
    $P10."!cursor_pass"(rx883_pos, "")
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_887_done
  rxcap_887_fail:
    goto rx883_fail
  rxcap_887_done:
  # rx subrule "O" subtype=capture negate=
    rx883_cur."!cursor_pos"(rx883_pos)
    $P10 = rx883_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx883_fail
    rx883_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx883_pos = $P10."pos"()
  # rx pass
    rx883_cur."!cursor_pass"(rx883_pos, "infix:sym<->")
    rx883_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx883_pos)
    .return (rx883_cur)
  rx883_fail:
.annotate "line", 381
    (rx883_rep, rx883_pos, $I10, $P10) = rx883_cur."!mark_fail"(0)
    lt rx883_pos, -1, rx883_done
    eq rx883_pos, -1, rx883_fail
    jump $I10
  rx883_done:
    rx883_cur."!cursor_fail"()
    rx883_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx883_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("250_1258897739.74728") :method
.annotate "line", 381
    $P885 = self."!PREFIX__!subrule"("O", "-")
    new $P886, "ResizablePMCArray"
    push $P886, $P885
    .return ($P886)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("251_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx889_tgt
    .local int rx889_pos
    .local int rx889_off
    .local int rx889_eos
    .local int rx889_rep
    .local pmc rx889_cur
    (rx889_cur, rx889_pos, rx889_tgt, $I10) = self."!cursor_start"()
    rx889_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx889_cur
    .local pmc match
    .lex "$/", match
    length rx889_eos, rx889_tgt
    set rx889_off, 0
    lt $I10, 2, rx889_start
    sub rx889_off, $I10, 1
    substr rx889_tgt, rx889_tgt, rx889_off
  rx889_start:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_893_fail
    rx889_cur."!mark_push"(0, rx889_pos, $I10)
  # rx literal  "~"
    add $I11, rx889_pos, 1
    gt $I11, rx889_eos, rx889_fail
    sub $I11, rx889_pos, rx889_off
    substr $S10, rx889_tgt, $I11, 1
    ne $S10, "~", rx889_fail
    add rx889_pos, 1
    set_addr $I10, rxcap_893_fail
    ($I12, $I11) = rx889_cur."!mark_peek"($I10)
    rx889_cur."!cursor_pos"($I11)
    ($P10) = rx889_cur."!cursor_start"()
    $P10."!cursor_pass"(rx889_pos, "")
    rx889_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_893_done
  rxcap_893_fail:
    goto rx889_fail
  rxcap_893_done:
  # rx subrule "O" subtype=capture negate=
    rx889_cur."!cursor_pos"(rx889_pos)
    $P10 = rx889_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx889_fail
    rx889_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx889_pos = $P10."pos"()
  # rx pass
    rx889_cur."!cursor_pass"(rx889_pos, "infix:sym<~>")
    rx889_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx889_pos)
    .return (rx889_cur)
  rx889_fail:
.annotate "line", 381
    (rx889_rep, rx889_pos, $I10, $P10) = rx889_cur."!mark_fail"(0)
    lt rx889_pos, -1, rx889_done
    eq rx889_pos, -1, rx889_fail
    jump $I10
  rx889_done:
    rx889_cur."!cursor_fail"()
    rx889_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx889_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("252_1258897739.74728") :method
.annotate "line", 381
    $P891 = self."!PREFIX__!subrule"("O", "~")
    new $P892, "ResizablePMCArray"
    push $P892, $P891
    .return ($P892)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("253_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx895_tgt
    .local int rx895_pos
    .local int rx895_off
    .local int rx895_eos
    .local int rx895_rep
    .local pmc rx895_cur
    (rx895_cur, rx895_pos, rx895_tgt, $I10) = self."!cursor_start"()
    rx895_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx895_cur
    .local pmc match
    .lex "$/", match
    length rx895_eos, rx895_tgt
    set rx895_off, 0
    lt $I10, 2, rx895_start
    sub rx895_off, $I10, 1
    substr rx895_tgt, rx895_tgt, rx895_off
  rx895_start:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_899_fail
    rx895_cur."!mark_push"(0, rx895_pos, $I10)
  # rx literal  "=="
    add $I11, rx895_pos, 2
    gt $I11, rx895_eos, rx895_fail
    sub $I11, rx895_pos, rx895_off
    substr $S10, rx895_tgt, $I11, 2
    ne $S10, "==", rx895_fail
    add rx895_pos, 2
    set_addr $I10, rxcap_899_fail
    ($I12, $I11) = rx895_cur."!mark_peek"($I10)
    rx895_cur."!cursor_pos"($I11)
    ($P10) = rx895_cur."!cursor_start"()
    $P10."!cursor_pass"(rx895_pos, "")
    rx895_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_899_done
  rxcap_899_fail:
    goto rx895_fail
  rxcap_899_done:
  # rx subrule "O" subtype=capture negate=
    rx895_cur."!cursor_pos"(rx895_pos)
    $P10 = rx895_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx895_fail
    rx895_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx895_pos = $P10."pos"()
  # rx pass
    rx895_cur."!cursor_pass"(rx895_pos, "infix:sym<==>")
    rx895_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx895_pos)
    .return (rx895_cur)
  rx895_fail:
.annotate "line", 381
    (rx895_rep, rx895_pos, $I10, $P10) = rx895_cur."!mark_fail"(0)
    lt rx895_pos, -1, rx895_done
    eq rx895_pos, -1, rx895_fail
    jump $I10
  rx895_done:
    rx895_cur."!cursor_fail"()
    rx895_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx895_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("254_1258897739.74728") :method
.annotate "line", 381
    $P897 = self."!PREFIX__!subrule"("O", "==")
    new $P898, "ResizablePMCArray"
    push $P898, $P897
    .return ($P898)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("255_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx901_tgt
    .local int rx901_pos
    .local int rx901_off
    .local int rx901_eos
    .local int rx901_rep
    .local pmc rx901_cur
    (rx901_cur, rx901_pos, rx901_tgt, $I10) = self."!cursor_start"()
    rx901_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx901_cur
    .local pmc match
    .lex "$/", match
    length rx901_eos, rx901_tgt
    set rx901_off, 0
    lt $I10, 2, rx901_start
    sub rx901_off, $I10, 1
    substr rx901_tgt, rx901_tgt, rx901_off
  rx901_start:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_905_fail
    rx901_cur."!mark_push"(0, rx901_pos, $I10)
  # rx literal  "!="
    add $I11, rx901_pos, 2
    gt $I11, rx901_eos, rx901_fail
    sub $I11, rx901_pos, rx901_off
    substr $S10, rx901_tgt, $I11, 2
    ne $S10, "!=", rx901_fail
    add rx901_pos, 2
    set_addr $I10, rxcap_905_fail
    ($I12, $I11) = rx901_cur."!mark_peek"($I10)
    rx901_cur."!cursor_pos"($I11)
    ($P10) = rx901_cur."!cursor_start"()
    $P10."!cursor_pass"(rx901_pos, "")
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_905_done
  rxcap_905_fail:
    goto rx901_fail
  rxcap_905_done:
  # rx subrule "O" subtype=capture negate=
    rx901_cur."!cursor_pos"(rx901_pos)
    $P10 = rx901_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx901_fail
    rx901_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx901_pos = $P10."pos"()
  # rx pass
    rx901_cur."!cursor_pass"(rx901_pos, "infix:sym<!=>")
    rx901_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx901_pos)
    .return (rx901_cur)
  rx901_fail:
.annotate "line", 381
    (rx901_rep, rx901_pos, $I10, $P10) = rx901_cur."!mark_fail"(0)
    lt rx901_pos, -1, rx901_done
    eq rx901_pos, -1, rx901_fail
    jump $I10
  rx901_done:
    rx901_cur."!cursor_fail"()
    rx901_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx901_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("256_1258897739.74728") :method
.annotate "line", 381
    $P903 = self."!PREFIX__!subrule"("O", "!=")
    new $P904, "ResizablePMCArray"
    push $P904, $P903
    .return ($P904)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("257_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx907_tgt
    .local int rx907_pos
    .local int rx907_off
    .local int rx907_eos
    .local int rx907_rep
    .local pmc rx907_cur
    (rx907_cur, rx907_pos, rx907_tgt, $I10) = self."!cursor_start"()
    rx907_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx907_cur
    .local pmc match
    .lex "$/", match
    length rx907_eos, rx907_tgt
    set rx907_off, 0
    lt $I10, 2, rx907_start
    sub rx907_off, $I10, 1
    substr rx907_tgt, rx907_tgt, rx907_off
  rx907_start:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_911_fail
    rx907_cur."!mark_push"(0, rx907_pos, $I10)
  # rx literal  "<="
    add $I11, rx907_pos, 2
    gt $I11, rx907_eos, rx907_fail
    sub $I11, rx907_pos, rx907_off
    substr $S10, rx907_tgt, $I11, 2
    ne $S10, "<=", rx907_fail
    add rx907_pos, 2
    set_addr $I10, rxcap_911_fail
    ($I12, $I11) = rx907_cur."!mark_peek"($I10)
    rx907_cur."!cursor_pos"($I11)
    ($P10) = rx907_cur."!cursor_start"()
    $P10."!cursor_pass"(rx907_pos, "")
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_911_done
  rxcap_911_fail:
    goto rx907_fail
  rxcap_911_done:
  # rx subrule "O" subtype=capture negate=
    rx907_cur."!cursor_pos"(rx907_pos)
    $P10 = rx907_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx907_fail
    rx907_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx907_pos = $P10."pos"()
  # rx pass
    rx907_cur."!cursor_pass"(rx907_pos, "infix:sym<<=>")
    rx907_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx907_pos)
    .return (rx907_cur)
  rx907_fail:
.annotate "line", 381
    (rx907_rep, rx907_pos, $I10, $P10) = rx907_cur."!mark_fail"(0)
    lt rx907_pos, -1, rx907_done
    eq rx907_pos, -1, rx907_fail
    jump $I10
  rx907_done:
    rx907_cur."!cursor_fail"()
    rx907_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx907_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("258_1258897739.74728") :method
.annotate "line", 381
    $P909 = self."!PREFIX__!subrule"("O", "<=")
    new $P910, "ResizablePMCArray"
    push $P910, $P909
    .return ($P910)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("259_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt, $I10) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx913_cur
    .local pmc match
    .lex "$/", match
    length rx913_eos, rx913_tgt
    set rx913_off, 0
    lt $I10, 2, rx913_start
    sub rx913_off, $I10, 1
    substr rx913_tgt, rx913_tgt, rx913_off
  rx913_start:
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_917_fail
    rx913_cur."!mark_push"(0, rx913_pos, $I10)
  # rx literal  ">="
    add $I11, rx913_pos, 2
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 2
    ne $S10, ">=", rx913_fail
    add rx913_pos, 2
    set_addr $I10, rxcap_917_fail
    ($I12, $I11) = rx913_cur."!mark_peek"($I10)
    rx913_cur."!cursor_pos"($I11)
    ($P10) = rx913_cur."!cursor_start"()
    $P10."!cursor_pass"(rx913_pos, "")
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_917_done
  rxcap_917_fail:
    goto rx913_fail
  rxcap_917_done:
  # rx subrule "O" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx913_pos = $P10."pos"()
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "infix:sym<>=>")
    rx913_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate "line", 381
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("260_1258897739.74728") :method
.annotate "line", 381
    $P915 = self."!PREFIX__!subrule"("O", ">=")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("261_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx919_tgt
    .local int rx919_pos
    .local int rx919_off
    .local int rx919_eos
    .local int rx919_rep
    .local pmc rx919_cur
    (rx919_cur, rx919_pos, rx919_tgt, $I10) = self."!cursor_start"()
    rx919_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx919_cur
    .local pmc match
    .lex "$/", match
    length rx919_eos, rx919_tgt
    set rx919_off, 0
    lt $I10, 2, rx919_start
    sub rx919_off, $I10, 1
    substr rx919_tgt, rx919_tgt, rx919_off
  rx919_start:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_923_fail
    rx919_cur."!mark_push"(0, rx919_pos, $I10)
  # rx literal  "<"
    add $I11, rx919_pos, 1
    gt $I11, rx919_eos, rx919_fail
    sub $I11, rx919_pos, rx919_off
    substr $S10, rx919_tgt, $I11, 1
    ne $S10, "<", rx919_fail
    add rx919_pos, 1
    set_addr $I10, rxcap_923_fail
    ($I12, $I11) = rx919_cur."!mark_peek"($I10)
    rx919_cur."!cursor_pos"($I11)
    ($P10) = rx919_cur."!cursor_start"()
    $P10."!cursor_pass"(rx919_pos, "")
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_923_done
  rxcap_923_fail:
    goto rx919_fail
  rxcap_923_done:
  # rx subrule "O" subtype=capture negate=
    rx919_cur."!cursor_pos"(rx919_pos)
    $P10 = rx919_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx919_fail
    rx919_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx919_pos = $P10."pos"()
  # rx pass
    rx919_cur."!cursor_pass"(rx919_pos, "infix:sym<<>")
    rx919_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx919_pos)
    .return (rx919_cur)
  rx919_fail:
.annotate "line", 381
    (rx919_rep, rx919_pos, $I10, $P10) = rx919_cur."!mark_fail"(0)
    lt rx919_pos, -1, rx919_done
    eq rx919_pos, -1, rx919_fail
    jump $I10
  rx919_done:
    rx919_cur."!cursor_fail"()
    rx919_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx919_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("262_1258897739.74728") :method
.annotate "line", 381
    $P921 = self."!PREFIX__!subrule"("O", "<")
    new $P922, "ResizablePMCArray"
    push $P922, $P921
    .return ($P922)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("263_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx925_tgt
    .local int rx925_pos
    .local int rx925_off
    .local int rx925_eos
    .local int rx925_rep
    .local pmc rx925_cur
    (rx925_cur, rx925_pos, rx925_tgt, $I10) = self."!cursor_start"()
    rx925_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx925_cur
    .local pmc match
    .lex "$/", match
    length rx925_eos, rx925_tgt
    set rx925_off, 0
    lt $I10, 2, rx925_start
    sub rx925_off, $I10, 1
    substr rx925_tgt, rx925_tgt, rx925_off
  rx925_start:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_929_fail
    rx925_cur."!mark_push"(0, rx925_pos, $I10)
  # rx literal  ">"
    add $I11, rx925_pos, 1
    gt $I11, rx925_eos, rx925_fail
    sub $I11, rx925_pos, rx925_off
    substr $S10, rx925_tgt, $I11, 1
    ne $S10, ">", rx925_fail
    add rx925_pos, 1
    set_addr $I10, rxcap_929_fail
    ($I12, $I11) = rx925_cur."!mark_peek"($I10)
    rx925_cur."!cursor_pos"($I11)
    ($P10) = rx925_cur."!cursor_start"()
    $P10."!cursor_pass"(rx925_pos, "")
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_929_done
  rxcap_929_fail:
    goto rx925_fail
  rxcap_929_done:
  # rx subrule "O" subtype=capture negate=
    rx925_cur."!cursor_pos"(rx925_pos)
    $P10 = rx925_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx925_fail
    rx925_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx925_pos = $P10."pos"()
  # rx pass
    rx925_cur."!cursor_pass"(rx925_pos, "infix:sym<>>")
    rx925_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx925_pos)
    .return (rx925_cur)
  rx925_fail:
.annotate "line", 381
    (rx925_rep, rx925_pos, $I10, $P10) = rx925_cur."!mark_fail"(0)
    lt rx925_pos, -1, rx925_done
    eq rx925_pos, -1, rx925_fail
    jump $I10
  rx925_done:
    rx925_cur."!cursor_fail"()
    rx925_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx925_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("264_1258897739.74728") :method
.annotate "line", 381
    $P927 = self."!PREFIX__!subrule"("O", ">")
    new $P928, "ResizablePMCArray"
    push $P928, $P927
    .return ($P928)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("265_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx931_tgt
    .local int rx931_pos
    .local int rx931_off
    .local int rx931_eos
    .local int rx931_rep
    .local pmc rx931_cur
    (rx931_cur, rx931_pos, rx931_tgt, $I10) = self."!cursor_start"()
    rx931_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx931_cur
    .local pmc match
    .lex "$/", match
    length rx931_eos, rx931_tgt
    set rx931_off, 0
    lt $I10, 2, rx931_start
    sub rx931_off, $I10, 1
    substr rx931_tgt, rx931_tgt, rx931_off
  rx931_start:
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_935_fail
    rx931_cur."!mark_push"(0, rx931_pos, $I10)
  # rx literal  "eq"
    add $I11, rx931_pos, 2
    gt $I11, rx931_eos, rx931_fail
    sub $I11, rx931_pos, rx931_off
    substr $S10, rx931_tgt, $I11, 2
    ne $S10, "eq", rx931_fail
    add rx931_pos, 2
    set_addr $I10, rxcap_935_fail
    ($I12, $I11) = rx931_cur."!mark_peek"($I10)
    rx931_cur."!cursor_pos"($I11)
    ($P10) = rx931_cur."!cursor_start"()
    $P10."!cursor_pass"(rx931_pos, "")
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_935_done
  rxcap_935_fail:
    goto rx931_fail
  rxcap_935_done:
  # rx subrule "O" subtype=capture negate=
    rx931_cur."!cursor_pos"(rx931_pos)
    $P10 = rx931_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx931_fail
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx931_pos = $P10."pos"()
  # rx pass
    rx931_cur."!cursor_pass"(rx931_pos, "infix:sym<eq>")
    rx931_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx931_pos)
    .return (rx931_cur)
  rx931_fail:
.annotate "line", 381
    (rx931_rep, rx931_pos, $I10, $P10) = rx931_cur."!mark_fail"(0)
    lt rx931_pos, -1, rx931_done
    eq rx931_pos, -1, rx931_fail
    jump $I10
  rx931_done:
    rx931_cur."!cursor_fail"()
    rx931_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx931_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("266_1258897739.74728") :method
.annotate "line", 381
    $P933 = self."!PREFIX__!subrule"("O", "eq")
    new $P934, "ResizablePMCArray"
    push $P934, $P933
    .return ($P934)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("267_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx937_tgt
    .local int rx937_pos
    .local int rx937_off
    .local int rx937_eos
    .local int rx937_rep
    .local pmc rx937_cur
    (rx937_cur, rx937_pos, rx937_tgt, $I10) = self."!cursor_start"()
    rx937_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx937_cur
    .local pmc match
    .lex "$/", match
    length rx937_eos, rx937_tgt
    set rx937_off, 0
    lt $I10, 2, rx937_start
    sub rx937_off, $I10, 1
    substr rx937_tgt, rx937_tgt, rx937_off
  rx937_start:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_941_fail
    rx937_cur."!mark_push"(0, rx937_pos, $I10)
  # rx literal  "ne"
    add $I11, rx937_pos, 2
    gt $I11, rx937_eos, rx937_fail
    sub $I11, rx937_pos, rx937_off
    substr $S10, rx937_tgt, $I11, 2
    ne $S10, "ne", rx937_fail
    add rx937_pos, 2
    set_addr $I10, rxcap_941_fail
    ($I12, $I11) = rx937_cur."!mark_peek"($I10)
    rx937_cur."!cursor_pos"($I11)
    ($P10) = rx937_cur."!cursor_start"()
    $P10."!cursor_pass"(rx937_pos, "")
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_941_done
  rxcap_941_fail:
    goto rx937_fail
  rxcap_941_done:
  # rx subrule "O" subtype=capture negate=
    rx937_cur."!cursor_pos"(rx937_pos)
    $P10 = rx937_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx937_fail
    rx937_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx937_pos = $P10."pos"()
  # rx pass
    rx937_cur."!cursor_pass"(rx937_pos, "infix:sym<ne>")
    rx937_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx937_pos)
    .return (rx937_cur)
  rx937_fail:
.annotate "line", 381
    (rx937_rep, rx937_pos, $I10, $P10) = rx937_cur."!mark_fail"(0)
    lt rx937_pos, -1, rx937_done
    eq rx937_pos, -1, rx937_fail
    jump $I10
  rx937_done:
    rx937_cur."!cursor_fail"()
    rx937_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx937_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("268_1258897739.74728") :method
.annotate "line", 381
    $P939 = self."!PREFIX__!subrule"("O", "ne")
    new $P940, "ResizablePMCArray"
    push $P940, $P939
    .return ($P940)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("269_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx943_tgt
    .local int rx943_pos
    .local int rx943_off
    .local int rx943_eos
    .local int rx943_rep
    .local pmc rx943_cur
    (rx943_cur, rx943_pos, rx943_tgt, $I10) = self."!cursor_start"()
    rx943_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx943_cur
    .local pmc match
    .lex "$/", match
    length rx943_eos, rx943_tgt
    set rx943_off, 0
    lt $I10, 2, rx943_start
    sub rx943_off, $I10, 1
    substr rx943_tgt, rx943_tgt, rx943_off
  rx943_start:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_947_fail
    rx943_cur."!mark_push"(0, rx943_pos, $I10)
  # rx literal  "le"
    add $I11, rx943_pos, 2
    gt $I11, rx943_eos, rx943_fail
    sub $I11, rx943_pos, rx943_off
    substr $S10, rx943_tgt, $I11, 2
    ne $S10, "le", rx943_fail
    add rx943_pos, 2
    set_addr $I10, rxcap_947_fail
    ($I12, $I11) = rx943_cur."!mark_peek"($I10)
    rx943_cur."!cursor_pos"($I11)
    ($P10) = rx943_cur."!cursor_start"()
    $P10."!cursor_pass"(rx943_pos, "")
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_947_done
  rxcap_947_fail:
    goto rx943_fail
  rxcap_947_done:
  # rx subrule "O" subtype=capture negate=
    rx943_cur."!cursor_pos"(rx943_pos)
    $P10 = rx943_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx943_fail
    rx943_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx943_pos = $P10."pos"()
  # rx pass
    rx943_cur."!cursor_pass"(rx943_pos, "infix:sym<le>")
    rx943_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx943_pos)
    .return (rx943_cur)
  rx943_fail:
.annotate "line", 381
    (rx943_rep, rx943_pos, $I10, $P10) = rx943_cur."!mark_fail"(0)
    lt rx943_pos, -1, rx943_done
    eq rx943_pos, -1, rx943_fail
    jump $I10
  rx943_done:
    rx943_cur."!cursor_fail"()
    rx943_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx943_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("270_1258897739.74728") :method
.annotate "line", 381
    $P945 = self."!PREFIX__!subrule"("O", "le")
    new $P946, "ResizablePMCArray"
    push $P946, $P945
    .return ($P946)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("271_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx949_tgt
    .local int rx949_pos
    .local int rx949_off
    .local int rx949_eos
    .local int rx949_rep
    .local pmc rx949_cur
    (rx949_cur, rx949_pos, rx949_tgt, $I10) = self."!cursor_start"()
    rx949_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx949_cur
    .local pmc match
    .lex "$/", match
    length rx949_eos, rx949_tgt
    set rx949_off, 0
    lt $I10, 2, rx949_start
    sub rx949_off, $I10, 1
    substr rx949_tgt, rx949_tgt, rx949_off
  rx949_start:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_953_fail
    rx949_cur."!mark_push"(0, rx949_pos, $I10)
  # rx literal  "ge"
    add $I11, rx949_pos, 2
    gt $I11, rx949_eos, rx949_fail
    sub $I11, rx949_pos, rx949_off
    substr $S10, rx949_tgt, $I11, 2
    ne $S10, "ge", rx949_fail
    add rx949_pos, 2
    set_addr $I10, rxcap_953_fail
    ($I12, $I11) = rx949_cur."!mark_peek"($I10)
    rx949_cur."!cursor_pos"($I11)
    ($P10) = rx949_cur."!cursor_start"()
    $P10."!cursor_pass"(rx949_pos, "")
    rx949_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_953_done
  rxcap_953_fail:
    goto rx949_fail
  rxcap_953_done:
  # rx subrule "O" subtype=capture negate=
    rx949_cur."!cursor_pos"(rx949_pos)
    $P10 = rx949_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx949_fail
    rx949_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx949_pos = $P10."pos"()
  # rx pass
    rx949_cur."!cursor_pass"(rx949_pos, "infix:sym<ge>")
    rx949_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx949_pos)
    .return (rx949_cur)
  rx949_fail:
.annotate "line", 381
    (rx949_rep, rx949_pos, $I10, $P10) = rx949_cur."!mark_fail"(0)
    lt rx949_pos, -1, rx949_done
    eq rx949_pos, -1, rx949_fail
    jump $I10
  rx949_done:
    rx949_cur."!cursor_fail"()
    rx949_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx949_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("272_1258897739.74728") :method
.annotate "line", 381
    $P951 = self."!PREFIX__!subrule"("O", "ge")
    new $P952, "ResizablePMCArray"
    push $P952, $P951
    .return ($P952)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("273_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx955_tgt
    .local int rx955_pos
    .local int rx955_off
    .local int rx955_eos
    .local int rx955_rep
    .local pmc rx955_cur
    (rx955_cur, rx955_pos, rx955_tgt, $I10) = self."!cursor_start"()
    rx955_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx955_cur
    .local pmc match
    .lex "$/", match
    length rx955_eos, rx955_tgt
    set rx955_off, 0
    lt $I10, 2, rx955_start
    sub rx955_off, $I10, 1
    substr rx955_tgt, rx955_tgt, rx955_off
  rx955_start:
.annotate "line", 460
  # rx subcapture "sym"
    set_addr $I10, rxcap_959_fail
    rx955_cur."!mark_push"(0, rx955_pos, $I10)
  # rx literal  "lt"
    add $I11, rx955_pos, 2
    gt $I11, rx955_eos, rx955_fail
    sub $I11, rx955_pos, rx955_off
    substr $S10, rx955_tgt, $I11, 2
    ne $S10, "lt", rx955_fail
    add rx955_pos, 2
    set_addr $I10, rxcap_959_fail
    ($I12, $I11) = rx955_cur."!mark_peek"($I10)
    rx955_cur."!cursor_pos"($I11)
    ($P10) = rx955_cur."!cursor_start"()
    $P10."!cursor_pass"(rx955_pos, "")
    rx955_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_959_done
  rxcap_959_fail:
    goto rx955_fail
  rxcap_959_done:
  # rx subrule "O" subtype=capture negate=
    rx955_cur."!cursor_pos"(rx955_pos)
    $P10 = rx955_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx955_fail
    rx955_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx955_pos = $P10."pos"()
  # rx pass
    rx955_cur."!cursor_pass"(rx955_pos, "infix:sym<lt>")
    rx955_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx955_pos)
    .return (rx955_cur)
  rx955_fail:
.annotate "line", 381
    (rx955_rep, rx955_pos, $I10, $P10) = rx955_cur."!mark_fail"(0)
    lt rx955_pos, -1, rx955_done
    eq rx955_pos, -1, rx955_fail
    jump $I10
  rx955_done:
    rx955_cur."!cursor_fail"()
    rx955_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx955_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("274_1258897739.74728") :method
.annotate "line", 381
    $P957 = self."!PREFIX__!subrule"("O", "lt")
    new $P958, "ResizablePMCArray"
    push $P958, $P957
    .return ($P958)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("275_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt, $I10) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx961_cur
    .local pmc match
    .lex "$/", match
    length rx961_eos, rx961_tgt
    set rx961_off, 0
    lt $I10, 2, rx961_start
    sub rx961_off, $I10, 1
    substr rx961_tgt, rx961_tgt, rx961_off
  rx961_start:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_965_fail
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  # rx literal  "gt"
    add $I11, rx961_pos, 2
    gt $I11, rx961_eos, rx961_fail
    sub $I11, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I11, 2
    ne $S10, "gt", rx961_fail
    add rx961_pos, 2
    set_addr $I10, rxcap_965_fail
    ($I12, $I11) = rx961_cur."!mark_peek"($I10)
    rx961_cur."!cursor_pos"($I11)
    ($P10) = rx961_cur."!cursor_start"()
    $P10."!cursor_pass"(rx961_pos, "")
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_965_done
  rxcap_965_fail:
    goto rx961_fail
  rxcap_965_done:
  # rx subrule "O" subtype=capture negate=
    rx961_cur."!cursor_pos"(rx961_pos)
    $P10 = rx961_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, "infix:sym<gt>")
    rx961_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate "line", 381
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("276_1258897739.74728") :method
.annotate "line", 381
    $P963 = self."!PREFIX__!subrule"("O", "gt")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("277_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx967_tgt
    .local int rx967_pos
    .local int rx967_off
    .local int rx967_eos
    .local int rx967_rep
    .local pmc rx967_cur
    (rx967_cur, rx967_pos, rx967_tgt, $I10) = self."!cursor_start"()
    rx967_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx967_cur
    .local pmc match
    .lex "$/", match
    length rx967_eos, rx967_tgt
    set rx967_off, 0
    lt $I10, 2, rx967_start
    sub rx967_off, $I10, 1
    substr rx967_tgt, rx967_tgt, rx967_off
  rx967_start:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_971_fail
    rx967_cur."!mark_push"(0, rx967_pos, $I10)
  # rx literal  "=:="
    add $I11, rx967_pos, 3
    gt $I11, rx967_eos, rx967_fail
    sub $I11, rx967_pos, rx967_off
    substr $S10, rx967_tgt, $I11, 3
    ne $S10, "=:=", rx967_fail
    add rx967_pos, 3
    set_addr $I10, rxcap_971_fail
    ($I12, $I11) = rx967_cur."!mark_peek"($I10)
    rx967_cur."!cursor_pos"($I11)
    ($P10) = rx967_cur."!cursor_start"()
    $P10."!cursor_pass"(rx967_pos, "")
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_971_done
  rxcap_971_fail:
    goto rx967_fail
  rxcap_971_done:
  # rx subrule "O" subtype=capture negate=
    rx967_cur."!cursor_pos"(rx967_pos)
    $P10 = rx967_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx967_fail
    rx967_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx967_pos = $P10."pos"()
  # rx pass
    rx967_cur."!cursor_pass"(rx967_pos, "infix:sym<=:=>")
    rx967_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx967_pos)
    .return (rx967_cur)
  rx967_fail:
.annotate "line", 381
    (rx967_rep, rx967_pos, $I10, $P10) = rx967_cur."!mark_fail"(0)
    lt rx967_pos, -1, rx967_done
    eq rx967_pos, -1, rx967_fail
    jump $I10
  rx967_done:
    rx967_cur."!cursor_fail"()
    rx967_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx967_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("278_1258897739.74728") :method
.annotate "line", 381
    $P969 = self."!PREFIX__!subrule"("O", "=:=")
    new $P970, "ResizablePMCArray"
    push $P970, $P969
    .return ($P970)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("279_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx973_tgt
    .local int rx973_pos
    .local int rx973_off
    .local int rx973_eos
    .local int rx973_rep
    .local pmc rx973_cur
    (rx973_cur, rx973_pos, rx973_tgt, $I10) = self."!cursor_start"()
    rx973_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx973_cur
    .local pmc match
    .lex "$/", match
    length rx973_eos, rx973_tgt
    set rx973_off, 0
    lt $I10, 2, rx973_start
    sub rx973_off, $I10, 1
    substr rx973_tgt, rx973_tgt, rx973_off
  rx973_start:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_977_fail
    rx973_cur."!mark_push"(0, rx973_pos, $I10)
  # rx literal  "&&"
    add $I11, rx973_pos, 2
    gt $I11, rx973_eos, rx973_fail
    sub $I11, rx973_pos, rx973_off
    substr $S10, rx973_tgt, $I11, 2
    ne $S10, "&&", rx973_fail
    add rx973_pos, 2
    set_addr $I10, rxcap_977_fail
    ($I12, $I11) = rx973_cur."!mark_peek"($I10)
    rx973_cur."!cursor_pos"($I11)
    ($P10) = rx973_cur."!cursor_start"()
    $P10."!cursor_pass"(rx973_pos, "")
    rx973_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_977_done
  rxcap_977_fail:
    goto rx973_fail
  rxcap_977_done:
  # rx subrule "O" subtype=capture negate=
    rx973_cur."!cursor_pos"(rx973_pos)
    $P10 = rx973_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx973_fail
    rx973_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx973_pos = $P10."pos"()
  # rx pass
    rx973_cur."!cursor_pass"(rx973_pos, "infix:sym<&&>")
    rx973_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx973_pos)
    .return (rx973_cur)
  rx973_fail:
.annotate "line", 381
    (rx973_rep, rx973_pos, $I10, $P10) = rx973_cur."!mark_fail"(0)
    lt rx973_pos, -1, rx973_done
    eq rx973_pos, -1, rx973_fail
    jump $I10
  rx973_done:
    rx973_cur."!cursor_fail"()
    rx973_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx973_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("280_1258897739.74728") :method
.annotate "line", 381
    $P975 = self."!PREFIX__!subrule"("O", "&&")
    new $P976, "ResizablePMCArray"
    push $P976, $P975
    .return ($P976)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("281_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx979_tgt
    .local int rx979_pos
    .local int rx979_off
    .local int rx979_eos
    .local int rx979_rep
    .local pmc rx979_cur
    (rx979_cur, rx979_pos, rx979_tgt, $I10) = self."!cursor_start"()
    rx979_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx979_cur
    .local pmc match
    .lex "$/", match
    length rx979_eos, rx979_tgt
    set rx979_off, 0
    lt $I10, 2, rx979_start
    sub rx979_off, $I10, 1
    substr rx979_tgt, rx979_tgt, rx979_off
  rx979_start:
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_983_fail
    rx979_cur."!mark_push"(0, rx979_pos, $I10)
  # rx literal  "||"
    add $I11, rx979_pos, 2
    gt $I11, rx979_eos, rx979_fail
    sub $I11, rx979_pos, rx979_off
    substr $S10, rx979_tgt, $I11, 2
    ne $S10, "||", rx979_fail
    add rx979_pos, 2
    set_addr $I10, rxcap_983_fail
    ($I12, $I11) = rx979_cur."!mark_peek"($I10)
    rx979_cur."!cursor_pos"($I11)
    ($P10) = rx979_cur."!cursor_start"()
    $P10."!cursor_pass"(rx979_pos, "")
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_983_done
  rxcap_983_fail:
    goto rx979_fail
  rxcap_983_done:
  # rx subrule "O" subtype=capture negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx979_fail
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx979_pos = $P10."pos"()
  # rx pass
    rx979_cur."!cursor_pass"(rx979_pos, "infix:sym<||>")
    rx979_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx979_pos)
    .return (rx979_cur)
  rx979_fail:
.annotate "line", 381
    (rx979_rep, rx979_pos, $I10, $P10) = rx979_cur."!mark_fail"(0)
    lt rx979_pos, -1, rx979_done
    eq rx979_pos, -1, rx979_fail
    jump $I10
  rx979_done:
    rx979_cur."!cursor_fail"()
    rx979_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx979_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("282_1258897739.74728") :method
.annotate "line", 381
    $P981 = self."!PREFIX__!subrule"("O", "||")
    new $P982, "ResizablePMCArray"
    push $P982, $P981
    .return ($P982)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("283_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx985_tgt
    .local int rx985_pos
    .local int rx985_off
    .local int rx985_eos
    .local int rx985_rep
    .local pmc rx985_cur
    (rx985_cur, rx985_pos, rx985_tgt, $I10) = self."!cursor_start"()
    rx985_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx985_cur
    .local pmc match
    .lex "$/", match
    length rx985_eos, rx985_tgt
    set rx985_off, 0
    lt $I10, 2, rx985_start
    sub rx985_off, $I10, 1
    substr rx985_tgt, rx985_tgt, rx985_off
  rx985_start:
.annotate "line", 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_989_fail
    rx985_cur."!mark_push"(0, rx985_pos, $I10)
  # rx literal  "//"
    add $I11, rx985_pos, 2
    gt $I11, rx985_eos, rx985_fail
    sub $I11, rx985_pos, rx985_off
    substr $S10, rx985_tgt, $I11, 2
    ne $S10, "//", rx985_fail
    add rx985_pos, 2
    set_addr $I10, rxcap_989_fail
    ($I12, $I11) = rx985_cur."!mark_peek"($I10)
    rx985_cur."!cursor_pos"($I11)
    ($P10) = rx985_cur."!cursor_start"()
    $P10."!cursor_pass"(rx985_pos, "")
    rx985_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_989_done
  rxcap_989_fail:
    goto rx985_fail
  rxcap_989_done:
  # rx subrule "O" subtype=capture negate=
    rx985_cur."!cursor_pos"(rx985_pos)
    $P10 = rx985_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx985_fail
    rx985_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx985_pos = $P10."pos"()
  # rx pass
    rx985_cur."!cursor_pass"(rx985_pos, "infix:sym<//>")
    rx985_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx985_pos)
    .return (rx985_cur)
  rx985_fail:
.annotate "line", 381
    (rx985_rep, rx985_pos, $I10, $P10) = rx985_cur."!mark_fail"(0)
    lt rx985_pos, -1, rx985_done
    eq rx985_pos, -1, rx985_fail
    jump $I10
  rx985_done:
    rx985_cur."!cursor_fail"()
    rx985_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx985_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("284_1258897739.74728") :method
.annotate "line", 381
    $P987 = self."!PREFIX__!subrule"("O", "//")
    new $P988, "ResizablePMCArray"
    push $P988, $P987
    .return ($P988)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("285_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx991_tgt
    .local int rx991_pos
    .local int rx991_off
    .local int rx991_eos
    .local int rx991_rep
    .local pmc rx991_cur
    (rx991_cur, rx991_pos, rx991_tgt, $I10) = self."!cursor_start"()
    rx991_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx991_cur
    .local pmc match
    .lex "$/", match
    length rx991_eos, rx991_tgt
    set rx991_off, 0
    lt $I10, 2, rx991_start
    sub rx991_off, $I10, 1
    substr rx991_tgt, rx991_tgt, rx991_off
  rx991_start:
.annotate "line", 470
  # rx literal  "??"
    add $I11, rx991_pos, 2
    gt $I11, rx991_eos, rx991_fail
    sub $I11, rx991_pos, rx991_off
    substr $S10, rx991_tgt, $I11, 2
    ne $S10, "??", rx991_fail
    add rx991_pos, 2
.annotate "line", 471
  # rx subrule "ws" subtype=method negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."ws"()
    unless $P10, rx991_fail
    rx991_pos = $P10."pos"()
.annotate "line", 472
  # rx subrule "EXPR" subtype=capture negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."EXPR"("i=")
    unless $P10, rx991_fail
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx991_pos = $P10."pos"()
.annotate "line", 473
  # rx literal  "!!"
    add $I11, rx991_pos, 2
    gt $I11, rx991_eos, rx991_fail
    sub $I11, rx991_pos, rx991_off
    substr $S10, rx991_tgt, $I11, 2
    ne $S10, "!!", rx991_fail
    add rx991_pos, 2
.annotate "line", 474
  # rx subrule "O" subtype=capture negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx991_fail
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx991_pos = $P10."pos"()
.annotate "line", 469
  # rx pass
    rx991_cur."!cursor_pass"(rx991_pos, "infix:sym<?? !!>")
    rx991_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx991_pos)
    .return (rx991_cur)
  rx991_fail:
.annotate "line", 381
    (rx991_rep, rx991_pos, $I10, $P10) = rx991_cur."!mark_fail"(0)
    lt rx991_pos, -1, rx991_done
    eq rx991_pos, -1, rx991_fail
    jump $I10
  rx991_done:
    rx991_cur."!cursor_fail"()
    rx991_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx991_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("286_1258897739.74728") :method
.annotate "line", 381
    $P993 = self."!PREFIX__!subrule"("", "??")
    new $P994, "ResizablePMCArray"
    push $P994, $P993
    .return ($P994)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("287_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx996_tgt
    .local int rx996_pos
    .local int rx996_off
    .local int rx996_eos
    .local int rx996_rep
    .local pmc rx996_cur
    (rx996_cur, rx996_pos, rx996_tgt, $I10) = self."!cursor_start"()
    rx996_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx996_cur
    .local pmc match
    .lex "$/", match
    length rx996_eos, rx996_tgt
    set rx996_off, 0
    lt $I10, 2, rx996_start
    sub rx996_off, $I10, 1
    substr rx996_tgt, rx996_tgt, rx996_off
  rx996_start:
.annotate "line", 478
  # rx subcapture "sym"
    set_addr $I10, rxcap_1000_fail
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  # rx literal  "="
    add $I11, rx996_pos, 1
    gt $I11, rx996_eos, rx996_fail
    sub $I11, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I11, 1
    ne $S10, "=", rx996_fail
    add rx996_pos, 1
    set_addr $I10, rxcap_1000_fail
    ($I12, $I11) = rx996_cur."!mark_peek"($I10)
    rx996_cur."!cursor_pos"($I11)
    ($P10) = rx996_cur."!cursor_start"()
    $P10."!cursor_pass"(rx996_pos, "")
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1000_done
  rxcap_1000_fail:
    goto rx996_fail
  rxcap_1000_done:
  # rx subrule "panic" subtype=method negate=
    rx996_cur."!cursor_pos"(rx996_pos)
    $P10 = rx996_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx996_fail
    rx996_pos = $P10."pos"()
.annotate "line", 477
  # rx pass
    rx996_cur."!cursor_pass"(rx996_pos, "infix:sym<=>")
    rx996_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx996_pos)
    .return (rx996_cur)
  rx996_fail:
.annotate "line", 381
    (rx996_rep, rx996_pos, $I10, $P10) = rx996_cur."!mark_fail"(0)
    lt rx996_pos, -1, rx996_done
    eq rx996_pos, -1, rx996_fail
    jump $I10
  rx996_done:
    rx996_cur."!cursor_fail"()
    rx996_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx996_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("288_1258897739.74728") :method
.annotate "line", 381
    $P998 = self."!PREFIX__!subrule"("", "=")
    new $P999, "ResizablePMCArray"
    push $P999, $P998
    .return ($P999)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("289_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx1002_tgt
    .local int rx1002_pos
    .local int rx1002_off
    .local int rx1002_eos
    .local int rx1002_rep
    .local pmc rx1002_cur
    (rx1002_cur, rx1002_pos, rx1002_tgt, $I10) = self."!cursor_start"()
    rx1002_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1002_cur
    .local pmc match
    .lex "$/", match
    length rx1002_eos, rx1002_tgt
    set rx1002_off, 0
    lt $I10, 2, rx1002_start
    sub rx1002_off, $I10, 1
    substr rx1002_tgt, rx1002_tgt, rx1002_off
  rx1002_start:
.annotate "line", 480
  # rx subcapture "sym"
    set_addr $I10, rxcap_1006_fail
    rx1002_cur."!mark_push"(0, rx1002_pos, $I10)
  # rx literal  ":="
    add $I11, rx1002_pos, 2
    gt $I11, rx1002_eos, rx1002_fail
    sub $I11, rx1002_pos, rx1002_off
    substr $S10, rx1002_tgt, $I11, 2
    ne $S10, ":=", rx1002_fail
    add rx1002_pos, 2
    set_addr $I10, rxcap_1006_fail
    ($I12, $I11) = rx1002_cur."!mark_peek"($I10)
    rx1002_cur."!cursor_pos"($I11)
    ($P10) = rx1002_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1002_pos, "")
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1006_done
  rxcap_1006_fail:
    goto rx1002_fail
  rxcap_1006_done:
  # rx subrule "O" subtype=capture negate=
    rx1002_cur."!cursor_pos"(rx1002_pos)
    $P10 = rx1002_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1002_fail
    rx1002_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1002_pos = $P10."pos"()
  # rx pass
    rx1002_cur."!cursor_pass"(rx1002_pos, "infix:sym<:=>")
    rx1002_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1002_pos)
    .return (rx1002_cur)
  rx1002_fail:
.annotate "line", 381
    (rx1002_rep, rx1002_pos, $I10, $P10) = rx1002_cur."!mark_fail"(0)
    lt rx1002_pos, -1, rx1002_done
    eq rx1002_pos, -1, rx1002_fail
    jump $I10
  rx1002_done:
    rx1002_cur."!cursor_fail"()
    rx1002_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1002_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("290_1258897739.74728") :method
.annotate "line", 381
    $P1004 = self."!PREFIX__!subrule"("O", ":=")
    new $P1005, "ResizablePMCArray"
    push $P1005, $P1004
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("291_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt, $I10) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1008_cur
    .local pmc match
    .lex "$/", match
    length rx1008_eos, rx1008_tgt
    set rx1008_off, 0
    lt $I10, 2, rx1008_start
    sub rx1008_off, $I10, 1
    substr rx1008_tgt, rx1008_tgt, rx1008_off
  rx1008_start:
.annotate "line", 481
  # rx subcapture "sym"
    set_addr $I10, rxcap_1012_fail
    rx1008_cur."!mark_push"(0, rx1008_pos, $I10)
  # rx literal  "::="
    add $I11, rx1008_pos, 3
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 3
    ne $S10, "::=", rx1008_fail
    add rx1008_pos, 3
    set_addr $I10, rxcap_1012_fail
    ($I12, $I11) = rx1008_cur."!mark_peek"($I10)
    rx1008_cur."!cursor_pos"($I11)
    ($P10) = rx1008_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1008_pos, "")
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1012_done
  rxcap_1012_fail:
    goto rx1008_fail
  rxcap_1012_done:
  # rx subrule "O" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1008_pos = $P10."pos"()
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "infix:sym<::=>")
    rx1008_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate "line", 381
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("292_1258897739.74728") :method
.annotate "line", 381
    $P1010 = self."!PREFIX__!subrule"("O", "::=")
    new $P1011, "ResizablePMCArray"
    push $P1011, $P1010
    .return ($P1011)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("293_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx1014_tgt
    .local int rx1014_pos
    .local int rx1014_off
    .local int rx1014_eos
    .local int rx1014_rep
    .local pmc rx1014_cur
    (rx1014_cur, rx1014_pos, rx1014_tgt, $I10) = self."!cursor_start"()
    rx1014_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1014_cur
    .local pmc match
    .lex "$/", match
    length rx1014_eos, rx1014_tgt
    set rx1014_off, 0
    lt $I10, 2, rx1014_start
    sub rx1014_off, $I10, 1
    substr rx1014_tgt, rx1014_tgt, rx1014_off
  rx1014_start:
.annotate "line", 483
  # rx subcapture "sym"
    set_addr $I10, rxcap_1018_fail
    rx1014_cur."!mark_push"(0, rx1014_pos, $I10)
  # rx literal  ","
    add $I11, rx1014_pos, 1
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 1
    ne $S10, ",", rx1014_fail
    add rx1014_pos, 1
    set_addr $I10, rxcap_1018_fail
    ($I12, $I11) = rx1014_cur."!mark_peek"($I10)
    rx1014_cur."!cursor_pos"($I11)
    ($P10) = rx1014_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1014_pos, "")
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1018_done
  rxcap_1018_fail:
    goto rx1014_fail
  rxcap_1018_done:
  # rx subrule "O" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1014_pos = $P10."pos"()
  # rx pass
    rx1014_cur."!cursor_pass"(rx1014_pos, "infix:sym<,>")
    rx1014_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1014_pos)
    .return (rx1014_cur)
  rx1014_fail:
.annotate "line", 381
    (rx1014_rep, rx1014_pos, $I10, $P10) = rx1014_cur."!mark_fail"(0)
    lt rx1014_pos, -1, rx1014_done
    eq rx1014_pos, -1, rx1014_fail
    jump $I10
  rx1014_done:
    rx1014_cur."!cursor_fail"()
    rx1014_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1014_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("294_1258897739.74728") :method
.annotate "line", 381
    $P1016 = self."!PREFIX__!subrule"("O", ",")
    new $P1017, "ResizablePMCArray"
    push $P1017, $P1016
    .return ($P1017)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("295_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt, $I10) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1020_cur
    .local pmc match
    .lex "$/", match
    length rx1020_eos, rx1020_tgt
    set rx1020_off, 0
    lt $I10, 2, rx1020_start
    sub rx1020_off, $I10, 1
    substr rx1020_tgt, rx1020_tgt, rx1020_off
  rx1020_start:
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1023_fail
    rx1020_cur."!mark_push"(0, rx1020_pos, $I10)
  # rx literal  "return"
    add $I11, rx1020_pos, 6
    gt $I11, rx1020_eos, rx1020_fail
    sub $I11, rx1020_pos, rx1020_off
    substr $S10, rx1020_tgt, $I11, 6
    ne $S10, "return", rx1020_fail
    add rx1020_pos, 6
    set_addr $I10, rxcap_1023_fail
    ($I12, $I11) = rx1020_cur."!mark_peek"($I10)
    rx1020_cur."!cursor_pos"($I11)
    ($P10) = rx1020_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1020_pos, "")
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1023_done
  rxcap_1023_fail:
    goto rx1020_fail
  rxcap_1023_done:
  # rx charclass s
    ge rx1020_pos, rx1020_eos, rx1020_fail
    sub $I10, rx1020_pos, rx1020_off
    is_cclass $I11, 32, rx1020_tgt, $I10
    unless $I11, rx1020_fail
    inc rx1020_pos
  # rx subrule "O" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1020_pos = $P10."pos"()
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "prefix:sym<return>")
    rx1020_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
.annotate "line", 381
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("296_1258897739.74728") :method
.annotate "line", 381
    new $P1022, "ResizablePMCArray"
    push $P1022, "return"
    .return ($P1022)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("297_1258897739.74728") :method :outer("11_1258897739.74728")
.annotate "line", 381
    .local string rx1025_tgt
    .local int rx1025_pos
    .local int rx1025_off
    .local int rx1025_eos
    .local int rx1025_rep
    .local pmc rx1025_cur
    (rx1025_cur, rx1025_pos, rx1025_tgt, $I10) = self."!cursor_start"()
    rx1025_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1025_cur
    .local pmc match
    .lex "$/", match
    length rx1025_eos, rx1025_tgt
    set rx1025_off, 0
    lt $I10, 2, rx1025_start
    sub rx1025_off, $I10, 1
    substr rx1025_tgt, rx1025_tgt, rx1025_off
  rx1025_start:
.annotate "line", 486
  # rx subcapture "sym"
    set_addr $I10, rxcap_1028_fail
    rx1025_cur."!mark_push"(0, rx1025_pos, $I10)
  # rx literal  "make"
    add $I11, rx1025_pos, 4
    gt $I11, rx1025_eos, rx1025_fail
    sub $I11, rx1025_pos, rx1025_off
    substr $S10, rx1025_tgt, $I11, 4
    ne $S10, "make", rx1025_fail
    add rx1025_pos, 4
    set_addr $I10, rxcap_1028_fail
    ($I12, $I11) = rx1025_cur."!mark_peek"($I10)
    rx1025_cur."!cursor_pos"($I11)
    ($P10) = rx1025_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1025_pos, "")
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1028_done
  rxcap_1028_fail:
    goto rx1025_fail
  rxcap_1028_done:
  # rx charclass s
    ge rx1025_pos, rx1025_eos, rx1025_fail
    sub $I10, rx1025_pos, rx1025_off
    is_cclass $I11, 32, rx1025_tgt, $I10
    unless $I11, rx1025_fail
    inc rx1025_pos
  # rx subrule "O" subtype=capture negate=
    rx1025_cur."!cursor_pos"(rx1025_pos)
    $P10 = rx1025_cur."O"("%list_prefix")
    unless $P10, rx1025_fail
    rx1025_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1025_pos = $P10."pos"()
  # rx pass
    rx1025_cur."!cursor_pass"(rx1025_pos, "prefix:sym<make>")
    rx1025_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1025_pos)
    .return (rx1025_cur)
  rx1025_fail:
.annotate "line", 381
    (rx1025_rep, rx1025_pos, $I10, $P10) = rx1025_cur."!mark_fail"(0)
    lt rx1025_pos, -1, rx1025_done
    eq rx1025_pos, -1, rx1025_fail
    jump $I10
  rx1025_done:
    rx1025_cur."!cursor_fail"()
    rx1025_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1025_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("298_1258897739.74728") :method
.annotate "line", 381
    new $P1027, "ResizablePMCArray"
    push $P1027, "make"
    .return ($P1027)
.end


.namespace ["NQP";"Regex"]
.sub "_block1029"  :subid("299_1258897739.74728") :outer("11_1258897739.74728")
.annotate "line", 489
    .const 'Sub' $P1059 = "310_1258897739.74728" 
    capture_lex $P1059
    .const 'Sub' $P1047 = "307_1258897739.74728" 
    capture_lex $P1047
    .const 'Sub' $P1043 = "305_1258897739.74728" 
    capture_lex $P1043
    .const 'Sub' $P1039 = "303_1258897739.74728" 
    capture_lex $P1039
    .const 'Sub' $P1031 = "300_1258897739.74728" 
    capture_lex $P1031
    .const 'Sub' $P1059 = "310_1258897739.74728" 
    capture_lex $P1059
    .return ($P1059)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("300_1258897739.74728") :method :outer("299_1258897739.74728")
.annotate "line", 489
    .const 'Sub' $P1036 = "302_1258897739.74728" 
    capture_lex $P1036
    .local string rx1032_tgt
    .local int rx1032_pos
    .local int rx1032_off
    .local int rx1032_eos
    .local int rx1032_rep
    .local pmc rx1032_cur
    (rx1032_cur, rx1032_pos, rx1032_tgt, $I10) = self."!cursor_start"()
    rx1032_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1032_cur
    .local pmc match
    .lex "$/", match
    length rx1032_eos, rx1032_tgt
    set rx1032_off, 0
    lt $I10, 2, rx1032_start
    sub rx1032_off, $I10, 1
    substr rx1032_tgt, rx1032_tgt, rx1032_off
  rx1032_start:
.annotate "line", 491
  # rx literal  ":"
    add $I11, rx1032_pos, 1
    gt $I11, rx1032_eos, rx1032_fail
    sub $I11, rx1032_pos, rx1032_off
    substr $S10, rx1032_tgt, $I11, 1
    ne $S10, ":", rx1032_fail
    add rx1032_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1032_cur."!cursor_pos"(rx1032_pos)
    .const 'Sub' $P1036 = "302_1258897739.74728" 
    capture_lex $P1036
    $P10 = rx1032_cur."before"($P1036)
    unless $P10, rx1032_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1032_cur."!cursor_pos"(rx1032_pos)
    $P10 = rx1032_cur."LANG"("MAIN", "statement")
    unless $P10, rx1032_fail
    rx1032_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1032_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1032_cur."!cursor_pos"(rx1032_pos)
    $P10 = rx1032_cur."ws"()
    unless $P10, rx1032_fail
    rx1032_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1032_pos, 1
    gt $I11, rx1032_eos, rx1032_fail
    sub $I11, rx1032_pos, rx1032_off
    substr $S10, rx1032_tgt, $I11, 1
    ne $S10, ";", rx1032_fail
    add rx1032_pos, 1
.annotate "line", 490
  # rx pass
    rx1032_cur."!cursor_pass"(rx1032_pos, "metachar:sym<:my>")
    rx1032_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1032_pos)
    .return (rx1032_cur)
  rx1032_fail:
.annotate "line", 489
    (rx1032_rep, rx1032_pos, $I10, $P10) = rx1032_cur."!mark_fail"(0)
    lt rx1032_pos, -1, rx1032_done
    eq rx1032_pos, -1, rx1032_fail
    jump $I10
  rx1032_done:
    rx1032_cur."!cursor_fail"()
    rx1032_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1032_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("301_1258897739.74728") :method
.annotate "line", 489
    new $P1034, "ResizablePMCArray"
    push $P1034, ":"
    .return ($P1034)
.end


.namespace ["NQP";"Regex"]
.sub "_block1035"  :anon :subid("302_1258897739.74728") :method :outer("300_1258897739.74728")
.annotate "line", 491
    .local string rx1037_tgt
    .local int rx1037_pos
    .local int rx1037_off
    .local int rx1037_eos
    .local int rx1037_rep
    .local pmc rx1037_cur
    (rx1037_cur, rx1037_pos, rx1037_tgt, $I10) = self."!cursor_start"()
    rx1037_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1037_cur
    .local pmc match
    .lex "$/", match
    length rx1037_eos, rx1037_tgt
    set rx1037_off, 0
    lt $I10, 2, rx1037_start
    sub rx1037_off, $I10, 1
    substr rx1037_tgt, rx1037_tgt, rx1037_off
  rx1037_start:
    ge rx1037_pos, 0, rxscan1038_done
  rxscan1038_loop:
    ($P10) = rx1037_cur."from"()
    inc $P10
    set rx1037_pos, $P10
    ge rx1037_pos, rx1037_eos, rxscan1038_done
    set_addr $I10, rxscan1038_loop
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  rxscan1038_done:
  # rx literal  "my"
    add $I11, rx1037_pos, 2
    gt $I11, rx1037_eos, rx1037_fail
    sub $I11, rx1037_pos, rx1037_off
    substr $S10, rx1037_tgt, $I11, 2
    ne $S10, "my", rx1037_fail
    add rx1037_pos, 2
  # rx pass
    rx1037_cur."!cursor_pass"(rx1037_pos, "")
    rx1037_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1037_pos)
    .return (rx1037_cur)
  rx1037_fail:
    (rx1037_rep, rx1037_pos, $I10, $P10) = rx1037_cur."!mark_fail"(0)
    lt rx1037_pos, -1, rx1037_done
    eq rx1037_pos, -1, rx1037_fail
    jump $I10
  rx1037_done:
    rx1037_cur."!cursor_fail"()
    rx1037_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1037_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("303_1258897739.74728") :method :outer("299_1258897739.74728")
.annotate "line", 489
    .local string rx1040_tgt
    .local int rx1040_pos
    .local int rx1040_off
    .local int rx1040_eos
    .local int rx1040_rep
    .local pmc rx1040_cur
    (rx1040_cur, rx1040_pos, rx1040_tgt, $I10) = self."!cursor_start"()
    rx1040_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1040_cur
    .local pmc match
    .lex "$/", match
    length rx1040_eos, rx1040_tgt
    set rx1040_off, 0
    lt $I10, 2, rx1040_start
    sub rx1040_off, $I10, 1
    substr rx1040_tgt, rx1040_tgt, rx1040_off
  rx1040_start:
.annotate "line", 495
  # rx enumcharlist negate=0 zerowidth
    ge rx1040_pos, rx1040_eos, rx1040_fail
    sub $I10, rx1040_pos, rx1040_off
    substr $S10, rx1040_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1040_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1040_cur."!cursor_pos"(rx1040_pos)
    $P10 = rx1040_cur."codeblock"()
    unless $P10, rx1040_fail
    rx1040_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1040_pos = $P10."pos"()
.annotate "line", 494
  # rx pass
    rx1040_cur."!cursor_pass"(rx1040_pos, "metachar:sym<{ }>")
    rx1040_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1040_pos)
    .return (rx1040_cur)
  rx1040_fail:
.annotate "line", 489
    (rx1040_rep, rx1040_pos, $I10, $P10) = rx1040_cur."!mark_fail"(0)
    lt rx1040_pos, -1, rx1040_done
    eq rx1040_pos, -1, rx1040_fail
    jump $I10
  rx1040_done:
    rx1040_cur."!cursor_fail"()
    rx1040_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1040_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("304_1258897739.74728") :method
.annotate "line", 489
    new $P1042, "ResizablePMCArray"
    push $P1042, "{"
    .return ($P1042)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("305_1258897739.74728") :method :outer("299_1258897739.74728")
.annotate "line", 489
    .local string rx1044_tgt
    .local int rx1044_pos
    .local int rx1044_off
    .local int rx1044_eos
    .local int rx1044_rep
    .local pmc rx1044_cur
    (rx1044_cur, rx1044_pos, rx1044_tgt, $I10) = self."!cursor_start"()
    rx1044_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1044_cur
    .local pmc match
    .lex "$/", match
    length rx1044_eos, rx1044_tgt
    set rx1044_off, 0
    lt $I10, 2, rx1044_start
    sub rx1044_off, $I10, 1
    substr rx1044_tgt, rx1044_tgt, rx1044_off
  rx1044_start:
.annotate "line", 499
  # rx enumcharlist negate=0 zerowidth
    ge rx1044_pos, rx1044_eos, rx1044_fail
    sub $I10, rx1044_pos, rx1044_off
    substr $S10, rx1044_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1044_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1044_cur."!cursor_pos"(rx1044_pos)
    $P10 = rx1044_cur."codeblock"()
    unless $P10, rx1044_fail
    rx1044_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1044_pos = $P10."pos"()
.annotate "line", 498
  # rx pass
    rx1044_cur."!cursor_pass"(rx1044_pos, "assertion:sym<{ }>")
    rx1044_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1044_pos)
    .return (rx1044_cur)
  rx1044_fail:
.annotate "line", 489
    (rx1044_rep, rx1044_pos, $I10, $P10) = rx1044_cur."!mark_fail"(0)
    lt rx1044_pos, -1, rx1044_done
    eq rx1044_pos, -1, rx1044_fail
    jump $I10
  rx1044_done:
    rx1044_cur."!cursor_fail"()
    rx1044_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1044_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("306_1258897739.74728") :method
.annotate "line", 489
    new $P1046, "ResizablePMCArray"
    push $P1046, "{"
    .return ($P1046)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("307_1258897739.74728") :method :outer("299_1258897739.74728")
.annotate "line", 489
    .const 'Sub' $P1055 = "309_1258897739.74728" 
    capture_lex $P1055
    .local string rx1048_tgt
    .local int rx1048_pos
    .local int rx1048_off
    .local int rx1048_eos
    .local int rx1048_rep
    .local pmc rx1048_cur
    (rx1048_cur, rx1048_pos, rx1048_tgt, $I10) = self."!cursor_start"()
    rx1048_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1048_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx1048_cur
    .local pmc match
    .lex "$/", match
    length rx1048_eos, rx1048_tgt
    set rx1048_off, 0
    lt $I10, 2, rx1048_start
    sub rx1048_off, $I10, 1
    substr rx1048_tgt, rx1048_tgt, rx1048_off
  rx1048_start:
.annotate "line", 503
  # rx subcapture "longname"
    set_addr $I10, rxcap_1051_fail
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1048_pos, rx1048_off
    find_not_cclass $I11, 8192, rx1048_tgt, $I10, rx1048_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1048_fail
    add rx1048_pos, rx1048_off, $I11
    set_addr $I10, rxcap_1051_fail
    ($I12, $I11) = rx1048_cur."!mark_peek"($I10)
    rx1048_cur."!cursor_pos"($I11)
    ($P10) = rx1048_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1048_pos, "")
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1051_done
  rxcap_1051_fail:
    goto rx1048_fail
  rxcap_1051_done:
.annotate "line", 510
  # rx rxquantr1052 ** 0..1
    set_addr $I1058, rxquantr1052_done
    rx1048_cur."!mark_push"(0, rx1048_pos, $I1058)
  rxquantr1052_loop:
  alt1053_0:
.annotate "line", 504
    set_addr $I10, alt1053_1
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
.annotate "line", 505
  # rx subrule "before" subtype=zerowidth negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    .const 'Sub' $P1055 = "309_1258897739.74728" 
    capture_lex $P1055
    $P10 = rx1048_cur."before"($P1055)
    unless $P10, rx1048_fail
    goto alt1053_end
  alt1053_1:
    set_addr $I10, alt1053_2
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
.annotate "line", 506
  # rx literal  "="
    add $I11, rx1048_pos, 1
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 1
    ne $S10, "=", rx1048_fail
    add rx1048_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."assertion"()
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1048_pos = $P10."pos"()
    goto alt1053_end
  alt1053_2:
    set_addr $I10, alt1053_3
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
.annotate "line", 507
  # rx literal  ":"
    add $I11, rx1048_pos, 1
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 1
    ne $S10, ":", rx1048_fail
    add rx1048_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."arglist"()
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1048_pos = $P10."pos"()
    goto alt1053_end
  alt1053_3:
    set_addr $I10, alt1053_4
    rx1048_cur."!mark_push"(0, rx1048_pos, $I10)
.annotate "line", 508
  # rx literal  "("
    add $I11, rx1048_pos, 1
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 1
    ne $S10, "(", rx1048_fail
    add rx1048_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1048_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1048_pos, 1
    gt $I11, rx1048_eos, rx1048_fail
    sub $I11, rx1048_pos, rx1048_off
    substr $S10, rx1048_tgt, $I11, 1
    ne $S10, ")", rx1048_fail
    add rx1048_pos, 1
    goto alt1053_end
  alt1053_4:
.annotate "line", 509
  # rx subrule "normspace" subtype=method negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."normspace"()
    unless $P10, rx1048_fail
    rx1048_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1048_cur."!cursor_pos"(rx1048_pos)
    $P10 = rx1048_cur."nibbler"()
    unless $P10, rx1048_fail
    rx1048_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1048_pos = $P10."pos"()
  alt1053_end:
.annotate "line", 510
    (rx1048_rep) = rx1048_cur."!mark_commit"($I1058)
  rxquantr1052_done:
.annotate "line", 502
  # rx pass
    rx1048_cur."!cursor_pass"(rx1048_pos, "assertion:sym<name>")
    rx1048_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1048_pos)
    .return (rx1048_cur)
  rx1048_fail:
.annotate "line", 489
    (rx1048_rep, rx1048_pos, $I10, $P10) = rx1048_cur."!mark_fail"(0)
    lt rx1048_pos, -1, rx1048_done
    eq rx1048_pos, -1, rx1048_fail
    jump $I10
  rx1048_done:
    rx1048_cur."!cursor_fail"()
    rx1048_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1048_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("308_1258897739.74728") :method
.annotate "line", 489
    new $P1050, "ResizablePMCArray"
    push $P1050, ""
    .return ($P1050)
.end


.namespace ["NQP";"Regex"]
.sub "_block1054"  :anon :subid("309_1258897739.74728") :method :outer("307_1258897739.74728")
.annotate "line", 505
    .local string rx1056_tgt
    .local int rx1056_pos
    .local int rx1056_off
    .local int rx1056_eos
    .local int rx1056_rep
    .local pmc rx1056_cur
    (rx1056_cur, rx1056_pos, rx1056_tgt, $I10) = self."!cursor_start"()
    rx1056_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1056_cur
    .local pmc match
    .lex "$/", match
    length rx1056_eos, rx1056_tgt
    set rx1056_off, 0
    lt $I10, 2, rx1056_start
    sub rx1056_off, $I10, 1
    substr rx1056_tgt, rx1056_tgt, rx1056_off
  rx1056_start:
    ge rx1056_pos, 0, rxscan1057_done
  rxscan1057_loop:
    ($P10) = rx1056_cur."from"()
    inc $P10
    set rx1056_pos, $P10
    ge rx1056_pos, rx1056_eos, rxscan1057_done
    set_addr $I10, rxscan1057_loop
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  rxscan1057_done:
  # rx literal  ">"
    add $I11, rx1056_pos, 1
    gt $I11, rx1056_eos, rx1056_fail
    sub $I11, rx1056_pos, rx1056_off
    substr $S10, rx1056_tgt, $I11, 1
    ne $S10, ">", rx1056_fail
    add rx1056_pos, 1
  # rx pass
    rx1056_cur."!cursor_pass"(rx1056_pos, "")
    rx1056_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1056_pos)
    .return (rx1056_cur)
  rx1056_fail:
    (rx1056_rep, rx1056_pos, $I10, $P10) = rx1056_cur."!mark_fail"(0)
    lt rx1056_pos, -1, rx1056_done
    eq rx1056_pos, -1, rx1056_fail
    jump $I10
  rx1056_done:
    rx1056_cur."!cursor_fail"()
    rx1056_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1056_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("310_1258897739.74728") :method :outer("299_1258897739.74728")
.annotate "line", 489
    .local string rx1060_tgt
    .local int rx1060_pos
    .local int rx1060_off
    .local int rx1060_eos
    .local int rx1060_rep
    .local pmc rx1060_cur
    (rx1060_cur, rx1060_pos, rx1060_tgt, $I10) = self."!cursor_start"()
    rx1060_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1060_cur
    .local pmc match
    .lex "$/", match
    length rx1060_eos, rx1060_tgt
    set rx1060_off, 0
    lt $I10, 2, rx1060_start
    sub rx1060_off, $I10, 1
    substr rx1060_tgt, rx1060_tgt, rx1060_off
  rx1060_start:
.annotate "line", 515
  # rx subrule "LANG" subtype=capture negate=
    rx1060_cur."!cursor_pos"(rx1060_pos)
    $P10 = rx1060_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1060_fail
    rx1060_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1060_pos = $P10."pos"()
.annotate "line", 514
  # rx pass
    rx1060_cur."!cursor_pass"(rx1060_pos, "codeblock")
    rx1060_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1060_pos)
    .return (rx1060_cur)
  rx1060_fail:
.annotate "line", 489
    (rx1060_rep, rx1060_pos, $I10, $P10) = rx1060_cur."!mark_fail"(0)
    lt rx1060_pos, -1, rx1060_done
    eq rx1060_pos, -1, rx1060_fail
    jump $I10
  rx1060_done:
    rx1060_cur."!cursor_fail"()
    rx1060_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1060_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("311_1258897739.74728") :method
.annotate "line", 489
    $P1062 = self."!PREFIX__!subrule"("block", "")
    new $P1063, "ResizablePMCArray"
    push $P1063, $P1062
    .return ($P1063)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258897750.20545")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1926 = $P14()
.annotate "line", 1
    .return ($P1926)
.end


.namespace []
.sub "" :load :init :subid("post115") :outer("10_1258897750.20545")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258897750.20545" 
    .local pmc block
    set block, $P12
    $P1927 = get_root_global ["parrot"], "P6metaclass"
    $P1927."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258897750.20545") :outer("10_1258897750.20545")
.annotate "line", 3
    .const 'Sub' $P1922 = "114_1258897750.20545" 
    capture_lex $P1922
    get_hll_global $P1858, ["NQP";"RegexActions"], "_block1857" 
    capture_lex $P1858
    .const 'Sub' $P1845 = "108_1258897750.20545" 
    capture_lex $P1845
    .const 'Sub' $P1835 = "107_1258897750.20545" 
    capture_lex $P1835
    .const 'Sub' $P1825 = "106_1258897750.20545" 
    capture_lex $P1825
    .const 'Sub' $P1815 = "105_1258897750.20545" 
    capture_lex $P1815
    .const 'Sub' $P1801 = "104_1258897750.20545" 
    capture_lex $P1801
    .const 'Sub' $P1791 = "103_1258897750.20545" 
    capture_lex $P1791
    .const 'Sub' $P1777 = "102_1258897750.20545" 
    capture_lex $P1777
    .const 'Sub' $P1767 = "101_1258897750.20545" 
    capture_lex $P1767
    .const 'Sub' $P1757 = "100_1258897750.20545" 
    capture_lex $P1757
    .const 'Sub' $P1747 = "99_1258897750.20545" 
    capture_lex $P1747
    .const 'Sub' $P1737 = "98_1258897750.20545" 
    capture_lex $P1737
    .const 'Sub' $P1727 = "97_1258897750.20545" 
    capture_lex $P1727
    .const 'Sub' $P1699 = "96_1258897750.20545" 
    capture_lex $P1699
    .const 'Sub' $P1689 = "95_1258897750.20545" 
    capture_lex $P1689
    .const 'Sub' $P1677 = "94_1258897750.20545" 
    capture_lex $P1677
    .const 'Sub' $P1665 = "93_1258897750.20545" 
    capture_lex $P1665
    .const 'Sub' $P1653 = "92_1258897750.20545" 
    capture_lex $P1653
    .const 'Sub' $P1643 = "91_1258897750.20545" 
    capture_lex $P1643
    .const 'Sub' $P1614 = "90_1258897750.20545" 
    capture_lex $P1614
    .const 'Sub' $P1590 = "89_1258897750.20545" 
    capture_lex $P1590
    .const 'Sub' $P1580 = "88_1258897750.20545" 
    capture_lex $P1580
    .const 'Sub' $P1553 = "87_1258897750.20545" 
    capture_lex $P1553
    .const 'Sub' $P1535 = "86_1258897750.20545" 
    capture_lex $P1535
    .const 'Sub' $P1525 = "85_1258897750.20545" 
    capture_lex $P1525
    .const 'Sub' $P1441 = "82_1258897750.20545" 
    capture_lex $P1441
    .const 'Sub' $P1431 = "81_1258897750.20545" 
    capture_lex $P1431
    .const 'Sub' $P1402 = "80_1258897750.20545" 
    capture_lex $P1402
    .const 'Sub' $P1360 = "79_1258897750.20545" 
    capture_lex $P1360
    .const 'Sub' $P1344 = "78_1258897750.20545" 
    capture_lex $P1344
    .const 'Sub' $P1335 = "77_1258897750.20545" 
    capture_lex $P1335
    .const 'Sub' $P1303 = "76_1258897750.20545" 
    capture_lex $P1303
    .const 'Sub' $P1199 = "73_1258897750.20545" 
    capture_lex $P1199
    .const 'Sub' $P1182 = "72_1258897750.20545" 
    capture_lex $P1182
    .const 'Sub' $P1162 = "71_1258897750.20545" 
    capture_lex $P1162
    .const 'Sub' $P1078 = "70_1258897750.20545" 
    capture_lex $P1078
    .const 'Sub' $P1054 = "68_1258897750.20545" 
    capture_lex $P1054
    .const 'Sub' $P1020 = "66_1258897750.20545" 
    capture_lex $P1020
    .const 'Sub' $P974 = "64_1258897750.20545" 
    capture_lex $P974
    .const 'Sub' $P964 = "63_1258897750.20545" 
    capture_lex $P964
    .const 'Sub' $P954 = "62_1258897750.20545" 
    capture_lex $P954
    .const 'Sub' $P883 = "60_1258897750.20545" 
    capture_lex $P883
    .const 'Sub' $P866 = "59_1258897750.20545" 
    capture_lex $P866
    .const 'Sub' $P856 = "58_1258897750.20545" 
    capture_lex $P856
    .const 'Sub' $P846 = "57_1258897750.20545" 
    capture_lex $P846
    .const 'Sub' $P836 = "56_1258897750.20545" 
    capture_lex $P836
    .const 'Sub' $P812 = "55_1258897750.20545" 
    capture_lex $P812
    .const 'Sub' $P759 = "54_1258897750.20545" 
    capture_lex $P759
    .const 'Sub' $P749 = "53_1258897750.20545" 
    capture_lex $P749
    .const 'Sub' $P660 = "51_1258897750.20545" 
    capture_lex $P660
    .const 'Sub' $P634 = "50_1258897750.20545" 
    capture_lex $P634
    .const 'Sub' $P624 = "49_1258897750.20545" 
    capture_lex $P624
    .const 'Sub' $P614 = "48_1258897750.20545" 
    capture_lex $P614
    .const 'Sub' $P604 = "47_1258897750.20545" 
    capture_lex $P604
    .const 'Sub' $P594 = "46_1258897750.20545" 
    capture_lex $P594
    .const 'Sub' $P584 = "45_1258897750.20545" 
    capture_lex $P584
    .const 'Sub' $P574 = "44_1258897750.20545" 
    capture_lex $P574
    .const 'Sub' $P564 = "43_1258897750.20545" 
    capture_lex $P564
    .const 'Sub' $P554 = "42_1258897750.20545" 
    capture_lex $P554
    .const 'Sub' $P544 = "41_1258897750.20545" 
    capture_lex $P544
    .const 'Sub' $P534 = "40_1258897750.20545" 
    capture_lex $P534
    .const 'Sub' $P524 = "39_1258897750.20545" 
    capture_lex $P524
    .const 'Sub' $P514 = "38_1258897750.20545" 
    capture_lex $P514
    .const 'Sub' $P496 = "37_1258897750.20545" 
    capture_lex $P496
    .const 'Sub' $P480 = "36_1258897750.20545" 
    capture_lex $P480
    .const 'Sub' $P467 = "35_1258897750.20545" 
    capture_lex $P467
    .const 'Sub' $P441 = "34_1258897750.20545" 
    capture_lex $P441
    .const 'Sub' $P405 = "33_1258897750.20545" 
    capture_lex $P405
    .const 'Sub' $P388 = "32_1258897750.20545" 
    capture_lex $P388
    .const 'Sub' $P374 = "31_1258897750.20545" 
    capture_lex $P374
    .const 'Sub' $P319 = "29_1258897750.20545" 
    capture_lex $P319
    .const 'Sub' $P306 = "28_1258897750.20545" 
    capture_lex $P306
    .const 'Sub' $P287 = "27_1258897750.20545" 
    capture_lex $P287
    .const 'Sub' $P277 = "26_1258897750.20545" 
    capture_lex $P277
    .const 'Sub' $P267 = "25_1258897750.20545" 
    capture_lex $P267
    .const 'Sub' $P251 = "24_1258897750.20545" 
    capture_lex $P251
    .const 'Sub' $P173 = "22_1258897750.20545" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258897750.20545" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258897750.20545" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258897750.20545" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258897750.20545" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258897750.20545" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258897750.20545" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258897750.20545" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_118
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_118:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258897750.20545" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258897750.20545" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258897750.20545" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 651
    get_hll_global $P1858, ["NQP";"RegexActions"], "_block1857" 
    capture_lex $P1858
    $P1920 = $P1858()
.annotate "line", 3
    .return ($P1920)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post116") :outer("11_1258897750.20545")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1922 = "114_1258897750.20545" 
    capture_lex $P1922
    $P1922()
    $P1925 = get_root_global ["parrot"], "P6metaclass"
    $P1925."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1921"  :anon :subid("114_1258897750.20545") :outer("11_1258897750.20545")
.annotate "line", 6
    get_global $P1923, "@BLOCK"
    unless_null $P1923, vivify_117
    new $P1923, "ResizablePMCArray"
    set_global "@BLOCK", $P1923
  vivify_117:
 $P1924 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1924
.annotate "line", 5
    .return ($P1924)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258897750.20545") :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "block_immediate"  :subid("13_1258897750.20545") :outer("11_1258897750.20545")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258897750.20545" 
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
    .const 'Sub' $P35 = "14_1258897750.20545" 
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
.end


.namespace ["NQP";"Actions"]
.sub "_block34"  :anon :subid("14_1258897750.20545") :outer("13_1258897750.20545")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258897750.20545" 
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
    .const 'Sub' $P46 = "15_1258897750.20545" 
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
.sub "_block45"  :anon :subid("15_1258897750.20545") :outer("14_1258897750.20545")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258897750.20545") :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("17_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("18_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("19_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("20_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258897750.20545" 
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
    .const 'Sub' $P147 = "21_1258897750.20545" 
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
.end


.namespace ["NQP";"Actions"]
.sub "_block146"  :anon :subid("21_1258897750.20545") :outer("20_1258897750.20545")
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
.sub "statement"  :subid("22_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1258897750.20545" 
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
    .const 'Sub' $P185 = "23_1258897750.20545" 
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
.end


.namespace ["NQP";"Actions"]
.sub "_block184"  :anon :subid("23_1258897750.20545") :outer("22_1258897750.20545")
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
.sub "xblock"  :subid("24_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("25_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("26_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("27_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("28_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("29_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_322
.annotate "line", 106
    .const 'Sub' $P352 = "30_1258897750.20545" 
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
    .const 'Sub' $P352 = "30_1258897750.20545" 
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
.end


.namespace ["NQP";"Actions"]
.sub "_block351"  :anon :subid("30_1258897750.20545") :outer("29_1258897750.20545")
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
.sub "statement_control:sym<unless>"  :subid("31_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("32_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("33_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("34_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("35_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("36_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("37_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("38_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("39_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("40_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("41_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("42_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("43_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("44_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("45_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("46_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("47_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("48_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("49_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("50_1258897750.20545") :method :outer("11_1258897750.20545")
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
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("51_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_663
.annotate "line", 203
    .const 'Sub' $P676 = "52_1258897750.20545" 
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
    .const 'Sub' $P676 = "52_1258897750.20545" 
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
.annotate "line", 238
    find_lex $P745, "$/"
    find_lex $P746, "$past"
    $P747 = $P745."!make"($P746)
.annotate "line", 203
    .return ($P747)
  control_661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P748, exception, "payload"
    .return ($P748)
.end


.namespace ["NQP";"Actions"]
.sub "_block675"  :anon :subid("52_1258897750.20545") :outer("51_1258897750.20545")
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
    get_hll_global $P737, ["PAST"], "Var"
    $P738 = $P737."new"("self" :named("name"))
    $P736."push"($P738)
.annotate "line", 234
    find_lex $P739, "$past"
    $P739."scope"("attribute")
.annotate "line", 235
    find_lex $P740, "$past"
    find_lex $P741, "$/"
    unless_null $P741, vivify_273
    new $P741, "Hash"
  vivify_273:
    set $P742, $P741["sigil"]
    unless_null $P742, vivify_274
    new $P742, "Undef"
  vivify_274:
    $P743 = "sigiltype"($P742)
    $P744 = $P740."viviself"($P743)
.annotate "line", 232
    set $P729, $P744
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
.sub "package_declarator:sym<module>"  :subid("53_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_752
.annotate "line", 241
    new $P751, 'ExceptionHandler'
    set_addr $P751, control_750
    $P751."handle_types"(58)
    push_eh $P751
    .lex "self", self
    .lex "$/", param_752
    find_lex $P753, "$/"
    find_lex $P754, "$/"
    unless_null $P754, vivify_281
    new $P754, "Hash"
  vivify_281:
    set $P755, $P754["package_def"]
    unless_null $P755, vivify_282
    new $P755, "Undef"
  vivify_282:
    $P756 = $P755."ast"()
    $P757 = $P753."!make"($P756)
    .return ($P757)
  control_750:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P758, exception, "payload"
    .return ($P758)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("54_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_762
.annotate "line", 242
    new $P761, 'ExceptionHandler'
    set_addr $P761, control_760
    $P761."handle_types"(58)
    push_eh $P761
    .lex "self", self
    .lex "$/", param_762
.annotate "line", 243
    new $P763, "Undef"
    .lex "$past", $P763
.annotate "line", 244
    new $P764, "Undef"
    .lex "$classinit", $P764
.annotate "line", 253
    new $P765, "Undef"
    .lex "$parent", $P765
.annotate "line", 243
    find_lex $P766, "$/"
    unless_null $P766, vivify_283
    new $P766, "Hash"
  vivify_283:
    set $P767, $P766["package_def"]
    unless_null $P767, vivify_284
    new $P767, "Undef"
  vivify_284:
    $P768 = $P767."ast"()
    store_lex "$past", $P768
.annotate "line", 245
    get_hll_global $P769, ["PAST"], "Op"
.annotate "line", 246
    get_hll_global $P770, ["PAST"], "Op"
    $P771 = $P770."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 249
    find_lex $P772, "$/"
    unless_null $P772, vivify_285
    new $P772, "Hash"
  vivify_285:
    set $P773, $P772["package_def"]
    unless_null $P773, vivify_286
    new $P773, "Hash"
  vivify_286:
    set $P774, $P773["name"]
    unless_null $P774, vivify_287
    new $P774, "Undef"
  vivify_287:
    set $S775, $P774
    $P776 = $P769."new"($P771, $S775, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 245
    store_lex "$classinit", $P776
.annotate "line", 253
    find_lex $P779, "$/"
    unless_null $P779, vivify_288
    new $P779, "Hash"
  vivify_288:
    set $P780, $P779["package_def"]
    unless_null $P780, vivify_289
    new $P780, "Hash"
  vivify_289:
    set $P781, $P780["parent"]
    unless_null $P781, vivify_290
    new $P781, "ResizablePMCArray"
  vivify_290:
    set $P782, $P781[0]
    unless_null $P782, vivify_291
    new $P782, "Undef"
  vivify_291:
    set $S783, $P782
    unless $S783, unless_778
    new $P777, 'String'
    set $P777, $S783
    goto unless_778_end
  unless_778:
.annotate "line", 254
    find_lex $P786, "$/"
    unless_null $P786, vivify_292
    new $P786, "Hash"
  vivify_292:
    set $P787, $P786["sym"]
    unless_null $P787, vivify_293
    new $P787, "Undef"
  vivify_293:
    set $S788, $P787
    iseq $I789, $S788, "grammar"
    if $I789, if_785
    new $P791, "String"
    assign $P791, ""
    set $P784, $P791
    goto if_785_end
  if_785:
    new $P790, "String"
    assign $P790, "Regex::Cursor"
    set $P784, $P790
  if_785_end:
    set $P777, $P784
  unless_778_end:
    store_lex "$parent", $P777
.annotate "line", 255
    find_lex $P793, "$parent"
    unless $P793, if_792_end
.annotate "line", 256
    find_lex $P794, "$classinit"
    get_hll_global $P795, ["PAST"], "Val"
    find_lex $P796, "$parent"
    $P797 = $P795."new"($P796 :named("value"), "parent" :named("named"))
    $P794."push"($P797)
  if_792_end:
.annotate "line", 258
    find_lex $P799, "$past"
    unless_null $P799, vivify_294
    new $P799, "Hash"
  vivify_294:
    set $P800, $P799["attributes"]
    unless_null $P800, vivify_295
    new $P800, "Undef"
  vivify_295:
    unless $P800, if_798_end
.annotate "line", 259
    find_lex $P801, "$classinit"
    find_lex $P802, "$past"
    unless_null $P802, vivify_296
    new $P802, "Hash"
  vivify_296:
    set $P803, $P802["attributes"]
    unless_null $P803, vivify_297
    new $P803, "Undef"
  vivify_297:
    $P801."push"($P803)
  if_798_end:
.annotate "line", 261
    get_global $P804, "@BLOCK"
    unless_null $P804, vivify_298
    new $P804, "ResizablePMCArray"
  vivify_298:
    set $P805, $P804[0]
    unless_null $P805, vivify_299
    new $P805, "Undef"
  vivify_299:
    $P806 = $P805."loadinit"()
    find_lex $P807, "$classinit"
    $P806."push"($P807)
.annotate "line", 262
    find_lex $P808, "$/"
    find_lex $P809, "$past"
    $P810 = $P808."!make"($P809)
.annotate "line", 242
    .return ($P810)
  control_760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P811, exception, "payload"
    .return ($P811)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("55_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_815
.annotate "line", 265
    new $P814, 'ExceptionHandler'
    set_addr $P814, control_813
    $P814."handle_types"(58)
    push_eh $P814
    .lex "self", self
    .lex "$/", param_815
.annotate "line", 266
    new $P816, "Undef"
    .lex "$past", $P816
    find_lex $P819, "$/"
    unless_null $P819, vivify_300
    new $P819, "Hash"
  vivify_300:
    set $P820, $P819["block"]
    unless_null $P820, vivify_301
    new $P820, "Undef"
  vivify_301:
    if $P820, if_818
    find_lex $P824, "$/"
    unless_null $P824, vivify_302
    new $P824, "Hash"
  vivify_302:
    set $P825, $P824["comp_unit"]
    unless_null $P825, vivify_303
    new $P825, "Undef"
  vivify_303:
    $P826 = $P825."ast"()
    set $P817, $P826
    goto if_818_end
  if_818:
    find_lex $P821, "$/"
    unless_null $P821, vivify_304
    new $P821, "Hash"
  vivify_304:
    set $P822, $P821["block"]
    unless_null $P822, vivify_305
    new $P822, "Undef"
  vivify_305:
    $P823 = $P822."ast"()
    set $P817, $P823
  if_818_end:
    store_lex "$past", $P817
.annotate "line", 267
    find_lex $P827, "$past"
    find_lex $P828, "$/"
    unless_null $P828, vivify_306
    new $P828, "Hash"
  vivify_306:
    set $P829, $P828["name"]
    unless_null $P829, vivify_307
    new $P829, "Hash"
  vivify_307:
    set $P830, $P829["identifier"]
    unless_null $P830, vivify_308
    new $P830, "Undef"
  vivify_308:
    $P827."namespace"($P830)
.annotate "line", 268
    find_lex $P831, "$past"
    $P831."blocktype"("immediate")
.annotate "line", 269
    find_lex $P832, "$/"
    find_lex $P833, "$past"
    $P834 = $P832."!make"($P833)
.annotate "line", 265
    .return ($P834)
  control_813:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P835, exception, "payload"
    .return ($P835)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("56_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_839
.annotate "line", 272
    new $P838, 'ExceptionHandler'
    set_addr $P838, control_837
    $P838."handle_types"(58)
    push_eh $P838
    .lex "self", self
    .lex "$/", param_839
    find_lex $P840, "$/"
    find_lex $P841, "$/"
    unless_null $P841, vivify_309
    new $P841, "Hash"
  vivify_309:
    set $P842, $P841["scoped"]
    unless_null $P842, vivify_310
    new $P842, "Undef"
  vivify_310:
    $P843 = $P842."ast"()
    $P844 = $P840."!make"($P843)
    .return ($P844)
  control_837:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P845, exception, "payload"
    .return ($P845)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("57_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_849
.annotate "line", 273
    new $P848, 'ExceptionHandler'
    set_addr $P848, control_847
    $P848."handle_types"(58)
    push_eh $P848
    .lex "self", self
    .lex "$/", param_849
    find_lex $P850, "$/"
    find_lex $P851, "$/"
    unless_null $P851, vivify_311
    new $P851, "Hash"
  vivify_311:
    set $P852, $P851["scoped"]
    unless_null $P852, vivify_312
    new $P852, "Undef"
  vivify_312:
    $P853 = $P852."ast"()
    $P854 = $P850."!make"($P853)
    .return ($P854)
  control_847:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P855, exception, "payload"
    .return ($P855)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("58_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_859
.annotate "line", 274
    new $P858, 'ExceptionHandler'
    set_addr $P858, control_857
    $P858."handle_types"(58)
    push_eh $P858
    .lex "self", self
    .lex "$/", param_859
    find_lex $P860, "$/"
    find_lex $P861, "$/"
    unless_null $P861, vivify_313
    new $P861, "Hash"
  vivify_313:
    set $P862, $P861["scoped"]
    unless_null $P862, vivify_314
    new $P862, "Undef"
  vivify_314:
    $P863 = $P862."ast"()
    $P864 = $P860."!make"($P863)
    .return ($P864)
  control_857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P865, exception, "payload"
    .return ($P865)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("59_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_869
.annotate "line", 276
    new $P868, 'ExceptionHandler'
    set_addr $P868, control_867
    $P868."handle_types"(58)
    push_eh $P868
    .lex "self", self
    .lex "$/", param_869
.annotate "line", 277
    find_lex $P870, "$/"
.annotate "line", 278
    find_lex $P873, "$/"
    unless_null $P873, vivify_315
    new $P873, "Hash"
  vivify_315:
    set $P874, $P873["routine_declarator"]
    unless_null $P874, vivify_316
    new $P874, "Undef"
  vivify_316:
    if $P874, if_872
.annotate "line", 279
    find_lex $P878, "$/"
    unless_null $P878, vivify_317
    new $P878, "Hash"
  vivify_317:
    set $P879, $P878["variable_declarator"]
    unless_null $P879, vivify_318
    new $P879, "Undef"
  vivify_318:
    $P880 = $P879."ast"()
    set $P871, $P880
.annotate "line", 278
    goto if_872_end
  if_872:
    find_lex $P875, "$/"
    unless_null $P875, vivify_319
    new $P875, "Hash"
  vivify_319:
    set $P876, $P875["routine_declarator"]
    unless_null $P876, vivify_320
    new $P876, "Undef"
  vivify_320:
    $P877 = $P876."ast"()
    set $P871, $P877
  if_872_end:
    $P881 = $P870."!make"($P871)
.annotate "line", 276
    .return ($P881)
  control_867:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P882, exception, "payload"
    .return ($P882)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("60_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_886
.annotate "line", 282
    .const 'Sub' $P926 = "61_1258897750.20545" 
    capture_lex $P926
    new $P885, 'ExceptionHandler'
    set_addr $P885, control_884
    $P885."handle_types"(58)
    push_eh $P885
    .lex "self", self
    .lex "$/", param_886
.annotate "line", 283
    new $P887, "Undef"
    .lex "$past", $P887
.annotate "line", 284
    new $P888, "Undef"
    .lex "$sigil", $P888
.annotate "line", 285
    new $P889, "Undef"
    .lex "$name", $P889
.annotate "line", 286
    new $P890, "Undef"
    .lex "$BLOCK", $P890
.annotate "line", 283
    find_lex $P891, "$/"
    unless_null $P891, vivify_321
    new $P891, "Hash"
  vivify_321:
    set $P892, $P891["variable"]
    unless_null $P892, vivify_322
    new $P892, "Undef"
  vivify_322:
    $P893 = $P892."ast"()
    store_lex "$past", $P893
.annotate "line", 284
    find_lex $P894, "$/"
    unless_null $P894, vivify_323
    new $P894, "Hash"
  vivify_323:
    set $P895, $P894["variable"]
    unless_null $P895, vivify_324
    new $P895, "Hash"
  vivify_324:
    set $P896, $P895["sigil"]
    unless_null $P896, vivify_325
    new $P896, "Undef"
  vivify_325:
    store_lex "$sigil", $P896
.annotate "line", 285
    find_lex $P897, "$past"
    $P898 = $P897."name"()
    store_lex "$name", $P898
.annotate "line", 286
    get_global $P899, "@BLOCK"
    unless_null $P899, vivify_326
    new $P899, "ResizablePMCArray"
  vivify_326:
    set $P900, $P899[0]
    unless_null $P900, vivify_327
    new $P900, "Undef"
  vivify_327:
    store_lex "$BLOCK", $P900
.annotate "line", 287
    find_lex $P902, "$BLOCK"
    find_lex $P903, "$name"
    $P904 = $P902."symbol"($P903)
    unless $P904, if_901_end
.annotate "line", 288
    find_lex $P905, "$/"
    $P906 = $P905."CURSOR"()
    find_lex $P907, "$name"
    $P906."panic"("Redeclaration of symbol ", $P907)
  if_901_end:
.annotate "line", 290
    find_dynamic_lex $P909, "$*SCOPE"
    unless_null $P909, vivify_328
    get_hll_global $P909, "$SCOPE"
    unless_null $P909, vivify_329
    die "Contextual $*SCOPE not found"
  vivify_329:
  vivify_328:
    set $S910, $P909
    iseq $I911, $S910, "has"
    if $I911, if_908
.annotate "line", 299
    .const 'Sub' $P926 = "61_1258897750.20545" 
    capture_lex $P926
    $P926()
    goto if_908_end
  if_908:
.annotate "line", 291
    find_lex $P912, "$BLOCK"
    find_lex $P913, "$name"
    $P912."symbol"($P913, "attribute" :named("scope"))
.annotate "line", 292
    find_lex $P915, "$BLOCK"
    unless_null $P915, vivify_334
    new $P915, "Hash"
  vivify_334:
    set $P916, $P915["attributes"]
    unless_null $P916, vivify_335
    new $P916, "Undef"
  vivify_335:
    if $P916, unless_914_end
.annotate "line", 294
    get_hll_global $P917, ["PAST"], "Op"
    $P918 = $P917."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P919, "$BLOCK"
    unless_null $P919, vivify_336
    new $P919, "Hash"
    store_lex "$BLOCK", $P919
  vivify_336:
    set $P919["attributes"], $P918
  unless_914_end:
.annotate "line", 296
    find_lex $P920, "$BLOCK"
    unless_null $P920, vivify_337
    new $P920, "Hash"
  vivify_337:
    set $P921, $P920["attributes"]
    unless_null $P921, vivify_338
    new $P921, "Undef"
  vivify_338:
    find_lex $P922, "$name"
    $P921."push"($P922)
.annotate "line", 297
    get_hll_global $P923, ["PAST"], "Stmts"
    $P924 = $P923."new"()
    store_lex "$past", $P924
  if_908_end:
.annotate "line", 307
    find_lex $P950, "$/"
    find_lex $P951, "$past"
    $P952 = $P950."!make"($P951)
.annotate "line", 282
    .return ($P952)
  control_884:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P953, exception, "payload"
    .return ($P953)
.end


.namespace ["NQP";"Actions"]
.sub "_block925"  :anon :subid("61_1258897750.20545") :outer("60_1258897750.20545")
.annotate "line", 300
    new $P927, "Undef"
    .lex "$scope", $P927
.annotate "line", 301
    new $P928, "Undef"
    .lex "$decl", $P928
.annotate "line", 300
    find_dynamic_lex $P931, "$*SCOPE"
    unless_null $P931, vivify_330
    get_hll_global $P931, "$SCOPE"
    unless_null $P931, vivify_331
    die "Contextual $*SCOPE not found"
  vivify_331:
  vivify_330:
    set $S932, $P931
    iseq $I933, $S932, "our"
    if $I933, if_930
    new $P935, "String"
    assign $P935, "lexical"
    set $P929, $P935
    goto if_930_end
  if_930:
    new $P934, "String"
    assign $P934, "package"
    set $P929, $P934
  if_930_end:
    store_lex "$scope", $P929
.annotate "line", 301
    get_hll_global $P936, ["PAST"], "Var"
    find_lex $P937, "$name"
    find_lex $P938, "$scope"
.annotate "line", 302
    find_lex $P939, "$sigil"
    $P940 = "sigiltype"($P939)
    find_lex $P941, "$/"
    $P942 = $P936."new"($P937 :named("name"), $P938 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P940 :named("viviself"), $P941 :named("node"))
.annotate "line", 301
    store_lex "$decl", $P942
.annotate "line", 304
    find_lex $P943, "$BLOCK"
    find_lex $P944, "$name"
    find_lex $P945, "$scope"
    $P943."symbol"($P944, $P945 :named("scope"))
.annotate "line", 305
    find_lex $P946, "$BLOCK"
    unless_null $P946, vivify_332
    new $P946, "ResizablePMCArray"
  vivify_332:
    set $P947, $P946[0]
    unless_null $P947, vivify_333
    new $P947, "Undef"
  vivify_333:
    find_lex $P948, "$decl"
    $P949 = $P947."push"($P948)
.annotate "line", 299
    .return ($P949)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("62_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_957
.annotate "line", 310
    new $P956, 'ExceptionHandler'
    set_addr $P956, control_955
    $P956."handle_types"(58)
    push_eh $P956
    .lex "self", self
    .lex "$/", param_957
    find_lex $P958, "$/"
    find_lex $P959, "$/"
    unless_null $P959, vivify_339
    new $P959, "Hash"
  vivify_339:
    set $P960, $P959["routine_def"]
    unless_null $P960, vivify_340
    new $P960, "Undef"
  vivify_340:
    $P961 = $P960."ast"()
    $P962 = $P958."!make"($P961)
    .return ($P962)
  control_955:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P963, exception, "payload"
    .return ($P963)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("63_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_967
.annotate "line", 311
    new $P966, 'ExceptionHandler'
    set_addr $P966, control_965
    $P966."handle_types"(58)
    push_eh $P966
    .lex "self", self
    .lex "$/", param_967
    find_lex $P968, "$/"
    find_lex $P969, "$/"
    unless_null $P969, vivify_341
    new $P969, "Hash"
  vivify_341:
    set $P970, $P969["method_def"]
    unless_null $P970, vivify_342
    new $P970, "Undef"
  vivify_342:
    $P971 = $P970."ast"()
    $P972 = $P968."!make"($P971)
    .return ($P972)
  control_965:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P973, exception, "payload"
    .return ($P973)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("64_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_977
.annotate "line", 313
    .const 'Sub' $P988 = "65_1258897750.20545" 
    capture_lex $P988
    new $P976, 'ExceptionHandler'
    set_addr $P976, control_975
    $P976."handle_types"(58)
    push_eh $P976
    .lex "self", self
    .lex "$/", param_977
.annotate "line", 314
    new $P978, "Undef"
    .lex "$past", $P978
    find_lex $P979, "$/"
    unless_null $P979, vivify_343
    new $P979, "Hash"
  vivify_343:
    set $P980, $P979["blockoid"]
    unless_null $P980, vivify_344
    new $P980, "Undef"
  vivify_344:
    $P981 = $P980."ast"()
    store_lex "$past", $P981
.annotate "line", 315
    find_lex $P982, "$past"
    $P982."blocktype"("declaration")
.annotate "line", 316
    find_lex $P983, "$past"
    $P983."control"("return_pir")
.annotate "line", 317
    find_lex $P985, "$/"
    unless_null $P985, vivify_345
    new $P985, "Hash"
  vivify_345:
    set $P986, $P985["deflongname"]
    unless_null $P986, vivify_346
    new $P986, "Undef"
  vivify_346:
    unless $P986, if_984_end
    .const 'Sub' $P988 = "65_1258897750.20545" 
    capture_lex $P988
    $P988()
  if_984_end:
.annotate "line", 327
    find_lex $P1016, "$/"
    find_lex $P1017, "$past"
    $P1018 = $P1016."!make"($P1017)
.annotate "line", 313
    .return ($P1018)
  control_975:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1019, exception, "payload"
    .return ($P1019)
.end


.namespace ["NQP";"Actions"]
.sub "_block987"  :anon :subid("65_1258897750.20545") :outer("64_1258897750.20545")
.annotate "line", 318
    new $P989, "Undef"
    .lex "$name", $P989
    find_lex $P990, "$/"
    unless_null $P990, vivify_347
    new $P990, "Hash"
  vivify_347:
    set $P991, $P990["deflongname"]
    unless_null $P991, vivify_348
    new $P991, "ResizablePMCArray"
  vivify_348:
    set $P992, $P991[0]
    unless_null $P992, vivify_349
    new $P992, "Undef"
  vivify_349:
    $P993 = $P992."ast"()
    set $S994, $P993
    new $P995, 'String'
    set $P995, $S994
    store_lex "$name", $P995
.annotate "line", 319
    find_lex $P996, "$past"
    find_lex $P997, "$name"
    $P996."name"($P997)
.annotate "line", 320
    find_dynamic_lex $P1000, "$*SCOPE"
    unless_null $P1000, vivify_350
    get_hll_global $P1000, "$SCOPE"
    unless_null $P1000, vivify_351
    die "Contextual $*SCOPE not found"
  vivify_351:
  vivify_350:
    set $S1001, $P1000
    isne $I1002, $S1001, "our"
    if $I1002, if_999
    new $P998, 'Integer'
    set $P998, $I1002
    goto if_999_end
  if_999:
.annotate "line", 321
    get_global $P1003, "@BLOCK"
    unless_null $P1003, vivify_352
    new $P1003, "ResizablePMCArray"
  vivify_352:
    set $P1004, $P1003[0]
    unless_null $P1004, vivify_353
    new $P1004, "ResizablePMCArray"
  vivify_353:
    set $P1005, $P1004[0]
    unless_null $P1005, vivify_354
    new $P1005, "Undef"
  vivify_354:
    get_hll_global $P1006, ["PAST"], "Var"
    find_lex $P1007, "$name"
    find_lex $P1008, "$past"
    $P1009 = $P1006."new"($P1007 :named("name"), 1 :named("isdecl"), $P1008 :named("viviself"), "lexical" :named("scope"))
    $P1005."push"($P1009)
.annotate "line", 323
    get_global $P1010, "@BLOCK"
    unless_null $P1010, vivify_355
    new $P1010, "ResizablePMCArray"
  vivify_355:
    set $P1011, $P1010[0]
    unless_null $P1011, vivify_356
    new $P1011, "Undef"
  vivify_356:
    find_lex $P1012, "$name"
    $P1011."symbol"($P1012, "lexical" :named("scope"))
.annotate "line", 324
    get_hll_global $P1013, ["PAST"], "Var"
    find_lex $P1014, "$name"
    $P1015 = $P1013."new"($P1014 :named("name"))
    store_lex "$past", $P1015
.annotate "line", 320
    set $P998, $P1015
  if_999_end:
.annotate "line", 317
    .return ($P998)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("66_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1023
.annotate "line", 331
    .const 'Sub' $P1039 = "67_1258897750.20545" 
    capture_lex $P1039
    new $P1022, 'ExceptionHandler'
    set_addr $P1022, control_1021
    $P1022."handle_types"(58)
    push_eh $P1022
    .lex "self", self
    .lex "$/", param_1023
.annotate "line", 332
    new $P1024, "Undef"
    .lex "$past", $P1024
    find_lex $P1025, "$/"
    unless_null $P1025, vivify_357
    new $P1025, "Hash"
  vivify_357:
    set $P1026, $P1025["blockoid"]
    unless_null $P1026, vivify_358
    new $P1026, "Undef"
  vivify_358:
    $P1027 = $P1026."ast"()
    store_lex "$past", $P1027
.annotate "line", 333
    find_lex $P1028, "$past"
    $P1028."blocktype"("method")
.annotate "line", 334
    find_lex $P1029, "$past"
    $P1029."control"("return_pir")
.annotate "line", 335
    find_lex $P1030, "$past"
    unless_null $P1030, vivify_359
    new $P1030, "ResizablePMCArray"
  vivify_359:
    set $P1031, $P1030[0]
    unless_null $P1031, vivify_360
    new $P1031, "Undef"
  vivify_360:
    get_hll_global $P1032, ["PAST"], "Op"
    $P1033 = $P1032."new"("    .lex \"self\", self" :named("inline"))
    $P1031."unshift"($P1033)
.annotate "line", 336
    find_lex $P1034, "$past"
    $P1034."symbol"("self", "lexical" :named("scope"))
.annotate "line", 337
    find_lex $P1036, "$/"
    unless_null $P1036, vivify_361
    new $P1036, "Hash"
  vivify_361:
    set $P1037, $P1036["deflongname"]
    unless_null $P1037, vivify_362
    new $P1037, "Undef"
  vivify_362:
    unless $P1037, if_1035_end
    .const 'Sub' $P1039 = "67_1258897750.20545" 
    capture_lex $P1039
    $P1039()
  if_1035_end:
.annotate "line", 341
    find_lex $P1050, "$/"
    find_lex $P1051, "$past"
    $P1052 = $P1050."!make"($P1051)
.annotate "line", 331
    .return ($P1052)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1053, exception, "payload"
    .return ($P1053)
.end


.namespace ["NQP";"Actions"]
.sub "_block1038"  :anon :subid("67_1258897750.20545") :outer("66_1258897750.20545")
.annotate "line", 338
    new $P1040, "Undef"
    .lex "$name", $P1040
    find_lex $P1041, "$/"
    unless_null $P1041, vivify_363
    new $P1041, "Hash"
  vivify_363:
    set $P1042, $P1041["deflongname"]
    unless_null $P1042, vivify_364
    new $P1042, "ResizablePMCArray"
  vivify_364:
    set $P1043, $P1042[0]
    unless_null $P1043, vivify_365
    new $P1043, "Undef"
  vivify_365:
    $P1044 = $P1043."ast"()
    set $S1045, $P1044
    new $P1046, 'String'
    set $P1046, $S1045
    store_lex "$name", $P1046
.annotate "line", 339
    find_lex $P1047, "$past"
    find_lex $P1048, "$name"
    $P1049 = $P1047."name"($P1048)
.annotate "line", 337
    .return ($P1049)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("68_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1057
.annotate "line", 345
    .const 'Sub' $P1068 = "69_1258897750.20545" 
    capture_lex $P1068
    new $P1056, 'ExceptionHandler'
    set_addr $P1056, control_1055
    $P1056."handle_types"(58)
    push_eh $P1056
    .lex "self", self
    .lex "$/", param_1057
.annotate "line", 346
    new $P1058, "Undef"
    .lex "$BLOCKINIT", $P1058
    get_global $P1059, "@BLOCK"
    unless_null $P1059, vivify_366
    new $P1059, "ResizablePMCArray"
  vivify_366:
    set $P1060, $P1059[0]
    unless_null $P1060, vivify_367
    new $P1060, "ResizablePMCArray"
  vivify_367:
    set $P1061, $P1060[0]
    unless_null $P1061, vivify_368
    new $P1061, "Undef"
  vivify_368:
    store_lex "$BLOCKINIT", $P1061
.annotate "line", 347
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_369
    new $P1063, "Hash"
  vivify_369:
    set $P1064, $P1063["parameter"]
    unless_null $P1064, vivify_370
    new $P1064, "Undef"
  vivify_370:
    defined $I1065, $P1064
    unless $I1065, for_undef_371
    iter $P1062, $P1064
    new $P1075, 'ExceptionHandler'
    set_addr $P1075, loop1074_handler
    $P1075."handle_types"(65, 67, 66)
    push_eh $P1075
  loop1074_test:
    unless $P1062, loop1074_done
    shift $P1066, $P1062
  loop1074_redo:
    .const 'Sub' $P1068 = "69_1258897750.20545" 
    capture_lex $P1068
    $P1068($P1066)
  loop1074_next:
    goto loop1074_test
  loop1074_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1076, exception, 'type'
    eq $P1076, 65, loop1074_next
    eq $P1076, 67, loop1074_redo
  loop1074_done:
    pop_eh 
  for_undef_371:
.annotate "line", 345
    .return ($P1062)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["NQP";"Actions"]
.sub "_block1067"  :anon :subid("69_1258897750.20545") :outer("68_1258897750.20545")
    .param pmc param_1069
.annotate "line", 347
    .lex "$_", param_1069
    find_lex $P1070, "$BLOCKINIT"
    find_lex $P1071, "$_"
    $P1072 = $P1071."ast"()
    $P1073 = $P1070."push"($P1072)
    .return ($P1073)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("70_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1081
.annotate "line", 350
    new $P1080, 'ExceptionHandler'
    set_addr $P1080, control_1079
    $P1080."handle_types"(58)
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
.annotate "line", 351
    new $P1082, "Undef"
    .lex "$quant", $P1082
.annotate "line", 352
    new $P1083, "Undef"
    .lex "$past", $P1083
.annotate "line", 351
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_372
    new $P1084, "Hash"
  vivify_372:
    set $P1085, $P1084["quant"]
    unless_null $P1085, vivify_373
    new $P1085, "Undef"
  vivify_373:
    store_lex "$quant", $P1085
    find_lex $P1086, "$past"
.annotate "line", 353
    find_lex $P1088, "$/"
    unless_null $P1088, vivify_374
    new $P1088, "Hash"
  vivify_374:
    set $P1089, $P1088["named_param"]
    unless_null $P1089, vivify_375
    new $P1089, "Undef"
  vivify_375:
    if $P1089, if_1087
.annotate "line", 360
    find_lex $P1103, "$/"
    unless_null $P1103, vivify_376
    new $P1103, "Hash"
  vivify_376:
    set $P1104, $P1103["param_var"]
    unless_null $P1104, vivify_377
    new $P1104, "Undef"
  vivify_377:
    $P1105 = $P1104."ast"()
    store_lex "$past", $P1105
.annotate "line", 361
    find_lex $P1107, "$quant"
    set $S1108, $P1107
    iseq $I1109, $S1108, "*"
    if $I1109, if_1106
.annotate "line", 365
    find_lex $P1118, "$quant"
    set $S1119, $P1118
    iseq $I1120, $S1119, "?"
    unless $I1120, if_1117_end
.annotate "line", 366
    find_lex $P1121, "$past"
    find_lex $P1122, "$/"
    unless_null $P1122, vivify_378
    new $P1122, "Hash"
  vivify_378:
    set $P1123, $P1122["param_var"]
    unless_null $P1123, vivify_379
    new $P1123, "Hash"
  vivify_379:
    set $P1124, $P1123["sigil"]
    unless_null $P1124, vivify_380
    new $P1124, "Undef"
  vivify_380:
    $P1125 = "sigiltype"($P1124)
    $P1121."viviself"($P1125)
  if_1117_end:
.annotate "line", 365
    goto if_1106_end
  if_1106:
.annotate "line", 362
    find_lex $P1110, "$past"
    $P1110."slurpy"(1)
.annotate "line", 363
    find_lex $P1111, "$past"
    find_lex $P1112, "$/"
    unless_null $P1112, vivify_381
    new $P1112, "Hash"
  vivify_381:
    set $P1113, $P1112["param_var"]
    unless_null $P1113, vivify_382
    new $P1113, "Hash"
  vivify_382:
    set $P1114, $P1113["sigil"]
    unless_null $P1114, vivify_383
    new $P1114, "Undef"
  vivify_383:
    set $S1115, $P1114
    iseq $I1116, $S1115, "%"
    $P1111."named"($I1116)
  if_1106_end:
.annotate "line", 359
    goto if_1087_end
  if_1087:
.annotate "line", 354
    find_lex $P1090, "$/"
    unless_null $P1090, vivify_384
    new $P1090, "Hash"
  vivify_384:
    set $P1091, $P1090["named_param"]
    unless_null $P1091, vivify_385
    new $P1091, "Undef"
  vivify_385:
    $P1092 = $P1091."ast"()
    store_lex "$past", $P1092
.annotate "line", 355
    find_lex $P1094, "$quant"
    set $S1095, $P1094
    isne $I1096, $S1095, "!"
    unless $I1096, if_1093_end
.annotate "line", 356
    find_lex $P1097, "$past"
    find_lex $P1098, "$/"
    unless_null $P1098, vivify_386
    new $P1098, "Hash"
  vivify_386:
    set $P1099, $P1098["named_param"]
    unless_null $P1099, vivify_387
    new $P1099, "Hash"
  vivify_387:
    set $P1100, $P1099["param_var"]
    unless_null $P1100, vivify_388
    new $P1100, "Hash"
  vivify_388:
    set $P1101, $P1100["sigil"]
    unless_null $P1101, vivify_389
    new $P1101, "Undef"
  vivify_389:
    $P1102 = "sigiltype"($P1101)
    $P1097."viviself"($P1102)
  if_1093_end:
  if_1087_end:
.annotate "line", 369
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_390
    new $P1127, "Hash"
  vivify_390:
    set $P1128, $P1127["default_value"]
    unless_null $P1128, vivify_391
    new $P1128, "Undef"
  vivify_391:
    unless $P1128, if_1126_end
.annotate "line", 370
    find_lex $P1130, "$quant"
    set $S1131, $P1130
    iseq $I1132, $S1131, "*"
    unless $I1132, if_1129_end
.annotate "line", 371
    find_lex $P1133, "$/"
    $P1134 = $P1133."CURSOR"()
    $P1134."panic"("Can't put default on slurpy parameter")
  if_1129_end:
.annotate "line", 373
    find_lex $P1136, "$quant"
    set $S1137, $P1136
    iseq $I1138, $S1137, "!"
    unless $I1138, if_1135_end
.annotate "line", 374
    find_lex $P1139, "$/"
    $P1140 = $P1139."CURSOR"()
    $P1140."panic"("Can't put default on required parameter")
  if_1135_end:
.annotate "line", 376
    find_lex $P1141, "$past"
    find_lex $P1142, "$/"
    unless_null $P1142, vivify_392
    new $P1142, "Hash"
  vivify_392:
    set $P1143, $P1142["default_value"]
    unless_null $P1143, vivify_393
    new $P1143, "ResizablePMCArray"
  vivify_393:
    set $P1144, $P1143[0]
    unless_null $P1144, vivify_394
    new $P1144, "Hash"
  vivify_394:
    set $P1145, $P1144["EXPR"]
    unless_null $P1145, vivify_395
    new $P1145, "Undef"
  vivify_395:
    $P1146 = $P1145."ast"()
    $P1141."viviself"($P1146)
  if_1126_end:
.annotate "line", 378
    find_lex $P1148, "$past"
    $P1149 = $P1148."viviself"()
    if $P1149, unless_1147_end
    get_global $P1150, "@BLOCK"
    unless_null $P1150, vivify_396
    new $P1150, "ResizablePMCArray"
  vivify_396:
    set $P1151, $P1150[0]
    unless_null $P1151, vivify_397
    new $P1151, "Undef"
  vivify_397:
    get_global $P1152, "@BLOCK"
    unless_null $P1152, vivify_398
    new $P1152, "ResizablePMCArray"
  vivify_398:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_399
    new $P1153, "Undef"
  vivify_399:
    $P1154 = $P1153."arity"()
    set $N1155, $P1154
    new $P1156, 'Float'
    set $P1156, $N1155
    add $P1157, $P1156, 1
    $P1151."arity"($P1157)
  unless_1147_end:
.annotate "line", 379
    find_lex $P1158, "$/"
    find_lex $P1159, "$past"
    $P1160 = $P1158."!make"($P1159)
.annotate "line", 350
    .return ($P1160)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("71_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1165
.annotate "line", 382
    new $P1164, 'ExceptionHandler'
    set_addr $P1164, control_1163
    $P1164."handle_types"(58)
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate "line", 383
    new $P1166, "Undef"
    .lex "$name", $P1166
.annotate "line", 384
    new $P1167, "Undef"
    .lex "$past", $P1167
.annotate "line", 383
    find_lex $P1168, "$/"
    set $S1169, $P1168
    new $P1170, 'String'
    set $P1170, $S1169
    store_lex "$name", $P1170
.annotate "line", 384
    get_hll_global $P1171, ["PAST"], "Var"
    find_lex $P1172, "$name"
    find_lex $P1173, "$/"
    $P1174 = $P1171."new"($P1172 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1173 :named("node"))
    store_lex "$past", $P1174
.annotate "line", 386
    get_global $P1175, "@BLOCK"
    unless_null $P1175, vivify_400
    new $P1175, "ResizablePMCArray"
  vivify_400:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_401
    new $P1176, "Undef"
  vivify_401:
    find_lex $P1177, "$name"
    $P1176."symbol"($P1177, "lexical" :named("scope"))
.annotate "line", 387
    find_lex $P1178, "$/"
    find_lex $P1179, "$past"
    $P1180 = $P1178."!make"($P1179)
.annotate "line", 382
    .return ($P1180)
  control_1163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1181, exception, "payload"
    .return ($P1181)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("72_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1185
.annotate "line", 390
    new $P1184, 'ExceptionHandler'
    set_addr $P1184, control_1183
    $P1184."handle_types"(58)
    push_eh $P1184
    .lex "self", self
    .lex "$/", param_1185
.annotate "line", 391
    new $P1186, "Undef"
    .lex "$past", $P1186
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_402
    new $P1187, "Hash"
  vivify_402:
    set $P1188, $P1187["param_var"]
    unless_null $P1188, vivify_403
    new $P1188, "Undef"
  vivify_403:
    $P1189 = $P1188."ast"()
    store_lex "$past", $P1189
.annotate "line", 392
    find_lex $P1190, "$past"
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_404
    new $P1191, "Hash"
  vivify_404:
    set $P1192, $P1191["param_var"]
    unless_null $P1192, vivify_405
    new $P1192, "Hash"
  vivify_405:
    set $P1193, $P1192["name"]
    unless_null $P1193, vivify_406
    new $P1193, "Undef"
  vivify_406:
    set $S1194, $P1193
    $P1190."named"($S1194)
.annotate "line", 393
    find_lex $P1195, "$/"
    find_lex $P1196, "$past"
    $P1197 = $P1195."!make"($P1196)
.annotate "line", 390
    .return ($P1197)
  control_1183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1198, exception, "payload"
    .return ($P1198)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("73_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1202
    .param pmc param_1203 :optional
    .param int has_param_1203 :opt_flag
.annotate "line", 396
    .const 'Sub' $P1273 = "75_1258897750.20545" 
    capture_lex $P1273
    .const 'Sub' $P1220 = "74_1258897750.20545" 
    capture_lex $P1220
    new $P1201, 'ExceptionHandler'
    set_addr $P1201, control_1200
    $P1201."handle_types"(58)
    push_eh $P1201
    .lex "self", self
    .lex "$/", param_1202
    if has_param_1203, optparam_407
    new $P1204, "Undef"
    set param_1203, $P1204
  optparam_407:
    .lex "$key", param_1203
.annotate "line", 397
    new $P1205, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1205
.annotate "line", 400
    new $P1206, "Undef"
    .lex "$name", $P1206
.annotate "line", 401
    new $P1207, "Undef"
    .lex "$past", $P1207
.annotate "line", 397

        $P1208 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1208
.annotate "line", 400
    find_lex $P1209, "$/"
    unless_null $P1209, vivify_408
    new $P1209, "Hash"
  vivify_408:
    set $P1210, $P1209["deflongname"]
    unless_null $P1210, vivify_409
    new $P1210, "Undef"
  vivify_409:
    $P1211 = $P1210."ast"()
    set $S1212, $P1211
    new $P1213, 'String'
    set $P1213, $S1212
    store_lex "$name", $P1213
    find_lex $P1214, "$past"
.annotate "line", 402
    find_lex $P1216, "$key"
    set $S1217, $P1216
    iseq $I1218, $S1217, "open"
    if $I1218, if_1215
.annotate "line", 415
    find_lex $P1248, "$/"
    unless_null $P1248, vivify_410
    new $P1248, "Hash"
  vivify_410:
    set $P1249, $P1248["proto"]
    unless_null $P1249, vivify_411
    new $P1249, "Undef"
  vivify_411:
    if $P1249, if_1247
.annotate "line", 442
    .const 'Sub' $P1273 = "75_1258897750.20545" 
    capture_lex $P1273
    $P1273()
    goto if_1247_end
  if_1247:
.annotate "line", 417
    get_hll_global $P1250, ["PAST"], "Stmts"
.annotate "line", 418
    get_hll_global $P1251, ["PAST"], "Block"
    find_lex $P1252, "$name"
.annotate "line", 419
    get_hll_global $P1253, ["PAST"], "Op"
.annotate "line", 420
    get_hll_global $P1254, ["PAST"], "Var"
    $P1255 = $P1254."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1256, "$name"
    $P1257 = $P1253."new"($P1255, $P1256, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 419
    find_lex $P1258, "$/"
    $P1259 = $P1251."new"($P1257, $P1252 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1258 :named("node"))
.annotate "line", 429
    get_hll_global $P1260, ["PAST"], "Block"
    new $P1261, "String"
    assign $P1261, "!PREFIX__"
    find_lex $P1262, "$name"
    concat $P1263, $P1261, $P1262
.annotate "line", 430
    get_hll_global $P1264, ["PAST"], "Op"
.annotate "line", 431
    get_hll_global $P1265, ["PAST"], "Var"
    $P1266 = $P1265."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1267, "$name"
    $P1268 = $P1264."new"($P1266, $P1267, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 430
    find_lex $P1269, "$/"
    $P1270 = $P1260."new"($P1268, $P1263 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1269 :named("node"))
.annotate "line", 429
    $P1271 = $P1250."new"($P1259, $P1270)
.annotate "line", 417
    store_lex "$past", $P1271
  if_1247_end:
.annotate "line", 415
    goto if_1215_end
  if_1215:
.annotate "line", 402
    .const 'Sub' $P1220 = "74_1258897750.20545" 
    capture_lex $P1220
    $P1220()
  if_1215_end:
.annotate "line", 458
    find_lex $P1299, "$/"
    find_lex $P1300, "$past"
    $P1301 = $P1299."!make"($P1300)
.annotate "line", 396
    .return ($P1301)
  control_1200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1302, exception, "payload"
    .return ($P1302)
.end


.namespace ["NQP";"Actions"]
.sub "_block1272"  :anon :subid("75_1258897750.20545") :outer("73_1258897750.20545")
.annotate "line", 443
    new $P1274, "Undef"
    .lex "$rpast", $P1274
.annotate "line", 444
    new $P1275, "Hash"
    .lex "%capnames", $P1275
.annotate "line", 443
    find_lex $P1276, "$/"
    unless_null $P1276, vivify_412
    new $P1276, "Hash"
  vivify_412:
    set $P1277, $P1276["p6regex"]
    unless_null $P1277, vivify_413
    new $P1277, "Undef"
  vivify_413:
    $P1278 = $P1277."ast"()
    store_lex "$rpast", $P1278
.annotate "line", 444
    get_hll_global $P1279, ["Regex";"P6Regex";"Actions"], "capnames"
    find_lex $P1280, "$rpast"
    $P1281 = $P1279($P1280, 0)
    store_lex "%capnames", $P1281
.annotate "line", 445
    new $P1282, "Integer"
    assign $P1282, 0
    find_lex $P1283, "%capnames"
    unless_null $P1283, vivify_414
    new $P1283, "Hash"
    store_lex "%capnames", $P1283
  vivify_414:
    set $P1283[""], $P1282
.annotate "line", 446
    get_hll_global $P1284, ["PAST"], "Regex"
    find_lex $P1285, "$rpast"
.annotate "line", 448
    get_hll_global $P1286, ["PAST"], "Regex"
    $P1287 = $P1286."new"("pass" :named("pasttype"))
    find_lex $P1288, "%capnames"
    $P1289 = $P1284."new"($P1285, $P1287, "concat" :named("pasttype"), $P1288 :named("capnames"))
.annotate "line", 446
    store_lex "$rpast", $P1289
.annotate "line", 452
    get_global $P1290, "@BLOCK"
    $P1291 = $P1290."shift"()
    store_lex "$past", $P1291
.annotate "line", 453
    find_lex $P1292, "$past"
    $P1292."blocktype"("method")
.annotate "line", 454
    find_lex $P1293, "$past"
    find_lex $P1294, "$name"
    $P1293."name"($P1294)
.annotate "line", 455
    find_lex $P1295, "$past"
    find_lex $P1296, "$rpast"
    $P1295."push"($P1296)
.annotate "line", 456
    find_lex $P1297, "@MODIFIERS"
    $P1298 = $P1297."shift"()
.annotate "line", 442
    .return ($P1298)
.end


.namespace ["NQP";"Actions"]
.sub "_block1219"  :anon :subid("74_1258897750.20545") :outer("73_1258897750.20545")
.annotate "line", 403
    new $P1221, "Hash"
    .lex "%h", $P1221
.annotate "line", 402
    find_lex $P1222, "%h"
.annotate "line", 404
    find_lex $P1224, "$/"
    unless_null $P1224, vivify_415
    new $P1224, "Hash"
  vivify_415:
    set $P1225, $P1224["sym"]
    unless_null $P1225, vivify_416
    new $P1225, "Undef"
  vivify_416:
    set $S1226, $P1225
    iseq $I1227, $S1226, "token"
    unless $I1227, if_1223_end
    new $P1228, "Integer"
    assign $P1228, 1
    find_lex $P1229, "%h"
    unless_null $P1229, vivify_417
    new $P1229, "Hash"
    store_lex "%h", $P1229
  vivify_417:
    set $P1229["r"], $P1228
  if_1223_end:
.annotate "line", 405
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_418
    new $P1231, "Hash"
  vivify_418:
    set $P1232, $P1231["sym"]
    unless_null $P1232, vivify_419
    new $P1232, "Undef"
  vivify_419:
    set $S1233, $P1232
    iseq $I1234, $S1233, "rule"
    unless $I1234, if_1230_end
    new $P1235, "Integer"
    assign $P1235, 1
    find_lex $P1236, "%h"
    unless_null $P1236, vivify_420
    new $P1236, "Hash"
    store_lex "%h", $P1236
  vivify_420:
    set $P1236["r"], $P1235
    new $P1237, "Integer"
    assign $P1237, 1
    find_lex $P1238, "%h"
    unless_null $P1238, vivify_421
    new $P1238, "Hash"
    store_lex "%h", $P1238
  vivify_421:
    set $P1238["s"], $P1237
  if_1230_end:
.annotate "line", 406
    find_lex $P1239, "@MODIFIERS"
    find_lex $P1240, "%h"
    $P1239."unshift"($P1240)
.annotate "line", 407

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 411
    get_global $P1241, "@BLOCK"
    unless_null $P1241, vivify_422
    new $P1241, "ResizablePMCArray"
  vivify_422:
    set $P1242, $P1241[0]
    unless_null $P1242, vivify_423
    new $P1242, "Undef"
  vivify_423:
    $P1242."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 412
    get_global $P1243, "@BLOCK"
    unless_null $P1243, vivify_424
    new $P1243, "ResizablePMCArray"
  vivify_424:
    set $P1244, $P1243[0]
    unless_null $P1244, vivify_425
    new $P1244, "Undef"
  vivify_425:
    $P1244."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 413
    new $P1245, "Exception"
    set $P1245['type'], 58
    new $P1246, "Integer"
    assign $P1246, 0
    setattribute $P1245, 'payload', $P1246
    throw $P1245
.annotate "line", 402
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("76_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1306
.annotate "line", 462
    new $P1305, 'ExceptionHandler'
    set_addr $P1305, control_1304
    $P1305."handle_types"(58)
    push_eh $P1305
    .lex "self", self
    .lex "$/", param_1306
.annotate "line", 463
    new $P1307, "Undef"
    .lex "$past", $P1307
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_426
    new $P1310, "Hash"
  vivify_426:
    set $P1311, $P1310["args"]
    unless_null $P1311, vivify_427
    new $P1311, "Undef"
  vivify_427:
    if $P1311, if_1309
    get_hll_global $P1316, ["PAST"], "Op"
    find_lex $P1317, "$/"
    $P1318 = $P1316."new"($P1317 :named("node"))
    set $P1308, $P1318
    goto if_1309_end
  if_1309:
    find_lex $P1312, "$/"
    unless_null $P1312, vivify_428
    new $P1312, "Hash"
  vivify_428:
    set $P1313, $P1312["args"]
    unless_null $P1313, vivify_429
    new $P1313, "ResizablePMCArray"
  vivify_429:
    set $P1314, $P1313[0]
    unless_null $P1314, vivify_430
    new $P1314, "Undef"
  vivify_430:
    $P1315 = $P1314."ast"()
    set $P1308, $P1315
  if_1309_end:
    store_lex "$past", $P1308
.annotate "line", 464
    find_lex $P1319, "$past"
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_431
    new $P1322, "Hash"
  vivify_431:
    set $P1323, $P1322["quote"]
    unless_null $P1323, vivify_432
    new $P1323, "Undef"
  vivify_432:
    if $P1323, if_1321
    find_lex $P1327, "$/"
    unless_null $P1327, vivify_433
    new $P1327, "Hash"
  vivify_433:
    set $P1328, $P1327["longname"]
    unless_null $P1328, vivify_434
    new $P1328, "Undef"
  vivify_434:
    set $S1329, $P1328
    new $P1320, 'String'
    set $P1320, $S1329
    goto if_1321_end
  if_1321:
    find_lex $P1324, "$/"
    unless_null $P1324, vivify_435
    new $P1324, "Hash"
  vivify_435:
    set $P1325, $P1324["quote"]
    unless_null $P1325, vivify_436
    new $P1325, "Undef"
  vivify_436:
    $P1326 = $P1325."ast"()
    set $P1320, $P1326
  if_1321_end:
    $P1319."name"($P1320)
.annotate "line", 465
    find_lex $P1330, "$past"
    $P1330."pasttype"("callmethod")
.annotate "line", 466
    find_lex $P1331, "$/"
    find_lex $P1332, "$past"
    $P1333 = $P1331."!make"($P1332)
.annotate "line", 462
    .return ($P1333)
  control_1304:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1334, exception, "payload"
    .return ($P1334)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("77_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1338
.annotate "line", 471
    new $P1337, 'ExceptionHandler'
    set_addr $P1337, control_1336
    $P1337."handle_types"(58)
    push_eh $P1337
    .lex "self", self
    .lex "$/", param_1338
.annotate "line", 472
    find_lex $P1339, "$/"
    get_hll_global $P1340, ["PAST"], "Var"
    $P1341 = $P1340."new"("self" :named("name"))
    $P1342 = $P1339."!make"($P1341)
.annotate "line", 471
    .return ($P1342)
  control_1336:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1343, exception, "payload"
    .return ($P1343)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("78_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1347
.annotate "line", 475
    new $P1346, 'ExceptionHandler'
    set_addr $P1346, control_1345
    $P1346."handle_types"(58)
    push_eh $P1346
    .lex "self", self
    .lex "$/", param_1347
.annotate "line", 476
    new $P1348, "Undef"
    .lex "$past", $P1348
    find_lex $P1349, "$/"
    unless_null $P1349, vivify_437
    new $P1349, "Hash"
  vivify_437:
    set $P1350, $P1349["args"]
    unless_null $P1350, vivify_438
    new $P1350, "Undef"
  vivify_438:
    $P1351 = $P1350."ast"()
    store_lex "$past", $P1351
.annotate "line", 477
    find_lex $P1352, "$past"
    find_lex $P1353, "$/"
    unless_null $P1353, vivify_439
    new $P1353, "Hash"
  vivify_439:
    set $P1354, $P1353["identifier"]
    unless_null $P1354, vivify_440
    new $P1354, "Undef"
  vivify_440:
    set $S1355, $P1354
    $P1352."name"($S1355)
.annotate "line", 478
    find_lex $P1356, "$/"
    find_lex $P1357, "$past"
    $P1358 = $P1356."!make"($P1357)
.annotate "line", 475
    .return ($P1358)
  control_1345:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1359, exception, "payload"
    .return ($P1359)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("79_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1363
.annotate "line", 481
    new $P1362, 'ExceptionHandler'
    set_addr $P1362, control_1361
    $P1362."handle_types"(58)
    push_eh $P1362
    .lex "self", self
    .lex "$/", param_1363
.annotate "line", 482
    new $P1364, "ResizablePMCArray"
    .lex "@ns", $P1364
.annotate "line", 483
    new $P1365, "Undef"
    .lex "$name", $P1365
.annotate "line", 485
    new $P1366, "Undef"
    .lex "$var", $P1366
.annotate "line", 487
    new $P1367, "Undef"
    .lex "$past", $P1367
.annotate "line", 482
    find_lex $P1368, "$/"
    unless_null $P1368, vivify_441
    new $P1368, "Hash"
  vivify_441:
    set $P1369, $P1368["name"]
    unless_null $P1369, vivify_442
    new $P1369, "Hash"
  vivify_442:
    set $P1370, $P1369["identifier"]
    unless_null $P1370, vivify_443
    new $P1370, "Undef"
  vivify_443:
    clone $P1371, $P1370
    store_lex "@ns", $P1371
.annotate "line", 483
    find_lex $P1372, "@ns"
    $P1373 = $P1372."pop"()
    store_lex "$name", $P1373
.annotate "line", 484
    find_lex $P1377, "@ns"
    if $P1377, if_1376
    set $P1375, $P1377
    goto if_1376_end
  if_1376:
    find_lex $P1378, "@ns"
    unless_null $P1378, vivify_444
    new $P1378, "ResizablePMCArray"
  vivify_444:
    set $P1379, $P1378[0]
    unless_null $P1379, vivify_445
    new $P1379, "Undef"
  vivify_445:
    set $S1380, $P1379
    iseq $I1381, $S1380, "GLOBAL"
    new $P1375, 'Integer'
    set $P1375, $I1381
  if_1376_end:
    unless $P1375, if_1374_end
    find_lex $P1382, "@ns"
    $P1382."shift"()
  if_1374_end:
.annotate "line", 486
    get_hll_global $P1383, ["PAST"], "Var"
    find_lex $P1384, "$name"
    set $S1385, $P1384
    find_lex $P1386, "@ns"
    $P1387 = $P1383."new"($S1385 :named("name"), $P1386 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1387
.annotate "line", 487
    find_lex $P1388, "$var"
    store_lex "$past", $P1388
.annotate "line", 488
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_446
    new $P1390, "Hash"
  vivify_446:
    set $P1391, $P1390["args"]
    unless_null $P1391, vivify_447
    new $P1391, "Undef"
  vivify_447:
    unless $P1391, if_1389_end
.annotate "line", 489
    find_lex $P1392, "$/"
    unless_null $P1392, vivify_448
    new $P1392, "Hash"
  vivify_448:
    set $P1393, $P1392["args"]
    unless_null $P1393, vivify_449
    new $P1393, "ResizablePMCArray"
  vivify_449:
    set $P1394, $P1393[0]
    unless_null $P1394, vivify_450
    new $P1394, "Undef"
  vivify_450:
    $P1395 = $P1394."ast"()
    store_lex "$past", $P1395
.annotate "line", 490
    find_lex $P1396, "$past"
    find_lex $P1397, "$var"
    $P1396."unshift"($P1397)
  if_1389_end:
.annotate "line", 492
    find_lex $P1398, "$/"
    find_lex $P1399, "$past"
    $P1400 = $P1398."!make"($P1399)
.annotate "line", 481
    .return ($P1400)
  control_1361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1401, exception, "payload"
    .return ($P1401)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("80_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1405
.annotate "line", 495
    new $P1404, 'ExceptionHandler'
    set_addr $P1404, control_1403
    $P1404."handle_types"(58)
    push_eh $P1404
    .lex "self", self
    .lex "$/", param_1405
.annotate "line", 496
    new $P1406, "Undef"
    .lex "$past", $P1406
.annotate "line", 497
    new $P1407, "Undef"
    .lex "$pirop", $P1407
.annotate "line", 496
    find_lex $P1410, "$/"
    unless_null $P1410, vivify_451
    new $P1410, "Hash"
  vivify_451:
    set $P1411, $P1410["args"]
    unless_null $P1411, vivify_452
    new $P1411, "Undef"
  vivify_452:
    if $P1411, if_1409
    get_hll_global $P1416, ["PAST"], "Op"
    find_lex $P1417, "$/"
    $P1418 = $P1416."new"($P1417 :named("node"))
    set $P1408, $P1418
    goto if_1409_end
  if_1409:
    find_lex $P1412, "$/"
    unless_null $P1412, vivify_453
    new $P1412, "Hash"
  vivify_453:
    set $P1413, $P1412["args"]
    unless_null $P1413, vivify_454
    new $P1413, "ResizablePMCArray"
  vivify_454:
    set $P1414, $P1413[0]
    unless_null $P1414, vivify_455
    new $P1414, "Undef"
  vivify_455:
    $P1415 = $P1414."ast"()
    set $P1408, $P1415
  if_1409_end:
    store_lex "$past", $P1408
.annotate "line", 497
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_456
    new $P1419, "Hash"
  vivify_456:
    set $P1420, $P1419["op"]
    unless_null $P1420, vivify_457
    new $P1420, "Undef"
  vivify_457:
    set $S1421, $P1420
    new $P1422, 'String'
    set $P1422, $S1421
    store_lex "$pirop", $P1422
.annotate "line", 498

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1423 = box $S0
    
    store_lex "$pirop", $P1423
.annotate "line", 505
    find_lex $P1424, "$past"
    find_lex $P1425, "$pirop"
    $P1424."pirop"($P1425)
.annotate "line", 506
    find_lex $P1426, "$past"
    $P1426."pasttype"("pirop")
.annotate "line", 507
    find_lex $P1427, "$/"
    find_lex $P1428, "$past"
    $P1429 = $P1427."!make"($P1428)
.annotate "line", 495
    .return ($P1429)
  control_1403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1430, exception, "payload"
    .return ($P1430)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("81_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1434
.annotate "line", 510
    new $P1433, 'ExceptionHandler'
    set_addr $P1433, control_1432
    $P1433."handle_types"(58)
    push_eh $P1433
    .lex "self", self
    .lex "$/", param_1434
    find_lex $P1435, "$/"
    find_lex $P1436, "$/"
    unless_null $P1436, vivify_458
    new $P1436, "Hash"
  vivify_458:
    set $P1437, $P1436["arglist"]
    unless_null $P1437, vivify_459
    new $P1437, "Undef"
  vivify_459:
    $P1438 = $P1437."ast"()
    $P1439 = $P1435."!make"($P1438)
    .return ($P1439)
  control_1432:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1440, exception, "payload"
    .return ($P1440)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("82_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1444
.annotate "line", 512
    .const 'Sub' $P1455 = "83_1258897750.20545" 
    capture_lex $P1455
    new $P1443, 'ExceptionHandler'
    set_addr $P1443, control_1442
    $P1443."handle_types"(58)
    push_eh $P1443
    .lex "self", self
    .lex "$/", param_1444
.annotate "line", 513
    new $P1445, "Undef"
    .lex "$past", $P1445
.annotate "line", 521
    new $P1446, "Undef"
    .lex "$i", $P1446
.annotate "line", 522
    new $P1447, "Undef"
    .lex "$n", $P1447
.annotate "line", 513
    get_hll_global $P1448, ["PAST"], "Op"
    find_lex $P1449, "$/"
    $P1450 = $P1448."new"("call" :named("pasttype"), $P1449 :named("node"))
    store_lex "$past", $P1450
.annotate "line", 514
    find_lex $P1452, "$/"
    unless_null $P1452, vivify_460
    new $P1452, "Hash"
  vivify_460:
    set $P1453, $P1452["EXPR"]
    unless_null $P1453, vivify_461
    new $P1453, "Undef"
  vivify_461:
    unless $P1453, if_1451_end
    .const 'Sub' $P1455 = "83_1258897750.20545" 
    capture_lex $P1455
    $P1455()
  if_1451_end:
.annotate "line", 521
    new $P1487, "Integer"
    assign $P1487, 0
    store_lex "$i", $P1487
.annotate "line", 522
    find_lex $P1488, "$past"
    $P1489 = $P1488."list"()
    set $N1490, $P1489
    new $P1491, 'Float'
    set $P1491, $N1490
    store_lex "$n", $P1491
.annotate "line", 523
    new $P1519, 'ExceptionHandler'
    set_addr $P1519, loop1518_handler
    $P1519."handle_types"(65, 67, 66)
    push_eh $P1519
  loop1518_test:
    find_lex $P1492, "$i"
    set $N1493, $P1492
    find_lex $P1494, "$n"
    set $N1495, $P1494
    islt $I1496, $N1493, $N1495
    unless $I1496, loop1518_done
  loop1518_redo:
.annotate "line", 524
    find_lex $P1498, "$i"
    set $I1499, $P1498
    find_lex $P1500, "$past"
    unless_null $P1500, vivify_465
    new $P1500, "ResizablePMCArray"
  vivify_465:
    set $P1501, $P1500[$I1499]
    unless_null $P1501, vivify_466
    new $P1501, "Undef"
  vivify_466:
    $S1502 = $P1501."name"()
    iseq $I1503, $S1502, "&prefix:<|>"
    unless $I1503, if_1497_end
.annotate "line", 525
    find_lex $P1504, "$i"
    set $I1505, $P1504
    find_lex $P1506, "$past"
    unless_null $P1506, vivify_467
    new $P1506, "ResizablePMCArray"
  vivify_467:
    set $P1507, $P1506[$I1505]
    unless_null $P1507, vivify_468
    new $P1507, "ResizablePMCArray"
  vivify_468:
    set $P1508, $P1507[0]
    unless_null $P1508, vivify_469
    new $P1508, "Undef"
  vivify_469:
    find_lex $P1509, "$i"
    set $I1510, $P1509
    find_lex $P1511, "$past"
    unless_null $P1511, vivify_470
    new $P1511, "ResizablePMCArray"
    store_lex "$past", $P1511
  vivify_470:
    set $P1511[$I1510], $P1508
.annotate "line", 526
    find_lex $P1512, "$i"
    set $I1513, $P1512
    find_lex $P1514, "$past"
    unless_null $P1514, vivify_471
    new $P1514, "ResizablePMCArray"
  vivify_471:
    set $P1515, $P1514[$I1513]
    unless_null $P1515, vivify_472
    new $P1515, "Undef"
  vivify_472:
    $P1515."flat"(1)
  if_1497_end:
.annotate "line", 524
    find_lex $P1516, "$i"
    clone $P1517, $P1516
    inc $P1516
  loop1518_next:
.annotate "line", 523
    goto loop1518_test
  loop1518_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1520, exception, 'type'
    eq $P1520, 65, loop1518_next
    eq $P1520, 67, loop1518_redo
  loop1518_done:
    pop_eh 
.annotate "line", 530
    find_lex $P1521, "$/"
    find_lex $P1522, "$past"
    $P1523 = $P1521."!make"($P1522)
.annotate "line", 512
    .return ($P1523)
  control_1442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1524, exception, "payload"
    .return ($P1524)
.end


.namespace ["NQP";"Actions"]
.sub "_block1454"  :anon :subid("83_1258897750.20545") :outer("82_1258897750.20545")
.annotate "line", 514
    .const 'Sub' $P1476 = "84_1258897750.20545" 
    capture_lex $P1476
.annotate "line", 515
    new $P1456, "Undef"
    .lex "$expr", $P1456
    find_lex $P1457, "$/"
    unless_null $P1457, vivify_462
    new $P1457, "Hash"
  vivify_462:
    set $P1458, $P1457["EXPR"]
    unless_null $P1458, vivify_463
    new $P1458, "Undef"
  vivify_463:
    $P1459 = $P1458."ast"()
    store_lex "$expr", $P1459
.annotate "line", 516
    find_lex $P1464, "$expr"
    $S1465 = $P1464."name"()
    iseq $I1466, $S1465, "&infix:<,>"
    if $I1466, if_1463
    new $P1462, 'Integer'
    set $P1462, $I1466
    goto if_1463_end
  if_1463:
    find_lex $P1467, "$expr"
    $P1468 = $P1467."named"()
    isfalse $I1469, $P1468
    new $P1462, 'Integer'
    set $P1462, $I1469
  if_1463_end:
    if $P1462, if_1461
.annotate "line", 519
    find_lex $P1484, "$past"
    find_lex $P1485, "$expr"
    $P1486 = $P1484."push"($P1485)
    set $P1460, $P1486
.annotate "line", 516
    goto if_1461_end
  if_1461:
.annotate "line", 517
    find_lex $P1471, "$expr"
    $P1472 = $P1471."list"()
    defined $I1473, $P1472
    unless $I1473, for_undef_464
    iter $P1470, $P1472
    new $P1482, 'ExceptionHandler'
    set_addr $P1482, loop1481_handler
    $P1482."handle_types"(65, 67, 66)
    push_eh $P1482
  loop1481_test:
    unless $P1470, loop1481_done
    shift $P1474, $P1470
  loop1481_redo:
    .const 'Sub' $P1476 = "84_1258897750.20545" 
    capture_lex $P1476
    $P1476($P1474)
  loop1481_next:
    goto loop1481_test
  loop1481_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1483, exception, 'type'
    eq $P1483, 65, loop1481_next
    eq $P1483, 67, loop1481_redo
  loop1481_done:
    pop_eh 
  for_undef_464:
.annotate "line", 516
    set $P1460, $P1470
  if_1461_end:
.annotate "line", 514
    .return ($P1460)
.end


.namespace ["NQP";"Actions"]
.sub "_block1475"  :anon :subid("84_1258897750.20545") :outer("83_1258897750.20545")
    .param pmc param_1477
.annotate "line", 517
    .lex "$_", param_1477
    find_lex $P1478, "$past"
    find_lex $P1479, "$_"
    $P1480 = $P1478."push"($P1479)
    .return ($P1480)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("85_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1528
.annotate "line", 534
    new $P1527, 'ExceptionHandler'
    set_addr $P1527, control_1526
    $P1527."handle_types"(58)
    push_eh $P1527
    .lex "self", self
    .lex "$/", param_1528
    find_lex $P1529, "$/"
    find_lex $P1530, "$/"
    unless_null $P1530, vivify_473
    new $P1530, "Hash"
  vivify_473:
    set $P1531, $P1530["value"]
    unless_null $P1531, vivify_474
    new $P1531, "Undef"
  vivify_474:
    $P1532 = $P1531."ast"()
    $P1533 = $P1529."!make"($P1532)
    .return ($P1533)
  control_1526:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1534, exception, "payload"
    .return ($P1534)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("86_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1538
.annotate "line", 536
    new $P1537, 'ExceptionHandler'
    set_addr $P1537, control_1536
    $P1537."handle_types"(58)
    push_eh $P1537
    .lex "self", self
    .lex "$/", param_1538
.annotate "line", 537
    find_lex $P1539, "$/"
.annotate "line", 538
    find_lex $P1542, "$/"
    unless_null $P1542, vivify_475
    new $P1542, "Hash"
  vivify_475:
    set $P1543, $P1542["EXPR"]
    unless_null $P1543, vivify_476
    new $P1543, "Undef"
  vivify_476:
    if $P1543, if_1541
.annotate "line", 539
    get_hll_global $P1548, ["PAST"], "Op"
    find_lex $P1549, "$/"
    $P1550 = $P1548."new"("list" :named("pasttype"), $P1549 :named("node"))
    set $P1540, $P1550
.annotate "line", 538
    goto if_1541_end
  if_1541:
    find_lex $P1544, "$/"
    unless_null $P1544, vivify_477
    new $P1544, "Hash"
  vivify_477:
    set $P1545, $P1544["EXPR"]
    unless_null $P1545, vivify_478
    new $P1545, "ResizablePMCArray"
  vivify_478:
    set $P1546, $P1545[0]
    unless_null $P1546, vivify_479
    new $P1546, "Undef"
  vivify_479:
    $P1547 = $P1546."ast"()
    set $P1540, $P1547
  if_1541_end:
    $P1551 = $P1539."!make"($P1540)
.annotate "line", 536
    .return ($P1551)
  control_1536:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1552, exception, "payload"
    .return ($P1552)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("87_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1556
.annotate "line", 542
    new $P1555, 'ExceptionHandler'
    set_addr $P1555, control_1554
    $P1555."handle_types"(58)
    push_eh $P1555
    .lex "self", self
    .lex "$/", param_1556
.annotate "line", 543
    new $P1557, "Undef"
    .lex "$past", $P1557
.annotate "line", 542
    find_lex $P1558, "$past"
.annotate "line", 544
    find_lex $P1560, "$/"
    unless_null $P1560, vivify_480
    new $P1560, "Hash"
  vivify_480:
    set $P1561, $P1560["EXPR"]
    unless_null $P1561, vivify_481
    new $P1561, "Undef"
  vivify_481:
    if $P1561, if_1559
.annotate "line", 551
    get_hll_global $P1573, ["PAST"], "Op"
    $P1574 = $P1573."new"("list" :named("pasttype"))
    store_lex "$past", $P1574
.annotate "line", 550
    goto if_1559_end
  if_1559:
.annotate "line", 545
    find_lex $P1562, "$/"
    unless_null $P1562, vivify_482
    new $P1562, "Hash"
  vivify_482:
    set $P1563, $P1562["EXPR"]
    unless_null $P1563, vivify_483
    new $P1563, "ResizablePMCArray"
  vivify_483:
    set $P1564, $P1563[0]
    unless_null $P1564, vivify_484
    new $P1564, "Undef"
  vivify_484:
    $P1565 = $P1564."ast"()
    store_lex "$past", $P1565
.annotate "line", 546
    find_lex $P1567, "$past"
    $S1568 = $P1567."name"()
    isne $I1569, $S1568, "&infix:<,>"
    unless $I1569, if_1566_end
.annotate "line", 547
    get_hll_global $P1570, ["PAST"], "Op"
    find_lex $P1571, "$past"
    $P1572 = $P1570."new"($P1571, "list" :named("pasttype"))
    store_lex "$past", $P1572
  if_1566_end:
  if_1559_end:
.annotate "line", 553
    find_lex $P1575, "$past"
    $P1575."name"("&circumfix:<[ ]>")
.annotate "line", 554
    find_lex $P1576, "$/"
    find_lex $P1577, "$past"
    $P1578 = $P1576."!make"($P1577)
.annotate "line", 542
    .return ($P1578)
  control_1554:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1579, exception, "payload"
    .return ($P1579)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("88_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1583
.annotate "line", 557
    new $P1582, 'ExceptionHandler'
    set_addr $P1582, control_1581
    $P1582."handle_types"(58)
    push_eh $P1582
    .lex "self", self
    .lex "$/", param_1583
    find_lex $P1584, "$/"
    find_lex $P1585, "$/"
    unless_null $P1585, vivify_485
    new $P1585, "Hash"
  vivify_485:
    set $P1586, $P1585["quote_EXPR"]
    unless_null $P1586, vivify_486
    new $P1586, "Undef"
  vivify_486:
    $P1587 = $P1586."ast"()
    $P1588 = $P1584."!make"($P1587)
    .return ($P1588)
  control_1581:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1589, exception, "payload"
    .return ($P1589)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("89_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1593
.annotate "line", 559
    new $P1592, 'ExceptionHandler'
    set_addr $P1592, control_1591
    $P1592."handle_types"(58)
    push_eh $P1592
    .lex "self", self
    .lex "$/", param_1593
.annotate "line", 560
    find_lex $P1594, "$/"
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_487
    new $P1597, "Hash"
  vivify_487:
    set $P1598, $P1597["pblock"]
    unless_null $P1598, vivify_488
    new $P1598, "Hash"
  vivify_488:
    set $P1599, $P1598["blockoid"]
    unless_null $P1599, vivify_489
    new $P1599, "Hash"
  vivify_489:
    set $P1600, $P1599["statementlist"]
    unless_null $P1600, vivify_490
    new $P1600, "Hash"
  vivify_490:
    set $P1601, $P1600["statement"]
    unless_null $P1601, vivify_491
    new $P1601, "Undef"
  vivify_491:
    set $N1602, $P1601
    new $P1603, "Integer"
    assign $P1603, 0
    set $N1604, $P1603
    isgt $I1605, $N1602, $N1604
    if $I1605, if_1596
.annotate "line", 562
    get_hll_global $P1609, ["PAST"], "Op"
    find_lex $P1610, "$/"
    $P1611 = $P1609."new"("    %r = new [\"Hash\"]" :named("inline"), $P1610 :named("node"))
    set $P1595, $P1611
.annotate "line", 560
    goto if_1596_end
  if_1596:
.annotate "line", 561
    find_lex $P1606, "$/"
    unless_null $P1606, vivify_492
    new $P1606, "Hash"
  vivify_492:
    set $P1607, $P1606["pblock"]
    unless_null $P1607, vivify_493
    new $P1607, "Undef"
  vivify_493:
    $P1608 = $P1607."ast"()
    set $P1595, $P1608
  if_1596_end:
    $P1612 = $P1594."!make"($P1595)
.annotate "line", 559
    .return ($P1612)
  control_1591:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1613, exception, "payload"
    .return ($P1613)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("90_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1617
.annotate "line", 565
    new $P1616, 'ExceptionHandler'
    set_addr $P1616, control_1615
    $P1616."handle_types"(58)
    push_eh $P1616
    .lex "self", self
    .lex "$/", param_1617
.annotate "line", 566
    new $P1618, "Undef"
    .lex "$name", $P1618
    find_lex $P1621, "$/"
    unless_null $P1621, vivify_494
    new $P1621, "Hash"
  vivify_494:
    set $P1622, $P1621["sigil"]
    unless_null $P1622, vivify_495
    new $P1622, "Undef"
  vivify_495:
    set $S1623, $P1622
    iseq $I1624, $S1623, "@"
    if $I1624, if_1620
.annotate "line", 567
    find_lex $P1628, "$/"
    unless_null $P1628, vivify_496
    new $P1628, "Hash"
  vivify_496:
    set $P1629, $P1628["sigil"]
    unless_null $P1629, vivify_497
    new $P1629, "Undef"
  vivify_497:
    set $S1630, $P1629
    iseq $I1631, $S1630, "%"
    if $I1631, if_1627
    new $P1633, "String"
    assign $P1633, "item"
    set $P1626, $P1633
    goto if_1627_end
  if_1627:
    new $P1632, "String"
    assign $P1632, "hash"
    set $P1626, $P1632
  if_1627_end:
    set $P1619, $P1626
.annotate "line", 566
    goto if_1620_end
  if_1620:
    new $P1625, "String"
    assign $P1625, "list"
    set $P1619, $P1625
  if_1620_end:
    store_lex "$name", $P1619
.annotate "line", 569
    find_lex $P1634, "$/"
    get_hll_global $P1635, ["PAST"], "Op"
    find_lex $P1636, "$name"
    find_lex $P1637, "$/"
    unless_null $P1637, vivify_498
    new $P1637, "Hash"
  vivify_498:
    set $P1638, $P1637["semilist"]
    unless_null $P1638, vivify_499
    new $P1638, "Undef"
  vivify_499:
    $P1639 = $P1638."ast"()
    $P1640 = $P1635."new"($P1639, "callmethod" :named("pasttype"), $P1636 :named("name"))
    $P1641 = $P1634."!make"($P1640)
.annotate "line", 565
    .return ($P1641)
  control_1615:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1642, exception, "payload"
    .return ($P1642)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("91_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1646
.annotate "line", 572
    new $P1645, 'ExceptionHandler'
    set_addr $P1645, control_1644
    $P1645."handle_types"(58)
    push_eh $P1645
    .lex "self", self
    .lex "$/", param_1646
    find_lex $P1647, "$/"
    find_lex $P1648, "$/"
    unless_null $P1648, vivify_500
    new $P1648, "Hash"
  vivify_500:
    set $P1649, $P1648["statement"]
    unless_null $P1649, vivify_501
    new $P1649, "Undef"
  vivify_501:
    $P1650 = $P1649."ast"()
    $P1651 = $P1647."!make"($P1650)
    .return ($P1651)
  control_1644:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1652, exception, "payload"
    .return ($P1652)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("92_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1656
.annotate "line", 574
    new $P1655, 'ExceptionHandler'
    set_addr $P1655, control_1654
    $P1655."handle_types"(58)
    push_eh $P1655
    .lex "self", self
    .lex "$/", param_1656
.annotate "line", 575
    find_lex $P1657, "$/"
    get_hll_global $P1658, ["PAST"], "Var"
    find_lex $P1659, "$/"
    unless_null $P1659, vivify_502
    new $P1659, "Hash"
  vivify_502:
    set $P1660, $P1659["EXPR"]
    unless_null $P1660, vivify_503
    new $P1660, "Undef"
  vivify_503:
    $P1661 = $P1660."ast"()
    $P1662 = $P1658."new"($P1661, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1663 = $P1657."!make"($P1662)
.annotate "line", 574
    .return ($P1663)
  control_1654:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1664, exception, "payload"
    .return ($P1664)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("93_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1668
.annotate "line", 580
    new $P1667, 'ExceptionHandler'
    set_addr $P1667, control_1666
    $P1667."handle_types"(58)
    push_eh $P1667
    .lex "self", self
    .lex "$/", param_1668
.annotate "line", 581
    find_lex $P1669, "$/"
    get_hll_global $P1670, ["PAST"], "Var"
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_504
    new $P1671, "Hash"
  vivify_504:
    set $P1672, $P1671["EXPR"]
    unless_null $P1672, vivify_505
    new $P1672, "Undef"
  vivify_505:
    $P1673 = $P1672."ast"()
    $P1674 = $P1670."new"($P1673, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1675 = $P1669."!make"($P1674)
.annotate "line", 580
    .return ($P1675)
  control_1666:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1676, exception, "payload"
    .return ($P1676)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("94_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1680
.annotate "line", 586
    new $P1679, 'ExceptionHandler'
    set_addr $P1679, control_1678
    $P1679."handle_types"(58)
    push_eh $P1679
    .lex "self", self
    .lex "$/", param_1680
.annotate "line", 587
    find_lex $P1681, "$/"
    get_hll_global $P1682, ["PAST"], "Var"
    find_lex $P1683, "$/"
    unless_null $P1683, vivify_506
    new $P1683, "Hash"
  vivify_506:
    set $P1684, $P1683["quote_EXPR"]
    unless_null $P1684, vivify_507
    new $P1684, "Undef"
  vivify_507:
    $P1685 = $P1684."ast"()
    $P1686 = $P1682."new"($P1685, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1687 = $P1681."!make"($P1686)
.annotate "line", 586
    .return ($P1687)
  control_1678:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1688, exception, "payload"
    .return ($P1688)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("95_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1692
.annotate "line", 592
    new $P1691, 'ExceptionHandler'
    set_addr $P1691, control_1690
    $P1691."handle_types"(58)
    push_eh $P1691
    .lex "self", self
    .lex "$/", param_1692
.annotate "line", 593
    find_lex $P1693, "$/"
    find_lex $P1694, "$/"
    unless_null $P1694, vivify_508
    new $P1694, "Hash"
  vivify_508:
    set $P1695, $P1694["arglist"]
    unless_null $P1695, vivify_509
    new $P1695, "Undef"
  vivify_509:
    $P1696 = $P1695."ast"()
    $P1697 = $P1693."!make"($P1696)
.annotate "line", 592
    .return ($P1697)
  control_1690:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1698, exception, "payload"
    .return ($P1698)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("96_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1702
.annotate "line", 596
    new $P1701, 'ExceptionHandler'
    set_addr $P1701, control_1700
    $P1701."handle_types"(58)
    push_eh $P1701
    .lex "self", self
    .lex "$/", param_1702
.annotate "line", 597
    new $P1703, "Undef"
    .lex "$past", $P1703
.annotate "line", 598
    find_lex $P1706, "$/"
    unless_null $P1706, vivify_510
    new $P1706, "Hash"
  vivify_510:
    set $P1707, $P1706["quote"]
    unless_null $P1707, vivify_511
    new $P1707, "Undef"
  vivify_511:
    if $P1707, if_1705
.annotate "line", 599
    get_hll_global $P1711, ["PAST"], "Val"
.annotate "line", 601
    find_lex $P1714, "$/"
    unless_null $P1714, vivify_512
    new $P1714, "Hash"
  vivify_512:
    set $P1715, $P1714["dec_number"]
    unless_null $P1715, vivify_513
    new $P1715, "Undef"
  vivify_513:
    if $P1715, if_1713
.annotate "line", 602
    find_lex $P1719, "$/"
    unless_null $P1719, vivify_514
    new $P1719, "Hash"
  vivify_514:
    set $P1720, $P1719["integer"]
    unless_null $P1720, vivify_515
    new $P1720, "Undef"
  vivify_515:
    $P1721 = $P1720."ast"()
    set $P1712, $P1721
.annotate "line", 601
    goto if_1713_end
  if_1713:
    find_lex $P1716, "$/"
    unless_null $P1716, vivify_516
    new $P1716, "Hash"
  vivify_516:
    set $P1717, $P1716["dec_number"]
    unless_null $P1717, vivify_517
    new $P1717, "Undef"
  vivify_517:
    $P1718 = $P1717."ast"()
    set $P1712, $P1718
  if_1713_end:
    $P1722 = $P1711."new"($P1712 :named("value"))
.annotate "line", 599
    set $P1704, $P1722
.annotate "line", 598
    goto if_1705_end
  if_1705:
    find_lex $P1708, "$/"
    unless_null $P1708, vivify_518
    new $P1708, "Hash"
  vivify_518:
    set $P1709, $P1708["quote"]
    unless_null $P1709, vivify_519
    new $P1709, "Undef"
  vivify_519:
    $P1710 = $P1709."ast"()
    set $P1704, $P1710
  if_1705_end:
    store_lex "$past", $P1704
.annotate "line", 604
    find_lex $P1723, "$/"
    find_lex $P1724, "$past"
    $P1725 = $P1723."!make"($P1724)
.annotate "line", 596
    .return ($P1725)
  control_1700:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1726, exception, "payload"
    .return ($P1726)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("97_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1730
.annotate "line", 607
    new $P1729, 'ExceptionHandler'
    set_addr $P1729, control_1728
    $P1729."handle_types"(58)
    push_eh $P1729
    .lex "self", self
    .lex "$/", param_1730
    find_lex $P1731, "$/"
    find_lex $P1732, "$/"
    unless_null $P1732, vivify_520
    new $P1732, "Hash"
  vivify_520:
    set $P1733, $P1732["quote_EXPR"]
    unless_null $P1733, vivify_521
    new $P1733, "Undef"
  vivify_521:
    $P1734 = $P1733."ast"()
    $P1735 = $P1731."!make"($P1734)
    .return ($P1735)
  control_1728:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1736, exception, "payload"
    .return ($P1736)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("98_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1740
.annotate "line", 608
    new $P1739, 'ExceptionHandler'
    set_addr $P1739, control_1738
    $P1739."handle_types"(58)
    push_eh $P1739
    .lex "self", self
    .lex "$/", param_1740
    find_lex $P1741, "$/"
    find_lex $P1742, "$/"
    unless_null $P1742, vivify_522
    new $P1742, "Hash"
  vivify_522:
    set $P1743, $P1742["quote_EXPR"]
    unless_null $P1743, vivify_523
    new $P1743, "Undef"
  vivify_523:
    $P1744 = $P1743."ast"()
    $P1745 = $P1741."!make"($P1744)
    .return ($P1745)
  control_1738:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1746, exception, "payload"
    .return ($P1746)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("99_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1750
.annotate "line", 609
    new $P1749, 'ExceptionHandler'
    set_addr $P1749, control_1748
    $P1749."handle_types"(58)
    push_eh $P1749
    .lex "self", self
    .lex "$/", param_1750
    find_lex $P1751, "$/"
    find_lex $P1752, "$/"
    unless_null $P1752, vivify_524
    new $P1752, "Hash"
  vivify_524:
    set $P1753, $P1752["quote_EXPR"]
    unless_null $P1753, vivify_525
    new $P1753, "Undef"
  vivify_525:
    $P1754 = $P1753."ast"()
    $P1755 = $P1751."!make"($P1754)
    .return ($P1755)
  control_1748:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1756, exception, "payload"
    .return ($P1756)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("100_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1760
.annotate "line", 610
    new $P1759, 'ExceptionHandler'
    set_addr $P1759, control_1758
    $P1759."handle_types"(58)
    push_eh $P1759
    .lex "self", self
    .lex "$/", param_1760
    find_lex $P1761, "$/"
    find_lex $P1762, "$/"
    unless_null $P1762, vivify_526
    new $P1762, "Hash"
  vivify_526:
    set $P1763, $P1762["quote_EXPR"]
    unless_null $P1763, vivify_527
    new $P1763, "Undef"
  vivify_527:
    $P1764 = $P1763."ast"()
    $P1765 = $P1761."!make"($P1764)
    .return ($P1765)
  control_1758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1766, exception, "payload"
    .return ($P1766)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("101_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1770
.annotate "line", 611
    new $P1769, 'ExceptionHandler'
    set_addr $P1769, control_1768
    $P1769."handle_types"(58)
    push_eh $P1769
    .lex "self", self
    .lex "$/", param_1770
    find_lex $P1771, "$/"
    find_lex $P1772, "$/"
    unless_null $P1772, vivify_528
    new $P1772, "Hash"
  vivify_528:
    set $P1773, $P1772["quote_EXPR"]
    unless_null $P1773, vivify_529
    new $P1773, "Undef"
  vivify_529:
    $P1774 = $P1773."ast"()
    $P1775 = $P1771."!make"($P1774)
    .return ($P1775)
  control_1768:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1776, exception, "payload"
    .return ($P1776)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("102_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1780
.annotate "line", 612
    new $P1779, 'ExceptionHandler'
    set_addr $P1779, control_1778
    $P1779."handle_types"(58)
    push_eh $P1779
    .lex "self", self
    .lex "$/", param_1780
.annotate "line", 613
    find_lex $P1781, "$/"
    get_hll_global $P1782, ["PAST"], "Op"
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_530
    new $P1783, "Hash"
  vivify_530:
    set $P1784, $P1783["quote_EXPR"]
    unless_null $P1784, vivify_531
    new $P1784, "Undef"
  vivify_531:
    $P1785 = $P1784."ast"()
    $P1786 = $P1785."value"()
    find_lex $P1787, "$/"
    $P1788 = $P1782."new"($P1786 :named("inline"), "inline" :named("pasttype"), $P1787 :named("node"))
    $P1789 = $P1781."!make"($P1788)
.annotate "line", 612
    .return ($P1789)
  control_1778:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1790, exception, "payload"
    .return ($P1790)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("103_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1794
.annotate "line", 618
    new $P1793, 'ExceptionHandler'
    set_addr $P1793, control_1792
    $P1793."handle_types"(58)
    push_eh $P1793
    .lex "self", self
    .lex "$/", param_1794
    find_lex $P1795, "$/"
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_532
    new $P1796, "Hash"
  vivify_532:
    set $P1797, $P1796["variable"]
    unless_null $P1797, vivify_533
    new $P1797, "Undef"
  vivify_533:
    $P1798 = $P1797."ast"()
    $P1799 = $P1795."!make"($P1798)
    .return ($P1799)
  control_1792:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1800, exception, "payload"
    .return ($P1800)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("104_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1804
.annotate "line", 619
    new $P1803, 'ExceptionHandler'
    set_addr $P1803, control_1802
    $P1803."handle_types"(58)
    push_eh $P1803
    .lex "self", self
    .lex "$/", param_1804
.annotate "line", 620
    find_lex $P1805, "$/"
    get_hll_global $P1806, ["PAST"], "Op"
.annotate "line", 621
    find_lex $P1807, "$/"
    unless_null $P1807, vivify_534
    new $P1807, "Hash"
  vivify_534:
    set $P1808, $P1807["block"]
    unless_null $P1808, vivify_535
    new $P1808, "Undef"
  vivify_535:
    $P1809 = $P1808."ast"()
    $P1810 = "block_immediate"($P1809)
    find_lex $P1811, "$/"
    $P1812 = $P1806."new"($P1810, "set S*" :named("pirop"), $P1811 :named("node"))
.annotate "line", 620
    $P1813 = $P1805."!make"($P1812)
.annotate "line", 619
    .return ($P1813)
  control_1802:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1814, exception, "payload"
    .return ($P1814)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("105_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1818
.annotate "line", 627
    new $P1817, 'ExceptionHandler'
    set_addr $P1817, control_1816
    $P1817."handle_types"(58)
    push_eh $P1817
    .lex "self", self
    .lex "$/", param_1818
    find_lex $P1819, "$/"
    find_lex $P1820, "$/"
    unless_null $P1820, vivify_536
    new $P1820, "Hash"
  vivify_536:
    set $P1821, $P1820["dotty"]
    unless_null $P1821, vivify_537
    new $P1821, "Undef"
  vivify_537:
    $P1822 = $P1821."ast"()
    $P1823 = $P1819."!make"($P1822)
    .return ($P1823)
  control_1816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1824, exception, "payload"
    .return ($P1824)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("106_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1828
.annotate "line", 629
    new $P1827, 'ExceptionHandler'
    set_addr $P1827, control_1826
    $P1827."handle_types"(58)
    push_eh $P1827
    .lex "self", self
    .lex "$/", param_1828
.annotate "line", 630
    find_lex $P1829, "$/"
    get_hll_global $P1830, ["PAST"], "Op"
.annotate "line", 631
    new $P1831, "ResizablePMCArray"
    push $P1831, "    clone %r, %0"
    push $P1831, "    inc %0"
    $P1832 = $P1830."new"("postfix:<++>" :named("name"), $P1831 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 630
    $P1833 = $P1829."!make"($P1832)
.annotate "line", 629
    .return ($P1833)
  control_1826:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1834, exception, "payload"
    .return ($P1834)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("107_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1838
.annotate "line", 635
    new $P1837, 'ExceptionHandler'
    set_addr $P1837, control_1836
    $P1837."handle_types"(58)
    push_eh $P1837
    .lex "self", self
    .lex "$/", param_1838
.annotate "line", 636
    find_lex $P1839, "$/"
    get_hll_global $P1840, ["PAST"], "Op"
.annotate "line", 637
    new $P1841, "ResizablePMCArray"
    push $P1841, "    clone %r, %0"
    push $P1841, "    dec %0"
    $P1842 = $P1840."new"("postfix:<-->" :named("name"), $P1841 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 636
    $P1843 = $P1839."!make"($P1842)
.annotate "line", 635
    .return ($P1843)
  control_1836:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1844, exception, "payload"
    .return ($P1844)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("108_1258897750.20545") :method :outer("11_1258897750.20545")
    .param pmc param_1848
.annotate "line", 641
    new $P1847, 'ExceptionHandler'
    set_addr $P1847, control_1846
    $P1847."handle_types"(58)
    push_eh $P1847
    .lex "self", self
    .lex "$/", param_1848
.annotate "line", 642
    find_lex $P1849, "$/"
    get_hll_global $P1850, ["PAST"], "Op"
.annotate "line", 643
    get_hll_global $P1851, ["PAST"], "Var"
    $P1852 = $P1851."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1853, "$/"
    $P1854 = $P1850."new"($P1852, "callmethod" :named("pasttype"), "!make" :named("name"), $P1853 :named("node"))
.annotate "line", 642
    $P1855 = $P1849."!make"($P1854)
.annotate "line", 641
    .return ($P1855)
  control_1846:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1856, exception, "payload"
    .return ($P1856)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1857"  :subid("109_1258897750.20545") :outer("11_1258897750.20545")
.annotate "line", 651
    .const 'Sub' $P1893 = "113_1258897750.20545" 
    capture_lex $P1893
    .const 'Sub' $P1883 = "112_1258897750.20545" 
    capture_lex $P1883
    .const 'Sub' $P1873 = "111_1258897750.20545" 
    capture_lex $P1873
    .const 'Sub' $P1859 = "110_1258897750.20545" 
    capture_lex $P1859
.annotate "line", 662
    .const 'Sub' $P1893 = "113_1258897750.20545" 
    capture_lex $P1893
.annotate "line", 651
    .return ($P1893)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("110_1258897750.20545") :method :outer("109_1258897750.20545")
    .param pmc param_1862
.annotate "line", 653
    new $P1861, 'ExceptionHandler'
    set_addr $P1861, control_1860
    $P1861."handle_types"(58)
    push_eh $P1861
    .lex "self", self
    .lex "$/", param_1862
.annotate "line", 654
    new $P1863, "Undef"
    .lex "$past", $P1863
    find_lex $P1864, "$/"
    unless_null $P1864, vivify_538
    new $P1864, "Hash"
  vivify_538:
    set $P1865, $P1864["statement"]
    unless_null $P1865, vivify_539
    new $P1865, "Undef"
  vivify_539:
    $P1866 = $P1865."ast"()
    store_lex "$past", $P1866
.annotate "line", 655
    find_lex $P1867, "$/"
    get_hll_global $P1868, ["PAST"], "Regex"
    find_lex $P1869, "$past"
    $P1870 = $P1868."new"($P1869, "pastnode" :named("pasttype"))
    $P1871 = $P1867."!make"($P1870)
.annotate "line", 653
    .return ($P1871)
  control_1860:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1872, exception, "payload"
    .return ($P1872)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("111_1258897750.20545") :method :outer("109_1258897750.20545")
    .param pmc param_1876
.annotate "line", 658
    new $P1875, 'ExceptionHandler'
    set_addr $P1875, control_1874
    $P1875."handle_types"(58)
    push_eh $P1875
    .lex "self", self
    .lex "$/", param_1876
    find_lex $P1877, "$/"
    find_lex $P1878, "$/"
    unless_null $P1878, vivify_540
    new $P1878, "Hash"
  vivify_540:
    set $P1879, $P1878["codeblock"]
    unless_null $P1879, vivify_541
    new $P1879, "Undef"
  vivify_541:
    $P1880 = $P1879."ast"()
    $P1881 = $P1877."!make"($P1880)
    .return ($P1881)
  control_1874:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1882, exception, "payload"
    .return ($P1882)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("112_1258897750.20545") :method :outer("109_1258897750.20545")
    .param pmc param_1886
.annotate "line", 660
    new $P1885, 'ExceptionHandler'
    set_addr $P1885, control_1884
    $P1885."handle_types"(58)
    push_eh $P1885
    .lex "self", self
    .lex "$/", param_1886
    find_lex $P1887, "$/"
    find_lex $P1888, "$/"
    unless_null $P1888, vivify_542
    new $P1888, "Hash"
  vivify_542:
    set $P1889, $P1888["codeblock"]
    unless_null $P1889, vivify_543
    new $P1889, "Undef"
  vivify_543:
    $P1890 = $P1889."ast"()
    $P1891 = $P1887."!make"($P1890)
    .return ($P1891)
  control_1884:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1892, exception, "payload"
    .return ($P1892)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("113_1258897750.20545") :method :outer("109_1258897750.20545")
    .param pmc param_1896
.annotate "line", 662
    new $P1895, 'ExceptionHandler'
    set_addr $P1895, control_1894
    $P1895."handle_types"(58)
    push_eh $P1895
    .lex "self", self
    .lex "$/", param_1896
.annotate "line", 663
    new $P1897, "Undef"
    .lex "$block", $P1897
.annotate "line", 665
    new $P1898, "Undef"
    .lex "$past", $P1898
.annotate "line", 663
    find_lex $P1899, "$/"
    unless_null $P1899, vivify_544
    new $P1899, "Hash"
  vivify_544:
    set $P1900, $P1899["block"]
    unless_null $P1900, vivify_545
    new $P1900, "Undef"
  vivify_545:
    $P1901 = $P1900."ast"()
    store_lex "$block", $P1901
.annotate "line", 664
    find_lex $P1902, "$block"
    $P1902."blocktype"("immediate")
.annotate "line", 666
    get_hll_global $P1903, ["PAST"], "Regex"
.annotate "line", 667
    get_hll_global $P1904, ["PAST"], "Stmts"
.annotate "line", 668
    get_hll_global $P1905, ["PAST"], "Op"
.annotate "line", 669
    get_hll_global $P1906, ["PAST"], "Var"
    $P1907 = $P1906."new"("$/" :named("name"))
.annotate "line", 670
    get_hll_global $P1908, ["PAST"], "Op"
.annotate "line", 671
    get_hll_global $P1909, ["PAST"], "Var"
    $P1910 = $P1909."new"(unicode:"$\x{a2}" :named("name"))
    $P1911 = $P1908."new"($P1910, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 670
    $P1912 = $P1905."new"($P1907, $P1911, "bind" :named("pasttype"))
.annotate "line", 668
    find_lex $P1913, "$block"
    $P1914 = $P1904."new"($P1912, $P1913)
.annotate "line", 667
    $P1915 = $P1903."new"($P1914, "pastnode" :named("pasttype"))
.annotate "line", 666
    store_lex "$past", $P1915
.annotate "line", 681
    find_lex $P1916, "$/"
    find_lex $P1917, "$past"
    $P1918 = $P1916."!make"($P1917)
.annotate "line", 662
    .return ($P1918)
  control_1894:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1919, exception, "payload"
    .return ($P1919)
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
