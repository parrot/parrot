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
.sub "_block11"  :anon :subid("10_1258129007.74018")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1056 = $P14()
.annotate "line", 1
    .return ($P1056)
.end


.namespace []
.sub "" :load :init :subid("post305") :outer("10_1258129007.74018")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258129007.74018" 
    .local pmc block
    set block, $P12
    $P1057 = get_root_global ["parrot"], "P6metaclass"
    $P1057."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258129007.74018") :outer("10_1258129007.74018")
.annotate "line", 4
    get_hll_global $P1006, ["NQP";"Regex"], "_block1005" 
    capture_lex $P1006
    .const 'Sub' $P999 = "290_1258129007.74018" 
    capture_lex $P999
    .const 'Sub' $P993 = "288_1258129007.74018" 
    capture_lex $P993
    .const 'Sub' $P987 = "286_1258129007.74018" 
    capture_lex $P987
    .const 'Sub' $P981 = "284_1258129007.74018" 
    capture_lex $P981
    .const 'Sub' $P976 = "282_1258129007.74018" 
    capture_lex $P976
    .const 'Sub' $P970 = "280_1258129007.74018" 
    capture_lex $P970
    .const 'Sub' $P964 = "278_1258129007.74018" 
    capture_lex $P964
    .const 'Sub' $P958 = "276_1258129007.74018" 
    capture_lex $P958
    .const 'Sub' $P952 = "274_1258129007.74018" 
    capture_lex $P952
    .const 'Sub' $P946 = "272_1258129007.74018" 
    capture_lex $P946
    .const 'Sub' $P940 = "270_1258129007.74018" 
    capture_lex $P940
    .const 'Sub' $P934 = "268_1258129007.74018" 
    capture_lex $P934
    .const 'Sub' $P928 = "266_1258129007.74018" 
    capture_lex $P928
    .const 'Sub' $P922 = "264_1258129007.74018" 
    capture_lex $P922
    .const 'Sub' $P916 = "262_1258129007.74018" 
    capture_lex $P916
    .const 'Sub' $P910 = "260_1258129007.74018" 
    capture_lex $P910
    .const 'Sub' $P904 = "258_1258129007.74018" 
    capture_lex $P904
    .const 'Sub' $P898 = "256_1258129007.74018" 
    capture_lex $P898
    .const 'Sub' $P892 = "254_1258129007.74018" 
    capture_lex $P892
    .const 'Sub' $P886 = "252_1258129007.74018" 
    capture_lex $P886
    .const 'Sub' $P880 = "250_1258129007.74018" 
    capture_lex $P880
    .const 'Sub' $P874 = "248_1258129007.74018" 
    capture_lex $P874
    .const 'Sub' $P868 = "246_1258129007.74018" 
    capture_lex $P868
    .const 'Sub' $P862 = "244_1258129007.74018" 
    capture_lex $P862
    .const 'Sub' $P856 = "242_1258129007.74018" 
    capture_lex $P856
    .const 'Sub' $P850 = "240_1258129007.74018" 
    capture_lex $P850
    .const 'Sub' $P844 = "238_1258129007.74018" 
    capture_lex $P844
    .const 'Sub' $P838 = "236_1258129007.74018" 
    capture_lex $P838
    .const 'Sub' $P832 = "234_1258129007.74018" 
    capture_lex $P832
    .const 'Sub' $P826 = "232_1258129007.74018" 
    capture_lex $P826
    .const 'Sub' $P820 = "230_1258129007.74018" 
    capture_lex $P820
    .const 'Sub' $P814 = "228_1258129007.74018" 
    capture_lex $P814
    .const 'Sub' $P808 = "226_1258129007.74018" 
    capture_lex $P808
    .const 'Sub' $P802 = "224_1258129007.74018" 
    capture_lex $P802
    .const 'Sub' $P796 = "222_1258129007.74018" 
    capture_lex $P796
    .const 'Sub' $P790 = "220_1258129007.74018" 
    capture_lex $P790
    .const 'Sub' $P784 = "218_1258129007.74018" 
    capture_lex $P784
    .const 'Sub' $P778 = "216_1258129007.74018" 
    capture_lex $P778
    .const 'Sub' $P773 = "214_1258129007.74018" 
    capture_lex $P773
    .const 'Sub' $P768 = "212_1258129007.74018" 
    capture_lex $P768
    .const 'Sub' $P764 = "210_1258129007.74018" 
    capture_lex $P764
    .const 'Sub' $P759 = "208_1258129007.74018" 
    capture_lex $P759
    .const 'Sub' $P754 = "206_1258129007.74018" 
    capture_lex $P754
    .const 'Sub' $P750 = "204_1258129007.74018" 
    capture_lex $P750
    .const 'Sub' $P746 = "202_1258129007.74018" 
    capture_lex $P746
    .const 'Sub' $P740 = "200_1258129007.74018" 
    capture_lex $P740
    .const 'Sub' $P734 = "198_1258129007.74018" 
    capture_lex $P734
    .const 'Sub' $P727 = "196_1258129007.74018" 
    capture_lex $P727
    .const 'Sub' $P723 = "194_1258129007.74018" 
    capture_lex $P723
    .const 'Sub' $P719 = "192_1258129007.74018" 
    capture_lex $P719
    .const 'Sub' $P712 = "190_1258129007.74018" 
    capture_lex $P712
    .const 'Sub' $P705 = "188_1258129007.74018" 
    capture_lex $P705
    .const 'Sub' $P701 = "186_1258129007.74018" 
    capture_lex $P701
    .const 'Sub' $P697 = "184_1258129007.74018" 
    capture_lex $P697
    .const 'Sub' $P692 = "182_1258129007.74018" 
    capture_lex $P692
    .const 'Sub' $P687 = "180_1258129007.74018" 
    capture_lex $P687
    .const 'Sub' $P682 = "178_1258129007.74018" 
    capture_lex $P682
    .const 'Sub' $P677 = "176_1258129007.74018" 
    capture_lex $P677
    .const 'Sub' $P673 = "174_1258129007.74018" 
    capture_lex $P673
    .const 'Sub' $P669 = "172_1258129007.74018" 
    capture_lex $P669
    .const 'Sub' $P657 = "168_1258129007.74018" 
    capture_lex $P657
    .const 'Sub' $P652 = "166_1258129007.74018" 
    capture_lex $P652
    .const 'Sub' $P646 = "164_1258129007.74018" 
    capture_lex $P646
    .const 'Sub' $P641 = "162_1258129007.74018" 
    capture_lex $P641
    .const 'Sub' $P634 = "160_1258129007.74018" 
    capture_lex $P634
    .const 'Sub' $P627 = "158_1258129007.74018" 
    capture_lex $P627
    .const 'Sub' $P622 = "156_1258129007.74018" 
    capture_lex $P622
    .const 'Sub' $P617 = "154_1258129007.74018" 
    capture_lex $P617
    .const 'Sub' $P605 = "150_1258129007.74018" 
    capture_lex $P605
    .const 'Sub' $P574 = "148_1258129007.74018" 
    capture_lex $P574
    .const 'Sub' $P567 = "146_1258129007.74018" 
    capture_lex $P567
    .const 'Sub' $P562 = "144_1258129007.74018" 
    capture_lex $P562
    .const 'Sub' $P553 = "142_1258129007.74018" 
    capture_lex $P553
    .const 'Sub' $P539 = "140_1258129007.74018" 
    capture_lex $P539
    .const 'Sub' $P531 = "138_1258129007.74018" 
    capture_lex $P531
    .const 'Sub' $P513 = "136_1258129007.74018" 
    capture_lex $P513
    .const 'Sub' $P495 = "134_1258129007.74018" 
    capture_lex $P495
    .const 'Sub' $P489 = "132_1258129007.74018" 
    capture_lex $P489
    .const 'Sub' $P483 = "130_1258129007.74018" 
    capture_lex $P483
    .const 'Sub' $P474 = "126_1258129007.74018" 
    capture_lex $P474
    .const 'Sub' $P464 = "124_1258129007.74018" 
    capture_lex $P464
    .const 'Sub' $P458 = "122_1258129007.74018" 
    capture_lex $P458
    .const 'Sub' $P452 = "120_1258129007.74018" 
    capture_lex $P452
    .const 'Sub' $P446 = "118_1258129007.74018" 
    capture_lex $P446
    .const 'Sub' $P420 = "114_1258129007.74018" 
    capture_lex $P420
    .const 'Sub' $P412 = "112_1258129007.74018" 
    capture_lex $P412
    .const 'Sub' $P406 = "110_1258129007.74018" 
    capture_lex $P406
    .const 'Sub' $P398 = "106_1258129007.74018" 
    capture_lex $P398
    .const 'Sub' $P394 = "104_1258129007.74018" 
    capture_lex $P394
    .const 'Sub' $P383 = "102_1258129007.74018" 
    capture_lex $P383
    .const 'Sub' $P373 = "100_1258129007.74018" 
    capture_lex $P373
    .const 'Sub' $P369 = "98_1258129007.74018" 
    capture_lex $P369
    .const 'Sub' $P364 = "96_1258129007.74018" 
    capture_lex $P364
    .const 'Sub' $P359 = "94_1258129007.74018" 
    capture_lex $P359
    .const 'Sub' $P354 = "92_1258129007.74018" 
    capture_lex $P354
    .const 'Sub' $P349 = "90_1258129007.74018" 
    capture_lex $P349
    .const 'Sub' $P344 = "88_1258129007.74018" 
    capture_lex $P344
    .const 'Sub' $P339 = "86_1258129007.74018" 
    capture_lex $P339
    .const 'Sub' $P334 = "84_1258129007.74018" 
    capture_lex $P334
    .const 'Sub' $P327 = "82_1258129007.74018" 
    capture_lex $P327
    .const 'Sub' $P320 = "80_1258129007.74018" 
    capture_lex $P320
    .const 'Sub' $P311 = "76_1258129007.74018" 
    capture_lex $P311
    .const 'Sub' $P305 = "74_1258129007.74018" 
    capture_lex $P305
    .const 'Sub' $P289 = "70_1258129007.74018" 
    capture_lex $P289
    .const 'Sub' $P277 = "68_1258129007.74018" 
    capture_lex $P277
    .const 'Sub' $P270 = "66_1258129007.74018" 
    capture_lex $P270
    .const 'Sub' $P251 = "64_1258129007.74018" 
    capture_lex $P251
    .const 'Sub' $P243 = "62_1258129007.74018" 
    capture_lex $P243
    .const 'Sub' $P226 = "59_1258129007.74018" 
    capture_lex $P226
    .const 'Sub' $P207 = "57_1258129007.74018" 
    capture_lex $P207
    .const 'Sub' $P199 = "53_1258129007.74018" 
    capture_lex $P199
    .const 'Sub' $P195 = "51_1258129007.74018" 
    capture_lex $P195
    .const 'Sub' $P187 = "47_1258129007.74018" 
    capture_lex $P187
    .const 'Sub' $P183 = "45_1258129007.74018" 
    capture_lex $P183
    .const 'Sub' $P176 = "43_1258129007.74018" 
    capture_lex $P176
    .const 'Sub' $P170 = "41_1258129007.74018" 
    capture_lex $P170
    .const 'Sub' $P165 = "39_1258129007.74018" 
    capture_lex $P165
    .const 'Sub' $P158 = "37_1258129007.74018" 
    capture_lex $P158
    .const 'Sub' $P153 = "35_1258129007.74018" 
    capture_lex $P153
    .const 'Sub' $P148 = "33_1258129007.74018" 
    capture_lex $P148
    .const 'Sub' $P136 = "30_1258129007.74018" 
    capture_lex $P136
    .const 'Sub' $P124 = "28_1258129007.74018" 
    capture_lex $P124
    .const 'Sub' $P118 = "26_1258129007.74018" 
    capture_lex $P118
    .const 'Sub' $P76 = "23_1258129007.74018" 
    capture_lex $P76
    .const 'Sub' $P67 = "21_1258129007.74018" 
    capture_lex $P67
    .const 'Sub' $P58 = "19_1258129007.74018" 
    capture_lex $P58
    .const 'Sub' $P44 = "17_1258129007.74018" 
    capture_lex $P44
    .const 'Sub' $P38 = "15_1258129007.74018" 
    capture_lex $P38
    .const 'Sub' $P33 = "13_1258129007.74018" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258129007.74018" 
    capture_lex $P15
.annotate "line", 477
    get_hll_global $P1006, ["NQP";"Regex"], "_block1005" 
    capture_lex $P1006
    $P1040 = $P1006()
.annotate "line", 4
    .return ($P1040)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post306") :outer("11_1258129007.74018")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 369
    get_hll_global $P1041, ["NQP"], "Grammar"
    $P1041."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 370
    get_hll_global $P1042, ["NQP"], "Grammar"
    $P1042."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 371
    get_hll_global $P1043, ["NQP"], "Grammar"
    $P1043."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 372
    get_hll_global $P1044, ["NQP"], "Grammar"
    $P1044."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 373
    get_hll_global $P1045, ["NQP"], "Grammar"
    $P1045."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 374
    get_hll_global $P1046, ["NQP"], "Grammar"
    $P1046."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 375
    get_hll_global $P1047, ["NQP"], "Grammar"
    $P1047."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 376
    get_hll_global $P1048, ["NQP"], "Grammar"
    $P1048."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 377
    get_hll_global $P1049, ["NQP"], "Grammar"
    $P1049."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 378
    get_hll_global $P1050, ["NQP"], "Grammar"
    $P1050."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 379
    get_hll_global $P1051, ["NQP"], "Grammar"
    $P1051."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 380
    get_hll_global $P1052, ["NQP"], "Grammar"
    $P1052."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 381
    get_hll_global $P1053, ["NQP"], "Grammar"
    $P1053."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 382
    get_hll_global $P1054, ["NQP"], "Grammar"
    $P1054."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 368
    $P1055 = get_root_global ["parrot"], "P6metaclass"
    $P1055."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258129007.74018") :method :outer("11_1258129007.74018")
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
    unless_null $P20, vivify_307
    die "Contextual %*LANG not found"
  vivify_307:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_308
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P22
  vivify_308:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_309
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P24
  vivify_309:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_310
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P26
  vivify_310:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_311
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P28
  vivify_311:
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
.sub "identifier"  :subid("13_1258129007.74018") :method :outer("11_1258129007.74018")
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
.sub "!PREFIX__identifier"  :subid("14_1258129007.74018") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258129007.74018") :method :outer("11_1258129007.74018")
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
.sub "!PREFIX__name"  :subid("16_1258129007.74018") :method
.annotate "line", 4
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258129007.74018") :method :outer("11_1258129007.74018")
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
.sub "!PREFIX__deflongname"  :subid("18_1258129007.74018") :method
.annotate "line", 4
    $P47 = self."!PREFIX__!subrule"("identifier", "")
    new $P48, "ResizablePMCArray"
    push $P48, $P47
    .return ($P48)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258129007.74018") :method :outer("11_1258129007.74018")
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
.annotate "line", 26
  # rx rxquantr62 ** 0..1
    set_addr $I66, rxquantr62_done
    rx59_cur."!mark_push"(0, rx59_pos, $I66)
  rxquantr62_loop:
  # rx rxquantr63 ** 0..*
    set_addr $I64, rxquantr63_done
    rx59_cur."!mark_push"(0, rx59_pos, $I64)
  rxquantr63_loop:
  # rx enumcharlist negate=0 
    ge rx59_pos, rx59_eos, rx59_fail
    sub $I10, rx59_pos, rx59_off
    substr $S10, rx59_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx59_fail
    inc rx59_pos
    (rx59_rep) = rx59_cur."!mark_commit"($I64)
    rx59_cur."!mark_push"(rx59_rep, rx59_pos, $I64)
    goto rxquantr63_loop
  rxquantr63_done:
  # rxanchor eol
    sub $I10, rx59_pos, rx59_off
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rxanchor65_done
    ne rx59_pos, rx59_eos, rx59_fail
    eq rx59_pos, 0, rxanchor65_done
    dec $I10
    is_cclass $I11, 4096, rx59_tgt, $I10
    if $I11, rx59_fail
  rxanchor65_done:
  # rx subrule "ws" subtype=method negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."ws"()
    unless $P10, rx59_fail
    rx59_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx59_cur."!cursor_pos"(rx59_pos)
    $P10 = rx59_cur."MARKER"("endstmt")
    unless $P10, rx59_fail
    (rx59_rep) = rx59_cur."!mark_commit"($I66)
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258129007.74018") :method
.annotate "line", 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx68_tgt
    .local int rx68_pos
    .local int rx68_off
    .local int rx68_eos
    .local int rx68_rep
    .local pmc rx68_cur
    (rx68_cur, rx68_pos, rx68_tgt, $I10) = self."!cursor_start"()
    rx68_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx68_cur
    .local pmc match
    .lex "$/", match
    length rx68_eos, rx68_tgt
    set rx68_off, 0
    lt $I10, 2, rx68_start
    sub rx68_off, $I10, 1
    substr rx68_tgt, rx68_tgt, rx68_off
  rx68_start:
  alt71_0:
.annotate "line", 29
    set_addr $I10, alt71_1
    rx68_cur."!mark_push"(0, rx68_pos, $I10)
.annotate "line", 30
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."MARKED"("ws")
    unless $P10, rx68_fail
    goto alt71_end
  alt71_1:
.annotate "line", 31
  # rx subrule "ww" subtype=zerowidth negate=1
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."ww"()
    if $P10, rx68_fail
.annotate "line", 35
  # rx rxquantr72 ** 0..*
    set_addr $I75, rxquantr72_done
    rx68_cur."!mark_push"(0, rx68_pos, $I75)
  rxquantr72_loop:
  alt73_0:
.annotate "line", 32
    set_addr $I10, alt73_1
    rx68_cur."!mark_push"(0, rx68_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx68_pos, rx68_off
    find_not_cclass $I11, 32, rx68_tgt, $I10, rx68_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx68_fail
    add rx68_pos, rx68_off, $I11
    goto alt73_end
  alt73_1:
    set_addr $I10, alt73_2
    rx68_cur."!mark_push"(0, rx68_pos, $I10)
.annotate "line", 33
  # rx literal  "#"
    add $I11, rx68_pos, 1
    gt $I11, rx68_eos, rx68_fail
    sub $I11, rx68_pos, rx68_off
    substr $S10, rx68_tgt, $I11, 1
    ne $S10, "#", rx68_fail
    add rx68_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx68_pos, rx68_off
    find_cclass $I11, 4096, rx68_tgt, $I10, rx68_eos
    add rx68_pos, rx68_off, $I11
    goto alt73_end
  alt73_2:
.annotate "line", 34
  # rxanchor bol
    eq rx68_pos, 0, rxanchor74_done
    ge rx68_pos, rx68_eos, rx68_fail
    sub $I10, rx68_pos, rx68_off
    dec $I10
    is_cclass $I11, 4096, rx68_tgt, $I10
    unless $I11, rx68_fail
  rxanchor74_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."pod_comment"()
    unless $P10, rx68_fail
    rx68_pos = $P10."pos"()
  alt73_end:
.annotate "line", 35
    (rx68_rep) = rx68_cur."!mark_commit"($I75)
    rx68_cur."!mark_push"(rx68_rep, rx68_pos, $I75)
    goto rxquantr72_loop
  rxquantr72_done:
.annotate "line", 36
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx68_cur."!cursor_pos"(rx68_pos)
    $P10 = rx68_cur."MARKER"("ws")
    unless $P10, rx68_fail
  alt71_end:
.annotate "line", 29
  # rx pass
    rx68_cur."!cursor_pass"(rx68_pos, "ws")
    rx68_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx68_pos)
    .return (rx68_cur)
  rx68_fail:
.annotate "line", 4
    (rx68_rep, rx68_pos, $I10, $P10) = rx68_cur."!mark_fail"(0)
    lt rx68_pos, -1, rx68_done
    eq rx68_pos, -1, rx68_fail
    jump $I10
  rx68_done:
    rx68_cur."!cursor_fail"()
    rx68_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx68_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1258129007.74018") :method
.annotate "line", 4
    new $P70, "ResizablePMCArray"
    push $P70, ""
    push $P70, ""
    .return ($P70)
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("23_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .const 'Sub' $P110 = "25_1258129007.74018" 
    capture_lex $P110
    .local string rx77_tgt
    .local int rx77_pos
    .local int rx77_off
    .local int rx77_eos
    .local int rx77_rep
    .local pmc rx77_cur
    (rx77_cur, rx77_pos, rx77_tgt, $I10) = self."!cursor_start"()
    rx77_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx77_cur
    .local pmc match
    .lex "$/", match
    length rx77_eos, rx77_tgt
    set rx77_off, 0
    lt $I10, 2, rx77_start
    sub rx77_off, $I10, 1
    substr rx77_tgt, rx77_tgt, rx77_off
  rx77_start:
.annotate "line", 40
  # rxanchor bol
    eq rx77_pos, 0, rxanchor80_done
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    dec $I10
    is_cclass $I11, 4096, rx77_tgt, $I10
    unless $I11, rx77_fail
  rxanchor80_done:
  # rx rxquantr81 ** 0..*
    set_addr $I82, rxquantr81_done
    rx77_cur."!mark_push"(0, rx77_pos, $I82)
  rxquantr81_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I82)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I82)
    goto rxquantr81_loop
  rxquantr81_done:
  # rx literal  "="
    add $I11, rx77_pos, 1
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 1
    ne $S10, "=", rx77_fail
    add rx77_pos, 1
  alt83_0:
.annotate "line", 41
    set_addr $I10, alt83_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
.annotate "line", 42
  # rx literal  "begin"
    add $I11, rx77_pos, 5
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 5
    ne $S10, "begin", rx77_fail
    add rx77_pos, 5
  # rx rxquantr84 ** 1..*
    set_addr $I85, rxquantr84_done
    rx77_cur."!mark_push"(0, -1, $I85)
  rxquantr84_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I85)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I85)
    goto rxquantr84_loop
  rxquantr84_done:
  # rx literal  "END"
    add $I11, rx77_pos, 3
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 3
    ne $S10, "END", rx77_fail
    add rx77_pos, 3
  # rxanchor rwb
    le rx77_pos, 0, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 8192, rx77_tgt, $I10
    if $I11, rx77_fail
    dec $I10
    is_cclass $I11, 8192, rx77_tgt, $I10
    unless $I11, rx77_fail
  alt86_0:
.annotate "line", 43
    set_addr $I10, alt86_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rx rxquantf87 ** 0..*
    set_addr $I10, rxquantf87_loop
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
    goto rxquantf87_done
  rxquantf87_loop:
  # rx charclass .
    ge rx77_pos, rx77_eos, rx77_fail
    inc rx77_pos
    set_addr $I10, rxquantf87_loop
    rx77_cur."!mark_push"($I88, rx77_pos, $I10)
  rxquantf87_done:
  # rx charclass nl
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 4096, rx77_tgt, $I10
    unless $I11, rx77_fail
    substr $S10, rx77_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx77_pos, $I11
    inc rx77_pos
  # rx literal  "=end"
    add $I11, rx77_pos, 4
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 4
    ne $S10, "=end", rx77_fail
    add rx77_pos, 4
  # rx rxquantr89 ** 1..*
    set_addr $I90, rxquantr89_done
    rx77_cur."!mark_push"(0, -1, $I90)
  rxquantr89_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I90)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I90)
    goto rxquantr89_loop
  rxquantr89_done:
  # rx literal  "END"
    add $I11, rx77_pos, 3
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 3
    ne $S10, "END", rx77_fail
    add rx77_pos, 3
  # rxanchor rwb
    le rx77_pos, 0, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 8192, rx77_tgt, $I10
    if $I11, rx77_fail
    dec $I10
    is_cclass $I11, 8192, rx77_tgt, $I10
    unless $I11, rx77_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx77_pos, rx77_off
    find_cclass $I11, 4096, rx77_tgt, $I10, rx77_eos
    add rx77_pos, rx77_off, $I11
    goto alt86_end
  alt86_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx77_pos, rx77_off
    find_not_cclass $I11, 65535, rx77_tgt, $I10, rx77_eos
    add rx77_pos, rx77_off, $I11
  alt86_end:
.annotate "line", 42
    goto alt83_end
  alt83_1:
    set_addr $I10, alt83_2
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
.annotate "line", 44
  # rx literal  "begin"
    add $I11, rx77_pos, 5
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 5
    ne $S10, "begin", rx77_fail
    add rx77_pos, 5
  # rx rxquantr91 ** 1..*
    set_addr $I92, rxquantr91_done
    rx77_cur."!mark_push"(0, -1, $I92)
  rxquantr91_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I92)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I92)
    goto rxquantr91_loop
  rxquantr91_done:
  # rx subrule "identifier" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."identifier"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx77_pos = $P10."pos"()
  alt93_0:
.annotate "line", 45
    set_addr $I10, alt93_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
.annotate "line", 46
  # rx rxquantf94 ** 0..*
    set_addr $I10, rxquantf94_loop
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
    goto rxquantf94_done
  rxquantf94_loop:
  # rx charclass .
    ge rx77_pos, rx77_eos, rx77_fail
    inc rx77_pos
    set_addr $I10, rxquantf94_loop
    rx77_cur."!mark_push"($I95, rx77_pos, $I10)
  rxquantf94_done:
  # rx charclass nl
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 4096, rx77_tgt, $I10
    unless $I11, rx77_fail
    substr $S10, rx77_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx77_pos, $I11
    inc rx77_pos
  # rx literal  "=end"
    add $I11, rx77_pos, 4
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 4
    ne $S10, "=end", rx77_fail
    add rx77_pos, 4
  # rx rxquantr96 ** 1..*
    set_addr $I97, rxquantr96_done
    rx77_cur."!mark_push"(0, -1, $I97)
  rxquantr96_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I97)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I97)
    goto rxquantr96_loop
  rxquantr96_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."!BACKREF"("identifier")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  # rxanchor rwb
    le rx77_pos, 0, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 8192, rx77_tgt, $I10
    if $I11, rx77_fail
    dec $I10
    is_cclass $I11, 8192, rx77_tgt, $I10
    unless $I11, rx77_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx77_pos, rx77_off
    find_cclass $I11, 4096, rx77_tgt, $I10, rx77_eos
    add rx77_pos, rx77_off, $I11
    goto alt93_end
  alt93_1:
.annotate "line", 47
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("=begin without matching =end")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  alt93_end:
.annotate "line", 44
    goto alt83_end
  alt83_2:
    set_addr $I10, alt83_3
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
.annotate "line", 49
  # rx literal  "begin"
    add $I11, rx77_pos, 5
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 5
    ne $S10, "begin", rx77_fail
    add rx77_pos, 5
  # rxanchor rwb
    le rx77_pos, 0, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 8192, rx77_tgt, $I10
    if $I11, rx77_fail
    dec $I10
    is_cclass $I11, 8192, rx77_tgt, $I10
    unless $I11, rx77_fail
  # rx rxquantr99 ** 0..*
    set_addr $I100, rxquantr99_done
    rx77_cur."!mark_push"(0, rx77_pos, $I100)
  rxquantr99_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I100)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I100)
    goto rxquantr99_loop
  rxquantr99_done:
  alt101_0:
.annotate "line", 50
    set_addr $I10, alt101_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rxanchor eol
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 4096, rx77_tgt, $I10
    if $I11, rxanchor102_done
    ne rx77_pos, rx77_eos, rx77_fail
    eq rx77_pos, 0, rxanchor102_done
    dec $I10
    is_cclass $I11, 4096, rx77_tgt, $I10
    if $I11, rx77_fail
  rxanchor102_done:
    goto alt101_end
  alt101_1:
    set_addr $I10, alt101_2
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rx literal  "#"
    add $I11, rx77_pos, 1
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 1
    ne $S10, "#", rx77_fail
    add rx77_pos, 1
    goto alt101_end
  alt101_2:
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  alt101_end:
  alt103_0:
.annotate "line", 51
    set_addr $I10, alt103_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
.annotate "line", 52
  # rx rxquantf104 ** 0..*
    set_addr $I10, rxquantf104_loop
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
    goto rxquantf104_done
  rxquantf104_loop:
  # rx charclass .
    ge rx77_pos, rx77_eos, rx77_fail
    inc rx77_pos
    set_addr $I10, rxquantf104_loop
    rx77_cur."!mark_push"($I105, rx77_pos, $I10)
  rxquantf104_done:
  # rx charclass nl
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 4096, rx77_tgt, $I10
    unless $I11, rx77_fail
    substr $S10, rx77_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx77_pos, $I11
    inc rx77_pos
  # rx rxquantr106 ** 0..*
    set_addr $I107, rxquantr106_done
    rx77_cur."!mark_push"(0, rx77_pos, $I107)
  rxquantr106_loop:
  # rx enumcharlist negate=0 
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx77_fail
    inc rx77_pos
    (rx77_rep) = rx77_cur."!mark_commit"($I107)
    rx77_cur."!mark_push"(rx77_rep, rx77_pos, $I107)
    goto rxquantr106_loop
  rxquantr106_done:
  # rx literal  "=end"
    add $I11, rx77_pos, 4
    gt $I11, rx77_eos, rx77_fail
    sub $I11, rx77_pos, rx77_off
    substr $S10, rx77_tgt, $I11, 4
    ne $S10, "=end", rx77_fail
    add rx77_pos, 4
  # rxanchor rwb
    le rx77_pos, 0, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 8192, rx77_tgt, $I10
    if $I11, rx77_fail
    dec $I10
    is_cclass $I11, 8192, rx77_tgt, $I10
    unless $I11, rx77_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx77_pos, rx77_off
    find_cclass $I11, 4096, rx77_tgt, $I10, rx77_eos
    add rx77_pos, rx77_off, $I11
    goto alt103_end
  alt103_1:
.annotate "line", 53
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("=begin without matching =end")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  alt103_end:
.annotate "line", 49
    goto alt83_end
  alt83_3:
.annotate "line", 57
  # rx rxquantr108 ** 0..1
    set_addr $I116, rxquantr108_done
    rx77_cur."!mark_push"(0, rx77_pos, $I116)
  rxquantr108_loop:
.annotate "line", 56
  # rx subrule "before" subtype=zerowidth negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    .const 'Sub' $P110 = "25_1258129007.74018" 
    capture_lex $P110
    $P10 = rx77_cur."before"($P110)
    unless $P10, rx77_fail
.annotate "line", 57
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
    (rx77_rep) = rx77_cur."!mark_commit"($I116)
  rxquantr108_done:
  alt117_0:
.annotate "line", 58
    set_addr $I10, alt117_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."alpha"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx77_pos = $P10."pos"()
    goto alt117_end
  alt117_1:
    set_addr $I10, alt117_2
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rx charclass s
    ge rx77_pos, rx77_eos, rx77_fail
    sub $I10, rx77_pos, rx77_off
    is_cclass $I11, 32, rx77_tgt, $I10
    unless $I11, rx77_fail
    inc rx77_pos
    goto alt117_end
  alt117_2:
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("Illegal pod directive")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  alt117_end:
.annotate "line", 59
  # rx charclass_q N r 0..-1
    sub $I10, rx77_pos, rx77_off
    find_cclass $I11, 4096, rx77_tgt, $I10, rx77_eos
    add rx77_pos, rx77_off, $I11
  alt83_end:
.annotate "line", 39
  # rx pass
    rx77_cur."!cursor_pass"(rx77_pos, "pod_comment")
    rx77_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx77_pos)
    .return (rx77_cur)
  rx77_fail:
.annotate "line", 4
    (rx77_rep, rx77_pos, $I10, $P10) = rx77_cur."!mark_fail"(0)
    lt rx77_pos, -1, rx77_done
    eq rx77_pos, -1, rx77_fail
    jump $I10
  rx77_done:
    rx77_cur."!cursor_fail"()
    rx77_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx77_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("24_1258129007.74018") :method
.annotate "line", 4
    new $P79, "ResizablePMCArray"
    push $P79, ""
    .return ($P79)
.end


.namespace ["NQP";"Grammar"]
.sub "_block109"  :anon :subid("25_1258129007.74018") :method :outer("23_1258129007.74018")
.annotate "line", 56
    .local string rx111_tgt
    .local int rx111_pos
    .local int rx111_off
    .local int rx111_eos
    .local int rx111_rep
    .local pmc rx111_cur
    (rx111_cur, rx111_pos, rx111_tgt, $I10) = self."!cursor_start"()
    rx111_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx111_cur
    .local pmc match
    .lex "$/", match
    length rx111_eos, rx111_tgt
    set rx111_off, 0
    lt $I10, 2, rx111_start
    sub rx111_off, $I10, 1
    substr rx111_tgt, rx111_tgt, rx111_off
  rx111_start:
    ge rx111_pos, 0, rxscan112_done
  rxscan112_loop:
    ($P10) = rx111_cur."from"()
    inc $P10
    set rx111_pos, $P10
    ge rx111_pos, rx111_eos, rxscan112_done
    set_addr $I10, rxscan112_loop
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
  rxscan112_done:
  # rx rxquantf113 ** 0..*
    set_addr $I10, rxquantf113_loop
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
    goto rxquantf113_done
  rxquantf113_loop:
  # rx charclass .
    ge rx111_pos, rx111_eos, rx111_fail
    inc rx111_pos
    set_addr $I10, rxquantf113_loop
    rx111_cur."!mark_push"($I114, rx111_pos, $I10)
  rxquantf113_done:
  # rxanchor bol
    eq rx111_pos, 0, rxanchor115_done
    ge rx111_pos, rx111_eos, rx111_fail
    sub $I10, rx111_pos, rx111_off
    dec $I10
    is_cclass $I11, 4096, rx111_tgt, $I10
    unless $I11, rx111_fail
  rxanchor115_done:
  # rx literal  "=cut"
    add $I11, rx111_pos, 4
    gt $I11, rx111_eos, rx111_fail
    sub $I11, rx111_pos, rx111_off
    substr $S10, rx111_tgt, $I11, 4
    ne $S10, "=cut", rx111_fail
    add rx111_pos, 4
  # rxanchor rwb
    le rx111_pos, 0, rx111_fail
    sub $I10, rx111_pos, rx111_off
    is_cclass $I11, 8192, rx111_tgt, $I10
    if $I11, rx111_fail
    dec $I10
    is_cclass $I11, 8192, rx111_tgt, $I10
    unless $I11, rx111_fail
  # rx pass
    rx111_cur."!cursor_pass"(rx111_pos, "")
    rx111_cur."!cursor_debug"("PASS  ", "", " at pos=", rx111_pos)
    .return (rx111_cur)
  rx111_fail:
    (rx111_rep, rx111_pos, $I10, $P10) = rx111_cur."!mark_fail"(0)
    lt rx111_pos, -1, rx111_done
    eq rx111_pos, -1, rx111_fail
    jump $I10
  rx111_done:
    rx111_cur."!cursor_fail"()
    rx111_cur."!cursor_debug"("FAIL  ", "")
    .return (rx111_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("26_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx119_tgt
    .local int rx119_pos
    .local int rx119_off
    .local int rx119_eos
    .local int rx119_rep
    .local pmc rx119_cur
    (rx119_cur, rx119_pos, rx119_tgt, $I10) = self."!cursor_start"()
    rx119_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx119_cur
    .local pmc match
    .lex "$/", match
    length rx119_eos, rx119_tgt
    set rx119_off, 0
    lt $I10, 2, rx119_start
    sub rx119_off, $I10, 1
    substr rx119_tgt, rx119_tgt, rx119_off
  rx119_start:
.annotate "line", 67
  # rx subrule "newpad" subtype=method negate=
    rx119_cur."!cursor_pos"(rx119_pos)
    $P10 = rx119_cur."newpad"()
    unless $P10, rx119_fail
    rx119_pos = $P10."pos"()
.annotate "line", 68
  # rx subrule "statementlist" subtype=capture negate=
    rx119_cur."!cursor_pos"(rx119_pos)
    $P10 = rx119_cur."statementlist"()
    unless $P10, rx119_fail
    rx119_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx119_pos = $P10."pos"()
  alt123_0:
.annotate "line", 69
    set_addr $I10, alt123_1
    rx119_cur."!mark_push"(0, rx119_pos, $I10)
  # rxanchor eos
    ne rx119_pos, rx119_eos, rx119_fail
    goto alt123_end
  alt123_1:
  # rx subrule "panic" subtype=method negate=
    rx119_cur."!cursor_pos"(rx119_pos)
    $P10 = rx119_cur."panic"("Confused")
    unless $P10, rx119_fail
    rx119_pos = $P10."pos"()
  alt123_end:
.annotate "line", 66
  # rx pass
    rx119_cur."!cursor_pass"(rx119_pos, "comp_unit")
    rx119_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx119_pos)
    .return (rx119_cur)
  rx119_fail:
.annotate "line", 4
    (rx119_rep, rx119_pos, $I10, $P10) = rx119_cur."!mark_fail"(0)
    lt rx119_pos, -1, rx119_done
    eq rx119_pos, -1, rx119_fail
    jump $I10
  rx119_done:
    rx119_cur."!cursor_fail"()
    rx119_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx119_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("27_1258129007.74018") :method
.annotate "line", 4
    $P121 = self."!PREFIX__!subrule"("newpad", "")
    new $P122, "ResizablePMCArray"
    push $P122, $P121
    .return ($P122)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("28_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx125_tgt
    .local int rx125_pos
    .local int rx125_off
    .local int rx125_eos
    .local int rx125_rep
    .local pmc rx125_cur
    (rx125_cur, rx125_pos, rx125_tgt, $I10) = self."!cursor_start"()
    rx125_cur."!cursor_debug"("START ", "statementlist")
    rx125_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx125_cur
    .local pmc match
    .lex "$/", match
    length rx125_eos, rx125_tgt
    set rx125_off, 0
    lt $I10, 2, rx125_start
    sub rx125_off, $I10, 1
    substr rx125_tgt, rx125_tgt, rx125_off
  rx125_start:
  alt128_0:
.annotate "line", 72
    set_addr $I10, alt128_1
    rx125_cur."!mark_push"(0, rx125_pos, $I10)
.annotate "line", 73
  # rx subrule "ws" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."ws"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
  # rxanchor eos
    ne rx125_pos, rx125_eos, rx125_fail
  # rx subrule "ws" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."ws"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
    goto alt128_end
  alt128_1:
.annotate "line", 74
  # rx subrule "ws" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."ws"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
  # rx rxquantr132 ** 0..*
    set_addr $I134, rxquantr132_done
    rx125_cur."!mark_push"(0, rx125_pos, $I134)
  rxquantr132_loop:
  # rx subrule "statement" subtype=capture negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."statement"()
    unless $P10, rx125_fail
    rx125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx125_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."eat_terminator"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."ws"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
    (rx125_rep) = rx125_cur."!mark_commit"($I134)
    rx125_cur."!mark_push"(rx125_rep, rx125_pos, $I134)
    goto rxquantr132_loop
  rxquantr132_done:
  # rx subrule "ws" subtype=method negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."ws"()
    unless $P10, rx125_fail
    rx125_pos = $P10."pos"()
  alt128_end:
.annotate "line", 72
  # rx pass
    rx125_cur."!cursor_pass"(rx125_pos, "statementlist")
    rx125_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx125_pos)
    .return (rx125_cur)
  rx125_fail:
.annotate "line", 4
    (rx125_rep, rx125_pos, $I10, $P10) = rx125_cur."!mark_fail"(0)
    lt rx125_pos, -1, rx125_done
    eq rx125_pos, -1, rx125_fail
    jump $I10
  rx125_done:
    rx125_cur."!cursor_fail"()
    rx125_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx125_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("29_1258129007.74018") :method
.annotate "line", 4
    new $P127, "ResizablePMCArray"
    push $P127, ""
    push $P127, ""
    .return ($P127)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("30_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .const 'Sub' $P141 = "32_1258129007.74018" 
    capture_lex $P141
    .local string rx137_tgt
    .local int rx137_pos
    .local int rx137_off
    .local int rx137_eos
    .local int rx137_rep
    .local pmc rx137_cur
    (rx137_cur, rx137_pos, rx137_tgt, $I10) = self."!cursor_start"()
    rx137_cur."!cursor_debug"("START ", "statement")
    rx137_cur."!cursor_caparray"("statement_mod_cond")
    .lex unicode:"$\x{a2}", rx137_cur
    .local pmc match
    .lex "$/", match
    length rx137_eos, rx137_tgt
    set rx137_off, 0
    lt $I10, 2, rx137_start
    sub rx137_off, $I10, 1
    substr rx137_tgt, rx137_tgt, rx137_off
  rx137_start:
.annotate "line", 78
  # rx subrule "before" subtype=zerowidth negate=1
    rx137_cur."!cursor_pos"(rx137_pos)
    .const 'Sub' $P141 = "32_1258129007.74018" 
    capture_lex $P141
    $P10 = rx137_cur."before"($P141)
    if $P10, rx137_fail
  alt145_0:
.annotate "line", 79
    set_addr $I10, alt145_1
    rx137_cur."!mark_push"(0, rx137_pos, $I10)
.annotate "line", 80
  # rx subrule "statement_control" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."statement_control"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx137_pos = $P10."pos"()
    goto alt145_end
  alt145_1:
.annotate "line", 81
  # rx subrule "EXPR" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."EXPR"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx137_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."ws"()
    unless $P10, rx137_fail
    rx137_pos = $P10."pos"()
.annotate "line", 84
  # rx rxquantr146 ** 0..1
    set_addr $I147, rxquantr146_done
    rx137_cur."!mark_push"(0, rx137_pos, $I147)
  rxquantr146_loop:
.annotate "line", 83
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."statement_mod_cond"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx137_pos = $P10."pos"()
.annotate "line", 84
    (rx137_rep) = rx137_cur."!mark_commit"($I147)
  rxquantr146_done:
  alt145_end:
.annotate "line", 77
  # rx pass
    rx137_cur."!cursor_pass"(rx137_pos, "statement")
    rx137_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx137_pos)
    .return (rx137_cur)
  rx137_fail:
.annotate "line", 4
    (rx137_rep, rx137_pos, $I10, $P10) = rx137_cur."!mark_fail"(0)
    lt rx137_pos, -1, rx137_done
    eq rx137_pos, -1, rx137_fail
    jump $I10
  rx137_done:
    rx137_cur."!cursor_fail"()
    rx137_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx137_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("31_1258129007.74018") :method
.annotate "line", 4
    new $P139, "ResizablePMCArray"
    push $P139, ""
    .return ($P139)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("32_1258129007.74018") :method :outer("30_1258129007.74018")
.annotate "line", 78
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    (rx142_cur, rx142_pos, rx142_tgt, $I10) = self."!cursor_start"()
    rx142_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx142_cur
    .local pmc match
    .lex "$/", match
    length rx142_eos, rx142_tgt
    set rx142_off, 0
    lt $I10, 2, rx142_start
    sub rx142_off, $I10, 1
    substr rx142_tgt, rx142_tgt, rx142_off
  rx142_start:
    ge rx142_pos, 0, rxscan143_done
  rxscan143_loop:
    ($P10) = rx142_cur."from"()
    inc $P10
    set rx142_pos, $P10
    ge rx142_pos, rx142_eos, rxscan143_done
    set_addr $I10, rxscan143_loop
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  rxscan143_done:
  alt144_0:
    set_addr $I10, alt144_1
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx142_pos, rx142_eos, rx142_fail
    sub $I10, rx142_pos, rx142_off
    substr $S10, rx142_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx142_fail
    inc rx142_pos
    goto alt144_end
  alt144_1:
  # rxanchor eos
    ne rx142_pos, rx142_eos, rx142_fail
  alt144_end:
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
.sub "eat_terminator"  :subid("33_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx149_tgt
    .local int rx149_pos
    .local int rx149_off
    .local int rx149_eos
    .local int rx149_rep
    .local pmc rx149_cur
    (rx149_cur, rx149_pos, rx149_tgt, $I10) = self."!cursor_start"()
    rx149_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx149_cur
    .local pmc match
    .lex "$/", match
    length rx149_eos, rx149_tgt
    set rx149_off, 0
    lt $I10, 2, rx149_start
    sub rx149_off, $I10, 1
    substr rx149_tgt, rx149_tgt, rx149_off
  rx149_start:
  alt152_0:
.annotate "line", 88
    set_addr $I10, alt152_1
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
.annotate "line", 89
  # rx literal  ";"
    add $I11, rx149_pos, 1
    gt $I11, rx149_eos, rx149_fail
    sub $I11, rx149_pos, rx149_off
    substr $S10, rx149_tgt, $I11, 1
    ne $S10, ";", rx149_fail
    add rx149_pos, 1
    goto alt152_end
  alt152_1:
    set_addr $I10, alt152_2
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
.annotate "line", 90
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."MARKED"("endstmt")
    unless $P10, rx149_fail
    goto alt152_end
  alt152_2:
    set_addr $I10, alt152_3
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
.annotate "line", 91
  # rx subrule "terminator" subtype=zerowidth negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."terminator"()
    unless $P10, rx149_fail
    goto alt152_end
  alt152_3:
.annotate "line", 92
  # rxanchor eos
    ne rx149_pos, rx149_eos, rx149_fail
  alt152_end:
.annotate "line", 88
  # rx pass
    rx149_cur."!cursor_pass"(rx149_pos, "eat_terminator")
    rx149_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx149_pos)
    .return (rx149_cur)
  rx149_fail:
.annotate "line", 4
    (rx149_rep, rx149_pos, $I10, $P10) = rx149_cur."!mark_fail"(0)
    lt rx149_pos, -1, rx149_done
    eq rx149_pos, -1, rx149_fail
    jump $I10
  rx149_done:
    rx149_cur."!cursor_fail"()
    rx149_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("34_1258129007.74018") :method
.annotate "line", 4
    new $P151, "ResizablePMCArray"
    push $P151, ""
    push $P151, ""
    push $P151, ""
    push $P151, ";"
    .return ($P151)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("35_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx154_tgt
    .local int rx154_pos
    .local int rx154_off
    .local int rx154_eos
    .local int rx154_rep
    .local pmc rx154_cur
    (rx154_cur, rx154_pos, rx154_tgt, $I10) = self."!cursor_start"()
    rx154_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx154_cur
    .local pmc match
    .lex "$/", match
    length rx154_eos, rx154_tgt
    set rx154_off, 0
    lt $I10, 2, rx154_start
    sub rx154_off, $I10, 1
    substr rx154_tgt, rx154_tgt, rx154_off
  rx154_start:
.annotate "line", 96
  # rx subrule "EXPR" subtype=capture negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."EXPR"()
    unless $P10, rx154_fail
    rx154_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx154_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."pblock"()
    unless $P10, rx154_fail
    rx154_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx154_pos = $P10."pos"()
.annotate "line", 95
  # rx pass
    rx154_cur."!cursor_pass"(rx154_pos, "xblock")
    rx154_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx154_pos)
    .return (rx154_cur)
  rx154_fail:
.annotate "line", 4
    (rx154_rep, rx154_pos, $I10, $P10) = rx154_cur."!mark_fail"(0)
    lt rx154_pos, -1, rx154_done
    eq rx154_pos, -1, rx154_fail
    jump $I10
  rx154_done:
    rx154_cur."!cursor_fail"()
    rx154_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx154_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("36_1258129007.74018") :method
.annotate "line", 4
    $P156 = self."!PREFIX__!subrule"("EXPR", "")
    new $P157, "ResizablePMCArray"
    push $P157, $P156
    .return ($P157)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("37_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx159_tgt
    .local int rx159_pos
    .local int rx159_off
    .local int rx159_eos
    .local int rx159_rep
    .local pmc rx159_cur
    (rx159_cur, rx159_pos, rx159_tgt, $I10) = self."!cursor_start"()
    rx159_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx159_cur
    .local pmc match
    .lex "$/", match
    length rx159_eos, rx159_tgt
    set rx159_off, 0
    lt $I10, 2, rx159_start
    sub rx159_off, $I10, 1
    substr rx159_tgt, rx159_tgt, rx159_off
  rx159_start:
  alt164_0:
.annotate "line", 99
    set_addr $I10, alt164_1
    rx159_cur."!mark_push"(0, rx159_pos, $I10)
.annotate "line", 100
  # rx subrule "lambda" subtype=method negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."lambda"()
    unless $P10, rx159_fail
    rx159_pos = $P10."pos"()
.annotate "line", 101
  # rx subrule "newpad" subtype=method negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."newpad"()
    unless $P10, rx159_fail
    rx159_pos = $P10."pos"()
.annotate "line", 102
  # rx subrule "signature" subtype=capture negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."signature"()
    unless $P10, rx159_fail
    rx159_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx159_pos = $P10."pos"()
.annotate "line", 103
  # rx subrule "blockoid" subtype=capture negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."blockoid"()
    unless $P10, rx159_fail
    rx159_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx159_pos = $P10."pos"()
.annotate "line", 100
    goto alt164_end
  alt164_1:
    set_addr $I10, alt164_2
    rx159_cur."!mark_push"(0, rx159_pos, $I10)
.annotate "line", 104
  # rx enumcharlist negate=0 zerowidth
    ge rx159_pos, rx159_eos, rx159_fail
    sub $I10, rx159_pos, rx159_off
    substr $S10, rx159_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx159_fail
.annotate "line", 105
  # rx subrule "newpad" subtype=method negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."newpad"()
    unless $P10, rx159_fail
    rx159_pos = $P10."pos"()
.annotate "line", 106
  # rx subrule "blockoid" subtype=capture negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."blockoid"()
    unless $P10, rx159_fail
    rx159_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx159_pos = $P10."pos"()
.annotate "line", 104
    goto alt164_end
  alt164_2:
.annotate "line", 107
  # rx subrule "panic" subtype=method negate=
    rx159_cur."!cursor_pos"(rx159_pos)
    $P10 = rx159_cur."panic"("Missing block")
    unless $P10, rx159_fail
    rx159_pos = $P10."pos"()
  alt164_end:
.annotate "line", 99
  # rx pass
    rx159_cur."!cursor_pass"(rx159_pos, "pblock")
    rx159_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx159_pos)
    .return (rx159_cur)
  rx159_fail:
.annotate "line", 4
    (rx159_rep, rx159_pos, $I10, $P10) = rx159_cur."!mark_fail"(0)
    lt rx159_pos, -1, rx159_done
    eq rx159_pos, -1, rx159_fail
    jump $I10
  rx159_done:
    rx159_cur."!cursor_fail"()
    rx159_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx159_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("38_1258129007.74018") :method
.annotate "line", 4
    $P161 = self."!PREFIX__!subrule"("panic", "")
    $P162 = self."!PREFIX__!subrule"("lambda", "")
    new $P163, "ResizablePMCArray"
    push $P163, $P161
    push $P163, "{"
    push $P163, $P162
    .return ($P163)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("39_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx166_tgt
    .local int rx166_pos
    .local int rx166_off
    .local int rx166_eos
    .local int rx166_rep
    .local pmc rx166_cur
    (rx166_cur, rx166_pos, rx166_tgt, $I10) = self."!cursor_start"()
    rx166_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx166_cur
    .local pmc match
    .lex "$/", match
    length rx166_eos, rx166_tgt
    set rx166_off, 0
    lt $I10, 2, rx166_start
    sub rx166_off, $I10, 1
    substr rx166_tgt, rx166_tgt, rx166_off
  rx166_start:
  alt169_0:
.annotate "line", 110
    set_addr $I10, alt169_1
    rx166_cur."!mark_push"(0, rx166_pos, $I10)
  # rx literal  "->"
    add $I11, rx166_pos, 2
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 2
    ne $S10, "->", rx166_fail
    add rx166_pos, 2
    goto alt169_end
  alt169_1:
  # rx literal  "<->"
    add $I11, rx166_pos, 3
    gt $I11, rx166_eos, rx166_fail
    sub $I11, rx166_pos, rx166_off
    substr $S10, rx166_tgt, $I11, 3
    ne $S10, "<->", rx166_fail
    add rx166_pos, 3
  alt169_end:
  # rx pass
    rx166_cur."!cursor_pass"(rx166_pos, "lambda")
    rx166_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx166_pos)
    .return (rx166_cur)
  rx166_fail:
.annotate "line", 4
    (rx166_rep, rx166_pos, $I10, $P10) = rx166_cur."!mark_fail"(0)
    lt rx166_pos, -1, rx166_done
    eq rx166_pos, -1, rx166_fail
    jump $I10
  rx166_done:
    rx166_cur."!cursor_fail"()
    rx166_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx166_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("40_1258129007.74018") :method
.annotate "line", 4
    new $P168, "ResizablePMCArray"
    push $P168, "<->"
    push $P168, "->"
    .return ($P168)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("41_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt, $I10) = self."!cursor_start"()
    rx171_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx171_cur
    .local pmc match
    .lex "$/", match
    length rx171_eos, rx171_tgt
    set rx171_off, 0
    lt $I10, 2, rx171_start
    sub rx171_off, $I10, 1
    substr rx171_tgt, rx171_tgt, rx171_off
  rx171_start:
  alt175_0:
.annotate "line", 113
    set_addr $I10, alt175_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx171_pos, rx171_eos, rx171_fail
    sub $I10, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx171_fail
    goto alt175_end
  alt175_1:
  # rx subrule "panic" subtype=method negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."panic"("Missing block")
    unless $P10, rx171_fail
    rx171_pos = $P10."pos"()
  alt175_end:
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."newpad"()
    unless $P10, rx171_fail
    rx171_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "blockoid" subtype=capture negate=
    rx171_cur."!cursor_pos"(rx171_pos)
    $P10 = rx171_cur."blockoid"()
    unless $P10, rx171_fail
    rx171_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx171_pos = $P10."pos"()
.annotate "line", 112
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "block")
    rx171_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx171_pos)
    .return (rx171_cur)
  rx171_fail:
.annotate "line", 4
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    rx171_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx171_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("42_1258129007.74018") :method
.annotate "line", 4
    $P173 = self."!PREFIX__!subrule"("panic", "")
    new $P174, "ResizablePMCArray"
    push $P174, $P173
    push $P174, "{"
    .return ($P174)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("43_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt, $I10) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    set rx177_off, 0
    lt $I10, 2, rx177_start
    sub rx177_off, $I10, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
.annotate "line", 119
  # rx subrule "finishpad" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."finishpad"()
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
.annotate "line", 120
  # rx literal  "{"
    add $I11, rx177_pos, 1
    gt $I11, rx177_eos, rx177_fail
    sub $I11, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I11, 1
    ne $S10, "{", rx177_fail
    add rx177_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."statementlist"()
    unless $P10, rx177_fail
    rx177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx177_pos = $P10."pos"()
  alt181_0:
    set_addr $I10, alt181_1
    rx177_cur."!mark_push"(0, rx177_pos, $I10)
  # rx literal  "}"
    add $I11, rx177_pos, 1
    gt $I11, rx177_eos, rx177_fail
    sub $I11, rx177_pos, rx177_off
    substr $S10, rx177_tgt, $I11, 1
    ne $S10, "}", rx177_fail
    add rx177_pos, 1
    goto alt181_end
  alt181_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."FAILGOAL"("'}'")
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
  alt181_end:
.annotate "line", 121
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."ENDSTMT"()
    unless $P10, rx177_fail
.annotate "line", 118
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "blockoid")
    rx177_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
.annotate "line", 4
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx177_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("44_1258129007.74018") :method
.annotate "line", 4
    $P179 = self."!PREFIX__!subrule"("finishpad", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("45_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx184_tgt
    .local int rx184_pos
    .local int rx184_off
    .local int rx184_eos
    .local int rx184_rep
    .local pmc rx184_cur
    (rx184_cur, rx184_pos, rx184_tgt, $I10) = self."!cursor_start"()
    rx184_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx184_cur
    .local pmc match
    .lex "$/", match
    length rx184_eos, rx184_tgt
    set rx184_off, 0
    lt $I10, 2, rx184_start
    sub rx184_off, $I10, 1
    substr rx184_tgt, rx184_tgt, rx184_off
  rx184_start:
.annotate "line", 124
  # rx pass
    rx184_cur."!cursor_pass"(rx184_pos, "newpad")
    rx184_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx184_pos)
    .return (rx184_cur)
  rx184_fail:
.annotate "line", 4
    (rx184_rep, rx184_pos, $I10, $P10) = rx184_cur."!mark_fail"(0)
    lt rx184_pos, -1, rx184_done
    eq rx184_pos, -1, rx184_fail
    jump $I10
  rx184_done:
    rx184_cur."!cursor_fail"()
    rx184_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx184_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("46_1258129007.74018") :method
.annotate "line", 4
    new $P186, "ResizablePMCArray"
    push $P186, ""
    .return ($P186)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("47_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt, $I10) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    set rx188_off, 0
    lt $I10, 2, rx188_start
    sub rx188_off, $I10, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
.annotate "line", 125
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "finishpad")
    rx188_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate "line", 4
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx188_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("48_1258129007.74018") :method
.annotate "line", 4
    new $P190, "ResizablePMCArray"
    push $P190, ""
    .return ($P190)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("49_1258129007.74018") :method
.annotate "line", 127
    $P192 = self."!protoregex"("terminator")
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("50_1258129007.74018") :method
.annotate "line", 127
    $P194 = self."!PREFIX__!protoregex"("terminator")
    .return ($P194)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("51_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt, $I10) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    set rx196_off, 0
    lt $I10, 2, rx196_start
    sub rx196_off, $I10, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
.annotate "line", 129
  # rx enumcharlist negate=0 zerowidth
    ge rx196_pos, rx196_eos, rx196_fail
    sub $I10, rx196_pos, rx196_off
    substr $S10, rx196_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx196_fail
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "terminator:sym<;>")
    rx196_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate "line", 4
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx196_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("52_1258129007.74018") :method
.annotate "line", 4
    new $P198, "ResizablePMCArray"
    push $P198, ";"
    .return ($P198)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("53_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx200_tgt
    .local int rx200_pos
    .local int rx200_off
    .local int rx200_eos
    .local int rx200_rep
    .local pmc rx200_cur
    (rx200_cur, rx200_pos, rx200_tgt, $I10) = self."!cursor_start"()
    rx200_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx200_cur
    .local pmc match
    .lex "$/", match
    length rx200_eos, rx200_tgt
    set rx200_off, 0
    lt $I10, 2, rx200_start
    sub rx200_off, $I10, 1
    substr rx200_tgt, rx200_tgt, rx200_off
  rx200_start:
.annotate "line", 130
  # rx enumcharlist negate=0 zerowidth
    ge rx200_pos, rx200_eos, rx200_fail
    sub $I10, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx200_fail
  # rx pass
    rx200_cur."!cursor_pass"(rx200_pos, "terminator:sym<}>")
    rx200_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx200_pos)
    .return (rx200_cur)
  rx200_fail:
.annotate "line", 4
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    rx200_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx200_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("54_1258129007.74018") :method
.annotate "line", 4
    new $P202, "ResizablePMCArray"
    push $P202, "}"
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("55_1258129007.74018") :method
.annotate "line", 134
    $P204 = self."!protoregex"("statement_control")
    .return ($P204)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("56_1258129007.74018") :method
.annotate "line", 134
    $P206 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P206)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("57_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx208_tgt
    .local int rx208_pos
    .local int rx208_off
    .local int rx208_eos
    .local int rx208_rep
    .local pmc rx208_cur
    (rx208_cur, rx208_pos, rx208_tgt, $I10) = self."!cursor_start"()
    rx208_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx208_cur."!cursor_caparray"("xblock", "else")
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
  # rx subcapture "sym"
    set_addr $I10, rxcap_211_fail
    rx208_cur."!mark_push"(0, rx208_pos, $I10)
  # rx literal  "if"
    add $I11, rx208_pos, 2
    gt $I11, rx208_eos, rx208_fail
    sub $I11, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I11, 2
    ne $S10, "if", rx208_fail
    add rx208_pos, 2
    set_addr $I10, rxcap_211_fail
    ($I12, $I11) = rx208_cur."!mark_peek"($I10)
    rx208_cur."!cursor_pos"($I11)
    ($P10) = rx208_cur."!cursor_start"()
    $P10."!cursor_pass"(rx208_pos, "")
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_211_done
  rxcap_211_fail:
    goto rx208_fail
  rxcap_211_done:
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
.annotate "line", 138
  # rx subrule "xblock" subtype=capture negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."xblock"()
    unless $P10, rx208_fail
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx208_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
.annotate "line", 139
  # rx rxquantr214 ** 0..*
    set_addr $I218, rxquantr214_done
    rx208_cur."!mark_push"(0, rx208_pos, $I218)
  rxquantr214_loop:
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx208_pos, 5
    gt $I11, rx208_eos, rx208_fail
    sub $I11, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I11, 5
    ne $S10, "elsif", rx208_fail
    add rx208_pos, 5
  # rx charclass s
    ge rx208_pos, rx208_eos, rx208_fail
    sub $I10, rx208_pos, rx208_off
    is_cclass $I11, 32, rx208_tgt, $I10
    unless $I11, rx208_fail
    inc rx208_pos
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."xblock"()
    unless $P10, rx208_fail
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx208_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
    (rx208_rep) = rx208_cur."!mark_commit"($I218)
    rx208_cur."!mark_push"(rx208_rep, rx208_pos, $I218)
    goto rxquantr214_loop
  rxquantr214_done:
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
.annotate "line", 140
  # rx rxquantr220 ** 0..1
    set_addr $I224, rxquantr220_done
    rx208_cur."!mark_push"(0, rx208_pos, $I224)
  rxquantr220_loop:
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx208_pos, 4
    gt $I11, rx208_eos, rx208_fail
    sub $I11, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I11, 4
    ne $S10, "else", rx208_fail
    add rx208_pos, 4
  # rx charclass s
    ge rx208_pos, rx208_eos, rx208_fail
    sub $I10, rx208_pos, rx208_off
    is_cclass $I11, 32, rx208_tgt, $I10
    unless $I11, rx208_fail
    inc rx208_pos
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."pblock"()
    unless $P10, rx208_fail
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx208_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
    (rx208_rep) = rx208_cur."!mark_commit"($I224)
  rxquantr220_done:
  # rx subrule "ws" subtype=method negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."ws"()
    unless $P10, rx208_fail
    rx208_pos = $P10."pos"()
.annotate "line", 136
  # rx pass
    rx208_cur."!cursor_pass"(rx208_pos, "statement_control:sym<if>")
    rx208_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx208_pos)
    .return (rx208_cur)
  rx208_fail:
.annotate "line", 4
    (rx208_rep, rx208_pos, $I10, $P10) = rx208_cur."!mark_fail"(0)
    lt rx208_pos, -1, rx208_done
    eq rx208_pos, -1, rx208_fail
    jump $I10
  rx208_done:
    rx208_cur."!cursor_fail"()
    rx208_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx208_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("58_1258129007.74018") :method
.annotate "line", 4
    new $P210, "ResizablePMCArray"
    push $P210, "if"
    .return ($P210)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("59_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .const 'Sub' $P236 = "61_1258129007.74018" 
    capture_lex $P236
    .local string rx227_tgt
    .local int rx227_pos
    .local int rx227_off
    .local int rx227_eos
    .local int rx227_rep
    .local pmc rx227_cur
    (rx227_cur, rx227_pos, rx227_tgt, $I10) = self."!cursor_start"()
    rx227_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx227_cur
    .local pmc match
    .lex "$/", match
    length rx227_eos, rx227_tgt
    set rx227_off, 0
    lt $I10, 2, rx227_start
    sub rx227_off, $I10, 1
    substr rx227_tgt, rx227_tgt, rx227_off
  rx227_start:
.annotate "line", 144
  # rx subcapture "sym"
    set_addr $I10, rxcap_230_fail
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  # rx literal  "unless"
    add $I11, rx227_pos, 6
    gt $I11, rx227_eos, rx227_fail
    sub $I11, rx227_pos, rx227_off
    substr $S10, rx227_tgt, $I11, 6
    ne $S10, "unless", rx227_fail
    add rx227_pos, 6
    set_addr $I10, rxcap_230_fail
    ($I12, $I11) = rx227_cur."!mark_peek"($I10)
    rx227_cur."!cursor_pos"($I11)
    ($P10) = rx227_cur."!cursor_start"()
    $P10."!cursor_pass"(rx227_pos, "")
    rx227_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_230_done
  rxcap_230_fail:
    goto rx227_fail
  rxcap_230_done:
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
.annotate "line", 145
  # rx subrule "xblock" subtype=capture negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."xblock"()
    unless $P10, rx227_fail
    rx227_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx227_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
  alt233_0:
.annotate "line", 146
    set_addr $I10, alt233_1
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx227_cur."!cursor_pos"(rx227_pos)
    .const 'Sub' $P236 = "61_1258129007.74018" 
    capture_lex $P236
    $P10 = rx227_cur."before"($P236)
    if $P10, rx227_fail
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
    goto alt233_end
  alt233_1:
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
  alt233_end:
  # rx subrule "ws" subtype=method negate=
    rx227_cur."!cursor_pos"(rx227_pos)
    $P10 = rx227_cur."ws"()
    unless $P10, rx227_fail
    rx227_pos = $P10."pos"()
.annotate "line", 143
  # rx pass
    rx227_cur."!cursor_pass"(rx227_pos, "statement_control:sym<unless>")
    rx227_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx227_pos)
    .return (rx227_cur)
  rx227_fail:
.annotate "line", 4
    (rx227_rep, rx227_pos, $I10, $P10) = rx227_cur."!mark_fail"(0)
    lt rx227_pos, -1, rx227_done
    eq rx227_pos, -1, rx227_fail
    jump $I10
  rx227_done:
    rx227_cur."!cursor_fail"()
    rx227_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx227_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("60_1258129007.74018") :method
.annotate "line", 4
    new $P229, "ResizablePMCArray"
    push $P229, "unless"
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "_block235"  :anon :subid("61_1258129007.74018") :method :outer("59_1258129007.74018")
.annotate "line", 146
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    (rx237_cur, rx237_pos, rx237_tgt, $I10) = self."!cursor_start"()
    rx237_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx237_cur
    .local pmc match
    .lex "$/", match
    length rx237_eos, rx237_tgt
    set rx237_off, 0
    lt $I10, 2, rx237_start
    sub rx237_off, $I10, 1
    substr rx237_tgt, rx237_tgt, rx237_off
  rx237_start:
    ge rx237_pos, 0, rxscan238_done
  rxscan238_loop:
    ($P10) = rx237_cur."from"()
    inc $P10
    set rx237_pos, $P10
    ge rx237_pos, rx237_eos, rxscan238_done
    set_addr $I10, rxscan238_loop
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
  rxscan238_done:
  # rx literal  "else"
    add $I11, rx237_pos, 4
    gt $I11, rx237_eos, rx237_fail
    sub $I11, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I11, 4
    ne $S10, "else", rx237_fail
    add rx237_pos, 4
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "")
    rx237_cur."!cursor_debug"("PASS  ", "", " at pos=", rx237_pos)
    .return (rx237_cur)
  rx237_fail:
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    rx237_cur."!cursor_debug"("FAIL  ", "")
    .return (rx237_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("62_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx244_tgt
    .local int rx244_pos
    .local int rx244_off
    .local int rx244_eos
    .local int rx244_rep
    .local pmc rx244_cur
    (rx244_cur, rx244_pos, rx244_tgt, $I10) = self."!cursor_start"()
    rx244_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx244_cur
    .local pmc match
    .lex "$/", match
    length rx244_eos, rx244_tgt
    set rx244_off, 0
    lt $I10, 2, rx244_start
    sub rx244_off, $I10, 1
    substr rx244_tgt, rx244_tgt, rx244_off
  rx244_start:
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_248_fail
    rx244_cur."!mark_push"(0, rx244_pos, $I10)
  alt247_0:
    set_addr $I10, alt247_1
    rx244_cur."!mark_push"(0, rx244_pos, $I10)
  # rx literal  "while"
    add $I11, rx244_pos, 5
    gt $I11, rx244_eos, rx244_fail
    sub $I11, rx244_pos, rx244_off
    substr $S10, rx244_tgt, $I11, 5
    ne $S10, "while", rx244_fail
    add rx244_pos, 5
    goto alt247_end
  alt247_1:
  # rx literal  "until"
    add $I11, rx244_pos, 5
    gt $I11, rx244_eos, rx244_fail
    sub $I11, rx244_pos, rx244_off
    substr $S10, rx244_tgt, $I11, 5
    ne $S10, "until", rx244_fail
    add rx244_pos, 5
  alt247_end:
    set_addr $I10, rxcap_248_fail
    ($I12, $I11) = rx244_cur."!mark_peek"($I10)
    rx244_cur."!cursor_pos"($I11)
    ($P10) = rx244_cur."!cursor_start"()
    $P10."!cursor_pass"(rx244_pos, "")
    rx244_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_248_done
  rxcap_248_fail:
    goto rx244_fail
  rxcap_248_done:
  # rx subrule "ws" subtype=method negate=
    rx244_cur."!cursor_pos"(rx244_pos)
    $P10 = rx244_cur."ws"()
    unless $P10, rx244_fail
    rx244_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx244_cur."!cursor_pos"(rx244_pos)
    $P10 = rx244_cur."xblock"()
    unless $P10, rx244_fail
    rx244_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx244_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx244_cur."!cursor_pos"(rx244_pos)
    $P10 = rx244_cur."ws"()
    unless $P10, rx244_fail
    rx244_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx244_cur."!cursor_pass"(rx244_pos, "statement_control:sym<while>")
    rx244_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx244_pos)
    .return (rx244_cur)
  rx244_fail:
.annotate "line", 4
    (rx244_rep, rx244_pos, $I10, $P10) = rx244_cur."!mark_fail"(0)
    lt rx244_pos, -1, rx244_done
    eq rx244_pos, -1, rx244_fail
    jump $I10
  rx244_done:
    rx244_cur."!cursor_fail"()
    rx244_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx244_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("63_1258129007.74018") :method
.annotate "line", 4
    new $P246, "ResizablePMCArray"
    push $P246, "until"
    push $P246, "while"
    .return ($P246)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("64_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt, $I10) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    set rx252_off, 0
    lt $I10, 2, rx252_start
    sub rx252_off, $I10, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
.annotate "line", 155
  # rx subcapture "sym"
    set_addr $I10, rxcap_255_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx252_pos, 6
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 6
    ne $S10, "repeat", rx252_fail
    add rx252_pos, 6
    set_addr $I10, rxcap_255_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_255_done
  rxcap_255_fail:
    goto rx252_fail
  rxcap_255_done:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  alt257_0:
.annotate "line", 156
    set_addr $I10, alt257_1
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
.annotate "line", 157
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_260_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  alt259_0:
    set_addr $I10, alt259_1
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "while"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "while", rx252_fail
    add rx252_pos, 5
    goto alt259_end
  alt259_1:
  # rx literal  "until"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "until", rx252_fail
    add rx252_pos, 5
  alt259_end:
    set_addr $I10, rxcap_260_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_260_done
  rxcap_260_fail:
    goto rx252_fail
  rxcap_260_done:
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
    goto alt257_end
  alt257_1:
.annotate "line", 158
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
    $P10."!cursor_names"("pblock")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_266_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  alt265_0:
    set_addr $I10, alt265_1
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "while"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "while", rx252_fail
    add rx252_pos, 5
    goto alt265_end
  alt265_1:
  # rx literal  "until"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "until", rx252_fail
    add rx252_pos, 5
  alt265_end:
    set_addr $I10, rxcap_266_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_266_done
  rxcap_266_fail:
    goto rx252_fail
  rxcap_266_done:
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
  # rx subrule "EXPR" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."EXPR"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  alt257_end:
.annotate "line", 159
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 154
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "statement_control:sym<repeat>")
    rx252_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx252_pos)
    .return (rx252_cur)
  rx252_fail:
.annotate "line", 4
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    rx252_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("65_1258129007.74018") :method
.annotate "line", 4
    new $P254, "ResizablePMCArray"
    push $P254, "repeat"
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("66_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx271_tgt
    .local int rx271_pos
    .local int rx271_off
    .local int rx271_eos
    .local int rx271_rep
    .local pmc rx271_cur
    (rx271_cur, rx271_pos, rx271_tgt, $I10) = self."!cursor_start"()
    rx271_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx271_cur
    .local pmc match
    .lex "$/", match
    length rx271_eos, rx271_tgt
    set rx271_off, 0
    lt $I10, 2, rx271_start
    sub rx271_off, $I10, 1
    substr rx271_tgt, rx271_tgt, rx271_off
  rx271_start:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_274_fail
    rx271_cur."!mark_push"(0, rx271_pos, $I10)
  # rx literal  "for"
    add $I11, rx271_pos, 3
    gt $I11, rx271_eos, rx271_fail
    sub $I11, rx271_pos, rx271_off
    substr $S10, rx271_tgt, $I11, 3
    ne $S10, "for", rx271_fail
    add rx271_pos, 3
    set_addr $I10, rxcap_274_fail
    ($I12, $I11) = rx271_cur."!mark_peek"($I10)
    rx271_cur."!cursor_pos"($I11)
    ($P10) = rx271_cur."!cursor_start"()
    $P10."!cursor_pass"(rx271_pos, "")
    rx271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_274_done
  rxcap_274_fail:
    goto rx271_fail
  rxcap_274_done:
  # rx subrule "ws" subtype=method negate=
    rx271_cur."!cursor_pos"(rx271_pos)
    $P10 = rx271_cur."ws"()
    unless $P10, rx271_fail
    rx271_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx271_cur."!cursor_pos"(rx271_pos)
    $P10 = rx271_cur."xblock"()
    unless $P10, rx271_fail
    rx271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx271_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx271_cur."!cursor_pos"(rx271_pos)
    $P10 = rx271_cur."ws"()
    unless $P10, rx271_fail
    rx271_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx271_cur."!cursor_pass"(rx271_pos, "statement_control:sym<for>")
    rx271_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx271_pos)
    .return (rx271_cur)
  rx271_fail:
.annotate "line", 4
    (rx271_rep, rx271_pos, $I10, $P10) = rx271_cur."!mark_fail"(0)
    lt rx271_pos, -1, rx271_done
    eq rx271_pos, -1, rx271_fail
    jump $I10
  rx271_done:
    rx271_cur."!cursor_fail"()
    rx271_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx271_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("67_1258129007.74018") :method
.annotate "line", 4
    new $P273, "ResizablePMCArray"
    push $P273, "for"
    .return ($P273)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<return>"  :subid("68_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx278_tgt
    .local int rx278_pos
    .local int rx278_off
    .local int rx278_eos
    .local int rx278_rep
    .local pmc rx278_cur
    (rx278_cur, rx278_pos, rx278_tgt, $I10) = self."!cursor_start"()
    rx278_cur."!cursor_debug"("START ", "statement_control:sym<return>")
    .lex unicode:"$\x{a2}", rx278_cur
    .local pmc match
    .lex "$/", match
    length rx278_eos, rx278_tgt
    set rx278_off, 0
    lt $I10, 2, rx278_start
    sub rx278_off, $I10, 1
    substr rx278_tgt, rx278_tgt, rx278_off
  rx278_start:
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_281_fail
    rx278_cur."!mark_push"(0, rx278_pos, $I10)
  # rx literal  "return"
    add $I11, rx278_pos, 6
    gt $I11, rx278_eos, rx278_fail
    sub $I11, rx278_pos, rx278_off
    substr $S10, rx278_tgt, $I11, 6
    ne $S10, "return", rx278_fail
    add rx278_pos, 6
    set_addr $I10, rxcap_281_fail
    ($I12, $I11) = rx278_cur."!mark_peek"($I10)
    rx278_cur."!cursor_pos"($I11)
    ($P10) = rx278_cur."!cursor_start"()
    $P10."!cursor_pass"(rx278_pos, "")
    rx278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_281_done
  rxcap_281_fail:
    goto rx278_fail
  rxcap_281_done:
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  alt283_0:
.annotate "line", 169
    set_addr $I10, alt283_1
    rx278_cur."!mark_push"(0, rx278_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."EXPR"()
    unless $P10, rx278_fail
    rx278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx278_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
    goto alt283_end
  alt283_1:
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."panic"("return requires an expression argument")
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  alt283_end:
  # rx subrule "ws" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."ws"()
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx278_cur."!cursor_pass"(rx278_pos, "statement_control:sym<return>")
    rx278_cur."!cursor_debug"("PASS  ", "statement_control:sym<return>", " at pos=", rx278_pos)
    .return (rx278_cur)
  rx278_fail:
.annotate "line", 4
    (rx278_rep, rx278_pos, $I10, $P10) = rx278_cur."!mark_fail"(0)
    lt rx278_pos, -1, rx278_done
    eq rx278_pos, -1, rx278_fail
    jump $I10
  rx278_done:
    rx278_cur."!cursor_fail"()
    rx278_cur."!cursor_debug"("FAIL  ", "statement_control:sym<return>")
    .return (rx278_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<return>"  :subid("69_1258129007.74018") :method
.annotate "line", 4
    new $P280, "ResizablePMCArray"
    push $P280, "return"
    .return ($P280)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<make>"  :subid("70_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt, $I10) = self."!cursor_start"()
    rx290_cur."!cursor_debug"("START ", "statement_control:sym<make>")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    set rx290_off, 0
    lt $I10, 2, rx290_start
    sub rx290_off, $I10, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
.annotate "line", 173
  # rx subcapture "sym"
    set_addr $I10, rxcap_293_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx literal  "make"
    add $I11, rx290_pos, 4
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 4
    ne $S10, "make", rx290_fail
    add rx290_pos, 4
    set_addr $I10, rxcap_293_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_293_done
  rxcap_293_fail:
    goto rx290_fail
  rxcap_293_done:
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
  alt295_0:
.annotate "line", 174
    set_addr $I10, alt295_1
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."EXPR"()
    unless $P10, rx290_fail
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx290_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
    goto alt295_end
  alt295_1:
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."panic"("make requires an expression argument")
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
  alt295_end:
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
.annotate "line", 172
  # rx pass
    rx290_cur."!cursor_pass"(rx290_pos, "statement_control:sym<make>")
    rx290_cur."!cursor_debug"("PASS  ", "statement_control:sym<make>", " at pos=", rx290_pos)
    .return (rx290_cur)
  rx290_fail:
.annotate "line", 4
    (rx290_rep, rx290_pos, $I10, $P10) = rx290_cur."!mark_fail"(0)
    lt rx290_pos, -1, rx290_done
    eq rx290_pos, -1, rx290_fail
    jump $I10
  rx290_done:
    rx290_cur."!cursor_fail"()
    rx290_cur."!cursor_debug"("FAIL  ", "statement_control:sym<make>")
    .return (rx290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<make>"  :subid("71_1258129007.74018") :method
.annotate "line", 4
    new $P292, "ResizablePMCArray"
    push $P292, "make"
    .return ($P292)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("72_1258129007.74018") :method
.annotate "line", 177
    $P302 = self."!protoregex"("statement_prefix")
    .return ($P302)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("73_1258129007.74018") :method
.annotate "line", 177
    $P304 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P304)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("74_1258129007.74018") :method :outer("11_1258129007.74018")
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
.annotate "line", 178
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
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("75_1258129007.74018") :method
.annotate "line", 4
    $P308 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P309, "ResizablePMCArray"
    push $P309, $P308
    .return ($P309)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("76_1258129007.74018") :method :outer("11_1258129007.74018")
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
.annotate "line", 181
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
.annotate "line", 180
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
.sub "!PREFIX__blorst"  :subid("77_1258129007.74018") :method
.annotate "line", 4
    new $P314, "ResizablePMCArray"
    push $P314, ""
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("78_1258129007.74018") :method
.annotate "line", 186
    $P317 = self."!protoregex"("statement_mod_cond")
    .return ($P317)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("79_1258129007.74018") :method
.annotate "line", 186
    $P319 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P319)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("80_1258129007.74018") :method :outer("11_1258129007.74018")
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
.annotate "line", 188
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
    $P10."!cursor_names"("mod_expr")
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
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("81_1258129007.74018") :method
.annotate "line", 4
    new $P323, "ResizablePMCArray"
    push $P323, "if"
    .return ($P323)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("82_1258129007.74018") :method :outer("11_1258129007.74018")
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
.annotate "line", 189
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
    $P10."!cursor_names"("mod_expr")
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
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("83_1258129007.74018") :method
.annotate "line", 4
    new $P330, "ResizablePMCArray"
    push $P330, "unless"
    .return ($P330)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("84_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx335_tgt
    .local int rx335_pos
    .local int rx335_off
    .local int rx335_eos
    .local int rx335_rep
    .local pmc rx335_cur
    (rx335_cur, rx335_pos, rx335_tgt, $I10) = self."!cursor_start"()
    rx335_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx335_cur
    .local pmc match
    .lex "$/", match
    length rx335_eos, rx335_tgt
    set rx335_off, 0
    lt $I10, 2, rx335_start
    sub rx335_off, $I10, 1
    substr rx335_tgt, rx335_tgt, rx335_off
  rx335_start:
.annotate "line", 193
  # rx subrule "colonpair" subtype=capture negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."colonpair"()
    unless $P10, rx335_fail
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx335_pos = $P10."pos"()
  # rx pass
    rx335_cur."!cursor_pass"(rx335_pos, "term:sym<colonpair>")
    rx335_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx335_pos)
    .return (rx335_cur)
  rx335_fail:
.annotate "line", 4
    (rx335_rep, rx335_pos, $I10, $P10) = rx335_cur."!mark_fail"(0)
    lt rx335_pos, -1, rx335_done
    eq rx335_pos, -1, rx335_fail
    jump $I10
  rx335_done:
    rx335_cur."!cursor_fail"()
    rx335_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx335_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("85_1258129007.74018") :method
.annotate "line", 4
    $P337 = self."!PREFIX__!subrule"("colonpair", "")
    new $P338, "ResizablePMCArray"
    push $P338, $P337
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("86_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt, $I10) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    set rx340_off, 0
    lt $I10, 2, rx340_start
    sub rx340_off, $I10, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
.annotate "line", 194
  # rx subrule "variable" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."variable"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx340_pos = $P10."pos"()
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "term:sym<variable>")
    rx340_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate "line", 4
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("87_1258129007.74018") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("variable", "")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("88_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx345_tgt
    .local int rx345_pos
    .local int rx345_off
    .local int rx345_eos
    .local int rx345_rep
    .local pmc rx345_cur
    (rx345_cur, rx345_pos, rx345_tgt, $I10) = self."!cursor_start"()
    rx345_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx345_cur
    .local pmc match
    .lex "$/", match
    length rx345_eos, rx345_tgt
    set rx345_off, 0
    lt $I10, 2, rx345_start
    sub rx345_off, $I10, 1
    substr rx345_tgt, rx345_tgt, rx345_off
  rx345_start:
.annotate "line", 195
  # rx subrule "package_declarator" subtype=capture negate=
    rx345_cur."!cursor_pos"(rx345_pos)
    $P10 = rx345_cur."package_declarator"()
    unless $P10, rx345_fail
    rx345_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx345_pos = $P10."pos"()
  # rx pass
    rx345_cur."!cursor_pass"(rx345_pos, "term:sym<package_declarator>")
    rx345_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx345_pos)
    .return (rx345_cur)
  rx345_fail:
.annotate "line", 4
    (rx345_rep, rx345_pos, $I10, $P10) = rx345_cur."!mark_fail"(0)
    lt rx345_pos, -1, rx345_done
    eq rx345_pos, -1, rx345_fail
    jump $I10
  rx345_done:
    rx345_cur."!cursor_fail"()
    rx345_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx345_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("89_1258129007.74018") :method
.annotate "line", 4
    $P347 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P348, "ResizablePMCArray"
    push $P348, $P347
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("90_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx350_tgt
    .local int rx350_pos
    .local int rx350_off
    .local int rx350_eos
    .local int rx350_rep
    .local pmc rx350_cur
    (rx350_cur, rx350_pos, rx350_tgt, $I10) = self."!cursor_start"()
    rx350_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx350_cur
    .local pmc match
    .lex "$/", match
    length rx350_eos, rx350_tgt
    set rx350_off, 0
    lt $I10, 2, rx350_start
    sub rx350_off, $I10, 1
    substr rx350_tgt, rx350_tgt, rx350_off
  rx350_start:
.annotate "line", 196
  # rx subrule "scope_declarator" subtype=capture negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."scope_declarator"()
    unless $P10, rx350_fail
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx350_pos = $P10."pos"()
  # rx pass
    rx350_cur."!cursor_pass"(rx350_pos, "term:sym<scope_declarator>")
    rx350_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx350_pos)
    .return (rx350_cur)
  rx350_fail:
.annotate "line", 4
    (rx350_rep, rx350_pos, $I10, $P10) = rx350_cur."!mark_fail"(0)
    lt rx350_pos, -1, rx350_done
    eq rx350_pos, -1, rx350_fail
    jump $I10
  rx350_done:
    rx350_cur."!cursor_fail"()
    rx350_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx350_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("91_1258129007.74018") :method
.annotate "line", 4
    $P352 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P353, "ResizablePMCArray"
    push $P353, $P352
    .return ($P353)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("92_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx355_tgt
    .local int rx355_pos
    .local int rx355_off
    .local int rx355_eos
    .local int rx355_rep
    .local pmc rx355_cur
    (rx355_cur, rx355_pos, rx355_tgt, $I10) = self."!cursor_start"()
    rx355_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx355_cur
    .local pmc match
    .lex "$/", match
    length rx355_eos, rx355_tgt
    set rx355_off, 0
    lt $I10, 2, rx355_start
    sub rx355_off, $I10, 1
    substr rx355_tgt, rx355_tgt, rx355_off
  rx355_start:
.annotate "line", 197
  # rx subrule "routine_declarator" subtype=capture negate=
    rx355_cur."!cursor_pos"(rx355_pos)
    $P10 = rx355_cur."routine_declarator"()
    unless $P10, rx355_fail
    rx355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx355_pos = $P10."pos"()
  # rx pass
    rx355_cur."!cursor_pass"(rx355_pos, "term:sym<routine_declarator>")
    rx355_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx355_pos)
    .return (rx355_cur)
  rx355_fail:
.annotate "line", 4
    (rx355_rep, rx355_pos, $I10, $P10) = rx355_cur."!mark_fail"(0)
    lt rx355_pos, -1, rx355_done
    eq rx355_pos, -1, rx355_fail
    jump $I10
  rx355_done:
    rx355_cur."!cursor_fail"()
    rx355_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx355_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("93_1258129007.74018") :method
.annotate "line", 4
    $P357 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P358, "ResizablePMCArray"
    push $P358, $P357
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("94_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx360_tgt
    .local int rx360_pos
    .local int rx360_off
    .local int rx360_eos
    .local int rx360_rep
    .local pmc rx360_cur
    (rx360_cur, rx360_pos, rx360_tgt, $I10) = self."!cursor_start"()
    rx360_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx360_cur
    .local pmc match
    .lex "$/", match
    length rx360_eos, rx360_tgt
    set rx360_off, 0
    lt $I10, 2, rx360_start
    sub rx360_off, $I10, 1
    substr rx360_tgt, rx360_tgt, rx360_off
  rx360_start:
.annotate "line", 198
  # rx subrule "regex_declarator" subtype=capture negate=
    rx360_cur."!cursor_pos"(rx360_pos)
    $P10 = rx360_cur."regex_declarator"()
    unless $P10, rx360_fail
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx360_pos = $P10."pos"()
  # rx pass
    rx360_cur."!cursor_pass"(rx360_pos, "term:sym<regex_declarator>")
    rx360_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx360_pos)
    .return (rx360_cur)
  rx360_fail:
.annotate "line", 4
    (rx360_rep, rx360_pos, $I10, $P10) = rx360_cur."!mark_fail"(0)
    lt rx360_pos, -1, rx360_done
    eq rx360_pos, -1, rx360_fail
    jump $I10
  rx360_done:
    rx360_cur."!cursor_fail"()
    rx360_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx360_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("95_1258129007.74018") :method
.annotate "line", 4
    $P362 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P363, "ResizablePMCArray"
    push $P363, $P362
    .return ($P363)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("96_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx365_tgt
    .local int rx365_pos
    .local int rx365_off
    .local int rx365_eos
    .local int rx365_rep
    .local pmc rx365_cur
    (rx365_cur, rx365_pos, rx365_tgt, $I10) = self."!cursor_start"()
    rx365_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx365_cur
    .local pmc match
    .lex "$/", match
    length rx365_eos, rx365_tgt
    set rx365_off, 0
    lt $I10, 2, rx365_start
    sub rx365_off, $I10, 1
    substr rx365_tgt, rx365_tgt, rx365_off
  rx365_start:
.annotate "line", 199
  # rx subrule "statement_prefix" subtype=capture negate=
    rx365_cur."!cursor_pos"(rx365_pos)
    $P10 = rx365_cur."statement_prefix"()
    unless $P10, rx365_fail
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx365_pos = $P10."pos"()
  # rx pass
    rx365_cur."!cursor_pass"(rx365_pos, "term:sym<statement_prefix>")
    rx365_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx365_pos)
    .return (rx365_cur)
  rx365_fail:
.annotate "line", 4
    (rx365_rep, rx365_pos, $I10, $P10) = rx365_cur."!mark_fail"(0)
    lt rx365_pos, -1, rx365_done
    eq rx365_pos, -1, rx365_fail
    jump $I10
  rx365_done:
    rx365_cur."!cursor_fail"()
    rx365_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx365_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("97_1258129007.74018") :method
.annotate "line", 4
    $P367 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P368, "ResizablePMCArray"
    push $P368, $P367
    .return ($P368)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("98_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx370_tgt
    .local int rx370_pos
    .local int rx370_off
    .local int rx370_eos
    .local int rx370_rep
    .local pmc rx370_cur
    (rx370_cur, rx370_pos, rx370_tgt, $I10) = self."!cursor_start"()
    rx370_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx370_cur
    .local pmc match
    .lex "$/", match
    length rx370_eos, rx370_tgt
    set rx370_off, 0
    lt $I10, 2, rx370_start
    sub rx370_off, $I10, 1
    substr rx370_tgt, rx370_tgt, rx370_off
  rx370_start:
.annotate "line", 200
  # rx subrule "lambda" subtype=zerowidth negate=
    rx370_cur."!cursor_pos"(rx370_pos)
    $P10 = rx370_cur."lambda"()
    unless $P10, rx370_fail
  # rx subrule "pblock" subtype=capture negate=
    rx370_cur."!cursor_pos"(rx370_pos)
    $P10 = rx370_cur."pblock"()
    unless $P10, rx370_fail
    rx370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx370_pos = $P10."pos"()
  # rx pass
    rx370_cur."!cursor_pass"(rx370_pos, "term:sym<lambda>")
    rx370_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx370_pos)
    .return (rx370_cur)
  rx370_fail:
.annotate "line", 4
    (rx370_rep, rx370_pos, $I10, $P10) = rx370_cur."!mark_fail"(0)
    lt rx370_pos, -1, rx370_done
    eq rx370_pos, -1, rx370_fail
    jump $I10
  rx370_done:
    rx370_cur."!cursor_fail"()
    rx370_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx370_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("99_1258129007.74018") :method
.annotate "line", 4
    new $P372, "ResizablePMCArray"
    push $P372, ""
    .return ($P372)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("100_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx374_tgt
    .local int rx374_pos
    .local int rx374_off
    .local int rx374_eos
    .local int rx374_rep
    .local pmc rx374_cur
    (rx374_cur, rx374_pos, rx374_tgt, $I10) = self."!cursor_start"()
    rx374_cur."!cursor_debug"("START ", "colonpair")
    rx374_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx374_cur
    .local pmc match
    .lex "$/", match
    length rx374_eos, rx374_tgt
    set rx374_off, 0
    lt $I10, 2, rx374_start
    sub rx374_off, $I10, 1
    substr rx374_tgt, rx374_tgt, rx374_off
  rx374_start:
.annotate "line", 203
  # rx literal  ":"
    add $I11, rx374_pos, 1
    gt $I11, rx374_eos, rx374_fail
    sub $I11, rx374_pos, rx374_off
    substr $S10, rx374_tgt, $I11, 1
    ne $S10, ":", rx374_fail
    add rx374_pos, 1
  alt379_0:
.annotate "line", 204
    set_addr $I10, alt379_1
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
.annotate "line", 205
  # rx subcapture "not"
    set_addr $I10, rxcap_380_fail
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
  # rx literal  "!"
    add $I11, rx374_pos, 1
    gt $I11, rx374_eos, rx374_fail
    sub $I11, rx374_pos, rx374_off
    substr $S10, rx374_tgt, $I11, 1
    ne $S10, "!", rx374_fail
    add rx374_pos, 1
    set_addr $I10, rxcap_380_fail
    ($I12, $I11) = rx374_cur."!mark_peek"($I10)
    rx374_cur."!cursor_pos"($I11)
    ($P10) = rx374_cur."!cursor_start"()
    $P10."!cursor_pass"(rx374_pos, "")
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_380_done
  rxcap_380_fail:
    goto rx374_fail
  rxcap_380_done:
  # rx subrule "identifier" subtype=capture negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."identifier"()
    unless $P10, rx374_fail
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx374_pos = $P10."pos"()
    goto alt379_end
  alt379_1:
.annotate "line", 206
  # rx subrule "identifier" subtype=capture negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."identifier"()
    unless $P10, rx374_fail
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx374_pos = $P10."pos"()
  # rx rxquantr381 ** 0..1
    set_addr $I382, rxquantr381_done
    rx374_cur."!mark_push"(0, rx374_pos, $I382)
  rxquantr381_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx374_cur."!cursor_pos"(rx374_pos)
    $P10 = rx374_cur."circumfix"()
    unless $P10, rx374_fail
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx374_pos = $P10."pos"()
    (rx374_rep) = rx374_cur."!mark_commit"($I382)
  rxquantr381_done:
  alt379_end:
.annotate "line", 202
  # rx pass
    rx374_cur."!cursor_pass"(rx374_pos, "colonpair")
    rx374_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx374_pos)
    .return (rx374_cur)
  rx374_fail:
.annotate "line", 4
    (rx374_rep, rx374_pos, $I10, $P10) = rx374_cur."!mark_fail"(0)
    lt rx374_pos, -1, rx374_done
    eq rx374_pos, -1, rx374_fail
    jump $I10
  rx374_done:
    rx374_cur."!cursor_fail"()
    rx374_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx374_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("101_1258129007.74018") :method
.annotate "line", 4
    $P376 = self."!PREFIX__!subrule"("identifier", ":")
    $P377 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P378, "ResizablePMCArray"
    push $P378, $P376
    push $P378, $P377
    .return ($P378)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("102_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt, $I10) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "variable")
    rx384_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx384_cur
    .local pmc match
    .lex "$/", match
    length rx384_eos, rx384_tgt
    set rx384_off, 0
    lt $I10, 2, rx384_start
    sub rx384_off, $I10, 1
    substr rx384_tgt, rx384_tgt, rx384_off
  rx384_start:
  alt389_0:
.annotate "line", 210
    set_addr $I10, alt389_1
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
.annotate "line", 211
  # rx subrule "sigil" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."sigil"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx384_pos = $P10."pos"()
  # rx rxquantr390 ** 0..1
    set_addr $I391, rxquantr390_done
    rx384_cur."!mark_push"(0, rx384_pos, $I391)
  rxquantr390_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."twigil"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx384_pos = $P10."pos"()
    (rx384_rep) = rx384_cur."!mark_commit"($I391)
  rxquantr390_done:
  # rx subrule "ident" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."ident"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx384_pos = $P10."pos"()
    goto alt389_end
  alt389_1:
    set_addr $I10, alt389_2
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
.annotate "line", 212
  # rx subrule "sigil" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."sigil"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx384_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx384_pos, rx384_eos, rx384_fail
    sub $I10, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx384_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."postcircumfix"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx384_pos = $P10."pos"()
    goto alt389_end
  alt389_2:
.annotate "line", 213
  # rx subcapture "sigil"
    set_addr $I10, rxcap_392_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx literal  "$"
    add $I11, rx384_pos, 1
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 1
    ne $S10, "$", rx384_fail
    add rx384_pos, 1
    set_addr $I10, rxcap_392_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_392_done
  rxcap_392_fail:
    goto rx384_fail
  rxcap_392_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_393_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx384_pos, rx384_eos, rx384_fail
    sub $I10, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx384_fail
    inc rx384_pos
    set_addr $I10, rxcap_393_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_393_done
  rxcap_393_fail:
    goto rx384_fail
  rxcap_393_done:
  alt389_end:
.annotate "line", 210
  # rx pass
    rx384_cur."!cursor_pass"(rx384_pos, "variable")
    rx384_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate "line", 4
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx384_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("103_1258129007.74018") :method
.annotate "line", 4
    $P386 = self."!PREFIX__!subrule"("sigil", "")
    $P387 = self."!PREFIX__!subrule"("sigil", "")
    new $P388, "ResizablePMCArray"
    push $P388, "$!"
    push $P388, "$_"
    push $P388, "$/"
    push $P388, $P386
    push $P388, $P387
    .return ($P388)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("104_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt, $I10) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx395_cur
    .local pmc match
    .lex "$/", match
    length rx395_eos, rx395_tgt
    set rx395_off, 0
    lt $I10, 2, rx395_start
    sub rx395_off, $I10, 1
    substr rx395_tgt, rx395_tgt, rx395_off
  rx395_start:
.annotate "line", 216
  # rx enumcharlist negate=0 
    ge rx395_pos, rx395_eos, rx395_fail
    sub $I10, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx395_fail
    inc rx395_pos
  # rx pass
    rx395_cur."!cursor_pass"(rx395_pos, "sigil")
    rx395_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate "line", 4
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx395_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("105_1258129007.74018") :method
.annotate "line", 4
    new $P397, "ResizablePMCArray"
    push $P397, "&"
    push $P397, "%"
    push $P397, "@"
    push $P397, "$"
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("106_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx399_tgt
    .local int rx399_pos
    .local int rx399_off
    .local int rx399_eos
    .local int rx399_rep
    .local pmc rx399_cur
    (rx399_cur, rx399_pos, rx399_tgt, $I10) = self."!cursor_start"()
    rx399_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx399_cur
    .local pmc match
    .lex "$/", match
    length rx399_eos, rx399_tgt
    set rx399_off, 0
    lt $I10, 2, rx399_start
    sub rx399_off, $I10, 1
    substr rx399_tgt, rx399_tgt, rx399_off
  rx399_start:
.annotate "line", 218
  # rx enumcharlist negate=0 
    ge rx399_pos, rx399_eos, rx399_fail
    sub $I10, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx399_fail
    inc rx399_pos
  # rx pass
    rx399_cur."!cursor_pass"(rx399_pos, "twigil")
    rx399_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx399_pos)
    .return (rx399_cur)
  rx399_fail:
.annotate "line", 4
    (rx399_rep, rx399_pos, $I10, $P10) = rx399_cur."!mark_fail"(0)
    lt rx399_pos, -1, rx399_done
    eq rx399_pos, -1, rx399_fail
    jump $I10
  rx399_done:
    rx399_cur."!cursor_fail"()
    rx399_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx399_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("107_1258129007.74018") :method
.annotate "line", 4
    new $P401, "ResizablePMCArray"
    push $P401, "?"
    push $P401, "!"
    push $P401, "*"
    .return ($P401)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("108_1258129007.74018") :method
.annotate "line", 220
    $P403 = self."!protoregex"("package_declarator")
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("109_1258129007.74018") :method
.annotate "line", 220
    $P405 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P405)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("110_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx407_tgt
    .local int rx407_pos
    .local int rx407_off
    .local int rx407_eos
    .local int rx407_rep
    .local pmc rx407_cur
    (rx407_cur, rx407_pos, rx407_tgt, $I10) = self."!cursor_start"()
    rx407_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx407_cur
    .local pmc match
    .lex "$/", match
    length rx407_eos, rx407_tgt
    set rx407_off, 0
    lt $I10, 2, rx407_start
    sub rx407_off, $I10, 1
    substr rx407_tgt, rx407_tgt, rx407_off
  rx407_start:
.annotate "line", 221
  # rx subcapture "sym"
    set_addr $I10, rxcap_411_fail
    rx407_cur."!mark_push"(0, rx407_pos, $I10)
  # rx literal  "module"
    add $I11, rx407_pos, 6
    gt $I11, rx407_eos, rx407_fail
    sub $I11, rx407_pos, rx407_off
    substr $S10, rx407_tgt, $I11, 6
    ne $S10, "module", rx407_fail
    add rx407_pos, 6
    set_addr $I10, rxcap_411_fail
    ($I12, $I11) = rx407_cur."!mark_peek"($I10)
    rx407_cur."!cursor_pos"($I11)
    ($P10) = rx407_cur."!cursor_start"()
    $P10."!cursor_pass"(rx407_pos, "")
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_411_done
  rxcap_411_fail:
    goto rx407_fail
  rxcap_411_done:
  # rx subrule "package_def" subtype=capture negate=
    rx407_cur."!cursor_pos"(rx407_pos)
    $P10 = rx407_cur."package_def"()
    unless $P10, rx407_fail
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx407_pos = $P10."pos"()
  # rx pass
    rx407_cur."!cursor_pass"(rx407_pos, "package_declarator:sym<module>")
    rx407_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx407_pos)
    .return (rx407_cur)
  rx407_fail:
.annotate "line", 4
    (rx407_rep, rx407_pos, $I10, $P10) = rx407_cur."!mark_fail"(0)
    lt rx407_pos, -1, rx407_done
    eq rx407_pos, -1, rx407_fail
    jump $I10
  rx407_done:
    rx407_cur."!cursor_fail"()
    rx407_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx407_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("111_1258129007.74018") :method
.annotate "line", 4
    $P409 = self."!PREFIX__!subrule"("package_def", "module")
    new $P410, "ResizablePMCArray"
    push $P410, $P409
    .return ($P410)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("112_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx413_tgt
    .local int rx413_pos
    .local int rx413_off
    .local int rx413_eos
    .local int rx413_rep
    .local pmc rx413_cur
    (rx413_cur, rx413_pos, rx413_tgt, $I10) = self."!cursor_start"()
    rx413_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx413_cur
    .local pmc match
    .lex "$/", match
    length rx413_eos, rx413_tgt
    set rx413_off, 0
    lt $I10, 2, rx413_start
    sub rx413_off, $I10, 1
    substr rx413_tgt, rx413_tgt, rx413_off
  rx413_start:
.annotate "line", 222
  # rx subcapture "sym"
    set_addr $I10, rxcap_419_fail
    rx413_cur."!mark_push"(0, rx413_pos, $I10)
  alt418_0:
    set_addr $I10, alt418_1
    rx413_cur."!mark_push"(0, rx413_pos, $I10)
  # rx literal  "class"
    add $I11, rx413_pos, 5
    gt $I11, rx413_eos, rx413_fail
    sub $I11, rx413_pos, rx413_off
    substr $S10, rx413_tgt, $I11, 5
    ne $S10, "class", rx413_fail
    add rx413_pos, 5
    goto alt418_end
  alt418_1:
  # rx literal  "grammar"
    add $I11, rx413_pos, 7
    gt $I11, rx413_eos, rx413_fail
    sub $I11, rx413_pos, rx413_off
    substr $S10, rx413_tgt, $I11, 7
    ne $S10, "grammar", rx413_fail
    add rx413_pos, 7
  alt418_end:
    set_addr $I10, rxcap_419_fail
    ($I12, $I11) = rx413_cur."!mark_peek"($I10)
    rx413_cur."!cursor_pos"($I11)
    ($P10) = rx413_cur."!cursor_start"()
    $P10."!cursor_pass"(rx413_pos, "")
    rx413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_419_done
  rxcap_419_fail:
    goto rx413_fail
  rxcap_419_done:
  # rx subrule "package_def" subtype=capture negate=
    rx413_cur."!cursor_pos"(rx413_pos)
    $P10 = rx413_cur."package_def"()
    unless $P10, rx413_fail
    rx413_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx413_pos = $P10."pos"()
  # rx pass
    rx413_cur."!cursor_pass"(rx413_pos, "package_declarator:sym<class>")
    rx413_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx413_pos)
    .return (rx413_cur)
  rx413_fail:
.annotate "line", 4
    (rx413_rep, rx413_pos, $I10, $P10) = rx413_cur."!mark_fail"(0)
    lt rx413_pos, -1, rx413_done
    eq rx413_pos, -1, rx413_fail
    jump $I10
  rx413_done:
    rx413_cur."!cursor_fail"()
    rx413_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx413_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("113_1258129007.74018") :method
.annotate "line", 4
    $P415 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P416 = self."!PREFIX__!subrule"("package_def", "class")
    new $P417, "ResizablePMCArray"
    push $P417, $P415
    push $P417, $P416
    .return ($P417)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("114_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt, $I10) = self."!cursor_start"()
    rx421_cur."!cursor_debug"("START ", "package_def")
    rx421_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx421_cur
    .local pmc match
    .lex "$/", match
    length rx421_eos, rx421_tgt
    set rx421_off, 0
    lt $I10, 2, rx421_start
    sub rx421_off, $I10, 1
    substr rx421_tgt, rx421_tgt, rx421_off
  rx421_start:
.annotate "line", 224
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
.annotate "line", 225
  # rx subrule "name" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."name"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx421_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
.annotate "line", 226
  # rx rxquantr426 ** 0..1
    set_addr $I430, rxquantr426_done
    rx421_cur."!mark_push"(0, rx421_pos, $I430)
  rxquantr426_loop:
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx421_pos, 2
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 2
    ne $S10, "is", rx421_fail
    add rx421_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."name"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx421_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
    (rx421_rep) = rx421_cur."!mark_commit"($I430)
  rxquantr426_done:
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  alt432_0:
.annotate "line", 227
    set_addr $I10, alt432_1
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 228
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, ";", rx421_fail
    add rx421_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."comp_unit"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx421_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
    goto alt432_end
  alt432_1:
    set_addr $I10, alt432_2
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 229
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx421_pos, rx421_eos, rx421_fail
    sub $I10, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx421_fail
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."block"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx421_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
    goto alt432_end
  alt432_2:
.annotate "line", 230
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."panic"("Malformed package declaration")
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  alt432_end:
.annotate "line", 231
  # rx subrule "ws" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."ws"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
.annotate "line", 224
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "package_def")
    rx421_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_fail:
.annotate "line", 4
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx421_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("115_1258129007.74018") :method
.annotate "line", 4
    new $P423, "ResizablePMCArray"
    push $P423, ""
    .return ($P423)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("116_1258129007.74018") :method
.annotate "line", 234
    $P443 = self."!protoregex"("scope_declarator")
    .return ($P443)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("117_1258129007.74018") :method
.annotate "line", 234
    $P445 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P445)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("118_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt, $I10) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx447_cur
    .local pmc match
    .lex "$/", match
    length rx447_eos, rx447_tgt
    set rx447_off, 0
    lt $I10, 2, rx447_start
    sub rx447_off, $I10, 1
    substr rx447_tgt, rx447_tgt, rx447_off
  rx447_start:
.annotate "line", 235
  # rx subcapture "sym"
    set_addr $I10, rxcap_451_fail
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  # rx literal  "my"
    add $I11, rx447_pos, 2
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 2
    ne $S10, "my", rx447_fail
    add rx447_pos, 2
    set_addr $I10, rxcap_451_fail
    ($I12, $I11) = rx447_cur."!mark_peek"($I10)
    rx447_cur."!cursor_pos"($I11)
    ($P10) = rx447_cur."!cursor_start"()
    $P10."!cursor_pass"(rx447_pos, "")
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_451_done
  rxcap_451_fail:
    goto rx447_fail
  rxcap_451_done:
  # rx subrule "scoped" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."scoped"("my")
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx447_pos = $P10."pos"()
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "scope_declarator:sym<my>")
    rx447_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate "line", 4
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx447_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("119_1258129007.74018") :method
.annotate "line", 4
    $P449 = self."!PREFIX__!subrule"("scoped", "my")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("120_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt, $I10) = self."!cursor_start"()
    rx453_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx453_cur
    .local pmc match
    .lex "$/", match
    length rx453_eos, rx453_tgt
    set rx453_off, 0
    lt $I10, 2, rx453_start
    sub rx453_off, $I10, 1
    substr rx453_tgt, rx453_tgt, rx453_off
  rx453_start:
.annotate "line", 236
  # rx subcapture "sym"
    set_addr $I10, rxcap_457_fail
    rx453_cur."!mark_push"(0, rx453_pos, $I10)
  # rx literal  "our"
    add $I11, rx453_pos, 3
    gt $I11, rx453_eos, rx453_fail
    sub $I11, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I11, 3
    ne $S10, "our", rx453_fail
    add rx453_pos, 3
    set_addr $I10, rxcap_457_fail
    ($I12, $I11) = rx453_cur."!mark_peek"($I10)
    rx453_cur."!cursor_pos"($I11)
    ($P10) = rx453_cur."!cursor_start"()
    $P10."!cursor_pass"(rx453_pos, "")
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_457_done
  rxcap_457_fail:
    goto rx453_fail
  rxcap_457_done:
  # rx subrule "scoped" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."scoped"("our")
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx453_pos = $P10."pos"()
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "scope_declarator:sym<our>")
    rx453_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_fail:
.annotate "line", 4
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx453_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("121_1258129007.74018") :method
.annotate "line", 4
    $P455 = self."!PREFIX__!subrule"("scoped", "our")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("122_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt, $I10) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    set rx459_off, 0
    lt $I10, 2, rx459_start
    sub rx459_off, $I10, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
.annotate "line", 237
  # rx subcapture "sym"
    set_addr $I10, rxcap_463_fail
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  # rx literal  "has"
    add $I11, rx459_pos, 3
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I11, 3
    ne $S10, "has", rx459_fail
    add rx459_pos, 3
    set_addr $I10, rxcap_463_fail
    ($I12, $I11) = rx459_cur."!mark_peek"($I10)
    rx459_cur."!cursor_pos"($I11)
    ($P10) = rx459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx459_pos, "")
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_463_done
  rxcap_463_fail:
    goto rx459_fail
  rxcap_463_done:
  # rx subrule "scoped" subtype=capture negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."scoped"("has")
    unless $P10, rx459_fail
    rx459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx459_pos = $P10."pos"()
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "scope_declarator:sym<has>")
    rx459_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
.annotate "line", 4
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx459_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("123_1258129007.74018") :method
.annotate "line", 4
    $P461 = self."!PREFIX__!subrule"("scoped", "has")
    new $P462, "ResizablePMCArray"
    push $P462, $P461
    .return ($P462)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("124_1258129007.74018") :method :outer("11_1258129007.74018")
    .param pmc param_465
.annotate "line", 239
    .lex "$*SCOPE", param_465
.annotate "line", 4
    .local string rx466_tgt
    .local int rx466_pos
    .local int rx466_off
    .local int rx466_eos
    .local int rx466_rep
    .local pmc rx466_cur
    (rx466_cur, rx466_pos, rx466_tgt, $I10) = self."!cursor_start"()
    rx466_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx466_cur
    .local pmc match
    .lex "$/", match
    length rx466_eos, rx466_tgt
    set rx466_off, 0
    lt $I10, 2, rx466_start
    sub rx466_off, $I10, 1
    substr rx466_tgt, rx466_tgt, rx466_off
  rx466_start:
  alt469_0:
.annotate "line", 239
    set_addr $I10, alt469_1
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
.annotate "line", 240
  # rx subrule "ws" subtype=method negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."ws"()
    unless $P10, rx466_fail
    rx466_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."variable_declarator"()
    unless $P10, rx466_fail
    rx466_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx466_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."ws"()
    unless $P10, rx466_fail
    rx466_pos = $P10."pos"()
    goto alt469_end
  alt469_1:
.annotate "line", 241
  # rx subrule "ws" subtype=method negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."ws"()
    unless $P10, rx466_fail
    rx466_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."routine_declarator"()
    unless $P10, rx466_fail
    rx466_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx466_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx466_cur."!cursor_pos"(rx466_pos)
    $P10 = rx466_cur."ws"()
    unless $P10, rx466_fail
    rx466_pos = $P10."pos"()
  alt469_end:
.annotate "line", 239
  # rx pass
    rx466_cur."!cursor_pass"(rx466_pos, "scoped")
    rx466_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx466_pos)
    .return (rx466_cur)
  rx466_fail:
.annotate "line", 4
    (rx466_rep, rx466_pos, $I10, $P10) = rx466_cur."!mark_fail"(0)
    lt rx466_pos, -1, rx466_done
    eq rx466_pos, -1, rx466_fail
    jump $I10
  rx466_done:
    rx466_cur."!cursor_fail"()
    rx466_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx466_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("125_1258129007.74018") :method
.annotate "line", 4
    new $P468, "ResizablePMCArray"
    push $P468, ""
    push $P468, ""
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("126_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    set rx475_off, 0
    lt $I10, 2, rx475_start
    sub rx475_off, $I10, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
.annotate "line", 244
  # rx subrule "variable" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."variable"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx475_pos = $P10."pos"()
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "variable_declarator")
    rx475_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate "line", 4
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("127_1258129007.74018") :method
.annotate "line", 4
    $P477 = self."!PREFIX__!subrule"("variable", "")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("128_1258129007.74018") :method
.annotate "line", 246
    $P480 = self."!protoregex"("routine_declarator")
    .return ($P480)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("129_1258129007.74018") :method
.annotate "line", 246
    $P482 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P482)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("130_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt, $I10) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    set rx484_off, 0
    lt $I10, 2, rx484_start
    sub rx484_off, $I10, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
.annotate "line", 247
  # rx subcapture "sym"
    set_addr $I10, rxcap_488_fail
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  # rx literal  "sub"
    add $I11, rx484_pos, 3
    gt $I11, rx484_eos, rx484_fail
    sub $I11, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I11, 3
    ne $S10, "sub", rx484_fail
    add rx484_pos, 3
    set_addr $I10, rxcap_488_fail
    ($I12, $I11) = rx484_cur."!mark_peek"($I10)
    rx484_cur."!cursor_pos"($I11)
    ($P10) = rx484_cur."!cursor_start"()
    $P10."!cursor_pass"(rx484_pos, "")
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_488_done
  rxcap_488_fail:
    goto rx484_fail
  rxcap_488_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx484_cur."!cursor_pos"(rx484_pos)
    $P10 = rx484_cur."routine_def"()
    unless $P10, rx484_fail
    rx484_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx484_pos = $P10."pos"()
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "routine_declarator:sym<sub>")
    rx484_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
.annotate "line", 4
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx484_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("131_1258129007.74018") :method
.annotate "line", 4
    $P486 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P487, "ResizablePMCArray"
    push $P487, $P486
    .return ($P487)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("132_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx490_tgt
    .local int rx490_pos
    .local int rx490_off
    .local int rx490_eos
    .local int rx490_rep
    .local pmc rx490_cur
    (rx490_cur, rx490_pos, rx490_tgt, $I10) = self."!cursor_start"()
    rx490_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx490_cur
    .local pmc match
    .lex "$/", match
    length rx490_eos, rx490_tgt
    set rx490_off, 0
    lt $I10, 2, rx490_start
    sub rx490_off, $I10, 1
    substr rx490_tgt, rx490_tgt, rx490_off
  rx490_start:
.annotate "line", 248
  # rx subcapture "sym"
    set_addr $I10, rxcap_494_fail
    rx490_cur."!mark_push"(0, rx490_pos, $I10)
  # rx literal  "method"
    add $I11, rx490_pos, 6
    gt $I11, rx490_eos, rx490_fail
    sub $I11, rx490_pos, rx490_off
    substr $S10, rx490_tgt, $I11, 6
    ne $S10, "method", rx490_fail
    add rx490_pos, 6
    set_addr $I10, rxcap_494_fail
    ($I12, $I11) = rx490_cur."!mark_peek"($I10)
    rx490_cur."!cursor_pos"($I11)
    ($P10) = rx490_cur."!cursor_start"()
    $P10."!cursor_pass"(rx490_pos, "")
    rx490_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_494_done
  rxcap_494_fail:
    goto rx490_fail
  rxcap_494_done:
  # rx subrule "method_def" subtype=capture negate=
    rx490_cur."!cursor_pos"(rx490_pos)
    $P10 = rx490_cur."method_def"()
    unless $P10, rx490_fail
    rx490_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx490_pos = $P10."pos"()
  # rx pass
    rx490_cur."!cursor_pass"(rx490_pos, "routine_declarator:sym<method>")
    rx490_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx490_pos)
    .return (rx490_cur)
  rx490_fail:
.annotate "line", 4
    (rx490_rep, rx490_pos, $I10, $P10) = rx490_cur."!mark_fail"(0)
    lt rx490_pos, -1, rx490_done
    eq rx490_pos, -1, rx490_fail
    jump $I10
  rx490_done:
    rx490_cur."!cursor_fail"()
    rx490_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx490_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("133_1258129007.74018") :method
.annotate "line", 4
    $P492 = self."!PREFIX__!subrule"("method_def", "method")
    new $P493, "ResizablePMCArray"
    push $P493, $P492
    .return ($P493)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("134_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx496_tgt
    .local int rx496_pos
    .local int rx496_off
    .local int rx496_eos
    .local int rx496_rep
    .local pmc rx496_cur
    (rx496_cur, rx496_pos, rx496_tgt, $I10) = self."!cursor_start"()
    rx496_cur."!cursor_debug"("START ", "routine_def")
    rx496_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx496_cur
    .local pmc match
    .lex "$/", match
    length rx496_eos, rx496_tgt
    set rx496_off, 0
    lt $I10, 2, rx496_start
    sub rx496_off, $I10, 1
    substr rx496_tgt, rx496_tgt, rx496_off
  rx496_start:
.annotate "line", 250
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
.annotate "line", 251
  # rx rxquantr500 ** 0..1
    set_addr $I501, rxquantr500_done
    rx496_cur."!mark_push"(0, rx496_pos, $I501)
  rxquantr500_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."deflongname"()
    unless $P10, rx496_fail
    rx496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx496_pos = $P10."pos"()
    (rx496_rep) = rx496_cur."!mark_commit"($I501)
  rxquantr500_done:
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
.annotate "line", 252
  # rx subrule "newpad" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."newpad"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  alt504_0:
.annotate "line", 253
    set_addr $I10, alt504_1
    rx496_cur."!mark_push"(0, rx496_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx496_pos, 1
    gt $I11, rx496_eos, rx496_fail
    sub $I11, rx496_pos, rx496_off
    substr $S10, rx496_tgt, $I11, 1
    ne $S10, "(", rx496_fail
    add rx496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."signature"()
    unless $P10, rx496_fail
    rx496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx496_pos, 1
    gt $I11, rx496_eos, rx496_fail
    sub $I11, rx496_pos, rx496_off
    substr $S10, rx496_tgt, $I11, 1
    ne $S10, ")", rx496_fail
    add rx496_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
    goto alt504_end
  alt504_1:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
  alt504_end:
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
.annotate "line", 255
  # rx subrule "blockoid" subtype=capture negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."blockoid"()
    unless $P10, rx496_fail
    rx496_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx496_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx496_cur."!cursor_pos"(rx496_pos)
    $P10 = rx496_cur."ws"()
    unless $P10, rx496_fail
    rx496_pos = $P10."pos"()
.annotate "line", 250
  # rx pass
    rx496_cur."!cursor_pass"(rx496_pos, "routine_def")
    rx496_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx496_pos)
    .return (rx496_cur)
  rx496_fail:
.annotate "line", 4
    (rx496_rep, rx496_pos, $I10, $P10) = rx496_cur."!mark_fail"(0)
    lt rx496_pos, -1, rx496_done
    eq rx496_pos, -1, rx496_fail
    jump $I10
  rx496_done:
    rx496_cur."!cursor_fail"()
    rx496_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx496_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("135_1258129007.74018") :method
.annotate "line", 4
    new $P498, "ResizablePMCArray"
    push $P498, ""
    .return ($P498)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("136_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx514_tgt
    .local int rx514_pos
    .local int rx514_off
    .local int rx514_eos
    .local int rx514_rep
    .local pmc rx514_cur
    (rx514_cur, rx514_pos, rx514_tgt, $I10) = self."!cursor_start"()
    rx514_cur."!cursor_debug"("START ", "method_def")
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
    rx514_cur."!cursor_pass"(rx514_pos, "method_def")
    rx514_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx514_pos)
    .return (rx514_cur)
  rx514_fail:
.annotate "line", 4
    (rx514_rep, rx514_pos, $I10, $P10) = rx514_cur."!mark_fail"(0)
    lt rx514_pos, -1, rx514_done
    eq rx514_pos, -1, rx514_fail
    jump $I10
  rx514_done:
    rx514_cur."!cursor_fail"()
    rx514_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx514_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("137_1258129007.74018") :method
.annotate "line", 4
    new $P516, "ResizablePMCArray"
    push $P516, ""
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("138_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx532_tgt
    .local int rx532_pos
    .local int rx532_off
    .local int rx532_eos
    .local int rx532_rep
    .local pmc rx532_cur
    (rx532_cur, rx532_pos, rx532_tgt, $I10) = self."!cursor_start"()
    rx532_cur."!cursor_debug"("START ", "signature")
    rx532_cur."!cursor_caparray"("parameter")
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
  # rx rxquantr535 ** 0..1
    set_addr $I538, rxquantr535_done
    rx532_cur."!mark_push"(0, rx532_pos, $I538)
  rxquantr535_loop:
  # rx rxquantr536 ** 1..*
    set_addr $I537, rxquantr536_done
    rx532_cur."!mark_push"(0, -1, $I537)
  rxquantr536_loop:
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."parameter"()
    unless $P10, rx532_fail
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx532_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."ws"()
    unless $P10, rx532_fail
    rx532_pos = $P10."pos"()
    (rx532_rep) = rx532_cur."!mark_commit"($I537)
    rx532_cur."!mark_push"(rx532_rep, rx532_pos, $I537)
  # rx literal  ","
    add $I11, rx532_pos, 1
    gt $I11, rx532_eos, rx532_fail
    sub $I11, rx532_pos, rx532_off
    substr $S10, rx532_tgt, $I11, 1
    ne $S10, ",", rx532_fail
    add rx532_pos, 1
    goto rxquantr536_loop
  rxquantr536_done:
    (rx532_rep) = rx532_cur."!mark_commit"($I538)
  rxquantr535_done:
  # rx pass
    rx532_cur."!cursor_pass"(rx532_pos, "signature")
    rx532_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx532_pos)
    .return (rx532_cur)
  rx532_fail:
.annotate "line", 4
    (rx532_rep, rx532_pos, $I10, $P10) = rx532_cur."!mark_fail"(0)
    lt rx532_pos, -1, rx532_done
    eq rx532_pos, -1, rx532_fail
    jump $I10
  rx532_done:
    rx532_cur."!cursor_fail"()
    rx532_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx532_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("139_1258129007.74018") :method
.annotate "line", 4
    new $P534, "ResizablePMCArray"
    push $P534, ""
    .return ($P534)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("140_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx540_tgt
    .local int rx540_pos
    .local int rx540_off
    .local int rx540_eos
    .local int rx540_rep
    .local pmc rx540_cur
    (rx540_cur, rx540_pos, rx540_tgt, $I10) = self."!cursor_start"()
    rx540_cur."!cursor_debug"("START ", "parameter")
    rx540_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx540_cur
    .local pmc match
    .lex "$/", match
    length rx540_eos, rx540_tgt
    set rx540_off, 0
    lt $I10, 2, rx540_start
    sub rx540_off, $I10, 1
    substr rx540_tgt, rx540_tgt, rx540_off
  rx540_start:
  alt546_0:
.annotate "line", 269
    set_addr $I10, alt546_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
.annotate "line", 270
  # rx subcapture "quant"
    set_addr $I10, rxcap_547_fail
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx literal  "*"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, "*", rx540_fail
    add rx540_pos, 1
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx540_cur."!mark_peek"($I10)
    rx540_cur."!cursor_pos"($I11)
    ($P10) = rx540_cur."!cursor_start"()
    $P10."!cursor_pass"(rx540_pos, "")
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx540_fail
  rxcap_547_done:
  # rx subrule "param_var" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."param_var"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx540_pos = $P10."pos"()
    goto alt546_end
  alt546_1:
  alt548_0:
.annotate "line", 271
    set_addr $I10, alt548_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."param_var"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx540_pos = $P10."pos"()
    goto alt548_end
  alt548_1:
  # rx subrule "named_param" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."named_param"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx540_pos = $P10."pos"()
  alt548_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_550_fail
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  alt549_0:
    set_addr $I10, alt549_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx literal  "?"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, "?", rx540_fail
    add rx540_pos, 1
    goto alt549_end
  alt549_1:
    set_addr $I10, alt549_2
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx literal  "!"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, "!", rx540_fail
    add rx540_pos, 1
    goto alt549_end
  alt549_2:
  alt549_end:
    set_addr $I10, rxcap_550_fail
    ($I12, $I11) = rx540_cur."!mark_peek"($I10)
    rx540_cur."!cursor_pos"($I11)
    ($P10) = rx540_cur."!cursor_start"()
    $P10."!cursor_pass"(rx540_pos, "")
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_550_done
  rxcap_550_fail:
    goto rx540_fail
  rxcap_550_done:
  alt546_end:
.annotate "line", 273
  # rx rxquantr551 ** 0..1
    set_addr $I552, rxquantr551_done
    rx540_cur."!mark_push"(0, rx540_pos, $I552)
  rxquantr551_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."default_value"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx540_pos = $P10."pos"()
    (rx540_rep) = rx540_cur."!mark_commit"($I552)
  rxquantr551_done:
.annotate "line", 268
  # rx pass
    rx540_cur."!cursor_pass"(rx540_pos, "parameter")
    rx540_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx540_pos)
    .return (rx540_cur)
  rx540_fail:
.annotate "line", 4
    (rx540_rep, rx540_pos, $I10, $P10) = rx540_cur."!mark_fail"(0)
    lt rx540_pos, -1, rx540_done
    eq rx540_pos, -1, rx540_fail
    jump $I10
  rx540_done:
    rx540_cur."!cursor_fail"()
    rx540_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx540_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("141_1258129007.74018") :method
.annotate "line", 4
    $P542 = self."!PREFIX__!subrule"("named_param", "")
    $P543 = self."!PREFIX__!subrule"("param_var", "")
    $P544 = self."!PREFIX__!subrule"("param_var", "*")
    new $P545, "ResizablePMCArray"
    push $P545, $P542
    push $P545, $P543
    push $P545, $P544
    .return ($P545)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("142_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx554_tgt
    .local int rx554_pos
    .local int rx554_off
    .local int rx554_eos
    .local int rx554_rep
    .local pmc rx554_cur
    (rx554_cur, rx554_pos, rx554_tgt, $I10) = self."!cursor_start"()
    rx554_cur."!cursor_debug"("START ", "param_var")
    rx554_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx554_cur
    .local pmc match
    .lex "$/", match
    length rx554_eos, rx554_tgt
    set rx554_off, 0
    lt $I10, 2, rx554_start
    sub rx554_off, $I10, 1
    substr rx554_tgt, rx554_tgt, rx554_off
  rx554_start:
.annotate "line", 277
  # rx subrule "sigil" subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    $P10 = rx554_cur."sigil"()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx554_pos = $P10."pos"()
  # rx rxquantr558 ** 0..1
    set_addr $I559, rxquantr558_done
    rx554_cur."!mark_push"(0, rx554_pos, $I559)
  rxquantr558_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    $P10 = rx554_cur."twigil"()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx554_pos = $P10."pos"()
    (rx554_rep) = rx554_cur."!mark_commit"($I559)
  rxquantr558_done:
  alt560_0:
.annotate "line", 278
    set_addr $I10, alt560_1
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    $P10 = rx554_cur."ident"()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx554_pos = $P10."pos"()
    goto alt560_end
  alt560_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_561_fail
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx554_pos, rx554_eos, rx554_fail
    sub $I10, rx554_pos, rx554_off
    substr $S10, rx554_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx554_fail
    inc rx554_pos
    set_addr $I10, rxcap_561_fail
    ($I12, $I11) = rx554_cur."!mark_peek"($I10)
    rx554_cur."!cursor_pos"($I11)
    ($P10) = rx554_cur."!cursor_start"()
    $P10."!cursor_pass"(rx554_pos, "")
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_561_done
  rxcap_561_fail:
    goto rx554_fail
  rxcap_561_done:
  alt560_end:
.annotate "line", 276
  # rx pass
    rx554_cur."!cursor_pass"(rx554_pos, "param_var")
    rx554_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx554_pos)
    .return (rx554_cur)
  rx554_fail:
.annotate "line", 4
    (rx554_rep, rx554_pos, $I10, $P10) = rx554_cur."!mark_fail"(0)
    lt rx554_pos, -1, rx554_done
    eq rx554_pos, -1, rx554_fail
    jump $I10
  rx554_done:
    rx554_cur."!cursor_fail"()
    rx554_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx554_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("143_1258129007.74018") :method
.annotate "line", 4
    $P556 = self."!PREFIX__!subrule"("sigil", "")
    new $P557, "ResizablePMCArray"
    push $P557, $P556
    .return ($P557)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("144_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx563_tgt
    .local int rx563_pos
    .local int rx563_off
    .local int rx563_eos
    .local int rx563_rep
    .local pmc rx563_cur
    (rx563_cur, rx563_pos, rx563_tgt, $I10) = self."!cursor_start"()
    rx563_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx563_cur
    .local pmc match
    .lex "$/", match
    length rx563_eos, rx563_tgt
    set rx563_off, 0
    lt $I10, 2, rx563_start
    sub rx563_off, $I10, 1
    substr rx563_tgt, rx563_tgt, rx563_off
  rx563_start:
.annotate "line", 282
  # rx literal  ":"
    add $I11, rx563_pos, 1
    gt $I11, rx563_eos, rx563_fail
    sub $I11, rx563_pos, rx563_off
    substr $S10, rx563_tgt, $I11, 1
    ne $S10, ":", rx563_fail
    add rx563_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx563_cur."!cursor_pos"(rx563_pos)
    $P10 = rx563_cur."param_var"()
    unless $P10, rx563_fail
    rx563_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx563_pos = $P10."pos"()
.annotate "line", 281
  # rx pass
    rx563_cur."!cursor_pass"(rx563_pos, "named_param")
    rx563_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx563_pos)
    .return (rx563_cur)
  rx563_fail:
.annotate "line", 4
    (rx563_rep, rx563_pos, $I10, $P10) = rx563_cur."!mark_fail"(0)
    lt rx563_pos, -1, rx563_done
    eq rx563_pos, -1, rx563_fail
    jump $I10
  rx563_done:
    rx563_cur."!cursor_fail"()
    rx563_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx563_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("145_1258129007.74018") :method
.annotate "line", 4
    $P565 = self."!PREFIX__!subrule"("param_var", ":")
    new $P566, "ResizablePMCArray"
    push $P566, $P565
    .return ($P566)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("146_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx568_tgt
    .local int rx568_pos
    .local int rx568_off
    .local int rx568_eos
    .local int rx568_rep
    .local pmc rx568_cur
    (rx568_cur, rx568_pos, rx568_tgt, $I10) = self."!cursor_start"()
    rx568_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx568_cur
    .local pmc match
    .lex "$/", match
    length rx568_eos, rx568_tgt
    set rx568_off, 0
    lt $I10, 2, rx568_start
    sub rx568_off, $I10, 1
    substr rx568_tgt, rx568_tgt, rx568_off
  rx568_start:
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx568_cur."!cursor_pos"(rx568_pos)
    $P10 = rx568_cur."ws"()
    unless $P10, rx568_fail
    rx568_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx568_pos, 1
    gt $I11, rx568_eos, rx568_fail
    sub $I11, rx568_pos, rx568_off
    substr $S10, rx568_tgt, $I11, 1
    ne $S10, "=", rx568_fail
    add rx568_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx568_cur."!cursor_pos"(rx568_pos)
    $P10 = rx568_cur."ws"()
    unless $P10, rx568_fail
    rx568_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx568_cur."!cursor_pos"(rx568_pos)
    $P10 = rx568_cur."EXPR"("i=")
    unless $P10, rx568_fail
    rx568_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx568_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx568_cur."!cursor_pos"(rx568_pos)
    $P10 = rx568_cur."ws"()
    unless $P10, rx568_fail
    rx568_pos = $P10."pos"()
  # rx pass
    rx568_cur."!cursor_pass"(rx568_pos, "default_value")
    rx568_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx568_pos)
    .return (rx568_cur)
  rx568_fail:
.annotate "line", 4
    (rx568_rep, rx568_pos, $I10, $P10) = rx568_cur."!mark_fail"(0)
    lt rx568_pos, -1, rx568_done
    eq rx568_pos, -1, rx568_fail
    jump $I10
  rx568_done:
    rx568_cur."!cursor_fail"()
    rx568_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx568_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("147_1258129007.74018") :method
.annotate "line", 4
    new $P570, "ResizablePMCArray"
    push $P570, ""
    .return ($P570)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("148_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx575_tgt
    .local int rx575_pos
    .local int rx575_off
    .local int rx575_eos
    .local int rx575_rep
    .local pmc rx575_cur
    (rx575_cur, rx575_pos, rx575_tgt, $I10) = self."!cursor_start"()
    rx575_cur."!cursor_debug"("START ", "regex_declarator")
    rx575_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx575_cur
    .local pmc match
    .lex "$/", match
    length rx575_eos, rx575_tgt
    set rx575_off, 0
    lt $I10, 2, rx575_start
    sub rx575_off, $I10, 1
    substr rx575_tgt, rx575_tgt, rx575_off
  rx575_start:
.annotate "line", 287
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  alt579_0:
.annotate "line", 288
    set_addr $I10, alt579_1
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
.annotate "line", 289
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_581_fail
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  # rx literal  "proto"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "proto", rx575_fail
    add rx575_pos, 5
    set_addr $I10, rxcap_581_fail
    ($I12, $I11) = rx575_cur."!mark_peek"($I10)
    rx575_cur."!cursor_pos"($I11)
    ($P10) = rx575_cur."!cursor_start"()
    $P10."!cursor_pass"(rx575_pos, "")
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_581_done
  rxcap_581_fail:
    goto rx575_fail
  rxcap_581_done:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  alt583_0:
    set_addr $I10, alt583_1
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  # rx literal  "regex"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "regex", rx575_fail
    add rx575_pos, 5
    goto alt583_end
  alt583_1:
    set_addr $I10, alt583_2
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  # rx literal  "token"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "token", rx575_fail
    add rx575_pos, 5
    goto alt583_end
  alt583_2:
  # rx literal  "rule"
    add $I11, rx575_pos, 4
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 4
    ne $S10, "rule", rx575_fail
    add rx575_pos, 4
  alt583_end:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 290
  # rx subrule "deflongname" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."deflongname"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 291
  # rx literal  "{"
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, "{", rx575_fail
    add rx575_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "<...>", rx575_fail
    add rx575_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, "}", rx575_fail
    add rx575_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ENDSTMT"()
    unless $P10, rx575_fail
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 289
    goto alt579_end
  alt579_1:
.annotate "line", 292
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_591_fail
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  alt590_0:
    set_addr $I10, alt590_1
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  # rx literal  "regex"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "regex", rx575_fail
    add rx575_pos, 5
    goto alt590_end
  alt590_1:
    set_addr $I10, alt590_2
    rx575_cur."!mark_push"(0, rx575_pos, $I10)
  # rx literal  "token"
    add $I11, rx575_pos, 5
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 5
    ne $S10, "token", rx575_fail
    add rx575_pos, 5
    goto alt590_end
  alt590_2:
  # rx literal  "rule"
    add $I11, rx575_pos, 4
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 4
    ne $S10, "rule", rx575_fail
    add rx575_pos, 4
  alt590_end:
    set_addr $I10, rxcap_591_fail
    ($I12, $I11) = rx575_cur."!mark_peek"($I10)
    rx575_cur."!cursor_pos"($I11)
    ($P10) = rx575_cur."!cursor_start"()
    $P10."!cursor_pass"(rx575_pos, "")
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_591_done
  rxcap_591_fail:
    goto rx575_fail
  rxcap_591_done:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 293
  # rx subrule "deflongname" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."deflongname"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 294
  # rx subrule "newpad" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."newpad"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 295
  # rx rxquantr595 ** 0..1
    set_addr $I600, rxquantr595_done
    rx575_cur."!mark_push"(0, rx575_pos, $I600)
  rxquantr595_loop:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, "(", rx575_fail
    add rx575_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."signature"()
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx575_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, ")", rx575_fail
    add rx575_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
    (rx575_rep) = rx575_cur."!mark_commit"($I600)
  rxquantr595_done:
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 296
  # rx reduce name="regex_declarator" key="open"
    rx575_cur."!cursor_pos"(rx575_pos)
    rx575_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 297
  # rx literal  "{"
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, "{", rx575_fail
    add rx575_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."LANG"("Regex", "nibbler")
    unless $P10, rx575_fail
    rx575_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx575_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx575_pos, 1
    gt $I11, rx575_eos, rx575_fail
    sub $I11, rx575_pos, rx575_off
    substr $S10, rx575_tgt, $I11, 1
    ne $S10, "}", rx575_fail
    add rx575_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ENDSTMT"()
    unless $P10, rx575_fail
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
  alt579_end:
.annotate "line", 298
  # rx subrule "ws" subtype=method negate=
    rx575_cur."!cursor_pos"(rx575_pos)
    $P10 = rx575_cur."ws"()
    unless $P10, rx575_fail
    rx575_pos = $P10."pos"()
.annotate "line", 287
  # rx pass
    rx575_cur."!cursor_pass"(rx575_pos, "regex_declarator")
    rx575_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx575_pos)
    .return (rx575_cur)
  rx575_fail:
.annotate "line", 4
    (rx575_rep, rx575_pos, $I10, $P10) = rx575_cur."!mark_fail"(0)
    lt rx575_pos, -1, rx575_done
    eq rx575_pos, -1, rx575_fail
    jump $I10
  rx575_done:
    rx575_cur."!cursor_fail"()
    rx575_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx575_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("149_1258129007.74018") :method
.annotate "line", 4
    new $P577, "ResizablePMCArray"
    push $P577, ""
    .return ($P577)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("150_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx606_tgt
    .local int rx606_pos
    .local int rx606_off
    .local int rx606_eos
    .local int rx606_rep
    .local pmc rx606_cur
    (rx606_cur, rx606_pos, rx606_tgt, $I10) = self."!cursor_start"()
    rx606_cur."!cursor_debug"("START ", "dotty")
    rx606_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx606_cur
    .local pmc match
    .lex "$/", match
    length rx606_eos, rx606_tgt
    set rx606_off, 0
    lt $I10, 2, rx606_start
    sub rx606_off, $I10, 1
    substr rx606_tgt, rx606_tgt, rx606_off
  rx606_start:
.annotate "line", 302
  # rx literal  "."
    add $I11, rx606_pos, 1
    gt $I11, rx606_eos, rx606_fail
    sub $I11, rx606_pos, rx606_off
    substr $S10, rx606_tgt, $I11, 1
    ne $S10, ".", rx606_fail
    add rx606_pos, 1
  # rx subrule "identifier" subtype=capture negate=
    rx606_cur."!cursor_pos"(rx606_pos)
    $P10 = rx606_cur."identifier"()
    unless $P10, rx606_fail
    rx606_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx606_pos = $P10."pos"()
.annotate "line", 306
  # rx rxquantr610 ** 0..1
    set_addr $I612, rxquantr610_done
    rx606_cur."!mark_push"(0, rx606_pos, $I612)
  rxquantr610_loop:
  alt611_0:
.annotate "line", 303
    set_addr $I10, alt611_1
    rx606_cur."!mark_push"(0, rx606_pos, $I10)
.annotate "line", 304
  # rx enumcharlist negate=0 zerowidth
    ge rx606_pos, rx606_eos, rx606_fail
    sub $I10, rx606_pos, rx606_off
    substr $S10, rx606_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx606_fail
  # rx subrule "args" subtype=capture negate=
    rx606_cur."!cursor_pos"(rx606_pos)
    $P10 = rx606_cur."args"()
    unless $P10, rx606_fail
    rx606_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx606_pos = $P10."pos"()
    goto alt611_end
  alt611_1:
.annotate "line", 305
  # rx literal  ":"
    add $I11, rx606_pos, 1
    gt $I11, rx606_eos, rx606_fail
    sub $I11, rx606_pos, rx606_off
    substr $S10, rx606_tgt, $I11, 1
    ne $S10, ":", rx606_fail
    add rx606_pos, 1
  # rx charclass s
    ge rx606_pos, rx606_eos, rx606_fail
    sub $I10, rx606_pos, rx606_off
    is_cclass $I11, 32, rx606_tgt, $I10
    unless $I11, rx606_fail
    inc rx606_pos
  # rx subrule "arglist" subtype=capture negate=
    rx606_cur."!cursor_pos"(rx606_pos)
    $P10 = rx606_cur."arglist"()
    unless $P10, rx606_fail
    rx606_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx606_pos = $P10."pos"()
  alt611_end:
.annotate "line", 306
    (rx606_rep) = rx606_cur."!mark_commit"($I612)
  rxquantr610_done:
.annotate "line", 301
  # rx pass
    rx606_cur."!cursor_pass"(rx606_pos, "dotty")
    rx606_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx606_pos)
    .return (rx606_cur)
  rx606_fail:
.annotate "line", 4
    (rx606_rep, rx606_pos, $I10, $P10) = rx606_cur."!mark_fail"(0)
    lt rx606_pos, -1, rx606_done
    eq rx606_pos, -1, rx606_fail
    jump $I10
  rx606_done:
    rx606_cur."!cursor_fail"()
    rx606_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx606_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("151_1258129007.74018") :method
.annotate "line", 4
    $P608 = self."!PREFIX__!subrule"("identifier", ".")
    new $P609, "ResizablePMCArray"
    push $P609, $P608
    .return ($P609)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("152_1258129007.74018") :method
.annotate "line", 310
    $P614 = self."!protoregex"("term")
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("153_1258129007.74018") :method
.annotate "line", 310
    $P616 = self."!PREFIX__!protoregex"("term")
    .return ($P616)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("154_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx618_tgt
    .local int rx618_pos
    .local int rx618_off
    .local int rx618_eos
    .local int rx618_rep
    .local pmc rx618_cur
    (rx618_cur, rx618_pos, rx618_tgt, $I10) = self."!cursor_start"()
    rx618_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx618_cur
    .local pmc match
    .lex "$/", match
    length rx618_eos, rx618_tgt
    set rx618_off, 0
    lt $I10, 2, rx618_start
    sub rx618_off, $I10, 1
    substr rx618_tgt, rx618_tgt, rx618_off
  rx618_start:
.annotate "line", 312
  # rx subcapture "sym"
    set_addr $I10, rxcap_621_fail
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  # rx literal  "self"
    add $I11, rx618_pos, 4
    gt $I11, rx618_eos, rx618_fail
    sub $I11, rx618_pos, rx618_off
    substr $S10, rx618_tgt, $I11, 4
    ne $S10, "self", rx618_fail
    add rx618_pos, 4
    set_addr $I10, rxcap_621_fail
    ($I12, $I11) = rx618_cur."!mark_peek"($I10)
    rx618_cur."!cursor_pos"($I11)
    ($P10) = rx618_cur."!cursor_start"()
    $P10."!cursor_pass"(rx618_pos, "")
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_621_done
  rxcap_621_fail:
    goto rx618_fail
  rxcap_621_done:
  # rxanchor rwb
    le rx618_pos, 0, rx618_fail
    sub $I10, rx618_pos, rx618_off
    is_cclass $I11, 8192, rx618_tgt, $I10
    if $I11, rx618_fail
    dec $I10
    is_cclass $I11, 8192, rx618_tgt, $I10
    unless $I11, rx618_fail
  # rx pass
    rx618_cur."!cursor_pass"(rx618_pos, "term:sym<self>")
    rx618_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx618_pos)
    .return (rx618_cur)
  rx618_fail:
.annotate "line", 4
    (rx618_rep, rx618_pos, $I10, $P10) = rx618_cur."!mark_fail"(0)
    lt rx618_pos, -1, rx618_done
    eq rx618_pos, -1, rx618_fail
    jump $I10
  rx618_done:
    rx618_cur."!cursor_fail"()
    rx618_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx618_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("155_1258129007.74018") :method
.annotate "line", 4
    new $P620, "ResizablePMCArray"
    push $P620, "self"
    .return ($P620)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("156_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx623_tgt
    .local int rx623_pos
    .local int rx623_off
    .local int rx623_eos
    .local int rx623_rep
    .local pmc rx623_cur
    (rx623_cur, rx623_pos, rx623_tgt, $I10) = self."!cursor_start"()
    rx623_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx623_cur
    .local pmc match
    .lex "$/", match
    length rx623_eos, rx623_tgt
    set rx623_off, 0
    lt $I10, 2, rx623_start
    sub rx623_off, $I10, 1
    substr rx623_tgt, rx623_tgt, rx623_off
  rx623_start:
.annotate "line", 315
  # rx subrule "identifier" subtype=capture negate=
    rx623_cur."!cursor_pos"(rx623_pos)
    $P10 = rx623_cur."identifier"()
    unless $P10, rx623_fail
    rx623_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx623_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx623_pos, rx623_eos, rx623_fail
    sub $I10, rx623_pos, rx623_off
    substr $S10, rx623_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx623_fail
  # rx subrule "args" subtype=capture negate=
    rx623_cur."!cursor_pos"(rx623_pos)
    $P10 = rx623_cur."args"()
    unless $P10, rx623_fail
    rx623_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx623_pos = $P10."pos"()
.annotate "line", 314
  # rx pass
    rx623_cur."!cursor_pass"(rx623_pos, "term:sym<identifier>")
    rx623_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx623_pos)
    .return (rx623_cur)
  rx623_fail:
.annotate "line", 4
    (rx623_rep, rx623_pos, $I10, $P10) = rx623_cur."!mark_fail"(0)
    lt rx623_pos, -1, rx623_done
    eq rx623_pos, -1, rx623_fail
    jump $I10
  rx623_done:
    rx623_cur."!cursor_fail"()
    rx623_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx623_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("157_1258129007.74018") :method
.annotate "line", 4
    $P625 = self."!PREFIX__!subrule"("identifier", "")
    new $P626, "ResizablePMCArray"
    push $P626, $P625
    .return ($P626)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("158_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx628_tgt
    .local int rx628_pos
    .local int rx628_off
    .local int rx628_eos
    .local int rx628_rep
    .local pmc rx628_cur
    (rx628_cur, rx628_pos, rx628_tgt, $I10) = self."!cursor_start"()
    rx628_cur."!cursor_debug"("START ", "term:sym<name>")
    rx628_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx628_cur
    .local pmc match
    .lex "$/", match
    length rx628_eos, rx628_tgt
    set rx628_off, 0
    lt $I10, 2, rx628_start
    sub rx628_off, $I10, 1
    substr rx628_tgt, rx628_tgt, rx628_off
  rx628_start:
.annotate "line", 319
  # rx subrule "name" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."name"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx628_pos = $P10."pos"()
  # rx rxquantr632 ** 0..1
    set_addr $I633, rxquantr632_done
    rx628_cur."!mark_push"(0, rx628_pos, $I633)
  rxquantr632_loop:
  # rx subrule "args" subtype=capture negate=
    rx628_cur."!cursor_pos"(rx628_pos)
    $P10 = rx628_cur."args"()
    unless $P10, rx628_fail
    rx628_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx628_pos = $P10."pos"()
    (rx628_rep) = rx628_cur."!mark_commit"($I633)
  rxquantr632_done:
.annotate "line", 318
  # rx pass
    rx628_cur."!cursor_pass"(rx628_pos, "term:sym<name>")
    rx628_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx628_pos)
    .return (rx628_cur)
  rx628_fail:
.annotate "line", 4
    (rx628_rep, rx628_pos, $I10, $P10) = rx628_cur."!mark_fail"(0)
    lt rx628_pos, -1, rx628_done
    eq rx628_pos, -1, rx628_fail
    jump $I10
  rx628_done:
    rx628_cur."!cursor_fail"()
    rx628_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx628_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("159_1258129007.74018") :method
.annotate "line", 4
    $P630 = self."!PREFIX__!subrule"("name", "")
    new $P631, "ResizablePMCArray"
    push $P631, $P630
    .return ($P631)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("160_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx635_tgt
    .local int rx635_pos
    .local int rx635_off
    .local int rx635_eos
    .local int rx635_rep
    .local pmc rx635_cur
    (rx635_cur, rx635_pos, rx635_tgt, $I10) = self."!cursor_start"()
    rx635_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx635_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx635_cur
    .local pmc match
    .lex "$/", match
    length rx635_eos, rx635_tgt
    set rx635_off, 0
    lt $I10, 2, rx635_start
    sub rx635_off, $I10, 1
    substr rx635_tgt, rx635_tgt, rx635_off
  rx635_start:
.annotate "line", 323
  # rx literal  "pir::"
    add $I11, rx635_pos, 5
    gt $I11, rx635_eos, rx635_fail
    sub $I11, rx635_pos, rx635_off
    substr $S10, rx635_tgt, $I11, 5
    ne $S10, "pir::", rx635_fail
    add rx635_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_638_fail
    rx635_cur."!mark_push"(0, rx635_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx635_pos, rx635_off
    find_not_cclass $I11, 8192, rx635_tgt, $I10, rx635_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx635_fail
    add rx635_pos, rx635_off, $I11
    set_addr $I10, rxcap_638_fail
    ($I12, $I11) = rx635_cur."!mark_peek"($I10)
    rx635_cur."!cursor_pos"($I11)
    ($P10) = rx635_cur."!cursor_start"()
    $P10."!cursor_pass"(rx635_pos, "")
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_638_done
  rxcap_638_fail:
    goto rx635_fail
  rxcap_638_done:
  # rx rxquantr639 ** 0..1
    set_addr $I640, rxquantr639_done
    rx635_cur."!mark_push"(0, rx635_pos, $I640)
  rxquantr639_loop:
  # rx subrule "args" subtype=capture negate=
    rx635_cur."!cursor_pos"(rx635_pos)
    $P10 = rx635_cur."args"()
    unless $P10, rx635_fail
    rx635_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx635_pos = $P10."pos"()
    (rx635_rep) = rx635_cur."!mark_commit"($I640)
  rxquantr639_done:
.annotate "line", 322
  # rx pass
    rx635_cur."!cursor_pass"(rx635_pos, "term:sym<pir::op>")
    rx635_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx635_pos)
    .return (rx635_cur)
  rx635_fail:
.annotate "line", 4
    (rx635_rep, rx635_pos, $I10, $P10) = rx635_cur."!mark_fail"(0)
    lt rx635_pos, -1, rx635_done
    eq rx635_pos, -1, rx635_fail
    jump $I10
  rx635_done:
    rx635_cur."!cursor_fail"()
    rx635_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx635_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("161_1258129007.74018") :method
.annotate "line", 4
    new $P637, "ResizablePMCArray"
    push $P637, "pir::"
    .return ($P637)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("162_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx642_tgt
    .local int rx642_pos
    .local int rx642_off
    .local int rx642_eos
    .local int rx642_rep
    .local pmc rx642_cur
    (rx642_cur, rx642_pos, rx642_tgt, $I10) = self."!cursor_start"()
    rx642_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx642_cur
    .local pmc match
    .lex "$/", match
    length rx642_eos, rx642_tgt
    set rx642_off, 0
    lt $I10, 2, rx642_start
    sub rx642_off, $I10, 1
    substr rx642_tgt, rx642_tgt, rx642_off
  rx642_start:
.annotate "line", 327
  # rx literal  "("
    add $I11, rx642_pos, 1
    gt $I11, rx642_eos, rx642_fail
    sub $I11, rx642_pos, rx642_off
    substr $S10, rx642_tgt, $I11, 1
    ne $S10, "(", rx642_fail
    add rx642_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx642_cur."!cursor_pos"(rx642_pos)
    $P10 = rx642_cur."arglist"()
    unless $P10, rx642_fail
    rx642_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx642_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx642_pos, 1
    gt $I11, rx642_eos, rx642_fail
    sub $I11, rx642_pos, rx642_off
    substr $S10, rx642_tgt, $I11, 1
    ne $S10, ")", rx642_fail
    add rx642_pos, 1
  # rx pass
    rx642_cur."!cursor_pass"(rx642_pos, "args")
    rx642_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx642_pos)
    .return (rx642_cur)
  rx642_fail:
.annotate "line", 4
    (rx642_rep, rx642_pos, $I10, $P10) = rx642_cur."!mark_fail"(0)
    lt rx642_pos, -1, rx642_done
    eq rx642_pos, -1, rx642_fail
    jump $I10
  rx642_done:
    rx642_cur."!cursor_fail"()
    rx642_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx642_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("163_1258129007.74018") :method
.annotate "line", 4
    $P644 = self."!PREFIX__!subrule"("arglist", "(")
    new $P645, "ResizablePMCArray"
    push $P645, $P644
    .return ($P645)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("164_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx647_tgt
    .local int rx647_pos
    .local int rx647_off
    .local int rx647_eos
    .local int rx647_rep
    .local pmc rx647_cur
    (rx647_cur, rx647_pos, rx647_tgt, $I10) = self."!cursor_start"()
    rx647_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx647_cur
    .local pmc match
    .lex "$/", match
    length rx647_eos, rx647_tgt
    set rx647_off, 0
    lt $I10, 2, rx647_start
    sub rx647_off, $I10, 1
    substr rx647_tgt, rx647_tgt, rx647_off
  rx647_start:
.annotate "line", 331
  # rx subrule "ws" subtype=method negate=
    rx647_cur."!cursor_pos"(rx647_pos)
    $P10 = rx647_cur."ws"()
    unless $P10, rx647_fail
    rx647_pos = $P10."pos"()
  alt651_0:
.annotate "line", 332
    set_addr $I10, alt651_1
    rx647_cur."!mark_push"(0, rx647_pos, $I10)
.annotate "line", 333
  # rx subrule "EXPR" subtype=capture negate=
    rx647_cur."!cursor_pos"(rx647_pos)
    $P10 = rx647_cur."EXPR"("f=")
    unless $P10, rx647_fail
    rx647_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx647_pos = $P10."pos"()
    goto alt651_end
  alt651_1:
  alt651_end:
.annotate "line", 330
  # rx pass
    rx647_cur."!cursor_pass"(rx647_pos, "arglist")
    rx647_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx647_pos)
    .return (rx647_cur)
  rx647_fail:
.annotate "line", 4
    (rx647_rep, rx647_pos, $I10, $P10) = rx647_cur."!mark_fail"(0)
    lt rx647_pos, -1, rx647_done
    eq rx647_pos, -1, rx647_fail
    jump $I10
  rx647_done:
    rx647_cur."!cursor_fail"()
    rx647_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx647_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("165_1258129007.74018") :method
.annotate "line", 4
    $P649 = self."!PREFIX__!subrule"("ws", "")
    new $P650, "ResizablePMCArray"
    push $P650, $P649
    .return ($P650)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("166_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx653_tgt
    .local int rx653_pos
    .local int rx653_off
    .local int rx653_eos
    .local int rx653_rep
    .local pmc rx653_cur
    (rx653_cur, rx653_pos, rx653_tgt, $I10) = self."!cursor_start"()
    rx653_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx653_cur
    .local pmc match
    .lex "$/", match
    length rx653_eos, rx653_tgt
    set rx653_off, 0
    lt $I10, 2, rx653_start
    sub rx653_off, $I10, 1
    substr rx653_tgt, rx653_tgt, rx653_off
  rx653_start:
.annotate "line", 339
  # rx subrule "value" subtype=capture negate=
    rx653_cur."!cursor_pos"(rx653_pos)
    $P10 = rx653_cur."value"()
    unless $P10, rx653_fail
    rx653_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx653_pos = $P10."pos"()
  # rx pass
    rx653_cur."!cursor_pass"(rx653_pos, "term:sym<value>")
    rx653_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx653_pos)
    .return (rx653_cur)
  rx653_fail:
.annotate "line", 4
    (rx653_rep, rx653_pos, $I10, $P10) = rx653_cur."!mark_fail"(0)
    lt rx653_pos, -1, rx653_done
    eq rx653_pos, -1, rx653_fail
    jump $I10
  rx653_done:
    rx653_cur."!cursor_fail"()
    rx653_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx653_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("167_1258129007.74018") :method
.annotate "line", 4
    $P655 = self."!PREFIX__!subrule"("value", "")
    new $P656, "ResizablePMCArray"
    push $P656, $P655
    .return ($P656)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("168_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx658_tgt
    .local int rx658_pos
    .local int rx658_off
    .local int rx658_eos
    .local int rx658_rep
    .local pmc rx658_cur
    (rx658_cur, rx658_pos, rx658_tgt, $I10) = self."!cursor_start"()
    rx658_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx658_cur
    .local pmc match
    .lex "$/", match
    length rx658_eos, rx658_tgt
    set rx658_off, 0
    lt $I10, 2, rx658_start
    sub rx658_off, $I10, 1
    substr rx658_tgt, rx658_tgt, rx658_off
  rx658_start:
  alt664_0:
.annotate "line", 341
    set_addr $I10, alt664_1
    rx658_cur."!mark_push"(0, rx658_pos, $I10)
.annotate "line", 342
  # rx subrule "dec_number" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."dec_number"()
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx658_pos = $P10."pos"()
    goto alt664_end
  alt664_1:
    set_addr $I10, alt664_2
    rx658_cur."!mark_push"(0, rx658_pos, $I10)
.annotate "line", 343
  # rx subrule "quote" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."quote"()
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx658_pos = $P10."pos"()
    goto alt664_end
  alt664_2:
.annotate "line", 344
  # rx subrule "integer" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."integer"()
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx658_pos = $P10."pos"()
  alt664_end:
.annotate "line", 341
  # rx pass
    rx658_cur."!cursor_pass"(rx658_pos, "value")
    rx658_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx658_pos)
    .return (rx658_cur)
  rx658_fail:
.annotate "line", 4
    (rx658_rep, rx658_pos, $I10, $P10) = rx658_cur."!mark_fail"(0)
    lt rx658_pos, -1, rx658_done
    eq rx658_pos, -1, rx658_fail
    jump $I10
  rx658_done:
    rx658_cur."!cursor_fail"()
    rx658_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx658_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("169_1258129007.74018") :method
.annotate "line", 4
    $P660 = self."!PREFIX__!subrule"("integer", "")
    $P661 = self."!PREFIX__!subrule"("quote", "")
    $P662 = self."!PREFIX__!subrule"("dec_number", "")
    new $P663, "ResizablePMCArray"
    push $P663, $P660
    push $P663, $P661
    push $P663, $P662
    .return ($P663)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("170_1258129007.74018") :method
.annotate "line", 347
    $P666 = self."!protoregex"("quote")
    .return ($P666)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("171_1258129007.74018") :method
.annotate "line", 347
    $P668 = self."!PREFIX__!protoregex"("quote")
    .return ($P668)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("172_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx670_tgt
    .local int rx670_pos
    .local int rx670_off
    .local int rx670_eos
    .local int rx670_rep
    .local pmc rx670_cur
    (rx670_cur, rx670_pos, rx670_tgt, $I10) = self."!cursor_start"()
    rx670_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx670_cur
    .local pmc match
    .lex "$/", match
    length rx670_eos, rx670_tgt
    set rx670_off, 0
    lt $I10, 2, rx670_start
    sub rx670_off, $I10, 1
    substr rx670_tgt, rx670_tgt, rx670_off
  rx670_start:
.annotate "line", 348
  # rx enumcharlist negate=0 zerowidth
    ge rx670_pos, rx670_eos, rx670_fail
    sub $I10, rx670_pos, rx670_off
    substr $S10, rx670_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx670_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx670_cur."!cursor_pos"(rx670_pos)
    $P10 = rx670_cur."quote_EXPR"(":q")
    unless $P10, rx670_fail
    rx670_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx670_pos = $P10."pos"()
  # rx pass
    rx670_cur."!cursor_pass"(rx670_pos, "quote:sym<apos>")
    rx670_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx670_pos)
    .return (rx670_cur)
  rx670_fail:
.annotate "line", 4
    (rx670_rep, rx670_pos, $I10, $P10) = rx670_cur."!mark_fail"(0)
    lt rx670_pos, -1, rx670_done
    eq rx670_pos, -1, rx670_fail
    jump $I10
  rx670_done:
    rx670_cur."!cursor_fail"()
    rx670_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx670_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("173_1258129007.74018") :method
.annotate "line", 4
    new $P672, "ResizablePMCArray"
    push $P672, "'"
    .return ($P672)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("174_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx674_tgt
    .local int rx674_pos
    .local int rx674_off
    .local int rx674_eos
    .local int rx674_rep
    .local pmc rx674_cur
    (rx674_cur, rx674_pos, rx674_tgt, $I10) = self."!cursor_start"()
    rx674_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx674_cur
    .local pmc match
    .lex "$/", match
    length rx674_eos, rx674_tgt
    set rx674_off, 0
    lt $I10, 2, rx674_start
    sub rx674_off, $I10, 1
    substr rx674_tgt, rx674_tgt, rx674_off
  rx674_start:
.annotate "line", 349
  # rx enumcharlist negate=0 zerowidth
    ge rx674_pos, rx674_eos, rx674_fail
    sub $I10, rx674_pos, rx674_off
    substr $S10, rx674_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx674_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx674_cur."!cursor_pos"(rx674_pos)
    $P10 = rx674_cur."quote_EXPR"(":qq")
    unless $P10, rx674_fail
    rx674_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx674_pos = $P10."pos"()
  # rx pass
    rx674_cur."!cursor_pass"(rx674_pos, "quote:sym<dblq>")
    rx674_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx674_pos)
    .return (rx674_cur)
  rx674_fail:
.annotate "line", 4
    (rx674_rep, rx674_pos, $I10, $P10) = rx674_cur."!mark_fail"(0)
    lt rx674_pos, -1, rx674_done
    eq rx674_pos, -1, rx674_fail
    jump $I10
  rx674_done:
    rx674_cur."!cursor_fail"()
    rx674_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx674_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("175_1258129007.74018") :method
.annotate "line", 4
    new $P676, "ResizablePMCArray"
    push $P676, "\""
    .return ($P676)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("176_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx678_tgt
    .local int rx678_pos
    .local int rx678_off
    .local int rx678_eos
    .local int rx678_rep
    .local pmc rx678_cur
    (rx678_cur, rx678_pos, rx678_tgt, $I10) = self."!cursor_start"()
    rx678_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx678_cur
    .local pmc match
    .lex "$/", match
    length rx678_eos, rx678_tgt
    set rx678_off, 0
    lt $I10, 2, rx678_start
    sub rx678_off, $I10, 1
    substr rx678_tgt, rx678_tgt, rx678_off
  rx678_start:
.annotate "line", 350
  # rx literal  "q"
    add $I11, rx678_pos, 1
    gt $I11, rx678_eos, rx678_fail
    sub $I11, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I11, 1
    ne $S10, "q", rx678_fail
    add rx678_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx678_pos, rx678_eos, rx678_fail
    sub $I10, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx678_fail
  # rx subrule "ws" subtype=method negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."ws"()
    unless $P10, rx678_fail
    rx678_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."quote_EXPR"(":q")
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx678_pos = $P10."pos"()
  # rx pass
    rx678_cur."!cursor_pass"(rx678_pos, "quote:sym<q>")
    rx678_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx678_pos)
    .return (rx678_cur)
  rx678_fail:
.annotate "line", 4
    (rx678_rep, rx678_pos, $I10, $P10) = rx678_cur."!mark_fail"(0)
    lt rx678_pos, -1, rx678_done
    eq rx678_pos, -1, rx678_fail
    jump $I10
  rx678_done:
    rx678_cur."!cursor_fail"()
    rx678_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("177_1258129007.74018") :method
.annotate "line", 4
    $P680 = self."!PREFIX__!subrule"("ws", "q")
    new $P681, "ResizablePMCArray"
    push $P681, $P680
    .return ($P681)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("178_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx683_tgt
    .local int rx683_pos
    .local int rx683_off
    .local int rx683_eos
    .local int rx683_rep
    .local pmc rx683_cur
    (rx683_cur, rx683_pos, rx683_tgt, $I10) = self."!cursor_start"()
    rx683_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx683_cur
    .local pmc match
    .lex "$/", match
    length rx683_eos, rx683_tgt
    set rx683_off, 0
    lt $I10, 2, rx683_start
    sub rx683_off, $I10, 1
    substr rx683_tgt, rx683_tgt, rx683_off
  rx683_start:
.annotate "line", 351
  # rx literal  "qq"
    add $I11, rx683_pos, 2
    gt $I11, rx683_eos, rx683_fail
    sub $I11, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I11, 2
    ne $S10, "qq", rx683_fail
    add rx683_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx683_pos, rx683_eos, rx683_fail
    sub $I10, rx683_pos, rx683_off
    substr $S10, rx683_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx683_fail
  # rx subrule "ws" subtype=method negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."ws"()
    unless $P10, rx683_fail
    rx683_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx683_cur."!cursor_pos"(rx683_pos)
    $P10 = rx683_cur."quote_EXPR"(":qq")
    unless $P10, rx683_fail
    rx683_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx683_pos = $P10."pos"()
  # rx pass
    rx683_cur."!cursor_pass"(rx683_pos, "quote:sym<qq>")
    rx683_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx683_pos)
    .return (rx683_cur)
  rx683_fail:
.annotate "line", 4
    (rx683_rep, rx683_pos, $I10, $P10) = rx683_cur."!mark_fail"(0)
    lt rx683_pos, -1, rx683_done
    eq rx683_pos, -1, rx683_fail
    jump $I10
  rx683_done:
    rx683_cur."!cursor_fail"()
    rx683_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx683_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("179_1258129007.74018") :method
.annotate "line", 4
    $P685 = self."!PREFIX__!subrule"("ws", "qq")
    new $P686, "ResizablePMCArray"
    push $P686, $P685
    .return ($P686)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("180_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx688_tgt
    .local int rx688_pos
    .local int rx688_off
    .local int rx688_eos
    .local int rx688_rep
    .local pmc rx688_cur
    (rx688_cur, rx688_pos, rx688_tgt, $I10) = self."!cursor_start"()
    rx688_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx688_cur
    .local pmc match
    .lex "$/", match
    length rx688_eos, rx688_tgt
    set rx688_off, 0
    lt $I10, 2, rx688_start
    sub rx688_off, $I10, 1
    substr rx688_tgt, rx688_tgt, rx688_off
  rx688_start:
.annotate "line", 352
  # rx literal  "Q"
    add $I11, rx688_pos, 1
    gt $I11, rx688_eos, rx688_fail
    sub $I11, rx688_pos, rx688_off
    substr $S10, rx688_tgt, $I11, 1
    ne $S10, "Q", rx688_fail
    add rx688_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx688_pos, rx688_eos, rx688_fail
    sub $I10, rx688_pos, rx688_off
    substr $S10, rx688_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx688_fail
  # rx subrule "ws" subtype=method negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."ws"()
    unless $P10, rx688_fail
    rx688_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx688_cur."!cursor_pos"(rx688_pos)
    $P10 = rx688_cur."quote_EXPR"()
    unless $P10, rx688_fail
    rx688_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx688_pos = $P10."pos"()
  # rx pass
    rx688_cur."!cursor_pass"(rx688_pos, "quote:sym<Q>")
    rx688_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx688_pos)
    .return (rx688_cur)
  rx688_fail:
.annotate "line", 4
    (rx688_rep, rx688_pos, $I10, $P10) = rx688_cur."!mark_fail"(0)
    lt rx688_pos, -1, rx688_done
    eq rx688_pos, -1, rx688_fail
    jump $I10
  rx688_done:
    rx688_cur."!cursor_fail"()
    rx688_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx688_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("181_1258129007.74018") :method
.annotate "line", 4
    $P690 = self."!PREFIX__!subrule"("ws", "Q")
    new $P691, "ResizablePMCArray"
    push $P691, $P690
    .return ($P691)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("182_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx693_tgt
    .local int rx693_pos
    .local int rx693_off
    .local int rx693_eos
    .local int rx693_rep
    .local pmc rx693_cur
    (rx693_cur, rx693_pos, rx693_tgt, $I10) = self."!cursor_start"()
    rx693_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx693_cur
    .local pmc match
    .lex "$/", match
    length rx693_eos, rx693_tgt
    set rx693_off, 0
    lt $I10, 2, rx693_start
    sub rx693_off, $I10, 1
    substr rx693_tgt, rx693_tgt, rx693_off
  rx693_start:
.annotate "line", 353
  # rx literal  "Q:PIR"
    add $I11, rx693_pos, 5
    gt $I11, rx693_eos, rx693_fail
    sub $I11, rx693_pos, rx693_off
    substr $S10, rx693_tgt, $I11, 5
    ne $S10, "Q:PIR", rx693_fail
    add rx693_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx693_cur."!cursor_pos"(rx693_pos)
    $P10 = rx693_cur."ws"()
    unless $P10, rx693_fail
    rx693_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx693_cur."!cursor_pos"(rx693_pos)
    $P10 = rx693_cur."quote_EXPR"()
    unless $P10, rx693_fail
    rx693_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx693_pos = $P10."pos"()
  # rx pass
    rx693_cur."!cursor_pass"(rx693_pos, "quote:sym<Q:PIR>")
    rx693_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx693_pos)
    .return (rx693_cur)
  rx693_fail:
.annotate "line", 4
    (rx693_rep, rx693_pos, $I10, $P10) = rx693_cur."!mark_fail"(0)
    lt rx693_pos, -1, rx693_done
    eq rx693_pos, -1, rx693_fail
    jump $I10
  rx693_done:
    rx693_cur."!cursor_fail"()
    rx693_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx693_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("183_1258129007.74018") :method
.annotate "line", 4
    $P695 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P696, "ResizablePMCArray"
    push $P696, $P695
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("184_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx698_tgt
    .local int rx698_pos
    .local int rx698_off
    .local int rx698_eos
    .local int rx698_rep
    .local pmc rx698_cur
    (rx698_cur, rx698_pos, rx698_tgt, $I10) = self."!cursor_start"()
    rx698_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx698_cur
    .local pmc match
    .lex "$/", match
    length rx698_eos, rx698_tgt
    set rx698_off, 0
    lt $I10, 2, rx698_start
    sub rx698_off, $I10, 1
    substr rx698_tgt, rx698_tgt, rx698_off
  rx698_start:
.annotate "line", 355
  # rx enumcharlist negate=0 zerowidth
    ge rx698_pos, rx698_eos, rx698_fail
    sub $I10, rx698_pos, rx698_off
    substr $S10, rx698_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx698_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx698_cur."!cursor_pos"(rx698_pos)
    $P10 = rx698_cur."quotemod_check"("s")
    unless $P10, rx698_fail
  # rx subrule "variable" subtype=capture negate=
    rx698_cur."!cursor_pos"(rx698_pos)
    $P10 = rx698_cur."variable"()
    unless $P10, rx698_fail
    rx698_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx698_pos = $P10."pos"()
  # rx pass
    rx698_cur."!cursor_pass"(rx698_pos, "quote_escape:sym<$>")
    rx698_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx698_pos)
    .return (rx698_cur)
  rx698_fail:
.annotate "line", 4
    (rx698_rep, rx698_pos, $I10, $P10) = rx698_cur."!mark_fail"(0)
    lt rx698_pos, -1, rx698_done
    eq rx698_pos, -1, rx698_fail
    jump $I10
  rx698_done:
    rx698_cur."!cursor_fail"()
    rx698_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx698_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("185_1258129007.74018") :method
.annotate "line", 4
    new $P700, "ResizablePMCArray"
    push $P700, "$"
    .return ($P700)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("186_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx702_tgt
    .local int rx702_pos
    .local int rx702_off
    .local int rx702_eos
    .local int rx702_rep
    .local pmc rx702_cur
    (rx702_cur, rx702_pos, rx702_tgt, $I10) = self."!cursor_start"()
    rx702_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx702_cur
    .local pmc match
    .lex "$/", match
    length rx702_eos, rx702_tgt
    set rx702_off, 0
    lt $I10, 2, rx702_start
    sub rx702_off, $I10, 1
    substr rx702_tgt, rx702_tgt, rx702_off
  rx702_start:
.annotate "line", 356
  # rx enumcharlist negate=0 zerowidth
    ge rx702_pos, rx702_eos, rx702_fail
    sub $I10, rx702_pos, rx702_off
    substr $S10, rx702_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx702_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx702_cur."!cursor_pos"(rx702_pos)
    $P10 = rx702_cur."quotemod_check"("c")
    unless $P10, rx702_fail
  # rx subrule "block" subtype=capture negate=
    rx702_cur."!cursor_pos"(rx702_pos)
    $P10 = rx702_cur."block"()
    unless $P10, rx702_fail
    rx702_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx702_pos = $P10."pos"()
  # rx pass
    rx702_cur."!cursor_pass"(rx702_pos, "quote_escape:sym<{ }>")
    rx702_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx702_pos)
    .return (rx702_cur)
  rx702_fail:
.annotate "line", 4
    (rx702_rep, rx702_pos, $I10, $P10) = rx702_cur."!mark_fail"(0)
    lt rx702_pos, -1, rx702_done
    eq rx702_pos, -1, rx702_fail
    jump $I10
  rx702_done:
    rx702_cur."!cursor_fail"()
    rx702_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx702_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("187_1258129007.74018") :method
.annotate "line", 4
    new $P704, "ResizablePMCArray"
    push $P704, "{"
    .return ($P704)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("188_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx706_tgt
    .local int rx706_pos
    .local int rx706_off
    .local int rx706_eos
    .local int rx706_rep
    .local pmc rx706_cur
    (rx706_cur, rx706_pos, rx706_tgt, $I10) = self."!cursor_start"()
    rx706_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx706_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx706_cur
    .local pmc match
    .lex "$/", match
    length rx706_eos, rx706_tgt
    set rx706_off, 0
    lt $I10, 2, rx706_start
    sub rx706_off, $I10, 1
    substr rx706_tgt, rx706_tgt, rx706_off
  rx706_start:
.annotate "line", 358
  # rx literal  "("
    add $I11, rx706_pos, 1
    gt $I11, rx706_eos, rx706_fail
    sub $I11, rx706_pos, rx706_off
    substr $S10, rx706_tgt, $I11, 1
    ne $S10, "(", rx706_fail
    add rx706_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."ws"()
    unless $P10, rx706_fail
    rx706_pos = $P10."pos"()
  # rx rxquantr710 ** 0..1
    set_addr $I711, rxquantr710_done
    rx706_cur."!mark_push"(0, rx706_pos, $I711)
  rxquantr710_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx706_cur."!cursor_pos"(rx706_pos)
    $P10 = rx706_cur."EXPR"()
    unless $P10, rx706_fail
    rx706_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx706_pos = $P10."pos"()
    (rx706_rep) = rx706_cur."!mark_commit"($I711)
  rxquantr710_done:
  # rx literal  ")"
    add $I11, rx706_pos, 1
    gt $I11, rx706_eos, rx706_fail
    sub $I11, rx706_pos, rx706_off
    substr $S10, rx706_tgt, $I11, 1
    ne $S10, ")", rx706_fail
    add rx706_pos, 1
  # rx pass
    rx706_cur."!cursor_pass"(rx706_pos, "circumfix:sym<( )>")
    rx706_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx706_pos)
    .return (rx706_cur)
  rx706_fail:
.annotate "line", 4
    (rx706_rep, rx706_pos, $I10, $P10) = rx706_cur."!mark_fail"(0)
    lt rx706_pos, -1, rx706_done
    eq rx706_pos, -1, rx706_fail
    jump $I10
  rx706_done:
    rx706_cur."!cursor_fail"()
    rx706_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx706_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("189_1258129007.74018") :method
.annotate "line", 4
    $P708 = self."!PREFIX__!subrule"("ws", "(")
    new $P709, "ResizablePMCArray"
    push $P709, $P708
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("190_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    (rx713_cur, rx713_pos, rx713_tgt, $I10) = self."!cursor_start"()
    rx713_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx713_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx713_cur
    .local pmc match
    .lex "$/", match
    length rx713_eos, rx713_tgt
    set rx713_off, 0
    lt $I10, 2, rx713_start
    sub rx713_off, $I10, 1
    substr rx713_tgt, rx713_tgt, rx713_off
  rx713_start:
.annotate "line", 359
  # rx literal  "["
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    substr $S10, rx713_tgt, $I11, 1
    ne $S10, "[", rx713_fail
    add rx713_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."ws"()
    unless $P10, rx713_fail
    rx713_pos = $P10."pos"()
  # rx rxquantr717 ** 0..1
    set_addr $I718, rxquantr717_done
    rx713_cur."!mark_push"(0, rx713_pos, $I718)
  rxquantr717_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."EXPR"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx713_pos = $P10."pos"()
    (rx713_rep) = rx713_cur."!mark_commit"($I718)
  rxquantr717_done:
  # rx literal  "]"
    add $I11, rx713_pos, 1
    gt $I11, rx713_eos, rx713_fail
    sub $I11, rx713_pos, rx713_off
    substr $S10, rx713_tgt, $I11, 1
    ne $S10, "]", rx713_fail
    add rx713_pos, 1
  # rx pass
    rx713_cur."!cursor_pass"(rx713_pos, "circumfix:sym<[ ]>")
    rx713_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx713_pos)
    .return (rx713_cur)
  rx713_fail:
.annotate "line", 4
    (rx713_rep, rx713_pos, $I10, $P10) = rx713_cur."!mark_fail"(0)
    lt rx713_pos, -1, rx713_done
    eq rx713_pos, -1, rx713_fail
    jump $I10
  rx713_done:
    rx713_cur."!cursor_fail"()
    rx713_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("191_1258129007.74018") :method
.annotate "line", 4
    $P715 = self."!PREFIX__!subrule"("ws", "[")
    new $P716, "ResizablePMCArray"
    push $P716, $P715
    .return ($P716)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("192_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx720_tgt
    .local int rx720_pos
    .local int rx720_off
    .local int rx720_eos
    .local int rx720_rep
    .local pmc rx720_cur
    (rx720_cur, rx720_pos, rx720_tgt, $I10) = self."!cursor_start"()
    rx720_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx720_cur
    .local pmc match
    .lex "$/", match
    length rx720_eos, rx720_tgt
    set rx720_off, 0
    lt $I10, 2, rx720_start
    sub rx720_off, $I10, 1
    substr rx720_tgt, rx720_tgt, rx720_off
  rx720_start:
.annotate "line", 360
  # rx enumcharlist negate=0 zerowidth
    ge rx720_pos, rx720_eos, rx720_fail
    sub $I10, rx720_pos, rx720_off
    substr $S10, rx720_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx720_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx720_cur."!cursor_pos"(rx720_pos)
    $P10 = rx720_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx720_fail
    rx720_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx720_pos = $P10."pos"()
  # rx pass
    rx720_cur."!cursor_pass"(rx720_pos, "circumfix:sym<ang>")
    rx720_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx720_pos)
    .return (rx720_cur)
  rx720_fail:
.annotate "line", 4
    (rx720_rep, rx720_pos, $I10, $P10) = rx720_cur."!mark_fail"(0)
    lt rx720_pos, -1, rx720_done
    eq rx720_pos, -1, rx720_fail
    jump $I10
  rx720_done:
    rx720_cur."!cursor_fail"()
    rx720_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx720_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("193_1258129007.74018") :method
.annotate "line", 4
    new $P722, "ResizablePMCArray"
    push $P722, "<"
    .return ($P722)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("194_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx724_tgt
    .local int rx724_pos
    .local int rx724_off
    .local int rx724_eos
    .local int rx724_rep
    .local pmc rx724_cur
    (rx724_cur, rx724_pos, rx724_tgt, $I10) = self."!cursor_start"()
    rx724_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx724_cur
    .local pmc match
    .lex "$/", match
    length rx724_eos, rx724_tgt
    set rx724_off, 0
    lt $I10, 2, rx724_start
    sub rx724_off, $I10, 1
    substr rx724_tgt, rx724_tgt, rx724_off
  rx724_start:
.annotate "line", 361
  # rx enumcharlist negate=0 zerowidth
    ge rx724_pos, rx724_eos, rx724_fail
    sub $I10, rx724_pos, rx724_off
    substr $S10, rx724_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx724_fail
  # rx subrule "pblock" subtype=capture negate=
    rx724_cur."!cursor_pos"(rx724_pos)
    $P10 = rx724_cur."pblock"()
    unless $P10, rx724_fail
    rx724_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx724_pos = $P10."pos"()
  # rx pass
    rx724_cur."!cursor_pass"(rx724_pos, "circumfix:sym<{ }>")
    rx724_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx724_pos)
    .return (rx724_cur)
  rx724_fail:
.annotate "line", 4
    (rx724_rep, rx724_pos, $I10, $P10) = rx724_cur."!mark_fail"(0)
    lt rx724_pos, -1, rx724_done
    eq rx724_pos, -1, rx724_fail
    jump $I10
  rx724_done:
    rx724_cur."!cursor_fail"()
    rx724_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx724_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("195_1258129007.74018") :method
.annotate "line", 4
    new $P726, "ResizablePMCArray"
    push $P726, "{"
    .return ($P726)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("196_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx728_tgt
    .local int rx728_pos
    .local int rx728_off
    .local int rx728_eos
    .local int rx728_rep
    .local pmc rx728_cur
    (rx728_cur, rx728_pos, rx728_tgt, $I10) = self."!cursor_start"()
    rx728_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx728_cur
    .local pmc match
    .lex "$/", match
    length rx728_eos, rx728_tgt
    set rx728_off, 0
    lt $I10, 2, rx728_start
    sub rx728_off, $I10, 1
    substr rx728_tgt, rx728_tgt, rx728_off
  rx728_start:
.annotate "line", 362
  # rx subrule "sigil" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."sigil"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx728_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx728_pos, 1
    gt $I11, rx728_eos, rx728_fail
    sub $I11, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I11, 1
    ne $S10, "(", rx728_fail
    add rx728_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."semilist"()
    unless $P10, rx728_fail
    rx728_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx728_pos = $P10."pos"()
  alt732_0:
    set_addr $I10, alt732_1
    rx728_cur."!mark_push"(0, rx728_pos, $I10)
  # rx literal  ")"
    add $I11, rx728_pos, 1
    gt $I11, rx728_eos, rx728_fail
    sub $I11, rx728_pos, rx728_off
    substr $S10, rx728_tgt, $I11, 1
    ne $S10, ")", rx728_fail
    add rx728_pos, 1
    goto alt732_end
  alt732_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx728_cur."!cursor_pos"(rx728_pos)
    $P10 = rx728_cur."FAILGOAL"("')'")
    unless $P10, rx728_fail
    rx728_pos = $P10."pos"()
  alt732_end:
  # rx pass
    rx728_cur."!cursor_pass"(rx728_pos, "circumfix:sym<sigil>")
    rx728_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx728_pos)
    .return (rx728_cur)
  rx728_fail:
.annotate "line", 4
    (rx728_rep, rx728_pos, $I10, $P10) = rx728_cur."!mark_fail"(0)
    lt rx728_pos, -1, rx728_done
    eq rx728_pos, -1, rx728_fail
    jump $I10
  rx728_done:
    rx728_cur."!cursor_fail"()
    rx728_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx728_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("197_1258129007.74018") :method
.annotate "line", 4
    $P730 = self."!PREFIX__!subrule"("sigil", "")
    new $P731, "ResizablePMCArray"
    push $P731, $P730
    .return ($P731)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("198_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 4
    .local string rx735_tgt
    .local int rx735_pos
    .local int rx735_off
    .local int rx735_eos
    .local int rx735_rep
    .local pmc rx735_cur
    (rx735_cur, rx735_pos, rx735_tgt, $I10) = self."!cursor_start"()
    rx735_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx735_cur
    .local pmc match
    .lex "$/", match
    length rx735_eos, rx735_tgt
    set rx735_off, 0
    lt $I10, 2, rx735_start
    sub rx735_off, $I10, 1
    substr rx735_tgt, rx735_tgt, rx735_off
  rx735_start:
.annotate "line", 364
  # rx subrule "ws" subtype=method negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."ws"()
    unless $P10, rx735_fail
    rx735_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."statement"()
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx735_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."ws"()
    unless $P10, rx735_fail
    rx735_pos = $P10."pos"()
  # rx pass
    rx735_cur."!cursor_pass"(rx735_pos, "semilist")
    rx735_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx735_pos)
    .return (rx735_cur)
  rx735_fail:
.annotate "line", 4
    (rx735_rep, rx735_pos, $I10, $P10) = rx735_cur."!mark_fail"(0)
    lt rx735_pos, -1, rx735_done
    eq rx735_pos, -1, rx735_fail
    jump $I10
  rx735_done:
    rx735_cur."!cursor_fail"()
    rx735_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx735_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("199_1258129007.74018") :method
.annotate "line", 4
    new $P737, "ResizablePMCArray"
    push $P737, ""
    .return ($P737)
.end


.namespace ["NQP";"Grammar"]
.sub "nulltermish"  :subid("200_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx741_tgt
    .local int rx741_pos
    .local int rx741_off
    .local int rx741_eos
    .local int rx741_rep
    .local pmc rx741_cur
    (rx741_cur, rx741_pos, rx741_tgt, $I10) = self."!cursor_start"()
    rx741_cur."!cursor_debug"("START ", "nulltermish")
    .lex unicode:"$\x{a2}", rx741_cur
    .local pmc match
    .lex "$/", match
    length rx741_eos, rx741_tgt
    set rx741_off, 0
    lt $I10, 2, rx741_start
    sub rx741_off, $I10, 1
    substr rx741_tgt, rx741_tgt, rx741_off
  rx741_start:
  alt745_0:
.annotate "line", 386
    set_addr $I10, alt745_1
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
.annotate "line", 387
  # rx subrule "termish" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."termish"()
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=term")
    rx741_pos = $P10."pos"()
    goto alt745_end
  alt745_1:
  alt745_end:
.annotate "line", 386
  # rx pass
    rx741_cur."!cursor_pass"(rx741_pos, "nulltermish")
    rx741_cur."!cursor_debug"("PASS  ", "nulltermish", " at pos=", rx741_pos)
    .return (rx741_cur)
  rx741_fail:
.annotate "line", 368
    (rx741_rep, rx741_pos, $I10, $P10) = rx741_cur."!mark_fail"(0)
    lt rx741_pos, -1, rx741_done
    eq rx741_pos, -1, rx741_fail
    jump $I10
  rx741_done:
    rx741_cur."!cursor_fail"()
    rx741_cur."!cursor_debug"("FAIL  ", "nulltermish")
    .return (rx741_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__nulltermish"  :subid("201_1258129007.74018") :method
.annotate "line", 368
    $P743 = self."!PREFIX__!subrule"("OPER=term", "")
    new $P744, "ResizablePMCArray"
    push $P744, ""
    push $P744, $P743
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("202_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx747_tgt
    .local int rx747_pos
    .local int rx747_off
    .local int rx747_eos
    .local int rx747_rep
    .local pmc rx747_cur
    (rx747_cur, rx747_pos, rx747_tgt, $I10) = self."!cursor_start"()
    rx747_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx747_cur
    .local pmc match
    .lex "$/", match
    length rx747_eos, rx747_tgt
    set rx747_off, 0
    lt $I10, 2, rx747_start
    sub rx747_off, $I10, 1
    substr rx747_tgt, rx747_tgt, rx747_off
  rx747_start:
.annotate "line", 391
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."infixstopper"()
    if $P10, rx747_fail
  # rx subrule "infix" subtype=capture negate=
    rx747_cur."!cursor_pos"(rx747_pos)
    $P10 = rx747_cur."infix"()
    unless $P10, rx747_fail
    rx747_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx747_pos = $P10."pos"()
  # rx pass
    rx747_cur."!cursor_pass"(rx747_pos, "infixish")
    rx747_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx747_pos)
    .return (rx747_cur)
  rx747_fail:
.annotate "line", 368
    (rx747_rep, rx747_pos, $I10, $P10) = rx747_cur."!mark_fail"(0)
    lt rx747_pos, -1, rx747_done
    eq rx747_pos, -1, rx747_fail
    jump $I10
  rx747_done:
    rx747_cur."!cursor_fail"()
    rx747_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx747_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("203_1258129007.74018") :method
.annotate "line", 368
    new $P749, "ResizablePMCArray"
    push $P749, ""
    .return ($P749)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("204_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx751_tgt
    .local int rx751_pos
    .local int rx751_off
    .local int rx751_eos
    .local int rx751_rep
    .local pmc rx751_cur
    (rx751_cur, rx751_pos, rx751_tgt, $I10) = self."!cursor_start"()
    rx751_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx751_cur
    .local pmc match
    .lex "$/", match
    length rx751_eos, rx751_tgt
    set rx751_off, 0
    lt $I10, 2, rx751_start
    sub rx751_off, $I10, 1
    substr rx751_tgt, rx751_tgt, rx751_off
  rx751_start:
.annotate "line", 392
  # rx subrule "lambda" subtype=zerowidth negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."lambda"()
    unless $P10, rx751_fail
  # rx pass
    rx751_cur."!cursor_pass"(rx751_pos, "infixstopper")
    rx751_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx751_pos)
    .return (rx751_cur)
  rx751_fail:
.annotate "line", 368
    (rx751_rep, rx751_pos, $I10, $P10) = rx751_cur."!mark_fail"(0)
    lt rx751_pos, -1, rx751_done
    eq rx751_pos, -1, rx751_fail
    jump $I10
  rx751_done:
    rx751_cur."!cursor_fail"()
    rx751_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx751_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("205_1258129007.74018") :method
.annotate "line", 368
    new $P753, "ResizablePMCArray"
    push $P753, ""
    .return ($P753)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("206_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx755_tgt
    .local int rx755_pos
    .local int rx755_off
    .local int rx755_eos
    .local int rx755_rep
    .local pmc rx755_cur
    (rx755_cur, rx755_pos, rx755_tgt, $I10) = self."!cursor_start"()
    rx755_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx755_cur
    .local pmc match
    .lex "$/", match
    length rx755_eos, rx755_tgt
    set rx755_off, 0
    lt $I10, 2, rx755_start
    sub rx755_off, $I10, 1
    substr rx755_tgt, rx755_tgt, rx755_off
  rx755_start:
.annotate "line", 395
  # rx literal  "["
    add $I11, rx755_pos, 1
    gt $I11, rx755_eos, rx755_fail
    sub $I11, rx755_pos, rx755_off
    substr $S10, rx755_tgt, $I11, 1
    ne $S10, "[", rx755_fail
    add rx755_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."ws"()
    unless $P10, rx755_fail
    rx755_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."EXPR"()
    unless $P10, rx755_fail
    rx755_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx755_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx755_pos, 1
    gt $I11, rx755_eos, rx755_fail
    sub $I11, rx755_pos, rx755_off
    substr $S10, rx755_tgt, $I11, 1
    ne $S10, "]", rx755_fail
    add rx755_pos, 1
.annotate "line", 396
  # rx subrule "O" subtype=capture negate=
    rx755_cur."!cursor_pos"(rx755_pos)
    $P10 = rx755_cur."O"("%methodop")
    unless $P10, rx755_fail
    rx755_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx755_pos = $P10."pos"()
.annotate "line", 394
  # rx pass
    rx755_cur."!cursor_pass"(rx755_pos, "postcircumfix:sym<[ ]>")
    rx755_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx755_pos)
    .return (rx755_cur)
  rx755_fail:
.annotate "line", 368
    (rx755_rep, rx755_pos, $I10, $P10) = rx755_cur."!mark_fail"(0)
    lt rx755_pos, -1, rx755_done
    eq rx755_pos, -1, rx755_fail
    jump $I10
  rx755_done:
    rx755_cur."!cursor_fail"()
    rx755_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx755_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("207_1258129007.74018") :method
.annotate "line", 368
    $P757 = self."!PREFIX__!subrule"("ws", "[")
    new $P758, "ResizablePMCArray"
    push $P758, $P757
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("208_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx760_tgt
    .local int rx760_pos
    .local int rx760_off
    .local int rx760_eos
    .local int rx760_rep
    .local pmc rx760_cur
    (rx760_cur, rx760_pos, rx760_tgt, $I10) = self."!cursor_start"()
    rx760_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx760_cur
    .local pmc match
    .lex "$/", match
    length rx760_eos, rx760_tgt
    set rx760_off, 0
    lt $I10, 2, rx760_start
    sub rx760_off, $I10, 1
    substr rx760_tgt, rx760_tgt, rx760_off
  rx760_start:
.annotate "line", 400
  # rx literal  "{"
    add $I11, rx760_pos, 1
    gt $I11, rx760_eos, rx760_fail
    sub $I11, rx760_pos, rx760_off
    substr $S10, rx760_tgt, $I11, 1
    ne $S10, "{", rx760_fail
    add rx760_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx760_cur."!cursor_pos"(rx760_pos)
    $P10 = rx760_cur."ws"()
    unless $P10, rx760_fail
    rx760_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx760_cur."!cursor_pos"(rx760_pos)
    $P10 = rx760_cur."EXPR"()
    unless $P10, rx760_fail
    rx760_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx760_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx760_pos, 1
    gt $I11, rx760_eos, rx760_fail
    sub $I11, rx760_pos, rx760_off
    substr $S10, rx760_tgt, $I11, 1
    ne $S10, "}", rx760_fail
    add rx760_pos, 1
.annotate "line", 401
  # rx subrule "O" subtype=capture negate=
    rx760_cur."!cursor_pos"(rx760_pos)
    $P10 = rx760_cur."O"("%methodop")
    unless $P10, rx760_fail
    rx760_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx760_pos = $P10."pos"()
.annotate "line", 399
  # rx pass
    rx760_cur."!cursor_pass"(rx760_pos, "postcircumfix:sym<{ }>")
    rx760_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx760_pos)
    .return (rx760_cur)
  rx760_fail:
.annotate "line", 368
    (rx760_rep, rx760_pos, $I10, $P10) = rx760_cur."!mark_fail"(0)
    lt rx760_pos, -1, rx760_done
    eq rx760_pos, -1, rx760_fail
    jump $I10
  rx760_done:
    rx760_cur."!cursor_fail"()
    rx760_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx760_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("209_1258129007.74018") :method
.annotate "line", 368
    $P762 = self."!PREFIX__!subrule"("ws", "{")
    new $P763, "ResizablePMCArray"
    push $P763, $P762
    .return ($P763)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("210_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx765_tgt
    .local int rx765_pos
    .local int rx765_off
    .local int rx765_eos
    .local int rx765_rep
    .local pmc rx765_cur
    (rx765_cur, rx765_pos, rx765_tgt, $I10) = self."!cursor_start"()
    rx765_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx765_cur
    .local pmc match
    .lex "$/", match
    length rx765_eos, rx765_tgt
    set rx765_off, 0
    lt $I10, 2, rx765_start
    sub rx765_off, $I10, 1
    substr rx765_tgt, rx765_tgt, rx765_off
  rx765_start:
.annotate "line", 405
  # rx enumcharlist negate=0 zerowidth
    ge rx765_pos, rx765_eos, rx765_fail
    sub $I10, rx765_pos, rx765_off
    substr $S10, rx765_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx765_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx765_cur."!cursor_pos"(rx765_pos)
    $P10 = rx765_cur."quote_EXPR"(":q")
    unless $P10, rx765_fail
    rx765_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx765_pos = $P10."pos"()
.annotate "line", 406
  # rx subrule "O" subtype=capture negate=
    rx765_cur."!cursor_pos"(rx765_pos)
    $P10 = rx765_cur."O"("%methodop")
    unless $P10, rx765_fail
    rx765_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx765_pos = $P10."pos"()
.annotate "line", 404
  # rx pass
    rx765_cur."!cursor_pass"(rx765_pos, "postcircumfix:sym<ang>")
    rx765_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx765_pos)
    .return (rx765_cur)
  rx765_fail:
.annotate "line", 368
    (rx765_rep, rx765_pos, $I10, $P10) = rx765_cur."!mark_fail"(0)
    lt rx765_pos, -1, rx765_done
    eq rx765_pos, -1, rx765_fail
    jump $I10
  rx765_done:
    rx765_cur."!cursor_fail"()
    rx765_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx765_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("211_1258129007.74018") :method
.annotate "line", 368
    new $P767, "ResizablePMCArray"
    push $P767, "<"
    .return ($P767)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("212_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx769_tgt
    .local int rx769_pos
    .local int rx769_off
    .local int rx769_eos
    .local int rx769_rep
    .local pmc rx769_cur
    (rx769_cur, rx769_pos, rx769_tgt, $I10) = self."!cursor_start"()
    rx769_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx769_cur
    .local pmc match
    .lex "$/", match
    length rx769_eos, rx769_tgt
    set rx769_off, 0
    lt $I10, 2, rx769_start
    sub rx769_off, $I10, 1
    substr rx769_tgt, rx769_tgt, rx769_off
  rx769_start:
.annotate "line", 410
  # rx literal  "("
    add $I11, rx769_pos, 1
    gt $I11, rx769_eos, rx769_fail
    sub $I11, rx769_pos, rx769_off
    substr $S10, rx769_tgt, $I11, 1
    ne $S10, "(", rx769_fail
    add rx769_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."ws"()
    unless $P10, rx769_fail
    rx769_pos = $P10."pos"()
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
.annotate "line", 411
  # rx subrule "O" subtype=capture negate=
    rx769_cur."!cursor_pos"(rx769_pos)
    $P10 = rx769_cur."O"("%methodop")
    unless $P10, rx769_fail
    rx769_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx769_pos = $P10."pos"()
.annotate "line", 409
  # rx pass
    rx769_cur."!cursor_pass"(rx769_pos, "postcircumfix:sym<( )>")
    rx769_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx769_pos)
    .return (rx769_cur)
  rx769_fail:
.annotate "line", 368
    (rx769_rep, rx769_pos, $I10, $P10) = rx769_cur."!mark_fail"(0)
    lt rx769_pos, -1, rx769_done
    eq rx769_pos, -1, rx769_fail
    jump $I10
  rx769_done:
    rx769_cur."!cursor_fail"()
    rx769_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx769_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("213_1258129007.74018") :method
.annotate "line", 368
    $P771 = self."!PREFIX__!subrule"("ws", "(")
    new $P772, "ResizablePMCArray"
    push $P772, $P771
    .return ($P772)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("214_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx774_tgt
    .local int rx774_pos
    .local int rx774_off
    .local int rx774_eos
    .local int rx774_rep
    .local pmc rx774_cur
    (rx774_cur, rx774_pos, rx774_tgt, $I10) = self."!cursor_start"()
    rx774_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx774_cur
    .local pmc match
    .lex "$/", match
    length rx774_eos, rx774_tgt
    set rx774_off, 0
    lt $I10, 2, rx774_start
    sub rx774_off, $I10, 1
    substr rx774_tgt, rx774_tgt, rx774_off
  rx774_start:
.annotate "line", 414
  # rx subrule "dotty" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."dotty"()
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx774_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx774_cur."!cursor_pos"(rx774_pos)
    $P10 = rx774_cur."O"("%methodop")
    unless $P10, rx774_fail
    rx774_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx774_pos = $P10."pos"()
  # rx pass
    rx774_cur."!cursor_pass"(rx774_pos, "postfix:sym<.>")
    rx774_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx774_pos)
    .return (rx774_cur)
  rx774_fail:
.annotate "line", 368
    (rx774_rep, rx774_pos, $I10, $P10) = rx774_cur."!mark_fail"(0)
    lt rx774_pos, -1, rx774_done
    eq rx774_pos, -1, rx774_fail
    jump $I10
  rx774_done:
    rx774_cur."!cursor_fail"()
    rx774_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx774_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("215_1258129007.74018") :method
.annotate "line", 368
    $P776 = self."!PREFIX__!subrule"("dotty", "")
    new $P777, "ResizablePMCArray"
    push $P777, $P776
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("216_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx779_tgt
    .local int rx779_pos
    .local int rx779_off
    .local int rx779_eos
    .local int rx779_rep
    .local pmc rx779_cur
    (rx779_cur, rx779_pos, rx779_tgt, $I10) = self."!cursor_start"()
    rx779_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx779_cur
    .local pmc match
    .lex "$/", match
    length rx779_eos, rx779_tgt
    set rx779_off, 0
    lt $I10, 2, rx779_start
    sub rx779_off, $I10, 1
    substr rx779_tgt, rx779_tgt, rx779_off
  rx779_start:
.annotate "line", 416
  # rx subcapture "sym"
    set_addr $I10, rxcap_783_fail
    rx779_cur."!mark_push"(0, rx779_pos, $I10)
  # rx literal  "++"
    add $I11, rx779_pos, 2
    gt $I11, rx779_eos, rx779_fail
    sub $I11, rx779_pos, rx779_off
    substr $S10, rx779_tgt, $I11, 2
    ne $S10, "++", rx779_fail
    add rx779_pos, 2
    set_addr $I10, rxcap_783_fail
    ($I12, $I11) = rx779_cur."!mark_peek"($I10)
    rx779_cur."!cursor_pos"($I11)
    ($P10) = rx779_cur."!cursor_start"()
    $P10."!cursor_pass"(rx779_pos, "")
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_783_done
  rxcap_783_fail:
    goto rx779_fail
  rxcap_783_done:
  # rx subrule "O" subtype=capture negate=
    rx779_cur."!cursor_pos"(rx779_pos)
    $P10 = rx779_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx779_fail
    rx779_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx779_pos = $P10."pos"()
  # rx pass
    rx779_cur."!cursor_pass"(rx779_pos, "prefix:sym<++>")
    rx779_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx779_pos)
    .return (rx779_cur)
  rx779_fail:
.annotate "line", 368
    (rx779_rep, rx779_pos, $I10, $P10) = rx779_cur."!mark_fail"(0)
    lt rx779_pos, -1, rx779_done
    eq rx779_pos, -1, rx779_fail
    jump $I10
  rx779_done:
    rx779_cur."!cursor_fail"()
    rx779_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx779_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("217_1258129007.74018") :method
.annotate "line", 368
    $P781 = self."!PREFIX__!subrule"("O", "++")
    new $P782, "ResizablePMCArray"
    push $P782, $P781
    .return ($P782)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("218_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx785_tgt
    .local int rx785_pos
    .local int rx785_off
    .local int rx785_eos
    .local int rx785_rep
    .local pmc rx785_cur
    (rx785_cur, rx785_pos, rx785_tgt, $I10) = self."!cursor_start"()
    rx785_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx785_cur
    .local pmc match
    .lex "$/", match
    length rx785_eos, rx785_tgt
    set rx785_off, 0
    lt $I10, 2, rx785_start
    sub rx785_off, $I10, 1
    substr rx785_tgt, rx785_tgt, rx785_off
  rx785_start:
.annotate "line", 417
  # rx subcapture "sym"
    set_addr $I10, rxcap_789_fail
    rx785_cur."!mark_push"(0, rx785_pos, $I10)
  # rx literal  "--"
    add $I11, rx785_pos, 2
    gt $I11, rx785_eos, rx785_fail
    sub $I11, rx785_pos, rx785_off
    substr $S10, rx785_tgt, $I11, 2
    ne $S10, "--", rx785_fail
    add rx785_pos, 2
    set_addr $I10, rxcap_789_fail
    ($I12, $I11) = rx785_cur."!mark_peek"($I10)
    rx785_cur."!cursor_pos"($I11)
    ($P10) = rx785_cur."!cursor_start"()
    $P10."!cursor_pass"(rx785_pos, "")
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_789_done
  rxcap_789_fail:
    goto rx785_fail
  rxcap_789_done:
  # rx subrule "O" subtype=capture negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx785_fail
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx785_pos = $P10."pos"()
  # rx pass
    rx785_cur."!cursor_pass"(rx785_pos, "prefix:sym<-->")
    rx785_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx785_pos)
    .return (rx785_cur)
  rx785_fail:
.annotate "line", 368
    (rx785_rep, rx785_pos, $I10, $P10) = rx785_cur."!mark_fail"(0)
    lt rx785_pos, -1, rx785_done
    eq rx785_pos, -1, rx785_fail
    jump $I10
  rx785_done:
    rx785_cur."!cursor_fail"()
    rx785_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx785_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("219_1258129007.74018") :method
.annotate "line", 368
    $P787 = self."!PREFIX__!subrule"("O", "--")
    new $P788, "ResizablePMCArray"
    push $P788, $P787
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("220_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt, $I10) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "postfix:sym<++>")
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
    $P10 = rx791_cur."O"("%autoincrement")
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx791_pos = $P10."pos"()
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "postfix:sym<++>")
    rx791_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 368
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("221_1258129007.74018") :method
.annotate "line", 368
    $P793 = self."!PREFIX__!subrule"("O", "++")
    new $P794, "ResizablePMCArray"
    push $P794, $P793
    .return ($P794)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("222_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx797_tgt
    .local int rx797_pos
    .local int rx797_off
    .local int rx797_eos
    .local int rx797_rep
    .local pmc rx797_cur
    (rx797_cur, rx797_pos, rx797_tgt, $I10) = self."!cursor_start"()
    rx797_cur."!cursor_debug"("START ", "postfix:sym<-->")
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
    $P10 = rx797_cur."O"("%autoincrement")
    unless $P10, rx797_fail
    rx797_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx797_pos = $P10."pos"()
  # rx pass
    rx797_cur."!cursor_pass"(rx797_pos, "postfix:sym<-->")
    rx797_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx797_pos)
    .return (rx797_cur)
  rx797_fail:
.annotate "line", 368
    (rx797_rep, rx797_pos, $I10, $P10) = rx797_cur."!mark_fail"(0)
    lt rx797_pos, -1, rx797_done
    eq rx797_pos, -1, rx797_fail
    jump $I10
  rx797_done:
    rx797_cur."!cursor_fail"()
    rx797_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx797_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("223_1258129007.74018") :method
.annotate "line", 368
    $P799 = self."!PREFIX__!subrule"("O", "--")
    new $P800, "ResizablePMCArray"
    push $P800, $P799
    .return ($P800)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("224_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx803_tgt
    .local int rx803_pos
    .local int rx803_off
    .local int rx803_eos
    .local int rx803_rep
    .local pmc rx803_cur
    (rx803_cur, rx803_pos, rx803_tgt, $I10) = self."!cursor_start"()
    rx803_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx803_cur
    .local pmc match
    .lex "$/", match
    length rx803_eos, rx803_tgt
    set rx803_off, 0
    lt $I10, 2, rx803_start
    sub rx803_off, $I10, 1
    substr rx803_tgt, rx803_tgt, rx803_off
  rx803_start:
.annotate "line", 423
  # rx subcapture "sym"
    set_addr $I10, rxcap_807_fail
    rx803_cur."!mark_push"(0, rx803_pos, $I10)
  # rx literal  "**"
    add $I11, rx803_pos, 2
    gt $I11, rx803_eos, rx803_fail
    sub $I11, rx803_pos, rx803_off
    substr $S10, rx803_tgt, $I11, 2
    ne $S10, "**", rx803_fail
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
    $P10 = rx803_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx803_fail
    rx803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx803_pos = $P10."pos"()
  # rx pass
    rx803_cur."!cursor_pass"(rx803_pos, "infix:sym<**>")
    rx803_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx803_pos)
    .return (rx803_cur)
  rx803_fail:
.annotate "line", 368
    (rx803_rep, rx803_pos, $I10, $P10) = rx803_cur."!mark_fail"(0)
    lt rx803_pos, -1, rx803_done
    eq rx803_pos, -1, rx803_fail
    jump $I10
  rx803_done:
    rx803_cur."!cursor_fail"()
    rx803_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx803_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("225_1258129007.74018") :method
.annotate "line", 368
    $P805 = self."!PREFIX__!subrule"("O", "**")
    new $P806, "ResizablePMCArray"
    push $P806, $P805
    .return ($P806)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("226_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt, $I10) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "prefix:sym<+>")
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
  # rx literal  "+"
    add $I11, rx809_pos, 1
    gt $I11, rx809_eos, rx809_fail
    sub $I11, rx809_pos, rx809_off
    substr $S10, rx809_tgt, $I11, 1
    ne $S10, "+", rx809_fail
    add rx809_pos, 1
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
    $P10 = rx809_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "prefix:sym<+>")
    rx809_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate "line", 368
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("227_1258129007.74018") :method
.annotate "line", 368
    $P811 = self."!PREFIX__!subrule"("O", "+")
    new $P812, "ResizablePMCArray"
    push $P812, $P811
    .return ($P812)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("228_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx815_tgt
    .local int rx815_pos
    .local int rx815_off
    .local int rx815_eos
    .local int rx815_rep
    .local pmc rx815_cur
    (rx815_cur, rx815_pos, rx815_tgt, $I10) = self."!cursor_start"()
    rx815_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx815_cur
    .local pmc match
    .lex "$/", match
    length rx815_eos, rx815_tgt
    set rx815_off, 0
    lt $I10, 2, rx815_start
    sub rx815_off, $I10, 1
    substr rx815_tgt, rx815_tgt, rx815_off
  rx815_start:
.annotate "line", 426
  # rx subcapture "sym"
    set_addr $I10, rxcap_819_fail
    rx815_cur."!mark_push"(0, rx815_pos, $I10)
  # rx literal  "~"
    add $I11, rx815_pos, 1
    gt $I11, rx815_eos, rx815_fail
    sub $I11, rx815_pos, rx815_off
    substr $S10, rx815_tgt, $I11, 1
    ne $S10, "~", rx815_fail
    add rx815_pos, 1
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
    $P10 = rx815_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx815_fail
    rx815_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx815_pos = $P10."pos"()
  # rx pass
    rx815_cur."!cursor_pass"(rx815_pos, "prefix:sym<~>")
    rx815_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx815_pos)
    .return (rx815_cur)
  rx815_fail:
.annotate "line", 368
    (rx815_rep, rx815_pos, $I10, $P10) = rx815_cur."!mark_fail"(0)
    lt rx815_pos, -1, rx815_done
    eq rx815_pos, -1, rx815_fail
    jump $I10
  rx815_done:
    rx815_cur."!cursor_fail"()
    rx815_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx815_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("229_1258129007.74018") :method
.annotate "line", 368
    $P817 = self."!PREFIX__!subrule"("O", "~")
    new $P818, "ResizablePMCArray"
    push $P818, $P817
    .return ($P818)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("230_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx821_tgt
    .local int rx821_pos
    .local int rx821_off
    .local int rx821_eos
    .local int rx821_rep
    .local pmc rx821_cur
    (rx821_cur, rx821_pos, rx821_tgt, $I10) = self."!cursor_start"()
    rx821_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx821_cur
    .local pmc match
    .lex "$/", match
    length rx821_eos, rx821_tgt
    set rx821_off, 0
    lt $I10, 2, rx821_start
    sub rx821_off, $I10, 1
    substr rx821_tgt, rx821_tgt, rx821_off
  rx821_start:
.annotate "line", 427
  # rx subcapture "sym"
    set_addr $I10, rxcap_825_fail
    rx821_cur."!mark_push"(0, rx821_pos, $I10)
  # rx literal  "-"
    add $I11, rx821_pos, 1
    gt $I11, rx821_eos, rx821_fail
    sub $I11, rx821_pos, rx821_off
    substr $S10, rx821_tgt, $I11, 1
    ne $S10, "-", rx821_fail
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
  # rx enumcharlist negate=1 zerowidth
    ge rx821_pos, rx821_eos, rx821_fail
    sub $I10, rx821_pos, rx821_off
    substr $S10, rx821_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx821_fail
  # rx subrule "O" subtype=capture negate=
    rx821_cur."!cursor_pos"(rx821_pos)
    $P10 = rx821_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx821_fail
    rx821_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx821_pos = $P10."pos"()
  # rx pass
    rx821_cur."!cursor_pass"(rx821_pos, "prefix:sym<->")
    rx821_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx821_pos)
    .return (rx821_cur)
  rx821_fail:
.annotate "line", 368
    (rx821_rep, rx821_pos, $I10, $P10) = rx821_cur."!mark_fail"(0)
    lt rx821_pos, -1, rx821_done
    eq rx821_pos, -1, rx821_fail
    jump $I10
  rx821_done:
    rx821_cur."!cursor_fail"()
    rx821_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx821_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("231_1258129007.74018") :method
.annotate "line", 368
    $P823 = self."!PREFIX__!subrule"("O", "-")
    new $P824, "ResizablePMCArray"
    push $P824, $P823
    .return ($P824)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("232_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx827_tgt
    .local int rx827_pos
    .local int rx827_off
    .local int rx827_eos
    .local int rx827_rep
    .local pmc rx827_cur
    (rx827_cur, rx827_pos, rx827_tgt, $I10) = self."!cursor_start"()
    rx827_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx827_cur
    .local pmc match
    .lex "$/", match
    length rx827_eos, rx827_tgt
    set rx827_off, 0
    lt $I10, 2, rx827_start
    sub rx827_off, $I10, 1
    substr rx827_tgt, rx827_tgt, rx827_off
  rx827_start:
.annotate "line", 428
  # rx subcapture "sym"
    set_addr $I10, rxcap_831_fail
    rx827_cur."!mark_push"(0, rx827_pos, $I10)
  # rx literal  "?"
    add $I11, rx827_pos, 1
    gt $I11, rx827_eos, rx827_fail
    sub $I11, rx827_pos, rx827_off
    substr $S10, rx827_tgt, $I11, 1
    ne $S10, "?", rx827_fail
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
    $P10 = rx827_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx827_fail
    rx827_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx827_pos = $P10."pos"()
  # rx pass
    rx827_cur."!cursor_pass"(rx827_pos, "prefix:sym<?>")
    rx827_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx827_pos)
    .return (rx827_cur)
  rx827_fail:
.annotate "line", 368
    (rx827_rep, rx827_pos, $I10, $P10) = rx827_cur."!mark_fail"(0)
    lt rx827_pos, -1, rx827_done
    eq rx827_pos, -1, rx827_fail
    jump $I10
  rx827_done:
    rx827_cur."!cursor_fail"()
    rx827_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx827_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("233_1258129007.74018") :method
.annotate "line", 368
    $P829 = self."!PREFIX__!subrule"("O", "?")
    new $P830, "ResizablePMCArray"
    push $P830, $P829
    .return ($P830)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("234_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx833_tgt
    .local int rx833_pos
    .local int rx833_off
    .local int rx833_eos
    .local int rx833_rep
    .local pmc rx833_cur
    (rx833_cur, rx833_pos, rx833_tgt, $I10) = self."!cursor_start"()
    rx833_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx833_cur
    .local pmc match
    .lex "$/", match
    length rx833_eos, rx833_tgt
    set rx833_off, 0
    lt $I10, 2, rx833_start
    sub rx833_off, $I10, 1
    substr rx833_tgt, rx833_tgt, rx833_off
  rx833_start:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_837_fail
    rx833_cur."!mark_push"(0, rx833_pos, $I10)
  # rx literal  "!"
    add $I11, rx833_pos, 1
    gt $I11, rx833_eos, rx833_fail
    sub $I11, rx833_pos, rx833_off
    substr $S10, rx833_tgt, $I11, 1
    ne $S10, "!", rx833_fail
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
  # rx subrule "O" subtype=capture negate=
    rx833_cur."!cursor_pos"(rx833_pos)
    $P10 = rx833_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx833_fail
    rx833_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx833_pos = $P10."pos"()
  # rx pass
    rx833_cur."!cursor_pass"(rx833_pos, "prefix:sym<!>")
    rx833_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx833_pos)
    .return (rx833_cur)
  rx833_fail:
.annotate "line", 368
    (rx833_rep, rx833_pos, $I10, $P10) = rx833_cur."!mark_fail"(0)
    lt rx833_pos, -1, rx833_done
    eq rx833_pos, -1, rx833_fail
    jump $I10
  rx833_done:
    rx833_cur."!cursor_fail"()
    rx833_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx833_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("235_1258129007.74018") :method
.annotate "line", 368
    $P835 = self."!PREFIX__!subrule"("O", "!")
    new $P836, "ResizablePMCArray"
    push $P836, $P835
    .return ($P836)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("236_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx839_tgt
    .local int rx839_pos
    .local int rx839_off
    .local int rx839_eos
    .local int rx839_rep
    .local pmc rx839_cur
    (rx839_cur, rx839_pos, rx839_tgt, $I10) = self."!cursor_start"()
    rx839_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx839_cur
    .local pmc match
    .lex "$/", match
    length rx839_eos, rx839_tgt
    set rx839_off, 0
    lt $I10, 2, rx839_start
    sub rx839_off, $I10, 1
    substr rx839_tgt, rx839_tgt, rx839_off
  rx839_start:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_843_fail
    rx839_cur."!mark_push"(0, rx839_pos, $I10)
  # rx literal  "|"
    add $I11, rx839_pos, 1
    gt $I11, rx839_eos, rx839_fail
    sub $I11, rx839_pos, rx839_off
    substr $S10, rx839_tgt, $I11, 1
    ne $S10, "|", rx839_fail
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
    $P10 = rx839_cur."O"("%symbolic_unary")
    unless $P10, rx839_fail
    rx839_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx839_pos = $P10."pos"()
  # rx pass
    rx839_cur."!cursor_pass"(rx839_pos, "prefix:sym<|>")
    rx839_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx839_pos)
    .return (rx839_cur)
  rx839_fail:
.annotate "line", 368
    (rx839_rep, rx839_pos, $I10, $P10) = rx839_cur."!mark_fail"(0)
    lt rx839_pos, -1, rx839_done
    eq rx839_pos, -1, rx839_fail
    jump $I10
  rx839_done:
    rx839_cur."!cursor_fail"()
    rx839_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx839_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("237_1258129007.74018") :method
.annotate "line", 368
    $P841 = self."!PREFIX__!subrule"("O", "|")
    new $P842, "ResizablePMCArray"
    push $P842, $P841
    .return ($P842)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("238_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    (rx845_cur, rx845_pos, rx845_tgt, $I10) = self."!cursor_start"()
    rx845_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx845_cur
    .local pmc match
    .lex "$/", match
    length rx845_eos, rx845_tgt
    set rx845_off, 0
    lt $I10, 2, rx845_start
    sub rx845_off, $I10, 1
    substr rx845_tgt, rx845_tgt, rx845_off
  rx845_start:
.annotate "line", 432
  # rx subcapture "sym"
    set_addr $I10, rxcap_849_fail
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  # rx literal  "*"
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, "*", rx845_fail
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
    $P10 = rx845_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx845_pos = $P10."pos"()
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "infix:sym<*>")
    rx845_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx845_pos)
    .return (rx845_cur)
  rx845_fail:
.annotate "line", 368
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    rx845_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("239_1258129007.74018") :method
.annotate "line", 368
    $P847 = self."!PREFIX__!subrule"("O", "*")
    new $P848, "ResizablePMCArray"
    push $P848, $P847
    .return ($P848)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("240_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx851_tgt
    .local int rx851_pos
    .local int rx851_off
    .local int rx851_eos
    .local int rx851_rep
    .local pmc rx851_cur
    (rx851_cur, rx851_pos, rx851_tgt, $I10) = self."!cursor_start"()
    rx851_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx851_cur
    .local pmc match
    .lex "$/", match
    length rx851_eos, rx851_tgt
    set rx851_off, 0
    lt $I10, 2, rx851_start
    sub rx851_off, $I10, 1
    substr rx851_tgt, rx851_tgt, rx851_off
  rx851_start:
.annotate "line", 433
  # rx subcapture "sym"
    set_addr $I10, rxcap_855_fail
    rx851_cur."!mark_push"(0, rx851_pos, $I10)
  # rx literal  "/"
    add $I11, rx851_pos, 1
    gt $I11, rx851_eos, rx851_fail
    sub $I11, rx851_pos, rx851_off
    substr $S10, rx851_tgt, $I11, 1
    ne $S10, "/", rx851_fail
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
    $P10 = rx851_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx851_fail
    rx851_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx851_pos = $P10."pos"()
  # rx pass
    rx851_cur."!cursor_pass"(rx851_pos, "infix:sym</>")
    rx851_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx851_pos)
    .return (rx851_cur)
  rx851_fail:
.annotate "line", 368
    (rx851_rep, rx851_pos, $I10, $P10) = rx851_cur."!mark_fail"(0)
    lt rx851_pos, -1, rx851_done
    eq rx851_pos, -1, rx851_fail
    jump $I10
  rx851_done:
    rx851_cur."!cursor_fail"()
    rx851_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx851_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("241_1258129007.74018") :method
.annotate "line", 368
    $P853 = self."!PREFIX__!subrule"("O", "/")
    new $P854, "ResizablePMCArray"
    push $P854, $P853
    .return ($P854)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("242_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt, $I10) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx857_cur
    .local pmc match
    .lex "$/", match
    length rx857_eos, rx857_tgt
    set rx857_off, 0
    lt $I10, 2, rx857_start
    sub rx857_off, $I10, 1
    substr rx857_tgt, rx857_tgt, rx857_off
  rx857_start:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_861_fail
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  # rx literal  "%"
    add $I11, rx857_pos, 1
    gt $I11, rx857_eos, rx857_fail
    sub $I11, rx857_pos, rx857_off
    substr $S10, rx857_tgt, $I11, 1
    ne $S10, "%", rx857_fail
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
    $P10 = rx857_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx857_pos = $P10."pos"()
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "infix:sym<%>")
    rx857_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate "line", 368
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("243_1258129007.74018") :method
.annotate "line", 368
    $P859 = self."!PREFIX__!subrule"("O", "%")
    new $P860, "ResizablePMCArray"
    push $P860, $P859
    .return ($P860)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("244_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx863_tgt
    .local int rx863_pos
    .local int rx863_off
    .local int rx863_eos
    .local int rx863_rep
    .local pmc rx863_cur
    (rx863_cur, rx863_pos, rx863_tgt, $I10) = self."!cursor_start"()
    rx863_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx863_cur
    .local pmc match
    .lex "$/", match
    length rx863_eos, rx863_tgt
    set rx863_off, 0
    lt $I10, 2, rx863_start
    sub rx863_off, $I10, 1
    substr rx863_tgt, rx863_tgt, rx863_off
  rx863_start:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_867_fail
    rx863_cur."!mark_push"(0, rx863_pos, $I10)
  # rx literal  "+"
    add $I11, rx863_pos, 1
    gt $I11, rx863_eos, rx863_fail
    sub $I11, rx863_pos, rx863_off
    substr $S10, rx863_tgt, $I11, 1
    ne $S10, "+", rx863_fail
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
    $P10 = rx863_cur."O"("%additive, :pirop<add>")
    unless $P10, rx863_fail
    rx863_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx863_pos = $P10."pos"()
  # rx pass
    rx863_cur."!cursor_pass"(rx863_pos, "infix:sym<+>")
    rx863_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx863_pos)
    .return (rx863_cur)
  rx863_fail:
.annotate "line", 368
    (rx863_rep, rx863_pos, $I10, $P10) = rx863_cur."!mark_fail"(0)
    lt rx863_pos, -1, rx863_done
    eq rx863_pos, -1, rx863_fail
    jump $I10
  rx863_done:
    rx863_cur."!cursor_fail"()
    rx863_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx863_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("245_1258129007.74018") :method
.annotate "line", 368
    $P865 = self."!PREFIX__!subrule"("O", "+")
    new $P866, "ResizablePMCArray"
    push $P866, $P865
    .return ($P866)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("246_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx869_tgt
    .local int rx869_pos
    .local int rx869_off
    .local int rx869_eos
    .local int rx869_rep
    .local pmc rx869_cur
    (rx869_cur, rx869_pos, rx869_tgt, $I10) = self."!cursor_start"()
    rx869_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx869_cur
    .local pmc match
    .lex "$/", match
    length rx869_eos, rx869_tgt
    set rx869_off, 0
    lt $I10, 2, rx869_start
    sub rx869_off, $I10, 1
    substr rx869_tgt, rx869_tgt, rx869_off
  rx869_start:
.annotate "line", 437
  # rx subcapture "sym"
    set_addr $I10, rxcap_873_fail
    rx869_cur."!mark_push"(0, rx869_pos, $I10)
  # rx literal  "-"
    add $I11, rx869_pos, 1
    gt $I11, rx869_eos, rx869_fail
    sub $I11, rx869_pos, rx869_off
    substr $S10, rx869_tgt, $I11, 1
    ne $S10, "-", rx869_fail
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
    $P10 = rx869_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx869_fail
    rx869_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx869_pos = $P10."pos"()
  # rx pass
    rx869_cur."!cursor_pass"(rx869_pos, "infix:sym<->")
    rx869_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx869_pos)
    .return (rx869_cur)
  rx869_fail:
.annotate "line", 368
    (rx869_rep, rx869_pos, $I10, $P10) = rx869_cur."!mark_fail"(0)
    lt rx869_pos, -1, rx869_done
    eq rx869_pos, -1, rx869_fail
    jump $I10
  rx869_done:
    rx869_cur."!cursor_fail"()
    rx869_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx869_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("247_1258129007.74018") :method
.annotate "line", 368
    $P871 = self."!PREFIX__!subrule"("O", "-")
    new $P872, "ResizablePMCArray"
    push $P872, $P871
    .return ($P872)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("248_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx875_tgt
    .local int rx875_pos
    .local int rx875_off
    .local int rx875_eos
    .local int rx875_rep
    .local pmc rx875_cur
    (rx875_cur, rx875_pos, rx875_tgt, $I10) = self."!cursor_start"()
    rx875_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx875_cur
    .local pmc match
    .lex "$/", match
    length rx875_eos, rx875_tgt
    set rx875_off, 0
    lt $I10, 2, rx875_start
    sub rx875_off, $I10, 1
    substr rx875_tgt, rx875_tgt, rx875_off
  rx875_start:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_879_fail
    rx875_cur."!mark_push"(0, rx875_pos, $I10)
  # rx literal  "~"
    add $I11, rx875_pos, 1
    gt $I11, rx875_eos, rx875_fail
    sub $I11, rx875_pos, rx875_off
    substr $S10, rx875_tgt, $I11, 1
    ne $S10, "~", rx875_fail
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
    $P10 = rx875_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx875_fail
    rx875_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx875_pos = $P10."pos"()
  # rx pass
    rx875_cur."!cursor_pass"(rx875_pos, "infix:sym<~>")
    rx875_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx875_pos)
    .return (rx875_cur)
  rx875_fail:
.annotate "line", 368
    (rx875_rep, rx875_pos, $I10, $P10) = rx875_cur."!mark_fail"(0)
    lt rx875_pos, -1, rx875_done
    eq rx875_pos, -1, rx875_fail
    jump $I10
  rx875_done:
    rx875_cur."!cursor_fail"()
    rx875_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx875_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("249_1258129007.74018") :method
.annotate "line", 368
    $P877 = self."!PREFIX__!subrule"("O", "~")
    new $P878, "ResizablePMCArray"
    push $P878, $P877
    .return ($P878)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("250_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx881_tgt
    .local int rx881_pos
    .local int rx881_off
    .local int rx881_eos
    .local int rx881_rep
    .local pmc rx881_cur
    (rx881_cur, rx881_pos, rx881_tgt, $I10) = self."!cursor_start"()
    rx881_cur."!cursor_debug"("START ", "infix:sym<==>")
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
  # rx literal  "=="
    add $I11, rx881_pos, 2
    gt $I11, rx881_eos, rx881_fail
    sub $I11, rx881_pos, rx881_off
    substr $S10, rx881_tgt, $I11, 2
    ne $S10, "==", rx881_fail
    add rx881_pos, 2
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
    $P10 = rx881_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx881_fail
    rx881_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx881_pos = $P10."pos"()
  # rx pass
    rx881_cur."!cursor_pass"(rx881_pos, "infix:sym<==>")
    rx881_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx881_pos)
    .return (rx881_cur)
  rx881_fail:
.annotate "line", 368
    (rx881_rep, rx881_pos, $I10, $P10) = rx881_cur."!mark_fail"(0)
    lt rx881_pos, -1, rx881_done
    eq rx881_pos, -1, rx881_fail
    jump $I10
  rx881_done:
    rx881_cur."!cursor_fail"()
    rx881_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx881_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("251_1258129007.74018") :method
.annotate "line", 368
    $P883 = self."!PREFIX__!subrule"("O", "==")
    new $P884, "ResizablePMCArray"
    push $P884, $P883
    .return ($P884)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("252_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx887_tgt
    .local int rx887_pos
    .local int rx887_off
    .local int rx887_eos
    .local int rx887_rep
    .local pmc rx887_cur
    (rx887_cur, rx887_pos, rx887_tgt, $I10) = self."!cursor_start"()
    rx887_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx887_cur
    .local pmc match
    .lex "$/", match
    length rx887_eos, rx887_tgt
    set rx887_off, 0
    lt $I10, 2, rx887_start
    sub rx887_off, $I10, 1
    substr rx887_tgt, rx887_tgt, rx887_off
  rx887_start:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_891_fail
    rx887_cur."!mark_push"(0, rx887_pos, $I10)
  # rx literal  "!="
    add $I11, rx887_pos, 2
    gt $I11, rx887_eos, rx887_fail
    sub $I11, rx887_pos, rx887_off
    substr $S10, rx887_tgt, $I11, 2
    ne $S10, "!=", rx887_fail
    add rx887_pos, 2
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
    $P10 = rx887_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx887_fail
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx887_pos = $P10."pos"()
  # rx pass
    rx887_cur."!cursor_pass"(rx887_pos, "infix:sym<!=>")
    rx887_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx887_pos)
    .return (rx887_cur)
  rx887_fail:
.annotate "line", 368
    (rx887_rep, rx887_pos, $I10, $P10) = rx887_cur."!mark_fail"(0)
    lt rx887_pos, -1, rx887_done
    eq rx887_pos, -1, rx887_fail
    jump $I10
  rx887_done:
    rx887_cur."!cursor_fail"()
    rx887_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx887_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("253_1258129007.74018") :method
.annotate "line", 368
    $P889 = self."!PREFIX__!subrule"("O", "!=")
    new $P890, "ResizablePMCArray"
    push $P890, $P889
    .return ($P890)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("254_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx893_tgt
    .local int rx893_pos
    .local int rx893_off
    .local int rx893_eos
    .local int rx893_rep
    .local pmc rx893_cur
    (rx893_cur, rx893_pos, rx893_tgt, $I10) = self."!cursor_start"()
    rx893_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx893_cur
    .local pmc match
    .lex "$/", match
    length rx893_eos, rx893_tgt
    set rx893_off, 0
    lt $I10, 2, rx893_start
    sub rx893_off, $I10, 1
    substr rx893_tgt, rx893_tgt, rx893_off
  rx893_start:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_897_fail
    rx893_cur."!mark_push"(0, rx893_pos, $I10)
  # rx literal  "<="
    add $I11, rx893_pos, 2
    gt $I11, rx893_eos, rx893_fail
    sub $I11, rx893_pos, rx893_off
    substr $S10, rx893_tgt, $I11, 2
    ne $S10, "<=", rx893_fail
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
    $P10 = rx893_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx893_pos = $P10."pos"()
  # rx pass
    rx893_cur."!cursor_pass"(rx893_pos, "infix:sym<<=>")
    rx893_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx893_pos)
    .return (rx893_cur)
  rx893_fail:
.annotate "line", 368
    (rx893_rep, rx893_pos, $I10, $P10) = rx893_cur."!mark_fail"(0)
    lt rx893_pos, -1, rx893_done
    eq rx893_pos, -1, rx893_fail
    jump $I10
  rx893_done:
    rx893_cur."!cursor_fail"()
    rx893_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx893_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("255_1258129007.74018") :method
.annotate "line", 368
    $P895 = self."!PREFIX__!subrule"("O", "<=")
    new $P896, "ResizablePMCArray"
    push $P896, $P895
    .return ($P896)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("256_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx899_tgt
    .local int rx899_pos
    .local int rx899_off
    .local int rx899_eos
    .local int rx899_rep
    .local pmc rx899_cur
    (rx899_cur, rx899_pos, rx899_tgt, $I10) = self."!cursor_start"()
    rx899_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx899_cur
    .local pmc match
    .lex "$/", match
    length rx899_eos, rx899_tgt
    set rx899_off, 0
    lt $I10, 2, rx899_start
    sub rx899_off, $I10, 1
    substr rx899_tgt, rx899_tgt, rx899_off
  rx899_start:
.annotate "line", 444
  # rx subcapture "sym"
    set_addr $I10, rxcap_903_fail
    rx899_cur."!mark_push"(0, rx899_pos, $I10)
  # rx literal  ">="
    add $I11, rx899_pos, 2
    gt $I11, rx899_eos, rx899_fail
    sub $I11, rx899_pos, rx899_off
    substr $S10, rx899_tgt, $I11, 2
    ne $S10, ">=", rx899_fail
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
    $P10 = rx899_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx899_fail
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx899_pos = $P10."pos"()
  # rx pass
    rx899_cur."!cursor_pass"(rx899_pos, "infix:sym<>=>")
    rx899_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx899_pos)
    .return (rx899_cur)
  rx899_fail:
.annotate "line", 368
    (rx899_rep, rx899_pos, $I10, $P10) = rx899_cur."!mark_fail"(0)
    lt rx899_pos, -1, rx899_done
    eq rx899_pos, -1, rx899_fail
    jump $I10
  rx899_done:
    rx899_cur."!cursor_fail"()
    rx899_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx899_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("257_1258129007.74018") :method
.annotate "line", 368
    $P901 = self."!PREFIX__!subrule"("O", ">=")
    new $P902, "ResizablePMCArray"
    push $P902, $P901
    .return ($P902)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("258_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx905_tgt
    .local int rx905_pos
    .local int rx905_off
    .local int rx905_eos
    .local int rx905_rep
    .local pmc rx905_cur
    (rx905_cur, rx905_pos, rx905_tgt, $I10) = self."!cursor_start"()
    rx905_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx905_cur
    .local pmc match
    .lex "$/", match
    length rx905_eos, rx905_tgt
    set rx905_off, 0
    lt $I10, 2, rx905_start
    sub rx905_off, $I10, 1
    substr rx905_tgt, rx905_tgt, rx905_off
  rx905_start:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_909_fail
    rx905_cur."!mark_push"(0, rx905_pos, $I10)
  # rx literal  "<"
    add $I11, rx905_pos, 1
    gt $I11, rx905_eos, rx905_fail
    sub $I11, rx905_pos, rx905_off
    substr $S10, rx905_tgt, $I11, 1
    ne $S10, "<", rx905_fail
    add rx905_pos, 1
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
    $P10 = rx905_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx905_fail
    rx905_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx905_pos = $P10."pos"()
  # rx pass
    rx905_cur."!cursor_pass"(rx905_pos, "infix:sym<<>")
    rx905_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx905_pos)
    .return (rx905_cur)
  rx905_fail:
.annotate "line", 368
    (rx905_rep, rx905_pos, $I10, $P10) = rx905_cur."!mark_fail"(0)
    lt rx905_pos, -1, rx905_done
    eq rx905_pos, -1, rx905_fail
    jump $I10
  rx905_done:
    rx905_cur."!cursor_fail"()
    rx905_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx905_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("259_1258129007.74018") :method
.annotate "line", 368
    $P907 = self."!PREFIX__!subrule"("O", "<")
    new $P908, "ResizablePMCArray"
    push $P908, $P907
    .return ($P908)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("260_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx911_tgt
    .local int rx911_pos
    .local int rx911_off
    .local int rx911_eos
    .local int rx911_rep
    .local pmc rx911_cur
    (rx911_cur, rx911_pos, rx911_tgt, $I10) = self."!cursor_start"()
    rx911_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx911_cur
    .local pmc match
    .lex "$/", match
    length rx911_eos, rx911_tgt
    set rx911_off, 0
    lt $I10, 2, rx911_start
    sub rx911_off, $I10, 1
    substr rx911_tgt, rx911_tgt, rx911_off
  rx911_start:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_915_fail
    rx911_cur."!mark_push"(0, rx911_pos, $I10)
  # rx literal  ">"
    add $I11, rx911_pos, 1
    gt $I11, rx911_eos, rx911_fail
    sub $I11, rx911_pos, rx911_off
    substr $S10, rx911_tgt, $I11, 1
    ne $S10, ">", rx911_fail
    add rx911_pos, 1
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
    $P10 = rx911_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx911_fail
    rx911_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx911_pos = $P10."pos"()
  # rx pass
    rx911_cur."!cursor_pass"(rx911_pos, "infix:sym<>>")
    rx911_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx911_pos)
    .return (rx911_cur)
  rx911_fail:
.annotate "line", 368
    (rx911_rep, rx911_pos, $I10, $P10) = rx911_cur."!mark_fail"(0)
    lt rx911_pos, -1, rx911_done
    eq rx911_pos, -1, rx911_fail
    jump $I10
  rx911_done:
    rx911_cur."!cursor_fail"()
    rx911_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx911_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("261_1258129007.74018") :method
.annotate "line", 368
    $P913 = self."!PREFIX__!subrule"("O", ">")
    new $P914, "ResizablePMCArray"
    push $P914, $P913
    .return ($P914)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("262_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx917_tgt
    .local int rx917_pos
    .local int rx917_off
    .local int rx917_eos
    .local int rx917_rep
    .local pmc rx917_cur
    (rx917_cur, rx917_pos, rx917_tgt, $I10) = self."!cursor_start"()
    rx917_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx917_cur
    .local pmc match
    .lex "$/", match
    length rx917_eos, rx917_tgt
    set rx917_off, 0
    lt $I10, 2, rx917_start
    sub rx917_off, $I10, 1
    substr rx917_tgt, rx917_tgt, rx917_off
  rx917_start:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_921_fail
    rx917_cur."!mark_push"(0, rx917_pos, $I10)
  # rx literal  "eq"
    add $I11, rx917_pos, 2
    gt $I11, rx917_eos, rx917_fail
    sub $I11, rx917_pos, rx917_off
    substr $S10, rx917_tgt, $I11, 2
    ne $S10, "eq", rx917_fail
    add rx917_pos, 2
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
    $P10 = rx917_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx917_fail
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx917_pos = $P10."pos"()
  # rx pass
    rx917_cur."!cursor_pass"(rx917_pos, "infix:sym<eq>")
    rx917_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx917_pos)
    .return (rx917_cur)
  rx917_fail:
.annotate "line", 368
    (rx917_rep, rx917_pos, $I10, $P10) = rx917_cur."!mark_fail"(0)
    lt rx917_pos, -1, rx917_done
    eq rx917_pos, -1, rx917_fail
    jump $I10
  rx917_done:
    rx917_cur."!cursor_fail"()
    rx917_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx917_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("263_1258129007.74018") :method
.annotate "line", 368
    $P919 = self."!PREFIX__!subrule"("O", "eq")
    new $P920, "ResizablePMCArray"
    push $P920, $P919
    .return ($P920)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("264_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx923_tgt
    .local int rx923_pos
    .local int rx923_off
    .local int rx923_eos
    .local int rx923_rep
    .local pmc rx923_cur
    (rx923_cur, rx923_pos, rx923_tgt, $I10) = self."!cursor_start"()
    rx923_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx923_cur
    .local pmc match
    .lex "$/", match
    length rx923_eos, rx923_tgt
    set rx923_off, 0
    lt $I10, 2, rx923_start
    sub rx923_off, $I10, 1
    substr rx923_tgt, rx923_tgt, rx923_off
  rx923_start:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_927_fail
    rx923_cur."!mark_push"(0, rx923_pos, $I10)
  # rx literal  "ne"
    add $I11, rx923_pos, 2
    gt $I11, rx923_eos, rx923_fail
    sub $I11, rx923_pos, rx923_off
    substr $S10, rx923_tgt, $I11, 2
    ne $S10, "ne", rx923_fail
    add rx923_pos, 2
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
    $P10 = rx923_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx923_fail
    rx923_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx923_pos = $P10."pos"()
  # rx pass
    rx923_cur."!cursor_pass"(rx923_pos, "infix:sym<ne>")
    rx923_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx923_pos)
    .return (rx923_cur)
  rx923_fail:
.annotate "line", 368
    (rx923_rep, rx923_pos, $I10, $P10) = rx923_cur."!mark_fail"(0)
    lt rx923_pos, -1, rx923_done
    eq rx923_pos, -1, rx923_fail
    jump $I10
  rx923_done:
    rx923_cur."!cursor_fail"()
    rx923_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx923_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("265_1258129007.74018") :method
.annotate "line", 368
    $P925 = self."!PREFIX__!subrule"("O", "ne")
    new $P926, "ResizablePMCArray"
    push $P926, $P925
    .return ($P926)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("266_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx929_tgt
    .local int rx929_pos
    .local int rx929_off
    .local int rx929_eos
    .local int rx929_rep
    .local pmc rx929_cur
    (rx929_cur, rx929_pos, rx929_tgt, $I10) = self."!cursor_start"()
    rx929_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx929_cur
    .local pmc match
    .lex "$/", match
    length rx929_eos, rx929_tgt
    set rx929_off, 0
    lt $I10, 2, rx929_start
    sub rx929_off, $I10, 1
    substr rx929_tgt, rx929_tgt, rx929_off
  rx929_start:
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_933_fail
    rx929_cur."!mark_push"(0, rx929_pos, $I10)
  # rx literal  "le"
    add $I11, rx929_pos, 2
    gt $I11, rx929_eos, rx929_fail
    sub $I11, rx929_pos, rx929_off
    substr $S10, rx929_tgt, $I11, 2
    ne $S10, "le", rx929_fail
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
    $P10 = rx929_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx929_fail
    rx929_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx929_pos = $P10."pos"()
  # rx pass
    rx929_cur."!cursor_pass"(rx929_pos, "infix:sym<le>")
    rx929_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx929_pos)
    .return (rx929_cur)
  rx929_fail:
.annotate "line", 368
    (rx929_rep, rx929_pos, $I10, $P10) = rx929_cur."!mark_fail"(0)
    lt rx929_pos, -1, rx929_done
    eq rx929_pos, -1, rx929_fail
    jump $I10
  rx929_done:
    rx929_cur."!cursor_fail"()
    rx929_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx929_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("267_1258129007.74018") :method
.annotate "line", 368
    $P931 = self."!PREFIX__!subrule"("O", "le")
    new $P932, "ResizablePMCArray"
    push $P932, $P931
    .return ($P932)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("268_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx935_tgt
    .local int rx935_pos
    .local int rx935_off
    .local int rx935_eos
    .local int rx935_rep
    .local pmc rx935_cur
    (rx935_cur, rx935_pos, rx935_tgt, $I10) = self."!cursor_start"()
    rx935_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx935_cur
    .local pmc match
    .lex "$/", match
    length rx935_eos, rx935_tgt
    set rx935_off, 0
    lt $I10, 2, rx935_start
    sub rx935_off, $I10, 1
    substr rx935_tgt, rx935_tgt, rx935_off
  rx935_start:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_939_fail
    rx935_cur."!mark_push"(0, rx935_pos, $I10)
  # rx literal  "ge"
    add $I11, rx935_pos, 2
    gt $I11, rx935_eos, rx935_fail
    sub $I11, rx935_pos, rx935_off
    substr $S10, rx935_tgt, $I11, 2
    ne $S10, "ge", rx935_fail
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
    $P10 = rx935_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx935_fail
    rx935_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx935_pos = $P10."pos"()
  # rx pass
    rx935_cur."!cursor_pass"(rx935_pos, "infix:sym<ge>")
    rx935_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx935_pos)
    .return (rx935_cur)
  rx935_fail:
.annotate "line", 368
    (rx935_rep, rx935_pos, $I10, $P10) = rx935_cur."!mark_fail"(0)
    lt rx935_pos, -1, rx935_done
    eq rx935_pos, -1, rx935_fail
    jump $I10
  rx935_done:
    rx935_cur."!cursor_fail"()
    rx935_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx935_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("269_1258129007.74018") :method
.annotate "line", 368
    $P937 = self."!PREFIX__!subrule"("O", "ge")
    new $P938, "ResizablePMCArray"
    push $P938, $P937
    .return ($P938)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("270_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt, $I10) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx941_cur
    .local pmc match
    .lex "$/", match
    length rx941_eos, rx941_tgt
    set rx941_off, 0
    lt $I10, 2, rx941_start
    sub rx941_off, $I10, 1
    substr rx941_tgt, rx941_tgt, rx941_off
  rx941_start:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_945_fail
    rx941_cur."!mark_push"(0, rx941_pos, $I10)
  # rx literal  "lt"
    add $I11, rx941_pos, 2
    gt $I11, rx941_eos, rx941_fail
    sub $I11, rx941_pos, rx941_off
    substr $S10, rx941_tgt, $I11, 2
    ne $S10, "lt", rx941_fail
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
    $P10 = rx941_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "infix:sym<lt>")
    rx941_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate "line", 368
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("271_1258129007.74018") :method
.annotate "line", 368
    $P943 = self."!PREFIX__!subrule"("O", "lt")
    new $P944, "ResizablePMCArray"
    push $P944, $P943
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("272_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx947_tgt
    .local int rx947_pos
    .local int rx947_off
    .local int rx947_eos
    .local int rx947_rep
    .local pmc rx947_cur
    (rx947_cur, rx947_pos, rx947_tgt, $I10) = self."!cursor_start"()
    rx947_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx947_cur
    .local pmc match
    .lex "$/", match
    length rx947_eos, rx947_tgt
    set rx947_off, 0
    lt $I10, 2, rx947_start
    sub rx947_off, $I10, 1
    substr rx947_tgt, rx947_tgt, rx947_off
  rx947_start:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_951_fail
    rx947_cur."!mark_push"(0, rx947_pos, $I10)
  # rx literal  "gt"
    add $I11, rx947_pos, 2
    gt $I11, rx947_eos, rx947_fail
    sub $I11, rx947_pos, rx947_off
    substr $S10, rx947_tgt, $I11, 2
    ne $S10, "gt", rx947_fail
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
    $P10 = rx947_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx947_fail
    rx947_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx947_pos = $P10."pos"()
  # rx pass
    rx947_cur."!cursor_pass"(rx947_pos, "infix:sym<gt>")
    rx947_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx947_pos)
    .return (rx947_cur)
  rx947_fail:
.annotate "line", 368
    (rx947_rep, rx947_pos, $I10, $P10) = rx947_cur."!mark_fail"(0)
    lt rx947_pos, -1, rx947_done
    eq rx947_pos, -1, rx947_fail
    jump $I10
  rx947_done:
    rx947_cur."!cursor_fail"()
    rx947_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx947_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("273_1258129007.74018") :method
.annotate "line", 368
    $P949 = self."!PREFIX__!subrule"("O", "gt")
    new $P950, "ResizablePMCArray"
    push $P950, $P949
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("274_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx953_tgt
    .local int rx953_pos
    .local int rx953_off
    .local int rx953_eos
    .local int rx953_rep
    .local pmc rx953_cur
    (rx953_cur, rx953_pos, rx953_tgt, $I10) = self."!cursor_start"()
    rx953_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx953_cur
    .local pmc match
    .lex "$/", match
    length rx953_eos, rx953_tgt
    set rx953_off, 0
    lt $I10, 2, rx953_start
    sub rx953_off, $I10, 1
    substr rx953_tgt, rx953_tgt, rx953_off
  rx953_start:
.annotate "line", 453
  # rx subcapture "sym"
    set_addr $I10, rxcap_957_fail
    rx953_cur."!mark_push"(0, rx953_pos, $I10)
  # rx literal  "=:="
    add $I11, rx953_pos, 3
    gt $I11, rx953_eos, rx953_fail
    sub $I11, rx953_pos, rx953_off
    substr $S10, rx953_tgt, $I11, 3
    ne $S10, "=:=", rx953_fail
    add rx953_pos, 3
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
    $P10 = rx953_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx953_fail
    rx953_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx953_pos = $P10."pos"()
  # rx pass
    rx953_cur."!cursor_pass"(rx953_pos, "infix:sym<=:=>")
    rx953_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx953_pos)
    .return (rx953_cur)
  rx953_fail:
.annotate "line", 368
    (rx953_rep, rx953_pos, $I10, $P10) = rx953_cur."!mark_fail"(0)
    lt rx953_pos, -1, rx953_done
    eq rx953_pos, -1, rx953_fail
    jump $I10
  rx953_done:
    rx953_cur."!cursor_fail"()
    rx953_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx953_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("275_1258129007.74018") :method
.annotate "line", 368
    $P955 = self."!PREFIX__!subrule"("O", "=:=")
    new $P956, "ResizablePMCArray"
    push $P956, $P955
    .return ($P956)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("276_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx959_tgt
    .local int rx959_pos
    .local int rx959_off
    .local int rx959_eos
    .local int rx959_rep
    .local pmc rx959_cur
    (rx959_cur, rx959_pos, rx959_tgt, $I10) = self."!cursor_start"()
    rx959_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx959_cur
    .local pmc match
    .lex "$/", match
    length rx959_eos, rx959_tgt
    set rx959_off, 0
    lt $I10, 2, rx959_start
    sub rx959_off, $I10, 1
    substr rx959_tgt, rx959_tgt, rx959_off
  rx959_start:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_963_fail
    rx959_cur."!mark_push"(0, rx959_pos, $I10)
  # rx literal  "&&"
    add $I11, rx959_pos, 2
    gt $I11, rx959_eos, rx959_fail
    sub $I11, rx959_pos, rx959_off
    substr $S10, rx959_tgt, $I11, 2
    ne $S10, "&&", rx959_fail
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
    $P10 = rx959_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx959_fail
    rx959_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx959_pos = $P10."pos"()
  # rx pass
    rx959_cur."!cursor_pass"(rx959_pos, "infix:sym<&&>")
    rx959_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx959_pos)
    .return (rx959_cur)
  rx959_fail:
.annotate "line", 368
    (rx959_rep, rx959_pos, $I10, $P10) = rx959_cur."!mark_fail"(0)
    lt rx959_pos, -1, rx959_done
    eq rx959_pos, -1, rx959_fail
    jump $I10
  rx959_done:
    rx959_cur."!cursor_fail"()
    rx959_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx959_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("277_1258129007.74018") :method
.annotate "line", 368
    $P961 = self."!PREFIX__!subrule"("O", "&&")
    new $P962, "ResizablePMCArray"
    push $P962, $P961
    .return ($P962)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("278_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx965_tgt
    .local int rx965_pos
    .local int rx965_off
    .local int rx965_eos
    .local int rx965_rep
    .local pmc rx965_cur
    (rx965_cur, rx965_pos, rx965_tgt, $I10) = self."!cursor_start"()
    rx965_cur."!cursor_debug"("START ", "infix:sym<||>")
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
  # rx literal  "||"
    add $I11, rx965_pos, 2
    gt $I11, rx965_eos, rx965_fail
    sub $I11, rx965_pos, rx965_off
    substr $S10, rx965_tgt, $I11, 2
    ne $S10, "||", rx965_fail
    add rx965_pos, 2
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
    $P10 = rx965_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx965_fail
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx965_pos = $P10."pos"()
  # rx pass
    rx965_cur."!cursor_pass"(rx965_pos, "infix:sym<||>")
    rx965_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx965_pos)
    .return (rx965_cur)
  rx965_fail:
.annotate "line", 368
    (rx965_rep, rx965_pos, $I10, $P10) = rx965_cur."!mark_fail"(0)
    lt rx965_pos, -1, rx965_done
    eq rx965_pos, -1, rx965_fail
    jump $I10
  rx965_done:
    rx965_cur."!cursor_fail"()
    rx965_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx965_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("279_1258129007.74018") :method
.annotate "line", 368
    $P967 = self."!PREFIX__!subrule"("O", "||")
    new $P968, "ResizablePMCArray"
    push $P968, $P967
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("280_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx971_tgt
    .local int rx971_pos
    .local int rx971_off
    .local int rx971_eos
    .local int rx971_rep
    .local pmc rx971_cur
    (rx971_cur, rx971_pos, rx971_tgt, $I10) = self."!cursor_start"()
    rx971_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx971_cur
    .local pmc match
    .lex "$/", match
    length rx971_eos, rx971_tgt
    set rx971_off, 0
    lt $I10, 2, rx971_start
    sub rx971_off, $I10, 1
    substr rx971_tgt, rx971_tgt, rx971_off
  rx971_start:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_975_fail
    rx971_cur."!mark_push"(0, rx971_pos, $I10)
  # rx literal  "//"
    add $I11, rx971_pos, 2
    gt $I11, rx971_eos, rx971_fail
    sub $I11, rx971_pos, rx971_off
    substr $S10, rx971_tgt, $I11, 2
    ne $S10, "//", rx971_fail
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
    $P10 = rx971_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx971_fail
    rx971_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx971_pos = $P10."pos"()
  # rx pass
    rx971_cur."!cursor_pass"(rx971_pos, "infix:sym<//>")
    rx971_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx971_pos)
    .return (rx971_cur)
  rx971_fail:
.annotate "line", 368
    (rx971_rep, rx971_pos, $I10, $P10) = rx971_cur."!mark_fail"(0)
    lt rx971_pos, -1, rx971_done
    eq rx971_pos, -1, rx971_fail
    jump $I10
  rx971_done:
    rx971_cur."!cursor_fail"()
    rx971_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx971_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("281_1258129007.74018") :method
.annotate "line", 368
    $P973 = self."!PREFIX__!subrule"("O", "//")
    new $P974, "ResizablePMCArray"
    push $P974, $P973
    .return ($P974)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("282_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx977_tgt
    .local int rx977_pos
    .local int rx977_off
    .local int rx977_eos
    .local int rx977_rep
    .local pmc rx977_cur
    (rx977_cur, rx977_pos, rx977_tgt, $I10) = self."!cursor_start"()
    rx977_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
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
  # rx literal  "??"
    add $I11, rx977_pos, 2
    gt $I11, rx977_eos, rx977_fail
    sub $I11, rx977_pos, rx977_off
    substr $S10, rx977_tgt, $I11, 2
    ne $S10, "??", rx977_fail
    add rx977_pos, 2
.annotate "line", 462
  # rx subrule "ws" subtype=method negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."ws"()
    unless $P10, rx977_fail
    rx977_pos = $P10."pos"()
.annotate "line", 463
  # rx subrule "EXPR" subtype=capture negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."EXPR"("i=")
    unless $P10, rx977_fail
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx977_pos = $P10."pos"()
.annotate "line", 464
  # rx literal  "!!"
    add $I11, rx977_pos, 2
    gt $I11, rx977_eos, rx977_fail
    sub $I11, rx977_pos, rx977_off
    substr $S10, rx977_tgt, $I11, 2
    ne $S10, "!!", rx977_fail
    add rx977_pos, 2
.annotate "line", 465
  # rx subrule "O" subtype=capture negate=
    rx977_cur."!cursor_pos"(rx977_pos)
    $P10 = rx977_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx977_fail
    rx977_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx977_pos = $P10."pos"()
.annotate "line", 460
  # rx pass
    rx977_cur."!cursor_pass"(rx977_pos, "infix:sym<?? !!>")
    rx977_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx977_pos)
    .return (rx977_cur)
  rx977_fail:
.annotate "line", 368
    (rx977_rep, rx977_pos, $I10, $P10) = rx977_cur."!mark_fail"(0)
    lt rx977_pos, -1, rx977_done
    eq rx977_pos, -1, rx977_fail
    jump $I10
  rx977_done:
    rx977_cur."!cursor_fail"()
    rx977_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx977_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("283_1258129007.74018") :method
.annotate "line", 368
    $P979 = self."!PREFIX__!subrule"("ws", "??")
    new $P980, "ResizablePMCArray"
    push $P980, $P979
    .return ($P980)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("284_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt, $I10) = self."!cursor_start"()
    rx982_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx982_cur
    .local pmc match
    .lex "$/", match
    length rx982_eos, rx982_tgt
    set rx982_off, 0
    lt $I10, 2, rx982_start
    sub rx982_off, $I10, 1
    substr rx982_tgt, rx982_tgt, rx982_off
  rx982_start:
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_986_fail
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  # rx literal  "="
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "=", rx982_fail
    add rx982_pos, 1
    set_addr $I10, rxcap_986_fail
    ($I12, $I11) = rx982_cur."!mark_peek"($I10)
    rx982_cur."!cursor_pos"($I11)
    ($P10) = rx982_cur."!cursor_start"()
    $P10."!cursor_pass"(rx982_pos, "")
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_986_done
  rxcap_986_fail:
    goto rx982_fail
  rxcap_986_done:
  # rx subrule "panic" subtype=method negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx982_fail
    rx982_pos = $P10."pos"()
.annotate "line", 468
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "infix:sym<=>")
    rx982_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_fail:
.annotate "line", 368
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("285_1258129007.74018") :method
.annotate "line", 368
    $P984 = self."!PREFIX__!subrule"("panic", "=")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("286_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt, $I10) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx988_cur
    .local pmc match
    .lex "$/", match
    length rx988_eos, rx988_tgt
    set rx988_off, 0
    lt $I10, 2, rx988_start
    sub rx988_off, $I10, 1
    substr rx988_tgt, rx988_tgt, rx988_off
  rx988_start:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_992_fail
    rx988_cur."!mark_push"(0, rx988_pos, $I10)
  # rx literal  ":="
    add $I11, rx988_pos, 2
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 2
    ne $S10, ":=", rx988_fail
    add rx988_pos, 2
    set_addr $I10, rxcap_992_fail
    ($I12, $I11) = rx988_cur."!mark_peek"($I10)
    rx988_cur."!cursor_pos"($I11)
    ($P10) = rx988_cur."!cursor_start"()
    $P10."!cursor_pass"(rx988_pos, "")
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_992_done
  rxcap_992_fail:
    goto rx988_fail
  rxcap_992_done:
  # rx subrule "O" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx988_pos = $P10."pos"()
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "infix:sym<:=>")
    rx988_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate "line", 368
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("287_1258129007.74018") :method
.annotate "line", 368
    $P990 = self."!PREFIX__!subrule"("O", ":=")
    new $P991, "ResizablePMCArray"
    push $P991, $P990
    .return ($P991)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("288_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx994_tgt
    .local int rx994_pos
    .local int rx994_off
    .local int rx994_eos
    .local int rx994_rep
    .local pmc rx994_cur
    (rx994_cur, rx994_pos, rx994_tgt, $I10) = self."!cursor_start"()
    rx994_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx994_cur
    .local pmc match
    .lex "$/", match
    length rx994_eos, rx994_tgt
    set rx994_off, 0
    lt $I10, 2, rx994_start
    sub rx994_off, $I10, 1
    substr rx994_tgt, rx994_tgt, rx994_off
  rx994_start:
.annotate "line", 472
  # rx subcapture "sym"
    set_addr $I10, rxcap_998_fail
    rx994_cur."!mark_push"(0, rx994_pos, $I10)
  # rx literal  "::="
    add $I11, rx994_pos, 3
    gt $I11, rx994_eos, rx994_fail
    sub $I11, rx994_pos, rx994_off
    substr $S10, rx994_tgt, $I11, 3
    ne $S10, "::=", rx994_fail
    add rx994_pos, 3
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
  # rx subrule "O" subtype=capture negate=
    rx994_cur."!cursor_pos"(rx994_pos)
    $P10 = rx994_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx994_fail
    rx994_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx994_pos = $P10."pos"()
  # rx pass
    rx994_cur."!cursor_pass"(rx994_pos, "infix:sym<::=>")
    rx994_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx994_pos)
    .return (rx994_cur)
  rx994_fail:
.annotate "line", 368
    (rx994_rep, rx994_pos, $I10, $P10) = rx994_cur."!mark_fail"(0)
    lt rx994_pos, -1, rx994_done
    eq rx994_pos, -1, rx994_fail
    jump $I10
  rx994_done:
    rx994_cur."!cursor_fail"()
    rx994_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx994_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("289_1258129007.74018") :method
.annotate "line", 368
    $P996 = self."!PREFIX__!subrule"("O", "::=")
    new $P997, "ResizablePMCArray"
    push $P997, $P996
    .return ($P997)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("290_1258129007.74018") :method :outer("11_1258129007.74018")
.annotate "line", 368
    .local string rx1000_tgt
    .local int rx1000_pos
    .local int rx1000_off
    .local int rx1000_eos
    .local int rx1000_rep
    .local pmc rx1000_cur
    (rx1000_cur, rx1000_pos, rx1000_tgt, $I10) = self."!cursor_start"()
    rx1000_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1000_cur
    .local pmc match
    .lex "$/", match
    length rx1000_eos, rx1000_tgt
    set rx1000_off, 0
    lt $I10, 2, rx1000_start
    sub rx1000_off, $I10, 1
    substr rx1000_tgt, rx1000_tgt, rx1000_off
  rx1000_start:
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1004_fail
    rx1000_cur."!mark_push"(0, rx1000_pos, $I10)
  # rx literal  ","
    add $I11, rx1000_pos, 1
    gt $I11, rx1000_eos, rx1000_fail
    sub $I11, rx1000_pos, rx1000_off
    substr $S10, rx1000_tgt, $I11, 1
    ne $S10, ",", rx1000_fail
    add rx1000_pos, 1
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
    $P10 = rx1000_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1000_fail
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1000_pos = $P10."pos"()
  # rx pass
    rx1000_cur."!cursor_pass"(rx1000_pos, "infix:sym<,>")
    rx1000_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1000_pos)
    .return (rx1000_cur)
  rx1000_fail:
.annotate "line", 368
    (rx1000_rep, rx1000_pos, $I10, $P10) = rx1000_cur."!mark_fail"(0)
    lt rx1000_pos, -1, rx1000_done
    eq rx1000_pos, -1, rx1000_fail
    jump $I10
  rx1000_done:
    rx1000_cur."!cursor_fail"()
    rx1000_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1000_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("291_1258129007.74018") :method
.annotate "line", 368
    $P1002 = self."!PREFIX__!subrule"("O", ",")
    new $P1003, "ResizablePMCArray"
    push $P1003, $P1002
    .return ($P1003)
.end


.namespace ["NQP";"Regex"]
.sub "_block1005"  :subid("292_1258129007.74018") :outer("11_1258129007.74018")
.annotate "line", 477
    .const 'Sub' $P1035 = "303_1258129007.74018" 
    capture_lex $P1035
    .const 'Sub' $P1023 = "300_1258129007.74018" 
    capture_lex $P1023
    .const 'Sub' $P1019 = "298_1258129007.74018" 
    capture_lex $P1019
    .const 'Sub' $P1015 = "296_1258129007.74018" 
    capture_lex $P1015
    .const 'Sub' $P1007 = "293_1258129007.74018" 
    capture_lex $P1007
    .const 'Sub' $P1035 = "303_1258129007.74018" 
    capture_lex $P1035
    .return ($P1035)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("293_1258129007.74018") :method :outer("292_1258129007.74018")
.annotate "line", 477
    .const 'Sub' $P1012 = "295_1258129007.74018" 
    capture_lex $P1012
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt, $I10) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1008_cur
    .local pmc match
    .lex "$/", match
    length rx1008_eos, rx1008_tgt
    set rx1008_off, 0
    lt $I10, 2, rx1008_start
    sub rx1008_off, $I10, 1
    substr rx1008_tgt, rx1008_tgt, rx1008_off
  rx1008_start:
.annotate "line", 479
  # rx literal  ":"
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, ":", rx1008_fail
    add rx1008_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    .const 'Sub' $P1012 = "295_1258129007.74018" 
    capture_lex $P1012
    $P10 = rx1008_cur."before"($P1012)
    unless $P10, rx1008_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."LANG"("MAIN", "statement")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1008_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."ws"()
    unless $P10, rx1008_fail
    rx1008_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1008_pos, 1
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 1
    ne $S10, ";", rx1008_fail
    add rx1008_pos, 1
.annotate "line", 478
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "metachar:sym<:my>")
    rx1008_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate "line", 477
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("294_1258129007.74018") :method
.annotate "line", 477
    new $P1010, "ResizablePMCArray"
    push $P1010, ":"
    .return ($P1010)
.end


.namespace ["NQP";"Regex"]
.sub "_block1011"  :anon :subid("295_1258129007.74018") :method :outer("293_1258129007.74018")
.annotate "line", 479
    .local string rx1013_tgt
    .local int rx1013_pos
    .local int rx1013_off
    .local int rx1013_eos
    .local int rx1013_rep
    .local pmc rx1013_cur
    (rx1013_cur, rx1013_pos, rx1013_tgt, $I10) = self."!cursor_start"()
    rx1013_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1013_cur
    .local pmc match
    .lex "$/", match
    length rx1013_eos, rx1013_tgt
    set rx1013_off, 0
    lt $I10, 2, rx1013_start
    sub rx1013_off, $I10, 1
    substr rx1013_tgt, rx1013_tgt, rx1013_off
  rx1013_start:
    ge rx1013_pos, 0, rxscan1014_done
  rxscan1014_loop:
    ($P10) = rx1013_cur."from"()
    inc $P10
    set rx1013_pos, $P10
    ge rx1013_pos, rx1013_eos, rxscan1014_done
    set_addr $I10, rxscan1014_loop
    rx1013_cur."!mark_push"(0, rx1013_pos, $I10)
  rxscan1014_done:
  # rx literal  "my"
    add $I11, rx1013_pos, 2
    gt $I11, rx1013_eos, rx1013_fail
    sub $I11, rx1013_pos, rx1013_off
    substr $S10, rx1013_tgt, $I11, 2
    ne $S10, "my", rx1013_fail
    add rx1013_pos, 2
  # rx pass
    rx1013_cur."!cursor_pass"(rx1013_pos, "")
    rx1013_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1013_pos)
    .return (rx1013_cur)
  rx1013_fail:
    (rx1013_rep, rx1013_pos, $I10, $P10) = rx1013_cur."!mark_fail"(0)
    lt rx1013_pos, -1, rx1013_done
    eq rx1013_pos, -1, rx1013_fail
    jump $I10
  rx1013_done:
    rx1013_cur."!cursor_fail"()
    rx1013_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1013_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("296_1258129007.74018") :method :outer("292_1258129007.74018")
.annotate "line", 477
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt, $I10) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1016_cur
    .local pmc match
    .lex "$/", match
    length rx1016_eos, rx1016_tgt
    set rx1016_off, 0
    lt $I10, 2, rx1016_start
    sub rx1016_off, $I10, 1
    substr rx1016_tgt, rx1016_tgt, rx1016_off
  rx1016_start:
.annotate "line", 483
  # rx enumcharlist negate=0 zerowidth
    ge rx1016_pos, rx1016_eos, rx1016_fail
    sub $I10, rx1016_pos, rx1016_off
    substr $S10, rx1016_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1016_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."codeblock"()
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1016_pos = $P10."pos"()
.annotate "line", 482
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "metachar:sym<{ }>")
    rx1016_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate "line", 477
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("297_1258129007.74018") :method
.annotate "line", 477
    new $P1018, "ResizablePMCArray"
    push $P1018, "{"
    .return ($P1018)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("298_1258129007.74018") :method :outer("292_1258129007.74018")
.annotate "line", 477
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt, $I10) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1020_cur
    .local pmc match
    .lex "$/", match
    length rx1020_eos, rx1020_tgt
    set rx1020_off, 0
    lt $I10, 2, rx1020_start
    sub rx1020_off, $I10, 1
    substr rx1020_tgt, rx1020_tgt, rx1020_off
  rx1020_start:
.annotate "line", 487
  # rx enumcharlist negate=0 zerowidth
    ge rx1020_pos, rx1020_eos, rx1020_fail
    sub $I10, rx1020_pos, rx1020_off
    substr $S10, rx1020_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1020_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1020_cur."!cursor_pos"(rx1020_pos)
    $P10 = rx1020_cur."codeblock"()
    unless $P10, rx1020_fail
    rx1020_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1020_pos = $P10."pos"()
.annotate "line", 486
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "assertion:sym<{ }>")
    rx1020_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
.annotate "line", 477
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("299_1258129007.74018") :method
.annotate "line", 477
    new $P1022, "ResizablePMCArray"
    push $P1022, "{"
    .return ($P1022)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("300_1258129007.74018") :method :outer("292_1258129007.74018")
.annotate "line", 477
    .const 'Sub' $P1031 = "302_1258129007.74018" 
    capture_lex $P1031
    .local string rx1024_tgt
    .local int rx1024_pos
    .local int rx1024_off
    .local int rx1024_eos
    .local int rx1024_rep
    .local pmc rx1024_cur
    (rx1024_cur, rx1024_pos, rx1024_tgt, $I10) = self."!cursor_start"()
    rx1024_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1024_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx1024_cur
    .local pmc match
    .lex "$/", match
    length rx1024_eos, rx1024_tgt
    set rx1024_off, 0
    lt $I10, 2, rx1024_start
    sub rx1024_off, $I10, 1
    substr rx1024_tgt, rx1024_tgt, rx1024_off
  rx1024_start:
.annotate "line", 491
  # rx subcapture "longname"
    set_addr $I10, rxcap_1027_fail
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1024_pos, rx1024_off
    find_not_cclass $I11, 8192, rx1024_tgt, $I10, rx1024_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1024_fail
    add rx1024_pos, rx1024_off, $I11
    set_addr $I10, rxcap_1027_fail
    ($I12, $I11) = rx1024_cur."!mark_peek"($I10)
    rx1024_cur."!cursor_pos"($I11)
    ($P10) = rx1024_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1024_pos, "")
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1027_done
  rxcap_1027_fail:
    goto rx1024_fail
  rxcap_1027_done:
.annotate "line", 498
  # rx rxquantr1028 ** 0..1
    set_addr $I1034, rxquantr1028_done
    rx1024_cur."!mark_push"(0, rx1024_pos, $I1034)
  rxquantr1028_loop:
  alt1029_0:
.annotate "line", 492
    set_addr $I10, alt1029_1
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
.annotate "line", 493
  # rx subrule "before" subtype=zerowidth negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    .const 'Sub' $P1031 = "302_1258129007.74018" 
    capture_lex $P1031
    $P10 = rx1024_cur."before"($P1031)
    unless $P10, rx1024_fail
    goto alt1029_end
  alt1029_1:
    set_addr $I10, alt1029_2
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
.annotate "line", 494
  # rx literal  "="
    add $I11, rx1024_pos, 1
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 1
    ne $S10, "=", rx1024_fail
    add rx1024_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."assertion"()
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1024_pos = $P10."pos"()
    goto alt1029_end
  alt1029_2:
    set_addr $I10, alt1029_3
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
.annotate "line", 495
  # rx literal  ":"
    add $I11, rx1024_pos, 1
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 1
    ne $S10, ":", rx1024_fail
    add rx1024_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."arglist"()
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1024_pos = $P10."pos"()
    goto alt1029_end
  alt1029_3:
    set_addr $I10, alt1029_4
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
.annotate "line", 496
  # rx literal  "("
    add $I11, rx1024_pos, 1
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 1
    ne $S10, "(", rx1024_fail
    add rx1024_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1024_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1024_pos, 1
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 1
    ne $S10, ")", rx1024_fail
    add rx1024_pos, 1
    goto alt1029_end
  alt1029_4:
.annotate "line", 497
  # rx subrule "normspace" subtype=method negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."normspace"()
    unless $P10, rx1024_fail
    rx1024_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."nibbler"()
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1024_pos = $P10."pos"()
  alt1029_end:
.annotate "line", 498
    (rx1024_rep) = rx1024_cur."!mark_commit"($I1034)
  rxquantr1028_done:
.annotate "line", 490
  # rx pass
    rx1024_cur."!cursor_pass"(rx1024_pos, "assertion:sym<name>")
    rx1024_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1024_pos)
    .return (rx1024_cur)
  rx1024_fail:
.annotate "line", 477
    (rx1024_rep, rx1024_pos, $I10, $P10) = rx1024_cur."!mark_fail"(0)
    lt rx1024_pos, -1, rx1024_done
    eq rx1024_pos, -1, rx1024_fail
    jump $I10
  rx1024_done:
    rx1024_cur."!cursor_fail"()
    rx1024_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1024_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("301_1258129007.74018") :method
.annotate "line", 477
    new $P1026, "ResizablePMCArray"
    push $P1026, ""
    .return ($P1026)
.end


.namespace ["NQP";"Regex"]
.sub "_block1030"  :anon :subid("302_1258129007.74018") :method :outer("300_1258129007.74018")
.annotate "line", 493
    .local string rx1032_tgt
    .local int rx1032_pos
    .local int rx1032_off
    .local int rx1032_eos
    .local int rx1032_rep
    .local pmc rx1032_cur
    (rx1032_cur, rx1032_pos, rx1032_tgt, $I10) = self."!cursor_start"()
    rx1032_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1032_cur
    .local pmc match
    .lex "$/", match
    length rx1032_eos, rx1032_tgt
    set rx1032_off, 0
    lt $I10, 2, rx1032_start
    sub rx1032_off, $I10, 1
    substr rx1032_tgt, rx1032_tgt, rx1032_off
  rx1032_start:
    ge rx1032_pos, 0, rxscan1033_done
  rxscan1033_loop:
    ($P10) = rx1032_cur."from"()
    inc $P10
    set rx1032_pos, $P10
    ge rx1032_pos, rx1032_eos, rxscan1033_done
    set_addr $I10, rxscan1033_loop
    rx1032_cur."!mark_push"(0, rx1032_pos, $I10)
  rxscan1033_done:
  # rx literal  ">"
    add $I11, rx1032_pos, 1
    gt $I11, rx1032_eos, rx1032_fail
    sub $I11, rx1032_pos, rx1032_off
    substr $S10, rx1032_tgt, $I11, 1
    ne $S10, ">", rx1032_fail
    add rx1032_pos, 1
  # rx pass
    rx1032_cur."!cursor_pass"(rx1032_pos, "")
    rx1032_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1032_pos)
    .return (rx1032_cur)
  rx1032_fail:
    (rx1032_rep, rx1032_pos, $I10, $P10) = rx1032_cur."!mark_fail"(0)
    lt rx1032_pos, -1, rx1032_done
    eq rx1032_pos, -1, rx1032_fail
    jump $I10
  rx1032_done:
    rx1032_cur."!cursor_fail"()
    rx1032_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1032_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("303_1258129007.74018") :method :outer("292_1258129007.74018")
.annotate "line", 477
    .local string rx1036_tgt
    .local int rx1036_pos
    .local int rx1036_off
    .local int rx1036_eos
    .local int rx1036_rep
    .local pmc rx1036_cur
    (rx1036_cur, rx1036_pos, rx1036_tgt, $I10) = self."!cursor_start"()
    rx1036_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1036_cur
    .local pmc match
    .lex "$/", match
    length rx1036_eos, rx1036_tgt
    set rx1036_off, 0
    lt $I10, 2, rx1036_start
    sub rx1036_off, $I10, 1
    substr rx1036_tgt, rx1036_tgt, rx1036_off
  rx1036_start:
.annotate "line", 503
  # rx subrule "LANG" subtype=capture negate=
    rx1036_cur."!cursor_pos"(rx1036_pos)
    $P10 = rx1036_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1036_fail
    rx1036_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1036_pos = $P10."pos"()
.annotate "line", 502
  # rx pass
    rx1036_cur."!cursor_pass"(rx1036_pos, "codeblock")
    rx1036_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1036_pos)
    .return (rx1036_cur)
  rx1036_fail:
.annotate "line", 477
    (rx1036_rep, rx1036_pos, $I10, $P10) = rx1036_cur."!mark_fail"(0)
    lt rx1036_pos, -1, rx1036_done
    eq rx1036_pos, -1, rx1036_fail
    jump $I10
  rx1036_done:
    rx1036_cur."!cursor_fail"()
    rx1036_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1036_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("304_1258129007.74018") :method
.annotate "line", 477
    $P1038 = self."!PREFIX__!subrule"("block", "")
    new $P1039, "ResizablePMCArray"
    push $P1039, $P1038
    .return ($P1039)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258129019.06598")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1835 = $P14()
.annotate "line", 1
    .return ($P1835)
.end


.namespace []
.sub "" :load :init :subid("post113") :outer("10_1258129019.06598")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258129019.06598" 
    .local pmc block
    set block, $P12
    $P1836 = get_root_global ["parrot"], "P6metaclass"
    $P1836."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258129019.06598") :outer("10_1258129019.06598")
.annotate "line", 3
    .const 'Sub' $P1831 = "112_1258129019.06598" 
    capture_lex $P1831
    get_hll_global $P1767, ["NQP";"RegexActions"], "_block1766" 
    capture_lex $P1767
    .const 'Sub' $P1756 = "106_1258129019.06598" 
    capture_lex $P1756
    .const 'Sub' $P1746 = "105_1258129019.06598" 
    capture_lex $P1746
    .const 'Sub' $P1736 = "104_1258129019.06598" 
    capture_lex $P1736
    .const 'Sub' $P1721 = "103_1258129019.06598" 
    capture_lex $P1721
    .const 'Sub' $P1707 = "102_1258129019.06598" 
    capture_lex $P1707
    .const 'Sub' $P1697 = "101_1258129019.06598" 
    capture_lex $P1697
    .const 'Sub' $P1683 = "100_1258129019.06598" 
    capture_lex $P1683
    .const 'Sub' $P1673 = "99_1258129019.06598" 
    capture_lex $P1673
    .const 'Sub' $P1663 = "98_1258129019.06598" 
    capture_lex $P1663
    .const 'Sub' $P1653 = "97_1258129019.06598" 
    capture_lex $P1653
    .const 'Sub' $P1643 = "96_1258129019.06598" 
    capture_lex $P1643
    .const 'Sub' $P1633 = "95_1258129019.06598" 
    capture_lex $P1633
    .const 'Sub' $P1605 = "94_1258129019.06598" 
    capture_lex $P1605
    .const 'Sub' $P1595 = "93_1258129019.06598" 
    capture_lex $P1595
    .const 'Sub' $P1583 = "92_1258129019.06598" 
    capture_lex $P1583
    .const 'Sub' $P1571 = "91_1258129019.06598" 
    capture_lex $P1571
    .const 'Sub' $P1559 = "90_1258129019.06598" 
    capture_lex $P1559
    .const 'Sub' $P1549 = "89_1258129019.06598" 
    capture_lex $P1549
    .const 'Sub' $P1520 = "88_1258129019.06598" 
    capture_lex $P1520
    .const 'Sub' $P1496 = "87_1258129019.06598" 
    capture_lex $P1496
    .const 'Sub' $P1486 = "86_1258129019.06598" 
    capture_lex $P1486
    .const 'Sub' $P1459 = "85_1258129019.06598" 
    capture_lex $P1459
    .const 'Sub' $P1441 = "84_1258129019.06598" 
    capture_lex $P1441
    .const 'Sub' $P1431 = "83_1258129019.06598" 
    capture_lex $P1431
    .const 'Sub' $P1347 = "80_1258129019.06598" 
    capture_lex $P1347
    .const 'Sub' $P1337 = "79_1258129019.06598" 
    capture_lex $P1337
    .const 'Sub' $P1308 = "78_1258129019.06598" 
    capture_lex $P1308
    .const 'Sub' $P1275 = "77_1258129019.06598" 
    capture_lex $P1275
    .const 'Sub' $P1259 = "76_1258129019.06598" 
    capture_lex $P1259
    .const 'Sub' $P1250 = "75_1258129019.06598" 
    capture_lex $P1250
    .const 'Sub' $P1225 = "74_1258129019.06598" 
    capture_lex $P1225
    .const 'Sub' $P1121 = "71_1258129019.06598" 
    capture_lex $P1121
    .const 'Sub' $P1104 = "70_1258129019.06598" 
    capture_lex $P1104
    .const 'Sub' $P1084 = "69_1258129019.06598" 
    capture_lex $P1084
    .const 'Sub' $P1000 = "68_1258129019.06598" 
    capture_lex $P1000
    .const 'Sub' $P976 = "66_1258129019.06598" 
    capture_lex $P976
    .const 'Sub' $P942 = "64_1258129019.06598" 
    capture_lex $P942
    .const 'Sub' $P896 = "62_1258129019.06598" 
    capture_lex $P896
    .const 'Sub' $P886 = "61_1258129019.06598" 
    capture_lex $P886
    .const 'Sub' $P876 = "60_1258129019.06598" 
    capture_lex $P876
    .const 'Sub' $P805 = "58_1258129019.06598" 
    capture_lex $P805
    .const 'Sub' $P788 = "57_1258129019.06598" 
    capture_lex $P788
    .const 'Sub' $P778 = "56_1258129019.06598" 
    capture_lex $P778
    .const 'Sub' $P768 = "55_1258129019.06598" 
    capture_lex $P768
    .const 'Sub' $P758 = "54_1258129019.06598" 
    capture_lex $P758
    .const 'Sub' $P734 = "53_1258129019.06598" 
    capture_lex $P734
    .const 'Sub' $P681 = "52_1258129019.06598" 
    capture_lex $P681
    .const 'Sub' $P671 = "51_1258129019.06598" 
    capture_lex $P671
    .const 'Sub' $P622 = "50_1258129019.06598" 
    capture_lex $P622
    .const 'Sub' $P596 = "49_1258129019.06598" 
    capture_lex $P596
    .const 'Sub' $P586 = "48_1258129019.06598" 
    capture_lex $P586
    .const 'Sub' $P576 = "47_1258129019.06598" 
    capture_lex $P576
    .const 'Sub' $P566 = "46_1258129019.06598" 
    capture_lex $P566
    .const 'Sub' $P556 = "45_1258129019.06598" 
    capture_lex $P556
    .const 'Sub' $P546 = "44_1258129019.06598" 
    capture_lex $P546
    .const 'Sub' $P536 = "43_1258129019.06598" 
    capture_lex $P536
    .const 'Sub' $P526 = "42_1258129019.06598" 
    capture_lex $P526
    .const 'Sub' $P516 = "41_1258129019.06598" 
    capture_lex $P516
    .const 'Sub' $P506 = "40_1258129019.06598" 
    capture_lex $P506
    .const 'Sub' $P496 = "39_1258129019.06598" 
    capture_lex $P496
    .const 'Sub' $P478 = "38_1258129019.06598" 
    capture_lex $P478
    .const 'Sub' $P462 = "37_1258129019.06598" 
    capture_lex $P462
    .const 'Sub' $P447 = "36_1258129019.06598" 
    capture_lex $P447
    .const 'Sub' $P434 = "35_1258129019.06598" 
    capture_lex $P434
    .const 'Sub' $P408 = "34_1258129019.06598" 
    capture_lex $P408
    .const 'Sub' $P372 = "33_1258129019.06598" 
    capture_lex $P372
    .const 'Sub' $P355 = "32_1258129019.06598" 
    capture_lex $P355
    .const 'Sub' $P341 = "31_1258129019.06598" 
    capture_lex $P341
    .const 'Sub' $P286 = "29_1258129019.06598" 
    capture_lex $P286
    .const 'Sub' $P273 = "28_1258129019.06598" 
    capture_lex $P273
    .const 'Sub' $P254 = "27_1258129019.06598" 
    capture_lex $P254
    .const 'Sub' $P244 = "26_1258129019.06598" 
    capture_lex $P244
    .const 'Sub' $P234 = "25_1258129019.06598" 
    capture_lex $P234
    .const 'Sub' $P218 = "24_1258129019.06598" 
    capture_lex $P218
    .const 'Sub' $P173 = "22_1258129019.06598" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258129019.06598" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258129019.06598" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258129019.06598" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258129019.06598" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258129019.06598" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258129019.06598" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258129019.06598" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_116
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_116:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258129019.06598" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258129019.06598" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258129019.06598" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 633
    get_hll_global $P1767, ["NQP";"RegexActions"], "_block1766" 
    capture_lex $P1767
    $P1829 = $P1767()
.annotate "line", 3
    .return ($P1829)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post114") :outer("11_1258129019.06598")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1831 = "112_1258129019.06598" 
    capture_lex $P1831
    $P1831()
    $P1834 = get_root_global ["parrot"], "P6metaclass"
    $P1834."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1830"  :anon :subid("112_1258129019.06598") :outer("11_1258129019.06598")
.annotate "line", 6
    get_global $P1832, "@BLOCK"
    unless_null $P1832, vivify_115
    new $P1832, "ResizablePMCArray"
    set_global "@BLOCK", $P1832
  vivify_115:
 $P1833 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1833
.annotate "line", 5
    .return ($P1833)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258129019.06598") :outer("11_1258129019.06598")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_117
    new $P20, "ResizablePMCArray"
  vivify_117:
    set $P21, $P20[1]
    unless_null $P21, vivify_118
    new $P21, "Undef"
  vivify_118:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_119
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_119:
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
.sub "block_immediate"  :subid("13_1258129019.06598") :outer("11_1258129019.06598")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258129019.06598" 
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
    .const 'Sub' $P35 = "14_1258129019.06598" 
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
.sub "_block34"  :anon :subid("14_1258129019.06598") :outer("13_1258129019.06598")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258129019.06598" 
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
    unless $I43, for_undef_120
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1258129019.06598" 
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
  for_undef_120:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1258129019.06598") :outer("14_1258129019.06598")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258129019.06598") :outer("11_1258129019.06598")
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
.sub "TOP"  :subid("17_1258129019.06598") :method :outer("11_1258129019.06598")
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
    unless_null $P84, vivify_121
    new $P84, "Hash"
  vivify_121:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_122
    new $P85, "Undef"
  vivify_122:
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
.sub "deflongname"  :subid("18_1258129019.06598") :method :outer("11_1258129019.06598")
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
    unless_null $P95, vivify_123
    new $P95, "Hash"
  vivify_123:
    set $P96, $P95["sym"]
    unless_null $P96, vivify_124
    new $P96, "Undef"
  vivify_124:
    if $P96, if_94
    set $P93, $P96
    goto if_94_end
  if_94:
    find_lex $P97, "$/"
    find_lex $P98, "$/"
    unless_null $P98, vivify_125
    new $P98, "Hash"
  vivify_125:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_126
    new $P99, "Undef"
  vivify_126:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_127
    new $P103, "Hash"
  vivify_127:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_128
    new $P104, "ResizablePMCArray"
  vivify_128:
    set $P105, $P104[0]
    unless_null $P105, vivify_129
    new $P105, "Undef"
  vivify_129:
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
.sub "comp_unit"  :subid("19_1258129019.06598") :method :outer("11_1258129019.06598")
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
    unless_null $P117, vivify_130
    new $P117, "Hash"
  vivify_130:
    set $P118, $P117["statementlist"]
    unless_null $P118, vivify_131
    new $P118, "Undef"
  vivify_131:
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
.sub "statementlist"  :subid("20_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258129019.06598" 
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
    unless_null $P139, vivify_132
    new $P139, "Hash"
  vivify_132:
    set $P140, $P139["statement"]
    unless_null $P140, vivify_133
    new $P140, "Undef"
  vivify_133:
    unless $P140, if_138_end
.annotate "line", 47
    find_lex $P142, "$/"
    unless_null $P142, vivify_134
    new $P142, "Hash"
  vivify_134:
    set $P143, $P142["statement"]
    unless_null $P143, vivify_135
    new $P143, "Undef"
  vivify_135:
    defined $I144, $P143
    unless $I144, for_undef_136
    iter $P141, $P143
    new $P167, 'ExceptionHandler'
    set_addr $P167, loop166_handler
    $P167."handle_types"(65, 67, 66)
    push_eh $P167
  loop166_test:
    unless $P141, loop166_done
    shift $P145, $P141
  loop166_redo:
    .const 'Sub' $P147 = "21_1258129019.06598" 
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
  for_undef_136:
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
.sub "_block146"  :anon :subid("21_1258129019.06598") :outer("20_1258129019.06598")
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
.sub "statement"  :subid("22_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1258129019.06598" 
    capture_lex $P185
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
    if has_param_177, optparam_137
    new $P178, "Undef"
    set param_177, $P178
  optparam_137:
    .lex "$key", param_177
.annotate "line", 59
    new $P179, "Undef"
    .lex "$past", $P179
.annotate "line", 58
    find_lex $P180, "$past"
.annotate "line", 60
    find_lex $P182, "$/"
    unless_null $P182, vivify_138
    new $P182, "Hash"
  vivify_138:
    set $P183, $P182["EXPR"]
    unless_null $P183, vivify_139
    new $P183, "Undef"
  vivify_139:
    if $P183, if_181
.annotate "line", 66
    find_lex $P208, "$/"
    unless_null $P208, vivify_140
    new $P208, "Hash"
  vivify_140:
    set $P209, $P208["statement_control"]
    unless_null $P209, vivify_141
    new $P209, "Undef"
  vivify_141:
    if $P209, if_207
.annotate "line", 67
    new $P213, "Integer"
    assign $P213, 0
    store_lex "$past", $P213
    goto if_207_end
  if_207:
.annotate "line", 66
    find_lex $P210, "$/"
    unless_null $P210, vivify_142
    new $P210, "Hash"
  vivify_142:
    set $P211, $P210["statement_control"]
    unless_null $P211, vivify_143
    new $P211, "Undef"
  vivify_143:
    $P212 = $P211."ast"()
    store_lex "$past", $P212
  if_207_end:
    goto if_181_end
  if_181:
.annotate "line", 60
    .const 'Sub' $P185 = "23_1258129019.06598" 
    capture_lex $P185
    $P185()
  if_181_end:
.annotate "line", 68
    find_lex $P214, "$/"
    find_lex $P215, "$past"
    $P216 = $P214."!make"($P215)
.annotate "line", 58
    .return ($P216)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block184"  :anon :subid("23_1258129019.06598") :outer("22_1258129019.06598")
.annotate "line", 61
    new $P186, "Undef"
    .lex "$mc", $P186
    find_lex $P187, "$/"
    unless_null $P187, vivify_144
    new $P187, "Hash"
  vivify_144:
    set $P188, $P187["statement_mod_cond"]
    unless_null $P188, vivify_145
    new $P188, "ResizablePMCArray"
  vivify_145:
    set $P189, $P188[0]
    unless_null $P189, vivify_146
    new $P189, "Undef"
  vivify_146:
    store_lex "$mc", $P189
.annotate "line", 63
    find_lex $P192, "$mc"
    if $P192, if_191
.annotate "line", 64
    find_lex $P204, "$/"
    unless_null $P204, vivify_147
    new $P204, "Hash"
  vivify_147:
    set $P205, $P204["EXPR"]
    unless_null $P205, vivify_148
    new $P205, "Undef"
  vivify_148:
    $P206 = $P205."ast"()
    set $P190, $P206
.annotate "line", 63
    goto if_191_end
  if_191:
    get_hll_global $P193, ["PAST"], "Op"
    find_lex $P194, "$mc"
    $P195 = $P194."ast"()
    find_lex $P196, "$/"
    unless_null $P196, vivify_149
    new $P196, "Hash"
  vivify_149:
    set $P197, $P196["EXPR"]
    unless_null $P197, vivify_150
    new $P197, "Undef"
  vivify_150:
    $P198 = $P197."ast"()
    find_lex $P199, "$mc"
    unless_null $P199, vivify_151
    new $P199, "Hash"
  vivify_151:
    set $P200, $P199["sym"]
    unless_null $P200, vivify_152
    new $P200, "Undef"
  vivify_152:
    set $S201, $P200
    find_lex $P202, "$/"
    $P203 = $P193."new"($P195, $P198, $S201 :named("pasttype"), $P202 :named("node"))
    set $P190, $P203
  if_191_end:
    store_lex "$past", $P190
.annotate "line", 60
    .return ($P190)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("24_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_221
.annotate "line", 71
    new $P220, 'ExceptionHandler'
    set_addr $P220, control_219
    $P220."handle_types"(58)
    push_eh $P220
    .lex "self", self
    .lex "$/", param_221
.annotate "line", 72
    find_lex $P222, "$/"
    get_hll_global $P223, ["PAST"], "Op"
    find_lex $P224, "$/"
    unless_null $P224, vivify_153
    new $P224, "Hash"
  vivify_153:
    set $P225, $P224["EXPR"]
    unless_null $P225, vivify_154
    new $P225, "Undef"
  vivify_154:
    $P226 = $P225."ast"()
    find_lex $P227, "$/"
    unless_null $P227, vivify_155
    new $P227, "Hash"
  vivify_155:
    set $P228, $P227["pblock"]
    unless_null $P228, vivify_156
    new $P228, "Undef"
  vivify_156:
    $P229 = $P228."ast"()
    find_lex $P230, "$/"
    $P231 = $P223."new"($P226, $P229, "if" :named("pasttype"), $P230 :named("node"))
    $P232 = $P222."!make"($P231)
.annotate "line", 71
    .return ($P232)
  control_219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("25_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_237
.annotate "line", 75
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "self", self
    .lex "$/", param_237
.annotate "line", 76
    find_lex $P238, "$/"
    find_lex $P239, "$/"
    unless_null $P239, vivify_157
    new $P239, "Hash"
  vivify_157:
    set $P240, $P239["blockoid"]
    unless_null $P240, vivify_158
    new $P240, "Undef"
  vivify_158:
    $P241 = $P240."ast"()
    $P242 = $P238."!make"($P241)
.annotate "line", 75
    .return ($P242)
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P243, exception, "payload"
    .return ($P243)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("26_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_247
.annotate "line", 79
    new $P246, 'ExceptionHandler'
    set_addr $P246, control_245
    $P246."handle_types"(58)
    push_eh $P246
    .lex "self", self
    .lex "$/", param_247
.annotate "line", 80
    find_lex $P248, "$/"
    find_lex $P249, "$/"
    unless_null $P249, vivify_159
    new $P249, "Hash"
  vivify_159:
    set $P250, $P249["blockoid"]
    unless_null $P250, vivify_160
    new $P250, "Undef"
  vivify_160:
    $P251 = $P250."ast"()
    $P252 = $P248."!make"($P251)
.annotate "line", 79
    .return ($P252)
  control_245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P253, exception, "payload"
    .return ($P253)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("27_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_257
.annotate "line", 83
    new $P256, 'ExceptionHandler'
    set_addr $P256, control_255
    $P256."handle_types"(58)
    push_eh $P256
    .lex "self", self
    .lex "$/", param_257
.annotate "line", 84
    new $P258, "Undef"
    .lex "$past", $P258
.annotate "line", 85
    new $P259, "Undef"
    .lex "$BLOCK", $P259
.annotate "line", 84
    find_lex $P260, "$/"
    unless_null $P260, vivify_161
    new $P260, "Hash"
  vivify_161:
    set $P261, $P260["statementlist"]
    unless_null $P261, vivify_162
    new $P261, "Undef"
  vivify_162:
    $P262 = $P261."ast"()
    store_lex "$past", $P262
.annotate "line", 85
    get_global $P263, "@BLOCK"
    $P264 = $P263."shift"()
    store_lex "$BLOCK", $P264
.annotate "line", 86
    find_lex $P265, "$BLOCK"
    find_lex $P266, "$past"
    $P265."push"($P266)
.annotate "line", 87
    find_lex $P267, "$BLOCK"
    find_lex $P268, "$/"
    $P267."node"($P268)
.annotate "line", 88
    find_lex $P269, "$/"
    find_lex $P270, "$BLOCK"
    $P271 = $P269."!make"($P270)
.annotate "line", 83
    .return ($P271)
  control_255:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P272, exception, "payload"
    .return ($P272)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("28_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_276
.annotate "line", 91
    new $P275, 'ExceptionHandler'
    set_addr $P275, control_274
    $P275."handle_types"(58)
    push_eh $P275
    .lex "self", self
    .lex "$/", param_276
.annotate "line", 92
    get_global $P277, "@BLOCK"
    unless_null $P277, vivify_163
    new $P277, "ResizablePMCArray"
    set_global "@BLOCK", $P277
  vivify_163:
.annotate "line", 91
    get_global $P278, "@BLOCK"
.annotate "line", 93
    get_global $P279, "@BLOCK"
    get_hll_global $P280, ["PAST"], "Block"
    get_hll_global $P281, ["PAST"], "Stmts"
    $P282 = $P281."new"()
    $P283 = $P280."new"($P282)
    $P284 = $P279."unshift"($P283)
.annotate "line", 91
    .return ($P284)
  control_274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("29_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_289
.annotate "line", 98
    .const 'Sub' $P319 = "30_1258129019.06598" 
    capture_lex $P319
    new $P288, 'ExceptionHandler'
    set_addr $P288, control_287
    $P288."handle_types"(58)
    push_eh $P288
    .lex "self", self
    .lex "$/", param_289
.annotate "line", 99
    new $P290, "Undef"
    .lex "$count", $P290
.annotate "line", 100
    new $P291, "Undef"
    .lex "$past", $P291
.annotate "line", 99
    find_lex $P292, "$/"
    unless_null $P292, vivify_164
    new $P292, "Hash"
  vivify_164:
    set $P293, $P292["xblock"]
    unless_null $P293, vivify_165
    new $P293, "Undef"
  vivify_165:
    set $N294, $P293
    new $P295, 'Float'
    set $P295, $N294
    sub $P296, $P295, 1
    store_lex "$count", $P296
.annotate "line", 100
    find_lex $P297, "$count"
    set $I298, $P297
    find_lex $P299, "$/"
    unless_null $P299, vivify_166
    new $P299, "Hash"
  vivify_166:
    set $P300, $P299["xblock"]
    unless_null $P300, vivify_167
    new $P300, "ResizablePMCArray"
  vivify_167:
    set $P301, $P300[$I298]
    unless_null $P301, vivify_168
    new $P301, "Undef"
  vivify_168:
    $P302 = $P301."ast"()
    $P303 = "xblock_immediate"($P302)
    store_lex "$past", $P303
.annotate "line", 101
    find_lex $P305, "$/"
    unless_null $P305, vivify_169
    new $P305, "Hash"
  vivify_169:
    set $P306, $P305["else"]
    unless_null $P306, vivify_170
    new $P306, "Undef"
  vivify_170:
    unless $P306, if_304_end
.annotate "line", 102
    find_lex $P307, "$past"
    find_lex $P308, "$/"
    unless_null $P308, vivify_171
    new $P308, "Hash"
  vivify_171:
    set $P309, $P308["else"]
    unless_null $P309, vivify_172
    new $P309, "ResizablePMCArray"
  vivify_172:
    set $P310, $P309[0]
    unless_null $P310, vivify_173
    new $P310, "Undef"
  vivify_173:
    $P311 = $P310."ast"()
    $P312 = "block_immediate"($P311)
    $P307."push"($P312)
  if_304_end:
.annotate "line", 105
    new $P335, 'ExceptionHandler'
    set_addr $P335, loop334_handler
    $P335."handle_types"(65, 67, 66)
    push_eh $P335
  loop334_test:
    find_lex $P313, "$count"
    set $N314, $P313
    new $P315, "Integer"
    assign $P315, 0
    set $N316, $P315
    isgt $I317, $N314, $N316
    unless $I317, loop334_done
  loop334_redo:
    .const 'Sub' $P319 = "30_1258129019.06598" 
    capture_lex $P319
    $P319()
  loop334_next:
    goto loop334_test
  loop334_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, 'type'
    eq $P336, 65, loop334_next
    eq $P336, 67, loop334_redo
  loop334_done:
    pop_eh 
.annotate "line", 111
    find_lex $P337, "$/"
    find_lex $P338, "$past"
    $P339 = $P337."!make"($P338)
.annotate "line", 98
    .return ($P339)
  control_287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P340, exception, "payload"
    .return ($P340)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block318"  :anon :subid("30_1258129019.06598") :outer("29_1258129019.06598")
.annotate "line", 107
    new $P320, "Undef"
    .lex "$else", $P320
.annotate "line", 105
    find_lex $P321, "$count"
    clone $P322, $P321
    dec $P321
.annotate "line", 107
    find_lex $P323, "$past"
    store_lex "$else", $P323
.annotate "line", 108
    find_lex $P324, "$count"
    set $I325, $P324
    find_lex $P326, "$/"
    unless_null $P326, vivify_174
    new $P326, "Hash"
  vivify_174:
    set $P327, $P326["xblock"]
    unless_null $P327, vivify_175
    new $P327, "ResizablePMCArray"
  vivify_175:
    set $P328, $P327[$I325]
    unless_null $P328, vivify_176
    new $P328, "Undef"
  vivify_176:
    $P329 = $P328."ast"()
    $P330 = "xblock_immediate"($P329)
    store_lex "$past", $P330
.annotate "line", 109
    find_lex $P331, "$past"
    find_lex $P332, "$else"
    $P333 = $P331."push"($P332)
.annotate "line", 105
    .return ($P333)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("31_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_344
.annotate "line", 114
    new $P343, 'ExceptionHandler'
    set_addr $P343, control_342
    $P343."handle_types"(58)
    push_eh $P343
    .lex "self", self
    .lex "$/", param_344
.annotate "line", 115
    new $P345, "Undef"
    .lex "$past", $P345
    find_lex $P346, "$/"
    unless_null $P346, vivify_177
    new $P346, "Hash"
  vivify_177:
    set $P347, $P346["xblock"]
    unless_null $P347, vivify_178
    new $P347, "Undef"
  vivify_178:
    $P348 = $P347."ast"()
    $P349 = "xblock_immediate"($P348)
    store_lex "$past", $P349
.annotate "line", 116
    find_lex $P350, "$past"
    $P350."pasttype"("unless")
.annotate "line", 117
    find_lex $P351, "$/"
    find_lex $P352, "$past"
    $P353 = $P351."!make"($P352)
.annotate "line", 114
    .return ($P353)
  control_342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, "payload"
    .return ($P354)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("32_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_358
.annotate "line", 120
    new $P357, 'ExceptionHandler'
    set_addr $P357, control_356
    $P357."handle_types"(58)
    push_eh $P357
    .lex "self", self
    .lex "$/", param_358
.annotate "line", 121
    new $P359, "Undef"
    .lex "$past", $P359
    find_lex $P360, "$/"
    unless_null $P360, vivify_179
    new $P360, "Hash"
  vivify_179:
    set $P361, $P360["xblock"]
    unless_null $P361, vivify_180
    new $P361, "Undef"
  vivify_180:
    $P362 = $P361."ast"()
    $P363 = "xblock_immediate"($P362)
    store_lex "$past", $P363
.annotate "line", 122
    find_lex $P364, "$past"
    find_lex $P365, "$/"
    unless_null $P365, vivify_181
    new $P365, "Hash"
  vivify_181:
    set $P366, $P365["sym"]
    unless_null $P366, vivify_182
    new $P366, "Undef"
  vivify_182:
    set $S367, $P366
    $P364."pasttype"($S367)
.annotate "line", 123
    find_lex $P368, "$/"
    find_lex $P369, "$past"
    $P370 = $P368."!make"($P369)
.annotate "line", 120
    .return ($P370)
  control_356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("33_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_375
.annotate "line", 126
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(58)
    push_eh $P374
    .lex "self", self
    .lex "$/", param_375
.annotate "line", 127
    new $P376, "Undef"
    .lex "$pasttype", $P376
.annotate "line", 128
    new $P377, "Undef"
    .lex "$past", $P377
.annotate "line", 127
    new $P378, "String"
    assign $P378, "repeat_"
    find_lex $P379, "$/"
    unless_null $P379, vivify_183
    new $P379, "Hash"
  vivify_183:
    set $P380, $P379["wu"]
    unless_null $P380, vivify_184
    new $P380, "Undef"
  vivify_184:
    set $S381, $P380
    concat $P382, $P378, $S381
    store_lex "$pasttype", $P382
    find_lex $P383, "$past"
.annotate "line", 129
    find_lex $P385, "$/"
    unless_null $P385, vivify_185
    new $P385, "Hash"
  vivify_185:
    set $P386, $P385["xblock"]
    unless_null $P386, vivify_186
    new $P386, "Undef"
  vivify_186:
    if $P386, if_384
.annotate "line", 134
    get_hll_global $P393, ["PAST"], "Op"
    find_lex $P394, "$/"
    unless_null $P394, vivify_187
    new $P394, "Hash"
  vivify_187:
    set $P395, $P394["EXPR"]
    unless_null $P395, vivify_188
    new $P395, "Undef"
  vivify_188:
    $P396 = $P395."ast"()
    find_lex $P397, "$/"
    unless_null $P397, vivify_189
    new $P397, "Hash"
  vivify_189:
    set $P398, $P397["pblock"]
    unless_null $P398, vivify_190
    new $P398, "Undef"
  vivify_190:
    $P399 = $P398."ast"()
    $P400 = "block_immediate"($P399)
    find_lex $P401, "$pasttype"
    find_lex $P402, "$/"
    $P403 = $P393."new"($P396, $P400, $P401 :named("pasttype"), $P402 :named("node"))
    store_lex "$past", $P403
.annotate "line", 133
    goto if_384_end
  if_384:
.annotate "line", 130
    find_lex $P387, "$/"
    unless_null $P387, vivify_191
    new $P387, "Hash"
  vivify_191:
    set $P388, $P387["xblock"]
    unless_null $P388, vivify_192
    new $P388, "Undef"
  vivify_192:
    $P389 = $P388."ast"()
    $P390 = "xblock_immediate"($P389)
    store_lex "$past", $P390
.annotate "line", 131
    find_lex $P391, "$past"
    find_lex $P392, "$pasttype"
    $P391."pasttype"($P392)
  if_384_end:
.annotate "line", 137
    find_lex $P404, "$/"
    find_lex $P405, "$past"
    $P406 = $P404."!make"($P405)
.annotate "line", 126
    .return ($P406)
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P407, exception, "payload"
    .return ($P407)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("34_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_411
.annotate "line", 140
    new $P410, 'ExceptionHandler'
    set_addr $P410, control_409
    $P410."handle_types"(58)
    push_eh $P410
    .lex "self", self
    .lex "$/", param_411
.annotate "line", 141
    new $P412, "Undef"
    .lex "$past", $P412
.annotate "line", 143
    new $P413, "Undef"
    .lex "$block", $P413
.annotate "line", 141
    find_lex $P414, "$/"
    unless_null $P414, vivify_193
    new $P414, "Hash"
  vivify_193:
    set $P415, $P414["xblock"]
    unless_null $P415, vivify_194
    new $P415, "Undef"
  vivify_194:
    $P416 = $P415."ast"()
    store_lex "$past", $P416
.annotate "line", 142
    find_lex $P417, "$past"
    $P417."pasttype"("for")
.annotate "line", 143
    find_lex $P418, "$past"
    unless_null $P418, vivify_195
    new $P418, "ResizablePMCArray"
  vivify_195:
    set $P419, $P418[1]
    unless_null $P419, vivify_196
    new $P419, "Undef"
  vivify_196:
    store_lex "$block", $P419
.annotate "line", 144
    find_lex $P421, "$block"
    $P422 = $P421."arity"()
    if $P422, unless_420_end
.annotate "line", 145
    find_lex $P423, "$block"
    unless_null $P423, vivify_197
    new $P423, "ResizablePMCArray"
  vivify_197:
    set $P424, $P423[0]
    unless_null $P424, vivify_198
    new $P424, "Undef"
  vivify_198:
    get_hll_global $P425, ["PAST"], "Var"
    $P426 = $P425."new"("$_" :named("name"), "parameter" :named("scope"))
    $P424."push"($P426)
.annotate "line", 146
    find_lex $P427, "$block"
    $P427."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 147
    find_lex $P428, "$block"
    $P428."arity"(1)
  unless_420_end:
.annotate "line", 149
    find_lex $P429, "$block"
    $P429."blocktype"("immediate")
.annotate "line", 150
    find_lex $P430, "$/"
    find_lex $P431, "$past"
    $P432 = $P430."!make"($P431)
.annotate "line", 140
    .return ($P432)
  control_409:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P433, exception, "payload"
    .return ($P433)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("35_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_437
.annotate "line", 153
    new $P436, 'ExceptionHandler'
    set_addr $P436, control_435
    $P436."handle_types"(58)
    push_eh $P436
    .lex "self", self
    .lex "$/", param_437
.annotate "line", 154
    find_lex $P438, "$/"
    get_hll_global $P439, ["PAST"], "Op"
    find_lex $P440, "$/"
    unless_null $P440, vivify_199
    new $P440, "Hash"
  vivify_199:
    set $P441, $P440["EXPR"]
    unless_null $P441, vivify_200
    new $P441, "Undef"
  vivify_200:
    $P442 = $P441."ast"()
    find_lex $P443, "$/"
    $P444 = $P439."new"($P442, "return" :named("pasttype"), $P443 :named("node"))
    $P445 = $P438."!make"($P444)
.annotate "line", 153
    .return ($P445)
  control_435:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P446, exception, "payload"
    .return ($P446)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<make>"  :subid("36_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_450
.annotate "line", 157
    new $P449, 'ExceptionHandler'
    set_addr $P449, control_448
    $P449."handle_types"(58)
    push_eh $P449
    .lex "self", self
    .lex "$/", param_450
.annotate "line", 158
    find_lex $P451, "$/"
    get_hll_global $P452, ["PAST"], "Op"
.annotate "line", 159
    get_hll_global $P453, ["PAST"], "Var"
    $P454 = $P453."new"("$/" :named("name"), "contextual" :named("scope"))
.annotate "line", 160
    find_lex $P455, "$/"
    unless_null $P455, vivify_201
    new $P455, "Hash"
  vivify_201:
    set $P456, $P455["EXPR"]
    unless_null $P456, vivify_202
    new $P456, "Undef"
  vivify_202:
    $P457 = $P456."ast"()
    find_lex $P458, "$/"
    $P459 = $P452."new"($P454, $P457, "callmethod" :named("pasttype"), "!make" :named("name"), $P458 :named("node"))
.annotate "line", 158
    $P460 = $P451."!make"($P459)
.annotate "line", 157
    .return ($P460)
  control_448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P461, exception, "payload"
    .return ($P461)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("37_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_465
.annotate "line", 167
    new $P464, 'ExceptionHandler'
    set_addr $P464, control_463
    $P464."handle_types"(58)
    push_eh $P464
    .lex "self", self
    .lex "$/", param_465
.annotate "line", 168
    get_global $P466, "@BLOCK"
    unless_null $P466, vivify_203
    new $P466, "ResizablePMCArray"
  vivify_203:
    set $P467, $P466[0]
    unless_null $P467, vivify_204
    new $P467, "Undef"
  vivify_204:
    $P468 = $P467."loadinit"()
    find_lex $P469, "$/"
    unless_null $P469, vivify_205
    new $P469, "Hash"
  vivify_205:
    set $P470, $P469["blorst"]
    unless_null $P470, vivify_206
    new $P470, "Undef"
  vivify_206:
    $P471 = $P470."ast"()
    $P468."push"($P471)
.annotate "line", 169
    find_lex $P472, "$/"
    get_hll_global $P473, ["PAST"], "Stmts"
    find_lex $P474, "$/"
    $P475 = $P473."new"($P474 :named("node"))
    $P476 = $P472."!make"($P475)
.annotate "line", 167
    .return ($P476)
  control_463:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P477, exception, "payload"
    .return ($P477)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("38_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_481
.annotate "line", 172
    new $P480, 'ExceptionHandler'
    set_addr $P480, control_479
    $P480."handle_types"(58)
    push_eh $P480
    .lex "self", self
    .lex "$/", param_481
.annotate "line", 173
    find_lex $P482, "$/"
.annotate "line", 174
    find_lex $P485, "$/"
    unless_null $P485, vivify_207
    new $P485, "Hash"
  vivify_207:
    set $P486, $P485["block"]
    unless_null $P486, vivify_208
    new $P486, "Undef"
  vivify_208:
    if $P486, if_484
.annotate "line", 175
    find_lex $P491, "$/"
    unless_null $P491, vivify_209
    new $P491, "Hash"
  vivify_209:
    set $P492, $P491["statement"]
    unless_null $P492, vivify_210
    new $P492, "Undef"
  vivify_210:
    $P493 = $P492."ast"()
    set $P483, $P493
.annotate "line", 174
    goto if_484_end
  if_484:
    find_lex $P487, "$/"
    unless_null $P487, vivify_211
    new $P487, "Hash"
  vivify_211:
    set $P488, $P487["block"]
    unless_null $P488, vivify_212
    new $P488, "Undef"
  vivify_212:
    $P489 = $P488."ast"()
    $P490 = "block_immediate"($P489)
    set $P483, $P490
  if_484_end:
    $P494 = $P482."!make"($P483)
.annotate "line", 172
    .return ($P494)
  control_479:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P495, exception, "payload"
    .return ($P495)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("39_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_499
.annotate "line", 180
    new $P498, 'ExceptionHandler'
    set_addr $P498, control_497
    $P498."handle_types"(58)
    push_eh $P498
    .lex "self", self
    .lex "$/", param_499
    find_lex $P500, "$/"
    find_lex $P501, "$/"
    unless_null $P501, vivify_213
    new $P501, "Hash"
  vivify_213:
    set $P502, $P501["mod_expr"]
    unless_null $P502, vivify_214
    new $P502, "Undef"
  vivify_214:
    $P503 = $P502."ast"()
    $P504 = $P500."!make"($P503)
    .return ($P504)
  control_497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P505, exception, "payload"
    .return ($P505)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("40_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_509
.annotate "line", 181
    new $P508, 'ExceptionHandler'
    set_addr $P508, control_507
    $P508."handle_types"(58)
    push_eh $P508
    .lex "self", self
    .lex "$/", param_509
    find_lex $P510, "$/"
    find_lex $P511, "$/"
    unless_null $P511, vivify_215
    new $P511, "Hash"
  vivify_215:
    set $P512, $P511["mod_expr"]
    unless_null $P512, vivify_216
    new $P512, "Undef"
  vivify_216:
    $P513 = $P512."ast"()
    $P514 = $P510."!make"($P513)
    .return ($P514)
  control_507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P515, exception, "payload"
    .return ($P515)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("41_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_519
.annotate "line", 186
    new $P518, 'ExceptionHandler'
    set_addr $P518, control_517
    $P518."handle_types"(58)
    push_eh $P518
    .lex "self", self
    .lex "$/", param_519
    find_lex $P520, "$/"
    find_lex $P521, "$/"
    unless_null $P521, vivify_217
    new $P521, "Hash"
  vivify_217:
    set $P522, $P521["colonpair"]
    unless_null $P522, vivify_218
    new $P522, "Undef"
  vivify_218:
    $P523 = $P522."ast"()
    $P524 = $P520."!make"($P523)
    .return ($P524)
  control_517:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P525, exception, "payload"
    .return ($P525)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("42_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_529
.annotate "line", 187
    new $P528, 'ExceptionHandler'
    set_addr $P528, control_527
    $P528."handle_types"(58)
    push_eh $P528
    .lex "self", self
    .lex "$/", param_529
    find_lex $P530, "$/"
    find_lex $P531, "$/"
    unless_null $P531, vivify_219
    new $P531, "Hash"
  vivify_219:
    set $P532, $P531["variable"]
    unless_null $P532, vivify_220
    new $P532, "Undef"
  vivify_220:
    $P533 = $P532."ast"()
    $P534 = $P530."!make"($P533)
    .return ($P534)
  control_527:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P535, exception, "payload"
    .return ($P535)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("43_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_539
.annotate "line", 188
    new $P538, 'ExceptionHandler'
    set_addr $P538, control_537
    $P538."handle_types"(58)
    push_eh $P538
    .lex "self", self
    .lex "$/", param_539
    find_lex $P540, "$/"
    find_lex $P541, "$/"
    unless_null $P541, vivify_221
    new $P541, "Hash"
  vivify_221:
    set $P542, $P541["package_declarator"]
    unless_null $P542, vivify_222
    new $P542, "Undef"
  vivify_222:
    $P543 = $P542."ast"()
    $P544 = $P540."!make"($P543)
    .return ($P544)
  control_537:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P545, exception, "payload"
    .return ($P545)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("44_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_549
.annotate "line", 189
    new $P548, 'ExceptionHandler'
    set_addr $P548, control_547
    $P548."handle_types"(58)
    push_eh $P548
    .lex "self", self
    .lex "$/", param_549
    find_lex $P550, "$/"
    find_lex $P551, "$/"
    unless_null $P551, vivify_223
    new $P551, "Hash"
  vivify_223:
    set $P552, $P551["scope_declarator"]
    unless_null $P552, vivify_224
    new $P552, "Undef"
  vivify_224:
    $P553 = $P552."ast"()
    $P554 = $P550."!make"($P553)
    .return ($P554)
  control_547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P555, exception, "payload"
    .return ($P555)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("45_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_559
.annotate "line", 190
    new $P558, 'ExceptionHandler'
    set_addr $P558, control_557
    $P558."handle_types"(58)
    push_eh $P558
    .lex "self", self
    .lex "$/", param_559
    find_lex $P560, "$/"
    find_lex $P561, "$/"
    unless_null $P561, vivify_225
    new $P561, "Hash"
  vivify_225:
    set $P562, $P561["routine_declarator"]
    unless_null $P562, vivify_226
    new $P562, "Undef"
  vivify_226:
    $P563 = $P562."ast"()
    $P564 = $P560."!make"($P563)
    .return ($P564)
  control_557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P565, exception, "payload"
    .return ($P565)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("46_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_569
.annotate "line", 191
    new $P568, 'ExceptionHandler'
    set_addr $P568, control_567
    $P568."handle_types"(58)
    push_eh $P568
    .lex "self", self
    .lex "$/", param_569
    find_lex $P570, "$/"
    find_lex $P571, "$/"
    unless_null $P571, vivify_227
    new $P571, "Hash"
  vivify_227:
    set $P572, $P571["regex_declarator"]
    unless_null $P572, vivify_228
    new $P572, "Undef"
  vivify_228:
    $P573 = $P572."ast"()
    $P574 = $P570."!make"($P573)
    .return ($P574)
  control_567:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P575, exception, "payload"
    .return ($P575)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("47_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_579
.annotate "line", 192
    new $P578, 'ExceptionHandler'
    set_addr $P578, control_577
    $P578."handle_types"(58)
    push_eh $P578
    .lex "self", self
    .lex "$/", param_579
    find_lex $P580, "$/"
    find_lex $P581, "$/"
    unless_null $P581, vivify_229
    new $P581, "Hash"
  vivify_229:
    set $P582, $P581["statement_prefix"]
    unless_null $P582, vivify_230
    new $P582, "Undef"
  vivify_230:
    $P583 = $P582."ast"()
    $P584 = $P580."!make"($P583)
    .return ($P584)
  control_577:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P585, exception, "payload"
    .return ($P585)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("48_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_589
.annotate "line", 193
    new $P588, 'ExceptionHandler'
    set_addr $P588, control_587
    $P588."handle_types"(58)
    push_eh $P588
    .lex "self", self
    .lex "$/", param_589
    find_lex $P590, "$/"
    find_lex $P591, "$/"
    unless_null $P591, vivify_231
    new $P591, "Hash"
  vivify_231:
    set $P592, $P591["pblock"]
    unless_null $P592, vivify_232
    new $P592, "Undef"
  vivify_232:
    $P593 = $P592."ast"()
    $P594 = $P590."!make"($P593)
    .return ($P594)
  control_587:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P595, exception, "payload"
    .return ($P595)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("49_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_599
.annotate "line", 195
    new $P598, 'ExceptionHandler'
    set_addr $P598, control_597
    $P598."handle_types"(58)
    push_eh $P598
    .lex "self", self
    .lex "$/", param_599
.annotate "line", 196
    new $P600, "Undef"
    .lex "$past", $P600
.annotate "line", 197
    find_lex $P603, "$/"
    unless_null $P603, vivify_233
    new $P603, "Hash"
  vivify_233:
    set $P604, $P603["circumfix"]
    unless_null $P604, vivify_234
    new $P604, "Undef"
  vivify_234:
    if $P604, if_602
.annotate "line", 198
    get_hll_global $P609, ["PAST"], "Val"
    find_lex $P610, "$/"
    unless_null $P610, vivify_235
    new $P610, "Hash"
  vivify_235:
    set $P611, $P610["not"]
    unless_null $P611, vivify_236
    new $P611, "Undef"
  vivify_236:
    isfalse $I612, $P611
    $P613 = $P609."new"($I612 :named("value"))
    set $P601, $P613
.annotate "line", 197
    goto if_602_end
  if_602:
    find_lex $P605, "$/"
    unless_null $P605, vivify_237
    new $P605, "Hash"
  vivify_237:
    set $P606, $P605["circumfix"]
    unless_null $P606, vivify_238
    new $P606, "ResizablePMCArray"
  vivify_238:
    set $P607, $P606[0]
    unless_null $P607, vivify_239
    new $P607, "Undef"
  vivify_239:
    $P608 = $P607."ast"()
    set $P601, $P608
  if_602_end:
    store_lex "$past", $P601
.annotate "line", 199
    find_lex $P614, "$past"
    find_lex $P615, "$/"
    unless_null $P615, vivify_240
    new $P615, "Hash"
  vivify_240:
    set $P616, $P615["identifier"]
    unless_null $P616, vivify_241
    new $P616, "Undef"
  vivify_241:
    set $S617, $P616
    $P614."named"($S617)
.annotate "line", 200
    find_lex $P618, "$/"
    find_lex $P619, "$past"
    $P620 = $P618."!make"($P619)
.annotate "line", 195
    .return ($P620)
  control_597:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P621, exception, "payload"
    .return ($P621)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("50_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_625
.annotate "line", 203
    new $P624, 'ExceptionHandler'
    set_addr $P624, control_623
    $P624."handle_types"(58)
    push_eh $P624
    .lex "self", self
    .lex "$/", param_625
.annotate "line", 204
    new $P626, "Undef"
    .lex "$past", $P626
.annotate "line", 203
    find_lex $P627, "$past"
.annotate "line", 205
    find_lex $P629, "$/"
    unless_null $P629, vivify_242
    new $P629, "Hash"
  vivify_242:
    set $P630, $P629["postcircumfix"]
    unless_null $P630, vivify_243
    new $P630, "Undef"
  vivify_243:
    if $P630, if_628
.annotate "line", 210
    get_hll_global $P637, ["PAST"], "Var"
    find_lex $P638, "$/"
    set $S639, $P638
    $P640 = $P637."new"($S639 :named("name"))
    store_lex "$past", $P640
.annotate "line", 211
    find_lex $P642, "$/"
    unless_null $P642, vivify_244
    new $P642, "Hash"
  vivify_244:
    set $P643, $P642["twigil"]
    unless_null $P643, vivify_245
    new $P643, "ResizablePMCArray"
  vivify_245:
    set $P644, $P643[0]
    unless_null $P644, vivify_246
    new $P644, "Undef"
  vivify_246:
    set $S645, $P644
    iseq $I646, $S645, "*"
    if $I646, if_641
.annotate "line", 217
    find_lex $P657, "$/"
    unless_null $P657, vivify_247
    new $P657, "Hash"
  vivify_247:
    set $P658, $P657["twigil"]
    unless_null $P658, vivify_248
    new $P658, "ResizablePMCArray"
  vivify_248:
    set $P659, $P658[0]
    unless_null $P659, vivify_249
    new $P659, "Undef"
  vivify_249:
    set $S660, $P659
    iseq $I661, $S660, "!"
    unless $I661, if_656_end
.annotate "line", 218
    find_lex $P662, "$past"
    $P662."scope"("attribute")
.annotate "line", 219
    find_lex $P663, "$past"
    find_lex $P664, "$/"
    unless_null $P664, vivify_250
    new $P664, "Hash"
  vivify_250:
    set $P665, $P664["sigil"]
    unless_null $P665, vivify_251
    new $P665, "Undef"
  vivify_251:
    $P666 = "sigiltype"($P665)
    $P663."viviself"($P666)
  if_656_end:
.annotate "line", 217
    goto if_641_end
  if_641:
.annotate "line", 212
    find_lex $P647, "$past"
    $P647."scope"("contextual")
.annotate "line", 213
    find_lex $P648, "$past"
    get_hll_global $P649, ["PAST"], "Op"
    new $P650, "String"
    assign $P650, "Contextual "
    find_lex $P651, "$/"
    set $S652, $P651
    concat $P653, $P650, $S652
    concat $P654, $P653, " not found"
    $P655 = $P649."new"($P654, "die" :named("pirop"))
    $P648."viviself"($P655)
  if_641_end:
.annotate "line", 209
    goto if_628_end
  if_628:
.annotate "line", 206
    find_lex $P631, "$/"
    unless_null $P631, vivify_252
    new $P631, "Hash"
  vivify_252:
    set $P632, $P631["postcircumfix"]
    unless_null $P632, vivify_253
    new $P632, "Undef"
  vivify_253:
    $P633 = $P632."ast"()
    store_lex "$past", $P633
.annotate "line", 207
    find_lex $P634, "$past"
    get_hll_global $P635, ["PAST"], "Var"
    $P636 = $P635."new"("$/" :named("name"))
    $P634."unshift"($P636)
  if_628_end:
.annotate "line", 222
    find_lex $P667, "$/"
    find_lex $P668, "$past"
    $P669 = $P667."!make"($P668)
.annotate "line", 203
    .return ($P669)
  control_623:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P670, exception, "payload"
    .return ($P670)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("51_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_674
.annotate "line", 225
    new $P673, 'ExceptionHandler'
    set_addr $P673, control_672
    $P673."handle_types"(58)
    push_eh $P673
    .lex "self", self
    .lex "$/", param_674
    find_lex $P675, "$/"
    find_lex $P676, "$/"
    unless_null $P676, vivify_254
    new $P676, "Hash"
  vivify_254:
    set $P677, $P676["package_def"]
    unless_null $P677, vivify_255
    new $P677, "Undef"
  vivify_255:
    $P678 = $P677."ast"()
    $P679 = $P675."!make"($P678)
    .return ($P679)
  control_672:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P680, exception, "payload"
    .return ($P680)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("52_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_684
.annotate "line", 226
    new $P683, 'ExceptionHandler'
    set_addr $P683, control_682
    $P683."handle_types"(58)
    push_eh $P683
    .lex "self", self
    .lex "$/", param_684
.annotate "line", 227
    new $P685, "Undef"
    .lex "$past", $P685
.annotate "line", 228
    new $P686, "Undef"
    .lex "$classinit", $P686
.annotate "line", 237
    new $P687, "Undef"
    .lex "$parent", $P687
.annotate "line", 227
    find_lex $P688, "$/"
    unless_null $P688, vivify_256
    new $P688, "Hash"
  vivify_256:
    set $P689, $P688["package_def"]
    unless_null $P689, vivify_257
    new $P689, "Undef"
  vivify_257:
    $P690 = $P689."ast"()
    store_lex "$past", $P690
.annotate "line", 229
    get_hll_global $P691, ["PAST"], "Op"
.annotate "line", 230
    get_hll_global $P692, ["PAST"], "Op"
    $P693 = $P692."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 233
    find_lex $P694, "$/"
    unless_null $P694, vivify_258
    new $P694, "Hash"
  vivify_258:
    set $P695, $P694["package_def"]
    unless_null $P695, vivify_259
    new $P695, "Hash"
  vivify_259:
    set $P696, $P695["name"]
    unless_null $P696, vivify_260
    new $P696, "Undef"
  vivify_260:
    set $S697, $P696
    $P698 = $P691."new"($P693, $S697, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 229
    store_lex "$classinit", $P698
.annotate "line", 237
    find_lex $P701, "$/"
    unless_null $P701, vivify_261
    new $P701, "Hash"
  vivify_261:
    set $P702, $P701["package_def"]
    unless_null $P702, vivify_262
    new $P702, "Hash"
  vivify_262:
    set $P703, $P702["parent"]
    unless_null $P703, vivify_263
    new $P703, "ResizablePMCArray"
  vivify_263:
    set $P704, $P703[0]
    unless_null $P704, vivify_264
    new $P704, "Undef"
  vivify_264:
    set $S705, $P704
    unless $S705, unless_700
    new $P699, 'String'
    set $P699, $S705
    goto unless_700_end
  unless_700:
.annotate "line", 238
    find_lex $P708, "$/"
    unless_null $P708, vivify_265
    new $P708, "Hash"
  vivify_265:
    set $P709, $P708["sym"]
    unless_null $P709, vivify_266
    new $P709, "Undef"
  vivify_266:
    set $S710, $P709
    iseq $I711, $S710, "grammar"
    if $I711, if_707
    new $P713, "String"
    assign $P713, ""
    set $P706, $P713
    goto if_707_end
  if_707:
    new $P712, "String"
    assign $P712, "Regex::Cursor"
    set $P706, $P712
  if_707_end:
    set $P699, $P706
  unless_700_end:
    store_lex "$parent", $P699
.annotate "line", 239
    find_lex $P715, "$parent"
    unless $P715, if_714_end
.annotate "line", 240
    find_lex $P716, "$classinit"
    get_hll_global $P717, ["PAST"], "Val"
    find_lex $P718, "$parent"
    $P719 = $P717."new"($P718 :named("value"), "parent" :named("named"))
    $P716."push"($P719)
  if_714_end:
.annotate "line", 242
    find_lex $P721, "$past"
    unless_null $P721, vivify_267
    new $P721, "Hash"
  vivify_267:
    set $P722, $P721["attributes"]
    unless_null $P722, vivify_268
    new $P722, "Undef"
  vivify_268:
    unless $P722, if_720_end
.annotate "line", 243
    find_lex $P723, "$classinit"
    find_lex $P724, "$past"
    unless_null $P724, vivify_269
    new $P724, "Hash"
  vivify_269:
    set $P725, $P724["attributes"]
    unless_null $P725, vivify_270
    new $P725, "Undef"
  vivify_270:
    $P723."push"($P725)
  if_720_end:
.annotate "line", 245
    get_global $P726, "@BLOCK"
    unless_null $P726, vivify_271
    new $P726, "ResizablePMCArray"
  vivify_271:
    set $P727, $P726[0]
    unless_null $P727, vivify_272
    new $P727, "Undef"
  vivify_272:
    $P728 = $P727."loadinit"()
    find_lex $P729, "$classinit"
    $P728."push"($P729)
.annotate "line", 246
    find_lex $P730, "$/"
    find_lex $P731, "$past"
    $P732 = $P730."!make"($P731)
.annotate "line", 226
    .return ($P732)
  control_682:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P733, exception, "payload"
    .return ($P733)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("53_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_737
.annotate "line", 249
    new $P736, 'ExceptionHandler'
    set_addr $P736, control_735
    $P736."handle_types"(58)
    push_eh $P736
    .lex "self", self
    .lex "$/", param_737
.annotate "line", 250
    new $P738, "Undef"
    .lex "$past", $P738
    find_lex $P741, "$/"
    unless_null $P741, vivify_273
    new $P741, "Hash"
  vivify_273:
    set $P742, $P741["block"]
    unless_null $P742, vivify_274
    new $P742, "Undef"
  vivify_274:
    if $P742, if_740
    find_lex $P746, "$/"
    unless_null $P746, vivify_275
    new $P746, "Hash"
  vivify_275:
    set $P747, $P746["comp_unit"]
    unless_null $P747, vivify_276
    new $P747, "Undef"
  vivify_276:
    $P748 = $P747."ast"()
    set $P739, $P748
    goto if_740_end
  if_740:
    find_lex $P743, "$/"
    unless_null $P743, vivify_277
    new $P743, "Hash"
  vivify_277:
    set $P744, $P743["block"]
    unless_null $P744, vivify_278
    new $P744, "Undef"
  vivify_278:
    $P745 = $P744."ast"()
    set $P739, $P745
  if_740_end:
    store_lex "$past", $P739
.annotate "line", 251
    find_lex $P749, "$past"
    find_lex $P750, "$/"
    unless_null $P750, vivify_279
    new $P750, "Hash"
  vivify_279:
    set $P751, $P750["name"]
    unless_null $P751, vivify_280
    new $P751, "Hash"
  vivify_280:
    set $P752, $P751["identifier"]
    unless_null $P752, vivify_281
    new $P752, "Undef"
  vivify_281:
    $P749."namespace"($P752)
.annotate "line", 252
    find_lex $P753, "$past"
    $P753."blocktype"("immediate")
.annotate "line", 253
    find_lex $P754, "$/"
    find_lex $P755, "$past"
    $P756 = $P754."!make"($P755)
.annotate "line", 249
    .return ($P756)
  control_735:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P757, exception, "payload"
    .return ($P757)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("54_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_761
.annotate "line", 256
    new $P760, 'ExceptionHandler'
    set_addr $P760, control_759
    $P760."handle_types"(58)
    push_eh $P760
    .lex "self", self
    .lex "$/", param_761
    find_lex $P762, "$/"
    find_lex $P763, "$/"
    unless_null $P763, vivify_282
    new $P763, "Hash"
  vivify_282:
    set $P764, $P763["scoped"]
    unless_null $P764, vivify_283
    new $P764, "Undef"
  vivify_283:
    $P765 = $P764."ast"()
    $P766 = $P762."!make"($P765)
    .return ($P766)
  control_759:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P767, exception, "payload"
    .return ($P767)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("55_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_771
.annotate "line", 257
    new $P770, 'ExceptionHandler'
    set_addr $P770, control_769
    $P770."handle_types"(58)
    push_eh $P770
    .lex "self", self
    .lex "$/", param_771
    find_lex $P772, "$/"
    find_lex $P773, "$/"
    unless_null $P773, vivify_284
    new $P773, "Hash"
  vivify_284:
    set $P774, $P773["scoped"]
    unless_null $P774, vivify_285
    new $P774, "Undef"
  vivify_285:
    $P775 = $P774."ast"()
    $P776 = $P772."!make"($P775)
    .return ($P776)
  control_769:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P777, exception, "payload"
    .return ($P777)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("56_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_781
.annotate "line", 258
    new $P780, 'ExceptionHandler'
    set_addr $P780, control_779
    $P780."handle_types"(58)
    push_eh $P780
    .lex "self", self
    .lex "$/", param_781
    find_lex $P782, "$/"
    find_lex $P783, "$/"
    unless_null $P783, vivify_286
    new $P783, "Hash"
  vivify_286:
    set $P784, $P783["scoped"]
    unless_null $P784, vivify_287
    new $P784, "Undef"
  vivify_287:
    $P785 = $P784."ast"()
    $P786 = $P782."!make"($P785)
    .return ($P786)
  control_779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P787, exception, "payload"
    .return ($P787)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("57_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_791
.annotate "line", 260
    new $P790, 'ExceptionHandler'
    set_addr $P790, control_789
    $P790."handle_types"(58)
    push_eh $P790
    .lex "self", self
    .lex "$/", param_791
.annotate "line", 261
    find_lex $P792, "$/"
.annotate "line", 262
    find_lex $P795, "$/"
    unless_null $P795, vivify_288
    new $P795, "Hash"
  vivify_288:
    set $P796, $P795["routine_declarator"]
    unless_null $P796, vivify_289
    new $P796, "Undef"
  vivify_289:
    if $P796, if_794
.annotate "line", 263
    find_lex $P800, "$/"
    unless_null $P800, vivify_290
    new $P800, "Hash"
  vivify_290:
    set $P801, $P800["variable_declarator"]
    unless_null $P801, vivify_291
    new $P801, "Undef"
  vivify_291:
    $P802 = $P801."ast"()
    set $P793, $P802
.annotate "line", 262
    goto if_794_end
  if_794:
    find_lex $P797, "$/"
    unless_null $P797, vivify_292
    new $P797, "Hash"
  vivify_292:
    set $P798, $P797["routine_declarator"]
    unless_null $P798, vivify_293
    new $P798, "Undef"
  vivify_293:
    $P799 = $P798."ast"()
    set $P793, $P799
  if_794_end:
    $P803 = $P792."!make"($P793)
.annotate "line", 260
    .return ($P803)
  control_789:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P804, exception, "payload"
    .return ($P804)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("58_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_808
.annotate "line", 266
    .const 'Sub' $P848 = "59_1258129019.06598" 
    capture_lex $P848
    new $P807, 'ExceptionHandler'
    set_addr $P807, control_806
    $P807."handle_types"(58)
    push_eh $P807
    .lex "self", self
    .lex "$/", param_808
.annotate "line", 267
    new $P809, "Undef"
    .lex "$past", $P809
.annotate "line", 268
    new $P810, "Undef"
    .lex "$sigil", $P810
.annotate "line", 269
    new $P811, "Undef"
    .lex "$name", $P811
.annotate "line", 270
    new $P812, "Undef"
    .lex "$BLOCK", $P812
.annotate "line", 267
    find_lex $P813, "$/"
    unless_null $P813, vivify_294
    new $P813, "Hash"
  vivify_294:
    set $P814, $P813["variable"]
    unless_null $P814, vivify_295
    new $P814, "Undef"
  vivify_295:
    $P815 = $P814."ast"()
    store_lex "$past", $P815
.annotate "line", 268
    find_lex $P816, "$/"
    unless_null $P816, vivify_296
    new $P816, "Hash"
  vivify_296:
    set $P817, $P816["variable"]
    unless_null $P817, vivify_297
    new $P817, "Hash"
  vivify_297:
    set $P818, $P817["sigil"]
    unless_null $P818, vivify_298
    new $P818, "Undef"
  vivify_298:
    store_lex "$sigil", $P818
.annotate "line", 269
    find_lex $P819, "$past"
    $P820 = $P819."name"()
    store_lex "$name", $P820
.annotate "line", 270
    get_global $P821, "@BLOCK"
    unless_null $P821, vivify_299
    new $P821, "ResizablePMCArray"
  vivify_299:
    set $P822, $P821[0]
    unless_null $P822, vivify_300
    new $P822, "Undef"
  vivify_300:
    store_lex "$BLOCK", $P822
.annotate "line", 271
    find_lex $P824, "$BLOCK"
    find_lex $P825, "$name"
    $P826 = $P824."symbol"($P825)
    unless $P826, if_823_end
.annotate "line", 272
    find_lex $P827, "$/"
    $P828 = $P827."CURSOR"()
    find_lex $P829, "$name"
    $P828."panic"("Redeclaration of symbol ", $P829)
  if_823_end:
.annotate "line", 274
    find_dynamic_lex $P831, "$*SCOPE"
    unless_null $P831, vivify_301
    die "Contextual $*SCOPE not found"
  vivify_301:
    set $S832, $P831
    iseq $I833, $S832, "has"
    if $I833, if_830
.annotate "line", 283
    .const 'Sub' $P848 = "59_1258129019.06598" 
    capture_lex $P848
    $P848()
    goto if_830_end
  if_830:
.annotate "line", 275
    find_lex $P834, "$BLOCK"
    find_lex $P835, "$name"
    $P834."symbol"($P835, "attribute" :named("scope"))
.annotate "line", 276
    find_lex $P837, "$BLOCK"
    unless_null $P837, vivify_305
    new $P837, "Hash"
  vivify_305:
    set $P838, $P837["attributes"]
    unless_null $P838, vivify_306
    new $P838, "Undef"
  vivify_306:
    if $P838, unless_836_end
.annotate "line", 278
    get_hll_global $P839, ["PAST"], "Op"
    $P840 = $P839."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P841, "$BLOCK"
    unless_null $P841, vivify_307
    new $P841, "Hash"
    store_lex "$BLOCK", $P841
  vivify_307:
    set $P841["attributes"], $P840
  unless_836_end:
.annotate "line", 280
    find_lex $P842, "$BLOCK"
    unless_null $P842, vivify_308
    new $P842, "Hash"
  vivify_308:
    set $P843, $P842["attributes"]
    unless_null $P843, vivify_309
    new $P843, "Undef"
  vivify_309:
    find_lex $P844, "$name"
    $P843."push"($P844)
.annotate "line", 281
    get_hll_global $P845, ["PAST"], "Stmts"
    $P846 = $P845."new"()
    store_lex "$past", $P846
  if_830_end:
.annotate "line", 291
    find_lex $P872, "$/"
    find_lex $P873, "$past"
    $P874 = $P872."!make"($P873)
.annotate "line", 266
    .return ($P874)
  control_806:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P875, exception, "payload"
    .return ($P875)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block847"  :anon :subid("59_1258129019.06598") :outer("58_1258129019.06598")
.annotate "line", 284
    new $P849, "Undef"
    .lex "$scope", $P849
.annotate "line", 285
    new $P850, "Undef"
    .lex "$decl", $P850
.annotate "line", 284
    find_dynamic_lex $P853, "$*SCOPE"
    unless_null $P853, vivify_302
    die "Contextual $*SCOPE not found"
  vivify_302:
    set $S854, $P853
    iseq $I855, $S854, "our"
    if $I855, if_852
    new $P857, "String"
    assign $P857, "lexical"
    set $P851, $P857
    goto if_852_end
  if_852:
    new $P856, "String"
    assign $P856, "package"
    set $P851, $P856
  if_852_end:
    store_lex "$scope", $P851
.annotate "line", 285
    get_hll_global $P858, ["PAST"], "Var"
    find_lex $P859, "$name"
    find_lex $P860, "$scope"
.annotate "line", 286
    find_lex $P861, "$sigil"
    $P862 = "sigiltype"($P861)
    find_lex $P863, "$/"
    $P864 = $P858."new"($P859 :named("name"), $P860 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P862 :named("viviself"), $P863 :named("node"))
.annotate "line", 285
    store_lex "$decl", $P864
.annotate "line", 288
    find_lex $P865, "$BLOCK"
    find_lex $P866, "$name"
    find_lex $P867, "$scope"
    $P865."symbol"($P866, $P867 :named("scope"))
.annotate "line", 289
    find_lex $P868, "$BLOCK"
    unless_null $P868, vivify_303
    new $P868, "ResizablePMCArray"
  vivify_303:
    set $P869, $P868[0]
    unless_null $P869, vivify_304
    new $P869, "Undef"
  vivify_304:
    find_lex $P870, "$decl"
    $P871 = $P869."push"($P870)
.annotate "line", 283
    .return ($P871)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("60_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_879
.annotate "line", 294
    new $P878, 'ExceptionHandler'
    set_addr $P878, control_877
    $P878."handle_types"(58)
    push_eh $P878
    .lex "self", self
    .lex "$/", param_879
    find_lex $P880, "$/"
    find_lex $P881, "$/"
    unless_null $P881, vivify_310
    new $P881, "Hash"
  vivify_310:
    set $P882, $P881["routine_def"]
    unless_null $P882, vivify_311
    new $P882, "Undef"
  vivify_311:
    $P883 = $P882."ast"()
    $P884 = $P880."!make"($P883)
    .return ($P884)
  control_877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P885, exception, "payload"
    .return ($P885)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("61_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_889
.annotate "line", 295
    new $P888, 'ExceptionHandler'
    set_addr $P888, control_887
    $P888."handle_types"(58)
    push_eh $P888
    .lex "self", self
    .lex "$/", param_889
    find_lex $P890, "$/"
    find_lex $P891, "$/"
    unless_null $P891, vivify_312
    new $P891, "Hash"
  vivify_312:
    set $P892, $P891["method_def"]
    unless_null $P892, vivify_313
    new $P892, "Undef"
  vivify_313:
    $P893 = $P892."ast"()
    $P894 = $P890."!make"($P893)
    .return ($P894)
  control_887:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P895, exception, "payload"
    .return ($P895)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("62_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_899
.annotate "line", 297
    .const 'Sub' $P910 = "63_1258129019.06598" 
    capture_lex $P910
    new $P898, 'ExceptionHandler'
    set_addr $P898, control_897
    $P898."handle_types"(58)
    push_eh $P898
    .lex "self", self
    .lex "$/", param_899
.annotate "line", 298
    new $P900, "Undef"
    .lex "$past", $P900
    find_lex $P901, "$/"
    unless_null $P901, vivify_314
    new $P901, "Hash"
  vivify_314:
    set $P902, $P901["blockoid"]
    unless_null $P902, vivify_315
    new $P902, "Undef"
  vivify_315:
    $P903 = $P902."ast"()
    store_lex "$past", $P903
.annotate "line", 299
    find_lex $P904, "$past"
    $P904."blocktype"("declaration")
.annotate "line", 300
    find_lex $P905, "$past"
    $P905."control"("return_pir")
.annotate "line", 301
    find_lex $P907, "$/"
    unless_null $P907, vivify_316
    new $P907, "Hash"
  vivify_316:
    set $P908, $P907["deflongname"]
    unless_null $P908, vivify_317
    new $P908, "Undef"
  vivify_317:
    unless $P908, if_906_end
    .const 'Sub' $P910 = "63_1258129019.06598" 
    capture_lex $P910
    $P910()
  if_906_end:
.annotate "line", 311
    find_lex $P938, "$/"
    find_lex $P939, "$past"
    $P940 = $P938."!make"($P939)
.annotate "line", 297
    .return ($P940)
  control_897:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P941, exception, "payload"
    .return ($P941)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block909"  :anon :subid("63_1258129019.06598") :outer("62_1258129019.06598")
.annotate "line", 302
    new $P911, "Undef"
    .lex "$name", $P911
    find_lex $P912, "$/"
    unless_null $P912, vivify_318
    new $P912, "Hash"
  vivify_318:
    set $P913, $P912["deflongname"]
    unless_null $P913, vivify_319
    new $P913, "ResizablePMCArray"
  vivify_319:
    set $P914, $P913[0]
    unless_null $P914, vivify_320
    new $P914, "Undef"
  vivify_320:
    $P915 = $P914."ast"()
    set $S916, $P915
    new $P917, 'String'
    set $P917, $S916
    store_lex "$name", $P917
.annotate "line", 303
    find_lex $P918, "$past"
    find_lex $P919, "$name"
    $P918."name"($P919)
.annotate "line", 304
    find_dynamic_lex $P922, "$*SCOPE"
    unless_null $P922, vivify_321
    die "Contextual $*SCOPE not found"
  vivify_321:
    set $S923, $P922
    isne $I924, $S923, "our"
    if $I924, if_921
    new $P920, 'Integer'
    set $P920, $I924
    goto if_921_end
  if_921:
.annotate "line", 305
    get_global $P925, "@BLOCK"
    unless_null $P925, vivify_322
    new $P925, "ResizablePMCArray"
  vivify_322:
    set $P926, $P925[0]
    unless_null $P926, vivify_323
    new $P926, "ResizablePMCArray"
  vivify_323:
    set $P927, $P926[0]
    unless_null $P927, vivify_324
    new $P927, "Undef"
  vivify_324:
    get_hll_global $P928, ["PAST"], "Var"
    find_lex $P929, "$name"
    find_lex $P930, "$past"
    $P931 = $P928."new"($P929 :named("name"), 1 :named("isdecl"), $P930 :named("viviself"), "lexical" :named("scope"))
    $P927."push"($P931)
.annotate "line", 307
    get_global $P932, "@BLOCK"
    unless_null $P932, vivify_325
    new $P932, "ResizablePMCArray"
  vivify_325:
    set $P933, $P932[0]
    unless_null $P933, vivify_326
    new $P933, "Undef"
  vivify_326:
    find_lex $P934, "$name"
    $P933."symbol"($P934, "lexical" :named("scope"))
.annotate "line", 308
    get_hll_global $P935, ["PAST"], "Var"
    find_lex $P936, "$name"
    $P937 = $P935."new"($P936 :named("name"))
    store_lex "$past", $P937
.annotate "line", 304
    set $P920, $P937
  if_921_end:
.annotate "line", 301
    .return ($P920)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("64_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_945
.annotate "line", 315
    .const 'Sub' $P961 = "65_1258129019.06598" 
    capture_lex $P961
    new $P944, 'ExceptionHandler'
    set_addr $P944, control_943
    $P944."handle_types"(58)
    push_eh $P944
    .lex "self", self
    .lex "$/", param_945
.annotate "line", 316
    new $P946, "Undef"
    .lex "$past", $P946
    find_lex $P947, "$/"
    unless_null $P947, vivify_327
    new $P947, "Hash"
  vivify_327:
    set $P948, $P947["blockoid"]
    unless_null $P948, vivify_328
    new $P948, "Undef"
  vivify_328:
    $P949 = $P948."ast"()
    store_lex "$past", $P949
.annotate "line", 317
    find_lex $P950, "$past"
    $P950."blocktype"("method")
.annotate "line", 318
    find_lex $P951, "$past"
    $P951."control"("return_pir")
.annotate "line", 319
    find_lex $P952, "$past"
    unless_null $P952, vivify_329
    new $P952, "ResizablePMCArray"
  vivify_329:
    set $P953, $P952[0]
    unless_null $P953, vivify_330
    new $P953, "Undef"
  vivify_330:
    get_hll_global $P954, ["PAST"], "Op"
    $P955 = $P954."new"("    .lex \"self\", self" :named("inline"))
    $P953."unshift"($P955)
.annotate "line", 320
    find_lex $P956, "$past"
    $P956."symbol"("self", "lexical" :named("scope"))
.annotate "line", 321
    find_lex $P958, "$/"
    unless_null $P958, vivify_331
    new $P958, "Hash"
  vivify_331:
    set $P959, $P958["deflongname"]
    unless_null $P959, vivify_332
    new $P959, "Undef"
  vivify_332:
    unless $P959, if_957_end
    .const 'Sub' $P961 = "65_1258129019.06598" 
    capture_lex $P961
    $P961()
  if_957_end:
.annotate "line", 325
    find_lex $P972, "$/"
    find_lex $P973, "$past"
    $P974 = $P972."!make"($P973)
.annotate "line", 315
    .return ($P974)
  control_943:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P975, exception, "payload"
    .return ($P975)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block960"  :anon :subid("65_1258129019.06598") :outer("64_1258129019.06598")
.annotate "line", 322
    new $P962, "Undef"
    .lex "$name", $P962
    find_lex $P963, "$/"
    unless_null $P963, vivify_333
    new $P963, "Hash"
  vivify_333:
    set $P964, $P963["deflongname"]
    unless_null $P964, vivify_334
    new $P964, "ResizablePMCArray"
  vivify_334:
    set $P965, $P964[0]
    unless_null $P965, vivify_335
    new $P965, "Undef"
  vivify_335:
    $P966 = $P965."ast"()
    set $S967, $P966
    new $P968, 'String'
    set $P968, $S967
    store_lex "$name", $P968
.annotate "line", 323
    find_lex $P969, "$past"
    find_lex $P970, "$name"
    $P971 = $P969."name"($P970)
.annotate "line", 321
    .return ($P971)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("66_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_979
.annotate "line", 329
    .const 'Sub' $P990 = "67_1258129019.06598" 
    capture_lex $P990
    new $P978, 'ExceptionHandler'
    set_addr $P978, control_977
    $P978."handle_types"(58)
    push_eh $P978
    .lex "self", self
    .lex "$/", param_979
.annotate "line", 330
    new $P980, "Undef"
    .lex "$BLOCKINIT", $P980
    get_global $P981, "@BLOCK"
    unless_null $P981, vivify_336
    new $P981, "ResizablePMCArray"
  vivify_336:
    set $P982, $P981[0]
    unless_null $P982, vivify_337
    new $P982, "ResizablePMCArray"
  vivify_337:
    set $P983, $P982[0]
    unless_null $P983, vivify_338
    new $P983, "Undef"
  vivify_338:
    store_lex "$BLOCKINIT", $P983
.annotate "line", 331
    find_lex $P985, "$/"
    unless_null $P985, vivify_339
    new $P985, "Hash"
  vivify_339:
    set $P986, $P985["parameter"]
    unless_null $P986, vivify_340
    new $P986, "Undef"
  vivify_340:
    defined $I987, $P986
    unless $I987, for_undef_341
    iter $P984, $P986
    new $P997, 'ExceptionHandler'
    set_addr $P997, loop996_handler
    $P997."handle_types"(65, 67, 66)
    push_eh $P997
  loop996_test:
    unless $P984, loop996_done
    shift $P988, $P984
  loop996_redo:
    .const 'Sub' $P990 = "67_1258129019.06598" 
    capture_lex $P990
    $P990($P988)
  loop996_next:
    goto loop996_test
  loop996_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P998, exception, 'type'
    eq $P998, 65, loop996_next
    eq $P998, 67, loop996_redo
  loop996_done:
    pop_eh 
  for_undef_341:
.annotate "line", 329
    .return ($P984)
  control_977:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P999, exception, "payload"
    .return ($P999)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block989"  :anon :subid("67_1258129019.06598") :outer("66_1258129019.06598")
    .param pmc param_991
.annotate "line", 331
    .lex "$_", param_991
    find_lex $P992, "$BLOCKINIT"
    find_lex $P993, "$_"
    $P994 = $P993."ast"()
    $P995 = $P992."push"($P994)
    .return ($P995)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("68_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1003
.annotate "line", 334
    new $P1002, 'ExceptionHandler'
    set_addr $P1002, control_1001
    $P1002."handle_types"(58)
    push_eh $P1002
    .lex "self", self
    .lex "$/", param_1003
.annotate "line", 335
    new $P1004, "Undef"
    .lex "$quant", $P1004
.annotate "line", 336
    new $P1005, "Undef"
    .lex "$past", $P1005
.annotate "line", 335
    find_lex $P1006, "$/"
    unless_null $P1006, vivify_342
    new $P1006, "Hash"
  vivify_342:
    set $P1007, $P1006["quant"]
    unless_null $P1007, vivify_343
    new $P1007, "Undef"
  vivify_343:
    store_lex "$quant", $P1007
    find_lex $P1008, "$past"
.annotate "line", 337
    find_lex $P1010, "$/"
    unless_null $P1010, vivify_344
    new $P1010, "Hash"
  vivify_344:
    set $P1011, $P1010["named_param"]
    unless_null $P1011, vivify_345
    new $P1011, "Undef"
  vivify_345:
    if $P1011, if_1009
.annotate "line", 344
    find_lex $P1025, "$/"
    unless_null $P1025, vivify_346
    new $P1025, "Hash"
  vivify_346:
    set $P1026, $P1025["param_var"]
    unless_null $P1026, vivify_347
    new $P1026, "Undef"
  vivify_347:
    $P1027 = $P1026."ast"()
    store_lex "$past", $P1027
.annotate "line", 345
    find_lex $P1029, "$quant"
    set $S1030, $P1029
    iseq $I1031, $S1030, "*"
    if $I1031, if_1028
.annotate "line", 349
    find_lex $P1040, "$quant"
    set $S1041, $P1040
    iseq $I1042, $S1041, "?"
    unless $I1042, if_1039_end
.annotate "line", 350
    find_lex $P1043, "$past"
    find_lex $P1044, "$/"
    unless_null $P1044, vivify_348
    new $P1044, "Hash"
  vivify_348:
    set $P1045, $P1044["param_var"]
    unless_null $P1045, vivify_349
    new $P1045, "Hash"
  vivify_349:
    set $P1046, $P1045["sigil"]
    unless_null $P1046, vivify_350
    new $P1046, "Undef"
  vivify_350:
    $P1047 = "sigiltype"($P1046)
    $P1043."viviself"($P1047)
  if_1039_end:
.annotate "line", 349
    goto if_1028_end
  if_1028:
.annotate "line", 346
    find_lex $P1032, "$past"
    $P1032."slurpy"(1)
.annotate "line", 347
    find_lex $P1033, "$past"
    find_lex $P1034, "$/"
    unless_null $P1034, vivify_351
    new $P1034, "Hash"
  vivify_351:
    set $P1035, $P1034["param_var"]
    unless_null $P1035, vivify_352
    new $P1035, "Hash"
  vivify_352:
    set $P1036, $P1035["sigil"]
    unless_null $P1036, vivify_353
    new $P1036, "Undef"
  vivify_353:
    set $S1037, $P1036
    iseq $I1038, $S1037, "%"
    $P1033."named"($I1038)
  if_1028_end:
.annotate "line", 343
    goto if_1009_end
  if_1009:
.annotate "line", 338
    find_lex $P1012, "$/"
    unless_null $P1012, vivify_354
    new $P1012, "Hash"
  vivify_354:
    set $P1013, $P1012["named_param"]
    unless_null $P1013, vivify_355
    new $P1013, "Undef"
  vivify_355:
    $P1014 = $P1013."ast"()
    store_lex "$past", $P1014
.annotate "line", 339
    find_lex $P1016, "$quant"
    set $S1017, $P1016
    isne $I1018, $S1017, "!"
    unless $I1018, if_1015_end
.annotate "line", 340
    find_lex $P1019, "$past"
    find_lex $P1020, "$/"
    unless_null $P1020, vivify_356
    new $P1020, "Hash"
  vivify_356:
    set $P1021, $P1020["named_param"]
    unless_null $P1021, vivify_357
    new $P1021, "Hash"
  vivify_357:
    set $P1022, $P1021["param_var"]
    unless_null $P1022, vivify_358
    new $P1022, "Hash"
  vivify_358:
    set $P1023, $P1022["sigil"]
    unless_null $P1023, vivify_359
    new $P1023, "Undef"
  vivify_359:
    $P1024 = "sigiltype"($P1023)
    $P1019."viviself"($P1024)
  if_1015_end:
  if_1009_end:
.annotate "line", 353
    find_lex $P1049, "$/"
    unless_null $P1049, vivify_360
    new $P1049, "Hash"
  vivify_360:
    set $P1050, $P1049["default_value"]
    unless_null $P1050, vivify_361
    new $P1050, "Undef"
  vivify_361:
    unless $P1050, if_1048_end
.annotate "line", 354
    find_lex $P1052, "$quant"
    set $S1053, $P1052
    iseq $I1054, $S1053, "*"
    unless $I1054, if_1051_end
.annotate "line", 355
    find_lex $P1055, "$/"
    $P1056 = $P1055."CURSOR"()
    $P1056."panic"("Can't put default on slurpy parameter")
  if_1051_end:
.annotate "line", 357
    find_lex $P1058, "$quant"
    set $S1059, $P1058
    iseq $I1060, $S1059, "!"
    unless $I1060, if_1057_end
.annotate "line", 358
    find_lex $P1061, "$/"
    $P1062 = $P1061."CURSOR"()
    $P1062."panic"("Can't put default on required parameter")
  if_1057_end:
.annotate "line", 360
    find_lex $P1063, "$past"
    find_lex $P1064, "$/"
    unless_null $P1064, vivify_362
    new $P1064, "Hash"
  vivify_362:
    set $P1065, $P1064["default_value"]
    unless_null $P1065, vivify_363
    new $P1065, "ResizablePMCArray"
  vivify_363:
    set $P1066, $P1065[0]
    unless_null $P1066, vivify_364
    new $P1066, "Hash"
  vivify_364:
    set $P1067, $P1066["EXPR"]
    unless_null $P1067, vivify_365
    new $P1067, "Undef"
  vivify_365:
    $P1068 = $P1067."ast"()
    $P1063."viviself"($P1068)
  if_1048_end:
.annotate "line", 362
    find_lex $P1070, "$past"
    $P1071 = $P1070."viviself"()
    if $P1071, unless_1069_end
    get_global $P1072, "@BLOCK"
    unless_null $P1072, vivify_366
    new $P1072, "ResizablePMCArray"
  vivify_366:
    set $P1073, $P1072[0]
    unless_null $P1073, vivify_367
    new $P1073, "Undef"
  vivify_367:
    get_global $P1074, "@BLOCK"
    unless_null $P1074, vivify_368
    new $P1074, "ResizablePMCArray"
  vivify_368:
    set $P1075, $P1074[0]
    unless_null $P1075, vivify_369
    new $P1075, "Undef"
  vivify_369:
    $P1076 = $P1075."arity"()
    set $N1077, $P1076
    new $P1078, 'Float'
    set $P1078, $N1077
    add $P1079, $P1078, 1
    $P1073."arity"($P1079)
  unless_1069_end:
.annotate "line", 363
    find_lex $P1080, "$/"
    find_lex $P1081, "$past"
    $P1082 = $P1080."!make"($P1081)
.annotate "line", 334
    .return ($P1082)
  control_1001:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1083, exception, "payload"
    .return ($P1083)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("69_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1087
.annotate "line", 366
    new $P1086, 'ExceptionHandler'
    set_addr $P1086, control_1085
    $P1086."handle_types"(58)
    push_eh $P1086
    .lex "self", self
    .lex "$/", param_1087
.annotate "line", 367
    new $P1088, "Undef"
    .lex "$name", $P1088
.annotate "line", 368
    new $P1089, "Undef"
    .lex "$past", $P1089
.annotate "line", 367
    find_lex $P1090, "$/"
    set $S1091, $P1090
    new $P1092, 'String'
    set $P1092, $S1091
    store_lex "$name", $P1092
.annotate "line", 368
    get_hll_global $P1093, ["PAST"], "Var"
    find_lex $P1094, "$name"
    find_lex $P1095, "$/"
    $P1096 = $P1093."new"($P1094 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1095 :named("node"))
    store_lex "$past", $P1096
.annotate "line", 370
    get_global $P1097, "@BLOCK"
    unless_null $P1097, vivify_370
    new $P1097, "ResizablePMCArray"
  vivify_370:
    set $P1098, $P1097[0]
    unless_null $P1098, vivify_371
    new $P1098, "Undef"
  vivify_371:
    find_lex $P1099, "$name"
    $P1098."symbol"($P1099, "lexical" :named("scope"))
.annotate "line", 371
    find_lex $P1100, "$/"
    find_lex $P1101, "$past"
    $P1102 = $P1100."!make"($P1101)
.annotate "line", 366
    .return ($P1102)
  control_1085:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1103, exception, "payload"
    .return ($P1103)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("70_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1107
.annotate "line", 374
    new $P1106, 'ExceptionHandler'
    set_addr $P1106, control_1105
    $P1106."handle_types"(58)
    push_eh $P1106
    .lex "self", self
    .lex "$/", param_1107
.annotate "line", 375
    new $P1108, "Undef"
    .lex "$past", $P1108
    find_lex $P1109, "$/"
    unless_null $P1109, vivify_372
    new $P1109, "Hash"
  vivify_372:
    set $P1110, $P1109["param_var"]
    unless_null $P1110, vivify_373
    new $P1110, "Undef"
  vivify_373:
    $P1111 = $P1110."ast"()
    store_lex "$past", $P1111
.annotate "line", 376
    find_lex $P1112, "$past"
    find_lex $P1113, "$/"
    unless_null $P1113, vivify_374
    new $P1113, "Hash"
  vivify_374:
    set $P1114, $P1113["param_var"]
    unless_null $P1114, vivify_375
    new $P1114, "Hash"
  vivify_375:
    set $P1115, $P1114["name"]
    unless_null $P1115, vivify_376
    new $P1115, "Undef"
  vivify_376:
    set $S1116, $P1115
    $P1112."named"($S1116)
.annotate "line", 377
    find_lex $P1117, "$/"
    find_lex $P1118, "$past"
    $P1119 = $P1117."!make"($P1118)
.annotate "line", 374
    .return ($P1119)
  control_1105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1120, exception, "payload"
    .return ($P1120)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("71_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1124
    .param pmc param_1125 :optional
    .param int has_param_1125 :opt_flag
.annotate "line", 380
    .const 'Sub' $P1195 = "73_1258129019.06598" 
    capture_lex $P1195
    .const 'Sub' $P1142 = "72_1258129019.06598" 
    capture_lex $P1142
    new $P1123, 'ExceptionHandler'
    set_addr $P1123, control_1122
    $P1123."handle_types"(58)
    push_eh $P1123
    .lex "self", self
    .lex "$/", param_1124
    if has_param_1125, optparam_377
    new $P1126, "Undef"
    set param_1125, $P1126
  optparam_377:
    .lex "$key", param_1125
.annotate "line", 381
    new $P1127, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1127
.annotate "line", 384
    new $P1128, "Undef"
    .lex "$name", $P1128
.annotate "line", 385
    new $P1129, "Undef"
    .lex "$past", $P1129
.annotate "line", 381

        $P1130 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1130
.annotate "line", 384
    find_lex $P1131, "$/"
    unless_null $P1131, vivify_378
    new $P1131, "Hash"
  vivify_378:
    set $P1132, $P1131["deflongname"]
    unless_null $P1132, vivify_379
    new $P1132, "Undef"
  vivify_379:
    $P1133 = $P1132."ast"()
    set $S1134, $P1133
    new $P1135, 'String'
    set $P1135, $S1134
    store_lex "$name", $P1135
    find_lex $P1136, "$past"
.annotate "line", 386
    find_lex $P1138, "$key"
    set $S1139, $P1138
    iseq $I1140, $S1139, "open"
    if $I1140, if_1137
.annotate "line", 399
    find_lex $P1170, "$/"
    unless_null $P1170, vivify_380
    new $P1170, "Hash"
  vivify_380:
    set $P1171, $P1170["proto"]
    unless_null $P1171, vivify_381
    new $P1171, "Undef"
  vivify_381:
    if $P1171, if_1169
.annotate "line", 426
    .const 'Sub' $P1195 = "73_1258129019.06598" 
    capture_lex $P1195
    $P1195()
    goto if_1169_end
  if_1169:
.annotate "line", 401
    get_hll_global $P1172, ["PAST"], "Stmts"
.annotate "line", 402
    get_hll_global $P1173, ["PAST"], "Block"
    find_lex $P1174, "$name"
.annotate "line", 403
    get_hll_global $P1175, ["PAST"], "Op"
.annotate "line", 404
    get_hll_global $P1176, ["PAST"], "Var"
    $P1177 = $P1176."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1178, "$name"
    $P1179 = $P1175."new"($P1177, $P1178, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 403
    find_lex $P1180, "$/"
    $P1181 = $P1173."new"($P1179, $P1174 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1180 :named("node"))
.annotate "line", 413
    get_hll_global $P1182, ["PAST"], "Block"
    new $P1183, "String"
    assign $P1183, "!PREFIX__"
    find_lex $P1184, "$name"
    concat $P1185, $P1183, $P1184
.annotate "line", 414
    get_hll_global $P1186, ["PAST"], "Op"
.annotate "line", 415
    get_hll_global $P1187, ["PAST"], "Var"
    $P1188 = $P1187."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1189, "$name"
    $P1190 = $P1186."new"($P1188, $P1189, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 414
    find_lex $P1191, "$/"
    $P1192 = $P1182."new"($P1190, $P1185 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1191 :named("node"))
.annotate "line", 413
    $P1193 = $P1172."new"($P1181, $P1192)
.annotate "line", 401
    store_lex "$past", $P1193
  if_1169_end:
.annotate "line", 399
    goto if_1137_end
  if_1137:
.annotate "line", 386
    .const 'Sub' $P1142 = "72_1258129019.06598" 
    capture_lex $P1142
    $P1142()
  if_1137_end:
.annotate "line", 442
    find_lex $P1221, "$/"
    find_lex $P1222, "$past"
    $P1223 = $P1221."!make"($P1222)
.annotate "line", 380
    .return ($P1223)
  control_1122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1224, exception, "payload"
    .return ($P1224)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1194"  :anon :subid("73_1258129019.06598") :outer("71_1258129019.06598")
.annotate "line", 427
    new $P1196, "Undef"
    .lex "$rpast", $P1196
.annotate "line", 428
    new $P1197, "Hash"
    .lex "%capnames", $P1197
.annotate "line", 427
    find_lex $P1198, "$/"
    unless_null $P1198, vivify_382
    new $P1198, "Hash"
  vivify_382:
    set $P1199, $P1198["p6regex"]
    unless_null $P1199, vivify_383
    new $P1199, "Undef"
  vivify_383:
    $P1200 = $P1199."ast"()
    store_lex "$rpast", $P1200
.annotate "line", 428
    get_hll_global $P1201, ["Regex";"P6Regex";"Actions"], "capnames"
    find_lex $P1202, "$rpast"
    $P1203 = $P1201($P1202, 0)
    store_lex "%capnames", $P1203
.annotate "line", 429
    new $P1204, "Integer"
    assign $P1204, 0
    find_lex $P1205, "%capnames"
    unless_null $P1205, vivify_384
    new $P1205, "Hash"
    store_lex "%capnames", $P1205
  vivify_384:
    set $P1205[""], $P1204
.annotate "line", 430
    get_hll_global $P1206, ["PAST"], "Regex"
    find_lex $P1207, "$rpast"
.annotate "line", 432
    get_hll_global $P1208, ["PAST"], "Regex"
    $P1209 = $P1208."new"("pass" :named("pasttype"))
    find_lex $P1210, "%capnames"
    $P1211 = $P1206."new"($P1207, $P1209, "concat" :named("pasttype"), $P1210 :named("capnames"))
.annotate "line", 430
    store_lex "$rpast", $P1211
.annotate "line", 436
    get_global $P1212, "@BLOCK"
    $P1213 = $P1212."shift"()
    store_lex "$past", $P1213
.annotate "line", 437
    find_lex $P1214, "$past"
    $P1214."blocktype"("method")
.annotate "line", 438
    find_lex $P1215, "$past"
    find_lex $P1216, "$name"
    $P1215."name"($P1216)
.annotate "line", 439
    find_lex $P1217, "$past"
    find_lex $P1218, "$rpast"
    $P1217."push"($P1218)
.annotate "line", 440
    find_lex $P1219, "@MODIFIERS"
    $P1220 = $P1219."shift"()
.annotate "line", 426
    .return ($P1220)
.end


.namespace ["NQP";"Actions"]
.sub "_block1141"  :anon :subid("72_1258129019.06598") :outer("71_1258129019.06598")
.annotate "line", 387
    new $P1143, "Hash"
    .lex "%h", $P1143
.annotate "line", 386
    find_lex $P1144, "%h"
.annotate "line", 388
    find_lex $P1146, "$/"
    unless_null $P1146, vivify_385
    new $P1146, "Hash"
  vivify_385:
    set $P1147, $P1146["sym"]
    unless_null $P1147, vivify_386
    new $P1147, "Undef"
  vivify_386:
    set $S1148, $P1147
    iseq $I1149, $S1148, "token"
    unless $I1149, if_1145_end
    new $P1150, "Integer"
    assign $P1150, 1
    find_lex $P1151, "%h"
    unless_null $P1151, vivify_387
    new $P1151, "Hash"
    store_lex "%h", $P1151
  vivify_387:
    set $P1151["r"], $P1150
  if_1145_end:
.annotate "line", 389
    find_lex $P1153, "$/"
    unless_null $P1153, vivify_388
    new $P1153, "Hash"
  vivify_388:
    set $P1154, $P1153["sym"]
    unless_null $P1154, vivify_389
    new $P1154, "Undef"
  vivify_389:
    set $S1155, $P1154
    iseq $I1156, $S1155, "rule"
    unless $I1156, if_1152_end
    new $P1157, "Integer"
    assign $P1157, 1
    find_lex $P1158, "%h"
    unless_null $P1158, vivify_390
    new $P1158, "Hash"
    store_lex "%h", $P1158
  vivify_390:
    set $P1158["r"], $P1157
    new $P1159, "Integer"
    assign $P1159, 1
    find_lex $P1160, "%h"
    unless_null $P1160, vivify_391
    new $P1160, "Hash"
    store_lex "%h", $P1160
  vivify_391:
    set $P1160["s"], $P1159
  if_1152_end:
.annotate "line", 390
    find_lex $P1161, "@MODIFIERS"
    find_lex $P1162, "%h"
    $P1161."unshift"($P1162)
.annotate "line", 391

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 395
    get_global $P1163, "@BLOCK"
    unless_null $P1163, vivify_392
    new $P1163, "ResizablePMCArray"
  vivify_392:
    set $P1164, $P1163[0]
    unless_null $P1164, vivify_393
    new $P1164, "Undef"
  vivify_393:
    $P1164."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 396
    get_global $P1165, "@BLOCK"
    unless_null $P1165, vivify_394
    new $P1165, "ResizablePMCArray"
  vivify_394:
    set $P1166, $P1165[0]
    unless_null $P1166, vivify_395
    new $P1166, "Undef"
  vivify_395:
    $P1166."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 397
    new $P1167, "Exception"
    set $P1167['type'], 58
    new $P1168, "Integer"
    assign $P1168, 0
    setattribute $P1167, 'payload', $P1168
    throw $P1167
.annotate "line", 386
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("74_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1228
.annotate "line", 446
    new $P1227, 'ExceptionHandler'
    set_addr $P1227, control_1226
    $P1227."handle_types"(58)
    push_eh $P1227
    .lex "self", self
    .lex "$/", param_1228
.annotate "line", 447
    new $P1229, "Undef"
    .lex "$past", $P1229
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_396
    new $P1232, "Hash"
  vivify_396:
    set $P1233, $P1232["args"]
    unless_null $P1233, vivify_397
    new $P1233, "Undef"
  vivify_397:
    if $P1233, if_1231
    get_hll_global $P1238, ["PAST"], "Op"
    find_lex $P1239, "$/"
    $P1240 = $P1238."new"($P1239 :named("node"))
    set $P1230, $P1240
    goto if_1231_end
  if_1231:
    find_lex $P1234, "$/"
    unless_null $P1234, vivify_398
    new $P1234, "Hash"
  vivify_398:
    set $P1235, $P1234["args"]
    unless_null $P1235, vivify_399
    new $P1235, "ResizablePMCArray"
  vivify_399:
    set $P1236, $P1235[0]
    unless_null $P1236, vivify_400
    new $P1236, "Undef"
  vivify_400:
    $P1237 = $P1236."ast"()
    set $P1230, $P1237
  if_1231_end:
    store_lex "$past", $P1230
.annotate "line", 448
    find_lex $P1241, "$past"
    find_lex $P1242, "$/"
    unless_null $P1242, vivify_401
    new $P1242, "Hash"
  vivify_401:
    set $P1243, $P1242["identifier"]
    unless_null $P1243, vivify_402
    new $P1243, "Undef"
  vivify_402:
    set $S1244, $P1243
    $P1241."name"($S1244)
.annotate "line", 449
    find_lex $P1245, "$past"
    $P1245."pasttype"("callmethod")
.annotate "line", 450
    find_lex $P1246, "$/"
    find_lex $P1247, "$past"
    $P1248 = $P1246."!make"($P1247)
.annotate "line", 446
    .return ($P1248)
  control_1226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1249, exception, "payload"
    .return ($P1249)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("75_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1253
.annotate "line", 455
    new $P1252, 'ExceptionHandler'
    set_addr $P1252, control_1251
    $P1252."handle_types"(58)
    push_eh $P1252
    .lex "self", self
    .lex "$/", param_1253
.annotate "line", 456
    find_lex $P1254, "$/"
    get_hll_global $P1255, ["PAST"], "Var"
    $P1256 = $P1255."new"("self" :named("name"))
    $P1257 = $P1254."!make"($P1256)
.annotate "line", 455
    .return ($P1257)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1258, exception, "payload"
    .return ($P1258)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("76_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1262
.annotate "line", 459
    new $P1261, 'ExceptionHandler'
    set_addr $P1261, control_1260
    $P1261."handle_types"(58)
    push_eh $P1261
    .lex "self", self
    .lex "$/", param_1262
.annotate "line", 460
    new $P1263, "Undef"
    .lex "$past", $P1263
    find_lex $P1264, "$/"
    unless_null $P1264, vivify_403
    new $P1264, "Hash"
  vivify_403:
    set $P1265, $P1264["args"]
    unless_null $P1265, vivify_404
    new $P1265, "Undef"
  vivify_404:
    $P1266 = $P1265."ast"()
    store_lex "$past", $P1266
.annotate "line", 461
    find_lex $P1267, "$past"
    find_lex $P1268, "$/"
    unless_null $P1268, vivify_405
    new $P1268, "Hash"
  vivify_405:
    set $P1269, $P1268["identifier"]
    unless_null $P1269, vivify_406
    new $P1269, "Undef"
  vivify_406:
    set $S1270, $P1269
    $P1267."name"($S1270)
.annotate "line", 462
    find_lex $P1271, "$/"
    find_lex $P1272, "$past"
    $P1273 = $P1271."!make"($P1272)
.annotate "line", 459
    .return ($P1273)
  control_1260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1274, exception, "payload"
    .return ($P1274)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("77_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1278
.annotate "line", 465
    new $P1277, 'ExceptionHandler'
    set_addr $P1277, control_1276
    $P1277."handle_types"(58)
    push_eh $P1277
    .lex "self", self
    .lex "$/", param_1278
.annotate "line", 466
    new $P1279, "Undef"
    .lex "$ns", $P1279
.annotate "line", 471
    new $P1280, "Undef"
    .lex "$name", $P1280
.annotate "line", 472
    new $P1281, "Undef"
    .lex "$var", $P1281
.annotate "line", 474
    new $P1282, "Undef"
    .lex "$past", $P1282
.annotate "line", 466
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_407
    new $P1283, "Hash"
  vivify_407:
    set $P1284, $P1283["name"]
    unless_null $P1284, vivify_408
    new $P1284, "Hash"
  vivify_408:
    set $P1285, $P1284["identifier"]
    unless_null $P1285, vivify_409
    new $P1285, "Undef"
  vivify_409:
    store_lex "$ns", $P1285
.annotate "line", 467

               $P0 = find_lex '$ns'
               $P1286 = clone $P0
           
    store_lex "$ns", $P1286
.annotate "line", 471
    find_lex $P1287, "$ns"
    $P1288 = $P1287."pop"()
    store_lex "$name", $P1288
.annotate "line", 473
    get_hll_global $P1289, ["PAST"], "Var"
    find_lex $P1290, "$name"
    set $S1291, $P1290
    find_lex $P1292, "$ns"
    $P1293 = $P1289."new"($S1291 :named("name"), $P1292 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1293
.annotate "line", 474
    find_lex $P1294, "$var"
    store_lex "$past", $P1294
.annotate "line", 475
    find_lex $P1296, "$/"
    unless_null $P1296, vivify_410
    new $P1296, "Hash"
  vivify_410:
    set $P1297, $P1296["args"]
    unless_null $P1297, vivify_411
    new $P1297, "Undef"
  vivify_411:
    unless $P1297, if_1295_end
.annotate "line", 476
    find_lex $P1298, "$/"
    unless_null $P1298, vivify_412
    new $P1298, "Hash"
  vivify_412:
    set $P1299, $P1298["args"]
    unless_null $P1299, vivify_413
    new $P1299, "ResizablePMCArray"
  vivify_413:
    set $P1300, $P1299[0]
    unless_null $P1300, vivify_414
    new $P1300, "Undef"
  vivify_414:
    $P1301 = $P1300."ast"()
    store_lex "$past", $P1301
.annotate "line", 477
    find_lex $P1302, "$past"
    find_lex $P1303, "$var"
    $P1302."unshift"($P1303)
  if_1295_end:
.annotate "line", 479
    find_lex $P1304, "$/"
    find_lex $P1305, "$past"
    $P1306 = $P1304."!make"($P1305)
.annotate "line", 465
    .return ($P1306)
  control_1276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1307, exception, "payload"
    .return ($P1307)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("78_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1311
.annotate "line", 482
    new $P1310, 'ExceptionHandler'
    set_addr $P1310, control_1309
    $P1310."handle_types"(58)
    push_eh $P1310
    .lex "self", self
    .lex "$/", param_1311
.annotate "line", 483
    new $P1312, "Undef"
    .lex "$past", $P1312
.annotate "line", 484
    new $P1313, "Undef"
    .lex "$pirop", $P1313
.annotate "line", 483
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_415
    new $P1316, "Hash"
  vivify_415:
    set $P1317, $P1316["args"]
    unless_null $P1317, vivify_416
    new $P1317, "Undef"
  vivify_416:
    if $P1317, if_1315
    get_hll_global $P1322, ["PAST"], "Op"
    find_lex $P1323, "$/"
    $P1324 = $P1322."new"($P1323 :named("node"))
    set $P1314, $P1324
    goto if_1315_end
  if_1315:
    find_lex $P1318, "$/"
    unless_null $P1318, vivify_417
    new $P1318, "Hash"
  vivify_417:
    set $P1319, $P1318["args"]
    unless_null $P1319, vivify_418
    new $P1319, "ResizablePMCArray"
  vivify_418:
    set $P1320, $P1319[0]
    unless_null $P1320, vivify_419
    new $P1320, "Undef"
  vivify_419:
    $P1321 = $P1320."ast"()
    set $P1314, $P1321
  if_1315_end:
    store_lex "$past", $P1314
.annotate "line", 484
    find_lex $P1325, "$/"
    unless_null $P1325, vivify_420
    new $P1325, "Hash"
  vivify_420:
    set $P1326, $P1325["op"]
    unless_null $P1326, vivify_421
    new $P1326, "Undef"
  vivify_421:
    set $S1327, $P1326
    new $P1328, 'String'
    set $P1328, $S1327
    store_lex "$pirop", $P1328
.annotate "line", 485

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1329 = box $S0
    
    store_lex "$pirop", $P1329
.annotate "line", 492
    find_lex $P1330, "$past"
    find_lex $P1331, "$pirop"
    $P1330."pirop"($P1331)
.annotate "line", 493
    find_lex $P1332, "$past"
    $P1332."pasttype"("pirop")
.annotate "line", 494
    find_lex $P1333, "$/"
    find_lex $P1334, "$past"
    $P1335 = $P1333."!make"($P1334)
.annotate "line", 482
    .return ($P1335)
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1336, exception, "payload"
    .return ($P1336)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("79_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1340
.annotate "line", 497
    new $P1339, 'ExceptionHandler'
    set_addr $P1339, control_1338
    $P1339."handle_types"(58)
    push_eh $P1339
    .lex "self", self
    .lex "$/", param_1340
    find_lex $P1341, "$/"
    find_lex $P1342, "$/"
    unless_null $P1342, vivify_422
    new $P1342, "Hash"
  vivify_422:
    set $P1343, $P1342["arglist"]
    unless_null $P1343, vivify_423
    new $P1343, "Undef"
  vivify_423:
    $P1344 = $P1343."ast"()
    $P1345 = $P1341."!make"($P1344)
    .return ($P1345)
  control_1338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1346, exception, "payload"
    .return ($P1346)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("80_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1350
.annotate "line", 499
    .const 'Sub' $P1361 = "81_1258129019.06598" 
    capture_lex $P1361
    new $P1349, 'ExceptionHandler'
    set_addr $P1349, control_1348
    $P1349."handle_types"(58)
    push_eh $P1349
    .lex "self", self
    .lex "$/", param_1350
.annotate "line", 500
    new $P1351, "Undef"
    .lex "$past", $P1351
.annotate "line", 508
    new $P1352, "Undef"
    .lex "$i", $P1352
.annotate "line", 509
    new $P1353, "Undef"
    .lex "$n", $P1353
.annotate "line", 500
    get_hll_global $P1354, ["PAST"], "Op"
    find_lex $P1355, "$/"
    $P1356 = $P1354."new"("call" :named("pasttype"), $P1355 :named("node"))
    store_lex "$past", $P1356
.annotate "line", 501
    find_lex $P1358, "$/"
    unless_null $P1358, vivify_424
    new $P1358, "Hash"
  vivify_424:
    set $P1359, $P1358["EXPR"]
    unless_null $P1359, vivify_425
    new $P1359, "Undef"
  vivify_425:
    unless $P1359, if_1357_end
    .const 'Sub' $P1361 = "81_1258129019.06598" 
    capture_lex $P1361
    $P1361()
  if_1357_end:
.annotate "line", 508
    new $P1393, "Integer"
    assign $P1393, 0
    store_lex "$i", $P1393
.annotate "line", 509
    find_lex $P1394, "$past"
    $P1395 = $P1394."list"()
    set $N1396, $P1395
    new $P1397, 'Float'
    set $P1397, $N1396
    store_lex "$n", $P1397
.annotate "line", 510
    new $P1425, 'ExceptionHandler'
    set_addr $P1425, loop1424_handler
    $P1425."handle_types"(65, 67, 66)
    push_eh $P1425
  loop1424_test:
    find_lex $P1398, "$i"
    set $N1399, $P1398
    find_lex $P1400, "$n"
    set $N1401, $P1400
    islt $I1402, $N1399, $N1401
    unless $I1402, loop1424_done
  loop1424_redo:
.annotate "line", 511
    find_lex $P1404, "$i"
    set $I1405, $P1404
    find_lex $P1406, "$past"
    unless_null $P1406, vivify_429
    new $P1406, "ResizablePMCArray"
  vivify_429:
    set $P1407, $P1406[$I1405]
    unless_null $P1407, vivify_430
    new $P1407, "Undef"
  vivify_430:
    $S1408 = $P1407."name"()
    iseq $I1409, $S1408, "&prefix:<|>"
    unless $I1409, if_1403_end
.annotate "line", 512
    find_lex $P1410, "$i"
    set $I1411, $P1410
    find_lex $P1412, "$past"
    unless_null $P1412, vivify_431
    new $P1412, "ResizablePMCArray"
  vivify_431:
    set $P1413, $P1412[$I1411]
    unless_null $P1413, vivify_432
    new $P1413, "ResizablePMCArray"
  vivify_432:
    set $P1414, $P1413[0]
    unless_null $P1414, vivify_433
    new $P1414, "Undef"
  vivify_433:
    find_lex $P1415, "$i"
    set $I1416, $P1415
    find_lex $P1417, "$past"
    unless_null $P1417, vivify_434
    new $P1417, "ResizablePMCArray"
    store_lex "$past", $P1417
  vivify_434:
    set $P1417[$I1416], $P1414
.annotate "line", 513
    find_lex $P1418, "$i"
    set $I1419, $P1418
    find_lex $P1420, "$past"
    unless_null $P1420, vivify_435
    new $P1420, "ResizablePMCArray"
  vivify_435:
    set $P1421, $P1420[$I1419]
    unless_null $P1421, vivify_436
    new $P1421, "Undef"
  vivify_436:
    $P1421."flat"(1)
  if_1403_end:
.annotate "line", 511
    find_lex $P1422, "$i"
    clone $P1423, $P1422
    inc $P1422
  loop1424_next:
.annotate "line", 510
    goto loop1424_test
  loop1424_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1426, exception, 'type'
    eq $P1426, 65, loop1424_next
    eq $P1426, 67, loop1424_redo
  loop1424_done:
    pop_eh 
.annotate "line", 517
    find_lex $P1427, "$/"
    find_lex $P1428, "$past"
    $P1429 = $P1427."!make"($P1428)
.annotate "line", 499
    .return ($P1429)
  control_1348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1430, exception, "payload"
    .return ($P1430)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1360"  :anon :subid("81_1258129019.06598") :outer("80_1258129019.06598")
.annotate "line", 501
    .const 'Sub' $P1382 = "82_1258129019.06598" 
    capture_lex $P1382
.annotate "line", 502
    new $P1362, "Undef"
    .lex "$expr", $P1362
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_426
    new $P1363, "Hash"
  vivify_426:
    set $P1364, $P1363["EXPR"]
    unless_null $P1364, vivify_427
    new $P1364, "Undef"
  vivify_427:
    $P1365 = $P1364."ast"()
    store_lex "$expr", $P1365
.annotate "line", 503
    find_lex $P1370, "$expr"
    $S1371 = $P1370."name"()
    iseq $I1372, $S1371, "&infix:<,>"
    if $I1372, if_1369
    new $P1368, 'Integer'
    set $P1368, $I1372
    goto if_1369_end
  if_1369:
    find_lex $P1373, "$expr"
    $P1374 = $P1373."named"()
    isfalse $I1375, $P1374
    new $P1368, 'Integer'
    set $P1368, $I1375
  if_1369_end:
    if $P1368, if_1367
.annotate "line", 506
    find_lex $P1390, "$past"
    find_lex $P1391, "$expr"
    $P1392 = $P1390."push"($P1391)
    set $P1366, $P1392
.annotate "line", 503
    goto if_1367_end
  if_1367:
.annotate "line", 504
    find_lex $P1377, "$expr"
    $P1378 = $P1377."list"()
    defined $I1379, $P1378
    unless $I1379, for_undef_428
    iter $P1376, $P1378
    new $P1388, 'ExceptionHandler'
    set_addr $P1388, loop1387_handler
    $P1388."handle_types"(65, 67, 66)
    push_eh $P1388
  loop1387_test:
    unless $P1376, loop1387_done
    shift $P1380, $P1376
  loop1387_redo:
    .const 'Sub' $P1382 = "82_1258129019.06598" 
    capture_lex $P1382
    $P1382($P1380)
  loop1387_next:
    goto loop1387_test
  loop1387_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1389, exception, 'type'
    eq $P1389, 65, loop1387_next
    eq $P1389, 67, loop1387_redo
  loop1387_done:
    pop_eh 
  for_undef_428:
.annotate "line", 503
    set $P1366, $P1376
  if_1367_end:
.annotate "line", 501
    .return ($P1366)
.end


.namespace ["NQP";"Actions"]
.sub "_block1381"  :anon :subid("82_1258129019.06598") :outer("81_1258129019.06598")
    .param pmc param_1383
.annotate "line", 504
    .lex "$_", param_1383
    find_lex $P1384, "$past"
    find_lex $P1385, "$_"
    $P1386 = $P1384."push"($P1385)
    .return ($P1386)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("83_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1434
.annotate "line", 521
    new $P1433, 'ExceptionHandler'
    set_addr $P1433, control_1432
    $P1433."handle_types"(58)
    push_eh $P1433
    .lex "self", self
    .lex "$/", param_1434
    find_lex $P1435, "$/"
    find_lex $P1436, "$/"
    unless_null $P1436, vivify_437
    new $P1436, "Hash"
  vivify_437:
    set $P1437, $P1436["value"]
    unless_null $P1437, vivify_438
    new $P1437, "Undef"
  vivify_438:
    $P1438 = $P1437."ast"()
    $P1439 = $P1435."!make"($P1438)
    .return ($P1439)
  control_1432:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1440, exception, "payload"
    .return ($P1440)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("84_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1444
.annotate "line", 523
    new $P1443, 'ExceptionHandler'
    set_addr $P1443, control_1442
    $P1443."handle_types"(58)
    push_eh $P1443
    .lex "self", self
    .lex "$/", param_1444
.annotate "line", 524
    find_lex $P1445, "$/"
.annotate "line", 525
    find_lex $P1448, "$/"
    unless_null $P1448, vivify_439
    new $P1448, "Hash"
  vivify_439:
    set $P1449, $P1448["EXPR"]
    unless_null $P1449, vivify_440
    new $P1449, "Undef"
  vivify_440:
    if $P1449, if_1447
.annotate "line", 526
    get_hll_global $P1454, ["PAST"], "Op"
    find_lex $P1455, "$/"
    $P1456 = $P1454."new"("list" :named("pasttype"), $P1455 :named("node"))
    set $P1446, $P1456
.annotate "line", 525
    goto if_1447_end
  if_1447:
    find_lex $P1450, "$/"
    unless_null $P1450, vivify_441
    new $P1450, "Hash"
  vivify_441:
    set $P1451, $P1450["EXPR"]
    unless_null $P1451, vivify_442
    new $P1451, "ResizablePMCArray"
  vivify_442:
    set $P1452, $P1451[0]
    unless_null $P1452, vivify_443
    new $P1452, "Undef"
  vivify_443:
    $P1453 = $P1452."ast"()
    set $P1446, $P1453
  if_1447_end:
    $P1457 = $P1445."!make"($P1446)
.annotate "line", 523
    .return ($P1457)
  control_1442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1458, exception, "payload"
    .return ($P1458)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("85_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1462
.annotate "line", 529
    new $P1461, 'ExceptionHandler'
    set_addr $P1461, control_1460
    $P1461."handle_types"(58)
    push_eh $P1461
    .lex "self", self
    .lex "$/", param_1462
.annotate "line", 530
    new $P1463, "Undef"
    .lex "$past", $P1463
.annotate "line", 529
    find_lex $P1464, "$past"
.annotate "line", 531
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_444
    new $P1466, "Hash"
  vivify_444:
    set $P1467, $P1466["EXPR"]
    unless_null $P1467, vivify_445
    new $P1467, "Undef"
  vivify_445:
    if $P1467, if_1465
.annotate "line", 538
    get_hll_global $P1479, ["PAST"], "Op"
    $P1480 = $P1479."new"("list" :named("pasttype"))
    store_lex "$past", $P1480
.annotate "line", 537
    goto if_1465_end
  if_1465:
.annotate "line", 532
    find_lex $P1468, "$/"
    unless_null $P1468, vivify_446
    new $P1468, "Hash"
  vivify_446:
    set $P1469, $P1468["EXPR"]
    unless_null $P1469, vivify_447
    new $P1469, "ResizablePMCArray"
  vivify_447:
    set $P1470, $P1469[0]
    unless_null $P1470, vivify_448
    new $P1470, "Undef"
  vivify_448:
    $P1471 = $P1470."ast"()
    store_lex "$past", $P1471
.annotate "line", 533
    find_lex $P1473, "$past"
    $S1474 = $P1473."name"()
    isne $I1475, $S1474, "&infix:<,>"
    unless $I1475, if_1472_end
.annotate "line", 534
    get_hll_global $P1476, ["PAST"], "Op"
    find_lex $P1477, "$past"
    $P1478 = $P1476."new"($P1477, "list" :named("pasttype"))
    store_lex "$past", $P1478
  if_1472_end:
  if_1465_end:
.annotate "line", 540
    find_lex $P1481, "$past"
    $P1481."name"("&circumfix:<[ ]>")
.annotate "line", 541
    find_lex $P1482, "$/"
    find_lex $P1483, "$past"
    $P1484 = $P1482."!make"($P1483)
.annotate "line", 529
    .return ($P1484)
  control_1460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1485, exception, "payload"
    .return ($P1485)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("86_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1489
.annotate "line", 544
    new $P1488, 'ExceptionHandler'
    set_addr $P1488, control_1487
    $P1488."handle_types"(58)
    push_eh $P1488
    .lex "self", self
    .lex "$/", param_1489
    find_lex $P1490, "$/"
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_449
    new $P1491, "Hash"
  vivify_449:
    set $P1492, $P1491["quote_EXPR"]
    unless_null $P1492, vivify_450
    new $P1492, "Undef"
  vivify_450:
    $P1493 = $P1492."ast"()
    $P1494 = $P1490."!make"($P1493)
    .return ($P1494)
  control_1487:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1495, exception, "payload"
    .return ($P1495)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("87_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1499
.annotate "line", 546
    new $P1498, 'ExceptionHandler'
    set_addr $P1498, control_1497
    $P1498."handle_types"(58)
    push_eh $P1498
    .lex "self", self
    .lex "$/", param_1499
.annotate "line", 547
    find_lex $P1500, "$/"
    find_lex $P1503, "$/"
    unless_null $P1503, vivify_451
    new $P1503, "Hash"
  vivify_451:
    set $P1504, $P1503["pblock"]
    unless_null $P1504, vivify_452
    new $P1504, "Hash"
  vivify_452:
    set $P1505, $P1504["blockoid"]
    unless_null $P1505, vivify_453
    new $P1505, "Hash"
  vivify_453:
    set $P1506, $P1505["statementlist"]
    unless_null $P1506, vivify_454
    new $P1506, "Hash"
  vivify_454:
    set $P1507, $P1506["statement"]
    unless_null $P1507, vivify_455
    new $P1507, "Undef"
  vivify_455:
    set $N1508, $P1507
    new $P1509, "Integer"
    assign $P1509, 0
    set $N1510, $P1509
    isgt $I1511, $N1508, $N1510
    if $I1511, if_1502
.annotate "line", 549
    get_hll_global $P1515, ["PAST"], "Op"
    find_lex $P1516, "$/"
    $P1517 = $P1515."new"("    %r = new [\"Hash\"]" :named("inline"), $P1516 :named("node"))
    set $P1501, $P1517
.annotate "line", 547
    goto if_1502_end
  if_1502:
.annotate "line", 548
    find_lex $P1512, "$/"
    unless_null $P1512, vivify_456
    new $P1512, "Hash"
  vivify_456:
    set $P1513, $P1512["pblock"]
    unless_null $P1513, vivify_457
    new $P1513, "Undef"
  vivify_457:
    $P1514 = $P1513."ast"()
    set $P1501, $P1514
  if_1502_end:
    $P1518 = $P1500."!make"($P1501)
.annotate "line", 546
    .return ($P1518)
  control_1497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1519, exception, "payload"
    .return ($P1519)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("88_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1523
.annotate "line", 552
    new $P1522, 'ExceptionHandler'
    set_addr $P1522, control_1521
    $P1522."handle_types"(58)
    push_eh $P1522
    .lex "self", self
    .lex "$/", param_1523
.annotate "line", 553
    new $P1524, "Undef"
    .lex "$name", $P1524
    find_lex $P1527, "$/"
    unless_null $P1527, vivify_458
    new $P1527, "Hash"
  vivify_458:
    set $P1528, $P1527["sigil"]
    unless_null $P1528, vivify_459
    new $P1528, "Undef"
  vivify_459:
    set $S1529, $P1528
    iseq $I1530, $S1529, "@"
    if $I1530, if_1526
.annotate "line", 554
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_460
    new $P1534, "Hash"
  vivify_460:
    set $P1535, $P1534["sigil"]
    unless_null $P1535, vivify_461
    new $P1535, "Undef"
  vivify_461:
    set $S1536, $P1535
    iseq $I1537, $S1536, "%"
    if $I1537, if_1533
    new $P1539, "String"
    assign $P1539, "item"
    set $P1532, $P1539
    goto if_1533_end
  if_1533:
    new $P1538, "String"
    assign $P1538, "hash"
    set $P1532, $P1538
  if_1533_end:
    set $P1525, $P1532
.annotate "line", 553
    goto if_1526_end
  if_1526:
    new $P1531, "String"
    assign $P1531, "list"
    set $P1525, $P1531
  if_1526_end:
    store_lex "$name", $P1525
.annotate "line", 556
    find_lex $P1540, "$/"
    get_hll_global $P1541, ["PAST"], "Op"
    find_lex $P1542, "$name"
    find_lex $P1543, "$/"
    unless_null $P1543, vivify_462
    new $P1543, "Hash"
  vivify_462:
    set $P1544, $P1543["semilist"]
    unless_null $P1544, vivify_463
    new $P1544, "Undef"
  vivify_463:
    $P1545 = $P1544."ast"()
    $P1546 = $P1541."new"($P1545, "callmethod" :named("pasttype"), $P1542 :named("name"))
    $P1547 = $P1540."!make"($P1546)
.annotate "line", 552
    .return ($P1547)
  control_1521:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1548, exception, "payload"
    .return ($P1548)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("89_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1552
.annotate "line", 559
    new $P1551, 'ExceptionHandler'
    set_addr $P1551, control_1550
    $P1551."handle_types"(58)
    push_eh $P1551
    .lex "self", self
    .lex "$/", param_1552
    find_lex $P1553, "$/"
    find_lex $P1554, "$/"
    unless_null $P1554, vivify_464
    new $P1554, "Hash"
  vivify_464:
    set $P1555, $P1554["statement"]
    unless_null $P1555, vivify_465
    new $P1555, "Undef"
  vivify_465:
    $P1556 = $P1555."ast"()
    $P1557 = $P1553."!make"($P1556)
    .return ($P1557)
  control_1550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1558, exception, "payload"
    .return ($P1558)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("90_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1562
.annotate "line", 561
    new $P1561, 'ExceptionHandler'
    set_addr $P1561, control_1560
    $P1561."handle_types"(58)
    push_eh $P1561
    .lex "self", self
    .lex "$/", param_1562
.annotate "line", 562
    find_lex $P1563, "$/"
    get_hll_global $P1564, ["PAST"], "Var"
    find_lex $P1565, "$/"
    unless_null $P1565, vivify_466
    new $P1565, "Hash"
  vivify_466:
    set $P1566, $P1565["EXPR"]
    unless_null $P1566, vivify_467
    new $P1566, "Undef"
  vivify_467:
    $P1567 = $P1566."ast"()
    $P1568 = $P1564."new"($P1567, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1569 = $P1563."!make"($P1568)
.annotate "line", 561
    .return ($P1569)
  control_1560:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("91_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1574
.annotate "line", 567
    new $P1573, 'ExceptionHandler'
    set_addr $P1573, control_1572
    $P1573."handle_types"(58)
    push_eh $P1573
    .lex "self", self
    .lex "$/", param_1574
.annotate "line", 568
    find_lex $P1575, "$/"
    get_hll_global $P1576, ["PAST"], "Var"
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_468
    new $P1577, "Hash"
  vivify_468:
    set $P1578, $P1577["EXPR"]
    unless_null $P1578, vivify_469
    new $P1578, "Undef"
  vivify_469:
    $P1579 = $P1578."ast"()
    $P1580 = $P1576."new"($P1579, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1581 = $P1575."!make"($P1580)
.annotate "line", 567
    .return ($P1581)
  control_1572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1582, exception, "payload"
    .return ($P1582)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("92_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1586
.annotate "line", 573
    new $P1585, 'ExceptionHandler'
    set_addr $P1585, control_1584
    $P1585."handle_types"(58)
    push_eh $P1585
    .lex "self", self
    .lex "$/", param_1586
.annotate "line", 574
    find_lex $P1587, "$/"
    get_hll_global $P1588, ["PAST"], "Var"
    find_lex $P1589, "$/"
    unless_null $P1589, vivify_470
    new $P1589, "Hash"
  vivify_470:
    set $P1590, $P1589["quote_EXPR"]
    unless_null $P1590, vivify_471
    new $P1590, "Undef"
  vivify_471:
    $P1591 = $P1590."ast"()
    $P1592 = $P1588."new"($P1591, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1593 = $P1587."!make"($P1592)
.annotate "line", 573
    .return ($P1593)
  control_1584:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1594, exception, "payload"
    .return ($P1594)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("93_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1598
.annotate "line", 579
    new $P1597, 'ExceptionHandler'
    set_addr $P1597, control_1596
    $P1597."handle_types"(58)
    push_eh $P1597
    .lex "self", self
    .lex "$/", param_1598
.annotate "line", 580
    find_lex $P1599, "$/"
    find_lex $P1600, "$/"
    unless_null $P1600, vivify_472
    new $P1600, "Hash"
  vivify_472:
    set $P1601, $P1600["arglist"]
    unless_null $P1601, vivify_473
    new $P1601, "Undef"
  vivify_473:
    $P1602 = $P1601."ast"()
    $P1603 = $P1599."!make"($P1602)
.annotate "line", 579
    .return ($P1603)
  control_1596:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1604, exception, "payload"
    .return ($P1604)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("94_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1608
.annotate "line", 583
    new $P1607, 'ExceptionHandler'
    set_addr $P1607, control_1606
    $P1607."handle_types"(58)
    push_eh $P1607
    .lex "self", self
    .lex "$/", param_1608
.annotate "line", 584
    new $P1609, "Undef"
    .lex "$past", $P1609
.annotate "line", 585
    find_lex $P1612, "$/"
    unless_null $P1612, vivify_474
    new $P1612, "Hash"
  vivify_474:
    set $P1613, $P1612["quote"]
    unless_null $P1613, vivify_475
    new $P1613, "Undef"
  vivify_475:
    if $P1613, if_1611
.annotate "line", 586
    get_hll_global $P1617, ["PAST"], "Val"
.annotate "line", 588
    find_lex $P1620, "$/"
    unless_null $P1620, vivify_476
    new $P1620, "Hash"
  vivify_476:
    set $P1621, $P1620["dec_number"]
    unless_null $P1621, vivify_477
    new $P1621, "Undef"
  vivify_477:
    if $P1621, if_1619
.annotate "line", 589
    find_lex $P1625, "$/"
    unless_null $P1625, vivify_478
    new $P1625, "Hash"
  vivify_478:
    set $P1626, $P1625["integer"]
    unless_null $P1626, vivify_479
    new $P1626, "Undef"
  vivify_479:
    $P1627 = $P1626."ast"()
    set $P1618, $P1627
.annotate "line", 588
    goto if_1619_end
  if_1619:
    find_lex $P1622, "$/"
    unless_null $P1622, vivify_480
    new $P1622, "Hash"
  vivify_480:
    set $P1623, $P1622["dec_number"]
    unless_null $P1623, vivify_481
    new $P1623, "Undef"
  vivify_481:
    $P1624 = $P1623."ast"()
    set $P1618, $P1624
  if_1619_end:
    $P1628 = $P1617."new"($P1618 :named("value"))
.annotate "line", 586
    set $P1610, $P1628
.annotate "line", 585
    goto if_1611_end
  if_1611:
    find_lex $P1614, "$/"
    unless_null $P1614, vivify_482
    new $P1614, "Hash"
  vivify_482:
    set $P1615, $P1614["quote"]
    unless_null $P1615, vivify_483
    new $P1615, "Undef"
  vivify_483:
    $P1616 = $P1615."ast"()
    set $P1610, $P1616
  if_1611_end:
    store_lex "$past", $P1610
.annotate "line", 591
    find_lex $P1629, "$/"
    find_lex $P1630, "$past"
    $P1631 = $P1629."!make"($P1630)
.annotate "line", 583
    .return ($P1631)
  control_1606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1632, exception, "payload"
    .return ($P1632)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("95_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1636
.annotate "line", 594
    new $P1635, 'ExceptionHandler'
    set_addr $P1635, control_1634
    $P1635."handle_types"(58)
    push_eh $P1635
    .lex "self", self
    .lex "$/", param_1636
    find_lex $P1637, "$/"
    find_lex $P1638, "$/"
    unless_null $P1638, vivify_484
    new $P1638, "Hash"
  vivify_484:
    set $P1639, $P1638["quote_EXPR"]
    unless_null $P1639, vivify_485
    new $P1639, "Undef"
  vivify_485:
    $P1640 = $P1639."ast"()
    $P1641 = $P1637."!make"($P1640)
    .return ($P1641)
  control_1634:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1642, exception, "payload"
    .return ($P1642)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("96_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1646
.annotate "line", 595
    new $P1645, 'ExceptionHandler'
    set_addr $P1645, control_1644
    $P1645."handle_types"(58)
    push_eh $P1645
    .lex "self", self
    .lex "$/", param_1646
    find_lex $P1647, "$/"
    find_lex $P1648, "$/"
    unless_null $P1648, vivify_486
    new $P1648, "Hash"
  vivify_486:
    set $P1649, $P1648["quote_EXPR"]
    unless_null $P1649, vivify_487
    new $P1649, "Undef"
  vivify_487:
    $P1650 = $P1649."ast"()
    $P1651 = $P1647."!make"($P1650)
    .return ($P1651)
  control_1644:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1652, exception, "payload"
    .return ($P1652)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("97_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1656
.annotate "line", 596
    new $P1655, 'ExceptionHandler'
    set_addr $P1655, control_1654
    $P1655."handle_types"(58)
    push_eh $P1655
    .lex "self", self
    .lex "$/", param_1656
    find_lex $P1657, "$/"
    find_lex $P1658, "$/"
    unless_null $P1658, vivify_488
    new $P1658, "Hash"
  vivify_488:
    set $P1659, $P1658["quote_EXPR"]
    unless_null $P1659, vivify_489
    new $P1659, "Undef"
  vivify_489:
    $P1660 = $P1659."ast"()
    $P1661 = $P1657."!make"($P1660)
    .return ($P1661)
  control_1654:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1662, exception, "payload"
    .return ($P1662)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("98_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1666
.annotate "line", 597
    new $P1665, 'ExceptionHandler'
    set_addr $P1665, control_1664
    $P1665."handle_types"(58)
    push_eh $P1665
    .lex "self", self
    .lex "$/", param_1666
    find_lex $P1667, "$/"
    find_lex $P1668, "$/"
    unless_null $P1668, vivify_490
    new $P1668, "Hash"
  vivify_490:
    set $P1669, $P1668["quote_EXPR"]
    unless_null $P1669, vivify_491
    new $P1669, "Undef"
  vivify_491:
    $P1670 = $P1669."ast"()
    $P1671 = $P1667."!make"($P1670)
    .return ($P1671)
  control_1664:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1672, exception, "payload"
    .return ($P1672)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("99_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1676
.annotate "line", 598
    new $P1675, 'ExceptionHandler'
    set_addr $P1675, control_1674
    $P1675."handle_types"(58)
    push_eh $P1675
    .lex "self", self
    .lex "$/", param_1676
    find_lex $P1677, "$/"
    find_lex $P1678, "$/"
    unless_null $P1678, vivify_492
    new $P1678, "Hash"
  vivify_492:
    set $P1679, $P1678["quote_EXPR"]
    unless_null $P1679, vivify_493
    new $P1679, "Undef"
  vivify_493:
    $P1680 = $P1679."ast"()
    $P1681 = $P1677."!make"($P1680)
    .return ($P1681)
  control_1674:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1682, exception, "payload"
    .return ($P1682)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("100_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1686
.annotate "line", 599
    new $P1685, 'ExceptionHandler'
    set_addr $P1685, control_1684
    $P1685."handle_types"(58)
    push_eh $P1685
    .lex "self", self
    .lex "$/", param_1686
.annotate "line", 600
    find_lex $P1687, "$/"
    get_hll_global $P1688, ["PAST"], "Op"
    find_lex $P1689, "$/"
    unless_null $P1689, vivify_494
    new $P1689, "Hash"
  vivify_494:
    set $P1690, $P1689["quote_EXPR"]
    unless_null $P1690, vivify_495
    new $P1690, "Undef"
  vivify_495:
    $P1691 = $P1690."ast"()
    $P1692 = $P1691."value"()
    find_lex $P1693, "$/"
    $P1694 = $P1688."new"($P1692 :named("inline"), "inline" :named("pasttype"), $P1693 :named("node"))
    $P1695 = $P1687."!make"($P1694)
.annotate "line", 599
    .return ($P1695)
  control_1684:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1696, exception, "payload"
    .return ($P1696)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("101_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1700
.annotate "line", 605
    new $P1699, 'ExceptionHandler'
    set_addr $P1699, control_1698
    $P1699."handle_types"(58)
    push_eh $P1699
    .lex "self", self
    .lex "$/", param_1700
    find_lex $P1701, "$/"
    find_lex $P1702, "$/"
    unless_null $P1702, vivify_496
    new $P1702, "Hash"
  vivify_496:
    set $P1703, $P1702["variable"]
    unless_null $P1703, vivify_497
    new $P1703, "Undef"
  vivify_497:
    $P1704 = $P1703."ast"()
    $P1705 = $P1701."!make"($P1704)
    .return ($P1705)
  control_1698:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1706, exception, "payload"
    .return ($P1706)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("102_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1710
.annotate "line", 606
    new $P1709, 'ExceptionHandler'
    set_addr $P1709, control_1708
    $P1709."handle_types"(58)
    push_eh $P1709
    .lex "self", self
    .lex "$/", param_1710
.annotate "line", 607
    find_lex $P1711, "$/"
    get_hll_global $P1712, ["PAST"], "Op"
.annotate "line", 608
    find_lex $P1713, "$/"
    unless_null $P1713, vivify_498
    new $P1713, "Hash"
  vivify_498:
    set $P1714, $P1713["block"]
    unless_null $P1714, vivify_499
    new $P1714, "Undef"
  vivify_499:
    $P1715 = $P1714."ast"()
    $P1716 = "block_immediate"($P1715)
    find_lex $P1717, "$/"
    $P1718 = $P1712."new"($P1716, "set S*" :named("pirop"), $P1717 :named("node"))
.annotate "line", 607
    $P1719 = $P1711."!make"($P1718)
.annotate "line", 606
    .return ($P1719)
  control_1708:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1720, exception, "payload"
    .return ($P1720)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "nulltermish"  :subid("103_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1724
.annotate "line", 614
    new $P1723, 'ExceptionHandler'
    set_addr $P1723, control_1722
    $P1723."handle_types"(58)
    push_eh $P1723
    .lex "self", self
    .lex "$/", param_1724
.annotate "line", 615
    find_lex $P1725, "$/"
    find_lex $P1728, "$/"
    unless_null $P1728, vivify_500
    new $P1728, "Hash"
  vivify_500:
    set $P1729, $P1728["term"]
    unless_null $P1729, vivify_501
    new $P1729, "Undef"
  vivify_501:
    if $P1729, if_1727
    new $P1733, "Integer"
    assign $P1733, 0
    set $P1726, $P1733
    goto if_1727_end
  if_1727:
    find_lex $P1730, "$/"
    unless_null $P1730, vivify_502
    new $P1730, "Hash"
  vivify_502:
    set $P1731, $P1730["term"]
    unless_null $P1731, vivify_503
    new $P1731, "Undef"
  vivify_503:
    $P1732 = $P1731."ast"()
    set $P1726, $P1732
  if_1727_end:
    $P1734 = $P1725."!make"($P1726)
.annotate "line", 614
    .return ($P1734)
  control_1722:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1735, exception, "payload"
    .return ($P1735)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("104_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1739
.annotate "line", 618
    new $P1738, 'ExceptionHandler'
    set_addr $P1738, control_1737
    $P1738."handle_types"(58)
    push_eh $P1738
    .lex "self", self
    .lex "$/", param_1739
    find_lex $P1740, "$/"
    find_lex $P1741, "$/"
    unless_null $P1741, vivify_504
    new $P1741, "Hash"
  vivify_504:
    set $P1742, $P1741["dotty"]
    unless_null $P1742, vivify_505
    new $P1742, "Undef"
  vivify_505:
    $P1743 = $P1742."ast"()
    $P1744 = $P1740."!make"($P1743)
    .return ($P1744)
  control_1737:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1745, exception, "payload"
    .return ($P1745)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("105_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1749
.annotate "line", 620
    new $P1748, 'ExceptionHandler'
    set_addr $P1748, control_1747
    $P1748."handle_types"(58)
    push_eh $P1748
    .lex "self", self
    .lex "$/", param_1749
.annotate "line", 621
    find_lex $P1750, "$/"
    get_hll_global $P1751, ["PAST"], "Op"
.annotate "line", 622
    new $P1752, "ResizablePMCArray"
    push $P1752, "    clone %r, %0"
    push $P1752, "    inc %0"
    $P1753 = $P1751."new"("postfix:<++>" :named("name"), $P1752 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 621
    $P1754 = $P1750."!make"($P1753)
.annotate "line", 620
    .return ($P1754)
  control_1747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1755, exception, "payload"
    .return ($P1755)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("106_1258129019.06598") :method :outer("11_1258129019.06598")
    .param pmc param_1759
.annotate "line", 626
    new $P1758, 'ExceptionHandler'
    set_addr $P1758, control_1757
    $P1758."handle_types"(58)
    push_eh $P1758
    .lex "self", self
    .lex "$/", param_1759
.annotate "line", 627
    find_lex $P1760, "$/"
    get_hll_global $P1761, ["PAST"], "Op"
.annotate "line", 628
    new $P1762, "ResizablePMCArray"
    push $P1762, "    clone %r, %0"
    push $P1762, "    dec %0"
    $P1763 = $P1761."new"("postfix:<-->" :named("name"), $P1762 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 627
    $P1764 = $P1760."!make"($P1763)
.annotate "line", 626
    .return ($P1764)
  control_1757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1765, exception, "payload"
    .return ($P1765)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1766"  :subid("107_1258129019.06598") :outer("11_1258129019.06598")
.annotate "line", 633
    .const 'Sub' $P1802 = "111_1258129019.06598" 
    capture_lex $P1802
    .const 'Sub' $P1792 = "110_1258129019.06598" 
    capture_lex $P1792
    .const 'Sub' $P1782 = "109_1258129019.06598" 
    capture_lex $P1782
    .const 'Sub' $P1768 = "108_1258129019.06598" 
    capture_lex $P1768
.annotate "line", 644
    .const 'Sub' $P1802 = "111_1258129019.06598" 
    capture_lex $P1802
.annotate "line", 633
    .return ($P1802)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("108_1258129019.06598") :method :outer("107_1258129019.06598")
    .param pmc param_1771
.annotate "line", 635
    new $P1770, 'ExceptionHandler'
    set_addr $P1770, control_1769
    $P1770."handle_types"(58)
    push_eh $P1770
    .lex "self", self
    .lex "$/", param_1771
.annotate "line", 636
    new $P1772, "Undef"
    .lex "$past", $P1772
    find_lex $P1773, "$/"
    unless_null $P1773, vivify_506
    new $P1773, "Hash"
  vivify_506:
    set $P1774, $P1773["statement"]
    unless_null $P1774, vivify_507
    new $P1774, "Undef"
  vivify_507:
    $P1775 = $P1774."ast"()
    store_lex "$past", $P1775
.annotate "line", 637
    find_lex $P1776, "$/"
    get_hll_global $P1777, ["PAST"], "Regex"
    find_lex $P1778, "$past"
    $P1779 = $P1777."new"($P1778, "pastnode" :named("pasttype"))
    $P1780 = $P1776."!make"($P1779)
.annotate "line", 635
    .return ($P1780)
  control_1769:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1781, exception, "payload"
    .return ($P1781)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("109_1258129019.06598") :method :outer("107_1258129019.06598")
    .param pmc param_1785
.annotate "line", 640
    new $P1784, 'ExceptionHandler'
    set_addr $P1784, control_1783
    $P1784."handle_types"(58)
    push_eh $P1784
    .lex "self", self
    .lex "$/", param_1785
    find_lex $P1786, "$/"
    find_lex $P1787, "$/"
    unless_null $P1787, vivify_508
    new $P1787, "Hash"
  vivify_508:
    set $P1788, $P1787["codeblock"]
    unless_null $P1788, vivify_509
    new $P1788, "Undef"
  vivify_509:
    $P1789 = $P1788."ast"()
    $P1790 = $P1786."!make"($P1789)
    .return ($P1790)
  control_1783:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1791, exception, "payload"
    .return ($P1791)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("110_1258129019.06598") :method :outer("107_1258129019.06598")
    .param pmc param_1795
.annotate "line", 642
    new $P1794, 'ExceptionHandler'
    set_addr $P1794, control_1793
    $P1794."handle_types"(58)
    push_eh $P1794
    .lex "self", self
    .lex "$/", param_1795
    find_lex $P1796, "$/"
    find_lex $P1797, "$/"
    unless_null $P1797, vivify_510
    new $P1797, "Hash"
  vivify_510:
    set $P1798, $P1797["codeblock"]
    unless_null $P1798, vivify_511
    new $P1798, "Undef"
  vivify_511:
    $P1799 = $P1798."ast"()
    $P1800 = $P1796."!make"($P1799)
    .return ($P1800)
  control_1793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1801, exception, "payload"
    .return ($P1801)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("111_1258129019.06598") :method :outer("107_1258129019.06598")
    .param pmc param_1805
.annotate "line", 644
    new $P1804, 'ExceptionHandler'
    set_addr $P1804, control_1803
    $P1804."handle_types"(58)
    push_eh $P1804
    .lex "self", self
    .lex "$/", param_1805
.annotate "line", 645
    new $P1806, "Undef"
    .lex "$block", $P1806
.annotate "line", 647
    new $P1807, "Undef"
    .lex "$past", $P1807
.annotate "line", 645
    find_lex $P1808, "$/"
    unless_null $P1808, vivify_512
    new $P1808, "Hash"
  vivify_512:
    set $P1809, $P1808["block"]
    unless_null $P1809, vivify_513
    new $P1809, "Undef"
  vivify_513:
    $P1810 = $P1809."ast"()
    store_lex "$block", $P1810
.annotate "line", 646
    find_lex $P1811, "$block"
    $P1811."blocktype"("immediate")
.annotate "line", 648
    get_hll_global $P1812, ["PAST"], "Regex"
.annotate "line", 649
    get_hll_global $P1813, ["PAST"], "Stmts"
.annotate "line", 650
    get_hll_global $P1814, ["PAST"], "Op"
.annotate "line", 651
    get_hll_global $P1815, ["PAST"], "Var"
    $P1816 = $P1815."new"("$/" :named("name"))
.annotate "line", 652
    get_hll_global $P1817, ["PAST"], "Op"
.annotate "line", 653
    get_hll_global $P1818, ["PAST"], "Var"
    $P1819 = $P1818."new"(unicode:"$\x{a2}" :named("name"))
    $P1820 = $P1817."new"($P1819, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 652
    $P1821 = $P1814."new"($P1816, $P1820, "bind" :named("pasttype"))
.annotate "line", 650
    find_lex $P1822, "$block"
    $P1823 = $P1813."new"($P1821, $P1822)
.annotate "line", 649
    $P1824 = $P1812."new"($P1823, "pastnode" :named("pasttype"))
.annotate "line", 648
    store_lex "$past", $P1824
.annotate "line", 663
    find_lex $P1825, "$/"
    find_lex $P1826, "$past"
    $P1827 = $P1825."!make"($P1826)
.annotate "line", 644
    .return ($P1827)
  control_1803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1828, exception, "payload"
    .return ($P1828)
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
    nqpproto = p6meta.'new_class'('Regex::P6Grammar::Compiler', 'parent'=>'HLL::Compiler')
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

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
