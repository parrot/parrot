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
.sub "_block11"  :anon :subid("10_1258055895.501")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1036 = $P14()
.annotate "line", 1
    .return ($P1036)
.end


.namespace []
.sub "" :load :init :subid("post299") :outer("10_1258055895.501")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258055895.501" 
    .local pmc block
    set block, $P12
    $P1037 = get_root_global ["parrot"], "P6metaclass"
    $P1037."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258055895.501") :outer("10_1258055895.501")
.annotate "line", 4
    get_hll_global $P986, ["NQP";"Regex"], "_block985" 
    capture_lex $P986
    .const 'Sub' $P979 = "284_1258055895.501" 
    capture_lex $P979
    .const 'Sub' $P973 = "282_1258055895.501" 
    capture_lex $P973
    .const 'Sub' $P967 = "280_1258055895.501" 
    capture_lex $P967
    .const 'Sub' $P961 = "278_1258055895.501" 
    capture_lex $P961
    .const 'Sub' $P956 = "276_1258055895.501" 
    capture_lex $P956
    .const 'Sub' $P950 = "274_1258055895.501" 
    capture_lex $P950
    .const 'Sub' $P944 = "272_1258055895.501" 
    capture_lex $P944
    .const 'Sub' $P938 = "270_1258055895.501" 
    capture_lex $P938
    .const 'Sub' $P932 = "268_1258055895.501" 
    capture_lex $P932
    .const 'Sub' $P926 = "266_1258055895.501" 
    capture_lex $P926
    .const 'Sub' $P920 = "264_1258055895.501" 
    capture_lex $P920
    .const 'Sub' $P914 = "262_1258055895.501" 
    capture_lex $P914
    .const 'Sub' $P908 = "260_1258055895.501" 
    capture_lex $P908
    .const 'Sub' $P902 = "258_1258055895.501" 
    capture_lex $P902
    .const 'Sub' $P896 = "256_1258055895.501" 
    capture_lex $P896
    .const 'Sub' $P890 = "254_1258055895.501" 
    capture_lex $P890
    .const 'Sub' $P884 = "252_1258055895.501" 
    capture_lex $P884
    .const 'Sub' $P878 = "250_1258055895.501" 
    capture_lex $P878
    .const 'Sub' $P872 = "248_1258055895.501" 
    capture_lex $P872
    .const 'Sub' $P866 = "246_1258055895.501" 
    capture_lex $P866
    .const 'Sub' $P860 = "244_1258055895.501" 
    capture_lex $P860
    .const 'Sub' $P854 = "242_1258055895.501" 
    capture_lex $P854
    .const 'Sub' $P848 = "240_1258055895.501" 
    capture_lex $P848
    .const 'Sub' $P842 = "238_1258055895.501" 
    capture_lex $P842
    .const 'Sub' $P836 = "236_1258055895.501" 
    capture_lex $P836
    .const 'Sub' $P830 = "234_1258055895.501" 
    capture_lex $P830
    .const 'Sub' $P824 = "232_1258055895.501" 
    capture_lex $P824
    .const 'Sub' $P818 = "230_1258055895.501" 
    capture_lex $P818
    .const 'Sub' $P812 = "228_1258055895.501" 
    capture_lex $P812
    .const 'Sub' $P806 = "226_1258055895.501" 
    capture_lex $P806
    .const 'Sub' $P800 = "224_1258055895.501" 
    capture_lex $P800
    .const 'Sub' $P794 = "222_1258055895.501" 
    capture_lex $P794
    .const 'Sub' $P788 = "220_1258055895.501" 
    capture_lex $P788
    .const 'Sub' $P782 = "218_1258055895.501" 
    capture_lex $P782
    .const 'Sub' $P776 = "216_1258055895.501" 
    capture_lex $P776
    .const 'Sub' $P770 = "214_1258055895.501" 
    capture_lex $P770
    .const 'Sub' $P764 = "212_1258055895.501" 
    capture_lex $P764
    .const 'Sub' $P758 = "210_1258055895.501" 
    capture_lex $P758
    .const 'Sub' $P753 = "208_1258055895.501" 
    capture_lex $P753
    .const 'Sub' $P748 = "206_1258055895.501" 
    capture_lex $P748
    .const 'Sub' $P744 = "204_1258055895.501" 
    capture_lex $P744
    .const 'Sub' $P739 = "202_1258055895.501" 
    capture_lex $P739
    .const 'Sub' $P734 = "200_1258055895.501" 
    capture_lex $P734
    .const 'Sub' $P730 = "198_1258055895.501" 
    capture_lex $P730
    .const 'Sub' $P726 = "196_1258055895.501" 
    capture_lex $P726
    .const 'Sub' $P720 = "194_1258055895.501" 
    capture_lex $P720
    .const 'Sub' $P714 = "192_1258055895.501" 
    capture_lex $P714
    .const 'Sub' $P707 = "190_1258055895.501" 
    capture_lex $P707
    .const 'Sub' $P703 = "188_1258055895.501" 
    capture_lex $P703
    .const 'Sub' $P699 = "186_1258055895.501" 
    capture_lex $P699
    .const 'Sub' $P692 = "184_1258055895.501" 
    capture_lex $P692
    .const 'Sub' $P685 = "182_1258055895.501" 
    capture_lex $P685
    .const 'Sub' $P681 = "180_1258055895.501" 
    capture_lex $P681
    .const 'Sub' $P677 = "178_1258055895.501" 
    capture_lex $P677
    .const 'Sub' $P672 = "176_1258055895.501" 
    capture_lex $P672
    .const 'Sub' $P667 = "174_1258055895.501" 
    capture_lex $P667
    .const 'Sub' $P662 = "172_1258055895.501" 
    capture_lex $P662
    .const 'Sub' $P657 = "170_1258055895.501" 
    capture_lex $P657
    .const 'Sub' $P653 = "168_1258055895.501" 
    capture_lex $P653
    .const 'Sub' $P649 = "166_1258055895.501" 
    capture_lex $P649
    .const 'Sub' $P637 = "162_1258055895.501" 
    capture_lex $P637
    .const 'Sub' $P632 = "160_1258055895.501" 
    capture_lex $P632
    .const 'Sub' $P626 = "158_1258055895.501" 
    capture_lex $P626
    .const 'Sub' $P621 = "156_1258055895.501" 
    capture_lex $P621
    .const 'Sub' $P614 = "154_1258055895.501" 
    capture_lex $P614
    .const 'Sub' $P607 = "152_1258055895.501" 
    capture_lex $P607
    .const 'Sub' $P602 = "150_1258055895.501" 
    capture_lex $P602
    .const 'Sub' $P597 = "148_1258055895.501" 
    capture_lex $P597
    .const 'Sub' $P585 = "144_1258055895.501" 
    capture_lex $P585
    .const 'Sub' $P554 = "142_1258055895.501" 
    capture_lex $P554
    .const 'Sub' $P547 = "140_1258055895.501" 
    capture_lex $P547
    .const 'Sub' $P542 = "138_1258055895.501" 
    capture_lex $P542
    .const 'Sub' $P533 = "136_1258055895.501" 
    capture_lex $P533
    .const 'Sub' $P519 = "134_1258055895.501" 
    capture_lex $P519
    .const 'Sub' $P511 = "132_1258055895.501" 
    capture_lex $P511
    .const 'Sub' $P493 = "130_1258055895.501" 
    capture_lex $P493
    .const 'Sub' $P475 = "128_1258055895.501" 
    capture_lex $P475
    .const 'Sub' $P469 = "126_1258055895.501" 
    capture_lex $P469
    .const 'Sub' $P463 = "124_1258055895.501" 
    capture_lex $P463
    .const 'Sub' $P454 = "120_1258055895.501" 
    capture_lex $P454
    .const 'Sub' $P444 = "118_1258055895.501" 
    capture_lex $P444
    .const 'Sub' $P438 = "116_1258055895.501" 
    capture_lex $P438
    .const 'Sub' $P432 = "114_1258055895.501" 
    capture_lex $P432
    .const 'Sub' $P426 = "112_1258055895.501" 
    capture_lex $P426
    .const 'Sub' $P400 = "108_1258055895.501" 
    capture_lex $P400
    .const 'Sub' $P392 = "106_1258055895.501" 
    capture_lex $P392
    .const 'Sub' $P386 = "104_1258055895.501" 
    capture_lex $P386
    .const 'Sub' $P378 = "100_1258055895.501" 
    capture_lex $P378
    .const 'Sub' $P374 = "98_1258055895.501" 
    capture_lex $P374
    .const 'Sub' $P363 = "96_1258055895.501" 
    capture_lex $P363
    .const 'Sub' $P353 = "94_1258055895.501" 
    capture_lex $P353
    .const 'Sub' $P349 = "92_1258055895.501" 
    capture_lex $P349
    .const 'Sub' $P344 = "90_1258055895.501" 
    capture_lex $P344
    .const 'Sub' $P339 = "88_1258055895.501" 
    capture_lex $P339
    .const 'Sub' $P334 = "86_1258055895.501" 
    capture_lex $P334
    .const 'Sub' $P329 = "84_1258055895.501" 
    capture_lex $P329
    .const 'Sub' $P324 = "82_1258055895.501" 
    capture_lex $P324
    .const 'Sub' $P319 = "80_1258055895.501" 
    capture_lex $P319
    .const 'Sub' $P314 = "78_1258055895.501" 
    capture_lex $P314
    .const 'Sub' $P309 = "76_1258055895.501" 
    capture_lex $P309
    .const 'Sub' $P303 = "74_1258055895.501" 
    capture_lex $P303
    .const 'Sub' $P287 = "70_1258055895.501" 
    capture_lex $P287
    .const 'Sub' $P275 = "68_1258055895.501" 
    capture_lex $P275
    .const 'Sub' $P268 = "66_1258055895.501" 
    capture_lex $P268
    .const 'Sub' $P249 = "64_1258055895.501" 
    capture_lex $P249
    .const 'Sub' $P241 = "62_1258055895.501" 
    capture_lex $P241
    .const 'Sub' $P224 = "59_1258055895.501" 
    capture_lex $P224
    .const 'Sub' $P205 = "57_1258055895.501" 
    capture_lex $P205
    .const 'Sub' $P197 = "53_1258055895.501" 
    capture_lex $P197
    .const 'Sub' $P193 = "51_1258055895.501" 
    capture_lex $P193
    .const 'Sub' $P185 = "47_1258055895.501" 
    capture_lex $P185
    .const 'Sub' $P181 = "45_1258055895.501" 
    capture_lex $P181
    .const 'Sub' $P174 = "43_1258055895.501" 
    capture_lex $P174
    .const 'Sub' $P168 = "41_1258055895.501" 
    capture_lex $P168
    .const 'Sub' $P163 = "39_1258055895.501" 
    capture_lex $P163
    .const 'Sub' $P156 = "37_1258055895.501" 
    capture_lex $P156
    .const 'Sub' $P151 = "35_1258055895.501" 
    capture_lex $P151
    .const 'Sub' $P146 = "33_1258055895.501" 
    capture_lex $P146
    .const 'Sub' $P136 = "30_1258055895.501" 
    capture_lex $P136
    .const 'Sub' $P124 = "28_1258055895.501" 
    capture_lex $P124
    .const 'Sub' $P118 = "26_1258055895.501" 
    capture_lex $P118
    .const 'Sub' $P76 = "23_1258055895.501" 
    capture_lex $P76
    .const 'Sub' $P67 = "21_1258055895.501" 
    capture_lex $P67
    .const 'Sub' $P58 = "19_1258055895.501" 
    capture_lex $P58
    .const 'Sub' $P44 = "17_1258055895.501" 
    capture_lex $P44
    .const 'Sub' $P38 = "15_1258055895.501" 
    capture_lex $P38
    .const 'Sub' $P33 = "13_1258055895.501" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258055895.501" 
    capture_lex $P15
.annotate "line", 467
    get_hll_global $P986, ["NQP";"Regex"], "_block985" 
    capture_lex $P986
    $P1020 = $P986()
.annotate "line", 4
    .return ($P1020)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post300") :outer("11_1258055895.501")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 359
    get_hll_global $P1021, ["NQP"], "Grammar"
    $P1021."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 360
    get_hll_global $P1022, ["NQP"], "Grammar"
    $P1022."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 361
    get_hll_global $P1023, ["NQP"], "Grammar"
    $P1023."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 362
    get_hll_global $P1024, ["NQP"], "Grammar"
    $P1024."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 363
    get_hll_global $P1025, ["NQP"], "Grammar"
    $P1025."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 364
    get_hll_global $P1026, ["NQP"], "Grammar"
    $P1026."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 365
    get_hll_global $P1027, ["NQP"], "Grammar"
    $P1027."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 366
    get_hll_global $P1028, ["NQP"], "Grammar"
    $P1028."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 367
    get_hll_global $P1029, ["NQP"], "Grammar"
    $P1029."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 368
    get_hll_global $P1030, ["NQP"], "Grammar"
    $P1030."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 369
    get_hll_global $P1031, ["NQP"], "Grammar"
    $P1031."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 370
    get_hll_global $P1032, ["NQP"], "Grammar"
    $P1032."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 371
    get_hll_global $P1033, ["NQP"], "Grammar"
    $P1033."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 372
    get_hll_global $P1034, ["NQP"], "Grammar"
    $P1034."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 358
    $P1035 = get_root_global ["parrot"], "P6metaclass"
    $P1035."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258055895.501") :method :outer("11_1258055895.501")
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
    unless_null $P20, vivify_301
    die "Contextual %*LANG not found"
  vivify_301:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_302
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P22
  vivify_302:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_303
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P24
  vivify_303:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_304
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P26
  vivify_304:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_305
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P28
  vivify_305:
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
.sub "identifier"  :subid("13_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__identifier"  :subid("14_1258055895.501") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__name"  :subid("16_1258055895.501") :method
.annotate "line", 4
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__deflongname"  :subid("18_1258055895.501") :method
.annotate "line", 4
    $P47 = self."!PREFIX__!subrule"("identifier", "")
    new $P48, "ResizablePMCArray"
    push $P48, $P47
    .return ($P48)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258055895.501") :method
.annotate "line", 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__ws"  :subid("22_1258055895.501") :method
.annotate "line", 4
    new $P70, "ResizablePMCArray"
    push $P70, ""
    push $P70, ""
    .return ($P70)
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("23_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .const 'Sub' $P110 = "25_1258055895.501" 
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
    .const 'Sub' $P110 = "25_1258055895.501" 
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
.sub "!PREFIX__pod_comment"  :subid("24_1258055895.501") :method
.annotate "line", 4
    new $P79, "ResizablePMCArray"
    push $P79, ""
    .return ($P79)
.end


.namespace ["NQP";"Grammar"]
.sub "_block109"  :anon :subid("25_1258055895.501") :method :outer("23_1258055895.501")
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
.sub "comp_unit"  :subid("26_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__comp_unit"  :subid("27_1258055895.501") :method
.annotate "line", 4
    $P121 = self."!PREFIX__!subrule"("newpad", "")
    new $P122, "ResizablePMCArray"
    push $P122, $P121
    .return ($P122)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("28_1258055895.501") :method :outer("11_1258055895.501")
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
.sub "!PREFIX__statementlist"  :subid("29_1258055895.501") :method
.annotate "line", 4
    new $P127, "ResizablePMCArray"
    push $P127, ""
    push $P127, ""
    .return ($P127)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("30_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .const 'Sub' $P141 = "32_1258055895.501" 
    capture_lex $P141
    .local string rx137_tgt
    .local int rx137_pos
    .local int rx137_off
    .local int rx137_eos
    .local int rx137_rep
    .local pmc rx137_cur
    (rx137_cur, rx137_pos, rx137_tgt, $I10) = self."!cursor_start"()
    rx137_cur."!cursor_debug"("START ", "statement")
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
    .const 'Sub' $P141 = "32_1258055895.501" 
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
.sub "!PREFIX__statement"  :subid("31_1258055895.501") :method
.annotate "line", 4
    new $P139, "ResizablePMCArray"
    push $P139, ""
    .return ($P139)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("32_1258055895.501") :method :outer("30_1258055895.501")
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
.sub "eat_terminator"  :subid("33_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt, $I10) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx147_cur
    .local pmc match
    .lex "$/", match
    length rx147_eos, rx147_tgt
    set rx147_off, 0
    lt $I10, 2, rx147_start
    sub rx147_off, $I10, 1
    substr rx147_tgt, rx147_tgt, rx147_off
  rx147_start:
  alt150_0:
.annotate "line", 85
    set_addr $I10, alt150_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 86
  # rx literal  ";"
    add $I11, rx147_pos, 1
    gt $I11, rx147_eos, rx147_fail
    sub $I11, rx147_pos, rx147_off
    substr $S10, rx147_tgt, $I11, 1
    ne $S10, ";", rx147_fail
    add rx147_pos, 1
    goto alt150_end
  alt150_1:
    set_addr $I10, alt150_2
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 87
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."MARKED"("endstmt")
    unless $P10, rx147_fail
    goto alt150_end
  alt150_2:
    set_addr $I10, alt150_3
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
.annotate "line", 88
  # rx subrule "terminator" subtype=zerowidth negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."terminator"()
    unless $P10, rx147_fail
    goto alt150_end
  alt150_3:
.annotate "line", 89
  # rxanchor eos
    ne rx147_pos, rx147_eos, rx147_fail
  alt150_end:
.annotate "line", 85
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "eat_terminator")
    rx147_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 4
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx147_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("34_1258055895.501") :method
.annotate "line", 4
    new $P149, "ResizablePMCArray"
    push $P149, ""
    push $P149, ""
    push $P149, ""
    push $P149, ";"
    .return ($P149)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("35_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    (rx152_cur, rx152_pos, rx152_tgt, $I10) = self."!cursor_start"()
    rx152_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    set rx152_off, 0
    lt $I10, 2, rx152_start
    sub rx152_off, $I10, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."EXPR"()
    unless $P10, rx152_fail
    rx152_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx152_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."ws"()
    unless $P10, rx152_fail
    rx152_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."pblock"()
    unless $P10, rx152_fail
    rx152_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx152_pos = $P10."pos"()
.annotate "line", 92
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "xblock")
    rx152_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx152_pos)
    .return (rx152_cur)
  rx152_fail:
.annotate "line", 4
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    rx152_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx152_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("36_1258055895.501") :method
.annotate "line", 4
    $P154 = self."!PREFIX__!subrule"("EXPR", "")
    new $P155, "ResizablePMCArray"
    push $P155, $P154
    .return ($P155)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("37_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx157_tgt
    .local int rx157_pos
    .local int rx157_off
    .local int rx157_eos
    .local int rx157_rep
    .local pmc rx157_cur
    (rx157_cur, rx157_pos, rx157_tgt, $I10) = self."!cursor_start"()
    rx157_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx157_cur
    .local pmc match
    .lex "$/", match
    length rx157_eos, rx157_tgt
    set rx157_off, 0
    lt $I10, 2, rx157_start
    sub rx157_off, $I10, 1
    substr rx157_tgt, rx157_tgt, rx157_off
  rx157_start:
  alt162_0:
.annotate "line", 96
    set_addr $I10, alt162_1
    rx157_cur."!mark_push"(0, rx157_pos, $I10)
.annotate "line", 97
  # rx subrule "lambda" subtype=method negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."lambda"()
    unless $P10, rx157_fail
    rx157_pos = $P10."pos"()
.annotate "line", 98
  # rx subrule "newpad" subtype=method negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."newpad"()
    unless $P10, rx157_fail
    rx157_pos = $P10."pos"()
.annotate "line", 99
  # rx subrule "signature" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."signature"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx157_pos = $P10."pos"()
.annotate "line", 100
  # rx subrule "blockoid" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."blockoid"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx157_pos = $P10."pos"()
.annotate "line", 97
    goto alt162_end
  alt162_1:
    set_addr $I10, alt162_2
    rx157_cur."!mark_push"(0, rx157_pos, $I10)
.annotate "line", 101
  # rx enumcharlist negate=0 zerowidth
    ge rx157_pos, rx157_eos, rx157_fail
    sub $I10, rx157_pos, rx157_off
    substr $S10, rx157_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx157_fail
.annotate "line", 102
  # rx subrule "newpad" subtype=method negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."newpad"()
    unless $P10, rx157_fail
    rx157_pos = $P10."pos"()
.annotate "line", 103
  # rx subrule "blockoid" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."blockoid"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx157_pos = $P10."pos"()
.annotate "line", 101
    goto alt162_end
  alt162_2:
.annotate "line", 104
  # rx subrule "panic" subtype=method negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."panic"("Missing block")
    unless $P10, rx157_fail
    rx157_pos = $P10."pos"()
  alt162_end:
.annotate "line", 96
  # rx pass
    rx157_cur."!cursor_pass"(rx157_pos, "pblock")
    rx157_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx157_pos)
    .return (rx157_cur)
  rx157_fail:
.annotate "line", 4
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    rx157_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx157_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("38_1258055895.501") :method
.annotate "line", 4
    $P159 = self."!PREFIX__!subrule"("panic", "")
    $P160 = self."!PREFIX__!subrule"("lambda", "")
    new $P161, "ResizablePMCArray"
    push $P161, $P159
    push $P161, "{"
    push $P161, $P160
    .return ($P161)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("39_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    (rx164_cur, rx164_pos, rx164_tgt, $I10) = self."!cursor_start"()
    rx164_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx164_cur
    .local pmc match
    .lex "$/", match
    length rx164_eos, rx164_tgt
    set rx164_off, 0
    lt $I10, 2, rx164_start
    sub rx164_off, $I10, 1
    substr rx164_tgt, rx164_tgt, rx164_off
  rx164_start:
  alt167_0:
.annotate "line", 107
    set_addr $I10, alt167_1
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  # rx literal  "->"
    add $I11, rx164_pos, 2
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 2
    ne $S10, "->", rx164_fail
    add rx164_pos, 2
    goto alt167_end
  alt167_1:
  # rx literal  "<->"
    add $I11, rx164_pos, 3
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 3
    ne $S10, "<->", rx164_fail
    add rx164_pos, 3
  alt167_end:
  # rx pass
    rx164_cur."!cursor_pass"(rx164_pos, "lambda")
    rx164_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx164_pos)
    .return (rx164_cur)
  rx164_fail:
.annotate "line", 4
    (rx164_rep, rx164_pos, $I10, $P10) = rx164_cur."!mark_fail"(0)
    lt rx164_pos, -1, rx164_done
    eq rx164_pos, -1, rx164_fail
    jump $I10
  rx164_done:
    rx164_cur."!cursor_fail"()
    rx164_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx164_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("40_1258055895.501") :method
.annotate "line", 4
    new $P166, "ResizablePMCArray"
    push $P166, "<->"
    push $P166, "->"
    .return ($P166)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("41_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt, $I10) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx169_cur
    .local pmc match
    .lex "$/", match
    length rx169_eos, rx169_tgt
    set rx169_off, 0
    lt $I10, 2, rx169_start
    sub rx169_off, $I10, 1
    substr rx169_tgt, rx169_tgt, rx169_off
  rx169_start:
  alt173_0:
.annotate "line", 110
    set_addr $I10, alt173_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx169_pos, rx169_eos, rx169_fail
    sub $I10, rx169_pos, rx169_off
    substr $S10, rx169_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx169_fail
    goto alt173_end
  alt173_1:
  # rx subrule "panic" subtype=method negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."panic"("Missing block")
    unless $P10, rx169_fail
    rx169_pos = $P10."pos"()
  alt173_end:
.annotate "line", 111
  # rx subrule "newpad" subtype=method negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."newpad"()
    unless $P10, rx169_fail
    rx169_pos = $P10."pos"()
.annotate "line", 112
  # rx subrule "blockoid" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."blockoid"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx169_pos = $P10."pos"()
.annotate "line", 109
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "block")
    rx169_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
.annotate "line", 4
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("42_1258055895.501") :method
.annotate "line", 4
    $P171 = self."!PREFIX__!subrule"("panic", "")
    new $P172, "ResizablePMCArray"
    push $P172, $P171
    push $P172, "{"
    .return ($P172)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("43_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx175_tgt
    .local int rx175_pos
    .local int rx175_off
    .local int rx175_eos
    .local int rx175_rep
    .local pmc rx175_cur
    (rx175_cur, rx175_pos, rx175_tgt, $I10) = self."!cursor_start"()
    rx175_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx175_cur
    .local pmc match
    .lex "$/", match
    length rx175_eos, rx175_tgt
    set rx175_off, 0
    lt $I10, 2, rx175_start
    sub rx175_off, $I10, 1
    substr rx175_tgt, rx175_tgt, rx175_off
  rx175_start:
.annotate "line", 116
  # rx subrule "finishpad" subtype=method negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."finishpad"()
    unless $P10, rx175_fail
    rx175_pos = $P10."pos"()
.annotate "line", 117
  # rx literal  "{"
    add $I11, rx175_pos, 1
    gt $I11, rx175_eos, rx175_fail
    sub $I11, rx175_pos, rx175_off
    substr $S10, rx175_tgt, $I11, 1
    ne $S10, "{", rx175_fail
    add rx175_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."statementlist"()
    unless $P10, rx175_fail
    rx175_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx175_pos = $P10."pos"()
  alt179_0:
    set_addr $I10, alt179_1
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
  # rx literal  "}"
    add $I11, rx175_pos, 1
    gt $I11, rx175_eos, rx175_fail
    sub $I11, rx175_pos, rx175_off
    substr $S10, rx175_tgt, $I11, 1
    ne $S10, "}", rx175_fail
    add rx175_pos, 1
    goto alt179_end
  alt179_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."FAILGOAL"("'}'")
    unless $P10, rx175_fail
    rx175_pos = $P10."pos"()
  alt179_end:
.annotate "line", 118
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx175_cur."!cursor_pos"(rx175_pos)
    $P10 = rx175_cur."ENDSTMT"()
    unless $P10, rx175_fail
.annotate "line", 115
  # rx pass
    rx175_cur."!cursor_pass"(rx175_pos, "blockoid")
    rx175_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx175_pos)
    .return (rx175_cur)
  rx175_fail:
.annotate "line", 4
    (rx175_rep, rx175_pos, $I10, $P10) = rx175_cur."!mark_fail"(0)
    lt rx175_pos, -1, rx175_done
    eq rx175_pos, -1, rx175_fail
    jump $I10
  rx175_done:
    rx175_cur."!cursor_fail"()
    rx175_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx175_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("44_1258055895.501") :method
.annotate "line", 4
    $P177 = self."!PREFIX__!subrule"("finishpad", "")
    new $P178, "ResizablePMCArray"
    push $P178, $P177
    .return ($P178)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("45_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx182_tgt
    .local int rx182_pos
    .local int rx182_off
    .local int rx182_eos
    .local int rx182_rep
    .local pmc rx182_cur
    (rx182_cur, rx182_pos, rx182_tgt, $I10) = self."!cursor_start"()
    rx182_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx182_cur
    .local pmc match
    .lex "$/", match
    length rx182_eos, rx182_tgt
    set rx182_off, 0
    lt $I10, 2, rx182_start
    sub rx182_off, $I10, 1
    substr rx182_tgt, rx182_tgt, rx182_off
  rx182_start:
.annotate "line", 121
  # rx pass
    rx182_cur."!cursor_pass"(rx182_pos, "newpad")
    rx182_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx182_pos)
    .return (rx182_cur)
  rx182_fail:
.annotate "line", 4
    (rx182_rep, rx182_pos, $I10, $P10) = rx182_cur."!mark_fail"(0)
    lt rx182_pos, -1, rx182_done
    eq rx182_pos, -1, rx182_fail
    jump $I10
  rx182_done:
    rx182_cur."!cursor_fail"()
    rx182_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx182_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("46_1258055895.501") :method
.annotate "line", 4
    new $P184, "ResizablePMCArray"
    push $P184, ""
    .return ($P184)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("47_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx186_tgt
    .local int rx186_pos
    .local int rx186_off
    .local int rx186_eos
    .local int rx186_rep
    .local pmc rx186_cur
    (rx186_cur, rx186_pos, rx186_tgt, $I10) = self."!cursor_start"()
    rx186_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx186_cur
    .local pmc match
    .lex "$/", match
    length rx186_eos, rx186_tgt
    set rx186_off, 0
    lt $I10, 2, rx186_start
    sub rx186_off, $I10, 1
    substr rx186_tgt, rx186_tgt, rx186_off
  rx186_start:
.annotate "line", 122
  # rx pass
    rx186_cur."!cursor_pass"(rx186_pos, "finishpad")
    rx186_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx186_pos)
    .return (rx186_cur)
  rx186_fail:
.annotate "line", 4
    (rx186_rep, rx186_pos, $I10, $P10) = rx186_cur."!mark_fail"(0)
    lt rx186_pos, -1, rx186_done
    eq rx186_pos, -1, rx186_fail
    jump $I10
  rx186_done:
    rx186_cur."!cursor_fail"()
    rx186_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx186_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("48_1258055895.501") :method
.annotate "line", 4
    new $P188, "ResizablePMCArray"
    push $P188, ""
    .return ($P188)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("49_1258055895.501") :method
.annotate "line", 124
    $P190 = self."!protoregex"("terminator")
    .return ($P190)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("50_1258055895.501") :method
.annotate "line", 124
    $P192 = self."!PREFIX__!protoregex"("terminator")
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("51_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx194_tgt
    .local int rx194_pos
    .local int rx194_off
    .local int rx194_eos
    .local int rx194_rep
    .local pmc rx194_cur
    (rx194_cur, rx194_pos, rx194_tgt, $I10) = self."!cursor_start"()
    rx194_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx194_cur
    .local pmc match
    .lex "$/", match
    length rx194_eos, rx194_tgt
    set rx194_off, 0
    lt $I10, 2, rx194_start
    sub rx194_off, $I10, 1
    substr rx194_tgt, rx194_tgt, rx194_off
  rx194_start:
.annotate "line", 126
  # rx enumcharlist negate=0 zerowidth
    ge rx194_pos, rx194_eos, rx194_fail
    sub $I10, rx194_pos, rx194_off
    substr $S10, rx194_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx194_fail
  # rx pass
    rx194_cur."!cursor_pass"(rx194_pos, "terminator:sym<;>")
    rx194_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx194_pos)
    .return (rx194_cur)
  rx194_fail:
.annotate "line", 4
    (rx194_rep, rx194_pos, $I10, $P10) = rx194_cur."!mark_fail"(0)
    lt rx194_pos, -1, rx194_done
    eq rx194_pos, -1, rx194_fail
    jump $I10
  rx194_done:
    rx194_cur."!cursor_fail"()
    rx194_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx194_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("52_1258055895.501") :method
.annotate "line", 4
    new $P196, "ResizablePMCArray"
    push $P196, ";"
    .return ($P196)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("53_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx198_tgt
    .local int rx198_pos
    .local int rx198_off
    .local int rx198_eos
    .local int rx198_rep
    .local pmc rx198_cur
    (rx198_cur, rx198_pos, rx198_tgt, $I10) = self."!cursor_start"()
    rx198_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx198_cur
    .local pmc match
    .lex "$/", match
    length rx198_eos, rx198_tgt
    set rx198_off, 0
    lt $I10, 2, rx198_start
    sub rx198_off, $I10, 1
    substr rx198_tgt, rx198_tgt, rx198_off
  rx198_start:
.annotate "line", 127
  # rx enumcharlist negate=0 zerowidth
    ge rx198_pos, rx198_eos, rx198_fail
    sub $I10, rx198_pos, rx198_off
    substr $S10, rx198_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx198_fail
  # rx pass
    rx198_cur."!cursor_pass"(rx198_pos, "terminator:sym<}>")
    rx198_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx198_pos)
    .return (rx198_cur)
  rx198_fail:
.annotate "line", 4
    (rx198_rep, rx198_pos, $I10, $P10) = rx198_cur."!mark_fail"(0)
    lt rx198_pos, -1, rx198_done
    eq rx198_pos, -1, rx198_fail
    jump $I10
  rx198_done:
    rx198_cur."!cursor_fail"()
    rx198_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx198_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("54_1258055895.501") :method
.annotate "line", 4
    new $P200, "ResizablePMCArray"
    push $P200, "}"
    .return ($P200)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("55_1258055895.501") :method
.annotate "line", 131
    $P202 = self."!protoregex"("statement_control")
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("56_1258055895.501") :method
.annotate "line", 131
    $P204 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P204)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("57_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    (rx206_cur, rx206_pos, rx206_tgt, $I10) = self."!cursor_start"()
    rx206_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx206_cur."!cursor_caparray"("xblock", "else")
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    set rx206_off, 0
    lt $I10, 2, rx206_start
    sub rx206_off, $I10, 1
    substr rx206_tgt, rx206_tgt, rx206_off
  rx206_start:
.annotate "line", 134
  # rx subcapture "sym"
    set_addr $I10, rxcap_209_fail
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  # rx literal  "if"
    add $I11, rx206_pos, 2
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 2
    ne $S10, "if", rx206_fail
    add rx206_pos, 2
    set_addr $I10, rxcap_209_fail
    ($I12, $I11) = rx206_cur."!mark_peek"($I10)
    rx206_cur."!cursor_pos"($I11)
    ($P10) = rx206_cur."!cursor_start"()
    $P10."!cursor_pass"(rx206_pos, "")
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_209_done
  rxcap_209_fail:
    goto rx206_fail
  rxcap_209_done:
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
.annotate "line", 135
  # rx subrule "xblock" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."xblock"()
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx206_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
.annotate "line", 136
  # rx rxquantr212 ** 0..*
    set_addr $I216, rxquantr212_done
    rx206_cur."!mark_push"(0, rx206_pos, $I216)
  rxquantr212_loop:
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx206_pos, 5
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 5
    ne $S10, "elsif", rx206_fail
    add rx206_pos, 5
  # rx charclass s
    ge rx206_pos, rx206_eos, rx206_fail
    sub $I10, rx206_pos, rx206_off
    is_cclass $I11, 32, rx206_tgt, $I10
    unless $I11, rx206_fail
    inc rx206_pos
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."xblock"()
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx206_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
    (rx206_rep) = rx206_cur."!mark_commit"($I216)
    rx206_cur."!mark_push"(rx206_rep, rx206_pos, $I216)
    goto rxquantr212_loop
  rxquantr212_done:
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
.annotate "line", 137
  # rx rxquantr218 ** 0..1
    set_addr $I222, rxquantr218_done
    rx206_cur."!mark_push"(0, rx206_pos, $I222)
  rxquantr218_loop:
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx206_pos, 4
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 4
    ne $S10, "else", rx206_fail
    add rx206_pos, 4
  # rx charclass s
    ge rx206_pos, rx206_eos, rx206_fail
    sub $I10, rx206_pos, rx206_off
    is_cclass $I11, 32, rx206_tgt, $I10
    unless $I11, rx206_fail
    inc rx206_pos
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."pblock"()
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx206_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
    (rx206_rep) = rx206_cur."!mark_commit"($I222)
  rxquantr218_done:
  # rx subrule "ws" subtype=method negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."ws"()
    unless $P10, rx206_fail
    rx206_pos = $P10."pos"()
.annotate "line", 133
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "statement_control:sym<if>")
    rx206_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx206_pos)
    .return (rx206_cur)
  rx206_fail:
.annotate "line", 4
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    rx206_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx206_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("58_1258055895.501") :method
.annotate "line", 4
    new $P208, "ResizablePMCArray"
    push $P208, "if"
    .return ($P208)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("59_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .const 'Sub' $P234 = "61_1258055895.501" 
    capture_lex $P234
    .local string rx225_tgt
    .local int rx225_pos
    .local int rx225_off
    .local int rx225_eos
    .local int rx225_rep
    .local pmc rx225_cur
    (rx225_cur, rx225_pos, rx225_tgt, $I10) = self."!cursor_start"()
    rx225_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx225_cur
    .local pmc match
    .lex "$/", match
    length rx225_eos, rx225_tgt
    set rx225_off, 0
    lt $I10, 2, rx225_start
    sub rx225_off, $I10, 1
    substr rx225_tgt, rx225_tgt, rx225_off
  rx225_start:
.annotate "line", 141
  # rx subcapture "sym"
    set_addr $I10, rxcap_228_fail
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  # rx literal  "unless"
    add $I11, rx225_pos, 6
    gt $I11, rx225_eos, rx225_fail
    sub $I11, rx225_pos, rx225_off
    substr $S10, rx225_tgt, $I11, 6
    ne $S10, "unless", rx225_fail
    add rx225_pos, 6
    set_addr $I10, rxcap_228_fail
    ($I12, $I11) = rx225_cur."!mark_peek"($I10)
    rx225_cur."!cursor_pos"($I11)
    ($P10) = rx225_cur."!cursor_start"()
    $P10."!cursor_pass"(rx225_pos, "")
    rx225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_228_done
  rxcap_228_fail:
    goto rx225_fail
  rxcap_228_done:
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
.annotate "line", 142
  # rx subrule "xblock" subtype=capture negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."xblock"()
    unless $P10, rx225_fail
    rx225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx225_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
  alt231_0:
.annotate "line", 143
    set_addr $I10, alt231_1
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx225_cur."!cursor_pos"(rx225_pos)
    .const 'Sub' $P234 = "61_1258055895.501" 
    capture_lex $P234
    $P10 = rx225_cur."before"($P234)
    if $P10, rx225_fail
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
    goto alt231_end
  alt231_1:
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
  alt231_end:
  # rx subrule "ws" subtype=method negate=
    rx225_cur."!cursor_pos"(rx225_pos)
    $P10 = rx225_cur."ws"()
    unless $P10, rx225_fail
    rx225_pos = $P10."pos"()
.annotate "line", 140
  # rx pass
    rx225_cur."!cursor_pass"(rx225_pos, "statement_control:sym<unless>")
    rx225_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx225_pos)
    .return (rx225_cur)
  rx225_fail:
.annotate "line", 4
    (rx225_rep, rx225_pos, $I10, $P10) = rx225_cur."!mark_fail"(0)
    lt rx225_pos, -1, rx225_done
    eq rx225_pos, -1, rx225_fail
    jump $I10
  rx225_done:
    rx225_cur."!cursor_fail"()
    rx225_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx225_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("60_1258055895.501") :method
.annotate "line", 4
    new $P227, "ResizablePMCArray"
    push $P227, "unless"
    .return ($P227)
.end


.namespace ["NQP";"Grammar"]
.sub "_block233"  :anon :subid("61_1258055895.501") :method :outer("59_1258055895.501")
.annotate "line", 143
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    (rx235_cur, rx235_pos, rx235_tgt, $I10) = self."!cursor_start"()
    rx235_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    set rx235_off, 0
    lt $I10, 2, rx235_start
    sub rx235_off, $I10, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
    ge rx235_pos, 0, rxscan236_done
  rxscan236_loop:
    ($P10) = rx235_cur."from"()
    inc $P10
    set rx235_pos, $P10
    ge rx235_pos, rx235_eos, rxscan236_done
    set_addr $I10, rxscan236_loop
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  rxscan236_done:
  # rx literal  "else"
    add $I11, rx235_pos, 4
    gt $I11, rx235_eos, rx235_fail
    sub $I11, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I11, 4
    ne $S10, "else", rx235_fail
    add rx235_pos, 4
  # rx pass
    rx235_cur."!cursor_pass"(rx235_pos, "")
    rx235_cur."!cursor_debug"("PASS  ", "", " at pos=", rx235_pos)
    .return (rx235_cur)
  rx235_fail:
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    rx235_cur."!cursor_debug"("FAIL  ", "")
    .return (rx235_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("62_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx242_tgt
    .local int rx242_pos
    .local int rx242_off
    .local int rx242_eos
    .local int rx242_rep
    .local pmc rx242_cur
    (rx242_cur, rx242_pos, rx242_tgt, $I10) = self."!cursor_start"()
    rx242_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx242_cur
    .local pmc match
    .lex "$/", match
    length rx242_eos, rx242_tgt
    set rx242_off, 0
    lt $I10, 2, rx242_start
    sub rx242_off, $I10, 1
    substr rx242_tgt, rx242_tgt, rx242_off
  rx242_start:
.annotate "line", 147
  # rx subcapture "sym"
    set_addr $I10, rxcap_246_fail
    rx242_cur."!mark_push"(0, rx242_pos, $I10)
  alt245_0:
    set_addr $I10, alt245_1
    rx242_cur."!mark_push"(0, rx242_pos, $I10)
  # rx literal  "while"
    add $I11, rx242_pos, 5
    gt $I11, rx242_eos, rx242_fail
    sub $I11, rx242_pos, rx242_off
    substr $S10, rx242_tgt, $I11, 5
    ne $S10, "while", rx242_fail
    add rx242_pos, 5
    goto alt245_end
  alt245_1:
  # rx literal  "until"
    add $I11, rx242_pos, 5
    gt $I11, rx242_eos, rx242_fail
    sub $I11, rx242_pos, rx242_off
    substr $S10, rx242_tgt, $I11, 5
    ne $S10, "until", rx242_fail
    add rx242_pos, 5
  alt245_end:
    set_addr $I10, rxcap_246_fail
    ($I12, $I11) = rx242_cur."!mark_peek"($I10)
    rx242_cur."!cursor_pos"($I11)
    ($P10) = rx242_cur."!cursor_start"()
    $P10."!cursor_pass"(rx242_pos, "")
    rx242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_246_done
  rxcap_246_fail:
    goto rx242_fail
  rxcap_246_done:
  # rx subrule "ws" subtype=method negate=
    rx242_cur."!cursor_pos"(rx242_pos)
    $P10 = rx242_cur."ws"()
    unless $P10, rx242_fail
    rx242_pos = $P10."pos"()
.annotate "line", 148
  # rx subrule "xblock" subtype=capture negate=
    rx242_cur."!cursor_pos"(rx242_pos)
    $P10 = rx242_cur."xblock"()
    unless $P10, rx242_fail
    rx242_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx242_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx242_cur."!cursor_pos"(rx242_pos)
    $P10 = rx242_cur."ws"()
    unless $P10, rx242_fail
    rx242_pos = $P10."pos"()
.annotate "line", 146
  # rx pass
    rx242_cur."!cursor_pass"(rx242_pos, "statement_control:sym<while>")
    rx242_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx242_pos)
    .return (rx242_cur)
  rx242_fail:
.annotate "line", 4
    (rx242_rep, rx242_pos, $I10, $P10) = rx242_cur."!mark_fail"(0)
    lt rx242_pos, -1, rx242_done
    eq rx242_pos, -1, rx242_fail
    jump $I10
  rx242_done:
    rx242_cur."!cursor_fail"()
    rx242_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx242_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("63_1258055895.501") :method
.annotate "line", 4
    new $P244, "ResizablePMCArray"
    push $P244, "until"
    push $P244, "while"
    .return ($P244)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("64_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx250_tgt
    .local int rx250_pos
    .local int rx250_off
    .local int rx250_eos
    .local int rx250_rep
    .local pmc rx250_cur
    (rx250_cur, rx250_pos, rx250_tgt, $I10) = self."!cursor_start"()
    rx250_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx250_cur
    .local pmc match
    .lex "$/", match
    length rx250_eos, rx250_tgt
    set rx250_off, 0
    lt $I10, 2, rx250_start
    sub rx250_off, $I10, 1
    substr rx250_tgt, rx250_tgt, rx250_off
  rx250_start:
.annotate "line", 152
  # rx subcapture "sym"
    set_addr $I10, rxcap_253_fail
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx250_pos, 6
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 6
    ne $S10, "repeat", rx250_fail
    add rx250_pos, 6
    set_addr $I10, rxcap_253_fail
    ($I12, $I11) = rx250_cur."!mark_peek"($I10)
    rx250_cur."!cursor_pos"($I11)
    ($P10) = rx250_cur."!cursor_start"()
    $P10."!cursor_pass"(rx250_pos, "")
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_253_done
  rxcap_253_fail:
    goto rx250_fail
  rxcap_253_done:
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  alt255_0:
.annotate "line", 153
    set_addr $I10, alt255_1
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
.annotate "line", 154
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_258_fail
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  alt257_0:
    set_addr $I10, alt257_1
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  # rx literal  "while"
    add $I11, rx250_pos, 5
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 5
    ne $S10, "while", rx250_fail
    add rx250_pos, 5
    goto alt257_end
  alt257_1:
  # rx literal  "until"
    add $I11, rx250_pos, 5
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 5
    ne $S10, "until", rx250_fail
    add rx250_pos, 5
  alt257_end:
    set_addr $I10, rxcap_258_fail
    ($I12, $I11) = rx250_cur."!mark_peek"($I10)
    rx250_cur."!cursor_pos"($I11)
    ($P10) = rx250_cur."!cursor_start"()
    $P10."!cursor_pass"(rx250_pos, "")
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_258_done
  rxcap_258_fail:
    goto rx250_fail
  rxcap_258_done:
  # rx charclass s
    ge rx250_pos, rx250_eos, rx250_fail
    sub $I10, rx250_pos, rx250_off
    is_cclass $I11, 32, rx250_tgt, $I10
    unless $I11, rx250_fail
    inc rx250_pos
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."xblock"()
    unless $P10, rx250_fail
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx250_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
    goto alt255_end
  alt255_1:
.annotate "line", 155
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."pblock"()
    unless $P10, rx250_fail
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx250_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_264_fail
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  alt263_0:
    set_addr $I10, alt263_1
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  # rx literal  "while"
    add $I11, rx250_pos, 5
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 5
    ne $S10, "while", rx250_fail
    add rx250_pos, 5
    goto alt263_end
  alt263_1:
  # rx literal  "until"
    add $I11, rx250_pos, 5
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 5
    ne $S10, "until", rx250_fail
    add rx250_pos, 5
  alt263_end:
    set_addr $I10, rxcap_264_fail
    ($I12, $I11) = rx250_cur."!mark_peek"($I10)
    rx250_cur."!cursor_pos"($I11)
    ($P10) = rx250_cur."!cursor_start"()
    $P10."!cursor_pass"(rx250_pos, "")
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_264_done
  rxcap_264_fail:
    goto rx250_fail
  rxcap_264_done:
  # rx charclass s
    ge rx250_pos, rx250_eos, rx250_fail
    sub $I10, rx250_pos, rx250_off
    is_cclass $I11, 32, rx250_tgt, $I10
    unless $I11, rx250_fail
    inc rx250_pos
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."EXPR"()
    unless $P10, rx250_fail
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx250_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  alt255_end:
.annotate "line", 156
  # rx subrule "ws" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."ws"()
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
.annotate "line", 151
  # rx pass
    rx250_cur."!cursor_pass"(rx250_pos, "statement_control:sym<repeat>")
    rx250_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx250_pos)
    .return (rx250_cur)
  rx250_fail:
.annotate "line", 4
    (rx250_rep, rx250_pos, $I10, $P10) = rx250_cur."!mark_fail"(0)
    lt rx250_pos, -1, rx250_done
    eq rx250_pos, -1, rx250_fail
    jump $I10
  rx250_done:
    rx250_cur."!cursor_fail"()
    rx250_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx250_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("65_1258055895.501") :method
.annotate "line", 4
    new $P252, "ResizablePMCArray"
    push $P252, "repeat"
    .return ($P252)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("66_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx269_tgt
    .local int rx269_pos
    .local int rx269_off
    .local int rx269_eos
    .local int rx269_rep
    .local pmc rx269_cur
    (rx269_cur, rx269_pos, rx269_tgt, $I10) = self."!cursor_start"()
    rx269_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx269_cur
    .local pmc match
    .lex "$/", match
    length rx269_eos, rx269_tgt
    set rx269_off, 0
    lt $I10, 2, rx269_start
    sub rx269_off, $I10, 1
    substr rx269_tgt, rx269_tgt, rx269_off
  rx269_start:
.annotate "line", 160
  # rx subcapture "sym"
    set_addr $I10, rxcap_272_fail
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  # rx literal  "for"
    add $I11, rx269_pos, 3
    gt $I11, rx269_eos, rx269_fail
    sub $I11, rx269_pos, rx269_off
    substr $S10, rx269_tgt, $I11, 3
    ne $S10, "for", rx269_fail
    add rx269_pos, 3
    set_addr $I10, rxcap_272_fail
    ($I12, $I11) = rx269_cur."!mark_peek"($I10)
    rx269_cur."!cursor_pos"($I11)
    ($P10) = rx269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx269_pos, "")
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_272_done
  rxcap_272_fail:
    goto rx269_fail
  rxcap_272_done:
  # rx subrule "ws" subtype=method negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    $P10 = rx269_cur."ws"()
    unless $P10, rx269_fail
    rx269_pos = $P10."pos"()
.annotate "line", 161
  # rx subrule "xblock" subtype=capture negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    $P10 = rx269_cur."xblock"()
    unless $P10, rx269_fail
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx269_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    $P10 = rx269_cur."ws"()
    unless $P10, rx269_fail
    rx269_pos = $P10."pos"()
.annotate "line", 159
  # rx pass
    rx269_cur."!cursor_pass"(rx269_pos, "statement_control:sym<for>")
    rx269_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx269_pos)
    .return (rx269_cur)
  rx269_fail:
.annotate "line", 4
    (rx269_rep, rx269_pos, $I10, $P10) = rx269_cur."!mark_fail"(0)
    lt rx269_pos, -1, rx269_done
    eq rx269_pos, -1, rx269_fail
    jump $I10
  rx269_done:
    rx269_cur."!cursor_fail"()
    rx269_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx269_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("67_1258055895.501") :method
.annotate "line", 4
    new $P271, "ResizablePMCArray"
    push $P271, "for"
    .return ($P271)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<return>"  :subid("68_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx276_tgt
    .local int rx276_pos
    .local int rx276_off
    .local int rx276_eos
    .local int rx276_rep
    .local pmc rx276_cur
    (rx276_cur, rx276_pos, rx276_tgt, $I10) = self."!cursor_start"()
    rx276_cur."!cursor_debug"("START ", "statement_control:sym<return>")
    .lex unicode:"$\x{a2}", rx276_cur
    .local pmc match
    .lex "$/", match
    length rx276_eos, rx276_tgt
    set rx276_off, 0
    lt $I10, 2, rx276_start
    sub rx276_off, $I10, 1
    substr rx276_tgt, rx276_tgt, rx276_off
  rx276_start:
.annotate "line", 165
  # rx subcapture "sym"
    set_addr $I10, rxcap_279_fail
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
  # rx literal  "return"
    add $I11, rx276_pos, 6
    gt $I11, rx276_eos, rx276_fail
    sub $I11, rx276_pos, rx276_off
    substr $S10, rx276_tgt, $I11, 6
    ne $S10, "return", rx276_fail
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
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt281_0:
.annotate "line", 166
    set_addr $I10, alt281_1
    rx276_cur."!mark_push"(0, rx276_pos, $I10)
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
    goto alt281_end
  alt281_1:
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."panic"("return requires an expression argument")
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
  alt281_end:
  # rx subrule "ws" subtype=method negate=
    rx276_cur."!cursor_pos"(rx276_pos)
    $P10 = rx276_cur."ws"()
    unless $P10, rx276_fail
    rx276_pos = $P10."pos"()
.annotate "line", 164
  # rx pass
    rx276_cur."!cursor_pass"(rx276_pos, "statement_control:sym<return>")
    rx276_cur."!cursor_debug"("PASS  ", "statement_control:sym<return>", " at pos=", rx276_pos)
    .return (rx276_cur)
  rx276_fail:
.annotate "line", 4
    (rx276_rep, rx276_pos, $I10, $P10) = rx276_cur."!mark_fail"(0)
    lt rx276_pos, -1, rx276_done
    eq rx276_pos, -1, rx276_fail
    jump $I10
  rx276_done:
    rx276_cur."!cursor_fail"()
    rx276_cur."!cursor_debug"("FAIL  ", "statement_control:sym<return>")
    .return (rx276_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<return>"  :subid("69_1258055895.501") :method
.annotate "line", 4
    new $P278, "ResizablePMCArray"
    push $P278, "return"
    .return ($P278)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<make>"  :subid("70_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx288_tgt
    .local int rx288_pos
    .local int rx288_off
    .local int rx288_eos
    .local int rx288_rep
    .local pmc rx288_cur
    (rx288_cur, rx288_pos, rx288_tgt, $I10) = self."!cursor_start"()
    rx288_cur."!cursor_debug"("START ", "statement_control:sym<make>")
    .lex unicode:"$\x{a2}", rx288_cur
    .local pmc match
    .lex "$/", match
    length rx288_eos, rx288_tgt
    set rx288_off, 0
    lt $I10, 2, rx288_start
    sub rx288_off, $I10, 1
    substr rx288_tgt, rx288_tgt, rx288_off
  rx288_start:
.annotate "line", 170
  # rx subcapture "sym"
    set_addr $I10, rxcap_291_fail
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  # rx literal  "make"
    add $I11, rx288_pos, 4
    gt $I11, rx288_eos, rx288_fail
    sub $I11, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I11, 4
    ne $S10, "make", rx288_fail
    add rx288_pos, 4
    set_addr $I10, rxcap_291_fail
    ($I12, $I11) = rx288_cur."!mark_peek"($I10)
    rx288_cur."!cursor_pos"($I11)
    ($P10) = rx288_cur."!cursor_start"()
    $P10."!cursor_pass"(rx288_pos, "")
    rx288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_291_done
  rxcap_291_fail:
    goto rx288_fail
  rxcap_291_done:
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
  alt293_0:
.annotate "line", 171
    set_addr $I10, alt293_1
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."EXPR"()
    unless $P10, rx288_fail
    rx288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx288_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
    goto alt293_end
  alt293_1:
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."panic"("make requires an expression argument")
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
  alt293_end:
  # rx subrule "ws" subtype=method negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."ws"()
    unless $P10, rx288_fail
    rx288_pos = $P10."pos"()
.annotate "line", 169
  # rx pass
    rx288_cur."!cursor_pass"(rx288_pos, "statement_control:sym<make>")
    rx288_cur."!cursor_debug"("PASS  ", "statement_control:sym<make>", " at pos=", rx288_pos)
    .return (rx288_cur)
  rx288_fail:
.annotate "line", 4
    (rx288_rep, rx288_pos, $I10, $P10) = rx288_cur."!mark_fail"(0)
    lt rx288_pos, -1, rx288_done
    eq rx288_pos, -1, rx288_fail
    jump $I10
  rx288_done:
    rx288_cur."!cursor_fail"()
    rx288_cur."!cursor_debug"("FAIL  ", "statement_control:sym<make>")
    .return (rx288_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<make>"  :subid("71_1258055895.501") :method
.annotate "line", 4
    new $P290, "ResizablePMCArray"
    push $P290, "make"
    .return ($P290)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("72_1258055895.501") :method
.annotate "line", 174
    $P300 = self."!protoregex"("statement_prefix")
    .return ($P300)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("73_1258055895.501") :method
.annotate "line", 174
    $P302 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P302)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("74_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx304_tgt
    .local int rx304_pos
    .local int rx304_off
    .local int rx304_eos
    .local int rx304_rep
    .local pmc rx304_cur
    (rx304_cur, rx304_pos, rx304_tgt, $I10) = self."!cursor_start"()
    rx304_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx304_cur
    .local pmc match
    .lex "$/", match
    length rx304_eos, rx304_tgt
    set rx304_off, 0
    lt $I10, 2, rx304_start
    sub rx304_off, $I10, 1
    substr rx304_tgt, rx304_tgt, rx304_off
  rx304_start:
.annotate "line", 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_308_fail
    rx304_cur."!mark_push"(0, rx304_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx304_pos, 4
    gt $I11, rx304_eos, rx304_fail
    sub $I11, rx304_pos, rx304_off
    substr $S10, rx304_tgt, $I11, 4
    ne $S10, "INIT", rx304_fail
    add rx304_pos, 4
    set_addr $I10, rxcap_308_fail
    ($I12, $I11) = rx304_cur."!mark_peek"($I10)
    rx304_cur."!cursor_pos"($I11)
    ($P10) = rx304_cur."!cursor_start"()
    $P10."!cursor_pass"(rx304_pos, "")
    rx304_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_308_done
  rxcap_308_fail:
    goto rx304_fail
  rxcap_308_done:
  # rx subrule "blorst" subtype=capture negate=
    rx304_cur."!cursor_pos"(rx304_pos)
    $P10 = rx304_cur."blorst"()
    unless $P10, rx304_fail
    rx304_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx304_pos = $P10."pos"()
  # rx pass
    rx304_cur."!cursor_pass"(rx304_pos, "statement_prefix:sym<INIT>")
    rx304_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx304_pos)
    .return (rx304_cur)
  rx304_fail:
.annotate "line", 4
    (rx304_rep, rx304_pos, $I10, $P10) = rx304_cur."!mark_fail"(0)
    lt rx304_pos, -1, rx304_done
    eq rx304_pos, -1, rx304_fail
    jump $I10
  rx304_done:
    rx304_cur."!cursor_fail"()
    rx304_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx304_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("75_1258055895.501") :method
.annotate "line", 4
    $P306 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P307, "ResizablePMCArray"
    push $P307, $P306
    .return ($P307)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("76_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx310_tgt
    .local int rx310_pos
    .local int rx310_off
    .local int rx310_eos
    .local int rx310_rep
    .local pmc rx310_cur
    (rx310_cur, rx310_pos, rx310_tgt, $I10) = self."!cursor_start"()
    rx310_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx310_cur
    .local pmc match
    .lex "$/", match
    length rx310_eos, rx310_tgt
    set rx310_off, 0
    lt $I10, 2, rx310_start
    sub rx310_off, $I10, 1
    substr rx310_tgt, rx310_tgt, rx310_off
  rx310_start:
.annotate "line", 178
  # rx charclass s
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    is_cclass $I11, 32, rx310_tgt, $I10
    unless $I11, rx310_fail
    inc rx310_pos
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  alt313_0:
    set_addr $I10, alt313_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx310_fail
  # rx subrule "block" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."block"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx310_pos = $P10."pos"()
    goto alt313_end
  alt313_1:
  # rx subrule "statement" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."statement"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx310_pos = $P10."pos"()
  alt313_end:
.annotate "line", 177
  # rx pass
    rx310_cur."!cursor_pass"(rx310_pos, "blorst")
    rx310_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx310_pos)
    .return (rx310_cur)
  rx310_fail:
.annotate "line", 4
    (rx310_rep, rx310_pos, $I10, $P10) = rx310_cur."!mark_fail"(0)
    lt rx310_pos, -1, rx310_done
    eq rx310_pos, -1, rx310_fail
    jump $I10
  rx310_done:
    rx310_cur."!cursor_fail"()
    rx310_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx310_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("77_1258055895.501") :method
.annotate "line", 4
    new $P312, "ResizablePMCArray"
    push $P312, ""
    .return ($P312)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("78_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx315_tgt
    .local int rx315_pos
    .local int rx315_off
    .local int rx315_eos
    .local int rx315_rep
    .local pmc rx315_cur
    (rx315_cur, rx315_pos, rx315_tgt, $I10) = self."!cursor_start"()
    rx315_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx315_cur
    .local pmc match
    .lex "$/", match
    length rx315_eos, rx315_tgt
    set rx315_off, 0
    lt $I10, 2, rx315_start
    sub rx315_off, $I10, 1
    substr rx315_tgt, rx315_tgt, rx315_off
  rx315_start:
.annotate "line", 183
  # rx subrule "colonpair" subtype=capture negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."colonpair"()
    unless $P10, rx315_fail
    rx315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx315_pos = $P10."pos"()
  # rx pass
    rx315_cur."!cursor_pass"(rx315_pos, "term:sym<colonpair>")
    rx315_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx315_pos)
    .return (rx315_cur)
  rx315_fail:
.annotate "line", 4
    (rx315_rep, rx315_pos, $I10, $P10) = rx315_cur."!mark_fail"(0)
    lt rx315_pos, -1, rx315_done
    eq rx315_pos, -1, rx315_fail
    jump $I10
  rx315_done:
    rx315_cur."!cursor_fail"()
    rx315_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx315_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("79_1258055895.501") :method
.annotate "line", 4
    $P317 = self."!PREFIX__!subrule"("colonpair", "")
    new $P318, "ResizablePMCArray"
    push $P318, $P317
    .return ($P318)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("80_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx320_tgt
    .local int rx320_pos
    .local int rx320_off
    .local int rx320_eos
    .local int rx320_rep
    .local pmc rx320_cur
    (rx320_cur, rx320_pos, rx320_tgt, $I10) = self."!cursor_start"()
    rx320_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx320_cur
    .local pmc match
    .lex "$/", match
    length rx320_eos, rx320_tgt
    set rx320_off, 0
    lt $I10, 2, rx320_start
    sub rx320_off, $I10, 1
    substr rx320_tgt, rx320_tgt, rx320_off
  rx320_start:
.annotate "line", 184
  # rx subrule "variable" subtype=capture negate=
    rx320_cur."!cursor_pos"(rx320_pos)
    $P10 = rx320_cur."variable"()
    unless $P10, rx320_fail
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx320_pos = $P10."pos"()
  # rx pass
    rx320_cur."!cursor_pass"(rx320_pos, "term:sym<variable>")
    rx320_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx320_pos)
    .return (rx320_cur)
  rx320_fail:
.annotate "line", 4
    (rx320_rep, rx320_pos, $I10, $P10) = rx320_cur."!mark_fail"(0)
    lt rx320_pos, -1, rx320_done
    eq rx320_pos, -1, rx320_fail
    jump $I10
  rx320_done:
    rx320_cur."!cursor_fail"()
    rx320_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx320_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("81_1258055895.501") :method
.annotate "line", 4
    $P322 = self."!PREFIX__!subrule"("variable", "")
    new $P323, "ResizablePMCArray"
    push $P323, $P322
    .return ($P323)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("82_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx325_tgt
    .local int rx325_pos
    .local int rx325_off
    .local int rx325_eos
    .local int rx325_rep
    .local pmc rx325_cur
    (rx325_cur, rx325_pos, rx325_tgt, $I10) = self."!cursor_start"()
    rx325_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx325_cur
    .local pmc match
    .lex "$/", match
    length rx325_eos, rx325_tgt
    set rx325_off, 0
    lt $I10, 2, rx325_start
    sub rx325_off, $I10, 1
    substr rx325_tgt, rx325_tgt, rx325_off
  rx325_start:
.annotate "line", 185
  # rx subrule "package_declarator" subtype=capture negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."package_declarator"()
    unless $P10, rx325_fail
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx325_pos = $P10."pos"()
  # rx pass
    rx325_cur."!cursor_pass"(rx325_pos, "term:sym<package_declarator>")
    rx325_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx325_pos)
    .return (rx325_cur)
  rx325_fail:
.annotate "line", 4
    (rx325_rep, rx325_pos, $I10, $P10) = rx325_cur."!mark_fail"(0)
    lt rx325_pos, -1, rx325_done
    eq rx325_pos, -1, rx325_fail
    jump $I10
  rx325_done:
    rx325_cur."!cursor_fail"()
    rx325_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx325_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("83_1258055895.501") :method
.annotate "line", 4
    $P327 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P328, "ResizablePMCArray"
    push $P328, $P327
    .return ($P328)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("84_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx330_tgt
    .local int rx330_pos
    .local int rx330_off
    .local int rx330_eos
    .local int rx330_rep
    .local pmc rx330_cur
    (rx330_cur, rx330_pos, rx330_tgt, $I10) = self."!cursor_start"()
    rx330_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx330_cur
    .local pmc match
    .lex "$/", match
    length rx330_eos, rx330_tgt
    set rx330_off, 0
    lt $I10, 2, rx330_start
    sub rx330_off, $I10, 1
    substr rx330_tgt, rx330_tgt, rx330_off
  rx330_start:
.annotate "line", 186
  # rx subrule "scope_declarator" subtype=capture negate=
    rx330_cur."!cursor_pos"(rx330_pos)
    $P10 = rx330_cur."scope_declarator"()
    unless $P10, rx330_fail
    rx330_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx330_pos = $P10."pos"()
  # rx pass
    rx330_cur."!cursor_pass"(rx330_pos, "term:sym<scope_declarator>")
    rx330_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx330_pos)
    .return (rx330_cur)
  rx330_fail:
.annotate "line", 4
    (rx330_rep, rx330_pos, $I10, $P10) = rx330_cur."!mark_fail"(0)
    lt rx330_pos, -1, rx330_done
    eq rx330_pos, -1, rx330_fail
    jump $I10
  rx330_done:
    rx330_cur."!cursor_fail"()
    rx330_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx330_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("85_1258055895.501") :method
.annotate "line", 4
    $P332 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P333, "ResizablePMCArray"
    push $P333, $P332
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("86_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx335_tgt
    .local int rx335_pos
    .local int rx335_off
    .local int rx335_eos
    .local int rx335_rep
    .local pmc rx335_cur
    (rx335_cur, rx335_pos, rx335_tgt, $I10) = self."!cursor_start"()
    rx335_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx335_cur
    .local pmc match
    .lex "$/", match
    length rx335_eos, rx335_tgt
    set rx335_off, 0
    lt $I10, 2, rx335_start
    sub rx335_off, $I10, 1
    substr rx335_tgt, rx335_tgt, rx335_off
  rx335_start:
.annotate "line", 187
  # rx subrule "routine_declarator" subtype=capture negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."routine_declarator"()
    unless $P10, rx335_fail
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx335_pos = $P10."pos"()
  # rx pass
    rx335_cur."!cursor_pass"(rx335_pos, "term:sym<routine_declarator>")
    rx335_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx335_pos)
    .return (rx335_cur)
  rx335_fail:
.annotate "line", 4
    (rx335_rep, rx335_pos, $I10, $P10) = rx335_cur."!mark_fail"(0)
    lt rx335_pos, -1, rx335_done
    eq rx335_pos, -1, rx335_fail
    jump $I10
  rx335_done:
    rx335_cur."!cursor_fail"()
    rx335_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx335_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("87_1258055895.501") :method
.annotate "line", 4
    $P337 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P338, "ResizablePMCArray"
    push $P338, $P337
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("88_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt, $I10) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    set rx340_off, 0
    lt $I10, 2, rx340_start
    sub rx340_off, $I10, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
.annotate "line", 188
  # rx subrule "regex_declarator" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."regex_declarator"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx340_pos = $P10."pos"()
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "term:sym<regex_declarator>")
    rx340_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate "line", 4
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("89_1258055895.501") :method
.annotate "line", 4
    $P342 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("90_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx345_tgt
    .local int rx345_pos
    .local int rx345_off
    .local int rx345_eos
    .local int rx345_rep
    .local pmc rx345_cur
    (rx345_cur, rx345_pos, rx345_tgt, $I10) = self."!cursor_start"()
    rx345_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx345_cur
    .local pmc match
    .lex "$/", match
    length rx345_eos, rx345_tgt
    set rx345_off, 0
    lt $I10, 2, rx345_start
    sub rx345_off, $I10, 1
    substr rx345_tgt, rx345_tgt, rx345_off
  rx345_start:
.annotate "line", 189
  # rx subrule "statement_prefix" subtype=capture negate=
    rx345_cur."!cursor_pos"(rx345_pos)
    $P10 = rx345_cur."statement_prefix"()
    unless $P10, rx345_fail
    rx345_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx345_pos = $P10."pos"()
  # rx pass
    rx345_cur."!cursor_pass"(rx345_pos, "term:sym<statement_prefix>")
    rx345_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx345_pos)
    .return (rx345_cur)
  rx345_fail:
.annotate "line", 4
    (rx345_rep, rx345_pos, $I10, $P10) = rx345_cur."!mark_fail"(0)
    lt rx345_pos, -1, rx345_done
    eq rx345_pos, -1, rx345_fail
    jump $I10
  rx345_done:
    rx345_cur."!cursor_fail"()
    rx345_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx345_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("91_1258055895.501") :method
.annotate "line", 4
    $P347 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P348, "ResizablePMCArray"
    push $P348, $P347
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("92_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx350_tgt
    .local int rx350_pos
    .local int rx350_off
    .local int rx350_eos
    .local int rx350_rep
    .local pmc rx350_cur
    (rx350_cur, rx350_pos, rx350_tgt, $I10) = self."!cursor_start"()
    rx350_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx350_cur
    .local pmc match
    .lex "$/", match
    length rx350_eos, rx350_tgt
    set rx350_off, 0
    lt $I10, 2, rx350_start
    sub rx350_off, $I10, 1
    substr rx350_tgt, rx350_tgt, rx350_off
  rx350_start:
.annotate "line", 190
  # rx subrule "lambda" subtype=zerowidth negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."lambda"()
    unless $P10, rx350_fail
  # rx subrule "pblock" subtype=capture negate=
    rx350_cur."!cursor_pos"(rx350_pos)
    $P10 = rx350_cur."pblock"()
    unless $P10, rx350_fail
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx350_pos = $P10."pos"()
  # rx pass
    rx350_cur."!cursor_pass"(rx350_pos, "term:sym<lambda>")
    rx350_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx350_pos)
    .return (rx350_cur)
  rx350_fail:
.annotate "line", 4
    (rx350_rep, rx350_pos, $I10, $P10) = rx350_cur."!mark_fail"(0)
    lt rx350_pos, -1, rx350_done
    eq rx350_pos, -1, rx350_fail
    jump $I10
  rx350_done:
    rx350_cur."!cursor_fail"()
    rx350_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx350_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("93_1258055895.501") :method
.annotate "line", 4
    new $P352, "ResizablePMCArray"
    push $P352, ""
    .return ($P352)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("94_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx354_tgt
    .local int rx354_pos
    .local int rx354_off
    .local int rx354_eos
    .local int rx354_rep
    .local pmc rx354_cur
    (rx354_cur, rx354_pos, rx354_tgt, $I10) = self."!cursor_start"()
    rx354_cur."!cursor_debug"("START ", "colonpair")
    rx354_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx354_cur
    .local pmc match
    .lex "$/", match
    length rx354_eos, rx354_tgt
    set rx354_off, 0
    lt $I10, 2, rx354_start
    sub rx354_off, $I10, 1
    substr rx354_tgt, rx354_tgt, rx354_off
  rx354_start:
.annotate "line", 193
  # rx literal  ":"
    add $I11, rx354_pos, 1
    gt $I11, rx354_eos, rx354_fail
    sub $I11, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I11, 1
    ne $S10, ":", rx354_fail
    add rx354_pos, 1
  alt359_0:
.annotate "line", 194
    set_addr $I10, alt359_1
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
.annotate "line", 195
  # rx subcapture "not"
    set_addr $I10, rxcap_360_fail
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  # rx literal  "!"
    add $I11, rx354_pos, 1
    gt $I11, rx354_eos, rx354_fail
    sub $I11, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I11, 1
    ne $S10, "!", rx354_fail
    add rx354_pos, 1
    set_addr $I10, rxcap_360_fail
    ($I12, $I11) = rx354_cur."!mark_peek"($I10)
    rx354_cur."!cursor_pos"($I11)
    ($P10) = rx354_cur."!cursor_start"()
    $P10."!cursor_pass"(rx354_pos, "")
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_360_done
  rxcap_360_fail:
    goto rx354_fail
  rxcap_360_done:
  # rx subrule "identifier" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."identifier"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx354_pos = $P10."pos"()
    goto alt359_end
  alt359_1:
.annotate "line", 196
  # rx subrule "identifier" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."identifier"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx354_pos = $P10."pos"()
  # rx rxquantr361 ** 0..1
    set_addr $I362, rxquantr361_done
    rx354_cur."!mark_push"(0, rx354_pos, $I362)
  rxquantr361_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx354_cur."!cursor_pos"(rx354_pos)
    $P10 = rx354_cur."circumfix"()
    unless $P10, rx354_fail
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx354_pos = $P10."pos"()
    (rx354_rep) = rx354_cur."!mark_commit"($I362)
  rxquantr361_done:
  alt359_end:
.annotate "line", 192
  # rx pass
    rx354_cur."!cursor_pass"(rx354_pos, "colonpair")
    rx354_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx354_pos)
    .return (rx354_cur)
  rx354_fail:
.annotate "line", 4
    (rx354_rep, rx354_pos, $I10, $P10) = rx354_cur."!mark_fail"(0)
    lt rx354_pos, -1, rx354_done
    eq rx354_pos, -1, rx354_fail
    jump $I10
  rx354_done:
    rx354_cur."!cursor_fail"()
    rx354_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx354_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("95_1258055895.501") :method
.annotate "line", 4
    $P356 = self."!PREFIX__!subrule"("identifier", ":")
    $P357 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P358, "ResizablePMCArray"
    push $P358, $P356
    push $P358, $P357
    .return ($P358)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("96_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx364_tgt
    .local int rx364_pos
    .local int rx364_off
    .local int rx364_eos
    .local int rx364_rep
    .local pmc rx364_cur
    (rx364_cur, rx364_pos, rx364_tgt, $I10) = self."!cursor_start"()
    rx364_cur."!cursor_debug"("START ", "variable")
    rx364_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx364_cur
    .local pmc match
    .lex "$/", match
    length rx364_eos, rx364_tgt
    set rx364_off, 0
    lt $I10, 2, rx364_start
    sub rx364_off, $I10, 1
    substr rx364_tgt, rx364_tgt, rx364_off
  rx364_start:
  alt369_0:
.annotate "line", 200
    set_addr $I10, alt369_1
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
.annotate "line", 201
  # rx subrule "sigil" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."sigil"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx364_pos = $P10."pos"()
  # rx rxquantr370 ** 0..1
    set_addr $I371, rxquantr370_done
    rx364_cur."!mark_push"(0, rx364_pos, $I371)
  rxquantr370_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."twigil"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx364_pos = $P10."pos"()
    (rx364_rep) = rx364_cur."!mark_commit"($I371)
  rxquantr370_done:
  # rx subrule "ident" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."ident"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx364_pos = $P10."pos"()
    goto alt369_end
  alt369_1:
    set_addr $I10, alt369_2
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
.annotate "line", 202
  # rx subrule "sigil" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."sigil"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx364_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx364_pos, rx364_eos, rx364_fail
    sub $I10, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx364_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx364_cur."!cursor_pos"(rx364_pos)
    $P10 = rx364_cur."postcircumfix"()
    unless $P10, rx364_fail
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx364_pos = $P10."pos"()
    goto alt369_end
  alt369_2:
.annotate "line", 203
  # rx subcapture "sigil"
    set_addr $I10, rxcap_372_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx literal  "$"
    add $I11, rx364_pos, 1
    gt $I11, rx364_eos, rx364_fail
    sub $I11, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I11, 1
    ne $S10, "$", rx364_fail
    add rx364_pos, 1
    set_addr $I10, rxcap_372_fail
    ($I12, $I11) = rx364_cur."!mark_peek"($I10)
    rx364_cur."!cursor_pos"($I11)
    ($P10) = rx364_cur."!cursor_start"()
    $P10."!cursor_pass"(rx364_pos, "")
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_372_done
  rxcap_372_fail:
    goto rx364_fail
  rxcap_372_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_373_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx364_pos, rx364_eos, rx364_fail
    sub $I10, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx364_fail
    inc rx364_pos
    set_addr $I10, rxcap_373_fail
    ($I12, $I11) = rx364_cur."!mark_peek"($I10)
    rx364_cur."!cursor_pos"($I11)
    ($P10) = rx364_cur."!cursor_start"()
    $P10."!cursor_pass"(rx364_pos, "")
    rx364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_373_done
  rxcap_373_fail:
    goto rx364_fail
  rxcap_373_done:
  alt369_end:
.annotate "line", 200
  # rx pass
    rx364_cur."!cursor_pass"(rx364_pos, "variable")
    rx364_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx364_pos)
    .return (rx364_cur)
  rx364_fail:
.annotate "line", 4
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    rx364_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx364_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("97_1258055895.501") :method
.annotate "line", 4
    $P366 = self."!PREFIX__!subrule"("sigil", "")
    $P367 = self."!PREFIX__!subrule"("sigil", "")
    new $P368, "ResizablePMCArray"
    push $P368, "$!"
    push $P368, "$_"
    push $P368, "$/"
    push $P368, $P366
    push $P368, $P367
    .return ($P368)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("98_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    (rx375_cur, rx375_pos, rx375_tgt, $I10) = self."!cursor_start"()
    rx375_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx375_cur
    .local pmc match
    .lex "$/", match
    length rx375_eos, rx375_tgt
    set rx375_off, 0
    lt $I10, 2, rx375_start
    sub rx375_off, $I10, 1
    substr rx375_tgt, rx375_tgt, rx375_off
  rx375_start:
.annotate "line", 206
  # rx enumcharlist negate=0 
    ge rx375_pos, rx375_eos, rx375_fail
    sub $I10, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx375_fail
    inc rx375_pos
  # rx pass
    rx375_cur."!cursor_pass"(rx375_pos, "sigil")
    rx375_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx375_pos)
    .return (rx375_cur)
  rx375_fail:
.annotate "line", 4
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    rx375_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("99_1258055895.501") :method
.annotate "line", 4
    new $P377, "ResizablePMCArray"
    push $P377, "&"
    push $P377, "%"
    push $P377, "@"
    push $P377, "$"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("100_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx379_tgt
    .local int rx379_pos
    .local int rx379_off
    .local int rx379_eos
    .local int rx379_rep
    .local pmc rx379_cur
    (rx379_cur, rx379_pos, rx379_tgt, $I10) = self."!cursor_start"()
    rx379_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx379_cur
    .local pmc match
    .lex "$/", match
    length rx379_eos, rx379_tgt
    set rx379_off, 0
    lt $I10, 2, rx379_start
    sub rx379_off, $I10, 1
    substr rx379_tgt, rx379_tgt, rx379_off
  rx379_start:
.annotate "line", 208
  # rx enumcharlist negate=0 
    ge rx379_pos, rx379_eos, rx379_fail
    sub $I10, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx379_fail
    inc rx379_pos
  # rx pass
    rx379_cur."!cursor_pass"(rx379_pos, "twigil")
    rx379_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx379_pos)
    .return (rx379_cur)
  rx379_fail:
.annotate "line", 4
    (rx379_rep, rx379_pos, $I10, $P10) = rx379_cur."!mark_fail"(0)
    lt rx379_pos, -1, rx379_done
    eq rx379_pos, -1, rx379_fail
    jump $I10
  rx379_done:
    rx379_cur."!cursor_fail"()
    rx379_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx379_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("101_1258055895.501") :method
.annotate "line", 4
    new $P381, "ResizablePMCArray"
    push $P381, "?"
    push $P381, "!"
    push $P381, "*"
    .return ($P381)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("102_1258055895.501") :method
.annotate "line", 210
    $P383 = self."!protoregex"("package_declarator")
    .return ($P383)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("103_1258055895.501") :method
.annotate "line", 210
    $P385 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("104_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx387_tgt
    .local int rx387_pos
    .local int rx387_off
    .local int rx387_eos
    .local int rx387_rep
    .local pmc rx387_cur
    (rx387_cur, rx387_pos, rx387_tgt, $I10) = self."!cursor_start"()
    rx387_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx387_cur
    .local pmc match
    .lex "$/", match
    length rx387_eos, rx387_tgt
    set rx387_off, 0
    lt $I10, 2, rx387_start
    sub rx387_off, $I10, 1
    substr rx387_tgt, rx387_tgt, rx387_off
  rx387_start:
.annotate "line", 211
  # rx subcapture "sym"
    set_addr $I10, rxcap_391_fail
    rx387_cur."!mark_push"(0, rx387_pos, $I10)
  # rx literal  "module"
    add $I11, rx387_pos, 6
    gt $I11, rx387_eos, rx387_fail
    sub $I11, rx387_pos, rx387_off
    substr $S10, rx387_tgt, $I11, 6
    ne $S10, "module", rx387_fail
    add rx387_pos, 6
    set_addr $I10, rxcap_391_fail
    ($I12, $I11) = rx387_cur."!mark_peek"($I10)
    rx387_cur."!cursor_pos"($I11)
    ($P10) = rx387_cur."!cursor_start"()
    $P10."!cursor_pass"(rx387_pos, "")
    rx387_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_391_done
  rxcap_391_fail:
    goto rx387_fail
  rxcap_391_done:
  # rx subrule "package_def" subtype=capture negate=
    rx387_cur."!cursor_pos"(rx387_pos)
    $P10 = rx387_cur."package_def"()
    unless $P10, rx387_fail
    rx387_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx387_pos = $P10."pos"()
  # rx pass
    rx387_cur."!cursor_pass"(rx387_pos, "package_declarator:sym<module>")
    rx387_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx387_pos)
    .return (rx387_cur)
  rx387_fail:
.annotate "line", 4
    (rx387_rep, rx387_pos, $I10, $P10) = rx387_cur."!mark_fail"(0)
    lt rx387_pos, -1, rx387_done
    eq rx387_pos, -1, rx387_fail
    jump $I10
  rx387_done:
    rx387_cur."!cursor_fail"()
    rx387_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx387_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("105_1258055895.501") :method
.annotate "line", 4
    $P389 = self."!PREFIX__!subrule"("package_def", "module")
    new $P390, "ResizablePMCArray"
    push $P390, $P389
    .return ($P390)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("106_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx393_tgt
    .local int rx393_pos
    .local int rx393_off
    .local int rx393_eos
    .local int rx393_rep
    .local pmc rx393_cur
    (rx393_cur, rx393_pos, rx393_tgt, $I10) = self."!cursor_start"()
    rx393_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx393_cur
    .local pmc match
    .lex "$/", match
    length rx393_eos, rx393_tgt
    set rx393_off, 0
    lt $I10, 2, rx393_start
    sub rx393_off, $I10, 1
    substr rx393_tgt, rx393_tgt, rx393_off
  rx393_start:
.annotate "line", 212
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  alt398_0:
    set_addr $I10, alt398_1
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  # rx literal  "class"
    add $I11, rx393_pos, 5
    gt $I11, rx393_eos, rx393_fail
    sub $I11, rx393_pos, rx393_off
    substr $S10, rx393_tgt, $I11, 5
    ne $S10, "class", rx393_fail
    add rx393_pos, 5
    goto alt398_end
  alt398_1:
  # rx literal  "grammar"
    add $I11, rx393_pos, 7
    gt $I11, rx393_eos, rx393_fail
    sub $I11, rx393_pos, rx393_off
    substr $S10, rx393_tgt, $I11, 7
    ne $S10, "grammar", rx393_fail
    add rx393_pos, 7
  alt398_end:
    set_addr $I10, rxcap_399_fail
    ($I12, $I11) = rx393_cur."!mark_peek"($I10)
    rx393_cur."!cursor_pos"($I11)
    ($P10) = rx393_cur."!cursor_start"()
    $P10."!cursor_pass"(rx393_pos, "")
    rx393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_399_done
  rxcap_399_fail:
    goto rx393_fail
  rxcap_399_done:
  # rx subrule "package_def" subtype=capture negate=
    rx393_cur."!cursor_pos"(rx393_pos)
    $P10 = rx393_cur."package_def"()
    unless $P10, rx393_fail
    rx393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx393_pos = $P10."pos"()
  # rx pass
    rx393_cur."!cursor_pass"(rx393_pos, "package_declarator:sym<class>")
    rx393_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx393_pos)
    .return (rx393_cur)
  rx393_fail:
.annotate "line", 4
    (rx393_rep, rx393_pos, $I10, $P10) = rx393_cur."!mark_fail"(0)
    lt rx393_pos, -1, rx393_done
    eq rx393_pos, -1, rx393_fail
    jump $I10
  rx393_done:
    rx393_cur."!cursor_fail"()
    rx393_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx393_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("107_1258055895.501") :method
.annotate "line", 4
    $P395 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P396 = self."!PREFIX__!subrule"("package_def", "class")
    new $P397, "ResizablePMCArray"
    push $P397, $P395
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("108_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx401_tgt
    .local int rx401_pos
    .local int rx401_off
    .local int rx401_eos
    .local int rx401_rep
    .local pmc rx401_cur
    (rx401_cur, rx401_pos, rx401_tgt, $I10) = self."!cursor_start"()
    rx401_cur."!cursor_debug"("START ", "package_def")
    rx401_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx401_cur
    .local pmc match
    .lex "$/", match
    length rx401_eos, rx401_tgt
    set rx401_off, 0
    lt $I10, 2, rx401_start
    sub rx401_off, $I10, 1
    substr rx401_tgt, rx401_tgt, rx401_off
  rx401_start:
.annotate "line", 214
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
.annotate "line", 215
  # rx subrule "name" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."name"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx401_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
.annotate "line", 216
  # rx rxquantr406 ** 0..1
    set_addr $I410, rxquantr406_done
    rx401_cur."!mark_push"(0, rx401_pos, $I410)
  rxquantr406_loop:
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx401_pos, 2
    gt $I11, rx401_eos, rx401_fail
    sub $I11, rx401_pos, rx401_off
    substr $S10, rx401_tgt, $I11, 2
    ne $S10, "is", rx401_fail
    add rx401_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."name"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx401_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
    (rx401_rep) = rx401_cur."!mark_commit"($I410)
  rxquantr406_done:
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  alt412_0:
.annotate "line", 217
    set_addr $I10, alt412_1
    rx401_cur."!mark_push"(0, rx401_pos, $I10)
.annotate "line", 218
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx401_pos, 1
    gt $I11, rx401_eos, rx401_fail
    sub $I11, rx401_pos, rx401_off
    substr $S10, rx401_tgt, $I11, 1
    ne $S10, ";", rx401_fail
    add rx401_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."comp_unit"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx401_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
    goto alt412_end
  alt412_1:
    set_addr $I10, alt412_2
    rx401_cur."!mark_push"(0, rx401_pos, $I10)
.annotate "line", 219
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx401_pos, rx401_eos, rx401_fail
    sub $I10, rx401_pos, rx401_off
    substr $S10, rx401_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx401_fail
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."block"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx401_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
    goto alt412_end
  alt412_2:
.annotate "line", 220
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."panic"("Malformed package declaration")
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
  alt412_end:
.annotate "line", 221
  # rx subrule "ws" subtype=method negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."ws"()
    unless $P10, rx401_fail
    rx401_pos = $P10."pos"()
.annotate "line", 214
  # rx pass
    rx401_cur."!cursor_pass"(rx401_pos, "package_def")
    rx401_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx401_pos)
    .return (rx401_cur)
  rx401_fail:
.annotate "line", 4
    (rx401_rep, rx401_pos, $I10, $P10) = rx401_cur."!mark_fail"(0)
    lt rx401_pos, -1, rx401_done
    eq rx401_pos, -1, rx401_fail
    jump $I10
  rx401_done:
    rx401_cur."!cursor_fail"()
    rx401_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx401_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("109_1258055895.501") :method
.annotate "line", 4
    new $P403, "ResizablePMCArray"
    push $P403, ""
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("110_1258055895.501") :method
.annotate "line", 224
    $P423 = self."!protoregex"("scope_declarator")
    .return ($P423)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("111_1258055895.501") :method
.annotate "line", 224
    $P425 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P425)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("112_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx427_tgt
    .local int rx427_pos
    .local int rx427_off
    .local int rx427_eos
    .local int rx427_rep
    .local pmc rx427_cur
    (rx427_cur, rx427_pos, rx427_tgt, $I10) = self."!cursor_start"()
    rx427_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx427_cur
    .local pmc match
    .lex "$/", match
    length rx427_eos, rx427_tgt
    set rx427_off, 0
    lt $I10, 2, rx427_start
    sub rx427_off, $I10, 1
    substr rx427_tgt, rx427_tgt, rx427_off
  rx427_start:
.annotate "line", 225
  # rx subcapture "sym"
    set_addr $I10, rxcap_431_fail
    rx427_cur."!mark_push"(0, rx427_pos, $I10)
  # rx literal  "my"
    add $I11, rx427_pos, 2
    gt $I11, rx427_eos, rx427_fail
    sub $I11, rx427_pos, rx427_off
    substr $S10, rx427_tgt, $I11, 2
    ne $S10, "my", rx427_fail
    add rx427_pos, 2
    set_addr $I10, rxcap_431_fail
    ($I12, $I11) = rx427_cur."!mark_peek"($I10)
    rx427_cur."!cursor_pos"($I11)
    ($P10) = rx427_cur."!cursor_start"()
    $P10."!cursor_pass"(rx427_pos, "")
    rx427_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_431_done
  rxcap_431_fail:
    goto rx427_fail
  rxcap_431_done:
  # rx subrule "scoped" subtype=capture negate=
    rx427_cur."!cursor_pos"(rx427_pos)
    $P10 = rx427_cur."scoped"("my")
    unless $P10, rx427_fail
    rx427_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx427_pos = $P10."pos"()
  # rx pass
    rx427_cur."!cursor_pass"(rx427_pos, "scope_declarator:sym<my>")
    rx427_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx427_pos)
    .return (rx427_cur)
  rx427_fail:
.annotate "line", 4
    (rx427_rep, rx427_pos, $I10, $P10) = rx427_cur."!mark_fail"(0)
    lt rx427_pos, -1, rx427_done
    eq rx427_pos, -1, rx427_fail
    jump $I10
  rx427_done:
    rx427_cur."!cursor_fail"()
    rx427_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx427_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("113_1258055895.501") :method
.annotate "line", 4
    $P429 = self."!PREFIX__!subrule"("scoped", "my")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("114_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt, $I10) = self."!cursor_start"()
    rx433_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx433_cur
    .local pmc match
    .lex "$/", match
    length rx433_eos, rx433_tgt
    set rx433_off, 0
    lt $I10, 2, rx433_start
    sub rx433_off, $I10, 1
    substr rx433_tgt, rx433_tgt, rx433_off
  rx433_start:
.annotate "line", 226
  # rx subcapture "sym"
    set_addr $I10, rxcap_437_fail
    rx433_cur."!mark_push"(0, rx433_pos, $I10)
  # rx literal  "our"
    add $I11, rx433_pos, 3
    gt $I11, rx433_eos, rx433_fail
    sub $I11, rx433_pos, rx433_off
    substr $S10, rx433_tgt, $I11, 3
    ne $S10, "our", rx433_fail
    add rx433_pos, 3
    set_addr $I10, rxcap_437_fail
    ($I12, $I11) = rx433_cur."!mark_peek"($I10)
    rx433_cur."!cursor_pos"($I11)
    ($P10) = rx433_cur."!cursor_start"()
    $P10."!cursor_pass"(rx433_pos, "")
    rx433_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_437_done
  rxcap_437_fail:
    goto rx433_fail
  rxcap_437_done:
  # rx subrule "scoped" subtype=capture negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."scoped"("our")
    unless $P10, rx433_fail
    rx433_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx433_pos = $P10."pos"()
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "scope_declarator:sym<our>")
    rx433_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_fail:
.annotate "line", 4
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("115_1258055895.501") :method
.annotate "line", 4
    $P435 = self."!PREFIX__!subrule"("scoped", "our")
    new $P436, "ResizablePMCArray"
    push $P436, $P435
    .return ($P436)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("116_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx439_tgt
    .local int rx439_pos
    .local int rx439_off
    .local int rx439_eos
    .local int rx439_rep
    .local pmc rx439_cur
    (rx439_cur, rx439_pos, rx439_tgt, $I10) = self."!cursor_start"()
    rx439_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx439_cur
    .local pmc match
    .lex "$/", match
    length rx439_eos, rx439_tgt
    set rx439_off, 0
    lt $I10, 2, rx439_start
    sub rx439_off, $I10, 1
    substr rx439_tgt, rx439_tgt, rx439_off
  rx439_start:
.annotate "line", 227
  # rx subcapture "sym"
    set_addr $I10, rxcap_443_fail
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
  # rx literal  "has"
    add $I11, rx439_pos, 3
    gt $I11, rx439_eos, rx439_fail
    sub $I11, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I11, 3
    ne $S10, "has", rx439_fail
    add rx439_pos, 3
    set_addr $I10, rxcap_443_fail
    ($I12, $I11) = rx439_cur."!mark_peek"($I10)
    rx439_cur."!cursor_pos"($I11)
    ($P10) = rx439_cur."!cursor_start"()
    $P10."!cursor_pass"(rx439_pos, "")
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_443_done
  rxcap_443_fail:
    goto rx439_fail
  rxcap_443_done:
  # rx subrule "scoped" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."scoped"("has")
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx439_pos = $P10."pos"()
  # rx pass
    rx439_cur."!cursor_pass"(rx439_pos, "scope_declarator:sym<has>")
    rx439_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx439_pos)
    .return (rx439_cur)
  rx439_fail:
.annotate "line", 4
    (rx439_rep, rx439_pos, $I10, $P10) = rx439_cur."!mark_fail"(0)
    lt rx439_pos, -1, rx439_done
    eq rx439_pos, -1, rx439_fail
    jump $I10
  rx439_done:
    rx439_cur."!cursor_fail"()
    rx439_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx439_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("117_1258055895.501") :method
.annotate "line", 4
    $P441 = self."!PREFIX__!subrule"("scoped", "has")
    new $P442, "ResizablePMCArray"
    push $P442, $P441
    .return ($P442)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("118_1258055895.501") :method :outer("11_1258055895.501")
    .param pmc param_445
.annotate "line", 229
    .lex "$*SCOPE", param_445
.annotate "line", 4
    .local string rx446_tgt
    .local int rx446_pos
    .local int rx446_off
    .local int rx446_eos
    .local int rx446_rep
    .local pmc rx446_cur
    (rx446_cur, rx446_pos, rx446_tgt, $I10) = self."!cursor_start"()
    rx446_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx446_cur
    .local pmc match
    .lex "$/", match
    length rx446_eos, rx446_tgt
    set rx446_off, 0
    lt $I10, 2, rx446_start
    sub rx446_off, $I10, 1
    substr rx446_tgt, rx446_tgt, rx446_off
  rx446_start:
  alt449_0:
.annotate "line", 229
    set_addr $I10, alt449_1
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
.annotate "line", 230
  # rx subrule "ws" subtype=method negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."ws"()
    unless $P10, rx446_fail
    rx446_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."variable_declarator"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx446_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."ws"()
    unless $P10, rx446_fail
    rx446_pos = $P10."pos"()
    goto alt449_end
  alt449_1:
.annotate "line", 231
  # rx subrule "ws" subtype=method negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."ws"()
    unless $P10, rx446_fail
    rx446_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."routine_declarator"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx446_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."ws"()
    unless $P10, rx446_fail
    rx446_pos = $P10."pos"()
  alt449_end:
.annotate "line", 229
  # rx pass
    rx446_cur."!cursor_pass"(rx446_pos, "scoped")
    rx446_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx446_pos)
    .return (rx446_cur)
  rx446_fail:
.annotate "line", 4
    (rx446_rep, rx446_pos, $I10, $P10) = rx446_cur."!mark_fail"(0)
    lt rx446_pos, -1, rx446_done
    eq rx446_pos, -1, rx446_fail
    jump $I10
  rx446_done:
    rx446_cur."!cursor_fail"()
    rx446_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx446_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("119_1258055895.501") :method
.annotate "line", 4
    new $P448, "ResizablePMCArray"
    push $P448, ""
    push $P448, ""
    .return ($P448)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("120_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx455_tgt
    .local int rx455_pos
    .local int rx455_off
    .local int rx455_eos
    .local int rx455_rep
    .local pmc rx455_cur
    (rx455_cur, rx455_pos, rx455_tgt, $I10) = self."!cursor_start"()
    rx455_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx455_cur
    .local pmc match
    .lex "$/", match
    length rx455_eos, rx455_tgt
    set rx455_off, 0
    lt $I10, 2, rx455_start
    sub rx455_off, $I10, 1
    substr rx455_tgt, rx455_tgt, rx455_off
  rx455_start:
.annotate "line", 234
  # rx subrule "variable" subtype=capture negate=
    rx455_cur."!cursor_pos"(rx455_pos)
    $P10 = rx455_cur."variable"()
    unless $P10, rx455_fail
    rx455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx455_pos = $P10."pos"()
  # rx pass
    rx455_cur."!cursor_pass"(rx455_pos, "variable_declarator")
    rx455_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx455_pos)
    .return (rx455_cur)
  rx455_fail:
.annotate "line", 4
    (rx455_rep, rx455_pos, $I10, $P10) = rx455_cur."!mark_fail"(0)
    lt rx455_pos, -1, rx455_done
    eq rx455_pos, -1, rx455_fail
    jump $I10
  rx455_done:
    rx455_cur."!cursor_fail"()
    rx455_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx455_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("121_1258055895.501") :method
.annotate "line", 4
    $P457 = self."!PREFIX__!subrule"("variable", "")
    new $P458, "ResizablePMCArray"
    push $P458, $P457
    .return ($P458)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("122_1258055895.501") :method
.annotate "line", 236
    $P460 = self."!protoregex"("routine_declarator")
    .return ($P460)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("123_1258055895.501") :method
.annotate "line", 236
    $P462 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P462)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("124_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt, $I10) = self."!cursor_start"()
    rx464_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx464_cur
    .local pmc match
    .lex "$/", match
    length rx464_eos, rx464_tgt
    set rx464_off, 0
    lt $I10, 2, rx464_start
    sub rx464_off, $I10, 1
    substr rx464_tgt, rx464_tgt, rx464_off
  rx464_start:
.annotate "line", 237
  # rx subcapture "sym"
    set_addr $I10, rxcap_468_fail
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  # rx literal  "sub"
    add $I11, rx464_pos, 3
    gt $I11, rx464_eos, rx464_fail
    sub $I11, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I11, 3
    ne $S10, "sub", rx464_fail
    add rx464_pos, 3
    set_addr $I10, rxcap_468_fail
    ($I12, $I11) = rx464_cur."!mark_peek"($I10)
    rx464_cur."!cursor_pos"($I11)
    ($P10) = rx464_cur."!cursor_start"()
    $P10."!cursor_pass"(rx464_pos, "")
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_468_done
  rxcap_468_fail:
    goto rx464_fail
  rxcap_468_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."routine_def"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx464_pos = $P10."pos"()
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "routine_declarator:sym<sub>")
    rx464_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_fail:
.annotate "line", 4
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx464_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("125_1258055895.501") :method
.annotate "line", 4
    $P466 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("126_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
    rx470_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx470_cur
    .local pmc match
    .lex "$/", match
    length rx470_eos, rx470_tgt
    set rx470_off, 0
    lt $I10, 2, rx470_start
    sub rx470_off, $I10, 1
    substr rx470_tgt, rx470_tgt, rx470_off
  rx470_start:
.annotate "line", 238
  # rx subcapture "sym"
    set_addr $I10, rxcap_474_fail
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  # rx literal  "method"
    add $I11, rx470_pos, 6
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 6
    ne $S10, "method", rx470_fail
    add rx470_pos, 6
    set_addr $I10, rxcap_474_fail
    ($I12, $I11) = rx470_cur."!mark_peek"($I10)
    rx470_cur."!cursor_pos"($I11)
    ($P10) = rx470_cur."!cursor_start"()
    $P10."!cursor_pass"(rx470_pos, "")
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_474_done
  rxcap_474_fail:
    goto rx470_fail
  rxcap_474_done:
  # rx subrule "method_def" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."method_def"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx470_pos = $P10."pos"()
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "routine_declarator:sym<method>")
    rx470_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_fail:
.annotate "line", 4
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx470_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("127_1258055895.501") :method
.annotate "line", 4
    $P472 = self."!PREFIX__!subrule"("method_def", "method")
    new $P473, "ResizablePMCArray"
    push $P473, $P472
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("128_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx476_tgt
    .local int rx476_pos
    .local int rx476_off
    .local int rx476_eos
    .local int rx476_rep
    .local pmc rx476_cur
    (rx476_cur, rx476_pos, rx476_tgt, $I10) = self."!cursor_start"()
    rx476_cur."!cursor_debug"("START ", "routine_def")
    rx476_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx476_cur
    .local pmc match
    .lex "$/", match
    length rx476_eos, rx476_tgt
    set rx476_off, 0
    lt $I10, 2, rx476_start
    sub rx476_off, $I10, 1
    substr rx476_tgt, rx476_tgt, rx476_off
  rx476_start:
.annotate "line", 240
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
.annotate "line", 241
  # rx rxquantr480 ** 0..1
    set_addr $I481, rxquantr480_done
    rx476_cur."!mark_push"(0, rx476_pos, $I481)
  rxquantr480_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."deflongname"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx476_pos = $P10."pos"()
    (rx476_rep) = rx476_cur."!mark_commit"($I481)
  rxquantr480_done:
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
.annotate "line", 242
  # rx subrule "newpad" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."newpad"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  alt484_0:
.annotate "line", 243
    set_addr $I10, alt484_1
    rx476_cur."!mark_push"(0, rx476_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx476_pos, 1
    gt $I11, rx476_eos, rx476_fail
    sub $I11, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I11, 1
    ne $S10, "(", rx476_fail
    add rx476_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."signature"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx476_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx476_pos, 1
    gt $I11, rx476_eos, rx476_fail
    sub $I11, rx476_pos, rx476_off
    substr $S10, rx476_tgt, $I11, 1
    ne $S10, ")", rx476_fail
    add rx476_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
    goto alt484_end
  alt484_1:
.annotate "line", 244
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
  alt484_end:
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
.annotate "line", 245
  # rx subrule "blockoid" subtype=capture negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."blockoid"()
    unless $P10, rx476_fail
    rx476_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx476_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx476_cur."!cursor_pos"(rx476_pos)
    $P10 = rx476_cur."ws"()
    unless $P10, rx476_fail
    rx476_pos = $P10."pos"()
.annotate "line", 240
  # rx pass
    rx476_cur."!cursor_pass"(rx476_pos, "routine_def")
    rx476_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx476_pos)
    .return (rx476_cur)
  rx476_fail:
.annotate "line", 4
    (rx476_rep, rx476_pos, $I10, $P10) = rx476_cur."!mark_fail"(0)
    lt rx476_pos, -1, rx476_done
    eq rx476_pos, -1, rx476_fail
    jump $I10
  rx476_done:
    rx476_cur."!cursor_fail"()
    rx476_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx476_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("129_1258055895.501") :method
.annotate "line", 4
    new $P478, "ResizablePMCArray"
    push $P478, ""
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("130_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx494_tgt
    .local int rx494_pos
    .local int rx494_off
    .local int rx494_eos
    .local int rx494_rep
    .local pmc rx494_cur
    (rx494_cur, rx494_pos, rx494_tgt, $I10) = self."!cursor_start"()
    rx494_cur."!cursor_debug"("START ", "method_def")
    rx494_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx494_cur
    .local pmc match
    .lex "$/", match
    length rx494_eos, rx494_tgt
    set rx494_off, 0
    lt $I10, 2, rx494_start
    sub rx494_off, $I10, 1
    substr rx494_tgt, rx494_tgt, rx494_off
  rx494_start:
.annotate "line", 248
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
.annotate "line", 249
  # rx rxquantr498 ** 0..1
    set_addr $I499, rxquantr498_done
    rx494_cur."!mark_push"(0, rx494_pos, $I499)
  rxquantr498_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."deflongname"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx494_pos = $P10."pos"()
    (rx494_rep) = rx494_cur."!mark_commit"($I499)
  rxquantr498_done:
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
.annotate "line", 250
  # rx subrule "newpad" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."newpad"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  alt502_0:
.annotate "line", 251
    set_addr $I10, alt502_1
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "(", rx494_fail
    add rx494_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."signature"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx494_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, ")", rx494_fail
    add rx494_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
    goto alt502_end
  alt502_1:
.annotate "line", 252
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
  alt502_end:
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
.annotate "line", 253
  # rx subrule "blockoid" subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."blockoid"()
    unless $P10, rx494_fail
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx494_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."ws"()
    unless $P10, rx494_fail
    rx494_pos = $P10."pos"()
.annotate "line", 248
  # rx pass
    rx494_cur."!cursor_pass"(rx494_pos, "method_def")
    rx494_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx494_pos)
    .return (rx494_cur)
  rx494_fail:
.annotate "line", 4
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    rx494_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx494_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("131_1258055895.501") :method
.annotate "line", 4
    new $P496, "ResizablePMCArray"
    push $P496, ""
    .return ($P496)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("132_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx512_tgt
    .local int rx512_pos
    .local int rx512_off
    .local int rx512_eos
    .local int rx512_rep
    .local pmc rx512_cur
    (rx512_cur, rx512_pos, rx512_tgt, $I10) = self."!cursor_start"()
    rx512_cur."!cursor_debug"("START ", "signature")
    rx512_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx512_cur
    .local pmc match
    .lex "$/", match
    length rx512_eos, rx512_tgt
    set rx512_off, 0
    lt $I10, 2, rx512_start
    sub rx512_off, $I10, 1
    substr rx512_tgt, rx512_tgt, rx512_off
  rx512_start:
.annotate "line", 256
  # rx rxquantr515 ** 0..1
    set_addr $I518, rxquantr515_done
    rx512_cur."!mark_push"(0, rx512_pos, $I518)
  rxquantr515_loop:
  # rx rxquantr516 ** 1..*
    set_addr $I517, rxquantr516_done
    rx512_cur."!mark_push"(0, -1, $I517)
  rxquantr516_loop:
  # rx subrule "ws" subtype=method negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    $P10 = rx512_cur."ws"()
    unless $P10, rx512_fail
    rx512_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    $P10 = rx512_cur."parameter"()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx512_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    $P10 = rx512_cur."ws"()
    unless $P10, rx512_fail
    rx512_pos = $P10."pos"()
    (rx512_rep) = rx512_cur."!mark_commit"($I517)
    rx512_cur."!mark_push"(rx512_rep, rx512_pos, $I517)
  # rx literal  ","
    add $I11, rx512_pos, 1
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 1
    ne $S10, ",", rx512_fail
    add rx512_pos, 1
    goto rxquantr516_loop
  rxquantr516_done:
    (rx512_rep) = rx512_cur."!mark_commit"($I518)
  rxquantr515_done:
  # rx pass
    rx512_cur."!cursor_pass"(rx512_pos, "signature")
    rx512_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx512_pos)
    .return (rx512_cur)
  rx512_fail:
.annotate "line", 4
    (rx512_rep, rx512_pos, $I10, $P10) = rx512_cur."!mark_fail"(0)
    lt rx512_pos, -1, rx512_done
    eq rx512_pos, -1, rx512_fail
    jump $I10
  rx512_done:
    rx512_cur."!cursor_fail"()
    rx512_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx512_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("133_1258055895.501") :method
.annotate "line", 4
    new $P514, "ResizablePMCArray"
    push $P514, ""
    .return ($P514)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("134_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx520_tgt
    .local int rx520_pos
    .local int rx520_off
    .local int rx520_eos
    .local int rx520_rep
    .local pmc rx520_cur
    (rx520_cur, rx520_pos, rx520_tgt, $I10) = self."!cursor_start"()
    rx520_cur."!cursor_debug"("START ", "parameter")
    rx520_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx520_cur
    .local pmc match
    .lex "$/", match
    length rx520_eos, rx520_tgt
    set rx520_off, 0
    lt $I10, 2, rx520_start
    sub rx520_off, $I10, 1
    substr rx520_tgt, rx520_tgt, rx520_off
  rx520_start:
  alt526_0:
.annotate "line", 259
    set_addr $I10, alt526_1
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
.annotate "line", 260
  # rx subcapture "quant"
    set_addr $I10, rxcap_527_fail
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  # rx literal  "*"
    add $I11, rx520_pos, 1
    gt $I11, rx520_eos, rx520_fail
    sub $I11, rx520_pos, rx520_off
    substr $S10, rx520_tgt, $I11, 1
    ne $S10, "*", rx520_fail
    add rx520_pos, 1
    set_addr $I10, rxcap_527_fail
    ($I12, $I11) = rx520_cur."!mark_peek"($I10)
    rx520_cur."!cursor_pos"($I11)
    ($P10) = rx520_cur."!cursor_start"()
    $P10."!cursor_pass"(rx520_pos, "")
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_527_done
  rxcap_527_fail:
    goto rx520_fail
  rxcap_527_done:
  # rx subrule "param_var" subtype=capture negate=
    rx520_cur."!cursor_pos"(rx520_pos)
    $P10 = rx520_cur."param_var"()
    unless $P10, rx520_fail
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx520_pos = $P10."pos"()
    goto alt526_end
  alt526_1:
  alt528_0:
.annotate "line", 261
    set_addr $I10, alt528_1
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx520_cur."!cursor_pos"(rx520_pos)
    $P10 = rx520_cur."param_var"()
    unless $P10, rx520_fail
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx520_pos = $P10."pos"()
    goto alt528_end
  alt528_1:
  # rx subrule "named_param" subtype=capture negate=
    rx520_cur."!cursor_pos"(rx520_pos)
    $P10 = rx520_cur."named_param"()
    unless $P10, rx520_fail
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx520_pos = $P10."pos"()
  alt528_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_530_fail
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  alt529_0:
    set_addr $I10, alt529_1
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  # rx literal  "?"
    add $I11, rx520_pos, 1
    gt $I11, rx520_eos, rx520_fail
    sub $I11, rx520_pos, rx520_off
    substr $S10, rx520_tgt, $I11, 1
    ne $S10, "?", rx520_fail
    add rx520_pos, 1
    goto alt529_end
  alt529_1:
    set_addr $I10, alt529_2
    rx520_cur."!mark_push"(0, rx520_pos, $I10)
  # rx literal  "!"
    add $I11, rx520_pos, 1
    gt $I11, rx520_eos, rx520_fail
    sub $I11, rx520_pos, rx520_off
    substr $S10, rx520_tgt, $I11, 1
    ne $S10, "!", rx520_fail
    add rx520_pos, 1
    goto alt529_end
  alt529_2:
  alt529_end:
    set_addr $I10, rxcap_530_fail
    ($I12, $I11) = rx520_cur."!mark_peek"($I10)
    rx520_cur."!cursor_pos"($I11)
    ($P10) = rx520_cur."!cursor_start"()
    $P10."!cursor_pass"(rx520_pos, "")
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_530_done
  rxcap_530_fail:
    goto rx520_fail
  rxcap_530_done:
  alt526_end:
.annotate "line", 263
  # rx rxquantr531 ** 0..1
    set_addr $I532, rxquantr531_done
    rx520_cur."!mark_push"(0, rx520_pos, $I532)
  rxquantr531_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx520_cur."!cursor_pos"(rx520_pos)
    $P10 = rx520_cur."default_value"()
    unless $P10, rx520_fail
    rx520_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx520_pos = $P10."pos"()
    (rx520_rep) = rx520_cur."!mark_commit"($I532)
  rxquantr531_done:
.annotate "line", 258
  # rx pass
    rx520_cur."!cursor_pass"(rx520_pos, "parameter")
    rx520_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx520_pos)
    .return (rx520_cur)
  rx520_fail:
.annotate "line", 4
    (rx520_rep, rx520_pos, $I10, $P10) = rx520_cur."!mark_fail"(0)
    lt rx520_pos, -1, rx520_done
    eq rx520_pos, -1, rx520_fail
    jump $I10
  rx520_done:
    rx520_cur."!cursor_fail"()
    rx520_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx520_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("135_1258055895.501") :method
.annotate "line", 4
    $P522 = self."!PREFIX__!subrule"("named_param", "")
    $P523 = self."!PREFIX__!subrule"("param_var", "")
    $P524 = self."!PREFIX__!subrule"("param_var", "*")
    new $P525, "ResizablePMCArray"
    push $P525, $P522
    push $P525, $P523
    push $P525, $P524
    .return ($P525)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("136_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx534_tgt
    .local int rx534_pos
    .local int rx534_off
    .local int rx534_eos
    .local int rx534_rep
    .local pmc rx534_cur
    (rx534_cur, rx534_pos, rx534_tgt, $I10) = self."!cursor_start"()
    rx534_cur."!cursor_debug"("START ", "param_var")
    rx534_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx534_cur
    .local pmc match
    .lex "$/", match
    length rx534_eos, rx534_tgt
    set rx534_off, 0
    lt $I10, 2, rx534_start
    sub rx534_off, $I10, 1
    substr rx534_tgt, rx534_tgt, rx534_off
  rx534_start:
.annotate "line", 267
  # rx subrule "sigil" subtype=capture negate=
    rx534_cur."!cursor_pos"(rx534_pos)
    $P10 = rx534_cur."sigil"()
    unless $P10, rx534_fail
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx534_pos = $P10."pos"()
  # rx rxquantr538 ** 0..1
    set_addr $I539, rxquantr538_done
    rx534_cur."!mark_push"(0, rx534_pos, $I539)
  rxquantr538_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx534_cur."!cursor_pos"(rx534_pos)
    $P10 = rx534_cur."twigil"()
    unless $P10, rx534_fail
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx534_pos = $P10."pos"()
    (rx534_rep) = rx534_cur."!mark_commit"($I539)
  rxquantr538_done:
  alt540_0:
.annotate "line", 268
    set_addr $I10, alt540_1
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx534_cur."!cursor_pos"(rx534_pos)
    $P10 = rx534_cur."ident"()
    unless $P10, rx534_fail
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx534_pos = $P10."pos"()
    goto alt540_end
  alt540_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_541_fail
    rx534_cur."!mark_push"(0, rx534_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx534_pos, rx534_eos, rx534_fail
    sub $I10, rx534_pos, rx534_off
    substr $S10, rx534_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx534_fail
    inc rx534_pos
    set_addr $I10, rxcap_541_fail
    ($I12, $I11) = rx534_cur."!mark_peek"($I10)
    rx534_cur."!cursor_pos"($I11)
    ($P10) = rx534_cur."!cursor_start"()
    $P10."!cursor_pass"(rx534_pos, "")
    rx534_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_541_done
  rxcap_541_fail:
    goto rx534_fail
  rxcap_541_done:
  alt540_end:
.annotate "line", 266
  # rx pass
    rx534_cur."!cursor_pass"(rx534_pos, "param_var")
    rx534_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx534_pos)
    .return (rx534_cur)
  rx534_fail:
.annotate "line", 4
    (rx534_rep, rx534_pos, $I10, $P10) = rx534_cur."!mark_fail"(0)
    lt rx534_pos, -1, rx534_done
    eq rx534_pos, -1, rx534_fail
    jump $I10
  rx534_done:
    rx534_cur."!cursor_fail"()
    rx534_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx534_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("137_1258055895.501") :method
.annotate "line", 4
    $P536 = self."!PREFIX__!subrule"("sigil", "")
    new $P537, "ResizablePMCArray"
    push $P537, $P536
    .return ($P537)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("138_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx543_tgt
    .local int rx543_pos
    .local int rx543_off
    .local int rx543_eos
    .local int rx543_rep
    .local pmc rx543_cur
    (rx543_cur, rx543_pos, rx543_tgt, $I10) = self."!cursor_start"()
    rx543_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx543_cur
    .local pmc match
    .lex "$/", match
    length rx543_eos, rx543_tgt
    set rx543_off, 0
    lt $I10, 2, rx543_start
    sub rx543_off, $I10, 1
    substr rx543_tgt, rx543_tgt, rx543_off
  rx543_start:
.annotate "line", 272
  # rx literal  ":"
    add $I11, rx543_pos, 1
    gt $I11, rx543_eos, rx543_fail
    sub $I11, rx543_pos, rx543_off
    substr $S10, rx543_tgt, $I11, 1
    ne $S10, ":", rx543_fail
    add rx543_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx543_cur."!cursor_pos"(rx543_pos)
    $P10 = rx543_cur."param_var"()
    unless $P10, rx543_fail
    rx543_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx543_pos = $P10."pos"()
.annotate "line", 271
  # rx pass
    rx543_cur."!cursor_pass"(rx543_pos, "named_param")
    rx543_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx543_pos)
    .return (rx543_cur)
  rx543_fail:
.annotate "line", 4
    (rx543_rep, rx543_pos, $I10, $P10) = rx543_cur."!mark_fail"(0)
    lt rx543_pos, -1, rx543_done
    eq rx543_pos, -1, rx543_fail
    jump $I10
  rx543_done:
    rx543_cur."!cursor_fail"()
    rx543_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx543_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("139_1258055895.501") :method
.annotate "line", 4
    $P545 = self."!PREFIX__!subrule"("param_var", ":")
    new $P546, "ResizablePMCArray"
    push $P546, $P545
    .return ($P546)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("140_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx548_tgt
    .local int rx548_pos
    .local int rx548_off
    .local int rx548_eos
    .local int rx548_rep
    .local pmc rx548_cur
    (rx548_cur, rx548_pos, rx548_tgt, $I10) = self."!cursor_start"()
    rx548_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx548_cur
    .local pmc match
    .lex "$/", match
    length rx548_eos, rx548_tgt
    set rx548_off, 0
    lt $I10, 2, rx548_start
    sub rx548_off, $I10, 1
    substr rx548_tgt, rx548_tgt, rx548_off
  rx548_start:
.annotate "line", 275
  # rx subrule "ws" subtype=method negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."ws"()
    unless $P10, rx548_fail
    rx548_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, "=", rx548_fail
    add rx548_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."ws"()
    unless $P10, rx548_fail
    rx548_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."EXPR"("i=")
    unless $P10, rx548_fail
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx548_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."ws"()
    unless $P10, rx548_fail
    rx548_pos = $P10."pos"()
  # rx pass
    rx548_cur."!cursor_pass"(rx548_pos, "default_value")
    rx548_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx548_pos)
    .return (rx548_cur)
  rx548_fail:
.annotate "line", 4
    (rx548_rep, rx548_pos, $I10, $P10) = rx548_cur."!mark_fail"(0)
    lt rx548_pos, -1, rx548_done
    eq rx548_pos, -1, rx548_fail
    jump $I10
  rx548_done:
    rx548_cur."!cursor_fail"()
    rx548_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx548_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("141_1258055895.501") :method
.annotate "line", 4
    new $P550, "ResizablePMCArray"
    push $P550, ""
    .return ($P550)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("142_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx555_tgt
    .local int rx555_pos
    .local int rx555_off
    .local int rx555_eos
    .local int rx555_rep
    .local pmc rx555_cur
    (rx555_cur, rx555_pos, rx555_tgt, $I10) = self."!cursor_start"()
    rx555_cur."!cursor_debug"("START ", "regex_declarator")
    rx555_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx555_cur
    .local pmc match
    .lex "$/", match
    length rx555_eos, rx555_tgt
    set rx555_off, 0
    lt $I10, 2, rx555_start
    sub rx555_off, $I10, 1
    substr rx555_tgt, rx555_tgt, rx555_off
  rx555_start:
.annotate "line", 277
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  alt559_0:
.annotate "line", 278
    set_addr $I10, alt559_1
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
.annotate "line", 279
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_561_fail
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "proto"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "proto", rx555_fail
    add rx555_pos, 5
    set_addr $I10, rxcap_561_fail
    ($I12, $I11) = rx555_cur."!mark_peek"($I10)
    rx555_cur."!cursor_pos"($I11)
    ($P10) = rx555_cur."!cursor_start"()
    $P10."!cursor_pass"(rx555_pos, "")
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_561_done
  rxcap_561_fail:
    goto rx555_fail
  rxcap_561_done:
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  alt563_0:
    set_addr $I10, alt563_1
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "regex"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "regex", rx555_fail
    add rx555_pos, 5
    goto alt563_end
  alt563_1:
    set_addr $I10, alt563_2
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "token"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "token", rx555_fail
    add rx555_pos, 5
    goto alt563_end
  alt563_2:
  # rx literal  "rule"
    add $I11, rx555_pos, 4
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 4
    ne $S10, "rule", rx555_fail
    add rx555_pos, 4
  alt563_end:
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 280
  # rx subrule "deflongname" subtype=capture negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."deflongname"()
    unless $P10, rx555_fail
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx555_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 281
  # rx literal  "{"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "{", rx555_fail
    add rx555_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "<...>", rx555_fail
    add rx555_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "}", rx555_fail
    add rx555_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ENDSTMT"()
    unless $P10, rx555_fail
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 279
    goto alt559_end
  alt559_1:
.annotate "line", 282
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_571_fail
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  alt570_0:
    set_addr $I10, alt570_1
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "regex"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "regex", rx555_fail
    add rx555_pos, 5
    goto alt570_end
  alt570_1:
    set_addr $I10, alt570_2
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "token"
    add $I11, rx555_pos, 5
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 5
    ne $S10, "token", rx555_fail
    add rx555_pos, 5
    goto alt570_end
  alt570_2:
  # rx literal  "rule"
    add $I11, rx555_pos, 4
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 4
    ne $S10, "rule", rx555_fail
    add rx555_pos, 4
  alt570_end:
    set_addr $I10, rxcap_571_fail
    ($I12, $I11) = rx555_cur."!mark_peek"($I10)
    rx555_cur."!cursor_pos"($I11)
    ($P10) = rx555_cur."!cursor_start"()
    $P10."!cursor_pass"(rx555_pos, "")
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_571_done
  rxcap_571_fail:
    goto rx555_fail
  rxcap_571_done:
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 283
  # rx subrule "deflongname" subtype=capture negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."deflongname"()
    unless $P10, rx555_fail
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx555_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 284
  # rx subrule "newpad" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."newpad"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 285
  # rx rxquantr575 ** 0..1
    set_addr $I580, rxquantr575_done
    rx555_cur."!mark_push"(0, rx555_pos, $I580)
  rxquantr575_loop:
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "(", rx555_fail
    add rx555_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."signature"()
    unless $P10, rx555_fail
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx555_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, ")", rx555_fail
    add rx555_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
    (rx555_rep) = rx555_cur."!mark_commit"($I580)
  rxquantr575_done:
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 286
  # rx reduce name="regex_declarator" key="open"
    rx555_cur."!cursor_pos"(rx555_pos)
    rx555_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 287
  # rx literal  "{"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "{", rx555_fail
    add rx555_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."LANG"("Regex", "nibbler")
    unless $P10, rx555_fail
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx555_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "}", rx555_fail
    add rx555_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ENDSTMT"()
    unless $P10, rx555_fail
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
  alt559_end:
.annotate "line", 288
  # rx subrule "ws" subtype=method negate=
    rx555_cur."!cursor_pos"(rx555_pos)
    $P10 = rx555_cur."ws"()
    unless $P10, rx555_fail
    rx555_pos = $P10."pos"()
.annotate "line", 277
  # rx pass
    rx555_cur."!cursor_pass"(rx555_pos, "regex_declarator")
    rx555_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx555_pos)
    .return (rx555_cur)
  rx555_fail:
.annotate "line", 4
    (rx555_rep, rx555_pos, $I10, $P10) = rx555_cur."!mark_fail"(0)
    lt rx555_pos, -1, rx555_done
    eq rx555_pos, -1, rx555_fail
    jump $I10
  rx555_done:
    rx555_cur."!cursor_fail"()
    rx555_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx555_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("143_1258055895.501") :method
.annotate "line", 4
    new $P557, "ResizablePMCArray"
    push $P557, ""
    .return ($P557)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("144_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx586_tgt
    .local int rx586_pos
    .local int rx586_off
    .local int rx586_eos
    .local int rx586_rep
    .local pmc rx586_cur
    (rx586_cur, rx586_pos, rx586_tgt, $I10) = self."!cursor_start"()
    rx586_cur."!cursor_debug"("START ", "dotty")
    rx586_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx586_cur
    .local pmc match
    .lex "$/", match
    length rx586_eos, rx586_tgt
    set rx586_off, 0
    lt $I10, 2, rx586_start
    sub rx586_off, $I10, 1
    substr rx586_tgt, rx586_tgt, rx586_off
  rx586_start:
.annotate "line", 292
  # rx literal  "."
    add $I11, rx586_pos, 1
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 1
    ne $S10, ".", rx586_fail
    add rx586_pos, 1
  # rx subrule "identifier" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."identifier"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx586_pos = $P10."pos"()
.annotate "line", 296
  # rx rxquantr590 ** 0..1
    set_addr $I592, rxquantr590_done
    rx586_cur."!mark_push"(0, rx586_pos, $I592)
  rxquantr590_loop:
  alt591_0:
.annotate "line", 293
    set_addr $I10, alt591_1
    rx586_cur."!mark_push"(0, rx586_pos, $I10)
.annotate "line", 294
  # rx enumcharlist negate=0 zerowidth
    ge rx586_pos, rx586_eos, rx586_fail
    sub $I10, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx586_fail
  # rx subrule "args" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."args"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx586_pos = $P10."pos"()
    goto alt591_end
  alt591_1:
.annotate "line", 295
  # rx literal  ":"
    add $I11, rx586_pos, 1
    gt $I11, rx586_eos, rx586_fail
    sub $I11, rx586_pos, rx586_off
    substr $S10, rx586_tgt, $I11, 1
    ne $S10, ":", rx586_fail
    add rx586_pos, 1
  # rx charclass s
    ge rx586_pos, rx586_eos, rx586_fail
    sub $I10, rx586_pos, rx586_off
    is_cclass $I11, 32, rx586_tgt, $I10
    unless $I11, rx586_fail
    inc rx586_pos
  # rx subrule "arglist" subtype=capture negate=
    rx586_cur."!cursor_pos"(rx586_pos)
    $P10 = rx586_cur."arglist"()
    unless $P10, rx586_fail
    rx586_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx586_pos = $P10."pos"()
  alt591_end:
.annotate "line", 296
    (rx586_rep) = rx586_cur."!mark_commit"($I592)
  rxquantr590_done:
.annotate "line", 291
  # rx pass
    rx586_cur."!cursor_pass"(rx586_pos, "dotty")
    rx586_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx586_pos)
    .return (rx586_cur)
  rx586_fail:
.annotate "line", 4
    (rx586_rep, rx586_pos, $I10, $P10) = rx586_cur."!mark_fail"(0)
    lt rx586_pos, -1, rx586_done
    eq rx586_pos, -1, rx586_fail
    jump $I10
  rx586_done:
    rx586_cur."!cursor_fail"()
    rx586_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx586_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("145_1258055895.501") :method
.annotate "line", 4
    $P588 = self."!PREFIX__!subrule"("identifier", ".")
    new $P589, "ResizablePMCArray"
    push $P589, $P588
    .return ($P589)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("146_1258055895.501") :method
.annotate "line", 300
    $P594 = self."!protoregex"("term")
    .return ($P594)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("147_1258055895.501") :method
.annotate "line", 300
    $P596 = self."!PREFIX__!protoregex"("term")
    .return ($P596)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("148_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx598_tgt
    .local int rx598_pos
    .local int rx598_off
    .local int rx598_eos
    .local int rx598_rep
    .local pmc rx598_cur
    (rx598_cur, rx598_pos, rx598_tgt, $I10) = self."!cursor_start"()
    rx598_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx598_cur
    .local pmc match
    .lex "$/", match
    length rx598_eos, rx598_tgt
    set rx598_off, 0
    lt $I10, 2, rx598_start
    sub rx598_off, $I10, 1
    substr rx598_tgt, rx598_tgt, rx598_off
  rx598_start:
.annotate "line", 302
  # rx subcapture "sym"
    set_addr $I10, rxcap_601_fail
    rx598_cur."!mark_push"(0, rx598_pos, $I10)
  # rx literal  "self"
    add $I11, rx598_pos, 4
    gt $I11, rx598_eos, rx598_fail
    sub $I11, rx598_pos, rx598_off
    substr $S10, rx598_tgt, $I11, 4
    ne $S10, "self", rx598_fail
    add rx598_pos, 4
    set_addr $I10, rxcap_601_fail
    ($I12, $I11) = rx598_cur."!mark_peek"($I10)
    rx598_cur."!cursor_pos"($I11)
    ($P10) = rx598_cur."!cursor_start"()
    $P10."!cursor_pass"(rx598_pos, "")
    rx598_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_601_done
  rxcap_601_fail:
    goto rx598_fail
  rxcap_601_done:
  # rxanchor rwb
    le rx598_pos, 0, rx598_fail
    sub $I10, rx598_pos, rx598_off
    is_cclass $I11, 8192, rx598_tgt, $I10
    if $I11, rx598_fail
    dec $I10
    is_cclass $I11, 8192, rx598_tgt, $I10
    unless $I11, rx598_fail
  # rx pass
    rx598_cur."!cursor_pass"(rx598_pos, "term:sym<self>")
    rx598_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx598_pos)
    .return (rx598_cur)
  rx598_fail:
.annotate "line", 4
    (rx598_rep, rx598_pos, $I10, $P10) = rx598_cur."!mark_fail"(0)
    lt rx598_pos, -1, rx598_done
    eq rx598_pos, -1, rx598_fail
    jump $I10
  rx598_done:
    rx598_cur."!cursor_fail"()
    rx598_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx598_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("149_1258055895.501") :method
.annotate "line", 4
    new $P600, "ResizablePMCArray"
    push $P600, "self"
    .return ($P600)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("150_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx603_tgt
    .local int rx603_pos
    .local int rx603_off
    .local int rx603_eos
    .local int rx603_rep
    .local pmc rx603_cur
    (rx603_cur, rx603_pos, rx603_tgt, $I10) = self."!cursor_start"()
    rx603_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx603_cur
    .local pmc match
    .lex "$/", match
    length rx603_eos, rx603_tgt
    set rx603_off, 0
    lt $I10, 2, rx603_start
    sub rx603_off, $I10, 1
    substr rx603_tgt, rx603_tgt, rx603_off
  rx603_start:
.annotate "line", 305
  # rx subrule "identifier" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."identifier"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx603_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx603_pos, rx603_eos, rx603_fail
    sub $I10, rx603_pos, rx603_off
    substr $S10, rx603_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx603_fail
  # rx subrule "args" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."args"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx603_pos = $P10."pos"()
.annotate "line", 304
  # rx pass
    rx603_cur."!cursor_pass"(rx603_pos, "term:sym<identifier>")
    rx603_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx603_pos)
    .return (rx603_cur)
  rx603_fail:
.annotate "line", 4
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    rx603_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx603_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("151_1258055895.501") :method
.annotate "line", 4
    $P605 = self."!PREFIX__!subrule"("identifier", "")
    new $P606, "ResizablePMCArray"
    push $P606, $P605
    .return ($P606)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("152_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx608_tgt
    .local int rx608_pos
    .local int rx608_off
    .local int rx608_eos
    .local int rx608_rep
    .local pmc rx608_cur
    (rx608_cur, rx608_pos, rx608_tgt, $I10) = self."!cursor_start"()
    rx608_cur."!cursor_debug"("START ", "term:sym<name>")
    rx608_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx608_cur
    .local pmc match
    .lex "$/", match
    length rx608_eos, rx608_tgt
    set rx608_off, 0
    lt $I10, 2, rx608_start
    sub rx608_off, $I10, 1
    substr rx608_tgt, rx608_tgt, rx608_off
  rx608_start:
.annotate "line", 309
  # rx subrule "name" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."name"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx608_pos = $P10."pos"()
  # rx rxquantr612 ** 0..1
    set_addr $I613, rxquantr612_done
    rx608_cur."!mark_push"(0, rx608_pos, $I613)
  rxquantr612_loop:
  # rx subrule "args" subtype=capture negate=
    rx608_cur."!cursor_pos"(rx608_pos)
    $P10 = rx608_cur."args"()
    unless $P10, rx608_fail
    rx608_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx608_pos = $P10."pos"()
    (rx608_rep) = rx608_cur."!mark_commit"($I613)
  rxquantr612_done:
.annotate "line", 308
  # rx pass
    rx608_cur."!cursor_pass"(rx608_pos, "term:sym<name>")
    rx608_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx608_pos)
    .return (rx608_cur)
  rx608_fail:
.annotate "line", 4
    (rx608_rep, rx608_pos, $I10, $P10) = rx608_cur."!mark_fail"(0)
    lt rx608_pos, -1, rx608_done
    eq rx608_pos, -1, rx608_fail
    jump $I10
  rx608_done:
    rx608_cur."!cursor_fail"()
    rx608_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx608_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("153_1258055895.501") :method
.annotate "line", 4
    $P610 = self."!PREFIX__!subrule"("name", "")
    new $P611, "ResizablePMCArray"
    push $P611, $P610
    .return ($P611)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("154_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx615_tgt
    .local int rx615_pos
    .local int rx615_off
    .local int rx615_eos
    .local int rx615_rep
    .local pmc rx615_cur
    (rx615_cur, rx615_pos, rx615_tgt, $I10) = self."!cursor_start"()
    rx615_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx615_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx615_cur
    .local pmc match
    .lex "$/", match
    length rx615_eos, rx615_tgt
    set rx615_off, 0
    lt $I10, 2, rx615_start
    sub rx615_off, $I10, 1
    substr rx615_tgt, rx615_tgt, rx615_off
  rx615_start:
.annotate "line", 313
  # rx literal  "pir::"
    add $I11, rx615_pos, 5
    gt $I11, rx615_eos, rx615_fail
    sub $I11, rx615_pos, rx615_off
    substr $S10, rx615_tgt, $I11, 5
    ne $S10, "pir::", rx615_fail
    add rx615_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_618_fail
    rx615_cur."!mark_push"(0, rx615_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx615_pos, rx615_off
    find_not_cclass $I11, 8192, rx615_tgt, $I10, rx615_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx615_fail
    add rx615_pos, rx615_off, $I11
    set_addr $I10, rxcap_618_fail
    ($I12, $I11) = rx615_cur."!mark_peek"($I10)
    rx615_cur."!cursor_pos"($I11)
    ($P10) = rx615_cur."!cursor_start"()
    $P10."!cursor_pass"(rx615_pos, "")
    rx615_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_618_done
  rxcap_618_fail:
    goto rx615_fail
  rxcap_618_done:
  # rx rxquantr619 ** 0..1
    set_addr $I620, rxquantr619_done
    rx615_cur."!mark_push"(0, rx615_pos, $I620)
  rxquantr619_loop:
  # rx subrule "args" subtype=capture negate=
    rx615_cur."!cursor_pos"(rx615_pos)
    $P10 = rx615_cur."args"()
    unless $P10, rx615_fail
    rx615_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx615_pos = $P10."pos"()
    (rx615_rep) = rx615_cur."!mark_commit"($I620)
  rxquantr619_done:
.annotate "line", 312
  # rx pass
    rx615_cur."!cursor_pass"(rx615_pos, "term:sym<pir::op>")
    rx615_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx615_pos)
    .return (rx615_cur)
  rx615_fail:
.annotate "line", 4
    (rx615_rep, rx615_pos, $I10, $P10) = rx615_cur."!mark_fail"(0)
    lt rx615_pos, -1, rx615_done
    eq rx615_pos, -1, rx615_fail
    jump $I10
  rx615_done:
    rx615_cur."!cursor_fail"()
    rx615_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx615_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("155_1258055895.501") :method
.annotate "line", 4
    new $P617, "ResizablePMCArray"
    push $P617, "pir::"
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("156_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx622_tgt
    .local int rx622_pos
    .local int rx622_off
    .local int rx622_eos
    .local int rx622_rep
    .local pmc rx622_cur
    (rx622_cur, rx622_pos, rx622_tgt, $I10) = self."!cursor_start"()
    rx622_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx622_cur
    .local pmc match
    .lex "$/", match
    length rx622_eos, rx622_tgt
    set rx622_off, 0
    lt $I10, 2, rx622_start
    sub rx622_off, $I10, 1
    substr rx622_tgt, rx622_tgt, rx622_off
  rx622_start:
.annotate "line", 317
  # rx literal  "("
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, "(", rx622_fail
    add rx622_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx622_cur."!cursor_pos"(rx622_pos)
    $P10 = rx622_cur."arglist"()
    unless $P10, rx622_fail
    rx622_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx622_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx622_pos, 1
    gt $I11, rx622_eos, rx622_fail
    sub $I11, rx622_pos, rx622_off
    substr $S10, rx622_tgt, $I11, 1
    ne $S10, ")", rx622_fail
    add rx622_pos, 1
  # rx pass
    rx622_cur."!cursor_pass"(rx622_pos, "args")
    rx622_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx622_pos)
    .return (rx622_cur)
  rx622_fail:
.annotate "line", 4
    (rx622_rep, rx622_pos, $I10, $P10) = rx622_cur."!mark_fail"(0)
    lt rx622_pos, -1, rx622_done
    eq rx622_pos, -1, rx622_fail
    jump $I10
  rx622_done:
    rx622_cur."!cursor_fail"()
    rx622_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx622_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("157_1258055895.501") :method
.annotate "line", 4
    $P624 = self."!PREFIX__!subrule"("arglist", "(")
    new $P625, "ResizablePMCArray"
    push $P625, $P624
    .return ($P625)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("158_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx627_tgt
    .local int rx627_pos
    .local int rx627_off
    .local int rx627_eos
    .local int rx627_rep
    .local pmc rx627_cur
    (rx627_cur, rx627_pos, rx627_tgt, $I10) = self."!cursor_start"()
    rx627_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx627_cur
    .local pmc match
    .lex "$/", match
    length rx627_eos, rx627_tgt
    set rx627_off, 0
    lt $I10, 2, rx627_start
    sub rx627_off, $I10, 1
    substr rx627_tgt, rx627_tgt, rx627_off
  rx627_start:
.annotate "line", 321
  # rx subrule "ws" subtype=method negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."ws"()
    unless $P10, rx627_fail
    rx627_pos = $P10."pos"()
  alt631_0:
.annotate "line", 322
    set_addr $I10, alt631_1
    rx627_cur."!mark_push"(0, rx627_pos, $I10)
.annotate "line", 323
  # rx subrule "EXPR" subtype=capture negate=
    rx627_cur."!cursor_pos"(rx627_pos)
    $P10 = rx627_cur."EXPR"("f=")
    unless $P10, rx627_fail
    rx627_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx627_pos = $P10."pos"()
    goto alt631_end
  alt631_1:
  alt631_end:
.annotate "line", 320
  # rx pass
    rx627_cur."!cursor_pass"(rx627_pos, "arglist")
    rx627_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx627_pos)
    .return (rx627_cur)
  rx627_fail:
.annotate "line", 4
    (rx627_rep, rx627_pos, $I10, $P10) = rx627_cur."!mark_fail"(0)
    lt rx627_pos, -1, rx627_done
    eq rx627_pos, -1, rx627_fail
    jump $I10
  rx627_done:
    rx627_cur."!cursor_fail"()
    rx627_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx627_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("159_1258055895.501") :method
.annotate "line", 4
    $P629 = self."!PREFIX__!subrule"("ws", "")
    new $P630, "ResizablePMCArray"
    push $P630, $P629
    .return ($P630)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("160_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx633_tgt
    .local int rx633_pos
    .local int rx633_off
    .local int rx633_eos
    .local int rx633_rep
    .local pmc rx633_cur
    (rx633_cur, rx633_pos, rx633_tgt, $I10) = self."!cursor_start"()
    rx633_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx633_cur
    .local pmc match
    .lex "$/", match
    length rx633_eos, rx633_tgt
    set rx633_off, 0
    lt $I10, 2, rx633_start
    sub rx633_off, $I10, 1
    substr rx633_tgt, rx633_tgt, rx633_off
  rx633_start:
.annotate "line", 329
  # rx subrule "value" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."value"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx633_pos = $P10."pos"()
  # rx pass
    rx633_cur."!cursor_pass"(rx633_pos, "term:sym<value>")
    rx633_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx633_pos)
    .return (rx633_cur)
  rx633_fail:
.annotate "line", 4
    (rx633_rep, rx633_pos, $I10, $P10) = rx633_cur."!mark_fail"(0)
    lt rx633_pos, -1, rx633_done
    eq rx633_pos, -1, rx633_fail
    jump $I10
  rx633_done:
    rx633_cur."!cursor_fail"()
    rx633_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx633_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("161_1258055895.501") :method
.annotate "line", 4
    $P635 = self."!PREFIX__!subrule"("value", "")
    new $P636, "ResizablePMCArray"
    push $P636, $P635
    .return ($P636)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("162_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx638_tgt
    .local int rx638_pos
    .local int rx638_off
    .local int rx638_eos
    .local int rx638_rep
    .local pmc rx638_cur
    (rx638_cur, rx638_pos, rx638_tgt, $I10) = self."!cursor_start"()
    rx638_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx638_cur
    .local pmc match
    .lex "$/", match
    length rx638_eos, rx638_tgt
    set rx638_off, 0
    lt $I10, 2, rx638_start
    sub rx638_off, $I10, 1
    substr rx638_tgt, rx638_tgt, rx638_off
  rx638_start:
  alt644_0:
.annotate "line", 331
    set_addr $I10, alt644_1
    rx638_cur."!mark_push"(0, rx638_pos, $I10)
.annotate "line", 332
  # rx subrule "dec_number" subtype=capture negate=
    rx638_cur."!cursor_pos"(rx638_pos)
    $P10 = rx638_cur."dec_number"()
    unless $P10, rx638_fail
    rx638_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx638_pos = $P10."pos"()
    goto alt644_end
  alt644_1:
    set_addr $I10, alt644_2
    rx638_cur."!mark_push"(0, rx638_pos, $I10)
.annotate "line", 333
  # rx subrule "quote" subtype=capture negate=
    rx638_cur."!cursor_pos"(rx638_pos)
    $P10 = rx638_cur."quote"()
    unless $P10, rx638_fail
    rx638_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx638_pos = $P10."pos"()
    goto alt644_end
  alt644_2:
.annotate "line", 334
  # rx subrule "integer" subtype=capture negate=
    rx638_cur."!cursor_pos"(rx638_pos)
    $P10 = rx638_cur."integer"()
    unless $P10, rx638_fail
    rx638_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx638_pos = $P10."pos"()
  alt644_end:
.annotate "line", 331
  # rx pass
    rx638_cur."!cursor_pass"(rx638_pos, "value")
    rx638_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx638_pos)
    .return (rx638_cur)
  rx638_fail:
.annotate "line", 4
    (rx638_rep, rx638_pos, $I10, $P10) = rx638_cur."!mark_fail"(0)
    lt rx638_pos, -1, rx638_done
    eq rx638_pos, -1, rx638_fail
    jump $I10
  rx638_done:
    rx638_cur."!cursor_fail"()
    rx638_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx638_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("163_1258055895.501") :method
.annotate "line", 4
    $P640 = self."!PREFIX__!subrule"("integer", "")
    $P641 = self."!PREFIX__!subrule"("quote", "")
    $P642 = self."!PREFIX__!subrule"("dec_number", "")
    new $P643, "ResizablePMCArray"
    push $P643, $P640
    push $P643, $P641
    push $P643, $P642
    .return ($P643)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("164_1258055895.501") :method
.annotate "line", 337
    $P646 = self."!protoregex"("quote")
    .return ($P646)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("165_1258055895.501") :method
.annotate "line", 337
    $P648 = self."!PREFIX__!protoregex"("quote")
    .return ($P648)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("166_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx650_tgt
    .local int rx650_pos
    .local int rx650_off
    .local int rx650_eos
    .local int rx650_rep
    .local pmc rx650_cur
    (rx650_cur, rx650_pos, rx650_tgt, $I10) = self."!cursor_start"()
    rx650_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx650_cur
    .local pmc match
    .lex "$/", match
    length rx650_eos, rx650_tgt
    set rx650_off, 0
    lt $I10, 2, rx650_start
    sub rx650_off, $I10, 1
    substr rx650_tgt, rx650_tgt, rx650_off
  rx650_start:
.annotate "line", 338
  # rx enumcharlist negate=0 zerowidth
    ge rx650_pos, rx650_eos, rx650_fail
    sub $I10, rx650_pos, rx650_off
    substr $S10, rx650_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx650_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."quote_EXPR"(":q")
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx650_pos = $P10."pos"()
  # rx pass
    rx650_cur."!cursor_pass"(rx650_pos, "quote:sym<apos>")
    rx650_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx650_pos)
    .return (rx650_cur)
  rx650_fail:
.annotate "line", 4
    (rx650_rep, rx650_pos, $I10, $P10) = rx650_cur."!mark_fail"(0)
    lt rx650_pos, -1, rx650_done
    eq rx650_pos, -1, rx650_fail
    jump $I10
  rx650_done:
    rx650_cur."!cursor_fail"()
    rx650_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx650_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("167_1258055895.501") :method
.annotate "line", 4
    new $P652, "ResizablePMCArray"
    push $P652, "'"
    .return ($P652)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("168_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx654_tgt
    .local int rx654_pos
    .local int rx654_off
    .local int rx654_eos
    .local int rx654_rep
    .local pmc rx654_cur
    (rx654_cur, rx654_pos, rx654_tgt, $I10) = self."!cursor_start"()
    rx654_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx654_cur
    .local pmc match
    .lex "$/", match
    length rx654_eos, rx654_tgt
    set rx654_off, 0
    lt $I10, 2, rx654_start
    sub rx654_off, $I10, 1
    substr rx654_tgt, rx654_tgt, rx654_off
  rx654_start:
.annotate "line", 339
  # rx enumcharlist negate=0 zerowidth
    ge rx654_pos, rx654_eos, rx654_fail
    sub $I10, rx654_pos, rx654_off
    substr $S10, rx654_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx654_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx654_cur."!cursor_pos"(rx654_pos)
    $P10 = rx654_cur."quote_EXPR"(":qq")
    unless $P10, rx654_fail
    rx654_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx654_pos = $P10."pos"()
  # rx pass
    rx654_cur."!cursor_pass"(rx654_pos, "quote:sym<dblq>")
    rx654_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx654_pos)
    .return (rx654_cur)
  rx654_fail:
.annotate "line", 4
    (rx654_rep, rx654_pos, $I10, $P10) = rx654_cur."!mark_fail"(0)
    lt rx654_pos, -1, rx654_done
    eq rx654_pos, -1, rx654_fail
    jump $I10
  rx654_done:
    rx654_cur."!cursor_fail"()
    rx654_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx654_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("169_1258055895.501") :method
.annotate "line", 4
    new $P656, "ResizablePMCArray"
    push $P656, "\""
    .return ($P656)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("170_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx658_tgt
    .local int rx658_pos
    .local int rx658_off
    .local int rx658_eos
    .local int rx658_rep
    .local pmc rx658_cur
    (rx658_cur, rx658_pos, rx658_tgt, $I10) = self."!cursor_start"()
    rx658_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx658_cur
    .local pmc match
    .lex "$/", match
    length rx658_eos, rx658_tgt
    set rx658_off, 0
    lt $I10, 2, rx658_start
    sub rx658_off, $I10, 1
    substr rx658_tgt, rx658_tgt, rx658_off
  rx658_start:
.annotate "line", 340
  # rx literal  "q"
    add $I11, rx658_pos, 1
    gt $I11, rx658_eos, rx658_fail
    sub $I11, rx658_pos, rx658_off
    substr $S10, rx658_tgt, $I11, 1
    ne $S10, "q", rx658_fail
    add rx658_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx658_pos, rx658_eos, rx658_fail
    sub $I10, rx658_pos, rx658_off
    substr $S10, rx658_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx658_fail
  # rx subrule "ws" subtype=method negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."ws"()
    unless $P10, rx658_fail
    rx658_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx658_cur."!cursor_pos"(rx658_pos)
    $P10 = rx658_cur."quote_EXPR"(":q")
    unless $P10, rx658_fail
    rx658_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx658_pos = $P10."pos"()
  # rx pass
    rx658_cur."!cursor_pass"(rx658_pos, "quote:sym<q>")
    rx658_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx658_pos)
    .return (rx658_cur)
  rx658_fail:
.annotate "line", 4
    (rx658_rep, rx658_pos, $I10, $P10) = rx658_cur."!mark_fail"(0)
    lt rx658_pos, -1, rx658_done
    eq rx658_pos, -1, rx658_fail
    jump $I10
  rx658_done:
    rx658_cur."!cursor_fail"()
    rx658_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx658_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("171_1258055895.501") :method
.annotate "line", 4
    $P660 = self."!PREFIX__!subrule"("ws", "q")
    new $P661, "ResizablePMCArray"
    push $P661, $P660
    .return ($P661)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("172_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx663_tgt
    .local int rx663_pos
    .local int rx663_off
    .local int rx663_eos
    .local int rx663_rep
    .local pmc rx663_cur
    (rx663_cur, rx663_pos, rx663_tgt, $I10) = self."!cursor_start"()
    rx663_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx663_cur
    .local pmc match
    .lex "$/", match
    length rx663_eos, rx663_tgt
    set rx663_off, 0
    lt $I10, 2, rx663_start
    sub rx663_off, $I10, 1
    substr rx663_tgt, rx663_tgt, rx663_off
  rx663_start:
.annotate "line", 341
  # rx literal  "qq"
    add $I11, rx663_pos, 2
    gt $I11, rx663_eos, rx663_fail
    sub $I11, rx663_pos, rx663_off
    substr $S10, rx663_tgt, $I11, 2
    ne $S10, "qq", rx663_fail
    add rx663_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx663_pos, rx663_eos, rx663_fail
    sub $I10, rx663_pos, rx663_off
    substr $S10, rx663_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx663_fail
  # rx subrule "ws" subtype=method negate=
    rx663_cur."!cursor_pos"(rx663_pos)
    $P10 = rx663_cur."ws"()
    unless $P10, rx663_fail
    rx663_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx663_cur."!cursor_pos"(rx663_pos)
    $P10 = rx663_cur."quote_EXPR"(":qq")
    unless $P10, rx663_fail
    rx663_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx663_pos = $P10."pos"()
  # rx pass
    rx663_cur."!cursor_pass"(rx663_pos, "quote:sym<qq>")
    rx663_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx663_pos)
    .return (rx663_cur)
  rx663_fail:
.annotate "line", 4
    (rx663_rep, rx663_pos, $I10, $P10) = rx663_cur."!mark_fail"(0)
    lt rx663_pos, -1, rx663_done
    eq rx663_pos, -1, rx663_fail
    jump $I10
  rx663_done:
    rx663_cur."!cursor_fail"()
    rx663_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx663_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("173_1258055895.501") :method
.annotate "line", 4
    $P665 = self."!PREFIX__!subrule"("ws", "qq")
    new $P666, "ResizablePMCArray"
    push $P666, $P665
    .return ($P666)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("174_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx668_tgt
    .local int rx668_pos
    .local int rx668_off
    .local int rx668_eos
    .local int rx668_rep
    .local pmc rx668_cur
    (rx668_cur, rx668_pos, rx668_tgt, $I10) = self."!cursor_start"()
    rx668_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx668_cur
    .local pmc match
    .lex "$/", match
    length rx668_eos, rx668_tgt
    set rx668_off, 0
    lt $I10, 2, rx668_start
    sub rx668_off, $I10, 1
    substr rx668_tgt, rx668_tgt, rx668_off
  rx668_start:
.annotate "line", 342
  # rx literal  "Q"
    add $I11, rx668_pos, 1
    gt $I11, rx668_eos, rx668_fail
    sub $I11, rx668_pos, rx668_off
    substr $S10, rx668_tgt, $I11, 1
    ne $S10, "Q", rx668_fail
    add rx668_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx668_pos, rx668_eos, rx668_fail
    sub $I10, rx668_pos, rx668_off
    substr $S10, rx668_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx668_fail
  # rx subrule "ws" subtype=method negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."ws"()
    unless $P10, rx668_fail
    rx668_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx668_cur."!cursor_pos"(rx668_pos)
    $P10 = rx668_cur."quote_EXPR"()
    unless $P10, rx668_fail
    rx668_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx668_pos = $P10."pos"()
  # rx pass
    rx668_cur."!cursor_pass"(rx668_pos, "quote:sym<Q>")
    rx668_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx668_pos)
    .return (rx668_cur)
  rx668_fail:
.annotate "line", 4
    (rx668_rep, rx668_pos, $I10, $P10) = rx668_cur."!mark_fail"(0)
    lt rx668_pos, -1, rx668_done
    eq rx668_pos, -1, rx668_fail
    jump $I10
  rx668_done:
    rx668_cur."!cursor_fail"()
    rx668_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx668_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("175_1258055895.501") :method
.annotate "line", 4
    $P670 = self."!PREFIX__!subrule"("ws", "Q")
    new $P671, "ResizablePMCArray"
    push $P671, $P670
    .return ($P671)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("176_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx673_tgt
    .local int rx673_pos
    .local int rx673_off
    .local int rx673_eos
    .local int rx673_rep
    .local pmc rx673_cur
    (rx673_cur, rx673_pos, rx673_tgt, $I10) = self."!cursor_start"()
    rx673_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx673_cur
    .local pmc match
    .lex "$/", match
    length rx673_eos, rx673_tgt
    set rx673_off, 0
    lt $I10, 2, rx673_start
    sub rx673_off, $I10, 1
    substr rx673_tgt, rx673_tgt, rx673_off
  rx673_start:
.annotate "line", 343
  # rx literal  "Q:PIR"
    add $I11, rx673_pos, 5
    gt $I11, rx673_eos, rx673_fail
    sub $I11, rx673_pos, rx673_off
    substr $S10, rx673_tgt, $I11, 5
    ne $S10, "Q:PIR", rx673_fail
    add rx673_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx673_cur."!cursor_pos"(rx673_pos)
    $P10 = rx673_cur."ws"()
    unless $P10, rx673_fail
    rx673_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx673_cur."!cursor_pos"(rx673_pos)
    $P10 = rx673_cur."quote_EXPR"()
    unless $P10, rx673_fail
    rx673_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx673_pos = $P10."pos"()
  # rx pass
    rx673_cur."!cursor_pass"(rx673_pos, "quote:sym<Q:PIR>")
    rx673_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx673_pos)
    .return (rx673_cur)
  rx673_fail:
.annotate "line", 4
    (rx673_rep, rx673_pos, $I10, $P10) = rx673_cur."!mark_fail"(0)
    lt rx673_pos, -1, rx673_done
    eq rx673_pos, -1, rx673_fail
    jump $I10
  rx673_done:
    rx673_cur."!cursor_fail"()
    rx673_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx673_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("177_1258055895.501") :method
.annotate "line", 4
    $P675 = self."!PREFIX__!subrule"("ws", "Q:PIR")
    new $P676, "ResizablePMCArray"
    push $P676, $P675
    .return ($P676)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("178_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx678_tgt
    .local int rx678_pos
    .local int rx678_off
    .local int rx678_eos
    .local int rx678_rep
    .local pmc rx678_cur
    (rx678_cur, rx678_pos, rx678_tgt, $I10) = self."!cursor_start"()
    rx678_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx678_cur
    .local pmc match
    .lex "$/", match
    length rx678_eos, rx678_tgt
    set rx678_off, 0
    lt $I10, 2, rx678_start
    sub rx678_off, $I10, 1
    substr rx678_tgt, rx678_tgt, rx678_off
  rx678_start:
.annotate "line", 345
  # rx enumcharlist negate=0 zerowidth
    ge rx678_pos, rx678_eos, rx678_fail
    sub $I10, rx678_pos, rx678_off
    substr $S10, rx678_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx678_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."quotemod_check"("s")
    unless $P10, rx678_fail
  # rx subrule "variable" subtype=capture negate=
    rx678_cur."!cursor_pos"(rx678_pos)
    $P10 = rx678_cur."variable"()
    unless $P10, rx678_fail
    rx678_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx678_pos = $P10."pos"()
  # rx pass
    rx678_cur."!cursor_pass"(rx678_pos, "quote_escape:sym<$>")
    rx678_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx678_pos)
    .return (rx678_cur)
  rx678_fail:
.annotate "line", 4
    (rx678_rep, rx678_pos, $I10, $P10) = rx678_cur."!mark_fail"(0)
    lt rx678_pos, -1, rx678_done
    eq rx678_pos, -1, rx678_fail
    jump $I10
  rx678_done:
    rx678_cur."!cursor_fail"()
    rx678_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx678_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("179_1258055895.501") :method
.annotate "line", 4
    new $P680, "ResizablePMCArray"
    push $P680, "$"
    .return ($P680)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("180_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx682_tgt
    .local int rx682_pos
    .local int rx682_off
    .local int rx682_eos
    .local int rx682_rep
    .local pmc rx682_cur
    (rx682_cur, rx682_pos, rx682_tgt, $I10) = self."!cursor_start"()
    rx682_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx682_cur
    .local pmc match
    .lex "$/", match
    length rx682_eos, rx682_tgt
    set rx682_off, 0
    lt $I10, 2, rx682_start
    sub rx682_off, $I10, 1
    substr rx682_tgt, rx682_tgt, rx682_off
  rx682_start:
.annotate "line", 346
  # rx enumcharlist negate=0 zerowidth
    ge rx682_pos, rx682_eos, rx682_fail
    sub $I10, rx682_pos, rx682_off
    substr $S10, rx682_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx682_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx682_cur."!cursor_pos"(rx682_pos)
    $P10 = rx682_cur."quotemod_check"("c")
    unless $P10, rx682_fail
  # rx subrule "block" subtype=capture negate=
    rx682_cur."!cursor_pos"(rx682_pos)
    $P10 = rx682_cur."block"()
    unless $P10, rx682_fail
    rx682_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx682_pos = $P10."pos"()
  # rx pass
    rx682_cur."!cursor_pass"(rx682_pos, "quote_escape:sym<{ }>")
    rx682_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx682_pos)
    .return (rx682_cur)
  rx682_fail:
.annotate "line", 4
    (rx682_rep, rx682_pos, $I10, $P10) = rx682_cur."!mark_fail"(0)
    lt rx682_pos, -1, rx682_done
    eq rx682_pos, -1, rx682_fail
    jump $I10
  rx682_done:
    rx682_cur."!cursor_fail"()
    rx682_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx682_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("181_1258055895.501") :method
.annotate "line", 4
    new $P684, "ResizablePMCArray"
    push $P684, "{"
    .return ($P684)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("182_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx686_tgt
    .local int rx686_pos
    .local int rx686_off
    .local int rx686_eos
    .local int rx686_rep
    .local pmc rx686_cur
    (rx686_cur, rx686_pos, rx686_tgt, $I10) = self."!cursor_start"()
    rx686_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx686_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx686_cur
    .local pmc match
    .lex "$/", match
    length rx686_eos, rx686_tgt
    set rx686_off, 0
    lt $I10, 2, rx686_start
    sub rx686_off, $I10, 1
    substr rx686_tgt, rx686_tgt, rx686_off
  rx686_start:
.annotate "line", 348
  # rx literal  "("
    add $I11, rx686_pos, 1
    gt $I11, rx686_eos, rx686_fail
    sub $I11, rx686_pos, rx686_off
    substr $S10, rx686_tgt, $I11, 1
    ne $S10, "(", rx686_fail
    add rx686_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx686_cur."!cursor_pos"(rx686_pos)
    $P10 = rx686_cur."ws"()
    unless $P10, rx686_fail
    rx686_pos = $P10."pos"()
  # rx rxquantr690 ** 0..1
    set_addr $I691, rxquantr690_done
    rx686_cur."!mark_push"(0, rx686_pos, $I691)
  rxquantr690_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx686_cur."!cursor_pos"(rx686_pos)
    $P10 = rx686_cur."EXPR"()
    unless $P10, rx686_fail
    rx686_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx686_pos = $P10."pos"()
    (rx686_rep) = rx686_cur."!mark_commit"($I691)
  rxquantr690_done:
  # rx literal  ")"
    add $I11, rx686_pos, 1
    gt $I11, rx686_eos, rx686_fail
    sub $I11, rx686_pos, rx686_off
    substr $S10, rx686_tgt, $I11, 1
    ne $S10, ")", rx686_fail
    add rx686_pos, 1
  # rx pass
    rx686_cur."!cursor_pass"(rx686_pos, "circumfix:sym<( )>")
    rx686_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx686_pos)
    .return (rx686_cur)
  rx686_fail:
.annotate "line", 4
    (rx686_rep, rx686_pos, $I10, $P10) = rx686_cur."!mark_fail"(0)
    lt rx686_pos, -1, rx686_done
    eq rx686_pos, -1, rx686_fail
    jump $I10
  rx686_done:
    rx686_cur."!cursor_fail"()
    rx686_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx686_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("183_1258055895.501") :method
.annotate "line", 4
    $P688 = self."!PREFIX__!subrule"("ws", "(")
    new $P689, "ResizablePMCArray"
    push $P689, $P688
    .return ($P689)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("184_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx693_tgt
    .local int rx693_pos
    .local int rx693_off
    .local int rx693_eos
    .local int rx693_rep
    .local pmc rx693_cur
    (rx693_cur, rx693_pos, rx693_tgt, $I10) = self."!cursor_start"()
    rx693_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx693_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx693_cur
    .local pmc match
    .lex "$/", match
    length rx693_eos, rx693_tgt
    set rx693_off, 0
    lt $I10, 2, rx693_start
    sub rx693_off, $I10, 1
    substr rx693_tgt, rx693_tgt, rx693_off
  rx693_start:
.annotate "line", 349
  # rx literal  "["
    add $I11, rx693_pos, 1
    gt $I11, rx693_eos, rx693_fail
    sub $I11, rx693_pos, rx693_off
    substr $S10, rx693_tgt, $I11, 1
    ne $S10, "[", rx693_fail
    add rx693_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx693_cur."!cursor_pos"(rx693_pos)
    $P10 = rx693_cur."ws"()
    unless $P10, rx693_fail
    rx693_pos = $P10."pos"()
  # rx rxquantr697 ** 0..1
    set_addr $I698, rxquantr697_done
    rx693_cur."!mark_push"(0, rx693_pos, $I698)
  rxquantr697_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx693_cur."!cursor_pos"(rx693_pos)
    $P10 = rx693_cur."EXPR"()
    unless $P10, rx693_fail
    rx693_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx693_pos = $P10."pos"()
    (rx693_rep) = rx693_cur."!mark_commit"($I698)
  rxquantr697_done:
  # rx literal  "]"
    add $I11, rx693_pos, 1
    gt $I11, rx693_eos, rx693_fail
    sub $I11, rx693_pos, rx693_off
    substr $S10, rx693_tgt, $I11, 1
    ne $S10, "]", rx693_fail
    add rx693_pos, 1
  # rx pass
    rx693_cur."!cursor_pass"(rx693_pos, "circumfix:sym<[ ]>")
    rx693_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx693_pos)
    .return (rx693_cur)
  rx693_fail:
.annotate "line", 4
    (rx693_rep, rx693_pos, $I10, $P10) = rx693_cur."!mark_fail"(0)
    lt rx693_pos, -1, rx693_done
    eq rx693_pos, -1, rx693_fail
    jump $I10
  rx693_done:
    rx693_cur."!cursor_fail"()
    rx693_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx693_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("185_1258055895.501") :method
.annotate "line", 4
    $P695 = self."!PREFIX__!subrule"("ws", "[")
    new $P696, "ResizablePMCArray"
    push $P696, $P695
    .return ($P696)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("186_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx700_tgt
    .local int rx700_pos
    .local int rx700_off
    .local int rx700_eos
    .local int rx700_rep
    .local pmc rx700_cur
    (rx700_cur, rx700_pos, rx700_tgt, $I10) = self."!cursor_start"()
    rx700_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx700_cur
    .local pmc match
    .lex "$/", match
    length rx700_eos, rx700_tgt
    set rx700_off, 0
    lt $I10, 2, rx700_start
    sub rx700_off, $I10, 1
    substr rx700_tgt, rx700_tgt, rx700_off
  rx700_start:
.annotate "line", 350
  # rx enumcharlist negate=0 zerowidth
    ge rx700_pos, rx700_eos, rx700_fail
    sub $I10, rx700_pos, rx700_off
    substr $S10, rx700_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx700_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx700_cur."!cursor_pos"(rx700_pos)
    $P10 = rx700_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx700_fail
    rx700_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx700_pos = $P10."pos"()
  # rx pass
    rx700_cur."!cursor_pass"(rx700_pos, "circumfix:sym<ang>")
    rx700_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx700_pos)
    .return (rx700_cur)
  rx700_fail:
.annotate "line", 4
    (rx700_rep, rx700_pos, $I10, $P10) = rx700_cur."!mark_fail"(0)
    lt rx700_pos, -1, rx700_done
    eq rx700_pos, -1, rx700_fail
    jump $I10
  rx700_done:
    rx700_cur."!cursor_fail"()
    rx700_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx700_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("187_1258055895.501") :method
.annotate "line", 4
    new $P702, "ResizablePMCArray"
    push $P702, "<"
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("188_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx704_tgt
    .local int rx704_pos
    .local int rx704_off
    .local int rx704_eos
    .local int rx704_rep
    .local pmc rx704_cur
    (rx704_cur, rx704_pos, rx704_tgt, $I10) = self."!cursor_start"()
    rx704_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx704_cur
    .local pmc match
    .lex "$/", match
    length rx704_eos, rx704_tgt
    set rx704_off, 0
    lt $I10, 2, rx704_start
    sub rx704_off, $I10, 1
    substr rx704_tgt, rx704_tgt, rx704_off
  rx704_start:
.annotate "line", 351
  # rx enumcharlist negate=0 zerowidth
    ge rx704_pos, rx704_eos, rx704_fail
    sub $I10, rx704_pos, rx704_off
    substr $S10, rx704_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx704_fail
  # rx subrule "pblock" subtype=capture negate=
    rx704_cur."!cursor_pos"(rx704_pos)
    $P10 = rx704_cur."pblock"()
    unless $P10, rx704_fail
    rx704_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx704_pos = $P10."pos"()
  # rx pass
    rx704_cur."!cursor_pass"(rx704_pos, "circumfix:sym<{ }>")
    rx704_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx704_pos)
    .return (rx704_cur)
  rx704_fail:
.annotate "line", 4
    (rx704_rep, rx704_pos, $I10, $P10) = rx704_cur."!mark_fail"(0)
    lt rx704_pos, -1, rx704_done
    eq rx704_pos, -1, rx704_fail
    jump $I10
  rx704_done:
    rx704_cur."!cursor_fail"()
    rx704_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx704_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("189_1258055895.501") :method
.annotate "line", 4
    new $P706, "ResizablePMCArray"
    push $P706, "{"
    .return ($P706)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("190_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx708_tgt
    .local int rx708_pos
    .local int rx708_off
    .local int rx708_eos
    .local int rx708_rep
    .local pmc rx708_cur
    (rx708_cur, rx708_pos, rx708_tgt, $I10) = self."!cursor_start"()
    rx708_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx708_cur
    .local pmc match
    .lex "$/", match
    length rx708_eos, rx708_tgt
    set rx708_off, 0
    lt $I10, 2, rx708_start
    sub rx708_off, $I10, 1
    substr rx708_tgt, rx708_tgt, rx708_off
  rx708_start:
.annotate "line", 352
  # rx subrule "sigil" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."sigil"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx708_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, "(", rx708_fail
    add rx708_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."semilist"()
    unless $P10, rx708_fail
    rx708_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx708_pos = $P10."pos"()
  alt712_0:
    set_addr $I10, alt712_1
    rx708_cur."!mark_push"(0, rx708_pos, $I10)
  # rx literal  ")"
    add $I11, rx708_pos, 1
    gt $I11, rx708_eos, rx708_fail
    sub $I11, rx708_pos, rx708_off
    substr $S10, rx708_tgt, $I11, 1
    ne $S10, ")", rx708_fail
    add rx708_pos, 1
    goto alt712_end
  alt712_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx708_cur."!cursor_pos"(rx708_pos)
    $P10 = rx708_cur."FAILGOAL"("')'")
    unless $P10, rx708_fail
    rx708_pos = $P10."pos"()
  alt712_end:
  # rx pass
    rx708_cur."!cursor_pass"(rx708_pos, "circumfix:sym<sigil>")
    rx708_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx708_pos)
    .return (rx708_cur)
  rx708_fail:
.annotate "line", 4
    (rx708_rep, rx708_pos, $I10, $P10) = rx708_cur."!mark_fail"(0)
    lt rx708_pos, -1, rx708_done
    eq rx708_pos, -1, rx708_fail
    jump $I10
  rx708_done:
    rx708_cur."!cursor_fail"()
    rx708_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx708_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("191_1258055895.501") :method
.annotate "line", 4
    $P710 = self."!PREFIX__!subrule"("sigil", "")
    new $P711, "ResizablePMCArray"
    push $P711, $P710
    .return ($P711)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("192_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 4
    .local string rx715_tgt
    .local int rx715_pos
    .local int rx715_off
    .local int rx715_eos
    .local int rx715_rep
    .local pmc rx715_cur
    (rx715_cur, rx715_pos, rx715_tgt, $I10) = self."!cursor_start"()
    rx715_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx715_cur
    .local pmc match
    .lex "$/", match
    length rx715_eos, rx715_tgt
    set rx715_off, 0
    lt $I10, 2, rx715_start
    sub rx715_off, $I10, 1
    substr rx715_tgt, rx715_tgt, rx715_off
  rx715_start:
.annotate "line", 354
  # rx subrule "ws" subtype=method negate=
    rx715_cur."!cursor_pos"(rx715_pos)
    $P10 = rx715_cur."ws"()
    unless $P10, rx715_fail
    rx715_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx715_cur."!cursor_pos"(rx715_pos)
    $P10 = rx715_cur."statement"()
    unless $P10, rx715_fail
    rx715_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx715_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx715_cur."!cursor_pos"(rx715_pos)
    $P10 = rx715_cur."ws"()
    unless $P10, rx715_fail
    rx715_pos = $P10."pos"()
  # rx pass
    rx715_cur."!cursor_pass"(rx715_pos, "semilist")
    rx715_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx715_pos)
    .return (rx715_cur)
  rx715_fail:
.annotate "line", 4
    (rx715_rep, rx715_pos, $I10, $P10) = rx715_cur."!mark_fail"(0)
    lt rx715_pos, -1, rx715_done
    eq rx715_pos, -1, rx715_fail
    jump $I10
  rx715_done:
    rx715_cur."!cursor_fail"()
    rx715_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx715_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("193_1258055895.501") :method
.annotate "line", 4
    new $P717, "ResizablePMCArray"
    push $P717, ""
    .return ($P717)
.end


.namespace ["NQP";"Grammar"]
.sub "nulltermish"  :subid("194_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx721_tgt
    .local int rx721_pos
    .local int rx721_off
    .local int rx721_eos
    .local int rx721_rep
    .local pmc rx721_cur
    (rx721_cur, rx721_pos, rx721_tgt, $I10) = self."!cursor_start"()
    rx721_cur."!cursor_debug"("START ", "nulltermish")
    .lex unicode:"$\x{a2}", rx721_cur
    .local pmc match
    .lex "$/", match
    length rx721_eos, rx721_tgt
    set rx721_off, 0
    lt $I10, 2, rx721_start
    sub rx721_off, $I10, 1
    substr rx721_tgt, rx721_tgt, rx721_off
  rx721_start:
  alt725_0:
.annotate "line", 376
    set_addr $I10, alt725_1
    rx721_cur."!mark_push"(0, rx721_pos, $I10)
.annotate "line", 377
  # rx subrule "termish" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."termish"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=term")
    rx721_pos = $P10."pos"()
    goto alt725_end
  alt725_1:
  alt725_end:
.annotate "line", 376
  # rx pass
    rx721_cur."!cursor_pass"(rx721_pos, "nulltermish")
    rx721_cur."!cursor_debug"("PASS  ", "nulltermish", " at pos=", rx721_pos)
    .return (rx721_cur)
  rx721_fail:
.annotate "line", 358
    (rx721_rep, rx721_pos, $I10, $P10) = rx721_cur."!mark_fail"(0)
    lt rx721_pos, -1, rx721_done
    eq rx721_pos, -1, rx721_fail
    jump $I10
  rx721_done:
    rx721_cur."!cursor_fail"()
    rx721_cur."!cursor_debug"("FAIL  ", "nulltermish")
    .return (rx721_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__nulltermish"  :subid("195_1258055895.501") :method
.annotate "line", 358
    $P723 = self."!PREFIX__!subrule"("OPER=term", "")
    new $P724, "ResizablePMCArray"
    push $P724, ""
    push $P724, $P723
    .return ($P724)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("196_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx727_tgt
    .local int rx727_pos
    .local int rx727_off
    .local int rx727_eos
    .local int rx727_rep
    .local pmc rx727_cur
    (rx727_cur, rx727_pos, rx727_tgt, $I10) = self."!cursor_start"()
    rx727_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx727_cur
    .local pmc match
    .lex "$/", match
    length rx727_eos, rx727_tgt
    set rx727_off, 0
    lt $I10, 2, rx727_start
    sub rx727_off, $I10, 1
    substr rx727_tgt, rx727_tgt, rx727_off
  rx727_start:
.annotate "line", 381
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."infixstopper"()
    if $P10, rx727_fail
  # rx subrule "infix" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."infix"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx727_pos = $P10."pos"()
  # rx pass
    rx727_cur."!cursor_pass"(rx727_pos, "infixish")
    rx727_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx727_pos)
    .return (rx727_cur)
  rx727_fail:
.annotate "line", 358
    (rx727_rep, rx727_pos, $I10, $P10) = rx727_cur."!mark_fail"(0)
    lt rx727_pos, -1, rx727_done
    eq rx727_pos, -1, rx727_fail
    jump $I10
  rx727_done:
    rx727_cur."!cursor_fail"()
    rx727_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx727_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("197_1258055895.501") :method
.annotate "line", 358
    new $P729, "ResizablePMCArray"
    push $P729, ""
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("198_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx731_tgt
    .local int rx731_pos
    .local int rx731_off
    .local int rx731_eos
    .local int rx731_rep
    .local pmc rx731_cur
    (rx731_cur, rx731_pos, rx731_tgt, $I10) = self."!cursor_start"()
    rx731_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx731_cur
    .local pmc match
    .lex "$/", match
    length rx731_eos, rx731_tgt
    set rx731_off, 0
    lt $I10, 2, rx731_start
    sub rx731_off, $I10, 1
    substr rx731_tgt, rx731_tgt, rx731_off
  rx731_start:
.annotate "line", 382
  # rx subrule "lambda" subtype=zerowidth negate=
    rx731_cur."!cursor_pos"(rx731_pos)
    $P10 = rx731_cur."lambda"()
    unless $P10, rx731_fail
  # rx pass
    rx731_cur."!cursor_pass"(rx731_pos, "infixstopper")
    rx731_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx731_pos)
    .return (rx731_cur)
  rx731_fail:
.annotate "line", 358
    (rx731_rep, rx731_pos, $I10, $P10) = rx731_cur."!mark_fail"(0)
    lt rx731_pos, -1, rx731_done
    eq rx731_pos, -1, rx731_fail
    jump $I10
  rx731_done:
    rx731_cur."!cursor_fail"()
    rx731_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx731_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("199_1258055895.501") :method
.annotate "line", 358
    new $P733, "ResizablePMCArray"
    push $P733, ""
    .return ($P733)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("200_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx735_tgt
    .local int rx735_pos
    .local int rx735_off
    .local int rx735_eos
    .local int rx735_rep
    .local pmc rx735_cur
    (rx735_cur, rx735_pos, rx735_tgt, $I10) = self."!cursor_start"()
    rx735_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx735_cur
    .local pmc match
    .lex "$/", match
    length rx735_eos, rx735_tgt
    set rx735_off, 0
    lt $I10, 2, rx735_start
    sub rx735_off, $I10, 1
    substr rx735_tgt, rx735_tgt, rx735_off
  rx735_start:
.annotate "line", 385
  # rx literal  "["
    add $I11, rx735_pos, 1
    gt $I11, rx735_eos, rx735_fail
    sub $I11, rx735_pos, rx735_off
    substr $S10, rx735_tgt, $I11, 1
    ne $S10, "[", rx735_fail
    add rx735_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."ws"()
    unless $P10, rx735_fail
    rx735_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."EXPR"()
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx735_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx735_pos, 1
    gt $I11, rx735_eos, rx735_fail
    sub $I11, rx735_pos, rx735_off
    substr $S10, rx735_tgt, $I11, 1
    ne $S10, "]", rx735_fail
    add rx735_pos, 1
.annotate "line", 386
  # rx subrule "O" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."O"("%methodop")
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx735_pos = $P10."pos"()
.annotate "line", 384
  # rx pass
    rx735_cur."!cursor_pass"(rx735_pos, "postcircumfix:sym<[ ]>")
    rx735_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx735_pos)
    .return (rx735_cur)
  rx735_fail:
.annotate "line", 358
    (rx735_rep, rx735_pos, $I10, $P10) = rx735_cur."!mark_fail"(0)
    lt rx735_pos, -1, rx735_done
    eq rx735_pos, -1, rx735_fail
    jump $I10
  rx735_done:
    rx735_cur."!cursor_fail"()
    rx735_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx735_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("201_1258055895.501") :method
.annotate "line", 358
    $P737 = self."!PREFIX__!subrule"("ws", "[")
    new $P738, "ResizablePMCArray"
    push $P738, $P737
    .return ($P738)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("202_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx740_tgt
    .local int rx740_pos
    .local int rx740_off
    .local int rx740_eos
    .local int rx740_rep
    .local pmc rx740_cur
    (rx740_cur, rx740_pos, rx740_tgt, $I10) = self."!cursor_start"()
    rx740_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx740_cur
    .local pmc match
    .lex "$/", match
    length rx740_eos, rx740_tgt
    set rx740_off, 0
    lt $I10, 2, rx740_start
    sub rx740_off, $I10, 1
    substr rx740_tgt, rx740_tgt, rx740_off
  rx740_start:
.annotate "line", 390
  # rx literal  "{"
    add $I11, rx740_pos, 1
    gt $I11, rx740_eos, rx740_fail
    sub $I11, rx740_pos, rx740_off
    substr $S10, rx740_tgt, $I11, 1
    ne $S10, "{", rx740_fail
    add rx740_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx740_cur."!cursor_pos"(rx740_pos)
    $P10 = rx740_cur."ws"()
    unless $P10, rx740_fail
    rx740_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx740_cur."!cursor_pos"(rx740_pos)
    $P10 = rx740_cur."EXPR"()
    unless $P10, rx740_fail
    rx740_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx740_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx740_pos, 1
    gt $I11, rx740_eos, rx740_fail
    sub $I11, rx740_pos, rx740_off
    substr $S10, rx740_tgt, $I11, 1
    ne $S10, "}", rx740_fail
    add rx740_pos, 1
.annotate "line", 391
  # rx subrule "O" subtype=capture negate=
    rx740_cur."!cursor_pos"(rx740_pos)
    $P10 = rx740_cur."O"("%methodop")
    unless $P10, rx740_fail
    rx740_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx740_pos = $P10."pos"()
.annotate "line", 389
  # rx pass
    rx740_cur."!cursor_pass"(rx740_pos, "postcircumfix:sym<{ }>")
    rx740_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx740_pos)
    .return (rx740_cur)
  rx740_fail:
.annotate "line", 358
    (rx740_rep, rx740_pos, $I10, $P10) = rx740_cur."!mark_fail"(0)
    lt rx740_pos, -1, rx740_done
    eq rx740_pos, -1, rx740_fail
    jump $I10
  rx740_done:
    rx740_cur."!cursor_fail"()
    rx740_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx740_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("203_1258055895.501") :method
.annotate "line", 358
    $P742 = self."!PREFIX__!subrule"("ws", "{")
    new $P743, "ResizablePMCArray"
    push $P743, $P742
    .return ($P743)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("204_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx745_tgt
    .local int rx745_pos
    .local int rx745_off
    .local int rx745_eos
    .local int rx745_rep
    .local pmc rx745_cur
    (rx745_cur, rx745_pos, rx745_tgt, $I10) = self."!cursor_start"()
    rx745_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx745_cur
    .local pmc match
    .lex "$/", match
    length rx745_eos, rx745_tgt
    set rx745_off, 0
    lt $I10, 2, rx745_start
    sub rx745_off, $I10, 1
    substr rx745_tgt, rx745_tgt, rx745_off
  rx745_start:
.annotate "line", 395
  # rx enumcharlist negate=0 zerowidth
    ge rx745_pos, rx745_eos, rx745_fail
    sub $I10, rx745_pos, rx745_off
    substr $S10, rx745_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx745_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."quote_EXPR"(":q")
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx745_pos = $P10."pos"()
.annotate "line", 396
  # rx subrule "O" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."O"("%methodop")
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx745_pos = $P10."pos"()
.annotate "line", 394
  # rx pass
    rx745_cur."!cursor_pass"(rx745_pos, "postcircumfix:sym<ang>")
    rx745_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx745_pos)
    .return (rx745_cur)
  rx745_fail:
.annotate "line", 358
    (rx745_rep, rx745_pos, $I10, $P10) = rx745_cur."!mark_fail"(0)
    lt rx745_pos, -1, rx745_done
    eq rx745_pos, -1, rx745_fail
    jump $I10
  rx745_done:
    rx745_cur."!cursor_fail"()
    rx745_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx745_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("205_1258055895.501") :method
.annotate "line", 358
    new $P747, "ResizablePMCArray"
    push $P747, "<"
    .return ($P747)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("206_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx749_tgt
    .local int rx749_pos
    .local int rx749_off
    .local int rx749_eos
    .local int rx749_rep
    .local pmc rx749_cur
    (rx749_cur, rx749_pos, rx749_tgt, $I10) = self."!cursor_start"()
    rx749_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx749_cur
    .local pmc match
    .lex "$/", match
    length rx749_eos, rx749_tgt
    set rx749_off, 0
    lt $I10, 2, rx749_start
    sub rx749_off, $I10, 1
    substr rx749_tgt, rx749_tgt, rx749_off
  rx749_start:
.annotate "line", 400
  # rx literal  "("
    add $I11, rx749_pos, 1
    gt $I11, rx749_eos, rx749_fail
    sub $I11, rx749_pos, rx749_off
    substr $S10, rx749_tgt, $I11, 1
    ne $S10, "(", rx749_fail
    add rx749_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx749_cur."!cursor_pos"(rx749_pos)
    $P10 = rx749_cur."ws"()
    unless $P10, rx749_fail
    rx749_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx749_cur."!cursor_pos"(rx749_pos)
    $P10 = rx749_cur."arglist"()
    unless $P10, rx749_fail
    rx749_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx749_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx749_pos, 1
    gt $I11, rx749_eos, rx749_fail
    sub $I11, rx749_pos, rx749_off
    substr $S10, rx749_tgt, $I11, 1
    ne $S10, ")", rx749_fail
    add rx749_pos, 1
.annotate "line", 401
  # rx subrule "O" subtype=capture negate=
    rx749_cur."!cursor_pos"(rx749_pos)
    $P10 = rx749_cur."O"("%methodop")
    unless $P10, rx749_fail
    rx749_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx749_pos = $P10."pos"()
.annotate "line", 399
  # rx pass
    rx749_cur."!cursor_pass"(rx749_pos, "postcircumfix:sym<( )>")
    rx749_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx749_pos)
    .return (rx749_cur)
  rx749_fail:
.annotate "line", 358
    (rx749_rep, rx749_pos, $I10, $P10) = rx749_cur."!mark_fail"(0)
    lt rx749_pos, -1, rx749_done
    eq rx749_pos, -1, rx749_fail
    jump $I10
  rx749_done:
    rx749_cur."!cursor_fail"()
    rx749_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx749_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("207_1258055895.501") :method
.annotate "line", 358
    $P751 = self."!PREFIX__!subrule"("ws", "(")
    new $P752, "ResizablePMCArray"
    push $P752, $P751
    .return ($P752)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("208_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx754_tgt
    .local int rx754_pos
    .local int rx754_off
    .local int rx754_eos
    .local int rx754_rep
    .local pmc rx754_cur
    (rx754_cur, rx754_pos, rx754_tgt, $I10) = self."!cursor_start"()
    rx754_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx754_cur
    .local pmc match
    .lex "$/", match
    length rx754_eos, rx754_tgt
    set rx754_off, 0
    lt $I10, 2, rx754_start
    sub rx754_off, $I10, 1
    substr rx754_tgt, rx754_tgt, rx754_off
  rx754_start:
.annotate "line", 404
  # rx subrule "dotty" subtype=capture negate=
    rx754_cur."!cursor_pos"(rx754_pos)
    $P10 = rx754_cur."dotty"()
    unless $P10, rx754_fail
    rx754_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx754_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx754_cur."!cursor_pos"(rx754_pos)
    $P10 = rx754_cur."O"("%methodop")
    unless $P10, rx754_fail
    rx754_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx754_pos = $P10."pos"()
  # rx pass
    rx754_cur."!cursor_pass"(rx754_pos, "postfix:sym<.>")
    rx754_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx754_pos)
    .return (rx754_cur)
  rx754_fail:
.annotate "line", 358
    (rx754_rep, rx754_pos, $I10, $P10) = rx754_cur."!mark_fail"(0)
    lt rx754_pos, -1, rx754_done
    eq rx754_pos, -1, rx754_fail
    jump $I10
  rx754_done:
    rx754_cur."!cursor_fail"()
    rx754_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx754_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("209_1258055895.501") :method
.annotate "line", 358
    $P756 = self."!PREFIX__!subrule"("dotty", "")
    new $P757, "ResizablePMCArray"
    push $P757, $P756
    .return ($P757)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("210_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx759_tgt
    .local int rx759_pos
    .local int rx759_off
    .local int rx759_eos
    .local int rx759_rep
    .local pmc rx759_cur
    (rx759_cur, rx759_pos, rx759_tgt, $I10) = self."!cursor_start"()
    rx759_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx759_cur
    .local pmc match
    .lex "$/", match
    length rx759_eos, rx759_tgt
    set rx759_off, 0
    lt $I10, 2, rx759_start
    sub rx759_off, $I10, 1
    substr rx759_tgt, rx759_tgt, rx759_off
  rx759_start:
.annotate "line", 406
  # rx subcapture "sym"
    set_addr $I10, rxcap_763_fail
    rx759_cur."!mark_push"(0, rx759_pos, $I10)
  # rx literal  "++"
    add $I11, rx759_pos, 2
    gt $I11, rx759_eos, rx759_fail
    sub $I11, rx759_pos, rx759_off
    substr $S10, rx759_tgt, $I11, 2
    ne $S10, "++", rx759_fail
    add rx759_pos, 2
    set_addr $I10, rxcap_763_fail
    ($I12, $I11) = rx759_cur."!mark_peek"($I10)
    rx759_cur."!cursor_pos"($I11)
    ($P10) = rx759_cur."!cursor_start"()
    $P10."!cursor_pass"(rx759_pos, "")
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_763_done
  rxcap_763_fail:
    goto rx759_fail
  rxcap_763_done:
  # rx subrule "O" subtype=capture negate=
    rx759_cur."!cursor_pos"(rx759_pos)
    $P10 = rx759_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx759_fail
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx759_pos = $P10."pos"()
  # rx pass
    rx759_cur."!cursor_pass"(rx759_pos, "prefix:sym<++>")
    rx759_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx759_pos)
    .return (rx759_cur)
  rx759_fail:
.annotate "line", 358
    (rx759_rep, rx759_pos, $I10, $P10) = rx759_cur."!mark_fail"(0)
    lt rx759_pos, -1, rx759_done
    eq rx759_pos, -1, rx759_fail
    jump $I10
  rx759_done:
    rx759_cur."!cursor_fail"()
    rx759_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx759_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("211_1258055895.501") :method
.annotate "line", 358
    $P761 = self."!PREFIX__!subrule"("O", "++")
    new $P762, "ResizablePMCArray"
    push $P762, $P761
    .return ($P762)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("212_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx765_tgt
    .local int rx765_pos
    .local int rx765_off
    .local int rx765_eos
    .local int rx765_rep
    .local pmc rx765_cur
    (rx765_cur, rx765_pos, rx765_tgt, $I10) = self."!cursor_start"()
    rx765_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx765_cur
    .local pmc match
    .lex "$/", match
    length rx765_eos, rx765_tgt
    set rx765_off, 0
    lt $I10, 2, rx765_start
    sub rx765_off, $I10, 1
    substr rx765_tgt, rx765_tgt, rx765_off
  rx765_start:
.annotate "line", 407
  # rx subcapture "sym"
    set_addr $I10, rxcap_769_fail
    rx765_cur."!mark_push"(0, rx765_pos, $I10)
  # rx literal  "--"
    add $I11, rx765_pos, 2
    gt $I11, rx765_eos, rx765_fail
    sub $I11, rx765_pos, rx765_off
    substr $S10, rx765_tgt, $I11, 2
    ne $S10, "--", rx765_fail
    add rx765_pos, 2
    set_addr $I10, rxcap_769_fail
    ($I12, $I11) = rx765_cur."!mark_peek"($I10)
    rx765_cur."!cursor_pos"($I11)
    ($P10) = rx765_cur."!cursor_start"()
    $P10."!cursor_pass"(rx765_pos, "")
    rx765_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_769_done
  rxcap_769_fail:
    goto rx765_fail
  rxcap_769_done:
  # rx subrule "O" subtype=capture negate=
    rx765_cur."!cursor_pos"(rx765_pos)
    $P10 = rx765_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx765_fail
    rx765_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx765_pos = $P10."pos"()
  # rx pass
    rx765_cur."!cursor_pass"(rx765_pos, "prefix:sym<-->")
    rx765_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx765_pos)
    .return (rx765_cur)
  rx765_fail:
.annotate "line", 358
    (rx765_rep, rx765_pos, $I10, $P10) = rx765_cur."!mark_fail"(0)
    lt rx765_pos, -1, rx765_done
    eq rx765_pos, -1, rx765_fail
    jump $I10
  rx765_done:
    rx765_cur."!cursor_fail"()
    rx765_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx765_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("213_1258055895.501") :method
.annotate "line", 358
    $P767 = self."!PREFIX__!subrule"("O", "--")
    new $P768, "ResizablePMCArray"
    push $P768, $P767
    .return ($P768)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("214_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx771_tgt
    .local int rx771_pos
    .local int rx771_off
    .local int rx771_eos
    .local int rx771_rep
    .local pmc rx771_cur
    (rx771_cur, rx771_pos, rx771_tgt, $I10) = self."!cursor_start"()
    rx771_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx771_cur
    .local pmc match
    .lex "$/", match
    length rx771_eos, rx771_tgt
    set rx771_off, 0
    lt $I10, 2, rx771_start
    sub rx771_off, $I10, 1
    substr rx771_tgt, rx771_tgt, rx771_off
  rx771_start:
.annotate "line", 410
  # rx subcapture "sym"
    set_addr $I10, rxcap_775_fail
    rx771_cur."!mark_push"(0, rx771_pos, $I10)
  # rx literal  "++"
    add $I11, rx771_pos, 2
    gt $I11, rx771_eos, rx771_fail
    sub $I11, rx771_pos, rx771_off
    substr $S10, rx771_tgt, $I11, 2
    ne $S10, "++", rx771_fail
    add rx771_pos, 2
    set_addr $I10, rxcap_775_fail
    ($I12, $I11) = rx771_cur."!mark_peek"($I10)
    rx771_cur."!cursor_pos"($I11)
    ($P10) = rx771_cur."!cursor_start"()
    $P10."!cursor_pass"(rx771_pos, "")
    rx771_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_775_done
  rxcap_775_fail:
    goto rx771_fail
  rxcap_775_done:
  # rx subrule "O" subtype=capture negate=
    rx771_cur."!cursor_pos"(rx771_pos)
    $P10 = rx771_cur."O"("%autoincrement")
    unless $P10, rx771_fail
    rx771_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx771_pos = $P10."pos"()
  # rx pass
    rx771_cur."!cursor_pass"(rx771_pos, "postfix:sym<++>")
    rx771_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx771_pos)
    .return (rx771_cur)
  rx771_fail:
.annotate "line", 358
    (rx771_rep, rx771_pos, $I10, $P10) = rx771_cur."!mark_fail"(0)
    lt rx771_pos, -1, rx771_done
    eq rx771_pos, -1, rx771_fail
    jump $I10
  rx771_done:
    rx771_cur."!cursor_fail"()
    rx771_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx771_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("215_1258055895.501") :method
.annotate "line", 358
    $P773 = self."!PREFIX__!subrule"("O", "++")
    new $P774, "ResizablePMCArray"
    push $P774, $P773
    .return ($P774)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("216_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt, $I10) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx777_cur
    .local pmc match
    .lex "$/", match
    length rx777_eos, rx777_tgt
    set rx777_off, 0
    lt $I10, 2, rx777_start
    sub rx777_off, $I10, 1
    substr rx777_tgt, rx777_tgt, rx777_off
  rx777_start:
.annotate "line", 411
  # rx subcapture "sym"
    set_addr $I10, rxcap_781_fail
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  # rx literal  "--"
    add $I11, rx777_pos, 2
    gt $I11, rx777_eos, rx777_fail
    sub $I11, rx777_pos, rx777_off
    substr $S10, rx777_tgt, $I11, 2
    ne $S10, "--", rx777_fail
    add rx777_pos, 2
    set_addr $I10, rxcap_781_fail
    ($I12, $I11) = rx777_cur."!mark_peek"($I10)
    rx777_cur."!cursor_pos"($I11)
    ($P10) = rx777_cur."!cursor_start"()
    $P10."!cursor_pass"(rx777_pos, "")
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_781_done
  rxcap_781_fail:
    goto rx777_fail
  rxcap_781_done:
  # rx subrule "O" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."O"("%autoincrement")
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx777_pos = $P10."pos"()
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "postfix:sym<-->")
    rx777_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 358
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("217_1258055895.501") :method
.annotate "line", 358
    $P779 = self."!PREFIX__!subrule"("O", "--")
    new $P780, "ResizablePMCArray"
    push $P780, $P779
    .return ($P780)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("218_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx783_tgt
    .local int rx783_pos
    .local int rx783_off
    .local int rx783_eos
    .local int rx783_rep
    .local pmc rx783_cur
    (rx783_cur, rx783_pos, rx783_tgt, $I10) = self."!cursor_start"()
    rx783_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx783_cur
    .local pmc match
    .lex "$/", match
    length rx783_eos, rx783_tgt
    set rx783_off, 0
    lt $I10, 2, rx783_start
    sub rx783_off, $I10, 1
    substr rx783_tgt, rx783_tgt, rx783_off
  rx783_start:
.annotate "line", 413
  # rx subcapture "sym"
    set_addr $I10, rxcap_787_fail
    rx783_cur."!mark_push"(0, rx783_pos, $I10)
  # rx literal  "**"
    add $I11, rx783_pos, 2
    gt $I11, rx783_eos, rx783_fail
    sub $I11, rx783_pos, rx783_off
    substr $S10, rx783_tgt, $I11, 2
    ne $S10, "**", rx783_fail
    add rx783_pos, 2
    set_addr $I10, rxcap_787_fail
    ($I12, $I11) = rx783_cur."!mark_peek"($I10)
    rx783_cur."!cursor_pos"($I11)
    ($P10) = rx783_cur."!cursor_start"()
    $P10."!cursor_pass"(rx783_pos, "")
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_787_done
  rxcap_787_fail:
    goto rx783_fail
  rxcap_787_done:
  # rx subrule "O" subtype=capture negate=
    rx783_cur."!cursor_pos"(rx783_pos)
    $P10 = rx783_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx783_fail
    rx783_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx783_pos = $P10."pos"()
  # rx pass
    rx783_cur."!cursor_pass"(rx783_pos, "infix:sym<**>")
    rx783_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx783_pos)
    .return (rx783_cur)
  rx783_fail:
.annotate "line", 358
    (rx783_rep, rx783_pos, $I10, $P10) = rx783_cur."!mark_fail"(0)
    lt rx783_pos, -1, rx783_done
    eq rx783_pos, -1, rx783_fail
    jump $I10
  rx783_done:
    rx783_cur."!cursor_fail"()
    rx783_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx783_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("219_1258055895.501") :method
.annotate "line", 358
    $P785 = self."!PREFIX__!subrule"("O", "**")
    new $P786, "ResizablePMCArray"
    push $P786, $P785
    .return ($P786)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("220_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx789_tgt
    .local int rx789_pos
    .local int rx789_off
    .local int rx789_eos
    .local int rx789_rep
    .local pmc rx789_cur
    (rx789_cur, rx789_pos, rx789_tgt, $I10) = self."!cursor_start"()
    rx789_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx789_cur
    .local pmc match
    .lex "$/", match
    length rx789_eos, rx789_tgt
    set rx789_off, 0
    lt $I10, 2, rx789_start
    sub rx789_off, $I10, 1
    substr rx789_tgt, rx789_tgt, rx789_off
  rx789_start:
.annotate "line", 415
  # rx subcapture "sym"
    set_addr $I10, rxcap_793_fail
    rx789_cur."!mark_push"(0, rx789_pos, $I10)
  # rx literal  "+"
    add $I11, rx789_pos, 1
    gt $I11, rx789_eos, rx789_fail
    sub $I11, rx789_pos, rx789_off
    substr $S10, rx789_tgt, $I11, 1
    ne $S10, "+", rx789_fail
    add rx789_pos, 1
    set_addr $I10, rxcap_793_fail
    ($I12, $I11) = rx789_cur."!mark_peek"($I10)
    rx789_cur."!cursor_pos"($I11)
    ($P10) = rx789_cur."!cursor_start"()
    $P10."!cursor_pass"(rx789_pos, "")
    rx789_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_793_done
  rxcap_793_fail:
    goto rx789_fail
  rxcap_793_done:
  # rx subrule "O" subtype=capture negate=
    rx789_cur."!cursor_pos"(rx789_pos)
    $P10 = rx789_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx789_fail
    rx789_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx789_pos = $P10."pos"()
  # rx pass
    rx789_cur."!cursor_pass"(rx789_pos, "prefix:sym<+>")
    rx789_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx789_pos)
    .return (rx789_cur)
  rx789_fail:
.annotate "line", 358
    (rx789_rep, rx789_pos, $I10, $P10) = rx789_cur."!mark_fail"(0)
    lt rx789_pos, -1, rx789_done
    eq rx789_pos, -1, rx789_fail
    jump $I10
  rx789_done:
    rx789_cur."!cursor_fail"()
    rx789_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx789_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("221_1258055895.501") :method
.annotate "line", 358
    $P791 = self."!PREFIX__!subrule"("O", "+")
    new $P792, "ResizablePMCArray"
    push $P792, $P791
    .return ($P792)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("222_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx795_tgt
    .local int rx795_pos
    .local int rx795_off
    .local int rx795_eos
    .local int rx795_rep
    .local pmc rx795_cur
    (rx795_cur, rx795_pos, rx795_tgt, $I10) = self."!cursor_start"()
    rx795_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx795_cur
    .local pmc match
    .lex "$/", match
    length rx795_eos, rx795_tgt
    set rx795_off, 0
    lt $I10, 2, rx795_start
    sub rx795_off, $I10, 1
    substr rx795_tgt, rx795_tgt, rx795_off
  rx795_start:
.annotate "line", 416
  # rx subcapture "sym"
    set_addr $I10, rxcap_799_fail
    rx795_cur."!mark_push"(0, rx795_pos, $I10)
  # rx literal  "~"
    add $I11, rx795_pos, 1
    gt $I11, rx795_eos, rx795_fail
    sub $I11, rx795_pos, rx795_off
    substr $S10, rx795_tgt, $I11, 1
    ne $S10, "~", rx795_fail
    add rx795_pos, 1
    set_addr $I10, rxcap_799_fail
    ($I12, $I11) = rx795_cur."!mark_peek"($I10)
    rx795_cur."!cursor_pos"($I11)
    ($P10) = rx795_cur."!cursor_start"()
    $P10."!cursor_pass"(rx795_pos, "")
    rx795_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_799_done
  rxcap_799_fail:
    goto rx795_fail
  rxcap_799_done:
  # rx subrule "O" subtype=capture negate=
    rx795_cur."!cursor_pos"(rx795_pos)
    $P10 = rx795_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx795_fail
    rx795_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx795_pos = $P10."pos"()
  # rx pass
    rx795_cur."!cursor_pass"(rx795_pos, "prefix:sym<~>")
    rx795_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx795_pos)
    .return (rx795_cur)
  rx795_fail:
.annotate "line", 358
    (rx795_rep, rx795_pos, $I10, $P10) = rx795_cur."!mark_fail"(0)
    lt rx795_pos, -1, rx795_done
    eq rx795_pos, -1, rx795_fail
    jump $I10
  rx795_done:
    rx795_cur."!cursor_fail"()
    rx795_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx795_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("223_1258055895.501") :method
.annotate "line", 358
    $P797 = self."!PREFIX__!subrule"("O", "~")
    new $P798, "ResizablePMCArray"
    push $P798, $P797
    .return ($P798)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("224_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx801_tgt
    .local int rx801_pos
    .local int rx801_off
    .local int rx801_eos
    .local int rx801_rep
    .local pmc rx801_cur
    (rx801_cur, rx801_pos, rx801_tgt, $I10) = self."!cursor_start"()
    rx801_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx801_cur
    .local pmc match
    .lex "$/", match
    length rx801_eos, rx801_tgt
    set rx801_off, 0
    lt $I10, 2, rx801_start
    sub rx801_off, $I10, 1
    substr rx801_tgt, rx801_tgt, rx801_off
  rx801_start:
.annotate "line", 417
  # rx subcapture "sym"
    set_addr $I10, rxcap_805_fail
    rx801_cur."!mark_push"(0, rx801_pos, $I10)
  # rx literal  "-"
    add $I11, rx801_pos, 1
    gt $I11, rx801_eos, rx801_fail
    sub $I11, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I11, 1
    ne $S10, "-", rx801_fail
    add rx801_pos, 1
    set_addr $I10, rxcap_805_fail
    ($I12, $I11) = rx801_cur."!mark_peek"($I10)
    rx801_cur."!cursor_pos"($I11)
    ($P10) = rx801_cur."!cursor_start"()
    $P10."!cursor_pass"(rx801_pos, "")
    rx801_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_805_done
  rxcap_805_fail:
    goto rx801_fail
  rxcap_805_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx801_pos, rx801_eos, rx801_fail
    sub $I10, rx801_pos, rx801_off
    substr $S10, rx801_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx801_fail
  # rx subrule "O" subtype=capture negate=
    rx801_cur."!cursor_pos"(rx801_pos)
    $P10 = rx801_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx801_fail
    rx801_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx801_pos = $P10."pos"()
  # rx pass
    rx801_cur."!cursor_pass"(rx801_pos, "prefix:sym<->")
    rx801_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx801_pos)
    .return (rx801_cur)
  rx801_fail:
.annotate "line", 358
    (rx801_rep, rx801_pos, $I10, $P10) = rx801_cur."!mark_fail"(0)
    lt rx801_pos, -1, rx801_done
    eq rx801_pos, -1, rx801_fail
    jump $I10
  rx801_done:
    rx801_cur."!cursor_fail"()
    rx801_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx801_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("225_1258055895.501") :method
.annotate "line", 358
    $P803 = self."!PREFIX__!subrule"("O", "-")
    new $P804, "ResizablePMCArray"
    push $P804, $P803
    .return ($P804)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("226_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx807_tgt
    .local int rx807_pos
    .local int rx807_off
    .local int rx807_eos
    .local int rx807_rep
    .local pmc rx807_cur
    (rx807_cur, rx807_pos, rx807_tgt, $I10) = self."!cursor_start"()
    rx807_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx807_cur
    .local pmc match
    .lex "$/", match
    length rx807_eos, rx807_tgt
    set rx807_off, 0
    lt $I10, 2, rx807_start
    sub rx807_off, $I10, 1
    substr rx807_tgt, rx807_tgt, rx807_off
  rx807_start:
.annotate "line", 418
  # rx subcapture "sym"
    set_addr $I10, rxcap_811_fail
    rx807_cur."!mark_push"(0, rx807_pos, $I10)
  # rx literal  "?"
    add $I11, rx807_pos, 1
    gt $I11, rx807_eos, rx807_fail
    sub $I11, rx807_pos, rx807_off
    substr $S10, rx807_tgt, $I11, 1
    ne $S10, "?", rx807_fail
    add rx807_pos, 1
    set_addr $I10, rxcap_811_fail
    ($I12, $I11) = rx807_cur."!mark_peek"($I10)
    rx807_cur."!cursor_pos"($I11)
    ($P10) = rx807_cur."!cursor_start"()
    $P10."!cursor_pass"(rx807_pos, "")
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_811_done
  rxcap_811_fail:
    goto rx807_fail
  rxcap_811_done:
  # rx subrule "O" subtype=capture negate=
    rx807_cur."!cursor_pos"(rx807_pos)
    $P10 = rx807_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx807_fail
    rx807_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx807_pos = $P10."pos"()
  # rx pass
    rx807_cur."!cursor_pass"(rx807_pos, "prefix:sym<?>")
    rx807_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx807_pos)
    .return (rx807_cur)
  rx807_fail:
.annotate "line", 358
    (rx807_rep, rx807_pos, $I10, $P10) = rx807_cur."!mark_fail"(0)
    lt rx807_pos, -1, rx807_done
    eq rx807_pos, -1, rx807_fail
    jump $I10
  rx807_done:
    rx807_cur."!cursor_fail"()
    rx807_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx807_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("227_1258055895.501") :method
.annotate "line", 358
    $P809 = self."!PREFIX__!subrule"("O", "?")
    new $P810, "ResizablePMCArray"
    push $P810, $P809
    .return ($P810)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("228_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx813_tgt
    .local int rx813_pos
    .local int rx813_off
    .local int rx813_eos
    .local int rx813_rep
    .local pmc rx813_cur
    (rx813_cur, rx813_pos, rx813_tgt, $I10) = self."!cursor_start"()
    rx813_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx813_cur
    .local pmc match
    .lex "$/", match
    length rx813_eos, rx813_tgt
    set rx813_off, 0
    lt $I10, 2, rx813_start
    sub rx813_off, $I10, 1
    substr rx813_tgt, rx813_tgt, rx813_off
  rx813_start:
.annotate "line", 419
  # rx subcapture "sym"
    set_addr $I10, rxcap_817_fail
    rx813_cur."!mark_push"(0, rx813_pos, $I10)
  # rx literal  "!"
    add $I11, rx813_pos, 1
    gt $I11, rx813_eos, rx813_fail
    sub $I11, rx813_pos, rx813_off
    substr $S10, rx813_tgt, $I11, 1
    ne $S10, "!", rx813_fail
    add rx813_pos, 1
    set_addr $I10, rxcap_817_fail
    ($I12, $I11) = rx813_cur."!mark_peek"($I10)
    rx813_cur."!cursor_pos"($I11)
    ($P10) = rx813_cur."!cursor_start"()
    $P10."!cursor_pass"(rx813_pos, "")
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_817_done
  rxcap_817_fail:
    goto rx813_fail
  rxcap_817_done:
  # rx subrule "O" subtype=capture negate=
    rx813_cur."!cursor_pos"(rx813_pos)
    $P10 = rx813_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx813_fail
    rx813_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx813_pos = $P10."pos"()
  # rx pass
    rx813_cur."!cursor_pass"(rx813_pos, "prefix:sym<!>")
    rx813_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx813_pos)
    .return (rx813_cur)
  rx813_fail:
.annotate "line", 358
    (rx813_rep, rx813_pos, $I10, $P10) = rx813_cur."!mark_fail"(0)
    lt rx813_pos, -1, rx813_done
    eq rx813_pos, -1, rx813_fail
    jump $I10
  rx813_done:
    rx813_cur."!cursor_fail"()
    rx813_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx813_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("229_1258055895.501") :method
.annotate "line", 358
    $P815 = self."!PREFIX__!subrule"("O", "!")
    new $P816, "ResizablePMCArray"
    push $P816, $P815
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("230_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx819_tgt
    .local int rx819_pos
    .local int rx819_off
    .local int rx819_eos
    .local int rx819_rep
    .local pmc rx819_cur
    (rx819_cur, rx819_pos, rx819_tgt, $I10) = self."!cursor_start"()
    rx819_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx819_cur
    .local pmc match
    .lex "$/", match
    length rx819_eos, rx819_tgt
    set rx819_off, 0
    lt $I10, 2, rx819_start
    sub rx819_off, $I10, 1
    substr rx819_tgt, rx819_tgt, rx819_off
  rx819_start:
.annotate "line", 420
  # rx subcapture "sym"
    set_addr $I10, rxcap_823_fail
    rx819_cur."!mark_push"(0, rx819_pos, $I10)
  # rx literal  "|"
    add $I11, rx819_pos, 1
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 1
    ne $S10, "|", rx819_fail
    add rx819_pos, 1
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
  # rx subrule "O" subtype=capture negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."O"("%symbolic_unary")
    unless $P10, rx819_fail
    rx819_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx819_pos = $P10."pos"()
  # rx pass
    rx819_cur."!cursor_pass"(rx819_pos, "prefix:sym<|>")
    rx819_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx819_pos)
    .return (rx819_cur)
  rx819_fail:
.annotate "line", 358
    (rx819_rep, rx819_pos, $I10, $P10) = rx819_cur."!mark_fail"(0)
    lt rx819_pos, -1, rx819_done
    eq rx819_pos, -1, rx819_fail
    jump $I10
  rx819_done:
    rx819_cur."!cursor_fail"()
    rx819_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx819_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("231_1258055895.501") :method
.annotate "line", 358
    $P821 = self."!PREFIX__!subrule"("O", "|")
    new $P822, "ResizablePMCArray"
    push $P822, $P821
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("232_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx825_tgt
    .local int rx825_pos
    .local int rx825_off
    .local int rx825_eos
    .local int rx825_rep
    .local pmc rx825_cur
    (rx825_cur, rx825_pos, rx825_tgt, $I10) = self."!cursor_start"()
    rx825_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx825_cur
    .local pmc match
    .lex "$/", match
    length rx825_eos, rx825_tgt
    set rx825_off, 0
    lt $I10, 2, rx825_start
    sub rx825_off, $I10, 1
    substr rx825_tgt, rx825_tgt, rx825_off
  rx825_start:
.annotate "line", 422
  # rx subcapture "sym"
    set_addr $I10, rxcap_829_fail
    rx825_cur."!mark_push"(0, rx825_pos, $I10)
  # rx literal  "*"
    add $I11, rx825_pos, 1
    gt $I11, rx825_eos, rx825_fail
    sub $I11, rx825_pos, rx825_off
    substr $S10, rx825_tgt, $I11, 1
    ne $S10, "*", rx825_fail
    add rx825_pos, 1
    set_addr $I10, rxcap_829_fail
    ($I12, $I11) = rx825_cur."!mark_peek"($I10)
    rx825_cur."!cursor_pos"($I11)
    ($P10) = rx825_cur."!cursor_start"()
    $P10."!cursor_pass"(rx825_pos, "")
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_829_done
  rxcap_829_fail:
    goto rx825_fail
  rxcap_829_done:
  # rx subrule "O" subtype=capture negate=
    rx825_cur."!cursor_pos"(rx825_pos)
    $P10 = rx825_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx825_fail
    rx825_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx825_pos = $P10."pos"()
  # rx pass
    rx825_cur."!cursor_pass"(rx825_pos, "infix:sym<*>")
    rx825_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx825_pos)
    .return (rx825_cur)
  rx825_fail:
.annotate "line", 358
    (rx825_rep, rx825_pos, $I10, $P10) = rx825_cur."!mark_fail"(0)
    lt rx825_pos, -1, rx825_done
    eq rx825_pos, -1, rx825_fail
    jump $I10
  rx825_done:
    rx825_cur."!cursor_fail"()
    rx825_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx825_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("233_1258055895.501") :method
.annotate "line", 358
    $P827 = self."!PREFIX__!subrule"("O", "*")
    new $P828, "ResizablePMCArray"
    push $P828, $P827
    .return ($P828)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("234_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx831_tgt
    .local int rx831_pos
    .local int rx831_off
    .local int rx831_eos
    .local int rx831_rep
    .local pmc rx831_cur
    (rx831_cur, rx831_pos, rx831_tgt, $I10) = self."!cursor_start"()
    rx831_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx831_cur
    .local pmc match
    .lex "$/", match
    length rx831_eos, rx831_tgt
    set rx831_off, 0
    lt $I10, 2, rx831_start
    sub rx831_off, $I10, 1
    substr rx831_tgt, rx831_tgt, rx831_off
  rx831_start:
.annotate "line", 423
  # rx subcapture "sym"
    set_addr $I10, rxcap_835_fail
    rx831_cur."!mark_push"(0, rx831_pos, $I10)
  # rx literal  "/"
    add $I11, rx831_pos, 1
    gt $I11, rx831_eos, rx831_fail
    sub $I11, rx831_pos, rx831_off
    substr $S10, rx831_tgt, $I11, 1
    ne $S10, "/", rx831_fail
    add rx831_pos, 1
    set_addr $I10, rxcap_835_fail
    ($I12, $I11) = rx831_cur."!mark_peek"($I10)
    rx831_cur."!cursor_pos"($I11)
    ($P10) = rx831_cur."!cursor_start"()
    $P10."!cursor_pass"(rx831_pos, "")
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_835_done
  rxcap_835_fail:
    goto rx831_fail
  rxcap_835_done:
  # rx subrule "O" subtype=capture negate=
    rx831_cur."!cursor_pos"(rx831_pos)
    $P10 = rx831_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx831_fail
    rx831_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx831_pos = $P10."pos"()
  # rx pass
    rx831_cur."!cursor_pass"(rx831_pos, "infix:sym</>")
    rx831_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx831_pos)
    .return (rx831_cur)
  rx831_fail:
.annotate "line", 358
    (rx831_rep, rx831_pos, $I10, $P10) = rx831_cur."!mark_fail"(0)
    lt rx831_pos, -1, rx831_done
    eq rx831_pos, -1, rx831_fail
    jump $I10
  rx831_done:
    rx831_cur."!cursor_fail"()
    rx831_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx831_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("235_1258055895.501") :method
.annotate "line", 358
    $P833 = self."!PREFIX__!subrule"("O", "/")
    new $P834, "ResizablePMCArray"
    push $P834, $P833
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("236_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    (rx837_cur, rx837_pos, rx837_tgt, $I10) = self."!cursor_start"()
    rx837_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx837_cur
    .local pmc match
    .lex "$/", match
    length rx837_eos, rx837_tgt
    set rx837_off, 0
    lt $I10, 2, rx837_start
    sub rx837_off, $I10, 1
    substr rx837_tgt, rx837_tgt, rx837_off
  rx837_start:
.annotate "line", 424
  # rx subcapture "sym"
    set_addr $I10, rxcap_841_fail
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  # rx literal  "%"
    add $I11, rx837_pos, 1
    gt $I11, rx837_eos, rx837_fail
    sub $I11, rx837_pos, rx837_off
    substr $S10, rx837_tgt, $I11, 1
    ne $S10, "%", rx837_fail
    add rx837_pos, 1
    set_addr $I10, rxcap_841_fail
    ($I12, $I11) = rx837_cur."!mark_peek"($I10)
    rx837_cur."!cursor_pos"($I11)
    ($P10) = rx837_cur."!cursor_start"()
    $P10."!cursor_pass"(rx837_pos, "")
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_841_done
  rxcap_841_fail:
    goto rx837_fail
  rxcap_841_done:
  # rx subrule "O" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx837_pos = $P10."pos"()
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "infix:sym<%>")
    rx837_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx837_pos)
    .return (rx837_cur)
  rx837_fail:
.annotate "line", 358
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    rx837_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("237_1258055895.501") :method
.annotate "line", 358
    $P839 = self."!PREFIX__!subrule"("O", "%")
    new $P840, "ResizablePMCArray"
    push $P840, $P839
    .return ($P840)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("238_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx843_tgt
    .local int rx843_pos
    .local int rx843_off
    .local int rx843_eos
    .local int rx843_rep
    .local pmc rx843_cur
    (rx843_cur, rx843_pos, rx843_tgt, $I10) = self."!cursor_start"()
    rx843_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx843_cur
    .local pmc match
    .lex "$/", match
    length rx843_eos, rx843_tgt
    set rx843_off, 0
    lt $I10, 2, rx843_start
    sub rx843_off, $I10, 1
    substr rx843_tgt, rx843_tgt, rx843_off
  rx843_start:
.annotate "line", 426
  # rx subcapture "sym"
    set_addr $I10, rxcap_847_fail
    rx843_cur."!mark_push"(0, rx843_pos, $I10)
  # rx literal  "+"
    add $I11, rx843_pos, 1
    gt $I11, rx843_eos, rx843_fail
    sub $I11, rx843_pos, rx843_off
    substr $S10, rx843_tgt, $I11, 1
    ne $S10, "+", rx843_fail
    add rx843_pos, 1
    set_addr $I10, rxcap_847_fail
    ($I12, $I11) = rx843_cur."!mark_peek"($I10)
    rx843_cur."!cursor_pos"($I11)
    ($P10) = rx843_cur."!cursor_start"()
    $P10."!cursor_pass"(rx843_pos, "")
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_847_done
  rxcap_847_fail:
    goto rx843_fail
  rxcap_847_done:
  # rx subrule "O" subtype=capture negate=
    rx843_cur."!cursor_pos"(rx843_pos)
    $P10 = rx843_cur."O"("%additive, :pirop<add>")
    unless $P10, rx843_fail
    rx843_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx843_pos = $P10."pos"()
  # rx pass
    rx843_cur."!cursor_pass"(rx843_pos, "infix:sym<+>")
    rx843_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx843_pos)
    .return (rx843_cur)
  rx843_fail:
.annotate "line", 358
    (rx843_rep, rx843_pos, $I10, $P10) = rx843_cur."!mark_fail"(0)
    lt rx843_pos, -1, rx843_done
    eq rx843_pos, -1, rx843_fail
    jump $I10
  rx843_done:
    rx843_cur."!cursor_fail"()
    rx843_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx843_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("239_1258055895.501") :method
.annotate "line", 358
    $P845 = self."!PREFIX__!subrule"("O", "+")
    new $P846, "ResizablePMCArray"
    push $P846, $P845
    .return ($P846)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("240_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx849_tgt
    .local int rx849_pos
    .local int rx849_off
    .local int rx849_eos
    .local int rx849_rep
    .local pmc rx849_cur
    (rx849_cur, rx849_pos, rx849_tgt, $I10) = self."!cursor_start"()
    rx849_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx849_cur
    .local pmc match
    .lex "$/", match
    length rx849_eos, rx849_tgt
    set rx849_off, 0
    lt $I10, 2, rx849_start
    sub rx849_off, $I10, 1
    substr rx849_tgt, rx849_tgt, rx849_off
  rx849_start:
.annotate "line", 427
  # rx subcapture "sym"
    set_addr $I10, rxcap_853_fail
    rx849_cur."!mark_push"(0, rx849_pos, $I10)
  # rx literal  "-"
    add $I11, rx849_pos, 1
    gt $I11, rx849_eos, rx849_fail
    sub $I11, rx849_pos, rx849_off
    substr $S10, rx849_tgt, $I11, 1
    ne $S10, "-", rx849_fail
    add rx849_pos, 1
    set_addr $I10, rxcap_853_fail
    ($I12, $I11) = rx849_cur."!mark_peek"($I10)
    rx849_cur."!cursor_pos"($I11)
    ($P10) = rx849_cur."!cursor_start"()
    $P10."!cursor_pass"(rx849_pos, "")
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_853_done
  rxcap_853_fail:
    goto rx849_fail
  rxcap_853_done:
  # rx subrule "O" subtype=capture negate=
    rx849_cur."!cursor_pos"(rx849_pos)
    $P10 = rx849_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx849_fail
    rx849_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx849_pos = $P10."pos"()
  # rx pass
    rx849_cur."!cursor_pass"(rx849_pos, "infix:sym<->")
    rx849_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx849_pos)
    .return (rx849_cur)
  rx849_fail:
.annotate "line", 358
    (rx849_rep, rx849_pos, $I10, $P10) = rx849_cur."!mark_fail"(0)
    lt rx849_pos, -1, rx849_done
    eq rx849_pos, -1, rx849_fail
    jump $I10
  rx849_done:
    rx849_cur."!cursor_fail"()
    rx849_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx849_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("241_1258055895.501") :method
.annotate "line", 358
    $P851 = self."!PREFIX__!subrule"("O", "-")
    new $P852, "ResizablePMCArray"
    push $P852, $P851
    .return ($P852)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("242_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx855_tgt
    .local int rx855_pos
    .local int rx855_off
    .local int rx855_eos
    .local int rx855_rep
    .local pmc rx855_cur
    (rx855_cur, rx855_pos, rx855_tgt, $I10) = self."!cursor_start"()
    rx855_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx855_cur
    .local pmc match
    .lex "$/", match
    length rx855_eos, rx855_tgt
    set rx855_off, 0
    lt $I10, 2, rx855_start
    sub rx855_off, $I10, 1
    substr rx855_tgt, rx855_tgt, rx855_off
  rx855_start:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_859_fail
    rx855_cur."!mark_push"(0, rx855_pos, $I10)
  # rx literal  "~"
    add $I11, rx855_pos, 1
    gt $I11, rx855_eos, rx855_fail
    sub $I11, rx855_pos, rx855_off
    substr $S10, rx855_tgt, $I11, 1
    ne $S10, "~", rx855_fail
    add rx855_pos, 1
    set_addr $I10, rxcap_859_fail
    ($I12, $I11) = rx855_cur."!mark_peek"($I10)
    rx855_cur."!cursor_pos"($I11)
    ($P10) = rx855_cur."!cursor_start"()
    $P10."!cursor_pass"(rx855_pos, "")
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_859_done
  rxcap_859_fail:
    goto rx855_fail
  rxcap_859_done:
  # rx subrule "O" subtype=capture negate=
    rx855_cur."!cursor_pos"(rx855_pos)
    $P10 = rx855_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx855_fail
    rx855_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx855_pos = $P10."pos"()
  # rx pass
    rx855_cur."!cursor_pass"(rx855_pos, "infix:sym<~>")
    rx855_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx855_pos)
    .return (rx855_cur)
  rx855_fail:
.annotate "line", 358
    (rx855_rep, rx855_pos, $I10, $P10) = rx855_cur."!mark_fail"(0)
    lt rx855_pos, -1, rx855_done
    eq rx855_pos, -1, rx855_fail
    jump $I10
  rx855_done:
    rx855_cur."!cursor_fail"()
    rx855_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx855_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("243_1258055895.501") :method
.annotate "line", 358
    $P857 = self."!PREFIX__!subrule"("O", "~")
    new $P858, "ResizablePMCArray"
    push $P858, $P857
    .return ($P858)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("244_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx861_tgt
    .local int rx861_pos
    .local int rx861_off
    .local int rx861_eos
    .local int rx861_rep
    .local pmc rx861_cur
    (rx861_cur, rx861_pos, rx861_tgt, $I10) = self."!cursor_start"()
    rx861_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx861_cur
    .local pmc match
    .lex "$/", match
    length rx861_eos, rx861_tgt
    set rx861_off, 0
    lt $I10, 2, rx861_start
    sub rx861_off, $I10, 1
    substr rx861_tgt, rx861_tgt, rx861_off
  rx861_start:
.annotate "line", 431
  # rx subcapture "sym"
    set_addr $I10, rxcap_865_fail
    rx861_cur."!mark_push"(0, rx861_pos, $I10)
  # rx literal  "=="
    add $I11, rx861_pos, 2
    gt $I11, rx861_eos, rx861_fail
    sub $I11, rx861_pos, rx861_off
    substr $S10, rx861_tgt, $I11, 2
    ne $S10, "==", rx861_fail
    add rx861_pos, 2
    set_addr $I10, rxcap_865_fail
    ($I12, $I11) = rx861_cur."!mark_peek"($I10)
    rx861_cur."!cursor_pos"($I11)
    ($P10) = rx861_cur."!cursor_start"()
    $P10."!cursor_pass"(rx861_pos, "")
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_865_done
  rxcap_865_fail:
    goto rx861_fail
  rxcap_865_done:
  # rx subrule "O" subtype=capture negate=
    rx861_cur."!cursor_pos"(rx861_pos)
    $P10 = rx861_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx861_fail
    rx861_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx861_pos = $P10."pos"()
  # rx pass
    rx861_cur."!cursor_pass"(rx861_pos, "infix:sym<==>")
    rx861_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx861_pos)
    .return (rx861_cur)
  rx861_fail:
.annotate "line", 358
    (rx861_rep, rx861_pos, $I10, $P10) = rx861_cur."!mark_fail"(0)
    lt rx861_pos, -1, rx861_done
    eq rx861_pos, -1, rx861_fail
    jump $I10
  rx861_done:
    rx861_cur."!cursor_fail"()
    rx861_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx861_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("245_1258055895.501") :method
.annotate "line", 358
    $P863 = self."!PREFIX__!subrule"("O", "==")
    new $P864, "ResizablePMCArray"
    push $P864, $P863
    .return ($P864)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("246_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx867_tgt
    .local int rx867_pos
    .local int rx867_off
    .local int rx867_eos
    .local int rx867_rep
    .local pmc rx867_cur
    (rx867_cur, rx867_pos, rx867_tgt, $I10) = self."!cursor_start"()
    rx867_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx867_cur
    .local pmc match
    .lex "$/", match
    length rx867_eos, rx867_tgt
    set rx867_off, 0
    lt $I10, 2, rx867_start
    sub rx867_off, $I10, 1
    substr rx867_tgt, rx867_tgt, rx867_off
  rx867_start:
.annotate "line", 432
  # rx subcapture "sym"
    set_addr $I10, rxcap_871_fail
    rx867_cur."!mark_push"(0, rx867_pos, $I10)
  # rx literal  "!="
    add $I11, rx867_pos, 2
    gt $I11, rx867_eos, rx867_fail
    sub $I11, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I11, 2
    ne $S10, "!=", rx867_fail
    add rx867_pos, 2
    set_addr $I10, rxcap_871_fail
    ($I12, $I11) = rx867_cur."!mark_peek"($I10)
    rx867_cur."!cursor_pos"($I11)
    ($P10) = rx867_cur."!cursor_start"()
    $P10."!cursor_pass"(rx867_pos, "")
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_871_done
  rxcap_871_fail:
    goto rx867_fail
  rxcap_871_done:
  # rx subrule "O" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx867_pos = $P10."pos"()
  # rx pass
    rx867_cur."!cursor_pass"(rx867_pos, "infix:sym<!=>")
    rx867_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx867_pos)
    .return (rx867_cur)
  rx867_fail:
.annotate "line", 358
    (rx867_rep, rx867_pos, $I10, $P10) = rx867_cur."!mark_fail"(0)
    lt rx867_pos, -1, rx867_done
    eq rx867_pos, -1, rx867_fail
    jump $I10
  rx867_done:
    rx867_cur."!cursor_fail"()
    rx867_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx867_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("247_1258055895.501") :method
.annotate "line", 358
    $P869 = self."!PREFIX__!subrule"("O", "!=")
    new $P870, "ResizablePMCArray"
    push $P870, $P869
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("248_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx873_tgt
    .local int rx873_pos
    .local int rx873_off
    .local int rx873_eos
    .local int rx873_rep
    .local pmc rx873_cur
    (rx873_cur, rx873_pos, rx873_tgt, $I10) = self."!cursor_start"()
    rx873_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx873_cur
    .local pmc match
    .lex "$/", match
    length rx873_eos, rx873_tgt
    set rx873_off, 0
    lt $I10, 2, rx873_start
    sub rx873_off, $I10, 1
    substr rx873_tgt, rx873_tgt, rx873_off
  rx873_start:
.annotate "line", 433
  # rx subcapture "sym"
    set_addr $I10, rxcap_877_fail
    rx873_cur."!mark_push"(0, rx873_pos, $I10)
  # rx literal  "<="
    add $I11, rx873_pos, 2
    gt $I11, rx873_eos, rx873_fail
    sub $I11, rx873_pos, rx873_off
    substr $S10, rx873_tgt, $I11, 2
    ne $S10, "<=", rx873_fail
    add rx873_pos, 2
    set_addr $I10, rxcap_877_fail
    ($I12, $I11) = rx873_cur."!mark_peek"($I10)
    rx873_cur."!cursor_pos"($I11)
    ($P10) = rx873_cur."!cursor_start"()
    $P10."!cursor_pass"(rx873_pos, "")
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_877_done
  rxcap_877_fail:
    goto rx873_fail
  rxcap_877_done:
  # rx subrule "O" subtype=capture negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx873_fail
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx873_pos = $P10."pos"()
  # rx pass
    rx873_cur."!cursor_pass"(rx873_pos, "infix:sym<<=>")
    rx873_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx873_pos)
    .return (rx873_cur)
  rx873_fail:
.annotate "line", 358
    (rx873_rep, rx873_pos, $I10, $P10) = rx873_cur."!mark_fail"(0)
    lt rx873_pos, -1, rx873_done
    eq rx873_pos, -1, rx873_fail
    jump $I10
  rx873_done:
    rx873_cur."!cursor_fail"()
    rx873_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx873_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("249_1258055895.501") :method
.annotate "line", 358
    $P875 = self."!PREFIX__!subrule"("O", "<=")
    new $P876, "ResizablePMCArray"
    push $P876, $P875
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("250_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx879_tgt
    .local int rx879_pos
    .local int rx879_off
    .local int rx879_eos
    .local int rx879_rep
    .local pmc rx879_cur
    (rx879_cur, rx879_pos, rx879_tgt, $I10) = self."!cursor_start"()
    rx879_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx879_cur
    .local pmc match
    .lex "$/", match
    length rx879_eos, rx879_tgt
    set rx879_off, 0
    lt $I10, 2, rx879_start
    sub rx879_off, $I10, 1
    substr rx879_tgt, rx879_tgt, rx879_off
  rx879_start:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_883_fail
    rx879_cur."!mark_push"(0, rx879_pos, $I10)
  # rx literal  ">="
    add $I11, rx879_pos, 2
    gt $I11, rx879_eos, rx879_fail
    sub $I11, rx879_pos, rx879_off
    substr $S10, rx879_tgt, $I11, 2
    ne $S10, ">=", rx879_fail
    add rx879_pos, 2
    set_addr $I10, rxcap_883_fail
    ($I12, $I11) = rx879_cur."!mark_peek"($I10)
    rx879_cur."!cursor_pos"($I11)
    ($P10) = rx879_cur."!cursor_start"()
    $P10."!cursor_pass"(rx879_pos, "")
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_883_done
  rxcap_883_fail:
    goto rx879_fail
  rxcap_883_done:
  # rx subrule "O" subtype=capture negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx879_fail
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx879_pos = $P10."pos"()
  # rx pass
    rx879_cur."!cursor_pass"(rx879_pos, "infix:sym<>=>")
    rx879_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx879_pos)
    .return (rx879_cur)
  rx879_fail:
.annotate "line", 358
    (rx879_rep, rx879_pos, $I10, $P10) = rx879_cur."!mark_fail"(0)
    lt rx879_pos, -1, rx879_done
    eq rx879_pos, -1, rx879_fail
    jump $I10
  rx879_done:
    rx879_cur."!cursor_fail"()
    rx879_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx879_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("251_1258055895.501") :method
.annotate "line", 358
    $P881 = self."!PREFIX__!subrule"("O", ">=")
    new $P882, "ResizablePMCArray"
    push $P882, $P881
    .return ($P882)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("252_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx885_tgt
    .local int rx885_pos
    .local int rx885_off
    .local int rx885_eos
    .local int rx885_rep
    .local pmc rx885_cur
    (rx885_cur, rx885_pos, rx885_tgt, $I10) = self."!cursor_start"()
    rx885_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx885_cur
    .local pmc match
    .lex "$/", match
    length rx885_eos, rx885_tgt
    set rx885_off, 0
    lt $I10, 2, rx885_start
    sub rx885_off, $I10, 1
    substr rx885_tgt, rx885_tgt, rx885_off
  rx885_start:
.annotate "line", 435
  # rx subcapture "sym"
    set_addr $I10, rxcap_889_fail
    rx885_cur."!mark_push"(0, rx885_pos, $I10)
  # rx literal  "<"
    add $I11, rx885_pos, 1
    gt $I11, rx885_eos, rx885_fail
    sub $I11, rx885_pos, rx885_off
    substr $S10, rx885_tgt, $I11, 1
    ne $S10, "<", rx885_fail
    add rx885_pos, 1
    set_addr $I10, rxcap_889_fail
    ($I12, $I11) = rx885_cur."!mark_peek"($I10)
    rx885_cur."!cursor_pos"($I11)
    ($P10) = rx885_cur."!cursor_start"()
    $P10."!cursor_pass"(rx885_pos, "")
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_889_done
  rxcap_889_fail:
    goto rx885_fail
  rxcap_889_done:
  # rx subrule "O" subtype=capture negate=
    rx885_cur."!cursor_pos"(rx885_pos)
    $P10 = rx885_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx885_fail
    rx885_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx885_pos = $P10."pos"()
  # rx pass
    rx885_cur."!cursor_pass"(rx885_pos, "infix:sym<<>")
    rx885_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx885_pos)
    .return (rx885_cur)
  rx885_fail:
.annotate "line", 358
    (rx885_rep, rx885_pos, $I10, $P10) = rx885_cur."!mark_fail"(0)
    lt rx885_pos, -1, rx885_done
    eq rx885_pos, -1, rx885_fail
    jump $I10
  rx885_done:
    rx885_cur."!cursor_fail"()
    rx885_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx885_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("253_1258055895.501") :method
.annotate "line", 358
    $P887 = self."!PREFIX__!subrule"("O", "<")
    new $P888, "ResizablePMCArray"
    push $P888, $P887
    .return ($P888)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("254_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx891_tgt
    .local int rx891_pos
    .local int rx891_off
    .local int rx891_eos
    .local int rx891_rep
    .local pmc rx891_cur
    (rx891_cur, rx891_pos, rx891_tgt, $I10) = self."!cursor_start"()
    rx891_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx891_cur
    .local pmc match
    .lex "$/", match
    length rx891_eos, rx891_tgt
    set rx891_off, 0
    lt $I10, 2, rx891_start
    sub rx891_off, $I10, 1
    substr rx891_tgt, rx891_tgt, rx891_off
  rx891_start:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_895_fail
    rx891_cur."!mark_push"(0, rx891_pos, $I10)
  # rx literal  ">"
    add $I11, rx891_pos, 1
    gt $I11, rx891_eos, rx891_fail
    sub $I11, rx891_pos, rx891_off
    substr $S10, rx891_tgt, $I11, 1
    ne $S10, ">", rx891_fail
    add rx891_pos, 1
    set_addr $I10, rxcap_895_fail
    ($I12, $I11) = rx891_cur."!mark_peek"($I10)
    rx891_cur."!cursor_pos"($I11)
    ($P10) = rx891_cur."!cursor_start"()
    $P10."!cursor_pass"(rx891_pos, "")
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_895_done
  rxcap_895_fail:
    goto rx891_fail
  rxcap_895_done:
  # rx subrule "O" subtype=capture negate=
    rx891_cur."!cursor_pos"(rx891_pos)
    $P10 = rx891_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx891_fail
    rx891_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx891_pos = $P10."pos"()
  # rx pass
    rx891_cur."!cursor_pass"(rx891_pos, "infix:sym<>>")
    rx891_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx891_pos)
    .return (rx891_cur)
  rx891_fail:
.annotate "line", 358
    (rx891_rep, rx891_pos, $I10, $P10) = rx891_cur."!mark_fail"(0)
    lt rx891_pos, -1, rx891_done
    eq rx891_pos, -1, rx891_fail
    jump $I10
  rx891_done:
    rx891_cur."!cursor_fail"()
    rx891_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx891_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("255_1258055895.501") :method
.annotate "line", 358
    $P893 = self."!PREFIX__!subrule"("O", ">")
    new $P894, "ResizablePMCArray"
    push $P894, $P893
    .return ($P894)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("256_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx897_tgt
    .local int rx897_pos
    .local int rx897_off
    .local int rx897_eos
    .local int rx897_rep
    .local pmc rx897_cur
    (rx897_cur, rx897_pos, rx897_tgt, $I10) = self."!cursor_start"()
    rx897_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx897_cur
    .local pmc match
    .lex "$/", match
    length rx897_eos, rx897_tgt
    set rx897_off, 0
    lt $I10, 2, rx897_start
    sub rx897_off, $I10, 1
    substr rx897_tgt, rx897_tgt, rx897_off
  rx897_start:
.annotate "line", 437
  # rx subcapture "sym"
    set_addr $I10, rxcap_901_fail
    rx897_cur."!mark_push"(0, rx897_pos, $I10)
  # rx literal  "eq"
    add $I11, rx897_pos, 2
    gt $I11, rx897_eos, rx897_fail
    sub $I11, rx897_pos, rx897_off
    substr $S10, rx897_tgt, $I11, 2
    ne $S10, "eq", rx897_fail
    add rx897_pos, 2
    set_addr $I10, rxcap_901_fail
    ($I12, $I11) = rx897_cur."!mark_peek"($I10)
    rx897_cur."!cursor_pos"($I11)
    ($P10) = rx897_cur."!cursor_start"()
    $P10."!cursor_pass"(rx897_pos, "")
    rx897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_901_done
  rxcap_901_fail:
    goto rx897_fail
  rxcap_901_done:
  # rx subrule "O" subtype=capture negate=
    rx897_cur."!cursor_pos"(rx897_pos)
    $P10 = rx897_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx897_fail
    rx897_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx897_pos = $P10."pos"()
  # rx pass
    rx897_cur."!cursor_pass"(rx897_pos, "infix:sym<eq>")
    rx897_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx897_pos)
    .return (rx897_cur)
  rx897_fail:
.annotate "line", 358
    (rx897_rep, rx897_pos, $I10, $P10) = rx897_cur."!mark_fail"(0)
    lt rx897_pos, -1, rx897_done
    eq rx897_pos, -1, rx897_fail
    jump $I10
  rx897_done:
    rx897_cur."!cursor_fail"()
    rx897_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx897_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("257_1258055895.501") :method
.annotate "line", 358
    $P899 = self."!PREFIX__!subrule"("O", "eq")
    new $P900, "ResizablePMCArray"
    push $P900, $P899
    .return ($P900)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("258_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    (rx903_cur, rx903_pos, rx903_tgt, $I10) = self."!cursor_start"()
    rx903_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx903_cur
    .local pmc match
    .lex "$/", match
    length rx903_eos, rx903_tgt
    set rx903_off, 0
    lt $I10, 2, rx903_start
    sub rx903_off, $I10, 1
    substr rx903_tgt, rx903_tgt, rx903_off
  rx903_start:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_907_fail
    rx903_cur."!mark_push"(0, rx903_pos, $I10)
  # rx literal  "ne"
    add $I11, rx903_pos, 2
    gt $I11, rx903_eos, rx903_fail
    sub $I11, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I11, 2
    ne $S10, "ne", rx903_fail
    add rx903_pos, 2
    set_addr $I10, rxcap_907_fail
    ($I12, $I11) = rx903_cur."!mark_peek"($I10)
    rx903_cur."!cursor_pos"($I11)
    ($P10) = rx903_cur."!cursor_start"()
    $P10."!cursor_pass"(rx903_pos, "")
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_907_done
  rxcap_907_fail:
    goto rx903_fail
  rxcap_907_done:
  # rx subrule "O" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx903_pos = $P10."pos"()
  # rx pass
    rx903_cur."!cursor_pass"(rx903_pos, "infix:sym<ne>")
    rx903_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx903_pos)
    .return (rx903_cur)
  rx903_fail:
.annotate "line", 358
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    rx903_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("259_1258055895.501") :method
.annotate "line", 358
    $P905 = self."!PREFIX__!subrule"("O", "ne")
    new $P906, "ResizablePMCArray"
    push $P906, $P905
    .return ($P906)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("260_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx909_tgt
    .local int rx909_pos
    .local int rx909_off
    .local int rx909_eos
    .local int rx909_rep
    .local pmc rx909_cur
    (rx909_cur, rx909_pos, rx909_tgt, $I10) = self."!cursor_start"()
    rx909_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx909_cur
    .local pmc match
    .lex "$/", match
    length rx909_eos, rx909_tgt
    set rx909_off, 0
    lt $I10, 2, rx909_start
    sub rx909_off, $I10, 1
    substr rx909_tgt, rx909_tgt, rx909_off
  rx909_start:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_913_fail
    rx909_cur."!mark_push"(0, rx909_pos, $I10)
  # rx literal  "le"
    add $I11, rx909_pos, 2
    gt $I11, rx909_eos, rx909_fail
    sub $I11, rx909_pos, rx909_off
    substr $S10, rx909_tgt, $I11, 2
    ne $S10, "le", rx909_fail
    add rx909_pos, 2
    set_addr $I10, rxcap_913_fail
    ($I12, $I11) = rx909_cur."!mark_peek"($I10)
    rx909_cur."!cursor_pos"($I11)
    ($P10) = rx909_cur."!cursor_start"()
    $P10."!cursor_pass"(rx909_pos, "")
    rx909_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_913_done
  rxcap_913_fail:
    goto rx909_fail
  rxcap_913_done:
  # rx subrule "O" subtype=capture negate=
    rx909_cur."!cursor_pos"(rx909_pos)
    $P10 = rx909_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx909_fail
    rx909_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx909_pos = $P10."pos"()
  # rx pass
    rx909_cur."!cursor_pass"(rx909_pos, "infix:sym<le>")
    rx909_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx909_pos)
    .return (rx909_cur)
  rx909_fail:
.annotate "line", 358
    (rx909_rep, rx909_pos, $I10, $P10) = rx909_cur."!mark_fail"(0)
    lt rx909_pos, -1, rx909_done
    eq rx909_pos, -1, rx909_fail
    jump $I10
  rx909_done:
    rx909_cur."!cursor_fail"()
    rx909_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx909_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("261_1258055895.501") :method
.annotate "line", 358
    $P911 = self."!PREFIX__!subrule"("O", "le")
    new $P912, "ResizablePMCArray"
    push $P912, $P911
    .return ($P912)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("262_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx915_tgt
    .local int rx915_pos
    .local int rx915_off
    .local int rx915_eos
    .local int rx915_rep
    .local pmc rx915_cur
    (rx915_cur, rx915_pos, rx915_tgt, $I10) = self."!cursor_start"()
    rx915_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx915_cur
    .local pmc match
    .lex "$/", match
    length rx915_eos, rx915_tgt
    set rx915_off, 0
    lt $I10, 2, rx915_start
    sub rx915_off, $I10, 1
    substr rx915_tgt, rx915_tgt, rx915_off
  rx915_start:
.annotate "line", 440
  # rx subcapture "sym"
    set_addr $I10, rxcap_919_fail
    rx915_cur."!mark_push"(0, rx915_pos, $I10)
  # rx literal  "ge"
    add $I11, rx915_pos, 2
    gt $I11, rx915_eos, rx915_fail
    sub $I11, rx915_pos, rx915_off
    substr $S10, rx915_tgt, $I11, 2
    ne $S10, "ge", rx915_fail
    add rx915_pos, 2
    set_addr $I10, rxcap_919_fail
    ($I12, $I11) = rx915_cur."!mark_peek"($I10)
    rx915_cur."!cursor_pos"($I11)
    ($P10) = rx915_cur."!cursor_start"()
    $P10."!cursor_pass"(rx915_pos, "")
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_919_done
  rxcap_919_fail:
    goto rx915_fail
  rxcap_919_done:
  # rx subrule "O" subtype=capture negate=
    rx915_cur."!cursor_pos"(rx915_pos)
    $P10 = rx915_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx915_fail
    rx915_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx915_pos = $P10."pos"()
  # rx pass
    rx915_cur."!cursor_pass"(rx915_pos, "infix:sym<ge>")
    rx915_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx915_pos)
    .return (rx915_cur)
  rx915_fail:
.annotate "line", 358
    (rx915_rep, rx915_pos, $I10, $P10) = rx915_cur."!mark_fail"(0)
    lt rx915_pos, -1, rx915_done
    eq rx915_pos, -1, rx915_fail
    jump $I10
  rx915_done:
    rx915_cur."!cursor_fail"()
    rx915_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx915_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("263_1258055895.501") :method
.annotate "line", 358
    $P917 = self."!PREFIX__!subrule"("O", "ge")
    new $P918, "ResizablePMCArray"
    push $P918, $P917
    .return ($P918)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("264_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx921_tgt
    .local int rx921_pos
    .local int rx921_off
    .local int rx921_eos
    .local int rx921_rep
    .local pmc rx921_cur
    (rx921_cur, rx921_pos, rx921_tgt, $I10) = self."!cursor_start"()
    rx921_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx921_cur
    .local pmc match
    .lex "$/", match
    length rx921_eos, rx921_tgt
    set rx921_off, 0
    lt $I10, 2, rx921_start
    sub rx921_off, $I10, 1
    substr rx921_tgt, rx921_tgt, rx921_off
  rx921_start:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_925_fail
    rx921_cur."!mark_push"(0, rx921_pos, $I10)
  # rx literal  "lt"
    add $I11, rx921_pos, 2
    gt $I11, rx921_eos, rx921_fail
    sub $I11, rx921_pos, rx921_off
    substr $S10, rx921_tgt, $I11, 2
    ne $S10, "lt", rx921_fail
    add rx921_pos, 2
    set_addr $I10, rxcap_925_fail
    ($I12, $I11) = rx921_cur."!mark_peek"($I10)
    rx921_cur."!cursor_pos"($I11)
    ($P10) = rx921_cur."!cursor_start"()
    $P10."!cursor_pass"(rx921_pos, "")
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_925_done
  rxcap_925_fail:
    goto rx921_fail
  rxcap_925_done:
  # rx subrule "O" subtype=capture negate=
    rx921_cur."!cursor_pos"(rx921_pos)
    $P10 = rx921_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx921_fail
    rx921_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx921_pos = $P10."pos"()
  # rx pass
    rx921_cur."!cursor_pass"(rx921_pos, "infix:sym<lt>")
    rx921_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx921_pos)
    .return (rx921_cur)
  rx921_fail:
.annotate "line", 358
    (rx921_rep, rx921_pos, $I10, $P10) = rx921_cur."!mark_fail"(0)
    lt rx921_pos, -1, rx921_done
    eq rx921_pos, -1, rx921_fail
    jump $I10
  rx921_done:
    rx921_cur."!cursor_fail"()
    rx921_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx921_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("265_1258055895.501") :method
.annotate "line", 358
    $P923 = self."!PREFIX__!subrule"("O", "lt")
    new $P924, "ResizablePMCArray"
    push $P924, $P923
    .return ($P924)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("266_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt, $I10) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx927_cur
    .local pmc match
    .lex "$/", match
    length rx927_eos, rx927_tgt
    set rx927_off, 0
    lt $I10, 2, rx927_start
    sub rx927_off, $I10, 1
    substr rx927_tgt, rx927_tgt, rx927_off
  rx927_start:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_931_fail
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  # rx literal  "gt"
    add $I11, rx927_pos, 2
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 2
    ne $S10, "gt", rx927_fail
    add rx927_pos, 2
    set_addr $I10, rxcap_931_fail
    ($I12, $I11) = rx927_cur."!mark_peek"($I10)
    rx927_cur."!cursor_pos"($I11)
    ($P10) = rx927_cur."!cursor_start"()
    $P10."!cursor_pass"(rx927_pos, "")
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_931_done
  rxcap_931_fail:
    goto rx927_fail
  rxcap_931_done:
  # rx subrule "O" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx927_pos = $P10."pos"()
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "infix:sym<gt>")
    rx927_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate "line", 358
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("267_1258055895.501") :method
.annotate "line", 358
    $P929 = self."!PREFIX__!subrule"("O", "gt")
    new $P930, "ResizablePMCArray"
    push $P930, $P929
    .return ($P930)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("268_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx933_tgt
    .local int rx933_pos
    .local int rx933_off
    .local int rx933_eos
    .local int rx933_rep
    .local pmc rx933_cur
    (rx933_cur, rx933_pos, rx933_tgt, $I10) = self."!cursor_start"()
    rx933_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx933_cur
    .local pmc match
    .lex "$/", match
    length rx933_eos, rx933_tgt
    set rx933_off, 0
    lt $I10, 2, rx933_start
    sub rx933_off, $I10, 1
    substr rx933_tgt, rx933_tgt, rx933_off
  rx933_start:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_937_fail
    rx933_cur."!mark_push"(0, rx933_pos, $I10)
  # rx literal  "=:="
    add $I11, rx933_pos, 3
    gt $I11, rx933_eos, rx933_fail
    sub $I11, rx933_pos, rx933_off
    substr $S10, rx933_tgt, $I11, 3
    ne $S10, "=:=", rx933_fail
    add rx933_pos, 3
    set_addr $I10, rxcap_937_fail
    ($I12, $I11) = rx933_cur."!mark_peek"($I10)
    rx933_cur."!cursor_pos"($I11)
    ($P10) = rx933_cur."!cursor_start"()
    $P10."!cursor_pass"(rx933_pos, "")
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_937_done
  rxcap_937_fail:
    goto rx933_fail
  rxcap_937_done:
  # rx subrule "O" subtype=capture negate=
    rx933_cur."!cursor_pos"(rx933_pos)
    $P10 = rx933_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx933_fail
    rx933_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx933_pos = $P10."pos"()
  # rx pass
    rx933_cur."!cursor_pass"(rx933_pos, "infix:sym<=:=>")
    rx933_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx933_pos)
    .return (rx933_cur)
  rx933_fail:
.annotate "line", 358
    (rx933_rep, rx933_pos, $I10, $P10) = rx933_cur."!mark_fail"(0)
    lt rx933_pos, -1, rx933_done
    eq rx933_pos, -1, rx933_fail
    jump $I10
  rx933_done:
    rx933_cur."!cursor_fail"()
    rx933_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx933_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("269_1258055895.501") :method
.annotate "line", 358
    $P935 = self."!PREFIX__!subrule"("O", "=:=")
    new $P936, "ResizablePMCArray"
    push $P936, $P935
    .return ($P936)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("270_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx939_tgt
    .local int rx939_pos
    .local int rx939_off
    .local int rx939_eos
    .local int rx939_rep
    .local pmc rx939_cur
    (rx939_cur, rx939_pos, rx939_tgt, $I10) = self."!cursor_start"()
    rx939_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx939_cur
    .local pmc match
    .lex "$/", match
    length rx939_eos, rx939_tgt
    set rx939_off, 0
    lt $I10, 2, rx939_start
    sub rx939_off, $I10, 1
    substr rx939_tgt, rx939_tgt, rx939_off
  rx939_start:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_943_fail
    rx939_cur."!mark_push"(0, rx939_pos, $I10)
  # rx literal  "&&"
    add $I11, rx939_pos, 2
    gt $I11, rx939_eos, rx939_fail
    sub $I11, rx939_pos, rx939_off
    substr $S10, rx939_tgt, $I11, 2
    ne $S10, "&&", rx939_fail
    add rx939_pos, 2
    set_addr $I10, rxcap_943_fail
    ($I12, $I11) = rx939_cur."!mark_peek"($I10)
    rx939_cur."!cursor_pos"($I11)
    ($P10) = rx939_cur."!cursor_start"()
    $P10."!cursor_pass"(rx939_pos, "")
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_943_done
  rxcap_943_fail:
    goto rx939_fail
  rxcap_943_done:
  # rx subrule "O" subtype=capture negate=
    rx939_cur."!cursor_pos"(rx939_pos)
    $P10 = rx939_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx939_fail
    rx939_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx939_pos = $P10."pos"()
  # rx pass
    rx939_cur."!cursor_pass"(rx939_pos, "infix:sym<&&>")
    rx939_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx939_pos)
    .return (rx939_cur)
  rx939_fail:
.annotate "line", 358
    (rx939_rep, rx939_pos, $I10, $P10) = rx939_cur."!mark_fail"(0)
    lt rx939_pos, -1, rx939_done
    eq rx939_pos, -1, rx939_fail
    jump $I10
  rx939_done:
    rx939_cur."!cursor_fail"()
    rx939_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx939_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("271_1258055895.501") :method
.annotate "line", 358
    $P941 = self."!PREFIX__!subrule"("O", "&&")
    new $P942, "ResizablePMCArray"
    push $P942, $P941
    .return ($P942)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("272_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx945_tgt
    .local int rx945_pos
    .local int rx945_off
    .local int rx945_eos
    .local int rx945_rep
    .local pmc rx945_cur
    (rx945_cur, rx945_pos, rx945_tgt, $I10) = self."!cursor_start"()
    rx945_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx945_cur
    .local pmc match
    .lex "$/", match
    length rx945_eos, rx945_tgt
    set rx945_off, 0
    lt $I10, 2, rx945_start
    sub rx945_off, $I10, 1
    substr rx945_tgt, rx945_tgt, rx945_off
  rx945_start:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_949_fail
    rx945_cur."!mark_push"(0, rx945_pos, $I10)
  # rx literal  "||"
    add $I11, rx945_pos, 2
    gt $I11, rx945_eos, rx945_fail
    sub $I11, rx945_pos, rx945_off
    substr $S10, rx945_tgt, $I11, 2
    ne $S10, "||", rx945_fail
    add rx945_pos, 2
    set_addr $I10, rxcap_949_fail
    ($I12, $I11) = rx945_cur."!mark_peek"($I10)
    rx945_cur."!cursor_pos"($I11)
    ($P10) = rx945_cur."!cursor_start"()
    $P10."!cursor_pass"(rx945_pos, "")
    rx945_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_949_done
  rxcap_949_fail:
    goto rx945_fail
  rxcap_949_done:
  # rx subrule "O" subtype=capture negate=
    rx945_cur."!cursor_pos"(rx945_pos)
    $P10 = rx945_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx945_fail
    rx945_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx945_pos = $P10."pos"()
  # rx pass
    rx945_cur."!cursor_pass"(rx945_pos, "infix:sym<||>")
    rx945_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx945_pos)
    .return (rx945_cur)
  rx945_fail:
.annotate "line", 358
    (rx945_rep, rx945_pos, $I10, $P10) = rx945_cur."!mark_fail"(0)
    lt rx945_pos, -1, rx945_done
    eq rx945_pos, -1, rx945_fail
    jump $I10
  rx945_done:
    rx945_cur."!cursor_fail"()
    rx945_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx945_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("273_1258055895.501") :method
.annotate "line", 358
    $P947 = self."!PREFIX__!subrule"("O", "||")
    new $P948, "ResizablePMCArray"
    push $P948, $P947
    .return ($P948)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("274_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    (rx951_cur, rx951_pos, rx951_tgt, $I10) = self."!cursor_start"()
    rx951_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx951_cur
    .local pmc match
    .lex "$/", match
    length rx951_eos, rx951_tgt
    set rx951_off, 0
    lt $I10, 2, rx951_start
    sub rx951_off, $I10, 1
    substr rx951_tgt, rx951_tgt, rx951_off
  rx951_start:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_955_fail
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  # rx literal  "//"
    add $I11, rx951_pos, 2
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I11, 2
    ne $S10, "//", rx951_fail
    add rx951_pos, 2
    set_addr $I10, rxcap_955_fail
    ($I12, $I11) = rx951_cur."!mark_peek"($I10)
    rx951_cur."!cursor_pos"($I11)
    ($P10) = rx951_cur."!cursor_start"()
    $P10."!cursor_pass"(rx951_pos, "")
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_955_done
  rxcap_955_fail:
    goto rx951_fail
  rxcap_955_done:
  # rx subrule "O" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx951_fail
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx951_pos = $P10."pos"()
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "infix:sym<//>")
    rx951_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx951_pos)
    .return (rx951_cur)
  rx951_fail:
.annotate "line", 358
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    rx951_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("275_1258055895.501") :method
.annotate "line", 358
    $P953 = self."!PREFIX__!subrule"("O", "//")
    new $P954, "ResizablePMCArray"
    push $P954, $P953
    .return ($P954)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("276_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx957_tgt
    .local int rx957_pos
    .local int rx957_off
    .local int rx957_eos
    .local int rx957_rep
    .local pmc rx957_cur
    (rx957_cur, rx957_pos, rx957_tgt, $I10) = self."!cursor_start"()
    rx957_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx957_cur
    .local pmc match
    .lex "$/", match
    length rx957_eos, rx957_tgt
    set rx957_off, 0
    lt $I10, 2, rx957_start
    sub rx957_off, $I10, 1
    substr rx957_tgt, rx957_tgt, rx957_off
  rx957_start:
.annotate "line", 451
  # rx literal  "??"
    add $I11, rx957_pos, 2
    gt $I11, rx957_eos, rx957_fail
    sub $I11, rx957_pos, rx957_off
    substr $S10, rx957_tgt, $I11, 2
    ne $S10, "??", rx957_fail
    add rx957_pos, 2
.annotate "line", 452
  # rx subrule "ws" subtype=method negate=
    rx957_cur."!cursor_pos"(rx957_pos)
    $P10 = rx957_cur."ws"()
    unless $P10, rx957_fail
    rx957_pos = $P10."pos"()
.annotate "line", 453
  # rx subrule "EXPR" subtype=capture negate=
    rx957_cur."!cursor_pos"(rx957_pos)
    $P10 = rx957_cur."EXPR"("i=")
    unless $P10, rx957_fail
    rx957_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx957_pos = $P10."pos"()
.annotate "line", 454
  # rx literal  "!!"
    add $I11, rx957_pos, 2
    gt $I11, rx957_eos, rx957_fail
    sub $I11, rx957_pos, rx957_off
    substr $S10, rx957_tgt, $I11, 2
    ne $S10, "!!", rx957_fail
    add rx957_pos, 2
.annotate "line", 455
  # rx subrule "O" subtype=capture negate=
    rx957_cur."!cursor_pos"(rx957_pos)
    $P10 = rx957_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx957_fail
    rx957_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx957_pos = $P10."pos"()
.annotate "line", 450
  # rx pass
    rx957_cur."!cursor_pass"(rx957_pos, "infix:sym<?? !!>")
    rx957_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx957_pos)
    .return (rx957_cur)
  rx957_fail:
.annotate "line", 358
    (rx957_rep, rx957_pos, $I10, $P10) = rx957_cur."!mark_fail"(0)
    lt rx957_pos, -1, rx957_done
    eq rx957_pos, -1, rx957_fail
    jump $I10
  rx957_done:
    rx957_cur."!cursor_fail"()
    rx957_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx957_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("277_1258055895.501") :method
.annotate "line", 358
    $P959 = self."!PREFIX__!subrule"("ws", "??")
    new $P960, "ResizablePMCArray"
    push $P960, $P959
    .return ($P960)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("278_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx962_tgt
    .local int rx962_pos
    .local int rx962_off
    .local int rx962_eos
    .local int rx962_rep
    .local pmc rx962_cur
    (rx962_cur, rx962_pos, rx962_tgt, $I10) = self."!cursor_start"()
    rx962_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx962_cur
    .local pmc match
    .lex "$/", match
    length rx962_eos, rx962_tgt
    set rx962_off, 0
    lt $I10, 2, rx962_start
    sub rx962_off, $I10, 1
    substr rx962_tgt, rx962_tgt, rx962_off
  rx962_start:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx962_cur."!mark_push"(0, rx962_pos, $I10)
  # rx literal  "="
    add $I11, rx962_pos, 1
    gt $I11, rx962_eos, rx962_fail
    sub $I11, rx962_pos, rx962_off
    substr $S10, rx962_tgt, $I11, 1
    ne $S10, "=", rx962_fail
    add rx962_pos, 1
    set_addr $I10, rxcap_966_fail
    ($I12, $I11) = rx962_cur."!mark_peek"($I10)
    rx962_cur."!cursor_pos"($I11)
    ($P10) = rx962_cur."!cursor_start"()
    $P10."!cursor_pass"(rx962_pos, "")
    rx962_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_966_done
  rxcap_966_fail:
    goto rx962_fail
  rxcap_966_done:
  # rx subrule "panic" subtype=method negate=
    rx962_cur."!cursor_pos"(rx962_pos)
    $P10 = rx962_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx962_fail
    rx962_pos = $P10."pos"()
.annotate "line", 458
  # rx pass
    rx962_cur."!cursor_pass"(rx962_pos, "infix:sym<=>")
    rx962_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx962_pos)
    .return (rx962_cur)
  rx962_fail:
.annotate "line", 358
    (rx962_rep, rx962_pos, $I10, $P10) = rx962_cur."!mark_fail"(0)
    lt rx962_pos, -1, rx962_done
    eq rx962_pos, -1, rx962_fail
    jump $I10
  rx962_done:
    rx962_cur."!cursor_fail"()
    rx962_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx962_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("279_1258055895.501") :method
.annotate "line", 358
    $P964 = self."!PREFIX__!subrule"("panic", "=")
    new $P965, "ResizablePMCArray"
    push $P965, $P964
    .return ($P965)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("280_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt, $I10) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
    set rx968_off, 0
    lt $I10, 2, rx968_start
    sub rx968_off, $I10, 1
    substr rx968_tgt, rx968_tgt, rx968_off
  rx968_start:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  ":="
    add $I11, rx968_pos, 2
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 2
    ne $S10, ":=", rx968_fail
    add rx968_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "infix:sym<:=>")
    rx968_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 358
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("281_1258055895.501") :method
.annotate "line", 358
    $P970 = self."!PREFIX__!subrule"("O", ":=")
    new $P971, "ResizablePMCArray"
    push $P971, $P970
    .return ($P971)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("282_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt, $I10) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx974_cur
    .local pmc match
    .lex "$/", match
    length rx974_eos, rx974_tgt
    set rx974_off, 0
    lt $I10, 2, rx974_start
    sub rx974_off, $I10, 1
    substr rx974_tgt, rx974_tgt, rx974_off
  rx974_start:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_978_fail
    rx974_cur."!mark_push"(0, rx974_pos, $I10)
  # rx literal  "::="
    add $I11, rx974_pos, 3
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 3
    ne $S10, "::=", rx974_fail
    add rx974_pos, 3
    set_addr $I10, rxcap_978_fail
    ($I12, $I11) = rx974_cur."!mark_peek"($I10)
    rx974_cur."!cursor_pos"($I11)
    ($P10) = rx974_cur."!cursor_start"()
    $P10."!cursor_pass"(rx974_pos, "")
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_978_done
  rxcap_978_fail:
    goto rx974_fail
  rxcap_978_done:
  # rx subrule "O" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "infix:sym<::=>")
    rx974_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate "line", 358
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("283_1258055895.501") :method
.annotate "line", 358
    $P976 = self."!PREFIX__!subrule"("O", "::=")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("284_1258055895.501") :method :outer("11_1258055895.501")
.annotate "line", 358
    .local string rx980_tgt
    .local int rx980_pos
    .local int rx980_off
    .local int rx980_eos
    .local int rx980_rep
    .local pmc rx980_cur
    (rx980_cur, rx980_pos, rx980_tgt, $I10) = self."!cursor_start"()
    rx980_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx980_cur
    .local pmc match
    .lex "$/", match
    length rx980_eos, rx980_tgt
    set rx980_off, 0
    lt $I10, 2, rx980_start
    sub rx980_off, $I10, 1
    substr rx980_tgt, rx980_tgt, rx980_off
  rx980_start:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_984_fail
    rx980_cur."!mark_push"(0, rx980_pos, $I10)
  # rx literal  ","
    add $I11, rx980_pos, 1
    gt $I11, rx980_eos, rx980_fail
    sub $I11, rx980_pos, rx980_off
    substr $S10, rx980_tgt, $I11, 1
    ne $S10, ",", rx980_fail
    add rx980_pos, 1
    set_addr $I10, rxcap_984_fail
    ($I12, $I11) = rx980_cur."!mark_peek"($I10)
    rx980_cur."!cursor_pos"($I11)
    ($P10) = rx980_cur."!cursor_start"()
    $P10."!cursor_pass"(rx980_pos, "")
    rx980_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_984_done
  rxcap_984_fail:
    goto rx980_fail
  rxcap_984_done:
  # rx subrule "O" subtype=capture negate=
    rx980_cur."!cursor_pos"(rx980_pos)
    $P10 = rx980_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx980_fail
    rx980_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx980_pos = $P10."pos"()
  # rx pass
    rx980_cur."!cursor_pass"(rx980_pos, "infix:sym<,>")
    rx980_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx980_pos)
    .return (rx980_cur)
  rx980_fail:
.annotate "line", 358
    (rx980_rep, rx980_pos, $I10, $P10) = rx980_cur."!mark_fail"(0)
    lt rx980_pos, -1, rx980_done
    eq rx980_pos, -1, rx980_fail
    jump $I10
  rx980_done:
    rx980_cur."!cursor_fail"()
    rx980_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx980_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("285_1258055895.501") :method
.annotate "line", 358
    $P982 = self."!PREFIX__!subrule"("O", ",")
    new $P983, "ResizablePMCArray"
    push $P983, $P982
    .return ($P983)
.end


.namespace ["NQP";"Regex"]
.sub "_block985"  :subid("286_1258055895.501") :outer("11_1258055895.501")
.annotate "line", 467
    .const 'Sub' $P1015 = "297_1258055895.501" 
    capture_lex $P1015
    .const 'Sub' $P1003 = "294_1258055895.501" 
    capture_lex $P1003
    .const 'Sub' $P999 = "292_1258055895.501" 
    capture_lex $P999
    .const 'Sub' $P995 = "290_1258055895.501" 
    capture_lex $P995
    .const 'Sub' $P987 = "287_1258055895.501" 
    capture_lex $P987
    .const 'Sub' $P1015 = "297_1258055895.501" 
    capture_lex $P1015
    .return ($P1015)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("287_1258055895.501") :method :outer("286_1258055895.501")
.annotate "line", 467
    .const 'Sub' $P992 = "289_1258055895.501" 
    capture_lex $P992
    .local string rx988_tgt
    .local int rx988_pos
    .local int rx988_off
    .local int rx988_eos
    .local int rx988_rep
    .local pmc rx988_cur
    (rx988_cur, rx988_pos, rx988_tgt, $I10) = self."!cursor_start"()
    rx988_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx988_cur
    .local pmc match
    .lex "$/", match
    length rx988_eos, rx988_tgt
    set rx988_off, 0
    lt $I10, 2, rx988_start
    sub rx988_off, $I10, 1
    substr rx988_tgt, rx988_tgt, rx988_off
  rx988_start:
.annotate "line", 469
  # rx literal  ":"
    add $I11, rx988_pos, 1
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 1
    ne $S10, ":", rx988_fail
    add rx988_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    .const 'Sub' $P992 = "289_1258055895.501" 
    capture_lex $P992
    $P10 = rx988_cur."before"($P992)
    unless $P10, rx988_fail
  # rx subrule "LANG" subtype=capture negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."LANG"("MAIN", "statement")
    unless $P10, rx988_fail
    rx988_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx988_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx988_cur."!cursor_pos"(rx988_pos)
    $P10 = rx988_cur."ws"()
    unless $P10, rx988_fail
    rx988_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx988_pos, 1
    gt $I11, rx988_eos, rx988_fail
    sub $I11, rx988_pos, rx988_off
    substr $S10, rx988_tgt, $I11, 1
    ne $S10, ";", rx988_fail
    add rx988_pos, 1
.annotate "line", 468
  # rx pass
    rx988_cur."!cursor_pass"(rx988_pos, "metachar:sym<:my>")
    rx988_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx988_pos)
    .return (rx988_cur)
  rx988_fail:
.annotate "line", 467
    (rx988_rep, rx988_pos, $I10, $P10) = rx988_cur."!mark_fail"(0)
    lt rx988_pos, -1, rx988_done
    eq rx988_pos, -1, rx988_fail
    jump $I10
  rx988_done:
    rx988_cur."!cursor_fail"()
    rx988_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx988_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("288_1258055895.501") :method
.annotate "line", 467
    new $P990, "ResizablePMCArray"
    push $P990, ":"
    .return ($P990)
.end


.namespace ["NQP";"Regex"]
.sub "_block991"  :anon :subid("289_1258055895.501") :method :outer("287_1258055895.501")
.annotate "line", 469
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    (rx993_cur, rx993_pos, rx993_tgt, $I10) = self."!cursor_start"()
    rx993_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx993_cur
    .local pmc match
    .lex "$/", match
    length rx993_eos, rx993_tgt
    set rx993_off, 0
    lt $I10, 2, rx993_start
    sub rx993_off, $I10, 1
    substr rx993_tgt, rx993_tgt, rx993_off
  rx993_start:
    ge rx993_pos, 0, rxscan994_done
  rxscan994_loop:
    ($P10) = rx993_cur."from"()
    inc $P10
    set rx993_pos, $P10
    ge rx993_pos, rx993_eos, rxscan994_done
    set_addr $I10, rxscan994_loop
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  rxscan994_done:
  # rx literal  "my"
    add $I11, rx993_pos, 2
    gt $I11, rx993_eos, rx993_fail
    sub $I11, rx993_pos, rx993_off
    substr $S10, rx993_tgt, $I11, 2
    ne $S10, "my", rx993_fail
    add rx993_pos, 2
  # rx pass
    rx993_cur."!cursor_pass"(rx993_pos, "")
    rx993_cur."!cursor_debug"("PASS  ", "", " at pos=", rx993_pos)
    .return (rx993_cur)
  rx993_fail:
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    rx993_cur."!cursor_debug"("FAIL  ", "")
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("290_1258055895.501") :method :outer("286_1258055895.501")
.annotate "line", 467
    .local string rx996_tgt
    .local int rx996_pos
    .local int rx996_off
    .local int rx996_eos
    .local int rx996_rep
    .local pmc rx996_cur
    (rx996_cur, rx996_pos, rx996_tgt, $I10) = self."!cursor_start"()
    rx996_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx996_cur
    .local pmc match
    .lex "$/", match
    length rx996_eos, rx996_tgt
    set rx996_off, 0
    lt $I10, 2, rx996_start
    sub rx996_off, $I10, 1
    substr rx996_tgt, rx996_tgt, rx996_off
  rx996_start:
.annotate "line", 473
  # rx enumcharlist negate=0 zerowidth
    ge rx996_pos, rx996_eos, rx996_fail
    sub $I10, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx996_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx996_cur."!cursor_pos"(rx996_pos)
    $P10 = rx996_cur."codeblock"()
    unless $P10, rx996_fail
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx996_pos = $P10."pos"()
.annotate "line", 472
  # rx pass
    rx996_cur."!cursor_pass"(rx996_pos, "metachar:sym<{ }>")
    rx996_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx996_pos)
    .return (rx996_cur)
  rx996_fail:
.annotate "line", 467
    (rx996_rep, rx996_pos, $I10, $P10) = rx996_cur."!mark_fail"(0)
    lt rx996_pos, -1, rx996_done
    eq rx996_pos, -1, rx996_fail
    jump $I10
  rx996_done:
    rx996_cur."!cursor_fail"()
    rx996_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx996_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("291_1258055895.501") :method
.annotate "line", 467
    new $P998, "ResizablePMCArray"
    push $P998, "{"
    .return ($P998)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("292_1258055895.501") :method :outer("286_1258055895.501")
.annotate "line", 467
    .local string rx1000_tgt
    .local int rx1000_pos
    .local int rx1000_off
    .local int rx1000_eos
    .local int rx1000_rep
    .local pmc rx1000_cur
    (rx1000_cur, rx1000_pos, rx1000_tgt, $I10) = self."!cursor_start"()
    rx1000_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1000_cur
    .local pmc match
    .lex "$/", match
    length rx1000_eos, rx1000_tgt
    set rx1000_off, 0
    lt $I10, 2, rx1000_start
    sub rx1000_off, $I10, 1
    substr rx1000_tgt, rx1000_tgt, rx1000_off
  rx1000_start:
.annotate "line", 477
  # rx enumcharlist negate=0 zerowidth
    ge rx1000_pos, rx1000_eos, rx1000_fail
    sub $I10, rx1000_pos, rx1000_off
    substr $S10, rx1000_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1000_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1000_cur."!cursor_pos"(rx1000_pos)
    $P10 = rx1000_cur."codeblock"()
    unless $P10, rx1000_fail
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1000_pos = $P10."pos"()
.annotate "line", 476
  # rx pass
    rx1000_cur."!cursor_pass"(rx1000_pos, "assertion:sym<{ }>")
    rx1000_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1000_pos)
    .return (rx1000_cur)
  rx1000_fail:
.annotate "line", 467
    (rx1000_rep, rx1000_pos, $I10, $P10) = rx1000_cur."!mark_fail"(0)
    lt rx1000_pos, -1, rx1000_done
    eq rx1000_pos, -1, rx1000_fail
    jump $I10
  rx1000_done:
    rx1000_cur."!cursor_fail"()
    rx1000_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1000_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("293_1258055895.501") :method
.annotate "line", 467
    new $P1002, "ResizablePMCArray"
    push $P1002, "{"
    .return ($P1002)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("294_1258055895.501") :method :outer("286_1258055895.501")
.annotate "line", 467
    .const 'Sub' $P1011 = "296_1258055895.501" 
    capture_lex $P1011
    .local string rx1004_tgt
    .local int rx1004_pos
    .local int rx1004_off
    .local int rx1004_eos
    .local int rx1004_rep
    .local pmc rx1004_cur
    (rx1004_cur, rx1004_pos, rx1004_tgt, $I10) = self."!cursor_start"()
    rx1004_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1004_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx1004_cur
    .local pmc match
    .lex "$/", match
    length rx1004_eos, rx1004_tgt
    set rx1004_off, 0
    lt $I10, 2, rx1004_start
    sub rx1004_off, $I10, 1
    substr rx1004_tgt, rx1004_tgt, rx1004_off
  rx1004_start:
.annotate "line", 481
  # rx subcapture "longname"
    set_addr $I10, rxcap_1007_fail
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1004_pos, rx1004_off
    find_not_cclass $I11, 8192, rx1004_tgt, $I10, rx1004_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1004_fail
    add rx1004_pos, rx1004_off, $I11
    set_addr $I10, rxcap_1007_fail
    ($I12, $I11) = rx1004_cur."!mark_peek"($I10)
    rx1004_cur."!cursor_pos"($I11)
    ($P10) = rx1004_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1004_pos, "")
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1007_done
  rxcap_1007_fail:
    goto rx1004_fail
  rxcap_1007_done:
.annotate "line", 488
  # rx rxquantr1008 ** 0..1
    set_addr $I1014, rxquantr1008_done
    rx1004_cur."!mark_push"(0, rx1004_pos, $I1014)
  rxquantr1008_loop:
  alt1009_0:
.annotate "line", 482
    set_addr $I10, alt1009_1
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
.annotate "line", 483
  # rx subrule "before" subtype=zerowidth negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    .const 'Sub' $P1011 = "296_1258055895.501" 
    capture_lex $P1011
    $P10 = rx1004_cur."before"($P1011)
    unless $P10, rx1004_fail
    goto alt1009_end
  alt1009_1:
    set_addr $I10, alt1009_2
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
.annotate "line", 484
  # rx literal  "="
    add $I11, rx1004_pos, 1
    gt $I11, rx1004_eos, rx1004_fail
    sub $I11, rx1004_pos, rx1004_off
    substr $S10, rx1004_tgt, $I11, 1
    ne $S10, "=", rx1004_fail
    add rx1004_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."assertion"()
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1004_pos = $P10."pos"()
    goto alt1009_end
  alt1009_2:
    set_addr $I10, alt1009_3
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
.annotate "line", 485
  # rx literal  ":"
    add $I11, rx1004_pos, 1
    gt $I11, rx1004_eos, rx1004_fail
    sub $I11, rx1004_pos, rx1004_off
    substr $S10, rx1004_tgt, $I11, 1
    ne $S10, ":", rx1004_fail
    add rx1004_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."arglist"()
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1004_pos = $P10."pos"()
    goto alt1009_end
  alt1009_3:
    set_addr $I10, alt1009_4
    rx1004_cur."!mark_push"(0, rx1004_pos, $I10)
.annotate "line", 486
  # rx literal  "("
    add $I11, rx1004_pos, 1
    gt $I11, rx1004_eos, rx1004_fail
    sub $I11, rx1004_pos, rx1004_off
    substr $S10, rx1004_tgt, $I11, 1
    ne $S10, "(", rx1004_fail
    add rx1004_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1004_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1004_pos, 1
    gt $I11, rx1004_eos, rx1004_fail
    sub $I11, rx1004_pos, rx1004_off
    substr $S10, rx1004_tgt, $I11, 1
    ne $S10, ")", rx1004_fail
    add rx1004_pos, 1
    goto alt1009_end
  alt1009_4:
.annotate "line", 487
  # rx subrule "normspace" subtype=method negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."normspace"()
    unless $P10, rx1004_fail
    rx1004_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1004_cur."!cursor_pos"(rx1004_pos)
    $P10 = rx1004_cur."nibbler"()
    unless $P10, rx1004_fail
    rx1004_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1004_pos = $P10."pos"()
  alt1009_end:
.annotate "line", 488
    (rx1004_rep) = rx1004_cur."!mark_commit"($I1014)
  rxquantr1008_done:
.annotate "line", 480
  # rx pass
    rx1004_cur."!cursor_pass"(rx1004_pos, "assertion:sym<name>")
    rx1004_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1004_pos)
    .return (rx1004_cur)
  rx1004_fail:
.annotate "line", 467
    (rx1004_rep, rx1004_pos, $I10, $P10) = rx1004_cur."!mark_fail"(0)
    lt rx1004_pos, -1, rx1004_done
    eq rx1004_pos, -1, rx1004_fail
    jump $I10
  rx1004_done:
    rx1004_cur."!cursor_fail"()
    rx1004_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1004_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("295_1258055895.501") :method
.annotate "line", 467
    new $P1006, "ResizablePMCArray"
    push $P1006, ""
    .return ($P1006)
.end


.namespace ["NQP";"Regex"]
.sub "_block1010"  :anon :subid("296_1258055895.501") :method :outer("294_1258055895.501")
.annotate "line", 483
    .local string rx1012_tgt
    .local int rx1012_pos
    .local int rx1012_off
    .local int rx1012_eos
    .local int rx1012_rep
    .local pmc rx1012_cur
    (rx1012_cur, rx1012_pos, rx1012_tgt, $I10) = self."!cursor_start"()
    rx1012_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1012_cur
    .local pmc match
    .lex "$/", match
    length rx1012_eos, rx1012_tgt
    set rx1012_off, 0
    lt $I10, 2, rx1012_start
    sub rx1012_off, $I10, 1
    substr rx1012_tgt, rx1012_tgt, rx1012_off
  rx1012_start:
    ge rx1012_pos, 0, rxscan1013_done
  rxscan1013_loop:
    ($P10) = rx1012_cur."from"()
    inc $P10
    set rx1012_pos, $P10
    ge rx1012_pos, rx1012_eos, rxscan1013_done
    set_addr $I10, rxscan1013_loop
    rx1012_cur."!mark_push"(0, rx1012_pos, $I10)
  rxscan1013_done:
  # rx literal  ">"
    add $I11, rx1012_pos, 1
    gt $I11, rx1012_eos, rx1012_fail
    sub $I11, rx1012_pos, rx1012_off
    substr $S10, rx1012_tgt, $I11, 1
    ne $S10, ">", rx1012_fail
    add rx1012_pos, 1
  # rx pass
    rx1012_cur."!cursor_pass"(rx1012_pos, "")
    rx1012_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1012_pos)
    .return (rx1012_cur)
  rx1012_fail:
    (rx1012_rep, rx1012_pos, $I10, $P10) = rx1012_cur."!mark_fail"(0)
    lt rx1012_pos, -1, rx1012_done
    eq rx1012_pos, -1, rx1012_fail
    jump $I10
  rx1012_done:
    rx1012_cur."!cursor_fail"()
    rx1012_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1012_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("297_1258055895.501") :method :outer("286_1258055895.501")
.annotate "line", 467
    .local string rx1016_tgt
    .local int rx1016_pos
    .local int rx1016_off
    .local int rx1016_eos
    .local int rx1016_rep
    .local pmc rx1016_cur
    (rx1016_cur, rx1016_pos, rx1016_tgt, $I10) = self."!cursor_start"()
    rx1016_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1016_cur
    .local pmc match
    .lex "$/", match
    length rx1016_eos, rx1016_tgt
    set rx1016_off, 0
    lt $I10, 2, rx1016_start
    sub rx1016_off, $I10, 1
    substr rx1016_tgt, rx1016_tgt, rx1016_off
  rx1016_start:
.annotate "line", 493
  # rx subrule "LANG" subtype=capture negate=
    rx1016_cur."!cursor_pos"(rx1016_pos)
    $P10 = rx1016_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1016_fail
    rx1016_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1016_pos = $P10."pos"()
.annotate "line", 492
  # rx pass
    rx1016_cur."!cursor_pass"(rx1016_pos, "codeblock")
    rx1016_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1016_pos)
    .return (rx1016_cur)
  rx1016_fail:
.annotate "line", 467
    (rx1016_rep, rx1016_pos, $I10, $P10) = rx1016_cur."!mark_fail"(0)
    lt rx1016_pos, -1, rx1016_done
    eq rx1016_pos, -1, rx1016_fail
    jump $I10
  rx1016_done:
    rx1016_cur."!cursor_fail"()
    rx1016_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1016_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("298_1258055895.501") :method
.annotate "line", 467
    $P1018 = self."!PREFIX__!subrule"("block", "")
    new $P1019, "ResizablePMCArray"
    push $P1019, $P1018
    .return ($P1019)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258055906.54293")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1793 = $P14()
.annotate "line", 1
    .return ($P1793)
.end


.namespace []
.sub "" :load :init :subid("post110") :outer("10_1258055906.54293")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258055906.54293" 
    .local pmc block
    set block, $P12
    $P1794 = get_root_global ["parrot"], "P6metaclass"
    $P1794."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258055906.54293") :outer("10_1258055906.54293")
.annotate "line", 3
    .const 'Sub' $P1789 = "109_1258055906.54293" 
    capture_lex $P1789
    get_hll_global $P1725, ["NQP";"RegexActions"], "_block1724" 
    capture_lex $P1725
    .const 'Sub' $P1714 = "103_1258055906.54293" 
    capture_lex $P1714
    .const 'Sub' $P1704 = "102_1258055906.54293" 
    capture_lex $P1704
    .const 'Sub' $P1694 = "101_1258055906.54293" 
    capture_lex $P1694
    .const 'Sub' $P1679 = "100_1258055906.54293" 
    capture_lex $P1679
    .const 'Sub' $P1665 = "99_1258055906.54293" 
    capture_lex $P1665
    .const 'Sub' $P1655 = "98_1258055906.54293" 
    capture_lex $P1655
    .const 'Sub' $P1641 = "97_1258055906.54293" 
    capture_lex $P1641
    .const 'Sub' $P1631 = "96_1258055906.54293" 
    capture_lex $P1631
    .const 'Sub' $P1621 = "95_1258055906.54293" 
    capture_lex $P1621
    .const 'Sub' $P1611 = "94_1258055906.54293" 
    capture_lex $P1611
    .const 'Sub' $P1601 = "93_1258055906.54293" 
    capture_lex $P1601
    .const 'Sub' $P1591 = "92_1258055906.54293" 
    capture_lex $P1591
    .const 'Sub' $P1563 = "91_1258055906.54293" 
    capture_lex $P1563
    .const 'Sub' $P1553 = "90_1258055906.54293" 
    capture_lex $P1553
    .const 'Sub' $P1541 = "89_1258055906.54293" 
    capture_lex $P1541
    .const 'Sub' $P1529 = "88_1258055906.54293" 
    capture_lex $P1529
    .const 'Sub' $P1517 = "87_1258055906.54293" 
    capture_lex $P1517
    .const 'Sub' $P1507 = "86_1258055906.54293" 
    capture_lex $P1507
    .const 'Sub' $P1478 = "85_1258055906.54293" 
    capture_lex $P1478
    .const 'Sub' $P1454 = "84_1258055906.54293" 
    capture_lex $P1454
    .const 'Sub' $P1444 = "83_1258055906.54293" 
    capture_lex $P1444
    .const 'Sub' $P1417 = "82_1258055906.54293" 
    capture_lex $P1417
    .const 'Sub' $P1399 = "81_1258055906.54293" 
    capture_lex $P1399
    .const 'Sub' $P1389 = "80_1258055906.54293" 
    capture_lex $P1389
    .const 'Sub' $P1305 = "77_1258055906.54293" 
    capture_lex $P1305
    .const 'Sub' $P1295 = "76_1258055906.54293" 
    capture_lex $P1295
    .const 'Sub' $P1266 = "75_1258055906.54293" 
    capture_lex $P1266
    .const 'Sub' $P1233 = "74_1258055906.54293" 
    capture_lex $P1233
    .const 'Sub' $P1217 = "73_1258055906.54293" 
    capture_lex $P1217
    .const 'Sub' $P1208 = "72_1258055906.54293" 
    capture_lex $P1208
    .const 'Sub' $P1183 = "71_1258055906.54293" 
    capture_lex $P1183
    .const 'Sub' $P1079 = "68_1258055906.54293" 
    capture_lex $P1079
    .const 'Sub' $P1062 = "67_1258055906.54293" 
    capture_lex $P1062
    .const 'Sub' $P1042 = "66_1258055906.54293" 
    capture_lex $P1042
    .const 'Sub' $P958 = "65_1258055906.54293" 
    capture_lex $P958
    .const 'Sub' $P934 = "63_1258055906.54293" 
    capture_lex $P934
    .const 'Sub' $P900 = "61_1258055906.54293" 
    capture_lex $P900
    .const 'Sub' $P854 = "59_1258055906.54293" 
    capture_lex $P854
    .const 'Sub' $P844 = "58_1258055906.54293" 
    capture_lex $P844
    .const 'Sub' $P834 = "57_1258055906.54293" 
    capture_lex $P834
    .const 'Sub' $P763 = "55_1258055906.54293" 
    capture_lex $P763
    .const 'Sub' $P746 = "54_1258055906.54293" 
    capture_lex $P746
    .const 'Sub' $P736 = "53_1258055906.54293" 
    capture_lex $P736
    .const 'Sub' $P726 = "52_1258055906.54293" 
    capture_lex $P726
    .const 'Sub' $P716 = "51_1258055906.54293" 
    capture_lex $P716
    .const 'Sub' $P692 = "50_1258055906.54293" 
    capture_lex $P692
    .const 'Sub' $P639 = "49_1258055906.54293" 
    capture_lex $P639
    .const 'Sub' $P629 = "48_1258055906.54293" 
    capture_lex $P629
    .const 'Sub' $P580 = "47_1258055906.54293" 
    capture_lex $P580
    .const 'Sub' $P554 = "46_1258055906.54293" 
    capture_lex $P554
    .const 'Sub' $P544 = "45_1258055906.54293" 
    capture_lex $P544
    .const 'Sub' $P534 = "44_1258055906.54293" 
    capture_lex $P534
    .const 'Sub' $P524 = "43_1258055906.54293" 
    capture_lex $P524
    .const 'Sub' $P514 = "42_1258055906.54293" 
    capture_lex $P514
    .const 'Sub' $P504 = "41_1258055906.54293" 
    capture_lex $P504
    .const 'Sub' $P494 = "40_1258055906.54293" 
    capture_lex $P494
    .const 'Sub' $P484 = "39_1258055906.54293" 
    capture_lex $P484
    .const 'Sub' $P474 = "38_1258055906.54293" 
    capture_lex $P474
    .const 'Sub' $P456 = "37_1258055906.54293" 
    capture_lex $P456
    .const 'Sub' $P440 = "36_1258055906.54293" 
    capture_lex $P440
    .const 'Sub' $P425 = "35_1258055906.54293" 
    capture_lex $P425
    .const 'Sub' $P412 = "34_1258055906.54293" 
    capture_lex $P412
    .const 'Sub' $P386 = "33_1258055906.54293" 
    capture_lex $P386
    .const 'Sub' $P350 = "32_1258055906.54293" 
    capture_lex $P350
    .const 'Sub' $P333 = "31_1258055906.54293" 
    capture_lex $P333
    .const 'Sub' $P319 = "30_1258055906.54293" 
    capture_lex $P319
    .const 'Sub' $P264 = "28_1258055906.54293" 
    capture_lex $P264
    .const 'Sub' $P251 = "27_1258055906.54293" 
    capture_lex $P251
    .const 'Sub' $P232 = "26_1258055906.54293" 
    capture_lex $P232
    .const 'Sub' $P222 = "25_1258055906.54293" 
    capture_lex $P222
    .const 'Sub' $P212 = "24_1258055906.54293" 
    capture_lex $P212
    .const 'Sub' $P196 = "23_1258055906.54293" 
    capture_lex $P196
    .const 'Sub' $P173 = "22_1258055906.54293" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258055906.54293" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258055906.54293" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258055906.54293" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258055906.54293" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258055906.54293" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258055906.54293" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258055906.54293" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_113
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_113:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258055906.54293" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258055906.54293" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258055906.54293" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 622
    get_hll_global $P1725, ["NQP";"RegexActions"], "_block1724" 
    capture_lex $P1725
    $P1787 = $P1725()
.annotate "line", 3
    .return ($P1787)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post111") :outer("11_1258055906.54293")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1789 = "109_1258055906.54293" 
    capture_lex $P1789
    $P1789()
    $P1792 = get_root_global ["parrot"], "P6metaclass"
    $P1792."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1788"  :anon :subid("109_1258055906.54293") :outer("11_1258055906.54293")
.annotate "line", 6
    get_global $P1790, "@BLOCK"
    unless_null $P1790, vivify_112
    new $P1790, "ResizablePMCArray"
    set_global "@BLOCK", $P1790
  vivify_112:
 $P1791 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1791
.annotate "line", 5
    .return ($P1791)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258055906.54293") :outer("11_1258055906.54293")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_114
    new $P20, "ResizablePMCArray"
  vivify_114:
    set $P21, $P20[1]
    unless_null $P21, vivify_115
    new $P21, "Undef"
  vivify_115:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_116
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_116:
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
.sub "block_immediate"  :subid("13_1258055906.54293") :outer("11_1258055906.54293")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258055906.54293" 
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
    .const 'Sub' $P35 = "14_1258055906.54293" 
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
.sub "_block34"  :anon :subid("14_1258055906.54293") :outer("13_1258055906.54293")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258055906.54293" 
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
    unless $I43, for_undef_117
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1258055906.54293" 
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
  for_undef_117:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1258055906.54293") :outer("14_1258055906.54293")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258055906.54293") :outer("11_1258055906.54293")
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
.sub "TOP"  :subid("17_1258055906.54293") :method :outer("11_1258055906.54293")
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
    unless_null $P84, vivify_118
    new $P84, "Hash"
  vivify_118:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_119
    new $P85, "Undef"
  vivify_119:
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
.sub "deflongname"  :subid("18_1258055906.54293") :method :outer("11_1258055906.54293")
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
    unless_null $P95, vivify_120
    new $P95, "Hash"
  vivify_120:
    set $P96, $P95["sym"]
    unless_null $P96, vivify_121
    new $P96, "Undef"
  vivify_121:
    if $P96, if_94
    set $P93, $P96
    goto if_94_end
  if_94:
    find_lex $P97, "$/"
    find_lex $P98, "$/"
    unless_null $P98, vivify_122
    new $P98, "Hash"
  vivify_122:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_123
    new $P99, "Undef"
  vivify_123:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_124
    new $P103, "Hash"
  vivify_124:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_125
    new $P104, "ResizablePMCArray"
  vivify_125:
    set $P105, $P104[0]
    unless_null $P105, vivify_126
    new $P105, "Undef"
  vivify_126:
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
.sub "comp_unit"  :subid("19_1258055906.54293") :method :outer("11_1258055906.54293")
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
    unless_null $P117, vivify_127
    new $P117, "Hash"
  vivify_127:
    set $P118, $P117["statementlist"]
    unless_null $P118, vivify_128
    new $P118, "Undef"
  vivify_128:
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
.sub "statementlist"  :subid("20_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258055906.54293" 
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
    unless_null $P139, vivify_129
    new $P139, "Hash"
  vivify_129:
    set $P140, $P139["statement"]
    unless_null $P140, vivify_130
    new $P140, "Undef"
  vivify_130:
    unless $P140, if_138_end
.annotate "line", 47
    find_lex $P142, "$/"
    unless_null $P142, vivify_131
    new $P142, "Hash"
  vivify_131:
    set $P143, $P142["statement"]
    unless_null $P143, vivify_132
    new $P143, "Undef"
  vivify_132:
    defined $I144, $P143
    unless $I144, for_undef_133
    iter $P141, $P143
    new $P167, 'ExceptionHandler'
    set_addr $P167, loop166_handler
    $P167."handle_types"(65, 67, 66)
    push_eh $P167
  loop166_test:
    unless $P141, loop166_done
    shift $P145, $P141
  loop166_redo:
    .const 'Sub' $P147 = "21_1258055906.54293" 
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
  for_undef_133:
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
.sub "_block146"  :anon :subid("21_1258055906.54293") :outer("20_1258055906.54293")
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
.sub "statement"  :subid("22_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_176
.annotate "line", 58
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
.annotate "line", 59
    new $P177, "Undef"
    .lex "$past", $P177
.annotate "line", 58
    find_lex $P178, "$past"
.annotate "line", 60
    find_lex $P180, "$/"
    unless_null $P180, vivify_134
    new $P180, "Hash"
  vivify_134:
    set $P181, $P180["EXPR"]
    unless_null $P181, vivify_135
    new $P181, "Undef"
  vivify_135:
    if $P181, if_179
.annotate "line", 61
    find_lex $P186, "$/"
    unless_null $P186, vivify_136
    new $P186, "Hash"
  vivify_136:
    set $P187, $P186["statement_control"]
    unless_null $P187, vivify_137
    new $P187, "Undef"
  vivify_137:
    if $P187, if_185
.annotate "line", 62
    new $P191, "Integer"
    assign $P191, 0
    store_lex "$past", $P191
    goto if_185_end
  if_185:
.annotate "line", 61
    find_lex $P188, "$/"
    unless_null $P188, vivify_138
    new $P188, "Hash"
  vivify_138:
    set $P189, $P188["statement_control"]
    unless_null $P189, vivify_139
    new $P189, "Undef"
  vivify_139:
    $P190 = $P189."ast"()
    store_lex "$past", $P190
  if_185_end:
    goto if_179_end
  if_179:
.annotate "line", 60
    find_lex $P182, "$/"
    unless_null $P182, vivify_140
    new $P182, "Hash"
  vivify_140:
    set $P183, $P182["EXPR"]
    unless_null $P183, vivify_141
    new $P183, "Undef"
  vivify_141:
    $P184 = $P183."ast"()
    store_lex "$past", $P184
  if_179_end:
.annotate "line", 63
    find_lex $P192, "$/"
    find_lex $P193, "$past"
    $P194 = $P192."!make"($P193)
.annotate "line", 58
    .return ($P194)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P195, exception, "payload"
    .return ($P195)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("23_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_199
.annotate "line", 66
    new $P198, 'ExceptionHandler'
    set_addr $P198, control_197
    $P198."handle_types"(58)
    push_eh $P198
    .lex "self", self
    .lex "$/", param_199
.annotate "line", 67
    find_lex $P200, "$/"
    get_hll_global $P201, ["PAST"], "Op"
    find_lex $P202, "$/"
    unless_null $P202, vivify_142
    new $P202, "Hash"
  vivify_142:
    set $P203, $P202["EXPR"]
    unless_null $P203, vivify_143
    new $P203, "Undef"
  vivify_143:
    $P204 = $P203."ast"()
    find_lex $P205, "$/"
    unless_null $P205, vivify_144
    new $P205, "Hash"
  vivify_144:
    set $P206, $P205["pblock"]
    unless_null $P206, vivify_145
    new $P206, "Undef"
  vivify_145:
    $P207 = $P206."ast"()
    find_lex $P208, "$/"
    $P209 = $P201."new"($P204, $P207, "if" :named("pasttype"), $P208 :named("node"))
    $P210 = $P200."!make"($P209)
.annotate "line", 66
    .return ($P210)
  control_197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("24_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_215
.annotate "line", 70
    new $P214, 'ExceptionHandler'
    set_addr $P214, control_213
    $P214."handle_types"(58)
    push_eh $P214
    .lex "self", self
    .lex "$/", param_215
.annotate "line", 71
    find_lex $P216, "$/"
    find_lex $P217, "$/"
    unless_null $P217, vivify_146
    new $P217, "Hash"
  vivify_146:
    set $P218, $P217["blockoid"]
    unless_null $P218, vivify_147
    new $P218, "Undef"
  vivify_147:
    $P219 = $P218."ast"()
    $P220 = $P216."!make"($P219)
.annotate "line", 70
    .return ($P220)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P221, exception, "payload"
    .return ($P221)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("25_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_225
.annotate "line", 74
    new $P224, 'ExceptionHandler'
    set_addr $P224, control_223
    $P224."handle_types"(58)
    push_eh $P224
    .lex "self", self
    .lex "$/", param_225
.annotate "line", 75
    find_lex $P226, "$/"
    find_lex $P227, "$/"
    unless_null $P227, vivify_148
    new $P227, "Hash"
  vivify_148:
    set $P228, $P227["blockoid"]
    unless_null $P228, vivify_149
    new $P228, "Undef"
  vivify_149:
    $P229 = $P228."ast"()
    $P230 = $P226."!make"($P229)
.annotate "line", 74
    .return ($P230)
  control_223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("26_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_235
.annotate "line", 78
    new $P234, 'ExceptionHandler'
    set_addr $P234, control_233
    $P234."handle_types"(58)
    push_eh $P234
    .lex "self", self
    .lex "$/", param_235
.annotate "line", 79
    new $P236, "Undef"
    .lex "$past", $P236
.annotate "line", 80
    new $P237, "Undef"
    .lex "$BLOCK", $P237
.annotate "line", 79
    find_lex $P238, "$/"
    unless_null $P238, vivify_150
    new $P238, "Hash"
  vivify_150:
    set $P239, $P238["statementlist"]
    unless_null $P239, vivify_151
    new $P239, "Undef"
  vivify_151:
    $P240 = $P239."ast"()
    store_lex "$past", $P240
.annotate "line", 80
    get_global $P241, "@BLOCK"
    $P242 = $P241."shift"()
    store_lex "$BLOCK", $P242
.annotate "line", 81
    find_lex $P243, "$BLOCK"
    find_lex $P244, "$past"
    $P243."push"($P244)
.annotate "line", 82
    find_lex $P245, "$BLOCK"
    find_lex $P246, "$/"
    $P245."node"($P246)
.annotate "line", 83
    find_lex $P247, "$/"
    find_lex $P248, "$BLOCK"
    $P249 = $P247."!make"($P248)
.annotate "line", 78
    .return ($P249)
  control_233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("27_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_254
.annotate "line", 86
    new $P253, 'ExceptionHandler'
    set_addr $P253, control_252
    $P253."handle_types"(58)
    push_eh $P253
    .lex "self", self
    .lex "$/", param_254
.annotate "line", 87
    get_global $P255, "@BLOCK"
    unless_null $P255, vivify_152
    new $P255, "ResizablePMCArray"
    set_global "@BLOCK", $P255
  vivify_152:
.annotate "line", 86
    get_global $P256, "@BLOCK"
.annotate "line", 88
    get_global $P257, "@BLOCK"
    get_hll_global $P258, ["PAST"], "Block"
    get_hll_global $P259, ["PAST"], "Stmts"
    $P260 = $P259."new"()
    $P261 = $P258."new"($P260)
    $P262 = $P257."unshift"($P261)
.annotate "line", 86
    .return ($P262)
  control_252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P263, exception, "payload"
    .return ($P263)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("28_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_267
.annotate "line", 93
    .const 'Sub' $P297 = "29_1258055906.54293" 
    capture_lex $P297
    new $P266, 'ExceptionHandler'
    set_addr $P266, control_265
    $P266."handle_types"(58)
    push_eh $P266
    .lex "self", self
    .lex "$/", param_267
.annotate "line", 94
    new $P268, "Undef"
    .lex "$count", $P268
.annotate "line", 95
    new $P269, "Undef"
    .lex "$past", $P269
.annotate "line", 94
    find_lex $P270, "$/"
    unless_null $P270, vivify_153
    new $P270, "Hash"
  vivify_153:
    set $P271, $P270["xblock"]
    unless_null $P271, vivify_154
    new $P271, "Undef"
  vivify_154:
    set $N272, $P271
    new $P273, 'Float'
    set $P273, $N272
    sub $P274, $P273, 1
    store_lex "$count", $P274
.annotate "line", 95
    find_lex $P275, "$count"
    set $I276, $P275
    find_lex $P277, "$/"
    unless_null $P277, vivify_155
    new $P277, "Hash"
  vivify_155:
    set $P278, $P277["xblock"]
    unless_null $P278, vivify_156
    new $P278, "ResizablePMCArray"
  vivify_156:
    set $P279, $P278[$I276]
    unless_null $P279, vivify_157
    new $P279, "Undef"
  vivify_157:
    $P280 = $P279."ast"()
    $P281 = "xblock_immediate"($P280)
    store_lex "$past", $P281
.annotate "line", 96
    find_lex $P283, "$/"
    unless_null $P283, vivify_158
    new $P283, "Hash"
  vivify_158:
    set $P284, $P283["else"]
    unless_null $P284, vivify_159
    new $P284, "Undef"
  vivify_159:
    unless $P284, if_282_end
.annotate "line", 97
    find_lex $P285, "$past"
    find_lex $P286, "$/"
    unless_null $P286, vivify_160
    new $P286, "Hash"
  vivify_160:
    set $P287, $P286["else"]
    unless_null $P287, vivify_161
    new $P287, "ResizablePMCArray"
  vivify_161:
    set $P288, $P287[0]
    unless_null $P288, vivify_162
    new $P288, "Undef"
  vivify_162:
    $P289 = $P288."ast"()
    $P290 = "block_immediate"($P289)
    $P285."push"($P290)
  if_282_end:
.annotate "line", 100
    new $P313, 'ExceptionHandler'
    set_addr $P313, loop312_handler
    $P313."handle_types"(65, 67, 66)
    push_eh $P313
  loop312_test:
    find_lex $P291, "$count"
    set $N292, $P291
    new $P293, "Integer"
    assign $P293, 0
    set $N294, $P293
    isgt $I295, $N292, $N294
    unless $I295, loop312_done
  loop312_redo:
    .const 'Sub' $P297 = "29_1258055906.54293" 
    capture_lex $P297
    $P297()
  loop312_next:
    goto loop312_test
  loop312_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P314, exception, 'type'
    eq $P314, 65, loop312_next
    eq $P314, 67, loop312_redo
  loop312_done:
    pop_eh 
.annotate "line", 106
    find_lex $P315, "$/"
    find_lex $P316, "$past"
    $P317 = $P315."!make"($P316)
.annotate "line", 93
    .return ($P317)
  control_265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block296"  :anon :subid("29_1258055906.54293") :outer("28_1258055906.54293")
.annotate "line", 102
    new $P298, "Undef"
    .lex "$else", $P298
.annotate "line", 100
    find_lex $P299, "$count"
    clone $P300, $P299
    dec $P299
.annotate "line", 102
    find_lex $P301, "$past"
    store_lex "$else", $P301
.annotate "line", 103
    find_lex $P302, "$count"
    set $I303, $P302
    find_lex $P304, "$/"
    unless_null $P304, vivify_163
    new $P304, "Hash"
  vivify_163:
    set $P305, $P304["xblock"]
    unless_null $P305, vivify_164
    new $P305, "ResizablePMCArray"
  vivify_164:
    set $P306, $P305[$I303]
    unless_null $P306, vivify_165
    new $P306, "Undef"
  vivify_165:
    $P307 = $P306."ast"()
    $P308 = "xblock_immediate"($P307)
    store_lex "$past", $P308
.annotate "line", 104
    find_lex $P309, "$past"
    find_lex $P310, "$else"
    $P311 = $P309."push"($P310)
.annotate "line", 100
    .return ($P311)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("30_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_322
.annotate "line", 109
    new $P321, 'ExceptionHandler'
    set_addr $P321, control_320
    $P321."handle_types"(58)
    push_eh $P321
    .lex "self", self
    .lex "$/", param_322
.annotate "line", 110
    new $P323, "Undef"
    .lex "$past", $P323
    find_lex $P324, "$/"
    unless_null $P324, vivify_166
    new $P324, "Hash"
  vivify_166:
    set $P325, $P324["xblock"]
    unless_null $P325, vivify_167
    new $P325, "Undef"
  vivify_167:
    $P326 = $P325."ast"()
    $P327 = "xblock_immediate"($P326)
    store_lex "$past", $P327
.annotate "line", 111
    find_lex $P328, "$past"
    $P328."pasttype"("unless")
.annotate "line", 112
    find_lex $P329, "$/"
    find_lex $P330, "$past"
    $P331 = $P329."!make"($P330)
.annotate "line", 109
    .return ($P331)
  control_320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, "payload"
    .return ($P332)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("31_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_336
.annotate "line", 115
    new $P335, 'ExceptionHandler'
    set_addr $P335, control_334
    $P335."handle_types"(58)
    push_eh $P335
    .lex "self", self
    .lex "$/", param_336
.annotate "line", 116
    new $P337, "Undef"
    .lex "$past", $P337
    find_lex $P338, "$/"
    unless_null $P338, vivify_168
    new $P338, "Hash"
  vivify_168:
    set $P339, $P338["xblock"]
    unless_null $P339, vivify_169
    new $P339, "Undef"
  vivify_169:
    $P340 = $P339."ast"()
    $P341 = "xblock_immediate"($P340)
    store_lex "$past", $P341
.annotate "line", 117
    find_lex $P342, "$past"
    find_lex $P343, "$/"
    unless_null $P343, vivify_170
    new $P343, "Hash"
  vivify_170:
    set $P344, $P343["sym"]
    unless_null $P344, vivify_171
    new $P344, "Undef"
  vivify_171:
    set $S345, $P344
    $P342."pasttype"($S345)
.annotate "line", 118
    find_lex $P346, "$/"
    find_lex $P347, "$past"
    $P348 = $P346."!make"($P347)
.annotate "line", 115
    .return ($P348)
  control_334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P349, exception, "payload"
    .return ($P349)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("32_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_353
.annotate "line", 121
    new $P352, 'ExceptionHandler'
    set_addr $P352, control_351
    $P352."handle_types"(58)
    push_eh $P352
    .lex "self", self
    .lex "$/", param_353
.annotate "line", 122
    new $P354, "Undef"
    .lex "$pasttype", $P354
.annotate "line", 123
    new $P355, "Undef"
    .lex "$past", $P355
.annotate "line", 122
    new $P356, "String"
    assign $P356, "repeat_"
    find_lex $P357, "$/"
    unless_null $P357, vivify_172
    new $P357, "Hash"
  vivify_172:
    set $P358, $P357["wu"]
    unless_null $P358, vivify_173
    new $P358, "Undef"
  vivify_173:
    set $S359, $P358
    concat $P360, $P356, $S359
    store_lex "$pasttype", $P360
    find_lex $P361, "$past"
.annotate "line", 124
    find_lex $P363, "$/"
    unless_null $P363, vivify_174
    new $P363, "Hash"
  vivify_174:
    set $P364, $P363["xblock"]
    unless_null $P364, vivify_175
    new $P364, "Undef"
  vivify_175:
    if $P364, if_362
.annotate "line", 129
    get_hll_global $P371, ["PAST"], "Op"
    find_lex $P372, "$/"
    unless_null $P372, vivify_176
    new $P372, "Hash"
  vivify_176:
    set $P373, $P372["EXPR"]
    unless_null $P373, vivify_177
    new $P373, "Undef"
  vivify_177:
    $P374 = $P373."ast"()
    find_lex $P375, "$/"
    unless_null $P375, vivify_178
    new $P375, "Hash"
  vivify_178:
    set $P376, $P375["pblock"]
    unless_null $P376, vivify_179
    new $P376, "Undef"
  vivify_179:
    $P377 = $P376."ast"()
    $P378 = "block_immediate"($P377)
    find_lex $P379, "$pasttype"
    find_lex $P380, "$/"
    $P381 = $P371."new"($P374, $P378, $P379 :named("pasttype"), $P380 :named("node"))
    store_lex "$past", $P381
.annotate "line", 128
    goto if_362_end
  if_362:
.annotate "line", 125
    find_lex $P365, "$/"
    unless_null $P365, vivify_180
    new $P365, "Hash"
  vivify_180:
    set $P366, $P365["xblock"]
    unless_null $P366, vivify_181
    new $P366, "Undef"
  vivify_181:
    $P367 = $P366."ast"()
    $P368 = "xblock_immediate"($P367)
    store_lex "$past", $P368
.annotate "line", 126
    find_lex $P369, "$past"
    find_lex $P370, "$pasttype"
    $P369."pasttype"($P370)
  if_362_end:
.annotate "line", 132
    find_lex $P382, "$/"
    find_lex $P383, "$past"
    $P384 = $P382."!make"($P383)
.annotate "line", 121
    .return ($P384)
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P385, exception, "payload"
    .return ($P385)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("33_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_389
.annotate "line", 135
    new $P388, 'ExceptionHandler'
    set_addr $P388, control_387
    $P388."handle_types"(58)
    push_eh $P388
    .lex "self", self
    .lex "$/", param_389
.annotate "line", 136
    new $P390, "Undef"
    .lex "$past", $P390
.annotate "line", 138
    new $P391, "Undef"
    .lex "$block", $P391
.annotate "line", 136
    find_lex $P392, "$/"
    unless_null $P392, vivify_182
    new $P392, "Hash"
  vivify_182:
    set $P393, $P392["xblock"]
    unless_null $P393, vivify_183
    new $P393, "Undef"
  vivify_183:
    $P394 = $P393."ast"()
    store_lex "$past", $P394
.annotate "line", 137
    find_lex $P395, "$past"
    $P395."pasttype"("for")
.annotate "line", 138
    find_lex $P396, "$past"
    unless_null $P396, vivify_184
    new $P396, "ResizablePMCArray"
  vivify_184:
    set $P397, $P396[1]
    unless_null $P397, vivify_185
    new $P397, "Undef"
  vivify_185:
    store_lex "$block", $P397
.annotate "line", 139
    find_lex $P399, "$block"
    $P400 = $P399."arity"()
    if $P400, unless_398_end
.annotate "line", 140
    find_lex $P401, "$block"
    unless_null $P401, vivify_186
    new $P401, "ResizablePMCArray"
  vivify_186:
    set $P402, $P401[0]
    unless_null $P402, vivify_187
    new $P402, "Undef"
  vivify_187:
    get_hll_global $P403, ["PAST"], "Var"
    $P404 = $P403."new"("$_" :named("name"), "parameter" :named("scope"))
    $P402."push"($P404)
.annotate "line", 141
    find_lex $P405, "$block"
    $P405."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 142
    find_lex $P406, "$block"
    $P406."arity"(1)
  unless_398_end:
.annotate "line", 144
    find_lex $P407, "$block"
    $P407."blocktype"("immediate")
.annotate "line", 145
    find_lex $P408, "$/"
    find_lex $P409, "$past"
    $P410 = $P408."!make"($P409)
.annotate "line", 135
    .return ($P410)
  control_387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P411, exception, "payload"
    .return ($P411)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("34_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_415
.annotate "line", 148
    new $P414, 'ExceptionHandler'
    set_addr $P414, control_413
    $P414."handle_types"(58)
    push_eh $P414
    .lex "self", self
    .lex "$/", param_415
.annotate "line", 149
    find_lex $P416, "$/"
    get_hll_global $P417, ["PAST"], "Op"
    find_lex $P418, "$/"
    unless_null $P418, vivify_188
    new $P418, "Hash"
  vivify_188:
    set $P419, $P418["EXPR"]
    unless_null $P419, vivify_189
    new $P419, "Undef"
  vivify_189:
    $P420 = $P419."ast"()
    find_lex $P421, "$/"
    $P422 = $P417."new"($P420, "return" :named("pasttype"), $P421 :named("node"))
    $P423 = $P416."!make"($P422)
.annotate "line", 148
    .return ($P423)
  control_413:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P424, exception, "payload"
    .return ($P424)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<make>"  :subid("35_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_428
.annotate "line", 152
    new $P427, 'ExceptionHandler'
    set_addr $P427, control_426
    $P427."handle_types"(58)
    push_eh $P427
    .lex "self", self
    .lex "$/", param_428
.annotate "line", 153
    find_lex $P429, "$/"
    get_hll_global $P430, ["PAST"], "Op"
.annotate "line", 154
    get_hll_global $P431, ["PAST"], "Var"
    $P432 = $P431."new"("$/" :named("name"), "contextual" :named("scope"))
.annotate "line", 155
    find_lex $P433, "$/"
    unless_null $P433, vivify_190
    new $P433, "Hash"
  vivify_190:
    set $P434, $P433["EXPR"]
    unless_null $P434, vivify_191
    new $P434, "Undef"
  vivify_191:
    $P435 = $P434."ast"()
    find_lex $P436, "$/"
    $P437 = $P430."new"($P432, $P435, "callmethod" :named("pasttype"), "!make" :named("name"), $P436 :named("node"))
.annotate "line", 153
    $P438 = $P429."!make"($P437)
.annotate "line", 152
    .return ($P438)
  control_426:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P439, exception, "payload"
    .return ($P439)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("36_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_443
.annotate "line", 162
    new $P442, 'ExceptionHandler'
    set_addr $P442, control_441
    $P442."handle_types"(58)
    push_eh $P442
    .lex "self", self
    .lex "$/", param_443
.annotate "line", 163
    get_global $P444, "@BLOCK"
    unless_null $P444, vivify_192
    new $P444, "ResizablePMCArray"
  vivify_192:
    set $P445, $P444[0]
    unless_null $P445, vivify_193
    new $P445, "Undef"
  vivify_193:
    $P446 = $P445."loadinit"()
    find_lex $P447, "$/"
    unless_null $P447, vivify_194
    new $P447, "Hash"
  vivify_194:
    set $P448, $P447["blorst"]
    unless_null $P448, vivify_195
    new $P448, "Undef"
  vivify_195:
    $P449 = $P448."ast"()
    $P446."push"($P449)
.annotate "line", 164
    find_lex $P450, "$/"
    get_hll_global $P451, ["PAST"], "Stmts"
    find_lex $P452, "$/"
    $P453 = $P451."new"($P452 :named("node"))
    $P454 = $P450."!make"($P453)
.annotate "line", 162
    .return ($P454)
  control_441:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P455, exception, "payload"
    .return ($P455)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("37_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_459
.annotate "line", 167
    new $P458, 'ExceptionHandler'
    set_addr $P458, control_457
    $P458."handle_types"(58)
    push_eh $P458
    .lex "self", self
    .lex "$/", param_459
.annotate "line", 168
    find_lex $P460, "$/"
.annotate "line", 169
    find_lex $P463, "$/"
    unless_null $P463, vivify_196
    new $P463, "Hash"
  vivify_196:
    set $P464, $P463["block"]
    unless_null $P464, vivify_197
    new $P464, "Undef"
  vivify_197:
    if $P464, if_462
.annotate "line", 170
    find_lex $P469, "$/"
    unless_null $P469, vivify_198
    new $P469, "Hash"
  vivify_198:
    set $P470, $P469["statement"]
    unless_null $P470, vivify_199
    new $P470, "Undef"
  vivify_199:
    $P471 = $P470."ast"()
    set $P461, $P471
.annotate "line", 169
    goto if_462_end
  if_462:
    find_lex $P465, "$/"
    unless_null $P465, vivify_200
    new $P465, "Hash"
  vivify_200:
    set $P466, $P465["block"]
    unless_null $P466, vivify_201
    new $P466, "Undef"
  vivify_201:
    $P467 = $P466."ast"()
    $P468 = "block_immediate"($P467)
    set $P461, $P468
  if_462_end:
    $P472 = $P460."!make"($P461)
.annotate "line", 167
    .return ($P472)
  control_457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P473, exception, "payload"
    .return ($P473)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("38_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_477
.annotate "line", 175
    new $P476, 'ExceptionHandler'
    set_addr $P476, control_475
    $P476."handle_types"(58)
    push_eh $P476
    .lex "self", self
    .lex "$/", param_477
    find_lex $P478, "$/"
    find_lex $P479, "$/"
    unless_null $P479, vivify_202
    new $P479, "Hash"
  vivify_202:
    set $P480, $P479["colonpair"]
    unless_null $P480, vivify_203
    new $P480, "Undef"
  vivify_203:
    $P481 = $P480."ast"()
    $P482 = $P478."!make"($P481)
    .return ($P482)
  control_475:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P483, exception, "payload"
    .return ($P483)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("39_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_487
.annotate "line", 176
    new $P486, 'ExceptionHandler'
    set_addr $P486, control_485
    $P486."handle_types"(58)
    push_eh $P486
    .lex "self", self
    .lex "$/", param_487
    find_lex $P488, "$/"
    find_lex $P489, "$/"
    unless_null $P489, vivify_204
    new $P489, "Hash"
  vivify_204:
    set $P490, $P489["variable"]
    unless_null $P490, vivify_205
    new $P490, "Undef"
  vivify_205:
    $P491 = $P490."ast"()
    $P492 = $P488."!make"($P491)
    .return ($P492)
  control_485:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P493, exception, "payload"
    .return ($P493)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("40_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_497
.annotate "line", 177
    new $P496, 'ExceptionHandler'
    set_addr $P496, control_495
    $P496."handle_types"(58)
    push_eh $P496
    .lex "self", self
    .lex "$/", param_497
    find_lex $P498, "$/"
    find_lex $P499, "$/"
    unless_null $P499, vivify_206
    new $P499, "Hash"
  vivify_206:
    set $P500, $P499["package_declarator"]
    unless_null $P500, vivify_207
    new $P500, "Undef"
  vivify_207:
    $P501 = $P500."ast"()
    $P502 = $P498."!make"($P501)
    .return ($P502)
  control_495:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P503, exception, "payload"
    .return ($P503)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("41_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_507
.annotate "line", 178
    new $P506, 'ExceptionHandler'
    set_addr $P506, control_505
    $P506."handle_types"(58)
    push_eh $P506
    .lex "self", self
    .lex "$/", param_507
    find_lex $P508, "$/"
    find_lex $P509, "$/"
    unless_null $P509, vivify_208
    new $P509, "Hash"
  vivify_208:
    set $P510, $P509["scope_declarator"]
    unless_null $P510, vivify_209
    new $P510, "Undef"
  vivify_209:
    $P511 = $P510."ast"()
    $P512 = $P508."!make"($P511)
    .return ($P512)
  control_505:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("42_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_517
.annotate "line", 179
    new $P516, 'ExceptionHandler'
    set_addr $P516, control_515
    $P516."handle_types"(58)
    push_eh $P516
    .lex "self", self
    .lex "$/", param_517
    find_lex $P518, "$/"
    find_lex $P519, "$/"
    unless_null $P519, vivify_210
    new $P519, "Hash"
  vivify_210:
    set $P520, $P519["routine_declarator"]
    unless_null $P520, vivify_211
    new $P520, "Undef"
  vivify_211:
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
.sub "term:sym<regex_declarator>"  :subid("43_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_527
.annotate "line", 180
    new $P526, 'ExceptionHandler'
    set_addr $P526, control_525
    $P526."handle_types"(58)
    push_eh $P526
    .lex "self", self
    .lex "$/", param_527
    find_lex $P528, "$/"
    find_lex $P529, "$/"
    unless_null $P529, vivify_212
    new $P529, "Hash"
  vivify_212:
    set $P530, $P529["regex_declarator"]
    unless_null $P530, vivify_213
    new $P530, "Undef"
  vivify_213:
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
.sub "term:sym<statement_prefix>"  :subid("44_1258055906.54293") :method :outer("11_1258055906.54293")
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
    unless_null $P539, vivify_214
    new $P539, "Hash"
  vivify_214:
    set $P540, $P539["statement_prefix"]
    unless_null $P540, vivify_215
    new $P540, "Undef"
  vivify_215:
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
.sub "term:sym<lambda>"  :subid("45_1258055906.54293") :method :outer("11_1258055906.54293")
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
    unless_null $P549, vivify_216
    new $P549, "Hash"
  vivify_216:
    set $P550, $P549["pblock"]
    unless_null $P550, vivify_217
    new $P550, "Undef"
  vivify_217:
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
.sub "colonpair"  :subid("46_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_557
.annotate "line", 184
    new $P556, 'ExceptionHandler'
    set_addr $P556, control_555
    $P556."handle_types"(58)
    push_eh $P556
    .lex "self", self
    .lex "$/", param_557
.annotate "line", 185
    new $P558, "Undef"
    .lex "$past", $P558
.annotate "line", 186
    find_lex $P561, "$/"
    unless_null $P561, vivify_218
    new $P561, "Hash"
  vivify_218:
    set $P562, $P561["circumfix"]
    unless_null $P562, vivify_219
    new $P562, "Undef"
  vivify_219:
    if $P562, if_560
.annotate "line", 187
    get_hll_global $P567, ["PAST"], "Val"
    find_lex $P568, "$/"
    unless_null $P568, vivify_220
    new $P568, "Hash"
  vivify_220:
    set $P569, $P568["not"]
    unless_null $P569, vivify_221
    new $P569, "Undef"
  vivify_221:
    isfalse $I570, $P569
    $P571 = $P567."new"($I570 :named("value"))
    set $P559, $P571
.annotate "line", 186
    goto if_560_end
  if_560:
    find_lex $P563, "$/"
    unless_null $P563, vivify_222
    new $P563, "Hash"
  vivify_222:
    set $P564, $P563["circumfix"]
    unless_null $P564, vivify_223
    new $P564, "ResizablePMCArray"
  vivify_223:
    set $P565, $P564[0]
    unless_null $P565, vivify_224
    new $P565, "Undef"
  vivify_224:
    $P566 = $P565."ast"()
    set $P559, $P566
  if_560_end:
    store_lex "$past", $P559
.annotate "line", 188
    find_lex $P572, "$past"
    find_lex $P573, "$/"
    unless_null $P573, vivify_225
    new $P573, "Hash"
  vivify_225:
    set $P574, $P573["identifier"]
    unless_null $P574, vivify_226
    new $P574, "Undef"
  vivify_226:
    set $S575, $P574
    $P572."named"($S575)
.annotate "line", 189
    find_lex $P576, "$/"
    find_lex $P577, "$past"
    $P578 = $P576."!make"($P577)
.annotate "line", 184
    .return ($P578)
  control_555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P579, exception, "payload"
    .return ($P579)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("47_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_583
.annotate "line", 192
    new $P582, 'ExceptionHandler'
    set_addr $P582, control_581
    $P582."handle_types"(58)
    push_eh $P582
    .lex "self", self
    .lex "$/", param_583
.annotate "line", 193
    new $P584, "Undef"
    .lex "$past", $P584
.annotate "line", 192
    find_lex $P585, "$past"
.annotate "line", 194
    find_lex $P587, "$/"
    unless_null $P587, vivify_227
    new $P587, "Hash"
  vivify_227:
    set $P588, $P587["postcircumfix"]
    unless_null $P588, vivify_228
    new $P588, "Undef"
  vivify_228:
    if $P588, if_586
.annotate "line", 199
    get_hll_global $P595, ["PAST"], "Var"
    find_lex $P596, "$/"
    set $S597, $P596
    $P598 = $P595."new"($S597 :named("name"))
    store_lex "$past", $P598
.annotate "line", 200
    find_lex $P600, "$/"
    unless_null $P600, vivify_229
    new $P600, "Hash"
  vivify_229:
    set $P601, $P600["twigil"]
    unless_null $P601, vivify_230
    new $P601, "ResizablePMCArray"
  vivify_230:
    set $P602, $P601[0]
    unless_null $P602, vivify_231
    new $P602, "Undef"
  vivify_231:
    set $S603, $P602
    iseq $I604, $S603, "*"
    if $I604, if_599
.annotate "line", 206
    find_lex $P615, "$/"
    unless_null $P615, vivify_232
    new $P615, "Hash"
  vivify_232:
    set $P616, $P615["twigil"]
    unless_null $P616, vivify_233
    new $P616, "ResizablePMCArray"
  vivify_233:
    set $P617, $P616[0]
    unless_null $P617, vivify_234
    new $P617, "Undef"
  vivify_234:
    set $S618, $P617
    iseq $I619, $S618, "!"
    unless $I619, if_614_end
.annotate "line", 207
    find_lex $P620, "$past"
    $P620."scope"("attribute")
.annotate "line", 208
    find_lex $P621, "$past"
    find_lex $P622, "$/"
    unless_null $P622, vivify_235
    new $P622, "Hash"
  vivify_235:
    set $P623, $P622["sigil"]
    unless_null $P623, vivify_236
    new $P623, "Undef"
  vivify_236:
    $P624 = "sigiltype"($P623)
    $P621."viviself"($P624)
  if_614_end:
.annotate "line", 206
    goto if_599_end
  if_599:
.annotate "line", 201
    find_lex $P605, "$past"
    $P605."scope"("contextual")
.annotate "line", 202
    find_lex $P606, "$past"
    get_hll_global $P607, ["PAST"], "Op"
    new $P608, "String"
    assign $P608, "Contextual "
    find_lex $P609, "$/"
    set $S610, $P609
    concat $P611, $P608, $S610
    concat $P612, $P611, " not found"
    $P613 = $P607."new"($P612, "die" :named("pirop"))
    $P606."viviself"($P613)
  if_599_end:
.annotate "line", 198
    goto if_586_end
  if_586:
.annotate "line", 195
    find_lex $P589, "$/"
    unless_null $P589, vivify_237
    new $P589, "Hash"
  vivify_237:
    set $P590, $P589["postcircumfix"]
    unless_null $P590, vivify_238
    new $P590, "Undef"
  vivify_238:
    $P591 = $P590."ast"()
    store_lex "$past", $P591
.annotate "line", 196
    find_lex $P592, "$past"
    get_hll_global $P593, ["PAST"], "Var"
    $P594 = $P593."new"("$/" :named("name"))
    $P592."unshift"($P594)
  if_586_end:
.annotate "line", 211
    find_lex $P625, "$/"
    find_lex $P626, "$past"
    $P627 = $P625."!make"($P626)
.annotate "line", 192
    .return ($P627)
  control_581:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P628, exception, "payload"
    .return ($P628)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("48_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_632
.annotate "line", 214
    new $P631, 'ExceptionHandler'
    set_addr $P631, control_630
    $P631."handle_types"(58)
    push_eh $P631
    .lex "self", self
    .lex "$/", param_632
    find_lex $P633, "$/"
    find_lex $P634, "$/"
    unless_null $P634, vivify_239
    new $P634, "Hash"
  vivify_239:
    set $P635, $P634["package_def"]
    unless_null $P635, vivify_240
    new $P635, "Undef"
  vivify_240:
    $P636 = $P635."ast"()
    $P637 = $P633."!make"($P636)
    .return ($P637)
  control_630:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P638, exception, "payload"
    .return ($P638)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("49_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_642
.annotate "line", 215
    new $P641, 'ExceptionHandler'
    set_addr $P641, control_640
    $P641."handle_types"(58)
    push_eh $P641
    .lex "self", self
    .lex "$/", param_642
.annotate "line", 216
    new $P643, "Undef"
    .lex "$past", $P643
.annotate "line", 217
    new $P644, "Undef"
    .lex "$classinit", $P644
.annotate "line", 226
    new $P645, "Undef"
    .lex "$parent", $P645
.annotate "line", 216
    find_lex $P646, "$/"
    unless_null $P646, vivify_241
    new $P646, "Hash"
  vivify_241:
    set $P647, $P646["package_def"]
    unless_null $P647, vivify_242
    new $P647, "Undef"
  vivify_242:
    $P648 = $P647."ast"()
    store_lex "$past", $P648
.annotate "line", 218
    get_hll_global $P649, ["PAST"], "Op"
.annotate "line", 219
    get_hll_global $P650, ["PAST"], "Op"
    $P651 = $P650."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 222
    find_lex $P652, "$/"
    unless_null $P652, vivify_243
    new $P652, "Hash"
  vivify_243:
    set $P653, $P652["package_def"]
    unless_null $P653, vivify_244
    new $P653, "Hash"
  vivify_244:
    set $P654, $P653["name"]
    unless_null $P654, vivify_245
    new $P654, "Undef"
  vivify_245:
    set $S655, $P654
    $P656 = $P649."new"($P651, $S655, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 218
    store_lex "$classinit", $P656
.annotate "line", 226
    find_lex $P659, "$/"
    unless_null $P659, vivify_246
    new $P659, "Hash"
  vivify_246:
    set $P660, $P659["package_def"]
    unless_null $P660, vivify_247
    new $P660, "Hash"
  vivify_247:
    set $P661, $P660["parent"]
    unless_null $P661, vivify_248
    new $P661, "ResizablePMCArray"
  vivify_248:
    set $P662, $P661[0]
    unless_null $P662, vivify_249
    new $P662, "Undef"
  vivify_249:
    set $S663, $P662
    unless $S663, unless_658
    new $P657, 'String'
    set $P657, $S663
    goto unless_658_end
  unless_658:
.annotate "line", 227
    find_lex $P666, "$/"
    unless_null $P666, vivify_250
    new $P666, "Hash"
  vivify_250:
    set $P667, $P666["sym"]
    unless_null $P667, vivify_251
    new $P667, "Undef"
  vivify_251:
    set $S668, $P667
    iseq $I669, $S668, "grammar"
    if $I669, if_665
    new $P671, "String"
    assign $P671, ""
    set $P664, $P671
    goto if_665_end
  if_665:
    new $P670, "String"
    assign $P670, "Regex::Cursor"
    set $P664, $P670
  if_665_end:
    set $P657, $P664
  unless_658_end:
    store_lex "$parent", $P657
.annotate "line", 228
    find_lex $P673, "$parent"
    unless $P673, if_672_end
.annotate "line", 229
    find_lex $P674, "$classinit"
    get_hll_global $P675, ["PAST"], "Val"
    find_lex $P676, "$parent"
    $P677 = $P675."new"($P676 :named("value"), "parent" :named("named"))
    $P674."push"($P677)
  if_672_end:
.annotate "line", 231
    find_lex $P679, "$past"
    unless_null $P679, vivify_252
    new $P679, "Hash"
  vivify_252:
    set $P680, $P679["attributes"]
    unless_null $P680, vivify_253
    new $P680, "Undef"
  vivify_253:
    unless $P680, if_678_end
.annotate "line", 232
    find_lex $P681, "$classinit"
    find_lex $P682, "$past"
    unless_null $P682, vivify_254
    new $P682, "Hash"
  vivify_254:
    set $P683, $P682["attributes"]
    unless_null $P683, vivify_255
    new $P683, "Undef"
  vivify_255:
    $P681."push"($P683)
  if_678_end:
.annotate "line", 234
    get_global $P684, "@BLOCK"
    unless_null $P684, vivify_256
    new $P684, "ResizablePMCArray"
  vivify_256:
    set $P685, $P684[0]
    unless_null $P685, vivify_257
    new $P685, "Undef"
  vivify_257:
    $P686 = $P685."loadinit"()
    find_lex $P687, "$classinit"
    $P686."push"($P687)
.annotate "line", 235
    find_lex $P688, "$/"
    find_lex $P689, "$past"
    $P690 = $P688."!make"($P689)
.annotate "line", 215
    .return ($P690)
  control_640:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P691, exception, "payload"
    .return ($P691)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("50_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_695
.annotate "line", 238
    new $P694, 'ExceptionHandler'
    set_addr $P694, control_693
    $P694."handle_types"(58)
    push_eh $P694
    .lex "self", self
    .lex "$/", param_695
.annotate "line", 239
    new $P696, "Undef"
    .lex "$past", $P696
    find_lex $P699, "$/"
    unless_null $P699, vivify_258
    new $P699, "Hash"
  vivify_258:
    set $P700, $P699["block"]
    unless_null $P700, vivify_259
    new $P700, "Undef"
  vivify_259:
    if $P700, if_698
    find_lex $P704, "$/"
    unless_null $P704, vivify_260
    new $P704, "Hash"
  vivify_260:
    set $P705, $P704["comp_unit"]
    unless_null $P705, vivify_261
    new $P705, "Undef"
  vivify_261:
    $P706 = $P705."ast"()
    set $P697, $P706
    goto if_698_end
  if_698:
    find_lex $P701, "$/"
    unless_null $P701, vivify_262
    new $P701, "Hash"
  vivify_262:
    set $P702, $P701["block"]
    unless_null $P702, vivify_263
    new $P702, "Undef"
  vivify_263:
    $P703 = $P702."ast"()
    set $P697, $P703
  if_698_end:
    store_lex "$past", $P697
.annotate "line", 240
    find_lex $P707, "$past"
    find_lex $P708, "$/"
    unless_null $P708, vivify_264
    new $P708, "Hash"
  vivify_264:
    set $P709, $P708["name"]
    unless_null $P709, vivify_265
    new $P709, "Hash"
  vivify_265:
    set $P710, $P709["identifier"]
    unless_null $P710, vivify_266
    new $P710, "Undef"
  vivify_266:
    $P707."namespace"($P710)
.annotate "line", 241
    find_lex $P711, "$past"
    $P711."blocktype"("immediate")
.annotate "line", 242
    find_lex $P712, "$/"
    find_lex $P713, "$past"
    $P714 = $P712."!make"($P713)
.annotate "line", 238
    .return ($P714)
  control_693:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P715, exception, "payload"
    .return ($P715)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("51_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_719
.annotate "line", 245
    new $P718, 'ExceptionHandler'
    set_addr $P718, control_717
    $P718."handle_types"(58)
    push_eh $P718
    .lex "self", self
    .lex "$/", param_719
    find_lex $P720, "$/"
    find_lex $P721, "$/"
    unless_null $P721, vivify_267
    new $P721, "Hash"
  vivify_267:
    set $P722, $P721["scoped"]
    unless_null $P722, vivify_268
    new $P722, "Undef"
  vivify_268:
    $P723 = $P722."ast"()
    $P724 = $P720."!make"($P723)
    .return ($P724)
  control_717:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P725, exception, "payload"
    .return ($P725)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("52_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_729
.annotate "line", 246
    new $P728, 'ExceptionHandler'
    set_addr $P728, control_727
    $P728."handle_types"(58)
    push_eh $P728
    .lex "self", self
    .lex "$/", param_729
    find_lex $P730, "$/"
    find_lex $P731, "$/"
    unless_null $P731, vivify_269
    new $P731, "Hash"
  vivify_269:
    set $P732, $P731["scoped"]
    unless_null $P732, vivify_270
    new $P732, "Undef"
  vivify_270:
    $P733 = $P732."ast"()
    $P734 = $P730."!make"($P733)
    .return ($P734)
  control_727:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P735, exception, "payload"
    .return ($P735)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("53_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_739
.annotate "line", 247
    new $P738, 'ExceptionHandler'
    set_addr $P738, control_737
    $P738."handle_types"(58)
    push_eh $P738
    .lex "self", self
    .lex "$/", param_739
    find_lex $P740, "$/"
    find_lex $P741, "$/"
    unless_null $P741, vivify_271
    new $P741, "Hash"
  vivify_271:
    set $P742, $P741["scoped"]
    unless_null $P742, vivify_272
    new $P742, "Undef"
  vivify_272:
    $P743 = $P742."ast"()
    $P744 = $P740."!make"($P743)
    .return ($P744)
  control_737:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P745, exception, "payload"
    .return ($P745)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("54_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_749
.annotate "line", 249
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(58)
    push_eh $P748
    .lex "self", self
    .lex "$/", param_749
.annotate "line", 250
    find_lex $P750, "$/"
.annotate "line", 251
    find_lex $P753, "$/"
    unless_null $P753, vivify_273
    new $P753, "Hash"
  vivify_273:
    set $P754, $P753["routine_declarator"]
    unless_null $P754, vivify_274
    new $P754, "Undef"
  vivify_274:
    if $P754, if_752
.annotate "line", 252
    find_lex $P758, "$/"
    unless_null $P758, vivify_275
    new $P758, "Hash"
  vivify_275:
    set $P759, $P758["variable_declarator"]
    unless_null $P759, vivify_276
    new $P759, "Undef"
  vivify_276:
    $P760 = $P759."ast"()
    set $P751, $P760
.annotate "line", 251
    goto if_752_end
  if_752:
    find_lex $P755, "$/"
    unless_null $P755, vivify_277
    new $P755, "Hash"
  vivify_277:
    set $P756, $P755["routine_declarator"]
    unless_null $P756, vivify_278
    new $P756, "Undef"
  vivify_278:
    $P757 = $P756."ast"()
    set $P751, $P757
  if_752_end:
    $P761 = $P750."!make"($P751)
.annotate "line", 249
    .return ($P761)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P762, exception, "payload"
    .return ($P762)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("55_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_766
.annotate "line", 255
    .const 'Sub' $P806 = "56_1258055906.54293" 
    capture_lex $P806
    new $P765, 'ExceptionHandler'
    set_addr $P765, control_764
    $P765."handle_types"(58)
    push_eh $P765
    .lex "self", self
    .lex "$/", param_766
.annotate "line", 256
    new $P767, "Undef"
    .lex "$past", $P767
.annotate "line", 257
    new $P768, "Undef"
    .lex "$sigil", $P768
.annotate "line", 258
    new $P769, "Undef"
    .lex "$name", $P769
.annotate "line", 259
    new $P770, "Undef"
    .lex "$BLOCK", $P770
.annotate "line", 256
    find_lex $P771, "$/"
    unless_null $P771, vivify_279
    new $P771, "Hash"
  vivify_279:
    set $P772, $P771["variable"]
    unless_null $P772, vivify_280
    new $P772, "Undef"
  vivify_280:
    $P773 = $P772."ast"()
    store_lex "$past", $P773
.annotate "line", 257
    find_lex $P774, "$/"
    unless_null $P774, vivify_281
    new $P774, "Hash"
  vivify_281:
    set $P775, $P774["variable"]
    unless_null $P775, vivify_282
    new $P775, "Hash"
  vivify_282:
    set $P776, $P775["sigil"]
    unless_null $P776, vivify_283
    new $P776, "Undef"
  vivify_283:
    store_lex "$sigil", $P776
.annotate "line", 258
    find_lex $P777, "$past"
    $P778 = $P777."name"()
    store_lex "$name", $P778
.annotate "line", 259
    get_global $P779, "@BLOCK"
    unless_null $P779, vivify_284
    new $P779, "ResizablePMCArray"
  vivify_284:
    set $P780, $P779[0]
    unless_null $P780, vivify_285
    new $P780, "Undef"
  vivify_285:
    store_lex "$BLOCK", $P780
.annotate "line", 260
    find_lex $P782, "$BLOCK"
    find_lex $P783, "$name"
    $P784 = $P782."symbol"($P783)
    unless $P784, if_781_end
.annotate "line", 261
    find_lex $P785, "$/"
    $P786 = $P785."CURSOR"()
    find_lex $P787, "$name"
    $P786."panic"("Redeclaration of symbol ", $P787)
  if_781_end:
.annotate "line", 263
    find_dynamic_lex $P789, "$*SCOPE"
    unless_null $P789, vivify_286
    die "Contextual $*SCOPE not found"
  vivify_286:
    set $S790, $P789
    iseq $I791, $S790, "has"
    if $I791, if_788
.annotate "line", 272
    .const 'Sub' $P806 = "56_1258055906.54293" 
    capture_lex $P806
    $P806()
    goto if_788_end
  if_788:
.annotate "line", 264
    find_lex $P792, "$BLOCK"
    find_lex $P793, "$name"
    $P792."symbol"($P793, "attribute" :named("scope"))
.annotate "line", 265
    find_lex $P795, "$BLOCK"
    unless_null $P795, vivify_290
    new $P795, "Hash"
  vivify_290:
    set $P796, $P795["attributes"]
    unless_null $P796, vivify_291
    new $P796, "Undef"
  vivify_291:
    if $P796, unless_794_end
.annotate "line", 267
    get_hll_global $P797, ["PAST"], "Op"
    $P798 = $P797."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P799, "$BLOCK"
    unless_null $P799, vivify_292
    new $P799, "Hash"
    store_lex "$BLOCK", $P799
  vivify_292:
    set $P799["attributes"], $P798
  unless_794_end:
.annotate "line", 269
    find_lex $P800, "$BLOCK"
    unless_null $P800, vivify_293
    new $P800, "Hash"
  vivify_293:
    set $P801, $P800["attributes"]
    unless_null $P801, vivify_294
    new $P801, "Undef"
  vivify_294:
    find_lex $P802, "$name"
    $P801."push"($P802)
.annotate "line", 270
    get_hll_global $P803, ["PAST"], "Stmts"
    $P804 = $P803."new"()
    store_lex "$past", $P804
  if_788_end:
.annotate "line", 280
    find_lex $P830, "$/"
    find_lex $P831, "$past"
    $P832 = $P830."!make"($P831)
.annotate "line", 255
    .return ($P832)
  control_764:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P833, exception, "payload"
    .return ($P833)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block805"  :anon :subid("56_1258055906.54293") :outer("55_1258055906.54293")
.annotate "line", 273
    new $P807, "Undef"
    .lex "$scope", $P807
.annotate "line", 274
    new $P808, "Undef"
    .lex "$decl", $P808
.annotate "line", 273
    find_dynamic_lex $P811, "$*SCOPE"
    unless_null $P811, vivify_287
    die "Contextual $*SCOPE not found"
  vivify_287:
    set $S812, $P811
    iseq $I813, $S812, "our"
    if $I813, if_810
    new $P815, "String"
    assign $P815, "lexical"
    set $P809, $P815
    goto if_810_end
  if_810:
    new $P814, "String"
    assign $P814, "package"
    set $P809, $P814
  if_810_end:
    store_lex "$scope", $P809
.annotate "line", 274
    get_hll_global $P816, ["PAST"], "Var"
    find_lex $P817, "$name"
    find_lex $P818, "$scope"
.annotate "line", 275
    find_lex $P819, "$sigil"
    $P820 = "sigiltype"($P819)
    find_lex $P821, "$/"
    $P822 = $P816."new"($P817 :named("name"), $P818 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P820 :named("viviself"), $P821 :named("node"))
.annotate "line", 274
    store_lex "$decl", $P822
.annotate "line", 277
    find_lex $P823, "$BLOCK"
    find_lex $P824, "$name"
    find_lex $P825, "$scope"
    $P823."symbol"($P824, $P825 :named("scope"))
.annotate "line", 278
    find_lex $P826, "$BLOCK"
    unless_null $P826, vivify_288
    new $P826, "ResizablePMCArray"
  vivify_288:
    set $P827, $P826[0]
    unless_null $P827, vivify_289
    new $P827, "Undef"
  vivify_289:
    find_lex $P828, "$decl"
    $P829 = $P827."push"($P828)
.annotate "line", 272
    .return ($P829)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("57_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_837
.annotate "line", 283
    new $P836, 'ExceptionHandler'
    set_addr $P836, control_835
    $P836."handle_types"(58)
    push_eh $P836
    .lex "self", self
    .lex "$/", param_837
    find_lex $P838, "$/"
    find_lex $P839, "$/"
    unless_null $P839, vivify_295
    new $P839, "Hash"
  vivify_295:
    set $P840, $P839["routine_def"]
    unless_null $P840, vivify_296
    new $P840, "Undef"
  vivify_296:
    $P841 = $P840."ast"()
    $P842 = $P838."!make"($P841)
    .return ($P842)
  control_835:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P843, exception, "payload"
    .return ($P843)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("58_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_847
.annotate "line", 284
    new $P846, 'ExceptionHandler'
    set_addr $P846, control_845
    $P846."handle_types"(58)
    push_eh $P846
    .lex "self", self
    .lex "$/", param_847
    find_lex $P848, "$/"
    find_lex $P849, "$/"
    unless_null $P849, vivify_297
    new $P849, "Hash"
  vivify_297:
    set $P850, $P849["method_def"]
    unless_null $P850, vivify_298
    new $P850, "Undef"
  vivify_298:
    $P851 = $P850."ast"()
    $P852 = $P848."!make"($P851)
    .return ($P852)
  control_845:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P853, exception, "payload"
    .return ($P853)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("59_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_857
.annotate "line", 286
    .const 'Sub' $P868 = "60_1258055906.54293" 
    capture_lex $P868
    new $P856, 'ExceptionHandler'
    set_addr $P856, control_855
    $P856."handle_types"(58)
    push_eh $P856
    .lex "self", self
    .lex "$/", param_857
.annotate "line", 287
    new $P858, "Undef"
    .lex "$past", $P858
    find_lex $P859, "$/"
    unless_null $P859, vivify_299
    new $P859, "Hash"
  vivify_299:
    set $P860, $P859["blockoid"]
    unless_null $P860, vivify_300
    new $P860, "Undef"
  vivify_300:
    $P861 = $P860."ast"()
    store_lex "$past", $P861
.annotate "line", 288
    find_lex $P862, "$past"
    $P862."blocktype"("declaration")
.annotate "line", 289
    find_lex $P863, "$past"
    $P863."control"("return_pir")
.annotate "line", 290
    find_lex $P865, "$/"
    unless_null $P865, vivify_301
    new $P865, "Hash"
  vivify_301:
    set $P866, $P865["deflongname"]
    unless_null $P866, vivify_302
    new $P866, "Undef"
  vivify_302:
    unless $P866, if_864_end
    .const 'Sub' $P868 = "60_1258055906.54293" 
    capture_lex $P868
    $P868()
  if_864_end:
.annotate "line", 300
    find_lex $P896, "$/"
    find_lex $P897, "$past"
    $P898 = $P896."!make"($P897)
.annotate "line", 286
    .return ($P898)
  control_855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P899, exception, "payload"
    .return ($P899)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block867"  :anon :subid("60_1258055906.54293") :outer("59_1258055906.54293")
.annotate "line", 291
    new $P869, "Undef"
    .lex "$name", $P869
    find_lex $P870, "$/"
    unless_null $P870, vivify_303
    new $P870, "Hash"
  vivify_303:
    set $P871, $P870["deflongname"]
    unless_null $P871, vivify_304
    new $P871, "ResizablePMCArray"
  vivify_304:
    set $P872, $P871[0]
    unless_null $P872, vivify_305
    new $P872, "Undef"
  vivify_305:
    $P873 = $P872."ast"()
    set $S874, $P873
    new $P875, 'String'
    set $P875, $S874
    store_lex "$name", $P875
.annotate "line", 292
    find_lex $P876, "$past"
    find_lex $P877, "$name"
    $P876."name"($P877)
.annotate "line", 293
    find_dynamic_lex $P880, "$*SCOPE"
    unless_null $P880, vivify_306
    die "Contextual $*SCOPE not found"
  vivify_306:
    set $S881, $P880
    isne $I882, $S881, "our"
    if $I882, if_879
    new $P878, 'Integer'
    set $P878, $I882
    goto if_879_end
  if_879:
.annotate "line", 294
    get_global $P883, "@BLOCK"
    unless_null $P883, vivify_307
    new $P883, "ResizablePMCArray"
  vivify_307:
    set $P884, $P883[0]
    unless_null $P884, vivify_308
    new $P884, "ResizablePMCArray"
  vivify_308:
    set $P885, $P884[0]
    unless_null $P885, vivify_309
    new $P885, "Undef"
  vivify_309:
    get_hll_global $P886, ["PAST"], "Var"
    find_lex $P887, "$name"
    find_lex $P888, "$past"
    $P889 = $P886."new"($P887 :named("name"), 1 :named("isdecl"), $P888 :named("viviself"), "lexical" :named("scope"))
    $P885."push"($P889)
.annotate "line", 296
    get_global $P890, "@BLOCK"
    unless_null $P890, vivify_310
    new $P890, "ResizablePMCArray"
  vivify_310:
    set $P891, $P890[0]
    unless_null $P891, vivify_311
    new $P891, "Undef"
  vivify_311:
    find_lex $P892, "$name"
    $P891."symbol"($P892, "lexical" :named("scope"))
.annotate "line", 297
    get_hll_global $P893, ["PAST"], "Var"
    find_lex $P894, "$name"
    $P895 = $P893."new"($P894 :named("name"))
    store_lex "$past", $P895
.annotate "line", 293
    set $P878, $P895
  if_879_end:
.annotate "line", 290
    .return ($P878)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("61_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_903
.annotate "line", 304
    .const 'Sub' $P919 = "62_1258055906.54293" 
    capture_lex $P919
    new $P902, 'ExceptionHandler'
    set_addr $P902, control_901
    $P902."handle_types"(58)
    push_eh $P902
    .lex "self", self
    .lex "$/", param_903
.annotate "line", 305
    new $P904, "Undef"
    .lex "$past", $P904
    find_lex $P905, "$/"
    unless_null $P905, vivify_312
    new $P905, "Hash"
  vivify_312:
    set $P906, $P905["blockoid"]
    unless_null $P906, vivify_313
    new $P906, "Undef"
  vivify_313:
    $P907 = $P906."ast"()
    store_lex "$past", $P907
.annotate "line", 306
    find_lex $P908, "$past"
    $P908."blocktype"("method")
.annotate "line", 307
    find_lex $P909, "$past"
    $P909."control"("return_pir")
.annotate "line", 308
    find_lex $P910, "$past"
    unless_null $P910, vivify_314
    new $P910, "ResizablePMCArray"
  vivify_314:
    set $P911, $P910[0]
    unless_null $P911, vivify_315
    new $P911, "Undef"
  vivify_315:
    get_hll_global $P912, ["PAST"], "Op"
    $P913 = $P912."new"("    .lex \"self\", self" :named("inline"))
    $P911."unshift"($P913)
.annotate "line", 309
    find_lex $P914, "$past"
    $P914."symbol"("self", "lexical" :named("scope"))
.annotate "line", 310
    find_lex $P916, "$/"
    unless_null $P916, vivify_316
    new $P916, "Hash"
  vivify_316:
    set $P917, $P916["deflongname"]
    unless_null $P917, vivify_317
    new $P917, "Undef"
  vivify_317:
    unless $P917, if_915_end
    .const 'Sub' $P919 = "62_1258055906.54293" 
    capture_lex $P919
    $P919()
  if_915_end:
.annotate "line", 314
    find_lex $P930, "$/"
    find_lex $P931, "$past"
    $P932 = $P930."!make"($P931)
.annotate "line", 304
    .return ($P932)
  control_901:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P933, exception, "payload"
    .return ($P933)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block918"  :anon :subid("62_1258055906.54293") :outer("61_1258055906.54293")
.annotate "line", 311
    new $P920, "Undef"
    .lex "$name", $P920
    find_lex $P921, "$/"
    unless_null $P921, vivify_318
    new $P921, "Hash"
  vivify_318:
    set $P922, $P921["deflongname"]
    unless_null $P922, vivify_319
    new $P922, "ResizablePMCArray"
  vivify_319:
    set $P923, $P922[0]
    unless_null $P923, vivify_320
    new $P923, "Undef"
  vivify_320:
    $P924 = $P923."ast"()
    set $S925, $P924
    new $P926, 'String'
    set $P926, $S925
    store_lex "$name", $P926
.annotate "line", 312
    find_lex $P927, "$past"
    find_lex $P928, "$name"
    $P929 = $P927."name"($P928)
.annotate "line", 310
    .return ($P929)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("63_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_937
.annotate "line", 318
    .const 'Sub' $P948 = "64_1258055906.54293" 
    capture_lex $P948
    new $P936, 'ExceptionHandler'
    set_addr $P936, control_935
    $P936."handle_types"(58)
    push_eh $P936
    .lex "self", self
    .lex "$/", param_937
.annotate "line", 319
    new $P938, "Undef"
    .lex "$BLOCKINIT", $P938
    get_global $P939, "@BLOCK"
    unless_null $P939, vivify_321
    new $P939, "ResizablePMCArray"
  vivify_321:
    set $P940, $P939[0]
    unless_null $P940, vivify_322
    new $P940, "ResizablePMCArray"
  vivify_322:
    set $P941, $P940[0]
    unless_null $P941, vivify_323
    new $P941, "Undef"
  vivify_323:
    store_lex "$BLOCKINIT", $P941
.annotate "line", 320
    find_lex $P943, "$/"
    unless_null $P943, vivify_324
    new $P943, "Hash"
  vivify_324:
    set $P944, $P943["parameter"]
    unless_null $P944, vivify_325
    new $P944, "Undef"
  vivify_325:
    defined $I945, $P944
    unless $I945, for_undef_326
    iter $P942, $P944
    new $P955, 'ExceptionHandler'
    set_addr $P955, loop954_handler
    $P955."handle_types"(65, 67, 66)
    push_eh $P955
  loop954_test:
    unless $P942, loop954_done
    shift $P946, $P942
  loop954_redo:
    .const 'Sub' $P948 = "64_1258055906.54293" 
    capture_lex $P948
    $P948($P946)
  loop954_next:
    goto loop954_test
  loop954_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P956, exception, 'type'
    eq $P956, 65, loop954_next
    eq $P956, 67, loop954_redo
  loop954_done:
    pop_eh 
  for_undef_326:
.annotate "line", 318
    .return ($P942)
  control_935:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P957, exception, "payload"
    .return ($P957)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block947"  :anon :subid("64_1258055906.54293") :outer("63_1258055906.54293")
    .param pmc param_949
.annotate "line", 320
    .lex "$_", param_949
    find_lex $P950, "$BLOCKINIT"
    find_lex $P951, "$_"
    $P952 = $P951."ast"()
    $P953 = $P950."push"($P952)
    .return ($P953)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("65_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_961
.annotate "line", 323
    new $P960, 'ExceptionHandler'
    set_addr $P960, control_959
    $P960."handle_types"(58)
    push_eh $P960
    .lex "self", self
    .lex "$/", param_961
.annotate "line", 324
    new $P962, "Undef"
    .lex "$quant", $P962
.annotate "line", 325
    new $P963, "Undef"
    .lex "$past", $P963
.annotate "line", 324
    find_lex $P964, "$/"
    unless_null $P964, vivify_327
    new $P964, "Hash"
  vivify_327:
    set $P965, $P964["quant"]
    unless_null $P965, vivify_328
    new $P965, "Undef"
  vivify_328:
    store_lex "$quant", $P965
    find_lex $P966, "$past"
.annotate "line", 326
    find_lex $P968, "$/"
    unless_null $P968, vivify_329
    new $P968, "Hash"
  vivify_329:
    set $P969, $P968["named_param"]
    unless_null $P969, vivify_330
    new $P969, "Undef"
  vivify_330:
    if $P969, if_967
.annotate "line", 333
    find_lex $P983, "$/"
    unless_null $P983, vivify_331
    new $P983, "Hash"
  vivify_331:
    set $P984, $P983["param_var"]
    unless_null $P984, vivify_332
    new $P984, "Undef"
  vivify_332:
    $P985 = $P984."ast"()
    store_lex "$past", $P985
.annotate "line", 334
    find_lex $P987, "$quant"
    set $S988, $P987
    iseq $I989, $S988, "*"
    if $I989, if_986
.annotate "line", 338
    find_lex $P998, "$quant"
    set $S999, $P998
    iseq $I1000, $S999, "?"
    unless $I1000, if_997_end
.annotate "line", 339
    find_lex $P1001, "$past"
    find_lex $P1002, "$/"
    unless_null $P1002, vivify_333
    new $P1002, "Hash"
  vivify_333:
    set $P1003, $P1002["param_var"]
    unless_null $P1003, vivify_334
    new $P1003, "Hash"
  vivify_334:
    set $P1004, $P1003["sigil"]
    unless_null $P1004, vivify_335
    new $P1004, "Undef"
  vivify_335:
    $P1005 = "sigiltype"($P1004)
    $P1001."viviself"($P1005)
  if_997_end:
.annotate "line", 338
    goto if_986_end
  if_986:
.annotate "line", 335
    find_lex $P990, "$past"
    $P990."slurpy"(1)
.annotate "line", 336
    find_lex $P991, "$past"
    find_lex $P992, "$/"
    unless_null $P992, vivify_336
    new $P992, "Hash"
  vivify_336:
    set $P993, $P992["param_var"]
    unless_null $P993, vivify_337
    new $P993, "Hash"
  vivify_337:
    set $P994, $P993["sigil"]
    unless_null $P994, vivify_338
    new $P994, "Undef"
  vivify_338:
    set $S995, $P994
    iseq $I996, $S995, "%"
    $P991."named"($I996)
  if_986_end:
.annotate "line", 332
    goto if_967_end
  if_967:
.annotate "line", 327
    find_lex $P970, "$/"
    unless_null $P970, vivify_339
    new $P970, "Hash"
  vivify_339:
    set $P971, $P970["named_param"]
    unless_null $P971, vivify_340
    new $P971, "Undef"
  vivify_340:
    $P972 = $P971."ast"()
    store_lex "$past", $P972
.annotate "line", 328
    find_lex $P974, "$quant"
    set $S975, $P974
    isne $I976, $S975, "!"
    unless $I976, if_973_end
.annotate "line", 329
    find_lex $P977, "$past"
    find_lex $P978, "$/"
    unless_null $P978, vivify_341
    new $P978, "Hash"
  vivify_341:
    set $P979, $P978["named_param"]
    unless_null $P979, vivify_342
    new $P979, "Hash"
  vivify_342:
    set $P980, $P979["param_var"]
    unless_null $P980, vivify_343
    new $P980, "Hash"
  vivify_343:
    set $P981, $P980["sigil"]
    unless_null $P981, vivify_344
    new $P981, "Undef"
  vivify_344:
    $P982 = "sigiltype"($P981)
    $P977."viviself"($P982)
  if_973_end:
  if_967_end:
.annotate "line", 342
    find_lex $P1007, "$/"
    unless_null $P1007, vivify_345
    new $P1007, "Hash"
  vivify_345:
    set $P1008, $P1007["default_value"]
    unless_null $P1008, vivify_346
    new $P1008, "Undef"
  vivify_346:
    unless $P1008, if_1006_end
.annotate "line", 343
    find_lex $P1010, "$quant"
    set $S1011, $P1010
    iseq $I1012, $S1011, "*"
    unless $I1012, if_1009_end
.annotate "line", 344
    find_lex $P1013, "$/"
    $P1014 = $P1013."CURSOR"()
    $P1014."panic"("Can't put default on slurpy parameter")
  if_1009_end:
.annotate "line", 346
    find_lex $P1016, "$quant"
    set $S1017, $P1016
    iseq $I1018, $S1017, "!"
    unless $I1018, if_1015_end
.annotate "line", 347
    find_lex $P1019, "$/"
    $P1020 = $P1019."CURSOR"()
    $P1020."panic"("Can't put default on required parameter")
  if_1015_end:
.annotate "line", 349
    find_lex $P1021, "$past"
    find_lex $P1022, "$/"
    unless_null $P1022, vivify_347
    new $P1022, "Hash"
  vivify_347:
    set $P1023, $P1022["default_value"]
    unless_null $P1023, vivify_348
    new $P1023, "ResizablePMCArray"
  vivify_348:
    set $P1024, $P1023[0]
    unless_null $P1024, vivify_349
    new $P1024, "Hash"
  vivify_349:
    set $P1025, $P1024["EXPR"]
    unless_null $P1025, vivify_350
    new $P1025, "Undef"
  vivify_350:
    $P1026 = $P1025."ast"()
    $P1021."viviself"($P1026)
  if_1006_end:
.annotate "line", 351
    find_lex $P1028, "$past"
    $P1029 = $P1028."viviself"()
    if $P1029, unless_1027_end
    get_global $P1030, "@BLOCK"
    unless_null $P1030, vivify_351
    new $P1030, "ResizablePMCArray"
  vivify_351:
    set $P1031, $P1030[0]
    unless_null $P1031, vivify_352
    new $P1031, "Undef"
  vivify_352:
    get_global $P1032, "@BLOCK"
    unless_null $P1032, vivify_353
    new $P1032, "ResizablePMCArray"
  vivify_353:
    set $P1033, $P1032[0]
    unless_null $P1033, vivify_354
    new $P1033, "Undef"
  vivify_354:
    $P1034 = $P1033."arity"()
    set $N1035, $P1034
    new $P1036, 'Float'
    set $P1036, $N1035
    add $P1037, $P1036, 1
    $P1031."arity"($P1037)
  unless_1027_end:
.annotate "line", 352
    find_lex $P1038, "$/"
    find_lex $P1039, "$past"
    $P1040 = $P1038."!make"($P1039)
.annotate "line", 323
    .return ($P1040)
  control_959:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1041, exception, "payload"
    .return ($P1041)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("66_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1045
.annotate "line", 355
    new $P1044, 'ExceptionHandler'
    set_addr $P1044, control_1043
    $P1044."handle_types"(58)
    push_eh $P1044
    .lex "self", self
    .lex "$/", param_1045
.annotate "line", 356
    new $P1046, "Undef"
    .lex "$name", $P1046
.annotate "line", 357
    new $P1047, "Undef"
    .lex "$past", $P1047
.annotate "line", 356
    find_lex $P1048, "$/"
    set $S1049, $P1048
    new $P1050, 'String'
    set $P1050, $S1049
    store_lex "$name", $P1050
.annotate "line", 357
    get_hll_global $P1051, ["PAST"], "Var"
    find_lex $P1052, "$name"
    find_lex $P1053, "$/"
    $P1054 = $P1051."new"($P1052 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1053 :named("node"))
    store_lex "$past", $P1054
.annotate "line", 359
    get_global $P1055, "@BLOCK"
    unless_null $P1055, vivify_355
    new $P1055, "ResizablePMCArray"
  vivify_355:
    set $P1056, $P1055[0]
    unless_null $P1056, vivify_356
    new $P1056, "Undef"
  vivify_356:
    find_lex $P1057, "$name"
    $P1056."symbol"($P1057, "lexical" :named("scope"))
.annotate "line", 360
    find_lex $P1058, "$/"
    find_lex $P1059, "$past"
    $P1060 = $P1058."!make"($P1059)
.annotate "line", 355
    .return ($P1060)
  control_1043:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1061, exception, "payload"
    .return ($P1061)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("67_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1065
.annotate "line", 363
    new $P1064, 'ExceptionHandler'
    set_addr $P1064, control_1063
    $P1064."handle_types"(58)
    push_eh $P1064
    .lex "self", self
    .lex "$/", param_1065
.annotate "line", 364
    new $P1066, "Undef"
    .lex "$past", $P1066
    find_lex $P1067, "$/"
    unless_null $P1067, vivify_357
    new $P1067, "Hash"
  vivify_357:
    set $P1068, $P1067["param_var"]
    unless_null $P1068, vivify_358
    new $P1068, "Undef"
  vivify_358:
    $P1069 = $P1068."ast"()
    store_lex "$past", $P1069
.annotate "line", 365
    find_lex $P1070, "$past"
    find_lex $P1071, "$/"
    unless_null $P1071, vivify_359
    new $P1071, "Hash"
  vivify_359:
    set $P1072, $P1071["param_var"]
    unless_null $P1072, vivify_360
    new $P1072, "Hash"
  vivify_360:
    set $P1073, $P1072["name"]
    unless_null $P1073, vivify_361
    new $P1073, "Undef"
  vivify_361:
    set $S1074, $P1073
    $P1070."named"($S1074)
.annotate "line", 366
    find_lex $P1075, "$/"
    find_lex $P1076, "$past"
    $P1077 = $P1075."!make"($P1076)
.annotate "line", 363
    .return ($P1077)
  control_1063:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1078, exception, "payload"
    .return ($P1078)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("68_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1082
    .param pmc param_1083 :optional
    .param int has_param_1083 :opt_flag
.annotate "line", 369
    .const 'Sub' $P1153 = "70_1258055906.54293" 
    capture_lex $P1153
    .const 'Sub' $P1100 = "69_1258055906.54293" 
    capture_lex $P1100
    new $P1081, 'ExceptionHandler'
    set_addr $P1081, control_1080
    $P1081."handle_types"(58)
    push_eh $P1081
    .lex "self", self
    .lex "$/", param_1082
    if has_param_1083, optparam_362
    new $P1084, "Undef"
    set param_1083, $P1084
  optparam_362:
    .lex "$key", param_1083
.annotate "line", 370
    new $P1085, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1085
.annotate "line", 373
    new $P1086, "Undef"
    .lex "$name", $P1086
.annotate "line", 374
    new $P1087, "Undef"
    .lex "$past", $P1087
.annotate "line", 370

        $P1088 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1088
.annotate "line", 373
    find_lex $P1089, "$/"
    unless_null $P1089, vivify_363
    new $P1089, "Hash"
  vivify_363:
    set $P1090, $P1089["deflongname"]
    unless_null $P1090, vivify_364
    new $P1090, "Undef"
  vivify_364:
    $P1091 = $P1090."ast"()
    set $S1092, $P1091
    new $P1093, 'String'
    set $P1093, $S1092
    store_lex "$name", $P1093
    find_lex $P1094, "$past"
.annotate "line", 375
    find_lex $P1096, "$key"
    set $S1097, $P1096
    iseq $I1098, $S1097, "open"
    if $I1098, if_1095
.annotate "line", 388
    find_lex $P1128, "$/"
    unless_null $P1128, vivify_365
    new $P1128, "Hash"
  vivify_365:
    set $P1129, $P1128["proto"]
    unless_null $P1129, vivify_366
    new $P1129, "Undef"
  vivify_366:
    if $P1129, if_1127
.annotate "line", 415
    .const 'Sub' $P1153 = "70_1258055906.54293" 
    capture_lex $P1153
    $P1153()
    goto if_1127_end
  if_1127:
.annotate "line", 390
    get_hll_global $P1130, ["PAST"], "Stmts"
.annotate "line", 391
    get_hll_global $P1131, ["PAST"], "Block"
    find_lex $P1132, "$name"
.annotate "line", 392
    get_hll_global $P1133, ["PAST"], "Op"
.annotate "line", 393
    get_hll_global $P1134, ["PAST"], "Var"
    $P1135 = $P1134."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1136, "$name"
    $P1137 = $P1133."new"($P1135, $P1136, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 392
    find_lex $P1138, "$/"
    $P1139 = $P1131."new"($P1137, $P1132 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1138 :named("node"))
.annotate "line", 402
    get_hll_global $P1140, ["PAST"], "Block"
    new $P1141, "String"
    assign $P1141, "!PREFIX__"
    find_lex $P1142, "$name"
    concat $P1143, $P1141, $P1142
.annotate "line", 403
    get_hll_global $P1144, ["PAST"], "Op"
.annotate "line", 404
    get_hll_global $P1145, ["PAST"], "Var"
    $P1146 = $P1145."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1147, "$name"
    $P1148 = $P1144."new"($P1146, $P1147, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 403
    find_lex $P1149, "$/"
    $P1150 = $P1140."new"($P1148, $P1143 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1149 :named("node"))
.annotate "line", 402
    $P1151 = $P1130."new"($P1139, $P1150)
.annotate "line", 390
    store_lex "$past", $P1151
  if_1127_end:
.annotate "line", 388
    goto if_1095_end
  if_1095:
.annotate "line", 375
    .const 'Sub' $P1100 = "69_1258055906.54293" 
    capture_lex $P1100
    $P1100()
  if_1095_end:
.annotate "line", 431
    find_lex $P1179, "$/"
    find_lex $P1180, "$past"
    $P1181 = $P1179."!make"($P1180)
.annotate "line", 369
    .return ($P1181)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1182, exception, "payload"
    .return ($P1182)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1152"  :anon :subid("70_1258055906.54293") :outer("68_1258055906.54293")
.annotate "line", 416
    new $P1154, "Undef"
    .lex "$rpast", $P1154
.annotate "line", 417
    new $P1155, "Hash"
    .lex "%capnames", $P1155
.annotate "line", 416
    find_lex $P1156, "$/"
    unless_null $P1156, vivify_367
    new $P1156, "Hash"
  vivify_367:
    set $P1157, $P1156["p6regex"]
    unless_null $P1157, vivify_368
    new $P1157, "Undef"
  vivify_368:
    $P1158 = $P1157."ast"()
    store_lex "$rpast", $P1158
.annotate "line", 417
    get_hll_global $P1159, ["Regex";"P6Regex";"Actions"], "capnames"
    find_lex $P1160, "$rpast"
    $P1161 = $P1159($P1160, 0)
    store_lex "%capnames", $P1161
.annotate "line", 418
    new $P1162, "Integer"
    assign $P1162, 0
    find_lex $P1163, "%capnames"
    unless_null $P1163, vivify_369
    new $P1163, "Hash"
    store_lex "%capnames", $P1163
  vivify_369:
    set $P1163[""], $P1162
.annotate "line", 419
    get_hll_global $P1164, ["PAST"], "Regex"
    find_lex $P1165, "$rpast"
.annotate "line", 421
    get_hll_global $P1166, ["PAST"], "Regex"
    $P1167 = $P1166."new"("pass" :named("pasttype"))
    find_lex $P1168, "%capnames"
    $P1169 = $P1164."new"($P1165, $P1167, "concat" :named("pasttype"), $P1168 :named("capnames"))
.annotate "line", 419
    store_lex "$rpast", $P1169
.annotate "line", 425
    get_global $P1170, "@BLOCK"
    $P1171 = $P1170."shift"()
    store_lex "$past", $P1171
.annotate "line", 426
    find_lex $P1172, "$past"
    $P1172."blocktype"("method")
.annotate "line", 427
    find_lex $P1173, "$past"
    find_lex $P1174, "$name"
    $P1173."name"($P1174)
.annotate "line", 428
    find_lex $P1175, "$past"
    find_lex $P1176, "$rpast"
    $P1175."push"($P1176)
.annotate "line", 429
    find_lex $P1177, "@MODIFIERS"
    $P1178 = $P1177."shift"()
.annotate "line", 415
    .return ($P1178)
.end


.namespace ["NQP";"Actions"]
.sub "_block1099"  :anon :subid("69_1258055906.54293") :outer("68_1258055906.54293")
.annotate "line", 376
    new $P1101, "Hash"
    .lex "%h", $P1101
.annotate "line", 375
    find_lex $P1102, "%h"
.annotate "line", 377
    find_lex $P1104, "$/"
    unless_null $P1104, vivify_370
    new $P1104, "Hash"
  vivify_370:
    set $P1105, $P1104["sym"]
    unless_null $P1105, vivify_371
    new $P1105, "Undef"
  vivify_371:
    set $S1106, $P1105
    iseq $I1107, $S1106, "token"
    unless $I1107, if_1103_end
    new $P1108, "Integer"
    assign $P1108, 1
    find_lex $P1109, "%h"
    unless_null $P1109, vivify_372
    new $P1109, "Hash"
    store_lex "%h", $P1109
  vivify_372:
    set $P1109["r"], $P1108
  if_1103_end:
.annotate "line", 378
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_373
    new $P1111, "Hash"
  vivify_373:
    set $P1112, $P1111["sym"]
    unless_null $P1112, vivify_374
    new $P1112, "Undef"
  vivify_374:
    set $S1113, $P1112
    iseq $I1114, $S1113, "rule"
    unless $I1114, if_1110_end
    new $P1115, "Integer"
    assign $P1115, 1
    find_lex $P1116, "%h"
    unless_null $P1116, vivify_375
    new $P1116, "Hash"
    store_lex "%h", $P1116
  vivify_375:
    set $P1116["r"], $P1115
    new $P1117, "Integer"
    assign $P1117, 1
    find_lex $P1118, "%h"
    unless_null $P1118, vivify_376
    new $P1118, "Hash"
    store_lex "%h", $P1118
  vivify_376:
    set $P1118["s"], $P1117
  if_1110_end:
.annotate "line", 379
    find_lex $P1119, "@MODIFIERS"
    find_lex $P1120, "%h"
    $P1119."unshift"($P1120)
.annotate "line", 380

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 384
    get_global $P1121, "@BLOCK"
    unless_null $P1121, vivify_377
    new $P1121, "ResizablePMCArray"
  vivify_377:
    set $P1122, $P1121[0]
    unless_null $P1122, vivify_378
    new $P1122, "Undef"
  vivify_378:
    $P1122."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 385
    get_global $P1123, "@BLOCK"
    unless_null $P1123, vivify_379
    new $P1123, "ResizablePMCArray"
  vivify_379:
    set $P1124, $P1123[0]
    unless_null $P1124, vivify_380
    new $P1124, "Undef"
  vivify_380:
    $P1124."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 386
    new $P1125, "Exception"
    set $P1125['type'], 58
    new $P1126, "Integer"
    assign $P1126, 0
    setattribute $P1125, 'payload', $P1126
    throw $P1125
.annotate "line", 375
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("71_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1186
.annotate "line", 435
    new $P1185, 'ExceptionHandler'
    set_addr $P1185, control_1184
    $P1185."handle_types"(58)
    push_eh $P1185
    .lex "self", self
    .lex "$/", param_1186
.annotate "line", 436
    new $P1187, "Undef"
    .lex "$past", $P1187
    find_lex $P1190, "$/"
    unless_null $P1190, vivify_381
    new $P1190, "Hash"
  vivify_381:
    set $P1191, $P1190["args"]
    unless_null $P1191, vivify_382
    new $P1191, "Undef"
  vivify_382:
    if $P1191, if_1189
    get_hll_global $P1196, ["PAST"], "Op"
    find_lex $P1197, "$/"
    $P1198 = $P1196."new"($P1197 :named("node"))
    set $P1188, $P1198
    goto if_1189_end
  if_1189:
    find_lex $P1192, "$/"
    unless_null $P1192, vivify_383
    new $P1192, "Hash"
  vivify_383:
    set $P1193, $P1192["args"]
    unless_null $P1193, vivify_384
    new $P1193, "ResizablePMCArray"
  vivify_384:
    set $P1194, $P1193[0]
    unless_null $P1194, vivify_385
    new $P1194, "Undef"
  vivify_385:
    $P1195 = $P1194."ast"()
    set $P1188, $P1195
  if_1189_end:
    store_lex "$past", $P1188
.annotate "line", 437
    find_lex $P1199, "$past"
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_386
    new $P1200, "Hash"
  vivify_386:
    set $P1201, $P1200["identifier"]
    unless_null $P1201, vivify_387
    new $P1201, "Undef"
  vivify_387:
    set $S1202, $P1201
    $P1199."name"($S1202)
.annotate "line", 438
    find_lex $P1203, "$past"
    $P1203."pasttype"("callmethod")
.annotate "line", 439
    find_lex $P1204, "$/"
    find_lex $P1205, "$past"
    $P1206 = $P1204."!make"($P1205)
.annotate "line", 435
    .return ($P1206)
  control_1184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1207, exception, "payload"
    .return ($P1207)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("72_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1211
.annotate "line", 444
    new $P1210, 'ExceptionHandler'
    set_addr $P1210, control_1209
    $P1210."handle_types"(58)
    push_eh $P1210
    .lex "self", self
    .lex "$/", param_1211
.annotate "line", 445
    find_lex $P1212, "$/"
    get_hll_global $P1213, ["PAST"], "Var"
    $P1214 = $P1213."new"("self" :named("name"))
    $P1215 = $P1212."!make"($P1214)
.annotate "line", 444
    .return ($P1215)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1216, exception, "payload"
    .return ($P1216)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("73_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1220
.annotate "line", 448
    new $P1219, 'ExceptionHandler'
    set_addr $P1219, control_1218
    $P1219."handle_types"(58)
    push_eh $P1219
    .lex "self", self
    .lex "$/", param_1220
.annotate "line", 449
    new $P1221, "Undef"
    .lex "$past", $P1221
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_388
    new $P1222, "Hash"
  vivify_388:
    set $P1223, $P1222["args"]
    unless_null $P1223, vivify_389
    new $P1223, "Undef"
  vivify_389:
    $P1224 = $P1223."ast"()
    store_lex "$past", $P1224
.annotate "line", 450
    find_lex $P1225, "$past"
    find_lex $P1226, "$/"
    unless_null $P1226, vivify_390
    new $P1226, "Hash"
  vivify_390:
    set $P1227, $P1226["identifier"]
    unless_null $P1227, vivify_391
    new $P1227, "Undef"
  vivify_391:
    set $S1228, $P1227
    $P1225."name"($S1228)
.annotate "line", 451
    find_lex $P1229, "$/"
    find_lex $P1230, "$past"
    $P1231 = $P1229."!make"($P1230)
.annotate "line", 448
    .return ($P1231)
  control_1218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1232, exception, "payload"
    .return ($P1232)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("74_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1236
.annotate "line", 454
    new $P1235, 'ExceptionHandler'
    set_addr $P1235, control_1234
    $P1235."handle_types"(58)
    push_eh $P1235
    .lex "self", self
    .lex "$/", param_1236
.annotate "line", 455
    new $P1237, "Undef"
    .lex "$ns", $P1237
.annotate "line", 460
    new $P1238, "Undef"
    .lex "$name", $P1238
.annotate "line", 461
    new $P1239, "Undef"
    .lex "$var", $P1239
.annotate "line", 463
    new $P1240, "Undef"
    .lex "$past", $P1240
.annotate "line", 455
    find_lex $P1241, "$/"
    unless_null $P1241, vivify_392
    new $P1241, "Hash"
  vivify_392:
    set $P1242, $P1241["name"]
    unless_null $P1242, vivify_393
    new $P1242, "Hash"
  vivify_393:
    set $P1243, $P1242["identifier"]
    unless_null $P1243, vivify_394
    new $P1243, "Undef"
  vivify_394:
    store_lex "$ns", $P1243
.annotate "line", 456

               $P0 = find_lex '$ns'
               $P1244 = clone $P0
           
    store_lex "$ns", $P1244
.annotate "line", 460
    find_lex $P1245, "$ns"
    $P1246 = $P1245."pop"()
    store_lex "$name", $P1246
.annotate "line", 462
    get_hll_global $P1247, ["PAST"], "Var"
    find_lex $P1248, "$name"
    set $S1249, $P1248
    find_lex $P1250, "$ns"
    $P1251 = $P1247."new"($S1249 :named("name"), $P1250 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1251
.annotate "line", 463
    find_lex $P1252, "$var"
    store_lex "$past", $P1252
.annotate "line", 464
    find_lex $P1254, "$/"
    unless_null $P1254, vivify_395
    new $P1254, "Hash"
  vivify_395:
    set $P1255, $P1254["args"]
    unless_null $P1255, vivify_396
    new $P1255, "Undef"
  vivify_396:
    unless $P1255, if_1253_end
.annotate "line", 465
    find_lex $P1256, "$/"
    unless_null $P1256, vivify_397
    new $P1256, "Hash"
  vivify_397:
    set $P1257, $P1256["args"]
    unless_null $P1257, vivify_398
    new $P1257, "ResizablePMCArray"
  vivify_398:
    set $P1258, $P1257[0]
    unless_null $P1258, vivify_399
    new $P1258, "Undef"
  vivify_399:
    $P1259 = $P1258."ast"()
    store_lex "$past", $P1259
.annotate "line", 466
    find_lex $P1260, "$past"
    find_lex $P1261, "$var"
    $P1260."unshift"($P1261)
  if_1253_end:
.annotate "line", 468
    find_lex $P1262, "$/"
    find_lex $P1263, "$past"
    $P1264 = $P1262."!make"($P1263)
.annotate "line", 454
    .return ($P1264)
  control_1234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1265, exception, "payload"
    .return ($P1265)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("75_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1269
.annotate "line", 471
    new $P1268, 'ExceptionHandler'
    set_addr $P1268, control_1267
    $P1268."handle_types"(58)
    push_eh $P1268
    .lex "self", self
    .lex "$/", param_1269
.annotate "line", 472
    new $P1270, "Undef"
    .lex "$past", $P1270
.annotate "line", 473
    new $P1271, "Undef"
    .lex "$pirop", $P1271
.annotate "line", 472
    find_lex $P1274, "$/"
    unless_null $P1274, vivify_400
    new $P1274, "Hash"
  vivify_400:
    set $P1275, $P1274["args"]
    unless_null $P1275, vivify_401
    new $P1275, "Undef"
  vivify_401:
    if $P1275, if_1273
    get_hll_global $P1280, ["PAST"], "Op"
    find_lex $P1281, "$/"
    $P1282 = $P1280."new"($P1281 :named("node"))
    set $P1272, $P1282
    goto if_1273_end
  if_1273:
    find_lex $P1276, "$/"
    unless_null $P1276, vivify_402
    new $P1276, "Hash"
  vivify_402:
    set $P1277, $P1276["args"]
    unless_null $P1277, vivify_403
    new $P1277, "ResizablePMCArray"
  vivify_403:
    set $P1278, $P1277[0]
    unless_null $P1278, vivify_404
    new $P1278, "Undef"
  vivify_404:
    $P1279 = $P1278."ast"()
    set $P1272, $P1279
  if_1273_end:
    store_lex "$past", $P1272
.annotate "line", 473
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_405
    new $P1283, "Hash"
  vivify_405:
    set $P1284, $P1283["op"]
    unless_null $P1284, vivify_406
    new $P1284, "Undef"
  vivify_406:
    set $S1285, $P1284
    new $P1286, 'String'
    set $P1286, $S1285
    store_lex "$pirop", $P1286
.annotate "line", 474

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1287 = box $S0
    
    store_lex "$pirop", $P1287
.annotate "line", 481
    find_lex $P1288, "$past"
    find_lex $P1289, "$pirop"
    $P1288."pirop"($P1289)
.annotate "line", 482
    find_lex $P1290, "$past"
    $P1290."pasttype"("pirop")
.annotate "line", 483
    find_lex $P1291, "$/"
    find_lex $P1292, "$past"
    $P1293 = $P1291."!make"($P1292)
.annotate "line", 471
    .return ($P1293)
  control_1267:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1294, exception, "payload"
    .return ($P1294)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("76_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1298
.annotate "line", 486
    new $P1297, 'ExceptionHandler'
    set_addr $P1297, control_1296
    $P1297."handle_types"(58)
    push_eh $P1297
    .lex "self", self
    .lex "$/", param_1298
    find_lex $P1299, "$/"
    find_lex $P1300, "$/"
    unless_null $P1300, vivify_407
    new $P1300, "Hash"
  vivify_407:
    set $P1301, $P1300["arglist"]
    unless_null $P1301, vivify_408
    new $P1301, "Undef"
  vivify_408:
    $P1302 = $P1301."ast"()
    $P1303 = $P1299."!make"($P1302)
    .return ($P1303)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1304, exception, "payload"
    .return ($P1304)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("77_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1308
.annotate "line", 488
    .const 'Sub' $P1319 = "78_1258055906.54293" 
    capture_lex $P1319
    new $P1307, 'ExceptionHandler'
    set_addr $P1307, control_1306
    $P1307."handle_types"(58)
    push_eh $P1307
    .lex "self", self
    .lex "$/", param_1308
.annotate "line", 489
    new $P1309, "Undef"
    .lex "$past", $P1309
.annotate "line", 497
    new $P1310, "Undef"
    .lex "$i", $P1310
.annotate "line", 498
    new $P1311, "Undef"
    .lex "$n", $P1311
.annotate "line", 489
    get_hll_global $P1312, ["PAST"], "Op"
    find_lex $P1313, "$/"
    $P1314 = $P1312."new"("call" :named("pasttype"), $P1313 :named("node"))
    store_lex "$past", $P1314
.annotate "line", 490
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_409
    new $P1316, "Hash"
  vivify_409:
    set $P1317, $P1316["EXPR"]
    unless_null $P1317, vivify_410
    new $P1317, "Undef"
  vivify_410:
    unless $P1317, if_1315_end
    .const 'Sub' $P1319 = "78_1258055906.54293" 
    capture_lex $P1319
    $P1319()
  if_1315_end:
.annotate "line", 497
    new $P1351, "Integer"
    assign $P1351, 0
    store_lex "$i", $P1351
.annotate "line", 498
    find_lex $P1352, "$past"
    $P1353 = $P1352."list"()
    set $N1354, $P1353
    new $P1355, 'Float'
    set $P1355, $N1354
    store_lex "$n", $P1355
.annotate "line", 499
    new $P1383, 'ExceptionHandler'
    set_addr $P1383, loop1382_handler
    $P1383."handle_types"(65, 67, 66)
    push_eh $P1383
  loop1382_test:
    find_lex $P1356, "$i"
    set $N1357, $P1356
    find_lex $P1358, "$n"
    set $N1359, $P1358
    islt $I1360, $N1357, $N1359
    unless $I1360, loop1382_done
  loop1382_redo:
.annotate "line", 500
    find_lex $P1362, "$i"
    set $I1363, $P1362
    find_lex $P1364, "$past"
    unless_null $P1364, vivify_414
    new $P1364, "ResizablePMCArray"
  vivify_414:
    set $P1365, $P1364[$I1363]
    unless_null $P1365, vivify_415
    new $P1365, "Undef"
  vivify_415:
    $S1366 = $P1365."name"()
    iseq $I1367, $S1366, "&prefix:<|>"
    unless $I1367, if_1361_end
.annotate "line", 501
    find_lex $P1368, "$i"
    set $I1369, $P1368
    find_lex $P1370, "$past"
    unless_null $P1370, vivify_416
    new $P1370, "ResizablePMCArray"
  vivify_416:
    set $P1371, $P1370[$I1369]
    unless_null $P1371, vivify_417
    new $P1371, "ResizablePMCArray"
  vivify_417:
    set $P1372, $P1371[0]
    unless_null $P1372, vivify_418
    new $P1372, "Undef"
  vivify_418:
    find_lex $P1373, "$i"
    set $I1374, $P1373
    find_lex $P1375, "$past"
    unless_null $P1375, vivify_419
    new $P1375, "ResizablePMCArray"
    store_lex "$past", $P1375
  vivify_419:
    set $P1375[$I1374], $P1372
.annotate "line", 502
    find_lex $P1376, "$i"
    set $I1377, $P1376
    find_lex $P1378, "$past"
    unless_null $P1378, vivify_420
    new $P1378, "ResizablePMCArray"
  vivify_420:
    set $P1379, $P1378[$I1377]
    unless_null $P1379, vivify_421
    new $P1379, "Undef"
  vivify_421:
    $P1379."flat"(1)
  if_1361_end:
.annotate "line", 500
    find_lex $P1380, "$i"
    clone $P1381, $P1380
    inc $P1380
  loop1382_next:
.annotate "line", 499
    goto loop1382_test
  loop1382_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1384, exception, 'type'
    eq $P1384, 65, loop1382_next
    eq $P1384, 67, loop1382_redo
  loop1382_done:
    pop_eh 
.annotate "line", 506
    find_lex $P1385, "$/"
    find_lex $P1386, "$past"
    $P1387 = $P1385."!make"($P1386)
.annotate "line", 488
    .return ($P1387)
  control_1306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1388, exception, "payload"
    .return ($P1388)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1318"  :anon :subid("78_1258055906.54293") :outer("77_1258055906.54293")
.annotate "line", 490
    .const 'Sub' $P1340 = "79_1258055906.54293" 
    capture_lex $P1340
.annotate "line", 491
    new $P1320, "Undef"
    .lex "$expr", $P1320
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_411
    new $P1321, "Hash"
  vivify_411:
    set $P1322, $P1321["EXPR"]
    unless_null $P1322, vivify_412
    new $P1322, "Undef"
  vivify_412:
    $P1323 = $P1322."ast"()
    store_lex "$expr", $P1323
.annotate "line", 492
    find_lex $P1328, "$expr"
    $S1329 = $P1328."name"()
    iseq $I1330, $S1329, "&infix:<,>"
    if $I1330, if_1327
    new $P1326, 'Integer'
    set $P1326, $I1330
    goto if_1327_end
  if_1327:
    find_lex $P1331, "$expr"
    $P1332 = $P1331."named"()
    isfalse $I1333, $P1332
    new $P1326, 'Integer'
    set $P1326, $I1333
  if_1327_end:
    if $P1326, if_1325
.annotate "line", 495
    find_lex $P1348, "$past"
    find_lex $P1349, "$expr"
    $P1350 = $P1348."push"($P1349)
    set $P1324, $P1350
.annotate "line", 492
    goto if_1325_end
  if_1325:
.annotate "line", 493
    find_lex $P1335, "$expr"
    $P1336 = $P1335."list"()
    defined $I1337, $P1336
    unless $I1337, for_undef_413
    iter $P1334, $P1336
    new $P1346, 'ExceptionHandler'
    set_addr $P1346, loop1345_handler
    $P1346."handle_types"(65, 67, 66)
    push_eh $P1346
  loop1345_test:
    unless $P1334, loop1345_done
    shift $P1338, $P1334
  loop1345_redo:
    .const 'Sub' $P1340 = "79_1258055906.54293" 
    capture_lex $P1340
    $P1340($P1338)
  loop1345_next:
    goto loop1345_test
  loop1345_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1347, exception, 'type'
    eq $P1347, 65, loop1345_next
    eq $P1347, 67, loop1345_redo
  loop1345_done:
    pop_eh 
  for_undef_413:
.annotate "line", 492
    set $P1324, $P1334
  if_1325_end:
.annotate "line", 490
    .return ($P1324)
.end


.namespace ["NQP";"Actions"]
.sub "_block1339"  :anon :subid("79_1258055906.54293") :outer("78_1258055906.54293")
    .param pmc param_1341
.annotate "line", 493
    .lex "$_", param_1341
    find_lex $P1342, "$past"
    find_lex $P1343, "$_"
    $P1344 = $P1342."push"($P1343)
    .return ($P1344)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("80_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1392
.annotate "line", 510
    new $P1391, 'ExceptionHandler'
    set_addr $P1391, control_1390
    $P1391."handle_types"(58)
    push_eh $P1391
    .lex "self", self
    .lex "$/", param_1392
    find_lex $P1393, "$/"
    find_lex $P1394, "$/"
    unless_null $P1394, vivify_422
    new $P1394, "Hash"
  vivify_422:
    set $P1395, $P1394["value"]
    unless_null $P1395, vivify_423
    new $P1395, "Undef"
  vivify_423:
    $P1396 = $P1395."ast"()
    $P1397 = $P1393."!make"($P1396)
    .return ($P1397)
  control_1390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1398, exception, "payload"
    .return ($P1398)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("81_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1402
.annotate "line", 512
    new $P1401, 'ExceptionHandler'
    set_addr $P1401, control_1400
    $P1401."handle_types"(58)
    push_eh $P1401
    .lex "self", self
    .lex "$/", param_1402
.annotate "line", 513
    find_lex $P1403, "$/"
.annotate "line", 514
    find_lex $P1406, "$/"
    unless_null $P1406, vivify_424
    new $P1406, "Hash"
  vivify_424:
    set $P1407, $P1406["EXPR"]
    unless_null $P1407, vivify_425
    new $P1407, "Undef"
  vivify_425:
    if $P1407, if_1405
.annotate "line", 515
    get_hll_global $P1412, ["PAST"], "Op"
    find_lex $P1413, "$/"
    $P1414 = $P1412."new"("list" :named("pasttype"), $P1413 :named("node"))
    set $P1404, $P1414
.annotate "line", 514
    goto if_1405_end
  if_1405:
    find_lex $P1408, "$/"
    unless_null $P1408, vivify_426
    new $P1408, "Hash"
  vivify_426:
    set $P1409, $P1408["EXPR"]
    unless_null $P1409, vivify_427
    new $P1409, "ResizablePMCArray"
  vivify_427:
    set $P1410, $P1409[0]
    unless_null $P1410, vivify_428
    new $P1410, "Undef"
  vivify_428:
    $P1411 = $P1410."ast"()
    set $P1404, $P1411
  if_1405_end:
    $P1415 = $P1403."!make"($P1404)
.annotate "line", 512
    .return ($P1415)
  control_1400:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1416, exception, "payload"
    .return ($P1416)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("82_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1420
.annotate "line", 518
    new $P1419, 'ExceptionHandler'
    set_addr $P1419, control_1418
    $P1419."handle_types"(58)
    push_eh $P1419
    .lex "self", self
    .lex "$/", param_1420
.annotate "line", 519
    new $P1421, "Undef"
    .lex "$past", $P1421
.annotate "line", 518
    find_lex $P1422, "$past"
.annotate "line", 520
    find_lex $P1424, "$/"
    unless_null $P1424, vivify_429
    new $P1424, "Hash"
  vivify_429:
    set $P1425, $P1424["EXPR"]
    unless_null $P1425, vivify_430
    new $P1425, "Undef"
  vivify_430:
    if $P1425, if_1423
.annotate "line", 527
    get_hll_global $P1437, ["PAST"], "Op"
    $P1438 = $P1437."new"("list" :named("pasttype"))
    store_lex "$past", $P1438
.annotate "line", 526
    goto if_1423_end
  if_1423:
.annotate "line", 521
    find_lex $P1426, "$/"
    unless_null $P1426, vivify_431
    new $P1426, "Hash"
  vivify_431:
    set $P1427, $P1426["EXPR"]
    unless_null $P1427, vivify_432
    new $P1427, "ResizablePMCArray"
  vivify_432:
    set $P1428, $P1427[0]
    unless_null $P1428, vivify_433
    new $P1428, "Undef"
  vivify_433:
    $P1429 = $P1428."ast"()
    store_lex "$past", $P1429
.annotate "line", 522
    find_lex $P1431, "$past"
    $S1432 = $P1431."name"()
    isne $I1433, $S1432, "&infix:<,>"
    unless $I1433, if_1430_end
.annotate "line", 523
    get_hll_global $P1434, ["PAST"], "Op"
    find_lex $P1435, "$past"
    $P1436 = $P1434."new"($P1435, "list" :named("pasttype"))
    store_lex "$past", $P1436
  if_1430_end:
  if_1423_end:
.annotate "line", 529
    find_lex $P1439, "$past"
    $P1439."name"("&circumfix:<[ ]>")
.annotate "line", 530
    find_lex $P1440, "$/"
    find_lex $P1441, "$past"
    $P1442 = $P1440."!make"($P1441)
.annotate "line", 518
    .return ($P1442)
  control_1418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1443, exception, "payload"
    .return ($P1443)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("83_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1447
.annotate "line", 533
    new $P1446, 'ExceptionHandler'
    set_addr $P1446, control_1445
    $P1446."handle_types"(58)
    push_eh $P1446
    .lex "self", self
    .lex "$/", param_1447
    find_lex $P1448, "$/"
    find_lex $P1449, "$/"
    unless_null $P1449, vivify_434
    new $P1449, "Hash"
  vivify_434:
    set $P1450, $P1449["quote_EXPR"]
    unless_null $P1450, vivify_435
    new $P1450, "Undef"
  vivify_435:
    $P1451 = $P1450."ast"()
    $P1452 = $P1448."!make"($P1451)
    .return ($P1452)
  control_1445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1453, exception, "payload"
    .return ($P1453)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("84_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1457
.annotate "line", 535
    new $P1456, 'ExceptionHandler'
    set_addr $P1456, control_1455
    $P1456."handle_types"(58)
    push_eh $P1456
    .lex "self", self
    .lex "$/", param_1457
.annotate "line", 536
    find_lex $P1458, "$/"
    find_lex $P1461, "$/"
    unless_null $P1461, vivify_436
    new $P1461, "Hash"
  vivify_436:
    set $P1462, $P1461["pblock"]
    unless_null $P1462, vivify_437
    new $P1462, "Hash"
  vivify_437:
    set $P1463, $P1462["blockoid"]
    unless_null $P1463, vivify_438
    new $P1463, "Hash"
  vivify_438:
    set $P1464, $P1463["statementlist"]
    unless_null $P1464, vivify_439
    new $P1464, "Hash"
  vivify_439:
    set $P1465, $P1464["statement"]
    unless_null $P1465, vivify_440
    new $P1465, "Undef"
  vivify_440:
    set $N1466, $P1465
    new $P1467, "Integer"
    assign $P1467, 0
    set $N1468, $P1467
    isgt $I1469, $N1466, $N1468
    if $I1469, if_1460
.annotate "line", 538
    get_hll_global $P1473, ["PAST"], "Op"
    find_lex $P1474, "$/"
    $P1475 = $P1473."new"("    %r = new [\"Hash\"]" :named("inline"), $P1474 :named("node"))
    set $P1459, $P1475
.annotate "line", 536
    goto if_1460_end
  if_1460:
.annotate "line", 537
    find_lex $P1470, "$/"
    unless_null $P1470, vivify_441
    new $P1470, "Hash"
  vivify_441:
    set $P1471, $P1470["pblock"]
    unless_null $P1471, vivify_442
    new $P1471, "Undef"
  vivify_442:
    $P1472 = $P1471."ast"()
    set $P1459, $P1472
  if_1460_end:
    $P1476 = $P1458."!make"($P1459)
.annotate "line", 535
    .return ($P1476)
  control_1455:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1477, exception, "payload"
    .return ($P1477)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("85_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1481
.annotate "line", 541
    new $P1480, 'ExceptionHandler'
    set_addr $P1480, control_1479
    $P1480."handle_types"(58)
    push_eh $P1480
    .lex "self", self
    .lex "$/", param_1481
.annotate "line", 542
    new $P1482, "Undef"
    .lex "$name", $P1482
    find_lex $P1485, "$/"
    unless_null $P1485, vivify_443
    new $P1485, "Hash"
  vivify_443:
    set $P1486, $P1485["sigil"]
    unless_null $P1486, vivify_444
    new $P1486, "Undef"
  vivify_444:
    set $S1487, $P1486
    iseq $I1488, $S1487, "@"
    if $I1488, if_1484
.annotate "line", 543
    find_lex $P1492, "$/"
    unless_null $P1492, vivify_445
    new $P1492, "Hash"
  vivify_445:
    set $P1493, $P1492["sigil"]
    unless_null $P1493, vivify_446
    new $P1493, "Undef"
  vivify_446:
    set $S1494, $P1493
    iseq $I1495, $S1494, "%"
    if $I1495, if_1491
    new $P1497, "String"
    assign $P1497, "item"
    set $P1490, $P1497
    goto if_1491_end
  if_1491:
    new $P1496, "String"
    assign $P1496, "hash"
    set $P1490, $P1496
  if_1491_end:
    set $P1483, $P1490
.annotate "line", 542
    goto if_1484_end
  if_1484:
    new $P1489, "String"
    assign $P1489, "list"
    set $P1483, $P1489
  if_1484_end:
    store_lex "$name", $P1483
.annotate "line", 545
    find_lex $P1498, "$/"
    get_hll_global $P1499, ["PAST"], "Op"
    find_lex $P1500, "$name"
    find_lex $P1501, "$/"
    unless_null $P1501, vivify_447
    new $P1501, "Hash"
  vivify_447:
    set $P1502, $P1501["semilist"]
    unless_null $P1502, vivify_448
    new $P1502, "Undef"
  vivify_448:
    $P1503 = $P1502."ast"()
    $P1504 = $P1499."new"($P1503, "callmethod" :named("pasttype"), $P1500 :named("name"))
    $P1505 = $P1498."!make"($P1504)
.annotate "line", 541
    .return ($P1505)
  control_1479:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1506, exception, "payload"
    .return ($P1506)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("86_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1510
.annotate "line", 548
    new $P1509, 'ExceptionHandler'
    set_addr $P1509, control_1508
    $P1509."handle_types"(58)
    push_eh $P1509
    .lex "self", self
    .lex "$/", param_1510
    find_lex $P1511, "$/"
    find_lex $P1512, "$/"
    unless_null $P1512, vivify_449
    new $P1512, "Hash"
  vivify_449:
    set $P1513, $P1512["statement"]
    unless_null $P1513, vivify_450
    new $P1513, "Undef"
  vivify_450:
    $P1514 = $P1513."ast"()
    $P1515 = $P1511."!make"($P1514)
    .return ($P1515)
  control_1508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1516, exception, "payload"
    .return ($P1516)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("87_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1520
.annotate "line", 550
    new $P1519, 'ExceptionHandler'
    set_addr $P1519, control_1518
    $P1519."handle_types"(58)
    push_eh $P1519
    .lex "self", self
    .lex "$/", param_1520
.annotate "line", 551
    find_lex $P1521, "$/"
    get_hll_global $P1522, ["PAST"], "Var"
    find_lex $P1523, "$/"
    unless_null $P1523, vivify_451
    new $P1523, "Hash"
  vivify_451:
    set $P1524, $P1523["EXPR"]
    unless_null $P1524, vivify_452
    new $P1524, "Undef"
  vivify_452:
    $P1525 = $P1524."ast"()
    $P1526 = $P1522."new"($P1525, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1527 = $P1521."!make"($P1526)
.annotate "line", 550
    .return ($P1527)
  control_1518:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, "payload"
    .return ($P1528)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("88_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1532
.annotate "line", 556
    new $P1531, 'ExceptionHandler'
    set_addr $P1531, control_1530
    $P1531."handle_types"(58)
    push_eh $P1531
    .lex "self", self
    .lex "$/", param_1532
.annotate "line", 557
    find_lex $P1533, "$/"
    get_hll_global $P1534, ["PAST"], "Var"
    find_lex $P1535, "$/"
    unless_null $P1535, vivify_453
    new $P1535, "Hash"
  vivify_453:
    set $P1536, $P1535["EXPR"]
    unless_null $P1536, vivify_454
    new $P1536, "Undef"
  vivify_454:
    $P1537 = $P1536."ast"()
    $P1538 = $P1534."new"($P1537, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1539 = $P1533."!make"($P1538)
.annotate "line", 556
    .return ($P1539)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1540, exception, "payload"
    .return ($P1540)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("89_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1544
.annotate "line", 562
    new $P1543, 'ExceptionHandler'
    set_addr $P1543, control_1542
    $P1543."handle_types"(58)
    push_eh $P1543
    .lex "self", self
    .lex "$/", param_1544
.annotate "line", 563
    find_lex $P1545, "$/"
    get_hll_global $P1546, ["PAST"], "Var"
    find_lex $P1547, "$/"
    unless_null $P1547, vivify_455
    new $P1547, "Hash"
  vivify_455:
    set $P1548, $P1547["quote_EXPR"]
    unless_null $P1548, vivify_456
    new $P1548, "Undef"
  vivify_456:
    $P1549 = $P1548."ast"()
    $P1550 = $P1546."new"($P1549, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1551 = $P1545."!make"($P1550)
.annotate "line", 562
    .return ($P1551)
  control_1542:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1552, exception, "payload"
    .return ($P1552)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("90_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1556
.annotate "line", 568
    new $P1555, 'ExceptionHandler'
    set_addr $P1555, control_1554
    $P1555."handle_types"(58)
    push_eh $P1555
    .lex "self", self
    .lex "$/", param_1556
.annotate "line", 569
    find_lex $P1557, "$/"
    find_lex $P1558, "$/"
    unless_null $P1558, vivify_457
    new $P1558, "Hash"
  vivify_457:
    set $P1559, $P1558["arglist"]
    unless_null $P1559, vivify_458
    new $P1559, "Undef"
  vivify_458:
    $P1560 = $P1559."ast"()
    $P1561 = $P1557."!make"($P1560)
.annotate "line", 568
    .return ($P1561)
  control_1554:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1562, exception, "payload"
    .return ($P1562)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("91_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1566
.annotate "line", 572
    new $P1565, 'ExceptionHandler'
    set_addr $P1565, control_1564
    $P1565."handle_types"(58)
    push_eh $P1565
    .lex "self", self
    .lex "$/", param_1566
.annotate "line", 573
    new $P1567, "Undef"
    .lex "$past", $P1567
.annotate "line", 574
    find_lex $P1570, "$/"
    unless_null $P1570, vivify_459
    new $P1570, "Hash"
  vivify_459:
    set $P1571, $P1570["quote"]
    unless_null $P1571, vivify_460
    new $P1571, "Undef"
  vivify_460:
    if $P1571, if_1569
.annotate "line", 575
    get_hll_global $P1575, ["PAST"], "Val"
.annotate "line", 577
    find_lex $P1578, "$/"
    unless_null $P1578, vivify_461
    new $P1578, "Hash"
  vivify_461:
    set $P1579, $P1578["dec_number"]
    unless_null $P1579, vivify_462
    new $P1579, "Undef"
  vivify_462:
    if $P1579, if_1577
.annotate "line", 578
    find_lex $P1583, "$/"
    unless_null $P1583, vivify_463
    new $P1583, "Hash"
  vivify_463:
    set $P1584, $P1583["integer"]
    unless_null $P1584, vivify_464
    new $P1584, "Undef"
  vivify_464:
    $P1585 = $P1584."ast"()
    set $P1576, $P1585
.annotate "line", 577
    goto if_1577_end
  if_1577:
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_465
    new $P1580, "Hash"
  vivify_465:
    set $P1581, $P1580["dec_number"]
    unless_null $P1581, vivify_466
    new $P1581, "Undef"
  vivify_466:
    $P1582 = $P1581."ast"()
    set $P1576, $P1582
  if_1577_end:
    $P1586 = $P1575."new"($P1576 :named("value"))
.annotate "line", 575
    set $P1568, $P1586
.annotate "line", 574
    goto if_1569_end
  if_1569:
    find_lex $P1572, "$/"
    unless_null $P1572, vivify_467
    new $P1572, "Hash"
  vivify_467:
    set $P1573, $P1572["quote"]
    unless_null $P1573, vivify_468
    new $P1573, "Undef"
  vivify_468:
    $P1574 = $P1573."ast"()
    set $P1568, $P1574
  if_1569_end:
    store_lex "$past", $P1568
.annotate "line", 580
    find_lex $P1587, "$/"
    find_lex $P1588, "$past"
    $P1589 = $P1587."!make"($P1588)
.annotate "line", 572
    .return ($P1589)
  control_1564:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1590, exception, "payload"
    .return ($P1590)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("92_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1594
.annotate "line", 583
    new $P1593, 'ExceptionHandler'
    set_addr $P1593, control_1592
    $P1593."handle_types"(58)
    push_eh $P1593
    .lex "self", self
    .lex "$/", param_1594
    find_lex $P1595, "$/"
    find_lex $P1596, "$/"
    unless_null $P1596, vivify_469
    new $P1596, "Hash"
  vivify_469:
    set $P1597, $P1596["quote_EXPR"]
    unless_null $P1597, vivify_470
    new $P1597, "Undef"
  vivify_470:
    $P1598 = $P1597."ast"()
    $P1599 = $P1595."!make"($P1598)
    .return ($P1599)
  control_1592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1600, exception, "payload"
    .return ($P1600)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("93_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1604
.annotate "line", 584
    new $P1603, 'ExceptionHandler'
    set_addr $P1603, control_1602
    $P1603."handle_types"(58)
    push_eh $P1603
    .lex "self", self
    .lex "$/", param_1604
    find_lex $P1605, "$/"
    find_lex $P1606, "$/"
    unless_null $P1606, vivify_471
    new $P1606, "Hash"
  vivify_471:
    set $P1607, $P1606["quote_EXPR"]
    unless_null $P1607, vivify_472
    new $P1607, "Undef"
  vivify_472:
    $P1608 = $P1607."ast"()
    $P1609 = $P1605."!make"($P1608)
    .return ($P1609)
  control_1602:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1610, exception, "payload"
    .return ($P1610)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("94_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1614
.annotate "line", 585
    new $P1613, 'ExceptionHandler'
    set_addr $P1613, control_1612
    $P1613."handle_types"(58)
    push_eh $P1613
    .lex "self", self
    .lex "$/", param_1614
    find_lex $P1615, "$/"
    find_lex $P1616, "$/"
    unless_null $P1616, vivify_473
    new $P1616, "Hash"
  vivify_473:
    set $P1617, $P1616["quote_EXPR"]
    unless_null $P1617, vivify_474
    new $P1617, "Undef"
  vivify_474:
    $P1618 = $P1617."ast"()
    $P1619 = $P1615."!make"($P1618)
    .return ($P1619)
  control_1612:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1620, exception, "payload"
    .return ($P1620)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("95_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1624
.annotate "line", 586
    new $P1623, 'ExceptionHandler'
    set_addr $P1623, control_1622
    $P1623."handle_types"(58)
    push_eh $P1623
    .lex "self", self
    .lex "$/", param_1624
    find_lex $P1625, "$/"
    find_lex $P1626, "$/"
    unless_null $P1626, vivify_475
    new $P1626, "Hash"
  vivify_475:
    set $P1627, $P1626["quote_EXPR"]
    unless_null $P1627, vivify_476
    new $P1627, "Undef"
  vivify_476:
    $P1628 = $P1627."ast"()
    $P1629 = $P1625."!make"($P1628)
    .return ($P1629)
  control_1622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1630, exception, "payload"
    .return ($P1630)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("96_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1634
.annotate "line", 587
    new $P1633, 'ExceptionHandler'
    set_addr $P1633, control_1632
    $P1633."handle_types"(58)
    push_eh $P1633
    .lex "self", self
    .lex "$/", param_1634
    find_lex $P1635, "$/"
    find_lex $P1636, "$/"
    unless_null $P1636, vivify_477
    new $P1636, "Hash"
  vivify_477:
    set $P1637, $P1636["quote_EXPR"]
    unless_null $P1637, vivify_478
    new $P1637, "Undef"
  vivify_478:
    $P1638 = $P1637."ast"()
    $P1639 = $P1635."!make"($P1638)
    .return ($P1639)
  control_1632:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1640, exception, "payload"
    .return ($P1640)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("97_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1644
.annotate "line", 588
    new $P1643, 'ExceptionHandler'
    set_addr $P1643, control_1642
    $P1643."handle_types"(58)
    push_eh $P1643
    .lex "self", self
    .lex "$/", param_1644
.annotate "line", 589
    find_lex $P1645, "$/"
    get_hll_global $P1646, ["PAST"], "Op"
    find_lex $P1647, "$/"
    unless_null $P1647, vivify_479
    new $P1647, "Hash"
  vivify_479:
    set $P1648, $P1647["quote_EXPR"]
    unless_null $P1648, vivify_480
    new $P1648, "Undef"
  vivify_480:
    $P1649 = $P1648."ast"()
    $P1650 = $P1649."value"()
    find_lex $P1651, "$/"
    $P1652 = $P1646."new"($P1650 :named("inline"), "inline" :named("pasttype"), $P1651 :named("node"))
    $P1653 = $P1645."!make"($P1652)
.annotate "line", 588
    .return ($P1653)
  control_1642:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1654, exception, "payload"
    .return ($P1654)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("98_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1658
.annotate "line", 594
    new $P1657, 'ExceptionHandler'
    set_addr $P1657, control_1656
    $P1657."handle_types"(58)
    push_eh $P1657
    .lex "self", self
    .lex "$/", param_1658
    find_lex $P1659, "$/"
    find_lex $P1660, "$/"
    unless_null $P1660, vivify_481
    new $P1660, "Hash"
  vivify_481:
    set $P1661, $P1660["variable"]
    unless_null $P1661, vivify_482
    new $P1661, "Undef"
  vivify_482:
    $P1662 = $P1661."ast"()
    $P1663 = $P1659."!make"($P1662)
    .return ($P1663)
  control_1656:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1664, exception, "payload"
    .return ($P1664)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("99_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1668
.annotate "line", 595
    new $P1667, 'ExceptionHandler'
    set_addr $P1667, control_1666
    $P1667."handle_types"(58)
    push_eh $P1667
    .lex "self", self
    .lex "$/", param_1668
.annotate "line", 596
    find_lex $P1669, "$/"
    get_hll_global $P1670, ["PAST"], "Op"
.annotate "line", 597
    find_lex $P1671, "$/"
    unless_null $P1671, vivify_483
    new $P1671, "Hash"
  vivify_483:
    set $P1672, $P1671["block"]
    unless_null $P1672, vivify_484
    new $P1672, "Undef"
  vivify_484:
    $P1673 = $P1672."ast"()
    $P1674 = "block_immediate"($P1673)
    find_lex $P1675, "$/"
    $P1676 = $P1670."new"($P1674, "set S*" :named("pirop"), $P1675 :named("node"))
.annotate "line", 596
    $P1677 = $P1669."!make"($P1676)
.annotate "line", 595
    .return ($P1677)
  control_1666:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1678, exception, "payload"
    .return ($P1678)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "nulltermish"  :subid("100_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1682
.annotate "line", 603
    new $P1681, 'ExceptionHandler'
    set_addr $P1681, control_1680
    $P1681."handle_types"(58)
    push_eh $P1681
    .lex "self", self
    .lex "$/", param_1682
.annotate "line", 604
    find_lex $P1683, "$/"
    find_lex $P1686, "$/"
    unless_null $P1686, vivify_485
    new $P1686, "Hash"
  vivify_485:
    set $P1687, $P1686["term"]
    unless_null $P1687, vivify_486
    new $P1687, "Undef"
  vivify_486:
    if $P1687, if_1685
    new $P1691, "Integer"
    assign $P1691, 0
    set $P1684, $P1691
    goto if_1685_end
  if_1685:
    find_lex $P1688, "$/"
    unless_null $P1688, vivify_487
    new $P1688, "Hash"
  vivify_487:
    set $P1689, $P1688["term"]
    unless_null $P1689, vivify_488
    new $P1689, "Undef"
  vivify_488:
    $P1690 = $P1689."ast"()
    set $P1684, $P1690
  if_1685_end:
    $P1692 = $P1683."!make"($P1684)
.annotate "line", 603
    .return ($P1692)
  control_1680:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1693, exception, "payload"
    .return ($P1693)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("101_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1697
.annotate "line", 607
    new $P1696, 'ExceptionHandler'
    set_addr $P1696, control_1695
    $P1696."handle_types"(58)
    push_eh $P1696
    .lex "self", self
    .lex "$/", param_1697
    find_lex $P1698, "$/"
    find_lex $P1699, "$/"
    unless_null $P1699, vivify_489
    new $P1699, "Hash"
  vivify_489:
    set $P1700, $P1699["dotty"]
    unless_null $P1700, vivify_490
    new $P1700, "Undef"
  vivify_490:
    $P1701 = $P1700."ast"()
    $P1702 = $P1698."!make"($P1701)
    .return ($P1702)
  control_1695:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1703, exception, "payload"
    .return ($P1703)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("102_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1707
.annotate "line", 609
    new $P1706, 'ExceptionHandler'
    set_addr $P1706, control_1705
    $P1706."handle_types"(58)
    push_eh $P1706
    .lex "self", self
    .lex "$/", param_1707
.annotate "line", 610
    find_lex $P1708, "$/"
    get_hll_global $P1709, ["PAST"], "Op"
.annotate "line", 611
    new $P1710, "ResizablePMCArray"
    push $P1710, "    clone %r, %0"
    push $P1710, "    inc %0"
    $P1711 = $P1709."new"("postfix:<++>" :named("name"), $P1710 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 610
    $P1712 = $P1708."!make"($P1711)
.annotate "line", 609
    .return ($P1712)
  control_1705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1713, exception, "payload"
    .return ($P1713)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("103_1258055906.54293") :method :outer("11_1258055906.54293")
    .param pmc param_1717
.annotate "line", 615
    new $P1716, 'ExceptionHandler'
    set_addr $P1716, control_1715
    $P1716."handle_types"(58)
    push_eh $P1716
    .lex "self", self
    .lex "$/", param_1717
.annotate "line", 616
    find_lex $P1718, "$/"
    get_hll_global $P1719, ["PAST"], "Op"
.annotate "line", 617
    new $P1720, "ResizablePMCArray"
    push $P1720, "    clone %r, %0"
    push $P1720, "    dec %0"
    $P1721 = $P1719."new"("postfix:<-->" :named("name"), $P1720 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 616
    $P1722 = $P1718."!make"($P1721)
.annotate "line", 615
    .return ($P1722)
  control_1715:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1723, exception, "payload"
    .return ($P1723)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1724"  :subid("104_1258055906.54293") :outer("11_1258055906.54293")
.annotate "line", 622
    .const 'Sub' $P1760 = "108_1258055906.54293" 
    capture_lex $P1760
    .const 'Sub' $P1750 = "107_1258055906.54293" 
    capture_lex $P1750
    .const 'Sub' $P1740 = "106_1258055906.54293" 
    capture_lex $P1740
    .const 'Sub' $P1726 = "105_1258055906.54293" 
    capture_lex $P1726
.annotate "line", 633
    .const 'Sub' $P1760 = "108_1258055906.54293" 
    capture_lex $P1760
.annotate "line", 622
    .return ($P1760)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("105_1258055906.54293") :method :outer("104_1258055906.54293")
    .param pmc param_1729
.annotate "line", 624
    new $P1728, 'ExceptionHandler'
    set_addr $P1728, control_1727
    $P1728."handle_types"(58)
    push_eh $P1728
    .lex "self", self
    .lex "$/", param_1729
.annotate "line", 625
    new $P1730, "Undef"
    .lex "$past", $P1730
    find_lex $P1731, "$/"
    unless_null $P1731, vivify_491
    new $P1731, "Hash"
  vivify_491:
    set $P1732, $P1731["statement"]
    unless_null $P1732, vivify_492
    new $P1732, "Undef"
  vivify_492:
    $P1733 = $P1732."ast"()
    store_lex "$past", $P1733
.annotate "line", 626
    find_lex $P1734, "$/"
    get_hll_global $P1735, ["PAST"], "Regex"
    find_lex $P1736, "$past"
    $P1737 = $P1735."new"($P1736, "pastnode" :named("pasttype"))
    $P1738 = $P1734."!make"($P1737)
.annotate "line", 624
    .return ($P1738)
  control_1727:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1739, exception, "payload"
    .return ($P1739)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("106_1258055906.54293") :method :outer("104_1258055906.54293")
    .param pmc param_1743
.annotate "line", 629
    new $P1742, 'ExceptionHandler'
    set_addr $P1742, control_1741
    $P1742."handle_types"(58)
    push_eh $P1742
    .lex "self", self
    .lex "$/", param_1743
    find_lex $P1744, "$/"
    find_lex $P1745, "$/"
    unless_null $P1745, vivify_493
    new $P1745, "Hash"
  vivify_493:
    set $P1746, $P1745["codeblock"]
    unless_null $P1746, vivify_494
    new $P1746, "Undef"
  vivify_494:
    $P1747 = $P1746."ast"()
    $P1748 = $P1744."!make"($P1747)
    .return ($P1748)
  control_1741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1749, exception, "payload"
    .return ($P1749)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("107_1258055906.54293") :method :outer("104_1258055906.54293")
    .param pmc param_1753
.annotate "line", 631
    new $P1752, 'ExceptionHandler'
    set_addr $P1752, control_1751
    $P1752."handle_types"(58)
    push_eh $P1752
    .lex "self", self
    .lex "$/", param_1753
    find_lex $P1754, "$/"
    find_lex $P1755, "$/"
    unless_null $P1755, vivify_495
    new $P1755, "Hash"
  vivify_495:
    set $P1756, $P1755["codeblock"]
    unless_null $P1756, vivify_496
    new $P1756, "Undef"
  vivify_496:
    $P1757 = $P1756."ast"()
    $P1758 = $P1754."!make"($P1757)
    .return ($P1758)
  control_1751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1759, exception, "payload"
    .return ($P1759)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("108_1258055906.54293") :method :outer("104_1258055906.54293")
    .param pmc param_1763
.annotate "line", 633
    new $P1762, 'ExceptionHandler'
    set_addr $P1762, control_1761
    $P1762."handle_types"(58)
    push_eh $P1762
    .lex "self", self
    .lex "$/", param_1763
.annotate "line", 634
    new $P1764, "Undef"
    .lex "$block", $P1764
.annotate "line", 636
    new $P1765, "Undef"
    .lex "$past", $P1765
.annotate "line", 634
    find_lex $P1766, "$/"
    unless_null $P1766, vivify_497
    new $P1766, "Hash"
  vivify_497:
    set $P1767, $P1766["block"]
    unless_null $P1767, vivify_498
    new $P1767, "Undef"
  vivify_498:
    $P1768 = $P1767."ast"()
    store_lex "$block", $P1768
.annotate "line", 635
    find_lex $P1769, "$block"
    $P1769."blocktype"("immediate")
.annotate "line", 637
    get_hll_global $P1770, ["PAST"], "Regex"
.annotate "line", 638
    get_hll_global $P1771, ["PAST"], "Stmts"
.annotate "line", 639
    get_hll_global $P1772, ["PAST"], "Op"
.annotate "line", 640
    get_hll_global $P1773, ["PAST"], "Var"
    $P1774 = $P1773."new"("$/" :named("name"))
.annotate "line", 641
    get_hll_global $P1775, ["PAST"], "Op"
.annotate "line", 642
    get_hll_global $P1776, ["PAST"], "Var"
    $P1777 = $P1776."new"(unicode:"$\x{a2}" :named("name"))
    $P1778 = $P1775."new"($P1777, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 641
    $P1779 = $P1772."new"($P1774, $P1778, "bind" :named("pasttype"))
.annotate "line", 639
    find_lex $P1780, "$block"
    $P1781 = $P1771."new"($P1779, $P1780)
.annotate "line", 638
    $P1782 = $P1770."new"($P1781, "pastnode" :named("pasttype"))
.annotate "line", 637
    store_lex "$past", $P1782
.annotate "line", 652
    find_lex $P1783, "$/"
    find_lex $P1784, "$past"
    $P1785 = $P1783."!make"($P1784)
.annotate "line", 633
    .return ($P1785)
  control_1761:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1786, exception, "payload"
    .return ($P1786)
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


.namespace ['NQP';'Grammar']

.sub 'ternary' :method
    .param pmc match
    $P0 = match[1]
    $P1 = match['infix']
    $P1 = $P1['EXPR']
    match[1] = $P1
    match[2] = $P0
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



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
